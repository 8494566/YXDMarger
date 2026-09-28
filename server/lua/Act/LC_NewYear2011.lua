-------------------------------
--文件名:	Scp\Lua\Act\LC_NewYear2011.lua
--版  权:	深圳腾讯计算机系统有限公司
--创建人:	刘操
--日  期:	2011-12-20
--版  本:	
--描  述:   新年系列活动:年兽大作战，在线领红包，猜灯谜
--应  用:  
-------------------------------

local NewYear2011_StartTime = {Year = 2012,Month = 1,Day = 10,Hour = 12,Minute = 0,Second = 0}
local NewYear2011_EndTime = {Year = 2012,Month = 2,Day = 1,Hour = 0,Minute = 0,Second = 0}


---------------------------------------------在线领红包-----------------------------------------------

local NewYear2011_RedPaperID = 90011
local NewYear2011_RedPaperPhotoID = 104100

local NewYear2011_BonusTime = 30268 --红包领取时间
local NewYear2011_BonusNum = 30267 --红包领取次数
local NewYear2011_BoxSign = 30266 --跨年大礼包领取标志

--上线判断
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'LC_NewYear2011_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'LC_NewYear2011_OnLogin') 
end

--下线判断
local OnLogoutLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLogoutFuncNameList) do 
	if GLOBAL_ActMain_OnLogoutFuncNameList[i] == 'LC_NewYear2011_OnLogout' then
		OnLogoutLoadOK = 1
		break
	end 
end 
if OnLogoutLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLogoutFuncNameList,'LC_NewYear2011_OnLogout') 
end

--上线回调
function LC_NewYear2011_OnLogin() 
	local ActorID = API_RequestGetActorID()
	local StartTimeTable = NewYear2011_StartTime
	local EndTimeTable = NewYear2011_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local ActorLevel = API_GetActorExpLevel(ActorID)
	if ActorLevel < 11 then
		return
	end	
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		API_RemoveTaskScroll(ActorID,NewYear2011_RedPaperID)
		LRY_UItwinkemanage(ActorID,11,85,NewYear2011_RedPaperPhotoID,NewYear2011_RedPaperID,20,'LC_NewYear2011_juanzhoudianji')--加载图标
	else
		API_RemoveTaskScroll(ActorID,NewYear2011_RedPaperID)
	end
end

--下线回调
function LC_NewYear2011_OnLogout()
	
end

--卷轴点击
function LC_NewYear2011_juanzhoudianji()
	local ActorID = API_RequestGetActorID()
	local StartTimeTable = NewYear2011_StartTime
	local EndTimeTable = NewYear2011_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local LingJiangTime = os.date("*t", os.time()) 
	LingJiangTime.year = 2012
	LingJiangTime.month = 1
	LingJiangTime.day = 22
	LingJiangTime.hour = 21 
	LingJiangTime.min = 5 
	LingJiangTime.sec = 0
	LingJiangTime = os.time(LingJiangTime)
	local NowTime =  os.time()
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		local BoxSign = API_VarDataGetNumber(ActorID,1,NewYear2011_BoxSign)
		API_ResponseWrite('<win rect="500,175,420,220"></win>')
		API_ResponseWrite('<name>新年福神</name>')
		API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
		API_ResponseWrite('<br><a href="LC_NewYear2011_juanzhoudianji_Title?1=100">领取红包</a><br>')
		if BoxSign ~= 1 and NowTime < LingJiangTime then
			API_ResponseWrite('<br><a href="LC_NewYear2011_juanzhoudianji_Title?1=200">领取跨年大礼包</a><br>')
		end
		API_ResponseWrite('<br><a href="LC_NewYear2011_juanzhoudianji_Title?1=300">活动介绍</a><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_RemoveTaskScroll(ActorID,NewYear2011_RedPaperID)
		API_ResponseWrite('<win rect="500,175,420,220"></win>')
		API_ResponseWrite('<name>新年福神</name>')
		API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
		API_ResponseWrite('<text>	英雄岛新年活动已结束，谢谢您的参与。</text><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
		return 1
	end
end 

local NewYear2011_HongBaotable = {
	[1] = {
		{GoodsID=80832,GaiLv1=1,GaiLv2=613496,NumMax=1,NumMin=1},
		{GoodsID=80833,GaiLv1=613497,GaiLv2=1226993,NumMax=1,NumMin=1},
		{GoodsID=82004,GaiLv1=1226994,GaiLv2=1840490,NumMax=1,NumMin=1},
		{GoodsID=80274,GaiLv1=1840491,GaiLv2=2453987,NumMax=1,NumMin=1},
		{GoodsID=845,GaiLv1=2453988,GaiLv2=3067484,NumMax=1,NumMin=1},
		{GoodsID=80383,GaiLv1=3067485,GaiLv2=3680981,NumMax=2,NumMin=1},
		{GoodsID=80381,GaiLv1=3680982,GaiLv2=4294478,NumMax=2,NumMin=1},
		{GoodsID=89041,GaiLv1=4294479,GaiLv2=4355828,NumMax=1,NumMin=1},
		{GoodsID=89044,GaiLv1=4355829,GaiLv2=4417178,NumMax=1,NumMin=1},
		{GoodsID=501,GaiLv1=4417179,GaiLv2=5030675,NumMax=5,NumMin=1},
		{GoodsID=75,GaiLv1=5030676,GaiLv2=5092025,NumMax=1,NumMin=1},
		{GoodsID=80195,GaiLv1=5092026,GaiLv2=5705522,NumMax=5,NumMin=1},
		{GoodsID=38068,GaiLv1=5705523,GaiLv2=6319019,NumMax=1,NumMin=1},
		{GoodsID=38075,GaiLv1=6319020,GaiLv2=6932516,NumMax=1,NumMin=1},
		{GoodsID=38076,GaiLv1=6932517,GaiLv2=7546013,NumMax=1,NumMin=1},
		{GoodsID=38077,GaiLv1=7546014,GaiLv2=8159510,NumMax=1,NumMin=1},
		{GoodsID=80065,GaiLv1=8159511,GaiLv2=8773007,NumMax=5,NumMin=1},
		{GoodsID=80049,GaiLv1=8773008,GaiLv2=9386504,NumMax=5,NumMin=1},
		{GoodsID=80274,GaiLv1=9386505,GaiLv2=10000000,NumMax=1,NumMin=1},
	},
	[2] = {
		{GoodsID=80832,GaiLv1=1,GaiLv2=613496,NumMax=5,NumMin=1},
		{GoodsID=80833,GaiLv1=613497,GaiLv2=1226993,NumMax=5,NumMin=1},
		{GoodsID=82004,GaiLv1=1226994,GaiLv2=1840490,NumMax=5,NumMin=1},
		{GoodsID=80274,GaiLv1=1840491,GaiLv2=2453987,NumMax=2,NumMin=1},
		{GoodsID=845,GaiLv1=2453988,GaiLv2=3067484,NumMax=5,NumMin=1},
		{GoodsID=80384,GaiLv1=3067485,GaiLv2=3680981,NumMax=2,NumMin=1},
		{GoodsID=80382,GaiLv1=3680982,GaiLv2=4294478,NumMax=2,NumMin=1},
		{GoodsID=89041,GaiLv1=4294479,GaiLv2=4355828,NumMax=1,NumMin=1},
		{GoodsID=89044,GaiLv1=4355829,GaiLv2=4417178,NumMax=1,NumMin=1},
		{GoodsID=501,GaiLv1=4417179,GaiLv2=5030675,NumMax=5,NumMin=1},
		{GoodsID=75,GaiLv1=5030676,GaiLv2=5092025,NumMax=1,NumMin=1},
		{GoodsID=80196,GaiLv1=5092026,GaiLv2=5705522,NumMax=5,NumMin=1},
		{GoodsID=38068,GaiLv1=5705523,GaiLv2=6319019,NumMax=1,NumMin=1},
		{GoodsID=38075,GaiLv1=6319020,GaiLv2=6932516,NumMax=1,NumMin=1},
		{GoodsID=38076,GaiLv1=6932517,GaiLv2=7546013,NumMax=1,NumMin=1},
		{GoodsID=38077,GaiLv1=7546014,GaiLv2=8159510,NumMax=1,NumMin=1},
		{GoodsID=80066,GaiLv1=8159511,GaiLv2=8773007,NumMax=5,NumMin=1},
		{GoodsID=80050,GaiLv1=8773008,GaiLv2=9386504,NumMax=5,NumMin=2},
		{GoodsID=80274,GaiLv1=9386505,GaiLv2=10000000,NumMax=1,NumMin=1},
	},
	[3] = {
		{GoodsID=80832,GaiLv1=1,GaiLv2=613496,NumMax=10,NumMin=1},
		{GoodsID=80833,GaiLv1=613497,GaiLv2=1226993,NumMax=10,NumMin=1},
		{GoodsID=82004,GaiLv1=1226994,GaiLv2=1840490,NumMax=10,NumMin=1},
		{GoodsID=80274,GaiLv1=1840491,GaiLv2=2453987,NumMax=5,NumMin=1},
		{GoodsID=845,GaiLv1=2453988,GaiLv2=3067484,NumMax=5,NumMin=1},
		{GoodsID=80384,GaiLv1=3067485,GaiLv2=3680981,NumMax=5,NumMin=1},
		{GoodsID=80382,GaiLv1=3680982,GaiLv2=4294478,NumMax=5,NumMin=1},
		{GoodsID=89041,GaiLv1=4294479,GaiLv2=4355828,NumMax=1,NumMin=1},
		{GoodsID=89044,GaiLv1=4355829,GaiLv2=4417178,NumMax=1,NumMin=1},
		{GoodsID=501,GaiLv1=4417179,GaiLv2=5030675,NumMax=5,NumMin=1},
		{GoodsID=75,GaiLv1=5030676,GaiLv2=5092025,NumMax=1,NumMin=1},
		{GoodsID=80197,GaiLv1=5092026,GaiLv2=5705522,NumMax=5,NumMin=1},
		{GoodsID=38068,GaiLv1=5705523,GaiLv2=6319019,NumMax=1,NumMin=1},
		{GoodsID=38075,GaiLv1=6319020,GaiLv2=6932516,NumMax=1,NumMin=1},
		{GoodsID=38076,GaiLv1=6932517,GaiLv2=7546013,NumMax=1,NumMin=1},
		{GoodsID=38077,GaiLv1=7546014,GaiLv2=8159510,NumMax=1,NumMin=1},
		{GoodsID=80067,GaiLv1=8159511,GaiLv2=8773007,NumMax=5,NumMin=1},
		{GoodsID=80051,GaiLv1=8773008,GaiLv2=9386504,NumMax=5,NumMin=1},
		{GoodsID=80274,GaiLv1=9386505,GaiLv2=10000000,NumMax=1,NumMin=1},
	},
}


--卷轴判断
function LC_NewYear2011_juanzhoudianji_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	
	local Time = API_VarDataGetNumber(ActorID,1,NewYear2011_BonusTime)
	local LastTime = os.date("*t", Time) 
	if Year ~= LastTime.year or Month ~= LastTime.month or Day ~= LastTime.day then
		API_VarDataSetNumber(ActorID,1,NewYear2011_BonusNum,10)
	end
	
	if SelectItem == 100 then
		local Time = os.time()
		local NextTime = API_VarDataGetNumber(ActorID,1,NewYear2011_BonusTime)
		local Number = API_VarDataGetNumber(ActorID,1,NewYear2011_BonusNum)
		if Number > 0 then
			if Time > NextTime then
				local NextTime = Time + 600
				API_VarDataSetNumber(ActorID,1,NewYear2011_BonusTime,NextTime)
--				if API_ActorCanAddGoods(ActorID,80832,1,3,0) ~= -1 then
--					API_AddActorGoodsFlag(ActorID,80832,1,3,'新年红利')
--					API_ActorSendMsg(ActorID,8,'获得新年红利')
--				else
--					local GoodsName = API_GetGoodsName(80832)
--					API_SendActorMailByName(API_GetActorName(ActorID),80832,1,3,'新年红利','')
--					API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'1个（请到邮箱领取）')
--				end
				local JiangLiQuYu = 1
				local PlayLv = API_GetActorExpLevel(ActorID)
				if PlayLv > 40 then
					JiangLiQuYu = 3
				elseif PlayLv > 25 then
					JiangLiQuYu = 2
				end
				local JiangLiTable = NewYear2011_HongBaotable[JiangLiQuYu]
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
							Number = Number - 1
							API_VarDataSetNumber(ActorID,1,NewYear2011_BonusNum,Number)					
							API_AddActorGoodsFlag(ActorID,JiangLiGoodsID,JiangLiGoodsNum,3,'')
							API_ResponseWrite('<win rect="500,175,420,220"></win>')
							API_ResponseWrite('<name>新年福神</name>')
							API_ResponseWrite('<text>打开红包获得'..JiangLiGoodsNum..'个</text><img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'" ><text>，您今天还可以领取'..Number..'次红包。</text><br>')						
							API_ResponseFlush(ActorID)
							API_ActorSendMsg(ActorID,8,'获得'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')
						else
							local GoodsName = API_GetGoodsName(JiangLiGoodsID)
							Number = Number - 1
							API_VarDataSetNumber(ActorID,1,NewYear2011_BonusNum,Number)	
							API_SendActorMailByName(API_GetActorName(ActorID),JiangLiGoodsID,JiangLiGoodsNum,3,'红包奖励','')
							API_ResponseWrite('<win rect="500,175,420,220"></win>')
							API_ResponseWrite('<name>新年福神</name>')
							API_ResponseWrite('<text>打开红包获得'..JiangLiGoodsNum..'个</text><img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'" ><text>，您今天还可以领取'..Number..'次红包。</text><br>')						
							API_ResponseFlush(ActorID)
							API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'一个（请到邮箱领取）')
						end
					end
				end
			else
				local CountDown = NextTime - Time
				local Minute = math.floor(CountDown/60)
				if Minute == 0 then
					Minute = 1
				end
				API_ResponseWrite('<win rect="500,175,420,220"></win>')
				API_ResponseWrite('<name>新年福神</name>')
				API_ResponseWrite('<text>还有</text><text color="255,0,255">'..Minute..'</text><text>分钟可领取红包，您今天还可以领取</text><text color="255,0,255">'..Number..'</text><text>次。</text><br>')
				API_ResponseWrite('<br><a>关闭</a>')
				API_ResponseFlush(ActorID)
				return 1
			end
		else
			API_ResponseWrite('<win rect="500,175,420,220"></win>')
			API_ResponseWrite('<name>新年福神</name>')
			API_ResponseWrite('<text>每个玩家每天只能领取10个红包，您今天已经领取了10次，欢迎明天再来领取。</text><br>')
			API_ResponseWrite('<br><a>关闭</a>')
			API_ResponseFlush(ActorID)
			return 1
		end
	elseif SelectItem == 200 then
		local BoxSign = API_VarDataGetNumber(ActorID,1,NewYear2011_BoxSign)
		if BoxSign ~= 1 then
			if Year == 2012 and Month == 1 and Day == 22 and Hour == 21 and Minute < 6 then
				if API_ActorCanAddGoods(ActorID,89132,1,3,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,89132,1,3,'跨年大礼包')
					API_ActorSendMsg(ActorID,8,'获得跨年大礼包')
				else
					local GoodsName = API_GetGoodsName(89132)
					API_SendActorMailByName(API_GetActorName(ActorID),89132,1,3,'跨年大礼包','')
					API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'1个（请到邮箱领取）')
				end
				API_VarDataSetNumber(ActorID,1,NewYear2011_BoxSign,1)
			else
				API_ResponseWrite('<win rect="500,175,420,220"></win>')
				API_ResponseWrite('<name>新年福神</name>')
				API_ResponseWrite('<text>跨年大礼包在2012年1月22日晚21：00-21：05可以领取。</text><br>')
				API_ResponseWrite('<br><a>关闭</a>')
				API_ResponseFlush(ActorID)
				return 1			
			end
		else
			API_ResponseWrite('<win rect="500,175,420,220"></win>')
			API_ResponseWrite('<name>新年福神</name>')
			API_ResponseWrite('<text>您已经领取过跨年大礼包了。</text><br>')
			API_ResponseWrite('<br><a>关闭</a>')
			API_ResponseFlush(ActorID)
			return 1
		end
	elseif SelectItem == 300 then
		API_ResponseWrite('<win rect="500,175,420,220"></win>')
		API_ResponseWrite('<name>春节活动介绍</name>')
		API_ResponseWrite('<br><text>	年兽突袭：每日21点月幕草场，落日农场，阳光雨林，珊瑚群岛，娜纱湿地准时刷新年兽，击杀年兽可获得丰厚奖励。</text><br>')
		API_ResponseWrite('<br><text>	神龙许愿：每日12:00-13:00，20：00-21：00在落日农庄，阳光雨林，珊瑚群岛，娜纱湿地刷新龙珠盗贼，击杀龙珠盗贼有几率获得龙珠碎片，使用碎片在神龙密使处兑换龙珠，或者兑换神龙祝福，7星龙珠可用做神龙许愿。</text><br>')
		API_ResponseWrite('<br><text>	领红包：春节活动期间通过红包卷轴每日最多可领取10个红包，除夕之夜更有跨年大礼包等你来拿。</text><br>')
		API_ResponseWrite('<br><a href="LC_NewYear2011_juanzhoudianji">  返回</a>')
		API_ResponseFlush(ActorID)	
	end
end


---------------------------------------------新年BOSS-----------------------------------------------

--创建时间触发器
if API_GetServerID() < 11 then
	local StartTimeTable = NewYear2011_StartTime
	local EndTimeTable = NewYear2011_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouEnd > 0 then
	--创建时间触发器
		if NewYear2011_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(NewYear2011_TimeTriggerGID)
		end
		NewYear2011_TimeTriggerGID = API_CreateTimerTriggerG(0,0,60,-1,'NewYearNianShou2011_TimerTriggerGCallFunc')
	else
		if NewYear2011_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(NewYear2011_TimeTriggerGID)
		end
	end
end

--时间回调
function NewYearNianShou2011_TimerTriggerGCallFunc()
	local StartTimeTable = NewYear2011_StartTime
	local EndTimeTable = NewYear2011_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 

	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if Hour == 20 and API_GetServerID() == 1 then
			if Minute >= 30 then
				if math.mod(Minute,5) == 0 then
					API_ActorBroadcastMsg(-1,17,'迎新春，贺佳节年兽突袭活动将于21点开启，年兽王即将携带稀世财富降临月暮！')
					API_ActorBroadcastMsg(-1,1,'迎新春，贺佳节年兽突袭活动将于21点开启，年兽王即将携带稀世财富降临月暮！')
				end
			end
		end
		local NowTime = os.time()
		if Hour == 21 and NowTime > API_VarDataGetNumber_Ex(1,0,-6017,1,1) then
			local NowTime = os.date("*t", os.time()) 
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 20
			NowTime.min = 59 
			NowTime.sec = 59
			local NightTime = os.time(NowTime)
			local NextQingChuTime = NightTime + 86400 + 1
			API_VarDataSetNumber_Ex(1,0,-6017,1,1,NextQingChuTime)
			API_VarDataSetNumber_Ex(1,0,-6017,1,2,0)
			NewYear2011_MonsterCreate()
		end
	end
end

if NewYearMonster2011_NianShouIDlist == nil then
	NewYearMonster2011_NianShouIDlist = {}
end

local NewYear2011_MonsterIDTable = {
--[9] = {MonsterID = 730010,TileX = 100,TileY = 100},
[10] = {MonsterID = 730601,TileX = 139,TileY = 279},
[23] = {MonsterID = 730601,TileX = 127,TileY = 297},
--[25] = {MonsterID = 730010,TileX = 100,TileY = 100},
[99] = {MonsterID = 730602,TileX = 399,TileY = 297},
[98] = {MonsterID = 730602,TileX = 309,TileY = 395},
[101] = {MonsterID = 730603,TileX = 466,TileY = 425},
}

--BOSS创建
function NewYear2011_MonsterCreate()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	for i in NewYearMonster2011_NianShouIDlist do
		for j,v in NewYearMonster2011_NianShouIDlist[i] do
			if API_GetMonsterID(v) > 0 then
				API_DestroyMonster(v)
			end
		end
	end

	local NewYearMapIDList = {23,10,99,98,101}
	for i,v in NewYearMapIDList do
		local RightMapID = API_GetRightMapID(v)
		local ServerID = API_GetServerID()
		if API_MapIsValid(RightMapID) then
			if NewYearMonster2011_NianShouIDlist[RightMapID] == nil then
				NewYearMonster2011_NianShouIDlist[RightMapID] = {}
			end
--			local Width,Height = PublicFun_GetMapWidthHeight(RightMapID)
--			local TileX = 0
--			local TileY = 0
--			local Num = 0
--			repeat
--				Num = Num + 1
--				TileX = math.random(Width)
--				TileY = math.random(Height)
--			until not API_IsBlockTile(RightMapID,TileX,TileY,0) or Num == 100
--			if not API_IsBlockTile(RightMapID,TileX,TileY,0) then
				local MonsterID = NewYear2011_MonsterIDTable[v].MonsterID
				local TileX = NewYear2011_MonsterIDTable[v].TileX
				local TileY = NewYear2011_MonsterIDTable[v].TileY
				local NianShou_FastID = API_CreateMonster(RightMapID,MonsterID,TileX,TileY,0,0,-1)
				API_CreateDieTriggerG(0,0,0,NianShou_FastID,'NewYear2011_MonsterDie')
				NewYearMonster2011_NianShouIDlist[RightMapID][1] = NianShou_FastID
				if MonsterID == 730603 then
					NianShouDiaoLuo2011_TimeTriggerGID = API_CreateTimerTriggerG(0,0,10,-1,'NianShouDiaoLuo2011_TimerTriggerGCallFunc')
					if API_GetServerID() == 8 then
						API_ActorBroadcastMsg(-1,17,'年兽王出现在月暮大肆破坏，请众英雄岛勇士速将其诛之！')
						API_ActorBroadcastMsg(-1,1,'年兽王出现在月暮大肆破坏，请众英雄岛勇士速将其诛之！')	
					end
				end
				local NowTime = os.date("*t", os.time()) 
				NowTime.year = Year
				NowTime.month = Month
				NowTime.day = Day
				NowTime.hour = 22
				NowTime.min = 0 
				NowTime.sec = 0
				if NewYear2011_EndDateTimeTriggerGID == nil then
					NewYear2011_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,NowTime.year,NowTime.month,NowTime.day,NowTime.hour,NowTime.min,NowTime.sec,'NewYear2011_Destroy')
				else
					API_DestroyTriggerG(NewYear2011_EndDateTimeTriggerGID)
					NewYear2011_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,NowTime.year,NowTime.month,NowTime.day,NowTime.hour,NowTime.min,NowTime.sec,'NewYear2011_Destroy')
				end
--			end
		end
	end
end

--年兽删除
function NewYear2011_Destroy()
	local GuangBaoNum1 = 0
	for i in NewYearMonster2011_NianShouIDlist do
		for j,v in NewYearMonster2011_NianShouIDlist[i] do
			if API_GetMonsterID(v) > 0 then
				API_DestroyMonster(v)
				GuangBaoNum1 = GuangBaoNum1 + 1
				if GuangBaoNum1 == 1 and API_GetServerID() == 8 then
					API_ActorBroadcastMsg(-1,17,'年兽王与它的随从已经逃离英雄大陆！')
					API_ActorBroadcastMsg(-1,1,'年兽王与它的随从已经逃离英雄大陆！')	
				end
			end
		end
	end
	if NianShouDiaoLuo2011_TimeTriggerGID ~= nil then
		API_DestroyTriggerG(NianShouDiaoLuo2011_TimeTriggerGID)
	end
end

local NianShou2011_Goodstable = {
		[730601] = {
				{GoodsID=80832,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80833,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80833,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80833,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80833,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80833,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=501,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=502,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=503,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=505,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=501,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=502,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=503,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=505,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[730602] = {
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=83103,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=83104,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=83105,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=83106,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=31021,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID={2002,3002,3902,4002,4102,6602,6902,8102,4402,4502,4302,4202,1502,5002,5102,6702,7002,8202,5402,5502,5302,5202,1002,6002,6102,6802,8002,8302,6402,6502,6302,6202},GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=7},
				{GoodsID={2002,3002,3902,4002,4102,6602,6902,8102,4402,4502,4302,4202,1502,5002,5102,6702,7002,8202,5402,5502,5302,5202,1002,6002,6102,6802,8002,8302,6402,6502,6302,6202},GoodsNum=1,Flag=0,GaiLv=800000,PinZhi=7},
				},
		[730603] = {
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80832,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80818,GoodsNum=100,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=89094,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=83103,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=83104,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=83105,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=83106,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=83107,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=83108,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80410,GoodsNum=8000,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=31021,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID={1003,1503,2003,3003,3903,4003,4103,4203,4303,4403,4503,5003,5103,5203,5303,5403,5503,6003,6103,6203,6303,6403,6503,6603,6703,6803,6903,7003,8003,8103,8203,8303},GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=7},
				{GoodsID={1003,1503,2003,3003,3903,4003,4103,4203,4303,4403,4503,5003,5103,5203,5303,5403,5503,6003,6103,6203,6303,6403,6503,6603,6703,6803,6903,7003,8003,8103,8203,8303},GoodsNum=1,Flag=0,GaiLv=800000,PinZhi=7},
				},
}

local NianShou2011_GoodstableMsg = {}

function NianShouDiaoLuo2011_TimerTriggerGCallFunc()
		local Number = API_VarDataGetNumber_Ex(1,0,-6017,1,2)
		for i in NewYearMonster2011_NianShouIDlist do
			for j,v in NewYearMonster2011_NianShouIDlist[i] do
				if API_GetMonsterID(v) == 730603 then	
					local NowHP = API_MonsterGetPropNum(v,2)
					local MaxHP = API_MonsterGetPropNum(v,3)
					if NowHP/MaxHP < 0.2 then
						if Number == 3 then
							Number = Number + 1
							API_VarDataSetNumber_Ex(1,0,-6017,1,2,Number)
							local MapID = API_GetMonsterMap(v)
							local PosX = API_GetMonsterPosX(v)
							local PosY = API_GetMonsterPosY(v)
							for i = 1,10 do
								API_CreateDropGoods(MapID,PosX,PosY,88877,1,0,'掉落物品',4,0,600,60)
							end
						end
					elseif NowHP/MaxHP < 0.4 then
						if Number == 2 then
							Number = Number + 1
							API_VarDataSetNumber_Ex(1,0,-6017,1,2,Number)
							local MapID = API_GetMonsterMap(v)
							local PosX = API_GetMonsterPosX(v)
							local PosY = API_GetMonsterPosY(v)
							for i = 1,10 do
								API_CreateDropGoods(MapID,PosX,PosY,88877,1,0,'掉落物品',4,0,600,60)
							end
						end
					elseif NowHP/MaxHP < 0.6 then
						if Number == 1 then
							Number = Number + 1
							API_VarDataSetNumber_Ex(1,0,-6017,1,2,Number)
							local MapID = API_GetMonsterMap(v)
							local PosX = API_GetMonsterPosX(v)
							local PosY = API_GetMonsterPosY(v)
							for i = 1,10 do
								API_CreateDropGoods(MapID,PosX,PosY,88877,1,0,'掉落物品',4,0,600,60)
							end
						end
					elseif NowHP/MaxHP < 0.8 then
						if Number == 0 then
							Number = Number + 1
							API_VarDataSetNumber_Ex(1,0,-6017,1,2,Number)
							local MapID = API_GetMonsterMap(v)
							local PosX = API_GetMonsterPosX(v)
							local PosY = API_GetMonsterPosY(v)
							for i = 1,10 do
								API_CreateDropGoods(MapID,PosX,PosY,88877,1,0,'掉落物品',4,0,600,60)
							end
							if API_GetServerID() == 8 then
								API_ActorBroadcastMsg(-1,17,'年兽王已身负重伤，掉落出一些“财神宝箱”！')
								API_ActorBroadcastMsg(-1,1,'年兽王已身负重伤，掉落出一些“财神宝箱”！')	
							end
						end
					end
				end
			end
		end
end

--BOSS死亡回调
function NewYear2011_MonsterDie(ActorID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if MonsterID ~= 730601 and MonsterID ~= 730602 and MonsterID ~= 730603 then
		return
	end
	
	local DiaoLuoNum = table.getn(NianShou2011_Goodstable[MonsterID])
	for i = 1,DiaoLuoNum do
		local GoodsTable = NianShou2011_Goodstable[MonsterID][i]
		local GoodsId = GoodsTable.GoodsID
		if type(GoodsId) == 'table' then
			local Type = math.random(1,table.getn(GoodsId))
			GoodsId = GoodsId[Type]
		end
		local Num = GoodsTable.GoodsNum
		local Flag = GoodsTable.Flag
		local Odds = GoodsTable.GaiLv
		local PinZhi = GoodsTable.PinZhi
		local Rand = math.random(1000000)
		if Rand <= Odds then
			if PinZhi > 0 then
				API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落装备',4,KillerID,600,60,PinZhi)
			else
				API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落物品',0,KillerID,600,60)
			end
		end
		for j,v in NianShou2011_GoodstableMsg do
			if JiangLiGoodsID == v then
				API_ActorBroadcastMsg(-1,17,'年兽王死亡掉落了'..API_GetGoodsName(GoodsId)..'')
			end
		end
	end
	if NianShouDiaoLuo2011_TimeTriggerGID ~= nil then
		API_DestroyTriggerG(NianShouDiaoLuo2011_TimeTriggerGID)
	end
	if MonsterID == 730603 then
		API_ActorBroadcastMsg(-1,17,'经众勇士欲命奋战，“年兽王”已被歼灭，月暮恢复往日和平！')
		API_ActorBroadcastMsg(-1,1,'经众勇士欲命奋战，“年兽王”已被歼灭，月暮恢复往日和平！')	
	end
end



---------------------------------------------------元宵猜灯谜----------------------------------------------------

local RiceGlueBall2012_StartTime = {Year = 2012,Month = 2,Day = 1,Hour = 0,Minute = 0,Second = 0}
local RiceGlueBall2012_EndTime = {Year = 2012,Month = 2,Day = 8,Hour = 0,Minute = 0,Second = 0}

local RiceGlueBallDengMi_QuestionList ={
[1] = {Question = '非典，非典，携手清除（打一字）'},
[2] = {Question = '姚明一溜烟 （打一体育词语）'},
[3] = {Question = '“玄德请二人到庄”（打2字古礼仪用语）'},
[4] = {Question = '遮住了花容月貌（打3字出版新词）'},
[5] = {Question = '七日速变俏姿容（打一影星名）'},
[6] = {Question = '宾客尽脱帽，洒泪来反思（打一音乐人，2字）'},
[7] = {Question = '细雨如丝正及时（打一古语称谓）'},
[8] = {Question = '玄德先来，云长未到（打一田径运动员，2字）'},
[9] = {Question = '此章节错误较少（打5字口语）'},
[10] = {Question = '元宵隔日始营业（打4字出版名词，纸张类型）'},
[11] = {Question = '战乱重圆何感叹（打9笔字）'},
[12] = {Question = '不肖遭父笞，药疗得痊愈（打二公安名词）'},
[13] = {Question = '太阳出来喜洋洋（打3字天文名词）'},
[14] = {Question = '吾与一家人，离散又重逢（打一党史人物，2字）'},
[15] = {Question = '“有连山”（打2字国际名词）'},
[16] = {Question = '娘娘懿旨：刀下留人（打7字成语）'},
[17] = {Question = '介入一部分（打2字音乐名词）'},
[18] = {Question = '“夫妻本是同林鸟”（打4字名电视剧）'},
[19] = {Question = '滚滚长江东逝水（打两个2字手机品牌）'},
[20] = {Question = '文章不写半句空（打两个2字文学名词）'},
[21] = {Question = '不要江山要美人（打两个汽车品牌）'},
[22] = {Question = '寄人篱下为糊口（打16笔字）'},
[23] = {Question = '“煌煌太宗业”（打一相声演员，3字）'},
[24] = {Question = '做事手段好精明（打一3字教育机构简称）'},
[25] = {Question = '曲意奉承不可取（打一两字港台歌星，）'},
[26] = {Question = '还是分开吧（打一2字外国名）'},
[27] = {Question = '这一章情节纯属虚构（打5字口语）'},
[28] = {Question = '弃曹会刘本为云长心愿（打《三国演义》歌词一句）'},
[29] = {Question = '高不成，低不就 　（打一金融机构名称）'},
[30] = {Question = '早穿皮袄午穿纱 （打一医学名词）'},
[31] = {Question = '大会 （打一成语）'},
[32] = {Question = '不舒服 （打一成语）'},
[33] = {Question = '人比黄花瘦 （打一农业名词）'},
[34] = {Question = '中华民族繁荣昌盛 （打一近代烈士）'},
[35] = {Question = '天下谁人不识君 （打两个我国地名）'},
[36] = {Question = '荐之于平原君（打一成语）'},
[37] = {Question = '东京北京通贸易 （打一成语）'},
[38] = {Question = '未成油团 （打一外国著名小说）'},
[39] = {Question = '卷尾猴 （打一字）'},
[40] = {Question = '贞观之治 （打一电影演员）'},
[41] = {Question = '唐代瑰宝 （打一古代科学家）'},
[42] = {Question = '儿童节放假 （打一中成药名）'},
[43] = {Question = '并非阴历初一 （打一广西地名）'},
[44] = {Question = '孟母三迁 （打一杂志名称）'},
[45] = {Question = '家中添一口 （打一字）'},
[46] = {Question = '湖光水影月当空 （打一字）'},
[47] = {Question = '百病不单由口入 （打一外国故事片）'},
[48] = {Question = '千分之一百分之一 （打一字）'},
[49] = {Question = '因 （打一谚语）'},
[50] = {Question = '甜咸苦辣各味俱备 （打一字）'},
[51] = {Question = '魏蜀相争 （打一经济名词）'},
[52] = {Question = '只公开谜目 （打两个出版名词）'},
[53] = {Question = '重点支援大西北 （打一字）'},
[54] = {Question = '到黄昏点点滴滴 （打一气象术语）'},
[55] = {Question = '座中泣下谁最多 （打两个文学名词）'},
[56] = {Question = '山中无老虎 （打两个法律名词）'},
[57] = {Question = '大胆改组 （打一鲁迅作品篇名）'},
[58] = {Question = '巧立名目 （打一字）'},
[59] = {Question = '专吃金木火 （打一医学术语）'},
[60] = {Question = '天苍苍、野—— ——（打一句白居易七言诗句）'},
[61] = {Question = '减四余二、减二余四 （打一字）'},
[62] = {Question = '遇水则清、遇火则明 （打一字）'},
[63] = {Question = '冷冷清清凄凄惨惨切切 （打一故事片）'},
[64] = {Question = '丫丫 （打一文艺名词）'},
[65] = {Question = '长安美女 （此谜用心方能猜中，打一词牌）'},
[66] = {Question = '所有的王八穿龙袍（打一电影名）'},
[67] = {Question = '凤凰台上凤凰游 （打数学名词一）'},
[68] = {Question = '为什么要控制人口 （打成语一）'},
[69] = {Question = '半价出售 （打字一）'},
[70] = {Question = '打算明年生小孩（打一电影名）'},
[71] = {Question = '拦河坝 （打字一）'},
[72] = {Question = '羊叫 （打词牌一）'},
[73] = {Question = '蟋蟀对鸣 （打《木兰辞》句一）'},
[74] = {Question = '曲 （打曹操诗句一）'},
[75] = {Question = '分 （打广告用语一）'},
[76] = {Question = '他有你没有，地有天没有 （打字一）'},
[77] = {Question = '有凤凰而没有孔雀 （打字一）'},
[78] = {Question = '鲁迅逝世一世纪（打一成语）'},
[79] = {Question = '画中不是田 （打一字）'},
[80] = {Question = '谜面空白无字 （打一字）'},
[81] = {Question = '说与旁人浑不解 ，用红笔书写（打一现代散文家）'},
[82] = {Question = '百年松柏老芭蕉（打一成语）'},
[83] = {Question = '塞外秋菊漫野金 （打三个中药名）'},
[84] = {Question = '谢绝参观 （打一常用语）'},
[85] = {Question = '夫人何处去（打一字）'},
[86] = {Question = '一人一张口，口下长只手（打一字）'},
[87] = {Question = '推开又来　（打一字）'},
[88] = {Question = '高尔基　（打一字）'},
[89] = {Question = '日近黄昏（打一中国地名）'},
[90] = {Question = '珍珠港（打一中国地名）'},
[91] = {Question = '大热天，猫，狗等都在气喘吁吁，只有羊在吃草 （打一成语）'},
[92] = {Question = '有头无颈，有眼无眉， 无脚能走，有翅难飞（打一动物）'},
[93] = {Question = '夏前它来到，秋后没处找， 摧咱快播种，年年来一遭（打一动物）'},
[94] = {Question = '前有毒夹，后有尾巴， 全身二十一节，中药铺要它（打一动物）'},
[95] = {Question = '同穿衣服同穿鞋（打一与人有关的东西）'},
[96] = {Question = '一线相通，飞行空中(打一物)'},
[97] = {Question = '一片全是草的地（打一植物名称）'},
[98] = {Question = '两对听觉器官（打一音乐家名）'},
[99] = {Question = '刽子手的嘴脸（打一两字官名）'},
[100] = {Question = '开花结桃，桃不能吃（打一物）'},
}
local RiceGlueBallDengMi_AnswerList ={
[1] = {[1]='排',[2]='挡',},
[2] = {[1]='男子长跑',[2]='男子跳高',},
[3] = {[1]='备座',[2]='作揖',},
[4] = {[1]='封面秀',[2]='盖面秀',},
[5] = {[1]='周迅',[2]='周海媚',},
[6] = {[1]='洛兵',[2]='周杰伦',},
[7] = {[1]='在下',[2]='仁兄',},
[8] = {[1]='刘翔',[2]='史东鹏',},
[9] = {[1]='这回差不多',[2]='这样还不行',},
[10] = {[1]='十六开张',[2]='十七出炉',},
[11] = {[1]='哉',[2]='宰',},
[12] = {[1]='严打、治安',[2]='扫黄、打黑',},
[13] = {[1]='日心说',[2]='万有引力',},
[14] = {[1]='伍豪',[2]='伍威',},
[15] = {[1]='峰会',[2]='和谈',},
[16] = {[1]='置之死地而后生',[2]='柳暗花明又一村',},
[17] = {[1]='音阶',[2]='音节',},
[18] = {[1]='难舍真情',[2]='两难相忘',},
[19] = {[1]='波导、海尔',[2]='长虹、联想',},
[20] = {[1]='成语、实录',[2]='文笔、谐语',},
[21] = {[1]='爱丽舍、皇冠',[2]='奔驰、红旗',},
[22] = {[1]='噙',[2]='嗜',},
[23] = {[1]='李国盛',[2]='唐国强',},
[24] = {[1]='高招办',[2]='招就办',},
[25] = {[1]='阿杜',[2]='黎明',},
[26] = {[1]='古巴',[2]='巴西',},
[27] = {[1]='没有那回事',[2]='这怎么可能',},
[28] = {[1]='离合总关情',[2]='我等燕归来',},
[29] = {[1]='中行',[2]='建设银行',},
[30] = {[1]='日服二次',[2]='增加剂量',},
[31] = {[1]='年幼无知',[2]='少不更事',},
[32] = {[1]='适得其反',[2]='正好相同',},
[33] = {[1]='植物肥',[2]='植物瘦',},
[34] = {[1]='黄兴',[2]='董存瑞',},
[35] = {[1]='常熟、大名',[2]='宿州、苏州',},
[36] = {[1]='引人入胜',[2]='令人遐想',},
[37] = {[1]='日中为市',[2]='中西合璧',},
[38] = {[1]='羊脂球',[2]='王子复仇记',},
[39] = {[1]='电',[2]='风',},
[40] = {[1]='唐国强',[2]='张国立',},
[41] = {[1]='李时珍',[2]='张仲景',},
[42] = {[1]='六一散',[2]='五石散',},
[43] = {[1]='阳朔',[2]='桂林',},
[44] = {[1]='《为了孩子》',[2]='《动漫先锋》',},
[45] = {[1]='豪',[2]='爽',},
[46] = {[1]='古',[2]='早',},
[47] = {[1]='《白痴》',[2]='《二傻》',},
[48] = {[1]='伯',[2]='仲',},
[49] = {[1]='有火就有烟',[2]='有烟就有火',},
[50] = {[1]='口',[2]='舌',},
[51] = {[1]='专利权',[2]='专营权',},
[52] = {[1]='封面、封底',[2]='竖页、横板',},
[53] = {[1]='头',[2]='颈',},
[54] = {[1]='晚间有零星小雨',[2]='晚间有倾盆大雨',},
[55] = {[1]='独白，悲剧',[2]='配音、喜剧',},
[56] = {[1]='申诉、自首',[2]='一审、判决',},
[57] = {[1]='《明天》',[2]='《呐喊》',},
[58] = {[1]='啰',[2]='嗦',},
[59] = {[1]='水土不服',[2]='花草过敏',},
[60] = {[1]='两处茫茫皆不见',[2]='两只黄鹂鸣翠柳',},
[61] = {[1]='园',[2]='圆',},
[62] = {[1]='登',[2]='爬',},
[63] = {[1]='《绝唱》',[2]='《绝响》',},
[64] = {[1]='二人转',[2]='黄梅戏',},
[65] = {[1]='忆秦娥',[2]='孟姜女',},
[66] = {[1]='《满城尽带黄金甲》',[2]='《赤壁》',},
[67] = {[1]='相似三角形',[2]='相等三角形',},
[68] = {[1]='多难兴邦',[2]='立国建业',},
[69] = {[1]='催',[2]='促',},
[70] = {[1]='《宝贝计划》',[2]='《窃听风云》',},
[71] = {[1]='汇',[2]='流',},
[72] = {[1]='声声慢',[2]='临江仙',},
[73] = {[1]='唧唧复唧唧',[2]='木兰当户织',},
[74] = {[1]='对酒当歌',[2]='譬如朝露',},
[75] = {[1]='时间就是金钱',[2]='时间就是生命',},
[76] = {[1]='也',[2]='还',},
[77] = {[1]='有',[2]='没有',},
[78] = {[1]='百年树人',[2]='十年树木',},
[79] = {[1]='十',[2]='士',},
[80] = {[1]='迷',[2]='眯',},
[81] = {[1]='朱自清',[2]='沈雁冰',},
[82] = {[1]='粗枝大叶',[2]='马虎不得',},
[83] = {[1]='天冬、前胡、地黄',[2]='当归、防风、半夏',},
[84] = {[1]='不同意见',[2]='签字画押',},
[85] = {[1]='二',[2]='三',},
[86] = {[1]='拿',[2]='擒',},
[87] = {[1]='摊',[2]='派',},
[88] = {[1]='尚',[2]='为',},
[89] = {[1]='洛阳',[2]='长安',},
[90] = {[1]='蚌埠',[2]='阜阳',},
[91] = {[1]='扬眉吐气',[2]='趾高气昂',},
[92] = {[1]='鱼',[2]='虾',},
[93] = {[1]='布谷鸟',[2]='蜂鸟',},
[94] = {[1]='蜈蚣',[2]='蝎子',},
[95] = {[1]='人影',[2]='灯光',},
[96] = {[1]='风筝',[2]='陀螺',},
[97] = {[1]='梅花',[2]='梨花',},
[98] = {[1]='聂耳',[2]='冼星海',},
[99] = {[1]='宰相 ',[2]='太师',},
[100] = {[1]='棉花',[2]='番薯',},
}

local RiceGlueBallDengMi_TrueAnswerList = {
[1] = {TrueAnswer='排',},
[2] = {TrueAnswer='男子长跑',},
[3] = {TrueAnswer='备座',},
[4] = {TrueAnswer='封面秀',},
[5] = {TrueAnswer='周迅',},
[6] = {TrueAnswer='洛兵',},
[7] = {TrueAnswer='在下',},
[8] = {TrueAnswer='刘翔',},
[9] = {TrueAnswer='这回差不多',},
[10] = {TrueAnswer='十六开张',},
[11] = {TrueAnswer='哉',},
[12] = {TrueAnswer='严打、治安',},
[13] = {TrueAnswer='日心说',},
[14] = {TrueAnswer='伍豪',},
[15] = {TrueAnswer='峰会',},
[16] = {TrueAnswer='置之死地而后生',},
[17] = {TrueAnswer='音阶',},
[18] = {TrueAnswer='难舍真情',},
[19] = {TrueAnswer='波导、海尔',},
[20] = {TrueAnswer='成语、实录',},
[21] = {TrueAnswer='爱丽舍、皇冠',},
[22] = {TrueAnswer='噙',},
[23] = {TrueAnswer='李国盛',},
[24] = {TrueAnswer='高招办',},
[25] = {TrueAnswer='阿杜',},
[26] = {TrueAnswer='古巴',},
[27] = {TrueAnswer='没有那回事',},
[28] = {TrueAnswer='离合总关情',},
[29] = {TrueAnswer='中行',},
[30] = {TrueAnswer='日服二次',},
[31] = {TrueAnswer='年幼无知',},
[32] = {TrueAnswer='适得其反',},
[33] = {TrueAnswer='植物肥',},
[34] = {TrueAnswer='黄兴',},
[35] = {TrueAnswer='常熟、大名',},
[36] = {TrueAnswer='引人入胜',},
[37] = {TrueAnswer='日中为市',},
[38] = {TrueAnswer='羊脂球',},
[39] = {TrueAnswer='电',},
[40] = {TrueAnswer='唐国强',},
[41] = {TrueAnswer='李时珍',},
[42] = {TrueAnswer='六一散',},
[43] = {TrueAnswer='阳朔',},
[44] = {TrueAnswer='《为了孩子》',},
[45] = {TrueAnswer='豪',},
[46] = {TrueAnswer='古',},
[47] = {TrueAnswer='《白痴》',},
[48] = {TrueAnswer='伯',},
[49] = {TrueAnswer='有火就有烟',},
[50] = {TrueAnswer='口',},
[51] = {TrueAnswer='专利权',},
[52] = {TrueAnswer='封面、封底',},
[53] = {TrueAnswer='头',},
[54] = {TrueAnswer='晚间有零星小雨',},
[55] = {TrueAnswer='独白，悲剧',},
[56] = {TrueAnswer='申诉、自首',},
[57] = {TrueAnswer='《明天》',},
[58] = {TrueAnswer='啰',},
[59] = {TrueAnswer='水土不服',},
[60] = {TrueAnswer='两处茫茫皆不见',},
[61] = {TrueAnswer='园',},
[62] = {TrueAnswer='登',},
[63] = {TrueAnswer='《绝唱》',},
[64] = {TrueAnswer='二人转',},
[65] = {TrueAnswer='忆秦娥',},
[66] = {TrueAnswer='《满城尽带黄金甲》',},
[67] = {TrueAnswer='相似三角形',},
[68] = {TrueAnswer='多难兴邦',},
[69] = {TrueAnswer='催',},
[70] = {TrueAnswer='《宝贝计划》',},
[71] = {TrueAnswer='汇',},
[72] = {TrueAnswer='声声慢',},
[73] = {TrueAnswer='唧唧复唧唧',},
[74] = {TrueAnswer='对酒当歌',},
[75] = {TrueAnswer='时间就是金钱',},
[76] = {TrueAnswer='也',},
[77] = {TrueAnswer='有',},
[78] = {TrueAnswer='百年树人',},
[79] = {TrueAnswer='十',},
[80] = {TrueAnswer='迷',},
[81] = {TrueAnswer='朱自清',},
[82] = {TrueAnswer='粗枝大叶',},
[83] = {TrueAnswer='天冬、前胡、地黄',},
[84] = {TrueAnswer='不同意见',},
[85] = {TrueAnswer='二',},
[86] = {TrueAnswer='拿',},
[87] = {TrueAnswer='摊',},
[88] = {TrueAnswer='尚',},
[89] = {TrueAnswer='洛阳',},
[90] = {TrueAnswer='蚌埠',},
[91] = {TrueAnswer='扬眉吐气',},
[92] = {TrueAnswer='鱼',},
[93] = {TrueAnswer='布谷鸟',},
[94] = {TrueAnswer='蜈蚣',},
[95] = {TrueAnswer='人影',},
[96] = {TrueAnswer='风筝',},
[97] = {TrueAnswer='梅花',},
[98] = {TrueAnswer='聂耳',},
[99] = {TrueAnswer='宰相',},
[100] = {TrueAnswer='棉花',},
}

local CaiDengMi_Exp = {
[1] = 100,
[2] = 120,
[3] = 140,
[4] = 160,
[5] = 180,
[6] = 200,
[7] = 220,
[8] = 240,
[9] = 260,
[10] = 280,
[11] = 300,
[12] = 320,
[13] = 340,
[14] = 360,
[15] = 380,
[16] = 400,
[17] = 420,
[18] = 440,
[19] = 460,
[20] = 480,
[21] = 500,
[22] = 520,
[23] = 540,
[24] = 560,
[25] = 580,
[26] = 600,
[27] = 1000,
[28] = 1100,
[29] = 1200,
[30] = 1300,
[31] = 1400,
[32] = 1500,
[33] = 1600,
[34] = 1700,
[35] = 1800,
[36] = 1900,
[37] = 2000,
[38] = 2100,
[39] = 2200,
[40] = 2300,
[41] = 2400,
[42] = 2500,
[43] = 2600,
[44] = 2700,
[45] = 2800,
[46] = 2900,
[47] = 3000,
[48] = 3100,
[49] = 3200,
[50] = 3300,
[51] = 3400,
[52] = 3500,
[53] = 3600,
[54] = 3700,
[55] = 3800,
[56] = 3900,
[57] = 4000,
[58] = 4100,
[59] = 4200,
[60] = 4300,
[61] = 4400,
[62] = 4500,
[63] = 4600,
[64] = 4700,
[65] = 4800,

}

if CaiDengMi2011_Start == nil then 
   CaiDengMi2011_Start = 0
end

if CaiDengMi2011_DengLongIDlist == nil then   ----------存放每张地图怪临时ID
   CaiDengMi2011_DengLongIDlist = {}
end

--创建时间触发器
if API_GetServerID() < 11 then
	local StartTimeTable = RiceGlueBall2012_StartTime
	local EndTimeTable = RiceGlueBall2012_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouEnd > 0 then
	--创建时间触发器
		if CaiDengMi2011_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(CaiDengMi2011_TimeTriggerGID)
		end
		CaiDengMi2011_TimeTriggerGID = API_CreateTimerTriggerG(0,0,60,-1,'CaiDengMi2011_ActTimeFunc')
	else
		if CaiDengMi2011_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(CaiDengMi2011_TimeTriggerGID)
		end
	end
end

CaiDengMi2011_MapList = {9,25}

CaiDengMi2011_PinLv = {         -------------灯笼数量
   [1] = {least = 100 ,most = 200},
}

function CaiDengMi2011_ActTimeFunc()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local StartTimeTable = RiceGlueBall2012_StartTime
	local EndTimeTable = RiceGlueBall2012_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if Hour == 13 and Minute >= 30 and API_GetServerID() == 2 then
			if math.mod(Minute,10) == 0 then
				API_ActorBroadcastMsg(-1,17,'猜灯谜活动将在14：00-15：00在帝国暗礁海和联邦麦穗平原举行！')
				API_ActorBroadcastMsg(-1,1,'猜灯谜活动将在14：00-15：00在帝国暗礁海和联邦麦穗平原举行！')	
			end
		end
		if Hour == 19 and Minute >= 30 and API_GetServerID() == 2 then
			if math.mod(Minute,10) == 0 then
				API_ActorBroadcastMsg(-1,17,'猜灯谜活动将在20：00-21：00在帝国暗礁海和联邦麦穗平原举行！')
				API_ActorBroadcastMsg(-1,1,'猜灯谜活动将在20：00-21：00在帝国暗礁海和联邦麦穗平原举行！')	
			end
		end
		if Hour == 20 or Hour == 14 then
			for i,v in CaiDengMi2011_MapList do
				local RightMapID = API_GetRightMapID(v)
				if API_MapIsValid(RightMapID) then
					local PlayNum = 50
					local PlayList = API_GetActorInArea(RightMapID,0,0,0,0,0)
					if PlayList ~= nil then
						PlayNum = table.getn(PlayList)
					end
					local MID = 12376
					local CaiDengMi2011_DengLong = 100
					if PlayNum <= 50 then
						CaiDengMi2011_DengLong = CaiDengMi2011_PinLv[1].least
					else
						local Number = PlayNum - 50
						if PlayNum > 50 and PlayNum <= 150 then
						   CaiDengMi2011_DengLong = Number + CaiDengMi2011_PinLv[1].least
						elseif PlayNum > 200 then
							CaiDengMi2011_DengLong = CaiDengMi2011_PinLv[1].most
						end
					end
					if CaiDengMi2011_DengLongIDlist[RightMapID] == nil then
						CaiDengMi2011_DengLongIDlist[RightMapID] = {}
					end
					for j = 1,CaiDengMi2011_DengLong do
						local YeWaiFastID = CaiDengMi2011_DengLongIDlist[RightMapID][j]
						if YeWaiFastID == nil or API_GetMonsterID(YeWaiFastID) <= 0 then
							local Width,Height = PublicFun_GetMapWidthHeight(RightMapID)
							local TileX = 0
							local TileY = 0
							local Num = 0
							repeat
								Num = Num + 1
								TileX = math.random(Width)
								TileY = math.random(Height)
							until not API_IsBlockTile(RightMapID,TileX,TileY,0) or Num == 100
							if not API_IsBlockTile(RightMapID,TileX,TileY,0) then
								local MonsterID = 12376
								local YeWaiFastID = API_CreateMonster(RightMapID,MonsterID,TileX,TileY,0,0,-1)
								CaiDengMi2011_DengLongIDlist[RightMapID][j] = YeWaiFastID
							end
						end
					end
				end
			end
			CaiDengMi2011_Start = 1
		else
			if CaiDengMi2011_Start == 1 then
				CaiDengMi2011_Start = 0
				for i in CaiDengMi2011_DengLongIDlist do
					for j,v in CaiDengMi2011_DengLongIDlist[i] do
						if API_GetMonsterID(v) > 0 then
							API_DestroyMonster(v)
						end
					end
				end
				CaiDengMi2011_DengLongIDlist = {}
			end
		end
	else
		if CaiDengMi2011_Start == 1 then
			CaiDengMi2011_Start = 0
			for i in CaiDengMi2011_DengLongIDlist do
				for j,v in CaiDengMi2011_DengLongIDlist[i] do
					if API_GetMonsterID(v) > 0 then
						API_DestroyMonster(v)
					end
				end
			end
			CaiDengMi2011_DengLongIDlist = {}
		end
	end
end


function RiceGlueBallDengMi(ActorID,NPCID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ActorID = ActorID or API_RequestGetActorID()
--	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local XuanZe = API_RequestGetNumber(1)	

	if API_GetMonsterID(NPCFastID) <= 0 then
		if (Hour >= 14 and Hour < 15) or (Hour >= 20 and Hour < 21) then
			API_ActorSendMsg(ActorID,10,'这个灯笼已经被人捷足先登，请找寻另外的灯笼猜谜。')
			API_ResponseWrite('<br><text>这个灯笼已经被人捷足先登，请找寻另外的灯笼猜谜。</text><br>')
		else
			if	Day < 6 then 
				API_ActorSendMsg(ActorID,10,'今天灯谜活动已经结束，欢迎您明天再来参加。')
				API_ResponseWrite('<br><text>今天灯谜活动已经结束，欢迎您明天再来参加。</text><br>')
			elseif Day >= 6 then 			
				API_ActorSendMsg(ActorID,10,'元宵灯谜活动已经全部结束，感谢您在这七天里参与。')
				API_ResponseWrite('<br><text>元宵灯谜活动已经全部结束，感谢您在这七天里参与。</text><br>')	
			end	
		end
		return
	end
	
	if XuanZe == 1 then
		API_DestroyMonster(NPCFastID)
		local YuanXiaoDM_True = API_RequestGetNumber(2)
		if  YuanXiaoDM_True == 1 then
			local Level = API_GetActorExpLevel(ActorID)
			local Exp = CaiDengMi_Exp[Level]
			API_ActorAddExp(ActorID, Exp, 0, '猜灯谜奖励')
			if API_ActorCanAddGoods(ActorID,82030,1,3,0) ~= -1 then
				API_AddActorGoodsFlag(ActorID,82030,1,3,'获得荣誉勋章')
				API_ActorSendMsg(ActorID,8,'恭喜你答对了，获得'..Exp..'经验，获得荣誉勋章！')
			else
				local GoodsName = API_GetGoodsName(82030)
				API_SendActorMailByName(API_GetActorName(ActorID),82030,1,3,'获得荣誉勋章','')
				API_ActorSendMsg(ActorID,8,'恭喜你答对了，获得'..Exp..'经验，获得'..GoodsName..'1个（请到邮箱领取）')
			end
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>很抱歉您答错本道题目，无法获得奖励，请您不要气馁，更多的奖励在等着您。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
		end
	else
		local DMQuestionNo = math.random(table.getn(RiceGlueBallDengMi_QuestionList)) 
		local Question = RiceGlueBallDengMi_QuestionList[DMQuestionNo].Question
		local Answer = RiceGlueBallDengMi_AnswerList[DMQuestionNo]
		local TrueAnswer = RiceGlueBallDengMi_TrueAnswerList[DMQuestionNo].TrueAnswer
		local LinShi = {}
		for i = 1,table.getn(RiceGlueBallDengMi_AnswerList[DMQuestionNo]) do
			LinShi[i] = RiceGlueBallDengMi_AnswerList[DMQuestionNo][i]
		end
		LinShiBC = table.getn(LinShi)
		local LinShi2 = {}
		local TureDaAn = 1
		while LinShiBC > 0 do
			local XH = math.random(LinShiBC)
			LinShi2BC = table.getn(LinShi2)
			LinShi2[LinShi2BC+1] = LinShi[XH]
			LinShiBC = LinShiBC -1
			if LinShi[XH] == TrueAnswer then
				TrueDaAn = table.getn(LinShi2)
			end
			--删除LinShi表里面XH这一行
			table.remove(LinShi,XH)
		end
		API_ResponseWrite('<name>元宵猜灯谜</name>')
		API_ResponseWrite('<br><text>根据问题，选择一个正确答案。</text><br>')
		API_ResponseWrite('<text>'..Question..'</text><br>')
		for i =1,table.getn(LinShi2) do
			local ABC = 0
			if	i == TrueDaAn then
				ABC = 1
			end
			API_ResponseWrite('<br><a href="RiceGlueBallDengMi?1=1&2='..ABC..'">'..i..'、'..LinShi2[i]..'</a><br>')
		end
		API_ResponseFlush(ActorID)
	end
end



---------------------------------------------暑期在线领红包-----------------------------------------------

local ShuJia2012_StartTime = {Year = 2012,Month = 12,Day = 14,Hour = 0,Minute = 0,Second = 0}
local ShuJia2012_EndTime = {Year = 2013,Month = 1,Day = 4,Hour = 0,Minute = 0,Second = 0}

local ShuJia2012_RedPaperID = 90011
local ShuJia2012_RedPaperPhotoID = 104121

local ShuJia2012_BonusTime = 30268 
local ShuJia2012_BonusNum = 30267 

--上线判断
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'LC_ShuJia2012_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'LC_ShuJia2012_OnLogin') 
end

--下线判断
local OnLogoutLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLogoutFuncNameList) do 
	if GLOBAL_ActMain_OnLogoutFuncNameList[i] == 'LC_ShuJia2012_OnLogout' then
		OnLogoutLoadOK = 1
		break
	end 
end 
if OnLogoutLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLogoutFuncNameList,'LC_ShuJia2012_OnLogout') 
end

--上线回调
function LC_ShuJia2012_OnLogin() 
	local ActorID = API_RequestGetActorID()
	local StartTimeTable = ShuJia2012_StartTime
	local EndTimeTable = ShuJia2012_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local ActorLevel = API_GetActorExpLevel(ActorID)
	if ActorLevel < 11 then
		return
	end	
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		API_RemoveTaskScroll(ActorID,ShuJia2012_RedPaperID)
		LRY_UItwinkemanage(ActorID,11,85,ShuJia2012_RedPaperPhotoID,ShuJia2012_RedPaperID,20,'LC_ShuJia2012_juanzhoudianji')--加载图标
	else
		API_RemoveTaskScroll(ActorID,ShuJia2012_RedPaperID)
	end
end

--下线回调
function LC_ShuJia2012_OnLogout()
	
end

--卷轴点击
function LC_ShuJia2012_juanzhoudianji()
	local ActorID = API_RequestGetActorID()
	local StartTimeTable = ShuJia2012_StartTime
	local EndTimeTable = ShuJia2012_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	
	local Time = API_VarDataGetNumber(ActorID,1,ShuJia2012_BonusTime)
	local LastTime = os.date("*t", Time) 
	if Year ~= LastTime.year or Month ~= LastTime.month or Day ~= LastTime.day then
		API_VarDataSetNumber(ActorID,1,ShuJia2012_BonusNum,10)
	end
	local Number = API_VarDataGetNumber(ActorID,1,ShuJia2012_BonusNum)
	
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		API_ResponseWrite('<win rect="500,175,420,220"></win>')
		API_ResponseWrite('<name>魂器传承</name>')
		API_ResponseWrite('<text>    尊敬的勇士为了激发英雄之魂更多的潜力，我特地炼制了一些魂器。魂器传承活动期间（2012年12月14日至2013年1月3日之间）每日签到即可获得大量英雄之魂经验，并有机会获得1-3星的魂器。您今天还可以传承</text><text color="255,0,255">'..Number..'</text><text>次。</text><br>')
		API_ResponseWrite('<br><a href="LC_ShuJia2012_juanzhoudianji_Title?1=100">传承魂器</a><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_RemoveTaskScroll(ActorID,ShuJia2012_RedPaperID)
		API_ResponseWrite('<win rect="500,175,420,220"></win>')
		API_ResponseWrite('<name>武魂传承</name>')
		API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
		API_ResponseWrite('<text>	 英雄岛魂器传承活动已结束，谢谢您的参与。</text><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
		return 1
	end
end 

local HunQiGoodsTable = {11553,11558,11568,11574,11579,11584,11589,11563,11614,
						11554,11559,11569,11575,11580,11585,11590,11564,11615,
						11555,11560,11570,11576,11581,11586,11591,11565,11616,}

local HunQiChuanCheng = {
			[11553] = {PropertyID = 1,QualityID = 1,Exp = 30},
			[11558] = {PropertyID = 2,QualityID = 1,Exp = 30},
			[11568] = {PropertyID = 3,QualityID = 1,Exp = 30},
			[11574] = {PropertyID = 4,QualityID = 1,Exp = 30},
			[11579] = {PropertyID = 5,QualityID = 1,Exp = 30},
			[11584] = {PropertyID = 6,QualityID = 1,Exp = 30},
			[11589] = {PropertyID = 7,QualityID = 1,Exp = 30},
			[11563] = {PropertyID = 8,QualityID = 1,Exp = 30},
			[11614] = {PropertyID = 59,QualityID = 1,Exp = 30},
			
			[11554] = {PropertyID = 1,QualityID = 2,Exp = 60},
			[11559] = {PropertyID = 2,QualityID = 2,Exp = 60},
			[11569] = {PropertyID = 3,QualityID = 2,Exp = 60},
			[11575] = {PropertyID = 4,QualityID = 2,Exp = 60},
			[11580] = {PropertyID = 5,QualityID = 2,Exp = 60},
			[11585] = {PropertyID = 6,QualityID = 2,Exp = 60},
			[11590] = {PropertyID = 7,QualityID = 2,Exp = 60},
			[11564] = {PropertyID = 8,QualityID = 2,Exp = 60},
			[11615] = {PropertyID = 59,QualityID = 2,Exp = 60},
			
			[11555] = {PropertyID = 1,QualityID = 3,Exp = 120},
			[11560] = {PropertyID = 2,QualityID = 3,Exp = 120},
			[11570] = {PropertyID = 3,QualityID = 3,Exp = 120},
			[11576] = {PropertyID = 4,QualityID = 3,Exp = 120},
			[11581] = {PropertyID = 5,QualityID = 3,Exp = 120},
			[11586] = {PropertyID = 6,QualityID = 3,Exp = 120},
			[11591] = {PropertyID = 7,QualityID = 3,Exp = 120},
			[11565] = {PropertyID = 8,QualityID = 3,Exp = 120},
			[11616] = {PropertyID = 59,QualityID = 3,Exp = 120},
		}

--卷轴判断
function LC_ShuJia2012_juanzhoudianji_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	
	local Time = API_VarDataGetNumber(ActorID,1,ShuJia2012_BonusTime)
	local LastTime = os.date("*t", Time) 
	if Year ~= LastTime.year or Month ~= LastTime.month or Day ~= LastTime.day then
		API_VarDataSetNumber(ActorID,1,ShuJia2012_BonusNum,10)
	end
	
	if SelectItem == 100 then
		local ContainerSize = API_GetHorcruxesEmptySize(ActorID, 2)
		if ContainerSize <= 0 then
			API_ActorSendMsg(ActorID,3,'您的猎魂背包已满，请至少保留一个空位再来领取')
			return
		end
		local Time = os.time()
		local NextTime = API_VarDataGetNumber(ActorID,1,ShuJia2012_BonusTime)
		local Number = API_VarDataGetNumber(ActorID,1,ShuJia2012_BonusNum)
		if Number > 0 then
			if Time > NextTime then
				local NextTime = Time + 600
				API_VarDataSetNumber(ActorID,1,ShuJia2012_BonusTime,NextTime)
				local GoodsID
				local Gailv = math.random(10000)
				if Gailv > 100 then
					GoodsID = 11594
					local Exp = math.random(2,10)
					API_ActorNewHorcruxes(ActorID, GoodsID, 1, 1, Exp)
				else
					GoodsID = HunQiGoodsTable[math.random(table.getn(HunQiGoodsTable))]
					local PropertyID = HunQiChuanCheng[GoodsID].PropertyID
					local QualityID = HunQiChuanCheng[GoodsID].QualityID
					local Exp = HunQiChuanCheng[GoodsID].Exp
					API_ActorNewHorcruxes(ActorID, GoodsID, PropertyID, QualityID, Exp)
--					if QualityID == 3 then
						API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'通过魂器传承获得了'..API_GetGoodsName(GoodsID)..'') 
--					end
				end
				Number = Number - 1
				API_VarDataSetNumber(ActorID,1,ShuJia2012_BonusNum,Number)
				API_ResponseWrite('<win rect="500,175,420,220"></win>')
				API_ResponseWrite('<name>魂器传承</name>')
				API_ResponseWrite('<text>获得1个</text><img srcgd="'..GoodsID..'" ><text>，请打开猎魂背包检查，您今天还可以传承</text><text color="255,0,255">'..Number..'</text><text>次。</text><br>')						
				API_ResponseFlush(ActorID)
				API_ActorSendMsg(ActorID,8,'获得1个'..API_GetGoodsName(GoodsID)..'')
			else
				local CountDown = NextTime - Time
				local Minute = math.floor(CountDown/60)
				if Minute == 0 then
					Minute = 1
				end
				API_ResponseWrite('<win rect="500,175,420,220"></win>')
				API_ResponseWrite('<name>魂器传承</name>')
				API_ResponseWrite('<text>还有</text><text color="255,0,255">'..Minute..'</text><text>分钟可继续参与魂器传承，您今天还可以参与</text><text color="255,0,255">'..Number..'</text><text>次。</text><br>')
				API_ResponseWrite('<br><a>关闭</a>')
				API_ResponseFlush(ActorID)
				return 1
			end
		else
			API_ResponseWrite('<win rect="500,175,420,220"></win>')
			API_ResponseWrite('<name>魂器传承</name>')
			API_ResponseWrite('<text>    每个玩家每天进行10次武魂传承，您今天已经参与了10次，欢迎明天继续参与。</text><br>')
			API_ResponseWrite('<br><a>关闭</a>')
			API_ResponseFlush(ActorID)
			return 1
		end
	end
end

