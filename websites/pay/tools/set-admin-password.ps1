# =====================================================================
#  设置充值后台管理员密码
#  直接在服务器上运行本脚本（PowerShell 窗口），密码只存加密哈希。
#  用法：  powershell -ExecutionPolicy Bypass -File C:\PayApp\tools\set-admin-password.ps1
# =====================================================================
$ErrorActionPreference = 'Stop'
$path = 'C:\PayApp\App_Data\admin.dat'
$iterations = 60000

Write-Host ""
Write-Host "=== 设置充值后台管理员密码 ===" -ForegroundColor Cyan
$sec = Read-Host -Prompt "请输入新密码（至少 8 位）" -AsSecureString
$bstr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($sec)
try { $pwd = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr) }
finally { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr) }

if ($null -eq $pwd -or $pwd.Length -lt 8) {
    Write-Host "密码太短（至少 8 位），已取消。" -ForegroundColor Red
    exit 1
}

$sec2 = Read-Host -Prompt "请再输入一次确认" -AsSecureString
$bstr2 = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($sec2)
try { $pwd2 = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr2) }
finally { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr2) }

if ($pwd -ne $pwd2) {
    Write-Host "两次输入不一致，已取消。" -ForegroundColor Red
    exit 1
}

$salt = New-Object byte[] 16
[Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($salt)
$kdf = New-Object Security.Cryptography.Rfc2898DeriveBytes($pwd, $salt, $iterations)
$hash = [Convert]::ToBase64String($kdf.GetBytes(32))
$kdf.Dispose()

$dir = Split-Path $path
if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
[IO.File]::WriteAllText($path, ("{0}:{1}:{2}" -f $iterations, [Convert]::ToBase64String($salt), $hash),
    (New-Object Text.UTF8Encoding($false)))

Write-Host ""
Write-Host "已写入： $path" -ForegroundColor Green
Write-Host "现在可以打开 http://<你的地址>:35179/pay/admin.aspx 用这个密码登录。" -ForegroundColor Green
