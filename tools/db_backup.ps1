# =============================================================================
#  db_backup.ps1  --  daily full backup of the test-server databases
#  SQL Server Express has no Agent, so Task Scheduler drives sqlcmd.
#  Keeps 14 days in D:\Backup\<yyyyMMdd>\.
# =============================================================================
$ErrorActionPreference = 'Stop'

# ---- config -----------------------------------------------------------------
$SqlCmd     = 'C:\Program Files\Microsoft SQL Server\110\Tools\Binn\SQLCMD.EXE'
$Server     = '.\SQLEXPRESS'
$Databases  = @('GameDB','GameDB_Log','GameDBArea','UserCenter','UserActive','PayCenter')
$BackupRoot = 'D:\Backup'
$KeepDays   = 14
$LogFile    = 'D:\Backup\db_backup.log'
# ----------------------------------------------------------------------------

if (-not (Test-Path $BackupRoot)) { New-Item -ItemType Directory -Force -Path $BackupRoot | Out-Null }
if (-not (Test-Path $LogFile))    { New-Item -ItemType File -Force -Path $LogFile | Out-Null }

function Log($m) {
    $line = '[{0}] {1}' -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $m
    Add-Content -LiteralPath $LogFile -Value $line
    Write-Host $line
}

$day = Get-Date -Format 'yyyyMMdd'
$dir = Join-Path $BackupRoot $day
New-Item -ItemType Directory -Force -Path $dir | Out-Null

foreach ($db in $Databases) {
    $file = Join-Path $dir ($db + '.bak')
    Log ("backup $db -> $file")
    # 注意：SQL Server 2012 Express 不支持备份压缩，不能加 WITH COMPRESSION
    & $SqlCmd -S $Server -E -b -Q "BACKUP DATABASE [$db] TO DISK = N'$file' WITH INIT, STATS = 25" | Out-Null
    if ($LASTEXITCODE -ne 0) { Log ("!! backup FAILED: $db (exit $LASTEXITCODE)") }
}

$limit = (Get-Date).AddDays(-$KeepDays)
Get-ChildItem -LiteralPath $BackupRoot -Directory -ErrorAction SilentlyContinue | Where-Object {
    $_.Name -match '^\d{8}$' -and $_.CreationTime -lt $limit
} | ForEach-Object {
    Log ("cleanup " + $_.FullName)
    Remove-Item -LiteralPath $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
}

Log 'db backup done'
