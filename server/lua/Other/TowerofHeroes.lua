----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\TowerofHeroes.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2010-3-18
--版  本:	1.0
--描  述:	英雄之塔
--应  用:  

----------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------
--作者：万钰林
--日期：2010/3/18
--功能：创建
---------------------------------------------------------------------
--Tower of Heroes
--[[

入口NPCID  12255

指定某个玩家为队长
local ActorID = API_RequestGetActorID() 
API_SetCaptain(ActorID

local ActorID = API_RequestGetActorID() 
local MapID = API_CreateEctype(2021,0) 
API_ActorGoToMap(ActorID,MapID,79,29)

local ActorID = API_RequestGetActorID() 
local MapID = API_CreateEctype(2022,0) 
API_ActorGoToMap(ActorID,MapID,69,36)

创建怪物，按顺序存入表中，不同顺序的怪物走路路径不同，创建时间触发器，在时间触发器里面控制怪物走路的时间。
刷新点和走路的点，每个格子大约1秒，计算好走路的格子数量

创建怪物时，将对应的路径存到以地图id为上下，怪物id为下标的临时表里

时间触发器传入怪物id和monsterid，如果怪物不存在，删掉触发器，如果通过怪物id获得的地图副本不存在，则删掉触发器
在时间触发器里面控制当前地图怪物走路路径，路径通过临时表读取，
怪物表见表内具体配置，如果要加怪物，则增加一行，路径随意配置，但必须是真实存在的点

怪物具体路径见 HeroTowerMapGame

local ActorID = API_RequestGetActorID() 
local PlayMapID = API_GetActorMapID(ActorID) 
local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID) 
FastID = API_CreateMonster(PlayMapID,839855,PlayX,PlayY,4,2420,-1) 
API_MonsterAddStatus(FastID, math.random(927001,927012), 0) 
API_MonsterAddStatus(FastID, 933001, 0) 
API_ResponseEnd() 
API_ResponseClear() 

]]


--~ 点击NPC -> 判断进入条件 -> 是否队长、角色级别、英雄级别、队伍人数、门票 -> 选择第一关还是第N关开始 -> 扣除队长门票 -> 
--~ 创建副本 -> 创建地图所需的表（怪物fast表） -> 创建怪物及其行为触发器、时间触发器（考虑加入怪物伤害触发器、怪物主动进攻玩家，怪物初始无敌&不能移动N秒） -> 循环传入玩家

--12741 进入塔的年月日
--12742 当天进入塔的次数
--12743 记录复活次数
--12744 记录玩家最高打过多少层
--12745 存储是否要给邀请函
--12746 存储什么时候通过邮箱给过邀请函os.time
--12747 存储玩家当前杀了几个BOSS和小怪  小怪x100 + BOSS

--存地图内怪物fastid
if HeroTowerMapTable == nil then
	HeroTowerMapTable = {}
end
--怪物掉落7品质装备表
if HeroTowerMapDropNum == nil then
	HeroTowerMapDropNum = {}
end
--排名
if HeroTowerRank == nil then
	HeroTowerRank = {}
end
if HeroTowerPlayRank == nil then
	HeroTowerPlayRank = {}
end
--下一层的门
if HeroTowerDoorTab == nil then
	HeroTowerDoorTab = {}
end

HeroTowerMapconfigID = {2022,}

HeroTowerMapID = {
	--层次，对应地图ID，下一层地图ID，进入时坐标
	[1] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[2] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[3] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[4] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[5] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[6] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[7] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[8] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[9] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[10] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[11] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[12] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[13] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[14] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[15] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[16] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[17] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[18] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[19] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[20] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[21] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[22] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[23] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[24] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[25] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[26] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[27] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[28] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[29] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
	[30] = {MapID=2022,NextMapID=2022,InX=65,InY=34,},
}

HeroTower_DoorTile = {
	[2022] = {
		--{12265,60,86,5,},
		--{12265,61,86,5,},
		--{12265,62,86,5,},
		{12265,63,86,5,},
		--{12265,64,86,5,},
		--{12265,65,86,5,},
		},
}

HeroTower_BossDieDropGoods = {
	[5] = {
		[1] = {
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			},
		[2] = {
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			},
		[3] = {
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80409,GoodsNum=1,GaiLv=200000,PinZhi=0,Bind=1,},
			{GoodsID=80405,GoodsNum=1,GaiLv=200000,PinZhi=0,Bind=1,},
			{GoodsID=80951,GoodsNum=1,GaiLv=150000,PinZhi=0,Bind=0,},
			},
		},
	[10] = {
		[1] = {
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			},
		[2] = {
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			},
		[3] = {
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80405,GoodsNum=1,GaiLv=400000,PinZhi=0,Bind=1,},
			{GoodsID=80409,GoodsNum=1,GaiLv=400000,PinZhi=0,Bind=1,},
			{GoodsID=80951,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
			},
		},
	[15] = {
		[1] = {
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			},
		[2] = {
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			},
		[3] = {
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80405,GoodsNum=1,GaiLv=600000,PinZhi=0,Bind=1,},
			{GoodsID=80409,GoodsNum=1,GaiLv=600000,PinZhi=0,Bind=1,},
			{GoodsID=80951,GoodsNum=1,GaiLv=450000,PinZhi=0,Bind=0,},
			},
		},
	[20] = {
		[1] = {
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			},
		[2] = {
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			},
		[3] = {
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80405,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80388,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80409,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=1,GoodsNum=1,GaiLv=400000,PinZhi=7,GoodsTab={4003,5003,6003,},Bind=1,},
			{GoodsID=80951,GoodsNum=1,GaiLv=600000,PinZhi=0,Bind=0,},
			{GoodsID=80952,GoodsNum=1,GaiLv=450000,PinZhi=0,Bind=0,},
			},
		},
	[25] = {
		[1] = {
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			},
		[2] = {
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			},
		[3] = {
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80405,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80388,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80409,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=2,GoodsNum=1,GaiLv=400000,PinZhi=7,GoodsTab={4103,5103,6103,},Bind=1,},
			{GoodsID=80951,GoodsNum=1,GaiLv=750000,PinZhi=0,Bind=0,},
			{GoodsID=80952,GoodsNum=1,GaiLv=600000,PinZhi=0,Bind=0,},
			},
		},
	[30] = {
		[1] = {
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=50,GaiLv=1000000,PinZhi=0},
			},
		[2] = {
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			},
		[3] = {
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80405,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80388,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=80409,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=1,},
			{GoodsID=2,GoodsNum=1,GaiLv=400000,PinZhi=7,GoodsTab={4103,5103,6103,},Bind=1,},
			{GoodsID=80951,GoodsNum=1,GaiLv=750000,PinZhi=0,Bind=0,},
			{GoodsID=80952,GoodsNum=1,GaiLv=600000,PinZhi=0,Bind=0,},
			},
		},
}

HeroTower_BossDieGiveGoods = {
	[5] = {
		{GoodsID=80384,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80401,GoodsNum=1,GaiLv=200000,PinZhi=0},
		},
	[10] = {
		{GoodsID=80384,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80401,GoodsNum=1,GaiLv=200000,PinZhi=0},
		{GoodsID=80388,GoodsNum=1,GaiLv=200000,PinZhi=0},
		},
	[15] = {
		{GoodsID=80384,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80409,GoodsNum=1,GaiLv=200000,PinZhi=0},
		},
	[20] = {
		{GoodsID=80384,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80388,GoodsNum=1,GaiLv=200000,PinZhi=0},
		{GoodsID=80409,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=1,GoodsNum=1,GaiLv=400000,PinZhi=7,GoodsTab={4003,5003,6003,},},
		},
	[25] = {
		{GoodsID=80384,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80401,GoodsNum=1,GaiLv=200000,PinZhi=0},
		{GoodsID=80388,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80409,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=2,GoodsNum=1,GaiLv=400000,PinZhi=7,GoodsTab={4103,5103,6103,},},
		},
	[30] = {
		{GoodsID=80384,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80401,GoodsNum=1,GaiLv=200000,PinZhi=0},
		{GoodsID=80388,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=80409,GoodsNum=1,GaiLv=400000,PinZhi=0},
		{GoodsID=2,GoodsNum=1,GaiLv=400000,PinZhi=7,GoodsTab={4103,5103,6103,},},
		},
}

HeroTower_OtherCDTime = {
	[8] = {MaxNum=1,CDmin=1,CDmax=300,},
	[9] = {MaxNum=1,CDmin=1,CDmax=300,},
	[10] = {MaxNum=1,CDmin=1,CDmax=300,},
	[11] = {MaxNum=1,CDmin=1,CDmax=300,},
	[12] = {MaxNum=1,CDmin=1,CDmax=300,},
	[13] = {MaxNum=4,CDmin=45,CDmax=60,},
	[14] = {MaxNum=4,CDmin=45,CDmax=60,},
	[15] = {MaxNum=4,CDmin=45,CDmax=60,},
	[16] = {MaxNum=5,CDmin=1,CDmax=180,},
	[17] = {MaxNum=5,CDmin=1,CDmax=180,},
	[18] = {MaxNum=5,CDmin=1,CDmax=180,},
	[19] = {MaxNum=8,CDmin=45,CDmax=60,},
	[20] = {MaxNum=8,CDmin=45,CDmax=60,},
	[21] = {MaxNum=8,CDmin=45,CDmax=60,},
	[22] = {MaxNum=9,CDmin=45,CDmax=60,},
	[23] = {MaxNum=9,CDmin=45,CDmax=60,},
}

HeroTower_PlayMapReward = {
[	40	] = 	123155	,
[	41	] = 	332107	,
[	42	] = 	363344	,
[	43	] = 	395974	,
[	44	] = 	429998	,
[	45	] = 	465415	,
[	46	] = 	502225	,
[	47	] = 	540429	,
[	48	] = 	580027	,
[	49	] = 	621018	,
[	50	] = 	777782	,
[	51	] = 	802483	,
[	52	] = 	865437	,
[	53	] = 	930714	,
[	54	] = 	998314	,
[	55	] = 	1169012	,
[	56	] = 	1401421	,
[	57	] = 	1516083	,
[	58	] = 	1634992	,
[	59	] = 	1758147	,
[	60	] = 	1885549	,
[	61	] = 	2017198	,
[	62	] = 	2153093	,
[	63	] = 	2293235	,
[	64	] = 	2437624	,
[	65	] = 	3032167	,
}

HeroTower_ExchangeReward = {
	[1] = {Name='普通升级魔晶',NeedNum=1,GoodsID=80382,GoodsTab={},},
	[2] = {Name='普通合成魔晶',NeedNum=1,GoodsID=80384,GoodsTab={},},
	[3] = {Name='普通点化魔晶',NeedNum=3,GoodsID=80409,GoodsTab={},},
	[4] = {Name='四档高附加属性物理装备',NeedNum=15,GoodsID=0,GoodsTab={4003,4103,6603,6903,8103,4303,4203,4403,4503,2003,3003,3903,},},
	[5] = {Name='四档高附加属性火药装备',NeedNum=15,GoodsID=0,GoodsTab={5003,5103,6703,7003,8203,5303,5203,5403,5503,1503,},},
	[6] = {Name='四档高附加属性魔法装备',NeedNum=15,GoodsID=0,GoodsTab={6003,6103,6803,8003,8303,6303,6203,6403,6503,1003},},
}

--每层对应的玩法表
--第一层是层次序号，下一级是随机的玩法表，可任意添加N个玩法，玩法主要以怪物路径及英雄AI为主，后期需添加建筑或刷兵器，可重新配置成战争地图和添加参数，目前只是普通副本
HeroTowerMapGame = {
	[1] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			--DoorID=726461,DoorX=64,DoorY=84,DoorD=5,
			--循环这个表里面的内容，创建怪物，并且将怪物fastID插入已动态地图ID为下标的表中 HeroTowerMapTable[mapid] = {}，fastID表下存每个怪物的路径
			--MonID:怪物ID，x&y:怪物初始坐标，Time:时间触发器触发间隔时间，PosNum:行走步数，Path:路径表，ShowID:外观状态ID,AI:怪物AI,Buff:嘲讽状态id（主要配置不同的怪物群体）
			--如果行走步数为0，则不需要行走，是固定位置
			MonTab = {
				{MonID=839841,x=60,y=77,d=4,Time=15,PosNum=3,Path={53,68,1,60,59,1,60,77,1,},ShowID={927009,},AI={2415,},Name={'风暴拉尔',},Buff={909001,911001,},},
				{MonID=839841,x=65,y=77,d=4,Time=15,PosNum=3,Path={75,68,1,66,59,1,65,77,1,},ShowID={927005,},AI={2415,},Name={'飙风赫尔',},Buff={909001,911001,},},
				},
			},
		[2] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=839841,x=60,y=77,d=4,Time=15,PosNum=3,Path={53,68,1,60,59,1,60,77,1,},ShowID={927009,},AI={2415,},Name={'风暴拉尔',},Buff={909001,911001,},},
				{MonID=840041,x=63,y=77,d=4,Time=15,PosNum=3,Path={63,68,1,63,59,1,63,77,1,},ShowID={929004,},AI={2442,},Name={'疾风吉尔',},Buff={909001,911001,},},
				{MonID=839841,x=65,y=77,d=4,Time=15,PosNum=3,Path={75,68,1,66,59,1,65,77,1,},ShowID={927005,},AI={2415,},Name={'飙风赫尔',},Buff={909001,911001,},},
				},
			},
		},
	[2] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=839842,x=54,y=69,d=4,Time=13,PosNum=4,Path={63,59,1,72,69,1,63,78,1,54,69,1,},ShowID={927014,},AI={2418,},Name={'剑魂巴顿',},Buff={909001,911001,},},
				{MonID=839842,x=72,y=69,d=4,Time=13,PosNum=4,Path={63,78,1,54,69,1,63,59,1,72,69,1,},ShowID={927018,},AI={2423,},Name={'狂野露娜',},Buff={909001,911001,},},
				{MonID=841042,x=63,y=78,d=4,Time=12,PosNum=4,Path={63,68,1,63,59,1,63,68,1,63,78,1,},ShowID={928007,},AI={2437,},Name={'梦幻莉莉',},Buff={909001,911001,},},
				},
			},
--~ 		[2] = {
--~ 			GoID=12256,GoX=44,GoY=107,GoD=3,
--~ 			OutID=11607,OutX=72,OutY=32,OutD=3,
--~ 			MonTab = {
--~ 				{MonID=839842,x=54,y=69,d=4,Time=13,PosNum=4,Path={63,59,1,72,69,1,63,78,1,54,69,1,},ShowID={927014,},AI={2418,},Name={'剑魂巴顿',},Buff={909001,911001,},},
--~ 				{MonID=839842,x=72,y=69,d=4,Time=13,PosNum=4,Path={63,78,1,54,69,1,63,59,1,72,69,1,},ShowID={927018,},AI={2423,},Name={'狂野露娜',},Buff={909001,911001,},},
--~ 				{MonID=841042,x=63,y=78,d=4,Time=12,PosNum=4,Path={63,68,1,63,59,1,63,68,1,63,78,1,},ShowID={928007,},AI={2437,},Name={'梦幻莉莉',},Buff={909001,911001,},},
--~ 				},
--~ 			},
		},
	[3] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=839843,x=60,y=77,d=4,Time=12,PosNum=3,Path={60,59,1,53,68,1,60,77,1,},ShowID={927003,},AI={2419,},Name={'武徒强森',},Buff={909001,911001,},},
				{MonID=840043,x=63,y=77,d=4,Time=15,PosNum=4,Path={57,68,1,63,60,1,71,68,1,63,77,1},ShowID={927004,},AI={2417,},Name={'圣徒巴赫',},Buff={909001,911001,},},
				{MonID=839843,x=65,y=77,d=4,Time=12,PosNum=3,Path={66,59,1,75,68,1,65,77,1,},ShowID={927001,},AI={2422,},Name={'狂徒沃夫',},Buff={909001,911001,},},
				},
			},
		},
	[4] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=841044,x=60,y=78,d=5,Time=20,PosNum=0,Path={53,67,1,},ShowID={928001,},AI={2432,},Name={'瞬杀星眸',},Buff={909001,911001,},},
				{MonID=840044,x=67,y=78,d=5,Time=20,PosNum=0,Path={63,67,1,},ShowID={929005,},AI={2446,},Name={'冰女傲雪',},Buff={909001,911001,},},
				{MonID=839844,x=62,y=76,d=4,Time=10,PosNum=2,Path={62,59,1,62,77,1,},ShowID={927012,},AI={2424,},Name={'无影沙龙',},Buff={909001,911001,},},
				{MonID=839844,x=65,y=76,d=4,Time=10,PosNum=2,Path={65,59,1,65,77,1,},ShowID={927010,},AI={2416,},Name={'闪耀娜娜',},Buff={909001,911001,},},
				},
			},
		},
	[5] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				--BOSS
				{MonID=843045,x=62,y=67,d=5,Time=20,PosNum=0,Path={53,61,1,},ShowID={935024,},AI={2488,},Name={'冰魔-B.X',},Buff={909001,911001,824001,92001,},DieFunc=1,},
				
				{MonID=839845,x=58,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,},ShowID={927009,},AI={2417,},Name={'冰魔使徒',},Buff={909001,911001,},},
				{MonID=839845,x=66,y=68,d=5,Time=20,PosNum=0,Path={63,61,1,},ShowID={927009,},AI={2418,},Name={'冰魔使徒',},Buff={909001,911001,},},
				
				--{MonID=841045,x=62,y=70,d=4,Time=10,PosNum=2,Path={62,53,1,62,70,1,},ShowID={928005,},AI={2435,},Name={'冰魔使徒',},Buff={909001,911001,},},
				--{MonID=840045,x=65,y=70,d=4,Time=13,PosNum=2,Path={65,53,1,65,70,1,},ShowID={929003,},AI={2445,},Name={'冰魔使徒',},Buff={909001,911001,},},
				},
			},
		},
	[6] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=840046,x=60,y=77,d=4,Time=13,PosNum=3,Path={60,68,1,60,59,1,60,77,1,},ShowID={929003,},AI={2448,},Name={'魔灵法痴',},Buff={909001,911001,},},
				{MonID=840046,x=63,y=77,d=4,Time=13,PosNum=3,Path={63,68,1,63,59,1,63,77,1,},ShowID={929006,},AI={2471,},Name={'冰火二重奏',},Buff={909001,911001,},},
				{MonID=841045,x=65,y=77,d=4,Time=15,PosNum=3,Path={65,68,1,65,59,1,65,77,1,},ShowID={935014,},AI={2472,},Name={'不怕死的潘多拉',},Buff={909001,911001,},},
				},
			},
		},
	[7] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=840047,x=59,y=75,d=4,Time=21,PosNum=5,Path={59,67,2,65,67,2,65,60,2,59,60,2,59,75,2},ShowID={929008,},AI={2443,},Name={'黑帝萨尔',},Buff={909001,911001,},},
				{MonID=840047,x=65,y=75,d=4,Time=21,PosNum=5,Path={65,69,2,59,69,2,59,60,2,65,60,2,65,75,2},ShowID={929010,},AI={2476,},Name={'冰雷克莱尔',},Buff={909001,911001,},},
				{MonID=839847,x=62,y=74,d=4,Time=16,PosNum=3,Path={62,68,3,62,62,5,62,74,3,},ShowID={935002,},AI={2453,},Name={'波罗丁',},Buff={909001,911001,},},
				},
			},
		},
	[8] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=840048,x=58,y=77,d=4,Time=18,PosNum=3,Path={58,69,2,58,59,3,58,77,2,},ShowID={929007,},AI={2447,},Name={'叹息女王蕾丝',},Buff={909001,911001,},},
				{MonID=840048,x=66,y=76,d=4,Time=20,PosNum=3,Path={66,69,3,66,59,2,66,76,2,},ShowID={935012,},AI={2475,},Name={'弱弱的贾斯丁',},Buff={909001,911001,},},
				{MonID=839848,x=62,y=75,d=4,Time=11,PosNum=3,Path={62,69,2,62,59,1,62,75,2,},ShowID={927015,},AI={2483,},Name={'冰沙-肯',},Buff={909001,911001,},},
				},
			},
		},
	[9] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=840049,x=61,y=78,d=4,Time=21,PosNum=5,Path={61,72,2,61,64,2,61,60,3,61,68,2,61,78,2,},ShowID={929009,},AI={2440,},Name={'龙女天天',},Buff={909001,911001,},},
				{MonID=840049,x=63,y=78,d=4,Time=21,PosNum=5,Path={63,72,2,63,64,2,63,60,3,63,68,2,63,78,2},ShowID={935013,},AI={2441,},Name={'毒王贝贝',},Buff={909001,911001,},},
				{MonID=839849,x=67,y=76,d=4,Time=11,PosNum=4,Path={67,69,1,67,60,1,67,70,1,67,76,1},ShowID={927013,},AI={2425,},Name={'锋利的波特',},Buff={909001,911001,},},
				{MonID=841049,x=57,y=76,d=4,Time=11,PosNum=4,Path={57,69,1,57,60,1,57,70,1,57,76,1},ShowID={935009,},AI={2433,},Name={'独眼克拉克',},Buff={909001,911001,},},
				},
			},
		},
	[10] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				--Boss
				{MonID=842050,x=62,y=67,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={935022,},AI={2487,},Name={'杀戮-K.O',},Buff={909001,911001,824001,92001,},DieFunc=1,},
				
				{MonID=840050,x=58,y=68,d=5,Time=20,PosNum=0,Path={63,61,1,63,51,1,63,70,1,},ShowID={929004,},AI={2486,},Name={'杀戮使徒',},Buff={909001,911001,},},
				{MonID=841050,x=66,y=68,d=5,Time=20,PosNum=0,Path={75,61,1,66,51,1,65,70,1,},ShowID={928009,},AI={2482,},Name={'杀戮使徒',},Buff={909001,911001,},},
				},
			},
		},
	[11] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=839851,x=54,y=75,d=4,Time=25,PosNum=5,Path={54,66,2,66,66,2,66,58,2,54,58,2,54,75,2,},ShowID={927011,},AI={2421,},Name={'卑鄙的影',},Buff={909001,911001,},},
				{MonID=840051,x=56,y=75,d=4,Time=25,PosNum=5,Path={56,67,1,68,67,1,68,59,1,56,59,1,56,75,1,},ShowID={935015,},AI={2442,},Name={'阴暗的冥',},Buff={909001,911001,},},
				{MonID=841051,x=58,y=75,d=4,Time=25,PosNum=5,Path={58,68,2,70,68,2,70,60,2,58,60,2,58,75,2,},ShowID={935008,},AI={2438,},Name={'冷酷的本',},Buff={909001,911001,},},
				},
			},
		},
	[12] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=841052,x=57,y=62,d=4,Time=15,PosNum=4,Path={69,62,1,69,74,1,57,74,1,57,62,1},ShowID={928002,},AI={2464,},Name={'飞龙克劳尔',},Buff={909001,911001,},},
				{MonID=840052,x=63,y=68,d=5,Time=20,PosNum=0,Path={63,61,1,63,51,1,63,70,1,},ShowID={929002,},AI={2473,},Name={'暗灵阿尔',},Buff={909001,911001,},},
				{MonID=841052,x=69,y=74,d=4,Time=15,PosNum=4,Path={57,74,1,57,62,1,69,62,1,69,74,1},ShowID={928003,},AI={2466,},Name={'凶猛的贝德斯',},Buff={909001,911001,},},
				},
			},
		},
	[13] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=841053,x=62,y=75,d=4,Time=23,PosNum=4,Path={52,75,2,52,61,2,72,61,2,72,75,2,},ShowID={928004,},AI={2431,},Name={'暗炎-炎',},Buff={909001,911001,},},
				{MonID=841053,x=62,y=73,d=4,Time=23,PosNum=4,Path={52,73,2,52,59,2,72,49,2,72,73,2,},ShowID={928010,},AI={2434,},Name={'暗炎-瞬',},Buff={909001,911001,},},
				{MonID=841053,x=62,y=77,d=4,Time=23,PosNum=4,Path={52,77,2,52,63,2,72,63,2,72,77,2,},ShowID={928008,},AI={2430,},Name={'暗炎-闪',},Buff={909001,911001,},},
				},
			},
		},
	[14] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=839854,x=56,y=74,d=4,Time=15,PosNum=3,Path={65,60,2,70,65,2,56,74,2,},ShowID={927005,},AI={2419,},Name={'霸气路飞',},Buff={909001,911001,},},
				{MonID=840054,x=70,y=60,d=4,Time=15,PosNum=3,Path={61,74,1,56,69,1,70,60,1,},ShowID={929006,},AI={2478,},Name={'顽皮公主露露',},Buff={909001,911001,},},
				{MonID=841054,x=56,y=60,d=4,Time=15,PosNum=3,Path={70,69,2,65,74,2,56,60,2,},ShowID={928001,},AI={2439,},Name={'护卫长风炎',},Buff={909001,911001,},},
				{MonID=841054,x=70,y=74,d=4,Time=15,PosNum=3,Path={56,65,2,61,60,2,70,74,2,},ShowID={928011,},AI={2463,},Name={'歌王普雷斯利',},Buff={909001,911001,},},
				},
			},
		},
	[15] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				--BOSS
				{MonID=844055,x=63,y=67,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={935023,},AI={2489,},Name={'因丘比斯',},Buff={909001,911001,824001,92001,},DieFunc=1,},
				
				{MonID=840055,x=66,y=68,d=5,Time=20,PosNum=0,Path={63,61,1,63,51,1,63,70,1,},ShowID={929001,},AI={2443,},Name={'雷神艾尼路',},Buff={909001,911001,},},
				{MonID=841055,x=60,y=68,d=5,Time=20,PosNum=0,Path={75,61,1,66,51,1,65,70,1,},ShowID={928012,},AI={2449,},Name={'光辉神伊利亚',},Buff={909001,911001,},},
				},
			},
		},
	[16] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=839856,x=59,y=78,d=4,Time=25,PosNum=5,Path={59,72,3,59,66,3,59,60,3,59,69,3,59,78,3,},ShowID={927016,},AI={2426,},Name={'小魔女轩轩',},Buff={909001,911001,},},
				{MonID=839856,x=65,y=78,d=4,Time=25,PosNum=5,Path={65,72,3,65,66,3,65,60,3,65,69,3,65,78,3,},ShowID={927017,},AI={2427,},Name={'魔战士紫葵',},Buff={909001,911001,},},
				{MonID=839856,x=62,y=75,d=4,Time=25,PosNum=5,Path={62,69,3,62,63,3,62,58,4,62,66,4,62,75,3,},ShowID={935004,},AI={2459,},Name={'光辉骑士团团花',},Buff={909001,911001,},},
				{MonID=841056,x=62,y=78,d=4,Time=25,PosNum=5,Path={62,72,3,62,66,3,62,60,2,62,69,3,62,78,3,},ShowID={935011,},AI={2465,},Name={'飞魔女迷情',},Buff={909001,911001,},},
				},
			},
		},
	[17] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=840057,x=60,y=75,d=4,Time=18,PosNum=5,Path={60,70,2,65,70,2,65,65,2,60,65,2,60,75,2,},ShowID={935012,},AI={2474,},Name={'难缠的诺德森',},Buff={909001,911001,},},
				{MonID=840057,x=65,y=75,d=4,Time=18,PosNum=5,Path={65,69,2,60,69,2,60,64,2,65,64,2,65,75,2,},ShowID={935014,},AI={2477,},Name={'幸运的莉莉',},Buff={909001,911001,},},
				{MonID=841057,x=60,y=71,d=4,Time=21,PosNum=5,Path={60,66,3,65,66,3,65,61,3,60,61,3,60,71,3,},ShowID={935010,},AI={2462,},Name={'双头狼-灵',},Buff={909001,911001,},},
				{MonID=841057,x=65,y=71,d=4,Time=21,PosNum=5,Path={65,65,3,60,65,3,60,60,3,65,60,3,65,71,3,},ShowID={935010,},AI={2468,},Name={'双头狼-宝',},Buff={909001,911001,},},
				},
			},
		},
	[18] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=839858,x=62,y=71,d=4,Time=9,PosNum=2,Path={62,60,1,62,71,1,},ShowID={935003,},AI={2454,},Name={'影刺寂灭',},Buff={909001,911001,},},
				{MonID=839858,x=64,y=60,d=4,Time=9,PosNum=2,Path={64,71,1,64,60,1,},ShowID={935007,},AI={2456,},Name={'暴躁的娜娜',},Buff={909001,911001,},},
				{MonID=840058,x=57,y=65,d=4,Time=9,PosNum=2,Path={68,65,1,57,65,1,},ShowID={929011,},AI={2440,},Name={'刺蜂朵尔朵',},Buff={909001,911001,},},
				{MonID=841058,x=68,y=67,d=4,Time=9,PosNum=2,Path={57,67,1,68,67,1,},ShowID={928006,},AI={2434,},Name={'炎爆团-水镜',},Buff={909001,911001,},},
				},
			},
		},
	[19] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=839859,x=62,y=66,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={927002,},AI={2420,},Name={'最强五人众-C.C',},Buff={909001,911001,},},
				{MonID=839859,x=60,y=71,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={927004,},AI={2428,},Name={'最强五人众-L.W',},Buff={909001,911001,},},
				{MonID=840059,x=58,y=68,d=5,Time=20,PosNum=0,Path={63,61,1,63,51,1,63,70,1,},ShowID={929001,},AI={2444,},Name={'最强五人众-M.Z',},Buff={909001,911001,},},
				{MonID=841059,x=66,y=68,d=5,Time=20,PosNum=0,Path={75,61,1,66,51,1,65,70,1,},ShowID={928003,},AI={2429,},Name={'最强五人众-W.L.R',},Buff={909001,911001,},},
				{MonID=841059,x=64,y=71,d=5,Time=20,PosNum=0,Path={75,61,1,66,51,1,65,70,1,},ShowID={928010,},AI={2449,},Name={'最强五人众-S.Q',},Buff={909001,911001,},},
				},
			},
		},
	[20] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				--boss
				{MonID=842060,x=62,y=65,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={935021,},AI={2490,},Name={'死神伊比利斯',},Buff={909001,911001,824001,92001,},DieFunc=1,},
				
				{MonID=839860,x=62,y=69,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={935005,},AI={2421,},Name={'魔界三巨头-雷鸣',},Buff={909001,911001,},},
				{MonID=840060,x=58,y=69,d=5,Time=20,PosNum=0,Path={63,61,1,63,51,1,63,70,1,},ShowID={929005,},AI={2441,},Name={'魔界三巨头-冥',},Buff={909001,911001,},},
				{MonID=841060,x=66,y=69,d=5,Time=20,PosNum=0,Path={75,61,1,66,51,1,65,70,1,},ShowID={928007,},AI={2431,},Name={'魔界三巨头-黄泉',},Buff={909001,911001,},},
				},
			},
		},
	[21] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=839861,x=62,y=77,d=4,Time=13,PosNum=3,Path={62,69,2,62,62,2,62,77,2,},ShowID={935006,},AI={2416,},Name={'疾影-百合',},Buff={909001,911001,},},
				
				{MonID=840061,x=61,y=74,d=4,Time=13,PosNum=3,Path={61,66,1,61,59,1,61,74,1,},ShowID={935015,},AI={2442,},Name={'安吉拉',},Buff={909001,911001,},},
				{MonID=840061,x=64,y=74,d=4,Time=13,PosNum=3,Path={64,66,1,64,59,1,64,74,1,},ShowID={935013,},AI={2443,},Name={'安达曼',},Buff={909001,911001,},},
				
				{MonID=841061,x=58,y=75,d=4,Time=13,PosNum=3,Path={58,67,2,58,60,2,58,75,2,},ShowID={928005,},AI={2436,},Name={'烦人的毕加索',},Buff={909001,911001,},},
				{MonID=841061,x=67,y=75,d=4,Time=13,PosNum=3,Path={67,67,2,67,60,2,67,75,2,},ShowID={935009,},AI={2438,},Name={'超新星-O.S.D',},Buff={909001,911001,},},
				},
			},
		},
	[22] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=839862,x=62,y=75,d=4,Time=13,PosNum=3,Path={62,67,2,62,59,2,62,75,2,},ShowID={935001,},AI={2425,},Name={'狂傲的埃里克斯',},Buff={909001,911001,},},
				
				{MonID=840062,x=58,y=78,d=4,Time=13,PosNum=3,Path={58,70,1,58,62,1,58,78,1,},ShowID={929008,},AI={2446,},Name={'智者斯考尔',},Buff={909001,911001,},},
				{MonID=840062,x=67,y=78,d=4,Time=13,PosNum=3,Path={67,70,1,67,62,1,67,78,1,},ShowID={929007,},AI={2479,},Name={'圣女爱丽丝',},Buff={909001,911001,},},
				
				{MonID=841062,x=61,y=77,d=4,Time=13,PosNum=3,Path={61,69,2,61,61,2,61,77,2,},ShowID={928008,},AI={2430,},Name={'英俊的威尔斯',},Buff={909001,911001,},},
				{MonID=841062,x=64,y=77,d=4,Time=13,PosNum=3,Path={64,69,2,64,61,2,64,77,2,},ShowID={928002,},AI={2469,},Name={'詹姆斯.D',},Buff={909001,911001,},},
				},
			},
		},
	[23] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=839863,x=62,y=75,d=4,Time=13,PosNum=3,Path={62,67,2,62,59,2,62,75,2,},ShowID={927004,},AI={2428,},Name={'铜墙铁壁肖恩',},Buff={909001,911001,},},
				
				{MonID=840063,x=59,y=75,d=4,Time=13,PosNum=3,Path={59,67,1,59,59,1,59,75,1,},ShowID={929002,},AI={2444,},Name={'天灾',},Buff={909001,911001,},},
				{MonID=840063,x=65,y=75,d=4,Time=13,PosNum=3,Path={65,67,1,65,59,1,65,75,1,},ShowID={929009,},AI={2441,},Name={'伊娃',},Buff={909001,911001,},},
				
				{MonID=841063,x=60,y=78,d=4,Time=13,PosNum=3,Path={60,70,2,60,62,2,60,78,2,},ShowID={928001,},AI={2429,},Name={'烈日-雷奥',},Buff={909001,911001,},},
				{MonID=841063,x=64,y=78,d=4,Time=13,PosNum=3,Path={64,70,2,64,62,2,64,78,2,},ShowID={928004,},AI={2439,},Name={'阻击王皮特',},Buff={909001,911001,},},
				},
			},
		},
	[24] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				{MonID=839864,x=62,y=74,d=4,Time=13,PosNum=3,Path={62,66,3,62,59,2,62,74,2,},ShowID={927002,},AI={2420,},Name={'战神阿瑞斯',},Buff={909001,911001,},},
				{MonID=839864,x=60,y=76,d=4,Time=13,PosNum=3,Path={60,68,3,60,61,2,60,76,2,},ShowID={927001,},AI={2422,},Name={'保卫者沃尔曼',},Buff={909001,911001,},},
				{MonID=839864,x=64,y=76,d=4,Time=13,PosNum=3,Path={64,68,3,64,61,2,64,76,2,},ShowID={927003,},AI={2423,},Name={'疯狂的特瑞',},Buff={909001,911001,},},
				
				{MonID=840064,x=58,y=78,d=4,Time=13,PosNum=3,Path={58,70,2,58,63,1,58,78,1,},ShowID={929010,},AI={2440,},Name={'大法师吉安娜',},Buff={909001,911001,},},
				
				{MonID=841064,x=66,y=78,d=4,Time=13,PosNum=3,Path={66,70,3,66,63,2,66,78,2,},ShowID={928012,},AI={2431,},Name={'死神之枪凯丽',},Buff={909001,911001,},},
				},
			},
		},
	[25] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				--boss
				{MonID=842065,x=62,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={935020,},AI={2491,},Name={'不灭的奥丁',},Buff={909001,911001,824001,92001,},DieFunc=1,},
				{MonID=839865,x=60,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={927008,},AI={2487,},Name={'不灭骑士',},Buff={909001,911001,},},
				{MonID=839865,x=64,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={927006,},AI={2490,},Name={'不灭骑士',},Buff={909001,911001,},},
				{MonID=840065,x=58,y=68,d=5,Time=20,PosNum=0,Path={63,61,1,63,51,1,63,70,1,},ShowID={929001,},AI={2488,},Name={'不灭骑士',},Buff={909001,911001,},},
				{MonID=841065,x=66,y=68,d=5,Time=20,PosNum=0,Path={75,61,1,66,51,1,65,70,1,},ShowID={928003,},AI={2489,},Name={'不灭骑士',},Buff={909001,911001,},},
				},
			},
		},
	[26] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				--boss
				{MonID=843066,x=62,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010001,},AI={2448,},Name={'南瓜魔导师',},Buff={909001,911001,824001,92001,},},--16659
				{MonID=839866,x=60,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010002,},AI={2471,},Name={'魔法学徒',},Buff={909001,911001,},},--28733
				{MonID=839866,x=64,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010002,},AI={2471,},Name={'魔法学徒',},Buff={909001,911001,},},
				{MonID=840066,x=58,y=68,d=5,Time=20,PosNum=0,Path={63,61,1,63,51,1,63,70,1,},ShowID={2010002,},AI={2471,},Name={'魔法学徒',},Buff={909001,911001,},},
				{MonID=841066,x=66,y=68,d=5,Time=20,PosNum=0,Path={75,61,1,66,51,1,65,70,1,},ShowID={2010002,},AI={2471,},Name={'魔法学徒',},Buff={909001,911001,},},
				},
			},
		},
	[27] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				--boss
				{MonID=842067,x=62,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010003,},AI={2491,},Name={'恶灵判官',},Buff={909001,911001,824001,92001,},},--21018
				{MonID=839867,x=60,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010004,},AI={2487,},Name={'骷髅战士',},Buff={909001,911001,},},--35286
				{MonID=839867,x=64,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010004,},AI={2487,},Name={'骷髅战士',},Buff={909001,911001,},},
				{MonID=840067,x=58,y=68,d=5,Time=20,PosNum=0,Path={63,61,1,63,51,1,63,70,1,},ShowID={2010004,},AI={2487,},Name={'骷髅战士',},Buff={909001,911001,},},
				{MonID=841067,x=66,y=68,d=5,Time=20,PosNum=0,Path={75,61,1,66,51,1,65,70,1,},ShowID={2010004,},AI={2487,},Name={'骷髅战士',},Buff={909001,911001,},},
				},
			},
		},
	[28] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				--boss
				{MonID=844068,x=62,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010005,},AI={2420,},Name={'机甲武士',},Buff={909001,911001,824001,92001,},},--366661
				{MonID=839868,x=60,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010006,},AI={2431,},Name={'机甲精英',},Buff={909001,911001,},},--367962
				{MonID=839868,x=64,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010006,},AI={2431,},Name={'机甲精英',},Buff={909001,911001,},},
				{MonID=840068,x=58,y=68,d=5,Time=20,PosNum=0,Path={63,61,1,63,51,1,63,70,1,},ShowID={2010006,},AI={2431,},Name={'机甲精英',},Buff={909001,911001,},},
				{MonID=841068,x=66,y=68,d=5,Time=20,PosNum=0,Path={75,61,1,66,51,1,65,70,1,},ShowID={2010006,},AI={2431,},Name={'机甲精英',},Buff={909001,911001,},},
				},
			},
		},
	[29] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				--boss
				{MonID=842069,x=62,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010007,},AI={2425,},Name={'荒野镖客雷迪斯',},Buff={909001,911001,824001,92001,},},--7983
				{MonID=839869,x=60,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010008,},AI={2422,},Name={'荒野镖客',},Buff={909001,911001,},},--28736
				{MonID=839869,x=64,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010008,},AI={2422,},Name={'荒野镖客',},Buff={909001,911001,},},
				{MonID=840069,x=58,y=68,d=5,Time=20,PosNum=0,Path={63,61,1,63,51,1,63,70,1,},ShowID={2010008,},AI={2422,},Name={'荒野镖客',},Buff={909001,911001,},},
				{MonID=841069,x=66,y=68,d=5,Time=20,PosNum=0,Path={75,61,1,66,51,1,65,70,1,},ShowID={2010008,},AI={2422,},Name={'荒野镖客',},Buff={909001,911001,},},
				},
			},
		},
	[30] = {
		[1] = {
			GoID=12256,GoX=44,GoY=107,GoD=3,
			OutID=11607,OutX=72,OutY=32,OutD=3,
			MonTab = {
				--boss
				{MonID=842070,x=62,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010009,},AI={2490,},Name={'半人马酋长',},Buff={909001,911001,824001,92001,},DieFunc=1,},--363312
				{MonID=839870,x=60,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010010,},AI={2441,},Name={'半人马战士',},Buff={909001,911001,},},--363300
				{MonID=839870,x=64,y=68,d=5,Time=20,PosNum=0,Path={53,61,1,60,51,1,60,70,1,},ShowID={2010010,},AI={2441,},Name={'半人马战士',},Buff={909001,911001,},},
				{MonID=840070,x=58,y=68,d=5,Time=20,PosNum=0,Path={63,61,1,63,51,1,63,70,1,},ShowID={2010010,},AI={2441,},Name={'半人马战士',},Buff={909001,911001,},},
				{MonID=841070,x=66,y=68,d=5,Time=20,PosNum=0,Path={75,61,1,66,51,1,65,70,1,},ShowID={2010010,},AI={2441,},Name={'半人马战士',},Buff={909001,911001,},},
				},
			},
		},
}

HeroTower_CengShu = 30
HeroTower_NeedHeroLv = 30
HeroTower_NeedExpLv = 40
HeroTower_ReliveNum = 2
HeroTower_ToRewardNum = 1
--英雄王的邀请函
HeroTower_Invitation = 88905
--英灵之魂
HeroTower_HeroSoul = 82001

if API_GetServerID() == 1 then
	HeroTowerDoorDGNPC = HeroTowerDoorDGNPC or API_CreateMonster(101,12255,393,567,4,0,-1)
	HeroTowerDoorLBNPC = HeroTowerDoorLBNPC or API_CreateMonster(101,12282,350,524,4,0,-1)
	HeroTowerDoorDGDoor = HeroTowerDoorDGDoor or API_CreateMonster(101,12297,364,564,3,0,-1)
	HeroTowerDoorLBDoor = HeroTowerDoorLBDoor or API_CreateMonster(101,12298,352,553,5,0,-1)
end

if not API_IsEctypeServer() or API_IsBranchServer() then
	HeroTower_TimeFunc = HeroTower_TimeFunc or API_CreateTimerTriggerG(0,0,60,-1,'HeroTower_TimeCallFunc')
end

function HeroTower_TimeCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == 0 and Minute == 5 then
		if HeroTowerMapDropNum ~= nil then
			for j in HeroTowerMapDropNum do
				HeroTowerMapDropNum[j] = 0
			end
		end
	end
end

--入口NPC 12248 对话
function HeroTower_Watcher(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local CampID = API_GetActorCamp(ActorID)
	local XuanZe = API_RequestGetNumber(1)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	if XuanZe == 1 then
		if HeroTower_InToJudge(ActorID) == 1 then
			if API_ActorRemoveGoods(ActorID, HeroTower_Invitation, 1, '带队进塔删邀请函') then
				--开始进入
				local TeamID = API_GetTeamID(ActorID)
				local TeamSize = API_GetTeamSize(TeamID)
				--创建副本等
				local ObjectMapID = API_CreateEctype(2022,0)
				HeroTowerMapTable[ObjectMapID] = {}
				HeroTowerDoorTab[ObjectMapID] = {}
				API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.level,1) --设置第几关
				HeroTower_Initialization(ObjectMapID,1)
				--记录进入的年月日和次数
				HeroTower_SaveYMD(ActorID)
				API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'HeroTower_GotoObjectMapID')
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[50][8][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[50][8][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[50][8][LaiYuan] = GLOBAL_FengXiangBiao_DateList[50][8][LaiYuan] + 1
				end
				if GLOBAL_FengXiangBiao_DateList[50][9][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[50][9][LaiYuan] = TeamSize
				else
					GLOBAL_FengXiangBiao_DateList[50][9][LaiYuan] = GLOBAL_FengXiangBiao_DateList[50][9][LaiYuan] + TeamSize
				end
			end
		end
	elseif	XuanZe == 2 then
		if HeroTower_InToJudge(ActorID) == 1 then
			local TeamLv = 25
			local TeamID = API_GetTeamID(ActorID)
			local TeamSize = 0
			if TeamID > 0 then
				TeamSize = API_GetTeamSize(TeamID)
				for i = 1,TeamSize do
					local TeamActorID = API_GetTeamMem(TeamID,i)
					local PlayLv = API_VarDataGetNumber(TeamActorID,1,12744)
					if PlayLv < TeamLv then
						TeamLv = PlayLv
					end
				end
			else
				TeamLv = 0
			end
			TeamLv = math.floor(TeamLv/5) * 5 + 1
			if TeamLv > 26 then
				TeamLv = 26
			end
			if API_RequestGetNumber(3) == 1 then
				if API_ActorRemoveGoods(ActorID, HeroTower_Invitation, 1, '带队进塔删邀请函') then
					--开始进入
					--创建副本等
					local MapConfigID = HeroTowerMapID[TeamLv].MapID
					local ObjectMapID = API_CreateEctype(MapConfigID,0)
					HeroTowerMapTable[ObjectMapID] = {}
					HeroTowerDoorTab[ObjectMapID] = {}
					API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.level,TeamLv) --设置第几关
					API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.Jixian,TeamLv) --设置无排名判断
					HeroTower_Initialization(ObjectMapID,TeamLv)
					--记录进入的年月日和次数
					HeroTower_SaveYMD(ActorID)
					API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'HeroTower_GotoObjectMapID')
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[50][8][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[50][8][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[50][8][LaiYuan] = GLOBAL_FengXiangBiao_DateList[50][8][LaiYuan] + 1
					end
					if GLOBAL_FengXiangBiao_DateList[50][9][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[50][9][LaiYuan] = TeamSize
					else
						GLOBAL_FengXiangBiao_DateList[50][9][LaiYuan] = GLOBAL_FengXiangBiao_DateList[50][9][LaiYuan] + TeamSize
					end
				end
			else
				API_ResponseWrite('<name>英雄之塔</name>')
				API_ResponseWrite('<text>你的队伍可以跳至</text><text color="255,0,255"> 第'..TeamLv..'关 </text><text>开始挑战，是否想要跳关挑战呢？</text><br>')
				API_ResponseWrite('<br><br><a href="HeroTower_Watcher?1=2&3=1">跳关挑战</a><br><br>')
				API_ResponseWrite('<br><a href="HeroTower_Watcher">返回</a>') 
			end
		end
	elseif	XuanZe == 3 then
		--HeroTowerRank
		local Page = API_RequestGetNumber(2)
		local RankNum = table.getn(HeroTowerRank)
		API_ResponseWrite('<name>英雄挑战排名</name>')
		API_ResponseWrite('<win rect="50,80,460,473"></win>')
		API_ResponseWrite('<text>挑战层次最高、最快的英雄（维护后重置）：</text><br><br>')
		for j = 1,RankNum do
			if j > Page * 12 and j < (Page + 1) * 12 + 1 then
				local Name = HeroTowerRank[j].Name
				local Time = HeroTowerRank[j].Time
				local Lv = HeroTowerRank[j].Lv
				local Min = math.floor(Time/60)
				local Sec = math.mod(Time,60)
				local BuyNumTip = ''
				if j <= 3 then
					BuyNumTip = BuyNumTip..'<text color="255,255,0">'..string.format("%-3s",j)..'</text>'
					BuyNumTip = BuyNumTip..'<text color="255,255,0">  '..string.format("%-22s",'英雄名：'..Name..'')..' </text>'
					BuyNumTip = BuyNumTip..'<text color="255,255,0">  '..string.format("%-16s",'通关层次：'..Lv..'层')..'</text>'
					BuyNumTip = BuyNumTip..'<text color="255,255,0">  '..string.format("%-16s",'时间：'..Min..'分'..Sec..'秒')..'</text>'
				else
					BuyNumTip = BuyNumTip..'<text>'..string.format("%-3s",j)..'</text>'
					BuyNumTip = BuyNumTip..'<text>  '..string.format("%-22s",'英雄名：'..Name..'')..' </text>'
					BuyNumTip = BuyNumTip..'<text>  '..string.format("%-16s",'通关层次：'..Lv..'层')..'</text>'
					BuyNumTip = BuyNumTip..'<text>  '..string.format("%-16s",'时间：'..Min..'分'..Sec..'秒')..'</text>'
				end
				local BuyNumTipLen = string.len(BuyNumTip)
				if BuyNumTipLen < 59 then
					for j = 1,59- BuyNumTipLen do
						BuyNumTip = BuyNumTip..' '
					end
				end
				API_ResponseWrite(''..BuyNumTip..'')
				API_ResponseWrite('<br><text>——————————————————————————————————</text><br>')
			end
		end
		if RankNum < (Page + 1) * 12 then
			for i = 1,(Page + 1) * 12 - RankNum do
				API_ResponseWrite('<br><br>')
			end
		end
		if RankNum > 12 then
			local BackPage = Page - 1
			local NextPage = Page + 1
			if Page == 0 then
				API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button_back_g.bmp"><text>        </text><a href="HeroTower_Watcher">返回</a><text>        </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="HeroTower_Watcher?1=3&2='..NextPage..'">')
			elseif (Page + 1) * 12 < RankNum then
				API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="HeroTower_Watcher?1=3&2='..BackPage..'"><text>        </text><a href="HeroTower_Watcher">返回</a><text>        </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="HeroTower_Watcher?1=3&2='..NextPage..'">')
			else
				API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="HeroTower_Watcher?1=3&2='..BackPage..'"><text>        </text><a href="HeroTower_Watcher">返回</a><text>        </text><img src="LuaUse\\button_next_g.bmp">')
			end
		else
			API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button_back_g.bmp"><text>        </text><a href="HeroTower_Watcher">返回</a><text>        </text><img src="LuaUse\\button_next_g.bmp">')
		end
	elseif	XuanZe == 4 then
		--这里写说明
		API_ResponseWrite('<win rect="90,350,840,245" alpha="240" balpha="230"></win>') 
		API_ResponseWrite('<name>挑战须知</name>')
		API_ResponseWrite('<br><text color="255,0,255">奖励规则：</text>')
		API_ResponseWrite('<br><text>    每天前一次挑战可以获得奖励，挑战层次越高，奖励越好。每天最多可进入五次。</text><br>') 
		API_ResponseWrite('<br><text color="255,0,255">进入规则：</text>')
		API_ResponseWrite('<br><text>    1、必须'..HeroTower_NeedExpLv..'级以上的玩家组成两人以上队伍；</text>')
		API_ResponseWrite('<br><text>    2、队伍中每个玩家装备的双英雄头衔级别都需达到'..HeroTower_NeedHeroLv..'级或以上；</text>')
		API_ResponseWrite('<br><text>    3、队长必须持有“'..API_GetGoodsName(HeroTower_Invitation)..'”；</text><br>')
		API_ResponseWrite('<br><text color="255,0,255">跳关挑战规则：</text>')
		API_ResponseWrite('<br><text>    进入层次以队伍中通关层次最低的玩家为准，每5级一个跨幅。</text>')
		API_ResponseWrite('<br><text>    注1：1--4层无法跳关挑战，5--9层可跳到6层，10--14层可跳到11层，如此类推，最高可跳至26层。</text>')
		API_ResponseWrite('<br><text>    注2：跳关挑战不会获得排名。</text><br>')
--~ 		API_ResponseWrite('<br><text color="255,0,255">排名规则：</text>') 
--~ 		API_ResponseWrite('<br><text>    挑战层次最高，挑战时间最短的玩家将拥有最高排名。</text>') 
--~ 		API_ResponseWrite('<br><text>    注：每周服务器维护时排名将重置。</text><br>') 
--~ 		API_ResponseWrite('<br><a href="HeroTower_Watcher">返回</a>') 
		API_ResponseWrite('<br><br><a>关闭</a>') 
	elseif	XuanZe == 5 then
		local Select = API_RequestGetNumber(2)
		local SoulNum = API_ActorGetGoodsNum(ActorID,HeroTower_HeroSoul)
		API_ResponseWrite('<name>兑换奖励</name>')
		if Select > 0 then
			if API_ActorGetPackageSize(ActorID) <= 0 then
				API_ResponseWrite('<br><text>背包已满，无法兑换。</text><br>')
				API_ResponseWrite('<br><a>关闭</a><br>')
				return
			end
			if HeroTower_ExchangeReward[Select] ~= nil then
				local Name = HeroTower_ExchangeReward[Select].Name
				local NeedNum = HeroTower_ExchangeReward[Select].NeedNum
				local GoodsID = HeroTower_ExchangeReward[Select].GoodsID
				local GoodsTab = HeroTower_ExchangeReward[Select].GoodsTab
				local RewardID = 0
				local RewardType = 0
				local RewardName = ''
				if SoulNum >= NeedNum then
					if GoodsID > 0 then
						RewardID = GoodsID
						RewardType = 1
					else
						RewardID = GoodsTab[math.random(table.getn(GoodsTab))]
						RewardType = 2
					end
					if RewardID > 0 then
						if API_ActorRemoveGoods(ActorID, HeroTower_HeroSoul, NeedNum, '兑换英雄塔奖励') then 
							if RewardType == 1 then
								API_AddActorGoodsFlag(ActorID, RewardID, 1, 1, '兑换英雄塔奖励')
							elseif RewardType == 2 then
								API_AddActorGoodsFlagEx(ActorID, RewardID, 1, 3, 1, '兑换英雄塔奖励', 0)
								RewardName = '高附加属性的'
							end
							API_ResponseWrite('<br><text>兑换成功，获得一个'..RewardName..''..API_GetGoodsName(RewardID)..'。</text><br>')
							API_ResponseWrite('<br><a href="HeroTower_Watcher?1=5">返回</a>')
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[50][Select][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[50][Select][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[50][Select][LaiYuan] = GLOBAL_FengXiangBiao_DateList[50][Select][LaiYuan] + 1
							end
						end
					else
						API_ResponseWrite('<br><text>兑换失败，请重试。</text><br>')
						API_ResponseWrite('<br><a href="HeroTower_Watcher?1=5">返回</a><br>')
					end
				else
					API_ResponseWrite('<br><text>你背包内的 '..API_GetGoodsName(HeroTower_HeroSoul)..' 数量不足 '..NeedNum..'个，无法兑换'..Name..'。</text><br>')
					API_ResponseWrite('<br><a href="HeroTower_Watcher?1=5">返回</a><br>')
				end
			else
				API_ResponseWrite('<br><text>无效点击</text><br>')
				API_ResponseWrite('<br><a>关闭</a><br>')
			end
		else
			for j in HeroTower_ExchangeReward do
				local Name = HeroTower_ExchangeReward[j].Name
				local NeedNum = HeroTower_ExchangeReward[j].NeedNum
				local Tip = ''
				Tip = Tip..'<br><text color="255,255,255">'..string.format("%-22s",Name)..'  </text>'
				Tip = Tip..'<text color="255,0,255">'..string.format("%-3s",NeedNum)..'个 '..API_GetGoodsName(HeroTower_HeroSoul)..'   </text>'
				API_ResponseWrite(''..Tip..'')
				API_ResponseWrite('<a href="HeroTower_Watcher?1=5&2='..j..'">兑换</a><br>') 
			end
			API_ResponseWrite('<br><a href="HeroTower_Watcher">返回</a>')
		end
	else
		local MapLv = API_VarDataGetNumber(ActorID,1,12744)
		if NPCID == 12255 or NPCID == 12282 then
			API_ResponseWrite('<name>英雄之塔</name>')
			API_ResponseWrite('<text>真的英雄，敢于直面最残酷的挑战。</text><br>')
			if MapLv > 0 then
				API_ResponseWrite('<br><br><a href="HeroTower_Watcher?1=5">兑换奖励</a><text>          </text>')
	--~ 			API_ResponseWrite('<a href="HeroTower_Watcher?1=3">查看排名</a><text>          </text>')
				API_ResponseWrite('<a href="HeroTower_Watcher?1=4">挑战须知</a><br><br>')
				API_ResponseWrite('<br><a>关闭</a>')
			else
				API_ResponseWrite('<br><br><text>英雄之塔入口在我身后桥的尽头，希望你不会让我失望，战斗吧！勇士！</text><br><br>')
				--API_ResponseWrite('<br><a href="HeroTower_Watcher?1=4">挑战须知</a><br><br>')
				API_ResponseWrite('<br><a>关闭</a>')
			end
		elseif NPCID == 12297 or NPCID == 12298 then
			API_ResponseWrite('<name>英雄之塔</name>')
			API_ResponseWrite('<a href="HeroTower_Watcher?1=1">开始挑战</a><br><br>')
			if MapLv > 0 then
				API_ResponseWrite('<br><a href="HeroTower_Watcher?1=2">跳关挑战</a><br><br>')
			end
			API_ResponseWrite('<br><a>关闭</a>')
		end
	end
end

--塔内进入判断
function HeroTower_InToJudge(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	local MapID = API_GetActorMapID(ActorID)
	local TeamID = API_GetTeamID(ActorID)
	local Yes = 1
	local KillID = 0
	local Tips = ''
--~ 	API_ResponseWrite('<win rect="90,350,840,275" alpha="240" balpha="230"></win>') 
	API_ResponseWrite('<text>对不起，进入英雄之塔需要如下条件：</text><br><br><br>')
	if Hour >= 10 and Hour < 22 then
		Tips = Tips..'<text color="0,255,0">1、10：00--22：00才可以进入（已满足）</text><br>'
	else
		Tips = Tips..'<text color="255,0,0">1、10：00--22：00才可以进入</text><text color="255,255,0">（进入时间不对）</text><br>'
		Yes = 0
	end
	if TeamID > 0 then
		local TeamSize = API_GetTeamSize(TeamID)
		local TeamLeader = API_GetTeamLeader(TeamID)
 		local PD1 = 0
		local PD2 = 0
		local PD3 = 0
		local PD4 = 0
--~ 		local PD5 = 0
--~ 		local PD6 = 0
--~ 		local PD7 = 0
		if API_VarDataGetNumber(ActorID,1,12745) == 0 and  API_ActorGetGoodsNum(ActorID,HeroTower_Invitation) > 0 then
			Tips = Tips..'<text color="0,255,0">2、每天可带队进入一次，并且背包内有'..API_GetGoodsName(HeroTower_Invitation)..'（已满足）</text><br>'
		else
			if TeamLeader == ActorID then
				Tips = Tips..'<text color="255,0,0">2、每天可带队进入一次，并且背包内有'..API_GetGoodsName(HeroTower_Invitation)..'</text><text color="255,255,0">（队长没有邀请函）</text><br>'
			else
				Tips = Tips..'<text color="255,0,0">2、每天可带队进入一次，并且背包内有'..API_GetGoodsName(HeroTower_Invitation)..'</text><text color="255,255,0">（队员点击无法进入）</text><br>'
			end
			Yes = 0
		end
		for i = 1,TeamSize do
			local TeamActorID = API_GetTeamMem(TeamID,i)
			if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID then
--~ 				if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
--~ 					PD4 = TeamActorID
--~ 				end
--~ 				if API_ActorFindStatus(TeamActorID,519) then
--~ 					PD5 = TeamActorID
--~ 				end
--~ 				if API_ActorIsDying(TeamActorID) then
--~ 					PD6 = TeamActorID
--~ 				end
--~ 				if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
--~ 					PD7 = TeamActorID
--~ 				end
				local ExpLv = API_GetActorExpLevel(TeamActorID)
				local HeroID1 = API_ActorGetCurHeroID(TeamActorID,0)
				local Hero1Lv = epfunc_FH_SkillLvSum(TeamActorID, HeroID1)
				local HeroID2 = API_ActorGetCurHeroID(TeamActorID,1)
				local Hero2Lv = epfunc_FH_SkillLvSum(TeamActorID, HeroID2)
				if ExpLv < HeroTower_NeedExpLv then
					PD2 = TeamActorID
				end
				if Hero1Lv < HeroTower_NeedHeroLv or Hero2Lv < HeroTower_NeedHeroLv then
					PD3 = TeamActorID
				end
				local PlayYMD = API_VarDataGetNumber(TeamActorID,1,12741)
				local PlayNum = API_VarDataGetNumber(TeamActorID,1,12742)
				if PlayYMD ~= YMD then
					PlayNum = 0
				end
				if PlayNum > 5 then
					PD4 = TeamActorID
				end
			else
				PD1 = 1
			end
		end
		if TeamLeader == ActorID and TeamSize >= 2 and PD1 == 0 and PD4 == 0 then
			Tips = Tips..'<text color="0,255,0">3、队长带两人以上队伍并且队伍成员都在同一地图，每位成员进入次数不超过五次（已满足）</text><br>'
		else
			if TeamLeader == ActorID then
				if PD1 ~= 0 then
					Tips = Tips..'<text color="255,0,0">3、队长带两人以上队伍并且队伍成员都在同一地图，每位成员进入次数不超过五次</text><text color="255,255,0">（有队员不在线或不在同一地图）</text><br>'
				else
					Tips = Tips..'<text color="255,0,0">3、队长带两人以上队伍并且队伍成员都在同一地图，每位成员进入次数不超过五次</text><text color="255,255,0">（'..API_GetActorName(PD4)..'已无法进入）</text><br>'
				end
			else
				Tips = Tips..'<text color="255,0,0">3、队长带两人以上队伍并且队伍成员都在同一地图，每位成员进入次数不超过五次</text><text color="255,255,0">（非队长带队无法进入）</text><br>'
			end
			Yes = 0
		end
		if PD2 == 0 then
			Tips = Tips..'<text color="0,255,0">4、队伍中所有成员大于等于'..HeroTower_NeedExpLv..'级（已满足）</text><br>'
		else
			Tips = Tips..'<text color="255,0,0">4、队伍中所有成员大于等于'..HeroTower_NeedExpLv..'级</text><text color="255,255,0">（'..API_GetActorName(PD2)..'级别太低）</text><br>'
			Yes = 0
		end
		if PD3 == 0 then
			Tips = Tips..'<text color="0,255,0">5、队伍中所有成员当前装备的两个英雄头衔等级都大于等于'..HeroTower_NeedHeroLv..'级（已满足）</text><br>'
		else
			Tips = Tips..'<text color="255,0,0">5、队伍中所有成员当前装备的两个英雄头衔等级都大于等于'..HeroTower_NeedHeroLv..'级</text><text color="255,255,0">（'..API_GetActorName(PD3)..'当前装备英雄的头衔级别太低）</text><br>'
			Yes = 0
		end
	else
		Yes = 0
		if API_VarDataGetNumber(ActorID,1,12745) == 0 and  API_ActorGetGoodsNum(ActorID,HeroTower_Invitation) > 0 then
			Tips = Tips..'<text color="0,255,0">2、每天可带队进入一次，并且背包内有'..API_GetGoodsName(HeroTower_Invitation)..'（已满足）</text><br>'
		else
			Tips = Tips..'<text color="255,0,0">2、每天可带队进入一次，并且背包内有'..API_GetGoodsName(HeroTower_Invitation)..'</text><br>'
		end
		Tips = Tips..'<text color="255,0,0">3、队长带队并且队伍成员在两人以上</text><br>'
		Tips = Tips..'<text color="255,0,0">4、队伍中所有成员大于等于'..HeroTower_NeedExpLv..'级</text><br>'
		Tips = Tips..'<text color="255,0,0">5、队伍中所有成员当前装备双英雄头衔等级大于等于'..HeroTower_NeedHeroLv..'级</text><br>'
	end
	if Yes == 0 then
		Tips = Tips..'<br><br><a>确定</a>'
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID then
					API_ResponseWrite(''..Tips..'')
					API_ResponseFlush(TeamActorID)
				end
			end
		else
			API_ResponseWrite(''..Tips..'')
			API_ResponseFlush(ActorID)
		end
	else
		API_ResponseEnd()
		API_ResponseClear()
	end
	return Yes
end

--存储进入塔的年月日
function HeroTower_SaveYMD(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	local TeamID = API_GetTeamID(ActorID)
	if TeamID > 0 then
		local TeamSize = API_GetTeamSize(TeamID)
		for i = 1,TeamSize do
			local TeamActorID = API_GetTeamMem(TeamID,i)
			local PlayYMD = API_VarDataGetNumber(TeamActorID,1,12741)
			local PlayNum = API_VarDataGetNumber(TeamActorID,1,12742)
			if PlayYMD ~= YMD then
				PlayNum = 0
			end
			API_VarDataSetNumber(TeamActorID,1,12741,YMD)
			PlayNum = PlayNum + 1
			API_VarDataSetNumber(TeamActorID,1,12742,PlayNum)
			API_VarDataSetNumber(TeamActorID,1,12743,0)
			API_VarDataSetNumber(TeamActorID,1,12747,0)
		end
	else
		local PlayYMD = API_VarDataGetNumber(ActorID,1,12741)
		local PlayNum = API_VarDataGetNumber(ActorID,1,12742)
		if PlayYMD ~= YMD then
			PlayNum = 0
		end
		API_VarDataSetNumber(ActorID,1,12741,YMD)
		PlayNum = PlayNum + 1
		API_VarDataSetNumber(ActorID,1,12742,PlayNum)
		API_VarDataSetNumber(ActorID,1,12743,0)
		API_VarDataSetNumber(ActorID,1,12747,0)
	end
	API_VarDataSetNumber(ActorID,1,12745,1)
end

--在塔内创建怪物触发器等，传入地图和难度
function HeroTower_Initialization(ObjectMapID,Level)
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	local MapConfigID = API_GetMapConfigID(ObjectMapID)
	--根据难度读表，创建怪物、行走路径、创建门并存表
	if HeroTowerMapGame[Level] == nil then
		Level = math.random(10,25)
	end
	local GameNo = math.random(table.getn(HeroTowerMapGame[Level]))
	API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.Monster,GameNo) --存储玩法序号
	local GameTab = HeroTowerMapGame[Level][GameNo]
	--创建下一层入口
	--API_CreateMonster(ObjectMapID,GameTab.GoID,GameTab.GoX,GameTab.GoY,GameTab.GoD,0,-1)
	--创建离开地图的出口
	API_CreateMonster(ObjectMapID,GameTab.OutID,GameTab.OutX,GameTab.OutY,GameTab.OutD,0,-1)
	--创建下一层入口前的门
	if HeroTower_DoorTile[MapConfigID] ~= nil then
		for j in HeroTower_DoorTile[MapConfigID] do
			local DoorID = HeroTower_DoorTile[MapConfigID][j][1]
			local x = HeroTower_DoorTile[MapConfigID][j][2]
			local y = HeroTower_DoorTile[MapConfigID][j][3]
			local d = HeroTower_DoorTile[MapConfigID][j][4]
			local DoorFastID = API_CreateMonster(ObjectMapID,DoorID,x,y,d,0,-1)
			--API_MonsterAddStatus(DoorFastID,742001,-1) --加无敌
			HeroTowerDoorTab[ObjectMapID][j] = DoorFastID
		end
	end
	--创建怪物并存表
	local MonTab = GameTab.MonTab
	for j,v in ipairs(MonTab) do
		local ShowNum = math.random(table.getn(v.ShowID))
		local ShowID = v.ShowID[ShowNum]
		local MonID = v.MonID
		local x,y,d = v.x,v.y,v.d
		local Time = v.Time
		local Name = v.Name[ShowNum]
		local AI = v.AI[ShowNum]
		local FastID = API_CreateMonster(ObjectMapID,MonID,x,y,d,AI,-1)
		local Buff = v.Buff
		local PosNum = v.PosNum
		local Path = v.Path
		API_MonsterAddStatus(FastID, ShowID, 0) --加外观变身状态
		API_MonsterAddStatus(FastID, 933001, 0) --10s恢复1%hp，减少图腾伤害80%
		API_SetMonsterName(FastID, ''..Name..'', 1) --改名字
		for i in Buff do
			local BuffID = Buff[i]
			API_MonsterAddStatus(FastID, BuffID, 0) --加群嘲状态
		end
		HeroTowerMapTable[ObjectMapID][FastID] = {}
		HeroTowerMapTable[ObjectMapID][FastID] = {PosNum = PosNum, Path = Path}
		if PosNum > 0 then
			API_MonsterMoveTo(FastID, PosNum, Path)
			--创建怪物行为触发器
			API_CreateTimerTriggerG(FastID, MonID, Time, -1,'HeroTower_MonMoveFunc')
		end
		if v.DieFunc ~= nil then
			API_CreateDieTriggerG(0, 0, 0, FastID, 'HeroTower_BossDieFunc')
		else
			API_MonsterAddStatus(FastID, 925001, 0) --尸气特效
			API_MonsterAddStatus(FastID, 926001, 0) --透明特效
			API_CreateDieTriggerG(0, 0, 0, FastID, 'HeroTower_JYDieFunc')
		end
	end
	--全局时间触发器
	local TimerTriggerG = API_CreateTimerTriggerG(ObjectMapID,0,1,-1,'HeroTower_TimerTriggerGFunc')
	API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.TIMER_TRIGGERG_ID,TimerTriggerG)
	if HeroTowerMapDropNum[Level] == nil then
		HeroTowerMapDropNum[Level] = 0
	end
end

--怪物行为触发器
function HeroTower_MonMoveFunc(FastID,MonID)
	local TimerTriggerID = API_GetCurTriggerID()
	if API_GetMonsterID(FastID) ~= MonID then
		API_DestroyTriggerG(TimerTriggerID)
		return
	end
	local ObjectMapID = API_GetMonsterMap(FastID)
	if HeroTowerMapTable[ObjectMapID][FastID] == nil then
		API_DestroyTriggerG(TimerTriggerID)
		return
	end
	local TarID = API_GetCurEmenyByMonster(FastID)
	if API_GetThingClass(TarID) ~= -1 then
		return
	end
	local PosNum = HeroTowerMapTable[ObjectMapID][FastID].PosNum
	local Path = HeroTowerMapTable[ObjectMapID][FastID].Path
	API_MonsterMoveTo(FastID, PosNum, Path)
end

--BOSS死亡触发器
function HeroTower_BossDieFunc(a,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if not API_MapIsValid(MapID) then
		return
	end
	local KillNum = API_VarDataGetNumber(KillerID,1,12747)
	local JYNum = math.floor(KillNum/100)
	local BossNum = math.mod(KillNum,100)
	BossNum = BossNum + 1
	KillNum = JYNum * 100 + BossNum
	API_VarDataSetNumber(KillerID,1,12747,KillNum)
	--API_ActorSendMsg(KillerID,10,'已杀死'..BossNum..'个Boss')
	API_ActorBroadcastMsgEx(MapID, -1, 0, 10, '['..API_GetActorName(KillerID)..']消灭['..API_GetMonsterNameByID(MonsterID)..']，本次挑战共消灭了'..BossNum..'个Boss')
	local MapLv = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.level)
	if math.mod(MapLv,5) ~= 0 then
		return
	end
	local RewardTab = HeroTower_BossDieDropGoods[MapLv]
	for j,v in ipairs(RewardTab[1]) do
		local RewardGaiLv = math.random(1000000)
		local GoodsID = v.GoodsID
		local GoodsNum = v.GoodsNum
		local GaiLv = v.GaiLv
		local PinZhi = v.PinZhi
		if RewardGaiLv <= GaiLv then
			if GoodsID > 100 then
				API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,1,'英雄之塔BOSS奖励',4,0,600,0)
--~ 			else
--~ 				local GoodsTab = v.GoodsTab
--~ 				GoodsID = GoodsTab[math.random(table.getn(GoodsTab))]
--~ 				API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,1,'英雄之塔BOSS奖励',0,0,600,120,PinZhi)
			end
		end
	end
	local TeamID = API_GetTeamID(KillerID)
	if TeamID > 0 then
		local Tab = {}
		local PD = 0
		local TeamSize = API_GetTeamSize(TeamID)
--~ 		local Sex = 0
		for i = 1,TeamSize do
			local TeamActorID = API_GetTeamMem(TeamID,i)
			if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID then
				local PlayNum = API_VarDataGetNumber(TeamActorID,1,12742)
--~ 				local PlaySex = API_GetActorSex(TeamActorID)
				if PlayNum <= HeroTower_ToRewardNum then
					table.insert(Tab,TeamActorID)
					PD = 1
				end
--~ 				if PlaySex == 2 then
--~ 					Sex = 1
--~ 				end
			end
		end
--~ 		if MapLv == 10 and Sex == 1 then
--~ 			local RD = math.random(5,10)
--~ 			for i = 1,RD do
--~ 				API_CreateDropGoods(MapID,PosX,PosY,88952,1,0,'英雄之塔BOSS奖励',4,0,600,0)
--~ 			end
--~ 		end
		if PD == 1 then
			if RewardTab[2] ~= nil then
				for j,v in Tab do
					for o,p in ipairs(RewardTab[2]) do
						local GoodsID = p.GoodsID
						local GoodsNum = p.GoodsNum
						API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,1,'英雄塔BOSS奖励',0,v,180,180)
					end
				end
			end
			if RewardTab[3] ~= nil then
				for q,w in ipairs(RewardTab[3]) do
					local RewardGaiLv = math.random(1000000)
					local GoodsID = w.GoodsID
					local GoodsNum = w.GoodsNum
					local GaiLv = w.GaiLv
					local PinZhi = w.PinZhi
					local Bind = w.Bind
					if RewardGaiLv <= GaiLv then
						local ShiQuID = Tab[math.random(table.getn(Tab))]
						if GoodsID == 80951 or GoodsID == 80952 then
							local NowNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 74)
							local MaxNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 75)
							if MaxNum == 0 then
								MaxNum = 60
							end
							if NowNum < MaxNum then
								NowNum = NowNum + GoodsNum
								API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 74, NowNum)
								API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,Bind,'英雄之塔BOSS奖励',0,ShiQuID,180,180)
							end
						else
							if GoodsID > 100 then
								API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,Bind,'英雄之塔BOSS奖励',0,ShiQuID,180,180)
							else
								local GoodsTab = w.GoodsTab
								GoodsID = GoodsTab[math.random(table.getn(GoodsTab))]
								API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,Bind,'英雄之塔BOSS奖励',4,ShiQuID,180,180,PinZhi)
							end
						end
					end
				end
			end
			local Time = os.time() 
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
			local OtherCD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 60)
			local OtherNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 61)
			if Time >= OtherCD and OtherNum < 30 and math.random(100) <= 2 then
				local ShiQuID = Tab[math.random(table.getn(Tab))]
				if API_ActorIsOnline(ShiQuID) then
					OtherCD = Time + 1800
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 60, OtherCD)
					OtherNum = OtherNum + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 61, OtherNum)
					local Tab2 = {[1]={80397,50,},[2]={75,10,},}
					local Num = math.random(table.getn(Tab2))
					local GoodsID = Tab2[Num][1]
					local GoodsNum = Tab2[Num][2]
					API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,1,'英雄之塔BOSS奖励',0,ShiQuID,180,180)
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..API_GetActorName(ShiQuID)..'战胜英雄之塔BOSS获得：'..API_GetGoodsName(GoodsID)..' x '..GoodsNum..'！')
				end
			end
			local BookCD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 62)
			local BookNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 63)
			if Time >= BookCD and HeroTower_OtherCDTime[Hour] ~= nil and BookNum < HeroTower_OtherCDTime[Hour].MaxNum then
				local ShiQuID = Tab[math.random(table.getn(Tab))]
				if API_ActorIsOnline(ShiQuID) then
					BookCD = Time + 1800
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 62, BookCD)
					BookNum = BookNum + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 63, BookNum)
					local Tab2 = {88591,88592,88593,88595,88596,88597,88599,88600,88601,}
					local GoodsID = Tab2[math.random(table.getn(Tab2))]
					local GoodsNum = 1
					API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,'英雄之塔BOSS奖励',0,ShiQuID,180,180)
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..API_GetActorName(ShiQuID)..'战胜英雄之塔BOSS获得：'..API_GetGoodsName(GoodsID)..'！')
				end
			end
		end
	else
		local PlayNum = API_VarDataGetNumber(KillerID,1,12742)
		if PlayNum <= HeroTower_ToRewardNum then
			if RewardTab[2] ~= nil then
				for o,p in ipairs(RewardTab[2]) do
					local GoodsID = p.GoodsID
					local GoodsNum = p.GoodsNum
					API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,1,'英雄塔BOSS奖励',0,KillerID,180,180)
				end
			end
			if RewardTab[3] ~= nil then
				for q,w in ipairs(RewardTab[3]) do
					local RewardGaiLv = math.random(1000000)
					local GoodsID = w.GoodsID
					local GoodsNum = w.GoodsNum
					local GaiLv = w.GaiLv
					local PinZhi = w.PinZhi
					local Bind = w.Bind
					if RewardGaiLv <= GaiLv then
						if GoodsID == 80951 or GoodsID == 80952 then
							local NowNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 74)
							local MaxNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 75)
							if MaxNum == 0 then
								MaxNum = 60
							end
							if NowNum < MaxNum then
								NowNum = NowNum + GoodsNum
								API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 74, NowNum)
								API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,Bind,'英雄之塔BOSS奖励',0,KillerID,180,180)
							end
						else
							if GoodsID > 100 then
								API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,Bind,'英雄之塔BOSS奖励',0,KillerID,180,180)
							else
								local GoodsTab = w.GoodsTab
								GoodsID = GoodsTab[math.random(table.getn(GoodsTab))]
								API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,Bind,'英雄之塔BOSS奖励',4,KillerID,180,180,PinZhi)
							end
						end
					end
				end
			end
			local Time = os.time() 
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
			local OtherCD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 60)
			local OtherNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 61)
			if Time >= OtherCD and OtherNum < 30 and math.random(100) <= 2 then
				OtherCD = Time + 1800
				API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 60, OtherCD)
				OtherNum = OtherNum + 1
				API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 61, OtherNum)
				local Tab2 = {[1]={80397,50,},[2]={75,10,},}
				local Num = math.random(table.getn(Tab2))
				local GoodsID = Tab2[Num][1]
				local GoodsNum = Tab2[Num][2]
				API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,1,'英雄之塔BOSS奖励',0,KillerID,180,180)
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..API_GetActorName(KillerID)..'战胜英雄之塔BOSS获得：'..API_GetGoodsName(GoodsID)..' x '..GoodsNum..'！')
			end
			local BookCD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 62)
			local BookNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 63)
			if Time >= BookCD and HeroTower_OtherCDTime[Hour] ~= nil and BookNum < HeroTower_OtherCDTime[Hour].MaxNum then
				BookCD = Time + 1800
				API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 62, BookCD)
				BookNum = BookNum + 1
				API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 63, BookNum)
				local Tab2 = {88591,88592,88593,88595,88596,88597,88599,88600,88601,}
				local GoodsID = Tab2[math.random(table.getn(Tab2))]
				local GoodsNum = 1
				API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,'英雄之塔BOSS奖励',0,KillerID,180,180)
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..API_GetActorName(KillerID)..'战胜英雄之塔BOSS获得：'..API_GetGoodsName(GoodsID)..'！')
			end
		end
	end
end
--精英怪死亡触发器
function HeroTower_JYDieFunc(a,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if not API_MapIsValid(MapID) then
		return
	end
	local KillNum = API_VarDataGetNumber(KillerID,1,12747)
	local JYNum = math.floor(KillNum/100)
	local BossNum = math.mod(KillNum,100)
	JYNum = JYNum + 1
	KillNum = JYNum * 100 + BossNum
	API_VarDataSetNumber(KillerID,1,12747,KillNum)
	--API_ActorSendMsg(KillerID,10,'已杀死'..JYNum..'个精英怪')
	API_ActorBroadcastMsgEx(MapID, -1, 0, 10, '['..API_GetActorName(KillerID)..']消灭['..API_GetMonsterNameByID(MonsterID)..']，本次挑战共消灭了'..JYNum..'个精英怪')
	for i = 1,5 do
		API_CreateDropGoods(MapID,PosX,PosY,80498,30,1,'英雄塔精英掉落',4,0,600,120)
	end
	for i = 1,2 do
		API_CreateDropGoods(MapID,PosX,PosY,80696,20,1,'英雄塔精英掉落',4,0,600,120)
	end
	local TeamID = API_GetTeamID(KillerID)
	if TeamID > 0 then
		local RD = math.random(100)
		local Tab = {}
		local PD = 0
		local TeamSize = API_GetTeamSize(TeamID)
		for i = 1,TeamSize do
			local TeamActorID = API_GetTeamMem(TeamID,i)
			if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID then
				local PlayNum = API_VarDataGetNumber(TeamActorID,1,12742)
				if PlayNum <= HeroTower_ToRewardNum then
					table.insert(Tab,TeamActorID)
					PD = 1
				end
			end
		end
		if PD == 1 then
			local ShiQuID = Tab[math.random(table.getn(Tab))]
			local EquipmentID = YXD_WorldDropGoodsTab[5][math.random(table.getn(YXD_WorldDropGoodsTab[5]))]
			local PinZhi = 2
			if RD <= 2 then
				local Num = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 59)
				if Num < 100 then
					Num = Num + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 59, Num)
					PinZhi = 7
				end
			end
			API_CreateDropGoodsEx(MapID,PosX,PosY,EquipmentID,1,1,'英雄塔精英奖励',4,ShiQuID,180,180,PinZhi)
--~ 			if PinZhi == 7 then
--~ 				API_ActorBroadcastMsg(MapID,1,''..API_GetActorName(ShiQuID)..'获得了高附加属性的'..API_GetGoodsName(EquipmentID)..'')
--~ 			end
		end
	else
		local PlayNum = API_VarDataGetNumber(KillerID,1,12742)
		if PlayNum <= HeroTower_ToRewardNum then
			local RD = math.random(100)
			local EquipmentID = YXD_WorldDropGoodsTab[5][math.random(table.getn(YXD_WorldDropGoodsTab[5]))]
			local PinZhi = 2
			if RD <= 2 then
				local Num = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 59)
				if Num < 100 then
					Num = Num + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 59, Num)
					PinZhi = 7
				end
			end
			API_CreateDropGoodsEx(MapID,PosX,PosY,EquipmentID,1,1,'英雄塔精英奖励',4,KillerID,180,180,PinZhi)
		end
	end
end

--传送到塔内
function HeroTower_GotoObjectMapID(ObjectMapID,ActorID)
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorIsOnline(ActorID) then
		local MapID = API_GetActorMapID(ActorID)
		local MapLv = API_GetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.level)
		local x,y = HeroTowerMapID[MapLv].InX,HeroTowerMapID[MapLv].InY
		API_ActorGoToMap(ActorID,ObjectMapID,x,y)
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 and API_GetTeamLeader(TeamID) == ActorID then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID and TeamActorID ~= ActorID and API_VarDataGetNumber(TeamActorID,1,101) == 0 and API_VarDataGetNumber(TeamActorID,1,102) == 0 and not API_ActorFindStatus(TeamActorID,519) and not API_ActorIsDying(TeamActorID) and API_VarDataGetNumber(TeamActorID,1,11816) == 0 then
					API_ActorGoToMap(TeamActorID,ObjectMapID,x,y)
				end
			end
		end
	end
end

HeroTower_MonsterSay = {'别怕，我来帮你','#65我来了！','#32团队才是王道','#60进攻！战斗！','#45我们是不会输的',}
--地图内全局触发器
function HeroTower_TimerTriggerGFunc(ObjectMapID,b)
	local TimerTriggerID = API_GetCurTriggerID()
	if not API_MapIsValid(ObjectMapID) then
		HeroTowerMapTable[ObjectMapID] = nil
		API_DestroyTriggerG(TimerTriggerID)
		return
	end
	--地图内4号位置通告
	--判断boss是否全部死完
	--打完删除触发器，存地图秒数信息
	local MapLv = API_GetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.level)
	local CountDown = API_GetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.CountDown)
	local Min = math.floor(CountDown/60)
	local Sec = math.mod(CountDown,60)
	local DiePD = 0
	local KillID = 0
	for j in HeroTowerMapTable[ObjectMapID] do
		local FastID = j
		if API_GetMonsterID(FastID) > 0 then
			DiePD = 1
			local TarID = API_GetCurEmenyByMonster(FastID)
			if API_GetThingClass(TarID) == 0 then
				KillID = API_GetThingActiveID(TarID)
				break
			end
		end
	end
	local abc = 60 - MapLv
	if math.mod(CountDown,abc) == 0 and KillID > 0 and API_ActorIsOnline(KillID) then
		local KillX,KillY = PublicFun_GetActorPosXY(KillID)
		for j in HeroTowerMapTable[ObjectMapID] do
			local FastID = j
			if API_GetMonsterID(FastID) > 0 then
				local TarID = API_GetCurEmenyByMonster(FastID)
				if API_GetThingClass(TarID) == -1 then
					API_MonsterMoveTo(FastID, 1, {KillX,KillY,1})
					local Say = HeroTower_MonsterSay[math.random(table.getn(HeroTower_MonsterSay))]
					API_SendMonsterMsg(FastID, 0, ''..Say..'')
					break
				end
			end
		end
	end
	if DiePD > 0 then
		CountDown = CountDown + 1
		API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.CountDown,CountDown)
		local Info = '第'..PublicFun_ArabianNumberToChineseNumber(MapLv)..'层\n'
		local TimeInfo = '挑战时间：'..Min..'分'..Sec..'秒\n'
		Info = Info..TimeInfo
		API_ActorBroadcastMsg(ObjectMapID,4,Info)
	else
		API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.Winner,1)
		local Info = '第'..PublicFun_ArabianNumberToChineseNumber(MapLv)..'层\n'
		local TimeInfo = '挑战成功\n'
		local GoInfo = '可以挑战下一层了\n'
		if MapLv == HeroTower_CengShu then
			GoInfo = '恭喜你完成所有挑战\n'
			--API_ActorCallBack(ObjectMapID,0,-1,'HeroTower_ToRank')
			API_ActorBroadcastMsg(ObjectMapID,1,'恭喜你完成所有挑战。')
			API_ActorBroadcastMsg(ObjectMapID,17,'恭喜你完成所有挑战。')
		else
			API_ActorBroadcastMsg(ObjectMapID,1,'挑战时间仍然在计时，请尽快进入下一层。')
			--API_ActorBroadcastMsg(ObjectMapID,17,'挑战时间仍然在计时，请尽快进入下一层。')
		end
		Info = Info..TimeInfo..GoInfo
		API_ActorBroadcastMsg(ObjectMapID,4,Info)
		--删除挡路的门
		if HeroTowerDoorTab[ObjectMapID] ~= nil then
			for j in HeroTowerDoorTab[ObjectMapID] do
				local FastID = HeroTowerDoorTab[ObjectMapID][j]
				if API_GetMonsterID(FastID) > 0 then
					API_DestroyMonster(FastID)
					--API_MonsterAddStatus(FastID, 284001, 99999999)
				end
			end
		end
		--创建下一层入口和地图
		local GameNo = API_GetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.Monster)
		local GameTab = HeroTowerMapGame[MapLv][GameNo]
		API_CreateMonster(ObjectMapID,GameTab.GoID,GameTab.GoX,GameTab.GoY,GameTab.GoD,0,-1)
		if MapLv < HeroTower_CengShu then
			--创建下一层的地图信息
			local NewMapID = HeroTowerMapID[MapLv+1].NextMapID
			local NextMapID = API_CreateEctype(NewMapID,0)
			API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.ObjectMapID,NextMapID) --将新地图ID存到本地图的信息里面
			HeroTowerMapTable[NextMapID] = {}
			HeroTowerDoorTab[NextMapID] = {}
			API_SetMapVarData(NextMapID,GLOBAL_MAPVARDATA.level,MapLv+1) --设置第几关
			API_SetMapVarData(NextMapID,GLOBAL_MAPVARDATA.CountDown,CountDown) --延续挑战时间
			local YueJi =API_GetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.Jixian)
			if YueJi > 0 then
				API_SetMapVarData(NextMapID,GLOBAL_MAPVARDATA.Jixian,YueJi)
			end
			HeroTower_Initialization(NextMapID,MapLv+1)
		end
		HeroTowerMapTable[ObjectMapID] = nil
 		HeroTowerDoorTab[ObjectMapID] = nil
		--创建地图内回调的函数给奖励
		API_ActorCallBack(ObjectMapID,0,-1,'HeroTower_ToReward')
		--删除触发器
		API_DestroyTriggerG(TimerTriggerID)
	end
end

--点击下一层入口，判断BOSS是否死完等
function HeroTower_GotoNPC(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
--~ 	if HeroTowerMapTable[MapID] ~= nil then
		local MapLv = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.level)
		local Winer = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Winner)
		local NextMapID = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.ObjectMapID)
		--判断是否能进入下一层
--~ 		local DiePD = 0
--~ 		for j in HeroTowerMapTable[MapID] do
--~ 			local FastID = j
--~ 			if API_GetMonsterID(FastID) > 0 then
--~ 				DiePD = 1
--~ 				break
--~ 			end
--~ 		end
		if Winer == 1 then
			if MapLv == HeroTower_CengShu then
				API_ResponseWrite('<br><text>勇猛的战士，恭喜你完成所有挑战，期待你下次会有更好的成绩。</text><br>')
				API_ResponseWrite('<br><a href="HeroTower_GotoNextMap?1=2">离开此地</a><br>')
			else
				--判断是否队长
				local TeamID = API_GetTeamID(ActorID)
				if TeamID > 0 then
					if API_GetTeamLeader(TeamID) == ActorID then
						API_ResponseWrite('<br><text>已完成挑战，进入下一层吧。</text><br>')
						API_ResponseWrite('<br><a href="HeroTower_GotoNextMap?1=1">进入下一层</a><br>')
					else
						API_ResponseWrite('<br><text>请让队长带队进入下一层。</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
					end
				else
					API_ResponseWrite('<br><text>已完成挑战，进入下一层吧。</text><br>')
					API_ResponseWrite('<br><a href="HeroTower_GotoNextMap?1=1">进入下一层</a><br>')
				end
			end
		else
			API_ResponseWrite('<br><text>还未完成本层挑战，不能进入下一层。</text><br>')
			API_ResponseWrite('<br><a href="HeroTower_GotoNextMap?1=2">我受不了了，我要离开这里</a><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
--~ 	else
--~ 		API_ResponseWrite('<br><text>进入下一层的通道突然坍塌了，看样子你只能出去了……</text><br>')
--~ 		API_ResponseWrite('<br><a href="HeroTower_GotoNextMap?1=2">离开此地</a><br>')
--~ 	end
end
--进入下一层、出去专用
function HeroTower_GotoNextMap()
	local ActorID = API_RequestGetActorID()
	local CampID = API_GetActorCamp(ActorID)
	local XuanZe = API_RequestGetNumber(1)
	if XuanZe == 1 then
		local MapID = API_GetActorMapID(ActorID)
		local MapLv = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.level)
		local Winer = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Winner)
		local CountDown = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.CountDown)
		local NextMapID = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.ObjectMapID)
		--判断能否进入下一层or出去
		if MapLv >= HeroTower_CengShu then
			API_ResponseWrite('<br><text>你不该来这里的……</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		else
--~ 			local DiePD = 0
--~ 			for j in HeroTowerMapTable[MapID] do
--~ 				local FastID = j
--~ 				if API_GetMonsterID(FastID) > 0 then
--~ 					DiePD = 1
--~ 					break
--~ 				end
--~ 			end
			if Winer == 1 then
				if not API_MapIsValid(NextMapID) then
				--判断是否队长
--~ 				local TeamID = API_GetTeamID(ActorID)
--~ 				if TeamID > 0 and API_GetTeamLeader(TeamID) == ActorID then
					--获取下一层的地图ID
					--新建下一层的地图、设置地图信息、创建怪物玩法、建立触发器、传送玩家
					local NewMapID = HeroTowerMapID[MapLv+1].NextMapID
					local ObjectMapID = API_CreateEctype(NewMapID,0)
					API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.ObjectMapID,ObjectMapID) --将新地图ID存到本地图的信息里面
					HeroTowerMapTable[ObjectMapID] = {}
					HeroTowerDoorTab[ObjectMapID] = {}
					API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.level,MapLv+1) --设置第几关
					API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.CountDown,CountDown) --延续挑战时间
					local YueJi =API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Jixian)
					if YueJi > 0 then
						API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.Jixian,YueJi)
					end
					HeroTower_Initialization(ObjectMapID,MapLv+1)
					API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'HeroTower_GotoObjectMapID')
--~ 					HeroTowerMapTable[MapID] = nil
--~ 					HeroTowerDoorTab[MapID] = nil
--~ 				else
--~ 					API_ResponseWrite('<br><text>不要执迷不悟……</text><br>')
--~ 					API_ResponseWrite('<br><a>确定</a><br>')
--~ 				end
				else
					API_CreateTimerTriggerG(NextMapID,ActorID,0,1,'HeroTower_GotoObjectMapID')
				end
			else
				API_ResponseWrite('<br><text>这里不是你该来的……</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	elseif XuanZe == 2 then
		HeroTower_ForTeamLeader(ActorID)
		API_ActorSendMsg(ActorID,4,'')
		API_ActorGoToBackMap(ActorID)
	end
end

function HeroTower_OnLogin(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	for j in HeroTowerMapconfigID do
		if MapConfigID == HeroTowerMapconfigID[j] then
			local MapLv = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.level)
			local YueJi =API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Jixian)
			local ReliveNum = API_VarDataGetNumber(ActorID,1,12743)
			local PlayNum = API_VarDataGetNumber(ActorID,1,12742)
			local PlayLv = API_VarDataGetNumber(ActorID,1,12744)
--~ 			if HeroTower_ReliveNum > ReliveNum then
--~ 				local GiveNum = HeroTower_ReliveNum - ReliveNum
--~ 				if API_ActorGetPackageSize(ActorID) > 0 then
--~ 					API_AddActorGoodsFlag(ActorID, GLOBAL_PresentReliveRoodID, GiveNum, 4, '进塔送十字')
--~ 					API_ActorSendMsg(ActorID,3,'获得塔内专用重生十字章 x '..GiveNum..'')
--~ 				else
--~ 					API_ActorSendMsg(ActorID,10,'背包已满，无法获得专用重生十字章')
--~ 				end
--~ 			end
			if PlayNum > HeroTower_ToRewardNum and (MapLv == 1 or YueJi == MapLv) then
				API_ResponseWrite('<br><text>你今天进入英雄之塔的</text><text color="255,0,0">次数超过 '..PublicFun_ArabianNumberToChineseNumber(HeroTower_ToRewardNum)..'次，将无法获得奖励。</text><br>') 
				API_ResponseWrite('<br><a>确定</a>') 
				API_ResponseFlush(ActorID)
			end
			if PlayLv < 5 and PlayNum <= HeroTower_ToRewardNum and (MapLv == 1 or YueJi == MapLv) then
				local ZBTab = YXD_WorldDropGoodsTab[9]
				local ZB1 = ZBTab[math.random(table.getn(ZBTab))]
				local ZB2 = ZBTab[math.random(table.getn(ZBTab))]
				local ZB3 = ZBTab[math.random(table.getn(ZBTab))]
				API_ResponseWrite('<name>英雄之塔</name>')
				API_ResponseWrite('<win rect="340,80,320,200"></win>')
				API_ResponseWrite('<text>战胜每五层的BOSS有几率获得以下物品，层数越高，获得的几率及额度越大</text>') 
				API_ResponseWrite('<br><text color="255,0,255">    </text><img srcgd="80388" tipgd="80388"><text>、</text><img srcgd="80409" tipgd="80409"><text>、</text><img srcgd="80382" tipgd="80382"><text>、</text><img srcgd="80384" tipgd="80384"><text>、</text><img srcgd="80401" tipgd="80401"><br>') 
				API_ResponseWrite('<br><text>    </text><img srcgd="80397" tipgd="80397"><text>、</text><img srcgd="75" tipgd="75"><text>、</text><text color="255,0,255">四档高附加属性装备</text><br>') 
				API_ResponseWrite('<br><a>关闭</a>')
				API_ResponseFlush(ActorID)
			end
			break
		end
	end
	if API_IsBattleGameServer() then
		return
	end
--~ 	local PlayLv = API_GetActorExpLevel(ActorID)
--~ 	if PlayLv >= 40 then
--~ 		local PlayMapLv = API_VarDataGetNumber(ActorID,1,12744)
--~ 		if PlayMapLv == 0 then
--~ 			API_AddTaskScroll(ActorID,50006,1096,'HeroTower_GuideScroll')
--~ 		end
--~ 	end
end
function HeroTower_OnLogout(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	API_RemoveTaskScroll(ActorID,50006)
	API_RemoveTaskScroll(ActorID,50007)
	for j in HeroTowerMapconfigID do
		if MapConfigID == HeroTowerMapconfigID[j] then
			API_ActorSendMsg(ActorID,4,'')
			HeroTower_ForTeamLeader(ActorID)
			break
		end
	end
end
--进入地图时判断是不是需要给复活
function HeroTower_OnLoginMap(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local StaticMapID = API_GetStaticMapID(MapID)
	local GetTips = API_VarDataGetNumber(ActorID,0,12743)
	if GetTips > 0 then
		if MapID == StaticMapID then
			local HuoDong = 0
			if MapConfigID == 101 and GetTips == 1 then --英雄之塔
				HuoDong = 13
			end
			if GetTips == 2 then --神秘之地
				HuoDong = 3
			elseif GetTips == 3 then --深寒地宫
				HuoDong = 5
			elseif GetTips == 4 then --夺宝奇兵
				HuoDong = 7
			end
			if HuoDong > 0 then
				API_VarDataSetNumber(ActorID,0,12743,0)
--~ 				if MLB_HuoQuMingCi(ActorID,HuoDong,1) > 0 then
--~ 					MLB_Scroll_Select(ActorID,HuoDong,1)
--~ 				elseif MLB_HuoQuMingCi(ActorID,HuoDong,2) > 0 then
--~ 					MLB_Scroll_Select(ActorID,HuoDong,2)
--~ 				else
--~ 					MLB_Scroll_Select(ActorID,HuoDong,1)
--~ 				end
				local oTopList = CRandTopSys:GetList(HuoDong)
				if oTopList ~= nil then
					local tItem = oTopList:GetItemByKey(ActorID)
					if tItem ~= nil then
						local ActorMingCi = tItem.nIndex 
						if ActorMingCi > 0 then
							MLB_Scroll_Select(ActorID,HuoDong)
						end
					end
				end
			end
		end
	end
	for j in HeroTowerMapconfigID do
		if MapConfigID == HeroTowerMapconfigID[j] then
			local MapLv = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.level)
			local YueJi =API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Jixian)
			local ReliveNum = API_VarDataGetNumber(ActorID,1,12743)
			local PlayNum = API_VarDataGetNumber(ActorID,1,12742)
			local PlayLv = API_VarDataGetNumber(ActorID,1,12744)
			if HeroTower_ReliveNum > ReliveNum then
				local GiveNum = HeroTower_ReliveNum - ReliveNum
				if API_ActorGetPackageSize(ActorID) > 0 then
					API_AddActorGoodsFlag(ActorID, GLOBAL_PresentReliveRoodID, GiveNum, 4, '进塔送十字')
					API_ActorSendMsg(ActorID,3,'获得塔内专用重生十字章 x '..GiveNum..'')
				else
					API_ActorSendMsg(ActorID,10,'背包已满，无法获得专用重生十字章')
				end
			end
			if PlayNum > HeroTower_ToRewardNum and (MapLv == 1 or YueJi == MapLv) then
				API_ResponseWrite('<br><text>你今天进入英雄之塔的</text><text color="255,0,0">次数超过 '..PublicFun_ArabianNumberToChineseNumber(HeroTower_ToRewardNum)..'次，将无法获得奖励。</text><br>') 
				API_ResponseWrite('<br><a>确定</a>') 
				API_ResponseFlush(ActorID)
			end
			if PlayLv < 5 and PlayNum <= HeroTower_ToRewardNum and (MapLv == 1 or YueJi == MapLv) then
				local ZBTab = YXD_WorldDropGoodsTab[9]
				local ZB1 = ZBTab[math.random(table.getn(ZBTab))]
				local ZB2 = ZBTab[math.random(table.getn(ZBTab))]
				local ZB3 = ZBTab[math.random(table.getn(ZBTab))]
				API_ResponseWrite('<name>英雄之塔</name>')
				API_ResponseWrite('<win rect="340,80,320,200"></win>')
				API_ResponseWrite('<text>战胜每五层的BOSS有几率获得以下物品，层数越高，获得的几率及额度越大</text>') 
				API_ResponseWrite('<br><text color="255,0,255">    </text><img srcgd="80388" tipgd="80388"><text>、</text><img srcgd="80409" tipgd="80409"><text>、</text><img srcgd="80382" tipgd="80382"><text>、</text><img srcgd="80384" tipgd="80384"><text>、</text><img srcgd="80401" tipgd="80401"><br>') 
				API_ResponseWrite('<br><text>    </text><img srcgd="80397" tipgd="80397"><text>、</text><img srcgd="75" tipgd="75"><text>、</text><text color="255,0,255">四档高附加属性装备</text><br>') 
				API_ResponseWrite('<br><a>关闭</a>')
				API_ResponseFlush(ActorID)
			end
			break
		end
	end
	if API_IsBattleGameServer() then
		return
	end
--~ 	local PlayLv = API_GetActorExpLevel(ActorID)
--~ 	if PlayLv >= 40 then
--~ 		local PlayMapLv = API_VarDataGetNumber(ActorID,1,12744)
--~ 		if PlayMapLv == 0 then
--~ 			API_AddTaskScroll(ActorID,50006,1096,'HeroTower_GuideScroll')
--~ 		end
--~ 	end
end
function HeroTower_OnLogoutMap(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	API_RemoveTaskScroll(ActorID,50006)
	API_RemoveTaskScroll(ActorID,50007)
	for j in HeroTowerMapconfigID do
		if MapConfigID == HeroTowerMapconfigID[j] then
			API_ActorSendMsg(ActorID,4,'')
			API_VarDataSetNumber(ActorID,0,12743,1)
			if API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Winner) == 0 then
				HeroTower_ForTeamLeader(ActorID)
			end
			break
		end
	end
end

--英雄之塔引导卷轴
function HeroTower_GuideScroll()
	local ActorID = API_RequestGetActorID()
	local CampID = API_GetActorCamp(ActorID)
	API_ResponseWrite('<name>英雄之塔</name>')
--~ 	API_ResponseWrite('<win rect="620,400,320,190"></win>')
	API_ResponseWrite('<win rect="620,58,238,470"></win>')
	API_ResponseWrite('<text>真的英雄，敢于直面最强的挑战。</text><br>') 
	API_ResponseWrite('<br><text>拿起你的剑和盾，勇敢的去战斗吧！</text><br>') 
	if CampID == 0 then
		API_ResponseWrite('<br><a mapid="101" x="395" y="564" npcid="12255">前往英雄之塔</a><br>')
	else
		API_ResponseWrite('<br><a mapid="101" x="353" y="522" npcid="12282">前往英雄之塔</a><br>')
	end
	API_ResponseWrite('<br><a href="HeroTower_Watcher?1=4">挑战须知</a><br>')
	API_ResponseWrite('<br><a>关闭</a>')
end

--升级后调用的函数
function HeroTower_GiveInvitation(ActorID)
	local PlayLv = API_GetActorExpLevel(ActorID)
	if PlayLv == 40 then
		local Time = os.time()
		API_VarDataSetNumber(ActorID,1,12746,Time)
		API_SendActorMailEx(ActorID, HeroTower_Invitation, 1, 1, "英雄王的邀请", "勇士，如果你拥有足够的勇气和大无畏的精神，那么，带着这份邀请函和你的战友来月暮草场找我吧，也许，你就是下一个英雄王。")
	end
end

--塔内死亡后回调
--ActorID      : 玩家ID
--RMapID       : 复活目标地图ID
--DMapID       : 死亡时所在的地图ID
--DStaticMapID : 死亡时所在的静态地图ID
--TileX        : 复活目标地点，X坐标
--TileY        : 复活目标地点，Y坐标
function HeroTower_Relive(ActorID,RMapID,DMapID,DStaticMapID,TileX,TileY)
	local MapLv = API_GetMapVarData(DMapID,GLOBAL_MAPVARDATA.level)
	local InX,InY = HeroTowerMapID[MapLv].InX,HeroTowerMapID[MapLv].InY
	local PresentReliveRoodNum = API_ActorGetGoodsNum(ActorID,GLOBAL_PresentReliveRoodID)
	local ReliveNum = API_VarDataGetNumber(ActorID,1,12743)
	ReliveNum = ReliveNum + 1
	API_VarDataSetNumber(ActorID,1,12743,ReliveNum)
	if PresentReliveRoodNum > 0 then
--~ 		API_ActorRemoveGoods(ActorID,GLOBAL_PresentReliveRoodID,1,'复活删除装备1')
--~ 		API_ActorRelive(ActorID,DMapID,InX,InY,-1,-1)
--~ 		API_ActorSendMsg(ActorID,3,'已复活，努力战斗吧！')
--~ 		API_ActorSendMsg(ActorID,3,'5秒后复活，继续努力吧！')
--~ 		API_CreateTimerTrigger(ActorID, 5, 1, -1 , 'HeroTower_OnRelive')
		API_RemoveTaskScroll(ActorID,50007)
		API_AddTaskScroll(ActorID,50007,104105,'HeroTower_ReliveScroll')
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win ntype="1" close="0" rect="530,175,285,289" move="1" alpha="0" balpha="0"></win>')
		API_ResponseWrite('<img src="LuaUse\\Relive.tga" pos="1" x="0" y="0">')
		API_ResponseWrite('<br><br><br><br><text Size="20" color="255,255,0">       你已经死亡</text><br><br><text>       （站起来，不要让我太失望）</text><br><br>')
		API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_YuanDiFuHuo_g.tga" tip="本地图无法使用此功能"><br>')
		API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_GotoBase_u.tga" src2="LuaUse\\button1_GotoBase_l.tga" tip="<text size=\'14\' color=\'0,255,0\'>复活消耗：</text>\n<img sc=\'57040\' frame=\'1\' Delay=\'200\' type=\'2\'>\n重生十字章 X 1" href="HeroTower_ClickRelive?1=1&2='..ActorID..'&3='..DMapID..'&4='..DStaticMapID..'&5='..TileX..'&6='..TileY..'"><br>')
		API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_LiKaiFuKongDao_u.tga" src2="LuaUse\\button1_LiKaiFuKongDao_l.tga" href="HeroTower_ClickRelive?1=2&2='..ActorID..'&3='..DMapID..'&4='..DStaticMapID..'&5='..TileX..'&6='..TileY..'"><br>')
	else
		API_RemoveTaskScroll(ActorID,50007)
		API_AddTaskScroll(ActorID,50007,104105,'HeroTower_ReliveScroll')
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win ntype="1" close="0" rect="530,175,285,289" move="1" alpha="0" balpha="0"></win>')
		API_ResponseWrite('<img src="LuaUse\\Relive.tga" pos="1" x="0" y="0">')
		API_ResponseWrite('<br><br><br><br><text Size="20" color="255,255,0">       你已经死亡</text><br><br><text>       （你真是太让我失望了……）</text><br><br>')
		API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_YuanDiFuHuo_g.tga" tip="本地图无法使用此功能"><br>')
		API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_GotoBase_g.tga"  tip="无法再复活了"><br>')
		API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_LiKaiFuKongDao_u.tga" src2="LuaUse\\button1_LiKaiFuKongDao_l.tga" href="HeroTower_ClickRelive?1=2&2='..ActorID..'&3='..DMapID..'&4='..DStaticMapID..'&5='..TileX..'&6='..TileY..'"><br>')
		API_ActorSendMsg(ActorID,3,'很可惜，挑战失败……')
		--如果这丫是队长，那么就把队长给别人
		HeroTower_ForTeamLeader(ActorID)
	end
	API_ResponseFlush(ActorID)
end
function HeroTower_OnRelive(ActorID,TaskID)
	local MapID = API_GetActorMapID(ActorID)
	local MapLv = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.level)
	local InX = HeroTowerMapID[MapLv].InX
	local InY = HeroTowerMapID[MapLv].InY
	API_ActorRelive(ActorID,MapID,InX,InY,-1,-1)
	API_ActorSendMsg(ActorID,3,'已复活，努力战斗吧！')
end
function HeroTower_ReliveScroll()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local PD = 0
	for j in HeroTowerMapconfigID do
		if MapConfigID == HeroTowerMapconfigID[j] then
			PD = 1
			break
		end
	end
	if PD == 1 then
		local MapLv = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.level)
		local TileX = HeroTowerMapID[MapLv].InX
		local TileY = HeroTowerMapID[MapLv].InY
		local PresentReliveRoodNum = API_ActorGetGoodsNum(ActorID,GLOBAL_PresentReliveRoodID)
		if PresentReliveRoodNum > 0 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win ntype="1" close="0" rect="530,175,285,289" move="1" alpha="0" balpha="0"></win>')
			API_ResponseWrite('<img src="LuaUse\\Relive.tga" pos="1" x="0" y="0">')
			API_ResponseWrite('<br><br><br><br><text Size="20" color="255,255,0">       你已经死亡</text><br><br><text>       （站起来，不要让我太失望）</text><br><br>')
			API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_YuanDiFuHuo_g.tga" tip="本地图无法使用此功能"><br>')
			API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_GotoBase_u.tga" src2="LuaUse\\button1_GotoBase_l.tga" tip="<text size=\'14\' color=\'0,255,0\'>复活消耗：</text>\n<img sc=\'57040\' frame=\'1\' Delay=\'200\' type=\'2\'>\n重生十字章 X 1" href="HeroTower_ClickRelive?1=1&2='..ActorID..'&3='..MapID..'&4='..MapConfigID..'&5='..TileX..'&6='..TileY..'"><br>')
			API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_LiKaiFuKongDao_u.tga" src2="LuaUse\\button1_LiKaiFuKongDao_l.tga" href="HeroTower_ClickRelive?1=2&2='..ActorID..'&3='..MapID..'&4='..MapConfigID..'&5='..TileX..'&6='..TileY..'"><br>')
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win ntype="1" close="0" rect="530,175,285,289" move="1" alpha="0" balpha="0"></win>')
			API_ResponseWrite('<img src="LuaUse\\Relive.tga" pos="1" x="0" y="0">')
			API_ResponseWrite('<br><br><br><br><text Size="20" color="255,255,0">       你已经死亡</text><br><br><text>       （你真是太让我失望了……）</text><br><br>')
			API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_YuanDiFuHuo_g.tga" tip="本地图无法使用此功能"><br>')
			API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_GotoBase_g.tga"  tip="无法再复活了"><br>')
			API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_LiKaiFuKongDao_u.tga" src2="LuaUse\\button1_LiKaiFuKongDao_l.tga" href="HeroTower_ClickRelive?1=2&2='..ActorID..'&3='..MapID..'&4='..MapConfigID..'&5='..TileX..'&6='..TileY..'"><br>')
		end
	else
		API_RemoveTaskScroll(ActorID,50007)
		return
	end
end
function HeroTower_ClickRelive()
	local ActorID = API_RequestGetActorID()
	API_RemoveTaskScroll(ActorID,50007)
	local XuanZe = API_RequestGetNumber(1)
	local DMapID = API_RequestGetNumber(3)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local TileX = API_RequestGetNumber(5)
	local TileY = API_RequestGetNumber(6)
	for j in HeroTowerMapconfigID do
		if MapConfigID == HeroTowerMapconfigID[j] then
			local PresentReliveRoodNum = API_ActorGetGoodsNum(ActorID,GLOBAL_PresentReliveRoodID)
			if XuanZe == 1 then
				if PresentReliveRoodNum > 0 then
					API_ActorRemoveGoods(ActorID,GLOBAL_PresentReliveRoodID,1,'复活删除装备1')
					API_ActorRelive(ActorID,MapID,TileX,TileY,-1,-1)
				else
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<win ntype="1" close="0" rect="530,175,285,289" move="1" alpha="0" balpha="0"></win>')
					API_ResponseWrite('<img src="LuaUse\\Relive.tga" pos="1" x="0" y="0">')
					API_ResponseWrite('<br><br><br><br><text Size="20" color="255,255,0">       你已经死亡</text><br><br><text>       （站起来，不要让我太失望）</text><br><br>')
					API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_YuanDiFuHuo_g.tga" tip="本地图无法使用此功能"><br>')
					API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_GotoBase_u.tga" src2="LuaUse\\button1_GotoBase_l.tga" tip="<text size=\'14\' color=\'0,255,0\'>复活消耗：</text>\n<img sc=\'57040\' frame=\'1\' Delay=\'200\' type=\'2\'>\n重生十字章 X 1" href="HeroTower_ClickRelive?1=1&2='..ActorID..'&3='..DMapID..'&4='..MapConfigID..'&5='..TileX..'&6='..TileY..'"><br>')
					API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_LiKaiFuKongDao_u.tga" src2="LuaUse\\button1_LiKaiFuKongDao_l.tga" href="HeroTower_ClickRelive?1=2&2='..ActorID..'&3='..DMapID..'&4='..MapConfigID..'&5='..TileX..'&6='..TileY..'"><br>')
					API_ResponseFlush(ActorID)
				end
			elseif XuanZe ==  2 then
				API_ActorSendMsg(ActorID,4,'')
				API_ActorRelive(ActorID,-1,-1,-1,-1,-1)
			end
			break
		end
	end
end
--换队长函数
function HeroTower_ForTeamLeader(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local TeamID = API_GetTeamID(ActorID)
	if TeamID > 0 and API_GetTeamLeader(TeamID) == ActorID then
		local TeamSize = API_GetTeamSize(TeamID)
		for i = 1,TeamSize do
			local TeamActorID = API_GetTeamMem(TeamID,i)
			if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID and not API_ActorIsDying(TeamActorID) then
				API_SetCaptain(TeamActorID)
				break
			end
		end
	end
end
--根据层数给奖励，
function HeroTower_ToReward(ActorID)
	local PlayName = API_GetActorName(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapLv = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.level)
	local CountDown = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.CountDown)
	local YueJi =API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Jixian)
	local PlayNum = API_VarDataGetNumber(ActorID,1,12742)
	local PlayLv = API_VarDataGetNumber(ActorID,1,12744)
	local ExploitL = API_GetActorExpLevel(ActorID)
	if PlayNum <= HeroTower_ToRewardNum then
		--以下给奖励
		if ExploitL > 65 then
			ExploitL = 65
		end
		if ExploitL >= HeroTower_NeedExpLv then
			local RewardExp = HeroTower_PlayMapReward[ExploitL]
			RewardExp = math.floor(RewardExp/HeroTower_CengShu) + (math.floor(RewardExp/325) * MapLv)
			local expMax = API_GetExploitInfo(ExploitL,3)
			local expNow = API_GetActorCurExp(ActorID)
			local expAddMax = expMax - expNow
			local PetExp = 0
			if expAddMax >= RewardExp then
				PetExp = RewardExp
				API_ActorAddExp(ActorID,RewardExp,0,'英雄之塔给经验')
				API_ActorSendMsg(ActorID,10,'挑战成功，获得'..RewardExp..'经验')
			elseif expAddMax == 0 then
				API_ActorSendMsg(ActorID,10,'您的经验达到上限，已无法再获得经验，请尽快升级')
			else
				PetExp = expAddMax
				API_ActorAddExp(ActorID,expAddMax,0,'英雄之塔给经验')
				API_ActorSendMsg(ActorID,10,'挑战成功，获得'..expAddMax..'经验')
			end
			local PetLV = API_GetActorConjedPetPropNum(ActorID,2)
			if PetLV ~= -1 then
				local BiLv = 0
				for j in EGuiDeDiXue_PetExpTable do
					local PetMin = EGuiDeDiXue_PetExpTable[j].Min
					local PetMax = EGuiDeDiXue_PetExpTable[j].Max
					if PetLV >= PetMin and PetLV <= PetMax then
						BiLv = EGuiDeDiXue_PetExpTable[j].BiLv
						PetExp = (PetExp * WYL_PetExpBiLv) * BiLv
						break
					end
				end
				if PetExp <= 0 then
					PetExp = 1
				end
				API_ActorAddPetExp(ActorID,PetExp,0,'英雄之塔给宠物加经验')
			end
		end
		if math.mod(MapLv,5) == 0 then
			--给boss奖励
			if HeroTower_BossDieGiveGoods[MapLv] ~= nil then
				local LinShiTab = {}
--~ 				local RewardTab = HeroTower_BossDieGiveGoods[MapLv]
--~ 				for j,v in ipairs(RewardTab) do
--~ 					local RewardGaiLv = math.random(1000000)
--~ 					local GoodsID = v.GoodsID
--~ 					local GoodsNum = v.GoodsNum
--~ 					local GaiLv = v.GaiLv
--~ 					local PinZhi = v.PinZhi
--~ 					if RewardGaiLv <= GaiLv then
--~ 						if GoodsID > 100 then
--~ 							if LinShiTab[GoodsID] == nil then
--~ 								LinShiTab[GoodsID] = {}
--~ 								LinShiTab[GoodsID].GoodsNum = GoodsNum
--~ 								LinShiTab[GoodsID].PinZhi = PinZhi
--~ 							else
--~ 								LinShiTab[GoodsID].GoodsNum = LinShiTab[GoodsID].GoodsNum + GoodsNum
--~ 							end
--~ 							--API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,1,'英雄之塔BOSS奖励',4,0,600,0)
--~ 						else
--~ 							local GoodsTab = v.GoodsTab
--~ 							GoodsID = GoodsTab[math.random(table.getn(GoodsTab))]
--~ 							if LinShiTab[GoodsID] == nil then
--~ 								LinShiTab[GoodsID] = {}
--~ 								LinShiTab[GoodsID].GoodsNum = GoodsNum
--~ 								LinShiTab[GoodsID].PinZhi = PinZhi
--~ 							else
--~ 								LinShiTab[GoodsID].GoodsNum = LinShiTab[GoodsID].GoodsNum + GoodsNum
--~ 							end
--~ 							--API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,1,'英雄之塔BOSS奖励',0,0,600,120,PinZhi)
--~ 						end
--~ 					end
--~ 				end
--~ 				local Time = os.time() 
--~ 				local OtherCD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 60)
--~ 				local OtherNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 61)
--~ 				if Time >= OtherCD and OtherNum < 30 and math.random(100) <= 2 then
--~ 					OtherCD = Time + 1800
--~ 					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 60, OtherCD)
--~ 					OtherNum = OtherNum + 1
--~ 					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 61, OtherNum)
--~ 					local Tab = {[1]={80397,50,},[2]={75,10,},}
--~ 					local Num = math.random(table.getn(Tab))
--~ 					local GoodsID = Tab[Num][1]
--~ 					local GoodsNum = Tab[Num][2]
--~ 					LinShiTab[GoodsID] = {}
--~ 					LinShiTab[GoodsID].GoodsNum = GoodsNum
--~ 					LinShiTab[GoodsID].PinZhi = 0
--~ 				end
				LinShiTab[HeroTower_HeroSoul] = {}
				LinShiTab[HeroTower_HeroSoul].GoodsNum = 1
				LinShiTab[HeroTower_HeroSoul].PinZhi = 0
				for j in LinShiTab do
					local GoodsID = j
					local GoodsNum = LinShiTab[j].GoodsNum
					local PinZhi = LinShiTab[j].PinZhi
					if PinZhi == 0 then
						if API_ActorCanAddGoods(ActorID,GoodsID,GoodsNum,1,0) ~= -1 then
							API_AddActorGoodsFlag(ActorID, GoodsID, GoodsNum, 1, '英雄之塔给奖励')
							API_ActorSendMsg(ActorID,10,'获得挑战奖励：'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'')
						else
							API_SendActorMailByName(PlayName, GoodsID, GoodsNum, 1, '[英雄之塔]奖励', '继续前进吧，希望你越战越勇。')
							API_ActorSendMsg(ActorID,10,'获得挑战奖励：'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'（请到邮箱领取）')
						end
					else
						if API_ActorCanAddGoods(ActorID,GoodsID,GoodsNum,1,0) ~= -1 then
							API_AddActorGoodsFlagEx(ActorID, GoodsID, GoodsNum, PinZhi, 1, '兑换英雄塔奖励', 0)
							API_ActorSendMsg(ActorID,10,'获得挑战奖励：'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'')
						end
					end
				end
			end
			--给英灵之魂
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[50][7][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[50][7][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[50][7][LaiYuan] = GLOBAL_FengXiangBiao_DateList[50][7][LaiYuan] + 1
			end
		end
	end
	if YueJi == 0 then
		if PlayLv < MapLv then
			PlayLv = MapLv
			API_VarDataSetNumber(ActorID,1,12744,PlayLv)
		end
		--计算排名
		--HeroTower_ToRank(ActorID,MapLv,CountDown)
		local KillNum = API_VarDataGetNumber(ActorID,1,12747)
		local JYNum = math.floor(KillNum/100)
		local BossNum = math.mod(KillNum,100)
		local MLBMin = math.floor(CountDown/60)
		if MLBMin < 1 then
			MLBMin = 1
		end
		--API_Trace(ActorID..'，MapLv ='..MapLv..'，MLBMin = '..MLBMin..'，BossNum = '..BossNum..'，JYNum = '..JYNum)
		--周排名
		MLB_DaoJuShiYong(ActorID,13,MapLv,MLBMin,BossNum,JYNum)
		--总排名
		MLB_DaoJuShiYong(ActorID,14,MapLv,MLBMin,BossNum,JYNum)
	end
end

--计算排名
function HeroTower_ToRank(ActorID,MapLv,CountDown)
	local Name = API_GetActorName(ActorID)
	local LinShiTab = {}
	LinShiTab.ID = ActorID 
	LinShiTab.Name = Name 
	LinShiTab.Time = CountDown 
	LinShiTab.Lv = MapLv 
	local TabCD = table.getn(HeroTowerRank)
	if TabCD == 0 then
		table.insert(HeroTowerRank,LinShiTab)
		HeroTowerPlayRank[ActorID] = LinShiTab
		HeroTowerPlayRank[ActorID].Rank = 1
	else
		if HeroTowerPlayRank[ActorID] == nil then
			local p = TabCD + 1
			for j,v in ipairs(HeroTowerRank) do
				if MapLv > v.Lv then
					p = j
					break
				elseif MapLv == v.Lv and CountDown < v.Time then
					p = j
					break
--~ 				else
--~ 					if CountDown < v.Time then
--~ 						p = j
--~ 						break
--~ 					end
				end
			end
			table.insert(HeroTowerRank,p,LinShiTab)
			HeroTowerPlayRank[ActorID] = LinShiTab
			HeroTowerPlayRank[ActorID].Rank = p
		else
			local Rank = HeroTowerPlayRank[ActorID].Rank
			if MapLv > HeroTowerPlayRank[ActorID].Lv or (MapLv == HeroTowerPlayRank[ActorID].Lv and CountDown < HeroTowerPlayRank[ActorID].Time) then
				if HeroTowerRank[Rank].ActorID == ActorID then
					table.remove(HeroTowerRank,Rank)
				else
					for j,v in ipairs(HeroTowerRank) do
						if v.ActorID == ActorID then
							Rank = j
							break
						end
					end
					table.remove(HeroTowerRank,Rank)
				end
				local p = table.getn(HeroTowerRank) + 1
				for j,v in ipairs(HeroTowerRank) do
					if MapLv > v.Lv then
						p = j
						break
					elseif MapLv == v.Lv and CountDown < v.Time then
						p = j
						break
--~ 					else
--~ 						if CountDown < v.Time then
--~ 							p = j
--~ 							break
--~ 						end
					end
				end
				table.insert(HeroTowerRank,p,LinShiTab)
				HeroTowerPlayRank[ActorID] = LinShiTab
				HeroTowerPlayRank[ActorID].Rank = p
			end
		end
	end
end

function HeroTower_HeroLevel(ActorID)
	local PD = 0
	for i = 1,64 do 
		if API_ActorIsLearnHero(ActorID, i) == true then 
			if epfunc_FH_SkillLvSum(ActorID, i) >= 30 then
				PD = PD + 1
			end
		end 
	end 
	return PD
end

--丢弃物品回调
--返回1表示允许丢弃
function HeroTower_DropInvitation(ActorID,GoodsID,BagType,Loc,High,Low)
	local ExpLv = API_GetActorExpLevel(ActorID)
	if ExpLv >= 40 then
		API_VarDataSetNumber(ActorID,1,12745,1)
	end
	return 1
end
