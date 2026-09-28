----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\SearchResource.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2009-2-6
--版  本:	1.0
--描  述:	探矿系统
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：万钰林
--日期：2009-2-6
--功能：创建
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--生活技能ID：0 = 金属采集，1 = 水晶采集，2 = 伐木，3 = 植物采集，4 = 狩猎

--19029 存储探矿熟练度
--19030 存储矿点地图ID
--19031 存储矿点XY坐标
--19032 存储玩家使用的物品ID
--19033 刷出资源后罗盘冷却CD时间 临时
--19034 存储地图图标ID 临时
--19035 存储地图图标的时间，为1时会删除图标 临时
--19038 判断身上是否有探测器卷轴，1是有 临时
--19062 存储玩家探矿每天可获得经验的次数
--19064 存储探矿可获得经验的年月日
--19068 存储玩家每日探矿次数
--19086 存储触发器ID 临时

--男爵 
--联邦 珊瑚群岛 10
--帝国 阳光雨林 23
--子爵
--联邦 娜纱湿地 98
--帝国 落日农庄 99
--征战平原 100
--月暮草场 101
--沙暴绿洲 102

--使用罗盘判断阵营，2档资源强制固定地图，3档以上随机地图，根据罗盘档次显示资源所在地图（存物品ID，防玩家使用别的罗盘探同个点）
--到达地图通过不断使用罗盘告知玩家矿点方位
--到达矿点方位，根据罗盘档次和熟练度刷新N个资源
--扣除罗盘，采集资源
--每个地图有一个中心点，通过中心点将地图分四个区域，每次探矿都会在不同的区域

SearchResourceTaskID = 4503
local SearchResourceAddGXNum = 20
local SearchResource_TanKuangNum = 60 --探矿次数限制
local SearchResource_SLDMax = 7788 --熟练度最大值
local SearchResource_AddHuoLi = 4 --每次探测成功后增加活力

--2档是1，3档是2，4档是3，5档是4（未做）
SearchResource_ResourceTable = {
				--可增加熟练度，熟练度范围XY，刷新机率，最小刷几个，最大刷几个，显示程度
				[1] = {a=301,b=1093,
					Resource = {
						{SLD=5,x=0,y=300,JL=4286,Min=5,Max=6,XS=0,LV=1},
						{SLD=4,x=301,y=600,JL=1791,Min=5,Max=6,XS=1,LV=2},
						{SLD=3,x=601,y=1092,JL=9062,Min=6,Max=7,XS=1,LV=3},
						{SLD=2,x=1093,y=1610,JL=6066,Min=6,Max=7,XS=2,LV=4},
						{SLD=1,x=1611,y=2232,JL=2759,Min=6,Max=7,XS=2,LV=5},
						{SLD=0,x=2233,y=2979,JL=9091,Min=7,Max=8,XS=2,LV=6},
						{SLD=0,x=2980,y=3875,JL=5000,Min=7,Max=8,XS=2,LV=7},
						{SLD=0,x=3876,y=4950,JL=408,Min=7,Max=8,XS=2,LV=8},
						{SLD=0,x=4951,y=6240,JL=5217,Min=8,Max=9,XS=2,LV=9},
						{SLD=0,x=6241,y=7788,JL=2500,Min=9,Max=10,XS=2,LV=10},
						},
					},
				[2] = {a=601,b=1611,
					Resource = {
						{SLD=7,x=0,y=300,JL=6684,Min=5,Max=6,XS=0,LV=1},
						{SLD=6,x=301,y=600,JL=4118,Min=5,Max=6,XS=0,LV=2},
						{SLD=5,x=601,y=1092,JL=1292,Min=5,Max=6,XS=1,LV=3},
						{SLD=5,x=1093,y=1610,JL=1292,Min=5,Max=6,XS=1,LV=4},
						{SLD=5,x=1611,y=2232,JL=1292,Min=5,Max=6,XS=1,LV=5},
						{SLD=5,x=2233,y=2979,JL=4688,Min=6,Max=7,XS=2,LV=6},
						{SLD=5,x=2980,y=3875,JL=6408,Min=7,Max=8,XS=2,LV=7},
						{SLD=4,x=3876,y=4950,JL=6408,Min=7,Max=8,XS=2,LV=8},
						{SLD=3,x=4951,y=6240,JL=1429,Min=7,Max=8,XS=2,LV=9},
						{SLD=2,x=6241,y=7788,JL=5726,Min=8,Max=9,XS=2,LV=10},
						},
					},
				[3] = {a=1093,b=2233,
					Resource = {
						{SLD=9,x=0,y=300,JL=1267,Min=3,Max=4,XS=0,LV=1},
						{SLD=8,x=301,y=600,JL=6577,Min=4,Max=5,XS=0,LV=2},
						{SLD=7,x=601,y=1092,JL=595,Min=4,Max=5,XS=0,LV=3},
						{SLD=6,x=1093,y=1610,JL=7714,Min=5,Max=6,XS=1,LV=4},
						{SLD=6,x=1611,y=2232,JL=7714,Min=5,Max=6,XS=1,LV=5},
						{SLD=5,x=2233,y=2979,JL=2702,Min=5,Max=6,XS=1,LV=6},
						{SLD=5,x=2980,y=3875,JL=8791,Min=6,Max=7,XS=2,LV=7},
						{SLD=5,x=3876,y=4950,JL=4306,Min=6,Max=7,XS=2,LV=8},
						{SLD=4,x=4951,y=6240,JL=1808,Min=6,Max=7,XS=2,LV=9},
						{SLD=3,x=6241,y=7788,JL=1808,Min=6,Max=7,XS=2,LV=10},
						},
					},
}

SearchResource_PetExpTable = {
				[1] = {
					[1] = {Min=0,Max=10,BiLv=0.5},
					[2] = {Min=11,Max=25,BiLv=1},
					[3] = {Min=26,Max=40,BiLv=1},
					[4] = {Min=41,Max=55,BiLv=1},
					[5] = {Min=56,Max=85,BiLv=0.5},
					},
				[2] = {
					[1] = {Min=0,Max=10,BiLv=0.1},
					[2] = {Min=11,Max=25,BiLv=0.5},
					[3] = {Min=26,Max=40,BiLv=1},
					[4] = {Min=41,Max=85,BiLv=0.8},
					[5] = {Min=56,Max=85,BiLv=0.5},
					},
				[3] = {
					[1] = {Min=0,Max=10,BiLv=0.01},
					[2] = {Min=11,Max=25,BiLv=0.1},
					[3] = {Min=26,Max=40,BiLv=0.5},
					[4] = {Min=41,Max=85,BiLv=1},
					[5] = {Min=56,Max=85,BiLv=0.8},
					},
				[4] = {
					[1] = {Min=0,Max=10,BiLv=0.01},
					[2] = {Min=11,Max=25,BiLv=0.1},
					[3] = {Min=26,Max=40,BiLv=0.5},
					[4] = {Min=41,Max=85,BiLv=0.8},
					[5] = {Min=56,Max=85,BiLv=1},
					},
}

SearchResource_LuoPanTable = {
				--物品ID，生活技能ID
				--范例，一个物品对应一个需要级别和生活技能ID
				--2档
				[860] = {SkillID=0,SkillName='金属采集',NeedLv=1,ZY=1501,GX=744,
						TBID=4,
						MapID={10,23} --地图ID
						},
				[861] = {SkillID=1,SkillName='水晶采集',NeedLv=1,ZY=1502,GX=744,
						TBID=5,
						MapID={10,23}
						},
				[862] = {SkillID=2,SkillName='伐木',NeedLv=1,ZY=1503,GX=744,
						TBID=6,
						MapID={10,23}
						},
				[863] = {SkillID=3,SkillName='植物采集',NeedLv=1,ZY=1504,GX=744,
						TBID=7,
						MapID={10,23}
						},
				[864] = {SkillID=4,SkillName='狩猎',NeedLv=1,ZY=726152,GX=744,
						TBID=8,
						MapID={10,23}
						},
				--3档
				[865] = {SkillID=0,SkillName='金属采集',NeedLv=7,ZY=1505,GX=5480,
						TBID=4,
						MapID={9,25}
						},
				[866] = {SkillID=1,SkillName='水晶采集',NeedLv=7,ZY=1506,GX=5480,
						TBID=5,
						MapID={9,25}
						},
				[867] = {SkillID=2,SkillName='伐木',NeedLv=7,ZY=1507,GX=5480,
						TBID=6,
						MapID={9,25}
						},
				[868] = {SkillID=3,SkillName='植物采集',NeedLv=7,ZY=1508,GX=5480,
						TBID=7,
						MapID={9,25}
						},
				[869] = {SkillID=4,SkillName='狩猎',NeedLv=7,ZY=726153,GX=5480,
						TBID=8,
						MapID={9,25}
						},
				--4档
				[870] = {SkillID=0,SkillName='金属采集',NeedLv=13,ZY=1509,GX=10740,
						TBID=4,
						MapID={9,25}
						},
				[871] = {SkillID=1,SkillName='水晶采集',NeedLv=13,ZY=1510,GX=10740,
						TBID=5,
						MapID={9,25}
						},
				[872] = {SkillID=2,SkillName='伐木',NeedLv=13,ZY=1511,GX=10740,
						TBID=6,
						MapID={9,25}
						},
				[873] = {SkillID=3,SkillName='植物采集',NeedLv=13,ZY=1512,GX=10740,
						TBID=7,
						MapID={9,25}
						},
				[874] = {SkillID=4,SkillName='狩猎',NeedLv=13,ZY=726266,GX=10740,
						TBID=8,
						MapID={9,25}
						},
				--5档
				[875] = {SkillID=0,SkillName='金属采集',NeedLv=18,ZY=1513,GX=9999,
						TBID=4,
						MapID={9,25}
						},
				[876] = {SkillID=1,SkillName='水晶采集',NeedLv=18,ZY=1514,GX=9999,
						TBID=5,
						MapID={9,25}
						},
				[877] = {SkillID=2,SkillName='伐木',NeedLv=18,ZY=1515,GX=9999,
						TBID=6,
						MapID={9,25}
						},
				[878] = {SkillID=3,SkillName='植物采集',NeedLv=18,ZY=1516,GX=9999,
						TBID=7,
						MapID={9,25}
						},
				[879] = {SkillID=4,SkillName='狩猎',NeedLv=18,ZY=726155,GX=9999,
						TBID=8,
						MapID={9,25}
						},
}

SearchResource_LuoPanTileTable = {
				--地图ID，坐标XY原点 麦穗平原
				[25] = {x=242,y=259,
					Tile = {
						--上
						{51,260},
						{49,278},
						{50,306},
						{89,275},
						{123,283},
						{97,329},
						{178,277},
						{193,261},
						{199,318},
						{131,379},
						{195,330},
						{176,325},
						{166,259},
						{125,263},
						{159,211},
						{139,215},
						{125,208},
						{151,189},
						{92,254},
						--右
						{239,268},
						{256,278},
						{245,284},
						{230,288},
						{235,303},
						{242,313},
						{279,349},
						{305,342},
						{324,337},
						{361,300},
						{231,393},
						{236,406},
						{155,420},
						{200,387},
						{177,393},
						{169,384},
						{136,389},
						{132,378},
						{156,365},
						{216,334},
						--下
						{284,266},
						{312,256},
						{339,206},
						{369,186},
						{368,172},
						{319,200},
						{291,225},
						{268,197},
						{279,169},
						{284,137},
						--左
						{269,130},
						{210,150},
						{209,166},
						{248,180},
						{233,232},
						{237,258},
						{168,250},
						{135,240},
						{108,213},
						{126,207},
						{163,154},
						{188,151},
						{209,127},
						
						}
					},
				--地图ID，坐标XY原点 暗礁海
				[9] = {x=222,y=259,
					Tile = {
						--上
						{186,272},
						{150,311},
						{128,317},
						{108,332},
						{79,350},
						{61,334},
						{48,310},
						{29,299},
						{27,290},
						{41,297},
						{72,287},
						{107,290},
						{127,260},
						{142,257},
						{123,381},
						{138,416},
						{125,331},
						{146,286},
						{146,267},
						--右
						{209,388},
						{228,401},
						{264,419},
						{263,406},
						{288,400},
						{305,344},
						{312,349},
						{325,321},
						{315,305},
						{357,279},
						{352,268},
						{335,282},
						{257,297},
						{244,293},
						{234,288},
						{209,316},
						{234,288},
						{260,272},
						{230,327},
						{243,346},
						--下
						{259,305},
						{275,246},
						{276,231},
						{298,204},
						{332,206},
						{312,179},
						{304,171},
						{293,169},
						{299,112},
						{309,115},
						--左
						{282,122},
						{282,101},
						{287,69},
						{279,58},
						{270,85},
						{265,107},
						{249,161},
						{216,144},
						{177,132},
						{165,151},
						{186,194},
						{169,193},
						{157,212},
						{130,222},
						}
					},
				--地图ID，坐标XY原点 珊瑚群岛
				[10] = {x=225,y=273,
					Tile = {
						--上
						{217,279},
						{196,386},
						{175,405},
						{166,419},
						{151,417},
						{136,392},
						{122,390},
						{114,378},
						{106,375},
						{99,361},
						{89,357},
						{86,344},
						{87,314},
						{98,284},
						{177,288},
						{190,287},
						{202,306},
						{178,311},
						{197,344},
						{173,367},
						--右
						{220,321},
						{235,337},
						{229,373},
						{248,365},
						{269,352},
						{275,369},
						{249,313},
						{329,293},
						{335,278},
						{284,276},
						--下
						{264,270},
						{277,263},
						{300,257},
						{350,237},
						{354,189},
						{331,173},
						{315,125},
						{341,120},
						{366,125},
						{377,157},
						{356,165},
						{295,118},
						{296,146},
						{292,174},
						{262,223},
						{237,214},
						{257,185},
						{262,162},
						{265,195},
						--左
						{239,153},
						{197,195},
						{183,160},
						{176,149},
						{150,165},
						{171,171},
						{177,234},
						{162,264},
						{125,230},
						{113,242},
						{107,260},
						{126,258},
						{151,241},
						
						}
					},
				--阳光雨林
				[23] = {x=252,y=244,
					Tile = {
						--1
						{219,260},
						{176,245},
						{99,283},
						{61,326},
						{84,342},
						{251,319},
						{201,355},
						{122,391},
						{176,301},
						{160,283},
						{154,259},
						{83,305},
						{229,251},
						{186,266},
						--2
						{359,267},
						{262,257},
						{265,282},
						{281,297},
						{314,298},
						--3
						{351,228},
						{386,185},
						{406,178},
						{424,163},
						{409,125},
						{323,226},
						{276,219},
						{252,196},
						{262,175},
						{299,171},
						{306,35},
						{353,72},
						{311,208},
						{334,220},
						{312,143},
						{292,233},
						--4
						{259,80},
						{273,174},
						}
					},
				--落日农庄
				[99] = {x=378,y=368,
					Tile = {
						--1
						{361,414},
						{312,469},
						{299,435},
						{247,478},
						{271,427},
						{210,416},
						{231,429},
						{254,410},
						{264,371},
						{190,384},
						{187,362},
						--2
						{302,519},
						{310,548},
						{325,580},
						{326,516},
						{352,486},
						{381,624},
						{387,582},
						{366,555},
						{394,474},
						{438,525},
						{487,461},
						{467,448},
						{487,415},
						{514,438},
						--3
						{472,374},
						{491,300},
						{508,325},
						{546,308},
						{574,308},
						{530,370},
						{403,337},
						{424,272},
						{422,216},
						{465,100},
						{428,121},
						{408,156},
						--4
						{391,195},
						{363,275},
						{309,213},
						{308,238},
						{294,216},
						{260,271},
						{242,275},
						{209,313},
						{217,335},
						{191,348},
						{211,363},
						}
					},
				--娜纱湿地
				[98] = {x=369,y=379, 
					Tile = {
						--1
						{294,434},
						{239,506},
						{220,488},
						{203,477},
						{205,458},
						{198,424},
						{209,410},
						{219,433},
						{230,467},
						{269,447},
						{295,537},
						{348,535},
						{341,495},
						{328,484},
						{337,465},
						{387,473},
						--2
						{387,473},
						{420,508},
						{453,484},
						{425,445},
						{394,452},
						{411,478},
						{457,410},
						{525,452},
						{556,442},
						{491,444},
						{471,476},
						--3
						{575,386},
						{562,369},
						{561,348},
						{527,361},
						{493,331},
						{536,302},
						{480,327},
						{439,285},
						{474,229},
						{505,203},
						{489,197},
						{453,184},
						{420,235},
						{410,208},
						{398,268},
						--4
						{317,265},
						{277,280},
						{322,288},
						{329,343},
						{293,372},
						{252,366},
						{222,344},
						{283,315},
						}
					},
				--征战平原
				[100] = {x=355,y=387,
					Tile = {
						--1
						{221,428},
						{215,405},
						{282,532},
						{318,521},
						{308,539},
						--2
						{353,534},
						{367,498},
						{414,463},
						{430,419},
						{479,471},
						{535,422},
						--3
						{509,320},
						{477,313},
						{427,340},
						{381,305},
						{376,240},
						{369,206},
						{398,230},
						--4
						{330,288},
						{294,228},
						{209,306},
						{238,326},
						{189,347},
						{192,359},
						{246,371},
						{244,390},
						}
					},
				--月暮草场
				[101] = {x=433,y=410,
					Tile = {
						--1
						{410,425},
						{413,475},
						{384,470},
						{350,452},
						{296,457},
						{318,490},
						{343,514},
						{357,526},
						{413,496},
						{392,569},
						{404,589},
						{411,613},
						{415,570},
						{425,530},
						--2
						{448,539},
						{442,504},
						{440,604},
						{484,547},
						{465,493},
						{502,516},
						{556,540},
						{493,469},
						{591,509},
						{650,521},
						{661,466},
						{613,425},
						{582,414},
						--3
						{466,400},
						{529,382},
						{496,272},
						{460,249},
						{458,303},
						{450,352},
						{458,381},
						{480,383},
						--4
						{383,291},
						{366,369},
						{286,393},
						{300,338},
						{297,316},
						{269,271},
						{302,249},
						{320,273},
						{360,286},
						{380,215},
						}
					},
				--沙暴绿洲
				[102] = {x=574,y=560,
					Tile = {
						--1
						{533,570},
						{519,552},
						{493,559},
						{427,616},
						{401,636},
						{386,612},
						{370,592},
						{544,609},
						{576,602},
						{500,729},
						{465,740},
						{448,724},
						{519,742},
						{487,761},
						{539,788},
						{545,761},
						--2
						{611,788},
						{587,831},
						{630,845},
						{621,623},
						{657,597},
						{622,565},
						{763,611},
						--3
						{781,543},
						{730,457},
						{690,455},
						{676,426},
						{664,376},
						{649,338},
						{686,351},
						{729,370},
						{767,329},
						{782,414},
						{695,250},
						{639,242},
						{600,459},
						{610,503},
						--4
						{547,270},
						{485,311},
						{418,382},
						{389,413},
						{467,303},
						{425,340},
						{398,388},
						{374,468},
						{359,506},
						{325,574},
						{351,537},
						{354,465},
						}
					},
}

--罗盘使用函数，确定矿点地图和坐标
function SearchResource_LuoPan_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if SearchResource_LuoPanTable[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return 0
	end
	local GD = 0
	if GoodsID == 860 or GoodsID == 861 or GoodsID == 862 or GoodsID == 863 or GoodsID == 864 then
		GD = 1
	elseif GoodsID == 865 or GoodsID == 866 or GoodsID == 867 or GoodsID == 868 or GoodsID == 869 then
		GD = 2 
	elseif GoodsID == 870 or GoodsID == 871 or GoodsID == 872 or GoodsID == 873 or GoodsID == 874 then
		GD = 3
	end
	if SearchResource_ResourceTable[GD] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return 0
	end
	local SkillID = SearchResource_LuoPanTable[GoodsID].SkillID
	local SkillName = SearchResource_LuoPanTable[GoodsID].SkillName
	local NeedLv = SearchResource_LuoPanTable[GoodsID].NeedLv
	local TBID = SearchResource_LuoPanTable[GoodsID].TBID
	local PlaySkillLv = API_GetWorkSkillLevel(ActorID,SkillID)
	if PlaySkillLv < NeedLv then
		API_ActorSendMsg(ActorID,3,'该物品需要'..SkillName..'技能达到'..NeedLv..'级才可以使用')
		return 0
	end
	local LengQue = API_VarDataGetNumber(ActorID,0,19033)
	if LengQue ~= 0 then
		API_ActorSendMsg(ActorID,3,'探测器使用冷却中，请稍等'..LengQue..'秒后再使用')
		return 0
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	local PlayYMD = API_VarDataGetNumber(ActorID,1,19064)
	local PlayYear = math.floor(PlayYMD/10000)
	local PlayMonthDay = math.mod(PlayYMD,10000)
	local PlayMonth = math.floor(PlayMonthDay/100)
	local PlayDay = math.mod(PlayMonthDay,100)
	if Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
		API_VarDataSetNumber(ActorID,1,19068,0)
	end
	local TanKuangNum = API_VarDataGetNumber(ActorID,1,19068)
	if TanKuangNum >= SearchResource_TanKuangNum then
		API_ActorSendMsg(ActorID,3,'每天只能完成'..SearchResource_TanKuangNum..'次探矿任务，请明天再尝试吧。')
		API_ActorSendMsg(ActorID,7,'每天只能完成'..SearchResource_TanKuangNum..'次探矿任务，您今天探矿任务完成次数已达上限，请明天再尝试吧。')
		return 0
	end
	local CampID = API_GetActorCamp(ActorID)
	local PlayMapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(PlayMapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	local ShuLianDu = API_VarDataGetNumber(ActorID,1,19029)
	if ShuLianDu > SearchResource_SLDMax then
		API_VarDataSetNumber(ActorID,1,19029,SearchResource_SLDMax)
		ShuLianDu = SearchResource_SLDMax
	end
	local KuangMapID = API_VarDataGetNumber(ActorID,1,19030)
	local KuangXY = API_VarDataGetNumber(ActorID,1,19031)
	local KuangX = math.floor(KuangXY/10000)
	local KuangY = math.mod(KuangXY,10000)
	local LuoPanGoodsID = API_VarDataGetNumber(ActorID,1,19032)
	local JuanZhou = API_VarDataGetNumber(ActorID,0,19038)
	if JuanZhou == 0 then
		API_VarDataSetNumber(ActorID,0,19038,1)
		API_RemoveTaskScroll(ActorID,50003)
		API_AddTaskScroll(ActorID,50003,104101,'SearchResource_JuanZhou')
	end
	if LuoPanGoodsID > 0 and LuoPanGoodsID ~= GoodsID then
		API_ActorSendMsg(ActorID,3,'您上次的资源还未探索完毕，请使用'..API_GetGoodsName(LuoPanGoodsID)..'继续探索。')
		API_ActorSendMsg(ActorID,7,'您上次的资源还未探索完毕，请使用'..API_GetGoodsName(LuoPanGoodsID)..'继续探索。可通过探测器卷轴放弃资源探索。')
		return 0
	end
	if KuangMapID == 0 and LuoPanGoodsID == 0 then
		local KMapID,KX,KY = SearchResource_XY(CampID,GoodsID,MapConfigID,PlayX,PlayY)
		local KXY = KX * 10000 + KY
		API_VarDataSetNumber(ActorID,1,19030,KMapID)
		API_VarDataSetNumber(ActorID,1,19031,KXY)
		API_VarDataSetNumber(ActorID,1,19032,GoodsID)
		--API_ActorSendMsg(ActorID,3,'探测器探索到一处资源，请您继续使用探测器探索资源具体位置')
		SearchResource_LuoPan_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
		--风向标
		if GD == 1 then
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type = 1
			if GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] + 1
			end
		elseif GD == 2 then
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type = 2
			if GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] + 1
			end
		elseif GD == 3 then
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type = 3
			if GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] + 1
			end
		end
		return 1
	else
		if KuangMapID == MapConfigID then
			local JuLi = PublicFun_AccountDistance(PlayX,PlayY,KuangX,KuangY) --两点间的距离
			local FangXiang = PublicFun_AccountDirection(PlayX,PlayY,KuangX,KuangY) --两点间的方向
			local BZID = KuangMapID * 100000 + SearchResourceTaskID * 10 + TBID
			local ResourceTable = SearchResource_ResourceTable[GD].Resource
			local XianShi = 0
			for j in ResourceTable do
				local x = ResourceTable[j].x
				local y = ResourceTable[j].y
				if ShuLianDu >= x and ShuLianDu <= y then
					XianShi = ResourceTable[j].XS
					break
				end
			end
			if JuLi <= 3 then
				local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
				if ConvectionInfo ~= 0 then
					API_ActorSendMsg(ActorID,3,'正在探索中，请稍后')
					return 1
				else
					local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
					local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
					API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
					local TimerTriggerID = API_CreateTimerTriggerG(ActorID,GoodsID,1,5,'SearchResource_ShuaZiYuan_TimerTriggerCallFunc')
					API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
					local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(GLOBAL_ConvectionTimer)
					API_ActorSendMsg(ActorID,3,'资源探索中……，需时'..GLOBAL_ConvectionTimerCN..'秒，探索时请不要移动，否则将探索失败')
					StatusTimer = (GLOBAL_ConvectionTimer + 1) * 1000
					API_ActorAddStatus(ActorID,36003,StatusTimer)
					API_ActorShowProcess(ActorID,StatusTimer,410,360,'探索资源')
					return 1
				end
			else
				--根据熟练度显示坐标、图标等
				local JuLiName = '未知'
				if JuLi > 3 and JuLi <= 15 then
					JuLiName = '附近'
				elseif JuLi > 15 and JuLi <= 50 then
					JuLiName = '不远'
				elseif JuLi > 50 and JuLi <=100 then
					JuLiName = '比较远'
				elseif JuLi > 100 then
					JuLiName = '很远'
				end
				local TanCeTitle = ''
				local TanCeTitle2 = ''
				if XianShi == 0 then
					TanCeTitle = '探测器探索资源在您的'..FangXiang..'方'..JuLiName..''
				elseif XianShi == 1 then
					TanCeTitle = '探测器探索资源在您的'..FangXiang..'方'..JuLiName..''
					TanCeTitle2 = '坐标为['..API_TileToPixelX(KuangMapID,KuangX,KuangY)..','..API_TileToPixelY(KuangMapID,KuangX,KuangY)..']'
				elseif XianShi == 2 then
					TanCeTitle = '您的资源在'..FangXiang..'方'..JuLiName..''
					TanCeTitle2 = '坐标为['..API_TileToPixelX(KuangMapID,KuangX,KuangY)..','..API_TileToPixelY(KuangMapID,KuangX,KuangY)..']，可按“M”键查看'
				end
				API_OpenArrowDir(ActorID,KuangX,KuangY,5) --显示动画指示箭头
				local JianTouCFQ = API_VarDataGetNumber(ActorID,0,19086)
				if JianTouCFQ ~= 0 then
					API_DestroyTrigger(ActorID,-1,JianTouCFQ)
				end
				JianTouCFQ = API_CreateTimerTrigger(ActorID,6,1,-1,'SearchResource_JianTouCFQ')
				API_VarDataSetNumber(ActorID,0,19086,JianTouCFQ)
				API_ActorSendMsg(ActorID,3,''..TanCeTitle..'')
				API_ActorSendMsg(ActorID,3,''..TanCeTitle2..'')
				if XianShi == 2 then
					local PlayTB = API_VarDataGetNumber(ActorID,0,19034)
					if PlayTB == 0 then
						API_ActorAddMapPoint(ActorID,BZID,KuangMapID,KuangX,KuangY,TBID,'探索到的资源') --缺图标ID
						API_VarDataSetNumber(ActorID,0,19034,BZID)
						API_VarDataSetNumber(ActorID,0,19035,15)
						API_CreateTimerTrigger(ActorID,1,15,-1,'SearchResource_TuBiaoTimerTrigger')
					end
				end
				if API_IsVehicalConjuring(ActorID) and API_IsCurVehicalHaveTheSkill(ActorID, 1) then
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<win close="0" move="1" rect="370,470,269,100"></win>')
					API_ResponseWrite('<a size="20" mapid="'..MapConfigID..'" x="'..KuangX..'" y="'..KuangY..'" npcid="0" underline="1">点击此处自动前往资源点</a>')
				end
				return 1
			end
		else
			API_ActorSendMsg(ActorID,3,'您的资源在'..API_GetMapName(KuangMapID)..'地图，请到达'..API_GetMapName(KuangMapID)..'后继续使用探测器探索')
			return 1
		end
	end
end

function SearchResource_JianTouCFQ(ActorID,b)
	local PlayMapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(PlayMapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	local KuangMapID = API_VarDataGetNumber(ActorID,1,19030)
	local KuangXY = API_VarDataGetNumber(ActorID,1,19031)
	local KuangX = math.floor(KuangXY/10000)
	local KuangY = math.mod(KuangXY,10000)
	if KuangMapID == MapConfigID then
		local JuLi = PublicFun_AccountDistance(PlayX,PlayY,KuangX,KuangY) --两点间的距离
		local FangXiang = PublicFun_AccountDirection(PlayX,PlayY,KuangX,KuangY) --两点间的方向
		if JuLi <= 3 then
			API_ActorSendMsg(ActorID,3,'资源就在您的脚下，请再次使用探测器挖掘')
		else
			local JuLiName = '未知'
			if JuLi > 3 and JuLi <= 15 then
				JuLiName = '附近'
			elseif JuLi > 15 and JuLi <= 50 then
				JuLiName = '不远'
			elseif JuLi > 50 and JuLi <=100 then
				JuLiName = '比较远'
			elseif JuLi > 100 then
				JuLiName = '很远'
			end
			API_ActorSendMsg(ActorID,3,'资源在您的'..FangXiang..'方'..JuLiName..'，请再用一次探测器探索')
		end
	end
end

function SearchResource_ShuaZiYuan_TimerTriggerCallFunc(ActorID,GoodsID)
	if API_ActorIsOnline(ActorID) then
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'探索资源')
			return
		end
		if API_ActorIsDying(ActorID) then
			API_ActorSendMsg(ActorID,3,'人物死亡，探索失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'探索资源')
			return
		end
		if SearchResource_LuoPanTable[GoodsID] == nil then
			API_ActorSendMsg(ActorID,3,'无效物品')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'探索资源')
			return
		end
		local GD = 0
		if GoodsID == 860 or GoodsID == 861 or GoodsID == 862 or GoodsID == 863 or GoodsID == 864 then
			GD = 1
		elseif GoodsID == 865 or GoodsID == 866 or GoodsID == 867 or GoodsID == 868 or GoodsID == 869 then
			GD = 2 
		elseif GoodsID == 870 or GoodsID == 871 or GoodsID == 872 or GoodsID == 873 or GoodsID == 874 then
			GD = 3
		elseif GoodsID == 875 or GoodsID == 876 or GoodsID == 877 or GoodsID == 878 or GoodsID == 879 then
			GD = 4
		end
		if SearchResource_ResourceTable[GD] == nil then
			API_ActorSendMsg(ActorID,3,'无效物品')
			return 0
		end
		local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
		ConvectionInfo = math.mod(ConvectionInfo,1000000000)
		local ConvectionSign = math.floor(ConvectionInfo/100000000)
		local BackTileXYandTime = math.mod(ConvectionInfo,100000000)
		local BackTileYandTime = math.mod(BackTileXYandTime,100000)
		local BackTileX = math.floor(BackTileXYandTime/100000)
		local BackTileY = math.floor(BackTileYandTime/100)
		local Time = math.mod(BackTileYandTime,100)
		local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
		if TileX ~= BackTileX or TileY ~= BackTileY then
			API_ActorSendMsg(ActorID,3,'人物移动，探索失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'探索资源')
		elseif Time >= GLOBAL_ConvectionTimer then
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'探索资源')
			--这里开始做判断刷资源加熟练度
			local SkillID = SearchResource_LuoPanTable[GoodsID].SkillID
			local SkillName = SearchResource_LuoPanTable[GoodsID].SkillName
			local NeedLv = SearchResource_LuoPanTable[GoodsID].NeedLv
			local ZY = SearchResource_LuoPanTable[GoodsID].ZY
			local TBID = SearchResource_LuoPanTable[GoodsID].TBID
			local AddGX = SearchResource_LuoPanTable[GoodsID].GX
			local ResourceTable = SearchResource_ResourceTable[GD].Resource
			local PlayMapID = API_GetActorMapID(ActorID)
			local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
			local ShuLianDu = API_VarDataGetNumber(ActorID,1,19029)
			local AddShuLianDu = 0
			local AddZY = 0
			for j in ResourceTable do 
				local x = ResourceTable[j].x
				local y = ResourceTable[j].y
				if ShuLianDu >= x and ShuLianDu <= y then
					AddShuLianDu = ResourceTable[j].SLD
					local JL = ResourceTable[j].JL
					local Min = ResourceTable[j].Min
					local Max = ResourceTable[j].Max
					local ZYGL = math.random(10000)
					if ZYGL <= JL then
						AddZY = Min
					else
						AddZY = Max
					end
				end
			end
			--判断日期，清除加经验次数
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
			local YMD = Year * 10000 + Month * 100 + Day
			local PlayYMD = API_VarDataGetNumber(ActorID,1,19064)
			local PlayYear = math.floor(PlayYMD/10000)
			local PlayMonthDay = math.mod(PlayYMD,10000)
			local PlayMonth = math.floor(PlayMonthDay/100)
			local PlayDay = math.mod(PlayMonthDay,100)
			if Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
				API_VarDataSetNumber(ActorID,1,19062,0)
			end
			API_VarDataSetNumber(ActorID,1,19064,YMD)
			--可在这里投个色子，如果是几就刷怪物或者出宝箱之类的
			local PlayTBID = API_VarDataGetNumber(ActorID,0,19034)
			if PlayTBID > 0 then
				API_ActorDelMapPoint(ActorID,PlayTBID)
			end
			if API_ActorRemoveGoods(ActorID,GoodsID,1,'探矿消耗1个'.. API_GetGoodsName(GoodsID)..'') then
				local TanKuangNum = API_VarDataGetNumber(ActorID,1,19068)
				API_VarDataSetNumber(ActorID,1,19068,TanKuangNum+1)
				local TanKuangNum2 = API_VarDataGetNumber(ActorID,1,19068)
				if TanKuangNum2 == TanKuangNum + 1 then
					if ShuLianDu + AddShuLianDu >= SearchResource_SLDMax then
						API_VarDataSetNumber(ActorID,1,19029,SearchResource_SLDMax)
					else
						API_VarDataSetNumber(ActorID,1,19029,ShuLianDu+AddShuLianDu)
					end
					local AddGXNum = API_VarDataGetNumber(ActorID,1,19062)
					API_VarDataSetNumber(ActorID,1,19062,AddGXNum+1)
					local AddGXNum2 = API_VarDataGetNumber(ActorID,1,19062)
					if AddGXNum2 <= SearchResourceAddGXNum then
						local ExploitL = API_GetActorExpLevel(ActorID)
						local expMax = API_GetExploitInfo(ExploitL,3)
						local expNow = API_GetActorCurExp(ActorID)
						local expAddMax = expMax - expNow
						local PetExp = 0
						local RewardNum = HouseNazarite_AddReward(ActorID,11)
						local ExtraReward = 0
						if expAddMax >= AddGX then
							PetExp = AddGX
							API_ActorAddExp(ActorID,AddGX,0,'探索资源增加'..AddGX..'经验')
							API_ActorSendMsg(ActorID,10,'探索资源获得'..AddGX..'经验，今天可获得经验次数还剩'..SearchResourceAddGXNum-AddGXNum2..'次')
							if RewardNum ~= 0 then
								ExtraReward = math.floor(AddGX*RewardNum)
								API_ActorAddExp(ActorID,ExtraReward,0,'修炼技能探索资源增加'..ExtraReward..'经验')
								API_ActorSendMsg(ActorID,10,'修炼效果：额外增加'..ExtraReward..'经验')
							end
						elseif expAddMax == 0 then
							API_ActorSendMsg(ActorID,3,'您的经验达到上限，已无法再获得经验，请尽快升级')
							API_ActorSendMsg(ActorID,7,'您的经验达到上限，已无法再获得经验，请尽快升级，今天可获得经验次数还剩'..SearchResourceAddGXNum-AddGXNum2..'次')
						else
							PetExp = expAddMax
							API_ActorAddExp(ActorID,expAddMax,0,'探索资源增加'..expAddMax..'经验')
							API_ActorSendMsg(ActorID,10,'探索资源获得'..expAddMax..'经验，今天可获得经验次数还剩'..SearchResourceAddGXNum-AddGXNum2..'次')
							if RewardNum ~= 0 then
								ExtraReward = math.floor(expAddMax*RewardNum)
								API_ActorAddExp(ActorID,ExtraReward,0,'修炼技能探索资源增加'..ExtraReward..'经验')
								API_ActorSendMsg(ActorID,3,'修炼效果：额外增加'..ExtraReward..'经验')
							end
						end
						local PetLV = API_GetActorConjedPetPropNum(ActorID,2)
						if PetLV ~= -1 then
							local BiLv = 0
							for j in SearchResource_PetExpTable[GD] do
								local PetMin = SearchResource_PetExpTable[GD][j].Min
								local PetMax = SearchResource_PetExpTable[GD][j].Max
								if PetLV >= PetMin and PetLV <= PetMax then
									BiLv = SearchResource_PetExpTable[GD][j].BiLv
									PetExp = (PetExp * WYL_PetExpBiLv) * BiLv
									break
								end
							end
							if PetExp <= 0 then
								PetExp = 1
							end
							API_ActorAddPetExp(ActorID,PetExp,0,'探索资源给宠物加经验')
						end
					end
					API_VarDataSetNumber(ActorID,1,19030,0)
					API_VarDataSetNumber(ActorID,1,19031,0)
					API_VarDataSetNumber(ActorID,1,19032,0)
					API_VarDataSetNumber(ActorID,0,19033,10)
					API_ActorAddHunger(ActorID,SearchResource_AddHuoLi)
					API_CreateTimerTrigger(ActorID,1,10,-1,'SearchResource_LuoPanTimerTrigger')
					API_ActorSendMsg(ActorID,7,'成功找到资源，增加'..AddShuLianDu..'点熟练度，'..SearchResource_AddHuoLi..'点活力值，今天还可完成'..SearchResource_TanKuangNum-TanKuangNum2..'次探矿任务，每天最多可完成'..SearchResource_TanKuangNum..'次探矿任务。')
					--创建资源
					--判断是否狩猎，如果是狩猎则刷新怪物，否则就刷新盒子
					if GoodsID == 864 or GoodsID == 869 or GoodsID == 874 or GoodsID == 879 then
						for i = 1,AddZY do
							local FastID = API_CreateMonster(PlayMapID,ZY,PlayX-2,PlayY-2,4,0, -1)
							API_SetAwardOwner(FastID, ActorID)
						end
					else
						API_CreateResBoxEx_UID(PlayMapID,PlayX,PlayY,ZY,AddZY,'探矿：'..AddZY..'个'..SkillName..'',0,4,ActorID,180,600)
					end
					--风向标
					if GD == 1 then
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						local Type = 4
						if GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] + 1
						end
					elseif GD == 2 then
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						local Type = 5
						if GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] + 1
						end
					elseif GD == 3 then
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						local Type = 6
						if GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[14][Type][LaiYuan] + 1
						end
					end
					epfunc_WYL_SaveData_TanKuang(ActorID,10,TanKuangNum2)
					if API_VarDataGetNumber(ActorID,1,12138) == 0 then
						API_VarDataSetNumber(ActorID,1,12138,1)
						g_EventSystem:FireAction( ActorID, nil, _EVENT_ID_PROSPECT, _E_SRC_TYPE_GOODS, nil)
					end
				end
			end
		else
			Time = Time + 1
			ConvectionInfo = ConvectionSign * 100000000 + TileX * 100000 + TileY * 100 + Time
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
		end
	end
end

function SearchResource_TuBiaoTimerTrigger(ActorID,b)
	if API_ActorIsOnline(ActorID) then
		local Time = API_VarDataGetNumber(ActorID,0,19035)
		Time = Time -1
		API_VarDataSetNumber(ActorID,0,19035,Time)
		if Time == 1 then
			local PlayTBID = API_VarDataGetNumber(ActorID,0,19034)
			API_VarDataSetNumber(ActorID,0,19034,0)
			if PlayTBID > 0 then
				API_ActorDelMapPoint(ActorID,PlayTBID)
			end
		end
	end
end

function SearchResource_LuoPanTimerTrigger(ActorID,b)
	if API_ActorIsOnline(ActorID) then 
		local Time = API_VarDataGetNumber(ActorID,0,19033)
		Time = Time -1
		API_VarDataSetNumber(ActorID,0,19033,Time)
	end
end

function SearchResource_XY(CampID,GoodsID,PlayMapID,PlayX,PlayY)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local KMapID = SearchResource_LuoPanTable[GoodsID].MapID[math.random(table.getn(SearchResource_LuoPanTable[GoodsID].MapID))]
	for j,v in SearchResource_LuoPanTable[GoodsID].MapID do
		if PlayMapID == v then
			local RandomMapGaiLv = math.random(100)
			if RandomMapGaiLv > 70 then
				KMapID = KMapID
			else
				KMapID = PlayMapID
			end
			break
		end
	end
	if Week == 6 or Week == 7 then
		if Hour >= 19 and Hour <22 then
			repeat
				KMapID = SearchResource_LuoPanTable[GoodsID].MapID[math.random(table.getn(SearchResource_LuoPanTable[GoodsID].MapID))]
			until KMapID ~= 100
		end
	end
	if GoodsID >= 860 and GoodsID <= 864 then
		if CampID == 0 then
			KMapID = 23
		elseif CampID == 1 then
			KMapID = 10
		end
	elseif GoodsID >= 865 and GoodsID <= 879 then
		if CampID == 0 then
			KMapID = 9
		elseif CampID == 1 then
			KMapID = 25
		end
	end
	local YuanDianX = SearchResource_LuoPanTileTable[KMapID].x
	local YuanDianY = SearchResource_LuoPanTileTable[KMapID].y
	local KX,KY = 0,0
	if PlayMapID == KMapID then
		repeat
			local KXYTable = SearchResource_LuoPanTileTable[KMapID].Tile
			local a = math.random(1,table.getn(KXYTable))
			local Tiles = KXYTable[a]
			KX = Tiles[1]
			KY = Tiles[2]
			local WeiZhi = 0
			if (YuanDianX - PlayX) > 0 and (YuanDianY - PlayY) > 0 then
				WeiZhi = 1
			elseif (YuanDianX - PlayX) > 0 and (YuanDianY - PlayY) < 0 then
				WeiZhi = 2
			elseif (YuanDianX - PlayX) < 0 and (YuanDianY - PlayY) < 0 then
				WeiZhi = 3
			elseif (YuanDianX - PlayX) < 0 and (YuanDianY - PlayY) > 0 then
				WeiZhi = 4
			end
			local WeiZhi2 = 0
			if (YuanDianX - KX) > 0 and (YuanDianY - KY) > 0 then
				WeiZhi2 = 1
			elseif (YuanDianX - KX) > 0 and (YuanDianY - KY) < 0 then
				WeiZhi2 = 2
			elseif (YuanDianX - KX) < 0 and (YuanDianY - KY) < 0 then
				WeiZhi2 = 3
			elseif (YuanDianX - KX) < 0 and (YuanDianY - KY) > 0 then
				WeiZhi2 = 4
			end
		until not WeiZhi ~= WeiZhi2
	else
		local KXYTable = SearchResource_LuoPanTileTable[KMapID].Tile
		local a = math.random(1,table.getn(KXYTable))
		local Tiles = KXYTable[a]
		KX = Tiles[1]
		KY = Tiles[2]
	end
	return KMapID,KX,KY
end

function SearchResource_JuanZhou()
	local ActorID = API_RequestGetActorID()
	local PlayMapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(PlayMapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	local ShuLianDu = API_VarDataGetNumber(ActorID,1,19029)
	if ShuLianDu > SearchResource_SLDMax then
		API_VarDataSetNumber(ActorID,1,19029,SearchResource_SLDMax)
		ShuLianDu = SearchResource_SLDMax
	end
	local KuangMapID = API_VarDataGetNumber(ActorID,1,19030)
	local KuangXY = API_VarDataGetNumber(ActorID,1,19031)
	local KuangX = math.floor(KuangXY/10000)
	local KuangY = math.mod(KuangXY,10000)
	local GoodsID = API_VarDataGetNumber(ActorID,1,19032)
	local XianShi = 0
	local JuLi = 0
	local LV = 1
	local Max = 0
	local FangXiang = ''
	if GoodsID ~= 0 then
		local GD = 0
		if GoodsID == 860 or GoodsID == 861 or GoodsID == 862 or GoodsID == 863 or GoodsID == 864 then
			GD = 1
		elseif GoodsID == 865 or GoodsID == 866 or GoodsID == 867 or GoodsID == 868 or GoodsID == 869 then
			GD = 2 
		elseif GoodsID == 870 or GoodsID == 871 or GoodsID == 872 or GoodsID == 873 or GoodsID == 874 then
			GD = 3
		end
		local ResourceTable = SearchResource_ResourceTable[GD].Resource
		for j in ResourceTable do
			local x = ResourceTable[j].x
			local y = ResourceTable[j].y
			if ShuLianDu >= x and ShuLianDu <= y then
				XianShi = ResourceTable[j].XS
				LV = ResourceTable[j].LV
				Max = y + 1
				break
			end
		end
		JuLi = PublicFun_AccountDistance(PlayX,PlayY,KuangX,KuangY)
		FangXiang = PublicFun_AccountDirection(PlayX,PlayY,KuangX,KuangY)
	else
		local ResourceTable = SearchResource_ResourceTable[1].Resource
		for j in ResourceTable do
			local x = ResourceTable[j].x
			local y = ResourceTable[j].y
			if ShuLianDu >= x and ShuLianDu <= y then
				LV = ResourceTable[j].LV
				Max = y + 1
				break
			end
		end
	end
	API_ResponseWrite('<name>资源探测器</name>')
	API_ResponseWrite('<br><text>您当前熟练度为：</text><text color="255,0,255">'..ShuLianDu..'</text><text>，探矿级别：</text><text color="255,0,255">'..LV..'级</text><text> （级别越高探测出的资源越多），</text>')
	if Max < SearchResource_SLDMax then
		API_ResponseWrite('<text>升级所需熟练度：</text><text color="255,0,255">'..Max..'</text><br>')
	else
		API_ResponseWrite('<text>您的探矿级别已达满级。</text><br>')
	end
	if GoodsID == 0 then
		API_ResponseWrite('<br><text>目前没有使用探测器。</text><br>')
		API_ResponseWrite('<br><br><br>')
	else
		API_ResponseWrite('<br><text>正在使用：</text><text color="255,0,255">'..API_GetGoodsName(GoodsID)..'</text><br>')
		if KuangMapID == MapConfigID then
			if JuLi <= 3 then
				API_ResponseWrite('<br><text>资源就在您的脚下！探索吧！！</text><br>')
			else
				local JuLiName = '未知'
				if JuLi > 3 and JuLi <= 15 then
					JuLiName = '附近'
				elseif JuLi > 15 and JuLi <= 50 then
					JuLiName = '不远'
				elseif JuLi > 50 and JuLi <=100 then
					JuLiName = '比较远'
				elseif JuLi > 100 then
					JuLiName = '很远'
				end
				if XianShi == 0 then
					API_ResponseWrite('<br><text>探测器探索资源在您的'..FangXiang..'方'..JuLiName..'</text><br>')
				elseif XianShi == 1 or XianShi == 2 then
					API_ResponseWrite('<br><text>探测器探索资源在您的'..FangXiang..'方'..JuLiName..'，具体坐标为['..API_TileToPixelX(KuangMapID,KuangX,KuangY)..','..API_TileToPixelY(KuangMapID,KuangX,KuangY)..']</text><br>')
				end
			end
		else
			API_ResponseWrite('<br><text>探测器探索到的资源在'..API_GetMapName(KuangMapID)..'地图，请您到达'..API_GetMapName(KuangMapID)..'后继续使用探测器探索</text><br>')
		end
		API_ResponseWrite('<br><br><br><a href="SearchResource_JuanZhou2?1=1">  放弃本次探索（两分钟冷却）</a><text>      </text>')
	end
	API_ResponseWrite('<a href="SearchResource_JuanZhou2?1=2">  删除卷轴</a><text>      </text>')
	API_ResponseWrite('<a>关闭</a><br>')
end

function SearchResource_JuanZhou2()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local KuangMapID = API_VarDataGetNumber(ActorID,1,19030)
	if XuanZe == 1 then
		if KuangMapID > 0 then
			API_VarDataSetNumber(ActorID,1,19030,0)
			API_VarDataSetNumber(ActorID,1,19031,0)
			API_VarDataSetNumber(ActorID,1,19032,0)
			API_VarDataSetNumber(ActorID,0,19038,0)
			API_ActorSendMsg(ActorID,3,'已成功放弃本次资源探索，探测器需要冷却两分钟才能再次使用')
			API_VarDataSetNumber(ActorID,0,19033,120)
			API_CreateTimerTrigger(ActorID,1,120,-1,'SearchResource_LuoPanTimerTrigger')
		end
	elseif XuanZe == 2 then
		API_RemoveTaskScroll(ActorID,50003)
		API_VarDataSetNumber(ActorID,0,19038,0)
	end
end
