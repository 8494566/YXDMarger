--假设玩家现在所在的网吧IP为 172.16.21.15 网吧对应的KEY值为 205 网吧名为 飞扬网吧
-- API_GetNetRoomKeyByActorID(ActorID)	   -- 获取上线的网吧相关的一个KEY值
-- API_GetNetRoomNameByActorID(ActorID)    -- 获取玩家上线的网吧名称	

--19号前写完

--1:网吧称号每天附带两小时双倍经验,
--2、如果玩家装备网吧称号的时候，已经有双倍经验卡效果了，那么网吧称号双倍效果暂时不发生效果，玩家停止双倍经验卡或者双倍经验卡到期后，网吧双倍效果自动开始计时
--3、如果玩家先装备网吧双倍，则不允许使用双倍经验卡，玩家卸载网吧称号或者网吧双倍过期后才能用双倍经验卡
--程序老古负责
--春明的脚本 ShuangBeiJingYan.lua 在other 文件夹下

--说明:其中的 NetRoomSupportCfg.cse 文件为网吧列表，测试阶段暂时用的飞扬网吧,如营销提供新网吧名,需要在此添加
--测试的时候记得,让春明把你的服务器改成主线服务器测试.老古这个脚本目前只支持主线.

--称号操作回调 函数名 NickNameTitleWith_CallFunc  玩家ID，操作序号，称号ID
--玩家装备称号的时候	1
--玩家使用称号的时候	2
--玩家删除称号的时候	3
--玩家不使用称号的时候	4
--玩家称号到期的时候	5
--玩家更新称号		6

NetbarActivities_TodayTime = 19106 --今天可用双倍时间
NetbarActivities_DateTime = 19107 --存储双倍时间的年月日
NetbarActivities_IsOpen = 19108 --判断是否开启
NetbarActivities_OpenTime = 19109 --打开双倍的时间
--触发器ID  ShuangBeiJingYan_TimeTriggerID
--双倍状态ID  ShuangBeiJingYan_StatusID
NetbarActivities_DayTime = 7200 --每天可用双倍时间（秒）

-- 889001 志远配置的状态ID  生命+150，能量+50


NetbarType_Table = 
{
	--获取到的网吧的KEY值    模糊称号ID    称号属性数组大小    称号属性组    
	[205]     =      {NickNameID = 206,       Num = 4,      pPropIDs = {889001},},
}

-- 删除网吧称号
function NetbarActivities_Remove(ActorID)
	for key,oNetbarTable in pairs(NetbarType_Table) do
		local NickNameID = oNetbarTable.NickNameID
		if API_IsOwnedName(ActorID,NickNameID,1) == 1 then --如果有称号
			local nNetKey = API_GetNetRoomKeyByActorID(ActorID)
			--如果不再活动网吧内，就干掉称号，如果在活动网吧，暂时不管，因为后面会执行添加称号操作，会判断是否更新或新加称号，直到玩家某一天不在活动网吧玩了
			if nil==nNetKey or nNetKey<=0 then 
				API_DelPlayerNickName(ActorID,NickNameID)
			end
		end
	end
end

-- 添加网吧称号
function NetbarActivities_Add(ActorID)
	local nNetKey = API_GetNetRoomKeyByActorID(ActorID)
	if nil==nNetKey or nNetKey<=0 then
		return
	end
	if NetbarType_Table[nNetKey] == nil then
		return
	end
	if API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_IsOpen) == 1 then
		local year,month,day,hour,min,sec,wday = PublicFun_time()
		local NowDate = year * 10000 + month * 100 + day
		local LastDate = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_LastDate)
		local NowTime = os.time()
		local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)
		local ProcessTime = os.difftime(NowTime,LastTime)
		if LastDate ~= NowDate then
			TodayTime = 0
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
		end
		--获取时间触发器ID
		local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
		--关闭时间触发器
		API_DestroyTrigger(ActorID,-1,TimerTriggerID)
		--将时间触发器交互数据清0
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID,0)
		--去除双倍显示状态
		API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
		--设置开始标志
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,0)
		--总时间减去消耗时间
		local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
		ZhongTime = ZhongTime - ProcessTime - 60
		if ZhongTime < 0 then
			ZhongTime = 0
		end
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime,ZhongTime)
		--今天时间加上消耗时间
		local TodayTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TodayTime)
		TodayTime = TodayTime + ProcessTime + 60
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
		--关闭双倍
		API_SetActorExpMultiple(ActorID,0)
	end
	local oNetbarTable = NetbarType_Table[nNetKey]
	local pName = API_GetNetRoomNameByActorID(ActorID)
	local NickNameID = oNetbarTable.NickNameID			
	local pPropIDs = oNetbarTable.pPropIDs
	local nNum = table.getn(pPropIDs)
	API_SetPlayerNickName(ActorID,NickNameID,pName,1,0,1,nNum, pPropIDs)
end

--网吧活动上线处理
function NetbarActivities_OnLogin(ActorID) 
	local IsOpen = API_VarDataGetNumber(ActorID,1,NetbarActivities_IsOpen)
	if IsOpen == 1 then
		local TodayTime = API_VarDataGetNumber(ActorID,1,NetbarActivities_TodayTime)
		local year,month,day,hour,min,sec,wday = PublicFun_time()
		local NowDate = year * 10000 + month * 100 + day
		local LastDate = API_VarDataGetNumber(ActorID,1,NetbarActivities_DateTime)
		if NowDate ~= LastDate then
			TodayTime = NetbarActivities_DayTime
			API_VarDataSetNumber(ActorID,1,NetbarActivities_TodayTime,TodayTime)
			API_VarDataSetNumber(ActorID,1,NetbarActivities_DateTime,NowDate)
		end
		local TodayShenYu = TodayTime
		if TodayShenYu < 0 then
			TodayShenYu = 0
		end
		--创时间触发器（剩余多少秒之后回调一次）
		local TimerTriggerID = API_CreateTimerTrigger(ActorID,TodayShenYu,1,-1,'NetbarActivities_TodayEnd')
		--将时间触发器ID存交互数据（共用了春明的交互）
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID,TimerTriggerID)
		--加双倍显示状态
		local TodayShenYuS = TodayShenYu * 1000
		API_ActorAddStatus(ActorID,ShuangBeiJingYan_StatusID,TodayShenYuS)
		--设置开始标志
		API_VarDataSetNumber(ActorID,1,NetbarActivities_IsOpen,1)
		--存开始时间
		local NowTime = os.time()
		API_VarDataSetNumber(ActorID,1,NetbarActivities_OpenTime,NowTime)
		--开始双倍
		API_SetActorExpMultiple(ActorID,2)
	else
		API_SetActorExpMultiple(ActorID,0)
	end
end


--网吧活动下线处理
function NetbarActivities_OnLogout(ActorID) 
	local IsOpen = API_VarDataGetNumber(ActorID,1,NetbarActivities_IsOpen)
	if IsOpen == 1 then
		local TodayTime = API_VarDataGetNumber(ActorID,1,NetbarActivities_TodayTime)
		local year,month,day,hour,min,sec,wday = PublicFun_time()
		local NowDate = year * 10000 + month * 100 + day
		local LastDate = API_VarDataGetNumber(ActorID,1,NetbarActivities_DateTime)
		if NowDate ~= LastDate then
			TodayTime = NetbarActivities_DayTime
			API_VarDataSetNumber(ActorID,1,NetbarActivities_TodayTime,TodayTime)
			API_VarDataSetNumber(ActorID,1,NetbarActivities_DateTime,NowDate)
		end
		--获取时间触发器ID
		local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
		--关闭时间触发器
		API_DestroyTrigger(ActorID,-1,TimerTriggerID)
		--计算用了多少时间
		local NowTime = os.time()
		local OpenTime = API_VarDataGetNumber(ActorID,1,NetbarActivities_OpenTime)
		local ProcessTime = os.difftime(NowTime,OpenTime)
		TodayTime = TodayTime - ProcessTime
		if TodayTime < 0 then
			TodayTime = 0
			API_VarDataSetNumber(ActorID,1,NetbarActivities_IsOpen,0)
		end
		API_VarDataSetNumber(ActorID,1,NetbarActivities_TodayTime,TodayTime)
		API_DestroyTrigger(ActorID,-1,TimerTriggerID)
		--去除双倍显示状态
		API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
		--关闭双倍
		API_SetActorExpMultiple(ActorID,0)
	else
		API_SetActorExpMultiple(ActorID,0)
	end
	local Time = os.time() 
	local EndTime = os.date("*t", os.time()) 
	EndTime.year = 2010
	EndTime.month = 2
	EndTime.day = 26
	EndTime.hour = 24
	EndTime.min = 0 
	EndTime.sec = 0 
	local EndTime2 = os.time(EndTime) 
	if  Time > EndTime2 then
		for key,oNetbarTable in pairs(NetbarType_Table) do
			local chenghaoID = oNetbarTable.NickNameID
			if API_IsOwnedName(ActorID,chenghaoID,1) == 1 then
				API_DelPlayerNickName(ActorID,chenghaoID)
			end
		end	
	end
end

--需要程序小朱提供的函数回调：
--玩家装备称号的时候，程序给一个回调函数 函数名 NickNameTitleUse_CallFunc
--玩家使用称号时，以及 不使用，删除，称号到期时 ，均给回调

--对称号做操作时回调函数
-- Type：操作序号 
-- 1 是装备称号
-- 2 是不使用称号（删除称号也会回调这个）
-- 3 是上线和切换地图时调用
function OnNickNameSysCall(Type,ActorID,NickNameID)
	local Time = os.time() 
	local JustTime = os.date("*t", os.time()) 
	JustTime.year = 2010
	JustTime.month = 1
	JustTime.day = 26
	JustTime.hour = 0 
	JustTime.min = 0 
	JustTime.sec = 0 
	local StartTime = os.time(JustTime) 
	local EndTime = os.date("*t", os.time()) 
	EndTime.year = 2010
	EndTime.month = 2
	EndTime.day = 26
	EndTime.hour = 24
	EndTime.min = 0 
	EndTime.sec = 0 
	local EndTime2 = os.time(EndTime) 
	if Type == 1 then
		if NickNameID == 206 then
			if Time >= StartTime and Time < EndTime2 then
				API_ActorAddStatus(ActorID,889001,0)
				if API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_IsOpen) == 1 then
					local year,month,day,hour,min,sec,wday = PublicFun_time()
					local NowDate = year * 10000 + month * 100 + day
					local LastDate = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_LastDate)
					local NowTime = os.time()
					local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)
					local ProcessTime = os.difftime(NowTime,LastTime)
					if LastDate ~= NowDate then
						TodayTime = 0
						API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
						API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
					end
					--获取时间触发器ID
					local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
					--关闭时间触发器
					API_DestroyTrigger(ActorID,-1,TimerTriggerID)
					--将时间触发器交互数据清0
					API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID,0)
					--去除双倍显示状态
					API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
					--设置开始标志
					API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,0)
					--总时间减去消耗时间
					local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
					ZhongTime = ZhongTime - ProcessTime - 60
					if ZhongTime < 0 then
						ZhongTime = 0
					end
					API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime,ZhongTime)
					--今天时间加上消耗时间
					local TodayTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TodayTime)
					TodayTime = TodayTime + ProcessTime + 60
					API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
					API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
					--关闭双倍
					API_SetActorExpMultiple(ActorID,0)
				end
				local TodayTime = API_VarDataGetNumber(ActorID,1,NetbarActivities_TodayTime)
				local year,month,day,hour,min,sec,wday = PublicFun_time()
				local NowDate = year * 10000 + month * 100 + day
				local LastDate = API_VarDataGetNumber(ActorID,1,NetbarActivities_DateTime)
				if NowDate ~= LastDate then
					TodayTime = NetbarActivities_DayTime
					API_VarDataSetNumber(ActorID,1,NetbarActivities_TodayTime,TodayTime)
					API_VarDataSetNumber(ActorID,1,NetbarActivities_DateTime,NowDate)
				end
				local TodayShenYu = TodayTime
				if TodayShenYu < 0 then
					TodayShenYu = 0
				end
				--创时间触发器（剩余多少秒之后回调一次）
				local TimerTriggerID = API_CreateTimerTrigger(ActorID,TodayShenYu,1,-1,'NetbarActivities_TodayEnd')
				--将时间触发器ID存交互数据（共用了春明的交互）
				API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID,TimerTriggerID)
				--加双倍显示状态
				local TodayShenYuS = TodayShenYu * 1000
				API_ActorAddStatus(ActorID,ShuangBeiJingYan_StatusID,TodayShenYuS)
				--设置开始标志
				API_VarDataSetNumber(ActorID,1,NetbarActivities_IsOpen,1)
				--存开始时间
				local NowTime = os.time()
				API_VarDataSetNumber(ActorID,1,NetbarActivities_OpenTime,NowTime)
				--开始双倍
				API_SetActorExpMultiple(ActorID,2)
			end
		end
	elseif Type == 2 then
		if NickNameID == 206 then
			local IsOpen = API_VarDataGetNumber(ActorID,1,NetbarActivities_IsOpen)
			if IsOpen == 1 then
				local TodayTime = API_VarDataGetNumber(ActorID,1,NetbarActivities_TodayTime)
				local year,month,day,hour,min,sec,wday = PublicFun_time()
				local NowDate = year * 10000 + month * 100 + day
				local LastDate = API_VarDataGetNumber(ActorID,1,NetbarActivities_DateTime)
				if NowDate ~= LastDate then
					TodayTime = NetbarActivities_DayTime
					API_VarDataSetNumber(ActorID,1,NetbarActivities_TodayTime,TodayTime)
					API_VarDataSetNumber(ActorID,1,NetbarActivities_DateTime,NowDate)
				end
				--获取时间触发器ID
				local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
				--关闭时间触发器
				API_DestroyTrigger(ActorID,-1,TimerTriggerID)
				--将时间触发器交互数据清0
				API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID,0)
				--计算用了多少时间
				local NowTime = os.time()
				local OpenTime = API_VarDataGetNumber(ActorID,1,NetbarActivities_OpenTime)
				local ProcessTime = os.difftime(NowTime,OpenTime)
				TodayTime = TodayTime - ProcessTime
				if TodayTime < 0 then
					TodayTime = 0
				end
				API_VarDataSetNumber(ActorID,1,NetbarActivities_TodayTime,TodayTime)
				--去除双倍显示状态
				API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
				API_VarDataSetNumber(ActorID,1,NetbarActivities_IsOpen,0)
				--关闭双倍
				API_SetActorExpMultiple(ActorID,0)
			end
		end
	elseif Type == 3 then
		if Time >= StartTime and Time < EndTime2 then
			local nNetKey = API_GetNetRoomKeyByActorID(ActorID)
			if nil==nNetKey or nNetKey<=0 then
				for key,oNetbarTable in pairs(NetbarType_Table) do
					local NickNameID = oNetbarTable.NickNameID
					if API_IsOwnedName(ActorID,NickNameID,1) == 1 then --如果有称号
						API_DelPlayerNickName(ActorID,NickNameID)
					end
				end
				return
			end
			if NetbarType_Table[nNetKey] == nil then
				return
			end
			if API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_IsOpen) == 1 then
				local year,month,day,hour,min,sec,wday = PublicFun_time()
				local NowDate = year * 10000 + month * 100 + day
				local LastDate = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_LastDate)
				local NowTime = os.time()
				local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)
				local ProcessTime = os.difftime(NowTime,LastTime)
				if LastDate ~= NowDate then
					TodayTime = 0
					API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
					API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
				end
				--获取时间触发器ID
				local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
				--关闭时间触发器
				API_DestroyTrigger(ActorID,-1,TimerTriggerID)
				--将时间触发器交互数据清0
				API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID,0)
				--去除双倍显示状态
				API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
				--设置开始标志
				API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,0)
				--总时间减去消耗时间
				local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
				ZhongTime = ZhongTime - ProcessTime - 60
				if ZhongTime < 0 then
					ZhongTime = 0
				end
				API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime,ZhongTime)
				--今天时间加上消耗时间
				local TodayTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TodayTime)
				TodayTime = TodayTime + ProcessTime + 60
				API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
				API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
				--关闭双倍
				API_SetActorExpMultiple(ActorID,0)
			end
			local oNetbarTable = NetbarType_Table[nNetKey]
			local pName = API_GetNetRoomNameByActorID(ActorID)
			local NickNameID = oNetbarTable.NickNameID			
			local pPropIDs = oNetbarTable.pPropIDs
			local nNum = table.getn(pPropIDs)
			API_SetPlayerNickName(ActorID,NickNameID,pName,1,0,1,nNum, pPropIDs)
		end
	elseif Type == 4 then
		if NickNameID == 206 then
			local IsOpen = API_VarDataGetNumber(ActorID,1,NetbarActivities_IsOpen)
			if IsOpen == 1 then
				local TodayTime = API_VarDataGetNumber(ActorID,1,NetbarActivities_TodayTime)
				local year,month,day,hour,min,sec,wday = PublicFun_time()
				local NowDate = year * 10000 + month * 100 + day
				local LastDate = API_VarDataGetNumber(ActorID,1,NetbarActivities_DateTime)
				if NowDate ~= LastDate then
					TodayTime = NetbarActivities_DayTime
					API_VarDataSetNumber(ActorID,1,NetbarActivities_TodayTime,TodayTime)
					API_VarDataSetNumber(ActorID,1,NetbarActivities_DateTime,NowDate)
				end
				--获取时间触发器ID
				local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
				--关闭时间触发器
				API_DestroyTrigger(ActorID,-1,TimerTriggerID)
				--将时间触发器交互数据清0
				API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID,0)
				--计算用了多少时间
				local NowTime = os.time()
				local OpenTime = API_VarDataGetNumber(ActorID,1,NetbarActivities_OpenTime)
				local ProcessTime = os.difftime(NowTime,OpenTime)
				TodayTime = TodayTime - ProcessTime
				if TodayTime < 0 then
					TodayTime = 0
				end
				API_VarDataSetNumber(ActorID,1,NetbarActivities_TodayTime,TodayTime)
				--去除双倍显示状态
				API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
				API_VarDataSetNumber(ActorID,1,NetbarActivities_IsOpen,0)
				--关闭双倍
				API_SetActorExpMultiple(ActorID,0)
			end
		end
		API_DelPlayerNickName(ActorID,NickNameID)
	end
	if  Time > EndTime2 then
		for key,oNetbarTable in pairs(NetbarType_Table) do
			local chenghaoID = oNetbarTable.NickNameID
			if API_IsOwnedName(ActorID,chenghaoID,1) == 1 then
				API_DelPlayerNickName(ActorID,chenghaoID)
			end
		end	
	end
end

function NetbarActivities_Yesterday(ActorID)
	local Time = os.time() 
	local JustTime = os.date("*t", os.time()) 
	JustTime.year = 2010
	JustTime.month = 1
	JustTime.day = 26
	JustTime.hour = 0 
	JustTime.min = 0 
	JustTime.sec = 0 
	local StartTime = os.time(JustTime) 
	local EndTime = os.date("*t", os.time()) 
	EndTime.year = 2010
	EndTime.month = 2
	EndTime.day = 26
	EndTime.hour = 24
	EndTime.min = 0 
	EndTime.sec = 0 
	local EndTime2 = os.time(EndTime)
	if Time >= StartTime and Time < EndTime2 then
		local nNetKey = API_GetNetRoomKeyByActorID(ActorID)
		if nil==nNetKey or nNetKey<=0 then
			for key,oNetbarTable in pairs(NetbarType_Table) do
				local NickNameID = oNetbarTable.NickNameID
				if API_IsOwnedName(ActorID,NickNameID,1) == 1 then --如果有称号
					API_DelPlayerNickName(ActorID,NickNameID)
				end
			end
			return
		end
		if NetbarType_Table[nNetKey] == nil then
			return
		end
		local IsOpen = API_VarDataGetNumber(ActorID,1,NetbarActivities_IsOpen)
		if IsOpen == 1 then
			OnNickNameSysCall(1,ActorID,206)
		else
			local year,month,day,hour,min,sec,wday = PublicFun_time()
			local NowDate = year * 10000 + month * 100 + day
			local TodayTime = NetbarActivities_DayTime
			API_VarDataSetNumber(ActorID,1,NetbarActivities_TodayTime,TodayTime)
			API_VarDataSetNumber(ActorID,1,NetbarActivities_DateTime,NowDate)
		end
	end
end

function NetbarActivities_TodayEnd(ActorID,TaskID)
	local IsOpen = API_VarDataGetNumber(ActorID,1,NetbarActivities_IsOpen)
	if IsOpen == 1 then
		local TodayTime = API_VarDataGetNumber(ActorID,1,NetbarActivities_TodayTime)
		local year,month,day,hour,min,sec,wday = PublicFun_time()
		local NowDate = year * 10000 + month * 100 + day
		local LastDate = API_VarDataGetNumber(ActorID,1,NetbarActivities_DateTime)
		if NowDate ~= LastDate then
			TodayTime = NetbarActivities_DayTime
			API_VarDataSetNumber(ActorID,1,NetbarActivities_TodayTime,TodayTime)
			API_VarDataSetNumber(ActorID,1,NetbarActivities_DateTime,NowDate)
		end
		--获取时间触发器ID
		local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
		--关闭时间触发器
		API_DestroyTrigger(ActorID,-1,TimerTriggerID)
		--计算用了多少时间
		local NowTime = os.time()
		local OpenTime = API_VarDataGetNumber(ActorID,1,NetbarActivities_OpenTime)
		local ProcessTime = os.difftime(NowTime,OpenTime)
		TodayTime = TodayTime - ProcessTime
		if TodayTime < 0 then
			TodayTime = 0
		end
		API_VarDataSetNumber(ActorID,1,NetbarActivities_TodayTime,TodayTime)
		--去除双倍显示状态
		API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
		--设置开始标志
		API_VarDataSetNumber(ActorID,1,NetbarActivities_IsOpen,0)
		--关闭双倍
		API_SetActorExpMultiple(ActorID,0)
	else
		API_SetActorExpMultiple(ActorID,0)
	end
end
