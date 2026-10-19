$ErrorActionPreference='Continue'
$id = [Security.Principal.WindowsIdentity]::GetCurrent()
$p = New-Object Security.Principal.WindowsPrincipal($id)
if (-not $p.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { Write-Output "NOT ADMIN"; exit 2 }
$f = @('Web-Asp-Net45','Web-Net-Ext45','Web-ISAPI-Ext','Web-ISAPI-Filter','Web-Http-Errors','Web-Request-Monitor')
Write-Output "Installing ASP.NET 4.5 ..."
$r = Install-WindowsFeature -Name $f -IncludeManagementTools
Write-Output ("Success: {0} / RestartNeeded: {1} / ExitCode: {2}" -f $r.Success, $r.RestartNeeded, $r.ExitCode)
Write-Output "--- verify ---"
Get-WindowsFeature Web-Asp-Net45,Web-Net-Ext45,Web-ISAPI-Ext | Select-Object Name,Installed | Format-Table -AutoSize | Out-String | Write-Output
Write-Output "DONE"
