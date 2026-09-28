----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\NewYearDefence.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	马鑫龙
--日  期:	2010-12-27
--版  本:	1.0
--描  述:	封印守护大作战
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：马鑫龙
--日期：2010-12-27
--功能：创建
---------------------------------------------------------------------

--活动信息，以地图固定ID为下标
if  NewYearDefence_ActInfoTable == nil then
	NewYearDefence_ActInfoTable = {
		[98] = {Camp=1,x1=317,y1=313,x2=467,y2=313,x3=461,y3=262,},
		[99] = {Camp=2,x1=272,y1=256,x2=337,y2=221,x3=331,y3=315,},
	}
end
	
--活动地图信息，以[MapID]为下标，保存计时、轮次、怪物计数
if  NewYearDefence_MapInfoTable == nil then
	NewYearDefence_MapInfoTable = {}
end

--活动怪物
if NewYearDefence_Monster == nil then
	NewYearDefence_Monster = {
		[731136]={Num=100,Type=1,},
		[731036]={Num=100,Type=2,},
		[730936]={Num=100,Type=3,},
	}
end
	
--活动时间
NewYearDefence_ActTime = {	
	[1] = {StartYear=2011,StartMonth=1,StartDay=27,EndYear=2011,EndMonth=2,EndDay=17,StartHour=12,EndHour=13,},
	[2] = {StartYear=2011,StartMonth=1,StartDay=27,EndYear=2011,EndMonth=2,EndDay=17,StartHour=19,EndHour=20,},
}

--封印之柱
local SealPoleTable = {
	[98] = {PoleID = 12356,Level = nil,TileX = 404,TileY = 301,Direct = 1,AIInfoID = 0,Camp = 1,CanTalk = 0,DieTriggerG = 1,SdBrushID = nil,RealPosX = 126,RealPosY = 276},
	[99] = {PoleID = 12356,Level = nil,TileX = 316,TileY = 273,Direct = 1,AIInfoID = 0,Camp = 0,CanTalk = 0,DieTriggerG = 1,SdBrushID = nil,RealPosX = 68,RealPosY = 246},
}

--活动怪物FastID保存
if MonsterFastID == nil then
	MonsterFastID = {}
end

--保存柱子FastID
if PoleFastID == nil then
	PoleFastID = {}
end

--保存活动标记
if NewYearDefenceFlag == nil then
	NewYearDefenceFlag = {}
end

--移动路径
local NewYearDefence_PtList = {
	[98]={
		[1]={
			PosNum = 5,lujing = {341,308,0,361,300,0,377,301,0,388,300,0,401,301,0},
			},
		[2]={
			PosNum = 4,lujing = {462,308,0,444,302,0,414,300,0,406,302,0},
			},
		[3]={
			PosNum = 4,lujing = {448,271,0,433,278,0,416,291,0,404,297,0}
			},
	       },
	[99]={
		[1]={
			PosNum = 5,lujing = {285,258,0,297,259,0,304,264,0,313,267,0,315,269,0},
		     },
		[2]={
			PosNum = 4,lujing = {333,236,0,321,251,0,318,263,0,318,274,0},
			},
		[3]={
			PosNum = 4,lujing = {331,305,0,331,293,0,325,275,0,315,269,0}
			},
	       },
}

--小怪掉落
if NewYearDefence_Monster_GoodsTable == nil then
	NewYearDefence_Monster_GoodsTable = {
		{GoodsID=203,GoodsNum=1,GaiLv=5000,PinZhi=0},
		{GoodsID=103,GoodsNum=1,GaiLv=5000,PinZhi=0},
		{GoodsID=80498,GoodsNum=3,GaiLv=10000,PinZhi=0},
		{GoodsID=89038,GoodsNum=1,GaiLv=1000,PinZhi=0},
	}
end

--Boss掉落
if NewYearDefence_Boss_GoodsTable == nil then
	NewYearDefence_Boss_GoodsTable = {
		{GoodsID=118,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=118,GoodsNum=1,GaiLv=800000,PinZhi=0},
		{GoodsID=118,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=207,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=207,GoodsNum=1,GaiLv=800000,PinZhi=0},
		{GoodsID=207,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=89038,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=89038,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=89038,GoodsNum=1,GaiLv=600000,PinZhi=0},
		{GoodsID=89038,GoodsNum=1,GaiLv=300000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=600000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=300000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=300000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=300000,PinZhi=0},
		{GoodsID={4303,4203,4403,4503,5303,5203,5403,5503,6303,6203,6403,6503,4103,4003,5003,5103,6003,6103,2003,3003,3903,1503,1003,6603,6903,8103,6703,7003,8203,6803,8003,8303},GoodsNum=1,GaiLv=1000000,PinZhi=2},
		{GoodsID={4303,4203,4403,4503,5303,5203,5403,5503,6303,6203,6403,6503,4103,4003,5003,5103,6003,6103,2003,3003,3903,1503,1003,6603,6903,8103,6703,7003,8203,6803,8003,8303},GoodsNum=1,GaiLv=100000,PinZhi=7},
		{GoodsID=80197,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80197,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=300000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=300000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=100000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=100000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=100000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=100000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=200000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=100000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=100000,PinZhi=0},
		{GoodsID=80952,GoodsNum=1,GaiLv=200000,PinZhi=0},
		{GoodsID=80951,GoodsNum=1,GaiLv=300000,PinZhi=0},
	}
end

--柱子掉落
if NewYearDefence_Pole_GoodsTable == nil then
	NewYearDefence_Pole_GoodsTable = {
		{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=800000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=600000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=600000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=600000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=300000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=300000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=300000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=600000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=600000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=600000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=300000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=300000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=300000,PinZhi=0},
		{GoodsID=88952,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=88952,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=88952,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=88952,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=88952,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=88952,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=88952,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID={4303,4203,4403,4503,5303,5203,5403,5503,6303,6203,6403,6503,4103,4003,5003,5103,6003,6103,2003,3003,3903,1503,1003,6603,6903,8103,6703,7003,8203,6803,8003,8303},GoodsNum=1,GaiLv=1000000,PinZhi=2},
		{GoodsID={4303,4203,4403,4503,5303,5203,5403,5503,6303,6203,6403,6503,4103,4003,5003,5103,6003,6103,2003,3003,3903,1503,1003,6603,6903,8103,6703,7003,8203,6803,8003,8303},GoodsNum=1,GaiLv=1000000,PinZhi=2},
		{GoodsID={4303,4203,4403,4503,5303,5203,5403,5503,6303,6203,6403,6503,4103,4003,5003,5103,6003,6103,2003,3003,3903,1503,1003,6603,6903,8103,6703,7003,8203,6803,8003,8303},GoodsNum=1,GaiLv=500000,PinZhi=2},
		{GoodsID={4303,4203,4403,4503,5303,5203,5403,5503,6303,6203,6403,6503,4103,4003,5003,5103,6003,6103,2003,3003,3903,1503,1003,6603,6903,8103,6703,7003,8203,6803,8003,8303},GoodsNum=1,GaiLv=300000,PinZhi=2},
		{GoodsID={4303,4203,4403,4503,5303,5203,5403,5503,6303,6203,6403,6503,4103,4003,5003,5103,6003,6103,2003,3003,3903,1503,1003,6603,6903,8103,6703,7003,8203,6803,8003,8303},GoodsNum=1,GaiLv=200000,PinZhi=2},
		{GoodsID={4303,4203,4403,4503,5303,5203,5403,5503,6303,6203,6403,6503,4103,4003,5003,5103,6003,6103,2003,3003,3903,1503,1003,6603,6903,8103,6703,7003,8203,6803,8003,8303},GoodsNum=1,GaiLv=1000000,PinZhi=7},
		{GoodsID=38352,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=38353,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=38354,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=38355,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=38356,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=38357,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=38358,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=38359,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=38360,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID={40206,40222,40238,40254,40270},GoodsNum=1,GaiLv=800000,PinZhi=0},
		{GoodsID=80197,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80197,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80197,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80197,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80197,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=300000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=300000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=100000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=100000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=100000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=100000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=200000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=200000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=200000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=200000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=100000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=100000,PinZhi=0},
		{GoodsID=80952,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80951,GoodsNum=1,GaiLv=1000000,PinZhi=0},
	}
end

--柱子掉落物品上限表
if NewYearDefence_GoodsMaxNumTable == nil then
	NewYearDefence_GoodsMaxNumTable = {
		[11009] = {GoodsNum=1,GaiLv=200000,Num=0,MaxNum=5},
		[11010] = {GoodsNum=1,GaiLv=200000,Num=0,MaxNum=5},
		[11011] = {GoodsNum=1,GaiLv=200000,Num=0,MaxNum=5},
		[11012] = {GoodsNum=1,GaiLv=200000,Num=0,MaxNum=5},
		[31040] = {GoodsNum=1,GaiLv=50000,Num=0,MaxNum=3},
	}
end


--时间回调
if not API_IsEctypeServer() or API_IsBranchServer() then
	if not API_IsBattleGameServer() then
		NewYearDefence_TimerTriggerID = NewYearDefence_TimerTriggerID or API_CreateTimerTriggerG(0,0,60,-1,'NewYearDefence_GCallFunc')
	end
end

--活动触发器
function NewYearDefence_GCallFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()

	for i = 1,table.getn(NewYearDefence_ActTime) do
		local ActStartYear = NewYearDefence_ActTime[i].StartYear
		local ActStartMonth = NewYearDefence_ActTime[i].StartMonth
		local ActStartDay = NewYearDefence_ActTime[i].StartDay
		local ActStartHour = NewYearDefence_ActTime[i].StartHour
		local ActEndYear = NewYearDefence_ActTime[i].EndYear
		local ActEndMonth = NewYearDefence_ActTime[i].EndMonth
		local ActEndDay = NewYearDefence_ActTime[i].EndDay		
		local ActEndHour = NewYearDefence_ActTime[i].EndHour
		if Year == ActStartYear and (( Month == ActStartMonth and Day >= ActStartDay and Day <= 31 ) or ( Month == ActEndMonth and Day >= 1 and Day <= ActEndDay )) and Hour >= ActStartHour-1 and Hour <= ActEndHour then
			
			--如果标记位为nil，表示没有初始化
			for j in NewYearDefence_ActInfoTable do
				local Map = API_GetRightMapID(j)
				if API_MapIsValid(Map) and NewYearDefenceFlag[Map] == nil then
					NewYearDefenceFlag[Map] = 0
				end
			end
			
			--活动开始前清空
			if Hour == (ActStartHour - 1) and Minute >= 30 and Minute <= 54 then
				--API_Trace('活动开始清空')
				for j in NewYearDefence_ActInfoTable do
					local MapID = API_GetRightMapID(j)
					--API_Trace('PoleFastID:'..PoleFastID[MapID]..'**MonsterFastID:'..MonsterFastID[MapID][1]..'NewYearDefence_MapInfoTable'..NewYearDefence_MapInfoTable[MapID].monCounter)
					if API_MapIsValid(MapID) and PoleFastID ~= nil and MonsterFastID[MapID] ~= nil and NewYearDefence_MapInfoTable[MapID] ~= nil then
						NewYearDefenceFlag[MapID] = 0 --活动触发Flag设为0
						NewYearDefence_MapInfoTable[MapID] = nil
						for i in PoleFastID do
							local FastID = PoleFastID[i]
							if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
								API_DestroyMonster(FastID)
								PoleFastID[i] = nil
							end
						end
						for i = 1,table.getn(MonsterFastID[MapID]) do
							local FastID = MonsterFastID[MapID][i]
							if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
								API_DestroyMonster(FastID)
								MonsterFastID[MapID][i] = nil
							end
						end
					end
				end
			end
			
			
			--活动预备
			if Hour == (ActStartHour - 1) and Minute >= 30 then
				--初始化地图缓存中的时间、怪物计数和轮次信息
				for j in NewYearDefence_ActInfoTable do
					local Map = API_GetRightMapID(j)
					if API_MapIsValid(Map) and (NewYearDefence_MapInfoTable[Map] == nil or MonsterFastID[Map] == nil) then
						--API_Trace('初始化地图信息***************************'..Map) -- **************************
						NewYearDefenceFlag[Map] = 0 --活动触发Flag设为0
						NewYearDefence_MapInfoTable[Map] = {}
						NewYearDefence_MapInfoTable[Map].timeCounter = 0 --用来保存上次刷怪的时间
						NewYearDefence_MapInfoTable[Map].timeCounterSp = 0 --用来保存刷怪时间差
						NewYearDefence_MapInfoTable[Map].monCounter = 0 --剩余怪物计数
						NewYearDefence_MapInfoTable[Map].actRound = 0 --刷怪轮次
						NewYearDefence_MapInfoTable[Map].realEndHour = ActEndHour
						NewYearDefence_MapInfoTable[Map].realEndMinute = 0
						NewYearDefence_MapInfoTable[Map].NumID = 0 --保存怪物起始编号
						MonsterFastID[Map] = {}
					end
				end
				--活动开始每间隔15分钟给出提示
				if math.mod(Minute,15) == 0 then
					--API_Trace('现在时间'..Hour..':'..Minute..'开始刷活动开始提示')--***********
					API_ActorBroadcastMsgLevelEx(-1, -1, 21, 0, 17, '封印之柱即将于'..ActStartHour..'：00--'..ActEndHour..'：00在娜纱湿地（联邦）'..SealPoleTable[98].RealPosX..','..SealPoleTable[98].RealPosY..'、落日农庄（帝国）'..SealPoleTable[99].RealPosX..','..SealPoleTable[99].RealPosY..'出现，请各位英雄前往守护。')
					API_ActorBroadcastMsgLevelEx(-1, -1, 21, 0, 8, '封印之柱即将于'..ActStartHour..'：00--'..ActEndHour..'：00在娜纱湿地（联邦）'..SealPoleTable[98].RealPosX..','..SealPoleTable[98].RealPosY..'、落日农庄（帝国）'..SealPoleTable[99].RealPosX..','..SealPoleTable[99].RealPosY..'出现，请各位英雄前往守护。')
				end
			end
			
			--活动开始前5分钟刷柱子
			if  Hour == (ActStartHour - 1) and Minute == 55 then
				API_ActorBroadcastMsgLevelEx(-1, -1, 21, 0, 17, '封印之柱出现在娜纱湿地（联邦）'..SealPoleTable[98].RealPosX..','..SealPoleTable[98].RealPosY..'、落日农庄（帝国）'..SealPoleTable[99].RealPosX..','..SealPoleTable[99].RealPosY..'！封印守护大作战将在5分钟后开启！')
				API_ActorBroadcastMsgLevelEx(-1, -1, 21, 0, 8, '封印之柱出现在娜纱湿地（联邦）'..SealPoleTable[98].RealPosX..','..SealPoleTable[98].RealPosY..'、落日农庄（帝国）'..SealPoleTable[99].RealPosX..','..SealPoleTable[99].RealPosY..'！封印守护大作战将在5分钟后开启！')	
				--摆放柱子
				for l in SealPoleTable do
					local MapID = API_GetRightMapID(l)
					if API_MapIsValid(MapID) then
						if ((PoleFastID[MapID] == nil) or (PoleFastID[MapID] ~= nil and API_GetMonsterID(PoleFastID[MapID]) <= 0)) then
							if SealPoleTable[l].Camp == 1 then
								--API_Trace('地图ID:'..MapID..'地图ID:'..l..l..'摆联邦柱子')--***********
								PoleFastID[MapID] = API_CreateMonsterEx(MapID,SealPoleTable[l].PoleID,SealPoleTable[l].TileX,SealPoleTable[l].TileY,SealPoleTable[l].Direct,SealPoleTable[l].AIInfoID,2,SealPoleTable[l].CanTalk)
								API_SetMonsterName(PoleFastID[MapID], '封印之柱', 1)
								--if API_GetMonsterID(PoleFastID[MapID]) > 0 then
									--local CampID = API_MonsterGetPropNum(PoleFastID[MapID],PD_PROP_CAMPID)
									--local DieTriggerGID = API_CreateDieTriggerG(MapID,CampID,0,PoleFastID[MapID],'NewYearDenfence_SealPole_DieTriggerGCallFunc')--全局死亡触发器
									--API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.Castte_DieTriggerG,DieTriggerGID)
								--end
							elseif SealPoleTable[l].Camp == 0 then
								--API_Trace('地图ID:'..MapID..'柱子地图ID'..l..'摆帝国柱子')--***********
								PoleFastID[MapID] = API_CreateMonsterEx(MapID,SealPoleTable[l].PoleID,SealPoleTable[l].TileX,SealPoleTable[l].TileY,SealPoleTable[l].Direct,SealPoleTable[l].AIInfoID,2,SealPoleTable[l].CanTalk)
								API_SetMonsterName(PoleFastID[MapID], '封印之柱', 1)
								--if API_GetMonsterID(PoleFastID[MapID]) > 0 then
									--local CampID = API_MonsterGetPropNum(PoleFastID[MapID],PD_PROP_CAMPID)
									--local DieTriggerGID = API_CreateDieTriggerG(MapID,CampID,0,PoleFastID[MapID],'NewYearDenfence_SealPole_DieTriggerGCallFunc')--全局死亡触发器
									--API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.Castte_DieTriggerG,DieTriggerGID)
							end
						end
					end
				end
			end
			
			--活动开始
			if Hour == ActStartHour and Minute == 0 then
				if NewYearDefence_MapInfoTable[Map] ~= nil then
					--初始化地图缓存中的时间、怪物计数和轮次信息
					for j in NewYearDefence_ActInfoTable do
						local Map = API_GetRightMapID(j)
						if API_MapIsValid(Map) and (NewYearDefence_MapInfoTable[Map] == nil or MonsterFastID[Map] == nil) then
							--API_Trace('初始化地图信息***************************'..Map) -- **************************
							NewYearDefenceFlag[Map] = 0 --活动触发Flag设为0
							NewYearDefence_MapInfoTable[Map] = {}
							NewYearDefence_MapInfoTable[Map].timeCounter = 0 --用来保存上次刷怪的时间
							NewYearDefence_MapInfoTable[Map].timeCounterSp = 0 --用来保存刷怪时间差
							NewYearDefence_MapInfoTable[Map].monCounter = 0 --剩余怪物计数
							NewYearDefence_MapInfoTable[Map].actRound = 0 --刷怪轮次
							NewYearDefence_MapInfoTable[Map].realEndHour = ActEndHour
							NewYearDefence_MapInfoTable[Map].realEndMinute = 0
							NewYearDefence_MapInfoTable[Map].NumID = 0 --保存怪物起始编号
							MonsterFastID[Map] = {}
						end
					end
				end
				--API_Trace('活动提示+更新柱子*************************') --******************
				API_ActorBroadcastMsgLevelEx(-1, -1, 21, 0, 17, '封印守护大作战现在开始！坚持过20轮入侵，福神就会在封印之柱四周洒落奖励！')
				API_ActorBroadcastMsgLevelEx(-1, -1, 21, 0, 8, '封印守护大作战现在开始！坚持过20轮入侵，福神就会在封印之柱四周洒落奖励！')
				
				for m in SealPoleTable do
					local MapID = API_GetRightMapID(m)
					if NewYearDefenceFlag[MapID] == 0 then
						NewYearDefenceFlag[MapID] = 1	--活动开始flag设置为1
						if API_MapIsValid(MapID) then
							if PoleFastID[MapID] ~= nil and API_GetMonsterID(PoleFastID[MapID]) > 0 then
								API_DestroyMonster(PoleFastID[MapID])
							end
							if SealPoleTable[m].Camp == 1 then
								--API_Trace('柱子地图ID'..m..'摆联邦柱子')--***********
								PoleFastID[MapID] = API_CreateMonsterEx(MapID,SealPoleTable[m].PoleID,SealPoleTable[m].TileX,SealPoleTable[m].TileY,SealPoleTable[m].Direct,SealPoleTable[m].AIInfoID,SealPoleTable[m].Camp,SealPoleTable[m].CanTalk)
								API_SetMonsterName(PoleFastID[MapID], '封印之柱', 1)
								if API_GetMonsterID(PoleFastID[MapID]) > 0 then
									local CampID = API_MonsterGetPropNum(PoleFastID[MapID],PD_PROP_CAMPID)
									local DieTriggerGID = API_CreateDieTriggerG(MapID,CampID,0,PoleFastID[MapID],'NewYearDenfence_SealPole_DieTriggerGCallFunc')--全局死亡触发器
									API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.Castte_DieTriggerG,DieTriggerGID)
								end
							elseif SealPoleTable[m].Camp == 0 then
								--API_Trace('柱子地图ID'..m..'摆帝国柱子')--***********
								PoleFastID[MapID] = API_CreateMonsterEx(MapID,SealPoleTable[m].PoleID,SealPoleTable[m].TileX,SealPoleTable[m].TileY,SealPoleTable[m].Direct,SealPoleTable[m].AIInfoID,SealPoleTable[m].Camp,SealPoleTable[m].CanTalk)
								API_SetMonsterName(PoleFastID[MapID], '封印之柱', 1)
								if API_GetMonsterID(PoleFastID[MapID]) > 0 then
									local CampID = API_MonsterGetPropNum(PoleFastID[MapID],PD_PROP_CAMPID)
									local DieTriggerGID = API_CreateDieTriggerG(MapID,CampID,0,PoleFastID[MapID],'NewYearDenfence_SealPole_DieTriggerGCallFunc')--全局死亡触发器
									--API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.Castte_DieTriggerG,DieTriggerGID)
								end
							end
						end
					end
				end
			end
			
			--活动开始刷怪
			if Hour >= ActStartHour and Hour < ActEndHour then
				for m in SealPoleTable do
					local MapID = API_GetRightMapID(m)
					--API_Trace('地图*'..MapID..'*FLAG标记='..NewYearDefenceFlag[MapID]) --**************************************
					if API_MapIsValid(MapID) and NewYearDefenceFlag[MapID] == 1 then --flag == 1才可能刷怪	
						NewYearDefence_CreateMonster(MapID,m)
					end
				end
			end
			--活动结束函数
			if Hour == ActEndHour and Minute == 0 then
				--API_Trace('现在时间'..Hour..':'..Minute..'开始刷活动结束提示')--***********
				for m in SealPoleTable do
					local MapID = API_GetRightMapID(m)
					--API_Trace('地图*'..MapID..'*FLAG标记='..NewYearDefenceFlag[MapID]) --*****************************
					if NewYearDefenceFlag[MapID] == 1 and API_MapIsValid(MapID) then
						NewYearDefence_MapInfoTable[MapID].realEndHour = Hour
						NewYearDefence_MapInfoTable[MapID].realEndMinute = Minute
						--API_Trace('实际结束时间'..NewYearDefence_MapInfoTable[MapID].realEndHour..':'..NewYearDefence_MapInfoTable[MapID].realEndMinute)--***********
						NewYearDefenceFlag[MapID] = 2 --活动结束flag设置为2
						API_ActorBroadcastMsgLevelEx(MapID, -1, 21, 0, 17, '封印守护大作战成功！福神赐给封印之柱不被损伤的祝福，并在四周洒落奖励！10分钟后封印之柱消失。')
						API_ActorBroadcastMsgLevelEx(MapID, -1, 21, 0, 8, '封印守护大作战成功！福神赐给封印之柱不被损伤的祝福，并在四周洒落奖励！10分钟后封印之柱消失。')	
						--活动成功给柱子加无敌状态
						--API_Trace('柱子加无敌状态'..PoleFastID[MapID])
						API_MonsterAddStatus(PoleFastID[MapID], 742001, 999999)
						--活动成功投放奖励
						local ConfigMapID = API_GetMapConfigID(MapID)
						local x1 = SealPoleTable[ConfigMapID].TileX - 8
						local x2 = SealPoleTable[ConfigMapID].TileX + 8
						local y1 = SealPoleTable[ConfigMapID].TileY - 8
						local y2 = SealPoleTable[ConfigMapID].TileY + 8
						local GDNum = 0
						for j in NewYearDefence_Pole_GoodsTable do
							local RD = math.random(1000000)
							local GoodsID = NewYearDefence_Pole_GoodsTable[j].GoodsID
							if type(GoodsID) == 'table' then
								local Type = math.random(1,table.getn(GoodsID))
								GoodsID = GoodsID[Type]
							end
							local GoodsNum = NewYearDefence_Pole_GoodsTable[j].GoodsNum
							local GaiLv = NewYearDefence_Pole_GoodsTable[j].GaiLv
							local PinZhi = NewYearDefence_Pole_GoodsTable[j].PinZhi
								
							--{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
							if RD <= GaiLv then
								local x,y
								local Num = 0
								repeat
									Num = Num + 1
									x = math.random(x1,x2)
									y = math.random(y1,y2)
								until not API_IsBlockTile(MapID,x,y,0) or Num == 100
								if not API_IsBlockTile(MapID,x,y,0) then
									GDNum = GDNum + 1
									if PinZhi > 0 then
										if API_CreateDropGoodsEx(MapID,x,y,GoodsID,GoodsNum,0,'封印大作战成功奖励',4,0,600,0,PinZhi) == true then
										end
									else
										if API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'封印大作战成功奖励',4,0,600,0) == true then
										end
									end
								end
							end
						end
						--限量物品投放
						for j in NewYearDefence_GoodsMaxNumTable do
							local RD = math.random(1000000)
							local GoodsID = j
							local GoodsNum = NewYearDefence_GoodsMaxNumTable[j].GoodsNum
							local GaiLv = NewYearDefence_GoodsMaxNumTable[j].GaiLv
							local Num = NewYearDefence_GoodsMaxNumTable[j].Num
							local MaxNum = NewYearDefence_GoodsMaxNumTable[j].MaxNum
							if Num < MaxNum then
								if RD <= GaiLv then
									local x,y
									local Num2 = 0
									repeat
										Num2 = Num2 + 1
										x = math.random(x1,x2)
										y = math.random(y1,y2)
									until not API_IsBlockTile(MapID,x,y,0) or Num2 == 100
									if not API_IsBlockTile(MapID,x,y,0) then
										if GoodsID == 88952 then--爱慕之心
											if Month == 2 and Day >= 11 and Day <= 17 then
												if API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'封印大作战成功特殊奖励',4,0,600,0) == true then
												end
												Num = Num + GoodsNum
												NewYearDefence_GoodsMaxNumTable[j].Num = Num
											end
										else
											if API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'封印大作战成功特殊奖励',4,0,600,0) == true then
											end
											Num = Num + GoodsNum
											NewYearDefence_GoodsMaxNumTable[j].Num = Num
										end
										
									end
								end
							end
							--风向标统计数据
							if GoodsID == 88952 then--爱慕之心
								local LaiYuan = 1
								if GLOBAL_FengXiangBiao_DateList[66][88952][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[66][88952][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[66][88952][LaiYuan] = GLOBAL_FengXiangBiao_DateList[66][88952][LaiYuan] + 1
								end
							elseif GoodsID == 31040 then--兔子宠物
								local LaiYuan = 1
								if GLOBAL_FengXiangBiao_DateList[66][31040][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[66][31040][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[66][31040][LaiYuan] = GLOBAL_FengXiangBiao_DateList[66][31040][LaiYuan] + 1
								end
							elseif GoodsID == 11009 then--节日招财帽[白银男装]
								local LaiYuan = 1
								if GLOBAL_FengXiangBiao_DateList[66][11009][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[66][11009][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[66][11009][LaiYuan] = GLOBAL_FengXiangBiao_DateList[66][11009][LaiYuan] + 1
								end
							elseif GoodsID == 11010 then--节日招财装[白银男装]
								local LaiYuan = 1
								if GLOBAL_FengXiangBiao_DateList[66][11010][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[66][11010][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[66][11010][LaiYuan] = GLOBAL_FengXiangBiao_DateList[66][11010][LaiYuan] + 1
								end
							elseif GoodsID == 11011 then--节日鸿运帽[白银女装]
								local LaiYuan = 1
								if GLOBAL_FengXiangBiao_DateList[66][11011][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[66][11011][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[66][11011][LaiYuan] = GLOBAL_FengXiangBiao_DateList[66][11011][LaiYuan] + 1
								end
							elseif GoodsID == 11012 then--节日鸿运装[白银女装]
								local LaiYuan = 1
								if GLOBAL_FengXiangBiao_DateList[66][11012][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[66][11012][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[66][11012][LaiYuan] = GLOBAL_FengXiangBiao_DateList[66][11012][LaiYuan] + 1
								end
							end
						end
						NewYearDefence_EndFunc()
					end
				end
			end
			
			--活动结束10分钟后清空怪物
			for m in SealPoleTable do
				local MapID = API_GetRightMapID(m)
				if API_MapIsValid(MapID) and NewYearDefence_MapInfoTable[MapID] ~= nil then
					if( Hour == NewYearDefence_MapInfoTable[MapID].realEndHour and Minute >= NewYearDefence_MapInfoTable[MapID].realEndMinute + 10 ) or ( Hour > NewYearDefence_MapInfoTable[MapID].realEndHour and Minute >= NewYearDefence_MapInfoTable[MapID].realEndMinute + 10 -60) then
						--API_Trace('现在时间'..Hour..':'..Minute..'开始刷活动结束提示')--***********
						--API_Trace('地图*'..MapID..'*FLAG标记='..NewYearDefenceFlag[MapID]) --*****************************
						if NewYearDefenceFlag[MapID] == 2 and NewYearDefence_MapInfoTable[MapID] ~= nil then
							--NewYearDefenceFlag[MapID] = 2 --活动结束flag设置为2
							--API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17, '封印守护大作战成功！福神在封印之柱附近洒落奖励！')
							--API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8, '封印守护大作战成功！福神在封印之柱附近洒落奖励！')	
							NewYearDefence_EndFunc()
						end
					end
				end
			end
		end
	end
end

--活动结束函数
function NewYearDefence_EndFunc()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()	
	for i in NewYearDefence_ActInfoTable do
		local MapID = API_GetRightMapID(i)
		--API_Trace('地图ID:'..MapID..'现在时间'..Hour..':'..Minute..'*******实际结束时间'..NewYearDefence_MapInfoTable[MapID].realEndHour..':'..NewYearDefence_MapInfoTable[MapID].realEndMinute)--***********
		if API_MapIsValid(MapID) and ( NewYearDefenceFlag[MapID] == 0 or NewYearDefenceFlag[MapID]  == 2 ) then
			if ( Hour >= NewYearDefence_MapInfoTable[MapID].realEndHour and Minute >= NewYearDefence_MapInfoTable[MapID].realEndMinute + 10 - 60* ( Hour - NewYearDefence_MapInfoTable[MapID].realEndHour )) then
				--删除柱子
				--API_Trace('删柱子')--***********
				for i in PoleFastID do
					local FastID = PoleFastID[i]
					--API_Trace('地图'..i..'柱子FastID'..FastID)
					if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
						API_DestroyMonster(FastID)
						PoleFastID[i] = nil
					end
				end
				--删除怪物
				--API_Trace('地图ID:'..MapID..'删怪物，怪物数量：'..NewYearDefence_MapInfoTable[MapID].monCounter)--***********
				for i = 1,table.getn(MonsterFastID[MapID]) do
					local FastID = MonsterFastID[MapID][i]
					if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
						API_DestroyMonster(FastID)
						MonsterFastID[MapID][i] = nil
					end
				end
				NewYearDefence_MapInfoTable[MapID] = nil
			end
		end
	end
end	

--刷活动怪
function NewYearDefence_CreateMonster(MapID,MapConfigID)
	--local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	
	local NewYearDefence_ActInfoTable = {
		[98] = {Camp=1,x1=317,y1=313,x2=467,y2=313,x3=461,y3=262,},
		[99] = {Camp=2,x1=272,y1=256,x2=337,y2=221,x3=331,y3=315,},
	}
	if API_MapIsValid(MapID) and NewYearDefence_ActInfoTable[MapConfigID] ~= nil then
		local x1 = NewYearDefence_ActInfoTable[MapConfigID].x1
		local y1 = NewYearDefence_ActInfoTable[MapConfigID].y1
		local x2 = NewYearDefence_ActInfoTable[MapConfigID].x2
		local y2 = NewYearDefence_ActInfoTable[MapConfigID].y2
		local x3 = NewYearDefence_ActInfoTable[MapConfigID].x3
		local y3 = NewYearDefence_ActInfoTable[MapConfigID].y3

		
		--判断地图存在，则刷怪
		if NewYearDefence_MapInfoTable[MapID] ~= nil then
		
			--计算剩余怪物数量
			NewYearDefence_MapInfoTable[MapID].monCounter = 0
			for j = 1,table.getn(MonsterFastID[MapID]) do
				MonsterID = API_GetMonsterID(MonsterFastID[MapID][j])
				if MonsterID > 0 then
					NewYearDefence_MapInfoTable[MapID].monCounter = NewYearDefence_MapInfoTable[MapID].monCounter+1
				end
			end
			--API_Trace('剩余怪物数量:'..NewYearDefence_MapInfoTable[MapID].monCounter) --****************
			--计算时间差
			--API_Trace('计时器:'..NewYearDefence_MapInfoTable[MapID].timeCounter)--***********
			NewYearDefence_MapInfoTable[MapID].timeCounterSp = Minute - NewYearDefence_MapInfoTable[MapID].timeCounter
			--API_Trace('刷怪间隔:'..NewYearDefence_MapInfoTable[MapID].timeCounterSp)--***********
			
			--刷怪轮数小于20*******************************************************************************
			API_Trace(NewYearDefence_MapInfoTable[MapID].actRound)
			if NewYearDefence_MapInfoTable[MapID].actRound < 20 and NewYearDefenceFlag[MapID] ==1 then
			--刷怪轮数小于20*******************************************************************************
				--判断怪物是否被清空或者时间差大于3分钟
				if  NewYearDefence_MapInfoTable[MapID].monCounter == 0 or NewYearDefence_MapInfoTable[MapID].timeCounterSp >= 3 then				
					NewYearDefence_MapInfoTable[MapID].timeCounter = Minute
					NewYearDefence_MapInfoTable[MapID].actRound = NewYearDefence_MapInfoTable[MapID].actRound + 1
					local Round = NewYearDefence_MapInfoTable[MapID].actRound
					
					API_Trace('地图'..MapID..'刷怪提示轮次:'..Round..'!') --***************
					API_ActorBroadcastMsgLevelEx(MapID, -1, 21, 0, 17, '第'..Round..'轮怪物开始入侵，请守护好封印之柱！')
					API_ActorBroadcastMsgLevelEx(MapID, -1, 21, 0, 8, '第'..Round..'轮怪物开始入侵，请守护好封印之柱！')
					
					local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
					local PlayNum = 1
					if PlayList ~= nil then
						PlayNum = table.getn(PlayList)
					end
					--刷普通怪
					for k in NewYearDefence_Monster do
						local MonID = k + Round - 1
						local MonNum = NewYearDefence_Monster[k].Num
						--刷怪数量判定
						local PlayMin = 50
						local PlayMax = 200
						if PlayNum <= PlayMin then
							if NewYearDefence_Monster[k].Type <= 3 then
								MonNum = 60 --测试用**************************************
							end
						elseif PlayNum > PlayMin and PlayNum <= PlayMax then
							local PlayPlus = PlayNum - PlayMin
							if NewYearDefence_Monster[k].Type == 1 then
								MonNum = 3 + PlayPlus * 4
							elseif NewYearDefence_Monster[k].Type == 2 then
								MonNum = 3 + PlayPlus * 2
							elseif NewYearDefence_Monster[k].Type == 3 then
								MonNum = 3 + PlayPlus * 1
							end										
						elseif PlayNum >= PlayMax then
							if NewYearDefence_Monster[k].Type == 1 then
								MonNum = 660
							elseif NewYearDefence_Monster[k].Type == 2 then
								MonNum = 360
							elseif NewYearDefence_Monster[k].Type == 3 then
								MonNum = 210
							end
						end
						local SideNum = math.floor(MonNum/3)
						--*******************************************************************************
						
						--API_ActorBroadcastMsgLevelEx(MapID, -1, 21, 0, 17, '怪物类型：'..NewYearDefence_Monster[k].Type..'**数量：'..MonNum)
						--API_ActorBroadcastMsgLevelEx(MapID, -1, 21, 0, 8, '怪物类型：'..NewYearDefence_Monster[k].Type..'**数量：'..MonNum)
						--if API_GetMapConfigID(MapID) == 98 then
						--	API_Trace('98场景刷怪了,每条路刷怪数量：'..SideNum)
						--elseif API_GetMapConfigID(MapID) == 99 then
						--	API_Trace('99场景刷怪了,每条路刷怪数量：'..SideNum)
						--end
						--API_Trace('')
						--*******************************************************************************
						
						if NewYearDefence_Monster[k].Type == 1 or NewYearDefence_Monster[k].Type == 2 then
							for l = 1,SideNum do
								local FastID = API_CreateMonster(MapID,MonID,x1,y1,5,0,-1)
								API_MonsterPathPatrol(FastID,NewYearDefence_PtList[MapConfigID][1].PosNum,NewYearDefence_PtList[MapConfigID][1].lujing)
								API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Monster_DieTriggerGCallFunc')
								local NumID = NewYearDefence_MapInfoTable[MapID].NumID
								NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
								MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							end
						elseif NewYearDefence_Monster[k].Type == 3 then
							for l = 1,SideNum do
								local FastID = API_CreateMonster(MapID,MonID,x1,y1,5,0,-1)
								API_MonsterMoveTo(FastID,NewYearDefence_PtList[MapConfigID][1].PosNum,NewYearDefence_PtList[MapConfigID][1].lujing)
								API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Monster_DieTriggerGCallFunc')
								local NumID = NewYearDefence_MapInfoTable[MapID].NumID
								NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
								MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							end
						end
						
						if NewYearDefence_Monster[k].Type == 1 or NewYearDefence_Monster[k].Type == 2 then
							for m = 1,SideNum do
								local FastID = API_CreateMonster(MapID,MonID,x2,y2,5,0,-1)
								API_MonsterPathPatrol(FastID,NewYearDefence_PtList[MapConfigID][2].PosNum,NewYearDefence_PtList[MapConfigID][2].lujing)
								API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Monster_DieTriggerGCallFunc')
								local NumID = NewYearDefence_MapInfoTable[MapID].NumID
								NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
								MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							end
						elseif NewYearDefence_Monster[k].Type == 3 then
							for m = 1,SideNum do
								local FastID = API_CreateMonster(MapID,MonID,x1,y1,5,0,-1)
								API_MonsterMoveTo(FastID,NewYearDefence_PtList[MapConfigID][1].PosNum,NewYearDefence_PtList[MapConfigID][1].lujing)
								API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Monster_DieTriggerGCallFunc')
								local NumID = NewYearDefence_MapInfoTable[MapID].NumID
								NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
								MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							end
						end
						
						if NewYearDefence_Monster[k].Type == 1 or NewYearDefence_Monster[k].Type == 2 then
							for n = 1,(MonNum-2*SideNum) do
								local FastID = API_CreateMonster(MapID,MonID,x3,y3,5,0,-1)
								API_MonsterPathPatrol(FastID,NewYearDefence_PtList[MapConfigID][3].PosNum,NewYearDefence_PtList[MapConfigID][3].lujing)
								API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Monster_DieTriggerGCallFunc')
								local NumID = NewYearDefence_MapInfoTable[MapID].NumID
								NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
								MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							end
						elseif NewYearDefence_Monster[k].Type == 3 then
							for n = 1,(MonNum-2*SideNum) do
								local FastID = API_CreateMonster(MapID,MonID,x1,y1,5,0,-1)
								API_MonsterMoveTo(FastID,NewYearDefence_PtList[MapConfigID][1].PosNum,NewYearDefence_PtList[MapConfigID][1].lujing)
								API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Monster_DieTriggerGCallFunc')
								local NumID = NewYearDefence_MapInfoTable[MapID].NumID
								NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
								MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							end
						end
					end
					
					if Round == 5 or Round == 8 or Round == 10 or Round == 11 or Round == 12 or Round == 13 or Round == 14 or Round == 15 then
						local ran = math.random(0,1)
						if ran == 0 then
							local ranLocation1 = math.random(0,2)
							if ranLocation1 == 0 then
								local FastID = API_CreateMonster(MapID,730901,x1,y1,5,0,-1)
								--移动路径
								API_MonsterMoveTo(FastID,NewYearDefence_PtList[MapConfigID][1].PosNum,NewYearDefence_PtList[MapConfigID][1].lujing)
								API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Boss_DieTriggerGCallFunc')
								local NumID = NewYearDefence_MapInfoTable[MapID].NumID
								NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
								MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							elseif ranLocation1 == 1 then
								local FastID = API_CreateMonster(MapID,730901,x2,y2,5,0,-1)
								--移动路径
								API_MonsterMoveTo(FastID,NewYearDefence_PtList[MapConfigID][2].PosNum,NewYearDefence_PtList[MapConfigID][2].lujing)
								API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Boss_DieTriggerGCallFunc')
								local NumID = NewYearDefence_MapInfoTable[MapID].NumID
								NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
								MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							elseif ranLocation1 == 2 then
								local FastID = API_CreateMonster(MapID,730901,x3,y3,5,0,-1)
								--移动路径
								API_MonsterMoveTo(FastID,NewYearDefence_PtList[MapConfigID][3].PosNum,NewYearDefence_PtList[MapConfigID][3].lujing)
								API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Boss_DieTriggerGCallFunc')
								local NumID = NewYearDefence_MapInfoTable[MapID].NumID
								NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
								MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							end								
						elseif ran == 1	then
							local ranLocation2 = math.random(0,2)
							if ranLocation2 == 0 then
								local FastID = API_CreateMonster(MapID,730902,x1,y1,5,0,-1)
								--移动路径
								API_MonsterPathPatrol(FastID,NewYearDefence_PtList[MapConfigID][1].PosNum,NewYearDefence_PtList[MapConfigID][1].lujing)
								API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Boss_DieTriggerGCallFunc')
								local NumID = NewYearDefence_MapInfoTable[MapID].NumID
								NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
								MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							elseif ranLocation2 == 1 then
								local FastID = API_CreateMonster(MapID,730902,x2,y2,5,0,-1)
								--移动路径
								API_MonsterPathPatrol(FastID,NewYearDefence_PtList[MapConfigID][2].PosNum,NewYearDefence_PtList[MapConfigID][2].lujing)
								API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Boss_DieTriggerGCallFunc')
								local NumID = NewYearDefence_MapInfoTable[MapID].NumID
								NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
								MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							elseif ranLocation2 == 2 then
								local FastID = API_CreateMonster(MapID,730902,x3,y3,5,0,-1)
								--移动路径
								API_MonsterPathPatrol(FastID,NewYearDefence_PtList[MapConfigID][3].PosNum,NewYearDefence_PtList[MapConfigID][3].lujing)
								API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Boss_DieTriggerGCallFunc')
								local NumID = NewYearDefence_MapInfoTable[MapID].NumID
								NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
								MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							end
						end
					elseif Round >=16 then
						local ranLocation3 = math.random(0,2)
						if ranLocation3 == 0 then
							local FastID = API_CreateMonster(MapID,730902,x1,y1,5,0,-1)
							API_MonsterPathPatrol(FastID,NewYearDefence_PtList[MapConfigID][1].PosNum,NewYearDefence_PtList[MapConfigID][1].lujing)
							API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Boss_DieTriggerGCallFunc')
							local NumID = NewYearDefence_MapInfoTable[MapID].NumID
							NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
							MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							local FastID = API_CreateMonster(MapID,730901,x1,y1,5,0,-1)
							API_MonsterMoveTo(FastID,NewYearDefence_PtList[MapConfigID][1].PosNum,NewYearDefence_PtList[MapConfigID][1].lujing)
							API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Boss_DieTriggerGCallFunc')
							local NumID = NewYearDefence_MapInfoTable[MapID].NumID
							NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
							MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
						elseif ranLocation3 == 1 then
							local FastID = API_CreateMonster(MapID,730902,x2,y2,5,0,-1)
							API_MonsterPathPatrol(FastID,NewYearDefence_PtList[MapConfigID][2].PosNum,NewYearDefence_PtList[MapConfigID][2].lujing)
							API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Boss_DieTriggerGCallFunc')
							local NumID = NewYearDefence_MapInfoTable[MapID].NumID
							NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
							MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							local FastID = API_CreateMonster(MapID,730901,x2,y2,5,0,-1)
							API_MonsterMoveTo(FastID,NewYearDefence_PtList[MapConfigID][2].PosNum,NewYearDefence_PtList[MapConfigID][2].lujing)
							API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Boss_DieTriggerGCallFunc')
							local NumID = NewYearDefence_MapInfoTable[MapID].NumID
							NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
							MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
						elseif 	ranLocation3 == 2 then
							local FastID = API_CreateMonster(MapID,730902,x3,y3,5,0,-1)
							API_MonsterPathPatrol(FastID,NewYearDefence_PtList[MapConfigID][3].PosNum,NewYearDefence_PtList[MapConfigID][3].lujing)
							API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Boss_DieTriggerGCallFunc')
							local NumID = NewYearDefence_MapInfoTable[MapID].NumID
							NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
							MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
							local FastID = API_CreateMonster(MapID,730901,x3,y3,5,0,-1)
							API_MonsterMoveTo(FastID,NewYearDefence_PtList[MapConfigID][3].PosNum,NewYearDefence_PtList[MapConfigID][3].lujing)
							API_CreateDieTriggerG(MapID,0,0,FastID,'NewYearDenfence_Boss_DieTriggerGCallFunc')
							local NumID = NewYearDefence_MapInfoTable[MapID].NumID
							NewYearDefence_MapInfoTable[MapID].NumID = NewYearDefence_MapInfoTable[MapID].NumID + 1
							MonsterFastID[MapID][NewYearDefence_MapInfoTable[MapID].NumID] = FastID
						end
					end
				end
			--刷轮数大于20，直接结束*****************************************8
			elseif NewYearDefence_MapInfoTable[MapID].actRound >= 20 and NewYearDefence_MapInfoTable[MapID].monCounter == 0 and NewYearDefenceFlag[MapID] == 1 then
			--刷轮数大于20，直接结束*****************************************8
				NewYearDefence_MapInfoTable[MapID].realEndHour = Hour
				NewYearDefence_MapInfoTable[MapID].realEndMinute = Minute
				--API_Trace('现在时间'..Hour..':'..Minute..'轮次大于20，开始刷活动结束提示')--***********
				NewYearDefenceFlag[MapID] = 2 --活动结束flag设置为2
				API_ActorBroadcastMsgLevelEx(MapID, -1, 21, 0, 17, '封印守护大作战成功！福神赐给封印之柱不被损伤的祝福，并在四周洒落奖励！10分钟后封印之柱消失。')
				API_ActorBroadcastMsgLevelEx(MapID, -1, 21, 0, 8, '封印守护大作战成功！福神赐给封印之柱不被损伤的祝福，并在四周洒落奖励！10分钟后封印之柱消失。')
				--活动成功给柱子加无敌状态
				--API_Trace('MapID:'..MapID..'柱子加无敌状态'..PoleFastID[MapID]..'投放奖励')
				API_MonsterAddStatus(PoleFastID[MapID], 742001, 999999)
				--活动成功投放奖励
				local ConfigMapID = API_GetMapConfigID(MapID)
				local x1 = SealPoleTable[ConfigMapID].TileX - 8
				local x2 = SealPoleTable[ConfigMapID].TileX + 8
				local y1 = SealPoleTable[ConfigMapID].TileY - 8
				local y2 = SealPoleTable[ConfigMapID].TileY + 8
				local GDNum = 0
				for j in NewYearDefence_Pole_GoodsTable do
					local RD = math.random(1000000)
					local GoodsID = NewYearDefence_Pole_GoodsTable[j].GoodsID
					if type(GoodsID) == 'table' then
						local Type = math.random(1,table.getn(GoodsID))
						GoodsID = GoodsID[Type]
					end
					local GoodsNum = NewYearDefence_Pole_GoodsTable[j].GoodsNum
					local GaiLv = NewYearDefence_Pole_GoodsTable[j].GaiLv
					local PinZhi = NewYearDefence_Pole_GoodsTable[j].PinZhi
					
					--{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
					if RD <= GaiLv then
						local x,y
						local Num = 0
						repeat
							Num = Num + 1
							x = math.random(x1,x2)
							y = math.random(y1,y2)
						until not API_IsBlockTile(MapID,x,y,0) or Num == 100
						if not API_IsBlockTile(MapID,x,y,0) then
							GDNum = GDNum + 1
							if PinZhi > 0 then
							
								if API_CreateDropGoodsEx(MapID,x,y,GoodsID,GoodsNum,0,'封印大作战成功奖励',4,0,600,0,PinZhi) == true then
								end
							else
								if API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'封印大作战成功奖励',4,0,600,0) == true then
								end
							end
						end
					end
				end
				--限量物品投放
				for j in NewYearDefence_GoodsMaxNumTable do
					local RD = math.random(1000000)
					local GoodsID = j
					local GoodsNum = NewYearDefence_GoodsMaxNumTable[j].GoodsNum
					local GaiLv = NewYearDefence_GoodsMaxNumTable[j].GaiLv
					local Num = NewYearDefence_GoodsMaxNumTable[j].Num
					local MaxNum = NewYearDefence_GoodsMaxNumTable[j].MaxNum
					if Num < MaxNum then
						if RD <= GaiLv then
							local x,y
							local Num2 = 0
							repeat
								Num2 = Num2 + 1
								x = math.random(x1,x2)
								y = math.random(y1,y2)
							until not API_IsBlockTile(MapID,x,y,0) or Num2 == 100
							if not API_IsBlockTile(MapID,x,y,0) then
								if GoodsID == 88952 then--爱慕之心
									if Month == 2 and Day >= 11 and Day <= 17 then
										if API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'封印大作战成功特殊奖励',4,0,600,0) == true then
										end
										Num = Num + GoodsNum
										NewYearDefence_GoodsMaxNumTable[j].Num = Num
									end
								else
									if API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'封印大作战成功特殊奖励',4,0,600,0) == true then
									end
									Num = Num + GoodsNum
									NewYearDefence_GoodsMaxNumTable[j].Num = Num
								end
								
							end
						end
					end
					
					
					
					
					--风向标统计数据
					if GoodsID == 88952 then--爱慕之心
						local LaiYuan = 1
						if GLOBAL_FengXiangBiao_DateList[66][88952][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[66][88952][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[66][88952][LaiYuan] = GLOBAL_FengXiangBiao_DateList[66][88952][LaiYuan] + 1
						end
					elseif GoodsID == 31040 then--兔子宠物
						local LaiYuan = 1
						if GLOBAL_FengXiangBiao_DateList[66][31040][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[66][31040][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[66][31040][LaiYuan] = GLOBAL_FengXiangBiao_DateList[66][31040][LaiYuan] + 1
						end
					elseif GoodsID == 11009 then--节日招财帽[白银男装]
						local LaiYuan = 1
						if GLOBAL_FengXiangBiao_DateList[66][11009][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[66][11009][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[66][11009][LaiYuan] = GLOBAL_FengXiangBiao_DateList[66][11009][LaiYuan] + 1
						end
					elseif GoodsID == 11010 then--节日招财装[白银男装]
						local LaiYuan = 1
						if GLOBAL_FengXiangBiao_DateList[66][11010][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[66][11010][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[66][11010][LaiYuan] = GLOBAL_FengXiangBiao_DateList[66][11010][LaiYuan] + 1
						end
					elseif GoodsID == 11011 then--节日鸿运帽[白银女装]
						local LaiYuan = 1
						if GLOBAL_FengXiangBiao_DateList[66][11011][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[66][11011][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[66][11011][LaiYuan] = GLOBAL_FengXiangBiao_DateList[66][11011][LaiYuan] + 1
						end
					elseif GoodsID == 11012 then--节日鸿运装[白银女装]
						local LaiYuan = 1
						if GLOBAL_FengXiangBiao_DateList[66][11012][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[66][11012][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[66][11012][LaiYuan] = GLOBAL_FengXiangBiao_DateList[66][11012][LaiYuan] + 1
						end
					end--
				
				end
				NewYearDefence_EndFunc()
			end
		end
	end
end

--封印之柱被击破回调函数
function NewYearDenfence_SealPole_DieTriggerGCallFunc(MapID,CampID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()	
	
	if KillerType == -1 or KillerID == -1 then
		return
	end
	
	local TimeTriggerGID = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.TIMER_TRIGGERG_ID)
	
	if TimeTriggerGID ~= nil then
		API_DestroyTriggerG(TimeTriggerGID)
	end
	
	if NewYearDefenceFlag[MapID] == nil or NewYearDefenceFlag[MapID] == 1 then
		NewYearDefenceFlag[MapID] = 2 --活动FLag设置为2
		--实际活动结束时间
		NewYearDefence_MapInfoTable[MapID].realEndHour = Hour
		NewYearDefence_MapInfoTable[MapID].realEndMinute = Minute
		API_ActorBroadcastMsgLevelEx(MapID, -1, 21, 0, 17, '封印之柱被破坏，怪物停止了入侵，封印守护大作战结束！')
		API_ActorBroadcastMsgLevelEx(MapID, -1, 21, 0, 8, '封印之柱被破坏，怪物停止了入侵，封印守护大作战结束！')	
	end
	NewYearDefence_EndFunc()
end

--小怪死亡回调函数
function NewYearDenfence_Monster_DieTriggerGCallFunc(MapID,CampID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	
	if KillerID == -1 or KillerType == -1 then
		return
	end
	
	if MapID <= 0 then
		return
	end
	if not API_MapIsValid(MapID) then
		return
	end
	
	local TeamID = API_GetTeamID(KillerID)
	local GuiShuType = 0
	local WhatID = 0
	if TeamID > 0 then
		GuiShuType = 3
		WhatID = TeamID
	else
		GuiShuType = 0
		WhatID = KillerID
	end

	local MapConfigID = API_GetMapConfigID(MapID)
	local GoodsTable = NewYearDefence_Monster_GoodsTable
			
	for i in GoodsTable do
		local GaiLv = GoodsTable[i].GaiLv
		local RD = math.random(1000000)
		if RD <= GaiLv then
			local GoodsID = GoodsTable[i].GoodsID
			if type(GoodsID) == 'table' then
				local Type = math.random(1,table.getn(GoodsID))
				GoodsID = GoodsID[Type]
			end
			local Num  = GoodsTable[i].GoodsNum
			local PinZhi  = GoodsTable[i].PinZhi
			if PinZhi > 0 then
				if API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,Num,0,'封印大作战小怪掉落',GuiShuType,WhatID,600,120,PinZhi) == true then
				end
			else
				if API_CreateDropGoods(MapID,PosX,PosY,GoodsID,Num,0,'封印大作战小怪掉落',GuiShuType,WhatID,600,120) == true then
				end
			end
		end
	end
end

--Boss死亡回调函数
function NewYearDenfence_Boss_DieTriggerGCallFunc(MapID,CampID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if MapID <= 0 then
		return
	end
	if not API_MapIsValid(MapID) then
		return
	end
	
	if KillerID == -1 or KillerType == -1 then
		return
	end
	
	local TeamID = API_GetTeamID(KillerID)
	local GuiShuType = 0
	local WhatID = 0
	if TeamID > 0 then
		GuiShuType = 3
		WhatID = TeamID
	else
		GuiShuType = 0
		WhatID = KillerID
	end

	local MapConfigID = API_GetMapConfigID(MapID)
	local GoodsTable = NewYearDefence_Boss_GoodsTable
			
	for i in GoodsTable do
		local GaiLv = GoodsTable[i].GaiLv
		local RD = math.random(1000000)
		if RD <= GaiLv then
			local GoodsID = GoodsTable[i].GoodsID
			if type(GoodsID) == 'table' then
				local Type = math.random(1,table.getn(GoodsID))
				GoodsID = GoodsID[Type]
			end
			local Num  = GoodsTable[i].GoodsNum
			local PinZhi  = GoodsTable[i].PinZhi
			if PinZhi > 0 then
				if API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,Num,0,'封印大作战神兽掉落',GuiShuType,WhatID,600,120,PinZhi) == true then
				end
			else
				if API_CreateDropGoods(MapID,PosX,PosY,GoodsID,Num,0,'封印大作战神兽掉落',GuiShuType,WhatID,600,120) == true then
				end
			end
		end
	end
end