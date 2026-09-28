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
		local ServerID = API_GetServerID()
		if GLOBAL_Navigate_ServerID[ServerID] ~= nil then
			local ServerName = GLOBAL_Navigate_ServerID[ServerID].name
			API_ActorSendMsg(ActorID,6,'当前：'..ServerName..'')
		end
	end
	if not API_IsEctypeServer() then
		API_ActorSendMsg(ActorID,17,'温馨提示：官方信息有背景色，请勿相信其他任何玩家发布的虚假消息。')
		API_ActorSendMsg(ActorID,17,'英雄岛唯一官网： yxd.21mmo.com 其他假冒网站都是为盗号而存在，请小心！')
	end
	GMuseBLACKhouse_OnLogin()
	--[[if Test_OnLogin then
		Test_OnLogin()
	end]]
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家退出场景时会自动调用这个函数
-- 每个模块都应该在这里结束, 并清理完自己模块的相应垃圾
-- ------------------------------------------------------------------------
function OtherMain_OnLogout(ActorID)
	CuanSongFuWu_OnLogout()
	GMuseBLACKhouse_OnLogout()
	--[[if Test_OnLogout then
		Test_OnLogout()
	end]]
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家切换地图后会自动调用此函数
-- ------------------------------------------------------------------------
function OtherMain_OnLoginMap(ActorID)
	CuanSongFuWu_OnLogin()
	MeiRiRW_KeLingQuTask()
	--[[if Test_OnLoginMap then
		Test_OnLoginMap()
	end]]
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家切换地图前框架会自动调用此函数
-- ------------------------------------------------------------------------
function OtherMain_OnLogoutMap(ActorID)
	CuanSongFuWu_OnLogout()
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家升级时会自动调用此函数
-- ------------------------------------------------------------------------
function OtherMain_OnUpgrade(ActorID)
	--Tip_OnUpgrade(ActorID)
	API_VarDataSetNumber(ActorID,1,18140,0)
--	for i = 18301,18311 do
--		API_VarDataSetNumber(ActorID,1,i,0)
--	end
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
function OtherMain_OnStudyHero(ActorID,HeroID)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家装配英雄后回调该函数
-- ------------------------------------------------------------------------
function OtherMain_OnActivationHero(ActorID,HeroID,Index)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家进入离开队伍后的系统回调函数
-- ------------------------------------------------------------------------
function OtherMain_OnTeamMemberCall(ActorID,TeamID,Type)
end

function OtherMain_OnLoadIDataOK(TypeID,ServerID,OwnerID)
end

function OtherMain_OnRelationLoad(ActorID)
	Marriage_OnLogin(ActorID)
end

function OtherMain_OnTeamMemberOut(ActorID,TeamID)
end

function OtherMain_OnGotoConditionCall(ActorID,MapID,TileX,TileY)
	return 1
end

--脚本加载
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
--require 'Scp\\LUA\\Other\\TaskCaijiwupinshuaxin.lua'
