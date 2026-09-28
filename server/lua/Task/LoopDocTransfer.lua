-- ------------------------------------------------------------------------------------------------
-- 循环任务 - 紧急公文第一步
-- ------------------------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------------------------
-- 循环任务 - 紧急公文数据配置
-- 3006：要去紧急公文的NPCID
-- 3007： 记录任务到期的时间
-- 3007~3010：保留
-- ------------------------------------------------------------------------------------------------

--  第一步任务ID
local constTaskID = 2

local constTargetID = 3006

local constNextTargetID = 3011

-- 公文ID
local constDocID = 80232

-- --------------------------------------------------------------------------------------------------------------
-- 紧急公文 目的NPC 配置表
-- --------------------------------------------------------------------------------------------------------------
local lDocTranTarNpc_DG = {11000,11004,11006,11008,11010,11012,11026,11268,11321}
local lDocTranTarNpc_LB = {11001,11005,11007,11009,11011,11013,11027,11269,11322}

local lDocTranTarNpcID =
{
	[0] = lDocTranTarNpc_DG,
	[1] = lDocTranTarNpc_LB
}

--  --------------------------------------------------------------------------------------------------------------
-- 紧急公文配置入口
--  --------------------------------------------------------------------------------------------------------------
function DocTransfer_TaskMain(lActorID)

	-- 取得玩家阵营
	local lCampId = API_GetActorCamp(lActorID)
	local lTabTarNpcs = lDocTranTarNpcID[0]	
	if 1== lCampId then
		lTabTarNpcs = lDocTranTarNpcID[1]
	end
	
	-- 取得一个伪随机
	local lRandom = math.random(table.getn(lTabTarNpcs))
	local lTarNpcId = lTabTarNpcs[lRandom]
	if nil == lTarNpcId then
		lTarNpcId = lTabTarNpcs[1]
	end

	-- 写入目的NPC
	API_VarDataSetNumber(lActorID,1,constTargetID,lTarNpcId)
	API_VarDataSetNumber(lActorID,0,constTaskID,lTarNpcId)
	
end


-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopDocTransfer_Title()
	-- 获取当前交互的玩家ID
	local lActorID = API_RequestGetActorID()

	-- 属于接受任务列表
	local lType = API_RequestGetNumber(1)
	if 2 == lType then
		LoopDocTransfer_TitleAccept(lActorID)
	-- 属于完成任务列表
	elseif 1 == lType then
		LoopDocTransfer_TitleFinish(lActorID)		
	-- 属于还没完成的任务列表
	elseif 3 == lType then
		LoopDocTransfer_TitleUndone(lActorID)		
	end
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- ------------------------------------------------------------------------------------------------
function LoopDocTransfer_TitleAccept(lActorID)
	local nResult = TaskPub_ActorCanAddGoods(lActorID,constDocID,1,3,0)
	if -1==nResult then
		API_ResponseWrite('<text>    目前你的背包剩余空间不足，请先腾出空间再来接任务公文吧。</text><br><br>')
		API_ResponseWrite('<a>    知道了</a><br>')		
	else
		local lTarNpcId = API_VarDataGetNumber(lActorID, 1, constTargetID)
		local szName = API_GetMonsterNameByID(lTarNpcId)
		
		local szText = ''	
		szText = szText..'<text>这是总督亲笔签名的紧急公文，你必须在最短的时间里</text>'
		szText = szText..'<text>亲手交付到'..szName..'手里，这份公文关系到国家的安危。[点击</text>'
		szText = szText..'<text>界面</text><text color="255,0,0">右下角的龙卷风</text><text>，在</text><text color="255,0,0">传送服务</text><text>中你就可以知道他的</text>'
		szText = szText..'<text>所在地了，然后点击</text><text color="255,0,0">黄颜色</text><text>的目标名，进入房间就可以</text>'
		szText = szText..'<text>找到那个收公文的人了。]</text>'
		API_ResponseWrite(szText..'<br><br>')
		API_ResponseWrite('<a href="Task_SelectAccept?1='..constTaskID..'">    好的，我会亲手交给他的。 </a><br>')
		API_ResponseWrite('<a>    稍等，我现在忙。</a><br>')
	end
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- ------------------------------------------------------------------------------------------------
function LoopDocTransfer_TitleFinish(lActorID)
	local lCampId = API_GetActorCamp(lActorID)
	if 0==lCampId then
		API_ResponseWrite('<text>   公文已经安全送抵，请回帝国枢密院长那复命吧！</text><br><br>')
	else
		API_ResponseWrite('<text>   公文已经安全送抵，请回联邦辅政官那复命吧！</text><br><br>')
	end
	API_ResponseWrite('<a href="Task_SelectFinish?1='..constTaskID..'">    我明白了。</a><br>')
end

-- -------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(待完成)
-- -------------------------------------------------------------------------
function LoopDocTransfer_TitleUndone(lActorID)
	API_ResponseWrite('<text>公文怎么还在你手上？难道你想私吞公文？</text><text color="255,0,0">[按任务“G”键可以看到详细任务资料]</text><br><br>')
	API_ResponseWrite('<a>    明白 </a><br>')
end

-- ------------------------------------------------------------------------------------------------
-- 玩家可接受本任务的条件
-- ------------------------------------------------------------------------------------------------
function LoopDocTransfer_CanAccept(lActorID, lNPCID)
	DBG_TRACE('LoopDocTransfer_CanAccept 1')
	-- 如果没有开启循环任务，则不能领取
	if 0==LoopTask_CanAcceptProc(lActorID,lMonsterID,constTaskID) then
		DBG_TRACE('LoopDocTransfer_CanAccept 2')
		return 0
	end	
	-- 如果公文已经存在，则不能领取
	local lNum = API_ActorGetGoodsNum(lActorID, constDocID)
	if lNum > 0 then
		DBG_TRACE('LoopDocTransfer_CanAccept 3')
		return 0
	end
	
	-- 如果要紧急公文的目的NPC不存在，则不能领取
	local lTarNpcId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	if lTarNpcId == 0 then
		DBG_TRACE('LoopDocTransfer_CanAccept 4')
		return 0
	end
	-- 判断包裹位置
	local lPackSize = API_ActorGetPackageSize(lActorID)
	if lPackSize<1 then
		TaskPub_SendTitleMsg(lActorID,'背包空间不足，不能获得公文')
		return 0
	end	
	DBG_TRACE('LoopDocTransfer_CanAccept 5')	
	return 1	
end

-- ------------------------------------------------------------------------------------------------
-- 玩家可完成本任务的条件
-- ------------------------------------------------------------------------------------------------
function LoopDocTransfer_CanFinish(lActorID, lNPCID)
	-- 如果没有公文则能不完成
	local lNum = API_ActorGetGoodsNum(lActorID, constDocID)
	if lNum <= 0 then
		return 0
	end

	-- 如果不是紧急公文NPC，则不能完成
	local lTarNpcId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	if lNPCID ~= lTarNpcId then
		return 0
	end
	return 1	
end

-- -------------------------------------------------------------------------
-- 玩家准备放弃本任务的条件
-- -------------------------------------------------------------------------
function LoopDocTransfer_CanGiveup(lActorID, lNPCID)
	return 1	
end

-- ------------------------------------------------------------------------------------------------
-- 玩家接受本任务时触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopDocTransfer_Accept(lActorID, lNPCID)
	local lTarMonsterID = API_VarDataGetNumber(lActorID,1,constTargetID)
	API_VarDataSetNumber(lActorID,0,constTaskID,lTarMonsterID)
	
	API_AddActorGoodsEx(lActorID, constDocID, 1, 0, "紧急公文")	
	LoopTask_AcceptTaskProc(lActorID, constTaskID)

	LoopTask_AcceptedLoopTask(lActorID, constTaskID)
	
	LoopDocTransfer_UpdateLog(lActorID)
end

-- ------------------------------------------------------------------------------------------------
-- 玩家完成本任务时触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopDocTransfer_Finish(lActorID, lNPCID)

	-- 销毁公文
	API_ActorRemoveGoods(lActorID, constDocID, 1, "紧急公文奖励")
	
	local lTargetID = API_VarDataGetNumber(lActorID, 1, constTargetID)
	API_VarDataSetNumber(lActorID, 1, constNextTargetID, lTargetID)

	-- 记录任务标志
	API_VarDataSetNumber(lActorID, 1, constTaskID, 2)
	
	-- 接受紧急公文下一步
	API_AcceptTask(lActorID, 3)

	-- 完成任务
	LoopTask_FinishTaskProc(lActorID, constTaskID)
	
	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	
end

-- ------------------------------------------------------------------------------------------------
-- 玩家放弃本任务时触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopDocTransfer_Giveup(lActorID)

	-- 删除公文
	API_ActorRemoveGoods(lActorID, constDocID, 1, "紧急公文奖励")

	-- 结束任务环
	LoopTask_GiveupTaskProc(lActorID, constTaskID)

	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	
end

-- ------------------------------------------------------------------------------------------------
-- 玩家共享本任务时触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopDocTransfer_Share(lActorID)
	
end

-- ------------------------------------------------------------------------------------------------
-- 玩家上线时本任务初始化触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopDocTransfer_Login(lActorID)

	local lTarMonsterID = API_VarDataGetNumber(lActorID,1,constTargetID)
	API_VarDataSetNumber(lActorID,0,constTaskID,lTarMonsterID)

	LoopDocTransfer_UpdateLog(lActorID)
	
end

-- ------------------------------------------------------------------------------------------------
-- 玩家下线时本任务结束处理触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopDocTransfer_Logout(lActorID)
end

-- ------------------------------------------------------------------------------------------------
-- 刷新任务日志
-- ------------------------------------------------------------------------------------------------
function LoopDocTransfer_UpdateLog(lActorID)
	local lLoopNum = LoopTask_GetLoopCount(lActorID)
	API_TaskLogUpdate(lActorID, constTaskID, 0, 0, '第' .. lLoopNum ..'次 紧急公文')

	local lTarNpcId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local szName = API_GetMonsterNameByID(lTarNpcId)

	local szText = ''	
	szText = szText..'<text>这是总督亲笔签名的紧急公文，你必须在最短的时间里</text>'
	szText = szText..'<text>亲手交付到'..szName..'手里，这份公文关系到国家的安危。[点击</text>'
	szText = szText..'<text>界面</text><text color="255,0,0">右下角的龙卷风</text><text>，在</text><text color="255,0,0">传送服务</text><text>中你就可以知道他的</text>'
	szText = szText..'<text>所在地了，然后点击</text><text color="255,0,0">黄颜色</text><text>的目标名，进入房间就可以</text>'
	szText = szText..'<text>找到那个收公文的人了。]</text>'
	API_TaskLogUpdate(lActorID, constTaskID, 1, 1, szText)
	
	szText = '<text color="255,0,0">将公文安全送抵'..szName..'手里，</text>'
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
