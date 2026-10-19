$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.Data
Import-Module WebAdministration

$AppDir   = 'C:\PayApp'
$SiteName = 'Default Web Site'
$AppName  = 'pay'
$PoolName = 'PayApp'
$SqlLogin = 'IIS APPPOOL\PayApp'

Write-Output "===== 1. dirs + BOM ====="
foreach ($d in @($AppDir, (Join-Path $AppDir 'App_Data'), (Join-Path $AppDir 'logs'), (Join-Path $AppDir 'qr'), (Join-Path $AppDir 'tools'))) {
  New-Item -ItemType Directory -Path $d -Force | Out-Null
}
$bomFiles = @()
$bomFiles += Get-ChildItem $AppDir -Filter '*.aspx' -File
$bomFiles += Get-ChildItem $AppDir -Filter '*.js' -File
$bomFiles += Get-ChildItem (Join-Path $AppDir 'App_Code') -Filter '*.cs' -File -ErrorAction SilentlyContinue
$bomFiles += Get-ChildItem (Join-Path $AppDir 'tools') -Filter '*.ps1' -File -ErrorAction SilentlyContinue
foreach ($f in $bomFiles) {
  $b = [System.IO.File]::ReadAllBytes($f.FullName)
  if ($b.Length -ge 3 -and $b[0] -eq 0xEF -and $b[1] -eq 0xBB -and $b[2] -eq 0xBF) {
    Write-Output ("  BOM present: {0}" -f $f.Name)
  } else {
    [System.IO.File]::WriteAllBytes($f.FullName, ([byte[]](0xEF,0xBB,0xBF) + $b))
    Write-Output ("  BOM added:   {0}" -f $f.Name)
  }
}

Write-Output "===== 2. app pool ====="
if (-not (Test-Path ("IIS:\AppPools\" + $PoolName))) { New-WebAppPool -Name $PoolName | Out-Null }
Set-ItemProperty ("IIS:\AppPools\" + $PoolName) -Name managedRuntimeVersion -Value 'v4.0'
Set-ItemProperty ("IIS:\AppPools\" + $PoolName) -Name managedPipelineMode -Value 'Integrated'
Set-ItemProperty ("IIS:\AppPools\" + $PoolName) -Name processModel.identityType -Value 'ApplicationPoolIdentity'
Write-Output ("pool {0} ok" -f $PoolName)

Write-Output "===== 3. iis application /pay ====="
$existing = Get-WebApplication -Site $SiteName -Name $AppName -ErrorAction SilentlyContinue
if ($existing) { Remove-WebApplication -Site $SiteName -Name $AppName | Out-Null }
New-WebApplication -Site $SiteName -Name $AppName -PhysicalPath $AppDir -ApplicationPool $PoolName | Out-Null
Get-WebApplication -Site $SiteName -Name $AppName | Select-Object Path,PhysicalPath,ApplicationPool | Format-Table -AutoSize | Out-String | Write-Output

Write-Output "===== 4. acl ====="
$acl = Get-Acl $AppDir
$r = New-Object System.Security.AccessControl.FileSystemAccessRule('IIS AppPool\PayApp','ReadAndExecute','ContainerInherit,ObjectInherit','None','Allow')
$acl.AddAccessRule($r); Set-Acl -Path $AppDir -AclObject $acl
foreach ($sub in @('App_Data','logs')) {
  $p = Join-Path $AppDir $sub
  $a = Get-Acl $p
  $rr = New-Object System.Security.AccessControl.FileSystemAccessRule('IIS AppPool\PayApp','Modify','ContainerInherit,ObjectInherit','None','Allow')
  $a.AddAccessRule($rr); Set-Acl -Path $p -AclObject $a
}
Write-Output "acl ok"

Write-Output "===== 5. sql: login + order table + grants ====="
$cn = New-Object System.Data.SqlClient.SqlConnection('Data Source=127.0.0.1,1433;Initial Catalog=master;Integrated Security=SSPI;Connect Timeout=15;Application Name=PayDeploy;')
$cn.Open()
function ExecSql([string]$sql) {
  $c = $cn.CreateCommand(); $c.CommandText = $sql; $c.CommandTimeout = 60
  [void]$c.ExecuteNonQuery()
}

ExecSql "IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = N'$SqlLogin') CREATE LOGIN [$SqlLogin] FROM WINDOWS;"
Write-Output "server login ok"

$ddl = @"
USE [PayCenter];
IF OBJECT_ID('dbo.WebRechargeOrder') IS NULL
BEGIN
  CREATE TABLE dbo.WebRechargeOrder (
    OrderNo     varchar(32)   NOT NULL CONSTRAINT PK_WebRechargeOrder PRIMARY KEY,
    UserID      int           NOT NULL,
    ActorID     int           NOT NULL,
    ActorName   varchar(18)   NOT NULL,
    Currency    tinyint       NOT NULL,
    AmountYuan  decimal(10,2) NOT NULL,
    GrantAmount bigint        NOT NULL,
    Status      tinyint       NOT NULL,
    PayTradeNo  nvarchar(64)  NULL,
    CreateIp    varchar(16)   NOT NULL,
    CreateTime  datetime      NOT NULL CONSTRAINT DF_WRO_CreateTime DEFAULT (GETDATE()),
    PaidTime    datetime      NULL,
    GrantTime   datetime      NULL,
    GrantResult nvarchar(256) NULL
  );
  CREATE INDEX IX_WRO_Status ON dbo.WebRechargeOrder (Status, CreateTime DESC);
  CREATE INDEX IX_WRO_Actor  ON dbo.WebRechargeOrder (ActorName);
END
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'$SqlLogin') CREATE USER [$SqlLogin] FOR LOGIN [$SqlLogin];
GRANT SELECT, INSERT, UPDATE ON dbo.WebRechargeOrder TO [$SqlLogin];

USE [GameDB];
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'$SqlLogin') CREATE USER [$SqlLogin] FOR LOGIN [$SqlLogin];
GRANT SELECT ON dbo.Actor TO [$SqlLogin];
GRANT EXECUTE ON dbo.PrGs_GameUser_Points_Add TO [$SqlLogin];
GRANT EXECUTE ON dbo.PrGs_GameEmail_Add_V5 TO [$SqlLogin];
"@
ExecSql $ddl
Write-Output "db user + table + grants ok"

Write-Output "--- effective permissions ---"
$c3 = $cn.CreateCommand()
$c3.CommandText = "SELECT 'PayCenter' AS db, p.permission_name, p.state_desc, ISNULL(OBJECT_NAME(p.major_id),'(schema/other)') AS obj FROM [PayCenter].sys.database_permissions p JOIN [PayCenter].sys.database_principals dp ON dp.principal_id=p.grantee_principal_id WHERE dp.name = N'" + $SqlLogin + "' UNION ALL SELECT 'GameDB', p.permission_name, p.state_desc, ISNULL(OBJECT_NAME(p.major_id),'(schema/other)') FROM [GameDB].sys.database_permissions p JOIN [GameDB].sys.database_principals dp ON dp.principal_id=p.grantee_principal_id WHERE dp.name = N'" + $SqlLogin + "';"
$rd = $c3.ExecuteReader()
while ($rd.Read()) { Write-Output ("  {0,-10} {1,-10} {2,-7} {3}" -f $rd[0], $rd[1], $rd[2], $rd[3]) }
$rd.Close()

Write-Output "--- order table columns ---"
$c4 = $cn.CreateCommand()
$c4.CommandText = "SELECT c.column_id, c.name, ty.name, c.max_length FROM [PayCenter].sys.columns c JOIN [PayCenter].sys.types ty ON ty.user_type_id=c.user_type_id WHERE c.object_id = OBJECT_ID('PayCenter.dbo.WebRechargeOrder') ORDER BY c.column_id;"
$rd2 = $c4.ExecuteReader()
while ($rd2.Read()) { Write-Output ("  {0,2} {1,-12} {2,-12} {3}" -f $rd2[0], $rd2[1], $rd2[2], $rd2[3]) }
$rd2.Close()
$cn.Close()

Write-Output "===== 6. restart pool ====="
Restart-WebAppPool -Name $PoolName
Start-Sleep -Seconds 3
Get-WebAppPoolState -Name $PoolName | Select-Object Name,Value | Format-Table -AutoSize | Out-String | Write-Output
Write-Output "DONE"
