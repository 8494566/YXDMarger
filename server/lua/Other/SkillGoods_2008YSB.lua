----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\SkillGoods.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-3-26
--版  本:	1.0
--描  述:	使用物品调用技能
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-3-26
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------

function SkillGoods_QiBaoQi_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local YaoKongDiLeiLV = API_GetSkillLevel(ActorID,19)
	if YaoKongDiLeiLV == 0 then 
		YaoKongDiLeiLV = 1
	end
	local NeedNum = 1
	local NeedCaiLiaoID = 80247
	if YaoKongDiLeiLV >= 11 then
		NeedNum = 3
	elseif YaoKongDiLeiLV >= 6 then
		NeedNum = 2
	end
	if API_ActorGetGoodsNum(ActorID,NeedCaiLiaoID) < NeedNum then
		API_ActorSendMsg(ActorID,1,'没有足够的'..API_GetGoodsName(NeedCaiLiaoID)..'无法起爆')
		return 0
	else
		API_ActorUseSkill(ActorID,18,YaoKongDiLeiLV,0,0,0,0)
		API_ActorSendMsg(ActorID,3,'您使用引爆器引爆了您放置的所有地雷！')
		return 1
	end
	return 1
end

GLOBAL_ZhengChaShouWei_GoodsList = {
	--侦察守卫[公民]
	[834] = {NeedMorale=126,SkillID=421,SkillLV=1,},
	--侦察守卫[男爵]
	[835] = {NeedMorale=252,SkillID=421,SkillLV=2,},
	--侦察守卫[高级男爵]
	[836] = {NeedMorale=336,SkillID=421,SkillLV=3,},
	--侦察守卫[子爵]
	[837] = {NeedMorale=819,SkillID=421,SkillLV=4,},
	--侦察守卫[高级子爵]
	[838] = {NeedMorale=1029,SkillID=421,SkillLV=5,},
	--侦察守卫[伯爵]
	[839] = {NeedMorale=1372,SkillID=421,SkillLV=6,},
	--侦察守卫[高级伯爵]
	[840] = {NeedMorale=2226,SkillID=421,SkillLV=7,},
	--侦察守卫[侯爵]
	[841] = {NeedMorale=2940,SkillID=421,SkillLV=8,},
	--侦察守卫[高级侯爵]
	[842] = {NeedMorale=3528,SkillID=421,SkillLV=9,},
	--侦察守卫[公爵]
	[843] = {NeedMorale=4410,SkillID=421,SkillLV=10,},
	--侦察守卫[高级公爵]
	[844] = {NeedMorale=5180,SkillID=421,SkillLV=11,},
}

function SkillGoods_ZhengChaShouWei_GoodsCallFunc(ActorID,GoodsID,Target_Type,Target_Value,Target_MapID,Target_x,Target_y)
	if GLOBAL_ZhengChaShouWei_GoodsList[GoodsID] == nil then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
	if PublicFun_AccountDistance(TileX,TileY,Target_x,Target_y) > 7 then
		API_ActorSendMsg(ActorID,3,'选择的位置太远，请就近释放')
		return 0
	end
	local SkillID = GLOBAL_ZhengChaShouWei_GoodsList[GoodsID].SkillID
	local SkillLV = GLOBAL_ZhengChaShouWei_GoodsList[GoodsID].SkillLV
	if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用侦察守卫') then
		API_ActorUseSkill(ActorID,SkillID,SkillLV,Target_x,Target_y,0,0)
	end
	return 1
end


function SkillGoods_DianJinShouTao2_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,714) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	for i = 1,table.getn(FangShouFuBenMapID) do 
		if StaticMapID == FangShouFuBenMapID[i] then
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(GoodsID)..'暂时不能在本地图使用')
			return 0
		end
	end
	for i = 1,table.getn(TaFangFuBenMapID) do 
		if StaticMapID == TaFangFuBenMapID[i] then
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(GoodsID)..'暂时不能在本地图使用')
			return 0
		end
	end
	API_ActorStartSelect(ActorID,'SkillGoods_DianJinShouTao',16) 
	API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
	return 1
end

function SkillGoods_DianJinShouTao()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 
	local MapID = API_GetActorMapID(ActorID)
	if API_ActorGetGoodsNum(ActorID,714) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local StaticMapID = API_GetStaticMapID(MapID)
	for i = 1,table.getn(FangShouFuBenMapID) do 
		if StaticMapID == FangShouFuBenMapID[i] then
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(714)..'不能在本地图使用')
			return 0
		end
	end
	for i = 1,table.getn(TaFangFuBenMapID) do 
		if StaticMapID == TaFangFuBenMapID[i] then
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(714)..'不能在本地图使用')
			return 0
		end
	end
	if SelectType == 1 then
		if API_GetMonsterID(SelectID) <= 0 then
			API_ActorStartSelect(ActorID,'SkillGoods_DianJinShouTao',16) 
			API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
			return
		end
		if API_MonsterGetPropNum(SelectID,242) == 4 and API_MonsterGetPropNum(SelectID,244) <= 0 and API_MonsterGetPropNum(SelectID,PD_PROP_CAMPID) ~= API_GetActorCamp(ActorID) then
			if not API_MonsterIsBoss(SelectID) then
				local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
				if PublicFun_AccountDistance(TileX,TileY,SelectTileX,SelectTileY) > 10 then
					API_ActorSendMsg(ActorID,3,'目标的位置太远，请就近选择')
					return 0
				end
				if API_GetMonsterLv(SelectID) <= 40 then
					if API_ActorRemoveGoods(ActorID,714,1,'使用点金手套包') then
						API_ActorUseSkill(ActorID,319,1,0,0,0,SelectID)
						API_ActorSendMsg(ActorID,3,'您使用点金手套杀死了 '..API_GetMonsterName(SelectID)..'')
					end
				elseif API_ActorGetGoodsNum(ActorID,714) > 1 then
					if API_ActorRemoveGoods(ActorID,714,2,'使用点金手套包') then
						API_ActorUseSkill(ActorID,319,1,0,0,0,SelectID)
						API_ActorSendMsg(ActorID,3,'您使用2个点金手套杀死了 '..API_GetMonsterName(SelectID)..'')
					end
				else
					API_ActorStartSelect(ActorID,'SkillGoods_DianJinShouTao',16) 
					API_ActorSendMsg(ActorID,3,'杀死伯爵档以上的敌兵需要消耗两个点金手套')
				end
			else
				API_ActorStartSelect(ActorID,'SkillGoods_DianJinShouTao',16) 
				API_ActorSendMsg(ActorID,3,'不能对BOSS使用，请左键点击您想杀死的敌方小兵')
			end
		else
			API_ActorStartSelect(ActorID,'SkillGoods_DianJinShouTao',16) 
			API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
		end
	else
		API_ActorStartSelect(ActorID,'SkillGoods_DianJinShouTao',16) 
		API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
	end
end

function SkillGoods_LinShiXinTuoPinZheng_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,725) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local JiangLi = math.random(15000,22500)
	if API_ActorRemoveGoods(ActorID,725,1,'使用临时信托凭证') then
		API_ActorAddMoney(ActorID,JiangLi,0,'使用临时信托凭证')
		API_ActorSendMsg(ActorID,3,'使用临时信托凭证，获得'..JiangLi..'金币')
		return 1
	end
	return 0
end

function SkillGoods_YuanXinXie_GoodsCallFunc(ActorID,GoodsID,Target_Type,Target_Value,Target_MapID,Target_x,Target_y)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_MapIsValid(Target_MapID) then
		if API_HaveNoBlockTile(Target_MapID,Target_x,Target_y,4) then
			local CampID = API_GetActorCamp(ActorID)
			if API_BattleMapCanSee(Target_MapID,CampID,Target_x,Target_y) then
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用飞行卷') then
					API_ActorGoToMap(ActorID,Target_MapID,Target_x,Target_y)
					return 1
				else
					return 0
				end
			else
				API_ActorSendMsg(ActorID,3,'飞行卷只能将您传送到拥有己方视野的区域')
				return 0
			end
			
		else
			return 0
		end
	else
		return 0
	end
end


-- 月门不能传送表
MoonDoorNoGoToAddress_Tab = 
{
{AddrName = "钢铁城入口", AddrMapID = 9, AddrLocX = 130, AddrLocY = 388, IfEndLine = 1, CampID = 0},
{AddrName = "公民空间传送塔", AddrMapID = 9, AddrLocX = 199, AddrLocY = 394, IfEndLine = 1, CampID = 0},
{AddrName = "男爵空间传送塔", AddrMapID = 9, AddrLocX = 119, AddrLocY = 363, IfEndLine = 1, CampID = 0},
{AddrName = "高级男爵空间传送塔", AddrMapID = 9, AddrLocX = 69, AddrLocY = 303, IfEndLine = 1, CampID = 0},
{AddrName = "国有资源采集区", AddrMapID = 9, AddrLocX = 116, AddrLocY = 318, IfEndLine = 1, CampID = 0},
{AddrName = "1档资源采集区A", AddrMapID = 9, AddrLocX = 237, AddrLocY = 354, IfEndLine = 1, CampID = 0},
{AddrName = "1档资源采集区B", AddrMapID = 9, AddrLocX = 176, AddrLocY = 305, IfEndLine = 1, CampID = 0},
{AddrName = "2档资源采集区A", AddrMapID = 9, AddrLocX = 145, AddrLocY = 248, IfEndLine = 1, CampID = 0},
{AddrName = "2档资源采集区B", AddrMapID = 9, AddrLocX = 226, AddrLocY = 234, IfEndLine = 1, CampID = 0},
{AddrName = "3档资源采集区A", AddrMapID = 9, AddrLocX = 272, AddrLocY = 146, IfEndLine = 1, CampID = 0},
{AddrName = "迷雾镇杂货店", AddrMapID = 9, AddrLocX = 144, AddrLocY = 367, IfEndLine = 1, CampID = 0},
{AddrName = "迷雾镇药水店", AddrMapID = 9, AddrLocX = 160, AddrLocY = 390, IfEndLine = 1, CampID = 0},
{AddrName = "阳光雨林入口", AddrMapID = 9, AddrLocX = 48, AddrLocY = 333, IfEndLine = 1, CampID = 0},
{AddrName = "暗礁海入口", AddrMapID = 23, AddrLocX = 412, AddrLocY = 236, IfEndLine = 1, CampID = 0},
{AddrName = "子爵空间传送塔", AddrMapID = 23, AddrLocX =314, AddrLocY = 293, IfEndLine = 1, CampID = 0},
{AddrName = "高级子爵空间传送塔", AddrMapID = 23, AddrLocX = 326, AddrLocY = 188, IfEndLine = 1, CampID = 0},
{AddrName = "伯爵空间传送塔", AddrMapID = 23, AddrLocX = 145, AddrLocY = 277, IfEndLine = 1, CampID = 0},
{AddrName = "高级伯爵空间传送塔", AddrMapID = 23, AddrLocX = 324, AddrLocY = 145, IfEndLine = 1, CampID = 0},
{AddrName = "侯爵空间传送塔", AddrMapID = 23, AddrLocX = 223, AddrLocY = 173, IfEndLine = 1, CampID = 0},
{AddrName = "高级侯爵空间传送塔", AddrMapID = 23, AddrLocX = 245, AddrLocY = 93, IfEndLine = 1, CampID = 0},
{AddrName = "钢铁隧道入口", AddrMapID = 23, AddrLocX = 244, AddrLocY = 79, IfEndLine = 1, CampID = 0},
{AddrName = "天空城入口", AddrMapID = 10, AddrLocX = 200, AddrLocY = 175, IfEndLine = 1, CampID = 1},
{AddrName = "公民空间传送塔", AddrMapID = 10, AddrLocX = 252, AddrLocY = 218, IfEndLine = 1, CampID = 1},
{AddrName = "男爵空间传送塔", AddrMapID = 10, AddrLocX = 186, AddrLocY = 321, IfEndLine = 1, CampID = 1},
{AddrName = "高级男爵空间传送塔", AddrMapID = 10, AddrLocX = 146, AddrLocY = 261, IfEndLine = 1, CampID = 1},
{AddrName = "国有资源采集区", AddrMapID = 10, AddrLocX = 181, AddrLocY = 241, IfEndLine = 1, CampID = 1},
{AddrName = "1档资源采集区A", AddrMapID = 10, AddrLocX = 338, AddrLocY = 129, IfEndLine = 1, CampID = 1},
{AddrName = "1档资源采集区B", AddrMapID = 10, AddrLocX = 143, AddrLocY = 325, IfEndLine = 1, CampID = 1},
{AddrName = "2档资源采集区A", AddrMapID = 10, AddrLocX = 349, AddrLocY = 231, IfEndLine = 1, CampID = 1},
{AddrName = "2档资源采集区B", AddrMapID = 10, AddrLocX = 312, AddrLocY = 266, IfEndLine = 1, CampID = 1},
{AddrName = "3档资源采集区A", AddrMapID = 10, AddrLocX = 248, AddrLocY = 342, IfEndLine = 1, CampID = 1},
{AddrName = "圣石镇杂货店", AddrMapID = 10, AddrLocX = 201, AddrLocY = 205, IfEndLine = 1, CampID = 1},
{AddrName = "圣石镇药水店", AddrMapID = 10, AddrLocX = 186, AddrLocY = 202, IfEndLine = 1, CampID = 1},
{AddrName = "麦穗平原入口", AddrMapID = 10, AddrLocX = 128, AddrLocY = 285, IfEndLine = 1, CampID = 1},
{AddrName = "珊瑚群岛入口", AddrMapID = 25, AddrLocX = 393, AddrLocY = 174, IfEndLine = 1, CampID = 1},
{AddrName = "子爵空间传送塔", AddrMapID = 25, AddrLocX = 282, AddrLocY = 186, IfEndLine = 1, CampID = 1},
{AddrName = "高级子爵空间传送塔", AddrMapID = 25, AddrLocX = 312, AddrLocY = 283, IfEndLine = 1, CampID = 1},
{AddrName = "伯爵空间传送塔", AddrMapID = 25, AddrLocX = 188, AddrLocY = 194, IfEndLine = 1, CampID = 1},
{AddrName = "高级伯爵空间传送塔", AddrMapID = 25, AddrLocX = 220, AddrLocY = 366, IfEndLine = 1, CampID = 1},
{AddrName = "侯爵空间传送塔", AddrMapID = 25, AddrLocX = 109, AddrLocY = 318, IfEndLine = 1, CampID = 1},
{AddrName = "高级侯爵空间传送塔", AddrMapID = 25, AddrLocX = 136, AddrLocY = 356, IfEndLine = 1, CampID = 1},
{AddrName = "时光走廊入口", AddrMapID = 25, AddrLocX = 108, AddrLocY = 364, IfEndLine = 1, CampID = 1},
}


-- 暗礁海月门传送表
AnJiaoHai_MoonDoorGoToAddress_Tab = 
{
{AddrName = "[钢铁城入口]", AddrMapID = 9, AddrLocX = 119, AddrLocY = 400, IfEndLine = 1, CampID = 0},
{AddrName = "    公民空间传送塔", AddrMapID = 9, AddrLocX = 212, AddrLocY = 396, IfEndLine = 1, CampID = 0},
{AddrName = "    男爵空间传送塔", AddrMapID = 9, AddrLocX = 105, AddrLocY = 367, IfEndLine = 1, CampID = 0},
{AddrName = "    高级男爵空间传送塔", AddrMapID = 9, AddrLocX = 78, AddrLocY = 292, IfEndLine = 1, CampID = 0},
{AddrName = "    国有资源采集区", AddrMapID = 9, AddrLocX = 100, AddrLocY = 317, IfEndLine = 1, CampID = 0},
{AddrName = "    1档资源采集区A", AddrMapID = 9, AddrLocX = 222, AddrLocY = 359, IfEndLine = 1, CampID = 0},
{AddrName = "    1档资源采集区B", AddrMapID = 9, AddrLocX = 189, AddrLocY = 303, IfEndLine = 1, CampID = 0},
{AddrName = "    2档资源采集区A", AddrMapID = 9, AddrLocX = 132, AddrLocY = 253, IfEndLine = 1, CampID = 0},
{AddrName = "    2档资源采集区B", AddrMapID = 9, AddrLocX = 206, AddrLocY = 232, IfEndLine = 1, CampID = 0},
{AddrName = "    3档资源采集区A", AddrMapID = 9, AddrLocX = 258, AddrLocY = 145, IfEndLine = 1, CampID = 0},
{AddrName = "[阳光雨林入口]", AddrMapID = 9, AddrLocX = 55, AddrLocY = 331, IfEndLine = 1, CampID = 0},
}

-- 阳光雨林月门传送表
YangGuangYuLing_MoonDoorGoToAddress_Tab = 
{
{AddrName = "[暗礁海入口]", AddrMapID = 23, AddrLocX = 390, AddrLocY = 242, IfEndLine = 1, CampID = 0},
{AddrName = "    子爵空间传送塔", AddrMapID = 23, AddrLocX =319, AddrLocY = 303, IfEndLine = 1, CampID = 0},
{AddrName = "    高级子爵空间传送塔", AddrMapID = 23, AddrLocX = 342, AddrLocY = 183, IfEndLine = 1, CampID = 0},
{AddrName = "    伯爵空间传送塔", AddrMapID = 23, AddrLocX = 150, AddrLocY = 260, IfEndLine = 1, CampID = 0},
{AddrName = "    高级伯爵空间传送塔", AddrMapID = 23, AddrLocX = 324, AddrLocY = 161, IfEndLine = 1, CampID = 0},
{AddrName = "    侯爵空间传送塔", AddrMapID = 23, AddrLocX = 223, AddrLocY = 156, IfEndLine = 1, CampID = 0},
{AddrName = "    高级侯爵空间传送塔", AddrMapID = 23, AddrLocX = 245, AddrLocY = 104, IfEndLine = 1, CampID = 0},
{AddrName = "[钢铁隧道入口]", AddrMapID = 23, AddrLocX = 245, AddrLocY = 84, IfEndLine = 1, CampID = 0},
}

-- 珊瑚群岛月门传送表
ShanHuQunDao_MoonDoorGoToAddress_Tab = 
{
{AddrName = "[天空城入口]", AddrMapID = 10, AddrLocX = 197, AddrLocY = 178, IfEndLine = 1, CampID = 1},
{AddrName = "    公民空间传送塔", AddrMapID = 10, AddrLocX = 265, AddrLocY = 219, IfEndLine = 1, CampID = 1},
{AddrName = "    男爵空间传送塔", AddrMapID = 10, AddrLocX = 175, AddrLocY = 315, IfEndLine = 1, CampID = 1},
{AddrName = "    高级男爵空间传送塔", AddrMapID = 10, AddrLocX = 162, AddrLocY = 260, IfEndLine = 1, CampID = 1},
{AddrName = "    国有资源采集区", AddrMapID = 10, AddrLocX = 166, AddrLocY = 240, IfEndLine = 1, CampID = 1},
{AddrName = "    1档资源采集区A", AddrMapID = 10, AddrLocX = 349, AddrLocY = 133, IfEndLine = 1, CampID = 1},
{AddrName = "    1档资源采集区B", AddrMapID = 10, AddrLocX = 157, AddrLocY = 325, IfEndLine = 1, CampID = 1},
{AddrName = "    2档资源采集区A", AddrMapID = 10, AddrLocX = 334, AddrLocY = 243, IfEndLine = 1, CampID = 1},
{AddrName = "    2档资源采集区B", AddrMapID = 10, AddrLocX = 325, AddrLocY = 261, IfEndLine = 1, CampID = 1},
{AddrName = "    3档资源采集区A", AddrMapID = 10, AddrLocX = 257, AddrLocY = 358, IfEndLine = 1, CampID = 1},
{AddrName = "[麦穗平原入口]", AddrMapID = 10, AddrLocX = 136, AddrLocY = 283, IfEndLine = 1, CampID = 1},
}

-- 麦穗平原月门传送表
MaiShuiPinYuan_MoonDoorGoToAddress_Tab = 
{
{AddrName = "[珊瑚群岛入口]", AddrMapID = 25, AddrLocX = 387, AddrLocY = 174, IfEndLine = 1, CampID = 1},
{AddrName = "    子爵空间传送塔", AddrMapID = 25, AddrLocX = 269, AddrLocY = 192, IfEndLine = 1, CampID = 1},
{AddrName = "    高级子爵空间传送塔", AddrMapID = 25, AddrLocX = 310, AddrLocY = 268, IfEndLine = 1, CampID = 1},
{AddrName = "    伯爵空间传送塔", AddrMapID = 25, AddrLocX = 188, AddrLocY = 180, IfEndLine = 1, CampID = 1},
{AddrName = "    高级伯爵空间传送塔", AddrMapID = 25, AddrLocX = 234, AddrLocY = 358, IfEndLine = 1, CampID = 1},
{AddrName = "    侯爵空间传送塔", AddrMapID = 25, AddrLocX = 111, AddrLocY = 330, IfEndLine = 1, CampID = 1},
{AddrName = "    高级侯爵空间传送塔", AddrMapID = 25, AddrLocX = 149, AddrLocY = 352, IfEndLine = 1, CampID = 1},
{AddrName = "[时光走廊入口]", AddrMapID = 25, AddrLocX = 110, AddrLocY = 358, IfEndLine = 1, CampID = 1},
}

function SkillGoods_JieShi_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,765) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(MapID)
	local CampID = API_GetActorCamp(ActorID)
	local MapTable1
	local MapTable2
	if ((StaticMapID == 9 or  StaticMapID == 23) and CampID == 0) or ((StaticMapID == 10 or StaticMapID == 25) and CampID == 1) then 
		for i in MoonDoorNoGoToAddress_Tab do
			if StaticMapID == MoonDoorNoGoToAddress_Tab[i].AddrMapID and CampID == MoonDoorNoGoToAddress_Tab[i].CampID then
				local NoGoToLocX = MoonDoorNoGoToAddress_Tab[i].AddrLocX
				local NoGoToLocY = MoonDoorNoGoToAddress_Tab[i].AddrLocY
				local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
				if PublicFun_AccountDistance(TileX,TileY,NoGoToLocX,NoGoToLocY) < 6 then
					local NoGoToAddressName = MoonDoorNoGoToAddress_Tab[i].AddrName
					API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(765)..'不能在 '..NoGoToAddressName..' 的传送门五米范围内使用！')
					return 0
				end
			end
		end
		if CampID == 0 then
			MapTable1 = AnJiaoHai_MoonDoorGoToAddress_Tab
			MapTable2 = YangGuangYuLing_MoonDoorGoToAddress_Tab
		else
			MapTable1 = ShanHuQunDao_MoonDoorGoToAddress_Tab
			MapTable2 = MaiShuiPinYuan_MoonDoorGoToAddress_Tab
		end
		API_ResponseWrite('<name>界石</name>')
		API_ResponseWrite('<win rect="600,100,330,540" move="1" alpha="200" balpha="100"></win>') 
		API_ResponseWrite('<text>请选择您想去的地点，选择后将打开月门连接到您选择的目的地：</text><br><br>')
		for AddrID in MapTable1 do
			if AddrID ~= 1 and AddrID ~= table.getn(MapTable1) and AddrID <= 4 then
				API_ResponseWrite('<a underline="1" href="NPCFunc_MoonDoor?1=1&2='..AddrID..'">'..MapTable1[AddrID].AddrName..'  </a>')
				if MapTable1[AddrID].IfEndLine ~= 0 then
					API_ResponseWrite('<br><br>')
				end
			end
		end
		for AddrID in MapTable2 do
			if AddrID ~= 1 and AddrID ~= table.getn(MapTable2) then
				API_ResponseWrite('<a underline="1" href="NPCFunc_MoonDoor?1=2&2='..AddrID..'">'..MapTable2[AddrID].AddrName..'  </a>')
				if MapTable2[AddrID].IfEndLine ~= 0 then
					API_ResponseWrite('<br><br>')
				end
			end
		end
		for AddrID in MapTable1 do
			if AddrID ~= 1 and AddrID ~= table.getn(MapTable1) and AddrID >4 then
				API_ResponseWrite('<a underline="1" href="NPCFunc_MoonDoor?1=1&2='..AddrID..'">'..MapTable1[AddrID].AddrName..'  </a>')
				if MapTable1[AddrID].IfEndLine ~= 0 then
					API_ResponseWrite('<br><br>')
				end
			end
		end
		API_ResponseWrite('<br><a>取消</a>')
		API_ResponseFlush(ActorID)
		return 1
	else
		if CampID == 0 then
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(765)..'只能在 暗礁海 和 阳光雨林 使用')
		else
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(765)..'只能在 珊瑚群岛 和 麦穗平原 使用')
		end
		return 0
	end
	return 0
end

GLOBAL_MoonDoor_Convection={}

function SkillGoods_MoonDoor_TimerTriggerCallFunc(FastID1,FastID2)
	if API_GetMonsterID(FastID1) <= 0 then
		if API_GetMonsterID(FastID2) > 0 then
			API_DestroyMonster(FastID2)
		end
		local ActorID = API_GetMonsterPrizeActor(FastID1)
		if API_ActorIsOnline(ActorID) then
			API_VarDataSetNumber(ActorID,0,18111,0)
			API_VarDataSetNumber(ActorID,0,18112,0)
			API_VarDataSetNumber(ActorID,0,18113,0)
		end
		return
	end
	if API_GetMonsterID(FastID2) <= 0 then
		if API_GetMonsterID(FastID1) > 0 then
			API_DestroyMonster(FastID1)
		end
		local ActorID = API_GetMonsterPrizeActor(FastID2)
		if API_ActorIsOnline(ActorID) then
			API_VarDataSetNumber(ActorID,0,18111,0)
			API_VarDataSetNumber(ActorID,0,18112,0)
			API_VarDataSetNumber(ActorID,0,18113,0)
		end
		return
	end
	local ActorID = API_GetMonsterPrizeActor(FastID1)
	if API_ActorIsOnline(ActorID) then
		API_VarDataSetNumber(ActorID,0,18111,0)
		API_VarDataSetNumber(ActorID,0,18112,0)
		API_VarDataSetNumber(ActorID,0,18113,0)
	end
	API_DestroyMonster(FastID1)
	API_DestroyMonster(FastID2)
	GLOBAL_MoonDoor_Convection[FastID1] = nil
	GLOBAL_MoonDoor_Convection[FastID2] = nil
end



function SkillGoods_SDJSTGM_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,312) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == MapID then
		API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
		return 0
	else
		for i = 1,table.getn(LaJuZhanFuBenMapID) do 
			if StaticMapID == LaJuZhanFuBenMapID[i] then
				API_ActorStartSelect(ActorID,'SkillGoods_SDJSTGM',16) 
				API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
				return 1
			elseif i == table.getn(LaJuZhanFuBenMapID) then
				API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
				return 0
			end
		end
	end		
	return 0
end

function SkillGoods_SDJSTGM()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 
	if API_ActorGetGoodsNum(ActorID,312) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == MapID then
		API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
		return 0
	else
		for i = 1,table.getn(LaJuZhanFuBenMapID) do 
			if StaticMapID == LaJuZhanFuBenMapID[i] then
				if SelectType == 1 then
					if API_GetMonsterID(SelectID) <= 0 then
						API_ActorStartSelect(ActorID,'SkillGoods_SDJSTGM',16) 
						API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
						return
					end
					if API_MonsterGetPropNum(SelectID,242) == 4 and API_MonsterGetPropNum(SelectID,244) <= 0 and API_MonsterGetPropNum(SelectID,PD_PROP_CAMPID) ~= API_GetActorCamp(ActorID) then
						if not API_MonsterIsBoss(SelectID) then
							if API_GetMonsterLv(SelectID) <= 40 then
								if API_ActorRemoveGoods(ActorID,312,1,'使用点金手套包') then
									API_ActorUseSkill(ActorID,319,1,0,0,0,SelectID)
									API_ActorSendMsg(ActorID,3,'您使用'..API_GetGoodsName(312)..'杀死了 '..API_GetMonsterName(SelectID)..',并额外获得150士气')
									API_ActorSendMsg(ActorID,7,'您使用'..API_GetGoodsName(312)..'杀死了 '..API_GetMonsterName(SelectID)..',并额外获得150士气')
									API_ActorAddMorale(ActorID,150,0,'使用超级点金手套得士气')
								end
							elseif API_ActorGetGoodsNum(ActorID,312) > 1 then
								if API_ActorRemoveGoods(ActorID,312,2,'使用点金手套包') then
									API_ActorUseSkill(ActorID,319,1,0,0,0,SelectID)
									API_ActorSendMsg(ActorID,3,'您使用2个'..API_GetGoodsName(312)..'杀死了 '..API_GetMonsterName(SelectID)..',并额外获得150士气')
									API_ActorSendMsg(ActorID,7,'您使用2个'..API_GetGoodsName(312)..'杀死了 '..API_GetMonsterName(SelectID)..',并额外获得150士气')
									API_ActorAddMorale(ActorID,150,0,'使用超级点金手套得士气')
								end
							else
								API_ActorStartSelect(ActorID,'SkillGoods_SDJSTGM',16) 
								API_ActorSendMsg(ActorID,3,'杀死伯爵档以上的敌兵需要消耗两个'..API_GetGoodsName(312)..'')
							end
						else
							API_ActorStartSelect(ActorID,'SkillGoods_SDJSTGM',16) 
							API_ActorSendMsg(ActorID,3,'不能对BOSS使用，请左键点击您想杀死的敌方小兵')
						end
					else
						API_ActorStartSelect(ActorID,'SkillGoods_SDJSTGM',16) 
						API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
					end
				else
					API_ActorStartSelect(ActorID,'SkillGoods_SDJSTGM',16) 
					API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
				end
				break
			elseif i == table.getn(LaJuZhanFuBenMapID) then
				API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
				return 0
			end
		end
	end
end


function SkillGoods_SDJSTNJ_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,313) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_GetActorExpLevel(ActorID) < 16 then
		API_ActorSendMsg(ActorID,3,'只有爵位达到五等男爵的玩家才允许使用'..API_GetGoodsName(313)..'')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == MapID then
		API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
		return 0
	else
		for i = 1,table.getn(LaJuZhanFuBenMapID) do 
			if StaticMapID == LaJuZhanFuBenMapID[i] then
				local Peerage = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
				if Peerage >= 2 then
					API_ActorStartSelect(ActorID,'SkillGoods_SDJSTNJ',16) 
					API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
					return 1
				else
					API_ActorSendMsg(ActorID,3,'本道具只能在男爵难度以上的拉锯战浮空岛内使用')
					return 0
				end
				break
			elseif i == table.getn(LaJuZhanFuBenMapID) then
				API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
				return 0
			end		
		end
	end		
	return 0
end

function SkillGoods_SDJSTNJ()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 

	if API_ActorGetGoodsNum(ActorID,313) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if API_GetActorExpLevel(ActorID) < 16 then
		API_ActorSendMsg(ActorID,3,'只有爵位达到五等男爵的玩家才允许使用'..API_GetGoodsName(313)..'')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == MapID then
		API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
		return 0
	else
		for i = 1,table.getn(LaJuZhanFuBenMapID) do 
			if StaticMapID == LaJuZhanFuBenMapID[i] then
				local Peerage = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
				if Peerage >= 2 then
					if SelectType == 1 then
						if API_GetMonsterID(SelectID) <= 0 then
							API_ActorStartSelect(ActorID,'SkillGoods_SDJSTNJ',16) 
							API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
							return
						end
						if API_MonsterGetPropNum(SelectID,242) == 4 and API_MonsterGetPropNum(SelectID,244) <= 0 and API_MonsterGetPropNum(SelectID,PD_PROP_CAMPID) ~= API_GetActorCamp(ActorID) then
							if not API_MonsterIsBoss(SelectID) then
								if API_GetMonsterLv(SelectID) <= 40 then
									if API_ActorRemoveGoods(ActorID,313,1,'使用点金手套包') then
										API_ActorUseSkill(ActorID,319,1,0,0,0,SelectID)
										API_ActorSendMsg(ActorID,3,'您使用'..API_GetGoodsName(313)..'杀死了 '..API_GetMonsterName(SelectID)..',并额外获得280士气')
										API_ActorSendMsg(ActorID,7,'您使用'..API_GetGoodsName(313)..'杀死了 '..API_GetMonsterName(SelectID)..',并额外获得280士气')
										API_ActorAddMorale(ActorID,280,0,'使用超级点金手套得士气')
									end
								elseif API_ActorGetGoodsNum(ActorID,313) > 1 then
									if API_ActorRemoveGoods(ActorID,313,2,'使用点金手套包') then
										API_ActorUseSkill(ActorID,319,1,0,0,0,SelectID)
										API_ActorSendMsg(ActorID,3,'您使用2个'..API_GetGoodsName(313)..'杀死了 '..API_GetMonsterName(SelectID)..',并额外获得280士气')
										API_ActorSendMsg(ActorID,7,'您使用2个'..API_GetGoodsName(313)..'杀死了 '..API_GetMonsterName(SelectID)..',并额外获得280士气')
										API_ActorAddMorale(ActorID,280,0,'使用超级点金手套得士气')
									end
								else
									API_ActorStartSelect(ActorID,'SkillGoods_SDJSTNJ',16) 
									API_ActorSendMsg(ActorID,3,'杀死伯爵档以上的敌兵需要消耗两个'..API_GetGoodsName(313)..'')
								end
							else
								API_ActorStartSelect(ActorID,'SkillGoods_SDJSTNJ',16) 
								API_ActorSendMsg(ActorID,3,'不能对BOSS使用，请左键点击您想杀死的敌方小兵')
							end
						else
							API_ActorStartSelect(ActorID,'SkillGoods_SDJSTNJ',16) 
							API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
						end
					else
						API_ActorStartSelect(ActorID,'SkillGoods_SDJSTNJ',16) 
						API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
					end
				else
					API_ActorSendMsg(ActorID,3,'本道具只能在男爵难度以上的拉锯战浮空岛内使用')
					return 0
				end
				break
			elseif i == table.getn(LaJuZhanFuBenMapID) then
				API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
				return 0
			end
		end
	end
end



function SkillGoods_SDJSTZJ_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,314) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_GetActorExpLevel(ActorID) < 31 then
		API_ActorSendMsg(ActorID,3,'只有爵位达到五等子爵的玩家才允许使用'..API_GetGoodsName(314)..'')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == MapID then
		API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
		return 0
	else
		for i = 1,table.getn(LaJuZhanFuBenMapID) do 
			if StaticMapID == LaJuZhanFuBenMapID[i] then
				local Peerage = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
				if Peerage >= 4 then
					API_ActorStartSelect(ActorID,'SkillGoods_SDJSTZJ',16) 
					API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
					return 1
				else
					API_ActorSendMsg(ActorID,3,'本道具只能在子爵难度以上的拉锯战浮空岛内使用')
					return 0
				end
				break
			elseif i == table.getn(LaJuZhanFuBenMapID) then
				API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
				return 0
			end		
		end
	end
	return 0
end

function SkillGoods_SDJSTZJ()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 
	if API_ActorGetGoodsNum(ActorID,314) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == MapID then
		API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
		return 0
	else
		for i = 1,table.getn(LaJuZhanFuBenMapID) do 
			if StaticMapID == LaJuZhanFuBenMapID[i] then
				local Peerage = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
				if Peerage >= 4 then
					if API_GetActorExpLevel(ActorID) < 31 then
						API_ActorSendMsg(ActorID,3,'只有爵位达到五等男爵的玩家才允许使用'..API_GetGoodsName(314)..'')
						return 0
					end
					if SelectType == 1 then
						if API_GetMonsterID(SelectID) <= 0 then
							API_ActorStartSelect(ActorID,'SkillGoods_SDJSTZJ',16) 
							API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
							return
						end
						if API_MonsterGetPropNum(SelectID,242) == 4 and API_MonsterGetPropNum(SelectID,244) <= 0 and API_MonsterGetPropNum(SelectID,PD_PROP_CAMPID) ~= API_GetActorCamp(ActorID) then
							if not API_MonsterIsBoss(SelectID) then
								if API_GetMonsterLv(SelectID) <= 40 then
									if API_ActorRemoveGoods(ActorID,314,1,'使用点金手套包') then
										API_ActorUseSkill(ActorID,319,1,0,0,0,SelectID)
										API_ActorSendMsg(ActorID,3,'您使用'..API_GetGoodsName(314)..'杀死了 '..API_GetMonsterName(SelectID)..',并额外获得420士气')
										API_ActorSendMsg(ActorID,7,'您使用'..API_GetGoodsName(314)..'杀死了 '..API_GetMonsterName(SelectID)..',并额外获得420士气')
										API_ActorAddMorale(ActorID,420,0,'使用超级点金手套得士气')
									end
								elseif API_ActorGetGoodsNum(ActorID,314) > 1 then
									if API_ActorRemoveGoods(ActorID,314,2,'使用点金手套包') then
										API_ActorUseSkill(ActorID,319,1,0,0,0,SelectID)
										API_ActorSendMsg(ActorID,3,'您使用2个'..API_GetGoodsName(314)..'杀死了 '..API_GetMonsterName(SelectID)..',并额外获得420士气')
										API_ActorSendMsg(ActorID,7,'您使用2个'..API_GetGoodsName(314)..'杀死了 '..API_GetMonsterName(SelectID)..',并额外获得420士气')
										API_ActorAddMorale(ActorID,420,0,'使用超级点金手套得士气')
									end
								else
									API_ActorStartSelect(ActorID,'SkillGoods_SDJSTZJ',16) 
									API_ActorSendMsg(ActorID,3,'杀死伯爵档以上的敌兵需要消耗两个'..API_GetGoodsName(314)..'')
								end
							else
								API_ActorStartSelect(ActorID,'SkillGoods_SDJSTZJ',16) 
								API_ActorSendMsg(ActorID,3,'不能对BOSS使用，请左键点击您想杀死的敌方小兵')
							end
						else
							API_ActorStartSelect(ActorID,'SkillGoods_SDJSTZJ',16) 
							API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
						end
					else
						API_ActorStartSelect(ActorID,'SkillGoods_SDJSTZJ',16) 
						API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
					end
				else
					API_ActorSendMsg(ActorID,3,'本道具只能在子爵难度以上的拉锯战浮空岛内使用')
					return 0
				end
				break
			elseif i == table.getn(LaJuZhanFuBenMapID) then
				API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
				return 0
			end
		end
	end
end


ShiQiYaoJiu_InfoTable = {
	[306]={NeedLV=1,NeedPeerage=1,Xiaoguo=700,Zhuangtai=177001,},
	[307]={NeedLV=16,NeedPeerage=2,Xiaoguo=1400,Zhuangtai=177002,},
	[308]={NeedLV=31,NeedPeerage=4,Xiaoguo=2100,Zhuangtai=177003,},
	[309]={NeedLV=1,NeedPeerage=1,Xiaoguo=1500,Zhuangtai=177004,},
	[310]={NeedLV=16,NeedPeerage=2,Xiaoguo=2800,Zhuangtai=177005,},
	[311]={NeedLV=31,NeedPeerage=4,Xiaoguo=3800,Zhuangtai=177006,},
}


function SkillGoods_SQYJ_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if ShiQiYaoJiu_InfoTable[GoodsID] == nil then
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == MapID then
		API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
		return 0
	else
		for i = 1,table.getn(LaJuZhanFuBenMapID) do 
			if StaticMapID == LaJuZhanFuBenMapID[i] then
				local CampID = API_GetActorCamp(ActorID)
				local Peerage = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
				local Redcishu = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Redcishu)
				local Bluecishu = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Bluecishu)
				local LoseOK = 0
				if CampID == 0 and Redcishu >= 1 then
					LoseOK = 1
				elseif CampID == 1 and Bluecishu >= 1 then
					LoseOK = 1
				end
				if Redcishu + Bluecishu >= 1 then
					local ExpLevel = API_GetActorExpLevel(ActorID)
					local NeedLV = ShiQiYaoJiu_InfoTable[GoodsID].NeedLV
					local NeedPeerage = ShiQiYaoJiu_InfoTable[GoodsID].NeedPeerage
					if NeedPeerage <= Peerage then
						if NeedLV <= ExpLevel then
							local Xiaoguo = ShiQiYaoJiu_InfoTable[GoodsID].Xiaoguo
							local StatusID = ShiQiYaoJiu_InfoTable[GoodsID].Zhuangtai
							if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用士气药酒') then
								API_ActorAddStatus(ActorID,StatusID,0)
								API_ActorSendMsg(ActorID,3,'您使用一瓶'..API_GetGoodsName(GoodsID)..'获得'..Xiaoguo..'士气')
								return 1
							else
								return 0
							end
						else
							API_ActorSendMsg(ActorID,3,'必须爵位达到'.. GLOBAL_Exploit[NeedLV].PeerageDepict ..'以上才能使用')
							return 0
						end
					else
						API_ActorSendMsg(ActorID,3,'本道具只能在'..Battle_GuankaInfo[NeedPeerage]..'以上的拉锯战浮空岛使用')
						return 0
					end
				else
					API_ActorSendMsg(ActorID,3,'本道具只能在有城堡已经被摧毁一次以上的拉锯战浮空岛内使用')
					return 0
				end
				break
			elseif i == table.getn(LaJuZhanFuBenMapID) then
				API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
				return 0
			end
		end
	end
	return 0
end

--装备解绑
function OnUseUnBandGoods(lActorID,lUseGoodsID,lBandGoodsID,lBGMainType,lBGSubType,lBGLevel,lBGContType,lBGLoc)
	if lBGMainType == 1 then --判断是否是装备
		if API_ActorGetGoodsPropNum(lActorID,lBGContType,lBGLoc,4) == 1 then --判断是否绑定
			local DangCi = API_ActorGetGoodsPropNum(lActorID,lBGContType,lBGLoc,51) --判断装备档次
			if DangCi > 0 and DangCi < 3 then
				return DangCi
			elseif DangCi > 2 then
				API_ActorSendMsg(lActorID,2,'该道具只能对一档和二档装备使用')
			end
		else 
			API_ActorSendMsg(lActorID,2,'该装备未绑定')
		end
	else
		API_ActorSendMsg(lActorID,2,'只能解绑装备')
	end
	return 0
end

--使用生命药水
function LifeProps_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local StaticMapID = API_GetStaticMapID(MapID)
	local PanDuan = 0
	local StatusID = 0
	for i,v in Public_NewPlayMapTable do
		if MapConfigID == v or MapID == StaticMapID  then
			PanDuan = 1
		else
			PanDuan = 2
		end
	end
	if PanDuan == 1 then
		if GoodsID == 101 then
			StatusID = 621001
		elseif GoodsID == 102 then
			StatusID = 621002
		elseif GoodsID == 103 then
			StatusID = 621003
		elseif GoodsID == 104 then
			StatusID = 621004
		elseif GoodsID == 105 then
			StatusID = 621005
		end
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除'..API_GetGoodsName(GoodsID)..'') then
			API_ActorAddStatus(ActorID,StatusID,0)
			return 1
		end
	elseif PanDuan == 2 then
		if GoodsID == 101 then
			StatusID = 30001
		elseif GoodsID == 102 then
			StatusID = 30002
		elseif GoodsID == 103 then
			StatusID = 30003
		elseif GoodsID == 104 then
			StatusID = 30004
		elseif GoodsID == 105 then
			StatusID = 30005
		end
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除'..API_GetGoodsName(GoodsID)..'') then
			API_ActorAddStatus(ActorID,StatusID,0)
			return 1
		end
	end
	return 0
end
