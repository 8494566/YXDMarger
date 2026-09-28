param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Files
)
$ErrorActionPreference = 'Continue'
# Auto hot-reload of server Lua scripts by driving the GameServer dialog:
#   GameServer window (class #32770, title GameServer):
#     Button 1031? -> Edit 1031 = "File" path box
#     Button 1032 = "更新"
#   NOTE: SetForegroundWindow is required, and the button only reacts to real
#         mouse messages (WM_LBUTTONDOWN/UP) -- BM_CLICK is ignored.
#   NOTE: must run in the SAME interactive session as GameServer (not as SYSTEM).

Add-Type @"
using System;using System.Text;using System.Runtime.InteropServices;
public class HU {
 public delegate bool P(IntPtr h, IntPtr l);
 [DllImport("user32.dll")] public static extern bool EnumWindows(P cb, IntPtr p);
 [DllImport("user32.dll",CharSet=CharSet.Unicode)] public static extern int GetClassName(IntPtr h, StringBuilder s, int n);
 [DllImport("user32.dll",CharSet=CharSet.Unicode)] public static extern int GetWindowText(IntPtr h, StringBuilder s, int n);
 [DllImport("user32.dll")] public static extern uint GetWindowThreadProcessId(IntPtr h, out uint pid);
 [DllImport("user32.dll")] public static extern bool IsWindowVisible(IntPtr h);
 [DllImport("user32.dll")] public static extern IntPtr GetDlgItem(IntPtr d, int id);
 [DllImport("user32.dll",CharSet=CharSet.Unicode)] public static extern IntPtr SendMessage(IntPtr h, uint m, IntPtr w, string l);
 [DllImport("user32.dll",CharSet=CharSet.Unicode)] public static extern IntPtr SendMessage(IntPtr h, uint m, IntPtr w, StringBuilder l);
 [DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr h);
 [DllImport("user32.dll")] public static extern bool PostMessage(IntPtr h, uint m, IntPtr w, IntPtr l);
 [DllImport("user32.dll")] public static extern IntPtr GetForegroundWindow();
}
"@ -ErrorAction SilentlyContinue

$LogFile = 'D:\Server\server\Server1\Log\Trace.txt'
$editId  = 1031
$btnId   = 1032

function Get-GameServerDialog {
    $pids = (Get-Process -Name GameServer -ErrorAction SilentlyContinue | ForEach-Object { [uint32]$_.Id })
    if (-not $pids) { return [IntPtr]::Zero }
    $script:D = [IntPtr]::Zero
    $cb = [HU+P]{
        param($h, $l)
        $p = [uint32]0; [HU]::GetWindowThreadProcessId($h, [ref]$p) | Out-Null
        if ($pids -contains $p) {
            $c = New-Object System.Text.StringBuilder 100; [HU]::GetClassName($h, $c, 100) | Out-Null
            $t = New-Object System.Text.StringBuilder 100; [HU]::GetWindowText($h, $t, 100) | Out-Null
            if ($c.ToString() -eq '#32770' -and $t.ToString() -eq 'GameServer' -and [HU]::IsWindowVisible($h)) { $script:D = $h }
        }
        return $true
    }
    [HU]::EnumWindows($cb, [IntPtr]::Zero) | Out-Null
    return $script:D
}

function Read-LogFrom([long]$offset) {
    try {
        $fs = [System.IO.File]::Open($LogFile, 'Open', 'Read', 'ReadWrite')
        $fs.Seek($offset, 'Begin') | Out-Null
        $sr = New-Object System.IO.StreamReader($fs, [System.Text.Encoding]::GetEncoding('gbk'))
        $txt = $sr.ReadToEnd(); $sr.Close(); $fs.Close()
        return $txt
    } catch { return '' }
}

$dlg = Get-GameServerDialog
if ($dlg -eq [IntPtr]::Zero) {
    Write-Output 'ERROR: GameServer dialog not found (is the server running in this session?)'
    exit 2
}
$edit = [HU]::GetDlgItem($dlg, $editId)
$btn  = [HU]::GetDlgItem($dlg, $btnId)
$lp   = [IntPtr](5 -bor (5 -shl 16))

$fail = 0
foreach ($f in $Files) {
    if (-not $f) { continue }
    if (-not (Test-Path -LiteralPath $f)) { Write-Output ('SKIP (missing): ' + $f); $fail++; continue }
    $before = (Get-Item $LogFile).Length
    [HU]::SetForegroundWindow($dlg) | Out-Null
    Start-Sleep -Milliseconds 300
    [HU]::SendMessage($edit, 0x000C, [IntPtr]::Zero, $f) | Out-Null   # WM_SETTEXT
    Start-Sleep -Milliseconds 1000
    $sb = New-Object System.Text.StringBuilder 512
    [HU]::SendMessage($edit, 0x000D, [IntPtr]512, $sb) | Out-Null      # WM_GETTEXT
    if ($sb.ToString() -ne $f) { Write-Output ('FAIL (path not accepted): ' + $sb.ToString()); $fail++; continue }
    [HU]::PostMessage($btn, 0x0201, [IntPtr]1, $lp) | Out-Null         # WM_LBUTTONDOWN
    Start-Sleep -Milliseconds 130
    [HU]::PostMessage($btn, 0x0202, [IntPtr]0, $lp) | Out-Null         # WM_LBUTTONUP
    Start-Sleep -Seconds 3
    $txt = Read-LogFrom $before
    $leaf = Split-Path $f -Leaf
    if ($txt -match [regex]::Escape($leaf) -and $txt -match '成功') {
        Write-Output ('OK   ' + $leaf)
    } else {
        Write-Output ('FAIL ' + $leaf + '  (log: ' + (($txt -split "`r?`n" | Where-Object { $_.Trim() -ne '' }) -join ' | ') + ')')
        $fail++
    }
    Start-Sleep -Milliseconds 500
}
if ($fail -gt 0) { exit 1 } else { exit 0 }
