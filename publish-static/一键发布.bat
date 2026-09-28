@echo off
setlocal EnableExtensions
title 一键发布更新 - 同步客户端到 scp 并生成清单

rem ============================================================
rem  本文件是 GBK 编码，请勿另存为 UTF-8（否则中文路径会变乱码）
rem  用法：直接双击运行
rem  它做两件事：
rem    1. robocopy 把客户端 Data\Scp 完整同步到 C:\ShareFiles\scp
rem    2. 调用 start.bat 生成在线更新清单 scp.txt，直接写进 scp 目录
rem ============================================================

set "CLIENT=D:\六星魂器英雄岛加修复交易所数据库\英雄岛一键端\英雄岛\Data\Scp"
set "SHARE=%~dp0scp"
if not "%~1"=="" set "CLIENT=%~1"
if "%SHARE:~-1%"=="\" set "SHARE=%SHARE:~0,-1%"

echo ============================================================
echo   一键发布：  客户端 Data\Scp  同步到  ShareFiles\scp
echo ============================================================
echo   客户端目录 : %CLIENT%
echo   发布目录   : %SHARE%
echo.

if not exist "%CLIENT%\" (
  echo [ERROR] 找不到客户端目录: "%CLIENT%"
  pause
  exit /b 1
)
if not exist "%SHARE%\" (
  echo [ERROR] 找不到发布目录: "%SHARE%"
  pause
  exit /b 1
)

echo [1/2] 同步文件 ...
robocopy "%CLIENT%" "%SHARE%" /E /NFL /NDL /NJH /NJS /NP
set RC=%ERRORLEVEL%
if %RC% GEQ 8 (
  echo [ERROR] 同步失败，robocopy 返回 %RC%
  pause
  exit /b 1
)
echo       同步完成。
echo.
echo [2/2] 生成在线更新清单 scp.txt ...

call "%~dp0start.bat" < nul
if errorlevel 1 (
  echo.
  echo [ERROR] manifest generate failed
  pause
  exit /b 1
)

echo.
echo ============================================================
echo   PUBLISH DONE.  users update from:  /scp/scp.txt
echo   Manifest: %SHARE%\scp.txt
echo ============================================================
pause
