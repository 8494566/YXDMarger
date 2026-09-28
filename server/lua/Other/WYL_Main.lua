--上线函数
function WYL_OnLogin(ActorID)
	HeroTower_OnLogin(ActorID)
	WYL_TaskDeleteFunc(ActorID)
end

--下线函数
function WYL_OnLogout(ActorID)
	HeroTower_OnLogout(ActorID)
end

--进地图函数
function WYL_OnLoginMap(ActorID)
	HeroTower_OnLoginMap(ActorID)
end

--出地图函数
function WYL_OnLogoutMap(ActorID)
	HeroTower_OnLogoutMap(ActorID)
end

-- 返回值说明
-- 0:不能复活后走回原地
-- 1:复活后可以走回原地
-- 2:复活后可以走回原地并召唤宠物，并且宠物死亡后自动召唤宠物出来
function CAN_USE_AUTOATTACK_POS(ActorID)
	return 0
end
--挂机定位仪使用回调
function HookLocatorGoodsFunc()
end

--加载脚本
--require 'Scp\\LUA\\Other\\WYL_Fishing.lua' 钓鱼脚本

----------------------------------------以下是降级棒相关函数--------------------------------------------------
-- -----------------------------------------------------------------------------------
-- File Name	: 	EquipmentUpgradeDownload.lua
-- 描述		：	装备升级/降级功能回调
-- Created	:	JamesGu
-- Date		:	2011-05-25

-- 说明		:	请使用者添加其它玩法,并加载此文件!(请勿修改回调函数名称及参数)
-- 
-- Modified	:       ????，

-- 
-- -----------------------------------------------------------------------------------
--装备升级最大次数，从0开始
WYL_OnEquipmentUpdate_MaxUpNum = {
	--[1] = 2,
	[2] = 2,
	[3] = 4,
	[4] = 3,
}
WYL_OnEquipmentUpdate_SaveKey = {
	--[1] = {12721,12722,},
	[2] = {12721,12722,},
	[3] = {12723,12724,},
	[4] = {12725,12726,},
}
-- 装备升级前回调
-- lActorID	: 操作玩家ID
-- lGoodsID	: 装备ID
-- lSubClass 	: 子类型
-- lGoodLevel	: 装备等级
-- lUpgradeCount: 装备升级次数
-- lAttribID	: 升级属性ID
-- lSetValue	: 升级的效果ID
-- lMinValue	: 升级的效果MinID
-- lMaxValue	: 升级的效果MaxID
function OnEquipmentUpdate(lActorID,lGoodsID,lSubClass,lGoodsLevel,lUpgradeCount,lAttribID,lSetValue,lMinValue,lMaxValue)
	--[[API_Trace("lGoodsID = "..lGoodsID.."，lSubClass = "..lSubClass.."，lGoodsLevel = "..lGoodsLevel.."，lUpgradeCount = "..lUpgradeCount.."，lAttribID = "..lAttribID.."，lSetValue = "..lSetValue.."，lMinValue = "..lMinValue.."，lMaxValue = "..lMaxValue)
	if WYL_OnEquipmentUpdate_SaveKey[lGoodLevel] == nil then
		return lSetValue
	end
	--如果没用过降级棒
	--如果是最高属性，那就再走一个概率
	--如果用过降级棒，看值是否达到要求，如果达到，升级满
	local MaxUpNum = WYL_OnEquipmentUpdate_MaxUpNum[lGoodLevel]
	if lSubClass >= 11 and lSubClass <= 13 then	--如果是武器1
		local SaveKey = WYL_OnEquipmentUpdate_SaveKey[lGoodLevel][1]
		local SaveNum = API_VarDataGetNumber(lActorID,1,SaveKey)
		if SaveNum == 0 then SaveNum = 1 end
		if lUpgradeCount >= MaxUpNum then --如果是最后一次升级
			if SaveNum < 5 then --如果降级次数小于5次
				local RD = math.random(1,10)
				local RDVal = lMaxValue - lMinValue - 1
				if RD > SaveNum then --如果人品不好，随机值大于降级次数，默认一次
					lSetValue = lMinValue + math.random(RDVal) --给一个永远不是最好的属性
				else
					SaveNum = SaveNum - 2
					if SaveNum < 0 then SaveNum = 0 end
					API_VarDataSetNumber(lActorID,1,SaveKey,SaveNum)
					lSetValue = lMaxValue
				end
			else
				SaveNum = SaveNum - 2
				if SaveNum < 0 then SaveNum = 0 end
				API_VarDataSetNumber(lActorID,1,SaveKey,SaveNum)
				lSetValue = lMaxValue
			end
		end
	else	--如果是防具2
		local SaveKey = WYL_OnEquipmentUpdate_SaveKey[lGoodLevel][2]
		local SaveNum = API_VarDataGetNumber(lActorID,1,SaveKey)
		if SaveNum == 0 then SaveNum = 1 end
		if lUpgradeCount >= MaxUpNum then --如果是最后一次升级
			if SaveNum < 3 then --如果降级次数小于3次
				local RD = math.random(1,10)
				local RDVal = lMaxValue - lMinValue - 1
				if RD > SaveNum then --如果人品不好，随机值大于降级次数，默认一次
					lSetValue = lMinValue + math.random(RDVal) --给一个永远不是最好的属性
				else
					SaveNum = SaveNum - 1
					if SaveNum < 0 then SaveNum = 0 end
					API_VarDataSetNumber(lActorID,1,SaveKey,SaveNum)
					lSetValue = lMaxValue
				end
			else
				SaveNum = SaveNum - 1
				if SaveNum < 0 then SaveNum = 0 end
				API_VarDataSetNumber(lActorID,1,SaveKey,SaveNum)
				lSetValue = lMaxValue
			end
		end
	end]]
	-- 必需返回一个ID值
	return lSetValue
end

WYL_OnEquipmentUpdate_KeyTab = {
	[88883] = 12721,	--武器降级棒[二档]
	[88884] = 12722,	--防具降级棒[二档]
	[88885] = 12723,	--武器降级棒[三档]
	[88886] = 12724,	--防具降级棒[三档]
	[88887] = 12725,	--武器降级棒[四档]
	[88888] = 12726,	--防具降级棒[四档]
}

-- 降级棒使用后回调
-- lActorID	: 操作玩家ID
-- lMedicamentGoodsID	: 降级棒ID
-- lUpgradeCount	: 降级数
function OnEquipmentUpdateDownLoad(lActorID,lMedicamentGoodsID,lUpgradeCount)
	--API_Trace("lMedicamentGoodsID = "..lMedicamentGoodsID.."  lUpgradeCount = "..lUpgradeCount)
	if WYL_OnEquipmentUpdate_KeyTab[lMedicamentGoodsID] ~= nil then
		local SaveKey = WYL_OnEquipmentUpdate_KeyTab[lMedicamentGoodsID]
		local SaveNum = API_VarDataGetNumber(lActorID,1,SaveKey)
		SaveNum = SaveNum + 1
		API_VarDataSetNumber(lActorID,1,SaveKey,SaveNum)
	end
end

-- -----------------------------------------------------------------------------------
-- end file!!!
-- -----------------------------------------------------------------------------------
--需要删除的主线任务表
WYL_DeleteTaskTab = {
[	1565	]=1,
[	1570	]=2,
[	1575	]=3,
[	1577	]=4,
[	1578	]=5,
[	1579	]=6,
[	1585	]=7,
[	1620	]=8,
[	1630	]=9,
[	1637	]=10,
[	1638	]=11,
[	1651	]=12,
[	1652	]=13,
[	1465	]=14,
[	1470	]=15,
[	1475	]=16,
[	1477	]=17,
[	1478	]=18,
[	1479	]=19,
[	1485	]=20,
[	1520	]=21,
[	1530	]=22,
[	1537	]=23,
[	1538	]=24,
[	1551	]=25,
[	1552	]=26,
}
--主线任务删除函数
function WYL_TaskDeleteFunc(ActorID)
	for i = 32701,32710 do 
		local TaskID = API_VarDataGetNumber(ActorID, 1, i)
		if WYL_DeleteTaskTab[TaskID] ~= nil then
			Fun_GiveupTaskProc(ActorID,TaskID)
			Fun_ClsActorTaskData(ActorID,TaskID)
		end
	end
end
