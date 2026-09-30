API_AddLUAReqFunc("GFSQ_HeiYe")
API_AddLUAReqFunc("GFSQ_CaoZuo")



local LHGM_Table = {
[90400]={sx=789,zy=100,limt=0,cgl=65,bfb=0,tbbj=1,jsq=0},--供奉神祇-攻击
[90401]={sx=789,zy=200,limt=0,cgl=55,bfb=0,tbbj=1,jsq=1},--供奉神祇-攻击1
[90402]={sx=789,zy=300,limt=0,cgl=45,bfb=0,tbbj=1,jsq=2},--供奉神祇-攻击2
[90403]={sx=789,zy=400,limt=0,cgl=35,bfb=0,tbbj=1,jsq=3},--供奉神祇-攻击3
[90404]={sx=789,zy=500,limt=0,cgl=25,bfb=0,tbbj=1,jsq=4},--供奉神祇-攻击4
[90405]={sx=789,zy=600,limt=0,cgl=15,bfb=0,tbbj=1,jsq=5},--供奉神祇-攻击5
[90406]={sx=789,zy=700,limt=0,cgl=5,bfb=0,tbbj=1,jsq=6},--供奉神祇-攻击6
[90407]={sx=789,zy=800,limt=0,cgl=3,bfb=0,tbbj=1,jsq=7},--供奉神祇-攻击7
[90408]={sx=789,zy=900,limt=0,cgl=1,bfb=0,tbbj=1,jsq=8},--供奉神祇-攻击8
[90409]={sx=789,zy=1000,limt=1,cgl=0,bfb=0,tbbj=1,jsq=9},--供奉神祇-攻击9
[90410]={sx=15,zy=100,limt=0,cgl=65,bfb=0,tbbj=2,jsq=0},--供奉神祇-基防
[90411]={sx=15,zy=200,limt=0,cgl=55,bfb=0,tbbj=2,jsq=1},--供奉神祇-基防1
[90412]={sx=15,zy=300,limt=0,cgl=45,bfb=0,tbbj=2,jsq=2},--供奉神祇-基防2
[90413]={sx=15,zy=400,limt=0,cgl=35,bfb=0,tbbj=2,jsq=3},--供奉神祇-基防3
[90414]={sx=15,zy=500,limt=0,cgl=25,bfb=0,tbbj=2,jsq=4},--供奉神祇-基防4
[90415]={sx=15,zy=600,limt=0,cgl=15,bfb=0,tbbj=2,jsq=5},--供奉神祇-基防5
[90416]={sx=15,zy=700,limt=0,cgl=5,bfb=0,tbbj=2,jsq=6},--供奉神祇-基防6
[90417]={sx=15,zy=800,limt=0,cgl=3,bfb=0,tbbj=2,jsq=7},--供奉神祇-基防7
[90418]={sx=15,zy=900,limt=0,cgl=1,bfb=0,tbbj=2,jsq=8},--供奉神祇-基防8
[90419]={sx=15,zy=1000,limt=1,cgl=0,bfb=0,tbbj=2,jsq=9},--供奉神祇-基防9
[90420]={sx=4,zy=2,limt=0,cgl=65,bfb=1,tbbj=3,jsq=0},--供奉神祇-生命百分比
[90421]={sx=4,zy=4,limt=0,cgl=55,bfb=1,tbbj=3,jsq=1},--供奉神祇-生命百分比1
[90422]={sx=4,zy=6,limt=0,cgl=45,bfb=1,tbbj=3,jsq=2},--供奉神祇-生命百分比2
[90423]={sx=4,zy=8,limt=0,cgl=35,bfb=1,tbbj=3,jsq=3},--供奉神祇-生命百分比3
[90424]={sx=4,zy=10,limt=0,cgl=25,bfb=1,tbbj=3,jsq=4},--供奉神祇-生命百分比4
[90425]={sx=4,zy=12,limt=0,cgl=15,bfb=1,tbbj=3,jsq=5},--供奉神祇-生命百分比5
[90426]={sx=4,zy=14,limt=0,cgl=5,bfb=1,tbbj=3,jsq=6},--供奉神祇-生命百分比6
[90427]={sx=4,zy=16,limt=0,cgl=3,bfb=1,tbbj=3,jsq=7},--供奉神祇-生命百分比7
[90428]={sx=4,zy=18,limt=0,cgl=1,bfb=1,tbbj=3,jsq=8},--供奉神祇-生命百分比8
[90429]={sx=4,zy=20,limt=1,cgl=0,bfb=1,tbbj=3,jsq=9},--供奉神祇-生命百分比9
[90430]={sx=37,zy=3,limt=0,cgl=65,bfb=1,tbbj=4,jsq=0},--供奉神祇-伤害加深
[90431]={sx=37,zy=6,limt=0,cgl=55,bfb=1,tbbj=4,jsq=1},--供奉神祇-伤害加深1
[90432]={sx=37,zy=9,limt=0,cgl=45,bfb=1,tbbj=4,jsq=2},--供奉神祇-伤害加深2
[90433]={sx=37,zy=12,limt=0,cgl=35,bfb=1,tbbj=4,jsq=3},--供奉神祇-伤害加深3
[90434]={sx=37,zy=15,limt=0,cgl=25,bfb=1,tbbj=4,jsq=4},--供奉神祇-伤害加深4
[90435]={sx=37,zy=18,limt=0,cgl=15,bfb=1,tbbj=4,jsq=5},--供奉神祇-伤害加深5
[90436]={sx=37,zy=21,limt=0,cgl=5,bfb=1,tbbj=4,jsq=6},--供奉神祇-伤害加深6
[90437]={sx=37,zy=24,limt=0,cgl=3,bfb=1,tbbj=4,jsq=7},--供奉神祇-伤害加深7
[90438]={sx=37,zy=27,limt=0,cgl=1,bfb=1,tbbj=4,jsq=8},--供奉神祇-伤害加深8
[90439]={sx=37,zy=30,limt=1,cgl=0,bfb=1,tbbj=4,jsq=9},--供奉神祇-伤害加深9
[90440]={sx=38,zy=3,limt=0,cgl=65,bfb=1,tbbj=5,jsq=0},--供奉神祇-伤害减少
[90441]={sx=38,zy=6,limt=0,cgl=55,bfb=1,tbbj=5,jsq=1},--供奉神祇-伤害减少1
[90442]={sx=38,zy=9,limt=0,cgl=45,bfb=1,tbbj=5,jsq=2},--供奉神祇-伤害减少2
[90443]={sx=38,zy=12,limt=0,cgl=35,bfb=1,tbbj=5,jsq=3},--供奉神祇-伤害减少3
[90444]={sx=38,zy=15,limt=0,cgl=25,bfb=1,tbbj=5,jsq=4},--供奉神祇-伤害减少4
[90445]={sx=38,zy=18,limt=0,cgl=15,bfb=1,tbbj=5,jsq=5},--供奉神祇-伤害减少5
[90446]={sx=38,zy=21,limt=0,cgl=5,bfb=1,tbbj=5,jsq=6},--供奉神祇-伤害减少6
[90447]={sx=38,zy=24,limt=0,cgl=3,bfb=1,tbbj=5,jsq=7},--供奉神祇-伤害减少7
[90448]={sx=38,zy=27,limt=0,cgl=1,bfb=1,tbbj=5,jsq=8},--供奉神祇-伤害减少8
[90449]={sx=38,zy=30,limt=1,cgl=0,bfb=1,tbbj=5,jsq=9},--供奉神祇-伤害减少9


}

local sxsm = {
[789] ='三系攻击',
[15] ='基础防御',
[4] ='生命上限',
[37] ='伤害加深',
[38] ='伤害减少',
}




function GFSQ_HeiYe()
local ActorID = API_RequestGetActorID()
local QL1 = API_VarDataGetNumber(ActorID,1,21501)
local QL2 = API_VarDataGetNumber(ActorID,1,21502)
local QL3 = API_VarDataGetNumber(ActorID,1,21503)
local QL4 = API_VarDataGetNumber(ActorID,1,21504)
local QL5 = API_VarDataGetNumber(ActorID,1,21505)
API_ResponseWrite('<name>   供奉神祇</name>')	
API_ResponseWrite('<win rect="250,250,500,400"  move="1" alpha="200" balpha="200"></win>')
API_ResponseWrite('<text color="255,255,255">说明：上交材料可以获得神祇的赐福，供奉道具为“神灵铜钱”和“金币”和“古仙令”</text>')
API_ResponseWrite('<br><text>      </text><br><br>')
if QL1 == 0 then
API_ResponseWrite('<goodsHolder name="100">')
else
API_ResponseWrite('<text> </text>')
API_ResponseWrite('<img srcgd="'..API_VarDataGetNumber(ActorID,1,21501)..'" tipgd="'..API_VarDataGetNumber(ActorID,1,21501)..'">')
end
if QL1 == 0 then
API_ResponseWrite('<text>   </text>')
API_ResponseWrite('<a href="GFSQ_CaoZuo?1=1&2=1" color="0,255,0">剑之神赐福+三系攻击</a><br><br>')
else
API_ResponseWrite('<text>   </text>')
API_ResponseWrite('<a href="GFSQ_CaoZuo?1=1&2=2" color="0,255,0">取消剑之神赐福+三系攻击</a><br><br>')
end

if QL2 == 0 then
API_ResponseWrite('<goodsHolder name="200">')
else
API_ResponseWrite('<text> </text>')
API_ResponseWrite('<img srcgd="'..API_VarDataGetNumber(ActorID,1,21502)..'" tipgd="'..API_VarDataGetNumber(ActorID,1,21502)..'">')
end
if QL2 == 0 then
API_ResponseWrite('<text>   </text>')
API_ResponseWrite('<a href="GFSQ_CaoZuo?1=1&2=3" color="0,255,0">泰坦之神赐福+基础防御</a><br><br>')
else
API_ResponseWrite('<text>   </text>')
API_ResponseWrite('<a href="GFSQ_CaoZuo?1=1&2=4" color="0,255,0">取消泰坦之神赐福+基础防御</a><br><br>')
end

if QL3 == 0 then
API_ResponseWrite('<goodsHolder name="300">')
else
API_ResponseWrite('<text> </text>')
API_ResponseWrite('<img srcgd="'..API_VarDataGetNumber(ActorID,1,21503)..'" tipgd="'..API_VarDataGetNumber(ActorID,1,21503)..'">')
end
if QL3 == 0 then
API_ResponseWrite('<text>   </text>')
API_ResponseWrite('<a href="GFSQ_CaoZuo?1=1&2=5" color="0,255,0">生命之神赐福+生命上限</a><br><br>')
else
API_ResponseWrite('<text>   </text>')
API_ResponseWrite('<a href="GFSQ_CaoZuo?1=1&2=6" color="0,255,0">取消生命之神赐福+生命上限</a><br><br>')
end

if QL4 == 0 then
API_ResponseWrite('<goodsHolder name="400">')
else
API_ResponseWrite('<text> </text>')
API_ResponseWrite('<img srcgd="'..API_VarDataGetNumber(ActorID,1,21504)..'" tipgd="'..API_VarDataGetNumber(ActorID,1,21504)..'">')
end
if QL4 == 0 then
API_ResponseWrite('<text>   </text>')
API_ResponseWrite('<a href="GFSQ_CaoZuo?1=1&2=7" color="0,255,0">死亡之神赐福+伤害加深</a><br><br>')
else
API_ResponseWrite('<text>   </text>')
API_ResponseWrite('<a href="GFSQ_CaoZuo?1=1&2=8" color="0,255,0">取消死亡之神赐福+伤害加深</a><br><br>')
end

if QL5 == 0 then
API_ResponseWrite('<goodsHolder name="500">')
else
API_ResponseWrite('<text> </text>')
API_ResponseWrite('<img srcgd="'..API_VarDataGetNumber(ActorID,1,21505)..'" tipgd="'..API_VarDataGetNumber(ActorID,1,21505)..'">')
end
if QL5 == 0 then
API_ResponseWrite('<text>   </text>')
API_ResponseWrite('<a href="GFSQ_CaoZuo?1=1&2=9" color="0,255,0">守护之神赐福+伤害减少</a><br><br>')
else
API_ResponseWrite('<text>   </text>')
API_ResponseWrite('<a href="GFSQ_CaoZuo?1=1&2=10" color="0,255,0">取消守护之神赐福+伤害减少</a><br><br>')
end
end









local tebiebuff = {
[89735] = 1148001,
[89736] = 1148002,
[89737] = 1148003,
[89738] = 1148004,
[89739] = 1148005,
[89740] = 1148006,
[89741] = 1148007,
[89742] = 1148008,
[89743] = 1148009,
}



function GFSQ_CaoZuo()

local ActorID = API_RequestGetActorID()
local XuanZe = API_RequestGetNumber(1)
local UidHigh1 = API_RequestGetNumber(100)--高位UID
local UidLow1 = API_RequestGetNumber(1100)--低位UID
local Uid1 = API_GetUID(UidHigh1,UidLow1) --获取UID
local BoxID1,LocID1 = API_GetUIDGoodsInActor(Uid1,ActorID)--背包ID 和 位置
local GoodsID1 = API_GetUIDGoodsPropNum(Uid1,0)--提交的物品ID
local UidHigh2 = API_RequestGetNumber(200)--高位UID
local UidLow2 = API_RequestGetNumber(1200)--低位UID
local Uid2 = API_GetUID(UidHigh2,UidLow2) --获取UID	
local BoxID2,LocID2 = API_GetUIDGoodsInActor(Uid2,ActorID)--背包ID 和 位置
local GoodsID2 = API_GetUIDGoodsPropNum(Uid2,0)--提交的物品ID
local UidHigh3 = API_RequestGetNumber(300)--高位UID
local UidLow3 = API_RequestGetNumber(1300)--低位UID
local Uid3 = API_GetUID(UidHigh3,UidLow3) --获取UID	
local BoxID3,LocID3 = API_GetUIDGoodsInActor(Uid3,ActorID)--背包ID 和 位置
local GoodsID3 = API_GetUIDGoodsPropNum(Uid3,0)--提交的物品ID
local GoodsNum3 = API_GetUIDGoodsPropNum(Uid3,3)--提交的物品数量


local UidHigh4 = API_RequestGetNumber(400)--高位UID
local UidLow4 = API_RequestGetNumber(1400)--低位UID
local Uid4 = API_GetUID(UidHigh4,UidLow4) --获取UID	
local BoxID4,LocID4 = API_GetUIDGoodsInActor(Uid4,ActorID)--背包ID 和 位置
local GoodsID4 = API_GetUIDGoodsPropNum(Uid4,0)--提交的物品ID
local UidHigh5 = API_RequestGetNumber(500)--高位UID
local UidLow5 = API_RequestGetNumber(1500)--低位UID
local Uid5 = API_GetUID(UidHigh5,UidLow5) --获取UID	
local BoxID5,LocID5 = API_GetUIDGoodsInActor(Uid5,ActorID)--背包ID 和 位置
local GoodsID5 = API_GetUIDGoodsPropNum(Uid5,0)--提交的物品ID
local GoodsNum5 = API_GetUIDGoodsPropNum(Uid5,3)--提交的物品数量


local ActorName = API_GetActorName(ActorID)
if XuanZe == 1 then
--第一个
if API_RequestGetNumber(2) == 1 then
if BoxID1 < 0 then  API_ActorSendMsg(ActorID,3,'有问题请及时联系群主')  return end
    if  LHGM_Table[GoodsID1].tbbj == 1 then
	API_ActorRemoveGoodsOfLoc(ActorID,GoodsID1,1,BoxID1,LocID1, '暂时移除供奉神祇系列装备') 
	API_VarDataSetNumber(ActorID,1,21501,GoodsID1)
	API_AddActorEffectProp(ActorID,7,LHGM_Table[GoodsID1].zy)
	API_AddActorEffectProp(ActorID,8,LHGM_Table[GoodsID1].zy)
	API_AddActorEffectProp(ActorID,9,LHGM_Table[GoodsID1].zy)
	API_ActorBroadcastMsg(-1,17,'神祇信徒('..ActorName..')成功装备['..API_GetGoodsName(GoodsID1)..'],神祇赐福'..LHGM_Table[GoodsID1].zy..sxsm[LHGM_Table[GoodsID1].sx])
	API_Trace(''..ActorName..'成功装备['..API_GetGoodsName(GoodsID1)..'],神祇赐福'..LHGM_Table[GoodsID1].zy..''..sxsm[LHGM_Table[GoodsID1].sx]..'')	
	
	else
	API_ResponseWrite('<br><text>请放入供奉神祇攻击系列装备,不要空放或者放入其他系列装备。</text><br>') 
	API_ResponseWrite('<br><br><a>确定</a>')
	return
	end
   end

if API_RequestGetNumber(2) == 2 then

  if API_ActorGetPackageSize(ActorID) >= 1 then
   if API_VarDataGetNumber(ActorID,1,21501) > 0 then
     API_AddActorGoodsFlag(ActorID,API_VarDataGetNumber(ActorID,1,21501),1,3,'神祇已取消对('..ActorName..')的赐福,物品返回背包')
	 API_AddActorEffectProp(ActorID,7,-LHGM_Table[API_VarDataGetNumber(ActorID,1,21501)].zy)
	 API_AddActorEffectProp(ActorID,8,-LHGM_Table[API_VarDataGetNumber(ActorID,1,21501)].zy)
	 API_AddActorEffectProp(ActorID,9,-LHGM_Table[API_VarDataGetNumber(ActorID,1,21501)].zy)
     API_VarDataSetNumber(ActorID,1,21501,0)
	API_ActorSendMsg(ActorID,17,'神祇已取消对('..ActorName..')的赐福,物品已返回背包')	 
   end
  else
	API_ActorSendMsg(ActorID,3, "背包至少留出1个空格")
  end
 end
  
--第二个
if API_RequestGetNumber(2) == 3 then
if BoxID2 < 0 then  API_ActorSendMsg(ActorID,3,'有问题请及时联系群主')  return end
    if  LHGM_Table[GoodsID2].tbbj == 2 then
	API_ActorRemoveGoodsOfLoc(ActorID,GoodsID2,1,BoxID2,LocID2, '暂时移除供奉神祇系列装备')
	API_VarDataSetNumber(ActorID,1,21502,GoodsID2)
	API_AddActorEffectProp(ActorID,LHGM_Table[GoodsID2].sx,LHGM_Table[GoodsID2].zy)
	API_ActorBroadcastMsg(-1,17,'神祇信徒('..ActorName..')成功装备['..API_GetGoodsName(GoodsID2)..'],神祇赐福'..LHGM_Table[GoodsID2].zy..''..sxsm[LHGM_Table[GoodsID2].sx]..'')
	API_Trace(''..ActorName..'成功装备['..API_GetGoodsName(GoodsID2)..'],神祇赐福'..LHGM_Table[GoodsID2].zy..''..sxsm[LHGM_Table[GoodsID2].sx]..'')		
	
	else
	API_ResponseWrite('<br><text>请放入供奉神祇攻击系列装备,不要空放或者放入其他系列装备。</text><br>') 
	API_ResponseWrite('<br><br><a>确定</a>')
	return
	
   end
end
if API_RequestGetNumber(2) == 4 then

  if API_ActorGetPackageSize(ActorID) >= 1 then
   if API_VarDataGetNumber(ActorID,1,21502) > 0 then
     API_AddActorGoodsFlag(ActorID,API_VarDataGetNumber(ActorID,1,21502),1,3,'神祇已取消对('..ActorName..')的赐福,物品已返回背包')
	 API_AddActorEffectProp(ActorID,LHGM_Table[API_VarDataGetNumber(ActorID,1,21502)].sx,-LHGM_Table[API_VarDataGetNumber(ActorID,1,21502)].zy)
     API_VarDataSetNumber(ActorID,1,21502,0)
	API_ActorSendMsg(ActorID,17,'神祇已取消对('..ActorName..')的赐福,物品已返回背包')		 
   end
  else
	API_ActorSendMsg(ActorID,3, "背包至少留出1个空格")
  end
 end
 --第三个
 if API_RequestGetNumber(2) == 5 then
if BoxID3 < 0 then  API_ActorSendMsg(ActorID,3,'有问题请及时联系群主')  return end
    if  LHGM_Table[GoodsID3].tbbj == 3 then
	API_ActorRemoveGoodsOfLoc(ActorID,GoodsID3,1,BoxID3,LocID3, '暂时移除供奉神祇系列装备')
	API_VarDataSetNumber(ActorID,1,21503,GoodsID3)
	API_AddActorEffectProp(ActorID,LHGM_Table[GoodsID3].sx,LHGM_Table[GoodsID3].zy*10)
	API_ActorBroadcastMsg(-1,17,'神祇信徒('..ActorName..')成功装备['..API_GetGoodsName(GoodsID3)..'],神祇赐福'..LHGM_Table[GoodsID3].zy..'%的'..sxsm[LHGM_Table[GoodsID3].sx]..'')
	API_Trace(''..ActorName..'成功装备['..API_GetGoodsName(GoodsID3)..'],神祇赐福'..LHGM_Table[GoodsID3].zy..'%的'..sxsm[LHGM_Table[GoodsID3].sx]..'')		
	
	else
	API_ResponseWrite('<br><text>请放入供奉神祇攻击系列装备,不要空放或者放入其他系列装备。</text><br>') 
	API_ResponseWrite('<br><br><a>确定</a>')
	return
	
   end
end
if API_RequestGetNumber(2) == 6 then

  if API_ActorGetPackageSize(ActorID) >= 1 then
   if API_VarDataGetNumber(ActorID,1,21503) > 0 then
     API_AddActorGoodsFlag(ActorID,API_VarDataGetNumber(ActorID,1,21503),1,3,'神祇已取消对('..ActorName..')的赐福,物品已返回背包')
	 API_AddActorEffectProp(ActorID,LHGM_Table[API_VarDataGetNumber(ActorID,1,21503)].sx,-LHGM_Table[API_VarDataGetNumber(ActorID,1,21503)].zy*10)
     API_VarDataSetNumber(ActorID,1,21503,0)
	API_ActorSendMsg(ActorID,17,'神祇已取消对('..ActorName..')的赐福,物品已返回背包')		 
   end
  else
	API_ActorSendMsg(ActorID,3, "背包至少留出1个空格")
  end
 end
 --第四个
 
 if API_RequestGetNumber(2) == 7 then
   if BoxID4 < 0 then  API_ActorSendMsg(ActorID,3,'有问题请及时联系群主')  return end
    if  LHGM_Table[GoodsID4].tbbj == 4 then
	API_ActorRemoveGoodsOfLoc(ActorID,GoodsID4,1,BoxID4,LocID4, '暂时移除供奉神祇系列装备')
	API_VarDataSetNumber(ActorID,1,21504,GoodsID4)
	API_AddActorEffectProp(ActorID,LHGM_Table[GoodsID4].sx,LHGM_Table[GoodsID4].zy*10)
	API_ActorBroadcastMsg(-1,17,'神祇信徒('..ActorName..')成功装备['..API_GetGoodsName(GoodsID4)..'],神祇赐福'..LHGM_Table[GoodsID4].zy..'%的'..sxsm[LHGM_Table[GoodsID4].sx]..'')
	API_Trace(''..ActorName..'成功装备['..API_GetGoodsName(GoodsID4)..'],神祇赐福'..LHGM_Table[GoodsID4].zy..'%的'..sxsm[LHGM_Table[GoodsID4].sx]..'')		
	
	else
	API_ResponseWrite('<br><text>请放入供奉神祇攻击系列装备,不要空放或者放入其他系列装备。</text><br>') 
	API_ResponseWrite('<br><br><a>确定</a>')
	return
	
   end
end
if API_RequestGetNumber(2) == 8 then

  if API_ActorGetPackageSize(ActorID) >= 1 then
   if API_VarDataGetNumber(ActorID,1,21504) > 0 then
     API_AddActorGoodsFlag(ActorID,API_VarDataGetNumber(ActorID,1,21504),1,3,'神祇已取消对('..ActorName..')的赐福,物品已返回背包')
	 API_AddActorEffectProp(ActorID,LHGM_Table[API_VarDataGetNumber(ActorID,1,21504)].sx,-LHGM_Table[API_VarDataGetNumber(ActorID,1,21504)].zy*10)
     API_VarDataSetNumber(ActorID,1,21504,0)
	API_ActorSendMsg(ActorID,17,'神祇已取消对('..ActorName..')的赐福,物品已返回背包')		 
   end
  else
	API_ActorSendMsg(ActorID,3, "背包至少留出1个空格")
  end
 end
 
---第五个
if API_RequestGetNumber(2) == 9 then
if BoxID5 < 0 then  API_ActorSendMsg(ActorID,3,'有问题请及时联系群主')  return end
   if  LHGM_Table[GoodsID5].tbbj == 5 then
	API_ActorRemoveGoodsOfLoc(ActorID,GoodsID5,1,BoxID5,LocID5, '暂时移除供奉神祇系列装备') 
	API_VarDataSetNumber(ActorID,1,21505,GoodsID5)
	API_AddActorEffectProp(ActorID,LHGM_Table[GoodsID5].sx,LHGM_Table[GoodsID5].zy*10)
	API_ActorBroadcastMsg(-1,17,'神祇信徒('..ActorName..')成功装备['..API_GetGoodsName(GoodsID5)..'],神祇赐福'..LHGM_Table[GoodsID5].zy..'%的'..sxsm[LHGM_Table[GoodsID5].sx]..'')
	API_Trace(''..ActorName..'成功装备['..API_GetGoodsName(GoodsID5)..'],神祇赐福'..LHGM_Table[GoodsID5].zy..'%的'..sxsm[LHGM_Table[GoodsID5].sx]..'')		
	else
	API_ResponseWrite('<br><text>请放入供奉神祇攻击系列装备,不要空放或者放入其他系列装备。</text><br>') 
	API_ResponseWrite('<br><br><a>确定</a>')
	return
	end
  
 end

if API_RequestGetNumber(2) == 10 then

  if API_ActorGetPackageSize(ActorID) >= 1 then
   if API_VarDataGetNumber(ActorID,1,21505) > 0 then
     API_AddActorGoodsFlag(ActorID,API_VarDataGetNumber(ActorID,1,21505),1,3,'神祇已取消对('..ActorName..')的赐福,物品已返回背包')
	   API_AddActorEffectProp(ActorID,LHGM_Table[API_VarDataGetNumber(ActorID,1,21505)].sx,-LHGM_Table[API_VarDataGetNumber(ActorID,1,21505)].zy*10)
     API_VarDataSetNumber(ActorID,1,21505,0)
	API_ActorSendMsg(ActorID,17,'神祇已取消对('..ActorName..')的赐福,物品已返回背包')		 
   end
  else
	API_ActorSendMsg(ActorID,3, "背包至少留出1个空格")
  end
 end




			
end
end



function SuperZengyiBUFF(ActorID,GoodsID)
local ActorID = ActorID or API_RequestGetActorID() 
API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
API_ResponseWrite('<win rect="530,175,320,295"></win>')
API_ResponseWrite('<img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'">')
if LHGM_Table[GoodsID].bfb == 0 then
API_ResponseWrite('<text>当前属性为增加</text><text color="255,255,0">'..sxsm[LHGM_Table[GoodsID].sx]..':</text><text color="0,255,255">['..LHGM_Table[GoodsID].zy..']</text><br>')
else
API_ResponseWrite('<text>当前属性为增加</text><text color="255,255,0">'..sxsm[LHGM_Table[GoodsID].sx]..':</text><text color="0,255,255">['..LHGM_Table[GoodsID].zy..'%]</text><br>')
end
if LHGM_Table[GoodsID].limt == 0 then
API_ResponseWrite('<br><text color="255,67,101">当前供奉神祇系列可升级为</text><img srcgd="'..(GoodsID+1)..'" tipgd="'..(GoodsID+1)..'">')
API_ResponseWrite('<br><text>下一级属性为增加</text><text color="255,255,0">'..sxsm[LHGM_Table[GoodsID+1].sx]..':</text><text color="0,255,255">['..LHGM_Table[GoodsID+1].zy..']</text>')
else
API_ResponseWrite('<text color="0,255,0">此物品已达到当前系列的顶级,无法再进行后续升级了</text>')
end



if LHGM_Table[GoodsID].limt == 0 then
API_ResponseWrite('<br><br><text color="126,94,243">             升级所需要的材料  </text><br>')
API_ResponseWrite('<br><br><text>     </text><img srcgd="83374" tipgd="83374"><text>10/'..API_ActorGetGoodsNum(ActorID,83374)..'</text>')
API_ResponseWrite('<text>     </text><img srcgd="83000" tipgd="83000"><text>2000/'..API_ActorGetGoodsNum(ActorID,83000)..'</text><br>')
API_ResponseWrite('<text>     </text><img srcgd="80410"><text>1000000/'..API_ActorGetPropNum(ActorID,156)..'</text><br>')
API_ResponseWrite('<br><text>             </text>')
API_ResponseWrite('<a href="Atiemu_UP?1='..GoodsID..'" color="0,255,0">升级供奉神祇装备</a>')
else
end
API_ResponseFlush(ActorID)
return 1
end

API_AddLUAReqFunc("Atiemu_UP")
function Atiemu_UP()
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = API_RequestGetNumber(1)
	if LHGM_Table[GoodsID].limt == 1 then
	API_ActorBroadcastMsg(-1,17,'['..API_GetActorName(ActorID)..']['..ActorID..']狗篮子都想搞事情？')
	return 0
	end
	if API_ActorGetPropNum(ActorID,156) >= 1000000 and API_ActorGetGoodsNum(ActorID,83374) >= 10 and API_ActorGetGoodsNum(ActorID,83000) >= 2000 then
	API_ActorAddMoney(ActorID,-1000000,0,'升级供奉神祇')
	API_ActorRemoveGoods(ActorID,83374,10,'升级供奉神祇')
	API_ActorRemoveGoods(ActorID,83000,2000,'升级供奉神祇')
	if math.random(100) < LHGM_Table[GoodsID].cgl then
	API_ActorRemoveGoods(ActorID,GoodsID,1,'升级供奉神祇')
	API_AddActorGoodsEx(ActorID,(GoodsID+1),1,3,'成功升级')
	API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在供奉神祇中成功突破到下一层获得了崭新道具['..API_GetGoodsName(GoodsID+1)..']')
	else
	API_ActorSendMsg(ActorID,3,'很可惜,失败了')
	API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在供奉神祇中冲击失败')
	return 0
	end
	else
API_ActorSendMsg(ActorID,3,'金币不足100万、神灵铜钱不足10个或古仙令不足2000个')
	return 0
	end
	
end
	
	

local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'GFSQ_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'GFSQ_OnLogin') 
end

local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'GFSQ_OnLogin' then
		OnLoginMapLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'GFSQ_OnLogin') 
end





--切图检测上buff
function GFSQ_OnLogin(ActorID)
local ActorID = ActorID or API_RequestGetActorID()
if ActorID == nil or ActorID <= 0 then return end
if API_VarDataGetNumber(ActorID,1,21501) > 0  then
API_AddActorEffectProp(ActorID,7,LHGM_Table[API_VarDataGetNumber(ActorID,1,21501)].zy)
API_AddActorEffectProp(ActorID,8,LHGM_Table[API_VarDataGetNumber(ActorID,1,21501)].zy)
API_AddActorEffectProp(ActorID,9,LHGM_Table[API_VarDataGetNumber(ActorID,1,21501)].zy)
end
if API_VarDataGetNumber(ActorID,1,21502) > 0  then
API_AddActorEffectProp(ActorID,LHGM_Table[API_VarDataGetNumber(ActorID,1,21502)].sx,LHGM_Table[API_VarDataGetNumber(ActorID,1,21502)].zy)
end
if API_VarDataGetNumber(ActorID,1,21503) > 0  then
API_AddActorEffectProp(ActorID,LHGM_Table[API_VarDataGetNumber(ActorID,1,21503)].sx,LHGM_Table[API_VarDataGetNumber(ActorID,1,21503)].zy*10)
end
if API_VarDataGetNumber(ActorID,1,21504) > 0  then
API_AddActorEffectProp(ActorID,LHGM_Table[API_VarDataGetNumber(ActorID,1,21504)].sx,LHGM_Table[API_VarDataGetNumber(ActorID,1,21504)].zy*10)
end

if API_VarDataGetNumber(ActorID,1,21505) > 0  then
API_AddActorEffectProp(ActorID,LHGM_Table[API_VarDataGetNumber(ActorID,1,21505)].sx,LHGM_Table[API_VarDataGetNumber(ActorID,1,21505)].zy*10)
end

end