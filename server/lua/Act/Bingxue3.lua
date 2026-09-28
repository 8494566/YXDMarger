--boss刷新脚本事例
--刘琪
--2010年4月30日

if Bingxue3BossTab == nil then
	Bingxue3BossTab = {
		[14] = {BossID=943081,BossFastID=0,Tile={67,92},},
	}
end


Bingxue3_TimeHD = Bingxue3_TimeHD or API_CreateTimerTriggerG(0,0,60,-1,'Bingxue3_TimeFunc')

function Bingxue3_TimeFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
    if Hour == 21 or Hour == 8  then
		if  Minute == 35 then
			for j in Bingxue3BossTab do
				local MapID = API_GetRightMapID(j)
				local Table = Bingxue3BossTab[j]
				if API_MapIsValid(MapID) then
					local BossID = Table.BossID
					local BossFastID = Table.BossFastID
					if API_GetMonsterID(BossFastID) <= 0 then
						local RandomTime = math.random(1)
						API_CreateTimerTriggerG(j,0, RandomTime,1, 'Bingxue3_CreatBoss')
				API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 17,'冰雪美人3层出现了！掉落全新宠物！！三洞装备！全新载具！全新英雄！')
					end
				end
		    end
	    end
    end
end



function Bingxue3_CreatBoss(MapConfigID,b)
	if Bingxue3BossTab[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = Bingxue3BossTab[MapConfigID]
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local BossFastID = Table.BossFastID
			if API_GetMonsterID(BossFastID) <= 0 then
				local Tile = Table.Tile
				local x = Tile[1]
				local y = Tile[2]
				local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
				Table.BossFastID = FastID
				API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'Bingxue3_DieFunc')
			end
		end
	end
end

function Bingxue3_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if MonsterID ~= 943081 then
	elseif MonsterID == 943081 then
		if KillerType == 1 then
			local CampID = API_GetActorCamp(KillerID)
			local CampName = GLOBAL_CampName[CampID]
			API_ActorBroadcastMsg(-1,17,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的'..API_GetActorName(KillerID)..'杀死！')
		elseif KillerType and KillerID == -1 then
			return
		else
			API_ActorBroadcastMsg(-1,17,''..API_GetMonsterNameByID(MonsterID)..'已经死亡！')

		end
end
end