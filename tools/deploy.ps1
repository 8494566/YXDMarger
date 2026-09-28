# =============================================================================
#  deploy.ps1  --  pull from GitHub (over SSH, because github.com:443 is blocked
#                 on this host, but github.com:22 works) and sync into live dirs
#
#  Repo layout (single source for the 144 dual-end files -> copied to BOTH ends):
#     shared/scp/        -> D:\YXDServer\server\Server1\Scp  AND  D:\YXDClient\Data\Scp
#     server/lua/        -> D:\YXDServer\server\Server1\Scp\Lua
#     client/extra/      -> D:\YXDClient\Data\Scp
#     publish-static/    -> C:\ShareFiles
#
#  Rules: robocopy /E only (NEVER /MIR -- it would delete the client packages
#         and images that are not stored in git).  scp.txt is regenerated LAST.
# =============================================================================
param(
    [switch]$Restart      # also restart the game server (kicks online players)
)

$ErrorActionPreference = 'Continue'

# ---- config -----------------------------------------------------------------
$RepoUrl = 'git@github.com:8494566/YXDMarger.git'
$Branch  = 'main'
$RepoDir = 'D:\git\work'
$LogFile = 'D:\git\deploy.log'
$SshKey  = 'D:\deploy\ssh\yxd_deploy'
$Known   = 'D:\deploy\ssh\known_hosts'

$SrvScp     = 'D:\YXDServer\server\Server1\Scp'
$CliScp     = 'D:\YXDClient\Data\Scp'
$PubRoot    = 'C:\ShareFiles'
$RestartBat = 'D:\YXDServer\[2]一键启动.bat'
# ----------------------------------------------------------------------------

$env:GIT_SSH_COMMAND = "ssh -i `"$SshKey`" -o UserKnownHostsFile=`"$Known`" -o IdentitiesOnly=yes -o StrictHostKeyChecking=yes"

function Log($m) {
    $line = '[{0}] {1}' -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $m
    Add-Content -LiteralPath $LogFile -Value $line
    Write-Host $line
}

$logDir = Split-Path $LogFile
if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Force -Path $logDir | Out-Null }

# 0) 安全目录（计划任务以 SYSTEM 运行时用）
git config --global --add safe.directory $RepoDir

# 1) fetch / pull
if (-not (Test-Path (Join-Path $RepoDir '.git'))) {
    Log "clone $RepoUrl ($Branch)"
    git clone -b $Branch $RepoUrl $RepoDir
    if ($LASTEXITCODE -ne 0) { Log 'clone failed'; exit 1 }
} else {
    git -C $RepoDir remote set-url origin $RepoUrl
    $fetch = git -C $RepoDir fetch origin $Branch 2>&1
    if ($LASTEXITCODE -ne 0) { Log ("fetch failed: " + ($fetch -join ' ')); exit 1 }
    $local  = (git -C $RepoDir rev-parse HEAD 2>$null)
    $remote = (git -C $RepoDir rev-parse "origin/$Branch" 2>$null)
    if ($local -eq $remote) { exit 0 }
    Log "changes: $local -> $remote"
    git -C $RepoDir reset --hard "origin/$Branch" | Out-Null
}

function Sync($src, $dst, $what) {
    if (-not (Test-Path -LiteralPath $src)) { Log "[skip] repo folder missing: $src"; return }
    if (-not (Test-Path -LiteralPath $dst)) { Log "[skip] live folder missing: $dst"; return }
    robocopy $src $dst /E /NFL /NDL /NJH /NJS /NP /R:2 /W:1 /XD .git /XF *.log | Out-Null
    Log "[sync] $what : $src -> $dst"
}

# 2) sync
Sync "$RepoDir\shared\scp"     $SrvScp  'dual-end -> server'
Sync "$RepoDir\shared\scp"     $CliScp  'dual-end -> client'
Sync "$RepoDir\server\lua"     (Join-Path $SrvScp 'Lua') 'server lua'
Sync "$RepoDir\client\extra"   $CliScp  'client-only'
Sync "$RepoDir\publish-static" $PubRoot 'publish files'

# 3) 重新生成 scp.txt（必须最后做；start.bat 扫的是客户端工程目录）
$startBat = Join-Path $PubRoot 'start.bat'
if (Test-Path -LiteralPath $startBat) {
    Log '[manifest] regenerating scp.txt'
    cmd /c "`"$startBat`" `"$CliScp`"" | Out-Null
} else {
    Log '[manifest] start.bat not found, skipped'
}

# 4) 可选重启
if ($Restart) {
    if (Test-Path -LiteralPath $RestartBat) {
        Log '[restart] running game server start script'
        Start-Process -FilePath 'cmd.exe' -ArgumentList '/c', "`"$RestartBat`""
    } else { Log '[restart] start script not found' }
} else {
    Log '[note] tables need the in-game "browse + update"; Lua needs "script update"'
}

Log 'deploy done'
