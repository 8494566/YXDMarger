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
-- 打开士气商店
-- --------
function NPCFunc_OpenWarShop_Title()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local BattleID = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.BattleID)
	API_OpenWarShopWnd(ActorID,1,BattleID)
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
-- 装备改造15  装备升档
-- ---------
function NPCFunc_OpenRebuildEquip15_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	API_OpenRebuildEquip(ActorID, FastID, 15)
end

-- ---------
-- 装备改造16  装备分解
-- ---------
function NPCFunc_OpenRebuildEquip16_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	API_OpenRebuildEquip(ActorID, FastID, 18)
end

-- ---------
-- 装备改造19  属性消除
-- ---------
function NPCFunc_OpenRebuildEquip19_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	API_OpenRebuildEquip(ActorID, FastID, 19)
end

-- ---------
-- 技能学习
-- ---------
function NPCFunc_OpenSkillTeach_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenSkillTeach(ActorID, FastID,0)
	TaskCommon_OnLearnHero(ActorID)
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
-- 生活技能分支转换
-- ---------
function NPCFunc_WSkillBranchConvert_Title()
	local ActorID = API_RequestGetActorID()
	local SelectWSkillID = API_RequestGetNumber(100)
	if SelectWSkillID == 0 then
		API_ResponseWrite('<text color="0,255,0">请选择您想转换分支的生活技能：</text><br><br>')
		for i = 15,21 do
			if API_GetWorkSkillLevel(ActorID,i) ~= 0 and API_GetActorWSTechBranchID(ActorID,i) ~= 0 then
				API_ResponseWrite('<a href="NPCFunc_WSkillBranchConvert_Title?100='..i..'">'.. GLOBAL_WorkSkillInfo[2][i].SkillName ..'</a>')
			else
				API_ResponseWrite('<text color="150,150,150">'.. GLOBAL_WorkSkillInfo[2][i].SkillName ..'</text>')
			end
			API_ResponseWrite('<text>      </text>')
		end
	else
		if API_GetWorkSkillLevel(ActorID,SelectWSkillID) ~= 0 and API_GetActorWSTechBranchID(ActorID,SelectWSkillID) ~= 0 then
			API_WindowOnEventII(ActorID,101,256,SelectWSkillID,0)
		end
	end
end


-- ---------
-- 生活技能遗忘
-- ---------
function NPCFunc_WSkillForget_Title()
	local ActorID = API_RequestGetActorID()
	local SelectWSkillXi = API_RequestGetNumber(100)
	local SelectWSkillID = API_RequestGetNumber(200)
	local YesOrNo = API_RequestGetNumber(300)
	if SelectWSkillXi == 0 then
		API_ResponseWrite('<text>请问您想遗忘哪一系的生活技能：</text><br><br>')
		API_ResponseWrite('<br><a href="NPCFunc_WSkillForget_Title?100=1">采集系</a><br>')
		API_ResponseWrite('<br><a href="NPCFunc_WSkillForget_Title?100=2">制造系</a><br>')
		API_ResponseWrite('<br><a href="NPCFunc_WSkillForget_Title?100=3">加工系</a><br>')
	elseif SelectWSkillID == 0 then
		if GLOBAL_WorkSkillInfo[SelectWSkillXi] ~= nil then
			API_ResponseWrite('<text>请选择您要遗忘的生活技能：</text><br><br>')
			local Num = 0
			for i in GLOBAL_WorkSkillInfo[SelectWSkillXi] do
				if API_GetWorkSkillLevel(ActorID,i) ~= 0 then
					Num = Num + 1
					local WSkillID = i + 1
					API_ResponseWrite('<a href="NPCFunc_WSkillForget_Title?100='..SelectWSkillXi..'&200='..WSkillID..'">'.. GLOBAL_WorkSkillInfo[SelectWSkillXi][i].SkillName ..'</a>')
					API_ResponseWrite('<text>         </text>')
					if math.mod(Num,7) == 0 then
						API_ResponseWrite('<br>')
					end
				end
			end
		end
	elseif YesOrNo == 0 then
		local WSkillID = SelectWSkillID
		SelectWSkillID = SelectWSkillID - 1
		
		if GLOBAL_WorkSkillInfo[SelectWSkillXi] ~= nil and GLOBAL_WorkSkillInfo[SelectWSkillXi][SelectWSkillID] ~= nil and API_GetWorkSkillLevel(ActorID,SelectWSkillID) ~= 0 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win rect="380,250,275,148"></win>')
			API_ResponseWrite('<text>您确定要</text><text color="255,0,0">遗忘 '.. GLOBAL_WorkSkillInfo[SelectWSkillXi][SelectWSkillID].SkillName ..' </text><text>吗？</text><br>')
			API_ResponseWrite('<br><br><br><text>     </text><img src="LuaUse\\button_是_u.tga" src2="LuaUse\\button_是_l.tga" close="1" href="NPCFunc_WSkillForget_Title?100='..SelectWSkillXi..'&200='..WSkillID..'&300=1">')
			API_ResponseWrite('<text>         </text><img src="LuaUse\\button_否_u.tga" src2="LuaUse\\button_否_l.tga" close="1">')
		end
	else
		SelectWSkillID = SelectWSkillID - 1
		if GLOBAL_WorkSkillInfo[SelectWSkillXi] ~= nil and GLOBAL_WorkSkillInfo[SelectWSkillXi][SelectWSkillID] ~= nil and API_GetWorkSkillLevel(ActorID,SelectWSkillID) ~= 0 then
			API_LetheTech(ActorID,SelectWSkillID)
		end
	end
end

function NPCFunc_WSkillForget_CanAccept(ActorID,NPCID)
	return 1
end

-- --------
-- 打开房契交易商店
-- --------
function NPCFunc_OpenHouseDeedTrade_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenHouseDeedTrade(ActorID, FastID)
end

-- --------
-- 打开房屋申请入住窗口
-- --------
function NPCFunc_OpenHouseApplyWnd_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenHouseApplyWnd(ActorID, FastID)
end

-- --------
-- 打开社区列表窗口
-- --------
function NPCFunc_OpenHouseParkListWnd_Title()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)

	API_OpenHouseParkListWnd(ActorID, FastID)
end

-- --------
-- 点击NPC进入房屋
-- --------
-- function NPCFunc_ClickEntryMonster_Title()
function NPCFunc_ClickEntryMonster_Title(ActorID,NPCID)
	-- local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	
	API_ClickEntryMonster(ActorID, FastID)

	API_ResponseClear()
	API_ResponseEnd()
end

-- --------
-- 点击房屋出口NPC房屋
-- --------
function NPCFunc_ClickMonsterExitHouse_Title(ActorID,NPCID)
	-- local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	
	API_ClickMonsterExitHouse(ActorID, FastID)

	API_ResponseClear()
	API_ResponseEnd()
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
				API_ResponseWrite('<text color="255,0,0">取得一次胜利获得基本奖励，两次胜利获得2.25倍奖励。</text><br>')
				API_ResponseWrite('<br><a href="NPCFunc_Gotokongjian_Title?1=999">确定离开</a><br>')
				API_ResponseWrite('<br><a>我点错了</a><br>')
				return
			end
		end
		for i = 1,table.getn(TML_HuoBaoLaJuMapID) do 
			if StaticMapID == TML_HuoBaoLaJuMapID[i] then
				API_ResponseWrite('<text color="255,0,0">这里是火爆拉锯！！！</text><br>')
				API_ResponseWrite('<br><a href="NPCFunc_Gotokongjian_Title?1=999">确定离开</a><br>')
				API_ResponseWrite('<br><a>我点错了</a><br>')
				return
			end
		end
		if API_IsBattleGameServer() then --判断是跨服服务器
			API_ResponseWrite('<text color="255,0,0">离开浮空岛视为放弃本次比赛，请再次确认</text><br>')
			API_ResponseWrite('<br><a href="NPCFunc_Gotokongjian_Title?1=999">确定离开</a><br>')
			API_ResponseWrite('<br><a>我点错了</a><br>')
			return
		end
		local Peerage = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
		for i = 1,table.getn(FangShouFuBenMapID) do 
			if StaticMapID == FangShouFuBenMapID[i] then
				if i == 1 then
					API_ResponseWrite('<text color="255,0,0">防守20轮通关后奖励会更高，您确定要现在离开吗？</text><br>')
				else
					if Peerage == 2 or Peerage == 5 or Peerage == 8 then
						API_ResponseWrite('<text color="255,0,0">防守30轮通关后奖励会更高，您确定要现在离开吗？</text><br>')
					elseif Peerage == 3 or Peerage == 6 or Peerage == 9 then
						API_ResponseWrite('<text color="255,0,0">防守30轮通关后奖励会更高，您确定要现在离开吗？</text><br>')
					elseif Peerage == 4 or Peerage == 7 or Peerage == 10 then
						API_ResponseWrite('<text color="255,0,0">防守50轮通关后奖励会更高，您确定要现在离开吗？</text><br>')
					elseif Peerage == 11 or Peerage == 12 or Peerage == 13 then
						API_ResponseWrite('<text color="255,0,0">防守20轮通关后奖励会更高，您确定要现在离开吗？</text><br>')
					end
				end
				API_ResponseWrite('<br><a href="NPCFunc_Gotokongjian_Title?1=999">确定离开</a><br>')
				API_ResponseWrite('<br><a>我点错了</a><br>')
				return
			end
		end
		for i = 1,table.getn(TaFangFuBenMapID) do 
			if StaticMapID == TaFangFuBenMapID[i] then
				API_ResponseWrite('<text color="255,0,0">塔防50轮通关后奖励会更高，您确定要现在离开吗？</text><br>')
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
			API_ResponseWrite('<text color="150,60,255">如果冲到本峡谷尽头后放弃进入争夺浮空岛将只能得到水晶币奖励</text><br>')
			API_ResponseWrite('<text color="255,0,0">如果现在返回空间传送塔将没有任何奖励</text><br>')
			API_ResponseWrite('<br><a href="NPCFunc_Gotokongjian_Title?1=999">确定离开</a><br>')
			API_ResponseWrite('<br><a>我点错了</a><br>')
			return
		elseif StaticMapID >= 1876 and StaticMapID <= 1890 then
			API_ResponseWrite('<text>消灭机奴族可获得士气，通过士气购买士气装备能带来战斗能力的提升</text><br>')
			API_ResponseWrite('<text>在本训练营的尽头可以让BOSS囚笼守卫将您传送进入BOSS囚笼</text><br>')
			API_ResponseWrite('<text color="0,255,255">击败BOSS后与BOSS囚笼内的训练营教官对话，可以领取大量经验奖励</text><br>')
			API_ResponseWrite('<text>您确定要回空间传送塔吗？</text><br>')
			API_ResponseWrite('<br><a href="NPCFunc_Gotokongjian_Title?1=999">确定离开</a><br>')
			API_ResponseWrite('<br><a>我点错了</a><br>')
			return
		end
		
	end
	API_ActorSendMsg(ActorID,4,'')
	if StaticMapID ~= MapID then
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
			API_ResponseWrite('<text>去地表与下层机奴族作战无法获得金币，而且帝国也只会授予您极少量的经验，您确认还是要去吗？</text><br>')
			API_ResponseWrite('<a href="Gotoworld?1=0">还是要去</a><br>')
			API_ResponseWrite('<a>取消</a><br>')
		else
			API_ResponseWrite('<text>仅限联邦成员使用</text><br>')
			API_ResponseWrite('<a>确定</a><br>')
		end
	elseif CampID == 1 then
		if NPCID == 11225 then
			API_ResponseWrite('<text>去地表与下层机奴族作战无法获得金币，而且联邦也只会授予您极少量的经验，您确认还是要去吗？</text><br>')
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
	[1] = {		{ServerID=2,name='星月岛(二线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=3,name='狂欢岛(三线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=4,name='珍兽岛(四线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=5,name='军舰岛(五线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=6,name='珍珠岛(六线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=7,name='女巫岛(七线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=8,name='精灵岛(八线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=9,name='恶魔岛(九线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=10,name='海神岛(十线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			name='暖风岛(一线)',},
	[2] = { {ServerID=1,name='暖风岛(一线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=3,name='狂欢岛(三线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=4,name='珍兽岛(四线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=5,name='军舰岛(五线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=6,name='珍珠岛(六线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=7,name='女巫岛(七线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=8,name='精灵岛(八线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=9,name='恶魔岛(九线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=10,name='海神岛(十线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			name='星月岛(二线)',},
	[3] = { {ServerID=1,name='暖风岛(一线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=2,name='星月岛(二线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=4,name='珍兽岛(四线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=5,name='军舰岛(五线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=6,name='珍珠岛(六线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=7,name='女巫岛(七线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=8,name='精灵岛(八线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=9,name='恶魔岛(九线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=10,name='海神岛(十线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			name='狂欢岛(三线)',},
	[4] = { {ServerID=1,name='暖风岛(一线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=2,name='星月岛(二线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=3,name='狂欢岛(三线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=5,name='军舰岛(五线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=6,name='珍珠岛(六线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=7,name='女巫岛(七线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=8,name='精灵岛(八线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=9,name='恶魔岛(九线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=10,name='海神岛(十线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			name='珍兽岛(四线)',},
	[5] = { {ServerID=1,name='暖风岛(一线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=2,name='星月岛(二线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=3,name='狂欢岛(三线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=4,name='珍兽岛(四线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=6,name='珍珠岛(六线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=7,name='女巫岛(七线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=8,name='精灵岛(八线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=9,name='恶魔岛(九线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=10,name='海神岛(十线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			name='军舰岛(五线)',},
	[6] = { {ServerID=1,name='暖风岛(一线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=2,name='星月岛(二线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=3,name='狂欢岛(三线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=4,name='珍兽岛(四线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=5,name='军舰岛(五线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=7,name='女巫岛(七线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=8,name='精灵岛(八线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=9,name='恶魔岛(九线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=10,name='海神岛(十线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			name='珍珠岛(六线)',},
	[7] = { {ServerID=1,name='暖风岛(一线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=2,name='星月岛(二线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=3,name='狂欢岛(三线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=4,name='珍兽岛(四线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=5,name='军舰岛(五线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=6,name='珍珠岛(六线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=8,name='精灵岛(八线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=9,name='恶魔岛(九线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=10,name='海神岛(十线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			name='女巫岛(七线)',},
	[8] = { {ServerID=1,name='暖风岛(一线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=2,name='星月岛(二线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=3,name='狂欢岛(三线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=4,name='珍兽岛(四线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=5,name='军舰岛(五线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=6,name='珍珠岛(六线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=7,name='女巫岛(七线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=9,name='恶魔岛(九线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=10,name='海神岛(十线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			name='精灵岛(八线)',},
	[9] = { {ServerID=1,name='暖风岛(一线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=2,name='星月岛(二线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=3,name='狂欢岛(三线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=4,name='珍兽岛(四线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=5,name='军舰岛(五线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=6,name='珍珠岛(六线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=7,name='女巫岛(七线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=8,name='精灵岛(八线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=10,name='海神岛(十线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			name='恶魔岛(九线)',},
	[10] = { {ServerID=1,name='暖风岛(一线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=2,name='星月岛(二线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=3,name='狂欢岛(三线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=4,name='珍兽岛(四线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},
			{ServerID=5,name='军舰岛(五线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=6,name='珍珠岛(六线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=7,name='女巫岛(七线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=8,name='精灵岛(八线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}}, 
			{ServerID=9,name='恶魔岛(九线)',CampID={[0]={MapID=9,TileX=163,TileY=380},[1]={MapID=25,TileX=133,TileY=313}}},  
			name='海神岛(十线)',},
}

function NPCFunc_navigate_Title(ActorID, NPCID)
	local ServerID = API_GetServerID()
	if GLOBAL_Navigate_ServerID[ServerID] ~= nil then
		API_ResponseWrite('<win rect="230,220,325,360"></win>')
		API_ResponseWrite('<text>您当前的位置是</text><text color="0,255,0">'..GLOBAL_Navigate_ServerID[ServerID].name..'</text><br>')
		local ChunZaiDedDao = {}
		for IsLandID = 1,table.getn(GLOBAL_Navigate_ServerID[ServerID]) do
			if GLOBAL_Navigate_ServerID[ServerID][IsLandID] ~= nil then
				local ObjServerID = GLOBAL_Navigate_ServerID[ServerID][IsLandID].ServerID
				if API_ServerIsOpen(ObjServerID) then
					table.insert(ChunZaiDedDao,IsLandID)
				end
			end
		end
		local DaoNum = table.getn(ChunZaiDedDao)
		local NewBiao = {}
		for i = 1,DaoNum do
			local ChouQUChangDu = table.getn(ChunZaiDedDao)
			local ChouQuNo = math.random(ChouQUChangDu)
			NewBiao[i] = ChunZaiDedDao[ChouQuNo]
			table.remove(ChunZaiDedDao,ChouQuNo)
		end
		for i in NewBiao do
			local DaoID = NewBiao[i]
			API_ResponseWrite('<br><a href="Goto_Island_navigate?1='..DaoID..'">前往 ———— '..GLOBAL_Navigate_ServerID[ServerID][DaoID].name..'</a><br>')
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
			local PlayMapID = API_GetActorMapID(ActorID)
			local PlayMapConfigID = API_GetMapConfigID(PlayMapID)
			local MapID = GLOBAL_Navigate_ServerID[ServerID][IsLandID].CampID[ActorCampID].MapID
			local X = GLOBAL_Navigate_ServerID[ServerID][IsLandID].CampID[ActorCampID].TileX
			local Y = GLOBAL_Navigate_ServerID[ServerID][IsLandID].CampID[ActorCampID].TileY
			if PlayMapConfigID == 111 then
				MapID = PlayMapConfigID
				if ActorCampID == 0 then
					X,Y = 178,533
				else
					X,Y = 343,202
				end
			end
			if PlayMapConfigID == 127 then
				MapID = PlayMapConfigID
				if ActorCampID == 0 then
					X,Y = 133,84
				else
					X,Y = 133,84
				end
			end
			if PlayMapConfigID ~= 127 then
				if ActorCampID == MonsterCampID then
					local ObjServerID = GLOBAL_Navigate_ServerID[ServerID][IsLandID].ServerID
					if API_ServerIsOpen(ObjServerID) then
						API_ActorGoToMapEx(ActorID,ObjServerID,MapID, X,Y)
					end
				else
					API_ResponseWrite('<text>这里不对外国人开放</text><br>')
					API_ResponseWrite('<a>取消</a><br>')
				end
			else
				local ObjServerID = GLOBAL_Navigate_ServerID[ServerID][IsLandID].ServerID
				if API_ServerIsOpen(ObjServerID) then
					API_ActorGoToMapEx(ActorID,ObjServerID,MapID, X,Y)
				end
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

function NPCFunc_LingShiShop_Title(ActorID, NPCID)
	API_ResponseWrite('<a href="NewActorShop?1=5">购买二档装备</a><br><br>')
end

--奸商货物列表
GLOBAL_NewActorShop_Goods = {
[1] = {
		{GoodsID=101,price=18,},
		{GoodsID=102,price=54,},
		{GoodsID=103,price=162,},
	--	{GoodsID=104,price=486,},
	--	{GoodsID=105,price=1458,},
		},
[2] = {
		{GoodsID=201,price=18,},
		{GoodsID=202,price=54,},
		{GoodsID=203,price=162,},
	--	{GoodsID=204,price=486,},
	--	{GoodsID=205,price=1458,},
		},
[3] = {
	--	{GoodsID=80246,price=12,},
	--	{GoodsID=80247,price=12,},
	--	{GoodsID=80248,price=12,},
		{GoodsID=80249,price=12,},
		},
[4] = {
		{GoodsID={834,835,836,837,838,839,840,841,842,843,844,},price={300,600,600,819,1029,1372,2226,2940,3528,4410,5180,},priceType='Morale',},
		},
[5] = {
		{GoodsID=4001,price=500,priceType='Crystal',Bind=3},
		{GoodsID=4101,price=500,priceType='Crystal',Bind=3},
		{GoodsID=6601,price=500,priceType='Crystal',Bind=3},
		{GoodsID=6901,price=500,priceType='Crystal',Bind=3},
		{GoodsID=8101,price=500,priceType='Crystal',Bind=3},
		{GoodsID=4301,price=500,priceType='Crystal',Bind=3},
		{GoodsID=4201,price=500,priceType='Crystal',Bind=3},
		{GoodsID=4401,price=500,priceType='Crystal',Bind=3},
		{GoodsID=4501,price=500,priceType='Crystal',Bind=3},
		{GoodsID=2001,price=500,priceType='Crystal',Bind=3},
		{GoodsID=3001,price=500,priceType='Crystal',Bind=3},
		{GoodsID=3901,price=500,priceType='Crystal',Bind=3},
		
		{GoodsID=5001,price=500,priceType='Crystal',Bind=3},
		{GoodsID=5101,price=500,priceType='Crystal',Bind=3},
		{GoodsID=6701,price=500,priceType='Crystal',Bind=3},
		{GoodsID=7001,price=500,priceType='Crystal',Bind=3},
		{GoodsID=8201,price=500,priceType='Crystal',Bind=3},
		{GoodsID=5301,price=500,priceType='Crystal',Bind=3},
		{GoodsID=5201,price=500,priceType='Crystal',Bind=3},
		{GoodsID=5401,price=500,priceType='Crystal',Bind=3},
		{GoodsID=5501,price=500,priceType='Crystal',Bind=3},
		{GoodsID=1501,price=500,priceType='Crystal',Bind=3},
		
		{GoodsID=6001,price=500,priceType='Crystal',Bind=3},
		{GoodsID=6101,price=500,priceType='Crystal',Bind=3},
		{GoodsID=6801,price=500,priceType='Crystal',Bind=3},
		{GoodsID=8001,price=500,priceType='Crystal',Bind=3},
		{GoodsID=8301,price=500,priceType='Crystal',Bind=3},
		{GoodsID=6301,price=500,priceType='Crystal',Bind=3},
		{GoodsID=6201,price=500,priceType='Crystal',Bind=3},
		{GoodsID=6401,price=500,priceType='Crystal',Bind=3},
		{GoodsID=6501,price=500,priceType='Crystal',Bind=3},
		{GoodsID=1001,price=500,priceType='Crystal',Bind=3},
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
			local Bind = GLOBAL_NewActorShop_Goods[SelectItem][BuyNo].Bind
			if Bind == nil then
				Bind = 0
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
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,Bind,0) ~= -1 then
						if API_ActorAddMorale(ActorID,-Buyprice,JianshangTaskID,'奸商扣士气') then
							API_AddActorGoodsFlag(ActorID,BuyGoodsID,BuyNum,Bind,'奸商购买')
							API_ActorSendMsg(ActorID,0,'您花费 '..Buyprice..' 士气购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							API_ActorPlaySound(ActorID,10035)
						end
					else
						API_ActorSendMsg(ActorID,0,'您的背包满了，无法购买')
					end
				else
					API_ActorSendMsg(ActorID,0,'您的士气不够')
				end
			elseif BuypriceType ~= nil and BuypriceType == 'Crystal' then
				if API_ActorGetPropNum(ActorID,208) >= Buyprice then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,Bind,0) ~= -1 then
						if API_ActorShoppingM_Reduce(ActorID,-Buyprice,JianshangTaskID,'奸商扣水晶币') then
							API_AddActorGoodsFlag(ActorID,BuyGoodsID,BuyNum,Bind,'奸商购买')
							API_ActorSendMsg(ActorID,0,'您花费 '..Buyprice..' 水晶币购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							API_ActorPlaySound(ActorID,10035)
						end
					else
						API_ActorSendMsg(ActorID,0,'您的背包满了，无法购买')
					end
				else
					API_ActorSendMsg(ActorID,0,'您的水晶币不够')
				end
			else
				if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) >= Buyprice then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,Bind,0) ~= -1 then
						if API_ActorAddMoney(ActorID,-Buyprice,JianshangTaskID,'奸商扣钱') then
							API_AddActorGoodsFlag(ActorID,BuyGoodsID,BuyNum,Bind,'奸商购买')
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
	API_ResponseWrite('<win rect="230,222,350,400"></win>')
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
			elseif BuypriceType ~= nil and BuypriceType == 'GouWuQuan' then
				BuyNumTip = '  购买单价：'..Buyprice..'水晶币 '
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
		if Page == 0 then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_g.bmp"><text>                          </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="NewActorShop?1='..SelectItem..'&2='..NextPage..'">')
		elseif (Page + 1) * 5 < GoodsNum then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="NewActorShop?1='..SelectItem..'&2='..BackPage..'"><text>                          </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="NewActorShop?1='..SelectItem..'&2='..NextPage..'">')
		else
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="NewActorShop?1='..SelectItem..'&2='..BackPage..'"><text>                          </text><img src="LuaUse\\button_next_g.bmp">')
		end
	end
end

--月门
function NPCFunc_MoonDoor(ActorID,NPCID)
	if ActorID == nil then
		ActorID = API_RequestGetActorID() 
	end
	local MapID = API_GetActorMapID(ActorID)
	local CampID = API_GetActorCamp(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 0 then
		if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
			API_ActorSendMsg(ActorID,3,'快递中，无法进入月门！')
			return -1
		end
		if API_VarDataGetNumber(ActorID,1,11816) > 0 then
			API_ActorSendMsg(ActorID,3,'在公交车上不允许进入月门')
			return -1
		end
		if API_ActorFindStatus(ActorID,519) then
			API_ActorSendMsg(ActorID,3,'摆摊中，无法进入月门！')
			return -1
		end
		if API_ActorIsDying(ActorID) then
			API_ActorSendMsg(ActorID,3,'死亡状态无法进入月门！')
			return -1
		end
		if MapConfigID == 121 then
			API_ActorSendMsg(ActorID,3,'火山岛无法进入月门！')
			return -1
		end
		local FastID = API_VarDataGetNumber(ActorID,0,32712)
		if GLOBAL_MoonDoor_Convection[FastID] ~= nil then
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
			local YUNXU = 0
			local Master = GLOBAL_MoonDoor_Convection[FastID].Master
			if Master == ActorID then
				YUNXU = 1
			else
				local TeamID = API_GetTeamID(ActorID)
				if TeamID > 0 then
					local TeamSize = API_GetTeamSize(TeamID)
					for i = 1,TeamSize do
						if API_GetTeamMem(TeamID,i) == Master then
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
				local ExpLevel = API_GetActorExpLevel(ActorID)
				local CampID = API_GetActorCamp(ActorID)
				local ServerID = API_GetServerID()
				
				local ObjectMapID = GLOBAL_MoonDoor_Convection[FastID].MapID
				local ObjectTileX = GLOBAL_MoonDoor_Convection[FastID].TileX
				local ObjectTileY = GLOBAL_MoonDoor_Convection[FastID].TileY
				local ObjectServerID = GLOBAL_MoonDoor_Convection[FastID].ServerID
				local NeedCampID = GLOBAL_MoonDoor_Convection[FastID].NeedCampID
				local NeedMinLevel = GLOBAL_MoonDoor_Convection[FastID].NeedMinLevel
				local NeedMaxLevel = GLOBAL_MoonDoor_Convection[FastID].NeedMaxLevel
				
				if NeedCampID ~= nil and NeedCampID ~= 0 and NeedCampID ~= CampID + 1 then
					API_ActorSendMsg(ActorID,3,''..GLOBAL_CampName[CampID]..'人员无法进入此月门')
					API_ResponseClear()
					API_ResponseEnd()
					return -1
				elseif ExpLevel < NeedMinLevel then
					API_ActorSendMsg(ActorID,3,'等级低于 '..NeedMinLevel..'级 的玩家无法进入此月门')
					API_ResponseClear()
					API_ResponseEnd()
					return -1
				elseif ExpLevel > NeedMaxLevel then
					API_ActorSendMsg(ActorID,3,'等级高于 '..NeedMaxLevel..'级 的玩家无法进入此月门')
					API_ResponseClear()
					API_ResponseEnd()
					return -1
				end
				API_ResponseClear()
				API_ResponseEnd()
				if GLOBAL_Navigate_ServerID[ObjectServerID] == nil or not API_MapIsOpen(ObjectServerID,ObjectMapID) then
					ObjectServerID = ServerID
				end
				API_ActorGoToMapEx(ActorID,ObjectServerID,ObjectMapID,ObjectTileX,ObjectTileY)
				return -1
			else
				API_ResponseClear()
				API_ResponseEnd()
				API_ActorSendMsg(ActorID,3,'你没有进入此月门的权限')
				return -1
			end
		else
			API_ResponseClear()
			API_ResponseEnd()
			return -1
		end
	elseif SelectItem == 1 then
		if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
			API_ResponseWrite('<name>界石</name>')
			API_ResponseWrite('<win rect="600,200,330,200"></win>') 
			API_ResponseWrite('<br><text>快递中，无法传送！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return 
		end
		if API_VarDataGetNumber(ActorID,1,11816) > 0 then
			API_ResponseWrite('<name>界石</name>')
			API_ResponseWrite('<win rect="600,200,330,200"></win>') 
			API_ResponseWrite('<br><text>在公交车上无法传送！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return 
		end
		if API_ActorFindStatus(ActorID,519) then
			API_ResponseWrite('<name>界石</name>')
			API_ResponseWrite('<win rect="600,200,330,200"></win>') 
			API_ResponseWrite('<br><text>摆摊中，无法传送！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return 
		end
		if API_ActorIsDying(ActorID) then
			API_ResponseWrite('<name>界石</name>')
			API_ResponseWrite('<win rect="600,200,330,200"></win>') 
			API_ResponseWrite('<br><text>死亡状态无法传送！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return 
		end
		if MapID ~= API_GetStaticMapID(MapID) then
			API_ResponseWrite('<name>界石</name>')
			API_ResponseWrite('<win rect="600,200,330,200"></win>') 
			API_ResponseWrite('<br><text>无法在此处使用界石传送！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return 
		end
		if MapConfigID == 121 then
			API_ResponseWrite('<name>界石</name>')
			API_ResponseWrite('<win rect="600,200,330,200"></win>') 
			API_ResponseWrite('<br><text>火山岛无法使用界石传送！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return 
		end
		local GoodsID = 765
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			return
		end
		local High = API_RequestGetNumber(2)
		local Low = API_RequestGetNumber(3)
		local UID = API_GetUID(High,Low)
		if API_GetUIDGoodsPropNum(UID,0) ~= GoodsID then
			return
		end
		local BagType,Loc = API_GetUIDGoodsInActor(UID,ActorID)
		if BagType == -1 or Loc == -1 then
			return
		end
		Loc = Loc + 1
		--读取界石信息
		local ShiYongCiShu = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,10)
		if ShiYongCiShu >= 10 then
			API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,BagType,Loc - 1,'使用界石')
			return
		end
		local SaveMapName = API_ActorMeMScrollGetString(ActorID,BagType,Loc,1)
		local SavePosX = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,1)
		local SavePosY = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,2)
		local SaveMapID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,3)
		local SaveTileX = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,4)
		local SaveTileY = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,5)
		local SaveServerID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,6)
		local SaveNeedCampID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,7)
		local SaveNeedMinLevel = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,8)
		local SaveNeedMaxLevel = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,9)
		
		local ExpLevel = API_GetActorExpLevel(ActorID)
		local CampID = API_GetActorCamp(ActorID)
		if SaveNeedCampID ~= 0 and SaveNeedCampID ~= CampID + 1 then
			API_ResponseWrite('<name>界石</name>')
			API_ResponseWrite('<win rect="600,200,330,200"></win>') 
			API_ResponseWrite('<text>'..GLOBAL_CampName[CampID]..'人员不允许传送到这颗'..API_GetGoodsName(GoodsID)..'上所记录的位置！</text><br>')
			API_ResponseWrite('<br><a>取消</a>')
			return
		elseif ExpLevel < SaveNeedMinLevel then
			API_ResponseWrite('<name>界石</name>')
			API_ResponseWrite('<win rect="600,200,330,200"></win>') 
			API_ResponseWrite('<text>等级低于 '..SaveNeedMinLevel..'级 的玩家不允许传送到这颗'..API_GetGoodsName(GoodsID)..'上所记录的位置！</text><br>')
			API_ResponseWrite('<br><a>取消</a>')
			return
		elseif ExpLevel > SaveNeedMaxLevel then
			API_ResponseWrite('<name>界石</name>')
			API_ResponseWrite('<win rect="600,200,330,200"></win>') 
			API_ResponseWrite('<text>等级高于 '..SaveNeedMinLevel..'级 的玩家不允许传送到这颗'..API_GetGoodsName(GoodsID)..'上所记录的位置！</text><br>')
			API_ResponseWrite('<br><a>取消</a>')
			return
		end
		
		--临时处理
		if SaveMapID == 114 or SaveMapID == 115 or SaveMapID == 116 or SaveMapID == 117 or SaveMapID == 112 or SaveMapID == 110 or SaveMapID == 113 or SaveMapID == 120 then
			API_ResponseWrite('<name>界石</name>')
			API_ResponseWrite('<win rect="600,200,330,200"></win>') 
			API_ResponseWrite('<text>目前不允许传送到'..SaveMapName..'</text><br>')
			API_ResponseWrite('<br><a>取消</a>')
			return
		end
		
		
		if API_RequestGetNumber(4) == 1 then
			local ServerID = API_GetServerID()
			if GLOBAL_Navigate_ServerID[SaveServerID] ~= nil and API_MapIsOpen(SaveServerID,SaveMapID) then
				ServerID = SaveServerID
			end
			ShiYongCiShu = ShiYongCiShu + 1
			if ShiYongCiShu >= 10 then
				if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,BagType,Loc - 1,'使用界石') then
					API_ActorGoToMapEx(ActorID,ServerID,SaveMapID,SaveTileX,SaveTileY)
				end
			else
				API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,10,ShiYongCiShu)
				API_ActorGoToMapEx(ActorID,ServerID,SaveMapID,SaveTileX,SaveTileY)
			end
		else
			API_ResponseWrite('<name>界石</name>')
			API_ResponseWrite('<win rect="600,200,330,200"></win>') 
			API_ResponseWrite('<text>您确定要前往：</text><text color="255,0,255">'..SaveMapName..' （'..SavePosX..'，'..SavePosY..'）</text><text>吗？</text><br>')
			API_ResponseWrite('<br><a href="NPCFunc_MoonDoor?1=1&2='..High..'&3='..Low..'&4=1">确定前往记录的位置</a><br>')
			API_ResponseWrite('<br><a>取消</a>')
			return
		end
	elseif SelectItem == 2 or SelectItem == 3 then
		local GoodsID = 765
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			return
		end
		local High = API_RequestGetNumber(2)
		local Low = API_RequestGetNumber(3)
		local UID = API_GetUID(High,Low)
		if API_GetUIDGoodsPropNum(UID,0) ~= GoodsID then
			return
		end
		local BagType,Loc = API_GetUIDGoodsInActor(UID,ActorID)
		if BagType == -1 or Loc == -1 then
			return
		end
		Loc = Loc + 1
		local ShiYongCiShu = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,10)
		if ShiYongCiShu >= 10 then
			API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,BagType,Loc - 1,'使用界石')
			return
		end
		if MoonDoorNoGoToAddress_Tab[MapConfigID] ~= nil then
			local NeedCampID = MoonDoorNoGoToAddress_Tab[MapConfigID].CampID
			if NeedCampID == nil or NeedCampID == CampID then
				local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
				for i =1, table.getn(MoonDoorNoGoToAddress_Tab[MapConfigID]) do
					local NoGoToLocX = MoonDoorNoGoToAddress_Tab[MapConfigID][i].AddrLocX
					local NoGoToLocY = MoonDoorNoGoToAddress_Tab[MapConfigID][i].AddrLocY
					if PublicFun_AccountDistance(TileX,TileY,NoGoToLocX,NoGoToLocY) < 11 then
						local NoGoToAddressName = MoonDoorNoGoToAddress_Tab[MapConfigID][i].AddrName
						API_ResponseWrite('<name>界石</name>')
						API_ResponseWrite('<win rect="600,200,330,200"></win>') 
						if SelectItem == 2 then
							API_ResponseWrite('<text>不能在 '..NoGoToAddressName..' 的传送门十米范围内使用'..API_GetGoodsName(GoodsID)..'开启月门！</text><br>')
						elseif SelectItem == 3 then
							API_ResponseWrite('<text>不能在 '..NoGoToAddressName..' 的传送门十米范围内使用'..API_GetGoodsName(GoodsID)..'记录位置！</text><br>')
						end
						API_ResponseWrite('<br><a>取消</a>')
						return
					end
				end
				if SelectItem == 2 then
					local Point = API_ActorGetPropNum(ActorID,183)
					if Point < 5 then
						API_ResponseWrite('<name>界石</name>')
						API_ResponseWrite('<win rect="600,200,330,200"></win>') 
						API_ResponseWrite('<text>开启月门需要消耗 </text><text color="255,0,255">5 点券</text><text>，您目前只有 </text><text color="255,0,0">'..Point..'</text><text> 点券，请先通过选择“去官网充值点券”或“去交易所用金币购买点券”得到足够数量的点券后，再尝试开启月门！</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
						return
					end
					local ExpLevel = API_GetActorExpLevel(ActorID)
					if ExpLevel < 26 then
						API_ResponseWrite('<name>界石</name>')
						API_ResponseWrite('<win rect="600,200,330,200"></win>') 
						API_ResponseWrite('<text>等级低于 26级 的玩家无法开启月门！</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
						return
					end
					--读取界石信息
					local SaveMapName = API_ActorMeMScrollGetString(ActorID,BagType,Loc,1)
					local SavePosX = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,1)
					local SavePosY = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,2)
					local SaveMapID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,3)
					local SaveTileX = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,4)
					local SaveTileY = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,5)
					local SaveServerID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,6)
					local SaveNeedCampID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,7)
					local SaveNeedMinLevel = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,8)
					local SaveNeedMaxLevel = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,9)
					

					local NeedCampID = MoonDoorNoGoToAddress_Tab[MapConfigID].CampID
					local NeedMinLevel = MoonDoorNoGoToAddress_Tab[MapConfigID].MinLevel
					local NeedMaxLevel = MoonDoorNoGoToAddress_Tab[MapConfigID].MaxLevel
					local ServerID = API_GetServerID()
					
					--临时处理
					if SaveMapID == 114 or SaveMapID == 115 or SaveMapID == 116 or SaveMapID == 117 or SaveMapID == 112 or SaveMapID == 110 or SaveMapID == 113 or SaveMapID == 120 then
						API_ResponseWrite('<name>界石</name>')
						API_ResponseWrite('<win rect="600,200,330,200"></win>') 
						API_ResponseWrite('<text>目前不允许传送到'..SaveMapName..'</text><br>')
						API_ResponseWrite('<br><a>取消</a>')
						return
					end
					
					if API_RequestGetNumber(4) == 1 then
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
							if FastID1 ~= 0 and API_GetMonsterID(FastID1) == MoonDoorID then
								API_DestroyMonster(FastID1)
							end
							if FastID2 ~= 0 and API_GetMonsterID(FastID2) == MoonDoorID then
								API_DestroyMonster(FastID2)
							end
						end
						FastID1 = API_CreateMonsterEx(MapID,MoonDoorID,TileX,TileY,Direct,0,-1,1)
						if GLOBAL_Navigate_ServerID[SaveServerID] ~= nil and API_ServerIsOpen(SaveServerID) and SaveServerID == API_GetServerID() and API_MapIsValid(SaveMapID + (ServerID - 1)*150) then
							FastID2 = API_CreateMonsterEx(SaveMapID,MoonDoorID,SaveTileX,SaveTileY,Direct,0,-1,1)
						elseif (GLOBAL_Navigate_ServerID[SaveServerID] == nil or not API_ServerIsOpen(SaveServerID)) and API_MapIsValid(SaveMapID + (ServerID - 1)*150) then
							FastID2 = API_CreateMonsterEx(SaveMapID,MoonDoorID,SaveTileX,SaveTileY,Direct,0,-1,1)
						else
							FastID2 = 0
						end
						local TimerTriggerGID = API_VarDataGetNumber(ActorID,0,18112)
						if TimerTriggerGID ~= 0 then
							API_DestroyTriggerG(TimerTriggerGID)
						end
						TimerTriggerGID = API_CreateTimerTriggerG(FastID1,FastID2,30,1,'SkillGoods_MoonDoor_TimerTriggerCallFunc')
						API_VarDataSetNumber(ActorID,0,18112,TimerTriggerGID)
						if FastID1 > 0 then
							ShiYongCiShu = ShiYongCiShu + 1
							local GreatOpen = 0
							if ShiYongCiShu >= 10 then
								if API_UsePoint(ActorID,3,GoodsID,1,5) == 0 and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,BagType,Loc - 1,'使用界石') then
									GreatOpen = 1
								end
							else
								API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,10,ShiYongCiShu)
								if API_UsePoint(ActorID,3,GoodsID,1,5) == 0 then
									GreatOpen = 1
								end
							end
							if GreatOpen == 1 then
								API_MonsterAddStatus(FastID1,81006,30000)
								if FastID2 > 0 then
									API_MonsterAddStatus(FastID2,81006,30000)
								end
								API_VarDataSetNumber(ActorID,0,18111,FastID1)
								API_VarDataSetNumber(ActorID,0,18113,FastID2)
								
								local ActorName = API_GetActorName(ActorID)
								ActorName = ''..ActorName..'的'
								API_SetMonsterName(FastID1,ActorName,2)
								if FastID2 > 0 then
									API_SetMonsterName(FastID2,ActorName,2)
								end
								local Object = ' (前往-'..SaveMapName..')'
								API_SetMonsterName(FastID1,Object,3)
								local Object2 = ' (返回-'..API_GetMapName(MapID)..')'
								if FastID2 > 0 then
									API_SetMonsterName(FastID2,Object2,3)
								end
								GLOBAL_MoonDoor_Convection[FastID1] = {Master = ActorID, MapID = SaveMapID, TileX = SaveTileX, TileY = SaveTileY, ServerID = SaveServerID, NeedCampID=SaveNeedCampID, NeedMinLevel = SaveNeedMinLevel, NeedMaxLevel = SaveNeedMaxLevel,}
								if FastID2 > 0 then
									if NeedCampID == nil then
										NeedCampID = 0
									else
										NeedCampID = NeedCampID + 1
									end
									GLOBAL_MoonDoor_Convection[FastID2] = {Master = ActorID, MapID = MapConfigID, TileX = TileX, TileY = TileY, ServerID = ServerID, NeedCampID=NeedCampID, NeedMinLevel = NeedMinLevel, NeedMaxLevel = NeedMaxLevel,}
								end
								API_ActorSendMsg(ActorID,8,'您消耗 5 点券开启了月门')
								API_ActorSendMsg(ActorID,1,'请左键点击月门前往您的目的地！')
							else
								if FastID1 > 0 then
									API_DestroyMonster(FastID1)
								end
								if FastID2 > 0 then
									API_DestroyMonster(FastID2)
								end
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
					else
						API_ResponseWrite('<name>界石</name>')
						API_ResponseWrite('<win rect="600,200,330,200"></win>') 
						API_ResponseWrite('<text>开启月门需要消耗 </text><text color="255,0,255">5 点券</text><br>')
					--	API_ResponseWrite('<text>月门持续30秒，队伍内的所有成员都可以通过月门到达界石的记录点</text><br>')
						API_ResponseWrite('<text>您确定要在这里开启通往：</text><text color="255,0,255">'..SaveMapName..' （'..SavePosX..'，'..SavePosY..'）</text><text>的月门吗？</text><br>')
						API_ResponseWrite('<br><a href="NPCFunc_MoonDoor?1=2&2='..High..'&3='..Low..'&4=1">确定开启月门</a><br>')
						API_ResponseWrite('<br><a>取消</a>')
						return
					end
				elseif SelectItem == 3 then
					local PosX,PosY = PublicFun_TileToPixel(MapID,TileX,TileY)
					local MapName = API_GetMapName(MapID)
					if API_RequestGetNumber(4) == 1 then
						local NeedCampID = MoonDoorNoGoToAddress_Tab[MapConfigID].CampID
						local NeedMinLevel = MoonDoorNoGoToAddress_Tab[MapConfigID].MinLevel
						local NeedMaxLevel = MoonDoorNoGoToAddress_Tab[MapConfigID].MaxLevel
						local ServerID = API_GetServerID()
						API_ActorMeMScrollSetString(ActorID,BagType,Loc,1,MapName)
						API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,1,PosX)
						API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,2,PosY)
						API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,3,MapConfigID)
						API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,4,TileX)
						API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,5,TileY)
						API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,6,ServerID)
						if NeedCampID == nil then
							API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,7,0)
						else
							API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,7,NeedCampID + 1)
						end
						API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,8,NeedMinLevel)
						API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,9,NeedMaxLevel)
						API_ResponseWrite('<name>界石</name>')
						API_ResponseWrite('<win rect="600,200,330,200"></win>') 
						API_ResponseWrite('<text>'..API_GetGoodsName(GoodsID)..'记录成功：</text><text color="255,0,255">'..MapName..' （'..PosX..'，'..PosY..'）</text><text>！</text><br>')
						API_ResponseWrite('<br><a href="NPCFunc_MoonDoor?1=4&2='..High..'&3='..Low..'">添加备注</a><br>')
						API_ResponseWrite('<br><a>确定</a>')
						return
					else
						API_ResponseWrite('<name>界石</name>')
						API_ResponseWrite('<win rect="600,200,330,200"></win>') 
						API_ResponseWrite('<text>您确定要用'..API_GetGoodsName(GoodsID)..'记录您当前的位置：</text><text color="255,0,255">'..MapName..' （'..PosX..'，'..PosY..'）</text><text>吗？</text><br>')
						API_ResponseWrite('<br><a href="NPCFunc_MoonDoor?1=3&2='..High..'&3='..Low..'&4=1">确定记录位置</a><br>')
						API_ResponseWrite('<br><a>取消</a>')
						return
					end
				end
			else
				API_ResponseWrite('<name>界石</name>')
				API_ResponseWrite('<win rect="600,200,330,200"></win>') 
				if SelectItem == 2 then
					API_ResponseWrite('<text>'..GLOBAL_CampName[CampID]..'人员不允许在'..API_GetMapName(MapID)..'使用'..API_GetGoodsName(GoodsID)..'开启月门！</text><br>')
				elseif SelectItem == 3 then
					API_ResponseWrite('<text>'..GLOBAL_CampName[CampID]..'人员不允许在'..API_GetMapName(MapID)..'使用'..API_GetGoodsName(GoodsID)..'记录位置！</text><br>')
				end
				API_ResponseWrite('<br><a>取消</a>')
				return
			end
		else
			API_ResponseWrite('<name>界石</name>')
			API_ResponseWrite('<win rect="600,200,330,200"></win>') 
			if SelectItem == 2 then
				API_ResponseWrite('<text>'..API_GetMapName(MapID)..'不允许使用'..API_GetGoodsName(GoodsID)..'开启月门！</text><br>')
			elseif SelectItem == 3 then
				API_ResponseWrite('<text>'..API_GetMapName(MapID)..'不允许使用'..API_GetGoodsName(GoodsID)..'记录位置！</text><br>')
			end
			API_ResponseWrite('<br><a>取消</a>')
			return
		end
	elseif SelectItem == 4 then
		local GoodsID = 765
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			return
		end
		local High = API_RequestGetNumber(2)
		local Low = API_RequestGetNumber(3)
		local UID = API_GetUID(High,Low)
		if API_GetUIDGoodsPropNum(UID,0) ~= GoodsID then
			return
		end
		local BagType,Loc = API_GetUIDGoodsInActor(UID,ActorID)
		if BagType == -1 or Loc == -1 then
			return
		end
		Loc = Loc + 1
		local ShiYongCiShu = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,10)
		if ShiYongCiShu >= 10 then
			API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,BagType,Loc - 1,'使用界石')
			return
		end
		local SaveMapName = API_ActorMeMScrollGetString(ActorID,BagType,Loc,1)
		local SavePosX = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,1)
		local SavePosY = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,2)
		local SaveMapID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,3)
		
		if API_RequestGetNumber(4) == 1 then
			local Tip = API_RequestGetString(5)
			if type(Tip) == 'string' and Tip ~= '' then	
				SaveMapName = API_GetMapName(SaveMapID)..Tip
				API_ActorMeMScrollSetString(ActorID,BagType,Loc,1,SaveMapName)
				API_ResponseWrite('<name>界石</name>')
				API_ResponseWrite('<win rect="600,200,330,200"></win>')
				API_ResponseWrite('<text color="0,255,0">修改备注成功！</text><br>')
				API_ResponseWrite('<text>界石上当前记录的位置是：</text><br>')
				API_ResponseWrite('<text color="255,0,255">'..SaveMapName..' （'..SavePosX..'，'..SavePosY..'）</text><br>')
				API_ResponseWrite('<br><a>确定</a>')
			else
				API_ResponseWrite('<name>界石</name>')
				API_ResponseWrite('<win rect="600,200,330,200"></win>')
				API_ResponseWrite('<text color="255,0,0">输入有误，设置无效</text><br>')
				API_ResponseWrite('<text>重新请输入您要修改的备注：</text><br>')
				API_ResponseWrite('<text color="255,0,255">'..API_GetMapName(SaveMapID)..' </text><input type="string" bFilter="1" name="5" size="8" width="70"><text color="255,0,255">（'..SavePosX..'，'..SavePosY..'）</text><br>')
				API_ResponseWrite('<br><a href="NPCFunc_MoonDoor?1=4&2='..High..'&3='..Low..'&4=1">确定修改</a><br>')
				API_ResponseWrite('<br><a>取消</a>')
			end
		else
			API_ResponseWrite('<name>界石</name>')
			API_ResponseWrite('<win rect="600,200,330,200"></win>')
			if SaveMapName ~= '' then
				API_ResponseWrite('<text>界石上当前记录的位置是：</text><br>')
				API_ResponseWrite('<text>'..SaveMapName..' （'..SavePosX..'，'..SavePosY..'）</text><br>')
			end
			API_ResponseWrite('<text>请输入您要修改的备注：</text><br>')
			API_ResponseWrite('<text color="255,0,255">'..API_GetMapName(SaveMapID)..' </text><input type="string" bFilter="1" name="5" size="8" width="70"><text color="255,0,255">（'..SavePosX..'，'..SavePosY..'）</text><br>')
			API_ResponseWrite('<br><a href="NPCFunc_MoonDoor?1=4&2='..High..'&3='..Low..'&4=1">确定修改</a><br>')
			API_ResponseWrite('<br><a>取消</a>')
			return
		end
	end
end

--生命泉水
function NPCFunc_LifeWater(ActorID,NPCID)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
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
	local CampIsOK = 0
	if API_MonsterGetPropNum(FastID,PD_PROP_CAMPID) == API_GetActorCamp(ActorID) then
		CampIsOK = 1
	end
	for i = 1,table.getn(LaJuZhanFuBenMapID) do 
		if StaticMapID == LaJuZhanFuBenMapID[i] then
			if API_MonsterGetPropNum(FastID,PD_PROP_CAMPID) == API_GetActorBattleCamp(ActorID) then
				CampIsOK = 1
			else
				CampIsOK = 0
			end
			break
		end
	end
	for i = 1,table.getn(TML_HuoBaoLaJuMapID) do 
		if StaticMapID == TML_HuoBaoLaJuMapID[i] then
			if API_MonsterGetPropNum(FastID,PD_PROP_CAMPID) == API_GetActorBattleCamp(ActorID) then
				CampIsOK = 1
			else
				CampIsOK = 0
			end
			break
		end
	end
	if CampIsOK == 0 then
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
--2084006
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
			API_ResponseWrite('<br><a href="NPCFunc_Nana?1=2">购买移动BUFF</a><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
		end
	elseif SelectItem == 2 then
		if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) >= 306 then
			
			if API_ActorAddMoney(ActorID,-306,HuShiMMTaskID,'护手MM收费') then
				API_ActorAddStatus(ActorID,2085001,3600000)
				API_ResponseWrite('<text>移动速度加成</text><br>')
				API_ResponseWrite('<text color="255,0,255">您花费306金币购买了移动速度加成状态</text><br>')
				API_ResponseWrite('<text color="255,0,0">下线或切换地图状态失效。</text><br><text color="255,0,0">如果重复购买：后购买的状态效果替换之前购买的状态</text><br>')
				API_ActorSendMsg(ActorID,1,'您花费306金币购买了一小时移动速度加成')
				API_ActorSendMsg(ActorID,1,'下线或切换地图状态失效')
				API_ActorSendMsg(ActorID,1,'如果重复购买：后购买的状态替换之前购买的状态')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
			
		else
			API_ResponseWrite('<text>移动速度加成</text><br>')
			API_ResponseWrite('<text>价格：306金币</text><br>')
			API_ResponseWrite('<text color="255,0,0">您身上的金币不够</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
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
					if API_ActorAddMoney(ActorID,-NeedMoney,HuShiMMTaskID,'护?諱M收费') then
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
		API_ResponseWrite('<text>'..GLOBAL_CampName[CampID]..'与'..GLOBAL_OpposeCampName[CampID]..'的战事吃紧，为了打赢这场战争，已经到了考验我们后勤的时候了，各位能工巧匠如果能</text><text color="255,0,255">将你们自己打造的装备</text><text>捐献给前线战士们的话，'..GLOBAL_CampName[CampID]..'将奖励您大量经验！</text><br>')
		API_ResponseWrite('<text color="255,0,0">请将您自己打造的装备放在下面的格子里，我会帮您评估它的价值，然后给出对应的经验奖励。</text><br>')
		API_ResponseWrite('<goodsHolder name="100"><br>')
		API_ResponseWrite('<br><a href="NPCFunc_SellItem_Title?1=1">放好了，请问捐献之后能获得多少经验？</a><br>')
		API_ResponseWrite('<br><a>我路过</a><br>')
	elseif SelectItem == 1 then
		local UidHigh = API_RequestGetNumber(100)--高位UID
		local UidLow = API_RequestGetNumber(1100)--低位UID
		

		local Uid = API_GetUID(UidHigh,UidLow) --获取UID	
		local BoxID,LocID = API_GetUIDGoodsInActor(Uid,ActorID)--背包ID 和 位置
		local GoodsID = API_GetUIDGoodsPropNum(Uid,0)--提交的物品ID
		if BoxID == -1 or LocID == -1 then
			API_ResponseWrite('<text>'..GLOBAL_CampName[CampID]..'与'..GLOBAL_OpposeCampName[CampID]..'的战事吃紧，为了打赢这场战争，已经到了考验我们后勤的时候了，各位能工巧匠如果能</text><text color="255,0,255">将你们自己打造的装备</text><text>捐献给前线战士们的话，'..GLOBAL_CampName[CampID]..'将奖励您大量经验！</text><br>')
			API_ResponseWrite('<text color="255,0,0">请将您自己打造的装备放在下面的格子里，我会帮您评估它的价值，然后给出对应的经验奖励。</text><br>')
			API_ResponseWrite('<goodsHolder name="100"><br>')
			API_ResponseWrite('<br><a href="NPCFunc_SellItem_Title?1=1">放好了，请问捐献之后能获得多少经验？</a><br>')
			API_ResponseWrite('<br><a>我路过</a><br>')
			return
		end
		if GoodsID > 0 and GoodsID == API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,0) then
			local ItemType = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,50)
			if ItemType == 1 then
				local zhizhaoze = API_ActorGetGoodsPropStr(ActorID,BoxID,LocID+1,2)
				if zhizhaoze == API_GetActorName(ActorID) then
					local wupingdangci = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,51)
					local wupingqianzui = API_ActorGetGoodsPropStr(ActorID,BoxID,LocID+1,3)
					local wupingmingcheng = API_ActorGetGoodsPropStr(ActorID,BoxID,LocID+1,1)
					local shengjicishu = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,120)
					local dianhuacishu = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,11)
					local shiyongdengji = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,52)
					local wupingleixing = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,121)
					local fujiaxiaoguonum = 0
					if API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,12) == 1 then
						for i = 112,113 do
							if API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,i) > 0 then
								fujiaxiaoguonum = fujiaxiaoguonum + 1
							end
						end
					end
					local chachaonum = 0
					local Nochachaonum = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,123)
					
					for i = 106,108 do
						if API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,i) < 65535 then
							chachaonum = chachaonum + 1
						end
					end
					local Zhongchachaonum = chachaonum + Nochachaonum
					local kapianshuliang = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,122)
					local gongxunjiangli = 0
					local NeedHunger = GLOBAL_SellItem_Time[wupingdangci].Hunger
					if GLOBAL_SellItem_Time[wupingdangci] ~= nil then
						local Basic = GLOBAL_SellItem_Time[wupingdangci].Basic
						local CanShu = GLOBAL_SellItem_Time[wupingdangci].CanShu
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
							
							gongxunjiangli = math.floor( Time * Basic * CanShu)
							
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
						API_ResponseWrite('<text Size="20" color="255,0,255">捐献这件装备您可以获得'..gongxunjiangli..'经验</text><br>')
						API_ResponseWrite('<text color="255,0,0">捐献需要消耗 '..NeedHunger..' 活力值</text><br>')
						API_ResponseWrite('<br><a href="NPCFunc_SellItem_Title?1=1&2=1&100='..UidHigh..'&1100='..UidLow..'">捐献装备换经验</a><br>')
						API_ResponseWrite('<br><a>取消</a><br>')
					else
						local ExpLevel = API_GetActorExpLevel(ActorID)
						local MinExpLevelList = {[1]=1,[2]=5,[3]=21,[4]=31,[5]=46,[6]=55,[7]=61,[8]=71,}
						local MinExpLevel = MinExpLevelList[wupingdangci]
						if MinExpLevel ~= nil and ExpLevel < MinExpLevel then
							local NeedMinExpLevelCN = GLOBAL_Exploit[MinExpLevel].PeerageDepict
							API_ResponseWrite('<text color="255,0,255">捐献'..PublicFun_ArabianNumberToChineseNumber(wupingdangci)..'档装备至少需要达到'..NeedMinExpLevelCN..'</text><text>，这件装备还是先留着提高自己的等级吧</text><br>')
							API_ResponseWrite('<br><a>我明白了</a><br>')
							return
						end
						if API_ActorGetPropNum(ActorID,PD_PROP_HUNGER) < NeedHunger then
							local NeedMinExpLevelCN = GLOBAL_Exploit[MinExpLevel].PeerageDepict
							API_ResponseWrite('<text color="255,0,255">捐献'..PublicFun_ArabianNumberToChineseNumber(wupingdangci)..'档装备消耗 '..NeedHunger..' 活力值，你可以通过浮空岛玩法或其他任务获得活力值</text><br>')
							API_ResponseWrite('<br><a>我明白了</a><br>')
							return
						end
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
							API_ResponseWrite('<text color="255,0,255">每天最多只允许捐献十件装备！</text><text>多余的装备请明天再来捐献</text><br>')
							API_ResponseWrite('<br><a>我明白了</a><br>')
							return
						else
							Biaozhi = year * 10000 + month * 100 + day
							API_VarDataSetNumber(ActorID,1,18265,TodayNum)
							API_VarDataSetNumber(ActorID,1,18266,Biaozhi)
						end
						if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,BoxID,LocID,'装备换经验') then
							--扣除活力
							API_ActorAddHunger(ActorID,-NeedHunger)
							if GoodsID == API_ActorPackageGetLocGoodsID(ActorID,BoxID,LocID) then
								API_ActorSendMsg(ActorID,3,'请勿作弊')
							else
								API_ActorAddExp(ActorID,gongxunjiangli,SellItemTaskID,'装备换经验')
								API_ActorSendMsg(ActorID,3,'您获得'..gongxunjiangli..'经验')
								API_ResponseWrite('<text color="255,0,255">您本次装备捐献获得'..gongxunjiangli..'经验。</text><br>')
								API_ResponseWrite('<text>如果您还想继续捐献装备的话，请将您自己打造的装备放在下面的格子里，我会帮您评估它的价值，然后给出对应的经验奖励。</text><br>')
								API_ResponseWrite('<goodsHolder name="100"><br>')
								API_ResponseWrite('<br><a href="NPCFunc_SellItem_Title?1=1">放好了，请问捐献之后能获得多少经验？</a><br>')
								API_ResponseWrite('<br><a>取消</a><br>')
								if API_VarDataGetNumber(ActorID,1,353) == 1 then
									API_VarDataSetNumber(ActorID,1,4761,1)
								end
								if wupingdangci >= 2 then
									if API_VarDataGetNumber(ActorID,1,354) == 1 then
										API_VarDataSetNumber(ActorID,1,4766,1)
									end
								end
								g_EventSystem:FireAction(ActorID,nil,_EVENT_ID_ONDONATE,_E_SRC_TYPE_GOODS,GoodsID)
							end
						end
					end
				else
					API_ResponseWrite('<text color="255,0,255">请将您自己打造的</text><text>装备放在下面的格子里，我会帮您评估它的价值，然后给出对应的经验奖励。</text><br>')
					API_ResponseWrite('<goodsHolder name="100"><br>')
					API_ResponseWrite('<br><a href="NPCFunc_SellItem_Title?1=1">放好了，请问捐献之后能获得多少经验？</a><br>')
					API_ResponseWrite('<br><a>取消</a><br>')
				end
			else
				API_ResponseWrite('<text>请将您自己打造的</text><text color="255,0,255">装备</text><text>放在下面的格子里，我会帮您评估它的价值，然后给出对应的经验奖励。</text><br>')
				API_ResponseWrite('<goodsHolder name="100"><br>')
				API_ResponseWrite('<br><a href="NPCFunc_SellItem_Title?1=1">放好了，请问捐献之后能获得多少经验？</a><br>')
				API_ResponseWrite('<br><a>取消</a><br>')
			end
		else
			API_ResponseWrite('<text>请将您自己打造的装备</text><text color="255,0,255">放在下面的格子里</text><text>，我会帮您评估它的价值，然后给出对应的经验奖励。</text><br>')
			API_ResponseWrite('<goodsHolder name="100"><br>')
			API_ResponseWrite('<br><a href="NPCFunc_SellItem_Title?1=1">放好了，请问捐献之后能获得多少经验？</a><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
		end
	end
end


local PeFangGaoToDi = {
[80050] = 80049,
[80051] = 80050,
[80066] = 80065,
[80067] = 80066,
}

local XunZhangGaoToDi = {
[80305] = 80297,
[80306] = 80298,
[80313] = 80305,
[80314] = 80306,
}

local YingdaozheTaskID = 1811
--引导者
function NPCFunc_Yingdaozhe_Title(ActorID,NPCID)
	if ActorID ==nil then
		ActorID = API_RequestGetActorID()
	end
	local SelectItem = API_RequestGetNumber(1)
	local XuanZheFangShi = API_RequestGetNumber(2)
	if SelectItem == 0 then
	--[[
		API_ResponseWrite('<br><text> </text>')
		API_ResponseWrite('<img srcgd="80498" tipgd="80498">')
		API_ResponseWrite('<text>                    </text>')
		API_ResponseWrite('<img srcgd="80697" tipgd="80697">')
		API_ResponseWrite('<text>                    </text>')
		API_ResponseWrite('<img srcgd="80696" tipgd="80696">')
		API_ResponseWrite('<text>                    </text>')
		API_ResponseWrite('<img srcgd="80051">')
		API_ResponseWrite('<text>                    </text>')
		API_ResponseWrite('<img srcgd="80314">')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<a href="NPCFunc_Yingdaozhe_Title?1=1">兑换经验</a>')
		API_ResponseWrite('<text>                 </text>')
		API_ResponseWrite('<a href="NPCFunc_Yingdaozhe_Title?1=2">兑换金币</a>')
		API_ResponseWrite('<text>                </text>')
		API_ResponseWrite('<a href="NPCFunc_Yingdaozhe_Title?1=3">兑换水晶币</a>')
		API_ResponseWrite('<text>               </text>')
		API_ResponseWrite('<a href="NPCFunc_Yingdaozhe_Title?1=4">兑换配方</a>')
		API_ResponseWrite('<text>                  </text>')
		API_ResponseWrite('<a href="NPCFunc_Yingdaozhe_Title?1=5">兑换勋章</a>')
		]]
	elseif SelectItem == 1 then
		if XuanZheFangShi == 0 then
			API_ResponseWrite('<text>使用领域卷轴可以创建领域：</text><br>')
			API_ResponseWrite('<text>在领域内杀怪可获得经验奖励，领域的主人在也可以从中获得收益——'..API_GetGoodsName(80498)..'</text><br>')
			API_ResponseWrite('<text>您可以随时拿'..API_GetGoodsName(80498)..'到我这里来兑换经验，每张'..API_GetGoodsName(80498)..'允许兑换100经验，请问您要兑换多少张？</text><br>')
			API_ResponseWrite('<br><input type="number" name="3" size="4" width="60"><a href="NPCFunc_Yingdaozhe_Title?1=1&2=1">我要兑换这些</a><br>')
			API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=1&2=2">全部兑换</a><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
		elseif XuanZheFangShi == 1 or XuanZheFangShi == 2 then
			local anzhuangshuliang = API_RequestGetNumber(3)
			if XuanZheFangShi == 2 then
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
			elseif anzhuangshuliang > 99999 then
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
					if API_ActorRemoveGoods(ActorID,80498,anzhuangshuliang,'兑换经验') then
						local expAdd = anzhuangshuliang * 100
						API_ActorAddExp(ActorID,expAdd,YingdaozheTaskID,'引导者兑换经验')
						API_ResponseWrite('<text>您用 '..anzhuangshuliang..' 张</text><text color="255,0,0">'..API_GetGoodsName(80498)..'</text><text>兑换了'..expAdd..'经验。</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						g_EventSystem:FireAction(ActorID,nil,_EVENT_ID_ONUSEGOODS,_E_SRC_TYPE_GOODS,80498)
					end
				else
					API_ResponseWrite('<text>您当前经验达到上限，无法继续兑换经验，请提升等级后再来兑换</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			end
		end
	elseif SelectItem == 2 then
		if XuanZheFangShi == 0 then
			API_ResponseWrite('<text>您可以随时拿'..API_GetGoodsName(80697)..'到我这里来兑换金币，每张'..API_GetGoodsName(80697)..'允许兑换100金币，请问您要兑换多少张？</text><br>')
			API_ResponseWrite('<br><input type="number" name="3" size="4" width="60"><a href="NPCFunc_Yingdaozhe_Title?1=2&2=1">我要兑换这些</a><br>')
			API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=2&2=2">全部兑换</a><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
		elseif XuanZheFangShi == 1 or XuanZheFangShi == 2 then
			local anzhuangshuliang = API_RequestGetNumber(3)
			if XuanZheFangShi == 2 then
				anzhuangshuliang = API_ActorGetGoodsNum(ActorID,80697)
			end
			if anzhuangshuliang <= 0 then
				anzhuangshuliang = 1
			end
			if anzhuangshuliang > API_ActorGetGoodsNum(ActorID,80697) then
				anzhuangshuliang = API_ActorGetGoodsNum(ActorID,80697)
			end
			if API_ActorGetGoodsNum(ActorID,80697) <= 0 then
				API_ResponseWrite('<text>您身上没有</text><text color="255,0,0">'..API_GetGoodsName(80697)..'</text><text>，不能兑换。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			elseif anzhuangshuliang > 99999 then
				API_ResponseWrite('<text>一次最多只能兑换 99999 张</text><text color="255,0,0">'..API_GetGoodsName(80697)..'</text><text>。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			else
				local Money = anzhuangshuliang * 100
				local MoneyMax = 5000000
				local MoneyNow = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD)
				local MoneyAddMax = MoneyMax - MoneyNow
				if Money > MoneyAddMax then
					anzhuangshuliang = math.ceil(MoneyAddMax/100)
				end
				if anzhuangshuliang > 0 then
					if API_ActorRemoveGoods(ActorID,80697,anzhuangshuliang,'兑换金币') then
						local MoneyAdd = anzhuangshuliang * 100
						API_ActorAddMoney(ActorID,MoneyAdd,YingdaozheTaskID,'引导者兑换金币')
						API_ResponseWrite('<text>您用 '..anzhuangshuliang..' 张</text><text color="255,0,0">'..API_GetGoodsName(80697)..'</text><text>兑换了'..MoneyAdd..'金币。</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						g_EventSystem:FireAction(ActorID,nil,_EVENT_ID_ONUSEGOODS,_E_SRC_TYPE_GOODS,80697)
					end
				else
					API_ResponseWrite('<text>您当前金币达到上限，无法继续兑换金币，请前往交易所将金币转换成金砖后再来兑换</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			end
		end
	elseif SelectItem == 3 then
		if XuanZheFangShi == 0 then
			API_ResponseWrite('<text>您可以随时拿'..API_GetGoodsName(80696)..'到我这里来兑换水晶币，每张'..API_GetGoodsName(80696)..'允许兑换100水晶币，请问您要兑换多少张？</text><br>')
			API_ResponseWrite('<br><input type="number" name="3" size="4" width="60"><a href="NPCFunc_Yingdaozhe_Title?1=3&2=1">我要兑换这些</a><br>')
			API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=3&2=2">全部兑换</a><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
		elseif XuanZheFangShi == 1 or XuanZheFangShi == 2 then
			local anzhuangshuliang = API_RequestGetNumber(3)
			if XuanZheFangShi == 2 then
				anzhuangshuliang = API_ActorGetGoodsNum(ActorID,80696)
			end
			if anzhuangshuliang <= 0 then
				anzhuangshuliang = 1
			end
			if anzhuangshuliang > API_ActorGetGoodsNum(ActorID,80696) then
				anzhuangshuliang = API_ActorGetGoodsNum(ActorID,80696)
			end
			if API_ActorGetGoodsNum(ActorID,80696) <= 0 then
				API_ResponseWrite('<text>您身上没有</text><text color="255,0,0">'..API_GetGoodsName(80696)..'</text><text>，不能兑换。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			elseif anzhuangshuliang > 99999 then
				API_ResponseWrite('<text>一次最多只能兑换 99999 张</text><text color="255,0,0">'..API_GetGoodsName(80696)..'</text><text>。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			else
				local Crystal = anzhuangshuliang * 100
				local CrystalMax = 100000000
				local CrystalNow = API_ActorGetPropNum(ActorID,208)
				local CrystalAddMax = CrystalMax - CrystalNow
				if Crystal > CrystalAddMax then
					anzhuangshuliang = math.ceil(CrystalAddMax/100)
				end
				if anzhuangshuliang > 0 then
					if API_ActorRemoveGoods(ActorID,80696,anzhuangshuliang,'兑换金币') then
						local CrystalAdd = anzhuangshuliang * 100
						API_ActorShoppingM_Add(ActorID,CrystalAdd,YingdaozheTaskID,'引导者兑换水晶币')
						API_ResponseWrite('<text>您用 '..anzhuangshuliang..' 张</text><text color="255,0,0">'..API_GetGoodsName(80696)..'</text><text>兑换了'..CrystalAdd..'水晶币。</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						g_EventSystem:FireAction(ActorID,nil,_EVENT_ID_ONUSEGOODS,_E_SRC_TYPE_GOODS,80696)
					end
				else
					API_ResponseWrite('<text>您当前水晶币达到上限，无法继续兑换水晶币</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			end
		end
	elseif SelectItem == 4 then
		if XuanZheFangShi == 0 then
			API_ResponseWrite('<text>您可以随时拿高档配方到我这里来兑换低一档的配方，</text><text color="255,0,255">一个高档配方可以兑换一个低一档的配方</text><text>，请将要兑换的配方放入下面的空格内。</text><br><br>')
			API_ResponseWrite('<goodsHolder name="100"><br>')
			API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=4&2=1">兑换配方</a><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
		elseif XuanZheFangShi == 1 then
			local UidHigh = API_RequestGetNumber(100)--高位UID
			local UidLow = API_RequestGetNumber(1100)--低位UID
			local Uid = API_GetUID(UidHigh,UidLow) --获取UID	
			local BoxID,LocID = API_GetUIDGoodsInActor(Uid,ActorID)--背包ID 和 位置
			if BoxID == -1 or LocID == -1 then
				API_ResponseWrite('<text>您可以随时拿高档配方到我这里来兑换低一档的配方，</text><text color="255,0,255">一个高档配方可以兑换一个低一档的配方</text><text>，请将要兑换的配方放入下面的空格内。</text><br><br>')
				API_ResponseWrite('<goodsHolder name="100"><br>')
				API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=4&2=1">兑换配方</a><br>')
				API_ResponseWrite('<br><a>取消</a><br>')
				return
			end
			local GoodsID = API_GetUIDGoodsPropNum(Uid,0)--提交的物品ID
			if GoodsID > 0 then
				if PeFangGaoToDi[GoodsID] ~= nil then
					local DuiHuanGoodsID = PeFangGaoToDi[GoodsID]
					local Band = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,4)
					local DuiHuanNum = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,3)
					if API_ActorCanAddGoods(ActorID,DuiHuanGoodsID,DuiHuanNum,Band,0) ~= -1 then
						if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,DuiHuanNum,BoxID,LocID, '兑换配方删除'..API_GetGoodsName(GoodsID)..'') then
							API_AddActorGoodsFlag(ActorID,DuiHuanGoodsID,DuiHuanNum,Band,'兑换配方获得'..API_GetGoodsName(DuiHuanGoodsID)..'')
							API_ActorSendMsg(ActorID,0,'您用 '..DuiHuanNum..'张 '..API_GetGoodsName(GoodsID)..' 兑换了  '..DuiHuanNum..'张 '..API_GetGoodsName(DuiHuanGoodsID)..' ')
							API_ActorSendMsg(ActorID,7,'您用 '..DuiHuanNum..'张 '..API_GetGoodsName(GoodsID)..' 兑换了  '..DuiHuanNum..'张 '..API_GetGoodsName(DuiHuanGoodsID)..' ')
							API_ResponseWrite('<br><text>兑换成功，您获得：</text><img srcgd="'..DuiHuanGoodsID..'" tipgd="'..DuiHuanGoodsID..'"><text> × '..DuiHuanNum..'</text><br>')
							API_ResponseWrite('<br><text>如果要继续兑换低档的配方，请将要兑换的高档配方放入下面的空格内。</text><br><br>')
							API_ResponseWrite('<goodsHolder name="100"><br>')
							API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=4&2=1">继续兑换</a><br>')
							API_ResponseWrite('<br><a>关闭</a><br>')
						end
					end
				elseif GoodsID == 80065 or GoodsID == 80049 then
					API_ResponseWrite('<br><text color="255,0,0">你放入的配方已经是最低档次的配方了。</text><br>')
					API_ResponseWrite('<br><text>请将要兑换的高档配方放入下面的空格内。</text><br><br>')
					API_ResponseWrite('<goodsHolder name="100"><br>')
					API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=4&2=1">兑换配方</a><br>')
					API_ResponseWrite('<br><a>关闭</a><br>')
				else
					API_ResponseWrite('<text>您可以随时拿高档配方到我这里来兑换低一档的配方，</text><text color="255,0,255">一个高档配方可以兑换一个低一档的配方</text><text>，请将要兑换的配方放入下面的空格内。</text><br><br>')
					API_ResponseWrite('<goodsHolder name="100"><br>')
					API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=4&2=1">兑换配方</a><br>')
					API_ResponseWrite('<br><a>取消</a><br>')
				end
			else
				API_ResponseWrite('<br><text>你的配方呢？请将需要兑换的配方放在下面的空格内。</text><br>')
				API_ResponseWrite('<goodsHolder name="100"><br>')
				API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=4&2=1">兑换配方</a><br>')
				API_ResponseWrite('<br><a>取消</a><br>')
			end
		end  
	elseif SelectItem == 5 then
		if XuanZheFangShi == 0 then
			API_ResponseWrite('<text>您可以随时拿高档勋章到我这里来兑换低一档的勋章，</text><text color="255,0,255">一个高档勋章可以兑换一个低一档的勋章</text><text>，请将要兑换的勋章放入下面的空格内。</text><br><br>')
			API_ResponseWrite('<goodsHolder name="100"><br>')
			API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=5&2=1">兑换勋章</a><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
		elseif XuanZheFangShi == 1 then
			local UidHigh = API_RequestGetNumber(100)--高位UID
			local UidLow = API_RequestGetNumber(1100)--低位UID
			local Uid = API_GetUID(UidHigh,UidLow) --获取UID	
			local BoxID,LocID = API_GetUIDGoodsInActor(Uid,ActorID)--背包ID 和 位置
			if BoxID == -1 or LocID == -1 then
				API_ResponseWrite('<text>您可以随时拿高档勋章到我这里来兑换低一档的勋章，</text><text color="255,0,255">一个高档勋章可以兑换一个低一档的勋章</text><text>，请将要兑换的勋章放入下面的空格内。</text><br><br>')
				API_ResponseWrite('<goodsHolder name="100"><br>')
				API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=5&2=1">兑换勋章</a><br>')
				API_ResponseWrite('<br><a>取消</a><br>')
				return
			end
			local GoodsID = API_GetUIDGoodsPropNum(Uid,0)--提交的物品ID
			if GoodsID > 0 then
				if XunZhangGaoToDi[GoodsID] ~= nil then
					local DuiHuanGoodsID = XunZhangGaoToDi[GoodsID]
					local Band = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,4)
					local DuiHuanNum = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,3)
					if API_ActorCanAddGoods(ActorID,DuiHuanGoodsID,DuiHuanNum,Band,0) ~= -1 then
						if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,DuiHuanNum,BoxID,LocID, '兑换勋章删除'..API_GetGoodsName(GoodsID)..'') then
							API_AddActorGoodsFlag(ActorID,DuiHuanGoodsID,DuiHuanNum,Band,'兑换勋章获得'..API_GetGoodsName(DuiHuanGoodsID)..'')
							API_ActorSendMsg(ActorID,0,'您用 '..DuiHuanNum..'枚 '..API_GetGoodsName(GoodsID)..' 兑换了  '..DuiHuanNum..'枚 '..API_GetGoodsName(DuiHuanGoodsID)..' ')
							API_ActorSendMsg(ActorID,7,'您用 '..DuiHuanNum..'枚 '..API_GetGoodsName(GoodsID)..' 兑换了  '..DuiHuanNum..'枚 '..API_GetGoodsName(DuiHuanGoodsID)..' ')
							API_ResponseWrite('<br><text>兑换成功，您获得：</text><img srcgd="'..DuiHuanGoodsID..'" tipgd="'..DuiHuanGoodsID..'"><text> × '..DuiHuanNum..'</text><br>')
							API_ResponseWrite('<br><text>如果要继续兑换低档的勋章，请将要兑换的高档勋章放入下面的空格内。</text><br><br>')
							API_ResponseWrite('<goodsHolder name="100"><br>')
							API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=5&2=1">继续兑换</a><br>')
							API_ResponseWrite('<br><a>关闭</a><br>')
						end
					end
				elseif GoodsID == 80298 or GoodsID == 80297 then
					API_ResponseWrite('<br><text color="255,0,0">你放入的勋章已经是最低档次的勋章了。</text><br>')
					API_ResponseWrite('<br><text>请将要兑换的高档勋章放入下面的空格内。</text><br><br>')
					API_ResponseWrite('<goodsHolder name="100"><br>')
					API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=5&2=1">兑换勋章</a><br>')
					API_ResponseWrite('<br><a>取消</a><br>')
				else
					API_ResponseWrite('<br><text>你的勋章呢？请将需要兑换的勋章放在下面的空格内。</text><br>')
					API_ResponseWrite('<goodsHolder name="100"><br>')
					API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=5&2=1">兑换勋章</a><br>')
					API_ResponseWrite('<br><a>取消</a><br>')
				end
			else
				API_ResponseWrite('<br><text>你的勋章呢？请将需要兑换的勋章放在下面的空格内。</text><br>')
				API_ResponseWrite('<goodsHolder name="100"><br>')
				API_ResponseWrite('<br><a href="NPCFunc_Yingdaozhe_Title?1=5&2=1">兑换勋章</a><br>')
				API_ResponseWrite('<br><a>取消</a><br>')
			end
		end
	end
end

-- --------
-- 点击NPC在房屋层之间穿梭
-- --------
function NPCFunc_ClickHouseChannel_Title(ActorID,NPCID)
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	
	API_ClickHouseChannelMonster(ActorID, FastID)

	API_ResponseClear()
	API_ResponseEnd()
end
