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

--~ 88876	年兔茸毛
--~ 88877	财神宝箱
--~ 88878	新年饺子
--~ 88879	福神礼盒
--~ 88880	爆竹
--~ 福神	12237
--~ 新年礼物兑换官	12242
--~ 大礼包	12243

SpringFestival_StartTime = {Year = 2010,Month = 1,Day = 1,Hour = 0,Minute = 0,Second = 0} --活动开始时间
SpringFestival_EndTime = {Year = 2035,Month = 12,Day = 31,Hour = 23,Minute = 59,Second = 59} --活动结束时间

SpringFestival_NPCTskID = 1452 --购买物品时使用的任务ID
SpringFestival_SummonsNum = 3 --召唤大年兽次数
SpringFestival_OpenBoxNum = 5 --免点券打开财神宝箱次数
SpringFestival_ChouJiangNeedNum = 2 --抽奖时消耗角的数量
SpringFestival_MascotBoxID = 89037

--活动地图和邪恶年兔ID表
SpringFestival_ACTMapTable = {
	[10] = {MonID=730606,MonNum=300,x1=80,y1=140,x2=410,y2=430,x3=111,y3=291,x4=154,y4=344,},
	[23] = {MonID=730606,MonNum=300,x1=80,y1=100,x2=410,y2=410,x3=107,y3=307,x4=160,y4=349,},
	[98] = {MonID=730607,MonNum=300,x1=177,y1=181,x2=578,y2=559,x3=326,y3=319,x4=442,y4=441,},
	[99] = {MonID=730607,MonNum=300,x1=180,y1=110,x2=570,y2=612,x3=348,y3=343,x4=399,y4=397,},
	[101] = {MonID=730608,MonNum=300,x1=282,y1=211,x2=620,y2=590,x3=423,y3=437,x4=443,y4=457,},
--~ 	[1956] = {XiaoNianShou=726064,DaNianShou=726070,CaiShenBaoXiang=854},
--~ 	[1957] = {XiaoNianShou=726066,DaNianShou=726071,CaiShenBaoXiang=855},
--~ 	[1959] = {XiaoNianShou=726068,DaNianShou=726072,CaiShenBaoXiang=856},
	} 

if SpringFestival_BigMonTable == nil then
	SpringFestival_BigMonTable = {
		[98] = {BigMonID=726459,MonNum=1,FastID=0,Tile={{266,366},{464,319},{406,468},{397,239},},},
		[99] = {BigMonID=726459,MonNum=1,FastID=0,Tile={{440,467},{324,271},{280,398},{367,490},},},
	}
end
--主城地图ID
SpringFestival_ZhuChengMapTable = {1,2,3,4,5,6,9,11,12,13,14,15,16,17,18,19,20,21,25,26,27,28,32,33,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,91,92,93,94,95,96,97,100,104,121,}
--不可召唤大年兽的地图ID
SpringFestival_NotZhaoHuanMapTable = {11,12,13,14,17,18,19,20,26,27,28,32,33,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,70,71,83,84,85,86,91,92,96,97}

if SpringFestival_MapMonsterTable == nil then --存每个地图的邪恶年兔
	SpringFestival_MapMonsterTable = {}
end

if SpringFestival_BigMonsterTable == nil then --存每个地图的大年兽
	SpringFestival_BigMonsterTable = {}
end

if SpringFestival_MascotTable == nil then --存每个地图的福神
	SpringFestival_MascotTable = {}
end

--建春节活动NPC
--if not API_IsEctypeServer() then
	
	--三个礼盒NPC，帝国和联邦共六个
	--DGBaoZhu = DGBaoZhu or API_CreateMonster(1,11773,239,322,5,0,-1) 
	--DGDaHeZi = DGDaHeZi or API_CreateMonster(1,12243,240,320,5,0,-1) 
	--DGXiaoHeZi = DGXiaoHeZi or API_CreateMonster(1,11775,241,321,5,0,-1) 
	--LBBaoZhu = LBBaoZhu or API_CreateMonster(2,11773,241,170,5,0,-1) 
	--LBDaHeZi = LBDaHeZi or API_CreateMonster(2,12243,242,168,5,0,-1) 
	--LBXiaoHeZi = LBXiaoHeZi or API_CreateMonster(2,11775,243,169,5,0,-1) 
--end
--活动触发器
if not API_IsBattleGameServer() then
	--SpringFestival_TimerTriggerID = SpringFestival_TimerTriggerID or API_CreateTimerTriggerG(0,0,60,-1,'SpringFestival_TimerTriggerGCallFunc')
end
	
function SpringFestival_TimerTriggerGCallFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		--创建NPC
		if not API_IsEctypeServer() and API_GetServerID() == 1 then
			LBSpringFestivalNPC = LBSpringFestivalNPC or API_CreateMonster(2,12242,232,137,4,0,-1)
			DGSpringFestivalNPC = DGSpringFestivalNPC or API_CreateMonster(1,12242,254,100,3,0,-1)
		end
		--福神送福
		if CJHD_FSSF == nil or CJHD_FSSF < 1 then
			CJHD_FSSF = 1
			SpringFestival_FSSFTimeFunc = SpringFestival_FSSFTimeFunc or API_CreateTimerTriggerG(0,0,300,1,'SpringFestival_Mascot_Create')
		end
		--除夕夜放大炮
		if Day == 2 and Hour == 23 then
			if math.mod(Minute,10) == 0 and API_GetServerID() == 1 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,'除夕时刻焰火盛宴将在23点59分在主城内开始，欢迎大家即时前往主城观赏！')
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8 ,'除夕时刻焰火盛宴将在23点59分在主城内开始，欢迎大家即时前往主城观赏！')
			end
		end
		if Day == 2 and Hour == 23 and Minute == 58 then
			SpringFestival_ChuXiYeFangPaoTimerTriggerGID = SpringFestival_ChuXiYeFangPaoTimerTriggerGID or API_CreateTimerTriggerG(1,2,1,-1,'SpringFestival_ChuXiYeFangPao_TimerTriggerCallFunc')
		end
		--财神宝箱
		if Hour >= 11 and Hour <= 13 then
			CJHD_CSCF = 0
			if math.mod(Minute,10) == 0 then
				if API_GetServerID() == 1 then
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,'天降财神活动将于14：00-16：00期间在阳光雨林、珊瑚群岛、落日农庄、娜纱湿地、月暮草场举行！欢迎大家参与！')
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8,'天降财神活动将于14：00-16：00期间在阳光雨林、珊瑚群岛、落日农庄、娜纱湿地、月暮草场举行！欢迎大家参与！')
				end
			end
		end
		if Hour >= 14 and Hour < 16 then
			if CJHD_CSCF == nil or CJHD_CSCF < 1 then
				CJHD_CSCF = 1
				if API_GetServerID() == 1 then
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,'天降财神活动现在开始！')
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8,'天降财神活动现在开始！')
				end
			end
			if math.mod(Minute,5) == 0 then
				if API_GetServerID() == 1 then
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,'天降财神活动正在各阳光雨林、珊瑚群岛、落日农庄、娜纱湿地、月暮草场热烈进行中，欢迎大家前往参与！')
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8,'天降财神活动正在各阳光雨林、珊瑚群岛、落日农庄、娜纱湿地、月暮草场热烈进行中，欢迎大家前往参与！')
				end
			end
			if math.mod(Minute,20) == 0 then
				if API_GetServerID() == 1 then
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,'财神已经在阳光雨林、珊瑚群岛、落日农庄、娜纱湿地、月暮草场内撒下大量“财运宝盒”，欢迎大家前往参与！')
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8,'财神已经在阳光雨林、珊瑚群岛、落日农庄、娜纱湿地、月暮草场内撒下大量“财运宝盒”，欢迎大家前往参与！')
				end
				SpringFestival_CaiShenBaoXiang()
			end
		elseif Hour >= 16 then
			if CJHD_CSCF == nil or CJHD_CSCF < 2 then
				CJHD_CSCF = 2
				if API_GetServerID() == 1 then
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,'今天的天降财神活动已经结束！谢谢您的参与！')
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8,'今天的天降财神活动已经结束！谢谢您的参与！')
				end
			end
		end
		--刷大邪恶年兔
		local TongZhiStartTime = API_DiffDatatime(Year,Month,Day,14,30,0)
		local TongZhiEndTime = API_DiffDatatime(Year,Month,Day,15,0,0)
		if TongZhiStartTime < 0 and TongZhiEndTime > 0 then
			CJHD_XXXX = 0 
			if API_GetServerID() == 1 and Minute == 30 or Minute == 45 or Minute == 55 then
			--if math.mod(Minute,10) == 0 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,'年兔也疯狂活动将于15：00-17：00期间在阳光雨林、珊瑚群岛、落日农庄、娜纱湿地、月暮草场举行！欢迎大家参与！')
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8 ,'年兔也疯狂活动将于15：00-17：00期间在阳光雨林、珊瑚群岛、落日农庄、娜纱湿地、月暮草场举行！欢迎大家参与！')
			end
		end
		local StartTime =  API_DiffDatatime(Year,Month,Day,15,0,0)
		local EndTime = API_DiffDatatime(Year,Month,Day,17,0,0)
		local EndTime2 = API_DiffDatatime(Year,Month,Day,17,30,0)
		if StartTime < 0 and EndTime > 0 then 
			if CJHD_XXXX == nil or CJHD_XXXX < 1 then
				CJHD_XXXX = 1
				if API_GetServerID() == 1 then
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,'年兔也疯狂活动现在开始！')
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8 ,'年兔也疯狂活动现在开始！')
				end
			end
			if math.mod(Minute,10) == 0 and API_GetServerID() == 1 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,'现在去阳光雨林、珊瑚群岛、落日农庄、娜纱湿地、月暮草场打邪恶年兔可以获得年兔茸毛，年兔茸毛可用于兑换奖励和召唤大年兽！')
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8 ,'现在去阳光雨林、珊瑚群岛、落日农庄、娜纱湿地、月暮草场打邪恶年兔可以获得年兔茸毛，年兔茸毛可用于兑换奖励和召唤大年兽！')
				--SpringFestival_Monster_TimeFunc = SpringFestival_Monster_TimeFunc or API_CreateTimerTriggerG(0,0,60,-1,'SpringFestival_Monster_CallFunc')
			end
			SpringFestival_Monster_CallFunc()
		end
		if Hour == 17 and Minute <= 20 then
			if CJHD_XXXX == nil or CJHD_XXXX < 2 then
				CJHD_XXXX = 2
				if API_GetServerID() == 1 then
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,'年兔也疯狂活动已经结束！')
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8 ,'年兔也疯狂活动已经结束！')
				end
				--创建大年兽
				--API_CreateTimerTriggerG(0,0,300,1,'SpringFestival_BigMonster_Create')
			end
		end
		if EndTime2 < 0 then
			if CJHD_XXXX == nil or CJHD_XXXX < 3 then
				CJHD_XXXX = 3
--~ 				if API_GetServerID() == 1 then
--~ 					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,'今天的辞旧迎新、挑战年兽王BOSS活动已经结束！')
--~ 					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8 ,'今天的辞旧迎新、挑战年兽王BOSS活动已经结束！')
--~ 				end
				--删除邪恶年兔
				for j in SpringFestival_ACTMapTable do
					local MapID = API_GetRightMapID(j)
					if API_MapIsValid(MapID) and type(SpringFestival_MapMonsterTable[MapID]) == 'table' then
						local MonID = SpringFestival_ACTMapTable[j].MonID
						local MonNum = SpringFestival_ACTMapTable[j].MonNum
						for i = 1,MonNum do
							local FastID = SpringFestival_MapMonsterTable[MapID][i]
							if FastID ~= nil and API_GetMonsterID(FastID) == MonID then
								API_DestroyMonster(FastID)
								SpringFestival_MapMonsterTable[MapID][i] = nil
							end
						end
					end
				end
			end
		end
	elseif nShiFouEnd < 0 then
		--删除福神
		for j in SpringFestival_ACTMapTable do
			local MapID = API_GetRightMapID(j)
			if API_MapIsValid(MapID) and SpringFestival_MascotTable[MapID] ~= nil and type(SpringFestival_MascotTable[MapID]) == 'table' then
				local MascotID = 12237
				local FastID = SpringFestival_MascotTable[MapID]
				if API_GetMonsterID(FastID) == MascotID then
					API_DestroyMonster(FastID)
					SpringFestival_MascotTable[MapID] = nil
				end
			end
		end
		if SpringFestival_FSSFTimeFunc ~= nil then
			API_DestroyTriggerG(SpringFestival_FSSFTimeFunc)
			SpringFestival_FSSFTimeFunc = nil
		end
		--删除活动NPC
		if LBSpringFestivalNPC ~= nil and API_GetMonsterID(LBSpringFestivalNPC) == 12242 then
			API_DestroyMonster(LBSpringFestivalNPC)
			LBSpringFestivalNPC = nil
		end
		if DGSpringFestivalNPC ~= nil and API_GetMonsterID(DGSpringFestivalNPC) == 12242 then
			API_DestroyMonster(DGSpringFestivalNPC)
			DGSpringFestivalNPC = nil
		end
		--删除大年兽
		for j in SpringFestival_BigMonTable do
			local MapID = API_GetRightMapID(j)
			if API_MapIsValid(MapID) then
				local BigMonID = SpringFestival_BigMonTable[j].BigMonID
				local FastID = SpringFestival_BigMonTable[j].FastID
				if API_GetMonsterID(FastID) == BigMonID then
					API_DestroyMonster(FastID)
					SpringFestival_BigMonTable[j].FastID = 0
				end
			end
		end
		API_DestroyTriggerG(TriggerID)
		if SpringFestival_TimerTriggerID ~= nil then
			API_DestroyTriggerG(TriggerID)
			SpringFestival_TimerTriggerID = nil
		end
	end
end
--刷新邪恶年兔
function SpringFestival_Monster_CallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local StartTime =  API_DiffDatatime(Year,Month,Day,15,0,0)
	local EndTime = API_DiffDatatime(Year,Month,Day,17,0,0)
	if StartTime < 0 and EndTime > 0 then 
		for j in SpringFestival_ACTMapTable do
			local MapID = API_GetRightMapID(j)
			if API_MapIsValid(MapID) then
				if SpringFestival_MapMonsterTable[MapID] == nil then SpringFestival_MapMonsterTable[MapID] = {} end
				local MonID = SpringFestival_ACTMapTable[j].MonID
				local MonNum = SpringFestival_ACTMapTable[j].MonNum
				local x1 = SpringFestival_ACTMapTable[j].x1
				local y1 = SpringFestival_ACTMapTable[j].y1
				local x2 = SpringFestival_ACTMapTable[j].x2
				local y2 = SpringFestival_ACTMapTable[j].y2
				local x3 = SpringFestival_ACTMapTable[j].x3
				local y3 = SpringFestival_ACTMapTable[j].y3
				local x4 = SpringFestival_ACTMapTable[j].x4
				local y4 = SpringFestival_ACTMapTable[j].y4
				local AI = 0
				AI = math.random(2692,2705)
				local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
				local PlayNum = 50
				if PlayList ~= nil then
					PlayNum = table.getn(PlayList)
				end
				local PlayMin = 10
				local PlayMax = 150
				if PlayNum <= PlayMin then
					MonNum = 20
				elseif PlayNum > PlayMin and PlayNum <= PlayMax then
					local PlayNum2 = PlayNum - PlayMin
					MonNum = 20 + PlayNum2 * 2
				end
				
				for i = 1,MonNum do
					if SpringFestival_MapMonsterTable[MapID][i] == nil then
						local x,y,Num = 0,0,0
						repeat
							Num = Num + 1
							x = math.random(x1,x2)
							y = math.random(y1,y2)
						until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
						local FastID = API_CreateMonster(MapID,MonID,x,y,5,AI,-1)
						API_CreateDieTriggerG(0,0,0,FastID,'SpringFestival_XiaoMonDiedDieFunc')
						SpringFestival_MapMonsterTable[MapID][i] = FastID
					else
						local FastID = SpringFestival_MapMonsterTable[MapID][i]
						if API_GetMonsterID(FastID) ~= MonID then
							local x,y,Num = 0,0,0
							repeat
								Num = Num + 1
								x = math.random(x1,x2)
								y = math.random(y1,y2)
							until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
							FastID = API_CreateMonster(MapID,MonID,x,y,5,AI,-1)
							API_CreateDieTriggerG(0,0,0,FastID,'SpringFestival_XiaoMonDiedDieFunc')
							SpringFestival_MapMonsterTable[MapID][i] = FastID
						end
					end
				end
			end
		end
	end
end
SpringFestival_XiaoMonDrop = {
	--10年春节用
	[726455] = {Cape=88876,Type=12,PinZhi=2,},
	[726456] = {Cape=88876,Type=4,PinZhi=2,},
	--11年春节用
	[730606] = {Cape=89038,Type=12,PinZhi=2,},
	[730607] = {Cape=89038,Type=1,PinZhi=2,},
	[730608] = {Cape=89038,Type=4,PinZhi=2,},
}
--邪恶年兔死亡掉落
function SpringFestival_XiaoMonDiedDieFunc(a,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if KillType ~= -1 and API_ActorIsOnline(KillerID) then
		local JiFen = API_VarDataGetNumber(KillerID,1,30237)
		JiFen = JiFen + 1
		API_VarDataSetNumber(KillerID,1,30237,JiFen)
	end
	if SpringFestival_XiaoMonDrop[MonsterID] ~= nil then
		local RD1 = math.random(100)
		if RD1 <= 3 then
			local Type = SpringFestival_XiaoMonDrop[MonsterID].Type
			local PinZhi = SpringFestival_XiaoMonDrop[MonsterID].PinZhi
			local GoodsID = YXD_WorldDropGoodsTab[Type][math.random(table.getn(YXD_WorldDropGoodsTab[Type]))]
			API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,1,0,'年兔掉落装备',GuiShuXing,GuiShuID,600,120,PinZhi) 
		end
		local RD2 = math.random(100)
		if RD2 <= 50 then
			local Cape = SpringFestival_XiaoMonDrop[MonsterID].Cape
			local GuiShuXing2 = GuiShuXing 
			if GuiShuXing == 4 then
				GuiShuXing2 = 0
			elseif GuiShuXing == 0 then
				GuiShuXing2 = 4
			end
			API_CreateDropGoods(MapID,PosX,PosY,Cape,1,0,'年兔掉落',GuiShuXing2,GuiShuID,600,120) --主人
		end
	end
end
--创建大年兽
function SpringFestival_BigMonster_Create(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local StartTime =  API_DiffDatatime(Year,Month,Day,17,00,0)
	local EndTime = API_DiffDatatime(Year,Month,Day,17,30,0)
	if StartTime < 0 and EndTime > 0 then 
		for j in SpringFestival_BigMonTable do
			local MapID = API_GetRightMapID(j)
			if API_MapIsValid(MapID) then
				local BigMonID = SpringFestival_BigMonTable[j].BigMonID
				local MonNum = SpringFestival_BigMonTable[j].MonNum
				local FastID = SpringFestival_BigMonTable[j].FastID
				local Tile = SpringFestival_BigMonTable[j].Tile
				if FastID == 0 or API_GetMonsterID(FastID) ~= BigMonID then
					local ab = Tile[math.random(table.getn(Tile))]
					local a = ab[1]
					local b = ab[2]
					local x,y,Num = 0,0,0
					repeat
						Num = Num + 1
						x = math.random(a-10,a+10)
						y = math.random(b-10,b+10)
					until not API_IsBlockTile(MapID,x,y,0) or Num == 500
					if not API_IsBlockTile(MapID,x,y,0) then
						FastID = API_CreateMonster(MapID,BigMonID,x,y,5,0,-1)
						SpringFestival_BigMonTable[j].FastID = FastID
						API_CreateDieTriggerG(j,0,0,FastID,'SpringFestival_BigDiedDieFunc')
						API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,''..API_GetMapName(MapID)..'的年兽王已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！（掉落物品所有人可拾取）')
						API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8 ,''..API_GetMapName(MapID)..'的年兽王已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！（掉落物品所有人可拾取）')
					end
				else
					if API_GetMonsterID(FastID) == BigMonID then
						local x,y= PublicFun_GetMonsterPosXY(FastID)
						API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,''..API_GetMapName(MapID)..'的年兽王已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！（掉落物品所有人可拾取）')
						API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8 ,''..API_GetMapName(MapID)..'的年兽王已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！（掉落物品所有人可拾取）')
					end
				end
			end
		end
	end
--~ 		if a == 0 and b == 0 then
--~ 			for j in SpringFestival_ACTMapTable do
--~ 				local MapID = API_GetRightMapID(j)
--~ 				if API_MapIsValid(MapID) then
--~ 					local BigMonID = SpringFestival_ACTMapTable[j].BigMonID
--~ 					local x1 = SpringFestival_ACTMapTable[j].x1
--~ 					local y1 = SpringFestival_ACTMapTable[j].y1
--~ 					local x2 = SpringFestival_ACTMapTable[j].x2
--~ 					local y2 = SpringFestival_ACTMapTable[j].y2
--~ 					local x3 = SpringFestival_ACTMapTable[j].x3
--~ 					local y3 = SpringFestival_ACTMapTable[j].y3
--~ 					local x4 = SpringFestival_ACTMapTable[j].x4
--~ 					local y4 = SpringFestival_ACTMapTable[j].y4
--~ 					if SpringFestival_BigMonsterTable[MapID] == nil then
--~ 						local x,y,Num = 0,0,0
--~ 						repeat
--~ 							Num = Num + 1
--~ 							x = math.random(x1,x2)
--~ 							y = math.random(y1,y2)
--~ 						until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
--~ 						if Num < 100 then
--~ 							local FastID = API_CreateMonster(MapID,BigMonID,x,y,5,0,-1)
--~ 							SpringFestival_BigMonsterTable[MapID] = FastID
--~ 							API_CreateDieTriggerG(j,0,0,FastID,'SpringFestival_BigDiedDieFunc')
--~ 							API_ActorBroadcastMsg(-1,17,''..API_GetMapName(MapID)..'的年兽王已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
--~ 							API_ActorBroadcastMsg(-1,8,''..API_GetMapName(MapID)..'的年兽王已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
--~ 						end
--~ 					else
--~ 						local FastID = SpringFestival_BigMonsterTable[MapID]
--~ 						if API_GetMonsterID(FastID) ~= BigMonID then
--~ 							local x,y,Num = 0,0,0
--~ 							repeat
--~ 								Num = Num + 1
--~ 								x = math.random(x1,x2)
--~ 								y = math.random(y1,y2)
--~ 							until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
--~ 							if Num < 100 then
--~ 								local FastID = API_CreateMonster(MapID,BigMonID,x,y,5,0,-1)
--~ 								SpringFestival_BigMonsterTable[MapID] = FastID
--~ 								API_CreateDieTriggerG(j,0,0,FastID,'SpringFestival_BigDiedDieFunc')
--~ 								API_ActorBroadcastMsg(-1,17,''..API_GetMapName(MapID)..'的年兽王已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
--~ 								API_ActorBroadcastMsg(-1,8,''..API_GetMapName(MapID)..'的年兽王已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
--~ 							end
--~ 						end
--~ 					end
--~ 				end
--~ 			end
--~ 		else
--~ 			if SpringFestival_ACTMapTable[a] ~= nil then
--~ 				if API_MapIsValid(b) then
--~ 					local BigMonID = SpringFestival_ACTMapTable[a].BigMonID
--~ 					local x1 = SpringFestival_ACTMapTable[a].x1
--~ 					local y1 = SpringFestival_ACTMapTable[a].y1
--~ 					local x2 = SpringFestival_ACTMapTable[a].x2
--~ 					local y2 = SpringFestival_ACTMapTable[a].y2
--~ 					local x3 = SpringFestival_ACTMapTable[a].x3
--~ 					local y3 = SpringFestival_ACTMapTable[a].y3
--~ 					local x4 = SpringFestival_ACTMapTable[a].x4
--~ 					local y4 = SpringFestival_ACTMapTable[a].y4
--~ 					if SpringFestival_BigMonsterTable[b] == nil then
--~ 						local x,y,Num = 0,0,0
--~ 						repeat
--~ 							Num = Num + 1
--~ 							x = math.random(x1,x2)
--~ 							y = math.random(y1,y2)
--~ 						until not API_IsBlockTile(b,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
--~ 						if Num < 100 then
--~ 							local FastID = API_CreateMonster(b,BigMonID,x,y,5,0,-1)
--~ 							SpringFestival_BigMonsterTable[b] = FastID
--~ 							API_CreateDieTriggerG(a,0,0,FastID,'SpringFestival_BigDiedDieFunc')
--~ 							API_ActorBroadcastMsg(-1,17,''..API_GetMapName(b)..'的年兽王已经在'..API_GetMapName(b)..'的'..API_TileToPixelX(b,x,y)..','..API_TileToPixelY(b,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
--~ 							API_ActorBroadcastMsg(-1,8,''..API_GetMapName(b)..'的年兽王已经在'..API_GetMapName(b)..'的'..API_TileToPixelX(b,x,y)..','..API_TileToPixelY(b,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
--~ 						end
--~ 					else
--~ 						local FastID = SpringFestival_BigMonsterTable[b]
--~ 						if API_GetMonsterID(FastID) ~= BigMonID then
--~ 							local x,y,Num = 0,0,0
--~ 							repeat
--~ 								Num = Num + 1
--~ 								x = math.random(x1,x2)
--~ 								y = math.random(y1,y2)
--~ 							until not API_IsBlockTile(b,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
--~ 							if Num < 100 then
--~ 								local FastID = API_CreateMonster(b,BigMonID,x,y,5,0,-1)
--~ 								SpringFestival_BigMonsterTable[b] = FastID
--~ 								API_CreateDieTriggerG(a,0,0,FastID,'SpringFestival_BigDiedDieFunc')
--~ 								API_ActorBroadcastMsg(-1,17,''..API_GetMapName(b)..'的年兽王已经在'..API_GetMapName(b)..'的'..API_TileToPixelX(b,x,y)..','..API_TileToPixelY(b,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
--~ 								API_ActorBroadcastMsg(-1,8,''..API_GetMapName(b)..'的年兽王已经在'..API_GetMapName(b)..'的'..API_TileToPixelX(b,x,y)..','..API_TileToPixelY(b,x,y)..'出现，勇敢的英雄们赶紧去挑战吧！')
--~ 							end
--~ 						end
--~ 					end
--~ 				end
--~ 			end
--~ 		end
end
--大年兽掉落表
SpringFestival_YearMonDrop = {
	--召唤大年兽25级
	[726457] = {
		[1] = {
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80383,GoodsNum=1,GaiLv=300000,PinZhi=0},
			{GoodsID=80381,GoodsNum=1,GaiLv=300000,PinZhi=0},
			},
		[2] = {
			{LeiXing=17,GaiLv=1000000,Num=1,PinZhi=2,},
			},
		},
	--召唤大年兽40级
	[726458] = {
		[1] = {
			{GoodsID=80696,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=10,GaiLv=1000000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=300000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=300000,PinZhi=0},
			},
		[2] = {
			{LeiXing=3,GaiLv=1000000,Num=1,PinZhi=2,},
			},
		},
	--系统大年兽40级
	[726459] = {
		[1] = {
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80410,GoodsNum=100,GaiLv=1000000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80387,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80387,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80387,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=12,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=25,GaiLv=1000000,PinZhi=0},
			{GoodsID=796,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=796,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=31020,GoodsNum=1,GaiLv=10000,PinZhi=0},
			{GoodsID=31021,GoodsNum=1,GaiLv=10000,PinZhi=0},
			{GoodsID=88880,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88880,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88880,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88880,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88880,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88880,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88880,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88880,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88880,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88880,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88879,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88879,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88879,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88879,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88879,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88879,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88879,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88879,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88877,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88877,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88877,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88877,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88877,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88877,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88877,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88877,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88877,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88877,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=31026,GoodsNum=1,GaiLv=300000,PinZhi=0},
			{GoodsID=80192,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80192,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80192,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80192,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80409,GoodsNum=1,GaiLv=500000,PinZhi=0},
			},
		[2] = {
			{LeiXing=1,GaiLv=500000,Num=1,PinZhi=6,},
			{LeiXing=2,GaiLv=500000,Num=1,PinZhi=6,},
			{LeiXing=3,GaiLv=500000,Num=1,PinZhi=6,},
			},
		},
}
--大年兽死亡掉落
function SpringFestival_BigDiedDieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local Time = os.time() 
	local EndTime = os.date("*t", os.time()) 
	EndTime.year = Year
	EndTime.month = Month
	EndTime.day = Day
	EndTime.hour = 22 
	EndTime.min = 30 
	EndTime.sec = 0 
	local EndTime2 = os.time(EndTime) 
	local CampID = API_GetActorCamp(KillerID)
	local CampName = GLOBAL_CampName[CampID]
	--掉东西
	if SpringFestival_YearMonDrop[MonsterID] ~= nil then
		local MonName = API_GetMonsterNameByID(MonsterID)
		local Table = SpringFestival_YearMonDrop[MonsterID]
		local LinShiTable = {}
		for j in Table[1] do
			local RD = math.random(1000000)
			local GoodsID = Table[1][j].GoodsID
			local GoodsNum = Table[1][j].GoodsNum
			local GaiLv = Table[1][j].GaiLv
			local PinZhi = Table[1][j].PinZhi
			local GoodsName = API_GetGoodsName(GoodsID)
			if RD <= GaiLv then
				local XuHao = table.getn(LinShiTable) + 1
				if LinShiTable[XuHao] == nil then
					LinShiTable[XuHao] = {}
				end
				LinShiTable[XuHao].GoodsID = GoodsID
				LinShiTable[XuHao].GoodsNum = GoodsNum
				LinShiTable[XuHao].PinZhi = PinZhi
			end
		end
		for i in Table[2] do
			local RD = math.random(1000000)
			local GoodsID = 0
			local LeiXing = Table[2][i].LeiXing
			local GaiLv = Table[2][i].GaiLv
			local GoodsNum = Table[2][i].Num
			local PinZhi = Table[2][i].PinZhi
			if RD <= GaiLv then
				if YXD_WorldDropGoodsTab[LeiXing] ~= nil then
					GoodsID = YXD_WorldDropGoodsTab[LeiXing][math.random(table.getn(YXD_WorldDropGoodsTab[LeiXing]))]
					local GoodsName = API_GetGoodsName(GoodsID)
					local XuHao = table.getn(LinShiTable) + 1
					if LinShiTable[XuHao] == nil then
						LinShiTable[XuHao] = {}
					end
					LinShiTable[XuHao].GoodsID = GoodsID
					LinShiTable[XuHao].GoodsNum = GoodsNum
					LinShiTable[XuHao].PinZhi = PinZhi
				end
			end
		end
		local ShiZhuangTab = {11137,11138,11139,11140,}
		if math.random(100) <= 30 then
			local GoodsID = ShiZhuangTab[math.random(table.getn(ShiZhuangTab))]
			local XuHao = table.getn(LinShiTable) + 1
			if LinShiTable[XuHao] == nil then
				LinShiTable[XuHao] = {}
			end
			LinShiTable[XuHao].GoodsID = GoodsID
			LinShiTable[XuHao].GoodsNum = 1
			LinShiTable[XuHao].PinZhi = 0
		end
		local DiaoLuoTable = {}
		while table.getn(LinShiTable) > 0 do
			local XuHao = table.getn(DiaoLuoTable) + 1
			local RandomXuHao = math.random(table.getn(LinShiTable))
			if DiaoLuoTable[XuHao] == nil then
				DiaoLuoTable[XuHao] = {}
			end
			DiaoLuoTable[XuHao].GoodsID = LinShiTable[RandomXuHao].GoodsID
			DiaoLuoTable[XuHao].GoodsNum = LinShiTable[RandomXuHao].GoodsNum
			DiaoLuoTable[XuHao].PinZhi = LinShiTable[RandomXuHao].PinZhi
			table.remove(LinShiTable,RandomXuHao)
		end
		for j in DiaoLuoTable do
			local GoodsID = DiaoLuoTable[j].GoodsID
			local GoodsNum = DiaoLuoTable[j].GoodsNum
			local PinZhi = DiaoLuoTable[j].PinZhi
			local GoodsName = API_GetGoodsName(GoodsID)
			if PinZhi > 0 then
				if API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',0,0,600,120,PinZhi) == true then
					
				end
			else
				if API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',4,0,600,120) == true then
					if GoodsID >= 11137 and GoodsID <= 11140 then
						API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, '年兽王死亡，掉落了：'..API_GetGoodsName(GoodsID)..'')
					end
				end
			end
		end
	--再刷一只年兽，并通告
	--local RDTime = math.random(20,40) * 60
	--if Time + RDTime < EndTime2 then
	--	API_CreateTimerTriggerG(MapConfigID,MapID,RDTime,1,'SpringFestival_BigMonster_Create')
		API_ActorBroadcastMsg(MapID,17,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的勇士'..API_GetActorName(KillerID)..'杀死！它凶恶的吼道：凡人，我还会再回来的！')
		API_ActorBroadcastMsg(MapID,8,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的勇士'..API_GetActorName(KillerID)..'杀死！它凶恶的吼道：凡人，我还会再回来的！')
	--else
	--	API_ActorBroadcastMsg(MapID,17,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的'..API_GetActorName(KillerID)..'杀死！')
	--	API_ActorBroadcastMsg(MapID,8,''..API_GetMonsterNameByID(MonsterID)..'被'..CampName..'的'..API_GetActorName(KillerID)..'杀死！')
	end
end
--创建福神NPC
function SpringFestival_Mascot_Create(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		if a == 0 and b == 0 then
			for j in SpringFestival_ACTMapTable do
				local MapID = API_GetRightMapID(j)
				if API_MapIsValid(MapID) then
					local MascotID = 12237
					local x1 = SpringFestival_ACTMapTable[j].x1
					local y1 = SpringFestival_ACTMapTable[j].y1
					local x2 = SpringFestival_ACTMapTable[j].x2
					local y2 = SpringFestival_ACTMapTable[j].y2
					local x3 = SpringFestival_ACTMapTable[j].x3
					local y3 = SpringFestival_ACTMapTable[j].y3
					local x4 = SpringFestival_ACTMapTable[j].x4
					local y4 = SpringFestival_ACTMapTable[j].y4
					if SpringFestival_MascotTable[MapID] == nil then
						local x,y,Num = 0,0,0
						repeat
							Num = Num + 1
							x = math.random(x1,x2)
							y = math.random(y1,y2)
						until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
						if Num < 100 then
							local FastID = API_CreateMonster(MapID,MascotID,x,y,5,0,-1)
							SpringFestival_MascotTable[MapID] = FastID
							--API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,'福神已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，回答福神的问题可获得福神赐福！')
							--API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8 ,'福神已经在'..API_GetMapName(MapID)..'的'..API_TileToPixelX(MapID,x,y)..','..API_TileToPixelY(MapID,x,y)..'出现，回答福神的问题可获得福神赐福！')
							API_ActorBroadcastMsgEx(MapID, -1, 0, 17, '福神已经在'..API_GetMapName(MapID)..'出现，回答福神的问题可获得福神赐福！')
							API_ActorBroadcastMsgEx(MapID, -1, 0, 8, '福神已经在'..API_GetMapName(MapID)..'出现，回答福神的问题可获得福神赐福！')
						end
					end
				end
			end
		else
			if SpringFestival_ACTMapTable[a] ~= nil then
				if API_MapIsValid(b) then
					local MascotID = 12237
					local x1 = SpringFestival_ACTMapTable[a].x1
					local y1 = SpringFestival_ACTMapTable[a].y1
					local x2 = SpringFestival_ACTMapTable[a].x2
					local y2 = SpringFestival_ACTMapTable[a].y2
					local x3 = SpringFestival_ACTMapTable[a].x3
					local y3 = SpringFestival_ACTMapTable[a].y3
					local x4 = SpringFestival_ACTMapTable[a].x4
					local y4 = SpringFestival_ACTMapTable[a].y4
					local x,y,Num = 0,0,0
					repeat
						Num = Num + 1
						x = math.random(x1,x2)
						y = math.random(y1,y2)
					until not API_IsBlockTile(b,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
					if Num < 100 then
						local FastID = API_CreateMonster(b,MascotID,x,y,5,0,-1)
						SpringFestival_MascotTable[b] = FastID
						--API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17,'福神已经在'..API_GetMapName(b)..'的'..API_TileToPixelX(b,x,y)..','..API_TileToPixelY(b,x,y)..'出现，回答福神的问题可获得福神赐福！')
						--API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 8 ,'福神已经在'..API_GetMapName(b)..'的'..API_TileToPixelX(b,x,y)..','..API_TileToPixelY(b,x,y)..'出现，回答福神的问题可获得福神赐福！')
						API_ActorBroadcastMsgEx(b, -1, 0, 17, '福神已经在'..API_GetMapName(b)..'出现，回答福神的问题可获得福神赐福！')
						API_ActorBroadcastMsgEx(b, -1, 0, 8, '福神已经在'..API_GetMapName(b)..'出现，回答福神的问题可获得福神赐福！')
					end
				end
			end
		end
	end
end
--福神对话
function SpringFestival_Mascot_Question(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local MonsterID = API_VarDataGetNumber(ActorID,0,32711)
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	local Sex = API_GetActorSex(ActorID)
	local Name = API_GetActorName(ActorID)
	local MapID = API_GetActorMapID(ActorID) 
	local MapConfigID = API_GetMapConfigID(MapID)
	local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	local PackageSize = API_ActorGetPackageSize(ActorID)
	if API_GetMonsterID(FastID) ~= 12237 then
		API_ResponseWrite('<text>福神已经走了，待下次有缘再见吧。</text><br>') 
		API_ResponseWrite('<br><a>关闭</a><br>')
		return
	end
	if XuanZe == 1 then
		if PackageSize <= 0 then
			API_ResponseWrite('<text>哎呀哎呀，你的背包满了，我怎么给你赐福呐？</text><br>') 
			API_ResponseWrite('<br><a>我清理下……</a><br>')
			return
		end
		local QuestionNo = math.random(table.getn(ZhiShiDaRen_QuestionList)) --在问题表中随机取出问题序号					
		if API_VarDataGetNumber(ActorID,1,19208) > 0 then					
			QuestionNo = API_VarDataGetNumber(ActorID,1,19208) --获取当前随机到的题目
		end
		local Question = ZhiShiDaRen_QuestionList[QuestionNo]                 --取出当前问题序号所对应的问题
		if Question == nil then
			QuestionNo = 459
			Question = ZhiShiDaRen_QuestionList[QuestionNo]
		end	
		API_VarDataSetNumber(ActorID,1,19208,QuestionNo)
		local Answer= ZhiShiDaRen_TrueAnswerList[QuestionNo].TrueAnswer 	  --找出当前问题的对应答案
		local LinShi = {}
		for i = 1,table.getn(ZhiShiDaRen_AnswerList[QuestionNo]) do
			LinShi[i] = ZhiShiDaRen_AnswerList[QuestionNo][i]
		end
		LinShiBC = table.getn(LinShi)
		local LinShi2 = {}
		local TureDaAn = 1
		while LinShiBC > 0 do
			local XH = math.random(LinShiBC)
			LinShi2BC = table.getn(LinShi2)
			LinShi2[LinShi2BC+1] = LinShi[XH]
			LinShiBC = LinShiBC -1
			if LinShi[XH] == Answer then
				TrueDaAn = table.getn(LinShi2)
			end
			--删除LinShi表里面XH这一行
			table.remove(LinShi,XH)
		end
		--将LinShi2表里的内容展现给玩家看和选择
		API_ResponseWrite('<br><text>看仔细呐，可不要答错了哦~</text><br>')
		API_ResponseWrite('<br><text>'..Question..'</text><br>')
		for i =1,table.getn(LinShi2) do
			local ABC = 0
			if i == TrueDaAn then
				ABC = 1
			end
			API_ResponseWrite('<br><a href="SpringFestival_Mascot_Question?1=2&2='..ABC..'&3='..QuestionNo..'" color="255,255,255">'..i..'、'..LinShi2[i]..'</a><br>')
		end
		API_ResponseFlush(ActorID)
	elseif XuanZe == 2 then
		if PackageSize <= 0 then
			API_ResponseWrite('<text>哎呀哎呀，你的背包满了，我怎么给你赐福呐？</text><br>') 
			API_ResponseWrite('<br><a>我清理下……</a><br>')
			return
		end
		local ZhiShiDaRen_Ture = API_RequestGetNumber(2)
		local QuestionNo = API_RequestGetNumber(3)
		if ZhiShiDaRen_Ture == 1 and API_VarDataGetNumber(ActorID,1,19208) == QuestionNo then
			API_DestroyMonster(FastID)
			API_VarDataSetNumber(ActorID,1,19208,0)
			API_AddMagicToMap(MapID,PlayX,PlayY, 464)
			if Sex == 1 then
				API_ResponseWrite('<text>小伙子真厉害。</text><br>') 
			else
				API_ResponseWrite('<text>小姑娘真不错。</text><br>') 
			end
			API_ResponseWrite('<br><text>这个 福神锦袋 就送给你了，本神去也~</text><br>') 
			API_ResponseWrite('<br><a>谢谢福神</a><br>')
			API_AddActorGoods(ActorID, SpringFestival_MascotBoxID, 1, '福神赐福')
			API_ActorBroadcastMsgEx(MapID,-1,0,17,''..Name..'通过了福神的考验，获得了福神锦袋！')
			API_ActorBroadcastMsgEx(MapID,-1,0,17,'福神：福神锦袋已经发放完毕，本福神要去其他地方赐福咯！有缘再见！')
			--再刷一个福神
			local RDTime = math.random(30,60) * 60
			API_CreateTimerTriggerG(MapConfigID,MapID,RDTime,1,'SpringFestival_Mascot_Create')
		else
			API_DestroyMonster(FastID)
			if Sex == 1 then
				API_ResponseWrite('<text>小伙子，你居然答错了……</text><br>') 
			else
				API_ResponseWrite('<text>小姑娘，你居然答错了……</text><br>') 
			end
			API_ResponseWrite('<br><text>看样子你是没这个福气了，下次有缘再见吧~</text><br>') 
			API_ResponseWrite('<br><a>有缘再见</a><br>')
			API_ActorBroadcastMsgEx(MapID,-1,0,17,''..Name..'没有通过福神的考验，福神已经去其他地方赐福了！')
			--再刷一个福神
			local RDTime = math.random(10,20) * 60
			API_CreateTimerTriggerG(MapConfigID,MapID,RDTime,1,'SpringFestival_Mascot_Create')
		end
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 1
		if GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] + 1
		end
	else
		if Sex == 1 then
			API_ResponseWrite('<text>新年好啊，小伙子。</text><br>') 
		else
			API_ResponseWrite('<text>新年好啊，小姑娘。</text><br>') 
		end
		API_ResponseWrite('<br><text>    能遇见我是你的福气，不过我可不是那种随随便便就赐福给人的神呐，如果你能回答正确我提出的题目，我就赐福于你，如何？</text><br>') 
		API_ResponseWrite('<br><a href="SpringFestival_Mascot_Question?1=1">  我要答题，我要赐福</a><br>')
		API_ResponseWrite('<br><a>  真小气，我走了</a><br>')
	end
end
--除夕放炮
function SpringFestival_ChuXiYeFangPao_TimerTriggerCallFunc(DGMapID,LBMapID)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Day == 2 and Minute == 59 then
		if Second == 50 then
			for i,v in SpringFestival_ZhuChengMapTable do
				local MapFastID = API_GetRightMapID(v)
				API_BroadcastScreenEffect(MapFastID,2) --出现倒数数字
			end
		end
	elseif Day == 3 and Minute == 0 then
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
--~ 	local LaiYuan = API_ActorGetPropNum(ActorID,201)
--~ 	if GLOBAL_FengXiangBiao_DateList[8][7][LaiYuan] == nil then
--~ 		GLOBAL_FengXiangBiao_DateList[8][7][LaiYuan] = 1
--~ 	else
--~ 		GLOBAL_FengXiangBiao_DateList[8][7][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][7][LaiYuan] + 1
--~ 	end
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
	--API_ActorCallBack(API_GetRightMapID(1),0,-1,'SpringFestival_PlaySound')
	--API_ActorCallBack(API_GetRightMapID(2),0,-1,'SpringFestival_PlaySound')
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
	--API_ActorCallBack(API_GetRightMapID(1),0,-1,'SpringFestival_PlaySound')
	--API_ActorCallBack(API_GetRightMapID(2),0,-1,'SpringFestival_PlaySound')
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
	--API_ActorCallBack(API_GetRightMapID(1),0,-1,'SpringFestival_PlaySound')
	--API_ActorCallBack(API_GetRightMapID(2),0,-1,'SpringFestival_PlaySound')
end

function SpringFestival_PlaySound(ActorID)
	--if math.floor(math.random(100),3) == 0 then
		API_ActorPlaySound(ActorID,10162) --鞭炮
	--end
	--if math.floor(math.random(100),3) == 0 then
		API_ActorPlaySound(ActorID,10163) --烟花
	--end
end

--刷财运宝盒 89039
function SpringFestival_CaiShenBaoXiang()
	for j in SpringFestival_ACTMapTable do
		local MapID = API_GetRightMapID(j)
		if API_MapIsValid(MapID) then
			local x1 = SpringFestival_ACTMapTable[j].x1
			local y1 = SpringFestival_ACTMapTable[j].y1
			local x2 = SpringFestival_ACTMapTable[j].x2
			local y2 = SpringFestival_ACTMapTable[j].y2
			local x3 = SpringFestival_ACTMapTable[j].x3
			local y3 = SpringFestival_ACTMapTable[j].y3
			local x4 = SpringFestival_ACTMapTable[j].x4
			local y4 = SpringFestival_ACTMapTable[j].y4
			for i = 1,666 do
				local x,y,Num = 0,0,0
				repeat
					Num = Num + 1
					x = math.random(x1,x2)
					y = math.random(y1,y2)
				until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
				if Num < 100 then
					API_CreateDropGoods(MapID,x,y,89039,1,3,'宝箱献礼',4,0,600,60)
				end
			end
		end
	end
--~ 	if API_IsEctypeServer() then
--~ 		if API_GetServerID() == 11 then
--~ 			local MapID = API_VarDataGetNumber_Ex(1,0,-1,1,1)
--~ 			local CaiShenBaoXiang = SpringFestival_ACTMapTable[1956].CaiShenBaoXiang
--~ 			if API_MapIsValid(MapID) then
--~ 				for i = 1,666 do
--~ 					local x,y
--~ 					repeat
--~ 						x = math.random(625)
--~ 						y = math.random(624)
--~ 					until not API_IsBlockTile(MapID,x,y,0)
--~ 					API_CreateDropGoods(MapID,x,y,CaiShenBaoXiang,1,3,'宝箱献礼',4,0,600,0)
--~ 				end
--~ 			end
--~ 		end
--~ 		if API_GetServerID() == 12 then
--~ 			local MapID = API_VarDataGetNumber_Ex(1,0,-1,1,2)
--~ 			local CaiShenBaoXiang = SpringFestival_ACTMapTable[1957].CaiShenBaoXiang
--~ 			if API_MapIsValid(MapID) then
--~ 				for i = 1,666 do
--~ 					local x,y
--~ 					repeat
--~ 						x = math.random(625)
--~ 						y = math.random(624)
--~ 					until not API_IsBlockTile(MapID,x,y,0)
--~ 					API_CreateDropGoods(MapID,x,y,CaiShenBaoXiang,1,3,'宝箱献礼',4,0,600,0)
--~ 				end
--~ 			end
--~ 			MapID = API_VarDataGetNumber_Ex(1,0,-1,1,4)
--~ 			CaiShenBaoXiang = SpringFestival_ACTMapTable[1959].CaiShenBaoXiang
--~ 			if API_MapIsValid(MapID) then
--~ 				for i = 1,666 do
--~ 					local x,y
--~ 					repeat
--~ 						x = math.random(625)
--~ 						y = math.random(624)
--~ 					until not API_IsBlockTile(MapID,x,y,0)
--~ 					API_CreateDropGoods(MapID,x,y,CaiShenBaoXiang,1,3,'宝箱献礼',4,0,600,0)
--~ 				end
--~ 			end
--~ 		end
--~ 	else
--~ 	end
end

--上线给卷轴，设置在线时间
function SpringFestival_OnLogin(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if MapConfigID == 96 or MapConfigID == 97 then
		return
	end
	if API_GetActorExpLevel(ActorID) <= 10 then
		return
	end
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		if MapID == StaticMapID then
--~ 			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
--~ 			local PlayYMD = API_VarDataGetNumber(ActorID,1,19027)
--~ 			local PlayYear = math.floor(PlayYMD/10000) --取年月日的商数
--~ 			local PlayMonthDay = math.mod(PlayYMD,10000) --取年月日的余数
--~ 			local PlayMonth = math.floor(PlayMonthDay/100) --取年月日余数的商数
--~ 			local PlayDay = math.mod(PlayMonthDay,100) --取年月日余数的商数的余数
--~ 			local YMD = Year * 10000 + Month * 100 + Day
--~ 			if Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
--~ 				API_VarDataSetNumber(ActorID,1,19027,YMD)
--~ 				local LaiYuan = API_ActorGetPropNum(ActorID,201)
--~ 				if GLOBAL_FengXiangBiao_DateList[8][2][LaiYuan] == nil then
--~ 					GLOBAL_FengXiangBiao_DateList[8][2][LaiYuan] = 1
--~ 				else
--~ 					GLOBAL_FengXiangBiao_DateList[8][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][2][LaiYuan] + 1
--~ 				end
--~ 			end
			API_RemoveTaskScroll(ActorID,50002)
			--LRY_UItwinkemanage(ActorID,12,55,104100,50002,33,'SpringFestival_JuanZhou')
			API_AddTaskScroll(ActorID,50002,104100,'SpringFestival_JuanZhou')
			local ZhuFu = SpringFestival_ZhuFuTable[math.random(14)]
			API_ActorSendMsg(ActorID,1,''..ZhuFu..'')
		end
	end
end

--GLOBAL_ActMain_OnLoginFuncNameList = {}
--GLOBAL_ActMain_OnLoginMapFuncNameList = {}
--上线判断
local OnLoginLoadOK = 0
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
end

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
	API_ResponseWrite('<name>便捷功能</name>')
	API_ResponseWrite('<win rect="80,350,830,270"></win>')
	API_ResponseWrite('<br><text size="14">  在主城出口的</text><text size="14" color="117,252,255">签到达人</text><text size="14">处有各种节日道具出售。</text><br>')
	if HongBao == 0 then
		API_ResponseWrite('<br><text size="14" color="255,0,255">  您今天还未领取寒风结晶。</text><br>')
	else
		API_ResponseWrite('<br><text size="14" color="255,0,255">  您已经领取过寒风结晶了。</text><br>')
	end
	API_ResponseWrite('<br><a href="SpringFestival_LingHongBao?1=1">  领取寒风结晶</a><text>      </text>')
	API_ResponseWrite('<a href="SpringFestival_ClearBag?1=1">  清空背包</a><text>      </text>')
	API_ResponseWrite('<a href="SpringFestival_GotoHome?1=1">  免费回城</a><text>      </text>')
	API_ResponseWrite('<a href="BossShuaXinBiao_Show">  BOSS刷新表</a><text>      </text>')
	API_ResponseWrite('<a href="DuShen_Title">  我是赌神</a><text>      </text>')
	API_ResponseWrite('<a href="WZCB_Title">  古仙令兑换</a><text>      </text>')
	API_ResponseWrite('<a href="GuXianLu_Title">  古仙路（单人副本）</a><text>      </text>')
	API_ResponseWrite('<a>关闭</a><br>')
end

--便捷功能：清空背包（本文件内定义，href 才能被调用）
function SpringFestival_ClearBag()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	if XuanZe == 1 then
		API_ResponseWrite('<name>便捷功能</name>')
		API_ResponseWrite('<text>请选择你要清除的范围：</text><br><br>')
		API_ResponseWrite('<a href="SpringFestival_ClearBag?1=2">全部清空（危险，慎重）</a><br><br>')
		API_ResponseWrite('<a href="SpringFestival_ClearBag?1=3">仅清空小背包（背包前两排保留）</a><br><br>')
		API_ResponseWrite('<a href="SpringFestival_JuanZhou">返回</a><br>')
	elseif XuanZe == 2 then
		API_ActorClearPackage(ActorID)
		API_ActorSendMsg(ActorID, 2, '背包已经全部清空')
		API_ResponseWrite('<name>便捷功能</name>')
		API_ResponseWrite('<text>背包已经全部清空。</text><br><br>')
		API_ResponseWrite('<a href="SpringFestival_JuanZhou">返回</a><br>')
	elseif XuanZe == 3 then
		for i=1,4 do
			local wth_baghave = API_ActorIsHaveBag(ActorID, i)
			if wth_baghave then
				local wth_bagHaveSize = API_ActorGetBagSize(ActorID, i)
				for v=0, (wth_bagHaveSize-1) do
					local wth_bagGoodsID = API_ActorPackageGetLocGoodsID(ActorID, (i+2), v)
					if wth_bagGoodsID > 0 then
						local wth_bagGoodsNum = API_ActorPackageGetLocGoodsNum(ActorID, (i+2), v)
						API_ActorRemoveGoodsOfLoc(ActorID, wth_bagGoodsID, wth_bagGoodsNum, (i+2), v, "")
					end
				end
			end
		end
		API_ActorSendMsg(ActorID, 2, '小背包已经清空')
		API_ResponseWrite('<name>便捷功能</name>')
		API_ResponseWrite('<text>小背包已经清空（背包前两排保留）。</text><br><br>')
		API_ResponseWrite('<a href="SpringFestival_JuanZhou">返回</a><br>')
	end
end

--便捷功能：免费回城（本文件内定义，href 才能被调用）
function SpringFestival_GotoHome()
	local ActorID = API_RequestGetActorID()
	local ActorCamp = API_GetActorCamp(ActorID)
	if wth_UnRegfukongdao then
		wth_UnRegfukongdao(ActorID)
	end
	if API_IsEctypeServer() then
		if ActorCamp == 0 then
			API_ActorGoToMapEx(ActorID, 1, 1, 217, 208)
		else
			API_ActorGoToMapEx(ActorID, 1, 2, 241, 170)
		end
	else
		if ActorCamp == 0 then
			API_ActorGoToMap(ActorID, 1, 217, 208)
		else
			API_ActorGoToMap(ActorID, 2, 241, 170)
		end
	end
	API_ResponseWrite('<name>便捷功能</name>')
	API_ResponseWrite('<text>已免费回城。</text><br><br>')
	API_ResponseWrite('<a href="SpringFestival_JuanZhou">返回</a><br>')
end

--领取寒风结晶、活动介绍、传送到NPC
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
			local HongBaoID = 83112
			if HongBao >= 1 then
				API_ResponseWrite('<text>您今天已经领取过寒风结晶了，不能再领取寒风结晶了。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
				return
			end
			if PackageSize >= 1 then
				API_VarDataSetNumber(ActorID,1,19019,YMD)
				API_VarDataSetNumber(ActorID,1,19020,HongBao+1)
				local HongBao2 = API_VarDataGetNumber(ActorID,1,19020)
				if HongBao2 == HongBao + 1 then
					API_AddActorGoodsFlag(ActorID,HongBaoID,1,3,'领取寒风结晶获得 1个 '.. API_GetGoodsName(HongBaoID)..'')
					API_ResponseWrite('<text>领取寒风结晶获得：</text>')
					API_ResponseWrite('<img srcgd="'..HongBaoID..'" tipgd="'..HongBaoID..'">')
					API_ResponseWrite('<text> × 1</text><br>')
					API_ResponseWrite('<br><br><a href="SpringFestival_JuanZhou">返回</a><br>')
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					local Type = 2
					if GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] + 1
					end
				end
			else
				API_ResponseWrite('<text>您的背包已满，无法领取寒风结晶。</text><br>')
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<text>领取失败，寒风结晶只能在春节活动期间内[1月27日--2月17日]领取。</text><br>')
			API_ResponseWrite('<br><br><a>确定</a><br>')
		end 
	elseif XuanZe == 2 then
		API_ResponseWrite('<name>春节活动介绍</name>')
		--API_ResponseWrite('<win rect="80,340,830,325"></win>')
		API_ResponseWrite('<br><text color="117,252,255">  活动时间</text><text>：从现在开始至2月17日</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  封印守护大作战</text><text>：在春节活动期间，每天的12点-13点，19点-20点，会在娜纱湿地（联邦）、落日农庄（帝国）出现封印之柱，玩家击败企图破坏封印之柱的怪物，成功守护封印之柱将获得丰富的活动奖励。</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  元宵情缘</text><text>：元宵情缘活动期间，每日上线可获得天缘水晶，玩家找到与自己“天缘水晶”颜色一致的异性组队，即可使用天缘水晶进入“灵犀幻境”。</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  大闹天宫</text><text>：在春节活动期间，可通过给予年糕到各城镇和主城的年兔大使，进入大闹天宫副本击杀黑年兔王，更可获得春节积分和丰富奖励。</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  年兔也疯狂</text><text>：活动时间内每天15：00-17：00在阳光雨林、珊瑚群岛、落日农庄、娜纱湿地、月暮草场内会出现大量的“邪恶年兔”，打败邪恶年兔会获得“年兔茸毛”，薄荷龙鳞可以在新年礼物兑换官处抽取各种新年礼物。并且年兔茸毛更可用于召唤大年兽哦。</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  挑战幻。年兽王</text><text>：活动时间内每天20:00--21:00在阳光雨林，落日农庄，珊瑚群岛，娜纱湿地出现一只大年兽，全部打败后在月暮草场将会出现一只年兽王。年兽王携带大量珍宝而来，喜欢猎奇的您千万不要错过。</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  寒风结晶</text><text>：活动时间内每天登陆游戏即可通过节日卷轴领取寒风结晶一个，寒风结晶？赶紧领取一个看看吧。</text><br>')
		API_ResponseWrite('<br><text color="117,252,255">  跨年时刻</text><text>：除夕之夜，在主城内的所有玩家将收到新年祝福，并且全城将连续不间断燃放各种烟花、鞭炮，让我们一起度过一个美好而难忘的除夕吧。</text><br>')
		API_ResponseWrite('<br><a>  确定</a><br>')
	elseif XuanZe == 3 then
--~ 		if StaticMapID == 23 or StaticMapID == 25 then
--~ 			API_ResponseWrite('<text>在珊瑚群岛和阳光雨林内无法使用此功能。</text><br>')
--~ 			API_ResponseWrite('<br><br><a>确定</a><br>')
--~ 			return
--~ 		end
--~ 		if API_GetServerID() == 11 or API_GetServerID() == 12 then
--~ 			API_ResponseWrite('<text>在浮空岛内无法使用此功能。</text><br>')
--~ 			API_ResponseWrite('<br><br><a>确定</a><br>')
--~ 			return
--~ 		end
--~ 		if ActCurMapid ~= DongTaiMapID then
--~ 			API_ResponseWrite('<text>在浮空岛内无法使用此功能。</text><br>')
--~ 			API_ResponseWrite('<br><br><a>确定</a><br>')
--~ 			return
--~ 		end
--~ 		for i,v in Public_NewPlayMapTable do
--~ 			if StaticMapID == v then
--~ 				API_ResponseWrite('<text>只有从新手学院毕业后才能使用此功能。</text><br>')
--~ 				API_ResponseWrite('<br><br><a>确定</a><br>')
--~ 				return
--~ 			end
--~ 		end
--~ 		local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
--~ 		if ConvectionInfo ~= 0 then
--~ 			API_ActorSendMsg(ActorID,3,'正在传送中，请稍后')
--~ 		else
--~ 			local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
--~ 			local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
--~ 			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
--~ 			local TimerTriggerID = API_CreateTimerTriggerG(ActorID,0,1,5,'SpringFestival_TimerTriggerCallFunc')
--~ 			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
--~ 			local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(GLOBAL_ConvectionTimer)
--~ 			API_ActorSendMsg(ActorID,3,'传送服务开始，空间定位中……，需时'..GLOBAL_ConvectionTimerCN..'秒，定位期间请不要移动，否则将传送失败')
--~ 			StatusTimer = (GLOBAL_ConvectionTimer + 1) * 1000
--~ 			if CampID == 0 then
--~ 				API_ActorAddStatus(ActorID,36002,StatusTimer)
--~ 			else
--~ 				API_ActorAddStatus(ActorID,36003,StatusTimer)
--~ 			end
--~ 			API_ActorShowProcess(ActorID,StatusTimer,410,360,'空间定位')
--~ 		end
	end
end

--传送到签到达人处，位置xy需要设置
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
		[1]={JY =	24	,SJB = 	12	,},
		[2]={JY =	48	,SJB = 	24	,},
		[3]={JY =	72	,SJB = 	36	,},
		[4]={JY =	96	,SJB = 	48	,},
		[5]={JY =	120	,SJB = 	60	,},
		[6]={JY =	144	,SJB = 	72	,},
		[7]={JY =	168	,SJB = 	84	,},
		[8]={JY =	192	,SJB = 	96	,},
		[9]={JY =	216	,SJB = 	108	,},
		[10]={JY =	240	,SJB = 	120	,},
		[11]={JY =	264	,SJB = 	132	,},
		[12]={JY =	288	,SJB = 	144	,},
		[13]={JY =	312	,SJB = 	156	,},
		[14]={JY =	336	,SJB = 	168	,},
		[15]={JY =	360	,SJB = 	180	,},
		[16]={JY =	384	,SJB = 	192	,},
		[17]={JY =	408	,SJB = 	204	,},
		[18]={JY =	432	,SJB = 	216	,},
		[19]={JY =	456	,SJB = 	228	,},
		[20]={JY =	480	,SJB = 	240	,},
		[21]={JY =	504	,SJB = 	252	,},
		[22]={JY =	528	,SJB = 	264	,},
		[23]={JY =	552	,SJB = 	276	,},
		[24]={JY =	576	,SJB = 	288	,},
		[25]={JY =	600	,SJB = 	300	,},
		[26]={JY =	1000	,SJB = 	500	,},
		[27]={JY =	1040	,SJB = 	520	,},
		[28]={JY =	1080	,SJB = 	540	,},
		[29]={JY =	1120	,SJB = 	560	,},
		[30]={JY =	1160	,SJB = 	580	,},
		[31]={JY =	1200	,SJB = 	600	,},
		[32]={JY =	1240	,SJB = 	620	,},
		[33]={JY =	1280	,SJB = 	640	,},
		[34]={JY =	1320	,SJB = 	660	,},
		[35]={JY =	1360	,SJB = 	680	,},
		[36]={JY =	1400	,SJB = 	700	,},
		[37]={JY =	1440	,SJB = 	720	,},
		[38]={JY =	1480	,SJB = 	740	,},
		[39]={JY =	1520	,SJB = 	760	,},
		[40]={JY =	1560	,SJB = 	780	,},
		[41]={JY =	3200	,SJB = 	1600	,},
		[42]={JY =	3240	,SJB = 	1620	,},
		[43]={JY =	3280	,SJB = 	1640	,},
		[44]={JY =	3320	,SJB = 	1660	,},
		[45]={JY =	3360	,SJB = 	1680	,},
		[46]={JY =	3400	,SJB = 	1700	,},
		[47]={JY =	3440	,SJB = 	1720	,},
		[48]={JY =	3480	,SJB = 	1740	,},
		[49]={JY =	3520	,SJB = 	1760	,},
		[50]={JY =	3560	,SJB = 	1780	,},
		[51]={JY =	4500	,SJB = 	2250	,},
		[52]={JY =	4540	,SJB = 	2270	,},
		[53]={JY =	4580	,SJB = 	2290	,},
		[54]={JY =	4620	,SJB = 	2310	,},
		[55]={JY =	4660	,SJB = 	2330	,},
		[56]={JY =	4700	,SJB = 	2342	,},
		[57]={JY =	4740	,SJB = 	2354	,},
		[58]={JY =	4780	,SJB = 	2366	,},
		[59]={JY =	4820	,SJB = 	2378	,},
		[60]={JY =	4860	,SJB = 	2390	,},
		[61]={JY =	4900	,SJB = 	2402	,},
		[62]={JY =	4940	,SJB = 	2414	,},
		[63]={JY =	4980	,SJB = 	2426	,},
		[64]={JY =	5020	,SJB = 	2438	,},
		[65]={JY =	5060	,SJB = 	2450	,},
	},
}

--使用红包 849
function SpringFestival_HongBao_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
--~ 	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
--~ 	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
--~ 	if nShiFouStart < 0 and nShiFouEnd > 0 then
		if SpringFestival_HongBaoTable[GoodsID] == nil then
			API_ActorSendMsg(ActorID,3,'无效物品')
			return 0
		end
		local PlayLv = API_GetActorExpLevel(ActorID)
		local PackageSize = API_ActorGetPackageSize(ActorID)
		if SpringFestival_HongBaoTable[GoodsID][PlayLv] == nil then
			API_ActorSendMsg(ActorID,3,'没有适合你级别的奖励')
			return 0
		end
		local Table = SpringFestival_HongBaoTable[GoodsID][PlayLv]
		if PackageSize >= 2 then
			if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除春节红包') then
				local JYNum = Table.JY
				local SJBNum = Table.SJB
				API_AddActorGoods(ActorID, 80498, JYNum, '春节红包给经验')
				API_AddActorGoods(ActorID, 80696, SJBNum, '春节红包给水晶币')
				API_ActorSendMsg(ActorID,10,'打开春节红包获得'..JYNum..'个经验兑换券、'..SJBNum..'个水晶币兑换券')
				return 1
			end
		else
			API_ActorSendMsg(ActorID,3,'背包空间不足，请至少保持2个空位再打开春节红包')
			return 0
		end
--~ 	else
--~ 		API_ActorSendMsg(ActorID,3,'打开失败，此物品只能在春节活动期间内[1月27日--2月17日]开启。')
--~ 		return 0
--~ 	end 
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
	if API_IsBattleGameServer() then
		API_ActorSendMsg(ActorID,3,'不能在本服务器使用')
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
		API_ActorSendMsg(ActorID,3,'使用失败，请在春节活动期间内[1月27日--2月17日]再尝试使用吧。')
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
			API_ActorBroadcastMsg(-1,7,'“'..ActorName..'”向大家拜年啦：'..PayYear..'')
			API_ActorBroadcastMsg(-1,17,'“'..ActorName..'”向大家拜年啦：'..PayYear..'')
--~ 			local LaiYuan = API_ActorGetPropNum(ActorID,201)
--~ 			if GLOBAL_FengXiangBiao_DateList[8][5][LaiYuan] == nil then
--~ 				GLOBAL_FengXiangBiao_DateList[8][5][LaiYuan] = 1
--~ 			else
--~ 				GLOBAL_FengXiangBiao_DateList[8][5][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][5][LaiYuan] + 1
--~ 			end
		end
	end
end

WYL_SpringFestival_GodBoxTab = {
	[89039] = {
		[1] = {
			{GoodsID=117,GaiLv1=1,GaiLv2=703800,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=206,GaiLv1=703801,GaiLv2=1407601,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=307,GaiLv1=1407602,GaiLv2=2111402,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=117,GaiLv1=2111403,GaiLv2=2463303,NumGaiLv=10000,NumMax=2,NumMin=1},
			{GoodsID=206,GaiLv1=2463304,GaiLv2=2815204,NumGaiLv=10000,NumMax=2,NumMin=1},
			{GoodsID=307,GaiLv1=2815205,GaiLv2=3167105,NumGaiLv=10000,NumMax=2,NumMin=1},
			{GoodsID=117,GaiLv1=3167106,GaiLv2=3401706,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=206,GaiLv1=3401707,GaiLv2=3636307,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=307,GaiLv1=3636308,GaiLv2=3870908,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=89038,GaiLv1=3870909,GaiLv2=3906099,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=22,GaiLv1=3906100,GaiLv2=3976480,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80276,GaiLv1=3976481,GaiLv2=3986535,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80281,GaiLv1=3986536,GaiLv2=4000612,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=766,GaiLv1=4000613,GaiLv2=4035803,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80485,GaiLv1=4035804,GaiLv2=4045858,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=767,GaiLv1=4045859,GaiLv2=4081049,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=4081050,GaiLv2=4116240,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40002,GaiLv1=4116241,GaiLv2=4350841,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40012,GaiLv1=4350842,GaiLv2=4585442,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40022,GaiLv1=4585443,GaiLv2=4820043,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40032,GaiLv1=4820044,GaiLv2=4843504,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40042,GaiLv1=4843505,GaiLv2=4866965,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40052,GaiLv1=4866966,GaiLv2=4890426,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40062,GaiLv1=4890427,GaiLv2=4913887,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40072,GaiLv1=4913888,GaiLv2=4937348,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40082,GaiLv1=4937349,GaiLv2=4960809,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40092,GaiLv1=4960810,GaiLv2=4984270,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40102,GaiLv1=4984271,GaiLv2=5007731,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40202,GaiLv1=5007732,GaiLv2=5078112,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40218,GaiLv1=5078113,GaiLv2=5148493,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40234,GaiLv1=5148494,GaiLv2=5218874,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40250,GaiLv1=5218875,GaiLv2=5289255,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40266,GaiLv1=5289256,GaiLv2=5359636,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40112,GaiLv1=5359637,GaiLv2=5594237,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40122,GaiLv1=5594238,GaiLv2=5828838,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40132,GaiLv1=5828839,GaiLv2=6063439,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80381,GaiLv1=6063440,GaiLv2=6204200,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80181,GaiLv1=6204201,GaiLv2=6438801,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80191,GaiLv1=6438802,GaiLv2=6790702,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80195,GaiLv1=6790703,GaiLv2=7494503,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11009,GaiLv1=7494504,GaiLv2=7496263,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11010,GaiLv1=7496264,GaiLv2=7498023,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11011,GaiLv1=7498024,GaiLv2=7499783,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11012,GaiLv1=7499784,GaiLv2=7501543,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=315,GaiLv1=7501544,GaiLv2=7970744,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80697,GaiLv1=7970745,GaiLv2=8674545,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80697,GaiLv1=8674546,GaiLv2=9026446,NumGaiLv=10000,NumMax=2,NumMin=1},
			{GoodsID=80697,GaiLv1=9026447,GaiLv2=9261047,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=88171,GaiLv1=9261048,GaiLv2=9964848,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=9964849,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},
			},
		[2] = {
			{GoodsID=118,GaiLv1=1,GaiLv2=631213,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=207,GaiLv1=631214,GaiLv2=1262427,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=308,GaiLv1=1262428,GaiLv2=1893641,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=118,GaiLv1=1893642,GaiLv2=2209248,NumGaiLv=10000,NumMax=2,NumMin=1},
			{GoodsID=207,GaiLv1=2209249,GaiLv2=2524855,NumGaiLv=10000,NumMax=2,NumMin=1},
			{GoodsID=308,GaiLv1=2524856,GaiLv2=2840462,NumGaiLv=10000,NumMax=2,NumMin=1},
			{GoodsID=118,GaiLv1=2840463,GaiLv2=3050867,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=207,GaiLv1=3050868,GaiLv2=3261272,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=308,GaiLv1=3261273,GaiLv2=3471677,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=89038,GaiLv1=3471678,GaiLv2=3503238,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=23,GaiLv1=3503239,GaiLv2=3629481,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80277,GaiLv1=3629482,GaiLv2=3637372,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80282,GaiLv1=3637373,GaiLv2=3658413,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=766,GaiLv1=3658414,GaiLv2=3689974,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80384,GaiLv1=3689975,GaiLv2=4110784,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80382,GaiLv1=4110785,GaiLv2=4363270,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80409,GaiLv1=4363271,GaiLv2=4375895,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80405,GaiLv1=4375896,GaiLv2=4382208,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40003,GaiLv1=4382209,GaiLv2=4508451,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40013,GaiLv1=4508452,GaiLv2=4634694,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40023,GaiLv1=4634695,GaiLv2=4760937,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40033,GaiLv1=4760938,GaiLv2=4773562,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40043,GaiLv1=4773563,GaiLv2=4786187,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40053,GaiLv1=4786188,GaiLv2=4798812,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40063,GaiLv1=4798813,GaiLv2=4824061,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40073,GaiLv1=4824062,GaiLv2=4849310,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40083,GaiLv1=4849311,GaiLv2=4874559,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40093,GaiLv1=4874560,GaiLv2=4916640,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40103,GaiLv1=4916641,GaiLv2=5127045,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40113,GaiLv1=5127046,GaiLv2=5337450,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40123,GaiLv1=5337451,GaiLv2=5547855,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40133,GaiLv1=5547856,GaiLv2=5758260,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40204,GaiLv1=5758261,GaiLv2=5770885,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40220,GaiLv1=5770886,GaiLv2=5783510,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40236,GaiLv1=5783511,GaiLv2=5796135,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40252,GaiLv1=5796136,GaiLv2=5808760,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40268,GaiLv1=5808761,GaiLv2=5821385,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80697,GaiLv1=5821386,GaiLv2=6452599,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80697,GaiLv1=6452600,GaiLv2=6768206,NumGaiLv=10000,NumMax=2,NumMin=1},
			{GoodsID=80697,GaiLv1=6768207,GaiLv2=6978611,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=80181,GaiLv1=6978612,GaiLv2=7294218,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80192,GaiLv1=7294219,GaiLv2=7609825,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80196,GaiLv1=7609826,GaiLv2=7925432,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88171,GaiLv1=7925433,GaiLv2=8556646,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80951,GaiLv1=8556647,GaiLv2=8577687,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=8577688,GaiLv2=8640809,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80485,GaiLv1=8640810,GaiLv2=8647122,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=767,GaiLv1=8647123,GaiLv2=8678683,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=8678684,GaiLv2=8710244,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11009,GaiLv1=8710245,GaiLv2=8711823,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11010,GaiLv1=8711824,GaiLv2=8713402,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11011,GaiLv1=8713403,GaiLv2=8714981,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11012,GaiLv1=8714982,GaiLv2=8716560,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80050,GaiLv1=8716561,GaiLv2=9347774,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80066,GaiLv1=9347775,GaiLv2=9978988,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80387,GaiLv1=9978989,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},
			},
		[3] = {
			{GoodsID=80051,GaiLv1=1,GaiLv2=51223,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80067,GaiLv1=51224,GaiLv2=119521,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80409,GaiLv1=119522,GaiLv2=140011,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80405,GaiLv1=140012,GaiLv2=150256,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40004,GaiLv1=150257,GaiLv2=355150,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40014,GaiLv1=355151,GaiLv2=560044,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40024,GaiLv1=560045,GaiLv2=764938,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40034,GaiLv1=764939,GaiLv2=785428,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40044,GaiLv1=785429,GaiLv2=805918,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40054,GaiLv1=805919,GaiLv2=826408,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40064,GaiLv1=826409,GaiLv2=839214,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40074,GaiLv1=839215,GaiLv2=852020,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40084,GaiLv1=852021,GaiLv2=864826,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40094,GaiLv1=864827,GaiLv2=967273,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40104,GaiLv1=967274,GaiLv2=1018497,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40114,GaiLv1=1018498,GaiLv2=1146556,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40124,GaiLv1=1146557,GaiLv2=1351450,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40134,GaiLv1=1351451,GaiLv2=1692939,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40206,GaiLv1=1692940,GaiLv2=1713429,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40222,GaiLv1=1713430,GaiLv2=1781727,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40238,GaiLv1=1781728,GaiLv2=1850025,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40254,GaiLv1=1850026,GaiLv2=1918323,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40270,GaiLv1=1918324,GaiLv2=1986621,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40005,GaiLv1=1986622,GaiLv2=1996866,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40015,GaiLv1=1996867,GaiLv2=2007111,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40025,GaiLv1=2007112,GaiLv2=2017356,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40035,GaiLv1=2017357,GaiLv2=2022479,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40045,GaiLv1=2022480,GaiLv2=2027602,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40055,GaiLv1=2027603,GaiLv2=2034432,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40065,GaiLv1=2034433,GaiLv2=2039555,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40075,GaiLv1=2039556,GaiLv2=2044678,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40085,GaiLv1=2044679,GaiLv2=2049801,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40095,GaiLv1=2049802,GaiLv2=2062607,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40105,GaiLv1=2062608,GaiLv2=2072852,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40115,GaiLv1=2072853,GaiLv2=2093342,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40125,GaiLv1=2093343,GaiLv2=2127491,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40135,GaiLv1=2127492,GaiLv2=2178715,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40208,GaiLv1=2178716,GaiLv2=2187253,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40224,GaiLv1=2187254,GaiLv2=2200059,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40240,GaiLv1=2200060,GaiLv2=2210304,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40256,GaiLv1=2210305,GaiLv2=2223110,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=40272,GaiLv1=2223111,GaiLv2=2235916,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80384,GaiLv1=2235917,GaiLv2=3260382,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80382,GaiLv1=3260383,GaiLv2=3772615,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80181,GaiLv1=3772616,GaiLv2=4284848,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80192,GaiLv1=4284849,GaiLv2=4431201,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80197,GaiLv1=4431202,GaiLv2=4601946,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88171,GaiLv1=4601947,GaiLv2=5626412,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80952,GaiLv1=5626413,GaiLv2=5643487,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=82004,GaiLv1=5643488,GaiLv2=5745934,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=119,GaiLv1=5745935,GaiLv2=6428911,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=208,GaiLv1=6428912,GaiLv2=7111888,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=316,GaiLv1=7111889,GaiLv2=7794865,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=119,GaiLv1=7794866,GaiLv2=8136354,NumGaiLv=10000,NumMax=2,NumMin=1},
			{GoodsID=208,GaiLv1=8136355,GaiLv2=8477843,NumGaiLv=10000,NumMax=2,NumMin=1},
			{GoodsID=316,GaiLv1=8477844,GaiLv2=8819332,NumGaiLv=10000,NumMax=2,NumMin=1},
			{GoodsID=119,GaiLv1=8819333,GaiLv2=9046991,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=208,GaiLv1=9046992,GaiLv2=9274650,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=316,GaiLv1=9274651,GaiLv2=9502309,NumGaiLv=10000,NumMax=3,NumMin=2},
			{GoodsID=89038,GaiLv1=9502310,GaiLv2=9553533,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=24,GaiLv1=9553534,GaiLv2=9758427,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80277,GaiLv1=9758428,GaiLv2=9771233,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80282,GaiLv1=9771234,GaiLv2=9805382,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=766,GaiLv1=9805383,GaiLv2=9856606,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80485,GaiLv1=9856607,GaiLv2=9866851,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=767,GaiLv1=9866852,GaiLv2=9918075,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=9918076,GaiLv2=9969299,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11009,GaiLv1=9969300,GaiLv2=9971861,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11010,GaiLv1=9971862,GaiLv2=9974423,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11011,GaiLv1=9974424,GaiLv2=9976985,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11012,GaiLv1=9976986,GaiLv2=9979547,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80388,GaiLv1=9979548,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},
			},
		},
}

WYL_SpringFestival_XZGodBoxTab = {
	[11009] = {Key=83,Max=5,},
	[11010] = {Key=83,Max=5,},
	[11011] = {Key=83,Max=5,},
	[11012] = {Key=83,Max=5,},
}

--2011天降财神活动洒落的箱子开启函数
function WYL_SpringFestival_OpenGodBoxFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if WYL_SpringFestival_GodBoxTab[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return 0
	end
	if API_ActorGetPackageSize(ActorID) < 2 then
		API_ActorSendMsg(ActorID,3,'背包需要留出2个以上空位才可以使用')
		return 0
	end
	local Time = os.time() 
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local PlayName = API_GetActorName(ActorID)
	local PlayLv = API_GetActorExpLevel(ActorID)
	local JiangLiQuYu = 1
	if PlayLv > 25 and PlayLv <= 40 then
		JiangLiQuYu = 2
	elseif PlayLv > 40 then
		JiangLiQuYu = 3
	end
	local JiangLiTable = WYL_SpringFestival_GodBoxTab[GoodsID][JiangLiQuYu]
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
			local NumRandom = math.random(10000)
			if NumRandom <= NumGaiLv then
				JiangLiGoodsNum = NumMax
			else
				JiangLiGoodsNum = NumMin
			end
			if JiangLiGoodsNum > 0 then
				if WYL_SpringFestival_XZGodBoxTab[JiangLiGoodsID] ~= nil then
					local CD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 84)
					if Time >= CD then
						local Key = WYL_SpringFestival_XZGodBoxTab[JiangLiGoodsID].Key
						local Max = WYL_SpringFestival_XZGodBoxTab[JiangLiGoodsID].Max
						local Now = API_VarDataGetNumber_Ex(1, 0, -2000, 1, Key)
						if Now < Max then
							Now = Now + 1
							API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, Key, Now)
							Time = Time + math.random(1800,3600)
							API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 84, Time)
						else
							JiangLiGoodsID = 250
							JiangLiGoodsNum = 1
						end
					else
						JiangLiGoodsID = 80696
						JiangLiGoodsNum = 20
					end
				end
			else
				JiangLiGoodsID = 80696
				JiangLiGoodsNum = 20
			end
		end
	end
	if API_ActorRemoveGoods(ActorID, GoodsID, 1, '打开财运宝盒') then
		local PD2 = 0
		for j,v in baoshiwupinbiao do
			if JiangLiGoodsID == v then
				PD2 = 1
				break
			end
		end
		if PD2 == 1 then
			fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
		else
			API_AddActorGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,'财运宝盒奖励')
		end
		API_ActorSendMsg(ActorID,7,'财运到，获得：'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="150,150,300,220" alpha="240" balpha="230"></win>') 
		API_ResponseWrite('<br>br><text size="16" color="117,252,255">新年有好礼，财运送不停。</text><br>')
		API_ResponseWrite('<br><text color="255,0,255">打开财运宝盒获得：</text><img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'"><text> × '..JiangLiGoodsNum..'</text><br>')
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
	end
	return 1
end
--~ function SpringFestival_GodBox()
--~ 	local ActorID = API_RequestGetActorID()
--~ 	local XuanZe = API_RequestGetNumber(1)
--~ 	local GoodsID = API_RequestGetNumber(2)
--~ 	if SpringFestival_GodBoxTable[GoodsID] == nil then
--~ 		API_ActorSendMsg(ActorID,3,'无效物品')
--~ 		return
--~ 	end
--~ 	local NeedPoint = SpringFestival_GodBoxTable[GoodsID].NeedPoint
--~ 	local PlayOpenNum = API_VarDataGetNumber(ActorID,1,19022)
--~ 	local PlayOpenYMD = API_VarDataGetNumber(ActorID,1,19021)
--~ 	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
--~ 	local YMD = Year * 10000 + Month * 100 + Day
--~ 	local PackageSize = API_ActorGetPackageSize(ActorID)
--~ 	if XuanZe == 1 then
--~ 		if PlayOpenNum < 5 then
--~ 			if PackageSize >= 1 then
--~ 				if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除'..API_GetGoodsName(GoodsID)..'') then
--~ 					API_VarDataSetNumber(ActorID,1,19021,YMD)
--~ 					API_VarDataSetNumber(ActorID,1,19022,PlayOpenNum+1)
--~ 					local PlayOpenNum2 = API_VarDataGetNumber(ActorID,1,19022)
--~ 					if PlayOpenNum2 == PlayOpenNum + 1 then
--~ 						--抽奖励，仿圣诞节抽奖
--~ 						local Table = SpringFestival_GodBoxTable[GoodsID].Goodslist
--~ 						local JiangLi = math.random(1000000)
--~ 						for j in Table do
--~ 							local x = Table[j].x
--~ 							local y = Table[j].y
--~ 							if JiangLi >= x and JiangLi <= y then
--~ 								local JLGoodsID = Table[j].GoodsID
--~ 								API_AddActorGoodsFlag(ActorID,JLGoodsID,1,3,'打开财运宝盒获得1个'..API_GetGoodsName(JLGoodsID)..'')
--~ 								API_ActorSendMsg(ActorID,9,'打开财运宝盒获得1个'..API_GetGoodsName(JLGoodsID)..'')
--~ 								local LaiYuan = API_ActorGetPropNum(ActorID,201)
--~ 								if GLOBAL_FengXiangBiao_DateList[8][4][LaiYuan] == nil then
--~ 									GLOBAL_FengXiangBiao_DateList[8][4][LaiYuan] = 1
--~ 								else
--~ 									GLOBAL_FengXiangBiao_DateList[8][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][4][LaiYuan] + 1
--~ 								end
--~ 								return
--~ 							end
--~ 						end
--~ 					end
--~ 				end
--~ 			else
--~ 				API_ResponseWrite('<text>背包空间不足，请整理一下您的背包再尝试打开财运宝盒。</text><br>')
--~ 				API_ResponseWrite('<br><br><a>确定</a><br>')
--~ 			end
--~ 		else
--~ 			API_ResponseWrite('<text>您今天已经免点券打开5次财运宝盒了，如果还需要继续打开财运宝盒，请选择“自由打开财运宝盒”。</text><br>')
--~ 			API_ResponseWrite('<br><br><a>确定</a><br>')
--~ 		end
--~ 	elseif XuanZe == 2 then
--~ 		if API_ActorGetPropNum(ActorID,183) >= NeedPoint then
--~ 			if PackageSize >= 1 then
--~ 				if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除'..API_GetGoodsName(GoodsID)..'') then
--~ 					if API_UsePoint(ActorID,3,GoodsID,1,NeedPoint) == 0 then
--~ 						--抽奖励，仿圣诞节抽奖
--~ 						local Table = SpringFestival_GodBoxTable[GoodsID].Goodslist
--~ 						local JiangLi = math.random(1000000)
--~ 						for j in Table do
--~ 							local x = Table[j].x
--~ 							local y = Table[j].y
--~ 							if JiangLi >= x and JiangLi <= y then
--~ 								local JLGoodsID = Table[j].GoodsID
--~ 								API_AddActorGoodsFlag(ActorID,JLGoodsID,1,3,'打开财运宝盒获得1个'..API_GetGoodsName(JLGoodsID)..'')
--~ 								API_ActorSendMsg(ActorID,9,'打开财运宝盒获得1个'..API_GetGoodsName(JLGoodsID)..'')
--~ 								local LaiYuan = API_ActorGetPropNum(ActorID,201)
--~ 								if GLOBAL_FengXiangBiao_DateList[8][9][LaiYuan] == nil then
--~ 									GLOBAL_FengXiangBiao_DateList[8][9][LaiYuan] = 1
--~ 								else
--~ 									GLOBAL_FengXiangBiao_DateList[8][9][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][9][LaiYuan] + 1
--~ 								end
--~ 								return
--~ 							end
--~ 						end
--~ 						--此处加风向标：点券 NeedPoint
--~ 					end
--~ 				end
--~ 			else
--~ 				API_ResponseWrite('<text>背包空间不足，请整理一下您的背包再尝试打开财运宝盒。</text><br>')
--~ 				API_ResponseWrite('<br><br><a>确定</a><br>')
--~ 			end
--~ 		else
--~ 			API_ResponseWrite('<text>您的点券不够，不能打开财运宝盒。</text><br>')
--~ 			API_ResponseWrite('<br><br><a>确定</a><br>')
--~ 		end
--~ 	end
--~ end

SpringFestival_MonsterCornerTable = {
	[88876] = {NeedNum=50,SmallMon=726457,BigMon=726458,},
}

--使用年兔茸毛 850、851、852
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
	local PlayLv = API_GetActorExpLevel(ActorID)
	if PlayLv > 55 then
		PlayLv = 55
	end
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		local NeedNum = SpringFestival_MonsterCornerTable[GoodsID].NeedNum
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>薄荷龙鳞可以用来在主城出口处的签到达人兑换各种道具，也可以用来召唤大年兽。</text><br>')
		API_ResponseWrite('<br><text>召唤大年兽需要'..NeedNum..'个年兔茸毛，大年兽非常凶狠、强悍，建议邀请朋友一起挑战。小心不要被大年兽吃了哦。</text><br>')
		API_ResponseWrite('<br><text color="255,0,255">提醒：在浮空岛和主城内无法召唤。并且只能在春节活动期间内[1月27日--2月17日]召唤。春节活动结束后使用可获得经验兑换券。</text><br>')
		API_ResponseWrite('<br><br><a href="SpringFestival_MonsterCorner?1='..GoodsID..'">召唤大年兽</a><br>')
		API_ResponseWrite('<br><br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
	else
		local PlayName = API_GetActorName(ActorID)
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用'..API_GetGoodsName(GoodsID)..'给经验兑换券') then
			local JYNum = SpringFestival_HongBaoTable[849][PlayLv].JY
			JYNum = math.floor(JYNum/24)
			if API_ActorCanAddGoods(ActorID,80498,JYNum,1,0) ~= -1 then
				API_AddActorGoodsFlag(ActorID,80498,JYNum,1,'薄荷龙鳞兑换奖励')
				API_ActorSendMsg(ActorID,10,'使用年兔茸毛获得：'..JYNum..'个经验兑换券')
			else
				API_SendActorMailByName(PlayName,80498,JYNum,1,'年兔茸毛','获得'..JYNum..'个经验兑换券')
				API_ActorSendMsg(ActorID,10,'使用年兔茸毛获得：'..JYNum..'个经验兑换券（请到邮箱领取）')
			end
		end
	end 
	return 1
end

function SpringFestival_MonsterCorner()
	local ActorID = API_RequestGetActorID()
	local GoodsID = API_RequestGetNumber(1)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return
	end
	if SpringFestival_MonsterCornerTable[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return
	end 
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local StaticMapID = API_GetStaticMapID(MapID)
	for i,v in SpringFestival_ZhuChengMapTable do
		if MapConfigID == v then
			API_ActorSendMsg(ActorID,3,'在本地图内无法召唤大年兽')
			return
		end
	end
	if MapID ~= StaticMapID then
		API_ActorSendMsg(ActorID,3,'在本地图内无法召唤大年兽')
		return
	end
	local Time = API_VarDataGetNumber(ActorID,0,19028)
	if Time > 0 then
		API_ActorSendMsg(ActorID,3,'每60秒才可以召唤一次大年兽，您还需'..Time..'秒才可以再次召唤大年兽')
		return
	end
	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
	
		local PlayLv = API_GetActorExpLevel(ActorID)
		if PlayLv > 55 then
			PlayLv = 55
		end
		local NeedNum = SpringFestival_MonsterCornerTable[GoodsID].NeedNum
		local SmallMon = SpringFestival_MonsterCornerTable[GoodsID].SmallMon
		local BigMon = SpringFestival_MonsterCornerTable[GoodsID].BigMon
		local MonID = SmallMon
		if PlayLv > 25 then
			MonID = BigMon
		end
		local PlayName = API_GetActorName(ActorID)
		local x,y = PublicFun_GetActorPosXY(ActorID)
		if API_ActorGetGoodsNum(ActorID,GoodsID) >= NeedNum then
			if API_ActorRemoveGoods(ActorID,GoodsID,NeedNum,'删除'..NeedNum..'个'..API_GetGoodsName(GoodsID)..'召唤大年兽') then
				local FastID = API_CreateMonster(MapID,MonID,x,y,4,0,-1)
				API_SetMonsterName(FastID,''..PlayName..'的',2)
				API_CreateDieTriggerG(ActorID,0,0,FastID,'SpringFestival_MonsterCorner_DieTriggerGCallFunc')
				API_ActorSendMsg(ActorID,10,'成功召唤出一只大年兽')
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 4
				if GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] + 1
				end
				API_VarDataSetNumber(ActorID,0,19028,60)
				API_CreateTimerTrigger(ActorID,1,60,-1,'SpringFestival_BigMonsterTrigger')
			end
		else
			API_ActorSendMsg(ActorID,3,'所需物品不足，无法召唤')
		end
	else
		API_ActorSendMsg(ActorID,3,'活动时间外无法召唤')
	end
end

function SpringFestival_BigMonsterTrigger(ActorID,b) --召唤大年兽CD
	local Time = API_VarDataGetNumber(ActorID,0,19028)
	Time = Time - 1
	API_VarDataSetNumber(ActorID,0,19028,Time)
end

--需要设置怪物掉落，做表
function SpringFestival_MonsterCorner_DieTriggerGCallFunc(ZhuRenID,b,Type,FastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY)
	if SpringFestival_YearMonDrop[MonsterID] ~= nil then
		local MonName = API_GetMonsterNameByID(MonsterID)
		local Table = SpringFestival_YearMonDrop[MonsterID]
		local LinShiTable = {}
		for j in Table[1] do
			local RD = math.random(1000000)
			local GoodsID = Table[1][j].GoodsID
			local GoodsNum = Table[1][j].GoodsNum
			local GaiLv = Table[1][j].GaiLv
			local PinZhi = Table[1][j].PinZhi
			local GoodsName = API_GetGoodsName(GoodsID)
			if RD <= GaiLv then
				local XuHao = table.getn(LinShiTable) + 1
				if LinShiTable[XuHao] == nil then
					LinShiTable[XuHao] = {}
				end
				LinShiTable[XuHao].GoodsID = GoodsID
				LinShiTable[XuHao].GoodsNum = GoodsNum
				LinShiTable[XuHao].PinZhi = PinZhi
			end
		end
		for i in Table[2] do
			local RD = math.random(1000000)
			local GoodsID = 0
			local LeiXing = Table[2][i].LeiXing
			local GaiLv = Table[2][i].GaiLv
			local GoodsNum = Table[2][i].Num
			local PinZhi = Table[2][i].PinZhi
			if RD <= GaiLv then
				if YXD_WorldDropGoodsTab[LeiXing] ~= nil then
					GoodsID = YXD_WorldDropGoodsTab[LeiXing][math.random(table.getn(YXD_WorldDropGoodsTab[LeiXing]))]
					local GoodsName = API_GetGoodsName(GoodsID)
					local XuHao = table.getn(LinShiTable) + 1
					if LinShiTable[XuHao] == nil then
						LinShiTable[XuHao] = {}
					end
					LinShiTable[XuHao].GoodsID = GoodsID
					LinShiTable[XuHao].GoodsNum = GoodsNum
					LinShiTable[XuHao].PinZhi = PinZhi
				end
			end
		end
		local DiaoLuoTable = {}
		while table.getn(LinShiTable) > 0 do
			local XuHao = table.getn(DiaoLuoTable) + 1
			local RandomXuHao = math.random(table.getn(LinShiTable))
			if DiaoLuoTable[XuHao] == nil then
				DiaoLuoTable[XuHao] = {}
			end
			DiaoLuoTable[XuHao].GoodsID = LinShiTable[RandomXuHao].GoodsID
			DiaoLuoTable[XuHao].GoodsNum = LinShiTable[RandomXuHao].GoodsNum
			DiaoLuoTable[XuHao].PinZhi = LinShiTable[RandomXuHao].PinZhi
			table.remove(LinShiTable,RandomXuHao)
		end
		for j in DiaoLuoTable do
			local GoodsID = DiaoLuoTable[j].GoodsID
			local GoodsNum = DiaoLuoTable[j].GoodsNum
			local PinZhi = DiaoLuoTable[j].PinZhi
			local GoodsName = API_GetGoodsName(GoodsID)
			if PinZhi > 0 then
				if API_ActorIsOnline(ZhuRenID) then
					if API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',4,ZhuRenID,600,120,PinZhi) == true then
					end
				else
					if API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',0,0,600,120,PinZhi) == true then
					end
				end
			else
				if API_ActorIsOnline(ZhuRenID) then
					if API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',0,ZhuRenID,600,120) == true then
					end
				else
					if API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',4,0,600,120) == true then
					end
				end
			end
		end
	end
end

--新年礼物兑换官对话，加在TASKNPC里，填NPCID，还要加上购买拜年帖、烟花、鞭炮等连接
function SpringFestival_ACTNPC_Title(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	local ZhuFu = SpringFestival_ZhuFuTable[math.random(14)]
	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
	API_ResponseWrite('<name>新年快乐</name>')
	API_ResponseWrite('<br><br><text size="16"  color="117,252,255">  '..ZhuFu..'</text><br><br>')
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		API_ResponseWrite('<br><text size="14">  新年好，如果您有“薄荷龙鳞”，可以在我这里抽取各种新年礼物。另外，您还可以在我这里购买年货。</text><br>')
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
							API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'春节新年礼物兑换官购买')
							API_ActorSendMsg(ActorID,3,'您花费 '..BuyMoney..' 金币购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							API_ActorSendMsg(ActorID,7,'您花费 '..BuyMoney..' 金币购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							--local LaiYuan = API_ActorGetPropNum(ActorID,201)
							--if GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] == nil then
							--	GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = BuyMoney
							--else
							--	GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] + BuyMoney
							--end
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
							API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'春节新年礼物兑换官购买')
							API_ActorSendMsg(ActorID,3,'您花费 '..BuyPoint..' 点券购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							API_ActorSendMsg(ActorID,7,'您花费 '..BuyPoint..' 点券购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							--local LaiYuan = API_ActorGetPropNum(ActorID,201)
							--if GLOBAL_FengXiangBiao_DateList[2][40][LaiYuan] == nil then
							--	GLOBAL_FengXiangBiao_DateList[2][40][LaiYuan] = BuyPoint
							--else
							--	GLOBAL_FengXiangBiao_DateList[2][40][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][40][LaiYuan] + BuyPoint
							--end
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
		API_ResponseWrite('<br><text>  新年好，根据您的爵位您需要使用 '..SpringFestival_ChouJiangNeedNum..'个'..GoodsName..' 才可以抽取礼物：</text><br>')
		API_ResponseWrite('<br><a href="SpringFestival_ACTNPC_JiangLi?1=2">  使用'..GoodsName..'抽取礼物</a><text>      需要 '..SpringFestival_ChouJiangNeedNum..' 个</text><img srcgd="'..NeedGoodsID..'" tipgd="'..NeedGoodsID..'"><br>')
		API_ResponseWrite('<br><br><a href="SpringFestival_ACTNPC_Title">  返回</a><br>')
	elseif XuanZe == 2 then
		if API_ActorGetGoodsNum(ActorID,NeedGoodsID) >= SpringFestival_ChouJiangNeedNum then
			if PackageSize >= 1 then
				if PlayMoney <= MaxMoney then
					if API_ActorRemoveGoods(ActorID,NeedGoodsID,SpringFestival_ChouJiangNeedNum,'春节抽奖消耗'..SpringFestival_ChouJiangNeedNum..'个'.. GoodsName..'') then
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
									API_ResponseWrite('<text>使用 '..SpringFestival_ChouJiangNeedNum..'个'..GoodsName..' 抽取礼物获得：</text>')
									API_ResponseWrite('<img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'">')
									API_ResponseWrite('<text> × '..GoodsNum..'</text><br>')
									API_ResponseWrite('<br><br><a href="SpringFestival_ACTNPC_JiangLi?1=1">返回</a><br>')
									return
								end
							end
						elseif JiangLi > a and JiangLi <= b then
							local GongXun = math.random(gxa,gxb)
							API_ActorAddExp(ActorID,GongXun,0,'春节活动抽奖获得经验')
							API_ResponseWrite('<text>使用 '..SpringFestival_ChouJiangNeedNum..'个'..GoodsName..' 抽取礼物获得：</text>')
							API_ResponseWrite('<img srcgd="'..Pub_VarExpGoodsID..'" tipgd="'..Pub_VarExpGoodsID..'" >')
							API_ResponseWrite('<text> × '..GongXun..'</text><br>')
							API_ResponseWrite('<br><br><a href="SpringFestival_ACTNPC_JiangLi?1=1">返回</a><br>')
						elseif JiangLi > b then
							local JinBi = math.random(mma,mmb)
							API_ActorAddMoneyUnStat(ActorID,JinBi,0,'兑换礼物获得 '..JinBi..' 金币')
							API_ResponseWrite('<text>使用 '..SpringFestival_ChouJiangNeedNum..'个'..GoodsName..' 抽取礼物获得：</text>')
							API_ResponseWrite('<img srcgd="'..Pub_VarMoneryGoodsID..'" tipgd="'..Pub_VarMoneryGoodsID..'" >')
							API_ResponseWrite('<text> × '..JinBi..'</text><br>')
							API_ResponseWrite('<br><br><a href="SpringFestival_ACTNPC_JiangLi?1=1">返回</a><br>')
						end
--~ 						local LaiYuan = API_ActorGetPropNum(ActorID,201)
--~ 						if GLOBAL_FengXiangBiao_DateList[8][2][LaiYuan] == nil then
--~ 							GLOBAL_FengXiangBiao_DateList[8][2][LaiYuan] = 1
--~ 						else
--~ 							GLOBAL_FengXiangBiao_DateList[8][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][2][LaiYuan] + 1
--~ 						end
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
				[12243] = {
						{GoodsID=858}, --春节烟花
						{GoodsID=859},
					},
				[11775] = {
						{GoodsID=845}, --变身糖过
					},
}

--存储玩家领取房屋离线经验的年月日
--epfunc_WYL_HouseYMD = 19087
--领取离线经验
function SpringFestival_NPCLiWu(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local PlayName = API_GetActorName(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local HouseID = API_GetHouseSerialID(MapID)
	if g_nHousePresentBoxFastID[HouseID] == nil then
		return
	end
	local PD = 0 
	for j in g_nHousePresentBoxFastID[HouseID] do
		if ActorID == j then
			PD = 1
		end
	end
	if PD == 0 then
		API_ActorSendMsg(ActorID,3,'你不是这个礼包的主人，无法打开它')
		API_ResponseEnd()
		API_ResponseClear()
		return
	end
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local BoxID = g_nHousePresentBoxFastID[HouseID][ActorID]
	if BoxID == nil or BoxID ~= NPCFastID then
		API_ActorSendMsg(ActorID,3,'你不是这个礼包的主人，无法打开它')
		API_ResponseEnd()
		API_ResponseClear()
		return
	end
	local SelectItem = API_RequestGetNumber(1)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	if SelectItem == 1 then
		if API_GetMonsterID(NPCFastID) <= 0 then
			return
		end
		local PlayOpenYMD = API_VarDataGetNumber(ActorID,1,epfunc_WYL_HouseYMD)
		local PlayYear = math.floor(PlayOpenYMD/10000) --取年月日的商数
		local PlayMonthDay = math.mod(PlayOpenYMD,10000) --取年月日的余数
		local PlayMonth = math.floor(PlayMonthDay/100) --取年月日余数的商数
		local PlayDay = math.mod(PlayMonthDay,100) --取年月日余数的商数的余数
		if Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
			API_DestroyMonster(NPCFastID)
			API_VarDataSetNumber(ActorID,1,epfunc_WYL_HouseYMD,YMD)
			local PlayLv = API_GetActorExpLevel(ActorID)
			if PlayLv > 55 then
				PlayLv = 55
			elseif PlayLv < 26 then
				PlayLv = 26
			end
			local OffLineTime = API_VarDataGetNumber(ActorID,1,epfunc_WYL_SourceData_OfflineTime)
			API_VarDataSetNumber(ActorID,1,epfunc_WYL_SourceData_OfflineTime,0)
			local OffLineTimeJF = math.floor(OffLineTime/600)
			OffLineTimeJF = OffLineTimeJF * 0.35
			OffLineTimeJF = math.floor(OffLineTimeJF/1)
			if OffLineTimeJF > epfunc_WYL_HouseExpJFMax then
				OffLineTimeJF = epfunc_WYL_HouseExpJFMax
			end
			local Exp = epfunc_WYL_OffLineExpTable[PlayLv].Exp
			local SJB = epfunc_WYL_OffLineExpTable[PlayLv].SJB
			local GXGoodsNum = math.floor((OffLineTimeJF * Exp)/100)
			local SJBGoodsNum = math.floor((OffLineTimeJF * SJB)/100)
			local GXGoodsID = 80498
			local SJBGoodsID = 80696
			local OldPlayXZID = 88097
			local OldPlayXZNum = 0
			if OffLineTimeJF >= epfunc_WYL_HouseExpJFMax * 1 then
				OldPlayXZNum = 6
			elseif OffLineTimeJF >= epfunc_WYL_HouseExpJFMax * 0.8 then
				OldPlayXZNum = 5
			elseif OffLineTimeJF >= epfunc_WYL_HouseExpJFMax * 0.6 then
				OldPlayXZNum = 4
			elseif OffLineTimeJF >= epfunc_WYL_HouseExpJFMax * 0.4 then
				OldPlayXZNum = 3
			elseif OffLineTimeJF >= epfunc_WYL_HouseExpJFMax * 0.2 then
				OldPlayXZNum = 2
			elseif OffLineTimeJF >= epfunc_WYL_HouseExpJFMax * 0.1 then
				OldPlayXZNum = 1
			end
			local LinShiJiangLiTable = {}
			API_ResponseWrite('<name>离线礼包</name>')
			API_ResponseWrite('<text>打开礼包获得：</text><br>')
			if GXGoodsNum > 0 then 
				if LinShiJiangLiTable[GXGoodsID] == nil then
					LinShiJiangLiTable[GXGoodsID] = GXGoodsNum
				else
					LinShiJiangLiTable[GXGoodsID] = LinShiJiangLiTable[GXGoodsID] + GXGoodsNum
				end
			end
			if SJBGoodsNum > 0 then 
				if LinShiJiangLiTable[SJBGoodsID] == nil then
					LinShiJiangLiTable[SJBGoodsID] = SJBGoodsNum
				else
					LinShiJiangLiTable[SJBGoodsID] = LinShiJiangLiTable[SJBGoodsID] + SJBGoodsNum
				end
			end
			if OldPlayXZNum > 0 then 
				if LinShiJiangLiTable[OldPlayXZID] == nil then
					LinShiJiangLiTable[OldPlayXZID] = OldPlayXZNum
				else
					LinShiJiangLiTable[OldPlayXZID] = LinShiJiangLiTable[OldPlayXZID] + OldPlayXZNum
				end
			end
			if LinShiJiangLiTable[80842] == nil then
				LinShiJiangLiTable[80842] = 1
			else
				LinShiJiangLiTable[80842] = LinShiJiangLiTable[80842] + 1
			end
			for j,v in LinShiJiangLiTable do 
				if API_ActorCanAddGoods(ActorID,j,v,1,1) ~= -1 then
					API_AddActorGoodsFlag(ActorID,j,v,1,'领取离线奖励获得'..v..'个'..API_GetGoodsName(j)..'')
					API_ActorSendMsg(ActorID,10,'领取离线奖励获得'..v..'个'..API_GetGoodsName(j)..'')
					API_ResponseWrite('<img srcgd="'..j..'" tipgd="'..j..'" ><text>  × '..v..'    </text>')
				else
					API_SendActorMailByName(PlayName,j,v,1,'离线奖励','领取离线奖励，获得'..v..'个'..API_GetGoodsName(j)..'')
					API_ActorSendMsg(ActorID,10,'领取离线奖励获得'..v..'个'..API_GetGoodsName(j)..'')
					API_ResponseWrite('<img srcgd="'..j..'" tipgd="'..j..'" ><text>  × '..v..'（请到邮箱领取）    </text>')
				end
			end
			API_ResponseWrite('<br><br><a>确定</a><br>')
		else
			API_ResponseWrite('<name>离线礼包</name>')
			API_ResponseWrite('<br><text>你今天已经打开过礼包了，一个人一天只能打开一次礼包。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	else
		API_ResponseWrite('<name>离线礼包</name>')
		API_ResponseWrite('<br><a href="SpringFestival_NPCLiWu?1=1">打开礼包</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	end
end

function SpringFestival_NewNPCLiWu(ActorID,NPCID)
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
		elseif NPCID == 12243 then
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
					API_ActorSendMsg(ActorID,3,'礼盒打开中……，需时'..GLOBAL_ConvectionTimerCN..'秒，打开期间请不要移动，否则将打开失败')
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
		API_ActorSendMsg(ActorID,3,'打不开哦，请在春节活动期间内[1月27日--2月17日]再来尝试吧。')
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
		elseif NPCID == 12243 then
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
					elseif NPCID == 12243 then
						BiaoZhi2 = OpenYi * 100 + (BiaoZhi+1) * 10 + OpenSan
					elseif NPCID == 11775 then
						BiaoZhi2 = OpenYi * 100 + OpenEr * 10 + (BiaoZhi+1)
					end
					API_VarDataSetNumber(ActorID,1,19025,BiaoZhi2)
					API_VarDataSetNumber(ActorID,1,19026,YMD)
					--给奖励					
					local GoodsID = 0
					if NPCID == 12243 then
						GoodsID = SpringFestival_NPCLiWuTable[NPCID][math.random(2)].GoodsID
					else
						GoodsID = SpringFestival_NPCLiWuTable[NPCID][1].GoodsID
					end
					API_AddActorGoodsFlag(ActorID,GoodsID,10,3,'打开'..API_GetMonsterNameByID(NPCID)..'获得10个'..API_GetGoodsName(GoodsID)..'')
					API_ActorSendMsg(ActorID,9,'打开'..API_GetMonsterNameByID(NPCID)..'获得10个'..API_GetGoodsName(GoodsID)..'')
--~ 					local LaiYuan = API_ActorGetPropNum(ActorID,201)
--~ 					if GLOBAL_FengXiangBiao_DateList[8][6][LaiYuan] == nil then
--~ 						GLOBAL_FengXiangBiao_DateList[8][6][LaiYuan] = 1
--~ 					else
--~ 						GLOBAL_FengXiangBiao_DateList[8][6][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][6][LaiYuan] + 1
--~ 					end
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

SpringFestival_MascotBoxGoods = {
	[88879] = {
		[1] = {
			{GoodsID=39501,GaiLv1=1,GaiLv2=11964,NumGaiLv=6020,NumMax=1,NumMin=0},
			{GoodsID=39502,GaiLv1=11965,GaiLv2=23929,NumGaiLv=6020,NumMax=1,NumMin=0},
			{GoodsID=39503,GaiLv1=23930,GaiLv2=35894,NumGaiLv=6020,NumMax=1,NumMin=0},
			{GoodsID=39510,GaiLv1=35895,GaiLv2=47859,NumGaiLv=6020,NumMax=1,NumMin=0},
			{GoodsID=39513,GaiLv1=47860,GaiLv2=59824,NumGaiLv=6020,NumMax=1,NumMin=0},
			{GoodsID=80383,GaiLv1=59825,GaiLv2=346984,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=80381,GaiLv1=346985,GaiLv2=552098,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=80397,GaiLv1=552099,GaiLv2=731573,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=784,GaiLv1=731574,GaiLv2=771457,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=771458,GaiLv2=843247,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=40003,GaiLv1=843248,GaiLv2=915037,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=40013,GaiLv1=915038,GaiLv2=986827,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=40023,GaiLv1=986828,GaiLv2=1058617,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=40093,GaiLv1=1058618,GaiLv2=1130407,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=31015,GaiLv1=1130408,GaiLv2=1166302,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=31016,GaiLv1=1166303,GaiLv2=1202197,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=76,GaiLv1=1202198,GaiLv2=1238092,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=80686,GaiLv1=1238093,GaiLv2=1309882,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=80689,GaiLv1=1309883,GaiLv2=1381672,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=31101,GaiLv1=1381673,GaiLv2=1417567,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=75,GaiLv1=1417568,GaiLv2=1489357,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=11026,GaiLv1=1489358,GaiLv2=1496536,NumGaiLv=840,NumMax=1,NumMin=0},
			{GoodsID=11027,GaiLv1=1496537,GaiLv2=1501322,NumGaiLv=560,NumMax=1,NumMin=0},
			{GoodsID=88137,GaiLv1=1501323,GaiLv2=1788482,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88149,GaiLv1=1788483,GaiLv2=2075642,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88150,GaiLv1=2075643,GaiLv2=2362802,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88151,GaiLv1=2362803,GaiLv2=2649962,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=78,GaiLv1=2649963,GaiLv2=2721752,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32000,GaiLv1=2721753,GaiLv2=3008912,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32101,GaiLv1=3008913,GaiLv2=3023270,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32011,GaiLv1=3023271,GaiLv2=3037628,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32012,GaiLv1=3037629,GaiLv2=3042414,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32013,GaiLv1=3042415,GaiLv2=3046004,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32014,GaiLv1=3046005,GaiLv2=3046722,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32015,GaiLv1=3046723,GaiLv2=3047201,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32016,GaiLv1=3047202,GaiLv2=3047560,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11028,GaiLv1=3047561,GaiLv2=3054739,NumGaiLv=840,NumMax=1,NumMin=0},
			{GoodsID=11029,GaiLv1=3054740,GaiLv2=3059525,NumGaiLv=560,NumMax=1,NumMin=0},
			{GoodsID=11034,GaiLv1=3059526,GaiLv2=3061320,NumGaiLv=210,NumMax=1,NumMin=0},
			{GoodsID=11035,GaiLv1=3061321,GaiLv2=3061679,NumGaiLv=42,NumMax=1,NumMin=0},
			{GoodsID=11036,GaiLv1=3061680,GaiLv2=3068858,NumGaiLv=840,NumMax=1,NumMin=0},
			{GoodsID=11037,GaiLv1=3068859,GaiLv2=3073644,NumGaiLv=560,NumMax=1,NumMin=0},
			{GoodsID=11046,GaiLv1=3073645,GaiLv2=3080823,NumGaiLv=840,NumMax=1,NumMin=0},
			{GoodsID=11047,GaiLv1=3080824,GaiLv2=3085609,NumGaiLv=560,NumMax=1,NumMin=0},
			{GoodsID=11042,GaiLv1=3085610,GaiLv2=3087404,NumGaiLv=210,NumMax=1,NumMin=0},
			{GoodsID=11043,GaiLv1=3087405,GaiLv2=3087763,NumGaiLv=42,NumMax=1,NumMin=0},
			{GoodsID=11045,GaiLv1=3087764,GaiLv2=3090239,NumGaiLv=289,NumMax=1,NumMin=0},
			{GoodsID=80195,GaiLv1=3090240,GaiLv2=6679731,NumGaiLv=5000,NumMax=4,NumMin=3},
			{GoodsID=80697,GaiLv1=6679732,GaiLv2=9551324,NumGaiLv=8000,NumMax=3,NumMin=2},
			{GoodsID=88171,GaiLv1=9551325,GaiLv2=9641062,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=9641063,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},
			},
		[2] = {
			{GoodsID=39501,GaiLv1=1,GaiLv2=18788,NumGaiLv=6020,NumMax=1,NumMin=0},
			{GoodsID=39502,GaiLv1=18789,GaiLv2=37577,NumGaiLv=6020,NumMax=1,NumMin=0},
			{GoodsID=39503,GaiLv1=37578,GaiLv2=56366,NumGaiLv=6020,NumMax=1,NumMin=0},
			{GoodsID=39510,GaiLv1=56367,GaiLv2=75155,NumGaiLv=6020,NumMax=1,NumMin=0},
			{GoodsID=39513,GaiLv1=75156,GaiLv2=93944,NumGaiLv=6020,NumMax=1,NumMin=0},
			{GoodsID=80384,GaiLv1=93945,GaiLv2=295246,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=80382,GaiLv1=295247,GaiLv2=431065,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=31017,GaiLv1=431066,GaiLv2=459248,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=31018,GaiLv1=459249,GaiLv2=487431,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=31019,GaiLv1=487432,GaiLv2=515614,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=76,GaiLv1=515615,GaiLv2=571979,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=40004,GaiLv1=571980,GaiLv2=647132,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=40014,GaiLv1=647133,GaiLv2=722285,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=40024,GaiLv1=722286,GaiLv2=797438,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=40094,GaiLv1=797439,GaiLv2=872591,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=80697,GaiLv1=872592,GaiLv2=5381756,NumGaiLv=10000,NumMax=5,NumMin=4},
			{GoodsID=88137,GaiLv1=5381757,GaiLv2=5832673,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88149,GaiLv1=5832674,GaiLv2=6283590,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88150,GaiLv1=6283591,GaiLv2=6734507,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88151,GaiLv1=6734508,GaiLv2=7185424,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=78,GaiLv1=7185425,GaiLv2=7298154,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32000,GaiLv1=7298155,GaiLv2=7749071,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32101,GaiLv1=7749072,GaiLv2=7771617,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32011,GaiLv1=7771618,GaiLv2=7794163,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32012,GaiLv1=7794164,GaiLv2=7801679,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32013,GaiLv1=7801680,GaiLv2=7807316,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32014,GaiLv1=7807317,GaiLv2=7808444,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32015,GaiLv1=7808445,GaiLv2=7809196,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32016,GaiLv1=7809197,GaiLv2=7809760,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80196,GaiLv1=7809761,GaiLv2=8373406,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=9507,GaiLv1=8373407,GaiLv2=8376627,NumGaiLv=1200,NumMax=1,NumMin=0},
			{GoodsID=80397,GaiLv1=8376628,GaiLv2=8658450,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=785,GaiLv1=8658451,GaiLv2=8721078,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=8721079,GaiLv2=8833808,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=80686,GaiLv1=8833809,GaiLv2=8946538,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=80689,GaiLv1=8946539,GaiLv2=9059268,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=31101,GaiLv1=9059269,GaiLv2=9115633,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=75,GaiLv1=9115634,GaiLv2=9228363,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=11026,GaiLv1=9228364,GaiLv2=9239636,NumGaiLv=840,NumMax=1,NumMin=0},
			{GoodsID=11027,GaiLv1=9239637,GaiLv2=9247152,NumGaiLv=560,NumMax=1,NumMin=0},
			{GoodsID=11028,GaiLv1=9247153,GaiLv2=9258425,NumGaiLv=840,NumMax=1,NumMin=0},
			{GoodsID=11029,GaiLv1=9258426,GaiLv2=9265941,NumGaiLv=560,NumMax=1,NumMin=0},
			{GoodsID=11034,GaiLv1=9265942,GaiLv2=9268760,NumGaiLv=210,NumMax=1,NumMin=0},
			{GoodsID=11035,GaiLv1=9268761,GaiLv2=9269324,NumGaiLv=42,NumMax=1,NumMin=0},
			{GoodsID=11036,GaiLv1=9269325,GaiLv2=9280597,NumGaiLv=840,NumMax=1,NumMin=0},
			{GoodsID=11037,GaiLv1=9280598,GaiLv2=9288113,NumGaiLv=560,NumMax=1,NumMin=0},
			{GoodsID=11046,GaiLv1=9288114,GaiLv2=9295629,NumGaiLv=840,NumMax=1,NumMin=0},
			{GoodsID=11047,GaiLv1=9295630,GaiLv2=9303145,NumGaiLv=560,NumMax=1,NumMin=0},
			{GoodsID=11042,GaiLv1=9303146,GaiLv2=9305964,NumGaiLv=210,NumMax=1,NumMin=0},
			{GoodsID=11043,GaiLv1=9305965,GaiLv2=9306528,NumGaiLv=42,NumMax=1,NumMin=0},
			{GoodsID=11045,GaiLv1=9306529,GaiLv2=9310416,NumGaiLv=289,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=9310417,GaiLv2=9874062,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88171,GaiLv1=9874063,GaiLv2=9968003,NumGaiLv=7000,NumMax=1,NumMin=0},
			{GoodsID=80387,GaiLv1=9968004,GaiLv2=10000000,NumGaiLv=7000,NumMax=1,NumMin=0},
			},
		},
}
--福神礼盒
function SpringFestival_OpenMascotBox(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if SpringFestival_MascotBoxGoods[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效道具')
		return 0
	end
	if API_ActorGetPackageSize(ActorID) < 1 then
		API_ActorSendMsg(ActorID,3,'背包已满，无法使用')
		return 0
	end
	local PlayLv = API_GetActorExpLevel(ActorID)
	local JiangLiQuYu = 1
	if PlayLv > 25 then
		JiangLiQuYu = 2
	end
	local JiangLiTable = SpringFestival_MascotBoxGoods[GoodsID][JiangLiQuYu]
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
			local NumRandom = math.random(10000)
			if NumRandom <= NumGaiLv then
				JiangLiGoodsNum = NumMax
			else
				JiangLiGoodsNum = NumMin
			end
			if JiangLiGoodsNum > 0 then
				if WYL_SevenDragonBalls_MaxGoodsNumTable[JiangLiGoodsID] ~= nil then
					local Num = WYL_SevenDragonBalls_MaxGoodsNumTable[JiangLiGoodsID].Num
					local MaxNum = WYL_SevenDragonBalls_MaxGoodsNumTable[JiangLiGoodsID].MaxNum
					if Num < MaxNum then
						Num = Num + JiangLiGoodsNum
						WYL_SevenDragonBalls_MaxGoodsNumTable[JiangLiGoodsID].Num = Num 
					else
						JiangLiGoodsID = 80697
						JiangLiGoodsNum = 4
						if PlayLv > 25 then
							JiangLiGoodsNum = 5
						end
					end
				elseif WYL_SevenDragonBalls_GoodsMaxNumTable[JiangLiGoodsID] ~= nil then
					local MaxNum = WYL_SevenDragonBalls_GoodsMaxNumTable[JiangLiGoodsID].MaxNum
					local Key = WYL_SevenDragonBalls_GoodsMaxNumTable[JiangLiGoodsID].Key
					local NowNum = API_VarDataGetNumber_Ex(1, 0, -1999, 1, Key)
					if NowNum < MaxNum then
						NowNum = NowNum + 1
						API_VarDataSetNumber_Ex_Sync(1, 0, -1999, 1, Key, NowNum)
					else
						JiangLiGoodsID = 80697
						JiangLiGoodsNum = 4
						if PlayLv > 25 then
							JiangLiGoodsNum = 5
						end
					end
				end
			else
				JiangLiGoodsID = 80697
				JiangLiGoodsNum = 4
				if PlayLv > 25 then
					JiangLiGoodsNum = 5
				end
			end
		end
	end
	if API_ActorRemoveGoods(ActorID, GoodsID, 1, '打开福神宝箱') then
		local GoodsName = API_GetGoodsName(JiangLiGoodsID)
		local PD2 = 0
		for j,v in baoshiwupinbiao do
			if JiangLiGoodsID == v then
				PD2 = 1
				break
			end
		end
		if PD2 == 1 then
			fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
		else
			API_AddActorGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,'福神宝箱奖励')
		end
		API_ActorSendMsg(ActorID,10,'福神赐福，获得：'..JiangLiGoodsNum..'个'..GoodsName..'')
	end
	return 1
end
--爆竹
function SpringFestival_UseFirecrackers(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,88880) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if MapID ~= StaticMapID then
		API_ActorSendMsg(ActorID,3,'无法在本地图使用')
		return 0
	end
	API_ActorStartSelect(ActorID,'SpringFestival_Boom',16) 
	API_ActorSendMsg(ActorID,3,'请左键点击其他玩家')
	return 1
end
function SpringFestival_Boom()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local OtherID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if API_ActorGetGoodsNum(ActorID,88880) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return
	end
	if MapID ~= StaticMapID then
		API_ActorSendMsg(ActorID,3,'无法在本地图使用')
		return
	end
	if SelectType == 2 then
		if ActorID ~= OtherID then
			local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
			if PublicFun_AccountDistance(TileX,TileY,SelectTileX,SelectTileY) > 10 then
				API_ActorSendMsg(ActorID,3,'目标的位置太远，请就近选择')
				return
			end
			if API_ActorRemoveGoods(ActorID,88880,1,'使用春节爆竹') then
				API_ActorUseSkill(ActorID,501,1,0,0,1,OtherID)
				API_ActorSendMsg(ActorID,3,'你对'..API_GetActorName(OtherID)..'丢了一捆爆竹')
				API_ActorSendMsg(OtherID,3,''..API_GetActorName(ActorID)..'对你丢了一捆爆竹')
			end
		else
			API_ActorStartSelect(ActorID,'SpringFestival_Boom',16) 
			API_ActorSendMsg(ActorID,3,'请左键点击其他玩家')
		end
	else
		API_ActorStartSelect(ActorID,'SpringFestival_Boom',16) 
		API_ActorSendMsg(ActorID,3,'请左键点击其他玩家')
	end
end

----------------------------------以下为谭明礼提供
--新年礼物兑换官
--活动时间：2月4日测试服\2月20日结束
--新春幸运大使	12240

TML_XinNianLiWuDHG_Jiao = 82018	--薄荷龙鳞ID
TML_XinNianLiWuDHG_Jiao_OLD2 = 80061	--同名旧物品：薄荷龙鳞(80061)
function TML_GetJiaoNum(ActorID)
	return API_ActorGetGoodsNum(ActorID,TML_XinNianLiWuDHG_Jiao) + API_ActorGetGoodsNum(ActorID,TML_XinNianLiWuDHG_Jiao_OLD2)
end
function TML_RemoveJiao(ActorID,n)
	local ids = {TML_XinNianLiWuDHG_Jiao_OLD2, TML_XinNianLiWuDHG_Jiao}
	local need = n
	for i = 1, table.getn(ids) do
		if need > 0 then
			local have = API_ActorGetGoodsNum(ActorID,ids[i])
			local use = have
			if use > need then use = need end
			if use > 0 then
				if not API_ActorRemoveGoods(ActorID,ids[i],use,'兑换扣除货币') then
					return false
				end
				need = need - use
			end
		end
	end
	if need > 0 then
		return false
	end
	return true
end

XinNianLiWuDHG_Goods_Table = {
	[1] = {	
                        {GoodsID=911,Point=5000,Jiao=0},
                        {GoodsID=80687,Point=0,Jiao=10},
			{GoodsID=80688,Point=0,Jiao=10},
                     {GoodsID=89196,Point=0,Jiao=1},
                     --[6星魂器宝箱 已移至「古仙令兑换」 100/个]   --六星魂器宝箱(龙鳞翻倍)
                     {GoodsID=89247,Point=0,Jiao=50},   --新英雄技能书
                     {GoodsID=89248,Point=0,Jiao=50},   --新英雄技能书
                     {GoodsID=89249,Point=0,Jiao=50},   --新英雄技能书
                     {GoodsID=89250,Point=0,Jiao=50},   --新英雄技能书
                     {GoodsID=89251,Point=0,Jiao=50},   --新英雄技能书
                     {GoodsID=89252,Point=0,Jiao=50},   --新英雄技能书
                     {GoodsID=89253,Point=0,Jiao=50},   --新英雄技能书
                     {GoodsID=89267,Point=0,Jiao=100},   --无极英雄秘籍【物理】
				},
}

function XinNianLiWuDHG_DuiHua(ActorID, NPCID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ActorID = ActorID or API_RequestGetActorID()
--~ 	local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
--~ 	local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
--~ 	if nShiFouStart < 0 and nShiFouEnd > 0 then
		API_ResponseWrite('<name>新年礼物兑换官</name>')
		API_ResponseWrite('<text>亲爱的玩家，您好！</text><br>')
		API_ResponseWrite('<text>    你只需要使用 “薄荷龙鳞”加一定的云游代金券，就能与我兑换各种珍贵物品。</text><br><br>')
		API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHuan?1=1">我要兑换</a><br><br>')
		API_ResponseWrite('<a>关闭</a>')
--~ 	else
--~ 		API_ResponseWrite('<name>新年礼物兑换官</name>')
--~ 		API_ResponseWrite('<text>兑换活动已结束</text><br><br>')
--~ 		API_ResponseWrite('<a>关闭</a>')
--~ 	end
end

function XinNianLiWuDHG_DuiHuan()
	local ActorID = API_RequestGetActorID()
	local ActorName = API_GetActorName(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if XinNianLiWuDHG_Goods_Table[SelectItem] == nil then
		return
	end
	if type(XinNianLiWuDHG_Goods_Table[SelectItem]) ~= 'table' then
		return
	end
	local GoodsNum = table.getn(XinNianLiWuDHG_Goods_Table[SelectItem])
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if XinNianLiWuDHG_Goods_Table[SelectItem][BuyNo] ~= nil then
			local BuyGoodsID = XinNianLiWuDHG_Goods_Table[SelectItem][BuyNo].GoodsID
			local BuyPoint = XinNianLiWuDHG_Goods_Table[SelectItem][BuyNo].Point
			local BuyJiao = XinNianLiWuDHG_Goods_Table[SelectItem][BuyNo].Jiao
			local BuyNum = API_RequestGetNumber(num)
			if BuyNum < 1 then
				BuyNum = 1
			end
			BuyPoint = BuyPoint * BuyNum
			BuyJiao = BuyJiao * BuyNum
			if BuyPoint < 0 or BuyPoint > 100000000 then
				return
			end
			if BuyJiao < 0 or BuyJiao > 100000000 then
				return
			end
			--if Year == 2010 and Month == 2 and Day >= 4 and Day <= 20 then
--~ 			local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
--~ 			local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
--~ 			if nShiFouStart < 0 and nShiFouEnd > 0 then
if BuyPoint == 0 and BuyJiao == 0 then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
						API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'新年礼物兑换官兑换')
						API_ResponseWrite('<name>新年礼物兑换官</name>')
						API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
						API_ResponseWrite('<text>兑换了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
						API_ResponseWrite('<text>     </text>')
						API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHuan?1=1">返回</a>')
					else
						API_ResponseWrite('<name>新年礼物兑换官</name>')
						API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				elseif BuyPoint > 0 and BuyJiao > 0 then
					if TML_GetJiaoNum(ActorID) >= BuyJiao then
						if API_ActorGetGoodsNum(ActorID,TML_YYSR_YYDJQID) >= BuyPoint then
							if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
								if API_ActorRemoveGoods(ActorID,TML_YYSR_YYDJQID,BuyPoint,"删除对应价格数量的云游代金券") then
									if TML_RemoveJiao(ActorID,BuyJiao) then
										API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'新年礼物兑换官兑换')
										API_ResponseWrite('<name>新年礼物兑换官</name>')
										API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
										API_ResponseWrite('<text>您消耗</text><text color="255,0,255">'..BuyPoint..'张</text><text>云游代金券，</text><text color="255,0,255">'..BuyJiao..'个</text><text>“薄荷龙鳞”兑换了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
										API_ResponseWrite('<br><br><a>确定</a>')
										API_ResponseWrite('<text>     </text>')
										API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHuan?1=1">返回</a>')
										if BuyGoodsID == 32101 and not API_IsBattleGameServer() then
											API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,''..ActorName..'在新年礼物兑换官处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
											API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,''..ActorName..'在新年礼物兑换官处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
										end
										--风向标
										if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID] ~= nil then
											local LaiYuan = API_ActorGetPropNum(ActorID,201)
											if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] == nil then
												GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = BuyNum
											else
												GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] + BuyNum
											end
										end
									end
								end
							else
								API_ResponseWrite('<name>新年礼物兑换官</name>')
								API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
								API_ResponseWrite('<br><br><a>确定</a>')
							end
						else
							API_ResponseWrite('<name>新年礼物兑换官</name>')
							API_ResponseWrite('<text>您的云游代金券数量不够，无法兑换</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name>新年礼物兑换官</name>')
						API_ResponseWrite('<text>您的“薄荷龙鳞”数量不够，无法兑换</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				elseif BuyPoint > 0 and BuyJiao == 0 then
					if API_ActorGetGoodsNum(ActorID,TML_YYSR_YYDJQID) >= BuyPoint then
						if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
							if API_ActorRemoveGoods(ActorID,TML_YYSR_YYDJQID,BuyPoint,"删除对应价格数量的云游代金券") then
								API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'新年礼物兑换官兑换')
								API_ResponseWrite('<name>新年礼物兑换官</name>')
								API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
								API_ResponseWrite('<text>您消耗</text><text color="255,0,255">'..BuyPoint..'张</text><text>云游代金券，兑换了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
								API_ResponseWrite('<br><br><a>确定</a>')
								API_ResponseWrite('<text>     </text>')
								API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHuan?1=1">返回</a>')
								if BuyGoodsID == 32101 and not API_IsBattleGameServer() then
									API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,''..ActorName..'在新年礼物兑换官处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
									API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,''..ActorName..'在新年礼物兑换官处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
								end
								--风向标
								if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = BuyNum
									else
										GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] + BuyNum
									end
								end
							end
						else
							API_ResponseWrite('<name>新年礼物兑换官</name>')
							API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name>新年礼物兑换官</name>')
						API_ResponseWrite('<text>您的云游代金券数量不够，无法兑换</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				elseif BuyPoint == 0 and BuyJiao > 0 then
					if TML_GetJiaoNum(ActorID) >= BuyJiao then
						if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
							if TML_RemoveJiao(ActorID,BuyJiao) then
								API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'新年礼物兑换官兑换')
								API_ResponseWrite('<name>新年礼物兑换官</name>')
								API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
								API_ResponseWrite('<text>您消耗</text><text color="255,0,255">'..BuyJiao..'个</text><text>“薄荷龙鳞”兑换了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
								API_ResponseWrite('<br><br><a>确定</a>')
								API_ResponseWrite('<text>     </text>')
								API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHuan?1=1">返回</a>')
								if BuyGoodsID == 32101 and not API_IsBattleGameServer() then
									API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,''..ActorName..'在新年礼物兑换官处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
									API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,''..ActorName..'在新年礼物兑换官处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
								end
								--风向标
								if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = BuyNum
									else
										GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] + BuyNum
									end
								end
							end
						else
							API_ResponseWrite('<name>新年礼物兑换官</name>')
							API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name>新年礼物兑换官</name>')
						API_ResponseWrite('<text>您的“薄荷龙鳞”数量不够，无法兑换</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				end
--~ 			else
--~ 				API_ResponseWrite('<name>新年礼物兑换官</name>')
--~ 				API_ResponseWrite('<text>兑换活动已结束</text>')
--~ 				API_ResponseWrite('<br><br><a>确定</a>')
--~ 			end
		end
		return
	end
	if SelectItem == 1 then
		API_ResponseWrite('<name>兑换道具</name>')
		API_ResponseWrite('<win rect="30,75,470,510"></win>')
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br>')
--~ 		API_ResponseWrite('<text color="255,0,255">活动时间：1月27日～2月17日</text><br><br>')
		for i = 1,GoodsNum do
			if i > Page * 6 and i < (Page + 1) * 6 + 1 then
				local BuyGoodsID = XinNianLiWuDHG_Goods_Table[SelectItem][i].GoodsID
				local BuyPoint = XinNianLiWuDHG_Goods_Table[SelectItem][i].Point
				local BuyJiao = XinNianLiWuDHG_Goods_Table[SelectItem][i].Jiao
				API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
				API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
				local BuyNumTip = ''
				local BuyPointTip = '<text>  单价：'..string.format("%-6s",BuyPoint..'张')..'</text>'
				BuyPointTip = BuyPointTip..'<text color="254,249,220">云游代金券 + </text>'
				BuyPointTip = BuyPointTip..'<text>'..string.format("%-5s",BuyJiao..'个')..'</text>'
				BuyPointTip = BuyPointTip..'<text color="254,249,220">薄荷龙鳞       </text>'
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
				API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" href="XinNianLiWuDHG_DuiHuan?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
				API_ResponseWrite('<text>——————————————————————————————————</text><br>')
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
				API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHua">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="XinNianLiWuDHG_DuiHuan?1='..SelectItem..'&2='..NextPage..'">')
			elseif (Page + 1) * 6 < GoodsNum then
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="XinNianLiWuDHG_DuiHuan?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHua">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="XinNianLiWuDHG_DuiHuan?1='..SelectItem..'&2='..NextPage..'">')
			else
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="XinNianLiWuDHG_DuiHuan?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="XinNianLiWuDHG_DuiHua">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_g.bmp">')
			end
		else
			API_ResponseWrite('<br><a href="XinNianLiWuDHG_DuiHua">  返回</a>')
		end
	end
end
