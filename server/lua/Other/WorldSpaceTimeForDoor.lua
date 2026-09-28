--SpaceTimeForDoor
--开服后4小时内随机刷门，点完门之后，创建时间触发器，12-24小时内再刷一个门

YXD_SpaceTimeForDoorTab = {
	[98] = {DoorID=12201,MonID=850038,RandomNum=20,x1=177,y1=181,x2=578,y2=559,	x3=326,y3=319,x4=442,y4=441,	x5=326,y5=319,x6=442,y6=441,},
	[99] = {DoorID=12201,MonID=850038,RandomNum=20,x1=180,y1=110,x2=570,y2=612,	x3=348,y3=343,x4=399,y4=397,	x5=348,y5=343,x6=399,y6=397,},
	[102] = {DoorID=12201,MonID=850038,RandomNum=20,x1=322,y1=240,x2=788,y2=768,	x3=595,y3=768,x4=682,y4=852,	x5=489,y5=272,x6=576,y6=359,},
	--NPC和MONID需要林嘉伟设置，并且MONID需要申华配置金币掉落
	[10] = {DoorID=12343,MonID=887025,RandomNum=20,x1=84,y1=114,x2=379,y2=431,	x3=111,y3=283,x4=163,y4=340,	x5=111,y5=283,x6=163,y6=340,},
	[23] = {DoorID=12343,MonID=887025,RandomNum=20,x1=59,y1=30,x2=450,y2=383,	x3=101,y3=299,x4=166,y4=353,	x5=101,y5=299,x6=166,y6=353,},
	[111] = {DoorID=12344,MonID=887055,RandomNum=20,x1=139,y1=43,x2=645,y2=696,	x3=156,y3=450,x4=282,y4=561,	x5=298,y5=122,x6=433,y6=222,},
}

YXD_SpaceTimeForDoorName = {
	[12343] = {Name = '塔夫地穴',BossID = 850040,NeedLv = 16,Min = 21600,Max = 36000,},
	[12201] = {Name = '诅咒巨人之门',BossID = 850021,NeedLv = 36,Min = 21600,Max = 43200,},
	[12344] = {Name = '神龙安卡巢穴',BossID = 850042,NeedLv = 51,Min = 36000,Max = 57600,},
}

for j in YXD_SpaceTimeForDoorTab do
	local MapID = API_GetRightMapID(j)
	local Table = YXD_SpaceTimeForDoorTab[j]
	if API_MapIsValid(MapID) then
		local RandomTime = math.random(3600,14400)
		API_CreateTimerTriggerG(j,0, RandomTime,1, 'YXD_SpaceTimeForDoor_CreatFunc')
	end
end

function YXD_SpaceTimeForDoor_CreatFunc(MapConfigID,b)
	if YXD_SpaceTimeForDoorTab[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = YXD_SpaceTimeForDoorTab[MapConfigID]
		if API_MapIsValid(MapID) then
			local DoorID = Table.DoorID
			local RandomNum = Table.RandomNum
			local MonID = Table.MonID
			local x1 = Table.x1
			local y1 = Table.y1
			local x2 = Table.x2
			local y2 = Table.y2
			local x3 = Table.x3
			local y3 = Table.y3
			local x4 = Table.x4
			local y4 = Table.y4
			local x5 = Table.x5
			local y5 = Table.y5
			local x6 = Table.x6
			local y6 = Table.y6
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) and not ((x > x5 and x < x6) and (y > y5 and y < y6)) or Num == 300
			if not API_IsBlockTile(MapID,x,y,0) then
				local DoorName = YXD_SpaceTimeForDoorName[DoorID].Name
				local FastID = API_CreateMonster(MapID, DoorID, x, y, 4, 0, -1)
				API_SetMonsterName(FastID, DoorName, 1)
				for i = 1,RandomNum do
					API_CreateMonster(MapID, MonID, x, y, 4, 0, -1)
				end
			end
		end
	end
end

function YXD_SpaceTimeForDoor_OpenDoor(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	if API_GetMonsterID(NPCFastID) <= 0 then
		return
	end
	if YXD_SpaceTimeForDoorName[NPCID] == nil then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>奇怪，为啥进不去呢？</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		return
	end
	local DoorName = YXD_SpaceTimeForDoorName[NPCID].Name
	local NeedLv = YXD_SpaceTimeForDoorName[NPCID].NeedLv
	local Min = YXD_SpaceTimeForDoorName[NPCID].Min
	local Max = YXD_SpaceTimeForDoorName[NPCID].Max
	local PlayLv = API_GetActorExpLevel(ActorID)
	if PlayLv < NeedLv then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>只有高于 '..NeedLv..'级 的玩家才可以进入。</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		return
	end
	if XuanZe == 1 then
		local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID) 
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 and API_GetTeamLeader(TeamID) == ActorID then
			local TeamSize = API_GetTeamSize(TeamID)
			if TeamSize >= 3 then
				for i = 1,TeamSize do
					local TeamActorID = API_GetTeamMem(TeamID,i)
					if API_ActorIsOnline(TeamActorID) then
	 					local PlayX2,PlayY2 = PublicFun_GetActorPosXY(TeamActorID) 
	 					local JuLi = PublicFun_AccountDistance(PlayX,PlayY,PlayX2,PlayY2)
	 					if JuLi > 10 then
	 						API_ResponseWrite('<name></name>')
	 						API_ResponseWrite('<br><text>'..API_GetActorName(TeamActorID)..'距离太远或不在同一张地图，无法进入'..DoorName..'！</text><br>')
	 						API_ResponseWrite('<br><a>确定</a><br>')
							API_ResponseFlush(ActorID)
							return
						end
						if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<br><text>快递中，无法进入'..DoorName..'！</text><br>')
							API_ResponseWrite('<br><a>确定</a><br>')
							API_ResponseFlush(ActorID)
							return 
						end
						if API_ActorFindStatus(TeamActorID,519) then
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<br><text>摆摊中，无法进入'..DoorName..'！</text><br>')
							API_ResponseWrite('<br><a>确定</a><br>')
							API_ResponseFlush(ActorID)
							return 
						end
						if API_ActorIsDying(TeamActorID) then
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>死亡，无法进入'..DoorName..'！</text><br>')
							API_ResponseWrite('<br><a>确定</a><br>')
							API_ResponseFlush(ActorID)
							return 
						end
						if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<br><text>在公交车上无法进入'..DoorName..'！</text><br>')
							API_ResponseWrite('<br><a>确定</a><br>')
							API_ResponseFlush(ActorID)
							return
						end
					end
				end
				local MapID = API_GetActorMapID(ActorID)
				local MapConfigID = API_GetMapConfigID(MapID)
				local ObjectMapID = API_CreateEctype(1949,0)
				API_CreateMonster(ObjectMapID,11607,62,40,3,0,-1)
				YXD_SpaceTimeForDoor_Initialization(ObjectMapID,MapConfigID,NPCID)
				API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'YXD_SpaceTimeForDoor_PlayGotoMap')
				API_DestroyMonster(NPCFastID)
				local RandomTime = math.random(Min,Max)
				API_CreateTimerTriggerG(MapConfigID,0, RandomTime,1, 'YXD_SpaceTimeForDoor_CreatFunc')
			else
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>需要组满3人队伍才可以进入'..DoorName..'。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>'..DoorName..'必须拥有队长权限才可以打开。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	else
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>这个门里面藏着一只隐藏BOSS，你最少需要组成3人队伍，并且所有队伍成员都在门的10格范围内才可以由队长带领进入此门。</text><br>')
		API_ResponseWrite('<br><br><a href="YXD_SpaceTimeForDoor_OpenDoor?1=1">我要进入</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	end
	API_ResponseFlush(ActorID)
end

function YXD_SpaceTimeForDoor_Initialization(ObjectMapID,MapConfigID,DoorID)
	local BossID = YXD_SpaceTimeForDoorName[DoorID].BossID
	--创建BOSS，出口
	local FastID = API_CreateMonster(ObjectMapID,BossID,60,69,5,0,-1)
	API_CreateDieTriggerG(MapConfigID,DoorID,0,FastID,'YXD_SpaceTimeForDoor_BossDieFunc')
end

function YXD_SpaceTimeForDoor_PlayGotoMap(ObjectMapID,ActorID)
	--判断是否有队伍，是的话一起传进去
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorIsOnline(ActorID) then
		local MapID = API_GetActorMapID(ActorID)
		local MapConfigID = API_GetMapConfigID(MapID)
		--判断组队
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID then
					API_ActorGoToMap(TeamActorID,ObjectMapID,62,45)
				end
			end
		end
		API_ActorGoToMap(ActorID,ObjectMapID,62,45)
	end
end

function YXD_SpaceTimeForDoor_BossDieFunc(SayMapID,DoorID,Type,FastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if not API_MapIsValid(MapID) then
		return
	end
	local DoorName = YXD_SpaceTimeForDoorName[DoorID].Name
	local x1,y1,x2,y2 = 54,56,69,71	
	if YXD_WorldMonsterGoodsTab[MonsterID] ~= nil then
		local MonName = API_GetMonsterNameByID(MonsterID)
		local Table = YXD_WorldMonsterGoodsTab[MonsterID]
		local Say = ''
		local Num = 0
		local Card = 0
		for j in Table[1] do
			local RD = math.random(1000000)
			local GoodsID = Table[1][j].GoodsID
			local GoodsNum = Table[1][j].GoodsNum
			local GaiLv = Table[1][j].GaiLv
			local PinZhi = Table[1][j].PinZhi
			local GoodsName = API_GetGoodsName(GoodsID)
			if RD <= GaiLv then
				if PinZhi > 0 then
					local x,y
					local Num2 = 0
					repeat
						Num2 = Num2 + 1
						x = math.random(x1,x2)
						y = math.random(y1,y2)
					until not API_IsBlockTile(MapID,x,y,0) or Num2 == 100
					if not API_IsBlockTile(MapID,x,y,0) then
						API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',GuiShuXing,GuiShuID,600,120,PinZhi)
						if PinZhi == 6 then
							if YXD_WorldBoss_SayGoodsTab[GoodsID] ~= nil then
								Num = Num + 1
								if Num == 1 then
									if Card == 0 then
										Say = Say..'高附加属性3洞的'..GoodsName..''
									else
										Say = Say..'，高附加属性3洞的'..GoodsName..''
									end
								else
									Say = Say..'、'..GoodsName..''
								end
							end
						end
					end
				else
					local GuiShuXing2 = GuiShuXing 
					if GuiShuXing == 4 then
						GuiShuXing2 = 0
					elseif GuiShuXing == 0 then
						GuiShuXing2 = 4
					end
					local x,y
					local Num2 = 0
					repeat
						Num2 = Num2 + 1
						x = math.random(x1,x2)
						y = math.random(y1,y2)
					until not API_IsBlockTile(MapID,x,y,0) or Num2 == 100
					if not API_IsBlockTile(MapID,x,y,0) then
						API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',GuiShuXing2,GuiShuID,600,120)
						if YXD_WorldBoss_SayCardTab[GoodsID] ~= nil then
							Card = Card + 1
							if Card == 1 then
								Say = Say..'高级宠物卡'..GoodsName..''
							else
								Say = Say..'、'..GoodsName..''
							end
						end
					end
				end
			end
		end
		for i in Table[2] do
			local RD = math.random(1000000)
			local GoodsID = 0
			local LeiXing = Table[2][i].LeiXing
			local GaiLv = Table[2][i].GaiLv
			local GoodsNum = Table[2][i].Num
			local PinZhi = Table[2][i].PinZhi
			if RD <= GaiLv then
				if YXD_WorldDropGoodsTab[LeiXing] ~= nil then
					GoodsID = YXD_WorldDropGoodsTab[LeiXing][math.random(table.getn(YXD_WorldDropGoodsTab[LeiXing]))]
					local GoodsName = API_GetGoodsName(GoodsID)
					if PinZhi > 0 then
						local x,y
						local Num2 = 0
						repeat
							Num2 = Num2 + 1
							x = math.random(x1,x2)
							y = math.random(y1,y2)
						until not API_IsBlockTile(MapID,x,y,0) or Num2 == 100
						if not API_IsBlockTile(MapID,x,y,0) then
							API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',GuiShuXing,GuiShuID,600,120,PinZhi)
							if PinZhi == 6 then
								if YXD_WorldBoss_SayGoodsTab[GoodsID] ~= nil then
									Num = Num + 1
									if Num == 1 then
										if Card == 0 then
											Say = Say..'高附加属性3洞的'..GoodsName..''
										else
											Say = Say..'，高附加属性3洞的'..GoodsName..''
										end
									else
										Say = Say..'、'..GoodsName..''
									end
								end
							end
						end
					else
						local GuiShuXing2 = GuiShuXing 
						if GuiShuXing == 4 then
							GuiShuXing2 = 0
						elseif GuiShuXing == 0 then
							GuiShuXing2 = 4
						end
						local x,y
						local Num2 = 0
						repeat
							Num2 = Num2 + 1
							x = math.random(x1,x2)
							y = math.random(y1,y2)
						until not API_IsBlockTile(MapID,x,y,0) or Num2 == 100
						if not API_IsBlockTile(MapID,x,y,0) then
							API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',GuiShuXing2,GuiShuID,600,120)
							if YXD_WorldBoss_SayCardTab[GoodsID] ~= nil then
								Card = Card + 1
								if Card == 1 then
									Say = Say..'高级宠物卡'..GoodsName..''
								else
									Say = Say..'、'..GoodsName..''
								end
							end
						end
					end
				end
			end
		end
		if Card > 0 or Num > 0 then
			API_ActorBroadcastMsg(-1, 17,''..API_GetActorName(KillerID)..'与他的伙伴在'..API_GetMapName(SayMapID)..'意外发现了'..DoorName..'并杀死了里面的'..MonName..'，获得了'..Say..'。')
		else
			API_ActorBroadcastMsg(-1, 17,''..API_GetActorName(KillerID)..'与他的伙伴在'..API_GetMapName(SayMapID)..'意外发现了'..DoorName..'并杀死了里面的'..MonName..'，获得了高额奖励。')
		end
	end
end
