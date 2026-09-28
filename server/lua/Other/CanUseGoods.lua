---------------------------------------------------------------------------------------------------------------------------------------
--文件名:  Scp\Lua\Act\CanUseGoods.lua
--版  权:  (C)  腾讯计算机有限公司
--创建人:   黄蕾  sofiehuang
--日  期:   2012-11-22
--版  本:   1.0
--描  述:   可以使用物品功能脚本
--应  用:   英雄岛
----------------------------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------------------------
--天空战场可使用物品功能区： 技能物品道具系统
----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
--天空战场可使用物品功能区： 技能物品道具系统
----------------------------------------------------------------------------------------------------------------------------------------
--89201英雄必杀技
local tSkillStateGoods = {
	
	[1]= {	
		[1] = {nSkillID=585 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--轰击锤
		[2] = {nSkillID=586 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--闪烁攻击
		[3] = {nSkillID=587 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--致命猎杀
		[4] = {nSkillID=588 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--寒冰弹
		[5] = {nSkillID=589 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--地狱冥焰
		
	     },
	[2]= {	
		[1] = {nSkillID=590 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--烟幕
		[2] = {nSkillID=591 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--液冷炸弹
		[3] = {nSkillID=592 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--虚弱图腾
		[4] = {nSkillID=593 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--冰封路径
		[5] = {nSkillID=594 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--恶魔守卫
		
	     },
	[3]= {	
		[1] = {nSkillID=595 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--晶体皮肤
		[2] = {nSkillID=596 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--舞刃风暴
		[3] = {nSkillID=597 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--灼烧
		[4] = {nSkillID=598 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--AT力场
		[5] = {nSkillID=599 ,nSkillLev=1,nRandNum=500000,LocXmin = 0,LocXmax = 0,LocYmin = 0,LocYmax = 0,Flag=0},--冰冷血脉
		
	     },
	}


function HL_SkillStateGoods(ActorID,GoodsID)
	
	local ActorID = ActorID or API_RequestGetActorID()
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	
	--判断，如果角色当前所在地图的静态地图ID不是天空战场就不让使用。
	local nMapID = API_GetActorMapID(ActorID);
	local nStaticMapID = API_GetStaticMapID(nMapID)--获得地图静态ID
	if nStaticMapID ~= 2046 then
		API_ActorSendMsg(ActorID,3,'只能在天空战场地图使用')
		return 0
	end
	
	--随机类型
	local nRandStyle = math.random(1,table.getn(tSkillStateGoods))
	--API_Trace('nRandStyle='..nRandStyle)
	--随机类型标志
	--local nRealMainBZID = math.random(1,table.getn(tSkillStateGoods[nRandStyle]))
	--API_Trace('nRealMainBZID='..nRealMainBZID)
	--随机到的技能主ID,技能等级
	--local nSkillID = tSkillStateGoods[nRandStyle][nRealMainBZID].nSkillID
	--API_Trace('nSkillID='..nSkillID)
	--local nSkillLev =tSkillStateGoods[nRandStyle][nRealMainBZID].nSkillLev

	if GoodsID == 89201 then 
		--第一类：选择目标技能	
		if nRandStyle == 1 then
			API_ActorStartSelect(ActorID,'HLmubiaoskill_PanDuan',15) 
			API_ActorSendMsg(ActorID,3,'请左键点击您想使用的敌方对象')
			return 1	
		--第二类：区域技能
		elseif nRandStyle == 2 then
			--区域坐标范围
			--鼠标变成选择状态
			API_ActorStartSelect(ActorID,'HLquyuskill_PanDuan',15) 
			API_ActorSendMsg(ActorID,3,'请左键点击您想使用的目标区域')
			return 1
		--第三类：直接释放技能
		elseif nRandStyle == 3 then
			local SelectType = API_RequestGetNumber(2) 
			local OtherID = API_RequestGetNumber(3) 
			--随机类型标志
			local nRealMainBZID = math.random(1,table.getn(tSkillStateGoods[3]))
			--API_Trace('nRealMainBZID3='..nRealMainBZID)
			--随机到的技能主ID,技能等级
			local nSkillID = tSkillStateGoods[3][nRealMainBZID].nSkillID
			--API_Trace('nSkillID3='..nSkillID)
			local nSkillLev =tSkillStateGoods[3][nRealMainBZID].nSkillLev
			API_Trace('nSkillLev3='..nSkillLev)
			--if ActorID ~= OtherID then
				--API_ActorSendMsg(ActorID,3,'该技能只能对自己使用。')
				--API_ActorStartSelect(ActorID,'HLzijiskill_PanDuan',15)
				--return
			--end
			--if SelectType == 2 then	
				if API_ActorRemoveGoods(ActorID, GoodsID, 1, '使用英雄必杀技') then
					API_ActorUseSkill(ActorID, nSkillID, nSkillLev, 0, 0, 1, ActorID)
				end
			--else
				--API_ActorSendMsg(ActorID,2,'选中目标无效，请重新选择。')
				--API_ActorStartSelect(ActorID,'HLzijiskill_PanDuan',15)
			--end
			--API_ActorStartSelect(ActorID,'HLzijiskill_PanDuan',15) 
			--API_ActorSendMsg(ActorID,3,'请左键点击您自己')
			--return 1
			
		end
	end
	
	return 0
end

--第一类：选择目标技能	
function HLmubiaoskill_PanDuan(nSkillID,nSkillLev)
	local GoodsID = 89201
	local ActorID = ActorID or API_RequestGetActorID()
	local SelectType = API_RequestGetNumber(2) 
	local OtherID = API_RequestGetNumber(3) 
	
	if ActorID == OtherID then
		API_ActorSendMsg(ActorID,3,'该技能只能对敌队玩家使用。')
		API_ActorStartSelect(ActorID,'HLmubiaoskill_PanDuan',15)
		return
	end
	--随机类型标志
	local nRealMainBZID = math.random(1,table.getn(tSkillStateGoods[1]))
	--API_Trace('nRealMainBZID1='..nRealMainBZID)
	--随机到的技能主ID,技能等级
	local nSkillID = tSkillStateGoods[1][nRealMainBZID].nSkillID
	--API_Trace('nSkillID1='..nSkillID)
	local nSkillLev =tSkillStateGoods[1][nRealMainBZID].nSkillLev
	--API_Trace('nSkillLev1='..nSkillLev)
	--1:联邦； 0：帝国
	local nMyselfCamp = API_GetActorBattleCamp(ActorID)
	local nCamp = 0 --敌对阵营
	if nMyselfCamp == 1 then
		nCamp = 0
	else
		nCamp = 1
	end
	if SelectType == 2 then	
		if nMyselfCamp ~= nCamp then
			--删除物品 释放技能 
			if OtherID ~= ActorID and OtherID ~= nil then
				if API_ActorRemoveGoods(ActorID, GoodsID, 1, '使用英雄必杀技') then
					API_ActorUseSkill(ActorID, nSkillID, nSkillLev, 0, 0, 1, OtherID)
				end
			end		
		else
			API_ActorSendMsg(ActorID,2,'选中目标无效，请重新选择敌方玩家。')
			API_ActorStartSelect(ActorID,'HLmubiaoskill_PanDuan',15)
		end
	else
		API_ActorSendMsg(ActorID,2,'选中目标无效，请重新选择敌方玩家。')
		API_ActorStartSelect(ActorID,'HLmubiaoskill_PanDuan',15)
	end
end

--第二类：区域技能
function HLquyuskill_PanDuan(nSkillID,nSkillLev)
	
	local GoodsID = 89201
	local ActorID = ActorID or API_RequestGetActorID()
	local SelectType = API_RequestGetNumber(2) 
	local OtherID = API_RequestGetNumber(3) 
	--地面坐标
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 
	--随机类型标志
	local nRealMainBZID = math.random(1,table.getn(tSkillStateGoods[2]))
	--API_Trace('nRealMainBZID2='..nRealMainBZID)
	--随机到的技能主ID,技能等级
	local nSkillID = tSkillStateGoods[2][nRealMainBZID].nSkillID
	--API_Trace('nSkillID2='..nSkillID)
	local nSkillLev =tSkillStateGoods[2][nRealMainBZID].nSkillLev
	--API_Trace('nSkillLev2='..nSkillLev)
	if SelectType == 0 then	
		if API_ActorRemoveGoods(ActorID, GoodsID, 1, '使用英雄必杀技') then
			API_ActorUseSkill(ActorID, nSkillID, nSkillLev, SelectTileX, SelectTileY, 0, 0)
			--API_Trace('SelectTileX='..SelectTileX)
			--API_Trace('SelectTileY='..SelectTileY)
		end
	else
		API_ActorSendMsg(ActorID,2,'选中目标区域，请重新选择。')
		API_ActorStartSelect(ActorID,'HLquyuskill_PanDuan',15)
	end
end
--第三类：直接释放技能
function HLzijiskill_PanDuan (nSkillID,nSkillLev)
	
	local GoodsID = 89201
	local ActorID = ActorID or API_RequestGetActorID()
	local SelectType = API_RequestGetNumber(2) 
	local OtherID = API_RequestGetNumber(3) 
	--随机类型标志
	local nRealMainBZID = math.random(1,table.getn(tSkillStateGoods[3]))
	--API_Trace('nRealMainBZID3='..nRealMainBZID)
	--随机到的技能主ID,技能等级
	local nSkillID = tSkillStateGoods[3][nRealMainBZID].nSkillID
	--API_Trace('nSkillID3='..nSkillID)
	local nSkillLev =tSkillStateGoods[3][nRealMainBZID].nSkillLev
	--API_Trace('nSkillLev3='..nSkillLev)
	if ActorID ~= OtherID then
		API_ActorSendMsg(ActorID,3,'该技能只能对自己使用。')
		API_ActorStartSelect(ActorID,'HLzijiskill_PanDuan',15)
		return
	end
	if SelectType == 2 then	
		if API_ActorRemoveGoods(ActorID, GoodsID, 1, '使用英雄必杀技') then
			API_ActorUseSkill(ActorID, nSkillID, nSkillLev, 0, 0, 1, ActorID)
		end
	else
		API_ActorSendMsg(ActorID,2,'选中目标无效，请重新选择。')
		API_ActorStartSelect(ActorID,'HLzijiskill_PanDuan',15)
	end
end





