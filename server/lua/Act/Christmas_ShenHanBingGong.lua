-------------------------------
--文件名:	Scp\Lua\Act\Christmas_ShenHanBingGong.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:   梁宇宁
--日  期:	2010-11-25
--版  本:
--描  述:   圣诞节活动-冰雪寒宫
--应  用:
-------------------------------



Christmas_SendID = 88994  ------------冰雪寒宫传送卷ID
Christmas_FbID = 2032  --------------  冰雪寒宫地图ID

Christmas_FbExit = 11607 -----------圣诞节出口ID

Christmas_FbEnterPosX = 169 -----------圣诞节出口坐标
Christmas_FbEnterPosY = 122

ZongTime = 300 ---------副本刷怪时间 (改时间要改30秒以上，不然有问题)

---------副本地图交互信息-----------
PeoNum = 1    -------第一次进入副本的人数
CurSec = 2    -------当前副本进行的时间（秒）
BoShu = 3     -------当前副本进行的轮数

-------每轮怪物的配置数量--------
PtGuaiNum = 28
JyGuaiNum = 2

-------角色交互数据信息---------
ShengDanJiFen = 19038     ----圣诞积分

-------怪物走向中间的坐标-------
MidX = 123
MidY = 126


Christmas_FbEnterPos = {     ------------怪物刷新的5个坐标
    [1] = {x = 108,y = 104},
    [2] = {x = 141,y = 105},
    [3] = {x = 148,y = 143},
    [4] = {x = 102,y = 146},
    [5] = {x = 100,y = 126},

}

PtGuaiID = {730401,730402,730403,730404,730405}  --------怪物的ID
JyGuaiID = {730501,730502,730503,730504,730505}

if Christmas_PtGuaiList == nil then     ----------存放动态地图普通怪临时ID
   Christmas_PtGuaiList = {}
end

if Christmas_JyGuaiList == nil then     ----------存放动态地图精英怪临时ID
   Christmas_JyGuaiList = {}
end

-----------活动时间表-----------

Christmas_Start = {Year = 2010,Month = 12,Day = 16,Hour = 0,Minute = 0,Second = 0} -------活动日期
Christmas_End = {Year = 2011,Month = 1,Day = 4,Hour = 0,Minute = 0,Second = 0}


-----------排名临时表-----------


if Christmas_PaiMingZongGuaiList == nil then     ----------存放动态地图击杀怪物个数
   Christmas_PaiMingZongGuaiList = {}
end

if Christmas_PaiMingJyGuaiList == nil then     ----------存放动态地图击杀精英怪个数
   Christmas_PaiMingJyGuaiList = {}
end

if Christmas_PaiMingPtGuaiList == nil then     ----------存放动态地图击杀普通怪个数
   Christmas_PaiMingPtGuaiList = {}
end

-----------Buff临时表-----------

Christmas_JyBuff = {     ------------击杀精英怪给予的Buff
    [1] = {nameid = 1013003,num = 36},  ---变态杀戮
    [2] = {nameid = 1013002,num = 18},      ---暴走
    [3] = {nameid = 1013001,num = 9},   ---如神一般
}

Christmas_ZuduiBuff = {     ------------击杀精英怪给予的Buff
    [1] = {nameid = 1012001},  ---团结之力      2
    [2] = {nameid = 1012002},      ---团结之力  3
    [3] = {nameid = 1012003},   ---团结之力      4
    [4] = {nameid = 1012004},   ---团结之力      5人组队
}

Christmas_HuTiBuffID = 1011001  --冰魂护体



------------精英奖励表---------------------

Christmas_JyDrop= {                                -------第一轮
  [1] = {
         {GoodsID=82019,GoodsNum=1,GaiLv=10000,PinZhi=0,Name= '冰寒变色怪'},
         {GoodsID=80498,GoodsNum=3,GaiLv=1000000,PinZhi=0,Name= '冰寒变色怪'},
         {GoodsID=104,GoodsNum=1,GaiLv=100000,PinZhi=0,Name= '冰寒变色怪'},
         {GoodsID=204,GoodsNum=1,GaiLv=100000,PinZhi=0,Name= '冰寒变色怪'},

		},

  [2] = {         
         {GoodsID=82019,GoodsNum=1,GaiLv=20000,PinZhi=0,Name= '冰寒机甲虫'},
         {GoodsID=80498,GoodsNum=3,GaiLv=1000000,PinZhi=0,Name= '冰寒机甲虫'},
         {GoodsID=80498,GoodsNum=3,GaiLv=300000,PinZhi=0,Name= '冰寒机甲虫'},
         {GoodsID=80498,GoodsNum=3,GaiLv=300000,PinZhi=0,Name= '冰寒机甲虫'},
         {GoodsID=104,GoodsNum=1,GaiLv=100000,PinZhi=0,Name= '冰寒机甲虫'},
         {GoodsID=204,GoodsNum=1,GaiLv=100000,PinZhi=0,Name= '冰寒机甲虫'},

        },

  [3] = {      
         {GoodsID=82019,GoodsNum=1,GaiLv=30000,PinZhi=0,Name= '冰寒轰隆兽'},
         {GoodsID=80498,GoodsNum=3,GaiLv=1000000,PinZhi=0,Name= '冰寒轰隆兽'},
         {GoodsID=80498,GoodsNum=3,GaiLv=600000,PinZhi=0,Name= '冰寒轰隆兽'},
         {GoodsID=80498,GoodsNum=3,GaiLv=200000,PinZhi=0,Name= '冰寒轰隆兽'},
         {GoodsID=104,GoodsNum=1,GaiLv=100000,PinZhi=0,Name= '冰寒轰隆兽'},
         {GoodsID=204,GoodsNum=1,GaiLv=100000,PinZhi=0,Name= '冰寒轰隆兽'},

        },

  [4] = {         
         {GoodsID=82019,GoodsNum=1,GaiLv=40000,PinZhi=0,Name= '冰寒巨熊兽'},
         {GoodsID=80498,GoodsNum=3,GaiLv=1000000,PinZhi=0,Name= '冰寒巨熊兽'},
         {GoodsID=80498,GoodsNum=3,GaiLv=600000,PinZhi=0,Name= '冰寒巨熊兽'},
         {GoodsID=80498,GoodsNum=3,GaiLv=200000,PinZhi=0,Name= '冰寒巨熊兽'},
         {GoodsID=104,GoodsNum=1,GaiLv=100000,PinZhi=0,Name= '冰寒巨熊兽'},
         {GoodsID=204,GoodsNum=1,GaiLv=100000,PinZhi=0,Name= '冰寒巨熊兽'},

        },

  [5] = {
          {GoodsID=82019,GoodsNum=1,GaiLv=400000,PinZhi=0,Name= '冰寒死神'},
          {GoodsID=82019,GoodsNum=1,GaiLv=100000,PinZhi=0,Name= '冰寒死神'},
          {GoodsID=80498,GoodsNum=3,GaiLv=1000000,PinZhi=0,Name= '冰寒死神'},
          {GoodsID=80498,GoodsNum=3,GaiLv=1000000,PinZhi=0,Name= '冰寒死神'},
          {GoodsID=80498,GoodsNum=3,GaiLv=600000,PinZhi=0,Name= '冰寒死神'},
          {GoodsID=80498,GoodsNum=3,GaiLv=200000,PinZhi=0,Name= '冰寒死神'},
          {GoodsID=104,GoodsNum=1,GaiLv=100000,PinZhi=0,Name= '冰寒死神'},
          {GoodsID=204,GoodsNum=1,GaiLv=100000,PinZhi=0,Name= '冰寒死神'},
        },

}

-------------普通怪掉落-----------

Christmas_PtDrop= {                                -------第一轮
  [1] = {GoodsID=82019,GoodsNum=1,GaiLv=3000,PinZhi=0,Name= '冰寒屠夫'},
  [2] = {GoodsID=82019,GoodsNum=1,GaiLv=4000,PinZhi=0,Name= '冰寒镰刀手'},
  [3] = {GoodsID=82019,GoodsNum=1,GaiLv=6000,PinZhi=0,Name= '冰寒剑客'},
  [4] = {GoodsID=82019,GoodsNum=1,GaiLv=8000,PinZhi=0,Name= '冰寒骑士'},
  [5] = {GoodsID=82019,GoodsNum=1,GaiLv=50000,PinZhi=0,Name= '冰寒伯爵'},

}

table_JinYanQuan_GoodsNum = {8,10,13,15,18,20,23,26,28,31,38,44,49,54,59,64,69,74,79,84,100,108,115,123,131,230,246,261,276,292,307,323,338,353,369,415,434,453,472,492,549,572,595,618,641,664,687,710,733,756,756,756,756,756,756,811,836,860,885,909,934,958,983,1008,1032,
}    -----经验兑换券对应等级的个数 

table_BinXueHanGong_Goods = {
[1] = {
			{GoodsID = 80498,Num = 1,Bind = 0,Odds =10000,PinZhi=0,Point=20},   -------超级经验券
			
		},
[2] = {
		[1]={                                                        ------品质7 
			{GoodsID = 4001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 4101,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6601,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6901,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 8101,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 4301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 4201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 4401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 4501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 2001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 3001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 3901,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 5001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 5101,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6701,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 7001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 8201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 5301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 5201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 5401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 5501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 1501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6101,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6801,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 8001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 8301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 1001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			},
		[2] = {
			{GoodsID = 6602,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6902,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 8102,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 4302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 4202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 4402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 4502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6702,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 7002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 8202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 5302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 5202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 5402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 5502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6802,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 8002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 8302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 4002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 4102,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 5002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 5102,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 6102,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 2002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 3002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 3902,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 1502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 1002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			},
		[3] = {
			{GoodsID = 4303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 4203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 4403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 4503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 5303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 5203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 5403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 5503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 6303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 6203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 6403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 6503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 4103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 4003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 5003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 5103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 6003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 6103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 6603,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 6903,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 8103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 2003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 3003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 3903,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 6703,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 7003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 8203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 1503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 6803,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 8003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 8303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			{GoodsID = 1003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},
			},
		},
		
[3] = {
		[1]={                                                         ------品质2
			{GoodsID = 4001,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 4101,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6601,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6901,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 8101,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 4301,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 4201,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 4401,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 4501,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 2001,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 3001,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 3901,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 5001,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 5101,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6701,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 7001,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 8201,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 5301,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 5201,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 5401,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 5501,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 1501,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6001,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6101,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6801,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 8001,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 8301,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6301,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6201,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6401,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6501,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 1001,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			},
		[2] = {
			{GoodsID = 6602,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6902,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 8102,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 4302,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 4202,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 4402,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 4502,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6702,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 7002,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 8202,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 5302,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 5202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},
			{GoodsID = 5402,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 5502,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6802,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 8002,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 8302,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6302,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6202,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6402,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6502,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 4002,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 4102,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 5002,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 5102,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6002,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 6102,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 2002,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 3002,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 3902,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 1502,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			{GoodsID = 1002,Num = 1,Bind = 0,Odds =10000,PinZhi=2},
			},
		[3] = {
			{GoodsID = 4303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 4203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 4403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 4503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 5303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 5203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 5403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 5503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 6303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 6203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 6403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 6503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 4103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 4003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 5003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 5103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 6003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 6103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 6603,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 6903,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 8103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 2003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 3003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 3903,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 6703,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 7003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 8203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 1503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 6803,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 8003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 8303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			{GoodsID = 1003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 2},
			},
		},

[4] = {                                                                                       -----特殊 
		{GoodsID = '四档六品',Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6,GaiLv = 700},
		--圣诞礼服
		{GoodsID = 11322,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,GaiLv = 100},
		{GoodsID = 11323,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,GaiLv = 100},
		{GoodsID = 11324,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,GaiLv = 100},
		{GoodsID = 11325,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,GaiLv = 100}, --------圣诞时装 
		{GoodsID = 82019,Num = 50,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,GaiLv = 6500},
		{GoodsID = 88992,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,GaiLv = 1000},
		{GoodsID = 32020,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,GaiLv = 100},
		{GoodsID = 32014,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,GaiLv = 100},
		{GoodsID = 39701,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,GaiLv = 100},
		{GoodsID = 39705,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,GaiLv = 100},
		{GoodsID = 80952,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,GaiLv = 1000},	
	  },      

}
--四档六品

table_BinXueHanGong_SiDangLiuPinGoods = {
    {GoodsID = 4303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 4203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 4403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 4503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 5303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 5203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 5403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 5503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 6303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 6203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 6403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 6503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 4103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 4003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 5003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 5103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 6003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},
    {GoodsID = 6103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 6},

}


ShengDanShiZhuangOneID = -7007 ---------第一件圣诞时装5件上限 
ShengDanShiZhuangTwoID = -7008 ---------第二件圣诞时装5件上限
ShengDanShiZhuangThreeID = -7009 ---------第三件圣诞时装5件上限
ShengDanShiZhuangFourID = -7010 ---------第四件圣诞时装5件上限

ShengDan_HuanCaiZhiYuID = -7011 ---------幻彩之鱼1件上限
ShengDan_AnYiMoTanID = -7012 ---------暗翼魔毯卡片1件上限
ShengDan_FeiTingLuKeID = -7013 ---------飞艇鲁克卡1件上限
ShengDan_KunChongBaoMuCheID = -7014 ---------昆虫保姆车卡1件上限

ShengDan_SiDangLiuPinZhiID = -7015 ---------4档6品质5件上限

ShengDan_SiDangShengDangMoJingID = -7016 ---------四档升档魔晶10件上限

ShengDan_FuBenShuaID = -7017 ---------日产数量是否要刷新

---------------副本入口点击-----------------

function Christmas_Click(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
    local ActorID = ActorID or API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	local Delete = 0
    local InFactSize = 0   --------实际人数
    if XuanZe == 1 then
	    local RightMapID = API_GetMapConfigID(MapID)
	    if RightMapID == 2032 then
           API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
           API_ResponseWrite('<br><text>你已在冰雪寒宫里，不必使用</text><text color="255,0,255">冰雪寒宫传送卷轴</text><text>。</text><br>')
		   API_ResponseWrite('<br><a>确定</a><br>')
		   API_ResponseFlush(ActorID)
		   return
		end
		if MapID ~= StaticMapID then
           API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
           API_ResponseWrite('<br><text>你在副本内无法使用</text><text color="255,0,255">冰雪寒宫传送卷轴</text><text>。</text><br>')
		   API_ResponseWrite('<br><a>确定</a><br>')
		   return
	    end
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
		   if API_GetTeamLeader(TeamID) ~= ActorID then
              API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
              API_ResponseWrite('<br><text>必须是</text><text color="255,0,255">队长</text><text>才能带领队员进入冰雪寒宫。</text><br>')
		      API_ResponseWrite('<br><a>确定</a><br>')
		      API_ResponseFlush(ActorID)
		      return
		   end
		   local TeamSize = API_GetTeamSize(TeamID)    ----------------------队伍人数
		   for i = 1,TeamSize do
			   local TeamActorID = API_GetTeamMem(TeamID,i)
			   if API_ActorIsOnline(TeamActorID) then
			      local PlayX2,PlayY2 = PublicFun_GetActorPosXY(TeamActorID)
                  local TeamActorMapID = API_GetActorMapID(TeamActorID)
                  InFactSize = InFactSize + 1 ------------实际在线的人数
--                  if API_ActorGetPackageSize(TeamActorID) < 5 then
--                     API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
--                     API_ResponseWrite('<br><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>背包不足5格，无法进入。且进入副本后请保持您的背包至少有1格空位，以便获得额外惊喜奖励</text><br>')
--                     API_ResponseWrite('<br><a>确定</a><br>')
--                     API_ResponseFlush(ActorID)
--                     return
--		          end
                  if API_ActorGetGoodsNum(TeamActorID,Christmas_SendID) < 1  then
                     API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
                     API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>身上没有冰雪寒宫传送卷。</text><br>')
				     API_ResponseWrite('<br><a>确定</a><br>')
				     API_ResponseFlush(ActorID)
				     return
				  end
			      if  TeamActorMapID ~= MapID then
				      API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
                      API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>不在同一场景中。</text><br>')
				      API_ResponseWrite('<br><a>确定</a><br>')
				      API_ResponseFlush(ActorID)
				      return
			      end

 			      if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
				     API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
				     API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>正在快递，无法进入冰雪寒宫！</text><br>')
				     API_ResponseWrite('<br><a>确定</a><br>')
				     API_ResponseFlush(ActorID)
			         return
			      end
			      if API_ActorFindStatus(TeamActorID,519) then
				     API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
				     API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>正在摆摊，无法进入冰雪寒宫！</text><br>')
				     API_ResponseWrite('<br><a>确定</a><br>')
				     API_ResponseFlush(ActorID)
				     return
			      end
			      if API_ActorIsDying(TeamActorID) then
				     API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
				     API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>死亡，无法进入冰雪寒宫！</text><br>')
			         API_ResponseWrite('<br><a>确定</a><br>')
				     API_ResponseFlush(ActorID)
				     return
			      end
			      if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
				     API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
				     API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>在公交车上无法进入冰雪寒宫！</text><br>')
				     API_ResponseWrite('<br><a>确定</a><br>')
				     API_ResponseFlush(ActorID)
				     return
			      end
			   end
		   end
		else
		   InFactSize = 1
--		   if API_ActorGetPackageSize(ActorID) < 5 then
--              API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
--              API_ResponseWrite('<br><text>你的</text><text>背包不足5格，无法进入。且进入副本后请保持您的背包至少有1格空位，以便获得额外惊喜奖励</text><br>')
--              API_ResponseWrite('<br><a>确定</a><br>')
--              API_ResponseFlush(ActorID)
--              return
--		   end
           if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
			  API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
			  API_ResponseWrite('<br><text>你正在快递，无法进入冰雪寒宫！</text><br>')
			  API_ResponseWrite('<br><a>确定</a><br>')
			  API_ResponseFlush(ActorID)
			  return
		   end
		   if API_ActorFindStatus(ActorID,519) then
			  API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
			  API_ResponseWrite('<br><text>你正在摆摊，无法进入冰雪寒宫！</text><br>')
			  API_ResponseWrite('<br><a>确定</a><br>')
			  API_ResponseFlush(ActorID)
			  return
		   end
		   if API_ActorIsDying(ActorID) then
			  API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
			  API_ResponseWrite('<br><text>你已经死亡，无法进入冰雪寒宫！</text><br>')
			  API_ResponseWrite('<br><a>确定</a><br>')
			  API_ResponseFlush(ActorID)
			  return
		   end
		   if API_VarDataGetNumber(ActorID,1,11816) > 0 then
			  API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
		      API_ResponseWrite('<br><text>你在公交车上无法进入冰雪寒宫！</text><br>')
			  API_ResponseWrite('<br><a>确定</a><br>')
			  API_ResponseFlush(ActorID)
			  return
		   end
		end

		local ObjectMapID = API_CreateEctype(Christmas_FbID,0)  ---------------创建副本
        local FastID = API_CreateMonster(ObjectMapID,Christmas_FbExit,Christmas_FbEnterPosX,Christmas_FbEnterPosY,3,0,-1)
	    API_CreateTimerTriggerG(ObjectMapID,0,1,ZongTime+30,'Christmas_ActTimeFunc') -------刷怪全局时间触发器
		API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'Christmas_PlayGotoMap') --------进入副本
	else
	   API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
	   API_ResponseWrite('<br><text color="255,0,0">你的背包最好留有5格空间，且进入副本后请保持您的背包至少有1格空位，以便获得额外惊喜奖励！</text><br>')
	   API_ResponseWrite('<br><text color="255,0,0">你可以通过此传送卷到达冰雪寒宫！</text><br>')
	   API_ResponseWrite('<br><text>你可独自一人进入冰雪寒宫，也可组成队伍进入冰雪寒宫。</text><br>')
	   API_ResponseWrite('<br><text>组队的各位成员都必须同时拥有1个冰雪寒宫传送卷才能一起进入冰雪寒宫。</text><br>')
	   API_ResponseWrite('<br><text>进入冰雪寒宫后将消耗一个冰雪寒宫传送卷。</text><br>')
	   API_ResponseWrite('<br><a href="Christmas_Click?1=1">进入冰雪寒宫</a><br>')
	   API_ResponseWrite('<br><a href="Christmas_Intro?1=2">冰雪寒宫简介</a><br>')
	   API_ResponseWrite('<br><a>关闭</a><br>')
	end
	API_ResponseFlush(ActorID)
	return 1
end

function Christmas_Intro()
    local ActorID = API_RequestGetActorID()
    API_ResponseWrite('<name>冰雪寒宫传送卷</name>')
	API_ResponseWrite('<br><text>(1)击杀寒宫里的怪物能得到</text><text color="255,0,0">冰寒晶片</text><text>。</text><br>')
	API_ResponseWrite('<br><text>(2)在副本中根据击杀的轮数和怪物数来定夺你的副本排名，将记录到周排名和总排名中。</text><br>')
	API_ResponseWrite('<br><text>(3)排名优先级根据轮数，击杀总数，击杀精英数，击杀普通怪数统计。</text><br>')
	API_ResponseWrite('<br><text>(4)获得周排名第一能拿到</text><text color="255,0,0">五彩筋斗云</text><text>。</text><br>')
    API_ResponseWrite('<br><text>(5)在寒宫内击杀怪物还能获得</text><text color="255,0,0">冰寒积分</text><text>。</text><br>')
    API_ResponseWrite('<br><text>(6)在寒宫里击杀怪物超过3轮还能得到丰厚奖励呢！</text><br>')
    API_ResponseWrite('<br><text>(7)排名和冰寒积分只在活动期间(12月16日0:00-1月3日0:00)有效。</text><br>')
	API_ResponseWrite('<br><a>关闭</a><br>')
    API_ResponseFlush(ActorID)
end


---------------玩家进入副本操作--------------


function Christmas_PlayGotoMap(ObjectMapID,ActorID)
	--判断是否有队伍，是的话一起传进去
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorIsOnline(ActorID) then
        API_SetMapVarData(ObjectMapID,PeoNum,0) --------初始化进入人数
		local MapID = API_GetActorMapID(ActorID)
		--判断组队
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			local InFactSize = 0
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID then
				   InFactSize = InFactSize + 1
				end
			end
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID then
                   if API_ActorGetGoodsNum(TeamActorID,Christmas_SendID) >= 1 and API_VarDataGetNumber(TeamActorID,1,101) <= 0 and API_VarDataGetNumber(TeamActorID,1,102) <= 0 then
                      API_ActorRemoveGoods(TeamActorID,Christmas_SendID,1,'删除冰雪寒宫传送卷') ----------先把使用传送卷的人的东西扣除了
                      API_ActorGoToMap(TeamActorID,ObjectMapID,Christmas_FbEnterPosX,Christmas_FbEnterPosY)
                      local EnterPeople = API_GetMapVarData(ObjectMapID,PeoNum)   --------------有多少人进入副本，刷多少怪
                      EnterPeople = EnterPeople + 1
                      API_SetMapVarData(ObjectMapID,PeoNum,EnterPeople)
		              API_SetMapVarData(ObjectMapID,CurSec,0)   -------------- 当前为副本开始的第几秒
	                  API_SetMapVarData(ObjectMapID,BoShu,0)   -------------- 副本当前第几波
				      local LaiYuan = API_ActorGetPropNum(TeamActorID,201)     -----开启副本进入的人个数
                      if GLOBAL_FengXiangBiao_DateList[64][2][LaiYuan] == nil then
                         GLOBAL_FengXiangBiao_DateList[64][2][LaiYuan] = 1
                      else
                         GLOBAL_FengXiangBiao_DateList[64][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[64][2][LaiYuan] + 1
                      end
                   end
				end
			end
		else
           if API_ActorGetGoodsNum(ActorID,Christmas_SendID) >= 1 and API_VarDataGetNumber(ActorID,1,101) <= 0 and API_VarDataGetNumber(ActorID,1,102) <= 0  then
		      API_ActorGoToMap(ActorID,ObjectMapID,Christmas_FbEnterPosX,Christmas_FbEnterPosY)
		      API_ActorRemoveGoods(ActorID,Christmas_SendID,1,'删除冰雪寒宫传送卷') ----------先把使用传送卷的人的东西扣除了
		      API_SetMapVarData(ObjectMapID,PeoNum,1)   --------------有多少人进入副本，刷多少怪
		      API_SetMapVarData(ObjectMapID,CurSec,0)   -------------- 当前为副本开始的第几秒
	          API_SetMapVarData(ObjectMapID,BoShu,0)   -------------- 副本当前第几波
		      local LaiYuan = API_ActorGetPropNum(ActorID,201)     -----开启副本进入的人个数
              if GLOBAL_FengXiangBiao_DateList[64][2][LaiYuan] == nil then
                 GLOBAL_FengXiangBiao_DateList[64][2][LaiYuan] = 1
              else
                 GLOBAL_FengXiangBiao_DateList[64][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[64][2][LaiYuan] + 1
              end
		   end
		end
	end
end

-------------------刷怪操作-------------------------

function Christmas_ActTimeFunc(MapID,b)      -------------------副本内的刷怪操作
      --API_Trace('MapID='..MapID )
      API_SetMapVarData(MapID,CurSec,API_GetMapVarData(MapID,CurSec)+1)
      if Christmas_PtGuaiList[MapID] == nil then              -------------
	     Christmas_PtGuaiList[MapID] = {}
      end

      if Christmas_JyGuaiList[MapID] == nil then
	     Christmas_JyGuaiList[MapID] = {}
	  end

      if Christmas_PaiMingZongGuaiList[MapID] == nil then     ----------存放动态地图击杀怪物个数
         Christmas_PaiMingZongGuaiList[MapID] = {}
      end

      if Christmas_PaiMingJyGuaiList[MapID] == nil then     ----------存放动态地图击杀精英怪个数
         Christmas_PaiMingJyGuaiList[MapID] = {}
      end

      if Christmas_PaiMingPtGuaiList[MapID] == nil then     ----------存放动态地图击杀普通怪个数
         Christmas_PaiMingPtGuaiList[MapID] = {}
      end

	  local PeopleNum = API_GetMapVarData(MapID,PeoNum) ------------------进副本的时候有多少人
	  if API_GetMapVarData(MapID,CurSec) == 10 then
	     API_ActorBroadcastMsg(MapID,1,'你获得冰魂护体祝福，你的攻防大大增强')
	  end
	  if API_GetMapVarData(MapID,CurSec) == 1 then
         local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
         local PlayListLen = table.getn(PlayList)
	     if PlayListLen ~= 0 then
            for j,v in PlayList do
				if API_ActorIsOnline(v) and API_GetActorMapID(v) == MapID then
                   API_ActorAddStatus(v,Christmas_HuTiBuffID,600000)  ---------进副本时候给一个厉害的Buff
                   API_ActorAddStatus(v,32008,11000)---回血
				   API_ActorAddStatus(v,33008,6000)---回蓝
				   if PlayListLen ~= 1 then
				      API_ActorAddStatus(v,Christmas_ZuduiBuff[PlayListLen-1].nameid,600000)  ---------进副本时候给一个组队的Buff
				   end
			    end
			end
         end
	  end
      if API_GetMapVarData(MapID,CurSec) == 5 then         ----------5秒后第一波
         API_ActorBroadcastMsg(MapID,1,'第一波冰寒屠夫开始入侵')
         API_SetMapVarData(MapID,BoShu,API_GetMapVarData(MapID,BoShu)+1)   --------第一波开始
         for i = 1,PeopleNum do
             local xiabiao = math.mod(API_GetMapVarData(MapID,BoShu),3)
			 for j = 1,PtGuaiNum do
                 local GuaiFastID = API_CreateMonster(MapID,PtGuaiID[xiabiao],Christmas_FbEnterPos[i].x,Christmas_FbEnterPos[i].y,3,0,-1)
                 Christmas_PtGuaiList[MapID][i*PtGuaiNum+j] = GuaiFastID
                 API_MonsterMoveTo(GuaiFastID,1,{MidX,MidY,0})
                 local bb = API_CreateDieTriggerG(0,0,0,GuaiFastID,'Christmas_PtDieFunc') ----------------掉落
			 end
			 for k = 1,JyGuaiNum do
                 local GuaiFastID = API_CreateMonster(MapID,JyGuaiID[xiabiao],Christmas_FbEnterPos[i].x,Christmas_FbEnterPos[i].y,3,0,-1)
                 Christmas_JyGuaiList[MapID][i*JyGuaiNum+k] = GuaiFastID
                 API_MonsterMoveTo(GuaiFastID,1,{MidX,MidY,0})
                 local bb = API_CreateDieTriggerG(0,0,0,GuaiFastID,'Christmas_JyDieFunc') ----------------掉落
			 end
         end
      end
      if API_GetMapVarData(MapID,CurSec) > 5 and API_GetMapVarData(MapID,CurSec) <= ZongTime then  -------------5秒后清完怪立即下一个波怪
         local Judge1,Judge2 = 0,0
		 for j in Christmas_PtGuaiList[MapID] do
		    local FastID = Christmas_PtGuaiList[MapID][j]
		    if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
		       Judge1 = 1
		       break
		    end
		 end
		 for j in Christmas_JyGuaiList[MapID] do
		    local FastID = Christmas_JyGuaiList[MapID][j]
		    if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
		       Judge2 = 1
		       break
		    end
		 end
		 if Judge1 == 0 and Judge2 == 0 then
			if API_GetMapVarData(MapID,BoShu) < 30 then
		       API_SetMapVarData(MapID,BoShu,API_GetMapVarData(MapID,BoShu)+1)   --------加一波
			   local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
               for i = 1,PeopleNum do
                   local xiabiao = (API_GetMapVarData(MapID,BoShu)- 1 - math.mod((API_GetMapVarData(MapID,BoShu)-1),3))/3 + 1
                   if xiabiao > 5 then
                      xiabiao = 5
                   end
			       for j = 1,PtGuaiNum do
                       local GuaiFastID = API_CreateMonster(MapID,PtGuaiID[xiabiao],Christmas_FbEnterPos[i].x,Christmas_FbEnterPos[i].y,3,0,-1)
                       Christmas_PtGuaiList[MapID][i*PtGuaiNum+j] = GuaiFastID
                       API_MonsterMoveTo(GuaiFastID,1,{MidX,MidY,0})
                       local bb = API_CreateDieTriggerG(0,0,0,GuaiFastID,'Christmas_PtDieFunc') ----------------掉落
			       end
			       for k = 1,JyGuaiNum do
                       local GuaiFastID = API_CreateMonster(MapID,JyGuaiID[xiabiao],Christmas_FbEnterPos[i].x,Christmas_FbEnterPos[i].y,3,0,-1)
                       Christmas_JyGuaiList[MapID][i*JyGuaiNum+k] = GuaiFastID
                       API_MonsterMoveTo(GuaiFastID,1,{MidX,MidY,0})
                       local bb = API_CreateDieTriggerG(0,0,0,GuaiFastID,'Christmas_JyDieFunc') ----------------掉落
			       end
               end
               local ll = (API_GetMapVarData(MapID,BoShu)- 1 - math.mod((API_GetMapVarData(MapID,BoShu)-1),3))/3 + 1
               if ll > 5 then
                  ll = 5
               end
               API_ActorBroadcastMsg(MapID,1,'第'..PublicFun_ArabianNumberToChineseNumber(API_GetMapVarData(MapID,BoShu))..'波'..API_GetMonsterNameByID(PtGuaiID[ll])..'开始入侵')
            elseif API_GetMapVarData(MapID,BoShu) >= 30 then
               API_ActorBroadcastMsg(MapID,1,'30波怪物已经进攻完毕，请等待时间结束进行圣诞积分和奖励结算！')
            end
		 end
	  end

	  if API_GetMapVarData(MapID,CurSec) == ZongTime - 30 then
	     API_ActorBroadcastMsg(MapID,1,'时间结束时所有怪物将逃跑，请抓紧时间击杀！')
	  end

	  if API_GetMapVarData(MapID,CurSec) > ZongTime and API_GetMapVarData(MapID,CurSec) <= ZongTime+19 then
	     API_ActorBroadcastMsg(MapID,1,string.format('%d秒后将进行积分奖励结算',20-API_GetMapVarData(MapID,CurSec)+ZongTime))
	  end
	  if API_GetMapVarData(MapID,CurSec) == ZongTime+1 then    ---删除怪物
	     for j,v in Christmas_PtGuaiList[MapID] do
		     if API_GetMonsterID(v) > 0 then
			    API_DestroyMonster(v)
			 end
		 end
		 for j,v in Christmas_JyGuaiList[MapID] do
			 if API_GetMonsterID(v) > 0 then
				API_DestroyMonster(v)
			 end
		 end
	  end
----------------结算来了--------------------
	  if API_GetMapVarData(MapID,CurSec) == ZongTime+20 then      -------------时间到删除怪物弹结算窗口
		 local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
		 if table.getn(PlayList) ~= 0 then
		    for j,v in PlayList do                             ----------------301秒才初始化
				local LunShu = API_GetMapVarData(MapID,BoShu)
				if Christmas_PaiMingZongGuaiList[MapID][v] == nil then
                   Christmas_PaiMingZongGuaiList[MapID][v] = 0
                end
    			if Christmas_PaiMingJyGuaiList[MapID][v] == nil then
                   Christmas_PaiMingJyGuaiList[MapID][v] = 0
    		    end
    			if Christmas_PaiMingPtGuaiList[MapID][v] == nil then
                   Christmas_PaiMingPtGuaiList[MapID][v] = 0
    			end
				local ZongShu = Christmas_PaiMingZongGuaiList[MapID][v]
				local JyShu = Christmas_PaiMingJyGuaiList[MapID][v]
				local PtShu = Christmas_PaiMingPtGuaiList[MapID][v]
		        Christmas_JieSuanFunc(v,MapID,table.getn(PlayList))-----结算函数
		        local nShiFouStart = API_DiffDatatime(Christmas_Start.Year,Christmas_Start.Month,Christmas_Start.Day,Christmas_Start.Hour,Christmas_Start.Minute,Christmas_Start.Second)
                local nShiFouEnd = API_DiffDatatime(Christmas_End.Year,Christmas_End.Month,Christmas_End.Day,Christmas_End.Hour,Christmas_End.Minute,Christmas_End.Second)
                if nShiFouStart <= 0 and nShiFouEnd > 0 then     ----------在活动期间才算排名和积分
		           --周排名
                   MLB_DaoJuShiYong(v,17,LunShu,ZongShu,JyShu,PtShu)
                   --总排名
                   MLB_DaoJuShiYong(v,18,LunShu,ZongShu,JyShu,PtShu)
                   local Level = API_GetActorExpLevel(v)
                   --(总杀怪数*100+等级*10+队伍人数*200)*轮次/(4000+轮次*100)       ------------圣诞积分
                   local FenShu = (ZongShu*100 + Level*10 + table.getn(PlayList)*200)*LunShu/(4000+LunShu*100)
                   local FenFen = math.floor(FenShu)
                   API_VarDataSetNumber(v,1,ShengDanJiFen,API_VarDataGetNumber(v,1,ShengDanJiFen)+FenFen)
--                 API_Trace(API_GetActorName(v)..API_VarDataGetNumber(v,1,ShengDanJiFen))
--                 API_Trace(API_GetActorName(v)..FenFen)
				end
--				local BoShu1 = API_GetMapVarData(MapID,BoShu)     
--                if BoShu1 >= 15 and BoShu1 < 20 then          --------  超15 
--                   if GLOBAL_FengXiangBiao_DateList[64][3][1] == nil then
--                      GLOBAL_FengXiangBiao_DateList[64][3][1] = 1
--                   else
--                      GLOBAL_FengXiangBiao_DateList[64][3][1] = GLOBAL_FengXiangBiao_DateList[64][3][1] + 1
--                   end
--                elseif BoShu1 >= 20 and BoShu1 < 25 then               --------  超20 
--	               if GLOBAL_FengXiangBiao_DateList[64][4][1] == nil then
--                      GLOBAL_FengXiangBiao_DateList[64][4][1] = 1
--                   else
--                      GLOBAL_FengXiangBiao_DateList[64][4][1] = GLOBAL_FengXiangBiao_DateList[64][4][1] + 1
--                   end
--                elseif BoShu1 >= 25 and BoShu1 < 30 then                 --------  超25 
--	               if GLOBAL_FengXiangBiao_DateList[64][5][1] == nil then
--                      GLOBAL_FengXiangBiao_DateList[64][5][1] = 1
--                   else
--                      GLOBAL_FengXiangBiao_DateList[64][5][1] = GLOBAL_FengXiangBiao_DateList[64][5][1] + 1
--                   end
--                elseif BoShu1 >= 30 then                                --------  超30 
--	               if GLOBAL_FengXiangBiao_DateList[64][6][1] == nil then
--                      GLOBAL_FengXiangBiao_DateList[64][6][1] = 1
--                   else
--                      GLOBAL_FengXiangBiao_DateList[64][6][1] = GLOBAL_FengXiangBiao_DateList[64][6][1] + 1
--                   end
--                end
		    end
		 end
	  end
	  local shengyu = ZongTime - API_GetMapVarData(MapID,CurSec)       ------------右上角的提示
	  local info1 = '现在是第'..API_GetMapVarData(MapID,BoShu)..'波\n'
	  local info2 = ''
	  local info3 = ''
	  local info4 = ''
	  if shengyu > 0 then
	     info2 = '时间还剩余'..shengyu..'秒\n'
	  else
	     info2 = '时间已到\n'
	  end
	  info3 = info3..string.format("%-11s",'玩家')..'杀怪总数\n'
	  local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
	  local MM = {}
	  if table.getn(PlayList) ~= 0 then
	     for j,v in PlayList do
	        MM[j] = {name = '无玩家',num = 0}
	     end
         for j,v in PlayList do
             local ActorName = API_GetActorName(v)
             if Christmas_PaiMingZongGuaiList[MapID][v] == nil then
	            Christmas_PaiMingZongGuaiList[MapID][v] = 0
             end
		     MM[j].num = Christmas_PaiMingZongGuaiList[MapID][v]
		     MM[j].name = ActorName
         end
         table.sort(MM, function(a,b) return a.num>b.num end)
         for i = 1,table.getn(MM) do
             info4 = info4..string.format("%-11s",MM[i].name)..MM[i].num..'\n'
         end
	     local infoshuchu = info1..info2..info3..info4
	     API_ActorBroadcastMsg(MapID,4,infoshuchu)
	  end
	  if API_GetMapVarData(MapID,CurSec) >= ZongTime+1 then
	     API_ActorBroadcastMsg(MapID,4,'')
	  end
end

-----------------结算------------------
function Christmas_JieSuanFunc(ActorID,MapID,Size)
    local BoShu2 = API_GetMapVarData(MapID,BoShu)
	local ZongGuai = 30*BoShu2*Size
	local ZongJyGuai = 2*BoShu2*Size
	local ZongPtGuai = 28*BoShu2*Size
	local ShaZong,ShaJy,ShaPt = 0,0,0
	local LShaZong,LShaJy,LShaPt = 0,0,0
	if Christmas_PaiMingZongGuaiList[MapID][ActorID] ~= nil then   ----------------保证是数字初始化
	   ShaZong = Christmas_PaiMingZongGuaiList[MapID][ActorID] ------个人杀怪总量
	end
	if Christmas_PaiMingJyGuaiList[MapID][ActorID] ~= nil then
       ShaJy = Christmas_PaiMingJyGuaiList[MapID][ActorID] ------个人杀精英总量
	end
	if Christmas_PaiMingPtGuaiList[MapID][ActorID] ~= nil then
	   ShaPt = Christmas_PaiMingPtGuaiList[MapID][ActorID] ------个人杀普通怪总量
	end
	
	if API_VarDataGetNumber_Ex(1,0,ShengDan_FuBenShuaID,1,1) == 0 then  ---------初始化为一年中第几天
       API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_FuBenShuaID,1,1,os.date('*t').yday)
    end
	local Yday = API_VarDataGetNumber_Ex(1,0,ShengDan_FuBenShuaID,1,1)
	if Yday ~= os.date('*t').yday then                   ------------------如果这一天已经过
       API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_FuBenShuaID,1,1,os.date('*t').yday) -------置为今天
       API_VarDataSetNumber_Ex_Sync(1,0,ShengDanShiZhuangOneID,1,1,0)       
       API_VarDataSetNumber_Ex_Sync(1,0,ShengDanShiZhuangTwoID,1,1,0)   
       API_VarDataSetNumber_Ex_Sync(1,0,ShengDanShiZhuangThreeID,1,1,0)
	   API_VarDataSetNumber_Ex_Sync(1,0,ShengDanShiZhuangFourID,1,1,0)       
       API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_HuanCaiZhiYuID,1,1,0)        -------全部日产更新
       API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_AnYiMoTanID,1,1,0)
	   API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_FeiTingLuKeID,1,1,0)       
       API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_KunChongBaoMuCheID,1,1,0)   
       API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_SiDangLiuPinZhiID,1,1,0) 
	   API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_SiDangShengDangMoJingID,1,1,0)   
    end
	
	local Award = ''
    Award = Award..'<award success="1" money="0" Exp="0" Crystal="0">'
    Award = Award..'<bijou></bijou>'
	local DecRate = (API_GetMapVarData(MapID,BoShu) - math.mod(API_GetMapVarData(MapID,BoShu),10))/10

	local GoodsID = ''
	local GoodsNum = 0
	local PinZhi = 0
	local GoodTable = table_BinXueHanGong_Goods

	local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
	local Level = API_GetActorExpLevel(ActorID) --玩家等级
	local Lv = API_GetActorPeerageLevel(ActorID) ---玩家等级段 
    local i = 0
    local n = math.random(10000)
    if n <= 100 + DecRate*100 then  -----特殊奖励 
       i = 4
    elseif n > 100 + DecRate*100 and n <= 6000 then  -----经验奖励
       i = 1
    elseif n > 6000 and n <= 9000 then   ----2品质 
       i = 3
    else     ----7品质
       i = 2
    end 
	--  测试相关
    --  如果需要掉落第一阶段概率的物品，特殊奖励还是经验奖励还是什么等等 
	--在这里的中间位置加上 i = A，A为何物，请看上面注释
    if API_GetMapVarData(MapID,BoShu) > 3 then
       if i == 1 then
          local Len = math.random(table.getn(GoodTable[i]))
          GoodsID = GoodTable[i][Len].GoodsID
          GoodsNum = table_JinYanQuan_GoodsNum[Level]
          PinZhi = GoodTable[i][Len].PinZhi
       elseif i == 2 then
	      if Lv <= 3 then
		     local j = math.random(table.getn(GoodTable[i][1]))
		     GoodsID = GoodTable[i][1][j].GoodsID
		     GoodsNum = GoodTable[i][1][j].Num
		     PinZhi = GoodTable[i][1][j].PinZhi
	      elseif Lv <= 5 then
		     local j = math.random(table.getn(GoodTable[i][2]))
		     GoodsID = GoodTable[i][2][j].GoodsID
		     GoodsNum = GoodTable[i][2][j].Num
		     PinZhi = GoodTable[i][2][j].PinZhi
          else
		     local j = math.random(table.getn(GoodTable[i][3]))
		     GoodsID = GoodTable[i][3][j].GoodsID
		     GoodsNum = GoodTable[i][3][j].Num
		     PinZhi = GoodTable[i][3][j].PinZhi
	      end
	   elseif i == 3 then
	      if Lv <= 3 then
		     local j = math.random(table.getn(GoodTable[i][1]))
		     GoodsID = GoodTable[i][1][j].GoodsID
		     GoodsNum = GoodTable[i][1][j].Num
		     PinZhi = GoodTable[i][1][j].PinZhi
	      elseif Lv <= 5 then
		     local j = math.random(table.getn(GoodTable[i][2]))
		     GoodsID = GoodTable[i][2][j].GoodsID
		     GoodsNum = GoodTable[i][2][j].Num
		     PinZhi = GoodTable[i][2][j].PinZhi
          else
		     local j = math.random(table.getn(GoodTable[i][3]))
		     GoodsID = GoodTable[i][3][j].GoodsID
		     GoodsNum = GoodTable[i][3][j].Num
		     PinZhi = GoodTable[i][3][j].PinZhi
	      end
	   elseif i == 4 then   
            local Len = math.random(table.getn(GoodTable[i]))
            GoodsID = GoodTable[i][Len].GoodsID
            GoodsNum = GoodTable[i][Len].Num
            PinZhi = GoodTable[i][Len].PinZhi   
            --  测试相关
		    --  如果需要测试某物品日产，请自己在local Len = math.random(table.getn(GoodTable[i]))下加一行代码
		    --加上 Len = A，A为何物，请看下面注释
		    -- A = 2,3,4,5,分别为四件圣诞时装 
		    -- A = 8,9,10,11,分别为四件卡片
		    -- A = 12,四档升档魔晶
	  
            if GoodsID == '四档六品' then     --A = 1
		       local ll = math.random(table.getn(table_BinXueHanGong_SiDangLiuPinGoods))
		       GoodsID = table_BinXueHanGong_SiDangLiuPinGoods[ll].GoodsID
               GoodsNum = table_BinXueHanGong_SiDangLiuPinGoods[ll].Num
               PinZhi = table_BinXueHanGong_SiDangLiuPinGoods[ll].PinZhi
               API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_SiDangLiuPinZhiID,1,1,API_VarDataGetNumber_Ex(1,0,ShengDan_SiDangLiuPinZhiID,1,1)+1)
               if API_VarDataGetNumber_Ex(1,0,ShengDan_SiDangLiuPinZhiID,1,1) > 1 then
                  GoodsID = 82019
                  GoodsNum = 50
                  PinZhi = 0
               else
                  API_ActorBDCMsg(-1,0,-1,1,65,0,17, '恭喜【'..API_GetActorName(ActorID)..'】在冰雪寒宫中获得'..GoodsNum..'个高附加属性三洞的'..API_GetGoodsName(GoodsID)..'！')
               end 
		    elseif GoodsID == 11322 then    --A = 2
		       API_VarDataSetNumber_Ex_Sync(1,0,ShengDanShiZhuangOneID,1,1,API_VarDataGetNumber_Ex(1,0,ShengDanShiZhuangOneID,1,1)+1)
		       if API_VarDataGetNumber_Ex(1,0,ShengDanShiZhuangOneID,1,1) > 5 then
		          GoodsID = 82019
                  GoodsNum = 50
                  PinZhi = 0
               else
                  API_ActorBDCMsg(-1,0,-1,1,65,0,17, '恭喜【'..API_GetActorName(ActorID)..'】在冰雪寒宫中获得'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'！')   
		       end
		    elseif GoodsID == 11323 then    --A = 3
		       API_VarDataSetNumber_Ex_Sync(1,0,ShengDanShiZhuangTwoID,1,1,API_VarDataGetNumber_Ex(1,0,ShengDanShiZhuangTwoID,1,1)+1)
		       if API_VarDataGetNumber_Ex(1,0,ShengDanShiZhuangTwoID,1,1) > 5 then
		          GoodsID = 82019
                  GoodsNum = 50
                  PinZhi = 0
               else
                  API_ActorBDCMsg(-1,0,-1,1,65,0,17, '恭喜【'..API_GetActorName(ActorID)..'】在冰雪寒宫中获得'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'！')   
		       end
		    elseif GoodsID == 11324 then   --A = 4
		       API_VarDataSetNumber_Ex_Sync(1,0,ShengDanShiZhuangThreeID,1,1,API_VarDataGetNumber_Ex(1,0,ShengDanShiZhuangThreeID,1,1)+1)
		       if API_VarDataGetNumber_Ex(1,0,ShengDanShiZhuangThreeID,1,1) > 5 then
		          GoodsID = 82019
                  GoodsNum = 50
                  PinZhi = 0
               else
                  API_ActorBDCMsg(-1,0,-1,1,65,0,17, '恭喜【'..API_GetActorName(ActorID)..'】在冰雪寒宫中获得'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'！')   
		       end
		    elseif GoodsID == 11325 then   --A = 5
		       API_VarDataSetNumber_Ex_Sync(1,0,ShengDanShiZhuangFourID,1,1,API_VarDataGetNumber_Ex(1,0,ShengDanShiZhuangFourID,1,1)+1)
		       if API_VarDataGetNumber_Ex(1,0,ShengDanShiZhuangFourID,1,1) > 5 then
		          GoodsID = 82019
                  GoodsNum = 50
                  PinZhi = 0
               else
                  API_ActorBDCMsg(-1,0,-1,1,65,0,17, '恭喜【'..API_GetActorName(ActorID)..'】在冰雪寒宫中获得'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'！')   
		       end
		    elseif GoodsID == 32020 then   --A = 8
		       API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_HuanCaiZhiYuID,1,1,API_VarDataGetNumber_Ex(1,0,ShengDan_HuanCaiZhiYuID,1,1)+1)
		       if API_VarDataGetNumber_Ex(1,0,ShengDan_HuanCaiZhiYuID,1,1) > 1 then
		          GoodsID = 82019
                  GoodsNum = 50
                  PinZhi = 0
               else
                  API_ActorBDCMsg(-1,0,-1,1,65,0,17, '恭喜【'..API_GetActorName(ActorID)..'】在冰雪寒宫中获得'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'！')   
		       end		 
		    elseif GoodsID == 32014 then   --A = 8
		       API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_AnYiMoTanID,1,1,API_VarDataGetNumber_Ex(1,0,ShengDan_AnYiMoTanID,1,1)+1)
		       if API_VarDataGetNumber_Ex(1,0,ShengDan_AnYiMoTanID,1,1) > 1 then
		          GoodsID = 82019
                  GoodsNum = 50
                  PinZhi = 0
               else
                  API_ActorBDCMsg(-1,0,-1,1,65,0,17, '恭喜【'..API_GetActorName(ActorID)..'】在冰雪寒宫中获得'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'！')   
		       end
		    elseif GoodsID == 39701 then    --A = 10 
		       API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_FeiTingLuKeID,1,1,API_VarDataGetNumber_Ex(1,0,ShengDan_FeiTingLuKeID,1,1)+1)
		       if API_VarDataGetNumber_Ex(1,0,ShengDan_FeiTingLuKeID,1,1) > 1 then
		          GoodsID = 82019
                  GoodsNum = 50
                  PinZhi = 0
               else
                  API_ActorBDCMsg(-1,0,-1,1,65,0,17, '恭喜【'..API_GetActorName(ActorID)..'】在冰雪寒宫中获得'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'！')   
		       end		 
		    elseif GoodsID == 39705 then    --A = 11 
		       API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_KunChongBaoMuCheID,1,1,API_VarDataGetNumber_Ex(1,0,ShengDan_KunChongBaoMuCheID,1,1)+1)  
		       if API_VarDataGetNumber_Ex(1,0,ShengDan_KunChongBaoMuCheID,1,1) > 1 then
		          GoodsID = 82019
                  GoodsNum = 50
                  PinZhi = 0
               else
                  API_ActorBDCMsg(-1,0,-1,1,65,0,17, '恭喜【'..API_GetActorName(ActorID)..'】在冰雪寒宫中获得'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'！')   
		       end		 		 
		    elseif GoodsID == 80952 then    --A = 12
		       API_VarDataSetNumber_Ex_Sync(1,0,ShengDan_SiDangShengDangMoJingID,1,1,API_VarDataGetNumber_Ex(1,0,ShengDan_SiDangShengDangMoJingID,1,1)+1)  
		       if API_VarDataGetNumber_Ex(1,0,ShengDan_SiDangShengDangMoJingID,1,1) > 10 then
		          GoodsID = 82019
                  GoodsNum = 50
                  PinZhi = 0
               else
                  API_ActorBDCMsg(-1,0,-1,1,65,0,17, '恭喜【'..API_GetActorName(ActorID)..'】在冰雪寒宫中获得'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'！')   
		       end
		    end 
	   end
	end     
	if API_GetMapVarData(MapID,BoShu) > 3 and API_ActorGetPackageSize(ActorID) >= 1 then
       Award = Award..'<goods>'..GoodsID..','..GoodsNum..'</goods>'
	   Award = Award..'</award>'
	else
	   Award = Award..'<goods></goods>'
	   Award = Award..'</award>'
	end

	--(总杀怪数*100+等级*10+队伍人数*200)*轮次/(4000+轮次*100)       ------------圣诞积分
	local JiFen = math.floor((ShaZong*100+Level*10+Size*200)*BoShu2/(4000+BoShu2*100))
    local ActorGrade = '<Hero bosskill="0" boosnum="0">'
    ActorGrade = ActorGrade..'<lt>杀敌波数,'..BoShu2..','..BoShu2..','..BoShu2..'</lt>'
	ActorGrade = ActorGrade..'<lt>杀敌总数,'..ShaZong..','..ShaZong..','..ZongGuai..'</lt>'
	ActorGrade = ActorGrade..'<lt>杀死精英,'..ShaJy..','..ShaJy..','..ZongJyGuai..'</lt>'
	ActorGrade = ActorGrade..'<lt>杀死普通,'..ShaPt..','..ShaPt..','..ZongPtGuai..'</lt>'
	ActorGrade = ActorGrade..'<lt>冰寒积分,'..JiFen..','..JiFen..','..JiFen..'</lt>'
	ActorGrade = ActorGrade..'</Hero>'
    local Grade = ''
    local TeamGrade = '<team name="玩家名称,杀敌总数,杀死精英,杀死普通,冰寒积分">'
    local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
    for j,v in PlayList do
        if API_ActorIsOnline(v) then
           if Christmas_PaiMingZongGuaiList[MapID][v] ~= nil then           ----------------保证是数字初始化
	          LShaZong = Christmas_PaiMingZongGuaiList[MapID][v] ------个人杀怪总量
	       end
	       if Christmas_PaiMingJyGuaiList[MapID][v] ~= nil then
              LShaJy = Christmas_PaiMingJyGuaiList[MapID][v] ------个人杀精英总量
	       end
	       if Christmas_PaiMingPtGuaiList[MapID][v] ~= nil then
	          LShaPt = Christmas_PaiMingPtGuaiList[MapID][v] ------个人杀普通怪总量
	       end
	       --(总杀怪数*100+等级*10+队伍人数*200)*轮次/(4000+轮次*100)       ------------圣诞积分
	       local JiFen1 = math.floor((LShaZong*100+API_GetActorExpLevel(v)*10+Size*200)*BoShu2/(4000+BoShu2*100))
--	       API_Trace(LShaZong)
--	       API_Trace(LShaJy)
--	       API_Trace(LShaPt)
           Grade = Grade..'<lt>'..API_GetActorName(v)..','..LShaZong..','..LShaJy..','..LShaPt..','..JiFen1..'</lt>'
        end
	end
    TeamGrade = TeamGrade..Grade..'</team>'
	local Other = '<Other><Description></Description></Other>'
	API_ActorBalanceUpdate(ActorID,1,0,ActorGrade)
	API_ActorBalanceUpdate(ActorID,2,0,TeamGrade)
	API_ActorBalanceUpdate(ActorID,3,0,Award)
	API_ActorBalanceUpdate(ActorID,6,0,Other)
	API_ActorBalanceUpdate(ActorID,4,0,'')
	
    if API_GetMapVarData(MapID,BoShu) > 3 then
	   if API_ActorCanAddGoods(ActorID,GoodsID,1,0,0) ~= -1 then
          API_AddActorGoodsFlagEx(ActorID,GoodsID,GoodsNum,PinZhi,0,'冰雪寒宫副本奖励',0)
          API_ActorSendMsg(ActorID,0,'你获得 '..GoodsNum..' 个'..API_GetGoodsName(GoodsID)..'')
          API_ActorSendMsg(ActorID,7,'你获得 '..GoodsNum..' 个'..API_GetGoodsName(GoodsID)..'')
--       else
--          API_SendActorMailByName(API_GetActorName(ActorID),GoodsID,GoodsNum,0,'冰雪寒宫副本奖励','冰雪寒宫战绩：获得'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'')
--          API_ActorSendMsg(ActorID,0,'你获得 '..GoodsNum..' 个'..API_GetGoodsName(GoodsID)..'（请到邮箱领取）')
--          API_ActorSendMsg(ActorID,7,'你获得 '..GoodsNum..' 个'..API_GetGoodsName(GoodsID)..'（请到邮箱领取）')
       end
    end
end


---------------------掉落-----------------------

function Christmas_PtDieFunc(MapID,ActorID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
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

    -----------存表----------------
    if Christmas_PaiMingZongGuaiList[DynamicMapID][KillerID] == nil then   ----------------死怪物初始化
       Christmas_PaiMingZongGuaiList[DynamicMapID][KillerID] = 0
    end
    if Christmas_PaiMingPtGuaiList[DynamicMapID][KillerID] == nil then
	   Christmas_PaiMingPtGuaiList[DynamicMapID][KillerID] = 0
    end
    Christmas_PaiMingZongGuaiList[DynamicMapID][KillerID] = Christmas_PaiMingZongGuaiList[DynamicMapID][KillerID] + 1 ----怪的总数
    Christmas_PaiMingPtGuaiList[DynamicMapID][KillerID] = Christmas_PaiMingPtGuaiList[DynamicMapID][KillerID] + 1 ----普通怪

    -----------普通怪掉落----------------
    local GoodTable = Christmas_PtDrop
    local j = 0
    local j = (API_GetMapVarData(DynamicMapID,BoShu)- 1 - math.mod((API_GetMapVarData(DynamicMapID,BoShu)-1),3))/3 + 1
    if j > 5 then
       j = 5
    elseif j == 0 then
       j = 1
    end
    local GaiLv1 = GoodTable[j].GaiLv
	local GaiLv = math.random(1000000)
    if GaiLv <= GaiLv1 and API_GetMonsterNameByID(MonsterID) == GoodTable[j].Name then
	   local GoodsID = GoodTable[j].GoodsID
	   local Num  = GoodTable[j].GoodsNum
	   local PinZhi  = GoodTable[j].PinZhi
	   if PinZhi > 0 then
          API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,Num,0,'圣诞节副本怪物掉落',GuiShuType,WhatID,600,120,PinZhi)
	   else
          API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsID,Num,0,'圣诞节副本怪物掉落',GuiShuType,WhatID,600,120)
	   end
	   if GoodsID == 82019 then ----冰寒晶片
          if GLOBAL_FengXiangBiao_DateList[64][1][1] == nil then
             GLOBAL_FengXiangBiao_DateList[64][1][1] = 1
          else
             GLOBAL_FengXiangBiao_DateList[64][1][1] = GLOBAL_FengXiangBiao_DateList[64][1][1] + 1
          end
       end
	end
	--冰寒晶片补偿掉落

		if math.mod(Christmas_PaiMingZongGuaiList[DynamicMapID][KillerID],90) == 0 then
			API_CreateDropGoods(DynamicMapID,PosX,PosY,82019,1,0,'圣诞节副本怪物掉落',GuiShuType,WhatID,600,120)
		end

end

function Christmas_JyDieFunc(MapID,ActorID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
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

-----------存表----------------
    if Christmas_PaiMingZongGuaiList[DynamicMapID][KillerID] == nil then    ----------------死怪物初始化
       Christmas_PaiMingZongGuaiList[DynamicMapID][KillerID] = 0
    end
    if Christmas_PaiMingJyGuaiList[DynamicMapID][KillerID] == nil then
	   Christmas_PaiMingJyGuaiList[DynamicMapID][KillerID] = 0
    end
    Christmas_PaiMingZongGuaiList[DynamicMapID][KillerID] = Christmas_PaiMingZongGuaiList[DynamicMapID][KillerID] + 1 ----怪的总数
    Christmas_PaiMingJyGuaiList[DynamicMapID][KillerID] = Christmas_PaiMingJyGuaiList[DynamicMapID][KillerID] + 1 ----精英怪

    -------------给予Buff----------
	local xiabiao = 0
	for i = 1,table.getn(Christmas_JyBuff) do
		if Christmas_PaiMingJyGuaiList[DynamicMapID][KillerID] >= Christmas_JyBuff[i].num then
		   xiabiao = i
		   break
		end
	end
	if xiabiao ~= 0 then
       API_ActorAddStatus(KillerID,Christmas_JyBuff[xiabiao].nameid,600000)
	end

-----------精英怪掉落----------------
    local i = 0
    local i = (API_GetMapVarData(DynamicMapID,BoShu)- 1 - math.mod((API_GetMapVarData(DynamicMapID,BoShu)-1),3))/3 + 1
    if i > 5 then
       i = 5
    elseif i == 0 then
       i = 1
    end
    local GoodTable = Christmas_JyDrop[i]
    for j in GoodTable do
		local GaiLv1 = GoodTable[j].GaiLv
		local GaiLv = math.random(1000000)
		if GaiLv <= GaiLv1 and API_GetMonsterNameByID(MonsterID) == GoodTable[j].Name then
		   local GoodsID = GoodTable[j].GoodsID
		   local Num  = GoodTable[j].GoodsNum
		   local PinZhi  = GoodTable[j].PinZhi
           if PinZhi > 0 then
              API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,Num,0,'圣诞节副本怪物掉落',GuiShuType,WhatID,600,120,PinZhi)
		   else
              API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsID,Num,0,'圣诞节副本怪物掉落',GuiShuType,WhatID,600,120)
		   end
		   if GoodsID == 82019 then ----冰寒晶片
              if GLOBAL_FengXiangBiao_DateList[64][1][1] == nil then
                 GLOBAL_FengXiangBiao_DateList[64][1][1] = 1
              else
                 GLOBAL_FengXiangBiao_DateList[64][1][1] = GLOBAL_FengXiangBiao_DateList[64][1][1] + 1
              end
           end
		end
	end
	--冰寒晶片补偿掉落

		if math.mod(Christmas_PaiMingZongGuaiList[DynamicMapID][KillerID],90) == 0 then
			API_CreateDropGoods(DynamicMapID,PosX,PosY,82019,1,0,'圣诞节副本怪物掉落',GuiShuType,WhatID,600,120)
		end

end


----------上线如果在副本内返还Buff给他------------------

--function Christmas_Login(ActorID)
--	local ActorID = ActorID or API_RequestGetActorID()
--	local ServerID = API_GetServerID()
--	local PlayMapID = API_GetActorMapID(ActorID) -----玩家当前地图ID
--	local RightMapID = API_GetMapConfigID(PlayMapID)
--	if RightMapID ~= 2032 then return end
----	local xiabiao = 0
----	for i = 1,table.getn(Christmas_JyBuff) do
----		if API_VarDataGetNumber(ActorID,1,JyGuaiShuLiang) >= Christmas_JyBuff[i].num then
----		   xiabiao = i
----		   break
----		end
----	end
----	if xiabiao ~= 0 then
----       API_ActorAddStatus(ActorID,Christmas_JyBuff[xiabiao].nameid,600000)  -----击杀精英怪的Buff
----	end
--	API_ActorAddStatus(ActorID,Christmas_HuTiBuffID,600000) ------------护体Buff
--	local TeamID = API_GetTeamID(ActorID)
--	local InFactSize = 0
--	if TeamID > 0 then
--	   local TeamSize = API_GetTeamSize(TeamID)    ----------------------队伍人数
--	   for i = 1,TeamSize do
--	       local TeamActorID = API_GetTeamMem(TeamID,i)
--	       if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == PlayMapID then
--	          InFactSize = InFactSize + 1
--	       end
--	   end
--	end
--	if InFactSize ~= 1 and InFactSize ~= 0 then
--	   API_ActorAddStatus(ActorID,Christmas_ZuduiBuff[InFactSize-1].nameid,600000)  ---------进副本时候给一个组队的Buff
--	end
--end

----上线判断
--local OnLoginLoadOK = 0
--for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do
--	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'Christmas_Login' then
--		OnLoginLoadOK = 1
--		break
--	end
--end
--if OnLoginLoadOK == 0 then
--	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'Christmas_Login')
--end
----切换地图后判断
--local OnLoginMapLoadOK = 0
--for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do
--	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'Christmas_Login' then
--		OnLoginMapLoadOK = 1
--		break
--	end
--end
--if OnLoginMapLoadOK == 0 then
--	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'Christmas_Login')
--end





