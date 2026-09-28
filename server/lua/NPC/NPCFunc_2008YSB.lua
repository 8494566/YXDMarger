-- ---------------------
-- 所有静态地图NPC的功能
-- ---------------------

-- --------
-- 打开仓库
-- --------
function NPCFunc_OpenWarehouse_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenWarehouse(ActorID, FastID)
end

-- --------
-- 打开商店
-- --------
function NPCFunc_OpenNPCTrade_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenNPCTrade(ActorID, FastID)
end

-- --------
-- 打开房屋拍卖
-- --------
function NPCFunc_OpenHouseTrade_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	-- API_Trace('打开房屋拍卖')
	
	API_OpenHouseTrade(ActorID, FastID)
end

-- --------
-- 点击NPC申请购买副本房屋
-- --------
function NPCFunc_BuyDynamicHouse_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	-- API_Trace('点击NPC申请购买副本房屋')
	
	API_BuyDynamicHouse(ActorID, FastID)
end

-- --------
-- 点击NPC申请入住自己的房屋
-- --------
function NPCFunc_ApplyMyHouse_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	-- API_Trace('申请入住自己的房屋')
	
	API_ApplyMyHouse(ActorID, FastID)
end


-- --------
-- 创建自己房屋的入口点
-- --------
function NPCFunc_CreateMyHouseEntry_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	-- API_Trace('创建自己房屋的入口点')

	API_CreateMyHouseEntry(ActorID, FastID)
end


-- --------
-- 点击NPC进入房屋
-- --------
function NPCFunc_ClickEntryMonster_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	-- API_Trace('点击NPC进入房屋')
	
	API_ClickEntryMonster(ActorID, FastID)
end

-- --------
-- 土地管理
-- --------
function NPCFunc_OpenNPCLand_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenNPCLand(ActorID, FastID)
end

-- --------
-- 打开交易所
-- --------
function NPCFunc_OpenBourse_Title()
	local ActorID = API_RequestGetActorID()
	
	API_OpenBourse(ActorID)
end

-- ---------
-- 装备改造0
-- ---------
function NPCFunc_OpenRebuildEquip0_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenRebuildEquip(ActorID, FastID, 0)
end

-- ---------
-- 装备改造1
-- ---------
function NPCFunc_OpenRebuildEquip1_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenRebuildEquip(ActorID, FastID, 1)
end

-- ---------
-- 装备改造2
-- ---------
function NPCFunc_OpenRebuildEquip2_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenRebuildEquip(ActorID, FastID, 2)
end

-- ---------
-- 装备改造3
-- ---------
function NPCFunc_OpenRebuildEquip3_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	API_OpenRebuildEquip(ActorID, FastID, 10)
--	API_ResponseWrite('<text color="255,0,0">暂不开放，敬请期待！</text><br>')
--	API_ResponseWrite('<br><a>确定</a><br>')
end

-- ---------
-- 装备改造4
-- ---------
function NPCFunc_OpenRebuildEquip4_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenRebuildEquip(ActorID, FastID, 4)
end

-- ---------
-- 装备改造5
-- ---------
function NPCFunc_OpenRebuildEquip5_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenRebuildEquip(ActorID, FastID, 5)
end

-- ---------
-- 装备改造6
-- ---------
function NPCFunc_OpenRebuildEquip6_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenRebuildEquip(ActorID, FastID, 6)
end

-- ---------
-- 装备改造7
-- ---------
function NPCFunc_OpenRebuildEquip7_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenRebuildEquip(ActorID, FastID, 7)
end

-- ---------
-- 装备改造8
-- ---------
function NPCFunc_OpenRebuildEquip8_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenRebuildEquip(ActorID, FastID, 8)
end

-- ---------
-- 装备改造9
-- ---------
function NPCFunc_OpenRebuildEquip9_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenRebuildEquip(ActorID, FastID, 11)
end

-- ---------
-- 装备改造10
-- ---------
function NPCFunc_OpenRebuildEquip10_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	
--	API_ResponseWrite('<text>下一次维护，将开放装备凿卡功能，支持给无卡片槽和1卡片槽的装备凿卡，一件装备最多拥有两个卡片槽。</text><br>')
--	API_ResponseWrite('<br><a>确定</a><br>')
	API_OpenRebuildEquip(ActorID, FastID, 12)
end

-- ---------
-- 技能学习
-- ---------
function NPCFunc_OpenSkillTeach_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenSkillTeach(ActorID, FastID,0)
end
-- ---------
-- 生活技能学习
-- ---------
function NPCFunc_OpenWSkillTeach_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenWSkillTeach(ActorID, FastID)
end
-- ---------
--前往空间传送塔内部
-- ---------
function NPCFunc_Gotokongjian_Title()
	local ActorID = API_RequestGetActorID()
	local NPCID = API_VarDataGetNumber(ActorID,0,32711)
	local CampID = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem ~= 999 then
		for i = 1,table.getn(LaJuZhanFuBenMapID) do 
			if StaticMapID == LaJuZhanFuBenMapID[i] then
				API_ResponseWrite('<text Size="17" color="255,0,0">中途退出会导致本场战斗评价值清零，即使下次再进入同一个浮空岛，奖励也会大大降低！</text><br>')
				API_ResponseWrite('<text color="0,255,255">至少需要完成一回合的战斗才能得到道具和金币奖励：</text><br>')
				API_ResponseWrite('<text color="0,255,0">杀死敌方小兵数量超过40奖励突击勋章一枚</text><br>')
				API_ResponseWrite('<text color="150,60,255">积累更高的士气可以获得更多的购物券奖励</text><br>')
				API_ResponseWrite('<text color="255,0,0">取得一次胜利获得金币奖励，两次胜利获得2.25倍金币奖励，三次胜利获得3.75倍金币奖励。</text><br>')
				API_ResponseWrite('<br><a href="NPCFunc_Gotokongjian_Title?1=999">确定离开</a><br>')
				API_ResponseWrite('<br><a>我点错了</a><br>')
				return
			end
		end
		for i = 1,table.getn(FangShouFuBenMapID) do 
			if StaticMapID == FangShouFuBenMapID[i] then
				API_ResponseWrite('<text color="0,255,255">至少要防守超过20轮</text><text>才能得到</text><text color="0,255,255">建设图纸与土地契约</text><text>奖励</text><br>')
				API_ResponseWrite('<text color="0,255,0">以后每多防守20轮物品奖励数量增加一个</text><br>')
				API_ResponseWrite('<text color="255,0,0">通关后所有物品奖励数量X2</text><br>')
				API_ResponseWrite('<text color="255,0,255">防守超过40轮</text><text>可以获得</text><img srcgd="80191" tipgd="80191"><text color="254,249,220">'..API_GetGoodsName(80191)..'</text><br>')
				API_ResponseWrite('<br><a href="NPCFunc_Gotokongjian_Title?1=999">确定离开</a><br>')
				API_ResponseWrite('<br><a>我点错了</a><br>')
				return
			end
		end
		for i = 1,table.getn(TaFangFuBenMapID) do 
			if StaticMapID == TaFangFuBenMapID[i] then
				API_ResponseWrite('<text color="0,255,255">至少要守住25轮机奴族的进攻</text><text>才能得到</text><text color="0,255,255">宝石</text><text>奖励</text><br>')
				API_ResponseWrite('<text color="0,255,0">以后每多防守25轮物品奖励数量增加一个</text><br>')
				API_ResponseWrite('<text color="255,0,0">通关后所有物品奖励数量X2</text><br>')
				API_ResponseWrite('<br><a href="NPCFunc_Gotokongjian_Title?1=999">确定离开</a><br>')
				API_ResponseWrite('<br><a>我点错了</a><br>')
				return
			end
		end
		for i = 1,table.getn(DuiKangFuBenMapID) do 
			if StaticMapID == DuiKangFuBenMapID[i] then
				API_ResponseWrite('<text color="0,255,255">必须要摧毁敌人城堡才能获得胜利奖励</text><br>')
				API_ResponseWrite('<br><a href="NPCFunc_Gotokongjian_Title?1=999">确定离开</a><br>')
				API_ResponseWrite('<br><a>我点错了</a><br>')
				return
			end
		end
		if StaticMapID >= 1853 and StaticMapID <= 1874 then
			API_ResponseWrite('<text color="0,255,255">冲到本峡谷的尽头，点击争夺浮空岛传送门即可前往争夺浮空岛</text><br>')
			API_ResponseWrite('<text color="0,255,0">进入争夺浮空岛后摧毁敌方城堡，可以获得金币奖励</text><br>')
			API_ResponseWrite('<text color="150,60,255">如果冲到本峡谷尽头后放弃进入争夺浮空岛将只能得到购物券奖励</text><br>')
			API_ResponseWrite('<text color="255,0,0">如果现在返回空间传送塔将没有任何奖励</text><br>')
			API_ResponseWrite('<br><a href="NPCFunc_Gotokongjian_Title?1=999">确定离开</a><br>')
			API_ResponseWrite('<br><a>我点错了</a><br>')
			return
		elseif StaticMapID >= 1876 and StaticMapID <= 1890 then
			API_ResponseWrite('<text>消灭机奴族可获得士气，通过士气购买士气装备能带来战斗能力的提升</text><br>')
			API_ResponseWrite('<text>在本训练营的尽头可以让BOSS囚笼守卫将您传送进入BOSS囚笼</text><br>')
			API_ResponseWrite('<text color="0,255,255">击败BOSS后与BOSS囚笼内的训练营教官对话，可以领取大量金币奖励</text><br>')
			API_ResponseWrite('<text color="255,0,0">如果现在离开或死亡回空间传送塔，您的金币奖励将减半（一号训练营中途离开没有金币奖励）</text><br>')
			API_ResponseWrite('<br><a href="NPCFunc_Gotokongjian_Title?1=999">确定离开</a><br>')
			API_ResponseWrite('<br><a>我点错了</a><br>')
			return
		end
		
	end
	API_ActorSendMsg(ActorID,4,'')
	if CampID == 0 then
		if NPCID == 11107 or NPCID == 11498 or NPCID == 11607 then
			if StaticMapID == MapID then
				API_ActorGoToMap(ActorID,1,261,95)
			else
				if GLOBAL_PingJiaXiTong_StaticMapID[StaticMapID] ~= nil then
					GLOBAL_PingJiaXiTong_StaticMapID[StaticMapID](ActorID,MapID)
				end
				if GLOBAL_Balance_StaticMapID[StaticMapID] ~= nil then
					GLOBAL_Balance_StaticMapID[StaticMapID](ActorID,MapID,0)
				else
					if (StaticMapID >= 1876 and StaticMapID <= 1890) or (StaticMapID >= 1891 and StaticMapID <= 1915) or (StaticMapID >= 1924 and StaticMapID <= 1928) or (StaticMapID >= 1853 and StaticMapID <= 1874) then
						API_VarDataSetNumber(ActorID,1,18041,1)
					end
					API_ActorGoToBackMap(ActorID)
				end
			end
		else
			API_ResponseWrite('<text>仅限联邦成员使用</text><br>')
			API_ResponseWrite('<a>确定</a><br>')
		end
	elseif CampID == 1 then
		if NPCID == 11106 or NPCID == 11498 or NPCID == 11607 then
			if StaticMapID == MapID then
				API_ActorGoToMap(ActorID,2,228,114)
			else
				if GLOBAL_PingJiaXiTong_StaticMapID[StaticMapID] ~= nil then
					GLOBAL_PingJiaXiTong_StaticMapID[StaticMapID](ActorID,MapID)
				end
				if GLOBAL_Balance_StaticMapID[StaticMapID] ~= nil then
					GLOBAL_Balance_StaticMapID[StaticMapID](ActorID,MapID,0)
				else
					if (StaticMapID >= 1876 and StaticMapID <= 1890) or (StaticMapID >= 1891 and StaticMapID <= 1915) or (StaticMapID >= 1924 and StaticMapID <= 1928) or (StaticMapID >= 1853 and StaticMapID <= 1874) then
						API_VarDataSetNumber(ActorID,1,18041,1)
					end
					API_ActorGoToBackMap(ActorID)
				end
			end
		else
			API_ResponseWrite('<text>仅限帝国成员使用</text><br>')
			API_ResponseWrite('<a>确定</a><br>')
		end
	end
end
-- ---------
--前往地表
-- ---------
function NPCFunc_Gotoworld_Title()
	local ActorID = API_RequestGetActorID()
	local NPCID = API_VarDataGetNumber(ActorID,0,32711)
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 0 then
		if NPCID == 11215 then
			API_ResponseWrite('<text>去地表与下层机奴族作战无法获得金币，而且帝国也只会授予您极少量的功勋，您确认还是要去吗？</text><br>')
			API_ResponseWrite('<a href="Gotoworld?1=0">还是要去</a><br>')
			API_ResponseWrite('<a>取消</a><br>')
		else
			API_ResponseWrite('<text>仅限联邦成员使用</text><br>')
			API_ResponseWrite('<a>确定</a><br>')
		end
	elseif CampID == 1 then
		if NPCID == 11225 then
			API_ResponseWrite('<text>去地表与下层机奴族作战无法获得金币，而且联邦也只会授予您极少量的功勋，您确认还是要去吗？</text><br>')
			API_ResponseWrite('<a href="Gotoworld?1=0">还是要去</a><br>')
			API_ResponseWrite('<a>取消</a><br>')
		else
			API_ResponseWrite('<text>仅限帝国成员使用</text><br>')
			API_ResponseWrite('<a>确定</a><br>')
		end
	end
end
function Gotoworld()
	local ActorID = API_RequestGetActorID()
	local NPCID = API_VarDataGetNumber(ActorID,0,32711)
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 0 then
		if NPCID == 11215 then
			API_ActorGoToMap(ActorID,9,126,396)
		else
			API_ResponseWrite('<text>仅限联邦成员使用</text><br>')
			API_ResponseWrite('<a>确定</a><br>')
		end
	elseif CampID == 1 then
		if NPCID == 11225 then
			API_ActorGoToMap(ActorID,10,198,182)
		else
			API_ResponseWrite('<text>仅限帝国成员使用</text><br>')
			API_ResponseWrite('<a>确定</a><br>')
		end
	end
end
-- ---------
--前往生产基地
-- ---------
local localtable_WorkBase = {
[1]={[0]={MapID=11,TileX=65,TileY=58,},[1]={MapID=13,TileX=65,TileY=58,},},
[2]={[0]={MapID=12,TileX=65,TileY=58,},[1]={MapID=14,TileX=65,TileY=58,},},
[3]={[0]={MapID=17,TileX=65,TileY=58,},[1]={MapID=19,TileX=65,TileY=58,},},
[99]={[0]={MapID=18,TileX=65,TileY=58,},[1]={MapID=20,TileX=65,TileY=58,},},
}
function NPCFunc_GotoWorkBase_Title()
	local ActorID = API_RequestGetActorID()
	API_ResponseWrite('<a href="GotoWorkBase?1=99">前往国有生产基地</a><br>')
	API_ResponseWrite('<a>取消</a><br>')
end
function GotoWorkBase()
	local ActorID = API_RequestGetActorID()
	local NPCID = API_VarDataGetNumber(ActorID,0,32711)
	local MonsterFastID = API_VarDataGetNumber(ActorID,0,32712)
	if API_GetMonsterID(MonsterFastID) <= 0 then
		return
	end
	local MonsterCampID = API_MonsterGetPropNum(MonsterFastID,PD_PROP_CAMPID)
	local ActorCampID = API_GetActorCamp(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	if ActorCampID == MonsterCampID then
		API_ActorGoToMap(ActorID,localtable_WorkBase[SelectItem][ActorCampID].MapID,localtable_WorkBase[SelectItem][ActorCampID].TileX,localtable_WorkBase[SelectItem][ActorCampID].TileY)
	else
		API_ResponseWrite('<text>这里不对外国人开放</text><br>')
		API_ResponseWrite('<a>取消</a><br>')
	end
end

-- ---------
--返回主城
-- ---------
function NPCFunc_BackCity_Title()
	local ActorID = API_RequestGetActorID()
	local NPCID = API_VarDataGetNumber(ActorID,0,32711)
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 0 then
		if NPCID == 11118  or NPCID == 11207 then
			API_ActorSendMsg(ActorID,4,'')
			API_ActorGoToMap(ActorID,1,261,95)
		else
			API_ResponseWrite('<text>仅限联邦成员使用</text><br>')
			API_ResponseWrite('<a>取消</a><br>')
		end
	elseif CampID == 1 then
		if NPCID == 11117 or NPCID == 11217 then
			API_ActorSendMsg(ActorID,4,'')
			API_ActorGoToMap(ActorID,2,228,114)
		else
			API_ResponseWrite('<text>仅限帝国成员使用</text><br>')
			API_ResponseWrite('<a>取消</a><br>')
		end
	end
end
-- ---------
--跨岛传送
-- ---------
GLOBAL_Navigate_ServerID = {
	[1] = { {ServerID=2,name='星月岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=3,name='狂欢岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=4,name='珍兽岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=5,name='军舰岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=6,name='珍珠岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=7,name='女巫岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=8,name='精灵岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=9,name='恶魔岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=10,name='海神岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			name='暖风岛',},
	[2] = { {ServerID=1,name='暖风岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=3,name='狂欢岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=4,name='珍兽岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=5,name='军舰岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=6,name='珍珠岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=7,name='女巫岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=8,name='精灵岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=9,name='恶魔岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=10,name='海神岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			name='星月岛',},
	[3] = { {ServerID=1,name='暖风岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=2,name='星月岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=4,name='珍兽岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=5,name='军舰岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=6,name='珍珠岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=7,name='女巫岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=8,name='精灵岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=9,name='恶魔岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=10,name='海神岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			name='狂欢岛',},
	[4] = { {ServerID=1,name='暖风岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=2,name='星月岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=3,name='狂欢岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=5,name='军舰岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=6,name='珍珠岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=7,name='女巫岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=8,name='精灵岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=9,name='恶魔岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=10,name='海神岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			name='珍兽岛',},
	[5] = { {ServerID=1,name='暖风岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=2,name='星月岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=3,name='狂欢岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=4,name='珍兽岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=6,name='珍珠岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=7,name='女巫岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=8,name='精灵岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=9,name='恶魔岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=10,name='海神岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			name='军舰岛',},
	[6] = { {ServerID=1,name='暖风岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=2,name='星月岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=3,name='狂欢岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=4,name='珍兽岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=5,name='军舰岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=7,name='女巫岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=8,name='精灵岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=9,name='恶魔岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=10,name='海神岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			name='珍珠岛',},
	[7] = { {ServerID=1,name='暖风岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=2,name='星月岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=3,name='狂欢岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=4,name='珍兽岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=5,name='军舰岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=6,name='珍珠岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=8,name='精灵岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=9,name='恶魔岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=10,name='海神岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			name='女巫岛',},
	[8] = { {ServerID=1,name='暖风岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=2,name='星月岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=3,name='狂欢岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=4,name='珍兽岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=5,name='军舰岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=6,name='珍珠岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=7,name='女巫岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=9,name='恶魔岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=10,name='海神岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			name='精灵岛',},
	[9] = { {ServerID=1,name='暖风岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=2,name='星月岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=3,name='狂欢岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=4,name='珍兽岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=5,name='军舰岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=6,name='珍珠岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=7,name='女巫岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=8,name='精灵岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=10,name='海神岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			name='恶魔岛',},
	[10] = { {ServerID=1,name='暖风岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=2,name='星月岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=3,name='狂欢岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=4,name='珍兽岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},
			{ServerID=5,name='军舰岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=6,name='珍珠岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=7,name='女巫岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=8,name='精灵岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}}, 
			{ServerID=9,name='恶魔岛',CampID={[0]={MapID=1,TileX=259,TileY=86},[1]={MapID=2,TileX=228,TileY=121}}},  
			name='海神岛',},
}

function NPCFunc_navigate_Title()
	local ServerID = API_GetServerID()
	if GLOBAL_Navigate_ServerID[ServerID] ~= nil then
		API_ResponseWrite('<win rect="230,220,325,360"></win>')
		API_ResponseWrite('<text>您当前的位置是</text><text color="0,255,0">'..GLOBAL_Navigate_ServerID[ServerID].name..'</text><br>')
		
		for IsLandID = 1,table.getn(GLOBAL_Navigate_ServerID[ServerID]) do
			if GLOBAL_Navigate_ServerID[ServerID][IsLandID] ~= nil then
				local ObjServerID = GLOBAL_Navigate_ServerID[ServerID][IsLandID].ServerID
				if API_ServerIsOpen(ObjServerID) then
					API_ResponseWrite('<br><a href="Goto_Island_navigate?1='..IsLandID..'">前往 ———— '..GLOBAL_Navigate_ServerID[ServerID][IsLandID].name..'</a><br>')
				end
			end
		end
		
	--	API_ResponseWrite('<img src="WorldMap\\SJDT_TEMP.bmp" tip="暖风岛" href="Goto_Island_navigate?1=1">')
	--	API_ResponseWrite('<img src="WorldMap\\SJDT_TEMP2.bmp" tip="星月岛" href="Goto_Island_navigate?1=2">')
	else
		API_ResponseWrite('<text>本岛暂没对外开放</text><br>')
		API_ResponseWrite('<a>取消</a><br>')
	end
end
function Goto_Island_navigate()
	local ServerID = API_GetServerID()
	if GLOBAL_Navigate_ServerID[ServerID] ~= nil then
		local IsLandID = API_RequestGetNumber(1)
		if GLOBAL_Navigate_ServerID[ServerID][IsLandID] ~= nil then
			local ActorID = API_RequestGetActorID()
			local MonsterFastID = API_VarDataGetNumber(ActorID,0,32712)
			if API_GetMonsterID(MonsterFastID) <= 0 then
				return
			end
			local ActorCampID = API_GetActorCamp(ActorID)
			local MonsterCampID = API_MonsterGetPropNum(MonsterFastID,PD_PROP_CAMPID)
			if ActorCampID == MonsterCampID then
				local ObjServerID = GLOBAL_Navigate_ServerID[ServerID][IsLandID].ServerID
				if API_ServerIsOpen(ObjServerID) then
					API_ActorGoToMapEx(ActorID,ObjServerID,GLOBAL_Navigate_ServerID[ServerID][IsLandID].CampID[ActorCampID].MapID, GLOBAL_Navigate_ServerID[ServerID][IsLandID].CampID[ActorCampID].TileX,GLOBAL_Navigate_ServerID[ServerID][IsLandID].CampID[ActorCampID].TileY)
				end
			else
				API_ResponseWrite('<text>这里不对外国人开放</text><br>')
				API_ResponseWrite('<a>取消</a><br>')
			end
		else
			API_ResponseWrite('<text>没有该条航线</text><br>')
			API_ResponseWrite('<a>取消</a><br>')
		end
	else
		API_ResponseWrite('<text>本岛暂没对外开放</text><br>')
		API_ResponseWrite('<a>取消</a><br>')
	end
end

--新人商店
function NPCFunc_NewActorShop_Title(ActorID, NPCID)
	API_ResponseWrite('<win rect="800,160,200,300"></win>')
	API_ResponseWrite('<text>我做生意这么多年，终于悟出了一个真理：</text><text color="255,0,0">钱永远没有命重要</text><text>，所以别看我东西卖得贵，在需要保命的时候金钱其实就跟粪土一般～</text><br><br>')
	API_ResponseWrite('<a href="NewActorShop?1=1">购买生命药水</a><br><br>')
	API_ResponseWrite('<a href="NewActorShop?1=2">购买能量药水</a><br><br>')
	API_ResponseWrite('<a href="NewActorShop?1=3">购买技能材料</a><br><br>')
	API_ResponseWrite('<a href="NewActorShop?1=4">购买士气道具</a><br><br>')
end

--奸商货物列表
GLOBAL_NewActorShop_Goods = {
[1] = {
		{GoodsID=101,price=10,},
		{GoodsID=102,price=20,},
		{GoodsID=103,price=30,},
	--	{GoodsID=104,price=43,},
	--	{GoodsID=105,price=50,},
		},
[2] = {
		{GoodsID=201,price=3,},
		{GoodsID=202,price=5,},
		{GoodsID=203,price=8,},
	--	{GoodsID=204,price=10,},
	--	{GoodsID=205,price=13,},
		},
[3] = {
		{GoodsID=80246,price=20,},
		{GoodsID=80247,price=20,},
		{GoodsID=80248,price=20,},
		{GoodsID=80249,price=30,},
		},
[4] = {
		{GoodsID={834,835,836,837,838,839,840,841,842,843,844,},price={300,600,600,819,1029,1372,2226,2940,3528,4410,5180,},priceType='Morale',},
		},
}


local JianshangTaskID = 1813
function NewActorShop()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	if GLOBAL_NewActorShop_Goods[SelectItem] == nil then
		return
	end
	if type(GLOBAL_NewActorShop_Goods[SelectItem]) ~= 'table' then
		return
	end
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if GLOBAL_NewActorShop_Goods[SelectItem][BuyNo] ~= nil then
			local BuyGoodsID = GLOBAL_NewActorShop_Goods[SelectItem][BuyNo].GoodsID
			if type(BuyGoodsID) == 'table' then
				local Peerage = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
				if BuyGoodsID[Peerage] ~= nil then
					BuyGoodsID = BuyGoodsID[Peerage]
				else
					return
				end
			end
			local Buyprice = GLOBAL_NewActorShop_Goods[SelectItem][BuyNo].price
			if type(Buyprice) == 'table' then
				local Peerage = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
				if Buyprice[Peerage] ~= nil then
					Buyprice = Buyprice[Peerage]
				else
					return
				end
			end
			local BuyNum = API_RequestGetNumber(num)
			if BuyNum < 1 then
				BuyNum = 1
			elseif BuyNum > 999 then
				BuyNum = 999
			end
			Buyprice = Buyprice * BuyNum
			local BuypriceType = GLOBAL_NewActorShop_Goods[SelectItem][BuyNo].priceType
			if BuypriceType ~= nil and BuypriceType == 'Morale' then
				if API_ActorGetPropNum(ActorID,PD_PROP_MORALE) >= Buyprice then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
						if API_ActorAddMorale(ActorID,-Buyprice,JianshangTaskID,'奸商扣士气') then
							API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'奸商购买')
							API_ActorSendMsg(ActorID,0,'您花费 '..Buyprice..' 士气购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							API_ActorPlaySound(ActorID,10035)
						end
					else
						API_ActorSendMsg(ActorID,0,'您的背包满了，无法购买')
					end
				else
					API_ActorSendMsg(ActorID,0,'您的士气不够')
				end
			else
				if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) >= Buyprice then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
						if API_ActorAddMoney(ActorID,-Buyprice,JianshangTaskID,'奸商扣钱') then
							API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'奸商购买')
							API_ActorSendMsg(ActorID,0,'您花费 '..Buyprice..' 金币购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							API_ActorPlaySound(ActorID,10035)
						end
					else
						API_ActorSendMsg(ActorID,0,'您的背包满了，无法购买')
					end
				else
					API_ActorSendMsg(ActorID,0,'您的金币不够')
				end
			end
		end
		return
	end
	local GoodsNum = table.getn(GLOBAL_NewActorShop_Goods[SelectItem])
	API_ResponseWrite('<name></name>')
	API_ResponseWrite('<win rect="230,222,330,400"></win>')
	for i = 1,GoodsNum do
		if i > Page * 5 and i < (Page + 1) * 5 + 1 then
			local BuyGoodsID = GLOBAL_NewActorShop_Goods[SelectItem][i].GoodsID
			local Buyprice = GLOBAL_NewActorShop_Goods[SelectItem][i].price
			local BuypriceType = GLOBAL_NewActorShop_Goods[SelectItem][i].priceType
			if type(BuyGoodsID) == 'table' then
				local Peerage = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
				if BuyGoodsID[Peerage] ~= nil then
					BuyGoodsID = BuyGoodsID[Peerage]
				else
					return
				end
			end
			if type(Buyprice) == 'table' then
				local Peerage = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
				if Buyprice[Peerage] ~= nil then
					Buyprice = Buyprice[Peerage]
				else
					return
				end
			end
			API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
			API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
			local BuyNumTip = '  购买单价：'..Buyprice..'金币 '
			if BuypriceType ~= nil and BuypriceType == 'Morale' then
				BuyNumTip = '  购买单价：'..Buyprice..'士气 '
			end
			local BuyNumTipLen = string.len(BuyNumTip)
			if BuyNumTipLen < 25 then
				for j = 1,25- BuyNumTipLen do
					BuyNumTip = BuyNumTip..' '
				end
			end
			API_ResponseWrite('<text>'..BuyNumTip..'</text>')
			local num = i * 100
			API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
			API_ResponseWrite('<text> </text>')
			API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" close="0" href="NewActorShop?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
			API_ResponseWrite('<text>———————————————————————</text><br>')
		end
	end
	if GoodsNum < (Page + 1) * 5 then
		for i = 1,(Page + 1) * 5 - GoodsNum do
			API_ResponseWrite('<br><br><br><br>')
		end
	end
	if GoodsNum > 5 then
		local BackPage = Page - 1
		local NextPage = Page + 1
		if SelectItem == 0 then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_g.bmp"><text>                          </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="NewActorShop?1='..SelectItem..'&2='..NextPage..'">')
		elseif (SelectItem + 1) * 5 < GoodsNum then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="NewActorShop?1='..SelectItem..'&2='..BackPage..'"><text>                          </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="NewActorShop?1='..SelectItem..'&2='..NextPage..'">')
		else
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="NewActorShop?1='..SelectItem..'&2='..BackPage..'"><text>                          </text><img src="LuaUse\\button_next_g.bmp">')
		end
	end
end

--月门
function NPCFunc_MoonDoor(ActorID,NPCID)
	local SelectItem = 0
	if ActorID == nil then
		ActorID = API_RequestGetActorID() 
		SelectItem = API_RequestGetNumber(1)
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(MapID)
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 0 then
		local FastID = API_VarDataGetNumber(ActorID,0,32712)
		if GLOBAL_MoonDoor_Convection[FastID] ~= nil then
			local ObjectFastID = GLOBAL_MoonDoor_Convection[FastID]
			if API_GetMonsterID(ObjectFastID) <= 0 or API_GetMonsterID(FastID) <= 0 then
				API_ResponseClear()
				API_ResponseEnd()
				return -1
			end
			if API_GetMonsterMap(FastID) ~= MapID then
				API_ResponseClear()
				API_ResponseEnd()
				return -1
			end
			local YUNXU = 0
			if API_GetMonsterPrizeActor(FastID) == ActorID then
				YUNXU = 1
			else
				local TeamID = API_GetTeamID(ActorID)
				if TeamID > 0 then
					local TeamSize = API_GetTeamSize(TeamID)
					for i = 1,TeamSize do
						local TeamActorID = API_GetTeamMem(TeamID,i)
						if TeamActorID == API_GetMonsterPrizeActor(FastID) then
							YUNXU = 1
							break
						end
					end
				end
			end
			if YUNXU == 1 then
				local ActorIDX,ActorIDY = PublicFun_GetActorPosXY(ActorID)
				local MonsterX,MonsterY = PublicFun_GetMonsterPosXY(FastID)
				if PublicFun_AccountDistance(ActorIDX,ActorIDY,MonsterX,MonsterY) > 2 then
					API_ActorSendMsg(ActorID,3,'您距离月门太远，无法进入月门')
					API_ResponseClear()
					API_ResponseEnd()
					return -1
				end
				local ObjectMapID = API_GetMonsterMap(ObjectFastID)
				local ObjectX,ObjectY = PublicFun_GetMonsterPosXY(ObjectFastID)
				if not API_HaveNoBlockTile(ObjectMapID,ObjectX,ObjectY,10) then
					API_ActorSendMsg(ActorID,3,'对面的月门无处落脚')
					API_ResponseClear()
					API_ResponseEnd()
					return -1
				end
				API_ResponseClear()
				API_ResponseEnd()
				API_ActorGoToMap(ActorID,ObjectMapID,ObjectX,ObjectY)
				return -1
			else
				API_ResponseClear()
				API_ResponseEnd()
				return -1
			end
		else
			API_ResponseClear()
			API_ResponseEnd()
			return -1
		end
	elseif SelectItem == 1 or SelectItem == 2 then
		if API_ActorGetGoodsNum(ActorID,765) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			return
		end
		local CampID = API_GetActorCamp(ActorID)
		local MapTable
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
						API_ActorSendMsg(ActorID,3,'月门不能在 '..NoGoToAddressName..' 的传送门五米范围内创建！')
						return
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
			if SelectItem == 1 then
				MapTable = MapTable1
			elseif SelectItem == 2 then
				MapTable = MapTable2
			end
			
			local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
			local AddrID = API_RequestGetNumber(2)
			if AddrID < 2 or AddrID >= table.getn(MapTable) then
				return
			end
			local ObjectMapID = MapTable[AddrID].AddrMapID
			local ObjectTileX = MapTable[AddrID].AddrLocX
			local ObjectTileY = MapTable[AddrID].AddrLocY
			local Direct = 3
			local MoonDoorID = 11379
			if CampID == 1 then
				Direct = 5
				MoonDoorID = 11380
			end
			local FastID1 = API_VarDataGetNumber(ActorID,0,18111)
			local FastID2 = API_VarDataGetNumber(ActorID,0,18113)
			if FastID1 ~= 0 or FastID2 ~= 0 then
				GLOBAL_MoonDoor_Convection[FastID1] = nil
				GLOBAL_MoonDoor_Convection[FastID2] = nil
				if FastID1 ~= 0 then
					API_DestroyMonster(FastID1)
				end
				if FastID2 ~= 0 then
					API_DestroyMonster(FastID2)
				end
			end
			FastID1 = API_CreateMonsterEx(MapID,MoonDoorID,TileX,TileY,Direct,0,-1,1)
			FastID2 = API_CreateMonsterEx(ObjectMapID,MoonDoorID,ObjectTileX,ObjectTileY,Direct,0,-1,1)
			if FastID1 > 0 and FastID2 > 0 then
				if API_ActorRemoveGoods(ActorID,765,1,'创建月门') then
					API_SetMonsterPrizeActor(FastID1,ActorID)
					API_SetMonsterPrizeActor(FastID2,ActorID)
					API_MonsterAddStatus(FastID1,81006,30000)
					API_MonsterAddStatus(FastID2,81006,30000)
					API_VarDataSetNumber(ActorID,0,18111,FastID1)
					API_VarDataSetNumber(ActorID,0,18113,FastID2)
					local TimerTriggerGID = API_VarDataGetNumber(ActorID,0,18112)
					if TimerTriggerGID ~= 0 then
						API_DestroyTriggerG(TimerTriggerGID)
					end
					TimerTriggerGID = API_CreateTimerTriggerG(FastID1,FastID2,30,1,'SkillGoods_MoonDoor_TimerTriggerCallFunc')
					API_VarDataSetNumber(ActorID,0,18112,TimerTriggerGID)
					local ActorName = API_GetActorName(ActorID)
					ActorName = ''..ActorName..'的'
					API_SetMonsterName(FastID1,ActorName,2)
					API_SetMonsterName(FastID2,ActorName,2)
					local Object = '-'..MapTable[AddrID].AddrName..''
					local Object = string.gsub (Object, ' ', '')
					API_SetMonsterName(FastID1,Object,3)
					local Object2 = '(返回)'
					API_SetMonsterName(FastID2,Object2,3)
					GLOBAL_MoonDoor_Convection[FastID1] = FastID2
					GLOBAL_MoonDoor_Convection[FastID2] = FastID1
					API_ActorSendMsg(ActorID,3,'请左键点击您创建的月门进入您刚才选择的目的地')
				else
					API_DestroyMonster(FastID1)
					API_DestroyMonster(FastID2)
					return
				end
			else
				if FastID1 > 0 then
					API_DestroyMonster(FastID1)
				end
				if FastID2 > 0 then
					API_DestroyMonster(FastID2)
				end
			end
		end
	end
end

--生命泉水
function NPCFunc_LifeWater(ActorID,NPCID)
	local MapID = API_GetActorMapID(ActorID)
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	if API_GetMonsterID(FastID) <= 0 then
		API_ResponseClear()
		API_ResponseEnd()
		return -1
	end
	if API_GetMonsterMap(FastID) ~= MapID then
		API_ResponseClear()
		API_ResponseEnd()
		return -1
	end
	if API_GetActorCamp(ActorID) ~= API_MonsterGetPropNum(FastID,PD_PROP_CAMPID) then
		API_ResponseClear()
		API_ResponseEnd()
		return -1
	end
	local ActorIDX,ActorIDY = PublicFun_GetActorPosXY(ActorID)
	local MonsterX,MonsterY = PublicFun_GetMonsterPosXY(FastID)
	if PublicFun_AccountDistance(ActorIDX,ActorIDY,MonsterX,MonsterY) > 5 then
		API_ResponseClear()
		API_ResponseEnd()
		return -1
	end
	local ObjectX = MonsterX + math.random(-5,5)
	local ObjectY = MonsterY + math.random(-5,5)
	if not API_HaveNoBlockTile(MapID,ObjectX,ObjectY,10) then
		API_ResponseClear()
		API_ResponseEnd()
		return -1
	end
	API_ResponseClear()
	API_ResponseEnd()
	API_ActorGoToMap(ActorID,MapID,ObjectX,ObjectY)
	return -1
end

local HuShiMMTaskID = 1812
--护士MM
function NPCFunc_Nana(ActorID,NPCID)
	if ActorID ==nil then
		ActorID = API_RequestGetActorID()
	end
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	if API_GetActorCamp(ActorID) ~= API_MonsterGetPropNum(FastID,PD_PROP_CAMPID) then
		API_ResponseWrite('<text>金钱诚可贵，气节价更高！通敌卖国的事我是绝对不会做的</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		return
	end
	local ExpLevel = API_GetActorExpLevel(ActorID)
	local StatusID = 86001
	local NeedMoney = 72
	if ExpLevel <= 10 then
		StatusID = 86001
		NeedMoney = 72
	elseif ExpLevel <= 25 then
		StatusID = 86002
		NeedMoney = 144
	elseif ExpLevel <= 50 then
		StatusID = 86003
		NeedMoney = 129
	elseif ExpLevel <= 65 then	
		StatusID = 86004
		NeedMoney = 306
	elseif ExpLevel <= 80 then	
		StatusID = 86005
		NeedMoney = 360
	else
		StatusID = 86005
		NeedMoney = 360
	end
	local miaoshu = {
					[86001]='微型剂量装：持续1小时，每2秒回复33的生命，受到攻击不会停止回复',
					[86002]='小型剂量装：持续1小时，每2秒回复62的生命，受到攻击不会停止回复',
					[86003]='中小型剂量装：持续1小时，每2秒回复98的生命，受到攻击不会停止回复',
					[86004]='中型剂量装：持续1小时，每2秒回复136的生命，受到攻击不会停止回复',
					[86005]='大型剂量装：持续1小时，每2秒回复161的生命，受到攻击不会停止回复',
					}
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 0 then
		API_ResponseWrite('<a allcolor="255,0,255" Size="20" closewindow="0" tip="挨了刀也不会打断的哦～">持续回血</a><text>药剂特价现场展销：</text><br><br>')
		API_ResponseWrite('<text>您只需花少量的金币，就可以当场服用这种来自遥远的东方的神奇药水，</text><text color="255,0,0">在药效期内只要您不切换地图或下线</text><text>，您的生命就会充满保障！</text><br>')
		API_ResponseWrite('<text color="255,0,255">'..miaoshu[StatusID]..'</text><br>')
		API_ResponseWrite('<text color="255,0,0">价格：'..NeedMoney..'金币</text><br>')
		if false == Fun_IsAcceptedTaskID(ActorID,325) and false == Fun_IsAcceptedTaskID(ActorID,375) then
			API_ResponseWrite('<br><a href="NPCFunc_Nana?1=1">购买一小时持续回血状态</a><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
		end
	else
		if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) >= NeedMoney then
			if API_ActorFindStatus(ActorID,86) then
				if API_RequestGetNumber(2) == 0 then
					API_ResponseWrite('<text>您目前正处于持续回血状态，如果重新购买该状态，</text><text color="255,0,0">新购买的状态会替换原来的</text><br>')
					API_ResponseWrite('<text>你确定吗？你不改了吗？</text><br>')
					local ActorName = API_GetActorName(ActorID)
					API_ResponseWrite('<br><a href="NPCFunc_Nana?1=1&2=1">是的，'..ActorName..'确定了，'..ActorName..'不改了！</a><br>')
					API_ResponseWrite('<br><a>让我再考虑一下</a><br>')
				else
					if API_ActorAddMoney(ActorID,-NeedMoney,HuShiMMTaskID,'护手MM收费') then
						API_ActorAddStatus(ActorID,StatusID,0)
						API_ResponseWrite('<text>'..miaoshu[StatusID]..'</text><br>')
						API_ResponseWrite('<text color="255,0,255">您花费'..NeedMoney..'金币购买了一小时持续回血状态</text><br>')
						API_ResponseWrite('<text color="255,0,0">下线或切换地图状态失效。</text><br><text color="255,0,0">如果继续重复购买：后购买的状态效果替换之前购买的状态</text><br>')
						API_ActorSendMsg(ActorID,1,'您花费'..NeedMoney..'金币购买了一小时持续回血状态')
						API_ActorSendMsg(ActorID,1,'下线或切换地图状态失效')
						API_ActorSendMsg(ActorID,1,'如果重复购买：后购买的状态替换之前购买的状态')
						API_ResponseWrite('<br><a>确定</a><br>')
					end
				end
			else
				if API_ActorAddMoney(ActorID,-NeedMoney,HuShiMMTaskID,'护手MM收费') then
					API_ActorAddStatus(ActorID,StatusID,0)
					API_ResponseWrite('<text>'..miaoshu[StatusID]..'</text><br>')
					API_ResponseWrite('<text color="255,0,255">您花费'..NeedMoney..'金币购买了一小时持续回血状态</text><br>')
					API_ResponseWrite('<text color="255,0,0">下线或切换地图状态失效。</text><br><text color="255,0,0">如果重复购买：后购买的状态效果替换之前购买的状态</text><br>')
					API_ActorSendMsg(ActorID,1,'您花费'..NeedMoney..'金币购买了一小时持续回血状态')
					API_ActorSendMsg(ActorID,1,'下线或切换地图状态失效')
					API_ActorSendMsg(ActorID,1,'如果重复购买：后购买的状态替换之前购买的状态')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			end
		else
			API_ResponseWrite('<text>'..miaoshu[StatusID]..'</text><br>')
			API_ResponseWrite('<text>价格：'..NeedMoney..'金币</text><br>')
			API_ResponseWrite('<text color="255,0,0">您身上的金币不够</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	end
end

local SellItemTaskID = 1810

--装备收购商
function NPCFunc_SellItem_Title(ActorID,NPCID)
	if ActorID ==nil then
		ActorID = API_RequestGetActorID()
	end
	local CampID = API_GetActorCamp(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 0 then
		API_ResponseWrite('<text>'..GLOBAL_CampName[CampID]..'与'..GLOBAL_OpposeCampName[CampID]..'的战事吃紧，为了打赢这场战争，已经到了考验我们后勤的时候了，各位能工巧匠如果能</text><text color="255,0,255">将你们自己打造的装备</text><text>捐献给前线战士们的话，'..GLOBAL_CampName[CampID]..'将奖励您大量功勋！</text><br>')
		API_ResponseWrite('<text color="255,0,0">请将您自己打造的装备放在背包的第一格，我会帮您评估它的价值，然后给出对应的功勋奖励。</text><br>')
		API_ResponseWrite('<br><a href="NPCFunc_SellItem_Title?1=1">放好了，请问捐献之后能获得多少功勋？</a><br>')
		API_ResponseWrite('<br><a>我路过</a><br>')
	elseif SelectItem == 1 then
		local GoodsID = API_ActorGetGoodsPropNum(ActorID,0,1,0)
		if GoodsID > 0 then
			local ItemType = API_ActorGetGoodsPropNum(ActorID,0,1,50)
			if ItemType == 1 then
				local zhizhaoze = API_ActorGetGoodsPropStr(ActorID,0,1,2)
				if zhizhaoze == API_GetActorName(ActorID) then
					local wupingdangci = API_ActorGetGoodsPropNum(ActorID,0,1,51)
					local wupingqianzui = API_ActorGetGoodsPropStr(ActorID,0,1,3)
					local wupingmingcheng = API_ActorGetGoodsPropStr(ActorID,0,1,1)
					local shengjicishu = API_ActorGetGoodsPropNum(ActorID,0,1,120)
					local dianhuacishu = API_ActorGetGoodsPropNum(ActorID,0,1,11)
					local shiyongdengji = API_ActorGetGoodsPropNum(ActorID,0,1,52)
					local wupingleixing = API_ActorGetGoodsPropNum(ActorID,0,1,121)
					local fujiaxiaoguonum = 0
					if API_ActorGetGoodsPropNum(ActorID,0,1,12) == 1 then
						for i = 112,113 do
							if API_ActorGetGoodsPropNum(ActorID,0,1,i) > 0 then
								fujiaxiaoguonum = fujiaxiaoguonum + 1
							end
						end
					end
					local chachaonum = 0
					local Nochachaonum = API_ActorGetGoodsPropNum(ActorID,0,1,123)
					
					for i = 106,108 do
						if API_ActorGetGoodsPropNum(ActorID,0,1,i) < 65535 then
							chachaonum = chachaonum + 1
						end
					end
					local Zhongchachaonum = chachaonum + Nochachaonum
					local kapianshuliang = API_ActorGetGoodsPropNum(ActorID,0,1,122)
					local gongxunjiangli = 0
					if GLOBAL_SellItem_Time[wupingdangci] ~= nil then
						local Time = 0
						local wupingbiao = GLOBAL_SellItem_Time[wupingdangci]
						local Qianzui = {[1]={qz='破损的',xb='PSD'},[2]={qz='简陋的',xb='JLD'},[3]={qz='普通的',xb='PTD'},[4]={qz='坚固的',xb='JGD'},[5]={qz='良好的',xb='LHD'},[6]={qz='精致的',xb='JZD'},[7]={qz='完美的',xb='WMD'},}
						local Qianzuixiaobiao = ''
						
						for i = 1,7 do
							if Qianzui[i].qz == wupingqianzui then
								Qianzuixiaobiao = Qianzui[i].xb
								break
							end
						end
						if wupingbiao.Qianzui[Qianzuixiaobiao] ~= nil then
							Time = Time + wupingbiao.Qianzui[Qianzuixiaobiao]
						end
						if wupingbiao.ShengjiNum[shengjicishu] ~= nil then
							Time = Time + wupingbiao.ShengjiNum[shengjicishu]
						end
						if wupingbiao.DianhuaNum[dianhuacishu] ~= nil then
							Time = Time + wupingbiao.DianhuaNum[dianhuacishu]
						end
						if wupingbiao.FujiaNum[fujiaxiaoguonum] ~= nil then
							Time = Time + wupingbiao.FujiaNum[fujiaxiaoguonum]
						end
						if wupingbiao.BaoshiNum[chachaonum] ~= nil then
							Time = Time + wupingbiao.BaoshiNum[chachaonum]
						end
						if wupingbiao.NoBaoshiNum[Zhongchachaonum] ~= nil then
							Time = Time + wupingbiao.NoBaoshiNum[Zhongchachaonum]
						end
						if wupingbiao.KapianNum[kapianshuliang] ~= nil then
							Time = Time + wupingbiao.KapianNum[kapianshuliang]
						end
						if Time > 0 then
							local dengji = {[1]=1,[2]=6,[3]=15,[4]=30,[5]=61,[6]=76}
							local dengjijiangli = dengji[math.min(math.max(1,wupingdangci),table.getn(dengji))]
							if dengjijiangli == nil then
								dengjijiangli = 1
							end
							gongxunjiangli = math.floor(0.15 * Time * GLOBAL_ExpCriterion[math.min(math.max(1,dengjijiangli),table.getn(GLOBAL_ExpCriterion))])
							if API_ActorGetGoodsPropNum(ActorID,0,1,4) ~= 0 then
								gongxunjiangli = math.floor(gongxunjiangli/2)
							end
						end
					end
					if API_RequestGetNumber(2) == 0 then
						API_ResponseWrite('<text>装备名称：'..wupingqianzui..''..wupingmingcheng..'</text><br>')
						API_ResponseWrite('<text>装备档次：'..PublicFun_ArabianNumberToChineseNumber(wupingdangci)..'档</text><br>')
						API_ResponseWrite('<text>升级次数：'..shengjicishu..'</text><br>')
						API_ResponseWrite('<text>点化次数：'..dianhuacishu..'</text><br>')
						API_ResponseWrite('<text>附加属性：'..fujiaxiaoguonum..'个</text><br>')
						API_ResponseWrite('<text>宝石插槽：'..Zhongchachaonum..'个</text><br>')
						API_ResponseWrite('<text>卡片插槽：'..kapianshuliang..'个</text><br>')
						API_ResponseWrite('<text Size="20" color="255,0,255">捐献这件装备您可以获得'..gongxunjiangli..'功勋</text><br>')
						API_ResponseWrite('<br><a href="NPCFunc_SellItem_Title?1=1&2=1">捐献装备换功勋</a><br>')
						API_ResponseWrite('<br><a>还是算了</a><br>')
					else
						if API_ActorCanRemoveGoods(ActorID,GoodsID,1,0) then
							local ExpLevel = API_GetActorExpLevel(ActorID)
							local MinExpLevelList = {[1]=1,[2]=5,[3]=21,[4]=46,[5]=46,[6]=46,[7]=46,[8]=46,[9]=46,[10]=46,}
							local MinExpLevel = MinExpLevelList[wupingdangci]
							if MinExpLevel ~= nil and ExpLevel < MinExpLevel then
								local NeedMinExpLevelCN = GLOBAL_Exploit[MinExpLevel].PeerageDepict
								API_ResponseWrite('<text color="255,0,255">捐献'..PublicFun_ArabianNumberToChineseNumber(wupingdangci)..'档装备至少需要达到'..NeedMinExpLevelCN..'</text><text>，这件装备还是先留着提高自己的爵位吧</text><br>')
								API_ResponseWrite('<br><a>我明白了</a><br>')
								return
							end
							local PeerageLevel = API_GetActorPeerageLevel(ActorID)
							if PeerageLevel == 1 then
								local TodayNum = API_VarDataGetNumber(ActorID,1,18265)
								local year,month,day,hour,min,sec,wday = PublicFun_time()
								local Biaozhi = API_VarDataGetNumber(ActorID,1,18266)
								Biaozhi = math.mod(Biaozhi,100000000)
								local LYear = math.floor(Biaozhi/10000)
								local LMonthDay = math.mod(Biaozhi,10000)
								local LMonth = math.floor(LMonthDay/100)
								local LDay = math.mod(LMonthDay,100)
								if year ~= LYear or month ~= LMonth or day ~= LDay then
									TodayNum = 1
								else
									TodayNum = TodayNum + 1
								end
								if TodayNum > 10 then
									API_ResponseWrite('<text color="255,0,255">公民阶段每天最多只允许捐献十件装备！</text><text>多余的装备请明天再来捐献</text><br>')
									API_ResponseWrite('<br><a>我明白了</a><br>')
									return
								else
									Biaozhi = year * 10000 + month * 100 + day
									API_VarDataSetNumber(ActorID,1,18265,TodayNum)
									API_VarDataSetNumber(ActorID,1,18266,Biaozhi)
								end
							end
							if API_ActorRemoveGoodsEx(ActorID,GoodsID,1,0,'装备换功勋') then
								if GoodsID == API_ActorPackageGetLocGoodsID(ActorID, 0, 0) then
									API_ActorSendMsg(ActorID,3,'请勿作弊')
								else
									API_ActorAddExp(ActorID,gongxunjiangli,SellItemTaskID,'装备换功勋')
									API_ActorSendMsg(ActorID,3,'您获得'..gongxunjiangli..'功勋')
									if API_VarDataGetNumber(ActorID,1,353) == 1 then
										API_VarDataSetNumber(ActorID,1,4761,1)
									end
									if wupingdangci >= 2 then
										if API_VarDataGetNumber(ActorID,1,354) == 1 then
											API_VarDataSetNumber(ActorID,1,4766,1)
										end
									end
								end
							end
						else
							API_ActorSendMsg(ActorID,3,'请勿作弊')
						end
					end
				else
					API_ResponseWrite('<text color="255,0,255">请将您自己打造的</text><text>装备放在背包的第一格，我会帮您评估它的价值，然后给出对应的功勋奖励。</text><br>')
					API_ResponseWrite('<br><a href="NPCFunc_SellItem_Title?1=1">放好了，请问捐献之后能获得多少功勋？</a><br>')
					API_ResponseWrite('<br><a>还是算了</a><br>')
				end
			else
				API_ResponseWrite('<text>请将您自己打造的</text><text color="255,0,255">装备</text><text>放在背包的第一格，我会帮您评估它的价值，然后给出对应的功勋奖励。</text><br>')
				API_ResponseWrite('<br><a href="NPCFunc_SellItem_Title?1=1">放好了，请问捐献之后能获得多少功勋？</a><br>')
				API_ResponseWrite('<br><a>还是算了</a><br>')
			end
		else
			API_ResponseWrite('<text>请将您自己打造的装备</text><text color="255,0,255">放在背包的第一格</text><text>，我会帮您评估它的价值，然后给出对应的功勋奖励。</text><br>')
			API_ResponseWrite('<br><a href="NPCFunc_SellItem_Title?1=1">放好了，请问捐献之后能获得多少功勋？</a><br>')
			API_ResponseWrite('<br><a>还是算了</a><br>')
		end
	end
end


local YingdaozheTaskID = 1811
--引导者
function NPCFunc_Yingdaozhe_Title(ActorID,NPCID)
	if ActorID ==nil then
		ActorID = API_RequestGetActorID()
	end
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 0 then
		API_ResponseWrite('<text>使用领域卷轴可以创建领域：</text><br>')
		API_ResponseWrite('<text>在领域内杀怪可获得功勋奖励，领域的主人在也可以从中获得收益——'..API_GetGoodsName(80498)..'</text><br>')
		API_ResponseWrite('<text>您可以随时拿'..API_GetGoodsName(80498)..'到我这里来兑换功勋，每张'..API_GetGoodsName(80498)..'允许兑换100功勋，请问您要兑换多少张？</text><br>')
		API_ResponseWrite('<br><input type="number" name="2" size="4" width="60"><a href="NPCFunc_Yingdaozhe_Title?1=2">我要兑换这些</a><br>')
		API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=1">全部兑换</a><br>')
		API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
	elseif SelectItem == 1 or SelectItem == 2 then
		local anzhuangshuliang = API_RequestGetNumber(2)
		if SelectItem == 1 then
			anzhuangshuliang = API_ActorGetGoodsNum(ActorID,80498)
		end
		if anzhuangshuliang <= 0 then
			anzhuangshuliang = 1
		end
		if anzhuangshuliang > API_ActorGetGoodsNum(ActorID,80498) then
			anzhuangshuliang = API_ActorGetGoodsNum(ActorID,80498)
		end
		if API_ActorGetGoodsNum(ActorID,80498) <= 0 then
			API_ResponseWrite('<text>您身上没有</text><text color="255,0,0">'..API_GetGoodsName(80498)..'</text><text>，不能兑换。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		elseif anzhuangshuliang >	99999 then
			API_ResponseWrite('<text>一次最多只能兑换 99999 张</text><text color="255,0,0">'..API_GetGoodsName(80498)..'</text><text>。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		else
			local exp = anzhuangshuliang * 100
			local ExploitL = API_GetActorExpLevel(ActorID)
			local expMax = API_GetExploitInfo(ExploitL,3)
			local expNow = API_GetActorCurExp(ActorID)
			local expAddMax = expMax - expNow
			if exp > expAddMax then
				anzhuangshuliang = math.ceil(expAddMax/100)
			end
			if anzhuangshuliang > 0 then
				if API_ActorRemoveGoods(ActorID,80498,anzhuangshuliang,'兑换功勋') then
					local expAdd = anzhuangshuliang * 100
					API_ActorAddExp(ActorID,expAdd,YingdaozheTaskID,'领域浮空岛给奖励')
					API_ResponseWrite('<text>您用 '..anzhuangshuliang..' 张</text><text color="255,0,0">'..API_GetGoodsName(80498)..'</text><text>兑换了'..expAdd..'功勋。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			else
				API_ResponseWrite('<text>您当前功勋达到上限，无法继续兑换功勋，请提升等级后再来兑换</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	end
end
