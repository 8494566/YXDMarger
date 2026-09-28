--boss刷新脚本事例
--刘琪
--2010年4月30日

if DaozhuhuashenBossTab == nil then
	DaozhuhuashenBossTab = {
		[11] = {BossID=823081,BossFastID=0,Tile={60,73},},
	}
end


Daozhuhuashen_TimeHD = Daozhuhuashen_TimeHD or API_CreateTimerTriggerG(0,0,60,-1,'Daozhuhuashen_TimeFunc')

function Daozhuhuashen_TimeFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
    if Hour == 23 then
		if  Minute == 05 then
			for j in DaozhuhuashenBossTab do
				local MapID = API_GetRightMapID(j)
				local Table = DaozhuhuashenBossTab[j]
				if API_MapIsValid(MapID) then
					local BossID = Table.BossID
					local BossFastID = Table.BossFastID
					if API_GetMonsterID(BossFastID) <= 0 then
						local RandomTime = math.random(1)
						API_CreateTimerTriggerG(j,0, RandomTime,1, 'Daozhuhuashen_CreatBoss')
				API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 17,'岛主的化身降临五行空间！中门！（五度空间）！掉落全新宠物！！三洞装备！全新载具！全新英雄！每天只刷新一次')
					end
				end
		    end
	    end
    end
end



function Daozhuhuashen_CreatBoss(MapConfigID,b)
	if DaozhuhuashenBossTab[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = DaozhuhuashenBossTab[MapConfigID]
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local BossFastID = Table.BossFastID
			if API_GetMonsterID(BossFastID) <= 0 then
				local Tile = Table.Tile
				local x = Tile[1]
				local y = Tile[2]
				local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
				Table.BossFastID = FastID
				API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'Daozhuhuashen_DieFunc')
			end
		end
	end
end

function Daozhuhuashen_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if MonsterID ~= 823081 then
	elseif MonsterID == 823081 then
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