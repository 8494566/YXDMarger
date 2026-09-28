-----------------------------------------------------------------------------------------------------------------------------------------------------
--修改时间：2012年04月23日
--修 改 人：黄蕾
--修改内容：新增4月29日-5月6日机弩攻城活动
--			地图ID：100，场景服是1，20点30
--          BOSSID：850031卡罗斯， 944065变异凶兽，850029空间领主，850023神龙安卡
--          全局交互数据-6189，3位卡罗斯，4位空间领主，1位 变异熊兽，2位神龙安卡
--          第二部分;定时刷新一批精英怪物。ID:850063
-------------------------------------------------------------------------------------------------------------------------------------------------------
--无玩法BOSS领主空间领主
if YXD_WorldKingBossTab == nil then
	YXD_WorldKingBossTab = {
		[102] = {BossID=850029,BossFastID=0,Tile={658,534},},--沙暴绿洲场景8
	}
end
--卡罗斯  镜月地下城三层场景8
if YXD_WorldKingBoss_KaLuoSi == nil then
	YXD_WorldKingBoss_KaLuoSi = {
				[107] = {MapID=107,BossID=850031,BossFastID=0,BossTile={109,276},SBearID=850034,SBearNum=50,PBearID=850035,PBearNum=0,BearBabyID=850036,BearBabyNum=0,XYTile={101,237,142,283},},
				--[130] = {MapID=130,BossID=850104,BossFastID=0,BossTile={109,276},SBearID=850034,SBearNum=50,PBearID=850035,PBearNum=0,BearBabyID=850036,BearBabyNum=0,XYTile={101,237,142,283},},
					}
end

if YXD_WorldKingBoss_NianShouWang == nil then
	YXD_WorldKingBoss_NianShouWang = {
		[101] = {BossID=730603,BossFastID=0,Tile={455,448},},
	}
end

if YXD_WorldKingBoss_KaLuoSiXS == nil then
	YXD_WorldKingBoss_KaLuoSiXS = {}
end

if YXD_WorldKingBoss_KaLuoSiBXS == nil then
	YXD_WorldKingBoss_KaLuoSiBXS = {}
end

YXD_WorldKingBoss_TimeHD = YXD_WorldKingBoss_TimeHD or API_CreateTimerTriggerG(0,0,60,-1,'YXD_WorldKingBoss_TimeFunc')

function YXD_WorldKingBoss_TimeFunc(a,b)
	
	--五一特殊处理
	local TStartTime = {Year = 2012,Month = 4,Day = 27,Hour = 0,Minute = 0,Second = 0} ;--开始时间
	local TEndTime = {Year = 2012,Month = 5,Day = 6,Hour = 23,Minute = 59,Second = 59}  ;--停止时间
	local nShiFouStart = API_DiffDatatime(TStartTime.Year,TStartTime.Month,TStartTime.Day,TStartTime.Hour,TStartTime.Minute,TStartTime.Second);
	local nShiFouEnd = API_DiffDatatime(TEndTime.Year,TEndTime.Month,TEndTime.Day,TEndTime.Hour,TEndTime.Minute,TEndTime.Second);
	
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	--if nShiFouStart <= 0 and nShiFouEnd > 0 then--活动时间内
		
	--else
		if Hour == 19 and Minute == 0 then
			for j in YXD_WorldKingBossTab do
				local MapID = API_GetRightMapID(j)
				local Table = YXD_WorldKingBossTab[j]
				if API_MapIsValid(MapID) then
					local BossID = Table.BossID
					local BossFastID = Table.BossFastID
					if API_GetMonsterID(BossFastID) <= 0 then
						local RandomTime = math.random(10)
						API_CreateTimerTriggerG(j,0, RandomTime,1, 'YXD_WorldKingBoss_CreatBoss')
					end
				end
			end
					if API_GetServerID() == 1 then
						local RandomTime = math.random(10)
						API_CreateTimerTriggerG(0,0,RandomTime,1, 'YXD_WorldKingBoss_CreatKaLuoSi')
					end	
			for j in YXD_WorldKingBoss_NianShouWang do
				local MapID = API_GetRightMapID(j)
				local Table = YXD_WorldKingBoss_NianShouWang[j]
				if API_MapIsValid(MapID) then
					local BossID = Table.BossID
					local BossFastID = Table.BossFastID
					if API_GetMonsterID(BossFastID) <= 0 then
						local RandomTime = math.random(10)
						API_CreateTimerTriggerG(j,0, RandomTime,1, 'YXD_WorldKingBoss_NianShouCreatBoss')
					end
				end
			end

		end
	--end
end
----------------------------------------------------------------------------------------------------------------
--新增4月29日-5月6日机弩攻城活动
--时间触发器
if API_GetServerID() == 1 then
		--API_Trace('触发器回调')
		local nRandomTime = math.random(60,120)
		--API_Trace('nRandomTime'..nRandomTime)
		--空间领主BOSS
		if KJLZBossTask_TimeTriggerGIDsofie ~= nil then
			API_DestroyTriggerG(KJLZBossTask_TimeTriggerGIDsofie)
		end
		KJLZBossTask_TimeTriggerGIDsofie = API_CreateTimerTriggerG(100,0,nRandomTime,-1,'KJLZBoss_Task_Time')
		--卡罗斯
		if KLSBossTask_TimeTriggerGIDsofie ~= nil then
			API_DestroyTriggerG(KLSBossTask_TimeTriggerGIDsofie)
		end
		KLSBossTask_TimeTriggerGIDsofie = API_CreateTimerTriggerG(100,0,90,-1,'KLSBoss_Task_Time')	
end
--卡罗斯
function KLSBoss_Task_Time(MapConfigID)
	--API_Trace('调用成功0')
	local nNowTime = os.time()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local TStartTime = {Year = 2012,Month = 4,Day = 27,Hour = 0,Minute = 0,Second = 0} ;--开始时间
	local TEndTime = {Year = 2012,Month = 5,Day = 6,Hour = 23,Minute = 59,Second = 59}  ;--停止时间
	local nShiFouStart = API_DiffDatatime(TStartTime.Year,TStartTime.Month,TStartTime.Day,TStartTime.Hour,TStartTime.Minute,TStartTime.Second);
	local nShiFouEnd = API_DiffDatatime(TEndTime.Year,TEndTime.Month,TEndTime.Day,TEndTime.Hour,TEndTime.Minute,TEndTime.Second);
	--API_Trace('调用成功')
	if Hour == 19 and Minute == 0 then
			--API_Trace('调用成功1')
		if nNowTime > API_VarDataGetNumber_Ex(1,0,-6189,1,3)  then
			--API_Trace('调用成功2')
			--节日特殊处理
			if nShiFouStart <= 0 and nShiFouEnd > 0 then--活动时间内
				--API_Trace('调用节日特殊处理')
				local RandomTime = math.random(60,120)
				API_CreateTimerTriggerG(100,0, RandomTime,1, 'Boss_Task_SofieKLSCreat')
				--API_Trace('调用成功3')
				local NowTime = os.date("*t", os.time()) --os.time()当前时间
				NowTime.year = Year
				NowTime.month = Month
				NowTime.day = Day
				NowTime.hour = 19
				NowTime.min = 0 
				NowTime.sec = 0 
				local NextTime = os.time(NowTime) 
				RefreshTimeSofieKLSBoss = NextTime + 86400 
				API_VarDataSetNumber_Ex_Sync(1,0,-6189,1,3,RefreshTimeSofieKLSBoss) 
			end
		end
	end
end
--空间领主
function KJLZBoss_Task_Time(MapConfigID)
	--API_Trace('调用成功0')
	local nNowTime = os.time()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local TStartTime = {Year = 2012,Month = 4,Day = 27,Hour = 0,Minute = 0,Second = 0} ;--开始时间
	local TEndTime = {Year = 2012,Month = 5,Day = 6,Hour = 23,Minute = 59,Second = 59}  ;--停止时间
	local nShiFouStart = API_DiffDatatime(TStartTime.Year,TStartTime.Month,TStartTime.Day,TStartTime.Hour,TStartTime.Minute,TStartTime.Second);
	local nShiFouEnd = API_DiffDatatime(TEndTime.Year,TEndTime.Month,TEndTime.Day,TEndTime.Hour,TEndTime.Minute,TEndTime.Second);
	--API_Trace('调用成功')
	if Hour == 20 and Minute >= 30 and Minute <= 33 then
			--API_Trace('调用成功1')
		if nNowTime > API_VarDataGetNumber_Ex(1,0,-6189,1,4)  then
			--API_Trace('调用成功2')
			--节日特殊处理
			if nShiFouStart <= 0 and nShiFouEnd > 0 then--活动时间内
				--API_Trace('调用节日特殊处理')
				local RandomTime = math.random(1,120)
				API_CreateTimerTriggerG(100,0, RandomTime,1, 'Boss_Task_SofieKJLZCreat')
				--API_Trace('调用成功3')
				local NowTime = os.date("*t", os.time()) --os.time()当前时间
				NowTime.year = Year
				NowTime.month = Month
				NowTime.day = Day
				NowTime.hour = 20 
				NowTime.min = 30 
				NowTime.sec = 0 
				local NextTime = os.time(NowTime) 
				RefreshTimeSofieKJLZBoss = NextTime + 86400 
				API_VarDataSetNumber_Ex_Sync(1,0,-6189,1,4,RefreshTimeSofieKJLZBoss) 
			end
		end
	end
end
--刷5.1的卡罗斯
function Boss_Task_SofieKLSCreat(MapConfigID,b)
	--API_Trace('刷5.1的卡罗斯')
	local TStartTime = {Year = 2012,Month = 4,Day = 27,Hour = 0,Minute = 0,Second = 0} ;--开始时间
	local TEndTime = {Year = 2012,Month = 5,Day = 6,Hour = 23,Minute = 59,Second = 59}  ;--停止时间
	local nShiFouStart = API_DiffDatatime(TStartTime.Year,TStartTime.Month,TStartTime.Day,TStartTime.Hour,TStartTime.Minute,TStartTime.Second);
	local nShiFouEnd = API_DiffDatatime(TEndTime.Year,TEndTime.Month,TEndTime.Day,TEndTime.Hour,TEndTime.Minute,TEndTime.Second);
	
	--检查BOSS是否存在，存在就删掉重新创建
	local MapID = API_GetRightMapID(MapConfigID)
	if API_MapIsValid(MapID) then
		if SOFIE_BossKLSTask ~= nil then
			if API_GetMonsterID(SOFIE_BossKLSTask) > 0 then
				API_DestroyMonster(SOFIE_BossKLSTask)
			end
		end
		if SOFIE_BossKLSJYTask ~= nil then
			if API_GetMonsterID(SOFIE_BossKLSJYTask) > 0 then
				API_DestroyMonster(SOFIE_BossKLSJYTask)
			end
		end
		if nShiFouStart <= 0 and nShiFouEnd > 0 then--活动时间内
			local FastID = API_CreateMonster(MapID, 850031, 326, 391, 4, 0, -1)
			--API_Trace('创建成功')
			--API_ActorBroadcastMsg(MapID, 17,'雪岭巨兽卡罗斯吼到：你们这些脆弱的人类，我要把你们全部撕碎！哈哈哈，变异熊兽我来了。')
			if API_GetServerID() == 1 then
				API_ActorBroadcastMsgEx(-1, -1, 0, 1, '雪岭巨兽卡罗斯吼到：你们这些脆弱的人类，我要把你们全部撕碎！哈哈哈，变异熊兽我来了。')
				API_ActorBroadcastMsgEx(-1, -1, 0, 7, '雪岭巨兽卡罗斯吼到：你们这些脆弱的人类，我要把你们全部撕碎！哈哈哈，变异熊兽我来了。')
				API_ActorBroadcastMsgEx(-1, -1, 0, 17, '雪岭巨兽卡罗斯吼到：你们这些脆弱的人类，我要把你们全部撕碎！哈哈哈，变异熊兽我来了。')
			end
			SOFIE_BossKLSTask = FastID      
		        API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'Boss_Task_DeadTrgCallback')
		       --刷精英怪物
	        	local x = 326
			local y = 391
			local x1,y1,Num = 0,0,0
			for x1=x-7,x+7 do
				 for y1=y-7,y+7 do
					   if not API_IsBlockTile(MapID,x1,y1,0) then
						 local FastID = API_CreateMonster(MapID, 850063, x1, y1, 4, 0, -1)
						 --API_Trace('x1'..x1)
						 SOFIE_BossKLSJYTask = FastID 
						 API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'Boss_Task_DeadTrgCallback')
						-- API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'BossWUYIXiaoGuai_Task_DeadTrgCallback')
						 x=x1
						 y=y1
						 
						 return FastID,x1,y1
					   end
				 end
			end
			--[[repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 300
			if not API_IsBlockTile(MapID,x,y,0) then
				local FastID = API_CreateMonster(MapID, PBearID, x, y, 4, 0, -1)
				API_CreateDieTriggerG(BossFastID, BossID, 0, FastID, 'YXD_WorldKingBoss_KaLuoSi_PBearDieFunc')
				YXD_WorldKingBoss_KaLuoSi[MapConfigID].PBearNum = 1
				table.insert(YXD_WorldKingBoss_KaLuoSiBXS[MapID],FastID)
			end]]--
				
		        
		end
     end

end

--刷空间领主
function Boss_Task_SofieKJLZCreat(MapConfigID,b)
	
	local TStartTime = {Year = 2012,Month = 4,Day = 27,Hour = 0,Minute = 0,Second = 0} ;--开始时间
	local TEndTime = {Year = 2012,Month = 5,Day = 6,Hour = 23,Minute = 59,Second = 59}  ;--停止时间
	local nShiFouStart = API_DiffDatatime(TStartTime.Year,TStartTime.Month,TStartTime.Day,TStartTime.Hour,TStartTime.Minute,TStartTime.Second);
	local nShiFouEnd = API_DiffDatatime(TEndTime.Year,TEndTime.Month,TEndTime.Day,TEndTime.Hour,TEndTime.Minute,TEndTime.Second);
	
	--检查BOSS是否存在，存在就删掉重新创建
	local MapID = API_GetRightMapID(MapConfigID)
	if API_MapIsValid(MapID) then
		if SOFIE_BossKJLZTask ~= nil then
			if API_GetMonsterID(SOFIE_BossKJLZTask) > 0 then
				API_DestroyMonster(SOFIE_BossKJLZTask)
			end
		end
		if nShiFouStart <= 0 and nShiFouEnd > 0 then--活动时间内
			local FastID = API_CreateMonster(MapID, 850029, 349, 416, 4, 0, -1)
			if API_GetServerID() == 1 then
				API_ActorBroadcastMsgEx(-1, -1, 0, 1, '空间主宰曼德拉：时光之门扭开成功，卡罗斯去见你兄弟变异熊兽吧。')
				API_ActorBroadcastMsgEx(-1, -1, 0, 7, '空间主宰曼德拉：时光之门扭开成功，卡罗斯去见你兄弟变异熊兽吧。')
				API_ActorBroadcastMsgEx(-1, -1, 0, 17, '空间主宰曼德拉：时光之门扭开成功，卡罗斯去见你兄弟变异熊兽吧。')
			end
			--API_ActorBroadcastMsg(MapID, 17,'空间主宰曼德拉：时光之门扭开成功，卡罗斯去汇你兄弟变异熊兽吧。')
			--17，1，7这三个位置都广播，就是窗口中间偏上的位置，世界频道系统广播，系统频道系统广播
			--API_ActorBroadcastMsgEx(-1, -1, 0, 1, '空间主宰曼德拉：时光之门扭开成功，卡罗斯去汇你兄弟变异熊兽吧。')
			--API_Trace('创建成功')
			SOFIE_BossKJLZTask = FastID      
		    API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'Boss_Task_DeadTrgCallback')
		end
     end

end

-----------------------------------------------------------------------------------------------------------------
function YXD_WorldKingBoss_CreatKaLuoSi(a,b)
	for j in YXD_WorldKingBoss_KaLuoSi do
		local MapID = j
		local RightMapID = API_GetRightMapID(MapID)
		if YXD_WorldKingBoss_KaLuoSiXS[RightMapID] == nil then
			YXD_WorldKingBoss_KaLuoSiXS[RightMapID] = {}
		end
		if YXD_WorldKingBoss_KaLuoSiBXS[RightMapID] == nil then
			YXD_WorldKingBoss_KaLuoSiBXS[RightMapID] = {}
		end
		local BossID = YXD_WorldKingBoss_KaLuoSi[j].BossID
		local BossFastID = YXD_WorldKingBoss_KaLuoSi[j].BossFastID
		local BossTile = YXD_WorldKingBoss_KaLuoSi[j].BossTile
		local SBearNum = YXD_WorldKingBoss_KaLuoSi[j].SBearNum
		local x = BossTile[1]
		local y = BossTile[2]
		if API_GetMonsterID(BossFastID) <= 0 then
			BossFastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
			--保存5.1处理
			--SOFIE_BossKLSTask = BossFastID
				API_CreateDieTriggerG(0, 0, 0, BossFastID, 'YXD_WorldKingBoss_KaLuoSi_DieFunc')
				API_CreateTimerTriggerG(RightMapID,j,60,-1,'YXD_WorldKingBoss_KaLuoSiPD')
				API_ActorBroadcastMsgEx(-1, -1, 0, 1, '雪岭巨兽卡罗斯吼到：你们这些脆弱的人类，我要把你们全部撕碎！哈哈哈，变异熊兽我来了。')
				API_ActorBroadcastMsgEx(-1, -1, 0, 7, '雪岭巨兽卡罗斯吼到：你们这些脆弱的人类，我要把你们全部撕碎！哈哈哈，变异熊兽我来了。')
				API_ActorBroadcastMsgEx(-1, -1, 0, 17, '雪岭巨兽卡罗斯吼到：你们这些脆弱的人类，我要把你们全部撕碎！哈哈哈，变异熊兽我来了。')
			--YXD_WorldKingBoss_KaLuoSiTimeHD = YXD_WorldKingBoss_KaLuoSiTimeHD or API_CreateTimerTriggerG(BossFastID,BossID,60,-1,'YXD_WorldKingBoss_KaLuoSiTimeFunc')
			for i = 1,SBearNum do
				local FastID = YXD_WorldKingBoss_KaLuoSiXS[RightMapID][i]
				if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
					API_DestroyMonster(FastID)
					YXD_WorldKingBoss_KaLuoSiXS[RightMapID][i] = nil
				end
			end
			for p in YXD_WorldKingBoss_KaLuoSiBXS[RightMapID] do
				local FastID = YXD_WorldKingBoss_KaLuoSiBXS[RightMapID][p]
				if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
					API_DestroyMonster(FastID)
					YXD_WorldKingBoss_KaLuoSiBXS[RightMapID][p] = nil
				end
			end
		end
	end
end

function YXD_WorldKingBoss_KaLuoSiPD(MapID,MapConfigID)
	local TriggerID = API_GetCurTriggerID()
	local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
	local PlayNum = 0
	if PlayList ~= nil then
		PlayNum = table.getn(PlayList)
	end
	if PlayNum > 0 then
		API_DestroyTriggerG(TriggerID)
		API_CreateTimerTriggerG(MapID,MapConfigID,60,-1,'YXD_WorldKingBoss_KaLuoSiTimeFunc')
	end
end

function YXD_WorldKingBoss_KaLuoSiTimeFunc(MapID,MapConfigID)
	local TriggerID = API_GetCurTriggerID()
	local Tab = YXD_WorldKingBoss_KaLuoSi[MapConfigID]
	local BossFastID = Tab.BossFastID
	local BossID = Tab.BossID
	if API_GetMonsterID(BossFastID) == BossID then
		local SBearID = Tab.SBearID
		local SBearNum = Tab.SBearNum
		local PBearID = Tab.PBearID
		local PBearNum = Tab.PBearNum
		local BearBabyID = Tab.BearBabyID
		local BearBabyNum = Tab.BearBabyNum
		local XYTile = Tab.XYTile
		local x1 = XYTile[1]
		local y1 = XYTile[2]
		local x2 = XYTile[3]
		local y2 = XYTile[4]
		local PD = 0
		if PBearNum == 0 then
			PD = 1
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 300
			if not API_IsBlockTile(MapID,x,y,0) then
				local FastID = API_CreateMonster(MapID, PBearID, x, y, 4, 0, -1)
				API_CreateDieTriggerG(BossFastID, BossID, 0, FastID, 'YXD_WorldKingBoss_KaLuoSi_PBearDieFunc')
				YXD_WorldKingBoss_KaLuoSi[MapConfigID].PBearNum = 1
				table.insert(YXD_WorldKingBoss_KaLuoSiBXS[MapID],FastID)
			end
		end
		if BearBabyNum < 3 then
			if PD == 1 then
				PD = 3
			else
				PD = 2
			end
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 300
			if not API_IsBlockTile(MapID,x,y,0) then
				local FastID = API_CreateMonster(MapID, BearBabyID, x, y, 4, 0, -1)
				API_CreateDieTriggerG(BossFastID, BossID, 0, FastID, 'YXD_WorldKingBoss_KaLuoSi_BearBabyDieFunc')
				BearBabyNum = BearBabyNum + 1
				YXD_WorldKingBoss_KaLuoSi[MapConfigID].BearBabyNum = BearBabyNum
				table.insert(YXD_WorldKingBoss_KaLuoSiBXS[MapID],FastID)
			end
		end
		if PD == 1 then
			API_ActorBroadcastMsg(MapConfigID, 17,'卡罗斯大叫到：我的仆从们，干掉这些卑微的人类（卡罗斯的力量源泉已经出现）')
			API_ActorBroadcastMsg(MapConfigID, 1,'卡罗斯大叫到：我的仆从们，干掉这些卑微的人类（卡罗斯的力量源泉已经出现）')
		elseif PD == 2 then
			API_ActorBroadcastMsg(MapConfigID, 17,'卡罗斯大叫到：我的仆从们，干掉这些卑微的人类（卡罗斯熊宝宝已经出现）')
			API_ActorBroadcastMsg(MapConfigID, 1,'卡罗斯大叫到：我的仆从们，干掉这些卑微的人类（卡罗斯熊宝宝已经出现）')
		elseif PD == 3 then
			API_ActorBroadcastMsg(MapConfigID, 17,'卡罗斯大叫到：我的仆从们，干掉这些卑微的人类（卡罗斯的力量源泉与卡罗斯熊宝宝已经出现）')
			API_ActorBroadcastMsg(MapConfigID, 1,'卡罗斯大叫到：我的仆从们，干掉这些卑微的人类（卡罗斯的力量源泉与卡罗斯熊宝宝已经出现）')
		end
		--刷普通熊怪
		for i = 1,SBearNum do
			if YXD_WorldKingBoss_KaLuoSiXS[MapID][i] == nil then
				local x,y,Num = 0,0,0
				repeat
					Num = Num + 1
					x = math.random(x1,x2)
					y = math.random(y1,y2)
				until not API_IsBlockTile(MapID,x,y,0) or Num == 300
				if not API_IsBlockTile(MapID,x,y,0) then
					local FastID = API_CreateMonster(MapID, SBearID, x, y, 4, 0, -1)
					YXD_WorldKingBoss_KaLuoSiXS[MapID][i] = FastID
				end
			else
				local FastID = YXD_WorldKingBoss_KaLuoSiXS[MapID][i]
				if API_GetMonsterID(FastID) <= 0 then
					local x,y,Num = 0,0,0
					repeat
						Num = Num + 1
						x = math.random(x1,x2)
						y = math.random(y1,y2)
					until not API_IsBlockTile(MapID,x,y,0) or Num == 300
					if not API_IsBlockTile(MapID,x,y,0) then
						local FastID = API_CreateMonster(MapID, SBearID, x, y, 4, 0, -1)
						YXD_WorldKingBoss_KaLuoSiXS[MapID][i] = FastID
					end
				end
			end
		end
	else
		API_DestroyTriggerG(TriggerID)
	end
end

function YXD_WorldKingBoss_KaLuoSi_DieFunc(a,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	local MapConfigID = API_GetMapConfigID(MapID) 
	YXD_WorldKingBoss_KaLuoSi[MapConfigID].PBearNum = 0
	YXD_WorldKingBoss_KaLuoSi[MapConfigID].BearBabyNum = 0
	--卡洛斯死亡，世界吼，物品掉落
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	--API_ActorBroadcastMsgEx(-1, -1, 0, 17, 'XX带领的队伍，通过层层考验，终于杀死了XXBOSS领主，获得了XX物品。')
end

function YXD_WorldKingBoss_KaLuoSi_PBearDieFunc(BossFastID,BossID,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY)
	if API_GetMonsterID(BossFastID) == BossID then
		local MapConfigID = API_GetMapConfigID(MapID) 
		API_MonsterAddStatus(BossFastID, 823004, 0)
		API_ActorBroadcastMsg(MapID, 17,'卡罗斯的力量源泉被击杀，卡罗斯自身的力量暂时受到了控制，自身攻击减少，持续40秒。')
		API_ActorBroadcastMsg(MapID, 1,'卡罗斯的力量源泉被击杀，卡罗斯自身的力量暂时受到了控制，自身攻击减少，持续40秒。')
		YXD_WorldKingBoss_KaLuoSi[MapConfigID].PBearNum = 0
	end
end

function YXD_WorldKingBoss_KaLuoSi_BearBabyDieFunc(BossFastID,BossID,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY)
	if API_GetMonsterID(BossFastID) == BossID then
		local MapConfigID = API_GetMapConfigID(MapID) 
		if API_MonsterFindStatus(BossFastID, 823) then
			API_MonsterRemoveStatus(BossFastID, 823004)
			API_ActorBroadcastMsg(MapID, 17,'你们竟然敢伤害我的孩子，我一定要为他报仇！（卡罗斯熊宝宝被击杀，卡罗斯的力量恢复了！）')
			API_ActorBroadcastMsg(MapID, 1,'你们竟然敢伤害我的孩子，我一定要为他报仇！（卡罗斯熊宝宝被击杀，卡罗斯的力量恢复了！）')
		end
		YXD_WorldKingBoss_KaLuoSi[MapConfigID].BearBabyNum = YXD_WorldKingBoss_KaLuoSi[MapConfigID].BearBabyNum - 1
	end
end

function YXD_WorldKingBoss_CreatBoss(MapConfigID,b)
	if YXD_WorldKingBossTab[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = YXD_WorldKingBossTab[MapConfigID]
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local BossFastID = Table.BossFastID
			if API_GetMonsterID(BossFastID) <= 0 then
				local Tile = Table.Tile
				local x = Tile[1]
				local y = Tile[2]
				local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
				--保存SOFIE_BossKJLZTask = FastID
				Table.BossFastID = FastID
				API_ActorBroadcastMsgEx(-1, -1, 0, 1, '空间主宰曼德拉：时光之门扭开成功，卡罗斯去见你兄弟变异熊兽吧。')
				API_ActorBroadcastMsgEx(-1, -1, 0, 7, '空间主宰曼德拉：时光之门扭开成功，卡罗斯去见你兄弟变异熊兽吧。')
				API_ActorBroadcastMsgEx(-1, -1, 0, 17, '空间主宰曼德拉：时光之门扭开成功，卡罗斯去见你兄弟变异熊兽吧。')
				API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'YXD_WorldKingBoss_DieFunc')
			end
		end
	end
end

function YXD_WorldKingBoss_NianShouCreatBoss(MapConfigID,b)
	if YXD_WorldKingBoss_NianShouWang[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = YXD_WorldKingBoss_NianShouWang[MapConfigID]
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local BossFastID = Table.BossFastID
			if API_GetMonsterID(BossFastID) <= 0 then
				local Tile = Table.Tile
				local x = Tile[1]
				local y = Tile[2]
				local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
				--保存SOFIE_BossKJLZTask = FastID
				Table.BossFastID = FastID
				API_ActorBroadcastMsgEx(-1, -1, 0, 1, '年兽王在月幕吼到：妈的智障。。。。')
				API_ActorBroadcastMsgEx(-1, -1, 0, 7, '年兽王在月幕吼到：妈的智障。。。。')
				API_ActorBroadcastMsgEx(-1, -1, 0, 17, '年兽王在月幕吼到：妈的智障。。。。')
				API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'YXD_WorldKingBoss_DieFunc')
			end
		end
	end
end

function YXD_WorldKingBoss_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	--BOSS领主死了、全服公告，物品掉落
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	--API_ActorBroadcastMsg(-1, 17,'啊，我死了！啊，我会回来的！！')
end
