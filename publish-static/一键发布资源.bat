@echo off
setlocal EnableExtensions
title 一键发布资源更新 - 同步客户端Data\Res到res并生成清单

rem ============================================================
rem  本文件是 GBK 编码，请勿另存为 UTF-8（否则中文路径会变乱码）
rem  用法：直接双击运行
rem  它做两件事：
rem    1. robocopy 把客户端 Data\Res 完整同步到 C:\ShareFiles\res
rem    2. 调用 start_res.bat 生成在线更新清单 res.txt，写进 res 目录
rem  提示：res 目录约 3GB（bmp.fsp 502MB / Magic.fsp 599MB /
rem        Bodypart.fsp 1813MB / ani.fsp 219MB + grd 下 219 个地表图）
rem        资源没改动就不用重新发布，建议先备份 res\bmp.fsp
rem ============================================================

set "CLIENT=D:\六星魂器英雄岛加修复交易所数据库\英雄岛一键端\英雄岛\Data\Res"
set "SHARE=%~dp0res"
if not "%~1"=="" set "CLIENT=%~1"
if "%SHARE:~-1%"=="\" set "SHARE=%SHARE:~0,-1%"

echo ============================================================
echo   一键发布资源：  客户端 Data\Res  同步到  ShareFiles\res
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

echo [1/2] 同步文件（约 3GB，robocopy 增量）...
robocopy "%CLIENT%" "%SHARE%" /E /NFL /NDL /NJH /NJS /NP
set RC=%ERRORLEVEL%
if %RC% GEQ 8 (
  echo [ERROR] 同步失败，robocopy 返回 %RC%
  pause
  exit /b 1
)
echo       同步完成。
echo.
echo [2/2] 生成在线更新清单 res.txt（要哈希 3GB，约 30 秒）...

call "%~dp0start_res.bat" < nul
if errorlevel 1 (
  echo.
  echo [ERROR] manifest generate failed
  pause
  exit /b 1
)

echo.
echo ============================================================
echo   PUBLISH DONE.  users update from:  /res/res.txt
echo   Manifest: %SHARE%\res.txt
echo ============================================================
pause
