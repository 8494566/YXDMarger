----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\ShuangBeiJingYan.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2009-6-7
--版  本:	1.0
--描  述:	双倍经验
--应  用:  

----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2009-6-7
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------

ShuangBeiJingYan_TodayTime = 18398
ShuangBeiJingYan_ZhongTime = 18397
ShuangBeiJingYan_IsOpen = 18400
ShuangBeiJingYan_LastDate = 18399
ShuangBeiJingYan_TimeTriggerID = 18401
ShuangBeiJingYan_OpenTime = 18402

ShuangBeiJingYan_ChuShiShiJian = 18000
ShuangBeiJingYan_DayTime = 7200
ShuangBeiJingYan_QQDayTime = 10800
ShuangBeiJingYan_NeedLV = 21
ShuangBeiJingYan_QQNeedLV = 1

ShuangBeiJingYan_StatusID = 740001
ShuangBeiJingYan_JiaGe = 50

--双倍经验储值卡
function ShuangBeiJingYan_CZK_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if GoodsID ~= 88065 then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local DoubleExpPackageTime = API_VarDataGetNumber(ActorID,1,DoubleExpPackageCard_OsTime)
	local NowTime = os.time()
--~ 	if DoubleExpPackageTime >= NowTime then
--~ 		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
--~ 		API_ResponseWrite('<win rect="600,200,330,200"></win>') 
--~ 		API_ResponseWrite('<br><text>不能与双倍经验包时卡同时使用</text><br>')
--~ 		API_ResponseWrite('<br><a>确定</a><br>')
--~ 		API_ResponseFlush(ActorID)
--~ 		return 
--~ 	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) > 1 then
		-- 如果有多的卡，则删除其他卡，转换为5小时时间
		local ZhuanHuanKaShuLiang = API_ActorGetGoodsNum(ActorID,GoodsID) - 1
		if API_ActorRemoveGoods(ActorID,GoodsID,ZhuanHuanKaShuLiang,'转换双倍储值卡为时间') then
			API_ActorSendMsg(ActorID,10,'收取 '..ZhuanHuanKaShuLiang..'张多余的'..API_GetGoodsName(GoodsID)..'，增加 '.. ZhuanHuanKaShuLiang * 5 ..'小时双倍时间')
			local ChongZhiTimeS = ZhuanHuanKaShuLiang * 5 * 3600
			local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
			ZhongTime = ZhongTime + ChongZhiTimeS --总时间					
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime,ZhongTime)
			local IsOpen = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_IsOpen)
			if DoubleExpPackageTime < NowTime then
				if IsOpen == 1 then
					if API_ActorGetPropNum(ActorID,219) ~= 2 then
						API_SetActorExpMultiple(ActorID,100)
					end
					local NowTime = os.time()
					local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)										
					local ProcessTime = os.difftime(NowTime,LastTime)						
					ZhongTime = ZhongTime - ProcessTime
					TodayTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TodayTime)
					TodayTime = TodayTime + ProcessTime								
					if TodayTime > DayTime or ZhongTime <= 0 then
						if API_ActorGetPropNum(ActorID, 219) ~= 0 then
							API_SetActorExpMultiple(ActorID,0)
						end
						API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,0)
					end
				else	
					if API_ActorGetPropNum(ActorID,219) ~= 0 then
						API_SetActorExpMultiple(ActorID,0)
					end
				end
			end
		end
	end
	API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
	API_ResponseWrite('<win rect="600,200,330,200"></win>') 
	local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
	local TodayTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TodayTime)
	local DayTime = ShuangBeiJingYan_DayTime
	local NeedLV = ShuangBeiJingYan_NeedLV
	local IsTeQuan = 0
--	if API_ActorGetPropNum(ActorID,198) == 1 then
--		DayTime = ShuangBeiJingYan_QQDayTime
--		NeedLV = ShuangBeiJingYan_QQNeedLV
--		IsTeQuan = 1
--	end
	
	local IsOpen = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_IsOpen)
	if DoubleExpPackageTime < NowTime then
		if IsOpen == 1 then
			if API_ActorGetPropNum(ActorID,219) ~= 2 then
				API_SetActorExpMultiple(ActorID,100)
			end
			local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)
			local NowTime = os.time()
			local ProcessTime = os.difftime(NowTime,LastTime)
			ZhongTime = ZhongTime - ProcessTime
			TodayTime = TodayTime + ProcessTime
			if TodayTime > DayTime or ZhongTime <= 0 then
				if API_ActorGetPropNum(ActorID, 219) ~= 0 then
					API_SetActorExpMultiple(ActorID,0)
				end
				API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,0)
			end
		else
			if API_ActorGetPropNum(ActorID,219) ~= 0 then
				API_SetActorExpMultiple(ActorID,0)
			end
		end
	end
	if ZhongTime < 0 then
		ZhongTime = 0
	end
	local TodayShenYu = DayTime - TodayTime
	if TodayShenYu > ZhongTime then
		TodayShenYu = ZhongTime
	end
	if TodayShenYu < 0 then
		TodayShenYu = 0
	end
	local ShengYuH = math.floor(ZhongTime/3600)
	local ShengYuMS = math.mod(ZhongTime,3600)
	local ShengYuM = math.floor(ShengYuMS/60)
	local ShengYuS = math.mod(ShengYuMS,60)
	
	local TodayShengYuH = math.floor(TodayShenYu/3600)
	local TodayShengYuMS = math.mod(TodayShenYu,3600)
	local TodayShengYuM = math.floor(TodayShengYuMS/60)
	local TodayShengYuS = math.mod(TodayShengYuMS,60)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel >= NeedLV then
		API_ResponseWrite('<br><text>您的剩余双倍时间是：</text><text color="255,0,255">'..ShengYuH..'小时 '..ShengYuM..'分 '..ShengYuS..'秒</text><br>')
		API_ResponseWrite('<text>您今天还可以使用：</text><text color="255,0,255">'..TodayShengYuH..'小时 '..TodayShengYuM..'分 '..TodayShengYuS..'秒</text><br>')
		if IsTeQuan == 1 then
			API_ResponseWrite('<text color="255,0,0">QQ会员特权：</text><text>每天多一小时双倍使用时间，并且不限级别使用'..API_GetGoodsName(GoodsID)..'</text><br>')
		end
		if API_VarDataGetNumber(ActorID,1,NetbarActivities_IsOpen) == 0 then
			if IsOpen == 0 then
				API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=1">开始双倍经验</a><br>')
			elseif IsOpen == 1 then
				API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=2">停止双倍经验</a><br>')
			end
			API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=3">充值双倍时间</a><br>')
		else
			API_ResponseWrite('<br><text>不能与网吧双倍经验同时使用</text><br>')
		end
		API_ResponseFlush(ActorID)
	else
		if API_VarDataGetNumber(ActorID,1,NetbarActivities_IsOpen) == 0 then
			if DoubleExpPackageTime < NowTime then
				if API_ActorGetPropNum(ActorID,219) ~= 0 then
					API_SetActorExpMultiple(ActorID,0)
				end
			end
		end
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,0)
		API_ResponseWrite('<br><text>需要等级达到 '..NeedLV..'级 才能使用'..API_GetGoodsName(GoodsID)..'</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	return 1
end

function ShuangBeiJingYan_CZK_Title()
	local ActorID = API_RequestGetActorID()
	local GoodsID = 88065
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return
	end
	if API_VarDataGetNumber(ActorID,1,NetbarActivities_IsOpen) == 1 then
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		API_ResponseWrite('<win rect="600,200,330,200"></win>') 
		API_ResponseWrite('<br><text>不能与网吧双倍经验同时使用</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 
	end
	local DoubleExpPackageTime = API_VarDataGetNumber(ActorID,1,DoubleExpPackageCard_OsTime)
	local NowTime = os.time()
	if DoubleExpPackageTime >= NowTime then
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		API_ResponseWrite('<win rect="600,200,330,200"></win>') 
		API_ResponseWrite('<br><text>不能与双倍经验包时卡同时使用</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 
	end
	local SelectItem = API_RequestGetNumber(1)
	local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
	local TodayTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TodayTime)
	local DayTime = ShuangBeiJingYan_DayTime
	local NeedLV = ShuangBeiJingYan_NeedLV
	local IsTeQuan = 0
--	if API_ActorGetPropNum(ActorID,198) == 1 then
--		DayTime = ShuangBeiJingYan_QQDayTime
--		NeedLV = ShuangBeiJingYan_QQNeedLV
--		IsTeQuan = 1
--	end
	local year,month,day,hour,min,sec,wday = PublicFun_time()
	local NowDate = year * 10000 + month * 100 + day
	local LastDate = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_LastDate)
	local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)
	local ProcessTime = os.difftime(NowTime,LastTime)
	
	if LastDate ~= NowDate then
		TodayTime = 0
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
	end
	local IsOpen = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_IsOpen)
	if IsOpen == 1 then
		if API_ActorGetPropNum(ActorID,219) ~= 2 then
			API_SetActorExpMultiple(ActorID,100)
		end
		local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)
		local ProcessTime = os.difftime(NowTime,LastTime)
		ZhongTime = ZhongTime - ProcessTime
		TodayTime = TodayTime + ProcessTime
		if TodayTime > DayTime or ZhongTime <= 0 then
			if API_ActorGetPropNum(ActorID, 219) ~= 0 then
				API_SetActorExpMultiple(ActorID,0)
			end
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,0)
		end
	else
		if API_ActorGetPropNum(ActorID,219) ~= 0 then
			API_SetActorExpMultiple(ActorID,0)
		end
	end
	
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel >= NeedLV then
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		API_ResponseWrite('<win rect="600,200,330,200"></win>') 
		if SelectItem == 0 then
			if ZhongTime < 0 then
				ZhongTime = 0
			end
			local TodayShenYu = DayTime - TodayTime
			if TodayShenYu > ZhongTime then
				TodayShenYu = ZhongTime
			end
			if TodayShenYu < 0 then
				TodayShenYu = 0
			end
			local ShengYuH = math.floor(ZhongTime/3600)
			local ShengYuMS = math.mod(ZhongTime,3600)
			local ShengYuM = math.floor(ShengYuMS/60)
			local ShengYuS = math.mod(ShengYuMS,60)
			
			local TodayShengYuH = math.floor(TodayShenYu/3600)
			local TodayShengYuMS = math.mod(TodayShenYu,3600)
			local TodayShengYuM = math.floor(TodayShengYuMS/60)
			local TodayShengYuS = math.mod(TodayShengYuMS,60)
			API_ResponseWrite('<br><text>您的剩余双倍时间是：</text><text color="255,0,255">'..ShengYuH..'小时 '..ShengYuM..'分 '..ShengYuS..'秒</text><br>')
			API_ResponseWrite('<text>您今天还可以使用：</text><text color="255,0,255">'..TodayShengYuH..'小时 '..TodayShengYuM..'分 '..TodayShengYuS..'秒</text><br>')
			if IsTeQuan == 1 then
				API_ResponseWrite('<text color="255,0,0">QQ会员特权：</text><text>每天多一小时双倍使用时间，并且不限基本使用'..API_GetGoodsName(GoodsID)..'</text><br>')
			end
			if IsOpen == 0 then
				API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=1">开始双倍经验</a><br>')
			elseif IsOpen == 1 then
				API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=2">停止双倍经验</a><br>')
			end
			API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=3">充值双倍时间</a><br>')
		elseif SelectItem == 1 then
			if ZhongTime < 0 then
				ZhongTime = 0
			end
			local TodayShenYu = DayTime - TodayTime
			if TodayShenYu > ZhongTime then
				TodayShenYu = ZhongTime
			end
			if TodayShenYu < 0 then
				TodayShenYu = 0
			end
			local ShengYuH = math.floor(ZhongTime/3600)
			local ShengYuMS = math.mod(ZhongTime,3600)
			local ShengYuM = math.floor(ShengYuMS/60)
			local ShengYuS = math.mod(ShengYuMS,60)
			
			local TodayShengYuH = math.floor(TodayShenYu/3600)
			local TodayShengYuMS = math.mod(TodayShenYu,3600)
			local TodayShengYuM = math.floor(TodayShengYuMS/60)
			local TodayShengYuS = math.mod(TodayShengYuMS,60)
			API_ResponseWrite('<br><text>您的剩余双倍时间是：</text><text color="255,0,255">'..ShengYuH..'小时 '..ShengYuM..'分 '..ShengYuS..'秒</text><br>')
			API_ResponseWrite('<text>您今天还可以使用：</text><text color="255,0,255">'..TodayShengYuH..'小时 '..TodayShengYuM..'分 '..TodayShengYuS..'秒</text><br>')
			if IsOpen == 1 and API_ActorGetPropNum(ActorID, 219) ~= 0 then
				API_ResponseWrite('<text color="255,0,0">开启双倍经验失败：</text><text>您当前正处于双倍经验状态，不能重复开启</text><br>')
				API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=0">返回</a><br>')
			else
				if ZhongTime <= 0 then
					API_ResponseWrite('<text color="255,0,0">开启双倍经验失败：</text><text>您的双倍经验时间已经用完，请充值后再开启双倍经验</text><br>')
					API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=3">充值双倍时间</a><br>')
					API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=0">返回</a><br>')
				elseif TodayShenYu <= 0 then
					local DayH = math.floor(DayTime/3600)
					API_ResponseWrite('<text color="255,0,0">开启双倍经验失败：</text><text>您每天最多只能开启 '..DayH..'小时双倍经验，您今天不能再开启双倍经验了</text><br>')
					API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=0">返回</a><br>')
				else
					--创时间触发器
					local TimerTriggerID = API_CreateTimerTrigger(ActorID,TodayShenYu,1,-1,'ShuangBeiJingYan_TodayEnd')
					--将时间触发器ID存交互数据
					API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID,TimerTriggerID)
					--加双倍显示状态
					local TodayShenYuS = TodayShenYu * 1000
					API_ActorAddStatus(ActorID,ShuangBeiJingYan_StatusID,TodayShenYuS)
					--设置开始标志
					API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,1)
					--存开始日期
					API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
					--存开始时间
					API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_OpenTime,NowTime)
					--开始双倍
					API_SetActorExpMultiple(ActorID,100)
					API_ResponseWrite('<text color="0,255,0">开启双倍经验成功：</text><text>现在您杀怪将获得双倍经验！</text><br>')
					API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=0">返回</a><br>')
				end
			end
		elseif SelectItem == 2 then
			if IsOpen == 0 and API_ActorGetPropNum(ActorID, 219) == 0 then
				if ZhongTime < 0 then
					ZhongTime = 0
				end
				local TodayShenYu = DayTime - TodayTime
				if TodayShenYu > ZhongTime then
					TodayShenYu = ZhongTime
				end
				if TodayShenYu < 0 then
					TodayShenYu = 0
				end
				local ShengYuH = math.floor(ZhongTime/3600)
				local ShengYuMS = math.mod(ZhongTime,3600)
				local ShengYuM = math.floor(ShengYuMS/60)
				local ShengYuS = math.mod(ShengYuMS,60)
				
				local TodayShengYuH = math.floor(TodayShenYu/3600)
				local TodayShengYuMS = math.mod(TodayShenYu,3600)
				local TodayShengYuM = math.floor(TodayShengYuMS/60)
				local TodayShengYuS = math.mod(TodayShengYuMS,60)
				API_ResponseWrite('<br><text>您的剩余双倍时间是：</text><text color="255,0,255">'..ShengYuH..'小时 '..ShengYuM..'分 '..ShengYuS..'秒</text><br>')
				API_ResponseWrite('<text>您今天还可以使用：</text><text color="255,0,255">'..TodayShengYuH..'小时 '..TodayShengYuM..'分 '..TodayShengYuS..'秒</text><br>')
				API_ResponseWrite('<text color="255,0,0">关闭双倍经验失败：</text><text>您当前不处于双倍经验状态，无需关闭</text><br>')
				API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=0">返回</a><br>')
			else
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
				local TodayShenYu = DayTime - TodayTime
				if TodayShenYu > ZhongTime then
					TodayShenYu = ZhongTime
				end
				if TodayShenYu < 0 then
					TodayShenYu = 0
				end
				local ShengYuH = math.floor(ZhongTime/3600)
				local ShengYuMS = math.mod(ZhongTime,3600)
				local ShengYuM = math.floor(ShengYuMS/60)
				local ShengYuS = math.mod(ShengYuMS,60)
				
				local TodayShengYuH = math.floor(TodayShenYu/3600)
				local TodayShengYuMS = math.mod(TodayShenYu,3600)
				local TodayShengYuM = math.floor(TodayShengYuMS/60)
				local TodayShengYuS = math.mod(TodayShengYuMS,60)
				API_ResponseWrite('<br><text>您的剩余双倍时间是：</text><text color="255,0,255">'..ShengYuH..'小时 '..ShengYuM..'分 '..ShengYuS..'秒</text><br>')
				API_ResponseWrite('<text>您今天还可以使用：</text><text color="255,0,255">'..TodayShengYuH..'小时 '..TodayShengYuM..'分 '..TodayShengYuS..'秒</text><br>')
				API_ResponseWrite('<text color="0,255,0">关闭双倍经验成功：</text><text>现在您杀怪将不再获得双倍经验，您剩余的双倍时间将停止计时</text><br>')
				API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=0">返回</a><br>')
			end
		elseif SelectItem == 3 then
			if API_RequestGetNumber(2) == 0 then
				if ZhongTime < 0 then
					ZhongTime = 0
				end
				local TodayShenYu = DayTime - TodayTime
				if TodayShenYu > ZhongTime then
					TodayShenYu = ZhongTime
				end
				if TodayShenYu < 0 then
					TodayShenYu = 0
				end
				local ShengYuH = math.floor(ZhongTime/3600)
				local ShengYuMS = math.mod(ZhongTime,3600)
				local ShengYuM = math.floor(ShengYuMS/60)
				local ShengYuS = math.mod(ShengYuMS,60)
				
				local TodayShengYuH = math.floor(TodayShenYu/3600)
				local TodayShengYuMS = math.mod(TodayShenYu,3600)
				local TodayShengYuM = math.floor(TodayShengYuMS/60)
				local TodayShengYuS = math.mod(TodayShengYuMS,60)
				API_ResponseWrite('<br><text>您的剩余双倍时间是：</text><text color="255,0,255">'..ShengYuH..'小时 '..ShengYuM..'分 '..ShengYuS..'秒</text><br>')
				API_ResponseWrite('<text>您今天还可以使用：</text><text color="255,0,255">'..TodayShengYuH..'小时 '..TodayShengYuM..'分 '..TodayShengYuS..'秒</text><br>')
				API_ResponseWrite('<text>开启双倍经验可让您打怪可获得的经验翻倍，</text><text color="255,0,255">每小时双倍'..ShuangBeiJingYan_JiaGe..'点券</text><text>，请输入您要充值的时长</text><br>')
				API_ResponseWrite('<br><text>充值 </text><input type="number" name="3" size="1" width="30"><text>小时 双倍经验</text><br>')
				API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=3&2=1">充值</a><br>')
				API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=0">返回</a><br>')
			else
				local ChongZhiTime = API_RequestGetNumber(3)
				if ChongZhiTime <= 0 then
					if ZhongTime < 0 then
						ZhongTime = 0
					end
					local TodayShenYu = DayTime - TodayTime
					if TodayShenYu > ZhongTime then
						TodayShenYu = ZhongTime
					end
					if TodayShenYu < 0 then
						TodayShenYu = 0
					end
					local ShengYuH = math.floor(ZhongTime/3600)
					local ShengYuMS = math.mod(ZhongTime,3600)
					local ShengYuM = math.floor(ShengYuMS/60)
					local ShengYuS = math.mod(ShengYuMS,60)
					
					local TodayShengYuH = math.floor(TodayShenYu/3600)
					local TodayShengYuMS = math.mod(TodayShenYu,3600)
					local TodayShengYuM = math.floor(TodayShengYuMS/60)
					local TodayShengYuS = math.mod(TodayShengYuMS,60)
					API_ResponseWrite('<br><text>您的剩余双倍时间是：</text><text color="255,0,255">'..ShengYuH..'小时 '..ShengYuM..'分 '..ShengYuS..'秒</text><br>')
					API_ResponseWrite('<text>您今天还可以使用：</text><text color="255,0,255">'..TodayShengYuH..'小时 '..TodayShengYuM..'分 '..TodayShengYuS..'秒</text><br>')
					API_ResponseWrite('<text color="255,0,0">充值失败：</text><text>输入的充值时长有误</text><br>')
					API_ResponseWrite('<text>开启双倍经验可让您打怪可获得的经验翻倍，</text><text color="255,0,255">每小时双倍'..ShuangBeiJingYan_JiaGe..'点券</text><text>，请输入您要充值的双倍时间</text><br>')
					API_ResponseWrite('<br><text>充值 </text><input type="number" name="3" size="1" width="30"><text>小时 双倍经验</text><br>')
					API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=3&2=1">充值</a><br>')
					API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=0">返回</a><br>')
				else
					local Point = API_ActorGetPropNum(ActorID,183)
					local NeedOpenPoint = ChongZhiTime * ShuangBeiJingYan_JiaGe
					if Point < NeedOpenPoint then
						if ZhongTime < 0 then
							ZhongTime = 0
						end
						local TodayShenYu = DayTime - TodayTime
						if TodayShenYu > ZhongTime then
							TodayShenYu = ZhongTime
						end
						if TodayShenYu < 0 then
							TodayShenYu = 0
						end
						local ShengYuH = math.floor(ZhongTime/3600)
						local ShengYuMS = math.mod(ZhongTime,3600)
						local ShengYuM = math.floor(ShengYuMS/60)
						local ShengYuS = math.mod(ShengYuMS,60)
						
						local TodayShengYuH = math.floor(TodayShenYu/3600)
						local TodayShengYuMS = math.mod(TodayShenYu,3600)
						local TodayShengYuM = math.floor(TodayShengYuMS/60)
						local TodayShengYuS = math.mod(TodayShengYuMS,60)
						API_ResponseWrite('<br><text>您的剩余双倍时间是：</text><text color="255,0,255">'..ShengYuH..'小时 '..ShengYuM..'分 '..ShengYuS..'秒</text><br>')
						API_ResponseWrite('<text>您今天还可以使用：</text><text color="255,0,255">'..TodayShengYuH..'小时 '..TodayShengYuM..'分 '..TodayShengYuS..'秒</text><br>')
						API_ResponseWrite('<text color="255,0,0">充值失败：</text><text>充值 '..ChongZhiTime..'小时 双倍需要 '..NeedOpenPoint..'点券 ，您的点券数量不够</text><br>')
						API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=0">返回</a><br>')
					elseif API_UsePoint(ActorID,3,GoodsID,1,NeedOpenPoint) == 0 then					
						local ChongZhiTimeS = ChongZhiTime * 3600 --充值时间						
						local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
						ZhongTime = ZhongTime + ChongZhiTimeS --总时间					
						API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime,ZhongTime)
						local IsOpen = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_IsOpen)
						if IsOpen == 1 then						
							if API_ActorGetPropNum(ActorID,219) ~= 2 then
								API_SetActorExpMultiple(ActorID,100)
							end
							local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)										
							local ProcessTime = os.difftime(NowTime,LastTime)						
							ZhongTime = ZhongTime - ProcessTime
							TodayTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TodayTime)
							TodayTime = TodayTime + ProcessTime								
							if TodayTime > DayTime or ZhongTime <= 0 then
								if API_ActorGetPropNum(ActorID, 219) ~= 0 then
									API_SetActorExpMultiple(ActorID,0)
								end
								API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,0)
							end
						else					
							if API_ActorGetPropNum(ActorID,219) ~= 0 then
								API_SetActorExpMultiple(ActorID,0)
							end
						end
						if ZhongTime < 0 then
							ZhongTime = 0
						end
						local TodayShenYu = DayTime - TodayTime					
						if TodayShenYu > ZhongTime then
							TodayShenYu = ZhongTime
						end
						if TodayShenYu < 0 then
							TodayShenYu = 0
						end
						local ShengYuH = math.floor(ZhongTime/3600)
						local ShengYuMS = math.mod(ZhongTime,3600)
						local ShengYuM = math.floor(ShengYuMS/60)
						local ShengYuS = math.mod(ShengYuMS,60)							
						local TodayShengYuH = math.floor(TodayShenYu/3600)
						local TodayShengYuMS = math.mod(TodayShenYu,3600)
						local TodayShengYuM = math.floor(TodayShengYuMS/60)
						local TodayShengYuS = math.mod(TodayShengYuMS,60)
						API_ResponseWrite('<br><text>您的剩余双倍时间是：</text><text color="255,0,255">'..ShengYuH..'小时 '..ShengYuM..'分 '..ShengYuS..'秒</text><br>')
						API_ResponseWrite('<text>您今天还可以使用：</text><text color="255,0,255">'..TodayShengYuH..'小时 '..TodayShengYuM..'分 '..TodayShengYuS..'秒</text><br>')
						API_ResponseWrite('<text color="0,255,0">充值成功：</text><text>您获得 '..ChongZhiTime..'小时 双倍经验时间！</text><br>')
						API_ResponseWrite('<br><a href="ShuangBeiJingYan_CZK_Title?1=0">返回</a><br>')
					end
				end
			end
		end
	end
end

function ShuangBeiJingYan_OnLogin(ActorID)
	local IsOpen = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_IsOpen)
	if IsOpen == 1 then
		--计算剩余时间
		local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
		local TodayTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TodayTime)
		local year,month,day,hour,min,sec,wday = PublicFun_time()
		local NowDate = year * 10000 + month * 100 + day
		local LastDate = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_LastDate)
		if NowDate ~= LastDate then
			TodayTime = 0
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
		end
		local DayTime = ShuangBeiJingYan_DayTime
--		if API_ActorGetPropNum(ActorID,198) == 1 then
--			DayTime = ShuangBeiJingYan_QQDayTime
--		end
		local TodayShenYu = DayTime - TodayTime
		if TodayShenYu > ZhongTime then
			TodayShenYu = ZhongTime
		end
		if TodayShenYu < 0 then
			TodayShenYu = 0
		end
		
		--创时间触发器
		local TimerTriggerID = API_CreateTimerTrigger(ActorID,TodayShenYu,1,-1,'ShuangBeiJingYan_TodayEnd')
		--将时间触发器ID存交互数据
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID,TimerTriggerID)
		--加双倍显示状态
		local TodayShenYuS = TodayShenYu * 1000
		API_ActorAddStatus(ActorID,ShuangBeiJingYan_StatusID,TodayShenYuS)
		--设置开始标志
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,1)
		--存开始时间
		local NowTime = os.time()
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_OpenTime,NowTime)
		--开始双倍
		--API_SetActorExpMultiple(ActorID,100)
		API_CreateTimerTrigger(ActorID,0,1,-1,'ShuangBeiJingYan_StartExpStatus')
	else
		API_SetActorExpMultiple(ActorID,0)
	end
	local NowTime = os.time()
	local DoubleExpPackageTime = API_VarDataGetNumber(ActorID,1,DoubleExpPackageCard_OsTime)
	if DoubleExpPackageTime > NowTime then
		if IsOpen == 1 then
			local year,month,day,hour,min,sec,wday = PublicFun_time()
			local NowDate = year * 10000 + month * 100 + day
			local LastDate = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_LastDate)
			if NowDate ~= LastDate then
				TodayTime = 0
				API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
				API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
			end
			--获取时间触发器ID
			local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
			--关闭时间触发器
			API_DestroyTrigger(ActorID,-1,TimerTriggerID)
			--去除双倍显示状态
			API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
			--计算本次一共时间
			local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)
			local NowTime = os.time()
			local ProcessTime = os.difftime(NowTime,LastTime)
			--总时间减去消耗时间
			local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
			local TodayTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TodayTime)
			ZhongTime = ZhongTime - ProcessTime
			if ZhongTime < 0 then
				ZhongTime = 0
			end
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime,ZhongTime)
			TodayTime = TodayTime + ProcessTime
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
			--设置开始标志
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,0)
			--关闭双倍
			API_SetActorExpMultiple(ActorID,0)
			API_ActorSendMsg(ActorID,10,'您的双倍经验储值卡已自动关闭')
			
		end
		--开启包时
		--创时间触发器
		local TriggerTimer = DoubleExpPackageTime - NowTime
		--API_Trace('TriggerTimer = '..TriggerTimer)
		local TimerTriggerID = API_CreateTimerTrigger(ActorID,TriggerTimer,1,-1,'WYL_DoubleExpPackageCard_Close')
		--将时间触发器ID存交互数据
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID,TimerTriggerID)
		--加双倍显示状态
		local ShenYuTime = TriggerTimer * 1000
		API_ActorAddStatus(ActorID,ShuangBeiJingYan_StatusID,ShenYuTime)
		--开始双倍
		--API_SetActorExpMultiple(ActorID,100)
		API_CreateTimerTrigger(ActorID,0,1,-1,'ShuangBeiJingYan_StartExpStatus')
	end
end

function ShuangBeiJingYan_StartExpStatus(ActorID)
	API_SetActorExpMultiple(ActorID,100)
end

function ShuangBeiJingYan_OnLogout(ActorID)
	local IsOpen = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_IsOpen)
	if IsOpen == 1 then
		local year,month,day,hour,min,sec,wday = PublicFun_time()
		local NowDate = year * 10000 + month * 100 + day
		local LastDate = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_LastDate)
		if NowDate ~= LastDate then
			TodayTime = 0
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
		end
		--获取时间触发器ID
		local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
		--关闭时间触发器
		API_DestroyTrigger(ActorID,-1,TimerTriggerID)
		--去除双倍显示状态
		API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
		--计算本次一共时间
		local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)
		local NowTime = os.time()
		local ProcessTime = os.difftime(NowTime,LastTime)
		--总时间减去消耗时间
		local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
		local TodayTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TodayTime)
		ZhongTime = ZhongTime - ProcessTime
		if ZhongTime < 0 then
			ZhongTime = 0
		end
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime,ZhongTime)
		TodayTime = TodayTime + ProcessTime
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
		
		--关闭双倍
		API_SetActorExpMultiple(ActorID,0)
	else
		API_SetActorExpMultiple(ActorID,0)
	end
	local NowTime = os.time()
	local DoubleExpPackageTime = API_VarDataGetNumber(ActorID,1,DoubleExpPackageCard_OsTime)
	if DoubleExpPackageTime > NowTime then
		if IsOpen == 1 then
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,0)
		end
		--获取时间触发器ID
		local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
		--关闭时间触发器
		API_DestroyTrigger(ActorID,-1,TimerTriggerID)
		--去除双倍显示状态
		API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
		API_SetActorExpMultiple(ActorID,0)
	end
end

--今天时间到函数
function ShuangBeiJingYan_TodayEnd(ActorID,TaskID)
	local IsOpen = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_IsOpen)
	if IsOpen == 1 then
		local year,month,day,hour,min,sec,wday = PublicFun_time()
		local NowDate = year * 10000 + month * 100 + day
		local LastDate = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_LastDate)
		if NowDate ~= LastDate then
			TodayTime = 0
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
		end
		--获取时间触发器ID
		local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
		--关闭时间触发器
		API_DestroyTrigger(ActorID,-1,TimerTriggerID)
		--去除双倍显示状态
		API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
		--计算本次一共时间
		local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)
		local NowTime = os.time()
		local ProcessTime = os.difftime(NowTime,LastTime)
		--总时间减去消耗时间
		local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
		local TodayTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TodayTime)
		ZhongTime = ZhongTime - ProcessTime
		if ZhongTime < 0 then
			ZhongTime = 0
		end
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime,ZhongTime)
		TodayTime = TodayTime + ProcessTime
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
		--设置开始标志
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,0)
		--关闭双倍
		API_SetActorExpMultiple(ActorID,0)
	else
		API_SetActorExpMultiple(ActorID,0)
	end
end

--24点回调函数
function ShuangBeiJingYan_ClearYesterdayDataActor(ActorID)
	local IsOpen = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_IsOpen)
	if IsOpen == 1 then
		local year,month,day,hour,min,sec,wday = PublicFun_time()
		local NowDate = year * 10000 + month * 100 + day
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,0)
		--获取时间触发器ID
		local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
		--关闭时间触发器
		API_DestroyTrigger(ActorID,-1,TimerTriggerID)
		--去除双倍显示状态
		API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
		--计算本次一共时间
		local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)
		local NowTime = os.time()
		local ProcessTime = os.difftime(NowTime,LastTime)
		--总时间减去消耗时间
		local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
		ZhongTime = ZhongTime - ProcessTime
		if ZhongTime < 0 then
			ZhongTime = 0
		end
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime,ZhongTime)
		
		
		local DayTime = ShuangBeiJingYan_DayTime
		if API_ActorGetPropNum(ActorID,198) == 1 then
			DayTime = ShuangBeiJingYan_QQDayTime
		end
		if DayTime > ZhongTime then
			DayTime = ZhongTime
		end
		if DayTime < 0 then
			DayTime = 0
		end
		--创时间触发器
		local TimerTriggerID = API_CreateTimerTrigger(ActorID,DayTime,1,-1,'ShuangBeiJingYan_TodayEnd')
		--将时间触发器ID存交互数据
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID,TimerTriggerID)
		--加双倍显示状态
		local DayTimeS = DayTime * 1000
		API_ActorAddStatus(ActorID,ShuangBeiJingYan_StatusID,DayTimeS)
		--存开始时间
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_OpenTime,NowTime)
		--开始双倍
		API_SetActorExpMultiple(ActorID,100)
	else
		API_SetActorExpMultiple(ActorID,0)
	end
	NetbarActivities_Yesterday(ActorID)
end


--添加储值卡函数
function ShuangBeiJingYan_AddCZK(ActorID)
	local GoodsID = 88065
	if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 then
		local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
		ZhongTime = ZhongTime + ShuangBeiJingYan_ChuShiShiJian
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime,ZhongTime)
		local ChuShiH = math.floor(ShuangBeiJingYan_ChuShiShiJian/3600)
		API_ActorSendMsg(ActorID,8,'由于您已经拥有'..API_GetGoodsName(GoodsID)..'，本次增加'..ChuShiH..'小时双倍时间') 
	elseif API_ActorCanAddGoods(ActorID,GoodsID,1,3,0) ~= -1 then
		local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
		ZhongTime = ZhongTime + ShuangBeiJingYan_ChuShiShiJian
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime,ZhongTime)
		API_AddActorGoodsFlag(ActorID,GoodsID,1,3,'购买双倍储值卡')
	end
end

DoubleExpPackageCard_OsTime = 12731
DoubleExpPackageCard_GoodsTime = {
	[89079] = 604800,
	[89080] = 1296000,
	[89081] = 2592000,
}

--双倍经验包时卡 DoubleExpPackageCard 12731
function WYL_DoubleExpPackageCard_Func(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if DoubleExpPackageCard_GoodsTime[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'没有这个道具!')
		return 0
	end
	local IsOpen = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_IsOpen)
	if IsOpen == 1 then
		local year,month,day,hour,min,sec,wday = PublicFun_time()
		local NowDate = year * 10000 + month * 100 + day
		local LastDate = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_LastDate)
		if NowDate ~= LastDate then
			TodayTime = 0
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_LastDate,NowDate)
		end
		--获取时间触发器ID
		local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
		--关闭时间触发器
		API_DestroyTrigger(ActorID,-1,TimerTriggerID)
		--去除双倍显示状态
		API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
		--计算本次一共时间
		local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)
		local NowTime = os.time()
		local ProcessTime = os.difftime(NowTime,LastTime)
		--总时间减去消耗时间
		local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
		local TodayTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TodayTime)
		ZhongTime = ZhongTime - ProcessTime
		if ZhongTime < 0 then
			ZhongTime = 0
		end
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime,ZhongTime)
		TodayTime = TodayTime + ProcessTime
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TodayTime,TodayTime)
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,0)
		--关闭双倍
		API_SetActorExpMultiple(ActorID,0)
		API_ActorSendMsg(ActorID,10,'您的双倍经验储值卡已自动关闭')
		
	end
	local NowTime = os.time()
	local DoubleExpPackageTime = API_VarDataGetNumber(ActorID,1,DoubleExpPackageCard_OsTime)
	local GoodsTime = DoubleExpPackageCard_GoodsTime[GoodsID]
	if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用'..API_GetGoodsName(GoodsID)..'开启双倍经验') then
		--如果之前开启过这个道具，先关闭再重启开启
		if DoubleExpPackageTime > NowTime then
			--获取时间触发器ID
			local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
			--关闭时间触发器
			API_DestroyTrigger(ActorID,-1,TimerTriggerID)
			--将时间触发器交互数据清0
			API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID,0)
			--去除双倍显示状态
			API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
			DoubleExpPackageTime = DoubleExpPackageTime + GoodsTime
		else
			DoubleExpPackageTime = NowTime + GoodsTime
		end
		--保存双倍经验包时卡到期时间
		API_VarDataSetNumber(ActorID,1,DoubleExpPackageCard_OsTime,DoubleExpPackageTime)
		--开启双倍经验
		--创时间触发器
		local TriggerTimer = DoubleExpPackageTime - NowTime
		local TimerTriggerID = API_CreateTimerTrigger(ActorID,TriggerTimer,1,-1,'WYL_DoubleExpPackageCard_Close')
		--将时间触发器ID存交互数据
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID,TimerTriggerID)
		--加双倍显示状态
		local ShenYuTime = TriggerTimer * 1000
		API_ActorAddStatus(ActorID,ShuangBeiJingYan_StatusID,ShenYuTime)
		--开始双倍
		API_SetActorExpMultiple(ActorID,100)
		
		local DayTime = math.floor(GoodsTime/86400)
		local time = os.date("*t",DoubleExpPackageTime)
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="530,175,260,210"></win>')
		API_ResponseWrite('<br><text>您使用'..API_GetGoodsName(GoodsID)..'</text><text color="255,0,255">增加了'..DayTime..'天的双倍杀怪经验时间。</text><br><br><text>您的双倍杀怪经验时间可以使用到：</text><br><text color="255,0,255">'.. time.year ..'年'.. time.month ..'月'.. time.day ..'日  '.. time.hour ..':'.. time.min ..':'.. time.sec ..'</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 1
	end
	return 0
end

--双倍经验包时卡到期函数
function WYL_DoubleExpPackageCard_Close(ActorID,TaskID)
	--获取时间触发器ID
	local TimerTriggerID = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TimeTriggerID)
	--关闭时间触发器
	API_DestroyTrigger(ActorID,-1,TimerTriggerID)
	--去除双倍显示状态
	API_ActorRemoveStatus(ActorID,ShuangBeiJingYan_StatusID)
	API_SetActorExpMultiple(ActorID,0)
	API_ActorSendMsg(ActorID,10,'您的双倍经验包时卡已到期')
	API_ActorSendMsg(ActorID,17,'您的双倍经验包时卡已到期，您可以按“P”键开打商城重新购买双倍经验包时卡充时')
end
