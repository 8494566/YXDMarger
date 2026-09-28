----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\JingZhuan.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2008-5-16
--版  本:	1.0
--描  述:	金砖兑换和使用金砖功能
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 万钰林
--日  期: 2008-6-30
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------


--金砖的价值
local JinZhuanJiaZhi = 1000000 
--兑换时身上金币不能超过的数额
local DuiHuanMoneyMaxPanDuan = 49000000
--金砖的物品ID
local JinZhuanGoosID = 790


function JinZhuanDuiHuan_Title()
	--[[
	local ActorID = API_RequestGetActorID()
	local Playname = API_GetActorName(ActorID) --通过玩家ID获取玩家名字
	local SelectItem = API_RequestGetNumber(1) --Request对象获取玩家提交的数字变量值
	local beibaokongjian = API_ActorGetPackageSize(ActorID) --获取玩家背包空间
	local money = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) --获取 玩家 金币数量
	local jinzhuan = API_ActorGetGoodsNum(ActorID,JinZhuanGoosID);
	if SelectItem ~= 1 then
		
		API_ResponseWrite('<text>亲爱的'..Playname..'，你需要兑换金砖吗？</text><br>')
		API_ResponseWrite('<img srcgd="'..JinZhuanGoosID..'" tipgd="'..JinZhuanGoosID..'"><text color="255,0,255">每块金砖价值'..PublicFun_ArabianNumberToChineseNumber(JinZhuanJiaZhi)..'金币，您可以随时通过右键点击使用金砖来获得等价的金币</text><br>')
		API_ResponseWrite('<br><a href="JinZhuanDuiHuan_Title?1=1">兑换金砖</a><br>')
		API_ResponseWrite('<br><a>取消</a><br>')
	elseif SelectItem == 1 then
		if money >= JinZhuanJiaZhi then
			if API_ActorCanAddGoods(ActorID,JinZhuanGoosID,1,0,0) ~= -1  then
				if API_ActorAddMoneyUnStat(ActorID,-JinZhuanJiaZhi,790,'扣除'..PublicFun_ArabianNumberToChineseNumber(JinZhuanJiaZhi)..'金币') == money - JinZhuanJiaZhi then
					API_AddActorGoods(ActorID,JinZhuanGoosID,1,'兑换金砖')
					API_ActorSendMsg(ActorID,2,'获得金砖一块')
					API_ResponseWrite('<text color="255,0,255">您成功的兑换了一块金砖，还需要继续兑换吗？</text><br>')
					API_ResponseWrite('<img srcgd="'..JinZhuanGoosID..'" tipgd="'..JinZhuanGoosID..'"><text>每块金砖价值'..PublicFun_ArabianNumberToChineseNumber(JinZhuanJiaZhi)..'金币，您可以随时通过右键点击使用金砖来获得等价的金币</text><br>')
					API_ResponseWrite('<br><a href="JinZhuanDuiHuan_Title?1=1">继续兑换金砖</a><br>')
					API_ResponseWrite('<br><a>取消</a><br>')
				end
			else
				API_ResponseWrite('<text>你的空间背包不足，请保留足够的空格再进行兑换。</text><br>')
				API_ResponseWrite('<br><a>我知道了</a><br>')
			end
		else
			API_ResponseWrite('<text>你的金币不足'..PublicFun_ArabianNumberToChineseNumber(JinZhuanJiaZhi)..'，不能兑换金砖。</text><br>')
			API_ResponseWrite('<br><a>我知道了</a><br>')
		end
	end
	]]
	API_ResponseWrite('<text>暂停服务</text><br>')
	API_ResponseWrite('<br><a>确定</a><br>')
end


function JinZhuanDuiHuan_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if GoodsID ~= JinZhuanGoosID then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'你身上没有金砖，不能进行兑换。')
		return 0
	end
	local money = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD)
	if money <= DuiHuanMoneyMaxPanDuan then
		if API_ActorRemoveGoods(ActorID,JinZhuanGoosID,1,'删除金砖') then
			API_ActorAddMoneyUnStat(ActorID,JinZhuanJiaZhi,790,'增加'..PublicFun_ArabianNumberToChineseNumber(JinZhuanJiaZhi)..'金币')
			API_ActorSendMsg(ActorID,2,'使用金砖获得金币 X '..JinZhuanJiaZhi..'')
		end
	else
		API_ActorSendMsg(ActorID,3,'你身上的金币太多，不能兑换金币，只有当背包内的金币小于或等于'..PublicFun_ArabianNumberToChineseNumber(DuiHuanMoneyMaxPanDuan)..'才可以兑换。')
		return 0
	end
	return 1
end
