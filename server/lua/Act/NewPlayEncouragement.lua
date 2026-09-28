----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\NewPlayEncouragement.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2008-11-26
--版  本:	1.0
--描  述:	有奖测试活动
--应  用:  
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 万钰林
--日  期: 2008-11-26
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------
--活动名称：新兵登岛，总督有礼！
--活动时间 2008年12月5日——2008年1月7日（为期1个月多1个星期）
--19014 是否领取了新手礼物

--[[if not API_IsEctypeServer() then
	DGACTNPCID1 = DGACTNPCID1 or API_CreateMonster(82,11724,122,165,3,0,-1)
	DGACTNPCID2 = DGACTNPCID2 or API_CreateMonster(1,11724,273,181,4,0,-1)
	LBACTNPCID1 = LBACTNPCID1 or API_CreateMonster(67,11724,123,172,3,0,-1)
	LBACTNPCID2 = LBACTNPCID2 or API_CreateMonster(2,11724,245,137,5,0,-1)
end]]

function NewPlay_Encouragement_ACT_Title()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local Camp = API_GetActorCamp(ActorID)
	local NewPlay = API_VarDataGetNumber(ActorID,1,GLOBAL_FoolNewActorTaskStep) --获取玩家新手流程状态
	local LingJiangPanDuan = API_VarDataGetNumber(ActorID,1,19014)
	local PlayLV = API_GetActorExpLevel(ActorID)
	local GoodsID = 845 --变身糖果ID
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ACTTime = PublicFun_Difftime(Year,Month,Day,2008,12,5)
	local CampName = ''
	if Camp == 0 then
		CampName = '帝国'
	else
		CampName = '联邦'
	end
	if XuanZe == 1 then
		--换新兵之锤
		if API_ActorGetMakeGoodsNumEx(ActorID,10906,0,0) > 0 then
			if API_ActorRemoveGoods(ActorID,10906,1,'兑换新兵铁锤销毁') then
				API_AddActorGoods(ActorID,11003,1,'兑换强化的新兵铁锤')
				API_ActorSendMsg(ActorID,2,'获得强化的新兵铁锤')
				API_ResponseWrite('<text>兑换成功，你获得了一把强化的新兵铁锤，拿着它去奋勇的杀敌吧！为了'..CampName..'而战！</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<text>请将新兵铁锤放在背包栏第一格位置，否则无法兑换。</text><br>')
			API_ResponseWrite('<br><br><a href="NewPlay_Encouragement_ACT_Title?1=4">返回</a><br>')
		end
	elseif XuanZe == 2 then
		--换新兵火炮
		if API_ActorGetMakeGoodsNumEx(ActorID,10907,0,0) > 0 then
			if API_ActorRemoveGoods(ActorID,10907,1,'兑换新兵火炮销毁') then
				API_AddActorGoods(ActorID,11004,1,'兑换强化的新兵火炮')
				API_ActorSendMsg(ActorID,2,'获得强化的新兵火炮')
				API_ResponseWrite('<text>兑换成功，你获得了一把强化的新兵火炮，拿着它去奋勇的杀敌吧！为了'..CampName..'而战！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<text>请将新兵火炮放在背包栏第一格位置，否则无法兑换。</text><br>')
			API_ResponseWrite('<br><br><a href="NewPlay_Encouragement_ACT_Title?1=4">返回</a><br>')
		end
	elseif XuanZe == 3 then
		--换新兵魔法书
		if API_ActorGetMakeGoodsNumEx(ActorID,10908,0,0) > 0 then
			if API_ActorRemoveGoods(ActorID,10908,1,'兑换新兵魔法书销毁') then
				API_AddActorGoods(ActorID,11005,1,'兑换强化的新兵魔法书')
				API_ActorSendMsg(ActorID,2,'获得强化的新兵魔法书')
				API_ResponseWrite('<text>兑换成功，你获得了一把强化的新兵魔法书，拿着它去奋勇的杀敌吧！为了'..CampName..'而战！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<text>请将新兵魔法书放在背包栏第一格位置，否则无法兑换。</text><br>')
			API_ResponseWrite('<br><br><a href="NewPlay_Encouragement_ACT_Title?1=4">返回</a><br>')
		end
	elseif XuanZe == 4 then
		if PlayLV > 9 and PlayLV < 21 then
			API_ResponseWrite('<text>请将需要兑换的武器放在背包栏第一格位置，否则无法兑换，并且不同攻击类型的武器不能兑换。</text><br>')
			API_ResponseWrite('<br><a href="NewPlay_Encouragement_ACT_Title?1=1">兑换强化的新兵铁锤</a><br>')
			API_ResponseWrite('<br><a href="NewPlay_Encouragement_ACT_Title?1=2">兑换强化的新兵火炮</a><br>')
			API_ResponseWrite('<br><a href="NewPlay_Encouragement_ACT_Title?1=3">兑换强化的新兵魔法书</a><br>')
			API_ResponseWrite('<br><a href="NewPlay_Encouragement_ACT_Title">返回</a><br>')
		elseif PlayLV < 10 then
			API_ResponseWrite('<text>您的爵位还未达到一等公民，不能兑换新兵武器。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		else
			API_ResponseWrite('<text>您的爵位已经超过一等男爵，不能兑换新兵武器。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	elseif XuanZe == 5 then
		if LingJiangPanDuan == 0 then
			if API_ActorGetPackageSize(ActorID) >= 4  then
				API_VarDataSetNumber(ActorID,1,19014,1)
				API_AddActorGoodsFlag(ActorID,821,30,3,'领取新手奖励烟花')
				API_ActorSendMsg(ActorID,8,'获得'..API_GetGoodsName(821)..' X 30')
				API_AddActorGoodsFlag(ActorID,823,30,3,'领取新手奖励烟花')
				API_ActorSendMsg(ActorID,8,'获得'..API_GetGoodsName(823)..' X 30')
				API_AddActorGoodsFlag(ActorID,824,30,3,'领取新手奖励烟花')
				API_ActorSendMsg(ActorID,8,'获得'..API_GetGoodsName(824)..' X 30')
				API_AddActorGoodsFlag(ActorID,GoodsID,20,3,'领取新手奖励变身糖果')
				API_ActorSendMsg(ActorID,8,'获得'..API_GetGoodsName(GoodsID)..' X 20')
				API_ResponseWrite('<br><text>新兵，欢迎你的到来，这点小礼物就收下吧，希望你能为'..CampName..'做出杰出的贡献，让我们一起捍卫'..CampName..'的荣耀。</text><br><br><text>记得达到一等公民的时候再来我这里，我可以帮你兑换更强大的新兵武器。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
			else
				API_ActorSendMsg(ActorID,2,'您的背包空间不足，请保留足够的空位再领取礼物')
			end
		else
			API_ResponseWrite('<text>您已经领取了新手礼物，不能再次领取。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	else
		--活动说明
		API_ResponseWrite('<br><text size="16" color="227,217,6">  新兵登岛，总督有礼！</text><br>')
		API_ResponseWrite('<br><text>  从</text><text color="255,0,255">2008年12月5日</text><text>到</text><text color="255,0,255">2009年1月7日</text><text>，完成新手流程的新兵可以在我这里领取新手礼物，达到</text><text color="255,0,255">一等公民</text><text>的玩家可以在我这里兑换强化的新兵武器。</text><br><text>  只有</text><text color="255,0,255">一等男爵(包括一等男爵)</text><text>以下的玩家才可以参与本次活动。</text><br>')
		--先判断时间 
		if ACTTime < 1 and ACTTime > -34 then
			if PlayLV < 21 then
				if NewPlay >= 64 then --64是完成了新手流程
					if LingJiangPanDuan == 0 then
						API_ResponseWrite('<br><a href="NewPlay_Encouragement_ACT_Title?1=5">  领取新手礼物</a><br>')
					end
					API_ResponseWrite('<br><a href="NewPlay_Encouragement_ACT_Title?1=4">  兑换新兵武器</a><br>')
					API_ResponseWrite('<br><a>  关闭</a><br>')
				else
					API_ResponseWrite('<br><text>  您还没有完成新手流程，不能参与本次活动。</text><br>')
					API_ResponseWrite('<br><br><a>  确定</a><br>')
				end
			else
				API_ResponseWrite('<br><text>  您的爵位已经超过一等男爵，不能参与本次活动。</text><br>')
				API_ResponseWrite('<br><br><a>  确定</a><br>')
			end
		elseif ACTTime > 0 then
			API_ResponseWrite('<br><text color="255,0,255">  活动还未开始，请不要着急。</text><br>')
			API_ResponseWrite('<br><br><a>  确定</a><br>')
		else
			API_ResponseWrite('<br><text color="255,0,255">  活动已经结束，谢谢您的参与。</text><br>')
			API_ResponseWrite('<br><br><a>  确定</a><br>')
		end
	end
end
