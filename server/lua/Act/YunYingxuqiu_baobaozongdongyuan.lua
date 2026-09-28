------宝宝总动员-------
------2010.1.12  林瑞宇制作-------
--应运营潘寿需求，制作此道具2个。通过WEB活动获得，发送到玩家邮箱。使用后获得奖励。物品绑定，开出的物品不绑定。
--[[
劣质魔盒：1-25
普通魔盒：26-55

2挡装备配方：1-25
3档装备配方：26-40
4档装备配方：41-55
]]
	local juanzhouID = 88881
	local xuyuanpingID = 88882
	local OwnerID = -2001 --全局交互数据
YunYingxuqiu_bbdy_jianglitable = {
--卷轴表
	[1] = {
		[1]={suiji1=1,suiji2=30,jiangpin1 = 80050,num=1,}, --中间值 根据玩家等级 +-1
		[2]={suiji1=31,suiji2=60,jiangpin1 = 80066,num=6,}, --中间值 根据玩家等级 +-1
		[3]={suiji1=61,suiji2=80,jiangpin1 = 80819,num=1,},
		[4]={suiji1=81,suiji2=82,jiangpin1 = 80820,num=1,},
		[5]={suiji1=83,suiji2=100,jiangpin1 = 80818,num=2,},
		},
--许愿瓶表	
	[2] = {
		[1]={suiji1=1,suiji2=20,jiangpin1 = 80381,num=1,}, --最低值 根据玩家等级 + 1
		[2]={suiji1=21,suiji2=60,jiangpin1 = 80383,num=1,},--最低值 根据玩家等级 + 1
		[3]={suiji1=61,suiji2=260,jiangpin1 = 80697,num=8,},
		[4]={suiji1=261,suiji2=439,jiangpin1 = 80191,num=10,},
		[5]={suiji1=440,suiji2=549,jiangpin1 = 80181,num=3,},
		[6]={suiji1=550,suiji2=699,jiangpin1 = 250,num=1,},
		[7]={suiji1=700	,suiji2=849,jiangpin1 = 80455,num=2,},
		[8]={suiji1=850,suiji2=999,jiangpin1 = 80192,num=1,},
		[9]={suiji1=1000,suiji2=1000,jiangpin1 = {4003,4103,4303,4203,4403,4503,5003,5103,5303,5203,5403,5503,6003,6103,6303,6203,6403,6503,},num=1,},		
		},
		
}
function YunYingxuqiu_bbdy(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	if GoodsID ~= juanzhouID and GoodsID ~= xuyuanpingID then
		return 0
	end
	local zhonglei = 0
	local suiji = 0
	if GoodsID == juanzhouID then
		zhonglei = 1
		suiji = math.random(100)
		--suiji = 82
	elseif GoodsID == xuyuanpingID then
		zhonglei = 2
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		suiji = math.random(1000)
		--suiji = 1000
		local chongxuan = 0
		if suiji == 1000 then
			if Hour >= 15 and Hour < 24 then  
--API_Trace('时间可以=')			
				local yiyoucishu = API_VarDataGetNumber_Ex(1,0,OwnerID,1,12) --已获奖次数
--API_Trace('yiyoucishu='..yiyoucishu)					
				if yiyoucishu < 4 then
					local lasttime = API_VarDataGetNumber_Ex(1,0,OwnerID,1,13) --上次获奖时间
					local suijitime = math.random(10800,12600)
					local nowtime = os.time()
					local TimePast = os.difftime(nowtime,lasttime)
					if TimePast >= suijitime then
					else
						chongxuan = 1
					end
				else
					chongxuan = 1
				end
			else
				chongxuan = 1
			end
		end	
		if chongxuan == 1 then
			local cishu = 0
			repeat
				suiji = math.random(1000)
				cishu = cishu + 1
			until suiji ~= 1000 or cishu == 100
		end
	end
--API_Trace('suiji='..suiji)	
	if suiji == 0 then
		return 0
	end
	if zhonglei == 0 then
		return 0
	end
	local goodsnum = API_ActorGetGoodsNum(ActorID,GoodsID)
	if goodsnum <= 0 then
		return 0
	end
	
	local jiangpin = 0
	local num = 0
	for i in YunYingxuqiu_bbdy_jianglitable[zhonglei] do
		if YunYingxuqiu_bbdy_jianglitable[zhonglei][i] ~= nil then
			local suiji1 = YunYingxuqiu_bbdy_jianglitable[zhonglei][i].suiji1
			local suiji2 = YunYingxuqiu_bbdy_jianglitable[zhonglei][i].suiji2
			if suiji >= suiji1 and suiji <= suiji2 then
				if type(YunYingxuqiu_bbdy_jianglitable[zhonglei][i].jiangpin1) == 'table' then	
--API_Trace('111=')				
					local biaotable = YunYingxuqiu_bbdy_jianglitable[zhonglei][i].jiangpin1
					local biaochang = table.getn(biaotable)
					local random1 = math.random(biaochang)
--API_Trace('biaochang='..biaochang)
--API_Trace('random1='..random1)					
					jiangpin = biaotable[random1]		
				else
					jiangpin = YunYingxuqiu_bbdy_jianglitable[zhonglei][i].jiangpin1
				end
if type(jiangpin) == 'table' then	
	--API_Trace('是表=')	
else
	--API_Trace('你是表='..jiangpin)		
end				
				num = YunYingxuqiu_bbdy_jianglitable[zhonglei][i].num
				break
			end
		end	
	end
	
	if jiangpin == 0 or num == 0 then
		return 0 
	end
	
	local Level = API_GetActorExpLevel(ActorID)
	if jiangpin == 80050 or jiangpin == 80066 then
		if Level <= 25 then
			jiangpin = jiangpin - 1 
		elseif	Level > 26 and Level <= 40 then		
		elseif	Level > 40 then
			jiangpin = jiangpin + 1 
		end
	end
	if jiangpin == 80381 or jiangpin == 80383 then
		if Level > 25 then
			jiangpin = jiangpin + 1
		end
	end
	
	if API_ActorCanAddGoods(ActorID,jiangpin,num,0,0) ~= -1 then
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'宝宝总动员') then
			if suiji == 1000 then
				API_AddActorGoodsFlagEx(ActorID,jiangpin,num,6,0,'砸蛋活动 使用宝藏',0)
				local nowtime = os.time()
				local yiyoucishu = API_VarDataGetNumber_Ex(1,0,OwnerID,1,12) --已获奖次数
				local cishu = yiyoucishu + 1
				API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,12,cishu)	
				API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,13,nowtime)		
				local PlayName =  API_GetActorName(ActorID)	
				if API_IsBattleGameServer() then
				else
					API_ActorBroadcastMsgEx(-1,-1,0,17,''..PlayName..'开启了“'..API_GetGoodsName(GoodsID)..'”，发现了传说中的极品装备。')	
				end	
			else
				API_AddActorGoods(ActorID,jiangpin,num,'宝宝总动员')
			end
			API_ResponseWrite('<win rect="400,400,300,150" move="1"></win>')
			API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
			API_ResponseWrite('<text>恭喜您，获得</text><img srcgd="'..jiangpin..'" tipgd="'..jiangpin..'"><text>X '..num..'</text>')
			API_ResponseWrite('<br><br><a>知道了</a>')
			API_ResponseFlush(ActorID)				
			return 1
		else
			return 0
		end
	else
		API_ResponseWrite('<win rect="400,400,300,150" move="1"></win>')
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		API_ResponseWrite('<text>您的背包空间不足，不能获得奖励。</text>')
		API_ResponseFlush(ActorID)	
		return 0 
	end
end
function YunYingxuqiu_bbdy_kuari()
	API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,12,0)	
	API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,13,0)	
end

