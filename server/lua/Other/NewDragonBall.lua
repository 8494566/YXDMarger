----------------------------------------------------------------------------------------------------------------
--文件名:   Scp\LUA\Other\NewDragonBall.lua
--时  间：  2011年12月22日
--创建人：  黄蕾
--版  权:  (C) 腾讯计算机有限公司
--用  途：  英雄岛
--描  叙：  新年龙珠新玩法：
--          时间点的怪物掉破龙珠
--          破龙珠兑换龙珠
--          龙珠兑换BUFF
--	    七星龙珠兑换BUFF的同时有几率得到许愿的机会
--	    许愿必然会实现，许愿内容为宠物，时装等
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
--修改人： 黄蕾
--时  间： 2011年12月26日
--内  容： 增加神龙许愿奖励，修改刷怪数量，增加神龙令功能
--时  间： 2011年12月27日
--内  容： 1,增加使用龙珠随机BUFF。2创建阳光，珊瑚，落日，娜沙地图NPC。3，奖励CD处理的强制奖励判断
--         4,将使用龙珠得BUFF换到NPC兑换BUFF.  5，增加龙珠盗贼刷新前的世界通告  
--时  间： 2011年12月29日
--内  容： 1修改龙珠ID。2修改龙珠强制绑定改为不绑定；3 修正服务器打印问题。
--时  间： 2012年1月6日
--内  容： 1jiangli
--时  间： 2012年1月10日
--内  容： 1,修改神龙令奖励表；2增加宝石使用增加特使的API;3,取消新年家具世界广播; 
--	   4,稀有奖励（即有数量上限的物品），统一增加一个5~10分钟的公共CDData=177
--     	   5，活动结束后就不要创建了，创建后用一个全局变量保存一下，然后每次创建前都要做一次删除上一个触发器的操作。
--时 间：  2012年1月11日
--内 容：  1，修改全局变量相同的问题，2体验感指引修改,3修改砸蛋奖励
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
--信息定义区
--以下是可配置区 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
----------------------------------------------------------------------------------------------------------------
----#创建NPC信息定义
local nNpcID    = 12375 --神龙使者ID
--活动时间
local tNewDragonBall_StartTime = {Year = 2012,Month = 1,Day = 10,Hour = 12,Minute = 0,Second = 0} 
local tNewDragonBall_EndTime = {Year = 2012,Month = 1,Day = 31,Hour = 23,Minute = 59,Second = 59}
--联邦TILE坐标
local nLBNpcID_X = 245        
local nLBNpcID_Y = 173
--帝国TILE坐标
local nDGNpcID_X = 212
local nDGNpcID_Y = 210
--阳光雨林23
local nSLSZID_YGX = 135
local nSLSZID_YGY = 320
--珊瑚群岛10
local nSLSZID_SHX = 138
local nSLSZID_SHY = 296
--落日农庄99
local nSLSZID_LRX =379
local nSLSZID_LRY =366
--娜沙湿地98
local nSLSZID_LSX = 372
local nSLSZID_LSY = 370

----#创建地图怪物信息定义
local tNewDragonBall_Map = {23,10,99,98} --阳光雨林2,3,4,5,10,珊瑚群岛2,3,4,5,10,落日农庄7,6娜沙湿地23,10,99,98
--地表怪物刷前系统播报时间表
local tNewDragonBall_MT = 
	{                                           
		[1] = {nStartHour = 12,nStartMinute = 0,nStartSecond = 0,nEndHour = 13,nEndMinute = 0,nEndSecond = 0,},
		[2] = {nStartHour = 19,nStartMinute = 0,nStartSecond = 0,nEndHour = 20,nEndMinute = 0,nEndSecond = 0,},
	}
--地表怪物，地图对应，怪物类型和怪物ID
local tNewDragonBall_MS = 
	{   
	   [23] = {1,731219},
	   [10] = {1,731219},
	   [98] = {2,731220},
	   [99] = {2,731220},
	    --[2] = {2,730024},
	  -- [1] = {1,730024},
	}
--怪物最少最多数量
local tNewDragonBall_Number = {         
   [1] = {least = 100 ,most = 150},
   [2] = {least = 100 ,most = 150},
}
--野外怪物掉落
local tDragonBall_YeWaiGoods = {            
    [1] = {
	        [1] = {GoodsID=82037,GoodsNum=1,GaiLv=500,nRadomNum = 6, PinZhi=0},
	       -- [2] = {GoodsID=82037,GoodsNum=1,GaiLv=2000,nRadomNum = 6,PinZhi=0},
	       -- [3] = {GoodsID=82037,GoodsNum=1,GaiLv=1500,PinZhi=0},
		--[4] = {GoodsID=82037,GoodsNum=1,GaiLv=3000,PinZhi=0},
		--[5] = {GoodsID=82037,GoodsNum=1,GaiLv=3000,PinZhi=0},
		--[6] = {GoodsID=82037,GoodsNum=1,GaiLv=3000,PinZhi=0},
		--[7] = {GoodsID=82037,GoodsNum=1,GaiLv=3000,PinZhi=0},
	 },

    [2] = {
	        [1] = {GoodsID=82037,GoodsNum=1,GaiLv=500,nRadomNum = 6,PinZhi=0},
	        --[2] = {GoodsID=82037,GoodsNum=1,GaiLv=2000,PinZhi=0},
	       -- [3] = {GoodsID=82037,GoodsNum=1,GaiLv=1500,PinZhi=0},
		--[4] = {GoodsID=82037,GoodsNum=1,GaiLv=3000,PinZhi=0},
		--[5] = {GoodsID=82037,GoodsNum=1,GaiLv=3000,PinZhi=0},
		--[6] = {GoodsID=82037,GoodsNum=1,GaiLv=3000,PinZhi=0},
		--[7] = {GoodsID=82037,GoodsNum=1,GaiLv=3000,PinZhi=0},
	  }

}
----#龙珠兑换信息表
local tDragonBallContent = {
	[1]= 
	 {
		 {nName="一星龙珠",GoodsID= 82038,nGoodsID2= 82037,nNeedGoodsNum=2,nstring = "  ",},
		 {nName="二星龙珠",GoodsID= 82039,nGoodsID2= 82038,nNeedGoodsNum=2,nstring = "  ",},
		 {nName="三星龙珠",GoodsID= 82040,nGoodsID2= 82039,nNeedGoodsNum=2,nstring = "  ",},
		 {nName="四星龙珠",GoodsID= 82041,nGoodsID2= 82040,nNeedGoodsNum=2,nstring = "  ",},
		 {nName="五星龙珠",GoodsID= 82042,nGoodsID2= 82041,nNeedGoodsNum=2,nstring = "  ",},
		 {nName="六星龙珠",GoodsID= 82043,nGoodsID2= 82042,nNeedGoodsNum=2,nstring = "  ",},
		 {nName="七星龙珠",GoodsID= 82044,nGoodsID2= 82043,nNeedGoodsNum=2,nstring = "  ",},
	 }
}
----#使用龙珠奖励BUFF表
--随机得到一个物品表
--{{使用的物品ID，随机抽取的物品表，随机表长，物品的作用出去如XX活动},{}}
local tGoods ={
	{nGoodsID=82038,tRadomStatusID={2007001,2007008,2007015,2007022,2007029,2007043,2007050,2007036,},nRadomGoodsIDNum=8,nGoodsFrom="一星龙珠兑换神龙祝福"},
	{nGoodsID=82039,tRadomStatusID={2007002,2007009,2007016,2007023,2007030,2007044,2007051,2007037,},nRadomGoodsIDNum=8,nGoodsFrom="二星龙珠兑换神龙祝福"},
	{nGoodsID=82040,tRadomStatusID={2007003,2007010,2007017,2007024,2007031,2007045,2007052,2007038,},nRadomGoodsIDNum=8,nGoodsFrom="三星龙珠兑换神龙祝福"},
	{nGoodsID=82041,tRadomStatusID={2007004,2007011,2007018,2007025,2007032,2007046,2007053,2007039,},nRadomGoodsIDNum=8,nGoodsFrom="四星龙珠兑换神龙祝福"},
	{nGoodsID=82042,tRadomStatusID={2007005,2007012,2007019,2007026,2007033,2007047,2007054,2007040,},nRadomGoodsIDNum=8,nGoodsFrom="五星龙珠兑换神龙祝福"},
	{nGoodsID=82043,tRadomStatusID={2007006,2007013,2007020,2007027,2007034,2007048,2007055,2007041,},nRadomGoodsIDNum=8,nGoodsFrom="六星龙珠兑换神龙祝福"},
	{nGoodsID=82044,tRadomStatusID={2007007,2007014,2007021,2007028,2007035,2007049,2007056,2007042,},nRadomGoodsIDNum=8,nGoodsFrom="七星龙珠兑换神龙祝福"},
	
};
--许愿触发几率表(此功能取消)
--许愿失败BUFF表(此功能取消)
--许愿界面
--[[local  tWishing = {        
	[1]= {nName="装备",nIcon=1060,nGoodsID= 80637,nGoodsID2= 80641,nIcon2=1066,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 70 ,nSuccess = 1 ,nstring = "  ",nNeedYunYouNum=40  ,nInteractiveData =4016,NextJH=4017,nS = 1 ,},--70
	[2]= {nName="时装",nIcon=1061,nGoodsID= 80638,nGoodsID2= 80641,nIcon2=1066,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 60 ,nSuccess = 0 ,nstring = "  ",nNeedYunYouNum=60 ,nInteractiveData =4017,NextJH=4018,nS = 0 ,},--60
	[3]= {nName="宠物",nIcon=1059,nGoodsID= 80639,nGoodsID2= 80641,nIcon2=1066,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 50 ,nSuccess = 0 ,nstring = "  ",nNeedYunYouNum=100 ,nInteractiveData =4018,NextJH=4019,nS = 0 ,},--50
	[4]= {nName="金币",nIcon=2691,nGoodsID= 80640,nGoodsID2= 80641,nIcon2=1066,nGoodsID3= 80641,nIcon3=2695,nGoodsID4= 80641,nIcon4=2696,nRandomRate= 60 ,nSuccess = 0 ,nstring = "  ",nNeedYunYouNum=200 ,nInteractiveData =4019,NextJH=4020,nS = 0 ,},--4	
	}]]--
--1-26奖励表

local ShenLongXuYuan = {
	[1]={
		{GoodsID=80383,GaiLv1=1,GaiLv2=1436093,NumMax=1,NumMin=1},
		{GoodsID=80381,GaiLv1=1436094,GaiLv2=2393489,NumMax=1,NumMin=1},
		{GoodsID=80397,GaiLv1=2393490,GaiLv2=3111536,NumMax=1,NumMin=1},
		{GoodsID=89042,GaiLv1=3111537,GaiLv2=3183341,NumMax=1,NumMin=1},
		{GoodsID=89040,GaiLv1=3183342,GaiLv2=3255146,NumMax=1,NumMin=1},
		{GoodsID=89041,GaiLv1=3255147,GaiLv2=3326951,NumMax=1,NumMin=1},
		{GoodsID=80394,GaiLv1=3326952,GaiLv2=3614170,NumMax=1,NumMin=1},
		{GoodsID=80181,GaiLv1=3614171,GaiLv2=5050264,NumMax=1,NumMin=1},
		{GoodsID=80191,GaiLv1=5050265,GaiLv2=6486358,NumMax=1,NumMin=1},
		{GoodsID=968,GaiLv1=6486359,GaiLv2=6629968,NumMax=1,NumMin=1},
		{GoodsID=904,GaiLv1=6629969,GaiLv2=6917187,NumMax=1,NumMin=1},
		{GoodsID=88080,GaiLv1=6917188,GaiLv2=7204406,NumMax=1,NumMin=1},
		{GoodsID=80234,GaiLv1=7204407,GaiLv2=7395886,NumMax=1,NumMin=1},
		{GoodsID=80276,GaiLv1=7395887,GaiLv2=7587366,NumMax=1,NumMin=1},
		{GoodsID=80281,GaiLv1=7587367,GaiLv2=8161804,NumMax=1,NumMin=1},
		{GoodsID=89056,GaiLv1=8161805,GaiLv2=8176165,NumMax=1,NumMin=1},
		{GoodsID=89059,GaiLv1=8176166,GaiLv2=8204887,NumMax=1,NumMin=1},
		{GoodsID=80686,GaiLv1=8204888,GaiLv2=8492106,NumMax=1,NumMin=1},
		{GoodsID=80689,GaiLv1=8492107,GaiLv2=8779325,NumMax=1,NumMin=1},
		{GoodsID=31101,GaiLv1=8779326,GaiLv2=8922935,NumMax=1,NumMin=1},
		{GoodsID=75,GaiLv1=8922936,GaiLv2=9210154,NumMax=1,NumMin=1},
		{GoodsID=39511,GaiLv1=9210155,GaiLv2=9238876,NumMax=1,NumMin=1},
		{GoodsID=39514,GaiLv1=9238877,GaiLv2=9267598,NumMax=1,NumMin=1},
		{GoodsID=39504,GaiLv1=9267599,GaiLv2=9296320,NumMax=1,NumMin=1},
		{GoodsID=39505,GaiLv1=9296321,GaiLv2=9325042,NumMax=1,NumMin=1},
		{GoodsID=39506,GaiLv1=9325043,GaiLv2=9353764,NumMax=1,NumMin=1},
		{GoodsID=11102,GaiLv1=9353765,GaiLv2=9382486,NumMax=1,NumMin=1},
		{GoodsID=11103,GaiLv1=9382487,GaiLv2=9401634,NumMax=1,NumMin=1},
		{GoodsID=11032,GaiLv1=9401635,GaiLv2=9420782,NumMax=1,NumMin=1},
		{GoodsID=11033,GaiLv1=9420783,GaiLv2=9435143,NumMax=1,NumMin=1},
		{GoodsID=11531,GaiLv1=9435144,GaiLv2=9449504,NumMax=1,NumMin=1},
		{GoodsID=11532,GaiLv1=9449505,GaiLv2=9459078,NumMax=1,NumMin=1},
		{GoodsID=11534,GaiLv1=9459079,GaiLv2=9473439,NumMax=1,NumMin=1},
		{GoodsID=11535,GaiLv1=9473440,GaiLv2=9483013,NumMax=1,NumMin=1},
		{GoodsID=40204,GaiLv1=9483014,GaiLv2=9578753,NumMax=1,NumMin=1},
		{GoodsID=40220,GaiLv1=9578754,GaiLv2=9674493,NumMax=1,NumMin=1},
		{GoodsID=40236,GaiLv1=9674494,GaiLv2=9770233,NumMax=1,NumMin=1},
		{GoodsID=31032,GaiLv1=9770234,GaiLv2=9784594,NumMax=1,NumMin=1},
		{GoodsID=31033,GaiLv1=9784595,GaiLv2=9798955,NumMax=1,NumMin=1},
		{GoodsID=88044,GaiLv1=9798956,GaiLv2=9856399,NumMax=1,NumMin=1},
		{GoodsID=88171,GaiLv1=9856400,GaiLv2=10000000,NumMax=1,NumMin=1},
	},
	[2]={
		{GoodsID=80384,GaiLv1=1,GaiLv2=1210997,NumMax=1,NumMin=1},
		{GoodsID=80382,GaiLv1=1210998,GaiLv2=2018329,NumMax=1,NumMin=1},
		{GoodsID=80181,GaiLv1=2018330,GaiLv2=2623828,NumMax=1,NumMin=1},
		{GoodsID=80192,GaiLv1=2623829,GaiLv2=3229327,NumMax=1,NumMin=1},
		{GoodsID=968,GaiLv1=3229328,GaiLv2=3350427,NumMax=1,NumMin=1},
		{GoodsID=904,GaiLv1=3350428,GaiLv2=3592627,NumMax=1,NumMin=1},
		{GoodsID=88080,GaiLv1=3592628,GaiLv2=3834827,NumMax=1,NumMin=1},
		{GoodsID=80235,GaiLv1=3834828,GaiLv2=3869427,NumMax=1,NumMin=1},
		{GoodsID=80277,GaiLv1=3869428,GaiLv2=3904027,NumMax=1,NumMin=1},
		{GoodsID=80282,GaiLv1=3904028,GaiLv2=3984761,NumMax=1,NumMin=1},
		{GoodsID=80624,GaiLv1=3984762,GaiLv2=4330761,NumMax=1,NumMin=1},
		{GoodsID=80625,GaiLv1=4330762,GaiLv2=4676761,NumMax=1,NumMin=1},
		{GoodsID=80626,GaiLv1=4676762,GaiLv2=5022761,NumMax=1,NumMin=1},
		{GoodsID=80628,GaiLv1=5022762,GaiLv2=5368761,NumMax=1,NumMin=1},
		{GoodsID=80629,GaiLv1=5368762,GaiLv2=5714761,NumMax=1,NumMin=1},
		{GoodsID=89057,GaiLv1=5714762,GaiLv2=5725771,NumMax=1,NumMin=1},
		{GoodsID=89060,GaiLv1=5725772,GaiLv2=5747790,NumMax=1,NumMin=1},
		{GoodsID=89042,GaiLv1=5747791,GaiLv2=5808340,NumMax=1,NumMin=1},
		{GoodsID=89040,GaiLv1=5808341,GaiLv2=5868890,NumMax=1,NumMin=1},
		{GoodsID=89041,GaiLv1=5868891,GaiLv2=5929440,NumMax=1,NumMin=1},
		{GoodsID=250,GaiLv1=5929441,GaiLv2=6413840,NumMax=1,NumMin=1},
		{GoodsID=80397,GaiLv1=6413841,GaiLv2=7019339,NumMax=1,NumMin=1},
		{GoodsID=75,GaiLv1=7019340,GaiLv2=7261539,NumMax=1,NumMin=1},
		{GoodsID=80394,GaiLv1=7261540,GaiLv2=7503739,NumMax=1,NumMin=1},
		{GoodsID=80686,GaiLv1=7503740,GaiLv2=7745939,NumMax=1,NumMin=1},
		{GoodsID=80689,GaiLv1=7745940,GaiLv2=7988139,NumMax=1,NumMin=1},
		{GoodsID=39511,GaiLv1=7988140,GaiLv2=8012359,NumMax=1,NumMin=1},
		{GoodsID=39514,GaiLv1=8012360,GaiLv2=8036579,NumMax=1,NumMin=1},
		{GoodsID=39504,GaiLv1=8036580,GaiLv2=8060799,NumMax=1,NumMin=1},
		{GoodsID=39505,GaiLv1=8060800,GaiLv2=8085019,NumMax=1,NumMin=1},
		{GoodsID=39506,GaiLv1=8085020,GaiLv2=8109239,NumMax=1,NumMin=1},
		{GoodsID=11102,GaiLv1=8109240,GaiLv2=8133459,NumMax=1,NumMin=1},
		{GoodsID=11103,GaiLv1=8133460,GaiLv2=8149606,NumMax=1,NumMin=1},
		{GoodsID=11032,GaiLv1=8149607,GaiLv2=8165753,NumMax=1,NumMin=1},
		{GoodsID=11033,GaiLv1=8165754,GaiLv2=8177863,NumMax=1,NumMin=1},
		{GoodsID=11531,GaiLv1=8177864,GaiLv2=8189973,NumMax=1,NumMin=1},
		{GoodsID=11532,GaiLv1=8189974,GaiLv2=8198047,NumMax=1,NumMin=1},
		{GoodsID=11534,GaiLv1=8198048,GaiLv2=8210157,NumMax=1,NumMin=1},
		{GoodsID=11535,GaiLv1=8210158,GaiLv2=8218231,NumMax=1,NumMin=1},
		{GoodsID=39704,GaiLv1=8218232,GaiLv2=8242451,NumMax=1,NumMin=1},
		{GoodsID=40206,GaiLv1=8242452,GaiLv2=8290891,NumMax=1,NumMin=1},
		{GoodsID=40222,GaiLv1=8290892,GaiLv2=8339331,NumMax=1,NumMin=1},
		{GoodsID=40238,GaiLv1=8339332,GaiLv2=8387771,NumMax=1,NumMin=1},
		{GoodsID=88101,GaiLv1=8387772,GaiLv2=8407147,NumMax=1,NumMin=1},
		{GoodsID=88102,GaiLv1=8407148,GaiLv2=8426523,NumMax=1,NumMin=1},
		{GoodsID=88103,GaiLv1=8426524,GaiLv2=8445899,NumMax=1,NumMin=1},
		{GoodsID=88104,GaiLv1=8445900,GaiLv2=8458009,NumMax=1,NumMin=1},
		{GoodsID=88105,GaiLv1=8458010,GaiLv2=8477385,NumMax=1,NumMin=1},
		{GoodsID=88106,GaiLv1=8477386,GaiLv2=8496761,NumMax=1,NumMin=1},
		{GoodsID=88107,GaiLv1=8496762,GaiLv2=8516137,NumMax=1,NumMin=1},
		{GoodsID=88108,GaiLv1=8516138,GaiLv2=8528247,NumMax=1,NumMin=1},
		{GoodsID=88109,GaiLv1=8528248,GaiLv2=8547623,NumMax=1,NumMin=1},
		{GoodsID=88110,GaiLv1=8547624,GaiLv2=8566999,NumMax=1,NumMin=1},
		{GoodsID=88111,GaiLv1=8567000,GaiLv2=8586375,NumMax=1,NumMin=1},
		{GoodsID=88112,GaiLv1=8586376,GaiLv2=8598485,NumMax=1,NumMin=1},
		{GoodsID=88113,GaiLv1=8598486,GaiLv2=8617861,NumMax=1,NumMin=1},
		{GoodsID=88114,GaiLv1=8617862,GaiLv2=8637237,NumMax=1,NumMin=1},
		{GoodsID=88115,GaiLv1=8637238,GaiLv2=8656613,NumMax=1,NumMin=1},
		{GoodsID=88116,GaiLv1=8656614,GaiLv2=8668723,NumMax=1,NumMin=1},
		{GoodsID=88117,GaiLv1=8668724,GaiLv2=8688099,NumMax=1,NumMin=1},
		{GoodsID=88118,GaiLv1=8688100,GaiLv2=8707475,NumMax=1,NumMin=1},
		{GoodsID=88119,GaiLv1=8707476,GaiLv2=8726851,NumMax=1,NumMin=1},
		{GoodsID=88120,GaiLv1=8726852,GaiLv2=8738961,NumMax=1,NumMin=1},
		{GoodsID=88121,GaiLv1=8738962,GaiLv2=8758337,NumMax=1,NumMin=1},
		{GoodsID=88122,GaiLv1=8758338,GaiLv2=8777713,NumMax=1,NumMin=1},
		{GoodsID=88123,GaiLv1=8777714,GaiLv2=8797089,NumMax=1,NumMin=1},
		{GoodsID=88124,GaiLv1=8797090,GaiLv2=8809199,NumMax=1,NumMin=1},
		{GoodsID=38352,GaiLv1=8809200,GaiLv2=8889933,NumMax=1,NumMin=1},
		{GoodsID=38353,GaiLv1=8889934,GaiLv2=8970667,NumMax=1,NumMin=1},
		{GoodsID=38354,GaiLv1=8970668,GaiLv2=9051401,NumMax=1,NumMin=1},
		{GoodsID=38355,GaiLv1=9051402,GaiLv2=9132135,NumMax=1,NumMin=1},
		{GoodsID=38356,GaiLv1=9132136,GaiLv2=9212869,NumMax=1,NumMin=1},
		{GoodsID=38357,GaiLv1=9212870,GaiLv2=9293603,NumMax=1,NumMin=1},
		{GoodsID=38358,GaiLv1=9293604,GaiLv2=9374337,NumMax=1,NumMin=1},
		{GoodsID=38359,GaiLv1=9374338,GaiLv2=9455071,NumMax=1,NumMin=1},
		{GoodsID=38360,GaiLv1=9455072,GaiLv2=9535805,NumMax=1,NumMin=1},
		{GoodsID=32101,GaiLv1=9535806,GaiLv2=9584245,NumMax=1,NumMin=1},
		{GoodsID=88044,GaiLv1=9584246,GaiLv2=9632685,NumMax=1,NumMin=1},
		{GoodsID=31032,GaiLv1=9632686,GaiLv2=9644795,NumMax=1,NumMin=1},
		{GoodsID=31033,GaiLv1=9644796,GaiLv2=9656905,NumMax=1,NumMin=1},
		{GoodsID=88171,GaiLv1=9656906,GaiLv2=9757822,NumMax=1,NumMin=1},
		{GoodsID=80951,GaiLv1=9757823,GaiLv2=9919289,NumMax=1,NumMin=1},
		{GoodsID=80387,GaiLv1=9919290,GaiLv2=10000000,NumMax=1,NumMin=1},
	},
	[3]={
		{GoodsID=80384,GaiLv1=1,GaiLv2=2194426,NumMax=1,NumMin=1},
		{GoodsID=80382,GaiLv1=2194427,GaiLv2=3291640,NumMax=1,NumMin=1},
		{GoodsID=80181,GaiLv1=3291641,GaiLv2=3373931,NumMax=1,NumMin=1},
		{GoodsID=80192,GaiLv1=3373932,GaiLv2=3456222,NumMax=1,NumMin=1},
		{GoodsID=968,GaiLv1=3456223,GaiLv2=3620804,NumMax=1,NumMin=1},
		{GoodsID=904,GaiLv1=3620805,GaiLv2=3949968,NumMax=1,NumMin=1},
		{GoodsID=88080,GaiLv1=3949969,GaiLv2=4279132,NumMax=1,NumMin=1},
		{GoodsID=89058,GaiLv1=4279133,GaiLv2=4292299,NumMax=1,NumMin=1},
		{GoodsID=89061,GaiLv1=4292300,GaiLv2=4319730,NumMax=1,NumMin=1},
		{GoodsID=89042,GaiLv1=4319731,GaiLv2=4402021,NumMax=1,NumMin=1},
		{GoodsID=89040,GaiLv1=4402022,GaiLv2=4484312,NumMax=1,NumMin=1},
		{GoodsID=89041,GaiLv1=4484313,GaiLv2=4566603,NumMax=1,NumMin=1},
		{GoodsID=250,GaiLv1=4566604,GaiLv2=5224931,NumMax=1,NumMin=1},
		{GoodsID=80397,GaiLv1=5224932,GaiLv2=6047841,NumMax=1,NumMin=1},
		{GoodsID=75,GaiLv1=6047842,GaiLv2=6377005,NumMax=1,NumMin=1},
		{GoodsID=80394,GaiLv1=6377006,GaiLv2=6706169,NumMax=1,NumMin=1},
		{GoodsID=80686,GaiLv1=6706170,GaiLv2=7035333,NumMax=1,NumMin=1},
		{GoodsID=80689,GaiLv1=7035334,GaiLv2=7364497,NumMax=1,NumMin=1},
		{GoodsID=39511,GaiLv1=7364498,GaiLv2=7397414,NumMax=1,NumMin=1},
		{GoodsID=39514,GaiLv1=7397415,GaiLv2=7430331,NumMax=1,NumMin=1},
		{GoodsID=39504,GaiLv1=7430332,GaiLv2=7463248,NumMax=1,NumMin=1},
		{GoodsID=39505,GaiLv1=7463249,GaiLv2=7496165,NumMax=1,NumMin=1},
		{GoodsID=39506,GaiLv1=7496166,GaiLv2=7529082,NumMax=1,NumMin=1},
		{GoodsID=11102,GaiLv1=7529083,GaiLv2=7561999,NumMax=1,NumMin=1},
		{GoodsID=11103,GaiLv1=7562000,GaiLv2=7583944,NumMax=1,NumMin=1},
		{GoodsID=11032,GaiLv1=7583945,GaiLv2=7605889,NumMax=1,NumMin=1},
		{GoodsID=11033,GaiLv1=7605890,GaiLv2=7622348,NumMax=1,NumMin=1},
		{GoodsID=11531,GaiLv1=7622349,GaiLv2=7638807,NumMax=1,NumMin=1},
		{GoodsID=11532,GaiLv1=7638808,GaiLv2=7649780,NumMax=1,NumMin=1},
		{GoodsID=11534,GaiLv1=7649781,GaiLv2=7666239,NumMax=1,NumMin=1},
		{GoodsID=11535,GaiLv1=7666240,GaiLv2=7677212,NumMax=1,NumMin=1},
		{GoodsID=39704,GaiLv1=7677213,GaiLv2=7710129,NumMax=1,NumMin=1},
		{GoodsID=40208,GaiLv1=7710130,GaiLv2=7743046,NumMax=1,NumMin=1},
		{GoodsID=40224,GaiLv1=7743047,GaiLv2=7775963,NumMax=1,NumMin=1},
		{GoodsID=40240,GaiLv1=7775964,GaiLv2=7808880,NumMax=1,NumMin=1},
		{GoodsID=88101,GaiLv1=7808881,GaiLv2=7835214,NumMax=1,NumMin=1},
		{GoodsID=88102,GaiLv1=7835215,GaiLv2=7861548,NumMax=1,NumMin=1},
		{GoodsID=88103,GaiLv1=7861549,GaiLv2=7887882,NumMax=1,NumMin=1},
		{GoodsID=88104,GaiLv1=7887883,GaiLv2=7904341,NumMax=1,NumMin=1},
		{GoodsID=88105,GaiLv1=7904342,GaiLv2=7930675,NumMax=1,NumMin=1},
		{GoodsID=88106,GaiLv1=7930676,GaiLv2=7957009,NumMax=1,NumMin=1},
		{GoodsID=88107,GaiLv1=7957010,GaiLv2=7983343,NumMax=1,NumMin=1},
		{GoodsID=88108,GaiLv1=7983344,GaiLv2=7999802,NumMax=1,NumMin=1},
		{GoodsID=88109,GaiLv1=7999803,GaiLv2=8026136,NumMax=1,NumMin=1},
		{GoodsID=88110,GaiLv1=8026137,GaiLv2=8052470,NumMax=1,NumMin=1},
		{GoodsID=88111,GaiLv1=8052471,GaiLv2=8078804,NumMax=1,NumMin=1},
		{GoodsID=88112,GaiLv1=8078805,GaiLv2=8095263,NumMax=1,NumMin=1},
		{GoodsID=88113,GaiLv1=8095264,GaiLv2=8121597,NumMax=1,NumMin=1},
		{GoodsID=88114,GaiLv1=8121598,GaiLv2=8147931,NumMax=1,NumMin=1},
		{GoodsID=88115,GaiLv1=8147932,GaiLv2=8174265,NumMax=1,NumMin=1},
		{GoodsID=88116,GaiLv1=8174266,GaiLv2=8190724,NumMax=1,NumMin=1},
		{GoodsID=88117,GaiLv1=8190725,GaiLv2=8217058,NumMax=1,NumMin=1},
		{GoodsID=88118,GaiLv1=8217059,GaiLv2=8243392,NumMax=1,NumMin=1},
		{GoodsID=88119,GaiLv1=8243393,GaiLv2=8269726,NumMax=1,NumMin=1},
		{GoodsID=88120,GaiLv1=8269727,GaiLv2=8286185,NumMax=1,NumMin=1},
		{GoodsID=88121,GaiLv1=8286186,GaiLv2=8312519,NumMax=1,NumMin=1},
		{GoodsID=88122,GaiLv1=8312520,GaiLv2=8338853,NumMax=1,NumMin=1},
		{GoodsID=88123,GaiLv1=8338854,GaiLv2=8365187,NumMax=1,NumMin=1},
		{GoodsID=88124,GaiLv1=8365188,GaiLv2=8381646,NumMax=1,NumMin=1},
		{GoodsID=38352,GaiLv1=8381647,GaiLv2=8491368,NumMax=1,NumMin=1},
		{GoodsID=38353,GaiLv1=8491369,GaiLv2=8601090,NumMax=1,NumMin=1},
		{GoodsID=38354,GaiLv1=8601091,GaiLv2=8710812,NumMax=1,NumMin=1},
		{GoodsID=38355,GaiLv1=8710813,GaiLv2=8820534,NumMax=1,NumMin=1},
		{GoodsID=38356,GaiLv1=8820535,GaiLv2=8930256,NumMax=1,NumMin=1},
		{GoodsID=38357,GaiLv1=8930257,GaiLv2=9039978,NumMax=1,NumMin=1},
		{GoodsID=38358,GaiLv1=9039979,GaiLv2=9149700,NumMax=1,NumMin=1},
		{GoodsID=38359,GaiLv1=9149701,GaiLv2=9259422,NumMax=1,NumMin=1},
		{GoodsID=38360,GaiLv1=9259423,GaiLv2=9369144,NumMax=1,NumMin=1},
		{GoodsID=32101,GaiLv1=9369145,GaiLv2=9434977,NumMax=1,NumMin=1},
		{GoodsID=88044,GaiLv1=9434978,GaiLv2=9500810,NumMax=1,NumMin=1},
		{GoodsID=31032,GaiLv1=9500811,GaiLv2=9517269,NumMax=1,NumMin=1},
		{GoodsID=31033,GaiLv1=9517270,GaiLv2=9533728,NumMax=1,NumMin=1},
		{GoodsID=88171,GaiLv1=9533729,GaiLv2=9670880,NumMax=1,NumMin=1},
		{GoodsID=80952,GaiLv1=9670881,GaiLv2=9890323,NumMax=1,NumMin=1},
		{GoodsID=80388,GaiLv1=9890324,GaiLv2=10000000,NumMax=1,NumMin=1},
	},
}

local nqixinglongzhuID =  82044
--特殊奖励处理表与广告表（无CD限制数量的奖励表）
--频道广播物品ID表
--交互-6103 （1开始用起）
--CDData表示时间数据交互值；Data表示物品数量的存储交互值
--101存时间
local tBroadcastGoods ={ 
	        [32015]={nGoodsID=32015,nMax= 5  ,Data=1,CDData=177,CDTime=15,},--幻翼魔毯卡片(15000点券)
	        [32016]={nGoodsID=32016,nMax= 5  ,Data=1,CDData=177,CDTime=15,},--天使之翼卡片(20000点券)
	        [39701]={nGoodsID=39701,nMax= 5  ,Data=1,CDData=177,CDTime=15,},--飞艇特鲁克卡片
	        [39703]={nGoodsID=39703,nMax= 5  ,Data=1,CDData=177,CDTime=15,},--机械蟾蜍卡片
	        [39704]={nGoodsID=39704,nMax= 5  ,Data=1,CDData=177,CDTime=15,},--悍马装甲车卡片
	        [39705]={nGoodsID=39705,nMax= 5  ,Data=1,CDData=177,CDTime=15,},--昆虫保姆车卡片
	        [39706]={nGoodsID=39706,nMax= 5  ,Data=1,CDData=177,CDTime=15,},--兔斯基私车卡片
	        
	        [11531]={nGoodsID=11531,nMax= 6  ,Data=8,CDData=177,CDTime=15,},--仙女龙髻[稀有女装]
	        [11532]={nGoodsID=11532,nMax= 6  ,Data=8,CDData=177,CDTime=15,},--仙女龙装[稀有女装]
	        [11534]={nGoodsID=11534,nMax= 6  ,Data=8,CDData=177,CDTime=15,},--精灵龙髻[稀有男装]
	        [11535]={nGoodsID=11535,nMax= 6  ,Data=8,CDData=177,CDTime=15,},--精灵龙装[稀有男装]
	        
	        
	        [31033]={nGoodsID=31033,nMax= 10  ,Data=12,CDData=177,CDTime=15,},--漫游精灵卡
	        [31032]={nGoodsID=31032,nMax= 10  ,Data=12,CDData=177,CDTime=15,},--爱丽丝一号卡
	        [31041]={nGoodsID=31041,nMax= 10  ,Data=12,CDData=177,CDTime=15,},--克罗恩宝宝卡
	        [31046]={nGoodsID=31046,nMax= 10  ,Data=12,CDData=177,CDTime=15,},--炎龙宝宝卡（龙年宠物）
	        [11533]={nGoodsID=11533,nMax= 10  ,Data=12,CDData=177,CDTime=15,},--仙女龙披风[稀有女装]
	        [11536]={nGoodsID=11536,nMax= 10  ,Data=12,CDData=177,CDTime=15,},--精灵龙披风[稀有男装]
	        
	        [39507]={nGoodsID=39507,nMax= 10  ,Data=17,CDData=177,CDTime=15,},--时装物攻宝石[黄金](3档)
	        [39508]={nGoodsID=39508,nMax= 10  ,Data=17,CDData=177,CDTime=15,},--时装火攻宝石[黄金](3档)
	        [39509]={nGoodsID=39509,nMax= 10  ,Data=17,CDData=177,CDTime=15,},--时装魔攻宝石[黄金](3档)
	        [39512]={nGoodsID=39512,nMax= 10  ,Data=17,CDData=177,CDTime=15,},--时装防御宝石[黄金](3档)
	       -- [39515]={nGoodsID=39515,nMax= 10  ,Data=17,CDData=177,CDTime=15,},--时装生命宝石[黄金](3档)
	        
	        [88172]={nGoodsID=88172,nMax= 10 ,Data=22,CDData=177,CDTime=15,},--二档灵魂石
	        [88173]={nGoodsID=88173,nMax= 10 ,Data=22,CDData=177,CDTime=15,},--三档灵魂石
	        [88174]={nGoodsID=88174,nMax= 10 ,Data=22,CDData=177,CDTime=15,},--四档灵魂石  
	        
	        
             }
--特殊奖励处理表与广告表（有CD不限制数量的奖励表） 
local tBroadcastCDGoods ={ 
	        [88101]={nGoodsID=88101,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--魔王秘籍残卷一【火药】
	        [88102]={nGoodsID=88102,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--魔王秘籍残卷二【火药】
	        [88103]={nGoodsID=88103,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--魔王秘籍残卷三【火药】
	        [88104]={nGoodsID=88104,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--魔王秘籍残卷四【火药】
	        [88105]={nGoodsID=88105,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--血战秘籍残卷一【物理】
	        [88106]={nGoodsID=88106,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--血战秘籍残卷二【物理】
	        [88107]={nGoodsID=88107,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--血战秘籍残卷三【物理】
	        [88108]={nGoodsID=88108,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--血战秘籍残卷四【物理】
	        [88109]={nGoodsID=88109,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--暗影秘籍残卷一【魔法】
	        [88110]={nGoodsID=88110,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--暗影秘籍残卷二【魔法】
	        [88111]={nGoodsID=88111,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--暗影秘籍残卷三【魔法】
	        [88112]={nGoodsID=88112,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--暗影秘籍残卷四【魔法】
	        [88113]={nGoodsID=88113,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--飞侠秘籍残卷一【火药】
	        [88114]={nGoodsID=88114,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--飞侠秘籍残卷二【火药】
	        [88115]={nGoodsID=88115,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--飞侠秘籍残卷三【火药】
	        [88116]={nGoodsID=88116,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--飞侠秘籍残卷四【火药】
	        [88117]={nGoodsID=88117,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--刀锋秘籍残卷一【物理】
	        [88118]={nGoodsID=88118,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--刀锋秘籍残卷二【物理】
	        [88119]={nGoodsID=88119,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--刀锋秘籍残卷三【物理】
	        [88120]={nGoodsID=88120,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--刀锋秘籍残卷四【物理】
	        [88121]={nGoodsID=88121,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--黑法秘籍残卷一【魔法】
	        [88122]={nGoodsID=88122,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--黑法秘籍残卷二【魔法】
	        [88123]={nGoodsID=88123,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--黑法秘籍残卷三【魔法】
	        [88124]={nGoodsID=88124,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--黑法秘籍残卷四【魔法】
	        
	        [39511]={nGoodsID=39511,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--时装防御宝石[白银](3档)
	        [39514]={nGoodsID=39514,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--时装生命宝石[白银](3档)
	        [39504]={nGoodsID=39504,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--时装物攻宝石[白银](3档)
	        [39505]={nGoodsID=39505,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--时装火攻宝石[白银](3档)
	        [39506]={nGoodsID=39506,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--时装魔攻宝石[白银](3档)
	        
	        [11103]={nGoodsID=11103,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--小蜜蜂之舞[白银女装](3档)
	        [11031]={nGoodsID=11031,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--歌唱家舞台装[白银男装](3档)
	        [11033]={nGoodsID=11033,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--吸血鬼魔袍[白银男装](3档)
	        [11102]={nGoodsID=11102,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--小蜜蜂花带[白银女装](3档)
	        [11030]={nGoodsID=11030,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--歌唱家飞机头[白银男装](3档)
	        [11032]={nGoodsID=11032,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--吸血鬼面具[白银男装](3档)
	        
	        [38352]={nGoodsID=38352,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--新年－鞭炮(2级家具)
	        [38353]={nGoodsID=38353,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--新年－壁炉(2级家具)
	        [38354]={nGoodsID=38354,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--新年－阳台东南(2级家具)
	        [38355]={nGoodsID=38355,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--新年－阳台西南(2级家具)
	        [38356]={nGoodsID=38356,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--新年－福字贴(2级家具)
	        [38357]={nGoodsID=38357,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--新年－红灯笼(2级家具)
	        [38358]={nGoodsID=38358,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--新年－墙壁装饰牛头(2级家具)
	        [38359]={nGoodsID=38359,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--新年－墙壁装饰熊头(2级家具)
	        [38360]={nGoodsID=38360,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--新年－青花瓷(2级家具)
	        [32101]={nGoodsID=32101,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--载具小型耐久棒
	        [88044]={nGoodsID=88044,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--拾取徽章
	        --[40208]={nGoodsID=40208,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--五档铁血黑石
	        --[40224]={nGoodsID=40224,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--五档轰天火石
	        --[40240]={nGoodsID=40240,nMax= 999  ,Data=109,CDData=35,CDTime=15,},--五档镇魂魔石	        
             }


--世界广播物品表（CD表中除家具外的都广播，CD表指上表）
local tHL_guangbo ={88101,88102,88103,88104,88105,88106,88107,88108,88109,88110,88111,88112,88113,88114,88115,88116,88117,88118,88119,88120,88121,88122,88123,88124,39511,39514,39504,39505,39506,11103,11031,11033,11102,11030,11032}
--------------------------------------------------------------------------------------------------------------
----汤圆，取消制作。
local tTYGoods ={
	{nGoodsID=89130,tRadomStatusID={1016001},nRadomGoodsIDNum=1,nGoodsFrom="汤圆"},
};
----npc许愿奖励界面显示图标
local HL1id = 39704;--悍马装甲车卡片 
local HL2id = 11532;
local HL3id = 11535;
local HL4id = 88104;
local HL5id = 88108;
local HL6id = 88112;
----神龙令牌
local ShenLongLingPai = {
[1]={
		
		
		{GoodsID=80383,GaiLv1=1,GaiLv2=1328299,NumMax=1,NumMin=1},
		{GoodsID=80381,GaiLv1=1328300,GaiLv2=2213832,NumMax=1,NumMin=1},
		{GoodsID=80397,GaiLv1=2213833,GaiLv2=2877982,NumMax=1,NumMin=1},
		{GoodsID=89042,GaiLv1=2877983,GaiLv2=2944397,NumMax=1,NumMin=1},
		{GoodsID=89040,GaiLv1=2944398,GaiLv2=3010812,NumMax=1,NumMin=1},
		{GoodsID=89041,GaiLv1=3010813,GaiLv2=3077227,NumMax=1,NumMin=1},
		{GoodsID=80394,GaiLv1=3077228,GaiLv2=3342887,NumMax=1,NumMin=1},
		{GoodsID=80181,GaiLv1=3342888,GaiLv2=4671187,NumMax=1,NumMin=1},
		{GoodsID=80191,GaiLv1=4671188,GaiLv2=5999487,NumMax=1,NumMin=1},
		{GoodsID=968,GaiLv1=5999488,GaiLv2=6132317,NumMax=1,NumMin=1},
		{GoodsID=904,GaiLv1=6132318,GaiLv2=6397977,NumMax=1,NumMin=1},
		{GoodsID=88080,GaiLv1=6397978,GaiLv2=6663637,NumMax=1,NumMin=1},
		{GoodsID=80234,GaiLv1=6663638,GaiLv2=6840744,NumMax=1,NumMin=1},
		{GoodsID=80276,GaiLv1=6840745,GaiLv2=7017851,NumMax=1,NumMin=1},
		{GoodsID=80281,GaiLv1=7017852,GaiLv2=7549171,NumMax=1,NumMin=1},
		{GoodsID=89056,GaiLv1=7549172,GaiLv2=7562454,NumMax=1,NumMin=1},
		{GoodsID=89059,GaiLv1=7562455,GaiLv2=7589020,NumMax=1,NumMin=1},
		{GoodsID=39507,GaiLv1=7589021,GaiLv2=7603779,NumMax=1,NumMin=1},
		{GoodsID=39508,GaiLv1=7603780,GaiLv2=7618538,NumMax=1,NumMin=1},
		{GoodsID=39509,GaiLv1=7618539,GaiLv2=7633297,NumMax=1,NumMin=1},
		{GoodsID=39512,GaiLv1=7633298,GaiLv2=7645373,NumMax=1,NumMin=1},
		{GoodsID=80686,GaiLv1=7645374,GaiLv2=7911033,NumMax=1,NumMin=1},
		{GoodsID=80689,GaiLv1=7911034,GaiLv2=8176693,NumMax=1,NumMin=1},
		{GoodsID=31101,GaiLv1=8176694,GaiLv2=8309523,NumMax=1,NumMin=1},
		{GoodsID=75,GaiLv1=8309524,GaiLv2=8575183,NumMax=1,NumMin=1},
		{GoodsID=39511,GaiLv1=8575184,GaiLv2=8601749,NumMax=1,NumMin=1},
		{GoodsID=39514,GaiLv1=8601750,GaiLv2=8628315,NumMax=1,NumMin=1},
		{GoodsID=39504,GaiLv1=8628316,GaiLv2=8654881,NumMax=1,NumMin=1},
		{GoodsID=39505,GaiLv1=8654882,GaiLv2=8681447,NumMax=1,NumMin=1},
		{GoodsID=39506,GaiLv1=8681448,GaiLv2=8708013,NumMax=1,NumMin=1},
		{GoodsID=11102,GaiLv1=8708014,GaiLv2=8734579,NumMax=1,NumMin=1},
		{GoodsID=11103,GaiLv1=8734580,GaiLv2=8752290,NumMax=1,NumMin=1},
		{GoodsID=11030,GaiLv1=8752291,GaiLv2=8778856,NumMax=1,NumMin=1},
		{GoodsID=11031,GaiLv1=8778857,GaiLv2=8796567,NumMax=1,NumMin=1},
		{GoodsID=11032,GaiLv1=8796568,GaiLv2=8814278,NumMax=1,NumMin=1},
		{GoodsID=11033,GaiLv1=8814279,GaiLv2=8827561,NumMax=1,NumMin=1},
		{GoodsID=88101,GaiLv1=8827562,GaiLv2=8848814,NumMax=1,NumMin=1},
		{GoodsID=88102,GaiLv1=8848815,GaiLv2=8870067,NumMax=1,NumMin=1},
		{GoodsID=88103,GaiLv1=8870068,GaiLv2=8891320,NumMax=1,NumMin=1},
		{GoodsID=88104,GaiLv1=8891321,GaiLv2=8904603,NumMax=1,NumMin=1},
		{GoodsID=88105,GaiLv1=8904604,GaiLv2=8925856,NumMax=1,NumMin=1},
		{GoodsID=88106,GaiLv1=8925857,GaiLv2=8947109,NumMax=1,NumMin=1},
		{GoodsID=88107,GaiLv1=8947110,GaiLv2=8968362,NumMax=1,NumMin=1},
		{GoodsID=88108,GaiLv1=8968363,GaiLv2=8981645,NumMax=1,NumMin=1},
		{GoodsID=88109,GaiLv1=8981646,GaiLv2=9002898,NumMax=1,NumMin=1},
		{GoodsID=88110,GaiLv1=9002899,GaiLv2=9024151,NumMax=1,NumMin=1},
		{GoodsID=88111,GaiLv1=9024152,GaiLv2=9045404,NumMax=1,NumMin=1},
		{GoodsID=88112,GaiLv1=9045405,GaiLv2=9058687,NumMax=1,NumMin=1},
		{GoodsID=88113,GaiLv1=9058688,GaiLv2=9079940,NumMax=1,NumMin=1},
		{GoodsID=88114,GaiLv1=9079941,GaiLv2=9101193,NumMax=1,NumMin=1},
		{GoodsID=88115,GaiLv1=9101194,GaiLv2=9122446,NumMax=1,NumMin=1},
		{GoodsID=88116,GaiLv1=9122447,GaiLv2=9135729,NumMax=1,NumMin=1},
		{GoodsID=88117,GaiLv1=9135730,GaiLv2=9156982,NumMax=1,NumMin=1},
		{GoodsID=88118,GaiLv1=9156983,GaiLv2=9178235,NumMax=1,NumMin=1},
		{GoodsID=88119,GaiLv1=9178236,GaiLv2=9199488,NumMax=1,NumMin=1},
		{GoodsID=88120,GaiLv1=9199489,GaiLv2=9212771,NumMax=1,NumMin=1},
		{GoodsID=88121,GaiLv1=9212772,GaiLv2=9234024,NumMax=1,NumMin=1},
		{GoodsID=88122,GaiLv1=9234025,GaiLv2=9255277,NumMax=1,NumMin=1},
		{GoodsID=88123,GaiLv1=9255278,GaiLv2=9276530,NumMax=1,NumMin=1},
		{GoodsID=88124,GaiLv1=9276531,GaiLv2=9289813,NumMax=1,NumMin=1},
		{GoodsID=32015,GaiLv1=9289814,GaiLv2=9303096,NumMax=1,NumMin=1},
		{GoodsID=32016,GaiLv1=9303097,GaiLv2=9309738,NumMax=1,NumMin=1},
		{GoodsID=39701,GaiLv1=9309739,GaiLv2=9342946,NumMax=1,NumMin=1},
		{GoodsID=39703,GaiLv1=9342947,GaiLv2=9376154,NumMax=1,NumMin=1},
		{GoodsID=39704,GaiLv1=9376155,GaiLv2=9409362,NumMax=1,NumMin=1},
		{GoodsID=39705,GaiLv1=9409363,GaiLv2=9442570,NumMax=1,NumMin=1},
		{GoodsID=39706,GaiLv1=9442571,GaiLv2=9475778,NumMax=1,NumMin=1},
		{GoodsID=40204,GaiLv1=9475779,GaiLv2=9564332,NumMax=1,NumMin=1},
		{GoodsID=40220,GaiLv1=9564333,GaiLv2=9652886,NumMax=1,NumMin=1},
		{GoodsID=40236,GaiLv1=9652887,GaiLv2=9741440,NumMax=1,NumMin=1},
		{GoodsID=88172,GaiLv1=9741441,GaiLv2=9794572,NumMax=1,NumMin=1},
		{GoodsID=11531,GaiLv1=9794573,GaiLv2=9807855,NumMax=1,NumMin=1},
		{GoodsID=11532,GaiLv1=9807856,GaiLv2=9816711,NumMax=1,NumMin=1},
		{GoodsID=11534,GaiLv1=9816712,GaiLv2=9829994,NumMax=1,NumMin=1},
		{GoodsID=11535,GaiLv1=9829995,GaiLv2=9838850,NumMax=1,NumMin=1},
		{GoodsID=31041,GaiLv1=9838851,GaiLv2=9847706,NumMax=1,NumMin=1},
		{GoodsID=31032,GaiLv1=9847707,GaiLv2=9860989,NumMax=1,NumMin=1},
		{GoodsID=31033,GaiLv1=9860990,GaiLv2=9874272,NumMax=1,NumMin=1},
		{GoodsID=31046,GaiLv1=9874273,GaiLv2=9883128,NumMax=1,NumMin=1},
		{GoodsID=11533,GaiLv1=9883129,GaiLv2=9888442,NumMax=1,NumMin=1},
		{GoodsID=11536,GaiLv1=9888443,GaiLv2=9893756,NumMax=1,NumMin=1},
		{GoodsID=88044,GaiLv1=9893757,GaiLv2=9946888,NumMax=1,NumMin=1},
		{GoodsID=88171,GaiLv1=9946889,GaiLv2=10000000,NumMax=1,NumMin=1},



	  },
[2]={
		
		
		
		
		{GoodsID=80384,GaiLv1=1,GaiLv2=1183234,NumMax=1,NumMin=1},
		{GoodsID=80382,GaiLv1=1183235,GaiLv2=1972057,NumMax=1,NumMin=1},
		{GoodsID=80181,GaiLv1=1972058,GaiLv2=2563675,NumMax=1,NumMin=1},
		{GoodsID=80192,GaiLv1=2563676,GaiLv2=3155293,NumMax=1,NumMin=1},
		{GoodsID=968,GaiLv1=3155294,GaiLv2=3273617,NumMax=1,NumMin=1},
		{GoodsID=904,GaiLv1=3273618,GaiLv2=3510264,NumMax=1,NumMin=1},
		{GoodsID=88080,GaiLv1=3510265,GaiLv2=3746911,NumMax=1,NumMin=1},
		{GoodsID=80235,GaiLv1=3746912,GaiLv2=3780718,NumMax=1,NumMin=1},
		{GoodsID=80277,GaiLv1=3780719,GaiLv2=3814525,NumMax=1,NumMin=1},
		{GoodsID=80282,GaiLv1=3814526,GaiLv2=3893408,NumMax=1,NumMin=1},
		{GoodsID=80624,GaiLv1=3893409,GaiLv2=4231475,NumMax=1,NumMin=1},
		{GoodsID=80625,GaiLv1=4231476,GaiLv2=4569542,NumMax=1,NumMin=1},
		{GoodsID=80626,GaiLv1=4569543,GaiLv2=4907609,NumMax=1,NumMin=1},
		{GoodsID=80628,GaiLv1=4907610,GaiLv2=5245676,NumMax=1,NumMin=1},
		{GoodsID=80629,GaiLv1=5245677,GaiLv2=5583743,NumMax=1,NumMin=1},
		{GoodsID=89057,GaiLv1=5583744,GaiLv2=5594500,NumMax=1,NumMin=1},
		{GoodsID=89060,GaiLv1=5594501,GaiLv2=5616014,NumMax=1,NumMin=1},
		{GoodsID=39507,GaiLv1=5616015,GaiLv2=5629162,NumMax=1,NumMin=1},
		{GoodsID=39508,GaiLv1=5629163,GaiLv2=5642310,NumMax=1,NumMin=1},
		{GoodsID=39509,GaiLv1=5642311,GaiLv2=5655458,NumMax=1,NumMin=1},
		{GoodsID=39512,GaiLv1=5655459,GaiLv2=5666215,NumMax=1,NumMin=1},
		{GoodsID=89042,GaiLv1=5666216,GaiLv2=5725377,NumMax=1,NumMin=1},
		{GoodsID=89040,GaiLv1=5725378,GaiLv2=5784539,NumMax=1,NumMin=1},
		{GoodsID=89041,GaiLv1=5784540,GaiLv2=5843701,NumMax=1,NumMin=1},
		{GoodsID=250,GaiLv1=5843702,GaiLv2=6316995,NumMax=1,NumMin=1},
		{GoodsID=80397,GaiLv1=6316996,GaiLv2=6908613,NumMax=1,NumMin=1},
		{GoodsID=75,GaiLv1=6908614,GaiLv2=7145260,NumMax=1,NumMin=1},
		{GoodsID=80394,GaiLv1=7145261,GaiLv2=7381907,NumMax=1,NumMin=1},
		{GoodsID=80686,GaiLv1=7381908,GaiLv2=7618554,NumMax=1,NumMin=1},
		{GoodsID=80689,GaiLv1=7618555,GaiLv2=7855201,NumMax=1,NumMin=1},
		{GoodsID=32015,GaiLv1=7855202,GaiLv2=7867034,NumMax=1,NumMin=1},
		{GoodsID=39511,GaiLv1=7867035,GaiLv2=7890699,NumMax=1,NumMin=1},
		{GoodsID=39514,GaiLv1=7890700,GaiLv2=7914364,NumMax=1,NumMin=1},
		{GoodsID=39504,GaiLv1=7914365,GaiLv2=7938029,NumMax=1,NumMin=1},
		{GoodsID=39505,GaiLv1=7938030,GaiLv2=7961694,NumMax=1,NumMin=1},
		{GoodsID=39506,GaiLv1=7961695,GaiLv2=7985359,NumMax=1,NumMin=1},
		{GoodsID=32016,GaiLv1=7985360,GaiLv2=7991276,NumMax=1,NumMin=1},
		{GoodsID=11531,GaiLv1=7991277,GaiLv2=8003109,NumMax=1,NumMin=1},
		{GoodsID=11532,GaiLv1=8003110,GaiLv2=8010998,NumMax=1,NumMin=1},
		{GoodsID=11534,GaiLv1=8010999,GaiLv2=8022831,NumMax=1,NumMin=1},
		{GoodsID=11535,GaiLv1=8022832,GaiLv2=8030720,NumMax=1,NumMin=1},
		{GoodsID=11102,GaiLv1=8030721,GaiLv2=8054385,NumMax=1,NumMin=1},
		{GoodsID=11103,GaiLv1=8054386,GaiLv2=8070162,NumMax=1,NumMin=1},
		{GoodsID=11030,GaiLv1=8070163,GaiLv2=8093827,NumMax=1,NumMin=1},
		{GoodsID=11031,GaiLv1=8093828,GaiLv2=8109604,NumMax=1,NumMin=1},
		{GoodsID=11032,GaiLv1=8109605,GaiLv2=8125381,NumMax=1,NumMin=1},
		{GoodsID=11033,GaiLv1=8125382,GaiLv2=8137214,NumMax=1,NumMin=1},
		{GoodsID=39701,GaiLv1=8137215,GaiLv2=8166795,NumMax=1,NumMin=1},
		{GoodsID=39703,GaiLv1=8166796,GaiLv2=8196376,NumMax=1,NumMin=1},
		{GoodsID=39704,GaiLv1=8196377,GaiLv2=8225957,NumMax=1,NumMin=1},
		{GoodsID=39705,GaiLv1=8225958,GaiLv2=8255538,NumMax=1,NumMin=1},
		{GoodsID=39706,GaiLv1=8255539,GaiLv2=8285119,NumMax=1,NumMin=1},
		{GoodsID=40206,GaiLv1=8285120,GaiLv2=8332449,NumMax=1,NumMin=1},
		{GoodsID=40222,GaiLv1=8332450,GaiLv2=8379779,NumMax=1,NumMin=1},
		{GoodsID=40238,GaiLv1=8379780,GaiLv2=8427109,NumMax=1,NumMin=1},
		{GoodsID=88101,GaiLv1=8427110,GaiLv2=8446041,NumMax=1,NumMin=1},
		{GoodsID=88102,GaiLv1=8446042,GaiLv2=8464973,NumMax=1,NumMin=1},
		{GoodsID=88103,GaiLv1=8464974,GaiLv2=8483905,NumMax=1,NumMin=1},
		{GoodsID=88104,GaiLv1=8483906,GaiLv2=8495738,NumMax=1,NumMin=1},
		{GoodsID=88105,GaiLv1=8495739,GaiLv2=8514670,NumMax=1,NumMin=1},
		{GoodsID=88106,GaiLv1=8514671,GaiLv2=8533602,NumMax=1,NumMin=1},
		{GoodsID=88107,GaiLv1=8533603,GaiLv2=8552534,NumMax=1,NumMin=1},
		{GoodsID=88108,GaiLv1=8552535,GaiLv2=8564367,NumMax=1,NumMin=1},
		{GoodsID=88109,GaiLv1=8564368,GaiLv2=8583299,NumMax=1,NumMin=1},
		{GoodsID=88110,GaiLv1=8583300,GaiLv2=8602231,NumMax=1,NumMin=1},
		{GoodsID=88111,GaiLv1=8602232,GaiLv2=8621163,NumMax=1,NumMin=1},
		{GoodsID=88112,GaiLv1=8621164,GaiLv2=8632996,NumMax=1,NumMin=1},
		{GoodsID=88113,GaiLv1=8632997,GaiLv2=8651928,NumMax=1,NumMin=1},
		{GoodsID=88114,GaiLv1=8651929,GaiLv2=8670860,NumMax=1,NumMin=1},
		{GoodsID=88115,GaiLv1=8670861,GaiLv2=8689792,NumMax=1,NumMin=1},
		{GoodsID=88116,GaiLv1=8689793,GaiLv2=8701625,NumMax=1,NumMin=1},
		{GoodsID=88117,GaiLv1=8701626,GaiLv2=8720557,NumMax=1,NumMin=1},
		{GoodsID=88118,GaiLv1=8720558,GaiLv2=8739489,NumMax=1,NumMin=1},
		{GoodsID=88119,GaiLv1=8739490,GaiLv2=8758421,NumMax=1,NumMin=1},
		{GoodsID=88120,GaiLv1=8758422,GaiLv2=8770254,NumMax=1,NumMin=1},
		{GoodsID=88121,GaiLv1=8770255,GaiLv2=8789186,NumMax=1,NumMin=1},
		{GoodsID=88122,GaiLv1=8789187,GaiLv2=8808118,NumMax=1,NumMin=1},
		{GoodsID=88123,GaiLv1=8808119,GaiLv2=8827050,NumMax=1,NumMin=1},
		{GoodsID=88124,GaiLv1=8827051,GaiLv2=8838883,NumMax=1,NumMin=1},
		{GoodsID=88173,GaiLv1=8838884,GaiLv2=8862548,NumMax=1,NumMin=1},
		{GoodsID=38352,GaiLv1=8862549,GaiLv2=8941431,NumMax=1,NumMin=1},
		{GoodsID=38353,GaiLv1=8941432,GaiLv2=9020314,NumMax=1,NumMin=1},
		{GoodsID=38354,GaiLv1=9020315,GaiLv2=9099197,NumMax=1,NumMin=1},
		{GoodsID=38355,GaiLv1=9099198,GaiLv2=9178080,NumMax=1,NumMin=1},
		{GoodsID=38356,GaiLv1=9178081,GaiLv2=9256963,NumMax=1,NumMin=1},
		{GoodsID=38357,GaiLv1=9256964,GaiLv2=9335846,NumMax=1,NumMin=1},
		{GoodsID=38358,GaiLv1=9335847,GaiLv2=9414729,NumMax=1,NumMin=1},
		{GoodsID=38359,GaiLv1=9414730,GaiLv2=9493612,NumMax=1,NumMin=1},
		{GoodsID=38360,GaiLv1=9493613,GaiLv2=9572495,NumMax=1,NumMin=1},
		{GoodsID=32101,GaiLv1=9572496,GaiLv2=9619825,NumMax=1,NumMin=1},
		{GoodsID=31046,GaiLv1=9619826,GaiLv2=9627714,NumMax=1,NumMin=1},
		{GoodsID=11533,GaiLv1=9627715,GaiLv2=9632447,NumMax=1,NumMin=1},
		{GoodsID=11536,GaiLv1=9632448,GaiLv2=9637180,NumMax=1,NumMin=1},
		{GoodsID=88044,GaiLv1=9637181,GaiLv2=9684510,NumMax=1,NumMin=1},
		{GoodsID=31041,GaiLv1=9684511,GaiLv2=9692399,NumMax=1,NumMin=1},
		{GoodsID=31032,GaiLv1=9692400,GaiLv2=9704232,NumMax=1,NumMin=1},
		{GoodsID=31033,GaiLv1=9704233,GaiLv2=9716065,NumMax=1,NumMin=1},
		{GoodsID=88171,GaiLv1=9716066,GaiLv2=9763395,NumMax=1,NumMin=1},
		{GoodsID=80951,GaiLv1=9763396,GaiLv2=9921160,NumMax=1,NumMin=1},
		{GoodsID=80387,GaiLv1=9921161,GaiLv2=10000000,NumMax=1,NumMin=1},

	 },
[3]={
		
		
		
		{GoodsID=80384,GaiLv1=1,GaiLv2=2133416,NumMax=1,NumMin=1},
{GoodsID=80382,GaiLv1=2133417,GaiLv2=3200125,NumMax=1,NumMin=1},
{GoodsID=80181,GaiLv1=3200126,GaiLv2=3280129,NumMax=1,NumMin=1},
{GoodsID=80192,GaiLv1=3280130,GaiLv2=3360133,NumMax=1,NumMin=1},
{GoodsID=968,GaiLv1=3360134,GaiLv2=3520140,NumMax=1,NumMin=1},
{GoodsID=904,GaiLv1=3520141,GaiLv2=3840153,NumMax=1,NumMin=1},
{GoodsID=88080,GaiLv1=3840154,GaiLv2=4160166,NumMax=1,NumMin=1},
{GoodsID=89058,GaiLv1=4160167,GaiLv2=4172967,NumMax=1,NumMin=1},
{GoodsID=89061,GaiLv1=4172968,GaiLv2=4199635,NumMax=1,NumMin=1},
{GoodsID=39507,GaiLv1=4199636,GaiLv2=4217414,NumMax=1,NumMin=1},
{GoodsID=39508,GaiLv1=4217415,GaiLv2=4235193,NumMax=1,NumMin=1},
{GoodsID=39509,GaiLv1=4235194,GaiLv2=4252972,NumMax=1,NumMin=1},
{GoodsID=39512,GaiLv1=4252973,GaiLv2=4267519,NumMax=1,NumMin=1},
{GoodsID=89042,GaiLv1=4267520,GaiLv2=4347523,NumMax=1,NumMin=1},
{GoodsID=89040,GaiLv1=4347524,GaiLv2=4427527,NumMax=1,NumMin=1},
{GoodsID=89041,GaiLv1=4427528,GaiLv2=4507531,NumMax=1,NumMin=1},
{GoodsID=250,GaiLv1=4507532,GaiLv2=5147556,NumMax=1,NumMin=1},
{GoodsID=80397,GaiLv1=5147557,GaiLv2=5947588,NumMax=1,NumMin=1},
{GoodsID=75,GaiLv1=5947589,GaiLv2=6267601,NumMax=1,NumMin=1},
{GoodsID=80394,GaiLv1=6267602,GaiLv2=6587614,NumMax=1,NumMin=1},
{GoodsID=80686,GaiLv1=6587615,GaiLv2=6907627,NumMax=1,NumMin=1},
{GoodsID=80689,GaiLv1=6907628,GaiLv2=7227640,NumMax=1,NumMin=1},
{GoodsID=32015,GaiLv1=7227641,GaiLv2=7243641,NumMax=1,NumMin=1},
{GoodsID=39511,GaiLv1=7243642,GaiLv2=7275643,NumMax=1,NumMin=1},
{GoodsID=39514,GaiLv1=7275644,GaiLv2=7307645,NumMax=1,NumMin=1},
{GoodsID=39504,GaiLv1=7307646,GaiLv2=7339647,NumMax=1,NumMin=1},
{GoodsID=39505,GaiLv1=7339648,GaiLv2=7371649,NumMax=1,NumMin=1},
{GoodsID=39506,GaiLv1=7371650,GaiLv2=7403651,NumMax=1,NumMin=1},
{GoodsID=32016,GaiLv1=7403652,GaiLv2=7411652,NumMax=1,NumMin=1},
{GoodsID=11531,GaiLv1=7411653,GaiLv2=7427653,NumMax=1,NumMin=1},
{GoodsID=11532,GaiLv1=7427654,GaiLv2=7438321,NumMax=1,NumMin=1},
{GoodsID=11534,GaiLv1=7438322,GaiLv2=7454322,NumMax=1,NumMin=1},
{GoodsID=11535,GaiLv1=7454323,GaiLv2=7464990,NumMax=1,NumMin=1},
{GoodsID=11102,GaiLv1=7464991,GaiLv2=7496992,NumMax=1,NumMin=1},
{GoodsID=11103,GaiLv1=7496993,GaiLv2=7518327,NumMax=1,NumMin=1},
{GoodsID=11030,GaiLv1=7518328,GaiLv2=7550329,NumMax=1,NumMin=1},
{GoodsID=11031,GaiLv1=7550330,GaiLv2=7571664,NumMax=1,NumMin=1},
{GoodsID=11032,GaiLv1=7571665,GaiLv2=7592999,NumMax=1,NumMin=1},
{GoodsID=11033,GaiLv1=7593000,GaiLv2=7609000,NumMax=1,NumMin=1},
{GoodsID=39701,GaiLv1=7609001,GaiLv2=7641002,NumMax=1,NumMin=1},
{GoodsID=39703,GaiLv1=7641003,GaiLv2=7673004,NumMax=1,NumMin=1},
{GoodsID=39704,GaiLv1=7673005,GaiLv2=7705006,NumMax=1,NumMin=1},
{GoodsID=39705,GaiLv1=7705007,GaiLv2=7737008,NumMax=1,NumMin=1},
{GoodsID=39706,GaiLv1=7737009,GaiLv2=7769010,NumMax=1,NumMin=1},
{GoodsID=40208,GaiLv1=7769011,GaiLv2=7809012,NumMax=1,NumMin=1},
{GoodsID=40224,GaiLv1=7809013,GaiLv2=7849014,NumMax=1,NumMin=1},
{GoodsID=40240,GaiLv1=7849015,GaiLv2=7889016,NumMax=1,NumMin=1},
{GoodsID=88174,GaiLv1=7889017,GaiLv2=7905017,NumMax=1,NumMin=1},
{GoodsID=88101,GaiLv1=7905018,GaiLv2=7930618,NumMax=1,NumMin=1},
{GoodsID=88102,GaiLv1=7930619,GaiLv2=7956219,NumMax=1,NumMin=1},
{GoodsID=88103,GaiLv1=7956220,GaiLv2=7981820,NumMax=1,NumMin=1},
{GoodsID=88104,GaiLv1=7981821,GaiLv2=7997821,NumMax=1,NumMin=1},
{GoodsID=88105,GaiLv1=7997822,GaiLv2=8023422,NumMax=1,NumMin=1},
{GoodsID=88106,GaiLv1=8023423,GaiLv2=8049023,NumMax=1,NumMin=1},
{GoodsID=88107,GaiLv1=8049024,GaiLv2=8074624,NumMax=1,NumMin=1},
{GoodsID=88108,GaiLv1=8074625,GaiLv2=8090625,NumMax=1,NumMin=1},
{GoodsID=88109,GaiLv1=8090626,GaiLv2=8116226,NumMax=1,NumMin=1},
{GoodsID=88110,GaiLv1=8116227,GaiLv2=8141827,NumMax=1,NumMin=1},
{GoodsID=88111,GaiLv1=8141828,GaiLv2=8167428,NumMax=1,NumMin=1},
{GoodsID=88112,GaiLv1=8167429,GaiLv2=8183429,NumMax=1,NumMin=1},
{GoodsID=88113,GaiLv1=8183430,GaiLv2=8209030,NumMax=1,NumMin=1},
{GoodsID=88114,GaiLv1=8209031,GaiLv2=8234631,NumMax=1,NumMin=1},
{GoodsID=88115,GaiLv1=8234632,GaiLv2=8260232,NumMax=1,NumMin=1},
{GoodsID=88116,GaiLv1=8260233,GaiLv2=8276233,NumMax=1,NumMin=1},
{GoodsID=88117,GaiLv1=8276234,GaiLv2=8301834,NumMax=1,NumMin=1},
{GoodsID=88118,GaiLv1=8301835,GaiLv2=8327435,NumMax=1,NumMin=1},
{GoodsID=88119,GaiLv1=8327436,GaiLv2=8353036,NumMax=1,NumMin=1},
{GoodsID=88120,GaiLv1=8353037,GaiLv2=8369037,NumMax=1,NumMin=1},
{GoodsID=88121,GaiLv1=8369038,GaiLv2=8394638,NumMax=1,NumMin=1},
{GoodsID=88122,GaiLv1=8394639,GaiLv2=8420239,NumMax=1,NumMin=1},
{GoodsID=88123,GaiLv1=8420240,GaiLv2=8445840,NumMax=1,NumMin=1},
{GoodsID=88124,GaiLv1=8445841,GaiLv2=8461841,NumMax=1,NumMin=1},
{GoodsID=38352,GaiLv1=8461842,GaiLv2=8568512,NumMax=1,NumMin=1},
{GoodsID=38353,GaiLv1=8568513,GaiLv2=8675183,NumMax=1,NumMin=1},
{GoodsID=38354,GaiLv1=8675184,GaiLv2=8781854,NumMax=1,NumMin=1},
{GoodsID=38355,GaiLv1=8781855,GaiLv2=8888525,NumMax=1,NumMin=1},
{GoodsID=38356,GaiLv1=8888526,GaiLv2=8995196,NumMax=1,NumMin=1},
{GoodsID=38357,GaiLv1=8995197,GaiLv2=9101867,NumMax=1,NumMin=1},
{GoodsID=38358,GaiLv1=9101868,GaiLv2=9208538,NumMax=1,NumMin=1},
{GoodsID=38359,GaiLv1=9208539,GaiLv2=9315209,NumMax=1,NumMin=1},
{GoodsID=38360,GaiLv1=9315210,GaiLv2=9421880,NumMax=1,NumMin=1},
{GoodsID=32101,GaiLv1=9421881,GaiLv2=9485883,NumMax=1,NumMin=1},
{GoodsID=31046,GaiLv1=9485884,GaiLv2=9496551,NumMax=1,NumMin=1},
{GoodsID=11533,GaiLv1=9496552,GaiLv2=9502952,NumMax=1,NumMin=1},
{GoodsID=11536,GaiLv1=9502953,GaiLv2=9509353,NumMax=1,NumMin=1},
{GoodsID=88044,GaiLv1=9509354,GaiLv2=9573356,NumMax=1,NumMin=1},
{GoodsID=31041,GaiLv1=9573357,GaiLv2=9584024,NumMax=1,NumMin=1},
{GoodsID=31032,GaiLv1=9584025,GaiLv2=9600025,NumMax=1,NumMin=1},
{GoodsID=31033,GaiLv1=9600026,GaiLv2=9616026,NumMax=1,NumMin=1},
{GoodsID=88171,GaiLv1=9616027,GaiLv2=9680029,NumMax=1,NumMin=1},
{GoodsID=80952,GaiLv1=9680030,GaiLv2=9893371,NumMax=1,NumMin=1},
{GoodsID=80388,GaiLv1=9893372,GaiLv2=10000000,NumMax=1,NumMin=1},

	 },
}
	 

--可配置区到这里结束 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

---------------------------------------------------------------------------------------------------------------
--功能区
---------------------------------------------------------------------------------------------------------------
if API_GetServerID() == 1 then
	if NewYear_ShenLongJiangLiChongZhi ~= nil then
		API_DestroyTriggerG(NewYear_ShenLongJiangLiChongZhi)
	end
	NewYear_ShenLongJiangLiChongZhi = API_CreateTimerTriggerG(0,0,120,-1,'HLMeiriHuoDong_ShuJuQingChu')
end
---------------------------------------------------------------------------------------------------------------
----创建NPC
---------------------------------------------------------------------------------------------------------------
if API_GetServerID() == 1 then
	if NewYear_LoadingTimeTriggerGID2013 ~= nil then
		API_DestroyTriggerG(NewYear_LoadingTimeTriggerGID2013)
	end
	NewYear_LoadingTimeTriggerGID2013 = API_CreateTimerTriggerG(0,0,60,1,'HL_NewDragonBallServerOpen')
end

function HL_NewDragonBallServerOpen(Param1,Param2)
	if API_GetServerID() == 1 then
		local StartTimeTable = tNewDragonBall_StartTime
		local EndTimeTable = tNewDragonBall_EndTime
		local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
		local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
		if nShiFouStart > 0 then
			--活动未开始
			NewYearDragonBall_DestroyNPC()
			if NewDragonBall_StartDateTimeTriggerGID == nil then
				NewDragonBall_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'NewYearDragonBall_CreateNPC')
			else
				API_DestroyTriggerG(NewDragonBall_StartDateTimeTriggerGID)
				NewDragonBall_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'NewYearDragonBall_CreateNPC')
			end
			if NewDragonBall_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(NewDragonBall_EndDateTimeTriggerGID)
			end
		elseif nShiFouStart <= 0 and nShiFouEnd > 0 then
			--活动开始
			--npc相关
			NewYearDragonBall_CreateNPC()
			if NewDragonBall_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(NewDragonBall_StartDateTimeTriggerGID)
			end
			--怪物相关
		elseif nShiFouEnd <= 0 then
			--活动结束
			NewYearDragonBall_DestroyNPC()
			if NewDragonBall_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(NewDragonBall_StartDateTimeTriggerGID)
			end
			if NewDragonBall_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(NewDragonBall_EndDateTimeTriggerGID)
			end
		end
	end
end
function NewYearDragonBall_CreateNPC()
	--创建帝国活动npc
	if API_GetServerID() == 1 then
		if DragonBall_DGNPCFastID1 == nil then
			DragonBall_DGNPCFastID1 = API_CreateMonsterEx(1,nNpcID,nDGNpcID_X,nDGNpcID_Y,4,0,-1,1)
		else
			if API_GetMonsterID(DragonBall_DGNPCFastID1) > 0 then
				API_DestroyMonster(DragonBall_DGNPCFastID1)
			end
			DragonBall_DGNPCFastID1 = API_CreateMonsterEx(1,nNpcID,nDGNpcID_X,nDGNpcID_Y,4,0,-1,1)
		end
	end
	--创建联邦活动npc
	if API_GetServerID() == 1 then
		if DragonBall_LBNPCFastID1 == nil then
			DragonBall_LBNPCFastID1 = API_CreateMonsterEx(2,nNpcID,nLBNpcID_X,nLBNpcID_Y,4,0,-1,1)
		else
			if API_GetMonsterID(DragonBall_LBNPCFastID1) > 0 then
				API_DestroyMonster(DragonBall_LBNPCFastID1)
			end
			DragonBall_LBNPCFastID1 = API_CreateMonsterEx(2,nNpcID,nLBNpcID_X,nLBNpcID_Y,4,0,-1,1)
		end
	end
	--阳关与珊瑚
	if API_GetServerID() == 1 then
		if DragonBall_LBNPCFastID1YG == nil then
			DragonBall_LBNPCFastID1YG = API_CreateMonsterEx(23,nNpcID,nSLSZID_YGX,nSLSZID_YGY,4,0,-1,1)
		else
			if API_GetMonsterID(DragonBall_LBNPCFastID1YG) > 0 then
				API_DestroyMonster(DragonBall_LBNPCFastID1YG)
			end
			DragonBall_LBNPCFastID1YG = API_CreateMonsterEx(23,nNpcID,nSLSZID_YGX,nSLSZID_YGY,4,0,-1,1)
		end
		
		if DragonBall_LBNPCFastID1SH == nil then
			DragonBall_LBNPCFastID1SH = API_CreateMonsterEx(10,nNpcID,nSLSZID_SHX,nSLSZID_SHY,4,0,-1,1)
		else
			if API_GetMonsterID(DragonBall_LBNPCFastID1SH) > 0 then
				API_DestroyMonster(DragonBall_LBNPCFastID1SH)
			end
			DragonBall_LBNPCFastID1SH = API_CreateMonsterEx(10,nNpcID,nSLSZID_SHX,nSLSZID_SHY,4,0,-1,1)
		end
	end
	--创建落日农庄99npc7
	if API_GetServerID() == 1 then
		if DragonBall_LBNPCFastID1LR == nil then
			DragonBall_LBNPCFastID1LR = API_CreateMonsterEx(99,nNpcID,nSLSZID_LRX,nSLSZID_LRY,4,0,-1,1)
		else
			if API_GetMonsterID(DragonBall_LBNPCFastID1LR) > 0 then
				API_DestroyMonster(DragonBall_LBNPCFastID1LR)
			end
			DragonBall_LBNPCFastID1LR = API_CreateMonsterEx(99,nNpcID,nSLSZID_LRX,nSLSZID_LRY,4,0,-1,1)
		end
	end
	
	--娜沙湿地98npc6
	if API_GetServerID() == 1 then
		if DragonBall_LBNPCFastID1LS == nil then
			DragonBall_LBNPCFastID1LS = API_CreateMonsterEx(98,nNpcID,nSLSZID_LSX,nSLSZID_LSY,4,0,-1,1)
		else
			if API_GetMonsterID(DragonBall_LBNPCFastID1LS) > 0 then
				API_DestroyMonster(DragonBall_LBNPCFastID1LS)
			end
			DragonBall_LBNPCFastID1LS = API_CreateMonsterEx(98,nNpcID,nSLSZID_LSX,nSLSZID_LSY,4,0,-1,1)
		end
	end
	
	local StartTimeTable = tNewDragonBall_StartTime
	local EndTimeTable = tNewDragonBall_EndTime
	--创结束触发器
	if ChristmasParty_EndDateTimeTriggerGID2013 == nil then
		ChristmasParty_EndDateTimeTriggerGID2013 = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'NewYearDragonBall_DestroyNPC')
	else
		API_DestroyTriggerG(ChristmasParty_EndDateTimeTriggerGID2013)
		ChristmasParty_EndDateTimeTriggerGID2013 = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'NewYearDragonBall_DestroyNPC')
	end
end

function NewYearDragonBall_DestroyNPC()
	--删除帝国活动npc
	if DragonBall_DGNPCFastID1 ~= nil then
		if API_GetMonsterID(DragonBall_DGNPCFastID1) > 0 then
			API_DestroyMonster(DragonBall_DGNPCFastID1)
		end
	end
	--删除联邦活动npc
	if DragonBall_LBNPCFastID1 ~= nil then
		if API_GetMonsterID(DragonBall_LBNPCFastID1) > 0 then
			API_DestroyMonster(DragonBall_LBNPCFastID1)
		end
	end
	--阳关
	if DragonBall_LBNPCFastID1YG ~= nil then
		if API_GetMonsterID(DragonBall_LBNPCFastID1YG) > 0 then
			API_DestroyMonster(DragonBall_LBNPCFastID1YG)
		end
	end
	--珊瑚
	if DragonBall_LBNPCFastID1SH ~= nil then
		if API_GetMonsterID(DragonBall_LBNPCFastID1SH) > 0 then
			API_DestroyMonster(DragonBall_LBNPCFastID1SH)
		end
	end
	--落日
	if DragonBall_LBNPCFastID1LR ~= nil then
		if API_GetMonsterID(DragonBall_LBNPCFastID1LR) > 0 then
			API_DestroyMonster(DragonBall_LBNPCFastID1LR)
		end
	end
	--娜沙
	if DragonBall_LBNPCFastID1LS ~= nil then
		if API_GetMonsterID(DragonBall_LBNPCFastID1LS) > 0 then
			API_DestroyMonster(DragonBall_LBNPCFastID1LS)
		end
	end
	
end
-----------------------------------------------------------------------------------------------------------------------------------------
----创建地表怪物 
-----------------------------------------------------------------------------------------------------------------------------------------
--创建时间触发器,因活动不是直接开放所以在活动时间对触发器删除做次判断

if DragonBallFuncID == nil then  --怪物时间触发器
	DragonBallFuncID = 0
end

if API_GetServerID() <11 then
	
	local StartTimeTable = tNewDragonBall_StartTime
	local EndTimeTable = tNewDragonBall_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouEnd > 0 then
		if DragonBallFuncID ~= nil then
			API_DestroyTriggerG(DragonBallFuncID)
			DragonBallFuncID = API_CreateTimerTriggerG(0,0,60,-1,'DragonBall_ActTimeFunc')
		else
		    DragonBallFuncID = API_CreateTimerTriggerG(0,0,60,-1,'DragonBall_ActTimeFunc')
		end
	else
		if DragonBallFuncID ~= nil then
			API_DestroyTriggerG(DragonBallFuncID)
		end
	end
end

--野外怪物时间回调
if tDragonBall_YeWaiGuaiID == nil then   ----------存放每张地图怪临时ID
   tDragonBall_YeWaiGuaiID = {}
end

function DragonBall_ActTimeFunc()
	
   if API_GetServerID() <11 then
	--活动时间点判断
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()	
	local StartTimeTable = tNewDragonBall_StartTime
	local EndTimeTable = tNewDragonBall_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if API_GetServerID() ==1 then
			--API_Trace('Hour='..Hour)
			if Hour == 11 and Minute == 55 then
				--API_Trace('Hour='..Hour)
				API_ActorBroadcastMsg(-1,17,'号外号外,龙珠盗贼12点将在阳光,落日,娜纱,珊瑚群岛出现。')						
			end
			if Hour == 19 and Minute == 55 then
				API_ActorBroadcastMsg(-1,17,'号外号外,龙珠盗贼20点将在阳光,落日,娜纱,珊瑚群岛出现。')	
			end							
		end
		if Hour == 12 or  Hour == 20 then
			--创建怪物
			--API_Trace('时间回调成功2222='..ntime)
			for i,v in tNewDragonBall_Map do
				local RightMapID = API_GetRightMapID(v)
				if API_MapIsValid(RightMapID) then
					local PlayNum = 50
					local PlayList = API_GetActorInArea(RightMapID,0,0,0,0,0)
					if PlayList ~= nil then
						PlayNum = table.getn(PlayList)
					end
					local MID = tNewDragonBall_MS[v][1]
					local NewDragonBallShuaNumber = 0
					if PlayNum <= 50 then
						NewDragonBallShuaNumber = tNewDragonBall_Number[MID].least
					else
						local Number = PlayNum - 50
						if PlayNum > 50 and PlayNum <= 150 then
						   NewDragonBallShuaNumber = Number + tNewDragonBall_Number[MID].least
						elseif PlayNum > 150 then
							NewDragonBallShuaNumber = tNewDragonBall_Number[MID].most
						end
					end
					if tDragonBall_YeWaiGuaiID[RightMapID] == nil then
						tDragonBall_YeWaiGuaiID[RightMapID] = {}
					end
					for j = 1,NewDragonBallShuaNumber do
						local YeWaiFastID = tDragonBall_YeWaiGuaiID[RightMapID][j]
						if YeWaiFastID == nil or API_GetMonsterID(YeWaiFastID) <= 0 then
							local Width,Height = PublicFun_GetMapWidthHeight(RightMapID)
							local TileX = 0
							local TileY = 0
							local Num = 0
							repeat
								Num = Num + 1
								--API_Trace('Num='..Num)
								TileX = math.random(Width)
								TileY = math.random(Height)
							until not API_IsBlockTile(RightMapID,TileX,TileY,0) or Num == 100
							if not API_IsBlockTile(RightMapID,TileX,TileY,0) then
								local MonsterID = tNewDragonBall_MS[v][2]
								local YeWaiFastID = API_CreateMonster(RightMapID,MonsterID,TileX,TileY,0,0,-1)
								--API_Trace('怪物FASTID='..YeWaiFastID)
								local bb = API_CreateDieTriggerG(0,0,0,YeWaiFastID,'DragonBall_YeWaiDieFunc') --创建怪物死亡触发器
								--API_Trace('创建怪物死亡触发器='..bb)
								tDragonBall_YeWaiGuaiID[RightMapID][j] = YeWaiFastID
							end
						end
					end
				end		
			end
			DragonBall_YeWaiShuaGuo = 1
		else
			if DragonBall_YeWaiShuaGuo == 1 then
				DragonBall_YeWaiShuaGuo = 0
				for i in tDragonBall_YeWaiGuaiID do
					for j,v in tDragonBall_YeWaiGuaiID[i] do
						if API_GetMonsterID(v) > 0 then
							API_DestroyMonster(v)
						end
					end
				end
				tDragonBall_YeWaiGuaiID = {}
			end	
		end 
	end
   end  
end
--怪物死亡回调函数
function DragonBall_YeWaiDieFunc (MapID,ActorID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if DynamicMapID <= 0 then
		return
	end
	if not API_MapIsValid(DynamicMapID) then
		return
	end
	local TeamID = API_GetTeamID(KillerID)
	local GuiShuType = 0
	local WhatID = 0
	if TeamID > 0 then
	   GuiShuType = 3
	   WhatID = TeamID
	else
	   GuiShuType = 0
	   WhatID = KillerID
	end

    	local MapConfigID = API_GetMapConfigID(DynamicMapID)
	local GoodTable = tDragonBall_YeWaiGoods
	for j in GoodTable do
	        if j == tNewDragonBall_MS[MapConfigID][1] then
			   for i in GoodTable[j] do
			      local GaiLv1 = GoodTable[j][i].GaiLv
			      local nRadomNum = math.random(1,6)
			      --local GaiLv = math.random(10000)
			      local nRadomNum = GoodTable[j][i].nRadomNum
			      --API_Trace('nRadomNum='..nRadomNum)
			       local nNum = math.random(1,nRadomNum)
			      -- API_Trace('nNum='..nNum)
			      --if GaiLv <= GaiLv1 then
			         local GoodsID = GoodTable[j][i].GoodsID
			         local Num  = GoodTable[j][i].GoodsNum
			         local PinZhi  = GoodTable[j][i].PinZhi
			         if PinZhi > 0 then
	                   		 API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,nNum,0,'春节野外怪掉落',GuiShuType,WhatID,600,120,PinZhi)
	                   		-- API_Trace('1111=')
			         else
			         	-- API_Trace('222=')
			         		 for k =1 , nNum do
	                  		  	API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsID,1,0,'春节野外怪掉落',GuiShuType,WhatID,600,120)
	                  		 end
			         end
			         
			      -- end
			   end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------
----NPC点击函数许愿与兑换
-----------------------------------------------------------------------------------------------------------------------------------

function HL_2012XN_ClickContent(ActorID, NPCID,XuanZe,Num)
	local ActorID = ActorID or API_RequestGetActorID()
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,12375)
	local XuanZe = XuanZe or API_RequestGetNumber(1)
	API_ResponseWrite('<name>神龙使者</name>')
	API_ResponseWrite('<text>	     亲爱的玩家您好，我是神龙使者，在这里您可以兑换到各种神奇BUFF龙珠。对了哦，如果您有【七星龙珠</text>')
	API_ResponseWrite('<img srcgd="'..nqixinglongzhuID..'" tipgd="'..nqixinglongzhuID..'" >')
	API_ResponseWrite('<text>】就可以参与许愿哦,如果您运气够好更有机会许愿得到</text>')	
	API_ResponseWrite('<img srcgd="'..HL1id..'" tipgd="'..HL1id..'" >')
	API_ResponseWrite('<img srcgd="'..HL2id..'" tipgd="'..HL2id..'" >')
	API_ResponseWrite('<img srcgd="'..HL3id..'" tipgd="'..HL3id..'" >')
	API_ResponseWrite('<img srcgd="'..HL4id..'" tipgd="'..HL4id..'" >')
	API_ResponseWrite('<img srcgd="'..HL5id..'" tipgd="'..HL5id..'" >')
	API_ResponseWrite('<img srcgd="'..HL6id..'" tipgd="'..HL6id..'" >')
	API_ResponseWrite('<text>大家快快来哦！</text>')	
	API_ResponseWrite('<br><br><br><a href="HL_SLSZ_NpcExchange?1=1&4='..NPCID..'">兑换龙珠</a><br>')
	API_ResponseWrite('<br><a href="HL_SLSZ_ZFExchange?1=1&3='..XuanZe..'&4='..NPCID..'">兑换祝福</a><br>')
	API_ResponseWrite('<br><a href="HL_2012XN_Wishing?1=2&4='..NPCID..'">七星龙珠许愿</a><br>')
	API_ResponseWrite('<br><a>确定</a>')
	API_ResponseFlush(ActorID)
end
--兑换祝福
function HL_SLSZ_ZFExchange(ActorID, NPCID,XuanZe,Num)
	
	local ActorID = ActorID or API_RequestGetActorID()
	local NPCID = NPCID or API_RequestGetNumber(4)
	local XuanZe = XuanZe or API_RequestGetNumber(2)
	--API_Trace('XuanZe='..XuanZe)
	if XuanZe == 0 then
		for i = 1 ,table.getn(tGoods) do
			local nGoodsID = tGoods[i].nGoodsID 
			local nGoodsFrom = tGoods[i].nGoodsFrom 
			API_ResponseWrite('<a href="HL_SLSZ_ZFExchange?1=1&2='..i..'&3='..XuanZe..'&4='..NPCID..'">        '..nGoodsFrom..'</a><br><br>')
		end
	else 
		--判断背包中是否有对应的龙珠
		local nRightGoods =  tGoods[XuanZe].nGoodsID 
		--API_Trace('nRightGoods='..nRightGoods)
		if API_ActorGetGoodsNum(ActorID,nRightGoods)< 1 then
			API_ResponseWrite('<text>您背包中没有</text>')
			API_ResponseWrite('<img srcgd="'..nRightGoods..'" tipgd="'..nRightGoods..'" >')
			API_ResponseWrite('<text>不符合兑换条件。</text>')
			API_ResponseWrite('<br><br><br><a>确定</a>')
		else
			--删除龙珠添加随机得到的状态
			if API_ActorRemoveGoods(ActorID,nRightGoods,1,'删除对应的龙珠') then
				local nRadomGoods = math.random(1,tGoods[XuanZe].nRadomGoodsIDNum);
				--API_Trace('nRadomGoods='..nRadomGoods)
				if API_ActorAddStatus(ActorID,tGoods[XuanZe].tRadomStatusID[nRadomGoods],0) then
				    API_ActorSendMsg(ActorID,3,'您消耗'..API_GetGoodsName(nRightGoods)..'获得了神龙祝福')
				    API_ResponseWrite('<text>您消耗</text><img srcgd="'..nRightGoods..'" tipgd="'..nRightGoods..'" ><text>获得了神龙祝福</text><br><br>')
				end	
				API_ResponseWrite('<br><a href="HL_SLSZ_ZFExchange">  返回</a>')
			end
		end
		
	end
	API_ResponseFlush(ActorID)
end
--点击兑换
function HL_SLSZ_NpcExchange()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	local NPCID = API_RequestGetNumber(4)
	if tDragonBallContent[SelectItem] == nil then
		return
	end
	if type(tDragonBallContent[SelectItem]) ~= 'table' then
		return
	end
	local PTGoodsID = 82030
	local GJGoodsID = 82031
	
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if tDragonBallContent[SelectItem][BuyNo] ~= nil then
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
			local YMD = Year * 10000 + Month * 100 + Day
			local GoodsID = tDragonBallContent[SelectItem][BuyNo].GoodsID
			local nGoodsID2 = tDragonBallContent[SelectItem][BuyNo].nGoodsID2
			local nNeedGoodsNum = tDragonBallContent[SelectItem][BuyNo].nNeedGoodsNum		
			local BuyNum = API_RequestGetNumber(num)
			if BuyNum < 1 then
				BuyNum = 1
			elseif BuyNum > 999 then
				BuyNum = 999
			end
			--获取玩家身上物品的数量
			local PTNum = API_ActorGetGoodsNum(ActorID,nGoodsID2)	
			nNeedGoodsNum = nNeedGoodsNum * BuyNum
			if nNeedGoodsNum > 0  then
				if PTNum >= nNeedGoodsNum then
					if API_ActorCanAddGoods(ActorID,GoodsID,BuyNum,1,0) ~= -1 then
						if API_ActorRemoveGoods(ActorID,nGoodsID2,nNeedGoodsNum,"神龙使者删除") then
							API_AddActorGoodsFlag(ActorID, GoodsID, BuyNum, 0, '神龙使者兑换')
							API_ActorSendMsg(ActorID,7,'使用'..nNeedGoodsNum..'个'..API_GetGoodsName(nGoodsID2)..'兑换了：'..API_GetGoodsName(GoodsID)..'  × '..BuyNum..'')
							API_ResponseWrite('<name>神龙使者</name>')
							API_ResponseWrite('<text>兑换获得：</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
							API_ResponseWrite('<br><a href="HL_2012XN_ClickContent">  返回</a>')
						end
					else
						API_ResponseWrite('<text>背包空间不足，无法合成。</text><br>')
						API_ResponseWrite('<br><a href="HL_2012XN_ClickContent">  返回</a>')
					end
				else
					API_ResponseWrite('<text>你的'..API_GetGoodsName(nGoodsID2)..'数量不足，无法兑换。</text><br>')
					API_ResponseWrite('<br><a href="HL_2012XN_ClickContent">  返回</a>')
				end
			else
				API_ResponseWrite('<text>你的'..API_GetGoodsName(nGoodsID2)..'数量不满足兑换数目条件。</text><br>')
				API_ResponseWrite('<br><a href="HL_2012XN_ClickContent">  返回</a>')			
			end	
		end
		return
	end
	local GoodsNum = table.getn(tDragonBallContent[SelectItem])
	API_ResponseWrite('<name>神龙使者</name>')
	API_ResponseWrite('<win rect="30,75,500,510"></win>')
	--阳光雨林2,3,4,5,10,珊瑚群岛2,3,4,5,10,落日农庄7,6娜沙湿地23,10,99,98
	API_ResponseWrite('<br><text>	     在活动时间内，每天12:00-13:00与19:00-20:00，在阳光，珊瑚，落日，娜纱地图刷新龙珠盗贼，击败它你将获得“破龙珠”。</text><br>')
	for i = 1,GoodsNum do
		if i > Page * 6 and i < (Page + 1) * 6 + 1 then
			local GoodsID = tDragonBallContent[SelectItem][i].GoodsID
			local nGoodsID2 = tDragonBallContent[SelectItem][i].nGoodsID2
			local nNeedGoodsNum = tDragonBallContent[SelectItem][i].nNeedGoodsNum		
			--local BuyNum = API_RequestGetNumber(num)
			API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(GoodsID)..'</text><br>')
			API_ResponseWrite('<img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'">')
			local BuyNumTip = '  兑换需要：'
			if nNeedGoodsNum > 0 then
				BuyNumTip = BuyNumTip..''..API_GetGoodsName(nGoodsID2)..' x '..nNeedGoodsNum..''
			end
			
			local BuyNumTipLen = string.len(BuyNumTip)
			if BuyNumTipLen < 50 then
				for j = 1,50- BuyNumTipLen do
					BuyNumTip = BuyNumTip..' '
				end
			end
			API_ResponseWrite('<text color="255,0,255">'..BuyNumTip..'</text>')
			local num = i * 100
			API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
			API_ResponseWrite('<text> </text>')
			API_ResponseWrite('<img src="LuaUse\\button Exchange_u.bmp" src2="LuaUse\\button Exchange_l.bmp" close="0" href="HL_SLSZ_NpcExchange?1='..SelectItem..'&2='..Page..'&3='..i..'&4='..NPCID..'"><br>')
			API_ResponseWrite('<text>—————————————————————————————————————</text><br>')
		end
	end
	if GoodsNum < (Page + 1) * 6 then
		for i = 1,(Page + 1) * 6 - GoodsNum do
			API_ResponseWrite('<br><br><br><br>')
		end
	end
	if GoodsNum > 6 then
		local BackPage = Page - 1
		local NextPage = Page + 1
		if Page == 0 then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_g.bmp"><text>                   </text>')
			API_ResponseWrite('<a href="HL_2012XN_ClickContent">返回</a>')
			API_ResponseWrite('<text>                   </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="HL_SLSZ_NpcExchange?1='..SelectItem..'&2='..NextPage..'&4='..NPCID..'">')
		elseif (Page + 1) * 6 < GoodsNum then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="HL_SLSZ_NpcExchange?1='..SelectItem..'&2='..BackPage..'&4='..NPCID..'"><text>                   </text>')
			API_ResponseWrite('<a href="HL_2012XN_ClickContent">返回</a>')
			API_ResponseWrite('<text>                   </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="HL_SLSZ_NpcExchange?1='..SelectItem..'&2='..NextPage..'&4='..NPCID..'">')
		else
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="HL_SLSZ_NpcExchange?1='..SelectItem..'&2='..BackPage..'&4='..NPCID..'"><text>                   </text>')
			API_ResponseWrite('<a href="HL_2012XN_ClickContent">返回</a>')
			API_ResponseWrite('<text>                   </text><img src="LuaUse\\button_next_g.bmp">')
		end
	else
		API_ResponseWrite('<br><a href="HL_2012XN_ClickContent">  返回</a>')
	end
end

--点击许愿函数
function HL_2012XN_Wishing(ActorID, NPCID,XuanZe,Num)
	local ActorID = ActorID or API_RequestGetActorID()
	local NPCID = NPCID or API_RequestGetNumber(4)
	local nChoose = API_RequestGetNumber(1)
	local nActorLev2 =  API_GetActorExpLevel(ActorID)
	--API_Trace('nActorLev2='..nActorLev2)
	API_ResponseWrite('<name>神龙使者</name>')
	if API_ActorGetGoodsNum(ActorID,82044)< 1 then
		API_ResponseWrite('<text>您背包中没有七星龙珠，不能许愿。</text>')
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return
	end
	
	--许愿界面
	if  API_ActorGetPackageSize(ActorID) < 1 then
		API_ResponseWrite('<text>背包空间不足，不能通过七星龙珠许愿。</text>')
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return
	end
		
		if API_ActorRemoveGoods(ActorID,82044,1,'删除七星龙珠') then
			local JiangLiQuYu = 1
			local PlayLv = API_GetActorExpLevel(ActorID)
			if PlayLv > 40 then
				JiangLiQuYu = 3
			elseif PlayLv > 25 then
				JiangLiQuYu = 2
			end
			local JiangLiTable = ShenLongXuYuan[JiangLiQuYu]
			local JiangLiGaiLv = math.random(10000000)
			for j in JiangLiTable do
				local GaiLv1 = JiangLiTable[j].GaiLv1
				local GaiLv2 = JiangLiTable[j].GaiLv2
				if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
					local JiangLiGoodsID = JiangLiTable[j].GoodsID
					if tBroadcastGoods[JiangLiGoodsID] ~= nil then
						local nMax = tBroadcastGoods[JiangLiGoodsID].nMax;
						local Data = tBroadcastGoods[JiangLiGoodsID].Data;
						local Num5 = API_VarDataGetNumber_Ex(1,0,-6103,1,Data)
						--增加CD
						local CDData = 177
						local CDTime = math.random(300,600)
						local NowTime = os.time()
						local NextTime = API_VarDataGetNumber_Ex(1,0,-6103,1,CDData)
						if NowTime >= NextTime then
							if Num5 >= nMax then
								API_AddActorGoods(ActorID,88171, 1, "给背包中加许愿的物品");
								JiangLiGoodsID = 88171
							else
								Num5 = Num5 + 1
								API_VarDataSetNumber_Ex_Sync(1,0,-6103,1,Data,Num5)
								--增加宝石接口
								local PD = 0
								for h,v in baoshiwupinbiao do
									if JiangLiGoodsID == v then
										PD = 1
									end
								end
								if PD == 1 then
									fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
								else
									API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加许愿的物品");
								end
								API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'鸿运当头通过许愿获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
								NextTime = NowTime + CDTime
								API_VarDataSetNumber_Ex_Sync(1,0,-6103,1,CDData,NextTime)
							end
						else
							--加洗点
							API_AddActorGoods(ActorID,80686, 1, "给背包中加许愿的物品");
							JiangLiGoodsID = 80686
						end
					elseif tBroadcastCDGoods[JiangLiGoodsID] ~= nil then
						local CDData = tBroadcastCDGoods[JiangLiGoodsID].CDData;
						--local CDTime = tBroadcastCDGoods[JiangLiGoodsID].CDTime;
						local CDTime = math.random(180,300)
						local NowTime = os.time()
						local NextTime = API_VarDataGetNumber_Ex(1,0,-6103,1,CDData)
						if NowTime >= NextTime then
							--增加宝石接口
							local PD = 0
							for h,v in baoshiwupinbiao do
								if JiangLiGoodsID == v then
									PD = 1
								end
							end
							if PD == 1 then
								fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
							else
								API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加许愿的物品");
							end
							--世界广播特殊处理
							for x,v in tHL_guangbo do
								if JiangLiGoodsID == v then
									API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'鸿运当头通过许愿获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
								end
							end	
							NextTime = NowTime + CDTime
							API_VarDataSetNumber_Ex_Sync(1,0,-6103,1,CDData,NextTime)
							--API_Trace('CDData1='..CDData)
							--API_Trace('CDTime1='..CDTime)
							--API_Trace('NowTime1='..NowTime)
								
						else
							API_AddActorGoods(ActorID,88171, 1, "给背包中加许愿的物品");
							JiangLiGoodsID = 88171
						end
					else
						--增加宝石接口
						local PD = 0
						for h,v in baoshiwupinbiao do
							if JiangLiGoodsID == v then
								PD = 1
							end
						end
						if PD == 1 then
							fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
						else
							API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加许愿的物品");
						end
					end
					API_ResponseWrite('<text>您获得了</text><text color="255,0,255">'..API_GetGoodsName(JiangLiGoodsID)..'</text>')
					API_ResponseWrite('<img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'" >')
					API_ResponseWrite('<br><br><a>关闭</a>')
					API_ResponseFlush(ActorID)
				end
			end
		else
			API_ResponseWrite('<text>您背包中没有七星龙珠，不能许愿。</text>')
			API_ResponseWrite('<br><br><a>确定</a>')
			API_ResponseFlush(ActorID)
			return
		end	
end 

-------------------------------------------------------------------------------------------------------------------------------------------------------
--使用龙珠函数（1-6）- -20111227需求变更
-------------------------------------------------------------------------------------------------------------------------------------------------------
--[[function HL_2012XNLZ_BUFF(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local ActorID = ActorID or API_RequestGetActorID()
	--判断是否有物品 
	if API_ActorGetGoodsNum(ActorID,GoodsID)< 1 then
		return 0	
	end
	if tGoods == nil then
		return 0
	end
	--删掉物品添加随机得到的状态
	local nIndex = table.getn(tGoods);
	for i = 1 ,nIndex do
		if GoodsID == tGoods[i].nGoodsID then
		--API_Trace('GoodsID='..GoodsID)
			if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除龙珠') then
				local nRadomGoods = math.random(1,tGoods[i].nRadomGoodsIDNum);
				if API_ActorAddStatus(ActorID,tGoods[i].tRadomStatusID[nRadomGoods],0) then
				    API_ActorSendMsg(ActorID,3,'您使用了'..API_GetGoodsName(GoodsID)..'')
				    break;
				end	
			end  
		end
	end
	return 1
end]]--

----------------------------------------------------------------------------------------------------------------------------
--使用汤圆函数
----------------------------------------------------------------------------------------------------------------------------
--[[function HL_TanYuan(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local ActorID = ActorID or API_RequestGetActorID()
	API_Trace('222='..ActorID)
	--判断是否有物品 
	if API_ActorGetGoodsNum(ActorID,GoodsID)< 1 then
		return 0	
	end
	if tTYGoods == nil then
		return 0
	end
	--删掉物品添加随机得到的状态
	local nIndex = table.getn(tTYGoods);
	for i = 1 ,nIndex do
		if GoodsID == tTYGoods[i].nGoodsID then
			if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除龙珠') then
				local nRadomGoods = math.random(1,tTYGoods[i].nRadomGoodsIDNum);
				if API_ActorAddStatus(ActorID,tTYGoods[i].tRadomStatusID[nRadomGoods],1) then
				    API_ActorSendMsg(ActorID,7,'您使用了'..API_GetGoodsName(GoodsID)..'')
				    break;
				end	
			end  
		end
	end
	return 1
end]]--
--------------------------------------------------------------------------------------------------------------------------
--使用神龙令函数
----------------------------------------------------------------------------------------------------------------------------
local nSLLGoodsID = 89131
function HL_ShenLong(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local ActorID = ActorID or API_RequestGetActorID()
	--API_Trace('111='..GoodsID)
	local nActorLev2 =  API_GetActorExpLevel(ActorID)
	API_ResponseWrite('<name>神龙令牌</name>')
	if API_ActorGetGoodsNum(ActorID,89131)< 1 then
		API_ResponseWrite('<text>您背包中没有神龙令牌，不能许愿。</text>')
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end
	--API_Trace('222='..GoodsID)
  	if  API_ActorGetPackageSize(ActorID) < 1 then
		API_ResponseWrite('<text>背包空间不足，不能通过神龙令牌许愿。</text>')
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end
	--API_Trace('333='..GoodsID)
	if API_ActorRemoveGoods(ActorID,89131,1,'删除神龙令牌') then
		local JiangLiQuYu = 1
		local PlayLv = API_GetActorExpLevel(ActorID)
		if PlayLv > 40 then
			JiangLiQuYu = 3
		elseif PlayLv > 25 then
			JiangLiQuYu = 2
		end
		local JiangLiTable = ShenLongLingPai[JiangLiQuYu]
		local JiangLiGaiLv = math.random(10000000)
			for j in JiangLiTable do
				local GaiLv1 = JiangLiTable[j].GaiLv1
				local GaiLv2 = JiangLiTable[j].GaiLv2
				if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
					local JiangLiGoodsID = JiangLiTable[j].GoodsID
					if tBroadcastGoods[JiangLiGoodsID] ~= nil then
						local nMax = tBroadcastGoods[JiangLiGoodsID].nMax;
						local Data = tBroadcastGoods[JiangLiGoodsID].Data;
						local Num5 = API_VarDataGetNumber_Ex(1,0,-6103,1,Data)
						
						--增加CD
						local CDData = 177
						local CDTime = math.random(300,600)
						local NowTime = os.time()
						local NextTime = API_VarDataGetNumber_Ex(1,0,-6103,1,CDData)
						if NowTime >= NextTime then
							if Num5 >= nMax then
								API_AddActorGoods(ActorID,88171, 1, "给背包中加许愿的物品");
								JiangLiGoodsID = 88171
							else
								Num5 = Num5 + 1
								API_VarDataSetNumber_Ex_Sync(1,0,-6103,1,Data,Num5)
								--增加宝石接口
								local PD = 0
								for h,v in baoshiwupinbiao do
									if JiangLiGoodsID == v then
										PD = 1
									end
								end
								if PD == 1 then
									fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
								else
									API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加许愿的物品");
								end
								API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'鸿运当头通过神龙令牌获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
								NextTime = NowTime + CDTime
								API_VarDataSetNumber_Ex_Sync(1,0,-6103,1,CDData,NextTime)
							end
						else
							--加洗点
							API_AddActorGoods(ActorID,80686, 1, "给背包中加许愿的物品");
							JiangLiGoodsID = 80686
						end
					elseif tBroadcastCDGoods[JiangLiGoodsID] ~= nil then
						local CDData = tBroadcastCDGoods[JiangLiGoodsID].CDData;
						local CDTime = math.random(180,300)
						local NowTime = os.time()
						local NextTime = API_VarDataGetNumber_Ex(1,0,-6103,1,CDData)
						if NowTime >= NextTime then
							--增加宝石接口
							local PD = 0
							for h,v in baoshiwupinbiao do
								if JiangLiGoodsID == v then
									PD = 1
								end
							end
							if PD == 1 then
								fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
							else
								API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加许愿的物品");
							end
							--世界广播特殊处理
							for x,v in tHL_guangbo do
								if JiangLiGoodsID == v then
									API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'鸿运当头通过神龙令牌获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
								end
							end
							
							NextTime = NowTime + CDTime
							API_VarDataSetNumber_Ex_Sync(1,0,-6103,1,CDData,NextTime)
							--API_Trace('CDData4='..CDData)
							--API_Trace('CDTime4='..CDTime)
							--API_Trace('NowTime4='..NowTime)		
						else
							API_AddActorGoods(ActorID,88171, 1, "给背包中加许愿的物品");
							JiangLiGoodsID = 88171
						end
					else
						--增加宝石接口
						local PD = 0
						for h,v in baoshiwupinbiao do
							if JiangLiGoodsID == v then
								PD = 1
							end
						end
						if PD == 1 then
							fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
						else
							API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加许愿的物品");
						end
						--API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加许愿的物品");
						
					end
					API_ResponseWrite('<text>您获得了</text><text color="255,0,255">'..API_GetGoodsName(JiangLiGoodsID)..'</text>')
					API_ResponseWrite('<img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'" >')
					API_ResponseWrite('<br><br><a>关闭</a>')
					API_ResponseFlush(ActorID)
				end
			end
		return 1
			
	else
		API_ResponseWrite('<text>您背包中没有神龙令牌删除，不能许愿。</text>')
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end			
end

--跨天12点清除：
function HLMeiriHuoDong_ShuJuQingChu(Param1,Param2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local NowTime = os.time()
	--API_Trace('111')
	if API_GetServerID() == 1 then
		if NowTime > API_VarDataGetNumber_Ex(1,0,-6103,1,101) then
			--API_Trace('222')
			API_VarDataSetNumber_Ex_Sync(1,0,-6103,1,1,0)
			
			API_VarDataSetNumber_Ex_Sync(1,0,-6103,1,8,0) 
			
			API_VarDataSetNumber_Ex_Sync(1,0,-6103,1,12,0) 
			 
			API_VarDataSetNumber_Ex_Sync(1,0,-6103,1,17,0) 
			
			API_VarDataSetNumber_Ex_Sync(1,0,-6103,1,22,0) 
			
			local NowTime = os.date("*t", os.time()) 
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 12 
			NowTime.min = 0 
			NowTime.sec = 0 
			local NextTime = os.time(NowTime) 
			RefreshTime = NextTime + 86400   
			API_VarDataSetNumber_Ex_Sync(1,0,-6103,1,101,RefreshTime)                  
		end
	end
end