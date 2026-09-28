----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\ShuangBeiJiangLi.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-9-22
--版  本:	1.0
--描  述:	双倍奖励活动
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-9-22
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------
SBJL_ReadyTime = {Year = 2011,Month = 9,Day = 23,Hour = 0,Minute = 0,Second = 0}   -------广告开始时间
SBJL_StartTime = {Year = 2011,Month = 9,Day = 30,Hour = 0,Minute = 0,Second = 0}   -------开始时间
SBJL_EndTime = {Year = 2011,Month = 10,Day = 8,Hour = 0,Minute = 0,Second = 0}   -------停止时间

if GLOBAL_SBJLAD_TimerTriggerID ~= nil then
	API_DestroyTriggerG(GLOBAL_SBJLAD_TimerTriggerID)
end

GLOBAL_SBJLAD_TimerTriggerID = API_CreateTimerTriggerG(0,0,600,-1,'SBJLAD_TimerTriggerCallFunc')

function SBJLAD_TimerTriggerCallFunc(Param1,Param2)
	local nShiFouReady = API_DiffDatatime(SBJL_ReadyTime.Year,SBJL_ReadyTime.Month,SBJL_ReadyTime.Day,SBJL_ReadyTime.Hour,SBJL_ReadyTime.Minute,SBJL_ReadyTime.Second)
	local nShiFouStart = API_DiffDatatime(SBJL_StartTime.Year,SBJL_StartTime.Month,SBJL_StartTime.Day,SBJL_StartTime.Hour,SBJL_StartTime.Minute,SBJL_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SBJL_EndTime.Year,SBJL_EndTime.Month,SBJL_EndTime.Day,SBJL_EndTime.Hour,SBJL_EndTime.Minute,SBJL_EndTime.Second)
	--判断是否在广告有效时间内
	if nShiFouReady < 0 and nShiFouStart > 0 then
		local HuoDongShiJian = ''.. SBJL_StartTime.Year ..'年'.. SBJL_StartTime.Month ..'月'.. SBJL_StartTime.Day ..'日'.. SBJL_StartTime.Hour ..'：'.. SBJL_StartTime.Minute ..' 到 '.. SBJL_EndTime.Year ..'年'.. SBJL_EndTime.Month ..'月'.. SBJL_EndTime.Day ..'日'.. SBJL_EndTime.Hour ..'：'.. SBJL_EndTime.Minute ..' '
		API_ActorBroadcastMsgEx(-1,-1,0,17,''..HuoDongShiJian..'将举行浮空岛奖励三倍活动，届时防守普通模式、训练营、塔防浮空岛、试炼空间的奖励将翻倍！')
	elseif nShiFouStart < 0 and nShiFouEnd > 0 then
		local HuoDongShiJian = ''.. SBJL_EndTime.Year ..'年'.. SBJL_EndTime.Month ..'月'.. SBJL_EndTime.Day ..'日'.. SBJL_EndTime.Hour ..'：'.. SBJL_EndTime.Minute ..' '
		API_ActorBroadcastMsgEx(-1,-1,0,17,'从现在开始到'..HuoDongShiJian..'防守普通模式、训练营、塔防浮空岛、试炼空间的奖励翻倍，欢迎参加！')
	end
end
