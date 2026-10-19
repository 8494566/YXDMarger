# 网站源码与部署说明（注册 / 充值 / GM）

本目录是旧服务器 `C:\RegApp`、`C:\PayApp` 的完整源码快照（已排除日志、运行态密钥、收款码图片）。
目标：在新 Windows Server 上按本文从零部署，行为与旧服一致。

---

## 1. 目录

| 路径 | 对应线上目录 | 说明 |
|---|---|---|
| `pay/` | `C:\PayApp` | 充值站 `/pay/`、后台 `/pay/admin.aspx`、GM 发放 `/pay/gm.aspx`、订单查询 `/pay/order.aspx` |
| `reg/` | `C:\RegApp` | 账号注册 `/register/`，含图形验证码 `captcha.ashx` |
| `deploy/deploy-pay.ps1` | — | 建 PayApp 应用池、IIS 应用、ACL、SQL 登录/授权、订单表 |
| `deploy/deploy-reg.ps1` | — | 建 RegApp 应用池、IIS 应用、ACL、SQL 登录/授权、写 web.config |
| `deploy/install-aspnet.ps1` | — | 安装 IIS ASP.NET 4.5 相关功能 |
| `deploy/fix-mime.ps1` | — | 发布站 MIME 通配兜底 + 全量 HTTP 自检（按实际端口/目录改顶部变量） |
| `deploy/change-port.ps1` | — | 改 IIS 站点端口 + 防火墙规则的示例 |

运行态目录（**不在 git 里**，部署时自动创建或手工放）：

- `C:\PayApp\App_Data\admin.dat`：后台密码 PBKDF2 哈希，用 `pay/tools/set-admin-password.ps1` 生成。
- `C:\PayApp\App_Data\notify.txt`：微信到账提醒 token，用 `pay/tools/set-notify.ps1` 录入。
- `C:\PayApp\qr\*.JPG`：支付宝/微信收款码，手工放入。
- `C:\PayApp\logs\`、`C:\RegApp\logs\`：按月日志。

---

## 2. 环境要求

- Windows Server 2019/2022，管理员权限
- IIS 10 + ASP.NET 4.5（.NET Framework 4.8 自带）
- SQL Server 2012 Express 及以上，实例 `.\SQLEXPRESS`，TCP 1433（**只本机访问，不对公网开放**）
- 站点使用 **Windows 集成认证**，配置文件里没有数据库密码

安装 IIS 功能：

```powershell
Install-WindowsFeature -Name Web-Server,Web-Default-Doc,Web-Dir-Browsing,Web-Static-Content,Web-Http-Logging,Web-Filtering,Web-Mgmt-Console -IncludeManagementTools
powershell -ExecutionPolicy Bypass -File .\deploy\install-aspnet.ps1
```

---

## 3. 部署注册站

```powershell
# 1) 先把 reg/ 内容复制到 C:\RegApp（或直接让脚本从本目录读）
New-Item -ItemType Directory -Force C:\RegApp | Out-Null
Copy-Item .\reg\* C:\RegApp\ -Recurse -Force

# 2) 建应用池 / IIS 应用 / ACL / SQL 授权
powershell -ExecutionPolicy Bypass -File .\deploy\deploy-reg.ps1
```

脚本会写入 `C:\RegApp\web.config`（注意：脚本写出的 web.config 是正常中文；仓库里的 `reg/web.config` 是旧机原始文件，编码可能为 GBK，部署时以脚本生成或 UTF-8 BOM 版本为准）。

关键点：

- 应用池 `RegApp`：`.NET CLR v4.0`、`Integrated`、`ApplicationPoolIdentity`、`AlwaysRunning`
- IIS 应用 `/register` → `C:\RegApp`
- SQL：`GameDBArea.dbo.account` 只授 `SELECT, INSERT`
- 密码格式：**小写 SHA1 十六进制（40 位）**，注册页写入 `PassWord` 与 `SecPsw`

---

## 4. 部署充值站

```powershell
New-Item -ItemType Directory -Force C:\PayApp | Out-Null
Copy-Item .\pay\* C:\PayApp\ -Recurse -Force
New-Item -ItemType Directory -Force C:\PayApp\App_Data,C:\PayApp\logs,C:\PayApp\qr | Out-Null

powershell -ExecutionPolicy Bypass -File .\deploy\deploy-pay.ps1
```

脚本会：

- 给 `.aspx` / `.js` / `.cs` / `tools\*.ps1` 补 UTF-8 BOM
- 建应用池 `PayApp`（v4.0 / Integrated / ApplicationPoolIdentity）
- 建 IIS 应用 `/pay` → `C:\PayApp`
- 给 `App_Data`、`logs` 授 `Modify`，根目录 `ReadAndExecute`
- 建 `IIS APPPOOL\PayApp` 登录名，授 `PayCenter.WebRechargeOrder`、`GameDB.Actor`、两个官方存储过程
- 建 `PayCenter.dbo.WebRechargeOrder`
- 回收应用池

部署后必须做的三件事：

```powershell
# 1) 收款码：把支付宝/微信收款码图片放进 C:\PayApp\qr\（alipay.JPG / wx.JPG 等）
# 2) 后台密码
powershell -ExecutionPolicy Bypass -File C:\PayApp\tools\set-admin-password.ps1
# 3) 微信到账提醒（可选）
powershell -ExecutionPolicy Bypass -File C:\PayApp\tools\set-notify.ps1
```

---

## 5. 配置项（`pay/web.config`）

| key | 作用 | 换服务器要改 |
|---|---|---|
| `PayCenter` 连接串 | 本机 `127.0.0.1,1433`，集成认证 | 一般不用 |
| `ShopName` | 页面标题 | 可选 |
| `RatePointsPerYuan` / `RateGoldPerYuan` | 1 元 = 10000 点券 / 500000 金币 | 按运营改 |
| `MinYuan` / `MaxYuan` | 单笔金额范围 | 可选 |
| `AlipayQrImage` | 收款码相对路径 | 一般不用 |
| `AdminAllowIps` | 后台 IP 白名单，支持 `1.2.3.*`，空=不限 | **强烈建议设置** |
| `AdminUrl` | 微信提醒里的后台链接 | **必须改成新 IP/域名** |
| `GiftPacks` | 礼包 `GoodsID\|名称\|价格\|描述\|数量`，分号分隔 | 按运营改 |
| `PackLimitPerActor` / `PackPendingMinutes` | 礼包限购/占用超时 | 可选 |
| `NotifyProvider` | `serverchan` / `pushplus` / `wecom` | 用脚本录入 token 时自动写 |

注册站 `reg/web.config`：

| key | 作用 |
|---|---|
| `GameDBArea` 连接串 | 本机 `127.0.0.1,1433`，集成认证 |
| `RegisterTable` | `GameDBArea.dbo.account` |
| `CaptchaMode` | `image` 图形验证码 / `off` 关闭 |

---

## 6. 三个入口与职责

| 地址 | 文件 | 说明 |
|---|---|---|
| `/register/` | `reg/Default.aspx` | 玩家注册；写 `GameDBArea.dbo.account` |
| `/pay/` | `pay/Default.aspx` | 玩家下单；按角色名/ID 查角色，选点券/金币/礼包 |
| `/pay/order.aspx` | `pay/order.aspx` | 玩家按订单号查进度 |
| `/pay/admin.aspx` | `pay/admin.aspx` | 管理员确认到账、发放、取消、查余额 |
| `/pay/gm.aspx` | `pay/gm.aspx` | GM 发放物品/金币，查角色，查物品目录 |

后台密码只存 PBKDF2（60000 次迭代 + 16 字节盐）到 `App_Data\admin.dat`，不存明文；首次设置只允许 localhost。

---

## 7. 发放落点（必须理解）

| 类型 | 落点 | 调用 |
|---|---|---|
| 点券 | `GameDB.dbo.Actor.Point` | 官方存储过程 `PrGs_GameUser_Points_Add` |
| 金币 | `GameDB.dbo.GameEmail`（游戏内邮件） | `PrGs_GameEmail_Add_V5`，`@FromActorID=0` 系统通道 |
| 礼包 | `GameDB.dbo.GameEmail`（附件） | 同上，`GoodsBuf` = 8 字节头 + 每格 105 字节 |
| 订单 | `PayCenter.dbo.WebRechargeOrder` | 本系统表 |

金币/礼包**不要直接改 `Actor.HoldMoney`**：角色在线时会被服务器内存覆盖。走邮件是这套引擎的正确通路。

---

## 8. 自检（部署完逐条过）

```powershell
# 站点状态
Get-WebApplication | Format-Table Path,PhysicalPath,ApplicationPool
Get-WebAppPoolState RegApp,PayApp

# HTTP 200
Invoke-WebRequest http://127.0.0.1:35179/register/ -UseBasicParsing | Select StatusCode
Invoke-WebRequest http://127.0.0.1:35179/pay/ -UseBasicParsing | Select StatusCode
Invoke-WebRequest http://127.0.0.1:35179/pay/admin.aspx -UseBasicParsing | Select StatusCode
Invoke-WebRequest http://127.0.0.1:35179/pay/gm.aspx -UseBasicParsing | Select StatusCode

# SQL 权限
sqlcmd -S .\SQLEXPRESS -E -Q "SELECT name FROM sys.server_principals WHERE name LIKE 'IIS APPPOOL%'"
sqlcmd -S .\SQLEXPRESS -E -d PayCenter -Q "SELECT COUNT(*) FROM dbo.WebRechargeOrder"
```

功能测试：注册一个测试账号 → 登录器能登录 → 充值站下一个 1 元订单 → 后台确认 → 游戏内点券到账；GM 后台给测试角色发 1 个物品 → 邮箱能收到。

---

## 9. 端口 / MIME / 安全

- 当前站点绑定：`http *:35179`，物理路径 `C:\ShareFiles`，两个子应用 `/register`、`/pay`。
- 发布站必须加 MIME 通配兜底，否则 `.cse/.res/.scp/.dat/.ini` 会 404.3：

```powershell
& $env:windir\system32\inetsrv\appcmd.exe set config "Default Web Site" /section:staticContent "/+[fileExtension='*',mimeType='application/octet-stream']" /commit:apphost
& $env:windir\system32\inetsrv\appcmd.exe set config "Default Web Site" /section:staticContent "/+[fileExtension='.ini',mimeType='text/plain']" /commit:apphost
```

- `C:\ShareFiles` 根目录不要放 `.aspx/.ashx`：装了 ASP.NET 后 IIS 会**执行**它们而不是下载。
- 换端口用 `deploy/change-port.ps1`，注册页内部全是相对路径，不用改代码。
- 公网只放行必要端口；1433 不要对公网开放；后台建议设 `AdminAllowIps`。
- 全站目前是 HTTP 明文。有域名/证书后建议上 HTTPS，后台密码和玩家信息不再裸奔。

---

## 10. 敏感文件清单（不要提交到 git）

- `C:\PayApp\App_Data\admin.dat`（密码哈希，含盐）
- `C:\PayApp\App_Data\notify.txt`（推送 token）
- `C:\PayApp\qr\*.JPG`（收款码）
- `C:\PayApp\logs\`、`C:\RegApp\logs\`（玩家 IP/账号/订单信息）
- 数据库备份 `D:\Backup\`
- `D:\deploy\ssh\yxd_deploy`（GitHub 部署私钥）

本仓库已用 `.gitignore` 排除 `*.log`、`*.bak`、`*.exe`、`*.zip`、`*.rar`，但上述运行态文件本来就没有复制进来。
