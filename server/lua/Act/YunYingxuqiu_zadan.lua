------砸蛋活动 宝藏-------
------2009.12.21  林瑞宇制作-------
--应运营唐聪需求，制作此道具。通过WEB活动获得，发送到玩家邮箱。使用后获得4档装备。宝藏不绑定，开出的物品不绑定。
------2011.8.11	万钰林修改
--新砸蛋活动需求，增加额外四档强化高附加装备产出

--~ 	local baozangID = 88663
--~ 	local OwnerID = -2001 --全局交互数据
YunYingxuqiu_zadan_shenzhibaozang_jianglitable = {
	[1] = {4001,4101,6601,6901,8101,4301,4201,4401,4501,2001,3001,3901,5001,5101,6701,7001,8201,5301,5201,5401,5501,1501,6001,6101,6801,8001,8301,6301,6201,6401,6501,1001,},
	[2] = {4001,4101,6601,6901,8101,4301,4201,4401,4501,2001,3001,3901,5001,5101,6701,7001,8201,5301,5201,5401,5501,1501,6001,6101,6801,8001,8301,6301,6201,6401,6501,1001,},

}
function YunYingxuqiu_zadan_shenzhibaozang(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local baozangID = 88663
	if GoodsID ~= baozangID then
		return 0
	end
	local goodsnum = API_ActorGetGoodsNum(ActorID,GoodsID)
	if goodsnum <= 0 then
		return 0
	end
	local suiji = math.random(100)
	local tableID = 0
	if suiji <= 90 then
		tableID = 1
	else
		tableID = 2
	end
	if tableID ~= 1 and tableID ~= 2 then
		return 0
	end
	if API_ActorGetPackageSize(ActorID) < 2 then
		API_ActorSendMsg(ActorID,3,'请留空两个背包位置再使用')
		return 0
	end
	local tablechangdu = table.getn(YunYingxuqiu_zadan_shenzhibaozang_jianglitable[tableID])  
	local suiji2 = math.random(tablechangdu)
	local jiangli = YunYingxuqiu_zadan_shenzhibaozang_jianglitable[tableID][suiji2]
	if API_ActorRemoveGoods(ActorID,GoodsID,1,'砸蛋活动 使用宝藏') then
		API_AddActorGoodsFlagEx(ActorID,jiangli,1,6,0,'砸蛋活动 使用宝藏',0)
		local PD = 0
		local PlayName =  API_GetActorName(ActorID)
		--此处增加额外奖励
		if math.random(100) <= 50 then
			local GoodsID = YXD_WorldDropGoodsTab[12][math.random(table.getn(YXD_WorldDropGoodsTab[12]))]
			PD = GoodsID
--~ 			if API_ActorCanAddGoods(ActorID,GoodsID,1,0,0) ~= -1 then
--~ 				API_AddActorGoods(ActorID, GoodsID, 1, '神之宝藏额外奖励')
				API_AddActorGoodsFlagEx(ActorID,GoodsID,1,3,0,'神之宝藏额外奖励',0)
--~ 				API_ActorSendMsg(ActorID,10,'打开神之宝藏额外获得高附加属性装备：'..API_GetGoodsName(GoodsID)..'')
--~ 			else
--~ 				API_SendActorMailByName(PlayName, GoodsID, 1, 0, '[神之宝藏]额外奖励', '恭喜你打开神之宝藏额外获得高附加属性装备：'..API_GetGoodsName(GoodsID)..'')
--~ 				API_ActorSendMsg(ActorID,10,'打开神之宝藏额外获得高附加属性装备：'..API_GetGoodsName(GoodsID)..'（请到邮箱领取）')
--~ 			end
		end
		API_ResponseWrite('<win rect="400,400,300,150" move="1"></win>')
		API_ResponseWrite('<name>'..API_GetGoodsName(baozangID)..'</name>')
		API_ResponseWrite('<text>恭喜您，获得二档高属性三洞装备：</text><img srcgd="'..jiangli..'" tipgd="'..jiangli..'">')
		if PD ~= 0 then
			API_ResponseWrite('<text>、高附加属性装备：</text><img srcgd="'..PD..'" tipgd="'..PD..'">')
		end
		API_ResponseWrite('<br><br><a>知道了</a>')
		API_ResponseFlush(ActorID)		
		local lasttime = API_VarDataGetNumber_Ex(1,0,-2001,1,11)			
		local nowtiem = os.time()			
		local timecha = nowtiem - lasttime	
		if timecha >= 3600 then			
			if API_IsBattleGameServer() then
			else
				--API_ActorBroadcastMsgEx(-1,-1,0,17,''..PlayName..'开启了“'..API_GetGoodsName(baozangID)..'”，发现了传说中的极品装备。')	
			end	
			
			API_VarDataSetNumber_Ex_Sync(1,0,-2001,1,11,nowtiem)				
		end	
		return 1
	end
end
