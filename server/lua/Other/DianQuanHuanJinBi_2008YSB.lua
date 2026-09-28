----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\DianQuanHuanJinBi.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	林瑞宇
--日  期:	2008-7-23
--版  本:	1.0
--描  述:	广告
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 林瑞宇
--日  期: 2008-7-23
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------




if not API_IsEctypeServer() then
	local Param1 = 0
	local Param2 = 0
	API_CreateTimerTriggerG(Param1,Param2,300,-1,'DianQuanHuanJinBi_TipMsg')
	API_CreateTimerTriggerG(Param1,Param2,120,-1,'DianQuanHuanJinBi_TipWindowsCallBack')
end

function DianQuanHuanJinBi_TipMsg(Param1,Param2)
	local zuigaojiage = API_GetBrousePriceByMaterialID(80082,0,0)
	if zuigaojiage ~= 0 then
		zuigaojiage = zuigaojiage * 100
		API_ActorBroadcastMsgEx(-1,-1,0,5,'现在去交易所购买金币，每 100点券 可以换取 '..zuigaojiage..' 金币。')
	end
end

GLOBAL_AD_MapIDList={1,2,3,4,5,6,10,15,16,18,20,21,32,33,9,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,75,76,77,78,79,80,81,82,91,92}

function DianQuanHuanJinBi_TipWindowsCallBack(Param1,Param2)
	local zuigaojiage = API_GetBrousePriceByMaterialID(80082,0,0)
	if zuigaojiage ~= 0 then
		for i in GLOBAL_AD_MapIDList do
			local MapID = GLOBAL_AD_MapIDList[i]
			local RightMapID = API_GetRightMapID(MapID)
			API_ActorCallBack(RightMapID,1,-1,'DianQuanHuanJinBi_TipWindows')
		end
	end
end

function DianQuanHuanJinBi_TipWindows(ActorID)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel >= 6 then
		local zuigaojiage = API_GetBrousePriceByMaterialID(80082,0,0)
		if zuigaojiage ~= 0 then
			zuigaojiage = zuigaojiage * 100
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win ntype="3" rect="530,-2,275,168" balpha="0"></win>')
			API_ResponseWrite('<img srcgd="80082" tipgd="80082"><text>现在去交易所换取金币，每 </text><a underline="1" tip="点击此处进行点券充值" closewindow="0" http="http://pay.21mmo.com/">100点券</a><text> 可以换取 </text><text color="255,0,255">'..zuigaojiage..'</text><text> 金币。</text><br>')
			API_ResponseWrite('<br><a href="DianQuanHuanJinBi_OpenBourse?1=1" closewindow="0">出售点券换金币</a><br>')
			API_ResponseWrite('<br><a href="DianQuanHuanJinBi_OpenBourse?1=2" closewindow="0">用金币购买点券</a><br>')
			API_ResponseFlush(ActorID)
		end
	end
end

function DianQuanHuanJinBi_OpenBourse()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	API_OpenBourse(ActorID)
	if SelectItem == 1 then
		API_WindowOnEventII(ActorID,507,211,80082,1)
	elseif SelectItem == 2 then
		API_WindowOnEventII(ActorID,507,211,80082,0)
	end
end

function DianQuanHuanJinBi_OnLogin()
--	local ActorID = API_RequestGetActorID()
--	local MapID = API_GetActorMapID(ActorID)
--	local StaticMapID = API_GetStaticMapID(MapID)
--	if MapID == StaticMapID then
--		local MapConfigID = API_GetMapConfigID(MapID)
----		for i in GLOBAL_AD_MapIDList do
----			if GLOBAL_AD_MapIDList[i] == MapConfigID then
----				DianQuanHuanJinBi_TipWindows(ActorID)
----				break
----			end
----		end
--	end
end
