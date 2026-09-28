-------------------------------
--文件名:	Scp\Lua\Other\ArmShineStone.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	刘操
--日  期:	2011-1-4
--版  本:	
--描  述:   武器光效宝石脚本
--应  用:  
-------------------------------

local StoneStatusTable = {
[89040] = {ID = 1056001,Name = '一档繁星光石'},
[89041] = {ID = 1057001,Name = '一档灵动光石'},
[89042] = {ID = 1023001,Name = '一档噬炎光石'},
[89043] = {ID = 1058001,Name = '一档星尘光石'},
[89044] = {ID = 1059001,Name = '一档紫霞光石'},
}

local LC_ArmShineStatusMian = {1056,1057,1023,1058,1059}
local LC_ArmShineStatus = {
[1056] = 1056001,
[1057] = 1057001,
[1023] = 1023001,
[1058] = 1058001,
[1059] = 1059001,
}

function ArmShineStoneUse(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID()
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then--判断玩家是否拥有物品
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if StoneStatusTable[GoodsID] == nil then--判断物品是否属于武器光效宝石
		API_ActorSendMsg(ActorID,3,'非法物品')
		return 0
	end
	local GoodsName = API_GetGoodsName(GoodsID)
	API_ResponseWrite('<name>武器光效宝石</name>')
	API_ResponseWrite('<text>	使用武器光效宝石之后，装备武器可以产生特殊的光效以及状态，持续3天。武器光效状态不可叠加，如果当前已有武器光效状态请谨慎使用。</text><br>')
	API_ResponseWrite('<br><a href="ArmShineStoneUse_Title?1='..GoodsID..'">使用'..GoodsName..'</a><br>')
	API_ResponseWrite('<br><a>关闭</a><br>')
	API_ResponseFlush(ActorID)
	return 1
end

function ArmShineStoneUse_Title()
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = API_RequestGetNumber(1)
	if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用武器光效宝石') then--销毁玩家身上的物品
		for j,v in LC_ArmShineStatusMian do
			if API_ActorFindStatus(ActorID,v) then
				 API_ActorRemoveStatus(ActorID,LC_ArmShineStatus[v])
			end
		end
		local GoodsName = API_GetGoodsName(GoodsID)
		local StatusID = StoneStatusTable[GoodsID].ID
		local Name = StoneStatusTable[GoodsID].Name
		API_ActorAddStatus(ActorID,StatusID,259200000)
		API_ActorSendMsg(ActorID,3,'成功使用'..GoodsName..'')
		return 1
	else
		API_ActorSendMsg(ActorID,3,'扣除物品失败')
		return 0
	end
end