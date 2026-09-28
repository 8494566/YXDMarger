----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\FightForTreasureBox.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2009-3-9
--版  本:	1.0
--描  述:	每日活动：宝箱争夺
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：万钰林
--日期：2009-3-9
--功能：创建
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--19038 存储打开大宝箱的次数
--19039 存储打开小宝箱的次数
--19061 存储打开小宝箱的年月日

--261,204 阳光雨林 82,179
--237,240 珊瑚群岛 89,149
--436,445 月暮草场 179,258

--设置活动时间表
--大宝箱ID、FASTID、坐标、方位表
--刷宝箱：大、小、怪物，中心点是大宝箱
--点击大宝箱回调计时条，物品掉落，物品表，拾取权限

--怪物分两次刷，先预热，第三次刷大宝箱，刷完后启动一次回调
--玩家开了大宝箱后世界通告

FightForTreasureBox_BigBoxGoodsNum = 200 --大箱子出物品数量
FightForTreasureBox_KouChuHuoLiZhi = 4 --每次探宝扣除活力值数量
FightForTreasureBox_OpenBoxTime = 60 --打开大箱子的时间
FightForTreasureBox_TimerTriggerG = 300 --触发器时间回调
FightForTreasureBox_OpenBoxNum = 20


FightForTreasureBox_ActTime = {
			[1] = {RedayTime=14,StartTime=15,EndTime=16},
}

FightForTreasureBox_PKMapID = {
			[23] = {1,2,3},
			[10] = {1,2,3},
}

if FightForTreasureBox_BoxTable == nil then
FightForTreasureBox_BoxTable = {
			--[[[1] = {MapID=23,BoxID=11938,BoxFastID=0,BoxX=0,BoxY=0,BoxD=0,BoxNum=0,BoxMaxNum=2,XiaoBoxID=88038,XiaoBoxNum=300,JinDu=0,
				Monster1ID=726206,Monster1Num=45,
				Monster2ID=726205,Monster2Num=800,
				BoxTile = {
					{299,85,0},
					{356,183,0},
					{290,222,0},
					},
				},
			[2] = {MapID=10,BoxID=11938,BoxFastID=0,BoxX=0,BoxY=0,BoxD=0,BoxNum=0,BoxMaxNum=2,XiaoBoxID=88038,XiaoBoxNum=300,JinDu=0,
				Monster1ID=726206,Monster1Num=45,
				Monster2ID=726205,Monster2Num=800,
				BoxTile = {
					{237,240,0},
					{295,256,0},
					{310,134,0},
					},
				},]]
			[1] = {MapID=101,BoxID=11939,BoxFastID=0,BoxX=0,BoxY=0,BoxD=0,BoxNum=0,BoxMaxNum=4,XiaoBoxID=88039,XiaoBoxNum=300,JinDu=0,
				Monster1ID=726208,Monster1Num=45,
				Monster2ID=726207,Monster2Num=800,
				BoxTile = {
					{447,443,3},
					{414,305,0},
					{543,493,0},
					},
				},
			--伯爵箱子ID 11940  小箱子ID  88040  PT怪ID 726209 JY怪ID 726210
}
end

FightForTreasureBox_PlayOpenLvTable = {
			[11938] = {Min=11,Max=25},
			[11939] = {Min=26,Max=65},
}

FightForTreasureBox_PlayGongXunNum = {
		[2] = {Min=1042,Max=1934}, --男爵
		[3] = {Min=1042,Max=1934}, --高男
		[4] = {Min=4603,Max=8548}, --子爵
		[5] = {Min=4603,Max=8548}, --高子
		[6] = {Min=9021,Max=16754}, --伯爵
		[7] = {Min=9021,Max=16754}, --高伯
		[8] = {Min=11963,Max=22218}, --侯爵
		[9] = {Min=11963,Max=22218}, --高侯
}

FightForTreasureBox_XiaoBoxGoodsTable = {[88038]=11938,[88039]=11939,[88040]=11940}

FightForTreasureBox_BoxGoodsTable = {
	[11938] =  {
			--男低
			{Min=1,Max=70,
				Goodslist = {
						{GoodsID=80049,GaiLv1=1,GaiLv2=333333,NumGaiLv=10000,NumMax=3,NumMin=2},
						{GoodsID=80065,GaiLv1=333334,GaiLv2=666667,NumGaiLv=10000,NumMax=3,NumMin=2},
						{GoodsID=80065,GaiLv1=666668,GaiLv2=1000001,NumGaiLv=10000,NumMax=3,NumMin=2},
						{GoodsID=80065,GaiLv1=1000002,GaiLv2=1333335,NumGaiLv=10000,NumMax=3,NumMin=2},
						{GoodsID=80065,GaiLv1=1333336,GaiLv2=1666669,NumGaiLv=10000,NumMax=3,NumMin=2},
						{GoodsID=80065,GaiLv1=1666670,GaiLv2=2000003,NumGaiLv=10000,NumMax=3,NumMin=2},
						{GoodsID=80065,GaiLv1=2000004,GaiLv2=2333337,NumGaiLv=10000,NumMax=3,NumMin=2},
						{GoodsID=80065,GaiLv1=2333338,GaiLv2=2666671,NumGaiLv=10000,NumMax=3,NumMin=2},
						{GoodsID=80397,GaiLv1=2666672,GaiLv2=3000005,NumGaiLv=300,NumMax=1,NumMin=0},
						{GoodsID=80383,GaiLv1=3000006,GaiLv2=3333339,NumGaiLv=60,NumMax=1,NumMin=0},
						{GoodsID=80383,GaiLv1=3333340,GaiLv2=3666673,NumGaiLv=60,NumMax=1,NumMin=0},
						{GoodsID=80383,GaiLv1=3666674,GaiLv2=4000007,NumGaiLv=60,NumMax=1,NumMin=0},
						{GoodsID=80383,GaiLv1=4000008,GaiLv2=4333341,NumGaiLv=60,NumMax=1,NumMin=0},
						{GoodsID=80383,GaiLv1=4333342,GaiLv2=4666675,NumGaiLv=60,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=4666676,GaiLv2=5000009,NumGaiLv=187,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=5000010,GaiLv2=5333343,NumGaiLv=187,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=5333344,GaiLv2=5666677,NumGaiLv=187,NumMax=1,NumMin=0},
						{GoodsID=80191,GaiLv1=5666678,GaiLv2=6000011,NumGaiLv=1928,NumMax=1,NumMin=0},
						{GoodsID=587,GaiLv1=6000012,GaiLv2=6333345,NumGaiLv=15,NumMax=1,NumMin=0},
						{GoodsID=80191,GaiLv1=6333346,GaiLv2=6666679,NumGaiLv=1928,NumMax=1,NumMin=0},
						{GoodsID=587,GaiLv1=6666680,GaiLv2=7000013,NumGaiLv=15,NumMax=1,NumMin=0},
						{GoodsID=80191,GaiLv1=7000014,GaiLv2=7333347,NumGaiLv=1928,NumMax=1,NumMin=0},
						{GoodsID=587,GaiLv1=7333348,GaiLv2=7666681,NumGaiLv=15,NumMax=1,NumMin=0},
						{GoodsID=784,GaiLv1=7666682,GaiLv2=8000015,NumGaiLv=4,NumMax=1,NumMin=0},
						{GoodsID=784,GaiLv1=8000016,GaiLv2=8333349,NumGaiLv=4,NumMax=1,NumMin=0},
						{GoodsID=784,GaiLv1=8333350,GaiLv2=8666683,NumGaiLv=4,NumMax=1,NumMin=0},
						{GoodsID=784,GaiLv1=8666684,GaiLv2=9000017,NumGaiLv=4,NumMax=1,NumMin=0},
						{GoodsID=784,GaiLv1=9000018,GaiLv2=9333351,NumGaiLv=4,NumMax=1,NumMin=0},
						{GoodsID=501,GaiLv1=9333352,GaiLv2=9666685,NumGaiLv=7142,NumMax=2,NumMin=1},
						{GoodsID=80274,GaiLv1=9666686,GaiLv2=10000000,NumGaiLv=150,NumMax=1,NumMin=0},
						},
				},
			--男中
			{Min=71,Max=95,
				Goodslist = {
						{GoodsID=80397,GaiLv1=1,GaiLv2=370371,NumGaiLv=1644,NumMax=4,NumMin=3},
						{GoodsID=553,GaiLv1=370372,GaiLv2=740742,NumGaiLv=16,NumMax=1,NumMin=0},
						{GoodsID=80383,GaiLv1=740743,GaiLv2=1111113,NumGaiLv=6328,NumMax=1,NumMin=0},
						{GoodsID=570,GaiLv1=1111114,GaiLv2=1481484,NumGaiLv=6,NumMax=1,NumMin=0},
						{GoodsID=80383,GaiLv1=1481485,GaiLv2=1851855,NumGaiLv=6328,NumMax=1,NumMin=0},
						{GoodsID=570,GaiLv1=1851856,GaiLv2=2222226,NumGaiLv=6,NumMax=1,NumMin=0},
						{GoodsID=80383,GaiLv1=2222227,GaiLv2=2592597,NumGaiLv=6328,NumMax=1,NumMin=0},
						{GoodsID=570,GaiLv1=2592598,GaiLv2=2962968,NumGaiLv=6,NumMax=1,NumMin=0},
						{GoodsID=80383,GaiLv1=2962969,GaiLv2=3333339,NumGaiLv=6328,NumMax=1,NumMin=0},
						{GoodsID=570,GaiLv1=3333340,GaiLv2=3703710,NumGaiLv=6,NumMax=1,NumMin=0},
						{GoodsID=80383,GaiLv1=3703711,GaiLv2=4074081,NumGaiLv=6328,NumMax=1,NumMin=0},
						{GoodsID=570,GaiLv1=4074082,GaiLv2=4444452,NumGaiLv=6,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=4444453,GaiLv2=4814823,NumGaiLv=9777,NumMax=2,NumMin=1},
						{GoodsID=572,GaiLv1=4814824,GaiLv2=5185194,NumGaiLv=18,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=5185195,GaiLv2=5555565,NumGaiLv=9777,NumMax=2,NumMin=1},
						{GoodsID=572,GaiLv1=5555566,GaiLv2=5925936,NumGaiLv=18,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=5925937,GaiLv2=6296307,NumGaiLv=9777,NumMax=2,NumMin=1},
						{GoodsID=572,GaiLv1=6296308,GaiLv2=6666678,NumGaiLv=18,NumMax=1,NumMin=0},
						{GoodsID=587,GaiLv1=6666679,GaiLv2=7037049,NumGaiLv=1582,NumMax=1,NumMin=0},
						{GoodsID=587,GaiLv1=7037050,GaiLv2=7407420,NumGaiLv=1582,NumMax=1,NumMin=0},
						{GoodsID=587,GaiLv1=7407421,GaiLv2=7777791,NumGaiLv=1582,NumMax=1,NumMin=0},
						{GoodsID=784,GaiLv1=7777792,GaiLv2=8148162,NumGaiLv=474,NumMax=1,NumMin=0},
						{GoodsID=784,GaiLv1=8148163,GaiLv2=8518533,NumGaiLv=474,NumMax=1,NumMin=0},
						{GoodsID=784,GaiLv1=8518534,GaiLv2=8888904,NumGaiLv=474,NumMax=1,NumMin=0},
						{GoodsID=784,GaiLv1=8888905,GaiLv2=9259275,NumGaiLv=474,NumMax=1,NumMin=0},
						{GoodsID=784,GaiLv1=9259276,GaiLv2=9629646,NumGaiLv=474,NumMax=1,NumMin=0},
						{GoodsID=80274,GaiLv1=9629647,GaiLv2=10000000,NumGaiLv=5822,NumMax=2,NumMin=1},
						},
				},
			--男高
			{Min=96,Max=100,
				Goodslist = {
						{GoodsID=553,GaiLv1=1,GaiLv2=1000001,NumGaiLv=3302,NumMax=1,NumMin=0},
						{GoodsID=570,GaiLv1=1000002,GaiLv2=2000002,NumGaiLv=1188,NumMax=1,NumMin=0},
						{GoodsID=570,GaiLv1=2000003,GaiLv2=3000003,NumGaiLv=1188,NumMax=1,NumMin=0},
						{GoodsID=570,GaiLv1=3000004,GaiLv2=4000004,NumGaiLv=1188,NumMax=1,NumMin=0},
						{GoodsID=570,GaiLv1=4000005,GaiLv2=5000005,NumGaiLv=1188,NumMax=1,NumMin=0},
						{GoodsID=570,GaiLv1=5000006,GaiLv2=6000006,NumGaiLv=1188,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=6000007,GaiLv2=7000007,NumGaiLv=3715,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=7000008,GaiLv2=8000008,NumGaiLv=3715,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=8000009,GaiLv2=9000009,NumGaiLv=3715,NumMax=1,NumMin=0},
						{GoodsID=552,GaiLv1=9000010,GaiLv2=10000000,NumGaiLv=3500,NumMax=1,NumMin=0},
						},
				},
		},
	[11939] = {
			--子低
			{Min=1,Max=70,
				Goodslist = {
						{GoodsID=80050,GaiLv1=1,GaiLv2=243902,NumGaiLv=9535,NumMax=4,NumMin=3},
						{GoodsID=80066,GaiLv1=243903,GaiLv2=487805,NumGaiLv=9535,NumMax=4,NumMin=3},
						{GoodsID=80066,GaiLv1=487806,GaiLv2=731708,NumGaiLv=9535,NumMax=4,NumMin=3},
						{GoodsID=80066,GaiLv1=731709,GaiLv2=975611,NumGaiLv=9535,NumMax=4,NumMin=3},
						{GoodsID=80066,GaiLv1=975612,GaiLv2=1219514,NumGaiLv=9535,NumMax=4,NumMin=3},
						{GoodsID=80066,GaiLv1=1219515,GaiLv2=1463417,NumGaiLv=9535,NumMax=4,NumMin=3},
						{GoodsID=80066,GaiLv1=1463418,GaiLv2=1707320,NumGaiLv=9535,NumMax=4,NumMin=3},
						{GoodsID=80066,GaiLv1=1707321,GaiLv2=1951223,NumGaiLv=9535,NumMax=4,NumMin=3},
						{GoodsID=80397,GaiLv1=1951224,GaiLv2=2195126,NumGaiLv=8571,NumMax=6,NumMin=5},
						{GoodsID=80384,GaiLv1=2195127,GaiLv2=2439029,NumGaiLv=12,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=2439030,GaiLv2=2682932,NumGaiLv=12,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=2682933,GaiLv2=2926835,NumGaiLv=12,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=2926836,GaiLv2=3170738,NumGaiLv=12,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=3170739,GaiLv2=3414641,NumGaiLv=12,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=3414642,GaiLv2=3658544,NumGaiLv=26,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=3658545,GaiLv2=3902447,NumGaiLv=4,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=3902448,GaiLv2=4146350,NumGaiLv=26,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=4146351,GaiLv2=4390253,NumGaiLv=4,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=4390254,GaiLv2=4634156,NumGaiLv=26,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=4634157,GaiLv2=4878059,NumGaiLv=4,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=4878060,GaiLv2=5121962,NumGaiLv=122,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=5121963,GaiLv2=5365865,NumGaiLv=122,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=5365866,GaiLv2=5609768,NumGaiLv=122,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=5609769,GaiLv2=5853671,NumGaiLv=122,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=5853672,GaiLv2=6097574,NumGaiLv=122,NumMax=1,NumMin=0},
						{GoodsID=785,GaiLv1=6097575,GaiLv2=6341477,NumGaiLv=585,NumMax=1,NumMin=0},
						{GoodsID=785,GaiLv1=6341478,GaiLv2=6585380,NumGaiLv=585,NumMax=1,NumMin=0},
						{GoodsID=785,GaiLv1=6585381,GaiLv2=6829283,NumGaiLv=585,NumMax=1,NumMin=0},
						{GoodsID=785,GaiLv1=6829284,GaiLv2=7073186,NumGaiLv=585,NumMax=1,NumMin=0},
						{GoodsID=785,GaiLv1=7073187,GaiLv2=7317089,NumGaiLv=585,NumMax=1,NumMin=0},
						{GoodsID=80486,GaiLv1=7317090,GaiLv2=7560992,NumGaiLv=1714,NumMax=2,NumMin=1},
						{GoodsID=80486,GaiLv1=7560993,GaiLv2=7804895,NumGaiLv=1714,NumMax=2,NumMin=1},
						{GoodsID=80486,GaiLv1=7804896,GaiLv2=8048798,NumGaiLv=200,NumMax=1,NumMin=0},
						{GoodsID=80486,GaiLv1=8048799,GaiLv2=8292701,NumGaiLv=200,NumMax=1,NumMin=0},
						{GoodsID=501,GaiLv1=8292702,GaiLv2=8536604,NumGaiLv=3428,NumMax=3,NumMin=2},
						{GoodsID=80274,GaiLv1=8536605,GaiLv2=8780507,NumGaiLv=9285,NumMax=3,NumMin=2},
						{GoodsID=80405,GaiLv1=8780508,GaiLv2=9024410,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80409,GaiLv1=9024411,GaiLv2=9268313,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80400,GaiLv1=9268314,GaiLv2=9512216,NumGaiLv=0,NumMax=1,NumMin=0},
						{GoodsID=80387,GaiLv1=9512217,GaiLv2=9756119,NumGaiLv=4,NumMax=1,NumMin=0},
						{GoodsID=80387,GaiLv1=9756120,GaiLv2=10000000,NumGaiLv=4,NumMax=1,NumMin=0},
						},
				},
			--子中
			{Min=71,Max=95,
				Goodslist = {
						{GoodsID=553,GaiLv1=1,GaiLv2=238096,NumGaiLv=20,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=238097,GaiLv2=476192,NumGaiLv=2022,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=476193,GaiLv2=714288,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=714289,GaiLv2=952384,NumGaiLv=2022,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=952385,GaiLv2=1190480,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=1190481,GaiLv2=1428576,NumGaiLv=2022,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=1428577,GaiLv2=1666672,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=1666673,GaiLv2=1904768,NumGaiLv=2022,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=1904769,GaiLv2=2142864,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=2142865,GaiLv2=2380960,NumGaiLv=2022,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=2380961,GaiLv2=2619056,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=2619057,GaiLv2=2857152,NumGaiLv=12,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=2857153,GaiLv2=3095248,NumGaiLv=4334,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=3095249,GaiLv2=3333344,NumGaiLv=805,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=3333345,GaiLv2=3571440,NumGaiLv=4334,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=3571441,GaiLv2=3809536,NumGaiLv=805,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=3809537,GaiLv2=4047632,NumGaiLv=4334,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=4047633,GaiLv2=4285728,NumGaiLv=805,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=4285729,GaiLv2=4523824,NumGaiLv=228,NumMax=3,NumMin=2},
						{GoodsID=584,GaiLv1=4523825,GaiLv2=4761920,NumGaiLv=75,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=4761921,GaiLv2=5000016,NumGaiLv=228,NumMax=3,NumMin=2},
						{GoodsID=584,GaiLv1=5000017,GaiLv2=5238112,NumGaiLv=75,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=5238113,GaiLv2=5476208,NumGaiLv=228,NumMax=3,NumMin=2},
						{GoodsID=584,GaiLv1=5476209,GaiLv2=5714304,NumGaiLv=75,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=5714305,GaiLv2=5952400,NumGaiLv=228,NumMax=3,NumMin=2},
						{GoodsID=584,GaiLv1=5952401,GaiLv2=6190496,NumGaiLv=75,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=6190497,GaiLv2=6428592,NumGaiLv=228,NumMax=3,NumMin=2},
						{GoodsID=584,GaiLv1=6428593,GaiLv2=6666688,NumGaiLv=75,NumMax=1,NumMin=0},
						{GoodsID=80486,GaiLv1=6666689,GaiLv2=6904784,NumGaiLv=3026,NumMax=4,NumMin=3},
						{GoodsID=80486,GaiLv1=6904785,GaiLv2=7142880,NumGaiLv=3026,NumMax=4,NumMin=3},
						{GoodsID=80486,GaiLv1=7142881,GaiLv2=7380976,NumGaiLv=200,NumMax=1,NumMin=0},
						{GoodsID=552,GaiLv1=7380977,GaiLv2=7619072,NumGaiLv=25,NumMax=1,NumMin=0},
						{GoodsID=80405,GaiLv1=7619073,GaiLv2=7857168,NumGaiLv=433,NumMax=1,NumMin=0},
						{GoodsID=581,GaiLv1=7857169,GaiLv2=8095264,NumGaiLv=0,NumMax=1,NumMin=0},
						{GoodsID=80409,GaiLv1=8095265,GaiLv2=8333360,NumGaiLv=433,NumMax=1,NumMin=0},
						{GoodsID=583,GaiLv1=8333361,GaiLv2=8571456,NumGaiLv=0,NumMax=1,NumMin=0},
						{GoodsID=80400,GaiLv1=8571457,GaiLv2=8809552,NumGaiLv=14,NumMax=1,NumMin=0},
						{GoodsID=80400,GaiLv1=8809553,GaiLv2=9047648,NumGaiLv=0,NumMax=1,NumMin=0},
						{GoodsID=80387,GaiLv1=9047649,GaiLv2=9285744,NumGaiLv=780,NumMax=1,NumMin=0},
						{GoodsID=579,GaiLv1=9285745,GaiLv2=9523840,NumGaiLv=3,NumMax=1,NumMin=0},
						{GoodsID=80387,GaiLv1=9523841,GaiLv2=9761936,NumGaiLv=780,NumMax=1,NumMin=0},
						{GoodsID=579,GaiLv1=9761937,GaiLv2=10000000,NumGaiLv=3,NumMax=1,NumMin=0},
						},
				},
			--子高
			{Min=96,Max=100,
				Goodslist = {
						{GoodsID=553,GaiLv1=1,GaiLv2=500001,NumGaiLv=8283,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=500002,GaiLv2=1000002,NumGaiLv=904,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=1000003,GaiLv2=1500003,NumGaiLv=904,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=1500004,GaiLv2=2000004,NumGaiLv=904,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=2000005,GaiLv2=2500005,NumGaiLv=904,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=2500006,GaiLv2=3000006,NumGaiLv=904,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=3000007,GaiLv2=3500007,NumGaiLv=4870,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=3500008,GaiLv2=4000008,NumGaiLv=910,NumMax=1,NumMin=0},
						{GoodsID=584,GaiLv1=4000009,GaiLv2=4500009,NumGaiLv=152,NumMax=4,NumMin=3},
						{GoodsID=584,GaiLv1=4500010,GaiLv2=5000010,NumGaiLv=152,NumMax=4,NumMin=3},
						{GoodsID=584,GaiLv1=5000011,GaiLv2=5500011,NumGaiLv=152,NumMax=4,NumMin=3},
						{GoodsID=584,GaiLv1=5500012,GaiLv2=6000012,NumGaiLv=152,NumMax=4,NumMin=3},
						{GoodsID=584,GaiLv1=6000013,GaiLv2=6500013,NumGaiLv=152,NumMax=4,NumMin=3},
						{GoodsID=80486,GaiLv1=6500014,GaiLv2=7000014,NumGaiLv=9523,NumMax=8,NumMin=7},
						{GoodsID=552,GaiLv1=7000015,GaiLv2=7500015,NumGaiLv=9940,NumMax=1,NumMin=0},
						{GoodsID=581,GaiLv1=7500016,GaiLv2=8000016,NumGaiLv=193,NumMax=1,NumMin=0},
						{GoodsID=583,GaiLv1=8000017,GaiLv2=8500017,NumGaiLv=193,NumMax=1,NumMin=0},
						{GoodsID=80400,GaiLv1=8500018,GaiLv2=9000018,NumGaiLv=33,NumMax=1,NumMin=0},
						{GoodsID=579,GaiLv1=9000019,GaiLv2=9500019,NumGaiLv=1545,NumMax=1,NumMin=0},
						{GoodsID=579,GaiLv1=9500020,GaiLv2=10000000,NumGaiLv=1545,NumMax=1,NumMin=0},
						},
				},
		},
	[11940] = {
			--伯低
			{Min=1,Max=70,
				Goodslist = {
						{GoodsID=80051,GaiLv1=1,GaiLv2=250000,NumGaiLv=357,NumMax=5,NumMin=4},
						{GoodsID=80067,GaiLv1=250001,GaiLv2=500001,NumGaiLv=357,NumMax=5,NumMin=4},
						{GoodsID=80067,GaiLv1=500002,GaiLv2=750002,NumGaiLv=357,NumMax=5,NumMin=4},
						{GoodsID=80067,GaiLv1=750003,GaiLv2=1000003,NumGaiLv=357,NumMax=5,NumMin=4},
						{GoodsID=80067,GaiLv1=1000004,GaiLv2=1250004,NumGaiLv=357,NumMax=5,NumMin=4},
						{GoodsID=80067,GaiLv1=1250005,GaiLv2=1500005,NumGaiLv=357,NumMax=5,NumMin=4},
						{GoodsID=80067,GaiLv1=1500006,GaiLv2=1750006,NumGaiLv=357,NumMax=5,NumMin=4},
						{GoodsID=80067,GaiLv1=1750007,GaiLv2=2000007,NumGaiLv=357,NumMax=5,NumMin=4},
						{GoodsID=80397,GaiLv1=2000008,GaiLv2=2250008,NumGaiLv=4285,NumMax=12,NumMin=11},
						{GoodsID=553,GaiLv1=2250009,GaiLv2=2500009,NumGaiLv=166,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=2500010,GaiLv2=2750010,NumGaiLv=17,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=2750011,GaiLv2=3000011,NumGaiLv=17,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=3000012,GaiLv2=3250012,NumGaiLv=17,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=3250013,GaiLv2=3500013,NumGaiLv=17,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=3500014,GaiLv2=3750014,NumGaiLv=17,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=3750015,GaiLv2=4000015,NumGaiLv=3214,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=4000016,GaiLv2=4250016,NumGaiLv=3214,NumMax=1,NumMin=0},
						{GoodsID=80181,GaiLv1=4250017,GaiLv2=4500017,NumGaiLv=3214,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=4500018,GaiLv2=4750018,NumGaiLv=1200,NumMax=1,NumMin=0},
						{GoodsID=584,GaiLv1=4750019,GaiLv2=5000019,NumGaiLv=7,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=5000020,GaiLv2=5250020,NumGaiLv=1200,NumMax=1,NumMin=0},
						{GoodsID=584,GaiLv1=5250021,GaiLv2=5500021,NumGaiLv=7,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=5500022,GaiLv2=5750022,NumGaiLv=1200,NumMax=1,NumMin=0},
						{GoodsID=584,GaiLv1=5750023,GaiLv2=6000023,NumGaiLv=7,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=6000024,GaiLv2=6250024,NumGaiLv=1200,NumMax=1,NumMin=0},
						{GoodsID=584,GaiLv1=6250025,GaiLv2=6500025,NumGaiLv=7,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=6500026,GaiLv2=6750026,NumGaiLv=1200,NumMax=1,NumMin=0},
						{GoodsID=584,GaiLv1=6750027,GaiLv2=7000027,NumGaiLv=7,NumMax=1,NumMin=0},
						{GoodsID=80192,GaiLv1=7000028,GaiLv2=7250028,NumGaiLv=1200,NumMax=1,NumMin=0},
						{GoodsID=584,GaiLv1=7250029,GaiLv2=7500029,NumGaiLv=7,NumMax=1,NumMin=0},
						{GoodsID=786,GaiLv1=7500030,GaiLv2=7750030,NumGaiLv=5,NumMax=1,NumMin=0},
						{GoodsID=80486,GaiLv1=7750031,GaiLv2=8000031,NumGaiLv=1428,NumMax=18,NumMin=17},
						{GoodsID=501,GaiLv1=8000032,GaiLv2=8250032,NumGaiLv=2857,NumMax=3,NumMin=2},
						{GoodsID=80274,GaiLv1=8250033,GaiLv2=8500033,NumGaiLv=4285,NumMax=2,NumMin=1},
						{GoodsID=80405,GaiLv1=8500034,GaiLv2=8750034,NumGaiLv=3,NumMax=1,NumMin=0},
						{GoodsID=80409,GaiLv1=8750035,GaiLv2=9000035,NumGaiLv=3,NumMax=1,NumMin=0},
						{GoodsID=80401,GaiLv1=9000036,GaiLv2=9250036,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80401,GaiLv1=9250037,GaiLv2=9500037,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80388,GaiLv1=9500038,GaiLv2=9750038,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80388,GaiLv1=9750039,GaiLv2=10000000,NumGaiLv=2,NumMax=1,NumMin=0},
						},
				},
			--伯中
			{Min=71,Max=95,
				Goodslist = {
						{GoodsID=553,GaiLv1=1,GaiLv2=294118,NumGaiLv=2270,NumMax=3,NumMin=2},
						{GoodsID=80384,GaiLv1=294119,GaiLv2=588236,NumGaiLv=2338,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=588237,GaiLv2=882354,NumGaiLv=1,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=882355,GaiLv2=1176472,NumGaiLv=2338,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=1176473,GaiLv2=1470590,NumGaiLv=1,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=1470591,GaiLv2=1764708,NumGaiLv=2338,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=1764709,GaiLv2=2058826,NumGaiLv=1,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=2058827,GaiLv2=2352944,NumGaiLv=2338,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=2352945,GaiLv2=2647062,NumGaiLv=1,NumMax=1,NumMin=0},
						{GoodsID=80384,GaiLv1=2647063,GaiLv2=2941180,NumGaiLv=2338,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=2941181,GaiLv2=3235298,NumGaiLv=1,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=3235299,GaiLv2=3529416,NumGaiLv=5,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=3529417,GaiLv2=3823534,NumGaiLv=5,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=3823535,GaiLv2=4117652,NumGaiLv=5,NumMax=1,NumMin=0},
						{GoodsID=584,GaiLv1=4117653,GaiLv2=4411770,NumGaiLv=935,NumMax=1,NumMin=0},
						{GoodsID=584,GaiLv1=4411771,GaiLv2=4705888,NumGaiLv=935,NumMax=1,NumMin=0},
						{GoodsID=584,GaiLv1=4705889,GaiLv2=5000006,NumGaiLv=935,NumMax=1,NumMin=0},
						{GoodsID=584,GaiLv1=5000007,GaiLv2=5294124,NumGaiLv=935,NumMax=1,NumMin=0},
						{GoodsID=584,GaiLv1=5294125,GaiLv2=5588242,NumGaiLv=935,NumMax=1,NumMin=0},
						{GoodsID=584,GaiLv1=5588243,GaiLv2=5882360,NumGaiLv=935,NumMax=1,NumMin=0},
						{GoodsID=786,GaiLv1=5882361,GaiLv2=6176478,NumGaiLv=668,NumMax=1,NumMin=0},
						{GoodsID=786,GaiLv1=6176479,GaiLv2=6470596,NumGaiLv=10,NumMax=1,NumMin=0},
						{GoodsID=786,GaiLv1=6470597,GaiLv2=6764714,NumGaiLv=10,NumMax=1,NumMin=0},
						{GoodsID=786,GaiLv1=6764715,GaiLv2=7058832,NumGaiLv=10,NumMax=1,NumMin=0},
						{GoodsID=786,GaiLv1=7058833,GaiLv2=7352950,NumGaiLv=10,NumMax=1,NumMin=0},
						{GoodsID=552,GaiLv1=7352951,GaiLv2=7647068,NumGaiLv=12,NumMax=1,NumMin=0},
						{GoodsID=80405,GaiLv1=7647069,GaiLv2=7941186,NumGaiLv=501,NumMax=1,NumMin=0},
						{GoodsID=80409,GaiLv1=7941187,GaiLv2=8235304,NumGaiLv=501,NumMax=1,NumMin=0},
						{GoodsID=80401,GaiLv1=8235305,GaiLv2=8529422,NumGaiLv=334,NumMax=1,NumMin=0},
						{GoodsID=80401,GaiLv1=8529423,GaiLv2=8823540,NumGaiLv=334,NumMax=1,NumMin=0},
						{GoodsID=80401,GaiLv1=8823541,GaiLv2=9117658,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80401,GaiLv1=9117659,GaiLv2=9411776,NumGaiLv=2,NumMax=1,NumMin=0},
						{GoodsID=80388,GaiLv1=9411777,GaiLv2=9705894,NumGaiLv=334,NumMax=1,NumMin=0},
						{GoodsID=80388,GaiLv1=9705895,GaiLv2=10000000,NumGaiLv=334,NumMax=1,NumMin=0},
						},
				},
			--伯高
			{Min=96,Max=100,
				Goodslist = {
						{GoodsID=571,GaiLv1=1,GaiLv2=526316,NumGaiLv=660,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=526317,GaiLv2=1052632,NumGaiLv=660,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=1052633,GaiLv2=1578948,NumGaiLv=660,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=1578949,GaiLv2=2105264,NumGaiLv=660,NumMax=1,NumMin=0},
						{GoodsID=571,GaiLv1=2105265,GaiLv2=2631580,NumGaiLv=660,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=2631581,GaiLv2=3157896,NumGaiLv=2121,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=3157897,GaiLv2=3684212,NumGaiLv=2121,NumMax=1,NumMin=0},
						{GoodsID=572,GaiLv1=3684213,GaiLv2=4210528,NumGaiLv=2121,NumMax=1,NumMin=0},
						{GoodsID=786,GaiLv1=4210529,GaiLv2=4736844,NumGaiLv=3772,NumMax=1,NumMin=0},
						{GoodsID=786,GaiLv1=4736845,GaiLv2=5263160,NumGaiLv=3772,NumMax=1,NumMin=0},
						{GoodsID=786,GaiLv1=5263161,GaiLv2=5789476,NumGaiLv=3772,NumMax=1,NumMin=0},
						{GoodsID=786,GaiLv1=5789477,GaiLv2=6315792,NumGaiLv=3772,NumMax=1,NumMin=0},
						{GoodsID=552,GaiLv1=6315793,GaiLv2=6842108,NumGaiLv=4715,NumMax=1,NumMin=0},
						{GoodsID=581,GaiLv1=6842109,GaiLv2=7368424,NumGaiLv=142,NumMax=1,NumMin=0},
						{GoodsID=583,GaiLv1=7368425,GaiLv2=7894740,NumGaiLv=142,NumMax=1,NumMin=0},
						{GoodsID=80401,GaiLv1=7894741,GaiLv2=8421056,NumGaiLv=943,NumMax=1,NumMin=0},
						{GoodsID=80401,GaiLv1=8421057,GaiLv2=8947372,NumGaiLv=943,NumMax=1,NumMin=0},
						{GoodsID=588,GaiLv1=8947373,GaiLv2=9473688,NumGaiLv=475,NumMax=1,NumMin=0},
						{GoodsID=588,GaiLv1=9473689,GaiLv2=10000000,NumGaiLv=475,NumMax=1,NumMin=0},
						},
				},
		},
}

if FightForTreasureBox_MapMonsterTable == nil then --存每个地图的夺宝怪
	FightForTreasureBox_MapMonsterTable = {}
end

if not API_IsEctypeServer() or API_IsBranchServer() then
	if not API_IsBattleGameServer() then
	--服务器启动设置地图区域PK设置
		for j in FightForTreasureBox_PKMapID do
			local RightMapID = API_GetRightMapID(j)
			for i in FightForTreasureBox_PKMapID[j] do
				local a = FightForTreasureBox_PKMapID[j][i]
				API_SetAreaType(RightMapID,a,2)
			end
		end
		FightForTreasureBox_TimerTriggerID = FightForTreasureBox_TimerTriggerID or API_CreateTimerTriggerG(0,0,60,-1,'FightForTreasureBox_TimerTriggerGCallFunc')
		FightForTreasureBox_KillMonster_TimerTriggerID = FightForTreasureBox_KillMonster_TimerTriggerID or API_CreateTimerTriggerG(0,0,60,-1,'FightForTreasureBox_KillMonster_TimerTriggerCallFunc')
	end
end

function FightForTreasureBox_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local RedayTime,StartTime,EndTime = 0,0,0
	for i = 1,table.getn(FightForTreasureBox_ActTime) do
		local RT = FightForTreasureBox_ActTime[i].RedayTime
		local ST = FightForTreasureBox_ActTime[i].StartTime
		local ET = FightForTreasureBox_ActTime[i].EndTime
		if Hour >= RT and Hour < ET then
			RedayTime,StartTime,EndTime = RT,ST,ET
		end
	end
	--if (math.ceil(Day/7) == 1 or math.ceil(Day/7) == 3) and (Week == 6 or Week == 7) then
	if (Week == 6 or Week == 7) and API_VarDataGetNumber_Ex(1, 0, -2000, 1, 1) == 1 then
		if RedayTime ~= 0 and StartTime ~= 0 and EndTime ~= 0 then
			if not API_IsEctypeServer() or API_IsBranchServer() then
				for i = 1,table.getn(FightForTreasureBox_BoxTable) do
					local MapID = FightForTreasureBox_BoxTable[i].MapID
					if FightForTreasureBox_MapMonsterTable[API_GetRightMapID(MapID)] == nil then
						FightForTreasureBox_MapMonsterTable[API_GetRightMapID(MapID)] = {}
						FightForTreasureBox_MapMonsterTable[API_GetRightMapID(MapID)][1] = {}
						FightForTreasureBox_MapMonsterTable[API_GetRightMapID(MapID)][2] = {}
					end
				end
			end
			if Hour == (StartTime - 1) and Minute >= 30 then
				FFTB_Start = 0
				if math.mod(Minute,10) == 0 then
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17,'宝箱争夺活动于'..StartTime..'：00--'..EndTime..'：00期间在月暮草场举行，欢迎各位英雄踊跃参加！（活动时间内活动地图不受PK系统惩罚）')
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8,'宝箱争夺活动于'..StartTime..'：00--'..EndTime..'：00期间在月暮草场举行，欢迎各位英雄踊跃参加！（活动时间内活动地图不受PK系统惩罚）')
					--API_ActorBroadcastMsgEx(MapID,-1,0,17,'宝箱争夺活动于'..StartTime..'：00--'..EndTime..'：00期间在阳光雨林、珊瑚群岛、月暮草场举行，欢迎各位英雄踊跃参加！')
					--API_ActorBroadcastMsgEx(MapID,-1,0,17,'宝箱争夺活动于'..StartTime..'：00--'..EndTime..'：00期间在月暮草场举行，欢迎各位英雄踊跃参加！')
				end
			end
			if Hour >= StartTime and Hour < EndTime then
				if FFTB_Start == nil or FFTB_Start < 1 then
					FFTB_Start = 1
					--FightForTreasureBox_PKMapIDOpen()
					if API_GetServerID() == 1 then
						API_ActorCallBack(API_GetRightMapID(101),0,-1,'FightForTreasureBox_PKMapIDOpen2')
						API_SetAreaType(API_GetRightMapID(101),0,1)
						FightForTreasureBox_Box_TimerTriggerCallFunc()
						API_CreateTimerTriggerG(0,0,FightForTreasureBox_TimerTriggerG,3,'FightForTreasureBox_Box_TimerTriggerCallFunc')
					end
					--for i = 1,table.getn(FightForTreasureBox_BoxTable) do
					--	local MapID = FightForTreasureBox_BoxTable[i].MapID
						--API_ActorBroadcastMsgEx(MapID,-1,0,17,'宝箱争夺活动在阳光雨林、珊瑚群岛、月暮草场开始！')
						--API_ActorBroadcastMsgEx(MapID,-1,0,17,'宝箱争夺活动在月暮草场开始！')
						--API_ActorBroadcastMsgEx(MapID,-1,0,8,'宝箱争夺活动在月暮草场开始！')
					--end
				end
				if math.mod(Minute,20) == 0 then
					for i = 1,table.getn(FightForTreasureBox_BoxTable) do
						local MapID = FightForTreasureBox_BoxTable[i].MapID
						MapID = API_GetRightMapID(MapID)
						if API_MapIsValid(MapID) then
							API_ActorBroadcastMsgLevelEx(MapID, -1, 26, 0, 17,'宝箱争夺活动正在月暮草场举行！')
							API_ActorBroadcastMsgLevelEx(MapID, -1, 26, 0, 8,'宝箱争夺活动正在月暮草场举行！')
						end
					end
					--API_ActorBroadcastMsgEx(MapID,-1,0,17,'宝箱争夺活动正在阳光雨林、珊瑚群岛、月暮草场举行！')
					--API_ActorBroadcastMsgEx(MapID,-1,0,17,'宝箱争夺活动正在月暮草场举行！')
				end
			end
			if Hour == (EndTime - 1) and Minute >= 50 then
				if math.mod(Minute,5) == 0 then
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17,'请注意，宝箱争夺活动即将结束！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8,'请注意，宝箱争夺活动即将结束！')
					--API_ActorBroadcastMsgEx(MapID,-1,0,17,'请注意，宝箱争夺活动即将结束！')
				end
			end
			if Hour == (EndTime - 1) and Minute == 59 then
				if FFTB_Start == nil or FFTB_Start < 2 then
					FFTB_Start = 2
					--FightForTreasureBox_PKMapIDClose()
					if API_GetServerID() == 1 then
						API_ActorCallBack(API_GetRightMapID(101),0,-1,'FightForTreasureBox_PKMapIDClose2')
						API_SetAreaType(API_GetRightMapID(101),0,3)
					end
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17,'宝箱争夺活动已经结束！月暮草场内同阵营PK已关闭！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8,'宝箱争夺活动已经结束！月暮草场内同阵营PK已关闭！')
					--API_ActorBroadcastMsgEx(MapID,-1,0,17,'宝箱争夺活动已经结束！阳光雨林、珊瑚群岛、月暮草场内同阵营PK已关闭！')
					--API_ActorBroadcastMsgEx(MapID,-1,0,17,'宝箱争夺活动已经结束！月暮草场内同阵营PK已关闭！')
				end
			end
		end
	end
	if (Week == MerryChristmas_ActWeek3 or Week == MerryChristmas_ActWeek4) and API_VarDataGetNumber_Ex(1, 0, -2000, 1, 1) == 1 then
		if (Hour == 14 and Minute == 0) or (Hour == 14 and Minute == 30) or (Hour == 20 and Minute == 30) or (Hour == 21 and Minute == 0) then
			API_ActorMsgBoard(0, -1, -1,'宝箱争夺活动将在本周六和周日的15：00--16：00在月暮草场举行，欢迎各位英雄踊跃参与！')
		end
	end
end

function FightForTreasureBox_PKMapIDOpen()
	for j in FightForTreasureBox_PKMapID do
		local RightMapID = API_GetRightMapID(j)
		for i in FightForTreasureBox_PKMapID[j] do
			local a = FightForTreasureBox_PKMapID[j][i]
			API_SetAreaType(RightMapID,a,1)
		end
	end
end

function FightForTreasureBox_PKMapIDClose()
	for j in FightForTreasureBox_PKMapID do
		local RightMapID = API_GetRightMapID(j)
		for i in FightForTreasureBox_PKMapID[j] do
			local a = FightForTreasureBox_PKMapID[j][i]
			API_SetAreaType(RightMapID,a,2)
		end
	end
end

function FightForTreasureBox_PKMapIDOpen2(ActorID)
	local CampID = API_GetActorCamp(ActorID)
	local TeamID = API_GetTeamID(ActorID)
	if TeamID > 0  then
		local TeamID2 = TeamID + 1000
		API_ActorSetPKTeamID(ActorID,TeamID2)
	else
		API_ActorSetPKTeamID(ActorID,0)
	end
	API_ActorRemoveStatus(ActorID,191001)
end

function FightForTreasureBox_PKMapIDClose2(ActorID)
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 0 then
		API_ActorSetPKTeamID(ActorID,3)
	elseif CampID == 1 then
		API_ActorSetPKTeamID(ActorID,1)
	end
	API_ActorRemoveStatus(ActorID,191001)
end

function FightForTreasureBox_OnTeamMemberCall(ActorID,TeamID,Type)
	if API_ActorIsOnline(ActorID) then
		local MapID = API_GetActorMapID(ActorID)
		local MapConfigID = API_GetMapConfigID(MapID)
		--if MapConfigID == 23 or MapConfigID == 10 then
		--	if Type == 0 then
		--		local TeamID2 = TeamID + 1000
		--		API_ActorSetPKTeamID(ActorID,TeamID2)
		--	else
		--		API_ActorSetPKTeamID(ActorID,0)
		--	end
		--end
		if MapConfigID == 101 then
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
			local RedayTime,StartTime,EndTime = 0,0,0
			for i = 1,table.getn(FightForTreasureBox_ActTime) do
				local RT = FightForTreasureBox_ActTime[i].RedayTime
				local ST = FightForTreasureBox_ActTime[i].StartTime
				local ET = FightForTreasureBox_ActTime[i].EndTime
				if Hour >= RT and Hour < ET then
					RedayTime,StartTime,EndTime = RT,ST,ET
				end
			end
			if RedayTime ~= 0 and StartTime ~= 0 and EndTime ~= 0 then
				if Type == 0 then
					local TeamID2 = TeamID + 1000
					API_ActorSetPKTeamID(ActorID,TeamID2)
				else
					API_ActorSetPKTeamID(ActorID,0)
				end
			end
		end
	end
end

function FightForTreasureBox_OnTeamMemberOut(ActorID,TeamID)
	if API_ActorIsOnline(ActorID) then
		local MapID = API_GetActorMapID(ActorID)
		local MapConfigID = API_GetMapConfigID(MapID)
		--if MapConfigID == 23 or MapConfigID == 10 then
		--	API_ActorSetPKTeamID(ActorID,0)
		--end
		if MapConfigID == 101 then
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
			local RedayTime,StartTime,EndTime = 0,0,0
			for i = 1,table.getn(FightForTreasureBox_ActTime) do
				local RT = FightForTreasureBox_ActTime[i].RedayTime
				local ST = FightForTreasureBox_ActTime[i].StartTime
				local ET = FightForTreasureBox_ActTime[i].EndTime
				if Hour >= RT and Hour < ET then
					RedayTime,StartTime,EndTime = RT,ST,ET
				end
			end
			if RedayTime ~= 0 and StartTime ~= 0 and EndTime ~= 0 then
				API_ActorSetPKTeamID(ActorID,0)
			end
		end
	end
end

function FightForTreasureBox_OnLogin(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	if ActorID <= 200 then
		return
	end
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local TeamID = API_GetTeamID(ActorID)
	--if MapConfigID == 23 or MapConfigID == 10 then
	--	if TeamID > 0  then
	--		local TeamID2 = TeamID + 1000
	--		API_ActorSetPKTeamID(ActorID,TeamID2)
	--	else
	--		API_ActorSetPKTeamID(ActorID,0)
	--	end
	--end
	if MapConfigID == 101 then
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local RedayTime,StartTime,EndTime = 0,0,0
		for i = 1,table.getn(FightForTreasureBox_ActTime) do
			local RT = FightForTreasureBox_ActTime[i].RedayTime
			local ST = FightForTreasureBox_ActTime[i].StartTime
			local ET = FightForTreasureBox_ActTime[i].EndTime
			if Hour >= RT and Hour < ET then
				RedayTime,StartTime,EndTime = RT,ST,ET
			end
		end
		if RedayTime ~= 0 and StartTime ~= 0 and EndTime ~= 0 then
			if TeamID > 0 then
				local TeamID2 = TeamID + 1000
				API_ActorSetPKTeamID(ActorID,TeamID2)
			else
				API_ActorSetPKTeamID(ActorID,0)
			end
		end
	end
end

function FightForTreasureBox_OnLoginMap(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	if ActorID <= 200 then
		return
	end
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local TeamID = API_GetTeamID(ActorID)
	--if MapConfigID == 23 or MapConfigID == 10 then
	--	if TeamID > 0  then
	--		local TeamID2 = TeamID + 1000
	--		API_ActorSetPKTeamID(ActorID,TeamID2)
	--	else
	--		API_ActorSetPKTeamID(ActorID,0)
	--	end
	--end
	if MapConfigID == 101 then
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local RedayTime,StartTime,EndTime = 0,0,0
		for i = 1,table.getn(FightForTreasureBox_ActTime) do
			local RT = FightForTreasureBox_ActTime[i].RedayTime
			local ST = FightForTreasureBox_ActTime[i].StartTime
			local ET = FightForTreasureBox_ActTime[i].EndTime
			if Hour >= RT and Hour < ET then
				RedayTime,StartTime,EndTime = RT,ST,ET
			end
		end
		if RedayTime ~= 0 and StartTime ~= 0 and EndTime ~= 0 then
			if TeamID > 0 then
				local TeamID2 = TeamID + 1000
				API_ActorSetPKTeamID(ActorID,TeamID2)
			else
				API_ActorSetPKTeamID(ActorID,0)
			end
		end
	end
end

local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'FightForTreasureBox_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'FightForTreasureBox_OnLogin') 
end

local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'FightForTreasureBox_OnLoginMap' then
		OnLoginMapLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'FightForTreasureBox_OnLoginMap') 
end

function FightForTreasureBox_Box_TimerTriggerCallFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local RedayTime,StartTime,EndTime = 0,0,0
	for i = 1,table.getn(FightForTreasureBox_ActTime) do
		local RT = FightForTreasureBox_ActTime[i].RedayTime
		local ST = FightForTreasureBox_ActTime[i].StartTime
		local ET = FightForTreasureBox_ActTime[i].EndTime
		if Hour >= RT and Hour < ET then
			RedayTime,StartTime,EndTime = RT,ST,ET
		end
	end
	local BoxTable = FightForTreasureBox_BoxTable
	if (Week == 6 or Week == 7) and API_VarDataGetNumber_Ex(1, 0, -2000, 1, 1) == 1 then
		if RedayTime ~= 0 and StartTime ~= 0 and EndTime ~= 0 then
			if Hour >= StartTime and Hour < EndTime then
				for i = 1,table.getn(BoxTable) do
					local MapID = BoxTable[i].MapID
					--if (MapID == 9 or MapID == 23 or MapID == 10 or MapID == 25 or MapID == 103) or not API_IsBranchServer() then
						local RightMapID = API_GetRightMapID(MapID)
						local PlayList = API_GetActorInArea(RightMapID,0,0,0,0,0)
						local PlayNum = 100
						if PlayList ~= nil then
							PlayNum = table.getn(PlayList)
						end
						local BoxID = BoxTable[i].BoxID
						local BoxFastID = BoxTable[i].BoxFastID
						local BoxNum = BoxTable[i].BoxNum
						local BoxMaxNum = BoxTable[i].BoxMaxNum
						local JinDu = BoxTable[i].JinDu
						if BoxNum < BoxMaxNum then
							--大箱子刷新
							if BoxFastID == 0 then
								if JinDu == 0 then
									local BoxTile =  BoxTable[i].BoxTile
									local RDTile = math.random(1,table.getn(BoxTile))
									local XYDW = BoxTile[RDTile]
									local x = XYDW[1]
									local y = XYDW[2]
									local d = XYDW[3]
									BoxTable[i].BoxX = x
									BoxTable[i].BoxY = y
									BoxTable[i].BoxD = d
								end
								local BoxX = BoxTable[i].BoxX
								local BoxY = BoxTable[i].BoxY
								local BoxD = BoxTable[i].BoxD
								if MapID == 101 then
									API_ActorBroadcastMsgEx(MapID,-1,0,17,'宝箱争夺活动在'..API_GetMapName(RightMapID)..''..API_TileToPixelX(RightMapID,BoxX,BoxY)..','..API_TileToPixelY(RightMapID,BoxX,BoxY)..'开始！（活动时间内本地图不受PK系统惩罚）')
								else
									API_ActorBroadcastMsgEx(MapID,-1,0,17,'宝箱争夺活动在'..API_GetMapName(RightMapID)..''..API_TileToPixelX(RightMapID,BoxX,BoxY)..','..API_TileToPixelY(RightMapID,BoxX,BoxY)..'开始！（活动时间内本地图不受PK系统惩罚）')
								end
								local XiaoBoxID = BoxTable[i].XiaoBoxID
								local XiaoBoxNum = BoxTable[i].XiaoBoxNum
								local Monster1ID = BoxTable[i].Monster1ID
								local Monster1Num = BoxTable[i].Monster1Num
								local Monster2ID = BoxTable[i].Monster2ID
								local Monster2Num = BoxTable[i].Monster2Num
								if PlayNum <= 50 then
									XiaoBoxNum = 75
									Monster1Num = 11
									Monster2Num = 200
								elseif PlayNum > 50 and PlayNum <= 200 then
									local PlayNum2 = PlayNum - 50
									local XiaoBoxNum2 = PlayNum2 * 1.5
									local XiaoBoxNum3 = math.floor(XiaoBoxNum2/1)
									local XiaoBoxNum4 = math.mod(XiaoBoxNum2,1)
									local XiaoBoxNum5 = XiaoBoxNum4 * 10
									if XiaoBoxNum5 > 4 then
										XiaoBoxNum = 75 + XiaoBoxNum3 + 1
									else
										XiaoBoxNum = 75 + XiaoBoxNum3
									end
									local Monster1Num2 = PlayNum2 * 0.225
									local Monster1Num3 = math.floor(Monster1Num2/1)
									local Monster1Num4 = math.mod(Monster1Num2,1)
									local Monster1Num5 = Monster1Num4 * 10
									if Monster1Num5 > 4 then
										Monster1Num = 11 + Monster1Num3 + 1
									else
										Monster1Num = 11 + Monster1Num3
									end
									local Monster2Num2 = PlayNum2 * 4
									local Monster2Num3 = math.floor(Monster2Num2/1)
									local Monster2Num4 = math.mod(Monster2Num2,1)
									local Monster2Num5 = Monster2Num4 * 10
									if Monster2Num5 > 4 then
										Monster2Num = 200 + Monster2Num3 + 1
									else
										Monster2Num = 200 + Monster2Num3
									end
								end
								--JY怪范围
								local M1x1 = BoxX - 60
								local M1y1 = BoxY - 60
								local M1x2 = BoxX + 60
								local M1y2 = BoxY + 60
								--PT怪范围
								local M2x1 = BoxX - 120
								local M2y1 = BoxY - 120
								local M2x2 = BoxX + 120
								local M2y2 = BoxY + 120
								if JinDu < 2 then
									BoxTable[i].JinDu = JinDu + 1
									for k = 1,XiaoBoxNum do
										local x1,y1
										local Num = 0
										repeat
											Num = Num + 1
											x1 = math.random(M2x1,M2x2)
											y1 = math.random(M2y1,M2y2)
										until not API_IsBlockTile(MapID,x1,y1,0) and (x1 > 0 and y1 >0) or Num == 50
										if not API_IsBlockTile(MapID,x1,y1,0) then
											API_CreateDropGoods(RightMapID,x1,y1,XiaoBoxID,1,0,'宝箱争夺之小宝箱',4,0,300,60)
										end
									end
									if API_MapIsValid(RightMapID) and type(FightForTreasureBox_MapMonsterTable[RightMapID]) == 'table' then
										if type(FightForTreasureBox_MapMonsterTable[RightMapID][1]) == 'table' and type(FightForTreasureBox_MapMonsterTable[RightMapID][2]) == 'table' then
											for p = 1,Monster1Num do
												if FightForTreasureBox_MapMonsterTable[RightMapID][1][p] == nil then
													local x2,y2
													local Num = 0
													repeat
														Num = Num + 1
														x2 = math.random(M1x1,M1x2)
														y2 = math.random(M1y1,M1y2)
													until not API_IsBlockTile(RightMapID,x2,y2,0) and (x2 > 0 and y2 >0) or Num == 100
													if not API_IsBlockTile(RightMapID,x2,y2,0) then
														local FastID = API_CreateMonster(RightMapID,Monster1ID,x2,y2,4,0,-1)
														FightForTreasureBox_MapMonsterTable[RightMapID][1][p] = FastID
													end
												else
													local FastID = FightForTreasureBox_MapMonsterTable[RightMapID][1][p]
													if API_GetMonsterID(FastID) <= 0 then
														local x2,y2
														local Num = 0
														repeat
															Num = Num + 1
															x2 = math.random(M1x1,M1x2)
															y2 = math.random(M1y1,M1y2)
														until not API_IsBlockTile(RightMapID,x2,y2,0) and (x2 > 0 and y2 >0) or Num == 100
														if not API_IsBlockTile(RightMapID,x2,y2,0) then
															local FastID = API_CreateMonster(RightMapID,Monster1ID,x2,y2,4,0,-1)
															FightForTreasureBox_MapMonsterTable[RightMapID][1][p] = FastID
														end
													end
												end
											end
											for k = 1,Monster2Num do
												if FightForTreasureBox_MapMonsterTable[RightMapID][2][k] == nil then
													local x2,y2
													local Num = 0
													repeat
														Num = Num + 1
														x2 = math.random(M2x1,M2x2)
														y2 = math.random(M2y1,M2y2)
													until not API_IsBlockTile(RightMapID,x2,y2,0) and not ((x2 > M1x1 and x2 < M1x2) and (y2 > M1y1 and y2 < M1y2)) and (x2 > 0 and y2 >0) or Num == 100
													if not API_IsBlockTile(RightMapID,x2,y2,0) then
														local FastID = API_CreateMonster(RightMapID,Monster2ID,x2,y2,4,0,-1)
														FightForTreasureBox_MapMonsterTable[RightMapID][2][k] = FastID
													end
												else
													local FastID = FightForTreasureBox_MapMonsterTable[RightMapID][2][k]
													if API_GetMonsterID(FastID) <= 0 then
														local x2,y2
														local Num = 0
														repeat
															Num = Num + 1
															x2 = math.random(M2x1,M2x2)
															y2 = math.random(M2y1,M2y2)
														until not API_IsBlockTile(RightMapID,x2,y2,0) and not ((x2 > M1x1 and x2 < M1x2) and (y2 > M1y1 and y2 < M1y2)) and (x2 > 0 and y2 >0) or Num == 100
														if not API_IsBlockTile(RightMapID,x2,y2,0) then
															local FastID = API_CreateMonster(RightMapID,Monster2ID,x2,y2,4,0,-1)
															FightForTreasureBox_MapMonsterTable[RightMapID][2][k] = FastID
														end
													end
												end
											end
										end
									end
								elseif JinDu == 2 then
									--刷大宝箱
									BoxTable[i].JinDu = JinDu + 1
									BoxTable[i].BoxNum = BoxNum + 1
									if API_GetMonsterID(BoxFastID) <= 0 then
										local BoxX2
										local BoxY2
										repeat
											BoxX2 = math.random(BoxX-10,BoxX+10)
											BoxY2 = math.random(BoxY-10,BoxY+10)
										until not API_IsBlockTile(RightMapID,BoxX2,BoxY2,0)
										BoxFastID = API_CreateMonster(RightMapID,BoxID,BoxX2,BoxY2,BoxD,0,-1)
										BoxTable[i].BoxFastID = BoxFastID
										--反隐形
										API_MonsterAddStatus(BoxFastID,44001,-1)
									end
									for i = 1,4 do
										API_CreateMonster(RightMapID,Monster1ID,BoxX,BoxY,4,0,-1)
									end
									--风向标
									if BoxID == 11938 then
										local Type = 1
										if GLOBAL_FengXiangBiao_DateList[15][Type][1] == nil then
											GLOBAL_FengXiangBiao_DateList[15][Type][1] = 1
										else
											GLOBAL_FengXiangBiao_DateList[15][Type][1] = GLOBAL_FengXiangBiao_DateList[15][Type][1] + 1
										end
									elseif BoxID == 11939 then
										local Type = 2
										if GLOBAL_FengXiangBiao_DateList[15][Type][1] == nil then
											GLOBAL_FengXiangBiao_DateList[15][Type][1] = 1
										else
											GLOBAL_FengXiangBiao_DateList[15][Type][1] = GLOBAL_FengXiangBiao_DateList[15][Type][1] + 1
										end
									--四档待添加
									end
									API_DestroyTriggerG(TriggerID)
								end
							end
						end
					--end
				end
			end
		end
	end
end

function FightForTreasureBox_KillMonster_TimerTriggerCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	--if (math.ceil(Day/7) == 1 or math.ceil(Day/7) == 3) and (Week == 6 or Week == 7) then
	if (Week == 6 or Week == 7) and API_VarDataGetNumber_Ex(1, 0, -2000, 1, 1) == 1 then
		if Hour == 22 and Minute == 0 then
			local BoxTable = FightForTreasureBox_BoxTable
			for i = 1,table.getn(BoxTable) do
				BoxTable[i].JinDu = 0
				BoxTable[i].BoxNum = 0
				local MapID = BoxTable[i].MapID
				--if (MapID == 9 or MapID == 23 or MapID == 10 or MapID == 25 or MapID == 103) or not API_IsBranchServer() then
					local RightMapID = API_GetRightMapID(MapID)
					local Monster1ID = BoxTable[i].Monster1ID
					local Monster1Num = BoxTable[i].Monster1Num
					local Monster2ID = BoxTable[i].Monster2ID
					local Monster2Num = BoxTable[i].Monster2Num
					if API_MapIsValid(RightMapID) and type(FightForTreasureBox_MapMonsterTable[RightMapID]) == 'table' then
						if type(FightForTreasureBox_MapMonsterTable[RightMapID][1]) == 'table' and type(FightForTreasureBox_MapMonsterTable[RightMapID][2]) == 'table' then
							for p = 1,Monster1Num do
								local FastID = FightForTreasureBox_MapMonsterTable[RightMapID][1][p]
								if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
									API_DestroyMonster(FastID)
									FightForTreasureBox_MapMonsterTable[RightMapID][1][p] = nil
								end
							end
							for k = 1,Monster2Num do
								local FastID = FightForTreasureBox_MapMonsterTable[RightMapID][2][k]
								if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
									API_DestroyMonster(FastID)
									FightForTreasureBox_MapMonsterTable[RightMapID][2][k] = nil
								end
							end
						end
					end
				--end
			end
		end
	end
end

function FightForTreasureBox_OpenBox(ActorID,NPCID)
	if FightForTreasureBox_BoxGoodsTable[NPCID] == nil then
		return
	end
	if FightForTreasureBox_PlayOpenLvTable[NPCID] == nil then
		return
	end
	local Min = FightForTreasureBox_PlayOpenLvTable[NPCID].Min
	local Max = FightForTreasureBox_PlayOpenLvTable[NPCID].Max
	local PlayLV = API_GetActorExpLevel(ActorID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local NPCX,NPCY = PublicFun_GetMonsterPosXY(NPCFastID)
	local JuLi = PublicFun_AccountDistance(PlayX,PlayY,NPCX,NPCY)
	if JuLi <= 3 then
		if PlayLV >= Min and PlayLV <= Max then
			local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
			if ConvectionInfo ~= 0 then
				API_ActorSendMsg(ActorID,3,'正在打开中，请稍后')
				API_ResponseEnd()
				API_ResponseClear()
			else
				local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
				local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
				local TimerTriggerID = API_CreateTimerTriggerG(ActorID,NPCFastID,1,62,'FightForTreasureBox_OpenBox_TimerTriggerCallFunc')
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
				local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(FightForTreasureBox_OpenBoxTime)
				API_ActorSendMsg(ActorID,3,'宝箱打开中……，需时'..GLOBAL_ConvectionTimerCN..'秒，打开期间请不要移动，否则将打开失败')
				StatusTimer = (FightForTreasureBox_OpenBoxTime + 1) * 1000
				API_ActorShowProcess(ActorID,StatusTimer,410,360,'打开宝箱')
				API_ActorAddStatus(ActorID,41012,0)
				API_ResponseEnd()
				API_ResponseClear()
			end
		else
			API_ActorSendMsg(ActorID,3,'只有'..Min..'～'..Max..'级玩家才能打开此宝箱')
			API_ResponseEnd()
			API_ResponseClear()
		end
	else
		API_ActorSendMsg(ActorID,3,'距离宝箱太远，靠近点再试试')
		API_ResponseEnd()
		API_ResponseClear()
	end
end

function FightForTreasureBox_OpenBox_TimerTriggerCallFunc(ActorID,NPCFastID)
	if API_ActorIsOnline(ActorID) then
		if API_GetMonsterID(NPCFastID) <= 0 then
			API_ActorSendMsg(ActorID,3,'打开失败，宝箱已被其他玩家开启')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'打开宝箱')
			API_ActorRemoveStatus(ActorID,41012)
			return
		end
		local NPCID = API_GetMonsterID(NPCFastID)
		if API_ActorIsDying(ActorID) then
			API_ActorSendMsg(ActorID,3,'人物死亡，打开失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'打开宝箱')
			API_ActorRemoveStatus(ActorID,41012)
			return
		end
		if FightForTreasureBox_BoxGoodsTable[NPCID] == nil then
			API_ActorSendMsg(ActorID,3,'未知错误，打开失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'打开宝箱')
			API_ActorRemoveStatus(ActorID,41012)
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
			API_ActorSendMsg(ActorID,3,'人物移动，打开失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'打开宝箱')
			API_ActorRemoveStatus(ActorID,41012)
		elseif Time >= FightForTreasureBox_OpenBoxTime then
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorShowProcess(ActorID,0,410,360,'打开宝箱')
			API_ActorRemoveStatus(ActorID,41012)
			--获取NPC位置，掉落奖励
			--local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
			if API_GetMonsterID(NPCFastID) <= 0 then
				API_ActorSendMsg(ActorID,3,'打开失败，宝箱已被其他玩家开启')
				return
			end
			local NPCMapID = API_GetMonsterMap(NPCFastID)
			local NPCMapConfigID = API_GetMapConfigID(NPCMapID)
			local NPCX,NPCY = PublicFun_GetMonsterPosXY(NPCFastID)
			API_DestroyMonster(NPCFastID)
			local ShiQuType = 0
			local ShiQuID = ActorID
			local TeamID = API_GetTeamID(ActorID)
			if TeamID > 0 then
				ShiQuType = 3
				ShiQuID = TeamID
			end
			local Table = FightForTreasureBox_BoxGoodsTable[NPCID]
			for i = 1,FightForTreasureBox_BigBoxGoodsNum do
				local JiangLiTable = {}
				local JiangLiTableGaiLv = math.random(100)
				for j in Table do 
					local Min = Table[j].Min
					local Max = Table[j].Max
					if JiangLiTableGaiLv >= Min and JiangLiTableGaiLv <= Max then
						JiangLiTable = Table[j].Goodslist
						break
					end
				end
				if JiangLiTable ~= nil then
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
							if TreasureNum > 0 then
								API_CreateDropGoods(NPCMapID,NPCX,NPCY,TreasureID,TreasureNum,0,'宝箱争夺之大宝箱掉宝',ShiQuType,ShiQuID,600,60)
							end
							break
						end
					end
				end
			end
			for i = 1,table.getn(FightForTreasureBox_BoxTable) do
				local MapID = FightForTreasureBox_BoxTable[i].MapID
				if MapID == NPCMapConfigID then
					FightForTreasureBox_BoxTable[i].BoxFastID = 0
					FightForTreasureBox_BoxTable[i].JinDu = 0
				end
			end
			--local OpenNum = API_VarDataGetNumber(ActorID,1,19038)
			--API_VarDataSetNumber(ActorID,1,19038,OpenNum+1)
			API_CreateTimerTriggerG(0,0,FightForTreasureBox_TimerTriggerG,3,'FightForTreasureBox_Box_TimerTriggerCallFunc')
			if NPCID == 11938 then
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 7
				if GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] + 1
				end
			elseif NPCID == 11939 then
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 8
				if GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] + 1
				end
			--四档待添加
			end
		else
			Time = Time + 1
			ConvectionInfo = ConvectionSign * 100000000 + TileX * 100000 + TileY * 100 + Time
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
		end
	end
end

--小宝箱打开获得奖励函数
--local OpenNum = API_VarDataGetNumber(ActorID,1,19039) 19061
--API_VarDataSetNumber(ActorID,1,19039,OpenNum+1)
function FightForTreasureBox_OpenBox_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if FightForTreasureBox_XiaoBoxGoodsTable[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效道具')
		return 0
	end
	local NPCID = FightForTreasureBox_XiaoBoxGoodsTable[GoodsID]
	if FightForTreasureBox_BoxGoodsTable[NPCID] == nil then
		API_ActorSendMsg(ActorID,3,'无效道具')
		return 0
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	local PlayOpenYMD = API_VarDataGetNumber(ActorID,1,19061)
	local PlayYear = math.floor(PlayOpenYMD/10000)
	local PlayMonthDay = math.mod(PlayOpenYMD,10000)
	local PlayMonth = math.floor(PlayMonthDay/100)
	local PlayDay = math.mod(PlayMonthDay,100)
	if Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
		API_VarDataSetNumber(ActorID,1,19039,0)
	end
	local OpenBoxNum = API_VarDataGetNumber(ActorID,1,19039)
	if OpenBoxNum >= FightForTreasureBox_OpenBoxNum then
		API_ActorSendMsg(ActorID,3,'您今天打开宝箱次数已达上限，请明天再试试吧')
		return 0
	end
	local HuoLiZhi = API_ActorGetPropNum(ActorID,PD_PROP_HUNGER)
	if HuoLiZhi < FightForTreasureBox_KouChuHuoLiZhi then
		API_ActorSendMsg(ActorID,3,'开启宝箱需要消耗'..FightForTreasureBox_KouChuHuoLiZhi..'点活力值，您活力值不够，请恢复活力值后再试')
		return 0
	end
	if API_ActorGetPackageSize(ActorID) >= 1 then
		local Table = FightForTreasureBox_BoxGoodsTable[NPCID]
		local JiangLiTable = {}
		local JiangLiTableGaiLv = math.random(100)
		for j in Table do 
			local Min = Table[j].Min
			local Max = Table[j].Max
			if JiangLiTableGaiLv >= Min and JiangLiTableGaiLv <= Max then
				JiangLiTable = Table[j].Goodslist
				break
			end
		end
		if JiangLiTable ~= nil then
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
					if API_ActorAddHunger(ActorID,-FightForTreasureBox_KouChuHuoLiZhi) then
						if API_ActorRemoveGoods(ActorID,GoodsID,1,'打开'..API_GetGoodsName(GoodsID)..'拿奖励') then
							API_VarDataSetNumber(ActorID,1,19061,YMD)
							API_VarDataSetNumber(ActorID,1,19039,OpenBoxNum+1)
							local OpenBoxNum2 = API_VarDataGetNumber(ActorID,1,19039)
							if OpenBoxNum2 == OpenBoxNum + 1 then
								if TreasureNum > 0 then
									if OpenBoxNum2 == FightForTreasureBox_OpenBoxNum then
										API_AddActorGoods(ActorID,TreasureID,TreasureNum,'打开'..API_GetGoodsName(GoodsID)..'获得'..TreasureNum..'个 '.. API_GetGoodsName(TreasureID)..'')
										API_ActorSendMsg(ActorID,3,'打开'..API_GetGoodsName(GoodsID)..'获得'..TreasureNum..'个 '.. API_GetGoodsName(TreasureID)..'')
										API_ActorSendMsg(ActorID,7,'打开'..API_GetGoodsName(GoodsID)..'获得'..TreasureNum..'个 '.. API_GetGoodsName(TreasureID)..'，今天打开神秘宝箱次数已达上限')
									else
										API_AddActorGoods(ActorID,TreasureID,TreasureNum,'打开'..API_GetGoodsName(GoodsID)..'获得'..TreasureNum..'个 '.. API_GetGoodsName(TreasureID)..'')
										API_ActorSendMsg(ActorID,3,'打开'..API_GetGoodsName(GoodsID)..'获得'..TreasureNum..'个 '.. API_GetGoodsName(TreasureID)..'')
										API_ActorSendMsg(ActorID,7,'打开'..API_GetGoodsName(GoodsID)..'获得'..TreasureNum..'个 '.. API_GetGoodsName(TreasureID)..'，今天打开神秘宝箱次数还有'..FightForTreasureBox_OpenBoxNum-OpenBoxNum2..'次')
									end
								else
									local PlayJW = API_GetActorPeerageLevel(ActorID)
									if FightForTreasureBox_PlayGongXunNum[PlayJW] ~= nil then
										local GXMin = FightForTreasureBox_PlayGongXunNum[PlayJW].Min
										local GXMax = FightForTreasureBox_PlayGongXunNum[PlayJW].Max
										local AddGX = math.random(GXMin,GXMax)
										local ExploitL = API_GetActorExpLevel(ActorID)
										local expMax = API_GetExploitInfo(ExploitL,3)
										local expNow = API_GetActorCurExp(ActorID)
										local expAddMax = expMax - expNow
										if expAddMax >= AddGX then
											if OpenBoxNum2 == FightForTreasureBox_OpenBoxNum then
												API_ActorAddExp(ActorID,AddGX,0,'打开'..API_GetGoodsName(GoodsID)..'获得'..AddGX..'经验')
												API_ActorSendMsg(ActorID,3,'打开'..API_GetGoodsName(GoodsID)..'获得'..AddGX..'经验')
												API_ActorSendMsg(ActorID,7,'打开'..API_GetGoodsName(GoodsID)..'获得'..AddGX..'经验，今天打开神秘宝箱次数已达上限')
											else
												API_ActorAddExp(ActorID,AddGX,0,'打开'..API_GetGoodsName(GoodsID)..'获得'..AddGX..'经验')
												API_ActorSendMsg(ActorID,3,'打开'..API_GetGoodsName(GoodsID)..'获得'..AddGX..'经验')
												API_ActorSendMsg(ActorID,7,'打开'..API_GetGoodsName(GoodsID)..'获得'..AddGX..'经验，今天打开神秘宝箱次数还有'..FightForTreasureBox_OpenBoxNum-OpenBoxNum2..'次')
											end
										elseif expAddMax == 0 then
											if OpenBoxNum2 == FightForTreasureBox_OpenBoxNum then
												API_ActorSendMsg(ActorID,3,'您的经验达到上限，已无法再获得经验，清尽快升级')
												API_ActorSendMsg(ActorID,7,'您的经验达到上限，已无法再获得经验，清尽快升级，今天打开神秘宝箱次数已达上限')
											else
												API_ActorSendMsg(ActorID,3,'您的经验达到上限，已无法再获得经验，清尽快升级')
												API_ActorSendMsg(ActorID,7,'您的经验达到上限，已无法再获得经验，清尽快升级，今天打开神秘宝箱次数还有'..FightForTreasureBox_OpenBoxNum-OpenBoxNum2..'次')
											end
										else
											if OpenBoxNum2 == FightForTreasureBox_OpenBoxNum then
												API_ActorAddExp(ActorID,expAddMax,0,'打开'..API_GetGoodsName(GoodsID)..'获得'..expAddMax..'经验')
												API_ActorSendMsg(ActorID,3,'打开'..API_GetGoodsName(GoodsID)..'获得'..expAddMax..'经验')
												API_ActorSendMsg(ActorID,7,'打开'..API_GetGoodsName(GoodsID)..'获得'..expAddMax..'经验，今天打开神秘宝箱次数已达上限')
											else
												API_ActorAddExp(ActorID,expAddMax,0,'打开'..API_GetGoodsName(GoodsID)..'获得'..expAddMax..'经验')
												API_ActorSendMsg(ActorID,3,'打开'..API_GetGoodsName(GoodsID)..'获得'..expAddMax..'经验')
												API_ActorSendMsg(ActorID,7,'打开'..API_GetGoodsName(GoodsID)..'获得'..expAddMax..'经验，今天打开神秘宝箱次数还有'..FightForTreasureBox_OpenBoxNum-OpenBoxNum2..'次')
											end
										end
									else
										API_ActorSendMsg(ActorID,3,'居然是一个空的'..API_GetGoodsName(GoodsID)..'，什么也没有获得……')
										API_ActorSendMsg(ActorID,7,'居然是一个空的'..API_GetGoodsName(GoodsID)..'，什么也没有获得……')
									end
								end
								--风向标
								if GoodsID == 88038 then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									local Type = 4
									if GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] + 1
									end
								elseif GoodsID == 88039 then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									local Type = 5
									if GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[15][Type][LaiYuan] + 1
									end
								--四档待添加
								end
							end
						end
					end
					return 1
				end
			end
		end
	else
		API_ActorSendMsg(ActorID,3,'打开'..API_GetGoodsName(GoodsID)..'前，背包中需留一个空位')
		return 0
	end
end
