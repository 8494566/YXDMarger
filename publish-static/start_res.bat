@echo off
setlocal EnableExtensions
title Generate res.txt manifest

rem ============================================================
rem  Generates the online-update manifest for the image resource
rem  folder (Data\Res), served as /res/res.txt.
rem
rem  IMPORTANT: keep this file ASCII-only.  A UTF-8 .bat that
rem  contains non-ASCII text can make cmd.exe lose parse sync and
rem  run garbage lines.  All paths below are ASCII on purpose.
rem ============================================================

rem Fixed folder = the published res\ directory next to this .bat.
set "ROOT=%~dp0res"
if not "%~1"=="" set "ROOT=%~1"

if "%ROOT:~-1%"=="\" set "ROOT=%ROOT:~0,-1%"

if not exist "%ROOT%\" (
  echo [ERROR] Folder not found: "%ROOT%"
  pause
  exit /b 1
)

set "SCP_ROOT=%ROOT%"
set "SCP_OUT=%~dp0res\res.txt"

echo Scanning: %ROOT%
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "$r=$env:SCP_ROOT; $o=$env:SCP_OUT; $nl=[string][char]13; $nl+=[string][char]10; $items=@(Get-ChildItem -LiteralPath $r -Recurse -File | Where-Object { $_.FullName -ne $o } | Sort-Object FullName | ForEach-Object { $rel=$_.FullName.Substring($r.Length+1).Replace('\','/'); $h=(Get-FileHash -LiteralPath $_.FullName -Algorithm MD5).Hash.ToLower(); ('{0}={1}|{2}' -f $rel,$_.Length,$h) }); if($items.Count -eq 0){ Write-Host '[ERROR] No files found under' $r; exit 2 }; $bb=[BitConverter]::ToString([Security.Cryptography.MD5]::Create().ComputeHash([Text.Encoding]::UTF8.GetBytes(($items -join $nl)))).Replace('-','').ToLower().Substring(0,12); $txt='[res]'+$nl+'bb='+$bb+$nl+($items -join $nl)+$nl; [IO.File]::WriteAllText($o,$txt,(New-Object System.Text.UTF8Encoding $false)); Write-Host ('[OK] files={0}  bb={1}' -f $items.Count,$bb)"

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
echo Served to clients as:  /res/res.txt
pause
