-------------------------------
--文件名:	Scp\Lua\Act\LC_WuYiQianDao2012.lua
--版  权:	深圳腾讯计算机系统有限公司
--创建人:	刘操
--日  期:	2012-4-23
--版  本:	
--描  述:	劳动节活动
--应  用:  
-------------------------------


GLOBAL_WuYiQianDao_StartTime = {Year = 2012,Month = 3,Day = 29,Hour = 0,Minute = 0,Second = 0}
GLOBAL_WuYiQianDao_EndTime = {Year = 2018,Month = 5,Day = 7,Hour = 0,Minute = 0,Second = 0}

--上线时间
local LC_WuYiQianDaoLoginTime = 30261

--在线时长
local LC_WuYiQianDaoAddTime = 30262

--抽奖次数
local LC_WuYiQianDaoChouJiangNum = 30291

local WuYiQianDao_juanzhouid = 90013--卷轴ID
local WuYiQianDao_tubiaoid = 104120--卷轴图标ID

--上线判断
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'LC_WuYiQianDao_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'LC_WuYiQianDao_OnLogin') 
end

--下线判断
local OnLogoutLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLogoutFuncNameList) do 
	if GLOBAL_ActMain_OnLogoutFuncNameList[i] == 'LC_WuYiQianDao_OnLogout' then
		OnLogoutLoadOK = 1
		break
	end 
end 
if OnLogoutLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLogoutFuncNameList,'LC_WuYiQianDao_OnLogout') 
end

--上线回调
function LC_WuYiQianDao_OnLogin() 
	local ActorID = API_RequestGetActorID()
	local OnLoginType = API_VarDataGetNumber(ActorID,0,18368)
	local StartTimeTable = GLOBAL_WuYiQianDao_StartTime
	local EndTimeTable = GLOBAL_WuYiQianDao_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if OnLoginType ~= 2 then
		if nShiFouStart <= 0 and nShiFouEnd > 0 then
			API_RemoveTaskScroll(ActorID,WuYiQianDao_juanzhouid)
			LRY_UItwinkemanage(ActorID,2,85,WuYiQianDao_tubiaoid,WuYiQianDao_juanzhouid,20,'LC_WuYiQianDao_juanzhoudianji')--加载图标
			local LoginTime =os.time()
			API_VarDataSetNumber(ActorID,1,LC_WuYiQianDaoLoginTime,LoginTime)
		else
			API_RemoveTaskScroll(ActorID,WuYiQianDao_juanzhouid)
		end
	end
end

--下线回调
function LC_WuYiQianDao_OnLogout()
	local ActorID = API_RequestGetActorID()
	local NowTime = os.time()
	local LoginTime = API_VarDataGetNumber(ActorID,1,LC_WuYiQianDaoLoginTime)
	local StartTimeTable = GLOBAL_WuYiQianDao_StartTime
	local EndTimeTable = GLOBAL_WuYiQianDao_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)

	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		local OnLoginTime1 = NowTime - LoginTime
		local OnLoginTime2 = API_VarDataGetNumber(ActorID,1,LC_WuYiQianDaoAddTime)
		local OnLoginTime = OnLoginTime1 + OnLoginTime2
		API_VarDataSetNumber(ActorID,1,LC_WuYiQianDaoAddTime,OnLoginTime)
	end
end

--卷轴点击
function LC_WuYiQianDao_juanzhoudianji()
	local ActorID = ActorID or API_RequestGetActorID()
	local Year,Month,Day,Hour,Minute,Second = PublicFun_time()
	local ChouJiangNum = API_VarDataGetNumber(ActorID,1,LC_WuYiQianDaoChouJiangNum)
	API_ResponseWrite('<win rect="250,250,500,220"></win>')
	API_ResponseWrite('<name>在线送礼</name>')
	API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
	API_ResponseWrite('<text>    欢迎来到狗熊岛！每日在线10分钟，你便可以参与一次在线领经验活动，每天最多可参与10次领取机会。</text><br>')
	if ChouJiangNum < 10 then	
		API_ResponseWrite('<br><a href="LC_WuYiQianDao_juanzhoudianji_Title?1=100">领取！！('..ChouJiangNum..'/10)</a><br>')
	else
		API_ResponseWrite('<br><text>今日领取机会已用完</text><br>')
	end
	API_ResponseWrite('<br><a>关闭</a>')
	API_ResponseFlush(ActorID)
	return 1
end

local WuYiQianDaoChouJiangTable = {
[1] = {
			{GoodsID=82004,GaiLv1=1,GaiLv2=10000000,NumMax=100,NumMin=100},
},
}

local WuYiQianDaoTeShuGoods = {82004}

--卷轴点击判断
function LC_WuYiQianDao_juanzhoudianji_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	local Year,Month,Day,Hour,Minute,Second = PublicFun_time()

	local LoginTime = API_VarDataGetNumber(ActorID,1,LC_WuYiQianDaoLoginTime)

	local StartTimeTable = GLOBAL_WuYiQianDao_StartTime
	local EndTimeTable = GLOBAL_WuYiQianDao_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local OnLoginTime = 0
	local NowTime =os.time()
	
	if nShiFouStart > 0 then
		API_RemoveTaskScroll(ActorID,WuYiQianDao_juanzhouid)
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>在线送礼</name>')
		API_ResponseWrite('<text>    亲爱的玩家，五一在线抽奖活动还未开始，请活动开始后再来参与。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return	
	elseif nShiFouEnd <= 0 then
		API_RemoveTaskScroll(ActorID,WuYiQianDao_juanzhouid)
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>在线送礼</name>')
		API_ResponseWrite('<text>    亲爱的玩家，五一在线抽奖活动已经结束，感谢您的参与。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return	
	end
	
	if nShiFouStart <= 0 and nShiFouEnd > 0 then	
		local OnLoginTime1 = NowTime - LoginTime
		local OnLoginTime2 = API_VarDataGetNumber(ActorID,1,LC_WuYiQianDaoAddTime)
		OnLoginTime = OnLoginTime1 + OnLoginTime2

	end
	local Min = math.floor(OnLoginTime/60)
	local LingJiangTime = 10 - Min
	
	if SelectItem == 100 then
		if OnLoginTime < 600 then
				API_ResponseWrite('<win rect="250,250,500,220"></win>')
				API_ResponseWrite('<name>在线送礼</name>')
				API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
				API_ResponseWrite('<text>    距离上次领取时间不足10分钟，请'..LingJiangTime..'分钟后再来领取。</text><br>')
				API_ResponseWrite('<br><a>关闭</a>')
				API_ResponseFlush(ActorID)			
		else	
			if API_ActorGetPackageSize(ActorID) < 1 then
				API_ResponseWrite('<name>在线送礼</name>')
				API_ResponseWrite('<text>您的背包空间不足，请至少保留一个空格，再领取奖励。</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
				API_ResponseFlush(ActorID)
				return				
			end
			local NowTime = os.time()
			local ChouJiangNum = API_VarDataGetNumber(ActorID,1,LC_WuYiQianDaoChouJiangNum)
			local CJ_ZongNum = API_VarDataGetNumber_Ex(1,0,-6019,1,1)
			if CJ_ZongNum > 0 and math.mod(CJ_ZongNum,300) == 0 and NowTime > API_VarDataGetNumber_Ex(1,0,-6019,1,3) and API_VarDataGetNumber_Ex(1,0,-6019,1,4) < 20 then
				local JiangLiGoodsID = WuYiQianDaoTeShuGoods[math.random(1,table.getn(WuYiQianDaoTeShuGoods))]
				if API_ActorCanAddGoods(ActorID,JiangLiGoodsID,1,0,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,JiangLiGoodsID,1,0,'')
					API_ResponseWrite('<name>在线送礼</name>')
					API_ResponseWrite('<text>恭喜你领取了</text><img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'" ><text>，谢谢您的参与。</text><br>')
					API_ResponseWrite('<br><a>确定</a>')					
					API_ResponseFlush(ActorID)
					ChouJiangNum = ChouJiangNum + 1
					API_VarDataSetNumber(ActorID,1,LC_WuYiQianDaoChouJiangNum,ChouJiangNum)
					local CJ_ZongNum = API_VarDataGetNumber_Ex(1,0,-6019,1,1)
					CJ_ZongNum = CJ_ZongNum + 1
					API_VarDataSetNumber_Ex_Sync(1,0,-6019,1,1,CJ_ZongNum)
					API_VarDataSetNumber(ActorID,1,LC_WuYiQianDaoAddTime,0)
					local LoginTime =os.time()
					API_VarDataSetNumber(ActorID,1,LC_WuYiQianDaoLoginTime,LoginTime)
					API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在在线送礼中获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
					local Time = os.time()
					local Tsec = math.random(300,900)
					local NextTime = Time + Tsec
					API_VarDataSetNumber_Ex_Sync(1,0,-6019,1,3,NextTime)
					local MaxNum = API_VarDataGetNumber_Ex(1,0,-6019,1,4)
					MaxNum = MaxNum + 1
					API_VarDataSetNumber_Ex_Sync(1,0,-6019,1,4,MaxNum)
				end
			else
				local Tepy = 1
				if ExpLevel <= 65 then
					Tepy = 1
				else
					Tepy = 2
				end
				local JiangLiTable = WuYiQianDaoChouJiangTable[Tepy]
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
							API_ResponseWrite('<name>在线送礼</name>')
							API_ResponseWrite('<text>恭喜你领取了'..JiangLiGoodsNum..'个</text><img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'" ><text>，谢谢您的参与。</text><br>')
							API_ResponseWrite('<br><a>确定</a>')					
							API_ResponseFlush(ActorID)
							ChouJiangNum = ChouJiangNum + 1
							API_VarDataSetNumber(ActorID,1,LC_WuYiQianDaoChouJiangNum,ChouJiangNum)
							local CJ_ZongNum = API_VarDataGetNumber_Ex(1,0,-6019,1,1)
							CJ_ZongNum = CJ_ZongNum + 1
							API_VarDataSetNumber_Ex_Sync(1,0,-6019,1,1,CJ_ZongNum)
							API_VarDataSetNumber(ActorID,1,LC_WuYiQianDaoAddTime,0)
							local LoginTime = os.time()
							API_VarDataSetNumber(ActorID,1,LC_WuYiQianDaoLoginTime,LoginTime)
						end
					end
				end
			end
		end
	end
end

--跨天清除
function WuYiQianDao_KuaTianHuiDiao(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	local LoginTime =os.time()
	API_VarDataSetNumber(ActorID,1,LC_WuYiQianDaoAddTime,0)	
	API_VarDataSetNumber(ActorID,1,LC_WuYiQianDaoChouJiangNum,0)
	API_VarDataSetNumber(ActorID,1,LC_WuYiQianDaoLoginTime,LoginTime)
end

if API_GetServerID() == 1 then
	local StartTimeTable = GLOBAL_WuYiQianDao_StartTime
	local EndTimeTable = GLOBAL_WuYiQianDao_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)

	if LC_WuYiQianDao_LoadingTimeTriggerGID ~= nil then
		API_DestroyTriggerG(LC_WuYiQianDao_LoadingTimeTriggerGID)
	end
	if nShiFouEnd > 0 then
		LC_WuYiQianDao_LoadingTimeTriggerGID = API_CreateTimerTriggerG(0,0,1,-1,'LC_WuYiQianDao_ShujuQingChu')
	end
end

function LC_WuYiQianDao_ShujuQingChu(Param1,Param2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.time()
	local StartTimeTable = GLOBAL_WuYiQianDao_StartTime
	local EndTimeTable = GLOBAL_WuYiQianDao_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)

	--设置每日奖励上限数量
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6019,1,2) and API_GetServerID() == 1 then
		local NowTime = os.date("*t", os.time()) 
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 23 
		NowTime.min = 59 
		NowTime.sec = 59 
		local NightTime = os.time(NowTime)
		local NextQingChuTime = NightTime + 1
		API_VarDataSetNumber_Ex_Sync(1,0,-6019,1,2,NextQingChuTime)
		API_VarDataSetNumber_Ex_Sync(1,0,-6019,1,1,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6019,1,4,0)
	end

	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if Minute == 1 and Second == 1 then
			API_ActorBroadcastMsg(-1,1,'在线送礼活动正在进行中，活动期间每日在线满10分钟点击右下角卷轴即可领取。')
			API_ActorBroadcastMsg(-1,17,'在线送礼活动正在进行中，活动期间每日在线满10分钟点击右下角卷轴即可领取。')
		end
	end
end
