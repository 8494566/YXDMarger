/* =============================================================================
   充值系统订单表（PayCenter）
   来源：C:\PayApp 部署时的实际 DDL（deploy-pay.ps1）
   适用：SQL Server 2012 Express 及以上
   说明：只建表 + 索引 + 授权，不动其他库的表结构。
   ============================================================================= */
USE [PayCenter];
GO

IF OBJECT_ID('dbo.WebRechargeOrder') IS NULL
BEGIN
    CREATE TABLE dbo.WebRechargeOrder (
        OrderNo     varchar(32)   NOT NULL CONSTRAINT PK_WebRechargeOrder PRIMARY KEY,
        UserID      int           NOT NULL,
        ActorID     int           NOT NULL,
        ActorName   varchar(18)   NOT NULL,
        Currency    tinyint       NOT NULL,   -- 1=点券 2=金币
        AmountYuan  decimal(10,2) NOT NULL,
        GrantAmount bigint        NOT NULL,
        Status      tinyint       NOT NULL,   -- 0待支付 1待确认 2发放中 3已发放 4已取消
        PayTradeNo  nvarchar(64)  NULL,
        CreateIp    varchar(16)   NOT NULL,
        CreateTime  datetime      NOT NULL CONSTRAINT DF_WRO_CreateTime DEFAULT (GETDATE()),
        PaidTime    datetime      NULL,
        GrantTime   datetime      NULL,
        GrantResult nvarchar(256) NULL
    );
    CREATE INDEX IX_WRO_Status ON dbo.WebRechargeOrder (Status, CreateTime DESC);
    CREATE INDEX IX_WRO_Actor  ON dbo.WebRechargeOrder (ActorName);
END
GO

/* -----------------------------------------------------------------------------
   授权：两个 IIS 应用池身份都需要访问。
   SQL Server 2012 的 CREATE LOGIN FROM WINDOWS 必须先在实例级建登录名，
   再在目标库建用户，最后授对象权限。
   ----------------------------------------------------------------------------- */
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = N'IIS APPPOOL\PayApp')
    CREATE LOGIN [IIS APPPOOL\PayApp] FROM WINDOWS;
GO

USE [PayCenter];
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'IIS APPPOOL\PayApp')
    CREATE USER [IIS APPPOOL\PayApp] FOR LOGIN [IIS APPPOOL\PayApp];
GRANT SELECT, INSERT, UPDATE ON dbo.WebRechargeOrder TO [IIS APPPOOL\PayApp];
GO

USE [GameDB];
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'IIS APPPOOL\PayApp')
    CREATE USER [IIS APPPOOL\PayApp] FOR LOGIN [IIS APPPOOL\PayApp];
GRANT SELECT ON dbo.Actor TO [IIS APPPOOL\PayApp];
GRANT SELECT ON dbo.GM_ItemCatalog TO [IIS APPPOOL\PayApp];
GRANT EXECUTE ON dbo.PrGs_GameUser_Points_Add TO [IIS APPPOOL\PayApp];
GRANT EXECUTE ON dbo.PrGs_GameEmail_Add_V5  TO [IIS APPPOOL\PayApp];
GO

/* 注册页使用的账号库授权（deploy-reg.ps1 也会做，这里留一份可手工执行） */
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = N'IIS APPPOOL\RegApp')
    CREATE LOGIN [IIS APPPOOL\RegApp] FROM WINDOWS;
GO
USE [GameDBArea];
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'IIS APPPOOL\RegApp')
    CREATE USER [IIS APPPOOL\RegApp] FOR LOGIN [IIS APPPOOL\RegApp];
GRANT SELECT, INSERT ON dbo.[account] TO [IIS APPPOOL\RegApp];
GO
