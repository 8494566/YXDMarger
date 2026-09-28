----------------------------------------------------------------------
-- 结婚功能
-- 该脚本只做了简单的结婚和离婚功能
----------------------------------------------------------------------

function Marriage_Title()
	local ActorID = API_RequestGetActorID()
	API_ResponseWrite('<text>我有心上人了，</text>')
	API_ResponseWrite('<a href="Marriage_Txt">我要结婚</a><br>')
	API_ResponseWrite('<br><text>我和我爱人不过了，</text>')
	API_ResponseWrite('<a href="Divorce_Txt">我要离婚</a><br>')
	API_ResponseWrite('<a>取消</a><br>')
end

function Marriage_Txt()
	local ActorID = API_RequestGetActorID()
	-- 先判断是否结婚了
	if API_GetRelation(ActorID,0,8) == -1 then
		API_ResponseWrite('<text>请输入您要结婚的对象的角色名：</text><br>')
		API_ResponseWrite('<input type="string" name="4" size="18"><br>')
		API_ResponseWrite('<a href="Marriage_Open">确定结婚</a><br>')
		API_ResponseWrite('<a>取消</a><br>')
	else
		API_ResponseWrite('<text>你已经结婚了，你还来做什么？</text><br>')
		API_ResponseWrite('<a>取消</a><br>')		
	end
	
	API_ResponseWrite('-- 日后这里可以添加LUA 结婚条件 判断')
	API_ResponseWrite('-- 比如好感度，任务， 等级限制 扣钱等')	

end

function Divorce_Txt()

	local ActorID = API_RequestGetActorID()
	-- 先判断是否结婚了
	if API_GetRelation(ActorID,0,8) == -1 then
		API_ResponseWrite('<text>你还没有结婚呢，来做什么？</text><br>')
		API_ResponseWrite('<a>取消</a><br>')		
		return ;
	end

	API_ResponseWrite('<text>您确定要离婚么？：</text><br>')
	API_ResponseWrite('<a href="Divorce_Open">确定离婚</a><br>')
	API_ResponseWrite('<a>取消</a><br>')
	API_ResponseWrite('<text>日后这里通过LUA可以添加离婚条件和扣钱等</text><br>')
	API_ResponseWrite('<text>比如对方在线扣钱数 不在线扣钱等</text><br>')

end

--执行结婚 给20的好感度
function Marriage_Open()
	local ActorID = API_RequestGetActorID()	
	local lOtherName = API_RequestGetString(4)
	if lOtherName =="" then
		API_ResponseWrite('<text>请输入要结婚的对方角色名</text><br>')
		API_ResponseWrite('<a href="Marriage_Txt">返回</a><br>')	
		return
	end
	local lOtherID = API_GetActorID(lOtherName)
	if lOtherID <= 0 then
		API_ResponseWrite('<text>结婚双方要同时在线，在一个服务器</text><br>')
		API_ResponseWrite('<a href="Marriage_Txt">返回</a><br>')
		return;		
	end
	-- 日后这里可以添加 结婚条件 判断
	-- 比如好感度，任务， 等级 扣钱判断	
	API_AddRelation(ActorID, lOtherID, 5, 1,1)
end

-- 执行离婚
function Divorce_Open()
	--日后这里可以添加 离婚扣钱等
	local ActorID = API_RequestGetActorID()
	API_DelRelation(ActorID,0)
end


-- 结婚成功前的确认的系统回调函数
-- 参数分别是2个人的角色ID
-- 返回1 条件满足，失败 返回
function OnMarriageCondition(lActorID,lActorID2)
-- 结婚条件都满足了
-- 这里真正的扣物品 金钱等 

	return 1
end

-- 结婚成功后的系统回调函数
-- 参数分别是2个人的角色ID
function OnMarriage(lActorID,lActorID2)
	local msg = "恭喜结婚"
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local Time = ''..Year..' 年 '..Month..' 月 '..Day..' 日 '..Hour..' 时 '..Minute..' 分 '..Second..' 秒'
	API_ResponseWrite('<name></name>')
	API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
	API_ResponseWrite('<text>恭喜你们在</text><text color="255,0,255"> '..Time..' </text><text>结为夫妻，愿你们相携到老，永远忠诚于对方……！</text><br>')
	API_ResponseWrite('<br><text>现在你们可以在教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”处使用结婚相关功能了。</text><br>')
	API_ResponseWrite('<br><a>确定</a>')
	API_ResponseFlush(lActorID)
	API_ResponseWrite('<name></name>')
	API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
	API_ResponseWrite('<text>恭喜你们在</text><text color="255,0,255"> '..Time..' </text><text>结为夫妻，愿你们相携到老，永远忠诚于对方……！</text><br>')
	API_ResponseWrite('<br><text>现在你们可以在教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”处使用结婚相关功能了。</text><br>')
	API_ResponseWrite('<br><a>确定</a>')
	API_ResponseFlush(lActorID2)
	API_ActorSendMsg(lActorID,2, msg)
	API_ActorSendMsg(lActorID2,2, msg)
	API_VarDataSetNumber(lActorID,1,19002,3)
	API_VarDataSetNumber(lActorID2,1,19002,3)
	--更新天缘关系
	local NanYuanFenType = 105
	local NvYuanFenType = 105
	local NanHaoGanDu = API_GetRelation(lActorID,lActorID2,2)
	local NvHaoGanDu = API_GetRelation(lActorID2,lActorID,2)
	if NanHaoGanDu >= 2500 and NanHaoGanDu < 3000 then
		NanYuanFenType = 106
	elseif NanHaoGanDu >= 3000 and NanHaoGanDu < 3500 then
		NanYuanFenType = 107
	elseif NanHaoGanDu >= 3500 and NanHaoGanDu < 3800 then
		NanYuanFenType = 108
	elseif NanHaoGanDu >= 3800 then
		NanYuanFenType = 109
	end
	if NvHaoGanDu >= 2500 and NvHaoGanDu < 3000 then
		NvYuanFenType = 106
	elseif NvHaoGanDu >= 3000 and NvHaoGanDu < 3500 then
		NvYuanFenType = 107
	elseif NvHaoGanDu >= 3500 and NvHaoGanDu < 3800 then
		NvYuanFenType = 108
	elseif NvHaoGanDu >= 3800 then
		NvYuanFenType = 109
	end
	API_UpdateRelation(lActorID,lActorID2,3,NanYuanFenType)
	API_UpdateRelation(lActorID2,lActorID,3,NvYuanFenType)
	--发出系统公告祝贺
	API_ActorBroadcastMsgEx(-1,-1,0,7,'恭喜“'..API_GetActorName(lActorID2)..'”和“'..API_GetActorName(lActorID)..'”结婚。')
	API_ActorBroadcastMsg(-1,17,'恭喜“'..API_GetActorName(lActorID2)..'”和“'..API_GetActorName(lActorID)..'”结婚。')
	--增加祝贺光效
	--添加结婚称号，夫妻技能
	Hour = math.floor(Hour/2) + 1
	local LaiYuan = API_ActorGetPropNum(lActorID,201)
	if GLOBAL_FengXiangBiao_DateList[2][Hour+24][LaiYuan] == nil then
		GLOBAL_FengXiangBiao_DateList[2][Hour+24][LaiYuan] = 1
	else
		GLOBAL_FengXiangBiao_DateList[2][Hour+24][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][Hour+24][LaiYuan] + 1
	end
end
