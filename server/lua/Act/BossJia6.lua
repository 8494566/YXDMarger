if BossJia6BossTab == nil then
	BossJia6BossTab = {
		[145] = {BossID=943072,BossFastID=0,Tile={45,69},},
	}
end


BossJia6_TimeHD = BossJia6_TimeHD or API_CreateTimerTriggerG(0,0,60,-1,'BossJia6_TimeFunc')

function BossJia6_TimeFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
    if Hour == 0 or Hour == 4 or Hour == 8 or Hour == 12  or Hour == 16 or Hour == 20  or Hour == 24  then
		if  Minute == 0 then
			for j in BossJia6BossTab do
				local MapID = API_GetRightMapID(j)
				local Table = BossJia6BossTab[j]
				if API_MapIsValid(MapID) then
					local BossID = Table.BossID
					local BossFastID = Table.BossFastID
					if API_GetMonsterID(BossFastID) <= 0 then
						local RandomTime = math.random(1)
						API_CreateTimerTriggerG(j,0, RandomTime,1, 'BossJia6_CreatBoss')
				API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 17,''..API_GetMonsterNameByID(BossID)..'在'..API_GetMapName(MapID)..'出现了！！！')
				API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 8,''..API_GetMonsterNameByID(BossID)..'在'..API_GetMapName(MapID)..'出现了！！！')
					end
				end
		    end
	    end
	end
end



function BossJia6_CreatBoss(MapConfigID,b)
	if BossJia6BossTab[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = BossJia6BossTab[MapConfigID]
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local BossFastID = Table.BossFastID
			if API_GetMonsterID(BossFastID) <= 0 then
				local Tile = Table.Tile
				local x = Tile[1]
				local y = Tile[2]
				local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
				Table.BossFastID = FastID
				API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'BossJia6_DieFunc')
			end
		end
	end
end

function BossJia6_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if MonsterID ~= 943072 then
	elseif MonsterID == 943072 then
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