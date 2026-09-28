--点券购买水晶币

TML_CSSJBSR_ShuiJinBiID = 80289 --水晶币ID
TML_CSSJBSR_DianQuan = 25 --5000水晶币需要消耗的点券数量
TML_CSSJBSR_YiCiGouMaiSJB = 5000
TML_CSSJBSR_GBMinute = 50 --开始广播的分钟
TML_CSSJBSR_LV = 21 --等级限制
TML_CSSJBSR_Num = 200000 --重新进货
if CSSJBSR_ZongNum == nil then
	CSSJBSR_ZongNum = 200000 --服务器启动时库存
end


--刷新时间
TML_CSSJBSR_Time1 = 13
TML_CSSJBSR_Time2 = 16
TML_CSSJBSR_Time3 = 19

local OwnerID = -4001 --全局交互数据
if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 0 then
	API_VarDataLoad_Ex(1,0,OwnerID)
end

--创建时间触发器
if API_GetServerID() == 1 or API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 6 or API_GetServerID() == 7 or API_GetServerID() == 8 or API_GetServerID() == 9 or API_GetServerID() == 10 then
	if CSSJBSR_CFQ ~= nil then
		API_DestroyTriggerG(CSSJBSR_CFQ)
	end
	CSSJBSR_CFQ = API_CreateTimerTriggerG(0,0,60,-1,'CSSJBSR_TimerTriggerGCallFunc')
end

function CSSJBSR_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local OpenTian,OpenMiao = PublicFun_GetServerOpenDay()
	if OpenTian > 3 then
		if (Hour == TML_CSSJBSR_Time1 - 1 and Minute == TML_CSSJBSR_GBMinute) or (Hour == TML_CSSJBSR_Time2 - 1 and Minute == TML_CSSJBSR_GBMinute) or (Hour == TML_CSSJBSR_Time3 - 1 and Minute == TML_CSSJBSR_GBMinute) then
			if API_GetServerID() == 1 then
				if not API_IsBattleGameServer() then
					API_ActorBDCMsg(-1,1,-1,24,85,0,17,'出售水晶币商人已经派人购进水晶币，10分钟后将刷新库存')
					API_ActorBDCMsg(-1,1,-1,24,85,0,1,'出售水晶币商人已经派人购进水晶币，10分钟后将刷新库存')
					API_ActorBDCMsg(-1,1,-1,24,85,0,7,'出售水晶币商人已经派人购进水晶币，10分钟后将刷新库存')
				end
			end
		end
	end
	--设置上限
	if CSSJBSR_KuChunShangXianIsOK == nil then
		if GLOBAL_GameOnlineNum_OnLoadIDataOK == 1 then
			local Hour = 20
			local GameOnlineNum = API_VarDataGetNumber_Ex(1,0,-102,1,Hour)
			if GameOnlineNum < 400 then
				CSSJBSR_ZongNum = TML_CSSJBSR_Num
			else
				CSSJBSR_ZongNum = math.floor(GameOnlineNum/200) * TML_CSSJBSR_Num
			end
		end
		local NowTime = os.time()
		CSSJBSR_KuChunShangXianIsOK = NowTime
	else
		local time = os.date("*t",CSSJBSR_KuChunShangXianIsOK)
		local Nowtime = os.date("*t")
		if time.year ~= Nowtime.year or time.month ~= Nowtime.month or time.day ~= Nowtime.day then
			if GLOBAL_GameOnlineNum_OnLoadIDataOK == 1 then
				local Hour = 20
				local GameOnlineNum = API_VarDataGetNumber_Ex(1,0,-102,1,Hour)
				if GameOnlineNum < 400 then
					CSSJBSR_ZongNum = TML_CSSJBSR_Num
				else
					CSSJBSR_ZongNum = math.floor(GameOnlineNum/200) * TML_CSSJBSR_Num
				end
			end
			local NowTime = os.time()
			CSSJBSR_KuChunShangXianIsOK = NowTime
		end
	end
	--根据时间区间设置当前值
	if Hour >= TML_CSSJBSR_Time1 and Hour < TML_CSSJBSR_Time2 then
		if CSSJBSR_KuChunTime1IsOK == nil then
			local KeyID = 1
			API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,KeyID,CSSJBSR_ZongNum)
			local NowTime = os.time()
			CSSJBSR_KuChunTime1IsOK = NowTime
			if OpenTian > 3 then
				if API_GetServerID() == 1 then
					if not API_IsBattleGameServer() then
						API_ActorBDCMsg(-1,1,-1,24,85,0,17,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
						API_ActorBDCMsg(-1,1,-1,24,85,0,1,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
						API_ActorBDCMsg(-1,1,-1,24,85,0,7,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
					end
				end
			end
		else
			local time = os.date("*t",CSSJBSR_KuChunTime1IsOK)
			local Nowtime = os.date("*t")
			if time.year ~= Nowtime.year or time.month ~= Nowtime.month or time.day ~= Nowtime.day then
				local KeyID = 1
				API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,KeyID,CSSJBSR_ZongNum)
				local NowTime = os.time()
				CSSJBSR_KuChunTime1IsOK = NowTime
				if OpenTian > 3 then
					if API_GetServerID() == 1 then
						if not API_IsBattleGameServer() then
							API_ActorBDCMsg(-1,1,-1,24,85,0,17,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
							API_ActorBDCMsg(-1,1,-1,24,85,0,1,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
							API_ActorBDCMsg(-1,1,-1,24,85,0,7,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
						end
					end
				end
			end
		end
	elseif Hour >= TML_CSSJBSR_Time2 and Hour < TML_CSSJBSR_Time3 then
		if CSSJBSR_KuChunTime2IsOK == nil then
			local KeyID = 1
			API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,KeyID,CSSJBSR_ZongNum)
			local NowTime = os.time()
			CSSJBSR_KuChunTime2IsOK = NowTime
			if OpenTian > 3 then
				if API_GetServerID() == 1 then
					if not API_IsBattleGameServer() then
						API_ActorBDCMsg(-1,1,-1,24,85,0,17,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
						API_ActorBDCMsg(-1,1,-1,24,85,0,1,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
						API_ActorBDCMsg(-1,1,-1,24,85,0,7,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
					end
				end
			end
		else
			local time = os.date("*t",CSSJBSR_KuChunTime2IsOK)
			local Nowtime = os.date("*t")
			if time.year ~= Nowtime.year or time.month ~= Nowtime.month or time.day ~= Nowtime.day then
				local KeyID = 1
				API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,KeyID,CSSJBSR_ZongNum)
				local NowTime = os.time()
				CSSJBSR_KuChunTime2IsOK = NowTime
				if OpenTian > 3 then
					if API_GetServerID() == 1 then
						if not API_IsBattleGameServer() then
							API_ActorBDCMsg(-1,1,-1,24,85,0,17,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
							API_ActorBDCMsg(-1,1,-1,24,85,0,1,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
							API_ActorBDCMsg(-1,1,-1,24,85,0,7,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
						end
					end
				end
			end
		end
	elseif Hour >= TML_CSSJBSR_Time3 then
		if CSSJBSR_KuChunTime3IsOK == nil then
			local KeyID = 1
			API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,KeyID,CSSJBSR_ZongNum)
			local NowTime = os.time()
			CSSJBSR_KuChunTime3IsOK = NowTime
			if OpenTian > 3 then
				if API_GetServerID() == 1 then
					if not API_IsBattleGameServer() then
						API_ActorBDCMsg(-1,1,-1,24,85,0,17,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
						API_ActorBDCMsg(-1,1,-1,24,85,0,1,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
						API_ActorBDCMsg(-1,1,-1,24,85,0,7,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
					end
				end
			end
		else
			local time = os.date("*t",CSSJBSR_KuChunTime3IsOK)
			local Nowtime = os.date("*t")
			if time.year ~= Nowtime.year or time.month ~= Nowtime.month or time.day ~= Nowtime.day then
				local KeyID = 1
				API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,KeyID,CSSJBSR_ZongNum)
				local NowTime = os.time()
				CSSJBSR_KuChunTime3IsOK = NowTime
				if OpenTian > 3 then
					if API_GetServerID() == 1 then
						if not API_IsBattleGameServer() then
							API_ActorBDCMsg(-1,1,-1,24,85,0,17,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
							API_ActorBDCMsg(-1,1,-1,24,85,0,1,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
							API_ActorBDCMsg(-1,1,-1,24,85,0,7,'出售水晶币商人已经进货了水晶币，每'..TML_CSSJBSR_DianQuan..'点券可以购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
						end
					end
				end
			end
		end
	end
end


function CSSJBSR_DianQuanGouMai_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local ActorSJBNum = API_ActorGetPropNum(ActorID,208)
	local LV = API_GetActorExpLevel(ActorID)
	local KuChun,KeyID = 0,1
	if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 1 then
		KuChun = API_VarDataGetNumber_Ex(1,0,OwnerID,1,KeyID)
	end
	if SelectItem ~= 1 then
		if LV >= TML_CSSJBSR_LV then
			API_ResponseWrite('<text>你可以用点券直接在我这里购买水晶币，每次购买</text><text color="255,0,255">'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币</text><text>都需要消耗</text><text color="255,0,255">'..TML_CSSJBSR_DianQuan..'点券</text><br>')
			API_ResponseWrite('<text>水晶币卖完后我会在每天的</text><text color="255,0,255">13:00，16:00和19:00</text><text>补充库存，请耐心等候。</text><br><br>')
			API_ResponseWrite('<text color="255,0,255">剩余库存：'..KuChun..'/'..CSSJBSR_ZongNum..'水晶币</text><br><br>')
			API_ResponseWrite('<br><br><a href="CSSJBSR_DianQuanGouMai_Title?1=1">购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币</a><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
		else
			API_ResponseWrite('<text>本功能只提供给'..TML_CSSJBSR_LV..'级以上的玩家使用。</text><br><br>')
			API_ResponseWrite('<a>确定</a>')
		end
	elseif SelectItem == 1 then
		if KuChun >= 5000 then
			if ActorSJBNum < 100000000 then
				if API_ActorGetPropNum(ActorID,183) >= TML_CSSJBSR_DianQuan then
					if API_UsePoint(ActorID,3,TML_CSSJBSR_ShuiJinBiID,TML_CSSJBSR_YiCiGouMaiSJB,TML_CSSJBSR_DianQuan) == 0 then
						API_ActorShoppingM_Add(ActorID,TML_CSSJBSR_YiCiGouMaiSJB,0,'用点券购买水晶币')
						KuChun = KuChun - TML_CSSJBSR_YiCiGouMaiSJB
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,KeyID,KuChun)
						API_ResponseWrite('<img srcgd="'..TML_CSSJBSR_ShuiJinBiID..'" tipgd="'..TML_CSSJBSR_ShuiJinBiID..'" ><text>  × '..TML_CSSJBSR_YiCiGouMaiSJB..'</text><br>')
						API_ResponseWrite('<br><text>你花费</text><text color="255,0,255">'..TML_CSSJBSR_DianQuan..'点券</text><text>购买了</text><text color="255,0,255">'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币</text><text>。</text><br>')
						API_ResponseWrite('<br><text color="255,0,255">剩余库存：'..KuChun..'/'..CSSJBSR_ZongNum..'水晶币</text><br>')
						API_ResponseWrite('<br><br><a href="CSSJBSR_DianQuanGouMai_Title?1=1">继续购买'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币</a><br>')
						API_ResponseWrite('<br><a>关闭</a>')
						API_ActorSendMsg(ActorID,3,'花费'..TML_CSSJBSR_DianQuan..'点券购买了'..TML_CSSJBSR_YiCiGouMaiSJB..'水晶币')
						--风向标
						if GLOBAL_FengXiangBiao_DateList[25][1] ~= nil then
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[25][1][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[25][1][LaiYuan] = TML_CSSJBSR_YiCiGouMaiSJB
							else
								GLOBAL_FengXiangBiao_DateList[25][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[25][1][LaiYuan] + TML_CSSJBSR_YiCiGouMaiSJB
							end
						end
					end
				else
					API_ResponseWrite('<text>你的点券数量不足,无法购买。</text><br><br>')
					API_ResponseWrite('<a>确定</a>')
				end
			else
				API_ResponseWrite('<text>你身上的水晶币数量已达上限，无法购买。</text><br><br>')
				API_ResponseWrite('<a>确定</a>')
			end
		else
			API_ResponseWrite('<text>库存不足，无法购买。我会在每天的</text><text color="255,0,255">13:00，16:00和19:00</text><text>补足货物，请关注系统广播通知。</text><br><br>')
			API_ResponseWrite('<a>确定</a>')
		end
	end
end
