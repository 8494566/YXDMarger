----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\ShangxianSongli.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-2-25
--版  本:	1.0
--描  述:	上线送礼活动
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-2-25
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------

SXSL_StartTime = {Year = 2008,Month = 6,Day = 19,Hour = 0,Minute = 0,Second = 0}   -------开始时间
SXSL_EndTime = {Year = 2008,Month = 6,Day = 24,Hour = 0,Minute = 0,Second = 0}   -------停止时间


--送礼需要的背包格数
local Beibaoyaoqiu = 1
--礼包物品ID
local LibaoID = 784
--礼包数量
local LibaoNum = 3
--已经领取礼包标志
local LingquDate = 18065
local LingquTime = 18066

function ShangxianSongli_OnLogin()
	local ActorID = API_RequestGetActorID()
	local Mapid = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(Mapid)
	if StaticMapID == 1814 or StaticMapID == 1815 or StaticMapID == 1816 or StaticMapID == 72 or StaticMapID == 73 then
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(SXSL_StartTime.Year,SXSL_StartTime.Month,SXSL_StartTime.Day,SXSL_StartTime.Hour,SXSL_StartTime.Minute,SXSL_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SXSL_EndTime.Year,SXSL_EndTime.Month,SXSL_EndTime.Day,SXSL_EndTime.Hour,SXSL_EndTime.Minute,SXSL_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		local Biaozhi = API_VarDataGetNumber(ActorID,1,LingquDate)
		local Biaozhi2 = API_VarDataGetNumber(ActorID,1,LingquTime)
		Biaozhi = math.mod(Biaozhi,100000000)
		local LYear = math.floor(Biaozhi/10000)
		local LMonthDay = math.mod(Biaozhi,10000)
		local LMonth = math.floor(LMonthDay/100)
		local LDay = math.mod(LMonthDay,100)
		
		Biaozhi2 = math.mod(Biaozhi2,1000000)
		local LHour = math.floor(Biaozhi2/10000)
		local LMinuteSecond = math.mod(Biaozhi,10000)
		local LMinute = math.floor(LMinuteSecond/100)
		local LSecond = math.mod(LMinuteSecond,100)
		
		if LYear <= SXSL_StartTime.Year then
			if LMonth <= SXSL_StartTime.Month then
				if LDay <= SXSL_StartTime.Day then
					if LHour <= SXSL_StartTime.Hour then
						if LMinute <= SXSL_StartTime.Minute then
							if LSecond <= SXSL_StartTime.Second then
								local PackageSize = API_ActorGetPackageSize(ActorID)
								if PackageSize >= Beibaoyaoqiu then
									API_AddActorGoodsEx(ActorID,LibaoID,LibaoNum,1,'上线送礼活动')
									local date = Year * 10000 + Month * 100 + Day
									local time = Hour * 10000 + Minute * 100 + Second
									API_VarDataSetNumber(ActorID,1,LingquDate,date)
									API_VarDataSetNumber(ActorID,1,LingquTime,time)
									
									local CampID = API_GetActorCamp(ActorID)
									local Camp = {[0]='帝国',[1]='联邦'}
									local CampName = Camp[CampID]
									API_ResponseWrite('<name id="1">礼物派发员</name>')
							--		API_ResponseWrite('<win rect="610,430,330,200" move="1" alpha="100" balpha="0"></win>')
									API_ResponseWrite('<text>欢迎来到英雄岛的世界，'..CampName..'总督命我为您送来第一份见面礼： </text><img srcgd="'..LibaoID..'" tipgd="'..LibaoID..'"><text color="254,249,220"> '..API_GetGoodsName(LibaoID)..'</text><text> '..PublicFun_ArabianNumberToChineseNumber(LibaoNum)..'个！使用它们你将获得意想不到的惊喜哦～</text><br>')
									API_ResponseWrite('<br><a>收到</a><br>')
									API_ResponseFlush(ActorID)
									API_ActorSendMsg(ActorID,1,'欢迎来到英雄岛的世界，'..CampName..'总督为您送来第一份见面礼：'..PublicFun_ArabianNumberToChineseNumber(LibaoNum)..'个'..API_GetGoodsName(LibaoID)..'！')
								else
									API_ActorSendMsg(ActorID,1,'您的背包满了，无法获得上线礼物，请至少保留'..Beibaoyaoqiu..'格以上的背包空间后，再次上线就能获得本次送礼了！')
								end
							end
						end
					end
				end
			end
		end
	end
end

local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'ShangxianSongli_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'ShangxianSongli_OnLogin') 
end

local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'ShangxianSongli_OnLogin' then
		OnLoginMapLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'ShangxianSongli_OnLogin') 
end
