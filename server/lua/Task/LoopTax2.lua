-- ----------------------------------------------------------------------------
-- 循环任务 - 催缴税金第二步：领取奖励
-- ----------------------------------------------------------------------------

-- ----------------------------------------------------------------------------
-- 循环任务 - 催缴税金第一步任务ID
-- 3021~3025	保留
-- ----------------------------------------------------------------------------
local constTaskID = 5

local constTargetID = 3021

-- ----------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数
-- ----------------------------------------------------------------------------
function LoopTax2_Title()

	-- 获取当前交互的玩家ID
	local lActorID = API_RequestGetActorID()

	-- 属于接受任务列表
	local lType = API_RequestGetNumber(1)
	if 2 == lType then
		API_Trace('LoopTax2_Title, 状态出错!')

	-- 属于完成任务列表
	elseif 1 == lType then
		LoopTax2_TitleFinish(lActorID)
	end
	
end

-- ----------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- ----------------------------------------------------------------------------
function LoopTax2_TitleFinish(lActorID)
	local lTarNpcId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local szName = API_GetMonsterNameByID(lTarNpcId)
	API_ResponseWrite('<text>    做得很好, 国库刚刚收到了'..szName..'缴纳的税金。这是给你的奖励！</text><br><br>')
	API_ResponseWrite('<a href="Task_SelectFinish?1='..constTaskID..'">    领奖！</a><br>')
end

-- ----------------------------------------------------------------------------
-- 玩家可接受本任务的条件
-- ----------------------------------------------------------------------------
function LoopTax2_CanAccept(lActorID, lNPCID)
	local lTaskState = API_VarDataGetNumber(lActorID, 1, 4)
	if lTaskState ~= 2 then
		return 0
	end
	return 1	
end

-- ----------------------------------------------------------------------------
-- 玩家可完成本任务的条件
-- ----------------------------------------------------------------------------
function LoopTax2_CanFinish(lActorID, lNPCID)
	-- 如果不是"总督"则不能完成
	if 0==LoopTask_IsHelperManOfDey(lActorID, lNPCID) then
		return 0
	end
	return 1	
end


-- -------------------------------------------------------------------------
-- 玩家准备放弃本任务的条件
-- -------------------------------------------------------------------------
function LoopTax2_CanGiveup(lActorID, lNPCID)
	return 1	
end

-- ----------------------------------------------------------------------------
-- 玩家接受本任务时触发此函数
-- ----------------------------------------------------------------------------
function LoopTax2_Accept(lActorID, lNPCID)
	-- 配置数据
	LoopTask_WriteDefaultTargetMonster(lActorID, constTaskID)

	-- 记录任务日志
	local lTaskLogPos = API_GetAEmptyTaskPos(lActorID)
	API_VarDataSetNumber(lActorID, 1, lTaskLogPos, constTaskID)
	
	-- 记录任务标志
	API_VarDataSetNumber(lActorID, 1, constTaskID, 1)	
	
	-- 刷新客户端任务日志
	LoopTax2_UpdateLog(lActorID)
	
end

-- ----------------------------------------------------------------------------
-- 玩家完成本任务时触发此函数
-- ----------------------------------------------------------------------------
function LoopTax2_Finish(lActorID, lNPCID)

	-- 删除任务日志
	API_ClearTaskPos(lActorID, constTaskID)
	
	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTaskID, 0)
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	
	-- 删除客户端任务日志
	API_TaskLogRemove(lActorID, constTaskID)

	-- 完成一个循环任务
	LoopTask_FinishedLoopTask(lActorID, constTaskID,'催缴税金')
	
end

-- ----------------------------------------------------------------------------
-- 玩家放弃本任务时触发此函数
-- ----------------------------------------------------------------------------
function LoopTax2_Giveup(lActorID)

	-- 结束任务环
	LoopTask_GiveupTaskProc(lActorID, constTaskID)

end

-- ----------------------------------------------------------------------------
-- 玩家共享本任务时触发此函数
-- ----------------------------------------------------------------------------
function LoopTax2_Share(lActorID)
end

-- ----------------------------------------------------------------------------
-- 玩家上线时本任务初始化触发此函数
-- ----------------------------------------------------------------------------
function LoopTax2_Login(lActorID)
	-- 配置数据
	LoopTask_WriteDefaultTargetMonster(lActorID, constTaskID)

	LoopTax2_UpdateLog(lActorID)
end

-- ----------------------------------------------------------------------------
-- 玩家下线时本任务结束处理触发此函数
-- ----------------------------------------------------------------------------
function LoopTax2_Logout(lActorID)
end

-- ----------------------------------------------------------------------------
-- 刷新任务日志
-- ----------------------------------------------------------------------------
function LoopTax2_UpdateLog(lActorID)
	local lLoopNum = LoopTask_GetLoopCount(lActorID)
	API_TaskLogUpdate(lActorID, constTaskID, 0, 0, '第' .. lLoopNum ..'次 催缴税金')
	
	local lTarNpcId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local szName = API_GetMonsterNameByID(lTarNpcId)

	local szText = ''	
	szText = szText..'<text>  '..szName..'是个健忘的家伙，他已经连续几个月没有向国库缴纳税金，</text>'
	szText = szText..'<text>你立刻去通知他来缴税，如果他想逃税你可以通知警卫把他关进监狱。</text>'
	szText = szText..'<text>[点击界面</text><text color="255,0,0">右下角的龙卷风</text><text>，在</text><text color="255,0,0">传送服务</text><text>中你就知道那个健忘的家伙藏</text>'
	szText = szText..'<text>在哪里了，然后点击他</text><text color="255,0,0">所在的地方</text><text>就可以传送到目的地了，进入房间</text>'
	szText = szText..'<text>就可以找到那个健忘的家伙。]</text>'	

	API_TaskLogUpdate(lActorID, constTaskID, 1, 1, szText)

	szText = '<text color="255,0,0">找到'..szName..'告诉他来缴税，</text>'
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
