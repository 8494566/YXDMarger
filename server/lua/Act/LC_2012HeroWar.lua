-------------------------------
--文件名:	Scp\Lua\Act\LC_2012HeroWar.lua
--版  权:	深圳腾讯计算机系统有限公司
--创建人:	刘操
--日  期:	2012-3-26
--版  本:	
--描  述:   英雄大作战
--应  用:  
-------------------------------

local HeroWar_StartTime = {Year = 2012,Month = 3,Day = 26,Hour = 0,Minute = 0,Second = 0}
local HeroWar_EndTime = {Year = 2015,Month = 4,Day = 9,Hour = 0,Minute = 0,Second = 0}


local HeroWar_MonsterIDTable = {
[10] = {MonsterID = {918040,919040,920040,918040,919040,920040,918040,919040,920040,918040,919040,920040,918040,919040,920040,
					918040,919040,920040,918040,919040,920040,918040,919040,920040,918040,919040,920040,918040,919040,920040,928040,},TileX = 139,TileY = 279},
[23] = {MonsterID = {931040,932040,933040,931040,932040,933040,931040,932040,933040,931040,932040,933040,931040,932040,933040,
					931040,932040,933040,931040,932040,933040,931040,932040,933040,931040,932040,933040,931040,932040,933040,941040,},TileX = 127,TileY = 297},
[99] = {MonsterID = {934055,935055,936055,934055,935055,936055,934055,935055,936055,934055,935055,936055,934055,935055,936055,
					934055,935055,936055,934055,935055,936055,934055,935055,936055,934055,935055,936055,934055,935055,936055,942055,},TileX = 399,TileY = 297},
[98] = {MonsterID = {921055,922055,923055,921055,922055,923055,921055,922055,923055,921055,922055,923055,921055,922055,923055,
					921055,922055,923055,921055,922055,923055,921055,922055,923055,921055,922055,923055,921055,922055,923055,929055,},TileX = 309,TileY = 395},
[101] = {MonsterID = {	
						[1]={924065,925065,926065,927065,924065,925065,926065,927065,924065,925065,926065,927065,924065,925065,926065,927065,924065,925065,926065,927065,930065},
						[2]={937065,938065,939065,940065,937065,938065,939065,940065,937065,938065,939065,940065,937065,938065,939065,940065,937065,938065,939065,940065,943065},
						},
						TileX = 466,TileY = 425},
}

if HeroWar_MonsterIDlist == nil then
	HeroWar_MonsterIDlist = {}
end

if HeroWar_BossIDlist == nil then
	HeroWar_BossIDlist = {}
end

if API_GetServerID() < 11 then
	local StartTimeTable = HeroWar_StartTime
	local EndTimeTable = HeroWar_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
	--创建时间触发器
		if HeroWar_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(HeroWar_TimeTriggerGID)
		end
		HeroWar_TimeTriggerGID = API_CreateTimerTriggerG(0,0,60,-1,'HeroWar_TimerTriggerGCallFunc')
	else
		if HeroWar_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(HeroWar_TimeTriggerGID)
		end
	end
end

--英雄大战时间回调
function HeroWar_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.time()
	local StartTimeTable = HeroWar_StartTime
	local EndTimeTable = HeroWar_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if Week == 6 or Week == 7 then 
			if Hour == 12 and API_GetServerID() == 1 then
				if Minute == 30 or Minute == 40 or Minute == 50 then
					API_ActorBroadcastMsgEx(-1,1,0,17,'帝国的远征军将在13点出现在珊瑚群岛与娜纱湿地，请各路英雄前往将他们击退！！！')
					API_ActorBroadcastMsgEx(-1,1,0,1,'帝国的远征军将在13点出现在珊瑚群岛与娜纱湿地，请各路英雄前往将他们击退！！！')
					API_ActorBroadcastMsgEx(-1,1,0,7,'帝国的远征军将在13点出现在珊瑚群岛与娜纱湿地，请各路英雄前往将他们击退！！！')
					
					API_ActorBroadcastMsgEx(-1,0,0,17,'联邦的远征军将在13点出现在阳光雨林与落日农庄，请各路英雄前往将他们击退！！！')
					API_ActorBroadcastMsgEx(-1,0,0,1,'联邦的远征军将在13点出现在阳光雨林与落日农庄，请各路英雄前往将他们击退！！！')
					API_ActorBroadcastMsgEx(-1,0,0,7,'联邦的远征军将在13点出现在阳光雨林与落日农庄，请各路英雄前往将他们击退！！！')
				end
			end
		end
		
		--远征军判断
		if Hour == 13 and NowTime > API_VarDataGetNumber_Ex(1,0,-6018,1,1) then
			if Week == 6 or Week == 7 then
				local NowTime = os.date("*t", os.time()) 
				NowTime.year = Year
				NowTime.month = Month
				NowTime.day = Day
				NowTime.hour = 12
				NowTime.min = 59 
				NowTime.sec = 59
				local NightTime = os.time(NowTime)
				local NextQingChuTime = NightTime + 86400 + 1
	--			API_VarDataSetNumber_Ex_Sync(1,0,-6018,1,1,NextQingChuTime)
				API_VarDataSetNumber_Ex(1,0,-6018,1,1,NextQingChuTime)
				API_VarDataSetNumber_Ex_Sync(1,0,-6018,1,6,10)
				HeroWar_Create()
			end
		end
		
		--刷boss判断
		if Week == 6 or Week == 7 then		
			if API_VarDataGetNumber_Ex(1,0,-6018,1,2) == 1 and NowTime > API_VarDataGetNumber_Ex(1,0,-6018,1,3) then		
				local JiShaNum1 = API_VarDataGetNumber_Ex(1,0,-6018,1,4)
				local JiShaNum2 = API_VarDataGetNumber_Ex(1,0,-6018,1,5)
				if JiShaNum1 == 2 or JiShaNum2 == 2 then
					HeroWarMonster_Destroy()
					if API_VarDataGetNumber_Ex(1,0,-6018,1,6) > 0 then
						if JiShaNum2 == 2 and API_GetServerID() == 1 then
							API_ActorBroadcastMsgEx(-1,1,0,17,'帝国战士'..API_VarDataGetNumber_Ex(1,0,-6018,1,6)..'分钟后将在月幕草场的伊度盆地向我方发动总攻，请各路英雄速前往月幕草场支援！！！')
							API_ActorBroadcastMsgEx(-1,1,0,1,'帝国战士'..API_VarDataGetNumber_Ex(1,0,-6018,1,6)..'分钟后将在月幕草场的伊度盆地向我方发动总攻，请各路英雄速前往月幕草场支援！！！')
							API_ActorBroadcastMsgEx(-1,1,0,7,'帝国战士'..API_VarDataGetNumber_Ex(1,0,-6018,1,6)..'分钟后将在月幕草场的伊度盆地向我方发动总攻，请各路英雄速前往月幕草场支援！！！')
							
							API_ActorBroadcastMsgEx(-1,0,0,17,'勇士们，乘胜追击，'..API_VarDataGetNumber_Ex(1,0,-6018,1,6)..'分钟后前往月幕草场的伊度盆地击退联邦军团首领可获得丰厚奖励！！！')
							API_ActorBroadcastMsgEx(-1,0,0,1,'勇士们，乘胜追击，'..API_VarDataGetNumber_Ex(1,0,-6018,1,6)..'分钟后前往月幕草场的伊度盆地击退联邦军团首领可获得丰厚奖励！！！')
							API_ActorBroadcastMsgEx(-1,0,0,7,'勇士们，乘胜追击，'..API_VarDataGetNumber_Ex(1,0,-6018,1,6)..'分钟后前往月幕草场的伊度盆地击退联邦军团首领可获得丰厚奖励！！！')
						elseif JiShaNum1 == 2 and API_GetServerID() == 1 then
							API_ActorBroadcastMsgEx(-1,0,0,17,'联邦战士'..API_VarDataGetNumber_Ex(1,0,-6018,1,6)..'分钟后将在月幕草场的伊度盆地向我方发动总攻，请各路英雄速前往月幕草场支援！！！')
							API_ActorBroadcastMsgEx(-1,0,0,1,'联邦战士'..API_VarDataGetNumber_Ex(1,0,-6018,1,6)..'分钟后将在月幕草场的伊度盆地向我方发动总攻，请各路英雄速前往月幕草场支援！！！')
							API_ActorBroadcastMsgEx(-1,0,0,7,'联邦战士'..API_VarDataGetNumber_Ex(1,0,-6018,1,6)..'分钟后将在月幕草场的伊度盆地向我方发动总攻，请各路英雄速前往月幕草场支援！！！')
							
							API_ActorBroadcastMsgEx(-1,1,0,17,'勇士们，乘胜追击，'..API_VarDataGetNumber_Ex(1,0,-6018,1,6)..'分钟后前往月幕草场的伊度盆地击退帝国军团首领可获得丰厚奖励！！！')
							API_ActorBroadcastMsgEx(-1,1,0,1,'勇士们，乘胜追击，'..API_VarDataGetNumber_Ex(1,0,-6018,1,6)..'分钟后前往月幕草场的伊度盆地击退帝国军团首领可获得丰厚奖励！！！')
							API_ActorBroadcastMsgEx(-1,1,0,7,'勇士们，乘胜追击，'..API_VarDataGetNumber_Ex(1,0,-6018,1,6)..'分钟后前往月幕草场的伊度盆地击退帝国军团首领可获得丰厚奖励！！！')
						end
					end
					if API_GetServerID() == 1 then
						local BossXinDaoJiShi = API_VarDataGetNumber_Ex(1,0,-6018,1,6)
						BossXinDaoJiShi = BossXinDaoJiShi - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6018,1,6,BossXinDaoJiShi)
					end
					if API_VarDataGetNumber_Ex(1,0,-6018,1,6) <= 0 then
						local RightMapID = API_GetRightMapID(101)
						if API_MapIsValid(RightMapID) then
							if HeroWar_BossIDlist[RightMapID] == nil then
								HeroWar_BossIDlist[RightMapID] = {}
							end
							local Width,Height = PublicFun_GetMapWidthHeight(RightMapID)
							local TileX = 0
							local TileY = 0
							local Num = 0
							repeat
								Num = Num + 1
								TileX = math.random(Width)
								TileY = math.random(Height)
							until not API_IsBlockTile(RightMapID,TileX,TileY,0) or Num == 100
							if not API_IsBlockTile(RightMapID,TileX,TileY,0) then
							
								local MonsterNum = 1
								local MonsterIDTable = HeroWar_MonsterIDTable
								if type(MonsterIDTable[101].MonsterID[1]) == 'table' then
									MonsterNum = table.getn(MonsterIDTable[101].MonsterID[1])
								end
								for i=1,MonsterNum do
									if API_VarDataGetNumber_Ex(1,0,-6018,1,4) == 2 then
										local MonsterID = MonsterIDTable[101].MonsterID[1][i]
										HeroWarBoss_FastID = API_CreateMonster(RightMapID,MonsterID,466,425,0,0,-1)
										API_CreateDieTriggerG(0,0,0,HeroWarBoss_FastID,'HeroWar_MonsterDie')
										HeroWar_BossIDlist[RightMapID][i] = HeroWarBoss_FastID
									elseif API_VarDataGetNumber_Ex(1,0,-6018,1,5) == 2 then
										local MonsterID = MonsterIDTable[101].MonsterID[2][i]
										HeroWarBoss_FastID = API_CreateMonster(RightMapID,MonsterID,466,425,0,0,-1)
										API_CreateDieTriggerG(0,0,0,HeroWarBoss_FastID,'HeroWar_MonsterDie')
										HeroWar_BossIDlist[RightMapID][i] = HeroWarBoss_FastID
									end
								end
							end
							local NowTime = os.date("*t", os.time()) 
							NowTime.year = Year
							NowTime.month = Month
							NowTime.day = Day
							NowTime.hour = 11 
							NowTime.min = 59 
							NowTime.sec = 59
							local NightTime = os.time(NowTime)
							local NextQingChuTime = NightTime + 86400 + 1
							API_VarDataSetNumber_Ex_Sync(1,0,-6018,1,3,NextQingChuTime)
							
							local NowTime = os.date("*t", os.time()) 
							NowTime.year = Year
							NowTime.month = Month
							NowTime.day = Day
							NowTime.hour = Hour
							NowTime.min = Minute + 30
							NowTime.sec = Second
							if NewYearBigMonster_EndDateTimeTriggerGID == nil then
								NewYearBigMonster_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(RightMapID,0,NowTime.year,NowTime.month,NowTime.day,NowTime.hour,NowTime.min,NowTime.sec,'HeroWarBoss_Destroy')
							else
								API_DestroyTriggerG(NewYearBigMonster_EndDateTimeTriggerGID)
								NewYearBigMonster_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(RightMapID,0,NowTime.year,NowTime.month,NowTime.day,NowTime.hour,NowTime.min,NowTime.sec,'HeroWarBoss_Destroy')
							end
						end
					end
				end
			end
		end
	end
end

--联邦帝国怪物创建
function HeroWar_Create()
	for i in HeroWar_MonsterIDlist do
		for j,v in HeroWar_MonsterIDlist[i] do
			if API_GetMonsterID(v) > 0 then
				API_DestroyMonster(v)
			end
		end
	end
	local NewYearMapIDList = {23,10,99,98}
	for i,v in NewYearMapIDList do
		local RightMapID = API_GetRightMapID(v)
		if API_MapIsValid(RightMapID) then
			if HeroWar_MonsterIDlist[RightMapID] == nil then
				HeroWar_MonsterIDlist[RightMapID] = {}
			end
			local Width,Height = PublicFun_GetMapWidthHeight(RightMapID)
			local TileX = 0
			local TileY = 0
			local Num = 0
			repeat
				Num = Num + 1
				TileX = math.random(Width)
				TileY = math.random(Height)
			until not API_IsBlockTile(RightMapID,TileX,TileY,0) or Num == 100
			if not API_IsBlockTile(RightMapID,TileX,TileY,0) then
				local MonsterNum = 1
				local MonsterIDTable = HeroWar_MonsterIDTable
				if type(MonsterIDTable[v].MonsterID) == 'table' then
					MonsterNum = table.getn(MonsterIDTable[v].MonsterID)
				end
				for i=1,MonsterNum do
					local MonsterID = MonsterIDTable[v].MonsterID[i]
					local HeroWarMonster_Fast = API_CreateMonster(RightMapID,MonsterID,TileX,TileY,0,0,-1)
					API_CreateDieTriggerG(0,0,0,HeroWarMonster_Fast,'HeroWar_MonsterDie')
					HeroWar_MonsterIDlist[RightMapID][i] = HeroWarMonster_Fast
				end
				local RTileX = API_TileToPixelX(RightMapID,TileX,TileY)
				local RTileY = API_TileToPixelY(RightMapID,TileX,TileY)
				if v == 23 then
					if API_GetServerID() == 1 then
						API_ActorBroadcastMsgEx(-1,0,0,17,'联邦远征军已出现在阳光雨林（'..RTileX..'，'..RTileY..'）！！！')
						API_ActorBroadcastMsgEx(-1,0,0,1,'联邦远征军已出现在阳光雨林（'..RTileX..'，'..RTileY..'）！！！')
						API_ActorBroadcastMsgEx(-1,0,0,7,'联邦远征军已出现在阳光雨林（'..RTileX..'，'..RTileY..'）！！！')
					end
				elseif v == 10 then
					if API_GetServerID() == 1 then
						API_ActorBroadcastMsgEx(-1,1,0,17,'帝国远征军已出现在珊瑚群岛（'..RTileX..'，'..RTileY..'）！！！')
						API_ActorBroadcastMsgEx(-1,1,0,1,'帝国远征军已出现在珊瑚群岛（'..RTileX..'，'..RTileY..'）！！！')
						API_ActorBroadcastMsgEx(-1,1,0,7,'帝国远征军已出现在珊瑚群岛（'..RTileX..'，'..RTileY..'）！！！')
					end
				elseif v == 98 then
					if API_GetServerID() == 1 then
						API_ActorBroadcastMsgEx(-1,1,0,17,'帝国远征军已出现在娜纱湿地（'..RTileX..'，'..RTileY..'）！！！')
						API_ActorBroadcastMsgEx(-1,1,0,1,'帝国远征军已出现在娜纱湿地（'..RTileX..'，'..RTileY..'）！！！')
						API_ActorBroadcastMsgEx(-1,1,0,7,'帝国远征军已出现在娜纱湿地（'..RTileX..'，'..RTileY..'）！！！')
					end
				elseif v == 99 then
					if API_GetServerID() == 1 then
						API_ActorBroadcastMsgEx(-1,0,0,17,'联邦远征军已出现在落日农庄（'..RTileX..'，'..RTileY..'）！！！')
						API_ActorBroadcastMsgEx(-1,0,0,1,'联邦远征军已出现在落日农庄（'..RTileX..'，'..RTileY..'）！！！')
						API_ActorBroadcastMsgEx(-1,0,0,7,'联邦远征军已出现在落日农庄（'..RTileX..'，'..RTileY..'）！！！')
					end
				end
			end
		end
	end
	if API_GetServerID() == 1 then
	end
	API_VarDataSetNumber_Ex_Sync(1,0,-6018,1,4,0)--初始杀怪数
	API_VarDataSetNumber_Ex_Sync(1,0,-6018,1,5,0)--初始杀怪数
	API_VarDataSetNumber_Ex_Sync(1,0,-6018,1,2,1)--进度标志
	
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.date("*t", os.time()) 
	NowTime.year = Year
	NowTime.month = Month
	NowTime.day = Day
	NowTime.hour = Hour + 1
	NowTime.min = Minute
	NowTime.sec = Second
	if NewYearMonster_EndDateTimeTriggerGID == nil then
		NewYearMonster_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,NowTime.year,NowTime.month,NowTime.day,NowTime.hour,NowTime.min,NowTime.sec,'HeroWarMonster_Destroy')
	else
		API_DestroyTriggerG(NewYearMonster_EndDateTimeTriggerGID)
		NewYearMonster_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,NowTime.year,NowTime.month,NowTime.day,NowTime.hour,NowTime.min,NowTime.sec,'HeroWarMonster_Destroy')
	end
end

--删除联邦帝国怪物
function HeroWarMonster_Destroy()
	--删除小怪
	local GuangBaoNum1 = 0
	for i in HeroWar_MonsterIDlist do
		for j,v in HeroWar_MonsterIDlist[i] do
			if API_GetMonsterID(v) > 0 then
				API_DestroyMonster(v)
				GuangBaoNum1 = GuangBaoNum1 + 1
				if GuangBaoNum1 == 1 then
					local JiShaNum1 = API_VarDataGetNumber_Ex(1,0,-6018,1,4)
					local JiShaNum2 = API_VarDataGetNumber_Ex(1,0,-6018,1,5)
					if JiShaNum1 ~= 2 and JiShaNum2 ~= 2 then 
						API_ActorBDCMsg(-1,0,-1,11,85,0,17,'英雄大作战结束。')
						API_ActorBDCMsg(-1,1,-1,11,85,0,1,'英雄大作战结束。')
					end
				end
			end
		end
	end
	HeroWar_MonsterIDlist = {}
end

--删除BOSS
function HeroWarBoss_Destroy(MapID,a)
	--删除BOSS
	local GuangBaoNum1 = 0
	local Camp = 2
	for i in HeroWar_BossIDlist do
		for j,v in HeroWar_BossIDlist[i] do
			if API_GetMonsterID(v) > 0 then
				local BossName = API_GetMonsterName(v)
				if BossName == '联邦军团首领' then
					Camp = 1
				elseif BossName == '帝国军团首领' then
					Camp = 0
				end
				API_DestroyMonster(v)
				GuangBaoNum1 = GuangBaoNum1 + 1
				if GuangBaoNum1 == 1 then
				end
			end
		end
	end
	HeroWar_BossIDlist = {}
	API_VarDataSetNumber_Ex_Sync(1,0,-6018,1,2,0)
	if Camp == 0 then
		API_ActorBroadcastMsg(-1,17,'帝国军团成功粉碎了联邦的进攻获得最终的胜利，总督在月幕草场派发了一批荣誉宝箱给帝国军团！！！')
		API_ActorBroadcastMsg(-1,1,'帝国军团成功粉碎了联邦的进攻获得最终的胜利，总督在月幕草场派发了一批荣誉宝箱给帝国军团！！！')
		API_ActorBroadcastMsg(-1,7,'帝国军团成功粉碎了联邦的进攻获得最终的胜利，总督在月幕草场派发了一批荣誉宝箱给帝国军团！！！')
	elseif Camp == 1 then
		API_ActorBroadcastMsg(-1,17,'联邦军团成功粉碎了帝国的进攻获得最终的胜利，总督在月幕草场派发了一批荣誉宝箱给联邦军团！！！')
		API_ActorBroadcastMsg(-1,1,'联邦军团成功粉碎了帝国的进攻获得最终的胜利，总督在月幕草场派发了一批荣誉宝箱给联邦军团！！！')
		API_ActorBroadcastMsg(-1,7,'联邦军团成功粉碎了帝国的进攻获得最终的胜利，总督在月幕草场派发了一批荣誉宝箱给联邦军团！！！')		
	end
	if Camp ~= 2 then
		HeroWar_WinJiangLi(MapID,Camp,2)
	end
end

local HeroWar_Goodstable = {
		[928040] = {
					{GoodsID=80832,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80275,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80276,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=501,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=501,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80381,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80381,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80381,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80381,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80381,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80383,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80383,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80383,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80383,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80383,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[941040] = {
					{GoodsID=80832,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80275,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80276,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=501,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=501,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80381,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80381,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80381,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80381,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80381,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80383,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80383,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80383,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80383,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80383,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[929055] = {
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=800000,PinZhi=0},
					{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
					{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
					{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=31021,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
					{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				},
		[942055] = {
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=800000,PinZhi=0},
					{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
					{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
					{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=31021,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
					{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				},
		[930065] = {
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=800000,PinZhi=0},
					{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=600000,PinZhi=0},
					{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=400000,PinZhi=0},
					{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=200000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
					{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
					{GoodsID={1003,1503,2003,3003,3903,4003,4103,4203,4303,4403,4503,5003,5103,5203,5303,5403,5503,6003,6103,6203,6303,6403,6503,6603,6703,6803,6903,7003,8003,8103,8203,8303},GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=6},					},
		[943065] = {
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=800000,PinZhi=0},
					{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=600000,PinZhi=0},
					{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=400000,PinZhi=0},
					{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=200000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
					{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
					{GoodsID={1003,1503,2003,3003,3903,4003,4103,4203,4303,4403,4503,5003,5103,5203,5303,5403,5503,6003,6103,6203,6303,6403,6503,6603,6703,6803,6903,7003,8003,8103,8203,8303},GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=6},
					},
}



--怪物死亡回调
function HeroWar_MonsterDie(ActorID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if MonsterID == 928040 or MonsterID == 929055 then
		if KillerID ~= -1 then
			local Num = API_VarDataGetNumber_Ex(1,0,-6018,1,4)
			Num = Num + 1
			API_VarDataSetNumber_Ex_Sync(1,0,-6018,1,4,Num)
		end
		local DiaoLuoNum = table.getn(HeroWar_Goodstable[MonsterID])
		for i = 1,DiaoLuoNum do
			local GoodsTable = HeroWar_Goodstable[MonsterID][i]
			local GoodsId = GoodsTable.GoodsID
			if type(GoodsId) == 'table' then
				local Type = math.random(1,table.getn(GoodsId))
				GoodsId = GoodsId[Type]
			end
			local Num = GoodsTable.GoodsNum
			local Flag = GoodsTable.Flag
			local Odds = GoodsTable.GaiLv
			local PinZhi = GoodsTable.PinZhi
			local Rand = math.random(1000000)
			if Rand <= Odds then
				if PinZhi > 0 then
					API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落装备',4,KillerID,600,60,PinZhi)
				else
					API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落物品',0,KillerID,600,60)
				end
			end
		end
		API_ActorBroadcastMsg(-1,17,'联邦军团成功击退了帝国的远征军头目！！！')
		API_ActorBroadcastMsg(-1,1,'联邦军团成功击退了帝国的远征军头目！！！')
		API_ActorBroadcastMsg(-1,7,'联邦军团成功击退了帝国的远征军头目！！！')
	elseif MonsterID == 941040 or MonsterID == 942055 then
		if KillerID ~= -1 then
			local Num = API_VarDataGetNumber_Ex(1,0,-6018,1,5)
			Num = Num + 1
			API_VarDataSetNumber_Ex_Sync(1,0,-6018,1,5,Num)
		end
		local DiaoLuoNum = table.getn(HeroWar_Goodstable[MonsterID])
		for i = 1,DiaoLuoNum do
			local GoodsTable = HeroWar_Goodstable[MonsterID][i]
			local GoodsId = GoodsTable.GoodsID
			if type(GoodsId) == 'table' then
				local Type = math.random(1,table.getn(GoodsId))
				GoodsId = GoodsId[Type]
			end
			local Num = GoodsTable.GoodsNum
			local Flag = GoodsTable.Flag
			local Odds = GoodsTable.GaiLv
			local PinZhi = GoodsTable.PinZhi
			local Rand = math.random(1000000)
			if Rand <= Odds then
				if PinZhi > 0 then
					API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落装备',4,KillerID,600,60,PinZhi)
				else
					API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落物品',0,KillerID,600,60)
				end
			end
		end
		API_ActorBroadcastMsg(-1,17,'帝国军团成功击退了联邦的远征军头目！！！')
		API_ActorBroadcastMsg(-1,1,'帝国军团成功击退了联邦的远征军头目！！！')
		API_ActorBroadcastMsg(-1,7,'帝国军团成功击退了联邦的远征军头目！！！')
	elseif  MonsterID == 930065 then
		local DiaoLuoNum = table.getn(HeroWar_Goodstable[MonsterID])
		for i = 1,DiaoLuoNum do
			local GoodsTable = HeroWar_Goodstable[MonsterID][i]
			local GoodsId = GoodsTable.GoodsID
			if type(GoodsId) == 'table' then
				local Type = math.random(1,table.getn(GoodsId))
				GoodsId = GoodsId[Type]
			end
			local Num = GoodsTable.GoodsNum
			local Flag = GoodsTable.Flag
			local Odds = GoodsTable.GaiLv
			local PinZhi = GoodsTable.PinZhi
			local Rand = math.random(1000000)
			if Rand <= Odds then
				if PinZhi > 0 then
					API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落装备',4,KillerID,600,60,PinZhi)
				else
					API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落物品',0,KillerID,600,60)
				end
			end
		end
		HeroWar_WinJiangLi(DynamicMapID,1,1)--获胜奖励
		API_ActorBroadcastMsg(-1,17,'联邦军团成功粉碎了帝国的进攻获得最终的胜利，总督在月幕草场派发了一批荣誉宝箱给联邦军团！！！')
		API_ActorBroadcastMsg(-1,1,'联邦军团成功粉碎了帝国的进攻获得最终的胜利，总督在月幕草场派发了一批荣誉宝箱给联邦军团！！！')
		API_ActorBroadcastMsg(-1,7,'联邦军团成功粉碎了帝国的进攻获得最终的胜利，总督在月幕草场派发了一批荣誉宝箱给联邦军团！！！')
	elseif  MonsterID == 943065 then
		local DiaoLuoNum = table.getn(HeroWar_Goodstable[MonsterID])
		for i = 1,DiaoLuoNum do
			local GoodsTable = HeroWar_Goodstable[MonsterID][i]
			local GoodsId = GoodsTable.GoodsID
			if type(GoodsId) == 'table' then
				local Type = math.random(1,table.getn(GoodsId))
				GoodsId = GoodsId[Type]
			end
			local Num = GoodsTable.GoodsNum
			local Flag = GoodsTable.Flag
			local Odds = GoodsTable.GaiLv
			local PinZhi = GoodsTable.PinZhi
			local Rand = math.random(1000000)
			if Rand <= Odds then
				if PinZhi > 0 then
					API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落装备',4,KillerID,600,60,PinZhi)
				else
					API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落物品',0,KillerID,600,60)
				end
			end
		end
		HeroWar_WinJiangLi(DynamicMapID,0,1)--获胜奖励
		API_ActorBroadcastMsg(-1,17,'帝国军团成功粉碎了联邦的进攻获得最终的胜利，总督在月幕草场派发了一批荣誉宝箱给帝国军团！！！')
		API_ActorBroadcastMsg(-1,1,'帝国军团成功粉碎了联邦的进攻获得最终的胜利，总督在月幕草场派发了一批荣誉宝箱给帝国军团！！！')
		API_ActorBroadcastMsg(-1,7,'帝国军团成功粉碎了联邦的进攻获得最终的胜利，总督在月幕草场派发了一批荣誉宝箱给帝国军团！！！')
	end
end

--获胜奖励
function HeroWar_WinJiangLi(MapID,Camp,Win)
	local GoodsNum = 0
	if Win ==1 then
		GoodsNum = 300
	elseif Win == 2 then
		GoodsNum = 600
	end
	for j = 1,300 do
		local Width,Height = PublicFun_GetMapWidthHeight(MapID)
		local TileX = 0
		local TileY = 0
		local Num = 0
		repeat
			Num = Num + 1
			TileX = math.random(Width)
			TileY = math.random(Height)
		until not API_IsBlockTile(MapID,TileX,TileY,0) or Num == 100
		if not API_IsBlockTile(MapID,TileX,TileY,0) then
			API_CreateDropGoods(MapID,TileX,TileY,89160,1,3,'掉落物品',2,Camp,600,600)
		end
	end
	if Win == 2 then
		local DiaoLuoNum = table.getn(HeroWar_Goodstable[943065])
		for i = 1,DiaoLuoNum do
			local GoodsTable = HeroWar_Goodstable[943065][i]
			local GoodsId = GoodsTable.GoodsID
			if type(GoodsId) == 'table' then
				local Type = math.random(1,table.getn(GoodsId))
				GoodsId = GoodsId[Type]
			end
			local Num = GoodsTable.GoodsNum
			local Flag = GoodsTable.Flag
			local Odds = GoodsTable.GaiLv
			local PinZhi = GoodsTable.PinZhi
			local Rand = math.random(1000000)
			if Rand <= Odds then
				if PinZhi > 0 then
					API_CreateDropGoodsEx(MapID,466,425,GoodsId,Num,Flag,'掉落装备',2,Camp,600,60,PinZhi)
				else
					API_CreateDropGoods(MapID,466,425,GoodsId,Num,Flag,'掉落物品',2,Camp,600,60)
				end
			end
		end

	end
end

