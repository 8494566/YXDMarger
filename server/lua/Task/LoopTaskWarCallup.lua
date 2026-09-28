-- ---------------------------------------------------------------------------------------
-- 循环任务 - 战争的召唤 ID = 21
-- 3101		保留
-- 3102		接任务时的爵位等级
-- 3103~3015	保留
-- ---------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------
local constTaskID = 21

local constTargetID = 3101
local constPeerageLevel = 3102

-- --------------------------------------------------------------------------------------------------------------
-- 目标物品配置
-- --------------------------------------------------------------------------------------------------------------
local constWarCall_GoodsID = {80258,80363,80363,80365,80365,80367,80367,80369,80369,80364,80366,80368,80370}

-- 最大配置爵位
local constMaxPeerageLevel = 9

--  --------------------------------------------------------------------------------------------------------------
-- 是否有目标勋章
--  --------------------------------------------------------------------------------------------------------------
function LoopTaskWarCallup_ExistGoods(lActorID)
	local lPeerageLevel = API_VarDataGetNumber(lActorID, 1, constPeerageLevel)
	if lPeerageLevel<1 then
		lPeerageLevel = 1
	elseif lPeerageLevel>constMaxPeerageLevel then
		lPeerageLevel = constMaxPeerageLevel
	end	
	for nPeerageLevel,nGoodsID in pairs(constWarCall_GoodsID) do
		if nPeerageLevel>=lPeerageLevel then
			local lGoodsNum = API_ActorGetGoodsNum(lActorID, nGoodsID)
			if lGoodsNum>0 then
				return nGoodsID
			end
		end
	end
	return 0
end

--  --------------------------------------------------------------------------------------------------------------
-- 战争的召唤配置入口
--  --------------------------------------------------------------------------------------------------------------
function LoopTaskWarCallup_TaskMain(lActorID)
	-- 记录要收集的物品
	API_VarDataSetNumber(lActorID, 1, constTargetID, 1)
	API_VarDataSetNumber(lActorID, 1, constPeerageLevel, 0)
end

-- ---------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数
-- ---------------------------------------------------------------------------------------
function LoopTaskWarCallup_Title()
	-- 获取当前交互的玩家ID
	local lActorID = API_RequestGetActorID()

	-- 属于接受任务列表
	local lType = API_RequestGetNumber(1)
	if 2 == lType then
		LoopTaskWarCallup_TitleAccpet(lActorID)
	-- 属于完成任务列表
	elseif 1 == lType then
		LoopTaskWarCallup_TitleFinish(lActorID)
	-- 属于还没有完成的任务列表
	elseif 3==lType then
		LoopTaskWarCallup_TitleUndone(lActorID)
	end
end

-- ---------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- ---------------------------------------------------------------------------------------
function LoopTaskWarCallup_TitleAccpet(lActorID)
	local szActorName = API_GetActorName(lActorID)
	local szPeerageName = TaskPub_GetActorPeerageName(lActorID)
	local szNameWar = TaskPub_GetCountryNameOfWar(lActorID)
	local szCountryName = TaskPub_GetCountryName(lActorID)

	local szText = ''
	szText = szText..'<text>'..szActorName..'，在拉锯战场中的战事开展的日况激烈。勇士！拿起你手中</text>'
	szText = szText..'<text>的正义之剑去捍卫领土的完整吧！在拉锯战中获得一枚突击勋章。</text>'
	szText = szText..'<text>[</text><text color="255,0,0">出城后</text><text>，点击界面中的</text><text color="255,0,0">右下角的龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">'..szPeerageName..'传送塔</text><text>，</text>'
	szText = szText..'<text>到达'..szPeerageName..'传送塔后，进入塔楼，在塔楼中就可以找到</text><text color="255,0,0">拉锯战传送阵</text><text>，</text>'
	szText = szText..'<text>与拉锯战传送师对话，你就可以参加战斗了。]</text>'

	API_ResponseWrite(szText..'<br><br>')

	API_ResponseWrite('<a href="Task_SelectAccept?1='..constTaskID..'">    好的，立刻去！</a><br>')
	API_ResponseWrite('<a>    稍等，现在没空！</a><br>')
end

-- ---------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- ---------------------------------------------------------------------------------------
function LoopTaskWarCallup_TitleFinish(lActorID)
	API_ResponseWrite('<text>做得很好，这是给你的奖励 </text><br><br>')

	local lExpValue = LoopTask_GetActorAwardExpValue(lActorID)
	API_ResponseWrite('<text>功勋  ×'..lExpValue..'</text><br>')

	API_ResponseWrite('<a href="Task_SelectFinish?1='..constTaskID..'">                确定 </a><br>')
end

-- -------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(待完成)
-- -------------------------------------------------------------------------
function LoopTaskWarCallup_TitleUndone(lActorID)
	API_ResponseWrite('<text>赶紧去在拉锯战中获得一枚突击勋章。</text><br><br>')
	API_ResponseWrite('<a>    明白 </a><br>')
end

-- ---------------------------------------------------------------------------------------
-- 玩家可接受本任务的条件
-- ---------------------------------------------------------------------------------------
function LoopTaskWarCallup_CanAccept(lActorID, lNPCID)
	-- 如果没有开启循环任务，则不能领取
	if 0==LoopTask_CanAcceptProc(lActorID,lMonsterID,constTaskID) then
		return 0
	end

	-- 判断配置
	local lTargetID = API_VarDataGetNumber(lActorID, 1, constTargetID)
	if lTargetID<=0 then
		return 0
	end
	return 1
end

-- ---------------------------------------------------------------------------------------
-- 玩家可完成本任务的条件
-- ---------------------------------------------------------------------------------------
function LoopTaskWarCallup_CanFinish(lActorID, lNPCID)
	-- 如果不是目的NPC则不能完成
	if 0==LoopTask_IsHelperManOfDey(lActorID, lNPCID) then
		return 0
	end

	-- 判断物品
	local lGoodsID = LoopTaskWarCallup_ExistGoods(lActorID)
	if 0==lGoodsID then
		return 0
	end
	API_VarDataSetNumber(lActorID, 0, constTargetID, lGoodsID)
	return 1
end

-- -------------------------------------------------------------------------
-- 玩家准备放弃本任务的条件
-- -------------------------------------------------------------------------
function LoopTaskWarCallup_CanGiveup(lActorID, lNPCID)
	return 1
end

-- ---------------------------------------------------------------------------------------
-- 玩家接受本任务时触发此函数
-- ---------------------------------------------------------------------------------------
function LoopTaskWarCallup_Accept(lActorID, lNPCID)
	-- 接受任务
	LoopTask_AcceptTaskProc(lActorID,constTaskID)

	local lPeerageLevel = API_GetActorPeerageLevel(lActorID)
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	API_VarDataSetNumber(lActorID, 0, constTargetID, 0)
	API_VarDataSetNumber(lActorID, 1, constPeerageLevel, lPeerageLevel)

	-- 保存配置数据
	LoopTask_WriteDefaultTargetMonster(lActorID, constTaskID)
	LoopTask_AcceptedLoopTask(lActorID, constTaskID)

	-- 刷新客户端任务日志
	LoopTaskWarCallup_UpdateLog(lActorID)
end

-- ---------------------------------------------------------------------------------------
-- 玩家完成本任务时触发此函数
-- ---------------------------------------------------------------------------------------
function LoopTaskWarCallup_Finish(lActorID, lNPCID)
	-- 销毁物品
	local lGoodsID = API_VarDataGetNumber(lActorID, 0, constTargetID)
	local bRes = API_ActorRemoveGoods(lActorID, lGoodsID, 1, "战争的召唤")
	if not bRes then
		return
	end
	
	-- 完成任务
	LoopTask_FinishTaskProc(lActorID, constTaskID)

	-- 删除任务数据
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	API_VarDataSetNumber(lActorID, 1, constPeerageLevel, 0)

	-- 完成一个循环任务
	LoopTask_FinishedLoopTask(lActorID, constTaskID,'战争的召唤')
end

-- ---------------------------------------------------------------------------------------
-- 玩家放弃本任务时触发此函数
-- ---------------------------------------------------------------------------------------
function LoopTaskWarCallup_Giveup(lActorID)
	-- 结束任务环
	LoopTask_GiveupTaskProc(lActorID, constTaskID)

	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	API_VarDataSetNumber(lActorID, 0, constTargetID, 0)
	API_VarDataSetNumber(lActorID, 1, constPeerageLevel, 0)
end

-- ---------------------------------------------------------------------------------------
-- 玩家共享本任务时触发此函数
-- ---------------------------------------------------------------------------------------
function LoopTaskWarCallup_Share(lActorID)
end

-- ---------------------------------------------------------------------------------------
-- 玩家上线时本任务初始化触发此函数
-- ---------------------------------------------------------------------------------------
function LoopTaskWarCallup_Login(lActorID)
	LoopTask_WriteDefaultTargetMonster(lActorID, constTaskID)
	LoopTaskWarCallup_UpdateLog(lActorID)
end

-- ---------------------------------------------------------------------------------------
-- 玩家下线时本任务结束处理触发此函数
-- ---------------------------------------------------------------------------------------
function LoopTaskWarCallup_Logout(lActorID)
end

-- ---------------------------------------------------------------------------------------
-- 刷新任务日志
-- ---------------------------------------------------------------------------------------
function LoopTaskWarCallup_UpdateLog(lActorID)
	local lLoopNum = LoopTask_GetLoopCount(lActorID)
	API_TaskLogUpdate(lActorID, constTaskID, 0, 0, '第' .. lLoopNum ..'次 战争的召唤')

	local szActorName = API_GetActorName(lActorID)
	local szPeerageName = TaskPub_GetActorPeerageName(lActorID)
	local szNameWar = TaskPub_GetCountryNameOfWar(lActorID)
	local szCountryName = TaskPub_GetCountryName(lActorID)

	local szText = ''
	szText = szText..'<text>'..szActorName..'，在拉锯战场中的战事开展的日况激烈。勇士！拿起你手中</text>'
	szText = szText..'<text>的正义之剑去捍卫领土的完整吧！在拉锯战中获得一枚突击勋章。</text>'
	szText = szText..'<text>[</text><text color="255,0,0">出城后</text><text>，点击界面中的</text><text color="255,0,0">右下角的龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">'..szPeerageName..'传送塔</text><text>，</text>'
	szText = szText..'<text>到达'..szPeerageName..'传送塔后，进入塔楼，在塔楼中就可以找到</text><text color="255,0,0">拉锯战传送阵</text><text>，</text>'
	szText = szText..'<text>与拉锯战传送师对话，你就可以参加战斗了。]</text>'

	API_TaskLogUpdate(lActorID, constTaskID, 1, 1, szText)

	szText = '<text>在拉锯战中获得一枚突击勋章，</text>'
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
