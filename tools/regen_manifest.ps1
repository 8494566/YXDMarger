# regen_manifest.ps1 -- regenerate C:\ShareFiles\scp\scp.txt from the client folder
# ASCII only. Provides stdin (for start.bat's trailing pause) and a timeout.
$ErrorActionPreference = 'Continue'
$PubRoot  = 'C:\ShareFiles'
$CliScp   = 'D:\YXDClient\Data\Scp'
$startBat = Join-Path $PubRoot 'start.bat'
if (-not (Test-Path -LiteralPath $startBat)) { Write-Output 'NO start.bat'; exit 2 }

$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName  = 'cmd.exe'
$psi.Arguments = '/c ""' + $startBat + '" "' + $CliScp + '""'
$psi.UseShellExecute        = $false
$psi.RedirectStandardInput  = $true
$psi.RedirectStandardOutput = $true
$psi.RedirectStandardError  = $true
$psi.CreateNoWindow         = $true
$p = [System.Diagnostics.Process]::Start($psi)
$p.StandardInput.WriteLine('')
$p.StandardInput.Close()
$outTask = $p.StandardOutput.ReadToEndAsync()
$errTask = $p.StandardError.ReadToEndAsync()
if (-not $p.WaitForExit(240000)) {
    try { $p.Kill() } catch {}
    Write-Output 'TIMEOUT'
    exit 3
}
Write-Output ('exit=' + $p.ExitCode)
Write-Output ($outTask.Result)
if ($errTask.Result) { Write-Output ('ERR: ' + $errTask.Result) }
