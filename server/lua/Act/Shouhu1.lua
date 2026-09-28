--boss刷新脚本事例
--刘琪
--2010年4月30日

if Shouhu1BossTab == nil then
	Shouhu1BossTab = {

		[4] = {BossID=943074,BossFastID=0,Tile={123,125},},
	}
end


Shouhu1_TimeHD = Shouhu1_TimeHD or API_CreateTimerTriggerG(0,0,60,-1,'Shouhu1_TimeFunc')

function Shouhu1_TimeFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
    if Hour == 20 then
		if  Minute == 00 then
			for j in Shouhu1BossTab do
				local MapID = API_GetRightMapID(j)
				local Table = Shouhu1BossTab[j]
				if API_MapIsValid(MapID) then
					local BossID = Table.BossID
					local BossFastID = Table.BossFastID
					if API_GetMonsterID(BossFastID) <= 0 then
						local RandomTime = math.random(1)
						API_CreateTimerTriggerG(j,0, RandomTime,1, 'Shouhu1_CreatBoss')
				API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 17,'金守护了！！！每天只刷新一次')
					end
				end
		    end
	    end
    end
end



function Shouhu1_CreatBoss(MapConfigID,b)
	if Shouhu1BossTab[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = Shouhu1BossTab[MapConfigID]
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local BossFastID = Table.BossFastID
			if API_GetMonsterID(BossFastID) <= 0 then
				local Tile = Table.Tile
				local x = Tile[1]
				local y = Tile[2]
				local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
				Table.BossFastID = FastID
				API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'Shouhu1_DieFunc')
			end
		end
	end
end

function Shouhu1_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
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