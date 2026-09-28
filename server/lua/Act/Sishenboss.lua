--boss刷新脚本事例
--刘琪
--2010年4月30日

if BossfuchouBossTab == nil then
	BossfuchouBossTab = {
		[107] = {BossID=823085,BossFastID=0,Tile={119,260},},
	}
end


Bossfuchou_TimeHD = Bossfuchou_TimeHD or API_CreateTimerTriggerG(0,0,60,-1,'Bossfuchou_TimeFunc')

function Bossfuchou_TimeFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
    if Hour == 21 then
		if  Minute == 00 then
			for j in BossfuchouBossTab do
				local MapID = API_GetRightMapID(j)
				local Table = BossfuchouBossTab[j]
				if API_MapIsValid(MapID) then
					local BossID = Table.BossID
					local BossFastID = Table.BossFastID
					if API_GetMonsterID(BossFastID) <= 0 then
						local RandomTime = math.random(1)
						API_CreateTimerTriggerG(j,0, RandomTime,1, 'Bossfuchou_CreatBoss')
				API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 17,'死神降临镜月3了！掉落全新宠物！！每天只刷新一次')
					end
				end
		    end
	    end
    end
end



function Bossfuchou_CreatBoss(MapConfigID,b)
	if BossfuchouBossTab[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = BossfuchouBossTab[MapConfigID]
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local BossFastID = Table.BossFastID
			if API_GetMonsterID(BossFastID) <= 0 then
				local Tile = Table.Tile
				local x = Tile[1]
				local y = Tile[2]
				local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
				Table.BossFastID = FastID
				API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'Bossfuchou_DieFunc')
			end
		end
	end
end

function Bossfuchou_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
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