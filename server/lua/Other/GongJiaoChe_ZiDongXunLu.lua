--文件名:	Scp\LUA\Other\GongJiaoChe_ZiDongXunLu.lua
--版  权:	(C) 深圳网域计算机网络有限公司
--创建人:	谭明礼
--日  期:	2009-4-30
--版  本:	1.0
--描  述:	地表交通系统
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 谭明礼
--日  期: 2009-4-30
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------
--726001 变身、加速、无敌状态ID
--11816 存储是否正在用交通工具
--11810 存储是否激活站牌
--11811 存储开始时间
--11812 存储剩余时间
--11813 存储开始地图ID和目标地图ID   （开始地图ID*10000 + 目标地图ID）
--11814 存储时间触发器ID
--11815 存储时间回调次数
--公交车卷轴ID：60001     图标ID(Icon)：104103

--前面是公交车站牌ID，后面是序号
GongJiaoChe_LBNPCIDTable = {
	[12012] = 1,
	[12013] = 2,
	[12014] = 3,
	[12203] = 4,--联邦车站
	[12205] = 5,--魔幻镇车站
	--[12370] = 6,--联邦2档资源采集区
	--[12371] = 7,--联邦3档资源采集区
	
}

GongJiaoChe_DGNPCIDTable = {
	[12015] = 1,
	[12016] = 2,
	[12017] = 3,
	[12202] = 4,--帝国车站
	[12204] = 5,--幻影镇车站
	--[12372] = 6,--帝国2档资源采集区
	--[12373] = 7,--帝国3档资源采集区
}

GongJiaoChe_NPCCampTable = {
	[12012] = 1,
	[12013] = 1,
	[12014] = 1,
	[12203] = 1,
	[12205] = 1,
	[12015] = 0,
	[12016] = 0,
	[12017] = 0,
	[12202] = 0,
	[12204] = 0,
	[12365] = 1,
	[12366] = 0,
	--[12370] = 1,
	--[12371] = 1,
--	[12372] = 0,
	--[12373] = 0,
	

}

GongJiaoChe_LBMapTable = {
	[91] = {
		[1] = {MapID=25,Money=20,ShunYiMoney=100,NPCID=12012,X=169,Y=314,LeiBie='水晶币',GongJiaoChe_Time=90,LV=0},
		[2] = {MapID=10,Money=60,ShunYiMoney=400,NPCID=12013,X=133,Y=294,LeiBie='水晶币',GongJiaoChe_Time=90,LV=11},
		[3] = {MapID=98,Money=20,ShunYiMoney=150,NPCID=12014,X=349,Y=381,LeiBie='金币',GongJiaoChe_Time=120,LV=16},
		[4] = {MapID=102,Money=300,ShunYiMoney=1800,NPCID=12203,X=537,Y=340,LeiBie='金币',GongJiaoChe_Time=240,LV=26},
		[5] = {MapID=111,Money=400,ShunYiMoney=2500,NPCID=12205,X=356,Y=197,LeiBie='金币',GongJiaoChe_Time=360,LV=36},
		},
	[25] = {
		[1] = {MapID=91,Money=20,ShunYiMoney=100,NPCID=12365,X=121,Y=78,LeiBie='水晶币',GongJiaoChe_Time=60,LV=0},
		[2] = {MapID=10,Money=60,ShunYiMoney=300,NPCID=12013,X=133,Y=294,LeiBie='水晶币',GongJiaoChe_Time=90,LV=11},
		[3] = {MapID=98,Money=20,ShunYiMoney=100,NPCID=12014,X=349,Y=381,LeiBie='金币',GongJiaoChe_Time=120,LV=16},
		[4] = {MapID=102,Money=300,ShunYiMoney=1500,NPCID=12203,X=537,Y=340,LeiBie='金币',GongJiaoChe_Time=240,LV=26},
		[5] = {MapID=111,Money=400,ShunYiMoney=2000,NPCID=12205,X=356,Y=197,LeiBie='金币',GongJiaoChe_Time=360,LV=36},
		},
	[10] = {
		[1] = {MapID=91,Money=80,ShunYiMoney=400,NPCID=12365,X=121,Y=78,LeiBie='水晶币',GongJiaoChe_Time=60,LV=0},
		[2] = {MapID=25,Money=60,ShunYiMoney=300,NPCID=12012,X=169,Y=314,LeiBie='水晶币',GongJiaoChe_Time=90,LV=0},
		[3] = {MapID=98,Money=10,ShunYiMoney=50,NPCID=12014,X=349,Y=381,LeiBie='金币',GongJiaoChe_Time=90,LV=16},
		[4] = {MapID=102,Money=200,ShunYiMoney=1000,NPCID=12203,X=537,Y=340,LeiBie='金币',GongJiaoChe_Time=240,LV=26},
		[5] = {MapID=111,Money=300,ShunYiMoney=1500,NPCID=12205,X=356,Y=197,LeiBie='金币',GongJiaoChe_Time=330,LV=36},
		},
	[98] = {
		[1] = {MapID=91,Money=30,ShunYiMoney=150,NPCID=12365,X=121,Y=78,LeiBie='金币',GongJiaoChe_Time=60,LV=0},
		[2] = {MapID=25,Money=20,ShunYiMoney=100,NPCID=12012,X=169,Y=314,LeiBie='金币',GongJiaoChe_Time=120,LV=0},
		[3] = {MapID=10,Money=10,ShunYiMoney=50,NPCID=12013,X=133,Y=294,LeiBie='金币',GongJiaoChe_Time=90,LV=0},
		[4] = {MapID=102,Money=100,ShunYiMoney=500,NPCID=12203,X=537,Y=340,LeiBie='金币',GongJiaoChe_Time=120,LV=26},
		[5] = {MapID=111,Money=200,ShunYiMoney=1000,NPCID=12205,X=356,Y=197,LeiBie='金币',GongJiaoChe_Time=210,LV=36},
		},
	[102] = {
		[1] = {MapID=91,Money=350,ShunYiMoney=1800,NPCID=12365,X=121,Y=78,LeiBie='金币',GongJiaoChe_Time=60,LV=0},
		[2] = {MapID=25,Money=300,ShunYiMoney=1500,NPCID=12012,X=169,Y=314,LeiBie='金币',GongJiaoChe_Time=240,LV=0},
		[3] = {MapID=10,Money=200,ShunYiMoney=1000,NPCID=12013,X=133,Y=294,LeiBie='金币',GongJiaoChe_Time=240,LV=0},
		[4] = {MapID=98,Money=100,ShunYiMoney=500,NPCID=12014,X=349,Y=381,LeiBie='金币',GongJiaoChe_Time=120,LV=0},
		[5] = {MapID=111,Money=100,ShunYiMoney=500,NPCID=12205,X=356,Y=197,LeiBie='金币',GongJiaoChe_Time=90,LV=36},
		},
	[111] = {
		[1] = {MapID=91,Money=500,ShunYiMoney=2500,NPCID=12365,X=121,Y=78,LeiBie='金币',GongJiaoChe_Time=60,LV=0},
		[2] = {MapID=25,Money=400,ShunYiMoney=2000,NPCID=12012,X=169,Y=314,LeiBie='金币',GongJiaoChe_Time=360,LV=0},
		[3] = {MapID=10,Money=300,ShunYiMoney=1500,NPCID=12013,X=133,Y=294,LeiBie='金币',GongJiaoChe_Time=330,LV=0},
		[4] = {MapID=98,Money=200,ShunYiMoney=1000,NPCID=12014,X=349,Y=381,LeiBie='金币',GongJiaoChe_Time=210,LV=0},
		[5] = {MapID=102,Money=100,ShunYiMoney=500,NPCID=12203,X=537,Y=340,LeiBie='金币',GongJiaoChe_Time=90,LV=0},
		},
}

GongJiaoChe_DGMapTable = {
	[91] = {
		[1] = {MapID=9,Money=20,ShunYiMoney=100,NPCID=12015,X=141,Y=386,LeiBie='水晶币',GongJiaoChe_Time=90,LV=0},
		[2] = {MapID=23,Money=60,ShunYiMoney=400,NPCID=12016,X=150,Y=336,LeiBie='水晶币',GongJiaoChe_Time=90,LV=11},
		[3] = {MapID=99,Money=20,ShunYiMoney=150,NPCID=12017,X=362,Y=385,LeiBie='金币',GongJiaoChe_Time=120,LV=16},
		[4] = {MapID=102,Money=300,ShunYiMoney=1800,NPCID=12202,X=636,Y=790,LeiBie='金币',GongJiaoChe_Time=240,LV=26},
		[5] = {MapID=111,Money=400,ShunYiMoney=2500,NPCID=12204,X=233,Y=482,LeiBie='金币',GongJiaoChe_Time=360,LV=36},
		},
	[9] = {
		[1] = {MapID=91,Money=20,ShunYiMoney=100,NPCID=12366,X=133,Y=78,LeiBie='水晶币',GongJiaoChe_Time=60,LV=0},
		[2] = {MapID=23,Money=60,ShunYiMoney=300,NPCID=12016,X=150,Y=336,LeiBie='水晶币',GongJiaoChe_Time=90,LV=11},
		[3] = {MapID=99,Money=20,ShunYiMoney=100,NPCID=12017,X=362,Y=385,LeiBie='金币',GongJiaoChe_Time=120,LV=16},
		[4] = {MapID=102,Money=300,ShunYiMoney=1500,NPCID=12202,X=636,Y=790,LeiBie='金币',GongJiaoChe_Time=240,LV=26},
		[5] = {MapID=111,Money=400,ShunYiMoney=2000,NPCID=12204,X=233,Y=482,LeiBie='金币',GongJiaoChe_Time=360,LV=36},
		},
	[23] = {
		[1] = {MapID=91,Money=80,ShunYiMoney=400,NPCID=12366,X=133,Y=78,LeiBie='水晶币',GongJiaoChe_Time=60,LV=0},
		[2] = {MapID=9,Money=60,ShunYiMoney=300,NPCID=12015,X=141,Y=386,LeiBie='水晶币',GongJiaoChe_Time=90,LV=0},
		[3] = {MapID=99,Money=10,ShunYiMoney=50,NPCID=12017,X=362,Y=385,LeiBie='金币',GongJiaoChe_Time=90,LV=16},
		[4] = {MapID=102,Money=200,ShunYiMoney=1000,NPCID=12202,X=636,Y=790,LeiBie='金币',GongJiaoChe_Time=240,LV=26},
		[5] = {MapID=111,Money=300,ShunYiMoney=1500,NPCID=12204,X=233,Y=482,LeiBie='金币',GongJiaoChe_Time=330,LV=36},
		},
	[99] = {
		[1] = {MapID=91,Money=30,ShunYiMoney=150,NPCID=12366,X=133,Y=78,LeiBie='金币',GongJiaoChe_Time=60,LV=0},
		[2] = {MapID=9,Money=20,ShunYiMoney=100,NPCID=12015,X=141,Y=386,LeiBie='金币',GongJiaoChe_Time=120,LV=0},
		[3] = {MapID=23,Money=10,ShunYiMoney=50,NPCID=12016,X=150,Y=336,LeiBie='金币',GongJiaoChe_Time=90,LV=0},
		[4] = {MapID=102,Money=100,ShunYiMoney=500,NPCID=12202,X=636,Y=790,LeiBie='金币',GongJiaoChe_Time=120,LV=26},
		[5] = {MapID=111,Money=200,ShunYiMoney=1000,NPCID=12204,X=233,Y=482,LeiBie='金币',GongJiaoChe_Time=210,LV=36},
		},
	[102] = {
		[1] = {MapID=91,Money=350,ShunYiMoney=1800,NPCID=12366,X=133,Y=78,LeiBie='金币',GongJiaoChe_Time=60,LV=0},
		[2] = {MapID=9,Money=300,ShunYiMoney=1500,NPCID=12015,X=141,Y=386,LeiBie='金币',GongJiaoChe_Time=240,LV=0},
		[3] = {MapID=23,Money=200,ShunYiMoney=1000,NPCID=12016,X=150,Y=336,LeiBie='金币',GongJiaoChe_Time=240,LV=0},
		[4] = {MapID=99,Money=100,ShunYiMoney=500,NPCID=12017,X=362,Y=385,LeiBie='金币',GongJiaoChe_Time=120,LV=0},
		[5] = {MapID=111,Money=100,ShunYiMoney=500,NPCID=12204,X=233,Y=482,LeiBie='金币',GongJiaoChe_Time=90,LV=36},
		},
	[111] = {
		[1] = {MapID=91,Money=500,ShunYiMoney=2500,NPCID=12366,X=133,Y=78,LeiBie='金币',GongJiaoChe_Time=60,LV=0},
		[2] = {MapID=9,Money=400,ShunYiMoney=2000,NPCID=12015,X=141,Y=386,LeiBie='金币',GongJiaoChe_Time=360,LV=0},
		[3] = {MapID=23,Money=300,ShunYiMoney=1500,NPCID=12016,X=150,Y=336,LeiBie='金币',GongJiaoChe_Time=330,LV=0},
		[4] = {MapID=99,Money=200,ShunYiMoney=1000,NPCID=12017,X=362,Y=385,LeiBie='金币',GongJiaoChe_Time=210,LV=0},
		[5] = {MapID=102,Money=100,ShunYiMoney=500,NPCID=12202,X=636,Y=790,LeiBie='金币',GongJiaoChe_Time=90,LV=0},
		},
}

GongJiaoChe_Location_table = {
	[1] = {MapID=25,X=169,Y=314,Name='[圣石镇]车站',ID=992184},
	[2] = {MapID=10,X=133,Y=294,Name='[珊瑚镇]车站',ID=992185},
	[3] = {MapID=98,X=349,Y=381,Name='[幻晶镇]车站',ID=992186},
	[4] = {MapID=9,X=141,Y=386,Name='[迷雾镇]车站',ID=992187},
	[5] = {MapID=23,X=150,Y=336,Name='[火炬村]车站',ID=992188},
	[6] = {MapID=99,X=362,Y=385,Name='[落日镇]车站',ID=992189},
	[7] = {MapID=102,X=537,Y=340,Name='[联邦]车站',ID=992190},
	[8] = {MapID=102,X=636,Y=790,Name='[帝国]车站',ID=992191},
	[9] = {MapID=111,X=356,Y=197,Name='[魔幻镇]车站',ID=992192},
	[10] = {MapID=111,X=233,Y=482,Name='[幻影镇]车站',ID=992193},
	[11] = {MapID=91,X=121,Y=78,Name='[英雄大厅]联邦车站',ID=992194},
	[12] = {MapID=91,X=133,Y=78,Name='[英雄大厅]帝国车站',ID=992195},
}

--创建公交站牌（目前帝国三个，联邦三个）
if API_GetServerID() == 1 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
	if GJC_NPCFastID_SSZ ~= nil then
		if API_GetMonsterID(GJC_NPCFastID_SSZ) > 0 then
			API_DestroyMonster(GJC_NPCFastID_SSZ)
		end
	end
	GJC_NPCFastID_SSZ = API_CreateMonsterEx(25,12012,168,319,5,0,-1,1)
	API_MonsterAddStatus(GJC_NPCFastID_SSZ,726001,0)
	if GJC_NPCFastID_SHZ ~= nil then
		if API_GetMonsterID(GJC_NPCFastID_SHZ) > 0 then
			API_DestroyMonster(GJC_NPCFastID_SHZ)
		end
	end
	GJC_NPCFastID_SHZ = API_CreateMonsterEx(10,12013,129,296,3,0,-1,1)
	API_MonsterAddStatus(GJC_NPCFastID_SHZ,726001,0)
	if GJC_NPCFastID_MWZ ~= nil then
		if API_GetMonsterID(GJC_NPCFastID_MWZ) > 0 then
			API_DestroyMonster(GJC_NPCFastID_MWZ)
		end
	end
	GJC_NPCFastID_MWZ = API_CreateMonsterEx(9,12015,140,389,5,0,-1,1)
	API_MonsterAddStatus(GJC_NPCFastID_MWZ,726001,0)
	if GJC_NPCFastID_HJC ~= nil then
		if API_GetMonsterID(GJC_NPCFastID_HJC) > 0 then
			API_DestroyMonster(GJC_NPCFastID_HJC)
		end
	end
	GJC_NPCFastID_HJC = API_CreateMonsterEx(23,12016,151,338,3,0,-1,1)
	API_MonsterAddStatus(GJC_NPCFastID_HJC,726001,0)
	API_SetMonsterName(GJC_NPCFastID_SSZ,"[圣石镇]车站",1)
	API_SetMonsterName(GJC_NPCFastID_SHZ,"[珊瑚镇]车站",1)
	API_SetMonsterName(GJC_NPCFastID_MWZ,"[迷雾镇]车站",1)
	API_SetMonsterName(GJC_NPCFastID_HJC,"[火炬村]车站",1)
end

if API_GetServerID() == 1 then
	if GJC_NPCFastID_HJZ ~= nil then
		if API_GetMonsterID(GJC_NPCFastID_HJZ) > 0 then
			API_DestroyMonster(GJC_NPCFastID_HJZ)
		end
	end
	GJC_NPCFastID_HJZ = API_CreateMonsterEx(98,12014,348,384,5,0,-1,1)
	API_MonsterAddStatus(GJC_NPCFastID_HJZ,726001,0)
	API_SetMonsterName(GJC_NPCFastID_HJZ,"[幻晶镇]车站",1)
end

if API_GetServerID() == 1 then
	if GJC_NPCFastID_LRZ ~= nil then
		if API_GetMonsterID(GJC_NPCFastID_LRZ) > 0 then
			API_DestroyMonster(GJC_NPCFastID_LRZ)
		end
	end
	GJC_NPCFastID_LRZ = API_CreateMonsterEx(99,12017,360,384,3,0,-1,1)
	API_MonsterAddStatus(GJC_NPCFastID_LRZ,726001,0)
	API_SetMonsterName(GJC_NPCFastID_LRZ,"[落日镇]车站",1)
	if GJC_NPCFastID_HYZ ~= nil then
		if API_GetMonsterID(GJC_NPCFastID_HYZ) > 0 then
			API_DestroyMonster(GJC_NPCFastID_HYZ)
		end
	end
	GJC_NPCFastID_HYZ = API_CreateMonsterEx(111,12204,231,478,3,0,-1,1)
	API_MonsterAddStatus(GJC_NPCFastID_HYZ,726001,0)
	API_SetMonsterName(GJC_NPCFastID_HYZ,"[幻影镇]车站",1)
	if GJC_NPCFastID_MHZ ~= nil then
		if API_GetMonsterID(GJC_NPCFastID_MHZ) > 0 then
			API_DestroyMonster(GJC_NPCFastID_MHZ)
		end
	end
	GJC_NPCFastID_MHZ = API_CreateMonsterEx(111,12205,361,197,5,0,-1,1)
	API_MonsterAddStatus(GJC_NPCFastID_MHZ,726001,0)
	API_SetMonsterName(GJC_NPCFastID_MHZ,"[魔幻镇]车站",1)
end

if API_GetServerID() == 1 then
	if GJC_NPCFastID_DGCZ ~= nil then
		if API_GetMonsterID(GJC_NPCFastID_DGCZ) > 0 then
			API_DestroyMonster(GJC_NPCFastID_DGCZ)
		end
	end
	GJC_NPCFastID_DGCZ = API_CreateMonsterEx(102,12202,632,793,5,0,-1,1)
	API_MonsterAddStatus(GJC_NPCFastID_DGCZ,726001,0)
	API_SetMonsterName(GJC_NPCFastID_DGCZ,"[帝国]车站",1)
	if GJC_NPCFastID_LBCZ ~= nil then
		if API_GetMonsterID(GJC_NPCFastID_LBCZ) > 0 then
			API_DestroyMonster(GJC_NPCFastID_LBCZ)
		end
	end
	GJC_NPCFastID_LBCZ = API_CreateMonsterEx(102,12203,542,337,5,0,-1,1)
	API_MonsterAddStatus(GJC_NPCFastID_LBCZ,726001,0)
	API_SetMonsterName(GJC_NPCFastID_LBCZ,"[联邦]车站",1)
	--英雄大厅
	if GJC_NPCFastID_DGXYDT ~= nil then
		if API_GetMonsterID(GJC_NPCFastID_DGXYDT) > 0 then
			API_DestroyMonster(GJC_NPCFastID_DGXYDT)
		end
	end
	GJC_NPCFastID_DGXYDT = API_CreateMonsterEx(91,12366,133,72,5,0,-1,1)
	API_MonsterAddStatus(GJC_NPCFastID_DGXYDT,726001,0)
	API_SetMonsterName(GJC_NPCFastID_DGXYDT,"[帝国]车站",1)
	
	if GJC_NPCFastID_LBXYDT ~= nil then
		if API_GetMonsterID(GJC_NPCFastID_LBXYDT) > 0 then
			API_DestroyMonster(GJC_NPCFastID_LBXYDT)
		end
	end
	GJC_NPCFastID_LBXYDT = API_CreateMonsterEx(91,12365,121,72,5,0,-1,1)
	API_MonsterAddStatus(GJC_NPCFastID_LBXYDT,726001,0)
	API_SetMonsterName(GJC_NPCFastID_LBXYDT,"[联邦]车站",1)
end

function GongJiaoChe_ZhanPai(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local Camp = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Playname = API_GetActorName(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local SelectItem2 = API_RequestGetNumber(2)
	local ZhanPaiID = API_VarDataGetNumber(ActorID,0,32711)--获取玩家点击的站牌ID
	local NPCID = NPCID or ZhanPaiID
	local ZhanPaiName = API_GetMonsterNameByID(ZhanPaiID)
	local ShuiJingBiNum = API_ActorGetPropNum(ActorID,208)--获取玩家身上水晶币数量
	local JinBiNum = API_ActorGetPropNum(ActorID,156)--获取玩家身上金币数量
	local PanDuan = API_VarDataGetNumber(ActorID,1,11816)
	local X,Y = PublicFun_GetActorPosXY(ActorID)
	local XY = X * 1000 + Y
	local JiHuo = API_VarDataGetNumber(ActorID,1,11810)
	local ActorLV = API_GetActorExpLevel(ActorID)
	if PanDuan == 1 then
		API_ActorRemoveStatus(ActorID, 726001)
		API_SetCanOpt(ActorID,0)
		API_SetCanOpt(ActorID,1)
		API_RemoveTaskScroll(ActorID,60001)--删除卷轴
		API_VarDataSetNumber(ActorID,1,11816,0)
		API_VarDataSetNumber(ActorID,1,11813,0)
		local TML_ShiJian = API_VarDataGetNumber(ActorID,1,11814)
		if TML_ShiJian ~= 0 then
			API_DestroyTrigger(ActorID,-1, TML_ShiJian)
		end
		API_VarDataSetNumber(ActorID,1,11814,0)
		API_VarDataSetNumber(ActorID,1,11815,0)
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win move="1" rect="400,400,150,110"></win>')
		API_ResponseWrite('<text>你已到达目的地。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return
	end
	local MapTable = {}
	local NPCWZTable = {}
	local ZhanPai_Camp = GongJiaoChe_NPCCampTable[NPCID]
	if Camp == 0 then    --帝国
		MapTable = GongJiaoChe_DGMapTable
		NPCWZTable = GongJiaoChe_DGNPCIDTable
	elseif Camp == 1 then --联邦
		MapTable = GongJiaoChe_LBMapTable
		NPCWZTable = GongJiaoChe_LBNPCIDTable
	end
	if NPCWZTable[NPCID] ~= nil then
		local WeiZhi = NPCWZTable[NPCID]
		local PD = API_DataGetBit(JiHuo,WeiZhi)
		if PD == 0 then
			local JiHuo2 = API_DataSetBit(JiHuo, WeiZhi, 1) 
			API_VarDataSetNumber(ActorID,1,11810,JiHuo2)
		end
	end
	--if MapTable[MapConfigID] == nil then
		if Camp ~= ZhanPai_Camp then
			API_ResponseWrite('<name>'..ZhanPaiName..'</name>')
			API_ResponseWrite('<text>不提供敌对阵营公交服务。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
	--end
	if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
		API_ResponseWrite('<name>'..ZhanPaiName..'</name>')
		API_ResponseWrite('<text>快递中，无法使用公交车！</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		return
	end
	if API_ActorFindStatus(ActorID,519) then
		API_ResponseWrite('<name>'..ZhanPaiName..'</name>')
		API_ResponseWrite('<text>摆摊中，无法使用公交车！</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		return
	end
	if MapConfigID == 121 then
		API_ResponseWrite('<name>'..ZhanPaiName..'</name>')
		API_ResponseWrite('<text>火山岛无法使用公交车！</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		return
	end
	if SelectItem == 1 then
		if MapTable[MapConfigID] ~= nil then
			for i = 1,table.getn(MapTable[MapConfigID]) do
				local MapID2 = MapTable[MapConfigID][i].MapID
				if MapID2 == SelectItem2 then
			--if MapTable[MapConfigID][SelectItem2] ~= nil then
					local Money = MapTable[MapConfigID][i].Money
					local NPCID = MapTable[MapConfigID][i].NPCID
					local X = MapTable[MapConfigID][i].X
					local Y = MapTable[MapConfigID][i].Y
					local LeiBie = MapTable[MapConfigID][i].LeiBie
					local LV = MapTable[MapConfigID][i].LV
					if NPCWZTable[NPCID] ~= nil then
						local WeiZhi = NPCWZTable[NPCID]
						local PD = API_DataGetBit(JiHuo,WeiZhi)
						if PD == 0 and ActorLV < LV then
							API_ResponseWrite('<name>'..ZhanPaiName..'</name>')
							API_ResponseWrite('<text>你还没去过</text><text color="255,0,255">'..API_GetMapName(MapID2)..'</text><text>，需要先去</text><text color="255,0,255">'..API_GetMapName(MapID2)..'</text><text>的村庄激活车站后才能乘坐公交车,或者等级达到</text><text color="255,0,255">'..LV..'级</text><text>就可以直接乘坐，不用去激活车站。</text><br>')
							API_ResponseWrite('<br><text>激活</text><text color="255,0,255">'..API_GetMapName(MapID2)..'</text><text>车站的方法：去</text><text color="255,0,255">'..API_GetMapName(MapID2)..'</text><text>的村庄点击一下车站就能激活该车站。</text><br>')
							API_ResponseWrite('<br><a>我知道了</a><br>')
							return
						end
					end
					if not API_ActorIsDying(ActorID) then
						if LeiBie == '金币' then
							if JinBiNum >= Money then--判断是否有这么多的金币
								--API_CreateTimerTriggerG(ActorID,XY,1,-1,'TML_GuanBiChuangKou')
								API_ResponseWrite('<name></name>')
								API_ResponseWrite('<win move="1" rect="330,400,350,150"></win>')
								API_ResponseWrite('<text>公交车行进途中可以点击屏幕右下角的南瓜车图标选择下车。</text><br>')
								API_ResponseWrite('<br><text color="255,0,255">'..API_GetMapName(MapID)..'-->'..API_GetMapName(MapID2)..'</text>')
								API_ResponseWrite('<text>      </text>')
								API_ResponseWrite('<a mapid="'..MapID2..'" x="'..X..'" y="'..Y..'" npcid="'..NPCID..'" forbidden="1" href="GongJiaoChe_JiaZhuangTai?1=1&2='..MapID2..'" underline="1">出发！</a>')
								API_ResponseWrite('<br><br><a>现在还不想去</a>')
							else
								API_ResponseWrite('<text>你身上的'..LeiBie..'不足，需要'..Money..''..LeiBie..'才能乘坐。</text><br>')
								API_ResponseWrite('<br><a>我知道了</a><br>')
							end
						elseif LeiBie == '水晶币' then
							if ShuiJingBiNum >= Money then--判断是否有这么多的水晶币
								--API_CreateTimerTriggerG(ActorID,XY,1,-1,'TML_GuanBiChuangKou')
								API_ResponseWrite('<name></name>')
								API_ResponseWrite('<win move="1" rect="330,400,350,150"></win>')
								API_ResponseWrite('<text>公交车行进途中可以点击屏幕右下角的南瓜车图标选择下车。</text><br>')
								API_ResponseWrite('<br><text color="255,0,255">'..API_GetMapName(MapID)..'-->'..API_GetMapName(MapID2)..'</text>')
								API_ResponseWrite('<text>      </text>')
								API_ResponseWrite('<a mapid="'..MapID2..'" x="'..X..'" y="'..Y..'" npcid="'..NPCID..'" forbidden="1" href="GongJiaoChe_JiaZhuangTai?1=1&2='..MapID2..'" underline="1">出发！</a>')
								API_ResponseWrite('<br><br><a>现在还不想去</a>')
							else
								API_ResponseWrite('<text>你身上的'..LeiBie..'不足，需要'..Money..''..LeiBie..'才能乘坐。</text><br>')
								API_ResponseWrite('<br><a>我知道了</a><br>')
							end
						end
					else
						API_ResponseWrite('<text>死亡状态无法乘坐公交车！</text><br>')
						API_ResponseWrite('<br><a>我知道了</a><br>')
					end
				end
			end
		end
	elseif SelectItem == 2 then
		if MapTable[MapConfigID] ~= nil then
			for i = 1,table.getn(MapTable[MapConfigID]) do
				local MapID2 = MapTable[MapConfigID][i].MapID
				if MapID2 == SelectItem2 then
					local ShunYiMoney = MapTable[MapConfigID][i].ShunYiMoney
					local NPCID = MapTable[MapConfigID][i].NPCID
					local X = MapTable[MapConfigID][i].X
					local Y = MapTable[MapConfigID][i].Y
					local LeiBie = MapTable[MapConfigID][i].LeiBie
					local LV = MapTable[MapConfigID][i].LV
					if NPCWZTable[NPCID] ~= nil then
						local WeiZhi = NPCWZTable[NPCID]
						local PD = API_DataGetBit(JiHuo,WeiZhi)
						if PD == 0 and ActorLV < LV then
							API_ResponseWrite('<name>'..ZhanPaiName..'</name>')
							API_ResponseWrite('<text>你还没去过</text><text color="255,0,255">'..API_GetMapName(MapID2)..'</text><text>，需要先去</text><text color="255,0,255">'..API_GetMapName(MapID2)..'</text><text>的村庄激活车站后才能使用瞬移服务,或者等级达到</text><text color="255,0,255">'..LV..'级</text><text>就可以直接瞬移，不用去激活车站。</text><br>')
							API_ResponseWrite('<br><text>激活</text><text color="255,0,255">'..API_GetMapName(MapID2)..'</text><text>车站的方法：去</text><text color="255,0,255">'..API_GetMapName(MapID2)..'</text><text>的村庄点击一下车站就能激活该车站。</text><br>')
							API_ResponseWrite('<br><a>我知道了</a><br>')
							return
						end
					end
					if not API_ActorIsDying(ActorID) then
						if LeiBie == '金币' then
							if JinBiNum >= ShunYiMoney then--判断是否有这么多的金币
								--API_CreateTimerTriggerG(ActorID,XY,1,-1,'TML_GuanBiChuangKou')
								API_ResponseWrite('<name></name>')
								API_ResponseWrite('<win move="1" rect="330,400,350,150"></win>')
								API_ResponseWrite('<text>请确认是否要瞬移到以下目的地。</text><br>')
								API_ResponseWrite('<br><text color="255,0,255">'..API_GetMapName(MapID)..'-->'..API_GetMapName(MapID2)..'</text>')
								API_ResponseWrite('<text>      </text>')
								API_ResponseWrite('<a href="GongJiaoChe_ShunYiFuWu?1=1&2='..MapID2..'" underline="1">瞬移过去</a>')
								API_ResponseWrite('<br><br><a>现在还不想去</a>')
							else
								API_ResponseWrite('<text>你身上的'..LeiBie..'不足，需要'..ShunYiMoney..''..LeiBie..'才能瞬移。</text><br>')
								API_ResponseWrite('<br><a>我知道了</a><br>')
							end
						elseif LeiBie == '水晶币' then
							if ShuiJingBiNum >= ShunYiMoney then--判断是否有这么多的水晶币
								--API_CreateTimerTriggerG(ActorID,XY,1,-1,'TML_GuanBiChuangKou')
								API_ResponseWrite('<name></name>')
								API_ResponseWrite('<win move="1" rect="330,400,350,150"></win>')
								API_ResponseWrite('<text>请确认是否要瞬移到以下目的地。</text><br>')
								API_ResponseWrite('<br><text color="255,0,255">'..API_GetMapName(MapID)..'-->'..API_GetMapName(MapID2)..'</text>')
								API_ResponseWrite('<text>      </text>')
								API_ResponseWrite('<a href="GongJiaoChe_ShunYiFuWu?1=1&2='..MapID2..'" underline="1">瞬移过去</a>')
								API_ResponseWrite('<br><br><a>现在还不想去</a>')
							else
								API_ResponseWrite('<text>你身上的'..LeiBie..'不足，需要'..ShunYiMoney..''..LeiBie..'才能瞬移。</text><br>')
								API_ResponseWrite('<br><a>我知道了</a><br>')
							end
						end
					else
						API_ResponseWrite('<text>死亡状态无法进行瞬移！</text><br>')
						API_ResponseWrite('<br><a>我知道了</a><br>')
					end
				end
			end
		end
	else
		API_ResponseWrite('<win rect="120,370,800,270"></win>') 
		API_ResponseWrite('<name>'..ZhanPaiName..'</name>')
		API_ResponseWrite('<text>亲爱的'..Playname..'，你需要乘坐公交车吗？乘坐公交车可以安全、迅速的到达目的地。当然，需要花费一定的金钱。</text><br>')
		API_ResponseWrite('<br><text>需要到达：</text><br>')
		for j = 1,table.getn(MapTable[MapConfigID]) do
		--for j in MapTable[MapConfigID] do
			local MapID = MapTable[MapConfigID][j].MapID
			local Money = MapTable[MapConfigID][j].Money
			local ShunYiMoney = MapTable[MapConfigID][j].ShunYiMoney
			local NPCID = MapTable[MapConfigID][j].NPCID
			local X = MapTable[MapConfigID][j].X
			local Y = MapTable[MapConfigID][j].Y
			local LeiBie = MapTable[MapConfigID][j].LeiBie
			local MapName = API_GetMapName(MapID)
			if MapConfigID == 91 then
				API_ResponseWrite('<br><a href="GongJiaoChe_ZhanPai?1=2&2='..MapID..'">瞬移前往'..string.format("%-13s",MapName)..'</a><text>  花费'..ShunYiMoney..''..LeiBie..'</text><br>')
			else
				if MapID == 91 then
					API_ResponseWrite('<br><a href="GongJiaoChe_ZhanPai?1=2&2='..MapID..'">瞬移前往'..string.format("%-13s",MapName)..'</a><text>  花费'..ShunYiMoney..''..LeiBie..'</text><br>')
				else
				    API_ResponseWrite('<br><a href="GongJiaoChe_ZhanPai?1=2&2='..MapID..'">瞬移前往'..string.format("%-13s",MapName)..'</a><text>  花费'..ShunYiMoney..''..LeiBie..'</text><br>')
				end
			end
		end
		API_ResponseWrite('<br><a>取消</a><br>')
	end
end 

function GongJiaoChe_JuanZhou()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 1 then
		API_CreateTimerTrigger(ActorID,0,1,-1,'GongJiaoChe_StopMove')
		local MapID = API_GetActorMapID(ActorID)
		local X,Y = PublicFun_GetActorPosXY(ActorID)
		API_ActorRemoveStatus(ActorID, 726001)
		API_SetCanOpt(ActorID,0)
		API_SetCanOpt(ActorID,1)
		API_RemoveTaskScroll(ActorID,60001)
		API_VarDataSetNumber(ActorID,1,11816,0)
		API_ActorMoveTo(0,ActorID,1,{X,Y,1})
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win move="1" rect="400,400,150,110"></win>')
		API_ResponseWrite('<text>你已经提前下车。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_VarDataSetNumber(ActorID,1,11813,0)
		local TML_ShiJian = API_VarDataGetNumber(ActorID,1,11814)
		if TML_ShiJian ~= 0 then
			API_DestroyTrigger(ActorID,-1, TML_ShiJian)
		end
		API_VarDataSetNumber(ActorID,1,11814,0)
		API_VarDataSetNumber(ActorID,1,11815,0)
	else
		API_ResponseWrite('<win close="0" move="1" rect="370,470,300,140"></win>')
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<text color="255,0,255">如果公交车在行进途中被卡住了，几十秒后角色会自动被传送到目的地！</text><br>')
		API_ResponseWrite('<br><text>你想中途下车吗？</text><br>')
		API_ResponseWrite('<br><a href="GongJiaoChe_JuanZhou?1=1">中途下车</a>')
		API_ResponseWrite('<text>      </text><a>取消</a>')
	end
end
function GongJiaoChe_OnLoginMap(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local PanDuan = API_VarDataGetNumber(ActorID,1,11816)
	if GongJiaoChe_Location_table ~= nil then
		for i in GongJiaoChe_Location_table do
			local StationMapID = GongJiaoChe_Location_table[i].MapID
			local StationX = GongJiaoChe_Location_table[i].X
			local StationY = GongJiaoChe_Location_table[i].Y
			local StationName = GongJiaoChe_Location_table[i].Name
			local StationID = GongJiaoChe_Location_table[i].ID
			if MapConfigID == StationMapID then
				API_ActorAddMapPoint(ActorID,StationID,MapConfigID,StationX,StationY,3,StationName)
			end
		end
	end
	if MapConfigID ~= 25 and MapConfigID ~= 10 and MapConfigID ~= 98 and MapConfigID ~= 9 and MapConfigID ~= 23 and MapConfigID ~= 99 and MapConfigID ~= 102 and MapConfigID ~= 111 and MapConfigID ~= 101 then
		API_ActorRemoveStatus(ActorID, 726001)
		API_SetCanOpt(ActorID,0)
		API_SetCanOpt(ActorID,1)
		API_RemoveTaskScroll(ActorID,60001)--删除卷轴
		API_VarDataSetNumber(ActorID,1,11816,0)
		API_VarDataSetNumber(ActorID,1,11813,0)
		local TML_ShiJian = API_VarDataGetNumber(ActorID,1,11814)
		if TML_ShiJian ~= 0 then
			API_DestroyTrigger(ActorID,-1, TML_ShiJian)
		end
		API_VarDataSetNumber(ActorID,1,11814,0)
		API_VarDataSetNumber(ActorID,1,11815,0)
		return
	end
	if PanDuan == 1 then
		local TML_ShiJian = API_VarDataGetNumber(ActorID,1,11814)
		if TML_ShiJian ~= 0 then
			API_DestroyTrigger(ActorID,-1, TML_ShiJian)
		end
		TML_ShiJian = API_CreateTimerTrigger(ActorID,1,-1,-1,'GongJiaoChe_TimerTriggerCallFunc')
		API_VarDataSetNumber(ActorID,1,11814,TML_ShiJian)
		LRY_UItwinkemanage(ActorID,1,85,104103,60001,26,'GongJiaoChe_JuanZhou')--加卷轴
		API_CreateTimerTrigger(ActorID,0,1,-1,'GongJiaoChe_ZiDongOpenWindow')
		API_ActorAddStatus(ActorID,726001,0)--增加变身、加速、无敌状态
		API_SetCanOpt(ActorID,0)
	end
end

function GongJiaoChe_OnLogin(ActorID)
	local nType = API_VarDataGetNumber(ActorID, 0, 18368)
	local Camp = API_GetActorCamp(ActorID)
	local JiHuo = API_VarDataGetNumber(ActorID,1,11810)
	local WeiZhi1 = GongJiaoChe_DGNPCIDTable[12015] --帝国
	local WeiZhi2 = GongJiaoChe_LBNPCIDTable[12012] --联邦
	local PD1 = API_DataGetBit(JiHuo,WeiZhi1)
	local PD2 = API_DataGetBit(JiHuo,WeiZhi2)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if GongJiaoChe_Location_table ~= nil then
		for i in GongJiaoChe_Location_table do
			local StationMapID = GongJiaoChe_Location_table[i].MapID
			local StationX = GongJiaoChe_Location_table[i].X
			local StationY = GongJiaoChe_Location_table[i].Y
			local StationName = GongJiaoChe_Location_table[i].Name
			local StationID = GongJiaoChe_Location_table[i].ID
			if MapConfigID == StationMapID then
				API_ActorAddMapPoint(ActorID,StationID,MapConfigID,StationX,StationY,3,StationName)
			end
		end
	end
	if MapConfigID ~= 25 and MapConfigID ~= 10 and MapConfigID ~= 98 and MapConfigID ~= 9 and MapConfigID ~= 23 and MapConfigID ~= 99 and MapConfigID ~= 102 and MapConfigID ~= 111 and MapConfigID ~= 101 then
		API_ActorRemoveStatus(ActorID, 726001)
		API_SetCanOpt(ActorID,0)
		API_SetCanOpt(ActorID,1)
		API_RemoveTaskScroll(ActorID,60001)--删除卷轴
		API_VarDataSetNumber(ActorID,1,11816,0)
		API_VarDataSetNumber(ActorID,1,11813,0)
		local TML_ShiJian = API_VarDataGetNumber(ActorID,1,11814)
		if TML_ShiJian ~= 0 then
			API_DestroyTrigger(ActorID,-1, TML_ShiJian)
		end
		API_VarDataSetNumber(ActorID,1,11814,0)
		API_VarDataSetNumber(ActorID,1,11815,0)
		return
	end
	if Camp == 0 then    --帝国
		if PD1 == 0 then
			local JiHuo2 = API_DataSetBit(JiHuo, WeiZhi1, 1) 
			API_VarDataSetNumber(ActorID,1,11810,JiHuo2)
		end
	elseif Camp == 1 then --联邦
		if PD2 == 0 then
			local JiHuo2 = API_DataSetBit(JiHuo, WeiZhi2, 1) 
			API_VarDataSetNumber(ActorID,1,11810,JiHuo2)
		end
	end
	if nType == 2 then
		if API_VarDataGetNumber(ActorID,1,11815) > 0 then
			local TML_ShiJian = API_VarDataGetNumber(ActorID,1,11814)
			if TML_ShiJian ~= 0 then
				API_DestroyTrigger(ActorID,-1, TML_ShiJian)
			end
			TML_ShiJian = API_CreateTimerTrigger(ActorID,1,-1,-1,'GongJiaoChe_TimerTriggerCallFunc')
			API_VarDataSetNumber(ActorID,1,11814,TML_ShiJian)
			local PanDuan = API_VarDataGetNumber(ActorID,1,11816)
			if PanDuan == 1 then
				LRY_UItwinkemanage(ActorID,1,85,104103,60001,26,'GongJiaoChe_JuanZhou')--加卷轴
				API_CreateTimerTrigger(ActorID,0,1,-1,'GongJiaoChe_ZiDongOpenWindow')
				API_ActorAddStatus(ActorID,726001,0)--增加变身、加速、无敌状态
				API_SetCanOpt(ActorID,0)
			end	
		end
	end
end

function GongJiaoChe_OnLogout(ActorID)
	local nType = API_VarDataGetNumber(ActorID, 0, 18368)
	if nType == 3 then
		API_VarDataSetNumber(ActorID,1,11816,0)
	end
end

function TML_GuanBiChuangKou(ActorID,XY)
	local TriggerID = API_GetCurTriggerID()
	if API_ActorIsOnline(ActorID) then
		local X,Y = PublicFun_GetActorPosXY(ActorID)
		local X2 = math.floor(XY/1000)
		local Y2 = math.mod(XY,1000)
		if X ~= X2 or Y ~= Y2 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win rect="1330,1400,1,1"></win>')
			API_ResponseFlush(ActorID)
			API_DestroyTriggerG(TriggerID)
		end
	else
		API_DestroyTriggerG(TriggerID)
	end
end

function GongJiaoChe_StopMove(ActorID,TaskID)
	API_ActorStopMove(ActorID)
end

function GongJiaoChe_ShunYiFuWu()
	local ActorID = API_RequestGetActorID()
	local Camp = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local SelectItem = API_RequestGetNumber(1)
	local SelectItem2 = API_RequestGetNumber(2)
	local MapTable = {}
	local ShunYiMoney = 0
	local LeiBie = ''
	if Camp == 0 then    --帝国
		MapTable = GongJiaoChe_DGMapTable
	elseif Camp == 1 then --联邦
		MapTable = GongJiaoChe_LBMapTable
	end
	for i = 1,table.getn(MapTable[MapConfigID]) do
		local MapID2 = MapTable[MapConfigID][i].MapID
		if MapID2 == SelectItem2 then
			local ShunYiMoney = MapTable[MapConfigID][i].ShunYiMoney
			local LeiBie = MapTable[MapConfigID][i].LeiBie
			local X = MapTable[MapConfigID][i].X
			local Y = MapTable[MapConfigID][i].Y
			if SelectItem == 1 then
				if not API_ActorIsDying(ActorID) then
					if API_VarDataGetNumber(ActorID,1,11816) == 0 then
						if LeiBie == '金币' then
							if API_ActorGetPropNum(ActorID,156) < ShunYiMoney then
								API_ActorSendMsg(ActorID,3,'金币不足，无法进行瞬移')
								return
							end
							if API_ActorAddMoney(ActorID,-ShunYiMoney,0,'瞬移服务扣除金币') then
								API_ActorSendMsg(ActorID,3,'使用瞬移服务扣除'..ShunYiMoney..''..LeiBie..'')
								API_ActorGoToMap(ActorID,MapID2,X,Y)
								--瞬移服务使用次数
								if GLOBAL_FengXiangBiao_DateList[61][1] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[61][1][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[61][1][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[61][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[61][1][LaiYuan] + 1
									end
								end
								--瞬移消耗的金币
								if GLOBAL_FengXiangBiao_DateList[61][2] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[61][2][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[61][2][LaiYuan] = ShunYiMoney
									else
										GLOBAL_FengXiangBiao_DateList[61][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[61][2][LaiYuan] + ShunYiMoney
									end
								end
							end
						elseif LeiBie == '水晶币' then
							if API_ActorGetPropNum(ActorID,208) < ShunYiMoney then
								API_ActorSendMsg(ActorID,3,'水晶币不足，无法进行瞬移')
								return
							end
							if API_ActorShoppingM_Reduce(ActorID,-ShunYiMoney,0,'瞬移服务扣除水晶币') then
								API_ActorSendMsg(ActorID,3,'使用瞬移服务扣除'..ShunYiMoney..''..LeiBie..'')
								API_ActorGoToMap(ActorID,MapID2,X,Y)
								--瞬移服务使用次数
								if GLOBAL_FengXiangBiao_DateList[61][1] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[61][1][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[61][1][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[61][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[61][1][LaiYuan] + 1
									end
								end
								--瞬移消耗的水晶币
								if GLOBAL_FengXiangBiao_DateList[61][3] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[61][3][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[61][3][LaiYuan] = ShunYiMoney
									else
										GLOBAL_FengXiangBiao_DateList[61][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[61][3][LaiYuan] + ShunYiMoney
									end
								end
							end
						end
					end
				else
					API_ResponseWrite('<text>死亡状态无法使用瞬移服务！</text><br>')
					API_ResponseWrite('<br><a>我知道了</a><br>')
				end
			end
			break
		end
	end
end

function GongJiaoChe_JiaZhuangTai()
	local ActorID = API_RequestGetActorID()
	if API_IsVehicalConjuring(ActorID) then
		API_CreateTimerTrigger(ActorID,0,1,-1,'GongJiaoChe_StopMove')
		API_SetCanOpt(ActorID,0)
		API_SetCanOpt(ActorID,1)
		API_ActorSendMsg(ActorID,3,'使用载具时无法乘坐公交车')
		return
	end
	local Camp = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local SelectItem = API_RequestGetNumber(1)
	local SelectItem2 = API_RequestGetNumber(2)
	local MapTable = {}
	local Money = 0
	local LeiBie = ''
	local GongJiaoChe_Time = 0
	if Camp == 0 then    --帝国
		MapTable = GongJiaoChe_DGMapTable
	elseif Camp == 1 then --联邦
		MapTable = GongJiaoChe_LBMapTable
	end
	for i = 1,table.getn(MapTable[MapConfigID]) do
		local MapID2 = MapTable[MapConfigID][i].MapID
		if MapID2 == SelectItem2 then
			local Money = MapTable[MapConfigID][i].Money
			local LeiBie = MapTable[MapConfigID][i].LeiBie
			local GongJiaoChe_Time = MapTable[MapConfigID][i].GongJiaoChe_Time
			if SelectItem == 1 then
				if not API_ActorIsDying(ActorID) then
					if API_VarDataGetNumber(ActorID,1,11816) == 0 then
						if LeiBie == '金币' then
							if API_ActorGetPropNum(ActorID,156) < Money then
								API_CreateTimerTrigger(ActorID,0,1,-1,'GongJiaoChe_StopMove')
								API_SetCanOpt(ActorID,0)
								API_SetCanOpt(ActorID,1)
								API_ActorSendMsg(ActorID,3,'金币不足，无法乘坐公交车')
								return
							end
							if API_ActorAddMoney(ActorID,-Money,0,'乘坐公交车扣除金币') then
								API_ActorSendMsg(ActorID,3,'乘坐公交车扣除'..Money..''..LeiBie..'')
								API_ActorAddStatus(ActorID,726001,0)--增加变身、加速、无敌状态
								API_VarDataSetNumber(ActorID,1,11816,1)
								LRY_UItwinkemanage(ActorID,1,85,104103,60001,26,'GongJiaoChe_JuanZhou')--加卷轴
								--API_AddTaskScrollEx(ActorID,60001,104103,'GongJiaoChe_JuanZhou',0)--加卷轴
								local TML_ShiJian = API_VarDataGetNumber(ActorID,1,11814)
								if TML_ShiJian ~= 0 then
									API_DestroyTrigger(ActorID,-1, TML_ShiJian)
								end
								TML_ShiJian = API_CreateTimerTrigger(ActorID,1,-1,-1,'GongJiaoChe_TimerTriggerCallFunc')
								API_VarDataSetNumber(ActorID,1,11814,TML_ShiJian)
								local NowTime = os.time()
								local LastTime = API_VarDataSetNumber(ActorID,1,11811,NowTime)
								local NowMapLastMap = MapConfigID * 10000 + MapID2
								API_VarDataSetNumber(ActorID,1,11813,NowMapLastMap)
								API_VarDataSetNumber(ActorID,1,11815,GongJiaoChe_Time)
								GongJiaoChe_ZiDongOpenWindow(ActorID)
								--公交车使用的次数
								if GLOBAL_FengXiangBiao_DateList[61][4] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[61][4][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[61][4][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[61][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[61][4][LaiYuan] + 1
									end
								end
								--公交车消耗的金币
								if GLOBAL_FengXiangBiao_DateList[61][5] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[61][5][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[61][5][LaiYuan] = Money
									else
										GLOBAL_FengXiangBiao_DateList[61][5][LaiYuan] = GLOBAL_FengXiangBiao_DateList[61][5][LaiYuan] + Money
									end
								end
							end
						elseif LeiBie == '水晶币' then
							if API_ActorGetPropNum(ActorID,208) < Money then
								API_CreateTimerTrigger(ActorID,0,1,-1,'GongJiaoChe_StopMove')
								API_SetCanOpt(ActorID,0)
								API_SetCanOpt(ActorID,1)
								API_ActorSendMsg(ActorID,3,'水晶币不足，无法乘坐公交车')
								return
							end
							if API_ActorShoppingM_Reduce(ActorID,-Money,0,'乘坐公交车扣除水晶币') then
								API_ActorSendMsg(ActorID,3,'乘坐公交车扣除'..Money..''..LeiBie..'')
								API_ActorAddStatus(ActorID,726001,0)--增加变身、加速、无敌状态
								API_VarDataSetNumber(ActorID,1,11816,1)
								LRY_UItwinkemanage(ActorID,1,85,104103,60001,26,'GongJiaoChe_JuanZhou')--加卷轴
								--API_AddTaskScrollEx(ActorID,60001,104103,'GongJiaoChe_JuanZhou',0)--加卷轴
								local TML_ShiJian = API_VarDataGetNumber(ActorID,1,11814)
								if TML_ShiJian ~= 0 then
									API_DestroyTrigger(ActorID,-1, TML_ShiJian)
								end
								TML_ShiJian = API_CreateTimerTrigger(ActorID,1,-1,-1,'GongJiaoChe_TimerTriggerCallFunc')
								API_VarDataSetNumber(ActorID,1,11814,TML_ShiJian)
								local NowTime = os.time()
								local LastTime = API_VarDataSetNumber(ActorID,1,11811,NowTime)
								local NowMapLastMap = MapConfigID * 10000 + MapID2
								API_VarDataSetNumber(ActorID,1,11813,NowMapLastMap)
								API_VarDataSetNumber(ActorID,1,11815,GongJiaoChe_Time)
								GongJiaoChe_ZiDongOpenWindow(ActorID)
								--公交车使用的次数
								if GLOBAL_FengXiangBiao_DateList[61][4] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[61][4][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[61][4][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[61][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[61][4][LaiYuan] + 1
									end
								end
								--公交车消耗的水晶币
								if GLOBAL_FengXiangBiao_DateList[61][6] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[61][6][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[61][6][LaiYuan] = Money
									else
										GLOBAL_FengXiangBiao_DateList[61][6][LaiYuan] = GLOBAL_FengXiangBiao_DateList[61][6][LaiYuan] + Money
									end
								end
							end
						end
					end
				else
					API_ResponseWrite('<text>死亡状态无法乘坐公交车！</text><br>')
					API_ResponseWrite('<br><a>我知道了</a><br>')
					API_SetCanOpt(ActorID,0)
					API_SetCanOpt(ActorID,1)
				end
			end
			break
		end
	end
end

function GongJiaoChe_TimerTriggerCallFunc(ActorID,b)
	local TriggerID = API_GetCurTriggerID()
	local HuiDiaoTime = API_VarDataGetNumber(ActorID,1,11815)
	HuiDiaoTime = HuiDiaoTime - 1
	API_VarDataSetNumber(ActorID,1,11815,HuiDiaoTime)
	if HuiDiaoTime == 0 then
		local PanDuan = API_VarDataGetNumber(ActorID,1,11816)
		if PanDuan == 1 then
			local Camp = API_GetActorCamp(ActorID)
			local NowMapLastMap = API_VarDataGetNumber(ActorID,1,11813)
			local NowMap = math.floor(NowMapLastMap/10000)
			local LastMap = math.mod(NowMapLastMap,10000)
			local MapTable = {}
			if Camp == 0 then    --帝国
				MapTable = GongJiaoChe_DGMapTable
			elseif Camp == 1 then --联邦
				MapTable = GongJiaoChe_LBMapTable
			end
			for i = 1,table.getn(MapTable[NowMap]) do
				local MapID =  MapTable[NowMap][i].MapID
				if LastMap == MapID then
					local X = MapTable[NowMap][i].X
					local Y = MapTable[NowMap][i].Y
					if API_ActorGoToMap(ActorID,LastMap,X,Y) then
						API_DestroyTrigger(ActorID,-1,TriggerID)
						API_ActorRemoveStatus(ActorID, 726001)
						API_SetCanOpt(ActorID,0)
						API_SetCanOpt(ActorID,1)
						API_RemoveTaskScroll(ActorID,60001)--删除卷轴
						API_VarDataSetNumber(ActorID,1,11816,0)
						API_VarDataSetNumber(ActorID,1,11813,0)
						local TML_ShiJian = API_VarDataGetNumber(ActorID,1,11814)
						if TML_ShiJian ~= 0 then
							API_DestroyTrigger(ActorID,-1, TML_ShiJian)
						end
						API_VarDataSetNumber(ActorID,1,11814,0)
						API_VarDataSetNumber(ActorID,1,11815,0)
					end
					break
				end
			end
		end
	end
end

function GongJiaoChe_ZiDongOpenWindow(ActorID,b)
	if API_ActorIsOnline(ActorID) then
		API_ResponseWrite('<win close="0" move="1" rect="370,470,300,140"></win>')
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<text color="255,0,255">如果公交车在行进途中被卡住了，几十秒后角色会自动被传送到目的地！</text><br>')
		API_ResponseWrite('<br><text>你想中途下车吗？</text><br>')
		API_ResponseWrite('<br><a href="GongJiaoChe_JuanZhou?1=1">中途下车</a>')
		API_ResponseWrite('<text>      </text><a>取消</a>')
		API_ResponseFlush(ActorID)
	end
end

function GongJiaoChe_JiHuoByLV(ActorID)
	local Camp = API_GetActorCamp(ActorID)
	local JiHuo = API_VarDataGetNumber(ActorID,1,11810)
	local DGWeiZhi1 = GongJiaoChe_DGNPCIDTable[12016] --帝国
	local DGWeiZhi2 = GongJiaoChe_DGNPCIDTable[12017] --帝国
	local DGWeiZhi3 = GongJiaoChe_DGNPCIDTable[12202] --帝国
	local DGWeiZhi4 = GongJiaoChe_DGNPCIDTable[12204] --帝国
	local LBWeiZhi1 = GongJiaoChe_LBNPCIDTable[12013] --联邦
	local LBWeiZhi2 = GongJiaoChe_LBNPCIDTable[12014] --联邦
	local LBWeiZhi3 = GongJiaoChe_LBNPCIDTable[12203] --联邦
	local LBWeiZhi4 = GongJiaoChe_LBNPCIDTable[12205] --联邦
	local DGPD1 = API_DataGetBit(JiHuo,DGWeiZhi1)
	local DGPD2 = API_DataGetBit(JiHuo,DGWeiZhi2)
	local DGPD3 = API_DataGetBit(JiHuo,DGWeiZhi3)
	local DGPD4 = API_DataGetBit(JiHuo,DGWeiZhi4)
	local LBPD1 = API_DataGetBit(JiHuo,LBWeiZhi1)
	local LBPD2 = API_DataGetBit(JiHuo,LBWeiZhi2)
	local LBPD3 = API_DataGetBit(JiHuo,LBWeiZhi3)
	local LBPD4 = API_DataGetBit(JiHuo,LBWeiZhi4)
	local LV = API_GetActorExpLevel(ActorID)
	if Camp == 0 then    --帝国
		if LV == 11 then
			if DGPD1 == 0 then
				local JiHuo2 = API_DataSetBit(JiHuo, DGWeiZhi1, 1) 
				API_VarDataSetNumber(ActorID,1,11810,JiHuo2)
			end
		elseif LV == 16 then
			if DGPD2 == 0 then
				local JiHuo2 = API_DataSetBit(JiHuo, DGWeiZhi2, 1) 
				API_VarDataSetNumber(ActorID,1,11810,JiHuo2)
			end
		elseif LV == 26 then
			if DGPD3 == 0 then
				local JiHuo2 = API_DataSetBit(JiHuo, DGWeiZhi3, 1) 
				API_VarDataSetNumber(ActorID,1,11810,JiHuo2)
			end
		elseif LV == 36 then
			if DGPD4 == 0 then
				local JiHuo2 = API_DataSetBit(JiHuo, DGWeiZhi4, 1) 
				API_VarDataSetNumber(ActorID,1,11810,JiHuo2)
			end
		end
	elseif Camp == 1 then --联邦
		if LV == 11 then
			if LBPD1 == 0 then
				local JiHuo2 = API_DataSetBit(JiHuo, LBWeiZhi1, 1) 
				API_VarDataSetNumber(ActorID,1,11810,JiHuo2)
			end
		elseif LV == 16 then
			if LBPD2 == 0 then
				local JiHuo2 = API_DataSetBit(JiHuo, LBWeiZhi2, 1) 
				API_VarDataSetNumber(ActorID,1,11810,JiHuo2)
			end
		elseif LV == 26 then
			if LBPD3 == 0 then
				local JiHuo2 = API_DataSetBit(JiHuo, LBWeiZhi3, 1) 
				API_VarDataSetNumber(ActorID,1,11810,JiHuo2)
			end
		elseif LV == 36 then
			if LBPD4 == 0 then
				local JiHuo2 = API_DataSetBit(JiHuo, LBWeiZhi4, 1) 
				API_VarDataSetNumber(ActorID,1,11810,JiHuo2)
			end
		end
	end
end
