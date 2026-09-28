if GatherTreasureMonster_FastTab == nil then
	GatherTreasureMonster_FastTab = {}
end
GatherTreasureMonster_Tile = {
	[102] = {
		ServerID = 8,MonID = 850017,
		Tile = {
			{512,649,14},
			{531,453,7},
			{646,614,7},
			},
	},
	[120] = {
		ServerID = 9,MonID = 850018,
		Tile = {
			{320,452,14},
			{424,172,7},
			{489,435,7},
			},
	},
}
GatherTreasureMonster_ActTime = {
	[1] = {RedayTime=12,StartTime=13,EndTime=15,Num=11},
	[2] = {RedayTime=18,StartTime=19,EndTime=22,Num=17},
}
if not API_IsEctypeServer() or API_IsBranchServer() then
	if not API_IsBattleGameServer() then
		GatherTreasureMonster_ActFunc = GatherTreasureMonster_ActFunc or API_CreateTimerTriggerG(0,0,60,-1,'GatherTreasureMonster_ActTimeFunc')
	end
end
function GatherTreasureMonster_ActTimeFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local RedayTime,StartTime,EndTime,Num = 0,0,0,0
	for i = 1,table.getn(GatherTreasureMonster_ActTime) do
		local RT = GatherTreasureMonster_ActTime[i].RedayTime
		local ST = GatherTreasureMonster_ActTime[i].StartTime
		local ET = GatherTreasureMonster_ActTime[i].EndTime
		local Nm = GatherTreasureMonster_ActTime[i].Num
		if Hour >= RT and Hour < ET then
			RedayTime,StartTime,EndTime,Num = RT,ST,ET,Nm
		end
	end
	if RedayTime ~= 0 and StartTime ~= 0 and EndTime ~= 0 then
		if Hour == (StartTime - 1) and Minute >= 50 then
			GTM_Start = 0
			if math.mod(Minute,5) == 0 then
				API_ActorBroadcastMsgLevelEx(-1, -1, 31, 0, 17, '聚宝怪于'..StartTime..'：00--'..EndTime..'：00在沙暴绿洲和众神领域出现，欢迎各位英雄前去挑战！')
				API_ActorBroadcastMsgLevelEx(-1, -1, 31, 0, 8, '聚宝怪于'..StartTime..'：00--'..EndTime..'：00在沙暴绿洲和众神领域出现，欢迎各位英雄前去挑战！')
			end
		end
		if Hour >= StartTime and Hour < EndTime then
			if GTM_Start == nil or GTM_Start < 1 then
				GTM_Start = 1
				GatherTreasureMonster_CreateMonFunc()
				API_CreateTimerTriggerG(0,0,720,Num,'GatherTreasureMonster_CreateMonFunc')
				API_ActorBroadcastMsgLevelEx(-1, -1, 31, 0, 17, '聚宝怪在沙暴绿洲和众神领域出现！')
				API_ActorBroadcastMsgLevelEx(-1, -1, 31, 0, 8, '聚宝怪在沙暴绿洲和众神领域出现！')
			end
			if math.mod(Minute,10) == 0 then
				API_ActorBroadcastMsgLevelEx(-1, -1, 31, 0, 17, '聚宝怪在沙暴绿洲和众神领域出现！')
				API_ActorBroadcastMsgLevelEx(-1, -1, 31, 0, 8, '聚宝怪在沙暴绿洲和众神领域出现！')
			end
		end
		if Hour == (EndTime - 1) and Minute == 59 then
			if GTM_Start == nil or GTM_Start < 2 then
				GTM_Start = 2
				API_ActorBroadcastMsgLevelEx(-1, -1, 31, 0, 17, '聚宝怪已经停止出现！')
				API_ActorBroadcastMsgLevelEx(-1, -1, 31, 0, 8, '聚宝怪已经停止出现！')
			end
		end
	end
end

function GatherTreasureMonster_CreateMonFunc(a,b)
	for j in GatherTreasureMonster_Tile do
		local ServerID = GatherTreasureMonster_Tile[j].ServerID
		local Tile = GatherTreasureMonster_Tile[j].Tile
		local MonID = GatherTreasureMonster_Tile[j].MonID
		local MapID = API_GetRightMapID(j)
		if API_GetServerID() == ServerID then
			if GatherTreasureMonster_FastTab[MapID] == nil then GatherTreasureMonster_FastTab[MapID] = {} end
			for i = 1,table.getn(Tile) do
				if GatherTreasureMonster_FastTab[MapID][i] == nil then GatherTreasureMonster_FastTab[MapID][i] = {} end
				local x,y,Num = 0,0,0
				local TileTab = Tile[i]
				x = TileTab[1]
				y = TileTab[2]
				Num = TileTab[3]
				for p = 1,Num do
					if GatherTreasureMonster_FastTab[MapID][i][p] == nil then
						local FastID = API_CreateMonster(MapID,MonID,x,y,4,0,-1)
						GatherTreasureMonster_FastTab[MapID][i][p] = FastID
					else
						local FastID = GatherTreasureMonster_FastTab[MapID][i][p]
						if API_GetMonsterID(FastID) <= 0 then
							FastID = API_CreateMonster(MapID,MonID,x,y,4,0,-1)
							GatherTreasureMonster_FastTab[MapID][i][p] = FastID
						end
					end
				end
			end
		end
	end
end

function GatherTreasureMonster_MapPoin(ActorID)
	local ActorID = ActorID or API_RequestGetActorID() 
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if GatherTreasureMonster_Tile[MapConfigID] ~= nil then
		local Tile = GatherTreasureMonster_Tile[MapConfigID].Tile
		for i = 1,table.getn(Tile) do
			local MapPointID = MapConfigID * 100000 + 101 * 100 + i
			API_ActorDelMapPoint(ActorID,MapPointID)
			local x,y,Num = 0,0,0
			local TileTab = Tile[i]
			x = TileTab[1]
			y = TileTab[2]
			Num = TileTab[3]
			local Icon = 8
			if Num < 14 then
				API_ActorAddMapPoint(ActorID,MapPointID,MapConfigID,x,y,Icon,'每日13:00--15:00、19:00--22:00将出现聚宝怪（少）')
			else
				API_ActorAddMapPoint(ActorID,MapPointID,MapConfigID,x,y,Icon,'每日13:00--15:00、19:00--22:00将出现聚宝怪（多）')
			end
		end
	end
end
