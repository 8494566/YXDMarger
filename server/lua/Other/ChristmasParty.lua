-------------------------------
--文件名:	Scp\Lua\Other\ChristmasParty.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	刘操
--日  期:	2010-11-24
--版  本:	
--描  述:   2010年圣诞派对
--应  用:  
-------------------------------




local ChristmasParty_StartTime = {Year = 2010,Month = 12,Day = 16,Hour = 0,Minute = 0,Second = 0}
local ChristmasParty_EndTime = {Year = 2011,Month = 1,Day = 4,Hour = 0,Minute = 0,Second = 0}



if API_GetServerID() == 1 or API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 6 or API_GetServerID() == 7 or API_GetServerID() == 10 then
	if ChristmasParty_LoadingTimeTriggerGID ~= nil then
		API_DestroyTriggerG(ChristmasParty_LoadingTimeTriggerGID)
	end
	ChristmasParty_LoadingTimeTriggerGID = API_CreateTimerTriggerG(0,0,10,1,'ChristmasPartyServerOpen')
end

function ChristmasPartyServerOpen(Param1,Param2)
	if API_GetServerID() == 1 or API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 6 or API_GetServerID() == 7 or API_GetServerID() == 10 then
		local StartTimeTable = ChristmasParty_StartTime
		local EndTimeTable = ChristmasParty_EndTime
		local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
		local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
		if nShiFouStart > 0 then
			--活动未开始
			ChristmasParty_DestroyNPC()
			if ChristmasParty_StartDateTimeTriggerGID == nil then
				ChristmasParty_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'ChristmasParty_CreateNPC')
			else
				API_DestroyTriggerG(ChristmasParty_StartDateTimeTriggerGID)
				ChristmasParty_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'ChristmasParty_CreateNPC')
			end
			if ChristmasParty_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(ChristmasParty_EndDateTimeTriggerGID)
			end
		elseif nShiFouStart <= 0 and nShiFouEnd > 0 then
			--活动开始
			ChristmasParty_CreateNPC()
			if ChristmasParty_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(ChristmasParty_StartDateTimeTriggerGID)
			end
		elseif nShiFouEnd <= 0 then
			--活动结束
			ChristmasParty_DestroyNPC()
			if ChristmasParty_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(ChristmasParty_StartDateTimeTriggerGID)
			end
			if ChristmasParty_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(ChristmasParty_EndDateTimeTriggerGID)
			end
		end
	end
end

function ChristmasParty_CreateNPC()
	--创建帝国活动npc
	if API_GetServerID() == 1 then
		if ChristmasDaShi_DGNPCFastID1 == nil then
			ChristmasDaShi_DGNPCFastID1 = API_CreateMonsterEx(1,12339,264,209,4,0,-1,1)
		else
			if API_GetMonsterID(ChristmasDaShi_DGNPCFastID1) > 0 then
				API_DestroyMonster(ChristmasDaShi_DGNPCFastID1)
			end
			ChristmasDaShi_DGNPCFastID1 = API_CreateMonsterEx(1,12339,264,209,4,0,-1,1)
		end
	end
	if API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
		if ChristmasDaShi_DGNPCFastID2 == nil then
			ChristmasDaShi_DGNPCFastID2 = API_CreateMonsterEx(9,12339,210,208,3,0,-1,1)
		else
			if API_GetMonsterID(ChristmasDaShi_DGNPCFastID2) > 0 then
				API_DestroyMonster(ChristmasDaShi_DGNPCFastID2)
			end
			ChristmasDaShi_DGNPCFastID2 = API_CreateMonsterEx(9,12339,208,208,3,0,-1,1)
		end
		if ChristmasDaShi_DGNPCFastID3 == nil then
			ChristmasDaShi_DGNPCFastID3 = API_CreateMonsterEx(23,12339,140,341,5,0,-1,1)
		else
			if API_GetMonsterID(ChristmasDaShi_DGNPCFastID3) > 0 then
				API_DestroyMonster(ChristmasDaShi_DGNPCFastID3)
			end
			ChristmasDaShi_DGNPCFastID3 = API_CreateMonsterEx(23,12339,140,341,5,0,-1,1)
		end
	end
	if API_GetServerID() == 7 then
		if ChristmasDaShi_DGNPCFastID4 == nil then
			ChristmasDaShi_DGNPCFastID4 = API_CreateMonsterEx(99,12339,381,371,3,0,-1,1)
		else
			if API_GetMonsterID(ChristmasDaShi_DGNPCFastID4) > 0 then
				API_DestroyMonster(ChristmasDaShi_DGNPCFastID4)
			end
			ChristmasDaShi_DGNPCFastID4 = API_CreateMonsterEx(99,12339,381,371,3,0,-1,1)
		end
	end
	--创建联邦活动npc
	if API_GetServerID() == 1 then
		if ChristmasDaShi_LBNPCFastID1 == nil then
			ChristmasDaShi_LBNPCFastID1 = API_CreateMonsterEx(2,12339,242,179,4,0,-1,1)
		else
			if API_GetMonsterID(ChristmasDaShi_LBNPCFastID1) > 0 then
				API_DestroyMonster(ChristmasDaShi_LBNPCFastID1)
			end
			ChristmasDaShi_LBNPCFastID1 = API_CreateMonsterEx(2,12339,242,179,4,0,-1,1)
		end
	end
	if API_GetServerID() == 8 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
		if ChristmasDaShi_LBNPCFastID2 == nil then
			ChristmasDaShi_LBNPCFastID2 = API_CreateMonsterEx(25,12339,124,322,3,0,-1,1)
		else
			if API_GetMonsterID(ChristmasDaShi_LBNPCFastID2) > 0 then
				API_DestroyMonster(ChristmasDaShi_LBNPCFastID2)
			end
			ChristmasDaShi_LBNPCFastID2 = API_CreateMonsterEx(25,12339,124,322,3,0,-1,1)
		end
		if ChristmasDaShi_LBNPCFastID3 == nil then
			ChristmasDaShi_LBNPCFastID3 = API_CreateMonsterEx(10,12339,148,307,5,0,-1,1)
		else
			if API_GetMonsterID(ChristmasDaShi_LBNPCFastID3) > 0 then
				API_DestroyMonster(ChristmasDaShi_LBNPCFastID3)
			end
			ChristmasDaShi_LBNPCFastID3 = API_CreateMonsterEx(10,12339,148,307,5,0,-1,1)
		end
	end
	if API_GetServerID() == 8 then
		if ChristmasDaShi_LBNPCFastID4 == nil then
			ChristmasDaShi_LBNPCFastID4 = API_CreateMonsterEx(98,12339,354,384,5,0,-1,1)
		else
			if API_GetMonsterID(ChristmasDaShi_LBNPCFastID4) > 0 then
				API_DestroyMonster(ChristmasDaShi_LBNPCFastID4)
			end
			ChristmasDaShi_LBNPCFastID4 = API_CreateMonsterEx(98,12339,354,384,5,0,-1,1)
		end	
	end
	local StartTimeTable = ChristmasParty_StartTime
	local EndTimeTable = ChristmasParty_EndTime
	--创结束触发器
	if ChristmasParty_EndDateTimeTriggerGID == nil then
		ChristmasParty_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'ChristmasParty_DestroyNPC')
	else
		API_DestroyTriggerG(ChristmasParty_EndDateTimeTriggerGID)
		ChristmasParty_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'ChristmasParty_DestroyNPC')
	end
end

function ChristmasParty_DestroyNPC()
	--删除帝国活动npc
	if ChristmasDaShi_DGNPCFastID1 ~= nil then
		if API_GetMonsterID(ChristmasDaShi_DGNPCFastID1) > 0 then
			API_DestroyMonster(ChristmasDaShi_DGNPCFastID1)
		end
	end
	if ChristmasDaShi_DGNPCFastID2 ~= nil then
		if API_GetMonsterID(ChristmasDaShi_DGNPCFastID2) > 0 then
			API_DestroyMonster(ChristmasDaShi_DGNPCFastID2)
		end
	end
	if ChristmasDaShi_DGNPCFastID3 ~= nil then
		if API_GetMonsterID(ChristmasDaShi_DGNPCFastID3) > 0 then
			API_DestroyMonster(ChristmasDaShi_DGNPCFastID3)
		end
	end
	if ChristmasDaShi_DGNPCFastID4 ~= nil then
		if API_GetMonsterID(ChristmasDaShi_DGNPCFastID4) > 0 then
			API_DestroyMonster(ChristmasDaShi_DGNPCFastID4)
		end
	end
	--删除联邦活动npc
	if ChristmasDaShi_LBNPCFastID1 ~= nil then
		if API_GetMonsterID(ChristmasDaShi_LBNPCFastID1) > 0 then
			API_DestroyMonster(ChristmasDaShi_LBNPCFastID1)
		end
	end
	if ChristmasDaShi_LBNPCFastID2 ~= nil then
		if API_GetMonsterID(ChristmasDaShi_LBNPCFastID2) > 0 then
			API_DestroyMonster(ChristmasDaShi_LBNPCFastID2)
		end
	end
	if ChristmasDaShi_LBNPCFastID3 ~= nil then
		if API_GetMonsterID(ChristmasDaShi_LBNPCFastID3) > 0 then
			API_DestroyMonster(ChristmasDaShi_LBNPCFastID3)
		end
	end
	if ChristmasDaShi_LBNPCFastID4 ~= nil then
		if API_GetMonsterID(ChristmasDaShi_LBNPCFastID4) > 0 then
			API_DestroyMonster(ChristmasDaShi_LBNPCFastID4)
		end
	end
end

--圣诞大使点击函数
function ChristmasDaShiDianJi(ActorID,NPCID)
		local ActorID = ActorID or API_RequestGetActorID()
		ChristmasParty_QingChuShuJu(ActorID)
		API_ResponseWrite('<name>圣诞大使</name>')
		API_ResponseWrite('<text>亲爱的玩家你好:</text><br>')
		API_ResponseWrite('<text>    为了迎接圣诞节的来临，我们特意准备了一份小小的礼包送给大家，希望在严寒的节日收到礼包的朋友们能感受到温馨。在活动期间登陆游戏的新老玩家，每天都可以获得一份温馨的礼包。</text><br><br>')
		API_ResponseWrite('<a href="ChristmasDaShiDianJi_Title?1=100">领取“圣诞温馨礼包”</a>')
		API_ResponseWrite('<text>            </text>')
		API_ResponseWrite('<a href="ZheKouShangRen_MaiMai?1=1">购买活动道具</a>')
		API_ResponseWrite('<text>            </text>')
		API_ResponseWrite('<a href="ZheKouShangRen_MaiMai?1=5">积分兑换</a><br><br>')
		API_ResponseWrite('<a href="ZheKouShangRen_MaiMai?1=3">兑换霉运卷轴</a>')
		API_ResponseWrite('<text>                    </text>')
		API_ResponseWrite('<a href="ZheKouShangRen_MaiMai?1=4">兑换净化卷轴</a>')
		API_ResponseWrite('<text>            </text>')
		API_ResponseWrite('<a href="ChristmasDaShiDianJi_Title?1=300">冰寒积分查询</a><br><br>')
		API_ResponseWrite('<a href="MLB_Scroll_Select?1=17">本周排行榜</a>') 
--		API_ResponseWrite('<a href="ChristmasDaShiDianJi_Title?1=400">排行榜</a><br><br>')
--		API_ResponseWrite('<a href="ChristmasDaShiDianJi_Title?1=500">圣诞大转盘</a><br><br>')
		API_ResponseWrite('<text>                      </text>')
		API_ResponseWrite('<a href="Christmas_PointsAwards?1=2">圣诞欢乐送</a><br><br>')
		API_ResponseWrite('<a>关闭</a><br>')
		API_ResponseFlush(ActorID)
end

function ChristmasDaShiDianJi_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	
	if SelectItem == 100 then
		if API_VarDataGetNumber(ActorID,1,30229) == 0 then
			if API_ActorGetGoodsNum(ActorID,88995) > 0 or 
				API_ActorGetGoodsNum(ActorID,88996) > 0 or 
				API_ActorGetGoodsNum(ActorID,88997) > 0 then
				API_ResponseWrite('<name>圣诞大使</name>')
				API_ResponseWrite('<text>亲爱的玩家您背包中还有未打开的圣诞温馨礼包，请全部打开后再来领取。</text><br>')
				API_ResponseWrite('<br><a>确定</a>')
				return
			end
			if API_ActorCanAddGoods(ActorID,88995,1,3,0) == -1 then
				API_ResponseWrite('<text>您的背包空间不够，请至少保证一个空格再领取</text><br>')
				API_ResponseWrite('<a>关闭</a>')
				return
			end
			API_AddActorGoodsFlag(ActorID,88995,1,3,'领取圣诞温馨礼包')
			API_ActorSendMsg(ActorID,3,'成功领取圣诞温馨礼包。')
			API_VarDataSetNumber(ActorID,1,30229,1)
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[63][1][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[63][1][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[63][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][1][LaiYuan] + 1
			end
		else
			API_ResponseWrite('<name>圣诞大使</name>')
			API_ResponseWrite('<text>亲爱的玩家您今天已经领取过圣诞温馨礼包了，请明天再来领取每日奖励。</text><br>')
			API_ResponseWrite('<br><a>确定</a>')
		end
	elseif SelectItem == 200 then--积分晶片兑换
	elseif SelectItem == 300 then--圣诞积分查询
		local JiFen = API_VarDataGetNumber(ActorID,1,19038)
		API_ResponseWrite('<name>圣诞大使</name>')
		API_ResponseWrite('<text>您当前的冰寒积分为:</text><text color="255,0,255">'..JiFen..'</text><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')	
	elseif SelectItem == 400 then--排行榜
	elseif SelectItem == 500 then--圣诞转盘
		API_ResponseWrite('<name>圣诞大使</name>')
		API_ResponseWrite('<text>转动圣诞大转盘需要消耗30圣诞积分。</text><br>')
		API_ResponseWrite('<br><a href="LC_Christmas_ZhuanPan?1=101">转动圣诞大转盘</a><br>')		
		API_ResponseWrite('<br><a>关闭</a><br>')	
	end
end
if API_GetServerID() == 1 then
	local StartTimeTable = ChristmasParty_StartTime
	local EndTimeTable = ChristmasParty_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
	--创建时间触发器
		if ChristmasParty2010_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(ChristmasParty2010_TimeTriggerGID)
		end
		ChristmasParty2010_TimeTriggerGID = API_CreateTimerTriggerG(0,0,60,-1,'BingHanJiFenDuiHuan_ShuJuQingChu')
	else
		if ChristmasParty2010_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(ChristmasParty2010_TimeTriggerGID)
		end
	end
end

--清除全局交互数据
function BingHanJiFenDuiHuan_ShuJuQingChu(Param1,Param2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.time()
	--每日定时刷新
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6011,1,3) and API_GetServerID() == 1 then
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,8,20)
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,9,20)
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,10,10)
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,11,10)
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,12,50)
		local NowTime = os.date("*t", os.time()) 
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		if Hour < 12 then
			NowTime.hour = 11 
			NowTime.min = 59 
			NowTime.sec = 59
		elseif Hour >= 12 and Hour <= 18 then
			NowTime.hour = 18 
			NowTime.min = 59 
			NowTime.sec = 59
		elseif Hour >= 19 then
			NowTime.hour = 11 
			NowTime.min = 59 
			NowTime.sec = 59
		end
		local NightTime = os.time(NowTime)
		local NextQingChuTime = NightTime + 1
		if Hour >= 19 then
			NextQingChuTime = NightTime + 86400 + 1
		end
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,3,NextQingChuTime)
		API_ActorBroadcastMsg(-1,17,'圣诞大使兑换礼品已刷新')
	end
	--设置奖励上限数量
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6012,1,1) and API_GetServerID() == 1 then
		API_VarDataSetNumber_Ex_Sync(1,0,-6012,1,2,2)
		API_VarDataSetNumber_Ex_Sync(1,0,-6012,1,3,2)
		API_VarDataSetNumber_Ex_Sync(1,0,-6012,1,4,2)
		API_VarDataSetNumber_Ex_Sync(1,0,-6012,1,5,2)
		local NowTime = os.date("*t", os.time()) 
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 11 
		NowTime.min = 59 
		NowTime.sec = 59 
		local NightTime = os.time(NowTime)
		local NextQingChuTime = NightTime + 86400 + 1
		API_VarDataSetNumber_Ex_Sync(1,0,-6012,1,1,NextQingChuTime)
	end
	if Hour == 13 and Week == 6 then
		if Minute == 50 then
			API_ActorBDCMsg(-1,0,-1,11,85,0,17,'圣诞大使兑换雪女宝宝将会在14点刷新，请广大玩家前往圣诞大使处做好兑换准备。')
			API_ActorBDCMsg(-1,1,-1,11,85,0,1,'圣诞大使兑换雪女宝宝将会在14点刷新，请广大玩家前往圣诞大使处做好兑换准备。')
			API_ActorBDCMsg(-1,0,-1,11,85,0,7,'圣诞大使兑换雪女宝宝将会在14点刷新，请广大玩家前往圣诞大使处做好兑换准备。')			
		end
	end	
	--每周清除
--	if NowTime > API_VarDataGetNumber_Ex(1,0,-6011,1,2) and API_GetServerID() == 1 then
	if Week == 6 and API_GetServerID() == 1 and NowTime > API_VarDataGetNumber_Ex(1,0,-6012,1,6) and Hour >= 14 then
	   local DayTime = 86400
	   local NowTime = os.date("*t", os.time()) 
	   NowTime.year = Year
	   NowTime.month = Month
	   NowTime.day = Day
	   NowTime.hour = 13 
	   NowTime.min = 59 
	   NowTime.sec = 59 
	   local NightTime = os.time(NowTime) 
	   local NextTime = NightTime + DayTime + 1
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,1,1)--雪女宠物
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,4,2)--圣诞时装
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,5,2)--圣诞时装
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,6,2)--圣诞时装
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,7,2)--圣诞时装
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,13,5)--
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,14,5)--
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,15,5)--
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,16,5)--
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,17,5)--
		API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,18,5)--
		API_VarDataSetNumber_Ex_Sync(1,0,-6012,1,6,NextTime)--下次每周清除时间
		API_ActorBroadcastMsg(-1,17,'圣诞大使积分兑换雪女宝宝，圣诞时装，载具卡片已经刷新，广大玩家可前往圣诞大使处进行兑换。')
		API_ActorBDCMsg(-1,1,-1,11,85,0,1,'圣诞大使积分兑换雪女宝宝，圣诞时装，载具卡片已经刷新，广大玩家可前往圣诞大使处进行兑换。')
	end
end

function ChristmasParty_QingChuShuJu(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local NowTime = os.time()
	--每日清除
	if NowTime > API_VarDataGetNumber(ActorID,1,30228) then
		local NowTime = os.date("*t", os.time())
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 23
		NowTime.min = 59
		NowTime.sec = 59
		local NightTime = os.time(NowTime)
		local NextTime = NightTime + 1
		API_VarDataSetNumber(ActorID,1,30229,0)--每天领取数量
		API_VarDataSetNumber(ActorID,1,30228,NextTime)--下次每日清除时间
	end
end

local Christmas_LibaoID = {[0]=88995,[1]=88996,[2]=88997,}
local ChristmasLibao_GoodList={
[88995] = {	NeedLv=41,
		List={
		[25] = {
				{Type='Crystal',Num=2000},
				{Type='Goods',ID=82004,Num=3,Lock=1},
				{Type='Goods',ID=766,Num=5,Lock=1},
				{Type='Goods',ID=767,Num=5,Lock=1},
				{Type='Goods',ID=88996,Num=1,Lock=1},
				},
		[40] = {
				{Type='Crystal',Num=2000},
				{Type='Goods',ID=82004,Num=10,Lock=1},
				{Type='Goods',ID=118,Num=10,Lock=1},
				{Type='Goods',ID=207,Num=10,Lock=1},
				{Type='Goods',ID=311,Num=5,Lock=1},
				{Type='Goods',ID=88996,Num=1,Lock=1},
				},
		[55] = {
				{Type='Crystal',Num=8000},
				{Type='Goods',ID=82004,Num=50,Lock=1},
				{Type='Goods',ID=119,Num=10,Lock=1},
				{Type='Goods',ID=208,Num=10,Lock=1},
				{Type='Goods',ID=311,Num=5,Lock=1},
				{Type='Goods',ID=80384,Num=5,Lock=1},
				{Type='Goods',ID=80382,Num=1,Lock=1},
				{Type='Goods',ID=88996,Num=1,Lock=1},
				},	
		[65] = {
				{Type='Crystal',Num=10000},
				{Type='Goods',ID=82004,Num=100,Lock=1},
				{Type='Goods',ID=119,Num=10,Lock=1},
				{Type='Goods',ID=208,Num=10,Lock=1},
				{Type='Goods',ID=80197,Num=10,Lock=1},
				{Type='Goods',ID=80384,Num=5,Lock=1},
				{Type='Goods',ID=80382,Num=1,Lock=1},
				{Type='Goods',ID=88996,Num=1,Lock=1},
				},					
				},
		},
[88996] = {	Time=1800,
		List={
		[25] = {
				{Type='Goods',ID=82004,Num=6,Lock=1},
				{Type='Goods',ID=80383,Num=5,Lock=1},
				{Type='Goods',ID=80381,Num=1,Lock=1},
				{Type='Goods',ID=80274,Num=1,Lock=1},
				{Type='Goods',ID=80191,Num=5,Lock=1},
				{Type='Goods',ID=80195,Num=20,Lock=1},
				{Type='Goods',ID=88997,Num=1,Lock=1},
				},
		[40] = {
				{Type='Goods',ID=82004,Num=20,Lock=1},
				{Type='Goods',ID=80384,Num=5,Lock=1},
				{Type='Goods',ID=80382,Num=1,Lock=1},
				{Type='Goods',ID=80274,Num=1,Lock=1},
				{Type='Goods',ID=80196,Num=20,Lock=1},
				{Type='Goods',ID=88997,Num=1,Lock=1},
				},
		[55] = {
				{Type='Goods',ID=82004,Num=100,Lock=1},
				{Type='Goods',ID=80384,Num=5,Lock=1},
				{Type='Goods',ID=80382,Num=1,Lock=1},
				{Type='Goods',ID=80274,Num=1,Lock=1},
				{Type='Goods',ID=80197,Num=20,Lock=1},
				{Type='Goods',ID=250,Num=5,Lock=1},
				{Type='Goods',ID=88997,Num=1,Lock=1},
				},
		[65] = {
				{Type='Goods',ID=82004,Num=200,Lock=1},
				{Type='Goods',ID=80384,Num=5,Lock=1},
				{Type='Goods',ID=80382,Num=1,Lock=1},
				{Type='Goods',ID=80274,Num=1,Lock=1},
				{Type='Goods',ID=80197,Num=30,Lock=1},
				{Type='Goods',ID=250,Num=5,Lock=1},
				{Type='Goods',ID=88997,Num=1,Lock=1},
				},
				},
		},
[88997] = {	GoodsNum=100,
		List={
		[25] = {
				{Type='Goods',ID=82004,Num=12,Lock=1},
				{Type='Goods',ID=80950,Num=2,Lock=1},
				{Type='Goods',ID=80686,Num=1,Lock=1},
				{Type='Goods',ID=80383,Num=5,Lock=1},
				{Type='Goods',ID=80381,Num=1,Lock=1},
				},
		[40] = {
				{Type='Goods',ID=82004,Num=40,Lock=1},
				{Type='Goods',ID=80384,Num=5,Lock=1},
				{Type='Goods',ID=80382,Num=1,Lock=1},
				{Type='Goods',ID=80951,Num=1,Lock=1},
				{Type='Goods',ID=80686,Num=1,Lock=1},
				},
		[55] = {
				{Type='Goods',ID=82004,Num=200,Lock=1},
				{Type='Goods',ID=80384,Num=5,Lock=1},
				{Type='Goods',ID=80382,Num=1,Lock=1},
				{Type='Goods',ID=80951,Num=1,Lock=1},
				{Type='Goods',ID=80686,Num=1,Lock=1},
				{Type='Goods',ID=80949,Num=1,Lock=1},
				},
		[65] = {
				{Type='Goods',ID=82004,Num=400,Lock=1},
				{Type='Goods',ID=80384,Num=5,Lock=1},
				{Type='Goods',ID=80382,Num=1,Lock=1},
				{Type='Goods',ID=80952,Num=1,Lock=1},
				{Type='Goods',ID=80686,Num=2,Lock=1},
				{Type='Goods',ID=80949,Num=1,Lock=1},
				},				
				},
		},
}

--上线回调
function ChristmasLibao_OnLogin() 
	local ActorID = API_RequestGetActorID()
	local OnLoginType = API_VarDataGetNumber(ActorID,0,18368)
	local StartTimeTable = ChristmasParty_StartTime
	local EndTimeTable = ChristmasParty_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if OnLoginType ~= 2 then
		if nShiFouStart <= 0 and nShiFouEnd > 0 then
			local OnLogin_Time =os.time()
			API_VarDataSetNumber(ActorID,1,30230,OnLogin_Time)
		end
	end
	SummeAmbassador_QingChuShuJu(ActorID)
end

--下线回调
function ChristmasLibao_OnLogout()
	local ActorID = API_RequestGetActorID()
	local OnLogoutType = API_VarDataGetNumber(ActorID,0,18368)
	local OnLogin_Time = API_VarDataGetNumber(ActorID,1,30230)
	local OnLogout_Time = os.time()
	local Online = OnLogout_Time - OnLogin_Time
	if Online < 1800 and OnLogoutType ~= 2 then
		API_VarDataSetNumber(ActorID,1,30231,0)
	else
		API_VarDataSetNumber(ActorID,1,30231,Online)
	end
end

function ChristmasLibao_OnlineTime(ActorID)
	local OnLogin_Time = API_VarDataGetNumber(ActorID,1,30230)
	local NowTime = os.time()
	local Online =  NowTime - OnLogin_Time
	API_VarDataSetNumber(ActorID,1,30231,Online)
end

function ChristmasLibao_kuatianhuidiao(ActorID)
	local NowTime = os.time()
	API_VarDataSetNumber(ActorID,1,30230,NowTime)
end

function ChristmasLibao_GoodsCallFunc(ActorID,GoodsID)
		local ActorID = ActorID or API_RequestGetActorID()
		local ActorLevel = API_GetActorExpLevel(ActorID)
		local Lv = 0
		if ActorLevel <= 25 then
			Lv = 25
		elseif ActorLevel <= 40 then
			Lv = 40
		elseif ActorLevel <= 55 then
			Lv = 55
		else
			Lv = 65
		end
		local JiangliList = ChristmasLibao_GoodList[GoodsID].List[Lv]
		if JiangliList == nil then
			API_ResponseWrite('<text>这个宝箱里面空空如也~~</text><br>')
			API_ResponseWrite('<br><a>暂时收好</a><br>')
			API_ResponseFlush(ActorID)			
			return 0
		end
		API_ResponseWrite('<name>圣诞温馨礼包</name>')
		API_ResponseWrite('<br><text>这个宝箱里面藏着这些宝贝：</text><br>')
		for i in JiangliList do
			local Jiangli = JiangliList[i]
			local JiangliType = Jiangli.Type
			local JiangliGoodsID = Jiangli.ID
			local JiangliNum = Jiangli.Num
			if JiangliType == 'Money' and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Exp' and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Crystal' and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
			end
		end
		if GoodsID == 88995 then
			API_ResponseWrite('<br><br><text>您要现在打开它吗？</text><br>')
			API_ResponseWrite('<br><a href="ChristmasLibao_OpenLibao?1='..GoodsID..'">马上打开</a><br>')
			API_ResponseWrite('<br><a>暂时收好</a><br>')
			API_ResponseFlush(ActorID)
		end
		if GoodsID == 88996 then
			local Time = ChristmasLibao_GoodList[GoodsID].Time
			ChristmasLibao_OnlineTime(ActorID)
			local Online = API_VarDataGetNumber(ActorID,1,30231)
			local OnlineTime = math.floor(Time/60)
			local NowOnlineTime = math.floor(Online/60)
			if Online >= Time then
				API_ResponseWrite('<br><br><text>您要现在打开它吗？</text><br>')
				API_ResponseWrite('<br><a href="ChristmasLibao_OpenLibao?1='..GoodsID..'">马上打开</a><br>')
				API_ResponseWrite('<br><a>暂时收好</a><br>')
				API_ResponseFlush(ActorID)
			elseif Online < Time then
				local Time = math.floor(Online/60)
				API_ResponseWrite('<br><br><text color="255,0,0">只有在线'.. OnlineTime ..'分钟以上</text><text>才能得到其中的礼物！</text><br>')
				API_ResponseWrite('<text>您今天已持续在线:</text><text color="255,0,255">'.. NowOnlineTime ..'分钟</text><br>')				
				API_ResponseWrite('<br><a>暂时收好</a><br>')
				API_ResponseFlush(ActorID)
			end
		end
		if GoodsID == 88997 then
			local GoodsNum = ChristmasLibao_GoodList[GoodsID].GoodsNum
			if API_ActorGetGoodsNum(ActorID,82019) < GoodsNum then--判断背包中的物品数量
				API_ResponseWrite('<br><br><text color="255,0,0">只有消耗'.. GoodsNum ..'个冰寒晶片</text><text>才能得到其中的礼物！</text><br>')
				API_ResponseWrite('<text>您今天当前身上携带的冰寒晶片数量不足'.. GoodsNum ..'个</text><br>')				
				API_ResponseWrite('<br><a>暂时收好</a><br>')
				API_ResponseFlush(ActorID)
			else
				API_ResponseWrite('<br><br><text>您要现在打开它吗？</text><br>')
				API_ResponseWrite('<br><a href="ChristmasLibao_OpenLibao?1='..GoodsID..'">马上打开</a><br>')
				API_ResponseWrite('<br><a>暂时收好</a><br>')
				API_ResponseFlush(ActorID)
			end
		end
		return 1
end

function ChristmasLibao_OpenLibao()
	local ActorID = API_RequestGetActorID()
	local LibaoGoodsID = API_RequestGetNumber(1)
	local ActorLevel = API_GetActorExpLevel(ActorID)
	local Lv = 0
	if ActorLevel <= 25 then
		Lv = 25
	elseif ActorLevel <= 40 then
		Lv = 40
	elseif ActorLevel <= 55 then
		Lv = 55
	else
		Lv = 65
	end
	local JiangliList = ChristmasLibao_GoodList[LibaoGoodsID].List[Lv]
	if type(JiangliList) ~= 'table' then
		return
	end
	local jianglineedbagnum = 0
	local PackageSize = API_ActorGetPackageSize(ActorID)
	for i in JiangliList do
		local Jiangli = JiangliList[i]
		local JiangliType = Jiangli.Type
		local JiangliGoodsID = Jiangli.ID
		local JiangliNum = Jiangli.Num
		if JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
			jianglineedbagnum = jianglineedbagnum + 1
		end
	end
	if PackageSize < jianglineedbagnum then
		API_ResponseWrite('<text>您的背包剩余空间少于</text><text color="255,0,0">'..jianglineedbagnum..'</text><text>格，无法获得奖励。请清理背包后再试。</text><br>')
		API_ResponseWrite('<br><a>暂时收好</a><br>')
		return
	end
	if LibaoGoodsID == 88995 then	
	elseif LibaoGoodsID == 88996 then
		local Time = ChristmasLibao_GoodList[LibaoGoodsID].Time
		ChristmasLibao_OnlineTime(ActorID)
		local Online = API_VarDataGetNumber(ActorID,1,30231)
		local OnlineTime = math.floor(Time/60)
		local NowOnlineTime = math.floor(Online/60)
		if Online < Time then
			local Time = math.floor(Online/60)
			API_ResponseWrite('<br><br><text color="255,0,0">只有在线'.. Time ..'分钟以上</text><text>才能得到其中的礼物！</text><br>')
			API_ResponseWrite('<text>您今天已持续在线:</text><text color="255,0,255">'.. Time ..'分钟</text><br>')				
			API_ResponseWrite('<br><a>暂时收好</a><br>')
			API_ResponseFlush(ActorID)
			return
		end
	elseif LibaoGoodsID == 88997 then
		local GoodsNum = ChristmasLibao_GoodList[LibaoGoodsID].GoodsNum
		if API_ActorGetGoodsNum(ActorID,82019) < GoodsNum then--判断背包中的物品数量
			API_ResponseWrite('<br><br><text color="255,0,0">只有消耗'.. GoodsNum ..'个冰寒晶片</text><text>才能得到其中的礼物！</text><br>')
			API_ResponseWrite('<text>您今天当前身上携带的冰寒晶片数量不足'.. GoodsNum ..'个</text><br>')				
			API_ResponseWrite('<br><a>暂时收好</a><br>')
			API_ResponseFlush(ActorID)
			return
		else
			if API_ActorRemoveGoods(ActorID,82019,GoodsNum,'扣除冰寒晶片') then
			else
				return
			end
		end
	else
		return
	end
	if API_ActorGetGoodsNum(ActorID,LibaoGoodsID) > 0 and API_ActorRemoveGoods(ActorID,LibaoGoodsID,1,'删除圣诞温馨礼包') then
		API_ResponseWrite('<text>您打开'..API_GetGoodsName(LibaoGoodsID)..'，获得里面藏着的礼物：</text><br>')
		for i in JiangliList do
			local Jiangli = JiangliList[i]
			local JiangliType = Jiangli.Type
			local JiangliGoodsID = Jiangli.ID
			local JiangliNum = Jiangli.Num
			if JiangliType == 'Money' and JiangliNum > 0 then
				API_ActorAddMoney(ActorID,JiangliNum,0,'圣诞温馨礼包')
				API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 金币')
				API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 金币')
				API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Exp' and JiangliNum > 0 then
				API_ActorAddExp(ActorID,JiangliNum,0,'圣诞温馨礼包')
				API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 经验')
				API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 经验')
				API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Crystal' and JiangliNum > 0 then
				API_ActorShoppingM_Add(ActorID,JiangliNum,0,'圣诞温馨礼包')
				API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 水晶币')
				API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 水晶币')
				API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
				if API_ActorCanAddGoods(ActorID,JiangliGoodsID,JiangliNum,3,0) ~= -1 then
					local QosLevel = Jiangli.QosLevel
					if QosLevel == nil then
						QosLevel = 1
					end
					local AutoIdentify = Jiangli.AutoIdentify
					if AutoIdentify == nil then
						AutoIdentify = 0
					end
					API_AddActorGoodsFlagEx(ActorID,JiangliGoodsID,JiangliNum,QosLevel,3,'圣诞温馨礼包',AutoIdentify)
					API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
					API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
					API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
				else
					API_SendActorMailByName(API_GetActorName(ActorID),JiangliGoodsID,JiangliNum,3,'['..API_GetGoodsName(LibaoGoodsID)..']','打开'..API_GetGoodsName(LibaoGoodsID)..'：获得'..JiangliNum..'个'..API_GetGoodsName(JiangliGoodsID)..'')
					API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
					API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
					API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' （请到邮箱领取）</text><text>        </text>')
				end
				if LibaoGoodsID == 88995 then
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[63][2][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[63][2][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[63][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][2][LaiYuan] + 1
					end
				elseif LibaoGoodsID == 88996 then
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[63][3][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[63][3][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[63][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][3][LaiYuan] + 1
					end
				elseif LibaoGoodsID == 88997 then
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[63][4][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[63][4][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[63][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][4][LaiYuan] + 1
					end
				end
			end
		end
		API_ResponseWrite('<br><br><a>确定</a><br>')
	else
		API_ActorSendMsg(ActorID,3,'扣除物品失败，请重新尝试。')
		return
	end
end
if Christmas_MaxGoodsNumTable == nil then
	Christmas_MaxGoodsNumTable = {
		[11026] = {Num=0,MaxNum=2},
		[11027] = {Num=0,MaxNum=2},
		[11028] = {Num=0,MaxNum=2},
		[11029] = {Num=0,MaxNum=2},
		[11034] = {Num=0,MaxNum=1},
		[11035] = {Num=0,MaxNum=1},
		[11036] = {Num=0,MaxNum=2},
		[11037] = {Num=0,MaxNum=2},
		[11046] = {Num=0,MaxNum=2},
		[11047] = {Num=0,MaxNum=2},
		[11042] = {Num=0,MaxNum=1},
		[11043] = {Num=0,MaxNum=1},
		[11045] = {Num=0,MaxNum=2},
		[88171] = {Num=0,MaxNum=50},
	}
end
GLOBAL_Christmas_GoodsTable = {
--圣诞礼盒
[1] = {
			{GoodsID=80049,GaiLv1=1,GaiLv2=294117,NumGaiLv=9111,NumMax=4,NumMin=3},
			{GoodsID=80049,GaiLv1=294118,GaiLv2=588235,NumGaiLv=9555,NumMax=2,NumMin=1},
			{GoodsID=80065,GaiLv1=588236,GaiLv2=882353,NumGaiLv=9555,NumMax=2,NumMin=1},
			{GoodsID=80065,GaiLv1=882354,GaiLv2=1176471,NumGaiLv=9555,NumMax=2,NumMin=1},
			{GoodsID=80065,GaiLv1=1176472,GaiLv2=1470589,NumGaiLv=9555,NumMax=2,NumMin=1},
			{GoodsID=80065,GaiLv1=1470590,GaiLv2=1764707,NumGaiLv=9555,NumMax=2,NumMin=1},
			{GoodsID=80065,GaiLv1=1764708,GaiLv2=2058825,NumGaiLv=9555,NumMax=2,NumMin=1},
			{GoodsID=40202,GaiLv1=2058826,GaiLv2=2279414,NumGaiLv=9555,NumMax=2,NumMin=1},
			{GoodsID=40218,GaiLv1=2279415,GaiLv2=2500003,NumGaiLv=15,NumMax=1,NumMin=0},
			{GoodsID=80383,GaiLv1=2500004,GaiLv2=2941180,NumGaiLv=15,NumMax=1,NumMin=0},
			{GoodsID=80383,GaiLv1=2941181,GaiLv2=3382357,NumGaiLv=15,NumMax=1,NumMin=0},
			{GoodsID=80383,GaiLv1=3382358,GaiLv2=3823534,NumGaiLv=15,NumMax=1,NumMin=0},
			{GoodsID=80383,GaiLv1=3823535,GaiLv2=4264711,NumGaiLv=15,NumMax=1,NumMin=0},
			{GoodsID=80181,GaiLv1=4264712,GaiLv2=4705888,NumGaiLv=21,NumMax=1,NumMin=0},
			{GoodsID=80181,GaiLv1=4705889,GaiLv2=5147065,NumGaiLv=21,NumMax=1,NumMin=0},
			{GoodsID=80181,GaiLv1=5147066,GaiLv2=5588242,NumGaiLv=21,NumMax=1,NumMin=0},
			{GoodsID=80181,GaiLv1=5588243,GaiLv2=6029419,NumGaiLv=7600,NumMax=6,NumMin=5},
			{GoodsID=80191,GaiLv1=6029420,GaiLv2=6470596,NumGaiLv=180,NumMax=1,NumMin=0},
			{GoodsID=80191,GaiLv1=6470597,GaiLv2=6911773,NumGaiLv=7600,NumMax=6,NumMin=5},
			{GoodsID=80191,GaiLv1=6911774,GaiLv2=7352950,NumGaiLv=180,NumMax=1,NumMin=0},
			{GoodsID=80191,GaiLv1=7352951,GaiLv2=7794127,NumGaiLv=7600,NumMax=6,NumMin=5},
			{GoodsID=80191,GaiLv1=7794128,GaiLv2=8235304,NumGaiLv=180,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=8235305,GaiLv2=8676481,NumGaiLv=32,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=8676482,GaiLv2=9117658,NumGaiLv=32,NumMax=1,NumMin=0},
			{GoodsID=501,GaiLv1=9117659,GaiLv2=9558835,NumGaiLv=32,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=9558836,GaiLv2=10000000,NumGaiLv=32,NumMax=1,NumMin=0},
		},
[2] = {
			{GoodsID=80050,GaiLv1=1,GaiLv2=273224,NumGaiLv=2688,NumMax=1,NumMin=0},
			{GoodsID=80050,GaiLv1=273225,GaiLv2=546449,NumGaiLv=25,NumMax=1,NumMin=0},
			{GoodsID=80066,GaiLv1=546450,GaiLv2=819674,NumGaiLv=2688,NumMax=1,NumMin=0},
			{GoodsID=80066,GaiLv1=819675,GaiLv2=1092899,NumGaiLv=25,NumMax=1,NumMin=0},
			{GoodsID=80066,GaiLv1=1092900,GaiLv2=1366124,NumGaiLv=2688,NumMax=1,NumMin=0},
			{GoodsID=80066,GaiLv1=1366125,GaiLv2=1639349,NumGaiLv=25,NumMax=1,NumMin=0},
			{GoodsID=80066,GaiLv1=1639350,GaiLv2=1912574,NumGaiLv=2688,NumMax=1,NumMin=0},
			{GoodsID=40204,GaiLv1=1912575,GaiLv2=2021864,NumGaiLv=25,NumMax=1,NumMin=0},
			{GoodsID=40220,GaiLv1=2021865,GaiLv2=2131154,NumGaiLv=2688,NumMax=1,NumMin=0},
			{GoodsID=40236,GaiLv1=2131155,GaiLv2=2240444,NumGaiLv=2688,NumMax=1,NumMin=0},
			{GoodsID=80384,GaiLv1=2240445,GaiLv2=2786893,NumGaiLv=25,NumMax=1,NumMin=0},
			{GoodsID=80384,GaiLv1=2786894,GaiLv2=3333342,NumGaiLv=3780,NumMax=1,NumMin=0},
			{GoodsID=80181,GaiLv1=3333343,GaiLv2=3697641,NumGaiLv=6,NumMax=1,NumMin=0},
			{GoodsID=80181,GaiLv1=3697642,GaiLv2=4061940,NumGaiLv=3780,NumMax=1,NumMin=0},
			{GoodsID=80181,GaiLv1=4061941,GaiLv2=4426239,NumGaiLv=6,NumMax=1,NumMin=0},
			{GoodsID=80181,GaiLv1=4426240,GaiLv2=4790538,NumGaiLv=3780,NumMax=1,NumMin=0},
			{GoodsID=80192,GaiLv1=4790539,GaiLv2=5154837,NumGaiLv=6,NumMax=1,NumMin=0},
			{GoodsID=80192,GaiLv1=5154838,GaiLv2=5519136,NumGaiLv=1501,NumMax=4,NumMin=3},
			{GoodsID=80192,GaiLv1=5519137,GaiLv2=5883435,NumGaiLv=1501,NumMax=4,NumMin=3},
			{GoodsID=80192,GaiLv1=5883436,GaiLv2=6247734,NumGaiLv=1501,NumMax=4,NumMin=3},
			{GoodsID=80192,GaiLv1=6247735,GaiLv2=6612033,NumGaiLv=4375,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=6612034,GaiLv2=7158482,NumGaiLv=2100,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=7158483,GaiLv2=7704931,NumGaiLv=5002,NumMax=4,NumMin=3},
			{GoodsID=82004,GaiLv1=7704932,GaiLv2=8251380,NumGaiLv=5002,NumMax=4,NumMin=3},
			{GoodsID=82004,GaiLv1=8251381,GaiLv2=8797829,NumGaiLv=5002,NumMax=4,NumMin=3},
			{GoodsID=82004,GaiLv1=8797830,GaiLv2=9344278,NumGaiLv=5002,NumMax=4,NumMin=3},
			{GoodsID=501,GaiLv1=9344279,GaiLv2=9617503,NumGaiLv=3673,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=9617504,GaiLv2=9890728,NumGaiLv=1892,NumMax=1,NumMin=0},
			{GoodsID=80387,GaiLv1=9890729,GaiLv2=9945373,NumGaiLv=3728,NumMax=1,NumMin=0},
			{GoodsID=80387,GaiLv1=9945374,GaiLv2=10000000,NumGaiLv=2949,NumMax=1,NumMin=0},
		},
[3] = {
			{GoodsID=80050,GaiLv1=1,GaiLv2=210970,NumGaiLv=4836,NumMax=1,NumMin=0},
			{GoodsID=80051,GaiLv1=210971,GaiLv2=421941,NumGaiLv=4836,NumMax=1,NumMin=0},
			{GoodsID=80051,GaiLv1=421942,GaiLv2=632912,NumGaiLv=4836,NumMax=1,NumMin=0},
			{GoodsID=80067,GaiLv1=632913,GaiLv2=843883,NumGaiLv=4836,NumMax=1,NumMin=0},
			{GoodsID=80067,GaiLv1=843884,GaiLv2=1054854,NumGaiLv=4836,NumMax=1,NumMin=0},
			{GoodsID=80067,GaiLv1=1054855,GaiLv2=1265825,NumGaiLv=1133,NumMax=1,NumMin=0},
			{GoodsID=80067,GaiLv1=1265826,GaiLv2=1476796,NumGaiLv=1133,NumMax=1,NumMin=0},
			{GoodsID=80067,GaiLv1=1476797,GaiLv2=1687767,NumGaiLv=1133,NumMax=1,NumMin=0},
			{GoodsID=40206,GaiLv1=1687768,GaiLv2=1772156,NumGaiLv=2137,NumMax=1,NumMin=0},
			{GoodsID=40222,GaiLv1=1772157,GaiLv2=1856545,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=40238,GaiLv1=1856546,GaiLv2=1940934,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80384,GaiLv1=1940935,GaiLv2=2362875,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80384,GaiLv1=2362876,GaiLv2=2784816,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80384,GaiLv1=2784817,GaiLv2=3206757,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80181,GaiLv1=3206758,GaiLv2=3628698,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80181,GaiLv1=3628699,GaiLv2=4050639,NumGaiLv=2708,NumMax=1,NumMin=0},
			{GoodsID=80181,GaiLv1=4050640,GaiLv2=4472580,NumGaiLv=410,NumMax=1,NumMin=0},
			{GoodsID=80181,GaiLv1=4472581,GaiLv2=4894521,NumGaiLv=451,NumMax=1,NumMin=0},
			{GoodsID=80192,GaiLv1=4894522,GaiLv2=5316462,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=80192,GaiLv1=5316463,GaiLv2=5738403,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=80192,GaiLv1=5738404,GaiLv2=6160344,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80192,GaiLv1=6160345,GaiLv2=6582285,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80192,GaiLv1=6582286,GaiLv2=7004226,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=82004,GaiLv1=7004227,GaiLv2=7426167,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=82004,GaiLv1=7426168,GaiLv2=7848108,NumGaiLv=2708,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=7848109,GaiLv2=8270049,NumGaiLv=410,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=8270050,GaiLv2=8691990,NumGaiLv=451,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=8691991,GaiLv2=9113931,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=501,GaiLv1=9113932,GaiLv2=9535872,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=9535873,GaiLv2=9957813,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80388,GaiLv1=9957814,GaiLv2=9978911,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80388,GaiLv1=9978912,GaiLv2=10000000,NumGaiLv=2970,NumMax=2,NumMin=1},
		},
[4] = {
			{GoodsID=80051,GaiLv1=1,GaiLv2=272975,NumGaiLv=4836,NumMax=1,NumMin=0},
			{GoodsID=80051,GaiLv1=272976,GaiLv2=545951,NumGaiLv=4836,NumMax=1,NumMin=0},
			{GoodsID=80197,GaiLv1=545952,GaiLv2=818927,NumGaiLv=4836,NumMax=1,NumMin=0},
			{GoodsID=80197,GaiLv1=818928,GaiLv2=1091903,NumGaiLv=4836,NumMax=1,NumMin=0},
			{GoodsID=80067,GaiLv1=1091904,GaiLv2=1364879,NumGaiLv=4836,NumMax=1,NumMin=0},
			{GoodsID=80067,GaiLv1=1364880,GaiLv2=1637855,NumGaiLv=1133,NumMax=1,NumMin=0},
			{GoodsID=80949,GaiLv1=1637856,GaiLv2=1674252,NumGaiLv=1133,NumMax=1,NumMin=0},
			{GoodsID=40208,GaiLv1=1674253,GaiLv2=1701550,NumGaiLv=1133,NumMax=1,NumMin=0},
			{GoodsID=40224,GaiLv1=1701551,GaiLv2=1728848,NumGaiLv=2137,NumMax=1,NumMin=0},
			{GoodsID=40240,GaiLv1=1728849,GaiLv2=1756146,NumGaiLv=2137,NumMax=1,NumMin=0},
			{GoodsID=80384,GaiLv1=1756147,GaiLv2=2120114,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80384,GaiLv1=2120115,GaiLv2=2484082,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80384,GaiLv1=2484083,GaiLv2=2848050,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80181,GaiLv1=2848051,GaiLv2=3212018,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80181,GaiLv1=3212019,GaiLv2=3575986,NumGaiLv=2970,NumMax=2,NumMin=1},
			{GoodsID=80181,GaiLv1=3575987,GaiLv2=3939954,NumGaiLv=2708,NumMax=1,NumMin=0},
			{GoodsID=80181,GaiLv1=3939955,GaiLv2=4303922,NumGaiLv=410,NumMax=1,NumMin=0},
			{GoodsID=80192,GaiLv1=4303923,GaiLv2=4667890,NumGaiLv=451,NumMax=1,NumMin=0},
			{GoodsID=80192,GaiLv1=4667891,GaiLv2=5031858,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=80192,GaiLv1=5031859,GaiLv2=5395826,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=80192,GaiLv1=5395827,GaiLv2=5759794,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=80192,GaiLv1=5759795,GaiLv2=6123762,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=6123763,GaiLv2=6669713,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=6669714,GaiLv2=7215664,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=7215665,GaiLv2=7761615,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=7761616,GaiLv2=8307566,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=8307567,GaiLv2=8853517,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=501,GaiLv1=8853518,GaiLv2=9399468,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=9399469,GaiLv2=9945419,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=80388,GaiLv1=9945420,GaiLv2=9972717,NumGaiLv=205,NumMax=1,NumMin=0},
			{GoodsID=80388,GaiLv1=9972718,GaiLv2=10000000,NumGaiLv=205,NumMax=1,NumMin=0},
		},
}

LC_ChristmasZhuanPan_XianShiTab = {
	[1] = {
		[1] = {
			Num = 12,
			GoodsList = {80383,80381,80397,80394,40003,40013,40023,40093,31015,31016,76,80686,80689,31101,75,80195,80697,80274,},
			},
		[2] = {
			Num = 3,
			GoodsList = {39501,39502,39503,39510,39513,11026,11027,11028,11029,11034,11035,11036,11037,11046,11047,11042,11043,11045,},
			},
		[3] = {
			{80498,20,23},
			{80696,10,13},
			{80697,1,2},
			},
		},
	[2] = {
		[1] = {
			Num = 12,
			GoodsList = {80384,80382,76,40004,40014,40024,40094,80697,80196,250,80397,80394,80686,80689,31101,75,80274,},
			},
		[2] = {
			Num = 3,
			GoodsList = {39501,39502,39503,39510,39513,31017,31018,31019,9507,11026,11027,11028,11029,11034,11035,11036,11037,11046,11047,11042,11043,11045,80387,},
			},
		[3] = {
			{80498,20,23},
			{80696,10,13},
			{80697,1,2},
			},
		},
	[3] = {
		[1] = {
			Num = 12,
			GoodsList = {80384,80382,76,40004,40014,40024,40094,80697,80196,250,80397,80394,80686,80689,31101,75,80274,},
			},
		[2] = {
			Num = 3,
			GoodsList = {39501,39502,39503,39510,39513,31017,31018,31019,9507,11026,11027,11028,11029,11034,11035,11036,11037,11046,11047,11042,11043,11045,80387,},
			},
		[3] = {
			{80498,20,23},
			{80696,10,13},
			{80697,1,2},
			},
		},
	[4] = {
		[1] = {
			Num = 12,
			GoodsList = {80384,80382,76,40004,40014,40024,40094,80697,80196,250,80397,80394,80686,80689,31101,75,80274,},
			},
		[2] = {
			Num = 3,
			GoodsList = {39501,39502,39503,39510,39513,31017,31018,31019,9507,11026,11027,11028,11029,11034,11035,11036,11037,11046,11047,11042,11043,11045,80387,},
			},
		[3] = {
			{80498,20,23},
			{80696,10,13},
			{80697,1,2},
			},
		},
}

LC_ChristmasZhuanPan_JiangLiXianShiTab = {
	[1] = {
		[	80383	]=1,
		[	80381	]=1,
		[	80397	]=1,
		[	80394	]=1,
		[	40003	]=1,
		[	40013	]=1,
		[	40023	]=1,
		[	40093	]=1,
		[	31015	]=1,
		[	31016	]=1,
		[	76	]=1,
		[	80686	]=1,
		[	80689	]=1,
		[	31101	]=1,
		[	75	]=1,
		[	80195	]=1,
		[	80697	]=1,
		[	80274	]=1,
		},
	[2] = {
		[	80384	]=1,
		[	80382	]=1,
		[	76	]=1,
		[	40004	]=1,
		[	40014	]=1,
		[	40024	]=1,
		[	40094	]=1,
		[	80697	]=1,
		[	80196	]=1,
		[	250	]=1,
		[	80397	]=1,
		[	80394	]=1,
		[	80686	]=1,
		[	80689	]=1,
		[	31101	]=1,
		[	75	]=1,
		[	80274	]=1,
		},
	[3] = {
		[	80384	]=1,
		[	80382	]=1,
		[	76	]=1,
		[	40004	]=1,
		[	40014	]=1,
		[	40024	]=1,
		[	40094	]=1,
		[	80697	]=1,
		[	80196	]=1,
		[	250	]=1,
		[	80397	]=1,
		[	80394	]=1,
		[	80686	]=1,
		[	80689	]=1,
		[	31101	]=1,
		[	75	]=1,
		[	80274	]=1,
		},
	[4] = {
		[	80384	]=1,
		[	80382	]=1,
		[	76	]=1,
		[	40004	]=1,
		[	40014	]=1,
		[	40024	]=1,
		[	40094	]=1,
		[	80697	]=1,
		[	80196	]=1,
		[	250	]=1,
		[	80397	]=1,
		[	80394	]=1,
		[	80686	]=1,
		[	80689	]=1,
		[	31101	]=1,
		[	75	]=1,
		[	80274	]=1,
		},
}

function LC_Christmas_ZhuanPan()
	local ActorID = ActorID or API_RequestGetActorID()
--	local GoodsID = GoodsID or API_RequestGetNumber(2)
	local JiFen = API_VarDataGetNumber(ActorID,1,19038)
	if JiFen < 30 then
		return
	end
--	if API_ActorGetGoodsNum(ActorID,82019) < 5 then
--		return
--	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local PlayName = API_GetActorName(ActorID)
	local JiangLiGoodsID = API_VarDataGetNumber(ActorID,1,30233)
	local JiangLiGoodsNumWZ = API_VarDataGetNumber(ActorID,1,30234)
	local JiangLiGoodsNum =  math.floor(JiangLiGoodsNumWZ/100)
	local Band = API_VarDataGetNumber(ActorID,1,30235)
	if JiangLiGoodsID > 0 and JiangLiGoodsNum > 0 then
		API_VarDataSetNumber(ActorID,1,30233,0)
		API_VarDataSetNumber(ActorID,1,30234,0)
		API_VarDataSetNumber(ActorID,1,30235,0)
		local GoodsName = API_GetGoodsName(JiangLiGoodsID)
		local PD = 0
		for j,v in baoshiwupinbiao do
			if JiangLiGoodsID == v then
				PD = 1
				break
			end
		end
		if PD == 1 then
			fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,1)
		else
			if Band == 1 then
				if API_ActorCanAddGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,1,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,JiangLiGoodsID,JiangLiGoodsNum,1,'圣诞转盘兑换奖励')
					API_ActorSendMsg(ActorID,10,'圣诞转盘获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'')
				else
					API_SendActorMailByName(PlayName,JiangLiGoodsID,JiangLiGoodsNum,1,'[圣诞转盘]奖励','获得'..JiangLiGoodsNum..'个'..GoodsName..'')
					API_ActorSendMsg(ActorID,10,'圣诞转盘获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'（请到邮箱领取）')
				end
			else
				if API_ActorCanAddGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,0,0) ~= -1 then
					API_AddActorGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,'圣诞转盘兑换奖励')
					API_ActorSendMsg(ActorID,10,'圣诞转盘获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'')
				else
					API_SendActorMail(ActorID,JiangLiGoodsID,JiangLiGoodsNum,'[圣诞转盘]奖励','获得'..JiangLiGoodsNum..'个'..GoodsName..'')
					API_ActorSendMsg(ActorID,10,'圣诞转盘获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'（请到邮箱领取）')
				end
			end
		end
	end
	local JiangLiQuYu = 1
	local XianShiQuYu = 1
	local JYDHQ = math.random(3,5)
	local PlayLv = API_GetActorExpLevel(ActorID)
	if PlayLv > 55 then
		JiangLiQuYu = 2
		JYDHQ = math.random(3,5)
		XianShiQuYu = 2
	elseif PlayLv > 40 then
		JiangLiQuYu = 2
		JYDHQ = math.random(3,5)
		XianShiQuYu = 2
	elseif PlayLv > 25 then
		JiangLiQuYu = 2
		JYDHQ = math.random(3,5)
		XianShiQuYu = 2
	end
	local JiangLiTable = GLOBAL_Christmas_GoodsTable[JiangLiQuYu]
	local JiangLiGaiLv = math.random(10000000)
	local JiangLiGoodsID,JiangLiGoodsNum = 0,0
	for j in JiangLiTable do
		local GaiLv1 = JiangLiTable[j].GaiLv1
		local GaiLv2 = JiangLiTable[j].GaiLv2
		if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
			JiangLiGoodsID = JiangLiTable[j].GoodsID
			local NumGaiLv = JiangLiTable[j].NumGaiLv
			local NumMax = JiangLiTable[j].NumMax
			local NumMin = JiangLiTable[j].NumMin
			--local BD = JiangLiTable[j].Band
			local BD = 0
			local NumRandom = math.random(10000)
			if NumRandom <= NumGaiLv then
				JiangLiGoodsNum = NumMax
			else
				JiangLiGoodsNum = NumMin
			end
			if JiangLiGoodsNum > 0 then
				if Christmas_MaxGoodsNumTable[JiangLiGoodsID] ~= nil then
					local Num = Christmas_MaxGoodsNumTable[JiangLiGoodsID].Num
					local MaxNum = Christmas_MaxGoodsNumTable[JiangLiGoodsID].MaxNum
					--if Num < MaxNum and API_GetGameOnlineNum() >= 2000 and ((Hour >= 15 and Hour <= 17) or (Hour >= 20 and Hour <= 22)) then
					if Num < MaxNum then
						Num = Num + JiangLiGoodsNum
						Christmas_MaxGoodsNumTable[JiangLiGoodsID].Num = Num 
						local GoodsNumWZ = JiangLiGoodsNum * 100
						API_VarDataSetNumber(ActorID,1,30233,JiangLiGoodsID)
						API_VarDataSetNumber(ActorID,1,30234,GoodsNumWZ)
						API_VarDataSetNumber(ActorID,1,30235,0)
					else
						JiangLiGoodsID = 80697
						JiangLiGoodsNum = JYDHQ
						local GoodsNumWZ = JiangLiGoodsNum * 100
						API_VarDataSetNumber(ActorID,1,30233,JiangLiGoodsID)
						API_VarDataSetNumber(ActorID,1,30234,GoodsNumWZ)
						API_VarDataSetNumber(ActorID,1,30235,0)
					end
				else
					local GoodsNumWZ = JiangLiGoodsNum * 100
					API_VarDataSetNumber(ActorID,1,30233,JiangLiGoodsID)
					API_VarDataSetNumber(ActorID,1,30234,GoodsNumWZ)
					API_VarDataSetNumber(ActorID,1,30235,0)
				end
			else
				JiangLiGoodsID = 80697
				JiangLiGoodsNum = JYDHQ
				local GoodsNumWZ = JiangLiGoodsNum * 100
				API_VarDataSetNumber(ActorID,1,30233,JiangLiGoodsID)
				API_VarDataSetNumber(ActorID,1,30234,GoodsNumWZ)
				API_VarDataSetNumber(ActorID,1,30235,0)
			end
		end
	end
	
	local XianShiTab = LC_ChristmasZhuanPan_XianShiTab[XianShiQuYu]
	local JiangLiXianShiTab = LC_ChristmasZhuanPan_JiangLiXianShiTab[XianShiQuYu]
	local XianShiNum1 = XianShiTab[1].Num
	local XianShiList1 = XianShiTab[1].GoodsList
	local XianShiNum2 = XianShiTab[2].Num
	local XianShiList2 = {}
	if JiangLiXianShiTab[JiangLiGoodsID] ~= nil then
		XianShiList2 = XianShiTab[3]
	else
		XianShiList2 = XianShiTab[2].GoodsList
	end
	
	local PeerageLevel = API_GetActorPeerageLevel(ActorID)
	local TigerID = 1* 10000 + PeerageLevel * 100 
	API_VarDataSetNumber(ActorID,1,18261,TigerID)
	local RandomIconTigerList = {}
	
	while XianShiNum1 > 0 do
		local XuHao = table.getn(RandomIconTigerList) + 1
		local DJGoodsID = XianShiList1[math.random(table.getn(XianShiList1))]
		local DJGoodsNum = math.random(1,3)
		if DJGoodsID == 80498 or DJGoodsID == 80696 then
			DJGoodsNum = math.random(100,160)
		end
		if RandomIconTigerList[XuHao] == nil then
			RandomIconTigerList[XuHao] = {}
		end
		RandomIconTigerList[XuHao].GoodsID = DJGoodsID
		RandomIconTigerList[XuHao].GoodsNum = DJGoodsNum
		XianShiNum1 = XianShiNum1 - 1
	end
	while XianShiNum2 > 0 do
		local XuHao = table.getn(RandomIconTigerList) + 1
		local DJGoodsID,DJGoodsNum = 80697,144
		if JiangLiXianShiTab[JiangLiGoodsID] ~= nil then
			DJGoodsID = XianShiList2[XianShiNum2][1]
			DJGoodsNum = math.random(XianShiList2[XianShiNum2][2],XianShiList2[XianShiNum2][3])
		else
			DJGoodsID = XianShiList2[math.random(table.getn(XianShiList2))]
			DJGoodsNum = 1
		end
		if RandomIconTigerList[XuHao] == nil then
			RandomIconTigerList[XuHao] = {}
		end
		RandomIconTigerList[XuHao].GoodsID = DJGoodsID
		RandomIconTigerList[XuHao].GoodsNum = DJGoodsNum
		XianShiNum2 = XianShiNum2 - 1
	end
	
	local JiangLiXuHao = table.getn(RandomIconTigerList) + 1
	if RandomIconTigerList[JiangLiXuHao] == nil then
		RandomIconTigerList[JiangLiXuHao] = {}
	end
	RandomIconTigerList[JiangLiXuHao].GoodsID = JiangLiGoodsID
	RandomIconTigerList[JiangLiXuHao].GoodsNum = JiangLiGoodsNum
	local ZhenIconTigerList = {}
	while table.getn(RandomIconTigerList) > 0 do
		local XuHao = table.getn(ZhenIconTigerList) + 1
		local RandomXuHao = math.random(table.getn(RandomIconTigerList))
		if ZhenIconTigerList[XuHao] == nil then
			ZhenIconTigerList[XuHao] = {}
		end
		ZhenIconTigerList[XuHao].GoodsID = RandomIconTigerList[RandomXuHao].GoodsID
		ZhenIconTigerList[XuHao].GoodsNum = RandomIconTigerList[RandomXuHao].GoodsNum
		table.remove(RandomIconTigerList,RandomXuHao)
	end
	GLOBAL_CycTask_ActorIconTigerList[ActorID] = ZhenIconTigerList
	local XianShiIconTigerList = {}
	for i = 1,table.getn(ZhenIconTigerList) do
		local XuHao = table.getn(XianShiIconTigerList) + 1
		if XianShiIconTigerList[XuHao] == nil then
			XianShiIconTigerList[XuHao] = {}
		end
		XianShiIconTigerList[XuHao] = ZhenIconTigerList[i].GoodsID
		XianShiIconTigerList[XuHao + 1] = ZhenIconTigerList[i].GoodsNum
	end
	local WeiZhi = 1
	for i = 1,table.getn(GLOBAL_CycTask_ActorIconTigerList[ActorID]) do
		local GoodsID = GLOBAL_CycTask_ActorIconTigerList[ActorID][i].GoodsID 
		local GoodsNum = GLOBAL_CycTask_ActorIconTigerList[ActorID][i].GoodsNum
		if GoodsID == JiangLiGoodsID and  GoodsNum == JiangLiGoodsNum then
			WeiZhi = i
			break
		end
	end
--	if API_ActorRemoveGoods(ActorID,82019,5,'删除5个'..API_GetGoodsName(82019)..'兑换奖励') then
		local JiFen = API_VarDataGetNumber(ActorID,1,19038)
		if JiFen >= 30 then
			JiFen = JiFen - 30
			API_VarDataSetNumber(ActorID,1,19038,JiFen)
			API_ActorSendMsg(ActorID,8,'扣除30圣诞积分转动一次圣诞转盘。')
			local JiangLiGoodsNumWZ = API_VarDataGetNumber(ActorID,1,30234)
			API_VarDataSetNumber(ActorID,1,30234,JiangLiGoodsNumWZ+WeiZhi)
			API_OpenIconTiger(ActorID,TigerID,WeiZhi,'奖励','LC_Christmas_IconTigerAgainFunc','LC_Christmas_IconTigerPickFunc',16,XianShiIconTigerList)
		end
--	end
end

function LC_Christmas_IconTigerAgainFunc()
	local ActorID = API_RequestGetActorID()
	API_ActorSendMsg(ActorID,10,'暂不开放“再来一次”功能')
	return
end

function LC_Christmas_IconTigerPickFunc()
	local ActorID = API_RequestGetActorID()
	local PlayName = API_GetActorName(ActorID)
	local JiangLiGoodsID = API_VarDataGetNumber(ActorID,1,30233)
	local JiangLiGoodsNumWZ = API_VarDataGetNumber(ActorID,1,30234)
	local JiangLiGoodsNum =  math.floor(JiangLiGoodsNumWZ/100)
	local WeiZhi = math.mod(JiangLiGoodsNumWZ,100)
	local Band = API_VarDataGetNumber(ActorID,1,30235)
	if GLOBAL_CycTask_ActorIconTigerList[ActorID] ~= nil then
		if GLOBAL_CycTask_ActorIconTigerList[ActorID][WeiZhi].GoodsID == JiangLiGoodsID and GLOBAL_CycTask_ActorIconTigerList[ActorID][WeiZhi].GoodsNum == JiangLiGoodsNum then
			API_VarDataSetNumber(ActorID,1,30233,0)
			API_VarDataSetNumber(ActorID,1,30234,0)
			API_VarDataSetNumber(ActorID,1,30235,0)
			local GoodsName = API_GetGoodsName(JiangLiGoodsID)
			local PD = 0
			for j,v in baoshiwupinbiao do
				if JiangLiGoodsID == v then
					PD = 1
					break
				end
			end
			if PD == 1 then
				fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,1)
			else
				if Band == 1 then
					if API_ActorCanAddGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,1,0) ~= -1 then
						API_AddActorGoodsFlag(ActorID,JiangLiGoodsID,JiangLiGoodsNum,1,'圣诞转盘兑换奖励')
						API_ActorSendMsg(ActorID,10,'圣诞转盘获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'')
					else
						API_SendActorMailByName(PlayName,JiangLiGoodsID,JiangLiGoodsNum,1,'[圣诞转盘]奖励','获得'..JiangLiGoodsNum..'个'..GoodsName..'')
						API_ActorSendMsg(ActorID,10,'圣诞转盘获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'（请到邮箱领取）')
					end
				else
					if API_ActorCanAddGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,0,0) ~= -1 then
						API_AddActorGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,'圣诞转盘兑换奖励')
						API_ActorSendMsg(ActorID,10,'圣诞转盘获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'')
					else
						API_SendActorMail(ActorID,JiangLiGoodsID,JiangLiGoodsNum,'[圣诞转盘]奖励','获得'..JiangLiGoodsNum..'个'..GoodsName..'')
						API_ActorSendMsg(ActorID,10,'圣诞转盘获得奖励：'..JiangLiGoodsNum..'个'..GoodsName..'（请到邮箱领取）')
					end
				end
			end
			GLOBAL_CycTask_ActorIconTigerList[ActorID] = nil
		end
	end
end

local BingHanJiFenTable = {
	{JiFen=10,GaiLv1=1,GaiLv2=38000},
	{JiFen=11,GaiLv1=38001,GaiLv2=125001},
	{JiFen=12,GaiLv1=125002,GaiLv2=305002},
	{JiFen=13,GaiLv1=305003,GaiLv2=637003},
	{JiFen=14,GaiLv1=637004,GaiLv2=1184004},
	{JiFen=15,GaiLv1=1184005,GaiLv2=1991005},
	{JiFen=16,GaiLv1=1991006,GaiLv2=3056006},
	{JiFen=17,GaiLv1=3056007,GaiLv2=4314007},
	{JiFen=18,GaiLv1=4314008,GaiLv2=5688008},
	{JiFen=19,GaiLv1=5688009,GaiLv2=6946009},
	{JiFen=20,GaiLv1=6946010,GaiLv2=8011010},
	{JiFen=21,GaiLv1=8011011,GaiLv2=8818011},
	{JiFen=22,GaiLv1=8818012,GaiLv2=9365012},
	{JiFen=23,GaiLv1=9365013,GaiLv2=9697013},
	{JiFen=24,GaiLv1=9697014,GaiLv2=9877014},
	{JiFen=25,GaiLv1=9877015,GaiLv2=9964015},
	{JiFen=26,GaiLv1=9964016,GaiLv2=10000000},
}

function BingHanJiFenBoxUse(ActorID,GoodsID)
	if API_ActorGetGoodsNum(ActorID,89000) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local StartTimeTable = ChristmasParty_StartTime
	local EndTimeTable = ChristmasParty_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart > 0 then
		API_ActorSendMsg(ActorID,3,'圣诞活动未开始，请在活动开始后使用该道具。')
		return 0
	elseif nShiFouStart <= 0 and nShiFouEnd > 0 then
		local JiangLiGaiLv = math.random(10000000)
		for j in BingHanJiFenTable do
			local GaiLv1 = BingHanJiFenTable[j].GaiLv1
			local GaiLv2 = BingHanJiFenTable[j].GaiLv2
			if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
				if API_ActorGetGoodsNum(ActorID,89000) > 0 and API_ActorRemoveGoods(ActorID,89000,1,'消耗积分彩票') then
					local JiFen = BingHanJiFenTable[j].JiFen
					local ZhiQianJiFen = API_VarDataGetNumber(ActorID,1,19038)
					ZhiQianJiFen = ZhiQianJiFen + JiFen
					API_VarDataSetNumber(ActorID,1,19038,ZhiQianJiFen)
					API_ResponseWrite('<name>冰寒幸运卷</name>')
					API_ResponseWrite('<text>    打开冰寒幸运卷获得：</text><text color="255,0,255">'..JiFen..'冰寒积分。</text><br><br>')
					API_ResponseWrite('<text>    您当前的冰寒积分为：</text><text color="255,0,255">'..ZhiQianJiFen..'</text><br>')
					API_ResponseWrite('<br><a>关闭</a><br>')
					API_ResponseFlush(ActorID)
					return 1
				else
					API_ActorSendMsg(ActorID,3,'扣除道具失败')
					return 0
				end
			end
		end
	elseif nShiFouEnd <= 0 then
		if API_ActorGetGoodsNum(ActorID,89000) > 0 and API_ActorRemoveGoods(ActorID,89000,1,'消耗积分彩票') then
			API_ActorAddMoney(ActorID,10000,0,'使用冰寒幸运券')
			API_ResponseWrite('<name>冰寒幸运卷</name>')
			API_ResponseWrite('<text>    圣诞活动已结束，使用冰寒幸运券返还10000金币。</text><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
			API_ResponseFlush(ActorID)
			return 1
		end
	end
end

function ChristmasLiPingbBoxUse(ActorID,GoodsID)
	if API_ActorGetGoodsNum(ActorID,89030) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local JiangLiQuYu = 1
	local PlayLv = API_GetActorExpLevel(ActorID)
	if PlayLv > 55 then
		JiangLiQuYu = 4
	elseif PlayLv > 40 then
		JiangLiQuYu = 3
	elseif PlayLv > 25 then
		JiangLiQuYu = 2
	end
	local JiangLiTable = GLOBAL_Christmas_GoodsTable[JiangLiQuYu]
	local JiangLiGaiLv = math.random(10000000)
	for j in JiangLiTable do
		local GaiLv1 = JiangLiTable[j].GaiLv1
		local GaiLv2 = JiangLiTable[j].GaiLv2
		if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
			if API_ActorGetGoodsNum(ActorID,89030) > 0 and API_ActorRemoveGoods(ActorID,89030,1,'删除宝箱') then
--				API_ResponseWrite('<name>积分彩票</name>')
--				API_ResponseWrite('<text>    刮开积分彩票获得：</text><text color="255,0,255">'..JiFen..'冰寒积分。</text><br>')
--				API_ResponseWrite('<br><a>关闭</a><br>')
--				API_ResponseFlush(ActorID)
				local JiangLiGoodsID = JiangLiTable[j].GoodsID
				if API_ActorCanAddGoods(ActorID,JiangLiGoodsID,1,3,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,JiangLiGoodsID,1,0,'')
					API_ActorSendMsg(ActorID,8,'获得1个'..API_GetGoodsName(JiangLiGoodsID)..'')
				else
					local GoodsName = API_GetGoodsName(JiangLiGoodsID)
					API_SendActorMailByName(API_GetActorName(ActorID),JiangLiGoodsID,1,0,'中秋活动','')
					API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'1个（请到邮箱领取）')
				end
				return 1	
			else
				API_ActorSendMsg(ActorID,3,'扣除道具失败')
				return 0			
			end
		end
	end
end
