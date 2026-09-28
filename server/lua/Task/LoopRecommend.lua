-- -------------------------------------------------------------------------
-- 循环任务 - 总督事务
-- 循环任务 - 总督事务任务ID
-- -------------------------------------------------------------------------
local constTaskID = 1

--  --------------------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数
--  --------------------------------------------------------------------------------------------------------------
function LoopRecommend_Title()

	-- 获取当前交互的玩家ID
	local lActorID = API_RequestGetActorID()

	-- 属于接受任务列表
	local lType = API_RequestGetNumber(1)
	if 2 == lType then
		LoopRecommend_TitleAccpet(lActorID)

	-- 属于完成任务列表
	elseif 1 == lType then
		LoopRecommend_TitleFinish(lActorID)

	-- 属于还没有完成的任务列表
	elseif 3==lType then
		LoopRecommend_TitleUndone(lActorID)
	end

end

-- -------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- -------------------------------------------------------------------------
function LoopRecommend_TitleAccpet(lActorID)
	local szCountryName = TaskPub_GetCountryName(lActorID)

	local szText = ''
	szText = szText..'<text>一座岛屿上总督的职权超过了大黑暗时代前的行政总督，因为</text>'
	szText = szText..'<text>他不仅管理着一座岛上所有殖民事务，而且还全权负责对同一</text>'
	szText = szText..'<text>岛屿上敌国势力的战争，管理着国家的大大小小的事务。我作为</text>'
	szText = szText..'<text>总督的助手，每天分派着各式各样的事务给'..szCountryName..'的</text>'
	szText = szText..'<text>子民，每天完成一轮总督事务可以使你的功勋得到很大的提升。</text>'

	API_ResponseWrite(szText..'<br><br>')

	API_ResponseWrite('<a href="Task_SelectAccept?1='..constTaskID..'">    好的，马上进行总督事务。 </a><br>')
	API_ResponseWrite('<a>    稍等，我现在忙。 </a><br>')

end

-- -------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- -------------------------------------------------------------------------
function LoopRecommend_TitleFinish(lActorID)
	API_ResponseWrite('<text>感谢你出色的完成了一轮事务，这些功勋奖励是对你为国家做出贡献的肯定。</text><br><br>')
	API_ResponseWrite('<a href="Task_SelectFinish?1='..constTaskID..'">    奖励 </a><br>')
end

-- -------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(待完成)
-- -------------------------------------------------------------------------
function LoopRecommend_TitleUndone(lActorID)
	API_ResponseWrite('<text>完成了当日的总督事务后将会使你的功勋得到很大的提高！</text><br><br>')
	API_ResponseWrite('<a>    明白 </a><br>')
end

-- -------------------------------------------------------------------------
-- 玩家可接受本任务的条件
-- -------------------------------------------------------------------------
function LoopRecommend_CanAccept(lActorID, lNPCID)

	local lExpLevel = API_GetActorExpLevel(lActorID)
	if lExpLevel<LoopTask_GetMustbeExpLevel(lActorID) then
		return 0
	end

	local lTaskStatus = API_VarDataGetNumber(lActorID, 1, constTaskID)
	if 0~=lTaskStatus then
		return 0
	end

	local lDaysOfYear = LoopTask_GetCurrentDaysOfYear()
	local lLastedAcceptedDays = LoopTask_GetLastedAcceptedDays(lActorID)
	local lCurrentLoopNum = LoopTask_GetFinishedLoopCount(lActorID)

	if lDaysOfYear==lLastedAcceptedDays then
		return 0
	elseif lDaysOfYear~=lLastedAcceptedDays then
		if 0~=lLastedAcceptedDays then
			if lCurrentLoopNum<LoopTask_GetMaxAcceptedLoopNum(lActorID) then
				return 0
			else
				-- 1
			end
		else
			-- 1
		end
	end

	return 1

end

-- -------------------------------------------------------------------------
-- 玩家可完成本任务的条件
-- -------------------------------------------------------------------------
function LoopRecommend_CanFinish(lActorID, lNPCID)
	-- 如果不是则不能完成
	if 0==LoopTask_IsHelperManOfDey(lActorID, lNPCID) then
		return 0
	end
	return LoopRecommend_MyCanFinish(lActorID)
end
function LoopRecommend_MyCanFinish(lActorID)
	local lTaskStatus = API_VarDataGetNumber(lActorID, 1, constTaskID)
	if 0==lTaskStatus then
		return 0
	end

	local lDaysOfYear = LoopTask_GetCurrentDaysOfYear()
	local lLastedAcceptedDays = LoopTask_GetLastedAcceptedDays(lActorID)
	local lCurrentLoopNum = LoopTask_GetFinishedLoopCount(lActorID)

	if lDaysOfYear==lLastedAcceptedDays and lCurrentLoopNum>=LoopTask_GetMaxAcceptedLoopNum(lActorID) and lCurrentLoopNum~=LoopTask_GetMaxGiveupAcceptedLoopNum(lActorID) then
		--
	else
		if lCurrentLoopNum>=LoopTask_GetMaxAcceptedLoopNum(lActorID) and lCurrentLoopNum~=LoopTask_GetMaxGiveupAcceptedLoopNum(lActorID) then
			--
		else
			return 0
		end
	end
	return 1
end

-- -------------------------------------------------------------------------
-- 玩家准备放弃本任务的条件
-- -------------------------------------------------------------------------
function LoopRecommend_CanGiveup(lActorID, lNPCID)
	return 1
end

-- -------------------------------------------------------------------------
-- 玩家接受本任务时触发此函数
-- -------------------------------------------------------------------------
function LoopRecommend_Accept(lActorID, lNPCID)

	-- 接受任务
	LoopTask_AcceptTaskProc(lActorID, constTaskID)

	-- 配置数据
	LoopTask_WriteDefaultTargetMonster(lActorID, constTaskID)

	--写入配置数据
	local lDaysOfYear = LoopTask_GetCurrentDaysOfYear()
	local lExpLevel = API_GetActorExpLevel(lActorID)
	LoopTask_SetLastedAcceptedDays(lActorID, lDaysOfYear)
	LoopTask_SetFinishedLoopCount(lActorID, 0)
	LoopTask_SaveAcceptedExpLevel(lActorID,lExpLevel)
	LoopTask_SetCompetedLoopOnce(lActorID, 0)

	-- 开启循环任务
	LoopTask_GenATask(lActorID)

	-- 刷新客户端任务日志
	LoopRecommend_UpdateLog(lActorID)

end

-- -------------------------------------------------------------------------
-- 玩家完成本任务时触发此函数
-- -------------------------------------------------------------------------
function LoopRecommend_Finish(lActorID, lNPCID)
	-- 给奖励
	LoopTask_AddActorAwardExpValue(lActorID,constTaskID,"总督事务")

	-- 清除任务
	LoopTask_FinishTaskProc(lActorID, constTaskID)

	-- 保存数据
	local lDaysOfYear = LoopTask_GetCurrentDaysOfYear()
	LoopTask_SetLastedAcceptedDays(lActorID, lDaysOfYear)
	LoopTask_SetCompetedLoopOnce(lActorID, 1)
	LoopTask_SetLastedTaskID(lActorID, 0)

end

-- -------------------------------------------------------------------------
-- 玩家放弃本任务时触发此函数
-- -------------------------------------------------------------------------
function LoopRecommend_Giveup(lActorID)

	-- 清除相关任务
	local lLastedTaskID = LoopTask_GetLastedTaskID(lActorID)
	DBG_TRACE('LoopRecommend_Giveup: LastedTaskID='..lLastedTaskID)
	if lLastedTaskID>0 then
		LoopTask_SetLastedTaskID(lActorID, 0)
		API_GiveupTask(lActorID, lLastedTaskID)
	end

	-- 删除任务日志
	API_ClearTaskPos(lActorID, constTaskID)

	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTaskID, 0)
	API_VarDataSetNumber(lActorID, 0, constTaskID, 0)

	-- 删除客户端任务日志
	API_TaskLogRemove(lActorID, constTaskID)

	-- 保存配置数据
	local lDaysOfYear = LoopTask_GetCurrentDaysOfYear()
	LoopTask_SetLastedAcceptedDays(lActorID, lDaysOfYear)
	LoopTask_SetFinishedLoopCount(lActorID, LoopTask_GetMaxGiveupAcceptedLoopNum(lActorID))
	LoopTask_SetCompetedLoopOnce(lActorID, 0)

end

-- -------------------------------------------------------------------------
-- 玩家共享本任务时触发此函数
-- -------------------------------------------------------------------------
function LoopRecommend_Share(lActorID)
end

-- -------------------------------------------------------------------------
-- 玩家上线时本任务初始化触发此函数
-- -------------------------------------------------------------------------
function LoopRecommend_Login(lActorID)

	LoopTask_WriteDefaultTargetMonster(lActorID, constTaskID)

	LoopRecommend_UpdateLog(lActorID)
end

-- -------------------------------------------------------------------------
-- 玩家下线时本任务结束处理触发此函数
-- -------------------------------------------------------------------------
function LoopRecommend_Logout(lActorID)
end

-- -------------------------------------------------------------------------
-- 刷新任务日志
-- -------------------------------------------------------------------------
function LoopRecommend_UpdateLog(lActorID)
	API_TaskLogUpdate(lActorID, constTaskID, 0, 0, '总督事务')
	local szCountryName = TaskPub_GetCountryName(lActorID)

	local szText = ''
	szText = szText..'<text>一座岛屿上总督的职权超过了大黑暗时代前的行政总督，因为</text>'
	szText = szText..'<text>他不仅管理着一座岛上所有殖民事务，而且还全权负责对同一</text>'
	szText = szText..'<text>岛屿上敌国势力的战争，管理着国家的大大小小的事务。我作为</text>'
	szText = szText..'<text>总督的助手，每天分派着各式各样的事务给'..szCountryName..'的</text>'
	szText = szText..'<text>子民，每天完成一轮总督事务可以使你的功勋得到很大的提升。</text>'
	API_TaskLogUpdate(lActorID, constTaskID, 1, 1, szText)

	szText = '<text>完成当日的总督事务，总督事务中包含：紧急公文、催缴税金、募集物资、抵抗黑暗势力和战争的召唤。</text>'
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
