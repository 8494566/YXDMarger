-- --------
-- 任务模板
-- --------

-- ------------------------------------------------------------------------------------------------
-- 动态任务 - 剿灭【土族剑手1】 - 数据配置
-- ------------------------------------------------------------------------------------------------
--  第一步任务ID
local constTaskID = 2003

-- 13011：记录玩家杀死怪物的数目
local constM_Num_Key = 13011
-- 13011~13015：保留

-- ------------------------------------------------------------------------------------------------
-- 常量定义
-- ------------------------------------------------------------------------------------------------
-- 要杀怪物的ID和数量
local constM_ID = 3001
local constM_Num = 10

-- -------------------------------
-- 玩家选择本任务标题后触发此函数
-- -------------------------------
function DynamicKillMonster_Title()
	local lType = API_RequestGetNumber(1)	-- 1: 属于可完成任务; 2: 属于可接受任务;

	-- 属于接受任务列表
	if 2 == lType then
		DynamicKillMonster_TitleAccept()

	-- 属于完成任务列表
	elseif 1 == lType then
		DynamicKillMonster_TitleFinish()
	end
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- ------------------------------------------------------------------------------------------------
function DynamicKillMonster_TitleAccept()

	-- 取NPC名称
	local szName = API_GetMonsterNameByID(constM_ID)

	API_ResponseWrite('<text> 由于去防守浮空岛的人太少，【'..szName..'】越发猖狂了，您愿意帮我剿灭'..constM_Num..'个【'..szName..'】吗？</text><br><br>')
	API_ResponseWrite('<a href="DynamicKillMonster_WantAccept">  接受这个任务 </a><br><br>')
	API_ResponseWrite('<a>                              关闭窗口</a>')
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- ------------------------------------------------------------------------------------------------
function DynamicKillMonster_TitleFinish()

	-- 取NPC名称
	local szName = API_GetMonsterNameByID(constM_ID)

	API_ResponseWrite('<text> 您已剿灭'..constM_Num..'个【'..szName..'】吗？</text><br><br>')
	API_ResponseWrite('<a href="DynamicKillMonster_WantFinish">  完成这个任务 </a><br><br>')
	API_ResponseWrite('<a>                              关闭窗口</a>')
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- ------------------------------------------------------------------------------------------------
function DynamicKillMonster_WantAccept()
	local lActorID = API_RequestGetActorID()
	API_AcceptTask(lActorID, constTaskID)
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- ------------------------------------------------------------------------------------------------
function DynamicKillMonster_WantFinish()
	local lActorID = API_RequestGetActorID()
	API_FinishTask(lActorID, constTaskID)
end

-- -----------------------
-- 玩家可接受本任务的条件
-- -----------------------
function DynamicKillMonster_CanAccept(lActorID, lNPCID)
	-- 返回0表示不可以接受, 返回1表示可以接受
	return 1
end

-- -----------------------
-- 玩家可完成本任务的条件
-- -----------------------
function DynamicKillMonster_CanFinish(lActorID, lNPCID)

	-- 返回0表示不可以接受, 返回1表示可以完成
	local KillM_Num = API_VarDataGetNumber(lActorID, 1, constM_Num_Key)
	if KillM_Num >= constM_Num then
		return 1
	else
		return 0
	end
end

-- -------------------------------------------------------------------------
-- 玩家准备放弃本任务的条件
-- -------------------------------------------------------------------------
function DynamicKillMonster_CanGiveup(lActorID, lNPCID)
	return 1
end

-- ---------------------------
-- 玩家接受本任务时触发此函数
-- ---------------------------
function DynamicKillMonster_Accept(lActorID, lNPCID)

	-- 记录任务日志
	local lTaskLogPos = API_GetAEmptyTaskPos(lActorID)
	API_VarDataSetNumber(lActorID, 1, lTaskLogPos, constTaskID)

	-- 记录任务标志
	API_VarDataSetNumber(lActorID, 1, constTaskID, 1)

	-- 创建杀怪触发器
	API_CreateKillMonsterTrigger(lActorID, constM_ID, constM_Num, 0, 0, constTaskID, 'DynamicKillMonster_OnKillM')

	-- 刷新客户端任务日志
	DynamicKillMonster_UpdateLog(lActorID)
end

-- ---------------------------
-- 杀怪触发器的回调函数
-- ---------------------------
function DynamicKillMonster_OnKillM(lActorID, lTaskID, lMonsterID)

	-- 保存杀死的npc数量
	if lMonsterID ~= constM_ID then
		return
	end

	local lKillNum = API_VarDataGetNumber(lActorID, 1, constM_Num_Key)

	lKillNum = lKillNum + 1
	API_VarDataSetNumber(lActorID, 1, constM_Num_Key, lKillNum)

	-- 刷新客户端任务日志
	DynamicKillMonster_UpdateLog(lActorID)
end

-- ---------------------------
-- 玩家完成本任务时触发此函数
-- ---------------------------
function DynamicKillMonster_Finish(lActorID, lNPCID)

	-- 取NPC名称
	local szName = API_GetMonsterNameByID(constM_ID)

	-- 奖励
	API_ActorAddMoney(lActorID, constM_Num, constTaskID, '剿灭【'..szName..'】的奖励')
	API_ActorSendMsg(lActorID, 2, '您成功完成任务，获得了'..constM_Num..'金币的奖励')

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
function DynamicKillMonster_Giveup(lActorID)

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
function DynamicKillMonster_Share(lActorID)
end

-- --------------------------------
-- 玩家上线时本任务初始化触发此函数
-- --------------------------------
function DynamicKillMonster_Login(lActorID)

	-- 刷新客户端任务日志
	DynamicKillMonster_UpdateLog(lActorID)

	-- 杀怪数量不够则开启杀怪触发器
	local KillM_Num = API_VarDataGetNumber(lActorID, 1, constM_Num_Key)
	if KillM_Num >= constM_Num then
		return
	end

	local NeedKillM_Num = (constM_Num - KillM_Num)
	API_CreateKillMonsterTrigger(lActorID, constM_ID, NeedKillM_Num, 0, 0, constTaskID, 'DynamicKillMonster_OnKillM')
end

-- ----------------------------------
-- 玩家下线时本任务结束处理触发此函数
-- ----------------------------------
function DynamicKillMonster_Logout(lActorID)
end

-- ----------------------------------------------------------------------------
-- 刷新任务日志
-- ----------------------------------------------------------------------------
function DynamicKillMonster_UpdateLog(lActorID)

	-- 取NPC名称
	local szName = API_GetMonsterNameByID(constM_ID)
	local lKillNum = API_VarDataGetNumber(lActorID, 1, constM_Num_Key)

	API_TaskLogUpdate(lActorID, constTaskID, 0, 0, '动态任务测试：剿灭【'..szName..'】')
	API_TaskLogUpdate(lActorID, constTaskID, 0, 1, '<text>需要剿灭'..constM_Num..'个【'..szName..'】</text><br><br><text>当前已剿灭'..lKillNum..'个</text>')
end