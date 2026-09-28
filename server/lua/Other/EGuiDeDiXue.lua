----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\EGuiDeDiXue.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2009-4-14
--版  本:	1.0
--描  述:	恶鬼的地穴
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：万钰林
--日期：2009-2-6
--功能：创建
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--19048 存储是否有任务和杀怪数量：是否任务 x 100 +杀怪数量
--19049 存储使用召唤石和任务次数：召唤石 x 100 + 任务次数
--19060 存储杀怪触发器ID
--19067 存储召唤时间
--19069 存储任务时间

--一层地图ID：108   二层地图ID：109
--岩魔巨锤勇士（任务怪）：726225  独眼黄凤领主（召唤怪）：726226
--联邦NPC：148,258   帝国NPC：425,404
--主宰之间：179,201   命运之间：306,199   挑战之间：303,306
--恶鬼之书：80699   恶鬼之矛：80700   恶鬼战甲：80701   恶鬼召唤石：88041

--摆放NPC
--随机刷BOSS
--物品兑换
--物品使用

local EGuiDeDiXue_ZhaoHuanEGuiNum = 3 --每天使用召唤石次数
local EGuiDeDiXue_ZhaoHuanEGuiID = 726226 --召唤怪物ID
local EGuiDeDiXue_QuestNum = 2 --每天任务次数
local EGuiDeDiXue_QuestMonsterID = 726225 --任务怪物ID
local EGuiDeDiXue_QuestKillMonsterNum = 5 --任务所需杀怪数量
local EGuiDeDiXue_QuestJY = 40113 --任务奖励经验
local EGuiDeDiXue_EGuiBook = 80699
local EGuiDeDiXue_EGuiZhiMao = 80700
local EGuiDeDiXue_EGuiZhanJia = 80701
local EGuiDeDiXue_ZhaoHuanStone = 88041
local EGuiDeDiXue_ZhaoHuanStoneTime = 10
local EGuiDeDiXue_BossID = 850011
local EGuiDeDiXue_TaskID = 1454
local EGuiDeDiXue_TaskTimeMin = 40
local EGuiDeDiXue_TaskTime = 2400

if EGuiDeDiXue_MapBossTable == nil then
EGuiDeDiXue_MapBossTable = {
	[109] = {
		BossID=850021,BossFastID=0,MonsterID=809039,MonsterNum=20,
		BossXY= {
			[1] = {179,201},
			[2] = {306,199},
			[3] = {303,306},
			},
		},
}
end

EGuiDeDiXue_PetExpTable = {
		[1] = {Min=0,Max=10,BiLv=0.1},
		[2] = {Min=11,Max=25,BiLv=0.5},
		[3] = {Min=26,Max=40,BiLv=1},
		[4] = {Min=41,Max=55,BiLv=1},
		[5] = {Min=56,Max=85,BiLv=0.8},
}


if EGuiDeDiXue_MapMonsterTable == nil then --存第二层三个房间的怪物
	EGuiDeDiXue_MapMonsterTable = {}
end

function EGuiDeDiXue_OnLogin(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	if ActorID <= 200 then
		return
	end
	if API_IsBattleGameServer() then
		return
	end
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local EGuiDeDiXue_KillMonsterTriggerID = API_VarDataGetNumber(ActorID,1,19060)
	if EGuiDeDiXue_KillMonsterTriggerID ~= 0 then
		API_DestroyTrigger(ActorID,-1,EGuiDeDiXue_KillMonsterTriggerID)
	end
	EGuiDeDiXue_KillMonsterTriggerID =  API_CreateKillMonsterTrigger(ActorID,EGuiDeDiXue_QuestMonsterID,-1,1,0,-1,'EGuiDeDiXue_KillMonster_CallFuncName')
	API_VarDataSetNumber(ActorID,1,19060,EGuiDeDiXue_KillMonsterTriggerID)
	local QuestKillNum = API_VarDataGetNumber(ActorID,1,19048)
	local Quest = math.floor(QuestKillNum/100)
	local KillNum = math.mod(QuestKillNum,100)
	if Quest > 0 then
		if KillNum == EGuiDeDiXue_QuestKillMonsterNum then
			API_UpdateTaskLeadEx(ActorID,EGuiDeDiXue_TaskID,0,2,'消灭恶鬼任务已完成')
			API_ActorSendMsg(ActorID,3,'消灭恶鬼任务完成')
			local EGuiDeDiXue_KillMonsterTriggerID = API_VarDataGetNumber(ActorID,1,19060)
			API_DestroyTrigger(ActorID,-1,EGuiDeDiXue_KillMonsterTriggerID)
			API_VarDataSetNumber(ActorID,1,19060,0)
		else
			API_UpdateTaskLeadEx(ActorID,EGuiDeDiXue_TaskID,0,1,'已消灭'..API_GetMonsterNameByID(EGuiDeDiXue_QuestMonsterID)..' '..KillNum..'/5')
		end
	end
	WYL_SendSpExpGoods(ActorID)
end

function EGuiDeDiXue_OnLogout(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	API_UpdateTaskLead(ActorID,EGuiDeDiXue_TaskID,1,'')
end

function EGuiDeDiXue_OnLoginMap(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	if ActorID <= 200 then
		return
	end
	if API_IsBattleGameServer() then
		return
	end
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if MapConfigID == 109 then
		local EGuiDeDiXue_KillMonsterTriggerID = API_VarDataGetNumber(ActorID,1,19060)
		if EGuiDeDiXue_KillMonsterTriggerID ~= 0 then
			API_DestroyTrigger(ActorID,-1,EGuiDeDiXue_KillMonsterTriggerID)
		end
		EGuiDeDiXue_KillMonsterTriggerID =  API_CreateKillMonsterTrigger(ActorID,EGuiDeDiXue_QuestMonsterID,-1,1,0,-1,'EGuiDeDiXue_KillMonster_CallFuncName')
		API_VarDataSetNumber(ActorID,1,19060,EGuiDeDiXue_KillMonsterTriggerID)
	end
	WYL_SendSpExpGoods(ActorID)
end

function EGuiDeDiXue_OnLogoutMap(ActorID)

end

if not API_IsEctypeServer() and API_GetServerID() == 1 then
	local MapID = 109
	local RandomTime = math.random(3600)
	API_CreateTimerTriggerG(109,850021, RandomTime,1, 'EGuiDeDiXue_CreatBoss')
	EGuiDeDiXue_DGZhiHuiGuan = EGuiDeDiXue_DGZhiHuiGuan or API_CreateMonsterEx(108,11947,425,408,3,0,-1,1)
	EGuiDeDiXue_LBZhiHuiGuan = EGuiDeDiXue_LBZhiHuiGuan or API_CreateMonsterEx(108,11948,148,258,5,0,-1,1)
	local MapID = 134
	local RandomTime = math.random(3600)
	API_CreateTimerTriggerG(134,914001, RandomTime,1, 'MengHuanCheng_CreatBoss')
end

function EGuiDeDiXue_CreatBoss(MapID,MonsterID)
	EGuiDeDiXue_Boss_TimerTriggerCallFunc(MapID,MonsterID)
end

function MengHuanCheng_CreatBoss(MapID,MonsterID)
	local X,Y = 322,476
	local BossFastID = API_CreateMonster(MapID,MonsterID,X,Y,5,0,-1)
	API_CreateDieTriggerG(0,0,0,BossFastID,'MengHuanCheng_MonsterDieCallFunc')
	if not API_IsBattleGameServer() then
		API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17,''..API_GetMonsterNameByID(MonsterID)..'在'..API_GetMapName(MapID)..'出现了！！！')
		API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8,''..API_GetMonsterNameByID(MonsterID)..'在'..API_GetMapName(MapID)..'出现了！！！')
	end
end

function EGuiDeDiXue_MonsterCorner_DieTriggerGCallFunc(a,b,Type,FastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	local MapConfigID = API_GetMapConfigID(MapID)
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	local RandomTime = math.random(9000,10800)
	API_CreateTimerTriggerG(MapConfigID,MonsterID, RandomTime,1, 'EGuiDeDiXue_CreatBoss')
	--API_CreateTimerTriggerG(MapConfigID,MonsterID,7200,1,'EGuiDeDiXue_Boss_TimerTriggerCallFunc')
end

function MengHuanCheng_MonsterDieCallFunc(a,b,Type,FastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	local MapConfigID = API_GetMapConfigID(MapID)
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	local RandomTime = math.random(9000,10800)
	API_CreateTimerTriggerG(MapConfigID,MonsterID, RandomTime,1, 'MengHuanCheng_CreatBoss')
end

function EGuiDeDiXue_Boss_TimerTriggerCallFunc(MapID,MonsterID)
	for i = 1,table.getn(EGuiDeDiXue_MapMonsterTable) do 
		local FastID = EGuiDeDiXue_MapMonsterTable[i]
		if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
			API_DestroyMonster(FastID)
			EGuiDeDiXue_MapMonsterTable[i] = nil
		end
	end
	EGuiDeDiXue_MapMonsterTable = {}
	local BossTable = EGuiDeDiXue_MapBossTable[MapID]
	local BossID = BossTable.BossID
	local BossFastID = BossTable.BossFastID
	local MonsterID = BossTable.MonsterID
	local MonsterNum = BossTable.MonsterNum
	local BossXY = BossTable.BossXY
	local LinShiTable = {
			[1] = {179,201},
			[2] = {306,199},
			[3] = {303,306},
			}
	local BossXYNum = table.getn(LinShiTable)
	while BossXYNum > 0 do
		local BossFastID = BossTable.BossFastID
		local RandomNum = math.random(table.getn(LinShiTable))
		local X = LinShiTable[RandomNum][1]
		local Y = LinShiTable[RandomNum][2]
		if API_GetMonsterID(BossFastID) <= 0 then
			local YiCengRightMapID = API_GetRightMapID(108)
			BossFastID = API_CreateMonster(MapID,BossID,X,Y,4,0,-1)
			BossTable.BossFastID = BossFastID
			API_CreateDieTriggerG(0,0,0,BossFastID,'EGuiDeDiXue_MonsterCorner_DieTriggerGCallFunc')
			if not API_IsBattleGameServer() then
				API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17,''..API_GetMonsterNameByID(BossID)..'在'..API_GetMapName(MapID)..'出现了！！！')
				API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8,''..API_GetMonsterNameByID(BossID)..'在'..API_GetMapName(MapID)..'出现了！！！')
			end
			--风向标
			local Type = 5
			if GLOBAL_FengXiangBiao_DateList[19][Type][1] == nil then
				GLOBAL_FengXiangBiao_DateList[19][Type][1] = 1
			else
				GLOBAL_FengXiangBiao_DateList[19][Type][1] = GLOBAL_FengXiangBiao_DateList[19][Type][1] + 1
			end
		else
			for i = 1,MonsterNum do
				local TableChang = table.getn(EGuiDeDiXue_MapMonsterTable)
				table.setn(EGuiDeDiXue_MapMonsterTable,TableChang+1)
				local XuHao = table.getn(EGuiDeDiXue_MapMonsterTable)
				local FastID = API_CreateMonster(MapID,MonsterID,X,Y,4,0,-1)
				EGuiDeDiXue_MapMonsterTable[XuHao] = FastID
			end
		end
		table.remove(LinShiTable,RandomNum)
		BossXYNum = BossXYNum - 1
	end
end

function EGuiDeDiXue_EguiZhaoHuanShi_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if MapConfigID ~= 101 and MapConfigID ~= 109 then
		API_ActorSendMsg(ActorID,3,'本地图无法使用，只能在月暮草场和恶鬼的地穴二层中使用')
		return 0 
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	local PlayYMD = API_VarDataGetNumber(ActorID,1,19067)
	local PlayYear = math.floor(PlayYMD/10000)
	local PlayMonthDay = math.mod(PlayYMD,10000)
	local PlayMonth = math.floor(PlayMonthDay/100)
	local PlayDay = math.mod(PlayMonthDay,100)
	if Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
		local StoneQuestNum = API_VarDataGetNumber(ActorID,1,19049)
		local Stone = math.floor(StoneQuestNum/100)
		local QuestNum =  math.mod(StoneQuestNum,100)
		local StoneQuestNum2 = 0 * 100 + QuestNum
		API_VarDataSetNumber(ActorID,1,19049,StoneQuestNum2)
	end
	local StoneQuestNum = API_VarDataGetNumber(ActorID,1,19049)
	local Stone = math.floor(StoneQuestNum/100)
	local QuestNum =  math.mod(StoneQuestNum,100)
	if Stone >= EGuiDeDiXue_ZhaoHuanEGuiNum then
		API_ActorSendMsg(ActorID,3,'已达每日使用上限，请明天再尝试吧')
		return 0
	end
	local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
	if ConvectionInfo ~= 0 then
		API_ActorSendMsg(ActorID,3,'召唤恶鬼中，请稍后')
	else
		local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
		local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
		API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
		local TimerTriggerID = API_CreateTimerTriggerG(ActorID,GoodsID,1,EGuiDeDiXue_ZhaoHuanStoneTime+1,'EGuiDeDiXue_ZhaoHuanEGui_TimerTriggerCallFunc')
		API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
		local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(EGuiDeDiXue_ZhaoHuanStoneTime)
		API_ActorSendMsg(ActorID,3,'召唤恶鬼中……，需时'..GLOBAL_ConvectionTimerCN..'秒，召唤时请不要移动，否则将召唤失败')
		StatusTimer = (EGuiDeDiXue_ZhaoHuanStoneTime + 1) * 1000
		API_ActorShowProcess(ActorID,StatusTimer,410,360,'召唤恶鬼')
	end
	return 1
end

function EGuiDeDiXue_ZhaoHuanEGui_TimerTriggerCallFunc(ActorID,GoodsID)
	if API_ActorIsOnline(ActorID) then
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'召唤恶鬼')
			return
		end
		if API_ActorIsDying(ActorID) then
			API_ActorSendMsg(ActorID,3,'人物死亡，召唤恶鬼失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'召唤恶鬼')
			return
		end
		local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
		ConvectionInfo = math.mod(ConvectionInfo,1000000000)
		local ConvectionSign = math.floor(ConvectionInfo/100000000)
		local BackTileXYandTime = math.mod(ConvectionInfo,100000000)
		local BackTileYandTime = math.mod(BackTileXYandTime,100000)
		local BackTileX = math.floor(BackTileXYandTime/100000)
		local BackTileY = math.floor(BackTileYandTime/100)
		local Time = math.mod(BackTileYandTime,100)
		local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
		if TileX ~= BackTileX or TileY ~= BackTileY then
			API_ActorSendMsg(ActorID,3,'人物移动，召唤恶鬼失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'召唤恶鬼')
		elseif Time >= EGuiDeDiXue_ZhaoHuanStoneTime then
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'召唤恶鬼')
			--删除物品，召唤怪物
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
			local YMD = Year * 10000 + Month * 100 + Day
			local MapID = API_GetActorMapID(ActorID)
			local StoneQuestNum = API_VarDataGetNumber(ActorID,1,19049)
			local Stone = math.floor(StoneQuestNum/100)
			local QuestNum =  math.mod(StoneQuestNum,100)
			local StoneQuestNum2 = (Stone + 1) * 100 + QuestNum
			API_VarDataSetNumber(ActorID,1,19049,StoneQuestNum2)
			API_VarDataSetNumber(ActorID,1,19067,YMD)
			if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除1个'..API_GetGoodsName(GoodsID)..'召唤恶鬼') then
				local FastID = API_CreateMonster(MapID,EGuiDeDiXue_ZhaoHuanEGuiID,TileX,TileY,4,0,-1)
				API_SetAwardOwner(FastID, ActorID)
				API_CreateDieTriggerG(ActorID,0,0,FastID,'EGuiDeDiXue_MonsterDeadCallBack')
				if (Stone + 1) == EGuiDeDiXue_ZhaoHuanEGuiNum then
					API_ActorSendMsg(ActorID,3,'召唤成功，恶鬼出来了！今天不能再召唤了')
				else
					API_ActorSendMsg(ActorID,3,'召唤成功，恶鬼出来了！今天还可召唤'..EGuiDeDiXue_ZhaoHuanEGuiNum-(Stone + 1)..'次')
				end
				--风向标
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 4
				if GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] + 1
				end
			end
		else
			Time = Time + 1
			ConvectionInfo = ConvectionSign * 100000000 + TileX * 100000 + TileY * 100 + Time
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
		end
	end
end

function EGuiDeDiXue_MonsterDeadCallBack(ActorID,b,Type,FastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY)
	if not API_MapIsValid(MapID) then
		return
	end
	if MonsterID ~= EGuiDeDiXue_ZhaoHuanEGuiID then
		return
	end
	local Time = os.time() 
	local Num = API_VarDataGetNumber_Ex(1, 0, -1999, 1, 21)
	local CD = API_VarDataGetNumber_Ex(1, 0, -1999, 1, 22)
	if Num < 20 and CD <= Time and math.random(100) >= 90 then
		Num = Num + 1
		API_VarDataSetNumber_Ex_Sync(1, 0, -1999, 1, 21, Num)
		CD = Time + (math.random(10,30) *60)
		API_VarDataSetNumber_Ex_Sync(1, 0, -1999, 1, 22, CD)
		local GoodsID = YXD_WorldDropGoodsTab[1][math.random(table.getn(YXD_WorldDropGoodsTab[1]))]
		if API_ActorIsOnline(ActorID) then
			API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,1,0,'恶鬼召唤石掉高附加装备',4,ActorID,600,120,7)
		end
	end
end

function EGuiDeDiXue_KillMonster_CallFuncName(ActorID,b,MonsterID,MonsterMapID,MonsterX,MonsterY)
	if MonsterID == EGuiDeDiXue_QuestMonsterID then
		local QuestKillNum = API_VarDataGetNumber(ActorID,1,19048)
		local Quest = math.floor(QuestKillNum/100)
		local KillNum = math.mod(QuestKillNum,100)
		if Quest > 0 then
			if KillNum < EGuiDeDiXue_QuestKillMonsterNum then
				local KillNum2 = KillNum + 1
				local KillNum3 = EGuiDeDiXue_QuestKillMonsterNum - KillNum2
				QuestKillNum = Quest * 100 + KillNum2
				API_VarDataSetNumber(ActorID,1,19048,QuestKillNum)
				if KillNum2 == EGuiDeDiXue_QuestKillMonsterNum then
					API_UpdateTaskLeadEx(ActorID,EGuiDeDiXue_TaskID,0,2,'消灭恶鬼任务已完成')
					API_ActorSendMsg(ActorID,10,'消灭恶鬼任务完成')
				else
					API_UpdateTaskLeadEx(ActorID,EGuiDeDiXue_TaskID,0,1,'已消灭'..API_GetMonsterNameByID(EGuiDeDiXue_QuestMonsterID)..' '..KillNum2..'/5')
					API_ActorSendMsg(ActorID,10,'已消灭'..API_GetMonsterNameByID(EGuiDeDiXue_QuestMonsterID)..' '..KillNum2..'/5')
				end
			else
				API_ActorSendMsg(ActorID,10,'任务已经完成，可以去一层找指挥官领取任务奖励了')
			end
		end
	end
end

function EGuiDeDiXue_ZhiHuiGuanDuiHuan(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	local PlayYMD = API_VarDataGetNumber(ActorID,1,19069)
	local PlayYear = math.floor(PlayYMD/10000)
	local PlayMonthDay = math.mod(PlayYMD,10000)
	local PlayMonth = math.floor(PlayMonthDay/100)
	local PlayDay = math.mod(PlayMonthDay,100)
	if Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
		local StoneQuestNum = API_VarDataGetNumber(ActorID,1,19049)
		local Stone = math.floor(StoneQuestNum/100)
		local QuestNum =  math.mod(StoneQuestNum,100)
		local StoneQuestNum2 = Stone * 100 + 0
		API_VarDataSetNumber(ActorID,1,19049,StoneQuestNum2)
	end
	local StoneQuestNum3 = API_VarDataGetNumber(ActorID,1,19049)
	local Stone3 = math.floor(StoneQuestNum3/100)
	local QuestNum3 =  math.mod(StoneQuestNum3,100)
	local QuestKillNum = API_VarDataGetNumber(ActorID,1,19048)
	local Quest = math.floor(QuestKillNum/100)
	local KillNum = math.mod(QuestKillNum,100)
	--API_ResponseWrite('<win rect="150,370,830,300"></win>')
	API_ResponseWrite('<name>'..API_GetMonsterNameByID(NPCID)..'</name>')
	API_ResponseWrite('<br><text>我的职责是来这里消灭恶鬼，防止它们出去作乱，但这些恶鬼实在是太多了，让我非常伤脑筋啊。如果你足够强大，就来帮帮我吧。</text><br>')
	API_ResponseWrite('<br><text color="255,0,255">'..API_GetMonsterNameByID(EGuiDeDiXue_BossID)..'</text><text>会在地穴二层的</text><text color="255,0,255">主宰之间、命运之间和挑战之间</text><text>随机出现，有机会的话，请去消灭它。</text><br>')
	API_ResponseWrite('<br><br><a href="EGuiDeDiXue_ZhiHuiGuanDuiHuan2?1=1">兑换恶鬼召唤石</a><text>    兑换需要</text><text color="255,0,255">'..API_GetGoodsName(EGuiDeDiXue_EGuiBook)..'、</text><text color="255,0,255">'..API_GetGoodsName(EGuiDeDiXue_EGuiZhiMao)..'</text><text>和</text><text color="255,0,255">'..API_GetGoodsName(EGuiDeDiXue_EGuiZhanJia)..'</text><br>')
	if QuestNum3 >= EGuiDeDiXue_QuestNum then
		API_ResponseWrite('<br><a href="EGuiDeDiXue_ZhiHuiGuanDuiHuan2?1=2">消灭恶鬼任务</a><text>      </text><a href="EGuiDeDiXue_ZhiHuiGuanDuiHuan2?1=5">任务说明</a><text>      每天可领取'..PublicFun_ArabianNumberToChineseNumber(EGuiDeDiXue_QuestNum)..'次，</text><text color="255,0,255">你今天已不能再领取任务了。</text><br>')
	else
		API_ResponseWrite('<br><a href="EGuiDeDiXue_ZhiHuiGuanDuiHuan2?1=2">消灭恶鬼任务</a><text>      </text><a href="EGuiDeDiXue_ZhiHuiGuanDuiHuan2?1=5">任务说明</a><text>      每天可领取'..PublicFun_ArabianNumberToChineseNumber(EGuiDeDiXue_QuestNum)..'次，</text><text color="255,0,255">你今天还可以领取'..EGuiDeDiXue_QuestNum-QuestNum3-Quest..'次任务。</text><br>')
	end
	API_ResponseWrite('<br><a>关闭</a><br>')
	API_ResponseFlush(ActorID)
end

function EGuiDeDiXue_ZhiHuiGuanDuiHuan2()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	local Time = os.time()
	local PlayTime = API_VarDataGetNumber(ActorID,1,19070)
	if XuanZe == 1 then
		if API_ActorGetGoodsNum(ActorID,EGuiDeDiXue_EGuiBook) > 0 and API_ActorGetGoodsNum(ActorID,EGuiDeDiXue_EGuiZhiMao) > 0 and API_ActorGetGoodsNum(ActorID,EGuiDeDiXue_EGuiZhanJia) > 0 then
			if API_ActorRemoveGoods(ActorID,EGuiDeDiXue_EGuiBook,1,'删除1个'..API_GetGoodsName(EGuiDeDiXue_EGuiBook)..'兑换恶鬼召唤石') and API_ActorRemoveGoods(ActorID,EGuiDeDiXue_EGuiZhiMao,1,'删除1个'..API_GetGoodsName(EGuiDeDiXue_EGuiZhiMao)..'兑换恶鬼召唤石') and API_ActorRemoveGoods(ActorID,EGuiDeDiXue_EGuiZhanJia,1,'删除1个'..API_GetGoodsName(EGuiDeDiXue_EGuiZhanJia)..'兑换恶鬼召唤石') then
				API_AddActorGoods(ActorID,EGuiDeDiXue_ZhaoHuanStone,1,'兑换获得一个'..API_GetGoodsName(EGuiDeDiXue_ZhaoHuanStone)..'')
				API_ResponseWrite('<br><text>兑换成功，你获得：</text><img srcgd="'..EGuiDeDiXue_ZhaoHuanStone..'" tipgd="'..EGuiDeDiXue_ZhaoHuanStone..'"><text>× 1</text><br>')
				API_ResponseWrite('<br><text>兑换无限制，每天只可使用'..PublicFun_ArabianNumberToChineseNumber(EGuiDeDiXue_ZhaoHuanEGuiNum)..'次，恶鬼身上一般都携带着宝贝，小心不要让别人抢走了。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
				--风向标
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 3
				if GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] + 1
				end
			end
		else
			API_ResponseWrite('<br><text>兑换'..API_GetGoodsName(EGuiDeDiXue_ZhaoHuanStone)..'所需物品不足，请准备好'..API_GetGoodsName(EGuiDeDiXue_EGuiBook)..'、'..API_GetGoodsName(EGuiDeDiXue_EGuiZhiMao)..'和'..API_GetGoodsName(EGuiDeDiXue_EGuiZhanJia)..'再来找我吧。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	elseif XuanZe == 2 then
		local StoneQuestNum = API_VarDataGetNumber(ActorID,1,19049)
		local Stone = math.floor(StoneQuestNum/100)
		local QuestNum =  math.mod(StoneQuestNum,100)
		if QuestNum < EGuiDeDiXue_QuestNum then
			local QuestKillNum = API_VarDataGetNumber(ActorID,1,19048)
			local Quest = math.floor(QuestKillNum/100)
			local KillNum = math.mod(QuestKillNum,100)
			if Quest == 0 then
				--领取任务
				local QuestKillNum2 = (Quest + 1) * 100 + KillNum
				API_VarDataSetNumber(ActorID,1,19048,QuestKillNum2)
				API_VarDataSetNumber(ActorID,1,19070,Time)
				API_UpdateTaskLeadEx(ActorID,EGuiDeDiXue_TaskID,0,1,'已消灭'..API_GetMonsterNameByID(EGuiDeDiXue_QuestMonsterID)..' '..KillNum..'/5')
				API_ResponseWrite('<br><text>帮我去</text><text color="255,0,255">恶鬼的地穴二层</text><text>杀掉</text><text color="255,0,255"> '..EGuiDeDiXue_QuestKillMonsterNum..'只'..API_GetMonsterNameByID(EGuiDeDiXue_QuestMonsterID)..'。</text><br>')
				API_ResponseWrite('<br><text>完成后就来找我领取奖励吧。</text><br>')
				API_ResponseWrite('<br><text>记住！如果你在</text><text color="255,0,255">'..EGuiDeDiXue_TaskTimeMin..'分钟内</text><text>完成任务，我会额外奖励你一个</text><text color="255,0,255">恶鬼召唤石</text><text>，好好加油吧。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
				--风向标
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 1
				if GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] + 1
				end
			elseif Quest == 1 then
				if KillNum >= EGuiDeDiXue_QuestKillMonsterNum then
					local Time2 = Time - PlayTime
					if Time2 <= EGuiDeDiXue_TaskTime then
					--完成任务选项
						API_ResponseWrite('<br><text>看来你已经出色的完成了我交给你的任务，这是你的奖励，拿着吧。</text><br>')
						API_ResponseWrite('<br><img srcgd="'..Pub_VarExpGoodsID..'" tipgd="'..Pub_VarExpGoodsID..'" ><text>× '..EGuiDeDiXue_QuestJY..'    </text><img srcgd="'..EGuiDeDiXue_ZhaoHuanStone..'" tipgd="'..EGuiDeDiXue_ZhaoHuanStone..'" ><text>× 1</text><br>')
						API_ResponseWrite('<br><a href="EGuiDeDiXue_ZhiHuiGuanDuiHuan2?1=3">领取奖励</a><br>')
						API_ResponseWrite('<br><a>取消</a><br>')
					else
						local Time3 = math.floor(Time2/60)
						local Time4 = math.mod(Time2,60)
						API_ResponseWrite('<br><text>你花费了 '..Time3..'分'..Time4..'秒完成任务，这是你的奖励，拿着吧。</text><br>')
						API_ResponseWrite('<br><img srcgd="'..Pub_VarExpGoodsID..'" tipgd="'..Pub_VarExpGoodsID..'" ><text>× '..EGuiDeDiXue_QuestJY..'    </text><br>')
						API_ResponseWrite('<br><a href="EGuiDeDiXue_ZhiHuiGuanDuiHuan2?1=4">领取奖励</a><br>')
						API_ResponseWrite('<br><a>取消</a><br>')
					end
				else
					--未完成任务提示
					API_ResponseWrite('<br><text>你的任务还没有完成，还有'..EGuiDeDiXue_QuestKillMonsterNum-KillNum..'只'..API_GetMonsterNameByID(EGuiDeDiXue_QuestMonsterID)..'没有清除，赶紧去消灭它们吧！</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			end
		else
			API_ResponseWrite('<br><text>你今天已经领取了'..EGuiDeDiXue_QuestNum..'次消灭恶鬼任务，无法再领取了，谢谢你的帮助。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	elseif XuanZe == 3 then
		local QuestKillNum = API_VarDataGetNumber(ActorID,1,19048)
		local Quest = math.floor(QuestKillNum/100)
		local KillNum = math.mod(QuestKillNum,100)
		if Quest == 0 then
			API_ResponseWrite('<br><text>你还没有领取任务就想获取奖励？那可不行！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		elseif Quest == 1 then
			if KillNum >= EGuiDeDiXue_QuestKillMonsterNum then
				if API_ActorGetPackageSize(ActorID) >= 1 then
					local StoneQuestNum = API_VarDataGetNumber(ActorID,1,19049)
					local Stone = math.floor(StoneQuestNum/100)
					local QuestNum =  math.mod(StoneQuestNum,100)
					local StoneQuestNum2 = Stone * 100 + (QuestNum + 1)
					API_VarDataSetNumber(ActorID,1,19049,StoneQuestNum2)
					API_VarDataSetNumber(ActorID,1,19048,0)
					API_VarDataSetNumber(ActorID,1,19069,YMD)
					if StoneQuestNum2 > StoneQuestNum then
						local AddJY = EGuiDeDiXue_QuestJY
						local ExploitL = API_GetActorExpLevel(ActorID)
						local expMax = API_GetExploitInfo(ExploitL,3)
						local expNow = API_GetActorCurExp(ActorID)
						local expAddMax = expMax - expNow
						local PetExp = EGuiDeDiXue_QuestJY
						if expAddMax >= AddJY then
							--PetExp = AddJY
							API_ActorAddExp(ActorID,AddJY,0,'完成恶鬼任务获得'..AddJY..'经验')
						elseif expAddMax == 0 then
							API_ActorSendMsg(ActorID,10,'您的经验达到上限，已无法再获得经验，请尽快升级')
						else
							--PetExp = expAddMax
							API_ActorAddExp(ActorID,expAddMax,0,'完成恶鬼任务获得'..expAddMax..'经验')
						end
						local QuestNum2 = EGuiDeDiXue_QuestNum-(QuestNum + 1)
						API_UpdateTaskLead(ActorID,EGuiDeDiXue_TaskID,1,'')
						API_AddActorGoods(ActorID,EGuiDeDiXue_ZhaoHuanStone,1,'完成恶鬼任务获得一个'..API_GetGoodsName(EGuiDeDiXue_ZhaoHuanStone)..'')
						API_ResponseWrite('<br><text>获得奖励：</text><img srcgd="'..Pub_VarExpGoodsID..'" tipgd="'..Pub_VarExpGoodsID..'" ><text>× '..EGuiDeDiXue_QuestJY..'    </text><img srcgd="'..EGuiDeDiXue_ZhaoHuanStone..'" tipgd="'..EGuiDeDiXue_ZhaoHuanStone..'" ><text>× 1</text><br>')
						if QuestNum2 == 0 then
							API_ResponseWrite('<br><text>今天已经不能再完成任务了。</text><br>')
						else
							API_ResponseWrite('<br><text>今天还可以完成'..QuestNum2..'次任务。</text><br>')
						end
						API_ResponseWrite('<br><a>确定</a><br>')
						--风向标
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						local Type = 2
						if GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] + 1
						end
						local PetLV = API_GetActorConjedPetPropNum(ActorID,2)
						if PetLV ~= -1 then
							local BiLv = 0
							for j in EGuiDeDiXue_PetExpTable do
								local PetMin = EGuiDeDiXue_PetExpTable[j].Min
								local PetMax = EGuiDeDiXue_PetExpTable[j].Max
								if PetLV >= PetMin and PetLV <= PetMax then
									BiLv = EGuiDeDiXue_PetExpTable[j].BiLv
									PetExp = (PetExp * WYL_PetExpBiLv) * BiLv
									break
								end
							end
							if PetExp <= 0 then
								PetExp = 1
							end
							API_ActorAddPetExp(ActorID,PetExp,0,'完成恶鬼任务给宠物加经验')
						end
					end
				else
					API_ResponseWrite('<br><text>你的背包满了，整理一下再领奖吧。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			else
				API_ResponseWrite('<br><text>你还没有完成任务就想获取奖励？那可不行！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	elseif XuanZe == 4 then
		local QuestKillNum = API_VarDataGetNumber(ActorID,1,19048)
		local Quest = math.floor(QuestKillNum/100)
		local KillNum = math.mod(QuestKillNum,100)
		if Quest == 0 then
			API_ResponseWrite('<br><text>你还没有领取任务就想获取奖励？那可不行！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		elseif Quest == 1 then
			if KillNum >= EGuiDeDiXue_QuestKillMonsterNum then
				local StoneQuestNum = API_VarDataGetNumber(ActorID,1,19049)
				local Stone = math.floor(StoneQuestNum/100)
				local QuestNum =  math.mod(StoneQuestNum,100)
				local StoneQuestNum2 = Stone * 100 + (QuestNum + 1)
				API_VarDataSetNumber(ActorID,1,19049,StoneQuestNum2)
				API_VarDataSetNumber(ActorID,1,19048,0)
				API_VarDataSetNumber(ActorID,1,19069,YMD)
				if StoneQuestNum2 > StoneQuestNum then
					local AddJY = EGuiDeDiXue_QuestJY
					local ExploitL = API_GetActorExpLevel(ActorID)
					local expMax = API_GetExploitInfo(ExploitL,3)
					local expNow = API_GetActorCurExp(ActorID)
					local expAddMax = expMax - expNow
					if expAddMax >= AddJY then
						API_ActorAddExp(ActorID,AddJY,0,'完成恶鬼任务获得'..AddJY..'经验')
					elseif expAddMax == 0 then
						API_ActorSendMsg(ActorID,10,'您的经验达到上限，已无法再获得经验，清尽快升级')
					else
						API_ActorAddExp(ActorID,expAddMax,0,'完成恶鬼任务获得'..expAddMax..'经验')
					end
					local QuestNum2 = EGuiDeDiXue_QuestNum-(QuestNum + 1)
					API_UpdateTaskLead(ActorID,EGuiDeDiXue_TaskID,1,'')
					API_ResponseWrite('<br><text>获得奖励：</text><img srcgd="'..Pub_VarExpGoodsID..'" tipgd="'..Pub_VarExpGoodsID..'" ><text>× '..EGuiDeDiXue_QuestJY..'    </text><br>')
					if QuestNum2 == 0 then
						API_ResponseWrite('<br><text>今天已经不能再完成任务了。</text><br>')
					else
						API_ResponseWrite('<br><text>今天还可以完成'..QuestNum2..'次任务。</text><br>')
					end
					API_ResponseWrite('<br><a>确定</a><br>')
					--风向标
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					local Type = 2
					if GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[19][Type][LaiYuan] + 1
					end
				end
			else
				API_ResponseWrite('<br><text>你还没有完成任务就想获取奖励？那可不行！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	elseif XuanZe == 5 then
		API_ResponseWrite('<br><text color="255,0,255">消灭恶鬼任务</text><text>：每天可领取'..PublicFun_ArabianNumberToChineseNumber(EGuiDeDiXue_QuestNum)..'次，完成任务可获得</text><text color="255,0,255">经验</text><text>奖励。</text><br>')
		API_ResponseWrite('<br><text>如果在</text><text color="255,0,255">'..EGuiDeDiXue_TaskTimeMin..'分钟内</text><text>消灭“恶鬼”并找指挥官完成任务，可以额外获得一个</text><text color="255,0,255">恶鬼召唤石</text><img srcgd="'..EGuiDeDiXue_ZhaoHuanStone..'" tipgd="'..EGuiDeDiXue_ZhaoHuanStone..'"><text>。</text><br>')
		API_ResponseWrite('<br><br><a>确定</a><br>')
	end
end

function WYL_SendSpExpGoods(ActorID)
	local PlayName = API_GetActorName(ActorID)
	local Lv = API_GetActorExpLevel(ActorID)
	if Lv > 20 then
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local YMD = Year * 10000 + Month * 100 + Day
		local PlayYMD = API_VarDataGetNumber(ActorID,1,12599)
		local GoodsID = 88908
		local GoodsNum,MaxNum = 0,500
		local GoodsNowNum = API_ActorGetGoodsNum(ActorID, GoodsID)
		if PlayYMD ~= YMD and GoodsNowNum < MaxNum then
			API_VarDataSetNumber(ActorID,1,12599,YMD)
			GoodsNum = MaxNum - GoodsNowNum
			if GoodsNum > 10 then GoodsNum = 10 end
			if API_ActorCanAddGoods(ActorID,GoodsID,GoodsNum,1,0) ~= -1 then
				API_AddActorGoodsFlag(ActorID, GoodsID, GoodsNum, 1, '每日登陆送密函')
				API_ActorSendMsg(ActorID,10,'获得：'..API_GetGoodsName(GoodsID)..' x '..GoodsNum..' ')
			else
				API_SendActorMailByName(PlayName, GoodsID, GoodsNum, 1, '系统奖励', '获得 '..API_GetGoodsName(GoodsID)..' x '..GoodsNum..'')
				API_ActorSendMsg(ActorID,10,'获得：'..API_GetGoodsName(GoodsID)..' x '..GoodsNum..'（请到邮箱领取）')
			end
		end
	end
end
