-- ------------------------------------------------------------------------
-- 任务系统主框架脚本
-- 服务器开启成功后 Main.lua 会自动加载此脚本
-- ------------------------------------------------------------------------
---------------------------------------------------------------------------
--修改记录 
--修改人: 黄蕾
--日  期: 2011-10-13
--描  述: 地图NPC打点显示功能
----------------------------------------------------------------------------

--地图NPC大地图显示表（此表增对功能性NPC）
--{[1]={MapID=25,X=138,Y=312,Name='老镇长贝安',npcID=11821,nCampID=1,ID=100000},}
--{[1]={地图ID ，NPC的X坐标，NPC的y坐标，NPC名字，NPC的fastid,NPC的阵营ID，..}, }
--nCampID= 0,-- 0表示帝国,1表示联邦
--ID,100000开始不能重复
tNPC_Location_table = {
	--麦穗平原（联邦MapID=25）
	[1 ] = {MapID=25,X=138,Y=316,Name='联邦新手商人',npcID=11265,nCampID=1,ID=100000},
	[2 ] = {MapID=25,X=125,Y=305,Name='火爆拉锯大使',npcID=12358,nCampID=1,ID=100001},
	[3 ] = {MapID=25,X=148,Y=303,Name='名师榜'      ,npcID=12055,nCampID=1,ID=100002},
	[4 ] = {MapID=25,X=135,Y=313,Name='战斗技能导师',npcID=11027,nCampID=1,ID=100003},
	[5 ] = {MapID=25,X=128,Y=328,Name='跨岛传送阵'  ,npcID=11226,nCampID=1,ID=100004},
	[6 ] = {MapID=25,X=95 ,Y=279,Name='跨岛传送阵'  ,npcID=11226,nCampID=1,ID=100005},
	[7 ] = {MapID=25,X=122,Y=326,Name='联邦装备收购商',npcID=11469,nCampID=1,ID=100006},
	[8 ] = {MapID=25,X=178,Y=288,Name='五级房屋'    ,npcID=11994,nCampID=1,ID=100007},
	[9 ] = {MapID=25,X=155,Y=322,Name='联邦仓库'    ,npcID=11227,nCampID=1,ID=100008},
	[10] = {MapID=25,X=124,Y=316,Name='联邦邮箱'    ,npcID=11029,nCampID=1,ID=100009},
	[11] = {MapID=25,X=320,Y=229,Name='哨兵努曼'    ,npcID=11826,nCampID=1,ID=100010},
	--珊瑚群岛（联邦MapID=10）
	[12] = {MapID=10,X=119,Y=332,Name='引导者'      ,npcID=11500,nCampID=1,ID=100011},	
	[13] = {MapID=10,X=131,Y=317,Name='新手商人'    ,npcID=11265,nCampID=1,ID=100012},
	[14] = {MapID=10,X=119,Y=308,Name='联邦生产供应商',npcID=11023,nCampID=1,ID=100013},
	[15] = {MapID=10,X=139,Y=332,Name='联邦邮箱'    ,npcID=11029,nCampID=1,ID=100014},
	[16] = {MapID=10,X=119,Y=312,Name='联邦仓库'    ,npcID=11227,nCampID=1,ID=100015},
	[17] = {MapID=10,X=155,Y=307,Name='联邦装备收购商',npcID=11469,nCampID=1,ID=100016},
	[18] = {MapID=10,X=128,Y=314,Name='战斗技能导师',npcID=11027,nCampID=1,ID=100017},
	[19] = {MapID=10,X=117,Y=304,Name='生活技能导师',npcID=11269,nCampID=1,ID=100018},
	[20] = {MapID=10,X=123,Y=321,Name='水晶币兑换商',npcID=12054,nCampID=1,ID=100019},
	[21] = {MapID=10,X=144,Y=337,Name='载具商人'    ,npcID=12194,nCampID=1,ID=100020},
	[22] = {MapID=10,X=122,Y=316,Name='名师榜'      ,npcID=12055,nCampID=1,ID=100021},
	[23] = {MapID=10,X=150,Y=307,Name='火爆拉锯大使',npcID=12358,nCampID=1,ID=100022},
	[24] = {MapID=10,X=136,Y=332,Name='答题活动使者',npcID=12342,nCampID=1,ID=100023},
	--双子岛（MapID=10）
	[25] = {MapID=104,X=438,Y=667,Name='跨岛传送帝国',npcID=12045,nCampID=0,ID=100024},
	[26] = {MapID=104,X=434,Y=237,Name='跨岛传送联邦',npcID=12045,nCampID=1,ID=100025},
	[27] = {MapID=104,X=439,Y=431,Name='饲养员'      ,npcID=11931,nCampID=1,ID=100026},
	[28] = {MapID=104,X=440,Y=293,Name='饲养员'      ,npcID=11931,nCampID=1,ID=100027},
	[29] = {MapID=104,X=433,Y=585,Name='饲养员'      ,npcID=11931,nCampID=1,ID=100028},
	--英雄大陆之娜纱湿地（联邦MapID=98）
	[30] = {MapID=98,X=357,Y=389,Name='联邦生产供应商',npcID=11023,nCampID=1,ID=100029},
	[31] = {MapID=98,X=369,Y=369,Name='联邦邮箱'      ,npcID=11029,nCampID=1,ID=100030},
	[32] = {MapID=98,X=352,Y=346,Name='联邦仓库'      ,npcID=11227,nCampID=1,ID=100031},
	[33] = {MapID=98,X=358,Y=352,Name='新手商人'      ,npcID=11265,nCampID=1,ID=100032},
    [34] = {MapID=98,X=351,Y=384,Name='联邦装备收购商',npcID=11469,nCampID=1,ID=100033},
	[35] = {MapID=98,X=393,Y=366,Name='水晶币兑换商'  ,npcID=12054,nCampID=1,ID=100034},
	[36] = {MapID=98,X=359,Y=369,Name='排行榜'        ,npcID=11719,nCampID=1,ID=100035},
	[37] = {MapID=98,X=359,Y=365,Name='战争信息板'    ,npcID=12048,nCampID=1,ID=100036},
	[38] = {MapID=98,X=387,Y=344,Name='载具商人'      ,npcID=12194,nCampID=1,ID=100037},
	[39] = {MapID=98,X=374,Y=375,Name='火爆拉锯大使'  ,npcID=12358,nCampID=1,ID=100038},
	--月暮草场(MapID=101）
	[40] = {MapID=101,X=470,Y=590,Name='帝国PK值查询官',npcID=11662,nCampID=0,ID=100039},
	[41] = {MapID=101,X=282,Y=381,Name='联邦PK值查询官',npcID=11663,nCampID=1,ID=100040},
	[42] = {MapID=101,X=469,Y=586,Name='帝国材料兑换官',npcID=11648,nCampID=0,ID=100041},
	[43] = {MapID=101,X=288,Y=382,Name='联邦材料兑换官',npcID=11648,nCampID=1,ID=100042},
	--暗礁海（帝国MapID=9）
	[44] = {MapID=9  ,X=157,Y=378,Name='帝国新手商人'  ,npcID=11264,nCampID=0,ID=100043},
	[45] = {MapID=9  ,X=160,Y=389,Name='帝国邮箱'      ,npcID=11028,nCampID=0,ID=100044},
	[46] = {MapID=9  ,X=169,Y=361,Name='帝国仓库'      ,npcID=11228,nCampID=0,ID=100045},
	[47] = {MapID=9  ,X=116,Y=310,Name='五级房屋'      ,npcID=11994,nCampID=0,ID=100046},
	[48] = {MapID=9  ,X=176,Y=379,Name='装备收购商'    ,npcID=11468,nCampID=0,ID=100047},
	[49] = {MapID=9  ,X=235,Y=349,Name='跨岛传送阵'    ,npcID=11216,nCampID=0,ID=100048},
	[50] = {MapID=9  ,X=140,Y=376,Name='跨岛传送阵'    ,npcID=11216,nCampID=0,ID=100049},
	[51] = {MapID=9  ,X=157,Y=381,Name='战斗技能导师'  ,npcID=11026,nCampID=0,ID=100050},
	[52] = {MapID=9  ,X=153,Y=383,Name='名师榜'        ,npcID=12055,nCampID=0,ID=100051},
	[53] = {MapID=9  ,X=144,Y=368,Name='火爆拉锯大使'  ,npcID=12358,nCampID=0,ID=100052},
	--阳光雨林（帝国MapID=23）
	[54] = {MapID=23  ,X=130,Y=328,Name='新手商人'     ,npcID=11264,nCampID=0,ID=100053},
	[55] = {MapID=23  ,X=115,Y=341,Name='帝国生产供应商' ,npcID=11022,nCampID=0,ID=100054},
	[56] = {MapID=23  ,X=118,Y=320,Name='帝国邮箱'     ,npcID=11028,nCampID=0,ID=100055},
	[57] = {MapID=23  ,X=144,Y=316,Name='帝国仓库'     ,npcID=11228,nCampID=0,ID=100056},
	[58] = {MapID=23  ,X=118,Y=314,Name='装备收购商'   ,npcID=11468,nCampID=0,ID=100057},
	[59] = {MapID=23  ,X=110,Y=338,Name='帝国生活技能导师',npcID=11268,nCampID=0,ID=100058},
	[60] = {MapID=23  ,X=130,Y=331,Name='帝国战斗技能导师',npcID=11026,nCampID=0,ID=100059},
	[61] = {MapID=23  ,X=133,Y=342,Name='水晶币兑换商' ,npcID=12053,nCampID=0,ID=100060},
	[62] = {MapID=23  ,X=115,Y=331,Name='名师榜'       ,npcID=12055,nCampID=0,ID=100061},
	[63] = {MapID=23  ,X=120,Y=343,Name='火爆拉锯大使' ,npcID=12358,nCampID=0,ID=100062},
	--英雄大陆之落日农庄（帝国MapID=99）
	[64] = {MapID=99  ,X=380,Y=392,Name='帝国生产供应商' ,npcID=11022,nCampID=0,ID=100063},
	[65] = {MapID=99  ,X=387,Y=393,Name='帝国邮箱'       ,npcID=11028,nCampID=0,ID=100064},
	[66] = {MapID=99  ,X=360,Y=353,Name='新手商人'       ,npcID=11264,nCampID=0,ID=100065},
    [67] = {MapID=99  ,X=391,Y=367,Name='帝国仓库'       ,npcID=11228,nCampID=0,ID=100066},
	[68] = {MapID=99  ,X=376,Y=386,Name='帝国装备收购商' ,npcID=11468,nCampID=0,ID=100067},
	[69] = {MapID=99  ,X=363,Y=366,Name='水晶币兑换商'   ,npcID=12053,nCampID=0,ID=100068},
	[70] = {MapID=99  ,X=359,Y=380,Name='排行榜'         ,npcID=11719,nCampID=0,ID=100069},
	[71] = {MapID=99  ,X=359,Y=376,Name='战争信息板'     ,npcID=12048,nCampID=0,ID=100070},
	[72] = {MapID=99  ,X=398,Y=367,Name='载具商人'       ,npcID=12193,nCampID=0,ID=100071},
	[73] = {MapID=99  ,X=403,Y=365,Name='战备指挥官摩罗' ,npcID=12244,nCampID=0,ID=100072},
	[74] = {MapID=99  ,X=379,Y=369,Name='火爆拉锯大使'   ,npcID=12358,nCampID=0,ID=100073},
	--光明遗迹（MapID=111）
	[75] = {MapID=111 ,X=352,Y=174,Name='联邦卡牌兑换官' ,npcID=12321,nCampID=1,ID=100074},
	[76] = {MapID=111 ,X=216,Y=513,Name='帝国卡牌兑换官' ,npcID=12321,nCampID=0,ID=100075},
	[77] = {MapID=111 ,X=582,Y=382,Name='光明遗迹飞艇管理员',npcID=12307,nCampID=3,ID=100076},
	[78] = {MapID=111 ,X=215,Y=509,Name='帝国邮箱'       ,npcID=11028,nCampID=0,ID=100077},
	[79] = {MapID=111 ,X=206,Y=528,Name='帝国仓库'       ,npcID=11228,nCampID=0,ID=100078},
	[80] = {MapID=111 ,X=217,Y=534,Name='帝国生产供应商' ,npcID=11022,nCampID=0,ID=100079},
	[81] = {MapID=111 ,X=197,Y=530,Name='帝国装备收购商' ,npcID=11468,nCampID=0,ID=100080},
	[82] = {MapID=111 ,X=353,Y=177,Name='联邦装备收购商' ,npcID=11469,nCampID=1,ID=100081},
	[83] = {MapID=111 ,X=323,Y=180,Name='联邦仓库'       ,npcID=11227,nCampID=1,ID=100082},
	[84] = {MapID=111 ,X=348,Y=145,Name='联邦生产供应商' ,npcID=11023,nCampID=1,ID=100083},
	[85] = {MapID=111 ,X=304,Y=209,Name='联邦装备改造师' ,npcID=11009,nCampID=1,ID=100084},
	[86] = {MapID=111 ,X=312,Y=213,Name='联邦装备保养员' ,npcID=11013,nCampID=1,ID=100085},
	[87] = {MapID=111 ,X=316,Y=170,Name='联邦珠宝工匠'   ,npcID=11011,nCampID=1,ID=100086},
	[88] = {MapID=111 ,X=168,Y=534,Name='帝国装备保养员' ,npcID=11012,nCampID=0,ID=100087},
	[89] = {MapID=111 ,X=177,Y=513,Name='帝国装备改造师' ,npcID=11008,nCampID=0,ID=100088},
	[90] = {MapID=111 ,X=188,Y=533,Name='帝国珠宝工匠'   ,npcID=11010,nCampID=0,ID=100089},
	[91] = {MapID=111 ,X=243,Y=540,Name='帝国材料药品商' ,npcID=11020,nCampID=0,ID=100090},
	[92] = {MapID=111 ,X=328,Y=171,Name='联邦材料药品商' ,npcID=11021,nCampID=1,ID=100091},
	--天空都市（MapID=130）
	[93] = {MapID=130 ,X=401,Y=378,Name='联邦传送门'     ,npcID=12330,nCampID=1,ID=100092},
	[94] = {MapID=130 ,X=505,Y=375,Name='帝国传送门'     ,npcID=12330,nCampID=0,ID=100093},
	--沙暴绿洲（MapID=102）
	[95] = {MapID=102 ,X=645,Y=822,Name='帝国仓库'       ,npcID=11228,nCampID=0,ID=100094},
	[96] = {MapID=102 ,X=629,Y=826,Name='帝国邮箱'       ,npcID=11028,nCampID=0,ID=100095},
	[97] = {MapID=102 ,X=535,Y=315,Name='联邦仓库'       ,npcID=11227,nCampID=1,ID=100096},
	[98] = {MapID=102 ,X=517,Y=328,Name='联邦邮箱'       ,npcID=11029,nCampID=1,ID=100097},
	--帝国主城钢铁城（MapID=1）
	[99] = {MapID=1   ,X=258,Y=105,Name='云游商人'       ,npcID=12049,nCampID=0,ID=100098},
	[100]= {MapID=1   ,X=242,Y=173,Name='答题活动使者'   ,npcID=12342,nCampID=0,ID=100099},
	[101]= {MapID=1   ,X=255,Y=185,Name='水晶币商人'     ,npcID=12053,nCampID=0,ID=100100},
	--联邦主城天空城（MapID=2）
	[102]= {MapID=2   ,X=228,Y=131,Name='云游商人'       ,npcID=12049,nCampID=1,ID=100101},
	[103]= {MapID=2   ,X=246,Y=148,Name='水晶币商人'     ,npcID=12054,nCampID=1,ID=100102},
	----------------------------------------------------------------------------------------
}
-- ------------------------------------------------------------------------
-- 描述：交互数据加载成功后，初始化完后Main.lua会自动调用该函数
-- 所有模块都需从这里开始初始化本模块相应部分
-- 参数：nTypeID, nServerID, nOwnerID分别为返回数据的类型信息
-- ------------------------------------------------------------------------
function NPCMain_OnLogin(lActorID, nTypeID, nServerID, nOwnerID)
	--地图打点
	--API_Trace("lActorID"..lActorID)
	local MapID = API_GetActorMapID(lActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if tNPC_Location_table ~= nil then
		for i in tNPC_Location_table do
			local StationMapID = tNPC_Location_table[i].MapID
			local StationX = tNPC_Location_table[i].X
			local StationY = tNPC_Location_table[i].Y
			local StationName = tNPC_Location_table[i].Name
			local StationID = tNPC_Location_table[i].ID
			local StationCamp = tNPC_Location_table[i].nCampID
			if MapConfigID == StationMapID and StationCamp == 1 then
				  --NPC地图打点显示接口倒数第二个参数2表示蓝色的点（联邦），1表示红色的点（帝国）
				  API_ActorAddMapPoint(lActorID,StationID,MapConfigID,StationX,StationY,2,StationName)
			elseif MapConfigID == StationMapID and StationCamp == 0 then
				  API_ActorAddMapPoint(lActorID,StationID,MapConfigID,StationX,StationY,1,StationName)
			elseif MapConfigID == StationMapID and StationCamp == 3 then
				  API_ActorAddMapPoint(lActorID,StationID,MapConfigID,StationX,StationY,3,StationName)				  
			end
		end
	end
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家退出场景时会自动调用这个函数
-- 每个模块都应该在这里结束, 并清理完自己模块的相应垃圾
-- ------------------------------------------------------------------------
function NPCMain_OnLogout(lActorID)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家切换地图后会自动调用此函数
-- ------------------------------------------------------------------------
function NPCMain_OnLoginMap(lActorID)
	--地图打点
	local MapID = API_GetActorMapID(lActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if tNPC_Location_table ~= nil then
		for i in tNPC_Location_table do
			local StationMapID = tNPC_Location_table[i].MapID
			local StationX = tNPC_Location_table[i].X
			local StationY = tNPC_Location_table[i].Y
			local StationName = tNPC_Location_table[i].Name
			local StationID = tNPC_Location_table[i].ID
			local StationCamp = tNPC_Location_table[i].nCampID
			if MapConfigID == StationMapID and StationCamp == 1 then
				  API_ActorAddMapPoint(lActorID,StationID,MapConfigID,StationX,StationY,2,StationName)
			elseif MapConfigID == StationMapID and StationCamp == 0 then
				  API_ActorAddMapPoint(lActorID,StationID,MapConfigID,StationX,StationY,1,StationName)
			elseif MapConfigID == StationMapID and StationCamp == 3 then
				  API_ActorAddMapPoint(lActorID,StationID,MapConfigID,StationX,StationY,3,StationName)		
			end
		end
	end
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家切换地图前框架会自动调用此函数
-- ------------------------------------------------------------------------
function NPCMain_OnLogoutMap(lActorID)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家升级时会自动调用此函数
-- ------------------------------------------------------------------------
function NPCMain_OnUpgrade(lActorID)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家升级前会自动调用此函数判断是否允许升级
-- ------------------------------------------------------------------------
function NPCMain_OnLevelUp(ActorID,nExploitL)
	return 1
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家学会英雄之后回调该函数
-- ------------------------------------------------------------------------
function NPCMain_OnStudyHero(ActorID,HeroID)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家装配英雄后回调该函数
-- ------------------------------------------------------------------------
function NPCMain_OnActivationHero(ActorID,HeroID,Index)
end

-- ------------------------------------------------------------------------
-- 描述：每个玩家进入离开队伍后的系统回调函数
-- ------------------------------------------------------------------------
function NPCMain_OnTeamMemberCall(ActorID,TeamID,Type)
end

function NPCMain_OnLoadIDataOK(TypeID,ServerID,OwnerID)
end

function NPCMain_OnRelationLoad(ActorID)
end

function NPCMain_OnNickNameLoad(ActorID)
end


function NPCMain_OnTeamMemberOut(ActorID,TeamID)
end

function NPCMain_OnGotoConditionCall(ActorID,MapID,TileX,TileY)
	return 1
end
-- ------------------------------------------------------------------------
-- 在这里填写本模块需要在装载的脚本文件
-- ------------------------------------------------------------------------
require 'Scp\\LUA\\NPC\\CreateNPC.lua'
require 'Scp\\LUA\\NPC\\NPCDialog.lua'
require 'Scp\\LUA\\NPC\\NPCFunc.lua'
require 'Scp\\LUA\\NPC\\Marriage.lua'
require 'Scp\\LUA\\NPC\\GmCmd.lua'
require 'Scp\\LUA\\NPC\\WorkSkill.lua'
require 'Scp\\LUA\\NPC\\NPCDeleteBUGzhuizong.lua'

-- end files!!!