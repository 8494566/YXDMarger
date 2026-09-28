-- --------------------------------------------------------------------------------------------------------------
-- 循环任务 - 催缴税金第一步
-- --------------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------------------------------
-- 循环任务 - 催缴税金第一步任务ID
-- 3016		： 要去催缴税金的NPCID
-- 3017~3020	： 保留
-- --------------------------------------------------------------------------------------------------------------
local constTaskID = 4

local constTargetID = 3016

local constNextTargetID = 3021

-- --------------------------------------------------------------------------------------------------------------
-- 催缴税金 目的NPC 配置表
-- --------------------------------------------------------------------------------------------------------------
local lTaxConfig_DG = {11014,11016,11018,11020,11022,11024,11008,11010,11264}
local lTaxConfig_LB = {11015,11017,11019,11021,11023,11025,11009,11011,11265}
local lTabLoopTaskTargetNpcID =
{
	[0] = lTaxConfig_DG,
	[1] = lTaxConfig_LB
}

--  --------------------------------------------------------------------------------------------------------------
-- 催缴税金配置入口
--  --------------------------------------------------------------------------------------------------------------
function LoopTax_TaskMain(lActorID)
	-- 取得玩家阵营
	local lTabTarNpcs = lTabLoopTaskTargetNpcID[0]
	local lCampId = API_GetActorCamp(lActorID)
	if 1==lCampId then
		lTabTarNpcs = lTabLoopTaskTargetNpcID[1]
	end

	-- 取得一个伪随机
	local lRandom = math.random(table.getn(lTabTarNpcs))

	-- 返回一个随机 NPC
	local lTarNpcId = lTabTarNpcs[lRandom]
	if lTarNpcId == nil then
		lTarNpcId = lTabTarNpcs[1]
	end
	
	-- 写入目的NPC
	API_VarDataSetNumber(lActorID, 1, constTargetID, lTarNpcId)
	API_VarDataSetNumber(lActorID, 0, constTaskID, lTarNpcId)
end

-- ----------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数
-- ----------------------------------------------------------------------------
function LoopTax_Title()

	-- 获取当前交互的玩家ID
	local lActorID = API_RequestGetActorID()

	-- 属于接受任务列表
	local lType = API_RequestGetNumber(1)
	if 2 == lType then
		LoopTax_TitleAccept(lActorID)

	-- 属于完成任务列表
	elseif 1 == lType then
		LoopTax_TitleFinish(lActorID)
		
	-- 属于还没有完成的任务列表
	elseif 3==lType then
		LoopTax_TitleUndone(lActorID)		
		
	end
	
end

-- ----------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- ----------------------------------------------------------------------------
function LoopTax_TitleAccept(lActorID)
	local lTarNpcId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local szName = API_GetMonsterNameByID(lTarNpcId)

	local szText = ''	
	szText = szText..'<text>  '..szName..'是个健忘的家伙，他已经连续几个月没有向国库缴纳税金，</text>'
	szText = szText..'<text>你立刻去通知他来缴税，如果他想逃税你可以通知警卫把他关进监狱。</text>'
	szText = szText..'<text>[点击界面</text><text color="255,0,0">右下角的龙卷风</text><text>，在</text><text color="255,0,0">传送服务</text><text>中你就知道那个健忘的家伙藏</text>'
	szText = szText..'<text>在哪里了，然后点击他</text><text color="255,0,0">所在的地方</text><text>就可以传送到目的地了，进入房间</text>'
	szText = szText..'<text>就可以找到那个健忘的家伙。]</text>'

	API_ResponseWrite(szText..'<br><br>')
	API_ResponseWrite('<a href="Task_SelectAccept?1='..constTaskID..'">    好的，我立刻通知他</a><br>')
	API_ResponseWrite('<a>    稍等，我现在很忙！</a><br>')
end

-- ----------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- ----------------------------------------------------------------------------
function LoopTax_TitleFinish(lActorID)
	API_ResponseWrite('<text>  天哪，我居然忘交了税金，实在是太抱歉了！')
	local lCampId = API_GetActorCamp(lActorID)
	if 0==lCampId then
		API_ResponseWrite('请你回去转告帝国枢密院长，我这就立刻差人送去。</text><br><br>')
	else
		API_ResponseWrite('请你回去转告联邦辅政官，我这就立刻差人送去。</text><br><br>')	
	end	
	API_ResponseWrite('<a href="Task_SelectFinish?1='..constTaskID..'">    好的！</a><br>')	
end

-- -------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(待完成)
-- -------------------------------------------------------------------------
function LoopTax_TitleUndone(lActorID)
	local lTarNpcId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local szName = API_GetMonsterNameByID(lTarNpcId)
	API_ResponseWrite('<text>难道你被'..szName..'贿赂了？怎么不见'..szName..'来缴税。</text>')
	API_ResponseWrite('<text color="255,0,0">[按任务“G”键可以看到详细任务资料]</text><br><br>')
	API_ResponseWrite('<a>    明白 </a><br>')
end

-- ----------------------------------------------------------------------------
-- 玩家可接受本任务的条件
-- ----------------------------------------------------------------------------
function LoopTax_CanAccept(lActorID, lNPCID)
	-- 如果没有开启循环任务，则不能领取
	if 0==LoopTask_CanAcceptProc(lActorID,lMonsterID,constTaskID) then
		return 0
	end	

	-- 如果要催缴的NPCID不存在，则不能领取
	local lTarNpcId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	if lTarNpcId == 0 then
		return 0
	end	
	return 1	
end

-- ----------------------------------------------------------------------------
-- 玩家可完成本任务的条件
-- ----------------------------------------------------------------------------
function LoopTax_CanFinish(lActorID, lNPCID)
	-- 如果不是催缴NPC，则不能完成
	local lTarNpcId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	if lNPCID ~= lTarNpcId then
		return 0
	end
	return 1	
end

-- -------------------------------------------------------------------------
-- 玩家准备放弃本任务的条件
-- -------------------------------------------------------------------------
function LoopTax_CanGiveup(lActorID, lNPCID)
	return 1	
end

-- ----------------------------------------------------------------------------
-- 玩家接受本任务时触发此函数
-- ----------------------------------------------------------------------------
function LoopTax_Accept(lActorID, lNPCID)

	-- 接受任务
	LoopTask_AcceptTaskProc(lActorID, constTaskID)

	-- 保存配置数据
	LoopTask_AcceptedLoopTask(lActorID, constTaskID)
	
	local lTarMonsterID = API_VarDataGetNumber(lActorID, 1, constTargetID)
	API_VarDataSetNumber(lActorID, 0, constTaskID, lTarMonsterID)	
	
	-- 刷新客户端任务日志
	LoopTax_UpdateLog(lActorID)
	
end

-- ----------------------------------------------------------------------------
-- 玩家完成本任务时触发此函数
-- ----------------------------------------------------------------------------
function LoopTax_Finish(lActorID, lNPCID)

	local lTargetID = API_VarDataGetNumber(lActorID, 1, constTargetID)
	API_VarDataSetNumber(lActorID, 1, constNextTargetID, lTargetID)

	-- 记录任务标志
	API_VarDataSetNumber(lActorID, 1, constTaskID, 2)
	
	-- 接受催缴任务下一步
	API_AcceptTask(lActorID, 5)

	-- 完成任务
	LoopTask_FinishTaskProc(lActorID, constTaskID)
	
	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	
end

-- ----------------------------------------------------------------------------
-- 玩家放弃本任务时触发此函数
-- ----------------------------------------------------------------------------
function LoopTax_Giveup(lActorID)

	-- 结束任务环
	LoopTask_GiveupTaskProc(lActorID, constTaskID)
	
	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	
end

-- ----------------------------------------------------------------------------
-- 玩家共享本任务时触发此函数
-- ----------------------------------------------------------------------------
function LoopTax_Share(lActorID)
end

-- ----------------------------------------------------------------------------
-- 玩家上线时本任务初始化触发此函数
-- ----------------------------------------------------------------------------
function LoopTax_Login(lActorID)

	DBG_TRACE("LoopTax_Login 1111111111111111")
	local lTarMonsterID = API_VarDataGetNumber(lActorID, 1, constTargetID)
	API_VarDataSetNumber(lActorID, 0, constTaskID, lTarMonsterID)
	
	DBG_TRACE("LoopTax_Login MonsterID = "..lTarMonsterID)
	
	LoopTax_UpdateLog(lActorID)

end

-- ----------------------------------------------------------------------------
-- 玩家下线时本任务结束处理触发此函数
-- ----------------------------------------------------------------------------
function LoopTax_Logout(lActorID)
end

-- ----------------------------------------------------------------------------
-- 刷新任务日志
-- ----------------------------------------------------------------------------
function LoopTax_UpdateLog(lActorID)
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
