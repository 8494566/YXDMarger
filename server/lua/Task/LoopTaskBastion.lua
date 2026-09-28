-- ------------------------------------------------------------------------------------------------
-- 循环任务 - 抵抗黑暗势力
-- 任务数据配置
-- 3096	目的浮空岛地图
-- 3097	需要防守的次数
-- 3098	现在已经防守的次数
-- 3099~3100 保留
-- ------------------------------------------------------------------------------------------------
local constTaskID = 20

local constTargetID = 3096
local constNeedNum = 3097
local constKillNum = 3098

--  --------------------------------------------------------------------------------------------------------------
--  获得怪物ID 配置
--  --------------------------------------------------------------------------------------------------------------
--[[
公民 1803
男爵 1808
高男 1809
子爵 1801
高子 1831
伯爵 1832
高伯 1833
侯爵 1834
高侯 1835
公爵 1836
高公 1837
]]
local constLoopTaskBastionMapList = 
{
	[1]=1803,
	[2]=1808,
	[3]=1809,
	[4]=1801,
	[5]=1831,
	[6]=1832,
	[7]=1833,
	[8]=1834,
	[9]=1835,
	[10]=1836,
	[11]=1837,
}
function LoopTaskBastion_GetStaticMapID(lActorID)
	local level = API_GetActorPeerageLevel(lActorID)
	local lMapID = constLoopTaskBastionMapList[1]
	if level>0 and level<=table.getn(constLoopTaskBastionMapList) then
		lMapID = constLoopTaskBastionMapList[level]
	end
	return lMapID
end

--  --------------------------------------------------------------------------------------------------------------
--  获得怪物ID 配置数量
--  --------------------------------------------------------------------------------------------------------------
function LoopTaskBastion_GetMonsterNum(lActorID)
	return math.random(20,30)
end

--  --------------------------------------------------------------------------------------------------------------
--   联邦/帝国帮助字符
--  --------------------------------------------------------------------------------------------------------------
local constHelpString_LB = 
{
	[1] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">公民空间传送塔</text><text>，到达公民传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[2] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">男爵空间传送塔</text><text>，到达男爵传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[3] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">高级男爵空间传送塔</text><text>，到达高级男爵传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[4] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">麦穗平原</text><text>，进入麦穗平原后再在导游服务中选择</text><text color="255,0,0">子爵空间传送塔</text><text>，到达子爵空间传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[5] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">麦穗平原</text><text>，进入麦穗平原后再在导游服务中选择</text><text color="255,0,0">高级子爵空间传送塔</text><text>，到达高级子爵空间传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[6] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">麦穗平原</text><text>，进入麦穗平原后再在导游服务中选择</text><text color="255,0,0">伯爵空间传送塔</text><text>，到达伯爵空间传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[7] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">麦穗平原</text><text>，进入麦穗平原后再在导游服务中选择</text><text color="255,0,0">高级伯爵空间传送塔</text><text>，到达高级伯爵空间传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[8] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">麦穗平原</text><text>，进入麦穗平原后再在导游服务中选择</text><text color="255,0,0">侯爵空间传送塔</text><text>，到达侯爵空间传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[9] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">麦穗平原</text><text>，进入麦穗平原后再在导游服务中选择</text><text color="255,0,0">高级侯爵空间传送塔</text><text>，到达高级侯爵空间传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
}
local constHelpString_DG = 
{
	[1] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">公民空间传送塔</text><text>，到达公民传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[2] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">男爵空间传送塔</text><text>，到达男爵传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[3] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">高级男爵空间传送塔</text><text>，到达高级男爵传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[4] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">阳光雨林</text><text>，进入阳光雨林后再在导游服务中选择</text><text color="255,0,0">子爵空间传送塔</text><text>，到达子爵空间传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[5] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">阳光雨林</text><text>，进入阳光雨林后再在导游服务中选择</text><text color="255,0,0">高级子爵空间传送塔</text><text>，到达高级子爵空间传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[6] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">阳光雨林</text><text>，进入阳光雨林后再在导游服务中选择</text><text color="255,0,0">伯爵空间传送塔</text><text>，到达伯爵空间传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[7] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">阳光雨林</text><text>，进入阳光雨林后再在导游服务中选择</text><text color="255,0,0">高级伯爵空间传送塔</text><text>，到达高级伯爵空间传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[8] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">阳光雨林</text><text>，进入阳光雨林后再在导游服务中选择</text><text color="255,0,0">侯爵空间传送塔</text><text>，到达侯爵空间传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
	[9] = '出城后，点击界面中的右下角的</text><text color="255,0,0">龙卷风图标</text><text>，在导游服务中选择</text><text color="255,0,0">阳光雨林</text><text>，进入阳光雨林后再在导游服务中选择</text><text color="255,0,0">高级侯爵空间传送塔</text><text>，到达高级侯爵空间传送塔后，进入塔楼，在塔楼中就可以找到防守浮空岛传送门，与传送门对话，就可以参加战斗了。',
}

--  --------------------------------------------------------------------------------------------------------------
-- 获得帮助文字
--  --------------------------------------------------------------------------------------------------------------
function LoopTaskBastion_GetHelpString(lActorID)
	local level = API_GetActorPeerageLevel(lActorID)
	if level<1 then
		level = 1
	elseif level>9 then
		level = 9
	end
	local szHelpString = constHelpString_DG[level]
	local lCampId = API_GetActorCamp(lActorID)
	if 1== lCampId then
		szHelpString = constHelpString_LB[level]
	end
	return szHelpString
end

--  --------------------------------------------------------------------------------------------------------------
-- 抵抗黑暗势力配置入口
--  --------------------------------------------------------------------------------------------------------------
function LoopTaskBastion_TaskMain(lActorID)
	local lTargetMapID = LoopTaskBastion_GetStaticMapID(lActorID)
	local lNeedNum =LoopTaskBastion_GetMonsterNum(lActorID)
	
	API_VarDataSetNumber(lActorID, 1, constTargetID, lTargetMapID)
	API_VarDataSetNumber(lActorID, 1, constNeedNum, lNeedNum)
	API_VarDataSetNumber(lActorID, 1, constKillNum, 0)
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBastion_Title()
	-- 获取当前交互的玩家ID
	local lActorID = API_RequestGetActorID()

	-- 属于接受任务列表
	local lType = API_RequestGetNumber(1)
	if 2 == lType then
		LoopTaskBastion_TitleAccpet(lActorID)
	-- 属于完成任务列表
	elseif 1 == lType then
		LoopTaskBastion_TitleFinish(lActorID)
	-- 属于还没有完成的任务列表
	elseif 3==lType then
		LoopTaskBastion_TitleUndone(lActorID)				
	end	
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- ------------------------------------------------------------------------------------------------
function LoopTaskBastion_TitleAccpet(lActorID)

	local lTargetMapID = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local szMapName = API_GetMapNameFromConfigID(lTargetMapID)
	local lNumber = API_VarDataGetNumber(lActorID, 1, constNeedNum)

	local szActorName = API_GetActorName(lActorID)
	local szPeerageName = TaskPub_GetActorPeerageName(lActorID)
	local szCountryNameOfWar = TaskPub_GetCountryNameOfWar(lActorID)
	local szCountryName = TaskPub_GetCountryName(lActorID)
	local szHelpString = LoopTaskBastion_GetHelpString(lActorID)
	
	local szText = ''
	
	szText = szText..'<text>'..szPeerageName..'防守浮空正在受到黑暗势力的攻击，现在'..szCountryName..'需要</text>'
	szText = szText..'<text>你在'..szPeerageName..'防守浮空岛防守'..lNumber..'轮。['..szHelpString..']</text>'
	
	API_ResponseWrite(szText..'<br><br>')

	API_ResponseWrite('<a href="Task_SelectAccept?1='..constTaskID..'">  好的，立刻参加防守战。</a><br>')
	API_ResponseWrite('<a>  稍等，我现在很忙。 </a><br>')

end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- ------------------------------------------------------------------------------------------------
function LoopTaskBastion_TitleFinish(lActorID)
	API_ResponseWrite('<name>抵抗黑暗势力奖励</name>')
	
	local szActorName = API_GetActorName(lActorID)
	API_ResponseWrite('<text>'..szActorName..'，你做的很出色!又一次把敌人挡在城门之外。这是给你的奖励。</text><br>')
	
	local lExpValue = LoopTask_GetActorAwardExpValue(lActorID)
	API_ResponseWrite('<text>功勋  ×'..lExpValue..'</text><br>')

	API_ResponseWrite('<a href="Task_SelectFinish?1='..constTaskID..'">                确定 </a><br>')

end

-- -------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(待完成)
-- -------------------------------------------------------------------------
function LoopTaskBastion_TitleUndone(lActorID)
	local szText = ''
	szText = szText..'<text>不要像那些游手好闲的人一样，看够了空岛美景，吸饱了新鲜空气，可到</text>'
	szText = szText..'<text>头来什么正经事也没做！[按任务“G”键可以看到详细任务资料]</text>'
	API_ResponseWrite(szText..'<br><br>')
	API_ResponseWrite('<a>    明白 </a><br>')
end

-- ------------------------------------------------------------------------------------------------
-- 玩家可接受本任务的条件
-- ------------------------------------------------------------------------------------------------
function LoopTaskBastion_CanAccept(lActorID, lNPCID)

	-- 如果没有开启循环任务，则不能领取
	if 0==LoopTask_CanAcceptProc(lActorID,lMonsterID,constTaskID) then
		return 0
	end	

	-- 没有要杀的NPC
	local lTargetId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local lNeedNum = API_VarDataGetNumber(lActorID, 1, constNeedNum)
	if lTargetId<=0 or lNeedNum<=0 then
		return 0
	end

	return 1
	
end

-- ------------------------------------------------------------------------------------------------
-- 玩家可完成本任务的条件
-- ------------------------------------------------------------------------------------------------
function LoopTaskBastion_CanFinish(lActorID, lNPCID)

	-- 如果不是"总督"则不能完成
	if 0==LoopTask_IsHelperManOfDey(lActorID, lNPCID) then
		return 0
	end
	
	local lAcceptedExpLevel = LoopTask_GetAcceptedExpLevel(lActorID)
	local lCurrentLExpevel = API_GetActorPeerageLevel(lActorID)
	local lSubExpLevel = lCurrentLExpevel - lAcceptedExpLevel

	if lSubExpLevel<2 then
		-- 计算需要杀的数量
		local lNeedNum = API_VarDataGetNumber(lActorID, 1, constNeedNum)
		local lKillNum = API_VarDataGetNumber(lActorID, 1, constKillNum)
		if lKillNum<lNeedNum then
			return 0
		end
	end

	return 1
	
end

-- -------------------------------------------------------------------------
-- 玩家准备放弃本任务的条件
-- -------------------------------------------------------------------------
function LoopTaskBastion_CanGiveup(lActorID, lNPCID)

	return 1
	
end

-- -------------------------------------------------------------------------------------------------------------
-- 保存玩家在浮空岛的防守次数
-- -------------------------------------------------------------------------------------------------------------
function LoopTaskBastion_SaveBastionCount(lActorID, lMapID, lNum)

	local lTaskState = API_VarDataGetNumber(lActorID, 1, constTaskID)
	if 1~=lTaskState then
		return
	end

	-- 取得的地图的防守波次
	local lconstStaticMapID = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local lStaticMapID = TaskPub_GetStaticMapID(lMapID)
	if lconstStaticMapID~=lStaticMapID then
		return
	end
	
	API_VarDataSetNumber(lActorID, 1, constKillNum, lNum)
	
end

-- ------------------------------------------------------------------------------------------------
-- 玩家接受本任务时触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBastion_Accept(lActorID, lNPCID)

	-- 接受任务
	LoopTask_AcceptTaskProc(lActorID, constTaskID)
	
	-- 记录任务标志
	API_VarDataSetNumber(lActorID, 1, constKillNum, 0)
	
	-- 配置数据
	LoopTask_WriteDefaultTargetMonster(lActorID, constTaskID)
	
	-- 保存配置数据
	LoopTask_AcceptedLoopTask(lActorID, constTaskID)

	-- 刷新客户端任务日志
	LoopTaskBastion_UpdateLog(lActorID)

end

-- ------------------------------------------------------------------------------------------------
-- 玩家完成本任务时触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBastion_Finish(lActorID, lNPCID)

	-- 完成任务
	LoopTask_FinishTaskProc(lActorID, constTaskID)
	
	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	API_VarDataSetNumber(lActorID, 1, constNeedNum, 0)
	API_VarDataSetNumber(lActorID, 1, constKillNum, 0)

	-- 完成一个循环任务
	LoopTask_FinishedLoopTask(lActorID, constTaskID,'抵抗黑暗势力')

end

-- ------------------------------------------------------------------------------------------------
-- 玩家放弃本任务时触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBastion_Giveup(lActorID)

	-- 结束任务环
	LoopTask_GiveupTaskProc(lActorID, constTaskID)

	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	API_VarDataSetNumber(lActorID, 1, constNeedNum, 0)
	API_VarDataSetNumber(lActorID, 1, constKillNum, 0)
	
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家升级前会自动调用此函数判断是否允许升级
-- 1=是, 0=否
-- ------------------------------------------------------------------------
local constExistLevelUp = {25,40,55,70,85}
function LoopTaskBastion_IsExistLevelUp(lActorID)
	local level = API_GetActorExpLevel(lActorID)
	for nKey,nLevelUp in pairs(constExistLevelUp) do
		if level==nLevelUp then
			return 0
		end
	end
	return 1
end
function LoopTaskBastion_OnLevelUp(lActorID,nExploitL)
	return 1
	-- local lTaskState = API_VarDataGetNumber(lActorID, 1, constTaskID)
	-- if 0~=lTaskState then
	-- 	if 0==LoopTaskBastion_IsExistLevelUp(lActorID) then
	-- 		TaskPub_SendMessage(lActorID, '有<抵抗黑暗势力>在身,不能升级')
	-- 		return 0
	-- 	end
	-- end
	-- if 0~=lTaskState then
	-- 	if 0==LoopTaskBastion_IsExistLevelUp(lActorID) then
	--		-- 强制放弃任务
	-- 		API_GiveupTask(lActorID, constTaskID)
	-- 	end
	-- end	
	-- return 1
end

-- ------------------------------------------------------------------------------------------------
-- 玩家共享本任务时触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBastion_Share(lActorID)
end

-- ------------------------------------------------------------------------------------------------
-- 玩家上线时本任务初始化触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBastion_Login(lActorID)

	-- 配置数据
	LoopTask_WriteDefaultTargetMonster(lActorID, constTaskID)

	LoopTaskBastion_UpdateLog(lActorID)

end

-- ------------------------------------------------------------------------------------------------
-- 玩家下线时本任务结束处理触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBastion_Logout(lActorID)
end

-- ------------------------------------------------------------------------------------------------
-- 刷新任务日志
-- ------------------------------------------------------------------------------------------------
function LoopTaskBastion_UpdateLog(lActorID)

	local lLoopNum = LoopTask_GetLoopCount(lActorID)
	API_TaskLogUpdate(lActorID, constTaskID, 0, 0, '第' .. lLoopNum ..'次 抵抗黑暗势力')

	local lTargetMapID = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local szMapName = API_GetMapNameFromConfigID(lTargetMapID)
	local lNumber = API_VarDataGetNumber(lActorID, 1, constNeedNum)

	local szActorName = API_GetActorName(lActorID)
	local szPeerageName = TaskPub_GetActorPeerageName(lActorID)
	local szCountryNameOfWar = TaskPub_GetCountryNameOfWar(lActorID)
	local szCountryName = TaskPub_GetCountryName(lActorID)
	local szHelpString = LoopTaskBastion_GetHelpString(lActorID)
	
	local szText = ''	
	szText = szText..'<text>'..szPeerageName..'防守浮空正在受到黑暗势力的攻击，现在'..szCountryName..'需要</text>'
	szText = szText..'<text>你在'..szPeerageName..'防守浮空岛防守'..lNumber..'轮。['..szHelpString..']</text>'
	API_TaskLogUpdate(lActorID, constTaskID, 1, 1, szText)
	
	szText = '<text>前往'..szPeerageName..'防守浮空参与防守，抵挡住敌人至少'..lNumber..'次攻击，</text>'
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
