-- -----------------------------------------------------------------------------------
-- 循环任务 - 紧急公文第二步:领取奖励
-- -----------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------
-- 循环任务 - 紧急公文第二步任务ID
-- 3011~3015
-- -----------------------------------------------------------------------------------
local constTaskID = 3

local constTargetID = 3011

-- -----------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数
-- -----------------------------------------------------------------------------------
function LoopDocTransfer2_Title()

	-- 获取当前交互的玩家ID
	local lActorID = API_RequestGetActorID()

	-- 属于接受任务列表
	local lType = API_RequestGetNumber(1)
	if 2 == lType then
		API_Trace('LoopDocTransfer2_Title, 状态出错!')

	-- 属于完成任务列表
	elseif 1 == lType then
		LoopDocTransfer2_TitleFinish(lActorID)
	end
	
end

-- -----------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- -----------------------------------------------------------------------------------
function LoopDocTransfer2_TitleFinish(lActorID)
	API_ResponseWrite('<text>    我说得没错吧，送公文是件很简单的事。</text><br><br>')
	API_ResponseWrite('<a href="Task_SelectFinish?1='..constTaskID..'">    领奖！</a><br>')	
end

-- -----------------------------------------------------------------------------------
-- 玩家可接受本任务的条件
-- -----------------------------------------------------------------------------------
function LoopDocTransfer2_CanAccept(lActorID, lNPCID)
	local lTaskState = API_VarDataGetNumber(lActorID, 1, 2)
	if lTaskState ~= 2 then
		return 0
	end
	return 1	
end

-- -----------------------------------------------------------------------------------
-- 玩家可完成本任务的条件
-- -----------------------------------------------------------------------------------
function LoopDocTransfer2_CanFinish(lActorID, lNPCID)
	-- 如果不是"总督"则不能完成
	if 0==LoopTask_IsHelperManOfDey(lActorID, lNPCID) then
		return 0
	end
	return 1	
end

-- -------------------------------------------------------------------------
-- 玩家准备放弃本任务的条件
-- -------------------------------------------------------------------------
function LoopDocTransfer2_CanGiveup(lActorID, lNPCID)
	return 1	
end

-- -----------------------------------------------------------------------------------
-- 玩家接受本任务时触发此函数
-- -----------------------------------------------------------------------------------
function LoopDocTransfer2_Accept(lActorID, lNPCID)
	-- 配置数据
	LoopTask_WriteDefaultTargetMonster(lActorID, constTaskID)

	-- 记录任务日志
	local lTaskLogPos = API_GetAEmptyTaskPos(lActorID)
	API_VarDataSetNumber(lActorID, 1, lTaskLogPos, constTaskID)
	
	-- 记录任务标志
	API_VarDataSetNumber(lActorID, 1, constTaskID, 1)
	
	-- 刷新客户端任务日志
	LoopDocTransfer2_UpdateLog(lActorID)
	
end

-- -----------------------------------------------------------------------------------
-- 玩家完成本任务时触发此函数
-- -----------------------------------------------------------------------------------
function LoopDocTransfer2_Finish(lActorID, lNPCID)
	-- 删除任务日志
	API_ClearTaskPos(lActorID, constTaskID)
	
	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTaskID, 0)
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)

	-- 删除客户端任务日志
	API_TaskLogRemove(lActorID, constTaskID)
	
	-- 完成一个循环任务
	LoopTask_FinishedLoopTask(lActorID, constTaskID,'紧急公文')	
end

-- -----------------------------------------------------------------------------------
-- 玩家放弃本任务时触发此函数
-- -----------------------------------------------------------------------------------
function LoopDocTransfer2_Giveup(lActorID)
	-- 结束任务环
	LoopTask_GiveupTaskProc(lActorID, constTaskID)	
end

-- -----------------------------------------------------------------------------------
-- 玩家共享本任务时触发此函数
-- -----------------------------------------------------------------------------------
function LoopDocTransfer2_Share(lActorID)
end

-- -----------------------------------------------------------------------------------
-- 玩家上线时本任务初始化触发此函数
-- -----------------------------------------------------------------------------------
function LoopDocTransfer2_Login(lActorID)
	-- 配置数据
	LoopTask_WriteDefaultTargetMonster(lActorID, constTaskID)
	
	LoopDocTransfer2_UpdateLog(lActorID)
end

-- -----------------------------------------------------------------------------------
-- 玩家下线时本任务结束处理触发此函数
-- -----------------------------------------------------------------------------------
function LoopDocTransfer2_Logout(lActorID)
end

-- -----------------------------------------------------------------------------------
-- 刷新任务日志
-- -----------------------------------------------------------------------------------
function LoopDocTransfer2_UpdateLog(lActorID)
	local lLoopNum = LoopTask_GetLoopCount(lActorID)
	API_TaskLogUpdate(lActorID, constTaskID, 0, 0, '第' .. lLoopNum ..'次 紧急公文')
	
	local lTarNpcId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local szName = API_GetMonsterNameByID(lTarNpcId)

	local szText = ''	
	szText = szText..'<text>这是总督亲笔签名的紧急公文，你必须在最短的时间里</text>'
	szText = szText..'<text>亲手交付到'..szName..'手里，这份公文关系到国家的安危。[点击</text>'
	szText = szText..'<text>界面</text><text color="255,0,0">右下角的龙卷风</text><text>，在</text><text color="255,0,0">传送服务</text><text>中你就可以知道他的</text>'
	szText = szText..'<text>所在地了，然后点击</text><text color="255,0,0">黄颜色</text><text>的目标名，进入房间就可以</text>'
	szText = szText..'<text>找到那个收公文的人了。]</text>'
	API_TaskLogUpdate(lActorID, constTaskID, 1, 1, szText)
	
	szText = '<text color="255,0,0">将公文安全送抵'..szName..'手里，</text>'
	local lCampId = API_GetActorCamp(lActorID)
	if 0==lCampId then
		szText = szText..'<text>完成后回到帝国枢密院长领取奖励。</text>'
	else
		szText = szText..'<text>完成后回到联邦辅政官领取奖励。</text>'
	end	
	API_TaskLogUpdate(lActorID, constTaskID, 1, 2, szText)
	
	local lExpValue = LoopTask_GetActorAwardExpValue(lActorID)
	szText = '<text>'..lExpValue..'功勋。</text>'
	API_TaskLogUpdate(lActorID, constTaskID, 1, 3, szText)
end
