-------------------------------
--文件名:	Scp\Lua\Other\ShangXianLingJingYan.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	谭明礼
--日  期:	2010-9-28
--版  本:	
--描  述:	上线送经验活动（国庆）
--应  用:  
-------------------------------

local ShangXianLingJingYan_StartTime = {Year = 2010,Month = 10,Day = 1,Hour = 0,Minute = 0,Second = 0}
local ShangXianLingJingYan_EndTime = {Year = 2010,Month = 10,Day = 30,Hour = 24,Minute = 0,Second = 0}

ShangXianLingJingYan_juanzhoutubiaoid = 104120
ShangXianLingJingYan_juanzhouid = 60008

--上线回调
function ShangXianLingJingYan_OnLogin() 
	local ActorID = API_RequestGetActorID()
	local OnLoginType = API_VarDataGetNumber(ActorID,0,18368)
	local StartTimeTable = ShangXianLingJingYan_StartTime
	local EndTimeTable = ShangXianLingJingYan_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if OnLoginType ~= 2 then
		if nShiFouStart <= 0 and nShiFouEnd > 0 then
			API_RemoveTaskScroll(ActorID,ShangXianLingJingYan_juanzhouid)
			LRY_UItwinkemanage(ActorID,15,85,ShangXianLingJingYan_juanzhoutubiaoid,ShangXianLingJingYan_juanzhouid,20,'ShangXianLingJingYan_juanzhoudianji')--加载图标
			local OnLogin_Time =os.time()
			API_VarDataSetNumber(ActorID,1,11862,OnLogin_Time)
		end
	end
	ShangXianLingJingYan_QingChuShuJu(ActorID)
end

--下线回调
function ShangXianLingJingYan_OnLogout()
	local ActorID = API_RequestGetActorID()
	local OnLogoutType = API_VarDataGetNumber(ActorID,0,18368)
	local OnLogin_Time = API_VarDataGetNumber(ActorID,1,11862)
	local OnLogout_Time = os.time()
	local Online = OnLogout_Time - OnLogin_Time
	if Online < 3600 and OnLogoutType ~= 2 then
		API_VarDataSetNumber(ActorID,1,11863,0)
	else
		API_VarDataSetNumber(ActorID,1,11863,Online)
	end
end

function ShangXianLingJingYan_OnlineTime(ActorID)
	local OnLogin_Time = API_VarDataGetNumber(ActorID,1,11862)
	local NowTime = os.time()
	local Online =  NowTime - OnLogin_Time
	API_VarDataSetNumber(ActorID,1,11863,Online)
end

--卷轴点击函数
function ShangXianLingJingYan_juanzhoudianji()
	local ActorID = API_RequestGetActorID()
	ShangXianLingJingYan_QingChuShuJu(ActorID)
	if API_VarDataGetNumber(ActorID,1,11864) == 1 then
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>国庆普天同庆</name>')
		API_ResponseWrite('<text>    亲爱的玩家，您今天已经领取过国庆普天同庆奖励了，请明天再来领取。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return
	end
	API_ResponseWrite('<win rect="250,250,500,220"></win>')
	API_ResponseWrite('<name>国庆普天同庆</name>')
	API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
	API_ResponseWrite('<text>    欢迎来到英雄岛！十月份每天持续在线1小时后，你便可以领取到目前等级升级所需经验的百分之十，领取后的经验是直接加到角色经验条上的哦，请确保经验条没满后再来领取奖励。</text><br>')
	API_ResponseWrite('<br><a href="ShangXianLingJingYan_juanzhoudianji_Title?1=100">我要领取奖励！！</a><br>')
	API_ResponseWrite('<br><a>关闭</a>')
	API_ResponseFlush(ActorID)
	return 1
end

function ShangXianLingJingYan_juanzhoudianji_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	ShangXianLingJingYan_OnlineTime(ActorID)
	local Online = API_VarDataGetNumber(ActorID,1,11863)
	local NeedJingYan = API_GetActorNextExp(ActorID)
	local SendJingYan = math.floor(NeedJingYan*0.1)
	local StartTimeTable = ShangXianLingJingYan_StartTime
	local EndTimeTable = ShangXianLingJingYan_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)

	if nShiFouStart > 0 then
		API_RemoveTaskScroll(ActorID,ShangXianLingJingYan_juanzhouid)
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<text>    亲爱的玩家，国庆普天同庆还未开始，请活动开始后再来领取奖励。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return	
	elseif nShiFouEnd <= 0 then
		API_RemoveTaskScroll(ActorID,ShangXianLingJingYan_juanzhouid)
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<text>    亲爱的玩家，国庆普天同庆已经结束，感谢您的参与。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return	
	end
	
	if API_VarDataGetNumber(ActorID,1,11864) == 1 then
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<text>    亲爱的玩家，您今天已经领取过奖励了，请明天再来领取。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return
	end
	if Online >= 3600 and SelectItem == 100 then
		--每天奖励
		API_ActorAddExp(ActorID,SendJingYan,0,'国庆在线领经验')
		API_ActorSendMsg(ActorID,8,'获得普天同庆奖励')
		API_VarDataSetNumber(ActorID,1,11864,1)--设置奖励标志
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>国庆普天同庆</name>')
		API_ResponseWrite('<text>恭喜你获得</text><text color="255,0,255">'..SendJingYan..'经验</text><text>，请明天再来领取。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(ActorID)
	else
		local Time = math.floor(Online/60)
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<text>    亲爱的玩家你未达到领奖要求（即：持续在线1小时或以上），请达到要求再来领取每日奖励。</text><br>')
		API_ResponseWrite('<text>您今天已持续在线:</text><text color="255,0,255">'.. Time ..'分钟</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
	end
end

--跨天清除数据
function ShangXianLingJingYan_QingChuShuJu(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local NowTime = os.time()
	--每日清除
	if NowTime > API_VarDataGetNumber(ActorID,1,11865) then
		local NowTime = os.date("*t", os.time())
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 23
		NowTime.min = 59
		NowTime.sec = 59
		local NightTime = os.time(NowTime)
		local NextTime = NightTime + 1
		API_VarDataSetNumber(ActorID,1,11863,0)--每天在线时间
		API_VarDataSetNumber(ActorID,1,11864,0)--每天领奖标志
		API_VarDataSetNumber(ActorID,1,11865,NextTime)--下次每日清除时间
	end
end

function ShangXianLingJingYan_QingChuShuJu2(ActorID)
	local NowTime = os.time()
	API_VarDataSetNumber(ActorID,1,11862,NowTime)
end
