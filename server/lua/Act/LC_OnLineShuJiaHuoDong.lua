-------------------------------
--文件名:	Scp\Lua\Act\LC_OnlineShuJiaHuoDong.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	刘操
--日  期:	
--版  本:	
--描  述:	2011暑期活动
--应  用:  
-------------------------------

--活动起止时间
local ShuJiaHuoDong_StartTime = {Year = 2011,Month = 6,Day = 30,Hour = 0,Minute = 0,Second = 0}
local ShuJiaHuoDong_EndTime = {Year = 2011,Month = 8,Day = 31,Hour = 0,Minute = 0,Second = 0}

--上线时间
local LC_ShuJiaHuoDongLoginTime = 30242

--在线时长
local LC_ShuJiaHuoDongAddTime = 30243

--连续参与活动天数
local LC_ShuJiaHuoDongLianXuNum = 30244

--拥有领奖次数
local LC_ShuJiaHuoDongLingJiangNum = 30245

--发放抽奖机会时间
local LC_ShuJiaHuoDongChouJiangTime = 30246

--卷轴ID
local ShuJiaHuoDong_juanzhouid = 90006

--卷轴图标ID
local ShuJiaHuoDongtubiaoid = 104120

--今日领奖数
local LC_ShuJiaHuoDongTodayNum = 30247
 
 --上线判断
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'LC_ShuJiaHuoDong_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'LC_ShuJiaHuoDong_OnLogin') 
end

--下线判断
local OnLogoutLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLogoutFuncNameList) do 
	if GLOBAL_ActMain_OnLogoutFuncNameList[i] == 'LC_ShuJiaHuoDong_OnLogout' then
		OnLogoutLoadOK = 1
		break
	end 
end 
if OnLogoutLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLogoutFuncNameList,'LC_ShuJiaHuoDong_OnLogout') 
end
 
--上线回调
function LC_ShuJiaHuoDong_OnLogin() 
	local ActorID = API_RequestGetActorID()
	local OnLoginType = API_VarDataGetNumber(ActorID,0,18368)
	local StartTimeTable = ShuJiaHuoDong_StartTime
	local EndTimeTable = ShuJiaHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local ActorLevel = API_GetActorExpLevel(ActorID)
	if ActorLevel < 23 then
		return
	end	
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		API_RemoveTaskScroll(ActorID,ShuJiaHuoDong_juanzhouid)
		LRY_UItwinkemanage(ActorID,23,85,ShuJiaHuoDongtubiaoid,ShuJiaHuoDong_juanzhouid,20,'LC_ShuJiaHuoDong_juanzhoudianji')--加载图标
		local LoginTime =os.time()
		API_VarDataSetNumber(ActorID,1,LC_ShuJiaHuoDongLoginTime,LoginTime)
	end
end

--下线回调
function LC_ShuJiaHuoDong_OnLogout()
	local ActorID = API_RequestGetActorID()
	local NowTime = os.time()
	local LoginTime = API_VarDataGetNumber(ActorID,1,LC_ShuJiaHuoDongLoginTime)
	local StartTimeTable = ShuJiaHuoDong_StartTime
	local EndTimeTable = ShuJiaHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)

	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		local OnLoginTime1 = NowTime - LoginTime
		local OnLoginTime2 = API_VarDataGetNumber(ActorID,1,LC_ShuJiaHuoDongAddTime)
		local OnLoginTime = OnLoginTime1 + OnLoginTime2
		API_VarDataSetNumber(ActorID,1,LC_ShuJiaHuoDongAddTime,OnLoginTime)
	end
end

--卷轴点击函数
function LC_ShuJiaHuoDong_juanzhoudianji()
	local ActorID = API_RequestGetActorID()
	local LoginTime = API_VarDataGetNumber(ActorID,1,LC_ShuJiaHuoDongLoginTime)
	local AddTime = API_VarDataGetNumber(ActorID,1,LC_ShuJiaHuoDongAddTime)
	local NowTime = os.time()

	local StartTimeTable = ShuJiaHuoDong_StartTime
	local EndTimeTable = ShuJiaHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)

	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		local OnLoginTime = NowTime - LoginTime
		AddTime = AddTime + OnLoginTime
		local Hour = math.floor(AddTime/3600)
		local AddMinute = AddTime - (Hour * 3600)
		local Minute = math.floor(AddMinute/60)
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>英雄岛暑期抽疯乐</name>')
		API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
		API_ResponseWrite('<text>    您今天已在线</text><text color="255,0,255">'..Hour..'小时</text><text color="255,0,255">'..Minute..'分</text><text>。即日起，每日累计在线3小时，可获得1次抽奖机会，连续两天满足条件则第二天可获得2次抽奖机会，最高可获得5次抽奖机会，期间中断则从1次开始重新累计。</text><br>')
		API_ResponseWrite('<br><a href="LC_ShuJiaHuoDong_juanzhoudianji_Title?1=100">我要抽奖</a><br>')
		API_ResponseWrite('<br><a href="LC_ShuJiaHuoDong_juanzhoudianji_Title?1=200">活动规则</a><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>英雄岛暑期抽疯乐</name>')
		API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
		API_ResponseWrite('<text>	英雄岛暑期抽疯乐活动已结束，谢谢您的参与。</text><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
		return 1		
	end
end

--活动奖励列表
local LC_ShuJiaHuoDong_GoodSTabel = {
[1] = {
		[1] = {
				{GoodsID=80832,GaiLv1=1,GaiLv2=1521812,NumMax=15,NumMin=5},
				{GoodsID=80833,GaiLv1=1521813,GaiLv2=3043625,NumMax=10,NumMin=5},
				{GoodsID=82004,GaiLv1=3043626,GaiLv2=4058167,NumMax=10,NumMin=5},
				{GoodsID=80274,GaiLv1=4058168,GaiLv2=5072709,NumMax=5,NumMin=4},
				{GoodsID=845,GaiLv1=5072710,GaiLv2=6087251,NumMax=3,NumMin=1},
				{GoodsID=80383,GaiLv1=6087252,GaiLv2=7101793,NumMax=2,NumMin=1},
				{GoodsID=80381,GaiLv1=7101794,GaiLv2=8116335,NumMax=2,NumMin=1},
				{GoodsID=89041,GaiLv1=8116336,GaiLv2=8192426,NumMax=1,NumMin=1},
				{GoodsID=89044,GaiLv1=8192427,GaiLv2=8268517,NumMax=1,NumMin=1},
				{GoodsID=9503,GaiLv1=8268518,GaiLv2=8302336,NumMax=1,NumMin=1},
				{GoodsID=9504,GaiLv1=8302337,GaiLv2=8336155,NumMax=1,NumMin=1},
				{GoodsID=501,GaiLv1=8336156,GaiLv2=8437610,NumMax=5,NumMin=4},
				{GoodsID=75,GaiLv1=8437611,GaiLv2=8498483,NumMax=2,NumMin=1},
				{GoodsID=80195,GaiLv1=8498484,GaiLv2=8904300,NumMax=30,NumMin=20},
				{GoodsID=38068,GaiLv1=8904301,GaiLv2=9026046,NumMax=1,NumMin=1},
				{GoodsID=38075,GaiLv1=9026047,GaiLv2=9147792,NumMax=1,NumMin=1},
				{GoodsID=38076,GaiLv1=9147793,GaiLv2=9269538,NumMax=1,NumMin=1},
				{GoodsID=38077,GaiLv1=9269539,GaiLv2=9391284,NumMax=1,NumMin=1},
				{GoodsID=80065,GaiLv1=9391285,GaiLv2=9797101,NumMax=30,NumMin=20},
				{GoodsID=80049,GaiLv1=9797102,GaiLv2=10000000,NumMax=30,NumMin=20},
			},
		[2] = {
				{GoodsID=80832,GaiLv1=1,GaiLv2=1261401,NumMax=15,NumMin=5},
				{GoodsID=80833,GaiLv1=1261402,GaiLv2=2522803,NumMax=10,NumMin=5},
				{GoodsID=82004,GaiLv1=2522804,GaiLv2=3531924,NumMax=10,NumMin=5},
				{GoodsID=80274,GaiLv1=3531925,GaiLv2=4541045,NumMax=5,NumMin=4},
				{GoodsID=845,GaiLv1=4541046,GaiLv2=5550166,NumMax=3,NumMin=1},
				{GoodsID=80383,GaiLv1=5550167,GaiLv2=6559287,NumMax=2,NumMin=1},
				{GoodsID=80381,GaiLv1=6559288,GaiLv2=7568408,NumMax=2,NumMin=1},
				{GoodsID=89041,GaiLv1=7568409,GaiLv2=7694549,NumMax=1,NumMin=0},
				{GoodsID=89044,GaiLv1=7694550,GaiLv2=7820690,NumMax=1,NumMin=0},
				{GoodsID=9503,GaiLv1=7820691,GaiLv2=7883761,NumMax=1,NumMin=0},
				{GoodsID=9504,GaiLv1=7883762,GaiLv2=7946832,NumMax=1,NumMin=0},
				{GoodsID=501,GaiLv1=7946833,GaiLv2=8115019,NumMax=5,NumMin=4},
				{GoodsID=75,GaiLv1=8115020,GaiLv2=8215932,NumMax=2,NumMin=1},
				{GoodsID=80195,GaiLv1=8215933,GaiLv2=8552306,NumMax=30,NumMin=20},
				{GoodsID=38068,GaiLv1=8552307,GaiLv2=8754131,NumMax=1,NumMin=0},
				{GoodsID=38075,GaiLv1=8754132,GaiLv2=8955956,NumMax=1,NumMin=0},
				{GoodsID=38076,GaiLv1=8955957,GaiLv2=9157781,NumMax=1,NumMin=0},
				{GoodsID=38077,GaiLv1=9157782,GaiLv2=9359606,NumMax=1,NumMin=0},
				{GoodsID=80065,GaiLv1=9359607,GaiLv2=9747730,NumMax=30,NumMin=20},
				{GoodsID=80049,GaiLv1=9747731,GaiLv2=10000000,NumMax=30,NumMin=20},
			},
		[3] = {
				{GoodsID=80832,GaiLv1=1,GaiLv2=1109174,NumMax=15,NumMin=5},
				{GoodsID=80833,GaiLv1=1109175,GaiLv2=2218349,NumMax=10,NumMin=5},
				{GoodsID=82004,GaiLv1=2218350,GaiLv2=3169070,NumMax=10,NumMin=5},
				{GoodsID=80274,GaiLv1=3169071,GaiLv2=4119791,NumMax=5,NumMin=4},
				{GoodsID=845,GaiLv1=4119792,GaiLv2=5070512,NumMax=3,NumMin=1},
				{GoodsID=80383,GaiLv1=5070513,GaiLv2=6021233,NumMax=2,NumMin=1},
				{GoodsID=80381,GaiLv1=6021234,GaiLv2=6971954,NumMax=2,NumMin=1},
				{GoodsID=89041,GaiLv1=6971955,GaiLv2=7138331,NumMax=1,NumMin=1},
				{GoodsID=89044,GaiLv1=7138332,GaiLv2=7304708,NumMax=1,NumMin=1},
				{GoodsID=9503,GaiLv1=7304709,GaiLv2=7387897,NumMax=1,NumMin=1},
				{GoodsID=9504,GaiLv1=7387898,GaiLv2=7471086,NumMax=1,NumMin=1},
				{GoodsID=501,GaiLv1=7471087,GaiLv2=7692921,NumMax=5,NumMin=4},
				{GoodsID=75,GaiLv1=7692922,GaiLv2=7826022,NumMax=2,NumMin=1},
				{GoodsID=80195,GaiLv1=7826023,GaiLv2=8269692,NumMax=30,NumMin=20},
				{GoodsID=38068,GaiLv1=8269693,GaiLv2=8535894,NumMax=1,NumMin=1},
				{GoodsID=38075,GaiLv1=8535895,GaiLv2=8802096,NumMax=1,NumMin=1},
				{GoodsID=38076,GaiLv1=8802097,GaiLv2=9068298,NumMax=1,NumMin=1},
				{GoodsID=38077,GaiLv1=9068299,GaiLv2=9334500,NumMax=1,NumMin=1},
				{GoodsID=80065,GaiLv1=9334501,GaiLv2=9778170,NumMax=30,NumMin=20},
				{GoodsID=80049,GaiLv1=9778171,GaiLv2=10000000,NumMax=30,NumMin=20},
			},
		[4] = {
				{GoodsID=80832,GaiLv1=1,GaiLv2=1029103,NumMax=15,NumMin=5},
				{GoodsID=80833,GaiLv1=1029104,GaiLv2=2058207,NumMax=10,NumMin=5},
				{GoodsID=82004,GaiLv1=2058208,GaiLv2=2924821,NumMax=10,NumMin=5},
				{GoodsID=80274,GaiLv1=2924822,GaiLv2=3791435,NumMax=5,NumMin=4},
				{GoodsID=845,GaiLv1=3791436,GaiLv2=4658049,NumMax=3,NumMin=1},
				{GoodsID=80383,GaiLv1=4658050,GaiLv2=5524663,NumMax=2,NumMin=1},
				{GoodsID=80381,GaiLv1=5524664,GaiLv2=6391277,NumMax=2,NumMin=1},
				{GoodsID=89041,GaiLv1=6391278,GaiLv2=6597098,NumMax=1,NumMin=1},
				{GoodsID=89044,GaiLv1=6597099,GaiLv2=6802919,NumMax=1,NumMin=1},
				{GoodsID=9503,GaiLv1=6802920,GaiLv2=6905830,NumMax=1,NumMin=1},
				{GoodsID=9504,GaiLv1=6905831,GaiLv2=7008741,NumMax=1,NumMin=1},
				{GoodsID=501,GaiLv1=7008742,GaiLv2=7283169,NumMax=5,NumMin=4},
				{GoodsID=75,GaiLv1=7283170,GaiLv2=7447826,NumMax=2,NumMin=1},
				{GoodsID=80195,GaiLv1=7447827,GaiLv2=7996682,NumMax=30,NumMin=20},
				{GoodsID=38068,GaiLv1=7996683,GaiLv2=8325996,NumMax=1,NumMin=1},
				{GoodsID=38075,GaiLv1=8325997,GaiLv2=8655310,NumMax=1,NumMin=1},
				{GoodsID=38076,GaiLv1=8655311,GaiLv2=8984624,NumMax=1,NumMin=1},
				{GoodsID=38077,GaiLv1=8984625,GaiLv2=9313938,NumMax=1,NumMin=1},
				{GoodsID=80065,GaiLv1=9313939,GaiLv2=9771318,NumMax=30,NumMin=20},
				{GoodsID=80049,GaiLv1=9771319,GaiLv2=10000000,NumMax=30,NumMin=20},
			},
		[5] = {
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
				{GoodsID=9504,GaiLv1=6511077,GaiLv2=6630912,NumMax=1,NumMin=1},
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
		},
[2] = {
		[1] = {
				{GoodsID=80832,GaiLv1=1,GaiLv2=1521812,NumMax=25,NumMin=15},
				{GoodsID=80833,GaiLv1=1521813,GaiLv2=3043625,NumMax=15,NumMin=5},
				{GoodsID=82004,GaiLv1=3043626,GaiLv2=4058167,NumMax=15,NumMin=5},
				{GoodsID=80274,GaiLv1=4058168,GaiLv2=5072709,NumMax=5,NumMin=4},
				{GoodsID=845,GaiLv1=5072710,GaiLv2=6087251,NumMax=3,NumMin=1},
				{GoodsID=80384,GaiLv1=6087252,GaiLv2=7101793,NumMax=2,NumMin=1},
				{GoodsID=80382,GaiLv1=7101794,GaiLv2=8116335,NumMax=2,NumMin=1},
				{GoodsID=89041,GaiLv1=8116336,GaiLv2=8192426,NumMax=1,NumMin=1},
				{GoodsID=89044,GaiLv1=8192427,GaiLv2=8268517,NumMax=1,NumMin=1},
				{GoodsID=9503,GaiLv1=8268518,GaiLv2=8302336,NumMax=1,NumMin=1},
				{GoodsID=9504,GaiLv1=8302337,GaiLv2=8336155,NumMax=1,NumMin=1},
				{GoodsID=501,GaiLv1=8336156,GaiLv2=8437610,NumMax=5,NumMin=4},
				{GoodsID=75,GaiLv1=8437611,GaiLv2=8498483,NumMax=2,NumMin=1},
				{GoodsID=80196,GaiLv1=8498484,GaiLv2=8904300,NumMax=30,NumMin=20},
				{GoodsID=38068,GaiLv1=8904301,GaiLv2=9026046,NumMax=1,NumMin=1},
				{GoodsID=38075,GaiLv1=9026047,GaiLv2=9147792,NumMax=1,NumMin=1},
				{GoodsID=38076,GaiLv1=9147793,GaiLv2=9269538,NumMax=1,NumMin=1},
				{GoodsID=38077,GaiLv1=9269539,GaiLv2=9391284,NumMax=1,NumMin=1},
				{GoodsID=80066,GaiLv1=9391285,GaiLv2=9797101,NumMax=30,NumMin=20},
				{GoodsID=80050,GaiLv1=9797102,GaiLv2=10000000,NumMax=30,NumMin=20},
			},
		[2] = {
				{GoodsID=80832,GaiLv1=1,GaiLv2=1261401,NumMax=25,NumMin=15},
				{GoodsID=80833,GaiLv1=1261402,GaiLv2=2522803,NumMax=15,NumMin=5},
				{GoodsID=82004,GaiLv1=2522804,GaiLv2=3531924,NumMax=15,NumMin=5},
				{GoodsID=80274,GaiLv1=3531925,GaiLv2=4541045,NumMax=5,NumMin=4},
				{GoodsID=845,GaiLv1=4541046,GaiLv2=5550166,NumMax=3,NumMin=1},
				{GoodsID=80384,GaiLv1=5550167,GaiLv2=6559287,NumMax=2,NumMin=1},
				{GoodsID=80382,GaiLv1=6559288,GaiLv2=7568408,NumMax=2,NumMin=1},
				{GoodsID=89041,GaiLv1=7568409,GaiLv2=7694549,NumMax=1,NumMin=1},
				{GoodsID=89044,GaiLv1=7694550,GaiLv2=7820690,NumMax=1,NumMin=1},
				{GoodsID=9503,GaiLv1=7820691,GaiLv2=7883761,NumMax=1,NumMin=1},
				{GoodsID=9504,GaiLv1=7883762,GaiLv2=7946832,NumMax=1,NumMin=1},
				{GoodsID=501,GaiLv1=7946833,GaiLv2=8115019,NumMax=5,NumMin=4},
				{GoodsID=75,GaiLv1=8115020,GaiLv2=8215932,NumMax=2,NumMin=1},
				{GoodsID=80196,GaiLv1=8215933,GaiLv2=8552306,NumMax=30,NumMin=20},
				{GoodsID=38068,GaiLv1=8552307,GaiLv2=8754131,NumMax=1,NumMin=1},
				{GoodsID=38075,GaiLv1=8754132,GaiLv2=8955956,NumMax=1,NumMin=1},
				{GoodsID=38076,GaiLv1=8955957,GaiLv2=9157781,NumMax=1,NumMin=1},
				{GoodsID=38077,GaiLv1=9157782,GaiLv2=9359606,NumMax=1,NumMin=1},
				{GoodsID=80066,GaiLv1=9359607,GaiLv2=9747730,NumMax=30,NumMin=20},
				{GoodsID=80050,GaiLv1=9747731,GaiLv2=10000000,NumMax=30,NumMin=20},
			},
		[3] = {
				{GoodsID=80832,GaiLv1=1,GaiLv2=1109174,NumMax=25,NumMin=15},
				{GoodsID=80833,GaiLv1=1109175,GaiLv2=2218349,NumMax=15,NumMin=5},
				{GoodsID=82004,GaiLv1=2218350,GaiLv2=3169070,NumMax=15,NumMin=5},
				{GoodsID=80274,GaiLv1=3169071,GaiLv2=4119791,NumMax=5,NumMin=4},
				{GoodsID=845,GaiLv1=4119792,GaiLv2=5070512,NumMax=3,NumMin=1},
				{GoodsID=80384,GaiLv1=5070513,GaiLv2=6021233,NumMax=2,NumMin=1},
				{GoodsID=80382,GaiLv1=6021234,GaiLv2=6971954,NumMax=2,NumMin=1},
				{GoodsID=89041,GaiLv1=6971955,GaiLv2=7138331,NumMax=1,NumMin=1},
				{GoodsID=89044,GaiLv1=7138332,GaiLv2=7304708,NumMax=1,NumMin=1},
				{GoodsID=9503,GaiLv1=7304709,GaiLv2=7387897,NumMax=1,NumMin=1},
				{GoodsID=9504,GaiLv1=7387898,GaiLv2=7471086,NumMax=1,NumMin=1},
				{GoodsID=501,GaiLv1=7471087,GaiLv2=7692921,NumMax=5,NumMin=4},
				{GoodsID=75,GaiLv1=7692922,GaiLv2=7826022,NumMax=2,NumMin=1},
				{GoodsID=80196,GaiLv1=7826023,GaiLv2=8269692,NumMax=30,NumMin=20},
				{GoodsID=38068,GaiLv1=8269693,GaiLv2=8535894,NumMax=1,NumMin=1},
				{GoodsID=38075,GaiLv1=8535895,GaiLv2=8802096,NumMax=1,NumMin=1},
				{GoodsID=38076,GaiLv1=8802097,GaiLv2=9068298,NumMax=1,NumMin=1},
				{GoodsID=38077,GaiLv1=9068299,GaiLv2=9334500,NumMax=1,NumMin=1},
				{GoodsID=80066,GaiLv1=9334501,GaiLv2=9778170,NumMax=30,NumMin=20},
				{GoodsID=80050,GaiLv1=9778171,GaiLv2=10000000,NumMax=30,NumMin=20},
			},
		[4] = {
				{GoodsID=80832,GaiLv1=1,GaiLv2=1029103,NumMax=25,NumMin=15},
				{GoodsID=80833,GaiLv1=1029104,GaiLv2=2058207,NumMax=15,NumMin=5},
				{GoodsID=82004,GaiLv1=2058208,GaiLv2=2924821,NumMax=15,NumMin=5},
				{GoodsID=80274,GaiLv1=2924822,GaiLv2=3791435,NumMax=5,NumMin=4},
				{GoodsID=845,GaiLv1=3791436,GaiLv2=4658049,NumMax=3,NumMin=1},
				{GoodsID=80384,GaiLv1=4658050,GaiLv2=5524663,NumMax=2,NumMin=1},
				{GoodsID=80382,GaiLv1=5524664,GaiLv2=6391277,NumMax=2,NumMin=1},
				{GoodsID=89041,GaiLv1=6391278,GaiLv2=6597098,NumMax=1,NumMin=1},
				{GoodsID=89044,GaiLv1=6597099,GaiLv2=6802919,NumMax=1,NumMin=1},
				{GoodsID=9503,GaiLv1=6802920,GaiLv2=6905830,NumMax=1,NumMin=1},
				{GoodsID=9504,GaiLv1=6905831,GaiLv2=7008741,NumMax=1,NumMin=1},
				{GoodsID=501,GaiLv1=7008742,GaiLv2=7283169,NumMax=5,NumMin=4},
				{GoodsID=75,GaiLv1=7283170,GaiLv2=7447826,NumMax=2,NumMin=1},
				{GoodsID=80196,GaiLv1=7447827,GaiLv2=7996682,NumMax=30,NumMin=20},
				{GoodsID=38068,GaiLv1=7996683,GaiLv2=8325996,NumMax=1,NumMin=1},
				{GoodsID=38075,GaiLv1=8325997,GaiLv2=8655310,NumMax=1,NumMin=1},
				{GoodsID=38076,GaiLv1=8655311,GaiLv2=8984624,NumMax=1,NumMin=1},
				{GoodsID=38077,GaiLv1=8984625,GaiLv2=9313938,NumMax=1,NumMin=1},
				{GoodsID=80066,GaiLv1=9313939,GaiLv2=9771318,NumMax=30,NumMin=20},
				{GoodsID=80050,GaiLv1=9771319,GaiLv2=10000000,NumMax=30,NumMin=20},
			},
		[5] = {
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
				{GoodsID=9504,GaiLv1=6511077,GaiLv2=6630912,NumMax=1,NumMin=1},
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
		},
}

--领奖判断
function LC_ShuJiaHuoDong_juanzhoudianji_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local LoginTime = API_VarDataGetNumber(ActorID,1,LC_ShuJiaHuoDongLoginTime)
	local AddTime = API_VarDataGetNumber(ActorID,1,LC_ShuJiaHuoDongAddTime)
	local NowTime = os.time()
	local StartTimeTable = ShuJiaHuoDong_StartTime
	local EndTimeTable = ShuJiaHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	
	local Year,Month,Day,Hour,Minute,Second = PublicFun_time()
	local LiJiangTime = API_VarDataGetNumber(ActorID,1,LC_ShuJiaHuoDongChouJiangTime)
	local LiJiangDate = os.date("*t", LiJiangTime)
	local LC_LiJiangYear = LiJiangDate.year
	local LC_LiJiangMonth = LiJiangDate.month
	local LC_LiJiangDay = LiJiangDate.day

	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		local OnLoginTime = NowTime - LoginTime
		AddTime = AddTime + OnLoginTime
	end
	
	--计算跨天
	local Time1 = os.time()
	local Time1Date = os.date("*t",Time1)
	Time1Date.hour = 23
	Time1Date.min = 59
	Time1Date.sec = 59
	local Time1 = os.time(Time1Date) + 1
	LiJiangDate.hour = 23
	LiJiangDate.min = 59
	LiJiangDate.sec = 59
	local Time2 = os.time(LiJiangDate) + 1
	local KuaTianTime = Time1 - Time2
	local JianGe = math.floor(KuaTianTime/86400)

	if SelectItem == 100 then
		if AddTime >= 10800 then
			if Year ~= LC_LiJiangYear or Month ~= LC_LiJiangMonth or Day ~= LC_LiJiangDay then
				if JianGe == 1 then
					local Number1 = API_VarDataGetNumber(ActorID,1,LC_ShuJiaHuoDongLianXuNum)
					Number1 = Number1 + 1
					API_VarDataSetNumber(ActorID,1,LC_ShuJiaHuoDongLianXuNum,Number1)
				else
					API_VarDataSetNumber(ActorID,1,LC_ShuJiaHuoDongLianXuNum,1)
				end
				local Number1 = API_VarDataGetNumber(ActorID,1,LC_ShuJiaHuoDongLianXuNum)
				if Number1 >= 5 then
					Number1 = 5
				end
				API_VarDataSetNumber(ActorID,1,LC_ShuJiaHuoDongLingJiangNum,Number1)
				local JiangLiTime = os.time()
				API_VarDataSetNumber(ActorID,1,LC_ShuJiaHuoDongChouJiangTime,JiangLiTime)
			end
		else
			API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
			API_ResponseWrite('<text>   你未达到抽奖要求，即当日累计在线3小时，请达到要求再来进行抽奖。</text><br>')
			API_ResponseWrite('<br><a>我知道了</a>')
			return
		end
		
		local LingJiangNum = API_VarDataGetNumber(ActorID,1,LC_ShuJiaHuoDongLingJiangNum)
		local TodayNum = API_VarDataGetNumber(ActorID,1,LC_ShuJiaHuoDongTodayNum)
		if LingJiangNum < 1 then
			API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
			API_ResponseWrite('<text>   抱歉，您今日的抽奖机会已经用完，请明日继续参与。</text><br>')
			API_ResponseWrite('<br><a>离开</a>')				
		else
			if API_ActorGetPackageSize(ActorID) < 1 then
				API_ResponseWrite('<name>英雄岛暑期抽疯乐</name>')
				API_ResponseWrite('<text>您的背包空间不足，请至少保留一个空格，再抽取奖励。</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
				API_ResponseFlush(ActorID)
				return				
			end
			TodayNum = TodayNum + 1
			API_VarDataSetNumber(ActorID,1,LC_ShuJiaHuoDongTodayNum,TodayNum)
			if TodayNum ~= 1 and TodayNum ~= 2  and TodayNum ~= 3 and TodayNum ~= 4  and TodayNum ~= 5 then
				TodayNum = 1
			end
			local JiangLiQuYu = 1
			local PlayLv = API_GetActorExpLevel(ActorID)
			if PlayLv > 25 then
				JiangLiQuYu = 2
			end
			local JiangLiTable = LC_ShuJiaHuoDong_GoodSTabel[JiangLiQuYu][TodayNum]
			local JiangLiGaiLv = math.random(10000000)
			LingJiangNum = LingJiangNum - 1
			API_VarDataSetNumber(ActorID,1,LC_ShuJiaHuoDongLingJiangNum,LingJiangNum)
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
						local LingJiangNum = API_VarDataGetNumber(ActorID,1,LC_ShuJiaHuoDongLingJiangNum)
						API_ResponseWrite('<name>英雄岛暑期抽疯乐</name>')
						API_ResponseWrite('<text>恭喜你抽中了'..JiangLiGoodsNum..'个</text><img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'" ><text>，您还有'..LingJiangNum..'次抽奖机会。</text><br>')
						API_ResponseWrite('<br><a href="LC_ShuJiaHuoDong_juanzhoudianji">继续抽奖</a><br>')						
						API_ResponseFlush(ActorID)
						API_ActorSendMsg(ActorID,8,'获得'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')
					end
				end
			end
			local ActorID = API_RequestGetActorID() 
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[70][1][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[70][1][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[70][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[70][1][LaiYuan] + 1
			end
		end
	elseif SelectItem == 200 then
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>英雄岛暑期抽疯乐</name>')
		API_ResponseWrite('<text>	1、等级大于等于23级的玩家可参与活动。</text><br>')
		API_ResponseWrite('<text>	2、活动期间每天累计在线时长达到3小时可获得一次领奖机会。</text><br>')
		API_ResponseWrite('<text>	3、连续两天满足条件则第二天可获得2次抽奖机会，以此类推最高可获得5次抽奖机会，期间中断则从1次开始重新累计。</text><br>')
		API_ResponseWrite('<text>	4、抽奖次数需在每日24点之前使用，跨天抽奖次数清0。</text><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
	end
end

--跨天清除
function LC_ShuJiaHuoDongKuaTianQingChu(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	API_VarDataSetNumber(ActorID,1,LC_ShuJiaHuoDongAddTime,0)
	API_VarDataSetNumber(ActorID,1,LC_ShuJiaHuoDongTodayNum,0)
	API_VarDataSetNumber(ActorID,1,LC_ShuJiaHuoDongLingJiangNum,0)
	local LoginTime =os.time()
	API_VarDataSetNumber(ActorID,1,LC_ShuJiaHuoDongLoginTime,LoginTime)
end 