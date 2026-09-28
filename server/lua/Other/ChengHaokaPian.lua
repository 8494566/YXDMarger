-------------------------------
--文件名:	Scp\Lua\Other\ChengHaoKaPian.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	刘操
--日  期:	2010-6-24
--版  本:	
--描  述:   称号卡片功能
--应  用:  
-------------------------------


GLOBAL_ChengHaoKaPian_List = {
--胜利宣言
[88949] = {NickNameID = 209,PropID = 970001,NickName='胜利宣言'},
--炫夏之光
[88950] = {NickNameID = 210,PropID = 971001,NickName='炫夏之光'},
--联赛冠军
[88982] = {NickNameID = 211,PropID = 2004001,NickName='联赛冠军'},
--招财进宝之神
[89096] = {NickNameID = 213,PropID = 1105001,NickName='招财进宝之神'},
--武财神
[89097] = {NickNameID = 214,PropID = 1106001,NickName='武财神'},
--文财神
[89098] = {NickNameID = 215,PropID = 1107001,NickName='文财神'},
--至尊无上
[89150] = {NickNameID = 216,PropID = 2048001,NickName='至尊无上'},
--竞技之王
[89151] = {NickNameID = 217,PropID = 2048002,NickName='竞技之王'},
--竞技之星
[89152] = {NickNameID = 218,PropID = 2048003,NickName='竞技之星'},
}

function ChengHaoKaPianUse(ActorID,GoodsID)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then--判断玩家是否拥有物品
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if GLOBAL_ChengHaoKaPian_List[GoodsID] == nil then--判断物品是否属于道具包裹
		API_ActorSendMsg(ActorID,3,'非法物品')
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用称号卡片') then--销毁玩家身上的物品
		local NickNameID = GLOBAL_ChengHaoKaPian_List[GoodsID].NickNameID
		local PropID = GLOBAL_ChengHaoKaPian_List[GoodsID].PropID
		local NickName = GLOBAL_ChengHaoKaPian_List[GoodsID].NickName
		API_SetPlayerNickName(ActorID,NickNameID,NickName,1,0,1,1,{PropID})--设置称号
		return 1
	else
		return 0
	end
end
