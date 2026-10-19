$ErrorActionPreference='Continue'
Import-Module WebAdministration
$site = 'Default Web Site'
$appcmd = Join-Path $env:windir 'system32\inetsrv\appcmd.exe'
$port = 35179
$root = 'C:\ShareFiles'

Write-Output "===== A. apply MIME maps ====="
# 通配兜底：任何未注册扩展名都按二进制流下载
& $appcmd set config $site /section:staticContent "/+[fileExtension='*',mimeType='application/octet-stream']" /commit:apphost
# .ini 明确按文本，方便浏览器里直接看
& $appcmd set config $site /section:staticContent "/+[fileExtension='.ini',mimeType='text/plain']" /commit:apphost

Write-Output "--- effective maps on the site ---"
$mimes = Get-WebConfiguration -PSPath 'MACHINE/WEBROOT/APPHOST' -Location $site -Filter 'system.webServer/staticContent/mimeMap'
foreach ($e in @('*','.ini','.txt','.zip','.js','.png','.res','.cse','.scp','.dat')) {
  $hit = $mimes | Where-Object { $_.fileExtension -eq $e }
  if ($hit) { Write-Output ("  {0,-8} -> {1}" -f $e, ($hit.mimeType -join ',')) } else { Write-Output ("  {0,-8} -> (not in site collection)" -f $e) }
}

Write-Output ""
Write-Output "===== B. copy iis log (it is locked) and read substatus ====="
$log = Get-ChildItem 'C:\inetpub\logs\LogFiles\W3SVC1' -Filter '*.log' -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
if ($log) {
  $tmp = 'C:\Users\Administrator\lobsterai\project\.cowork-temp\iis.log'
  Copy-Item $log.FullName $tmp -Force -ErrorAction SilentlyContinue
  $lines = [System.IO.File]::ReadAllLines($tmp)
  $tail = $lines | Select-Object -Last 12
  foreach ($l in $tail) { Write-Output ("  " + ($l -replace '^.*?\] ', '')) }
}

Write-Output ""
Write-Output "===== C. retest every file ====="
$files = Get-ChildItem $root -Recurse -File -Force
$ok = 0; $bad = 0; $badList = @()
foreach ($f in $files) {
  $rel = $f.FullName.Substring($root.Length).Replace('\','/')
  $url = "http://127.0.0.1:$port$rel"
  try {
    $req = [System.Net.HttpWebRequest]::Create($url); $req.Timeout=15000; $req.UserAgent='verify'
    $resp = $req.GetResponse()
    if ([int]$resp.StatusCode -eq 200) { $ok++ } else { $bad++; $badList += $rel }
    $resp.Close()
  } catch [System.Net.WebException] {
    $bad++; $badList += ($rel + ' [' + [int]$_.Exception.Response.StatusCode + ']')
  }
}
Write-Output ("  total files: {0} | HTTP 200: {1} | failed: {2}" -f $files.Count, $ok, $bad)
if ($badList.Count -gt 0) { Write-Output "  --- failures ---"; $badList | ForEach-Object { Write-Output ("    " + $_) } }

Write-Output ""
Write-Output "===== D. spot checks ====="
foreach ($u in @('/list.ini','/start.bat','/demo.zip','/scp/scp.txt','/scp/Skill.res','/scp/PET/PetCards.cse','/scp/Medicament.csv','/register/reg.js','/register/','/register/captcha.ashx','/register/web.config')) {
  try {
    $req = [System.Net.HttpWebRequest]::Create("http://127.0.0.1:$port$u"); $req.Timeout=15000; $req.UserAgent='verify'
    $resp = $req.GetResponse()
    Write-Output ("  {0,-30} HTTP {1} | {2}" -f $u, [int]$resp.StatusCode, $resp.ContentType)
    $resp.Close()
  } catch [System.Net.WebException] {
    if ($_.Exception.Response -ne $null) { Write-Output ("  {0,-30} HTTP {1}" -f $u, [int]$_.Exception.Response.StatusCode) }
    else { Write-Output ("  {0,-30} {1}" -f $u, $_.Exception.Message) }
  }
}

Write-Output ""
Write-Output "===== E. is ASP.NET handler inherited at the download root? ====="
Get-WebHandler -PSPath ("IIS:\Sites\" + $site) -ErrorAction SilentlyContinue |
  Where-Object { $_.Path -match 'aspx|ashx|asp\b' } |
  Select-Object Name,Path,Verb,Modules | Format-Table -AutoSize | Out-String | Write-Output
Write-Output "DONE"
