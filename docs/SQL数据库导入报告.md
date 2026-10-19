# SQL Server 2012 Express 安装 + 数据库导入报告

生成时间：2026-09-21 23:5x（本机 C20260921206908 / Windows Server 2022 Datacenter build 20348）

## 一、安装失败根因与修复

| 项 | 内容 |
| --- | --- |
| 失败现象 | 所有失败功能（SSMS、RS、数据库引擎、全文检索、复制）均报 `Microsoft .NET Framework 3.5` 依赖失败，`0x85940001` |
| 真实原因 | 启用 Windows 功能 NetFx3 时返回错误 `1058`（服务已被禁用）。本机 `wuauserv`（Windows Update）StartType=4，而 Server 2022 上 NetFx3 负载为 `DisabledWithPayloadRemoved`，必须联网抓取 |
| 修复 1 | `sc config wuauserv start= demand` + `sc start wuauserv`（仅改启动类型，可逆） |
| 修复 2 | `Dism /Online /Enable-Feature /FeatureName:NetFx3 /All` → 100% 成功，复核 `NetFx3 = Enabled`，`NDP\v3.5` Install=1 / SP=1 / 3.5.30729.5003 |
| 注意 | 直接用注册表改 Start 值 SCM 不认（仍返回 1058），必须用 `sc config` / `Set-Service` 通知 SCM |
| 重启 | 23:29:47 重启后重新运行静默安装，全部功能安装成功 |

安装结果（实例 `MSSQL11.SQLEXPRESS`）：

| 服务 | 状态 | 启动类型 |
| --- | --- | --- |
| MSSQL$SQLEXPRESS | Running | Automatic |
| ReportServer$SQLEXPRESS | Running | Automatic |
| SQLBrowser | Running | Automatic |
| SQLWriter | Running | Automatic |

版本：`Microsoft SQL Server 2012 - 11.0.2100.60 (X64) Express Edition (64-bit)`

## 二、数据库导入

源文件：`D:\六星魂器英雄岛加修复交易所数据库\数据库\数据库`（未改动原件）
副本目录：`D:\SQLData`（已授予 `NT SERVICE\MSSQL$SQLEXPRESS` 完全控制）
方式：`CREATE DATABASE ... FOR ATTACH`，原库为 SQL 2008 R2（版本 661），已自动升级到 706。

| 数据库 | 挂载 | 表数 | 数据文件 |
| --- | --- | --- | --- |
| GameDB | 成功 | 39 | GameDB.mdf + GameDB_1.ldf |
| GameDBArea | 成功 | 4 | GameDBArea.mdf + GameDBArea_log.ldf |
| GameDB_Log | 成功 | 0（空库） | GameDB_Log.mdf + GameDB_Log_log.ldf |
| PayCenter | 成功 | 2（无数据） | PayCenter.mdf + PayCenter_log.ldf |
| UserActive | 成功 | 0（空库） | UserActive.mdf + UserActive_log.ldf |
| UserCenter | 成功 | 3（无数据） | UserCenter.mdf + UserCenter_log.ldf |

未挂载：`MSDBData.mdf / MSDBLog.ldf` —— 这是 SQL Server 自带的 msdb 系统库文件，不能作为用户库挂载。

## 三、内容概览

### GameDB（主要游戏数据）

| 表 | 行数 | 说明 |
| --- | --- | --- |
| GameActor_Master | 27613 | 主号/师徒关系表，Type=0 共 27609 行（ActorID 10000~37608） |
| GameActor_MasterReg | 27609 | 拜师登记时间 |
| GameActor_Nick | 3264 | 昵称数据（BufData 二进制打包，CurNickID/OwnedNum/KnownNum 可见） |
| Goods | 179 | 背包物品（GoodsBuf 二进制，每行 3888 字节） |
| Interact | 112 | 交互对象数据（二进制） |
| GameEmail | 85 | 系统邮件，如"英雄王的邀请""中秋活动赠送""上周夺宝奇兵第一名"，发件人 ActorID=-2（系统），时间集中在 2019-10 |
| Actor | 19 | 角色表（59 字段，含外形二进制），角色名如 GM / 小怪兽来啦 / 打不过就跑 等，服务器名"五杀" |
| Relation | 8 | 好友/关系 |
| GameMapGround | 4 | 地图占用地块（MapID 17/86/19/85，均为 0） |
| BourseInfo | 4 | 拍卖行挂单：ActorID 10002，商品"特制金属"(89199)，单价 111，数量 1 |
| House | 3 | 房屋（ActorID 10003/10006/10027，HouseName=house，等级 0） |
| 其余 26 张表 | 0 | 行会、战场、排名、交易等表为空壳 |

### GameDBArea（账号库）

`account` 表 18 条账号，UserID 5681~5699，UserName 形如 `1337577059`、`ay632549703`、`qwe123`、`zxc54321` 等，均为 UserType=0。另有 `AreaSecPsw`、`GameGm_OpLog_Area`、`GameUser_Kill_Area` 空表。
注意：`account.PassWord` / `SecPsw` / `ActorPsw` 为密码字段，报告中未导出明文。

### 其他库

`GameDB_Log`、`UserActive` 无任何表；`PayCenter`(GameUser_Goods / GameUser_Points)、`UserCenter`(account / Actor / Validate_Matrix) 有表结构但无数据。

## 四、连接方式

```
服务器: .\SQLEXPRESS   （或 C20260921206908\SQLEXPRESS）
认证:   Windows 身份验证（当前 Administrator 为 sysadmin）或 SQL 登录 sa
协议:   TCP 已启用，SQL Browser 已自动启动（命名实例可被解析）
```

sqlcmd 路径：`C:\Program Files\Microsoft SQL Server\110\Tools\Binn\sqlcmd.exe`

## 五、数据清理（为新开服准备空库）

执行时间：2026-09-21 23:59 ~ 2026-09-22 00:0x
备份：

| 备份文件 | 大小 | 说明 |
| --- | --- | --- |
| D:\SQLBackup\GameDB_before_wipe.bak | 12.8 MB | 清空前的 GameDB（含 58903 行数据） |
| D:\SQLBackup\GameDBArea_before_wipe.bak | 2.6 MB | 清空前的 GameDBArea（18 个账号） |

还原方式：`RESTORE DATABASE [GameDB] FROM DISK=N'D:\SQLBackup\GameDB_before_wipe.bak' WITH REPLACE`（需先断开连接）。

用 `TRUNCATE TABLE` 清空（保留结构、重置自增）：

| 库 | 表 |
| --- | --- |
| GameDB | GameActor_Master、GameActor_MasterReg、GameActor_Nick、Goods、Interact、GameEmail、Actor、Relation、GameMapGround、GameMapScopes、House、Relation_OffMsg |
| GameDBArea | account |

保留（按用户要求暂不清）：`GameDB.BourseInfo` 4 条测试挂单（ActorID 10002 / 商品 89199 特制金属 / 单价 111）。

清理后校验：

| 库 | 结果 |
| --- | --- |
| GameDB | 仅 BourseInfo 4 行；39 张表 / 1029 字段 / 123 索引结构完好 |
| GameDBArea | account 0 行，4 张表结构保留 |
| GameDB_Log / UserActive / PayCenter / UserCenter | 全空（本来就无数据） |

## 六、启动报错排查与修复（2026-09-22 00:25）

服务端运行目录：`D:\Server\server`（CenterServer / GameServer / LoginServer / SvrMgrServer / VestibuleServer）

### 现象

```
[2026-09-22 00:22:05]: CResControlPlugin::OnRet,DB返回的数据结构不对?
[2026-09-22 00:22:06]: Idip World Server(127.0.0.1:6007) disconnect,5 seconds reconnect
```

### 结论：与数据清理无关

1. `ResControl` 表不在清理清单内，导入后本来就是 0 行。
2. 同样的两条报错在**原端 2017 年的日志**里一字不差地出现过（`D:\Server\server\Center\Log\Log.txt` 中 Idip 最早 2017-06-25 15:54:49，ResControl 最早 2017-06-26 09:19:31）。
3. 插件本身装载成功：`装载插件 ResControlPlugin_Plug.dll 成功!`

### 真正原因

中心服通过存储过程 `PrGs_ResControl_Get`（定义见 `D:\Server\server\Vestibule\Scp\DBRequest.res.txt` request=300）读取资源控制信息。该过程在表里找不到对应 Type 时会自己插入一行，但 INSERT 没有提供 `ID`；而 `ResControl.ID` 是 `uniqueidentifier NOT NULL` 且**没有默认值**，于是插入失败：

```
ReturnCode = -1
@ChvMsg = PrGs_ResControl_Get line=18, err_msg=不能将值 NULL 插入列 'ID'，表 'GameDB.dbo.ResControl'；列不允许有 Null 值。INSERT 失败。
```

客户端拿到的是失败结构，于是报“DB返回的数据结构不对?”。

同类隐患：`Goods_Auction.ID`、`CDKeyCode_Award.ID`（同为 NOT NULL 且无默认值）——拍卖行挂单、激活码发奖一旦走到插入路径会报同样的错。

### 修复

先备份（`D:\SQLBackup\GameDB_before_fix_defaults.bak`），再给三个列加默认值：

```sql
ALTER TABLE [dbo].[ResControl]      ADD CONSTRAINT [DF_ResControl_ID]      DEFAULT (newid()) FOR [ID];
ALTER TABLE [dbo].[Goods_Auction]   ADD CONSTRAINT [DF_Goods_Auction_ID]   DEFAULT (newid()) FOR [ID];
ALTER TABLE [dbo].[CDKeyCode_Award] ADD CONSTRAINT [DF_CDKeyCode_Award_ID] DEFAULT (newid()) FOR [ID];
```

验证（事务内调用后回滚，不留数据）：`ReturnCode = 1`，`@DataBuffer` 返回 340 字节，`@ChvMsg = PrGs_ResControl_Getok`。

### 另一条日志

`Idip World Server(127.0.0.1:6007) disconnect` 是中心服在连 IDIP 服务器（本机没有该服务），每 7 秒重连一次；原端一直如此，单机/小服不需要 IDIP，属正常噪音。

### 备份清单

| 文件 | 大小 | 说明 |
| --- | --- | --- |
| D:\SQLBackup\GameDB_before_wipe.bak | 12.8 MB | 清空数据前 |
| D:\SQLBackup\GameDBArea_before_wipe.bak | 2.6 MB | 清空账号前 |
| D:\SQLBackup\GameDB_before_fix_defaults.bak | 4.7 MB | 加默认值前 |


