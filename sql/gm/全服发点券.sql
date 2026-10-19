/* =====================================================================
   英雄岛服务端 —— 全服发放点券 / 邮件相关 SQL
   实例: .\SQLEXPRESS   数据库: GameDB
   重要: 直接改 Point 只对“离线角色”有效。在线角色的数据在服务端内存里，
         会被定时存盘覆盖（Server1\config.ini 里 TimeSave=10 秒）。
         所以要么先让玩家全部下线，要么用邮件方式（见 GM_MailAll.lua）。
   ===================================================================== */

USE GameDB;
GO

/* ---------- 0. 建议: 打开 CLR（解决“邮箱领不了东西”） ---------- */
-- 教程文档《邮箱不能领东西教程.docx》就是做的这一步。当前 clr enabled = 0。
-- 需要在 master 下执行一次，执行后重启 SQL 服务或在 SSMS 新开查询即可。
/*
USE master;
GO
EXEC sp_configure 'show advanced options', 1; RECONFIGURE;
EXEC sp_configure 'clr enabled', 1;           RECONFIGURE;
GO
*/


/* ---------- 1. 现状：看看全服角色和点券 ---------- */
SELECT ActorID, ActorName, Sex, CampID, ExploitLevel,
       HoldMoney AS 金币, Point AS 点券, ShoppingMoney AS 购物币,
       HaveNewEmailFlag AS 有新邮件, LastTime AS 最后在线
FROM dbo.Actor
ORDER BY ActorID;


/* ---------- 2. 全服每人 +1000 点券（改成你要的数量） ---------- */
-- 点券上限 99999999（8个9），超过不显示。
BEGIN TRAN;

UPDATE dbo.Actor
SET Point = CASE WHEN Point + 1000 > 99999999 THEN 99999999
                 ELSE Point + 1000 END
WHERE ActorID > 0;                 -- 只给真人角色，避免误伤系统ID

SELECT @@ROWCOUNT AS 已发放角色数;

-- 核对没问题再提交；有问题就把 COMMIT 换成 ROLLBACK
COMMIT TRAN;
-- ROLLBACK TRAN;
GO


/* ---------- 2b. 只给指定角色发 ---------- */
/*
UPDATE dbo.Actor SET Point = Point + 1000
WHERE ActorName IN ('将五一','无双','冰镇的油罐车','风起','神避');
*/


/* ---------- 3. 复核 ---------- */
SELECT ActorID, ActorName, Point AS 点券 FROM dbo.Actor ORDER BY ActorID;


/* ---------- 4. 邮件表结构与查看 ---------- */
-- FromActorID : 发件人角色ID；< 1000 视为系统邮件（不受10秒限频、不受维护拦截）
-- ToActorName : 收件人角色名（也可用 '#角色ID' 形式）
-- MoneyNum    : 随信金币   AttachNum: 附件格数   GoodsBuf: 附件二进制(525字节)
-- Status      : 0未读 1已读 2已领取
SELECT EmailID, FromActorID, ToActorName, EmailTitle, EmailBody,
       MoneyNum AS 金币, AttachNum AS 附件数, Status, WriteTime
FROM dbo.GameEmail
ORDER BY EmailID DESC;


/* ---------- 5. 手写“纯文字 / 纯金币”邮件（不带附件，可安全直接插） ---------- */
/*
INSERT INTO dbo.GameEmail (FromActorID, ToActorName, EmailTitle, EmailBody,
                           MoneyNum, AttachNum, GoodsBuf, WriteTime, Status, GoodsIcodID)
VALUES (-1,                      -- 系统
        N'将五一',
        N'【补偿】',
        N'全服补偿 10000 金币，请注意查收！',
        10000,                   -- 金币
        0,                       -- 附件数 = 0
        NULL,                    -- 无附件
        GETDATE(), 0, 0);
*/

/* ---------- 6. 带“物品/点券”附件的邮件 ---------- */
-- 不要手写 GoodsBuf。附件是 8字节头 + 每格105字节 的二进制结构，
-- 字段切法见存储过程 PrGs_GameEmail_Open_V1；写错会变成空格子或直接崩。
-- 正确做法二选一：
--   (a) 游戏脚本里用 API_SendActorMailByName(见 GM_MailAll.lua)
--   (b) 调 dbo.PrGs_GameEmail_Add_V5 存储过程（需要先由服务端取到 GoodsBuf）
-- 想知道某个 ID 是什么道具，用下面这张表反查（先导入 工具及教程\魂器端代码大全\*.csv）

/* ---------- 7. 生成“离线群发”用的角色名清单（给 Lua 用） ---------- */
/*
SELECT 'API_SendActorMailByName("' + ActorName + '",80082,1000,1,"【全服补偿】","全服补偿：点券 X 1000")'
FROM dbo.Actor WHERE ActorID > 10000;
*/
