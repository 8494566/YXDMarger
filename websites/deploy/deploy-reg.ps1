$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.Data
Import-Module WebAdministration

$AppDir   = 'C:\RegApp'
$SiteName = 'Default Web Site'
$AppName  = 'register'
$PoolName = 'RegApp'
$SqlLogin = 'IIS APPPOOL\RegApp'

Write-Output "===== 1. files ====="
New-Item -ItemType Directory -Path $AppDir -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $AppDir 'logs') -Force | Out-Null
if (Test-Path (Join-Path $AppDir 'src\Default.aspx')) {
  Move-Item (Join-Path $AppDir 'src\Default.aspx') (Join-Path $AppDir 'Default.aspx') -Force
}
# 源文件加 UTF-8 BOM，保证 ASP.NET 按 UTF-8 解析中文
foreach ($f in @('Default.aspx','captcha.ashx')) {
  $p = Join-Path $AppDir $f
  $bytes = [System.IO.File]::ReadAllBytes($p)
  if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
    Write-Output ("{0}: BOM already present" -f $f)
  } else {
    $bom = [byte[]](0xEF,0xBB,0xBF)
    [System.IO.File]::WriteAllBytes($p, ($bom + $bytes))
    Write-Output ("{0}: BOM added ({1} bytes)" -f $f, $bytes.Length)
  }
}

Write-Output "===== 2. app pool ====="
if (-not (Test-Path ("IIS:\AppPools\" + $PoolName))) { New-WebAppPool -Name $PoolName | Out-Null }
Set-ItemProperty ("IIS:\AppPools\" + $PoolName) -Name managedRuntimeVersion -Value 'v4.0'
Set-ItemProperty ("IIS:\AppPools\" + $PoolName) -Name managedPipelineMode -Value 'Integrated'
Set-ItemProperty ("IIS:\AppPools\" + $PoolName) -Name processModel.identityType -Value 'ApplicationPoolIdentity'
Set-ItemProperty ("IIS:\AppPools\" + $PoolName) -Name startMode -Value 'AlwaysRunning'
Write-Output ("pool {0} ok" -f $PoolName)

Write-Output "===== 3. iis application ====="
$existing = Get-WebApplication -Site $SiteName -Name $AppName -ErrorAction SilentlyContinue
if ($existing) { Remove-WebApplication -Site $SiteName -Name $AppName | Out-Null }
New-WebApplication -Site $SiteName -Name $AppName -PhysicalPath $AppDir -ApplicationPool $PoolName | Out-Null
Get-WebApplication -Site $SiteName -Name $AppName | Select-Object Path,PhysicalPath,ApplicationPool | Format-Table -AutoSize | Out-String | Write-Output

Write-Output "===== 4. acl ====="
$acl = Get-Acl $AppDir
$r = New-Object System.Security.AccessControl.FileSystemAccessRule('IIS AppPool\RegApp','ReadAndExecute','ContainerInherit,ObjectInherit','None','Allow')
$acl.AddAccessRule($r)
Set-Acl -Path $AppDir -AclObject $acl
$acl2 = Get-Acl (Join-Path $AppDir 'logs')
$r2 = New-Object System.Security.AccessControl.FileSystemAccessRule('IIS AppPool\RegApp','Modify','ContainerInherit,ObjectInherit','None','Allow')
$acl2.AddAccessRule($r2)
Set-Acl -Path (Join-Path $AppDir 'logs') -AclObject $acl2
Write-Output "acl ok"

Write-Output "===== 5. sql login / user / grants ====="
$cn = New-Object System.Data.SqlClient.SqlConnection('Data Source=127.0.0.1,1433;Initial Catalog=master;Integrated Security=SSPI;Connect Timeout=15;Application Name=RegDeploy;')
$cn.Open()
function ExecSql([string]$db,[string]$sql) {
  $c = $cn.CreateCommand(); $c.CommandText = $sql; $c.CommandTimeout = 30
  [void]$c.ExecuteNonQuery()
}
ExecSql 'master' "IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = N'$SqlLogin') CREATE LOGIN [$SqlLogin] FROM WINDOWS;"
Write-Output "server login ok"

$sql2 = "USE [GameDBArea];" +
        "IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'$SqlLogin') CREATE USER [$SqlLogin] FOR LOGIN [$SqlLogin];" +
        "GRANT SELECT ON dbo.[account] TO [$SqlLogin];" +
        "GRANT INSERT ON dbo.[account] TO [$SqlLogin];"
ExecSql 'master' $sql2
Write-Output "db user + grants ok"

Write-Output "--- effective permissions ---"
$c3 = $cn.CreateCommand()
$c3.CommandText = "SELECT dp.name, dp.type_desc, p.permission_name, p.state_desc, OBJECT_NAME(p.major_id) AS obj FROM [GameDBArea].sys.database_permissions p JOIN [GameDBArea].sys.database_principals dp ON dp.principal_id = p.grantee_principal_id WHERE dp.name = N'" + $SqlLogin + "';"
$rd = $c3.ExecuteReader()
while ($rd.Read()) { Write-Output ("  {0} | {1} | {2} | {3}" -f $rd[0], $rd[2], $rd[3], $rd[4]) }
$rd.Close()
$cn.Close()

Write-Output "===== 6. web.config ====="
$wc = @'
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <connectionStrings>
    <!-- 用 Windows 集成认证连本机 SQL Server，配置文件里不保存任何数据库密码 -->
    <add name="GameDBArea"
         connectionString="Data Source=127.0.0.1,1433;Initial Catalog=GameDBArea;Integrated Security=SSPI;Application Name=RegWeb;Connect Timeout=10;Pooling=true;Max Pool Size=50;"
         providerName="System.Data.SqlClient" />
  </connectionStrings>
  <appSettings>
    <!-- 注册写入的表 -->
    <add key="RegisterTable" value="GameDBArea.dbo.account" />
    <!-- 验证码模式：image 图形验证码（默认） / off 关闭 -->
    <add key="CaptchaMode" value="image" />
  </appSettings>
  <system.web>
    <compilation targetFramework="4.5" />
    <httpRuntime targetFramework="4.5" enableVersionHeader="false" maxRequestLength="16" />
    <globalization requestEncoding="utf-8" responseEncoding="utf-8" fileEncoding="utf-8" culture="zh-CN" uiCulture="zh-CN" />
    <customErrors mode="RemoteOnly" />
    <sessionState mode="InProc" timeout="10" cookieless="UseCookies" />
    <pages enableViewState="false" />
    <httpCookies httpOnlyCookies="true" />
  </system.web>
  <system.webServer>
    <defaultDocument>
      <files>
        <clear />
        <add value="Default.aspx" />
      </files>
    </defaultDocument>
    <directoryBrowse enabled="false" />
    <httpErrors errorMode="DetailedLocalOnly" />
    <security>
      <requestFiltering>
        <requestLimits maxAllowedContentLength="1048576" />
      </requestFiltering>
    </security>
  </system.webServer>
</configuration>
'@
Set-Content -Path (Join-Path $AppDir 'web.config') -Value $wc -Encoding UTF8
Write-Output "web.config written"

Write-Output "===== 7. restart pool ====="
Restart-WebAppPool -Name $PoolName
Start-Sleep -Seconds 2
Get-WebAppPoolState -Name $PoolName | Select-Object Name,Value | Format-Table -AutoSize | Out-String | Write-Output
Write-Output "DONE"
