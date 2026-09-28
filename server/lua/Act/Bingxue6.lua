--boss刷新脚本事例
--刘琪
--2010年4月30日

if Bingxue6BossTab == nil then
	Bingxue6BossTab = {
		[126] = {BossID=943084,BossFastID=0,Tile={302,408},},
	}
end


--[已停用] Bingxue6_TimeHD = Bingxue6_TimeHD or API_CreateTimerTriggerG(0,0,60,-1,'Bingxue6_TimeFunc')

function Bingxue6_TimeFunc(a,b)
	if true then return end --已停用：八门/五行/冰雪改走 BossLunHuan 轮换
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
    if Hour == 23 or Hour == 11  then
		if  Minute == 00 then
			for j in Bingxue6BossTab do
				local MapID = API_GetRightMapID(j)
				local Table = Bingxue6BossTab[j]
				if API_MapIsValid(MapID) then
					local BossID = Table.BossID
					local BossFastID = Table.BossFastID
					if API_GetMonsterID(BossFastID) <= 0 then
						local RandomTime = math.random(1)
						API_CreateTimerTriggerG(j,0, RandomTime,1, 'Bingxue6_CreatBoss')
				API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 17,'冰雪美人的真身!奇迹之岛出现了！掉落全新宠物！！三洞装备！全新载具！全新英雄！')
					end
				end
		    end
	    end
    end
end



function Bingxue6_CreatBoss(MapConfigID,b)
	if Bingxue6BossTab[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = Bingxue6BossTab[MapConfigID]
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local BossFastID = Table.BossFastID
			if API_GetMonsterID(BossFastID) <= 0 then
				local Tile = Table.Tile
				local x = Tile[1]
				local y = Tile[2]
				local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
				Table.BossFastID = FastID
				API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'Bingxue6_DieFunc')
			end
		end
	end
end

function Bingxue6_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if MonsterID ~= 943084 then
	elseif MonsterID == 943084 then
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