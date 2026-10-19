# =====================================================================
#  设置「微信到账提醒」推送
#  在服务器上直接运行（PowerShell 窗口）：
#    powershell -ExecutionPolicy Bypass -File C:\PayApp\tools\set-notify.ps1
#  token 只存到 C:\PayApp\App_Data\notify.txt，不出现在任何日志/聊天里。
# =====================================================================
$ErrorActionPreference = 'Stop'
$path = 'C:\PayApp\App_Data\notify.txt'

Write-Host ""
Write-Host "=== 设置微信到账提醒 ===" -ForegroundColor Cyan
Write-Host "  1 = Server酱  （https://sct.ftqq.com  扫码登录后复制 SendKey）"
Write-Host "  2 = PushPlus  （https://www.pushplus.plus  微信扫码登录后复制 token）"
Write-Host "  3 = 企业微信机器人 webhook（群机器人地址里 key= 后面那一串）"
Write-Host ""
$sel = Read-Host "请输入 1 / 2 / 3"

$prov = $null
switch ($sel) {
    '1' { $prov = 'serverchan' }
    '2' { $prov = 'pushplus' }
    '3' { $prov = 'wecom' }
}
if (-not $prov) { Write-Host "无效选择，已取消。" -ForegroundColor Red; exit 1 }

$sec = Read-Host -Prompt "粘贴 token / key（输入时不显示）" -AsSecureString
$bstr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($sec)
try { $tok = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr) }
finally { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr) }

if ([string]::IsNullOrWhiteSpace($tok)) { Write-Host "token 为空，已取消。" -ForegroundColor Red; exit 1 }
$tok = $tok.Trim()

Write-Host ""
Write-Host "正在发送一条测试消息..." -ForegroundColor Yellow
$sendOk = $false
try {
    if ($prov -eq 'serverchan') {
        $form = "title=" + [uri]::EscapeDataString('充值后台-测试消息') +
                "&desp=" + [uri]::EscapeDataString('如果你在微信里看到这条，说明到账提醒配置成功。')
        $resp = Invoke-RestMethod -Method Post -Uri ("https://sctapi.ftqq.com/{0}.send" -f $tok) `
            -ContentType 'application/x-www-form-urlencoded; charset=utf-8' `
            -Body ([Text.Encoding]::UTF8.GetBytes($form)) -TimeoutSec 25
        Write-Host ("  接口返回: " + ($resp | ConvertTo-Json -Compress -Depth 4))
        $sendOk = $true
    }
    elseif ($prov -eq 'pushplus') {
        $form = "token=" + [uri]::EscapeDataString($tok) +
                "&title=" + [uri]::EscapeDataString('充值后台-测试消息') +
                "&content=" + [uri]::EscapeDataString('如果你在微信里看到这条，说明到账提醒配置成功。') +
                "&template=txt"
        $resp = Invoke-RestMethod -Method Post -Uri 'https://www.pushplus.plus/send' `
            -ContentType 'application/x-www-form-urlencoded; charset=utf-8' `
            -Body ([Text.Encoding]::UTF8.GetBytes($form)) -TimeoutSec 25
        Write-Host ("  接口返回: " + ($resp | ConvertTo-Json -Compress -Depth 4))
        $sendOk = $true
    }
    else {
        $obj = @{ msgtype = 'text'; text = @{ content = "充值后台-测试消息`n如果你在微信里看到这条，说明到账提醒配置成功。" } }
        $json = $obj | ConvertTo-Json -Depth 6 -Compress
        $resp = Invoke-RestMethod -Method Post `
            -Uri ("https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key={0}" -f $tok) `
            -ContentType 'application/json; charset=utf-8' `
            -Body ([Text.Encoding]::UTF8.GetBytes($json)) -TimeoutSec 25
        Write-Host ("  接口返回: " + ($resp | ConvertTo-Json -Compress -Depth 4))
        $sendOk = $true
    }
}
catch {
    Write-Host ("  测试推送失败：" + $_.Exception.Message) -ForegroundColor Red
    Write-Host "  （token 可能不对，或者服务器访问不了推送接口）" -ForegroundColor Red
}

$dir = Split-Path $path
if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
[IO.File]::WriteAllText($path, ("{0}:{1}" -f $prov, $tok), (New-Object Text.UTF8Encoding($false)))

Write-Host ""
Write-Host ("已保存： {0}" -f $path) -ForegroundColor Green
Write-Host ("渠道： {0}" -f $prov) -ForegroundColor Green
if (-not $sendOk) {
    Write-Host "注意：测试消息没发成功，但配置已保存。可以在浏览器里下一单试试。" -ForegroundColor Yellow
}
Write-Host "以后有玩家付款并点「我已付款」，你的微信就会收到提醒。" -ForegroundColor Green
