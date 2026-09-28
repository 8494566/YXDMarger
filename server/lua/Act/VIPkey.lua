------VIP钥匙-------
------2009.8.2 林瑞宇制作-------
----设计思路 
--玩家充值 系统根据玩家充值的多少 发送钥匙到玩家的邮箱
--玩家取出钥匙后 点击使用 记录玩家1个交互数据 VIP钥匙每天可以使用1次
--玩家跨天登陆 或 12点回调 判断玩家交互数据 进行钥匙的删除

VIPkey_usetimesave = 12105 --使用时间记录	
VIPkey_usecishu =  12106 --使用次数记录
VIPkey_keyid = 88134 --绑定 不可放仓库 不可摧毁 不可邮寄
VIPkey_keyjuanzhouid = 104107 --大于14级的玩家弹出
VIPkey_keyjuanzhoutubiaoid = 104107 --大于14级的玩家弹出

local ExpHuoDong_StartTime = {Year = 2010,Month = 12,Day = 8,Hour = 0,Minute = 0,Second = 0}   -------开始时间
local ExpHuoDong_EndTime = {Year = 2011,Month = 1,Day = 12,Hour = 0,Minute = 0,Second = 0}   -------开始时间

TouXianXiTong_TXList[2002] = {AddFuncName = 'VIP_TouXian',}

--Show = -1,不显示，=0，显示灰色，=1，允许显示
--头衔字符串
--R,G,B = 头衔颜色
--Time = 持续时间
--Tip = 提示
function VIP_TouXian(ActorID)
	--获取玩家竞技场级别
	--通过表读取相应级别的：头衔名、RGB、tip提示 JJC_TouXianTable
	local QianZhui = ''
	local Tip = ''
	local Show = -1
	local R = 0
	local G = 0
	local B = 0
	local Time = 0
	if API_ActorGetGoodsNum(ActorID, 88134) > 0 then
		Show = 1
		QianZhui = 'ＶＩＰ'
		R = 255
		G = 255
		B = 0
		Tip = '尊贵VIP钥匙持有者'
	end
	return Show,QianZhui,R,G,B,Time,Tip
end



--钥匙使用函数
function VIPkey_usenow(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(ExpHuoDong_StartTime.Year,ExpHuoDong_StartTime.Month,ExpHuoDong_StartTime.Day,ExpHuoDong_StartTime.Hour,ExpHuoDong_StartTime.Minute,ExpHuoDong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(ExpHuoDong_EndTime.Year,ExpHuoDong_EndTime.Month,ExpHuoDong_EndTime.Day,ExpHuoDong_EndTime.Hour,ExpHuoDong_EndTime.Minute,ExpHuoDong_EndTime.Second)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	if GoodsID ~= VIPkey_keyid then
		return
	end
	local ExpLevel = API_GetActorExpLevel(ActorID)
	API_ResponseWrite('<name>VIP钥匙</name>')
	API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
	if ExpLevel < 15 then
		API_ResponseWrite('<img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text>只有大于14级的玩家才能使用，不使用不计时。</text>')
		API_ResponseFlush(ActorID)
		return 0
	end	
	local usetime = API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave)
	local nowtiem = os.time()	
	local shengyuday = 0
	if usetime == 0 then
		--API_ResponseWrite('<img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text>未使用</text><br>')
	end
	local todaynum = API_VarDataGetNumber(ActorID,1,VIPkey_usecishu) --今日是否使用	
	local lMonth =  math.floor(todaynum/100) --商
	local lday = math.mod(todaynum,100)		
	if todaynum > 0 then
		if lMonth ~= Month or lday ~= Day then
			API_VarDataSetNumber(ActorID,1,VIPkey_usecishu,0)
			todaynum = 0
		end
	end
	if usetime > 0 then
		local ProcessTime = os.difftime(nowtiem,usetime) --经过的时间
		local useday = math.floor(ProcessTime/86400) --商
		shengyuday = 30 - useday
		if shengyuday < 0 then
			shengyuday = 0
		end
		local shengyuhour = math.mod(ProcessTime,86400)
		shengyuhour =  math.floor(shengyuhour/3600) --商
		shengyuhour = 24 - shengyuhour
		if shengyuday > 0 then
			API_ResponseWrite('<img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,255">剩余时间'..shengyuday..'天。</text><br>')
		else
			API_ResponseWrite('<img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,255">剩余时间'..shengyuhour..'小时。</text><br>')
		end
	end	
	local addexp = ybt_task_expdanbeitable[ExpLevel]*15
	addexp = addexp/100
	addexp = PublicFun_4floor5ceil(addexp)
	--API_ResponseWrite('<text>每充值满10元可获得1把</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text>每把钥匙可使用31天。充的越多，送的越多。</text><br>')
	if todaynum == 0 then
		API_ResponseWrite('<br><text>使用</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text>后可兑换以下奖励：</text><br>')
		API_ResponseWrite('<text color="255,0,0">	 1.对放出来的宠物增加寿命1点</text><text>(必须放出宠物)</text><br>')
		API_ResponseWrite('<text color="255,0,0">	 2.获得“经验兑换券”'..addexp..'张</text><text>(等级越高数量越多)</text><br>')
		API_ResponseWrite('<text color="255,0,0">	 3.获得180点活力值</text><br>')
		if nShiFouStart <= 0 and nShiFouEnd > 0 then
			API_ResponseWrite('<text color="255,0,0">	 4.领取双倍经验2小时</text><text>(必须拥有“双倍经验卡”，“双倍经验卡”可在云游商人处获得)</text><br><br>')
		else
			API_ResponseWrite('<text color="255,0,0">	 4.领取双倍经验1小时</text><text>(必须拥有“双倍经验卡”，“双倍经验卡”可在云游商人处获得)</text><br><br>')
		end
	end
	local shangxianshijian = API_VarDataGetNumber(ActorID,1,19074)	
	local shangxianshijian2 = API_VarDataGetNumber(ActorID,1,19072)	
	local jingguoshijian = os.difftime(nowtiem,shangxianshijian2)	
	shangxianshijian = shangxianshijian + jingguoshijian	
	if shangxianshijian >= 600 then
		local zhuangtai = 0
		local zhuangtai1 = 0
		local zhuangtai2 = 0
		
		if API_GetActorConjedPetLevel(ActorID) == -1 then
			zhuangtai1 = 1
		end
		if API_ActorGetGoodsNum(ActorID,88065) == 0 then
			zhuangtai2 = 2
		end
		zhuangtai = zhuangtai1 + zhuangtai2
		if todaynum == 0 then
			if zhuangtai == 0 then
				API_ResponseWrite('<br><a href="VIPkey_usenow2">使用“'..API_GetGoodsName(VIPkey_keyid)..'”兑换奖励</a><br><br>')
			elseif zhuangtai == 1 then
				API_ResponseWrite('<text color="255,0,0">您的宠物没有放出，现在兑换奖励将不能增加宠物寿命。</text><br>')
				API_ResponseWrite('<br><a href="VIPkey_usenow2">使用“'..API_GetGoodsName(VIPkey_keyid)..'”兑换奖励</a><br><br>')
			elseif zhuangtai == 2 then
				if nShiFouStart <= 0 and nShiFouEnd > 0 then
					API_ResponseWrite('<text color="255,0,0">您身上没有“双倍经验卡”，现在兑换奖励将不能获得2小时双倍时间。</text><br>')
					API_ResponseWrite('<br><a href="VIPkey_usenow2">使用“'..API_GetGoodsName(VIPkey_keyid)..'”兑换奖励</a><br><br>')
				else
					API_ResponseWrite('<text color="255,0,0">您身上没有“双倍经验卡”，现在兑换奖励将不能获得1小时双倍时间。</text><br>')
					API_ResponseWrite('<br><a href="VIPkey_usenow2">使用“'..API_GetGoodsName(VIPkey_keyid)..'”兑换奖励</a><br><br>')
				end
			elseif zhuangtai == 3 then
				API_ResponseWrite('<text color="255,0,0">您的宠物没有放出，现在兑换奖励将不能增加宠物寿命。</text><br>')
				if nShiFouStart <= 0 and nShiFouEnd > 0 then
					API_ResponseWrite('<text color="255,0,0">您身上没有“双倍经验卡”，现在兑换奖励将不能获得2小时双倍时间。</text><br>')
				else
					API_ResponseWrite('<text color="255,0,0">您身上没有“双倍经验卡”，现在兑换奖励将不能获得1小时双倍时间。</text><br>')
				end
				API_ResponseWrite('<br><a href="VIPkey_usenow2">使用“'..API_GetGoodsName(VIPkey_keyid)..'”兑换奖励</a><br><br>')
			end
		else
			API_ResponseWrite('<br><br><br><text>您已领取了'..lMonth..'月'..lday..'日的奖励，请明日再次使用</text>')
		end
		API_ResponseFlush(ActorID)
		return 1
	else
		local shengyumin =  math.floor(shangxianshijian/60) --商
		shengyumin = 9 - shengyumin
		local shengyumiao = math.mod(shangxianshijian,60)
		shengyumiao = 60 - shengyumiao
		API_ResponseWrite('<text color="255,0,0">再过'..shengyumin..'分'..shengyumiao..'秒即可使用</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,0">获得奖励</text><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
end


--奖励函数	
function VIPkey_usenow2()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(ExpHuoDong_StartTime.Year,ExpHuoDong_StartTime.Month,ExpHuoDong_StartTime.Day,ExpHuoDong_StartTime.Hour,ExpHuoDong_StartTime.Minute,ExpHuoDong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(ExpHuoDong_EndTime.Year,ExpHuoDong_EndTime.Month,ExpHuoDong_EndTime.Day,ExpHuoDong_EndTime.Hour,ExpHuoDong_EndTime.Minute,ExpHuoDong_EndTime.Second)
	local ActorID = API_RequestGetActorID()
	local goodsnum = API_ActorGetGoodsNum(ActorID,VIPkey_keyid)
	if goodsnum < 0 then
		return
	end
	local todaynum = API_VarDataGetNumber(ActorID,1,VIPkey_usecishu) --今日是否使用
	if todaynum > 0 then
		return
	end
	--[[local dangci = 0
	if ExpLevel >=15 and ExpLevel <= 25 then
		dangci = 1
	elseif ExpLevel >=15 and ExpLevel <= 25 then
		dangci = 2
	elseif ExpLevel >=26 and ExpLevel <= 30 then
		dangci = 3
	elseif ExpLevel >=31 and ExpLevel <= 40 then
		dangci = 4
	elseif ExpLevel >=41 and ExpLevel <= 50 then
		dangci = 5
	elseif ExpLevel >=51 and ExpLevel <= 55 then
		dangci = 6
	end
	if dangci == 0 then
		return 
	end--]]
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel < 15 then
		return 
	end	
	local addexp = ybt_task_expdanbeitable[ExpLevel]*15
	addexp = addexp/100
	addexp = PublicFun_4floor5ceil(addexp)	
	API_ResponseWrite('<name>VIP钥匙</name>')	
	API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
	API_ResponseWrite('<text>使用VIP钥匙，获得：</text><br><br>')
	if API_GetActorConjedPetLevel(ActorID) ~= -1 then
		API_AddConjuredPetValue(ActorID,3,128) --宠物寿命增加1
		API_ResponseWrite('<text>	 宠物增加寿命1点</text><br>')
	else
		--API_ResponseWrite('<text>	 对放出来的宠物增加寿命1点(必须放出宠物)</text><br>')
	end 
	local GoodsID = 80498
	if API_ActorCanAddGoods(ActorID,GoodsID,addexp,1,0) ~= -1 then
		API_AddActorGoods(ActorID,GoodsID,addexp,'VIP钥匙获得')
		API_ActorSendMsg(ActorID,3,'使用VIP钥匙，获得“'..API_GetGoodsName(GoodsID)..'”'..addexp..'个。')	
		API_ResponseWrite('<text>	 获得'..addexp..'张</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'">')
	else
		API_SendActorMailByName(API_GetActorName(ActorID),GoodsID,addexp,1,''..API_GetGoodsName(VIPkey_keyid)..'奖励','使用'..API_GetGoodsName(VIPkey_keyid)..'：获得'..addexp..'个'..API_GetGoodsName(GoodsID)..'')
		API_ActorSendMsg(ActorID,3,'使用VIP钥匙，获得“'..API_GetGoodsName(GoodsID)..'”'..addexp..'个。（请到邮箱领取）')
		API_ResponseWrite('<text>	 获得'..addexp..'张</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><text>（请到邮箱领取）</text>')
	end
	API_ActorAddHunger(ActorID,180)
	API_ResponseWrite('<br><br><text>	 获得180点活力值</text><br>')
	if API_ActorGetGoodsNum(ActorID,88065) > 0 then
		local ChongZhiTimeS = 3600 --充值时间
		if nShiFouStart <= 0 and nShiFouEnd > 0 then
			ChongZhiTimeS = 7200
		end
		local ZhongTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime)
		ZhongTime = ZhongTime + ChongZhiTimeS --总时间					
		API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_ZhongTime,ZhongTime)
		
		local NowTime = os.time()
		local DayTime = ShuangBeiJingYan_DayTime
		local IsOpen = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_IsOpen)
		local TodayTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_TodayTime)
		local DoubleExpPackageTime = API_VarDataGetNumber(ActorID,1,DoubleExpPackageCard_OsTime)
		if DoubleExpPackageTime < NowTime then
			if IsOpen == 1 then						
				if API_ActorGetPropNum(ActorID,219) ~= 2 then
					API_SetActorExpMultiple(ActorID,2)
				end
				local LastTime = API_VarDataGetNumber(ActorID,1,ShuangBeiJingYan_OpenTime)										
				local ProcessTime = os.difftime(NowTime,LastTime)						
				ZhongTime = ZhongTime - ProcessTime
			
				TodayTime = TodayTime + ProcessTime								
				if TodayTime > DayTime or ZhongTime <= 0 then
					if API_ActorGetPropNum(ActorID, 219) ~= 0 then
						API_SetActorExpMultiple(ActorID,0)
					end
					API_VarDataSetNumber(ActorID,1,ShuangBeiJingYan_IsOpen,0)
				end
			else					
				if API_ActorGetPropNum(ActorID,219) ~= 0 then
					API_SetActorExpMultiple(ActorID,0)
				end
			end
		end
		if ZhongTime < 0 then
			ZhongTime = 0
		end
		local TodayShenYu = DayTime - TodayTime					
		if TodayShenYu > ZhongTime then
			TodayShenYu = ZhongTime
		end
		if TodayShenYu < 0 then
			TodayShenYu = 0
		end
		local ShengYuH = math.floor(ZhongTime/3600)
		local ShengYuMS = math.mod(ZhongTime,3600)
		local ShengYuM = math.floor(ShengYuMS/60)
		local ShengYuS = math.mod(ShengYuMS,60)							
		local TodayShengYuH = math.floor(TodayShenYu/3600)
		local TodayShengYuMS = math.mod(TodayShenYu,3600)
		local TodayShengYuM = math.floor(TodayShengYuMS/60)
		local TodayShengYuS = math.mod(TodayShengYuMS,60)
		API_ResponseWrite('<br><text>	 您的剩余双倍时间是：</text><text color="255,0,255">'..ShengYuH..'小时 '..ShengYuM..'分 '..ShengYuS..'秒</text><br>')
		API_ResponseWrite('<text>	 您今天还可以使用：</text><text color="255,0,255">'..TodayShengYuH..'小时 '..TodayShengYuM..'分 '..TodayShengYuS..'秒</text><br>')
	end
	local usetime = API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave)
	if usetime == 0 then
		local nowtiem = os.time()
		API_VarDataSetNumber(ActorID,1,VIPkey_usetimesave,nowtiem)
	end
	local riqi = Month * 100 + Day
	API_VarDataSetNumber(ActorID,1,VIPkey_usecishu,riqi)
--判断是否是幸运星活动期间	
	local nShiFouStart = API_DiffDatatime(XingYunxing_StartTime.Year,XingYunxing_StartTime.Month,XingYunxing_StartTime.Day,XingYunxing_StartTime.Hour,XingYunxing_StartTime.Minute,XingYunxing_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(XingYunxing_EndTime.Year,XingYunxing_EndTime.Month,XingYunxing_EndTime.Day,XingYunxing_EndTime.Hour,XingYunxing_EndTime.Minute,XingYunxing_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		local begintime = XingYunxing_StartTime.Year * 10000 + XingYunxing_StartTime.Month * 100 + XingYunxing_StartTime.Day
		if API_VarDataGetNumber(ActorID,1,XingYunxing_geixingyunxingsave) < begintime then --还没送过幸运星
		elseif API_VarDataGetNumber(ActorID,1,XingYunxing_geixingyunxingsave) >= begintime then --已经送过了
			if API_VarDataGetNumber(ActorID,1,XingYunxing_keyongnumMAX) < begintime then
				local num = 5
				if Month == 10 then
					if Day < 9 then
						num = 10
					end
				end
				local num2 = num * 2
				API_ResponseWrite('<br><text>	 幸运星活动期间内，使用</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,255">额外增送</text><img srcgd="'..XingYunxing_goodsid..'" tipgd="'..XingYunxing_goodsid..'"><text>*'..num..'（请到邮箱中查收）</text><br>')
				API_ResponseWrite('<text>	 首次幸运星活动期间使用</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text>后，每日幸运星将最多获得'..num2..'颗</text><br>')
				API_SendActorMailByName(API_GetActorName(ActorID),XingYunxing_goodsid,num,3,''..API_GetGoodsName(XingYunxing_goodsid)..'活动赠送','打开'..API_GetGoodsName(XingYunxing_goodsid)..'可以获得神秘礼物，打开1次需要'..XingYunxing_dianquan..'点券。如果背包中有正在使用的'..API_GetGoodsName(VIPkey_keyid)..'，那么只需要'..XingYunxing_dianquan2..'点券就可以打开。')			---- 10.1过节后取消屏蔽
				API_VarDataSetNumber(ActorID,1,XingYunxing_keyongnumMAX,begintime)
			end
		end
	end
	API_ResponseFlush(ActorID)
end


--每日12点回调函数
function VIPkey_keldelete(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local todaynum = API_VarDataGetNumber(ActorID,1,VIPkey_usecishu) --今日是否使用
	if todaynum > 0 then
		if todaynum ~= Month * 100 + Day then
			API_VarDataSetNumber(ActorID,1,VIPkey_usecishu,0)
		end	
	end
	local usetime = API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave)
	local goodsnum = API_ActorGetGoodsNum(ActorID,VIPkey_keyid)
	if usetime ~= 0 and goodsnum > 0 then
		local nowtiem = os.time()
		local ProcessTime = os.difftime(nowtiem,usetime)		
		if ProcessTime >= 86400 * 31 then		
			API_ActorRemoveGoods(ActorID,VIPkey_keyid,1,'VIP钥匙到期') -- 删除钥匙			
			API_VarDataSetNumber(ActorID,1,VIPkey_usetimesave,0) --使用时间清0
			API_VarDataSetNumber(ActorID,1,XingYunxing_keyongnumMAX,0)
			API_ActorSendMsg(ActorID,3,'您背包中的“'..API_GetGoodsName(VIPkey_keyid)..'”已到31天的期限，所以删除1把。充值可获得“'..API_GetGoodsName(VIPkey_keyid)..'”')	
			API_ResponseWrite('<name>VIP钥匙</name>')
			API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
			API_ResponseWrite('<text>您背包中的</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text>已到31天的期限，所以删除1把。</text><br><text>充值9元可获得</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text>1把，每把的使用期是31天。</text>')			
			API_ResponseFlush(ActorID)
		end
	end
end


--进入游戏卷轴添加函数	
function VIPkey_OnLogin(ActorID)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel < 15 then
		return 
	end
	--local nType = API_VarDataGetNumber(ActorID, 0, 18368)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(XingYunxing_StartTime.Year,XingYunxing_StartTime.Month,XingYunxing_StartTime.Day,XingYunxing_StartTime.Hour,XingYunxing_StartTime.Minute,XingYunxing_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(XingYunxing_EndTime.Year,XingYunxing_EndTime.Month,XingYunxing_EndTime.Day,XingYunxing_EndTime.Hour,XingYunxing_EndTime.Minute,XingYunxing_EndTime.Second)	
	if MapID == StaticMapID then	
		API_RemoveTaskScroll(ActorID,VIPkey_keyjuanzhouid)
		if nShiFouStart < 0 and nShiFouEnd > 0 then
		else
			--local nType = API_VarDataGetNumber(ActorID, 0, 18368)
			--if nType == 1 then
				local nShiFouStart2 = API_DiffDatatime(CaiBaoZhuhuodong_StartTime.Year,CaiBaoZhuhuodong_StartTime.Month,CaiBaoZhuhuodong_StartTime.Day,CaiBaoZhuhuodong_StartTime.Hour,CaiBaoZhuhuodong_StartTime.Minute,CaiBaoZhuhuodong_StartTime.Second)
				local nShiFouEnd2 = API_DiffDatatime(CaiBaoZhuhuodong_EndTime2.Year,CaiBaoZhuhuodong_EndTime2.Month,CaiBaoZhuhuodong_EndTime2.Day,CaiBaoZhuhuodong_EndTime2.Hour,CaiBaoZhuhuodong_EndTime2.Minute,CaiBaoZhuhuodong_EndTime2.Second)
				if nShiFouStart2 < 0 and nShiFouEnd2 > 0 then
				else
					--API_AddTaskScrollEx(ActorID,VIPkey_keyjuanzhouid,VIPkey_keyjuanzhoutubiaoid,'VIPkey_juanzhoudianji',0)
					LRY_UItwinkemanage(ActorID,15,85,VIPkey_keyjuanzhoutubiaoid,VIPkey_keyjuanzhouid,42,'VIPkey_juanzhoudianji')
				end
			--end
		end
	end
end


--卷轴点击函数	
function VIPkey_juanzhoudianji()
	local ActorID = API_RequestGetActorID()
	local ExpLevel = API_GetActorExpLevel(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local nShiFouStart = API_DiffDatatime(ExpHuoDong_StartTime.Year,ExpHuoDong_StartTime.Month,ExpHuoDong_StartTime.Day,ExpHuoDong_StartTime.Hour,ExpHuoDong_StartTime.Minute,ExpHuoDong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(ExpHuoDong_EndTime.Year,ExpHuoDong_EndTime.Month,ExpHuoDong_EndTime.Day,ExpHuoDong_EndTime.Hour,ExpHuoDong_EndTime.Minute,ExpHuoDong_EndTime.Second)
	if ExpLevel < 15 then
		return 
	end	
	if SelectItem ~= 1 then
		local addexp = ybt_task_expdanbeitable[ExpLevel]*15
		addexp = addexp/100
		addexp = PublicFun_4floor5ceil(addexp)		
		API_ResponseWrite('<name>VIP钥匙</name>')
		API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
		API_ResponseWrite('<text>每个月充值满9元可在邮箱中免费获得一把</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><br>')
		API_ResponseWrite('<text>每天在线达到10分钟后，可以使用</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text>获得以下奖励：</text><br><br>')
		API_ResponseWrite('<text color="255,0,0">	 1.对放出来的宠物增加寿命1点</text><text>(必须放出宠物)</text><br>')
		API_ResponseWrite('<text color="255,0,0">	 2.获得“经验兑换券”'..addexp..'张</text><text>(等级越高数量越多)</text><br>')
		API_ResponseWrite('<text color="255,0,0">	 3.获得180点活力值</text><br>')
		if nShiFouStart <= 0 and nShiFouEnd > 0 then
			API_ResponseWrite('<text color="255,0,0">	 4.领取双倍经验2小时</text><text>(必须拥有“双倍经验卡”，“双倍经验卡”可在云游商人处获得)</text><br><br>')		
		else
			API_ResponseWrite('<text color="255,0,0">	 4.领取双倍经验1小时</text><text>(必须拥有“双倍经验卡”，“双倍经验卡”可在云游商人处获得)</text><br><br>')
		end
		API_ResponseWrite('<text>每把钥匙可以持续31天，每天可领取一次奖励。</text><br>')	
		API_ResponseWrite('<br><a underline="1" tip="点击此处进行点券充值" closewindow="0" http="http://yxd.21mmo.com/pay/pay.html">如何获得</a><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><br><br>')		
		API_ResponseWrite('<br><br><a href="VIPkey_juanzhoudianji?1=1">关闭</a><br>')
		API_ResponseFlush(ActorID)
	else
		API_RemoveTaskScroll(ActorID,VIPkey_keyjuanzhouid)
	end	
end
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'VIPkey_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'VIPkey_OnLogin') 
end
local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'VIPkey_OnLogin' then
		OnLoginMapLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'VIPkey_OnLogin') 
end