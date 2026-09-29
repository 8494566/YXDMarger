----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\OtherMain.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-2-27
--版  本:	1.0
--描  述:	其他脚本（物品使用等）
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-2-27
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------

if not API_IsEctypeServer() and not API_IsBranchServer() then
	if WYL_NewPlayer_XueYuanGongGao ~= nil then
		API_DestroyTriggerG(WYL_NewPlayer_XueYuanGongGao)
	end
	WYL_NewPlayer_XueYuanGongGao = API_CreateTimerTriggerG(0,0,60,-1,'WYL_NewPlayer_XueYuanGongGao_TimerTriggerGCallFunc')
end

function WYL_NewPlayer_XueYuanGongGao_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if math.mod(Minute,1) == 0 then
		API_ActorBroadcastMsgEx(79,-1,0,1,'若交通堵塞，请点右下角龙卷风图标传送')
		API_ActorBroadcastMsgEx(65,-1,0,1,'若交通堵塞，请点右下角龙卷风图标传送')
	end
end
-- ------------------------------------------------------------------------
-- 描述：交互数据加载成功后，初始化完后Main.lua会自动调用该函数
--  所有模块都需从这里开始初始化本模块相应部分
-- 参数：nTypeID, nServerID, nOwnerID分别为返回数据的类型信息
-- ------------------------------------------------------------------------
function OtherMain_OnLogin(ActorID, TypeID, ServerID, OwnerID)
	CuanSongFuWu_OnLogin()
	DianQuanHuanJinBi_OnLogin()
	MeiRiRW_TiShiJuanZhou()
	MeiRiRW_KeLingQuTask()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	if MapID == API_GetStaticMapID(MapID) then
		local MapConfigID = API_GetMapConfigID(MapID)
		if MapConfigID == 9 or MapConfigID == 10 or MapConfigID == 23 or MapConfigID == 25 or MapConfigID == 103 then
			local ServerID = API_GetServerID()
			if GLOBAL_Navigate_ServerID[ServerID] ~= nil then
				local ServerName = GLOBAL_Navigate_ServerID[ServerID].name
				API_ActorSendMsg(ActorID,6,'当前：'..ServerName..'')
			end
		end
	end
	if not API_IsEctypeServer() or API_IsBranchServer() then
		if API_VarDataGetNumber(ActorID,0,18368) == 1 then
			if API_GetActorExpLevel(ActorID) <= 10 or math.random(10) == 1 then
				API_ActorSendMsg(ActorID,17,'温馨提示：官方信息有背景色，请勿相信其他任何玩家发布的虚假消息。')
			end
		end
	end
	GMuseBLACKhouse_OnLogin()
	TaFuDeKuangJing_OnLogin(ActorID)
	MapRandomEvent_OnLogin()
	Post_OnLogin()
	EGuiDeDiXue_OnLogin(ActorID)
	--[[if Test_OnLogin then
		Test_OnLogin()
	end]]
	GWQHSJB_OnLogin(ActorID)
	OperationsReward_OnLogin()
	GongJiaoChe_OnLogin(ActorID)
	TSSR_OnLogin(ActorID)
	TouXianXiTong_OnLogin()
	ShuangBeiJingYan_OnLogin(ActorID)
	FriendKillMonster_OnLogin() 
	CPetTurned_OnLogin(ActorID)
	XiongDiHui_OnLogin(ActorID)
	BJXiongDiHui_OnLogin(ActorID)
	XiongDiHuiJiaoHu_OnLogin(ActorID)
	teacher_OnLogin(ActorID)
	--GatherTreasureMonster_MapPoin(ActorID)
	ZheKouShangRen_OnLogin(ActorID)
	NetbarActivities_OnLogin(ActorID) 
	FWXT_OnLogin(ActorID)
	MLB_OnLogin()
	SummeAmbassador_OnLogin()
	FreeUpdate_OnLogin()
	TianYuanShuiJing_OnLogin(ActorID)
	YueBingMuJu_OnLogin(ActorID)
	ShangXianLingJingYan_OnLogin()
	ZiLiaoPianLibao_OnLogin(ActorID)
	PetMagicRock_OnLogin(ActorID)
	ChristmasLibao_OnLogin(ActorID)
	HL_EggsOnLogin(ActorID)
	DuanWuJieHuoDong_OnLogin()
	HorHunter_OnLogin(ActorID)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家退出场景时会自动调用这个函数
-- 每个模块都应该在这里结束, 并清理完自己模块的相应垃圾
-- ------------------------------------------------------------------------
function OtherMain_OnLogout(ActorID)
	CuanSongFuWu_OnLogout()
	GMuseBLACKhouse_OnLogout()
	MapRandomEvent_OnLogout()
	TaFuDeKuangJing_OnLogout(ActorID)
	EGuiDeDiXue_OnLogout(ActorID)
	GongJiaoChe_OnLogout(ActorID)
	ShuangBeiJingYan_OnLogout(ActorID)
	--[[if Test_OnLogout then
		Test_OnLogout()
	end]]
	FriendKillMonster_OnLogout() 
	TSSR_OnLogout(ActorID)
	XiongDiHui_OnLogout(ActorID)
	BJXiongDiHui_OnLogout(ActorID)
	XiongDiHuiJiaoHu_OnLogout(ActorID)
	teacher_OnLogout(ActorID)
	ZheKouShangRen_OnLogout(ActorID)
	NetbarActivities_OnLogout(ActorID) 
	SummeAmbassador_OnLogout()
	ShangXianLingJingYan_OnLogout()
	ChristmasLibao_OnLogout()
	HL_EggsOnLoginOut(ActorID)
	DuanWuJieHuoDong_OnLogout()
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家切换地图后会自动调用此函数
-- ------------------------------------------------------------------------
function OtherMain_OnLoginMap(ActorID)
	CuanSongFuWu_OnLogin()
	MeiRiRW_KeLingQuTask()
	MapRandomEvent_OnLoginMap()
	Post_OnLogin()
	TaFuDeKuangJing_OnLoginMap(ActorID)
	EGuiDeDiXue_OnLoginMap(ActorID)
	--[[if Test_OnLoginMap then
		Test_OnLoginMap()
	end]]
	OperationsReward_OnLogin()
	GongJiaoChe_OnLoginMap(ActorID)
	TouXianXiTong_OnLoginMap()
	ShuangBeiJingYan_OnLogin(ActorID)
	FriendKillMonster_OnLoginMap() 
	CPetTurned_OnLoginMap(ActorID)
	TSSR_OnLoginMap(ActorID)
	XiongDiHui_OnLoginMap(ActorID)
	BJXiongDiHui_OnLoginMap(ActorID)
	XiongDiHuiJiaoHu_OnLoginMap(ActorID)
	teacher_OnLoginMap(ActorID)
	--GatherTreasureMonster_MapPoin(ActorID)
	ZheKouShangRen_OnLoginMap(ActorID)
	NetbarActivities_OnLogin(ActorID) 
	FWXT_OnLogin(ActorID)
	MLB_OnLogin()
	FreeUpdate_OnLoginMap()
	HL_EggsOnLoginMap(ActorID)
	DuanWuJieHuoDong_OnLoginMap()
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家切换地图前框架会自动调用此函数
-- ------------------------------------------------------------------------
function OtherMain_OnLogoutMap(ActorID)
	CuanSongFuWu_OnLogout()
	MapRandomEvent_OnLogoutMap()
	TaFuDeKuangJing_OnLogoutMap(ActorID)
	EGuiDeDiXue_OnLogoutMap(ActorID)
	ShuangBeiJingYan_OnLogout(ActorID)
	FriendKillMonster_OnLogoutMap()
	TSSR_OnLogoutMap(ActorID)
	XiongDiHui_OnLogoutMap(ActorID)
	BJXiongDiHui_OnLogoutMap(ActorID)
	XiongDiHuiJiaoHu_OnLogoutMap(ActorID)
	teacher_OnLogoutMap(ActorID)
	ZheKouShangRen_OnLogoutMap(ActorID)
	NetbarActivities_OnLogout(ActorID) 
	DuanWuJieHuoDong_OnLogoutMap()
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家升级时会自动调用此函数
-- ------------------------------------------------------------------------
function OtherMain_OnUpgrade(ActorID)
	--Tip_OnUpgrade(ActorID)
	API_VarDataSetNumber(ActorID,1,18140,0)
	GongJiaoChe_JiHuoByLV(ActorID)
	teacher_jiaodaojifenpanding(ActorID) --师徒系统 徒弟升级 积分增加
	XiongDiHui_OnUpgrade(ActorID)
	HeroTower_GiveInvitation(ActorID)
--	for i = 18301,18311 do
--		API_VarDataSetNumber(ActorID,1,i,0)
--	end
	FreeUpdate_OnUpgrade(ActorID)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家升级前会自动调用此函数判断是否允许升级
-- ------------------------------------------------------------------------
function OtherMain_OnLevelUp(ActorID,ExploitL)
	if VerdictLevelUpQualification(ActorID,ExploitL) == 1 then
		return 1
	else
		return 0
	end
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家学会英雄之后回调该函数
-- ------------------------------------------------------------------------
function OtherMain_OnStudyHero(ActorID,HeroID,lHasLearned)
	HeroSkillxuexichengg(ActorID,HeroID,lHasLearned)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家装配英雄后回调该函数
-- ------------------------------------------------------------------------
function OtherMain_OnActivationHero(ActorID,HeroID,Index)
	--teacher_miling_zhuangb2hero(ActorID)
	g_EventSystem:FireAction(ActorID,Index, _EVENT_ID_EQUIP_HERO, _E_SRC_TYPE_HERO,HeroID)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家进入离开队伍后的系统回调函数
-- ------------------------------------------------------------------------
function OtherMain_OnTeamMemberCall(ActorID,TeamID,Type)
	FriendKillMonster_OnTeamMemberCall(ActorID,TeamID,Type)
	teacher_buffdelete(ActorID) 
	teacher_shuxingtianjia(TeamID)
end

function OtherMain_OnLoadIDataOK(TypeID,ServerID,OwnerID)
end

function OtherMain_OnRelationLoad(ActorID)
	Marriage_OnLogin(ActorID)
end


function OtherMain_OnNickNameLoad(ActorID)
end

function OtherMain_OnTeamMemberOut(ActorID,TeamID)
	FriendKillMonster_OutTeam(ActorID,TeamID)
end

function OtherMain_OnGotoConditionCall(ActorID,MapID,TileX,TileY)
	return 1
end

--脚本加载
require 'Scp\\LUA\\RandTop\\RandTop_Main.lua'
require 'Scp\\LUA\\Other\\ExpCriterion.lua'
require 'Scp\\LUA\\Other\\MoneyCriterion.lua'
require 'Scp\\LUA\\Other\\MoraleCriterion.lua'
require 'Scp\\LUA\\Other\\PrestigeCriterion.lua'
require 'Scp\\LUA\\Other\\ConsumeCriterion.lua'
require 'Scp\\LUA\\Other\\ChunnelVerdict.lua'
require 'Scp\\LUA\\Other\\CuanSongFuWu.lua'
require 'Scp\\LUA\\Other\\PeerageLevelup.lua'
require 'Scp\\LUA\\Other\\Jinlinbaohe.lua'
--require 'Scp\\LUA\\Other\\Test.lua'
require 'Scp\\LUA\\Other\\SkillGoods.lua'
require 'Scp\\LUA\\Other\\BuJiXiang.lua'
require 'Scp\\LUA\\Other\\BaoXiang.lua'
require 'Scp\\LUA\\Other\\SellItem.lua'
require 'Scp\\LUA\\Other\\GoodsPackage.lua'
require 'Scp\\LUA\\Other\\JingZhuan.lua'
require 'Scp\\LUA\\Other\\DianQuanHuanJinBi.lua'
require 'Scp\\LUA\\Other\\GongXunMiHan.lua'
require 'Scp\\LUA\\Other\\JieHun.lua'
require 'Scp\\LUA\\Other\\MeiRiRW.lua'
require 'Scp\\LUA\\Other\\FengXiangBiao.lua'
require 'Scp\\LUA\\Other\\GMUseBlackHouse.lua'
require 'Scp\\LUA\\Other\\PaiHangBang.lua'
require 'Scp\\LUA\\Other\\PHB_gerenzhanliphb.lua'
require 'Scp\\LUA\\Other\\PHB_gerenjinqianphb.lua'
require 'Scp\\LUA\\Other\\PHB_ybtrenqiphb.lua'
require 'Scp\\LUA\\Other\\PHB_xiongdihuiphb.lua'
require 'Scp\\LUA\\Other\\TaskCaijiwupinshuaxin.lua'
require 'Scp\\LUA\\Other\\SearchResource.lua'
require 'Scp\\LUA\\Other\\TaFuDeKuangJing.lua'
require 'Scp\\LUA\\Other\\MapRandomEvent.lua'
require 'Scp\\LUA\\Other\\MapRandomEventConfig.lua'
require 'Scp\\LUA\\Other\\Post.lua'
require 'Scp\\LUA\\Other\\OperationsReward.lua'
require 'Scp\\LUA\\Other\\GWQHSJB.lua'
require 'Scp\\LUA\\Other\\EGuiDeDiXue.lua'
require 'Scp\\LUA\\Other\\JingYueCheng.lua'
require 'Scp\\LUA\\Other\\GongJiaoChe_ZiDongXunLu.lua'
require 'Scp\\LUA\\Other\\SellShiZhuang.lua'
require 'Scp\\LUA\\Other\\TouXianXiTong.lua'
require 'Scp\\LUA\\Other\\QQTeQuan.lua'
require 'Scp\\LUA\\Other\\ShuangBeiJingYan.lua'
require 'Scp\\LUA\\Other\\YunYing_LingJiangNPC.lua'
require 'Scp\\LUA\\Other\\CSSJBSR_DianQuanGouMai.lua'
require 'Scp\\LUA\\Other\\XiongDiHui.lua'
require 'Scp\\LUA\\Other\\WorldBoss.lua'
require 'Scp\\LUA\\Other\\Fuzhangbaoshixiangqian.lua'
require 'Scp\\LUA\\Other\\Teacher.lua'
require 'Scp\\LUA\\Other\\FriendKillMonster.lua'
require 'Scp\\LUA\\Other\\PetTurned.lua'
require 'Scp\\LUA\\Other\\SkillUpdateCost.lua'
--require 'Scp\\LUA\\Other\\GatherTreasureMonster.lua'
require 'Scp\\LUA\\Other\\ZaiJuCanUseMap.lua'
require 'Scp\\LUA\\Other\\WorldKingBoss.lua'
require 'Scp\\LUA\\Other\\WorldMonster.lua'
require 'Scp\\LUA\\Other\\WorldSpaceTimeForDoor.lua'
require 'Scp\\LUA\\Other\\XiongDiHuiJiaoHu.lua'
require 'Scp\\LUA\\Other\\XDH_BoJueZhengDuo.lua'
require 'Scp\\LUA\\Other\\ShengDanYuanDan.lua'
require 'Scp\\LUA\\Other\\UI_shanyaokongzhi.lua'
require 'Scp\\LUA\\Other\\NetbarActivities.lua'
--require 'Scp\\LUA\\Other\\DiaoYuGongNeng.lua'
require 'Scp\\LUA\\Other\\FuWenXiTong.lua'
require 'Scp\\LUA\\Other\\TowerofHeroes.lua'
require 'Scp\\LUA\\Other\\MeiLaoBanList.lua'
require 'Scp\\LUA\\Other\\PHB_jifensaiphb.lua'
require 'Scp\\LUA\\Other\\PHB_taotaisaiphb.lua'
require 'Scp\\LUA\\Other\\JingYueCheng_Mirror.lua'
require 'Scp\\LUA\\Other\\ChengHaoKaPian.lua'
require 'Scp\\LUA\\Other\\YunYing_SummeRevelryrParty.lua'
require 'Scp\\LUA\\Other\\FreeUpdate.lua'
require 'Scp\\LUA\\Other\\YunYing_QiXiHuanJing.lua'
require 'Scp\\Lua\\Other\\YunYing_ZhongQiuHuoDong2010.lua'
require 'Scp\\Lua\\Other\\ShangXianLingJingYan.lua'
require 'Scp\\Lua\\Other\\ZiLiaoPianDaLiBao.lua'
require 'Scp\\Lua\\Other\\NanGuaDai.lua'
require 'Scp\\Lua\\Other\\PetMagicRock.lua'
require 'Scp\\Lua\\Other\\Christmas_Yao.lua'
require 'Scp\\Lua\\Other\\ChristmasParty.lua'
require 'Scp\\Lua\\Other\\ZhiZheDaTi.lua'
require 'Scp\\Lua\\Other\\2010NewYearHuoDong.lua'
require 'Scp\\Lua\\Other\\ArmShineStone.lua'
require 'Scp\\Lua\\Other\\ChristmasAndNewYearsDay.lua'
require 'Scp\\Lua\\Other\\NewDragonBall.lua'
require 'Scp\\Lua\\Other\\TW_DuanWuJieHuoDong.lua'
require 'Scp\\Lua\\Other\\Horcruxes.lua'
require 'Scp\\Lua\\Other\\LC_DataLoading.lua'
require 'Scp\\Lua\\Other\\LC_JiNuJinKuang.lua'
require 'Scp\\Lua\\Other\\LC_DiaoYuDao.lua'
require 'Scp\\Lua\\Other\\CanUseGoods.lua'
require 'Scp\\Lua\\Other\\BossLunHuan.lua'
require 'Scp\\Lua\\Other\\BossShuaXinBiao.lua'
require 'Scp\\Lua\\Other\\DuShen.lua'
require 'Scp\\Lua\\Other\\WangZhiCaiBao.lua'
require 'Scp\\Lua\\Other\\GuXianLu.lua'
require 'Scp\\Lua\\Other\\ShengShouShouHu.lua'
require 'Scp\\Lua\\Other\\GongFengShenQi.lua'
