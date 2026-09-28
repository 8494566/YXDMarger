-------------------------------------------------------------------------------------------------------------------------------------------
--文件名  :	Scp\Lua\Other\TW_DuanWuJieHuoDong.lua
--版  权  :	
--创建人  ：    黄蕾 刘操 
--修改日期:     2012-5-29
--版    本:     1.1
--描  述:       端午节活动  ：活动形式（怪物等级控制改为地图控制，聚集人气），活动产出物品功能（增加免费与付费粽子功能）
--              打怪收集材料，活动时间出现粽子商人，用材料换粽子，粽子吃了可以获得各类BUFF,付费宝箱使用得到物品。
--              12-15点怪物掉落，每个BUFF使用时间是2个小时，怪物掉率是比例20%，三随一。
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
--修改人：     黄蕾
--时  间：     20120614
--内  容：     1，修复亡灵海贼武僧限量1件特殊处理
---------------------------------------------------------------------------------------------------------------------------------------------

--配置区
--角色个人交互:30301，用来创建端午节怪物触发器；30302每天角色粽子兑换数量；30303每天时间控制
--全局交互：-6188，1时装宝石，2秘籍，3和4载具，5载具CD,6789背饰，额外奖励10,45-55,55,58。亡灵海贼武僧60,61,62
--          -6187，端午节每天限量101,100,1-13

--活动开始，结束表
local DuanWuJieHuoDong_StartTime = {Year = 2012,Month = 6,Day = 14,Hour = 0,Minute = 0,Second = 0}--615
local DuanWuJieHuoDong_EndTime = {Year = 2012,Month = 6,Day = 25,Hour = 0,Minute = 0,Second = 0}

--粽叶,棕绳,糯米,黄金粽
local GoodsID1,GoodsID2,GoodsID3,GoodsID4 = 89165,89166,89167,89168
local nNUM1,nNUM2,nNUM3,nNUM4 = 1,1,1,1 

--使用一个物品随机得到一个状态的表。
--{{使用的物品ID，随机抽取的状态ID表，随机抽取的状态ID等级，随机抽取的状态ID时间，物品的作用出去如XX活动},{}}
--黄金粽子
local tRadomStateIDGoods1 ={
	{nGoodsID=89168,tRadomStateID={2081001,2081003,2081005,2081007,2081009,2081011,2081013,2081015},tRadomStateIDNum=8,tRadomStateLv={1,2,3,4,5,6},tRadomStateTime={300,300,300,300,300,300,300,300},nGoodsFrom="端午节活动"}
	};
--特级粽子
local tRadomStateIDGoods2 ={
	{nGoodsID=89169,tRadomStateID={2081002,2081004,2081006,2081008,2081010,2081012,2081014,2081016},tRadomStateIDNum=8,tRadomStateLv={1,2,3,4,5,6},tRadomStateTime={300,300,300,300,300,300,300,300},nGoodsFrom="端午节活动"},
	};

--端午节怪物掉落表
local localtable_TW_DuanWuJieHuoDong_GoodsTable = {
	[1] = {GoodsID = 89165,Num = 1,Bind = 2,Odds =2000},--粽叶
	[2] = {GoodsID = 89166,Num = 1,Bind = 2,Odds =2000},--棕绳
	[3] = {GoodsID = 89167,Num = 1,Bind = 2,Odds =2000},--糯米
	}
	
--端午节宝箱奖励表
DuanWuJieHuoDong_BoxTable = {
	[89170] = {
		[1] = {
			
			
				{GoodsID=39501,GaiLv1=1,GaiLv2=54009,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39502,GaiLv1=54010,GaiLv2=108019,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39503,GaiLv1=108020,GaiLv2=162029,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39510,GaiLv1=162030,GaiLv2=216039,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39513,GaiLv1=216040,GaiLv2=270049,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39516,GaiLv1=270050,GaiLv2=324059,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39519,GaiLv1=324060,GaiLv2=378069,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39522,GaiLv1=378070,GaiLv2=432079,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39525,GaiLv1=432080,GaiLv2=486089,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39528,GaiLv1=486090,GaiLv2=540099,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80383,GaiLv1=540100,GaiLv2=1836318,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80381,GaiLv1=1836319,GaiLv2=2762189,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80397,GaiLv1=2762190,GaiLv2=3572326,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=250,GaiLv1=3572327,GaiLv2=4652509,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80394,GaiLv1=4652510,GaiLv2=4976564,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=40003,GaiLv1=4976565,GaiLv2=5300619,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=40013,GaiLv1=5300620,GaiLv2=5624674,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=40023,GaiLv1=5624675,GaiLv2=5948729,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=40093,GaiLv1=5948730,GaiLv2=6272784,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=31015,GaiLv1=6272785,GaiLv2=6434812,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=31016,GaiLv1=6434813,GaiLv2=6596840,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=76,GaiLv1=6596841,GaiLv2=6758868,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89040,GaiLv1=6758869,GaiLv2=6812878,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89041,GaiLv1=6812879,GaiLv2=6866888,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89042,GaiLv1=6866889,GaiLv2=6920898,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39507,GaiLv1=6920899,GaiLv2=6937101,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39508,GaiLv1=6937102,GaiLv2=6953304,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39509,GaiLv1=6953305,GaiLv2=6969507,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80686,GaiLv1=6969508,GaiLv2=7293562,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80689,GaiLv1=7293563,GaiLv2=7617617,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=31101,GaiLv1=7617618,GaiLv2=7779645,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=75,GaiLv1=7779646,GaiLv2=8103700,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=32015,GaiLv1=8103701,GaiLv2=8105861,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39511,GaiLv1=8105862,GaiLv2=8138267,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39514,GaiLv1=8138268,GaiLv2=8170673,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39504,GaiLv1=8170674,GaiLv2=8203079,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39505,GaiLv1=8203080,GaiLv2=8235485,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39506,GaiLv1=8235486,GaiLv2=8267891,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39517,GaiLv1=8267892,GaiLv2=8300297,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39520,GaiLv1=8300298,GaiLv2=8332703,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39523,GaiLv1=8332704,GaiLv2=8365109,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39526,GaiLv1=8365110,GaiLv2=8397515,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39529,GaiLv1=8397516,GaiLv2=8429921,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=32016,GaiLv1=8429922,GaiLv2=8430934,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11026,GaiLv1=8430935,GaiLv2=8433635,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11027,GaiLv1=8433636,GaiLv2=8435436,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11028,GaiLv1=8435437,GaiLv2=8438137,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11029,GaiLv1=8438138,GaiLv2=8439938,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11036,GaiLv1=8439939,GaiLv2=8441739,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11037,GaiLv1=8441740,GaiLv2=8443540,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11046,GaiLv1=8443541,GaiLv2=8445341,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11047,GaiLv1=8445342,GaiLv2=8446354,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11045,GaiLv1=8446355,GaiLv2=8457529,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80195,GaiLv1=8457530,GaiLv2=8522340,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88171,GaiLv1=8522341,GaiLv2=8684368,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89169,GaiLv1=8684369,GaiLv2=9332478,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89137,GaiLv1=9332479,GaiLv2=9335719,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89142,GaiLv1=9335720,GaiLv2=9338960,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89147,GaiLv1=9338961,GaiLv2=9342201,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11071,GaiLv1=9342202,GaiLv2=9343822,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11072,GaiLv1=9343823,GaiLv2=9345443,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11073,GaiLv1=9345444,GaiLv2=9347064,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11074,GaiLv1=9347065,GaiLv2=9348685,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11545,GaiLv1=9348686,GaiLv2=9350306,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11544,GaiLv1=9350307,GaiLv2=9351927,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80274,GaiLv1=9351928,GaiLv2=10000000,NumGaiLv=8600,NumMax=1,NumMin=0},


		},
		[2] = {
				{GoodsID=39501,GaiLv1=1,GaiLv2=58769,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39502,GaiLv1=58770,GaiLv2=117539,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39503,GaiLv1=117540,GaiLv2=176309,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39510,GaiLv1=176310,GaiLv2=235079,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39513,GaiLv1=235080,GaiLv2=293849,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39516,GaiLv1=293850,GaiLv2=352619,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39519,GaiLv1=352620,GaiLv2=411389,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39522,GaiLv1=411390,GaiLv2=470159,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39525,GaiLv1=470160,GaiLv2=528929,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39528,GaiLv1=528930,GaiLv2=587699,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80384,GaiLv1=587700,GaiLv2=1217371,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80382,GaiLv1=1217372,GaiLv2=1642210,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=31017,GaiLv1=1642211,GaiLv2=1730365,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=31018,GaiLv1=1730366,GaiLv2=1818520,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=31019,GaiLv1=1818521,GaiLv2=1906675,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=76,GaiLv1=1906676,GaiLv2=2082984,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=40004,GaiLv1=2082985,GaiLv2=2318062,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=40014,GaiLv1=2318063,GaiLv2=2553140,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=40024,GaiLv1=2553141,GaiLv2=2788218,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=40094,GaiLv1=2788219,GaiLv2=3023296,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80697,GaiLv1=3023297,GaiLv2=3728529,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80196,GaiLv1=3728530,GaiLv2=4433762,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=9507,GaiLv1=4433763,GaiLv2=4443837,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80397,GaiLv1=4443838,GaiLv2=5325378,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=250,GaiLv1=5325379,GaiLv2=6500766,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80394,GaiLv1=6500767,GaiLv2=6853383,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80686,GaiLv1=6853384,GaiLv2=7206000,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80689,GaiLv1=7206001,GaiLv2=7558617,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=32015,GaiLv1=7558618,GaiLv2=7560968,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39511,GaiLv1=7560969,GaiLv2=7596230,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39514,GaiLv1=7596231,GaiLv2=7631492,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39504,GaiLv1=7631493,GaiLv2=7666754,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39505,GaiLv1=7666755,GaiLv2=7702016,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39506,GaiLv1=7702017,GaiLv2=7737278,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39517,GaiLv1=7737279,GaiLv2=7772540,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39520,GaiLv1=7772541,GaiLv2=7807802,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39523,GaiLv1=7807803,GaiLv2=7843064,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39526,GaiLv1=7843065,GaiLv2=7878326,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39529,GaiLv1=7878327,GaiLv2=7913588,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89040,GaiLv1=7913589,GaiLv2=7972358,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89041,GaiLv1=7972359,GaiLv2=8031128,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89042,GaiLv1=8031129,GaiLv2=8089898,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39507,GaiLv1=8089899,GaiLv2=8107529,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39508,GaiLv1=8107530,GaiLv2=8125160,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=39509,GaiLv1=8125161,GaiLv2=8142791,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=32016,GaiLv1=8142792,GaiLv2=8143893,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88928,GaiLv1=8143894,GaiLv2=8145852,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88920,GaiLv1=8145853,GaiLv2=8147811,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88924,GaiLv1=8147812,GaiLv2=8149770,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88929,GaiLv1=8149771,GaiLv2=8151729,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88921,GaiLv1=8151730,GaiLv2=8153688,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88925,GaiLv1=8153689,GaiLv2=8155647,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88930,GaiLv1=8155648,GaiLv2=8157606,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88922,GaiLv1=8157607,GaiLv2=8159565,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88926,GaiLv1=8159566,GaiLv2=8161524,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88923,GaiLv1=8161525,GaiLv2=8163483,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88927,GaiLv1=8163484,GaiLv2=8165442,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88931,GaiLv1=8165443,GaiLv2=8167401,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11026,GaiLv1=8167402,GaiLv2=8170340,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11027,GaiLv1=8170341,GaiLv2=8193848,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11028,GaiLv1=8193849,GaiLv2=8229110,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11029,GaiLv1=8229111,GaiLv2=8252618,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11036,GaiLv1=8252619,GaiLv2=8255557,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11037,GaiLv1=8255558,GaiLv2=8257516,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11046,GaiLv1=8257517,GaiLv2=8259475,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11047,GaiLv1=8259476,GaiLv2=8261434,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11045,GaiLv1=8261435,GaiLv2=8262536,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80274,GaiLv1=8262537,GaiLv2=8967769,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=88171,GaiLv1=8967770,GaiLv2=9114693,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89169,GaiLv1=9114694,GaiLv2=9819926,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89137,GaiLv1=9819927,GaiLv2=9823453,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89142,GaiLv1=9823454,GaiLv2=9826980,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=89147,GaiLv1=9826981,GaiLv2=9830507,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11071,GaiLv1=9830508,GaiLv2=9832271,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11072,GaiLv1=9832272,GaiLv2=9834035,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11073,GaiLv1=9834036,GaiLv2=9835799,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11074,GaiLv1=9835800,GaiLv2=9837563,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11545,GaiLv1=9837564,GaiLv2=9839327,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=11544,GaiLv1=9839328,GaiLv2=9841091,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80952,GaiLv1=9841092,GaiLv2=9899861,NumGaiLv=8600,NumMax=1,NumMin=0},
				{GoodsID=80387,GaiLv1=9899862,GaiLv2=10000000,NumGaiLv=8600,NumMax=1,NumMin=0},

			

		},
	},
}
--端午节宝箱开出的物品CD奖励表（时装宝石与部分时装）
DuanWuJieHuoDong_BoxCdGoods = {
	[39511] = 1000,
	[39514] = 1000,
	[39504] = 1000,
	[39505] = 1000,
	[39506] = 1000,
	[39517] = 1000,
	[39520] = 1000,
	[39523] = 1000,
	[39526] = 1000,
	[39529] = 1000,
	[11026] = 1000,--蝙蝠帽
	[11027] = 1000,
	[11028] = 1000,
	[11029] = 1000,
	[11036] = 1000,
	[11037] = 1000,
	[11046] = 1000,
	[11047] = 1000,
	[11045] = 1000,--能量回复影兽
}
--各类英雄秘籍残卷表
DuanWuJieHuoDong_BoxBookGoods = {
	[88920] = 3000,
	[88921] = 3000,
	[88922] = 3000,
	[88923] = 3000,
	[88924] = 3000,
	[88925] = 3000,
	[88926] = 3000,
	[88927] = 3000,
	[88928] = 3000,
	[88929] = 3000,
	[88930] = 3000,
	[88931] = 3000,
}
--载具特殊操作
DuanWuJieHuoDong_BoxZaiJvGoods = {
	[32015] = {JiaZhi=15000,Key=3,Max=1,},--幻翼魔毯卡片(15000点券)
	[32016] = {JiaZhi=20000,Key=4,Max=1,},--天使之翼卡片(20000点券)
}
--根据标志世界广播
DuanWuJieHuoDong_BoxSayWorld = {
	[9504] = 1225,
	[9505] = 1600,
	[9506] = 3150,
	[9507] = 3500,
	[11026] = 1000,
	[11027] = 1500,
	[11028] = 1000,
	[11029] = 1500,
	[11034] = 4000,
	[11035] = 20000,
	[11036] = 1000,
	[11037] = 1500,
	[11046] = 1000,
	[11047] = 1500,
	[11042] = 4000,
	[11043] = 20000,
	[11045] = 2900,
	[11098] = 1000,
	[11099] = 1500,
	[11100] = 1000,
	[11101] = 1500,
	[31026] = 5000,
	[11133] = 1000,
	[11134] = 1500,
	[11135] = 1000,
	[11136] = 1500,
	[11137] = 1000,
	[11138] = 1500,
	[11139] = 1000,
	[11140] = 1500,
	[32015] = 15000,
	[39511] = 1000,
	[39514] = 1000,
	[39504] = 1000,
	[39505] = 1000,
	[39506] = 1000,
	[39517] = 1000,
	[39520] = 1000,
	[39523] = 1000,
	[39526] = 1000,
	[39529] = 1000,
	[32016] = 20000,
	[88920] = 0,
	[88921] = 0,
	[88922] = 0,
	[88924] = 0,
	[88925] = 0,
	[88926] = 0,
	[88928] = 0,
	[88929] = 0,
	[88930] = 0,
	[88923] = 0,
	[88927] = 0,
	[88931] = 0,
	[80952] = 1,
	[11317] = 30000,
}
--额外奖励
DuanWuJieHuoDong_GodBoxOtherGoods = {
	{GoodsID=80049,Num=100,Key=45,Max=3},
	{GoodsID=80050,Num=100,Key=46,Max=3},
	{GoodsID=80051,Num=100,Key=47,Max=3},
	{GoodsID=80820,Num=10,Key=48,Max=3},
	{GoodsID=80387,Num=4,Key=49,Max=3},
	{GoodsID=80388,Num=4,Key=50,Max=3},
	{GoodsID=501,Num=10,Key=51,Max=3},
	{GoodsID=88594,Num=1,Key=52,Max=3},
	{GoodsID=88598,Num=1,Key=53,Max=3},
	{GoodsID=88602,Num=1,Key=54,Max=3},
	{GoodsID=80397,Num=100,Key=55,Max=5},
}

DuanWuJieHuoDong_GodBoxCDTime = {
	[8] = {MaxNum=5,CDmin=50,CDmax=65,},
	[9] = {MaxNum=5,CDmin=50,CDmax=65,},
	[10] = {MaxNum=5,CDmin=50,CDmax=65,},
	[11] = {MaxNum=5,CDmin=50,CDmax=65,},
	[12] = {MaxNum=5,CDmin=50,CDmax=65,},
	[13] = {MaxNum=13,CDmin=10,CDmax=25,},
	[14] = {MaxNum=13,CDmin=10,CDmax=25,},
	[15] = {MaxNum=13,CDmin=10,CDmax=25,},
	[16] = {MaxNum=19,CDmin=10,CDmax=30,},
	[17] = {MaxNum=19,CDmin=10,CDmax=30,},
	[18] = {MaxNum=19,CDmin=10,CDmax=30,},
	[19] = {MaxNum=31,CDmin=5,CDmax=20,},
	[20] = {MaxNum=31,CDmin=5,CDmax=20,},
	[21] = {MaxNum=31,CDmin=5,CDmax=20,},
	[22] = {MaxNum=33,CDmin=50,CDmax=65,},
	[23] = {MaxNum=33,CDmin=50,CDmax=65,},
}
--每天限量奖励表上线SOFIE 6187，100时间存贮101时间存储
if DuanWuJieHuoDong_Txl == nil then
	DuanWuJieHuoDong_Txl ={
		
		[89040] = {GoodsID=89040,ShuLiang=20,AllNum=20,Key=1,Data=6187,Max=20},--(-6187交互数据)  一档繁星光石（每日限量20
		[89041] = {GoodsID=89041,ShuLiang=20,AllNum=20,Key=2,Data=6187,Max=20},--(-6187交互数据)一一档灵动光石（每日限量20
		[89042] = {GoodsID=89042,ShuLiang=20,AllNum=20,Key=3,Data=6187,Max=20},--(-6187交互数据)一一档噬炎光石（每日限量20）
		[39507] = {GoodsID=39507,ShuLiang=30,AllNum=30,Key=4,Data=6187,Max=30},--(-6187交互数据)时装物攻宝石[黄金]（每日限量30）
		[39508] = {GoodsID=39508,ShuLiang=30,AllNum=30,Key=5,Data=6187,Max=30},--(-6187交互数据)时装火攻宝石[黄金]（每日限量30）
		[39509] = {GoodsID=39509,ShuLiang=30,AllNum=30,Key=6,Data=6187,Max=30},--(-6187交互数据)时装魔攻宝石[黄金]（每日限量30）
		[11036] = {GoodsID=11036,ShuLiang=2,AllNum=2,Key=7 ,Data=6187,Max=2},--(-6187交互数据)乖乖女之帽
		[11037] = {GoodsID=11037,ShuLiang=2,AllNum=2,Key=8 ,Data=6187,Max=2},--(-6187交互数据)乖乖女之恋
		[11046] = {GoodsID=11046,ShuLiang=2,AllNum=2,Key=9 ,Data=6187,Max=2},--(-6187交互数据)兔宝宝发卡
		[11047] = {GoodsID=11047,ShuLiang=2,AllNum=2,Key=10,Data=6187,Max=2},--(-6187交互数据)兔宝宝之吻
		[11045] = {GoodsID=11045,ShuLiang=2,AllNum=2,Key=11,Data=6187,Max=2},--(-6187交互数据)能量回复影兽
		[11545] = {GoodsID=11545,ShuLiang=1,AllNum=1,Key=12,Data=6187,Max=1},--型男外套[男]【限量每天一件】
		[11544] = {GoodsID=11544,ShuLiang=1,AllNum=1,Key=13,Data=6187,Max=1},--淑女丽人外套[女]【限量每天一件】
			     
	}
end
--广播表
local tDuanWuJieBrodcastsofie = {11071,11072,11073,11074,89137,89142,89147,11036,11037,11046,11047,11045,11545,11544}

--端午节限量每天回调
if API_GetServerID() == 1 then
	if Hl_20120605TGoodsChongZhi ~= nil then
		API_DestroyTriggerG(Hl_20120605TGoodsChongZhi)
	end
	Hl_20120605TGoodsChongZhi = API_CreateTimerTriggerG(0,0,120,-1,'Hl_MeiRiDWJShuJuQingChu')
	--API_Trace('1==')
end

	
--逻辑区
---------------------------------------------------------------------------------------------------------------------------------------------
--创建活动NPC
---------------------------------------------------------------------------------------------------------------------------------------------
if API_GetServerID() == 1 then
	if DuanWuJieHuoDong_LoadingTimeTriggerGID ~= nil then
		API_DestroyTriggerG(DuanWuJieHuoDong_LoadingTimeTriggerGID)
	end
	DuanWuJieHuoDong_LoadingTimeTriggerGID = API_CreateTimerTriggerG(0,0,10,1,'TW_DuanWuJieHuoDongServerOpen')
end

function TW_DuanWuJieHuoDongServerOpen(Param1,Param2)
	if API_GetServerID() == 1 then
		local StartTimeTable = DuanWuJieHuoDong_StartTime
		local EndTimeTable = DuanWuJieHuoDong_EndTime
		local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
		local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
		if nShiFouStart > 0 then
			--活动未开始
			DuanWuDaShi_DestroyNPC()
			if DuanWuJieHuoDong_StartDateTimeTriggerGID == nil then
				DuanWuJieHuoDong_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'DuanWuDaShi_CreateNPC')
			else
				API_DestroyTriggerG(DuanWuJieHuoDong_StartDateTimeTriggerGID)
				DuanWuJieHuoDong_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'DuanWuDaShi_CreateNPC')
			end
			if DuanWuJieHuoDong_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(DuanWuJieHuoDong_EndDateTimeTriggerGID)
			end
		elseif nShiFouStart <= 0 and nShiFouEnd > 0 then
			--活动开始
			DuanWuDaShi_CreateNPC()
			if DuanWuJieHuoDong_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(DuanWuJieHuoDong_StartDateTimeTriggerGID)
			end
		elseif nShiFouEnd <= 0 then
			--活动结束
			DuanWuDaShi_DestroyNPC()
			if DuanWuJieHuoDong_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(DuanWuJieHuoDong_StartDateTimeTriggerGID)
			end
			if DuanWuJieHuoDong_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(DuanWuJieHuoDong_EndDateTimeTriggerGID)
			end
		end
	end
end

function DuanWuDaShi_CreateNPC()
	--创建帝国活动npc
	if API_GetServerID() == 1 then
		if DuanWuDaShi_DGNPCFastID1 == nil then
			DuanWuDaShi_DGNPCFastID1 = API_CreateMonsterEx(9,12377,170,368,4,0,-1,1)
		else
			if API_GetMonsterID(DuanWuDaShi_DGNPCFastID1) > 0 then
				API_DestroyMonster(DuanWuDaShi_DGNPCFastID1)
			end
			DuanWuDaShi_DGNPCFastID1 = API_CreateMonsterEx(9,12377,170,368,4,0,-1,1)
		end
	end
	
	--创建联邦活动npc
	if API_GetServerID() == 1 then
		if DuanWuDaShi_LBNPCFastID1 == nil then
			DuanWuDaShi_LBNPCFastID1 = API_CreateMonsterEx(25,12377,123,322,4,0,-1,1)
		else
			if API_GetMonsterID(DuanWuDaShi_LBNPCFastID1) > 0 then
				API_DestroyMonster(DuanWuDaShi_LBNPCFastID1)
			end
			DuanWuDaShi_LBNPCFastID1 = API_CreateMonsterEx(25,12377,123,322,4,0,-1,1)
		end
	end
	
	local StartTimeTable = DuanWuJieHuoDong_StartTime
	local EndTimeTable = DuanWuJieHuoDong_EndTime
	--创结束触发器
	if DuanWuJieHuoDong_EndDateTimeTriggerGID == nil then
		DuanWuJieHuoDong_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'DuanWuDaShi_DestroyNPC')
	else
		API_DestroyTriggerG(DuanWuJieHuoDong_EndDateTimeTriggerGID)
		DuanWuJieHuoDong_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'DuanWuDaShi_DestroyNPC')
	end
end

function DuanWuDaShi_DestroyNPC()
	--删除帝国活动npc
	if DuanWuDaShi_DGNPCFastID1 ~= nil then
		if API_GetMonsterID(DuanWuDaShi_DGNPCFastID1) > 0 then
			API_DestroyMonster(DuanWuDaShi_DGNPCFastID1)
		end
	end
	
	--删除联邦活动npc
	if DuanWuDaShi_LBNPCFastID1 ~= nil then
		if API_GetMonsterID(DuanWuDaShi_LBNPCFastID1) > 0 then
			API_DestroyMonster(DuanWuDaShi_LBNPCFastID1)
		end
	end
	
end


------------------------------------------------------------------------------------------------------------------------------------------
--怪物掉材料函数
------------------------------------------------------------------------------------------------------------------------------------------
--杀怪回调函数（在麦穗25，珊瑚10，暗礁9，阳光雨林23） 服务器2345 10
function DuanWuJieHuoDong_KillMonster(ActorID,TaskID,MonsterID,MonsterMapID,MonsterX,MonsterY)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local MapID = API_GetActorMapID(ActorID)--获取玩家的地图ID
	--API_Trace('MapID='..MapID)
	local StaticMapID = API_GetStaticMapID(MapID)
	--API_Trace('StaticMapID='..StaticMapID)
	local ActorLV = API_GetActorExpLevel(ActorID)
	local StartTimeTable = DuanWuJieHuoDong_StartTime
	local EndTimeTable = DuanWuJieHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if Hour >= 12  and Hour < 15 then
			if MapID == StaticMapID then
				local MonsterLV = API_GetMonsterLvByID(MonsterID)
				if MonsterLV >= 1 and MonsterLV <= 25 then
						local GoodsTable = localtable_TW_DuanWuJieHuoDong_GoodsTable[math.random(3)]
						local GoodsId = GoodsTable.GoodsID
						local Odds = GoodsTable.Odds
						local number = math.random(10000)
						if number <= Odds then
							API_CreateDropGoods(MapID,MonsterX,MonsterY,GoodsId,1,3,'掉落端午节活动道具',0,ActorID,180,60)
						end
				end
			end
		end
	end
end

--上线回调
function DuanWuJieHuoDong_OnLogin()
	local ActorID = API_RequestGetActorID()
	local StartTimeTable = DuanWuJieHuoDong_StartTime
	local EndTimeTable = DuanWuJieHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		local KillMonsterTriggerID = API_VarDataGetNumber(ActorID,1,30301)--获取数字变量值，杀怪触发器ID
		API_DestroyTrigger(ActorID,-1,KillMonsterTriggerID)--删除触发器
		local KillMonsterTriggerID = API_CreateKillMonsterTrigger(ActorID,0,-1,0,0,-1,'DuanWuJieHuoDong_KillMonster')
		API_VarDataSetNumber(ActorID,1,30301,KillMonsterTriggerID)
	else
		local KillMonsterTriggerID = API_VarDataGetNumber(ActorID,1,30196)
		API_DestroyTrigger(ActorID,-1,KillMonsterTriggerID)--删除触发器		
	end
end

--下线回调
function DuanWuJieHuoDong_OnLogout()
	local ActorID = API_RequestGetActorID()
	local KillMonsterTriggerID = API_VarDataGetNumber(ActorID,1,30301)
	API_DestroyTrigger(ActorID,-1,KillMonsterTriggerID)--删除触发器
end

--进入地图回调
function DuanWuJieHuoDong_OnLoginMap()
	local ActorID = API_RequestGetActorID()
	local StartTimeTable = DuanWuJieHuoDong_StartTime
	local EndTimeTable = DuanWuJieHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		local KillMonsterTriggerID = API_VarDataGetNumber(ActorID,1,30301)--获取数字变量值，杀怪触发器ID
		API_DestroyTrigger(ActorID,-1,KillMonsterTriggerID)--删除触发器
		local KillMonsterTriggerID = API_CreateKillMonsterTrigger(ActorID,0,-1,0,0,-1,'DuanWuJieHuoDong_KillMonster')
		API_VarDataSetNumber(ActorID,1,30301,KillMonsterTriggerID)
	else
		local KillMonsterTriggerID = API_VarDataGetNumber(ActorID,1,30301)
		API_DestroyTrigger(ActorID,-1,KillMonsterTriggerID)--删除触发器		
	end
end

--离开地图回调
function DuanWuJieHuoDong_OnLogoutMap()
	local ActorID = API_RequestGetActorID()
	local KillMonsterTriggerID = API_VarDataGetNumber(ActorID,1,30301)
	API_DestroyTrigger(ActorID,-1,KillMonsterTriggerID)--删除触发器
end

---------------------------------------------------------------------------------------------------------------------------------------------
--NPC点击函数
---------------------------------------------------------------------------------------------------------------------------------------------
function DuanWuJieHuoDong_ZongZiSofie(ActorID,NPCID,XuanZe,Num)
	local ActorLV = API_GetActorExpLevel(ActorID)
	if ActorLV > 10 then
		API_ResponseWrite('<name>粽子商人</name>')       	
		--API_ResponseWrite('<text></text><br>')
		API_ResponseWrite('<text>  亲爱的玩家，端午节活动期间在麦穗，暗礁，阳光雨林，珊瑚群岛的怪物将会有几率掉兑换粽子材料噢。</text><br>')
		API_ResponseWrite('<br><text color="255,0,255">       （注意:活动期间12:00-15:00怪物才会掉落材料.兑换粽子结束时间6月25日0点前。）</text><br><br><br>')
		API_ResponseWrite('<text color="255,0,255">        物品                               条件                            兑换      </text><br>')
		API_ResponseWrite('<text>  黄金粽（</text><img srcgd="'..GoodsID4..'" tipgd="'..GoodsID4..'" ><text>X1）</text>')
		API_ResponseWrite('<text>          （</text><img srcgd="'..GoodsID1..'" tipgd="'..GoodsID1..'" ><text>X5）</text>')
		API_ResponseWrite('<text> （</text><img srcgd="'..GoodsID3..'" tipgd="'..GoodsID3..'" ><text>X5）</text>')
		API_ResponseWrite('<text> （</text><img srcgd="'..GoodsID2..'" tipgd="'..GoodsID2..'" ><text>X5）</text>')
		API_ResponseWrite('<a href="DuanWuDaShi_DuiHua_Title?1=1">           兑换黄金粽子</a><br>')
		--API_ResponseWrite('<br><a>确定</a>')
	else
		API_ResponseWrite('<text>参与端午节兑换粽子活动必须达到11级或以上，您当前的等级不够。</text><br><br><br><br>')
		API_ResponseWrite('<a>确定</a>')
	end		
end

function DuanWuDaShi_DuiHua_Title()
	local SelectItem = API_RequestGetNumber(1)
	local ActorID = API_RequestGetActorID()
	
	--DuanWuDaShi_Initialization(ActorID)
	if SelectItem == 1 then
		API_ResponseWrite('<text>兑换青铜粽需要消耗：粽叶5个、粽绳5个、糯米5个</text')
		API_ResponseWrite('<text> （</text><img srcgd="'..GoodsID1..'" tipgd="'..GoodsID1..'" ><text>）</text>')
		API_ResponseWrite('<text> （</text><img srcgd="'..GoodsID3..'" tipgd="'..GoodsID3..'" ><text>）</text>')
		API_ResponseWrite('<text> （</text><img srcgd="'..GoodsID2..'" tipgd="'..GoodsID2..'" ><text>）</text>><br>')
		
		API_ResponseWrite('<br><a href="DuanWuDaShi_DuiHua_Title?1=2">确定兑换</a><br><br>')
		API_ResponseWrite('<a>取消</a>')
	
	elseif SelectItem == 2 then
		--if API_VarDataGetNumber(ActorID,1,30302) >= 10000000 then
			--API_ResponseWrite('<text>每个玩家每天只能兑换10000000个黄金粽子，您今天已经兑换过10000000次了。</text><br>')
			--API_ResponseWrite('<a>确定</a>')
			--return
		--end
		if API_ActorCanAddGoods(ActorID,GoodsID4,1,3,0) == -1 then
			API_ResponseWrite('<text>您的背包空间不够，请至少保证一个空格再兑换。</text><br>')
			API_ResponseWrite('<a>关闭</a>')
			return	
		end
		if API_ActorGetGoodsNum(ActorID,GoodsID1) > 4 and API_ActorGetGoodsNum(ActorID,GoodsID2) > 4 and API_ActorGetGoodsNum(ActorID,GoodsID3) > 4 then
			if API_ActorRemoveGoods(ActorID,GoodsID1,5,'扣除道具') and API_ActorRemoveGoods(ActorID,GoodsID2,5,'扣除道具') and API_ActorRemoveGoods(ActorID,GoodsID3,5,'扣除道具') then
				API_AddActorGoodsFlag(ActorID,GoodsID4,1,3,'兑换黄金粽')
				API_ActorSendMsg(ActorID,3,'成功兑换1个黄金粽')
				--local Num = API_VarDataGetNumber(ActorID,1,30302)
				--Num = Num + 1
				--API_VarDataSetNumber(ActorID,1,30302,Num)
			end
		else
			API_ResponseWrite('<name>粽子商人</name>')      
			API_ResponseWrite('<text>您身上的材料不足，不能兑换。</text><br><br><br>')
			API_ResponseWrite('<a>确定</a>')
		end
	
	end
end

--[[function DuanWuDaShi_Initialization(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local NowTime = os.time()
	if NowTime > API_VarDataGetNumber(ActorID,1,30303) then
		local NowTime = os.date("*t", os.time())
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 23
		NowTime.min = 59
		NowTime.sec = 59
		local NightTime = os.time(NowTime)
		local NextTime = NightTime + 1
		API_VarDataSetNumber(ActorID,1,30302,0)
		API_VarDataSetNumber(ActorID,1,30303,NextTime)
	end
end]]--
----------------------------------------------------------------------------------------------------------------------------------------
--粽子使用功能:得随机BUFF（黄金与粽子）
--API_ActorAddStatus(long lActorID, long lStatusID, long lTime);// lTime: 状态时间（MS），如果默认等于0则取脚本时间// 返回: 成功与否
--API_ActorRemoveStatus(long lActorID, 2081005);
--bool API_ActorFindStatus(long lActorID, long lStatusMainID);// lStatusMainID: 主状态ID（详细问何林）// 返回: 存在与否
-----------------------------------------------------------------------------------------------------------------------------------------	
function DuanWuJieHuoDong_ZongZiUse (ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	
	--local ActorID = API_RequestGetActorID()
	--local XuanZe = API_RequestGetNumber(1)
	--API_Trace('XuanZe='..XuanZe)
	
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	--local MainStatID = API_ActorFindStatus(ActorID, 2081)
	--API_Trace('MainStatID='..MainStatID)
	--API_Trace('GoodsID1='..GoodsID)
	--[[if API_ActorFindStatus(ActorID, 2081) then
		API_ResponseWrite('<name>温馨提示</name>')
		API_ResponseWrite('<text>     您当前角色存在粽子的状态,使用粽子将会随机一个状态，以前的状态不能叠加哦。</text><br><br>')
		API_ResponseWrite('<a href="DuanWuJieHuoDong_ZongZiUse?1=2">           确定</a><br>')
		--API_ResponseWrite('<a>     确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	else]]--
		if GoodsID == tRadomStateIDGoods1[1].nGoodsID then
			--API_Trace('1111='..tRadomStateIDGoods1[1].nGoodsID)
			if API_ActorGetGoodsNum(ActorID,tRadomStateIDGoods1[1].nGoodsID) > 0 and API_ActorRemoveGoods(ActorID,tRadomStateIDGoods1[1].nGoodsID,1,'使用黄金粽') then
				--7200000MS
				local nRadomGoods = math.random(1,tRadomStateIDGoods1[1].tRadomStateIDNum);
				--API_Trace('111nRadomGoods='..nRadomGoods)
				API_ActorAddStatus(ActorID, tRadomStateIDGoods1[1].tRadomStateID[nRadomGoods],7200000) 
				--API_Trace('tRadomStateIDGoods1[1].tRadomStateID[nRadomGoods]='..tRadomStateIDGoods1[1].tRadomStateID[nRadomGoods])
				return 1
			end
		elseif  GoodsID == tRadomStateIDGoods2[1].nGoodsID then
			--API_Trace('222='..tRadomStateIDGoods2[1].nGoodsID)
			if API_ActorGetGoodsNum(ActorID,tRadomStateIDGoods2[1].nGoodsID) > 0 and API_ActorRemoveGoods(ActorID,tRadomStateIDGoods2[1].nGoodsID,1,'使用黄金粽') then
				local nRadomGoods = math.random(1,tRadomStateIDGoods2[1].tRadomStateIDNum);
				--API_Trace('222nRadomGoods='..nRadomGoods)
				API_ActorAddStatus(ActorID, tRadomStateIDGoods2[1].tRadomStateID[nRadomGoods],7200000) 
				return 1
			end
		end
	--end
	--[[if XuanZe == 2 then
		if GoodsID == tRadomStateIDGoods1[1].nGoodsID then
			--API_Trace('1111='..tRadomStateIDGoods1[1].nGoodsID)
			if API_ActorGetGoodsNum(ActorID,tRadomStateIDGoods1[1].nGoodsID) > 0 and API_ActorRemoveGoods(ActorID,tRadomStateIDGoods1[1].nGoodsID,1,'使用黄金粽') then
				--7200000MS
				local nRadomGoods = math.random(1,tRadomStateIDGoods1[1].tRadomStateIDNum);
				--API_Trace('111nRadomGoods='..nRadomGoods)
				API_ActorAddStatus(ActorID, tRadomStateIDGoods1[1].tRadomStateID[nRadomGoods],7200000) 
				--API_Trace('tRadomStateIDGoods1[1].tRadomStateID[nRadomGoods]='..tRadomStateIDGoods1[1].tRadomStateID[nRadomGoods])
				return 1
			end
		elseif  GoodsID == tRadomStateIDGoods2[1].nGoodsID then
			--API_Trace('222='..tRadomStateIDGoods2[1].nGoodsID)
			if API_ActorGetGoodsNum(ActorID,tRadomStateIDGoods2[1].nGoodsID) > 0 and API_ActorRemoveGoods(ActorID,tRadomStateIDGoods2[1].nGoodsID,1,'使用黄金粽') then
				local nRadomGoods = math.random(1,tRadomStateIDGoods2[1].tRadomStateIDNum);
				--API_Trace('222nRadomGoods='..nRadomGoods)
				API_ActorAddStatus(ActorID, tRadomStateIDGoods2[1].tRadomStateID[nRadomGoods],7200000) 
				return 1
			end
		end
	end]]
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
--端午节宝箱使用函数（付费）
---------------------------------------------------------------------------------------------------------------------------------------------------------
function DuanWuJieHuoDong_LiBaoSofieUse (ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if DuanWuJieHuoDong_BoxTable[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return 0
	end
	if API_ActorGetPackageSize(ActorID) < 2 then
		API_ActorSendMsg(ActorID,3,'背包已满，无法使用')
		return 0
	end
	--聚集人气判断
	local Time = os.time() 
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Week == 7 and Hour == 23 and API_GetServerID() ~= 1 then
		API_ResponseWrite('<name>端午节宝箱</name>')
		API_ResponseWrite('<br>br><text size="16" color="117,252,255">您好，每周日 23点 以后必须在主城才可以打开端午节宝箱。</text><br>')
		API_ResponseWrite('<br><br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	--根据玩家使用等级判断调用不同的奖励表
	local PlayName = API_GetActorName(ActorID)
	local PlayLv = API_GetActorExpLevel(ActorID)
	local nJiangLiQuYu = 1
	if PlayLv > 25 then
		nJiangLiQuYu = 2
	end
	local JiangLiTable = DuanWuJieHuoDong_BoxTable[GoodsID][nJiangLiQuYu]
	local JiangLiGaiLv = math.random(10000000)
	local JiangLiGoodsID,JiangLiGoodsNum = 0,0
	
	for j in JiangLiTable do
		local GaiLv1 = JiangLiTable[j].GaiLv1
		local GaiLv2 = JiangLiTable[j].GaiLv2
		--具体物品的奖励区间判断
		if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
			JiangLiGoodsID = JiangLiTable[j].GoodsID
			local NumGaiLv = JiangLiTable[j].NumGaiLv
			local NumMax = JiangLiTable[j].NumMax
			local NumMin = JiangLiTable[j].NumMin
			local NumRandom = math.random(10000)
			--具体物品是否真正幸运得到判断
			if NumRandom <= NumGaiLv then
				JiangLiGoodsNum = NumMax
			else
				JiangLiGoodsNum = NumMin
			end
			--如果没有幸运得到则奖励圣果
			if JiangLiGoodsNum > 0 then
				if DuanWuJieHuoDong_BoxCdGoods[JiangLiGoodsID] ~= nil then
					local CD = API_VarDataGetNumber_Ex(1, 0, -6188, 1, 1)
					if Time >= CD then
						Time = Time + math.random(300,900)
						API_VarDataSetNumber_Ex_Sync(1, 0, -6188, 1, 1, Time)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1
					end
				--幸运星的特殊处理
				elseif LRY_LuckStar_MaxGoodsNumTable[JiangLiGoodsID] ~= nil then
					local Num = LRY_LuckStar_MaxGoodsNumTable[JiangLiGoodsID].Num
					local MaxNum = LRY_LuckStar_MaxGoodsNumTable[JiangLiGoodsID].MaxNum
					if Num < MaxNum then
						Num = Num + JiangLiGoodsNum
						LRY_LuckStar_MaxGoodsNumTable[JiangLiGoodsID].Num = Num 
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1
					end
				--载具的特殊处理	
				elseif DuanWuJieHuoDong_BoxZaiJvGoods[JiangLiGoodsID] ~= nil then
					local CD = API_VarDataGetNumber_Ex(1, 0, -6188, 1, 5)
					if Time >= CD then
						local Key = DuanWuJieHuoDong_BoxZaiJvGoods[JiangLiGoodsID].Key
						local Max = DuanWuJieHuoDong_BoxZaiJvGoods[JiangLiGoodsID].Max
						local Now = API_VarDataGetNumber_Ex(1, 0, -6188, 1, Key)
						if Now < Max then
							Now = Now + 1
							API_VarDataSetNumber_Ex_Sync(1, 0, -6188, 1, Key, Now)
							Time = Time + math.random(1200,2400)
							API_VarDataSetNumber_Ex_Sync(1, 0, -6188, 1, 5, Time)
						else
							JiangLiGoodsID = 250
							JiangLiGoodsNum = 1
						end
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1
					end
				--秘籍独立处理	
				elseif DuanWuJieHuoDong_BoxBookGoods[JiangLiGoodsID] ~= nil then
					local CD = API_VarDataGetNumber_Ex(1, 0, -6188, 1, 2)
					if Time >= CD then
						Time = Time + (math.random(20,40) * 60)
						API_VarDataSetNumber_Ex_Sync(1, 0, -6188, 1, 2, Time)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1
					end
				--背饰[白银](3档)【限量每天一件】每天一件	
				elseif JiangLiGoodsID == 11071 then
					local NowTime = os.time()
					local NextTime = API_VarDataGetNumber_Ex(1,0,-6188,1,6)
					if NowTime >= NextTime then
						local CDTime = 86400
						NextTime = NowTime + CDTime
						API_VarDataSetNumber_Ex_Sync(1,0,-6188,1,6,NextTime)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1												
					end	
				elseif JiangLiGoodsID == 11072 then
					local NowTime = os.time()
					local NextTime = API_VarDataGetNumber_Ex(1,0,-6188,1,7)
					if NowTime >= NextTime then
						local CDTime = 86400
						NextTime = NowTime + CDTime
						API_VarDataSetNumber_Ex_Sync(1,0,-6188,1,7,NextTime)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1												
					end
				elseif JiangLiGoodsID == 11073 then
					local NowTime = os.time()
					local NextTime = API_VarDataGetNumber_Ex(1,0,-6188,1,8)
					if NowTime >= NextTime then
						local CDTime = 86400
						NextTime = NowTime + CDTime
						API_VarDataSetNumber_Ex_Sync(1,0,-6188,1,8,NextTime)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1												
					end
				elseif JiangLiGoodsID == 11074 then
					local NowTime = os.time()
					local NextTime = API_VarDataGetNumber_Ex(1,0,-6188,1,9)
					if NowTime >= NextTime then
						local CDTime = 604800
						NextTime = NowTime + CDTime
						API_VarDataSetNumber_Ex_Sync(1,0,-6188,1,9,NextTime)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1												
					end
				elseif JiangLiGoodsID == 89137 then
					local NowTime = os.time()
					local NextTime = API_VarDataGetNumber_Ex(1,0,-6188,1,62)
					if NowTime >= NextTime then
						local CDTime = 604800
						NextTime = NowTime + CDTime
						API_VarDataSetNumber_Ex_Sync(1,0,-6188,1,62,NextTime)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1												
					end
				elseif JiangLiGoodsID == 89142 then
					local NowTime = os.time()
					local NextTime = API_VarDataGetNumber_Ex(1,0,-6188,1,60)
					if NowTime >= NextTime then
						local CDTime = 604800
						NextTime = NowTime + CDTime
						API_VarDataSetNumber_Ex_Sync(1,0,-6188,1,60,NextTime)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1												
					end
				elseif JiangLiGoodsID == 89147 then
					local NowTime = os.time()
					local NextTime = API_VarDataGetNumber_Ex(1,0,-6188,1,61)
					if NowTime >= NextTime then
						local CDTime = 604800
						NextTime = NowTime + CDTime
						API_VarDataSetNumber_Ex_Sync(1,0,-6188,1,61,NextTime)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1												
					end						
				elseif DuanWuJieHuoDong_Txl[JiangLiGoodsID]~= nil then
					
					local Key = DuanWuJieHuoDong_Txl[JiangLiGoodsID].Key
					local Max = DuanWuJieHuoDong_Txl[JiangLiGoodsID].Max
					local Now = API_VarDataGetNumber_Ex(1, 0, -6187, 1, Key)
					if Now < Max then
						Now = Now + 1
						API_VarDataSetNumber_Ex_Sync(1, 0, -6187, 1, Key, Now)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1
					end

				end
			else
				--没有幸运得到则给圣果
				JiangLiGoodsID = 250 
				JiangLiGoodsNum = 1
			end
			break
		end
	end
	
	if API_ActorRemoveGoods(ActorID, GoodsID, 1, '打开端午节宝箱') then
		--local UseNum = API_VarDataGetNumber(ActorID,1,30304)
		--UseNum = UseNum + 1
		--API_VarDataSetNumber(ActorID,1,30304,UseNum)
		local PD = 0
		--if API_IsOwnedName(ActorID,205,1) == 1 then
		--else
			--if UseNum > 0 and math.mod(UseNum,100) == 0 then
				--API_SetPlayerNickName(ActorID,205,'',1,0,1,1,{884001})
				--PD = 1
				--local HuoDong = 1
				--MLB_Scroll_Select(ActorID,HuoDong)
			--end
		--end
		local PD2 = 0
		for j,v in baoshiwupinbiao do
			if JiangLiGoodsID == v then
				PD2 = 1
				break
			end
		end
		if JiangLiGoodsID == 76 then
			PD2 = 2
		end
		if PD2 == 1 then
			fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
		elseif PD2 == 2 then
			AddStarLvPetCapsuleFunc(ActorID,1)
		else
			API_AddActorGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,'端午节宝箱奖励')
			--API_Trace('7JiangLiGoodsID=='..JiangLiGoodsID)
			for k,v in tDuanWuJieBrodcastsofie do
				if JiangLiGoodsID == v then
					API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'打开端午节宝箱得到'..API_GetGoodsName(JiangLiGoodsID)..'')
				end
			end
		end
		API_ActorSendMsg(ActorID,7,'端午节赐福，获得：'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="150,150,300,220" alpha="240" balpha="230"></win>') 
		API_ResponseWrite('<br>br><text size="16" color="117,252,255">端午节赐福！鸿运当头！</text><br>')
		API_ResponseWrite('<br><text color="255,0,255">打开端午节宝箱获得：</text><img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'"><text> × '..JiangLiGoodsNum..'</text><br>')
		
		--if PD == 1 then
			--API_ResponseWrite('<br><br><text size="16" color="0,255,0">恭喜获得：财神称号。</text><br>')
			--if not API_IsBattleGameServer() then
			--	API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..PlayName..'打开财神宝箱获得“财神”称号！')
			--end
		--end
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
		if DuanWuJieHuoDong_BoxSayWorld[JiangLiGoodsID] ~= nil then
			local JiaZhi = DuanWuJieHuoDong_BoxSayWorld[JiangLiGoodsID] 
			local GoodsName = API_GetGoodsName(JiangLiGoodsID)
			if not API_IsBattleGameServer() then
				if JiaZhi == 0 then
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..PlayName..'打开端午节宝箱获得了最新英雄秘籍：'..GoodsName..'！')
				elseif JiaZhi == 1 then
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..PlayName..'打开端午节宝箱获得了：'..GoodsName..'！')
				else
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..PlayName..'打开端午节宝箱获得了：'..GoodsName..'！')
				end
			end
		end
		--额外 奖励给予
		if DuanWuJieHuoDong_GodBoxCDTime[Hour] ~= nil then
			local CDKey = 10
			local CD = API_VarDataGetNumber_Ex(1, 0, -6188, 1, CDKey)
			local AllNum = API_VarDataGetNumber_Ex(1, 0, -6188, 1, 58)
			local MaxNum = DuanWuJieHuoDong_GodBoxCDTime[Hour].MaxNum
			local CDmin = DuanWuJieHuoDong_GodBoxCDTime[Hour].CDmin
			local CDmax = DuanWuJieHuoDong_GodBoxCDTime[Hour].CDmax
			if AllNum < MaxNum and Time >= CD then
				local OtherTab = DuanWuJieHuoDong_GodBoxOtherGoods[math.random(table.getn(SpringFestival_GodBoxOtherGoods))]
				local GoodsID = OtherTab.GoodsID
				local Num = OtherTab.Num
				local Key = OtherTab.Key
				local Max = OtherTab.Max
				local NowNum = API_VarDataGetNumber_Ex(1, 0, -6188, 1, Key)
				if NowNum < Max then
					CD = Time + (math.random(CDmin,CDmax) * 60)
					API_VarDataSetNumber_Ex_Sync(1, 0, -6188, 1, CDKey, CD)
					NowNum = NowNum + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -6188, 1, Key, NowNum)
					AllNum = AllNum + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -6188, 1, 58, AllNum)
					if API_ActorCanAddGoods(ActorID,GoodsID,Num,0,0) ~= -1 then
						API_AddActorGoods(ActorID, GoodsID, Num, '端午节宝箱额外奖励')
						API_ActorSendMsg(ActorID,10,'打开端午节宝箱获得额外奖励：'..Num..'个'..API_GetGoodsName(GoodsID)..'')
					else
						API_SendActorMailByName(PlayName, GoodsID, Num, 0, '[端午宝箱]额外奖励', ''..Num..'个'..API_GetGoodsName(GoodsID)..'')
						API_ActorSendMsg(ActorID,10,'打开端午宝箱获得额外奖励：'..Num..'个'..API_GetGoodsName(GoodsID)..'（请到邮箱领取）')
					end
					if not API_IsBattleGameServer() then
						API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..PlayName..'打开端午节宝箱额外获得了：'..Num..'个'..API_GetGoodsName(GoodsID)..'！')
					end
				end
			end
		end
	end
	return 1
end


--跨天12点清除：端午节数据清除
function Hl_MeiRiDWJShuJuQingChu(Param1,Param2)

	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local NowTime = os.time()
	--API_Trace('WeekCCC'..Week)
	if API_GetServerID() == 1 then
		if NowTime > API_VarDataGetNumber_Ex(1,0,-6187,1,100) then
			--API_Trace('WeekCCCDGGA')
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,1,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,2,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,3,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,4,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,5,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,6,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,7,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,8,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,9,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,10,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,11,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,12,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,13,0)    
			local NowTime = os.date("*t", os.time()) 
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 12 
			NowTime.min = 0 
			NowTime.sec = 0 
			local NextTime = os.time(NowTime) 
			RefreshTimeSofieduanwujie = NextTime + 86400   
			API_VarDataSetNumber_Ex_Sync(1,0,-6187,1,100,RefreshTimeSofieduanwujie)                  
		end
	end
end