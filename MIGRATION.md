# 英雄岛私服 — 迁移与接手总说明书

> 生成时间：2026-10-19
> 适用场景：旧服务器（腾讯云 Windows Server 2022，42.193.197.163）即将关闭，在新服务器上恢复全部网站、脚本、表/Lua 与数据库。
> 代码仓库：`git@github.com:8494566/YXDMarger.git`（分支 `main`）
> 本文件就是总入口；细节文档在 `docs/`，网站部署细节在 `websites/README.md`，SQL 在 `sql/README.md`。

---

## 0. 最重要的一件事：git 里没有数据库

关服前**必须**把数据库备份拷走，否则角色、账号、订单全没了：

```powershell
# 在旧服务器上执行（会备份 6 个库到 D:\Backup\yyyyMMdd\）
powershell -ExecutionPolicy Bypass -File D:\deploy\db_backup.ps1

# 然后把整个日期目录拷到移动硬盘/网盘/新服务器
# 例：D:\Backup\20261019\GameDB.bak 等 6 个文件
```

同时建议把以下**不在 git 里**的东西一起打包拷走：

| 内容 | 旧服务器路径 | 为什么 |
|---|---|---|
| 数据库备份 | `D:\Backup\` | 全部玩家数据 |
| 游戏服务端整包 | `D:\Server\`（`D:\YXDServer` 指向它） | 二进制、地图、插件、配置 |
| 游戏客户端整包 | `D:\六星魂器英雄岛加修复交易所数据库\英雄岛一键端\英雄岛\`（`D:\YXDClient` 指向它） | 客户端 DLL/资源/启动器 |
| 发布站大文件 | `C:\ShareFiles\scp\`、`res\`、`英雄岛登录器.exe` | 几百 MB，git 不放 |
| 网站运行态 | `C:\PayApp\App_Data\`、`C:\PayApp\qr\*.JPG` | 后台密码哈希、推送 token、收款码 |
| 部署 SSH 私钥 | `D:\deploy\ssh\yxd_deploy` | 新服务器拉/推 GitHub 用；**不要上传到仓库** |

---

## 1. 仓库里有什么（clone 后即得）

```
YXDMarger/
  MIGRATION.md                  ← 本文件
  README.md                     ← 原有仓库说明
  CHANGELOG.md
  shared/scp/                   ← 双端共用的表（.cse/.res），部署时同步到服务端+客户端
  server/lua/                   ← 服务端 Lua
  client/extra/                 ← 客户端额外文件
  publish-static/               ← 发布站脚本（list.ini / start.bat / 一键发布）
  tools/                        ← deploy.ps1 / db_backup.ps1 / hot_update.ps1 / lua_check.ps1 / yxd_crypt.py 等
  websites/                     ← 【本次新增】注册站 + 充值站 + GM 后台源码
    pay/                        ← 对应 C:\PayApp
    reg/                        ← 对应 C:\RegApp
    deploy/                     ← 网站部署脚本
    README.md                   ← 网站部署总说明
  sql/                          ← 【本次新增】订单表、账号授权、GM 物品目录、邮件/点券脚本
  docs/                         ← 【本次新增】历次部署/改文件/比对文档
```

已跟踪 400+ 个表/Lua 文件；仓库约 7 MB（pack 后）。**没有**游戏二进制、客户端资源包、数据库备份、日志、收款码、密码/token。

---

## 2. 旧服务器快照（实测，2026-10-19）

| 项目 | 值 |
|---|---|
| 系统 | Windows Server 2022 Datacenter 10.0.20348 x64 |
| 公网 IP | `42.193.197.163` |
| IIS | `Default Web Site`，物理路径 `C:\ShareFiles`，绑定 `http *:35179` |
| IIS 应用 | `/register` → `C:\RegApp`（池 `RegApp`）；`/pay` → `C:\PayApp`（池 `PayApp`） |
| 应用池身份 | 均为 `ApplicationPoolIdentity`，.NET CLR v4.0 / Integrated |
| SQL Server | SQL Server 2012 Express 11.0.2100.60，实例 `.\SQLEXPRESS`，TCP 1433 |
| 数据库 | `GameDB`、`GameDB_Log`、`GameDBArea`、`UserCenter`、`UserActive`、`PayCenter` |
| 游戏服务端 | `D:\Server\`（`D:\YXDServer` 是 Junction） |
| 游戏客户端 | `D:\六星魂器英雄岛加修复交易所数据库\英雄岛一键端\英雄岛\`（`D:\YXDClient` 是 Junction） |
| 发布站 | `C:\ShareFiles`（scp/、res/、list.ini、登录器、发布 bat） |
| 计划任务 | `YXD-Git-AutoDeploy`（每 1 分钟）、`YXD-DB-Backup`（每天 04:00）、`YXD-GameServer-AutoStart`（登录时） |
| 已放行端口 | 35179（发布/网站）、4203（登录服）、3389（RDP）；1433 未对公网开放 |
| 游戏端口 | 登录 4203；Server1 `4205`；世界列表 `5541`；中心/管理内部 `8201/8202/8204` |

> 旧文档里出现过 `D:\Server`、`D:\六星魂器...` 和 `80/8080` 端口，都是历史版本；**以本节为准**。

---

## 3. 新服务器从零恢复（推荐顺序）

### 3.1 装基础环境

```powershell
# IIS + ASP.NET 4.5（install-aspnet.ps1 在仓库 websites/deploy/）
Install-WindowsFeature -Name Web-Server,Web-Default-Doc,Web-Dir-Browsing,Web-Static-Content,Web-Http-Logging,Web-Filtering,Web-Mgmt-Console -IncludeManagementTools
powershell -ExecutionPolicy Bypass -File .\websites\deploy\install-aspnet.ps1
```

装 SQL Server（2012 Express 或更高），实例名建议保持 `SQLEXPRESS`，启用 TCP 1433、Windows 集成认证。

装 Git for Windows，确认 `git --version`。

### 3.2 还原数据库

把旧服务器 `D:\Backup\最新日期\` 下的 6 个 `.bak` 拷到新服务器 `D:\Backup\`，逐个还原：

```powershell
# 先建空库（或直接 RESTORE WITH REPLACE）
sqlcmd -S .\SQLEXPRESS -E -Q "RESTORE DATABASE [GameDB] FROM DISK=N'D:\Backup\20261019\GameDB.bak' WITH REPLACE"
# 其余：GameDB_Log / GameDBArea / UserCenter / UserActive / PayCenter 同样处理
```

还原后确认 `GameDBArea.dbo.account` 有数据、`GameDB.dbo.Actor` 有角色。

### 3.3 拉代码

```powershell
# 方式 A：SSH（推荐；新机器生成自己的 key，加到 GitHub 仓库 Deploy keys）
git clone git@github.com:8494566/YXDMarger.git D:\git\work

# 方式 B：HTTPS + PAT
git clone https://github.com/8494566/YXDMarger.git D:\git\work
```

> 旧服务器的私钥在 `D:\deploy\ssh\yxd_deploy`，**不要提交到仓库**。新机器用新 key 更安全。

### 3.4 恢复游戏服务端 / 客户端目录

把旧服务器整个 `D:\Server\` 拷到新服务器同路径；客户端整个目录拷到同路径。然后二选一：

- 保持原路径：直接可用（`D:\YXDServer`、`D:\YXDClient` 这两个 Junction 一起拷或重建）。
- 换路径：改 `tools/make_junctions.ps1` 顶部的 `Target`，管理员运行一次重建 Junction。

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File D:\git\work\tools\make_junctions.ps1
```

### 3.5 改所有写死旧 IP 的地方

新服务器公网 IP 变化后，必须全局替换 `42.193.197.163`：

| 文件 | 改什么 |
|---|---|
| `D:\Server\server\Login\config.ini` | `LocalIP`、`CenterServerIP`、`ManagerIP`、`VestibServerIP`、`PassSuitIP` |
| `D:\Server\server\Server1\config.ini` | `ServerIP`、`CenterSIP`、`SMgrIP`、`DBSIP` |
| 其他 `D:\Server\server\*\config.ini` | 同上，按文件内 IP 字段 |
| `C:\ShareFiles\list.ini` | `zc=` 注册地址、`kf=` 充值地址、`world.list` 的 IP/端口 |
| `C:\PayApp\web.config` | `AdminUrl`（微信提醒里的后台链接） |
| `C:\ShareFiles\start.bat` / 发布脚本 | 如含旧路径，改成新客户端路径 |

> `list.ini` 是 GBK/ANSI 编码，改完保持原编码，否则登录器乱码。

### 3.6 建 IIS 站点 + 部署两个网站

```powershell
# 1) 建站点根目录
New-Item -ItemType Directory -Force C:\ShareFiles | Out-Null

# 2) 建站点（如果 IIS 里已有 Default Web Site，改物理路径和绑定即可）
Set-ItemProperty 'IIS:\Sites\Default Web Site' -Name physicalPath -Value 'C:\ShareFiles'
New-WebBinding -Name 'Default Web Site' -Protocol http -Port 35179 -IPAddress '*'

# 3) 发布站 MIME 通配兜底（关键，否则 .cse/.res/.scp 下载 404.3）
& $env:windir\system32\inetsrv\appcmd.exe set config "Default Web Site" /section:staticContent "/+[fileExtension='*',mimeType='application/octet-stream']" /commit:apphost
& $env:windir\system32\inetsrv\appcmd.exe set config "Default Web Site" /section:staticContent "/+[fileExtension='.ini',mimeType='text/plain']" /commit:apphost

# 4) 部署注册站 / 充值站（脚本会建应用池、应用、ACL、SQL 登录和授权）
New-Item -ItemType Directory -Force C:\RegApp,C:\PayApp | Out-Null
Copy-Item D:\git\work\websites\reg\* C:\RegApp\ -Recurse -Force
Copy-Item D:\git\work\websites\pay\* C:\PayApp\ -Recurse -Force
powershell -ExecutionPolicy Bypass -File D:\git\work\websites\deploy\deploy-reg.ps1
powershell -ExecutionPolicy Bypass -File D:\git\work\websites\deploy\deploy-pay.ps1
```

### 3.7 恢复网站运行态（git 里故意没有）

```powershell
# 1) 收款码：把 alipay.JPG / wx.JPG 放回
Copy-Item <你的备份>\qr\*.JPG C:\PayApp\qr\ -Force

# 2) 后台密码（交互输入，只存哈希）
powershell -ExecutionPolicy Bypass -File C:\PayApp\tools\set-admin-password.ps1

# 3) 微信到账提醒（交互输入 token，只存本地）
powershell -ExecutionPolicy Bypass -File C:\PayApp\tools\set-notify.ps1

# 4) GM 物品目录（4967 条）
sqlcmd -S .\SQLEXPRESS -E -i D:\git\work\sql\gm\GM_ItemCatalog.sql
```

### 3.8 恢复发布站内容

把旧服务器 `C:\ShareFiles` 下的 `scp\`、`res\`、`英雄岛登录器.exe`、`list.ini`、`start.bat`、`一键发布.bat`、`start_res.bat`、`一键发布资源.bat` 全部拷回。这些是大文件，不在 git。

### 3.9 恢复计划任务

```powershell
# Git 自动部署（每 1 分钟）
$action  = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -ExecutionPolicy Bypass -File D:\deploy\deploy.ps1'
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 1)
Register-ScheduledTask -TaskName 'YXD-Git-AutoDeploy' -Action $action -Trigger $trigger -RunLevel Highest -User 'SYSTEM' -Force

# 数据库备份（每天 04:00）
$action2  = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -ExecutionPolicy Bypass -File D:\deploy\db_backup.ps1'
$trigger2 = New-ScheduledTaskTrigger -Daily -At 04:00
Register-ScheduledTask -TaskName 'YXD-DB-Backup' -Action $action2 -Trigger $trigger2 -RunLevel Highest -User 'SYSTEM' -Force
```

> `D:\deploy\` 是旧服务器脚本目录，新机器可直接把仓库 `tools/` 拷过去，或改计划任务路径指向 `D:\git\work\tools\`。
> `deploy.ps1` 顶部写死了 `RepoDir`、SSH key 路径、线上目录，换机器要按实际改。

### 3.10 防火墙 / 云安全组

至少放行：

- `35179` TCP：网站 + 发布站（玩家要访问）
- `4203` TCP：登录服
- `5541`、`4205`、`8201/8202/8204`：按旧机规则核对（部分只在本机/内网）
- `3389`：RDP，**强烈建议只放行你的固定 IP**

**不要**把 1433 开到公网。

### 3.11 启动与验收

```powershell
# 启动游戏服（旧机脚本；新机路径不同就改）
cmd /c "D:\Server\[2]一键启动.bat"

# 网站自检
Invoke-WebRequest http://127.0.0.1:35179/register/ -UseBasicParsing | Select StatusCode
Invoke-WebRequest http://127.0.0.1:35179/pay/ -UseBasicParsing | Select StatusCode
Invoke-WebRequest http://127.0.0.1:35179/pay/admin.aspx -UseBasicParsing | Select StatusCode
Invoke-WebRequest http://127.0.0.1:35179/pay/gm.aspx -UseBasicParsing | Select StatusCode
```

功能验收见第 7 节清单。

---

## 4. 自动部署（Git → 线上）

仓库 `tools/deploy.ps1` 的逻辑：

1. `git fetch/pull` 到 `D:\git\work`（分支 `main`）
2. `shared/scp` → 服务端 `D:\YXDServer\server\Server1\Scp` **和** 客户端 `D:\YXDClient\Data\Scp`
3. `server/lua` → 服务端 `Scp\Lua`
4. `client/extra` → 客户端 `Data\Scp`
5. `publish-static` → `C:\ShareFiles`
6. 重新生成 `scp.txt`（客户端更新清单，最后一步）
7. 可选热更 Lua / 重启

铁律：

- **只用 `robocopy /E`，绝不用 `/MIR`**：发布站有几百 MB 客户端包和图片，git 里没有，`/MIR` 会删光。
- 改了表/Lua，`robocopy` 过去不会自动生效：Lua 要「脚本更新」，表要「浏览+更新」，或重启游戏服。
- 计划任务用 `SYSTEM` 跑 git 可能报 `dubious ownership`，脚本已加 `safe.directory *`。
- `.cse/.res` 是二进制加密格式，必须用官方 `Encrypt.exe` 或仓库 `tools/yxd_crypt.py`，不能手改。

---

## 5. 数据库与权限

| 身份 | 库 | 权限 |
|---|---|---|
| `IIS APPPOOL\RegApp` | `GameDBArea` | `SELECT, INSERT` on `dbo.account` |
| `IIS APPPOOL\PayApp` | `PayCenter` | `SELECT, INSERT, UPDATE` on `dbo.WebRechargeOrder` |
| `IIS APPPOOL\PayApp` | `GameDB` | `SELECT` on `dbo.Actor`、`dbo.GM_ItemCatalog`；`EXECUTE` on `PrGs_GameUser_Points_Add`、`PrGs_GameEmail_Add_V5` |

建表/授权脚本：`sql/PayCenter_WebRechargeOrder.sql`。
备份：`tools/db_backup.ps1`（6 库、保留 14 天、SQL 2012 Express 不支持压缩）。
还原：见 `sql/README.md`。

---

## 6. 充值/注册/GM 关键设计

- 注册：写 `GameDBArea.dbo.account`，密码 = 小写 SHA1 40 位，`SERIALIZABLE` 事务 + 键范围锁防并发重名。
- 点券：调官方 `PrGs_GameUser_Points_Add`，落 `GameDB.dbo.Actor.Point`。
- 金币/礼包：走游戏内邮件 `PrGs_GameEmail_Add_V5`，**不要直接改 `Actor.HoldMoney`**（在线角色会被内存覆盖）。
- 订单：`PayCenter.dbo.WebRechargeOrder`，个人收款码 + 后台人工确认；后台确认后才发放。
- GM 后台：`/pay/gm.aspx`，与充值后台同一密码；物品目录 `GameDB.dbo.GM_ItemCatalog`；发放也走系统邮件。
- 限购：礼包每角色 1 次；待支付订单 30 分钟内占名额，超时释放。

详细流程见 `docs/充值网站-部署说明.md`、`docs/账号注册网页-部署说明.md`、`docs/GM发放后台说明.md`。

---

## 7. 迁移验收清单

- [ ] 6 个数据库全部还原，`GameDBArea.dbo.account` 与 `GameDB.dbo.Actor` 有数据
- [ ] `git clone` 成功，`D:\git\work` 约 7 MB，`shared/scp` 等目录齐全
- [ ] IIS 站点绑定 `*:35179`，物理路径 `C:\ShareFiles`
- [ ] `/register/`、`/pay/`、`/pay/admin.aspx`、`/pay/gm.aspx` 均 HTTP 200
- [ ] 注册一个测试账号，登录器能进游戏
- [ ] 充值站下 1 元订单 → 后台确认 → 点券到账
- [ ] GM 后台给测试角色发 1 个物品 → 游戏邮箱收到
- [ ] 发布站任意 `.cse/.res/.scp/.ini` 文件 HTTP 200（不是 404.3）
- [ ] 登录器能拉更新（`scp.txt` 的 `bb` 正确）
- [ ] 计划任务 3 个都在，`deploy.log`、`db_backup.log` 有成功记录
- [ ] 新服务器 IP 已替换所有 `config.ini` / `list.ini` / `AdminUrl`
- [ ] 后台密码已重设，收款码已放，微信提醒测试成功
- [ ] 1433 未对公网开放；RDP 已限 IP；后台 `AdminAllowIps` 已设

---

## 8. 已知坑（血泪版，详细见 `docs/英雄岛改文件经验总结（给A端AI）.md`）

1. `.cse/.res` 只能用官方 `Encrypt.exe` 或 `tools/yxd_crypt.py`，禁止自写 XOR。
2. 解密出的 CSV **不能 `splitlines()` 重排**，必须字节精确替换 + 回环校验。
3. 表里不能有重复 ID；不能出现双回车 `\r\r`，否则整张表装载失败。
4. 服务端 Lua 必须 **GBK**；PowerShell 脚本要 **UTF-8 BOM**（PS 5.1 才认中文）。
5. `.aspx/.js/.cs` 也要 UTF-8 BOM，否则 ASP.NET 中文乱码。
6. 发布站 `.ini` 是 GBK；`web.config` 的 `AdminUrl` 换 IP 必改。
7. IIS MIME 不加 `*` 通配，`.cse/.res/.scp/.dat` 全部 404.3。
8. `C:\ShareFiles` 根目录不能放 `.aspx/.ashx`，会被执行。
9. `robocopy` 永远 `/E`，不要 `/MIR`。
10. 金币/礼包走邮件，不要直接改角色内存里的钱。
11. SQL Express 没有 Agent，备份靠计划任务；备份不能压缩。
12. 旧机 `[99]一键停止.bat` 里还有 `MSSQL$JSQL2008` 的停止/删除命令，当前实例是 `SQLEXPRESS`，别误以为它会停当前库。

---

## 9. 文档索引

| 文档 | 内容 |
|---|---|
| `websites/README.md` | 注册/充值/GM 网站部署、配置、自检 |
| `sql/README.md` | 数据库清单、权限、备份还原 |
| `docs/充值网站-部署说明.md` | 充值站完整业务流程、订单表、礼包 |
| `docs/账号注册网页-部署说明.md` | 注册站、密码格式、字段、IIS 配置 |
| `docs/GM发放后台说明.md` | GM 后台四个功能、发放规则 |
| `docs/邮件与点券发放说明.md` | 邮件/点券/金币/礼包底层细节 |
| `docs/自动部署-已上线（给A端）.md` | 自动部署上线记录 |
| `docs/服务器远程维护与部署方案.md` | 远程维护、架构、编辑铁律 |
| `docs/远程维护与部署方案_v2（测试环境）.md` | v2 方案 |
| `docs/英雄岛改文件经验总结（给A端AI）.md` | 改表/Lua 的完整经验 |
| `docs/20260929-给A-圣兽守护Effect.res装载失败修复与经验.md` | Effect.res 修复案例 |
| `docs/双端文件比对报告.md` | 客户端/服务端文件差异报告 |
| `docs/SQL数据库导入报告.md` | 数据库导入记录 |
| `docs/IIS文件下载服务器-搭建说明.md` | IIS 发布站搭建（历史端口，按本文件为准） |

---

## 10. 关服前最终检查（照着做）

1. 跑一次 `db_backup.ps1`，确认 6 个 `.bak` 都有且大小正常。
2. 把 `D:\Backup\最新日期\` 拷到**两台**不同设备/网盘。
3. 把 `D:\Server\`、客户端目录、`C:\ShareFiles\` 打包拷走（或确认新服务器已有同样的包）。
4. 把 `C:\PayApp\App_Data\`、`C:\PayApp\qr\` 单独拷走。
5. 确认 `git status` 干净，`git log` 里有本次迁移提交，且已 push 到 GitHub。
6. 在 GitHub 网页上确认 `MIGRATION.md`、`websites/`、`sql/` 能看到。
7. 新服务器按第 3 节跑通，再关旧服务器。
