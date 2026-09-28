----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\TaFuDeKuangJing.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2009-2-28
--版  本:	1.0
--描  述:	塔夫的矿井：地下城脚本
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：万钰林
--日期：2009-2-28
--功能：创建
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--塔夫的矿井：NPC对话、物品兑换、小BOSS刷新、门的开关
--小BOSS 2小时刷新，控制门的开关，小BOSS死亡触发器
--做表存BOSSID，FASTID，门的ID，门的FASTID，根据小BOSS是否存在而改变

--★★★还需要填BOSS和门ID，XY坐标，门方向，金沙银沙ID，触发器刷新时间数量等

--19036 存储兑换金砂的年月日
--19037 存储兑换银砂的年月日
--19047 存储兑换经验的次数
--19063 存储兑换购物卷的次数
--19065 存储PK触发器ID

local TaFuTaskID = 1453
local JinShaDuiHuanNum = 10  --金砂兑换次数
local YinShaDuiHuanNum = 10  --银砂兑换次数
local TaFuDeKuangJing_JSDuiHuanNum = 25 --金砂每次兑换需要的数量
local TaFuDeKuangJing_YSDuiHuanNum = 25 --银砂每次兑换需要的数量
local TaFuDeKuangJing_GongXun = 3600 --每次可兑换多少功勋
local TaFuDeKuangJing_ShuiJingBi = 1200 --每次可兑换多少水晶币
WYL_PetExpBiLv = 0.6

-- 251,324  e1  281,318 西北
-- 311,265  e2  313,288 西南
-- 377,316  e3  349,318 东南
-- 315,373  e4  317,348 东北

if TaFuDeKuangJing_BossTable == nil then
	TaFuDeKuangJing_BossTable = {
					[1] = {BossID=850001,MapID=103,BossX=251,BossY=324,BossFastID=0,DoorID=11457,DoorX=281,DoorY=318,DoorFastID=0,DoorD=4,FX='西北',HH='恶犬之王乌巴复活了！他怒吼着：“你们这些可怜虫，别想坏我老板的好事！”'},
					[2] = {BossID=850001,MapID=103,BossX=311,BossY=265,BossFastID=0,DoorID=11458,DoorX=313,DoorY=288,DoorFastID=0,DoorD=5,FX='西南',HH='毒蛇监工恰西复活了！她冷笑着：“别以为我就只有这两下子，再来试试吧！”'},
					[3] = {BossID=850001,MapID=103,BossX=377,BossY=316,BossFastID=0,DoorID=11457,DoorX=349,DoorY=318,DoorFastID=0,DoorD=2,FX='东南',HH='矿洞冤魂图斯复活了！他哭嚎着：“这个矿洞就是你们的坟场，我要报仇！”'},
					[4] = {BossID=850001,MapID=103,BossX=315,BossY=373,BossFastID=0,DoorID=11458,DoorX=318,DoorY=348,DoorFastID=0,DoorD=1,FX='东北',HH='巨棒打手麦加恩复活了！他咆哮着：“再给我一次机会，我要干掉所有的英雄！”'},
					[5] = {BossID=850005,MapID=122,BossX=276,BossY=73,BossFastID=0,DoorID=0,DoorX=0,DoorY=0,DoorFastID=0,DoorD=0,FX='',HH='矿井大工头塔夫和他的爪牙们复活了！他恶狠狠的说：“谁敢在我的地盘撒野，我要你们把砂矿连本带利吐出来！”'},
				}
end

TaFuDeKuangJing_PetExpTable = {
		[1] = {Min=0,Max=10,BiLv=0.5},
		[2] = {Min=11,Max=25,BiLv=1},
		[3] = {Min=26,Max=40,BiLv=1},
		[4] = {Min=41,Max=55,BiLv=1},
		[5] = {Min=56,Max=85,BiLv=0.8},
}

TaFuDeKuangJing_ShaTable = {
[103] = {
	JinShaID=215,
	YinShaID=214,
	JinShaTile = {
		{457,240,0,0},
		--{359,347,0,0},
		{384,426,0,0},
		--{347,425,0,0},
		{419,382,0,0},
		--{454,386,0,0},
		{445,324,0,0},
		--{429,285,0,0},
		{416,315,0,0},
		--{499,321,0,0},
		{483,286,0,0},
		--{525,255,0,0},
		{517,290,0,0},
		--{533,319,0,0},
		{403,303,0,0},
		--{372,237,0,0},
		{331,355,0,0},
		--{287,340,0,0},
		{331,344,0,0},
		--{340,293,0,0},
		{238,330,0,0},
		--{296,280,0,0},
		{304,247,0,0},
		--{268,367,0,0},
		{248,351,0,0},
		--{248,389,0,0},
		{284,398,0,0},
		--{174,361,0,0},
		{205,423,0,0},
		--{256,295,0,0},
		{234,241,0,0},
		--{236,204,0,0},
		{255,221,0,0},
		--{279,206,0,0},
		{216,278,0,0},
		--{173,261,0,0},
		{199,329,0,0},
		--{152,279,0,0},
		{140,288,0,0},
		--{99,318,0,0},
		{88,353,0,0},
		--{90,379,0,0},
		{128,370,0,0},
		--{148,322,0,0},
		{231,234,0,0},
		--{92,330,0,0},
		{107,351,0,0},
		--{135,355,0,0},
		{102,364,0,0},
		},
	YinShaTile = {
		{352,227,0,0},
		--{397,355,0,0},
		{373,385,0,0},
		--{386,435,0,0},
		{411,363,0,0},
		--{428,338,0,0},
		{473,351,0,0},
		--{350,367,0,0},
		{368,280,0,0},
		--{493,357,0,0},
		{499,267,0,0},
		--{532,273,0,0},
		{540,295,0,0},
		--{509,310,0,0},
		{485,320,0,0},
		--{474,357,0,0},
		{421,190,0,0},
		--{490,341,0,0},
		{455,381,0,0},
		--{426,338,0,0},
		{378,400,0,0},
		--{364,423,0,0},
		{343,427,0,0},
		--{361,295,0,0},
		{451,228,0,0},
		--{307,392,0,0},
		{295,345,0,0},
		--{344,328,0,0},
		{303,293,0,0},
		--{287,298,0,0},
		{269,306,0,0},
		--{355,327,0,0},
		{487,232,0,0},
		--{251,414,0,0},
		{194,402,0,0},
		--{209,353,0,0},
		{418,282,0,0},
		--{232,289,0,0},
		{250,277,0,0},
		--{223,232,0,0},
		{276,235,0,0},
		--{258,256,0,0},
		{201,255,0,0},
		--{180,300,0,0},
		{216,307,0,0},
		--{134,309,0,0},
		{99,365,0,0},
		--{148,375,0,0},
		{223,218,0,0},
		},
	},
[122] = {
	JinShaID=215,
	YinShaID=214,
	JinShaTile = {
		{260,67,0,0},
		{274,59,0,0},
		{296,60,0,0},
		{261,122,0,0},
		{249,149,0,0},
		{292,182,0,0},
		{325,103,0,0},
		{371,123,0,0},
		{407,137,0,0},
		{379,231,0,0},
		{400,217,0,0},
		{422,198,0,0},
		{428,203,0,0},
		{423,222,0,0},
		{229,269,0,0},
		{290,276,0,0},
		{307,282,0,0},
		{297,298,0,0},
		{334,273,0,0},
		{337,303,0,0},
		{276,391,0,0},
		{224,329,0,0},
		{193,364,0,0},
		{211,419,0,0},
		{197,444,0,0},
		{188,436,0,0},
		{166,418,0,0},
		{187,210,0,0},
		{199,226,0,0},
		{150,230,0,0},
		{125,197,0,0},
		{125,203,0,0},
		{95,270,0,0},
		{137,286,0,0},
		{118,373,0,0},
		{111,347,0,0},
		{125,358,0,0},
		{129,336,0,0},
		{132,302,0,0},
		{144,276,0,0},
		{116,225,0,0},
		{193,204,0,0},
		{289,239,0,0},
		{319,291,0,0},
		{311,178,0,0},
		{361,150,0,0},
		{404,202,0,0},
		{267,87,0,0},
		{216,138,0,0},
		},
	YinShaTile = {
		{281,104,0,0},
		{244,84,0,0},
		{229,113,0,0},
		{224,148,0,0},
		{249,207,0,0},
		{327,190,0,0},
		{342,96,0,0},
		{346,187,0,0},
		{383,193,0,0},
		{393,236,0,0},
		{423,153,0,0},
		{430,235,0,0},
		{364,207,0,0},
		{256,269,0,0},
		{325,250,0,0},
		{281,394,0,0},
		{259,350,0,0},
		{259,390,0,0},
		{205,338,0,0},
		{248,329,0,0},
		{211,365,0,0},
		{167,404,0,0},
		{172,442,0,0},
		{184,433,0,0},
		{175,428,0,0},
		{217,393,0,0},
		{204,251,0,0},
		{138,238,0,0},
		{97,220,0,0},
		{123,244,0,0},
		{95,242,0,0},
		{97,251,0,0},
		{118,298,0,0},
		{140,341,0,0},
		{131,375,0,0},
		{92,348,0,0},
		{89,332,0,0},
		{108,332,0,0},
		{126,273,0,0},
		{137,257,0,0},
		{141,213,0,0},
		{205,237,0,0},
		{297,266,0,0},
		{321,324,0,0},
		{330,153,0,0},
		{380,172,0,0},
		{415,219,0,0},
		{286,88,0,0},
		{253,109,0,0},
		},
	},
}

TaFuDeKuangJing_NPCTable = {
			[1] = {NPCID=11928,x=434,y=317,Icon=3,Name='金砂商人'},
			[2] = {NPCID=11927,x=191,y=317,Icon=3,Name='银砂商人'},
}

function TaFuDeKuangJing_OnLogin(ActorID)
	WYL_OnLogin(ActorID)
	if ActorID <= 200 then
		return
	end
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Camp = API_GetActorCamp(ActorID)
	if MapConfigID == 103 or MapConfigID == 122 then
		local PlayLv = API_GetActorExpLevel(ActorID)
		if PlayLv > 70 then
			API_CreateTimerTrigger(ActorID, 0, 1, -1, 'TaFuDeKuangJing_GoToHome')
			return
		end
		--创建PK触发器
		local TaFuDeKuangJing_PKTriggerID = API_VarDataGetNumber(ActorID,1,19065)
		if TaFuDeKuangJing_PKTriggerID ~= 0 then
			API_DestroyTrigger(ActorID,-1,TaFuDeKuangJing_PKTriggerID)
		end
		TaFuDeKuangJing_PKTriggerID = API_CreatePKTrigger(MapID,MapConfigID,ActorID,0,-1,-1,'TaFuDeKuangJing_PKTrigger')
		API_VarDataSetNumber(ActorID,1,19065,TaFuDeKuangJing_PKTriggerID)
	end
	if MapConfigID == 103 then
		--地图打点
		for i = 1,table.getn(TaFuDeKuangJing_NPCTable) do
			local MapPointID = MapConfigID * 10000 + 103 * 10 + i
			API_ActorDelMapPoint(ActorID,MapPointID)
			local x = TaFuDeKuangJing_NPCTable[i].x
			local y = TaFuDeKuangJing_NPCTable[i].y
			local Icon = TaFuDeKuangJing_NPCTable[i].Icon
			local Name = TaFuDeKuangJing_NPCTable[i].Name
			API_ActorAddMapPoint(ActorID,MapPointID,MapConfigID,x,y,Icon,''..Name..'')
		end
	end
end

function TaFuDeKuangJing_OnLogout(ActorID)
	WYL_OnLogout(ActorID)
	if ActorID <= 200 then
		return
	end
	local TaFuDeKuangJing_PKTriggerID = API_VarDataGetNumber(ActorID,1,19065)
	API_DestroyTrigger(ActorID,-1,TaFuDeKuangJing_PKTriggerID)
	API_VarDataSetNumber(ActorID,1,19065,0)
end

function TaFuDeKuangJing_OnLoginMap(ActorID)
	WYL_OnLoginMap(ActorID)
	if ActorID <= 200 then
		return
	end
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Camp = API_GetActorCamp(ActorID)
	if MapConfigID == 103 or MapConfigID == 122 then
		local PlayLv = API_GetActorExpLevel(ActorID)
		if PlayLv > 70 then
			API_CreateTimerTrigger(ActorID, 0, 1, -1, 'TaFuDeKuangJing_GoToHome')
			return
		end
		--创建PK触发器
		local TaFuDeKuangJing_PKTriggerID = API_VarDataGetNumber(ActorID,1,19065)
		if TaFuDeKuangJing_PKTriggerID ~= 0 then
			API_DestroyTrigger(ActorID,-1,TaFuDeKuangJing_PKTriggerID)
		end
		TaFuDeKuangJing_PKTriggerID = API_CreatePKTrigger(MapID,MapConfigID,ActorID,0,-1,-1,'TaFuDeKuangJing_PKTrigger')
		API_VarDataSetNumber(ActorID,1,19065,TaFuDeKuangJing_PKTriggerID)
	end
	if MapConfigID == 103 then
		--地图打点
		for i = 1,table.getn(TaFuDeKuangJing_NPCTable) do
			local MapPointID = MapConfigID * 10000 + 103 * 10 + i
			API_ActorDelMapPoint(ActorID,MapPointID)
			local x = TaFuDeKuangJing_NPCTable[i].x
			local y = TaFuDeKuangJing_NPCTable[i].y
			local Icon = TaFuDeKuangJing_NPCTable[i].Icon
			local Name = TaFuDeKuangJing_NPCTable[i].Name
			API_ActorAddMapPoint(ActorID,MapPointID,MapConfigID,x,y,Icon,''..Name..'')
		end
	end
end

function TaFuDeKuangJing_OnLogoutMap(ActorID)
	WYL_OnLogoutMap(ActorID)
	if ActorID <= 200 then
		return
	end
	local TaFuDeKuangJing_PKTriggerID = API_VarDataGetNumber(ActorID,1,19065)
	API_DestroyTrigger(ActorID,-1,TaFuDeKuangJing_PKTriggerID)
	API_VarDataSetNumber(ActorID,1,19065,0)
end

function TaFuDeKuangJing_GoToHome(ActorID,TaskID)
	local Camp = API_GetActorCamp(ActorID)
	if Camp == 0 then
		API_ActorGoToMap(ActorID,23,150,273)
	elseif Camp == 1 then
		API_ActorGoToMap(ActorID,10,191,356)
	end
end

if API_GetServerID()== 1 then
	local MapID = 103
	TaFuDeKuangJing_JinYin_TimerTriggerID = TaFuDeKuangJing_JinYin_TimerTriggerID or API_CreateTimerTriggerG(0,0,120,-1,'TaFuDeKuangJing_Sha_TimerTriggerCallFunc')
	JinShaShangRen = JinShaShangRen or API_CreateMonsterEx(MapID,11928,434,317,1,0,-1,1)
	YinShaShangRen = YinShaShangRen or API_CreateMonsterEx(MapID,11927,191,317,5,0,-1,1)
	JinShaShangRen2 = JinShaShangRen2 or API_CreateMonsterEx(API_GetRightMapID(122),11928,242,264,5,0,-1,1)
	YinShaShangRen2 = YinShaShangRen2 or API_CreateMonsterEx(API_GetRightMapID(122),11927,246,264,5,0,-1,1)
	for j in TaFuDeKuangJing_BossTable do
		local BossFastID = TaFuDeKuangJing_BossTable[j].BossFastID
		if BossFastID == 0 then
			local BossID = TaFuDeKuangJing_BossTable[j].BossID
			local BMapID = TaFuDeKuangJing_BossTable[j].MapID
			local BossX = TaFuDeKuangJing_BossTable[j].BossX
			local BossY = TaFuDeKuangJing_BossTable[j].BossY
			local HH = TaFuDeKuangJing_BossTable[j].HH
			if API_GetMonsterID(BossFastID) <= 0 then
				BossFastID = API_CreateMonster(BMapID,BossID,BossX,BossY,4,0,-1)
				TaFuDeKuangJing_BossTable[j].BossFastID = BossFastID
				API_CreateDieTriggerG(j,0,0,BossFastID,'TaFuDeKuangJing_MonsterCorner_DieTriggerGCallFunc')
			end
			if BossID == 850005 then
				--风向标
				local Type = 3
				if GLOBAL_FengXiangBiao_DateList[18][Type][1] == nil then
					GLOBAL_FengXiangBiao_DateList[18][Type][1] = 1
				else
					GLOBAL_FengXiangBiao_DateList[18][Type][1] = GLOBAL_FengXiangBiao_DateList[18][Type][1] + 1
				end
			end
		end
	end
end

function TaFuDeKuangJing_MonsterCorner_DieTriggerGCallFunc(a,b,Type,FastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY)
	--做判断，删除对应的门，喊话
	if MonsterID ~= 850005 then

	elseif MonsterID == 850005 then
		if KillerType == 1 then
			local CampID = API_GetActorCamp(KillerID)
			local CampName = GLOBAL_CampName[CampID]
			API_ActorBroadcastMsg(MapID,17,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的'..API_GetActorName(KillerID)..'杀死！')
			API_ActorBroadcastMsg(MapID,1,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的'..API_GetActorName(KillerID)..'杀死！')
			API_ActorBroadcastMsg(MapID,7,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的'..API_GetActorName(KillerID)..'杀死！')
		elseif KillerType and KillerID == -1 then
			return
		else
			API_ActorBroadcastMsg(MapID,17,''..API_GetMonsterNameByID(MonsterID)..'已经死亡！')
			API_ActorBroadcastMsg(MapID,1,''..API_GetMonsterNameByID(MonsterID)..'已经死亡！')
			API_ActorBroadcastMsg(MapID,7,''..API_GetMonsterNameByID(MonsterID)..'已经死亡！')
		end
		API_CreateTimerTriggerG(10,0,6600,1,'TaFuDeKuangJing_Boss_SayForWould')
		API_CreateTimerTriggerG(5,0,6900,1,'TaFuDeKuangJing_Boss_SayForWould')
		API_CreateTimerTriggerG(0,0,7200,1,'TaFuDeKuangJing_Boss_TimerTriggerCallFunc')
	end
end

function TaFuDeKuangJing_Boss_SayForWould(Time,b)
	if not API_IsBattleGameServer() then
		API_ActorBroadcastMsgEx(-1,-1,0,17,'大工头塔夫将在'..Time..'分钟后出现在塔夫的矿井二层25，251')
	end
end

function TaFuDeKuangJing_Door_TimerTriggerCallFunc(MapID,MonsterID)
	local DoorID = TaFuDeKuangJing_BossTable[MonsterID].DoorID
	local DoorX = TaFuDeKuangJing_BossTable[MonsterID].DoorX
	local DoorY = TaFuDeKuangJing_BossTable[MonsterID].DoorY
	local DoorD = TaFuDeKuangJing_BossTable[MonsterID].DoorD
	local DoorFastID = TaFuDeKuangJing_BossTable[MonsterID].DoorFastID
	if API_GetMonsterID(DoorFastID) <= 0 then
		DoorFastID = API_CreateMonster(MapID,DoorID,DoorX,DoorY,DoorD,0,-1)
		TaFuDeKuangJing_BossTable[MonsterID].DoorFastID = DoorFastID
	end
end

function TaFuDeKuangJing_Boss_TimerTriggerCallFunc(a,b)
	for j in TaFuDeKuangJing_BossTable do
		local BossFastID = TaFuDeKuangJing_BossTable[j].BossFastID
		if API_GetMonsterID(BossFastID) <= 0 then
			local BossID = TaFuDeKuangJing_BossTable[j].BossID
			local MapID = TaFuDeKuangJing_BossTable[j].MapID
			local BossX = TaFuDeKuangJing_BossTable[j].BossX
			local BossY = TaFuDeKuangJing_BossTable[j].BossY
			local HH = TaFuDeKuangJing_BossTable[j].HH
			BossFastID = API_CreateMonster(MapID,BossID,BossX,BossY,4,0,-1)
			TaFuDeKuangJing_BossTable[j].BossFastID = BossFastID
			API_CreateDieTriggerG(0,0,0,BossFastID,'TaFuDeKuangJing_MonsterCorner_DieTriggerGCallFunc')
			if BossID == 850005 then
				API_ActorBroadcastMsgEx(MapID,-1,0,17,''..HH..'')
				API_ActorBroadcastMsgEx(MapID,-1,0,8,''..HH..'')
				local MapID2 = API_GetRightMapID(103)
				API_ActorBroadcastMsgEx(MapID2,-1,0,17,''..HH..'')
				API_ActorBroadcastMsgEx(MapID2,-1,0,8,''..HH..'')
				--风向标
				local Type = 3
				if GLOBAL_FengXiangBiao_DateList[18][Type][1] == nil then
					GLOBAL_FengXiangBiao_DateList[18][Type][1] = 1
				else
					GLOBAL_FengXiangBiao_DateList[18][Type][1] = GLOBAL_FengXiangBiao_DateList[18][Type][1] + 1
				end
			end
		end
	end
end

function TaFuDeKuangJing_OutBossRoom(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	local CampID = API_GetActorCamp(ActorID)
	if (PlayX > 276 and PlayX < 353) and (PlayY > 284 and PlayY < 353) then
		if CampID == 0 then
			API_ActorGoToMap(ActorID,MapID,244,387)
		else
			API_ActorGoToMap(ActorID,MapID,373,252)
		end
	end
end

function TaFuDeKuangJing_Sha_TimerTriggerCallFunc(a,b)
	for j in TaFuDeKuangJing_ShaTable do
		local MapID = API_GetRightMapID(j)
		local JinShaTileTable = TaFuDeKuangJing_ShaTable[j].JinShaTile
		local YinShaTileTable = TaFuDeKuangJing_ShaTable[j].YinShaTile
		local JinShaID = TaFuDeKuangJing_ShaTable[j].JinShaID
		local YinShaID = TaFuDeKuangJing_ShaTable[j].YinShaID
		for j = 1,table.getn(JinShaTileTable) do
			local x,y,h,l = 0,0,0,0
			local Tiles = JinShaTileTable[j]
			x = Tiles[1]
			y = Tiles[2]
			h = Tiles[3]
			l = Tiles[4]
			if API_IsExistByUID(h,l) == true then 
			else
				if not API_IsBlockTile(MapID,x,y,0) then
					h = API_CreateResBoxEx_RetUIDHigh(MapID,x,y,JinShaID,30,'男爵地下城刷金沙',0)
					l = API_GetUIDLow()
					Tiles[3] = h
					Tiles[4] = l
				end
			end
		end
		for j = 1,table.getn(YinShaTileTable) do
			local x,y,h,l = 0,0,0,0
			local Tiles = YinShaTileTable[j]
			x = Tiles[1]
			y = Tiles[2]
			h = Tiles[3]
			l = Tiles[4]
			if API_IsExistByUID(h,l) == true then 
			else
				if not API_IsBlockTile(MapID,x,y,0) then
					h = API_CreateResBoxEx_RetUIDHigh(MapID,x,y,YinShaID,30,'男爵地下城刷银沙',0)
					l = API_GetUIDLow()
					Tiles[3] = h
					Tiles[4] = l
				end
			end
		end
	end
end

function TaFuDeKuangJing_ShangRen_Title()
	local ActorID = API_RequestGetActorID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local NPCID = API_VarDataGetNumber(ActorID,0,32711)
	local JinShaYMD = API_VarDataGetNumber(ActorID,1,19036)
	local JinShaYear = math.floor(JinShaYMD/10000)
	local JinShaMonthDay = math.mod(JinShaYMD,10000)
	local JinShaMonth = math.floor(JinShaMonthDay/100)
	local JinShaDay = math.mod(JinShaMonthDay,100)
	local YinShaYMD = API_VarDataGetNumber(ActorID,1,19037)
	local YinShaYear = math.floor(YinShaYMD/10000)
	local YinShaMonthDay = math.mod(YinShaYMD,10000)
	local YinShaMonth = math.floor(YinShaMonthDay/100)
	local YinShaDay = math.mod(YinShaMonthDay,100)
	if Year ~= JinShaYear or Month ~= JinShaMonth or Day ~= JinShaDay then
		API_VarDataSetNumber(ActorID,1,19036,0)
		API_VarDataSetNumber(ActorID,1,19047,0)
	end
	if Year ~= YinShaYear or Month ~= YinShaMonth or Day ~= YinShaDay then
		API_VarDataSetNumber(ActorID,1,19037,0)
		API_VarDataSetNumber(ActorID,1,19063,0)
	end
	local DuiHuanNum = API_VarDataGetNumber(ActorID,1,19047)
	local GouWuQuanNum = API_VarDataGetNumber(ActorID,1,19063)
	if NPCID == 11928 then
		API_ResponseWrite('<br><text>你有金砂吗？到我这里来看看吧！</text><br>')
		API_ResponseWrite('<br><a href="TaFuDeKuangJing_ShangRenDuiHuan1?1=1">1、兑换经验</a><text>          消耗'..TaFuDeKuangJing_JSDuiHuanNum..'块金砂兑换'..TaFuDeKuangJing_GongXun..'点经验（一天限兑换'..JinShaDuiHuanNum..'次，已领取'..DuiHuanNum..'次）</text><br>') 
		API_ResponseWrite('<br><a href="TaFuDeKuangJing_ShangRenDuiHuan2?1=1">2、兑换“豹的速度”</a><text>   消耗少量金砂兑换一个提升移动速度的祝福</text><br>') 
		API_ResponseWrite('<br><a href="TaFuDeKuangJing_ShangRenDuiHuan2?1=2">3、兑换“牛的耐力”</a><text>   消耗少量金砂兑换一个提升生命上限的祝福</text><br>')
		API_ResponseWrite('<br><a>离开</a>')
	elseif NPCID == 11927 then
		API_ResponseWrite('<br><text>拿着你的银砂，到我这里来换些好东西吧！</text><br>')
		API_ResponseWrite('<br><a href="TaFuDeKuangJing_ShangRenDuiHuan1?1=2">1、兑换水晶币</a><text>        消耗'..TaFuDeKuangJing_YSDuiHuanNum..'块银砂兑换'..TaFuDeKuangJing_ShuiJingBi..'水晶币（一天限兑换'..YinShaDuiHuanNum..'次，已领取'..GouWuQuanNum..'次）</text><br>') 
		API_ResponseWrite('<br><a href="TaFuDeKuangJing_ShangRenDuiHuan2?1=3">2、兑换“熊的力量”</a><text>   消耗少量银砂兑换一个提升攻击力的祝福</text><br>') 
		API_ResponseWrite('<br><a href="TaFuDeKuangJing_ShangRenDuiHuan2?1=4">3、兑换“猴的灵巧”</a><text>   消耗少量银砂兑换一个提升攻击速度的祝福</text><br>')
		API_ResponseWrite('<br><a>离开</a>')
	end
end

function TaFuDeKuangJing_ShangRenDuiHuan1()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	local JinShaYMD = API_VarDataGetNumber(ActorID,1,19036)
	local YinShaYMD = API_VarDataGetNumber(ActorID,1,19037)
	local DuiHuanNum = API_VarDataGetNumber(ActorID,1,19047)
	local GouWuQuanNum = API_VarDataGetNumber(ActorID,1,19063)
	local JinSha = 80623
	local YinSha = 80622
	local GouWuQuanID = 80289
	if XuanZe == 1 then
		local ExploitL = API_GetActorExpLevel(ActorID)
		local expMax = API_GetExploitInfo(ExploitL,3)
		local expNow = API_GetActorCurExp(ActorID)
		local expAddMax = expMax - expNow
		if expAddMax < TaFuDeKuangJing_GongXun then
			API_ActorSendMsg(ActorID,3,'您当前经验达到上限，无法继续兑换经验，请提升等级后再来兑换吧')
			return
		end
		if DuiHuanNum < JinShaDuiHuanNum then
				if API_ActorGetGoodsNum(ActorID,JinSha) >= TaFuDeKuangJing_JSDuiHuanNum then
					if API_ActorRemoveGoods(ActorID,JinSha,TaFuDeKuangJing_JSDuiHuanNum,'删除'..TaFuDeKuangJing_JSDuiHuanNum..'个'..API_GetGoodsName(JinSha)..'') then
						API_VarDataSetNumber(ActorID,1,19036,YMD)
						API_VarDataSetNumber(ActorID,1,19047,DuiHuanNum+1)
						local DuiHuanNum2 = API_VarDataGetNumber(ActorID,1,19047)
						if DuiHuanNum2 == DuiHuanNum + 1 then
							API_ActorAddExp(ActorID,TaFuDeKuangJing_GongXun,TaFuTaskID,'兑换'..API_GetGoodsName(JinSha)..'增加'..TaFuDeKuangJing_GongXun..'经验')
							API_ActorSendMsg(ActorID,3,'使用'..TaFuDeKuangJing_JSDuiHuanNum..'个'..API_GetGoodsName(JinSha)..'获得了'..TaFuDeKuangJing_GongXun..'经验')
							TaFuDeKuangJing_ShangRen_Title()
							--风向标
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							local Type = 2
							if GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] + 1
							end
							local PetLV = API_GetActorConjedPetPropNum(ActorID,2)
							if PetLV ~= -1 then
								local PetExp = TaFuDeKuangJing_GongXun
								local BiLv = 0
								for j in TaFuDeKuangJing_PetExpTable do
									local PetMin = TaFuDeKuangJing_PetExpTable[j].Min
									local PetMax = TaFuDeKuangJing_PetExpTable[j].Max
									if PetLV >= PetMin and PetLV <= PetMax then
										BiLv = TaFuDeKuangJing_PetExpTable[j].BiLv
										PetExp = (PetExp * WYL_PetExpBiLv) * BiLv
										break
									end
								end
								if PetExp <= 0 then
									PetExp = 1
								end
								API_ActorAddPetExp(ActorID,PetExp,0,'兑换金砂给宠物加经验')
							end
						end
					end
				else
					API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(JinSha)..'数量不足'..TaFuDeKuangJing_JSDuiHuanNum..'，无法兑换')
				end

		else
			API_ActorSendMsg(ActorID,3,'您今天已经兑换过'..JinShaDuiHuanNum..'次经验了，请明天再来吧')
		end
	elseif XuanZe == 2 then
		if GouWuQuanNum < YinShaDuiHuanNum then
			if API_ActorGetGoodsNum(ActorID,YinSha) >= TaFuDeKuangJing_YSDuiHuanNum then
				if API_ActorGetPackageSize(ActorID) >= 1 then
					if API_ActorRemoveGoods(ActorID,YinSha,TaFuDeKuangJing_YSDuiHuanNum,'删除'..TaFuDeKuangJing_YSDuiHuanNum..'个'..API_GetGoodsName(YinSha)..'') then
						API_VarDataSetNumber(ActorID,1,19037,YMD)
						API_VarDataSetNumber(ActorID,1,19063,GouWuQuanNum+1)
						local GouWuQuanNum2 = API_VarDataGetNumber(ActorID,1,19063)
						if GouWuQuanNum2 == GouWuQuanNum + 1 then
							if API_ActorShoppingM_Add(ActorID,TaFuDeKuangJing_ShuiJingBi,TaFuTaskID,'兑换'..API_GetGoodsName(YinSha)..'增加'..TaFuDeKuangJing_ShuiJingBi..'水晶币') then
							--API_AddActorGoods(ActorID,GouWuQuanID,TaFuDeKuangJing_ShuiJingBi,'兑换'..API_GetGoodsName(YinSha)..'增加'..TaFuDeKuangJing_ShuiJingBi..'水晶币')
								API_ActorSendMsg(ActorID,3,'使用'..TaFuDeKuangJing_YSDuiHuanNum..'个'..API_GetGoodsName(YinSha)..'获得了'..TaFuDeKuangJing_ShuiJingBi..'水晶币')
								TaFuDeKuangJing_ShangRen_Title()
								--风向标
								local LaiYuan = API_ActorGetPropNum(ActorID,201)
								local Type = 1
								if GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] + 1
								end
							end
						end
					end
				else
					API_ActorSendMsg(ActorID,3,'背包空间不够哦，请整理一下再兑换吧')
				end
			else
				API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(YinSha)..'数量不足'..TaFuDeKuangJing_YSDuiHuanNum..'，无法兑换')
			end
		else
			API_ActorSendMsg(ActorID,3,'您今天已经兑换过'..YinShaDuiHuanNum..'次水晶币了，请明天再来吧')
		end
	end
end

TaFuDeKuangJing_BuffTable = {
			[1] = {BuffName='豹的速度',BuffSM='提高移动速度',GoodsID=80623,
				XiaoGuo = {
						[1] = {BuffID=622,XG='10%',XG2='初级',NeedNum=5},
						[2] = {BuffID=623,XG='20%',XG2='高级',NeedNum=15},
						[3] = {BuffID=624,XG='30%',XG2='顶级',NeedNum=25},
						},
				},
			[2] = {BuffName='牛的耐力',BuffSM='提高生命值',GoodsID=80623,
				XiaoGuo = {
						[1] = {BuffID=625,XG='300点',XG2='初级',NeedNum=5},
						[2] = {BuffID=627,XG='500点',XG2='高级',NeedNum=15},
						[3] = {BuffID=628,XG='800点',XG2='顶级',NeedNum=25},
						},
				},
			[3] = {BuffName='熊的力量',BuffSM='提高各类型攻击力',GoodsID=80622,
				XiaoGuo = {
						[1] = {BuffID=629,XG='20点',XG2='初级',NeedNum=5},
						[2] = {BuffID=630,XG='40点',XG2='高级',NeedNum=15},
						[3] = {BuffID=631,XG='60点',XG2='顶级',NeedNum=25},
						},
				},
			[4] = {BuffName='猴的灵巧',BuffSM='提高攻速',GoodsID=80622,
				XiaoGuo = {
						[1] = {BuffID=632,XG='5%',XG2='初级',NeedNum=5},
						[2] = {BuffID=633,XG='10%',XG2='高级',NeedNum=15},
						[3] = {BuffID=634,XG='15%',XG2='顶级',NeedNum=25},
						},
				},
}

function TaFuDeKuangJing_ShangRenDuiHuan2()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	if TaFuDeKuangJing_BuffTable[XuanZe] == nil then
		return
	end
	--local BuffID = TaFuDeKuangJing_BuffTable[XuanZe].BuffID
	local BuffName = TaFuDeKuangJing_BuffTable[XuanZe].BuffName
	local BuffSM = TaFuDeKuangJing_BuffTable[XuanZe].BuffSM
	local GoodsID = TaFuDeKuangJing_BuffTable[XuanZe].GoodsID
	local XiaoGuoTable = TaFuDeKuangJing_BuffTable[XuanZe].XiaoGuo
	API_ResponseWrite('<br><text>请注意：高级的祝福会取代低级的祝福。每个祝福持续时间为1小时，无法带出矿井。当你死亡时祝福不会消失。</text><br>')
	--API_ResponseWrite('<br><text>当身上有某个祝福时，则不可以再次兑换这个祝福。</text><br>')
	for i = 1,3 do
		local XG = XiaoGuoTable[i].XG
		local XG2 = XiaoGuoTable[i].XG2
		local NeedNum = XiaoGuoTable[i].NeedNum
		API_ResponseWrite('<br><a href="TaFuDeKuangJing_ShangRenDuiHuan3?1='..XuanZe..'&2='..i..'">'..i..'、'..BuffName..''..i..'</a><text>   '..XG2..'祝福，消耗'..NeedNum..'个'..API_GetGoodsName(GoodsID)..'即可获得，'..BuffSM..''..XG..'</text><br>') 
	end
	API_ResponseWrite('<br><a>离开</a>')
end

function TaFuDeKuangJing_ShangRenDuiHuan3()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local BuffLV = API_RequestGetNumber(2)
	if TaFuDeKuangJing_BuffTable[XuanZe] == nil then
		return
	end
	local BuffID = TaFuDeKuangJing_BuffTable[XuanZe].BuffID
	local BuffName = TaFuDeKuangJing_BuffTable[XuanZe].BuffName
	local BuffSM = TaFuDeKuangJing_BuffTable[XuanZe].BuffSM
	local GoodsID = TaFuDeKuangJing_BuffTable[XuanZe].GoodsID
	local BuffID = TaFuDeKuangJing_BuffTable[XuanZe].XiaoGuo[BuffLV].BuffID
	local NeedNum = TaFuDeKuangJing_BuffTable[XuanZe].XiaoGuo[BuffLV].NeedNum
	local XG = TaFuDeKuangJing_BuffTable[XuanZe].XiaoGuo[BuffLV].XG
	local BuffIDLV = BuffID * 1000 + 1
	local PanDuan = 0
	for i = 1,table.getn(TaFuDeKuangJing_BuffTable[XuanZe].XiaoGuo) do
		local TagBuff = TaFuDeKuangJing_BuffTable[XuanZe].XiaoGuo[i].BuffID
		if API_ActorFindStatus(ActorID,TagBuff) then
			if BuffID < TagBuff then
				API_ActorSendMsg(ActorID,3,'兑换失败，低级祝福无法覆盖高级祝福')
				return 
			elseif BuffID > TagBuff then
				local DelBuffID = TagBuff * 1000 + 1
				API_ActorRemoveStatus(ActorID,DelBuffID)
			end
		end
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) >= NeedNum then
		if API_ActorRemoveGoods(ActorID,GoodsID,NeedNum,'删除'..NeedNum..'个'..API_GetGoodsName(GoodsID)..'添加'..BuffName..''..BuffLV..'') then
			API_ActorAddStatus(ActorID,BuffIDLV,3600000)
			API_ActorSendMsg(ActorID,3,'使用'..NeedNum..'个'..API_GetGoodsName(GoodsID)..'兑换了'..BuffName..''..BuffLV..'：'..BuffSM..''..XG..'')
		end
	else
		API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(GoodsID)..'数量不足'..NeedNum..'，无法兑换')
	end
end

--杀手，被杀
function TaFuDeKuangJing_PKTrigger(ActorID,KilledID,MapID,MapConfigID)
	local JinSha = 80623
	local JinShaName = API_GetGoodsName(JinSha)
	local JinShaNum = API_ActorGetGoodsNum(KilledID,JinSha)
	local YinSha = 80622
	local YinShaName = API_GetGoodsName(YinSha)
	local YinShaNum = API_ActorGetGoodsNum(KilledID,YinSha)
	local ActorName = API_GetActorName(ActorID)
	local KilledName = API_GetActorName(KilledID)
	local KilledX,KilledY = PublicFun_GetActorPosXY(KilledID)
	local CampID = API_GetActorCamp(ActorID)
	local CampName = GLOBAL_CampName[CampID]
	local DropGoodsID = 0
	if JinShaNum > 0 and YinShaNum > 0 then
		DropGoodsID = math.random(YinSha,JinSha)
	elseif JinShaNum == 0 then
		DropGoodsID = YinSha
	elseif YinShaNum == 0 then
		DropGoodsID = JinSha
	end
	if DropGoodsID > 0 then
	--掉落数量，地图通告
		local DropGoodsName = API_GetGoodsName(DropGoodsID)
		local DropGoodsNum = API_ActorGetGoodsNum(KilledID,DropGoodsID)
		local DropGoodsNum2 = DropGoodsNum * 0.2
		local DropGoodsNum3 = math.floor(DropGoodsNum2/1)
		local DropGoodsNum4 = math.mod(DropGoodsNum2,1)
		local DropGoodsNum5 = DropGoodsNum4 * 10
		if DropGoodsNum5 > 5 then
			DropGoodsNum3 = DropGoodsNum3 + 1
		end
		if DropGoodsNum3 > 0 then
			API_ActorRemoveGoods(KilledID,DropGoodsID,DropGoodsNum3,'挂机地表被玩家杀')
			API_CreateDropGoods(MapID,KilledX,KilledY,DropGoodsID,DropGoodsNum3,0,'被敌对玩家杀死',4,0,120,1)
			API_ActorSendMsg(ActorID,8,'您杀死了'..KilledName..',使他掉落了'..DropGoodsNum3..'个'..DropGoodsName..'')
			API_ActorSendMsg(KilledID,8,'您被'..ActorName..'杀死了，被夺走'..DropGoodsNum3..'个'..DropGoodsName..'')
			API_ActorBroadcastMsgEx(MapID,-1,0,1,''..CampName..'的 '..ActorName..' 杀死了 '..KilledName..',夺得'..DropGoodsNum3..'个'..DropGoodsName..'')
		else
			API_ActorSendMsg(ActorID,8,'您杀死了'..KilledName..'')
			API_ActorSendMsg(KilledID,8,'您被'..ActorName..'杀死了')
			API_ActorBroadcastMsgEx(MapID,-1,0,1,''..CampName..'的 '..ActorName..' 杀死了 '..KilledName..'')
		end
	else
		API_ActorSendMsg(ActorID,8,'您杀死了'..KilledName..'')
		API_ActorSendMsg(KilledID,8,'您被'..ActorName..'杀死了')
		API_ActorBroadcastMsgEx(MapID,-1,0,1,''..CampName..'的 '..ActorName..' 杀死了 '..KilledName..'')
	end
	
	local LaiYuan = API_ActorGetPropNum(ActorID,201)
	if CampID == 0 then
		local Type = 4
		if GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] + 1
		end
	elseif CampID == 1 then
		local Type = 5
		if GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[18][Type][LaiYuan] + 1
		end
	end
end

require 'Scp\\LUA\\Other\\WYL_Main.lua'