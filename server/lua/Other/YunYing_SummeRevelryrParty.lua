-------------------------------
--文件名:	Scp\Lua\Other\YunYing_SummeRevelryrParty.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	刘操
--日  期:	2010-6-18
--版  本:	
--描  述:	运营夏季狂欢派对活动
--应  用:  
-------------------------------


local SummeRevelryrParty_StartTime = {Year = 2010,Month = 7,Day = 8,Hour = 0,Minute = 0,Second = 0}
local SummeRevelryrParty_EndTime = {Year = 2010,Month = 9,Day = 7,Hour = 24,Minute = 0,Second = 0}

local GoodsID1 = 88951
local GoodsID2 = 88948


Summe_juanzhoutubiaoid = 104120
Summe_juanzhouid = 90001

--上线回调
function SummeAmbassador_OnLogin() 
	local ActorID = API_RequestGetActorID()
	local OnLoginType = API_VarDataGetNumber(ActorID,0,18368)
	local StartTimeTable = SummeRevelryrParty_StartTime
	local EndTimeTable = SummeRevelryrParty_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if OnLoginType ~= 2 then
		if nShiFouStart <= 0 and nShiFouEnd > 0 then
			API_RemoveTaskScroll(ActorID,Summe_juanzhouid)
			LRY_UItwinkemanage(ActorID,15,85,Summe_juanzhoutubiaoid,Summe_juanzhouid,20,'SummeAmbassador_juanzhoudianji')--加载图标
			local OnLogin_Time =os.time()
			API_VarDataSetNumber(ActorID,1,30197,OnLogin_Time)
		end
	end
	SummeAmbassador_QingChuShuJu(ActorID)
end

--下线回调
function SummeAmbassador_OnLogout()
	local ActorID = API_RequestGetActorID()
	local OnLogoutType = API_VarDataGetNumber(ActorID,0,18368)
	local OnLogin_Time = API_VarDataGetNumber(ActorID,1,30197)
	local OnLogout_Time = os.time()
--	local Online_LastTime = API_VarDataGetNumber(ActorID,1,30198)
	local Online = OnLogout_Time - OnLogin_Time
	if Online < 3600 and OnLogoutType ~= 2 then
		API_VarDataSetNumber(ActorID,1,30198,0)
	else
		API_VarDataSetNumber(ActorID,1,30198,Online)
	end
end

function SummeAmbassador_OnlineTime(ActorID)
	local OnLogin_Time = API_VarDataGetNumber(ActorID,1,30197)
	local NowTime = os.time()
	local Online =  NowTime - OnLogin_Time
	API_VarDataSetNumber(ActorID,1,30198,Online)
end

--卷轴点击函数
function SummeAmbassador_juanzhoudianji()
	local ActorID = API_RequestGetActorID()
	SummeAmbassador_QingChuShuJu(ActorID)
	if API_VarDataGetNumber(ActorID,1,30201) == 1 then
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>夏日狂欢大使</name>')
		API_ResponseWrite('<text>    亲爱的玩家您今天已经领取过夏日狂欢活动奖励了，请明天再来领取每日奖励。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return
	end
	API_ResponseWrite('<win rect="250,250,500,220"></win>')
	API_ResponseWrite('<name>夏日狂欢大使</name>')
	API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
	API_ResponseWrite('<text>    欢迎来到英雄岛！每天持续在线1小时后，你便可以领取一份珍贵好礼。一周内领取次数达到5次后，还将额外获得特殊礼物</text><img srcgd="88948" tipgd="88948"><text>。</text><br>')
	API_ResponseWrite('<br><a href="SummeAmbassador_juanzhoudianji_Title?1=100">我要领取奖励！！</a><br>')
	API_ResponseWrite('<br><a>关闭</a>')
	API_ResponseFlush(ActorID)
	return 1
end

function SummeAmbassador_juanzhoudianji_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	SummeAmbassador_OnlineTime(ActorID)
	local Online = API_VarDataGetNumber(ActorID,1,30198)
	local LingJiangNum = API_VarDataGetNumber(ActorID,1,30199)
	local Level = API_GetActorExpLevel(ActorID)
	local StartTimeTable = SummeRevelryrParty_StartTime
	local EndTimeTable = SummeRevelryrParty_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)

	if nShiFouStart > 0 then
		API_RemoveTaskScroll(ActorID,Summe_juanzhouid)
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<text>    亲爱的玩家夏日狂欢派对活动还未开始，请活动开始后再来领取奖励。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return	
	elseif nShiFouEnd <= 0 then
		API_RemoveTaskScroll(ActorID,Summe_juanzhouid)
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<text>    亲爱的玩家夏日狂欢派对活动已经结束，感谢您的参与。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return	
	end
	
	if API_VarDataGetNumber(ActorID,1,30201) == 1 then
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<text>    亲爱的玩家您今天已经领取过夏日狂欢活动奖励了，请明天再来领取每日奖励。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return
	end
	if Online >= 3600 and SelectItem == 100 then
		--每天奖励
		if API_ActorCanAddGoods(ActorID,GoodsID1,1,3,0) ~= -1 then
			API_AddActorGoodsFlag(ActorID,GoodsID1,1,3,'获得夏日狂欢奖励')
			API_ActorSendMsg(ActorID,8,'获得夏日狂欢奖励')
			LingJiangNum = LingJiangNum + 1
			API_VarDataSetNumber(ActorID,1,30199,LingJiangNum)--保存领奖数
			API_VarDataSetNumber(ActorID,1,30201,1)--设置奖励标志
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[53][3][LaiYuan]  == nil then
				GLOBAL_FengXiangBiao_DateList[53][3][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[53][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[53][3][LaiYuan] + 1
			end
		else
			local GoodsName = API_GetGoodsName(GoodsID1)
			API_SendActorMail(ActorID,GoodsID1,1,'[夏日狂欢奖励]','获得'..GoodsName..'一个')
			API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'一个（请到邮箱领取）')
			LingJiangNum = LingJiangNum + 1
			API_VarDataSetNumber(ActorID,1,30199,LingJiangNum)
			API_VarDataSetNumber(ActorID,1,30201,1)
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[53][3][LaiYuan]  == nil then
				GLOBAL_FengXiangBiao_DateList[53][3][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[53][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[53][3][LaiYuan] + 1
			end
		end
		--每周奖励
		if LingJiangNum == 5 then
			if API_VarDataGetNumber(ActorID,1,30203) ~= 1 then
				if API_ActorCanAddGoods(ActorID,GoodsID2,1,3,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,GoodsID2,1,3,'获得夏日狂欢大礼包')
					API_ActorSendMsg(ActorID,8,'获得夏日狂欢大礼包')
					API_VarDataSetNumber(ActorID,1,30203,1)--设置奖励标志
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[53][4][LaiYuan]  == nil then
						GLOBAL_FengXiangBiao_DateList[53][4][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[53][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[53][4][LaiYuan] + 1
					end
				else
					local GoodsName = API_GetGoodsName(GoodsID2)
					API_SendActorMail(ActorID,GoodsID2,1,'[夏日狂欢奖励]','获得'..GoodsName..'一个')
					API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'一个（请到邮箱领取）')
					API_VarDataSetNumber(ActorID,1,30203,1)
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[53][4][LaiYuan]  == nil then
						GLOBAL_FengXiangBiao_DateList[53][4][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[53][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[53][4][LaiYuan] + 1
					end
				end
			end				
		end
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>夏日狂欢大使</name>')
		API_ResponseWrite('<text>恭喜你获得</text><img srcgd="88951" tipgd="88951"><text>，请明天再来领。一周内领取次数达到5次后，还将额外获得特殊礼物</text><img srcgd="88948" tipgd="88948"><text>。</text><br>')
		API_ResponseWrite('<text>本周已领取:</text><text color="255,0,255">'.. LingJiangNum ..'次</text><br>')
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
function SummeAmbassador_QingChuShuJu(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local NowTime = os.time()
	--每日清除
	if NowTime > API_VarDataGetNumber(ActorID,1,30200) then
		local NowTime = os.date("*t", os.time())
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 23
		NowTime.min = 59
		NowTime.sec = 59
		local NightTime = os.time(NowTime)
		local NextTime = NightTime + 1
		API_VarDataSetNumber(ActorID,1,30198,0)--每天在线时间
		API_VarDataSetNumber(ActorID,1,30201,0)--每天领奖标志
		API_VarDataSetNumber(ActorID,1,30200,NextTime)--下次每日清除时间
	end
	
	--每周清除
	if NowTime > API_VarDataGetNumber(ActorID,1,30202) then
	   local DayTime = (7 - Week) * 86400
	   local NowTime = os.date("*t", os.time()) 
	   NowTime.year = Year
	   NowTime.month = Month
	   NowTime.day = Day
	   NowTime.hour = 23 
	   NowTime.min = 59 
	   NowTime.sec = 59 
	   local NightTime = os.time(NowTime) 
	   local NextTime = NightTime + DayTime + 1
	   API_VarDataSetNumber(ActorID,1,30199,0)--每周领奖次数
	   API_VarDataSetNumber(ActorID,1,30203,0)--每周领奖标志
	   API_VarDataSetNumber(ActorID,1,30202,NextTime)--下次每周清除时间
	end
end