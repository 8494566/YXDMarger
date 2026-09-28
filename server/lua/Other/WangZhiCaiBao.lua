----------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\WangZhiCaiBao.lua
--描  述:	古仙令兑换（挂在「便捷功能」卷轴上）：各物品单价见 WZCB_List.Cost（未写则用 WZCB_Cost）
--		  界面照 NPC 兑换：物品图标 + 悬停看属性 + 购买按钮
--修 改:	2026-09-28
----------------------------------------------------------------------------------------------------

WZCB_Goods = 83000       -- 古仙令
WZCB_Cost = 500           -- 默认每件需要数量（单项可用 Cost 覆盖）

WZCB_List = {
	{GoodsID = 11746, Name = '战士戒指 ★★★★★'},
	{GoodsID = 11747, Name = '法师戒指 ★★★★★'},
	{GoodsID = 11748, Name = '火药之戒 ★★★★★'},
	{GoodsID = 11724, Name = '王者招财帽 [终极男装]'},
	{GoodsID = 11725, Name = '王者招财衣 [终极男装]'},
	{GoodsID = 11726, Name = '王者凤运帽 [终极女装]'},
	{GoodsID = 11727, Name = '王者凤运衣 [终极女装]'},
	{GoodsID = 11728, Name = '王者披风 [终极]'},
	{GoodsID = 11729, Name = '王之刃'},
	{GoodsID = 11730, Name = '幸运戒指'},
	{GoodsID = 89001, Name = '六星魂器宝箱', Cost = 100},
}

function WZCB_Count(ActorID)
	local ok, n = pcall(API_ActorGetGoodsNum, ActorID, WZCB_Goods)
	if ok and n ~= nil then
		return n
	end
	return 0
end

function WZCB_Title()
	local ActorID = API_RequestGetActorID()
	local Have = WZCB_Count(ActorID)
	API_ResponseWrite('<name>古仙令兑换</name>')
	API_ResponseWrite('<win rect="80,300,830,460"></win>')
	API_ResponseWrite('<br><text size="14">你有 </text><text size="14" color="255,255,0">'..Have..'</text><text size="14"> 个「古仙令」，兑换所需见下方（鼠标放在物品上可看属性）：</text><br>')
	for i = 1, table.getn(WZCB_List) do
		local e = WZCB_List[i]
		local Cost = e.Cost or WZCB_Cost
		API_ResponseWrite('<br><img srcgd="'..e.GoodsID..'" tipgd="'..e.GoodsID..'"><text size="14"> '..e.Name..' </text><text size="14" color="255,128,0">（'..Cost..' 个古仙令）</text> <img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" href="WZCB_Confirm?1='..i..'">')
	end
	API_ResponseWrite('<br><br><br><a href="SpringFestival_JuanZhou">返回</a> <a>关闭</a>')
end

function WZCB_Confirm()
	local ActorID = API_RequestGetActorID()
	local idx = API_RequestGetNumber(1)
	local e = WZCB_List[idx]
	if e == nil then
		WZCB_Title()
		return
	end
	local Cost = e.Cost or WZCB_Cost
	local Have = WZCB_Count(ActorID)
	API_ResponseWrite('<name>古仙令兑换</name>')
	API_ResponseWrite('<br><img srcgd="'..e.GoodsID..'" tipgd="'..e.GoodsID..'"><br>')
	if Have < Cost then
		API_ResponseWrite('<text size="14" color="255,0,0">古仙令不足！兑换 '..e.Name..' 需要 '..Cost..' 个，你当前只有 '..Have..' 个。</text><br><br>')
		API_ResponseWrite('<a href="WZCB_Title">返回</a> <a>关闭</a>')
		return
	end
	API_ResponseWrite('<text size="14">确定用 </text><text size="14" color="255,128,0">'..Cost..' 个古仙令</text><text size="14"> 兑换 </text><text size="14" color="0,255,0">'..e.Name..'</text><text size="14"> 吗？</text><br><br>')
	API_ResponseWrite('<a href="WZCB_Go?1='..idx..'">确定兑换</a><br><br>')
	API_ResponseWrite('<a href="WZCB_Title">再想想</a>')
end

function WZCB_Go()
	local ActorID = API_RequestGetActorID()
	local idx = API_RequestGetNumber(1)
	local e = WZCB_List[idx]
	API_ResponseWrite('<name>古仙令兑换</name>')
	if e == nil then
		WZCB_Title()
		return
	end
	local Cost = e.Cost or WZCB_Cost
	local Have = WZCB_Count(ActorID)
	if Have < Cost then
		API_ResponseWrite('<br><text size="14" color="255,0,0">古仙令不足！需要 '..Cost..' 个，你当前只有 '..Have..' 个。</text><br><br>')
		API_ResponseWrite('<a href="WZCB_Title">返回</a> <a>关闭</a>')
		return
	end
	if API_ActorRemoveGoods(ActorID, WZCB_Goods, Cost, '古仙令兑换') then
		local canAdd = true
		local okAdd, rAdd = pcall(API_ActorCanAddGoods, ActorID, e.GoodsID, 1, 0, 0)
		if okAdd and rAdd == -1 then
			canAdd = false
		end
		if canAdd then
			API_AddActorGoods(ActorID, e.GoodsID, 1, '古仙令兑换')
			API_ResponseWrite('<br><img srcgd="'..e.GoodsID..'" tipgd="'..e.GoodsID..'"><text size="14"> × 1</text><br>')
			API_ResponseWrite('<text size="14" color="0,255,0">兑换成功！'..e.Name..' 已放进你的背包。</text><br>')
		else
			API_SendActorMail(ActorID, e.GoodsID, 1, '[古仙令兑换]'..e.Name, '背包已满，'..e.Name..' 通过邮件发放，请查收附件！')
			API_ResponseWrite('<br><img srcgd="'..e.GoodsID..'" tipgd="'..e.GoodsID..'"><text size="14"> × 1</text><br>')
			API_ResponseWrite('<text size="14" color="0,255,0">兑换成功！背包已满，'..e.Name..' 已通过邮件发放，请查收邮箱。</text><br>')
		end
		API_ResponseWrite('<br><text size="14">剩余古仙令：</text><text size="14" color="255,255,0">'..WZCB_Count(ActorID)..'</text><br><br>')
	else
		API_ResponseWrite('<br><text size="14" color="255,0,0">扣除古仙令失败（可能数量不足或背包异常），请重试。</text><br><br>')
	end
	API_ResponseWrite('<a href="WZCB_Title">继续兑换</a> <a>关闭</a>')
end
