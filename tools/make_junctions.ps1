# =============================================================================
#  make_junctions.ps1  --  create ASCII junctions for the test server
#  Why: all other scripts can then use pure-ASCII paths (no Chinese chars),
#       which avoids the classic cmd/PowerShell encoding breakage.
#  Run once, as Administrator.  Nothing is moved or copied.
# =============================================================================
$ErrorActionPreference = 'Stop'

# ---- config ----------------------------------------------------------------
$pairs = @(
    @{ Link = 'D:\YXDClient'; Target = 'D:\六星魂器英雄岛加修复交易所数据库\英雄岛一键端\英雄岛' },
    @{ Link = 'D:\YXDServer'; Target = 'D:\Server' }
)
# ---------------------------------------------------------------------------

foreach ($p in $pairs) {
    $link = $p.Link
    $target = $p.Target
    if (-not (Test-Path -LiteralPath $target)) {
        Write-Host ("[skip] target not found: " + $target)
        continue
    }
    if (Test-Path -LiteralPath $link) {
        Write-Host ("[ok]   already exists: " + $link)
        continue
    }
    cmd /c mklink /J "$link" "$target" | Out-Null
    if (Test-Path -LiteralPath $link) {
        Write-Host ("[done] " + $link + "  ->  " + $target)
    } else {
        Write-Host ("[FAIL] " + $link)
    }
}

Write-Host ''
Write-Host 'Now you can use these ASCII paths everywhere:'
Write-Host '  D:\YXDServer\server\Server1\Scp        (server tables + Lua)'
Write-Host '  D:\YXDClient\Data\Scp                  (client scp publish source)'
Write-Host '  D:\YXDClient\Data\Res                  (client images)'
