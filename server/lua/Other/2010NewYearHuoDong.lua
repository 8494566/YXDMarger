-------------------------------
--文件名:	Scp\Lua\Other\2010NewYearHuoDong.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	刘操
--日  期:	2010-12-21
--版  本:	
--描  述:   2010年新年活动
--应  用:  
-------------------------------

local NewYearHuoDong_StartTime = {Year = 2011,Month = 1,Day = 27,Hour = 0,Minute = 0,Second = 0}
local NewYearHuoDong_EndTime = {Year = 2011,Month = 2,Day = 18,Hour = 0,Minute = 0,Second = 0}

local YuanXiaoHuoDong_StartTime = {Year = 2011,Month = 2,Day = 11,Hour = 0,Minute = 0,Second = 0}
local YuanXiaoHuoDong_EndTime = {Year = 2011,Month = 2,Day = 18,Hour = 0,Minute = 0,Second = 0}

GLOBAL_NianShouShuaXinDaoJiShi = 0

if API_GetServerID() == 1 or API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 6 or API_GetServerID() == 7 or API_GetServerID() == 10 then
	if NewYear_LoadingTimeTriggerGID ~= nil then
		API_DestroyTriggerG(NewYear_LoadingTimeTriggerGID)
	end
	NewYear_LoadingTimeTriggerGID = API_CreateTimerTriggerG(0,0,60,1,'NewYearHuoDongServerOpen')
end

function NewYearHuoDongServerOpen(Param1,Param2)
	if API_GetServerID() == 1 or API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 6 or API_GetServerID() == 7 or API_GetServerID() == 10 then
		local StartTimeTable = NewYearHuoDong_StartTime
		local EndTimeTable = NewYearHuoDong_EndTime
		local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
		local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
		if nShiFouStart > 0 then
			--活动未开始
			NewYearFuShen_DestroyNPC()
			if NewYearHuoDong_StartDateTimeTriggerGID == nil then
				NewYearHuoDong_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'NewYearFuShen_CreateNPC')
			else
				API_DestroyTriggerG(NewYearHuoDong_StartDateTimeTriggerGID)
				NewYearHuoDong_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'NewYearFuShen_CreateNPC')
			end
			if NewYearHuoDong_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(NewYearHuoDong_EndDateTimeTriggerGID)
			end
		elseif nShiFouStart <= 0 and nShiFouEnd > 0 then
			--活动开始
			NewYearFuShen_CreateNPC()
			if NewYearHuoDong_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(NewYearHuoDong_StartDateTimeTriggerGID)
			end
		elseif nShiFouEnd <= 0 then
			--活动结束
			NewYearFuShen_DestroyNPC()
			if NewYearHuoDong_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(NewYearHuoDong_StartDateTimeTriggerGID)
			end
			if NewYearHuoDong_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(NewYearHuoDong_EndDateTimeTriggerGID)
			end
		end
	end
end

function NewYearFuShen_CreateNPC()
	--创建帝国活动npc
	if API_GetServerID() == 1 then
		if FuShen_DGNPCFastID1 == nil then
			FuShen_DGNPCFastID1 = API_CreateMonsterEx(1,12355,262,207,4,0,-1,1)
		else
			if API_GetMonsterID(FuShen_DGNPCFastID1) > 0 then
				API_DestroyMonster(FuShen_DGNPCFastID1)
			end
			FuShen_DGNPCFastID1 = API_CreateMonsterEx(1,12355,262,207,4,0,-1,1)
		end
	end
	if API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
		if FuShen_DGNPCFastID2 == nil then
			FuShen_DGNPCFastID2 = API_CreateMonsterEx(9,12355,144,372,3,0,-1,1)
		else
			if API_GetMonsterID(FuShen_DGNPCFastID2) > 0 then
				API_DestroyMonster(FuShen_DGNPCFastID2)
			end
			FuShen_DGNPCFastID2 = API_CreateMonsterEx(9,12355,144,372,3,0,-1,1)
		end
		if FuShen_DGNPCFastID3 == nil then
			FuShen_DGNPCFastID3 = API_CreateMonsterEx(23,12355,140,341,5,0,-1,1)
		else
			if API_GetMonsterID(FuShen_DGNPCFastID3) > 0 then
				API_DestroyMonster(FuShen_DGNPCFastID3)
			end
			FuShen_DGNPCFastID3 = API_CreateMonsterEx(23,12355,140,341,5,0,-1,1)
		end
	end
	if API_GetServerID() == 7 then
		if FuShen_DGNPCFastID4 == nil then
			FuShen_DGNPCFastID4 = API_CreateMonsterEx(99,12355,381,371,3,0,-1,1)
		else
			if API_GetMonsterID(FuShen_DGNPCFastID4) > 0 then
				API_DestroyMonster(FuShen_DGNPCFastID4)
			end
			FuShen_DGNPCFastID4 = API_CreateMonsterEx(99,12355,381,371,3,0,-1,1)
		end
	end
	--创建联邦活动npc
	if API_GetServerID() == 1 then
		if FuShen_LBNPCFastID1 == nil then
			FuShen_LBNPCFastID1 = API_CreateMonsterEx(2,12355,239,179,4,0,-1,1)
		else
			if API_GetMonsterID(FuShen_LBNPCFastID1) > 0 then
				API_DestroyMonster(FuShen_LBNPCFastID1)
			end
			FuShen_LBNPCFastID1 = API_CreateMonsterEx(2,12355,239,179,4,0,-1,1)
		end
	end
	if API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
		if FuShen_LBNPCFastID2 == nil then
			FuShen_LBNPCFastID2 = API_CreateMonsterEx(25,12355,124,322,3,0,-1,1)
		else
			if API_GetMonsterID(FuShen_LBNPCFastID2) > 0 then
				API_DestroyMonster(FuShen_LBNPCFastID2)
			end
			FuShen_LBNPCFastID2 = API_CreateMonsterEx(25,12355,124,322,3,0,-1,1)
		end
		if FuShen_LBNPCFastID3 == nil then
			FuShen_LBNPCFastID3 = API_CreateMonsterEx(10,12355,148,307,5,0,-1,1)
		else
			if API_GetMonsterID(FuShen_LBNPCFastID3) > 0 then
				API_DestroyMonster(FuShen_LBNPCFastID3)
			end
			FuShen_LBNPCFastID3 = API_CreateMonsterEx(10,12355,148,307,5,0,-1,1)
		end
	end
	if API_GetServerID() == 6 then
		if FuShen_LBNPCFastID4 == nil then
			FuShen_LBNPCFastID4 = API_CreateMonsterEx(98,12355,354,384,5,0,-1,1)
		else
			if API_GetMonsterID(FuShen_LBNPCFastID4) > 0 then
				API_DestroyMonster(FuShen_LBNPCFastID4)
			end
			FuShen_LBNPCFastID4 = API_CreateMonsterEx(98,12355,354,384,5,0,-1,1)
		end	
	end
	local StartTimeTable = NewYearHuoDong_StartTime
	local EndTimeTable = NewYearHuoDong_EndTime
	--创结束触发器
	if ChristmasParty_EndDateTimeTriggerGID == nil then
		ChristmasParty_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'NewYearFuShen_DestroyNPC')
	else
		API_DestroyTriggerG(ChristmasParty_EndDateTimeTriggerGID)
		ChristmasParty_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'NewYearFuShen_DestroyNPC')
	end
end

function NewYearFuShen_DestroyNPC()
	--删除帝国活动npc
	if FuShen_DGNPCFastID1 ~= nil then
		if API_GetMonsterID(FuShen_DGNPCFastID1) > 0 then
			API_DestroyMonster(FuShen_DGNPCFastID1)
		end
	end
	if FuShen_DGNPCFastID2 ~= nil then
		if API_GetMonsterID(FuShen_DGNPCFastID2) > 0 then
			API_DestroyMonster(FuShen_DGNPCFastID2)
		end
	end
	if FuShen_DGNPCFastID3 ~= nil then
		if API_GetMonsterID(FuShen_DGNPCFastID3) > 0 then
			API_DestroyMonster(FuShen_DGNPCFastID3)
		end
	end
	if FuShen_DGNPCFastID4 ~= nil then
		if API_GetMonsterID(FuShen_DGNPCFastID4) > 0 then
			API_DestroyMonster(FuShen_DGNPCFastID4)
		end
	end
	--删除联邦活动npc
	if FuShen_LBNPCFastID1 ~= nil then
		if API_GetMonsterID(FuShen_LBNPCFastID1) > 0 then
			API_DestroyMonster(FuShen_LBNPCFastID1)
		end
	end
	if FuShen_LBNPCFastID2 ~= nil then
		if API_GetMonsterID(FuShen_LBNPCFastID2) > 0 then
			API_DestroyMonster(FuShen_LBNPCFastID2)
		end
	end
	if FuShen_LBNPCFastID3 ~= nil then
		if API_GetMonsterID(FuShen_LBNPCFastID3) > 0 then
			API_DestroyMonster(FuShen_LBNPCFastID3)
		end
	end
	if FuShen_LBNPCFastID4 ~= nil then
		if API_GetMonsterID(FuShen_LBNPCFastID4) > 0 then
			API_DestroyMonster(FuShen_LBNPCFastID4)
		end
	end
end

local NewYearFuShenShopTable = {
	[1] = {
			{GoodsID=89036,Point=5,JiFen=0},
			{GoodsID=89037,Point=30,JiFen=0},
			},
}

function FuShenNPC_Tip(ActorID,NPCID)
		local ActorID = ActorID or API_RequestGetActorID()
		API_ResponseWrite('<name>福神</name>')
		API_ResponseWrite('<text>亲爱的玩家你好:</text><br>')
		API_ResponseWrite('<text>    除旧迎新，迎接兔年的来临，在此英雄岛跟你拜个早年，希望大家在兔年：兔兔的健康、兔兔的幸福、兔兔的快乐、兔兔的顺利。同时我们为大家准备了大量的精彩活动，大量神秘大奖等你拿！！！</text><br><br>')
		API_ResponseWrite('<a href="FuShenNPC_Tip2?1=100">查看活动时间表</a><br><br>')
--		API_ResponseWrite('<a href="FuShenNPC_Tip2?1=200">大闹天宫排行榜</a><br><br>')
		API_ResponseWrite('<a href="FuShenNPC_Tip2?1=300">购买道具</a><br><br>')
--		API_ResponseWrite('<a href="FuShenNPC_Tip2?1=400">兑换道具</a><br><br>')
		API_ResponseWrite('<a href="FuShenNPC_Tip2?1=500">显示积分</a><br><br>')
		API_ResponseWrite('<a>关闭</a><br>')
		API_ResponseFlush(ActorID)
end

function FuShenNPC_Tip2()
	local ActorID = ActorID or API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local XuanZheFangShi = API_RequestGetNumber(3)
	local Page = API_RequestGetNumber(2)
	local GoodsNum = 0
	if NewYearFuShenShopTable[1] == nil then
		return
	end
	if type(NewYearFuShenShopTable[1]) ~= 'table' then
		return
	end
	GoodsNum = table.getn(NewYearFuShenShopTable[1])
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if NewYearFuShenShopTable[1][BuyNo] ~= nil then
			local BuyGoodsID = 0
			local BuyPoint = 0
			local BuyJiFen = 0
			BuyGoodsID = NewYearFuShenShopTable[1][BuyNo].GoodsID
			BuyPoint = NewYearFuShenShopTable[1][BuyNo].Point
			BuyJiFen = NewYearFuShenShopTable[1][BuyNo].JiFen
			local BuyNum = API_RequestGetNumber(num)
			if BuyNum < 1 then
				BuyNum = 1
			end
			BuyPoint = BuyPoint * BuyNum
			BuyJiFen = BuyJiFen * BuyNum
			if BuyPoint < 0 or BuyPoint > 100000000 then
				return
			end
			
			if BuyPoint > 0 and BuyJiFen == 0 then
				if API_ActorGetGoodsNum(ActorID,80818) >= BuyPoint then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
						if API_ActorRemoveGoods(ActorID,80818,BuyPoint,"删除对应价格数量的云游代金券") then
							API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'福神购买')
							API_ResponseWrite('<name>福神</name>')
							API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
							API_ResponseWrite('<text>您花费</text><text color="255,0,255">'..BuyPoint..'</text><text>云游，购买了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
							API_ResponseWrite('<text>     </text>')
							API_ResponseWrite('<a href="FuShenNPC_Tip2?1=300">返回</a>')
							for i = 1,BuyNum do
								if BuyGoodsID == 89036 then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[67][2][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[67][2][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[67][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[67][2][LaiYuan] + 1
									end
								elseif BuyGoodsID == 89037 then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[67][1][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[67][1][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[67][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[67][1][LaiYuan] + 1
									end									
								end
							end
						end
					else
						API_ResponseWrite('<name>福神</name>')
						API_ResponseWrite('<text>您的背包空间不足，无法购买</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				else
					API_ResponseWrite('<name>福神</name>')
					API_ResponseWrite('<text>您的云游代金券数量不够，无法购买</text>')
					API_ResponseWrite('<br><br><a>确定</a>')
				end
			end
		end
		return
	end
	if SelectItem == 100 then
		API_ResponseWrite('<name>福神</name>')
		API_ResponseWrite('<text>春节活动时间1月27日-2月17日</text><br>')
		API_ResponseWrite('<text>封印守护大作战      12:00-13:00；19:00-20:00</text><br>')
		API_ResponseWrite('<text>天降财神~抢豪礼     14:00--16:00</text><br>')
		API_ResponseWrite('<text>年兔也疯狂          15:00--17:00</text><br>')
		API_ResponseWrite('<text>挑战幻-年兽王       20:00--21:00</text><br>')
		API_ResponseWrite('<text>大闹天宫            0:00--24:00</text><br>')
		API_ResponseWrite('<text>上线领红包          0:00--24:00</text><br>')
		API_ResponseWrite('<text>福神锦袋            0:00--24:00</text><br>')
		API_ResponseWrite('<text>浮空岛双倍          0:00--24:00</text><br>')
		API_ResponseWrite('<text>元宵情缘            0:00--24:00 （2月11—2月17日）</text><br>')
		API_ResponseWrite('<br><a href="FuShenNPC_Tip">  返回</a>')		
	elseif SelectItem == 200 then
	elseif SelectItem == 300 then
		API_ResponseWrite('<name>福神</name>')
		API_ResponseWrite('<win rect="30,75,490,510"></win>')
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br>')
		API_ResponseWrite('<text color="255,0,255">春节活动时间：12月27日～2月17日</text><br><br>')
		for i = 1,GoodsNum do
			if i > Page * 6 and i < (Page + 1) * 6 + 1 then
				local BuyGoodsID = 0
				local BuyPoint = 0
				local BuyJiFen = 0
				BuyGoodsID = NewYearFuShenShopTable[1][i].GoodsID
				BuyPoint = NewYearFuShenShopTable[1][i].Point
				BuyJiFen = NewYearFuShenShopTable[1][i].JiFen
				API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
				API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
				local BuyNumTip = ''
				local BuyPointTip = '<text>  单价：'..string.format("%-5s",BuyPoint)..'</text>'
				BuyPointTip = BuyPointTip..'<text color="254,249,220">云游             </text>'
				local BuyNumTipLen = string.len(BuyPointTip)
				if BuyNumTipLen < 44 then
					for j = 1,44 - BuyNumTipLen do
						BuyPointTip = BuyPointTip..' '
					end
				end
				API_ResponseWrite(''..BuyPointTip..'')
				local num = i * 100
				API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
				API_ResponseWrite('<text> </text>')
				API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" href="FuShenNPC_Tip2?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
				API_ResponseWrite('<text>————————————————————————————————————</text><br>')
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
				API_ResponseWrite('<br><img src="LuaUse\\button_back_g.bmp"><text>       </text>')
				API_ResponseWrite('<a href="ChristmasDaShiDianJi">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="FuShenNPC_Tip2?1='..SelectItem..'&2='..NextPage..'">')
			elseif (Page + 1) * 6 < GoodsNum then
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="FuShenNPC_Tip2?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="ChristmasDaShiDianJi">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="FuShenNPC_Tip2?1='..SelectItem..'&2='..NextPage..'">')
			else
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="FuShenNPC_Tip2?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="ChristmasDaShiDianJi">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_g.bmp">')
			end
		else
			API_ResponseWrite('<br><a href="FuShenNPC_Tip">  返回</a>')
		end
	elseif SelectItem == 400 then
	elseif SelectItem == 500 then
		local JiFen = API_VarDataGetNumber(ActorID,1,30237)
		API_ResponseWrite('<name>福神</name>')
		API_ResponseWrite('<text>您当前的春节积分为:</text><text color="255,0,255">'..JiFen..'</text><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	end
end

if API_GetServerID() < 11 then
	local StartTimeTable = NewYearHuoDong_StartTime
	local EndTimeTable = NewYearHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
	--创建时间触发器
		if NewYearHuoDong_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(NewYearHuoDong_TimeTriggerGID)
		end
		NewYearHuoDong_TimeTriggerGID = API_CreateTimerTriggerG(0,0,60,-1,'NianShouShuaXin_TimerTriggerGCallFunc')
	else
		if NewYearHuoDong_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(NewYearHuoDong_TimeTriggerGID)
		end
	end
end


function NianShouShuaXin_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.time()
	local StartTimeTable = NewYearHuoDong_StartTime
	local EndTimeTable = NewYearHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if Hour == 19 and API_GetServerID() == 1 then
			if Minute == 30 or Minute == 45 or Minute == 55 then
				API_ActorBDCMsg(-1,0,-1,11,85,0,17,'每天20点，大年兽将会出现在阳光雨林，落日农庄，珊瑚群岛，娜纱湿地，击杀大年兽有大量奖励。')
				API_ActorBDCMsg(-1,1,-1,11,85,0,1,'每天20点，大年兽将会出现在阳光雨林，落日农庄，珊瑚群岛，娜纱湿地，击杀大年兽有大量奖励。')
				API_ActorBDCMsg(-1,0,-1,11,85,0,7,'每天20点， 大年兽将会出现在阳光雨林，落日农庄，珊瑚群岛，娜纱湿地，击杀大年兽有大量奖励。')
			end
		end
		
		--刷小年兽判断
		if Hour == 20 and NowTime > API_VarDataGetNumber_Ex(1,0,-6013,1,1) then
			local NowTime = os.date("*t", os.time()) 
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 19
			NowTime.min = 59 
			NowTime.sec = 59
			local NightTime = os.time(NowTime)
			local NextQingChuTime = NightTime + 86400 + 1
	--		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,1,NextQingChuTime)
			API_VarDataSetNumber_Ex(1,0,-6013,1,1,NextQingChuTime)
			GLOBAL_NianShouShuaXinDaoJiShi = 10
			NewYearMonster_Create()
		end
		
		--刷年兽王判断
		if API_VarDataGetNumber_Ex(1,0,-6013,1,2) == 1 and NowTime > API_VarDataGetNumber_Ex(1,0,-6013,1,3) and API_GetServerID() == 8 then		
			local JiShaNum = API_VarDataGetNumber_Ex(1,0,-6013,1,4)
			local ServerID = API_GetServerID()
			if JiShaNum == 4 then
				if GLOBAL_NianShouShuaXinDaoJiShi > 0 then
					API_ActorBDCMsg(-1,0,-1,11,85,0,1,'年兽王'..GLOBAL_NianShouShuaXinDaoJiShi..'分钟之后将会出现在月暮草场。')
				end
				GLOBAL_NianShouShuaXinDaoJiShi = GLOBAL_NianShouShuaXinDaoJiShi - 1
				if GLOBAL_NianShouShuaXinDaoJiShi <= 0 then
					local RightMapID = API_GetRightMapID(101)
					if API_MapIsValid(RightMapID) then
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
							NewYearBigMonster_FastID = API_CreateMonster(RightMapID,730603,466,425,0,0,-1)
							API_CreateDieTriggerG(0,0,0,NewYearBigMonster_FastID,'MonsterDie')
						end
						local NowTime = os.date("*t", os.time()) 
						NowTime.year = Year
						NowTime.month = Month
						NowTime.day = Day
						NowTime.hour = 18 
						NowTime.min = 59 
						NowTime.sec = 59
						local NightTime = os.time(NowTime)
						local NextQingChuTime = NightTime + 86400 + 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,3,NextQingChuTime)
						API_ActorBDCMsg(-1,0,-1,11,85,0,17,'年兽王已经出现在月暮草场的伊度盆地，击杀年兽王可以获得丰厚的奖励。')
						API_ActorBDCMsg(-1,1,-1,11,85,0,1,'年兽王已经出现在月暮草场的伊度盆地，击杀年兽王可以获得丰厚的奖励。')
						API_ActorBDCMsg(-1,0,-1,11,85,0,7,'年兽王已经出现在月暮草场的伊度盆地，击杀年兽王可以获得丰厚的奖励。')
					end
					local NowTime = os.date("*t", os.time()) 
					NowTime.year = Year
					NowTime.month = Month
					NowTime.day = Day
					NowTime.hour = Hour + 1
					NowTime.min = Minute 
					NowTime.sec = Second
					if NewYearBigMonster_EndDateTimeTriggerGID == nil then
						NewYearBigMonster_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,NowTime.year,NowTime.month,NowTime.day,NowTime.hour,NowTime.min,NowTime.sec,'NewYearMonster_Destroy')
					else
						API_DestroyTriggerG(NewYearBigMonster_EndDateTimeTriggerGID)
						NewYearBigMonster_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,NowTime.year,NowTime.month,NowTime.day,NowTime.hour,NowTime.min,NowTime.sec,'NewYearMonster_Destroy')
					end
				end
			end
		end
	end
end

local MonsterIDTable = {
[9] = {ID = 730010,TileX = 100,TileY = 100},
[10] = {ID = 730601,TileX = 139,TileY = 279},
[23] = {ID = 730601,TileX = 127,TileY = 297},
[25] = {ID = 730010,TileX = 100,TileY = 100},
[99] = {ID = 730602,TileX = 270,TileY = 479},
[98] = {ID = 730602,TileX = 309,TileY = 395},
}

if NewYearMonster_ZhongNianShouIDlist == nil then
	NewYearMonster_ZhongNianShouIDlist = {}
end

--年兽创建
function NewYearMonster_Create()
	for i in NewYearMonster_ZhongNianShouIDlist do
		for j,v in NewYearMonster_ZhongNianShouIDlist[i] do
			if API_GetMonsterID(v) > 0 then
				API_DestroyMonster(v)
			end
		end
	end
	local NewYearMapIDList = {23,10,99,98}
	for i,v in NewYearMapIDList do
		local RightMapID = API_GetRightMapID(v)
		local ServerID = API_GetServerID()
		if API_MapIsValid(RightMapID) then
			if NewYearMonster_ZhongNianShouIDlist[RightMapID] == nil then
				NewYearMonster_ZhongNianShouIDlist[RightMapID] = {}
			end
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
				local MonsterID = MonsterIDTable[v].ID
--				local TileX = MonsterIDTable[v].TileX
--				local TileY = MonsterIDTable[v].TileY
				local NewYearMonster_Fast = API_CreateMonster(RightMapID,MonsterID,TileX,TileY,0,0,-1)
				API_CreateDieTriggerG(0,0,0,NewYearMonster_Fast,'MonsterDie')
				NewYearMonster_ZhongNianShouIDlist[RightMapID][1] = NewYearMonster_Fast
			end
		end
	end
	if API_GetServerID() == 1 then
		API_ActorBDCMsg(-1,0,-1,11,85,0,17,'大年兽已经出现在了阳光雨林，落日农庄，珊瑚群岛，娜纱湿地，击杀大年兽可以获得丰厚的奖励。')
		API_ActorBDCMsg(-1,1,-1,11,85,0,1,'大年兽已经出现在了阳光雨林，落日农庄，珊瑚群岛，娜纱湿地，击杀大年兽可以获得丰厚的奖励。')
		API_ActorBDCMsg(-1,0,-1,11,85,0,7,'大年兽已经出现在了阳光雨林，落日农庄，珊瑚群岛，娜纱湿地，击杀大年兽可以获得丰厚的奖励。')
	end
	API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,4,0)
	API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,2,1)
	
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.date("*t", os.time()) 
	NowTime.year = Year
	NowTime.month = Month
	NowTime.day = Day
	NowTime.hour = Hour + 1
	NowTime.min = Minute 
	NowTime.sec = Second
	if NewYearMonster_EndDateTimeTriggerGID == nil then
		NewYearMonster_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,NowTime.year,NowTime.month,NowTime.day,NowTime.hour,NowTime.min,NowTime.sec,'NewYearMonster_Destroy')
	else
		API_DestroyTriggerG(NewYearMonster_EndDateTimeTriggerGID)
		NewYearMonster_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,NowTime.year,NowTime.month,NowTime.day,NowTime.hour,NowTime.min,NowTime.sec,'NewYearMonster_Destroy')
	end
end

--年兽删除
function NewYearMonster_Destroy()
	local GuangBaoNum1 = 0
	for i in NewYearMonster_ZhongNianShouIDlist do
		for j,v in NewYearMonster_ZhongNianShouIDlist[i] do
			if API_GetMonsterID(v) > 0 then
				API_DestroyMonster(v)
				GuangBaoNum1 = GuangBaoNum1 + 1
				if GuangBaoNum1 == 1 and API_GetServerID() == 1 then
					API_ActorBDCMsg(-1,0,-1,11,85,0,17,'大年兽已经离开英雄岛大陆。')
					API_ActorBDCMsg(-1,1,-1,11,85,0,1,'大年兽已经离开英雄岛大陆。')
					API_ActorBDCMsg(-1,0,-1,11,85,0,7,'大年兽已经离开英雄岛大陆。')
				end
			end
		end
	end
	API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,2,2)
	if NewYearBigMonster_FastID ~= nil then
		if API_GetMonsterID(NewYearBigMonster_FastID) > 0 then
			API_DestroyMonster(NewYearBigMonster_FastID)
			API_ActorBDCMsg(-1,0,-1,11,85,0,17,'年兽王已经离开英雄岛大陆。')
			API_ActorBDCMsg(-1,1,-1,11,85,0,1,'年兽王已经离开英雄岛大陆。')
			API_ActorBDCMsg(-1,0,-1,11,85,0,7,'年兽王已经离开英雄岛大陆。')
		end
	end
end

local NianShouDiaoLuo_Goodstable = {
		 [1] = {
				{GoodsID=203,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=103,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=203,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=103,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=203,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=103,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=203,GoodsNum=5,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=103,GoodsNum=5,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=203,GoodsNum=5,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=103,GoodsNum=5,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=203,GoodsNum=5,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=103,GoodsNum=5,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID={1003,1503,2003,3003,3903,4003,4103,4203,4303,4403,4503,5003,5103,5203,5303,5403,5503,6003,6103,6203,6303,6403,6503,6603,6703,6803,6903,7003,8003,8103,8203,8303},GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=2},
				{GoodsID={1003,1503,2003,3003,3903,4003,4103,4203,4303,4403,4503,5003,5103,5203,5303,5403,5503,6003,6103,6203,6303,6403,6503,6603,6703,6803,6903,7003,8003,8103,8203,8303},GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=7},
				{GoodsID={38352,38353,38354,38355,38356,38357,38358,38359,38360},GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID=80197,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80197,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80197,GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID=80197,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80197,GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=88952,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=88952,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
			},
		 [2] = {
				{GoodsID=118,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=118,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=118,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=118,GoodsNum=1,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=118,GoodsNum=1,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=118,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=118,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=118,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=118,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=118,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=118,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=207,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=207,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=207,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=207,GoodsNum=1,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=207,GoodsNum=1,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=207,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=207,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=207,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=207,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=207,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=207,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=308,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=309,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=310,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=308,GoodsNum=1,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=309,GoodsNum=1,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=310,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=308,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=309,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=310,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=309,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=310,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=89042,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=80197,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80197,GoodsNum=5,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80197,GoodsNum=5,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80197,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80197,GoodsNum=5,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80197,GoodsNum=5,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80051,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80067,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80051,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80067,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80051,GoodsNum=1,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80067,GoodsNum=1,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80051,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80067,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80051,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80067,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80051,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80067,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID={1003,1503,2003,3003,3903,4003,4103,4203,4303,4403,4503,5003,5103,5203,5303,5403,5503,6003,6103,6203,6303,6403,6503,6603,6703,6803,6903,7003,8003,8103,8203,8303},GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=2},
				{GoodsID={1003,1503,2003,3003,3903,4003,4103,4203,4303,4403,4503,5003,5103,5203,5303,5403,5503,6003,6103,6203,6303,6403,6503,6603,6703,6803,6903,7003,8003,8103,8203,8303},GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=2},
				{GoodsID={1003,1503,2003,3003,3903,4003,4103,4203,4303,4403,4503,5003,5103,5203,5303,5403,5503,6003,6103,6203,6303,6403,6503,6603,6703,6803,6903,7003,8003,8103,8203,8303},GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=2},
				{GoodsID={1003,1503,2003,3003,3903,4003,4103,4203,4303,4403,4503,5003,5103,5203,5303,5403,5503,6003,6103,6203,6303,6403,6503,6603,6703,6803,6903,7003,8003,8103,8203,8303},GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=2},
				{GoodsID={1003,1503,2003,3003,3903,4003,4103,4203,4303,4403,4503,5003,5103,5203,5303,5403,5503,6003,6103,6203,6303,6403,6503,6603,6703,6803,6903,7003,8003,8103,8203,8303},GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=2},
				{GoodsID={1003,1503,2003,3003,3903,4003,4103,4203,4303,4403,4503,5003,5103,5203,5303,5403,5503,6003,6103,6203,6303,6403,6503,6603,6703,6803,6903,7003,8003,8103,8203,8303},GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=7},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},			
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},				
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80696,GoodsNum=10,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
				{GoodsID=88952,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=88952,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=88952,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=88952,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=88952,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=88952,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=88952,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID={40206,40222,40238,40254,40270},GoodsNum=1,Flag=0,GaiLv=800000,PinZhi=0},
				{GoodsID={11009,11010,11011,11012},GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID={11330,11331,11332,11333},GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID={38352,38353,38354,38355,38356,38357,38358,38359,38360},GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=31040,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
			},
		 [3] = {
				{GoodsID=203,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=103,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=203,GoodsNum=5,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=103,GoodsNum=5,Flag=0,GaiLv=300000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=10,Flag=0,GaiLv=400000,PinZhi=0},
				},
		 [4] = {
				{GoodsID=118,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=118,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=118,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=118,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=207,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=207,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=207,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=207,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=310,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=310,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=310,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID={1003,1503,2003,3003,3903,4003,4103,4203,4303,4403,4503,5003,5103,5203,5303,5403,5503,6003,6103,6203,6303,6403,6503,6603,6703,6803,6903,7003,8003,8103,8203,8303},GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=7},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=600000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=400000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID=80498,GoodsNum=20,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID={40206,40222,40238,40254,40270},GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
				{GoodsID={38352,38353,38354,38355,38356,38357,38358,38359,38360},GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
				{GoodsID=31040,GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
				},
}

function MonsterDie(ActorID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if MonsterID == 730601 or MonsterID == 730602 then
		local DiaoLuoNum = table.getn(NianShouDiaoLuo_Goodstable[1])
		for i = 1,DiaoLuoNum do
			local GoodsTable = NianShouDiaoLuo_Goodstable[1][i]
			local GoodsId = GoodsTable.GoodsID
			if type(GoodsId) == 'table' then
				local Type = math.random(1,table.getn(GoodsId))
				GoodsId = GoodsId[Type]
			end
			local Num = GoodsTable.GoodsNum
			local Flag = GoodsTable.Flag
			local Odds = GoodsTable.GaiLv
			local PinZhi = GoodsTable.PinZhi
			local Rand = math.random(1000000)
			if Rand <= Odds then
				if PinZhi > 0 then
					API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落装备',0,0,600,60,PinZhi)
				else
					API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落物品',4,0,600,60)
				end
			end
		end
		local Num = API_VarDataGetNumber_Ex(1,0,-6013,1,4)
		Num = Num + 1
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,4,Num)
	elseif MonsterID == 730603 then
		local Camp = API_GetActorCamp(KillerID)
		local DiaoLuoNum = table.getn(NianShouDiaoLuo_Goodstable[2])
		for i = 1,DiaoLuoNum do
			local GoodsTable = NianShouDiaoLuo_Goodstable[2][i]
			local GoodsId = GoodsTable.GoodsID
			if type(GoodsId) == 'table' then
				local Type = math.random(1,table.getn(GoodsId))
				GoodsId = GoodsId[Type]
			end
			local Num = GoodsTable.GoodsNum
			local Flag = GoodsTable.Flag
			local Odds = GoodsTable.GaiLv
			local PinZhi = GoodsTable.PinZhi
			local Rand = math.random(1000000)
			if Rand <= Odds then
				if PinZhi > 0 then
					API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落装备',2,Camp,600,60,PinZhi)
				else
					API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落物品',2,Camp,600,60)
				end
				if GoodsId == 31040 then
					API_ActorBroadcastMsg(-1,17,'年兽王死亡掉落了'..API_GetGoodsName(GoodsId)..'')
				end
				if GoodsId == 11330 or GoodsId == 11331 or GoodsId == 11332 or GoodsId == 11333 
				or GoodsId == 11009 or GoodsId == 11010 or GoodsId == 11011 or GoodsId == 11012 then
					API_ActorBroadcastMsg(-1,17,'年兽王死亡掉落了'..API_GetGoodsName(GoodsId)..'')
				end
			end
		end
	elseif MonsterID == 730604 then
		local DiaoLuoNum = table.getn(NianShouDiaoLuo_Goodstable[3])
		for i = 1,DiaoLuoNum do
			local GoodsTable = NianShouDiaoLuo_Goodstable[3][i]
			local GoodsId = GoodsTable.GoodsID
			if type(GoodsId) == 'table' then
				local Type = math.random(1,table.getn(GoodsId))
				GoodsId = GoodsId[Type]
			end
			local Num = GoodsTable.GoodsNum
			local Flag = GoodsTable.Flag
			local Odds = GoodsTable.GaiLv
			local PinZhi = GoodsTable.PinZhi
			local Rand = math.random(1000000)
			if Rand <= Odds then
				if PinZhi > 0 then
					API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落装备',4,ActorID,600,60,PinZhi)
				else
					API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落物品',0,ActorID,600,60)
				end
			end
		end
	elseif MonsterID == 730605 then
		local DiaoLuoNum = table.getn(NianShouDiaoLuo_Goodstable[4])
		for i = 1,DiaoLuoNum do
			local GoodsTable = NianShouDiaoLuo_Goodstable[4][i]
			local GoodsId = GoodsTable.GoodsID
			if type(GoodsId) == 'table' then
				local Type = math.random(1,table.getn(GoodsId))
				GoodsId = GoodsId[Type]
			end
			if GoodsId == 31040 then
				local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,6)
				if ShengYuNum <= 0 then
					GoodsId = 310
				else
					ShengYuNum = ShengYuNum - 1
					API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,6,ShengYuNum)						
				end
			end
			local Num = GoodsTable.GoodsNum
			local Flag = GoodsTable.Flag
			local Odds = GoodsTable.GaiLv
			local PinZhi = GoodsTable.PinZhi
			local Rand = math.random(1000000)
			if Rand <= Odds then
				if PinZhi > 0 then
					API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落装备',4,ActorID,600,60,PinZhi)
				else
					API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落物品',0,ActorID,600,60)
				end
			end
		end
	end
end

NewYearNianGao_bufftable = {
[1] = {2006001,2006002,2006003,2006004,2006005,2006006,2006007,2006008,2006009,2006009,2006010},
[2] = {2006011,2006012,2006013,2006014,},
[3] = {2006016,2006015,},
}

--年糕
function NianGaoUse(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID() 
	if GoodsID ~= 89036 then
	   return 0 
	end	
	local BadTime = API_VarDataGetNumber(ActorID,1,12654)
	if BadTime > 0 then
		API_ActorSendMsg(ActorID,3,'正在睡觉中……')
		return 0
	end
	local RandNum = math.random(10000)
	local ZhangTai = 1
	if RandNum <= 6900 then
		ZhangTai = 1
	elseif RandNum <= 9900 then
		ZhangTai = 2
	elseif RandNum <= 10000 then
		ZhangTai = 3
	end
	local bianshenbuff = NewYearNianGao_bufftable[ZhangTai][math.random(table.getn(NewYearNianGao_bufftable[ZhangTai]))]
	if API_ActorRemoveGoods(ActorID,89036,1,'使用年糕') then
		API_ActorAddStatus(ActorID,bianshenbuff,300000)
		API_ActorSendMsg(ActorID,8,'使用年糕获得新状态。')
		return 1
	end
end

--福神锦袋奖励表
local NewYear2010_GoodsTable = {
[1] = {
			--
			{GoodsID=39501,GaiLv1=1,GaiLv2=39745,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39502,GaiLv1=39746,GaiLv2=79491,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39503,GaiLv1=79492,GaiLv2=119237,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39510,GaiLv1=119238,GaiLv2=158983,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39513,GaiLv1=158984,GaiLv2=198729,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88952,GaiLv1=198730,GaiLv2=1788555,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80383,GaiLv1=1788556,GaiLv2=3378381,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=80381,GaiLv1=3378382,GaiLv2=4173294,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80397,GaiLv1=4173295,GaiLv2=4769479,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=89042,GaiLv1=4769480,GaiLv2=4793327,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=4793328,GaiLv2=5031801,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40003,GaiLv1=5031802,GaiLv2=5270275,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40013,GaiLv1=5270276,GaiLv2=5508749,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40023,GaiLv1=5508750,GaiLv2=5747223,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40093,GaiLv1=5747224,GaiLv2=5985697,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31015,GaiLv1=5985698,GaiLv2=6104934,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31016,GaiLv1=6104935,GaiLv2=6224171,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=76,GaiLv1=6224172,GaiLv2=6343408,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80686,GaiLv1=6343409,GaiLv2=6581882,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80689,GaiLv1=6581883,GaiLv2=6820356,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31101,GaiLv1=6820357,GaiLv2=6939593,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=75,GaiLv1=6939594,GaiLv2=7178067,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32015,GaiLv1=7178068,GaiLv2=7179657,NumGaiLv=1200,NumMax=1,NumMin=0},
			{GoodsID=39511,GaiLv1=7179658,GaiLv2=7203505,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39514,GaiLv1=7203506,GaiLv2=7227353,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39504,GaiLv1=7227354,GaiLv2=7251201,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39505,GaiLv1=7251202,GaiLv2=7275049,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39506,GaiLv1=7275050,GaiLv2=7298897,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32016,GaiLv1=7298898,GaiLv2=7300090,NumGaiLv=1200,NumMax=1,NumMin=0},
			{GoodsID=11009,GaiLv1=7300091,GaiLv2=7315989,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11010,GaiLv1=7315990,GaiLv2=7331888,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11011,GaiLv1=7331889,GaiLv2=7347787,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11012,GaiLv1=7347788,GaiLv2=7363686,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11330,GaiLv1=7363687,GaiLv2=7369648,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11331,GaiLv1=7369649,GaiLv2=7375610,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11332,GaiLv1=7375611,GaiLv2=7381572,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11333,GaiLv1=7381573,GaiLv2=7387534,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11335,GaiLv1=7387535,GaiLv2=7393496,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11336,GaiLv1=7393497,GaiLv2=7399458,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11046,GaiLv1=7399459,GaiLv2=7415357,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11047,GaiLv1=7415358,GaiLv2=7431256,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=310,GaiLv1=7431257,GaiLv2=8623625,NumGaiLv=10000,NumMax=4,NumMin=3},
			{GoodsID=31040,GaiLv1=8623626,GaiLv2=8631575,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31039,GaiLv1=8631576,GaiLv2=8632768,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11334,GaiLv1=8632769,GaiLv2=8640718,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88044,GaiLv1=8640719,GaiLv2=8688413,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88171,GaiLv1=8688414,GaiLv2=8807650,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=8807651,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},
		},
[2] = {
			--
			{GoodsID=39501,GaiLv1=1,GaiLv2=37289,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39502,GaiLv1=37290,GaiLv2=74579,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39503,GaiLv1=74580,GaiLv2=111869,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39510,GaiLv1=111870,GaiLv2=149159,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39513,GaiLv1=149160,GaiLv2=186449,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88952,GaiLv1=186450,GaiLv2=1678033,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80384,GaiLv1=1678034,GaiLv2=3169617,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=80382,GaiLv1=3169618,GaiLv2=3915409,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31017,GaiLv1=3915410,GaiLv2=3971344,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31018,GaiLv1=3971345,GaiLv2=4027279,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31019,GaiLv1=4027280,GaiLv2=4083214,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=76,GaiLv1=4083215,GaiLv2=4195083,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40004,GaiLv1=4195084,GaiLv2=4344242,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40014,GaiLv1=4344243,GaiLv2=4493401,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40024,GaiLv1=4493402,GaiLv2=4642560,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40094,GaiLv1=4642561,GaiLv2=4791719,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=89042,GaiLv1=4791720,GaiLv2=4814093,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=250,GaiLv1=4814094,GaiLv2=5261568,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=9507,GaiLv1=5261569,GaiLv2=5267961,NumGaiLv=1714,NumMax=1,NumMin=0},
			{GoodsID=80397,GaiLv1=5267962,GaiLv2=5827305,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=75,GaiLv1=5827306,GaiLv2=6051043,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=6051044,GaiLv2=6274781,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80686,GaiLv1=6274782,GaiLv2=6498519,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80689,GaiLv1=6498520,GaiLv2=6722257,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32015,GaiLv1=6722258,GaiLv2=6723749,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39511,GaiLv1=6723750,GaiLv2=6746123,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39514,GaiLv1=6746124,GaiLv2=6768497,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39504,GaiLv1=6768498,GaiLv2=6790871,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39505,GaiLv1=6790872,GaiLv2=6813245,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39506,GaiLv1=6813246,GaiLv2=6835619,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32016,GaiLv1=6835620,GaiLv2=6836738,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11009,GaiLv1=6836739,GaiLv2=6851654,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11010,GaiLv1=6851655,GaiLv2=6866570,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11011,GaiLv1=6866571,GaiLv2=6881486,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11012,GaiLv1=6881487,GaiLv2=6896402,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11330,GaiLv1=6896403,GaiLv2=6901996,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11331,GaiLv1=6901997,GaiLv2=6907590,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11332,GaiLv1=6907591,GaiLv2=6913184,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11333,GaiLv1=6913185,GaiLv2=6918778,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11335,GaiLv1=6918779,GaiLv2=6924372,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11336,GaiLv1=6924373,GaiLv2=6929966,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38352,GaiLv1=6929967,GaiLv2=7004546,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38353,GaiLv1=7004547,GaiLv2=7079126,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38354,GaiLv1=7079127,GaiLv2=7153706,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38355,GaiLv1=7153707,GaiLv2=7228286,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38356,GaiLv1=7228287,GaiLv2=7243202,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38357,GaiLv1=7243203,GaiLv2=7265576,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38358,GaiLv1=7265577,GaiLv2=7280492,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38359,GaiLv1=7280493,GaiLv2=7295408,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38360,GaiLv1=7295409,GaiLv2=7310324,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32101,GaiLv1=7310325,GaiLv2=7355072,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31040,GaiLv1=7355073,GaiLv2=7362530,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31039,GaiLv1=7362531,GaiLv2=7363649,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11334,GaiLv1=7363650,GaiLv2=7371107,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88044,GaiLv1=7371108,GaiLv2=7415855,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11046,GaiLv1=7415856,GaiLv2=7430771,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11047,GaiLv1=7430772,GaiLv2=7445687,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=311,GaiLv1=7445688,GaiLv2=8564375,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=80274,GaiLv1=8564376,GaiLv2=9683063,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88171,GaiLv1=9683064,GaiLv2=9776287,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80951,GaiLv1=9776288,GaiLv2=9925446,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80387,GaiLv1=9925447,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},
		},
[3] = {
			--
			{GoodsID=39501,GaiLv1=1,GaiLv2=36768,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39502,GaiLv1=36769,GaiLv2=73537,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39503,GaiLv1=73538,GaiLv2=110306,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39510,GaiLv1=110307,GaiLv2=147075,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39513,GaiLv1=147076,GaiLv2=183844,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88952,GaiLv1=183845,GaiLv2=1654587,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80384,GaiLv1=1654588,GaiLv2=3125330,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=80382,GaiLv1=3125331,GaiLv2=3860702,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31017,GaiLv1=3860703,GaiLv2=3915855,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31018,GaiLv1=3915856,GaiLv2=3971008,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31019,GaiLv1=3971009,GaiLv2=4026161,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=76,GaiLv1=4026162,GaiLv2=4136467,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40005,GaiLv1=4136468,GaiLv2=4246773,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40015,GaiLv1=4246774,GaiLv2=4357079,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40025,GaiLv1=4357080,GaiLv2=4467385,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40095,GaiLv1=4467386,GaiLv2=4577691,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=89042,GaiLv1=4577692,GaiLv2=4599753,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=250,GaiLv1=4599754,GaiLv2=5040976,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=9507,GaiLv1=5040977,GaiLv2=5047280,NumGaiLv=1400,NumMax=1,NumMin=0},
			{GoodsID=80397,GaiLv1=5047281,GaiLv2=5598809,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=75,GaiLv1=5598810,GaiLv2=5819421,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=5819422,GaiLv2=6040033,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80686,GaiLv1=6040034,GaiLv2=6260645,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80689,GaiLv1=6260646,GaiLv2=6481257,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32015,GaiLv1=6481258,GaiLv2=6482728,NumGaiLv=1200,NumMax=1,NumMin=0},
			{GoodsID=39511,GaiLv1=6482729,GaiLv2=6504790,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39514,GaiLv1=6504791,GaiLv2=6526852,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39504,GaiLv1=6526853,GaiLv2=6548914,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39505,GaiLv1=6548915,GaiLv2=6570976,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39506,GaiLv1=6570977,GaiLv2=6593038,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32016,GaiLv1=6593039,GaiLv2=6594142,NumGaiLv=1200,NumMax=1,NumMin=0},
			{GoodsID=11009,GaiLv1=6594143,GaiLv2=6608850,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11010,GaiLv1=6608851,GaiLv2=6623558,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11011,GaiLv1=6623559,GaiLv2=6638266,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11012,GaiLv1=6638267,GaiLv2=6652974,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11330,GaiLv1=6652975,GaiLv2=6658490,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11331,GaiLv1=6658491,GaiLv2=6664006,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11332,GaiLv1=6664007,GaiLv2=6669522,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11333,GaiLv1=6669523,GaiLv2=6675038,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11335,GaiLv1=6675039,GaiLv2=6680554,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11336,GaiLv1=6680555,GaiLv2=6686070,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38352,GaiLv1=6686071,GaiLv2=6759608,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38353,GaiLv1=6759609,GaiLv2=6833146,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38354,GaiLv1=6833147,GaiLv2=6906684,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38355,GaiLv1=6906685,GaiLv2=6980222,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38356,GaiLv1=6980223,GaiLv2=7053760,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38357,GaiLv1=7053761,GaiLv2=7127298,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38358,GaiLv1=7127299,GaiLv2=7200836,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38359,GaiLv1=7200837,GaiLv2=7274374,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=38360,GaiLv1=7274375,GaiLv2=7347912,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32101,GaiLv1=7347913,GaiLv2=7392035,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31040,GaiLv1=7392036,GaiLv2=7399389,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=31039,GaiLv1=7399390,GaiLv2=7400493,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11334,GaiLv1=7400494,GaiLv2=7407847,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88044,GaiLv1=7407848,GaiLv2=7451970,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11046,GaiLv1=7451971,GaiLv2=7466678,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11047,GaiLv1=7466679,GaiLv2=7481386,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=317,GaiLv1=7481387,GaiLv2=8584444,NumGaiLv=10000,NumMax=2,NumMin=1},
			{GoodsID=80274,GaiLv1=8584445,GaiLv2=9687502,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88171,GaiLv1=9687503,GaiLv2=9779424,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80952,GaiLv1=9779425,GaiLv2=9926499,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80388,GaiLv1=9926500,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},
		},
}

local ShiZhuangBaoShiTable = {39501,39502,39503,39510,39513}

local ShenFuJinDaiTeShuGoodsID = {11335,11336,11334,11330,11331,11332,11333,89042,31040}

local ShenFuJinDaiPuTongGoodsID = {9507,32015,32016,40004,40014,40024,40005,40015,40025,39511,39514,39504,39505,39506,11009,11010,11011,11012,32101,88044,11046,11047,80952,80388,80951,80387}

local ShenFuJinDaiTeShuGongGaoGoodsID = {32015,39511,39514,39504,39505,39506,32016,32101,88044,80952,80388,11335,11336,31039,11334,11330,11331,11332,11333,89042,31040,11009,11010,11011,11012}

--福神锦袋
function ShenFuJinDaiUse(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID() 
	if API_ActorGetGoodsNum(ActorID,89037) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local JiangLiQuYu = 1
	local PlayLv = API_GetActorExpLevel(ActorID)
	if PlayLv > 40 then
		JiangLiQuYu = 3
	elseif PlayLv > 25 then
		JiangLiQuYu = 2
	end
	local JiangLiTable = NewYear2010_GoodsTable[JiangLiQuYu]
	local JiangLiGaiLv = math.random(10000000)
	for j in JiangLiTable do
		local GaiLv1 = JiangLiTable[j].GaiLv1
		local GaiLv2 = JiangLiTable[j].GaiLv2
		local NumGaiLv = JiangLiTable[j].NumGaiLv
		local NumMax = JiangLiTable[j].NumMax
		local NumMin = JiangLiTable[j].NumMin
		local NumRandom = math.random(10000)
		if NumRandom <= NumGaiLv then
			JiangLiGoodsNum = NumMax
		else
			JiangLiGoodsNum = NumMin
		end	
		if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
			local JiangLiGoodsID = JiangLiTable[j].GoodsID
			if JiangLiGoodsNum <= 0 then
				JiangLiGoodsID = 82004
				JiangLiGoodsNum = 1
			end	
			if API_ActorGetPackageSize(ActorID) < 1 then
				API_ResponseWrite('<name>福神锦袋</name>')
				API_ResponseWrite('<text>您的背包空间不足，请至少保留一个空格，再打开福神锦袋。</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
				API_ResponseFlush(ActorID)
				return 0					
			end
			if API_ActorGetGoodsNum(ActorID,89037) > 0 and API_ActorRemoveGoods(ActorID,89037,1,'删除福神锦袋') then
				local StartTimeTable = YuanXiaoHuoDong_StartTime
				local EndTimeTable = YuanXiaoHuoDong_EndTime
				local StartTimeTable1 = NewYearHuoDong_StartTime
				local EndTimeTable1 = NewYearHuoDong_EndTime
				local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
				local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
				local nShiFouStart1 = API_DiffDatatime(StartTimeTable1.Year,StartTimeTable1.Month,StartTimeTable1.Day,StartTimeTable1.Hour,StartTimeTable1.Minute,StartTimeTable1.Second)--获取某个时间跟当前时间相差的秒数
				local nShiFouEnd1 = API_DiffDatatime(EndTimeTable1.Year,EndTimeTable1.Month,EndTimeTable1.Day,EndTimeTable1.Hour,EndTimeTable1.Minute,EndTimeTable1.Second)				
				local NowTime = os.time()
				local CD = API_VarDataGetNumber_Ex(1,0,-6013,1,22)
				local CD2 = API_VarDataGetNumber_Ex(1,0,-6013,1,23)
				local CD3 = API_VarDataGetNumber_Ex(1,0,-6013,1,24)
				if JiangLiGoodsID == 11335 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,7)
					if ShengYuNum <= 0 or CD >= NowTime then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						if nShiFouStart <= 0 and nShiFouEnd > 0 then
							ShengYuNum = ShengYuNum - 1
							API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,7,ShengYuNum)	
						else
							JiangLiGoodsID = 89042
							JiangLiGoodsNum = 1
							ShengYuNum = ShengYuNum - 1
							API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,7,ShengYuNum)	
						end							
					end
				elseif JiangLiGoodsID == 11336 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,8)
					if ShengYuNum <= 0 or CD >= NowTime then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						if nShiFouStart <= 0 and nShiFouEnd > 0 then
							ShengYuNum = ShengYuNum - 1
							API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,8,ShengYuNum)
						else
							JiangLiGoodsID = 89042
							JiangLiGoodsNum = 1
							ShengYuNum = ShengYuNum - 1
							API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,8,ShengYuNum)		
						end						
					end
				elseif JiangLiGoodsID == 11334 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,9)
					if ShengYuNum <= 0 or CD >= NowTime then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						ShengYuNum = ShengYuNum - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,9,ShengYuNum)						
					end
				elseif JiangLiGoodsID == 31039 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,10)
					if ShengYuNum <= 0 or CD2 >= NowTime then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						if nShiFouStart1 <= 0 and nShiFouEnd1 > 0 then
							ShengYuNum = ShengYuNum - 1
							API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,10,ShengYuNum)	
						else
							JiangLiGoodsID = 31040
							JiangLiGoodsNum = 1
							ShengYuNum = ShengYuNum - 1
							API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,10,ShengYuNum)	
						end								
					end
				elseif JiangLiGoodsID == 89042 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,12)
					if ShengYuNum <= 0 or CD >= NowTime then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						ShengYuNum = ShengYuNum - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,12,ShengYuNum)						
					end
				elseif JiangLiGoodsID == 11009 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,13)
					if ShengYuNum <= 0 then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						ShengYuNum = ShengYuNum - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,13,ShengYuNum)						
					end
				elseif JiangLiGoodsID == 11010 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,14)
					if ShengYuNum <= 0 then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						ShengYuNum = ShengYuNum - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,14,ShengYuNum)						
					end
				elseif JiangLiGoodsID == 11011 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,15)
					if ShengYuNum <= 0 then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						ShengYuNum = ShengYuNum - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,15,ShengYuNum)						
					end
				elseif JiangLiGoodsID == 11012 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,16)
					if ShengYuNum <= 0 then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						ShengYuNum = ShengYuNum - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,16,ShengYuNum)						
					end
				elseif JiangLiGoodsID == 11330 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,17)
					if ShengYuNum <= 0 or CD >= NowTime then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						ShengYuNum = ShengYuNum - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,17,ShengYuNum)						
					end
				elseif JiangLiGoodsID == 11331 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,18)
					if ShengYuNum <= 0 or CD >= NowTime then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						ShengYuNum = ShengYuNum - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,18,ShengYuNum)						
					end
				elseif JiangLiGoodsID == 11332 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,19)
					if ShengYuNum <= 0 or CD >= NowTime then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						ShengYuNum = ShengYuNum - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,19,ShengYuNum)						
					end
				elseif JiangLiGoodsID == 11333 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,20)
					if ShengYuNum <= 0 or CD >= NowTime then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						ShengYuNum = ShengYuNum - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,20,ShengYuNum)						
					end
				elseif JiangLiGoodsID == 31040 then
					local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6013,1,21)
					if ShengYuNum <= 0 or CD >= NowTime then
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1
					else
						ShengYuNum = ShengYuNum - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,21,ShengYuNum)						
					end
				elseif JiangLiGoodsID == 88952 then
					if nShiFouStart <= 0 and nShiFouEnd > 0 then
						JiangLiGoodsID = 88952
						JiangLiGoodsNum = 1
					else
						JiangLiGoodsID = 82004
						JiangLiGoodsNum = 1						
					end
				end
				for j,v in ShenFuJinDaiPuTongGoodsID do
					if JiangLiGoodsID == v then
						if CD3 >= NowTime then
							JiangLiGoodsID = 82004
							JiangLiGoodsNum = 1
						end
					end
				end
--				if API_ActorCanAddGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,3,0) ~= -1 and API_ActorCanAddGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,3,0) ~= 0 then
					local PD = 0
					for j,v in baoshiwupinbiao do
						if JiangLiGoodsID == v then
							PD = 1
						end
					end
					if PD == 1 then
						fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
					else
						API_AddActorGoodsFlag(ActorID,JiangLiGoodsID,JiangLiGoodsNum,0,'')
					end
					API_ActorSendMsg(ActorID,8,'获得'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')
--				end
				--CD判断
				for j,v in ShenFuJinDaiTeShuGoodsID do
					if JiangLiGoodsID == v then
						local Time = os.time() 
						local Tsec = math.random(2700,3600)
						local NextTime = Time + Tsec
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,22,NextTime)
					end
				end
				if JiangLiGoodsID == 31039 then
					local Time = os.time() 
					local Tsec = math.random(129600,172800)
					local NextTime = Time + Tsec
					API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,23,NextTime)				
				end
				for j,v in ShenFuJinDaiPuTongGoodsID do
					if JiangLiGoodsID == v then
						local Time = os.time() 
						local Tsec = math.random(180,300)
						local NextTime = Time + Tsec
						API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,24,NextTime)
					end
				end
				--公告判断
--				for j,v in ShenFuJinDaiTeShuGongGaoGoodsID do
--					if JiangLiGoodsID == v then
--						API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'打开福神锦袋获得了'..API_GetGoodsName(JiangLiGoodsID)..'')
--					end
--				end
				--风向标
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 0
				if JiangLiGoodsID == 11330 then
					Type = 4
				elseif JiangLiGoodsID == 11331 then
					Type = 5
				elseif JiangLiGoodsID == 11332 then
					Type = 6
				elseif JiangLiGoodsID == 11333 then
					Type = 7
				elseif JiangLiGoodsID == 11335 then
					Type = 8
				elseif JiangLiGoodsID == 11336 then
					Type = 9
				elseif JiangLiGoodsID == 31040 then
					Type = 10
				elseif JiangLiGoodsID == 31039 then
					Type = 11
				end
				if Type ~= 0 then
					if GLOBAL_FengXiangBiao_DateList[67][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[67][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[67][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[67][Type][LaiYuan] + 1
					end
				end				
				return 1	
			else
				API_ActorSendMsg(ActorID,3,'扣除福神锦袋失败')
				return 0			
			end
		end
	end
end

local RabbitHairMonsterID = {
[1] = {ID = 730604,Num = 4},
[2] = {ID = 730605,Num = 1},
}

--年兔茸毛
function RabbitHairUse(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID) 
	local StaticMapID = API_GetStaticMapID(MapID)
	if API_ActorGetGoodsNum(ActorID,89038) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if MapID ~= StaticMapID then
		API_ResponseWrite('<name>年兔茸毛</name>')
		API_ResponseWrite('<text>亲爱的玩家，当前地图不允许使用该物品，请切换地图尝试使用。</text><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return 0		
	end
	local SelectItem = API_RequestGetNumber(1)
	local JiFen = API_VarDataGetNumber(ActorID,1,30237)
	local GoodsNum = API_ActorGetGoodsNum(ActorID,89038)
	if SelectItem == 100 then
		if JiFen < 30 then
			API_ActorSendMsg(ActorID,3,'您的春节积分不够召唤怪物')
			return 0
		end
		if GoodsNum < 30 then
			API_ActorSendMsg(ActorID,3,'您的年兔茸毛不够召唤怪物')
			return 0
		end
		if API_ActorGetGoodsNum(ActorID,89038) >= 30 and API_ActorRemoveGoods(ActorID,89038,30,'使用兔子茸毛') then--销毁玩家身上的物品
			JiFen = JiFen - 30
			API_VarDataSetNumber(ActorID,1,30237,JiFen)
			local ActorID = API_RequestGetActorID()
			local MapID = API_GetActorMapID(ActorID)
			local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
			local Odds = math.random(10000)
			local Type = 1
			if Odds <= 100 then
				Type = 2
			end	
			local MonsterID = RabbitHairMonsterID[Type].ID
			local Num = RabbitHairMonsterID[Type].Num
			for i=1,Num do
				local MonsterFastID = API_CreateMonster(MapID,MonsterID,TileX,TileY,5,0,-1)
				API_CreateDieTriggerG(ActorID,0,0,MonsterFastID,'MonsterDie')
			end
			API_ActorSendMsg(ActorID,8,'使用兔子茸毛召唤怪物')
			--风向标
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[67][3][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[67][3][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[67][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[67][3][LaiYuan] + 1
			end
			return 1
		else
			API_ActorSendMsg(ActorID,3,'扣除物品失败')
			return 0
		end
	else
		API_ResponseWrite('<name>年兔茸毛</name>')
		API_ResponseWrite('<win rect="300,100,400,300"></win>')
		API_ResponseWrite('<text>消耗30个年兔茸毛加上30积分可以召唤出怪兽。</text><br>')
		API_ResponseWrite('<br><text>您目前拥有年兔茸毛：</text><text color="255,0,255">'..GoodsNum..'个</text><br>')
		API_ResponseWrite('<br><text>您目前的春节积分是：</text><text color="255,0,255">'..JiFen..'</text><br>')
		API_ResponseWrite('<br><a href="RabbitHairUse?1=100">召唤怪兽</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return 0		
	end
end

if API_GetServerID() == 1 then
	if LC_NewYearHuoDong_LoadingTimeTriggerGID ~= nil then
		API_DestroyTriggerG(LC_NewYearHuoDong_LoadingTimeTriggerGID)
	end
	LC_NewYearHuoDong_LoadingTimeTriggerGID = API_CreateTimerTriggerG(0,0,60,-1,'LC_NewYearHuoDong_ShujuQingChu')
end

function LC_NewYearHuoDong_ShujuQingChu(Param1,Param2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.time()
	--设置每日奖励上限数量
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6013,1,5) and API_GetServerID() == 1 then
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,6,2)--年兔BOSS掉落兔年宝宝卡上限
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,7,2)--灵犀对戒男
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,8,2)--灵犀对戒女
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,9,2)--兔神披风
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,12,1)--一档噬炎光石
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,13,2)--节日招财帽[白银男装]
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,14,2)--节日招财装[白银男装]
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,15,2)--节日鸿运帽[白银女装]
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,16,2)--节日鸿运装[白银女装]
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,17,2)--兔乖乖头饰（女装）
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,18,2)--福兔新年装（女装）
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,19,2)--兔儿爷棉帽（男装）
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,20,2)--福兔新年装（男装）
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,21,3)--年兔宠物
		local NowTime = os.date("*t", os.time()) 
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 23 
		NowTime.min = 59 
		NowTime.sec = 59 
		local NightTime = os.time(NowTime)
		local NextQingChuTime = NightTime + 1
		API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,5,NextQingChuTime)
	end
	
	--设置每周奖励上限数量
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6013,1,11) and API_GetServerID() == 1 then
	   local DayTime = (7 - Week) * 86400
	   local NowTime = os.date("*t", os.time()) 
	   NowTime.year = Year
	   NowTime.month = Month
	   NowTime.day = Day
	   NowTime.hour = 23 
	   NowTime.min = 59 
	   NowTime.sec = 59 
	   local NightTime = os.time(NowTime) 
	   local NextTime = NightTime + DayTime + 1
	   local JiangLiMax = math.random(1,3)--随机稀有奖励上限
	   API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,10,JiangLiMax)--雪女宠物	   
	   API_VarDataSetNumber_Ex_Sync(1,0,-6013,1,11,NextTime)--下次每周清除时间
	end
end
