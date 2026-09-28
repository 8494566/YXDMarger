
----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\Christmas_Yao.lua
--版  权:	深圳网域计算机网络有限公司
--创建人:	梁宇宁
--日  期:	2010.12.8
--版  本:	1.0
--描  述:
--应  用:  圣诞节的药水
----------------------------------------------------------------------------------------------------------------------

Christmas_DaYaoID = 88999  ------大型冰宫灵药
Christmas_ZhongYaoID = 88998 ------中型冰宫灵药

Christmas_YaoBuff = {
   [88998] = {nameid = 1016001},
   [88999] = {nameid = 1017001},
}


function Christmas_YaoShui(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
    API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
    if GoodsID ~= Christmas_DaYaoID and GoodsID ~= Christmas_ZhongYaoID then
		API_ResponseWrite('<text>使用物品无效</text><br>')
		API_ResponseWrite('<br><a>暂时收好</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)  ------当前玩家地图
	local RightMapID = API_GetMapConfigID(MapID)
	if RightMapID ~= 2032 then
		API_ResponseWrite('<text>药水只能在冰雪寒宫地图里使用</text><br>')
		API_ResponseWrite('<br><a>暂时收好</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	API_ActorRemoveGoods(ActorID,GoodsID,1,'删除圣诞节药水')
    API_ActorAddStatus(ActorID,Christmas_YaoBuff[GoodsID].nameid,0)
	return 1
end