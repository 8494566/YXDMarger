-------------------------------
--文件名:	Scp\Lua\Act\LC_Christmas2011.lua
--版  权:	深圳腾讯计算机系统有限公司
--创建人:	刘操
--日  期:	2011-12-5
--版  本:	
--描  述:   圣诞元旦活动，远古战场
--应  用:  
-------------------------------



local Christmas2011_StartTime = {Year = 2011,Month = 12,Day = 15,Hour = 0,Minute = 0,Second = 0}
local Christmas2011_EndTime = {Year = 2012,Month = 12,Day = 31,Hour = 23,Minute = 59,Second = 59}

local YuanDan2011_StartTime = {Year = 2012,Month = 12,Day = 7,Hour = 0,Minute = 0,Second = 0}
local YuanDan2011_EndTime = {Year = 2013,Month = 1,Day = 4,Hour = 0,Minute = 0,Second = 0}

local SantaClausID = 731218--圣诞老人NPCID

GLOBAL_SantaClaus_Route = {
	[101] = {
			[1] = {
					StartTile = {TileX = 478,TileY = 567},
					RouteNum = 57,
					Route = {
								478,567,5,472,557,5,469,549,5,457,546,5,450,532,5,448,518,5,437,515,5,422,521,5,
								409,519,5,394,515,5,392,504,5,382,491,5,372,481,5,374,464,5,366,449,5,356,434,5,
								374,414,5,386,408,5,400,389,5,414,389,5,432,377,5,445,371,5,465,363,5,484,361,5,
								504,366,5,513,378,5,517,395,5,516,411,5,516,427,5,518,442,5,519,455,5,509,470,5,
								494,482,5,491,497,5,483,516,5,475,529,5,471,546,5,457,546,5,450,532,5,448,518,5,
								437,515,5,422,521,5,409,519,5,394,515,5,392,504,5,382,491,5,372,481,5,374,464,5,
								366,449,5,356,434,5,364,415,5,347,416,5,339,411,5,333,399,5,333,384,5,312,380,5,
								309,366,5
							},				
					},
			[2] = {
					StartTile = {TileX = 309,TileY = 366},
					RouteNum = 57,
					Route = {	
								309,366,5,312,380,5,333,384,5,333,399,5,339,411,5,347,416,5,364,415,5,356,434,5,
								366,449,5,374,464,5,372,481,5,382,491,5,392,504,5,394,515,5,409,519,5,422,521,5,
								437,515,5,448,518,5,450,532,5,457,546,5,471,546,5,475,529,5,483,516,5,491,497,5,
								494,482,5,509,470,5,519,455,5,518,442,5,516,427,5,516,411,5,517,395,5,513,378,5,
								504,366,5,484,361,5,465,363,5,445,371,5,432,377,5,414,389,5,400,389,5,386,408,5,
								374,414,5,356,434,5,366,449,5,374,464,5,372,481,5,382,491,5,392,504,5,394,515,5,
								409,519,5,422,521,5,437,515,5,448,518,5,450,532,5,457,546,5,469,549,5,472,557,5,
								478,567,5
							},				
					},
			},
}

local ChristmasList_GoodsTable = {
		{GoodsID=250,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=250,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=250,Num=1,GaiLv=6000,Flag=0,PinZhi=0},
		{GoodsID=250,Num=1,GaiLv=6000,Flag=0,PinZhi=0},
		{GoodsID=250,Num=1,GaiLv=6000,Flag=0,PinZhi=0},
		{GoodsID=119,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=208,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=120,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=209,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=501,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=502,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=503,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=505,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=501,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=502,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=503,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=505,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=80384,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=80384,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=80384,Num=1,GaiLv=8000,Flag=0,PinZhi=0},
		{GoodsID=80384,Num=1,GaiLv=7000,Flag=0,PinZhi=0},
		{GoodsID=80384,Num=1,GaiLv=6000,Flag=0,PinZhi=0},
		{GoodsID=80382,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=80382,Num=1,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=80382,Num=1,GaiLv=8000,Flag=0,PinZhi=0},
		{GoodsID=80382,Num=1,GaiLv=7000,Flag=0,PinZhi=0},
		{GoodsID=80382,Num=1,GaiLv=6000,Flag=0,PinZhi=0},
		{GoodsID=80410,Num=500,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=80410,Num=500,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=80410,Num=500,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=80410,Num=500,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=80410,Num=500,GaiLv=10000,Flag=0,PinZhi=0},
		{GoodsID=80410,Num=500,GaiLv=10000,Flag=0,PinZhi=0},
}

local MonsterIDTable = {
	[1] = 732101,
	[2] = 732102,
	[3] = 732103,
	[4] = 732104,
	[5] = 732105,
	[6] = 732106,
	[7] = 732107,
	[8] = 732108,
	[9] = 732109,
	[10] = 732110,
	[11] = 732111,
	[12] = 732112,
	[13] = 732113,
	[14] = 732114,
	[15] = 732115,
	[16] = 732116,
	[17] = 732117,
	[18] = 732118,
}

local Christmas_tubiaoid = 104099
local Christmas_juanzhouid = 90009

local ToDayPoint_tubiaoid = 104129
local ToDayPoint_juanzhouid = 90010

if ChristmasList == nil then
	ChristmasList = {}
end

if ChristmasFuBenList == nil then
	ChristmasFuBenList = {}
end

--上线判断
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'LC_Christmas_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'LC_Christmas_OnLogin') 
end

--下线判断
local OnLogoutLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLogoutFuncNameList) do 
	if GLOBAL_ActMain_OnLogoutFuncNameList[i] == 'LC_Christmas_OnLogout' then
		OnLogoutLoadOK = 1
		break
	end 
end 
if OnLogoutLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLogoutFuncNameList,'LC_Christmas_OnLogout') 
end
 
--上线回调
function LC_Christmas_OnLogin() 
	local ActorID = API_RequestGetActorID()
	local StartTimeTable = YuanDan2011_StartTime
	local EndTimeTable = YuanDan2011_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local ActorLevel = API_GetActorExpLevel(ActorID)
	API_RemoveTaskScroll(ActorID,ToDayPoint_juanzhouid)
	LRY_UItwinkemanage(ActorID,1,85,ToDayPoint_tubiaoid,ToDayPoint_juanzhouid,20,'epfunc_LC_SourceData')--加载图标
	if ActorLevel < 11 then
		return
	end	
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		API_RemoveTaskScroll(ActorID,Christmas_juanzhouid)
		LRY_UItwinkemanage(ActorID,11,85,Christmas_tubiaoid,Christmas_juanzhouid,20,'LC_Christmas_juanzhoudianji')--加载图标
	end
end

--下线回调
function LC_Christmas_OnLogout()
end

function LC_Christmas_juanzhoudianji()
	local ActorID = API_RequestGetActorID()
	local StartTimeTable = YuanDan2011_StartTime
	local EndTimeTable = YuanDan2011_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)

	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		API_ResponseWrite('<win rect="500,175,420,220"></win>')
		API_ResponseWrite('<name>圣诞大使</name>')
		API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
		API_ResponseWrite('<br><a href="LC_Christmas_juanzhoudianji_Title?1=100">购买活动道具</a><br>')
		API_ResponseWrite('<br><a href="LC_Christmas_juanzhoudianji_Title?1=200">活动介绍</a><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_ResponseWrite('<win rect="500,175,420,220"></win>')
		API_ResponseWrite('<name>圣诞大使</name>')
		API_ResponseWrite('<text>亲爱的玩家你好：</text><br>')
		API_ResponseWrite('<text>	英雄岛圣诞元旦活动已结束，谢谢您的参与。</text><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
		return 1		
	end
end

local Christmas_ShopTable = {
	[1] = {
			{GoodsID=89121,ShuiJingBi=100,JinBi=0},
			{GoodsID=89122,ShuiJingBi=100,JinBi=0},
			{GoodsID=89123,ShuiJingBi=0,JinBi=500},
--			{GoodsID=89126,ShuiJingBi=20,JinBi=0},
			},
}

function LC_Christmas_juanzhoudianji_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	local XuanZheFangShi = API_RequestGetNumber(3)
	if Christmas_ShopTable[1] == nil then
		return
	end
	if type(Christmas_ShopTable[1]) ~= 'table' then
		return
	end
	GoodsNum = table.getn(Christmas_ShopTable[1])	
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if Christmas_ShopTable[1][BuyNo] ~= nil then
			local BuyGoodsID = 0
			local BuyShuiJingBi = 0
			local BuyJinBi = 0
			BuyGoodsID = Christmas_ShopTable[1][BuyNo].GoodsID
			BuyShuiJingBi = Christmas_ShopTable[1][BuyNo].ShuiJingBi
			BuyJinBi = Christmas_ShopTable[1][BuyNo].JinBi
			local BuyNum = API_RequestGetNumber(num)
			if BuyNum < 1 then
				BuyNum = 1
			end
			BuyShuiJingBi = BuyShuiJingBi * BuyNum
			BuyJinBi = BuyJinBi * BuyNum
			if BuyShuiJingBi < 0 or BuyShuiJingBi > 100000000 or BuyJinBi < 0 or BuyJinBi > 100000000 then
				return
			end
			if BuyShuiJingBi > 0 and BuyJinBi == 0 then
				if API_ActorGetPropNum(ActorID,208) >= BuyShuiJingBi then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
						if API_ActorShoppingM_Reduce(ActorID,-BuyShuiJingBi,0,'购买活动道具扣除水晶币') then
							API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'圣诞大使')
							API_ResponseWrite('<name>圣诞大使</name>')
							API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
							API_ResponseWrite('<text>您花费</text><text color="255,0,255">'..BuyShuiJingBi..'</text><text>水晶币，购买了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
							API_ResponseWrite('<text>     </text>')
							API_ResponseWrite('<a href="LC_Christmas_juanzhoudianji">返回</a>')
--							for i = 1,BuyNum do
--								if BuyGoodsID == 89036 then
--								elseif BuyGoodsID == 89037 then
--								end
--							end
						end
					else
						API_ResponseWrite('<name>圣诞大使</name>')
						API_ResponseWrite('<text>您的背包空间不足，无法购买</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				else
					API_ResponseWrite('<name>圣诞大使</name>')
					API_ResponseWrite('<text>您的水晶币数量不够，无法购买</text>')
					API_ResponseWrite('<br><br><a>确定</a>')
				end
			end
			if BuyJinBi > 0 and BuyShuiJingBi == 0 then
				if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) >= BuyJinBi then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
						API_ActorAddMoney(ActorID,-BuyJinBi,0,'扣除金币')
						API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'圣诞大使')
						API_ResponseWrite('<name>圣诞大使</name>')
						API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
						API_ResponseWrite('<text>您花费</text><text color="255,0,255">'..BuyJinBi..'</text><text>金币，购买了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
						API_ResponseWrite('<text>     </text>')
						API_ResponseWrite('<a href="LC_Christmas_juanzhoudianji">返回</a>')
--						for i = 1,BuyNum do
--							if BuyGoodsID == 89036 then
--							elseif BuyGoodsID == 89037 then
--							end
--						end
					else
						API_ResponseWrite('<name>圣诞大使</name>')
						API_ResponseWrite('<text>您的背包空间不足，无法购买</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				else
					API_ResponseWrite('<name>圣诞大使</name>')
					API_ResponseWrite('<text>您的金币数量不够，无法购买</text>')
					API_ResponseWrite('<br><br><a>确定</a>')
				end				
			end
		end
		return
	end
	if SelectItem == 100 then
		API_ResponseWrite('<name>圣诞</name>')
		API_ResponseWrite('<win rect="500,175,420,460"></win>')
		API_ResponseWrite('<text color="255,0,255">圣诞元旦活动时间：2012年12月14日～2013年1月3日</text><br><br>')
		for i = 1,GoodsNum do
			if i > Page * 6 and i < (Page + 1) * 6 + 1 then
				local BuyGoodsID = 0
				local BuyShuiJingBi = 0
				local BuyJinBi = 0
				BuyGoodsID = Christmas_ShopTable[1][i].GoodsID
				BuyShuiJingBi = Christmas_ShopTable[1][i].ShuiJingBi
				BuyJinBi = Christmas_ShopTable[1][i].JinBi
				API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
				API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
				if BuyShuiJingBi > 0 then 
					local BuyNumTip = ''
					local BuyPointTip = '<text>  单价：'..string.format("%-5s",BuyShuiJingBi)..'</text>'
					BuyPointTip = BuyPointTip..'<text color="254,249,220">水晶币             </text>'
					local BuyNumTipLen = string.len(BuyPointTip)
					if BuyNumTipLen < 44 then
						for j = 1,44 - BuyNumTipLen do
							BuyPointTip = BuyPointTip..' '
						end
					end
					API_ResponseWrite(''..BuyPointTip..'')
				elseif BuyJinBi > 0 then
					local BuyNumTip = ''
					local BuyPointTip = '<text>  单价：'..string.format("%-5s",BuyJinBi)..'</text>'
					BuyPointTip = BuyPointTip..'<text color="254,249,220">金币               </text>'
					local BuyNumTipLen = string.len(BuyPointTip)
					if BuyNumTipLen < 44 then
						for j = 1,44 - BuyNumTipLen do
							BuyPointTip = BuyPointTip..' '
						end
					end
					API_ResponseWrite(''..BuyPointTip..'')
				end
				local num = i * 100
				API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
				API_ResponseWrite('<text> </text>')
				API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" href="LC_Christmas_juanzhoudianji_Title?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
				API_ResponseWrite('<text>———————————————————————————————</text><br>')
			end
		end
		if GoodsNum < (Page + 1) * 6 then
			for i = 1,(Page + 1) * 6 - GoodsNum do
				API_ResponseWrite('<br><br><br>')
			end
		end
		if GoodsNum > 6 then
			local BackPage = Page - 1
			local NextPage = Page + 1
			if Page == 0 then
				API_ResponseWrite('<br><img src="LuaUse\\button_back_g.bmp"><text>       </text>')
				API_ResponseWrite('<a href="LC_Christmas_juanzhoudianji">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="LC_Christmas_juanzhoudianji_Title?1='..SelectItem..'&2='..NextPage..'">')
			elseif (Page + 1) * 6 < GoodsNum then
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="LC_Christmas_juanzhoudianji_Title?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="LC_Christmas_juanzhoudianji">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="LC_Christmas_juanzhoudianji_Title?1='..SelectItem..'&2='..NextPage..'">')
			else
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="LC_Christmas_juanzhoudianji_Title?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="LC_Christmas_juanzhoudianji">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_g.bmp">')
			end
		else
			API_ResponseWrite('<br><a href="LC_Christmas_juanzhoudianji">  返回</a>')
		end		
	elseif SelectItem == 200 then
		API_ResponseWrite('<win rect="500,175,420,220"></win>')
		API_ResponseWrite('<name>活动介绍</name>')
		API_ResponseWrite('<text>	活动一：砸蛋获新宝宝卡，新圣诞时装，点击右下角活动图标即可参与。（全天）</text><br>')
		API_ResponseWrite('<text>	活动二：砸雪人每日13点、19点在英雄大厅刷新雪人，使用雪球砸雪人可以获得丰厚奖励，雪球直接在此卷轴链接购买。（每天13点与19点）</text><br>')
		API_ResponseWrite('<text>	活动三：圣诞贺卡送祝福，排行版上秀幸福。 （ 全天）</text><br>')
		API_ResponseWrite('<text>	活动四：魂器传承，每日参与十次魂器传承，大量魂器经验，1~3星魂器等你来拿。(全天）</text><br>')	
		API_ResponseWrite('<br><a href="LC_Christmas_juanzhoudianji">  返回</a>')
		API_ResponseFlush(ActorID)	
	end
end

--if Christmas_TimerTriggerID == nil then
--	Christmas_TimerTriggerID = API_CreateTimerTriggerG(0,0,60,-1,'Christmas_TimerTriggerGCallFunc')
--end

if API_GetServerID() == 1 then
	local StartTimeTable = Christmas2011_StartTime
	local EndTimeTable = Christmas2011_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouEnd > 0 then
		if Christmas2011_TimerTriggerGCallFunc ~= nil then
			API_DestroyTriggerG(Christmas2011_TimerTriggerGCallFunc)
		end
		Christmas2011_TimerTriggerGCallFunc = API_CreateTimerTriggerG(0,0,30,-1,'Christmas_TimerTriggerGCallFunc')
	end
end

function Christmas_TimerTriggerGCallFunc()
	local TriggerID = API_GetCurTriggerID()
	local StartTimeTable = Christmas2011_StartTime
	local EndTimeTable = Christmas2011_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		local MapID = 101
		if ChristmasList[MapID] == nil then
			ChristmasList[MapID] = {}
		end

		if Hour == 12 and Minute < 30 and Second < 30 and API_GetServerID() == 1 then
			if math.mod(Minute,10) == 0 then
				API_ActorBroadcastMsg(-1,17,'锵锵锵...圣诞老人12:30将出现在月暮撒礼物啦哦！！！')
				API_ActorBroadcastMsg(-1,1,'锵锵锵...圣诞老人12:30将出现在月暮撒礼物啦哦！！！')
				API_ActorBroadcastMsg(-1,7,'锵锵锵...圣诞老人12:30将出现在月暮撒礼物啦哦！！！')
			end
		end	
		
		if Hour == 17 and Minute < 30 and Second < 30 and API_GetServerID() == 1 then
			if math.mod(Minute,10) == 0 then
				API_ActorBroadcastMsg(-1,17,'锵锵锵...圣诞老人17:30将出现在月暮撒礼物啦哦！！！')
				API_ActorBroadcastMsg(-1,1,'锵锵锵...圣诞老人17:30将出现在月暮撒礼物啦哦！！！')
				API_ActorBroadcastMsg(-1,7,'锵锵锵...圣诞老人17:30将出现在月暮撒礼物啦哦！！！')
			end
		end	
		
		if Hour == 12 and Minute == 30 and Second < 30 then
			local MapConfigID = API_GetMapConfigID(MapID)
			if API_MapIsValid(MapConfigID) then
				local TileX = GLOBAL_SantaClaus_Route[MapConfigID][1].StartTile.TileX
				local TileY = GLOBAL_SantaClaus_Route[MapConfigID][1].StartTile.TileY
				local RouteNum = GLOBAL_SantaClaus_Route[MapConfigID][1].RouteNum
				local Route = GLOBAL_SantaClaus_Route[MapConfigID][1].Route
				SantaClausFastID = API_CreateMonsterEx(MapID,SantaClausID,TileX,TileY,5,0,-1,1)
				ChristmasList[MapID].SantaClausFastID = SantaClausFastID
				API_MonsterMoveTo(SantaClausFastID,RouteNum,Route)
			end
		end
		
		if Hour == 17 and Minute == 30 and Second < 30 then
			local MapConfigID = API_GetMapConfigID(MapID)
			if API_MapIsValid(MapConfigID) then
				local TileX = GLOBAL_SantaClaus_Route[MapConfigID][2].StartTile.TileX
				local TileY = GLOBAL_SantaClaus_Route[MapConfigID][2].StartTile.TileY
				local RouteNum = GLOBAL_SantaClaus_Route[MapConfigID][2].RouteNum
				local Route = GLOBAL_SantaClaus_Route[MapConfigID][2].Route
				SantaClausFastID = API_CreateMonsterEx(MapID,SantaClausID,TileX,TileY,5,0,-1,1)
				ChristmasList[MapID].SantaClausFastID = SantaClausFastID
				API_MonsterMoveTo(SantaClausFastID,RouteNum,Route)
			end
		end
		
		local SantaClausFastID = ChristmasList[MapID].SantaClausFastID
		if SantaClausFastID ~= nil and API_GetMonsterID(SantaClausFastID) > 0 then
			local MapID = API_GetMonsterMap(SantaClausFastID)
			local PosX = API_GetMonsterPosX(SantaClausFastID)
			local PosY = API_GetMonsterPosY(SantaClausFastID)
			local DiaoLuoNum = table.getn(ChristmasList_GoodsTable)
			for i = 1,DiaoLuoNum do 
				local GoodsTable = ChristmasList_GoodsTable[i]
				local GoodsId = GoodsTable.GoodsID
				local Num = GoodsTable.Num
				local Flag = GoodsTable.Flag
				local Odds = GoodsTable.GaiLv
				local Rand = math.random(10000)
				if Rand <= Odds then
					API_CreateDropGoods(MapID,PosX,PosY,GoodsId,Num,Flag,'圣诞礼物',4,0,600,60)
				end
			end
		end
		
		if (Hour == 12 and Minute > 45 ) or (Hour == 17 and Minute > 45) then
			for i in ChristmasList do
				local MapID = i
				if API_MapIsValid(MapID) then
					if type(ChristmasList[MapID]) == 'table' then
						local SantaClausFastID = ChristmasList[MapID].SantaClausFastID
						if SantaClausFastID ~= nil and API_GetMonsterID(SantaClausFastID) > 0 then
							API_DestroyMonster(SantaClausFastID)
							if API_GetServerID() == 1 then
								API_ActorBroadcastMsg(-1,17,'圣诞老人的礼品已经派送完，请关注下次派送礼物的提示。')
								API_ActorBroadcastMsg(-1,1,'圣诞老人的礼品已经派送完，请关注下次派送礼物的提示。')
								API_ActorBroadcastMsg(-1,7,'圣诞老人的礼品已经派送完，请关注下次派送礼物的提示。')
							end	
						end
					end
					ChristmasList[MapID] = nil
				end
			end
		end
	elseif  nShiFouEnd < 0 then
		API_DestroyTriggerG(TriggerID)
	end
end


function Christmas_JuanZhouUse()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID) 
	local StaticMapID = API_GetStaticMapID(MapID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	
	local Time = API_VarDataGetNumber(ActorID,1,30271)
	local LastTime = os.date("*t", Time) 
	if Year ~= LastTime.year or Month ~= LastTime.month or Day ~= LastTime.day then
		API_VarDataSetNumber(ActorID,1,30272,0)
		API_VarDataSetNumber(ActorID,1,30269,0)
	end
	local EnterNum = API_VarDataGetNumber(ActorID,1,30272)
	local ToDayMaxNum = API_VarDataGetNumber(ActorID,1,30269)
	local GuanKa = API_VarDataGetNumber(ActorID,1,30270)
	if MapID == StaticMapID then
--		if GoodsID == 89124 then
			if EnterNum < 1 then
				if GuanKa < 18 then
					if GuanKa == 0 then
						API_ResponseWrite('<name>远古战场</name>')
						API_ResponseWrite('<text>击杀远古战场中的怪物有几率获得高附加属性的防具与饰品，3、6、9、12、15、18轮有几率获得高附加属性的武器。每天玩家可以免费重置1次挑战轮数。</text><br>')
						API_ResponseWrite('<br><a href="Christmas_ShiFouStater?1=100">开始挑战</a><br>')
						API_ResponseWrite('<br><a>关闭</a><br>')
						API_ResponseFlush(ActorID)
						return 1
					else
						API_ResponseWrite('<name>远古战场</name>')
						API_ResponseWrite('<text>击杀远古战场中的怪物有几率获得高附加属性的防具与饰品，3、6、9、12、15、18轮有几率获得高附加属性的武器。每天玩家可以免费重置1次挑战轮数。</text><br>')
						API_ResponseWrite('<br><a href="Christmas_ShiFouStater?1=100">继续上次挑战</a><br>')
						API_ResponseWrite('<br><a href="Christmas_ShiFouStater?1=200">重置挑战轮数（您今天还能免费重置1次）</a><br>')
						API_ResponseWrite('<br><a>关闭</a><br>')
						API_ResponseFlush(ActorID)
						return 1						
					end
				else
					API_ResponseWrite('<name>远古战场</name>')
					API_ResponseWrite('<text>击杀远古战场中的怪物有几率获得高附加属性的防具与饰品，3、6、9、12、15、18轮有几率获得高附加属性的武器。每天玩家可以免费重置1次挑战轮数。</text><br>')
					API_ResponseWrite('<text>您已通关远古战场。</text><br>')
					API_ResponseWrite('<br><a href="Christmas_ShiFouStater?1=200">重置挑战轮数（您今天还能免费重置1次）</a><br>')
					API_ResponseWrite('<br><a>关闭</a><br>')
					API_ResponseFlush(ActorID)
					return 1				
				end
			else
				if GuanKa < 18 then
					if ToDayMaxNum < 3 then
						local Point = (ToDayMaxNum + 1) * 100
						API_ResponseWrite('<name>远古战场</name>')
						API_ResponseWrite('<text>击杀远古战场中的怪物有几率获得高附加属性的防具与饰品，3、6、9、12、15、18轮有几率获得高附加属性的武器。每天玩家可以免费重置1次挑战轮数。</text><br>')
						API_ResponseWrite('<br><a href="Christmas_ShiFouStater?1=100">继续上次挑战</a><br>')
						API_ResponseWrite('<br><a href="Christmas_ShiFouStater?1=200">重置挑战轮数（花费'..Point..'云游重置挑战轮数）</a><br>')
						API_ResponseWrite('<br><a>关闭</a><br>')
						API_ResponseFlush(ActorID)
						return 1
					else
						API_ResponseWrite('<name>远古战场</name>')
						API_ResponseWrite('<text>击杀远古战场中的怪物有几率获得高附加属性的防具与饰品，3、6、9、12、15、18轮有几率获得高附加属性的武器。每天玩家可以免费重置1次挑战轮数。</text><br>')
						API_ResponseWrite('<br><a href="Christmas_ShiFouStater?1=100">继续上次挑战</a><br>')
						API_ResponseWrite('<br><a>您今天的重置次数已达到上限，欢迎明天再来挑战</a><br>')
						API_ResponseWrite('<br><a>关闭</a><br>')
						API_ResponseFlush(ActorID)
						return 1				
					end
				else
					if ToDayMaxNum < 3 then
						local Point = (ToDayMaxNum + 1) * 100
						API_ResponseWrite('<name>远古战场</name>')
						API_ResponseWrite('<text>击杀远古战场中的怪物有几率获得高附加属性的防具与饰品，3、6、9、12、15、18轮有几率获得高附加属性的武器。每天玩家可以免费重置1次挑战轮数。</text><br>')
						API_ResponseWrite('<text>您已通关远古战场。</text><br>')
						API_ResponseWrite('<br><a href="Christmas_ShiFouStater?1=200">重置挑战轮数（花费'..Point..'云游重置挑战轮数）</a><br>')
						API_ResponseWrite('<br><a>关闭</a><br>')
						API_ResponseFlush(ActorID)
						return 1	
					else
						API_ResponseWrite('<name>远古战场</name>')
						API_ResponseWrite('<text>击杀远古战场中的怪物有几率获得高附加属性的防具与饰品，3、6、9、12、15、18轮有几率获得高附加属性的武器。每天玩家可以免费重置1次挑战轮数。</text><br>')
						API_ResponseWrite('<text>您已通关远古战场。</text><br>')
						API_ResponseWrite('<br><a>您今天的重置次数已达到上限，欢迎明天再来挑战</a><br>')
						API_ResponseWrite('<br><a>关闭</a><br>')
						API_ResponseFlush(ActorID)
						return 1							
					end
				end
			end
--		elseif GoodsID == 89125 then
--			API_ResponseWrite('<name>大乐斗</name>')
--			API_ResponseWrite('<text>击杀关怪物之后有几率可获得高附加属性的装备一件.</text><br>')
--			API_ResponseWrite('<br><a href="Christmas_ShiFouStater?1='..GoodsID..'">我要进入</a><br>')
--			API_ResponseWrite('<br><a>关闭</a><br>')
--			API_ResponseFlush(ActorID)
--			return 1		
--		end
--	else
--		API_ResponseWrite('<name>大乐斗</name>')
--		API_ResponseWrite('<text>传送卷使用失败！亲爱的玩家，当前地图不允许使用该物品，请切换地图尝试使用。</text><br>')
--		API_ResponseWrite('<br><a>关闭</a><br>')
--		API_ResponseFlush(ActorID)
--		return 0
	end
end

function Christmas_ShiFouStater()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>快递中，无法进入远古战场！</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 
	end
	if API_ActorFindStatus(ActorID,519) then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>摆摊中，无法进入远古战场！</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 
	end
	if API_ActorIsDying(ActorID) then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>角色死亡，无法进入远古战场！</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 
	end
	if API_VarDataGetNumber(ActorID,1,11816) > 0 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>在公交车上无法进入远古战场！</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
	ChristmasFuBen_Create(ActorID,XuanZe)
end

function ChristmasFuBen_Create(ActorID,XuanZe)
	local ActorID = ActorID or API_RequestGetActorID() 
	local StaticMapID = 2032
	local ObjectMapID = API_CreateEctype(StaticMapID,0)
	if ChristmasFuBenList[ObjectMapID] == nil then
		ChristmasFuBenList[ObjectMapID] = {}
	end
	local GuanKa = API_VarDataGetNumber(ActorID,1,30270)
	if XuanZe == 100 then
		if GuanKa == 18 then
			return
		end
		ChristmasFuBenList[ObjectMapID].LunShu = GuanKa
	elseif XuanZe == 200 then
	end
	API_CreateMonster(ObjectMapID,11607,167,123,3,0,-1)
	ChristmasFuBen_PlayGotoMap(ObjectMapID,ActorID,XuanZe)
end

local MonsterMoveTable = {
StartTile = {TileX = 122,TileY = 126},
RouteNum = 3,
Route = {167,123,1,153,123,1,138,124,1,122,126},
} 

function ChristmasFuBen_PlayGotoMap(ObjectMapID,ActorID,XuanZe)
	local EnterNum = API_VarDataGetNumber(ActorID,1,30272)
	local ToDayMaxNum = API_VarDataGetNumber(ActorID,1,30269)
	if ChristmasFuBenList[ObjectMapID] == nil then
		ChristmasFuBenList[ObjectMapID] = {}
	end
	if XuanZe == 100 then
--		if EnterNum < 3 then
--			if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用圣元卷轴') then--销毁玩家身上的物品
--				API_ActorGoToMap(ActorID,ObjectMapID,122,126)
--				EnterNum = EnterNum + 1
--				API_VarDataSetNumber(ActorID,1,30272,EnterNum)
--				local Time = os.time()
--				API_VarDataSetNumber(ActorID,1,30271,Time)
--				local ActorDieTriggerID = API_CreateDieTriggerG(0,0,1,ActorID,'ChristmasFuBen_ActorDie')
--				ChristmasFuBenList[ObjectMapID].ActorDieTriggerID = ActorDieTriggerID
--			end
--		else
--			API_ActorSendMsg(ActorID,3,'进入失败')
--			return
--		end
		API_ActorGoToMap(ActorID,ObjectMapID,167,123)
		local ActorDieTriggerID = API_CreateDieTriggerG(0,0,1,ActorID,'ChristmasFuBen_ActorDie')
		ChristmasFuBenList[ObjectMapID].ActorDieTriggerID = ActorDieTriggerID
	elseif XuanZe == 200 then
--		if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用圣元卷轴') then--销毁玩家身上的物品
--			API_ActorGoToMap(ActorID,ObjectMapID,122,126)
--			local ActorDieTriggerID = API_CreateDieTriggerG(0,0,1,ActorID,'ChristmasFuBen_ActorDie')
--			ChristmasFuBenList[ObjectMapID].ActorDieTriggerID = ActorDieTriggerID
--		end
		if EnterNum == 1 then
			local Point = (ToDayMaxNum + 1) * 100
			if API_ActorGetGoodsNum(ActorID,80818) >= Point then
				if API_ActorRemoveGoods(ActorID,80818,Point,"删除对应数量的云游代金券") then
					ChristmasFuBenList[ObjectMapID].LunShu = 0
					API_VarDataSetNumber(ActorID,1,30270,ChristmasFuBenList[ObjectMapID].LunShu)
					API_ActorGoToMap(ActorID,ObjectMapID,167,123)
					local Number = API_VarDataGetNumber(ActorID,1,30269)
					Number = Number + 1
					API_VarDataSetNumber(ActorID,1,30269,Number)
					API_VarDataSetNumber(ActorID,1,30272,1)
					local Time = os.time()
					API_VarDataSetNumber(ActorID,1,30271,Time)
					local ActorDieTriggerID = API_CreateDieTriggerG(0,0,1,ActorID,'ChristmasFuBen_ActorDie')
					ChristmasFuBenList[ObjectMapID].ActorDieTriggerID = ActorDieTriggerID
					if Number == 1 then
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[73][3][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[73][3][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[73][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[73][3][LaiYuan] + 1
						end
					elseif Number == 2 then
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[73][4][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[73][4][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[73][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[73][4][LaiYuan] + 1
						end
					elseif Number == 3 then
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[73][5][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[73][5][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[73][5][LaiYuan] = GLOBAL_FengXiangBiao_DateList[73][5][LaiYuan] + 1
						end
					end
				end
			else
				API_ResponseWrite('<name>远古战场</name>')
				API_ResponseWrite('<text>您的云游代金券数量不够，进入失败。</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end			
		else
			ChristmasFuBenList[ObjectMapID].LunShu = 0
			API_VarDataSetNumber(ActorID,1,30270,ChristmasFuBenList[ObjectMapID].LunShu)
			API_ActorGoToMap(ActorID,ObjectMapID,167,123)
			API_VarDataSetNumber(ActorID,1,30272,1)
			local Time = os.time()
			API_VarDataSetNumber(ActorID,1,30271,Time)
			local ActorDieTriggerID = API_CreateDieTriggerG(0,0,1,ActorID,'ChristmasFuBen_ActorDie')
			ChristmasFuBenList[ObjectMapID].ActorDieTriggerID = ActorDieTriggerID
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[73][2][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[73][2][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[73][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[73][2][LaiYuan] + 1
			end
		end	
	end
	local LaiYuan = API_ActorGetPropNum(ActorID,201)
	if GLOBAL_FengXiangBiao_DateList[73][1][LaiYuan] == nil then
		GLOBAL_FengXiangBiao_DateList[73][1][LaiYuan] = 1
	else
		GLOBAL_FengXiangBiao_DateList[73][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[73][1][LaiYuan] + 1
	end

	local RouteNum = MonsterMoveTable.RouteNum
	local Route = MonsterMoveTable.Route
	local TileX = MonsterMoveTable.StartTile.TileX
	local TileY = MonsterMoveTable.StartTile.TileY
	local MonsterID = MonsterIDTable[ChristmasFuBenList[ObjectMapID].LunShu + 1]
	if ChristmasFuBenList[ObjectMapID].LunShu == 18 then
		MonsterID = MonsterIDTable[1]
	end
	ChristmasMonsterFastID = API_CreateMonster(ObjectMapID,MonsterID,TileX,TileY,5,0,-1)
--	API_MonsterMoveTo(ChristmasMonsterFastID,RouteNum,Route) 
	ChristmasFuBenList[ObjectMapID].MonsterFastID = ChristmasMonsterFastID
	API_CreateDieTriggerG(ObjectMapID,0,0,ChristmasMonsterFastID,'ChristmasFuBen_CreateMonster')
	ChristmasFuBen_KillMonsterLunShu(ObjectMapID,ActorID)
end

local GoodsJiangLi = {
[1] = {
		[1]={
					{GoodsID = 2001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--夺目钥匙
					{GoodsID = 3001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--树妖扫帚
					{GoodsID = 3901,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--猫人之盾
					
					{GoodsID = 4001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸头盔
					{GoodsID = 4101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸胸甲
					{GoodsID = 4001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸头盔
					{GoodsID = 4101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸胸甲
					
					{GoodsID = 6601,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--刺客飘带
					{GoodsID = 6901,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--猛兽之眼
					{GoodsID = 8101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--猛兽之戒
					{GoodsID = 6601,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--刺客飘带
					{GoodsID = 6901,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--猛兽之眼
					{GoodsID = 8101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--猛兽之戒
					
					{GoodsID = 4401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腿甲
					{GoodsID = 4501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸之靴
					{GoodsID = 4401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腿甲
					{GoodsID = 4501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸之靴
					{GoodsID = 4401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腿甲
					{GoodsID = 4501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸之靴
					{GoodsID = 4401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腿甲
					{GoodsID = 4501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸之靴
					
					{GoodsID = 4301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腰带
					{GoodsID = 4201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸手套
					{GoodsID = 4301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腰带
					{GoodsID = 4201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸手套
					{GoodsID = 4301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腰带
					{GoodsID = 4201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸手套
					{GoodsID = 4301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腰带
					{GoodsID = 4201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸手套
					{GoodsID = 4301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腰带
					{GoodsID = 4201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸手套

					{GoodsID = 1501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--长筒狩猎步枪
					
					{GoodsID = 5001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影之帽
					{GoodsID = 5101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影之服
					{GoodsID = 5001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影之帽
					{GoodsID = 5101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影之服
					
					{GoodsID = 6701,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔王之眼
					{GoodsID = 7001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--鬼魅项链
					{GoodsID = 8201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--鬼魅之戒 
					{GoodsID = 6701,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔王之眼
					{GoodsID = 7001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--鬼魅项链
					{GoodsID = 8201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--鬼魅之戒 
					
					{GoodsID = 5401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影护腿 
					{GoodsID = 5501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影马靴
					{GoodsID = 5401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影护腿 
					{GoodsID = 5501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影马靴
					{GoodsID = 5401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影护腿 
					{GoodsID = 5501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影马靴
					{GoodsID = 5401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影护腿 
					{GoodsID = 5501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影马靴
					
					{GoodsID = 5301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影腰带
					{GoodsID = 5201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影手套
					{GoodsID = 5301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影腰带
					{GoodsID = 5201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影手套
					{GoodsID = 5301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影腰带
					{GoodsID = 5201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影手套
					{GoodsID = 5301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影腰带
					{GoodsID = 5201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影手套
					{GoodsID = 5301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影腰带
					{GoodsID = 5201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影手套
					
					{GoodsID = 1001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--智者之书
					
					{GoodsID = 6001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀头巾
					{GoodsID = 6101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀法袍
					{GoodsID = 6001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀头巾
					{GoodsID = 6101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀法袍
					
					{GoodsID = 6801,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--鬼魅披肩
					{GoodsID = 8001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--地狱项链
					{GoodsID = 8301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--地狱之戒
					{GoodsID = 6801,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--鬼魅披肩
					{GoodsID = 8001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--地狱项链
					{GoodsID = 8301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--地狱之戒
					
					{GoodsID = 6401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀护腿
					{GoodsID = 6501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀之靴
					{GoodsID = 6401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀护腿
					{GoodsID = 6501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀之靴
					{GoodsID = 6401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀护腿
					{GoodsID = 6501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀之靴
					{GoodsID = 6401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀护腿
					{GoodsID = 6501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀之靴
					
					{GoodsID = 6301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀束带
					{GoodsID = 6201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀手套
					{GoodsID = 6301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀束带
					{GoodsID = 6201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀手套
					{GoodsID = 6301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀束带
					{GoodsID = 6201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀手套
					{GoodsID = 6301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀束带
					{GoodsID = 6201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀手套
					{GoodsID = 6301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀束带
					{GoodsID = 6201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀手套
					},
				[2] = {
					{GoodsID = 2002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--阔刃双手剑 
					{GoodsID = 3002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--夜行短剑
					{GoodsID = 3902,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--十字钢盾

					{GoodsID = 4002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护头盔 
					{GoodsID = 4102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护胸甲
					{GoodsID = 4002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护头盔 
					{GoodsID = 4102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护胸甲
					
					{GoodsID = 6602,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--怒焰披风
					{GoodsID = 6902,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--虎击项链
					{GoodsID = 8102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--虎击指环
					{GoodsID = 6602,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--怒焰披风
					{GoodsID = 6902,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--虎击项链
					{GoodsID = 8102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--虎击指环
					
					{GoodsID = 4402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腿甲
					{GoodsID = 4502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护之靴
					{GoodsID = 4402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腿甲
					{GoodsID = 4502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护之靴
					{GoodsID = 4402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腿甲
					{GoodsID = 4502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护之靴
					{GoodsID = 4402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腿甲
					{GoodsID = 4502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护之靴
					
					{GoodsID = 4302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腰带
					{GoodsID = 4202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护手套
					{GoodsID = 4302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腰带
					{GoodsID = 4202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护手套
					{GoodsID = 4302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腰带
					{GoodsID = 4202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护手套
					{GoodsID = 4302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腰带
					{GoodsID = 4202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护手套
					{GoodsID = 4302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腰带
					{GoodsID = 4202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护手套
					
					{GoodsID = 1502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--大口径霰弹枪
					
					{GoodsID = 5002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风军帽 
					{GoodsID = 5102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风制服
					{GoodsID = 5002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风军帽 
					{GoodsID = 5102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风制服
					
					{GoodsID = 6702,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--血魂飘带
					{GoodsID = 7002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--夜幕项链 
					{GoodsID = 8202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--夜幕指环
					{GoodsID = 6702,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--血魂飘带
					{GoodsID = 7002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--夜幕项链 
					{GoodsID = 8202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--夜幕指环

					{GoodsID = 5402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风护腿
					{GoodsID = 5502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风马靴
					{GoodsID = 5402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风护腿
					{GoodsID = 5502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风马靴
					{GoodsID = 5402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风护腿
					{GoodsID = 5502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风马靴
					{GoodsID = 5402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风护腿
					{GoodsID = 5502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风马靴
					
					{GoodsID = 5302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风腰带
					{GoodsID = 5202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风手套
					{GoodsID = 5302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风腰带
					{GoodsID = 5202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风手套
					{GoodsID = 5302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风腰带
					{GoodsID = 5202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风手套
					{GoodsID = 5302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风腰带
					{GoodsID = 5202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风手套
					{GoodsID = 5302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风腰带
					{GoodsID = 5202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风手套
					
					{GoodsID = 1002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--贤者之书
					
					{GoodsID = 6002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力头巾
					{GoodsID = 6102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力法袍	
					{GoodsID = 6002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力头巾
					{GoodsID = 6102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力法袍
					
					{GoodsID = 6802,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--傀儡师披风
					{GoodsID = 8002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--圣光项链
					{GoodsID = 8302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--圣光之戒 
					{GoodsID = 6802,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--傀儡师披风
					{GoodsID = 8002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--圣光项链
					{GoodsID = 8302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--圣光之戒 
					
					{GoodsID = 6402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力护腿
					{GoodsID = 6502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力之靴
					{GoodsID = 6402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力护腿
					{GoodsID = 6502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力之靴
					{GoodsID = 6402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力护腿
					{GoodsID = 6502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力之靴
					{GoodsID = 6402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力护腿
					{GoodsID = 6502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力之靴
					
					{GoodsID = 6302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力束带 
					{GoodsID = 6202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力手套
					{GoodsID = 6302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力束带 
					{GoodsID = 6202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力手套
					{GoodsID = 6302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力束带 
					{GoodsID = 6202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力手套
					{GoodsID = 6302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力束带 
					{GoodsID = 6202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力手套
					{GoodsID = 6302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力束带 
					{GoodsID = 6202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力手套
					},
				[3] = {
					{GoodsID = 2003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--咆哮重剑 
					{GoodsID = 3003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--骑士之剑 
					{GoodsID = 3903,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--守卫之盾 

					{GoodsID = 4103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮胸甲
					{GoodsID = 4003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮头盔
					{GoodsID = 4103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮胸甲
					{GoodsID = 4003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮头盔
					
					{GoodsID = 6703,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--恶魔翅膀 
					{GoodsID = 7003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--搏击项链 
					{GoodsID = 8203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--搏击指环 
					{GoodsID = 6703,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--恶魔翅膀 
					{GoodsID = 7003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--搏击项链 
					{GoodsID = 8203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--搏击指环 
					
					{GoodsID = 4403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护腿
					{GoodsID = 4503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮战靴
					{GoodsID = 4403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护腿
					{GoodsID = 4503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮战靴
					{GoodsID = 4403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护腿
					{GoodsID = 4503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮战靴
					{GoodsID = 4403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护腿
					{GoodsID = 4503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮战靴
					
					{GoodsID = 4303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮腰带
					{GoodsID = 4203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护手
					{GoodsID = 4303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮腰带
					{GoodsID = 4203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护手
					{GoodsID = 4303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮腰带
					{GoodsID = 4203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护手
					{GoodsID = 4303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮腰带
					{GoodsID = 4203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护手
					{GoodsID = 4303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮腰带
					{GoodsID = 4203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护手
					
					{GoodsID = 1503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--强力射钉枪 

					{GoodsID = 5003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧之帽
					{GoodsID = 5103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧制服
					{GoodsID = 5003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧之帽
					{GoodsID = 5103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧制服
					
					{GoodsID = 6603,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--蝙蝠飘带			
					{GoodsID = 6903,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--恋人之心 
					{GoodsID = 8103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--恋人之戒 
					{GoodsID = 6603,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--蝙蝠飘带			
					{GoodsID = 6903,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--恋人之心 
					{GoodsID = 8103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--恋人之戒 
					
					{GoodsID = 5303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧腰带
					{GoodsID = 5203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧手套
					{GoodsID = 5303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧腰带
					{GoodsID = 5203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧手套
					{GoodsID = 5303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧腰带
					{GoodsID = 5203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧手套
					{GoodsID = 5303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧腰带
					{GoodsID = 5203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧手套
					
					{GoodsID = 5403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧护腿
					{GoodsID = 5503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧马靴
					{GoodsID = 5403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧护腿
					{GoodsID = 5503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧马靴
					{GoodsID = 5403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧护腿
					{GoodsID = 5503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧马靴
					{GoodsID = 5403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧护腿
					{GoodsID = 5503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧马靴
					{GoodsID = 5403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧护腿
					{GoodsID = 5503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧马靴
					
					{GoodsID = 1003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--缚法之书
					
					{GoodsID = 6003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑头巾
					{GoodsID = 6103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑法袍
					{GoodsID = 6003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑头巾
					{GoodsID = 6103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑法袍
					
					{GoodsID = 6803,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--魔咒披风 
					{GoodsID = 8003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--魔龙之心 
					{GoodsID = 8303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--魔龙之戒 
					{GoodsID = 6803,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--魔咒披风 
					{GoodsID = 8003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--魔龙之心 
					{GoodsID = 8303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--魔龙之戒 
					
					{GoodsID = 6403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑护腿
					{GoodsID = 6503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑之靴 
					{GoodsID = 6403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑护腿
					{GoodsID = 6503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑之靴 
					{GoodsID = 6403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑护腿
					{GoodsID = 6503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑之靴 
					{GoodsID = 6403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑护腿
					{GoodsID = 6503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑之靴 
					
					{GoodsID = 6303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑束带
					{GoodsID = 6203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑手套
					{GoodsID = 6303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑束带
					{GoodsID = 6203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑手套
					{GoodsID = 6303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑束带
					{GoodsID = 6203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑手套
					{GoodsID = 6303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑束带
					{GoodsID = 6203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑手套
					{GoodsID = 6303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑束带
					{GoodsID = 6203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑手套
					},
		},
[2] = {
		[1]={					
					{GoodsID = 4001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸头盔
					{GoodsID = 4101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸胸甲
					{GoodsID = 4001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸头盔
					{GoodsID = 4101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸胸甲
					
					{GoodsID = 6601,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--刺客飘带
					{GoodsID = 6901,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--猛兽之眼
					{GoodsID = 8101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--猛兽之戒
					{GoodsID = 6601,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--刺客飘带
					{GoodsID = 6901,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--猛兽之眼
					{GoodsID = 8101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--猛兽之戒
					
					{GoodsID = 4401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腿甲
					{GoodsID = 4501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸之靴
					{GoodsID = 4401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腿甲
					{GoodsID = 4501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸之靴
					{GoodsID = 4401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腿甲
					{GoodsID = 4501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸之靴
					{GoodsID = 4401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腿甲
					{GoodsID = 4501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸之靴
					
					{GoodsID = 4301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腰带
					{GoodsID = 4201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸手套
					{GoodsID = 4301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腰带
					{GoodsID = 4201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸手套
					{GoodsID = 4301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腰带
					{GoodsID = 4201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸手套
					{GoodsID = 4301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腰带
					{GoodsID = 4201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸手套
					{GoodsID = 4301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸腰带
					{GoodsID = 4201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--钢铸手套
					
					{GoodsID = 5001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影之帽
					{GoodsID = 5101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影之服
					{GoodsID = 5001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影之帽
					{GoodsID = 5101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影之服
					
					{GoodsID = 6701,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔王之眼
					{GoodsID = 7001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--鬼魅项链
					{GoodsID = 8201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--鬼魅之戒 
					{GoodsID = 6701,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔王之眼
					{GoodsID = 7001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--鬼魅项链
					{GoodsID = 8201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--鬼魅之戒 
					
					{GoodsID = 5401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影护腿 
					{GoodsID = 5501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影马靴
					{GoodsID = 5401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影护腿 
					{GoodsID = 5501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影马靴
					{GoodsID = 5401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影护腿 
					{GoodsID = 5501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影马靴
					{GoodsID = 5401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影护腿 
					{GoodsID = 5501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影马靴
					
					{GoodsID = 5301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影腰带
					{GoodsID = 5201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影手套
					{GoodsID = 5301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影腰带
					{GoodsID = 5201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影手套
					{GoodsID = 5301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影腰带
					{GoodsID = 5201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影手套
					{GoodsID = 5301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影腰带
					{GoodsID = 5201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影手套
					{GoodsID = 5301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影腰带
					{GoodsID = 5201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--幻影手套
										
					{GoodsID = 6001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀头巾
					{GoodsID = 6101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀法袍
					{GoodsID = 6001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀头巾
					{GoodsID = 6101,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀法袍
					
					{GoodsID = 6801,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--鬼魅披肩
					{GoodsID = 8001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--地狱项链
					{GoodsID = 8301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--地狱之戒
					{GoodsID = 6801,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--鬼魅披肩
					{GoodsID = 8001,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--地狱项链
					{GoodsID = 8301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--地狱之戒
					
					{GoodsID = 6401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀护腿
					{GoodsID = 6501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀之靴
					{GoodsID = 6401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀护腿
					{GoodsID = 6501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀之靴
					{GoodsID = 6401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀护腿
					{GoodsID = 6501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀之靴
					{GoodsID = 6401,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀护腿
					{GoodsID = 6501,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀之靴
					
					{GoodsID = 6301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀束带
					{GoodsID = 6201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀手套
					{GoodsID = 6301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀束带
					{GoodsID = 6201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀手套
					{GoodsID = 6301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀束带
					{GoodsID = 6201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀手套
					{GoodsID = 6301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀束带
					{GoodsID = 6201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀手套
					{GoodsID = 6301,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀束带
					{GoodsID = 6201,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--闪耀手套
					},
				[2] = {
					{GoodsID = 4002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护头盔 
					{GoodsID = 4102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护胸甲
					{GoodsID = 4002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护头盔 
					{GoodsID = 4102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护胸甲
					
					{GoodsID = 6602,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--怒焰披风
					{GoodsID = 6902,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--虎击项链
					{GoodsID = 8102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--虎击指环
					{GoodsID = 6602,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--怒焰披风
					{GoodsID = 6902,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--虎击项链
					{GoodsID = 8102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--虎击指环
					
					{GoodsID = 4402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腿甲
					{GoodsID = 4502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护之靴
					{GoodsID = 4402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腿甲
					{GoodsID = 4502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护之靴
					{GoodsID = 4402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腿甲
					{GoodsID = 4502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护之靴
					{GoodsID = 4402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腿甲
					{GoodsID = 4502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护之靴
					
					{GoodsID = 4302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腰带
					{GoodsID = 4202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护手套
					{GoodsID = 4302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腰带
					{GoodsID = 4202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护手套
					{GoodsID = 4302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腰带
					{GoodsID = 4202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护手套
					{GoodsID = 4302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腰带
					{GoodsID = 4202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护手套
					{GoodsID = 4302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护腰带
					{GoodsID = 4202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--守护手套
										
					{GoodsID = 5002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风军帽 
					{GoodsID = 5102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风制服
					{GoodsID = 5002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风军帽 
					{GoodsID = 5102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风制服
					
					{GoodsID = 6702,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--血魂飘带
					{GoodsID = 7002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--夜幕项链 
					{GoodsID = 8202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--夜幕指环
					{GoodsID = 6702,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--血魂飘带
					{GoodsID = 7002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--夜幕项链 
					{GoodsID = 8202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--夜幕指环

					{GoodsID = 5402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风护腿
					{GoodsID = 5502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风马靴
					{GoodsID = 5402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风护腿
					{GoodsID = 5502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风马靴
					{GoodsID = 5402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风护腿
					{GoodsID = 5502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风马靴
					{GoodsID = 5402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风护腿
					{GoodsID = 5502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风马靴
					
					{GoodsID = 5302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风腰带
					{GoodsID = 5202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风手套
					{GoodsID = 5302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风腰带
					{GoodsID = 5202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风手套
					{GoodsID = 5302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风腰带
					{GoodsID = 5202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风手套
					{GoodsID = 5302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风腰带
					{GoodsID = 5202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风手套
					{GoodsID = 5302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风腰带
					{GoodsID = 5202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--防风手套
										
					{GoodsID = 6002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力头巾
					{GoodsID = 6102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力法袍	
					{GoodsID = 6002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力头巾
					{GoodsID = 6102,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力法袍
					
					{GoodsID = 6802,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--傀儡师披风
					{GoodsID = 8002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--圣光项链
					{GoodsID = 8302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--圣光之戒 
					{GoodsID = 6802,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--傀儡师披风
					{GoodsID = 8002,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--圣光项链
					{GoodsID = 8302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--圣光之戒 
					
					{GoodsID = 6402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力护腿
					{GoodsID = 6502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力之靴
					{GoodsID = 6402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力护腿
					{GoodsID = 6502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力之靴
					{GoodsID = 6402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力护腿
					{GoodsID = 6502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力之靴
					{GoodsID = 6402,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力护腿
					{GoodsID = 6502,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力之靴
					
					{GoodsID = 6302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力束带 
					{GoodsID = 6202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力手套
					{GoodsID = 6302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力束带 
					{GoodsID = 6202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力手套
					{GoodsID = 6302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力束带 
					{GoodsID = 6202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力手套
					{GoodsID = 6302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力束带 
					{GoodsID = 6202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力手套
					{GoodsID = 6302,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力束带 
					{GoodsID = 6202,Num = 1,Bind = 3,Odds =10000,PinZhi=7},--魔力手套
					},
				[3] = {
					{GoodsID = 4103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮胸甲
					{GoodsID = 4003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮头盔
					{GoodsID = 4103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮胸甲
					{GoodsID = 4003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮头盔
					
					{GoodsID = 6703,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--恶魔翅膀 
					{GoodsID = 7003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--搏击项链 
					{GoodsID = 8203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--搏击指环 
					{GoodsID = 6703,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--恶魔翅膀 
					{GoodsID = 7003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--搏击项链 
					{GoodsID = 8203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--搏击指环 
					
					{GoodsID = 4403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护腿
					{GoodsID = 4503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮战靴
					{GoodsID = 4403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护腿
					{GoodsID = 4503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮战靴
					{GoodsID = 4403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护腿
					{GoodsID = 4503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮战靴
					{GoodsID = 4403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护腿
					{GoodsID = 4503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮战靴
					
					{GoodsID = 4303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮腰带
					{GoodsID = 4203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护手
					{GoodsID = 4303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮腰带
					{GoodsID = 4203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护手
					{GoodsID = 4303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮腰带
					{GoodsID = 4203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护手
					{GoodsID = 4303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮腰带
					{GoodsID = 4203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护手
					{GoodsID = 4303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮腰带
					{GoodsID = 4203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--野蛮护手
					
					{GoodsID = 5003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧之帽
					{GoodsID = 5103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧制服
					{GoodsID = 5003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧之帽
					{GoodsID = 5103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧制服
					
					{GoodsID = 6603,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--蝙蝠飘带			
					{GoodsID = 6903,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--恋人之心 
					{GoodsID = 8103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--恋人之戒 
					{GoodsID = 6603,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--蝙蝠飘带			
					{GoodsID = 6903,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--恋人之心 
					{GoodsID = 8103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--恋人之戒 
					
					{GoodsID = 5303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧腰带
					{GoodsID = 5203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧手套
					{GoodsID = 5303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧腰带
					{GoodsID = 5203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧手套
					{GoodsID = 5303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧腰带
					{GoodsID = 5203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧手套
					{GoodsID = 5303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧腰带
					{GoodsID = 5203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧手套
					
					{GoodsID = 5403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧护腿
					{GoodsID = 5503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧马靴
					{GoodsID = 5403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧护腿
					{GoodsID = 5503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧马靴
					{GoodsID = 5403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧护腿
					{GoodsID = 5503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧马靴
					{GoodsID = 5403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧护腿
					{GoodsID = 5503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧马靴
					{GoodsID = 5403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧护腿
					{GoodsID = 5503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--灵巧马靴
										
					{GoodsID = 6003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑头巾
					{GoodsID = 6103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑法袍
					{GoodsID = 6003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑头巾
					{GoodsID = 6103,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑法袍
					
					{GoodsID = 6803,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--魔咒披风 
					{GoodsID = 8003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--魔龙之心 
					{GoodsID = 8303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--魔龙之戒 
					{GoodsID = 6803,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--魔咒披风 
					{GoodsID = 8003,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--魔龙之心 
					{GoodsID = 8303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--魔龙之戒 
					
					{GoodsID = 6403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑护腿
					{GoodsID = 6503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑之靴 
					{GoodsID = 6403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑护腿
					{GoodsID = 6503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑之靴 
					{GoodsID = 6403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑护腿
					{GoodsID = 6503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑之靴 
					{GoodsID = 6403,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑护腿
					{GoodsID = 6503,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑之靴 
					
					{GoodsID = 6303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑束带
					{GoodsID = 6203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑手套
					{GoodsID = 6303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑束带
					{GoodsID = 6203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑手套
					{GoodsID = 6303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑束带
					{GoodsID = 6203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑手套
					{GoodsID = 6303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑束带
					{GoodsID = 6203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑手套
					{GoodsID = 6303,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑束带
					{GoodsID = 6203,Num = 1,Bind = 3,Odds = 10000,PinZhi = 7},--星屑手套
					},
		},
}

function ChristmasFuBen_ActorDie(a,b,Type,FastID,KillerType,KillerID,ActorID,DynamicMapID,PosX,PosY)
		if KillerType == -1 then
			API_DestroyEctype(DynamicMapID)
			return
		end
		local LunShu = ChristmasFuBenList[DynamicMapID].LunShu
		local ActorDieTriggerID = ChristmasFuBenList[DynamicMapID].ActorDieTriggerID
		if ActorDieTriggerID ~= nil then
			API_DestroyTriggerG(ActorDieTriggerID)
		end
		local MonsterDieTriggerID = ChristmasFuBenList[DynamicMapID].MonsterDieTriggerID
		if MonsterDieTriggerID ~= nil then
			API_DestroyTriggerG(MonsterDieTriggerID)
		end
		API_ActorBroadcastMsg(DynamicMapID,4,'')
		API_ActorGoToBackMap(ActorID)
		API_ResponseWrite('<name>远古战场</name>')
		API_ResponseWrite('<text>击杀远古战场中的精英怪可获得高附加属性装备，目前成绩通关'..LunShu..'轮。</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)	
		if LunShu >=15 then
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[73][6][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[73][6][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[73][6][LaiYuan] = GLOBAL_FengXiangBiao_DateList[73][6][LaiYuan] + 1
			end
		elseif LunShu >=12 then
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[73][7][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[73][7][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[73][7][LaiYuan] = GLOBAL_FengXiangBiao_DateList[73][7][LaiYuan] + 1
			end
		elseif LunShu >= 9 then
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[73][8][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[73][8][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[73][8][LaiYuan] = GLOBAL_FengXiangBiao_DateList[73][8][LaiYuan] + 1
			end
		elseif LunShu >= 6 then
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[73][9][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[73][9][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[73][9][LaiYuan] = GLOBAL_FengXiangBiao_DateList[73][9][LaiYuan] + 1
			end
		elseif LunShu >= 3 then
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[73][10][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[73][10][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[73][10][LaiYuan] = GLOBAL_FengXiangBiao_DateList[73][10][LaiYuan] + 1
			end
		end
end

function ChristmasFuBen_CreateMonster(MapID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	local ActorID = KillerID
	local MonsterFastID = ChristmasFuBenList[MapID].MonsterFastID 
	local LunShu = ChristmasFuBenList[MapID].LunShu
	local Level = API_GetActorExpLevel(ActorID)
	local Type = 1
	if Level < 26 then
		Type = 1
	elseif Level < 41 then
		Type = 2
	else
		Type = 3
	end
	local GoodsTable
	if LunShu == 3 or LunShu == 6 or LunShu == 9 or LunShu == 12 or LunShu == 15 or LunShu ==18 then
		GoodsTable = GoodsJiangLi[1][Type]
	else
		GoodsTable = GoodsJiangLi[2][Type]
	end
	
	local RandNum = math.random(table.getn(GoodsTable))
	GoodsId = GoodsTable[RandNum].GoodsID
	Num = GoodsTable[RandNum].Num
	Flag = GoodsTable[RandNum].Bind
	PinZhi = GoodsTable[RandNum].PinZhi
	local number = math.random(10000)
		if number <= 1000 then
--			if API_ActorCanAddGoods(ActorID,GoodsId,1,3,0) ~= -1 then
--				local GoodsName = API_GetGoodsName(GoodsId)
--				API_AddActorGoodsFlagEx(ActorID,GoodsId,Num,PinZhi,Flag,'获得高附加属性装备',0)
--				API_ActorSendMsg(ActorID,8,'获得高附加属性'..GoodsName..'一件')
--			else
--				local GoodsName = API_GetGoodsName(GoodsId)
--				API_SendActorMailByName(API_GetActorName(ActorID),GoodsId,1,3,'远古战场奖励','')
--				API_ActorSendMsg(ActorID,8,'获得高附加属性'..GoodsName..'一个（请到邮箱领取）')
--			end
			if API_MapIsValid(MapID) then
				API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsId,Num,Flag,'获得高附加属性装备',4,ActorID,600,60,PinZhi)
			end
		else
--			if API_ActorCanAddGoods(ActorID,80832,1,3,0) ~= -1 then
--				API_AddActorGoodsFlag(ActorID,80832,1,3,'获得战斗技能经验券')
--				API_ActorSendMsg(ActorID,8,'获得战斗技能经验券')
--			else
--				local GoodsName = API_GetGoodsName(80832)
--				API_SendActorMailByName(API_GetActorName(ActorID),80832,1,3,'远古战场奖励','')
--				API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'1个（请到邮箱领取）')
--			end
			if API_MapIsValid(MapID) then
				API_CreateDropGoods(MapID,PosX,PosY,80832,1,3,'获得战斗技能经验券',0,ActorID,600,60)
			end
		end
		if LunShu == 17 then
			API_VarDataSetNumber(ActorID,1,30270,18)
			local ActorDieTriggerID = ChristmasFuBenList[MapID].ActorDieTriggerID
			if ActorDieTriggerID ~= nil then
				API_DestroyTriggerG(ActorDieTriggerID)
			end
			local MonsterDieTriggerID = ChristmasFuBenList[MapID].MonsterDieTriggerID
			if MonsterDieTriggerID ~= nil then
				API_DestroyTriggerG(MonsterDieTriggerID)
			end
--			API_CreateMonster(MapID,11607,122,126,3,0,-1)
--			if API_GetServerID() == 1 then
				API_ActorBroadcastMsg(-1,17,'恭喜'..API_GetActorName(ActorID)..'成功通关远古战场！！！')
				API_ActorBroadcastMsg(-1,1,'恭喜'..API_GetActorName(ActorID)..'成功通关远古战场！！！')
				API_ActorBroadcastMsg(-1,7,'恭喜'..API_GetActorName(ActorID)..'成功通关远古战场！！！')
--			end	
			API_ActorBroadcastMsg(MapID,4,'')
			API_ResponseWrite('<name>远古战场</name>')
			API_ResponseWrite('<text>恭喜您成功通关远古战场。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[73][11][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[73][11][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[73][11][LaiYuan] = GLOBAL_FengXiangBiao_DateList[73][11][LaiYuan] + 1
			end			
			return
		end
		if API_GetMonsterID(MonsterFastID) <= 0 then
			ChristmasFuBenList[MapID].LunShu = ChristmasFuBenList[MapID].LunShu  + 1
			local MonsterID = MonsterIDTable[ChristmasFuBenList[MapID].LunShu] + 1
			local RouteNum = MonsterMoveTable.RouteNum
			local Route = MonsterMoveTable.Route
			local TileX = MonsterMoveTable.StartTile.TileX
			local TileY = MonsterMoveTable.StartTile.TileY
			if ActorID ~= nil and ActorID ~= -1 then
				API_VarDataSetNumber(ActorID,1,30270,ChristmasFuBenList[MapID].LunShu)
				API_ActorAddStatus(ActorID,2009001,0)
				API_ActorAddStatus(ActorID,2008001,0)
			end
			if API_MapIsValid(MapID) then
				ChristmasMonsterFastID = API_CreateMonster(MapID,MonsterID,TileX,TileY,5,0,-1)
			end
--			API_MonsterMoveTo(ChristmasMonsterFastID,RouteNum,Route) 
			ChristmasFuBenList[MapID].MonsterFastID = ChristmasMonsterFastID
			local MonsterDieTriggerID = API_CreateDieTriggerG(MapID,0,0,ChristmasMonsterFastID,'ChristmasFuBen_CreateMonster')
			ChristmasFuBenList[MapID].MonsterDieTriggerID = MonsterDieTriggerID
			ChristmasFuBen_KillMonsterLunShu(MapID,ActorID)
		end
end


function ChristmasFuBen_KillMonsterLunShu(MapID,ActorID)
	local info = ''
	local LunShu = ChristmasFuBenList[MapID].LunShu
	local LunciCN = PublicFun_ArabianNumberToChineseNumber(LunShu)
	info = '通过远古战场第'..LunciCN..'轮\n'
	API_ActorBroadcastMsg(MapID,4,info)
end
