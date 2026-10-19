$ErrorActionPreference='Continue'
Import-Module WebAdministration
$site = 'Default Web Site'

Write-Output "===== before ====="
Get-WebBinding -Name $site | Select-Object protocol, bindingInformation | Format-Table -AutoSize | Out-String | Write-Output
Get-NetFirewallRule -Direction Inbound -ErrorAction SilentlyContinue |
  Where-Object { $_.DisplayName -match 'World Wide Web|8080|Game|Reg' } |
  Select-Object DisplayName,Enabled,Action | Format-Table -AutoSize | Out-String | Write-Output

Write-Output "===== change binding 80 -> 8080 ====="
$b80 = Get-WebBinding -Name $site -Port 80 -Protocol 'http' -ErrorAction SilentlyContinue
if ($b80) {
  foreach ($b in $b80) {
    Write-Output ("removing binding: {0}" -f $b.bindingInformation)
    Remove-WebBinding -Name $site -BindingInformation $b.bindingInformation
  }
} else { Write-Output "no port-80 binding found" }

if (-not (Get-WebBinding -Name $site -Port 8080 -Protocol 'http' -ErrorAction SilentlyContinue)) {
  New-WebBinding -Name $site -Protocol 'http' -Port 8080 -IPAddress '*'
  Write-Output "added binding *:8080:"
} else { Write-Output "8080 binding already exists" }

Write-Output "===== after ====="
Get-WebBinding -Name $site | Select-Object protocol, bindingInformation | Format-Table -AutoSize | Out-String | Write-Output

Write-Output "===== firewall rule for 8080 ====="
$ruleName = 'GameWeb HTTP 8080'
if (-not (Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue)) {
  New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -Protocol TCP -LocalPort 8080 -Action Allow -Profile Any | Out-Null
  Write-Output "created firewall rule: $ruleName"
} else { Write-Output "firewall rule exists: $ruleName" }
Get-NetFirewallRule -DisplayName $ruleName | Select-Object DisplayName,Enabled,Direction,Action,Profile | Format-Table -AutoSize | Out-String | Write-Output

Write-Output "===== restart site ====="
Restart-WebItem ("IIS:\Sites\" + $site) -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2
Get-WebSite -Name $site | Select-Object Name,State,PhysicalPath | Format-Table -AutoSize | Out-String | Write-Output
Write-Output "--- listeners ---"
Get-NetTCPConnection -State Listen -ErrorAction SilentlyContinue | Where-Object { $_.LocalPort -in 80,8080 } |
  Select-Object LocalAddress,LocalPort,OwningProcess | Format-Table -AutoSize | Out-String | Write-Output
Write-Output "DONE"
