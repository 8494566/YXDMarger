# =============================================================================
#  deploy.ps1  --  pull from GitHub (over SSH) -> sync into live folders
#                  -> regenerate the client update manifest
#                  -> auto hot-reload changed server Lua scripts
#
#  Repo layout (single source for the dual-end tables -> copied to BOTH ends):
#     shared/scp/        -> D:\YXDServer\server\Server1\Scp  AND  D:\YXDClient\Data\Scp
#     server/lua/        -> D:\YXDServer\server\Server1\Scp\Lua
#     client/extra/      -> D:\YXDClient\Data\Scp
#     publish-static/    -> C:\ShareFiles
#
#  Rules: robocopy /E only (NEVER /MIR -- it would delete the client packages
#         and images that are not stored in git).  scp.txt is regenerated LAST.
#  NOTE : must run in the same interactive session as GameServer for the Lua
#         hot-reload step to work (i.e. run the task as Administrator/Interactive,
#         not as SYSTEM).
# =============================================================================
param(
    [switch]$Restart,        # restart the game server after syncing
    [switch]$NoHotUpdate     # skip the automatic Lua hot-reload
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
$StopBat    = 'D:\YXDServer\[99]一键停止.bat'
$HotUpdate  = 'D:\deploy\hot_update.ps1'
# ----------------------------------------------------------------------------

$env:GIT_SSH_COMMAND = "ssh -i `"$SshKey`" -o UserKnownHostsFile=`"$Known`" -o IdentitiesOnly=yes -o StrictHostKeyChecking=yes"
$Git = 'C:\Program Files\Git\cmd\git.exe'
if (-not (Test-Path $Git)) { $Git = 'git' }
$env:Path = 'C:\Program Files\Git\cmd;' + $env:Path

function Log($m) {
    $line = '[{0}] {1}' -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $m
    Add-Content -LiteralPath $LogFile -Value $line
    Write-Host $line
}

$logDir = Split-Path $LogFile
if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Force -Path $logDir | Out-Null }
& $Git config --global safe.directory '*' | Out-Null

# ---------------- 1) fetch / pull ----------------
$oldSha = $null
$newSha = $null
if (-not (Test-Path (Join-Path $RepoDir '.git'))) {
    Log "clone $RepoUrl ($Branch)"
    & $Git clone -b $Branch $RepoUrl $RepoDir
    if ($LASTEXITCODE -ne 0) { Log 'clone failed'; exit 1 }
    Log '[note] fresh clone -> no hot-reload (restart the server or reload manually)'
} else {
    & $Git -C $RepoDir remote set-url origin $RepoUrl
    $fetch = & $Git -C $RepoDir fetch origin $Branch 2>&1
    if ($LASTEXITCODE -ne 0) { Log ("fetch failed: " + ($fetch -join ' ')); exit 1 }
    $oldSha = (& $Git -C $RepoDir rev-parse HEAD 2>$null)
    $newSha = (& $Git -C $RepoDir rev-parse "origin/$Branch" 2>$null)
    if ($oldSha -eq $newSha) { exit 0 }
    Log "changes: $oldSha -> $newSha"
    & $Git -C $RepoDir reset --hard "origin/$Branch" | Out-Null
}

# ---------------- 2) which files changed? ----------------
$luaFiles = @()
$tblChanged = @()
if ($oldSha -and $newSha -and ($oldSha -ne $newSha)) {
    $changed = & $Git -C $RepoDir diff --name-only $oldSha $newSha 2>$null
    foreach ($c in $changed) {
        $c = ($c -replace "`r", '').Trim()
        if ($c -like 'server/lua/*') {
            $rel = $c.Substring('server/lua/'.Length).Replace('/', '\')
            $luaFiles += (Join-Path (Join-Path $SrvScp 'Lua') $rel)
        } elseif ($c -like 'shared/scp/*') {
            $tblChanged += $c.Substring('shared/scp/'.Length)
        }
    }
}

function Sync($src, $dst, $what) {
    if (-not (Test-Path -LiteralPath $src)) { Log "[skip] repo folder missing: $src"; return }
    if (-not (Test-Path -LiteralPath $dst)) { Log "[skip] live folder missing: $dst"; return }
    # /XF .gitkeep -- keep git placeholder files out of the live folders
    # (a stray file in the client dir would change scp.txt's bb for nothing)
    robocopy $src $dst /E /NFL /NDL /NJH /NJS /NP /R:2 /W:1 /XD .git /XF *.log .gitkeep | Out-Null
    Log "[sync] $what : $src -> $dst"
}

# ---------------- 3) sync ----------------
Sync "$RepoDir\shared\scp"     $SrvScp  'dual-end -> server'
Sync "$RepoDir\shared\scp"     $CliScp  'dual-end -> client'
Sync "$RepoDir\server\lua"     (Join-Path $SrvScp 'Lua') 'server lua'
Sync "$RepoDir\client\extra"   $CliScp  'client-only'
Sync "$RepoDir\publish-static" $PubRoot 'publish files'

# ---------------- 3.5) ★把客户端工程复制到发布站（客户端从这里下载！）----------------
# 漏了这一步 = 清单已更新但发布站还是旧文件 -> 客户端校验不过 -> 无限断点续传
$PubScp = Join-Path $PubRoot 'scp'
if (Test-Path -LiteralPath $CliScp) {
    robocopy $CliScp $PubScp /E /NFL /NDL /NJH /NJS /NP /R:2 /W:1 /XF scp.txt *.log .gitkeep | Out-Null
    Log "[publish] client scp -> $PubScp"
} else {
    Log '[publish] client scp dir missing, skipped'
}
# 图片：客户端 Data\Res -> 发布站 res（有才拷；拷完要重生成 res.txt）
$CliRes = Join-Path $CliScp '..\Res'
$PubRes = Join-Path $PubRoot 'res'
if ((Test-Path -LiteralPath $CliRes) -and (Test-Path -LiteralPath $PubRes)) {
    $r1 = robocopy $CliRes $PubRes /E /NFL /NDL /NJH /NJS /NP /R:1 /W:1 /XF res.txt *.log
    $rc1 = $LASTEXITCODE
    if ($rc1 -ge 8) { Log ("[publish] res copy FAILED rc=$rc1") }
    elseif ($rc1 -gt 1) {
        Log '[publish] res changed -> regenerating res.txt'
        $resBat = Join-Path $PubRoot 'start_res.bat'
        if (Test-Path -LiteralPath $resBat) {
            $ps2 = New-Object System.Diagnostics.ProcessStartInfo
            $ps2.FileName = 'cmd.exe'
            $ps2.Arguments = '/c ""' + $resBat + '""'
            $ps2.UseShellExecute = $false
            $ps2.RedirectStandardInput = $true
            $ps2.RedirectStandardOutput = $true
            $ps2.CreateNoWindow = $true
            try {
                $p2 = [System.Diagnostics.Process]::Start($ps2)
                $p2.StandardInput.WriteLine('')
                $p2.StandardInput.Close()
                if (-not $p2.WaitForExit(180000)) { try { $p2.Kill() } catch {} ; Log '[publish] res.txt TIMEOUT' }
                else { Log ('[publish] res.txt exit=' + $p2.ExitCode) }
            } catch { Log ('[publish] res.txt failed: ' + $_.Exception.Message) }
        }
    } else {
        Log '[publish] res unchanged'
    }
}

# ---------------- 4) regenerate scp.txt (LAST; start.bat scans the client dir) ----------
$startBat = Join-Path $PubRoot 'start.bat'
if (Test-Path -LiteralPath $startBat) {
    Log '[manifest] regenerating scp.txt'
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = 'cmd.exe'
    # cmd /c quoting: the whole command needs one extra layer of quotes
    $psi.Arguments = '/c ""' + $startBat + '" "' + $CliScp + '""'
    $psi.UseShellExecute = $false
    $psi.RedirectStandardInput = $true
    $psi.RedirectStandardOutput = $true
    $psi.CreateNoWindow = $true
    try {
        $proc = [System.Diagnostics.Process]::Start($psi)
        $proc.StandardInput.WriteLine('')     # feed start.bat's trailing "pause"
        $proc.StandardInput.Close()
        if (-not $proc.WaitForExit(180000)) {
            try { $proc.Kill() } catch {}
            Log '[manifest] start.bat TIMEOUT (>180s) -> killed'
        } else {
            Log ('[manifest] start.bat exit=' + $proc.ExitCode)
        }
    } catch { Log ('[manifest] start.bat failed: ' + $_.Exception.Message) }
} else {
    Log '[manifest] start.bat not found, skipped'
}

# ---------------- 5) auto hot-reload changed Lua ----------------
if ($luaFiles.Count -gt 0) {
    if ($NoHotUpdate) {
        Log ('[hotupdate] skipped (-NoHotUpdate); changed: ' + ($luaFiles -join ', '))
    } elseif (-not (Test-Path -LiteralPath $HotUpdate)) {
        Log ('[hotupdate] tool missing: ' + $HotUpdate)
    } else {
        Log ('[hotupdate] reloading ' + $luaFiles.Count + ' lua file(s)')
        $out = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $HotUpdate @luaFiles 2>&1
        foreach ($o in $out) { Log ('[hotupdate] ' + $o) }
        Log ('[hotupdate] exit=' + $LASTEXITCODE)
    }
} else {
    Log '[hotupdate] no lua changes'
}

# ---------------- 6) tables changed? ----------------
if ($tblChanged.Count -gt 0) {
    Log ('[tables] changed (' + $tblChanged.Count + '): ' + (($tblChanged | Select-Object -First 8) -join ', '))
    if ($Restart) { Log '[tables] -Restart given -> server will be restarted below' }
    else { Log '[tables] ACTION NEEDED: reload tables in the server UI (or restart the server)' }
}

# ---------------- 7) optional restart ----------------
if ($Restart) {
    if ((Test-Path -LiteralPath $StopBat) -and (Test-Path -LiteralPath $RestartBat)) {
        Log '[restart] stopping server'
        cmd /c "`"$StopBat`"" | Out-Null
        Start-Sleep -Seconds 6
        Log '[restart] starting server'
        Start-Process -FilePath 'cmd.exe' -ArgumentList '/c', "`"$RestartBat`""
    } else {
        Log '[restart] start/stop script not found -- restart manually'
    }
}

Log 'deploy done'
