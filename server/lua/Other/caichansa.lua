if caichansaBossTab == nil then
	caichansaBossTab = {
		[25] = {BossID=943066,BossFastID=0,Tile={188,154},},
	}
end


caichansa_TimeHD = caichansa_TimeHD or API_CreateTimerTriggerG(0,0,60,-1,'caichansa_TimeFunc')

function caichansa_TimeFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
    if Hour == 0 or Hour == 2 or Hour == 3 or Hour == 6 or Hour == 8 or Hour == 9 or Hour == 10 or Hour == 11 or Hour == 12 or Hour == 13 or Hour == 17 or Hour == 18 or Hour == 19  then
		if  Minute == 0 then
			for j in caichansaBossTab do
				local MapID = API_GetRightMapID(j)
				local Table = caichansaBossTab[j]
				if API_MapIsValid(MapID) then
					local BossID = Table.BossID
					local BossFastID = Table.BossFastID
					if API_GetMonsterID(BossFastID) <= 0 then
						local RandomTime = math.random(1)
						API_CreateTimerTriggerG(j,0, RandomTime,1, 'caichansa_CreatBoss')
					end
				end
		    end
	    end
	end
end



function caichansa_CreatBoss(MapConfigID,b)
	if caichansaBossTab[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = caichansaBossTab[MapConfigID]
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local BossFastID = Table.BossFastID
			if API_GetMonsterID(BossFastID) <= 0 then
				local Tile = Table.Tile
				local x = Tile[1]
				local y = Tile[2]
				local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
				Table.BossFastID = FastID
				API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'caichansa_DieFunc')
			end
		end
	end
end

function caichansa_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if MonsterID ~= 943066 then
	elseif MonsterID == 943066 then
		if KillerType == 1 then
			local CampID = API_GetActorCamp(KillerID)
			local CampName = GLOBAL_CampName[CampID]
		elseif KillerType and KillerID == -1 then
		end
end
end