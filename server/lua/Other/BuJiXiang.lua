----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\BuJiXiang.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-5-6
--版  本:	1.0
--描  述:	补给箱使用函数
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-5-6
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------

--补给箱兑换列表
GLOBAL_BuJiXiang_Exchange = {
	--[[ 	0: 无绑定  
		1：不可以交易、拍卖、给予、邮寄 
		2：不可以出售给NPC 
		3：=1+2
		4：切换地图消失
		5：1+4
		6：2+4
		7：1+2+4]]
--以下异届商店出售
--生命药水补给箱
[766] = {
		{GoodsID=101,ExchangeNum=10,Bind=0},
		{GoodsID=102,ExchangeNum=5,},
		{GoodsID=103,ExchangeNum=4,},
	--	{GoodsID=104,ExchangeNum=3,},
	--	{GoodsID=105,ExchangeNum=2,},
		},

--能量药水补给箱
[767] = {
		{GoodsID=10898,ExchangeNum=1,},
		{GoodsID=10899,ExchangeNum=1,},
		{GoodsID=10900,ExchangeNum=1,},
                {GoodsID=10901,ExchangeNum=1,},
		{GoodsID=10902,ExchangeNum=1,},
		{GoodsID=10903,ExchangeNum=1,},
		{GoodsID=10904,ExchangeNum=1,},
		{GoodsID=10905,ExchangeNum=1,},
		{GoodsID=10909,ExchangeNum=1,},
		{GoodsID=10910,ExchangeNum=1,},
		{GoodsID=10911,ExchangeNum=1,},
		{GoodsID=10912,ExchangeNum=1,},
		{GoodsID=10918,ExchangeNum=1,},
		{GoodsID=10919,ExchangeNum=1,},
		{GoodsID=10920,ExchangeNum=1,},
		{GoodsID=10923,ExchangeNum=1,},
		{GoodsID=10924,ExchangeNum=1,},
		{GoodsID=10925,ExchangeNum=1,},
		{GoodsID=10928,ExchangeNum=1,},
		{GoodsID=10929,ExchangeNum=1,},
		{GoodsID=10930,ExchangeNum=1,},
		{GoodsID=10931,ExchangeNum=1,},
		{GoodsID=10932,ExchangeNum=1,},
		{GoodsID=10933,ExchangeNum=1,},
		{GoodsID=10934,ExchangeNum=1,},
		{GoodsID=10935,ExchangeNum=1,},
		{GoodsID=10936,ExchangeNum=1,},
		{GoodsID=10937,ExchangeNum=1,},
		{GoodsID=10938,ExchangeNum=1,},
		{GoodsID=10939,ExchangeNum=1,},
		{GoodsID=10940,ExchangeNum=1,},
		{GoodsID=10941,ExchangeNum=1,},
		{GoodsID=10977,ExchangeNum=1,},
		{GoodsID=10978,ExchangeNum=1,},
		{GoodsID=10979,ExchangeNum=1,},
		{GoodsID=10980,ExchangeNum=1,},
		{GoodsID=10981,ExchangeNum=1,},
		{GoodsID=10982,ExchangeNum=1,},
		{GoodsID=10983,ExchangeNum=1,},
		{GoodsID=10990,ExchangeNum=1,},
		{GoodsID=10991,ExchangeNum=1,},
		{GoodsID=10992,ExchangeNum=1,},
		{GoodsID=10993,ExchangeNum=1,},
		{GoodsID=10996,ExchangeNum=1,},
		{GoodsID=10997,ExchangeNum=1,},
		{GoodsID=10998,ExchangeNum=1,},
		{GoodsID=10999,ExchangeNum=1,},
		{GoodsID=11000,ExchangeNum=1,},
		{GoodsID=11001,ExchangeNum=1,},
		{GoodsID=11002,ExchangeNum=1,},
		{GoodsID=11006,ExchangeNum=1,},
		{GoodsID=11007,ExchangeNum=1,},
		{GoodsID=11008,ExchangeNum=1,},
		{GoodsID=11009,ExchangeNum=1,},
		{GoodsID=11010,ExchangeNum=1,},
		{GoodsID=11011,ExchangeNum=1,},
		{GoodsID=11012,ExchangeNum=1,},
		{GoodsID=11069,ExchangeNum=1,},
		{GoodsID=11070,ExchangeNum=1,},
		{GoodsID=11071,ExchangeNum=1,},
		{GoodsID=11072,ExchangeNum=1,},
		{GoodsID=11073,ExchangeNum=1,},
		{GoodsID=11074,ExchangeNum=1,},
		{GoodsID=11075,ExchangeNum=1,},
		{GoodsID=11076,ExchangeNum=1,},
		{GoodsID=11077,ExchangeNum=1,},
		{GoodsID=11078,ExchangeNum=1,},
		{GoodsID=11079,ExchangeNum=1,},
		{GoodsID=11080,ExchangeNum=1,},
		{GoodsID=11081,ExchangeNum=1,},
		{GoodsID=11082,ExchangeNum=1,},
		{GoodsID=11083,ExchangeNum=1,},
		{GoodsID=11084,ExchangeNum=1,},
		{GoodsID=11085,ExchangeNum=1,},
		{GoodsID=11086,ExchangeNum=1,},
		{GoodsID=11087,ExchangeNum=1,},
		{GoodsID=11088,ExchangeNum=1,},
		{GoodsID=11089,ExchangeNum=1,},
		{GoodsID=11090,ExchangeNum=1,},
		{GoodsID=11091,ExchangeNum=1,},
		{GoodsID=11092,ExchangeNum=1,},
		{GoodsID=11093,ExchangeNum=1,},
		{GoodsID=11094,ExchangeNum=1,},
		{GoodsID=11095,ExchangeNum=1,},
		{GoodsID=11096,ExchangeNum=1,},
		{GoodsID=11097,ExchangeNum=1,},
		{GoodsID=11104,ExchangeNum=1,},
		{GoodsID=11105,ExchangeNum=1,},
		{GoodsID=11106,ExchangeNum=1,},
		{GoodsID=11107,ExchangeNum=1,},
		{GoodsID=11108,ExchangeNum=1,},
		{GoodsID=11109,ExchangeNum=1,},
		{GoodsID=11110,ExchangeNum=1,},
		{GoodsID=11111,ExchangeNum=1,},
		{GoodsID=11112,ExchangeNum=1,},
		{GoodsID=11133,ExchangeNum=1,},
		{GoodsID=11134,ExchangeNum=1,},
		{GoodsID=11135,ExchangeNum=1,},
		{GoodsID=11136,ExchangeNum=1,},
		{GoodsID=11137,ExchangeNum=1,},
		{GoodsID=11138,ExchangeNum=1,},
		{GoodsID=11139,ExchangeNum=1,},
		{GoodsID=11240,ExchangeNum=1,},
		{GoodsID=11241,ExchangeNum=1,},
		{GoodsID=11242,ExchangeNum=1,},
		{GoodsID=11243,ExchangeNum=1,},
		{GoodsID=11248,ExchangeNum=1,},
		{GoodsID=11249,ExchangeNum=1,},
		{GoodsID=11250,ExchangeNum=1,},
		{GoodsID=11251,ExchangeNum=1,},
		{GoodsID=11252,ExchangeNum=1,},
		{GoodsID=11253,ExchangeNum=1,},
		{GoodsID=11254,ExchangeNum=1,},
		{GoodsID=11255,ExchangeNum=1,},
		{GoodsID=11278,ExchangeNum=1,},
		{GoodsID=11279,ExchangeNum=1,},
		{GoodsID=11280,ExchangeNum=1,},
		{GoodsID=11281,ExchangeNum=1,},
		{GoodsID=11282,ExchangeNum=1,},
		{GoodsID=11283,ExchangeNum=1,},
		{GoodsID=11284,ExchangeNum=1,},
		{GoodsID=11285,ExchangeNum=1,},
		{GoodsID=11286,ExchangeNum=1,},
		{GoodsID=11287,ExchangeNum=1,},
		{GoodsID=11288,ExchangeNum=1,},
		{GoodsID=11289,ExchangeNum=1,},
		{GoodsID=11290,ExchangeNum=1,},
		{GoodsID=11291,ExchangeNum=1,},
		{GoodsID=11292,ExchangeNum=1,},
		{GoodsID=11309,ExchangeNum=1,},
		{GoodsID=11310,ExchangeNum=1,},
		{GoodsID=11311,ExchangeNum=1,},
		{GoodsID=11312,ExchangeNum=1,},
		{GoodsID=11313,ExchangeNum=1,},
		{GoodsID=11314,ExchangeNum=1,},
		{GoodsID=11315,ExchangeNum=1,},
		{GoodsID=11316,ExchangeNum=1,},
		{GoodsID=11317,ExchangeNum=1,},
		{GoodsID=11509,ExchangeNum=1,},
		{GoodsID=11510,ExchangeNum=1,},
		{GoodsID=11521,ExchangeNum=1,},
		{GoodsID=11522,ExchangeNum=1,},
		{GoodsID=11523,ExchangeNum=1,},
		{GoodsID=11524,ExchangeNum=1,},
		{GoodsID=11525,ExchangeNum=1,},
		{GoodsID=11526,ExchangeNum=1,},
		{GoodsID=11531,ExchangeNum=1,},
		{GoodsID=11532,ExchangeNum=1,},
		{GoodsID=11533,ExchangeNum=1,},	
		{GoodsID=11534,ExchangeNum=1,},
		{GoodsID=11535,ExchangeNum=1,},
		{GoodsID=11536,ExchangeNum=1,},
		{GoodsID=11537,ExchangeNum=1,},
		{GoodsID=11538,ExchangeNum=1,},
		{GoodsID=11539,ExchangeNum=1,},
		{GoodsID=11540,ExchangeNum=1,},
		{GoodsID=11541,ExchangeNum=1,},	
		{GoodsID=11542,ExchangeNum=1,},
		{GoodsID=11543,ExchangeNum=1,},
		{GoodsID=11544,ExchangeNum=1,},
		{GoodsID=11545,ExchangeNum=1,},
		{GoodsID=11546,ExchangeNum=1,},
		{GoodsID=11547,ExchangeNum=1,},
		{GoodsID=11595,ExchangeNum=1,},
		{GoodsID=11596,ExchangeNum=1,},		
		{GoodsID=11597,ExchangeNum=1,},
		{GoodsID=11551,ExchangeNum=1,},
		{GoodsID=11552,ExchangeNum=1,},
		{GoodsID=11623,ExchangeNum=1,},
		{GoodsID=11624,ExchangeNum=1,},	
		{GoodsID=11625,ExchangeNum=1,},
		{GoodsID=11626,ExchangeNum=1,},
		{GoodsID=11627,ExchangeNum=1,},
		{GoodsID=11628,ExchangeNum=1,},
		{GoodsID=11629,ExchangeNum=1,},
		{GoodsID=11630,ExchangeNum=1,},
		{GoodsID=11631,ExchangeNum=1,},
		{GoodsID=11632,ExchangeNum=1,},	
		{GoodsID=11633,ExchangeNum=1,},
		{GoodsID=11634,ExchangeNum=1,},
		{GoodsID=11656,ExchangeNum=1,},
		{GoodsID=11657,ExchangeNum=1,},
		{GoodsID=11658,ExchangeNum=1,},	
		{GoodsID=11659,ExchangeNum=1,},
		{GoodsID=11660,ExchangeNum=1,},
		{GoodsID=11661,ExchangeNum=1,},
		{GoodsID=11662,ExchangeNum=1,},
		{GoodsID=11663,ExchangeNum=1,},	
		{GoodsID=11707,ExchangeNum=1,},
		},

--近战元素补给箱
[768] = {
		{GoodsID=80246,ExchangeNum=10,},
		},

--火药元素补给箱
[769] = {
		{GoodsID=80247,ExchangeNum=10,},
		},

--魔法元素补给箱
[770] = {
		{GoodsID=80248,ExchangeNum=10,},
		},

--混合元素补给箱
[771] = {
		{GoodsID=80249,ExchangeNum=10,},
		},

--1档土地建设图纸包
[951] = {
		{GoodsID=28,ExchangeNum=1,},
		{GoodsID=29,ExchangeNum=1,},
		{GoodsID=30,ExchangeNum=1,},
		{GoodsID=32,ExchangeNum=1,},
		{GoodsID=33,ExchangeNum=1,},
		},

--2档土地建设图纸包
[952] = {
		{GoodsID=80550,ExchangeNum=1,},
		{GoodsID=80551,ExchangeNum=1,},
		{GoodsID=80552,ExchangeNum=1,},
		{GoodsID=80554,ExchangeNum=1,},
		{GoodsID=80555,ExchangeNum=1,},
		},
		
		

--以下是新手奖励包
--二档武器抄卷包
[933] = {
		{GoodsID=42,ExchangeNum=20,Bind=1},
		{GoodsID=43,ExchangeNum=20,Bind=1},
		{GoodsID=44,ExchangeNum=20,Bind=1},
		},

--生命药水补给箱
[939] = {
		{GoodsID=101,ExchangeNum=10,Bind=1},
		{GoodsID=102,ExchangeNum=5,Bind=1},
		{GoodsID=103,ExchangeNum=4,Bind=1},
	--	{GoodsID=104,ExchangeNum=3,Bind=1},
	--	{GoodsID=105,ExchangeNum=2,Bind=1},
		},

--能量药水补给箱
[940] = {
		{GoodsID=201,ExchangeNum=10,Bind=1},
		{GoodsID=202,ExchangeNum=5,Bind=1},
		{GoodsID=203,ExchangeNum=4,Bind=1},
	--	{GoodsID=204,ExchangeNum=3,Bind=1},
	--	{GoodsID=205,ExchangeNum=2,Bind=1},
		},

--近战元素补给箱
[941] = {
		{GoodsID=80246,ExchangeNum=10,Bind=1},
		},

--火药元素补给箱
[942] = {
		{GoodsID=80247,ExchangeNum=10,Bind=1},
		},

--魔法元素补给箱
[943] = {
		{GoodsID=80248,ExchangeNum=10,Bind=1},
		},

--爱心岛主补给箱（签到商人兑换）
[944] = {
		{GoodsID=82004,ExchangeNum=5000,Bind=1},
		{GoodsID=80818,ExchangeNum=5000,Bind=1},
		},
}


function BuJiXiang_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	BuJiXiang_Exchange(ActorID,GoodsID)
	return 1
end

function BuJiXiang_Exchange(ActorID,GoodsID)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	if GoodsID == nil then
		GoodsID = API_RequestGetNumber(2)
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		return
	end
	if GLOBAL_BuJiXiang_Exchange[GoodsID] == nil then
		return
	end
	if type(GLOBAL_BuJiXiang_Exchange[GoodsID]) ~= 'table' then
		return
	end
	local SelectItem = API_RequestGetNumber(1)
	if API_RequestGetNumber(3) > 0 then
		local ExchangeNo = API_RequestGetNumber(3)
		if GLOBAL_BuJiXiang_Exchange[GoodsID][ExchangeNo] ~= nil then
			local ExchangeGoodsID = GLOBAL_BuJiXiang_Exchange[GoodsID][ExchangeNo].GoodsID
			local ExchangeNum = GLOBAL_BuJiXiang_Exchange[GoodsID][ExchangeNo].ExchangeNum
			local Bind = GLOBAL_BuJiXiang_Exchange[GoodsID][ExchangeNo].Bind
			if Bind == nil then
				Bind = 0
			end
			if API_ActorCanAddGoods(ActorID,ExchangeGoodsID,ExchangeNum,Bind,0) ~= -1 then
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'补给箱兑换删除') then
					API_AddActorGoodsFlag(ActorID,ExchangeGoodsID,ExchangeNum,Bind,'补给箱兑换添加')
					API_ActorSendMsg(ActorID,0,'您用一个 '..API_GetGoodsName(GoodsID)..' 兑换了 '..ExchangeNum..' 个 '..API_GetGoodsName(ExchangeGoodsID)..'')
					return
				end
			else
				API_ActorSendMsg(ActorID,0,'您的背包空间不足，无法兑换')
			end
		end
	end
	local GoodsNum = table.getn(GLOBAL_BuJiXiang_Exchange[GoodsID])
	API_ResponseWrite('<name></name>')
	API_ResponseWrite('<win rect="230,220,340,400"></win>')
	for i = 1,GoodsNum do
		if i > SelectItem * 5 and i < (SelectItem + 1) * 5 + 1 then
			local ExchangeGoodsID = GLOBAL_BuJiXiang_Exchange[GoodsID][i].GoodsID
			local ExchangeNum = GLOBAL_BuJiXiang_Exchange[GoodsID][i].ExchangeNum
			API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(ExchangeGoodsID)..'</text><br>')
			API_ResponseWrite('<img srcgd="'..ExchangeGoodsID..'" tipgd="'..ExchangeGoodsID..'">')
			local ExchangeNumTip = '  允许兑换数量：'..ExchangeNum..'             '
			local ExchangeNumTipLen = string.len(ExchangeNumTip)
			if ExchangeNumTipLen < 33 then
				for j = 1,33- ExchangeNumTipLen do
					ExchangeNumTip = ExchangeNumTip..' '
				end
			end
			API_ResponseWrite('<text>'..ExchangeNumTip..'</text>')
			API_ResponseWrite('<img src="LuaUse\\button Exchange_u.bmp" src2="LuaUse\\button Exchange_l.bmp" href="BuJiXiang_Exchange?1='..SelectItem..'&2='..GoodsID..'&3='..i..'"><br>')
			API_ResponseWrite('<text>———————————————————————</text><br>')
		end
	end
	if GoodsNum < (SelectItem + 1) * 5 then
		for i = 1,(SelectItem + 1) * 5 - GoodsNum do
			API_ResponseWrite('<br><br><br><br>')
		end
	end
	if GoodsNum > 5 then
		local BackPage = SelectItem - 1
		local NextPage = SelectItem + 1
		if SelectItem == 0 then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_g.bmp"><text>                          </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" href="BuJiXiang_Exchange?1='..NextPage..'&2='..GoodsID..'">')
		elseif (SelectItem + 1) * 5 < GoodsNum then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" href="BuJiXiang_Exchange?1='..BackPage..'&2='..GoodsID..'"><text>                          </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" href="BuJiXiang_Exchange?1='..NextPage..'&2='..GoodsID..'">')
		else
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" href="BuJiXiang_Exchange?1='..BackPage..'&2='..GoodsID..'"><text>                          </text><img src="LuaUse\\button_next_g.bmp">')
		end
	end
	API_ResponseFlush(ActorID)
end
