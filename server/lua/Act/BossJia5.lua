if BossJia5BossTab == nil then
	BossJia5BossTab = {
		[144] = {BossID=943071,BossFastID=0,Tile={68,70},},
	}
end


--[已停用] BossJia5_TimeHD = BossJia5_TimeHD or API_CreateTimerTriggerG(0,0,60,-1,'BossJia5_TimeFunc')

function BossJia5_TimeFunc(a,b)
	if true then return end --已停用：八门/五行/冰雪改走 BossLunHuan 轮换
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
    if Hour == 0 or Hour == 4 or Hour == 8 or Hour == 12  or Hour == 16 or Hour == 20  or Hour == 24  then
		if  Minute == 0 then
			for j in BossJia5BossTab do
				local MapID = API_GetRightMapID(j)
				local Table = BossJia5BossTab[j]
				if API_MapIsValid(MapID) then
					local BossID = Table.BossID
					local BossFastID = Table.BossFastID
					if API_GetMonsterID(BossFastID) <= 0 then
						local RandomTime = math.random(1)
						API_CreateTimerTriggerG(j,0, RandomTime,1, 'BossJia5_CreatBoss')
				API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 17,''..API_GetMonsterNameByID(BossID)..'在'..API_GetMapName(MapID)..'出现了！！！')
				API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 8,''..API_GetMonsterNameByID(BossID)..'在'..API_GetMapName(MapID)..'出现了！！！')
					end
				end
		    end
	    end
	end
end



function BossJia5_CreatBoss(MapConfigID,b)
	if BossJia5BossTab[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = BossJia5BossTab[MapConfigID]
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local BossFastID = Table.BossFastID
			if API_GetMonsterID(BossFastID) <= 0 then
				local Tile = Table.Tile
				local x = Tile[1]
				local y = Tile[2]
				local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
				Table.BossFastID = FastID
				API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'BossJia5_DieFunc')
			end
		end
	end
end

function BossJia5_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if MonsterID ~= 943071 then
	elseif MonsterID == 943071 then
		if KillerType == 1 then
			local CampID = API_GetActorCamp(KillerID)
			local CampName = GLOBAL_CampName[CampID]
			API_ActorBroadcastMsg(-1,17,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的'..API_GetActorName(KillerID)..'杀死！')
			API_ActorBroadcastMsg(-1,1,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的'..API_GetActorName(KillerID)..'杀死！')
			API_ActorBroadcastMsg(-1,7,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的'..API_GetActorName(KillerID)..'杀死！')
		elseif KillerType and KillerID == -1 then
			return
		else
			API_ActorBroadcastMsg(-1,17,''..API_GetMonsterNameByID(MonsterID)..'已经死亡！')
			API_ActorBroadcastMsg(-1,1,''..API_GetMonsterNameByID(MonsterID)..'已经死亡！')
			API_ActorBroadcastMsg(-1,7,''..API_GetMonsterNameByID(MonsterID)..'已经死亡！')
		end
end
end