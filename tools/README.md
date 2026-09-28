# deploy-kit — 一键部署包（测试服务器）

三个脚本，全部纯 ASCII 路径逻辑（中文路径用软链接绕开），都已加 UTF-8 BOM，PowerShell 5.1 可直接跑。

| 脚本 | 作用 |
|---|---|
| `make_junctions.ps1` | 建两个 ASCII 软链接：`D:\YXDClient`、`D:\YXDServer`（不移动任何数据） |
| `deploy.ps1` | 从 GitHub 拉取 → `robocopy /E` 同步到线上目录 → （可选）重启游戏服 |
| `db_backup.ps1` | 用 `sqlcmd` 每天全量备份 6 个库到 `D:\Backup`，保留 14 天 |

---

## 目录结构（GitHub 仓库里就按这个放）

```
repo/
  server/Scp/            <- D:\YXDServer\server\Server1\Scp 里我们改过的表和 Lua
  client/Data/Scp/       <- D:\YXDClient\Data\Scp（客户端更新源）
  client/Data/Res/       <- D:\YXDClient\Data\Res（图片，可选）
  publish/               <- C:\ShareFiles 里的脚本：start.bat / 一键发布.bat / start_res.bat / list.ini
```

> `.gitignore` 建议排除：`*.log`、`Backup*/`、`*.bak`、`deploy.log`

---

## 步骤

### 1. 装 Git for Windows
```powershell
git --version
```

### 2. 建 ASCII 软链接（管理员运行，一次即可）
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File D:\deploy\make_junctions.ps1
```
之后所有脚本都用：
```
D:\YXDServer\server\Server1\Scp
D:\YXDClient\Data\Scp
D:\YXDClient\Data\Res
```

### 3. 建 GitHub 仓库
- 测试环境建议**直接建公开仓库**（计划任务跑在 SYSTEM 下，公开仓库就不需要任何密钥，最省事）。
- 要私有仓库，就用 Deploy Key（只读）或 PAT，并给 SYSTEM 配好凭据。
- 把上面 `repo/` 的目录结构填好，push 上去。

### 4. 改 `deploy.ps1` 顶部配置
```powershell
$RepoUrl = 'https://github.com/你的账号/你的仓库.git'
```
`$Sync` 里是 4 组「仓库子目录 → 线上目录」，按实际改。

### 5. 手动跑一次，看日志
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File D:\deploy\deploy.ps1
Get-Content D:\git\deploy.log -Tail 30
```

### 6. 注册计划任务（每 1 分钟轮询）
```powershell
$action  = New-ScheduledTaskAction -Execute 'powershell.exe' `
  -Argument '-NoProfile -ExecutionPolicy Bypass -File D:\deploy\deploy.ps1'
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 1)
$set     = New-ScheduledTaskSettingsSet -StartWhenAvailable -MultipleInstances IgnoreNew
Register-ScheduledTask -TaskName 'YXD-Git-AutoDeploy' -Action $action -Trigger $trigger `
  -Settings $set -RunLevel Highest -User 'SYSTEM'
Get-ScheduledTask -TaskName 'YXD-Git-AutoDeploy'
```

### 7. 数据库备份（建议一定做）
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File D:\deploy\db_backup.ps1
Get-Content D:\Backup\db_backup.log -Tail 20
```
手动跑通后，注册每天 04:00：
```powershell
$action  = New-ScheduledTaskAction -Execute 'powershell.exe' `
  -Argument '-NoProfile -ExecutionPolicy Bypass -File D:\deploy\db_backup.ps1'
$trigger = New-ScheduledTaskTrigger -Daily -At 04:00
Register-ScheduledTask -TaskName 'YXD-DB-Backup' -Action $action -Trigger $trigger -RunLevel Highest -User 'SYSTEM'
```

---

## 注意

1. **绝不使用 `robocopy /MIR`**：`C:\ShareFiles\scp`、`res` 里有几十~几百 MB 的客户端包和图片，git 里没有 → `/MIR` 会删光。脚本用的是 `/E`（只增改、不删）。
2. **改了服务端表/Lua，`robocopy` 过去也不会立刻生效**：Lua 要在服务端点「脚本更新」，表要点「浏览+更新」，或者重启 `D:\YXDServer\[2]一键启动.bat`（`deploy.ps1 -Restart` 可以自动跑重启）。
3. 计划任务用 `SYSTEM` 跑 `git` 可能报 `dubious ownership`，脚本里已经加了 `git config --global --add safe.directory`。
4. `.cse/.res` 是二进制且用官方工具加解密，git 能存，但**必须**在有 `Encrypt.exe` 的 Windows 上改。
5. 脚本文件都存成 **UTF-8 带 BOM**（PowerShell 5.1 才认中文；纯 UTF-8 无 BOM 会报语法错）。
