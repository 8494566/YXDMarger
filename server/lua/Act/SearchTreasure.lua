----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\SearchTreasure.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2009-3-9
--版  本:	1.0
--描  述:	每日活动：探宝系统
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：万钰林
--日期：2009-3-9
--功能：创建
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--19040 存储探宝熟练度
--19041 存储玩家使用藏宝箱次数
--19042 存储玩家使用藏宝图的YMD
--19043 存储玩家合成藏宝图的次数
--19044 存储藏宝图物品ID
--19045 存储宝藏地图ID和描述编号
--19046 存储宝藏XY坐标
--19048 存储怪物地图ID和杀怪数量  没用到
--19049 存储怪物ID  没用到
--19060 存储杀怪触发器ID  没用到
--19061 存储玩家宝藏价值总和  没用到

SearchTreasure_ActTime = {
			[1] = {RedayTime=20,StartTime=21,EndTime=22},
}

local SearchTreasure_EndTime = 22
--刷活动怪物表
if SearchTreasure_SZDMonsterTable == nil then
SearchTreasure_SZDMonsterTable = {
			--[1] = {MapID=23,MonsterID=726197,MonsterNum=1664,x1=80,y1=100,x2=410,y2=410,x3=107,y3=307,x4=160,y4=349},
			--[2] = {MapID=10,MonsterID=726197,MonsterNum=1664,x1=80,y1=140,x2=410,y2=430,x3=111,y3=291,x4=154,y4=344},
			[1] = {MapID=104,MonsterID=726197,MonsterNum=3328,x1=380,y1=261,x2=490,y2=640,x3=0,y3=0,x4=0,y4=0},
			[2] = {MapID=98,MonsterID=726198,MonsterNum=832,x1=177,y1=181,x2=578,y2=559,x3=326,y3=319,x4=442,y4=441},
			[3] = {MapID=99,MonsterID=726198,MonsterNum=832,x1=180,y1=110,x2=570,y2=612,x3=348,y3=343,x4=399,y4=397},
			--[2] = {MapID=98,MonsterID=726198,MonsterNum=832,x1=177,y1=181,x2=578,y2=559,x3=326,y3=319,x4=442,y4=441},
			--[3] = {MapID=99,MonsterID=726198,MonsterNum=832,x1=180,y1=110,x2=570,y2=612,x3=348,y3=343,x4=399,y4=397},
			--[4] = {MapID=101,MonsterID=726198,MonsterNum=1664,x1=282,y1=211,x2=620,y2=590,x3=423,y3=437,x4=443,y4=457},
			--伯爵怪物ID 726199
}
end

if SearchTreasure_MonsterTable == nil then
SearchTreasure_MonsterTable = {
			--[1] = {MapID=23,MonsterID=726197,MonsterNum=1664,x1=80,y1=100,x2=410,y2=410,x3=107,y3=307,x4=160,y4=349},
			--[2] = {MapID=10,MonsterID=726197,MonsterNum=1664,x1=80,y1=140,x2=410,y2=430,x3=111,y3=291,x4=154,y4=344},
			--[1] = {MapID=104,MonsterID=726197,MonsterNum=3328,x1=300,y1=250,x2=648,y2=650,x3=0,y3=0,x4=0,y4=0},
			[1] = {MapID=101,MonsterID=726198,MonsterNum=1664,x1=282,y1=211,x2=620,y2=590,x3=423,y3=437,x4=443,y4=457},
			--伯爵怪物ID 726199
}
end

SearchTreasure_MapBoxTab = {
	[10] = {BoxID=12345,BoxNum=1,x1=84,y1=114,x2=379,y2=431,	x3=111,y3=283,x4=163,y4=340,	x5=111,y5=283,x6=163,y6=340,},
	[23] = {BoxID=12345,BoxNum=1,x1=59,y1=30,x2=450,y2=383,	x3=101,y3=299,x4=166,y4=353,	x5=101,y5=299,x6=166,y6=353,},
	[98] = {BoxID=12345,BoxNum=1,x1=177,y1=181,x2=578,y2=559,	x3=326,y3=319,x4=442,y4=441,	x5=326,y5=319,x6=442,y6=441,},
	[99] = {BoxID=12345,BoxNum=1,x1=180,y1=110,x2=570,y2=612,	x3=348,y3=343,x4=399,y4=397,	x5=348,y5=343,x6=399,y6=397,},
	[100] = {BoxID=12345,BoxNum=1,x1=187,y1=186,x2=526,y2=566,	x3=800,y3=800,x4=800,y4=800,	x5=800,y5=800,x6=800,y6=800},
	[101] = {BoxID=12345,BoxNum=1,x1=282,y1=211,x2=620,y2=590,	x3=423,y3=437,x4=443,y4=457,	x5=423,y5=437,x6=443,y6=457},
	[102] = {BoxID=12345,BoxNum=1,x1=322,y1=240,x2=788,y2=768,	x3=595,y3=768,x4=682,y4=852,	x5=489,y5=272,x6=576,y6=359,},
	[111] = {BoxID=12345,BoxNum=1,x1=139,y1=43,x2=645,y2=696,	x3=156,y3=450,x4=282,y4=561,	x5=298,y5=122,x6=433,y6=222,},
}

--暂时屏蔽猜拳宝箱
--~ for j in SearchTreasure_MapBoxTab do
--~ 	local MapID = API_GetRightMapID(j)
--~ 	local Table = SearchTreasure_MapBoxTab[j]
--~ 	if API_MapIsValid(MapID) then
--~ 		local BoxNum = Table.BoxNum
--~ 		for i = 1, BoxNum do
--~ 			local RandomTime = math.random(1800,3600)
--~ 			API_CreateTimerTriggerG(j,0, RandomTime,1, 'SearchTreasure_MapBox_CreatFunc')
--~ 		end
--~ 	end
--~ end

function SearchTreasure_MapBox_CreatFunc(MapConfigID,b)
	if SearchTreasure_MapBoxTab[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = SearchTreasure_MapBoxTab[MapConfigID]
		if API_MapIsValid(MapID) then
			local BoxID = Table.BoxID
			local x1 = Table.x1
			local y1 = Table.y1
			local x2 = Table.x2
			local y2 = Table.y2
			local x3 = Table.x3
			local y3 = Table.y3
			local x4 = Table.x4
			local y4 = Table.y4
			local x5 = Table.x5
			local y5 = Table.y5
			local x6 = Table.x6
			local y6 = Table.y6
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) and not ((x > x5 and x < x6) and (y > y5 and y < y6)) or Num == 300
			if not API_IsBlockTile(MapID,x,y,0) then
				local FastID = API_CreateMonster(MapID, BoxID, x, y, 4, 0, -1)
			end
		end
	end
end

local CangBaoTuGoodsID = 88009 -- 藏宝图ID
local SearchNum = 20
local SearchTreasure_AddHuoLi = 5 --每次找到宝藏增加活力值
local SearchTreasure_FanWei = 5 --搜索宝藏的范围

if SearchTreasure_MapMonsterTable == nil then --存每个地图的宝藏狂热者
	SearchTreasure_MapMonsterTable = {}
end
--需要修改物品ID  ★★★
SearchTreasure_TreasureTable = {
			--男爵藏宝图
			[88005] = {TreasureID=88005,PTMonsterID=726191,JYMonsterID=726192,GX=1612,
				SuiPian = {88008,88009},
				NoTestTreasure = 88020, --{
						--[88020] = {Min=1,Max=70},
						--[88021] = {Min=71,Max=95},
						--[88022] = {Min=96,Max=100},
						--},
				},
			--子爵藏宝图
			[88006] = {TreasureID=88006,PTMonsterID=726193,JYMonsterID=726194,GX=4930,
				SuiPian = {88012,88013},
				NoTestTreasure = 88023, --{
						--[88023] = {Min=1,Max=70},
						--[88024] = {Min=71,Max=95},
						--[88025] = {Min=96,Max=100},
						--},
				},
			--伯爵藏宝图
			[88007] = {TreasureID=88007,PTMonsterID=726195,JYMonsterID=726196,GX=11377,
				SuiPian = {88016,88017},
				NoTestTreasure = 88026,--{
						--[88026] = {Min=1,Max=70},
						--[88027] = {Min=71,Max=95},
						--[88028] = {Min=96,Max=100},
						--},
				},
}
--直接给宝藏ID
SearchTreasure_NewTreasureIDTable = {
			[88005] = {
				[88029] = {Min=1,Max=60},
				[88030] = {Min=61,Max=90},
				[88031] = {Min=91,Max=100},
				},
			[88006] = {
				[88032] = {Min=1,Max=60},
				[88033] = {Min=61,Max=90},
				[88034] = {Min=91,Max=100},
				},
			[88007] = {
				[88035] = {Min=1,Max=60},
				[88036] = {Min=61,Max=90},
				[88037] = {Min=91,Max=100},
				},
}
--未鉴定宝藏对应的已鉴定宝藏ID，需要修改物品ID  ★★★
SearchTreasure_TreasureIDTable = {
			--男爵
			[88020] = {
				[88029] = {Min=1,Max=60},
				[88030] = {Min=61,Max=90},
				[88031] = {Min=91,Max=100},
				},
			[88021] = {
				[88029] = {Min=1,Max=60},
				[88030] = {Min=61,Max=90},
				[88031] = {Min=91,Max=100},
				},
			[88022] = {
				[88029] = {Min=1,Max=60},
				[88030] = {Min=61,Max=90},
				[88031] = {Min=91,Max=100},
				},
			--子爵
			[88023] = {
				[88032] = {Min=1,Max=60},
				[88033] = {Min=61,Max=90},
				[88034] = {Min=91,Max=100},
				},
			[88024] = {
				[88032] = {Min=1,Max=60},
				[88033] = {Min=61,Max=90},
				[88034] = {Min=91,Max=100},
				},
			[88025] = {
				[88032] = {Min=1,Max=60},
				[88033] = {Min=61,Max=90},
				[88034] = {Min=91,Max=100},
				},
			--伯爵
			[88026] = {
				[88035] = {Min=1,Max=60},
				[88036] = {Min=61,Max=90},
				[88037] = {Min=91,Max=100},
				},
			[88027] = {
				[88035] = {Min=1,Max=60},
				[88036] = {Min=61,Max=90},
				[88037] = {Min=91,Max=100},
				},
			[88028] = {
				[88035] = {Min=1,Max=60},
				[88036] = {Min=61,Max=90},
				[88037] = {Min=91,Max=100},
				},
}
--打开空的宝箱时给经验奖励
SearchTreasure_GXJiangLiTable = {
			[88029] = 2252,
			[88030] = 3154,
			[88031] = 4506,
			[88032] = 6576,
			[88033] = 9206,
			[88034] = 13152,
			[88035] = 12888,
			[88036] = 18042,
			[88037] = 25776,
}
--宠物经验
SearchTreasure_PetExpTable = {
	[88029] = {
		[1] = {Min=0,Max=10,BiLv=0.5},
		[2] = {Min=11,Max=25,BiLv=1},
		[3] = {Min=26,Max=40,BiLv=1},
		[4] = {Min=41,Max=55,BiLv=1},
		},
	[88030] = {
		[1] = {Min=0,Max=10,BiLv=0.5},
		[2] = {Min=11,Max=25,BiLv=1},
		[3] = {Min=26,Max=40,BiLv=1},
		[4] = {Min=41,Max=55,BiLv=1},
		},
	[88031] = {
		[1] = {Min=0,Max=10,BiLv=0.5},
		[2] = {Min=11,Max=25,BiLv=1},
		[3] = {Min=26,Max=40,BiLv=1},
		[4] = {Min=41,Max=55,BiLv=1},
		},
	[88032] = {
		[1] = {Min=0,Max=10,BiLv=0.1},
		[2] = {Min=11,Max=25,BiLv=0.5},
		[3] = {Min=26,Max=40,BiLv=1},
		[4] = {Min=41,Max=55,BiLv=1},
		},
	[88033] = {
		[1] = {Min=0,Max=10,BiLv=0.1},
		[2] = {Min=11,Max=25,BiLv=0.5},
		[3] = {Min=26,Max=40,BiLv=1},
		[4] = {Min=41,Max=55,BiLv=1},
		},
	[88034] = {
		[1] = {Min=0,Max=10,BiLv=0.1},
		[2] = {Min=11,Max=25,BiLv=0.5},
		[3] = {Min=26,Max=40,BiLv=1},
		[4] = {Min=41,Max=55,BiLv=1},
		},
	[88035] = {
		[1] = {Min=0,Max=10,BiLv=0.01},
		[2] = {Min=11,Max=25,BiLv=0.1},
		[3] = {Min=26,Max=40,BiLv=0.5},
		[4] = {Min=41,Max=55,BiLv=1},
		},
	[88036] = {
		[1] = {Min=0,Max=10,BiLv=0.01},
		[2] = {Min=11,Max=25,BiLv=0.1},
		[3] = {Min=26,Max=40,BiLv=0.5},
		[4] = {Min=41,Max=55,BiLv=1},
		},
	[88037] = {
		[1] = {Min=0,Max=10,BiLv=0.01},
		[2] = {Min=11,Max=25,BiLv=0.1},
		[3] = {Min=26,Max=40,BiLv=0.5},
		[4] = {Min=41,Max=55,BiLv=1},
		},
}
--藏宝地图，需要增加地图编号 ★★★
SearchTreasure_TreasureDGMapTable = {
			[88005] = {23},
			[88006] = {23,99,100,101,},
			[88007] = {99,100,101,102,111,},
}

SearchTreasure_TreasureLBMapTable = {
			[88005] = {10},
			[88006] = {10,98,100,101,},
			[88007] = {98,100,101,102,111,},
}

SearchTreasure_SuiPianTable = {
			--男爵
			[88008] = {MS='这是二档藏宝图的A部分的碎片。'},
			[88009] = {MS='这是二档藏宝图的B部分的碎片。'},
			[88010] = {MS='这是二档藏宝图的C部分的碎片。'},
			[88011] = {MS='这是二档藏宝图的D部分的碎片。'},
			--子爵
			[88012] = {MS='这是三档藏宝图的A部分的碎片。'},
			[88013] = {MS='这是三档藏宝图的B部分的碎片。'},
			[88014] = {MS='这是三档藏宝图的C部分的碎片。'},
			[88015] = {MS='这是三档藏宝图的D部分的碎片。'},
			--伯爵
			[88016] = {MS='这是四档藏宝图的A部分的碎片。'},
			[88017] = {MS='这是四档藏宝图的B部分的碎片。'},
			[88018] = {MS='这是四档藏宝图的C部分的碎片。'},
			[88019] = {MS='这是四档藏宝图的D部分的碎片。'},
}

SearchTreasure_TreasureTileTable = {
			--MapID
			--阳光雨林
			[23] = {
				--直接写做表 X、Y、描述目录代号
				{68,328,1},
				{313,294,2},
				{297,44,3},
				{209,260,4},
				{31,291,9},
				{166,295,10},
				{285,371,11},
				{312,277,12},
				{382,185,13},
				{225,175,14},
				{259,178,40},
				{265,267,41},
				{322,211,42},
				{414,171,43},
				{197,336,44},
				{140,250,45},
				},
			--珊瑚群岛
			[10] = {
				{106,378,5},
				{147,431,6},
				{281,245,7},
				{270,205,8},
				{170,173,15},
				{333,158,16},
				{250,365,17},
				{150,242,46},
				{161,290,47},
				{176,314,48},
				{191,345,49},
				{262,273,50},
				{360,235,51},
				{349,117,52},
				{106,259,53},
				{221,268,54},
				},
			--娜纱湿地
			[98] = {
				{215,489,18},
				{397,270,19},
				{512,311,20},
				{505,444,21},
				{372,507,22},
				},
			--落日农庄
			[99] = {
				{422,452,23},
				{512,440,24},
				{424,218,25},
				{325,389,26},
				},
			--征战平原
			[100] = {
				{509,319,27},
				{241,296,28},
				{223,501,29},
				{366,484,30},
				},
			--月暮草场
			[101] = {
				{277,260,31},
				{455,355,32},
				{442,450,33},
				{504,548,34},
				},
			--沙暴绿洲
			[102] = {
				{535,746,35},
				{712,615,36},
				{692,294,37},
				{319,564,38},
				{514,540,39},
				},
			--光明遗迹
			[111] = {
				{660,304,55},
				{527,258,56},
				{482,155,57},
				{379,345,58},
				{257,277,59},
				{357,586,60},
				},
}
--需要增加地点描述 ★★★
SearchTreasure_EventTable = {
			--每个描述里面可以加上随机事件编号表
			[1] = {SM='朝露山谷北边，红色的蘑菇正下方'},
			[2] = {SM='蔷薇湖岛中间，褐色的宝箱正下方'},
			[3] = {SM='孤寂山谷，恐怖伐木机左边的帐篷门口'},
			[4] = {SM='11级～25级空间塔那，从左边旗帜开始，向左下方向走22步即可'},
			[5] = {SM='岩石浪屿，最大的仙人掌群正下方'},
			[6] = {SM='黑海岸，海边破旧铁锚链条的尽头'},
			[7] = {SM='飓风荒漠中心点左边，最小的石塔正下方'},
			[8] = {SM='伊鲁荒漠，恐怖的恶魔之门阴影中间'},
			[9] = {SM='朝露山谷左边的海岸，有一个很大的破烂海螺化石，宝藏就在那'},
			[10] = {SM='火炬村下方的出口不远处，树从下有一丛美丽的紫罗兰……'},
			[11] = {SM='桥头堡垒东南的海岸，海岸边腐烂的船板，里面似乎有什么东西……'},
			[12] = {SM='蔷薇湖左下的那个浮桥，杂物堆边的陶罐里有神秘的光点……'},
			[13] = {SM='怒焰平原那有一个天然的石门，据说曾经是祭神的地方'},
			[14] = {SM='瘟毒林地，黑尾总是喜欢在荒废的机械架那摆弄着什么……'},
			[15] = {SM='撒哈荒原附近有一堆海螺化石，传闻有人在那捡到过宝石'},
			[16] = {SM='天火堡垒，右上方山脚下，水洼边的木箱'},
			[17] = {SM='莱茵海岸那，在船员还未感染之前，船长把他的箱子埋在了一个仙人球化石的下面'},
			[18] = {SM='隐雾森林那曾经有一个爱好收集宝石的巨龙，现在，那只龙已经变成了一堆骸骨，也许哪里还会留下点什么'},
			[19] = {SM='洛亚林地有一个神奇的小水池，里面经常有阵阵金光冒出来，传说蘑菇人就是从那里面诞生的'},
			[20] = {SM='凯斯特山谷那，曾经的村长总是经常神神秘秘的在荣耀雕像前面那摆几个不起眼的麻袋……'},
			[21] = {SM='娜纱湿地地图右边靠近征战平原的入口那，有一堆美丽的花冠丛，里面有一截空心的树壳，传闻经常有厄灵在那里进进出出……'},
			[22] = {SM='魇魔谷地，某堆沙包堆边上有一个熄灭的火堆，那里有被人翻过的迹象'},
			[23] = {SM='落日小镇空间传送塔右上，有一个奇怪的黄色土丘……'},
			[24] = {SM='落日小镇右下方向，熊兽的聚集地，有一截奇怪的黑木桩……'}, --描述要重写
			[25] = {SM='落日小镇左下方向，31级蛇女武士出没的山谷，营地边上野兽头骨正前方，有几朵小红花正在傲然开放'}, --描述要重写
			[26] = {SM='落日小镇左上方向的麦田里，村长的儿子最喜欢躲在高高的两个麦堆中玩捉迷藏了，也不知道他在里面藏了什么东西'}, --描述要重写
			[27] = {SM='白银之城的帝国资源采集场的下面，一个被树阴遮掩的蘑菇……'}, --描述要重写
			[28] = {SM='雅怡阁西北门的高塔之下'}, --描述要重写
			[29] = {SM='明水轩北方的海边，枯黄的海草'}, --描述要重写
			[30] = {SM='温然居左边平原，石堆杂物堆积中的陶罐'}, --描述要重写
			[31] = {SM='月影山谷左上方的海岸，废弃的瞭望塔，巨兽的头骨'}, --描述要重写
			[32] = {SM='亚瑟平原，锈迹斑斑的废旧齿轮'}, --描述要重写
			[33] = {SM='伊度盆地，被人遗忘的黄色麻袋'}, --描述要重写
			[34] = {SM='落月谷地，传送塔边上废旧的机械'}, --描述要重写
			[35] = {SM='四号沙虫节拍器，斗士的首领经常在那个木桌边构思着他的阴谋，刀尖所指的地方就是流血之地'}, --描述要重写
			[36] = {SM='五号沙虫节拍器，一堆木箱边上的土陶罐'}, --描述要重写
			[37] = {SM='二号沙虫节拍器西南方向，破碎的仙人球化石'}, --描述要重写
			[38] = {SM='一号沙虫节拍器北面海岸边的木船碎片'}, --描述要重写
			[39] = {SM='三号沙虫节拍器附近鸟蛋边的骨头'}, --描述要重写
			[40] = {SM='绿光湖北面，坍塌的矿井入口，一车绿水晶翻倒的地方'}, --描述要重写
			[41] = {SM='魔咒森林上方的群山之畔，粉红色小花盛开的地方'}, --描述要重写
			[42] = {SM='魔咒森林下方和怒焰平原交界的道路上方，废弃的伐木工营地的帐篷下面'}, --描述要重写
			[43] = {SM='怒焰平原右下，有一艘飞艇坠落在那，去找找看，应该能发现点什么'}, --描述要重写
			[44] = {SM='呼啸庄园的麦田里，老园长的儿子以前最喜欢在那扮稻草人了，有人曾看过他在那里埋过什么东西'}, --描述要重写
			[45] = {SM='塔夫的矿井入口左下方向不远处，枯黄的老树左边'}, --描述要重写
			[46] = {SM='枯木林，两棵枯萎的老树中间，边上还有一个巨大的海螺化石'}, --描述要重写
			[47] = {SM='珊瑚镇城墙边上，一堆木桶附近'}, --描述要重写
			[48] = {SM='珊瑚镇东南边出镇口，两座小山丘底下，红色的箱子'}, --描述要重写
			[49] = {SM='塔夫的矿井入口下方，紫色的水晶之上'}, --描述要重写
			[50] = {SM='飓风荒漠上方，闪耀着银白色泽的黑色铁罐……'}, --描述要重写
			[51] = {SM='亚斯特海湾的西南方，一艘承载着金银珠宝的远洋船曾经在那沉没，只余下一堆破烂的木头被冲上岸'}, --描述要重写
			[52] = {SM='天火堡垒，海岸边的木箱'}, --描述要重写
			[53] = {SM='枯木林，一棵即将枯死的老树，上面满是金黄的树叶，树下曾经出现过五彩的光芒'}, --描述要重写
			[54] = {SM='空间塔下方，一小堆紫水晶那里，有一个翻倒在地上的黄木桶'}, --描述要重写
			[55] = {SM='龙之海湾，有一处小沙坑，那里隐隐透露出闪闪的光芒'},
			[56] = {SM='幽暗石林，死水之地'},
			[57] = {SM='魔幻沙地，破碎的遗迹，深埋的红色宝箱！'},
			[58] = {SM='恐怖废墟，巨大的石塔埋葬着那些远古的痕迹'},
			[59] = {SM='仙人掌丛林，一个被人遗忘的木质宝箱……'},
			[60] = {SM='海螺沙滩，一头远古海兽曾经在这里疯狂肆虐，人类的勇士将其杀死，并斩下了它的头颅，传闻这只海兽死前吃下过不少商队的货物……'},
}

SearchTreasure_RandomEventNumTable = {
			[1] = {Min=1,Max=50}, --直接得藏宝箱
			[2] = {Min=51,Max=69}, --中陷阱得藏宝箱
			[3] = {Min=70,Max=80}, --出现一群小怪，杀死得藏宝箱
			[4] = {Min=81,Max=91}, --出现一个BOSS，杀死得藏宝箱
			[5] = {Min=92,Max=98}, --出现一群小怪和BOSS，杀死得藏宝箱
			[6] = {Min=99,Max=100}, --什么都没有
}

--建立随机事件表
SearchTreasure_RandomEventTable = {
			[1] = {HSM='SearchTreasure_RandomEvent1'},
			[2] = {HSM='SearchTreasure_RandomEvent2'},
			[3] = {HSM='SearchTreasure_RandomEvent3'},
			[4] = {HSM='SearchTreasure_RandomEvent4'},
			[5] = {HSM='SearchTreasure_RandomEvent5'},
			[6] = {HSM='SearchTreasure_RandomEvent6'},
}

--奖励表，需要填物品ID ★★★
SearchTreasure_TreasureJiangLiTable = {
			--男低
			[88029] = {
				{GoodsID=80049,GaiLv1=1,GaiLv2=43385,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80065,GaiLv1=43386,GaiLv2=86771,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40250,GaiLv1=86772,GaiLv2=103041,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40266,GaiLv1=103042,GaiLv2=119311,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40202,GaiLv1=119312,GaiLv2=132327,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40218,GaiLv1=132328,GaiLv2=145343,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40234,GaiLv1=145344,GaiLv2=158359,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80383,GaiLv1=158360,GaiLv2=1604556,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80381,GaiLv1=1604557,GaiLv2=2906134,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80181,GaiLv1=2906135,GaiLv2=4207712,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80191,GaiLv1=4207713,GaiLv2=5509290,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80195,GaiLv1=5509291,GaiLv2=7678586,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=88171,GaiLv1=7678587,GaiLv2=9847882,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80274,GaiLv1=9847883,GaiLv2=9880422,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80950,GaiLv1=9880423,GaiLv2=9912962,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=4201,GaiLv1=9912963,GaiLv2=9917030,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5201,GaiLv1=9917031,GaiLv2=9921098,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6201,GaiLv1=9921099,GaiLv2=9925166,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4102,GaiLv1=9925167,GaiLv2=9928420,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5102,GaiLv1=9928421,GaiLv2=9931674,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6102,GaiLv1=9931675,GaiLv2=9934928,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=82004,GaiLv1=9934929,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				},
			--男中
			[88030] = {
				{GoodsID=80049,GaiLv1=1,GaiLv2=1029269,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80065,GaiLv1=1029270,GaiLv2=2058539,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40250,GaiLv1=2058540,GaiLv2=2444516,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40266,GaiLv1=2444517,GaiLv2=2830493,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40202,GaiLv1=2830494,GaiLv2=2861372,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40218,GaiLv1=2861373,GaiLv2=2892251,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40234,GaiLv1=2892252,GaiLv2=2923130,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80383,GaiLv1=2923131,GaiLv2=3695083,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80381,GaiLv1=3695084,GaiLv2=4467036,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80181,GaiLv1=4467037,GaiLv2=5238989,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80191,GaiLv1=5238990,GaiLv2=6010942,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80195,GaiLv1=6010943,GaiLv2=6782895,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=88171,GaiLv1=6782896,GaiLv2=7554848,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80274,GaiLv1=7554849,GaiLv2=7632044,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80950,GaiLv1=7632045,GaiLv2=8403997,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=4201,GaiLv1=8403998,GaiLv2=8413647,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5201,GaiLv1=8413648,GaiLv2=8423297,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6201,GaiLv1=8423298,GaiLv2=8432947,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4102,GaiLv1=8432948,GaiLv2=8440667,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5102,GaiLv1=8440668,GaiLv2=8448387,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6102,GaiLv1=8448388,GaiLv2=8456107,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=82004,GaiLv1=8456108,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				},
			--男高
			[88031] = {
				{GoodsID=80049,GaiLv1=1,GaiLv2=94284,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80065,GaiLv1=94285,GaiLv2=188569,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40250,GaiLv1=188570,GaiLv2=542135,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40266,GaiLv1=542136,GaiLv2=895701,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40202,GaiLv1=895702,GaiLv2=1178554,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40218,GaiLv1=1178555,GaiLv2=1461407,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40234,GaiLv1=1461408,GaiLv2=1744260,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80383,GaiLv1=1744261,GaiLv2=2451391,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80381,GaiLv1=2451392,GaiLv2=3158522,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80181,GaiLv1=3158523,GaiLv2=3865653,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80191,GaiLv1=3865654,GaiLv2=4572784,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80195,GaiLv1=4572785,GaiLv2=5279915,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=88171,GaiLv1=5279916,GaiLv2=5987046,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80274,GaiLv1=5987047,GaiLv2=7401307,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80950,GaiLv1=7401308,GaiLv2=8108438,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=4201,GaiLv1=8108439,GaiLv2=8196830,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5201,GaiLv1=8196831,GaiLv2=8285222,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6201,GaiLv1=8285223,GaiLv2=8373614,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4102,GaiLv1=8373615,GaiLv2=8444328,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5102,GaiLv1=8444329,GaiLv2=8515042,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6102,GaiLv1=8515043,GaiLv2=8585756,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=82004,GaiLv1=8585757,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				},
			--子低
			[88032] = {
				{GoodsID=80050,GaiLv1=1,GaiLv2=42490,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80066,GaiLv1=42491,GaiLv2=84981,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80409,GaiLv1=84982,GaiLv2=97729,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80405,GaiLv1=97730,GaiLv2=105696,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40252,GaiLv1=105697,GaiLv2=121630,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40268,GaiLv1=121631,GaiLv2=137564,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40204,GaiLv1=137565,GaiLv2=150312,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40220,GaiLv1=150313,GaiLv2=163060,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40236,GaiLv1=163061,GaiLv2=175808,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80384,GaiLv1=175809,GaiLv2=2300328,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80382,GaiLv1=2300329,GaiLv2=3893718,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80181,GaiLv1=3893719,GaiLv2=5168430,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80192,GaiLv1=5168431,GaiLv2=6078939,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80196,GaiLv1=6078940,GaiLv2=7672329,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=88171,GaiLv1=7672330,GaiLv2=9796849,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80274,GaiLv1=9796850,GaiLv2=9860585,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80951,GaiLv1=9860586,GaiLv2=9873333,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=82004,GaiLv1=9873334,GaiLv2=9937069,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=4402,GaiLv1=9937070,GaiLv2=9941053,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5402,GaiLv1=9941054,GaiLv2=9945037,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6402,GaiLv1=9945038,GaiLv2=9949021,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4302,GaiLv1=9949022,GaiLv2=9953005,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5302,GaiLv1=9953006,GaiLv2=9956989,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6302,GaiLv1=9956990,GaiLv2=9960973,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4002,GaiLv1=9960974,GaiLv2=9964957,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4502,GaiLv1=9964958,GaiLv2=9968941,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5002,GaiLv1=9968942,GaiLv2=9972925,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5502,GaiLv1=9972926,GaiLv2=9976909,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6002,GaiLv1=9976910,GaiLv2=9980893,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6502,GaiLv1=9980894,GaiLv2=9984877,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4202,GaiLv1=9984878,GaiLv2=9988861,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5202,GaiLv1=9988862,GaiLv2=9992845,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6202,GaiLv1=9992846,GaiLv2=9996829,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=80387,GaiLv1=9996830,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				},
			--子中
			[88033] = {
				{GoodsID=80050,GaiLv1=1,GaiLv2=1084966,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80066,GaiLv1=1084967,GaiLv2=2169933,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80409,GaiLv1=2169934,GaiLv2=2202482,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80405,GaiLv1=2202483,GaiLv2=2222826,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40252,GaiLv1=2222827,GaiLv2=2629689,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40268,GaiLv1=2629690,GaiLv2=3036552,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40204,GaiLv1=3036553,GaiLv2=3069101,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40220,GaiLv1=3069102,GaiLv2=3101650,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40236,GaiLv1=3101651,GaiLv2=3134199,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80384,GaiLv1=3134200,GaiLv2=3947924,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80382,GaiLv1=3947925,GaiLv2=4761649,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80181,GaiLv1=4761650,GaiLv2=5575374,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80192,GaiLv1=5575375,GaiLv2=6389099,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80196,GaiLv1=6389100,GaiLv2=7202824,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=88171,GaiLv1=7202825,GaiLv2=8016549,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80274,GaiLv1=8016550,GaiLv2=8179294,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80951,GaiLv1=8179295,GaiLv2=8211843,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=82004,GaiLv1=8211844,GaiLv2=9839293,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=4402,GaiLv1=9839294,GaiLv2=9849465,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5402,GaiLv1=9849466,GaiLv2=9859637,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6402,GaiLv1=9859638,GaiLv2=9869809,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4302,GaiLv1=9869810,GaiLv2=9879981,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5302,GaiLv1=9879982,GaiLv2=9890153,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6302,GaiLv1=9890154,GaiLv2=9900325,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4002,GaiLv1=9900326,GaiLv2=9910497,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4502,GaiLv1=9910498,GaiLv2=9920669,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5002,GaiLv1=9920670,GaiLv2=9930841,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5502,GaiLv1=9930842,GaiLv2=9941013,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6002,GaiLv1=9941014,GaiLv2=9951185,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6502,GaiLv1=9951186,GaiLv2=9961357,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4202,GaiLv1=9961358,GaiLv2=9971529,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5202,GaiLv1=9971530,GaiLv2=9981701,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6202,GaiLv1=9981702,GaiLv2=9991873,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=80387,GaiLv1=9991874,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				},
			--子高
			[88034] = {
				{GoodsID=80050,GaiLv1=1,GaiLv2=86067,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80066,GaiLv1=86068,GaiLv2=172135,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80409,GaiLv1=172136,GaiLv2=430339,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80405,GaiLv1=430340,GaiLv2=591717,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40252,GaiLv1=591718,GaiLv2=914472,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40268,GaiLv1=914473,GaiLv2=1237227,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40204,GaiLv1=1237228,GaiLv2=1495431,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40220,GaiLv1=1495432,GaiLv2=1753635,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40236,GaiLv1=1753636,GaiLv2=2011839,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80384,GaiLv1=2011840,GaiLv2=2657348,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80382,GaiLv1=2657349,GaiLv2=3302857,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80181,GaiLv1=3302858,GaiLv2=3948366,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80192,GaiLv1=3948367,GaiLv2=4593875,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80196,GaiLv1=4593876,GaiLv2=5239384,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=88171,GaiLv1=5239385,GaiLv2=5884893,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80274,GaiLv1=5884894,GaiLv2=7175910,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80951,GaiLv1=7175911,GaiLv2=7434114,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=82004,GaiLv1=7434115,GaiLv2=8725131,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=4402,GaiLv1=8725132,GaiLv2=8805820,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5402,GaiLv1=8805821,GaiLv2=8886509,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6402,GaiLv1=8886510,GaiLv2=8967198,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4302,GaiLv1=8967199,GaiLv2=9047887,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5302,GaiLv1=9047888,GaiLv2=9128576,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6302,GaiLv1=9128577,GaiLv2=9209265,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4002,GaiLv1=9209266,GaiLv2=9289954,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4502,GaiLv1=9289955,GaiLv2=9370643,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5002,GaiLv1=9370644,GaiLv2=9451332,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5502,GaiLv1=9451333,GaiLv2=9532021,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6002,GaiLv1=9532022,GaiLv2=9612710,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6502,GaiLv1=9612711,GaiLv2=9693399,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4202,GaiLv1=9693400,GaiLv2=9774088,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5202,GaiLv1=9774089,GaiLv2=9854777,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6202,GaiLv1=9854778,GaiLv2=9935466,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=80387,GaiLv1=9935467,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				},
			--伯低
			[88035] = {
				{GoodsID=80051,GaiLv1=1,GaiLv2=37526,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80067,GaiLv1=37527,GaiLv2=75053,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80409,GaiLv1=75054,GaiLv2=86311,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80405,GaiLv1=86312,GaiLv2=93348,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40254,GaiLv1=93349,GaiLv2=104606,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40270,GaiLv1=104607,GaiLv2=115864,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40206,GaiLv1=115865,GaiLv2=125246,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40222,GaiLv1=125247,GaiLv2=134628,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40238,GaiLv1=134629,GaiLv2=144010,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40256,GaiLv1=144011,GaiLv2=155268,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40272,GaiLv1=155269,GaiLv2=166526,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40208,GaiLv1=166527,GaiLv2=175908,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40224,GaiLv1=175909,GaiLv2=185290,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40240,GaiLv1=185291,GaiLv2=194672,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80384,GaiLv1=194673,GaiLv2=2070996,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80382,GaiLv1=2070997,GaiLv2=3478239,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80181,GaiLv1=3478240,GaiLv2=4604034,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80192,GaiLv1=4604035,GaiLv2=5408173,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80196,GaiLv1=5408174,GaiLv2=6815416,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80197,GaiLv1=6815417,GaiLv2=7941211,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=88171,GaiLv1=7941212,GaiLv2=9817535,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80274,GaiLv1=9817536,GaiLv2=9873825,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80952,GaiLv1=9873826,GaiLv2=9883207,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=82004,GaiLv1=9883208,GaiLv2=9939497,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=4103,GaiLv1=9939498,GaiLv2=9943016,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5103,GaiLv1=9943017,GaiLv2=9946535,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6103,GaiLv1=9946536,GaiLv2=9950054,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4303,GaiLv1=9950055,GaiLv2=9953573,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5303,GaiLv1=9953574,GaiLv2=9957092,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6303,GaiLv1=9957093,GaiLv2=9960611,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4403,GaiLv1=9960612,GaiLv2=9964130,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5403,GaiLv1=9964131,GaiLv2=9967649,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6403,GaiLv1=9967650,GaiLv2=9971168,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4003,GaiLv1=9971169,GaiLv2=9974687,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4503,GaiLv1=9974688,GaiLv2=9978206,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5003,GaiLv1=9978207,GaiLv2=9981725,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5503,GaiLv1=9981726,GaiLv2=9984540,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6003,GaiLv1=9984541,GaiLv2=9987355,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6503,GaiLv1=9987356,GaiLv2=9990170,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4203,GaiLv1=9990171,GaiLv2=9992985,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5203,GaiLv1=9992986,GaiLv2=9995800,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6203,GaiLv1=9995801,GaiLv2=9998615,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=80388,GaiLv1=9998616,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				},
			--伯中
			[88036] = {
				{GoodsID=80051,GaiLv1=1,GaiLv2=1063264,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80067,GaiLv1=1063265,GaiLv2=2126529,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80409,GaiLv1=2126530,GaiLv2=2158427,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80405,GaiLv1=2158428,GaiLv2=2178364,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40254,GaiLv1=2178365,GaiLv2=2210262,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40270,GaiLv1=2210263,GaiLv2=2242160,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40206,GaiLv1=2242161,GaiLv2=2268742,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40222,GaiLv1=2268743,GaiLv2=2295324,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40238,GaiLv1=2295325,GaiLv2=2321906,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40256,GaiLv1=2321907,GaiLv2=2353804,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40272,GaiLv1=2353805,GaiLv2=2385702,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40208,GaiLv1=2385703,GaiLv2=2412284,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40224,GaiLv1=2412285,GaiLv2=2438866,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40240,GaiLv1=2438867,GaiLv2=2465448,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80384,GaiLv1=2465449,GaiLv2=3262897,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80382,GaiLv1=3262898,GaiLv2=4060346,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80181,GaiLv1=4060347,GaiLv2=4857795,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80192,GaiLv1=4857796,GaiLv2=5655244,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80196,GaiLv1=5655245,GaiLv2=6452693,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80197,GaiLv1=6452694,GaiLv2=7250142,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=88171,GaiLv1=7250143,GaiLv2=8047591,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80274,GaiLv1=8047592,GaiLv2=8207081,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80952,GaiLv1=8207082,GaiLv2=8233663,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=82004,GaiLv1=8233664,GaiLv2=9828560,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=4103,GaiLv1=9828561,GaiLv2=9838529,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5103,GaiLv1=9838530,GaiLv2=9848498,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6103,GaiLv1=9848499,GaiLv2=9858467,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4303,GaiLv1=9858468,GaiLv2=9868436,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5303,GaiLv1=9868437,GaiLv2=9878405,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6303,GaiLv1=9878406,GaiLv2=9888374,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4403,GaiLv1=9888375,GaiLv2=9898343,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5403,GaiLv1=9898344,GaiLv2=9908312,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6403,GaiLv1=9908313,GaiLv2=9918281,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4003,GaiLv1=9918282,GaiLv2=9928250,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4503,GaiLv1=9928251,GaiLv2=9938219,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5003,GaiLv1=9938220,GaiLv2=9948188,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5503,GaiLv1=9948189,GaiLv2=9956163,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6003,GaiLv1=9956164,GaiLv2=9964138,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6503,GaiLv1=9964139,GaiLv2=9972113,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4203,GaiLv1=9972114,GaiLv2=9980088,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5203,GaiLv1=9980089,GaiLv2=9988063,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6203,GaiLv1=9988064,GaiLv2=9996038,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=80388,GaiLv1=9996039,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				},
			--伯高
			[88037] = {
				{GoodsID=80051,GaiLv1=1,GaiLv2=74074,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80067,GaiLv1=74075,GaiLv2=148149,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80409,GaiLv1=148150,GaiLv2=370372,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80405,GaiLv1=370373,GaiLv2=509261,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40254,GaiLv1=509262,GaiLv2=731484,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40270,GaiLv1=731485,GaiLv2=953707,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40206,GaiLv1=953708,GaiLv2=1138893,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40222,GaiLv1=1138894,GaiLv2=1324079,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40238,GaiLv1=1324080,GaiLv2=1509265,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40256,GaiLv1=1509266,GaiLv2=1731488,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40272,GaiLv1=1731489,GaiLv2=1953711,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40208,GaiLv1=1953712,GaiLv2=2138897,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40224,GaiLv1=2138898,GaiLv2=2324083,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=40240,GaiLv1=2324084,GaiLv2=2509269,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80384,GaiLv1=2509270,GaiLv2=3064825,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80382,GaiLv1=3064826,GaiLv2=3620381,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80181,GaiLv1=3620382,GaiLv2=4175937,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80192,GaiLv1=4175938,GaiLv2=4731493,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80196,GaiLv1=4731494,GaiLv2=5287049,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80197,GaiLv1=5287050,GaiLv2=5842605,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=88171,GaiLv1=5842606,GaiLv2=6398161,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80274,GaiLv1=6398162,GaiLv2=7509273,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=80952,GaiLv1=7509274,GaiLv2=7694459,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=82004,GaiLv1=7694460,GaiLv2=8805571,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				{GoodsID=4103,GaiLv1=8805572,GaiLv2=8875016,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5103,GaiLv1=8875017,GaiLv2=8944461,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6103,GaiLv1=8944462,GaiLv2=9013906,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4303,GaiLv1=9013907,GaiLv2=9083351,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5303,GaiLv1=9083352,GaiLv2=9152796,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6303,GaiLv1=9152797,GaiLv2=9222241,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4403,GaiLv1=9222242,GaiLv2=9291686,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5403,GaiLv1=9291687,GaiLv2=9361131,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6403,GaiLv1=9361132,GaiLv2=9430576,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4003,GaiLv1=9430577,GaiLv2=9500021,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4503,GaiLv1=9500022,GaiLv2=9569466,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5003,GaiLv1=9569467,GaiLv2=9638911,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5503,GaiLv1=9638912,GaiLv2=9694467,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6003,GaiLv1=9694468,GaiLv2=9750023,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6503,GaiLv1=9750024,GaiLv2=9805579,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=4203,GaiLv1=9805580,GaiLv2=9861135,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=5203,GaiLv1=9861136,GaiLv2=9916691,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=6203,GaiLv1=9916692,GaiLv2=9972247,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=7},
				{GoodsID=80388,GaiLv1=9972248,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0,PinZhi=0},
				},
}

--[[if not API_IsEctypeServer() or API_IsBranchServer() then
	if not API_IsEctypeServer() then
		DGCBFuZeRen = DGCBFuZeRen or API_CreateMonsterEx(21,11936,55,66,3,0,-1,1)
		LBCBFuZeRen = LBCBFuZeRen or API_CreateMonsterEx(41,11937,48,64,3,0,-1,1)
	end
	SearchTreasure_TimerTriggerID = SearchTreasure_TimerTriggerID or API_CreateTimerTriggerG(0,0,60,-1,'SearchTreasure_TimerTriggerGCallFunc')
end]]

if not API_IsEctypeServer() and API_GetServerID() == 1 then
	DGCBFuZeRen = DGCBFuZeRen or API_CreateMonsterEx(21,11936,55,66,3,0,-1,1)
	LBCBFuZeRen = LBCBFuZeRen or API_CreateMonsterEx(41,11937,48,64,3,0,-1,1)
end

function SearchTreasure_SuiPian_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if SearchTreasure_SuiPianTable[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return 0
	end
	local MS = SearchTreasure_SuiPianTable[GoodsID].MS
	API_ResponseWrite('<name>藏宝图碎片</name>')
	API_ResponseWrite('<br><text>'..MS..'</text><br>')
	API_ResponseWrite('<br><text>如果你集齐了A和B两种碎片后，即可合成一张完整的藏宝图。</text><br>')
	API_ResponseWrite('<br><br><br><a href="SearchTreasure_SuiPianHeCheng?1=1&2='..GoodsID..'">  合成藏宝图</a><text>      </text>')
	API_ResponseWrite('<a>关闭</a><br>')
	API_ResponseFlush(ActorID)
	return 1
end

function SearchTreasure_SuiPianHeCheng()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local GoodsID = API_RequestGetNumber(2)
	if XuanZe == 1 then
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			return
		end
		if API_ActorGetPackageSize(ActorID) >= 1 then
			local TreasureTable = {}
			local TreasureID = 0
			local SuiPian1,SuiPian2 = 0,0
			for i in SearchTreasure_TreasureTable do
				local SuiPianTable = SearchTreasure_TreasureTable[i].SuiPian
				for j,v in SuiPianTable do
					if GoodsID == v then
						TreasureTable = SearchTreasure_TreasureTable[i]
						TreasureID = SearchTreasure_TreasureTable[i].TreasureID
					end
				end
			end
			if TreasureTable.TreasureID == nil then
				API_ActorSendMsg(ActorID,3,'无效道具')
				return
			end
			SuiPian1,SuiPian2 = TreasureTable.SuiPian[1],TreasureTable.SuiPian[2]
			for j,v in TreasureTable.SuiPian do
				if API_ActorGetGoodsNum(ActorID,v) < 1 then
					API_ActorSendMsg(ActorID,3,'您的碎片不够，无法合成藏宝图')
					return	
				end
			end
			if API_ActorRemoveGoods(ActorID,SuiPian1,1,'删除1个'..API_GetGoodsName(SuiPian1)..'合成藏宝图') and API_ActorRemoveGoods(ActorID,SuiPian2,1,'删除1个'..API_GetGoodsName(SuiPian2)..'合成藏宝图') then
				if API_AddActorGoods(ActorID,TreasureID,1,'合成藏宝图') then
					API_ActorSendMsg(ActorID,10,'合成藏宝图成功，请使用藏宝图寻找宝藏地点')
					API_ResponseWrite('<br><text>合成藏宝图成功，请使用藏宝图寻找宝藏地点。</text><br>')
					API_ResponseWrite('<br><br><br><br><br><a href="SearchTreasure_SuiPianHeCheng?1=1&2='..GoodsID..'">  继续合成</a><text>      </text>')
					API_ResponseWrite('<a>关闭</a><br>')
					local HCNum = API_VarDataGetNumber(ActorID,1,19043)
					API_VarDataSetNumber(ActorID,1,19043,HCNum+1)
					--风向标
					if TreasureID == 88005 then
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						local Type = 1
						if GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] + 1
						end
					elseif TreasureID == 88006 then
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						local Type = 2
						if GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] + 1
						end
					--四档待添加
					end
				end
			end
		else
			API_ActorSendMsg(ActorID,3,'背包已满，无法合成藏宝图')
		end
	end
end

--NPC对话函数，鉴定宝藏 ★★★
function SearchTreasure_NPC_Quest_Title()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	if XuanZe == 1 then
		local UidHigh = API_RequestGetNumber(100)--高位UID
		local UidLow = API_RequestGetNumber(1100)--低位UID
		local Uid = API_GetUID(UidHigh,UidLow) --获取UID	
		local BoxID,LocID = API_GetUIDGoodsInActor(Uid,ActorID)--背包ID 和 位置
		local GoodsID = API_GetUIDGoodsPropNum(Uid,0)--提交的物品ID
		if GoodsID > 0 then
			local GoodsNum = API_ActorPackageGetLocGoodsNum(ActorID,BoxID,LocID)
			if SearchTreasure_TreasureIDTable[GoodsID] == nil then
				API_ResponseWrite('<br><text>你的藏宝箱呢？请将未鉴定过的藏宝箱放在之前对话框中的空格里再试试吧。</text><br>')
				API_ResponseWrite('<br><a>  确定</a><br>')
				return
			end
			for i = 1,GoodsNum do 
				local TreasureID = 0
				local EventGaiLv = math.random(100)
				for j in SearchTreasure_TreasureIDTable[GoodsID] do
					local Min = SearchTreasure_TreasureIDTable[GoodsID][j].Min
					local Max = SearchTreasure_TreasureIDTable[GoodsID][j].Max
					if EventGaiLv >= Min and EventGaiLv <= Max then
						TreasureID = j
						break
					end
				end
				if TreasureID ~= 0 then
					if API_ActorGetPackageSize(ActorID) >= 1 then
						if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,BoxID,LocID, '鉴定宝藏删除1个'..API_GetGoodsName(GoodsID)..'') then
						--if API_ActorRemoveGoods(ActorID,NoTestTreasure,1,'鉴定宝藏删除1个'..API_GetGoodsName(NoTestTreasure)..'') then
							--鉴定宝藏，根据未鉴定宝藏ID获得一个对应的宝藏ID
							API_AddActorGoods(ActorID,TreasureID,1,'鉴定宝藏获得一个'..API_GetGoodsName(TreasureID)..'')
							API_ActorSendMsg(ActorID,10,'鉴定成功，获得一个：'..API_GetGoodsName(TreasureID)..'')
							--API_ResponseWrite('<br><text>鉴定成功，您获得了一个：'..API_GetGoodsName(TreasureID)..'。</text><img srcgd="'..TreasureID..'" tipgd="'..TreasureID..'"><br>')
							--API_ResponseWrite('<goodsHolder name="100"><br>')
							--API_ResponseWrite('<br><a href="SearchTreasure_NPC_Quest_Title?1=1">继续鉴定</a><br>')
							--API_ResponseWrite('<br><a>关闭</a><br>')
							--风向标
							if GoodsID == 88020 then
								local LaiYuan = API_ActorGetPropNum(ActorID,201)
								local Type = 10
								if GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] + 1
								end
							elseif GoodsID == 88023 then
								local LaiYuan = API_ActorGetPropNum(ActorID,201)
								local Type = 11
								if GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] + 1
								end
							--四档待添加
							end
						end
					else
						API_ResponseWrite('<br><text>请保持背包中有一个空位再进行鉴定。</text><br>')
						API_ResponseWrite('<br><a>  确定</a><br>')
						break
					end
				else
					API_ResponseWrite('<br><text>你的藏宝箱呢？把藏宝箱放到背包中再试试吧。</text><br>')
					API_ResponseWrite('<br><a>  确定</a><br>')
					break
				end
			end
		else
			API_ResponseWrite('<br><text>你的藏宝箱呢？请将未鉴定过的藏宝箱放在之前对话框中的空格里再试试吧。</text><br>')
			API_ResponseWrite('<br><a>  确定</a><br>')
		end
	else
		API_ResponseWrite('<br><text>如果需要鉴定藏宝箱，请将未鉴定过的藏宝箱放在下面的空格中。</text><br>')
		API_ResponseWrite('<goodsHolder name="100"><br>')
		API_ResponseWrite('<br><a href="SearchTreasure_NPC_Quest_Title?1=1">鉴定宝藏</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	end
end

--藏宝图使用函数
--判断物品ID，判断地图，XY，文字描述读取
--一个物品地图XY表（文字描述编号），一个文字描述表（对应随机事件编号表），一个随机事件表，哦也
function SearchTreasure_Treasure_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local TreasureGoodsID = API_VarDataGetNumber(ActorID,1,19044)
	local TreasureMapNum = API_VarDataGetNumber(ActorID,1,19045)
	local TreasureTable = SearchTreasure_TreasureTable[GoodsID]
	if TreasureTable == nil then
		API_ActorSendMsg(ActorID,3,'无效道具')
		return 0
	end
	local Camp = API_GetActorCamp(ActorID)
	local CampTable = {}
	if Camp == 0 then
		CampTable = SearchTreasure_TreasureDGMapTable
	elseif Camp == 1 then
		CampTable = SearchTreasure_TreasureLBMapTable
	end
	if CampTable[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效道具')
		return 0
	end
	local TreasureMapID,TreasureX,TreasureY,TreasureNum = 0,0,0,0
	local TreasureSM = ''
	if TreasureMapNum == 0 then
		--这里可以设置宝藏地图ID，不同爵位需要不同的地图
		TreasureMapID = CampTable[GoodsID][math.random(table.getn(CampTable[GoodsID]))]
		TreasureX,TreasureY,TreasureNum = SearchTreasure_TreasureXYNum(TreasureMapID)
		if TreasureX ~= 0 and TreasureY ~= 0 and  TreasureNum ~= 0 then
			TreasureMapNum = TreasureMapID * 1000 + TreasureNum
			local TreasureXY = TreasureX * 1000 + TreasureY
			API_VarDataSetNumber(ActorID,1,19044,GoodsID)
			API_VarDataSetNumber(ActorID,1,19045,TreasureMapNum)
			API_VarDataSetNumber(ActorID,1,19046,TreasureXY)
			TreasureSM = SearchTreasure_EventTable[TreasureNum].SM
			--风向标
			if GoodsID == 88005 then
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 4
				if GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] + 1
				end
			elseif GoodsID == 88006 then
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 5
				if GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] + 1
				end
			--四档待添加
			end
		else
			API_ActorSendMsg(ActorID,3,'无效道具')
			return 0
		end
	else
		if TreasureGoodsID ~= GoodsID then
			API_ActorSendMsg(ActorID,3,'如果想寻找新的宝藏，请先使用'..API_GetGoodsName(TreasureGoodsID)..'放弃之前的宝藏')
			return 0
		end
		TreasureMapID = math.floor(TreasureMapNum/1000)
		TreasureNum = math.mod(TreasureMapNum,1000)
		TreasureSM = SearchTreasure_EventTable[TreasureNum].SM
	end
	--API_VarDataSetNumber(ActorID,1,19042,YMD)
	API_ResponseWrite('<name>神秘藏宝图</name>')
	API_ResponseWrite('<br><text>'..TreasureSM..'</text><br>')
	--API_ResponseWrite('<br><text color="255,0,255">每天最多探宝'..SearchNum..'次，您今天已探宝'..PlaySearchNum..'次</text><br>')
	API_ResponseWrite('<br><br><br><a href="SearchTreasure_OpenTreasure?1=1">  挖掘宝藏</a><text>      </text>')
	API_ResponseWrite('<a href="SearchTreasure_OpenTreasure?1=2">  放弃宝藏（扣除藏宝图）</a><text>      </text>')
	API_ResponseWrite('<a>关闭</a><br>')
	API_ResponseFlush(ActorID)
	return 1
end

function SearchTreasure_TreasureXYNum(MapID)
	local X,Y,Num = 0,0,0
	if SearchTreasure_TreasureTileTable[MapID] == nil then
		return X,Y,Num
	end
	local a = math.random(1,table.getn(SearchTreasure_TreasureTileTable[MapID]))
	local XYNum = SearchTreasure_TreasureTileTable[MapID][a]
	X = XYNum[1]
	Y = XYNum[2]
	Num = XYNum[3]
	return X,Y,Num
end

--使用藏宝图回调
function SearchTreasure_OpenTreasure()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local TreasureGoodsID = API_VarDataGetNumber(ActorID,1,19044)
	if XuanZe == 1 then
		if TreasureGoodsID > 0 then
			local TreasureMapNum = API_VarDataGetNumber(ActorID,1,19045)
			local TreasureMapID = math.floor(TreasureMapNum/1000)
			local TreasureNum = math.mod(TreasureMapNum,1000)
			local TreasureXY = API_VarDataGetNumber(ActorID,1,19046)
			local TreasureX = math.floor(TreasureXY/1000)
			local TreasureY = math.mod(TreasureXY,1000)
			if TreasureNum == 56 then
				TreasureX = 528
				TreasureY = 258
			end
			local PlayMapID = API_GetActorMapID(ActorID)
			local MapConfigID = API_GetMapConfigID(PlayMapID)
			local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
			local JuLi = PublicFun_AccountDistance(PlayX,PlayY,TreasureX,TreasureY)
			if MapConfigID == TreasureMapID and JuLi <= SearchTreasure_FanWei then
				if API_ActorGetGoodsNum(ActorID,TreasureGoodsID) >= 1 then
				--到地方了，开始读秒
					local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
					if ConvectionInfo ~= 0 then
						API_ActorSendMsg(ActorID,3,'正在挖掘中，请稍后')
					else
						local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
						local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
						API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
						local TimerTriggerID = API_CreateTimerTriggerG(ActorID,TreasureGoodsID,1,5,'SearchTreasure_RandomEvent_TimerTriggerCallFunc')
						API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
						local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(GLOBAL_ConvectionTimer)
						API_ActorSendMsg(ActorID,3,'宝藏挖掘中……，需时'..GLOBAL_ConvectionTimerCN..'秒，挖掘时请不要移动，否则将挖掘失败')
						StatusTimer = (GLOBAL_ConvectionTimer + 1) * 1000
						API_ActorAddStatus(ActorID,36003,StatusTimer)
						API_ActorShowProcess(ActorID,StatusTimer,410,360,'挖掘宝藏')
					end
				else
					API_ActorSendMsg(ActorID,3,'挖掘失败，您身上没有'..API_GetGoodsName(TreasureGoodsID)..'')
				end
			elseif MapConfigID == TreasureMapID and JuLi <= 10 then
				API_ActorSendMsg(ActorID,3,'好像就在这附近了，努力找找吧')
			else
				API_ActorSendMsg(ActorID,3,'宝藏不在这里，请根据藏宝图提示努力寻找吧')
			end
		else
			API_ActorSendMsg(ActorID,3,'挖掘失败，请重新使用藏宝图')
		end
	elseif XuanZe == 2 then
		API_ResponseWrite('<name>神秘藏宝图</name>')
		API_ResponseWrite('<br><text>您真的想要放弃这张藏宝图的宝藏吗？</text><br>')
		API_ResponseWrite('<br><text>如果放弃宝藏那么这张藏宝图也会随之消失。</text><br>')
		API_ResponseWrite('<br><br><br><a href="SearchTreasure_OpenTreasure?1=3">我要放弃</a><text>      </text>')
		API_ResponseWrite('<a>取消</a><br>')
	elseif XuanZe == 3 then
		if TreasureGoodsID > 0 then
			if API_ActorGetGoodsNum(ActorID,TreasureGoodsID) >= 1 then
				if API_ActorRemoveGoods(ActorID,TreasureGoodsID,1,'放弃宝藏扣除1个'.. API_GetGoodsName(TreasureGoodsID)..'') then
					API_VarDataSetNumber(ActorID,1,19044,0)
					API_VarDataSetNumber(ActorID,1,19045,0)
					API_VarDataSetNumber(ActorID,1,19046,0)
					API_ActorSendMsg(ActorID,3,'放弃成功，'..API_GetGoodsName(TreasureGoodsID)..'消失了……')
				end
			else
				API_ActorSendMsg(ActorID,3,'您身上没有'..API_GetGoodsName(TreasureGoodsID)..'，放弃失败！')
			end
		else
			API_ActorSendMsg(ActorID,3,'放弃失败，请重新使用藏宝图')
		end
	end
end

function SearchTreasure_RandomEvent_TimerTriggerCallFunc(ActorID,TreasureGoodsID)
	if API_ActorIsOnline(ActorID) then
		if API_ActorGetGoodsNum(ActorID,TreasureGoodsID) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'挖掘宝藏')
			return
		end
		if API_ActorIsDying(ActorID) then
			API_ActorSendMsg(ActorID,3,'人物死亡，挖掘失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'挖掘宝藏')
			return
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
			API_ActorSendMsg(ActorID,3,'人物移动，挖掘失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'挖掘宝藏')
		elseif Time >= GLOBAL_ConvectionTimer then
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'挖掘宝藏')
			--出现随机事件
			local TreasureMapNum = API_VarDataGetNumber(ActorID,1,19045)
			local TreasureMapID = math.floor(TreasureMapNum/1000)
			local TreasureNum = math.mod(TreasureMapNum,1000)
			local TreasureXY = API_VarDataGetNumber(ActorID,1,19046)
			local TreasureX = math.floor(TreasureXY/1000)
			local TreasureY = math.mod(TreasureXY,1000)
			if SearchTreasure_EventTable[TreasureNum] == nil then
				API_ActorSendMsg(ActorID,3,'宝藏挖掘出现错误，挖掘失败，请放弃宝藏后再重新尝试')
				return
			end
			--local RD = SearchTreasure_EventTable[TreasureNum].RD[math.random(table.getn(SearchTreasure_EventTable[TreasureNum].RD))]
			--随机事件编号
			local RD = 1
			local RandomNum = math.random(100)
			for i = 1,table.getn(SearchTreasure_RandomEventNumTable) do
				local Min = SearchTreasure_RandomEventNumTable[i].Min
				local Max = SearchTreasure_RandomEventNumTable[i].Max
				if RandomNum >= Min and RandomNum <= Max then
					RD = i
				end
			end
			local RDfunc = SearchTreasure_RandomEventTable[RD].HSM
			local TreasureGoodsID2 = API_VarDataGetNumber(ActorID,1,19044)
			if TreasureGoodsID2 == 0 then
				API_ActorSendMsg(ActorID,3,'宝藏挖掘出现错误，挖掘失败，请放弃宝藏后再重新尝试')
				return
			end
			if type(RDfunc) == 'string' then	
				local Function = _G[RDfunc]
				if type(Function) == 'function' then
					if API_ActorRemoveGoods(ActorID,TreasureGoodsID,1,'删除1个'..API_GetGoodsName(TreasureGoodsID)..'挖掘宝藏') then
						Function(ActorID,TreasureGoodsID,TreasureMapID,TreasureX,TreasureY)
						API_VarDataSetNumber(ActorID,1,19044,0)
						API_VarDataSetNumber(ActorID,1,19045,0)
						API_VarDataSetNumber(ActorID,1,19046,0)
						API_ActorAddHunger(ActorID,SearchTreasure_AddHuoLi)
						API_ActorSendMsg(ActorID,7,'成功找到宝藏地点，增加'..SearchTreasure_AddHuoLi..'点活力值')
						API_ResponseEnd()
						API_ResponseClear()
						--风向标
						if TreasureGoodsID == 88005 then
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							local Type = 7
							if GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] + 1
							end
						elseif TreasureGoodsID == 88006 then
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							local Type = 8
							if GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] + 1
							end
						--四档待添加
						end
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

--已鉴定的宝藏使用函数，读取奖励 ★★★
function SearchTreasure_OpenTreasure_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if SearchTreasure_TreasureJiangLiTable[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效道具')
		return 0
	end
	if SearchTreasure_GXJiangLiTable[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效道具')
		return 0
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	local PlaySearchYMD = API_VarDataGetNumber(ActorID,1,19042)
	local PlayYear = math.floor(PlaySearchYMD/10000)
	local PlayMonthDay = math.mod(PlaySearchYMD,10000)
	local PlayMonth = math.floor(PlayMonthDay/100)
	local PlayDay = math.mod(PlayMonthDay,100)
	if Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
		API_VarDataSetNumber(ActorID,1,19041,0)
	end
	local PlaySearchNum = API_VarDataGetNumber(ActorID,1,19041)
	if PlaySearchNum >= SearchNum then
		API_ActorSendMsg(ActorID,3,'您今天打开宝箱的次数已达到上限，请明天再继续尝试吧，祝您好运！')
		return 0
	end
	--判断身上格子是否有5个空格，如果获得的数量是0，那么就告诉玩家什么都没有获得
	if API_ActorGetPackageSize(ActorID) >= 1 then
		local JiangLiTable = SearchTreasure_TreasureJiangLiTable[GoodsID]
		local GaiLv = math.random(10000000)
		for j in JiangLiTable do
			local GaiLv1 = JiangLiTable[j].GaiLv1
			local GaiLv2 = JiangLiTable[j].GaiLv2
			if GaiLv >= GaiLv1 and GaiLv <= GaiLv2 then
				local TreasureID = JiangLiTable[j].GoodsID
				local TreasureNum = 0
				local NumGaiLv = JiangLiTable[j].NumGaiLv
				local NumMax = JiangLiTable[j].NumMax
				local NumMin = JiangLiTable[j].NumMin
				local NumRandom = math.random(10000)
				if NumRandom <= NumGaiLv then
					TreasureNum = NumMax
				else
					TreasureNum = NumMin
				end
				local PinZhi = JiangLiTable[j].PinZhi
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'打开'..API_GetGoodsName(GoodsID)..'拿奖励') then
					API_VarDataSetNumber(ActorID,1,19041,PlaySearchNum+1)
					local PlaySearchNum2 = API_VarDataGetNumber(ActorID,1,19041)
					if PlaySearchNum2 == PlaySearchNum + 1 then
						API_VarDataSetNumber(ActorID,1,19042,YMD)
						if TreasureNum > 0 then
							if PinZhi == 0  then
								API_AddActorGoods(ActorID,TreasureID,TreasureNum,'打开'..API_GetGoodsName(GoodsID)..'获得'..TreasureNum..'个 '.. API_GetGoodsName(TreasureID)..'')
							else
								API_AddActorGoodsFlagEx(ActorID, TreasureID, 1, PinZhi, 0, '打开'..API_GetGoodsName(GoodsID)..'获得1个 '.. API_GetGoodsName(TreasureID)..'', 0)
							end
							API_ActorSendMsg(ActorID,3,'打开'..API_GetGoodsName(GoodsID)..'获得'..TreasureNum..'个 '.. API_GetGoodsName(TreasureID)..'')
							API_ActorSendMsg(ActorID,7,'打开'..API_GetGoodsName(GoodsID)..'获得'..TreasureNum..'个 '.. API_GetGoodsName(TreasureID)..'，今天还可以打开'..SearchNum-PlaySearchNum2..'次宝箱')
						else
							local AddGX = SearchTreasure_GXJiangLiTable[GoodsID]
							local ExploitL = API_GetActorExpLevel(ActorID)
							local expMax = API_GetExploitInfo(ExploitL,3)
							local expNow = API_GetActorCurExp(ActorID)
							local expAddMax = expMax - expNow
							local PetExp = 0
							if expAddMax >= AddGX then
								PetExp = AddGX
								API_ActorAddExp(ActorID,AddGX,0,'打开'..API_GetGoodsName(GoodsID)..'获得'..AddGX..'经验')
								API_ActorSendMsg(ActorID,3,'打开'..API_GetGoodsName(GoodsID)..'获得'..AddGX..'经验')
								API_ActorSendMsg(ActorID,7,'打开'..API_GetGoodsName(GoodsID)..'获得'..AddGX..'经验，今天还可以打开'..SearchNum-PlaySearchNum2..'次宝箱')
							elseif expAddMax == 0 then
								API_ActorSendMsg(ActorID,3,'您的经验达到上限，已无法再获得经验，请尽快升级')
								API_ActorSendMsg(ActorID,7,'您的经验达到上限，已无法再获得经验，请尽快升级，今天还可以打开'..SearchNum-PlaySearchNum2..'次宝箱')
							else
								PetExp = expAddMax
								API_ActorAddExp(ActorID,expAddMax,0,'打开'..API_GetGoodsName(GoodsID)..'获得'..expAddMax..'经验')
								API_ActorSendMsg(ActorID,3,'打开'..API_GetGoodsName(GoodsID)..'获得'..expAddMax..'经验')
								API_ActorSendMsg(ActorID,7,'打开'..API_GetGoodsName(GoodsID)..'获得'..expAddMax..'经验，今天还可以打开'..SearchNum-PlaySearchNum2..'次宝箱')
							end
							local PetLV = API_GetActorConjedPetPropNum(ActorID,2)
							if PetLV ~= -1 then
								local BiLv = 0
								for j in SearchTreasure_PetExpTable[GoodsID] do
									local PetMin = SearchTreasure_PetExpTable[GoodsID][j].Min
									local PetMax = SearchTreasure_PetExpTable[GoodsID][j].Max
									if PetLV >= PetMin and PetLV <= PetMax then
										BiLv = SearchTreasure_PetExpTable[GoodsID][j].BiLv
										PetExp = (PetExp * WYL_PetExpBiLv) * BiLv
										break
									end
								end
								if PetExp <= 0 then
									PetExp = 1
								end
								API_ActorAddPetExp(ActorID,PetExp,0,'打开藏宝箱给宠物加经验')
							end
						end
						--风向标
						if GoodsID == 88029 or GoodsID == 88030 or GoodsID == 88031 then
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							local Type = 13
							if GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] + 1
							end
						elseif GoodsID == 88032 or GoodsID == 88033 or GoodsID == 88034 then
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							local Type = 14
							if GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[16][Type][LaiYuan] + 1
							end
						--四档待添加
						end
					end
				end
				return 1
			end
		end
	else
		API_ActorSendMsg(ActorID,3,'打开'..API_GetGoodsName(GoodsID)..'前，背包中需留一个空位')
		return 0
	end
	return 0
end

--决定掉落哪个未鉴定宝藏
function SearchTreasure_DropTreasure(TreasureGoodsID)
	local NoTestTreasure = 0
	--if SearchTreasure_TreasureTable[TreasureGoodsID] == nil then
	--	return 0
	--end
	if SearchTreasure_NewTreasureIDTable[TreasureGoodsID] == nil then
		return 0
	end
	local EventGaiLv = math.random(100)
	for j in SearchTreasure_NewTreasureIDTable[TreasureGoodsID] do
		local Min = SearchTreasure_NewTreasureIDTable[TreasureGoodsID][j].Min
		local Max = SearchTreasure_NewTreasureIDTable[TreasureGoodsID][j].Max
		if EventGaiLv >= Min and EventGaiLv <= Max then
			NoTestTreasure = j
			break
		end
	end
	--NoTestTreasure = SearchTreasure_TreasureTable[TreasureGoodsID].NoTestTreasure
	--[[local NoTestTreasureTable = SearchTreasure_TreasureTable[TreasureGoodsID].NoTestTreasure
	local EventGaiLv = math.random(100)
	for j in NoTestTreasureTable do
		local Min = NoTestTreasureTable[j].Min
		local Max = NoTestTreasureTable[j].Max
		if EventGaiLv >= Min and EventGaiLv <= Max then
			NoTestTreasure = j
			break
		end
	end]]
	return NoTestTreasure
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件一★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--直接得藏宝箱
function SearchTreasure_RandomEvent1(ActorID,TreasureGoodsID,TreasureMapID,TreasureX,TreasureY)
	local NoTestTreasure = SearchTreasure_DropTreasure(TreasureGoodsID)
	local MapID = API_GetActorMapID(ActorID) 
	if NoTestTreasure ~= 0 then
		--掉落宝藏
		API_CreateDropGoods(MapID,TreasureX,TreasureY,NoTestTreasure,1,0,'藏宝系统事件一掉落',0,ActorID,600,60)
		API_ActorSendMsg(ActorID,10,'恭喜您挖出了一个'..API_GetGoodsName(NoTestTreasure)..'')
	else
		API_ActorSendMsg(ActorID,10,'什么都没有发生……')
	end
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件二★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--中陷阱得藏宝箱
function SearchTreasure_RandomEvent2(ActorID,TreasureGoodsID,TreasureMapID,TreasureX,TreasureY)
	local NoTestTreasure = SearchTreasure_DropTreasure(TreasureGoodsID)
	local MapID = API_GetActorMapID(ActorID) 
	if NoTestTreasure ~= 0 then
		local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
		for i = 133,134 do
			API_AddMagicToMap(MapID,PlayX,PlayY, i)
		end
		API_ActorSendMsg(ActorID,10,'陷阱发动：你觉得你变虚弱了……')
		API_ActorAddStatus(ActorID,671001,180000) --减攻90%
		API_CreateDropGoods(MapID,TreasureX,TreasureY,NoTestTreasure,1,0,'藏宝系统事件二掉落',0,ActorID,600,60)
		API_ActorSendMsg(ActorID,10,'陷阱消失：'..API_GetGoodsName(NoTestTreasure)..'出现了')
	else
		API_ActorSendMsg(ActorID,10,'什么都没有发生……')
	end
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件三★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--出现一群小怪，杀死得藏宝箱
function SearchTreasure_RandomEvent3(ActorID,TreasureGoodsID,TreasureMapID,TreasureX,TreasureY)
	local NoTestTreasure = SearchTreasure_DropTreasure(TreasureGoodsID)
	local MapID = API_GetActorMapID(ActorID)
	if NoTestTreasure ~= 0 then
		local PTMonsterID = SearchTreasure_TreasureTable[TreasureGoodsID].PTMonsterID
		local FastID = API_CreateMonster(MapID,PTMonsterID,TreasureX,TreasureY,4,0,-1)
		API_SendMonsterMsg(FastID,0,'宝藏是我的，谢谢你帮我找到这里，哈哈！去死吧！')
		API_CreateDieTriggerG(ActorID,NoTestTreasure,0,FastID,'SearchTreasure_EventMonster_DieTriggerGCallFunc')
		for i = 1,3 do
			API_CreateMonster(MapID,PTMonsterID,TreasureX,TreasureY,4,0,-1)
		end
		API_ActorSendMsg(ActorID,10,'一群'..API_GetMonsterNameByID(PTMonsterID)..'出现了，他们抢走了你的'..API_GetGoodsName(NoTestTreasure)..'……')
	else
		API_ActorSendMsg(ActorID,10,'什么都没有发生……')
	end
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件四★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--遇到小BOSS。出现一名小BOSS攻击玩家。
function SearchTreasure_RandomEvent4(ActorID,TreasureGoodsID,TreasureMapID,TreasureX,TreasureY)
	local NoTestTreasure = SearchTreasure_DropTreasure(TreasureGoodsID)
	local MapID = API_GetActorMapID(ActorID) 
	if NoTestTreasure ~= 0 then
		local JYMonsterID = SearchTreasure_TreasureTable[TreasureGoodsID].JYMonsterID
		local FastID = API_CreateMonster(MapID,JYMonsterID,TreasureX,TreasureY,4,0,-1)
		API_SendMonsterMsg(FastID,0,'宝藏是我的，谢谢你帮我找到这里，哈哈！去死吧！')
		API_CreateDieTriggerG(ActorID,NoTestTreasure,0,FastID,'SearchTreasure_EventMonster_DieTriggerGCallFunc')
		API_ActorSendMsg(ActorID,10,''..API_GetMonsterNameByID(JYMonsterID)..'出现了，他抢走了你的'..API_GetGoodsName(NoTestTreasure)..'……')
	else
		API_ActorSendMsg(ActorID,10,'什么都没有发生……')
	end
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件五★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--出现一群小怪和BOSS，杀死得藏宝箱
function SearchTreasure_RandomEvent5(ActorID,TreasureGoodsID,TreasureMapID,TreasureX,TreasureY)
	local NoTestTreasure = SearchTreasure_DropTreasure(TreasureGoodsID)
	local MapID = API_GetActorMapID(ActorID) 
	if NoTestTreasure ~= 0 then
		local PTMonsterID = SearchTreasure_TreasureTable[TreasureGoodsID].PTMonsterID
		local JYMonsterID = SearchTreasure_TreasureTable[TreasureGoodsID].JYMonsterID
		local FastID = API_CreateMonster(MapID,JYMonsterID,TreasureX,TreasureY,4,0,-1)
		API_SendMonsterMsg(FastID,0,'宝藏是我的，谢谢你帮我找到这里，哈哈！去死吧！')
		API_CreateDieTriggerG(ActorID,NoTestTreasure,0,FastID,'SearchTreasure_EventMonster_DieTriggerGCallFunc')
		for i = 1,3 do
			API_CreateMonster(MapID,PTMonsterID,TreasureX,TreasureY,4,0,-1)
		end
		API_ActorSendMsg(ActorID,10,''..API_GetMonsterNameByID(JYMonsterID)..'和他的喽罗出现了，他们抢走了你的'..API_GetGoodsName(NoTestTreasure)..'……')
	else
		API_ActorSendMsg(ActorID,10,'什么都没有发生……')
	end
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★随机事件六★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--什么都没有
function SearchTreasure_RandomEvent6(ActorID,TreasureGoodsID,TreasureMapID,TreasureX,TreasureY)
	local NoTestTreasure = SearchTreasure_DropTreasure(TreasureGoodsID)
	local MapID = API_GetActorMapID(ActorID) 
	if NoTestTreasure ~= 0 then
		--会出现地震，一个事件触发器
		API_ResponseWrite('<br><text>由于你用力过猛，藏宝洞被你挖塌了，藏宝箱被压碎了，什么都没有得到……</text><br>') 
		API_ResponseWrite('<br><br><a>我知道了……</a>')
		API_ResponseFlush(ActorID)
		--API_ActorSendMsg(ActorID,2,'由于你用力过猛，藏宝洞被你挖塌了，藏宝箱被压碎了，什么都没有得到……')
	else
		API_ActorSendMsg(ActorID,10,'什么都没有发生……')
	end
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--事件中根据玩家的藏宝图ID，判断出什么藏宝箱，判断出什么样的怪物，同时建立死亡触发器，传入藏宝箱ID
function SearchTreasure_EventMonster_DieTriggerGCallFunc(ActorID,NoTestTreasure,Type,FastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY)
	if API_ActorIsOnline(ActorID) then
		API_CreateDropGoods(MapID,PosX,PosY,NoTestTreasure,1,0,'藏宝系统事件掉落',0,ActorID,600,60)
		API_ResponseWrite('<name>'..API_GetMonsterNameByID(MonsterID)..'</name>')
		API_ResponseWrite('<br><text>'..API_GetMonsterNameByID(MonsterID)..'临死前不甘心的吼道：呃~啊！可恶啊，我的宝藏……我的兄弟们会为我报仇的！</text><br>') 
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
	else
		API_CreateDropGoods(MapID,PosX,PosY,NoTestTreasure,1,0,'藏宝系统事件掉落',4,0,600,0)
	end
end
--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★

--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--地图中随机宝箱点击对话
function SearchTreasure_MapBoxClick(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local PlayNum = API_RequestGetNumber(2)
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if API_GetMonsterID(NPCFastID) <= 0 then
		return
	end
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	local NPCX,NPCY = PublicFun_GetMonsterPosXY(NPCFastID)
	local JuLi = PublicFun_AccountDistance(PlayX,PlayY,NPCX,NPCY)
	local ShiTou = 82028
	local JianDao = 82026
	local Bu = 82027
	if JuLi > 3 then
		API_ActorSendMsg(ActorID,3,'距离宝箱太远，靠近点再试试')
		API_ResponseEnd()
		API_ResponseClear()
		return
	end
	if XuanZe == 1 then
		local RD = math.random(100)
		local NPCNum = PlayNum
		local PlayXS = ShiTou
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="340,230,325,250" alpha="240" balpha="230"></win>') 
		if RD <= 33 then
			API_ResponseWrite('<text color="255,0,255">               YOU WIN！</text><br>')
			if PlayNum == 1 then
				PlayXS = ShiTou
				NPCNum = JianDao
			elseif PlayNum == 2 then
				PlayXS = JianDao
				NPCNum = Bu
			else
				PlayXS = Bu
				NPCNum = ShiTou
			end
			API_ResponseWrite('<br><text>            宝箱：</text><img srcgd="'..NPCNum..'" tipgd="0"><br>') 
			API_ResponseWrite('<br><text>                   VS</text><br>') 
			API_ResponseWrite('<br><text>              你：</text><img srcgd="'..PlayXS..'" tipgd="0"><br>') 
			API_ResponseWrite('<br><br><a>确定</a><br>')
			--给奖励
			--转移目标
--~ 			API_DestroyMonster(NPCFastID)
--~ 			local RandomTime = math.random(1800,3600)
--~ 			API_CreateTimerTriggerG(MapConfigID,0, RandomTime,1, 'SearchTreasure_MapBox_CreatFunc')
		elseif RD >= 80 then
			API_ResponseWrite('<text color="255,0,255">                 ==平局==</text><br>')
			API_ResponseWrite('<br><text>                  </text><img srcgd="100000" tipgd="0"><br>') 
			API_ResponseWrite('<br><text>                   VS</text><br>') 
			API_ResponseWrite('<br><text>      </text><img srcgd="'..ShiTou..'" tipgd="0" href="SearchTreasure_MapBoxClick?1=1&2=1"><text>        </text>') --石头
			API_ResponseWrite('<img srcgd="'..JianDao..'" tipgd="0" href="SearchTreasure_MapBoxClick?1=1&2=2"><text>        </text>') --剪刀
			API_ResponseWrite('<img srcgd="'..Bu..'" tipgd="0" href="SearchTreasure_MapBoxClick?1=1&2=3"><br>') --布
			API_ResponseWrite('<br><br><a>关闭</a><br>')
		else
			API_ResponseWrite('<text color="255,0,255">               YOU LOST！</text><br>')
			if PlayNum == 1 then
				PlayXS = ShiTou
				NPCNum = Bu
			elseif PlayNum == 2 then
				PlayXS = JianDao
				NPCNum = ShiTou
			else
				PlayXS = Bu
				NPCNum = JianDao
			end
			API_ResponseWrite('<br><text>            宝箱：</text><img srcgd="'..NPCNum..'" tipgd="0"><br>') 
			API_ResponseWrite('<br><text>                   VS</text><br>') 
			API_ResponseWrite('<br><text>              你：</text><img srcgd="'..PlayXS..'" tipgd="0"><br>') 
			API_ResponseWrite('<br><br><a>确定</a><br>')
			--转移目标
--~ 			API_DestroyMonster(NPCFastID)
--~ 			local RandomTime = math.random(1800,3600)
--~ 			API_CreateTimerTriggerG(MapConfigID,0, RandomTime,1, 'SearchTreasure_MapBox_CreatFunc')
		end
	else
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="340,230,325,250" alpha="240" balpha="230"></win>') 
		API_ResponseWrite('<text color="255,0,255">               一决胜负吧！</text><br>')
		API_ResponseWrite('<br><text>                  </text><img srcgd="100000" tipgd="0"><br>') 
		API_ResponseWrite('<br><text>                   VS</text><br>') 
		API_ResponseWrite('<br><text>      </text><img srcgd="'..ShiTou..'" tipgd="0" href="SearchTreasure_MapBoxClick?1=1&2=1"><text>        </text>') --石头
		API_ResponseWrite('<img srcgd="'..JianDao..'" tipgd="0" href="SearchTreasure_MapBoxClick?1=1&2=2"><text>        </text>') --剪刀
		API_ResponseWrite('<img srcgd="'..Bu..'" tipgd="0" href="SearchTreasure_MapBoxClick?1=1&2=3"><br>') --布
		--<img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="SearchTreasure_MapBoxClick?1=1">
		API_ResponseWrite('<br><br><a>关闭</a><br>')
	end
	API_ResponseFlush(ActorID)
end
