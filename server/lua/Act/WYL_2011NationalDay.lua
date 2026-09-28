----------------------------------------------
--2011国庆活动脚本
--制作人：万钰林
--时间：2011年9月15日
--公司：腾讯
----------------------------------------------
--建立每个地图单个的怪物表，包含刷新数量，现有数量等
--建立时间触发器，每2分钟回调一次，传入一个数值，当数值可以被5整除时刷小BOSS
--刷怪时创建怪物死亡触发器
--死亡掉落奖励
--点击卷轴兑换道具

if WYL_2011NationalDay_FastMonTab == nil then
	WYL_2011NationalDay_FastMonTab = {}
end

WYL_2011NationalDay_MonTab = {
	[10] = {SMonID=731201,SMonNum=200,BMonID=731209,BMonNum=20,x1=84,y1=114,x2=379,y2=431,	x3=111,y3=283,x4=163,y4=340,	x5=111,y5=283,x6=163,y6=340,}, --珊瑚群岛
	[23] = {SMonID=731205,SMonNum=200,BMonID=731213,BMonNum=20,x1=59,y1=30,x2=450,y2=383,	x3=101,y3=299,x4=166,y4=353,	x5=101,y5=299,x6=166,y6=353,}, --阳光雨林
	[98] = {SMonID=731202,SMonNum=200,BMonID=731210,BMonNum=20,x1=177,y1=181,x2=578,y2=559,	x3=326,y3=319,x4=442,y4=441,	x5=326,y5=319,x6=442,y6=441,}, --娜沙湿地
	[99] = {SMonID=731206,SMonNum=200,BMonID=731214,BMonNum=20,x1=180,y1=110,x2=570,y2=612,	x3=348,y3=343,x4=399,y4=397,	x5=348,y5=343,x6=399,y6=397,}, --落日农庄
	[101] = {SMonID={731203,731207,},SMonNum=100,BMonID={731211,731215,},BMonNum=30,x1=282,y1=211,x2=620,y2=590,	x3=0,y3=1,x4=0,y4=1,	x5=0,y5=1,x6=0,y6=0,}, --月暮草场
	[111] = {SMonID={731204,731208,},SMonNum=100,BMonID={731212,731216,},BMonNum=40,x1=139,y1=43,x2=645,y2=696,	x3=156,y3=450,x4=282,y4=561,	x5=298,y5=122,x6=433,y6=222,}, --光明遗迹
}

WYL_2011NationalDay_MonDropTab = {
	--16
	[731201] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=2,NumMin=1},
			{GoodsID=89076,GaiLv1=2500,NumMax=1,NumMin=1},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=102,GaiLv1=1000,NumMax=2,NumMin=1},
			{GoodsID=202,GaiLv1=1000,NumMax=2,NumMin=1},
		},
	[731205] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=2,NumMin=1},
			{GoodsID=89076,GaiLv1=2500,NumMax=1,NumMin=1},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=102,GaiLv1=1000,NumMax=2,NumMin=1},
			{GoodsID=202,GaiLv1=1000,NumMax=2,NumMin=1},
		},
	[731209] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=20,NumMin=10},
			{GoodsID=89076,GaiLv1=6000,NumMax=3,NumMin=1},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=82004,GaiLv1=500,NumMax=2,NumMin=1},
			{GoodsID=0,GaiLv1=20,NumMax=1,NumMin=1},
			{GoodsID=80381,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=80383,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=117,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=206,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=201,GaiLv1=1000,NumMax=3,NumMin=1},
			{GoodsID=101,GaiLv1=1000,NumMax=3,NumMin=1},
		},
	[731213] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=20,NumMin=10},
			{GoodsID=89076,GaiLv1=6000,NumMax=3,NumMin=1},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=82004,GaiLv1=500,NumMax=2,NumMin=1},
			{GoodsID=0,GaiLv1=20,NumMax=1,NumMin=1},
			{GoodsID=80381,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=80383,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=117,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=206,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=201,GaiLv1=1000,NumMax=3,NumMin=1},
			{GoodsID=101,GaiLv1=1000,NumMax=3,NumMin=1},
		},
	--31
	[731202] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=2,NumMin=1},
			{GoodsID=89076,GaiLv1=2500,NumMax=1,NumMin=1},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=102,GaiLv1=1000,NumMax=2,NumMin=1},
			{GoodsID=202,GaiLv1=1000,NumMax=2,NumMin=1},
		},
	[731206] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=2,NumMin=1},
			{GoodsID=89076,GaiLv1=2500,NumMax=1,NumMin=1},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=102,GaiLv1=1000,NumMax=2,NumMin=1},
			{GoodsID=202,GaiLv1=1000,NumMax=2,NumMin=1},
		},
	[731210] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=30,NumMin=20},
			{GoodsID=89076,GaiLv1=6000,NumMax=3,NumMin=1},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=82004,GaiLv1=500,NumMax=2,NumMin=1},
			{GoodsID=0,GaiLv1=20,NumMax=1,NumMin=1},
			{GoodsID=80381,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=80383,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=118,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=207,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=202,GaiLv1=1000,NumMax=3,NumMin=1},
			{GoodsID=102,GaiLv1=1000,NumMax=3,NumMin=1},
		},
	[731214] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=30,NumMin=20},
			{GoodsID=89076,GaiLv1=6000,NumMax=3,NumMin=1},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=82004,GaiLv1=500,NumMax=2,NumMin=1},
			{GoodsID=0,GaiLv1=20,NumMax=1,NumMin=1},
			{GoodsID=80381,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=80383,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=118,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=207,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=202,GaiLv1=1000,NumMax=3,NumMin=1},
			{GoodsID=102,GaiLv1=1000,NumMax=3,NumMin=1},
		},
	--36
	[731203] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=2,NumMin=1},
			{GoodsID=89076,GaiLv1=2500,NumMax=1,NumMin=1},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=103,GaiLv1=1000,NumMax=2,NumMin=1},
			{GoodsID=203,GaiLv1=1000,NumMax=2,NumMin=1},
		},
	[731207] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=2,NumMin=1},
			{GoodsID=89076,GaiLv1=2500,NumMax=1,NumMin=1},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=103,GaiLv1=1000,NumMax=2,NumMin=1},
			{GoodsID=203,GaiLv1=1000,NumMax=2,NumMin=1},
		},
	[731211] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=40,NumMin=30},
			{GoodsID=89076,GaiLv1=6000,NumMax=3,NumMin=1},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=82004,GaiLv1=500,NumMax=2,NumMin=1},
			{GoodsID=0,GaiLv1=20,NumMax=1,NumMin=1},
			{GoodsID=80381,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=80383,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=119,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=208,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=203,GaiLv1=1000,NumMax=3,NumMin=1},
			{GoodsID=103,GaiLv1=1000,NumMax=3,NumMin=1},
		},
	[731215] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=40,NumMin=30},
			{GoodsID=89076,GaiLv1=6000,NumMax=3,NumMin=1},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=82004,GaiLv1=500,NumMax=2,NumMin=1},
			{GoodsID=0,GaiLv1=20,NumMax=1,NumMin=1},
			{GoodsID=80381,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=80383,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=119,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=208,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=203,GaiLv1=1000,NumMax=3,NumMin=1},
			{GoodsID=103,GaiLv1=1000,NumMax=3,NumMin=1},
		},
	--51
	[731204] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=2,NumMin=1},
			{GoodsID=89076,GaiLv1=2500,NumMax=1,NumMin=1},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=104,GaiLv1=1000,NumMax=2,NumMin=1},
			{GoodsID=204,GaiLv1=1000,NumMax=2,NumMin=1},
		},
	[731208] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=2,NumMin=1},
			{GoodsID=89076,GaiLv1=2500,NumMax=1,NumMin=1},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=5000,NumMax=10,NumMin=10},
			{GoodsID=104,GaiLv1=1000,NumMax=2,NumMin=1},
			{GoodsID=204,GaiLv1=1000,NumMax=2,NumMin=1},
		},
	[731212] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=50,NumMin=40},
			{GoodsID=89076,GaiLv1=6000,NumMax=3,NumMin=1},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=82004,GaiLv1=500,NumMax=2,NumMin=1},
			{GoodsID=0,GaiLv1=20,NumMax=1,NumMin=1},
			{GoodsID=80381,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=80383,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=120,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=209,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=204,GaiLv1=1000,NumMax=3,NumMin=1},
			{GoodsID=104,GaiLv1=1000,NumMax=3,NumMin=1},
		},
	[731216] = {
			{GoodsID=80498,GaiLv1=3000,NumMax=50,NumMin=40},
			{GoodsID=89076,GaiLv1=6000,NumMax=3,NumMin=1},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=80289,GaiLv1=10000,NumMax=10,NumMin=10},
			{GoodsID=82004,GaiLv1=500,NumMax=2,NumMin=1},
			{GoodsID=0,GaiLv1=20,NumMax=1,NumMin=1},
			{GoodsID=80381,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=80383,GaiLv1=160,NumMax=3,NumMin=1},
			{GoodsID=120,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=209,GaiLv1=200,NumMax=1,NumMin=1},
			{GoodsID=204,GaiLv1=1000,NumMax=3,NumMin=1},
			{GoodsID=104,GaiLv1=1000,NumMax=3,NumMin=1},
		},
}

WYL_2011NationalDay_MonDropType = {
	[731201] = 	13,
	[731202] = 	1,
	[731203] = 	1,
	[731204] = 	5,

	[731205] = 	13,
	[731206] = 	1,
	[731207] = 	1,
	[731208] = 	5,

	[731209] = 	13,
	[731210] = 	1,
	[731211] = 	1,
	[731212] = 	5,

	[731213] = 	13,
	[731214] = 	1,
	[731215] = 	1,
	[731216] = 	5,
}

if not API_IsEctypeServer() or API_IsBranchServer() then
	if not API_IsBattleGameServer() then
		WYL_2011NationalDay_TimeTriggerID = WYL_2011NationalDay_TimeTriggerID or API_CreateTimerTriggerG(0,0,60,-1,'WYL_2011NationalDay_TimeTriggerGCallFunc')
	end
end

function WYL_2011NationalDay_TimeTriggerGCallFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Time = os.time()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local StartTimeTable = GLOBAL_GuoQingOnline_StartTime
	local EndTimeTable = GLOBAL_GuoQingOnline_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if Hour >= 12 and Hour < 23 then
			--系统宣传
			if math.mod(Minute,10) == 0 and API_GetServerID() == 1 then
				API_ActorBDCMsg(-1, 0, 0, 11, 85, 0, 17, '“为了荣誉而战”活动正在阳光雨林、落日农庄、月暮草场、光明遗迹举行，击杀帝国叛徒可获得丰富奖励！')
				API_ActorBDCMsg(-1, 0, 1, 11, 85, 0, 17, '“为了荣誉而战”活动正在珊瑚群岛、娜沙湿地、月暮草场、光明遗迹举行，击杀联邦叛徒可获得丰富奖励！')
			end
			for j in WYL_2011NationalDay_MonTab do
				local MapID = j
				local RightMapID = API_GetRightMapID(MapID)
				if API_MapIsValid(RightMapID) then
					if WYL_2011NationalDay_FastMonTab[RightMapID] == nil then
						WYL_2011NationalDay_FastMonTab[RightMapID] = {}
						WYL_2011NationalDay_FastMonTab[RightMapID][1] = 0
						WYL_2011NationalDay_FastMonTab[RightMapID][2] = 0
					end
					local Table = WYL_2011NationalDay_MonTab[j]
					local SMonID = Table.SMonID
					local SMonNum = Table.SMonNum
					local BMonID = Table.BMonID
					local BMonNum = Table.BMonNum
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
					local FastMonNum1 = WYL_2011NationalDay_FastMonTab[RightMapID][1]
					local FastMonNum2 = WYL_2011NationalDay_FastMonTab[RightMapID][2]
					--刷小怪
					if math.mod(Minute,2) == 0 then
						if type(SMonID) == 'table' then							local TabNum = table.getn(SMonID)
							local MonNum = math.floor(SMonNum - FastMonNum1/TabNum)
							for p = 1, TabNum do
								MonID = SMonID[p]
								for i = 1,MonNum do
									local x,y,Num = 0,0,0
									repeat
										Num = Num + 1
										x = math.random(x1,x2)
										y = math.random(y1,y2)
									until not API_IsBlockTile(RightMapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) and not ((x > x5 and x < x6) and (y > y5 and y < y6)) or Num == 300
									if not API_IsBlockTile(RightMapID,x,y,0) then
										local FastID = API_CreateMonster(RightMapID, MonID, x, y, 4, 0, -1)
										API_CreateDieTriggerG(RightMapID,0,0,FastID,'WYL_2011NationalDay_MonDieFunc')
										WYL_2011NationalDay_FastMonTab[RightMapID][1] = WYL_2011NationalDay_FastMonTab[RightMapID][1] + 1
									end
								end
							end
						else
							local MonNum = SMonNum - FastMonNum1
							for i = 1,MonNum do
								local x,y,Num = 0,0,0
								repeat
									Num = Num + 1
									x = math.random(x1,x2)
									y = math.random(y1,y2)
								until not API_IsBlockTile(RightMapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) and not ((x > x5 and x < x6) and (y > y5 and y < y6)) or Num == 300
								if not API_IsBlockTile(RightMapID,x,y,0) then
									local FastID = API_CreateMonster(RightMapID, SMonID, x, y, 4, 0, -1)
									API_CreateDieTriggerG(RightMapID,0,0,FastID,'WYL_2011NationalDay_MonDieFunc')
									WYL_2011NationalDay_FastMonTab[RightMapID][1] = WYL_2011NationalDay_FastMonTab[RightMapID][1] + 1
								end
							end
						end
					end
					--刷BOSS
					if math.mod(Minute,10) == 0then
						if type(BMonID) == 'table' then
							local TabNum = table.getn(BMonID)
							local MonNum = math.floor(BMonNum - FastMonNum2/TabNum)
							for p = 1, TabNum do
								MonID = BMonID[p]
								for i = 1,MonNum do
									local x,y,Num = 0,0,0
									repeat
										Num = Num + 1
										x = math.random(x1,x2)
										y = math.random(y1,y2)
									until not API_IsBlockTile(RightMapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) and not ((x > x5 and x < x6) and (y > y5 and y < y6)) or Num == 300
									if not API_IsBlockTile(RightMapID,x,y,0) then
										local FastID = API_CreateMonster(RightMapID, MonID, x, y, 4, 0, -1)
										API_CreateDieTriggerG(RightMapID,0,0,FastID,'WYL_2011NationalDay_BossDieFunc')
										WYL_2011NationalDay_FastMonTab[RightMapID][2] = WYL_2011NationalDay_FastMonTab[RightMapID][2] + 1
									end
								end
							end
						else
							local MonNum = BMonNum - FastMonNum2
							for i = 1,MonNum do
								local x,y,Num = 0,0,0
								repeat
									Num = Num + 1
									x = math.random(x1,x2)
									y = math.random(y1,y2)
								until not API_IsBlockTile(RightMapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) and not ((x > x5 and x < x6) and (y > y5 and y < y6)) or Num == 300
								if not API_IsBlockTile(RightMapID,x,y,0) then
									local FastID = API_CreateMonster(RightMapID, BMonID, x, y, 4, 0, -1)
									API_CreateDieTriggerG(RightMapID,0,0,FastID,'WYL_2011NationalDay_BossDieFunc')
									WYL_2011NationalDay_FastMonTab[RightMapID][2] = WYL_2011NationalDay_FastMonTab[RightMapID][2] + 1
								end
							end
						end
					end
				end
			end
		end
	else
		API_DestroyTriggerG(TriggerID)
	end
end

--小怪死亡回调
function WYL_2011NationalDay_MonDieFunc(RightMapID,b,Type,FastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if WYL_2011NationalDay_FastMonTab[RightMapID] ~= nil then
		local FastMonNum1 = WYL_2011NationalDay_FastMonTab[RightMapID][1]
		FastMonNum1 = FastMonNum1 - 1
		if FastMonNum1 < 0 then
			FastMonNum1 = 0
		end
		WYL_2011NationalDay_FastMonTab[RightMapID][1] = FastMonNum1
		--怪物掉落
		if WYL_2011NationalDay_MonDropTab[MonsterID] ~= nil then
			local MonName = API_GetMonsterNameByID(MonsterID)
			local Tab = WYL_2011NationalDay_MonDropTab[MonsterID]
			for j in Tab do
				local RD = math.random(10000)
				local GaiLv1 = Tab[j].GaiLv1
				if RD <= GaiLv1 then
					local GoodsID = Tab[j].GoodsID
					local NumMax = Tab[j].NumMax
					local NumMin = Tab[j].NumMin
					local GoodsNum = math.random(NumMin,NumMax)
					if GoodsID == 0 then
						if WYL_2011NationalDay_MonDropType[MonsterID] ~= nil then
							local LeiXing = WYL_2011NationalDay_MonDropType[MonsterID] 
							GoodsID = YXD_WorldDropGoodsTab[LeiXing][math.random(table.getn(YXD_WorldDropGoodsTab[LeiXing]))] 
							if API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',GuiShuXing,GuiShuID,600,120,7) == true then
							end
						end
					else
						local GuiShuXing2 = GuiShuXing 
						if GuiShuXing == 4 then
							GuiShuXing2 = 0
						elseif GuiShuXing == 0 then
							GuiShuXing2 = 4
						end
						if API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',GuiShuXing2,GuiShuID,600,120) == true then
						end
					end
				end
			end
		end
	end
end

--BOSS死亡回调
function WYL_2011NationalDay_BossDieFunc(RightMapID,b,Type,FastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if WYL_2011NationalDay_FastMonTab[RightMapID] ~= nil then
		local FastMonNum2 = WYL_2011NationalDay_FastMonTab[RightMapID][2]
		FastMonNum2 = FastMonNum2 - 1
		if FastMonNum2 < 0 then
			FastMonNum2 = 0
		end
		WYL_2011NationalDay_FastMonTab[RightMapID][2] = FastMonNum2
		--怪物掉落
		if WYL_2011NationalDay_MonDropTab[MonsterID] ~= nil then
			local MonName = API_GetMonsterNameByID(MonsterID)
			local Tab = WYL_2011NationalDay_MonDropTab[MonsterID]
			for j in Tab do
				local RD = math.random(10000)
				local GaiLv1 = Tab[j].GaiLv1
				if RD <= GaiLv1 then
					local GoodsID = Tab[j].GoodsID
					local NumMax = Tab[j].NumMax
					local NumMin = Tab[j].NumMin
					local GoodsNum = math.random(NumMin,NumMax)
					if GoodsID == 0 then
						if WYL_2011NationalDay_MonDropType[MonsterID] ~= nil then
							local LeiXing = WYL_2011NationalDay_MonDropType[MonsterID] 
							GoodsID = YXD_WorldDropGoodsTab[LeiXing][math.random(table.getn(YXD_WorldDropGoodsTab[LeiXing]))] 
							if API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',GuiShuXing,GuiShuID,600,120,7) == true then
							end
						end
					else
						local GuiShuXing2 = GuiShuXing 
						if GuiShuXing == 4 then
							GuiShuXing2 = 0
						elseif GuiShuXing == 0 then
							GuiShuXing2 = 4
						end
						if API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',GuiShuXing2,GuiShuID,600,120) == true then
						end
					end
				end
			end
		end
	end
end

WYL_RongYaoZhiXing_DuiHuanGoodsTab = {
	[1] = {
		{GoodsID=101,Point=1000,Jiao=1000},
			},
}

--LC_GuoQingOnline_juanzhoudianji
function WYL_RongYaoZhiXing_DuiHuanFunc()
	local ActorID = API_RequestGetActorID()
	local ActorName = API_GetActorName(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if WYL_RongYaoZhiXing_DuiHuanGoodsTab[SelectItem] == nil then
		return
	end
	if type(WYL_RongYaoZhiXing_DuiHuanGoodsTab[SelectItem]) ~= 'table' then
		return
	end
	local GoodsNum = table.getn(WYL_RongYaoZhiXing_DuiHuanGoodsTab[SelectItem])
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if WYL_RongYaoZhiXing_DuiHuanGoodsTab[SelectItem][BuyNo] ~= nil then
			local BuyGoodsID = WYL_RongYaoZhiXing_DuiHuanGoodsTab[SelectItem][BuyNo].GoodsID
			local BuyPoint = WYL_RongYaoZhiXing_DuiHuanGoodsTab[SelectItem][BuyNo].Point
			local BuyJiao = WYL_RongYaoZhiXing_DuiHuanGoodsTab[SelectItem][BuyNo].Jiao
			local BuyNum = API_RequestGetNumber(num)
			if BuyNum < 1 then
				BuyNum = 1
			end
			BuyPoint = BuyPoint * BuyNum
			BuyJiao = BuyJiao * BuyNum
			if BuyPoint < 0 or BuyPoint > 100000000 then
				return
			end
			if BuyJiao < 0 or BuyJiao > 100000000 then
				return
			end
			if BuyPoint > 0 and BuyJiao > 0 then
				if API_ActorGetGoodsNum(ActorID,82033) >= BuyJiao then
					if API_ActorGetGoodsNum(ActorID,TML_YYSR_YYDJQID) >= BuyPoint then
						if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
							if API_ActorRemoveGoods(ActorID,TML_YYSR_YYDJQID,BuyPoint,"删除对应价格数量的云游代金券") then
								if API_ActorRemoveGoods(ActorID,82033,BuyJiao,"删除对应价格数量的年兔茸毛") then
									API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'新年礼物兑换官兑换')
									API_ResponseWrite('<name>新年礼物兑换官</name>')
									API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
									API_ResponseWrite('<text>您消耗</text><text color="255,0,255">'..BuyPoint..'张</text><text>云游代金券，</text><text color="255,0,255">'..BuyJiao..'个</text><text>“年兔茸毛”兑换了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
									API_ResponseWrite('<br><br><a>确定</a>')
									API_ResponseWrite('<text>     </text>')
									API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHuan?1=1">返回</a>')
									if BuyGoodsID == 32101 and not API_IsBattleGameServer() then
										API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,''..ActorName..'在新年礼物兑换官处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
										API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,''..ActorName..'在新年礼物兑换官处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
									end
									--风向标
									if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID] ~= nil then
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = BuyNum
										else
											GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] + BuyNum
										end
									end
								end
							end
						else
							API_ResponseWrite('<name>新年礼物兑换官</name>')
							API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name>新年礼物兑换官</name>')
						API_ResponseWrite('<text>您的云游代金券数量不够，无法兑换</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				else
					API_ResponseWrite('<name>新年礼物兑换官</name>')
					API_ResponseWrite('<text>您的“年兔茸毛”数量不够，无法兑换</text>')
					API_ResponseWrite('<br><br><a>确定</a>')
				end
			elseif BuyPoint > 0 and BuyJiao == 0 then
				if API_ActorGetGoodsNum(ActorID,TML_YYSR_YYDJQID) >= BuyPoint then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
						if API_ActorRemoveGoods(ActorID,TML_YYSR_YYDJQID,BuyPoint,"删除对应价格数量的云游代金券") then
							API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'新年礼物兑换官兑换')
							API_ResponseWrite('<name>新年礼物兑换官</name>')
							API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
							API_ResponseWrite('<text>您消耗</text><text color="255,0,255">'..BuyPoint..'张</text><text>云游代金券，兑换了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
							API_ResponseWrite('<text>     </text>')
							API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHuan?1=1">返回</a>')
							if BuyGoodsID == 32101 and not API_IsBattleGameServer() then
								API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,''..ActorName..'在新年礼物兑换官处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
								API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,''..ActorName..'在新年礼物兑换官处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
							end
							--风向标
							if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID] ~= nil then
								local LaiYuan = API_ActorGetPropNum(ActorID,201)
								if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = BuyNum
								else
									GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] + BuyNum
								end
							end
						end
					else
						API_ResponseWrite('<name>新年礼物兑换官</name>')
						API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				else
					API_ResponseWrite('<name>新年礼物兑换官</name>')
					API_ResponseWrite('<text>您的云游代金券数量不够，无法兑换</text>')
					API_ResponseWrite('<br><br><a>确定</a>')
				end
			elseif BuyPoint == 0 and BuyJiao > 0 then
				if API_ActorGetGoodsNum(ActorID,82033) >= BuyJiao then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
						if API_ActorRemoveGoods(ActorID,82033,BuyJiao,"删除对应价格数量的年兔茸毛") then
							API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'新年礼物兑换官兑换')
							API_ResponseWrite('<name>新年礼物兑换官</name>')
							API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
							API_ResponseWrite('<text>您消耗</text><text color="255,0,255">'..BuyJiao..'个</text><text>“年兔茸毛”兑换了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
							API_ResponseWrite('<text>     </text>')
							API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHuan?1=1">返回</a>')
							if BuyGoodsID == 32101 and not API_IsBattleGameServer() then
								API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,''..ActorName..'在新年礼物兑换官处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
								API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,''..ActorName..'在新年礼物兑换官处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
							end
							--风向标
							if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID] ~= nil then
								local LaiYuan = API_ActorGetPropNum(ActorID,201)
								if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = BuyNum
								else
									GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] + BuyNum
								end
							end
						end
					else
						API_ResponseWrite('<name>新年礼物兑换官</name>')
						API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				else
					API_ResponseWrite('<name>新年礼物兑换官</name>')
					API_ResponseWrite('<text>您的“年兔茸毛”数量不够，无法兑换</text>')
					API_ResponseWrite('<br><br><a>确定</a>')
				end
			end
		end
		return
	end
	if SelectItem == 1 then
		API_ResponseWrite('<name>兑换道具</name>')
		API_ResponseWrite('<win rect="30,75,470,510"></win>')
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br>')
--~ 		API_ResponseWrite('<text color="255,0,255">活动时间：1月27日～2月17日</text><br><br>')
		for i = 1,GoodsNum do
			if i > Page * 6 and i < (Page + 1) * 6 + 1 then
				local BuyGoodsID = WYL_RongYaoZhiXing_DuiHuanGoodsTab[SelectItem][i].GoodsID
				local BuyPoint = WYL_RongYaoZhiXing_DuiHuanGoodsTab[SelectItem][i].Point
				local BuyJiao = WYL_RongYaoZhiXing_DuiHuanGoodsTab[SelectItem][i].Jiao
				API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
				API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
				local BuyNumTip = ''
				local BuyPointTip = '<text>  单价：'..string.format("%-6s",BuyPoint..'张')..'</text>'
				BuyPointTip = BuyPointTip..'<text color="254,249,220">云游代金券 + </text>'
				BuyPointTip = BuyPointTip..'<text>'..string.format("%-5s",BuyJiao..'个')..'</text>'
				BuyPointTip = BuyPointTip..'<text color="254,249,220">年兔茸毛       </text>'
				local BuyNumTipLen = string.len(BuyPointTip)
				if BuyNumTipLen < 44 then
					for j = 1,44 - BuyNumTipLen do
						BuyPointTip = BuyPointTip..' '
					end
				end
				API_ResponseWrite(''..BuyPointTip..'')
				local num = i * 100
				API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
				API_ResponseWrite('<text> </text>')
				API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" href="XinNianLiWuDHG_DuiHuan?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
				API_ResponseWrite('<text>——————————————————————————————————</text><br>')
			end
		end
		if GoodsNum < (Page + 1) * 6 then
			for i = 1,(Page + 1) * 6 - GoodsNum do
				API_ResponseWrite('<br><br><br><br>')
			end
		end
		if GoodsNum > 6 then
			local BackPage = Page - 1
			local NextPage = Page + 1
			if Page == 0 then
				API_ResponseWrite('<br><img src="LuaUse\\button_back_g.bmp"><text>       </text>')
				API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHua">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="XinNianLiWuDHG_DuiHuan?1='..SelectItem..'&2='..NextPage..'">')
			elseif (Page + 1) * 6 < GoodsNum then
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="XinNianLiWuDHG_DuiHuan?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHua">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="XinNianLiWuDHG_DuiHuan?1='..SelectItem..'&2='..NextPage..'">')
			else
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="XinNianLiWuDHG_DuiHuan?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHua">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_g.bmp">')
			end
		else
			API_ResponseWrite('<br><a href="XinNianLiWuDHG_DuiHua">  返回</a>')
		end
	end
end
