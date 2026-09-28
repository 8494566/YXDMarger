-- --------
-- 任务模板
-- --------

-- ------------------------------------------------------------------------------------------------
-- 动态任务 - 功勋成长 - 数据配置
-- ------------------------------------------------------------------------------------------------
--  第一步任务ID
local constTaskID = 2002

-- 13006：记录玩家接任务时的功勋数量
local constOldE_Key = 13006
--  13007~13010：保留

-- ------------------------------------------------------------------------------------------------
-- 常量定义
-- ------------------------------------------------------------------------------------------------
-- 需要成长的功勋数量
local constGrowUp_E = 50
local constExp_Flag = 181

-- -------------------------------
-- 玩家选择本任务标题后触发此函数
-- -------------------------------
function DynamicGrowUp_Title()
	local lType = API_RequestGetNumber(1)	-- 1: 属于可完成任务; 2: 属于可接受任务;

	-- 属于接受任务列表
	if 2 == lType then
		DynamicGrowUp_TitleAccept()

	-- 属于完成任务列表
	elseif 1 == lType then
		DynamicGrowUp_TitleFinish()
	end
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- ------------------------------------------------------------------------------------------------
function DynamicGrowUp_TitleAccept()
	API_ResponseWrite('<text> 我们成长的速度落后于敌对阵营了，无论如何，成长是一件好事，您愿意立即去获得'..constGrowUp_E..'功勋吗？</text><br><br>')
	API_ResponseWrite('<a href="DynamicGrowUp_WantAccept">  接受这个任务 </a><br><br>')
	API_ResponseWrite('<a>                              关闭窗口</a>')
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- ------------------------------------------------------------------------------------------------
function DynamicGrowUp_TitleFinish()
	-- API_ResponseWrite('<text> 您已获得'..constGrowUp_E..'功勋吗？</text><br><br>')
	API_ResponseWrite('<a href="DynamicGrowUp_WantFinish">  完成这个任务 </a><br><br>')
	API_ResponseWrite('<a>                              关闭窗口</a>')
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- ------------------------------------------------------------------------------------------------
function DynamicGrowUp_WantAccept()
	local lActorID = API_RequestGetActorID()
	API_AcceptTask(lActorID, constTaskID)
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- ------------------------------------------------------------------------------------------------
function DynamicGrowUp_WantFinish()
	local lActorID = API_RequestGetActorID()
	API_FinishTask(lActorID, constTaskID)
end

-- -----------------------
-- 玩家可接受本任务的条件
-- -----------------------
function DynamicGrowUp_CanAccept(lActorID, lNPCID)
	-- 返回0表示不可以接受, 返回1表示可以接受

	return 1
end

-- -----------------------
-- 玩家可完成本任务的条件
-- -----------------------
function DynamicGrowUp_CanFinish(lActorID, lNPCID)

	-- 返回0表示不可以接受, 返回1表示可以完成
	-- local NowE = API_GetActorCurExp(lActorID)
	local NowE = API_ActorGetPropNum(lActorID, constExp_Flag)
	local OldE = API_VarDataGetNumber(lActorID, 1, constOldE_Key)
	if (NowE - OldE) >= constGrowUp_E then
		return 1
	else
		return 0
	end
end

-- -------------------------------------------------------------------------
-- 玩家准备放弃本任务的条件
-- -------------------------------------------------------------------------
function DynamicGrowUp_CanGiveup(lActorID, lNPCID)
	return 1
end

-- ---------------------------
-- 玩家接受本任务时触发此函数
-- ---------------------------
function DynamicGrowUp_Accept(lActorID, lNPCID)

	-- 记录任务日志
	local lTaskLogPos = API_GetAEmptyTaskPos(lActorID)
	API_VarDataSetNumber(lActorID, 1, lTaskLogPos, constTaskID)

	-- 记录任务标志
	API_VarDataSetNumber(lActorID, 1, constTaskID, 1)

	-- 记录接任务时的功勋数量
	--local OldE = API_GetActorCurExp(lActorID)
	local OldE = API_ActorGetPropNum(lActorID, constExp_Flag)
	API_VarDataSetNumber(lActorID, 1, constOldE_Key, OldE)

	-- 刷新客户端任务日志
	DynamicGrowUp_UpdateLog(lActorID)
end

-- ---------------------------
-- 玩家完成本任务时触发此函数
-- ---------------------------
function DynamicGrowUp_Finish(lActorID, lNPCID)

	-- 奖励
	API_ActorAddMoney(lActorID, constGrowUp_E, constTaskID, '功勋成长的奖励')
	API_ActorSendMsg(lActorID, 2, '您成功完成任务，获得了'..constGrowUp_E..'金币的奖励')

	-- 删除任务日志
	API_ClearTaskPos(lActorID, constTaskID)

	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTaskID, 0)

	-- 删除客户端任务日志
	API_TaskLogRemove(lActorID, constTaskID)
end

-- ---------------------------
-- 玩家放弃本任务时触发此函数
-- ---------------------------
function DynamicGrowUp_Giveup(lActorID)

	-- 删除任务日志
	API_ClearTaskPos(lActorID, constTaskID)

	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTaskID, 0)

	-- 删除客户端任务日志
	API_TaskLogRemove(lActorID, constTaskID)
end

-- ---------------------------
-- 玩家共享本任务时触发此函数
-- ---------------------------
function DynamicGrowUp_Share(lActorID)
end

-- --------------------------------
-- 玩家上线时本任务初始化触发此函数
-- --------------------------------
function DynamicGrowUp_Login(lActorID)

	-- 刷新客户端任务日志
	DynamicGrowUp_UpdateLog(lActorID)
end

-- ----------------------------------
-- 玩家下线时本任务结束处理触发此函数
-- ----------------------------------
function DynamicGrowUp_Logout(lActorID)
end

-- ----------------------------------------------------------------------------
-- 刷新任务日志
-- ----------------------------------------------------------------------------
function DynamicGrowUp_UpdateLog(lActorID)
	API_TaskLogUpdate(lActorID, constTaskID, 0, 0, '动态任务测试：功勋成长')

	local OldE = API_VarDataGetNumber(lActorID, 1, constOldE_Key)
	API_TaskLogUpdate(lActorID, constTaskID, 0, 1, '<text>立即去获得'..constGrowUp_E..'功勋</text><br><br><text>您接任务时的功勋为：'..OldE..'</text>')
end