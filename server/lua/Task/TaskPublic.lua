-- --------------------------------------------------------------------------------------------------------------
-- 任务脚本的公共过程调用
-- --------------------------------------------------------------------------------------------------------------

Pub_VarMoneryGoodsID = 80081
Pub_VarExpGoodsID = 80456

-- --------------------------------------------------------------------------------------------------------------
-- 发送消息给玩家[提示信息]
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_SendMessage(lActorID,szMessage)
	API_ActorSendMsg(lActorID, 0, szMessage)
end

-- --------------------------------------------------------------------------------------------------------------
-- 发送消息给玩家[白提示]
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_SendTitleMsg(lActorID,szMessage)
	API_ActorSendMsg(lActorID, 4, szMessage)
end

-- --------------------------------------------------------------------------------------------------------------
-- 发送消息给玩家[大白提示]
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_SendNotifyMsg(lActorID,szMessage)
	API_ActorSendMsg(lActorID, 8, szMessage)
end

 
-- --------------------------------------------------------------------------------------------------------------
-- 发送消息给玩家[系统提示]
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_SendSysMsg(lActorID,szMessage)
	API_ActorSendMsg(lActorID, 12, szMessage)
end

-- --------------------------------------------------------------------------------------------------------------
-- 取玩家所在地图
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_GetActorMapID(lActorID)
	if lActorID>0 then
		return API_GetActorMapID(lActorID)
	end
	return 0
end

-- --------------------------------------------------------------------------------------------------------------
-- 取MapId
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_GetStaticMapID(lMapID)
	return API_GetMapConfigID(lMapID)
end

-- --------------------------------------------------------------------------------------------------------------
-- 通过MapId  取得地图名称
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_GetMapNameByID(lMapId)
	local lGetMapID = TaskPub_GetStaticMapID(lMapId)
	if lGetMapID>0 then
		local szMapName = API_GetMapName(lMapId)
		if nil==szMapName then
			return '无名岛'
		end
		return szMapName
	else
		local szMapName = API_GetMapNameFromConfigID(lMapId)
		if nil==szMapName then
			return '无名岛'
		end
		return szMapName
	end
end

-- ------------------------------------------------------------------------------------------------
-- 玩家的爵位名称
-- ------------------------------------------------------------------------------------------------
local constTaskPub_PeerageNameTable =
{
	[1] = '公民',
	[2] = '男爵',
	[3] = '高级男爵',
	[4] = '子爵',
	[5] = '高级子爵',
	[6] = '伯爵',
	[7] = '高级伯爵',
	[8] = '侯爵',
	[9] = '高级侯爵',
	[10] = '公爵',
	[11] = '高级公爵'
}
function TaskPub_GetActorPeerageName(lActorID)
	local level = API_GetActorPeerageLevel(lActorID)
	if level<1 then
		level = 1
	elseif level>11 then
		level = 11
	end
	return constTaskPub_PeerageNameTable[level]
end


-- ------------------------------------------------------------------------------------------------
--防守副本的静态地图ID, 各个爵位的防守副本静态地图ID
-- ------------------------------------------------------------------------------------------------
local lFangShouFuBenMapID =
{
	[1]=1803,
	[2]=1808,
	[3]=1809,
	[4]=1809,
	[5]=1809,
	[6]=1809,
	[7]=1809,
	[8]=1809,
	[9]=1809,
	[10]=1809,
	[11]=1809
}

-- ------------------------------------------------------------------------------------------------
--  取得玩家相应爵位的防守副本静态地图ID
-- ------------------------------------------------------------------------------------------------
function BettlePub_GetBettleStaicMapID(lActorID)
	local lStaticMapID = lFangShouFuBenMapID[1]
	local level = API_GetActorPeerageLevel(lActorID)
	if level>=1 and level<=table.getn(lFangShouFuBenMapID) then
		lStaticMapID = lFangShouFuBenMapID[level]
	end
	return lStaticMapID
end

-- ------------------------------------------------------------------------------------------------
--争夺浮空岛传送NPCID
-- ------------------------------------------------------------------------------------------------
local BettleContestMonsterID_DG =
{
	[1]=11210,
	[2]=11241,
	[3]=11245,
	[4]=11249,
	[5]=11253,
	[6]=11257,
	[7]=11261
}

local BettleContestMonsterID_LB =
{
	[1]=11220,
	[2]=11243,
	[3]=11247,
	[4]=11251,
	[5]=11255,
	[6]=11259,
	[7]=11263
}

-- ------------------------------------------------------------------------------------------------
--  取得玩家相应爵位的争夺浮空岛传送NPCID
-- ------------------------------------------------------------------------------------------------
function BettlePub_GetBettleStaicMapID(lActorID)
	local lStaticMapID = 0
	local lTable = BettleContestMonsterID_DG
	local lCampId = API_GetActorCamp(lActorID)
	if 1==lCampId then
		lTable = BettleContestMonsterID_LB
	end

	local level = API_GetActorPeerageLevel(lActorID)
	if level>0 and level<7 then
		lStaticMapID = lTable[level]
	end
	return lStaticMapID
end

-- ------------------------------------------------------------------------------------------------
--  取得敌国名称
-- ------------------------------------------------------------------------------------------------
function TaskPub_GetCountryNameOfWar(lActorID)
	local lCampId = API_GetActorCamp(lActorID)
	local szWarName = "联邦"
	if 1==lCampId then
		szWarName = "帝国"
	end
	return szWarName
end

-- ------------------------------------------------------------------------------------------------
--  取得国家名称
-- ------------------------------------------------------------------------------------------------
function TaskPub_GetCountryName(lActorID)
	local lCampId = API_GetActorCamp(lActorID)
	if 0==lCampId then
		return "帝国"
	else
		return "联邦"
	end
end

-- --------------------------------------------------------------------------------------------------------------
-- 判断是不是总督
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_IsDeyOfMonster(lActorID, lNPCID)
	local lCampId = API_GetActorCamp(lActorID)
	if 0==lCampId then
		if 11042==lNPCID then
			return 1
		end
	else
		if 11043==lNPCID then
			return 1
		end
	end
	return 0
end

-- --------------------------------------------------------------------------------------------------------------
-- 获取玩家经验等级计算爵位等级
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_GetActorPeerageByExpLevel(lExpLevel)
	local lPeerageLevel = 1
	if lExpLevel>=1 and lExpLevel<11 then
		lPeerageLevel = 1
	elseif lExpLevel>=11 and lExpLevel<21 then
		lPeerageLevel = 2
	elseif lExpLevel>=21 and lExpLevel<26 then
		lPeerageLevel = 3
	elseif lExpLevel>=26 and lExpLevel<36 then
		lPeerageLevel = 4
	elseif lExpLevel>=36 and lExpLevel<41 then
		lPeerageLevel = 5
	elseif lExpLevel>=41 and lExpLevel<51 then
		lPeerageLevel = 6
	elseif lExpLevel>=51 and lExpLevel<56 then
		lPeerageLevel = 7
	elseif lExpLevel>=56 and lExpLevel<66 then
		lPeerageLevel = 8
	elseif lExpLevel>=66 and lExpLevel<71 then
		lPeerageLevel = 9
	elseif lExpLevel>=71 and lExpLevel<81 then
		lPeerageLevel = 10
	elseif lExpLevel>=81 and lExpLevel<86 then
		lPeerageLevel = 11
	elseif lExpLevel>=86 and lExpLevel<150 then
		lPeerageLevel = 11
	else
		lPeerageLevel = 1
	end
	return lPeerageLevel
end

-- --------------------------------------------------------------------------------------------------------------
-- 获取玩家身上的游戏币
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_GetActorMoney(lActorID)
	return API_ActorGetPropNum(lActorID, PD_PROP_MONEY_HOLD)
end

-- --------------------------------------------------------------------------------------------------------------
-- 获取玩家是否可以加多少物品
-- 能否向物品栏（包括小背包）添加nNum个lGoodsID物品
-- lActorID: 玩家角色ID
-- lGoodsID: 物品ID
-- lNum: 要添加的物品数量
-- lBind: 0: 无绑定  1：不可以交易、拍卖、给予、邮寄 2：不可以出售给NPC 3：=1+2
-- lReservePos: 除了待添加物品外，额外需要保留的空格数
-- 返回: 空间足够则返回待添加物品要占用的空格数，返回0表示不需要另外的空格(即是可以叠加)
--         返回-1表示没有足够的空间添加nNum个lGoodsID物品
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_ActorCanAddGoods(lActorID,lGoodsID,lAddNum,nBindFlag,nReserveNum)
	if lActorID<=0 or lGoodsID<=0 or lAddNum<=0 then
		DBG_TRACE('CanAddGoods error:ActorID='..lActorID..',GoodsID='..lGoodsID..',AddNum='..lAddNum)
		return -1
	end
	return API_ActorCanAddGoods(lActorID, lGoodsID, lAddNum,nBindFlag,nReserveNum)
end

-- -------------------------------------------------------------------------------------------------------------
-- 保存玩家在浮空岛防守次数
-- -------------------------------------------------------------------------------------------------------------
function TaskPub_SaveBastionCount(lActorID, lMapID, lNum)
	--循环任务
	LoopTaskBastion_SaveBastionCount(lActorID, lMapID, lNum)
end

-- -------------------------------------------------------------------------------------------------------------
-- 保存玩家在拉锯战中的胜利次数
-- -------------------------------------------------------------------------------------------------------------
function TaskPub_SaveSeesawBattleCount(lActorID, lMapID, lNum)
	-- 循环任务
end

-- --------------------------------------------------------------------------------------------------------------
-- 玩家记录完成任务时的目标NPC
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_WriteMonster(lActorID, lTaskID, lMonsterID)
	API_VarDataSetNumber(lActorID,0,lTaskID,lMonsterID)
end

-- --------------------------------------------------------------------------------------------------------------
-- 玩家接受任务的处理过程
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_AcceptTaskProc(lActorID, lTaskID)
	-- 记录任务日志
	local lTaskLogPos = API_GetAEmptyTaskPos(lActorID)
	API_VarDataSetNumber(lActorID, 1, lTaskLogPos, lTaskID)

	-- 设置任务状态标记
	API_VarDataSetNumber(lActorID, 1, lTaskID, 1)
end

-- --------------------------------------------------------------------------------------------------------------
-- 玩家完成任务的处理过程
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_FinishTaskProc(lActorID, lTaskID)
	-- 删除任务日志
	API_ClearTaskPos(lActorID, lTaskID)

	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, lTaskID, 0)
	API_VarDataSetNumber(lActorID, 0, lTaskID, 0)

	-- 删除客户端任务日志
	API_TaskLogRemove(lActorID, lTaskID)
end

-- --------------------------------------------------------------------------------------------------------------
-- 玩家放弃任务的处理过程
-- --------------------------------------------------------------------------------------------------------------
function TaskPub_GiveupTaskProc(lActorID, lTaskID)
	-- 删除任务日志
	API_ClearTaskPos(lActorID, lTaskID)

	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, lTaskID, 0)
	API_VarDataSetNumber(lActorID, 0, lTaskID, 0)

	-- 删除客户端任务日志
	API_TaskLogRemove(lActorID, lTaskID)
end


-- end files !!!!
