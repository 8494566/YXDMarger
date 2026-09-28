--圣诞节 活动脚本 by 万钰林 2009-12-4

--交互数据ID
--19038 	圣诞节积分
--19099		被使用了多少次圣诞袜		

--NPCID
--~ 圣诞树一阶	12214
--~ 圣诞树二阶	12215
--~ 圣诞树三阶	12216
--~ 圣诞树四阶	12217
--~ 圣诞活动兑换官	12218

--状态ID
--~ 新年祝福	864
--~ 圣诞欢乐大使	864001
--~ 新年祝福	868
--~ 元旦快乐大使	868001
--~ 魅力王	865
--~ 魅力王	865001
--~ 魅力帝	869
--~ 魅力帝	869001
--~ 魅力神	870
--~ 魅力神	870001

--~ 霉力卷轴	866
--~ 霉力卷轴	866001
--~ 净化卷轴	867
--~ 净化卷轴	867001

--称号ID
--~ 100 魅力王
--~ 101 魅力帝
--~ 102 魅力神
--~ 103 圣诞欢乐大使
--~ 104 元旦快乐大使

--道具ID
--圣诞袜		88606
--霉运卷轴	88607
--净化卷轴	88608
--遗失的礼包	80891

--卷轴ID
--圣诞节		104117

--每个地图的怪物
if Christmas_ActMonster == nil then
	Christmas_ActMonster = {}
end

--活动时间
Christmas_ActTime = {
	StartYear=2010,StartMonth=12,StartDay=21,EndYear=2011,EndMonth=1,EndDay=4,
	RedayTime=14,StartTime=15,EndTime=16,
}
Christmas_ActTime2 = {
	[1] = {RedayTime=11,StartTime=12,EndTime=13},
	[2] = {RedayTime=18,StartTime=19,EndTime=21},
}

--活动地图表 10 25 9 23 98 99
Christmas_ActMap = {
	[10] = {MonID=726450,MonNum=600,x1=80,y1=140,x2=410,y2=430,x3=111,y3=291,x4=154,y4=344,},
	[23] = {MonID=726450,MonNum=600,x1=80,y1=100,x2=410,y2=410,x3=107,y3=307,x4=160,y4=349,},
	[98] = {MonID=726451,MonNum=600,x1=177,y1=181,x2=578,y2=559,x3=326,y3=319,x4=442,y4=441,},
	[99] = {MonID=726451,MonNum=600,x1=180,y1=110,x2=570,y2=612,x3=348,y3=343,x4=399,y4=397,},
	[101] = {MonID=726451,MonNum=600,x1=282,y1=211,x2=620,y2=590,x3=423,y3=437,x4=443,y4=457,},
}

--每个地图内雪人NPC表
if Christmas_MapNpc == nil then
	Christmas_MapNpc = {
		[10] = {NpcID=12214,FastID=0,CZD=0,X=128,Y=282,LiuYan={},},
		[23] = {NpcID=12214,FastID=0,CZD=0,X=166,Y=319,LiuYan={},},
		[98] = {NpcID=12214,FastID=0,CZD=0,X=318,Y=389,LiuYan={},},
		[99] = {NpcID=12214,FastID=0,CZD=0,X=356,Y=411,LiuYan={},},
		[101] = {NpcID=12214,FastID=0,CZD=0,X=443,Y=448,LiuYan={},},
	}
end

Christmas_NpcUp = {
	[12214] = {NextCZD=10000,NextNpc=12215,},
	[12215] = {NextCZD=20000,NextNpc=12216,},
	[12216] = {NextCZD=30000,NextNpc=12217,},
	[12217] = {NextCZD=0,NextNpc=0,},
}

--圣诞树最高成长
Christmas_MaxCZD = 30000
--兑换奖励消耗N点积分
Christmas_ConsumptionPoints = 20
--开转盘消耗N个圣诞袜
Christmas_ConsumptionSocks = 3
--兑换称号要多少积分
Christmas_TitleNeedPoints = 360

if not API_IsEctypeServer() or API_IsBranchServer() then
	Christmas_TimerTriggerID = Christmas_TimerTriggerID or API_CreateTimerTriggerG(0,0,60,-1,'Christmas_GCallFunc')
end
--活动触发器
function Christmas_GCallFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local Time = os.time() 
	local NowTime = os.date("*t", os.time()) 
	NowTime.year = Christmas_ActTime.StartYear
	NowTime.month = Christmas_ActTime.StartMonth
	NowTime.day = Christmas_ActTime.StartDay
	NowTime.hour = 0 
	NowTime.min = 0 
	NowTime.sec = 0 
	local ActStartTime = os.time(NowTime) 
	local EndTime = os.date("*t", os.time()) 
	EndTime.year = Christmas_ActTime.EndYear
	EndTime.month = Christmas_ActTime.EndMonth
	EndTime.day = Christmas_ActTime.EndDay
	EndTime.hour = 0 
	EndTime.min = 0 
	EndTime.sec = 0 
	local EndTime2 = os.time(EndTime) 
	if Time >= ActStartTime and Time < EndTime2 then
--~ 		if not API_IsEctypeServer() and API_GetServerID() == 1 then
--~ 			LBChristmasNpc = LBChristmasNpc or API_CreateMonster(2,12218,232,137,4,0,-1)
--~ 			DGChristmasNpc = DGChristmasNpc or API_CreateMonster(1,12218,254,100,3,0,-1)
--~ 		end
		local RedayTime,StartTime,EndTime = 0,0,0
		for i = 1,table.getn(Christmas_ActTime2) do
			local RT = Christmas_ActTime2[i].RedayTime
			local ST = Christmas_ActTime2[i].StartTime
			local ET = Christmas_ActTime2[i].EndTime
			if Hour >= RT and Hour < ET then
				RedayTime,StartTime,EndTime = RT,ST,ET
			end
		end
		if RedayTime ~= 0 and StartTime ~= 0 and EndTime ~= 0 then
			for j in Christmas_ActMap do
				local MapID = API_GetRightMapID(j)
				if API_MapIsValid(MapID) then
					if Christmas_ActMonster[MapID] == nil then
						Christmas_ActMonster[MapID] = {}
					end
				end
			end
			--圣诞树
			local XiangChaDay = math.floor((Time - ActStartTime)/86400) + 1
			if XiangChaDay == 1 or XiangChaDay == 4 or XiangChaDay == 7 then
				if Hour == 1 and Minute == 0 then
					for j in Christmas_MapNpc do
						local MapID = API_GetRightMapID(j)
						if API_MapIsValid(MapID) then
							local NpcID = Christmas_MapNpc[j].NpcID
							local FastID = Christmas_MapNpc[j].FastID
							local X = Christmas_MapNpc[j].X
							local Y = Christmas_MapNpc[j].Y
							if FastID > 0 and API_GetMonsterID(FastID) > 0 then
								API_DestroyMonster(FastID)
							end
							FastID = API_CreateMonster(MapID,NpcID,X,Y,5,0,-1)
							Christmas_MapNpc[j].FastID = FastID
							Christmas_MapNpc[j].CZD = 0
						end
					end
				end
			end
--~ 			local RedayTime = Christmas_ActTime.RedayTime
--~ 			local StartTime = Christmas_ActTime.StartTime
--~ 			local EndTime = Christmas_ActTime.EndTime
			if Hour == (StartTime - 1) and Minute >= 30 then
				if Minute == 30 then
					for j in Christmas_MapNpc do
						local MapID = API_GetRightMapID(j)
						if API_MapIsValid(MapID) then
							local NpcID = Christmas_MapNpc[j].NpcID
							local FastID = Christmas_MapNpc[j].FastID
							local X = Christmas_MapNpc[j].X
							local Y = Christmas_MapNpc[j].Y
							if FastID == 0 or API_GetMonsterID(FastID) <= 0 then
								FastID = API_CreateMonster(MapID,NpcID,X,Y,5,0,-1)
								Christmas_MapNpc[j].FastID = FastID
								Christmas_MapNpc[j].CZD = 0
							end
						end
					end
				end
				WYL_Christmas_Start = 0
				if math.mod(Minute,10) == 0 then
					if API_GetServerID() == 1 then
						API_ActorBroadcastMsgLevRang(-1, -1, 12, 85,0, 17,'圣诞活动于'..StartTime..'：00--'..EndTime..'：00在珊瑚群岛、阳光雨林、娜沙湿地、月暮草场、落日农庄举行，欢迎各位英雄踊跃参与！')
						API_ActorBroadcastMsgLevRang(-1, -1, 12, 85,0, 8,'圣诞活动于'..StartTime..'：00--'..EndTime..'：00在珊瑚群岛、阳光雨林、娜沙湿地、月暮草场、落日农庄举行，欢迎各位英雄踊跃参与！')
					end
				end
			end
			if Hour >= StartTime and Hour < EndTime then
				if WYL_Christmas_Start == nil or WYL_Christmas_Start < 1 then
					WYL_Christmas_Start = 1
					Christmas_Monster_TimerFunc = nil
					Christmas_Monster_CallFunc()
					Christmas_Monster_TimerFunc = Christmas_Monster_TimerFunc or API_CreateTimerTriggerG(0,0,60,-1,'Christmas_Monster_CallFunc')
					if API_GetServerID() == 1 then
						API_ActorBroadcastMsgLevRang(-1, -1, 12, 85,0, 17,'圣诞活动现在开始！')
						API_ActorBroadcastMsgLevRang(-1, -1, 12, 85,0, 8,'圣诞活动现在开始！')
						if math.mod (Minute,5) == 0 and Minute < 45 then
							API_ActorBroadcastMsgLevRang(-1, -1, 12, 85,0, 17,'现在去珊瑚群岛、阳光雨林、娜沙湿地、月暮草场、落日农庄杀死礼包盗贼，可以获得装饰圣诞树的礼包！装饰圣诞树获得的冰寒积分可在圣诞树和主城出口的节日NPC处兑换各种礼品！')
							API_ActorBroadcastMsgLevRang(-1, -1, 12, 85,0, 8,'杀死出现在地图内的礼包盗贼，可以获得装饰圣诞树的礼包！')
						end
					end
				end
			end
			if Hour == (EndTime - 1) and Minute >= 45 then
				if WYL_Christmas_Start == nil or WYL_Christmas_Start < 2 then
					WYL_Christmas_Start = 2
					if math.mod(Minute,5) == 0 then
						if API_GetServerID() == 1 then
							API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,'请注意，各地图内出现的礼包盗贼将在'..EndTime..'点消失！')
							API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,'请注意，各地图内出现的礼包盗贼将在'..EndTime..'点消失！')
						end
					end
				end
			end
			if Hour == EndTime and Minute == 0 then
				if WYL_Christmas_Start == nil or WYL_Christmas_Start < 3 then
					WYL_Christmas_Start = 3
					if API_GetServerID() == 1 then
						API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,'今天的圣诞活动已经结束！')
						API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,'今天的圣诞活动已经结束！')
					end
				end
			end
			
		end
		if Hour == 23 and Minute == 45 then
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 16, 0)
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 17, 0)
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 18, 0)
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 19, 0)
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 20, 0)
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 21, 0)
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 22, 0)
		end
	elseif Time >= EndTime2 then
--~ 		if LBChristmasNpc ~= nil and API_GetMonsterID(LBChristmasNpc) > 0 then
--~ 			API_DestroyMonster(LBChristmasNpc)
--~ 			LBChristmasNpc = nil
--~ 		end
--~ 		if DGChristmasNpc ~= nil and API_GetMonsterID(DGChristmasNpc) > 0 then
--~ 			API_DestroyMonster(DGChristmasNpc)
--~ 			DGChristmasNpc = nil
--~ 		end
		API_DestroyTriggerG(TriggerID)
	end
end
--刷活动怪
function Christmas_Monster_CallFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local RedayTime,StartTime,EndTime = 0,0,0
	for i = 1,table.getn(Christmas_ActTime2) do
		local RT = Christmas_ActTime2[i].RedayTime
		local ST = Christmas_ActTime2[i].StartTime
		local ET = Christmas_ActTime2[i].EndTime
		if Hour >= RT and Hour < ET then
			RedayTime,StartTime,EndTime = RT,ST,ET
		end
	end
	if RedayTime ~= 0 and StartTime ~= 0 and EndTime ~= 0 then
		if Hour >= StartTime and Hour < EndTime then
			--判断地图存在，则刷怪
			for j in Christmas_ActMap do
				local MapID = API_GetRightMapID(j)
				if API_MapIsValid(MapID) and Christmas_ActMonster[MapID] ~= nil and type(Christmas_ActMonster[MapID]) == 'table' then
					local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
					local PlayNum = 50
					if PlayList ~= nil then
						PlayNum = table.getn(PlayList)
					end
					local MonID = Christmas_ActMap[j].MonID
					local MonNum = Christmas_ActMap[j].MonNum
					local x1 = Christmas_ActMap[j].x1
					local y1 = Christmas_ActMap[j].y1
					local x2 = Christmas_ActMap[j].x2
					local y2 = Christmas_ActMap[j].y2
					local x3 = Christmas_ActMap[j].x3
					local y3 = Christmas_ActMap[j].y3
					local x4 = Christmas_ActMap[j].x4
					local y4 = Christmas_ActMap[j].y4
					local PlayMin = 10
					local PlayMax = 150
					if PlayNum <= PlayMin then
						MonNum = 40
					elseif PlayNum > PlayMin and PlayNum <= PlayMax then
						local PlayNum2 = PlayNum - PlayMin
						MonNum = 40 + PlayNum2 * 4
					end
					for i = 1,MonNum do
						if Christmas_ActMonster[MapID][i] == nil then
							local x,y,Num = 0,0,0
							repeat
								Num = Num + 1
								x = math.random(x1,x2)
								y = math.random(y1,y2)
							until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
							if not API_IsBlockTile(MapID,x,y,0) then
								local FastID = API_CreateMonster(MapID,MonID,x,y,5,0,-1)
								API_CreateDieTriggerG(0,0,0,FastID,'Christmas_ThievesDieFunc')
								Christmas_ActMonster[MapID][i] = FastID
							end
						else
							local FastID = Christmas_ActMonster[MapID][i]
							if API_GetMonsterID(FastID) ~= MonID then
								local x,y,Num = 0,0,0
								repeat
									Num = Num + 1
									x = math.random(x1,x2)
									y = math.random(y1,y2)
								until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
								if not API_IsBlockTile(MapID,x,y,0) then
									local FastID = API_CreateMonster(MapID,MonID,x,y,5,0,-1)
									API_CreateDieTriggerG(0,0,0,FastID,'Christmas_ThievesDieFunc')
									Christmas_ActMonster[MapID][i] = FastID
								end
							end
						end
					end
				end
			end
		end
	else
		for j in Christmas_ActMap do
			local MapID = API_GetRightMapID(j)
			if API_MapIsValid(MapID) and Christmas_ActMonster[MapID] ~= nil and type(Christmas_ActMonster[MapID]) == 'table' then
				local MonID = Christmas_ActMap[j].MonID
				local MonNum = Christmas_ActMap[j].MonNum
				for i = 1,MonNum do
					local FastID = Christmas_ActMonster[MapID][i]
					if FastID ~= nil and API_GetMonsterID(FastID) == MonID then
						API_DestroyMonster(FastID)
						Christmas_ActMonster[MapID][i] = nil
					end
				end
			end
		end
		API_DestroyTriggerG(TriggerID)
	end
end

Christmas_ThievesDropGoods = {11322,11323,11324,11325,88589,88590,}
Christmas_ThievesDropGoodsNum = {
	[11322] = {Max=1,Key=17},
	[11323] = {Max=1,Key=18},
	[11324] = {Max=1,Key=19},
	[11325] = {Max=1,Key=20},
	[88589] = {Max=5,Key=21},
	[88590] = {Max=3,Key=22},
}
--礼包盗贼死亡触发器
function Christmas_ThievesDieFunc(a,b,Type,FastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY)
	if KillerType == -1 or KillerID == -1 then
		return
	end
	local RD = math.random(100)
	if RD == 1 then
		local Time = os.time()
		local LastTime = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 16)
		if Time >= LastTime then
			local GoodsID = Christmas_ThievesDropGoods[math.random(table.getn(Christmas_ThievesDropGoods))]
			local Max = Christmas_ThievesDropGoodsNum[GoodsID].Max
			local Key = Christmas_ThievesDropGoodsNum[GoodsID].Key
			local NowNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, Key)
			if NowNum < Max then
				if not API_IsBlockTile(MapID,PosX,PosY,0) then
					NowNum = NowNum + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, Key, NowNum)
					local LastTime2 = Time + 300
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 16, LastTime2)
					API_CreateDropGoods(MapID,PosX,PosY,GoodsID,1,0,'圣诞节盗贼掉落',0,KillerID,600,120) 
					if not API_IsBattleGameServer() then
						API_ActorBroadcastMsgLevRang(-1, -1, 12, 85,0, 17,'幸运的'..API_GetActorName(KillerID)..'在礼包盗贼的包里翻出了'..API_GetGoodsName(GoodsID)..'')
					end
				end
			end
		end
	end
end

--卷轴
function Christmas_Scroll()
	local ActorID = API_RequestGetActorID()
	local ChristmasPoints = API_VarDataGetNumber(ActorID,1,19038)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	API_ResponseWrite('<name></name>')
	API_ResponseWrite('<text>圣诞、元旦大狂欢</text><br>')
	API_ResponseWrite('<br><text>即日起至2011年1月3日，每天12:00--13:00和19:00--21:00 举行圣诞、元旦狂欢活动</text><br>')
	API_ResponseWrite('<br><text>活动开始，将在</text><text color="255,0,255"> 珊瑚群岛、阳光雨林、娜沙湿地、落日农庄、月暮草场 </text><text>出现大量的</text>')
	API_ResponseWrite('<text color="255,0,255"> 礼包盗贼 </text><text>，从礼包盗贼手中夺回</text><text color="255,0,255"> 遗失的礼包。</text>')
	API_ResponseWrite('<text>使用遗失的礼包可以装饰城镇周围的</text><text color="255,0,255">圣诞树。</text><text>装饰的过程中，会获得</text>')
	API_ResponseWrite('<text color="255,0,255">冰寒积分</text><text>，通过冰寒积分可以在</text><text color="255,0,255">圣诞树或冰寒积分兑换官处兑换礼物、开启圣诞欢乐转盘等。</text>')
	API_ResponseWrite('<text color="255,0,255">也可以到圣诞大使处通过购买</text><text color="255,0,255">冰雪寒宫传送卷</text><text>，并点击进入</text><text color="255,0,255">冰雪寒宫</text><text>击杀怪物，获得大量</text><text color="255,0,255">冰寒积分</text>。')
	API_ResponseWrite('<br><br><text>您目前的冰寒积分：</text><text color="255,0,255">'..ChristmasPoints..'分        </text><br>')
	if Christmas_MapNpc[MapConfigID] ~= nil then
		local FastID = Christmas_MapNpc[MapConfigID].FastID
		local X = Christmas_MapNpc[MapConfigID].X
		local Y = Christmas_MapNpc[MapConfigID].Y
		if FastID > 0 then
			API_ResponseWrite('<br><a mapid="'..MapID..'" x="'..X..'" y="'..Y..'" npcid="0" underline="1">前往圣诞树</a><br>')
			API_ResponseWrite('<br><a>关闭</a>')
		else
			API_ResponseWrite('<br><br><br><a>关闭</a>')
		end
	else
		API_ResponseWrite('<br><br><br><a>关闭</a>')
	end
end

--转盘函数
function Christmas_PointsAwards()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local ChristmasPoints = API_VarDataGetNumber(ActorID,1,19038)
	local SocksNum = API_ActorGetGoodsNum(ActorID,88606)
	if XuanZe == 1 then --消耗20积分
		local PlayLV = API_GetActorExpLevel(ActorID)
		local JiangLiGoodsTable = {}
		local PanDuan = 0 
		for j in MerryChristmas_GooDsTable do
			local MinLV = MerryChristmas_GooDsTable[j].MinLV
			local MaxLV = MerryChristmas_GooDsTable[j].MaxLV
			if PlayLV >= MinLV and PlayLV <= MaxLV then
				JiangLiGoodsTable = MerryChristmas_GooDsTable[j].Goodslist
				PanDuan = 1
			end
		end
		if PanDuan == 0 then
			API_ActorSendMsg(ActorID,3,'很抱歉，目前没有合适您等级的奖励')
			return
		end
		local JiangLiTable = {}
		local JiangLiTableGaiLv = math.random(100)
		for j in JiangLiGoodsTable do 
			local Min = JiangLiGoodsTable[j].Min
			local Max = JiangLiGoodsTable[j].Max
			if JiangLiTableGaiLv >= Min and JiangLiTableGaiLv <= Max then
				JiangLiTable = JiangLiGoodsTable[j].Goodslist
				break
			end
		end
		if ChristmasPoints >= Christmas_ConsumptionPoints then
			if API_ActorGetPackageSize(ActorID) > 0 then
				ChristmasPoints = ChristmasPoints - Christmas_ConsumptionPoints
				API_VarDataSetNumber(ActorID,1,19038,ChristmasPoints)
				local GaiLv = math.random(10000000)
				for j in JiangLiTable do
					local GaiLv1 = JiangLiTable[j].GaiLv1
					local GaiLv2 = JiangLiTable[j].GaiLv2
					if GaiLv >= GaiLv1 and GaiLv <= GaiLv2 then
						local GoodsID = JiangLiTable[j].GoodsID
						local GoodsNum = 0
						local NumGaiLv = JiangLiTable[j].NumGaiLv
						local NumMax = JiangLiTable[j].NumMax
						local NumMin = JiangLiTable[j].NumMin
						local NumRandom = math.random(10000)
						if NumRandom <= NumGaiLv then
							GoodsNum = NumMax
						else
							GoodsNum = NumMin
						end
						if GoodsNum > 0 then
							API_AddActorGoods(ActorID,GoodsID,GoodsNum,'兑换礼物获得 1个 '.. API_GetGoodsName(GoodsID)..'')
							API_ActorSendMsg(ActorID,10,'消耗 '..Christmas_ConsumptionPoints..'点 冰寒积分兑换奖励获得：'..API_GetGoodsName(GoodsID)..' × '..GoodsNum..'')
							API_ResponseWrite('<text>消耗 '..Christmas_ConsumptionPoints..'点 冰寒积分兑换奖励获得：</text>')
							API_ResponseWrite('<img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'">')
							API_ResponseWrite('<text> × '..GoodsNum..'</text><br>')
							API_ResponseWrite('<br><a href="Christmas_PointsAwards?1=1">继续兑换</a><br>')
							API_ResponseWrite('<br><br><a>关闭</a><br>')
						else
							local AddGX = MerryChristmas_JingYanTable[PlayLV]
							local ExploitL = API_GetActorExpLevel(ActorID)
							local expMax = API_GetExploitInfo(ExploitL,3)
							local expNow = API_GetActorCurExp(ActorID)
							local expAddMax = expMax - expNow
							if expAddMax >= AddGX then
								API_ActorAddExp(ActorID,AddGX,0,'圣诞NPC兑换得'..AddGX..'经验')
								API_ActorSendMsg(ActorID,10,'消耗 '..Christmas_ConsumptionPoints..'点 冰寒积分兑换奖励获得：经验 × '..AddGX..'')
								API_ResponseWrite('<text>消耗 '..Christmas_ConsumptionPoints..'点 冰寒积分兑换奖励获得：</text>')
								API_ResponseWrite('<img srcgd="'..Pub_VarExpGoodsID..'" tipgd="'..Pub_VarExpGoodsID..'" >')
								API_ResponseWrite('<text> × '..AddGX..'</text><br>')
								API_ResponseWrite('<br><a href="Christmas_PointsAwards?1=1">继续兑换</a><br>')
								API_ResponseWrite('<br><br><a>关闭</a><br>')
							elseif expAddMax == 0 then
								API_ActorSendMsg(ActorID,10,'消耗 '..Christmas_ConsumptionPoints..'点 冰寒积分兑换奖励：您的经验达到上限，已无法再获得经验，清尽快升级')
								API_ResponseWrite('<text>消耗 '..Christmas_ConsumptionPoints..'点 冰寒积分兑换奖励获得：</text>')
								API_ResponseWrite('<img srcgd="'..Pub_VarExpGoodsID..'" tipgd="'..Pub_VarExpGoodsID..'" >')
								API_ResponseWrite('<text> × 0 </text><br>')
								API_ResponseWrite('<br><text>您的经验达到上限，已无法再获得经验，清尽快升级</text><br>')
								API_ResponseWrite('<br><a href="Christmas_PointsAwards?1=1">继续兑换</a><br>')
								API_ResponseWrite('<br><br><a>关闭</a><br>')
							else
								API_ActorAddExp(ActorID,expAddMax,0,'圣诞NPC兑换得'..expAddMax..'经验')
								API_ActorSendMsg(ActorID,10,'消耗 '..Christmas_ConsumptionPoints..'点 冰寒积分兑换奖励获得：经验 × '..expAddMax..'')
								API_ResponseWrite('<text>消耗 '..Christmas_ConsumptionPoints..'点 冰寒积分兑换奖励获得：</text>')
								API_ResponseWrite('<img srcgd="'..Pub_VarExpGoodsID..'" tipgd="'..Pub_VarExpGoodsID..'" >')
								API_ResponseWrite('<text> × '..expAddMax..'</text><br>')
								API_ResponseWrite('<br><a href="Christmas_PointsAwards?1=1">继续兑换</a><br>')
								API_ResponseWrite('<br><br><a>关闭</a><br>')
							end
						end
					end
				end
			else
				API_ResponseWrite('<br><text>背包空间不足，无法兑换奖励。</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<br><text>冰寒积分不足'..Christmas_ConsumptionPoints..'点，无法兑换奖励。</text><br>') 
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	elseif XuanZe == 2 then --消耗3个圣诞袜
		if SocksNum >= 3 then
			--if API_ActorRemoveGoods(ActorID,88606,Christmas_ConsumptionSocks,'用'..Christmas_ConsumptionSocks..'个圣诞袜兑换奖励') then
				Christmas_Turntable(ActorID,88606)
				API_ResponseWrite('<br><text>圣诞快乐，祝您好运。</text><br>') 
				API_ResponseWrite('<br><br><a href="Christmas_PointsAwards?1=2">继续开启圣诞欢乐送</a><br>')
				API_ResponseWrite('<br><br><a>关闭</a><br>')
			--end
		else
			API_ResponseWrite('<br><text>您的圣诞袜不足'..Christmas_ConsumptionSocks..'个，无法开启圣诞欢乐送。</text><br>') 
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	elseif XuanZe == 3 then --兑换圣诞称号
		if ChristmasPoints >= Christmas_TitleNeedPoints then
			if API_IsOwnedName(ActorID,203,1) == 1 then
				API_ResponseWrite('<br><text>您已经拥有圣诞欢乐大使称号，不能重复兑换。</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a><br>')
			else
				ChristmasPoints = ChristmasPoints - Christmas_TitleNeedPoints
				API_VarDataSetNumber(ActorID,1,19038,ChristmasPoints)
				API_SetPlayerNickName(ActorID,203,'',1,0,1,1,{864001})
				API_ResponseWrite('<br><text>兑换成功，您获得了圣诞欢乐大使称号。</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<br><text>您的冰寒积分不足'..Christmas_TitleNeedPoints..'点，不能兑换节日称号。</text><br>') 
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	elseif XuanZe == 4 then --兑换元旦称号
		if ChristmasPoints >= Christmas_TitleNeedPoints then
			if API_IsOwnedName(ActorID,204,1) == 1 then
				API_ResponseWrite('<br><text>您已经拥有元旦快乐大使称号，不能重复兑换。</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a><br>')
			else
				API_SetPlayerNickName(ActorID,204,'',1,0,1,1,{868001})
				ChristmasPoints = ChristmasPoints - Christmas_TitleNeedPoints
				API_VarDataSetNumber(ActorID,1,19038,ChristmasPoints)
				API_ResponseWrite('<br><text>兑换成功，您获得了元旦快乐大使称号。</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<br><text>您的冰寒积分不足'..Christmas_TitleNeedPoints..'点，不能兑换节日称号。</text><br>') 
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	end
	API_ResponseFlush(ActorID)
end
--圣诞欢乐转盘
function Christmas_Turntable(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = GoodsID or 88606
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 3 then
		return
	end
	if LRY_LuckStarGoodsTable[GoodsID] == nil then
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local PlayName = API_GetActorName(ActorID)
	local JiangLiGoodsID = API_VarDataGetNumber(ActorID,1,12109)
	local JiangLiGoodsNumWZ = API_VarDataGetNumber(ActorID,1,12110)
	local JiangLiGoodsNum =  math.floor(JiangLiGoodsNumWZ/100)
	local Band = API_VarDataGetNumber(ActorID,1,12111)
	if JiangLiGoodsID > 0 and JiangLiGoodsNum > 0 then
		API_VarDataSetNumber(ActorID,1,12109,0)
		API_VarDataSetNumber(ActorID,1,12110,0)
		API_VarDataSetNumber(ActorID,1,12111,0)
		local GoodsName = API_GetGoodsName(JiangLiGoodsID)
		local PD = 0
		for j,v in baoshiwupinbiao do
			if JiangLiGoodsID == v then
				PD = 1
				break
			end
		end
		if PD == 1 then
			fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,1)
		else
			if Band == 1 then
				if API_ActorCanAddGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,1,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,JiangLiGoodsID,JiangLiGoodsNum,1,'圣诞欢乐送兑换奖励')
					API_ActorSendMsg(ActorID,10,'开启圣诞欢乐送获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'')
				else
					API_SendActorMailByName(PlayName,JiangLiGoodsID,JiangLiGoodsNum,1,'[圣诞欢乐送]奖励','获得'..JiangLiGoodsNum..'个'..GoodsName..'')
					API_ActorSendMsg(ActorID,10,'开启圣诞欢乐送获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'（请到邮箱领取）')
				end
			else
				if API_ActorCanAddGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,0,0) ~= -1 then
					API_AddActorGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,'圣诞欢乐送兑换奖励')
					API_ActorSendMsg(ActorID,10,'开启圣诞欢乐送获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'')
				else
					API_SendActorMail(ActorID,JiangLiGoodsID,JiangLiGoodsNum,'[圣诞欢乐送]奖励','获得'..JiangLiGoodsNum..'个'..GoodsName..'')
					API_ActorSendMsg(ActorID,10,'开启圣诞欢乐送获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'（请到邮箱领取）')
				end
			end
			if LRY_LuckStar_SayWorldGoods[JiangLiGoodsID] ~= nil then
				local JiaZhi = LRY_LuckStar_SayWorldGoods[JiangLiGoodsID]
				if JiaZhi >= LRY_LuckStar_SayWorldPoint then
					if not API_IsBattleGameServer() then
						API_ActorBroadcastMsg(-1,17,''..PlayName..'开启圣诞欢乐送获得了价值'..JiaZhi..'点券的'..GoodsName..'！')
					end
				end
			end
		end
	end
	local JiangLiQuYu = 1
	local XianShiQuYu = 1
	local JYDHQ = math.random(3,5)
	local PlayLv = API_GetActorExpLevel(ActorID)
	if PlayLv > 25 then
		JiangLiQuYu = 2
		JYDHQ = math.random(3,5)
		XianShiQuYu = 2
	end
	local JiangLiTable = LRY_LuckStarGoodsTable[GoodsID][JiangLiQuYu]
	local JiangLiGaiLv = math.random(10000000)
	local JiangLiGoodsID,JiangLiGoodsNum = 0,0
	for j in JiangLiTable do
		local GaiLv1 = JiangLiTable[j].GaiLv1
		local GaiLv2 = JiangLiTable[j].GaiLv2
		if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
			JiangLiGoodsID = JiangLiTable[j].GoodsID
			if JiangLiGoodsID == 11322 then
				if API_VarDataGetNumber_Ex(1,0,-6012,1,2) > 0 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6012,1,2)
					ShengYuNum = ShengYuNum - 1
					API_VarDataSetNumber_Ex_Sync(1,0,-6012,1,2,ShengYuNum)
				else
					JiangLiGoodsID = 80384
				end
			elseif JiangLiGoodsID == 11323 then
				if API_VarDataGetNumber_Ex(1,0,-6012,1,3) > 0 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6012,1,3)
					ShengYuNum = ShengYuNum - 1
					API_VarDataSetNumber_Ex_Sync(1,0,-6012,1,3,ShengYuNum)
				else
					JiangLiGoodsID = 80384
				end
			elseif JiangLiGoodsID == 11324 then
				if API_VarDataGetNumber_Ex(1,0,-6012,1,4) > 0 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6012,1,4)
					ShengYuNum = ShengYuNum - 1
					API_VarDataSetNumber_Ex_Sync(1,0,-6012,1,4,ShengYuNum)
				else
					JiangLiGoodsID = 80384
				end
			elseif JiangLiGoodsID == 11325 then
				if API_VarDataGetNumber_Ex(1,0,-6012,1,5) > 0 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6012,1,5)
					ShengYuNum = ShengYuNum - 1
					API_VarDataSetNumber_Ex_Sync(1,0,-6012,1,5,ShengYuNum)
				else
					JiangLiGoodsID = 80384
				end
			end
			local NumGaiLv = JiangLiTable[j].NumGaiLv
			local NumMax = JiangLiTable[j].NumMax
			local NumMin = JiangLiTable[j].NumMin
			--local BD = JiangLiTable[j].Band
			local BD = 0
			local NumRandom = math.random(10000)
			if NumRandom <= NumGaiLv then
				JiangLiGoodsNum = NumMax
			else
				JiangLiGoodsNum = NumMin
			end
			if JiangLiGoodsNum > 0 then
				if LRY_LuckStar_MaxGoodsNumTable[JiangLiGoodsID] ~= nil then
					local Num = LRY_LuckStar_MaxGoodsNumTable[JiangLiGoodsID].Num
					local MaxNum = LRY_LuckStar_MaxGoodsNumTable[JiangLiGoodsID].MaxNum
					--if Num < MaxNum and API_GetGameOnlineNum() >= 2000 and ((Hour >= 15 and Hour <= 17) or (Hour >= 20 and Hour <= 22)) then
					if Num < MaxNum then
						Num = Num + JiangLiGoodsNum
						LRY_LuckStar_MaxGoodsNumTable[JiangLiGoodsID].Num = Num 
						local GoodsNumWZ = JiangLiGoodsNum * 100
						API_VarDataSetNumber(ActorID,1,12109,JiangLiGoodsID)
						API_VarDataSetNumber(ActorID,1,12110,GoodsNumWZ)
						API_VarDataSetNumber(ActorID,1,12111,0)
					else
						JiangLiGoodsID = 80697
						JiangLiGoodsNum = JYDHQ
						local GoodsNumWZ = JiangLiGoodsNum * 100
						API_VarDataSetNumber(ActorID,1,12109,JiangLiGoodsID)
						API_VarDataSetNumber(ActorID,1,12110,GoodsNumWZ)
						API_VarDataSetNumber(ActorID,1,12111,0)
					end
				else
					local GoodsNumWZ = JiangLiGoodsNum * 100
					API_VarDataSetNumber(ActorID,1,12109,JiangLiGoodsID)
					API_VarDataSetNumber(ActorID,1,12110,GoodsNumWZ)
					API_VarDataSetNumber(ActorID,1,12111,0)
				end
			else
				JiangLiGoodsID = 80697
				JiangLiGoodsNum = JYDHQ
				local GoodsNumWZ = JiangLiGoodsNum * 100
				API_VarDataSetNumber(ActorID,1,12109,JiangLiGoodsID)
				API_VarDataSetNumber(ActorID,1,12110,GoodsNumWZ)
				API_VarDataSetNumber(ActorID,1,12111,0)
			end
		end
	end
	
	local XianShiTab = WYL_SevenDragonBalls_XianShiTab[XianShiQuYu]
	local JiangLiXianShiTab = WYL_SevenDragonBalls_JiangLiXianShiTab[XianShiQuYu]
	local XianShiNum1 = XianShiTab[1].Num
	local XianShiList1 = XianShiTab[1].GoodsList
	local XianShiNum2 = XianShiTab[2].Num
	local XianShiList2 = {}
	if JiangLiXianShiTab[JiangLiGoodsID] ~= nil then
		XianShiList2 = XianShiTab[3]
	else
		XianShiList2 = XianShiTab[2].GoodsList
	end
	local XianShiNum3 = 0
	local XianShiList3 = {11322,11323,11324,11325,88589,}
	if JiangLiGoodsID ~= 11322 and JiangLiGoodsID ~= 11323 and JiangLiGoodsID ~= 11324 and JiangLiGoodsID ~= 11325 and JiangLiGoodsID ~= 88589 then
		XianShiNum2 = XianShiNum2 - 1
		XianShiNum3 = 1
	end
	
	local PeerageLevel = API_GetActorPeerageLevel(ActorID)
	local TigerID = 1* 10000 + PeerageLevel * 100 
	API_VarDataSetNumber(ActorID,1,18261,TigerID)
	local RandomIconTigerList = {}
	
	while XianShiNum1 > 0 do
		local XuHao = table.getn(RandomIconTigerList) + 1
		local DJGoodsID = XianShiList1[math.random(table.getn(XianShiList1))]
		local DJGoodsNum = math.random(1,3)
		if DJGoodsID == 80498 or DJGoodsID == 80696 then
			DJGoodsNum = math.random(100,160)
		end
		if RandomIconTigerList[XuHao] == nil then
			RandomIconTigerList[XuHao] = {}
		end
		RandomIconTigerList[XuHao].GoodsID = DJGoodsID
		RandomIconTigerList[XuHao].GoodsNum = DJGoodsNum
		XianShiNum1 = XianShiNum1 - 1
	end
	while XianShiNum2 > 0 do
		local XuHao = table.getn(RandomIconTigerList) + 1
		local DJGoodsID,DJGoodsNum = 80697,144
		if JiangLiXianShiTab[JiangLiGoodsID] ~= nil then
			DJGoodsID = XianShiList2[XianShiNum2][1]
			DJGoodsNum = math.random(XianShiList2[XianShiNum2][2],XianShiList2[XianShiNum2][3])
		else
			DJGoodsID = XianShiList2[math.random(table.getn(XianShiList2))]
			DJGoodsNum = 1
		end
		if RandomIconTigerList[XuHao] == nil then
			RandomIconTigerList[XuHao] = {}
		end
		RandomIconTigerList[XuHao].GoodsID = DJGoodsID
		RandomIconTigerList[XuHao].GoodsNum = DJGoodsNum
		XianShiNum2 = XianShiNum2 - 1
	end
	while XianShiNum3 > 0 do
		local XuHao = table.getn(RandomIconTigerList) + 1
		local DJGoodsID = XianShiList3[math.random(table.getn(XianShiList3))]
		local DJGoodsNum = 1
		if RandomIconTigerList[XuHao] == nil then
			RandomIconTigerList[XuHao] = {}
		end
		RandomIconTigerList[XuHao].GoodsID = DJGoodsID
		RandomIconTigerList[XuHao].GoodsNum = DJGoodsNum
		XianShiNum3 = XianShiNum3 - 1
	end
	
	local JiangLiXuHao = table.getn(RandomIconTigerList) + 1
	if RandomIconTigerList[JiangLiXuHao] == nil then
		RandomIconTigerList[JiangLiXuHao] = {}
	end
	RandomIconTigerList[JiangLiXuHao].GoodsID = JiangLiGoodsID
	RandomIconTigerList[JiangLiXuHao].GoodsNum = JiangLiGoodsNum
	local ZhenIconTigerList = {}
	while table.getn(RandomIconTigerList) > 0 do
		local XuHao = table.getn(ZhenIconTigerList) + 1
		local RandomXuHao = math.random(table.getn(RandomIconTigerList))
		if ZhenIconTigerList[XuHao] == nil then
			ZhenIconTigerList[XuHao] = {}
		end
		ZhenIconTigerList[XuHao].GoodsID = RandomIconTigerList[RandomXuHao].GoodsID
		ZhenIconTigerList[XuHao].GoodsNum = RandomIconTigerList[RandomXuHao].GoodsNum
		table.remove(RandomIconTigerList,RandomXuHao)
	end
	GLOBAL_CycTask_ActorIconTigerList[ActorID] = ZhenIconTigerList
	local XianShiIconTigerList = {}
	for i = 1,table.getn(ZhenIconTigerList) do
		local XuHao = table.getn(XianShiIconTigerList) + 1
		if XianShiIconTigerList[XuHao] == nil then
			XianShiIconTigerList[XuHao] = {}
		end
		XianShiIconTigerList[XuHao] = ZhenIconTigerList[i].GoodsID
		XianShiIconTigerList[XuHao + 1] = ZhenIconTigerList[i].GoodsNum
	end
	local WeiZhi = 1
	for i = 1,table.getn(GLOBAL_CycTask_ActorIconTigerList[ActorID]) do
		local GoodsID = GLOBAL_CycTask_ActorIconTigerList[ActorID][i].GoodsID 
		local GoodsNum = GLOBAL_CycTask_ActorIconTigerList[ActorID][i].GoodsNum
		if GoodsID == JiangLiGoodsID and  GoodsNum == JiangLiGoodsNum then
			WeiZhi = i
			break
		end
	end
	if API_ActorRemoveGoods(ActorID,GoodsID,Christmas_ConsumptionSocks,'圣诞欢乐转盘删除'..API_GetGoodsName(GoodsID)..'兑换奖励') then
		local JiangLiGoodsNumWZ = API_VarDataGetNumber(ActorID,1,12110)
		API_VarDataSetNumber(ActorID,1,12110,JiangLiGoodsNumWZ+WeiZhi)
		API_OpenIconTiger(ActorID,TigerID,WeiZhi,'圣诞欢乐转盘','LRY_LuckStar_IconTigerAgainFunc','Christmas_IconTigerPickFunc',16,XianShiIconTigerList)
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[63][8][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[63][8][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[63][8][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][8][LaiYuan] + 1
			end
	end
end

function Christmas_IconTigerPickFunc()
	local ActorID = API_RequestGetActorID()
	local PlayName = API_GetActorName(ActorID)
	local JiangLiGoodsID = API_VarDataGetNumber(ActorID,1,12109)
	local JiangLiGoodsNumWZ = API_VarDataGetNumber(ActorID,1,12110)
	local JiangLiGoodsNum =  math.floor(JiangLiGoodsNumWZ/100)
	local WeiZhi = math.mod(JiangLiGoodsNumWZ,100)
	local Band = API_VarDataGetNumber(ActorID,1,12111)
	if GLOBAL_CycTask_ActorIconTigerList[ActorID] ~= nil then
		if GLOBAL_CycTask_ActorIconTigerList[ActorID][WeiZhi].GoodsID == JiangLiGoodsID and GLOBAL_CycTask_ActorIconTigerList[ActorID][WeiZhi].GoodsNum == JiangLiGoodsNum then
			API_VarDataSetNumber(ActorID,1,12109,0)
			API_VarDataSetNumber(ActorID,1,12110,0)
			API_VarDataSetNumber(ActorID,1,12111,0)
			local GoodsName = API_GetGoodsName(JiangLiGoodsID)
			local PD = 0
			for j,v in baoshiwupinbiao do
				if JiangLiGoodsID == v then
					PD = 1
					break
				end
			end
			if PD == 1 then
				fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,1)
			else
				if Band == 1 then
					if API_ActorCanAddGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,1,0) ~= -1 then
						API_AddActorGoodsFlag(ActorID,JiangLiGoodsID,JiangLiGoodsNum,1,'圣诞欢乐送兑换奖励')
						API_ActorSendMsg(ActorID,10,'开启圣诞欢乐送获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'')
					else
						API_SendActorMailByName(PlayName,JiangLiGoodsID,JiangLiGoodsNum,1,'[圣诞欢乐送]奖励','获得'..JiangLiGoodsNum..'个'..GoodsName..'')
						API_ActorSendMsg(ActorID,10,'开启圣诞欢乐送获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'（请到邮箱领取）')
					end
				else
					if API_ActorCanAddGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,0,0) ~= -1 then
						API_AddActorGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,'圣诞欢乐送兑换奖励')
						API_ActorSendMsg(ActorID,10,'开启圣诞欢乐送获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'')
					else
						API_SendActorMail(ActorID,JiangLiGoodsID,JiangLiGoodsNum,'[圣诞欢乐送]奖励','获得'..JiangLiGoodsNum..'个'..GoodsName..'')
						API_ActorSendMsg(ActorID,10,'开启圣诞欢乐送获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'（请到邮箱领取）')
					end
				end
				if LRY_LuckStar_SayWorldGoods[JiangLiGoodsID] ~= nil then
					local JiaZhi = LRY_LuckStar_SayWorldGoods[JiangLiGoodsID]
					if JiaZhi >= LRY_LuckStar_SayWorldPoint then
						if not API_IsBattleGameServer() then
							API_ActorBroadcastMsg(-1,17,''..PlayName..'开启圣诞欢乐送获得了价值'..JiaZhi..'点券的'..GoodsName..'！')
						end
					end
				end
			end
			GLOBAL_CycTask_ActorIconTigerList[ActorID] = nil
		end
	end
end

--圣诞树点击函数
function Christmas_ClickThree(ActorID,NpcID)
	local ActorID = ActorID or API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local NpcID = NpcID or API_VarDataGetNumber(ActorID,0,32711)
	local NpcFastID = API_VarDataGetNumber(ActorID,0,32712)
	local ChristmasPoints = API_VarDataGetNumber(ActorID,1,19038)
	if Christmas_NpcUp[NpcID] == nil then
		API_ActorSendMsg(ActorID,3,'无效NPC')
		return
	end
	local NextCZD = Christmas_NpcUp[NpcID].NextCZD
	local NextNpc = Christmas_NpcUp[NpcID].NextNpc
	if Christmas_MapNpc[MapConfigID] == nil then
		API_ActorSendMsg(ActorID,3,'无效NPC')
		return
	end
	local FastID = Christmas_MapNpc[MapConfigID].FastID
	local CZD = Christmas_MapNpc[MapConfigID].CZD
	if NpcFastID ~= FastID then
		API_ActorSendMsg(ActorID,3,'无效NPC')
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	API_ResponseWrite('<name>圣诞树</name>')
	--API_ResponseWrite('<win rect="90,350,830,285"></win>') 
	API_ResponseWrite('<text color="127,255,255">圣诞快乐！活动时间：即日起～1月3日</text><br>')
	if NpcID == 12217 then
		API_ResponseWrite('<br><text>圣诞树上挂满了礼物，好漂亮呀 ^_^</text><br>')
		API_ResponseWrite('<br><text>您目前的冰寒积分：</text><text color="255,0,255">'..ChristmasPoints..'分</text><br>')
--~ 		API_ResponseWrite('<br><a href="Christmas_PointsAwards?1=1">20点冰寒积分兑换奖励</a><br>')
		if Year == 2010 then
			API_ResponseWrite('<br><a href="Christmas_PointsAwards?1=3">兑换圣诞欢乐大使称号（需'..Christmas_TitleNeedPoints..'点冰寒积分）</a><br>')
		else
			API_ResponseWrite('<br><a href="Christmas_PointsAwards?1=4">兑换元旦快乐大使称号（需'..Christmas_TitleNeedPoints..'点冰寒积分）</a><br>')
		end
		API_ResponseWrite('<br><a href="Christmas_ThreeUp?1=1">用礼包装饰圣诞树</a><br>')
	else
		API_ResponseWrite('<br><text>您目前的冰寒积分：</text><text color="255,0,255">'..ChristmasPoints..'分</text><br>')
--~ 		API_ResponseWrite('<br><a href="Christmas_PointsAwards?1=1">20点冰寒积分兑换奖励</a><br>')
		local a = Christmas_MaxCZD - CZD
		if a > 0 then
			API_ResponseWrite('<br><text>还需要</text><text color="255,0,0">'..a..'个</text><text>礼包才能完成装饰。</text><br>')
		else
			if Year == 2010 then
				API_ResponseWrite('<br><a href="Christmas_PointsAwards?1=3">兑换圣诞欢乐大使称号（需'..Christmas_TitleNeedPoints..'点冰寒积分）</a><br>')
			else
				API_ResponseWrite('<br><a href="Christmas_PointsAwards?1=4">兑换元旦快乐大使称号（需'..Christmas_TitleNeedPoints..'点冰寒积分）</a><br>')
			end
		end
		API_ResponseWrite('<br><a href="Christmas_ThreeUp?1=1">用礼包装饰圣诞树</a><br><br><br>')
	end
	API_ResponseWrite('<br><a>关闭</a>')
	API_ResponseFlush(ActorID)
end
function Christmas_ThreeUp()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local NpcID = API_VarDataGetNumber(ActorID,0,32711)
	local NpcFastID = API_VarDataGetNumber(ActorID,0,32712)
	if Christmas_NpcUp[NpcID] == nil then
		API_ActorSendMsg(ActorID,3,'无效NPC')
		return
	end
	local NextCZD = Christmas_NpcUp[NpcID].NextCZD
	local NextNpc = Christmas_NpcUp[NpcID].NextNpc
	if Christmas_MapNpc[MapConfigID] == nil then
		API_ActorSendMsg(ActorID,3,'无效NPC')
		return
	end
	local FastID = Christmas_MapNpc[MapConfigID].FastID
	local CZD = Christmas_MapNpc[MapConfigID].CZD
	local LiuYan = Christmas_MapNpc[MapConfigID].LiuYan
	if NpcFastID ~= FastID then
		API_ActorSendMsg(ActorID,3,'无效NPC')
		return
	end
	local PlayName = API_GetActorName(ActorID)
	if XuanZe == 1 then --放材料
		local Points = API_VarDataGetNumber(ActorID,1,19038) --获取玩家身上的冰寒积分
		local GoodsID = 80891
		local GoodsNum = API_ActorGetGoodsNum(ActorID,GoodsID)
		if GoodsNum > 0 then
			if API_ActorRemoveGoods(ActorID,GoodsID,GoodsNum,'堆圣诞树扣道具') then
				Points = Points + GoodsNum
				API_VarDataSetNumber(ActorID,1,19038,Points)
				CZD = CZD + GoodsNum
				Christmas_MapNpc[MapConfigID].CZD = CZD
				API_ActorSendMsg(ActorID,10,'为圣诞树装饰了'..GoodsNum..'个礼包，获得'..GoodsNum..'点冰寒积分')
				if NextNpc > 0 then
					if CZD >= NextCZD then
						local X = Christmas_MapNpc[MapConfigID].X
						local Y = Christmas_MapNpc[MapConfigID].Y
						API_DestroyMonster(FastID)
						FastID = API_CreateMonster(MapID,NextNpc,X,Y,5,0,-1)
						Christmas_MapNpc[MapConfigID].FastID = FastID
					end
				end
			end
		else
			API_ResponseWrite('<br><text>你没有礼包，无法装饰圣诞树</text><br>')
			API_ResponseWrite('<br><br><a>关闭</a>')
		end
	end
	API_ResponseFlush(ActorID)
end

--使用圣诞袜
function Christmas_UseSocks(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	API_ActorStartSelect(ActorID,'Christmas_SocksClick',15)
	API_ActorSendMsg(ActorID,3,'请点击玩家使用')
	return 1
end
function Christmas_SocksClick()
	local ActorID = API_RequestGetNumber(1)
	local SelectType = API_RequestGetNumber(2)
	local OtherID = API_RequestGetNumber(3)
	local GoodsID = 88606
	local StatusID = 867001
	if SelectType == 0 then
		API_ActorStartSelect(ActorID,'Christmas_SocksClick',15)
		API_ActorSendMsg(ActorID,3,'请点击玩家使用')
	elseif SelectType == 1 then
		API_ActorStartSelect(ActorID,'Christmas_SocksClick',15)
		API_ActorSendMsg(ActorID,3,'请点击玩家使用')
	elseif SelectType == 2 then
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			return
		end
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用圣诞袜') then
			local OtherClickNum = API_VarDataGetNumber(OtherID,1,19099)
			OtherClickNum = OtherClickNum + 1
			--if API_ActorFindStatus(OtherID, 870) then
			if ActorID == OtherID then
				API_ActorSendMsg(ActorID,10,'你使用了圣诞礼袜获得了祝福')
			else
				API_ActorSendMsg(ActorID,10,'你将祝福送给了'.. API_GetActorName(OtherID)..'')
				API_ActorSendMsg(OtherID,10,''.. API_GetActorName(ActorID)..'送给了你祝福')
			end
			if API_IsOwnedName(OtherID,202,1) == 1 then
				API_VarDataSetNumber(OtherID,1,19099,OtherClickNum)
				--API_ActorStartSelect(ActorID,'Christmas_SocksClick',15)
				--API_ActorSendMsg(ActorID,3,'不能对已经成神的玩家使用')
				--return
			else
				if OtherClickNum >=  30 then
					API_VarDataSetNumber(OtherID,1,19099,0)
					--API_ActorRemoveStatus(OtherID, 865001)
					--API_ActorRemoveStatus(OtherID, 869001)
					--API_ActorAddStatus(OtherID, 870001, 0)
					API_SetPlayerNickName(OtherID,202,'',1,0,1,1,{870001})
					API_DelPlayerNickName(OtherID,200)
					API_DelPlayerNickName(OtherID,201)
					API_UsePlayerNickName(OtherID,202,1)
					API_ActorSendMsg(OtherID,10,'祝福累积成巨大的能量，你获得了魅力神的称号！')
				elseif OtherClickNum ==  20 then
					API_VarDataSetNumber(OtherID,1,19099,OtherClickNum)
					--API_ActorRemoveStatus(OtherID, 865001)
					--API_ActorAddStatus(OtherID, 869001, 0)
					API_SetPlayerNickName(OtherID,201,'',1,0,1,1,{869001})
					API_DelPlayerNickName(OtherID,200)
					API_UsePlayerNickName(OtherID,201,1)
					API_ActorSendMsg(OtherID,10,'祝福累积成强大的能量，你获得了魅力帝的称号！')
				elseif OtherClickNum ==  10 then
					API_VarDataSetNumber(OtherID,1,19099,OtherClickNum)
					API_SetPlayerNickName(OtherID,200,'',1,0,1,1,{865001})
					API_ActorSendMsg(OtherID,10,'祝福累积成能量，你获得了魅力王的称号！')
				else
					API_VarDataSetNumber(OtherID,1,19099,OtherClickNum)
				end
			end
		end
	else
		API_ActorStartSelect(ActorID,'Christmas_SocksClick',15)
		API_ActorSendMsg(ActorID,3,'请点击玩家使用')
	end
end

--使用霉运卷轴
function Christmas_UseBadLuckReel(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID) 
	local MapConfigID = API_GetMapConfigID(MapID) 
	local StaticMapID = API_GetStaticMapID(MapID)
	if MapID == StaticMapID then
		API_ActorStartSelect(ActorID,'Christmas_BadLuckReelClick',15)
		API_ActorSendMsg(ActorID,3,'请点击玩家使用')
		return 1
	else
		API_ActorSendMsg(ActorID,3,'不能在这里使用')
		return 0
	end
end
function Christmas_BadLuckReelClick()
	local ActorID = API_RequestGetNumber(1)
	local SelectType = API_RequestGetNumber(2)
	local OtherID = API_RequestGetNumber(3)
	local GoodsID = 88607
	local StatusID = 866001
	if SelectType == 0 then
		API_ActorStartSelect(ActorID,'Christmas_BadLuckReelClick',15)
		API_ActorSendMsg(ActorID,3,'请点击玩家使用')
	elseif SelectType == 1 then
		API_ActorStartSelect(ActorID,'Christmas_BadLuckReelClick',15)
		API_ActorSendMsg(ActorID,3,'请点击玩家使用')
	elseif SelectType == 2 then
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			return
		end
		if ActorID ~= OtherID then
			if API_ActorFindStatus(OtherID, 866) then
				API_ActorSendMsg(ActorID,3,'这个玩家已经够倒霉了，请不要再折磨他了……')
			else
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用霉运卷轴') then
					API_ActorAddStatus(OtherID, StatusID, 0)
					API_ActorSendMsg(ActorID,10,'你对'.. API_GetActorName(OtherID)..'施放诅咒成功，邪恶的人！')
					API_ActorSendMsg(OtherID,10,'你被邪恶的'.. API_GetActorName(ActorID)..'诅咒了，真可怜……')
				end
			end
		else
			API_ActorStartSelect(ActorID,'Christmas_BadLuckReelClick',15)
			API_ActorSendMsg(ActorID,3,'不能对自己使用')
		end
	else
		API_ActorStartSelect(ActorID,'Christmas_BadLuckReelClick',15)
		API_ActorSendMsg(ActorID,3,'请点击玩家使用')
	end
end
--使用净化卷轴
function Christmas_UsePurifyReel(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
--~ 	local MapID = API_GetActorMapID(ActorID) 
--~ 	local MapConfigID = API_GetMapConfigID(MapID) 
--~ 	local StaticMapID = API_GetStaticMapID(MapID)
--~ 	if MapID == StaticMapID then
		API_ActorStartSelect(ActorID,'Christmas_PurifyReelClick',15)
		API_ActorSendMsg(ActorID,3,'请点击玩家使用')
		return 1
--~ 	else
--~ 		API_ActorSendMsg(ActorID,3,'不能在这里使用')
--~ 		return 0
--~ 	end
end
function Christmas_PurifyReelClick()
	local ActorID = API_RequestGetNumber(1)
	local SelectType = API_RequestGetNumber(2)
	local OtherID = API_RequestGetNumber(3)
	local GoodsID = 88608
	local StatusID = 867001
	if SelectType == 0 then
		API_ActorStartSelect(ActorID,'Christmas_PurifyReelClick',15)
		API_ActorSendMsg(ActorID,3,'请点击玩家使用')
	elseif SelectType == 1 then
		API_ActorStartSelect(ActorID,'Christmas_PurifyReelClick',15)
		API_ActorSendMsg(ActorID,3,'请点击玩家使用')
	elseif SelectType == 2 then
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			return
		end
		if API_ActorFindStatus(OtherID, 866) then
			if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用净化卷轴') then
				API_ActorRemoveStatus(OtherID, 866001)
				API_ActorAddStatus(OtherID, StatusID, 0)
				if ActorID ~= OtherID then
					API_ActorSendMsg(ActorID,10,'成功解除'.. API_GetActorName(OtherID)..'身上的诅咒，你真是太伟大了！')
					API_ActorSendMsg(OtherID,10,'伟大的'.. API_GetActorName(ActorID)..'将你从诅咒的痛苦中解救出来了，赞美他吧！')
				else
					API_ActorSendMsg(ActorID,10,'成功解除了自己身上的诅咒，悲剧结束了！')
				end
			end
		else
			API_ActorStartSelect(ActorID,'Christmas_PurifyReelClick',15)
			API_ActorSendMsg(ActorID,3,'不能对没有被诅咒的人使用')
		end
	else
		API_ActorStartSelect(ActorID,'Christmas_PurifyReelClick',15)
		API_ActorSendMsg(ActorID,3,'请点击玩家使用')
	end
end
