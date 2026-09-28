@echo off
chcp 65001 >nul
setlocal EnableExtensions
title Generate scp.txt manifest

rem ============================================================
rem  This .bat must be saved as UTF-8 (no BOM) + CRLF line endings,
rem  because the default resource path below contains Chinese chars.
rem  The "chcp 65001" above is what makes cmd parse it as UTF-8.
rem ============================================================

rem Fixed resource folder. Optional: pass a path as 1st argument to override.
set "ROOT=D:\六星魂器英雄岛加修复交易所数据库\英雄岛一键端\英雄岛\Data\Scp"
if not "%~1"=="" set "ROOT=%~1"

if "%ROOT:~-1%"=="\" set "ROOT=%ROOT:~0,-1%"

if not exist "%ROOT%\" (
  echo [ERROR] Folder not found: "%ROOT%"
  pause
  exit /b 1
)

set "SCP_ROOT=%ROOT%"
set "SCP_OUT=%~dp0scp\scp.txt"

echo Scanning: %ROOT%
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "$r=$env:SCP_ROOT; $o=$env:SCP_OUT; $nl=[string][char]13; $nl+=[string][char]10; $items=@(Get-ChildItem -LiteralPath $r -Recurse -File | Where-Object { $_.FullName -ne $o } | Sort-Object FullName | ForEach-Object { $rel=$_.FullName.Substring($r.Length+1).Replace('\','/'); $h=(Get-FileHash -LiteralPath $_.FullName -Algorithm MD5).Hash.ToLower(); ('{0}={1}|{2}' -f $rel,$_.Length,$h) }); if($items.Count -eq 0){ Write-Host '[ERROR] No files found under' $r; exit 2 }; $bb=[BitConverter]::ToString([Security.Cryptography.MD5]::Create().ComputeHash([Text.Encoding]::UTF8.GetBytes(($items -join $nl)))).Replace('-','').ToLower().Substring(0,12); $txt='[scp]'+$nl+'bb='+$bb+$nl+($items -join $nl)+$nl; [IO.File]::WriteAllText($o,$txt,(New-Object System.Text.UTF8Encoding $false)); Write-Host ('[OK] files={0}  bb={1}' -f $items.Count,$bb)"

if errorlevel 1 (
  echo.
  echo [FAILED] Manifest was NOT generated.
  pause
  exit /b 1
)

echo.
echo Done. Output file:
echo   %SCP_OUT%
echo.
echo Upload it to the server as:  /scp/scp.txt
pause
