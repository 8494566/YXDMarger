-------------------------------
--文件名:	Scp\Lua\Act\Spring_DaNaoTianGong.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:   梁宇宁
--日  期:	2010-12-28
--版  本:
--描  述:   春节活动-大闹天宫副本 
--应  用:
-------------------------------



Spring_NianTuDaShi = 12357  --------年兔大使的ID
Spring_DaNaoTianGongFbID = 2034 --------大闹天宫ID
Spring_NianGaoID = 89036 ---------年糕ID
Spring_DaNaoTianGongFbExit = 11607 ----出口


Spring_NianGaoEnterDrop = 1   -----使用多少个年糕进 
Spring_DanNaoTianGongLevel = 2  ----- 副本怪物的等级
Spring_DanNaoTianDieNum = 3  ----- 副本已经死亡的数量 
Spring_DanNaoTianBossShua = 4  ----- 副本BOSS是否已经刷过
Spring_DanNaoTianUseTime = 5  ----- 杀完BOSS用了多少时间
Spring_DanNaoTianBossDie = 6  ----- BOSS死了没
Spring_DanNaoTianDaoShu = 7  ----- 结算倒数
Spring_DanNaoTianXianShiMiao = 8  ----- 显示计算的秒

Spring_DaNaoTianGongEnterPosX = 256  ----进入副本的入口
Spring_DaNaoTianGongEnterPosY = 165

Spring_DanNaoTianFbBossPosX = 185
Spring_DanNaoTianFbBossPosY = 136

Spring_DaNaoTianGongFbGuaiID = 730701    -----普通怪物ID
Spring_DaNaoTianGongFbBossGuaiID = 730801    -----BOSS ID

table_Spring_EnterNpcPos = {    ---------出口NPC坐标 
 [1] = {x = 256,y = 165},
 [2] = {x = 185,y = 125},

}
 
Spring_DaNaoTianGongGuaiPos = {
  [1] = {x = 254,y = 188},
  [2] = {x = 261,y = 188},
  [3] = {x = 254,y = 195},
  [4] = {x = 258,y = 190},
  [5] = {x = 261,y = 194},
  [6] = {x = 248,y = 232},
  [7] = {x = 255,y = 230},
  [8] = {x = 255,y = 226},
  [9] = {x = 250,y = 223},
  [10] = {x = 246,y = 228},
  [11] = {x = 206,y = 240},
  [12] = {x = 209,y = 230},
  [13] = {x = 210,y = 234},
  [14] = {x = 210,y = 239},
  [15] = {x = 212,y = 234},
  [16] = {x = 109,y = 237},
  [17] = {x = 114,y = 237},
  [18] = {x = 114,y = 223},
  [19] = {x = 114,y = 237},
  [20] = {x = 110,y = 234},
  [21] = {x = 134,y = 174},
  [22] = {x = 135,y = 184},
  [23] = {x = 138,y = 180},
  [24] = {x = 141,y = 175},
  [25] = {x = 141,y = 184},
  [26] = {x = 155,y = 238},
  [27] = {x = 157,y = 245},
  [28] = {x = 160,y = 238},
  [29] = {x = 162,y = 247},
  [30] = {x = 166,y = 244},
  [31] = {x = 175,y = 170},
  [32] = {x = 175,y = 175},
  [33] = {x = 177,y = 179},
  [34] = {x = 185,y = 174},
  [35] = {x = 182,y = 170},

} 


table_Spring_NianTuDaShiShuaPos = {    ---------年兔大使 
 [1] = {x = 127,y = 324,mapid = 25}, --麦穗平原
 [2] = {x = 152,y = 307,mapid = 10}, --珊瑚群岛
 [3] = {x = 357,y = 386,mapid = 98}, --娜纱湿地
 [4] = {x = 243,y = 179,mapid = 2},  --天空城
 [5] = {x = 143,y = 341,mapid = 23}, --阳光雨林
 [6] = {x = 144,y = 376,mapid = 9},  --暗礁海
 [7] = {x = 382,y = 374,mapid = 99},  --落日农庄
 [8] = {x = 268,y = 210,mapid = 1}, --钢铁城

}



Spring_DaNaoTianGongStart = {Year = 2011,Month = 1,Day = 27,Hour = 0,Minute = 0,Second = 0} -------活动日期
Spring_DaNaoTianGongEnd = {Year = 2011,Month = 2,Day = 18,Hour = 0,Minute = 0,Second = 0}


Spring_AiMuZhiXinStart = {Year = 2011,Month = 2,Day = 11,Hour = 0,Minute = 0,Second = 0} -------爱慕之心产出日期
Spring_AiMuZhiXinEnd = {Year = 2011,Month = 2,Day = 18,Hour = 0,Minute = 0,Second = 0}


if Spring_DaNaoTianGongTriID == nil then  ------------总体触发器
   Spring_DaNaoTianGongTriID = 0
end

if table_Spring_NianTuDaShiFastID == nil then  ------------存储年兔大使的临时ID 
   table_Spring_NianTuDaShiFastID = {}
end

if Spring_NianTuDaShiShuaGuo == nil then
   Spring_NianTuDaShiShuaGuo = 0
end


Spring_NianTuDaShiShuaGuoFbGoodsID = {
  [1] = {
         {GoodsID=89038,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=89038,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=300000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=100000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=0,PinZhi=0},
		},
  [2] = {
         {GoodsID=89038,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=89038,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=200000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=100000,PinZhi=0},
        },

  [3] = {
         {GoodsID=89038,GoodsNum=1,GaiLv=100000,PinZhi=0},
         {GoodsID=89038,GoodsNum=1,GaiLv=50000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=600000,PinZhi=0},
         {GoodsID=80498,GoodsNum=10,GaiLv=300000,PinZhi=0},
        }
}


Spring_NianTuDaShiShuaGuoFbBossGoodsID = {
    [1] = {
           {GoodsID=118,GoodsNum=1,GaiLv=300000,PinZhi=0},
           {GoodsID=118,GoodsNum=1,GaiLv=200000,PinZhi=0},
           {GoodsID=118,GoodsNum=1,GaiLv=100000,PinZhi=0},
           {GoodsID=207,GoodsNum=1,GaiLv=300000,PinZhi=0},
           {GoodsID=207,GoodsNum=1,GaiLv=200000,PinZhi=0},
           {GoodsID=207,GoodsNum=1,GaiLv=100000,PinZhi=0},
           {GoodsID=308,GoodsNum=1,GaiLv=300000,PinZhi=0},
           {GoodsID=309,GoodsNum=1,GaiLv=200000,PinZhi=0},
           {GoodsID=310,GoodsNum=1,GaiLv=100000,PinZhi=0},
           {GoodsID=89038,GoodsNum=1,GaiLv=1000000,PinZhi=0},
           {GoodsID=89038,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID=89038,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID=89038,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID=88952,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID=88952,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID=88952,GoodsNum=1,GaiLv=0,PinZhi=0},
           {GoodsID=88952,GoodsNum=1,GaiLv=0,PinZhi=0},
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
           {GoodsID='旧时装',GoodsNum=1,GaiLv=0,PinZhi=0}, ----------旧时装
           {GoodsID='新时装',GoodsNum=1,GaiLv=0,PinZhi=0}, ----------新时装
           {GoodsID='家具',GoodsNum=1,GaiLv=0,PinZhi=0}, ----------家具
           {GoodsID=31040,GoodsNum=1,GaiLv=0,PinZhi=0}, ----------兔子宠物
           {GoodsID=11334,GoodsNum=1,GaiLv=0,PinZhi=0}, ----------兔子披风

		},
  [2] = {
         {GoodsID=118,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=118,GoodsNum=1,GaiLv=400000,PinZhi=0},
         {GoodsID=118,GoodsNum=1,GaiLv=200000,PinZhi=0},
         {GoodsID=207,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=207,GoodsNum=1,GaiLv=400000,PinZhi=0},
         {GoodsID=207,GoodsNum=1,GaiLv=200000,PinZhi=0},
         {GoodsID=308,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=309,GoodsNum=1,GaiLv=400000,PinZhi=0},
         {GoodsID=310,GoodsNum=1,GaiLv=200000,PinZhi=0},
         {GoodsID=89038,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=89038,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=89038,GoodsNum=1,GaiLv=300000,PinZhi=0},
         {GoodsID=89038,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=88952,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=88952,GoodsNum=1,GaiLv=100000,PinZhi=0},
         {GoodsID=88952,GoodsNum=1,GaiLv=0,PinZhi=0},
         {GoodsID=88952,GoodsNum=1,GaiLv=0,PinZhi=0},
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
         {GoodsID='旧时装',GoodsNum=1,GaiLv=40000,PinZhi=0}, ----------旧时装
         {GoodsID='新时装',GoodsNum=1,GaiLv=0,PinZhi=0}, ----------新时装
         {GoodsID='家具',GoodsNum=1,GaiLv=50000,PinZhi=0}, ----------家具
         {GoodsID=31040,GoodsNum=1,GaiLv=0,PinZhi=0}, ----------兔子宠物
         {GoodsID=11334,GoodsNum=1,GaiLv=0,PinZhi=0}, ----------兔子披风
        },

  [3] = {
         {GoodsID=118,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=118,GoodsNum=1,GaiLv=800000,PinZhi=0},
         {GoodsID=118,GoodsNum=1,GaiLv=400000,PinZhi=0},
         {GoodsID=207,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=207,GoodsNum=1,GaiLv=800000,PinZhi=0},
         {GoodsID=207,GoodsNum=1,GaiLv=400000,PinZhi=0},
         {GoodsID=308,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=309,GoodsNum=1,GaiLv=800000,PinZhi=0},
         {GoodsID=310,GoodsNum=1,GaiLv=400000,PinZhi=0},
         {GoodsID=89038,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=89038,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=89038,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=89038,GoodsNum=1,GaiLv=300000,PinZhi=0},
         {GoodsID=88952,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=88952,GoodsNum=1,GaiLv=1000000,PinZhi=0},
         {GoodsID=88952,GoodsNum=1,GaiLv=600000,PinZhi=0},
         {GoodsID=88952,GoodsNum=1,GaiLv=300000,PinZhi=0},
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
         {GoodsID='旧时装',GoodsNum=1,GaiLv=80000,PinZhi=0}, ----------旧时装
         {GoodsID='新时装',GoodsNum=1,GaiLv=40000,PinZhi=0}, ----------新时装
         {GoodsID='家具',GoodsNum=1,GaiLv=100000,PinZhi=0}, ----------家具
         {GoodsID=31040,GoodsNum=1,GaiLv=40000,PinZhi=0}, ----------兔子宠物
         {GoodsID=11334,GoodsNum=1,GaiLv=30000,PinZhi=0}, ----------兔子披风
        }
}

Spring_DaNaoTianGongFbGoodsCD = -7018 -----掉落CD
Spring_DaNaoTianGongOld= -7019 -----旧时装数量
Spring_DaNaoTianGongNew = -7020 -----新时装时装数量
Spring_DaNaoTianGongToy = -7021 -----兔子宠物数量
Spring_DaNaoTianGongPiFeng = -7022 -----兔子披风数量
Spring_DaNaoTianGongShuaXin = -7023 -----一年中的第几天，控制刷新





-------------------------加载触发器-------------------

if API_GetServerID() <11 then
   if Spring_DaNaoTianGongTriID ~= nil then
      API_DestroyTriggerG(Spring_DaNaoTianGongTriID)
	  Spring_DaNaoTianGongTriID = API_CreateTimerTriggerG(0,0,60,-1,'Spring_ActBeginFunc')
   else
	  Spring_DaNaoTianGongTriID = API_CreateTimerTriggerG(0,0,60,-1,'Spring_ActBeginFunc')
   end
end


--------------刷年兔大使------------------------- 

function Spring_ActBeginFunc()
    if API_GetServerID() <11 then
       local nShiFouStart = API_DiffDatatime(Spring_DaNaoTianGongStart.Year,Spring_DaNaoTianGongStart.Month,Spring_DaNaoTianGongStart.Day,Spring_DaNaoTianGongStart.Hour,Spring_DaNaoTianGongStart.Minute,Spring_DaNaoTianGongStart.Second)
       local nShiFouEnd = API_DiffDatatime(Spring_DaNaoTianGongEnd.Year,Spring_DaNaoTianGongEnd.Month,Spring_DaNaoTianGongEnd.Day,Spring_DaNaoTianGongEnd.Hour,Spring_DaNaoTianGongEnd.Minute,Spring_DaNaoTianGongEnd.Second)
       if nShiFouStart <= 0 and nShiFouEnd > 0 then    -------------在活动期间
	      if Spring_NianTuDaShiShuaGuo == 0 then
             for i = 1,table.getn(table_Spring_NianTuDaShiShuaPos) do
		         local NianTuDaShiFastID = table_Spring_NianTuDaShiFastID[i] 
		         if NianTuDaShiFastID == nil or API_GetMonsterID(NianTuDaShiFastID) <= 0 then
					local RightMapID = API_GetRightMapID(table_Spring_NianTuDaShiShuaPos[i].mapid)
					if API_MapIsValid(RightMapID) then
                       local FastID = API_CreateMonster(RightMapID,Spring_NianTuDaShi,table_Spring_NianTuDaShiShuaPos[i].x,table_Spring_NianTuDaShiShuaPos[i].y,5,0,-1)
                       table_Spring_NianTuDaShiFastID[i] = FastID
                       API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongOld,1,1,0)
                       API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongNew,1,1,0)
                       API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongToy,1,1,0)
                       API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongPiFeng,1,1,0)
					end
			     end
		     end
		     Spring_NianTuDaShiShuaGuo = 1
		  end
		  local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() ---------当前时间
		  if Minute == 30 or Minute == 0 then
             API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 17, '春节活动期间，可前往各主城和城镇的年兔大使处进入大闹天宫俘获黑年兔王！')
			 API_ActorBroadcastMsgLevelEx(-1, -1, 1, 0, 8, '春节活动期间，可前往各主城和城镇的年兔大使处进入大闹天宫俘获黑年兔王！')
		  end
	   elseif nShiFouEnd <= 0 then
	      if Spring_NianTuDaShiShuaGuo == 1 then
	         Spring_NianTuDaShiShuaGuo = 0
		     for j,v in table_Spring_NianTuDaShiFastID do
			     if API_GetMonsterID(v) > 0 then
				    API_DestroyMonster(v)
			     end
		     end
		     table_Spring_NianTuDaShiFastID = {}
		  end
	   end
    end
end



-------------点击年兔大使-------------------- 


function Spring_NianTuDaShiClick(ActorID,NPCID)
    local ActorID = ActorID or API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
    local MapID = API_GetActorMapID(ActorID)
    local InFactNum = 0

    if API_GetMonsterID(NPCFastID) <= 0 then
		API_ResponseEnd()
		API_ResponseClear()
		return
	end

    if XuanZe == 1 then
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 and API_GetTeamLeader(TeamID) == ActorID then
			API_ResponseWrite('<name>年兔大使</name>')
		    API_ResponseWrite('<br><text color="255,0,0">多给我几块年糕吧，我能让他们缴械时候掏出更多的东西！给得越多，得到的春节积分也越多。</text><br>')
		    API_ResponseWrite('<br><a href="Spring_NianTuDaShiClick?1=2">1个年糕</a><br>')
		    API_ResponseWrite('<br><a href="Spring_NianTuDaShiClick?1=3">10个年糕(掉落节日时装，新年家具)</a><br>')
		    API_ResponseWrite('<br><a href="Spring_NianTuDaShiClick?1=4">30个年糕(掉落节日时装，兔神时装，年兔宠物卡，兔神披风，新年家具)</a><br>')
		    API_ResponseWrite('<br><a>关闭</a><br>')
		else
			API_ResponseWrite('<name>年兔大使</name>')
			API_ResponseWrite('<br><text>我只和拥有队长权限的人协商，并且因为怪物的凶狠，需要你的队伍人数至少多于两人才能进入。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	elseif  XuanZe ~= 2 and XuanZe ~= 3 and XuanZe ~= 4 then
		API_ResponseWrite('<name>年兔大使</name>')
		API_ResponseWrite('<br><text>一群黑年兔在上面肆意妄为，大闹天宫。我遵从年兔娘娘的旨意，来到人间寻找勇士帮我们打退这群黑年兔。</text><br>')
		API_ResponseWrite('<br><text>可是我长途跋涉的来到这，已经耗尽了我的体力。给我几个年糕解解馋，让我带你们去那里吧！年糕就在旁边的福神处可购买。</text><br>')
		API_ResponseWrite('<br><text>击败黑年兔王后，还能得到春节积分呢！</text><br>')
		API_ResponseWrite('<br><a href="Spring_NianTuDaShiClick?1=1">给你年糕吧</a><br>')
		API_ResponseWrite('<br><a>我考虑一下</a><br>')
	end

    if  XuanZe == 2 or XuanZe == 3 or XuanZe == 4 then
		local LinShiBiao = {1,10,30}
	    local TeamID = API_GetTeamID(ActorID)
	    local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	    local TeamSize = API_GetTeamSize(TeamID)    ----------------------队伍人数
	    if TeamID <= 0  then
	       API_ResponseWrite('<name>年兔大使</name>')
           API_ResponseWrite('<br><text>你没有加入任何</text><text color="255,0,255">队伍</text><text>不能进入大闹天宫。</text><br>')
		   API_ResponseWrite('<br><a>确定</a><br>')
		   API_ResponseFlush(ActorID)
		   return
	    end
	    if API_GetTeamLeader(TeamID) ~= ActorID then
		   API_ResponseWrite('<name>年兔大使</name>')
           API_ResponseWrite('<br><text>你不是</text><text color="255,0,255">队长</text><text>，不能带领队伍进入大闹天宫。</text><br>')
		   API_ResponseWrite('<br><a>确定</a><br>')
		   API_ResponseFlush(ActorID)
		   return
		end
		if API_ActorGetGoodsNum(ActorID,Spring_NianGaoID) < LinShiBiao[XuanZe-1] then
		   API_ResponseWrite('<name>年兔大使</name>')
           API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">队长</text><text>身上要有'..LinShiBiao[XuanZe-1]..'个</text><text color="255,0,0">年糕</text><text>才能带领队伍进入大闹天宫。</text><br>')
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
               InFactNum = InFactNum + 1
			   if  TeamActorMapID ~= MapID then
				   API_ResponseWrite('<name>年兔大使</name>')
                   API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>不在同一场景中。</text><br>')
				   API_ResponseWrite('<br><a>确定</a><br>')
				   API_ResponseFlush(ActorID)
				   return
			   end

 			   if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
				  API_ResponseWrite('<name>年兔大使</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>正在快递，无法进入大闹天宫！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
			      return
			   end
			   if API_ActorFindStatus(TeamActorID,519) then
				  API_ResponseWrite('<name>年兔大使</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>正在摆摊，无法进入大闹天宫！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
			   end
			   if API_ActorIsDying(TeamActorID) then
				  API_ResponseWrite('<name>年兔大使</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>死亡，无法进入大闹天宫！</text><br>')
			      API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
			   end
			   if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
				  API_ResponseWrite('<name>年兔大使</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>在公交车上无法进入大闹天宫！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
			   end
			end
	    end
	    if InFactNum < 2 then
	       API_ResponseWrite('<name>年兔大使</name>')
	       API_ResponseWrite('<br><text>队伍中有队员不在同一场景中。</text><br>')
	       API_ResponseWrite('<br><a>确定</a><br>')
	       API_ResponseFlush(ActorID)
	       return
	    end
	    if API_ActorRemoveGoods(ActorID,Spring_NianGaoID,LinShiBiao[XuanZe-1],'删除春节年糕')  then
		   local ObjectMapID = API_CreateEctype(Spring_DaNaoTianGongFbID,0)  ---------------创建副本 
		   API_SetMapVarData(ObjectMapID,Spring_NianGaoEnterDrop,XuanZe)  -----副本交互刷新
		   for i in table_Spring_EnterNpcPos do
               local FastID = API_CreateMonster(ObjectMapID,Spring_DaNaoTianGongFbExit,table_Spring_EnterNpcPos[i].x,table_Spring_EnterNpcPos[i].y,3,0,-1)
		   end
		   API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'Spring_DaNaoTianGongPlayGotoMap')
		   local LaiYuan = API_ActorGetPropNum(ActorID,201)
		   local Type = 0
           if XuanZe == 2 then ----1个年糕 
              Type = 1
           elseif XuanZe == 3 then ----10个年糕
              Type = 2
           elseif XuanZe == 4 then ----30个年糕
              Type = 3
           end
           if Type ~= 0 then
              if GLOBAL_FengXiangBiao_DateList[65][Type][LaiYuan] == nil then
                 GLOBAL_FengXiangBiao_DateList[65][Type][LaiYuan] = 1
              else
                 GLOBAL_FengXiangBiao_DateList[65][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[65][Type][LaiYuan] + 1
              end
           end
		   
	   end  
	end	
	API_ResponseFlush(ActorID)
end

function Spring_DaNaoTianGongPlayGotoMap(ObjectMapID,ActorID)
	--判断是否有队伍，是的话一起传进去
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorIsOnline(ActorID) then
	    local MaxLevel = 0   --------队伍中最高等级
	    local SumLevel = 0   --------队伍中等级总和
	    local InFactSize = 0   --------实际人数
		local MapID = API_GetActorMapID(ActorID)
		--判断组队
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID then
				   API_ActorGoToMap(TeamActorID,ObjectMapID,Spring_DaNaoTianGongEnterPosX,Spring_DaNaoTianGongEnterPosY)
				   local TeamActorIDLevel = API_GetActorExpLevel(TeamActorID)
				   MaxLevel = math.max(MaxLevel,TeamActorIDLevel)
				   SumLevel = SumLevel + TeamActorIDLevel
				   InFactSize = InFactSize + 1
				end
			end
			local AveLevel = math.max(math.floor(SumLevel/InFactSize),MaxLevel - 5) ----------副本怪物等级
			local MonsterID = Spring_DaNaoTianGongFbGuaiID-1+AveLevel
			API_SetMapVarData(ObjectMapID,Spring_DanNaoTianGongLevel,AveLevel)-----副本交互刷新 
			API_SetMapVarData(ObjectMapID,Spring_DanNaoTianDieNum,0)   -----副本交互刷新
			API_SetMapVarData(ObjectMapID,Spring_DanNaoTianBossShua,0) -----副本交互刷新
			API_SetMapVarData(ObjectMapID,Spring_DanNaoTianUseTime,os.time()) -----副本交互刷新
			API_SetMapVarData(ObjectMapID,Spring_DanNaoTianBossDie,0) -----副本交互刷新
			API_SetMapVarData(ObjectMapID,Spring_DanNaoTianDaoShu,20) -----副本交互刷新
			for i in Spring_DaNaoTianGongGuaiPos do   ----------刷怪 
               local FastID = API_CreateMonster(ObjectMapID,MonsterID,Spring_DaNaoTianGongGuaiPos[i].x,Spring_DaNaoTianGongGuaiPos[i].y,3,0,-1)
               API_CreateDieTriggerG(ObjectMapID,ActorID,0,FastID,'Spring_DaNaoTianGongDieFunc') --------副本操作和掉落
		    end
		    API_CreateTimerTriggerG(ObjectMapID,0,1,-1,'Spring_XianShiNianTuSiFunc')
		end	
	end
end

function Spring_XianShiNianTuSiFunc(MapID,b)
    if MapID <= 0 then
		return
	end
	if not API_MapIsValid(MapID) then
		return
	end
	if API_GetMapVarData(MapID,Spring_DanNaoTianBossDie) == 0  then
	   local miao = API_GetMapVarData(MapID,Spring_DanNaoTianXianShiMiao)
	   miao = miao + 1
	   API_SetMapVarData(MapID,Spring_DanNaoTianXianShiMiao,miao)
	   if miao >= 86400 then
	      miao = 86400
	   end
	end
	local infoshuchu = ''
    if API_GetMapVarData(MapID,Spring_DanNaoTianBossDie) == 0 then
       local info1 = '击杀所有黑年兔小卒,黑年兔王将会出现\n'
       local info2 = '已进入副本:'..API_GetMapVarData(MapID,Spring_DanNaoTianXianShiMiao)..'秒\n'
       local info3 = '击杀数量       '..API_GetMapVarData(MapID,Spring_DanNaoTianDieNum)..'/'..table.getn(Spring_DaNaoTianGongGuaiPos)
	   infoshuchu = info1..info2..info3
	else
	   infoshuchu = ''
	end
	if API_GetMapConfigID(MapID) == 2034 then    ---------配置ID不是大闹天宫的不发消息
	   API_ActorBroadcastMsg(MapID,4,infoshuchu)
	end
end



---------------掉落和副本操作-----------------

function Spring_DaNaoTianGongDieFunc(MapID,ActorID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
    if MapID <= 0 then
		return
	end
	if not API_MapIsValid(MapID) then
		return
	end
	local Num1 = API_GetMapVarData(DynamicMapID,Spring_DanNaoTianDieNum) ----------先算上这个怪的数
	Num1 = Num1 + 1
	API_SetMapVarData(DynamicMapID,Spring_DanNaoTianDieNum,Num1)
	local TeamID = API_GetTeamID(ActorID)
	local GuaiDieNum = API_GetMapVarData(DynamicMapID,Spring_DanNaoTianDieNum)
	local Judge = API_GetMapVarData(DynamicMapID,Spring_DanNaoTianBossShua)
	
	if GuaiDieNum >= table.getn(Spring_DaNaoTianGongGuaiPos) then
	   if Judge < 1 then
	      API_SetMapVarData(DynamicMapID,Spring_DanNaoTianBossShua,Judge+1)
	      local AveLevel = API_GetMapVarData(DynamicMapID,Spring_DanNaoTianGongLevel)
	      local MonsterID = Spring_DaNaoTianGongFbBossGuaiID-1+AveLevel
	      local FastID = API_CreateMonster(MapID,MonsterID,Spring_DanNaoTianFbBossPosX,Spring_DanNaoTianFbBossPosY,3,0,-1)
          API_CreateDieTriggerG(DynamicMapID,ActorID,0,FastID,'Spring_DaNaoTianGongBossDieFunc') --------掉落
          API_ActorBroadcastMsg(DynamicMapID,1,'黑年兔王出现在隧道的中间！')
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
    local Zhi = API_GetMapVarData(DynamicMapID,Spring_NianGaoEnterDrop)
    local XuanZe = Zhi - 1
    if XuanZe ~= 0 and XuanZe <= 3 then
    else
       XuanZe = 1
    end
	local GoodTable = Spring_NianTuDaShiShuaGuoFbGoodsID[XuanZe]
	for j in GoodTable do
		local GaiLv1 = GoodTable[j].GaiLv
		local GaiLv = math.random(1000000)
		if GaiLv <= GaiLv1 then
		   local GoodsID = GoodTable[j].GoodsID
		   local Num  = GoodTable[j].GoodsNum
		   local PinZhi  = GoodTable[j].PinZhi
           if PinZhi > 0 then
              API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,Num,0,'大闹天宫副本怪物掉落',GuiShuType,WhatID,600,120,PinZhi)
		   else
              API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsID,Num,0,'大闹天宫副本怪物掉落',GuiShuType,WhatID,600,120)
		   end
		   if GoodsID == 89038 then                                            -- 兔子茸毛 
		      if GLOBAL_FengXiangBiao_DateList[65][7][1] == nil then
                 GLOBAL_FengXiangBiao_DateList[65][7][1] = 1
              else
                 GLOBAL_FengXiangBiao_DateList[65][7][1] = GLOBAL_FengXiangBiao_DateList[65][7][1] + 1
              end
		   end
		end
	end
end

------------------副本BOSS掉落---------------
function Spring_DaNaoTianGongBossDieFunc(MapID,ActorID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
    if MapID <= 0 then
		return
	end
	if not API_MapIsValid(MapID) then
		return
	end
	API_SetMapVarData(MapID,Spring_DanNaoTianBossDie,1)
    local Zhi = API_GetMapVarData(DynamicMapID,Spring_NianGaoEnterDrop)
    local XuanZe = Zhi - 1
    if XuanZe ~= 0 and XuanZe <= 3 then
    else
       XuanZe = 1
    end
    local Spring_ZhuanHuan = {
   [11009] = '节日招财帽[白银男装]',
   [11010] = '节日招财装[白银男装]',
   [11011] = '节日鸿运帽[白银女装]',
   [11012] = '节日鸿运装[白银女装]',
   [11330] = '兔乖乖头饰（女装）',
   [11331] = '福兔新年装（女装）',
   [11332] = '兔儿爷棉帽（男装）',
   [11333] = '福兔新年装（男装）',
   [31040] = '年兔宝宝卡',
   [11334] = '兔神披风',

}
	local GoodTable = Spring_NianTuDaShiShuaGuoFbBossGoodsID[XuanZe]
	local x1,y1,x2,y2 = 178,129,195,145
	for j in GoodTable do
		local GaiLv1 = GoodTable[j].GaiLv
		local GaiLv = math.random(1000000)
		if GaiLv <= GaiLv1 then
		   local GoodsID = GoodTable[j].GoodsID
		   local GoodsNum  = GoodTable[j].GoodsNum
		   local PinZhi  = GoodTable[j].PinZhi
		   local x,y
		   local Num = 0
		   if GoodsID == '旧时装' then ------
			  local Biao = {11009,11010,11011,11012}
			  local Ran = math.random(table.getn(Biao))
			  GoodsID = Biao[Ran]
		   elseif GoodsID == '新时装' then ---------
		      local Biao = {11330,11331,11332,11333}
			  local Ran = math.random(table.getn(Biao))
			  GoodsID = Biao[Ran]
		   elseif GoodsID == '家具' then
              local Biao = {38352,38353,38354,38355,38356,38357,38358,38359,38360}
			  local Ran = math.random(table.getn(Biao))
			  GoodsID = Biao[Ran]
		   end
		   local nShiFouStart = API_DiffDatatime(Spring_AiMuZhiXinStart.Year,Spring_AiMuZhiXinStart.Month,Spring_AiMuZhiXinStart.Day,Spring_AiMuZhiXinStart.Hour,Spring_AiMuZhiXinStart.Minute,Spring_AiMuZhiXinStart.Second)
           local nShiFouEnd = API_DiffDatatime(Spring_AiMuZhiXinEnd.Year,Spring_AiMuZhiXinEnd.Month,Spring_AiMuZhiXinEnd.Day,Spring_AiMuZhiXinEnd.Hour,Spring_AiMuZhiXinEnd.Minute,Spring_AiMuZhiXinEnd.Second)
           if nShiFouStart > 0 and nShiFouEnd <= 0 then    -------------在活动期间外不掉爱慕之心
		      if GoodsID == 88952 then
                 GoodsID = 80498
                 GoodsNum = 10
		      end
		   end
		   if GoodsID == 11009 or GoodsID == 11010 or GoodsID == 11011 or GoodsID == 11012 or GoodsID == 11330 or GoodsID == 11331 or GoodsID == 11332 or GoodsID == 11333 or GoodsID == 31040 or GoodsID == 11334 then   ----如果是死神的话
--		      local Time = API_VarDataGetNumber_Ex(1,0,Spring_DaNaoTianGongFbGoodsCD,1,1)
--			  local NowTime = os.time()
--			  local CD = API_VarDataGetNumber_Ex(1,0,-6013,1,25)
--			  if CD > NowTime then
--                 GoodsID = 80498
--                 GoodsNum = 10
--			  else
--			     local CD = math.random(3*60,5*60)     ----时装和宠物共CD 
--			     API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongFbGoodsCD,1,1,CD)
--                 API_CreateTimerTriggerG(0,0,1,CD,'Spring_DaNaoTianGongDaoShuCD')
--						local Time = os.time() 
--						local Tsec = math.random(180,300)
--						local NextTime = Time + Tsec
--						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,25,NextTime)
--			  end
			  if API_VarDataGetNumber_Ex(1,0,Spring_DaNaoTianGongShuaXin,1,1) == 0 then
                 API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongShuaXin,1,1,os.date('*t').yday)
		      end
		      local Yday = API_VarDataGetNumber_Ex(1,0,Spring_DaNaoTianGongShuaXin,1,1)
		      if Yday ~= os.date('*t').yday then                   ------------------如果这一天已经过
                 API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongShuaXin,1,1,os.date('*t').yday) -------置为今天
                 API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongOld,1,1,0)
                 API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongNew,1,1,0)
                 API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongToy,1,1,0)
                 API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongPiFeng,1,1,0)
              end
			  local NowTime = os.time()
			  local CD = API_VarDataGetNumber_Ex(1,0,-6013,1,25)
		      if GoodsID == 11009 or GoodsID == 11010 or GoodsID == 11011 or GoodsID == 11012 then    -- 旧时装 
		         if API_VarDataGetNumber_Ex(1,0,Spring_DaNaoTianGongOld,1,1) >= 5 or CD > NowTime then
		            GoodsID = 80498
                    GoodsNum = 10
				 else
					 local NUM = API_VarDataGetNumber_Ex(1,0,Spring_DaNaoTianGongOld,1,1)
					 NUM = NUM + 1
					 API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongOld,1,1,NUM)				 
					local Time = os.time() 
					local Tsec = math.random(900,1500)
					local NextTime = Time + Tsec
					API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,25,NextTime)
		         end
--		         if GLOBAL_FengXiangBiao_DateList[65][9][1] == nil then
--                    GLOBAL_FengXiangBiao_DateList[65][9][1] = 1
--                 else
--                    GLOBAL_FengXiangBiao_DateList[65][9][1] = GLOBAL_FengXiangBiao_DateList[65][9][1] + 1
--                 end
		      end
		      if GoodsID == 11330 or GoodsID == 11331 or GoodsID == 11332 or GoodsID == 11333 then    -- 新时装
		         if API_VarDataGetNumber_Ex(1,0,Spring_DaNaoTianGongNew,1,1) >= 5 or CD > NowTime then
		            GoodsID = 80498
                    GoodsNum = 10
				 else
					 local NUM = API_VarDataGetNumber_Ex(1,0,Spring_DaNaoTianGongNew,1,1)
					 NUM = NUM + 1
					 API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongNew,1,1,NUM)				 
					local Time = os.time() 
					local Tsec = math.random(900,1500)
					local NextTime = Time + Tsec
					API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,25,NextTime)
		         end
--		         if GLOBAL_FengXiangBiao_DateList[65][4][1] == nil then
--                    GLOBAL_FengXiangBiao_DateList[65][4][1] = 1
--                 else
--                    GLOBAL_FengXiangBiao_DateList[65][4][1] = GLOBAL_FengXiangBiao_DateList[65][4][1] + 1
--                 end
		      end
		      if GoodsID == 31040 then                                                  -- 兔子宠物 
		         if API_VarDataGetNumber_Ex(1,0,Spring_DaNaoTianGongToy,1,1) >= 3 or CD > NowTime then
		            GoodsID = 80498
                    GoodsNum = 10
				 else
					 local NUM = API_VarDataGetNumber_Ex(1,0,Spring_DaNaoTianGongToy,1,1)
					 NUM = NUM + 1
					 API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongToy,1,1,NUM)				 
					local Time = os.time() 
					local Tsec = math.random(900,1500)
					local NextTime = Time + Tsec
					API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,25,NextTime)
		         end
--		         if GLOBAL_FengXiangBiao_DateList[65][5][1] == nil then
--                    GLOBAL_FengXiangBiao_DateList[65][5][1] = 1
--                 else
--                    GLOBAL_FengXiangBiao_DateList[65][5][1] = GLOBAL_FengXiangBiao_DateList[65][5][1] + 1
--                 end
		      end
		      if GoodsID == 11334 then                                                  -- 兔子披风 
		         if API_VarDataGetNumber_Ex(1,0,Spring_DaNaoTianGongPiFeng,1,1) >= 2 or CD > NowTime then
		            GoodsID = 80498
                    GoodsNum = 10
				 else
					 local NUM = API_VarDataGetNumber_Ex(1,0,Spring_DaNaoTianGongPiFeng,1,1)
					 NUM = NUM + 1
					 API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongPiFeng,1,1,NUM)				 
					local Time = os.time() 
					local Tsec = math.random(900,1500)
					local NextTime = Time + Tsec
					API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,25,NextTime)
		         end
--		         if GLOBAL_FengXiangBiao_DateList[65][6][1] == nil then
--                    GLOBAL_FengXiangBiao_DateList[65][6][1] = 1
--                 else
--                    GLOBAL_FengXiangBiao_DateList[65][6][1] = GLOBAL_FengXiangBiao_DateList[65][6][1] + 1
--                 end
		      end
		      if GoodsID == 88952 then                                            -- 爱慕之心 
		         if GLOBAL_FengXiangBiao_DateList[65][8][1] == nil then
                    GLOBAL_FengXiangBiao_DateList[65][8][1] = 1
                 else
                    GLOBAL_FengXiangBiao_DateList[65][8][1] = GLOBAL_FengXiangBiao_DateList[65][8][1] + 1
                 end
		      end
		      if GoodsID == 89038 then                                            -- 兔子茸毛 
		         if GLOBAL_FengXiangBiao_DateList[65][7][1] == nil then
                    GLOBAL_FengXiangBiao_DateList[65][7][1] = 1
                 else
                    GLOBAL_FengXiangBiao_DateList[65][7][1] = GLOBAL_FengXiangBiao_DateList[65][7][1] + 1
                 end
		      end
           end
		   repeat
		      Num = Num + 1
		      x = math.random(x1,x2)
		      y = math.random(y1,y2)
		   until not API_IsBlockTile(MapID,x,y,0) or Num == 100
		   if not API_IsBlockTile(MapID,x,y,0) then
			  if PinZhi > 0 then
				 API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,GoodsNum,0,'大闹天宫副本Boss掉落',4,0,600,60,PinZhi)
			  else
			     API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsID,GoodsNum,0,'大闹天宫副本Boss掉落',4,0,600,60)
			  end
			  if GoodsID == 11009 or GoodsID == 11010 or GoodsID == 11011 or GoodsID == 11012 or GoodsID == 11330 or GoodsID == 11331 or GoodsID == 11332 or GoodsID == 11333 or GoodsID == 31040 or GoodsID == 11334 then   ----如果是死神的话
			     local ShiZhuangName = Spring_ZhuanHuan[GoodsID]
			     if ShiZhuangName ~= nil then
			        API_ActorBDCMsg(-1,0,-1,1,65,0,17, '黑年兔王被【'..API_GetActorName(ActorID)..'】带领的队伍击败后，掉落价值不菲的'..ShiZhuangName..'！')
                    --API_ActorBDCMsg(-1,0,-1,1,65,0,8, '杰森伯爵被【'..API_GetActorName(ActorID)..'】带领的队伍打得落花流水，情急之间献上价值不菲的'..ShiZhuangName..'并连声求饶！')
			     end
				 --风向标
					if GoodsID == 11009 or GoodsID == 11010 or GoodsID == 11011 or GoodsID == 11012 then
						if GLOBAL_FengXiangBiao_DateList[65][9][1] == nil then
							GLOBAL_FengXiangBiao_DateList[65][9][1] = 1
						 else
							GLOBAL_FengXiangBiao_DateList[65][9][1] = GLOBAL_FengXiangBiao_DateList[65][9][1] + 1
						 end
					elseif GoodsID == 11330 or GoodsID == 11331 or GoodsID == 11332 or GoodsID == 11333 then
						 if GLOBAL_FengXiangBiao_DateList[65][4][1] == nil then
							GLOBAL_FengXiangBiao_DateList[65][4][1] = 1
						 else
							GLOBAL_FengXiangBiao_DateList[65][4][1] = GLOBAL_FengXiangBiao_DateList[65][4][1] + 1
						 end
					elseif GoodsID == 31040 then 
						 if GLOBAL_FengXiangBiao_DateList[65][5][1] == nil then
							GLOBAL_FengXiangBiao_DateList[65][5][1] = 1
						 else
							GLOBAL_FengXiangBiao_DateList[65][5][1] = GLOBAL_FengXiangBiao_DateList[65][5][1] + 1
						 end
					elseif GoodsID == 11334 then 
						 if GLOBAL_FengXiangBiao_DateList[65][6][1] == nil then
							GLOBAL_FengXiangBiao_DateList[65][6][1] = 1
						 else
							GLOBAL_FengXiangBiao_DateList[65][6][1] = GLOBAL_FengXiangBiao_DateList[65][6][1] + 1
						 end
					end
			  end
		   end
		end
	end
    API_CreateTimerTriggerG(DynamicMapID,0,1,21,'Spring_XianShiJieSuanDaoShuFunc')
end

function Spring_XianShiJieSuanDaoShuFunc(MapID,b)
	local time = API_GetMapVarData(MapID,Spring_DanNaoTianDaoShu)
	time = time - 1
	API_SetMapVarData(MapID,Spring_DanNaoTianDaoShu,time)
	if time > 0 then
	   API_ActorBroadcastMsg(MapID,1,time..'秒后进行春节积分结算！')
	elseif time == 0 then
	   local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
	   if table.getn(PlayList) ~= 0 then
	      for j,v in PlayList do
			  local time = API_GetMapVarData(MapID,Spring_DanNaoTianXianShiMiao)
              Spring_DaNaoTianGongJieSuanFunc(v,MapID,time)-----结算函数
          end
	   end
	end
end

function Spring_DaNaoTianGongJieSuanFunc(ActorID,MapID,Time)

    local Award = ''
    Award = Award..'<award success="1" money="0" Exp="0" Crystal="0">'
    Award = Award..'<bijou></bijou>'
    Award = Award..'<goods></goods>'
	Award = Award..'</award>'
	local Zhi = API_GetMapVarData(MapID,Spring_NianGaoEnterDrop)
    local XuanZe = Zhi - 1
    if XuanZe ~= 0 and XuanZe <= 3 then
    else
       XuanZe = 1
    end
    local XiShu = 1
    if XuanZe == 1 then
       XiShu = 1
    elseif XuanZe == 2 then
       XiShu = 1.5
    else
       XiShu = 2
    end
	--（1200*1200-完成时间*完成时间）/(完成时间*100)
	local JiFen = math.ceil((1200*1200-Time*Time)/(Time*100)*XiShu)
	if JiFen > math.ceil(45*XiShu) then
	   JiFen = math.ceil(45*XiShu)
	elseif JiFen < 1 then
	   JiFen = 1
	end
	local Fen = API_VarDataGetNumber(ActorID,1,30237)
	Fen = JiFen + Fen
	API_VarDataSetNumber(ActorID,1,30237,Fen)
    local ActorGrade = '<Hero bosskill="1" boosnum="1">'
    ActorGrade = ActorGrade..'<lt>耗用时间,'..Time..','..Time..','..Time..'</lt>'
    ActorGrade = ActorGrade..'<lt>春节积分,'..JiFen..','..JiFen..','..JiFen..'</lt>'
    ActorGrade = ActorGrade..'</Hero>'
    local Other = '<Other><Description></Description></Other>'
	API_ActorBalanceUpdate(ActorID,1,0,ActorGrade)
	API_ActorBalanceUpdate(ActorID,3,0,Award)
	API_ActorBalanceUpdate(ActorID,6,0,Other)
	API_ActorBalanceUpdate(ActorID,4,0,'')

end


function Spring_DaNaoTianGongDaoShuCD(a,b)
	local Time = API_VarDataGetNumber_Ex(1,0,Spring_DaNaoTianGongFbGoodsCD,1,1)
	Time = Time -1
    API_VarDataSetNumber_Ex_Sync(1,0,Spring_DaNaoTianGongFbGoodsCD,1,1,Time)
end