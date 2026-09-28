----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\MerryChristmas.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2008-12-8
--版  本:	1.0
--描  述:	圣诞节活动
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：万钰林
--日期：2008-12-8
--功能：创建
---------------------------------------------------------------------
--作者：万钰林
--日期：2009-4-2
--功能：修改为QQ英雄岛日常活动
---------------------------------------------------------------------
-- 19015 存储雪人积分
-- 19016 存储雪人所在岛屿，判断玩家是否在堆雪人的凭据，0则没有雪人
-- 19017 存储堆雪人的时间间隔，临时的
-- 19018 存储移动雪人的时间间隔，临时

API_VarDataLoad_Ex(1,0, -1999)
API_VarDataLoad_Ex(1,0, -2000)

MerryChristmas_XueZhiLingGoodsID = 80591 --雪之灵物品ID
MerryChristmas_BigSnowXZLNum = 4 --堆大雪人需要几个雪之灵
MerryChristmas_JiHuoBigSnow = 200 --激动大雪人获得积分
MerryChristmas_DuiHuanJiangLi = 20 --抽奖积分
MerryChristmas_LiuYanKouJiFen = 3 --留言时扣除积分

--如果需要测试就改下面的活动时间，还有361行掉卷轴的时间
MerryChristmas_ActWeek1 = 6
MerryChristmas_ActWeek2 = 7
MerryChristmas_ActWeek3 = 4
MerryChristmas_ActWeek4 = 5
MerryChristmas_ActTime = {RedayTime=14,StartTime=15,EndTime=16}
--活动地图
MerryChristmas_ACTMapTable = {
		--[1] = {MapID=9,MonsterID=726263,MonsterNum=800,XueDuiID=275,XueDuiNum=400,x1=23,y1=49,x2=403,y2=431,x3=133,y3=351,x4=188,y4=396},
		[1] = {ServerID={2,3,4,5,10},MapID=10,MonsterID=726264,MonsterNum=600,XueDuiID=275,XueDuiNum=300,x1=80,y1=140,x2=410,y2=430,x3=111,y3=291,x4=154,y4=344},
		[2] = {ServerID={2,3,4,5,10},MapID=23,MonsterID=726264,MonsterNum=600,XueDuiID=275,XueDuiNum=300,x1=80,y1=100,x2=410,y2=410,x3=107,y3=307,x4=160,y4=349},
		--[4] = {MapID=25,MonsterID=726263,MonsterNum=600,XueDuiID=275,XueDuiNum=300,x1=46,y1=60,x2=400,y2=430,x3=115,y3=291,x4=165,y4=335},
		[3] = {ServerID={6},MapID=98,MonsterID=726265,MonsterNum=600,XueDuiID=275,XueDuiNum=300,x1=177,y1=181,x2=578,y2=559,x3=326,y3=319,x4=442,y4=441},
		[4] = {ServerID={7},MapID=99,MonsterID=726265,MonsterNum=600,XueDuiID=275,XueDuiNum=300,x1=180,y1=110,x2=570,y2=612,x3=348,y3=343,x4=399,y4=397},
		[5] = {ServerID={8},MapID=101,MonsterID=726265,MonsterNum=600,XueDuiID=275,XueDuiNum=300,x1=282,y1=211,x2=620,y2=590,x3=423,y3=437,x4=443,y4=457},
}
--每个地图堆雪人的级别和小雪怪ID
MerryChristmas_CreateXueRenMap = {
		--[9] = {MinLV=1,MaxLV=10,XiaoXueGuaiID=271249},
		[10] = {MinLV=11,MaxLV=25,XiaoXueGuaiID=271249},
		[23] = {MinLV=11,MaxLV=25,XiaoXueGuaiID=271249},
		--[25] = {MinLV=1,MaxLV=10,XiaoXueGuaiID=271249},
		[98] = {MinLV=26,MaxLV=55,XiaoXueGuaiID=271249},
		[99] = {MinLV=26,MaxLV=55,XiaoXueGuaiID=271249},
		[101] = {MinLV=26,MaxLV=65,XiaoXueGuaiID=271249},
}

if MerryChristmas_MapMonsterTable == nil then --存每个地图的雪怪
	MerryChristmas_MapMonsterTable = {}
end

if MerryChristmas_MapXueDuiTable == nil then --存每个地图的雪堆
	MerryChristmas_MapXueDuiTable = {}
end

if MerryChristmas_XueRenTable == nil then
	MerryChristmas_XueRenTable = {} --存玩家堆的雪人
end

--物品奖励表
MerryChristmas_GooDsTable = {
				[1] = {MinLV=1,MaxLV=25,
					Goodslist = {
							[1] = {Min=1,Max=70,
								Goodslist = {
									{GoodsID=80049,GaiLv1=1,GaiLv2=625000,NumGaiLv=3333,NumMax=2,NumMin=1},
									{GoodsID=80049,GaiLv1=625001,GaiLv2=1250001,NumGaiLv=3333,NumMax=2,NumMin=1},
									{GoodsID=80065,GaiLv1=1250002,GaiLv2=1875002,NumGaiLv=3333,NumMax=2,NumMin=1},
									{GoodsID=80065,GaiLv1=1875003,GaiLv2=2500003,NumGaiLv=3333,NumMax=2,NumMin=1},
									{GoodsID=80065,GaiLv1=2500004,GaiLv2=3125004,NumGaiLv=3333,NumMax=2,NumMin=1},
									{GoodsID=80696,GaiLv1=3125005,GaiLv2=3750005,NumGaiLv=5000,NumMax=10,NumMin=5},
									{GoodsID=117,GaiLv1=3750006,GaiLv2=4375006,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=80397,GaiLv1=4375007,GaiLv2=5000007,NumGaiLv=200,NumMax=1,NumMin=0},
									{GoodsID=80397,GaiLv1=5000008,GaiLv2=5625008,NumGaiLv=200,NumMax=1,NumMin=0},
									{GoodsID=80191,GaiLv1=5625009,GaiLv2=6250009,NumGaiLv=6666,NumMax=1,NumMin=0},
									{GoodsID=80191,GaiLv1=6250010,GaiLv2=6875010,NumGaiLv=6666,NumMax=1,NumMin=0},
									{GoodsID=80191,GaiLv1=6875011,GaiLv2=7500011,NumGaiLv=6666,NumMax=1,NumMin=0},
									{GoodsID=80498,GaiLv1=7500012,GaiLv2=8125012,NumGaiLv=5000,NumMax=25,NumMin=15},
									{GoodsID=206,GaiLv1=8125013,GaiLv2=8750013,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=501,GaiLv1=8750014,GaiLv2=9375014,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80274,GaiLv1=9375015,GaiLv2=9640000,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=88591,GaiLv1=9640001,GaiLv2=9670000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88592,GaiLv1=9670001,GaiLv2=9700000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88593,GaiLv1=9700001,GaiLv2=9730000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88594,GaiLv1=9730001,GaiLv2=9760000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88595,GaiLv1=9760001,GaiLv2=9790000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88596,GaiLv1=9790001,GaiLv2=9820000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88597,GaiLv1=9820001,GaiLv2=9850000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88598,GaiLv1=9850001,GaiLv2=9880000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88599,GaiLv1=9880001,GaiLv2=9910000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88600,GaiLv1=9910001,GaiLv2=9940000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88601,GaiLv1=9940001,GaiLv2=9970000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88602,GaiLv1=9970001,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},--
								},
							},
							[2] = {Min=71,Max=95,
								Goodslist = {
									{GoodsID=80397,GaiLv1=1,GaiLv2=833334,NumGaiLv=9240,NumMax=1,NumMin=0},
									{GoodsID=80397,GaiLv1=833335,GaiLv2=1666668,NumGaiLv=9240,NumMax=1,NumMin=0},
									{GoodsID=80383,GaiLv1=1666669,GaiLv2=2500002,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80383,GaiLv1=2500003,GaiLv2=3333336,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80696,GaiLv1=3333337,GaiLv2=4166670,NumGaiLv=5000,NumMax=10,NumMin=5},
									{GoodsID=117,GaiLv1=4166671,GaiLv2=5000004,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=80181,GaiLv1=5000005,GaiLv2=5833338,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80181,GaiLv1=5833339,GaiLv2=6666672,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80498,GaiLv1=6666673,GaiLv2=7500006,NumGaiLv=5000,NumMax=25,NumMin=15},
									{GoodsID=206,GaiLv1=7500007,GaiLv2=8333340,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=501,GaiLv1=8333341,GaiLv2=9166674,NumGaiLv=4620,NumMax=1,NumMin=0},
									{GoodsID=80274,GaiLv1=9166675,GaiLv2=9640000,NumGaiLv=4620,NumMax=1,NumMin=0},
									{GoodsID=88591,GaiLv1=9640001,GaiLv2=9670000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88592,GaiLv1=9670001,GaiLv2=9700000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88593,GaiLv1=9700001,GaiLv2=9730000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88594,GaiLv1=9730001,GaiLv2=9760000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88595,GaiLv1=9760001,GaiLv2=9790000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88596,GaiLv1=9790001,GaiLv2=9820000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88597,GaiLv1=9820001,GaiLv2=9850000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88598,GaiLv1=9850001,GaiLv2=9880000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88599,GaiLv1=9880001,GaiLv2=9910000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88600,GaiLv1=9910001,GaiLv2=9940000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88601,GaiLv1=9940001,GaiLv2=9970000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88602,GaiLv1=9970001,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},--
								},
							},
							[3] = {Min=96,Max=100,
								Goodslist = {
									{GoodsID=80383,GaiLv1=1,GaiLv2=1000001,NumGaiLv=6527,NumMax=1,NumMin=0},
									{GoodsID=80383,GaiLv1=1000002,GaiLv2=2000002,NumGaiLv=6527,NumMax=1,NumMin=0},
									{GoodsID=80696,GaiLv1=2000003,GaiLv2=3000003,NumGaiLv=5000,NumMax=10,NumMin=5},
									{GoodsID=117,GaiLv1=3000004,GaiLv2=4000004,NumGaiLv=5000,NumMax=25,NumMin=15},
									{GoodsID=80181,GaiLv1=4000005,GaiLv2=5000005,NumGaiLv=6527,NumMax=1,NumMin=0},
									{GoodsID=80498,GaiLv1=5000006,GaiLv2=6000006,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=206,GaiLv1=6000007,GaiLv2=7000007,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=80181,GaiLv1=7000008,GaiLv2=8000008,NumGaiLv=6527,NumMax=1,NumMin=0},
									{GoodsID=784,GaiLv1=8000009,GaiLv2=9000009,NumGaiLv=3333,NumMax=1,NumMin=0},
									{GoodsID=784,GaiLv1=9000010,GaiLv2=9640000,NumGaiLv=3333,NumMax=1,NumMin=0},
									{GoodsID=88591,GaiLv1=9640001,GaiLv2=9670000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88592,GaiLv1=9670001,GaiLv2=9700000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88593,GaiLv1=9700001,GaiLv2=9730000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88594,GaiLv1=9730001,GaiLv2=9760000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88595,GaiLv1=9760001,GaiLv2=9790000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88596,GaiLv1=9790001,GaiLv2=9820000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88597,GaiLv1=9820001,GaiLv2=9850000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88598,GaiLv1=9850001,GaiLv2=9880000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88599,GaiLv1=9880001,GaiLv2=9910000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88600,GaiLv1=9910001,GaiLv2=9940000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88601,GaiLv1=9940001,GaiLv2=9970000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88602,GaiLv1=9970001,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},--
								},
							},
						},
				},
				[2] = {MinLV=26,MaxLV=40,
					Goodslist = {
							[1] = {Min=1,Max=70,
								Goodslist = {
									{GoodsID=80050,GaiLv1=1,GaiLv2=909090,NumGaiLv=9166,NumMax=1,NumMin=0},
									{GoodsID=80050,GaiLv1=909091,GaiLv2=1818181,NumGaiLv=9166,NumMax=1,NumMin=0},
									{GoodsID=80066,GaiLv1=1818182,GaiLv2=2727272,NumGaiLv=9166,NumMax=1,NumMin=0},
									{GoodsID=80696,GaiLv1=2727273,GaiLv2=3636363,NumGaiLv=5000,NumMax=15,NumMin=10},
									{GoodsID=80498,GaiLv1=3636364,GaiLv2=4545454,NumGaiLv=5000,NumMax=30,NumMin=20},
									{GoodsID=118,GaiLv1=4545455,GaiLv2=5454545,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=207,GaiLv1=5454546,GaiLv2=6363636,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=80397,GaiLv1=6363637,GaiLv2=7272727,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80397,GaiLv1=7272728,GaiLv2=8181818,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=501,GaiLv1=8181819,GaiLv2=9090909,NumGaiLv=50,NumMax=1,NumMin=0},
									{GoodsID=80274,GaiLv1=9090910,GaiLv2=9640000,NumGaiLv=50,NumMax=1,NumMin=0},
									{GoodsID=88591,GaiLv1=9640001,GaiLv2=9670000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88592,GaiLv1=9670001,GaiLv2=9700000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88593,GaiLv1=9700001,GaiLv2=9730000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88594,GaiLv1=9730001,GaiLv2=9760000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88595,GaiLv1=9760001,GaiLv2=9790000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88596,GaiLv1=9790001,GaiLv2=9820000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88597,GaiLv1=9820001,GaiLv2=9850000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88598,GaiLv1=9850001,GaiLv2=9880000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88599,GaiLv1=9880001,GaiLv2=9910000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88600,GaiLv1=9910001,GaiLv2=9940000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88601,GaiLv1=9940001,GaiLv2=9970000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88602,GaiLv1=9970001,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},--
								},
							},
							[2] = {Min=71,Max=95,
								Goodslist = {
									{GoodsID=80397,GaiLv1=1,GaiLv2=769231,NumGaiLv=4916,NumMax=1,NumMin=0},
									{GoodsID=80397,GaiLv1=769232,GaiLv2=1538462,NumGaiLv=4916,NumMax=1,NumMin=0},
									{GoodsID=80181,GaiLv1=1538463,GaiLv2=2307693,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80181,GaiLv1=2307694,GaiLv2=3076924,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80181,GaiLv1=3076925,GaiLv2=3846155,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80181,GaiLv1=3846156,GaiLv2=4615386,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80192,GaiLv1=4615387,GaiLv2=5384617,NumGaiLv=75,NumMax=1,NumMin=0},
									{GoodsID=80696,GaiLv1=5384618,GaiLv2=6153848,NumGaiLv=5000,NumMax=15,NumMin=10},
									{GoodsID=80498,GaiLv1=6153849,GaiLv2=6923079,NumGaiLv=5000,NumMax=30,NumMin=20},
									{GoodsID=118,GaiLv1=6923080,GaiLv2=7692310,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=207,GaiLv1=7692311,GaiLv2=8461541,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=501,GaiLv1=8461542,GaiLv2=9230772,NumGaiLv=2458,NumMax=1,NumMin=0},
									{GoodsID=80274,GaiLv1=9230773,GaiLv2=9640000,NumGaiLv=2458,NumMax=1,NumMin=0},
									{GoodsID=88591,GaiLv1=9640001,GaiLv2=9670000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88592,GaiLv1=9670001,GaiLv2=9700000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88593,GaiLv1=9700001,GaiLv2=9730000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88594,GaiLv1=9730001,GaiLv2=9760000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88595,GaiLv1=9760001,GaiLv2=9790000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88596,GaiLv1=9790001,GaiLv2=9820000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88597,GaiLv1=9820001,GaiLv2=9850000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88598,GaiLv1=9850001,GaiLv2=9880000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88599,GaiLv1=9880001,GaiLv2=9910000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88600,GaiLv1=9910001,GaiLv2=9940000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88601,GaiLv1=9940001,GaiLv2=9970000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88602,GaiLv1=9970001,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},--
								},
							},
							[3] = {Min=96,Max=100,
								Goodslist = {
									{GoodsID=80384,GaiLv1=1,GaiLv2=555556,NumGaiLv=4800,NumMax=1,NumMin=0},
									{GoodsID=80384,GaiLv1=555557,GaiLv2=1111112,NumGaiLv=4800,NumMax=1,NumMin=0},
									{GoodsID=80181,GaiLv1=1111113,GaiLv2=1666668,NumGaiLv=1769,NumMax=2,NumMin=1},
									{GoodsID=80181,GaiLv1=1666669,GaiLv2=2222224,NumGaiLv=1769,NumMax=2,NumMin=1},
									{GoodsID=80181,GaiLv1=2222225,GaiLv2=2777780,NumGaiLv=1769,NumMax=2,NumMin=1},
									{GoodsID=80181,GaiLv1=2777781,GaiLv2=3333336,NumGaiLv=1769,NumMax=2,NumMin=1},
									{GoodsID=80192,GaiLv1=3333337,GaiLv2=3888892,NumGaiLv=8826,NumMax=1,NumMin=0},
									{GoodsID=80696,GaiLv1=3888893,GaiLv2=4444448,NumGaiLv=5000,NumMax=15,NumMin=10},
									{GoodsID=80498,GaiLv1=4444449,GaiLv2=5000004,NumGaiLv=5000,NumMax=30,NumMin=20},
									{GoodsID=118,GaiLv1=5000005,GaiLv2=5555560,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=207,GaiLv1=5555561,GaiLv2=6111116,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=785,GaiLv1=6111117,GaiLv2=6666672,NumGaiLv=3000,NumMax=1,NumMin=0},
									{GoodsID=785,GaiLv1=6666673,GaiLv2=7222228,NumGaiLv=3000,NumMax=1,NumMin=0},
									{GoodsID=785,GaiLv1=7222229,GaiLv2=7777784,NumGaiLv=3000,NumMax=1,NumMin=0},
									{GoodsID=785,GaiLv1=7777785,GaiLv2=8333340,NumGaiLv=3000,NumMax=1,NumMin=0},
									{GoodsID=785,GaiLv1=8333341,GaiLv2=8888896,NumGaiLv=3000,NumMax=1,NumMin=0},
									{GoodsID=80387,GaiLv1=8888897,GaiLv2=9640000,NumGaiLv=1500,NumMax=1,NumMin=0},
									{GoodsID=88591,GaiLv1=9640001,GaiLv2=9670000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88592,GaiLv1=9670001,GaiLv2=9700000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88593,GaiLv1=9700001,GaiLv2=9730000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88594,GaiLv1=9730001,GaiLv2=9760000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88595,GaiLv1=9760001,GaiLv2=9790000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88596,GaiLv1=9790001,GaiLv2=9820000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88597,GaiLv1=9820001,GaiLv2=9850000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88598,GaiLv1=9850001,GaiLv2=9880000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88599,GaiLv1=9880001,GaiLv2=9910000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88600,GaiLv1=9910001,GaiLv2=9940000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88601,GaiLv1=9940001,GaiLv2=9970000,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88602,GaiLv1=9970001,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},--
								},
							},
						},
				},
				[3] = {MinLV=41,MaxLV=85,
					Goodslist = {
							[1] = {Min=1,Max=70,
								Goodslist = {
									{GoodsID=80051,GaiLv1=1,GaiLv2=500000,NumGaiLv=8333,NumMax=1,NumMin=0},
									{GoodsID=80051,GaiLv1=500001,GaiLv2=1000001,NumGaiLv=8333,NumMax=1,NumMin=0},
									{GoodsID=80067,GaiLv1=1000002,GaiLv2=1500002,NumGaiLv=8333,NumMax=1,NumMin=0},
									{GoodsID=80696,GaiLv1=1500003,GaiLv2=2000003,NumGaiLv=5000,NumMax=20,NumMin=15},
									{GoodsID=80498,GaiLv1=2000004,GaiLv2=2500004,NumGaiLv=5000,NumMax=35,NumMin=25},
									{GoodsID=119,GaiLv1=2500005,GaiLv2=3000005,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=208,GaiLv1=3000006,GaiLv2=3500006,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=80397,GaiLv1=3500007,GaiLv2=4000007,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80397,GaiLv1=4000008,GaiLv2=4500008,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80181,GaiLv1=4500009,GaiLv2=5000009,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80181,GaiLv1=5000010,GaiLv2=5500010,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80181,GaiLv1=5500011,GaiLv2=6000011,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80181,GaiLv1=6000012,GaiLv2=6500012,NumGaiLv=100,NumMax=1,NumMin=0},
									{GoodsID=80192,GaiLv1=6500013,GaiLv2=7000013,NumGaiLv=60,NumMax=1,NumMin=0},
									{GoodsID=80192,GaiLv1=7000014,GaiLv2=7500014,NumGaiLv=60,NumMax=1,NumMin=0},
									{GoodsID=80192,GaiLv1=7500015,GaiLv2=8000015,NumGaiLv=60,NumMax=1,NumMin=0},
									{GoodsID=80192,GaiLv1=8000016,GaiLv2=8500016,NumGaiLv=60,NumMax=1,NumMin=0},
									{GoodsID=80192,GaiLv1=8500017,GaiLv2=9000017,NumGaiLv=60,NumMax=1,NumMin=0},
									{GoodsID=501,GaiLv1=9000018,GaiLv2=9500018,NumGaiLv=50,NumMax=1,NumMin=0},
									{GoodsID=88591,GaiLv1=9000019,GaiLv2=9530019,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88592,GaiLv1=9530020,GaiLv2=9560020,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88593,GaiLv1=9560021,GaiLv2=9590021,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88594,GaiLv1=9590022,GaiLv2=9620022,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88595,GaiLv1=9650023,GaiLv2=9680023,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88596,GaiLv1=9710024,GaiLv2=9740024,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88597,GaiLv1=9740025,GaiLv2=9770025,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88598,GaiLv1=9770026,GaiLv2=9800026,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88599,GaiLv1=9800027,GaiLv2=9830027,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88600,GaiLv1=9830028,GaiLv2=9860028,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88601,GaiLv1=9860029,GaiLv2=9890029,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88602,GaiLv1=9890030,GaiLv2=9920030,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=80274,GaiLv1=9920031,GaiLv2=10000000,NumGaiLv=50,NumMax=1,NumMin=0},
								},
							},
							[2] = {Min=71,Max=95,
								Goodslist = {
									{GoodsID=80397,GaiLv1=1,GaiLv2=769231,NumGaiLv=5044,NumMax=1,NumMin=0},
									{GoodsID=80397,GaiLv1=769232,GaiLv2=1538462,NumGaiLv=5044,NumMax=1,NumMin=0},
									{GoodsID=80181,GaiLv1=1538463,GaiLv2=2307693,NumGaiLv=5044,NumMax=1,NumMin=0},
									{GoodsID=80696,GaiLv1=2307694,GaiLv2=3076924,NumGaiLv=5000,NumMax=20,NumMin=15},
									{GoodsID=80498,GaiLv1=3076925,GaiLv2=3846155,NumGaiLv=5000,NumMax=35,NumMin=25},
									{GoodsID=80181,GaiLv1=3846156,GaiLv2=4615386,NumGaiLv=5044,NumMax=1,NumMin=0},
									{GoodsID=80192,GaiLv1=4615387,GaiLv2=5384617,NumGaiLv=3026,NumMax=1,NumMin=0},
									{GoodsID=119,GaiLv1=5384618,GaiLv2=6153848,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=208,GaiLv1=6153849,GaiLv2=6923079,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=80192,GaiLv1=6923080,GaiLv2=7692310,NumGaiLv=3026,NumMax=1,NumMin=0},
									{GoodsID=80192,GaiLv1=7692311,GaiLv2=8461541,NumGaiLv=3026,NumMax=1,NumMin=0},
									{GoodsID=501,GaiLv1=8461542,GaiLv2=9230772,NumGaiLv=2522,NumMax=1,NumMin=0},
									{GoodsID=88591,GaiLv1=9230773,GaiLv2=9260773,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88592,GaiLv1=9260774,GaiLv2=9290774,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88593,GaiLv1=9290775,GaiLv2=9320775,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88594,GaiLv1=9350776,GaiLv2=9380776,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88595,GaiLv1=9380777,GaiLv2=9410777,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88596,GaiLv1=9410778,GaiLv2=9440778,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88597,GaiLv1=9440779,GaiLv2=9470779,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88598,GaiLv1=9470780,GaiLv2=9500780,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88599,GaiLv1=9500781,GaiLv2=9530781,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88600,GaiLv1=9530782,GaiLv2=9560782,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88601,GaiLv1=9560783,GaiLv2=9590783,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88602,GaiLv1=9620784,GaiLv2=9650784,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=80274,GaiLv1=9650785,GaiLv2=10000000,NumGaiLv=2522,NumMax=1,NumMin=0},
								},
							},
							[3] = {Min=96,Max=100,
								Goodslist = {
									{GoodsID=80384,GaiLv1=1,GaiLv2=1000001,NumGaiLv=1666,NumMax=1,NumMin=0},
									{GoodsID=80384,GaiLv1=1000002,GaiLv2=2000002,NumGaiLv=1666,NumMax=1,NumMin=0},
									{GoodsID=80384,GaiLv1=2000003,GaiLv2=3000003,NumGaiLv=1666,NumMax=1,NumMin=0},
									{GoodsID=80498,GaiLv1=3000004,GaiLv2=4000004,NumGaiLv=5000,NumMax=20,NumMin=15},
									{GoodsID=80696,GaiLv1=4000005,GaiLv2=5000005,NumGaiLv=5000,NumMax=35,NumMin=25},
									{GoodsID=786,GaiLv1=5000006,GaiLv2=6000006,NumGaiLv=1666,NumMax=1,NumMin=0},
									{GoodsID=119,GaiLv1=6000007,GaiLv2=7000007,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=208,GaiLv1=7000008,GaiLv2=8000008,NumGaiLv=5000,NumMax=2,NumMin=1},
									{GoodsID=80388,GaiLv1=8000009,GaiLv2=9000009,NumGaiLv=833,NumMax=1,NumMin=0},
									{GoodsID=88591,GaiLv1=9000010,GaiLv2=9030010,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88592,GaiLv1=9030011,GaiLv2=9060011,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88593,GaiLv1=9060012,GaiLv2=9090012,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88594,GaiLv1=9090013,GaiLv2=9120013,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88595,GaiLv1=9120014,GaiLv2=9150014,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88596,GaiLv1=9150015,GaiLv2=9180015,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88597,GaiLv1=9180016,GaiLv2=9210016,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88598,GaiLv1=9210017,GaiLv2=9240017,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88599,GaiLv1=9240018,GaiLv2=9270018,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88600,GaiLv1=9270019,GaiLv2=9300019,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88601,GaiLv1=9300020,GaiLv2=9330020,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=88602,GaiLv1=9330021,GaiLv2=9360021,NumGaiLv=10000,NumMax=1,NumMin=0},--
									{GoodsID=80388,GaiLv1=9360022,GaiLv2=10000000,NumGaiLv=833,NumMax=1,NumMin=0},
								},
							},
						},
				},
}

--经验奖励表
MerryChristmas_JingYanTable = {
[	1	] = 	296	,
[	2	] = 	395	,
[	3	] = 	494	,
[	4	] = 	593	,
[	5	] = 	691	,
[	6	] = 	790	,
[	7	] = 	889	,
[	8	] = 	988	,
[	9	] = 	1087	,
[	10	] = 	1186	,
[	11	] = 	1482	,
[	12	] = 	1680	,
[	13	] = 	1877	,
[	14	] = 	2075	,
[	15	] = 	2273	,
[	16	] = 	2471	,
[	17	] = 	2668	,
[	18	] = 	2866	,
[	19	] = 	3064	,
[	20	] = 	3261	,
[	21	] = 	3854	,
[	22	] = 	4151	,
[	23	] = 	4447	,
[	24	] = 	4744	,
[	25	] = 	5040	,
[	26	] = 	7830	,
[	27	] = 	8352	,
[	28	] = 	8874	,
[	29	] = 	9396	,
[	30	] = 	9919	,
[	31	] = 	10441	,
[	32	] = 	10963	,
[	33	] = 	11485	,
[	34	] = 	12007	,
[	35	] = 	12529	,
[	36	] = 	14095	,
[	37	] = 	14748	,
[	38	] = 	15400	,
[	39	] = 	16053	,
[	40	] = 	16705	,
[	41	] = 	18663	,
[	42	] = 	19446	,
[	43	] = 	20229	,
[	44	] = 	21012	,
[	45	] = 	21795	,
[	46	] = 	22578	,
[	47	] = 	23361	,
[	48	] = 	24144	,
[	49	] = 	24928	,
[	50	] = 	25711	,
[	51	] = 	25711	,
[	52	] = 	25711	,
[	53	] = 	25711	,
[	54	] = 	25711	,
[	55	] = 	25711	,
[	56	] = 	27190	,
[	57	] = 	27190	,
[	58	] = 	27190	,
[	59	] = 	27190	,
[	60	] = 	27190	,
[	61	] = 	27190	,
[	62	] = 	27190	,
[	63	] = 	27190	,
[	64	] = 	27190	,
[	65	] = 	27190	,
}
--雪人升级所需经验、物品和下个阶段的NPCID表
MerryChristmas_NPCTable = {
			[1] = {
				[11728] = {CZD=149,NeedGoods=80586,NextNPC=11729},
				[11729] = {CZD=158,NeedGoods=80587,NextNPC=11730},
				[11730] = {CZD=167,NeedGoods=80588,NextNPC=11731},
				[11731] = {CZD=176,NeedGoods=80589,NextNPC=11732},
				[11732] = {CZD=180,NeedGoods=80590,NextNPC=11733},
				[11733] = {CZD=0,NeedGoods=0,NextNPC=0},
				},
			[2] = {
				[11734] = {CZD=825,NeedGoods=80586,NextNPC=11735},
				[11735] = {CZD=875,NeedGoods=80587,NextNPC=11736},
				[11736] = {CZD=925,NeedGoods=80588,NextNPC=11737},
				[11737] = {CZD=950,NeedGoods=80589,NextNPC=11738},
				[11738] = {CZD=1000,NeedGoods=80590,NextNPC=11739},
				[11739] = {CZD=0,NeedGoods=0,NextNPC=0},
				},
			} 

--建雪精灵和创建活动触发器
if not API_IsEctypeServer() or API_IsBranchServer() then
	if not API_IsBattleGameServer() then
		MerryChristmas_TimerTriggerID = MerryChristmas_TimerTriggerID or API_CreateTimerTriggerG(0,0,60,-1,'MerryChristmas_TimerTriggerGCallFunc')
	end
end

function MerryChristmas_TimerTriggerGCallFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	
	local Time = os.time() 
	local NowTime = os.date("*t", os.time()) 
	NowTime.year = Christmas_ActTime.StartYear
	NowTime.month = Christmas_ActTime.StartMonth
	NowTime.day = Christmas_ActTime.StartDay
	NowTime.hour = 0 
	NowTime.min = 0 
	NowTime.sec = 0 
	local StartTime = os.time(NowTime) 
	local EndTime = os.date("*t", os.time()) 
	EndTime.year = Christmas_ActTime.EndYear
	EndTime.month = Christmas_ActTime.EndMonth
	EndTime.day = Christmas_ActTime.EndDay
	EndTime.hour = 0 
	EndTime.min = 0 
	EndTime.sec = 0 
	local EndTime2 = os.time(EndTime) 
	if Time < StartTime or Time >= EndTime2 then
		--if (math.ceil(Day/7) == 2 or math.ceil(Day/7) == 4) and (Week == 6 or Week == 7) then
		if (Week == 6 or Week == 7) and API_VarDataGetNumber_Ex(1, 0, -2000, 1, 1) == 0 then
			if not API_IsEctypeServer() and API_GetServerID() == 1 then
				LBXueJingLing = LBXueJingLing or API_CreateMonster(2,11740,241,166,5,0,-1)
				DGXueJingLing = DGXueJingLing or API_CreateMonster(1,11740,208,209,5,0,-1)
			end
			if API_GetServerID() == 1 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
				MC_YGYLNPC = MC_YGYLNPC or API_CreateMonster(23,11740,119,342,5,0,-1)
				MC_SHQDNPC = MC_SHQDNPC or API_CreateMonster(10,11740,119,317,5,0,-1)
			end
			if API_GetServerID() == 1 then
				MC_NSSDNPC = MC_NSSDNPC or API_CreateMonster(98,11740,360,394,5,0,-1)
			end
			if API_GetServerID() == 1 then
				MC_LRNZNPC = MC_LRNZNPC or API_CreateMonster(99,11740,379,369,5,0,-1)
			end
			local ServerID = API_GetServerID()
			local RedayTime = MerryChristmas_ActTime.RedayTime
			local StartTime = MerryChristmas_ActTime.StartTime
			local EndTime = MerryChristmas_ActTime.EndTime
			if not API_IsEctypeServer() or API_IsBranchServer() then
				for i = 1,table.getn(MerryChristmas_ACTMapTable) do
					local MapID = MerryChristmas_ACTMapTable[i].MapID
					if MerryChristmas_MapMonsterTable[API_GetRightMapID(MapID)] == nil then
						MerryChristmas_MapMonsterTable[API_GetRightMapID(MapID)] = {}
					end
					if MerryChristmas_MapXueDuiTable[API_GetRightMapID(MapID)] == nil then
						MerryChristmas_MapXueDuiTable[API_GetRightMapID(MapID)] = {}
					end
				end
			end
			if Hour == (StartTime - 1) and Minute >= 30 then
				Snow_Start = 0
				MerryChristmas_Monster_TimerTriggerID = nil
				if math.mod(Minute,10) == 0 then
					API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 17,'雪人活动于'..StartTime..'：00--'..EndTime..'：00在珊瑚群岛、阳光雨林、娜沙湿地、月暮草场、落日农庄举行，欢迎各位英雄踊跃参与！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 8,'雪人活动于'..StartTime..'：00--'..EndTime..'：00在珊瑚群岛、阳光雨林、娜沙湿地、月暮草场、落日农庄举行，欢迎各位英雄踊跃参与！')
					--API_ActorBroadcastMsgEx(MapID,-1,0,17,'雪人活动于'..StartTime..'：00--'..EndTime..'：00在珊瑚群岛、阳光雨林、娜沙湿地、月暮草场、落日农庄举行，欢迎各位英雄踊跃参与！')
				end
			end
			if Hour >= StartTime and Hour < EndTime then
				if Snow_Start == nil or Snow_Start < 1 then
					Snow_Start = 1
					MerryChristmas_Monster_TimerTriggerCallFunc()
					MerryChristmas_Monster_TimerTriggerID = MerryChristmas_Monster_TimerTriggerID or API_CreateTimerTriggerG(0,0,60,-1,'MerryChristmas_Monster_TimerTriggerCallFunc')
					API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 17,'雪人活动现在开始！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 8,'雪人活动现在开始！')
					--API_ActorBroadcastMsgEx(MapID,-1,0,17,'雪人活动现在开始！')
					if math.mod (Minute,5) == 0 and Minute < 45 then
						API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 17,'现在去珊瑚群岛、阳光雨林、娜沙湿地、月暮草场、落日农庄杀死小雪怪或打开小雪堆，可以获得堆雪人的各种材料！堆雪人获得的雪人积分可在雪人处兑换各种礼品！')
						API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 8,'杀死出现在地图内的小雪怪或打开小雪堆，可以获得堆雪人的各种材料！')
						--API_ActorBroadcastMsgEx(-1,-1,0,17,'现在去珊瑚群岛、阳光雨林、娜沙湿地、月暮草场、落日农庄杀死小雪怪或打开小雪堆，可以获得堆雪人的各种材料！堆雪人获得的雪人积分可在雪人处兑换各种礼品！')
						--API_ActorBroadcastMsgEx(-1,-1,0,8,'杀死出现在地图内的小雪怪或打开小雪堆，可以获得堆雪人的各种材料！')
					end
				end
			end
			if Hour == (EndTime - 1) and Minute >= 45 then
				if Snow_Start == nil or Snow_Start < 2 then
					Snow_Start = 2
					if math.mod(Minute,5) == 0 then
						API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 17,'请注意，各地图内出现的小雪怪和小雪堆将在'..EndTime..'点消失！')
						API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 8,'请注意，各地图内出现的小雪怪和小雪堆将在'..EndTime..'点消失！')
						--API_ActorBroadcastMsgEx(MapID,-1,0,17,'请注意，各地图内出现的小雪怪和小雪堆将在'..EndTime..'点消失！')
					end
				end
			end
			if Hour == (EndTime - 1) and Minute == 59 then
				if Snow_Start == nil or Snow_Start < 3 then
					Snow_Start = 3
					API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 17,'雪人活动已经结束！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 8,'雪人活动已经结束！')
					--API_ActorBroadcastMsgEx(MapID,-1,0,17,'雪人活动已经结束！')
				end
			end
		end
		if (Week == MerryChristmas_ActWeek3 or Week == MerryChristmas_ActWeek4) and API_VarDataGetNumber_Ex(1, 0, -2000, 1, 1) == 0 then
			if (Hour == 14 and Minute == 0) or (Hour == 14 and Minute == 30) or (Hour == 20 and Minute == 30) or (Hour == 21 and Minute == 0) then
				API_ActorMsgBoard(0, -1, -1,'雪人活动将在本周六和周日的16：00--17：00举行，欢迎各位英雄踊跃参与！')
			end
		end
		if Week == 7 and Hour == 23 and Minute == 30 then 
			if API_VarDataGetNumber_Ex(1, 0, -2000, 1, 1) == 0 then
				if API_GetServerID() == 1 then
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 1, 1)
					--API_VarDataSave_Ex(1, 0, -2000)

				end
				if not API_IsEctypeServer() and API_GetServerID() == 1 then
					if LBXueJingLing ~= nil and API_GetMonsterID(LBXueJingLing) > 0 then
						API_DestroyMonster(LBXueJingLing)
						LBXueJingLing = nil
					end
					if DGXueJingLing ~= nil and API_GetMonsterID(DGXueJingLing) > 0 then
						API_DestroyMonster(DGXueJingLing)
						DGXueJingLing = nil
					end
				end
				if API_GetServerID() == 1 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
					if MC_YGYLNPC ~= nil and API_GetMonsterID(MC_YGYLNPC) > 0 then
						API_DestroyMonster(MC_YGYLNPC)
						MC_YGYLNPC = nil
					end
					if MC_SHQDNPC ~= nil and API_GetMonsterID(MC_SHQDNPC) > 0 then
						API_DestroyMonster(MC_SHQDNPC)
						MC_SHQDNPC = nil
					end
				end
				if API_GetServerID() == 1 then
					if MC_NSSDNPC ~= nil and API_GetMonsterID(MC_NSSDNPC) > 0 then
						API_DestroyMonster(MC_NSSDNPC)
						MC_NSSDNPC = nil
					end
				end
				if API_GetServerID() == 1 then
					if MC_LRNZNPC ~= nil and API_GetMonsterID(MC_LRNZNPC) > 0 then
						API_DestroyMonster(MC_LRNZNPC)
						MC_LRNZNPC = nil
					end
				end
			elseif API_VarDataGetNumber_Ex(1, 0, -2000, 1, 1) >= 1 then
				if API_GetServerID() == 1 then
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 1, 0)
					--API_VarDataSave_Ex(1, 0, -2000)
				end
			end
		end
	end
	--[[if Week == MerryChristmas_ActWeek2 and Minute >= 30 then
		if MerryChristmas_XueRenTable ~= nil then
			for j in MerryChristmas_XueRenTable do
				if MerryChristmas_XueRenTable[j] ~= nil then
					if API_GetMonsterID(j) > 0 then
						API_DestroyMonster(j)
						MerryChristmas_XueRenTable[j] = nil
					end
				end
			end
			MerryChristmas_XueRenTable = {}
		end
	end]]
end

function MerryChristmas_Monster_TimerTriggerCallFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local Time = os.time() 
	local NowTime = os.date("*t", os.time()) 
	NowTime.year = Christmas_ActTime.StartYear
	NowTime.month = Christmas_ActTime.StartMonth
	NowTime.day = Christmas_ActTime.StartDay
	NowTime.hour = 0 
	NowTime.min = 0 
	NowTime.sec = 0 
	local StartTime = os.time(NowTime) 
	local EndTime = os.date("*t", os.time()) 
	EndTime.year = Christmas_ActTime.EndYear
	EndTime.month = Christmas_ActTime.EndMonth
	EndTime.day = Christmas_ActTime.EndDay
	EndTime.hour = 0 
	EndTime.min = 0 
	EndTime.sec = 0 
	local EndTime2 = os.time(EndTime) 
	if Time < StartTime or Time >= EndTime2 then
	--if (math.ceil(Day/7) == 2 or math.ceil(Day/7) == 4) and (Week == 6 or Week == 7) then
		if (Week == 6 or Week == 7) and API_VarDataGetNumber_Ex(1, 0, -2000, 1, 1) == 0 then
			local ServerID = API_GetServerID()
			local StartTime = MerryChristmas_ActTime.StartTime
			local EndTime = MerryChristmas_ActTime.EndTime
			local MonsterTable = MerryChristmas_ACTMapTable
			if Hour >= StartTime and Hour < EndTime then
				for i = 1,table.getn(MonsterTable) do
					local ServerTable = MonsterTable[i].ServerID
					for k,v in ServerTable do
						if ServerID == v then
							local MapID = MonsterTable[i].MapID
							local RightMapID = API_GetRightMapID(MapID)
							local PlayList = API_GetActorInArea(RightMapID,0,0,0,0,0)
							local PlayNum = 50
							if PlayList ~= nil then
								PlayNum = table.getn(PlayList)
							end
							local MonsterID = MonsterTable[i].MonsterID
							local MonsterNum = MonsterTable[i].MonsterNum
							local XueDuiID = MonsterTable[i].XueDuiID
							local XueDuiNum = MonsterTable[i].XueDuiNum
							local PlayMin = 10
							local PlayMax = 150
							if PlayNum <= PlayMin then
								MonsterNum = 40
								XueDuiNum = 20
							elseif PlayNum > PlayMin and PlayNum <= PlayMax then
								local PlayNum2 = PlayNum - PlayMin
								MonsterNum = 40 + PlayNum2 * 4
								XueDuiNum = 20 + PlayNum2 * 2
							end
							local x1 = MonsterTable[i].x1
							local y1 = MonsterTable[i].y1
							local x2 = MonsterTable[i].x2
							local y2 = MonsterTable[i].y2
							local x3 = MonsterTable[i].x3
							local y3 = MonsterTable[i].y3
							local x4 = MonsterTable[i].x4
							local y4 = MonsterTable[i].y4
							if API_MapIsValid(RightMapID) and type(MerryChristmas_MapMonsterTable[RightMapID]) == 'table' then
								for p = 1,MonsterNum do
									if MerryChristmas_MapMonsterTable[RightMapID][p] == nil then
										local x,y
										local Num = 0
										repeat
											Num = Num + 1
											x = math.random(x1,x2)
											y = math.random(y1,y2)
										until not API_IsBlockTile(RightMapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
										if not API_IsBlockTile(RightMapID,x,y,0) then
											local FastID = API_CreateMonster(RightMapID,MonsterID,x,y,4,0,-1)
											MerryChristmas_MapMonsterTable[RightMapID][p] = FastID
										end
									else
										local FastID = MerryChristmas_MapMonsterTable[RightMapID][p]
										if API_GetMonsterID(FastID) <= 0 then
											local x,y
											local Num = 0
											repeat
												Num = Num + 1
												x = math.random(x1,x2)
												y = math.random(y1,y2)
											until not API_IsBlockTile(RightMapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4))  or Num == 100
											if not API_IsBlockTile(RightMapID,x,y,0) then
												local FastID = API_CreateMonster(RightMapID,MonsterID,x,y,4,0,-1)
												MerryChristmas_MapMonsterTable[RightMapID][p] = FastID
											end
										end
									end
								end
							end 
							if API_MapIsValid(RightMapID) and type(MerryChristmas_MapXueDuiTable[RightMapID]) == 'table' then
								for p = 1,XueDuiNum do
									if MerryChristmas_MapXueDuiTable[RightMapID][p] == nil then
										MerryChristmas_MapXueDuiTable[RightMapID][p] = {}
										local x,y
										local Num = 0
										repeat
											Num = Num + 1
											x = math.random(x1,x2)
											y = math.random(y1,y2)
										until not API_IsBlockTile(RightMapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
										if not API_IsBlockTile(RightMapID,x,y,0) then
											h = API_CreateResBoxEx_RetUIDHigh(MapID,x,y,XueDuiID,1,'雪人活动刷雪堆',0)
											l = API_GetUIDLow()
											MerryChristmas_MapXueDuiTable[RightMapID][p][1] = h
											MerryChristmas_MapXueDuiTable[RightMapID][p][2] = l
										end
									else
										local h = MerryChristmas_MapXueDuiTable[RightMapID][p][1]
										local l = MerryChristmas_MapXueDuiTable[RightMapID][p][2]
										if API_IsExistByUID(h,l) == true then 
										else
											local x,y
											local Num = 0
											repeat
												Num = Num + 1
												x = math.random(x1,x2)
												y = math.random(y1,y2)
											until not API_IsBlockTile(RightMapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
											if not API_IsBlockTile(RightMapID,x,y,0) then
												h = API_CreateResBoxEx_RetUIDHigh(MapID,x,y,XueDuiID,1,'雪人活动刷雪堆',0)
												l = API_GetUIDLow()
												MerryChristmas_MapXueDuiTable[RightMapID][p][1] = h
												MerryChristmas_MapXueDuiTable[RightMapID][p][2] = l
											end
										end
									end
								end
							end
						end
					end
				end
			else
				--删除雪怪和雪堆
				for i = 1,table.getn(MonsterTable) do
					local ServerTable = MonsterTable[i].ServerID
					for k,v in ServerTable do
						if ServerID == v then
							local MapID = MonsterTable[i].MapID
							local RightMapID = API_GetRightMapID(MapID)
							local MonsterID = MonsterTable[i].MonsterID
							local MonsterNum = MonsterTable[i].MonsterNum
							local XueDuiID = MonsterTable[i].XueDuiID
							local XueDuiNum = MonsterTable[i].XueDuiNum
							if API_MapIsValid(RightMapID) and type(MerryChristmas_MapMonsterTable[RightMapID]) == 'table' then
								for p = 1,MonsterNum do
									local FastID = MerryChristmas_MapMonsterTable[RightMapID][p]
									if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
										API_DestroyMonster(FastID)
										MerryChristmas_MapMonsterTable[RightMapID][p] = nil
									end
								end
							end
							if API_MapIsValid(RightMapID) and type(MerryChristmas_MapXueDuiTable[RightMapID]) == 'table' then
								for p = 1,XueDuiNum do
									if MerryChristmas_MapXueDuiTable[RightMapID][p] ~= nil then
										local h = MerryChristmas_MapXueDuiTable[RightMapID][p][1]
										local l = MerryChristmas_MapXueDuiTable[RightMapID][p][2]
										if API_IsExistByUID(h,l) == true then 
											API_DestroyByUID(h,l)
											MerryChristmas_MapXueDuiTable[RightMapID][p] = nil
										end
									end
								end
							end
						end
					end
				end
			end
		else
			--删除触发器
			API_DestroyTriggerG(TriggerID)
		end
	end
end

function MerryChristmas_OnLogin(ActorID) --上线给卷轴
	local ActorID = ActorID or API_RequestGetActorID()
	if API_GetActorExpLevel(ActorID) < 12 then return end
	local ServerID = API_GetServerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local RedayTime = MerryChristmas_ActTime.RedayTime
	local StartTime = MerryChristmas_ActTime.StartTime
	local EndTime3 = MerryChristmas_ActTime.EndTime
	local MapXueRen = API_VarDataGetNumber(ActorID,1,19016)
	local MapID = math.floor(MapXueRen/100)
	local XueRen = math.mod(MapXueRen,100)
	local PlayMapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(PlayMapID)
	local MapConfigID = API_GetMapConfigID(PlayMapID)
	--if (math.ceil(Day/7) == 2 or math.ceil(Day/7) == 4) and (Week == 6 or Week == 7) then
	local Time = os.time() 
	local NowTime = os.date("*t", os.time()) 
	NowTime.year = Christmas_ActTime.StartYear
	NowTime.month = Christmas_ActTime.StartMonth
	NowTime.day = Christmas_ActTime.StartDay
	NowTime.hour = 0 
	NowTime.min = 0 
	NowTime.sec = 0 
	local StartTime = os.time(NowTime) 
	local EndTime = os.date("*t", os.time()) 
	EndTime.year = Christmas_ActTime.EndYear
	EndTime.month = Christmas_ActTime.EndMonth
	EndTime.day = Christmas_ActTime.EndDay
	EndTime.hour = 0 
	EndTime.min = 0 
	EndTime.sec = 0 
	local EndTime2 = os.time(EndTime) 
	if Time < StartTime or Time >= EndTime2 then
		if (Week == 6 or Week == 7) and API_VarDataGetNumber_Ex(1, 0, -2000, 1, 1) == 0 then
			if Hour >= RedayTime and Hour < EndTime3 then
				if PlayMapID == StaticMapID then
					API_RemoveTaskScroll(ActorID,50001)
					LRY_UItwinkemanage(ActorID,12,65,104099,50001,32,'MerryChristmas_JuanZhou')
--~ 					if XueRen > 0 then
--~ 						API_AddTaskScrollEx(ActorID,50001,104099,'MerryChristmas_JuanZhou',0)
--~ 					else
--~ 						API_AddTaskScroll(ActorID,50001,104099,'MerryChristmas_JuanZhou')
--~ 					end
					if XueRen > 0 then
						if XueRen == ServerID and MapConfigID == MapID then
							for j in MerryChristmas_XueRenTable do
								if MerryChristmas_XueRenTable[j] ~= nil then
									if ActorID == MerryChristmas_XueRenTable[j].ZhuRenID then
										if API_GetMonsterID(j) > 0 then
											local x = MerryChristmas_XueRenTable[j].x
											local y = MerryChristmas_XueRenTable[j].y
											local m = MerryChristmas_XueRenTable[j].m
											API_ActorSendMsg(ActorID,3,'您在'..API_GetMapName(m)..''..API_TileToPixelX(m,x,y)..','..API_TileToPixelY(m,x,y)..'堆了一个雪人，请前往查看')
											return
										else
											MerryChristmas_XueRenTable[j] = nil
											API_VarDataSetNumber(ActorID,1,19016,0)
											return
										end
									end
								end
							end
							API_VarDataSetNumber(ActorID,1,19016,0)
						else
							if XueRen == 2 or XueRen == 3 or XueRen == 4 or XueRen == 5 or XueRen == 10 then
								API_ActorSendMsg(ActorID,3,'您在'..GLOBAL_Navigate_ServerID[XueRen].name..'的'..API_GetMapName(MapID)..'地图堆了一个雪人，请前往查看')
							else
								API_ActorSendMsg(ActorID,3,'您在'..API_GetMapName(MapID)..'地图堆了一个雪人，请前往查看')
							end
						end
					end
				end
			else
				API_RemoveTaskScroll(ActorID,50001)
			end
		end
	end
end

--上线判断
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'MerryChristmas_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'MerryChristmas_OnLogin') 
end
--切换地图后判断
local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'MerryChristmas_OnLogin' then
		OnLoginMapLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'MerryChristmas_OnLogin') 
end

function MerryChristmas_JuanZhou() --卷轴内容
	local ActorID = API_RequestGetActorID()
	local ServerID = API_GetServerID()
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local PlayJF = API_VarDataGetNumber(ActorID,1,19015)
	local MapXueRen = API_VarDataGetNumber(ActorID,1,19016)
	local MapID2 = math.floor(MapXueRen/100)
	local XueRen = math.mod(MapXueRen,100)
	local StartTime = MerryChristmas_ActTime.StartTime
	local EndTime = MerryChristmas_ActTime.EndTime
	API_ResponseWrite('<name>雪人活动</name>')
	API_ResponseWrite('<win rect="620,320,320,310"></win>')
	API_ResponseWrite('<br><text size="14">  今天</text><text size="14" color="117,252,255"> '..StartTime..'：00--'..EndTime..'：00</text><text size="14"> 举行堆雪人活动。</text><br>')
	API_ResponseWrite('<br><a size="14" href="MerryChristmas_NPCChouJiang?1=4">  查看活动说明</a><br><br>')
	API_ResponseWrite('<br><text size="14">  您目前的雪人积分：</text><text size="14" color="255,0,255">'..PlayJF..' </text><text size="14">分。</text><br>')
	if XueRen == 0 then
		API_ResponseWrite('<br><text size="14">  您还没有自己的雪人噢，赶紧堆一个吧。</text><br>')
	else
		if XueRen == ServerID and MapConfigID == MapID2 then
			local x3,y3,m3
			for j in MerryChristmas_XueRenTable do
				if MerryChristmas_XueRenTable[j] ~= nil then
					if ActorID == MerryChristmas_XueRenTable[j].ZhuRenID then
						x3 = MerryChristmas_XueRenTable[j].x
						y3 = MerryChristmas_XueRenTable[j].y
						m3 = MerryChristmas_XueRenTable[j].m
						break
					end
				end
			end
			if x3 ~= nil and y3 ~= nil and m3 ~= nil then
				API_ResponseWrite('<br><text size="14">  您的雪人在</text><text size="14" color="117,252,255"> '..API_GetMapName(m3)..' '..API_TileToPixelX(m3,x3,y3)..','..API_TileToPixelY(m3,x3,y3)..'。</text><br>')
			else
				API_ResponseWrite('<br><text size="14">  您还没有自己的雪人噢，赶紧堆一个吧。</text><br>')
			end
		else
			if XueRen == 2 or XueRen == 3 or XueRen == 4 or XueRen == 5 or XueRen == 10 then
				API_ResponseWrite('<br><text size="14" color="117,252,255">  您的雪人在'..GLOBAL_Navigate_ServerID[XueRen].name..'的'..API_GetMapName(MapID2)..'地图。</text><br>')
			else
				API_ResponseWrite('<br><text size="14" color="117,252,255">  您的雪人在 '..API_GetMapName(MapID2)..'地图。</text><br>')
			end
		end
	end
	if MapConfigID == 10 or MapConfigID == 23 or MapConfigID == 98 or MapConfigID == 99 or MapConfigID == 101 then
		API_ResponseWrite('<br><br><a size="14" href="MerryChristmas_CreateNPC?1=1">  堆小雪人</a><br>')
		API_ResponseWrite('<br><a size="14" href="MerryChristmas_CreateNPC?1=2">  堆大雪人</a><br>')
		API_ResponseWrite('<br><a size="14">  关闭</a><br>')
	else
		API_ResponseWrite('<br><br><br><br><br><br><a size="14">  关闭</a><br>')
	end
end

function MerryChristmas_CreateNPC() --创建雪人
	local ActorID = API_RequestGetActorID()
	local ServerID = API_GetServerID()
	local XuanZe = API_RequestGetNumber(1)
	local Camp = API_GetActorCamp(ActorID)
	local ActorName = API_GetActorName(ActorID)
	local x,y = PublicFun_GetActorPosXY(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local PlayJF = API_VarDataGetNumber(ActorID,1,19015)
	local MapXueRen = API_VarDataGetNumber(ActorID,1,19016)
	local MapID2 = math.floor(MapXueRen/100)
	local XueRen = math.mod(MapXueRen,100)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local StartTime = MerryChristmas_ActTime.StartTime
	local EndTime = MerryChristmas_ActTime.EndTime
	local Time = os.time()
	local XiaoXueGuaiID = MerryChristmas_CreateXueRenMap[MapConfigID].XiaoXueGuaiID
	if XuanZe == 3 then --激活小雪人
		if MerryChristmas_XueRenTable[NPCFastID] == nil then
			return
		end
		local x2,y2 = PublicFun_GetMonsterPosXY(NPCFastID)
		if ActorID == MerryChristmas_XueRenTable[NPCFastID].ZhuRenID then
			if API_ActorCanAddGoods(ActorID,MerryChristmas_XueZhiLingGoodsID,1,0,0) ~= -1  then
				if MerryChristmas_XueRenTable[NPCFastID].ChengZhangDu >= 180 then
					if API_AddActorGoods(ActorID,MerryChristmas_XueZhiLingGoodsID,1,'激活小雪人获得1个雪之灵') then
						API_ActorSendMsg(ActorID,10,'激活小雪人获得1个雪之灵')
						MerryChristmas_XueRenTable[NPCFastID] = nil
						API_DestroyMonster(NPCFastID)
						for i = 1,3 do
							API_CreateMonster(MapID,XiaoXueGuaiID,x2,y2,5,0,-1)
						end
						API_VarDataSetNumber(ActorID,1,19016,0)
						--风向标
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						local Type = 2
						if GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] + 1
						end
					end
				else
					API_ResponseWrite('<text>雪人堆积度不够，无法激活。</text><br>')
					API_ResponseWrite('<br><br><a>确定</a><br>')
				end
			else
				API_ResponseWrite('<text>背包已满，无法激活雪人。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<text>不能激活别人的雪人。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
		return
	elseif XuanZe == 4 then --激活大雪人
		if MerryChristmas_XueRenTable[NPCFastID] == nil then
			return
		end
		if ActorID == MerryChristmas_XueRenTable[NPCFastID].ZhuRenID then
			if MerryChristmas_XueRenTable[NPCFastID].ChengZhangDu >= 1000 then
				API_VarDataSetNumber(ActorID,1,19015,PlayJF+MerryChristmas_JiHuoBigSnow)
				API_ActorSendMsg(ActorID,10,'激活大雪人获得 '..MerryChristmas_JiHuoBigSnow..'点 雪人积分')
				MerryChristmas_XueRenTable[NPCFastID].JH = 1
				--API_DestroyMonster(NPCFastID)
				API_VarDataSetNumber(ActorID,1,19016,0)
				--风向标
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 4
				if GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] + 1
				end
			else
				API_ResponseWrite('<text>雪人堆积度不够，无法激活。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<text>不能激活别人的雪人。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
		return
	end
	if Week ~= MerryChristmas_ActWeek1 and Week ~= MerryChristmas_ActWeek2 then
		return
	end
	if Hour < StartTime  then
		API_ResponseWrite('<text>雪人活动还未开始，现在还不能堆或激活雪人。</text><br>')
		API_ResponseWrite('<br><br><a>确定</a><br>')
		return
	elseif Hour >= EndTime then
		API_ResponseWrite('<text>雪人活动已经结束，非常感谢您的参与。</text><br>')
		API_ResponseWrite('<br><br><a>确定</a><br>')
		return
	end
	if MapConfigID ~= 10 and MapConfigID ~= 23 and MapConfigID ~= 98 and MapConfigID ~= 99 and MapConfigID ~= 101 then
		API_ResponseWrite('<text>只有在 珊瑚群岛、阳光雨林、娜沙湿地、月暮草场、落日农庄 五个地图才可以开始堆雪人。</text><br>')
		API_ResponseWrite('<br><br><a>确定</a><br>')
		return
	end
	if MerryChristmas_CreateXueRenMap[MapConfigID] == nil then
		API_ResponseWrite('<text>此地图不能堆雪人。</text><br>')
		API_ResponseWrite('<br><br><br><a>确定</a><br>')
		return
	end
	local PlayLV =API_GetActorExpLevel(ActorID)
	local MinLV = MerryChristmas_CreateXueRenMap[MapConfigID].MinLV
	local MaxLV = MerryChristmas_CreateXueRenMap[MapConfigID].MaxLV
	if XuanZe == 1 or XuanZe == 2 then
		if PlayLV < MinLV or PlayLV > MaxLV then
			API_ResponseWrite('<text>本地图只能由 '..MinLV..' 至 '..MaxLV..' 级别的玩家堆雪人，请您打开世界地图（按“M”键，再点击上方的“世界地图”按钮），到对应您级别的地图堆雪人，26级及以上玩家可在26至40级别的地图堆雪人。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
			return
		end
	end
	if XuanZe == 1 then --创建小雪人
		local IsBlock = 0
		local IsBlock2 = 0
		for i = x - 2 ,x + 2 do
			for j = y - 2 ,y + 2 do
				if API_IsBlockTile(MapID,i,j,0) and (i ~= x or j ~= y) then
					IsBlock = IsBlock + 1
				end
			end
		end
		for i = x - 1 ,x + 1 do
			for j = y - 1 ,y + 1 do
				if API_IsBlockTile(MapID,i,j,0) and (i ~= x or j ~= y) then
					IsBlock2 = IsBlock2 + 1
				end
			end
		end
		if IsBlock > 1 or IsBlock2 > 0 then
			API_ResponseWrite('<br><text>此处过于拥挤，请寻找更加开阔的区域再堆雪人。</text><br>')
			API_ResponseWrite('<br><br><a>我明白了</a><br>')
			return
		end 
		if XueRen == 0 then
			local FastID = API_CreateMonster(MapID,11728,x,y,5,0,-1)
			API_SetMonsterName(FastID,''..ActorName..'的',2)
			MerryChristmas_XueRenTable[FastID] = {
								ZhuRenID = ActorID,
								ZhuRenName = ActorName,
								ChengZhangDu = 0,
								DuiBai = '',
								JH = 0,
								x = x,
								y = y,
								m = MapConfigID,
								Time = Time,
								}
			API_ActorSendMsg(ActorID,3,'开始堆小雪人啦~')
			ServerID = MapConfigID * 100 + ServerID
			API_VarDataSetNumber(ActorID,1,19016,ServerID)
			--风向标
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type = 1
			if GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] + 1
			end
		else
			if XueRen == ServerID and MapConfigID == MapID2 then
				for j in MerryChristmas_XueRenTable do
					if MerryChristmas_XueRenTable[j] ~= nil then
						if API_GetMonsterID(j) <= 0 then
							MerryChristmas_XueRenTable[j] = nil
						end
					end
					if MerryChristmas_XueRenTable[j] ~= nil then
						if ActorID == MerryChristmas_XueRenTable[j].ZhuRenID then
							local x3 = MerryChristmas_XueRenTable[j].x
							local y3 = MerryChristmas_XueRenTable[j].y
							local m3 = MerryChristmas_XueRenTable[j].m
							API_ResponseWrite('<text>您在 '..API_GetMapName(m3)..' '..API_TileToPixelX(m3,x3,y3)..','..API_TileToPixelY(m3,x3,y3)..' 已经堆了一个雪人了，不可以同时堆多个雪人。</text><br>')
							API_ResponseWrite('<br><br><a>确定</a><br>')
							return
						end
					end
				end
				local FastID = API_CreateMonster(MapID,11728,x,y,5,0,-1)
				API_SetMonsterName(FastID,''..ActorName..'的',2)
				MerryChristmas_XueRenTable[FastID] = {
									ZhuRenID = ActorID,
									ZhuRenName = ActorName,
									ChengZhangDu = 0,
									DuiBai = '',
									JH = 0,
									x = x,
									y = y,
									m = MapConfigID,
									Time = Time,
									}
				API_ActorSendMsg(ActorID,3,'开始堆小雪人啦~')
				ServerID = MapConfigID * 100 + ServerID
				API_VarDataSetNumber(ActorID,1,19016,ServerID)
				--风向标
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 1
				if GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] + 1
				end
			else	
				if XueRen == 2 or XueRen == 3 or XueRen == 4 or XueRen == 5 or XueRen == 10 then
					API_ResponseWrite('<text>您在 '..GLOBAL_Navigate_ServerID[XueRen].name..'的'..API_GetMapName(MapID2)..'地图 已经拥有一个雪人了，不可以同时堆多个雪人。</text><br>')
					API_ResponseWrite('<br><br><a>确定</a><br>')
				else
					API_ResponseWrite('<text>您在 '..API_GetMapName(MapID2)..'地图 已经拥有一个雪人了，不可以同时堆多个雪人。</text><br>')
					API_ResponseWrite('<br><br><a>确定</a><br>')
				end
			end
		end
	elseif XuanZe == 2 then --创建大雪人
		local IsBlock = 0
		local IsBlock2 = 0
		for i = x - 2 ,x + 2 do
			for j = y - 2 ,y + 2 do
				if API_IsBlockTile(MapID,i,j,0) and (i ~= x or j ~= y) then
					IsBlock = IsBlock + 1
				end
			end
		end
		for i = x - 1 ,x + 1 do
			for j = y - 1 ,y + 1 do
				if API_IsBlockTile(MapID,i,j,0) and (i ~= x or j ~= y) then
					IsBlock2 = IsBlock2 + 1
				end
			end
		end
		if IsBlock > 1 or IsBlock2 > 0 then
			API_ResponseWrite('<br><text>此处过于拥挤，请寻找更加开阔的区域再堆雪人。</text><br>')
			API_ResponseWrite('<br><br><a>我明白了</a><br>')
			return
		end 
		if API_ActorGetGoodsNum(ActorID,MerryChristmas_XueZhiLingGoodsID) >= MerryChristmas_BigSnowXZLNum then
			if XueRen == 0 then
				if API_ActorRemoveGoods(ActorID,MerryChristmas_XueZhiLingGoodsID,MerryChristmas_BigSnowXZLNum,'删除'..MerryChristmas_BigSnowXZLNum..'个雪之灵') then
					local FastID = API_CreateMonster(MapID,11734,x,y,5,0,-1)
					API_SetMonsterName(FastID,''..ActorName..'的',2)
					MerryChristmas_XueRenTable[FastID] = {
										ZhuRenID = ActorID,
										ZhuRenName = ActorName,
										ChengZhangDu = 0,
										DuiBai = '',
										JH = 0,
										x = x,
										y = y,
										m = MapConfigID,
										Time = Time,
										}
					API_ActorSendMsg(ActorID,3,'开始堆大雪人啦~')
					ServerID = MapConfigID * 100 + ServerID
					API_VarDataSetNumber(ActorID,1,19016,ServerID)
					--风向标
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					local Type = 3
					if GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] + 1
					end
				end
			else
				if XueRen == ServerID then
					for j in MerryChristmas_XueRenTable do
						if MerryChristmas_XueRenTable[j] ~= nil then
							if API_GetMonsterID(j) <= 0 then
								MerryChristmas_XueRenTable[j] = nil
							end
						end
						if MerryChristmas_XueRenTable[j] ~= nil then
							if ActorID == MerryChristmas_XueRenTable[j].ZhuRenID then
								local x3 = MerryChristmas_XueRenTable[j].x
								local y3 = MerryChristmas_XueRenTable[j].y
								local m3 = MerryChristmas_XueRenTable[j].m
								API_ResponseWrite('<text>您在 '..API_GetMapName(m3)..' '..API_TileToPixelX(m3,x3,y3)..','..API_TileToPixelY(m3,x3,y3)..' 已经堆了一个雪人了，不可以同时堆多个雪人。</text><br>')
								API_ResponseWrite('<br><br><a>确定</a><br>')
								return
							end
						end
					end
					if API_ActorRemoveGoods(ActorID,MerryChristmas_XueZhiLingGoodsID,MerryChristmas_BigSnowXZLNum,'删除'..MerryChristmas_BigSnowXZLNum..'个雪之灵') then
						local FastID = API_CreateMonster(MapID,11734,x,y,5,0,-1)
						API_SetMonsterName(FastID,''..ActorName..'的',2)
						MerryChristmas_XueRenTable[FastID] = {
											ZhuRenID = ActorID,
											ZhuRenName = ActorName,
											ChengZhangDu = 0,
											DuiBai = '',
											JH = 0,
											x = x,
											y = y,
											m = MapConfigID,
											Time = Time,
											}
						API_ActorSendMsg(ActorID,3,'开始堆大雪人啦~')
						ServerID = MapConfigID * 100 + ServerID
						API_VarDataSetNumber(ActorID,1,19016,ServerID)
						--风向标
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						local Type = 3
						if GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] + 1
						end
					end
				else
					if XueRen == 2 or XueRen == 3 or XueRen == 4 or XueRen == 5 or XueRen == 10 then
						API_ResponseWrite('<text>您在 '..GLOBAL_Navigate_ServerID[XueRen].name..'的'..API_GetMapName(MapID2)..'地图 已经拥有一个雪人了，不可以同时堆多个雪人。</text><br>')
						API_ResponseWrite('<br><br><a>确定</a><br>')
					else
						API_ResponseWrite('<text>您在 '..API_GetMapName(MapID2)..'地图 已经拥有一个雪人了，不可以同时堆多个雪人。</text><br>')
						API_ResponseWrite('<br><br><a>确定</a><br>')
					end
				end
			end
		else
			API_ResponseWrite('<text>您身上没有 '..MerryChristmas_BigSnowXZLNum..' 个雪之灵，不可以堆大雪人。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	end
end

function MerryChristmas_DuiBai(ActorID) --雪人NPC对话文字
	local ActorID = ActorID or API_RequestGetActorID()
	local PlayJF = API_VarDataGetNumber(ActorID,1,19015)
	local NPCID = API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local LvUpExp = 0
	local GoodsID = 0
	local NextNPC = 0
	for i = 1,table.getn(MerryChristmas_NPCTable) do
		for j in MerryChristmas_NPCTable[i] do 
			if NPCID == j then
				LvUpExp = MerryChristmas_NPCTable[i][j].CZD
				GoodsID = MerryChristmas_NPCTable[i][j].NeedGoods
				NextNPC = MerryChristmas_NPCTable[i][j].NextNPC
			end
		end
	end
	if MerryChristmas_XueRenTable[NPCFastID] == nil then
		return
	end
	local MaxTime = 10800
	if NPCID == 11739 then
		MaxTime = 21600
	end
	local ZhuRenID = MerryChristmas_XueRenTable[NPCFastID].ZhuRenID
	local ZhuRenName =  MerryChristmas_XueRenTable[NPCFastID].ZhuRenName
	local ChengZhangDu = MerryChristmas_XueRenTable[NPCFastID].ChengZhangDu
	local DuiBai = MerryChristmas_XueRenTable[NPCFastID].DuiBai
	local Time = MerryChristmas_XueRenTable[NPCFastID].Time
	local Time2 = os.time()
	local Time3 = MaxTime - (Time2 - Time)
	if Time3 < 0 then
		MerryChristmas_XueRenTable[NPCFastID] = nil
		API_DestroyMonster(NPCFastID)
		API_ActorSendMsg(ActorID,10,'这个雪人已经融化了……')
		if API_ActorIsOnline(ZhuRenID) then
			API_ActorSendMsg(ZhuRenID,10,'你的雪人已经融化了……')
		end
		return
	end
	local Min = math.floor(Time3/60)
	local Sec = math.mod(Time3,60)
	local MaxExp = 0
	if NPCID == 11728 or NPCID == 11729 or NPCID == 11730 or NPCID == 11731 or NPCID == 11732 or NPCID == 11733 then
		MaxExp = 360
	elseif NPCID == 11734 or NPCID == 11735 or NPCID == 11736 or NPCID == 11737 or NPCID == 11738 or NPCID == 11739 then
		MaxExp = 1000
	end
	API_ResponseWrite('<name>'..API_GetMonsterNameByID(NPCID)..'</name>')
	API_ResponseWrite('<text>  我是</text><text color="117,252,255">'..ZhuRenName..'的'..API_GetMonsterNameByID(NPCID)..'</text><text>。</text>')
	if NPCID == 11728 or NPCID == 11729 or NPCID == 11730 or NPCID == 11731 or NPCID == 11732 or NPCID == 11734 or NPCID == 11735 or NPCID == 11736 or NPCID == 11737 or NPCID == 11738 then
		API_ResponseWrite('<text>现在已经拥有</text><text color="117,252,255">'..ChengZhangDu..'</text><text>点堆积度。</text>')
		API_ResponseWrite('<text>雪人完全堆成需要</text><text color="117,252,255">'..MaxExp..'</text><text>点堆积度。</text><br>')
		API_ResponseWrite('<br><text>  现阶段还需要堆 </text><text color="117,252,255">'..LvUpExp-ChengZhangDu..' 个'.. API_GetGoodsName(GoodsID)..' </text><text>才能进入下一阶段。</text><br>')
	elseif NPCID == 11733 or  NPCID == 11739 then
		API_ResponseWrite('<text>现在已经是一个完整的雪人了 ^_^ 。</text><br>')
	end
	API_ResponseWrite('<br><text>  您目前的雪人积分：</text><text color="255,0,255">'..PlayJF..' </text><text>分。</text><br>')
	if NPCID == 11728 or NPCID == 11729 or NPCID == 11730 or NPCID == 11731 or NPCID == 11732 or NPCID == 11734 or NPCID == 11735 or NPCID == 11736 or NPCID == 11737 or NPCID == 11738 then
		API_ResponseWrite('<br><text color="255,0,0">  再过 '..Min..' 分 '..Sec..' 秒，该雪人将融化，请尽快堆积。</text><br>')
		API_ResponseWrite('<br><a href="MerryChristmas_NPCLvUp?1=1">  往上堆'.. API_GetGoodsName(GoodsID)..'</a><text>      </text><a href="MerryChristmas_NPCLvUp?1=1&2=1">堆积我所有的'.. API_GetGoodsName(GoodsID)..'</a><br>')
	end
	if NPCID == 11739 then
		if ActorID == ZhuRenID then
			API_ResponseWrite('<br><text color="255,0,0">  再过 '..Min..' 分 '..Sec..' 秒，该雪人将融化，请尽快激活雪人。</text><br>')
			if string.len(DuiBai) == 0 then
				API_ResponseWrite('<br><a href="MerryChristmas_NPCLvUp?1=2">  主人留言</a><br>')
			else
				API_ResponseWrite('<br><text color="117,252,255">  您的留言：</text><text>'..DuiBai..'</text><br>')
				API_ResponseWrite('<br><a href="MerryChristmas_NPCLvUp?1=4">  修改留言</a><text>    修改留言需要使用3点雪人积分。</text><br>')
			end
			if MerryChristmas_XueRenTable[NPCFastID].JH == 0 then
				API_ResponseWrite('<br><a href="MerryChristmas_CreateNPC?1=4">  激活大雪人</a><br>')
			end
		else
			API_ResponseWrite('<br><text color="117,252,255">  主人留言：</text><text>'..DuiBai..'</text><br>')
		end
	elseif NPCID == 11733 then
		if ActorID == ZhuRenID then
			API_ResponseWrite('<br><text color="255,0,0">  再过 '..Min..' 分 '..Sec..' 秒，该雪人将融化，请尽快激活雪人。</text><br>')
			API_ResponseWrite('<br><a href="MerryChristmas_CreateNPC?1=3">  激活小雪人</a><br>')
		else
			API_ResponseWrite('<br>')
		end
	end
	API_ResponseWrite('<br><a href="MerryChristmas_NPCChouJiang?1=1">  雪人积分兑换奖励</a><br>')
	API_ResponseWrite('<br><a href="MerryChristmas_NPCLvUp?1=3">  移动到自己身边</a><br>')
	API_ResponseWrite('<br><a>  关闭        </a><br>')
	if ActorID < 200 then
		API_ResponseWrite('<br><a href="MerryChristmas_NPCLvUp?1=5">  摧毁雪人</a><br>')
	end
	API_ResponseFlush(ActorID)
end

function MerryChristmas_NPCLvUp() --堆雪人
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local ActorName = API_GetActorName(ActorID)
	local ServerID = API_GetServerID()
	local Camp = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local x,y = PublicFun_GetActorPosXY(ActorID)
	local PlayJF = API_VarDataGetNumber(ActorID,1,19015)
	local Time = API_VarDataGetNumber(ActorID,0,19017)
	local Time2 = API_VarDataGetNumber(ActorID,0,19018)
	local NPCID = API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local LvUpExp = 0
	local GoodsID = 0
	local NextNPC = 0
	for i = 1,table.getn(MerryChristmas_NPCTable) do
		for j in MerryChristmas_NPCTable[i] do 
			if NPCID == j then
				LvUpExp = MerryChristmas_NPCTable[i][j].CZD
				GoodsID = MerryChristmas_NPCTable[i][j].NeedGoods
				NextNPC = MerryChristmas_NPCTable[i][j].NextNPC
			end
		end
	end
	local GoodsName = ''
	if GoodsID > 0 then
		GoodsName = API_GetGoodsName(GoodsID)
	end
	if MerryChristmas_XueRenTable[NPCFastID] == nil then
		return
	end
	local x2,y2 = PublicFun_GetMonsterPosXY(NPCFastID)
	local ZhuRenID = MerryChristmas_XueRenTable[NPCFastID].ZhuRenID
	local ZhuRenName =  MerryChristmas_XueRenTable[NPCFastID].ZhuRenName
	local ChengZhangDu = MerryChristmas_XueRenTable[NPCFastID].ChengZhangDu
	local DuiBai = MerryChristmas_XueRenTable[NPCFastID].DuiBai
	local MapConfigID = MerryChristmas_XueRenTable[NPCFastID].m
	local Time3 = os.time()
	if XuanZe == 1 then
		if API_GetMonsterID(NPCFastID) > 0 then
			local GoodsNum = 1
			if API_RequestGetNumber(2) == 1 then
				GoodsNum = API_ActorGetGoodsNum(ActorID,GoodsID)
				if GoodsNum + ChengZhangDu > LvUpExp then
					GoodsNum = LvUpExp - ChengZhangDu
				end
			end
			if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 then
				if API_ActorRemoveGoods(ActorID,GoodsID,GoodsNum,'堆雪人消耗'..GoodsNum..'个'.. API_GetGoodsName(GoodsID)..'') then
					if ActorID == ZhuRenID then
						API_VarDataSetNumber(ActorID,1,19015,PlayJF+GoodsNum)
						MerryChristmas_XueRenTable[NPCFastID].ChengZhangDu = ChengZhangDu + GoodsNum
						ChengZhangDu = MerryChristmas_XueRenTable[NPCFastID].ChengZhangDu 
						API_ActorSendMsg(ActorID,10,'您为您的雪人增加'..GoodsNum..'点堆积度，获得'..GoodsNum..'点雪人积分')
						if ChengZhangDu < LvUpExp then
							MerryChristmas_DuiBai(ActorID)
						end
					else
						API_VarDataSetNumber(ActorID,1,19015,PlayJF+GoodsNum)
						MerryChristmas_XueRenTable[NPCFastID].ChengZhangDu = ChengZhangDu + GoodsNum
						ChengZhangDu = MerryChristmas_XueRenTable[NPCFastID].ChengZhangDu 
						if API_ActorIsOnline(ZhuRenID) then
							API_ActorSendMsg(ZhuRenID,10,''..API_GetActorName(ActorID)..'为您的雪人增加'..GoodsNum..'点堆积度')
						end
						API_ActorSendMsg(ActorID,10,'您为'..ZhuRenName..'的雪人增加'..GoodsNum..'点堆积度，获得'..GoodsNum..'点雪人积分')
						if ChengZhangDu < LvUpExp then
							MerryChristmas_DuiBai(ActorID)
						end
					end
				else
					return
				end
			else
				API_ResponseWrite('<text>堆雪人需要1个'..GoodsName..'，您身上没有'..GoodsName..'，不能堆积雪人。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
				return
			end
		else
			API_ResponseWrite('<text>雪人不存在，请重新选择雪人。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
			return
		end
		if ChengZhangDu >= LvUpExp then
			API_DestroyMonster(NPCFastID)
			MerryChristmas_XueRenTable[NPCFastID] = nil
			local FastID = API_CreateMonster(MapID,NextNPC,x2,y2,5,0,-1)
			API_SetMonsterName(FastID,''..ZhuRenName..'的',2)
			MerryChristmas_XueRenTable[FastID] = {
								ZhuRenID = ZhuRenID,
								ZhuRenName = ZhuRenName,
								ChengZhangDu = ChengZhangDu,
								DuiBai = '',
								JH = 0,
								x = x2,
								y = y2,
								m = MapConfigID,
								Time = Time3,
								}
		end
	elseif XuanZe == 2 then
		if ActorID == ZhuRenID then
			API_ResponseWrite('<text> 请输入您的留言：（最多可输入五十个字）</text><br>')
			API_ResponseWrite('<input type="string" name="3" bFilter="1" size="100" width="350"><br>')
			API_ResponseWrite('<br><a href="MerryChristmas_LiuYan?1=1"> 确定留言</a><br>')
			API_ResponseWrite('<br><a> 关闭</a><br>')
		else
			API_ResponseWrite('<br><text>  主人留言：'..DuiBai..'</text><br>')
			API_ResponseWrite('<br><br><a>  关闭</a><br>')
		end
	elseif XuanZe == 3 then
		local IsBlock = 0
		local IsBlock2 = 0
		for i = x - 2 ,x + 2 do
			for j = y - 2 ,y + 2 do
				if API_IsBlockTile(MapID,i,j,0) and (i ~= x or j ~= y) then
					IsBlock = IsBlock + 1
				end
			end
		end
		for i = x - 1 ,x + 1 do
			for j = y - 1 ,y + 1 do
				if API_IsBlockTile(MapID,i,j,0) and (i ~= x or j ~= y) then
					IsBlock2 = IsBlock2 + 1
				end
			end
		end
		if IsBlock > 1 or IsBlock2 > 0 then
			API_ResponseWrite('<br><text>您所在位置过于拥挤，请寻找更加开阔的区域再移动雪人。</text><br>')
			API_ResponseWrite('<br><a>我明白了</a><br>')
			return
		end 
		if API_GetMonsterID(NPCFastID) > 0 then
			if PublicFun_AccountDistance(x,y,x2,y2) < 10 then
				if Time2 == 0 then
					API_VarDataSetNumber(ActorID,0,19018,20)
					API_CreateTimerTrigger(ActorID,1,20,-1,'MerryChristmas_SnowMoveTrigger')
					API_MonsterMoveTo(NPCFastID,1,{x,y,1})
					API_ActorSendMsg(ActorID,10,'移动雪人成功')
					MerryChristmas_XueRenTable[NPCFastID].x = x
					MerryChristmas_XueRenTable[NPCFastID].y = y
				else
					API_ResponseWrite('<text>每次移动雪人的间隔为20秒，您还需要'..Time2..'秒才可以移动雪人。</text><br>')
					API_ResponseWrite('<br><br><a>确定</a><br>')
				end
			else
				API_ResponseWrite('<text>距离太远，无法移动雪人。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<text>雪人不存在，请重新选择雪人。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	elseif XuanZe == 4 then
		if PlayJF >= MerryChristmas_LiuYanKouJiFen then
			if ActorID == ZhuRenID then
				API_ResponseWrite('<text> 请输入您的留言：（最多可输入五十个字）</text><br>')
				API_ResponseWrite('<input type="string" name="3" bFilter="1" size="100" width="350"><br>')
				API_ResponseWrite('<br><a href="MerryChristmas_LiuYan?1=2"> 确定留言</a><br>')
				API_ResponseWrite('<br><a> 关闭</a><br>')
			else
				API_ResponseWrite('<br><text>  主人留言：'..DuiBai..'</text><br>')
				API_ResponseWrite('<br><br><a>  关闭</a><br>')
			end
		else
			API_ResponseWrite('<text>您的积分不够，不能修改留言。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	elseif XuanZe == 5 then
		if API_GetMonsterID(NPCFastID) > 0 then
			API_DestroyMonster(NPCFastID)
			MerryChristmas_XueRenTable[NPCFastID] = nil
			API_ActorSendMsg(ActorID,10,'摧毁雪人成功')
		end
	end
end

function MerryChristmas_LiuYan() --大雪人留言
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local LiuYan = API_RequestGetString(3)
	local PlayJF = API_VarDataGetNumber(ActorID,1,19015)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	if MerryChristmas_XueRenTable[NPCFastID] == nil then
		return
	end
	if XuanZe == 1 then
		MerryChristmas_XueRenTable[NPCFastID].DuiBai = LiuYan
		API_ActorSendMsg(ActorID,3,'留言成功')
	elseif XuanZe == 2 then
		if PlayJF >= MerryChristmas_LiuYanKouJiFen then
			API_VarDataSetNumber(ActorID,1,19015,PlayJF-MerryChristmas_LiuYanKouJiFen)
			MerryChristmas_XueRenTable[NPCFastID].DuiBai = LiuYan
			API_ActorSendMsg(ActorID,3,'留言成功，扣除'..MerryChristmas_LiuYanKouJiFen..'雪人积分')
		end
	end
end

function MerryChristmas_PlayTimerTrigger(ActorID,b) --堆雪人时间回调
	local Time = API_VarDataGetNumber(ActorID,0,19017)
	Time = Time - 1
	API_VarDataSetNumber(ActorID,0,19017,Time)
end

function MerryChristmas_SnowMoveTrigger(ActorID,b) --移动雪人时间回调
	local Time = API_VarDataGetNumber(ActorID,0,19018)
	Time = Time - 1
	API_VarDataSetNumber(ActorID,0,19018,Time)
end

function MerryChristmas_NPCChouJiang()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local PlayLV = API_GetActorExpLevel(ActorID)
	local PlayMoney = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD)
	local PackageSize = API_ActorGetPackageSize(ActorID)
	local PlayJF = API_VarDataGetNumber(ActorID,1,19015)
	local StartTime = MerryChristmas_ActTime.StartTime
	local EndTime = MerryChristmas_ActTime.EndTime
	local Camp = API_GetActorCamp(ActorID)
	if XuanZe == 1 then
		local JiangLiGoodsTable = {}
		local PanDuan = 0 
		for j in MerryChristmas_GooDsTable do
			local MinLV = MerryChristmas_GooDsTable[j].MinLV
			local MaxLV = MerryChristmas_GooDsTable[j].MaxLV
			if PlayLV >= MinLV and PlayLV <= MaxLV then
				JiangLiGoodsTable = MerryChristmas_GooDsTable[j].Goodslist
				PanDuan = 1
			end
		end
		if PanDuan == 0 then
			API_ActorSendMsg(ActorID,3,'很抱歉，目前没有合适您等级的奖励')
			return
		end
		local JiangLiTable = {}
		local JiangLiTableGaiLv = math.random(100)
		for j in JiangLiGoodsTable do 
			local Min = JiangLiGoodsTable[j].Min
			local Max = JiangLiGoodsTable[j].Max
			if JiangLiTableGaiLv >= Min and JiangLiTableGaiLv <= Max then
				JiangLiTable = JiangLiGoodsTable[j].Goodslist
				break
			end
		end
		if PlayJF >= MerryChristmas_DuiHuanJiangLi then
			if PackageSize >= 1 then
				API_VarDataSetNumber(ActorID,1,19015,PlayJF-MerryChristmas_DuiHuanJiangLi)
				local PlayJF2 = API_VarDataGetNumber(ActorID,1,19015)
				if PlayJF2 == PlayJF - MerryChristmas_DuiHuanJiangLi then
					local GaiLv = math.random(10000000)
					for j in JiangLiTable do
						local GaiLv1 = JiangLiTable[j].GaiLv1
						local GaiLv2 = JiangLiTable[j].GaiLv2
						if GaiLv >= GaiLv1 and GaiLv <= GaiLv2 then
							local GoodsID = JiangLiTable[j].GoodsID
							local GoodsNum = 0
							local NumGaiLv = JiangLiTable[j].NumGaiLv
							local NumMax = JiangLiTable[j].NumMax
							local NumMin = JiangLiTable[j].NumMin
							local NumRandom = math.random(10000)
							if NumRandom <= NumGaiLv then
								GoodsNum = NumMax
							else
								GoodsNum = NumMin
							end
							if GoodsNum > 0 then
								API_AddActorGoods(ActorID,GoodsID,GoodsNum,'兑换礼物获得 1个 '.. API_GetGoodsName(GoodsID)..'')
								API_ActorSendMsg(ActorID,7,'消耗 '..MerryChristmas_DuiHuanJiangLi..'点 雪人积分兑换奖励获得：'..API_GetGoodsName(GoodsID)..' × '..GoodsNum..'')
								API_ResponseWrite('<text>消耗 '..MerryChristmas_DuiHuanJiangLi..'点 雪人积分兑换奖励获得：</text>')
								API_ResponseWrite('<img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'">')
								API_ResponseWrite('<text> × '..GoodsNum..'</text><br>')
								API_ResponseWrite('<br><a href="MerryChristmas_NPCChouJiang?1=1">继续兑换</a><br>')
								--API_ResponseWrite('<br><br><a href="MerryChristmas_NPCJiangLi_Title">返回</a><br>')
								API_ResponseWrite('<br><br><a>关闭</a><br>')
								--风向标
								local LaiYuan = API_ActorGetPropNum(ActorID,201)
								local Type = 6
								if GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] + 1
								end
							else
								local AddGX = MerryChristmas_JingYanTable[PlayLV]
								local ExploitL = API_GetActorExpLevel(ActorID)
								local expMax = API_GetExploitInfo(ExploitL,3)
								local expNow = API_GetActorCurExp(ActorID)
								local expAddMax = expMax - expNow
								if expAddMax >= AddGX then
									API_ActorAddExp(ActorID,AddGX,0,'雪精灵兑换得'..AddGX..'经验')
									API_ActorSendMsg(ActorID,7,'消耗 '..MerryChristmas_DuiHuanJiangLi..'点 雪人积分兑换奖励获得：经验 × '..AddGX..'')
									API_ResponseWrite('<text>消耗 '..MerryChristmas_DuiHuanJiangLi..'点 雪人积分兑换奖励获得：</text>')
									API_ResponseWrite('<img srcgd="'..Pub_VarExpGoodsID..'" tipgd="'..Pub_VarExpGoodsID..'" >')
									API_ResponseWrite('<text> × '..AddGX..'</text><br>')
									API_ResponseWrite('<br><a href="MerryChristmas_NPCChouJiang?1=1">继续兑换</a><br>')
									--API_ResponseWrite('<br><br><a href="MerryChristmas_NPCJiangLi_Title">返回</a><br>')
									API_ResponseWrite('<br><br><a>关闭</a><br>')
								elseif expAddMax == 0 then
									API_ActorSendMsg(ActorID,7,'消耗 '..MerryChristmas_DuiHuanJiangLi..'点 雪人积分兑换奖励：您的经验达到上限，已无法再获得经验，清尽快升级')
									API_ResponseWrite('<text>消耗 '..MerryChristmas_DuiHuanJiangLi..'点 雪人积分兑换奖励获得：</text>')
									API_ResponseWrite('<img srcgd="'..Pub_VarExpGoodsID..'" tipgd="'..Pub_VarExpGoodsID..'" >')
									API_ResponseWrite('<text> × 0 </text><br>')
									API_ResponseWrite('<br><text>您的经验达到上限，已无法再获得经验，清尽快升级</text><br>')
									API_ResponseWrite('<br><a href="MerryChristmas_NPCChouJiang?1=1">继续兑换</a><br>')
									--API_ResponseWrite('<br><br><a href="MerryChristmas_NPCJiangLi_Title">返回</a><br>')
									API_ResponseWrite('<br><br><a>关闭</a><br>')
								else
									API_ActorAddExp(ActorID,expAddMax,0,'雪精灵兑换得'..expAddMax..'经验')
									API_ActorSendMsg(ActorID,7,'消耗 '..MerryChristmas_DuiHuanJiangLi..'点 雪人积分兑换奖励获得：经验 × '..expAddMax..'')
									API_ResponseWrite('<text>消耗 '..MerryChristmas_DuiHuanJiangLi..'点 雪人积分兑换奖励获得：</text>')
									API_ResponseWrite('<img srcgd="'..Pub_VarExpGoodsID..'" tipgd="'..Pub_VarExpGoodsID..'" >')
									API_ResponseWrite('<text> × '..expAddMax..'</text><br>')
									API_ResponseWrite('<br><a href="MerryChristmas_NPCChouJiang?1=1">继续兑换</a><br>')
									--API_ResponseWrite('<br><br><a href="MerryChristmas_NPCJiangLi_Title">返回</a><br>')
									API_ResponseWrite('<br><br><a>关闭</a><br>')
								end
								--风向标
								local LaiYuan = API_ActorGetPropNum(ActorID,201)
								local Type = 7
								if GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] + 1
								end
							end
						end
					end
					--风向标
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					local Type = 5
					if GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[17][Type][LaiYuan] + 1
					end
				end
			else
				API_ResponseWrite('<text>您的背包已满，无法兑换奖励。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<text>您的雪人积分不够，无法兑换奖励。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	elseif XuanZe == 2 then
		API_ResponseWrite('<name>雪人活动</name>')
		API_ResponseWrite('<win rect="80,390,830,255"></win>')
		API_ResponseWrite('<br><text color="117,252,255">  本周六和周日的 '..StartTime..'：00--'..EndTime..'：00</text><text> 举行雪人活动。</text><br>')
		API_ResponseWrite('<br><text>  活动开始后，将在</text><text color="117,252,255">珊瑚群岛、阳光雨林、娜沙湿地、月暮草场、落日农庄</text><text>出现大量的</text>')
		API_ResponseWrite('<text color="117,252,255">小雪怪和小雪堆</text><text>，杀死小雪怪或打开小雪堆将获得堆雪人的必须物品：</text><text color="117,252,255">小雪块、雪人帽子、雪人围巾、雪人扫帚和雪人灵魂。</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  在活动地图中点击雪人卷轴下方的按钮即可开始堆雪人</text><text>。请注意：只能在</text><text color="117,252,255">珊瑚群岛、阳光雨林、娜沙湿地、月暮草场、落日农庄</text><text>五个地图堆雪人。</text><br>')
		API_ResponseWrite('<br><text>  堆雪人的过程中，每堆积一个材料将会获得</text><text color="117,252,255"> 1点 雪人积分</text><text>，通过雪人积分可在我这里兑换礼物（包括各种制造配方、道具、魔盒等）。</text><br>')
		API_ResponseWrite('<br><text>  每激活一个堆好的小雪人还将额外获得1个</text><text color="117,252,255">雪之灵</text><text>，收集'..MerryChristmas_BigSnowXZLNum..'个雪之灵，就可以开始堆积大雪人了。激活大雪人将获得</text><text color="117,252,255">'..MerryChristmas_JiHuoBigSnow..'点雪人积分。</text><br>')
		API_ResponseWrite('<br><a href="MerryChristmas_NPCJiangLi_Title">  返回</a><br>')
	elseif XuanZe == 3 then
		if PlayJF >= 200 then
			if PackageSize >= 1 then
				API_VarDataSetNumber(ActorID,1,19015,PlayJF-200)
				local PlayJF2 = API_VarDataGetNumber(ActorID,1,19015)
				if PlayJF2 == PlayJF - 200 then
					API_AddActorGoods(ActorID,11006,1,'兑换圣诞帽')
					API_ResponseWrite('<text>消耗 200点 雪人积分获得：</text>')
					API_ResponseWrite('<img srcgd="11006" tipgd="11006">')
					API_ResponseWrite('<text> × 1</text><br>')
					API_ResponseWrite('<br><br><a href="MerryChristmas_NPCJiangLi_Title">返回</a><br>')
				end
			else
				API_ResponseWrite('<text>您的背包已满，无法兑换礼物。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<text>您的雪人积分不够，无法兑换礼物。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	elseif XuanZe == 4 then
		local x,y
		if Camp == 0 then
			x,y = 59,149
		elseif Camp == 1 then
			x,y = 55,188
		end
		API_ResponseWrite('<name>雪人活动</name>')
		API_ResponseWrite('<win rect="80,390,830,255"></win>')
		API_ResponseWrite('<br><text color="117,252,255">  本周六和周日的 '..StartTime..'：00--'..EndTime..'：00</text><text> 举行雪人活动。</text><br>')
		API_ResponseWrite('<br><text>  活动开始后，将在</text><text color="117,252,255">珊瑚群岛、阳光雨林、娜沙湿地、月暮草场、落日农庄</text><text>出现大量的</text>')
		API_ResponseWrite('<text color="117,252,255">小雪怪和小雪堆</text><text>，杀死小雪怪或打开小雪堆将获得堆雪人的必须物品：</text><text color="117,252,255">小雪块、雪人帽子、雪人围巾、雪人扫帚和雪人灵魂。</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  在活动地图中点击雪人卷轴下方的按钮即可开始堆雪人</text><text>。请注意：只能在</text><text color="117,252,255">珊瑚群岛、阳光雨林、娜沙湿地、月暮草场、落日农庄</text><text>五个地图堆雪人。</text><br>')
		API_ResponseWrite('<br><text>  堆雪人的过程中，每堆积一个材料将会获得</text><text color="117,252,255"> 1点 雪人积分</text><text>，通过雪人积分可在</text><text color="117,252,255">玩家堆积的雪人</text><text>处兑换礼物（包括各种制造配方、道具、魔盒等）。</text><br>')
		API_ResponseWrite('<br><text>  每激活一个堆好的小雪人还将额外获得1个</text><text color="117,252,255">雪之灵</text><text>，收集'..MerryChristmas_BigSnowXZLNum..'个雪之灵，就可以开始堆积大雪人了。激活大雪人将获得</text><text color="117,252,255">'..MerryChristmas_JiHuoBigSnow..'点雪人积分。</text><br>')
		API_ResponseWrite('<br><a>  确定</a><br>')
	end
end					

function MerryChristmas_NPCJiangLi_Title(ActorID,NPCID) --雪精灵对话
	local ActorID = ActorID or API_RequestGetActorID()
	local PlayJF = API_VarDataGetNumber(ActorID,1,19015)
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Week == 6 or Week == 7 or Week == 1 then
		API_ResponseWrite('<name>雪人活动</name>')
		API_ResponseWrite('<br><text size="14">  我是堆雪人活动的大使雪精灵，如果您有雪人积分的话可以使用雪人积分在我这里兑换各种礼物哦。</text><br>')
		API_ResponseWrite('<br><text size="14">  每兑换一次礼物将消耗 </text><text size="14" color="117,252,255">'..MerryChristmas_DuiHuanJiangLi..'点</text><text size="14"> 雪人积分。</text><br><br>') --<text size="14">兑换圣诞帽需消耗</text><text size="14" color="117,252,255"> 200点 </text><text size="14"> 雪人积分。</text><br><br>')
		API_ResponseWrite('<br><text size="14">  您目前的雪人积分：</text><text size="14" color="255,0,255">'..PlayJF..' </text><text size="14">分。</text><br><br>')
		API_ResponseWrite('<br><a href="MerryChristmas_NPCChouJiang?1=1">  兑换奖励</a><text>          </text>')
		--API_ResponseWrite('<a href="MerryChristmas_NPCChouJiang?1=3">  兑换圣诞帽</a><text>          </text>')
		API_ResponseWrite('<a href="MerryChristmas_NPCChouJiang?1=2">  活动介绍</a><text>          </text>')
		API_ResponseWrite('<a>  关闭</a><br>')
		API_ResponseFlush(ActorID)
	else
		if API_GetMonsterID(FastID) == 11740 then
			API_DestroyMonster(FastID)
		end
		API_ActorSendMsg(ActorID,10,'雪精灵已经消失了……')
		API_ResponseEnd()
		API_ResponseClear()
	end
end

function MerryChristmas_ClearVarData(ActorID)
	API_VarDataSetNumber(ActorID,1,19016,0)
end
