-------------------------------
--文件名:	Scp\Lua\Act\WanShengJie2010.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:   梁宇宁
--日  期:	2010-10-9
--版  本:
--描  述:   万圣节活动
--应  用:
-------------------------------




-----------------怪物ID-------------------
------------------------------------------

--WanShengJie_YeiWaiGuaiID1 = 730023 ---南瓜
WanShengJie_FenMu = {730301,730302,730303,730304} ------坟墓
WanShengJie_YeiWaiGuaiID2 = 730024 ---骨碌
WanShengJie_YeiWaiGuaiID3 = 730025 ---杰森

WanShengJie_YeiWaiFbEnter = 12338 ---突击骷髅怪入口   .

WanShengJie_FbExit = 11607 ---副本出口


WanShengJie_FbGuaiID = 730110     ---------10级突击骷髅怪ID，中间级数怪物ID递增1，65级ID为730165



WanShengJie_FbBossID = 730210     ------------10级伯爵ID，中间级数怪物ID递增1，65级ID为730265


-----------------坐标-------------------------
----------------------------------------------
WanShengJie_FbGuaiPos = {     ------------突击骷髅坐标
    [1] = {x = 236,y = 160},
    [2] = {x = 241,y = 163},
    [3] = {x = 245,y = 163},
    [4] = {x = 246,y = 159},
    [5] = {x = 242,y = 159},----第一
    [6] = {x = 233,y = 189},
    [7] = {x = 239,y = 188},
    [8] = {x = 243,y = 184},
    [9] = {x = 245,y = 188},
    [10] = {x = 238,y = 191},----第二
    [11] = {x = 211,y = 209},
    [12] = {x = 217,y = 212},
    [13] = {x = 215,y = 217},
    [14] = {x = 219,y = 220},
    [15] = {x = 213,y = 223},----第三
    [16] = {x = 155,y = 217},
    [17] = {x = 157,y = 211},
    [18] = {x = 164,y = 208},
    [19] = {x = 165,y = 214},
    [20] = {x = 162,y = 219},----第四
    [21] = {x = 133,y = 187},
    [22] = {x = 133,y = 194},
    [23] = {x = 126,y = 192},
    [24] = {x = 123,y = 189},
    [25] = {x = 128,y = 187},----第五
    [26] = {x = 151,y = 157},
    [27] = {x = 154,y = 163},
    [28] = {x = 159,y = 156},
    [29] = {x = 160,y = 164},
    [30] = {x = 164,y = 155},

}

WanShengJie_FbEnterPos = {     ------------副本NPC出口坐标
    [1] = {x = 245,y = 145},
    [2] = {x = 183,y = 123},

}

WanShengJie_FbBossPosX = 190  -------伯爵坐标
WanShengJie_FbBossPosY = 161

WanShengJie_EnterMapPosX = 254  -------玩家进入副本坐标
WanShengJie_EnterMapPosY = 145


-----------------物品配置ID-------------------
----------------------------------------------
WanShengJie_CandyID = 828  ------------糖果ID

WanShengJie_YeWaiGoodsID = {            --------------------野外怪物掉落
    [1] = {
	        [1] = {GoodsID=88979,GoodsNum=1,GaiLv=500,PinZhi=0},
	        [2] = {GoodsID=88980,GoodsNum=1,GaiLv=2000,PinZhi=0},
	        [3] = {GoodsID=828,GoodsNum=1,GaiLv=1500,PinZhi=0},
			[4] = {GoodsID=80498,GoodsNum=5,GaiLv=3000,PinZhi=0},
			[5] = {GoodsID=80498,GoodsNum=5,GaiLv=3000,PinZhi=0},
			[6] = {GoodsID=80696,GoodsNum=5,GaiLv=3000,PinZhi=0},
			[7] = {GoodsID=80696,GoodsNum=5,GaiLv=3000,PinZhi=0},
		  },

    [2] = {
	        [1] = {GoodsID=88979,GoodsNum=1,GaiLv=500,PinZhi=0},
	        [2] = {GoodsID=88980,GoodsNum=1,GaiLv=2000,PinZhi=0},
	        [3] = {GoodsID=828,GoodsNum=1,GaiLv=1500,PinZhi=0},
			[4] = {GoodsID=80498,GoodsNum=5,GaiLv=3000,PinZhi=0},
			[5] = {GoodsID=80498,GoodsNum=5,GaiLv=3000,PinZhi=0},
			[6] = {GoodsID=80696,GoodsNum=5,GaiLv=3000,PinZhi=0},
			[7] = {GoodsID=80696,GoodsNum=5,GaiLv=3000,PinZhi=0},
		  }

}

WanShengJie_FenMuGoodsID = {            --------------------坟墓怪物掉落
	[1] = {GoodsID=88979,GoodsNum=1,GaiLv=500,PinZhi=0},
	[2] = {GoodsID=88980,GoodsNum=1,GaiLv=2000,PinZhi=0},
	[3] = {GoodsID=828,GoodsNum=1,GaiLv=1500,PinZhi=0},
	[4] = {GoodsID=80498,GoodsNum=10,GaiLv=5000,PinZhi=0},
	[5] = {GoodsID=80498,GoodsNum=10,GaiLv=5000,PinZhi=0},
	[6] = {GoodsID=80696,GoodsNum=10,GaiLv=5000,PinZhi=0},
	[7] = {GoodsID=80696,GoodsNum=10,GaiLv=5000,PinZhi=0},
}



WanShengJie_FbGoodsID = {
  [1] = {
         {GoodsID=82018,GoodsNum=1,GaiLv=300000,PinZhi=0},
         {GoodsID=82018,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=300000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=300000,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=300000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=100000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=0,PinZhi=0},


		},
  [2] = {
         {GoodsID=82018,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=82018,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=100000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=200000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=100000,PinZhi=0},


        },

  [3] = {
         {GoodsID=82018,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=82018,GoodsNum=1,GaiLv=100000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=400000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=200000,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=200000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=300000,PinZhi=0},


        }
}

WanShengJie_BossGoodsID = {
    [1] = {
           {GoodsID=82018,GoodsNum=1,GaiLv=300000,PinZhi=0},
           {GoodsID=82018,GoodsNum=1,GaiLv=200000,PinZhi=0},
           {GoodsID=82018,GoodsNum=1,GaiLv=100000,PinZhi=0},
           {GoodsID=82018,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID=82018,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID=88979,GoodsNum=1,GaiLv=300000,PinZhi=0},
           {GoodsID=88979,GoodsNum=1,GaiLv=200000,PinZhi=0},
           {GoodsID=88979,GoodsNum=1,GaiLv=100000,PinZhi=0},
           {GoodsID=88979,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID=88979,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID=88980,GoodsNum=1,GaiLv=200000,PinZhi=0},
           {GoodsID=88980,GoodsNum=1,GaiLv=100000,PinZhi=0},
           {GoodsID=88980,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID=88980,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=300000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=300000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=300000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=300000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=300000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=200000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=200000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=200000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=200000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=200000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=100000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=100000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=100000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=100000,PinZhi=0},
           {GoodsID=80498,GoodsNum=20,GaiLv=100000,PinZhi=0},
           {GoodsID=80696,GoodsNum=10,GaiLv=300000,PinZhi=0},
           {GoodsID=80696,GoodsNum=10,GaiLv=300000,PinZhi=0},
           {GoodsID=80696,GoodsNum=10,GaiLv=300000,PinZhi=0},
           {GoodsID=80696,GoodsNum=10,GaiLv=100000,PinZhi=0},
           {GoodsID=80696,GoodsNum=10,GaiLv=100000,PinZhi=0},
           {GoodsID=80696,GoodsNum=10,GaiLv=100000,PinZhi=0},
           {GoodsID=80696,GoodsNum=10,GaiLv=0,PinZhi=0},
           {GoodsID=80696,GoodsNum=10,GaiLv=0,PinZhi=0},
           {GoodsID=80696,GoodsNum=10,GaiLv=0,PinZhi=0},
           {GoodsID=828,GoodsNum=1,GaiLv=1000000,PinZhi=0},
           {GoodsID=828,GoodsNum=1,GaiLv=300000,PinZhi=0},
           {GoodsID=828,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID=828,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID='时装1',GoodsNum=1,GaiLv=10000,PinZhi=0}, ----------面具
           {GoodsID='时装2',GoodsNum=1,GaiLv=0,PinZhi=0}, ----------老时装


		},
  [2] = {
         {GoodsID=82018,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=82018,GoodsNum=1,GaiLv=400000,PinZhi=0},
         {GoodsID=82018,GoodsNum=1,GaiLv=200000,PinZhi=0},
         {GoodsID=82018,GoodsNum=1,GaiLv=100000,PinZhi=0},
         {GoodsID=82018,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=400000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=200000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=100000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=400000,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=200000,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=100000,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=600000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=600000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=600000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=600000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=600000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=400000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=400000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=400000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=400000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=400000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=300000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=300000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=300000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=300000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=300000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=600000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=600000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=600000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=300000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=300000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=300000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=100000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=100000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=100000,PinZhi=0},
         {GoodsID=828,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=828,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=828,GoodsNum=1,GaiLv=300000,PinZhi=0},
         {GoodsID=828,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID='时装1',GoodsNum=1,GaiLv=20000,PinZhi=0}, ----------面具
         {GoodsID='时装2',GoodsNum=1,GaiLv=20000,PinZhi=0}, ----------老时装
        },

  [3] = {
         {GoodsID=82018,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=82018,GoodsNum=1,GaiLv=800000,PinZhi=0},
         {GoodsID=82018,GoodsNum=1,GaiLv=400000,PinZhi=0},
         {GoodsID=82018,GoodsNum=1,GaiLv=200000,PinZhi=0},
         {GoodsID=82018,GoodsNum=1,GaiLv=100000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=800000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=400000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=200000,PinZhi=0},
         {GoodsID=88979,GoodsNum=1,GaiLv=100000,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=800000,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=400000,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=200000,PinZhi=0},
         {GoodsID=88980,GoodsNum=1,GaiLv=100000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=800000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=800000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=800000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=800000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=800000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=600000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=600000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=600000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=600000,PinZhi=0},
         {GoodsID=80498,GoodsNum=20,GaiLv=600000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=1000000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=1000000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=1000000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=600000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=600000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=600000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=300000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=300000,PinZhi=0},
         {GoodsID=80696,GoodsNum=10,GaiLv=300000,PinZhi=0},
         {GoodsID=828,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=828,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=828,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=828,GoodsNum=1,GaiLv=300000,PinZhi=0},
         {GoodsID='时装1',GoodsNum=1,GaiLv=30000,PinZhi=0}, ----------面具
         {GoodsID='时装2',GoodsNum=1,GaiLv=30000,PinZhi=0}, ----------老时装
        }
}





-----------------地图配置ID-------------------
----------------------------------------------

WanShengJie_MapList = {23,10,99,98} --阳光雨林,珊瑚群岛,落日农庄,娜沙湿地


WanShengJie_FbID = 2031  ----------副本ID

-----------------角色数据ID-------------------
----------------------------------------------
JinChuFbCDID = 19501  ---------------重新进入副本需10冷却

-----------------全局数据ID-------------------
----------------------------------------------
DelBefore = -7001  ---------------记录第几次刷，然后下一次刷就把上一次刷的刷走
SiShenLengQueID = -7005 ---------死神时装掉落CD

-----------------地图数据ID-------------------
----------------------------------------------
DieNum= 1  ---------------地图怪清掉了多少
ShuaGuo= 2  ---------------Boss刷了没
TangGuo = 3 ---------------给了多少糖果
FbLevel = 4 ---------------这副本多少级

-----------------活动时间---------------------
----------------------------------------------

WanShengJie_Start = {Year = 2011,Month = 10,Day = 20,Hour = 0,Minute = 0,Second = 0} -------活动日期
WanShengJie_End = {Year = 2011,Month = 11,Day = 2,Hour = 0,Minute = 0,Second = 0}

WanShengJie_DayStart = {Hour = 12,Minute = 0,Second = 0} -------每天野外刷怪活动的时间
WanShengJie_DayEnd = {Hour = 22,Minute = 0,Second = 0}

WanShengJie_FbReady = {                                            ----------------副本入口刷新时间
                        [1] = {Hour = 12,Minute = 0,Second = 0},
                        [2] = {Hour = 21,Minute = 0,Second = 0},

                       }

WanShengJie_FbStart = {
                        [1] = {Hour = 13,Minute = 0,Second = 0},
                        [2] = {Hour = 21,Minute = 0,Second = 0},
					  }
WanShengJie_FbEnd = {
                        [1] = {Hour = 22,Minute = 0,Second = 0},
                        [2] = {Hour = 22,Minute = 30,Second = 0},
                     }


-----------------怪物刷新频率-----------------
----------------------------------------------

WanShengJie_ZhuanHuan = {   -------------地图对应怪物类型,怪物ID
    [23] = {1,730024},
    [10] = {1,730024},
    [98] = {2,730025},
    [99] = {2,730025},
}

WanShengJie_PinLv = {         -------------两种怪物的刷新频率
   [1] = {least = 50 ,most = 200},
   [2] = {least = 50 ,most = 200},
}


WanShengJie_FenMuPinLvMost = 200
WanShengJie_FenMuPinLvLeast = 50

-----------------变量值-----------------------
----------------------------------------------

if WanShengJie_YeWaiShuaGuo == nil then   ----------野外是否刷过怪
   WanShengJie_YeWaiShuaGuo = 0
end

if WanShengJie_FbShuaGuo == nil then   ----------副本开始刷入口没
   WanShengJie_FbShuaGuo = 0
end

if WanShengJie_FenMuShuaGuo == nil then   ----------坟墓刷过没
   WanShengJie_FenMuShuaGuo = 0
end

FbEnterNum = 50 --------每张地图要刷多少个副本入口

-----------------表-----------------------
------------------------------------------

if WanShengJie_YeWaiGuaiIDlist == nil then   ----------存放每张地图怪临时ID
   WanShengJie_YeWaiGuaiIDlist = {}
end

if WanShengJie_FenMuIDlist == nil then     ----------存放每张地图坟墓临时ID
   WanShengJie_FenMuIDlist = {}
end

if WanShengJie_FbGuaiEnterIDlist == nil then   ----------存放副本入口临时ID
   WanShengJie_FbGuaiEnterIDlist = {}
--   for i = 1,10 do
--      if WanShengJie_FbGuaiEnterIDlist[i] == nil then
--         WanShengJie_FbGuaiEnterIDlist[i] = {}
--	  end
--   end
end

WSJ_ZhuanHuan = {
   [10977] = '万圣节男帽',
   [10978] = '万圣节男装',
   [10979] = '万圣节女帽',
   [10980] = '万圣节女装',
   [10981] = '南瓜头盔',
   [10983] = '鬼脸面具',
   [10984] = '猫脸面具【女装】',
   [10985] = '狂欢面具【男装】',

}

-----------------触发器ID-----------------
------------------------------------------

if ActTimeFuncID == nil then  ------------总体触发器
   ActTimeFuncID = 0
end

--SiShenChuFa = nil
--if SiShenChuFa ~= nil then  ------------时装CD触发器
--   API_DestroyTriggerG(SiShenChuFa)
--   SiShenChuFa = nil
--end





-------------------------加载触发器-------------------

if API_GetServerID() <11 then
   local nShiFouStart = API_DiffDatatime(WanShengJie_Start.Year,WanShengJie_Start.Month,WanShengJie_Start.Day,WanShengJie_Start.Hour,WanShengJie_Start.Minute,WanShengJie_Start.Second)
   local nShiFouEnd = API_DiffDatatime(WanShengJie_End.Year,WanShengJie_End.Month,WanShengJie_End.Day,WanShengJie_End.Hour,WanShengJie_End.Minute,WanShengJie_End.Second)
   if nShiFouStart <= 0 and nShiFouEnd > 0 then
     if ActTimeFuncID ~= nil then
        API_DestroyTriggerG(ActTimeFuncID)
		ActTimeFuncID = API_CreateTimerTriggerG(0,0,60,-1,'WanShengJie_ActTimeFunc')
	 else
	    ActTimeFuncID = API_CreateTimerTriggerG(0,0,60,-1,'WanShengJie_ActTimeFunc')
     end

   end
end

function WanShengJie_ActTimeFunc()
  if API_GetServerID() <11 then
---------------野外刷怪-----------------
   local nShiFouStart = API_DiffDatatime(WanShengJie_Start.Year,WanShengJie_Start.Month,WanShengJie_Start.Day,WanShengJie_Start.Hour,WanShengJie_Start.Minute,WanShengJie_Start.Second)
   local nShiFouEnd = API_DiffDatatime(WanShengJie_End.Year,WanShengJie_End.Month,WanShengJie_End.Day,WanShengJie_End.Hour,WanShengJie_End.Minute,WanShengJie_End.Second)
   if nShiFouStart <= 0 and nShiFouEnd > 0 then
	  local t = os.date('*t')
	  t.hour = WanShengJie_DayStart.Hour
      t.min =  WanShengJie_DayStart.Minute
      t.sec =  WanShengJie_DayStart.Second
      local t1 = os.time(t)
      t.hour = WanShengJie_DayEnd.Hour
      t.min =  WanShengJie_DayEnd.Minute
      t.sec =  WanShengJie_DayEnd.Second
      local t2 = os.time(t)
      local Diff1 = os.time() - t1
      local Diff2 = t2 - os.time()
      if Diff1 >= 0 and Diff2 > 0 then
      -----------------刷野外普通-------------------
         for i,v in WanShengJie_MapList do
			local RightMapID = API_GetRightMapID(v)
			if API_MapIsValid(RightMapID) then
				local PlayNum = 50
				local PlayList = API_GetActorInArea(RightMapID,0,0,0,0,0)
				if PlayList ~= nil then
					PlayNum = table.getn(PlayList)
				end
				local MID = WanShengJie_ZhuanHuan[v][1]
				local WanShengJieShua = 0
				if PlayNum <= 50 then
					WanShengJieShua = WanShengJie_PinLv[MID].least
				else
					local Number = PlayNum - 50
					if PlayNum > 50 and PlayNum <= 200 then
					   WanShengJieShua = Number + WanShengJie_PinLv[MID].least
					elseif PlayNum > 200 then
						WanShengJieShua = WanShengJie_PinLv[MID].most
					end
				end
				if WanShengJie_YeWaiGuaiIDlist[RightMapID] == nil then
					WanShengJie_YeWaiGuaiIDlist[RightMapID] = {}
				end
				for j = 1,WanShengJieShua do
					local YeWaiFastID = WanShengJie_YeWaiGuaiIDlist[RightMapID][j]
					if YeWaiFastID == nil or API_GetMonsterID(YeWaiFastID) <= 0 then
						local Width,Height = PublicFun_GetMapWidthHeight(RightMapID)
						local TileX = 0
						local TileY = 0
						local Num = 0
						repeat
							Num = Num + 1
							TileX = math.random(Width)
							TileY = math.random(Height)
						until not API_IsBlockTile(RightMapID,TileX,TileY,0) or Num == 100
						if not API_IsBlockTile(RightMapID,TileX,TileY,0) then
							local MonsterID = WanShengJie_ZhuanHuan[v][2]
							local YeWaiFastID = API_CreateMonster(RightMapID,MonsterID,TileX,TileY,0,0,-1)
							local bb = API_CreateDieTriggerG(0,0,0,YeWaiFastID,'WanShengJie_YeWaiDieFunc') ----------------掉落
							WanShengJie_YeWaiGuaiIDlist[RightMapID][j] = YeWaiFastID
						end
					end
				end
			end
		end
		WanShengJie_YeWaiShuaGuo = 1
		-----------------刷坟墓-------------------
		for i,v in WanShengJie_MapList do
		    local RightMapID = API_GetRightMapID(v)
			if API_MapIsValid(RightMapID) then
		       local PlayNum = 50
			   local PlayList = API_GetActorInArea(RightMapID,0,0,0,0,0)
			   if PlayList ~= nil then
				  PlayNum = table.getn(PlayList)
			   end
		       local WanShengJieShua = 0
		       if PlayNum <= 50 then
					WanShengJieShua = WanShengJie_FenMuPinLvLeast
			   else
					local Number = PlayNum - 50
					if PlayNum > 50 and PlayNum <= 200 then
					   WanShengJieShua = Number + WanShengJie_FenMuPinLvLeast
					elseif PlayNum > 200 then
					   WanShengJieShua = WanShengJie_FenMuPinLvMost
					end
			   end
			   if WanShengJie_FenMuIDlist[RightMapID] == nil then
				  WanShengJie_FenMuIDlist[RightMapID] = {}
			   end
		       for j = 1,WanShengJieShua do
		           local FenMuFastID = WanShengJie_FenMuIDlist[RightMapID][j]
		           if FenMuFastID == nil or API_GetMonsterID(FenMuFastID) <= 0 then
		              local Width,Height = PublicFun_GetMapWidthHeight(RightMapID)
					  local TileX = 0
					  local TileY = 0
					  local Num = 0
					  repeat
						 Num = Num + 1
						 TileX = math.random(Width)
						 TileY = math.random(Height)
					  until not API_IsBlockTile(RightMapID,TileX,TileY,0) or Num == 100
		              if not API_IsBlockTile(RightMapID,TileX,TileY,0) then
						 local MonsterID = WanShengJie_FenMu[math.random(table.getn(WanShengJie_FenMu))]
						 local FenMuFastID = API_CreateMonster(RightMapID,MonsterID,TileX,TileY,3,0,-1)
						 local bb = API_CreateDieTriggerG(0,0,0,FenMuFastID,'WanShengJie_FenMuDieFunc') ----------------掉落
						 WanShengJie_FenMuIDlist[RightMapID][j] = FenMuFastID
					  end
		           end
		       end
			end
		end
		WanShengJie_FenMuShuaGuo = 1
      else
        if WanShengJie_YeWaiShuaGuo == 1 then
			WanShengJie_YeWaiShuaGuo = 0
			for i in WanShengJie_YeWaiGuaiIDlist do
				for j,v in WanShengJie_YeWaiGuaiIDlist[i] do
					if API_GetMonsterID(v) > 0 then
						API_DestroyMonster(v)
					end
				end
			end
			WanShengJie_YeWaiGuaiIDlist = {}
		end
		if WanShengJie_FenMuShuaGuo == 1 then
			WanShengJie_FenMuShuaGuo = 0
			for i in WanShengJie_FenMuIDlist do
				for j,v in WanShengJie_FenMuIDlist[i] do
					if API_GetMonsterID(v) > 0 then
						API_DestroyMonster(v)
					end
				end
			end
			WanShengJie_FenMuIDlist = {}
		end
	  end

	  ---------------副本刷怪-----------------
	  local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() ---------当前时间
	  local RT,ST,ET =0,0,0
	  if WanShengJie_FbReady[1].Hour <= Hour and WanShengJie_FbEnd[1].Hour > Hour then
		 RT = WanShengJie_FbReady[1].Hour
		 ST = WanShengJie_FbStart[1].Hour
		 ET = WanShengJie_FbEnd[1].Hour
	  end
	  
	  if RT ~= 0 and ST ~= 0 and ET ~= 0  then
	     if Hour == RT then
		    WanShengJie_FbShuaGuo = 0
		    if math.mod(Minute,5) == 0 then
			   API_ActorBroadcastMsgLevelEx(-1, -1, 10, 0, 17, '万圣节中，鬼怪隧道骷髅间谍于'..ST..'：00--'..ET..'：00在-阳光雨林、珊瑚群岛、落日农庄、娜纱湿地举行，欢迎各位英雄踊跃参与！')
			   API_ActorBroadcastMsgLevelEx(-1, -1, 10, 0, 8, '万圣节中，鬼怪隧道骷髅间谍于'..ST..'：00--'..ET..'：00在阳光雨林、珊瑚群岛、落日农庄、娜纱湿地举行，欢迎各位英雄踊跃参与！')
		    end
	     end
	     if Hour >= ST and Hour < ET then
--		    if WanShengJie_FbShuaGuo == nil or WanShengJie_FbShuaGuo < 1 then
--			   WanShengJie_FbShuaGuo = 1
			   if API_GetServerID() <11 then
			      WanShengJie_ShuaEnterFunc()
--			      API_CreateTimerTriggerG(0,0,300,5,'WanShengJie_ShuaEnterFunc')
			   end
			   --API_ActorBroadcastMsgLevelEx(-1, -1, 10, 0, 17, '万圣节中，前往阳光雨林、珊瑚群岛、落日农庄、娜纱湿地通过骷髅间谍进入鬼怪隧道，击败杰森伯爵更可获得丰厚奖励！')
			 -- API_ActorBroadcastMsgLevelEx(-1, -1, 10, 0, 8, '万圣节中，前往阳光雨林、珊瑚群岛、落日农庄、娜纱湿地通过骷髅间谍进入鬼怪隧道，击败杰森伯爵更可获得丰厚奖励！')

		    end
	        if math.mod(Minute,1200) == 0 then
			   API_ActorBroadcastMsgLevelEx(-1, -1, 10, 0, 17, '万圣节中，现在可前往阳光雨林、珊瑚群岛、落日农庄、娜纱湿地通过骷髅间谍进入鬼怪隧道，击败杰森伯爵更可获得丰厚奖励！')
			   API_ActorBroadcastMsgLevelEx(-1, -1, 10, 0, 8, '万圣节中，现在可前往阳光雨林、珊瑚群岛、落日农庄、娜纱湿地通过骷髅间谍进入鬼怪隧道，击败杰森伯爵更可获得丰厚奖励！')
		    end
--	     end

	     if Hour == ET - 1 and Minute >= 45 then
		    if math.mod(Minute,5) == 0 then
		   	   API_ActorBroadcastMsgLevelEx(-1, -1, 10, 0, 17, '请注意，骷髅间谍将在'..ET..'点消失！')
			   API_ActorBroadcastMsgLevelEx(-1, -1, 10, 0, 8, '请注意，骷髅间谍将在'..ET..'点消失！')
		    end
	     end
	  end
	  if (Hour == 22 and Minute == 0) then
		 for j in WanShengJie_FbGuaiEnterIDlist do
             for i in WanShengJie_FbGuaiEnterIDlist[j] do
				 local FastID = WanShengJie_FbGuaiEnterIDlist[j][i]
				 if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
					API_DestroyMonster(FastID)
				 end
			 end
		 end
		 WanShengJie_FbGuaiEnterIDlist = {}
	  end
    end
  end
end


---------------副本刷怪-----------------

function WanShengJie_ShuaEnterFunc()
--  if API_GetServerID() <11 then
--	local Zhi = API_VarDataGetNumber_Ex(1,0,DelBefore,1,1)
--	API_Trace('Zhi = '..Zhi)
--	if WanShengJie_FbGuaiEnterIDlist[Zhi] == nil then
--	   API_Trace('什么 = '..Zhi)
--
--	end
--	if Zhi ~= 0 then
--	   if table.getn(WanShengJie_FbGuaiEnterIDlist[Zhi]) ~= 0 then
--          for j in WanShengJie_FbGuaiEnterIDlist[Zhi] do
--		      local FastID = WanShengJie_FbGuaiEnterIDlist[Zhi][j]
--		      if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
--			      API_DestroyMonster(FastID)
--			      WanShengJie_FbGuaiEnterIDlist[Zhi][j] = nil
--		      end
--	      end
--	   end
--	end
--    API_VarDataSetNumber_Ex_Sync(1,0,DelBefore,1,1,API_VarDataGetNumber_Ex(1,0,DelBefore,1,1)+1)
--    local Zhi = API_VarDataGetNumber_Ex(1,0,DelBefore,1,1)
    for i in WanShengJie_MapList do
        local MapID = API_GetRightMapID(WanShengJie_MapList[i])
        if MapID >= 0 and API_MapIsValid(MapID) then
           if WanShengJie_FbGuaiEnterIDlist[MapID] == nil then
	          WanShengJie_FbGuaiEnterIDlist[MapID] = {}
	       end
		   for j = 1,FbEnterNum do
               local EnterFastID = WanShengJie_FbGuaiEnterIDlist[MapID][j]
		       if EnterFastID == nil or API_GetMonsterID(EnterFastID) <= 0 then
                  local Width,Height = PublicFun_GetMapWidthHeight(MapID)
			      local Num = 0
			      local TileX = 0
			      local TileY = 0
			      repeat
			        Num = Num + 1
                    TileX = math.random(Width)
			        TileY = math.random(Height)
			      until not API_IsBlockTile(MapID,TileX,TileY,0) or Num == 200
			      if not API_IsBlockTile(MapID,TileX,TileY,0) then
			         local EnterFastID = API_CreateMonster(MapID,WanShengJie_YeiWaiFbEnter,TileX,TileY,5,0,-1)
                     WanShengJie_FbGuaiEnterIDlist[MapID][j] = EnterFastID
			      end
			   end
		   end
		   API_ActorBroadcastMsgEx(MapID,-1,0,17,'骷髅间谍出现了！')
		   API_ActorBroadcastMsgEx(MapID,-1,0,8,'骷髅间谍出现了！')
		end
	end
end


---------------副本入口点击-----------------

function WanShengJie_Click(ActorID,NPCID)
    local ActorID = ActorID or API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local Time = API_VarDataGetNumber(ActorID,0,JinChuFbCDID)
	local MapID = API_GetActorMapID(ActorID)
    if API_GetMonsterID(NPCFastID) <= 0 then
		API_ResponseEnd()
		API_ResponseClear()
		return
	end
	if Time > 0 then    ----------------------------------------------------------------------------------标记住
		API_ActorSendMsg(ActorID,10,'你还需要'..Time..'秒后才能继续进入鬼怪隧道。')
		API_ResponseEnd()
		API_ResponseClear()
		return
	end

    if XuanZe == 1 then
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 and API_GetTeamLeader(TeamID) == ActorID then
			API_ResponseWrite('<name>骷髅间谍</name>')
		    API_ResponseWrite('<br><text color="255,0,0">你要给我多少个糖果呢？给不同数量的糖果伯爵掉落的东西和概率也不同哦！</text><br>')
		    API_ResponseWrite('<br><a href="WanShengJie_Click?1=2">1个糖果(掉落南瓜头，面具)</a><br>')
		    API_ResponseWrite('<br><a href="WanShengJie_Click?1=3">5个糖果(掉落南瓜头，面具，时装)</a><br>')
		    API_ResponseWrite('<br><a href="WanShengJie_Click?1=4">10个糖果(掉落南瓜头，面具，时装)</a><br>')
		    API_ResponseWrite('<br><a>关闭</a><br>')
		else
			API_ResponseWrite('<name>骷髅间谍</name>')
			API_ResponseWrite('<br><text>我只和拥有队长权限的人协商，并且因为怪物的凶狠，需要你的队伍人数至少多于两人才能进入。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	elseif  XuanZe ~= 2 and XuanZe ~= 3 and XuanZe ~= 4 then
		API_ResponseWrite('<name>骷髅间谍</name>')
		API_ResponseWrite('<br><text>邪恶的杰森伯爵和我的同伴在万圣节出现在鬼怪隧道里，前往和他们切磋一番将获得丰厚的奖励。</text><br>')
		API_ResponseWrite('<br><text>不过他们可是好惹的料，所以需要你的队伍人数至少多于两人才能进入。</text><br>')
		API_ResponseWrite('<br><text>鬼怪隧道必须拥有队长权限，并给予我万圣节糖果进入，至于里面的奖励，就看你的意思了~~</text><br>')
		API_ResponseWrite('<br><text>1个不算多，5个不算少，10个刚刚好，哈哈哈，队长给我就行了，至于杰森伯爵掉落的物品，大家随意捡。可别说我太黑哦。</text><br>')
		API_ResponseWrite('<br><text color="255,0,0">必须击败我的所有同类骷髅，杰森伯爵才会出现，加油哦。</text><br>')
		API_ResponseWrite('<br><a href="WanShengJie_Click?1=1">给予糖果</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	end

	if  XuanZe == 2 or XuanZe == 3 or XuanZe == 4 then
		local LinShiBiao = {1,5,10}
	    local MaxLevel = 0   --------队伍中最高等级
	    local SumLevel = 0   --------队伍中等级总和
	    local InFactSize = 0   --------实际人数
	    local TeamID = API_GetTeamID(ActorID)
	    local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	    local TeamSize = API_GetTeamSize(TeamID)    ----------------------队伍人数
	    if TeamID <= 0  then
	       API_ResponseWrite('<name>骷髅间谍</name>')
           API_ResponseWrite('<br><text>你没有加入任何</text><text color="255,0,255">队伍</text><text>不能进入鬼怪隧道。</text><br>')
		   API_ResponseWrite('<br><a>确定</a><br>')
		   API_ResponseFlush(ActorID)
		   return
	    end
	    if API_GetTeamLeader(TeamID) ~= ActorID then
		   API_ResponseWrite('<name>骷髅间谍</name>')
           API_ResponseWrite('<br><text>你不是</text><text color="255,0,255">队长</text><text>，不能带领队伍进入鬼怪隧道。</text><br>')
		   API_ResponseWrite('<br><a>确定</a><br>')
		   API_ResponseFlush(ActorID)
		end
		if API_ActorGetGoodsNum(ActorID,WanShengJie_CandyID) < LinShiBiao[XuanZe-1] then
		   API_ResponseWrite('<name>骷髅间谍</name>')
           API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">队长</text><text>身上要有'..LinShiBiao[XuanZe-1]..'个</text><text color="255,0,0">万圣节糖果</text><text>才能带领队伍进入鬼怪隧道。</text><br>')
		   API_ResponseWrite('<br><a>确定</a><br>')
		   API_ResponseFlush(ActorID)
		   return
		end
	    for i = 1,TeamSize do
			local TeamActorID = API_GetTeamMem(TeamID,i)
			if API_ActorIsOnline(TeamActorID) then
			   local PlayX2,PlayY2 = PublicFun_GetActorPosXY(TeamActorID)
               local TeamActorMapID = API_GetActorMapID(TeamActorID)
               local TeamActorIDLevel = API_GetActorExpLevel(TeamActorID)
			   MaxLevel = math.max(MaxLevel,TeamActorIDLevel)
			   SumLevel = SumLevel + TeamActorIDLevel
			   InFactSize = InFactSize + 1
			   if  TeamActorMapID ~= MapID then
				   API_ResponseWrite('<name>骷髅间谍</name>')
                   API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>不在同一场景中。</text><br>')
				   API_ResponseWrite('<br><a>确定</a><br>')
				   API_ResponseFlush(ActorID)
				   return
			   end
--			   local JuLi = PublicFun_AccountDistance(PlayX,PlayY,PlayX2,PlayY2)
-- 			   if JuLi > 15 then
-- 				  API_ResponseWrite('<name>骷髅间谍</name>')
--                  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>不在附近。</text><br>')
--				  API_ResponseWrite('<br><a>确定</a><br>')
-- 				  API_ResponseFlush(ActorID)
-- 				  return
-- 			   end
 			   if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
				  API_ResponseWrite('<name>骷髅间谍</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>正在快递，无法进入鬼怪隧道！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
			      return
			   end
			   if API_ActorFindStatus(TeamActorID,519) then
				  API_ResponseWrite('<name>骷髅间谍</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>正在摆摊，无法进入鬼怪隧道！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
			   end
			   if API_ActorIsDying(TeamActorID) then
				  API_ResponseWrite('<name>骷髅间谍</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>死亡，无法进入鬼怪隧道！</text><br>')
			      API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
			   end
			   if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
				  API_ResponseWrite('<name>骷髅间谍</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>在公交车上无法进入鬼怪隧道！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
			   end
			end
		end
		if API_ActorRemoveGoods(ActorID,WanShengJie_CandyID,LinShiBiao[XuanZe-1],'删除万圣节糖果')  then
		   local AveLevel = math.max(math.floor(SumLevel/InFactSize),MaxLevel - 5) ----------副本怪物等级
		   API_DestroyMonster(NPCFastID)            -------------------------------点击删除门
		   local ObjectMapID = API_CreateEctype(WanShengJie_FbID,0)  ---------------创建副本
		   local MonsterID = WanShengJie_FbGuaiID-10+AveLevel
		   for i in WanShengJie_FbGuaiPos do
               local FastID = API_CreateMonster(ObjectMapID,MonsterID,WanShengJie_FbGuaiPos[i].x,WanShengJie_FbGuaiPos[i].y,3,0,-1)
               API_CreateDieTriggerG(ObjectMapID,ActorID,0,FastID,'WanShengJiei_FbGuaiDieFunc') --------副本操作和掉落
		   end
		   for i in WanShengJie_FbEnterPos do
               local FastID = API_CreateMonster(ObjectMapID,WanShengJie_FbExit,WanShengJie_FbEnterPos[i].x,WanShengJie_FbEnterPos[i].y,3,0,-1)
		   end
	       API_SetMapVarData(ObjectMapID,TangGuo,XuanZe)
	       API_SetMapVarData(ObjectMapID,FbLevel,AveLevel)
		   API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'WanShengJie_PlayGotoMap')
		   local LaiYuan = API_ActorGetPropNum(ActorID,201)
		   local Type = 0
           if XuanZe == 2 then ----1颗糖
              Type = 6
           elseif XuanZe == 3 then ----5颗糖
              Type = 7
           elseif XuanZe == 4 then ----10颗糖
              Type = 8
           end
           if Type ~= 0 then
              if GLOBAL_FengXiangBiao_DateList[60][Type][LaiYuan] == nil then
                 GLOBAL_FengXiangBiao_DateList[60][Type][LaiYuan] = 1
              else
                 GLOBAL_FengXiangBiao_DateList[60][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[60][Type][LaiYuan] + 1
              end
           end
	   end
	end
	API_ResponseFlush(ActorID)

end

function WanShengJie_PlayGotoMap(ObjectMapID,ActorID)
	--判断是否有队伍，是的话一起传进去
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorIsOnline(ActorID) then
		local MapID = API_GetActorMapID(ActorID)
		--判断组队
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID then
					API_ActorGoToMap(TeamActorID,ObjectMapID,WanShengJie_EnterMapPosX,WanShengJie_EnterMapPosY)
					API_VarDataSetNumber(TeamActorID,0,JinChuFbCDID,10)
					API_CreateTimerTrigger(TeamActorID,1,10,-1,'WanShengJie_LengQueFunc')
				end
			end
		end
	end
end

function WanShengJie_LengQueFunc(ActorID,b)
	if API_ActorIsOnline(ActorID) then
		local Time = API_VarDataGetNumber(ActorID,0,JinChuFbCDID)
		Time = Time -1
		API_VarDataSetNumber(ActorID,0,JinChuFbCDID,Time)
	end
end

---------------掉落和副本操作-----------------

function WanShengJiei_FbGuaiDieFunc(MapID,ActorID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
    if MapID <= 0 then
		return
	end
	if not API_MapIsValid(MapID) then
		return
	end
	API_SetMapVarData(MapID,DieNum,API_GetMapVarData(MapID,DieNum)+1)  ----------先算上这个怪的数
	local TeamID = API_GetTeamID(ActorID)
	local Num = API_GetMapVarData(MapID,DieNum)
	local Judge = API_GetMapVarData(MapID,ShuaGuo)

	if Num >= table.getn(WanShengJie_FbGuaiPos) then
	   if Judge < 1 then
	      API_SetMapVarData(MapID,DieNum,Judge+1)
	      local AveLevel = API_GetMapVarData(MapID,FbLevel)
	      local MonsterID = WanShengJie_FbBossID-10+AveLevel
	      local FastID = API_CreateMonster(MapID,MonsterID,WanShengJie_FbBossPosX,WanShengJie_FbBossPosY,3,0,-1)
          API_CreateDieTriggerG(MapID,ActorID,0,FastID,'WanShengJie_FbBossDieFunc') --------掉落
          API_ActorBroadcastMsgEx(DynamicMapID,-1,0,0,'杰森伯爵出现在隧道的中间！')
	   end
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
    local Zhi = API_GetMapVarData(DynamicMapID,TangGuo)
    local XuanZe = Zhi - 1
    if XuanZe ~= 0 and XuanZe <= 3 then
    else
       XuanZe = 1
    end
	local GoodTable = WanShengJie_FbGoodsID[XuanZe]
	for j in GoodTable do
		local GaiLv1 = GoodTable[j].GaiLv
		local GaiLv = math.random(1000000)
		if GaiLv <= GaiLv1 then
		   local GoodsID = GoodTable[j].GoodsID
		   local Num  = GoodTable[j].GoodsNum
		   local PinZhi  = GoodTable[j].PinZhi
           if PinZhi > 0 then
              API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,Num,0,'万圣节副本怪物掉落',GuiShuType,WhatID,600,120,PinZhi)
		   else
              API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsID,Num,0,'万圣节副本怪物掉落',GuiShuType,WhatID,600,120)
		   end
           local Type = 0
           if GoodsID == 88979 then ----南瓜徽章
              Type = 3
           elseif GoodsID == 88980 then ----南瓜袋
              Type = 2
           elseif GoodsID == 82018 then ----南瓜魔棒
              Type = 1
           end
           if Type ~= 0 then
              if GLOBAL_FengXiangBiao_DateList[60][Type][1] == nil then
                 GLOBAL_FengXiangBiao_DateList[60][Type][1] = 1
              else
                 GLOBAL_FengXiangBiao_DateList[60][Type][1] = GLOBAL_FengXiangBiao_DateList[60][Type][1] + 1
              end
           end
		end
	end
end

------------------副本BOSS掉落---------------
function WanShengJie_FbBossDieFunc(MapID,ActorID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
    if MapID <= 0 then
		return
	end
	if not API_MapIsValid(MapID) then
		return
	end
    local Zhi = API_GetMapVarData(DynamicMapID,TangGuo)
    local XuanZe = Zhi - 1
    if XuanZe ~= 0 and XuanZe <= 3 then
    else
       XuanZe = 1
    end
    local WSJ_ZhuanHuan = {
   [10977] = '万圣节男帽',
   [10978] = '万圣节男装',
   [10979] = '万圣节女帽',
   [10980] = '万圣节女装',
   [10981] = '南瓜头盔',
   [10983] = '鬼脸面具',
   [10984] = '猫脸面具【女装】',
   [10985] = '狂欢面具【男装】',

}
	local GoodTable = WanShengJie_BossGoodsID[XuanZe]
	local x1,y1,x2,y2 = 181,152,199,170
	for j in GoodTable do
		local GaiLv1 = GoodTable[j].GaiLv
		local GaiLv = math.random(1000000)
		if GaiLv <= GaiLv1 then
		   local GoodsID = GoodTable[j].GoodsID
		   local GoodsNum  = GoodTable[j].GoodsNum
		   local PinZhi  = GoodTable[j].PinZhi
		   local x,y
		   local Num = 0
		   if GoodsID == '时装1' then ------鬼脸面具，猫脸面具【女装】，狂欢面具【男装】，南瓜头盔
			  local Biao = {10983,10984,10985,10981}
			  local Ran = math.random(table.getn(Biao))
			  GoodsID = Biao[Ran]
		   elseif GoodsID == '时装2' then ---------男女老帽装4样
		      local Biao = {10977,10978,10979,10980}
			  local Ran = math.random(table.getn(Biao))
			  GoodsID = Biao[Ran]
		   end
		   if GoodsID == 10977 or GoodsID == 10978 or GoodsID == 10979 or GoodsID == 10980 or GoodsID == 10983 or GoodsID == 10984 or GoodsID == 10985 or GoodsID == 10981 then   ----如果是死神的话
				local NowTime = os.time()
				local CD = API_VarDataGetNumber_Ex(1,0,SiShenLengQueID,1,1)
				if NowTime > CD then
					local Time = os.time()
					local Tsec = math.random(1200,2400)					
					local NextTime = Time + Tsec
					API_VarDataSetNumber_Ex_Sync(1,0,SiShenLengQueID,1,1,NextTime)
				else
					GoodsID = 82004
				end
--              local Time = API_VarDataGetNumber_Ex(1,0,SiShenLengQueID,1,1)
--              if Time > 0 then
--                 GoodsID = 82004
--			  else
--			     local CD = math.random(7*60,10*60)
--			     API_VarDataSetNumber_Ex_Sync(1,0,SiShenLengQueID,1,1,CD)
--                 API_CreateTimerTriggerG(0,0,1,CD,'WanShengJie_SiShenCD')
--			  end
           end

		   repeat
		      Num = Num + 1
		      x = math.random(x1,x2)
		      y = math.random(y1,y2)
		   until not API_IsBlockTile(MapID,x,y,0) or Num == 100
		   if not API_IsBlockTile(MapID,x,y,0) then
			  if PinZhi > 0 then
				 API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,GoodsNum,2,'万圣节副本Boss掉落',4,0,600,60,PinZhi)
			  else
			     API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsID,GoodsNum,2,'万圣节副本Boss掉落',4,0,600,60)
			  end
			  if GoodsID == 10977 or GoodsID == 10978 or GoodsID == 10979 or GoodsID == 10980 or GoodsID == 10983 or GoodsID == 10984 or GoodsID == 10985 or GoodsID == 10981 then   ----如果是死神的话
			     local ShiZhuangName = WSJ_ZhuanHuan[GoodsID]
			     if ShiZhuangName ~= nil then
			        API_ActorBDCMsg(-1,0,-1,1,65,0,17, '杰森伯爵被【'..API_GetActorName(ActorID)..'】带领的队伍打得落花流水，情急之间献上价值不菲的'..ShiZhuangName..'并连声求饶！')
                    --API_ActorBDCMsg(-1,0,-1,1,65,0,8, '杰森伯爵被【'..API_GetActorName(ActorID)..'】带领的队伍打得落花流水，情急之间献上价值不菲的'..ShiZhuangName..'并连声求饶！')
			     end
			  end
		   end
           local Type = 0
           if GoodsID == 88979 then ----南瓜徽章
              Type = 3
           elseif GoodsID == 88980 then ----南瓜袋
              Type = 2
           elseif GoodsID == 82018 then ----南瓜魔棒
              Type = 1
           elseif GoodsID == 10977 or GoodsID == 10978 or GoodsID == 10979 or GoodsID == 10980 then ----旧时装
              Type = 10
           end
           if Type ~= 0 then
              if GLOBAL_FengXiangBiao_DateList[60][Type][1] == nil then
                 GLOBAL_FengXiangBiao_DateList[60][Type][1] = 1
              else
                 GLOBAL_FengXiangBiao_DateList[60][Type][1] = GLOBAL_FengXiangBiao_DateList[60][Type][1] + 1
              end
           end
		end
	end
end


--function WanShengJie_SiShenCD(a,b)
--	local Time = API_VarDataGetNumber_Ex(1,0,SiShenLengQueID,1,1)
--	Time = Time -1
--    API_VarDataSetNumber_Ex_Sync(1,0,SiShenLengQueID,1,1,Time)
--end


---------------野外怪物掉落--------------

function WanShengJie_YeWaiDieFunc(MapID,ActorID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
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
	local GoodTable = WanShengJie_YeWaiGoodsID
	for j in GoodTable do
        if j == WanShengJie_ZhuanHuan[MapConfigID][1]  then
		   for i in GoodTable[j] do
		      local GaiLv1 = GoodTable[j][i].GaiLv
		      local GaiLv = math.random(10000)
		      if GaiLv <= GaiLv1 then
		         local GoodsID = GoodTable[j][i].GoodsID
		         local Num  = GoodTable[j][i].GoodsNum
		         local PinZhi  = GoodTable[j][i].PinZhi
		         if PinZhi > 0 then
                    API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,Num,0,'万圣节野外怪掉落',GuiShuType,WhatID,600,120,PinZhi)
		         else
                    API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsID,Num,0,'万圣节野外怪掉落',GuiShuType,WhatID,600,120)
		         end
		         local Type = 0
                 if GoodsID == 88979 then ----南瓜徽章
                    Type = 3
                 elseif GoodsID == 88980 then ----南瓜袋
                    Type = 2
                 end
                 if Type ~= 0 then
                    if GLOBAL_FengXiangBiao_DateList[60][Type][1] == nil then
                       GLOBAL_FengXiangBiao_DateList[60][Type][1] = 1
                    else
                       GLOBAL_FengXiangBiao_DateList[60][Type][1] = GLOBAL_FengXiangBiao_DateList[60][Type][1] + 1
                    end
                 end
			  end
		   end
	    end
	end
end

---------------坟墓掉落--------------


function WanShengJie_FenMuDieFunc(MapID,ActorID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
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
	local GoodTable = WanShengJie_FenMuGoodsID
	for j in GoodTable do
		local GaiLv1 = GoodTable[j].GaiLv
		local GaiLv = math.random(10000)
		if GaiLv <= GaiLv1 then
		   local GoodsID = GoodTable[j].GoodsID
		   local Num  = GoodTable[j].GoodsNum
		   local PinZhi  = GoodTable[j].PinZhi
		   if PinZhi > 0 then
              API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,Num,0,'万圣节野外怪掉落',GuiShuType,WhatID,600,120,PinZhi)
		   else
              API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsID,Num,0,'万圣节野外怪掉落',GuiShuType,WhatID,600,120)
		   end
		   local Type = 0
           if GoodsID == 88979 then ----南瓜徽章
              Type = 3
           elseif GoodsID == 88980 then ----南瓜袋
              Type = 2
           end
           if Type ~= 0 then
              if GLOBAL_FengXiangBiao_DateList[60][Type][1] == nil then
                 GLOBAL_FengXiangBiao_DateList[60][Type][1] = 1
              else
                 GLOBAL_FengXiangBiao_DateList[60][Type][1] = GLOBAL_FengXiangBiao_DateList[60][Type][1] + 1
              end
           end
		end
	end
end







