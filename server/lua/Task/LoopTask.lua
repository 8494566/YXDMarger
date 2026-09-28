-- --------------------------------------------------------------------------------------------------------------
-- 循环任务:主文件过程
-- 循环任务:保存交互数据的配置
-- 3001~3005 保留
-- --------------------------------------------------------------------------------------------------------------
local constLastAcceptDay = 3001
local constAcceptedExpLevel = 3002
local constFinishedLoopNum = 3003
local constLastedTaskID = 3004
local constCompetedLoopOnce = 3005

-- 配置数据
local constMustbeExpLevel = 13
local constMaxAcceptedLoopNum = 5
local constMaxGiveupAcceptedLoopNum = 999

-- --------------------------------------------------------------------------------------------------------------
-- 获得最大循环次数
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_GetMaxAcceptedLoopNum(lActorID)
	return constMaxAcceptedLoopNum
end

-- --------------------------------------------------------------------------------------------------------------
-- 获得放弃循环次数标志
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_GetMaxGiveupAcceptedLoopNum(lActorID)
	return constMaxGiveupAcceptedLoopNum
end

-- --------------------------------------------------------------------------------------------------------------
-- 获得循环任务的必须等级
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_GetMustbeExpLevel(lActorID)
	return constMustbeExpLevel
end


-- --------------------------------------------------------------------------------------------------------------
-- 获得当前日期[循环任务的]
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_GetCurrentDaysOfYear()
	local lYear = API_GetDatatime(1)
	local lDays = API_GetDatatime(8)	
	local lDaysOfYear = (lYear * 1000) + lDays
	return lDaysOfYear	
end

-- --------------------------------------------------------------------------------------------------------------
-- 获得循环任务的最后一次访问的日期
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_GetLastedAcceptedDays(lActorID)
	local lLastAcceptDay = API_VarDataGetNumber(lActorID, 1, constLastAcceptDay)
	return lLastAcceptDay
end

-- --------------------------------------------------------------------------------------------------------------
-- 设置循环任务的最后一次访问的日期
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_SetLastedAcceptedDays(lActorID, lLastAcceptDay)
	API_VarDataSetNumber(lActorID, 1, constLastAcceptDay, lLastAcceptDay)
end

--  --------------------------------------------------------------------------------------------------------------
--  获得领取循环任务时的功勋等级
--  --------------------------------------------------------------------------------------------------------------
function LoopTask_GetAcceptedExpLevel(lActorID)
	local lLevel = API_VarDataGetNumber(lActorID, 1, constAcceptedExpLevel)
	return lLevel
end

-- --------------------------------------------------------------------------------------------------------------
-- 保存领取循环任务时的功勋等级
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_SaveAcceptedExpLevel(lActorID,lExpLevel)
	API_VarDataSetNumber(lActorID, 1, constAcceptedExpLevel, lExpLevel)
end

-- --------------------------------------------------------------------------------------------------------------
-- 获得完成的循环任务次数
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_GetFinishedLoopCount(lActorID)
	local lLoopNum = API_VarDataGetNumber(lActorID, 1, constFinishedLoopNum)
	return lLoopNum
end

-- --------------------------------------------------------------------------------------------------------------
-- 设置完成的循环任务次数
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_SetFinishedLoopCount(lActorID, lLoopNum)
	API_VarDataSetNumber(lActorID, 1, constFinishedLoopNum, lLoopNum)
end

-- --------------------------------------------------------------------------------------------------------------
-- 获得循环任务的最后一个任务ID
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_GetLastedTaskID(lActorID)
	local lLastedTaskID = API_VarDataGetNumber(lActorID, 1, constLastedTaskID)
	return lLastedTaskID
end

-- --------------------------------------------------------------------------------------------------------------
-- 设置循环任务的最后一个任务ID
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_SetLastedTaskID(lActorID, lLastedTaskID)
	API_VarDataSetNumber(lActorID, 1, constLastedTaskID, lLastedTaskID)
end

-- --------------------------------------------------------------------------------------------------------------
-- 获得循环任务完成1次标志
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_GetCompetedLoopOnce(lActorID)
	return API_VarDataGetNumber(lActorID, 1, constCompetedLoopOnce)
end

-- --------------------------------------------------------------------------------------------------------------
-- 设置循环任务完成1次标志
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_SetCompetedLoopOnce(lActorID, lCompetedLoopOnce)
	API_VarDataSetNumber(lActorID, 1, constCompetedLoopOnce, lCompetedLoopOnce)
end

-- --------------------------------------------------------------------------------------------------------------
-- 设置完成的循环任务次数
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_GetLoopCount(lActorID)
	local lNum = LoopTask_GetFinishedLoopCount(lActorID)
	return (lNum + 1)
end

-- --------------------------------------------------------------------------------------------------------------
-- 循环任务的完成对象
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_IsHelperManOfDey(lActorID, lNPCID)
	if 11002==lNPCID or 11003==lNPCID then	
		return 1
	end
	return 0
end

-- --------------------------------------------------------------------------------------------------------------
-- 循环任务的完成对象
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_WriteDefaultTargetMonster(lActorID, lTaskID)
	local lCampId = API_GetActorCamp(lActorID)
	if 0==lCampId then
		API_VarDataSetNumber(lActorID, 0, lTaskID, 11002)
	else
		API_VarDataSetNumber(lActorID, 0, lTaskID, 11003)
	end
end

-- --------------------------------------------------------------------------------------------------------------
-- 循环任务之call functions
-- --------------------------------------------------------------------------------------------------------------
-- 传递公文
function LoopTask_DocTransfer(lActorID)	
	DocTransfer_TaskMain(lActorID)
end

-- 催缴税金
function LoopTask_LoopTaxMain(lActorID)
	LoopTax_TaskMain(lActorID)	
end

-- 募集物资
function LoopTask_GetGoodsMain(lActorID)
	LoopGetGoods_TaskMain(lActorID)	
end

-- 防守浮空岛配置入口
function LoopTask_Conspirator(lActorID)
	LoopTaskBastion_TaskMain(lActorID)
end

-- 战争的召唤配置入口
function LoopTask_WarCallup(lActorID)
	LoopTaskWarCallup_TaskMain(lActorID)
end
-- ------------------------------------------------------------------------------------------------
-- 结束配置!!!
-- ------------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------------------------------
-- 功勋奖励配置表
-- --------------------------------------------------------------------------------------------------------------
local constLoopTaskExpAwardConfig =
{
	10,24,34,35,37,37,38,38,38,41,
	41,41,42,42,42,42,43,43,43,47,
	47,47,48,48,50,51,51,52,52,52,
	52,53,53,53,57,57,57,57,58,61,
	61,61,61,61,62,62,62,62,62,71,
	71,72,72,72,76,71,72,72,72,76,
	71,72,72,72,76,71,72,72,72,76,
	71,72,72,72,76,71,72,72,72,76,
	71,72,72,72,76,71,72,72,72,76,
	71,72,72,72,76,71,72,72,72,76,
	71,72,72,72,76,71,72,72,72,76,
}

-- -------------------------------------------------------------------------------------------------------------
-- 计算奖励的功勋
-- -------------------------------------------------------------------------------------------------------------
function LoopTask_GetActorAwardExpValue(lActorID)

	local lAcceptedExpLevel = LoopTask_GetAcceptedExpLevel(lActorID)
	if lAcceptedExpLevel<1 then
		return 0
	end
	
	local lExpValue = 10
	local lAccpetedPeerageLevel = TaskPub_GetActorPeerageByExpLevel(lAcceptedExpLevel)
	if lAccpetedPeerageLevel<=table.getn(constLoopTaskExpAwardConfig) then
		lExpValue = constLoopTaskExpAwardConfig[lAccpetedPeerageLevel]
	else
		lExpValue = constLoopTaskExpAwardConfig[1]
	end
	
	lExpValue = lExpValue*10 + lAcceptedExpLevel*20
	
	return lExpValue
end

-- -------------------------------------------------------------------------------------------------------------
-- 奖励功勋
-- -------------------------------------------------------------------------------------------------------------
function LoopTask_AddActorAwardExpValue(lActorID,lTaskID,szDescription)
	local lExpValue = LoopTask_GetActorAwardExpValue(lActorID)
	if lExpValue>0 then
		API_ActorAddExp(lActorID, lExpValue, lTaskID, szDescription)
		TaskPub_SendSysMsg(lActorID,'完成'..szDescription..'任务,获得'..lExpValue..'的功勋奖励')
	end		
end

--  --------------------------------------------------------------------------------------------------------------
--   循环任务调用函数配置表
--  --------------------------------------------------------------------------------------------------------------
local lTabLoopTaskMains = 
{
	[2] = LoopTask_DocTransfer,
	[4] = LoopTask_LoopTaxMain,	
	[6] = LoopTask_GetGoodsMain,
	[20] = LoopTask_Conspirator,
	[21] = LoopTask_WarCallup
}

local lTabLoopTasks = 
{
	[1] = {2,4,6,20,21},
	[2] = {4,6,20,21,2},
	[3] = {6,20,21,2,4},
	[4] = {20,21,2,4,6},
	[5] = {21,2,4,6,20},
	[6] = {2,20,4,21,6},
	[7] = {4,20,2,6,21},
}

-- --------------------------------------------------------------------------------------------------------------
-- 根据级别取得任务表
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_GetTaskTable(lActorID)
	local lAcceptDays = LoopTask_GetLastedAcceptedDays(lActorID)
	local lMods = 7 - math.mod(lAcceptDays,7)
	return lTabLoopTasks[lMods]
end

-- ------------------------------------------------------------------------------------------------
-- 玩家可接受本任务的条件
-- ------------------------------------------------------------------------------------------------
function LoopTask_CanAcceptProc(lActorID,lMonsterID,lTaskID)
	local lExpLevel = API_GetActorExpLevel(lActorID)
	if lExpLevel < LoopTask_GetMustbeExpLevel(lActorID) then
		return 0
	end
	
	local lTaskState = API_VarDataGetNumber(lActorID, 1, 1)
	if 0==lTaskState then
		return 0
	end

	local lCurrentLoopNum = LoopTask_GetFinishedLoopCount(lActorID)
	local lDaysOfYear = LoopTask_GetCurrentDaysOfYear()
	local lLastedAcceptedDays = LoopTask_GetLastedAcceptedDays(lActorID)
	if lDaysOfYear==lLastedAcceptedDays and lCurrentLoopNum>=LoopTask_GetMaxAcceptedLoopNum(lActorID) then
		return 0
	end
	return 1	
end

-- ------------------------------------------------------------------------------------------------
-- 玩家接受任务的处理过程
-- ------------------------------------------------------------------------------------------------
function LoopTask_AcceptedLoopTask(lActorID, lTaskID)
	local lDaysOfYear = LoopTask_GetCurrentDaysOfYear()
	LoopTask_SetLastedAcceptedDays(lActorID, lDaysOfYear)
end

-- ------------------------------------------------------------------------------------------------
-- 玩家接受任务的处理过程
-- ------------------------------------------------------------------------------------------------
function LoopTask_FinishedLoopTask(lActorID, lTaskID,szDescription)
	-- 给奖励
	LoopTask_AddActorAwardExpValue(lActorID,lTaskID,szDescription)

	local lFinishedLoopNum = LoopTask_GetFinishedLoopCount(lActorID)
	lFinishedLoopNum = lFinishedLoopNum + 1
	LoopTask_SetFinishedLoopCount(lActorID, lFinishedLoopNum)
	
	local lDaysOfYear = LoopTask_GetCurrentDaysOfYear()
	LoopTask_SetLastedAcceptedDays(lActorID, lDaysOfYear)
	
	if lFinishedLoopNum<LoopTask_GetMaxAcceptedLoopNum(lActorID) then
		-- 开启循环任务
		LoopTask_GenATask(lActorID)		
	end	
end

-- ------------------------------------------------------------------------------------------------
-- 玩家接受任务的处理过程
-- ------------------------------------------------------------------------------------------------
function LoopTask_AcceptTaskProc(lActorID, lTaskID)
	-- 记录任务日志
	local lTaskLogPos = API_GetAEmptyTaskPos(lActorID)
	API_VarDataSetNumber(lActorID, 1, lTaskLogPos, lTaskID)

	-- 记录任务标志
	API_VarDataSetNumber(lActorID, 1, lTaskID, 1)
end

-- ------------------------------------------------------------------------------------------------
-- 玩家完成任务的处理过程
-- ------------------------------------------------------------------------------------------------
function LoopTask_FinishTaskProc(lActorID, lTaskID)
	-- 删除任务日志
	API_ClearTaskPos(lActorID, lTaskID)
	
	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, lTaskID, 0)
	API_VarDataSetNumber(lActorID, 0, lTaskID, 0)
		
	-- 删除客户端任务日志
	API_TaskLogRemove(lActorID, lTaskID)	
end

-- --------------------------------------------------------------------------------------------------------------
-- 玩家放弃任务是的处理过程
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_GiveupTaskProc(lActorID, lTaskID)
	-- 删除任务日志
	API_ClearTaskPos(lActorID, lTaskID)
	
	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, lTaskID, 0)
	API_VarDataSetNumber(lActorID, 0, lTaskID, 0)
		
	-- 删除客户端任务日志
	API_TaskLogRemove(lActorID, lTaskID)

	-- 保存配置数据
	local lDaysOfYear = LoopTask_GetCurrentDaysOfYear()
	LoopTask_SetLastedAcceptedDays(lActorID, lDaysOfYear)
	LoopTask_SetFinishedLoopCount(lActorID, LoopTask_GetMaxGiveupAcceptedLoopNum(lActorID))
	LoopTask_SetCompetedLoopOnce(lActorID, 0)
	
	--清除相关数据
	API_GiveupTask(lActorID, 1)	
end

-- -------------------------------------------------------------------------------------------------------------
-- 主线任务切换地图后处理过程框架
-- -------------------------------------------------------------------------------------------------------------
function LoopTask_LoginMapProc(lActorID)
	--  目前没有什么要处理的
end

-- --------------------------------------------------------------------------------------------------------------
-- 开始循环任务
-- --------------------------------------------------------------------------------------------------------------
function LoopTask_GenATask(lActorID)
	local lCurrentLoopNum = LoopTask_GetFinishedLoopCount(lActorID)
	if lCurrentLoopNum<0 or lCurrentLoopNum>=LoopTask_GetMaxAcceptedLoopNum(lActorID) then
		return
	end

	-- 取的任务表
	local lTaskTable = LoopTask_GetTaskTable(lActorID)
	local lNowTaskId = lTaskTable[lCurrentLoopNum+1]
	if nil~=lNowTaskId then
		local fpinit = lTabLoopTaskMains[lNowTaskId]
		if nil~=fpinit then
			LoopTask_SetLastedTaskID(lActorID,lNowTaskId)
			fpinit(lActorID)
		end	
	end
end
