----------------------------------------------------------------------------------------------------------------
--文件名:   Scp\LUA\Other\ChristmasAndNewYearsDay.lua
--时  间：  2011年12月05日
--创建人：  黄蕾
--版  权:  (C) 腾讯计算机有限公司
--用  途：  英雄岛
--描  叙：	圣诞元旦新玩法：
--          用云游有几率升级蛋，越高级的蛋开出的物品越好
--          云游在商城购买，云游是变身的点券。
--          交互数据204 : 4016~4020
--交互数据  4021-4025
--（-6100至-6200你用这一段吧。此处用-6100，用来存数量与时间）
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
--修 改 人：黄蕾（sofiehuang）
--修改时间：2011年12月12日
--修改内容：1，开放时间修改与指引修改;2增加世界播报的物品；3清楚奖励交互与奖励CD
--修改时间：2011年12月31日
--修改内容：1，修改为新年奖励，2设置幸运值功能。
--修改时间：1，修改过多的世界播报；2休正交互清0的判断ID条件；
--修改时间：2012年1月10日
--修改时间：1，修改宝石
--修改时间：1，全局变量相同的问题。
--修改时间：20120326
--修改内容：4月英雄传承复活节活动，交互数据未从50开始用起
--修改时间：2012年4月23日
--修改内容：5.1活动奖励修改，70
--修改时间：2012年7月3日
--修改内容：5.1活动奖励修改
--修改时间：2012年12月17日
--修改内容：改成2012年的圣诞活动（描叙，奖励，奖励方式，上限30315）
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
--信息定义区
--以下是可配置区 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
----------------------------------------------------------------------------------------------------------------
local nYunYouID = 80818 --云游代金券ID
local nNpcID    = 12374 --npcID

local nHLScrollid = 90012 --英雄复活节活动卷轴ID（由人独立划分数据）
local nHLScrollPICid = 104130 --英雄复活节活动图标ID

--五种蛋的信息表：tChristmasEggs
--tChristmasEggs  = { [1]={道具名字，道具图标，道具ID，道具2ID,道具2图标，道具3ID,道具3图标，道具4ID,道具4图标，道具随机成功率，道具成功标志，间隔字符串，升级道具所需云游数,交互数据，交互成功。}   }70605060
--此次直接用ICON 方式实现的，此表中的物品ID可以暂时不看。
--nRandomRate，方便测试几率以及播报等方式，可以修改此随机率。
local  tChristmasEggs  = {        
	--[1]= {nXinYun=0,nXinYunJiaoHu=4021,nName="第一关",nIcon=104154,nGoodsID= 80637,nGoodsID2= 80641,nIcon2=2328,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 100 ,nSuccess = 1 ,nstring = "  ",nNeedYunYouNum=20  ,nInteractiveData =4016,NextJH=4017,nS = 1 ,},--70
	--[2]= {nXinYun=1,nXinYunJiaoHu=4021,nName="第二关",nIcon=104640,nGoodsID= 80638,nGoodsID2= 80641,nIcon2=2328,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 100,nSuccess = 0 ,nstring = "  ",nNeedYunYouNum=40  ,nInteractiveData =4017,NextJH=4018,nS = 0 ,},--60
	--[3]= {nXinYun=2,nXinYunJiaoHu=4021,nName="第三关",nIcon=2805  ,nGoodsID= 80639,nGoodsID2= 80641,nIcon2=2328,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 100 ,nSuccess = 0 ,nstring = "  ",nNeedYunYouNum=80  ,nInteractiveData =4018,NextJH=4019,nS = 0 ,},--50
	--[4]= {nXinYun=3,nXinYunJiaoHu=4021,nName="第四关",nIcon=2809  ,nGoodsID= 80640,nGoodsID2= 80641,nIcon2=2328,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 100,nSuccess = 0 ,nstring = "  ",nNeedYunYouNum=160 ,nInteractiveData =4019,NextJH=4020,nS = 0 ,},--60
	--[5]= {nXinYun=4,nXinYunJiaoHu=4021,nName="第五关",nIcon=2807  ,nGoodsID= 80642,nGoodsID2= 80641,nIcon2=2328,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 0  ,nSuccess = 0 ,nstring = "  ",nNeedYunYouNum=200 ,nInteractiveData =4020,NextJH=0   ,nS = 0 ,},--0
	[1]= {nXinYun=0,nXinYunJiaoHu=30315,nName="圣蛋",nIcon=2727,nGoodsID= 80637,nGoodsID2= 80641,nIcon2=1066,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 100 ,nSuccess = 1 ,nstring = "  ",nNeedYunYouNum=20  ,nInteractiveData =4016,NextJH=4017,nS = 1 ,},--70
	[2]= {nXinYun=1,nXinYunJiaoHu=30315,nName="飞蛋",nIcon=2728,nGoodsID= 80638,nGoodsID2= 80641,nIcon2=1066,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 100,nSuccess = 0 ,nstring = "  ",nNeedYunYouNum=40  ,nInteractiveData =4017,NextJH=4018,nS = 0 ,},--60
	[3]= {nXinYun=2,nXinYunJiaoHu=30315,nName="彩蛋",nIcon=2729,nGoodsID= 80639,nGoodsID2= 80641,nIcon2=1066,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 100 ,nSuccess = 0 ,nstring = "  ",nNeedYunYouNum=80 ,nInteractiveData =4018,NextJH=4019,nS = 0 ,},--50
	[4]= {nXinYun=3,nXinYunJiaoHu=30315,nName="神蛋",nIcon=2691,nGoodsID= 80640,nGoodsID2= 80641,nIcon2=1066,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 100 ,nSuccess = 0 ,nstring = "  ",nNeedYunYouNum=160 ,nInteractiveData =4019,NextJH=4020,nS = 0 ,},--40
	[5]= {nXinYun=4,nXinYunJiaoHu=30315,nName="缘蛋",nIcon=2692,nGoodsID= 80642,nGoodsID2= 80641,nIcon2=1066,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 0  ,nSuccess = 0 ,nstring = "  ",nNeedYunYouNum=200 ,nInteractiveData =4020,NextJH=0   ,nS = 0 ,},--0
	
	}

--活动时间
local NewYearHuoDong_StartTime = {Year = 2012,Month = 12,Day = 14,Hour = 0,Minute = 0,Second = 0} --12/14/0/0/0
local NewYearHuoDong_EndTime = {Year = 2019,Month = 1,Day = 4,Hour = 0,Minute = 0,Second = 0}--12/1/31/
--联邦TILE坐标
local nLBNpcID_X = 242        
local nLBNpcID_Y = 170
--帝国TILE坐标
local nDGNpcID_X = 209
local nDGNpcID_Y = 206

--每种蛋的物品奖励表
local ChristmasChouJiangTable ={
	[1]={
	   	{GoodsID=80498,GaiLv1=1      ,GaiLv2=1030927,Num=100,BiaoZhi=0,Xinyun=0},
		{GoodsID=80696,GaiLv1=1030928,GaiLv2=2061855,Num=100,BiaoZhi=0,Xinyun=0},
		{GoodsID=80697,GaiLv1=2061856,GaiLv2=2371134,Num=10 ,BiaoZhi=0,Xinyun=0},
		{GoodsID=250  ,GaiLv1=2371135,GaiLv2=2989691,Num=1  ,BiaoZhi=0,Xinyun=0},
		{GoodsID=82034,GaiLv1=2989692,GaiLv2=3144331,Num=1  ,BiaoZhi=0,Xinyun=0},
		{GoodsID=80397,GaiLv1=3144332,GaiLv2=4175259,Num=1  ,BiaoZhi=0,Xinyun=0},
		{GoodsID=80818,GaiLv1=4175260,GaiLv2=4484538,Num=15 ,BiaoZhi=0,Xinyun=0},
		{GoodsID=120  ,GaiLv1=4484539,GaiLv2=5515466,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=209  ,GaiLv1=5515467,GaiLv2=6546394,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=88877,GaiLv1=6546395,GaiLv2=7164951,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=501  ,GaiLv1=7164952,GaiLv2=8195879,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=88991,GaiLv1=8195880,GaiLv2=8350519,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=88992,GaiLv1=8350520,GaiLv2=9381447,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80274,GaiLv1=9381448,GaiLv2=10000000,Num=1,BiaoZhi=0,Xinyun=0},
		
		},
	[2]={
	   	{GoodsID=82004,GaiLv1=1      ,GaiLv2=1156069,Num=10,BiaoZhi=0,Xinyun=0},
		{GoodsID=80696,GaiLv1=1156070,GaiLv2=2312139,Num=150,BiaoZhi=0,Xinyun=0},
		{GoodsID=80697,GaiLv1=2312140,GaiLv2=2890174,Num=15,BiaoZhi=0,Xinyun=0},
		{GoodsID=82034,GaiLv1=2890175,GaiLv2=3275531,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80274,GaiLv1=3275532,GaiLv2=3853566,Num=2,BiaoZhi=0,Xinyun=0},
		{GoodsID=80397,GaiLv1=3853567,GaiLv2=4431601,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=88991,GaiLv1=4431602,GaiLv2=5009636,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80818,GaiLv1=5009637,GaiLv2=5587671,Num=30,BiaoZhi=0,Xinyun=0},
		{GoodsID=75   ,GaiLv1=5587672,GaiLv2=5876689,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80381,GaiLv1=5876690,GaiLv2=6107903,Num=5,BiaoZhi=0,Xinyun=0},
		{GoodsID=80382,GaiLv1=6107904,GaiLv2=6339117,Num=5,BiaoZhi=0,Xinyun=0},
		{GoodsID=39602,GaiLv1=6339118,GaiLv2=6628135,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=89118,GaiLv1=6628136,GaiLv2=7013492,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=82034,GaiLv1=7013493,GaiLv2=7398849,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=929  ,GaiLv1=7398850,GaiLv2=7784206,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80689,GaiLv1=7784207,GaiLv2=8169563,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80686,GaiLv1=8169564,GaiLv2=8554920,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=250  ,GaiLv1=8554921,GaiLv2=8843938,Num=3,BiaoZhi=0,Xinyun=0},
		{GoodsID=250  ,GaiLv1=8843939,GaiLv2=10000000,Num=2,BiaoZhi=0,Xinyun=0},
		},  
	[3]={
	  	{GoodsID=75   ,GaiLv1=1     ,GaiLv2=232558,Num=2,BiaoZhi=0,Xinyun=0},
		{GoodsID=31101,GaiLv1=232559,GaiLv2=697675,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80686,GaiLv1=697676,GaiLv2=1162792,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80689,GaiLv1=1162793,GaiLv2=1627909,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=88991,GaiLv1=1627910,GaiLv2=2093026,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=89118,GaiLv1=2093027,GaiLv2=2558143,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=82034,GaiLv1=2558144,GaiLv2=3023260,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=929  ,GaiLv1=3023261,GaiLv2=3488377,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=75   ,GaiLv1=3488378,GaiLv2=3953494,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80689,GaiLv1=3953495,GaiLv2=4418611,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80686,GaiLv1=4418612,GaiLv2=4883728,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=120  ,GaiLv1=4883729,GaiLv2=5348845,Num=5,BiaoZhi=0,Xinyun=0},
		{GoodsID=209  ,GaiLv1=5348846,GaiLv2=5813962,Num=5,BiaoZhi=0,Xinyun=0},
		{GoodsID=39501,GaiLv1=5813963,GaiLv2=6124040,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39502,GaiLv1=6124041,GaiLv2=6434118,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39510,GaiLv1=6434119,GaiLv2=6744196,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39513,GaiLv1=6744197,GaiLv2=7054274,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39516,GaiLv1=7054275,GaiLv2=7364352,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39519,GaiLv1=7364353,GaiLv2=7674430,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39522,GaiLv1=7674431,GaiLv2=7984508,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39525,GaiLv1=7984509,GaiLv2=8294586,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39528,GaiLv1=8294587,GaiLv2=8604664,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80951,GaiLv1=8604665,GaiLv2=8837223,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80952,GaiLv1=8837224,GaiLv2=9069782,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80387,GaiLv1=9069783,GaiLv2=9534899,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=88910,GaiLv1=9534900,GaiLv2=10000000,Num=1,BiaoZhi=0,Xinyun=0},

		},
	[4]={
	   
		{GoodsID=82032,GaiLv1=1,GaiLv2=167457,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80954,GaiLv1=167458,GaiLv2=234440,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=82035,GaiLv1=234441,GaiLv2=301423,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=929  ,GaiLv1=301424,GaiLv2=636338,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=929  ,GaiLv1=636339,GaiLv2=971253,Num=2,BiaoZhi=0,Xinyun=0},
		{GoodsID=80832,GaiLv1=971254,GaiLv2=1306168,Num=20,BiaoZhi=0,Xinyun=0},
		{GoodsID=80833,GaiLv1=1306169,GaiLv2=1641083,Num=20,BiaoZhi=0,Xinyun=0},
		{GoodsID=89118,GaiLv1=1641084,GaiLv2=1808541,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=88171,GaiLv1=1808542,GaiLv2=1875524,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80621,GaiLv1=1875525,GaiLv2=2210439,Num=5,BiaoZhi=0,Xinyun=0},
		{GoodsID=80849,GaiLv1=2210440,GaiLv2=2377897,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31252,GaiLv1=2377898,GaiLv2=2601174,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31242,GaiLv1=2601175,GaiLv2=2824451,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31244,GaiLv1=2824452,GaiLv2=3047728,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31249,GaiLv1=3047729,GaiLv2=3271005,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31250,GaiLv1=3271006,GaiLv2=3494282,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31251,GaiLv1=3494283,GaiLv2=3717559,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31228,GaiLv1=3717560,GaiLv2=3940836,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31226,GaiLv1=3940837,GaiLv2=4164113,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31227,GaiLv1=4164114,GaiLv2=4387390,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31224,GaiLv1=4387391,GaiLv2=4610667,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31221,GaiLv1=4610668,GaiLv2=4833944,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31223,GaiLv1=4833945,GaiLv2=5057221,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31253,GaiLv1=5057222,GaiLv2=5280498,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31225,GaiLv1=5280499,GaiLv2=5503775,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31222,GaiLv1=5503776,GaiLv2=5727052,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80197,GaiLv1=5727053,GaiLv2=6061967,Num=10,BiaoZhi=0,Xinyun=0},
		{GoodsID=80196,GaiLv1=6061968,GaiLv2=6396882,Num=20,BiaoZhi=0,Xinyun=0},
		{GoodsID=32101,GaiLv1=6396883,GaiLv2=6508521,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=32001,GaiLv1=6508522,GaiLv2=6620160,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=968  ,GaiLv1=6620161,GaiLv2=6955075,Num=5,BiaoZhi=0,Xinyun=0},
		{GoodsID=80405,GaiLv1=6955076,GaiLv2=6988567,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80409,GaiLv1=6988568,GaiLv2=7030432,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80383,GaiLv1=7030433,GaiLv2=7365347,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80384,GaiLv1=7365348,GaiLv2=7700262,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=80181,GaiLv1=7700263,GaiLv2=8035177,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=76   ,GaiLv1=8035178,GaiLv2=8146816,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=88171,GaiLv1=8146817,GaiLv2=8481731,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39504,GaiLv1=8481732,GaiLv2=8565460,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39507,GaiLv1=8565461,GaiLv2=8582206,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=39508,GaiLv1=8582207,GaiLv2=8598952,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=39509,GaiLv1=8598953,GaiLv2=8615698,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=39512,GaiLv1=8615699,GaiLv2=8632444,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=39518,GaiLv1=8632445,GaiLv2=8649190,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=39521,GaiLv1=8649191,GaiLv2=8665936,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=39524,GaiLv1=8665937,GaiLv2=8682682,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=39527,GaiLv1=8682683,GaiLv2=8699428,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=39530,GaiLv1=8699429,GaiLv2=8716174,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=11523,GaiLv1=8716175,GaiLv2=8727338,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=11525,GaiLv1=8727339,GaiLv2=8738502,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=11526,GaiLv1=8738503,GaiLv2=8749666,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=89137,GaiLv1=8749667,GaiLv2=8753016,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=89142,GaiLv1=8753017,GaiLv2=8756366,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=89147,GaiLv1=8756367,GaiLv2=8759716,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=88125,GaiLv1=8759717,GaiLv2=8763066,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=88126,GaiLv1=8763067,GaiLv2=8766416,Num=1,BiaoZhi=0,Xinyun=100},
		{GoodsID=11652,GaiLv1=8766417,GaiLv2=8771998,Num=1,BiaoZhi=0,Xinyun=60},
		{GoodsID=11653,GaiLv1=8771999,GaiLv2=8777580,Num=1,BiaoZhi=0,Xinyun=60},
		{GoodsID=11654,GaiLv1=8777581,GaiLv2=8783162,Num=1,BiaoZhi=0,Xinyun=60},
		{GoodsID=11655,GaiLv1=8783163,GaiLv2=8788744,Num=1,BiaoZhi=0,Xinyun=60},
		{GoodsID=11631,GaiLv1=8788745,GaiLv2=8794326,Num=1,BiaoZhi=0,Xinyun=60},
		{GoodsID=11632,GaiLv1=8794327,GaiLv2=8799908,Num=1,BiaoZhi=0,Xinyun=60},
		{GoodsID=11633,GaiLv1=8799909,GaiLv2=8805490,Num=1,BiaoZhi=0,Xinyun=60},
		{GoodsID=39505,GaiLv1=8805491,GaiLv2=8889219,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39506,GaiLv1=8889220,GaiLv2=8972948,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39511,GaiLv1=8972949,GaiLv2=9028768,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39514,GaiLv1=9028769,GaiLv2=9140407,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39517,GaiLv1=9140408,GaiLv2=9252046,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39520,GaiLv1=9252047,GaiLv2=9363685,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39523,GaiLv1=9363686,GaiLv2=9475324,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39526,GaiLv1=9475325,GaiLv2=9542307,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39529,GaiLv1=9542308,GaiLv2=9609290,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=88886,GaiLv1=9609291,GaiLv2=9642782,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=88885,GaiLv1=9642783,GaiLv2=9665110,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=902  ,GaiLv1=9665111,GaiLv2=10000000,Num=2,BiaoZhi=0,Xinyun=0},

		},
	[5]={
		{GoodsID=89175,GaiLv1=1,GaiLv2=19085,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=89180,GaiLv1=19086,GaiLv2=38171,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=89185,GaiLv1=38172,GaiLv2=57257,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=89236,GaiLv1=57258,GaiLv2=76343,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=89241,GaiLv1=76344,GaiLv2=95429,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=89246,GaiLv1=95430,GaiLv2=127239,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=11631,GaiLv1=127240,GaiLv2=159049,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=11632,GaiLv1=159050,GaiLv2=190859,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=11633,GaiLv1=190860,GaiLv2=222669,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=11634,GaiLv1=222670,GaiLv2=254479,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=11331,GaiLv1=254480,GaiLv2=286289,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=11334,GaiLv1=286290,GaiLv2=318099,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31049,GaiLv1=318100,GaiLv2=320485,Num=1,BiaoZhi=0,Xinyun=800},
		{GoodsID=31046,GaiLv1=320486,GaiLv2=326847,Num=1,BiaoZhi=0,Xinyun=500},
		{GoodsID=11619,GaiLv1=326848,GaiLv2=345933,Num=1,BiaoZhi=0,Xinyun=300},
		{GoodsID=11620,GaiLv1=345934,GaiLv2=365019,Num=1,BiaoZhi=0,Xinyun=300},
		{GoodsID=11621,GaiLv1=365020,GaiLv2=384105,Num=1,BiaoZhi=0,Xinyun=300},
		{GoodsID=11622,GaiLv1=384106,GaiLv2=403191,Num=1,BiaoZhi=0,Xinyun=300},
		{GoodsID=76,GaiLv1=403192,GaiLv2=441362,Num=1,BiaoZhi=0,Xinyun=200},
		{GoodsID=9507,GaiLv1=441363,GaiLv2=536790,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=929,GaiLv1=536791,GaiLv2=758492,Num=3,BiaoZhi=0,Xinyun=0},
		{GoodsID=11656,GaiLv1=758493,GaiLv2=778493,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=11657,GaiLv1=778494,GaiLv2=798494,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=11658,GaiLv1=798495,GaiLv2=818495,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=11659,GaiLv1=818496,GaiLv2=838496,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=11660,GaiLv1=838497,GaiLv2=858497,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=11661,GaiLv1=858498,GaiLv2=878498,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=11662,GaiLv1=878499,GaiLv2=898499,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=11663,GaiLv1=898500,GaiLv2=918500,Num=1,BiaoZhi=0,Xinyun=400},
		{GoodsID=11335,GaiLv1=918501,GaiLv2=1157069,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=11336,GaiLv1=1157070,GaiLv2=1395638,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=11523,GaiLv1=1395639,GaiLv2=1459257,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=11524,GaiLv1=1459258,GaiLv2=1522876,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=11526,GaiLv1=1522877,GaiLv2=1586495,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=588,GaiLv1=1586496,GaiLv2=2063633,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=31025,GaiLv1=2063634,GaiLv2=2111347,Num=1,BiaoZhi=0,Xinyun=300},
		{GoodsID=40064,GaiLv1=2111348,GaiLv2=2747530,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=40065,GaiLv1=2747531,GaiLv2=3129240,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=40095,GaiLv1=3129241,GaiLv2=4083515,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=88589,GaiLv1=4083516,GaiLv2=4719698,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=82032,GaiLv1=4719699,GaiLv2=5673973,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=88877,GaiLv1=5673974,GaiLv2=6628248,Num=10,BiaoZhi=0,Xinyun=0},
		{GoodsID=39507,GaiLv1=6628249,GaiLv2=6723676,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39508,GaiLv1=6723677,GaiLv2=6819104,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39509,GaiLv1=6819105,GaiLv2=6914532,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39512,GaiLv1=6914533,GaiLv2=7009960,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39518,GaiLv1=7009961,GaiLv2=7105388,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39521,GaiLv1=7105389,GaiLv2=7200816,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39524,GaiLv1=7200817,GaiLv2=7296244,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39527,GaiLv1=7296245,GaiLv2=7391672,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=39530,GaiLv1=7391673,GaiLv2=7487100,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=89199,GaiLv1=7487101,GaiLv2=8441375,Num=5,BiaoZhi=0,Xinyun=0},
		{GoodsID=89199,GaiLv1=8441376,GaiLv2=9395650,Num=5,BiaoZhi=0,Xinyun=0},
		{GoodsID=89199,GaiLv1=9395651,GaiLv2=9491078,Num=5,BiaoZhi=0,Xinyun=0},
		{GoodsID=89199,GaiLv1=9491079,GaiLv2=9586506,Num=5,BiaoZhi=0,Xinyun=0},
		{GoodsID=89199,GaiLv1=9586507,GaiLv2=9681934,Num=5,BiaoZhi=0,Xinyun=0},
		{GoodsID=88888,GaiLv1=9681935,GaiLv2=9872789,Num=1,BiaoZhi=0,Xinyun=0},
		{GoodsID=88887,GaiLv1=9872790,GaiLv2=10000000,Num=1,BiaoZhi=0,Xinyun=0},

		}
}
--鼠标提示显示坐标(手指头，像素坐标)
local THandTile={
	[1]={nX=250 ,nY=250},
	[2]={nX=280 ,nY=550},
	[3]={nX=360 ,nY=550},
	[4]={nX=440 ,nY=550},
	[5]={nX=520 ,nY=550},
	}
	
--频道广播物品ID表
--交互-6100 （23开始用起）
--CDData表示时间数据交互值；Data表示物品数量的存储交互值
--101存时间
local tBroadcastGoods ={ 
	       
	       --[31040]={nGoodsID=31040,nMax= 999,Data=23,CDData=31,CDTime=30,},--年兔宝宝卡
	       -- [31031]={nGoodsID=31031,nMax= 999,Data=24,CDData=32,CDTime=30,},--足球宝宝卡
	       -- [31038]={nGoodsID=31038,nMax= 3  ,Data=25,CDData=33,CDTime=30,},--恶魔宝宝卡
	       -- [31039]={nGoodsID=31039,nMax= 2  ,Data=26,CDData=34,CDTime=30,},--雪女宝宝卡
	       -- [31024]={nGoodsID=31024,nMax= 5  ,Data=27,CDData=35,CDTime=30,},--火龙宝宝卡
	        
	        [11335]={nGoodsID=11335,nMax= 5  ,Data=28,CDData=36,CDTime=30,},--人马刀斧手卡
	        [11336]={nGoodsID=11336,nMax= 5  ,Data=29,CDData=37,CDTime=30,},--人马祭祀卡
	        [31029]={nGoodsID=31029,nMax= 5  ,Data=30,CDData=38,CDTime=30,},--人马狙击手
	        
	        [11619]={nGoodsID=11619,nMax= 2  ,Data=32,CDData=47,CDTime=0,},--圣诞礼帽[2013][女](每天二件）
	        [11620]={nGoodsID=11620,nMax= 2  ,Data=33,CDData=40,CDTime=0,},--圣诞礼服[2013][女](每天二件）
	        [11621]={nGoodsID=11621,nMax= 2  ,Data=37,CDData=44,CDTime=0,},--圣诞礼帽[2013][男](每天二件）
	        [11622]={nGoodsID=11622,nMax= 2  ,Data=38,CDData=45,CDTime=0,},--圣诞礼服[2013][男](每天二件）
	  
	       -- [11537]={nGoodsID=11537,nMax= 3  ,Data=32,CDData=47,CDTime=0,},--狂野牛仔帽[黄金男装](每天三件）
	       -- [11538]={nGoodsID=11538,nMax= 3  ,Data=33,CDData=40,CDTime=0,},--狂野牛仔服[黄金男装](每天三件）
	       -- [31024]={nGoodsID=31024,nMax= 2  ,Data=34,CDData=41,CDTime=0,},--火龙宝宝卡（每日一个）
	       -- [31038]={nGoodsID=31038,nMax= 2  ,Data=35,CDData=42,CDTime=0,},--恶魔宝宝卡（每日一个）
	       -- [31025]={nGoodsID=31025,nMax= 3  ,Data=36,CDData=43,CDTime=0,},--小塔夫卡（每日1个）
	       -- [11539]={nGoodsID=11539,nMax= 3  ,Data=37,CDData=44,CDTime=0,},--狂野牛仔帽[黄金女装](每天三件）
	       -- [11540]={nGoodsID=11540,nMax= 3  ,Data=38,CDData=45,CDTime=0,},--狂野牛仔服[[黄金女装](每天三件）
	        
	        [89175]={nGoodsID=89175,nMax= 5  ,Data=49,CDData=50,CDTime=0,},--圣盾英雄秘籍【物理】(每天一本） 
	        [89180]={nGoodsID=89180,nMax= 5  ,Data=51,CDData=52,CDTime=0,},--元素英雄秘籍【魔法】(每天一本）
	        [89185]={nGoodsID=89185,nMax= 5  ,Data=53,CDData=54,CDTime=0,},--炼金英雄秘籍【火药】(每天一本）
            [89236]={nGoodsID=89236,nMax= 5  ,Data=55,CDData=56,CDTime=0,},--恶魔宝宝卡（每日1个）
	        [89241]={nGoodsID=89241,nMax= 5  ,Data=57,CDData=58,CDTime=0,},--火龙宝宝卡（每日1个）
	        [89246]={nGoodsID=89246,nMax= 5  ,Data=59,CDData=60,CDTime=0,},--恶魔宝宝卡（每日1个）
	        
	        [31025]={nGoodsID=31025,nMax= 1  ,Data=61,CDData=62,CDTime=0,},--小塔夫卡（每日1个）
	        
	        ---[31044]={nGoodsID=31044,nMax= 1  ,Data=71,CDData=72,CDTime=0,},--护士宝宝卡
	        [31046]={nGoodsID=31046,nMax= 1  ,Data=71,CDData=72,CDTime=0,},--炎龙宝宝卡.
	        [31049]={nGoodsID=31049,nMax= 1  ,Data=39,CDData=72,CDTime=0,},--凤凰宝宝卡 雪女宝宝卡替换射手吉奥宝宝卡
	        [11656]={nGoodsID=11656,nMax= 5  ,Data=71,CDData=72,CDTime=0,},--凤凰宝宝卡.
	        [11657]={nGoodsID=11657,nMax= 5  ,Data=71,CDData=72,CDTime=0,},--佩罗恩宝宝卡
	        [11658]={nGoodsID=11658,nMax= 5  ,Data=71,CDData=72,CDTime=0,},--天使宝宝卡
	        [11659]={nGoodsID=11659,nMax= 5  ,Data=71,CDData=72,CDTime=0,},--堕天使宝宝卡
	        [11660]={nGoodsID=11660,nMax= 5  ,Data=71,CDData=72,CDTime=0,},--恶魔宝宝卡.
	        [11661]={nGoodsID=11661,nMax= 5  ,Data=71,CDData=72,CDTime=0,},--克苏恩宝宝卡
	        [11662]={nGoodsID=11662,nMax= 5  ,Data=71,CDData=72,CDTime=0,},--美美沙宝宝卡
	        [11663]={nGoodsID=11663,nMax= 5  ,Data=71,CDData=72,CDTime=0,},--火龙宝宝卡
	        --[31022]={nGoodsID=31022,nMax= 1  ,Data=39,CDData=46,CDTime=2880,},--凤凰宝宝卡 
	            
             }
--蓝色广播的物品
--local TBlueGoodsID ={31252,31242,31244,31249,31250,31251,31228,31253,31227,31020,31021,31023,31025};--圣诞
--local TBlueGoodsID ={39507,39508,39509,39512,39518,39521,39524,39527,39530,31027,31028,31029,9507,88888,88887,};
--local TBlueGoodsID ={39507,39508,39509,39512,39518,39521,39524,39527,39530,31027,31028,31029,89137,89142,89147,31022,31046,9507,31024,31038,31025,88888,88887,};--此是英雄技能书世界广播
local TBlueGoodsID ={  39507,39508,39509,39512,39518,39521,39524,39527,39530,31027,31028,31029,89137,89142,89147,31049,31046,89175,89180,89185,11619,11620,11621,11622,9507,31025,88888,88887,89175,89180,89185,89236,89241,89246,11335,11336,11523,11524,11525,11526,11652,11653,11654,11655,11631,11632,11633,11634,11330,11331,11332,11333,11334,11656,11657,11658,11659,11660,11661,11662,11663,}
--特殊处理的奖励表

--可配置区到这里结束 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑


---------------------------------------------------------------------------------------------------------------
--功能区
---------------------------------------------------------------------------------------------------------------
--创建NPC
if API_GetServerID() == 1 then
	if NewYear_LoadingTimeTriggerGIDSofie ~= nil then
		API_DestroyTriggerG(NewYear_LoadingTimeTriggerGIDSofie)
	end
	NewYear_LoadingTimeTriggerGIDSofie = API_CreateTimerTriggerG(0,0,60,1,'HL_NewYearHuoDongServerOpen')
end

function HL_NewYearHuoDongServerOpen(Param1,Param2)
	if API_GetServerID() == 1 then
		local StartTimeTable = NewYearHuoDong_StartTime
		local EndTimeTable = NewYearHuoDong_EndTime
		local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
		local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
		if nShiFouStart > 0 then
			--活动未开始
			NewYearFuShen_DestroyNPC2012()
			if NewYearHuoDong_StartDateTimeTriggerGID2012 == nil then
				NewYearHuoDong_StartDateTimeTriggerGID2012 = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'NewYearFuShen_CreateNPC2012')
			else
				API_DestroyTriggerG(NewYearHuoDong_StartDateTimeTriggerGID2012)
				NewYearHuoDong_StartDateTimeTriggerGID2012 = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'NewYearFuShen_CreateNPC2012')
			end
			if NewYearHuoDong_EndDateTimeTriggerGID2012 ~= nil then
				API_DestroyTriggerG(NewYearHuoDong_EndDateTimeTriggerGID2012)
			end
		elseif nShiFouStart <= 0 and nShiFouEnd > 0 then
			--活动开始
			NewYearFuShen_CreateNPC2012()
			if NewYearHuoDong_StartDateTimeTriggerGID2012 ~= nil then
				API_DestroyTriggerG(NewYearHuoDong_StartDateTimeTriggerGID2012)
			end
		elseif nShiFouEnd <= 0 then
			--活动结束
			NewYearFuShen_DestroyNPC2012()
			if NewYearHuoDong_StartDateTimeTriggerGID2012 ~= nil then
				API_DestroyTriggerG(NewYearHuoDong_StartDateTimeTriggerGID2012)
			end
			if NewYearHuoDong_EndDateTimeTriggerGID2012 ~= nil then
				API_DestroyTriggerG(NewYearHuoDong_EndDateTimeTriggerGID2012)
			end
		end
	end
end
function NewYearFuShen_CreateNPC2012()
	--创建帝国活动npc
	if API_GetServerID() == 1 then
		if FuShen_DGNPCFastID1sofie == nil then
			FuShen_DGNPCFastID1sofie = API_CreateMonsterEx(1,nNpcID,nDGNpcID_X,nDGNpcID_Y,4,0,-1,1)
		else
			if API_GetMonsterID(FuShen_DGNPCFastID1sofie) > 0 then
				API_DestroyMonster(FuShen_DGNPCFastID1sofie)
			end
			FuShen_DGNPCFastID1sofie = API_CreateMonsterEx(1,nNpcID,nDGNpcID_X,nDGNpcID_Y,4,0,-1,1)
		end
	end
	--创建联邦活动npc
	if API_GetServerID() == 1 then
		if FuShen_LBNPCFastID1sofie == nil then
			FuShen_LBNPCFastID1sofie = API_CreateMonsterEx(2,nNpcID,nLBNpcID_X,nLBNpcID_Y,4,0,-1,1)
		else
			if API_GetMonsterID(FuShen_LBNPCFastID1sofie) > 0 then
				API_DestroyMonster(FuShen_LBNPCFastID1sofie)
			end
			FuShen_LBNPCFastID1sofie = API_CreateMonsterEx(2,nNpcID,nLBNpcID_X,nLBNpcID_Y,4,0,-1,1)
		end
	end
	
	local StartTimeTable = NewYearHuoDong_StartTime
	local EndTimeTable = NewYearHuoDong_EndTime
	--创结束触发器
	if ChristmasParty_EndDateTimeTriggerGIDSOFIE == nil then
		ChristmasParty_EndDateTimeTriggerGIDSOFIE = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'NewYearFuShen_DestroyNPC2012')
	else
		API_DestroyTriggerG(ChristmasParty_EndDateTimeTriggerGIDSOFIE)
		ChristmasParty_EndDateTimeTriggerGIDSOFIE = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'NewYearFuShen_DestroyNPC2012')
	end
end

function NewYearFuShen_DestroyNPC2012()
	--删除帝国活动npc
	if FuShen_DGNPCFastID1sofie ~= nil then
		if API_GetMonsterID(FuShen_DGNPCFastID1sofie) > 0 then
			API_DestroyMonster(FuShen_DGNPCFastID1sofie)
		end
	end
	--删除联邦活动npc
	if FuShen_LBNPCFastID1sofie ~= nil then
		if API_GetMonsterID(FuShen_LBNPCFastID1sofie) > 0 then
			API_DestroyMonster(FuShen_LBNPCFastID1sofie)
		end
	end
end

--创建触发（某些奖励的特殊物品上限的时间触发器）
if API_GetServerID() == 1 then
	if NewYear_ZaDanZhuChengJiangLiChongZhi ~= nil then
		API_DestroyTriggerG(NewYear_ZaDanZhuChengJiangLiChongZhi)
	end
	
	NewYear_ZaDanZhuChengJiangLiChongZhi = API_CreateTimerTriggerG(0,0,120,-1,'MeiriHuoDong_ShuJuQingChu')
	
end

-----------------------------------------------------------------------------------------------------------------
--卷轴加载
-----------------------------------------------------------------------------------------------------------------

--登入地图
function HL_EggsOnLogin(ActorID)

	--API_Trace('调用HL_EggsOnLogin')
	local ActorID = API_RequestGetActorID()
	local StartTimeTable = NewYearHuoDong_StartTime
	local EndTimeTable = NewYearHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		API_RemoveTaskScroll(ActorID,nHLScrollid)
		--API_AddTaskScroll(ActorID,nHLScrollid,nHLScrollPICid,'HL_2011SD_ClickEggs')
		API_AddTaskScrollEx(ActorID,nHLScrollid,nHLScrollPICid,'HL_2011SD_ClickEggs', 1)
	elseif nShiFouEnd <= 0 then
		API_RemoveTaskScroll(ActorID,nHLScrollid)
	end
	
	
		
end
function HL_EggsOnLoginMap(ActorID)
	
	local ActorID = API_RequestGetActorID()
	local StartTimeTable = NewYearHuoDong_StartTime
	local EndTimeTable = NewYearHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		API_RemoveTaskScroll(ActorID,nHLScrollid)
		API_AddTaskScroll(ActorID,nHLScrollid,nHLScrollPICid,'HL_2011SD_ClickEggs')
		--API_AddTaskScrollEx(ActorID,nHLScrollid,nHLScrollPICid,'HL_2011SD_ClickEggs', 1)
	elseif nShiFouEnd <= 0 then
		API_RemoveTaskScroll(ActorID,nHLScrollid)
	end
end
--登出地图
function HL_EggsOnLoginOut(ActorID)
	
	local ActorID = API_RequestGetActorID()
	API_RemoveTaskScroll(ActorID,nHLScrollid)
end



-----------------------------------------------------------------------------------------------------------------

--点击NPC
function HL_2011SD_ClickEggs(ActorID, NPCID,XuanZe,Num)

	local ActorID = ActorID or API_RequestGetActorID(); 
	--云游物品ID是80818；身上云游
	local nYunYouNum = API_ActorGetGoodsNum(ActorID,80818)
	--打开窗口对应的内容
	local XuanZe = XuanZe or API_RequestGetNumber(1)
	local Num = Num or API_RequestGetNumber(2)
	
	if XuanZe == 90012 then
		XuanZe = 0
	end
	
	local StartTimeTable = NewYearHuoDong_StartTime
	local EndTimeTable = NewYearHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	--加了时间判断界面显示
	if nShiFouEnd <= 0 then
		--API_Trace('nXinYun='..nShiFouEnd)
		API_RemoveTaskScroll(ActorID,nHLScrollid)
		API_ResponseWrite('<name>节日大使</name>')       	
		API_ResponseWrite('<text></text><br><br><br>')
		API_ResponseWrite('<text></text><text color="255,0,255">该活动已经结束。</text>')
		API_ResponseWrite('<br><br><a>确定</a>')
	else
	
	if XuanZe == 0 then
		--根据蛋的标志判断显示条件
		API_ResponseWrite('<name>节日大使</name>')       	
		API_ResponseWrite('<text></text><br><br><br>')		   
		for i = 1,table.getn(tChristmasEggs) do
			local nXinYun = tChristmasEggs[i].nXinYun;
			local nXinYunJiaoHu = tChristmasEggs[i].nXinYunJiaoHu;
			local nName = tChristmasEggs[i].nName;
			local nstring = tChristmasEggs[i].nstring;
			local nGoodsID =  tChristmasEggs[i].nGoodsID;
			local nGoodsID2 =  tChristmasEggs[i].nGoodsID2;
			local nGoodsID3 =  tChristmasEggs[i].nGoodsID3;
			local nGoodsID4 =  tChristmasEggs[i].nGoodsID4;
			local nRandomRate =  tChristmasEggs[i].nRandomRate;
			local nSuccess =  tChristmasEggs[i].nSuccess;
			local nNeedYunYouNum =  tChristmasEggs[i].nNeedYunYouNum;
			local nInteractiveData =  tChristmasEggs[i].nInteractiveData;
			local nS =  tChristmasEggs[i].nS;
			local nIcon = tChristmasEggs[i].nIcon;
			local nIcon2 = tChristmasEggs[i].nIcon2;
			local nIcon3 = tChristmasEggs[i].nIcon3;
			local nIcon4 = tChristmasEggs[i].nIcon4;
			-- 判断角色交互
			local JiaoHu = API_VarDataGetNumber( ActorID, 1, nInteractiveData)
			--角色个人幸运交互
			local XinYunJiaoHu = API_VarDataGetNumber( ActorID, 1, nXinYunJiaoHu)
			
			if nS == 1 or JiaoHu == 1 then 
				--图标显示方式
				API_ResponseWrite('<img srcres="'..nIcon..'" tip="*'..nName..'*\n---\n云游券：'..nNeedYunYouNum..'\n---" href="HL_2011SD_ClickEggs?1=1&2='..i..'">')
				--API_ResponseWrite('<img srcres="'..nIcon..'" tip="*'..nName..'*\n---\n云游券：'..nNeedYunYouNum..'\n---" href="HL_ClickEggs?1=1&2='..i..'">')
				if i<5 then
					API_ResponseWrite('<img srcres="'..nIcon3..'" >')
				end
				--道具显示方式
				--API_ResponseWrite('<img srcgd="'..nGoodsID..'" tipgd="'..nGoodsID..'" href="HL_ClickEggs?1=1&2='..i..'">')
				--API_ResponseWrite('<img srcgd="'..nGoodsID3..'" tipgd="'..nGoodsID3..'" >')
				API_ResponseWrite('<text> '..nstring..'</text>')
			else
				--道具显示方式
				--API_ResponseWrite('<img srcgd="'..nGoodsID2..'" tipgd="'..nGoodsID2..'" >')
				
				--图标显示方式
				--API_ResponseWrite('<img srcres="'..nIcon2..'" tip="未开启的关卡" >')
				API_ResponseWrite('<img srcres="'..nIcon2..'" tip="未点亮的蛋" >')
				if i<5 then
					API_ResponseWrite('<img srcres="'..nIcon4..'" >')
				end
				API_ResponseWrite('<text> '..nstring..'</text>')
			end
	
		end
		--此是复活节活动
		--API_ResponseWrite('<br><br><text>消耗云游闯关获得奖励的同时有几率开启高级关卡，最高级的关卡有很大机会开到武僧，海贼，各种付费英雄技能书哦。</text>')
		--API_ResponseWrite('<text>                </text><br><br>')
		--此是五一节活动
		API_ResponseWrite('<br><br><text>消耗云游开蛋获得奖励的同时有几率升级蛋，最高级的蛋有很大机会开到新推出的射手吉奥，新英雄各种高级货哦。</text>')
		API_ResponseWrite('<text>                </text><br><br><br>')
		API_ResponseWrite('<a>关闭</a>')
		API_ResponseFlush(ActorID)
	elseif XuanZe == 1 then   
		--判断传进来的标志是否正确
		if tChristmasEggs[Num] ~= nil then
			--取出表里对应的参数
			local nXinYun = tChristmasEggs[Num].nXinYun;
			--API_Trace('nXinYun='..nXinYun)
			local nXinYunJiaoHu = tChristmasEggs[Num].nXinYunJiaoHu;
			local nName = tChristmasEggs[Num].nName;
			local nstring = tChristmasEggs[Num].nstring;
			local nRandomRate =  tChristmasEggs[Num].nRandomRate;
			local nSuccess =  tChristmasEggs[Num].nSuccess;
			local nNeedYunYouNum =  tChristmasEggs[Num].nNeedYunYouNum;
			local nInteractiveData =  tChristmasEggs[Num].nInteractiveData;
			local nS =  tChristmasEggs[Num].nS;
			local NextJH = tChristmasEggs[Num].NextJH
			--判断交互是否为1
			local JiaoHu = API_VarDataGetNumber( ActorID, 1, nInteractiveData)
			--角色个人幸运交互
			local XinYunJiaoHu = API_VarDataGetNumber( ActorID, 1, nXinYunJiaoHu)
			--API_Trace('XinYunJiaoHu='..XinYunJiaoHu)
			--如果是1
			if nS == 1 or JiaoHu == 1 then
				
				if nYunYouNum >= nNeedYunYouNum then
						--背包判断写死了固定的背包空间。
						if  API_ActorGetPackageSize(ActorID) >= 1 then
							--重新设置这个交互为0 测试注释
							API_VarDataSetNumber( ActorID, 1, nInteractiveData, 0)
							--设置当前玩家最新的幸运值 (当前的+刚点蛋的)上限幸运值处理判断
							
							local NewXinYunNum = XinYunJiaoHu + nXinYun
							--API_Trace('NewXinYunNum='..NewXinYunNum)
							if NewXinYunNum < 1250 and NewXinYunNum >= 0 then
								API_VarDataSetNumber( ActorID, 1, nXinYunJiaoHu, NewXinYunNum)
								
							else
								API_VarDataSetNumber( ActorID, 1, nXinYunJiaoHu, 1250)
								
							end
							--测试时候交互清零打印操作代码
							--local ActorID =  API_RequestGetActorID(); 
							--API_VarDataSetNumber( 4210206, 1, 4021, 1250)
							
							--取对应的奖励表给奖励
							--API_Trace('Num='..Num)			
							local JiangLiTable = ChristmasChouJiangTable[Num]
							local JiangLiGaiLv = math.random(10000000)			
							for j in JiangLiTable do
								local GaiLv1 = JiangLiTable[j].GaiLv1
								local GaiLv2 = JiangLiTable[j].GaiLv2
								local nRealXinyunMax = API_VarDataGetNumber(ActorID, 1, nXinYunJiaoHu) 
								
								if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
									local JiangLiGoodsID = JiangLiTable[j].GoodsID
									local nXinyunMax= JiangLiTable[j].Xinyun 
									local nAddGoodsNum = JiangLiTable[j].Num
									--API_Trace('JiangLiGoodsID1='..JiangLiGoodsID)
									API_ActorRemoveGoods(ActorID,nYunYouID,nNeedYunYouNum,"删除对应价格数量的云游代金券")
									--API_ActorSendMsg(ActorID,2,'您获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
									local NowTime = os.time()
									local NextTime = API_VarDataGetNumber_Ex(1,0,-6100,1,70)
									local Num5 = API_VarDataGetNumber_Ex(1,0,-6100,1,71) --炎龙
									local Numtf = API_VarDataGetNumber_Ex(1,0,-6100,1,61)--塔夫
									
									local NumWS = API_VarDataGetNumber_Ex(1,0,-6100,1,50) --武僧
									local NumWL = API_VarDataGetNumber_Ex(1,0,-6100,1,52)  --wangling
									local NumHZ = API_VarDataGetNumber_Ex(1,0,-6100,1,54)  --haizei
									
									local Numsdlmn = API_VarDataGetNumber_Ex(1,0,-6100,1,32)--圣诞礼帽[2013][女]
									local Numsdlfn = API_VarDataGetNumber_Ex(1,0,-6100,1,33)--圣诞礼服[2013][女]
									local Numsdlma = API_VarDataGetNumber_Ex(1,0,-6100,1,37)--圣诞礼帽[2013][男]
									local Numsdlfa = API_VarDataGetNumber_Ex(1,0,-6100,1,38)--圣诞礼服[2013][男]
									
									local Numssda = API_VarDataGetNumber_Ex(1,0,-6100,1,39) --射手迪奥
									
									
									--幸运交互处理判断
									if  nRealXinyunMax >= 1200 and Num == 5 and  NowTime >= NextTime then
										--local nRandomLONGNum = math.random(1,2) 
										--if nRandomLONGNum == 1 then
										   -- JiangLiGoodsID = 31039 --凤凰
										--elseif nRandomLONGNum == 2 then
										   -- JiangLiGoodsID = 31022 --雪女
										--end	
										--JiangLiGoodsID = 31048 --雪女
										JiangLiGoodsID = 31049 --射手吉奥宝宝卡
										nAddGoodsNum = 1
										
									elseif nRealXinyunMax >= 800 and Num == 5 and Num5 < 1 then
										--local nRandomLONGNum = math.random(1,5) 
										--if nRandomLONGNum == 1 then
											--JiangLiGoodsID = 31046 --炎龙宝宝卡
										--elseif nRandomLONGNum == 2 then
											--JiangLiGoodsID = 31022 --凤凰宝宝卡
										--elseif nRandomLONGNum == 2 then
											--JiangLiGoodsID = 31044 --护士
										--elseif nRandomLONGNum == 4 then
											--JiangLiGoodsID = 31039 --雪女宝宝卡
										elseif nRandomLONGNum == 2 then
											JiangLiGoodsID = 31042 --佩罗恩宝宝卡
										--elseif nRandomLONGNum == 6 then
											--JiangLiGoodsID = 31030 --天使宝宝卡
										--elseif nRandomLONGNum == 7 then
											--JiangLiGoodsID = 31043 --堕天使宝宝卡
										--elseif nRandomLONGNum == 8 then
											--JiangLiGoodsID = 31038 --恶魔宝宝卡
										--elseif nRandomLONGNum == 3 then
											--JiangLiGoodsID = 31041 --克苏恩宝宝卡
										--elseif nRandomLONGNum == 4 then
											--JiangLiGoodsID = 31045 --美美沙宝宝卡
										--elseif nRandomLONGNum == 5 then
											--JiangLiGoodsID = 31024 --火龙宝宝卡
										--end
										if Numssda < 1  then
											JiangLiGoodsID = 31049 --射手吉奥宝宝卡
										end
										nAddGoodsNum = 1
									elseif nRealXinyunMax >= 500 and Num == 5 and Num5 <1 then
										JiangLiGoodsID = 31046 --火龙宝宝卡（每日1个）						
										nAddGoodsNum = 1
									elseif nRealXinyunMax >= 400 and Num == 5 then
										local nRandomLONGNum = math.random(1,3) 
										if nRandomLONGNum == 1 and NumWS <1 then
											JiangLiGoodsID = 89236 --武僧英雄秘籍【物理】(每天一本）
											JiangLiGoodsID = 89175 --神盾英雄秘籍【物理】(每天一本）						
										elseif nRandomLONGNum == 2 and NumWL <1 then
											JiangLiGoodsID = 89241 --亡灵英雄秘籍【魔法】(每天一本）
											JiangLiGoodsID = 89180 --元素英雄秘籍【魔法】(每天一本）							
										elseif nRandomLONGNum == 3 and NumHZ <1 then
											JiangLiGoodsID = 89246 --海贼英雄秘籍【火药】(每天一本）
											JiangLiGoodsID = 89185 --炼金英雄秘籍【火药】(每天一本）
										end
										nAddGoodsNum = 1
									elseif nRealXinyunMax >= 300 and Num == 5 then
										local nRandomLONGNum = math.random(1,5) 
										if nRandomLONGNum == 1 and Numtf <1  then
											JiangLiGoodsID = 31025 --小塔夫卡（每日1个）
										elseif nRandomLONGNum == 2 and Numsdlmn < 2 then
											JiangLiGoodsID = 11619 --圣诞礼帽[2013][女]（每日2个）
										elseif nRandomLONGNum == 3 and Numsdlfn < 2 then
											JiangLiGoodsID = 11620 --圣诞礼服[2013][女]（每日2个）
										elseif nRandomLONGNum == 4 and Numsdlma < 2 then
											JiangLiGoodsID = 11621 --圣诞礼帽[2013][男]（每日2个）
										elseif nRandomLONGNum == 5 and Numsdlfa < 2 then
											JiangLiGoodsID = 11622 --圣诞礼服[2013][男]（每日2个）
										end
																
										nAddGoodsNum = 1
									end
									
									--如果随机到的是宠物蛋
									if JiangLiGoodsID == 76 then
										--开出世界广播的物品
										local UID = API_AddActorGoodsPropRetUID(ActorID, JiangLiGoodsID, 1, 0, ''..API_GetGoodsName(JiangLiGoodsID)..'', -1, -1)
										API_SetUIDPetCapsulePropNum(ActorID, UID, 35, Num)  
										--开出世界广播的物品
										if Num == 5 then
											API_ActorSendMsg(ActorID,17,''..API_GetActorName(ActorID)..'鸿运当头获得了'..Num..'星'..API_GetGoodsName(JiangLiGoodsID)..'')
											--清蛋幸运值
											if nXinyunMax >0 then
												nRealXinyunMax = nRealXinyunMax - nXinyunMax/2 
												if nRealXinyunMax < 0 then 
													API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
												else
													API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,nRealXinyunMax)
												end	
											end
										end
									--如果随机到的是丛林猎手
									elseif JiangLiGoodsID == 31048 then
											local NowTime = os.time()
											local NextTime = API_VarDataGetNumber_Ex(1,0,-6100,1,77)
											if NowTime >= NextTime then
												API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加蛋开的物品");
												--清赤炎天使幸运值
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
												API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'鸿运当头通过砸蛋获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
												--local CDTime = math.random(172800,259200);
												local CDTime = 259200
												NextTime = NowTime + CDTime
												API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,77,NextTime)
											else
												API_AddActorGoods(ActorID,82032, 1, "给背包中加蛋开的物品");
												JiangLiGoodsID = 82032
												if nXinyunMax >0 then
													nRealXinyunMax = nRealXinyunMax - 100 
													if nRealXinyunMax < 0 then 
														API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
													else
														API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,nRealXinyunMax)
													end	
												end
											end
									--如果随机到的是赤炎天使
									elseif JiangLiGoodsID == 31047 then
											local NowTime = os.time()
											local NextTime = API_VarDataGetNumber_Ex(1,0,-6100,1,70)
											if NowTime >= NextTime then
												API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加蛋开的物品");
												--清赤炎天使幸运值
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
												API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'鸿运当头通过砸蛋获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
												--local CDTime = math.random(172800,259200);
												local CDTime = 259200
												NextTime = NowTime + CDTime
												API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,70,NextTime)
											else
												API_AddActorGoods(ActorID,82032, 1, "给背包中加蛋开的物品");
												JiangLiGoodsID = 82032
												if nXinyunMax >0 then
													nRealXinyunMax = nRealXinyunMax - 100 
													if nRealXinyunMax < 0 then 
														API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
													else
														API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,nRealXinyunMax)
													end	
												end
											end
									--如果随机到的是凤凰卡
									elseif JiangLiGoodsID == 31022 then
											local NowTime = os.time()
											local NextTime = API_VarDataGetNumber_Ex(1,0,-6100,1,46)
											if NowTime >= NextTime then
												API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加蛋开的物品");
												--清凤凰卡幸运值
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
												
												API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'鸿运当头通过砸蛋获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
												--local CDTime = math.random(172800,259200);
												local CDTime = 259200
												NextTime = NowTime + CDTime
												API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,46,NextTime)
											else
												API_AddActorGoods(ActorID,82032, 1, "给背包中加蛋开的物品");
												JiangLiGoodsID = 82032
												if nXinyunMax >0 then
													nRealXinyunMax = nRealXinyunMax - 100 
													if nRealXinyunMax < 0 then 
														API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
													else
														API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,nRealXinyunMax)
													end	
												end
											end
									--如果随机到的是雪女 ,迪奥
									elseif JiangLiGoodsID == 31049 then
											local NowTime = os.time()
											local NextTime = API_VarDataGetNumber_Ex(1,0,-6100,1,56)
											if NowTime >= NextTime then
												API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加蛋开的物品");
												--清凤凰卡幸运值
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
												
												API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'鸿运当头通过砸蛋获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
												API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,39,1)
												
												--local CDTime = math.random(172800,259200);
												--local CDTime = 259200 --3天
												local CDTime = 172800 --2天
												NextTime = NowTime + CDTime
												API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,56,NextTime)
												
											else
												API_AddActorGoods(ActorID,82032, 1, "给背包中加蛋开的物品");
												JiangLiGoodsID = 82032
												if nXinyunMax >0 then
													nRealXinyunMax = nRealXinyunMax - 100 
													if nRealXinyunMax < 0 then 
														API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
													else
														API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,nRealXinyunMax)
													end	
												end
											end 
									--如果随机到是特殊物品				
									elseif tBroadcastGoods[JiangLiGoodsID] ~= nil then
										local nMax = tBroadcastGoods[JiangLiGoodsID].nMax;
										local Data = tBroadcastGoods[JiangLiGoodsID].Data;
										local Num5 = API_VarDataGetNumber_Ex(1,0,-6100,1,Data)
										local CDData = tBroadcastGoods[JiangLiGoodsID].CDData;
										local CDTime = tBroadcastGoods[JiangLiGoodsID].CDTime;
										if Num5 >= nMax then
											if  JiangLiGoodsID == 31025 or JiangLiGoodsID == 89175 or JiangLiGoodsID == 89180 or JiangLiGoodsID == 89185  or JiangLiGoodsID == 31046 or JiangLiGoodsID == 31048 or JiangLiGoodsID == 31022 or JiangLiGoodsID ==31044 then
											      
											       nRealXinyunMax = nRealXinyunMax - 100 
												if nRealXinyunMax < 0 then 
													API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
												else
													API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,nRealXinyunMax)
												end
											elseif JiangLiGoodsID == 31042 or JiangLiGoodsID == 31047 or JiangLiGoodsID ==31043 or JiangLiGoodsID == 31038 or JiangLiGoodsID == 31041 or JiangLiGoodsID == 31045 or JiangLiGoodsID == 31024 or JiangLiGoodsID == 31030 then
												
												nRealXinyunMax = nRealXinyunMax - 100 
												if nRealXinyunMax < 0 then 
													API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
												else
													API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,nRealXinyunMax)
												end
											elseif JiangLiGoodsID == 11619 or JiangLiGoodsID == 11620 or JiangLiGoodsID ==11621 or JiangLiGoodsID == 11622 then
												
												nRealXinyunMax = nRealXinyunMax - 100 
												if nRealXinyunMax < 0 then 
													API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
												else
													API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,nRealXinyunMax)
												end	
											end
											API_AddActorGoods(ActorID,82032, 1, "给背包中加蛋开的物品");
											JiangLiGoodsID = 82032
										else
											--广播表中的物品清交互
											if JiangLiGoodsID ==31025 or JiangLiGoodsID == 89175 or JiangLiGoodsID == 89180 or JiangLiGoodsID == 89185 then
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
											elseif JiangLiGoodsID ==31044 or JiangLiGoodsID == 31046 or JiangLiGoodsID == 31048 or JiangLiGoodsID == 31022 or JiangLiGoodsID == 31042 or JiangLiGoodsID == 31047 then
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
											elseif JiangLiGoodsID ==31043 or JiangLiGoodsID == 31038 or JiangLiGoodsID == 31041 or JiangLiGoodsID == 31045 or JiangLiGoodsID == 31024 or JiangLiGoodsID == 31030 then
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
											elseif JiangLiGoodsID == 11619 or JiangLiGoodsID == 11620 or JiangLiGoodsID ==11621 or JiangLiGoodsID == 11622 then
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
											end
											if nXinyunMax > 0 then
												nRealXinyunMax = nRealXinyunMax - nXinyunMax/2 
												if nRealXinyunMax < 0 then 
													API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
												else
													API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,nRealXinyunMax)
												end
											end
											local NowTime = os.time()
											--API_Trace('NowTime='..NowTime)
											--local NextTime = API_VarDataGetNumber_Ex(1,0,-6100,1,CDData)
											local NextTime = 0
											if NowTime >= NextTime then
												Num5 = Num5 + 1
												--API_Trace('小于Num5='..Num5)
												API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,Data,Num5)
												API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加蛋开的物品");
												if JiangLiGoodsID ~= 82032 then
													API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'鸿运当头通过砸蛋获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
												end
												NextTime = NowTime + (CDTime * 60)
												API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,CDData,NextTime)
												--API_Trace('奖励物品特殊='..JiangLiGoodsID)
											else
												
												local UID = API_AddActorGoodsPropRetUID(ActorID, 76, 1, 0, '', -1, -1)
												API_SetUIDPetCapsulePropNum(ActorID, UID, 35, 5)
												--API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'鸿运当头通过英雄传承闯关获得了5星宠物胶囊')
												API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'鸿运当头通过砸蛋获得了5星宠物胶囊')
												JiangLiGoodsID = 76
												--API_Trace('5星蛋UID='..ActorID)
											end
										end
									else
										if JiangLiGoodsID == 31025 or JiangLiGoodsID == 89137 or JiangLiGoodsID == 89142 or JiangLiGoodsID == 89147 then
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
										elseif JiangLiGoodsID ==31044 or JiangLiGoodsID == 31046 or JiangLiGoodsID == 31048 or JiangLiGoodsID == 31022 or JiangLiGoodsID == 31042 or JiangLiGoodsID == 31047 then
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
										elseif JiangLiGoodsID ==31043 or JiangLiGoodsID == 31038 or JiangLiGoodsID == 31041 or JiangLiGoodsID == 31045 or JiangLiGoodsID == 31024 or JiangLiGoodsID == 31030 then
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
										elseif JiangLiGoodsID ==89175 or JiangLiGoodsID == 89180 or JiangLiGoodsID == 89185 then
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
										elseif JiangLiGoodsID == 11619 or JiangLiGoodsID == 11620 or JiangLiGoodsID ==11621 or JiangLiGoodsID == 11622 then
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
										end
										 
										if nXinyunMax > 0 then
											nRealXinyunMax = nRealXinyunMax - nXinyunMax/2 
											if nRealXinyunMax < 0 then 
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,0)
											else
												API_VarDataSetNumber(ActorID, 1, nXinYunJiaoHu,nRealXinyunMax)
											end
										end
										if JiangLiGoodsID == 31025 or JiangLiGoodsID == 89175 or JiangLiGoodsID == 89180 or JiangLiGoodsID == 89185 then
											API_AddActorGoods(ActorID,JiangLiGoodsID, 1 , "给背包中加蛋开的物品");
										elseif JiangLiGoodsID ==31044 or JiangLiGoodsID == 31046 or JiangLiGoodsID == 31048 or JiangLiGoodsID == 31022 or JiangLiGoodsID == 31042 or JiangLiGoodsID == 31047 then
											API_AddActorGoods(ActorID,JiangLiGoodsID, 1 , "给背包中加蛋开的物品");
										elseif JiangLiGoodsID ==31043 or JiangLiGoodsID == 31038 or JiangLiGoodsID == 31041 or JiangLiGoodsID == 31045 or JiangLiGoodsID == 31024 or JiangLiGoodsID == 31030 then
											API_AddActorGoods(ActorID,JiangLiGoodsID, 1 , "给背包中加蛋开的物品");
										elseif JiangLiGoodsID == 11619 or JiangLiGoodsID == 11620 or JiangLiGoodsID ==11621 or JiangLiGoodsID == 11622 then	
											API_AddActorGoods(ActorID,JiangLiGoodsID, 1 , "给背包中加蛋开的物品");
										else
											local PD = 0
											for h,v in baoshiwupinbiao do
												if JiangLiGoodsID == v then
													PD = 1
												end
											end
											if PD == 1 then
												fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
											else
												API_AddActorGoods(ActorID,JiangLiGoodsID, nAddGoodsNum , "给背包中加蛋开的物品");
											end
											
										end																				--公告判断
										for k,v in TBlueGoodsID do
											if JiangLiGoodsID == v then
												--API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'英雄传承闯关获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
												API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'砸蛋获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
											end
										end	
									end
									
									--给出的物品奖励在NPC上显示
									API_ResponseWrite('<name>节日大使</name>')
									API_ResponseWrite('<text>您获得了</text><text color="255,0,255">'..API_GetGoodsName(JiangLiGoodsID)..'</text>')
									API_ResponseWrite('<img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'" >')
									if JiangLiGoodsID ==31025 or JiangLiGoodsID == 31046 or JiangLiGoodsID == 89175 or JiangLiGoodsID == 89180 or JiangLiGoodsID == 89175 then
										API_ResponseWrite('<text></text><text color="255,0,255">x1</text>')
									elseif JiangLiGoodsID ==31044 or JiangLiGoodsID == 31046 or JiangLiGoodsID == 31048 or JiangLiGoodsID == 31022 or JiangLiGoodsID == 31042 or JiangLiGoodsID == 31047 then
										API_ResponseWrite('<text></text><text color="255,0,255">x1</text>')
									elseif JiangLiGoodsID ==31043 or JiangLiGoodsID == 31038 or JiangLiGoodsID == 31041 or JiangLiGoodsID == 31045 or JiangLiGoodsID == 31024 or JiangLiGoodsID == 31030 then
										API_ResponseWrite('<text></text><text color="255,0,255">x1</text>')
									elseif JiangLiGoodsID == 11619 or JiangLiGoodsID == 11620 or JiangLiGoodsID ==11621 or JiangLiGoodsID == 11622 or JiangLiGoodsID == 31049 then
										API_ResponseWrite('<text></text><text color="255,0,255">x1</text>')	
									else
										API_ResponseWrite('<text></text><text color="255,0,255">x'..nAddGoodsNum..'</text>')
									end
									
									--判断如果ID为。。则世界广播飘字提示
									--点蛋成功风向标
									if Num ==1 then
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][1][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][1][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][1][LaiYuan] + 1
										end
									elseif Num ==2 then
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][2][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][2][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][2][LaiYuan] + 1
										end
									elseif Num == 3 then
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][3][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][3][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][3][LaiYuan] + 1
										end
									elseif Num == 4 then
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][4][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][4][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][4][LaiYuan] + 1
										end
									elseif Num == 5 then
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][5][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][5][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][5][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][5][LaiYuan] + 1
										end
										--获取交互
										--交互+1
										--存交互
										
									end
									--物品风向标
									if JiangLiGoodsID ==31038 then
										--恶魔宝宝卡
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][6][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][6][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][6][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][6][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31049 then
									        --雪女
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][7][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][7][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][7][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][7][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31024 then
										--火龙
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][8][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][8][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][8][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][8][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31027 then
										--人马刀
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][9][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][9][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][9][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][9][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31028 then
										--人马祭祀
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][10][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][10][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][10][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][10][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31029 then
										--人马狙击
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][11][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][11][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][11][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][11][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31040 then
										--年兔
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][12][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][12][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][12][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][12][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31031 then
										--足球
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][13][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][13][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][13][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][13][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31025 then
										--小塔夫
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][14][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][14][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][14][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][14][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 11619 then
										--狂野牛仔帽[黄金男装](每天三件）
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][15][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][15][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][15][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][15][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 11620 then
										--狂野牛仔服[黄金男装](每天三件）
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][16][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][16][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][16][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][16][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 11621 then
										--狂野牛仔帽[黄金女装](每天三件）
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][17][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][17][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][17][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][17][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 11622 then
										--狂野牛仔服[[黄金女装](每天三件）
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][18][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][18][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][18][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][18][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31022 then
										--凤凰宝宝卡（每周2只）
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][19][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][19][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][19][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][19][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31044 then
										--护士卡
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][20][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][20][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][20][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][20][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31042 then
										--佩罗恩宝宝卡
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][21][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][21][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][21][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][21][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31030 then
										--天使宝宝卡
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][22][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][22][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][22][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][22][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31043 then
										--堕天使宝宝卡
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][23][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][23][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][23][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][23][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31041 then
										--克苏恩宝宝卡
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][24][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][24][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][24][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][24][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31045 then
										--美美沙
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][25][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][25][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][25][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][25][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 31046 then
										--炎龙
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][26][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][26][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][26][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][26][LaiYuan] + 1
										end	
									elseif JiangLiGoodsID == 31047 then
										--复仇者
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][27][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][27][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][27][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][27][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 89175 then
										--圣盾
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][28][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][28][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][28][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][28][LaiYuan] + 1
										end	
									elseif JiangLiGoodsID == 89180 then
										--元素
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][29][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][29][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][29][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][29][LaiYuan] + 1
										end
									elseif JiangLiGoodsID == 89185 then
										--炼金
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[74][30][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[74][30][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[74][30][LaiYuan] = GLOBAL_FengXiangBiao_DateList[74][30][LaiYuan] + 1
										end	
									end
									
								end	
							end
								
							--随机下一个交互为1
							
							local RD = math.random(100)
							if RD <= nRandomRate then
								API_VarDataSetNumber( ActorID, 1, NextJH, 1)
								if Num == 3 or Num ==4 then
									API_ActorSendMsg(ActorID,6,'开启'..tChristmasEggs[Num+1].nName..'')
								end
								--API_ActorSendMsg(ActorID,3,'开启'..tChristmasEggs[Num+1].nName..'')
								--手指头提示
								if Num >= 1 and Num <=4then
									API_OpenSmallTip(ActorID, THandTile[Num+1].nX, THandTile[Num+1].nY, 0, 0, 2, '[255:0:0]'..tChristmasEggs[Num+1].nName..'[/]')	
								end							
							end
							
							--重新弹出这个窗口
							HL_2011SD_ClickEggs(ActorID, NPCID,0,0)
						else
						     --飘字提示背包空间不足1个，不能升级该蛋
						    	API_ActorSendMsg(ActorID,2,'背包空间不足，不能升级该蛋。')
						     --重新弹出这个窗口
						end
						
				else
						--飘字提示云游不足，不能升级该蛋
						API_ActorSendMsg(ActorID,2,'云游代金券不足，不能升级该蛋。')
						--重新弹出这个窗口
						HL_2011SD_ClickEggs(ActorID, NPCID,0,0)
				end
			--ELSE,升级蛋成失败
			end
		else
			--弹出个窗口告诉玩家操作失败，请重试
			API_ResponseWrite('<name>节日大使</name>')
			API_ResponseWrite('<text>玩家操作失败，请重试。</text>')
			API_ResponseWrite('<br><br><a>确定</a>')
		end
	end
	end
end

   


--跨天12点清除：
function MeiriHuoDong_ShuJuQingChu(Param1,Param2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local NowTime = os.time()
	--API_Trace('111')
	if API_GetServerID() == 1 then
		if NowTime > API_VarDataGetNumber_Ex(1,0,-6100,1,101) then
			--API_Trace('222')
			--[[API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,23,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,24,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,25,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,26,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,27,0) ]]--
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,28,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,29,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,30,0)
			
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,32,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,33,0)
			--[[API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,34,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,35,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,36,0)]]--
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,37,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,38,0)
			
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,50,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,52,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,54,0)
			--API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,57,0)
			--API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,59,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,61,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,71,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,39,0)
			--API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,72,0)
			
			local NowTime = os.date("*t", os.time()) 
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 12 
			NowTime.min = 0 
			NowTime.sec = 0 
			local NextTime = os.time(NowTime) 
			RefreshTimeSofie = NextTime + 86400   
			API_VarDataSetNumber_Ex_Sync(1,0,-6100,1,101,RefreshTimeSofie)                  
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

			