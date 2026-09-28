-- ---------------------------------------------------------------------------------------
-- 循环任务 - 募集物资
-- 3026 物品ID
-- 3027 物品数量
-- 3028~3030 保留
-- ---------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------
local constTaskID = 6

local constTargetID = 3026
local constMustbeGoodsNum = 3027

-- --------------------------------------------------------------------------------------------------------------
-- 募集物资  要收集的物品ID配置表
-- --------------------------------------------------------------------------------------------------------------
local lLoopTask_TabGetGoodsID1 = {80000,80012,80018,80024,80036,80040,80044} --11到25级
local lLoopTask_TabGetGoodsID2 = {80002,80013,80019,80025,80037,80041,80045} -- 26到45级 25:75
local lLoopTask_TabGetGoodsID3 = {80004,80014,80020,80026,80038,80042,80046} -- 45级以上 10:20:70 

--  获得物品的帮助信息配置表
local lLoopGetGoodsHelpString = 
{
	[80000] = "出城以后到国有生产基地找到金属矿场，进入金属矿场后挖矿，通过生铁锄可以进行挖掘。",
	[80012] = "出城以后到国有生产基地找到水晶采集场，进入水晶采集场后挖矿，通过生铁锤可以进行挖掘。",
	[80018] = "出城以后到国有生产基地找到伐木场，进入伐木场后伐木，通过生铁斧可以进行砍伐。",
	[80024] = "出城以后到国有生产基地找到种植园，进入种植园后挖掘，通过生铁剪可以进行挖掘。",
	[80036] = "出城以后到国有生产基地找到牧场，进入牧场后狩猎生物，通过生铁刃可以剥取。",
	[80040] = "出城以后到国有生产基地找到牧场，进入牧场后狩猎生物，通过生铁刃可以剥取。",
	[80044] = "出城以后到国有生产基地找到牧场，进入牧场后狩猎生物，通过生铁刃可以剥取。",

	[80002] = "出城以后到各个2档资源采集区中(不包括国有生产基地)寻找2级金属采集场，进入采集场后使用黄铜锄可以进行挖掘。",
	[80013] = "出城以后到各个2档资源采集区中(不包括国有生产基地)寻找2级水晶采集场，进入采集场后使用黄铜锤可以进行挖掘。",
	[80019] = "出城以后到各个2档资源采集区中(不包括国有生产基地)寻找2级伐木场，进入伐木场后使用黄铜斧可以进行砍伐。",
	[80025] = "出城以后到各个2档资源采集区中(不包括国有生产基地)寻找2级种植园，进入种植园后使用黄铜剪可以进行挖掘。",
	[80037] = "出城以后到各个2档资源采集区中(不包括国有生产基地)寻找2级牧场，进入牧场后杀死生物，使用黄铜刃可以剥取。",
	[80041] = "出城以后到各个2档资源采集区中(不包括国有生产基地)寻找2级牧场，进入牧场后杀死生物，使用黄铜刃可以剥取。",
	[80045] = "出城以后到各个2档资源采集区中(不包括国有生产基地)寻找2级牧场，进入牧场后杀死生物，使用黄铜刃可以剥取。",

	[80004] = "出城以后到各个3档资源采集区中(不包括国有生产基地)寻找3级金属采集场，进入采集场后使用白银锄可以进行挖掘。",
	[80014] = "出城以后到各个3档资源采集区中(不包括国有生产基地)寻找3级水晶采集场，进入采集场后使用白银锤可以进行挖掘。",
	[80020] = "出城以后到各个3档资源采集区中(不包括国有生产基地)寻找3级伐木场，进入伐木场后使用白银斧可以进行砍伐。",
	[80026] = "出城以后到各个3档资源采集区中(不包括国有生产基地)寻找3级种植园，进入种植园后使用白银剪可以进行挖掘。",
	[80038] = "出城以后到各个3档资源采集区中(不包括国有生产基地)寻找3级牧场，进入牧场后杀死生物，使用白银刃可以剥取。",
	[80042] = "出城以后到各个3档资源采集区中(不包括国有生产基地)寻找3级牧场，进入牧场后杀死生物，使用白银刃可以剥取。",
	[80046] = "出城以后到各个3档资源采集区中(不包括国有生产基地)寻找3级牧场，进入牧场后杀死生物，使用白银刃可以剥取。",
}

--  --------------------------------------------------------------------------------------------------------------
--  取物品ID
--  --------------------------------------------------------------------------------------------------------------
function LoopGetGoods_GetGoodsId(lActorID)
	-- 获得玩家等级
	local lLevel = API_GetActorExpLevel(lActorID)
	local lGoodsID = lLoopTask_TabGetGoodsID1[1]
	if lLevel>0 and lLevel<=25 then
		local lRandom = math.random(table.getn(lLoopTask_TabGetGoodsID1))
		lGoodsID = lLoopTask_TabGetGoodsID1[lRandom]
	elseif lLevel>25 and lLevel<=45 then
		local lRandom = math.random(100)
		if lRandom<=25 then
			lRandom = math.random(table.getn(lLoopTask_TabGetGoodsID1))
			lGoodsID = lLoopTask_TabGetGoodsID1[lRandom]
		else
			lRandom = math.random(table.getn(lLoopTask_TabGetGoodsID2))
			lGoodsID = lLoopTask_TabGetGoodsID2[lRandom]
		end
	elseif lLevel>45 then
		local lRandom = math.random(100)
		if lRandom<=10 then
			lRandom = math.random(table.getn(lLoopTask_TabGetGoodsID1))
			lGoodsID = lLoopTask_TabGetGoodsID1[lRandom]
		elseif lRandom>10 and lRandom<=20 then
			lRandom = math.random(table.getn(lLoopTask_TabGetGoodsID2))
			lGoodsID = lLoopTask_TabGetGoodsID2[lRandom]
		else
			lRandom = math.random(table.getn(lLoopTask_TabGetGoodsID3))
			lGoodsID = lLoopTask_TabGetGoodsID3[lRandom]
		end
	end	
	return lGoodsID
end

--  --------------------------------------------------------------------------------------------------------------
--  取物品
--  --------------------------------------------------------------------------------------------------------------
function LoopGetGoods_GetGoodsNum(lGoodsId)
	return math.random(5,8)
end

--  --------------------------------------------------------------------------------------------------------------
-- 募集物资配置入口
--  --------------------------------------------------------------------------------------------------------------
function LoopGetGoods_TaskMain(lActorID)
	-- 获取要收集的物品及数量
	local lGoodId = LoopGetGoods_GetGoodsId(lActorID)
	local lNumber = LoopGetGoods_GetGoodsNum(lGoodId)

	-- 记录要收集的物品
	API_VarDataSetNumber(lActorID, 1, constTargetID, lGoodId)
	API_VarDataSetNumber(lActorID, 1, constMustbeGoodsNum, lNumber)	
end

-- ---------------------------------------------------------------------------------------
--  获得物品的帮助信息
-- ---------------------------------------------------------------------------------------
function LoopGetGoodsCmd_HelpString(lGoodId)
	local lhelpstring = lLoopGetGoodsHelpString[lGoodId]
	if lhelpstring == nil then
		lhelpstring = "要到处找找才能获得"
	end	
	return lhelpstring	
end

-- ---------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数
-- ---------------------------------------------------------------------------------------
function LoopGetGoodsCmd_Title()
	-- 获取当前交互的玩家ID
	local lActorID = API_RequestGetActorID()

	-- 属于接受任务列表
	local lType = API_RequestGetNumber(1)
	if 2 == lType then
		LoopGetGoodsCmd_TitleAccpet(lActorID)
	-- 属于完成任务列表
	elseif 1 == lType then
		LoopGetGoodsCmd_TitleFinish(lActorID)		
	-- 属于还没有完成的任务列表
	elseif 3==lType then
		LoopGetGoodsCmd_TitleUndone(lActorID)		
	end	
end

-- ---------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- ---------------------------------------------------------------------------------------
function LoopGetGoodsCmd_TitleAccpet(lActorID)
	-- 取物品及数量和名称
	local lGoodId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local lNumber = API_VarDataGetNumber(lActorID, 1, constMustbeGoodsNum)
	local lHelpString = LoopGetGoodsCmd_HelpString(lGoodId)

	local szGoodsName = API_GetGoodsName(lGoodId)
	local szNameWar = TaskPub_GetCountryNameOfWar(lActorID)
	local szCountryName = TaskPub_GetCountryName(lActorID)

	local szText = ''
	szText = szText..'<text>  多年的战争已经消耗我们大量的资源，要想在战争中获胜必须有充足的资源。现在</text>'
	szText = szText..'<text>'..szCountryName..'正缺少'..szGoodsName..'，立刻帮我收集'..lNumber..'个'..szGoodsName..'来。</text>'
	szText = szText..'<text>这种物品'..lHelpString..'</text>'
	szText = szText..'<text>[出城后，点界面</text><text color="255,0,0">右下角的龙卷风</text><text>，在</text><text color="255,0,0">导游服务</text><text>中可以知道怎么去生产基地。]</text>'
	
	API_ResponseWrite(szText..'<br><br>')

	API_ResponseWrite('<a href="Task_SelectAccept?1='..constTaskID..'">    好的，我立刻去。</a><br>')
	API_ResponseWrite('<a>    稍等，我现在忙。</a><br>')

end

-- ---------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- ---------------------------------------------------------------------------------------
function LoopGetGoodsCmd_TitleFinish(lActorID)
	API_ResponseWrite('<text>   你做得很好！有了丰富的原料就能做出强大的武器，有了强大的武器又可以抢夺丰富的原料。啊，这是个多么美妙的事！</text><br><br>')
	API_ResponseWrite('<a href="Task_SelectFinish?1='..constTaskID..'">  领奖 </a><br>')
end

-- -------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(待完成)
-- -------------------------------------------------------------------------
function LoopGetGoodsCmd_TitleUndone(lActorID)
	API_ResponseWrite('<text>    物资，物资！国家紧需物资，没又资源什么也做不了！</text>')
	API_ResponseWrite('<text color="255,0,0">[按任务“G”键可以看到详细任务资料]</text><br><br>')
	API_ResponseWrite('<a>    明白 </a><br>')
end

-- ---------------------------------------------------------------------------------------
-- 玩家可接受本任务的条件
-- ---------------------------------------------------------------------------------------
function LoopGetGoodsCmd_CanAccept(lActorID, lNPCID)
	-- 如果没有开启循环任务，则不能领取
	if 0==LoopTask_CanAcceptProc(lActorID,lMonsterID,constTaskID) then
		return 0
	end	
	
	-- 没有物品ID 和数量
	local lGoodId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local lNumber = API_VarDataGetNumber(lActorID, 1, constMustbeGoodsNum)
	if lGoodId<=0 or lNumber<=0 then
		return 0
	end
	return 1	
end

-- ---------------------------------------------------------------------------------------
-- 玩家可完成本任务的条件
-- ---------------------------------------------------------------------------------------
function LoopGetGoodsCmd_CanFinish(lActorID, lNPCID)
	-- 如果不是"总督"则不能完成
	if 0==LoopTask_IsHelperManOfDey(lActorID, lNPCID) then
		return 0
	end
	
	-- 判断物品数量
	local lGoodId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local lNeedNum = API_VarDataGetNumber(lActorID, 1, constMustbeGoodsNum)
	local lGoodNum = API_ActorGetGoodsNum(lActorID, lGoodId)
	if lGoodNum<lNeedNum then
		return 0
	end
	return 1	
end

-- -------------------------------------------------------------------------
-- 玩家准备放弃本任务的条件
-- -------------------------------------------------------------------------
function LoopGetGoodsCmd_CanGiveup(lActorID, lNPCID)
	return 1	
end

-- ---------------------------------------------------------------------------------------
-- 玩家接受本任务时触发此函数
-- ---------------------------------------------------------------------------------------
function LoopGetGoodsCmd_Accept(lActorID, lNPCID)
	-- 记录任务日志
	local lTaskLogPos = API_GetAEmptyTaskPos(lActorID)
	API_VarDataSetNumber(lActorID, 1, lTaskLogPos, constTaskID)

	-- 记录任务标志
	API_VarDataSetNumber(lActorID, 1, constTaskID, 1)
	LoopTask_WriteDefaultTargetMonster(lActorID, constTaskID)
	
	-- 保存配置数据
	LoopTask_AcceptedLoopTask(lActorID, constTaskID)
	
	-- 刷新客户端任务日志
	LoopGetGoodsCmd_UpdateLog(lActorID)
end

-- ---------------------------------------------------------------------------------------
-- 玩家完成本任务时触发此函数
-- ---------------------------------------------------------------------------------------
function LoopGetGoodsCmd_Finish(lActorID, lNPCID)

	-- 销毁物品
	local lGoodId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local lNeedNum = API_VarDataGetNumber(lActorID, 1, constMustbeGoodsNum)
	local bRes = API_ActorRemoveGoods(lActorID, lGoodId, lNeedNum, "募集物资")
	if not bRes then
		API_ActorSendMsg(lActorID, 0, '删除募集物品失败')
		return
	end

	-- 完成任务
	LoopTask_FinishTaskProc(lActorID, constTaskID)

	-- 删除任务数据
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	API_VarDataSetNumber(lActorID, 1, constMustbeGoodsNum, 0)

	-- 完成一个循环任务
	LoopTask_FinishedLoopTask(lActorID, constTaskID,'收集物品')

end

-- ---------------------------------------------------------------------------------------
-- 玩家放弃本任务时触发此函数
-- ---------------------------------------------------------------------------------------
function LoopGetGoodsCmd_Giveup(lActorID)

	-- 结束任务环
	LoopTask_GiveupTaskProc(lActorID, constTaskID)
	
	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	API_VarDataSetNumber(lActorID, 1, constMustbeGoodsNum, 0)

end

-- ---------------------------------------------------------------------------------------
-- 玩家共享本任务时触发此函数
-- ---------------------------------------------------------------------------------------
function LoopGetGoodsCmd_Share(lActorID)
end

-- ---------------------------------------------------------------------------------------
-- 玩家上线时本任务初始化触发此函数
-- ---------------------------------------------------------------------------------------
function LoopGetGoodsCmd_Login(lActorID)

	LoopTask_WriteDefaultTargetMonster(lActorID, constTaskID)
	
	LoopGetGoodsCmd_UpdateLog(lActorID)
	
end

-- ---------------------------------------------------------------------------------------
-- 玩家下线时本任务结束处理触发此函数
-- ---------------------------------------------------------------------------------------
function LoopGetGoodsCmd_Logout(lActorID)
end

-- ---------------------------------------------------------------------------------------
-- 刷新任务日志
-- ---------------------------------------------------------------------------------------
function LoopGetGoodsCmd_UpdateLog(lActorID)
	local lLoopNum = LoopTask_GetLoopCount(lActorID)
	API_TaskLogUpdate(lActorID, constTaskID, 0, 0, '第' .. lLoopNum ..'次 募集物资')
	
	-- 取物品及数量和名称
	local lGoodId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local lNumber = API_VarDataGetNumber(lActorID, 1, constMustbeGoodsNum)
	local lHelpString = LoopGetGoodsCmd_HelpString(lGoodId)

	local szGoodsName = API_GetGoodsName(lGoodId)
	local szNameWar = TaskPub_GetCountryNameOfWar(lActorID)
	local szCountryName = TaskPub_GetCountryName(lActorID)

	local szText = ''
	szText = szText..'<text>  多年的战争已经消耗我们大量的资源，要想在战争中获胜必须有充足的资源。现在</text>'
	szText = szText..'<text>'..szCountryName..'正缺少'..szGoodsName..'，立刻帮我收集'..lNumber..'个'..szGoodsName..'来。</text>'
	szText = szText..'<text>这种物品'..lHelpString..'</text>'
	szText = szText..'<text>[出城后，点界面</text><text color="255,0,0">右下角的龙卷风</text><text>，在</text><text color="255,0,0">导游服务</text><text>中可以知道怎么去生产基地。]</text>'
	API_TaskLogUpdate(lActorID, constTaskID, 1, 1, szText)
	
	szText = '<text>收集'..lNumber..'个'..szGoodsName..'物品，</text>'
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
