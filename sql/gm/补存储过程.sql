/* 兼容占位存储过程 —— 补齐服务端配置要求但库里缺失的过程
   生成时间: 2026-09-22 13:13:48
   说明: 参数签名严格对齐 Vestibule\Scp\DBRequest.res
         返回 1 = 静默成功(日志类)  /  返回 -1 = 未实现(功能类,保持原有失败行为) */
SET NOCOUNT ON;
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_BourseTradeLog_Get_V2]
  @GoodsID int,
  @RecordNum int OUTPUT,
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @RecordNum = 0;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  DECLARE @t TABLE ([GoodsPrice] int, [GoodsNum] int, [WriteTimeInt] int);
  SELECT * FROM @t;
  RETURN 1;
END
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_InvestResult_Log_Add]
  @UserID int,
  @ActorID int,
  @ActorLevel int,
  @InvestigateID int,
  @BufData binary(240),
  @BufData_2 binary(280),
  @SubjectID_1 int,
  @Answer_1 varchar(256),
  @SubjectID_2 int,
  @Answer_2 varchar(256),
  @SubjectID_3 int,
  @Answer_3 varchar(256),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_OSS_ActorChatInfo_JKAdd]
  @GameServerID smallint,
  @UserID int,
  @ActorID int,
  @RecordNum smallint,
  @ChatInfoBuf binary(2000),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_OSS_ActorLevel_JKAdd_V1]
  @ActorID int,
  @CurLevel tinyint,
  @ActiveHeroID1 tinyint,
  @ActiveHeroID2 tinyint,
  @TimeNum int,
  @OverflowExp int,
  @ConsumeExp int,
  @ConsumeSliver int,
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_OSS_Battle_JKAdd_V3]
  @Nums int,
  @BattleBuffer binary(3600),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_OSS_ExpAndMoney_JKAdd_V1]
  @ActorID int,
  @ReverseID int,
  @LogType tinyint,
  @Nums int,
  @OpBigType tinyint,
  @ApproaSmallType tinyint,
  @StatTime int,
  @Message varchar(32),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_OSS_GameData_JKAdd_V1]
  @Nums smallint,
  @GameBuffer binary(3968),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_OSS_GoodsDeple_JKAdd_V1]
  @Nums int,
  @GoodsBuffer binary(3600),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_OSS_GoodsProce_JKAdd_V1]
  @Nums int,
  @GoodsBuffer binary(3600),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_OSS_GoodsTrade_JKAdd_V6]
  @GoodsID int,
  @Nums int,
  @GoodsItem binary(16),
  @MapID smallint,
  @LocX smallint,
  @LocY smallint,
  @FromActorID int,
  @FromValueType tinyint,
  @ToActorID int,
  @ToValueType tinyint,
  @Approach tinyint,
  @OrderNo binary(16),
  @CurEndure smallint,
  @MaxEndure smallint,
  @Effectbuffer binary(26),
  @SmeltLevel tinyint,
  @UsedCount smallint,
  @Flag tinyint,
  @TradeCount tinyint,
  @ExistsTime int,
  @Messages varchar(16),
  @TradeMoney int,
  @Maker binary(18),
  @AdditionalBuf binary(16),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_OSS_Monster_JKADD_V1]
  @Nums int,
  @MonsterBuffer binary(3600),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_OSS_MoraleGoods_JKAdd]
  @Nums int,
  @GoodsBuffer binary(3600),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_OSS_Task_JKAdd_V1]
  @Nums int,
  @TaskBuffer binary(3600),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
USE [GameDB_Log];
GO
CREATE PROCEDURE [dbo].[PrGs_OSS_Warning_JKAdd]
  @WarningType tinyint,
  @ActorID int,
  @ErrorDesc varchar(128),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
USE [UserActive];
GO
CREATE PROCEDURE [dbo].[PrGs_CDKeyCode_Award]
  @UserID int,
  @ActorID int,
  @ActorLevel int,
  @ServerName varchar(32),
  @CDKeyType int,
  @CDKeyCode varchar(16),
  @IsUsed int,
  @Ip varchar(32),
  @Mac varchar(32),
  @OutCDKeyType int OUTPUT,
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @OutCDKeyType = 0;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 功能类：原库缺失，保持失败返回，避免伪装成功
  RETURN -1;
END
GO
USE [GameDB];
GO
CREATE PROCEDURE [dbo].[PrGs_ActorInfo_SearchDetail]
  @ActorID int,
  @OutActorName varchar(18) OUTPUT,
  @OutExploitLevel int OUTPUT,
  @OutFaceID tinyint OUTPUT,
  @OutSex tinyint OUTPUT,
  @OutMarryFlag tinyint OUTPUT,
  @OutActorInfo varchar(100) OUTPUT,
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @OutActorName = 'compat stub: not implemented';
  SET @OutExploitLevel = 0;
  SET @OutFaceID = 0;
  SET @OutSex = 0;
  SET @OutMarryFlag = 0;
  SET @OutActorInfo = 'compat stub: not implemented';
  SET @ChvMsg = 'compat stub: not implemented';
  -- 功能类：原库缺失，保持失败返回，避免伪装成功
  RETURN -1;
END
GO
USE [GameDB];
GO
CREATE PROCEDURE [dbo].[PrGs_ActorInfo_Update]
  @ActorID int,
  @FaceID tinyint,
  @RelationSet int,
  @ActorInfo varchar(100),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 功能类：原库缺失，保持失败返回，避免伪装成功
  RETURN -1;
END
GO
USE [GameDB];
GO
CREATE PROCEDURE [dbo].[PrGs_GameUser_Points_Get]
  @UserID int,
  @Out_PointsNum int OUTPUT,
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @Out_PointsNum = 0;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 功能类：原库缺失，保持失败返回，避免伪装成功
  RETURN -1;
END
GO
USE [GameDB];
GO
CREATE PROCEDURE [dbo].[PrGs_GameUser_QQPay_Add_V1]
  @UserID int,
  @ActorID int,
  @QQ int,
  @Detuct int,
  @Balance int,
  @Index varchar(40),
  @IP varchar(16),
  @Desc varchar(64),
  @Out_BalancePointNums int OUTPUT,
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @Out_BalancePointNums = 0;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 功能类：原库缺失，保持失败返回，避免伪装成功
  RETURN -1;
END
GO
USE [GameDB];
GO
CREATE PROCEDURE [dbo].[PrGs_PointsUseLog_Add_TW]
  @UserID int,
  @OrderID varchar(33),
  @UsePoints int,
  @UseType int,
  @ActorID int,
  @GoodsID int,
  @GoodsNum int,
  @Status tinyint,
  @IP varchar(15),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 功能类：原库缺失，保持失败返回，避免伪装成功
  RETURN -1;
END
GO
USE [UserCenter];
GO
CREATE PROCEDURE [dbo].[PrGs_UserLogin_V10]
  @LoginType tinyint,
  @UserName varchar(32),
  @PassWord varchar(40),
  @AreaWorld varchar(32),
  @GameWorld varchar(16),
  @Ip varchar(16),
  @SerialNO varchar(20),
  @ToTXZ tinyint OUTPUT,
  @UserID int OUTPUT,
  @TxzName varchar(32) OUTPUT,
  @QQ varchar(32) OUTPUT,
  @PermitPwd varchar(40) OUTPUT,
  @SureCode varchar(40) OUTPUT,
  @RegIP varchar(16) OUTPUT,
  @RegTime varchar(20) OUTPUT,
  @IsSafeInfo tinyint OUTPUT,
  @MediaID int OUTPUT,
  @MediaAdID int OUTPUT,
  @UserStatus int OUTPUT,
  @UserMatrix tinyint OUTPUT,
  @IsStealFind tinyint OUTPUT,
  @StealFindTime varchar(20) OUTPUT,
  @ActTXZTime varchar(20) OUTPUT,
  @ReserveBuff binary(128) OUTPUT,
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ToTXZ = 0;
  SET @UserID = 0;
  SET @TxzName = 'compat stub: not implemented';
  SET @QQ = 'compat stub: not implemented';
  SET @PermitPwd = 'compat stub: not implemented';
  SET @SureCode = 'compat stub: not implemented';
  SET @RegIP = 'compat stub: not implemented';
  SET @RegTime = 'compat stub: not implemented';
  SET @IsSafeInfo = 0;
  SET @MediaID = 0;
  SET @MediaAdID = 0;
  SET @UserStatus = 0;
  SET @UserMatrix = 0;
  SET @IsStealFind = 0;
  SET @StealFindTime = 'compat stub: not implemented';
  SET @ActTXZTime = 'compat stub: not implemented';
  SET @ReserveBuff = 0;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 功能类：原库缺失，保持失败返回，避免伪装成功
  RETURN -1;
END
GO
USE [UserCenter];
GO
CREATE PROCEDURE [dbo].[PrGs_Validate_Matrix]
  @UserID int,
  @Poistion1 int,
  @MatrixValue1 varchar(40),
  @Poistion2 int,
  @MatrixValue2 varchar(40),
  @Poistion3 int,
  @MatrixValue3 varchar(40),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 功能类：原库缺失，保持失败返回，避免伪装成功
  RETURN -1;
END
GO
USE [UserCenter];
GO
CREATE PROCEDURE [dbo].[PrGs_Actor_Create_V2]
  @UsreID int,
  @ActorName varchar(18),
  @Sex tinyint,
  @CampID tinyint,
  @FaceID tinyint,
  @HairStyle tinyint,
  @SceneID tinyint,
  @AppearRes binary(88),
  @SzIp varchar(16),
  @ServerName varchar(16),
  @Out_ActorID int OUTPUT,
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @Out_ActorID = 0;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 功能类：原库缺失，保持失败返回，避免伪装成功
  RETURN -1;
END
GO
USE [UserCenter];
GO
CREATE PROCEDURE [dbo].[PrGs_CenterUser_Create]
  @UserID int,
  @UserName varchar(32),
  @QQ varchar(32),
  @PermitPwd varchar(40),
  @SureCode varchar(40),
  @IP varchar(16),
  @RegTime varchar(19),
  @IsSafeInfo tinyint,
  @Birthday varchar(10),
  @Sex tinyint,
  @MediaID int,
  @MediaAdID int,
  @UserStatus int,
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 功能类：原库缺失，保持失败返回，避免伪装成功
  RETURN -1;
END
GO
USE [GameDBArea];
GO
CREATE PROCEDURE [dbo].[PrGs_AreaUser_Create]
  @UserID int,
  @UserName varchar(32),
  @QQ varchar(32),
  @PermitPwd varchar(40),
  @SureCode varchar(40),
  @IP varchar(16),
  @RegTime varchar(20),
  @IsSafeInfo tinyint,
  @MediaID int,
  @MediaAdID int,
  @UserStatus int,
  @UserMatrix tinyint,
  @IsStealFind tinyint,
  @StealFindTime varchar(20),
  @ActTXZTime varchar(20),
  @ReserveBuff binary(128),
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 功能类：原库缺失，保持失败返回，避免伪装成功
  RETURN -1;
END
GO
USE [GameDBArea];
GO
CREATE PROCEDURE [dbo].[PrGs_GameUser_LogOut_TW]
  @UserID int,
  @ChvMsg varchar(128) OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  SET @ChvMsg = 'compat stub: not implemented';
  -- 日志/记录类：静默成功，不阻断业务流程
  RETURN 1;
END
GO
