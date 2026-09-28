----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\TianJiangHengCai.lua.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2006-8-16
--版  本:	1.0
--描  述:	天降横财
--应  用:  
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2006-11-16
--描  述: 
----------------------------------------------------------------------------------------------------------------------
ZCM_tjhc_renwuID = 2108          -----天降横财任务id

ZCM_tjhc_start = {Year = 2006,Month = 12,Day = 22,Hour = 19,Minute = 00,Second = 0}   -------天降横财开始时间
ZCM_tjhc_begain = {Year = 2006,Month = 12,Day = 22,Hour = 20,Minute = 0,Second = 0}   -------天降横财进行时间
ZCM_tjhc_end = {Year = 2006,Month = 12,Day = 22,Hour = 21,Minute = 0,Second = 0}   -------天降横财停止时间

-----创建时间触发器
if ZCM_tjhc_timeTrigger == nil then
	ZCM_tjhc_timeTrigger =  API_CreateTimerTriggerG(0,0,60,-1,'ZCM_tjhc_Time_Circle')
else
	API_DestroyTriggerG(ZCM_tjhc_timeTrigger)
	ZCM_tjhc_timeTrigger =  API_CreateTimerTriggerG(0,0,60,-1,'ZCM_tjhc_Time_Circle')
end

function ZCM_tjhc_Time_Circle(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ServerID = API_GetServerID()
	if ZCM_tjhc_kaishibiaozhi == nil then
		local nShiFouStart = API_DiffDatatime(ZCM_tjhc_start.Year,ZCM_tjhc_start.Month,ZCM_tjhc_start.Day,ZCM_tjhc_start.Hour,ZCM_tjhc_start.Minute,ZCM_tjhc_start.Second)
		local nShiFouEnd = API_DiffDatatime(ZCM_tjhc_end.Year,ZCM_tjhc_end.Month,ZCM_tjhc_end.Day,ZCM_tjhc_end.Hour,ZCM_tjhc_end.Minute,ZCM_tjhc_end.Second)
		if nShiFouStart < 0 and nShiFouEnd >= 0 then
			ZCM_tjhc_kaishibiaozhi = 1
		elseif nShiFouEnd < 0 then
			API_DestroyTriggerG(TriggerID)
			if ZCM_tjhc_timeTrigger ~= nil then
				API_DestroyTriggerG(ZCM_tjhc_timeTrigger)
				ZCM_tjhc_timeTrigger = nil
			end
		end
	elseif ZCM_tjhc_kaishibiaozhi == 1 then
		local nShiFouStart = API_DiffDatatime(ZCM_tjhc_start.Year,ZCM_tjhc_start.Month,ZCM_tjhc_start.Day,ZCM_tjhc_start.Hour,ZCM_tjhc_start.Minute,ZCM_tjhc_start.Second)
		local nShiFouBegain = API_DiffDatatime(ZCM_tjhc_begain.Year,ZCM_tjhc_begain.Month,ZCM_tjhc_begain.Day,ZCM_tjhc_begain.Hour,ZCM_tjhc_begain.Minute,ZCM_tjhc_begain.Second)
		local nShiFouEnd = API_DiffDatatime(ZCM_tjhc_end.Year,ZCM_tjhc_end.Month,ZCM_tjhc_end.Day,ZCM_tjhc_end.Hour,ZCM_tjhc_end.Minute,ZCM_tjhc_end.Second)
		if nShiFouBegain < 0 and nShiFouEnd >= 0 then
			API_ActorBroadcastMsgEx(-1,-1,0,17,'“天降横财”活动开始！创世神大人在机奴巢穴大撒宝箱，活动将持续1个小时，欢迎大家参与！')
			API_ActorBroadcastMsgEx(-1,-1,0,1,'“天降横财”活动开始！创世神大人在机奴巢穴大撒宝箱，活动将持续1个小时，欢迎大家参与！')
			ZCM_tjhc_kaishibiaozhi = 2
			ZCM_tjhc_ShuaBaoXiang()
			ZCM_tjhc_ShuaBaoXiang()
			ZCM_tjhc_ShuaBaoXiang()
		elseif nShiFouStart < 0 and nShiFouBegain >= 0 and nShiFouEnd >= 0 then
			if math.mod (Minute,3) == 0 then
				API_ActorBroadcastMsgEx(-1,-1,0,17,'创世神大人献礼，将于今晚20：00开始在机奴巢穴“天降横财”，各位玩家可即时前往机奴巢穴参与本次活动！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'创世神大人献礼，将于今晚20：00开始在机奴巢穴“天降横财”，各位玩家可即时前往机奴巢穴参与本次活动')
			end
		elseif nShiFouEnd < 0 then
			API_DestroyTriggerG(TriggerID)
			if ZCM_tjhc_timeTrigger ~= nil then
				API_DestroyTriggerG(ZCM_tjhc_timeTrigger)
				ZCM_tjhc_timeTrigger = nil
				ZCM_tjhc_kaishibiaozhi = nil
			end
		end
	elseif ZCM_tjhc_kaishibiaozhi == 2 then
		local nShiFouEnd = API_DiffDatatime(ZCM_tjhc_end.Year,ZCM_tjhc_end.Month,ZCM_tjhc_end.Day,ZCM_tjhc_end.Hour,ZCM_tjhc_end.Minute,ZCM_tjhc_end.Second)
		if nShiFouEnd < 0 then
			API_ActorBroadcastMsgEx(-1,-1,0,17,'“本次“天降横财”活动结束! 谢谢大家参与！')
			API_ActorBroadcastMsgEx(-1,-1,0,1,'“本次“天降横财”活动结束! 谢谢大家参与！')
			API_DestroyTriggerG(TriggerID)
			if ZCM_tjhc_timeTrigger ~= nil then
				API_DestroyTriggerG(ZCM_tjhc_timeTrigger)
				ZCM_tjhc_timeTrigger = nil
				ZCM_tjhc_kaishibiaozhi = nil
			end
		else
			if math.mod (Minute,2) == 0 then
				API_ActorBroadcastMsgEx(-1,-1,0,17,'创世神大人再次在机奴巢穴大撒宝箱，本次“天降横财”活动将在21：00结束，欢迎大家参与！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'创世神大人再次在机奴巢穴大撒宝箱，本次“天降横财”活动将在21：00结束，欢迎大家参与！')
				ZCM_tjhc_ShuaBaoXiang()
			end
		end
	end
end
function ZCM_tjhc_ShuaBaoXiang()
	if API_IsEctypeServer() then
		if API_GetServerID() == 1 then
			local ObjMapID = API_VarDataGetNumber_Ex(1,0,-1,1,1)
			if API_MapIsValid(ObjMapID) then
				for i = 1,300 do
					local ZCM_locx,ZCM_locy
					repeat
						ZCM_locx = math.random(625)
						ZCM_locy = math.random(624)
					until not API_IsBlockTile(ObjMapID,ZCM_locx,ZCM_locy,0)
					API_CreateDropGoods(ObjMapID,ZCM_locx,ZCM_locy,829,1,0,'天降横财',4,0,300,0)
				end
			end
		end
		if API_GetServerID() == 1 then
			local ObjMapID = API_VarDataGetNumber_Ex(1,0,-1,1,2)
			if API_MapIsValid(ObjMapID) then
				for i = 1,300 do
					local ZCM_locx,ZCM_locy,r,zhanwei
					repeat
						ZCM_locx = math.random(625)
						ZCM_locy = math.random(624)
					until not API_IsBlockTile(ObjMapID,ZCM_locx,ZCM_locy,0)
					API_CreateDropGoods(ObjMapID,ZCM_locx,ZCM_locy,829,1,0,'天降横财',4,0,300,0)
				end
			end
			ObjMapID = API_VarDataGetNumber_Ex(1,0,-1,1,4)
			if API_MapIsValid(ObjMapID) then
				for i = 1,300 do
					local ZCM_locx,ZCM_locy,r,zhanwei
					repeat
						ZCM_locx = math.random(625)
						ZCM_locy = math.random(624)
					until not API_IsBlockTile(ObjMapID,ZCM_locx,ZCM_locy,0)
					API_CreateDropGoods(ObjMapID,ZCM_locx,ZCM_locy,829,1,0,'天降横财',4,0,300,0)
				end
			end
		end
	else
	end
end
