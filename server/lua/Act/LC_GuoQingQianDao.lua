-------------------------------
--文件名:	Scp\Lua\Act\LC_GuoQingQianDao.lua
--版  权:	深圳腾讯计算机系统有限公司
--创建人:	刘操
--日  期:	2011-10-15
--版  本:	
--描  述:	国庆活动
--应  用:  
-------------------------------


GLOBAL_GuoQingOnline_StartTime = {Year = 2012,Month = 9,Day = 21,Hour = 0,Minute = 0,Second = 0}
GLOBAL_GuoQingOnline_EndTime = {Year = 2012,Month = 10,Day = 8,Hour = 0,Minute = 0,Second = 0}
GuoqingHuiZhang_EndTime = {Year = 2012,Month = 10,Day = 8,Hour = 0,Minute = 0,Second = 0}

local LC_LiJiangTime = 30277--领奖时间
local LC_ChouJiangTime = 30278--抽奖时间
local LC_OnLoginTime = 30279--上线时间
local LC_OnlineTime = 30280--在线时长

local GuoQingOnline_juanzhouid = 90007--卷轴ID
local GuoQingOnline_tubiaoid = 104125--卷轴图标ID

--上线判断
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'LC_GuoQingOnline_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'LC_GuoQingOnline_OnLogin') 
end

--下线判断
local OnLogoutLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLogoutFuncNameList) do 
	if GLOBAL_ActMain_OnLogoutFuncNameList[i] == 'LC_GuoQingOnline_OnLogout' then
		OnLogoutLoadOK = 1
		break
	end 
end 
if OnLogoutLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLogoutFuncNameList,'LC_GuoQingOnline_OnLogout') 
end

--上线回调
function LC_GuoQingOnline_OnLogin() 
	local ActorID = API_RequestGetActorID()
	local OnLoginType = API_VarDataGetNumber(ActorID,0,18368)
	local StartTimeTable = GLOBAL_GuoQingOnline_StartTime
	local EndTimeTable = GLOBAL_GuoQingOnline_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	
	--API_Trace("OnLoginType "..OnLoginType )

	if OnLoginType ~= 2 then
	--API_Trace("111111 " )
		if nShiFouStart <= 0 and nShiFouEnd > 0 then
			--API_Trace("22222222222" )
			API_RemoveTaskScroll(ActorID,GuoQingOnline_juanzhouid)
			LRY_UItwinkemanage(ActorID,15,85,GuoQingOnline_tubiaoid,GuoQingOnline_juanzhouid,20,'LC_GuoQingOnline_juanzhoudianji')--加载图标
			local LoginTime =os.time()
			API_VarDataSetNumber(ActorID,1,LC_OnLoginTime,LoginTime)
		else
			--API_Trace("33333333" )
			API_RemoveTaskScroll(ActorID,GuoQingOnline_juanzhouid)
		end
	end
	local LoginTime =os.time()
	local LoginDate = os.date("*t",LoginTime)
	LoginDate.hour = 20
	LoginDate.min = 29
	LoginDate.sec = 59
	local StartTime = os.time(LoginDate) + 1
	LoginDate.hour = 21
	LoginDate.min = 29
	LoginDate.sec = 59
	local EndTime = os.time(LoginDate) + 1
	--API_Trace("StartTime "..StartTime )
	--API_Trace("EndTime "..EndTime )
	API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,1,StartTime)
	API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,2,EndTime)
end

--下线回调
function LC_GuoQingOnline_OnLogout()
	local ActorID = API_RequestGetActorID()
	local LoginTime = API_VarDataGetNumber(ActorID,1,LC_OnLoginTime)
	local LoginDate = os.date("*t", LoginTime)
	local LoginYear = LoginDate.year
	local LoginMonth = LoginDate.month
	local LoginDay = LoginDate.day
	local LoginHour = LoginDate.hour
	local LoginMinute = LoginDate.minute
	local Year,Month,Day,Hour,Minute,Second = PublicFun_time()
	local StartTimeTable = GLOBAL_GuoQingOnline_StartTime
	local EndTimeTable = GLOBAL_GuoQingOnline_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local StartTime = API_VarDataGetNumber_Ex(1,0,-6015,1,1)
	local EndTime = API_VarDataGetNumber_Ex(1,0,-6015,1,2)
	local NowTime =os.time()
	if nShiFouStart <= 0 and nShiFouEnd > 0 then	
		if NowTime < StartTime then
		elseif NowTime < EndTime then
			if LoginTime < StartTime then
					local LogoutTime = os.time()
					local LogoutDate = os.date("*t",LogoutTime)
					LogoutDate.hour = 20
					LogoutDate.min = 29
					LogoutDate.sec = 59
					local LoginTime = os.time(LogoutDate) + 1
					local Online1 = LogoutTime - LoginTime
					local Online2 = API_VarDataGetNumber(ActorID,1,LC_OnlineTime)
					local Online = Online1 + Online2
					API_VarDataSetNumber(ActorID,1,LC_OnlineTime,Online)
			elseif LoginTime < EndTime then
					local LogoutTime = os.time()
					local Online1 = LogoutTime - LoginTime
					local Online2 = API_VarDataGetNumber(ActorID,1,LC_OnlineTime)
					local Online = Online1 + Online2
					API_VarDataSetNumber(ActorID,1,LC_OnlineTime,Online)
			else
			end
		else
			if LoginTime < StartTime then				
				API_VarDataSetNumber(ActorID,1,LC_OnlineTime,2700)
			elseif LoginTime < EndTime then
				LoginDate.hour = 21
				LoginDate.min = 29
				LoginDate.sec = 59
				local LogoutTime = os.time(LoginDate) + 1
				local Online1 = LogoutTime - LoginTime
				local Online2 = API_VarDataGetNumber(ActorID,1,LC_OnlineTime)
				local Online = Online1 + Online2
				API_VarDataSetNumber(ActorID,1,LC_OnlineTime,Online)
			else
			end
		end
	end
end

--卷轴点击
function LC_GuoQingOnline_juanzhoudianji()
	local ActorID = ActorID or API_RequestGetActorID()
	local Year,Month,Day,Hour,Minute,Second = PublicFun_time()
	local LiJiangTime = API_VarDataGetNumber(ActorID,1,LC_LiJiangTime)
	local LiJiangDate = os.date("*t", LiJiangTime)
	local LC_LiJiangYear = LiJiangDate.year
	local LC_LiJiangMonth = LiJiangDate.month
	local LC_LiJiangDay = LiJiangDate.day
	local LoginHour = LiJiangDate.hour
	local ChouJiangTime = API_VarDataGetNumber(ActorID,1,LC_ChouJiangTime)
	local ChouJiangDate = os.date("*t", ChouJiangTime)
	local LC_ChouJiangYear = ChouJiangDate.year
	local LC_ChouJiangMonth = ChouJiangDate.month
	local LC_ChouJiangDay = ChouJiangDate.day
	local LoginHour = ChouJiangDate.hour
	API_ResponseWrite('<win rect="250,250,500,220"></win>')
	API_ResponseWrite('<name>国庆在线送好礼</name>')
	API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
	API_ResponseWrite('<text>    欢迎来到英雄岛！国庆活动期间每日20：30至21：30累计在线45分钟，你便可以参与一次国庆在线抽奖活动。每日21:00至21:10之间还可领取丰厚奖励的国庆大礼包。</text><br>')
	if Year ~= LC_ChouJiangYear or Month ~= LC_ChouJiangMonth or Day ~= LC_ChouJiangDay then	
		API_ResponseWrite('<br><a href="LC_GuoQingOnline_juanzhoudianji_Title?1=100">抽奖！！</a><br>')
	else
		API_ResponseWrite('<br><text>已抽奖</text><br>')
	end
	if Year ~= LC_LiJiangYear or Month ~= LC_LiJiangMonth or Day ~= LC_LiJiangDay then
		API_ResponseWrite('<br><a href="LC_GuoQingOnline_juanzhoudianji_Title?1=200">领取国庆大礼包</a><br>')
	else
		API_ResponseWrite('<br><text>已领取国庆大礼包</text><br>')
	end
	API_ResponseWrite('<br><a>关闭</a>')
	API_ResponseFlush(ActorID)
	return 1
end

local GuoQingOnlineChouJiangTable = {
[1] = {
			{GoodsID=80832,GaiLv1=1,GaiLv2=958685,NumMax=15,NumMin=5},
			{GoodsID=80833,GaiLv1=958686,GaiLv2=1917371,NumMax=10,NumMin=5},
			{GoodsID=82004,GaiLv1=1917372,GaiLv2=2716276,NumMax=10,NumMin=5},
			{GoodsID=80274,GaiLv1=2716277,GaiLv2=3515181,NumMax=5,NumMin=4},
			{GoodsID=845,GaiLv1=3515182,GaiLv2=4314086,NumMax=3,NumMin=1},
			{GoodsID=80383,GaiLv1=4314087,GaiLv2=5112991,NumMax=2,NumMin=1},
			{GoodsID=80381,GaiLv1=5112992,GaiLv2=5911896,NumMax=2,NumMin=1},
			{GoodsID=89041,GaiLv1=5911897,GaiLv2=6151568,NumMax=1,NumMin=1},
			{GoodsID=89044,GaiLv1=6151569,GaiLv2=6391240,NumMax=1,NumMin=1},
			{GoodsID=9503,GaiLv1=6391241,GaiLv2=6511076,NumMax=1,NumMin=1},
			{GoodsID=9503,GaiLv1=6511077,GaiLv2=6630912,NumMax=1,NumMin=1},
			{GoodsID=501,GaiLv1=6630913,GaiLv2=6950474,NumMax=5,NumMin=4},
			{GoodsID=75,GaiLv1=6950475,GaiLv2=7142212,NumMax=2,NumMin=1},
			{GoodsID=80195,GaiLv1=7142213,GaiLv2=7781336,NumMax=30,NumMin=20},
			{GoodsID=38068,GaiLv1=7781337,GaiLv2=8164811,NumMax=1,NumMin=1},
			{GoodsID=38075,GaiLv1=8164812,GaiLv2=8548286,NumMax=1,NumMin=1},
			{GoodsID=38076,GaiLv1=8548287,GaiLv2=8931761,NumMax=1,NumMin=1},
			{GoodsID=38077,GaiLv1=8931762,GaiLv2=9315236,NumMax=1,NumMin=1},
			{GoodsID=80065,GaiLv1=9315237,GaiLv2=9771753,NumMax=30,NumMin=20},
			{GoodsID=80049,GaiLv1=9771754,GaiLv2=10000000,NumMax=30,NumMin=20},
},
[2] = {
			{GoodsID=80832,GaiLv1=1,GaiLv2=958685,NumMax=25,NumMin=15},
			{GoodsID=80833,GaiLv1=958686,GaiLv2=1917371,NumMax=15,NumMin=5},
			{GoodsID=82004,GaiLv1=1917372,GaiLv2=2716276,NumMax=15,NumMin=5},
			{GoodsID=80274,GaiLv1=2716277,GaiLv2=3515181,NumMax=5,NumMin=4},
			{GoodsID=845,GaiLv1=3515182,GaiLv2=4314086,NumMax=3,NumMin=1},
			{GoodsID=80384,GaiLv1=4314087,GaiLv2=5112991,NumMax=2,NumMin=1},
			{GoodsID=80382,GaiLv1=5112992,GaiLv2=5911896,NumMax=2,NumMin=1},
			{GoodsID=89041,GaiLv1=5911897,GaiLv2=6151568,NumMax=1,NumMin=1},
			{GoodsID=89044,GaiLv1=6151569,GaiLv2=6391240,NumMax=1,NumMin=1},
			{GoodsID=9503,GaiLv1=6391241,GaiLv2=6511076,NumMax=1,NumMin=1},
			{GoodsID=9503,GaiLv1=6511077,GaiLv2=6630912,NumMax=1,NumMin=1},
			{GoodsID=501,GaiLv1=6630913,GaiLv2=6950474,NumMax=5,NumMin=4},
			{GoodsID=75,GaiLv1=6950475,GaiLv2=7142212,NumMax=2,NumMin=1},
			{GoodsID=80196,GaiLv1=7142213,GaiLv2=7781336,NumMax=30,NumMin=20},
			{GoodsID=38068,GaiLv1=7781337,GaiLv2=8164811,NumMax=1,NumMin=1},
			{GoodsID=38075,GaiLv1=8164812,GaiLv2=8548286,NumMax=1,NumMin=1},
			{GoodsID=38076,GaiLv1=8548287,GaiLv2=8931761,NumMax=1,NumMin=1},
			{GoodsID=38077,GaiLv1=8931762,GaiLv2=9315236,NumMax=1,NumMin=1},
			{GoodsID=80066,GaiLv1=9315237,GaiLv2=9771753,NumMax=30,NumMin=20},
			{GoodsID=80050,GaiLv1=9771754,GaiLv2=10000000,NumMax=30,NumMin=20},
},
}

--卷轴点击判断
function LC_GuoQingOnline_juanzhoudianji_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	local Year,Month,Day,Hour,Minute,Second = PublicFun_time()
	local LiJiangTime = API_VarDataGetNumber(ActorID,1,LC_LiJiangTime)
	local LiJiangDate = os.date("*t", LiJiangTime)
	local LC_LiJiangYear = LiJiangDate.year
	local LC_LiJiangMonth = LiJiangDate.month
	local LC_LiJiangDay = LiJiangDate.day

	local ChouJiangTime = API_VarDataGetNumber(ActorID,1,LC_ChouJiangTime)
	local ChouJiangDate = os.date("*t", ChouJiangTime)
	local LC_ChouJiangYear = ChouJiangDate.year
	local LC_ChouJiangMonth = ChouJiangDate.month
	local LC_ChouJiangDay = ChouJiangDate.day
	
	local LoginTime = API_VarDataGetNumber(ActorID,1,LC_OnLoginTime)
	local LoginDate = os.date("*t", LoginTime)	
	local LoginYear = LoginDate.year
	local LoginMonth = LoginDate.month
	local LoginDay = LoginDate.day
	local LoginHour = LoginDate.hour
	local StartTimeTable = GLOBAL_GuoQingOnline_StartTime
	local EndTimeTable = GLOBAL_GuoQingOnline_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local OnlineTime = 0
	local NowTime =os.time()
	
	local StartTime = API_VarDataGetNumber_Ex(1,0,-6015,1,1)
	local EndTime = API_VarDataGetNumber_Ex(1,0,-6015,1,2)
	
	if nShiFouStart > 0 then
		API_RemoveTaskScroll(ActorID,RongYuXunZhang_juanzhouid)
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>国庆在线送好礼</name>')
		API_ResponseWrite('<text>    亲爱的玩家，国庆在线送好礼活动还未开始，请活动开始后再来领取奖励。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return	
	elseif nShiFouEnd <= 0 then
		API_RemoveTaskScroll(ActorID,RongYuXunZhang_juanzhouid)
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>国庆在线送好礼</name>')
		API_ResponseWrite('<text>    亲爱的玩家，国庆在线送好礼活动已经结束，感谢您的参与。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return	
	end
	
	if nShiFouStart <= 0 and nShiFouEnd > 0 then	
		if NowTime < StartTime then
		elseif NowTime < EndTime then
			if LoginTime < StartTime then
					local LogoutTime = os.time()
					local LogoutDate = os.date("*t",LogoutTime)
					LogoutDate.hour = 20
					LogoutDate.min = 29
					LogoutDate.sec = 59
					local LoginTime = os.time(LogoutDate) + 1
					local Online1 = LogoutTime - LoginTime
					OnlineTime = Online1
			elseif LoginTime < EndTime then
					local LogoutTime = os.time()
					local Online1 = LogoutTime - LoginTime
					local Online2 = API_VarDataGetNumber(ActorID,1,LC_OnlineTime)
					OnlineTime = Online1 + Online2
			else
			end
		else
			if LoginTime < StartTime then				
				OnlineTime = 2700
			elseif LoginTime < EndTime then
				LoginDate.hour = 21
				LoginDate.min = 29
				LoginDate.sec = 59
				local LogoutTime = os.time(LoginDate) + 1
				local Online1 = LogoutTime - LoginTime
				local Online2 = API_VarDataGetNumber(ActorID,1,LC_OnlineTime)
				OnlineTime = Online1 + Online2
			else
				OnlineTime = API_VarDataGetNumber(ActorID,1,LC_OnlineTime)
			end
		end
	end
	local Min = math.floor(OnlineTime/60)	
	
	if SelectItem == 100 then
		if OnlineTime < 2700 then
			if NowTime < StartTime then
				API_ResponseWrite('<win rect="250,250,500,220"></win>')
				API_ResponseWrite('<name>国庆在线送好礼</name>')
				API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
				API_ResponseWrite('<text>    您今天在20：30至21：30之间累计在线达到45分钟即可抽取一次奖励，目前活动计时尚未开始。</text><br>')
				API_ResponseWrite('<br><a>关闭</a>')
				API_ResponseFlush(ActorID)			
			elseif NowTime < EndTime then
				API_ResponseWrite('<win rect="250,250,500,220"></win>')
				API_ResponseWrite('<name>国庆在线送好礼</name>')
				API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
				API_ResponseWrite('<text>    您今天在20：30至21：30之间累计在线还不足45分钟，现已经累计在线</text><text color="255,0,255">'..Min..'分钟</text><br>')
				API_ResponseWrite('<br><a>关闭</a>')
				API_ResponseFlush(ActorID)
			else
				API_ResponseWrite('<win rect="250,250,500,220"></win>')
				API_ResponseWrite('<name>国庆在线送好礼</name>')
				API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
				API_ResponseWrite('<text>    您今天在20点至21点之间已经累计在线不足45分钟。</text><br>')
				API_ResponseWrite('<br><a>关闭</a>')
				API_ResponseFlush(ActorID)			
			end
		else	
			if API_ActorGetPackageSize(ActorID) < 2 then
				API_ResponseWrite('<name>国庆在线送好礼</name>')
				API_ResponseWrite('<text>您的背包空间不足，请至少保留两个空格，再抽取奖励。</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
				API_ResponseFlush(ActorID)
				return				
			end
			if Year ~= LC_ChouJiangYear or Month ~= LC_ChouJiangMonth or Day ~= LC_ChouJiangDay then	
				local Tepy = 1
				if ExpLevel <= 25 then
					Tepy = 1
				else
					Tepy = 2
				end
				local JiangLiTable = GuoQingOnlineChouJiangTable[Tepy]
				local JiangLiGaiLv = math.random(10000000)			
				for j in JiangLiTable do
					local GaiLv1 = JiangLiTable[j].GaiLv1
					local GaiLv2 = JiangLiTable[j].GaiLv2
					local NumMax = JiangLiTable[j].NumMax
					local NumMin = JiangLiTable[j].NumMin
					local JiangLiGoodsNum = math.random(NumMin,NumMax)

					if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
						local JiangLiGoodsID = JiangLiTable[j].GoodsID
						if JiangLiGoodsNum <= 0 then
							JiangLiGoodsID = 82004
							JiangLiGoodsNum = 10
						end	

						if API_ActorCanAddGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,3,0) ~= -1 then
							API_AddActorGoodsFlag(ActorID,JiangLiGoodsID,JiangLiGoodsNum,3,'')
							API_ResponseWrite('<name>国庆在线送好礼</name>')
							API_ResponseWrite('<text>恭喜你抽中了'..JiangLiGoodsNum..'个</text><img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'" ><text>，谢谢您的参与。</text><br>')
							API_ResponseWrite('<br><a>确定</a>')
							API_AddActorGoodsFlag(ActorID,89073,10,0,'获得欢度国庆[欢]')						
							API_ResponseFlush(ActorID)
							local JiangLiTime = os.time()
							API_VarDataSetNumber(ActorID,1,LC_ChouJiangTime,JiangLiTime)
							API_ActorSendMsg(ActorID,8,'获得'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')
							API_ActorSendMsg(ActorID,8,'获得10个'..API_GetGoodsName(89073)..'')
						end
					end
				end
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[72][1][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[72][1][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[72][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[72][1][LaiYuan] + 1
				end
			else
				API_ResponseWrite('<name>国庆在线送好礼</name>')
				API_ResponseWrite('<text>您今天已经参与过国庆在线抽奖了。</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
				API_ResponseFlush(ActorID)
				return				
			end
		end	
	elseif SelectItem == 200 then
		if Year ~= LC_LiJiangYear or Month ~= LC_LiJiangMonth or Day ~= LC_LiJiangDay then
			if Hour == 21 and Minute <= 10 then
				if API_ActorCanAddGoods(ActorID,89092,1,3,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,89092,1,3,'获得国庆大礼包')
					API_ActorSendMsg(ActorID,8,'获得国庆大礼包')
					API_ResponseWrite('<win rect="250,250,500,220"></win>')
					API_ResponseWrite('<name>国庆在线送好礼</name>')
					API_ResponseWrite('<text>恭喜你获得</text><img srcgd="89092" tipgd="89092"><text></text><br>')
					API_ResponseWrite('<br><a>确定</a>')
					API_ResponseFlush(ActorID)
					local JiangLiTime = os.time()
					API_VarDataSetNumber(ActorID,1,LC_LiJiangTime,JiangLiTime)
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[72][2][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[72][2][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[72][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[72][2][LaiYuan] + 1
					end
				else
					API_ResponseWrite('<win rect="250,250,500,220"></win>')
					API_ResponseWrite('<name>国庆在线送好礼</name>')
					API_ResponseWrite('<text>您的背包空间不够，请整理背包之后再领取奖励。</text><br>')
					API_ResponseWrite('<a>确定</a>')
					API_ResponseFlush(ActorID)
				end
			else
				API_ResponseWrite('<win rect="250,250,500,220"></win>')
				API_ResponseWrite('<name>国庆在线送好礼</name>')
				API_ResponseWrite('<text>亲爱的玩家，国庆在线大礼包只能在活动期间每日21：00至21：10之间领取哦！</text><br>')
				API_ResponseWrite('<a>确定</a>')
				API_ResponseFlush(ActorID)
			end
		else
			API_ResponseWrite('<name>国庆在线送好礼</name>')
			API_ResponseWrite('<text>您今天已经领取过国庆大礼包了。</text>')
			API_ResponseWrite('<br><br><a>确定</a>')
			API_ResponseFlush(ActorID)
			return		
		end
	end
end

--跨天清除
function GuoQingOnline_KuaTianHuiDiao(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	API_VarDataSetNumber(ActorID,1,LC_OnlineTime,0)--清除在线时长
	local LoginTime =os.time()
	API_VarDataSetNumber(ActorID,1,LC_OnLoginTime,LoginTime)--跨天重新设置上线时间
	local LoginDate = os.date("*t",LoginTime)
	LoginDate.hour = 20
	LoginDate.min = 29
	LoginDate.sec = 59
	local StartTime = os.time(LoginDate) + 1
	LoginDate.hour = 21
	LoginDate.min = 29
	LoginDate.sec = 59
	local EndTime = os.time(LoginDate) + 1
	API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,1,StartTime)
	API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,2,EndTime)
end


local AiGuoZheBaoXiang_GoodsTable = {
[1] = {
			{GoodsID=80397,GaiLv1=1,GaiLv2=953955,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80383,GaiLv1=953956,GaiLv2=2225896,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80381,GaiLv1=2225897,GaiLv2=3497837,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=89042,GaiLv1=3497838,GaiLv2=3574154,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=3574155,GaiLv2=3955737,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40003,GaiLv1=3955738,GaiLv2=4337320,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40013,GaiLv1=4337321,GaiLv2=4718903,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40023,GaiLv1=4718904,GaiLv2=5100486,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40093,GaiLv1=5100487,GaiLv2=5482069,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80689,GaiLv1=5482070,GaiLv2=5863652,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31101,GaiLv1=5863653,GaiLv2=6054444,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=75,GaiLv1=6054445,GaiLv2=6436027,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39511,GaiLv1=6436028,GaiLv2=6474186,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39514,GaiLv1=6474187,GaiLv2=6512345,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39504,GaiLv1=6512346,GaiLv2=6550504,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39505,GaiLv1=6550505,GaiLv2=6588663,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39506,GaiLv1=6588664,GaiLv2=6626822,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11537,GaiLv1=6626823,GaiLv2=6652261,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11538,GaiLv1=6652262,GaiLv2=6677700,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11539,GaiLv1=6677701,GaiLv2=6703139,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11540,GaiLv1=6703140,GaiLv2=6728578,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11330,GaiLv1=6728579,GaiLv2=6747658,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11331,GaiLv1=6747659,GaiLv2=6766738,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11332,GaiLv1=6766739,GaiLv2=6785818,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11333,GaiLv1=6785819,GaiLv2=6804898,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11071,GaiLv1=6804899,GaiLv2=6823978,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11072,GaiLv1=6823979,GaiLv2=6843058,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11046,GaiLv1=6843059,GaiLv2=6868497,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11047,GaiLv1=6868498,GaiLv2=6893936,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=310,GaiLv1=6893937,GaiLv2=8165877,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31040,GaiLv1=8165878,GaiLv2=8178597,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31027,GaiLv1=8178598,GaiLv2=8191317,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31028,GaiLv1=8191318,GaiLv2=8204037,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31029,GaiLv1=8204038,GaiLv2=8216757,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31030,GaiLv1=8216758,GaiLv2=8226297,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31038,GaiLv1=8226298,GaiLv2=8235837,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31045,GaiLv1=8235838,GaiLv2=8245377,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31024,GaiLv1=8245378,GaiLv2=8254917,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31039,GaiLv1=8254918,GaiLv2=8262549,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31046,GaiLv1=8262550,GaiLv2=8270181,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88044,GaiLv1=8270182,GaiLv2=8346498,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88171,GaiLv1=8346499,GaiLv2=8728081,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=8728082,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},

		},
[2] = {
			--
			{GoodsID=80397,GaiLv1=1,GaiLv2=816942,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80384,GaiLv1=816943,GaiLv2=1906199,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80382,GaiLv1=1906200,GaiLv2=2995456,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40004,GaiLv1=2995457,GaiLv2=3213308,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40014,GaiLv1=3213309,GaiLv2=3431160,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40024,GaiLv1=3431161,GaiLv2=3649012,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40094,GaiLv1=3649013,GaiLv2=3866864,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=89042,GaiLv1=3866865,GaiLv2=3932220,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=250,GaiLv1=3932221,GaiLv2=4585775,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=9507,GaiLv1=4585776,GaiLv2=4595112,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=75,GaiLv1=4595113,GaiLv2=4921890,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=4921891,GaiLv2=5248668,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80686,GaiLv1=5248669,GaiLv2=5575446,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80689,GaiLv1=5575447,GaiLv2=5902224,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39511,GaiLv1=5902225,GaiLv2=5934902,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39514,GaiLv1=5934903,GaiLv2=5967580,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39504,GaiLv1=5967581,GaiLv2=6000258,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39505,GaiLv1=6000259,GaiLv2=6032936,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39506,GaiLv1=6032937,GaiLv2=6065614,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11537,GaiLv1=6065615,GaiLv2=6087400,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11538,GaiLv1=6087401,GaiLv2=6109186,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11539,GaiLv1=6109187,GaiLv2=6130972,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11540,GaiLv1=6130973,GaiLv2=6152758,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11330,GaiLv1=6152759,GaiLv2=6169097,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11331,GaiLv1=6169098,GaiLv2=6185436,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11332,GaiLv1=6185437,GaiLv2=6201775,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11333,GaiLv1=6201776,GaiLv2=6218114,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11071,GaiLv1=6218115,GaiLv2=6234453,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11072,GaiLv1=6234454,GaiLv2=6250792,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38352,GaiLv1=6250793,GaiLv2=6359718,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38353,GaiLv1=6359719,GaiLv2=6468644,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38354,GaiLv1=6468645,GaiLv2=6577570,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38355,GaiLv1=6577571,GaiLv2=6686496,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38356,GaiLv1=6686497,GaiLv2=6795422,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38357,GaiLv1=6795423,GaiLv2=6904348,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38358,GaiLv1=6904349,GaiLv2=7013274,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38359,GaiLv1=7013275,GaiLv2=7122200,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38360,GaiLv1=7122201,GaiLv2=7231126,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32101,GaiLv1=7231127,GaiLv2=7296482,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31040,GaiLv1=7296483,GaiLv2=7307375,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31027,GaiLv1=7307376,GaiLv2=7318268,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31028,GaiLv1=7318269,GaiLv2=7329161,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31029,GaiLv1=7329162,GaiLv2=7340054,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31030,GaiLv1=7340055,GaiLv2=7348224,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31038,GaiLv1=7348225,GaiLv2=7356394,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31045,GaiLv1=7356395,GaiLv2=7364564,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31024,GaiLv1=7364565,GaiLv2=7372734,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31039,GaiLv1=7372735,GaiLv2=7379270,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31046,GaiLv1=7379271,GaiLv2=7385806,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88044,GaiLv1=7385807,GaiLv2=7451162,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11046,GaiLv1=7451163,GaiLv2=7472948,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11047,GaiLv1=7472949,GaiLv2=7494734,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=311,GaiLv1=7494735,GaiLv2=8583991,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=8583992,GaiLv2=9673248,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88171,GaiLv1=9673249,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},

		},
[3] = {
			{GoodsID=80397,GaiLv1=1,GaiLv2=835136,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80384,GaiLv1=835137,GaiLv2=1948651,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80382,GaiLv1=1948652,GaiLv2=3062166,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40005,GaiLv1=3062167,GaiLv2=3229194,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40015,GaiLv1=3229195,GaiLv2=3396222,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40025,GaiLv1=3396223,GaiLv2=3563250,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40095,GaiLv1=3563251,GaiLv2=3730278,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=89042,GaiLv1=3730279,GaiLv2=3797089,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=250,GaiLv1=3797090,GaiLv2=4465198,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=9507,GaiLv1=4465199,GaiLv2=4474743,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=75,GaiLv1=4474744,GaiLv2=4808798,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=4808799,GaiLv2=5142853,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80686,GaiLv1=5142854,GaiLv2=5476908,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80689,GaiLv1=5476909,GaiLv2=5810963,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39511,GaiLv1=5810964,GaiLv2=5844369,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39514,GaiLv1=5844370,GaiLv2=5877775,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39504,GaiLv1=5877776,GaiLv2=5911181,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39505,GaiLv1=5911182,GaiLv2=5944587,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39506,GaiLv1=5944588,GaiLv2=5977993,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11537,GaiLv1=5977994,GaiLv2=6000264,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11538,GaiLv1=6000265,GaiLv2=6022535,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11539,GaiLv1=6022536,GaiLv2=6044806,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11540,GaiLv1=6044807,GaiLv2=6067077,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11330,GaiLv1=6067078,GaiLv2=6083780,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11331,GaiLv1=6083781,GaiLv2=6100483,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11332,GaiLv1=6100484,GaiLv2=6117186,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11333,GaiLv1=6117187,GaiLv2=6133889,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11071,GaiLv1=6133890,GaiLv2=6150592,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11072,GaiLv1=6150593,GaiLv2=6167295,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38352,GaiLv1=6167296,GaiLv2=6278647,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38353,GaiLv1=6278648,GaiLv2=6389999,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38354,GaiLv1=6390000,GaiLv2=6501351,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38355,GaiLv1=6501352,GaiLv2=6612703,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38356,GaiLv1=6612704,GaiLv2=6724055,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38357,GaiLv1=6724056,GaiLv2=6835407,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38358,GaiLv1=6835408,GaiLv2=6946759,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38359,GaiLv1=6946760,GaiLv2=7058111,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38360,GaiLv1=7058112,GaiLv2=7169463,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32101,GaiLv1=7169464,GaiLv2=7236274,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31040,GaiLv1=7236275,GaiLv2=7247410,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31027,GaiLv1=7247411,GaiLv2=7258546,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31028,GaiLv1=7258547,GaiLv2=7269682,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31029,GaiLv1=7269683,GaiLv2=7280818,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31030,GaiLv1=7280819,GaiLv2=7289170,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31038,GaiLv1=7289171,GaiLv2=7297522,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31045,GaiLv1=7297523,GaiLv2=7305874,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31024,GaiLv1=7305875,GaiLv2=7314226,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31039,GaiLv1=7314227,GaiLv2=7320908,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31046,GaiLv1=7320909,GaiLv2=7327590,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88044,GaiLv1=7327591,GaiLv2=7394401,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11046,GaiLv1=7394402,GaiLv2=7416672,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11047,GaiLv1=7416673,GaiLv2=7438943,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=317,GaiLv1=7438944,GaiLv2=8552458,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=8552459,GaiLv2=9665973,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88171,GaiLv1=9665974,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},

		},
}

local AiGuoZheChengHao_List = {
--爱国者称号
[89077] = {NickNameID = 212,PropID = 1103001,NickName='爱国者'},
}

--local AiGuoZheBoxShiZhuangGoodsID = {11009,11010,11011,11012,11330,11331,11332,11333,11071,11072}
local AiGuoZheBoxShiZhuangGoodsID = {11537,11538,11539,11540,11330,11331,11332,11333,11071,11072}

local AiGuoZheBoxChongWuGoodsID = {31040,31027,31028,31029,31030,31038,31045,31024,31046}

function LC_GuoQingDaoJuUse(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID()
	local StartTimeTable = GLOBAL_GuoQingOnline_StartTime
	local EndTimeTable = GLOBAL_GuoQingOnline_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local GuoqingHuiZhangEnd = GuoqingHuiZhang_EndTime
	local nHuiZhangEnd = API_DiffDatatime(GuoqingHuiZhangEnd.Year,GuoqingHuiZhangEnd.Month,GuoqingHuiZhangEnd.Day,GuoqingHuiZhangEnd.Hour,GuoqingHuiZhangEnd.Minute,GuoqingHuiZhangEnd.Second)

	if GoodsID == 89073 or GoodsID == 89074 or GoodsID == 89075 or GoodsID == 89076 then
		if nHuiZhangEnd <= 0 then
			if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用欢度国庆道具') then--销毁玩家身上的物品
				if API_ActorCanAddGoods(ActorID,80498,10,3,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,80498,10,0,'获得10个经验兑换券')
					API_ActorSendMsg(ActorID,8,'获得10个经验兑换券')
				else
					local GoodsName = API_GetGoodsName(80498)
					API_SendActorMailByName(API_GetActorName(ActorID),80498,10,0,'国庆活动奖励','')
					API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'10个（请到邮箱领取）')
				end
				API_ResponseWrite('<name>国庆活动</name>')
				API_ResponseWrite('<text>    亲爱的玩家国庆活动已结束，您获得10个经验兑换券。</text><br>')
				API_ResponseWrite('<br><a>关闭</a><br>')
				API_ResponseFlush(ActorID)
				return 1
			end
		end
		if API_ActorGetGoodsNum(ActorID,89073) < 1 then
			API_ResponseWrite('<name>国庆活动</name>')
			API_ResponseWrite('<text>缺少欢度国庆[欢]，合成爱国者宝箱失败。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 0
		end
		if API_ActorGetGoodsNum(ActorID,89074) < 1 then
			API_ResponseWrite('<name>国庆活动</name>')
			API_ResponseWrite('<text>缺少欢度国庆[度]，合成爱国者宝箱失败。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 0
		end
		if API_ActorGetGoodsNum(ActorID,89075) < 1 then
			API_ResponseWrite('<name>国庆活动</name>')
			API_ResponseWrite('<text>缺少欢度国庆[国]，合成爱国者宝箱失败。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 0
		end
		if API_ActorGetGoodsNum(ActorID,89076) < 1 then
			API_ResponseWrite('<name>国庆活动</name>')
			API_ResponseWrite('<text>缺少欢度国庆[庆]，合成爱国者宝箱失败。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 0
		end
		if API_ActorGetGoodsNum(ActorID,89073) > 0 and 
		API_ActorGetGoodsNum(ActorID,89074) > 0 and 
		API_ActorGetGoodsNum(ActorID,89075) > 0 and 
		API_ActorGetGoodsNum(ActorID,89076) > 0 and 
		API_ActorRemoveGoods(ActorID,89073,1,'消耗国庆徽章') and
		API_ActorRemoveGoods(ActorID,89074,1,'消耗国庆徽章') and
		API_ActorRemoveGoods(ActorID,89075,1,'消耗国庆徽章') and
		API_ActorRemoveGoods(ActorID,89076,1,'消耗国庆徽章') then
			if API_ActorCanAddGoods(ActorID,89077,1,3,0) ~= -1 then
				API_AddActorGoodsFlag(ActorID,89077,1,0,'获得爱国者宝箱')
				API_ActorSendMsg(ActorID,8,'扣除国庆徽章，获得一个爱国者宝箱')
			else
				local GoodsName = API_GetGoodsName(89077)
				API_SendActorMailByName(API_GetActorName(ActorID),89077,1,0,'爱国者宝箱','')
				API_ActorSendMsg(ActorID,8,'扣除国庆徽章，获得'..GoodsName..'一个（请到邮箱领取）')
			end
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[72][4][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[72][4][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[72][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[72][4][LaiYuan] + 1
			end
			return 1
		end
	elseif GoodsID == 89077 then
		local JiangLiQuYu = 1
		local PlayLv = API_GetActorExpLevel(ActorID)
		if PlayLv > 40 then
			JiangLiQuYu = 3
		elseif PlayLv > 25 then
			JiangLiQuYu = 2
		end
		local JiangLiTable = AiGuoZheBaoXiang_GoodsTable[JiangLiQuYu]
		local JiangLiGaiLv = math.random(10000000)
		for j in JiangLiTable do
			local GaiLv1 = JiangLiTable[j].GaiLv1
			local GaiLv2 = JiangLiTable[j].GaiLv2
			local NumGaiLv = JiangLiTable[j].NumGaiLv
			local NumMax = JiangLiTable[j].NumMax
			local NumMin = JiangLiTable[j].NumMin
			local NumRandom = math.random(10000)
			if NumRandom <= NumGaiLv then
				JiangLiGoodsNum = NumMax
			else
				JiangLiGoodsNum = NumMin
			end	
			if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
				local JiangLiGoodsID = JiangLiTable[j].GoodsID
				if JiangLiGoodsNum <= 0 then
					JiangLiGoodsID = 82004
					JiangLiGoodsNum = 1
				end	
				if API_ActorGetPackageSize(ActorID) < 1 then
					API_ResponseWrite('<name>爱国者宝箱</name>')
					API_ResponseWrite('<text>您的背包空间不足，请至少保留一个空格，再打开爱国者宝箱。</text>')
					API_ResponseWrite('<br><br><a>确定</a>')
					API_ResponseFlush(ActorID)
					return 0						
				end
				if API_ActorGetGoodsNum(ActorID,89077) > 0 and API_ActorRemoveGoods(ActorID,89077,1,'删除爱国者宝箱') then
					--设置爱国者称号
					local NickNameID = AiGuoZheChengHao_List[GoodsID].NickNameID
					local PropID = AiGuoZheChengHao_List[GoodsID].PropID
					local NickName = AiGuoZheChengHao_List[GoodsID].NickName
					API_SetPlayerNickName(ActorID,NickNameID,NickName,1,0,1,1,{PropID})--设置称号
					
					local NowTime = os.time()
					local CD = API_VarDataGetNumber_Ex(1,0,-6015,1,6)					
					
					for j,v in AiGuoZheBoxShiZhuangGoodsID do
						if JiangLiGoodsID == v then
							local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6015,1,4)
							if ShengYuNum > 0 and NowTime > CD and nShiFouStart <= 0 and nShiFouEnd > 0 then
								ShengYuNum = ShengYuNum - 1
								API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,4,ShengYuNum)
								local Time = os.time() 
								local Tsec = math.random(600,1200)
								local NextTime = Time + Tsec
								API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,6,NextTime)
								API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在打开爱国者宝箱获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
							else
								JiangLiGoodsID = 82004
								JiangLiGoodsNum = 1
							end
						end
					end
					
					for j,v in AiGuoZheBoxChongWuGoodsID do
						if JiangLiGoodsID == v then
							local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6015,1,5)
							if ShengYuNum > 0 and NowTime > CD and nShiFouStart <= 0 and nShiFouEnd > 0 then
								ShengYuNum = ShengYuNum - 1
								API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,5,ShengYuNum)
								local Time = os.time() 
								local Tsec = math.random(600,1200)
								local NextTime = Time + Tsec
								API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,6,NextTime)
								API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在打开爱国者宝箱获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
							else
								JiangLiGoodsID = 82004
								JiangLiGoodsNum = 1
							end	
						end
					end
					--雪女特殊判断2-3天一只
					if JiangLiGoodsID == 31039 then
						local NowTime = os.time()
						local NextTime = API_VarDataGetNumber_Ex(1,0,-6015,1,10)
						if NowTime >= NextTime then
							--API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加物品");
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在打开爱国者宝箱获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
							--local CDTime = math.random(172800,259200);
							local CDTime = 259200
							NextTime = NowTime + CDTime
							API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,10,NextTime)
						else
							--API_AddActorGoods(ActorID,82004, 1, "给背包中加物品");
							JiangLiGoodsID = 82004
							JiangLiGoodsNum = 1
							
						end 
					end
					
					local PD = 0
					for j,v in baoshiwupinbiao do
						if JiangLiGoodsID == v then
							PD = 1
						end
					end
					if PD == 1 then
						fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
					else
						API_AddActorGoodsFlag(ActorID,JiangLiGoodsID,JiangLiGoodsNum,0,'')
					end
					API_ActorSendMsg(ActorID,8,'获得'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[72][3][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[72][3][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[72][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[72][3][LaiYuan] + 1
					end
					return 1
				else
					API_ActorSendMsg(ActorID,3,'扣除爱国者宝箱失败')
					return 0	
				end
			end
		end
	end
end


if API_GetServerID() == 1 then
	local StartTimeTable = GLOBAL_GuoQingOnline_StartTime
	local EndTimeTable = GLOBAL_GuoQingOnline_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)

	if LC_GuoQingHuoDong_LoadingTimeTriggerGID ~= nil then
		API_DestroyTriggerG(LC_GuoQingHuoDong_LoadingTimeTriggerGID)
	end
	if nShiFouEnd > 0 then
		LC_GuoQingHuoDong_LoadingTimeTriggerGID = API_CreateTimerTriggerG(0,0,1,-1,'LC_GuoQingHuoDong_ShujuQingChu')
	end
end

function LC_GuoQingHuoDong_ShujuQingChu(Param1,Param2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.time()
	local StartTimeTable = GLOBAL_GuoQingOnline_StartTime
	local EndTimeTable = GLOBAL_GuoQingOnline_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	
	local StartTime = API_VarDataGetNumber_Ex(1,0,-6015,1,1)
	local EndTime = API_VarDataGetNumber_Ex(1,0,-6015,1,2)

	--设置每日奖励上限数量
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6015,1,3) and API_GetServerID() == 1 then
		API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,4,20)
		API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,5,15)
		local NowTime = os.date("*t", os.time()) 
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 23 
		NowTime.min = 59 
		NowTime.sec = 59 
		local NightTime = os.time(NowTime)
		local NextQingChuTime = NightTime + 1
		API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,3,NextQingChuTime)
		API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,7,10)
	end
	local ShengYuTime = API_VarDataGetNumber_Ex(1,0,-6015,1,7)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if Hour == 20 and Minute < 30 and math.mod(Minute,5) == 0 and Second == 0 then
			API_ActorBroadcastMsg(-1,1,'国庆在线送好礼活动即将开启，20点30分至21点30分累计在线45分钟即可参与一次在线抽奖。')
			API_ActorBroadcastMsg(-1,17,'国庆在线送好礼活动即将开启，20点30分至21点30分累计在线45分钟即可参与一次在线抽奖。')
		end
		if NowTime >= StartTime and  NowTime <= EndTime then
			if math.mod(Minute,20) == 0 and Second == 30 then
				API_ActorBroadcastMsg(-1,1,'国庆在线送好礼活动正在进行中，20点30分至21点30分累计在线45分钟即可通过活动卷轴参与一次在线抽奖。21：00至21：10之间还可领取国庆大礼包。')
				API_ActorBroadcastMsg(-1,17,'国庆在线送好礼活动正在进行中，20点30分至21点30分累计在线45分钟即可通过活动卷轴参与一次在线抽奖。21：00至21：10之间还可领取国庆大礼包。')
			end
		end
		if Hour == 21 and Minute <= 10 then
			if Second == 1 and ShengYuTime > 0 then
				API_ActorBroadcastMsg(-1,1,'领取国庆大礼包剩余时间'..ShengYuTime..'分，请各位玩家抓紧时间通过卷轴领取礼包。')
				API_ActorBroadcastMsg(-1,17,'领取国庆大礼包剩余时间'..ShengYuTime..'分，请各位玩家抓紧时间通过卷轴领取礼包。')	
				ShengYuTime = ShengYuTime - 1
				API_VarDataSetNumber_Ex_Sync(1,0,-6015,1,7,ShengYuTime)				
			end
		end
	end
end
