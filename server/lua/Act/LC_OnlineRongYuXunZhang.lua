-------------------------------
--文件名:	Scp\Lua\Act\LC_OnlineRongYuXunZhang.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	刘操
--日  期:	2011-4-13
--版  本:	
--描  述:	在线送勋章欢乐大兑换
--应  用:  
-------------------------------


local RongYuXunZhang_StartTime = {Year = 2011,Month = 4,Day = 14,Hour = 0,Minute = 0,Second = 0}
local RongYuXunZhang_EndTime = {Year = 2011,Month = 6,Day = 1,Hour = 0,Minute = 0,Second = 0}

local StartHour = 19--荣誉勋章在线计时开始时间（0-24整数）
local EndHour = 22--荣誉勋章在线计时结束时间（0-24整数）

local RongYuXunZhangGoodID = 82030--荣誉勋章ID
local GaoJiXunZhangGoodID = 82031--高级荣誉勋章ID


local LC_LiJiangTime = 30238--领奖时间
local LC_OnLoginTime = 30239--上线时间
local LC_OnlineTime = 30240--在线时长
local LC_ContinueNum = 30241--连续领奖次数

local RongYuXunZhang_juanzhouid = 90005--卷轴ID
local RongYuXunZhangtubiaoid = 104121--卷轴图标ID


if API_GetServerID() == 1 or API_GetServerID() == 7 then
	if XunZhangHuoDong_LoadingTimeTriggerGID ~= nil then
		API_DestroyTriggerG(XunZhangHuoDong_LoadingTimeTriggerGID)
	end
	XunZhangHuoDong_LoadingTimeTriggerGID = API_CreateTimerTriggerG(0,0,10,1,'LC_XunZhangHuoDong_ServerOpen')
end

function LC_XunZhangHuoDong_ServerOpen(Param1,Param2)
	if API_GetServerID() == 1 or API_GetServerID() == 7 then
		local StartTimeTable = RongYuXunZhang_StartTime
		local EndTimeTable = RongYuXunZhang_EndTime
		local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
		local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
		if nShiFouStart > 0 then
			--活动未开始
			LC_ZhanBeiJunXuGuan_DestroyNPC()
			if LC_XunZhangHuoDong_StartDateTimeTriggerGID == nil then
				LC_XunZhangHuoDong_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'LC_ZhanBeiJunXuGuan_CreateNPC')
			else
				API_DestroyTriggerG(LC_XunZhangHuoDong_StartDateTimeTriggerGID)
				LC_XunZhangHuoDong_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'LC_ZhanBeiJunXuGuan_CreateNPC')
			end
			if LC_XunZhangHuoDong_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(LC_XunZhangHuoDong_EndDateTimeTriggerGID)
			end
		elseif nShiFouStart <= 0 then
			--活动开始
			LC_ZhanBeiJunXuGuan_CreateNPC()
			if LC_XunZhangHuoDong_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(LC_XunZhangHuoDong_StartDateTimeTriggerGID)
			end
--		elseif nShiFouEnd <= 0 then
--			--活动结束
--			LC_ZhanBeiJunXuGuan_DestroyNPC()
--			if LC_XunZhangHuoDong_StartDateTimeTriggerGID ~= nil then
--				API_DestroyTriggerG(LC_XunZhangHuoDong_StartDateTimeTriggerGID)
--			end
--			if LC_XunZhangHuoDong_EndDateTimeTriggerGID ~= nil then
--				API_DestroyTriggerG(LC_XunZhangHuoDong_EndDateTimeTriggerGID)
--			end
		end
	end
end

function LC_ZhanBeiJunXuGuan_CreateNPC()
	--创建帝国活动npc
	if API_GetServerID() == 1 then
		if ZhanBeiJunXuGuan_DGNPCFastID1 == nil then
			ZhanBeiJunXuGuan_DGNPCFastID1 = API_CreateMonsterEx(1,12361,262,207,4,0,-1,1)
		else
			if API_GetMonsterID(ZhanBeiJunXuGuan_DGNPCFastID1) > 0 then
				API_DestroyMonster(ZhanBeiJunXuGuan_DGNPCFastID1)
			end
			ZhanBeiJunXuGuan_DGNPCFastID1 = API_CreateMonsterEx(1,12361,262,207,4,0,-1,1)
		end
	end
	if API_GetServerID() == 1 then
		if ZhanBeiJunXuGuan_DGNPCFastID2 == nil then
			ZhanBeiJunXuGuan_DGNPCFastID2 = API_CreateMonsterEx(111,12361,244,516,3,0,-1,1)
		else
			if API_GetMonsterID(ZhanBeiJunXuGuan_DGNPCFastID2) > 0 then
				API_DestroyMonster(ZhanBeiJunXuGuan_DGNPCFastID2)
			end
			ZhanBeiJunXuGuan_DGNPCFastID2 = API_CreateMonsterEx(111,12361,244,516,3,0,-1,1)
		end
	end
	--创建联邦活动npc
	if API_GetServerID() == 1 then
		if ZhanBeiJunXuGuan_LBNPCFastID1 == nil then
			ZhanBeiJunXuGuan_LBNPCFastID1 = API_CreateMonsterEx(2,12361,239,179,4,0,-1,1)
		else
			if API_GetMonsterID(ZhanBeiJunXuGuan_LBNPCFastID1) > 0 then
				API_DestroyMonster(ZhanBeiJunXuGuan_LBNPCFastID1)
			end
			ZhanBeiJunXuGuan_LBNPCFastID1 = API_CreateMonsterEx(2,12361,239,179,4,0,-1,1)
		end
	end
	if API_GetServerID() == 1 then
		if ZhanBeiJunXuGuan_LBNPCFastID2 == nil then
			ZhanBeiJunXuGuan_LBNPCFastID2 = API_CreateMonsterEx(111,12361,331,183,3,0,-1,1)
		else
			if API_GetMonsterID(ZhanBeiJunXuGuan_LBNPCFastID2) > 0 then
				API_DestroyMonster(ZhanBeiJunXuGuan_LBNPCFastID2)
			end
			ZhanBeiJunXuGuan_LBNPCFastID2 = API_CreateMonsterEx(111,12361,331,183,3,0,-1,1)
		end
	end
	
--	local StartTimeTable = RongYuXunZhang_StartTime
--	local EndTimeTable = RongYuXunZhang_EndTime	
	
	--创结束触发器
--	if DuanWuJieHuoDong_EndDateTimeTriggerGID == nil then
--		LC_XunZhangHuoDong_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'LC_ZhanBeiJunXuGuan_DestroyNPC')
--	else
--		API_DestroyTriggerG(DuanWuJieHuoDong_EndDateTimeTriggerGID)
--		LC_XunZhangHuoDong_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'LC_ZhanBeiJunXuGuan_DestroyNPC')
--	end
end

function LC_ZhanBeiJunXuGuan_DestroyNPC()
	--删除帝国活动npc
	if ZhanBeiJunXuGuan_DGNPCFastID1 ~= nil then
		if API_GetMonsterID(ZhanBeiJunXuGuan_DGNPCFastID1) > 0 then
			API_DestroyMonster(ZhanBeiJunXuGuan_DGNPCFastID1)
		end
	end
	if ZhanBeiJunXuGuan_DGNPCFastID2 ~= nil then
		if API_GetMonsterID(ZhanBeiJunXuGuan_DGNPCFastID2) > 0 then
			API_DestroyMonster(ZhanBeiJunXuGuan_DGNPCFastID2)
		end
	end
	--删除联邦活动npc
	if ZhanBeiJunXuGuan_LBNPCFastID1 ~= nil then
		if API_GetMonsterID(ZhanBeiJunXuGuan_LBNPCFastID1) > 0 then
			API_DestroyMonster(ZhanBeiJunXuGuan_LBNPCFastID1)
		end
	end
	if ZhanBeiJunXuGuan_LBNPCFastID2 ~= nil then
		if API_GetMonsterID(ZhanBeiJunXuGuan_LBNPCFastID2) > 0 then
			API_DestroyMonster(ZhanBeiJunXuGuan_LBNPCFastID2)
		end
	end
end

--上线判断
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'LC_RongYuXunZhang_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'LC_RongYuXunZhang_OnLogin') 
end

--下线判断
local OnLogoutLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLogoutFuncNameList) do 
	if GLOBAL_ActMain_OnLogoutFuncNameList[i] == 'LC_RongYuXunZhang_OnLogout' then
		OnLogoutLoadOK = 1
		break
	end 
end 
if OnLogoutLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLogoutFuncNameList,'LC_RongYuXunZhang_OnLogout') 
end

--上线回调
function LC_RongYuXunZhang_OnLogin() 
	local ActorID = API_RequestGetActorID()
	local OnLoginType = API_VarDataGetNumber(ActorID,0,18368)
	local StartTimeTable = RongYuXunZhang_StartTime
	local EndTimeTable = RongYuXunZhang_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
--	if OnLoginType ~= 2 then
		if nShiFouStart <= 0 and nShiFouEnd > 0 then
			API_RemoveTaskScroll(ActorID,RongYuXunZhang_juanzhouid)
			LRY_UItwinkemanage(ActorID,21,85,RongYuXunZhangtubiaoid,RongYuXunZhang_juanzhouid,20,'LC_RongYuXunZhang_juanzhoudianji')--加载图标
			local LoginTime =os.time()
			API_VarDataSetNumber(ActorID,1,LC_OnLoginTime,LoginTime)
		else
			API_RemoveTaskScroll(ActorID,RongYuXunZhang_juanzhouid)
		end
--	end
end

--下线回调
function LC_RongYuXunZhang_OnLogout()
	local ActorID = API_RequestGetActorID()
	local LoginTime = API_VarDataGetNumber(ActorID,1,LC_OnLoginTime)
	local LoginDate = os.date("*t", LoginTime)
	local LoginYear = LoginDate.year
	local LoginMonth = LoginDate.month
	local LoginDay = LoginDate.day
	local LoginHour = LoginDate.hour
	local Year,Month,Day,Hour,Minute,Second = PublicFun_time()
	local StartTimeTable = RongYuXunZhang_StartTime
	local EndTimeTable = RongYuXunZhang_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
		
	if nShiFouStart <= 0 and nShiFouEnd > 0 then	
		if Hour < StartHour then
		elseif Hour < EndHour then
			if LoginHour < StartHour then
					local LogoutTime = os.time()
					local LogoutDate = os.date("*t",LogoutTime)
					LogoutDate.hour = 18
					LogoutDate.min = 59
					LogoutDate.sec = 59
					local LoginTime = os.time(LogoutDate) + 1
					local Online1 = LogoutTime - LoginTime
					local Online2 = API_VarDataGetNumber(ActorID,1,LC_OnlineTime)
					local Online = Online1 + Online2
					API_VarDataSetNumber(ActorID,1,LC_OnlineTime,Online)
			elseif LoginHour < EndHour then
					local LogoutTime = os.time()
					local Online1 = LogoutTime - LoginTime
					local Online2 = API_VarDataGetNumber(ActorID,1,LC_OnlineTime)
					local Online = Online1 + Online2
					API_VarDataSetNumber(ActorID,1,LC_OnlineTime,Online)
			else
			end
		else
			if LoginHour < StartHour then				
				API_VarDataSetNumber(ActorID,1,LC_OnlineTime,7200)
			elseif LoginHour < EndHour then
				LoginDate.hour = 21
				LoginDate.min = 59
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
function LC_RongYuXunZhang_juanzhoudianji(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	local Year,Month,Day,Hour,Minute,Second = PublicFun_time()
	local LiJiangTime = API_VarDataGetNumber(ActorID,1,LC_LiJiangTime)
	local LiJiangDate = os.date("*t", LiJiangTime)
	local LC_LiJiangYear = LiJiangDate.year
	local LC_LiJiangMonth = LiJiangDate.month
	local LC_LiJiangDay = LiJiangDate.day
	local LoginHour = LiJiangDate.hour
	
	API_ResponseWrite('<win rect="250,250,500,220"></win>')
	API_ResponseWrite('<name>在线送勋章</name>')
	API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
	API_ResponseWrite('<text>    欢迎来到英雄岛！在线领勋章活动期间（4月26日至5月31日），每天19点-22点内，累计在线两小时后，你便可以领取若干</text><img srcgd="82030" tipgd="82030"><text>（具体领取数量参看领奖规则），荣誉勋章可在战备军需官处兑换奖励。如果您的背包中拥有</text><text color="255,0,255">VIP钥匙</text><text>，还可以额外获得2个</text><img srcgd="82031" tipgd="82031"><text></text><br>')
	if Year ~= LC_LiJiangYear or Month ~= LC_LiJiangMonth or Day ~= LC_LiJiangDay then
		API_ResponseWrite('<br><a href="LC_RongYuXunZhang_juanzhoudianji_Title?1=100">领取荣誉勋章！！</a><br>')
	else
		API_ResponseWrite('<br><text color="255,0,0">已领取</text><br>')
	end
	API_ResponseWrite('<br><a href="LC_RongYuXunZhang_juanzhoudianji_Title?1=200">领奖规则</a><br>')
	API_ResponseWrite('<br><a>关闭</a>')
	API_ResponseFlush(ActorID)
	return 1
end

local LC_JiangLiGoodNumTabel = {
[1] = 100,
[2] = 300,
[3] = 500,
[4] = 800,
}

--卷轴点击判断
function LC_RongYuXunZhang_juanzhoudianji_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	local Year,Month,Day,Hour,Minute,Second = PublicFun_time()
	local LiJiangTime = API_VarDataGetNumber(ActorID,1,LC_LiJiangTime)
	local LiJiangDate = os.date("*t", LiJiangTime)
	
	local LoginTime = API_VarDataGetNumber(ActorID,1,LC_OnLoginTime)
	local LoginDate = os.date("*t", LoginTime)
	local LoginYear = LoginDate.year
	local LoginMonth = LoginDate.month
	local LoginDay = LoginDate.day
	local LoginHour = LoginDate.hour
	local StartTimeTable = RongYuXunZhang_StartTime
	local EndTimeTable = RongYuXunZhang_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local OnlineTime = 0
	
	if nShiFouStart > 0 then
		API_RemoveTaskScroll(ActorID,RongYuXunZhang_juanzhouid)
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>在线送勋章</name>')
		API_ResponseWrite('<text>    亲爱的玩家，在线送勋章活动还未开始，请活动开始后再来领取奖励。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return	
	elseif nShiFouEnd <= 0 then
		API_RemoveTaskScroll(ActorID,RongYuXunZhang_juanzhouid)
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>在线送勋章</name>')
		API_ResponseWrite('<text>    亲爱的玩家，在线送勋章活动已经结束，感谢您的参与。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		return	
	end
	
	if nShiFouStart <= 0 and nShiFouEnd > 0 then	
		if Hour < StartHour then
		elseif Hour < EndHour then
			if LoginHour < StartHour then
					local LogoutTime = os.time()
					local LogoutDate = os.date("*t",LogoutTime)
					LogoutDate.hour = 18
					LogoutDate.min = 59
					LogoutDate.sec = 59
					local LoginTime = os.time(LogoutDate) + 1
					local Online1 = LogoutTime - LoginTime
					OnlineTime = Online1
			elseif LoginHour < EndHour then
					local LogoutTime = os.time()
					local Online1 = LogoutTime - LoginTime
					local Online2 = API_VarDataGetNumber(ActorID,1,LC_OnlineTime)
					OnlineTime = Online1 + Online2
			else
			end
		else
			if LoginHour < StartHour then				
				OnlineTime = 7200
			elseif LoginHour < EndHour then
				LoginDate.hour = 21
				LoginDate.min = 59
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
	local Minute = math.floor(OnlineTime/60)	
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
		if OnlineTime < 7200 then
			if Hour < StartHour then
				API_ResponseWrite('<win rect="250,250,500,220"></win>')
				API_ResponseWrite('<name>在线送勋章</name>')
				API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
				API_ResponseWrite('<text>    您今天在19点-22点之间,累计在线达到两小时即可领取一次奖励，目前活动计时尚未开始。</text><br>')
				API_ResponseWrite('<br><a>关闭</a>')
				API_ResponseFlush(ActorID)			
			elseif Hour < EndHour then
				API_ResponseWrite('<win rect="250,250,500,220"></win>')
				API_ResponseWrite('<name>在线送勋章</name>')
				API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
				API_ResponseWrite('<text>    您今天在19点-22点之间,累计在线还不足两小时，现已经累计在线</text><text color="255,0,255">'..Minute..'分钟</text><br>')
				API_ResponseWrite('<br><a>关闭</a>')
				API_ResponseFlush(ActorID)
			else
				API_ResponseWrite('<win rect="250,250,500,220"></win>')
				API_ResponseWrite('<name>在线送勋章</name>')
				API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
				API_ResponseWrite('<text>    您今天在19点-22点之间,累计在线不足两小时。</text><br>')
				API_ResponseWrite('<br><a>关闭</a>')
				API_ResponseFlush(ActorID)			
			end
		else
			local goodsnum = API_ActorGetGoodsNum(ActorID,VIPkey_keyid)
			local Number1 = API_VarDataGetNumber(ActorID,1,LC_ContinueNum)
			if JianGe == 1 then
				Number1 = Number1 + 1
			else
				Number1 = 0
			end
			if Number1 >= 6 then
				Number1 = 6
			end
			local Tepy = 1
			if ExpLevel <= 25 then
			elseif ExpLevel <= 40 then
				Tepy = 2
			elseif ExpLevel <= 55 then
				Tepy = 3
			elseif ExpLevel <=65 then
				Tepy = 4
			end
			local n = LC_JiangLiGoodNumTabel[Tepy]
			local GoodNum1 = n + (n*0.1)*Number1
			
			if goodsnum > 0 then
				if API_ActorCanAddGoods(ActorID,RongYuXunZhangGoodID,GoodNum1,3,1) ~= -1 then
					if JianGe == 1 then
						local Number = API_VarDataGetNumber(ActorID,1,LC_ContinueNum)
						Number = Number + 1
						API_VarDataSetNumber(ActorID,1,LC_ContinueNum,Number)
					else
						API_VarDataSetNumber(ActorID,1,LC_ContinueNum,0)
					end
				end
			else
				if API_ActorCanAddGoods(ActorID,RongYuXunZhangGoodID,GoodNum1,3,0) ~= -1 then
					if JianGe == 1 then
						local Number = API_VarDataGetNumber(ActorID,1,LC_ContinueNum)
						Number = Number + 1
						API_VarDataSetNumber(ActorID,1,LC_ContinueNum,Number)
					else
						API_VarDataSetNumber(ActorID,1,LC_ContinueNum,0)
					end
				end
			end
			local Number = API_VarDataGetNumber(ActorID,1,LC_ContinueNum)
			if Number >= 6 then
				Number = 6
			end
			local GoodNum = n + (n*0.1)*Number
			local NextGoodNum = 0
			if Number == 6 then
				NextGoodNum = GoodNum
			else
				NextGoodNum =  n + (n*0.1)*(Number+1)
			end
			local Number = API_VarDataGetNumber(ActorID,1,LC_ContinueNum)
			local Today =  Number + 1
			if goodsnum > 0 then
					if API_ActorCanAddGoods(ActorID,RongYuXunZhangGoodID,GoodNum,3,1) ~= -1 then
						API_AddActorGoodsFlag(ActorID,RongYuXunZhangGoodID,GoodNum,3,'获得荣誉勋章')
						API_ActorSendMsg(ActorID,8,'获得'..GoodNum..'个荣誉勋章')
						API_ResponseWrite('<win rect="250,250,500,220"></win>')
						API_ResponseWrite('<name>在线送勋章</name>')
						API_ResponseWrite('<text>恭喜你获得'..GoodNum..'个</text><img srcgd="82030" tipgd="82030"><text>以及2个</text><img srcgd="82031" tipgd="82031"><text>，您已经连续'..Today..'天领取奖励了，明天继续参与活动可以领取到'..NextGoodNum..'个荣誉勋章。</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
						API_ResponseFlush(ActorID)
						local JiangLiTime = os.time()
						API_VarDataSetNumber(ActorID,1,LC_LiJiangTime,JiangLiTime)
						API_AddActorGoodsFlag(ActorID,GaoJiXunZhangGoodID,2,3,'获得高级荣誉勋章')
						API_ActorSendMsg(ActorID,8,'获得2个高级荣誉勋章')
						API_VarDataSetNumber(ActorID,1,LC_OnlineTime,0)
						if GLOBAL_FengXiangBiao_DateList[69][1] == nil then
							GLOBAL_FengXiangBiao_DateList[69][1] = {}
						end
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[69][1][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[69][1][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[69][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[69][1][LaiYuan] + 1
						end
					else
						API_ResponseWrite('<win rect="250,250,500,220"></win>')
						API_ResponseWrite('<name>在线送勋章</name>')
						API_ResponseWrite('<text>您的背包空间不够，请整理背包之后再领取奖励。</text><br>')
						API_ResponseWrite('<a>确定</a>')
						API_ResponseFlush(ActorID)
					end
			else
				if API_ActorCanAddGoods(ActorID,RongYuXunZhangGoodID,GoodNum,3,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,RongYuXunZhangGoodID,GoodNum,3,'获得荣誉勋章')
					API_ActorSendMsg(ActorID,8,'获得'..GoodNum..'个荣誉勋章')
					API_ResponseWrite('<win rect="250,250,500,220"></win>')
					API_ResponseWrite('<name>在线送勋章</name>')
					API_ResponseWrite('<text>恭喜你获得'..GoodNum..'个</text><img srcgd="82030" tipgd="82030"><text>，您已经连续'..Today..'天领取奖励了，明天继续参与活动可以领取到'..NextGoodNum..'个荣誉勋章。</text><br>')
					API_ResponseWrite('<br><a>确定</a>')
					API_ResponseFlush(ActorID)
					local JiangLiTime = os.time()
					API_VarDataSetNumber(ActorID,1,LC_LiJiangTime,JiangLiTime)
					API_VarDataSetNumber(ActorID,1,LC_OnlineTime,0)
					if GLOBAL_FengXiangBiao_DateList[69][1] == nil then
						GLOBAL_FengXiangBiao_DateList[69][1] = {}
					end
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[69][1][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[69][1][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[69][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[69][1][LaiYuan] + 1
					end
				else
					API_ResponseWrite('<win rect="250,250,500,220"></win>')
					API_ResponseWrite('<name>在线送勋章</name>')
					API_ResponseWrite('<text>您的背包空间不够，请整理背包之后再领取奖励。</text><br>')
					API_ResponseWrite('<a>确定</a>')
					API_ResponseFlush(ActorID)
				end
			end	
		end	
	elseif SelectItem == 200 then
		API_ResponseWrite('<win rect="250,250,500,220"></win>')
		API_ResponseWrite('<name>在线送勋章</name>')
		API_ResponseWrite('<text>    活动期间（4月26日至5月31日），每日19：00——22：00期间内在线累积2小时即可领取荣誉勋章！且每日连续领取可在基础奖励上获得加成奖励,连续领取的天数越多，加成奖励越高！（如次日中断领取将回到基础奖励）</text><br>')
		API_ResponseWrite('<text>各等级段的基础奖励如下：</text><br>')		
		API_ResponseWrite('<text>21-25级为 100</text><br>')		
		API_ResponseWrite('<text>26-40级为 300 </text><br>')	
		API_ResponseWrite('<text>41-55级为 500</text><br>')	
		API_ResponseWrite('<text>56-65级为 800</text><br>')	
		API_ResponseWrite('<text>领取时如有您的背包中拥有VIP钥匙，可额外获得两枚高级荣誉勋章！ </text><br>')	
		API_ResponseWrite('<text>荣誉勋章及高级荣誉勋章可在主城及光明遗迹中的战备军需官处兑换物资。</text><br>')			
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
	end
end

--跨天清除
function RongYuXunZhang_KuaTianHuiDiao(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	API_VarDataSetNumber(ActorID,1,LC_OnlineTime,0)--清除在线时长
	local LoginTime =os.time()
	API_VarDataSetNumber(ActorID,1,LC_OnLoginTime,LoginTime)--跨天重新设置上线时间
end

local JunBeiBaoGoodsIDTable = {
	[1]={
			[89053] = {
				{GoodsID = 4001,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 4101,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6601,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6901,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 8101,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 4301,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 4201,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 4401,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 4501,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 2001,Num = 1,Bind = 1,Odds =10000,PinZhi=7},		
				{GoodsID = 3001,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 3901,Num = 1,Bind = 1,Odds =10000,PinZhi=7},		
			},
			[89054] = {
				{GoodsID = 5001,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 5101,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6701,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 7001,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 8201,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 5301,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 5201,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 5401,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 5501,Num = 1,Bind = 1,Odds =10000,PinZhi=7},	
				{GoodsID = 1501,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
			},
			[89055] = {
				{GoodsID = 6001,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6101,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6801,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 8001,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 8301,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6301,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6201,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6401,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6501,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 1001,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
			},
		},
	[2] = {
			[89053] = {
				{GoodsID = 6602,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6902,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 8102,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 4302,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 4202,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 4402,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 4502,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 4002,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 4102,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 2002,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 3002,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 3902,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
			},
			[89054] = {		
				{GoodsID = 7002,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 8202,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 5302,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 5202,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 5402,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 5502,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 5002,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 5102,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 1502,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6702,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
			},
			[89055] = {		
				{GoodsID = 6802,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 8002,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 8302,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6302,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6202,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6402,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6502,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6002,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 6102,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
				{GoodsID = 1002,Num = 1,Bind = 1,Odds =10000,PinZhi=7},
			},

		},
	[3] = {
			[89053] = {
				{GoodsID = 4303,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 4203,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 4403,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 4503,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 4103,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 4003,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 6603,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},			
				{GoodsID = 6903,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7}, 
				{GoodsID = 8103,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7}, 
				{GoodsID = 2003,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7}, 
				{GoodsID = 3003,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7}, 
				{GoodsID = 3903,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7}, 
			},
			[89054] = {	
				{GoodsID = 5303,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 5203,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 5403,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 5503,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 5003,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 5103,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 6703,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7}, 
				{GoodsID = 7003,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7}, 
				{GoodsID = 8203,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7}, 
				{GoodsID = 1503,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7}, 
			},
			[89055] = {	
				{GoodsID = 6303,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 6203,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 6403,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 6503,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 6003,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},
				{GoodsID = 6103,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7},   
				{GoodsID = 6803,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7}, 
				{GoodsID = 8003,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7}, 
				{GoodsID = 8303,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7}, 
				{GoodsID = 1003,Num = 1,Bind = 1,Odds = 10000,PinZhi = 7}, 
			},
		},
}

--军备包使用
function LC_JunBeiBaoUse(ActorID,GoodsID1)
	local ActorID = ActorID or API_RequestGetActorID()
	local Lv = API_GetActorPeerageLevel(ActorID)
	local GoodTable = JunBeiBaoGoodsIDTable
	if GoodsID1 == 89053 or GoodsID1 == 89054 or GoodsID1 == 89055 then
		if Lv <= 3 then
			local j = math.random(table.getn(GoodTable[1][GoodsID1]))
			GoodsID2 = GoodTable[1][GoodsID1][j].GoodsID
			Num = GoodTable[1][GoodsID1][j].Num
			Flag = GoodTable[1][GoodsID1][j].Bind
			PinZhi = GoodTable[1][GoodsID1][j].PinZhi
		elseif Lv <= 5 then
			local j = math.random(table.getn(GoodTable[2][GoodsID1]))
			GoodsID2 = GoodTable[2][GoodsID1][j].GoodsID
			Num = GoodTable[2][GoodsID1][j].Num
			Flag = GoodTable[2][GoodsID1][j].Bind
			PinZhi = GoodTable[2][GoodsID1][j].PinZhi
		else
			local j = math.random(table.getn(GoodTable[3][GoodsID1]))
			GoodsID2 = GoodTable[3][GoodsID1][j].GoodsID
			Num = GoodTable[3][GoodsID1][j].Num
			Flag = GoodTable[3][GoodsID1][j].Bind
			PinZhi = GoodTable[3][GoodsID1][j].PinZhi
		end
	else
		API_ActorSendMsg(ActorID,3,'道具非法')
		return 0
	end
	local GoodsName1 = API_GetGoodsName(GoodsID1)
	local GoodsName2 = API_GetGoodsName(GoodsID2)
	if API_ActorCanAddGoods(ActorID,GoodsID2,Num,Flag,0) ~= -1 then
		if API_ActorRemoveGoods(ActorID,GoodsID1,1,'使用'..GoodsName1..'') then
			API_AddActorGoodsFlagEx(ActorID,GoodsID2,Num,PinZhi,Flag,'获得高附加属性装备',0)
			API_ActorSendMsg(ActorID,8,'获得高附加属性的'..GoodsName2..'一件')
		else
			API_ActorSendMsg(ActorID,8,'扣除军备包失败，请重新使用。')
			return 0
		end
	else
		API_ResponseWrite('<name>军备包</name>')
		API_ResponseWrite('<text>您的背包空间不够，至少需要1个空格才能打开军备包。</text><br>')
		API_ResponseWrite('<a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end
	return 1
end

--奖励表
--对话兑换奖励
WYL_RYXZ_ExchangeGoodsList = {
	[1] = {
		{GoodsID = 	80832	,PT = 	15	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	250	,PT = 	10	,GJ = 	0	,Data=11911,Max=20,},
		{GoodsID = 	80274	,PT = 	20	,GJ = 	0	,Data=11912,Max=20,},
		{GoodsID = 	88908	,PT = 	50	,GJ = 	0	,Data=30248,Max=10,},
		{GoodsID = 	207	,PT = 	5	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	118	,PT = 	5	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	208	,PT = 	9	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	119	,PT = 	9	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	307	,PT = 	6	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	308	,PT = 	8	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	316	,PT = 	11	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	88992	,PT = 	50	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	89053	,PT = 	30	,GJ = 	5	,Data=0,Max=0,},
		{GoodsID = 	89054	,PT = 	30	,GJ = 	5	,Data=0,Max=0,},
		{GoodsID = 	89055	,PT = 	30	,GJ = 	5	,Data=0,Max=0,},
		},
}

function WYL_RYXZ_NpcDialogue(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	local XuanZe = API_RequestGetNumber(1)
	API_ResponseWrite('<name>战备军需官</name>')
	API_ResponseWrite('<text>本小姐可提供每日的战备物资，你可以用荣誉勋章来我这里兑换物资，但资源有限，每人每日是限量兑换的哦！</text><br>')
	if ExpLevel >= 21 then
		API_ResponseWrite('<br><br><a href="WYL_RYXZ_NpcExchange?1=1&4='..NPCID..'">立刻兑换</a><br><br>')
	else
		API_ResponseWrite('<br><br><text color="255,0,0">你等级未满21级，还不能在我这里兑换哦~</text><br><br>')
	end
	API_ResponseWrite('<br><a>我知道了</a>')
	API_ResponseFlush(ActorID) 
end

function WYL_RYXZ_NpcExchange()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	local NPCID = API_RequestGetNumber(4)
	if WYL_RYXZ_ExchangeGoodsList[SelectItem] == nil then
		return
	end
	if type(WYL_RYXZ_ExchangeGoodsList[SelectItem]) ~= 'table' then
		return
	end
	local PTGoodsID = 82030
	local GJGoodsID = 82031
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if WYL_RYXZ_ExchangeGoodsList[SelectItem][BuyNo] ~= nil then
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
			local YMD = Year * 10000 + Month * 100 + Day
			local GoodsID = WYL_RYXZ_ExchangeGoodsList[SelectItem][BuyNo].GoodsID
			local PT = WYL_RYXZ_ExchangeGoodsList[SelectItem][BuyNo].PT
			local GJ = WYL_RYXZ_ExchangeGoodsList[SelectItem][BuyNo].GJ
			local Data = WYL_RYXZ_ExchangeGoodsList[SelectItem][BuyNo].Data
			local Max = WYL_RYXZ_ExchangeGoodsList[SelectItem][BuyNo].Max
			local BuyNum = API_RequestGetNumber(num)
			if BuyNum < 1 then
				BuyNum = 1
			elseif BuyNum > 999 then
				BuyNum = 999
			end
			local PTNum = API_ActorGetGoodsNum(ActorID,PTGoodsID)
			local GJNum = API_ActorGetGoodsNum(ActorID,GJGoodsID)
			if Data > 0 and Max > 0 then
				local Num = API_VarDataGetNumber(ActorID,1,Data)
				if Num + BuyNum > Max then
					BuyNum = Max - Num
				end
				if BuyNum <= 0 then
					API_ResponseWrite('<text>每天只能兑换'..Max..'个'..API_GetGoodsName(GoodsID)..'，该物品今天您的兑换数量已达上限，请明天再来兑换。</text><br>')
					API_ResponseWrite('<br><a href="WYL_RYXZ_NpcDialogue">  返回</a>')
					return
				end
			end
			PT = PT * BuyNum
			GJ = GJ * BuyNum
			if PT > 0 and GJ > 0 then
				if PTNum >= PT then
					if GJNum >= GJ then
						if API_ActorCanAddGoods(ActorID,GoodsID,BuyNum,1,0) ~= -1 then
							if API_ActorRemoveGoods(ActorID,PTGoodsID,PT,"战备军需官删除") and API_ActorRemoveGoods(ActorID,GJGoodsID,GJ,"战备军需官删除") then
								if Data > 0 and Max > 0 then
									local Num = API_VarDataGetNumber(ActorID,1,Data)
									Num = Num + BuyNum
									API_VarDataSetNumber(ActorID,1,Data,Num)
									API_VarDataSetNumber(ActorID,1,11910,YMD)
								end
								API_AddActorGoodsFlag(ActorID, GoodsID, BuyNum, 1, '战备军需官兑换')
								API_ActorSendMsg(ActorID,7,'使用'..PT..'个'..API_GetGoodsName(PTGoodsID)..'和'..GJ..'个'..API_GetGoodsName(GJGoodsID)..'兑换了：'..API_GetGoodsName(GoodsID)..'  × '..BuyNum..'')
								API_ResponseWrite('<name>战备军需官</name>')
								API_ResponseWrite('<text>兑换获得：</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
								API_ResponseWrite('<br><a href="WYL_RYXZ_NpcDialogue">  返回</a>')
								--风向标
								if GLOBAL_FengXiangBiao_DateList[69][BuyGoodsID] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[69][BuyGoodsID][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[69][BuyGoodsID][LaiYuan] = BuyNum
									else
										GLOBAL_FengXiangBiao_DateList[69][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[69][BuyGoodsID][LaiYuan] + BuyNum
									end
								end
							end
						else
							API_ResponseWrite('<text>背包空间不足，无法兑换。</text><br>')
							API_ResponseWrite('<br><a href="WYL_RYXZ_NpcDialogue">  返回</a>')
						end
					else
						API_ResponseWrite('<text>你的'..API_GetGoodsName(GJGoodsID)..'数量不足，无法兑换。</text><br>')
						API_ResponseWrite('<br><a href="WYL_RYXZ_NpcDialogue">  返回</a>')
					end
				else
					API_ResponseWrite('<text>你的'..API_GetGoodsName(PTGoodsID)..'数量不足，无法兑换。</text><br>')
					API_ResponseWrite('<br><a href="WYL_RYXZ_NpcDialogue">  返回</a>')
				end
			elseif PT == 0 and GJ > 0 then
				if GJNum >= GJ then
					if API_ActorCanAddGoods(ActorID,GoodsID,BuyNum,1,0) ~= -1 then
						if API_ActorRemoveGoods(ActorID,GJGoodsID,GJ,"战备军需官删除") then
							if Data > 0 and Max > 0 then
								local Num = API_VarDataGetNumber(ActorID,1,Data)
								Num = Num + BuyNum
								API_VarDataSetNumber(ActorID,1,Data,Num)
								API_VarDataSetNumber(ActorID,1,11910,YMD)
							end
							API_AddActorGoodsFlag(ActorID, GoodsID, BuyNum, 1, '战备军需官兑换')
							API_ActorSendMsg(ActorID,7,'使用'..GJ..'个'..API_GetGoodsName(GJGoodsID)..'兑换了：'..API_GetGoodsName(GoodsID)..'  × '..BuyNum..'')
							API_ResponseWrite('<name>战备军需官</name>')
							API_ResponseWrite('<text>兑换获得：</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
							API_ResponseWrite('<br><a href="WYL_RYXZ_NpcDialogue">  返回</a>')
						end
					else
						API_ResponseWrite('<text>背包空间不足，无法兑换。</text><br>')
						API_ResponseWrite('<br><a href="WYL_RYXZ_NpcDialogue">  返回</a>')
					end
				else
					API_ResponseWrite('<text>你的'..API_GetGoodsName(GJGoodsID)..'数量不足，无法兑换。</text><br>')
					API_ResponseWrite('<br><a href="WYL_RYXZ_NpcDialogue">  返回</a>')
				end
			elseif PT > 0 and GJ == 0 then
				if PTNum >= PT then
					if API_ActorCanAddGoods(ActorID,GoodsID,BuyNum,1,0) ~= -1 then
						if API_ActorRemoveGoods(ActorID,PTGoodsID,PT,"战备军需官删除") then
							if Data > 0 and Max > 0 then
								local Num = API_VarDataGetNumber(ActorID,1,Data)
								Num = Num + BuyNum
								API_VarDataSetNumber(ActorID,1,Data,Num)
								API_VarDataSetNumber(ActorID,1,11910,YMD)
							end
							API_AddActorGoodsFlag(ActorID, GoodsID, BuyNum, 1, '战备军需官兑换')
							API_ActorSendMsg(ActorID,7,'使用'..PT..'个'..API_GetGoodsName(PTGoodsID)..'兑换了：'..API_GetGoodsName(GoodsID)..'  × '..BuyNum..'')
							API_ResponseWrite('<name>战备军需官</name>')
							API_ResponseWrite('<text>兑换获得：</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
							API_ResponseWrite('<br><a href="WYL_RYXZ_NpcDialogue">  返回</a>')
						end
					else
						API_ResponseWrite('<text>背包空间不足，无法兑换。</text><br>')
						API_ResponseWrite('<br><a href="WYL_RYXZ_NpcDialogue">  返回</a>')
					end
				else
					API_ResponseWrite('<text>你的'..API_GetGoodsName(PTGoodsID)..'数量不足，无法兑换。</text><br>')
					API_ResponseWrite('<br><a href="WYL_RYXZ_NpcDialogue">  返回</a>')
				end
			end
		end
		return
	end
	local GoodsNum = table.getn(WYL_RYXZ_ExchangeGoodsList[SelectItem])
	API_ResponseWrite('<name>战备物资库</name>')
	API_ResponseWrite('<win rect="30,75,500,510"></win>')
	for i = 1,GoodsNum do
		if i > Page * 6 and i < (Page + 1) * 6 + 1 then
			local GoodsID = WYL_RYXZ_ExchangeGoodsList[SelectItem][i].GoodsID
			local PT = WYL_RYXZ_ExchangeGoodsList[SelectItem][i].PT
			local GJ = WYL_RYXZ_ExchangeGoodsList[SelectItem][i].GJ
			local Data = WYL_RYXZ_ExchangeGoodsList[SelectItem][i].Data
			local Max = WYL_RYXZ_ExchangeGoodsList[SelectItem][i].Max
			API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(GoodsID)..'</text><br>')
			API_ResponseWrite('<img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'">')
			local BuyNumTip = '  兑换需要：'
			if PT > 0 and GJ > 0 then
				BuyNumTip = BuyNumTip..''..API_GetGoodsName(PTGoodsID)..' x '..PT..'、'..API_GetGoodsName(GJGoodsID)..' x '..GJ..'  '
			elseif GJ > 0 and PT == 0 then
				BuyNumTip = BuyNumTip..''..API_GetGoodsName(GJGoodsID)..' x '..GJ..'  '
			elseif PT > 0 and GJ == 0 then
				BuyNumTip = BuyNumTip..''..API_GetGoodsName(PTGoodsID)..' x '..PT..'  '
			end
			if Data > 0 and Max > 0 then
				local Num = API_VarDataGetNumber(ActorID,1,Data)
				local a = Max - Num
				BuyNumTip = BuyNumTip..'('..a..'/'..Max..')  '
			end
			local BuyNumTipLen = string.len(BuyNumTip)
			if BuyNumTipLen < 50 then
				for j = 1,50- BuyNumTipLen do
					BuyNumTip = BuyNumTip..' '
				end
			end
			API_ResponseWrite('<text color="255,0,255">'..BuyNumTip..'</text>')
			local num = i * 100
			API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
			API_ResponseWrite('<text> </text>')
			API_ResponseWrite('<img src="LuaUse\\button Exchange_u.bmp" src2="LuaUse\\button Exchange_l.bmp" close="0" href="WYL_RYXZ_NpcExchange?1='..SelectItem..'&2='..Page..'&3='..i..'&4='..NPCID..'"><br>')
			API_ResponseWrite('<text>—————————————————————————————————————</text><br>')
		end
	end
	if GoodsNum < (Page + 1) * 6 then
		for i = 1,(Page + 1) * 6 - GoodsNum do
			API_ResponseWrite('<br><br><br><br>')
		end
	end
	if GoodsNum > 6 then
		local BackPage = Page - 1
		local NextPage = Page + 1
		if Page == 0 then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_g.bmp"><text>                   </text>')
			API_ResponseWrite('<a href="WYL_RYXZ_NpcDialogue">返回</a>')
			API_ResponseWrite('<text>                   </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="WYL_RYXZ_NpcExchange?1='..SelectItem..'&2='..NextPage..'&4='..NPCID..'">')
		elseif (Page + 1) * 6 < GoodsNum then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="WYL_RYXZ_NpcExchange?1='..SelectItem..'&2='..BackPage..'&4='..NPCID..'"><text>                   </text>')
			API_ResponseWrite('<a href="WYL_RYXZ_NpcDialogue">返回</a>')
			API_ResponseWrite('<text>                   </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="WYL_RYXZ_NpcExchange?1='..SelectItem..'&2='..NextPage..'&4='..NPCID..'">')
		else
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="WYL_RYXZ_NpcExchange?1='..SelectItem..'&2='..BackPage..'&4='..NPCID..'"><text>                   </text>')
			API_ResponseWrite('<a href="WYL_RYXZ_NpcDialogue">返回</a>')
			API_ResponseWrite('<text>                   </text><img src="LuaUse\\button_next_g.bmp">')
		end
	else
		API_ResponseWrite('<br><a href="WYL_RYXZ_NpcDialogue">  返回</a>')
	end
end
