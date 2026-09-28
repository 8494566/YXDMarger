------幸运星-------
------2009.8.2 林瑞宇制作-------
----设计思路 
--活动有时间期限
--面向15级以上玩家
--活动开始后，玩家登陆游戏 会判断玩家是否领取过箱子，没有的话赠送5个箱子。
--跨日部分 按照使用箱子的数量进行补给
--活动开始后，玩家登陆游戏弹出卷轴

XingYunxing_StartTime = {Year = 2011,Month = 1,Day = 1,Hour = 0,Minute = 0,Second = 0}   -------开始时间
XingYunxing_EndTime = {Year = 2020,Month = 12,Day = 30,Hour = 0,Minute = 0,Second = 0}   -------停止时间

XingYunxing_geixingyunxingsave = 12107 --给幸运星记录
XingYunxing_shiyongxingyunxingsave = 12108 --使用幸运星记录
XingYunxing_goodsid = 88135 --物品ID
XingYunxing_dianquan = 20
XingYunxing_dianquan2 = XingYunxing_dianquan/2
local XingYunxing_keyjuanzhouid = 104108 --大于14级的玩家弹出
local XingYunxing_keyjuanzhoutubiaoid = 104108 --大于14级的玩家弹出
XingYunxing_keyongnumMAX = 12112
XingYunxing_bugeiriqi = 12120 --大于14级的玩家弹出

local shiyihuodongyuebing = 88153
local fuzhuangbaoshitiqupanding = 12111

local HuoDongRiChengBiao = 90004
local HuoDongRiChengBiaoTuBiao = 104123

--进入游戏的处理
function XingYunxing_OnLogin(ActorID)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(XingYunxing_StartTime.Year,XingYunxing_StartTime.Month,XingYunxing_StartTime.Day,XingYunxing_StartTime.Hour,XingYunxing_StartTime.Minute,XingYunxing_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(XingYunxing_EndTime.Year,XingYunxing_EndTime.Month,XingYunxing_EndTime.Day,XingYunxing_EndTime.Hour,XingYunxing_EndTime.Minute,XingYunxing_EndTime.Second)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel < 15 then
		return
	end
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		local begintime = XingYunxing_StartTime.Year * 10000 + XingYunxing_StartTime.Month * 100 + XingYunxing_StartTime.Day
		local usetime = API_VarDataGetNumber(ActorID,1,XingYunxing_geixingyunxingsave)
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		if usetime < begintime then --没给过	
			local num = 5
			if Month == 10 then
				if Day < 9 then
					num = 10
				end
			end
			if API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave) > 0 then --上线活动开始 没收到过幸运星 并且有正在使用的VIP钥匙 那么赠送10个
				num = 10
				if Month == 10 then
					if Day < 9 then
						num = 20
					end
				end		
				API_VarDataSetNumber(ActorID,1,XingYunxing_keyongnumMAX,begintime)
			end			
			API_SendActorMailByName(API_GetActorName(ActorID),XingYunxing_goodsid,num,3,''..API_GetGoodsName(XingYunxing_goodsid)..'活动赠送','打开'..API_GetGoodsName(XingYunxing_goodsid)..'可以获得神秘礼物，打开1次需要'..XingYunxing_dianquan..'点券。如果背包中有正在使用的'..API_GetGoodsName(VIPkey_keyid)..'，那么只需要'..XingYunxing_dianquan2..'点券就可以打开。')
			API_ActorSendMsg(ActorID,17,'您的邮箱中获得“'..API_GetGoodsName(XingYunxing_goodsid)..'”'..num..'个，请注意查收')
			API_VarDataSetNumber(ActorID,1,XingYunxing_geixingyunxingsave,begintime)
			
			local Type = 1
			if GLOBAL_FengXiangBiao_DateList[31][Type] == nil then
				GLOBAL_FengXiangBiao_DateList[31][Type] = {}
			end
			if GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = num
			else
				GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] + num
			end
			
		else --给过
			if API_VarDataGetNumber(ActorID,1,XingYunxing_keyongnumMAX) < begintime then
				if API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave) > 0 then
					local num = 5
					if Month == 10 then
						if Day < 9 then
							num = 10
						end
					end
					API_SendActorMailByName(API_GetActorName(ActorID),XingYunxing_goodsid,num,3,''..API_GetGoodsName(XingYunxing_goodsid)..'活动赠送','打开'..API_GetGoodsName(XingYunxing_goodsid)..'可以获得神秘礼物，打开1次需要'..XingYunxing_dianquan..'点券。如果背包中有正在使用的'..API_GetGoodsName(VIPkey_keyid)..'，那么只需要'..XingYunxing_dianquan2..'点券就可以打开。')
				
					API_ActorSendMsg(ActorID,17,'您的邮箱中获得“'..API_GetGoodsName(XingYunxing_goodsid)..'”'..num..'个，请注意查收')
					API_VarDataSetNumber(ActorID,1,XingYunxing_keyongnumMAX,begintime)
					local Type = 1
					if GLOBAL_FengXiangBiao_DateList[31][Type] == nil then
						GLOBAL_FengXiangBiao_DateList[31][Type] = {}
					end
					if GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = 5
					else
						GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] + 5
					end
				end	
			end
		end
		local MapID = API_GetActorMapID(ActorID)
		local StaticMapID = API_GetStaticMapID(MapID)
		if MapID == StaticMapID then
			API_RemoveTaskScroll(ActorID,XingYunxing_keyjuanzhouid)
			local nType = API_VarDataGetNumber(ActorID, 0, 18368)
			if nType == 1 then
				if API_VarDataGetNumber(ActorID,1,XingYunxing_shiyongxingyunxingsave) < 1 then
					--API_AddTaskScrollEx(ActorID,XingYunxing_keyjuanzhouid,XingYunxing_keyjuanzhoutubiaoid,'XingYunxing_juanzhoudianji',0)
					LRY_UItwinkemanage(ActorID,15,85,XingYunxing_keyjuanzhoutubiaoid,XingYunxing_keyjuanzhouid,43,'XingYunxing_juanzhoudianji')
				end
			end
		end
	end
--	API_RemoveTaskScroll(ActorID,HuoDongRiChengBiao)
--	LRY_UItwinkemanage(ActorID,15,85,HuoDongRiChengBiaoTuBiao,HuoDongRiChengBiao,20,'HuoDongRiChengJuanZhouDianJi')--加载活动日程表
end

--跨天的处理
function XingYunxing_kuatianchuli(ActorID)	
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel < 15 then
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(XingYunxing_StartTime.Year,XingYunxing_StartTime.Month,XingYunxing_StartTime.Day,XingYunxing_StartTime.Hour,XingYunxing_StartTime.Minute,XingYunxing_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(XingYunxing_EndTime.Year,XingYunxing_EndTime.Month,XingYunxing_EndTime.Day,XingYunxing_EndTime.Hour,XingYunxing_EndTime.Minute,XingYunxing_EndTime.Second)	
	if nShiFouStart <= 0 and nShiFouEnd > 0 then	
		local begintime = XingYunxing_StartTime.Year * 10000 + XingYunxing_StartTime.Month * 100 + XingYunxing_StartTime.Day
		local usetime = API_VarDataGetNumber(ActorID,1,XingYunxing_geixingyunxingsave)		
		if usetime >= begintime then--给过	
			local usecishu = API_VarDataGetNumber(ActorID,1,XingYunxing_shiyongxingyunxingsave)			
			if usecishu > 0 then	
				local shangcilingquriqi = API_VarDataGetNumber(ActorID,1,12116) 
				local lingquriqi = Month * 100 + Day
				if shangcilingquriqi ~= lingquriqi then
					local nummax = 5
					if Month == 10 then
						if Day < 9 then
							nummax = 10
						end
					end
					if API_VarDataGetNumber(ActorID,1,XingYunxing_keyongnumMAX) >= begintime then
						if API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave) > 0 then
							nummax = 10
							if Month == 10 then
								if Day < 9 then
									nummax = 20
								end
							end
						end	
					end				
					if usecishu > nummax then
						usecishu = nummax
					end				
					API_SendActorMailByName(API_GetActorName(ActorID),XingYunxing_goodsid,usecishu,3,''..API_GetGoodsName(XingYunxing_goodsid)..'活动赠送','打开'..API_GetGoodsName(XingYunxing_goodsid)..'可以获得神秘礼物，打开1次需要'..XingYunxing_dianquan..'点券。如果背包中有正在使用的'..API_GetGoodsName(VIPkey_keyid)..'，那么只需要'..XingYunxing_dianquan2..'点券就可以打开。')				
					API_ActorSendMsg(ActorID,17,'您的邮箱中获得“'..API_GetGoodsName(XingYunxing_goodsid)..'”'..usecishu..'个，请注意查收')
					API_VarDataSetNumber(ActorID,1,XingYunxing_shiyongxingyunxingsave,0)
					API_VarDataSetNumber(ActorID,1,12116,lingquriqi)
					
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					local Type = 1
					if GLOBAL_FengXiangBiao_DateList[31][Type] == nil then
						GLOBAL_FengXiangBiao_DateList[31][Type] = {}
					end
					if GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = usecishu
					else
						GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] + usecishu
					end
				end
			end
		end
		--[[if Day == 24 then
			Day = 1
		elseif Day == 25 then
			Day = 2
		elseif Day == 26 then
			Day = 3
		elseif Day == 27 then
			Day = 4
		elseif Day == 28 then
			Day = 5
		elseif Day == 29 then
			Day = 6
		elseif Day == 30 then
			Day = 7
		end
		local yuebingid = shiyihuodongyuebing + Day
		if yuebingid > shiyihuodongyuebing and yuebingid < 88161 then
			local PackageSize = API_ActorGetPackageSize(ActorID)
			if PackageSize > 1 then
				API_AddActorGoodsFlag(ActorID,yuebingid,10,1,'中秋活动')
				API_ActorSendMsg(ActorID,17,'中秋活动开始获得'..API_GetGoodsName(yuebingid)..' x 10，祝您中秋愉快！')
				--API_ResponseWrite('<text>	 获得5颗</text><img srcgd="'..yuanshibaozhu..'" tipgd="'..yuanshibaozhu..'">')
			else
				API_SendActorMailByName(API_GetActorName(ActorID),yuebingid,10,3,'中秋活动','中秋活动开始获得'..API_GetGoodsName(yuebingid)..' x 10，祝您中秋愉快！')
				API_ActorSendMsg(ActorID,17,'中秋活动开始获得'..API_GetGoodsName(yuebingid)..' x 10，祝您中秋愉快！请到邮箱中查收')
				--API_ResponseWrite('<text>	 获得5颗</text><img srcgd="'..yuanshibaozhu..'" tipgd="'..yuanshibaozhu..'"><text>请到邮箱中查收</text>')	
			end	 
		end]]
	else
		API_VarDataSetNumber(ActorID,1,XingYunxing_shiyongxingyunxingsave,0)
	end
end

--幸运星的使用
function XingYunxing_usenow(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	if GoodsID ~= XingYunxing_goodsid then
--API_Trace('GoodsID='..GoodsID)
		return 0
	end
	local goodsnum2 = API_ActorGetGoodsNum(ActorID,GoodsID)
	if goodsnum2 <= 0 then
--API_Trace('goodsnum2='..goodsnum2)
		return 0
	end
	local dianquan = XingYunxing_dianquan
	local goodsnum = API_ActorGetGoodsNum(ActorID,VIPkey_keyid)
	if goodsnum > 0 then
		local usetime = API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave)
		if usetime > 0 then
			dianquan = XingYunxing_dianquan2
		end
	end	
--API_Trace('goodsnum='..goodsnum)	
	local PackageSize = API_ActorGetPackageSize(ActorID)
	API_ResponseWrite('<name>幸运星</name>')
	API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
	API_ResponseWrite('<text>'..API_GetGoodsName(XingYunxing_goodsid)..'活动进行中，您已获赠5个！请去邮箱收取，打开后有机会获得</text><img srcgd="11045" tipgd="11045"><img srcgd="11508" tipgd="11508"><img srcgd="11502" tipgd="11502"><text>等大礼，绝对超值。</text<br>')
	API_ResponseWrite('<text>活动期间，拥有</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,255">,额外多获得5颗</text><text>而且</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text>持有者开幸运星</text><text color="255,0,255">消耗减半</text><text>！</text><br>')
	--API_ResponseWrite('<text color="255,0,0">每'..XingYunxing_dianquan..'点券可以打开1颗</text><img srcgd="'..XingYunxing_goodsid..'" tipgd="'..XingYunxing_goodsid..'"><text color="255,0,0">获得神秘礼物，如果背包中拥有已开始计时的</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,0">，将仅需'..XingYunxing_dianquan2..'点券。</text>')
	--if API_VarDataGetNumber(ActorID,0,fuzhuangbaoshitiqupanding) == 0 then
--API_Trace('PackageSize='..PackageSize)	
	if PackageSize > 1 then
		if dianquan == XingYunxing_dianquan then
			API_ResponseWrite('<br><br><a underline="1" href="XingYunxing_usenow2?1=2">开幸运星拿奖</a><text>（需消耗'..dianquan..'点券，</text><text color="255,0,255">vip钥匙持有者仅需消耗10点券）</text><br>')
--API_Trace('333=')		
		elseif dianquan == XingYunxing_dianquan2 then
			API_ResponseWrite('<br><br><a underline="1" href="XingYunxing_usenow2?1=2">开幸运星拿奖</a><text>（需消耗'..dianquan..'点券）</text><br>')
--API_Trace('444=')		
		end
--API_Trace('111=')		
		if API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave) > 0 then 
		else
			API_ResponseWrite('<a underline="1" tip="点击此处进行点券充值" closewindow="0" http="http://yxd.21mmo.com/pay/pay.html">                                小贴士：点此领取</a><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><br><br>')	
		end	
		API_ResponseWrite('<br><br><a underline="1" href="XingYunxing_usenow2?1=1">丢弃幸运星</a><br>')
		API_ResponseFlush(ActorID)
--API_Trace('555=')			
		return 1
	else
--API_Trace('222=')		
		API_ResponseWrite('<text>您的背包已满，请至少留出2个空格后在打开</text><img srcgd="'..XingYunxing_goodsid..'" tipgd="'..XingYunxing_goodsid..'">')		
		API_ResponseWrite('<br><br><a underline="1" href="XingYunxing_usenow2?1=1">丢弃幸运星</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	--else
		--API_ResponseWrite('<text>您获得的物品还未提取，不能使用</text><img srcgd="'..XingYunxing_goodsid..'" tipgd="'..XingYunxing_goodsid..'">')		
		--API_ResponseFlush(ActorID)
		--return 0		
	--end	
end
function XingYunxing_usenow2()
	local SelectItem = API_RequestGetNumber(1)
	local ActorID = API_RequestGetActorID()
	local dianquan = XingYunxing_dianquan
	local goodsnum = API_ActorGetGoodsNum(ActorID,VIPkey_keyid)
	if goodsnum > 0 then
		local usetime = API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave)
		if usetime > 0 then
			dianquan = XingYunxing_dianquan2
		end
	end	
	if SelectItem == 1 then
			API_ResponseWrite('<name>幸运星</name>')
			API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
			API_ResponseWrite('<text>您确定要丢弃'..API_ActorGetGoodsNum(ActorID,XingYunxing_goodsid)..'个'..API_GetGoodsName(XingYunxing_goodsid)..'吗？</text>')
			API_ResponseWrite('<br><br><a underline="1" href="XingYunxing_usenow2?1=3">丢弃幸运星</a><br>')
			API_ResponseFlush(ActorID)
			return 0
	elseif SelectItem == 3 then
		if API_ActorGetGoodsNum(ActorID,XingYunxing_goodsid) > 0 then
			local num = API_ActorGetGoodsNum(ActorID,XingYunxing_goodsid)
			API_ActorRemoveGoods(ActorID,XingYunxing_goodsid,num,'幸运星丢弃')
			local usecishu = API_VarDataGetNumber(ActorID,1,XingYunxing_shiyongxingyunxingsave)
--API_Trace('usecishu='..usecishu)			
			usecishu = usecishu + num
--API_Trace('usecishu2='..usecishu)			
			API_VarDataSetNumber(ActorID,1,XingYunxing_shiyongxingyunxingsave,usecishu)	
			API_ResponseEnd()
			API_ResponseClear()
			return 1
		end			
	elseif SelectItem == 2 then
		if API_UsePoint(ActorID,3,XingYunxing_goodsid,1,dianquan) == 0 then --这里怎么搞
			--API_VarDataSetNumber(ActorID,0,fuzhuangbaoshitiqupanding,1)
			LRY_LuckStar_ZhuanPan(ActorID,XingYunxing_goodsid)	
			local usecishu = API_VarDataGetNumber(ActorID,1,XingYunxing_shiyongxingyunxingsave)
			usecishu = usecishu + 1
			API_VarDataSetNumber(ActorID,1,XingYunxing_shiyongxingyunxingsave,usecishu)	
			
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type = 2
			if GLOBAL_FengXiangBiao_DateList[31][Type] == nil then
				GLOBAL_FengXiangBiao_DateList[31][Type] = {}
			end
			if GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] + 1
			end
			
			local Type = 3
			if dianquan == XingYunxing_dianquan then
				Type = 4
			elseif dianquan == XingYunxing_dianquan2 then
				Type = 3
			end
			if GLOBAL_FengXiangBiao_DateList[31][Type] == nil then
				GLOBAL_FengXiangBiao_DateList[31][Type] = {}
			end
			if GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] + 1
			end
			
			return 1
		elseif API_UsePoint(ActorID,3,XingYunxing_goodsid,1,dianquan) == 1 then
			API_ResponseWrite('<name>幸运星</name>')
			API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
			API_ResponseWrite('<text>您身上的点券数量不足'..dianquan..'点，不能打开'..API_GetGoodsName(XingYunxing_goodsid)..'领取神秘礼物。</text>')
			API_ResponseFlush(ActorID)
			return 0
		end	
	end	
end

--卷轴的点击
function XingYunxing_juanzhoudianji()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem ~= 1 then
		--API_ResponseWrite('<win rect="300,100,400,400" move="1"></win>')
		API_ResponseWrite('<name>幸运星</name>')
		API_ResponseWrite('<win rect="300,100,400,200" move="1"></win>')	
		API_ResponseWrite('<text>'..API_GetGoodsName(XingYunxing_goodsid)..'活动进行中，您已获赠5个！请去邮箱收取，打开后有机会获得</text><img srcgd="11045" tipgd="11045"><img srcgd="11508" tipgd="11508"><img srcgd="11502" tipgd="11502"><text>等大礼，绝对超值。</text<br>')
		API_ResponseWrite('<text>活动期间，拥有</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,255">,额外多获得5颗</text><text>而且</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text>持有者开幸运星</text><text color="255,0,255">消耗减半</text><text>！</text><br>')
		--API_ResponseWrite('<text color="255,0,0">每'..XingYunxing_dianquan..'点券可以打开1颗</text><img srcgd="'..XingYunxing_goodsid..'" tipgd="'..XingYunxing_goodsid..'"><text color="255,0,0">获得神秘礼物，如果背包中拥有已开始计时的</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,0">，将仅需'..XingYunxing_dianquan2..'点券。</text><br><br>')
		--API_ResponseWrite('<a underline="1" tip="点击此处进行点券充值" closewindow="0" http="http://yxd.21mmo.com/pay/pay.html">点此领取</a><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><br><br>')
		API_ResponseWrite('<br><br><a href="XingYunxing_juanzhoudianji?1=1">关闭</a><br>')
		API_ResponseFlush(ActorID)
	else
		API_RemoveTaskScroll(ActorID,XingYunxing_keyjuanzhouid)
	end	
end
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'XingYunxing_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'XingYunxing_OnLogin') 
end
local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'XingYunxing_OnLogin' then
		OnLoginMapLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'XingYunxing_OnLogin') 
end

----------------------------------------------------------------------------------------超级幸运星的使用--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
XingYunxing_Super_dianquan = 200
XingYunxing_Super_dianquan2 = XingYunxing_Super_dianquan/2
XingYunxing_Super_goodsid = 88171

--使用
function XingYunxing_super_usenow(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	if GoodsID ~= XingYunxing_Super_goodsid then
		return 0
	end
	local goodsnum2 = API_ActorGetGoodsNum(ActorID,GoodsID)
	if goodsnum2 <= 0 then
		return 0
	end
	local dianquan = XingYunxing_Super_dianquan
	local goodsnum = API_ActorGetGoodsNum(ActorID,VIPkey_keyid)
	--判断玩家身上是否有钥匙 有的话就进入
	if goodsnum > 0 then
		local usetime = API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave)
		if usetime > 0 then
			dianquan = XingYunxing_Super_dianquan2
		end
	end	
	local PackageSize = API_ActorGetPackageSize(ActorID)
	API_ResponseWrite('<name>超级幸运星</name>')
	API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
	API_ResponseWrite('<text>恭喜您获得'..API_GetGoodsName(XingYunxing_Super_goodsid)..'，打开后您至少可以获得各种装备改造材料，如果您运气够好，更有机会获得</text><img srcgd="39512" tipgd="39512"><img srcgd="11508" tipgd="11508"><img srcgd="11502" tipgd="11502"><text>等大礼。还等什么那呢？快来试试运气吧！</text<br>')
	API_ResponseWrite('<text>活动期间，拥有</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,255">开启'..API_GetGoodsName(XingYunxing_Super_goodsid)..'拥有5折优惠！</text>br>')
	--API_ResponseWrite('<text color="255,0,0">每'..XingYunxing_dianquan..'点券可以打开1颗</text><img srcgd="'..XingYunxing_Super_goodsid..'" tipgd="'..XingYunxing_Super_goodsid..'"><text color="255,0,0">获得神秘礼物，如果背包中拥有已开始计时的</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,0">，将仅需'..XingYunxing_dianquan2..'点券。</text>')
	--if API_VarDataGetNumber(ActorID,0,fuzhuangbaoshitiqupanding) == 0 then
		if PackageSize > 1 then
			if dianquan == XingYunxing_Super_dianquan then
				API_ResponseWrite('<br><br><a underline="1" href="XingYunxing_super_usenow2">开'..API_GetGoodsName(XingYunxing_Super_goodsid)..'拿奖</a><text>（需消耗'..dianquan..'点券，</text><text color="255,0,255">vip钥匙持有并使用者消耗减半）</text><br>')
			elseif dianquan == XingYunxing_Super_dianquan2 then
				API_ResponseWrite('<br><br><a underline="1" href="XingYunxing_super_usenow2">开'..API_GetGoodsName(XingYunxing_Super_goodsid)..'拿奖</a><text>（需消耗'..dianquan..'点券）</text><br>')
			end
			if API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave) > 0 then 
			else
				API_ResponseWrite('<a underline="1" tip="点击此处进行点券充值" closewindow="0" http="http://yxd.21mmo.com/pay/pay.html">                                小贴士：点此领取</a><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><br><br>')	
			end	
			API_ResponseFlush(ActorID)
			return 1
		else
			API_ResponseWrite('<text>您的背包已满，请至少留出2个空格后在打开</text><img srcgd="'..XingYunxing_Super_goodsid..'" tipgd="'..XingYunxing_Super_goodsid..'">')		
			API_ResponseFlush(ActorID)
			return 0
		end
--	else
--		API_ResponseWrite('<text>您获得的物品还未提取，不能使用</text><img srcgd="'..XingYunxing_Super_goodsid..'" tipgd="'..XingYunxing_Super_goodsid..'">')		
--		API_ResponseFlush(ActorID)
--		return 0				
--	end	
end
function XingYunxing_super_usenow2()
	local ActorID = API_RequestGetActorID()
	local dianquan = XingYunxing_Super_dianquan
	local goodsnum = API_ActorGetGoodsNum(ActorID,VIPkey_keyid)
	if goodsnum > 0 then
		local usetime = API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave)
		if usetime > 0 then
			dianquan = XingYunxing_Super_dianquan2
		end
	end			
	local goodsnum2 = API_ActorGetGoodsNum(ActorID,XingYunxing_Super_goodsid)
	if goodsnum2 > 0 then
	else
		return
	end
	if API_UsePoint(ActorID,3,XingYunxing_Super_goodsid,1,dianquan) == 0 then --这里怎么搞
------下面那句还要改	
		--API_VarDataSetNumber(ActorID,0,fuzhuangbaoshitiqupanding,1)
		SuperLuckStar_ZhuanPan(ActorID,XingYunxing_Super_goodsid)
		
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 5 --开启超级幸运星总数
		if GLOBAL_FengXiangBiao_DateList[31][Type] == nil then
			GLOBAL_FengXiangBiao_DateList[31][Type] = {}
		end
		if GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] + 1
		end
		
		local Type = 7 --200点券开启超级幸运星总数
		if dianquan == XingYunxing_Super_dianquan then
			Type = 7
		elseif dianquan == XingYunxing_Super_dianquan2 then
			Type = 6  --100点券开启超级幸运星总数
		end
		if GLOBAL_FengXiangBiao_DateList[31][Type] == nil then
			GLOBAL_FengXiangBiao_DateList[31][Type] = {}
		end
		if GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[31][Type][LaiYuan] + 1
		end
		
		return 1
	elseif API_UsePoint(ActorID,3,XingYunxing_Super_goodsid,1,dianquan) == 1 then
		API_ResponseWrite('<name>超级幸运星</name>')
		API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
		API_ResponseWrite('<text>您身上的点券数量不足'..dianquan..'点，不能打开'..API_GetGoodsName(XingYunxing_Super_goodsid)..'领取神秘礼物。</text>')
		API_ResponseFlush(ActorID)
		return 0
	end
end

function HuoDongRiChengJuanZhouDianJi()
	local ActorID = API_RequestGetActorID()
	API_OpenWindow(ActorID,601,1);
end

function LUA_ActivitieRequest(lActID)
	local ActorID = API_RequestGetActorID()
	local lActID = API_RequestGetNumber(1)
	lActID = lActID + 1
	if lActID == 31 then--英雄之塔
		API_OpenWindow(ActorID, 603, 0);
		HeroTower_GuideScroll()
	end
end

function LUA_DetailsWndOpen()
	API_ResponseWrite('<win showwindow="0" rect="-620,-400,320,190"></win>')
end