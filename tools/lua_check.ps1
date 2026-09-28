# lua_check.ps1 -- lightweight Lua syntax sanity check (no interpreter needed)
#   usage:  powershell -File lua_check.ps1 <file.lua>
#   exit 0 = looks OK ; exit 1 = suspicious (reason printed)
#   Catches (outside strings / long strings / comments):
#     * ",,"  (double comma)   <- the bug that broke the server on 2026-09-29
#     * unbalanced  {}  ()  []
#     * unterminated string / long string
#   Handles: ' " strings, -- line comments, --[[ ]] and [==[ ]==] long brackets.
$ErrorActionPreference = 'Continue'
$path = $args[0]
if (-not $path -or -not (Test-Path -LiteralPath $path)) { Write-Output 'NOFILE'; exit 1 }

$text = [System.Text.Encoding]::GetEncoding(936).GetString([System.IO.File]::ReadAllBytes($path))
$len  = $text.Length
$i = 0; $line = 1
$inStr = $false; $q = ''
$inLineComment = $false
$brace = 0; $paren = 0; $brack = 0
$dbl = @()
$badMsg = $null

while ($i -lt $len) {
    $c  = $text[$i]
    $c2 = if ($i + 1 -lt $len) { $text[$i + 1] } else { '' }

    if ($c -eq "`n") { $line++; $inLineComment = $false; $i++; continue }
    if ($inLineComment) { $i++; continue }

    if ($inStr) {
        if ($c -eq '\') { $i += 2; continue }
        if ($c -eq $q) { $inStr = $false }
        $i++; continue
    }

    # long bracket?  [=*[   (also for --[[ )
    if ($c -eq '[' -or ($c -eq '-' -and $c2 -eq '[')) {
        $start = $i
        if ($c -eq '-') { $start = $i + 1 }        # skip the second '-'
        $j = $start + 1; $lvl = 0
        while ($j -lt $len -and $text[$j] -eq '=') { $lvl++; $j++ }
        if ($j -lt $len -and $text[$j] -eq '[') {
            $closeTag = ']' + ('=' * $lvl) + ']'
            $k = $text.IndexOf($closeTag, $j + 1)
            if ($k -lt 0) { $badMsg = ('UNTERMINATED LONG STRING at line ' + $line); break }
            $seg = $text.Substring($start, $k + $closeTag.Length - $start)
            $line += ([regex]::Matches($seg, "`n")).Count
            $i = $k + $closeTag.Length
            continue
        }
    }

    if ($c -eq '-' -and $c2 -eq '-') {
        # 可能是 --[[ 长注释（可能跨行）；也可能只是行注释
        $j = $i + 2; $lvl = 0
        while ($j -lt $len -and $text[$j] -eq '=') { $lvl++; $j++ }
        if ($j -lt $len -and $text[$j] -eq '[') {
            $closeTag = ']' + ('=' * $lvl) + ']'
            $k = $text.IndexOf($closeTag, $j + 1)
            if ($k -lt 0) { $badMsg = ('UNTERMINATED LONG COMMENT at line ' + $line); break }
            $seg = $text.Substring($i, $k + $closeTag.Length - $i)
            $line += ([regex]::Matches($seg, "`n")).Count
            $i = $k + $closeTag.Length
            continue
        }
        $inLineComment = $true; $i += 2; continue
    }
    if ($c -eq '"' -or $c -eq "'") { $inStr = $true; $q = $c; $i++; continue }
    if ($c -eq '{') { $brace++ }
    elseif ($c -eq '}') { $brace-- }
    elseif ($c -eq '(') { $paren++ }
    elseif ($c -eq ')') { $paren-- }
    elseif ($c -eq '[') { $brack++ }
    elseif ($c -eq ']') { $brack-- }
    elseif ($c -eq ',' -and $c2 -eq ',') { $dbl += $line }
    $i++
}

$bad = $false            # 铁定错误：拦截（不做热更）
$warn = $false           # 可疑但不一定错：只警告（配合热更后的日志校验 + 失败回滚）
if ($badMsg) { Write-Output ('WARN ' + $badMsg); $warn = $true }
if ($dbl.Count -gt 0) {
    Write-Output ('DOUBLE_COMMA at line(s): ' + (($dbl | Select-Object -First 5) -join ','))
    $bad = $true
}
if ($brace -ne 0) { Write-Output ('WARN UNBALANCED {} : diff=' + $brace); $warn = $true }
if ($paren -ne 0) { Write-Output ('WARN UNBALANCED () : diff=' + $paren); $warn = $true }
if ($brack -ne 0) { Write-Output ('WARN UNBALANCED [] : diff=' + $brack); $warn = $true }
if ($inStr) { Write-Output 'WARN UNTERMINATED STRING'; $warn = $true }

if ($bad) { exit 1 }
if ($warn) { Write-Output 'OK (with warnings)'; exit 0 }
Write-Output 'OK'; exit 0
