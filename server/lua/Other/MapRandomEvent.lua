----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\MapRandomEvent.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2009-3-16
--版  本:	1.0
--描  述:	地表随机事件
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：万钰林
--日期：2009-3-16
--功能：创建
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--进入地图创建时间触发器30秒，杀怪触发器

--19050 存储时间触发器
--19051 存储杀怪触发器
--19052 存储杀怪时间
--19053 存储玩家嫌疑值
--19054 存储时间回调判断 临时
--19055 存储玩家随机事件的编号，未完成次随机事件不清除，事件完成后才清除，不能用下线的方式躲避，上线后继续事件
--19056 存储事件二的时间回调次数 临时
--19057 存储事件触发器回调ID

--19098 存储地下城杀怪掉装备触发器ID

function MapRandomEvent_OnLogin()
	local ActorID = API_RequestGetActorID()
	if ActorID <= 200 then
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if Week == 6 or Week == 7 then
		if Hour >= 19 and Hour <22 then
			if MapConfigID == 100 then
				return
			end
		end
	end
	for i,v in pairs(MapRandomEvent_MapIDTable) do
		if MapConfigID == v then
			--时间回调
--~ 			local MapRandomEvent_TimeTriggerID = API_VarDataGetNumber(ActorID,1,19050)
--~ 			if MapRandomEvent_TimeTriggerID ~= 0 then
--~ 				API_DestroyTrigger(ActorID,-1,MapRandomEvent_TimeTriggerID)
--~ 			end
--~ 			MapRandomEvent_TimeTriggerID = API_CreateTimerTrigger(ActorID,MapRandomEvent_TimeCallFunc,-1,-1,'MapRandomEvent_Time_CallFuncName')
--~ 			API_VarDataSetNumber(ActorID,1,19050,MapRandomEvent_TimeTriggerID)
			--杀怪触发器
			local MapRandomEvent_KillMonsterTriggerID = API_VarDataGetNumber(ActorID,1,19051)
			if MapRandomEvent_KillMonsterTriggerID ~= 0 then
				API_DestroyTrigger(ActorID,-1,MapRandomEvent_KillMonsterTriggerID)
			end
			MapRandomEvent_KillMonsterTriggerID =  API_CreateKillMonsterTrigger(ActorID,0,-1,0,0,-1,'MapRandomEvent_KillMonster_CallFuncName')
			API_VarDataSetNumber(ActorID,1,19051,MapRandomEvent_KillMonsterTriggerID)
			break
		end
	end
	--地下城杀怪掉装备
	for j,v in pairs(KillMonsterDropGoodsMapTab) do
		if MapConfigID == v then
			local KillMonsterDropGoods_TriggerID = API_VarDataGetNumber(ActorID,1,19098)
			if KillMonsterDropGoods_TriggerID ~= 0 then
				API_DestroyTrigger(ActorID,-1,KillMonsterDropGoods_TriggerID)
			end
			KillMonsterDropGoods_TriggerID = API_CreateKillMonsterTrigger(ActorID,0,-1,0,0,-1,'KillMonsterDropGoods_CallFunc')
			API_VarDataSetNumber(ActorID,1,19098,KillMonsterDropGoods_TriggerID)
			break
		end
	end
	--判断事件是否已经执行完，没执行完就继续执行
--~ 	local RandomEventNum = API_VarDataGetNumber(ActorID,1,19055)
--~ 	if RandomEventNum > 0 then
--~ 		if MapRandomEvent_EventTable[RandomEventNum] ~= nil then
--~ 			local RDfunc = MapRandomEvent_EventTable[RandomEventNum].HSM
--~ 			if type(RDfunc) == 'string' then	
--~ 				local Function = _G[RDfunc]
--~ 				if type(Function) == 'function' then
--~ 					Function(ActorID,MapID)
--~ 				end
--~ 			end
--~ 		end
--~ 	end
end

function MapRandomEvent_OnLogout()
	local ActorID = API_RequestGetActorID()
	if ActorID <= 200 then
		return
	end
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	--for i,v in MapRandomEvent_MapIDTable do
	--	if MapConfigID == v then
--~ 			local MapRandomEvent_TimeTriggerID = API_VarDataGetNumber(ActorID,1,19050)
--~ 			API_DestroyTrigger(ActorID,-1,MapRandomEvent_TimeTriggerID)
--~ 			API_VarDataSetNumber(ActorID,1,19050,0)
			local MapRandomEvent_KillMonsterTriggerID = API_VarDataGetNumber(ActorID,1,19051)
			API_DestroyTrigger(ActorID,-1,MapRandomEvent_KillMonsterTriggerID)
			API_VarDataSetNumber(ActorID,1,19051,0)
			--清除事件回调触发器
			local HuiDiao = API_VarDataGetNumber(ActorID,1,19057)
			if HuiDiao ~= 0 then
				API_DestroyTrigger(ActorID,-1,HuiDiao)
			end
			API_VarDataSetNumber(ActorID,1,19057,0)
			--地下城杀怪掉装备
			local KillMonsterDropGoods_TriggerID = API_VarDataGetNumber(ActorID,1,19098)
			if KillMonsterDropGoods_TriggerID ~= 0 then
				API_DestroyTrigger(ActorID,-1,KillMonsterDropGoods_TriggerID)
			end
			API_VarDataSetNumber(ActorID,1,19098,0)
	--		break
	--	end
	--end
	if MapConfigID == 1993 then
		if MapRandomEvent_EventNpcTable[MapID] ~= nil then
			local a = table.getn(MapRandomEvent_EventNpcTable[MapID])
			if a > 1 then
				for i = 1,a do
					local FastID = MapRandomEvent_EventNpcTable[MapID][i]
					if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
						API_DestroyMonster(FastID)
					end
				end
			end
		end
		MapRandomEvent_EventNpcTable[MapID] = nil
		API_DestroyEctype(MapID)
	end
end

function MapRandomEvent_OnLoginMap()
	local ActorID = API_RequestGetActorID()
	if ActorID <= 200 then
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if Week == 6 or Week == 7 then
		if Hour >= 19 and Hour <22 then
			if MapConfigID == 100 then
				return
			end
		end
	end
	for i,v in pairs(MapRandomEvent_MapIDTable) do
		if MapConfigID == v then
			--时间回调
--~ 			local MapRandomEvent_TimeTriggerID = API_VarDataGetNumber(ActorID,1,19050)
--~ 			if MapRandomEvent_TimeTriggerID ~= 0 then
--~ 				API_DestroyTrigger(ActorID,-1,MapRandomEvent_TimeTriggerID)
--~ 			end
--~ 			MapRandomEvent_TimeTriggerID = API_CreateTimerTrigger(ActorID,MapRandomEvent_TimeCallFunc,-1,-1,'MapRandomEvent_Time_CallFuncName')
--~ 			API_VarDataSetNumber(ActorID,1,19050,MapRandomEvent_TimeTriggerID)
			--杀怪触发器
			local MapRandomEvent_KillMonsterTriggerID = API_VarDataGetNumber(ActorID,1,19051)
			if MapRandomEvent_KillMonsterTriggerID ~= 0 then
				API_DestroyTrigger(ActorID,-1,MapRandomEvent_KillMonsterTriggerID)
			end
			MapRandomEvent_KillMonsterTriggerID =  API_CreateKillMonsterTrigger(ActorID,0,-1,0,0,-1,'MapRandomEvent_KillMonster_CallFuncName')
			API_VarDataSetNumber(ActorID,1,19051,MapRandomEvent_KillMonsterTriggerID)
			break
		end
	end
	--地下城杀怪掉装备
	for j,v in pairs(KillMonsterDropGoodsMapTab) do
		if MapConfigID == v then
			local KillMonsterDropGoods_TriggerID = API_VarDataGetNumber(ActorID,1,19098)
			if KillMonsterDropGoods_TriggerID ~= 0 then
				API_DestroyTrigger(ActorID,-1,KillMonsterDropGoods_TriggerID)
			end
			KillMonsterDropGoods_TriggerID = API_CreateKillMonsterTrigger(ActorID,0,-1,0,0,-1,'KillMonsterDropGoods_CallFunc')
			API_VarDataSetNumber(ActorID,1,19098,KillMonsterDropGoods_TriggerID)
			break
		end
	end
	--判断事件是否已经执行完，没执行完就继续执行
--~ 	local RandomEventNum = API_VarDataGetNumber(ActorID,1,19055)
--~ 	if RandomEventNum > 0 then
--~ 		if MapConfigID ~= 1993 then
--~ 			if MapRandomEvent_EventTable[RandomEventNum] ~= nil then
--~ 				local RDfunc = MapRandomEvent_EventTable[RandomEventNum].HSM
--~ 				if type(RDfunc) == 'string' then	
--~ 					local Function = _G[RDfunc]
--~ 					if type(Function) == 'function' then
--~ 						Function(ActorID,MapID)
--~ 					end
--~ 				end
--~ 			end
--~ 		end
--~ 	end
end

function MapRandomEvent_OnLogoutMap()
	local ActorID = API_RequestGetActorID()
	if ActorID <= 200 then
		return
	end
	--local MapID = API_GetActorMapID(ActorID)
	--local MapConfigID = API_GetMapConfigID(MapID)
	--for i,v in MapRandomEvent_MapIDTable do
	--	if MapConfigID == v then
--~ 			local MapRandomEvent_TimeTriggerID = API_VarDataGetNumber(ActorID,1,19050)
--~ 			API_DestroyTrigger(ActorID,-1,MapRandomEvent_TimeTriggerID)
--~ 			API_VarDataSetNumber(ActorID,1,19050,0)
			local MapRandomEvent_KillMonsterTriggerID = API_VarDataGetNumber(ActorID,1,19051)
			API_DestroyTrigger(ActorID,-1,MapRandomEvent_KillMonsterTriggerID)
			API_VarDataSetNumber(ActorID,1,19051,0)
			--离开地图清除嫌疑值
			--API_VarDataSetNumber(ActorID,1,19053,0)
			--API_VarDataSetNumber(ActorID,1,19055,0)
			--清除事件回调触发器
			local HuiDiao = API_VarDataGetNumber(ActorID,1,19057)
			if HuiDiao ~= 0 then
				API_DestroyTrigger(ActorID,-1,HuiDiao)
			end
			API_VarDataSetNumber(ActorID,1,19057,0)
			--地下城杀怪掉装备
			local KillMonsterDropGoods_TriggerID = API_VarDataGetNumber(ActorID,1,19098)
			if KillMonsterDropGoods_TriggerID ~= 0 then
				API_DestroyTrigger(ActorID,-1,KillMonsterDropGoods_TriggerID)
			end
			API_VarDataSetNumber(ActorID,1,19098,0)
	--		break
	--	end
	--end
end

--时间触发器，判断杀怪时间间隔，加嫌疑值，如果嫌疑值达到多少，那么就随机事件
function MapRandomEvent_Time_CallFuncName(ActorID,b)
	local MapID = API_GetActorMapID(ActorID) 
	local MapConfigID = API_GetMapConfigID(MapID) 
	if MapConfigID == 10 or MapConfigID == 23 then
		return
	end
	local Time = os.time()
	local PlayTime = API_VarDataGetNumber(ActorID,1,19052)
	local TimeNum = API_VarDataGetNumber(ActorID,0,19054)
	API_VarDataSetNumber(ActorID,0,19054,TimeNum+1)
	if Time - PlayTime <= MapRandomEvent_KillMonsterTime then
		local XianYiZhi = API_VarDataGetNumber(ActorID,1,19053)
		API_VarDataSetNumber(ActorID,1,19053,XianYiZhi+MapRandomEvent_AddXianYiZhi)
	else
		local XianYiZhi = API_VarDataGetNumber(ActorID,1,19053)
		if XianYiZhi >= MapRandomEvent_KouChuXianYiZhi then
			API_VarDataSetNumber(ActorID,1,19053,XianYiZhi-MapRandomEvent_KouChuXianYiZhi)
		end
	end
	local TimeNum2 = API_VarDataGetNumber(ActorID,0,19054)
	if TimeNum2 == 2 then
		local XianYiZhi = API_VarDataGetNumber(ActorID,1,19053)
		API_VarDataSetNumber(ActorID,1,19053,XianYiZhi+MapRandomEvent_AddXianYiZhi)
	elseif TimeNum2 >= 4 then
		local XianYiZhi = API_VarDataGetNumber(ActorID,1,19053)
		API_VarDataSetNumber(ActorID,1,19053,XianYiZhi+MapRandomEvent_AddXianYiZhi)
		API_VarDataSetNumber(ActorID,0,19054,0)
		local XianYiZhi2 = API_VarDataGetNumber(ActorID,1,19053)
		if XianYiZhi2 > MapRandomEvent_RandomXianYiZhi then
			local RandomEventNum = API_VarDataGetNumber(ActorID,1,19055)
			if RandomEventNum == 0 then
				local XianYiZhi3 = XianYiZhi2 - MapRandomEvent_RandomXianYiZhi
				local ChuFaJiLv = math.random(100)
				if ChuFaJiLv <= XianYiZhi3 then
					local MapID = API_GetActorMapID(ActorID)
					--选择事件编号，从最小编号到最大编号，可通过配置文件修改
					local RandomNum = 4
					if XianYiZhi3 >= MapRandomEvent_RandomEventNum then
						RandomNum = math.random(MapRandomEvent_RandomNumMin,MapRandomEvent_RandomNumMax)
					end
					--此处可以插入额外判断，比如地图是哪，那么就固定执行某个事件编号
					--if mapid == 123 then randomnum = 123 end
					if MapRandomEvent_EventTable[RandomNum] == nil then
						return
					end
					local RDfunc = MapRandomEvent_EventTable[RandomNum].HSM
					if type(RDfunc) == 'string' then	
						local Function = _G[RDfunc]
						if type(Function) == 'function' then
							--执行随机函数，传入参数
							Function(ActorID,MapID)
							API_VarDataSetNumber(ActorID,1,19055,RandomNum)
						end
					end
					--执行事件，清除嫌疑值
					API_VarDataSetNumber(ActorID,1,19053,0)
				end
			end
		end

	end
end

--杀怪触发器，记录杀怪时间
function MapRandomEvent_KillMonster_CallFuncName(ActorID,b,MonsterID,MapID,PosX,PosY)
	local Time = os.time()
	API_VarDataSetNumber(ActorID,1,19052,Time)
	local RD = math.random(100)
	if RD == 1 then
		local MapID = API_GetActorMapID(ActorID)
		local MapConfigID = API_GetMapConfigID(MapID)
		if MapConfigID ~= 100 and MapConfigID ~= 101 and MapConfigID ~= 10 and MapConfigID ~= 23 then
--~ 			local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
			API_CreateDropGoods(MapID, PosX,PosY, 80196, 1, 3, '地表打怪掉分解', 0, ActorID, 600, 120)
		end
	end
	MapRandomEvent_Treasure(ActorID,b,MonsterID,MapID,PosX,PosY)
end

function KillMonsterDropGoods_CallFunc(ActorID,b,MonsterID,MapID,PosX,PosY)
	local RD = math.random(100)
	local a = 1
--~ 	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
--~ 	if MapConfigID == 10 or MapConfigID == 23 or MapConfigID == 103 or MapConfigID == 122 then
--~ 		a = 3
--~ 	end
	if RD <= a then
		if KillMonsterDropGoodsMapType[MapConfigID] ~= nil then
			local Type = KillMonsterDropGoodsMapType[MapConfigID]
			local GoodsID = YXD_WorldDropGoodsTab[Type][math.random(table.getn(YXD_WorldDropGoodsTab[Type]))]
--~ 			local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
			local PinZhi = 2
			if math.random(100) <= 5 and MapConfigID ~= 10 and MapConfigID ~= 23 and MapConfigID ~= 103 and MapConfigID ~= 122 then
				PinZhi = 7
			end
			API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,1,1,'地下城杀怪掉装备',4,ActorID,600,120,PinZhi)
			if PinZhi == 7 then
				--记录风向标
				local LeiBie = 1
				if Type == 9 then 
					LeiBie = 2
				end
				local LaiYuan = 1
				if GLOBAL_FengXiangBiao_DateList[49][LeiBie][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[49][LeiBie][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[49][LeiBie][LaiYuan] = GLOBAL_FengXiangBiao_DateList[49][LeiBie][LaiYuan] + 1
				end
			end
		end
	end
	MapRandomEvent_Treasure(ActorID,b,MonsterID,MapID,PosX,PosY)
	--[[
	if MapConfigID == 128 or MapConfigID == 129 or MapConfigID == 130 then
		if math.random(100) == 1 then
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
			if Hour >= 19 and Hour < 23 then
				local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
				API_CreateDropGoods(MapID,PlayX,PlayY,88940,1,1,'无序地宫掉战功卷轴',0,ActorID,600,120)
			end
		end
	end
	]]
end

--杀怪掉藏宝图碎片
function MapRandomEvent_Treasure(ActorID,b,MonsterID,MapID,PosX,PosY)
	local MapConfigID = API_GetMapConfigID(MapID)
	if SearchTreasure_DropMap[MapConfigID] ~= nil then
		local RD = math.random(10000)
		local a = 1
		if RD <= a then
			local SuiPianID = SearchTreasure_DropMap[MapConfigID][math.random(table.getn(SearchTreasure_DropMap[MapConfigID]))]
			API_CreateDropGoods(MapID, PosX,PosY, SuiPianID, 1, 0, '地表打怪掉藏宝图', 0, ActorID, 600, 120)
		end
	end
end

--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件一★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--出现强力怪物攻击玩家，玩家逃跑到一定的范围后，怪物消失
function MapRandomEvent_RandomEvent1(ActorID,MapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	if API_GetMapConfigID(MapID) == 98 then
		if ((PlayX > 326 and PlayX < 442) and (PlayY > 319 and PlayY < 441)) then
			API_VarDataSetNumber(ActorID,1,19055,0)
			return
		end
	end
	local MonsterID = 726176
	local X,Y
	local Num = 0
	repeat
		Num = Num + 1
		X = math.random(PlayX-3,PlayX+3)
		Y = math.random(PlayY-3,PlayY+3)
	until not API_IsBlockTile(MapID,X,Y,0) or Num == 50
	local FastID = API_CreateMonster(MapID,MonsterID,X,Y,4,0,-1)
	if FastID > 0 then
		API_AddMagicToMap(MapID,X,Y, 134)
		API_ActorSendMsg(ActorID,3,''..API_GetMonsterNameByID(MonsterID)..'出现了，赶紧逃啊……')
		API_CreateTimerTriggerG(ActorID,FastID,2,-1,'MapRandomEvent_RandomEvent1_Event')
		MapRandomEvent_MonsterTable[FastID] = {}
		MapRandomEvent_MonsterTable[FastID][1] = X
		MapRandomEvent_MonsterTable[FastID][2] = Y
	end
	local LaiYuan = API_ActorGetPropNum(ActorID,201)
	local Type = 1
	if GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] == nil then
		GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = 1
	else
		GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] + 1
	end
end
function MapRandomEvent_RandomEvent1_Event(ActorID,FastID)
	local TriggerGID = API_GetCurTriggerID()
	if API_ActorIsOnline(ActorID) then
		local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
		local X,Y = PublicFun_GetMonsterPosXY(FastID)
		local JuLi = PublicFun_AccountDistance(PlayX,PlayY,X,Y)
		local FX,FY
		if MapRandomEvent_MonsterTable[FastID] ~= nil then
			FX = MapRandomEvent_MonsterTable[FastID][1]
			FY = MapRandomEvent_MonsterTable[FastID][2]
		end
		local FJuLi = PublicFun_AccountDistance(FX,FY,X,Y)
		if JuLi >= MapRandomEvent_RandomEvent1_JuLi or FJuLi >= MapRandomEvent_RandomEvent1_JuLi then
			API_ActorSendMsg(ActorID,3,'呼~~终于逃离了'..API_GetMonsterName(FastID)..'的魔爪，安全了……')
			MapRandomEvent_ClearUp(ActorID)
			API_DestroyMonster(FastID)
			MapRandomEvent_RandomEventJiangLi(ActorID)
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type = 2
			if GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] + 1
			end
			MapRandomEvent_MonsterTable[FastID] = nil
			API_DestroyTriggerG(TriggerGID)
		end
	else
		API_DestroyMonster(FastID)
		API_DestroyTriggerG(TriggerGID)
	end
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件二★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--玩家被雷击中，攻击力减少90%，持续十分钟
--增加删除BUFF事件
function MapRandomEvent_RandomEvent2(ActorID,MapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	for i = 133,134 do
		API_AddMagicToMap(MapID,PlayX,PlayY, i)
	end
	API_VarDataSetNumber(ActorID,0,19056,0)
	API_ActorSendMsg(ActorID,3,'天呐，你被雷劈中了……')
	API_ActorSendMsg(ActorID,3,'你的战斗力被削弱了')
	API_ActorAddStatus(ActorID,671001,-1) --减攻90%
	local HuiDiao = API_VarDataGetNumber(ActorID,1,19057)
	if HuiDiao ~= 0 then
		API_DestroyTrigger(ActorID,-1,HuiDiao)
	end
	HuiDiao = API_CreateTimerTrigger(ActorID,3,-1,-1,'MapRandomEvent_RandomEvent2_Event') 
	API_VarDataSetNumber(ActorID,1,19057,HuiDiao)
	local LaiYuan = API_ActorGetPropNum(ActorID,201)
	local Type = 3
	if GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] == nil then
		GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = 1
	else
		GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] + 1
	end
end
function MapRandomEvent_RandomEvent2_Event(ActorID,b)
	--local TriggerGID = API_GetCurTriggerID()
	if API_ActorFindStatus(ActorID,671) then
	else
		API_ActorAddStatus(ActorID,671001,-1) --减攻90%
	end
	local MapID = API_GetActorMapID(ActorID) 
	local MapConfigID = API_GetMapConfigID(MapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID) 
	API_AddMagicToMap(MapID,PlayX,PlayY, 132)
	local TimeNum = API_VarDataGetNumber(ActorID,0,19056)
	API_VarDataSetNumber(ActorID,0,19056,TimeNum+1)
	local TimeNum2 = API_VarDataGetNumber(ActorID,0,19056)
	local CampID = API_GetActorCamp(ActorID)
	--15秒一次提示
	if math.mod(TimeNum2,MapRandomEvent_RandomTiShiTime) == 0 then
		if MapRandomEvent_NPCTable[MapConfigID] ~= nil then
			local SunFlowerFID = MapRandomEvent_NPCTable[MapConfigID].SunFlowerFID
			if API_GetMonsterID(SunFlowerFID) > 0 then
				local SunFX = MapRandomEvent_NPCTable[MapConfigID].SunFX
				local SunFY = MapRandomEvent_NPCTable[MapConfigID].SunFY
				local JuLi = PublicFun_AccountDistance(PlayX,PlayY,SunFX,SunFY)
				local FangXiang = PublicFun_AccountDirection(PlayX,PlayY,SunFX,SunFY)
				if JuLi > 3 then
					API_OpenArrowDir(ActorID,SunFX,SunFY,5)
					API_ActorSendMsg(ActorID,3,'在你的'..FangXiang..'方['..API_TileToPixelX(MapConfigID,SunFX,SunFY)..','..API_TileToPixelY(MapConfigID,SunFX,SunFY)..']有一朵'..API_GetMonsterName(SunFlowerFID)..'，吃了它就能恢复正常')
				end
			end
		else
			if CampID == 0 then
				API_ActorSendMsg(ActorID,3,'在落日农庄上有一朵神奇的太阳花，找到它也许可以帮助你')
			elseif CampID == 1 then
				API_ActorSendMsg(ActorID,3,'在娜纱湿地上有一朵神奇的太阳花，找到它也许可以帮助你')
			end
		end
	end
	--if TimeNum2 == 300 then
	--	API_ActorSendMsg(ActorID,3,'终于恢复正常了')
	--	API_ActorRemoveStatus(ActorID,671001)
	--	MapRandomEvent_ClearUp(ActorID)
	--	API_DestroyTrigger(ActorID,-1,TriggerGID)
	--end
end
function MapRandomEvent_RandomEvent2_NPCEvent(ActorID,NPCID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local NPCX,NPCY = PublicFun_GetMonsterPosXY(NPCFastID)
	local JuLi = PublicFun_AccountDistance(PlayX,PlayY,NPCX,NPCY)
	local RandomNum = API_VarDataGetNumber(ActorID,1,19055)
	if RandomNum == 2 then
		if JuLi <= 3 then
			local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
			if ConvectionInfo ~= 0 then
				API_ActorSendMsg(ActorID,3,''..API_GetMonsterNameByID(NPCID)..'使用中，请稍后')
			else
				local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
				local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
				local TimerTriggerID = API_CreateTimerTriggerG(ActorID,NPCFastID,1,MapRandomEvent_EatFlowerTime+2,'MapRandomEvent_RandomEvent2_NPCEvent_TimerTriggerCallFunc')
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
				local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(MapRandomEvent_EatFlowerTime)
				API_ActorSendMsg(ActorID,3,''..API_GetMonsterNameByID(NPCID)..'使用中……，需时'..GLOBAL_ConvectionTimerCN..'秒，使用期间请不要移动，否则将使用失败')
				StatusTimer = (MapRandomEvent_EatFlowerTime + 1) * 1000
				API_ActorAddStatus(ActorID,36003,StatusTimer)
				API_ActorShowProcess(ActorID,StatusTimer,410,360,'使用'..API_GetMonsterNameByID(NPCID)..'')
			end
		else
			API_ActorSendMsg(ActorID,3,'距离太远，靠近点再试试')
		end
	end
	API_ResponseEnd()
	API_ResponseClear()
end
function MapRandomEvent_RandomEvent2_NPCEvent_TimerTriggerCallFunc(ActorID,NPCFastID)
	if API_ActorIsOnline(ActorID) then
		--判断玩家是否死亡
		if API_ActorIsDying(ActorID) then
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			return
		end
		local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
		ConvectionInfo = math.mod(ConvectionInfo,1000000000)
		local ConvectionSign = math.floor(ConvectionInfo/100000000)
		local BackTileXYandTime = math.mod(ConvectionInfo,100000000)
		local BackTileYandTime = math.mod(BackTileXYandTime,100000)
		local BackTileX = math.floor(BackTileXYandTime/100000)
		local BackTileY = math.floor(BackTileYandTime/100)
		local Time = math.mod(BackTileYandTime,100)
		local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
		if TileX ~= BackTileX or TileY ~= BackTileY then
			API_ActorSendMsg(ActorID,3,'人物移动，使用失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'使用'..API_GetMonsterName(NPCFastID)..'')
		elseif Time >= MapRandomEvent_EatFlowerTime then
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'使用'..API_GetMonsterName(NPCFastID)..'')
			--删除当前NPC，删除玩家触发器，清除嫌疑值，删除状态
			local MapID = API_GetActorMapID(ActorID) 
			local MapConfigID = API_GetMapConfigID(MapID)
			if MapRandomEvent_NPCTable[MapConfigID] ~= nil then
				local SunFlowerFID = MapRandomEvent_NPCTable[MapConfigID].SunFlowerFID
				if SunFlowerFID == NPCFastID then
					API_DestroyMonster(NPCFastID)
					local HuiDiao = API_VarDataGetNumber(ActorID,1,19057)
					if HuiDiao ~= 0 then
						API_DestroyTrigger(ActorID,-1,HuiDiao)
					end
					API_ActorRemoveStatus(ActorID,671001)
					MapRandomEvent_ClearUp(ActorID)
					API_ActorSendMsg(ActorID,3,'终于恢复正常了')
					MapRandomEvent_RandomEventJiangLi(ActorID)
					--再刷个花
					local SunFlowerID = MapRandomEvent_NPCTable[MapConfigID].SunFlowerID
					local SunX1 = MapRandomEvent_NPCTable[MapConfigID].SunX1
					local SunX2 = MapRandomEvent_NPCTable[MapConfigID].SunX2
					local SunY1 = MapRandomEvent_NPCTable[MapConfigID].SunY1
					local SunY2 = MapRandomEvent_NPCTable[MapConfigID].SunY2
					local X1,Y1
					local Num = 0
					repeat
						Num = Num + 1
						X1 = math.random(SunX1,SunX2)
						Y1 = math.random(SunY1,SunY2)
					until not API_IsBlockTile(MapConfigID,X1,Y1,0) or Num == 50
					local SunFID = API_CreateMonster(MapConfigID,SunFlowerID,X1,Y1,4,0,-1)
					if SunFID > 0 then
						MapRandomEvent_NPCTable[MapConfigID].SunFlowerFID = SunFID
						MapRandomEvent_NPCTable[MapConfigID].SunFX = X1
						MapRandomEvent_NPCTable[MapConfigID].SunFY = Y1
					end
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					local Type = 4
					if GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] + 1
					end
				end
			end
		else
			Time = Time + 1
			ConvectionInfo = ConvectionSign * 100000000 + TileX * 100000 + TileY * 100 + Time
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
		end
	end
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件三★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--玩家被雷击中，变成小动物，无法攻击
--增加删除变身事件
function MapRandomEvent_RandomEvent3(ActorID,MapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	for i = 133,134 do
		API_AddMagicToMap(MapID,PlayX,PlayY, i)
	end
	API_VarDataSetNumber(ActorID,0,19056,0)
	API_ActorSendMsg(ActorID,3,'天呐，你被雷劈中了……')
	API_ActorSendMsg(ActorID,3,'你变成了小动物')
	API_ActorAddStatus(ActorID,303001,-1) --变成动物，无法攻击
	local HuiDiao = API_VarDataGetNumber(ActorID,1,19057)
	if HuiDiao ~= 0 then
		API_DestroyTrigger(ActorID,-1,HuiDiao)
	end
	HuiDiao = API_CreateTimerTrigger(ActorID,3,-1,-1,'MapRandomEvent_RandomEvent3_Event') 
	API_VarDataSetNumber(ActorID,1,19057,HuiDiao)
	local LaiYuan = API_ActorGetPropNum(ActorID,201)
	local Type = 5
	if GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] == nil then
		GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = 1
	else
		GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] + 1
	end
end
function MapRandomEvent_RandomEvent3_Event(ActorID,b)
	--local TriggerGID = API_GetCurTriggerID()
	if API_ActorFindStatus(ActorID,303) then
	else
		API_ActorAddStatus(ActorID,303001,-1) --变成动物，无法攻击
	end
	local MapID = API_GetActorMapID(ActorID) 
	local MapConfigID = API_GetMapConfigID(MapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID) 
	API_AddMagicToMap(MapID,PlayX,PlayY, 132)
	local TimeNum = API_VarDataGetNumber(ActorID,0,19056)
	API_VarDataSetNumber(ActorID,0,19056,TimeNum+1)
	local TimeNum2 = API_VarDataGetNumber(ActorID,0,19056)
	local CampID = API_GetActorCamp(ActorID)
	--15秒一次提示
	if math.mod(TimeNum2,MapRandomEvent_RandomTiShiTime) == 0 then
		if MapRandomEvent_NPCTable[MapConfigID] ~= nil then
			local ShouShouFID = MapRandomEvent_NPCTable[MapConfigID].ShouShouFID
			if API_GetMonsterID(ShouShouFID) > 0 then
				local ShouFX = MapRandomEvent_NPCTable[MapConfigID].ShouFX
				local ShouFY = MapRandomEvent_NPCTable[MapConfigID].ShouFY
				local JuLi = PublicFun_AccountDistance(PlayX,PlayY,ShouFX,ShouFY)
				local FangXiang = PublicFun_AccountDirection(PlayX,PlayY,ShouFX,ShouFY)
				if JuLi > 3 then
					API_OpenArrowDir(ActorID,ShouFX,ShouFY,5)
					API_ActorSendMsg(ActorID,3,'在你的'..FangXiang..'方['..API_TileToPixelX(MapConfigID,ShouFX,ShouFY)..','..API_TileToPixelY(MapConfigID,ShouFX,ShouFY)..']有一个'..API_GetMonsterName(ShouShouFID)..'，找它对话可以帮你恢复正常')
				end
			end
		else
			if CampID == 0 then
				API_ActorSendMsg(ActorID,3,'在落日农庄上有一只神奇的兽兽，找到它也许可以帮助你')
			elseif CampID == 1 then
				API_ActorSendMsg(ActorID,3,'在娜纱湿地上有一只神奇的兽兽，找到它也许可以帮助你')
			end
		end
	end
	--if TimeNum2 == 300 then
	--	API_ActorSendMsg(ActorID,3,'终于恢复正常了')
	--	API_ActorRemoveStatus(ActorID,303001)
	--	MapRandomEvent_ClearUp(ActorID)
	--	API_DestroyTrigger(ActorID,-1,TriggerGID)
	--end
end
function MapRandomEvent_RandomEvent3_NPCEvent(ActorID,NPCID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local NPCX,NPCY = PublicFun_GetMonsterPosXY(NPCFastID)
	local JuLi = PublicFun_AccountDistance(PlayX,PlayY,NPCX,NPCY)
	local RandomNum = API_VarDataGetNumber(ActorID,1,19055)
	if JuLi <= 3 then
		if RandomNum == 3 then
			API_ResponseWrite('<name>'..API_GetMonsterNameByID(NPCID)..'</name>')
			API_ResponseWrite('<br><text>一个奇怪的家伙，你想做什么？</text><br>')
			API_ResponseWrite('<br><br><a href="MapRandomEvent_RandomEvent3_NPCEventSay?1=1">请帮我解除变身</a><text>      </text>')
			API_ResponseWrite('<a>我点错了</a><br>')
			API_ResponseFlush(ActorID)
		elseif RandomNum == 4 then
			API_ResponseWrite('<name>'..API_GetMonsterNameByID(NPCID)..'</name>')
			API_ResponseWrite('<br><text>这里面有好多好多个光头啊，我两个手指头加两个脚趾头都数不过来了，你能帮我数一下有多少个光头吗？</text><br>')
			API_ResponseWrite('<br><br><a href="MapRandomEvent_RandomEvent3_NPCEventSay?1=2">我要出去</a><text>      </text>')
			API_ResponseWrite('<a>我点错了</a><br>')
			API_ResponseFlush(ActorID)
		else
			API_ResponseWrite('<name>'..API_GetMonsterNameByID(NPCID)..'</name>')
			API_ResponseWrite('<br><text>@￥@#%￥%……&#@￥@#￥……</text><br>')
			API_ResponseWrite('<br><text>（你完全听不懂它再说什么）</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
		end
	else
		API_ActorSendMsg(ActorID,3,'距离太远，靠近点再试试')
		API_ResponseEnd()
		API_ResponseClear()
	end
end
function MapRandomEvent_RandomEvent3_NPCEventSay()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local MapID = API_GetActorMapID(ActorID)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	if XuanZe == 1 then
		local NumMin = math.random(MapRandomEvent_Event3NumMin)
		local NumMax = math.random(MapRandomEvent_Event3NumMax)
		local DaAnNum = NumMin * NumMax
		API_ResponseWrite('<name>'..API_GetMonsterName(NPCFastID)..'</name>')
		API_ResponseWrite('<br><text>想解除变身？没问题，只要你能答对这个题目</text><br>')
		API_ResponseWrite('<br><text>'..NumMin..' × '..NumMax..' = </text>')
		API_ResponseWrite('<input type="number" name="3" bFilter="1" size="14" width="100"><br>')
		API_ResponseWrite('<br><br><a href="MapRandomEvent_RandomEvent3_NPCEventRight?1=1&2='..DaAnNum..'">回答</a><text>      </text>')
		API_ResponseWrite('<a>放弃</a><br>')
	elseif XuanZe == 2 then
		if MapRandomEvent_EventNpcTable[MapID] ~= nil then
			local RightNum = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Shimingnum)
			API_ResponseWrite('<name>'..API_GetMonsterName(NPCFastID)..'</name>')
			API_ResponseWrite('<br><text>什么，你要出去？那你先告诉我这里面有多少个光头。</text><br>')
			API_ResponseWrite('<input type="number" name="3" bFilter="1" size="3" width="100"><text>个</text><br>')
			API_ResponseWrite('<br><br><a href="MapRandomEvent_RandomEvent3_NPCEventRight?1=2&2='..RightNum..'">我告诉你</a><text>      </text>')
			API_ResponseWrite('<a>我再数数</a><br>')
		end
	end
end
function MapRandomEvent_RandomEvent3_NPCEventRight()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local RightNum = API_RequestGetNumber(2)
	local PlayNum = API_RequestGetNumber(3)
	local MapID = API_GetActorMapID(ActorID)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	if XuanZe == 1 then
		if RightNum == PlayNum then
			API_ResponseWrite('<name>'..API_GetMonsterName(NPCFastID)..'</name>')
			API_ResponseWrite('<br><text>居然让你答对了，好吧，我帮你解除变身。咒语：＠＃￥￥％＆＠￥！＠￥％…………</text><br>')
			API_ResponseWrite('<br><br><a>谢谢</a><br>')
			local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
			if ConvectionInfo ~= 0 then
				API_ActorSendMsg(ActorID,3,'解除变身中，请稍后')
			else
				local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
				local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
				local TimerTriggerID = API_CreateTimerTriggerG(ActorID,NPCFastID,1,MapRandomEvent_BianShenTime+1,'MapRandomEvent_RandomEvent3_NPCEvent_TimerTriggerCallFunc')
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
				local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(MapRandomEvent_BianShenTime)
				API_ActorSendMsg(ActorID,3,'解除变身中……，需时'..GLOBAL_ConvectionTimerCN..'秒，解除期间请不要移动，否则将解除失败')
				StatusTimer = (MapRandomEvent_BianShenTime + 1) * 1000
				API_ActorAddStatus(ActorID,36003,StatusTimer)
				API_ActorShowProcess(ActorID,StatusTimer,410,360,'解除变身')
			end
		else
			API_ResponseWrite('<name>'..API_GetMonsterName(NPCFastID)..'</name>')
			API_ResponseWrite('<br><text>这么简单的题目都不会，多看看书再来吧</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	elseif XuanZe == 2 then
		if MapRandomEvent_EventNpcTable[MapID] ~= nil then
			if RightNum == PlayNum then
				if NPCFastID ~= 0 then
					API_ResponseWrite('<name>'..API_GetMonsterName(NPCFastID)..'</name>')
				else
					API_ResponseWrite('<name></name>') 
				end
				API_ResponseWrite('<br><text>耶？好像真的是这么多也，好吧，放你出去吧，记得下次再来哦～</text><br>')
				API_ResponseWrite('<br><br><a>……好的</a><br>')
				MapRandomEvent_ClearUp(ActorID)
				MapRandomEvent_RandomEventJiangLi(ActorID)
				for i = 1,table.getn(MapRandomEvent_EventNpcTable[MapID]) do
					local FastID = MapRandomEvent_EventNpcTable[MapID][i]
					if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
						API_DestroyMonster(FastID)
					end
				end
				API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.CountDown,11)
				API_CreateTimerTriggerG(ActorID,MapID,1,11,'MapRandomEvent_RandomEvent4_GotoBackMapID')
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 8
				if GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] + 1
				end
			else
				API_ResponseWrite('<name></name>') 
				API_ResponseWrite('<win close="0" ntype="1" rect="140,130,290,155"></win>') 
				API_ResponseWrite('<text color="255,0,255">您已经连续挂机超过3小时！</text><br>') 
				API_ResponseWrite('<text>请在下面填写“此房间内有多少个</text><text color="255,0,255">光头</text><text>？”</text><br>') 
				API_ResponseWrite('<input type="number" name="3" bFilter="1" size="3" width="100"><text>个</text><br>') 
				API_ResponseWrite('<br><text>答对即可出去！</text><br>')
				API_ResponseWrite('<br><a href="MapRandomEvent_RandomEvent3_NPCEventRight?1=2&2='..RightNum..'">提交以上答案</a><text>      </text>') 
				API_ResponseFlush(ActorID)
				if NPCFastID ~= 0 then
					API_ResponseWrite('<name>'..API_GetMonsterName(NPCFastID)..'</name>')
				else
					API_ResponseWrite('<name></name>') 
				end
				API_ResponseWrite('<br><text>不对吧……我怎么数着不是这么多呢？</text><br>')
				API_ResponseWrite('<br><br><a>我再数数</a><br>')
			end
		end
	end
end
function MapRandomEvent_RandomEvent3_NPCEvent_TimerTriggerCallFunc(ActorID,NPCFastID)
	if API_ActorIsOnline(ActorID) then
		--判断玩家是否死亡
		if API_ActorIsDying(ActorID) then
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			return
		end
		local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
		ConvectionInfo = math.mod(ConvectionInfo,1000000000)
		local ConvectionSign = math.floor(ConvectionInfo/100000000)
		local BackTileXYandTime = math.mod(ConvectionInfo,100000000)
		local BackTileYandTime = math.mod(BackTileXYandTime,100000)
		local BackTileX = math.floor(BackTileXYandTime/100000)
		local BackTileY = math.floor(BackTileYandTime/100)
		local Time = math.mod(BackTileYandTime,100)
		local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
		if TileX ~= BackTileX or TileY ~= BackTileY then
			API_ActorSendMsg(ActorID,3,'人物移动，解除变身失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'解除变身')
		elseif Time >= MapRandomEvent_BianShenTime then
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'解除变身')
			--删除当前NPC，删除玩家触发器，清除嫌疑值，删除状态
			local MapID = API_GetActorMapID(ActorID) 
			local MapConfigID = API_GetMapConfigID(MapID)
			if MapRandomEvent_NPCTable[MapConfigID] ~= nil then
				local ShouShouFID = MapRandomEvent_NPCTable[MapConfigID].ShouShouFID
				if ShouShouFID == NPCFastID then
					API_DestroyMonster(NPCFastID)
					local HuiDiao = API_VarDataGetNumber(ActorID,1,19057)
					if HuiDiao ~= 0 then
						API_DestroyTrigger(ActorID,-1,HuiDiao)
					end
					API_ActorRemoveStatus(ActorID,303001)
					MapRandomEvent_ClearUp(ActorID)
					API_ActorSendMsg(ActorID,3,'终于恢复正常了')
					MapRandomEvent_RandomEventJiangLi(ActorID)
					--再刷个兽兽
					local ShouShouID = MapRandomEvent_NPCTable[MapConfigID].ShouShouID
					local ShouX1 = MapRandomEvent_NPCTable[MapConfigID].ShouX1
					local ShouX2 = MapRandomEvent_NPCTable[MapConfigID].ShouX2
					local ShouY1 = MapRandomEvent_NPCTable[MapConfigID].ShouY1
					local ShouY2 = MapRandomEvent_NPCTable[MapConfigID].ShouY2
					local X1,Y1
					local Num = 0
					repeat
						Num = Num + 1
						X1 = math.random(ShouX1,ShouX2)
						Y1 = math.random(ShouY1,ShouY2)
					until not API_IsBlockTile(MapConfigID,X1,Y1,0) or Num == 50
					local ShouFID = API_CreateMonster(MapConfigID,ShouShouID,X1,Y1,4,0,-1)
					if ShouFID > 0 then
						MapRandomEvent_NPCTable[MapConfigID].ShouShouFID = ShouFID
						MapRandomEvent_NPCTable[MapConfigID].ShouFX = X1
						MapRandomEvent_NPCTable[MapConfigID].ShouFY = Y1
					end
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					local Type = 6
					if GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] + 1
					end
				end
			end
		else
			Time = Time + 1
			ConvectionInfo = ConvectionSign * 100000000 + TileX * 100000 + TileY * 100 + Time
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
		end
	end
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件四★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
function MapRandomEvent_RandomEvent4(ActorID,MapID)
	local CampID = API_GetActorCamp(ActorID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	for i = 133,134 do
		API_AddMagicToMap(MapID,PlayX,PlayY, i)
	end
	API_ActorSendMsg(ActorID,3,'天呐，你被雷劈中了……')
	API_ActorSendMsg(ActorID,3,'被雷劈到禁闭空间……')
	local ObjectMapID = API_CreateEctype(1993,0)
	MapRandomEvent_EventNpcTable[ObjectMapID] = {}
	API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.Shimingnum,0)
	API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.Peerage,CampID)
	MapRandomEvent_RandomEvent4_Initialization(ObjectMapID)
	API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'MapRandomEvent_RandomEvent4_GotoObjectMapID')
	local LaiYuan = API_ActorGetPropNum(ActorID,201)
	local Type = 7
	if GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] == nil then
		GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = 1
	else
		GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[20][Type][LaiYuan] + 1
	end
end
function MapRandomEvent_RandomEvent4_Initialization(MapID)
	if not API_MapIsValid(MapID) then
		return
	end
	if MapRandomEvent_EventNpcTable[MapID] ~= nil then
		local SSTableChang = table.getn(MapRandomEvent_EventNpcTable[MapID])
		table.setn(MapRandomEvent_EventNpcTable[MapID],SSTableChang+1)
		local SSXuHao = table.getn(MapRandomEvent_EventNpcTable[MapID])
		local ShouShou = API_CreateMonster(MapID,11935,62,61,4,0,-1)
		MapRandomEvent_EventNpcTable[MapID][SSXuHao] = ShouShou
		API_SetMonsterName(ShouShou,'爱数数的', 2)
		API_CreateTimerTriggerG(MapID,ShouShou,15,50,'MapRandomEvent_RandomEvent4_ShouShouSpeak')
		local CampID = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
		local Monster1Num = math.random(MapRandomEvent_Event4Monster1Min,MapRandomEvent_Event4Monster1Max)
		local Monster2Num = math.random(MapRandomEvent_Event4Monster2Min,MapRandomEvent_Event4Monster2Max)
		local GDNum = 0
		for i = 1,Monster1Num do
			local x,y
			local Num = 0
			repeat
				Num = Num + 1
				x = math.random(57,83)
				y = math.random(42,80)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				GDNum = GDNum + 1
				local TableChang = table.getn(MapRandomEvent_EventNpcTable[MapID])
				table.setn(MapRandomEvent_EventNpcTable[MapID],TableChang+1)
				local XuHao = table.getn(MapRandomEvent_EventNpcTable[MapID])
				local FastID = API_CreateMonster(MapID,MapRandomEvent_Event4Monster1,x,y,4,0,CampID)
				API_SetMonsterName(FastID,'光头', 2)
				MapRandomEvent_EventNpcTable[MapID][XuHao] = FastID
				API_CreateTimerTriggerG(MapID,FastID,10,50,'MapRandomEvent_RandomEvent4_MonsterMove')
			end
		end
		API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.Shimingnum,GDNum)
		for i = 1,Monster2Num do
			local x,y
			local Num = 0
			repeat
				Num = Num + 1
				x = math.random(57,83)
				y = math.random(42,80)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				local TableChang = table.getn(MapRandomEvent_EventNpcTable[MapID])
				table.setn(MapRandomEvent_EventNpcTable[MapID],TableChang+1)
				local XuHao = table.getn(MapRandomEvent_EventNpcTable[MapID])
				local FastID = API_CreateMonster(MapID,MapRandomEvent_Event4Monster2,x,y,4,0,CampID)
				MapRandomEvent_EventNpcTable[MapID][XuHao] = FastID
				API_CreateTimerTriggerG(MapID,FastID,10,50,'MapRandomEvent_RandomEvent4_MonsterMove')
			end
		end
	end
end
function MapRandomEvent_RandomEvent4_GotoObjectMapID(ObjectMapID,ActorID)
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorIsOnline(ActorID) then
		API_ActorGoToMap(ActorID,ObjectMapID,64,61)
		local RightNum = API_GetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.Shimingnum)  
		API_ResponseWrite('<name></name>') 
		API_ResponseWrite('<win close="0" ntype="1" rect="140,130,290,155"></win>') 
		API_ResponseWrite('<text color="255,0,255">您已经连续挂机超过3小时！</text><br>') 
		API_ResponseWrite('<text>请在下面填写“此房间内有多少个</text><text color="255,0,255">光头</text><text>？”</text><br>') 
		API_ResponseWrite('<input type="number" name="3" bFilter="1" size="3" width="100"><text>个</text><br>') 
		API_ResponseWrite('<br><text>答对即可出去！</text><br>')
		API_ResponseWrite('<br><a href="MapRandomEvent_RandomEvent3_NPCEventRight?1=2&2='..RightNum..'">提交以上答案</a><text>      </text>') 
		API_ResponseFlush(ActorID)
	end
end
function MapRandomEvent_RandomEvent4_GotoBackMapID(ActorID,MapID)
	local TimerTriggerID = API_GetCurTriggerID()
	if not API_MapIsValid(MapID) then
		API_DestroyTriggerG(TimerTriggerID)
		return
	end
	local CountDown = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.CountDown)
	CountDown = CountDown - 1
	API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.CountDown,CountDown)
	if CountDown > 0 then
		local CountDownCN = PublicFun_ArabianNumberToChineseNumber(CountDown)
		API_ActorBroadcastMsg(MapID,1,''..CountDownCN..'')
	else
		API_DestroyTriggerG(TimerTriggerID)
		API_ActorGoToBackMap(ActorID)
		MapRandomEvent_EventNpcTable[MapID] = nil
		API_DestroyEctype(MapID)
	end
end
function MapRandomEvent_RandomEvent4_MonsterMove(MapID,FastID)
	local TimerTriggerID = API_GetCurTriggerID()
	if API_MapIsValid(MapID) and API_GetMonsterID(FastID) > 0 then
		local x,y
		local Num = 0
		repeat
			Num = Num + 1
			x = math.random(57,83)
			y = math.random(42,80)
		until not API_IsBlockTile(MapID,x,y,0) or Num == 50
		if not API_IsBlockTile(MapID,x,y,0) then
			API_MonsterMoveTo(FastID,1,{x,y,1})
		end
	else
		API_DestroyTriggerG(TimerTriggerID)
	end
end
MapRandomEvent_RandomEvent4_ShouShouSpeakTable = {
	--[1] = {Speak='这里有多少个光头呢？嗯，我数数……#29'},
	--[2] = {Speak='哎呀，数不过来了，手指头不够用了#11'},
	--[3] = {Speak='喂，那边那个人#9，能过来帮我数数光头吗？'},
	--[4] = {Speak='一个两个三个……五个？……不对不对#58'},
	[1] = {Speak='点我即可出去！#0'},
}
function MapRandomEvent_RandomEvent4_ShouShouSpeak(MapID,FastID)
	local TimerTriggerID = API_GetCurTriggerID()
	if API_MapIsValid(MapID) and API_GetMonsterID(FastID) > 0 then
		local Speak = MapRandomEvent_RandomEvent4_ShouShouSpeakTable[math.random(table.getn(MapRandomEvent_RandomEvent4_ShouShouSpeakTable))].Speak
		API_SendMonsterMsg(FastID,-1,Speak)
	else
		API_DestroyTriggerG(TimerTriggerID)
	end
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件五★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
function MapRandomEvent_RandomEvent5(ActorID,MapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件六★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
function MapRandomEvent_RandomEvent6(ActorID,MapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件七★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
function MapRandomEvent_RandomEvent7(ActorID,MapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件八★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
function MapRandomEvent_RandomEvent8(ActorID,MapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件九★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
function MapRandomEvent_RandomEvent9(ActorID,MapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件十★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
function MapRandomEvent_RandomEvent10(ActorID,MapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--清除事件编号、临时计数、事件触发器ID
function MapRandomEvent_ClearUp(ActorID)
	API_VarDataSetNumber(ActorID,1,19053,0)
	API_VarDataSetNumber(ActorID,1,19055,0)
	API_VarDataSetNumber(ActorID,0,19056,0)
	API_VarDataSetNumber(ActorID,1,19057,0)
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件奖励★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
function MapRandomEvent_RandomEventJiangLi(ActorID)
	local JiangLiNum = math.random(MapRandomEvent_JiangLiNumMin,MapRandomEvent_JiangLiNumMax)
	if MapRandomEvent_EventJiangLiNumTable[JiangLiNum] ~= nil then
		local RDfunc = MapRandomEvent_EventJiangLiNumTable[JiangLiNum].HSM
		if type(RDfunc) == 'string' then	
			local Function = _G[RDfunc]
			if type(Function) == 'function' then
				Function(ActorID)
			end
		end
	end
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件奖励一★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--获得功勋
function MapRandomEvent_RandomEventJiangLi1(ActorID)
	local PlayLV = API_GetActorExpLevel(ActorID)
	local PlayMapID = API_GetActorMapID(ActorID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	if MapRandomEvent_EventJiangLiTable[PlayLV] == nil then
		return
	end
	API_AddMagicToMap(PlayMapID,PlayX,PlayY,1000008)
	local GX = MapRandomEvent_EventJiangLiTable[PlayLV].GX
	local AddGX = GX * 2
	local ExploitL = API_GetActorExpLevel(ActorID)
	local expMax = API_GetExploitInfo(ExploitL,3)
	local expNow = API_GetActorCurExp(ActorID)
	local expAddMax = expMax - expNow
	if expAddMax >= AddGX then
		API_ActorAddExp(ActorID,AddGX,0,'随机事件增加'..AddGX..'经验')
		API_ActorSendMsg(ActorID,8,'福至心灵，你顿悟获得'..AddGX..'经验')
	else
		API_ActorAddExp(ActorID,expAddMax,0,'随机事件增加'..expAddMax..'经验')
		API_ActorSendMsg(ActorID,8,'福至心灵，你顿悟获得'..expAddMax..'经验')
	end
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件奖励二★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--获得水晶币
function MapRandomEvent_RandomEventJiangLi2(ActorID)
	local PlayLV = API_GetActorExpLevel(ActorID)
	local PlayMapID = API_GetActorMapID(ActorID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	if MapRandomEvent_EventJiangLiTable[PlayLV] == nil then
		return
	end
	API_AddMagicToMap(PlayMapID,PlayX-3,PlayY+3,4000001)
	local SJB = MapRandomEvent_EventJiangLiTable[PlayLV].SJB
	local AddSJB = SJB * 2
	API_ActorShoppingM_Add(ActorID,AddSJB,0,'随机事件增加'..AddSJB..'水晶币')
	API_ActorSendMsg(ActorID,8,'突然发现地上有一堆水晶币，你捡到了'..AddSJB..'水晶币')
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件奖励三★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--生命补满
function MapRandomEvent_RandomEventJiangLi3(ActorID)
	local PlayMapID = API_GetActorMapID(ActorID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	API_AddMagicToMap(PlayMapID,PlayX,PlayY,72)
	API_ActorAddHP(ActorID,999999)
	API_ActorSendMsg(ActorID,8,'一阵红光闪过，你的生命补满了')
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件奖励四★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--能量补满
function MapRandomEvent_RandomEventJiangLi4(ActorID)
	local PlayMapID = API_GetActorMapID(ActorID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	API_AddMagicToMap(PlayMapID,PlayX,PlayY,73)
	API_ActorAddMP(ActorID,999999)
	API_ActorSendMsg(ActorID,8,'一阵蓝光闪过，你的能量补满了')
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件奖励五★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--增加活力值
function MapRandomEvent_RandomEventJiangLi5(ActorID)
	local PlayLV = API_GetActorExpLevel(ActorID)
	local PlayMapID = API_GetActorMapID(ActorID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	if MapRandomEvent_EventJiangLiTable[PlayLV] == nil then
		return
	end
	local HLZ = MapRandomEvent_EventJiangLiTable[PlayLV].HLZ
	local AddHLZ = HLZ * 2
	API_AddMagicToMap(PlayMapID,PlayX,PlayY,74)
	API_ActorAddHunger(ActorID,AddHLZ)
	API_ActorSendMsg(ActorID,8,'一阵绿光闪过，你恢复了'..AddHLZ..'点活力值')
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件奖励六★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--获得BUFF
function MapRandomEvent_RandomEventJiangLi6(ActorID)
	local PlayMapID = API_GetActorMapID(ActorID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	API_ActorSendMsg(ActorID,8,'什么也没有发生')
end
