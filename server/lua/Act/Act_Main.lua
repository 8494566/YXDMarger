----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\ActMain.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-2-26
--版  本:	1.0
--描  述:	活动框架脚本
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-2-26
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------

GLOBAL_ActMain_OnLoginFuncNameList = {}
GLOBAL_ActMain_OnLogoutFuncNameList = {}
GLOBAL_ActMain_OnLoginMapFuncNameList = {}
GLOBAL_ActMain_OnLogoutMapFuncNameList = {}


-- ------------------------------------------------------------------------
-- 描述：交互数据加载成功后，初始化完后Main.lua会自动调用该函数
--  所有模块都需从这里开始初始化本模块相应部分
-- 参数：nTypeID, nServerID, nOwnerID分别为返回数据的类型信息
-- ------------------------------------------------------------------------
function ActMain_OnLogin(ActorID,TypeID,ServerID,OwnerID)
	for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
		local FunctionName = GLOBAL_ActMain_OnLoginFuncNameList[i] 
		if  type(FunctionName) == 'string' then	
			local Function = _G[FunctionName]
			if type(Function) == 'function' then
				Function()
			end
		end
	end 
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家退出场景时会自动调用这个函数
-- 每个模块都应该在这里结束, 并清理完自己模块的相应垃圾
-- ------------------------------------------------------------------------
function ActMain_OnLogout(ActorID)
	for i, v in pairs(GLOBAL_ActMain_OnLogoutFuncNameList) do 
		local FunctionName = GLOBAL_ActMain_OnLogoutFuncNameList[i] 
		if  type(FunctionName) == 'string' then	
			local Function = _G[FunctionName]
			if type(Function) == 'function' then
				Function()
			end
		end
	end 
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家切换地图后会自动调用此函数
-- ------------------------------------------------------------------------
function ActMain_OnLoginMap(ActorID)
	for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
		local FunctionName = GLOBAL_ActMain_OnLoginMapFuncNameList[i] 
		if  type(FunctionName) == 'string' then	
			local Function = _G[FunctionName]
			if type(Function) == 'function' then
				Function()
			end
		end
	end 
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家切换地图前框架会自动调用此函数
-- ------------------------------------------------------------------------
function ActMain_OnLogoutMap(ActorID)
	for i, v in pairs(GLOBAL_ActMain_OnLogoutMapFuncNameList) do 
		local FunctionName = GLOBAL_ActMain_OnLogoutMapFuncNameList[i] 
		if  type(FunctionName) == 'string' then	
			local Function = _G[FunctionName]
			if type(Function) == 'function' then
				Function()
			end
		end
	end 
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家升级时会自动调用此函数
-- ------------------------------------------------------------------------
function ActMain_OnUpgrade(ActorID)
	MerryChristmas_ClearVarData(ActorID)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家升级前会自动调用此函数判断是否允许升级
-- 1=是, 0=否
-- ------------------------------------------------------------------------
function ActMain_OnLevelUp(ActorID,ExploitL)
	return 1
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家学会英雄之后回调该函数
-- ------------------------------------------------------------------------
function ActMain_OnStudyHero(ActorID,HeroID)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家装配英雄后回调该函数
-- ------------------------------------------------------------------------
function ActMain_OnActivationHero(ActorID,HeroID,Index)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家进入离开队伍后的系统回调函数
-- ------------------------------------------------------------------------
function ActMain_OnTeamMemberCall(ActorID,TeamID,Type)
	FightForTreasureBox_OnTeamMemberCall(ActorID,TeamID,Type)
end

function ActMain_OnLoadIDataOK(TypeID,ServerID,OwnerID)
	
end

function ActMain_OnRelationLoad(ActorID)
end

function ActMain_OnNickNameLoad(ActorID)
end

function ActMain_OnTeamMemberOut(ActorID,TeamID)
	FightForTreasureBox_OnTeamMemberOut(ActorID,TeamID)
end

function ActMain_OnGotoConditionCall(ActorID,MapID,TileX,TileY)
	return 1
end

--活动脚本加载
require 'Scp\\LUA\\Act\\ShangxianSongli.lua'
require 'Scp\\LUA\\Act\\BOSSKuangHuan.lua'
require 'Scp\\LUA\\Act\\HuiZhangHuoDong.lua'
require 'Scp\\LUA\\Act\\ShuangBeiJiangLi.lua'
require 'Scp\\LUA\\Act\\TianJiangHengCai.lua'
require 'Scp\\LUA\\Act\\WanShengJie.lua'
require 'Scp\\LUA\\Act\\NewPlayEncouragement.lua'
require 'Scp\\LUA\\Act\\MerryChristmas.lua'
require 'Scp\\LUA\\Act\\SpringFestival.lua'
require 'Scp\\LUA\\Act\\FightForTreasureBox.lua'
require 'Scp\\LUA\\Act\\SearchTreasure.lua'
require 'Scp\\LUA\\Act\\LiXingHuoDong2.lua'
require 'Scp\\LUA\\Act\\JiNuQinXi.lua'
require 'Scp\\LUA\\Act\\VIPkey.lua'
require 'Scp\\LUA\\Act\\XingYunxing.lua'
require 'Scp\\LUA\\Act\\ZhiShiDaRen.lua'
require 'Scp\\LUA\\Act\\CaiBaoZhuhuodong.lua'
require 'Scp\\LUA\\Act\\MidAutumnDay.lua'
--require 'Scp\\LUA\\Act\\ZhongQiuDengMi.lua'
require 'Scp\\LUA\\Act\\ChristmasDay.lua'
require 'Scp\\LUA\\Act\\YunYingxuqiu_zadan.lua'
require 'Scp\\LUA\\Act\\HappyNewYear2010.lua'
require 'Scp\\LUA\\Act\\GongCeHuoDong.lua'
require 'Scp\\LUA\\Act\\UseLiBaoItem.lua'
require 'Scp\\LUA\\Act\\YunYingxuqiu_baobaozongdongyuan.lua'
require 'Scp\\LUA\\Act\\YunYing_LiBaoTeShi.lua'
require 'Scp\\LUA\\Act\\DuoBaoQiBing.lua'
require 'Scp\\LUA\\Act\\MysteriousPlace.lua'
require 'Scp\\LUA\\Act\\Goldtest_wb_title.lua'
require 'Scp\\LUA\\Act\\WanShengJie2010.lua'
require 'Scp\\LUA\\Act\\Christmas_ShenHanBingGong.lua'
--require 'Scp\\LUA\\Act\\Spring_DaNaoTianGong.lua'
require 'Scp\\LUA\\Act\\NewYearDefence.lua'
require 'Scp\\LUA\\Act\\LC_OnlineRongYuXunZhang.lua'
require 'Scp\\LUA\\Act\\LC_OnLineShuJiaHuoDong.lua'
require 'Scp\\LUA\\Act\\WYL_2011NationalDay.lua'
require 'Scp\\LUA\\Act\\LC_GuoQingQianDao.lua'
require 'Scp\\LUA\\Act\\LC_OnLogoutJiangLi.lua'
require 'Scp\\LUA\\Act\\LC_Christmas2011.lua'
require 'Scp\\LUA\\Act\\LC_NewYear2011.lua'
require 'Scp\\LUA\\Act\\LC_2012HeroWar.lua'
require 'Scp\\LUA\\Act\\LC_WuYiQianDao2012.lua'
require 'Scp\\LUA\\Act\\LC_WanShengJie2012.lua'
require 'Scp\\LUA\\Act\\HalloweenActivity.lua'
require 'Scp\\LUA\\Act\\HalloweenTimeChannel.lua'
require 'Scp\\LUA\\Act\\LC_YeYingShanGuHuoDong.lua'
require 'Scp\\LUA\\Act\\ZaiXianChouJiang.lua'
require 'Scp\\LUA\\Act\\BossJia.lua'
require 'Scp\\LUA\\Act\\BossJia1.lua'
require 'Scp\\LUA\\Act\\BossJia2.lua'
require 'Scp\\LUA\\Act\\BTfuwen.lua'
require 'Scp\\LUA\\Act\\BossJia3.lua'
require 'Scp\\LUA\\Act\\BossJia4.lua'
require 'Scp\\LUA\\Act\\BossJia5.lua'
require 'Scp\\LUA\\Act\\BossJia6.lua'
require 'Scp\\LUA\\Act\\BossJia7.lua'
require 'Scp\\LUA\\Act\\Shouhu1.lua'
require 'Scp\\LUA\\Act\\Shouhu2.lua'
require 'Scp\\LUA\\Act\\Shouhu3.lua'
require 'Scp\\LUA\\Act\\Shouhu4.lua'
require 'Scp\\LUA\\Act\\Shouhu5.lua'
require 'Scp\\LUA\\Act\\Sanjutou1.lua'
require 'Scp\\LUA\\Act\\Sanjutou2.lua'
require 'Scp\\LUA\\Act\\Sanjutou3.lua'
require 'Scp\\LUA\\Act\\Sishenboss.lua'
require 'Scp\\LUA\\Act\\Bingxue1.lua'
require 'Scp\\LUA\\Act\\Bingxue2.lua'
require 'Scp\\LUA\\Act\\Bingxue3.lua'
require 'Scp\\LUA\\Act\\Bingxue4.lua'
require 'Scp\\LUA\\Act\\Bingxue5.lua'
require 'Scp\\LUA\\Act\\Bingxue6.lua'
require 'Scp\\LUA\\Act\\Daozhudehuashen.lua'
require 'Scp\\LUA\\Act\\Bingjingnpc.lua'
require 'Scp\\LUA\\Act\\Jinkelanpc.lua'
require 'Scp\\LUA\\Act\\Kerwunpc.lua'
require 'Scp\\LUA\\Act\\BaoXiangZhengDuo.lua'
require 'Scp\\LUA\\Act\\BaoXiangZhengDuo1.lua'
require 'Scp\\LUA\\Act\\BaoXiangZhengDuo2.lua'
require 'Scp\\LUA\\Act\\QianDao.lua'
require 'Scp\\LUA\\Act\\WuPinDuiHuan.lua'