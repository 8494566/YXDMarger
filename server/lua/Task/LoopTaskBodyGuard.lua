-- --------------------------------------------------------------------------------------------------------------
-- 快递任务:  基本配置[TaskID=101~102]
-- 3501		上一次最后领取日期(1~365)
-- 3502		当天已经做的次数:0=没有做;[1-5]=次数,6=完成;
-- 3503		记录任务档次/接受任务时的等级
-- 3504		保留/记录接受任务时的等级
-- 3505		保留/保留
-- 3506		目的NPC1/记录任务档次
-- 3507		邮车GoodsId / 邮车FastId
-- 3508		邮船押金/是否要创建邮船
-- 3509		奖励金额/邮船死亡触发器ID
-- 3510		状态值/状态触发器ID
-- --------------------------------------------------------------------------------------------------------------
-- 记录当前做的任务ID
local constBodyGuardLasted = 3501
local constBodyGuardCount = 3502

local constAcceptedTaskLevel = 3503
local constAcceptedPeerageLevel = 3503

local constAcceptedExpLevel = 3504

-- --------------------------------------------------------------------------------------------------------------
local constBodyGuard_MIN  = 1
local constBodyGuard_MAX  = 3
local constBodyGuard_End  = constBodyGuard_MAX + 1
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_MinCount()
	return constBodyGuard_MIN
end

function BodyGuard_MaxCount()
	return constBodyGuard_MAX
end

function BodyGuard_TaskEnd()
	return constBodyGuard_End
end

-- --------------------------------------------------------------------------------------------------------------
-- 玩家接受主线任务的处理过程
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_AcceptTaskProc(lActorID, lTaskID)
	-- 接受任务
	TaskPub_AcceptTaskProc(lActorID, lTaskID)
	-- 增加任务计数标记
	local lTaskCount = BodyGuard_GetTaskCount(lActorID)
	lTaskCount = lTaskCount + 1
	BodyGuard_SetTaskCount(lActorID, lTaskCount)
end

-- --------------------------------------------------------------------------------------------------------------
-- 玩家完成任务是的处理过程
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_FinishTaskProc(lActorID, lTaskID)
	TaskPub_FinishTaskProc(lActorID, lTaskID)
	API_VarDataSetNumber(lActorID, 1, constAcceptedTaskLevel, 0)
	API_VarDataSetNumber(lActorID, 0, constAcceptedExpLevel, 0)
end

-- --------------------------------------------------------------------------------------------------------------
-- 玩家放弃任务是的处理过程
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_GiveupTaskProc(lActorID, lTaskID)
	TaskPub_GiveupTaskProc(lActorID, lTaskID)
	API_VarDataSetNumber(lActorID, 1, constAcceptedTaskLevel, 0)
	TaskPub_SendMessage(lActorID, "放弃该次<快递任务>")
end

-- -------------------------------------------------------------------------------------------------------------
-- 获取当天的时间
-- -------------------------------------------------------------------------------------------------------------
function BodyGuard_GetCurrentDayOfYear()
	local lNowYear = API_GetDatatime(1)
	local lNowDay = API_GetDatatime(8)
	local lNowDayOfYear = lNowYear * 1000 + lNowDay
	return lNowDayOfYear
end

-- -------------------------------------------------------------------------------------------------------------
-- 获取快递任务最后领取日期
-- -------------------------------------------------------------------------------------------------------------
function BodyGuard_GetLastAccepted(lActorID)
	return API_VarDataGetNumber(lActorID, 1, constBodyGuardLasted)
end

-- -------------------------------------------------------------------------------------------------------------
-- 设置快递任务最后领取日期
-- -------------------------------------------------------------------------------------------------------------
function BodyGuard_SetLastAccepted(lActorID, lLasAccpted)
	API_VarDataSetNumber(lActorID, 1, constBodyGuardLasted, lLasAccpted)
end

-- -------------------------------------------------------------------------------------------------------------
-- 获取当天的快递任务领取次数
-- -------------------------------------------------------------------------------------------------------------
function BodyGuard_GetTaskCount(lActorID)
	local lTaskCount = API_VarDataGetNumber(lActorID, 1, constBodyGuardCount)
	return lTaskCount
end

-- -------------------------------------------------------------------------------------------------------------
-- 设置当天的快递任务领取次数
-- -------------------------------------------------------------------------------------------------------------
function BodyGuard_SetTaskCount(lActorID, lTaskCount)
	API_VarDataSetNumber(lActorID, 1, constBodyGuardCount, lTaskCount)
end

-- -------------------------------------------------------------------------------------------------------------
-- 获取接的任务档次
-- -------------------------------------------------------------------------------------------------------------
function BodyGuard_GetAcceptedTaskLevel(lActorID)
	-- local l = API_VarDataGetNumber(lActorID, 1, constAcceptedTaskLevel)
	-- if l<1 then
	-- 	return BodyGuard_GetTaskLevel(lActorID)
	-- elseif l>4 then
	-- 	return 4
	-- end
	-- return l
	return BodyGuard_GetTaskLevel(lActorID)
end

-- -------------------------------------------------------------------------------------------------------------
-- 设置接的任务档次
-- -------------------------------------------------------------------------------------------------------------
function BodyGuard_SetAcceptedTaskLevel(lActorID, lTaskLevel)
	if lTaskLevel<1 then
		API_VarDataSetNumber(lActorID, 1, constAcceptedTaskLevel, 1)
	elseif lTaskLevel>4 then
		API_VarDataSetNumber(lActorID, 1, constAcceptedTaskLevel, 4)
	else
		API_VarDataSetNumber(lActorID, 1, constAcceptedTaskLevel, lTaskLevel)
	end
end

-- -------------------------------------------------------------------------------------------------------------
-- 获取接的快递任务时的等级
-- -------------------------------------------------------------------------------------------------------------
function BodyGuard_GetAcceptedPeerageLevel(lActorID)
	return API_VarDataGetNumber(lActorID, 0, constAcceptedPeerageLevel)
end

-- -------------------------------------------------------------------------------------------------------------
-- 设置接的快递任务时的等级
-- -------------------------------------------------------------------------------------------------------------
function BodyGuard_SetAcceptedPeerageLevel(lActorID, lExpLevel)
	API_VarDataSetNumber(lActorID, 0, constAcceptedPeerageLevel, lExpLevel)
end

-- --------------------------------------------------------------------------------------------------------------
-- 根据玩家等级获得任务档次ID
-- 1档任务：十等男爵<->六等男爵（11-15）
-- 2档任务：五等男爵<->一等高级子爵（16-40）
-- 3档任务：十等伯爵<->一等高级伯爵（41-55）
-- 4档任务：十等侯爵<->一等高级侯爵（56-70）
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_GetTaskLevel(lActorID)
	-- 获得玩家等级
	local lLevel = API_GetActorExpLevel(lActorID)
	local lCount = 1
	if lLevel>10 and lLevel<=15 then
		lCount = 1
	elseif lLevel>15 and lLevel<=40 then
		lCount = 2
	elseif lLevel>40 and lLevel<=55 then
		lCount = 3
	elseif lLevel>55 and lLevel<=70 then
		lCount = 4
	elseif lLevel>70 and lLevel<=255 then
		lCount = 5
	else
		lCount = 6
	end
	return lCount
end

-- --------------------------------------------------------------------------------------------------------------
-- 根据任务等级获得任务需要押金
-- C．任务所需押金公式
-- 1档任务所需押金 = (500+（功勋等级-11）*292)/7*基数
-- 2档任务所需押金 = (2000+（功勋等级-16）*140)/6*基数
-- 3档任务所需押金 = (8000+（功勋等级-41）*1235)/4*基数
-- 4档任务所需押金 = (30000+（功勋等级-56）*2032)/2.5*基数
-- 注解：基数为1.5 
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_GetTaskDeposit(lActorID,lTaskLevel)
	local lExpLevel = API_VarDataGetNumber(lActorID, 0, constAcceptedExpLevel)
	if lExpLevel<=0 then
		lExpLevel = API_GetActorExpLevel(lActorID)
	end
	local nValue = 0
	if 1==lTaskLevel then
		nValue = (500+(lExpLevel-11)*292)/7
	elseif 2==lTaskLevel then
		nValue = (2000+(lExpLevel-16)*140)/6
	elseif 3==lTaskLevel then
		nValue = (8000+(lExpLevel-41)*1235)/4
	elseif 4==lTaskLevel then
		nValue = (30000+(lExpLevel-56)*2032)/2.5
	else
		DBG_TRACE('快递任务:错误的任务档次('..lTaskLevel..'),提高押金!!')
		nValue = (30000+(lExpLevel-56)*2032)/2.5
	end
	nValue = math.floor(nValue *1.5)
	DBG_TRACE('快递任务:'..lTaskLevel..'档任务押金'..nValue)
	return nValue	
end

-- --------------------------------------------------------------------------------------------------------------
-- 根据任务等级计算任务奖励
-- 1档任务奖励功勋 = (500+（功勋等级-11）*292)*快递基数
-- 2档任务奖励功勋 = (2000+（功勋等级-16）*140)*快递基数
-- 3档任务奖励功勋 = (8000+（功勋等级-41）*1235)*快递基数
-- 4档任务奖励功勋 = (30000+（功勋等级-56）*2032)*快递基数
-- 注解：快递基数为2，平时为1，快递时间内才会计算该基数
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_GetAwardValue(lActorID, lTaskLevel)
	local lExpLevel = API_VarDataGetNumber(lActorID, 0, constAcceptedExpLevel)
	if lExpLevel<=0 then
		lExpLevel = API_GetActorExpLevel(lActorID)
	end
	
	-- 等级计算
	local nValue = 0
	if 1==lTaskLevel then
		nValue = (500+(lExpLevel-11)*292)
	elseif 2==lTaskLevel then
		nValue = (2000+(lExpLevel-16)*140)
	elseif 3==lTaskLevel then
		nValue = (8000+(lExpLevel-41)*1235)
	elseif 4==lTaskLevel then
		nValue = (30000+(lExpLevel-56)*2032)
	else
		nValue = (500+(lExpLevel-11)*292)
	end
	
	-- 快递时间
	if BodyGuard_IsAwardDateTime(lActorID)>0 then
		nValue = nValue * 2
	end
	
	if nValue<1 then
		nValue = 1
	end
	
	DBG_TRACE('快递任务:'..lTaskLevel..'档任务获得奖励:'..nValue)	
	
	return nValue
end

-- ------------------------------------------------------------------------------------------------
-- 玩家接受本任务时是否是快递时间段
-- ------------------------------------------------------------------------------------------------
function BodyGuard_IsAwardDateTime(lActorID)
	local lCurrentTime = os.date('*t')
	local lHour = lCurrentTime['hour']
	local lMinute = lCurrentTime['min']
	local lCampID = API_GetActorCamp(lActorID)

	return BodyGuard_IsAwardTimeSpan(lCampID,lHour,lMinute)
end

-- ------------------------------------------------------------------------------------------------
-- 判断是否是快递任务时间段
-- ------------------------------------------------------------------------------------------------
function BodyGuard_IsAwardTimeSpan(lCampID,lHour,lMinute)
	if 0==lCampID then
		if (lHour>=12 and lHour<13) or (lHour>=19 and lHour<20) then
			return 1
		end
	elseif 1==lCampID then
		if (lHour>=13 and lHour<14) or (lHour>=18 and lHour<19 ) then
			return 1
		end
	end
	return 0
end

-- --------------------------------------------------------------------------------------------------------------
-- 玩家的等级 配置任务档次
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_CanAcceptBodyGuard(lActorID)
	local lExpLevel = API_GetActorExpLevel(lActorID)
	if lExpLevel<11 then
		DBG_TRACE("玩家["..lActorID.."]等级还不够,不能接快递任务")
		return 0
	end

	local lNowDayOfYear = BodyGuard_GetCurrentDayOfYear()
	local lDayOfYear = BodyGuard_GetLastAccepted(lActorID)
	if lNowDayOfYear~=lDayOfYear then
		BodyGuard_GenTaskQueue(lActorID)
	end

	return 1
end

-- --------------------------------------------------------------------------------------------------------------
-- 描述：每个玩家升级时会自动调用此函数
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_OnUpgrade(lActorID)
	local lTaskState = API_VarDataGetNumber(lActorID, 1, 102)
	if 0==lTaskState then
		API_VarDataSetNumber(lActorID, 1, constAcceptedTaskLevel, 0)
		BodyGuard_GenTaskQueue(lActorID)	
	end
end

-- --------------------------------------------------------------------------------------------------------------
-- 根据玩家等级配置任务档次
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_TaskParamConfig(lActorID)
	-- 任务等级
	BodyGuard_SetAcceptedTaskLevel(lActorID,BodyGuard_GetTaskLevel(lActorID))	
	
	local lExpLevel = API_GetActorExpLevel(lActorID)
	API_VarDataSetNumber(lActorID, 0, constAcceptedExpLevel, lExpLevel)
end

-- --------------------------------------------------------------------------------------------------------------
-- 根据玩家进行快递任务循环
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_GenTaskQueue(lActorID)
	local lExpLevel = API_GetActorExpLevel(lActorID)
	if lExpLevel<11 then
		DBG_TRACE("玩家["..lActorID.."]等级还不够,不能接快递任务")
		return 0
	end

	local lNowDayOfYear = BodyGuard_GetCurrentDayOfYear()
	local lDayOfYear = BodyGuard_GetLastAccepted(lActorID)
	if lNowDayOfYear~=lDayOfYear then
		BodyGuard_SetLastAccepted(lActorID, lNowDayOfYear)
		BodyGuard_SetTaskCount(lActorID, 0)
	end

	local lTaskCount = BodyGuard_GetTaskCount(lActorID)
	if lTaskCount<BodyGuard_MaxCount() then
		local lTaskLevel = API_VarDataGetNumber(lActorID, 1, constAcceptedTaskLevel)
		if 0==lTaskLevel then
			BodyGuard_TaskParamConfig(lActorID)
			LoopTaskBodyGuard_TaskMain(lActorID, lTaskCount)
		end
		return 1
	end
	
	return 0
end

-- --------------------------------------------------------------------------------------------------------------
--  以下支持快递时间提示，简单处理算了
-- --------------------------------------------------------------------------------------------------------------
local g_BodyGuard_Main_TrigID = _G["G_BodyGuard_Main_TrigID"]
if nil~=g_BodyGuard_Main_TrigID and g_BodyGuard_Main_TrigID>0 then
	API_DestroyTriggerG(g_BodyGuard_Main_TrigID)
end
_G["G_BodyGuard_Main_TrigID"] = 0

local constG_MaxMinute = 5
local constG_TimeSpan = 60
local constSoundID = 10102

local nSndDateTime = { 0,0,}
local tSet = {0,0}

function GetCampName(nCamp)
	return nCamp == 0 and "帝国" or "联邦"
end

function GetAddrName(nCamp)
	return function(nType)
		if nCamp == 0 then return nType == 0 and "阳光雨林" or "落日农庄"
		else return nType == 0 and "珊瑚群岛" or "娜纱湿地" end
	end
end

function GetPeerDes(nType)
	return nType == 0 and "男爵" or "子爵"
end

function GetPos(nCamp)
	return function(nType)
		if nCamp == 0 then return nType == 0 and "（72,48）" or "（163,219）"
		else return nType == 0 and "（64，56）" or "（157,208）" end
	end
end

function GetBroadMsg(nCamp)
	local szCampName = GetCampName(nCamp)
	return function(nType)
		local szPeerDes = GetPeerDes(nType)
		local szAddrName = GetAddrName(nCamp)(nType)
		local szPos = GetPos(nCamp)(nType)
		if nType == 0 then return szCampName.."邮政广征天下英雄，你现在可以领取"..szPeerDes.."快递。请前往"..szAddrName..szCampName..szPeerDes.."邮政官"..szPos.."处领取。"
		else return "        现在是"..szCampName..szPeerDes.."快递发货时间。        请前往"..szAddrName..szCampName..szPeerDes.."邮政官"..szPos.."处领取。任务时间有限，请各位英雄抓紧时间。" end
	end
end

-- --------------------------------------------------------------------------------------------------------------
-- 创建一个全局时间触发器
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_CreateG_MainTimeTrigger()
	g_BodyGuard_Main_TrigID = _G["G_BodyGuard_Main_TrigID"]
	if g_BodyGuard_Main_TrigID>0 then
		API_Trace("快递任务:不能重复创建一个全局时间提示触发器")
		return
	end

	local g_BodyGuard_Main_TrigID = API_CreateTimerTriggerG(constG_TimeSpan, 0, constG_TimeSpan, -1, "BodyGuard_GCallback_MainTimeTrigger")
	if nil==g_BodyGuard_Main_TrigID or g_BodyGuard_Main_TrigID<=0 then
		API_Trace("快递任务:创建一个全局时间提示触发器失败")
		return
	end
	_G["G_BodyGuard_Main_TrigID"] = g_BodyGuard_Main_TrigID	
	
	-- 模拟回调一次
	BodyGuard_GCallback_MainTimeTrigger(constG_TimeSpan, 0)
end

-- --------------------------------------------------------------------------------------------------------------
-- 全局时间触发器回调
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_GCallback_MainTimeTrigger(lParam1, lParam2)
	local lCurrentTime = os.date('*t')
	local lHour = lCurrentTime['hour']
	local lMinute = lCurrentTime['min']
	local lSecond = lCurrentTime['sec']

	--local lTestMinute = lMinute + constG_MaxMinute
	--local lTestHour = lHour

	--if lTestMinute>59 then
	--	lTestHour = lTestHour + 1
	--	lTestMinute = lTestMinute-59
	--end

	--for i=1,2 do
	    --if nSndDateTime[i] > 0 then
			--local tTold = os.date('*t', nSndDateTime[i])
			--if lCurrentTime.day > tTold.day then nSndDateTime[i] = 0 end
		--end
	--end
	

	-- 刷刷帝国
	if 1==BodyGuard_IsAwardTimeSpan(0,lHour,lMinute) then
		--if 1==BodyGuard_IsAwardTimeSpan(0,lTestHour,lTestMinute)  then
			BodyGuard_G_OnSendTitle(0, lHour, lMinute)
			--nSndDateTime[1] = os.time()
		--end
		if tSet[1] == 0 then
			BodyGuard_G_BoradcastCallBack(0)
			tSet[1]= tSet[1] + 1
		end
	else
		if tSet[1] > 0 then
		    BodyGuard_G_BoradcastCallBack(0)
			tSet[1] = 0
		end
	end	
	
	-- 刷刷联邦
	if 1==BodyGuard_IsAwardTimeSpan(1,lHour,lMinute) then
		--if 1==BodyGuard_IsAwardTimeSpan(1,lTestHour,lTestMinute)  then
			BodyGuard_G_OnSendTitle(1, lHour, lMinute)
			--nSndDateTime[2] = os.time()
		--end	
		if tSet[2] == 0 then
		    BodyGuard_G_BoradcastCallBack(1)
			tSet[2] = tSet[2] + 1
		end
	else
		if tSet[2] > 0 then
		    BodyGuard_G_BoradcastCallBack(1)
			tSet[2] = 0
		end
	end  
end

-- --------------------------------------------------------------------------------------------------------------
--  快递时间前X分钟提示
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_G_OnSendTitle(lCampID, lHour, lMinute)
	--local nTimeSpan = 10 - math.mod(lMinute,10)
	--if nTimeSpan<0 then
	--	nTimeSpan = 0
	--elseif nTimeSpan>10 then
	--	nTimeSpan = 10
	--end
	--local szMsg = ""
	--if 0==lCampID then
	--	szMsg = nTimeSpan.."分钟后就是帝国快递发货时间，请在该时间内完成快递任务。"
	--elseif 1==lCampID then
	--	szMsg = nTimeSpan.."分钟后是联邦快递发货时间，请在该时间内完成快递任务。"
	--end
	--DBG_TRACE("快递任务 BodyGuard_G_OnSendTitle lMinute="..lMinute)
	if math.mod(lMinute,10) == 0 then
		local hGetMsg = GetBroadMsg(lCampID)
		-- API_ActorBroadcastMsgEx(-1, lCampID, constSoundID, 1, szMsg)
		BodyGuard_G_BoradcastMsg(lCampID, constSoundID, 1, 11, 25, hGetMsg(0))
		BodyGuard_G_BoradcastMsg(lCampID, constSoundID, 1, 26, 85, hGetMsg(1))
	end
end

function BodyGuardActorFunc(lActorID)
--DBG_TRACE("完家快递任务回调， lActorID="..lActorID)
	local lCampId = API_GetActorCamp(lActorID)
	oTask = CTaskSystem.tTasks[102]
	if oTask ~= nil then
		if tSet[lCampId+1] == 0 then  
			if oTask:SetAcceptLog(lActorID) then oTask:ShowFlash(lActorID) end 
		else oTask:AcceptLogRemove(lActorID) end
		API_UpdateTaskNpcState( lActorID )
	end
end

-- --------------------------------------------------------------------------------------------------------------
--  给所有静态地图发广播消息
-- --------------------------------------------------------------------------------------------------------------
function BodyGuard_G_BoradcastMsg(lCampID, nSounrdID,nMsgTypeID, nMinLev, nMaxLev, szMsg)
    --DBG_TRACE( szMsg )
	for n,nMapID in pairs(GLOBAL_StaticMapIDList) do
		local nRightMapID = API_GetRightMapID(nMapID)
		if nRightMapID>0 then
			--API_ActorBroadcastMsgEx(nRightMapID, lCampID, nSounrdID, nMsgTypeID, szMsg)
			API_ActorBroadcastMsgLevRang(nRightMapID, lCampID, nMinLev, nMaxLev,nSounrdID, nMsgTypeID, szMsg)
		end
	end
end

function BodyGuard_G_BoradcastCallBack( lCampID )
	for n,nMapID in pairs(GLOBAL_StaticMapIDList) do
		local nRightMapID = API_GetRightMapID(nMapID)
		if nRightMapID>0 then
			--API_ActorBroadcastMsgEx(nRightMapID, lCampID, nSounrdID, nMsgTypeID, szMsg)
			API_ActorCallBack(nRightMapID, 1, lCampID, "BodyGuardActorFunc")
		end
	end
end 

-- --------------------------------------------------------------------------------------------------------------
-- 创建一个全局时间触发器
-- --------------------------------------------------------------------------------------------------------------
BodyGuard_CreateG_MainTimeTrigger()


-- --------------------------------------------------------------------------------------------------------------
-- end files!!!
-- --------------------------------------------------------------------------------------------------------------
