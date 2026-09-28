----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\SpringFestival.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2009-1-4
--版  本:	1.0
--描  述:	春节活动
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：万钰林
--日期：2009-1-4
--功能：创建
---------------------------------------------------------------------
-- 19019 存储玩家领取红包的年月日
-- 19020 存储玩家是否领取红包
-- 19021 存储玩家打开财神宝箱的年月日
-- 19022 存储玩家打开了几次财神宝箱
-- 19023 存储玩家召唤了几次大年兽
-- 19024 存储玩家召唤大年兽的年月日
-- 19025 存储玩家打开礼物盒子的次数，大中小，百十个
-- 19026 存储玩家打开礼物盒子的年月日
-- 19027 存储玩家上线年月日 风向标用
-- 19028 临时交互数据，召唤大年兽CD

SpringFestival_StartTime = {Year = 2009,Month = 1,Day = 25,Hour = 0,Minute = 0,Second = 0} --活动开始时间
SpringFestival_EndTime = {Year = 2009,Month = 2,Day = 1,Hour = 0,Minute = 0,Second = 0} --活动结束时间

local SpringFestival_NPCTskID = 1452 --购买物品时使用的任务ID
local SummonsNum = 3 --召唤大年兽次数
local OpenBoxNum = 5 --免点券打开财神宝箱次数
local ChouJiangNeedNum = 2 --抽奖时消耗角的数量

--活动地图和大小年兽ID表
SpringFestival_ACTMapTable = {
				[1956] = {XiaoNianShou=726064,DaNianShou=726070,CaiShenBaoXiang=854},
				[1957] = {XiaoNianShou=726066,DaNianShou=726071,CaiShenBaoXiang=855},
				[1959] = {XiaoNianShou=726068,DaNianShou=726072,CaiShenBaoXiang=856},
				} 

--主城地图ID
SpringFestival_ZhuChengMapTable = {1,2,21,40,41,62,63,64,65,66,67,68,69,72,73,75,76,77,78,79,80,81,82}
--不可召唤大年兽的地图ID
SpringFestival_NotZhaoHuanMapTable = {11,12,13,14,17,18,19,20,26,27,28,32,33,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,70,71,83,84,85,86,91,92,96,97}

if SpringFestival_MapMonsterTable == nil then --存每个地图的小年兽
	SpringFestival_MapMonsterTable = {}
end

--建春节活动NPC
--[[if not API_IsEctypeServer() then
	LBSpringFestivalNPC = LBSpringFestivalNPC or API_CreateMonster(2,11772,241,166,5,0,-1)
	DGSpringFestivalNPC = DGSpringFestivalNPC or API_CreateMonster(1,11771,208,209,5,0,-1)
	--三个礼盒NPC，帝国和联邦共六个
	DGBaoZhu = DGBaoZhu or API_CreateMonster(1,11773,239,322,5,0,-1) 
	DGDaHeZi = DGDaHeZi or API_CreateMonster(1,11774,240,320,5,0,-1) 
	DGXiaoHeZi = DGXiaoHeZi or API_CreateMonster(1,11775,241,321,5,0,-1) 
	LBBaoZhu = LBBaoZhu or API_CreateMonster(2,11773,241,170,5,0,-1) 
	LBDaHeZi = LBDaHeZi or API_CreateMonster(2,11774,242,168,5,0,-1) 
	LBXiaoHeZi = LBXiaoHeZi or API_CreateMonster(2,11775,243,169,5,0,-1) 
end]]
--活动触发器
--SpringFestival_TimerTriggerID = SpringFestival_TimerTriggerID or API_CreateTimerTriggerG(0,0,60,-1,'SpringFestival_TimerTriggerGCallFunc')

function SpringFestival_TimerTriggerGCallFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		local ServerID = API_GetServerID()
		local JN1 = API_VarDataGetNumber_Ex(1,0,-1,1,1)
		local JN2 = API_VarDataGetNumber_Ex(1,0,-1,1,2)
		local JN3 = API_VarDataGetNumber_Ex(1,0,-1,1,4)
		if SpringFestival_MapMonsterTable[JN1] == nil then
			SpringFestival_MapMonsterTable[JN1] = {}
		end
		if SpringFestival_MapMonsterTable[JN2] == nil then
			SpringFestival_MapMonsterTable[JN2] = {}
		end
		if SpringFestival_MapMonsterTable[JN3] == nil then
			SpringFestival_MapMonsterTable[JN3] = {}
		end
		--除夕夜放大炮
		if Day == 25 and Hour == 23 then
			if math.mod(Minute,10) == 0 then
				API_ActorBroadcastMsgEx(-1,-1,0,17,'除夕时刻焰火盛宴将在23点59分在主城内开始，欢迎大家即时前往主城观赏！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'除夕时刻焰火盛宴将在23点59分在主城内开始，欢迎大家即时前往主城观赏！')
				API_ActorBroadcastMsgEx(-1,-1,0,7,'除夕时刻焰火盛宴将在23点59分在主城内开始，欢迎大家即时前往主城观赏！')
			end
		end
		if Day == 25 and Hour == 23 and Minute == 58 then
			SpringFestival_ChuXiYeFangPaoTimerTriggerGID = SpringFestival_ChuXiYeFangPaoTimerTriggerGID or API_CreateTimerTriggerG(1,2,1,-1,'SpringFestival_ChuXiYeFangPao_TimerTriggerCallFunc')
		end
		--财神宝箱
		if Hour == 11 or Hour == 12 then
			CJHD_CSCF = 0
			if math.mod(Minute,10) == 0 then
				API_ActorBroadcastMsgEx(-1,-1,0,17,'宝箱献礼活动将于13：00-16：00期间在机奴巢穴举行！欢迎大家参与！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'宝箱献礼活动将于13：00-16：00期间在机奴巢穴举行！欢迎大家参与！')
				API_ActorBroadcastMsgEx(-1,-1,0,7,'宝箱献礼活动将于13：00-16：00期间在机奴巢穴举行！欢迎大家参与！')
			end
		end
		if Hour >= 13 and Hour < 16 then
			if CJHD_CSCF == nil or CJHD_CSCF < 1 then
				CJHD_CSCF = 1
				API_ActorBroadcastMsgEx(-1,-1,0,17,'宝箱献礼活动现在开始！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'宝箱献礼活动现在开始！')
				API_ActorBroadcastMsgEx(-1,-1,0,7,'宝箱献礼活动现在开始！')
			end
			if math.mod(Minute,5) == 0 then
				API_ActorBroadcastMsgEx(-1,-1,0,17,'宝箱献礼活动正在各机奴巢穴热烈进行中，欢迎大家前往参与！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'宝箱献礼活动正在各机奴巢穴热烈进行中，欢迎大家前往参与！')
				API_ActorBroadcastMsgEx(-1,-1,0,7,'宝箱献礼活动正在各机奴巢穴热烈进行中，欢迎大家前往参与！')
			end
			if math.mod(Minute,20) == 0 then
				API_ActorBroadcastMsgEx(-1,-1,0,17,'财神已经在机奴巢穴内撒下大量“财神宝箱”，欢迎大家前往参与！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'财神已经在机奴巢穴内撒下大量“财神宝箱”，欢迎大家前往参与！')
				API_ActorBroadcastMsgEx(-1,-1,0,7,'财神已经在机奴巢穴内撒下大量“财神宝箱”，欢迎大家前往参与！')
				SpringFestival_CaiShenBaoXiang()
			end
		elseif Hour >= 16 then
			if CJHD_CSCF == nil or CJHD_CSCF < 2 then
				CJHD_CSCF = 2
				API_ActorBroadcastMsgEx(-1,-1,0,17,'今天的宝箱献礼活动已经结束！谢谢您的参与！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'今天的宝箱献礼活动已经结束！谢谢您的参与！')
				API_ActorBroadcastMsgEx(-1,-1,0,7,'今天的宝箱献礼活动已经结束！谢谢您的参与！')
			end
		end
		--刷大小年兽
		local TongZhiStartTime = API_DiffDatatime(Year,Month,Day,18,0,0)
		local TongZhiEndTime = API_DiffDatatime(Year,Month,Day,19,30,0)
		if TongZhiStartTime < 0 and TongZhiEndTime > 0 then
			CJHD_XXXX = 0 
			if math.mod(Minute,10) == 0 then
				API_ActorBroadcastMsgEx(-1,-1,0,17,'爆竹辞岁和年兽来袭活动将于19：30-22：30期间在机奴巢穴举行！欢迎大家参与！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'爆竹辞岁和年兽来袭活动将于19：30-22：30期间在机奴巢穴举行！欢迎大家参与！')
				API_ActorBroadcastMsgEx(-1,-1,0,7,'爆竹辞岁和年兽来袭活动将于19：30-22：30期间在机奴巢穴举行！欢迎大家参与！')
			end
		end
		local StartTime =  API_DiffDatatime(Year,Month,Day,19,30,0)
		local EndTime = API_DiffDatatime(Year,Month,Day,22,30,0)
		if StartTime < 0 and EndTime > 0 then 
			if CJHD_XXXX == nil or CJHD_XXXX < 1 then
				CJHD_XXXX = 1
				API_ActorBroadcastMsgEx(-1,-1,0,17,'爆竹辞岁和年兽来袭活动现在开始！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'爆竹辞岁和年兽来袭活动现在开始！')
				API_ActorBroadcastMsgEx(-1,-1,0,7,'爆竹辞岁和年兽来袭活动现在开始！')
			end
			if math.mod(Minute,2) == 0 then
				API_ActorBroadcastMsgEx(-1,-1,0,17,'现在去机奴巢穴打小年兽可以获得年兽的角，年兽的角可用于抽奖和召唤大年兽！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'现在去机奴巢穴打小年兽可以获得年兽的角，年兽的角可用于抽奖和召唤大年兽！')
				API_ActorBroadcastMsgEx(-1,-1,0,7,'现在去机奴巢穴打小年兽可以获得年兽的角，年兽的角可用于抽奖和召唤大年兽！')
				API_ActorBroadcastMsgEx(-1,-1,0,17,'提醒：男爵和高等男爵只能使用男爵级年兽的角，子爵和高级子爵只能使用子爵级年兽的角，请大家前往相应的机奴巢穴参加活动。')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'提醒：男爵和高等男爵只能使用男爵级年兽的角，子爵和高级子爵只能使用子爵级年兽的角，请大家前往相应的机奴巢穴参加活动。')
				API_ActorBroadcastMsgEx(-1,-1,0,7,'提醒：男爵和高等男爵只能使用男爵级年兽的角，子爵和高级子爵只能使用子爵级年兽的角，请大家前往相应的机奴巢穴参加活动。')
				for j in SpringFestival_MapMonsterTable do
					local MapID = j
					if API_MapIsValid(MapID) and type(SpringFestival_MapMonsterTable[MapID]) == 'table' then
						if SpringFestival_ACTMapTable[API_GetMapConfigID(j)] ~= nil then
							local XiaoNianShou = SpringFestival_ACTMapTable[API_GetMapConfigID(j)].XiaoNianShou
							for i = 1,1000 do
								if SpringFestival_MapMonsterTable[MapID][i] == nil then
									local x,y
									repeat
										x = math.random(625)
										y = math.random(624)
									until not API_IsBlockTile(MapID,x,y,0)
									local FastID = API_CreateMonster(MapID,XiaoNianShou,x,y,5,0,-1)
									SpringFestival_MapMonsterTable[MapID][i] = FastID
								else
									local FastID = SpringFestival_MapMonsterTable[MapID][i]
									if API_GetMonsterID(FastID) <= 0 then
										local x,y
										repeat
											x = math.random(625)
											y = math.random(624)
										until not API_IsBlockTile(MapID,x,y,0)
										FastID = API_CreateMonster(MapID,XiaoNianShou,x,y,5,0,-1)
										SpringFestival_MapMonsterTable[MapID][i] = FastID
									end
								end
							end
						end
					end
				end
			end
			if math.mod(Minute,60) == 0 then
				for j in SpringFestival_MapMonsterTable do
					local MapID = j
					if API_MapIsValid(MapID) and type(SpringFestival_MapMonsterTable[MapID]) == 'table' then
						if SpringFestival_ACTMapTable[API_GetMapConfigID(j)] ~= nil then
							local DaNianShou = SpringFestival_ACTMapTable[API_GetMapConfigID(j)].DaNianShou
							if SpringFestival_MapMonsterTable[MapID][1001] == nil then
								local x,y
								repeat
									x = math.random(250,375)
									y = math.random(260,381)
								until not API_IsBlockTile(MapID,x,y,0)
								local FastID = API_CreateMonster(MapID,DaNianShou,x,y,5,0,-1)
								SpringFestival_MapMonsterTable[MapID][1001] = FastID
								API_CreateDieTriggerG(MapID,0,0,FastID,'SpringFestival_BigMonster_DieTriggerGCallFunc')
								API_ActorBroadcastMsgEx(-1,-1,0,17,''..API_GetMapName(MapID)..'的大年兽已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
								API_ActorBroadcastMsgEx(-1,-1,0,1,''..API_GetMapName(MapID)..'的大年兽已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
								API_ActorBroadcastMsgEx(-1,-1,0,7,''..API_GetMapName(MapID)..'的大年兽已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
							else
								local FastID = SpringFestival_MapMonsterTable[MapID][1001]
								if API_GetMonsterID(FastID) <= 0 then
									local x,y
									repeat
										x = math.random(250,375)
										y = math.random(260,381)
									until not API_IsBlockTile(MapID,x,y,0)
									FastID = API_CreateMonster(MapID,DaNianShou,x,y,5,0,-1)
									SpringFestival_MapMonsterTable[MapID][1001] = FastID
									API_CreateDieTriggerG(MapID,0,0,FastID,'SpringFestival_BigMonster_DieTriggerGCallFunc')
									API_ActorBroadcastMsgEx(-1,-1,0,17,''..API_GetMapName(MapID)..'的大年兽已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
									API_ActorBroadcastMsgEx(-1,-1,0,1,''..API_GetMapName(MapID)..'的大年兽已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
									API_ActorBroadcastMsgEx(-1,-1,0,7,''..API_GetMapName(MapID)..'的大年兽已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
								end
							end
						end
					end
				end
			end
		elseif EndTime < 0 then
			if CJHD_XXXX == nil or CJHD_XXXX < 2 then
				CJHD_XXXX = 2
				API_ActorBroadcastMsgEx(-1,-1,0,17,'今天的爆竹辞岁和年兽来袭活动已经结束！谢谢您的参与！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'今天的爆竹辞岁和年兽来袭活动已经结束！谢谢您的参与！')
				API_ActorBroadcastMsgEx(-1,-1,0,7,'今天的爆竹辞岁和年兽来袭活动已经结束！谢谢您的参与！')
			end
			for i in SpringFestival_MapMonsterTable do
				local MapID = i
				if API_MapIsValid(MapID) and type(SpringFestival_MapMonsterTable[MapID]) == 'table' then
					for j = 1,1001 do
						local FastID = SpringFestival_MapMonsterTable[MapID][j]
						if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
							API_DestroyMonster(FastID)
							SpringFestival_MapMonsterTable[MapID][j] = nil
						end
					end
				end
			end
		end
	elseif nShiFouEnd < 0 then
		API_DestroyTriggerG(TriggerID)
		if SpringFestival_TimerTriggerID ~= nil then
			API_DestroyTriggerG(TriggerID)
			SpringFestival_TimerTriggerID = nil
		end
	end
end

function SpringFestival_ChuXiYeFangPao_TimerTriggerCallFunc(DGMapID,LBMapID)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Day == 25 and Minute == 59 then
		if Second == 50 then
			for i,v in SpringFestival_ZhuChengMapTable do
				local MapFastID = API_GetRightMapID(v)
				API_BroadcastScreenEffect(MapFastID,2) --出现倒数数字
			end
		end
	elseif Day == 26 and Minute == 0 then
		if Second >= 0 then
			for i,v in SpringFestival_ZhuChengMapTable do
				local MapFastID = API_GetRightMapID(v)
				API_BroadcastScreenEffect(MapFastID,3) --出现新年快乐
				API_ActorCallBack(v,0,-1,'SpringFestival_LookYanHua')
			end
			ChuXiYeFangPaoYi = ChuXiYeFangPaoYi or API_CreateTimerTriggerG(1,2,10,180,'SpringFestival_ChuXiYeFangPaoYi')
			ChuXiYeFangPaoEr = ChuXiYeFangPaoEr or API_CreateTimerTriggerG(1,2,3,600,'SpringFestival_ChuXiYeFangPaoEr')
			ChuXiYeFangPaoSan = ChuXiYeFangPaoSan or API_CreateTimerTriggerG(1,2,7,228,'SpringFestival_ChuXiYeFangPaoSan')
			API_DestroyTriggerG(TriggerID)
		end
	end
end

function SpringFestival_LookYanHua(ActorID)
	GLOBAL_FengXiangBiao_DateList[8][7].Date = GLOBAL_FengXiangBiao_DateList[8][7].Date + 1
end

function SpringFestival_ChuXiYeFangPaoYi(a,b)
	for i = 1,450 do
		x = math.random(180,330)
		y = math.random(150,370)
		local MagicID = math.random(255,258)
		API_AddMagicToMap(1,x,y,MagicID)
	end
	for i = 1,500 do
		x = math.random(110,360)
		y = math.random(110,380)
		local MagicID = math.random(255,258)
		API_AddMagicToMap(2,x,y,MagicID)
	end
end

function SpringFestival_ChuXiYeFangPaoEr(a,b)
	for i = 1,450 do
		x = math.random(180,330)
		y = math.random(150,370)
		local MagicID = math.random(255,258)
		API_AddMagicToMap(1,x,y,MagicID)
	end
	for i = 1,500 do
		x = math.random(110,360)
		y = math.random(110,380)
		local MagicID = math.random(255,258)
		API_AddMagicToMap(2,x,y,MagicID)
	end
end

function SpringFestival_ChuXiYeFangPaoSan(a,b)
	for i = 1,450 do
		x = math.random(180,330)
		y = math.random(150,370)
		local MagicID = math.random(255,258)
		API_AddMagicToMap(1,x,y,MagicID)
	end
	for i = 1,500 do
		x = math.random(110,360)
		y = math.random(110,380)
		local MagicID = math.random(255,258)
		API_AddMagicToMap(2,x,y,MagicID)
	end
end

function SpringFestival_CaiShenBaoXiang()
	if API_IsEctypeServer() then
		if API_GetServerID() == 11 then
			local MapID = API_VarDataGetNumber_Ex(1,0,-1,1,1)
			local CaiShenBaoXiang = SpringFestival_ACTMapTable[1956].CaiShenBaoXiang
			if API_MapIsValid(MapID) then
				for i = 1,666 do
					local x,y
					repeat
						x = math.random(625)
						y = math.random(624)
					until not API_IsBlockTile(MapID,x,y,0)
					API_CreateDropGoods(MapID,x,y,CaiShenBaoXiang,1,3,'宝箱献礼',4,0,600,0)
				end
			end
		end
		if API_GetServerID() == 12 then
			local MapID = API_VarDataGetNumber_Ex(1,0,-1,1,2)
			local CaiShenBaoXiang = SpringFestival_ACTMapTable[1957].CaiShenBaoXiang
			if API_MapIsValid(MapID) then
				for i = 1,666 do
					local x,y
					repeat
						x = math.random(625)
						y = math.random(624)
					until not API_IsBlockTile(MapID,x,y,0)
					API_CreateDropGoods(MapID,x,y,CaiShenBaoXiang,1,3,'宝箱献礼',4,0,600,0)
				end
			end
			MapID = API_VarDataGetNumber_Ex(1,0,-1,1,4)
			CaiShenBaoXiang = SpringFestival_ACTMapTable[1959].CaiShenBaoXiang
			if API_MapIsValid(MapID) then
				for i = 1,666 do
					local x,y
					repeat
						x = math.random(625)
						y = math.random(624)
					until not API_IsBlockTile(MapID,x,y,0)
					API_CreateDropGoods(MapID,x,y,CaiShenBaoXiang,1,3,'宝箱献礼',4,0,600,0)
				end
			end
		end
	else
	end
end

--上线给卷轴，设置在线时间
function SpringFestival_OnLogin(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
	if 0 == API_VarDataGetNumber(ActorID, 1, 7751) or 0 ~= API_VarDataGetNumber(ActorID, 1, 7900) then
		return
	end
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(ActorID)
	if MapConfigID == 96 or MapConfigID == 97 then
		return
	end
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		if not API_IsEctypeServer() then
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
			local PlayYMD = API_VarDataGetNumber(ActorID,1,19027)
			local PlayYear = math.floor(PlayYMD/10000) --取年月日的商数
			local PlayMonthDay = math.mod(PlayYMD,10000) --取年月日的余数
			local PlayMonth = math.floor(PlayMonthDay/100) --取年月日余数的商数
			local PlayDay = math.mod(PlayMonthDay,100) --取年月日余数的商数的余数
			local YMD = Year * 10000 + Month * 100 + Day
			if Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
				API_VarDataSetNumber(ActorID,1,19027,YMD)
				GLOBAL_FengXiangBiao_DateList[8][1].Date = GLOBAL_FengXiangBiao_DateList[8][1].Date + 1
			end
			API_RemoveTaskScroll(ActorID,50002)
			API_AddTaskScroll(ActorID,50002,104100,'SpringFestival_JuanZhou')
			local ZhuFu = SpringFestival_ZhuFuTable[math.random(14)]
			API_ActorSendMsg(ActorID,1,''..ZhuFu..'')
		end
	end
end

--上线判断
--[[local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'SpringFestival_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'SpringFestival_OnLogin') 
end
--切换地图后判断
local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'SpringFestival_OnLogin' then
		OnLoginMapLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'SpringFestival_OnLogin') 
end]]

SpringFestival_ZhuFuTable = { 
				[1] = '丢掉心中的迷茫，抹去眼里的忧伤，新的一年新的路，走吧，鲜花正盛开在你的前方。　　　　　　　　　　　', 
				[2] = '愿你享有期望中的全部喜悦，每一件微小的事物都能带给你甜美的感受和无穷的快乐，祝春节快乐，万事如意！', 
				[3] = '新春贺喜，让新春的风吹进你的屋子，让新春的雪飞进你的屋子，让我新春的祝愿，飘进你的心坎。　　　　　', 
				[4] = '新年好，祝你：身体健康，万事如意，合家欢乐，生活美满，事业有成，珠玉满堂，多福多寿，财大气粗，攻无不克，战无不胜！', 
				[5] = '祝你一帆风顺，双龙戏珠；三阳开泰，四季发财；五福临门，六六大顺；七星捧月，八面春风；九运当头，十全十美，恭喜恭喜。', 
				[6] = '好朋友简简单单，好情谊清清爽爽，好缘份久久长长。朋友，祝你新年快乐，吉祥如意。　　　　　　　　　　',
				[7] = '收集我心中的每一份祝福，每一种愿望，描绘我心中的每一道细节，每一个企盼，寄予你深切的关怀。祝你新春快乐。',
				[8] = '祝你在新的一年里：事业正当午，身体壮如虎，金钱不胜数，干活不辛苦，悠闲像老鼠，浪漫似乐谱，快乐非你莫属！',
				[9] = '春风洋溢你，家人关心你，爱情滋润你，朋友忠于你，我这儿祝福你，幸运之星永远照着你，衷心祝福你：新春快乐！',
				[10] = '祝愿：一元复始，万象更新；年年如意，岁岁平安；财源广进，富贵吉祥；幸福安康，庆有余；竹报平安，福满门；喜气洋洋。',
				[11] = '衷心的祝愿你在新的一年里，所有的期待都能出现，所有的梦想都能实现，所有的希望都能如愿，所有的付出都能兑现！',
				[12] = '财神除夕到，奖金满钱包；开春撞桃花，美女入怀抱；盛夏日炎炎，欧美任逍遥；金秋重阳节，仕途步步高！　　',
				[13] = '祝新春快乐，捂着肚子乐，蒙着被子乐，流着鼻涕乐，对天哈哈乐，喝水咕咕乐，不想我也乐，想到我更乐，此时肯定乐，健康又快乐！',
				[14] = '祝你一家瑞气，二气雍和，三星拱户，四季平安，五星高照，六畜兴旺，总之新年快乐，万事如意！　　　　　　',
				} 

SpringFestival_JieShao = {
				[1] = '春节，是农历的岁首，也是我国古老的传统节日。古代过“年”不是在腊月二十九日或三十日，而是在“蜡日”，即后来的“腊八”。南北朝以后，把“蜡祭”移至岁末。到了民国时 ，改用阳历，才把阴历年叫“春节”，因为春节一般都在“立春”前后。',
				[2] = '春节是我国最盛大、最热闹的一个古老传统节日。俗称“过年”。按照我国农历，正月初一古称元日、元辰、元正、元朔、元旦等，俗称年初一，还有上日、正朝、三朔、三朝、三始、三元等别称，意即正月初一是年、月、日三者的开始。　　　　　　　　',
				[3] = '春节，顾名思义就是春天的节日。春天来临，万象更新，新一轮播种和收获季节又要开始。 人们有足够的理由载歌载舞来迎接这个节日。于是，节前就在门脸上贴上红纸黄字的新年寄语。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　',
				[4] = '春节的另一名称叫过年。“年”是什么呢？是一种为人们带来坏运气的想象中的动物。“年”一来。树木凋蔽，百草不生；“年”一“过”，万物生长，鲜花遍地。“年”如何才能过去呢？需用鞭炮轰 ，于是有了燃鞭炮的习俗。1993年，北京市人民政府颁布了禁放烟花爆竹的法律，使这一沿续了几百年的习俗成为历史。',
				[5] = '春节是个亲人团聚的节日，这一点和西方的圣诞节很相似。离家的孩子这时要不远千里回到父母家里。真正过年的前一夜叫“除夕”，又叫“团圆夜”，“团年”。传统的庆祝活动则从除夕一直持续到正月十五元宵节。　　　　　　　　　　　　　　　　　',
}
				
--卷轴内容，要填NPC位置，如在主城内给个直接飞过去的连接
function SpringFestival_JuanZhou()
	local ActorID = API_RequestGetActorID()
	local PlayYMD = API_VarDataGetNumber(ActorID,1,19019)
	local HongBao = API_VarDataGetNumber(ActorID,1,19020)
	local ZhuFu = SpringFestival_ZhuFuTable[math.random(14)]
	local JieShao = SpringFestival_JieShao[math.random(5)]
	local Camp = API_GetActorCamp(ActorID)
	local ActCurMapid = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(ActCurMapid)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local PlayYear = math.floor(PlayYMD/10000) --取年月日的商数
	local PlayMonthDay = math.mod(PlayYMD,10000) --取年月日的余数
	local PlayMonth = math.floor(PlayMonthDay/100) --取年月日余数的商数
	local PlayDay = math.mod(PlayMonthDay,100) --取年月日余数的商数的余数
	local x,y,x2,y2
	if Camp == 0 then
		x,y,x2,y2 = 59,149,130,111
	elseif Camp == 1 then
		x,y,x2,y2 = 55,179,55,188
	end
	if Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
		HongBao = 0
		API_VarDataSetNumber(ActorID,1,19020,0)
	end
	API_ResponseWrite('<name>新年快乐</name>')
	API_ResponseWrite('<win rect="80,350,830,270"></win>')
	API_ResponseWrite('<br><br><text size="16"  color="117,252,255">  '..ZhuFu..'</text><br>')
	API_ResponseWrite('<br><text size="14">  '..JieShao..'</text><br>')
	API_ResponseWrite('<br><text size="14">  在主城内的</text><text size="14" color="117,252,255">节日特使['..x..'，'..y..']</text><text size="14">处有各种节日道具出售，每天还可以在</text><text size="14" color="117,252,255">节日爆竹['..x2..'，'..y2..']</text><text size="14">下面领取各种小礼物。</text><br>')
	if HongBao == 0 then
		API_ResponseWrite('<br><text size="14" color="255,0,255">  您今天还未领取红包。</text><br>')
	else
		API_ResponseWrite('<br><text size="14" color="255,0,255">  您已经领取过红包了。</text><br>')
	end
	API_ResponseWrite('<br><a href="SpringFestival_LingHongBao?1=1">  领取红包</a><text>      </text>')
	API_ResponseWrite('<a href="SpringFestival_LingHongBao?1=2">春节活动介绍</a><text>      </text>')
	API_ResponseWrite('<a href="SpringFestival_LingHongBao?1=3">传送到节日特使处</a><text>      </text>')
	API_ResponseWrite('<a>关闭</a><br>')
end

--领取红包、活动介绍、传送到NPC
function SpringFestival_LingHongBao()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local CampID = API_GetActorCamp(ActorID)
	local ActCurMapid = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(ActCurMapid)
	local DongTaiMapID = API_GetStaticMapID(ActCurMapid)
	local x,y
	if CampID == 0 then
		x,y = 130,111
	elseif CampID == 1 then
		x,y = 55,188
	end
	if XuanZe == 1 then
		local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
		local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
		if nShiFouStart < 0 and nShiFouEnd > 0 then
			local PlayYMD = API_VarDataGetNumber(ActorID,1,19019)
			local HongBao = API_VarDataGetNumber(ActorID,1,19020)
			local YMD = Year * 10000 + Month * 100 + Day
			local PackageSize = API_ActorGetPackageSize(ActorID)
			local HongBaoID = 849
			if HongBao >= 1 then
				API_ResponseWrite('<text>您今天已经领取过红包了，不能再领取红包了。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
				return
			end
			if PackageSize >= 1 then
				API_VarDataSetNumber(ActorID,1,19019,YMD)
				API_VarDataSetNumber(ActorID,1,19020,HongBao+1)
				local HongBao2 = API_VarDataGetNumber(ActorID,1,19020)
				if HongBao2 == HongBao + 1 then
					API_AddActorGoodsFlag(ActorID,HongBaoID,1,3,'领取红包获得 1个 '.. API_GetGoodsName(HongBaoID)..'')
					API_ResponseWrite('<text>领取红包获得：</text>')
					API_ResponseWrite('<img srcgd="'..HongBaoID..'" tipgd="'..HongBaoID..'">')
					API_ResponseWrite('<text> × 1</text><br>')
					API_ResponseWrite('<br><br><a href="SpringFestival_JuanZhou">返回</a><br>')
					GLOBAL_FengXiangBiao_DateList[8][8].Date = GLOBAL_FengXiangBiao_DateList[8][8].Date + 1
				end
			else
				API_ResponseWrite('<text>您的背包已满，无法领取红包。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<text>领取失败，春节红包只能在春节活动期间内[1月25日--1月31日]领取。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end 
	elseif XuanZe == 2 then
		API_ResponseWrite('<name>春节活动介绍</name>')
		API_ResponseWrite('<win rect="80,340,830,325"></win>')
		API_ResponseWrite('<br><text color="117,252,255">  活动时间</text><text>：1月25日至1月31日</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  爆竹辞岁</text><text>：活动时间内每天19：30-22：30在各机奴巢穴内会出现大量的“小年兽”，打败小年兽会获得“年兽的角”，年兽的角可以在节日特使处抽取各种新年礼物。并且年兽的角更可用于召唤大年兽哦。</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  年兽来袭</text><text>：活动时间内每天19：30-22：30在各机奴巢穴内每小时会出现一只“大年兽”，大年兽身上携带各种珍稀道具。喜欢猎奇的您千万不要错过。</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  宝箱献礼</text><text>：活动时间内每天13：00--16：00在各机奴巢穴内每过一段时间，财神会撒落大量的“财神宝箱”，打开财神宝箱会获得各种礼物，惊喜不断，不容错过。</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  天降财神</text><text>：活动时间内每天登陆游戏即可通过节日卷轴领取春节红包一个，红包内有什么礼物呢？赶紧领取一个打开看看吧。</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  新年礼盒</text><text>：活动时间内每天可在主城的 ['..x..'，'..y..'] 点击地上的大小礼盒和爆竹获得各种小礼物。</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  跨年时刻</text><text>：除夕之夜，在主城内的所有玩家将收到新年祝福，并且全城将连续不间断燃放各种烟花、鞭炮，让我们一起度过一个美好而难忘的除夕吧。</text><br>')
		API_ResponseWrite('<br><a>  确定</a><br>')
	elseif XuanZe == 3 then
		if StaticMapID == 23 or StaticMapID == 25 then
			API_ResponseWrite('<text>在麦穗平原和阳光雨林内无法使用此功能。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
			return
		end
		if API_GetServerID() == 11 or API_GetServerID() == 12 then
			API_ResponseWrite('<text>在浮空岛内无法使用此功能。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
			return
		end
		if ActCurMapid ~= DongTaiMapID then
			API_ResponseWrite('<text>在浮空岛内无法使用此功能。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
			return
		end
		for i,v in Public_NewPlayMapTable do
			if StaticMapID == v then
				API_ResponseWrite('<text>只有从新手学院毕业后才能使用此功能。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
				return
			end
		end
		local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
		if ConvectionInfo ~= 0 then
			API_ActorSendMsg(ActorID,3,'正在传送中，请稍后')
		else
			local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
			local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
			local TimerTriggerID = API_CreateTimerTriggerG(ActorID,0,1,5,'SpringFestival_TimerTriggerCallFunc')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
			local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(GLOBAL_ConvectionTimer)
			API_ActorSendMsg(ActorID,2,'传送服务开始，空间定位中……，需时'..GLOBAL_ConvectionTimerCN..'秒，定位期间请不要移动，否则将传送失败')
			StatusTimer = (GLOBAL_ConvectionTimer + 1) * 1000
			if CampID == 0 then
				API_ActorAddStatus(ActorID,36002,StatusTimer)
			else
				API_ActorAddStatus(ActorID,36003,StatusTimer)
			end
			API_ActorShowProcess(ActorID,StatusTimer,410,360,'空间定位')
		end
	end
end

--传送到节日特使处，位置xy需要设置
function SpringFestival_TimerTriggerCallFunc(ActorID,b)
	if API_ActorIsOnline(ActorID) then
		local CampID = API_GetActorCamp(ActorID)
		local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
		ConvectionInfo = math.mod(ConvectionInfo,1000000000)
		local ConvectionSign = math.floor(ConvectionInfo/100000000)
		local BackTileXYandTime = math.mod(ConvectionInfo,100000000)
		local BackTileYandTime = math.mod(BackTileXYandTime,100000)
		local BackTileX = math.floor(BackTileXYandTime/100000)
		local BackTileY = math.floor(BackTileYandTime/100)
		local Time = math.mod(BackTileYandTime,100)
		local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
		if TileX ~= BackTileX or TileY ~= BackTileY then
			API_ActorSendMsg(ActorID,3,'人物移动，传送失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'空间定位')
		elseif Time >= GLOBAL_ConvectionTimer then
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'空间定位')
			if CampID == 0 then
				API_ActorGoToMap(ActorID,1,211,208)
			elseif CampID == 1 then
				API_ActorGoToMap(ActorID,2,244,164)
			end
		else
			Time = Time + 1
			ConvectionInfo = ConvectionSign * 100000000 + TileX * 100000 + TileY * 100 + Time
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
		end
	end
end

SpringFestival_HongBaoTable = {
				[849] = {
						[1] = {
							{GoodsID=117,Num=1,x=1,y=333},
							{GoodsID=206,Num=1,x=334,y=667},
							{GoodsID=306,Num=1,x=668,y=1000},
							},
						[2] = {
							{GoodsID=118,Num=1,x=1,y=333},
							{GoodsID=207,Num=1,x=334,y=666},
							{GoodsID=307,Num=1,x=667,y=999},
							{GoodsID=80556,Num=1,x=1000,y=1000},
							},
						[3] = {
							{GoodsID=118,Num=1,x=1,y=333},
							{GoodsID=207,Num=1,x=334,y=666},
							{GoodsID=307,Num=1,x=667,y=999},
							{GoodsID=80556,Num=1,x=1000,y=1000},
							},
						[4] = {
							{GoodsID=119,Num=1,x=1,y=332},
							{GoodsID=208,Num=1,x=333,y=664},
							{GoodsID=308,Num=1,x=665,y=996},
							{GoodsID=80556,Num=1,x=997,y=1000},
							},
						[5] = {
							{GoodsID=119,Num=1,x=1,y=332},
							{GoodsID=208,Num=1,x=333,y=664},
							{GoodsID=308,Num=1,x=665,y=996},
							{GoodsID=80556,Num=1,x=997,y=1000},
							},
					},
}

--使用红包 849
function SpringFestival_HongBao_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		if SpringFestival_HongBaoTable[GoodsID] == nil then
			API_ActorSendMsg(ActorID,3,'无效物品')
			return 0
		end
		local PlayJW = API_GetActorPeerageLevel(ActorID)
		if SpringFestival_HongBaoTable[GoodsID][PlayJW] == nil then
			API_ActorSendMsg(ActorID,3,'很抱歉，暂时没有适合您爵位的礼物')
			return 0
		end
		local PackageSize = API_ActorGetPackageSize(ActorID)
		local Table = SpringFestival_HongBaoTable[GoodsID][PlayJW]
		if PackageSize >= 2 then
			if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除春节红包') then
				for i = 1,2 do
					local JiangLi = math.random(1000)
					for j in Table do
						local x = Table[j].x
						local y = Table[j].y
						if JiangLi >= x and JiangLi <= y then
							local JLGoodsID = Table[j].GoodsID
							API_AddActorGoodsFlag(ActorID,JLGoodsID,1,3,'打开春节红包获得1个'..API_GetGoodsName(JLGoodsID)..'')
							API_ActorSendMsg(ActorID,9,'打开春节红包获得1个'..API_GetGoodsName(JLGoodsID)..'')
							break
						end
					end
				end
				return 1
			end
		else
			API_ActorSendMsg(ActorID,2,'背包空间不足，请至少保持2个空位再打开春节红包')
			return 0
		end
	else
		API_ActorSendMsg(ActorID,3,'打开失败，此物品只能在春节活动期间内[1月25日--1月31日]开启。')
		return 0
	end 
end

--使用鞭炮  853
function SpringFestival_FireCrackers_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local SkillID = 429
	if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除鞭炮') then
		--API_ActorAddStatus(ActorID,StatusID,1)
		API_ActorUseSkill(ActorID,SkillID,1,0,0,1,0)
		API_ActorPlaySound(ActorID,10162)
		return 1
	end
end

--使用烟花 858、859
function SpringFestival_YanHua_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local SkillID = 0
	if GoodsID == 858 then
		SkillID = 430
	elseif GoodsID == 859 then
		SkillID = 431
	end
	if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除烟花') then
		--API_ActorAddStatus(ActorID,StatusID,1)
		API_ActorUseSkill(ActorID,SkillID,1,0,0,1,0)
		API_ActorPlaySound(ActorID,10163)
		return 1
	end
end

--使用拜年帖 857
function SpringFestival_PayYear_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win balpha="0" rect="300,400,400,180"></win>')
		API_ResponseWrite('<text>请输入您的拜年词：（最大可输入五十字）</text><br>')
		API_ResponseWrite('<input type="string" name="3" bFilter="1" size="100" width="350"><br>')
		API_ResponseWrite('<br><a href="SpringFestival_PayYear?1=1&2='..GoodsID..'">发送拜年词</a><br>')
		API_ResponseWrite('<br><a>取消</a><br>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_ActorSendMsg(ActorID,3,'使用失败，请在春节活动期间内[1月25日--1月31日]再尝试使用吧。')
		return 0
	end 
end

function SpringFestival_PayYear()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local GoodsID = API_RequestGetNumber(2)
	local PayYear = API_RequestGetString(3)
	local ActorName = API_GetActorName(ActorID)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return
	end
	if XuanZe == 1 then
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除拜年帖') then
			API_ActorBroadcastMsgEx(-1,-1,0,7,'“'..ActorName..'”向大家拜年啦：'..PayYear..'')
			API_ActorBroadcastMsg(-1,17,'“'..ActorName..'”向大家拜年啦：'..PayYear..'')
			GLOBAL_FengXiangBiao_DateList[8][5].Date = GLOBAL_FengXiangBiao_DateList[8][5].Date + 1
		end
	end
end

SpringFestival_GodBoxTable = {
					[854] = {NeedJW='公民',JWMin=1,JWMax=10,NeedPoint=5,
						Goodslist = {
									{GoodsID=80048,Num=1,x=1,y=94860},
									{GoodsID=80064,Num=1,x=94861,y=190150},
									{GoodsID=80083,Num=1,x=190151,y=239390},
									{GoodsID=80093,Num=1,x=239391,y=309000},
									{GoodsID=80103,Num=1,x=309001,y=336590},
									{GoodsID=80113,Num=1,x=336591,y=349960},
									{GoodsID=80123,Num=1,x=349961,y=359300},
									{GoodsID=80133,Num=1,x=359301,y=429750},
									{GoodsID=80181,Num=1,x=429751,y=479200},
									{GoodsID=80191,Num=1,x=479201,y=754460},
									{GoodsID=80383,Num=1,x=754461,y=837010},
									{GoodsID=80404,Num=1,x=837011,y=883490},
									{GoodsID=80408,Num=1,x=883491,y=933360},
									{GoodsID=27,Num=1,x=933361,y=938670},
									{GoodsID=28,Num=1,x=938671,y=949070},
									{GoodsID=29,Num=1,x=949071,y=960950},
									{GoodsID=30,Num=1,x=960951,y=973260},
									{GoodsID=32,Num=1,x=973261,y=986210},
									{GoodsID=33,Num=1,x=986211,y=991720},
									{GoodsID=80398,Num=1,x=991721,y=1000000},
									},
						},
					[855] = {NeedJW='男爵和高级男爵',JWMin=11,JWMax=25,NeedPoint=10,
						Goodslist = {
								{GoodsID=80049,Num=1,x=1,y=26550},
								{GoodsID=80065,Num=1,x=26551,y=107280},
								{GoodsID=80084,Num=1,x=107281,y=149850},
								{GoodsID=80094,Num=1,x=149851,y=259760},
								{GoodsID=80104,Num=1,x=259761,y=301010},
								{GoodsID=80114,Num=1,x=301011,y=326900},
								{GoodsID=80124,Num=1,x=326901,y=344230},
								{GoodsID=80134,Num=1,x=344231,y=381530},
								{GoodsID=80181,Num=1,x=381531,y=432650},
								{GoodsID=80191,Num=1,x=432651,y=717200},
								{GoodsID=80383,Num=1,x=717201,y=802540},
								{GoodsID=80404,Num=1,x=802541,y=850590},
								{GoodsID=80408,Num=1,x=850591,y=902150},
								{GoodsID=27,Num=1,x=902151,y=907630},
								{GoodsID=28,Num=1,x=907631,y=918390},
								{GoodsID=29,Num=1,x=918391,y=930670},
								{GoodsID=30,Num=1,x=930671,y=943400},
								{GoodsID=32,Num=1,x=943401,y=956780},
								{GoodsID=33,Num=1,x=956781,y=962480},
								{GoodsID=80399,Num=1,x=962481,y=971700},
								{GoodsID=40202,Num=1,x=971701,y=980470},
								{GoodsID=40218,Num=1,x=980471,y=989690},
								{GoodsID=40234,Num=1,x=989691,y=998460},
								{GoodsID=40250,Num=1,x=998461,y=999120},
								{GoodsID=40266,Num=1,x=999121,y=1000000},
								},
						},
					[856] = {NeedJW='子爵和高级子爵',JWMin=26,JWMax=40,NeedPoint=20,
						Goodslist = {
								{GoodsID=80050,Num=1,x=1,y=62069},
								{GoodsID=80066,Num=1,x=62070,y=143448},
								{GoodsID=80085,Num=1,x=143449,y=185517},
								{GoodsID=80095,Num=1,x=185518,y=219310},
								{GoodsID=80105,Num=1,x=219311,y=237241},
								{GoodsID=80115,Num=1,x=237242,y=258621},
								{GoodsID=80125,Num=1,x=258622,y=273793},
								{GoodsID=80135,Num=1,x=273794,y=303448},
								{GoodsID=80181,Num=1,x=303449,y=464138},
								{GoodsID=80192,Num=1,x=464139,y=479310},
								{GoodsID=80384,Num=1,x=479311,y=524828},
								{GoodsID=80405,Num=1,x=524829,y=560690},
								{GoodsID=80409,Num=1,x=560691,y=596552},
								{GoodsID=782,Num=1,x=596553,y=852414},
								{GoodsID=27,Num=1,x=852415,y=886897},
								{GoodsID=80279,Num=1,x=886898,y=920690},
								{GoodsID=80280,Num=1,x=920691,y=922759},
								{GoodsID=80400,Num=1,x=922760,y=929655},
								{GoodsID=80458,Num=1,x=929656,y=931724},
								{GoodsID=80459,Num=1,x=931725,y=934483},
								{GoodsID=80460,Num=1,x=934484,y=936552},
								{GoodsID=80461,Num=1,x=936553,y=940000},
								{GoodsID=80462,Num=1,x=940001,y=942069},
								{GoodsID=80463,Num=1,x=942070,y=944138},
								{GoodsID=80464,Num=1,x=944139,y=945517},
								{GoodsID=80465,Num=1,x=945518,y=948276},
								{GoodsID=80466,Num=1,x=948277,y=951034},
								{GoodsID=80550,Num=1,x=951035,y=959310},
								{GoodsID=80551,Num=1,x=959311,y=971034},
								{GoodsID=80552,Num=1,x=971035,y=978621},
								{GoodsID=80554,Num=1,x=978622,y=984138},
								{GoodsID=80555,Num=1,x=984139,y=991034},
								{GoodsID=40204,Num=1,x=991035,y=991724},
								{GoodsID=40206,Num=1,x=991725,y=992414},
								{GoodsID=40220,Num=1,x=992415,y=993103},
								{GoodsID=40222,Num=1,x=993104,y=993793},
								{GoodsID=40236,Num=1,x=993794,y=994483},
								{GoodsID=40238,Num=1,x=994484,y=995172},
								{GoodsID=40252,Num=1,x=995173,y=996552},
								{GoodsID=40254,Num=1,x=996553,y=997241},
								{GoodsID=40268,Num=1,x=997242,y=999310},
								{GoodsID=40270,Num=1,x=999311,y=1000000},
								},
						},
}

--使用财神宝箱 854、855、856
function SpringFestival_GodBox_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if SpringFestival_GodBoxTable[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return 0
	end
	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
	local PlayJW = API_GetActorExpLevel(ActorID)
	local PlayOpenNum = API_VarDataGetNumber(ActorID,1,19022)
	local PlayOpenYMD = API_VarDataGetNumber(ActorID,1,19021)
	local NeedJW = SpringFestival_GodBoxTable[GoodsID].NeedJW
	local JWMin = SpringFestival_GodBoxTable[GoodsID].JWMin
	local JWMax = SpringFestival_GodBoxTable[GoodsID].JWMax
	local NeedPoint = SpringFestival_GodBoxTable[GoodsID].NeedPoint
	if PlayJW < JWMin or PlayJW > JWMax then
		API_ActorSendMsg(ActorID,2,'打开失败，只有'..NeedJW..'爵位的玩家可以开启这个宝箱')
		return 0
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local PlayYear = math.floor(PlayOpenYMD/10000) --取年月日的商数
	local PlayMonthDay = math.mod(PlayOpenYMD,10000) --取年月日的余数
	local PlayMonth = math.floor(PlayMonthDay/100) --取年月日余数的商数
	local PlayDay = math.mod(PlayMonthDay,100) --取年月日余数的商数的余数
	if Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
		PlayOpenNum = 0
		API_VarDataSetNumber(ActorID,1,19022,0)
	end
	API_ResponseWrite('<name></name>')
	API_ResponseWrite('<br>br><text size="16" color="117,252,255">财神赐福，赶紧打开看看里面有什么礼物吧。</text><br>')
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		API_ResponseWrite('<br><text>每个玩家每天可免点券打开 '..OpenBoxNum..' 次财神宝箱，您今天已经免点券打开了 '..PlayOpenNum..' 次财神宝箱了。</text><br>')
		API_ResponseWrite('<br><text color="255,0,255">提醒：春节活动时间[1月25日--1月31日]过了之后只能使用点券打开财神宝箱。</text><br>')
		if PlayOpenNum == OpenBoxNum then
			API_ResponseWrite('<br><br><text>您今天免点券打开财神宝箱的次数已用完，如果还需要继续打开财神宝箱，请选择“自由打开财神宝箱”。</text><br>')
		else
			API_ResponseWrite('<br><br><a href="SpringFestival_GodBox?1=1&2='..GoodsID..'">免点券打开财神宝箱（每天仅'..OpenBoxNum..'次）</a><br>')
		end
		API_ResponseWrite('<br><a href="SpringFestival_GodBox?1=2&2='..GoodsID..'">自由打开财神宝箱</a><text>                      [消耗 '..NeedPoint..' 点券]</text><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
	elseif nShiFouEnd < 0 then
		API_ResponseWrite('<br><br><a href="SpringFestival_GodBox?1=2&2='..GoodsID..'">自由打开财神宝箱</a><text>                      [消耗 '..NeedPoint..' 点券]</text><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
	end
	return 1
end

function SpringFestival_GodBox()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local GoodsID = API_RequestGetNumber(2)
	if SpringFestival_GodBoxTable[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return
	end
	local NeedPoint = SpringFestival_GodBoxTable[GoodsID].NeedPoint
	local PlayOpenNum = API_VarDataGetNumber(ActorID,1,19022)
	local PlayOpenYMD = API_VarDataGetNumber(ActorID,1,19021)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	local PackageSize = API_ActorGetPackageSize(ActorID)
	if XuanZe == 1 then
		if PlayOpenNum < 5 then
			if PackageSize >= 1 then
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除'..API_GetGoodsName(GoodsID)..'') then
					API_VarDataSetNumber(ActorID,1,19021,YMD)
					API_VarDataSetNumber(ActorID,1,19022,PlayOpenNum+1)
					local PlayOpenNum2 = API_VarDataGetNumber(ActorID,1,19022)
					if PlayOpenNum2 == PlayOpenNum + 1 then
						--抽奖励，仿圣诞节抽奖
						local Table = SpringFestival_GodBoxTable[GoodsID].Goodslist
						local JiangLi = math.random(1000000)
						for j in Table do
							local x = Table[j].x
							local y = Table[j].y
							if JiangLi >= x and JiangLi <= y then
								local JLGoodsID = Table[j].GoodsID
								API_AddActorGoodsFlag(ActorID,JLGoodsID,1,3,'打开财神宝箱获得1个'..API_GetGoodsName(JLGoodsID)..'')
								API_ActorSendMsg(ActorID,9,'打开财神宝箱获得1个'..API_GetGoodsName(JLGoodsID)..'')
								GLOBAL_FengXiangBiao_DateList[8][4].Date = GLOBAL_FengXiangBiao_DateList[8][4].Date + 1
								return
							end
						end
					end
				end
			else
				API_ResponseWrite('<text>背包空间不足，请整理一下您的背包再尝试打开财神宝箱。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<text>您今天已经免点券打开5次财神宝箱了，如果还需要继续打开财神宝箱，请选择“自由打开财神宝箱”。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	elseif XuanZe == 2 then
		if API_ActorGetPropNum(ActorID,183) >= NeedPoint then
			if PackageSize >= 1 then
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除'..API_GetGoodsName(GoodsID)..'') then
					if API_UsePoint(ActorID,3,GoodsID,1,NeedPoint) == 0 then
						--抽奖励，仿圣诞节抽奖
						local Table = SpringFestival_GodBoxTable[GoodsID].Goodslist
						local JiangLi = math.random(1000000)
						for j in Table do
							local x = Table[j].x
							local y = Table[j].y
							if JiangLi >= x and JiangLi <= y then
								local JLGoodsID = Table[j].GoodsID
								API_AddActorGoodsFlag(ActorID,JLGoodsID,1,3,'打开财神宝箱获得1个'..API_GetGoodsName(JLGoodsID)..'')
								API_ActorSendMsg(ActorID,9,'打开财神宝箱获得1个'..API_GetGoodsName(JLGoodsID)..'')
								GLOBAL_FengXiangBiao_DateList[8][9].Date = GLOBAL_FengXiangBiao_DateList[8][9].Date + 1
								return
							end
						end
						--此处加风向标：点券 NeedPoint
					end
				end
			else
				API_ResponseWrite('<text>背包空间不足，请整理一下您的背包再尝试打开财神宝箱。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<text>您的点券不够，不能打开财神宝箱。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	end
end

SpringFestival_MonsterCornerTable = {
					[850] = {JW='公民',NeedJW='公民',JWMin=1,JWMax=10,Num=100,MonsterID=726065},
					[851] = {JW='男爵',NeedJW='男爵和高级男爵',JWMin=11,JWMax=25,Num=100,MonsterID=726067},
					[852] = {JW='子爵',NeedJW='子爵和高级子爵',JWMin=26,JWMax=40,Num=100,MonsterID=726069},
}

--使用年兽的角 850、851、852
function SpringFestival_MonsterCorner_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if SpringFestival_MonsterCornerTable[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return 0
	end
	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		local PlayJW = API_GetActorExpLevel(ActorID)
		local PlaySummonsNum = API_VarDataGetNumber(ActorID,1,19023)
		local PlaySummonsYMD = API_VarDataGetNumber(ActorID,1,19024)
		local JW = SpringFestival_MonsterCornerTable[GoodsID].JW
		local NeedJW = SpringFestival_MonsterCornerTable[GoodsID].NeedJW
		local JWMin = SpringFestival_MonsterCornerTable[GoodsID].JWMin
		local JWMax = SpringFestival_MonsterCornerTable[GoodsID].JWMax
		local Num = SpringFestival_MonsterCornerTable[GoodsID].Num
		if PlayJW < JWMin or PlayJW > JWMax then
			API_ActorSendMsg(ActorID,2,'使用失败，只有'..NeedJW..'爵位的玩家可以使用')
			return 0
		end
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local YMD = Year * 10000 + Month * 100 + Day
		local PlayYear = math.floor(PlaySummonsYMD/10000) --取年月日的商数
		local PlayMonthDay = math.mod(PlaySummonsYMD,10000) --取年月日的余数
		local PlayMonth = math.floor(PlayMonthDay/100) --取年月日余数的商数
		local PlayDay = math.mod(PlayMonthDay,100) --取年月日余数的商数的余数
		if Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
			PlaySummonsNum = 0
			API_VarDataSetNumber(ActorID,1,19023,0)
		end
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>大年兽非常凶狠、强悍，建议邀请朋友一起挑战。小心不要被大年兽吃了哦。</text><br>')
		if PlaySummonsNum == SummonsNum then
			API_ResponseWrite('<br><text>您今天已经不能再召唤大年兽了。</text><br>')
		else
			API_ResponseWrite('<br><text>每个玩家每天可召唤 '..SummonsNum..' 次大年兽，您今天已经召唤了 '..PlaySummonsNum..' 次大年兽了。</text><br>')
			API_ResponseWrite('<br><text color="255,0,255">提醒：在浮空岛和主城内无法召唤。并且只能在春节活动期间内[1月25日--1月31日]召唤。</text><br>')
			API_ResponseWrite('<br><br><a href="SpringFestival_MonsterCorner?1='..GoodsID..'">召唤'..JW..'级大年兽</a><text>    需使用 '..Num..' 个</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><text>才可以召唤</text><br>')
		end
		API_ResponseWrite('<br><br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_ActorSendMsg(ActorID,3,'使用失败，请在春节活动期间内[1月25日--1月31日]再进行尝试吧。')
		return 0
	end 
end

function SpringFestival_MonsterCorner()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local GoodsID = XuanZe
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return
	end
	if SpringFestival_MonsterCornerTable[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return
	end 
	local ActCurMapid = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(ActCurMapid)
	for i,v in SpringFestival_ZhuChengMapTable do
		if StaticMapID == v then
			API_ActorSendMsg(ActorID,3,'在主城内无法召唤大年兽')
			return
		end
	end
	for i,v in SpringFestival_NotZhaoHuanMapTable do
		if StaticMapID == v then
			API_ActorSendMsg(ActorID,3,'在浮空岛、采集场所和英雄广场内无法召唤大年兽')
			return
		end
	end
	if API_IsEctypeServer() or StaticMapID == 97 then
		API_ActorSendMsg(ActorID,3,'在浮空岛内无法召唤大年兽')
		return
	end
	local Time = API_VarDataGetNumber(ActorID,0,19028)
	if Time > 0 then
		API_ActorSendMsg(ActorID,3,'每60秒才可以召唤一次大年兽，您还需'..Time..'秒才可以再次召唤大年兽')
		return
	end
	local ActorName = API_GetActorName(ActorID)
	local PlaySummonsNum = API_VarDataGetNumber(ActorID,1,19023)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	if XuanZe == GoodsID then
		local MapID = API_GetActorMapID(ActorID)
		local x,y = PublicFun_GetActorPosXY(ActorID)
		local Num = SpringFestival_MonsterCornerTable[GoodsID].Num
		local MonsterID = SpringFestival_MonsterCornerTable[GoodsID].MonsterID
		if API_ActorGetGoodsNum(ActorID,GoodsID) >= Num then
			API_VarDataSetNumber(ActorID,1,19023,PlaySummonsNum+1)
			API_VarDataSetNumber(ActorID,1,19024,YMD)
			local PlaySummonsNum2 = API_VarDataGetNumber(ActorID,1,19023)
			if PlaySummonsNum2 == PlaySummonsNum + 1 then
				if API_ActorRemoveGoods(ActorID,GoodsID,Num,'删除'..Num..'个'..API_GetGoodsName(GoodsID)..'召唤大年兽') then
					local FastID = API_CreateMonster(MapID,MonsterID,x,y,4,0,-1)
					API_SetMonsterName(FastID,''..ActorName..'的',2)
					API_CreateDieTriggerG(ActorID,MapID,0,FastID,'SpringFestival_MonsterCorner_DieTriggerGCallFunc')
					API_ActorSendMsg(ActorID,2,'召唤成功')
					GLOBAL_FengXiangBiao_DateList[8][3].Date = GLOBAL_FengXiangBiao_DateList[8][3].Date + 1
					API_VarDataSetNumber(ActorID,0,19028,60)
					API_CreateTimerTrigger(ActorID,1,60,-1,'SpringFestival_BigMonsterTrigger')
				end
			end
		else
			API_ActorSendMsg(ActorID,2,'所需物品不足，无法召唤')
		end
	end
end

function SpringFestival_BigMonsterTrigger(ActorID,b) --召唤大年兽CD
	local Time = API_VarDataGetNumber(ActorID,0,19028)
	Time = Time - 1
	API_VarDataSetNumber(ActorID,0,19028,Time)
end

SpringFestival_BigMonsterTable = {
					--玩家召唤大年兽掉落
					[726065] = {gxa=2,gxb=5,mma=150,mmb=395,
							Goodslist = {
									{GoodsID=80048,Num=1,x=1,y=37250},
									{GoodsID=80064,Num=1,x=37251,y=74670},
									{GoodsID=80083,Num=1,x=74671,y=94000},
									{GoodsID=80093,Num=1,x=94001,y=121330},
									{GoodsID=80103,Num=1,x=121331,y=132170},
									{GoodsID=80113,Num=1,x=132171,y=137420},
									{GoodsID=80123,Num=1,x=137421,y=141080},
									{GoodsID=80133,Num=1,x=141081,y=168750},
									{GoodsID=80181,Num=1,x=168751,y=188170},
									{GoodsID=80191,Num=1,x=188171,y=296250},
									{GoodsID=80383,Num=1,x=296251,y=328670},
									{GoodsID=80404,Num=1,x=328671,y=346920},
									{GoodsID=80408,Num=1,x=346921,y=366500},
									{GoodsID=27,Num=1,x=366501,y=368580},
									{GoodsID=28,Num=1,x=368581,y=372670},
									{GoodsID=29,Num=1,x=372671,y=377330},
									{GoodsID=30,Num=1,x=377331,y=382170},
									{GoodsID=32,Num=1,x=382171,y=387250},
									{GoodsID=33,Num=1,x=387251,y=389420},
									{GoodsID=80398,Num=1,x=389421,y=392670},
									{GoodsID=206,Num=3,x=392671,y=413500},
									{GoodsID=117,Num=1,x=413501,y=434330},
									{GoodsID=80498,Num=1,x=434331,y=926920},
									{GoodsID=80410,Num=1,x=926921,y=1000000},
									},
							},
					[726067] = {gxa=7,gxb=14,mma=400,mmb=1673,
							Goodslist = {
									{GoodsID=80049,Num=1,x=1,y=10080},
									{GoodsID=80065,Num=1,x=10081,y=40750},
									{GoodsID=80084,Num=1,x=40751,y=56920},
									{GoodsID=80094,Num=1,x=56921,y=98670},
									{GoodsID=80104,Num=1,x=98671,y=114330},
									{GoodsID=80114,Num=1,x=114331,y=124170},
									{GoodsID=80124,Num=1,x=124171,y=130750},
									{GoodsID=80134,Num=1,x=130751,y=144920},
									{GoodsID=80181,Num=1,x=144921,y=164330},
									{GoodsID=80191,Num=1,x=164331,y=272420},
									{GoodsID=80383,Num=1,x=272421,y=304830},
									{GoodsID=80404,Num=1,x=304831,y=323080},
									{GoodsID=80408,Num=1,x=323081,y=342670},
									{GoodsID=27,Num=1,x=342671,y=344750},
									{GoodsID=28,Num=1,x=344751,y=348830},
									{GoodsID=29,Num=1,x=348831,y=353500},
									{GoodsID=30,Num=1,x=353501,y=358330},
									{GoodsID=32,Num=1,x=358331,y=363420},
									{GoodsID=33,Num=1,x=363421,y=365580},
									{GoodsID=80399,Num=1,x=365581,y=369080},
									{GoodsID=40202,Num=1,x=369081,y=372420},
									{GoodsID=40218,Num=1,x=372421,y=375920},
									{GoodsID=40234,Num=1,x=375921,y=379250},
									{GoodsID=40250,Num=1,x=379251,y=379500},
									{GoodsID=40266,Num=1,x=379501,y=379830},
									{GoodsID=207,Num=1,x=379831,y=400670},
									{GoodsID=118,Num=1,x=400671,y=421500},
									{GoodsID=80498,Num=1,x=421501,y=942330},
									{GoodsID=80410,Num=1,x=942331,y=1000000},
									},
							},
					[726069] = {gxa=18,gxb=25,mma=500,mmb=1373,
							Goodslist = {
									{GoodsID=80050,Num=1,x=1,y=7500},
									{GoodsID=80066,Num=1,x=7501,y=17333},
									{GoodsID=80085,Num=1,x=17334,y=22417},
									{GoodsID=80095,Num=1,x=22418,y=26500},
									{GoodsID=80105,Num=1,x=26501,y=28667},
									{GoodsID=80115,Num=1,x=28668,y=31250},
									{GoodsID=80125,Num=1,x=31251,y=33083},
									{GoodsID=80135,Num=1,x=33084,y=36667},
									{GoodsID=80181,Num=1,x=36668,y=56083},
									{GoodsID=80192,Num=1,x=56084,y=57917},
									{GoodsID=80384,Num=1,x=57918,y=63417},
									{GoodsID=80405,Num=1,x=63418,y=67750},
									{GoodsID=80409,Num=1,x=67751,y=72083},
									{GoodsID=782,Num=1,x=72084,y=103000},
									{GoodsID=27,Num=1,x=103001,y=107167},
									{GoodsID=80279,Num=1,x=107168,y=111250},
									{GoodsID=80280,Num=1,x=111251,y=111500},
									{GoodsID=80400,Num=1,x=111501,y=112333},
									{GoodsID=80458,Num=1,x=112334,y=112583},
									{GoodsID=80459,Num=1,x=112584,y=112917},
									{GoodsID=80460,Num=1,x=112918,y=113167},
									{GoodsID=80461,Num=1,x=113168,y=113583},
									{GoodsID=80462,Num=1,x=113584,y=113833},
									{GoodsID=80463,Num=1,x=113834,y=114083},
									{GoodsID=80464,Num=1,x=114084,y=114250},
									{GoodsID=80465,Num=1,x=114251,y=114583},
									{GoodsID=80466,Num=1,x=114584,y=114917},
									{GoodsID=80550,Num=1,x=114918,y=115917},
									{GoodsID=80551,Num=1,x=115918,y=117333},
									{GoodsID=80552,Num=1,x=117334,y=118250},
									{GoodsID=80554,Num=1,x=118251,y=118917},
									{GoodsID=80555,Num=1,x=118918,y=119750},
									{GoodsID=40204,Num=1,x=119751,y=119833},
									{GoodsID=40206,Num=1,x=119834,y=119917},
									{GoodsID=40220,Num=1,x=119918,y=120000},
									{GoodsID=40222,Num=1,x=120001,y=120083},
									{GoodsID=40236,Num=1,x=120084,y=120167},
									{GoodsID=40238,Num=1,x=120168,y=120250},
									{GoodsID=40252,Num=1,x=120251,y=120417},
									{GoodsID=40254,Num=1,x=120418,y=120500},
									{GoodsID=40268,Num=1,x=120501,y=120750},
									{GoodsID=40270,Num=1,x=120751,y=120833},
									{GoodsID=208,Num=1,x=120834,y=141667},
									{GoodsID=119,Num=1,x=141668,y=162500},
									{GoodsID=80498,Num=1,x=162501,y=829708},
									{GoodsID=80410,Num=1,x=829709,y=1000000},
									},
							},
					--系统刷新大年兽掉落
					[726070] = {gxa=3,gxb=8,mma=200,mmb=1069,
							Goodslist = {
									{GoodsID=80048,Num=1,x=1,y=37250},
									{GoodsID=80064,Num=1,x=37251,y=74670},
									{GoodsID=80083,Num=1,x=74671,y=94000},
									{GoodsID=80093,Num=1,x=94001,y=121330},
									{GoodsID=80103,Num=1,x=121331,y=132170},
									{GoodsID=80113,Num=1,x=132171,y=137420},
									{GoodsID=80123,Num=1,x=137421,y=141080},
									{GoodsID=80133,Num=1,x=141081,y=168750},
									{GoodsID=80181,Num=1,x=168751,y=188170},
									{GoodsID=80191,Num=1,x=188171,y=296250},
									{GoodsID=80383,Num=1,x=296251,y=328670},
									{GoodsID=80404,Num=1,x=328671,y=346920},
									{GoodsID=80408,Num=1,x=346921,y=366500},
									{GoodsID=27,Num=1,x=366501,y=368580},
									{GoodsID=28,Num=1,x=368581,y=372670},
									{GoodsID=29,Num=1,x=372671,y=377330},
									{GoodsID=30,Num=1,x=377331,y=382170},
									{GoodsID=32,Num=1,x=382171,y=387250},
									{GoodsID=33,Num=1,x=387251,y=389420},
									{GoodsID=80398,Num=1,x=389421,y=392670},
									{GoodsID=80556,Num=1,x=392671,y=396830},
									{GoodsID=206,Num=1,x=396831,y=521830},
									{GoodsID=117,Num=1,x=521831,y=646830},
									{GoodsID=80498,Num=1,x=646831,y=968580},
									{GoodsID=80410,Num=1,x=968581,y=1000000},
									},
							},
					[726071] = {gxa=12,gxb=24,mma=500,mmb=1580,
							Goodslist = {
									{GoodsID=80049,Num=1,x=1,y=10080},
									{GoodsID=80065,Num=1,x=10081,y=40750},
									{GoodsID=80084,Num=1,x=40751,y=56920},
									{GoodsID=80094,Num=1,x=56921,y=98670},
									{GoodsID=80104,Num=1,x=98671,y=114330},
									{GoodsID=80114,Num=1,x=114331,y=124170},
									{GoodsID=80124,Num=1,x=124171,y=130750},
									{GoodsID=80134,Num=1,x=130751,y=144920},
									{GoodsID=80181,Num=1,x=144921,y=164330},
									{GoodsID=80191,Num=1,x=164331,y=272420},
									{GoodsID=80383,Num=1,x=272421,y=304830},
									{GoodsID=80404,Num=1,x=304831,y=323080},
									{GoodsID=80408,Num=1,x=323081,y=342670},
									{GoodsID=27,Num=1,x=342671,y=344750},
									{GoodsID=28,Num=1,x=344751,y=348830},
									{GoodsID=29,Num=1,x=348831,y=353500},
									{GoodsID=30,Num=1,x=353501,y=358330},
									{GoodsID=32,Num=1,x=358331,y=363420},
									{GoodsID=33,Num=1,x=363421,y=365580},
									{GoodsID=80399,Num=1,x=365581,y=369080},
									{GoodsID=40202,Num=1,x=369081,y=372420},
									{GoodsID=40218,Num=1,x=372421,y=375920},
									{GoodsID=40234,Num=1,x=375921,y=379250},
									{GoodsID=40250,Num=1,x=379251,y=379500},
									{GoodsID=40266,Num=1,x=379501,y=379830},
									{GoodsID=80556,Num=1,x=379831,y=396500},
									{GoodsID=207,Num=1,x=396501,y=521500},
									{GoodsID=118,Num=1,x=521501,y=646500},
									{GoodsID=80498,Num=1,x=646501,y=942500},
									{GoodsID=80410,Num=1,x=942501,y=1000000},
									},
							},
					[726072] = {gxa=18,gxb=30,mma=800,mmb=2869,
							Goodslist = {
									{GoodsID=80050,Num=1,x=1,y=7500},
									{GoodsID=80066,Num=1,x=7501,y=17333},
									{GoodsID=80085,Num=1,x=17334,y=22417},
									{GoodsID=80095,Num=1,x=22418,y=26500},
									{GoodsID=80105,Num=1,x=26501,y=28667},
									{GoodsID=80115,Num=1,x=28668,y=31250},
									{GoodsID=80125,Num=1,x=31251,y=33083},
									{GoodsID=80135,Num=1,x=33084,y=36667},
									{GoodsID=80181,Num=1,x=36668,y=56083},
									{GoodsID=80192,Num=1,x=56084,y=57917},
									{GoodsID=80384,Num=1,x=57918,y=63417},
									{GoodsID=80405,Num=1,x=63418,y=67750},
									{GoodsID=80409,Num=1,x=67751,y=72083},
									{GoodsID=782,Num=1,x=72084,y=103000},
									{GoodsID=27,Num=1,x=103001,y=107167},
									{GoodsID=80279,Num=1,x=107168,y=111250},
									{GoodsID=80280,Num=1,x=111251,y=111500},
									{GoodsID=80400,Num=1,x=111501,y=112333},
									{GoodsID=80458,Num=1,x=112334,y=112583},
									{GoodsID=80459,Num=1,x=112584,y=112917},
									{GoodsID=80460,Num=1,x=112918,y=113167},
									{GoodsID=80461,Num=1,x=113168,y=113583},
									{GoodsID=80462,Num=1,x=113584,y=113833},
									{GoodsID=80463,Num=1,x=113834,y=114083},
									{GoodsID=80464,Num=1,x=114084,y=114250},
									{GoodsID=80465,Num=1,x=114251,y=114583},
									{GoodsID=80466,Num=1,x=114584,y=114917},
									{GoodsID=80550,Num=1,x=114918,y=115917},
									{GoodsID=80551,Num=1,x=115918,y=117333},
									{GoodsID=80552,Num=1,x=117334,y=118250},
									{GoodsID=80554,Num=1,x=118251,y=118917},
									{GoodsID=80555,Num=1,x=118918,y=119750},
									{GoodsID=40204,Num=1,x=119751,y=119833},
									{GoodsID=40206,Num=1,x=119834,y=119917},
									{GoodsID=40220,Num=1,x=119918,y=120000},
									{GoodsID=40222,Num=1,x=120001,y=120083},
									{GoodsID=40236,Num=1,x=120084,y=120167},
									{GoodsID=40238,Num=1,x=120168,y=120250},
									{GoodsID=40252,Num=1,x=120251,y=120417},
									{GoodsID=40254,Num=1,x=120418,y=120500},
									{GoodsID=40268,Num=1,x=120501,y=120750},
									{GoodsID=40270,Num=1,x=120751,y=120833},
									{GoodsID=80556,Num=1,x=120834,y=141667},
									{GoodsID=208,Num=1,x=141668,y=225000},
									{GoodsID=119,Num=1,x=225001,y=308333},
									{GoodsID=80498,Num=1,x=308334,y=913083},
									{GoodsID=80410,Num=1,x=913084,y=1000000},
									},
							},
}

--需要设置怪物掉落，做表
function SpringFestival_MonsterCorner_DieTriggerGCallFunc(ZhuRenID,MapID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if SpringFestival_BigMonsterTable[MonsterID] == nil then
		return
	end
	local ShiQuID = 0
	local ShiQuLeiXing = 0
	if KillerType == 1 then
		if API_ActorIsOnline(ZhuRenID) then
			ShiQuID = ZhuRenID
		else
			ShiQuID = KillerID
		end
	elseif KillerType and KillerID == -1 then
		return
	else
		ShiQuID = 0
		ShiQuLeiXing = 4
	end
	--掉落物品
	local RamdonNum = math.random(10)
	local DiaoLuoNum = RamdonNum + 50 
	for i = 1,DiaoLuoNum do
		local Table = SpringFestival_BigMonsterTable[MonsterID]
		local gxa = Table.gxa
		local gxb = Table.gxb
		local mma = Table.mma
		local mmb = Table.mmb
		local JiangLi = math.random(1000000)
		for j in Table.Goodslist do
			local x = Table.Goodslist[j].x
			local y = Table.Goodslist[j].y
			if JiangLi >= x and JiangLi <= y then
				local GoodsID = Table.Goodslist[j].GoodsID
				local GoodsNum = Table.Goodslist[j].Num
				if GoodsID == 80498 then
					GoodsNum = math.random(gxa,gxb)
				elseif GoodsID == 80410 then
					GoodsNum = math.random(mma,mmb)
				end
				API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,'召唤大年兽掉宝',ShiQuLeiXing,ShiQuID,600,180)
				break
			end
		end
	end
end

function SpringFestival_BigMonster_DieTriggerGCallFunc(MapID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if SpringFestival_BigMonsterTable[MonsterID] == nil then
		return
	end
	--掉落物品、不需要拾取权限
	local DiaoLuoNum = math.random(80,100)
	for i = 1,DiaoLuoNum do
		local Table = SpringFestival_BigMonsterTable[MonsterID]
		local gxa = Table.gxa
		local gxb = Table.gxb
		local mma = Table.mma
		local mmb = Table.mmb
		local JiangLi = math.random(1000000)
		for j in Table.Goodslist do
			local x = Table.Goodslist[j].x
			local y = Table.Goodslist[j].y
			if JiangLi >= x and JiangLi <= y then
				local GoodsID = Table.Goodslist[j].GoodsID
				local GoodsNum = Table.Goodslist[j].Num
				if GoodsID == 80498 then
					GoodsNum = math.random(gxa,gxb)
				elseif GoodsID == 80410 then
					GoodsNum = math.random(mma,mmb)
				end
				API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,'系统大年兽掉宝',4,0,600,60)
				break
			end
		end
	end
end

--节日特使对话，加在TASKNPC里，填NPCID，还要加上购买拜年帖、烟花、鞭炮等连接
function SpringFestival_ACTNPC_Title(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	local ZhuFu = SpringFestival_ZhuFuTable[math.random(14)]
	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
	API_ResponseWrite('<name>新年快乐</name>')
	API_ResponseWrite('<br><br><text size="16"  color="117,252,255">  '..ZhuFu..'</text><br><br>')
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		API_ResponseWrite('<br><text size="14">  新年好，如果您有“年兽的角”，可以在我这里抽取各种新年礼物。另外，您还可以在我这里购买年货。</text><br>')
		API_ResponseWrite('<br><br><br><a href="SpringFestival_ACTNPC_Shoping?1=1">  购买年货</a><text>      </text>')
		API_ResponseWrite('<a href="SpringFestival_ACTNPC_JiangLi?1=1">抽取礼物</a><text>      </text>')
		API_ResponseWrite('<a href="SpringFestival_LingHongBao?1=2">春节活动介绍</a><text>      </text>')
	elseif nShiFouEnd < 0 then
		API_ResponseWrite('<br><br><br><a href="SpringFestival_ACTNPC_JiangLi?1=1">  抽取礼物</a><text>      </text>')
		--API_ResponseWrite('<br><text size="14">  春节活动已经结束，谢谢您的参与，祝您游戏愉快。</text><br><br><br><br>')
	end
	API_ResponseWrite('<a>关闭</a><br>')
	API_ResponseFlush(ActorID)
end

SpringFestival_NianHuoTable = {
				[1] = {
					{GoodsID=857,Money=0,Point=88}, --拜年帖
					{GoodsID=11009,Money=0,Point=600}, --新年招财帽[男装]
					{GoodsID=11010,Money=0,Point=1200}, --新年招财装[男装]
					{GoodsID=11011,Money=0,Point=600}, --新年鸿运帽[女装]
					{GoodsID=11012,Money=0,Point=1200}, --新年鸿运装[女装]
					{GoodsID=853,Money=100,Point=0}, --鞭炮
					{GoodsID=858,Money=100,Point=0}, --字幕烟花 恭喜发财
					{GoodsID=859,Money=100,Point=0}, --字幕烟花 万事如意
					},
}

--购买年货
function SpringFestival_ACTNPC_Shoping()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	if SpringFestival_NianHuoTable[SelectItem] == nil then
		return
	end
	if type(SpringFestival_NianHuoTable[SelectItem]) ~= 'table' then
		return
	end
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if SpringFestival_NianHuoTable[SelectItem][BuyNo] ~= nil then
			local BuyGoodsID = SpringFestival_NianHuoTable[SelectItem][BuyNo].GoodsID
			local BuyPoint = SpringFestival_NianHuoTable[SelectItem][BuyNo].Point
			local BuyMoney = SpringFestival_NianHuoTable[SelectItem][BuyNo].Money
			local BuyNum = API_RequestGetNumber(num)
			if BuyNum < 1 then
				BuyNum = 1
			elseif BuyNum > 999 then
				BuyNum = 999
			end
			BuyMoney = BuyMoney * BuyNum
			BuyPoint = BuyPoint * BuyNum
			if BuyMoney > 0 then
				if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) >= BuyMoney then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
						if API_ActorAddMoney(ActorID,-BuyMoney,SpringFestival_NPCTskID,'购买春节年货扣钱') then
							API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'春节节日特使购买')
							API_ActorSendMsg(ActorID,2,'您花费 '..BuyMoney..' 金币购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							API_ActorSendMsg(ActorID,7,'您花费 '..BuyMoney..' 金币购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							--GLOBAL_FengXiangBiao_DateList[2][37].Date = GLOBAL_FengXiangBiao_DateList[2][37].Date + BuyMoney
						end
					else
						API_ActorSendMsg(ActorID,3,'背包空间不足，无法购买')
					end
				else
					API_ActorSendMsg(ActorID,3,'您的金币不够')
				end
			elseif BuyPoint > 0 then
				if API_ActorGetPropNum(ActorID,183) >= BuyPoint then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
						if API_UsePoint(ActorID,3,BuyGoodsID,1,BuyPoint) == 0 then
							API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'春节节日特使购买')
							API_ActorSendMsg(ActorID,2,'您花费 '..BuyPoint..' 点券购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							API_ActorSendMsg(ActorID,7,'您花费 '..BuyPoint..' 点券购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							--GLOBAL_FengXiangBiao_DateList[2][40].Date = GLOBAL_FengXiangBiao_DateList[2][40].Date + BuyPoint
						end
					else
						API_ActorSendMsg(ActorID,3,'背包空间不足，无法购买')
					end
				else
					API_ActorSendMsg(ActorID,3,'您的点券不够')
				end
			end
		end
		return
	end
	local GoodsNum = table.getn(SpringFestival_NianHuoTable[SelectItem])
	API_ResponseWrite('<name>年货</name>')
	API_ResponseWrite('<win rect="30,75,350,465"></win>')
	for i = 1,GoodsNum do
		if i > Page * 6 and i < (Page + 1) * 6 + 1 then
			local BuyGoodsID = SpringFestival_NianHuoTable[SelectItem][i].GoodsID
			local BuyPoint = SpringFestival_NianHuoTable[SelectItem][i].Point
			local BuyMoney = SpringFestival_NianHuoTable[SelectItem][i].Money
			API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
			API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
			local BuyNumTip = ''
			local BuyNumPointTip = '  购买单价：</text><text color="255,0,255">'..BuyPoint..'点券      '
			local BuyNumMoneyTip = '  购买单价：'..BuyMoney..'金币      '
			if BuyPoint == 0 then
				BuyNumTip = BuyNumMoneyTip
			elseif BuyPoint ~= 0 then
				BuyNumTip = BuyNumPointTip
			end
			local BuyNumTipLen = string.len(BuyNumTip)
			if BuyNumTipLen < 27 then
				for j = 1,27- BuyNumTipLen do
					BuyNumTip = BuyNumTip..' '
				end
			end
			API_ResponseWrite('<text>'..BuyNumTip..'</text>')
			local num = i * 100
			API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
			API_ResponseWrite('<text> </text>')
			API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" close="0" href="SpringFestival_ACTNPC_Shoping?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
			API_ResponseWrite('<text>—————————————————————————</text><br>')
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
			API_ResponseWrite('<br><text>     </text><img src="LuaUse\\button_back_g.bmp"><text>       </text>')
			API_ResponseWrite('<a href="SpringFestival_ACTNPC_Title">返回</a>')
			API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="SpringFestival_ACTNPC_Shoping?1='..SelectItem..'&2='..NextPage..'">')
		elseif (Page + 1) * 6 < GoodsNum then
			API_ResponseWrite('<br><text>     </text><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="SpringFestival_ACTNPC_Shoping?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
			API_ResponseWrite('<a href="SpringFestival_ACTNPC_Title">返回</a>')
			API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="SpringFestival_ACTNPC_Shoping?1='..SelectItem..'&2='..NextPage..'">')
		else
			API_ResponseWrite('<br><text>     </text><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="SpringFestival_ACTNPC_Shoping?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
			API_ResponseWrite('<a href="SpringFestival_ACTNPC_Title">返回</a>')
			API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_g.bmp">')
		end
	else
		API_ResponseWrite('<br><a href="SpringFestival_ACTNPC_Title">  返回</a>')
	end
end

SpringFestival_MonsterCornerDuiHuanTable = {
					[850] = {a=392670,b=926920,gxa=200,gxb=476,mma=150,mmb=395,
						Goodslist = {
								{GoodsID=80048,Num=1,x=1,y=37250},
								{GoodsID=80064,Num=1,x=37251,y=74670},
								{GoodsID=80083,Num=1,x=74671,y=94000},
								{GoodsID=80093,Num=1,x=94001,y=121330},
								{GoodsID=80103,Num=1,x=121331,y=132170},
								{GoodsID=80113,Num=1,x=132171,y=137420},
								{GoodsID=80123,Num=1,x=137421,y=141080},
								{GoodsID=80133,Num=1,x=141081,y=168750},
								{GoodsID=80181,Num=1,x=168751,y=188170},
								{GoodsID=80191,Num=1,x=188171,y=296250},
								{GoodsID=80383,Num=1,x=296251,y=328670},
								{GoodsID=80404,Num=1,x=328671,y=346920},
								{GoodsID=80408,Num=1,x=346921,y=366500},
								{GoodsID=27,Num=1,x=366501,y=368580},
								{GoodsID=28,Num=1,x=368581,y=372670},
								{GoodsID=29,Num=1,x=372671,y=377330},
								{GoodsID=30,Num=1,x=377331,y=382170},
								{GoodsID=32,Num=1,x=382171,y=387250},
								{GoodsID=33,Num=1,x=387251,y=389420},
								{GoodsID=80398,Num=1,x=389421,y=392670},
								},
						},
					[851] = {a=379830,b=900670,gxa=700,gxb=1382,mma=300,mmb=904,
						Goodslist = {
								{GoodsID=80049,Num=1,x=1,y=10080},
								{GoodsID=80065,Num=1,x=10081,y=40750},
								{GoodsID=80084,Num=1,x=40751,y=56920},
								{GoodsID=80094,Num=1,x=56921,y=98670},
								{GoodsID=80104,Num=1,x=98671,y=114330},
								{GoodsID=80114,Num=1,x=114331,y=124170},
								{GoodsID=80124,Num=1,x=124171,y=130750},
								{GoodsID=80134,Num=1,x=130751,y=144920},
								{GoodsID=80181,Num=1,x=144921,y=164330},
								{GoodsID=80191,Num=1,x=164331,y=272420},
								{GoodsID=80383,Num=1,x=272421,y=304830},
								{GoodsID=80404,Num=1,x=304831,y=323080},
								{GoodsID=80408,Num=1,x=323081,y=342670},
								{GoodsID=27,Num=1,x=342671,y=344750},
								{GoodsID=28,Num=1,x=344751,y=348830},
								{GoodsID=29,Num=1,x=348831,y=353500},
								{GoodsID=30,Num=1,x=353501,y=358330},
								{GoodsID=32,Num=1,x=358331,y=363420},
								{GoodsID=33,Num=1,x=363421,y=365580},
								{GoodsID=80399,Num=1,x=365581,y=369080},
								{GoodsID=40202,Num=1,x=369081,y=372420},
								{GoodsID=40218,Num=1,x=372421,y=375920},
								{GoodsID=40234,Num=1,x=375921,y=379250},
								{GoodsID=40250,Num=1,x=379251,y=379500},
								{GoodsID=40266,Num=1,x=379501,y=379830},
								},
						},
					[852] = {a=120833,b=829708,gxa=1300,gxb=2780,mma=500,mmb=1373,
						Goodslist = {
								{GoodsID=80050,Num=1,x=1,y=7500},
								{GoodsID=80066,Num=1,x=7501,y=17333},
								{GoodsID=80085,Num=1,x=17334,y=22417},
								{GoodsID=80095,Num=1,x=22418,y=26500},
								{GoodsID=80105,Num=1,x=26501,y=28667},
								{GoodsID=80115,Num=1,x=28668,y=31250},
								{GoodsID=80125,Num=1,x=31251,y=33083},
								{GoodsID=80135,Num=1,x=33084,y=36667},
								{GoodsID=80181,Num=1,x=36668,y=56083},
								{GoodsID=80192,Num=1,x=56084,y=57917},
								{GoodsID=80384,Num=1,x=57918,y=63417},
								{GoodsID=80405,Num=1,x=63418,y=67750},
								{GoodsID=80409,Num=1,x=67751,y=72083},
								{GoodsID=782,Num=1,x=72084,y=103000},
								{GoodsID=27,Num=1,x=103001,y=107167},
								{GoodsID=80279,Num=1,x=107168,y=111250},
								{GoodsID=80280,Num=1,x=111251,y=111500},
								{GoodsID=80400,Num=1,x=111501,y=112333},
								{GoodsID=80458,Num=1,x=112334,y=112583},
								{GoodsID=80459,Num=1,x=112584,y=112917},
								{GoodsID=80460,Num=1,x=112918,y=113167},
								{GoodsID=80461,Num=1,x=113168,y=113583},
								{GoodsID=80462,Num=1,x=113584,y=113833},
								{GoodsID=80463,Num=1,x=113834,y=114083},
								{GoodsID=80464,Num=1,x=114084,y=114250},
								{GoodsID=80465,Num=1,x=114251,y=114583},
								{GoodsID=80466,Num=1,x=114584,y=114917},
								{GoodsID=80550,Num=1,x=114918,y=115917},
								{GoodsID=80551,Num=1,x=115918,y=117333},
								{GoodsID=80552,Num=1,x=117334,y=118250},
								{GoodsID=80554,Num=1,x=118251,y=118917},
								{GoodsID=80555,Num=1,x=118918,y=119750},
								{GoodsID=40204,Num=1,x=119751,y=119833},
								{GoodsID=40206,Num=1,x=119834,y=119917},
								{GoodsID=40220,Num=1,x=119918,y=120000},
								{GoodsID=40222,Num=1,x=120001,y=120083},
								{GoodsID=40236,Num=1,x=120084,y=120167},
								{GoodsID=40238,Num=1,x=120168,y=120250},
								{GoodsID=40252,Num=1,x=120251,y=120417},
								{GoodsID=40254,Num=1,x=120418,y=120500},
								{GoodsID=40268,Num=1,x=120501,y=120750},
								{GoodsID=40270,Num=1,x=120751,y=120833},
								},
						},
					
}

--拿角抽奖
function SpringFestival_ACTNPC_JiangLi()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local PlayJW = API_GetActorExpLevel(ActorID)
	local PlayMoney = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD)
	local NeedGoodsID = 0
	if PlayJW < 11 then
		NeedGoodsID = 850
	elseif PlayJW > 10 and PlayJW < 26 then
		NeedGoodsID = 851
	elseif PlayJW > 25 and PlayJW < 41 then
		NeedGoodsID = 852
	else
		API_ActorSendMsg(ActorID,3,'很抱歉，暂时没有适合您爵位的奖品')
		return
	end
	if type(SpringFestival_MonsterCornerDuiHuanTable[NeedGoodsID]) ~= 'table' then
		return
	end
	local GoodsName = API_GetGoodsName(NeedGoodsID)
	local PackageSize = API_ActorGetPackageSize(ActorID)
	local MaxMoney = 5000000 - 1373 --玩家金币限制
	if XuanZe == 1 then
		API_ResponseWrite('<name>新年快乐</name>')
		API_ResponseWrite('<br><text>  新年好，根据您的爵位您需要使用 '..ChouJiangNeedNum..'个'..GoodsName..' 才可以抽取礼物：</text><br>')
		API_ResponseWrite('<br><a href="SpringFestival_ACTNPC_JiangLi?1=2">  使用'..GoodsName..'抽取礼物</a><text>      需要 '..ChouJiangNeedNum..' 个</text><img srcgd="'..NeedGoodsID..'" tipgd="'..NeedGoodsID..'"><br>')
		API_ResponseWrite('<br><br><a href="SpringFestival_ACTNPC_Title">  返回</a><br>')
	elseif XuanZe == 2 then
		if API_ActorGetGoodsNum(ActorID,NeedGoodsID) >= ChouJiangNeedNum then
			if PackageSize >= 1 then
				if PlayMoney <= MaxMoney then
					if API_ActorRemoveGoods(ActorID,NeedGoodsID,ChouJiangNeedNum,'春节抽奖消耗'..ChouJiangNeedNum..'个'.. GoodsName..'') then
						local Table = SpringFestival_MonsterCornerDuiHuanTable[NeedGoodsID]
						local JiangLi = math.random(1000000)
						local a = Table.a
						local b = Table.b
						local gxa = Table.gxa
						local gxb = Table.gxb
						local mma = Table.mma
						local mmb = Table.mmb
						if JiangLi <= a then
							for j in Table.Goodslist do
								local x = Table.Goodslist[j].x
								local y = Table.Goodslist[j].y
								if JiangLi >= x and JiangLi <= y then
									local GoodsID = Table.Goodslist[j].GoodsID
									local GoodsNum = Table.Goodslist[j].Num
									API_AddActorGoods(ActorID,GoodsID,GoodsNum,'抽取礼物获得 '..GoodsNum..'个 '.. API_GetGoodsName(GoodsID)..'')
									API_ResponseWrite('<text>使用 '..ChouJiangNeedNum..'个'..GoodsName..' 抽取礼物获得：</text>')
									API_ResponseWrite('<img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'">')
									API_ResponseWrite('<text> × '..GoodsNum..'</text><br>')
									API_ResponseWrite('<br><br><a href="SpringFestival_ACTNPC_JiangLi?1=1">返回</a><br>')
									return
								end
							end
						elseif JiangLi > a and JiangLi <= b then
							local GongXun = math.random(gxa,gxb)
							API_ActorAddExp(ActorID,GongXun,0,'春节活动抽奖获得功勋')
							API_ResponseWrite('<text>使用 '..ChouJiangNeedNum..'个'..GoodsName..' 抽取礼物获得：</text>')
							API_ResponseWrite('<img srcgd="'..Pub_VarExpGoodsID..'" tipgd="'..Pub_VarExpGoodsID..'" >')
							API_ResponseWrite('<text> × '..GongXun..'</text><br>')
							API_ResponseWrite('<br><br><a href="SpringFestival_ACTNPC_JiangLi?1=1">返回</a><br>')
						elseif JiangLi > b then
							local JinBi = math.random(mma,mmb)
							API_ActorAddMoneyUnStat(ActorID,JinBi,0,'兑换礼物获得 '..JinBi..' 金币')
							API_ResponseWrite('<text>使用 '..ChouJiangNeedNum..'个'..GoodsName..' 抽取礼物获得：</text>')
							API_ResponseWrite('<img srcgd="'..Pub_VarMoneryGoodsID..'" tipgd="'..Pub_VarMoneryGoodsID..'" >')
							API_ResponseWrite('<text> × '..JinBi..'</text><br>')
							API_ResponseWrite('<br><br><a href="SpringFestival_ACTNPC_JiangLi?1=1">返回</a><br>')
						end
						GLOBAL_FengXiangBiao_DateList[8][2].Date = GLOBAL_FengXiangBiao_DateList[8][2].Date + 1
					end
				else
					API_ResponseWrite('<text>您身上的金币太多了，不能抽取礼物。</text><br>')
					API_ResponseWrite('<br><br><a>确定</a><br>')
				end
			else
				API_ResponseWrite('<text>您的背包已满，无法抽取礼物。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<text>您没有足够的'..GoodsName..'，无法抽取礼物。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end
	end
end

SpringFestival_NPCLiWuTable = {
				[11773] = {
						{GoodsID=853}, --鞭炮
					},
				[11774] = {
						{GoodsID=858}, --春节烟花
						{GoodsID=859},
					},
				[11775] = {
						{GoodsID=845}, --变身糖过
					},
}

function SpringFestival_NPCLiWu(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		local JWDC = API_GetActorPeerageLevel(ActorID)
		if SpringFestival_NPCLiWuTable[NPCID] == nil then
			return
		end
		local PackageSize = API_ActorGetPackageSize(ActorID)
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local PlayOpenYMD = API_VarDataGetNumber(ActorID,1,19026)
		local PlayYear = math.floor(PlayOpenYMD/10000) --取年月日的商数
		local PlayMonthDay = math.mod(PlayOpenYMD,10000) --取年月日的余数
		local PlayMonth = math.floor(PlayMonthDay/100) --取年月日余数的商数
		local PlayDay = math.mod(PlayMonthDay,100) --取年月日余数的商数的余数
		if Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
			API_VarDataSetNumber(ActorID,1,19025,0)
		end
		local PlayOpenNum = API_VarDataGetNumber(ActorID,1,19025)
		local BiaoZhi = 0
		local OpenYi = math.floor(PlayOpenNum/100)
		local OpenErSan = math.mod(PlayOpenNum,100)
		local OpenEr = math.floor(OpenErSan/10)
		local OpenSan = math.mod(OpenErSan,10)
		local YMD = Year * 10000 + Month * 100 + Day
		if NPCID == 11773 then
			BiaoZhi = OpenYi
		elseif NPCID == 11774 then
			BiaoZhi = OpenEr
		elseif NPCID == 11775 then
			BiaoZhi = OpenSan
		end
		if BiaoZhi == 0 then
			if PackageSize >= 1 then
				local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
				if ConvectionInfo ~= 0 then
					API_ActorSendMsg(ActorID,3,'正在打开中，请稍后')
					API_ResponseEnd()
					API_ResponseClear()
				else
					local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
					local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
					API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
					local TimerTriggerID = API_CreateTimerTriggerG(ActorID,NPCID,1,5,'SpringFestival_NPCLiWu_TimerTriggerCallFunc')
					API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
					local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(GLOBAL_ConvectionTimer)
					API_ActorSendMsg(ActorID,2,'礼盒打开中……，需时'..GLOBAL_ConvectionTimerCN..'秒，打开期间请不要移动，否则将打开失败')
					StatusTimer = (GLOBAL_ConvectionTimer + 1) * 1000
					API_ActorAddStatus(ActorID,36003,StatusTimer)
					API_ActorShowProcess(ActorID,StatusTimer,410,360,'打开礼盒')
					API_ResponseEnd()
					API_ResponseClear()
				end
			else
				API_ActorSendMsg(ActorID,3,'您的背包已满，请整理一下再试')
				API_ResponseEnd()
				API_ResponseClear()
			end
		else
			API_ActorSendMsg(ActorID,3,'今天您已经领取过这个礼盒的礼物了')
			API_ResponseEnd()
			API_ResponseClear()
		end
	else
		API_ActorSendMsg(ActorID,3,'打不开哦，请在春节活动期间内[1月25日--1月31日]再来尝试吧。')
		API_ResponseEnd()
		API_ResponseClear()
	end 
end

function SpringFestival_NPCLiWu_TimerTriggerCallFunc(ActorID,NPCID)
	if API_ActorIsOnline(ActorID) then
		local JWDC = API_GetActorPeerageLevel(ActorID)
		if SpringFestival_NPCLiWuTable[NPCID] == nil then
			return
		end
		local PackageSize = API_ActorGetPackageSize(ActorID)
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local PlayOpenNum = API_VarDataGetNumber(ActorID,1,19025)
		local BiaoZhi = 0
		local OpenYi = math.floor(PlayOpenNum/100)
		local OpenErSan = math.mod(PlayOpenNum,100)
		local OpenEr = math.floor(OpenErSan/10)
		local OpenSan = math.mod(OpenErSan,10)
		local YMD = Year * 10000 + Month * 100 + Day
		if NPCID == 11773 then
			BiaoZhi = OpenYi
		elseif NPCID == 11774 then
			BiaoZhi = OpenEr
		elseif NPCID == 11775 then
			BiaoZhi = OpenSan
		end
		local CampID = API_GetActorCamp(ActorID)
		local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
		ConvectionInfo = math.mod(ConvectionInfo,1000000000)
		local ConvectionSign = math.floor(ConvectionInfo/100000000)
		local BackTileXYandTime = math.mod(ConvectionInfo,100000000)
		local BackTileYandTime = math.mod(BackTileXYandTime,100000)
		local BackTileX = math.floor(BackTileXYandTime/100000)
		local BackTileY = math.floor(BackTileYandTime/100)
		local Time = math.mod(BackTileYandTime,100)
		local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
		if TileX ~= BackTileX or TileY ~= BackTileY then
			API_ActorSendMsg(ActorID,3,'人物移动，打开失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'打开礼盒')
		elseif Time >= GLOBAL_ConvectionTimer then
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'打开礼盒')
			if BiaoZhi == 0 then
				if PackageSize >= 1 then
					local BiaoZhi2 = 0
					if NPCID == 11773 then
						BiaoZhi2 = (BiaoZhi+1) * 100 + OpenEr * 10 + OpenSan
					elseif NPCID == 11774 then
						BiaoZhi2 = OpenYi * 100 + (BiaoZhi+1) * 10 + OpenSan
					elseif NPCID == 11775 then
						BiaoZhi2 = OpenYi * 100 + OpenEr * 10 + (BiaoZhi+1)
					end
					API_VarDataSetNumber(ActorID,1,19025,BiaoZhi2)
					API_VarDataSetNumber(ActorID,1,19026,YMD)
					--给奖励					
					local GoodsID = 0
					if NPCID == 11774 then
						GoodsID = SpringFestival_NPCLiWuTable[NPCID][math.random(2)].GoodsID
					else
						GoodsID = SpringFestival_NPCLiWuTable[NPCID][1].GoodsID
					end
					API_AddActorGoodsFlag(ActorID,GoodsID,10,3,'打开'..API_GetMonsterNameByID(NPCID)..'获得10个'..API_GetGoodsName(GoodsID)..'')
					API_ActorSendMsg(ActorID,9,'打开'..API_GetMonsterNameByID(NPCID)..'获得10个'..API_GetGoodsName(GoodsID)..'')
					GLOBAL_FengXiangBiao_DateList[8][6].Date = GLOBAL_FengXiangBiao_DateList[8][6].Date + 1
				else
					API_ActorSendMsg(ActorID,3,'您的背包已满，请整理一下再试')
				end
			else
				API_ActorSendMsg(ActorID,3,'今天您已经领取过这个礼盒的礼物了')
			end
		else
			Time = Time + 1
			ConvectionInfo = ConvectionSign * 100000000 + TileX * 100000 + TileY * 100 + Time
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
		end
	end
end
