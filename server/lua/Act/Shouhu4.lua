--boss刷新脚本事例
--刘琪
--2010年4月30日

if Shouhu4BossTab == nil then
	Shouhu4BossTab = {

		[7] = {BossID=943077,BossFastID=0,Tile={62,61},},
	}
end


Shouhu4_TimeHD = Shouhu4_TimeHD or API_CreateTimerTriggerG(0,0,60,-1,'Shouhu4_TimeFunc')

function Shouhu4_TimeFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
    if Hour == 22 then
		if  Minute == 00 then
			for j in Shouhu4BossTab do
				local MapID = API_GetRightMapID(j)
				local Table = Shouhu4BossTab[j]
				if API_MapIsValid(MapID) then
					local BossID = Table.BossID
					local BossFastID = Table.BossFastID
					if API_GetMonsterID(BossFastID) <= 0 then
						local RandomTime = math.random(1)
						API_CreateTimerTriggerG(j,0, RandomTime,1, 'Shouhu4_CreatBoss')
				API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 17,'火守护了！！！每天只刷新一次')
					end
				end
		    end
	    end
    end
end



function Shouhu4_CreatBoss(MapConfigID,b)
	if Shouhu4BossTab[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = Shouhu4BossTab[MapConfigID]
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local BossFastID = Table.BossFastID
			if API_GetMonsterID(BossFastID) <= 0 then
				local Tile = Table.Tile
				local x = Tile[1]
				local y = Tile[2]
				local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
				Table.BossFastID = FastID
				API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'Shouhu4_DieFunc')
			end
		end
	end
end

function Shouhu4_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if MonsterID ~= 823085 then
	elseif MonsterID == 823085 then
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