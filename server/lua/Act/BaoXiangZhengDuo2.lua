if BaoXiang2BossTab == nil then
	BaoXiang2BossTab = {
		[111] = {BossID=12418,BossFastID=0,Tile={423,356},},
	}
end


BaoXiang2_TimeHD = BaoXiang2_TimeHD or API_CreateTimerTriggerG(0,0,60,-1,'BaoXiang2_TimeFunc')

function BaoXiang2_TimeFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
    if Hour == 0 or Hour == 1 or Hour == 2 or Hour == 3 or Hour == 4 or Hour == 5 or Hour == 6 or Hour == 7 or Hour == 8 or Hour == 9 or Hour == 10 or Hour == 11 or Hour == 12 or Hour == 13 or Hour == 14 or Hour == 15 or Hour == 16 or Hour == 17 or Hour == 18 or Hour == 19 or Hour == 20 or Hour == 21 or Hour == 22 or Hour ==23 then
		if  Minute == 0 then
			for j in BaoXiang2BossTab do
				local MapID = API_GetRightMapID(j)
				local Table = BaoXiang2BossTab[j]
				if API_MapIsValid(MapID) then
					local BossID = Table.BossID
					local BossFastID = Table.BossFastID
					if API_GetMonsterID(BossFastID) <= 0 then
						local RandomTime = math.random(1)
						API_CreateTimerTriggerG(j,0, RandomTime,1, 'BaoXiang2_CreatBoss')
				API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 17,''..API_GetMonsterNameByID(BossID)..'在'..API_GetMapName(MapID)..'(164,258)出现了！！！')
				API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 8,''..API_GetMonsterNameByID(BossID)..'在'..API_GetMapName(MapID)..'(164,258)出现了！！！')
					end
				end
		    end
	    end
	end
end



function BaoXiang2_CreatBoss(MapConfigID,b)
	if BaoXiang2BossTab[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = BaoXiang2BossTab[MapConfigID]
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local BossFastID = Table.BossFastID
			if API_GetMonsterID(BossFastID) <= 0 then
				local Tile = Table.Tile
				local x = Tile[1]
				local y = Tile[2]
				local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
				Table.BossFastID = FastID
				API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'BaoXiang2_DieFunc')
			end
		end
	end
end

function BaoXiang2_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if MonsterID ~= 12414 then
	elseif MonsterID == 12414 then
		if KillerType == 1 then
			local CampID = API_GetActorCamp(KillerID)
			local CampName = GLOBAL_CampName[CampID]
			API_ActorBroadcastMsg(-1,17,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的'..API_GetActorName(KillerID)..'打开！')
			API_ActorBroadcastMsg(-1,1,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的'..API_GetActorName(KillerID)..'打开！')
			API_ActorBroadcastMsg(-1,7,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的'..API_GetActorName(KillerID)..'打开！')
		elseif KillerType and KillerID == -1 then
			return
		else
			API_ActorBroadcastMsg(-1,17,''..API_GetMonsterNameByID(MonsterID)..'已经被开启！')
			API_ActorBroadcastMsg(-1,1,''..API_GetMonsterNameByID(MonsterID)..'已经被开启！')
			API_ActorBroadcastMsg(-1,7,''..API_GetMonsterNameByID(MonsterID)..'已经被开启！')
		end
end
end

BaoXiang2Box_PlayOpenLvTable = {
			[12418] = {Min=1,Max=65},
}
BaoXiang2Box_OpenBoxNum = 20
BaoXiang2Box_BigBoxGoodsNum = 200 
BaoXiang2Box_OpenBoxTime = 60 --打开大箱子的时间
BaoXiang2Box_XiaoBoxGoodsTable = {[88039]=12418}

BaoXiang2Box_BoxGoodsTable = {
	[12418] = {
						--子低
			{Min=1,Max=70,
				Goodslist = {
						{GoodsID=80384,GaiLv1=2195127,GaiLv2=2439029,NumGaiLv=12,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=2439030,GaiLv2=2682932,NumGaiLv=12,NumMax=1,NumMin=0},
						{GoodsID=82545,GaiLv1=8048799,GaiLv2=8292701,NumGaiLv=200,NumMax=1,NumMin=1},
						{GoodsID=501,GaiLv1=8292702,GaiLv2=8536604,NumGaiLv=3428,NumMax=3,NumMin=2},
						{GoodsID=80274,GaiLv1=8536605,GaiLv2=8780507,NumGaiLv=9285,NumMax=3,NumMin=2},
						{GoodsID=80405,GaiLv1=8780508,GaiLv2=9024410,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80409,GaiLv1=9024411,GaiLv2=9268313,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80400,GaiLv1=9268314,GaiLv2=9512216,NumGaiLv=0,NumMax=1,NumMin=0},
						{GoodsID=80387,GaiLv1=9512217,GaiLv2=9756119,NumGaiLv=4,NumMax=1,NumMin=0},
						{GoodsID=552,GaiLv1=9874561,GaiLv2=10000000,NumGaiLv=1000,NumMax=1,NumMin=0},
						},
				},
			--子中
			{Min=71,Max=95,
				Goodslist = {
						{GoodsID=553,GaiLv1=1,GaiLv2=238096,NumGaiLv=20,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=238097,GaiLv2=476192,NumGaiLv=2022,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=476193,GaiLv2=714288,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=583,GaiLv1=8333361,GaiLv2=8571456,NumGaiLv=0,NumMax=1,NumMin=0},
						{GoodsID=80400,GaiLv1=8571457,GaiLv2=8809552,NumGaiLv=14,NumMax=1,NumMin=0},
						{GoodsID=80400,GaiLv1=8809553,GaiLv2=9047648,NumGaiLv=0,NumMax=1,NumMin=0},
						{GoodsID=80387,GaiLv1=9047649,GaiLv2=9285744,NumGaiLv=780,NumMax=1,NumMin=0},
						{GoodsID=579,GaiLv1=9285745,GaiLv2=9523840,NumGaiLv=3,NumMax=1,NumMin=0},
						{GoodsID=552,GaiLv1=9874561,GaiLv2=10000000,NumGaiLv=1000,NumMax=1,NumMin=0},
						{GoodsID=579,GaiLv1=9761937,GaiLv2=10000000,NumGaiLv=3,NumMax=1,NumMin=0},
						},
				},
			--子高
			{Min=96,Max=100,
				Goodslist = {
						{GoodsID=553,GaiLv1=1,GaiLv2=500001,NumGaiLv=8283,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=500002,GaiLv2=1000002,NumGaiLv=904,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=1000003,GaiLv2=1500003,NumGaiLv=904,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=1500004,GaiLv2=2000004,NumGaiLv=904,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=2000005,GaiLv2=2500005,NumGaiLv=904,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=2500006,GaiLv2=3000006,NumGaiLv=904,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=3000007,GaiLv2=3500007,NumGaiLv=4870,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=3500008,GaiLv2=4000008,NumGaiLv=910,NumMax=1,NumMin=0},
						{GoodsID=583,GaiLv1=8000017,GaiLv2=8500017,NumGaiLv=193,NumMax=1,NumMin=0},
						{GoodsID=80400,GaiLv1=8500018,GaiLv2=9000018,NumGaiLv=33,NumMax=1,NumMin=0},
						{GoodsID=579,GaiLv1=9000019,GaiLv2=9500019,NumGaiLv=1545,NumMax=1,NumMin=0},
						{GoodsID=579,GaiLv1=9500020,GaiLv2=10000000,NumGaiLv=1545,NumMax=1,NumMin=0},
						{GoodsID=552,GaiLv1=9874561,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},
						},
				},
		},
}

function BaoXiang2Box_OpenBox(ActorID,NPCID)
	if BaoXiang2Box_BoxGoodsTable[NPCID] == nil then
		return
	end
	if BaoXiang2Box_PlayOpenLvTable[NPCID] == nil then
		return
	end
	local Min = BaoXiang2Box_PlayOpenLvTable[NPCID].Min
	local Max = BaoXiang2Box_PlayOpenLvTable[NPCID].Max
	local PlayLV = API_GetActorExpLevel(ActorID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local NPCX,NPCY = PublicFun_GetMonsterPosXY(NPCFastID)
	local JuLi = PublicFun_AccountDistance(PlayX,PlayY,NPCX,NPCY)
	if JuLi <= 3 then
		if PlayLV >= Min and PlayLV <= Max then
			local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
			if ConvectionInfo ~= 0 then
				API_ActorSendMsg(ActorID,3,'正在打开中，请稍后')
				API_ResponseEnd()
				API_ResponseClear()
			else
				local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
				local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
				local TimerTriggerID = API_CreateTimerTriggerG(ActorID,NPCFastID,1,62,'BaoXiang2Box_OpenBox_TimerTriggerCallFunc')
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
				local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(BaoXiang2Box_OpenBoxTime)
				API_ActorSendMsg(ActorID,3,'宝箱打开中……，需时'..GLOBAL_ConvectionTimerCN..'秒，打开期间请不要移动，否则将打开失败')
				StatusTimer = (BaoXiang2Box_OpenBoxTime + 1) * 1000
				API_ActorShowProcess(ActorID,StatusTimer,410,360,'打开宝箱')
				API_ActorAddStatus(ActorID,41012,0)
				API_ResponseEnd()
				API_ResponseClear()
			end
		else
			API_ActorSendMsg(ActorID,3,'只有'..Min..'～'..Max..'级玩家才能打开此宝箱')
			API_ResponseEnd()
			API_ResponseClear()
		end
	else
		API_ActorSendMsg(ActorID,3,'距离宝箱太远，靠近点再试试')
		API_ResponseEnd()
		API_ResponseClear()
	end
end



function BaoXiang2Box_OpenBox_TimerTriggerCallFunc(ActorID,NPCFastID)
	if API_ActorIsOnline(ActorID) then
		if API_GetMonsterID(NPCFastID) <= 0 then
			API_ActorSendMsg(ActorID,3,'打开失败，宝箱已被其他玩家开启')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'打开宝箱')
			API_ActorRemoveStatus(ActorID,41012)
			return
		end
		local NPCID = API_GetMonsterID(NPCFastID)
		if API_ActorIsDying(ActorID) then
			API_ActorSendMsg(ActorID,3,'人物死亡，打开失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'打开宝箱')
			API_ActorRemoveStatus(ActorID,41012)
			return
		end
		if BaoXiang2Box_BoxGoodsTable[NPCID] == nil then
			API_ActorSendMsg(ActorID,3,'未知错误，打开失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'打开宝箱')
			API_ActorRemoveStatus(ActorID,41012)
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
			API_ActorSendMsg(ActorID,3,'人物移动，打开失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'打开宝箱')
			API_ActorRemoveStatus(ActorID,41012)
		elseif Time >= BaoXiang2Box_OpenBoxTime then
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'打开宝箱')
			API_ActorRemoveStatus(ActorID,41012)
			--获取NPC位置，掉落奖励
			--local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
			if API_GetMonsterID(NPCFastID) <= 0 then
				API_ActorSendMsg(ActorID,3,'打开失败，宝箱已被其他玩家开启')
				return
			end
			local NPCMapID = API_GetMonsterMap(NPCFastID)
			local NPCMapConfigID = API_GetMapConfigID(NPCMapID)
			local NPCX,NPCY = PublicFun_GetMonsterPosXY(NPCFastID)
			API_DestroyMonster(NPCFastID)
			local ShiQuType = 0
			local ShiQuID = ActorID
			local TeamID = API_GetTeamID(ActorID)
			if TeamID > 0 then
				ShiQuType = 3
				ShiQuID = TeamID
			end
			local Table = BaoXiang2Box_BoxGoodsTable[NPCID]
			for i = 1,BaoXiang2Box_BigBoxGoodsNum do
				local JiangLiTable = {}
				local JiangLiTableGaiLv = math.random(100)
				for j in Table do 
					local Min = Table[j].Min
					local Max = Table[j].Max
					if JiangLiTableGaiLv >= Min and JiangLiTableGaiLv <= Max then
						JiangLiTable = Table[j].Goodslist
						break
					end
				end
				if JiangLiTable ~= nil then
					local GaiLv = math.random(10000000)
					for j in JiangLiTable do
						local GaiLv1 = JiangLiTable[j].GaiLv1
						local GaiLv2 = JiangLiTable[j].GaiLv2
						if GaiLv >= GaiLv1 and GaiLv <= GaiLv2 then
							local TreasureID = JiangLiTable[j].GoodsID
							local TreasureNum = 0
							local NumGaiLv = JiangLiTable[j].NumGaiLv
							local NumMax = JiangLiTable[j].NumMax
							local NumMin = JiangLiTable[j].NumMin
							local NumRandom = math.random(10000)
							if NumRandom <= NumGaiLv then
								TreasureNum = NumMax
							else
								TreasureNum = NumMin
							end
							if TreasureNum > 0 then
								API_CreateDropGoods(NPCMapID,NPCX,NPCY,TreasureID,TreasureNum,0,'宝箱争夺之大宝箱掉宝',ShiQuType,ShiQuID,600,60)
							end
							break
						end
					end
				end
			end
			--local OpenNum = API_VarDataGetNumber(ActorID,1,19038)
			--API_VarDataSetNumber(ActorID,1,19038,OpenNum+1)
			if NPCID == 11938 then
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 7
				if GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] + 1
				end
			elseif NPCID == 12418 then
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 8
				if GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] + 1
				end
			--四档待添加
			end
		else
			Time = Time + 1
			ConvectionInfo = ConvectionSign * 100000000 + TileX * 100000 + TileY * 100 + Time
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
		end
	end
end

