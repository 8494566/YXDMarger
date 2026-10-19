# SQL 脚本与数据库说明

## 1. 数据库清单

| 库 | 用途 | 是否必须 |
|---|---|---|
| `GameDB` | 游戏主库：角色、邮件、点券、物品目录 | 必须 |
| `GameDB_Log` | 游戏日志库 | 必须（游戏服会写） |
| `GameDBArea` | 账号库：`dbo.account` | 必须 |
| `UserCenter` | 账号中心 | 必须 |
| `UserActive` | 活跃/活动数据 | 必须 |
| `PayCenter` | 充值订单库（本系统新建） | 必须 |

实例：`.\SQLEXPRESS`，TCP 1433（只本机），Windows 集成认证。
备份脚本：`tools/db_backup.ps1`，每天 04:00 全量备份到 `D:\Backup\yyyyMMdd\`，保留 14 天。

## 2. 本目录文件

| 文件 | 作用 | 何时执行 |
|---|---|---|
| `PayCenter_WebRechargeOrder.sql` | 建订单表 + 两个 IIS 应用池的登录名/用户/授权 | 新服务器部署网站时执行一次 |
| `gm/GM_ItemCatalog.sql` | 建 `GameDB.dbo.GM_ItemCatalog` 并导入 4967 条物品目录 | GM 后台需要“查物品”时执行 |
| `gm/补存储过程.sql` | 邮件/点券相关的官方存储过程补充 | 还原数据库后若缺过程才执行 |
| `gm/全服发点券.sql` | 全服发点券的运维脚本（按需改参数） | 运营操作时手工执行 |
| `gm/GM_MailAll.lua` | 游戏内全服邮件 Lua（放到服务端 `Lua` 对应目录） | 需要游戏内全服邮件时 |

## 3. 执行方式

```powershell
# 订单表 + 授权
sqlcmd -S .\SQLEXPRESS -E -i .\PayCenter_WebRechargeOrder.sql

# GM 物品目录（会先 DROP 再建，可重复执行）
sqlcmd -S .\SQLEXPRESS -E -i .\gm\GM_ItemCatalog.sql

# 检查
sqlcmd -S .\SQLEXPRESS -E -Q "SELECT DB_NAME(), COUNT(*) FROM GameDB.dbo.GM_ItemCatalog"
```

## 4. 权限模型（最小权限）

| 身份 | 库 | 权限 |
|---|---|---|
| `IIS APPPOOL\RegApp` | `GameDBArea` | `SELECT, INSERT` on `dbo.account` |
| `IIS APPPOOL\PayApp` | `PayCenter` | `SELECT, INSERT, UPDATE` on `dbo.WebRechargeOrder` |
| `IIS APPPOOL\PayApp` | `GameDB` | `SELECT` on `dbo.Actor`、`dbo.GM_ItemCatalog`；`EXECUTE` on `PrGs_GameUser_Points_Add`、`PrGs_GameEmail_Add_V5` |

没有给 `db_owner`，没有 `sa`，没有明文密码。

## 5. 备份 / 还原

```powershell
# 手动备份
powershell -ExecutionPolicy Bypass -File .\tools\db_backup.ps1

# 还原（示例：GameDB）
sqlcmd -S .\SQLEXPRESS -E -Q "RESTORE DATABASE [GameDB] FROM DISK=N'D:\Backup\20261019\GameDB.bak' WITH REPLACE"
```

注意：

- SQL Server 2012 Express **不支持备份压缩**，备份脚本没加 `WITH COMPRESSION`。
- 高版本备份不能还原到低版本；新服务器版本 ≥ 旧服务器即可。
- 还原后要重新确认 `IIS APPPOOL\*` 用户和权限仍在（数据库用户可能随备份带过来，但服务器登录名要重建）。
- 还原顺序建议：`GameDB_Log` → `GameDBArea` → `UserCenter` → `UserActive` → `GameDB` → `PayCenter`；游戏服启动前确认连接串指向本机。

## 6. 重要的库内对象

- `GameDBArea.dbo.account`：`UserID` 自增，`UserName varchar(32)`，`PassWord varchar(40)` 小写 SHA1，`SecPsw` 同值。
- `GameDB.dbo.Actor`：角色主表（`ActorID`、`Name`、`Point`、`HoldMoney` 等）。
- `GameDB.dbo.GameEmail`：游戏内邮件（金币/物品附件都走这里）。
- `GameDB.dbo.PrGs_GameUser_Points_Add`：官方加点券过程。
- `GameDB.dbo.PrGs_GameEmail_Add_V5`：官方发邮件过程。
- `PayCenter.dbo.WebRechargeOrder`：充值订单（字段含义见建表脚本注释）。
