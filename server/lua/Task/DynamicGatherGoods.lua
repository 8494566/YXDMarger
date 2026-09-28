-- ------------------------------------------------------------------------------------------------
-- 任务模板
-- ------------------------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------------------------
-- 动态任务 - 收集微型生命药水 - 数据配置
-- ------------------------------------------------------------------------------------------------
--  第一步任务ID
local constTaskID = 2001
-- 13001~13005：保留

-- ------------------------------------------------------------------------------------------------
-- 常量定义
-- ------------------------------------------------------------------------------------------------
-- 微型生命药水的ID
local constSHP_ID = 101
local constSHP_Num = 5

-- -------------------------------
-- 玩家选择本任务标题后触发此函数
-- -------------------------------
function DynamicGatherGoods_Title()
	local lType = API_RequestGetNumber(1)	-- 1: 属于可完成任务; 2: 属于可接受任务;

	-- 属于接受任务列表
	if 2 == lType then
		DynamicGatherGoods_TitleAccept()

	-- 属于完成任务列表
	elseif 1 == lType then
		DynamicGatherGoods_TitleFinish()
	end
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- ------------------------------------------------------------------------------------------------
function DynamicGatherGoods_TitleAccept()
	API_ResponseWrite('<text> 治疗药物是生活必需品，您愿意帮我收集'..constSHP_Num..'个微型生命药水吗？</text><br><br>')
	API_ResponseWrite('<a href="DynamicGatherGoods_WantAccept">  接受这个任务 </a><br><br>')
	API_ResponseWrite('<a>                              关闭窗口</a>')
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- ------------------------------------------------------------------------------------------------
function DynamicGatherGoods_TitleFinish()
	API_ResponseWrite('<text> 您已收集好'..constSHP_Num..'个微型生命药水吗？</text><br><br>')
	API_ResponseWrite('<a href="DynamicGatherGoods_WantFinish">  完成这个任务 </a><br><br>')
	API_ResponseWrite('<a>                              关闭窗口</a>')
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- ------------------------------------------------------------------------------------------------
function DynamicGatherGoods_WantAccept()
	local lActorID = API_RequestGetActorID()
	API_AcceptTask(lActorID, constTaskID)
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- ------------------------------------------------------------------------------------------------
function DynamicGatherGoods_WantFinish()
	local lActorID = API_RequestGetActorID()
	API_FinishTask(lActorID, constTaskID)
end

-- -----------------------
-- 玩家可接受本任务的条件
-- -----------------------
function DynamicGatherGoods_CanAccept(lActorID, lNPCID)
	-- 返回0表示不可以接受, 返回1表示可以接受
	return 1
end

-- -----------------------
-- 玩家可完成本任务的条件
-- -----------------------
function DynamicGatherGoods_CanFinish(lActorID, lNPCID)
	-- 返回0表示不可以接受, 返回1表示可以完成
	local GoodsNum = API_ActorGetGoodsNum(lActorID, constSHP_ID)
	if GoodsNum >= constSHP_Num then
		return 1
	else
		return 0
	end
end

-- -------------------------------------------------------------------------
-- 玩家准备放弃本任务的条件
-- -------------------------------------------------------------------------
function DynamicGatherGoods_CanGiveup(lActorID, lNPCID)
	return 1
end

-- ---------------------------
-- 玩家接受本任务时触发此函数
-- ---------------------------
function DynamicGatherGoods_Accept(lActorID, lNPCID)

	-- 记录任务日志
	local lTaskLogPos = API_GetAEmptyTaskPos(lActorID)
	API_VarDataSetNumber(lActorID, 1, lTaskLogPos, constTaskID)

	-- 记录任务标志
	API_VarDataSetNumber(lActorID, 1, constTaskID, 1)

	-- 刷新客户端任务日志
	DynamicGatherGoods_UpdateLog(lActorID)
end

-- ---------------------------
-- 玩家完成本任务时触发此函数
-- ---------------------------
function DynamicGatherGoods_Finish(lActorID, lNPCID)

	-- 删除任务需要的物品：微型生命药水，失败则返回
	if not API_ActorRemoveGoods(lActorID, constSHP_ID, constSHP_Num,"收集药水") then
		return
	end

	-- 奖励
	API_ActorAddMoney(lActorID, constSHP_Num, constTaskID, '收集微型生命药水的奖励')
	API_ActorSendMsg(lActorID, 2, '您成功完成任务，获得了'..constSHP_Num..'金币的奖励')

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
function DynamicGatherGoods_Giveup(lActorID)

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
function DynamicGatherGoods_Share(lActorID)
end

-- --------------------------------
-- 玩家上线时本任务初始化触发此函数
-- --------------------------------
function DynamicGatherGoods_Login(lActorID)

	-- 刷新客户端任务日志
	DynamicGatherGoods_UpdateLog(lActorID)
end

-- ----------------------------------
-- 玩家下线时本任务结束处理触发此函数
-- ----------------------------------
function DynamicGatherGoods_Logout(lActorID)
end

-- ----------------------------------------------------------------------------
-- 刷新任务日志
-- ----------------------------------------------------------------------------
function DynamicGatherGoods_UpdateLog(lActorID)
	API_TaskLogUpdate(lActorID, constTaskID, 0, 0, '动态任务测试：收集微型生命药水')
	API_TaskLogUpdate(lActorID, constTaskID, 0, 1, '<text>收集'..constSHP_Num..'个微型生命药水</text><br>')
end