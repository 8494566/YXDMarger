----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\MysteriousPlace.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2010-3-31
--版  本:	1.0
--描  述:	增值道具-神秘卷轴(改)
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：万钰林
--日期：2010-3-31
--功能：创建
---------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
--修 改 人：黄蕾
--修改时间：20120221
--修改内容：财神增加限量时装与限量物品，交互数据-6199.
--修改时间：20120706
--修改内容：夏日增加限量时装与限量物品，
--修改时间：20120807
--修改内容：财神奖励修改
--修改时间：20120813
--修改内容：七夕期间神秘，财神，深寒增加爱慕之心掉落（88952）
--          0817爱慕之心改为鲜花83111,89188
-----------------------------------------------------------------------------------------------------------------------
--~ 88916	契约魔坛传送卷  MysteriousPlace_ContractUse
--~ 88917	月神别苑传送卷  MysteriousPlace_LunaUse
--~ 88918	深寒地宫传送卷  MysteriousPlace_ColdUse
--七夕时间表
 HL_PeiHeHuoDong_StartTime = {Year = 2012,Month = 8,Day = 16,Hour = 0,Minute = 0,Second = 0}
 HL_PeiHeHuoDong__EndTime = {Year = 2012,Month = 9,Day = 3,Hour = 0,Minute = 0,Second = 0}
 
--国庆时间表
HL_GqPeiHeHuoDong_StartTime = {Year = 2012,Month = 9,Day = 21,Hour = 0,Minute = 0,Second = 0}
HL_GqPeiHeHuoDong__EndTime = {Year = 2012,Month = 10,Day = 7,Hour = 23,Minute = 59,Second = 59} 
 
							
function MysteriousPlace_ContractUse(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove,High,Low)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID) 
	local MapConfigID = API_GetMapConfigID(MapID) 
	local StaticMapID = API_GetStaticMapID(MapID)
	if MapConfigID == 130 then
		API_ActorSendMsg(ActorID,3,'本地图内无法使用该道具')
		return 0
	end
	API_ResponseWrite('<name></name>')
	if MapID == StaticMapID then
		API_ResponseWrite('<br><text>您即将进入契约魔坛。进入契约魔坛消灭BOSS，您将获得超丰厚的奖励！更有机会额外获得最新强力属性道具“符文卷轴”！</text><br>') 
		API_ResponseWrite('<br><text>您也可以带领其他队员一同进入，但队友必须与您在同一地图。</text><text color="255,0,255">组队进入能更快速、安全的击杀BOSS！</text><br>') 
		API_ResponseWrite('<br><br><a href="MysteriousPlace_ContractClick">我要进入</a><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_ResponseWrite('<br><text>契约魔坛传送卷使用失败！亲爱的玩家，此卷轴只可以在浮空岛以外地图打开。</text><br>') 
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end
end

function MysteriousPlace_LunaUse(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove,High,Low)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID) 
	local MapConfigID = API_GetMapConfigID(MapID) 
	local StaticMapID = API_GetStaticMapID(MapID)
	if MapConfigID == 130 then
		API_ActorSendMsg(ActorID,3,'本地图内无法使用该道具')
		return 0
	end
	API_ResponseWrite('<name></name>')
	if MapID == StaticMapID then
		API_ResponseWrite('<br><text>您即将进入月神别苑。进入月神别苑消灭BOSS，您将获得珍贵家具！</text><br>') 
		API_ResponseWrite('<br><text>您也可以带领其他队员一同进入，但队友必须与您在同一地图。</text><text color="255,0,255">组队进入能更快速、安全的击杀BOSS！</text><br>') 
		API_ResponseWrite('<br><br><a href="MysteriousPlace_LunaClick">我要进入</a><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_ResponseWrite('<br><text>月神别苑传送卷使用失败！亲爱的玩家，此卷轴只可以在浮空岛以外地图打开。</text><br>') 
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end
end

function MysteriousPlace_ColdUse(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove,High,Low)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID) 
	local MapConfigID = API_GetMapConfigID(MapID) 
	local StaticMapID = API_GetStaticMapID(MapID)
	if MapConfigID == 130 then
		API_ActorSendMsg(ActorID,3,'本地图内无法使用该道具')
		return 0
	end
	API_ResponseWrite('<name></name>')
	if MapID == StaticMapID then
		API_ResponseWrite('<br><text>您即将进入深寒地宫。进入深寒地宫消灭BOSS，您便有机会获得珍贵装备改造材料！</text><br>') 
		API_ResponseWrite('<br><text>您也可以带领其他队员一同进入，但队友必须与您在同一地图。</text><text color="255,0,255">组队进入能更快速、安全的击杀BOSS！</text><br>') 
		API_ResponseWrite('<br><br><a href="MysteriousPlace_ColdClick">我要进入</a><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_ResponseWrite('<br><text>深寒地宫传送卷使用失败！亲爱的玩家，此卷轴只可以在浮空岛以外地图打开。</text><br>') 
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end
end
--契约魔坛
function MysteriousPlace_ContractClick()
	local ActorID = API_RequestGetActorID() 
	local GoodsID = 88916
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 
	end
	if MysteriousPlace_InJudge(ActorID,GoodsID) == 1 and API_ActorRemoveGoods(ActorID,GoodsID,1, '使用契约魔坛卷轴') then
		local ObjectMapID = API_CreateEctype(1949,0)
		API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.level,GoodsID)
		API_CreateMonster(ObjectMapID,11607,62,40,3,0,-1)
		local FastID = API_CreateMonster(ObjectMapID,726449,60,69,5,0,-1)
		API_SetMonsterName(FastID, '契约魔坛守护者', 1)
		API_CreateDieTriggerG(ActorID,0,0,FastID,'MysteriousPlace_BossDieFunc')
		API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'WYL_MysteriousDoor_PlayGotoMap')
	end
end
--月神别苑
function MysteriousPlace_LunaClick()
	local ActorID = API_RequestGetActorID() 
	local GoodsID = 88917
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 
	end
	if MysteriousPlace_InJudge(ActorID,GoodsID) == 1 and API_ActorRemoveGoods(ActorID,GoodsID,1, '使用月神别苑卷轴') then
		local ObjectMapID = API_CreateEctype(1949,0)
		API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.level,GoodsID)
		API_CreateMonster(ObjectMapID,11607,62,40,3,0,-1)
		local FastID = API_CreateMonster(ObjectMapID,726449,60,69,5,0,-1)
		API_SetMonsterName(FastID, '月神别苑守护者', 1)
		API_CreateDieTriggerG(ActorID,0,0,FastID,'MysteriousPlace_BossDieFunc')
		API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'WYL_MysteriousDoor_PlayGotoMap')
	end
end
--深寒地宫
function MysteriousPlace_ColdClick()
	local ActorID = API_RequestGetActorID() 
	local GoodsID = 88918
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 
	end
	if MysteriousPlace_InJudge(ActorID,GoodsID) == 1 and API_ActorRemoveGoods(ActorID,GoodsID,1, '使用深寒地宫卷轴') then
		local ObjectMapID = API_CreateEctype(1949,0)
		API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.level,GoodsID)
		API_CreateMonster(ObjectMapID,11607,62,40,3,0,-1)
		local FastID = API_CreateMonster(ObjectMapID,726449,60,69,5,0,-1)
		API_SetMonsterName(FastID, '深寒地宫守护者', 1)
		API_CreateDieTriggerG(ActorID,0,0,FastID,'MysteriousPlace_BossDieFunc')
		API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'WYL_MysteriousDoor_PlayGotoMap')
		--周排名
		MLB_DaoJuShiYong(ActorID,5,1,0,0,0)
		--总排名
		MLB_DaoJuShiYong(ActorID,6,1,0,0,0)
		API_VarDataSetNumber(ActorID,0,12743,3)
	end
end

MysteriousPlace_FurnitureGoods = {38078,38079,38080,38081,38082,38083,38084,38085,38034,38035,38036,38037,38038,38039,38040,38041,38042,38043,}

MysteriousPlace_FurnitureValue = {
	[	38078	] = 	50	,
	[	38079	] = 	80	,
	[	38080	] = 	90	,
	[	38081	] = 	100	,
	[	38082	] = 	120	,
	[	38083	] = 	30	,
	[	38084	] = 	180	,
	[	38085	] = 	20	,
	
	[	38034	] = 	200	,
	[	38035	] = 	30	,
	[	38036	] = 	50	,
	[	38037	] = 	100	,
	[	38038	] = 	30	,
	[	38039	] = 	150	,
	[	38040	] = 	80	,
	[	38041	] = 	40	,
	[	38042	] = 	70	,
	[	38043	] = 	30	,

}

MysteriousPlace_EquipmentUpBasic = {
	[1] = {
		{GoodsID=80381,Num=10,},
		{GoodsID=80383,Num=10,},
		},
	[2] = {
		{GoodsID=80382,Num=10,},
		{GoodsID=80384,Num=10,},
		},
}

MysteriousPlace_UpGoodsA = {
	[1] = {
		{GoodsID=80381,Num=15,},
		{GoodsID=80383,Num=20,},
		{GoodsID=80409,Num=10,},
		{GoodsID=80405,Num=7,},
--~ 		{GoodsID=88594,Num=1,},
--~ 		{GoodsID=88598,Num=1,},
--~ 		{GoodsID=88602,Num=1,},
		},
	[2] = {
		{GoodsID=80382,Num=15,},
		{GoodsID=80384,Num=20,},
		{GoodsID=80409,Num=10,},
		{GoodsID=80405,Num=7,},
--~ 		{GoodsID=88594,Num=1,},
--~ 		{GoodsID=88598,Num=1,},
--~ 		{GoodsID=88602,Num=1,},
		},
}
MysteriousPlace_UpGoodsB = {
	[1] = {
		{GoodsID=80381,Num=50,},
		{GoodsID=80383,Num=50,},
		{GoodsID=80409,Num=10,},
		{GoodsID=80405,Num=10,},
--~ 		{GoodsID=88594,Num=1,},
--~ 		{GoodsID=88598,Num=1,},
--~ 		{GoodsID=88602,Num=1,},
		},
	[2] = {
		{GoodsID=80382,Num=50,},
		{GoodsID=80384,Num=50,},
		{GoodsID=80409,Num=10,},
		{GoodsID=80405,Num=10,},
--~ 		{GoodsID=88594,Num=1,},
--~ 		{GoodsID=88598,Num=1,},
--~ 		{GoodsID=88602,Num=1,},
		},
}

MysteriousPlace_UpGoodsCDA = {
	[8] = {MaxNum=5,CDmin=50,CDmax=65,},
	[9] = {MaxNum=5,CDmin=50,CDmax=65,},
	[10] = {MaxNum=5,CDmin=50,CDmax=65,},
	[11] = {MaxNum=5,CDmin=50,CDmax=65,},
	[12] = {MaxNum=5,CDmin=50,CDmax=65,},
	[13] = {MaxNum=13,CDmin=10,CDmax=25,},
	[14] = {MaxNum=13,CDmin=15,CDmax=25,},
	[15] = {MaxNum=13,CDmin=20,CDmax=25,},
	[16] = {MaxNum=19,CDmin=15,CDmax=30,},
	[17] = {MaxNum=19,CDmin=10,CDmax=30,},
	[18] = {MaxNum=19,CDmin=15,CDmax=30,},
	[19] = {MaxNum=31,CDmin=5,CDmax=15,},
	[20] = {MaxNum=31,CDmin=7,CDmax=15,},
	[21] = {MaxNum=31,CDmin=12,CDmax=15,},
	[22] = {MaxNum=33,CDmin=50,CDmax=65,},
	[23] = {MaxNum=33,CDmin=50,CDmax=65,},
}
MysteriousPlace_UpGoodsCDB = {
	[13] = {MaxNum=6,CDmin=20,CDmax=30,},
	[14] = {MaxNum=6,CDmin=20,CDmax=30,},
	[15] = {MaxNum=6,CDmin=20,CDmax=30,},
	[19] = {MaxNum=18,CDmin=10,CDmax=20,},
	[20] = {MaxNum=18,CDmin=10,CDmax=20,},
	[21] = {MaxNum=18,CDmin=10,CDmax=20,},
}

MysteriousPlace_OnEquipmentGoods = {
	[1] = {88883,88884},
	[2] = {88885,88886},
	[3] = {88887,88888},
}

MysteriousPlace_HeroBookTab = {88594,88598,88602,}

MysteriousPlace_EquipmentCards = {83103,83104,83105,83106,83107,83108,}

MysteriousPlace_RuneMax = 15

MysteriousPlace_GoldDropCD = 0

--BOSS死亡
function MysteriousPlace_BossDieFunc(ActorID,b,Type,FastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY)
	if not API_MapIsValid(MapID) then
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local UseGoodsID = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.level)
	local x1,y1,x2,y2 = 54,56,69,71
	local LinShiTab = {}
	local Time = os.time() 
	if UseGoodsID == 88916 then  --契约
		local Table = WYL_MysteriousDoorGoodsTab
		--掉落保底奖励
		local NowPoint = 0
		local PointMax = 300
		local TableLong1 = table.getn(Table[1])
		for i = 1,TableLong1 do
			if NowPoint < PointMax then
				local RandomNum = math.random(TableLong1)
				local GoodsID = Table[1][RandomNum].GoodsID
				local Point = Table[1][RandomNum].Point
				local x,y,Num = 0,0,0
				repeat
					Num = Num + 1
					x = math.random(x1,x2)
					y = math.random(y1,y2)
				until not API_IsBlockTile(MapID,x,y,0) or Num == 100
				if not API_IsBlockTile(MapID,x,y,0) then
					NowPoint = NowPoint + Point
					API_CreateDropGoods(MapID,x,y,GoodsID,1,0,'契约门掉奖励',4,0,600,0)
				end
			else
				break
			end
		end
		local JingYanNum = 1
		local ShuiJingBiNum = 1
		local TeamID = API_GetTeamID(KillerID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			JingYanNum = JingYanNum * TeamSize
			ShuiJingBiNum = ShuiJingBiNum * TeamSize
		end
		--掉落金币
		for i = 1,10 do
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				API_CreateDropGoods(MapID,x,y,80410,100,0,'契约门掉金币',4,0,600,0)
			end
		end
		for i = 1,15 do
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				API_CreateDropGoods(MapID,x,y,80696,ShuiJingBiNum,0,'契约门掉水晶币',4,0,600,0)
			end
		end
		for i = 1,40 do
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				API_CreateDropGoods(MapID,x,y,80498,JingYanNum,0,'契约门掉经验',4,0,600,0)
			end
		end
		--掉落高附加属性装备
		local DropEquipRD = math.random(100)
		if DropEquipRD <= 30 then
			local EquipGoodsID = WYL_MysteriousDoorEquipGoods[math.random(table.getn(WYL_MysteriousDoorEquipGoods))]
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				if API_ActorIsOnline(ActorID) then
					API_CreateDropGoodsEx(MapID,x,y,EquipGoodsID,1,0,'契约门掉高附加装备',4,ActorID,600,120,2)
				else
					API_CreateDropGoodsEx(MapID,x,y,EquipGoodsID,1,0,'契约门掉高附加装备',0,0,600,0,2)
				end
			end
		end
		--★★★★★掉符文
		if API_ActorIsOnline(ActorID) then
			local OpenNum =  API_VarDataGetNumber(ActorID,1,19100)
			OpenNum = OpenNum + 1
			if OpenNum >= 200 then
				OpenNum = 200
			end
			API_VarDataSetNumber(ActorID,1,19100,OpenNum)
			if OpenNum >= 0 then
				local RD = math.random(10000)
				local GaiLv = WYL_MysteriousDoor_LuckValue[OpenNum][1]
				if RD <= GaiLv then
					local RuneCD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 15)
					local RuneNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 37)
					if Time >= RuneCD and RuneNum < MysteriousPlace_RuneMax then
						OpenNum = OpenNum - 20
						if OpenNum < 0 then
							OpenNum = math.floor(OpenNum*0.5)
						end
						API_VarDataSetNumber(ActorID,1,19100,OpenNum)
						RuneNum = RuneNum + 1
						API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 37, RuneNum)
						API_CreateDropGoods(MapID,PosX,PosY,88910,1,0,'契约门掉符文',0,ActorID,600,120)
						local ActorName = API_GetActorName(ActorID)
						if not API_IsBattleGameServer() then
							API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败契约魔坛BOSS获得了稀有珍品：'..API_GetGoodsName(88910)..'！')
						end
						for j in WYL_MysteriousCDTab do
							local CDKey = WYL_MysteriousCDTab[j]
							if CDKey ~= CD then
								local OtherTime = API_VarDataGetNumber_Ex(1, 0, -2000, 1, CDKey)
								if OtherTime - Time <= 200 then
									OtherTime = Time + (math.random(4,6) * 60)
									API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, CDKey, OtherTime)
								end
							end
						end
					end
				end
			end
		end
	elseif UseGoodsID == 88917 then  --家具
		for i = 1,15 do
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				API_CreateDropGoods(MapID,x,y,80696,5,0,'月神门掉水晶币',4,0,600,0)
			end
		end
		local NowPoint = 0
		local PointMax = 270
		local GoodsNum = 0
		repeat
			local GoodsID = MysteriousPlace_FurnitureGoods[math.random(table.getn(MysteriousPlace_FurnitureGoods))]
			local GoodsVal = MysteriousPlace_FurnitureValue[GoodsID]
			if LinShiTab[GoodsID] == nil then
				LinShiTab[GoodsID] = 1
				NowPoint = NowPoint + GoodsVal
				GoodsNum = GoodsNum + 1
			end
		until NowPoint >= PointMax or GoodsNum >= 6
		for j in LinShiTab do 
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				API_CreateDropGoods(MapID,x,y,j,LinShiTab[j],0,'月神门掉奖励',4,0,600,0)
			end
		end
		--★★★★★掉额外奖励
		if API_ActorIsOnline(ActorID) and math.random(100) == 66 then
			local ActorName = API_GetActorName(ActorID)
			local CD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 40)
			local Num = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 41)
			if Time >= CD and Num < 5 then
				CD = Time + math.random(1800,3600)
				API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 40, CD)
				Num = Num + 1
				API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 41, Num)
				local BookID = MysteriousPlace_HeroBookTab[math.random(table.getn(MysteriousPlace_HeroBookTab))]
				API_CreateDropGoods(MapID,PosX,PosY,BookID,1,0,'月神门掉英雄书',0,ActorID,600,120) --主人
				if not API_IsBattleGameServer() then
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败月神别苑BOSS获得了：'..API_GetGoodsName(BookID)..'！')
				end
			end
		end
	elseif UseGoodsID == 88918 then  --改造
		local Table = WYL_MysteriousDoorGoodsTab
		--掉落保底奖励
--~ 		local NowPoint = 0
--~ 		local PointMax = 300
--~ 		local TableLong1 = table.getn(Table[1])
--~ 		for i = 1,TableLong1 do
--~ 			if NowPoint < PointMax then
--~ 				local RandomNum = math.random(TableLong1)
--~ 				local GoodsID = Table[1][RandomNum].GoodsID
--~ 				local Point = Table[1][RandomNum].Point
--~ 				local x,y,Num = 0,0,0
--~ 				repeat
--~ 					Num = Num + 1
--~ 					x = math.random(x1,x2)
--~ 					y = math.random(y1,y2)
--~ 				until not API_IsBlockTile(MapID,x,y,0) or Num == 100
--~ 				if not API_IsBlockTile(MapID,x,y,0) then
--~ 					NowPoint = NowPoint + Point
--~ 					API_CreateDropGoods(MapID,x,y,GoodsID,1,0,'深寒门掉奖励',4,0,600,0)
--~ 				end
--~ 			else
--~ 				break
--~ 			end
--~ 		end
		--保底升级、合成
		local LvType = 1
		if API_ActorIsOnline(ActorID) and API_GetActorExpLevel(ActorID) > 25 then
			LvType = 2
		end
		for j,v in ipairs(MysteriousPlace_EquipmentUpBasic[LvType]) do
			local GoodsID = v.GoodsID
			local GoodsNum = v.Num
			for i = 1,GoodsNum do
				local x,y,Num = 0,0,0
				repeat
					Num = Num + 1
					x = math.random(x1,x2)
					y = math.random(y1,y2)
				until not API_IsBlockTile(MapID,x,y,0) or Num == 100
				if not API_IsBlockTile(MapID,x,y,0) then
					API_CreateDropGoods(MapID,x,y,GoodsID,1,0,'深寒门掉奖励',4,0,600,0)
				end
			end
		end
		--保底点化、提炼
		if math.random(100) > 50 then
			API_CreateDropGoods(MapID,PosX,PosY,80409,1,0,'深寒门掉奖励',4,0,600,0)
		else
			API_CreateDropGoods(MapID,PosX,PosY,80405,1,0,'深寒门掉奖励',4,0,600,0)
		end
		--掉欢度国庆[国]
		local nGqShiFouStart = API_DiffDatatime(HL_GqPeiHeHuoDong_StartTime.Year,HL_GqPeiHeHuoDong_StartTime.Month,HL_GqPeiHeHuoDong_StartTime.Day,HL_GqPeiHeHuoDong_StartTime.Hour,HL_GqPeiHeHuoDong_StartTime.Minute,HL_GqPeiHeHuoDong_StartTime.Second)
		local nGqShiFouEnd = API_DiffDatatime(HL_GqPeiHeHuoDong__EndTime.Year,HL_GqPeiHeHuoDong__EndTime.Month,HL_GqPeiHeHuoDong__EndTime.Day,HL_GqPeiHeHuoDong__EndTime.Hour,HL_GqPeiHeHuoDong__EndTime.Minute,HL_GqPeiHeHuoDong__EndTime.Second)
		if nGqShiFouStart <= 0 and nGqShiFouEnd > 0 then
			--if Time >= 1316707200 and Time < 1318262400 then
				--local GoodsNum = math.random(1)
				--for i = 1,GoodsNum do
					local x,y,Num = 0,0,0
					repeat
						Num = Num + 1
						x = math.random(x1,x2)
						y = math.random(y1,y2)
					until not API_IsBlockTile(MapID,x,y,0) or Num == 100
					if not API_IsBlockTile(MapID,x,y,0) then
						API_CreateDropGoods(MapID,x,y,89075,1,0,'深寒门掉奖励',4,0,600,0) --欢度国庆[国]
					end
				--end
			--end
		end
		--掉爱慕之心(全局的时间表)
		local nShiFouStart = API_DiffDatatime(HL_PeiHeHuoDong_StartTime.Year,HL_PeiHeHuoDong_StartTime.Month,HL_PeiHeHuoDong_StartTime.Day,HL_PeiHeHuoDong_StartTime.Hour,HL_PeiHeHuoDong_StartTime.Minute,HL_PeiHeHuoDong_StartTime.Second)
		local nShiFouEnd = API_DiffDatatime(HL_PeiHeHuoDong__EndTime.Year,HL_PeiHeHuoDong__EndTime.Month,HL_PeiHeHuoDong__EndTime.Day,HL_PeiHeHuoDong__EndTime.Hour,HL_PeiHeHuoDong__EndTime.Minute,HL_PeiHeHuoDong__EndTime.Second)
		if nShiFouStart <= 0 and nShiFouEnd > 0 then
		--if Time >= 1329062400 and Time < 1329667200 then
			local GoodsNum = math.random(3)
			for i = 1,GoodsNum do
				local x,y,Num = 0,0,0
				repeat
					Num = Num + 1
					x = math.random(x1,x2)
					y = math.random(y1,y2)
				until not API_IsBlockTile(MapID,x,y,0) or Num == 100
				if not API_IsBlockTile(MapID,x,y,0) then
					API_CreateDropGoods(MapID,x,y,89188,1,0,'深寒掉鲜花',4,0,600,0)
				end
			end
		end
		local nShiFouStart = API_DiffDatatime(HLsd_PeiHeHuoDong_StartTime.Year,HLsd_PeiHeHuoDong_StartTime.Month,HLsd_PeiHeHuoDong_StartTime.Day,HLsd_PeiHeHuoDong_StartTime.Hour,HLsd_PeiHeHuoDong_StartTime.Minute,HLsd_PeiHeHuoDong_StartTime.Second)
		local nShiFouEnd = API_DiffDatatime(HLsdzf_PeiHeHuoDong__EndTime.Year,HLsdzf_PeiHeHuoDong__EndTime.Month,HLsdzf_PeiHeHuoDong__EndTime.Day,HLsdzf_PeiHeHuoDong__EndTime.Hour,HLsdzf_PeiHeHuoDong__EndTime.Minute,HLsdzf_PeiHeHuoDong__EndTime.Second)
		if nShiFouStart <= 0 and nShiFouEnd > 0 then		
		--if Time >= 1323878400 and Time < 1326038400 then
			if math.random(100) <= 20 then
				API_CreateDropGoods(MapID,PosX,PosY,89126,1,0,'深寒门掉祝福卡片',4,0,600,0)
			end
		end
		local JingYanNum = 1
		local ShuiJingBiNum = 1
		local TeamID = API_GetTeamID(KillerID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			JingYanNum = JingYanNum * TeamSize
			ShuiJingBiNum = ShuiJingBiNum * TeamSize
		end
		--掉周年金币
--~ 		local Goldtest_wb_StartTime = API_DiffDatatime(Goldtest_wb_StartTimeTab.Year,Goldtest_wb_StartTimeTab.Month,Goldtest_wb_StartTimeTab.Day,Goldtest_wb_StartTimeTab.Hour,Goldtest_wb_StartTimeTab.Minute,Goldtest_wb_StartTimeTab.Second)
--~ 		local Goldtest_wb_EndTime= API_DiffDatatime(Goldtest_wb_EndTimeTab.Year,Goldtest_wb_EndTimeTab.Month,Goldtest_wb_EndTimeTab.Day,Goldtest_wb_EndTimeTab.Hour,Goldtest_wb_EndTimeTab.Minute,Goldtest_wb_EndTimeTab.Second)
--~ 		if Goldtest_wb_StartTime < 0 and Goldtest_wb_EndTime >= 0 then
--~ 			Drop_AnniversaryGoldCoin(MapID,ActorID,3)
--~ 		end
		--掉落神奇的粽子
--~ 		if math.random(100) <= 30 then
--~ 			API_CreateDropGoods(MapID,PosX,PosY,88943,1,0,'端午节掉粽子',0,ActorID,600,300)
--~ 		end
		--掉落金币
		for i = 1,10 do
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				API_CreateDropGoods(MapID,x,y,80410,100,0,'深寒门掉金币',4,0,600,0)
			end
		end
		for i = 1,15 do
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				API_CreateDropGoods(MapID,x,y,80696,ShuiJingBiNum,0,'深寒门掉水晶币',4,0,600,0)
			end
		end
		for i = 1,40 do
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				API_CreateDropGoods(MapID,x,y,80498,JingYanNum,0,'深寒门掉经验',4,0,600,0)
			end
		end
		--掉落高附加属性装备
--~ 		local DropEquipRD = math.random(100)
--~ 		if DropEquipRD <= 30 then
--~ 			local EquipGoodsID = WYL_MysteriousDoorEquipGoods[math.random(table.getn(WYL_MysteriousDoorEquipGoods))]
--~ 			local x,y,Num = 0,0,0
--~ 			repeat
--~ 				Num = Num + 1
--~ 				x = math.random(x1,x2)
--~ 				y = math.random(y1,y2)
--~ 			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
--~ 			if not API_IsBlockTile(MapID,x,y,0) then
--~ 				if API_ActorIsOnline(ActorID) then
--~ 					API_CreateDropGoodsEx(MapID,x,y,EquipGoodsID,1,0,'深寒门掉高附加装备',4,ActorID,600,120,2)
--~ 				else
--~ 					API_CreateDropGoodsEx(MapID,x,y,EquipGoodsID,1,0,'深寒门掉高附加装备',0,0,600,0,2)
--~ 				end
--~ 			end
--~ 		end
		--★★★★★掉额外奖励
		if API_ActorIsOnline(ActorID) then
			local ActorName = API_GetActorName(ActorID)
			local PD = 0
			local BookRD = math.random(100)
			if PD == 0 and BookRD <= 1 then
				local CD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 77)
				local Num = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 78)
				if Time >= CD and Num < 5 then
					PD = 1
					CD = Time + (math.random(20,40) * 60)
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 77, CD)
					Num = Num + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 78, Num)
					local GoodsID = 0
					local Tab1 = {88603,88604,88605}
					GoodsID = Tab1[math.random(table.getn(Tab1))]
					
					local x,y,Num = 0,0,0
					repeat
						Num = Num + 1
						x = math.random(x1,x2)
						y = math.random(y1,y2)
					until not API_IsBlockTile(MapID,x,y,0) or Num == 100
					if not API_IsBlockTile(MapID,x,y,0) then
						API_CreateDropGoods(MapID,x,y,GoodsID,1,0,'深寒门掉新技能书',0,ActorID,600,120) --主人
					end
					if not API_IsBattleGameServer() then
						API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'杀死了深寒地宫BOSS！获得了最新英雄秘籍：'..API_GetGoodsName(GoodsID)..'！')
					end
				end
			end
			local UpGoodsRD = math.random(100)
			if PD == 0 and UpGoodsRD <= 10 and API_GetActorExpLevel(ActorID) > 40 then
				local CD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 79)
				local Num = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 80)
				if Time >= CD and Num < 8 then
					PD = 1
					CD = Time + (math.random(20,40) * 60)
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 79, CD)
					Num = Num + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 80, Num)
					local GoodsID = 80952
					local x,y,Num = 0,0,0
					repeat
						Num = Num + 1
						x = math.random(x1,x2)
						y = math.random(y1,y2)
					until not API_IsBlockTile(MapID,x,y,0) or Num == 100
					if not API_IsBlockTile(MapID,x,y,0) then
						API_CreateDropGoods(MapID,x,y,GoodsID,1,0,'深寒门掉升档魔晶',0,ActorID,600,120) --主人
					end
					if not API_IsBattleGameServer() then
						API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'杀死了深寒地宫BOSS！获得了：'..API_GetGoodsName(GoodsID)..'！')
					end
				end
			end
			if PD == 0 and MysteriousPlace_UpGoodsCDA[Hour] ~= nil then
				local CD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 38)
				local Num = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 39)
				local MaxNum = MysteriousPlace_UpGoodsCDA[Hour].MaxNum
				local CDmin = MysteriousPlace_UpGoodsCDA[Hour].CDmin
				local CDmax = MysteriousPlace_UpGoodsCDA[Hour].CDmax
				if Time >= CD and Num < MaxNum then
					PD = 1
					CD = Time + (math.random(CDmin,CDmax) * 60)
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 38, CD)
					Num = Num + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 39, Num)
					local RewardTab = MysteriousPlace_UpGoodsA[LvType][math.random(table.getn(MysteriousPlace_UpGoodsA[LvType]))]
					local GoodsID = RewardTab.GoodsID
					local GoodsNum = RewardTab.Num
					for i = 1,GoodsNum do
						local x,y,Num = 0,0,0
						repeat
							Num = Num + 1
							x = math.random(x1,x2)
							y = math.random(y1,y2)
						until not API_IsBlockTile(MapID,x,y,0) or Num == 100
						if not API_IsBlockTile(MapID,x,y,0) then
							API_CreateDropGoods(MapID,x,y,GoodsID,1,0,'深寒门掉额外奖励',0,ActorID,600,120) --主人
						end
					end
					if not API_IsBattleGameServer() then
						API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'杀死了深寒地宫BOSS！意外获得奖励：'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'！！')
					end
				end
			end
			if PD == 0 and MysteriousPlace_UpGoodsCDB[Hour] ~= nil then
				local CD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 42)
				local Num = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 43)
				local MaxNum = MysteriousPlace_UpGoodsCDB[Hour].MaxNum
				local CDmin = MysteriousPlace_UpGoodsCDB[Hour].CDmin
				local CDmax = MysteriousPlace_UpGoodsCDB[Hour].CDmax
				if Time >= CD and Num < MaxNum then
					PD = 1
					CD = Time + (math.random(CDmin,CDmax) * 60)
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 42, CD)
					Num = Num + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 43, Num)
					local RewardTab = MysteriousPlace_UpGoodsB[LvType][math.random(table.getn(MysteriousPlace_UpGoodsB[LvType]))]
					local GoodsID = RewardTab.GoodsID
					local GoodsNum = RewardTab.Num
					for i = 1,GoodsNum do
						local x,y,Num = 0,0,0
						repeat
							Num = Num + 1
							x = math.random(x1,x2)
							y = math.random(y1,y2)
						until not API_IsBlockTile(MapID,x,y,0) or Num == 100
						if not API_IsBlockTile(MapID,x,y,0) then
							API_CreateDropGoods(MapID,x,y,GoodsID,1,0,'深寒门掉额外奖励',0,ActorID,600,120) --主人
						end
					end
					if not API_IsBattleGameServer() then
						API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'杀死了深寒地宫BOSS！意外获得奖励：'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'！！')
					end
				end
			end
			--[[local NewGoodsRD = math.random(100)
			if PD == 0 and Hour >=12 and NewGoodsRD <= 10 then
				local UpGoodsCD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 91)
				local UPGoodsNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 92)
				local MaxNum = 10
				if Time >= UpGoodsCD and UPGoodsNum < MaxNum then
					UpGoodsCD = Time + (math.random(20,60) * 60)
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 91, UpGoodsCD)
					UPGoodsNum = UPGoodsNum + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 92, UPGoodsNum)
					local PlayLv = API_GetActorExpLevel(ActorID)
					local Type = 1
					if PlayLv > 40 then
						Type = 3
					elseif PlayLv > 25 then
						Type = 2
					end
					local DropGoodsID = MysteriousPlace_OnEquipmentGoods[Type][2] --1是武器，2是防具
					local x,y,Num = 0,0,0
					repeat
						Num = Num + 1
						x = math.random(x1,x2)
						y = math.random(y1,y2)
					until not API_IsBlockTile(MapID,x,y,0) or Num == 100
					if not API_IsBlockTile(MapID,x,y,0) then
						API_CreateDropGoods(MapID,x,y,DropGoodsID,1,0,'深寒门掉降级棒',0,ActorID,600,120) --主人
					end
					if not API_IsBattleGameServer() then
						API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'杀死了深寒地宫BOSS！获得最新超稀有奖励：'..API_GetGoodsName(DropGoodsID)..'！！')
					end
				end
			end]]
			local NewGoodsRD = math.random(100)
			if PD == 0 and Hour >=12 and NewGoodsRD <= 10 then
				local UpGoodsCD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 91)
				local UPGoodsNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 92)
				local MaxNum = 20
				if Time >= UpGoodsCD and UPGoodsNum < MaxNum then
					UpGoodsCD = Time + (math.random(5,30) * 60)
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 91, UpGoodsCD)
					UPGoodsNum = UPGoodsNum + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 92, UPGoodsNum)
					local DropGoodsID = MysteriousPlace_EquipmentCards[math.random(table.getn(MysteriousPlace_EquipmentCards))] 
					local x,y,Num = 0,0,0
					repeat
						Num = Num + 1
						x = math.random(x1,x2)
						y = math.random(y1,y2)
					until not API_IsBlockTile(MapID,x,y,0) or Num == 100
					if not API_IsBlockTile(MapID,x,y,0) then
						API_CreateDropGoods(MapID,x,y,DropGoodsID,1,0,'深寒门掉卡片',0,ActorID,600,120) --主人
						if not API_IsBattleGameServer() then
							API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'杀死了深寒地宫BOSS！获得最新超稀有奖励：'..API_GetGoodsName(DropGoodsID)..'！！')
						end
					end
				end
			end
			--[[
			if Time >= 1316448000 and Time < 1318262400 then
				local NewGoodsRD = math.random(100)
				if Hour >= 12 and NewGoodsRD <= 10 then
					local UpGoodsCD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 113)
					local UPGoodsNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 112)
					local MaxNum = 50
					if Time >= UpGoodsCD and UPGoodsNum < MaxNum then
						local PlayLV = API_GetActorExpLevel(ActorID)
						UpGoodsCD = Time + (math.random(10,20) * 60)
						API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 113, UpGoodsCD)
						UPGoodsNum = UPGoodsNum + 1
						API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 112, UPGoodsNum)
						local GoodsType = MysteriousPlace_OnEquipmentGoods[1]
						if PlayLV > 40 then
							GoodsType = MysteriousPlace_OnEquipmentGoods[3]
						elseif PlayLV > 25 then
							GoodsType = MysteriousPlace_OnEquipmentGoods[2]
						end
						local DropGoodsID = GoodsType[math.random(table.getn(GoodsType))] 
						local x,y,Num = 0,0,0
						repeat
							Num = Num + 1
							x = math.random(x1,x2)
							y = math.random(y1,y2)
						until not API_IsBlockTile(MapID,x,y,0) or Num == 100
						if not API_IsBlockTile(MapID,x,y,0) then
							API_CreateDropGoods(MapID,x,y,DropGoodsID,1,0,'深寒掉降级棒',0,ActorID,600,120) --主人
							if not API_IsBattleGameServer() then
								API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'杀死了深寒地宫BOSS！获得最新超稀有奖励：'..API_GetGoodsName(DropGoodsID)..'！！')
							end
						end
					end
				end
			end
			]]
		end
		
	end
end

--公共判断
function MysteriousPlace_InJudge(ActorID,GoodsID)
	local GoodsName = ''
	if GoodsID == 88916 then
		GoodsName = '契约魔坛'
	elseif GoodsID == 88917 then
		GoodsName = '月神别苑'
	elseif GoodsID == 88918 then
		GoodsName = '深寒地宫'
	elseif GoodsID == 88944 then
		GoodsName = '夏日海滩'
	elseif GoodsID == 88590 then
		GoodsName = '神秘之地'
	end
	local TeamID = API_GetTeamID(ActorID)
	if TeamID > 0 and API_GetTeamLeader(TeamID) == ActorID then
		local TeamSize = API_GetTeamSize(TeamID)
		for i = 1,TeamSize do
			local TeamActorID = API_GetTeamMem(TeamID,i)
			if API_ActorIsOnline(TeamActorID) then
				if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>快递中，无法进入'..GoodsName..'！</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)
					return 0
				end
				if API_ActorFindStatus(TeamActorID,519) then
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>摆摊中，无法进入'..GoodsName..'！</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)
					return 0
				end
				if API_ActorIsDying(TeamActorID) then
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>死亡，无法进入'..GoodsName..'！</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)
					return 0
				end
				if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>在公交车上无法进入'..GoodsName..'！</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)
					return 0
				end
			end
		end
	else
		if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>快递中，无法进入'..GoodsName..'！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 0
		end
		if API_ActorFindStatus(ActorID,519) then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>摆摊中，无法进入'..GoodsName..'！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 0
		end
		if API_ActorIsDying(ActorID) then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>角色死亡，无法进入'..GoodsName..'！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 0
		end
		if API_VarDataGetNumber(ActorID,1,11816) > 0 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>在公交车上无法进入'..GoodsName..'！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 0
		end
	end
	return 1
end

--财神宝箱
SpringFestival_GodBoxTable = {
[88877] = {
	[1] = {
			{GoodsID=39501,GaiLv1=1,GaiLv2=18529,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39502,GaiLv1=18530,GaiLv2=37059,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39503,GaiLv1=37060,GaiLv2=55589,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39510,GaiLv1=55590,GaiLv2=74119,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39513,GaiLv1=74120,GaiLv2=92649,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39516,GaiLv1=92650,GaiLv2=111179,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39519,GaiLv1=111180,GaiLv2=129709,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39522,GaiLv1=129710,GaiLv2=148239,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39525,GaiLv1=148240,GaiLv2=166769,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39528,GaiLv1=166770,GaiLv2=185299,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80383,GaiLv1=185300,GaiLv2=630015,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80381,GaiLv1=630016,GaiLv2=947669,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80397,GaiLv1=947670,GaiLv2=1225616,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=250  ,GaiLv1=1225617,GaiLv2=1596212,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89199,GaiLv1=1596213,GaiLv2=1966808,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=1966809,GaiLv2=2077987,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40003,GaiLv1=2077988,GaiLv2=2189166,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40013,GaiLv1=2189167,GaiLv2=2300345,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40023,GaiLv1=2300346,GaiLv2=2411524,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40093,GaiLv1=2411525,GaiLv2=2522703,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=31015,GaiLv1=2522704,GaiLv2=2578293,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=31016,GaiLv1=2578294,GaiLv2=2633883,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=76   ,GaiLv1=2633884,GaiLv2=2689473,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89040,GaiLv1=2689474,GaiLv2=2708003,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89041,GaiLv1=2708004,GaiLv2=2726533,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89042,GaiLv1=2726534,GaiLv2=2745063,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39507,GaiLv1=2745064,GaiLv2=2750622,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39508,GaiLv1=2750623,GaiLv2=2756181,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39509,GaiLv1=2756182,GaiLv2=2761740,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89126,GaiLv1=2761741,GaiLv2=3317634,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80686,GaiLv1=3317635,GaiLv2=3428813,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80689,GaiLv1=3428814,GaiLv2=3539992,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=31101,GaiLv1=3539993,GaiLv2=3595582,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=75   ,GaiLv1=3595583,GaiLv2=3706761,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=32015,GaiLv1=3706762,GaiLv2=3707503,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39511,GaiLv1=3707504,GaiLv2=3718621,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39514,GaiLv1=3718622,GaiLv2=3729739,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39504,GaiLv1=3729740,GaiLv2=3740857,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39505,GaiLv1=3740858,GaiLv2=3751975,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39506,GaiLv1=3751976,GaiLv2=3763093,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39517,GaiLv1=3763094,GaiLv2=3774211,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39520,GaiLv1=3774212,GaiLv2=3785329,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39523,GaiLv1=3785330,GaiLv2=3796447,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39526,GaiLv1=3796448,GaiLv2=3807565,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=39529,GaiLv1=3807566,GaiLv2=3818683,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=32016,GaiLv1=3818684,GaiLv2=3819031,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11026,GaiLv1=3819032,GaiLv2=3819958,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11027,GaiLv1=3819959,GaiLv2=3820576,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11028,GaiLv1=3820577,GaiLv2=3821503,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11029,GaiLv1=3821504,GaiLv2=3822121,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11036,GaiLv1=3822122,GaiLv2=3822739,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11037,GaiLv1=3822740,GaiLv2=3823357,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11046,GaiLv1=3823358,GaiLv2=3823975,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11047,GaiLv1=3823976,GaiLv2=3824323,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11045,GaiLv1=3824324,GaiLv2=3828157,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80195,GaiLv1=3828158,GaiLv2=9387096,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=88171,GaiLv1=9387097,GaiLv2=9442686,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11071,GaiLv1=9442687,GaiLv2=9442872,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11072,GaiLv1=9442873,GaiLv2=9443058,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11073,GaiLv1=9443059,GaiLv2=9443244,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11074,GaiLv1=9443245,GaiLv2=9443430,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11545,GaiLv1=9443431,GaiLv2=9443778,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=11544,GaiLv1=9443779,GaiLv2=9444126,NumGaiLv=10000,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=9444127,GaiLv2=10000000,NumGaiLv=10000,NumMax=1,NumMin=0},

		},
	[2] = {
			
			{GoodsID=39501,GaiLv1=1    ,GaiLv2=21192,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39502,GaiLv1=21193,GaiLv2=42385,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39503,GaiLv1=42386,GaiLv2=63578,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39510,GaiLv1=63579,GaiLv2=84771,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39513,GaiLv1=84772,GaiLv2=105964,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39516,GaiLv1=105965,GaiLv2=127157,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39519,GaiLv1=127158,GaiLv2=148350,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39522,GaiLv1=148351,GaiLv2=169543,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39525,GaiLv1=169544,GaiLv2=190736,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39528,GaiLv1=190737,GaiLv2=211929,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80384,GaiLv1=211930,GaiLv2=438988,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80382,GaiLv1=438989,GaiLv2=592184,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=31017,GaiLv1=592185,GaiLv2=623973,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=31018,GaiLv1=623974,GaiLv2=655762,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=31019,GaiLv1=655763,GaiLv2=687551,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=76   ,GaiLv1=687552,GaiLv2=751128,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89199,GaiLv1=751129,GaiLv2=1174970,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40004,GaiLv1=1174971,GaiLv2=1259739,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40014,GaiLv1=1259740,GaiLv2=1344508,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40024,GaiLv1=1344509,GaiLv2=1429277,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40094,GaiLv1=1429278,GaiLv2=1514046,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80697,GaiLv1=1514047,GaiLv2=6600148,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80196,GaiLv1=6600149,GaiLv2=7235911,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=9507,GaiLv1=7235912,GaiLv2=7239544,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80397,GaiLv1=7239545,GaiLv2=7557426,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=250  ,GaiLv1=7557427,GaiLv2=7981268,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=7981269,GaiLv2=8108421,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80686,GaiLv1=8108422,GaiLv2=8235574,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80689,GaiLv1=8235575,GaiLv2=8362727,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=32015,GaiLv1=8362728,GaiLv2=8363575,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39511,GaiLv1=8363576,GaiLv2=8376291,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39514,GaiLv1=8376292,GaiLv2=8389007,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39504,GaiLv1=8389008,GaiLv2=8401723,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39505,GaiLv1=8401724,GaiLv2=8414439,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39506,GaiLv1=8414440,GaiLv2=8427155,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39517,GaiLv1=8427156,GaiLv2=8439871,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39520,GaiLv1=8439872,GaiLv2=8452587,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39523,GaiLv1=8452588,GaiLv2=8465303,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39526,GaiLv1=8465304,GaiLv2=8478019,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39529,GaiLv1=8478020,GaiLv2=8490735,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89040,GaiLv1=8490736,GaiLv2=8511928,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89041,GaiLv1=8511929,GaiLv2=8533121,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89042,GaiLv1=8533122,GaiLv2=8554314,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39507,GaiLv1=8554315,GaiLv2=8560672,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39508,GaiLv1=8560673,GaiLv2=8567030,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39509,GaiLv1=8567031,GaiLv2=8573388,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89126,GaiLv1=8573389,GaiLv2=9209151,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=32016,GaiLv1=9209152,GaiLv2=9209549,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88928,GaiLv1=9209550,GaiLv2=9210256,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88920,GaiLv1=9210257,GaiLv2=9210963,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88924,GaiLv1=9210964,GaiLv2=9211670,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88929,GaiLv1=9211671,GaiLv2=9212377,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88921,GaiLv1=9212378,GaiLv2=9213084,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88925,GaiLv1=9213085,GaiLv2=9213791,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88930,GaiLv1=9213792,GaiLv2=9214498,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88922,GaiLv1=9214499,GaiLv2=9215205,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88926,GaiLv1=9215206,GaiLv2=9215912,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88923,GaiLv1=9215913,GaiLv2=9216619,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88927,GaiLv1=9216620,GaiLv2=9217326,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88931,GaiLv1=9217327,GaiLv2=9218033,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11026,GaiLv1=9218034,GaiLv2=9219093,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11027,GaiLv1=9219094,GaiLv2=9227570,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11028,GaiLv1=9227571,GaiLv2=9240286,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11029,GaiLv1=9240287,GaiLv2=9248763,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11036,GaiLv1=9248764,GaiLv2=9249823,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11037,GaiLv1=9249824,GaiLv2=9250530,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11046,GaiLv1=9250531,GaiLv2=9251237,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11047,GaiLv1=9251238,GaiLv2=9251944,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11045,GaiLv1=9251945,GaiLv2=9252342,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=9252343,GaiLv2=9888105,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88171,GaiLv1=9888106,GaiLv2=9941086,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11071,GaiLv1=9941087,GaiLv2=9941298,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11072,GaiLv1=9941299,GaiLv2=9941510,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11073,GaiLv1=9941511,GaiLv2=9941722,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11074,GaiLv1=9941723,GaiLv2=9941934,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11545,GaiLv1=9941935,GaiLv2=9942332,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=11544,GaiLv1=9942333,GaiLv2=9942730,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80952,GaiLv1=9942731,GaiLv2=9963923,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80387,GaiLv1=9963924,GaiLv2=10000000,NumGaiLv=8600,NumMax=1,NumMin=0},
			
			--{GoodsID=11071,GaiLv1=1,GaiLv2=3941298,NumGaiLv=8600,NumMax=1,NumMin=0},
			--{GoodsID=11072,GaiLv1=3941299,GaiLv2=5941510,NumGaiLv=8600,NumMax=1,NumMin=0},
			--{GoodsID=11073,GaiLv1=5941511,GaiLv2=7941722,NumGaiLv=8600,NumMax=1,NumMin=0},
			--{GoodsID=11074,GaiLv1=7941723,GaiLv2=10000000,NumGaiLv=8600,NumMax=1,NumMin=0},

		},
	},
}

SpringFestival_GodBoxCdGoods = {
--~ 	[31026] = 5000,
--~ 	[11133] = 1000,
--~ 	[11134] = 1500,
--~ 	[11135] = 1000,
--~ 	[11136] = 1500,
	[39511] = 1000,
	[39514] = 1000,
	[39504] = 1000,
	[39505] = 1000,
	[39506] = 1000,
	[39517] = 1000,
	[39520] = 1000,
	[39523] = 1000,
	[39526] = 1000,
	[39529] = 1000,
	[11026] = 1000,
	[11027] = 1000,
	[11028] = 1000,
	[11029] = 1000,
	[11034] = 1000,
	[11035] = 1000,
	[11036] = 1000,
	[11037] = 1000,
	[11046] = 1000,
	[11047] = 1000,
	[11042] = 1000,
	[11043] = 1000,
	[11045] = 1000,
}

SpringFestival_GodBoxBookGoods = {
[88920] = 3000,
[88921] = 3000,
[88922] = 3000,
[88923] = 3000,
[88924] = 3000,
[88925] = 3000,
[88926] = 3000,
[88927] = 3000,
[88928] = 3000,
[88929] = 3000,
[88930] = 3000,
[88931] = 3000,
}

SpringFestival_GodBoxXZGoods = {
	[32015] = {JiaZhi=15000,Key=33,Max=2,},
	[32016] = {JiaZhi=20000,Key=34,Max=1,},
	--[80952] = {JiaZhi=10000,Key=82,Max=10,},
	[11317] = {JiaZhi=30000,Key=90,Max=1,},
}

SpringFestival_GodBoxSayWorld = {
	[9504] = 1225,
	[9505] = 1600,
	[9506] = 3150,
	[9507] = 3500,
	[11026] = 1000,
	[11027] = 1500,
	[11028] = 1000,
	[11029] = 1500,
	[11034] = 4000,
	[11035] = 20000,
	[11036] = 1000,
	[11037] = 1500,
	[11046] = 1000,
	[11047] = 1500,
	[11042] = 4000,
	[11043] = 20000,
	[11045] = 2900,
	[11098] = 1000,
	[11099] = 1500,
	[11100] = 1000,
	[11101] = 1500,
	[31026] = 5000,
	[11133] = 1000,
	[11134] = 1500,
	[11135] = 1000,
	[11136] = 1500,
	[11137] = 1000,
	[11138] = 1500,
	[11139] = 1000,
	[11140] = 1500,
	[32015] = 15000,
	[39511] = 1000,
	[39514] = 1000,
	[39504] = 1000,
	[39505] = 1000,
	[39506] = 1000,
	[39517] = 1000,
	[39520] = 1000,
	[39523] = 1000,
	[39526] = 1000,
	[39529] = 1000,
	[32016] = 20000,
	[88920] = 0,
	[88921] = 0,
	[88922] = 0,
	[88924] = 0,
	[88925] = 0,
	[88926] = 0,
	[88928] = 0,
	[88929] = 0,
	[88930] = 0,
	[88923] = 0,
	[88927] = 0,
	[88931] = 0,
	[80952] = 1,
	[11317] = 30000,
}

SpringFestival_GodBoxOtherGoods = {
	{GoodsID=80049,Num=100,Key=45,Max=3},
	{GoodsID=80050,Num=100,Key=46,Max=3},
	{GoodsID=80051,Num=100,Key=47,Max=3},
	{GoodsID=80820,Num=10,Key=48,Max=3},
	{GoodsID=80387,Num=4,Key=49,Max=3},
	{GoodsID=80388,Num=4,Key=50,Max=3},
	{GoodsID=501,Num=10,Key=51,Max=3},
	{GoodsID=88594,Num=1,Key=52,Max=3},
	{GoodsID=88598,Num=1,Key=53,Max=3},
	{GoodsID=88602,Num=1,Key=54,Max=3},
	{GoodsID=80397,Num=100,Key=55,Max=5},
}

SpringFestival_GodBoxCDTime = {
	[8] = {MaxNum=5,CDmin=50,CDmax=65,},
	[9] = {MaxNum=5,CDmin=50,CDmax=65,},
	[10] = {MaxNum=5,CDmin=50,CDmax=65,},
	[11] = {MaxNum=5,CDmin=50,CDmax=65,},
	[12] = {MaxNum=5,CDmin=50,CDmax=65,},
	[13] = {MaxNum=13,CDmin=10,CDmax=25,},
	[14] = {MaxNum=13,CDmin=10,CDmax=25,},
	[15] = {MaxNum=13,CDmin=10,CDmax=25,},
	[16] = {MaxNum=19,CDmin=10,CDmax=30,},
	[17] = {MaxNum=19,CDmin=10,CDmax=30,},
	[18] = {MaxNum=19,CDmin=10,CDmax=30,},
	[19] = {MaxNum=31,CDmin=5,CDmax=20,},
	[20] = {MaxNum=31,CDmin=5,CDmax=20,},
	[21] = {MaxNum=31,CDmin=5,CDmax=20,},
	[22] = {MaxNum=33,CDmin=50,CDmax=65,},
	[23] = {MaxNum=33,CDmin=50,CDmax=65,},
}

SpringFestival_GodBoxLuckTime = {
	[8] = {MaxNum=1,CDmin=50,CDmax=65,},
	[9] = {MaxNum=1,CDmin=50,CDmax=65,},
	[10] = {MaxNum=1,CDmin=50,CDmax=65,},
	[11] = {MaxNum=1,CDmin=50,CDmax=65,},
	[12] = {MaxNum=1,CDmin=50,CDmax=65,},
	[13] = {MaxNum=4,CDmin=15,CDmax=25,},
	[14] = {MaxNum=4,CDmin=15,CDmax=25,},
	[15] = {MaxNum=4,CDmin=15,CDmax=25,},
	[16] = {MaxNum=6,CDmin=15,CDmax=30,},
	[17] = {MaxNum=6,CDmin=15,CDmax=30,},
	[18] = {MaxNum=6,CDmin=15,CDmax=30,},
	[19] = {MaxNum=10,CDmin=10,CDmax=15,},
	[20] = {MaxNum=10,CDmin=10,CDmax=15,},
	[21] = {MaxNum=10,CDmin=10,CDmax=15,},
	[22] = {MaxNum=11,CDmin=50,CDmax=65,},
	[23] = {MaxNum=11,CDmin=50,CDmax=65,},
}

SpringFestival_2011NationalDayGoods = {
	[39507] = {CD=115,Key=114,Max=30,},
	[39508] = {CD=115,Key=114,Max=30,},
	[39509] = {CD=115,Key=114,Max=30,},
	[89040] = {CD=117,Key=116,Max=20,},
	[89041] = {CD=117,Key=116,Max=20,},
	[89042] = {CD=117,Key=116,Max=20,},
}


--每天限量上线SOFIE 6199，100时间存贮101时间存储
if Hl_20120221TGoods == nil then
	Hl_20120221TGoods ={
		
		[89040] = {GoodsID=89040,ShuLiang=20,AllNum=20,Key=1,Data=6199,Max=20},--(-6199交互数据)  一档繁星光石（每日限量20
		[89041] = {GoodsID=89041,ShuLiang=20,AllNum=20,Key=2,Data=6199,Max=20},--(-6199交互数据)一一档灵动光石（每日限量20
		[89042] = {GoodsID=89042,ShuLiang=20,AllNum=20,Key=3,Data=6199,Max=20},--(-6199交互数据)一一档噬炎光石（每日限量20）
	
		[39507] = {GoodsID=39507,ShuLiang=30,AllNum=30,Key=4,Data=6199,Max=30},--(-6199交互数据)时装物攻宝石[黄金]（每日限量30）
		[39508] = {GoodsID=39508,ShuLiang=30,AllNum=30,Key=5,Data=6199,Max=30},--(-6199交互数据)时装火攻宝石[黄金]（每日限量30）
		[39509] = {GoodsID=39509,ShuLiang=30,AllNum=30,Key=6,Data=6199,Max=30},--(-6199交互数据)时装魔攻宝石[黄金]（每日限量30）
	
		[11036] = {GoodsID=11036,ShuLiang=2,AllNum=2,Key=7 ,Data=6199,Max=2},--(-6199交互数据)乖乖女之帽
		[11037] = {GoodsID=11037,ShuLiang=2,AllNum=2,Key=8 ,Data=6199,Max=2},--(-6199交互数据)乖乖女之恋
		[11046] = {GoodsID=11046,ShuLiang=2,AllNum=2,Key=9 ,Data=6199,Max=2},--(-6199交互数据)兔宝宝发卡
		[11047] = {GoodsID=11047,ShuLiang=2,AllNum=2,Key=10,Data=6199,Max=2},--(-6199交互数据)兔宝宝之吻
		[11045] = {GoodsID=11045,ShuLiang=2,AllNum=2,Key=11,Data=6199,Max=2},--(-6199交互数据)能量回复影兽
		[11545] = {GoodsID=11545,ShuLiang=1,AllNum=1,Key=12,Data=6199,Max=1},--型男外套[男]【限量每天一件】
		[11544] = {GoodsID=11544,ShuLiang=1,AllNum=1,Key=13,Data=6199,Max=1},--淑女丽人外套[女]【限量每天一件】
		--[11071] = {GoodsID=11071,ShuLiang=1,AllNum=1,Key=14,Data=6199,Max=1},
		--[11072] = {GoodsID=11072,ShuLiang=1,AllNum=1,Key=15,Data=6199,Max=1},
		--[11073] = {GoodsID=11073,ShuLiang=1,AllNum=1,Key=16,Data=6199,Max=1},
		--[11074] = {GoodsID=11074,ShuLiang=1,AllNum=1,Key=17,Data=6199,Max=1},
		--[11071] = {GoodsID=11071,ShuLiang=1,AllNum=1,Key=18,Data=6199,Max=1},
		--[11072] = {GoodsID=11072,ShuLiang=1,AllNum=1,Key=19,Data=6199,Max=1},
		--[11073] = {GoodsID=11073,ShuLiang=1,AllNum=1,Key=20,Data=6199,Max=1},
		--[11074] = {GoodsID=11074,ShuLiang=1,AllNum=1,Key=21,Data=6199,Max=1},		     
	}
end

if API_GetServerID() == 1 or API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 6 or API_GetServerID() == 7 or API_GetServerID() == 8 or API_GetServerID() == 9 or API_GetServerID() == 10 then
	if Hl_20120221TGoodsChongZhi ~= nil then
		API_DestroyTriggerG(Hl_20120221TGoodsChongZhi)
	end
	Hl_20120221TGoodsChongZhi = API_CreateTimerTriggerG(0,0,120,-1,'Hl_MeiRiCSShuJuQingChu')
	--API_Trace('1==')
end
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
	if API_ActorGetPackageSize(ActorID) < 2 then
		API_ActorSendMsg(ActorID,3,'背包已满，无法使用')
		return 0
	end
	local Time = os.time() 
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Week == 7 and Hour == 23 and API_GetServerID() ~= 1 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br>br><text size="16" color="117,252,255">您好，每周日 23点 以后必须在主城才可以打开财神宝箱。</text><br>')
		API_ResponseWrite('<br><br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	local PlayName = API_GetActorName(ActorID)
	local PlayLv = API_GetActorExpLevel(ActorID)
	local JiangLiQuYu = 1
	if PlayLv > 25 then
		JiangLiQuYu = 2
	end
	local JiangLiTable = SpringFestival_GodBoxTable[GoodsID][JiangLiQuYu]
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
				if SpringFestival_GodBoxCdGoods[JiangLiGoodsID] ~= nil then
					local CD = API_VarDataGetNumber_Ex(1, 0, -1999, 1, 14)
					if Time >= CD then
						Time = Time + math.random(300,900)
						API_VarDataSetNumber_Ex_Sync(1, 0, -1999, 1, 14, Time)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1
					end
				elseif LRY_LuckStar_MaxGoodsNumTable[JiangLiGoodsID] ~= nil then
					local Num = LRY_LuckStar_MaxGoodsNumTable[JiangLiGoodsID].Num
					local MaxNum = LRY_LuckStar_MaxGoodsNumTable[JiangLiGoodsID].MaxNum
					if Num < MaxNum then
						Num = Num + JiangLiGoodsNum
						LRY_LuckStar_MaxGoodsNumTable[JiangLiGoodsID].Num = Num 
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1
					end
				elseif SpringFestival_GodBoxXZGoods[JiangLiGoodsID] ~= nil then
					local CD = API_VarDataGetNumber_Ex(1, 0, -1999, 1, 14)
					if Time >= CD then
						local Key = SpringFestival_GodBoxXZGoods[JiangLiGoodsID].Key
						local Max = SpringFestival_GodBoxXZGoods[JiangLiGoodsID].Max
						local Now = API_VarDataGetNumber_Ex(1, 0, -2000, 1, Key)
						if Now < Max then
							Now = Now + 1
							API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, Key, Now)
							Time = Time + math.random(1200,2400)
							API_VarDataSetNumber_Ex_Sync(1, 0, -1999, 1, 14, Time)
						else
							JiangLiGoodsID = 250
							JiangLiGoodsNum = 1
						end
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1
					end
				elseif SpringFestival_GodBoxBookGoods[JiangLiGoodsID] ~= nil then
					local CD = API_VarDataGetNumber_Ex(1, 0, -1999, 1, 23)
					if Time >= CD then
						Time = Time + (math.random(20,40) * 60)
						API_VarDataSetNumber_Ex_Sync(1, 0, -1999, 1, 23, Time)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1
					end
				elseif SpringFestival_2011NationalDayGoods[JiangLiGoodsID] ~= nil then
					--if Time >= 1316448000 and Time < 1318262400 then
						local CD = SpringFestival_2011NationalDayGoods[JiangLiGoodsID].CD
						local CDTime = API_VarDataGetNumber_Ex(1, 0, -2000, 1, CD)
						if Time >= CDTime then
							local Key = SpringFestival_2011NationalDayGoods[JiangLiGoodsID].Key
							local Max = SpringFestival_2011NationalDayGoods[JiangLiGoodsID].Max
							local Now = API_VarDataGetNumber_Ex(1, 0, -2000, 1, Key)
							if Now < Max then
								Now = Now + 1
								API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, Key, Now)
								Time = Time + math.random(300,900)
								API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, CD, Time)
							else
								JiangLiGoodsID = 250
								JiangLiGoodsNum = 1
							end
						else
							JiangLiGoodsID = 250
							JiangLiGoodsNum = 1
						end
					--else  
					--	JiangLiGoodsID = 250
					--	JiangLiGoodsNum = 1
					--end
				elseif JiangLiGoodsID == 89075 then
					--掉欢度国庆[国]
					local nGqShiFouStart = API_DiffDatatime(HL_GqPeiHeHuoDong_StartTime.Year,HL_GqPeiHeHuoDong_StartTime.Month,HL_GqPeiHeHuoDong_StartTime.Day,HL_GqPeiHeHuoDong_StartTime.Hour,HL_GqPeiHeHuoDong_StartTime.Minute,HL_GqPeiHeHuoDong_StartTime.Second)
					local nGqShiFouEnd = API_DiffDatatime(HL_GqPeiHeHuoDong__EndTime.Year,HL_GqPeiHeHuoDong__EndTime.Month,HL_GqPeiHeHuoDong__EndTime.Day,HL_GqPeiHeHuoDong__EndTime.Hour,HL_GqPeiHeHuoDong__EndTime.Minute,HL_GqPeiHeHuoDong__EndTime.Second)
					if nGqShiFouStart <= 0 and nGqShiFouEnd > 0 then
					--if Time >= 1316707200 and Time < 1318262400 then
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1
					end
				elseif JiangLiGoodsID == 89126 then
					local nShiFouStart = API_DiffDatatime(HLsd_PeiHeHuoDong_StartTime.Year,HLsd_PeiHeHuoDong_StartTime.Month,HLsd_PeiHeHuoDong_StartTime.Day,HLsd_PeiHeHuoDong_StartTime.Hour,HLsd_PeiHeHuoDong_StartTime.Minute,HLsd_PeiHeHuoDong_StartTime.Second)
					local nShiFouEnd = API_DiffDatatime(HLsdzf_PeiHeHuoDong__EndTime.Year,HLsdzf_PeiHeHuoDong__EndTime.Month,HLsdzf_PeiHeHuoDong__EndTime.Day,HLsdzf_PeiHeHuoDong__EndTime.Hour,HLsdzf_PeiHeHuoDong__EndTime.Minute,HLsdzf_PeiHeHuoDong__EndTime.Second)
					if nShiFouStart <= 0 and nShiFouEnd > 0 then
					--if Time >= 1323878400 and Time < 1326038400 then
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1
					end
				elseif JiangLiGoodsID == 89188 then
					local nShiFouStart = API_DiffDatatime(HL_PeiHeHuoDong_StartTime.Year,HL_PeiHeHuoDong_StartTime.Month,HL_PeiHeHuoDong_StartTime.Day,HL_PeiHeHuoDong_StartTime.Hour,HL_PeiHeHuoDong_StartTime.Minute,HL_PeiHeHuoDong_StartTime.Second)
					local nShiFouEnd = API_DiffDatatime(HL_PeiHeHuoDong__EndTime.Year,HL_PeiHeHuoDong__EndTime.Month,HL_PeiHeHuoDong__EndTime.Day,HL_PeiHeHuoDong__EndTime.Hour,HL_PeiHeHuoDong__EndTime.Minute,HL_PeiHeHuoDong__EndTime.Second)
					if nShiFouStart <= 0 and nShiFouEnd > 0 then
					--if Time >= 1329062400 and Time < 1329667200 then
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1
					end
				elseif JiangLiGoodsID == 11071 then
					--API_Trace('1==11071')
					local NowTime = os.time()
					local NextTime = API_VarDataGetNumber_Ex(1,0,-6199,1,101)
					if NowTime >= NextTime then
						local CDTime = 604800
						NextTime = NowTime + CDTime
						API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,101,NextTime)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1												
					end	
				elseif JiangLiGoodsID == 11072 then
					--API_Trace('1==11072')
					local NowTime = os.time()
					local NextTime = API_VarDataGetNumber_Ex(1,0,-6199,1,102)
					if NowTime >= NextTime then
						local CDTime = 604800
						NextTime = NowTime + CDTime
						API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,102,NextTime)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1												
					end
				elseif JiangLiGoodsID == 11073 then
					--API_Trace('1==11073')
					local NowTime = os.time()
					local NextTime = API_VarDataGetNumber_Ex(1,0,-6199,1,103)
					if NowTime >= NextTime then
						local CDTime = 604800
						NextTime = NowTime + CDTime
						API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,103,NextTime)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1												
					end
				elseif JiangLiGoodsID == 11074 then
					--API_Trace('1==11074')
					local NowTime = os.time()
					local NextTime = API_VarDataGetNumber_Ex(1,0,-6199,1,104)
					if NowTime >= NextTime then
						local CDTime = 604800
						NextTime = NowTime + CDTime
						API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,104,NextTime)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1												
					end					
				elseif Hl_20120221TGoods[JiangLiGoodsID]~= nil then
					--API_Trace('2JiangLiGoodsID=='..JiangLiGoodsID)
					local Key = Hl_20120221TGoods[JiangLiGoodsID].Key
					--API_Trace('3JiangLiGoodsID=='..Key)
					local Max = Hl_20120221TGoods[JiangLiGoodsID].Max
					--API_Trace('4JiangLiGoodsID=='..Max)
					local Now = API_VarDataGetNumber_Ex(1, 0, -6199, 1, Key)
					--API_Trace('5JiangLiGoodsID=='..Now)
					if Now < Max then
						Now = Now + 1
						--API_Trace('6JiangLiGoodsID=='..Now)
						API_VarDataSetNumber_Ex_Sync(1, 0, -6199, 1, Key, Now)
						--Time = Time + math.random(1200,2400)
						--API_VarDataSetNumber_Ex_Sync(1, 0, -6199, 1, 100, Time)
					else
						JiangLiGoodsID = 250
						JiangLiGoodsNum = 1
					end

				end
			else
				JiangLiGoodsID = 250
				JiangLiGoodsNum = 1
			end
			break
		end
	end
	if API_ActorRemoveGoods(ActorID, GoodsID, 1, '打开财神宝箱') then
		local UseNum = API_VarDataGetNumber(ActorID,1,19022)
		UseNum = UseNum + 1
		API_VarDataSetNumber(ActorID,1,19022,UseNum)
		local PD = 0
		if API_IsOwnedName(ActorID,205,1) == 1 then
		else
			if UseNum > 0 and math.mod(UseNum,100) == 0 then
				API_SetPlayerNickName(ActorID,205,'',1,0,1,1,{884001})
				PD = 1
				local HuoDong = 1
				MLB_Scroll_Select(ActorID,HuoDong)
			end
		end
		local PD2 = 0
		for j,v in baoshiwupinbiao do
			if JiangLiGoodsID == v then
				PD2 = 1
				break
			end
		end
		if JiangLiGoodsID == 76 then
			PD2 = 2
		end
		if PD2 == 1 then
			fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
		elseif PD2 == 2 then
			AddStarLvPetCapsuleFunc(ActorID,1)
		else
			API_AddActorGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,'财神宝箱奖励')
			--API_Trace('7JiangLiGoodsID=='..JiangLiGoodsID)
			if JiangLiGoodsID == 11545  then
				API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'打开财神宝箱得到型男外套[男]')
			elseif  JiangLiGoodsID == 11544 then
				API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'打开财神宝箱得到淑女丽人外套[女]')
			elseif  JiangLiGoodsID == 89199 then
				API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'打开财神宝箱得到特制金属')
			end
		end
		API_ActorSendMsg(ActorID,7,'财神赐福，获得：'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="150,150,300,220" alpha="240" balpha="230"></win>') 
		API_ResponseWrite('<br>br><text size="16" color="117,252,255">财神赐福！鸿运当头！</text><br>')
		API_ResponseWrite('<br><text color="255,0,255">打开财神宝箱获得：</text><img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'"><text> × '..JiangLiGoodsNum..'</text><br>')
		
		--掉周年金币
--~ 		local Goldtest_wb_StartTime = API_DiffDatatime(Goldtest_wb_StartTimeTab.Year,Goldtest_wb_StartTimeTab.Month,Goldtest_wb_StartTimeTab.Day,Goldtest_wb_StartTimeTab.Hour,Goldtest_wb_StartTimeTab.Minute,Goldtest_wb_StartTimeTab.Second)
--~ 		local Goldtest_wb_EndTime= API_DiffDatatime(Goldtest_wb_EndTimeTab.Year,Goldtest_wb_EndTimeTab.Month,Goldtest_wb_EndTimeTab.Day,Goldtest_wb_EndTimeTab.Hour,Goldtest_wb_EndTimeTab.Minute,Goldtest_wb_EndTimeTab.Second)
--~ 		if Goldtest_wb_StartTime < 0 and Goldtest_wb_EndTime >= 0 then
--~ 			local Tab = Drop_AnniversaryGoldTab[1]
--~ 			local GaiLv = Tab.GaiLv
--~ 			local CD = Tab.CD
--~ 			if math.random(100) <= GaiLv and Time >= CD then
--~ 				Drop_AnniversaryGoldTab[1].CD = Time + math.random(Tab.a,Tab.b)
--~ 				API_AddActorGoods(ActorID, 82003, 1, '财神宝箱给周年金币')
--~ 			end
--~ 		end
		if PD == 1 then
			API_ResponseWrite('<br><br><text size="16" color="0,255,0">恭喜获得：财神称号。</text><br>')
			if not API_IsBattleGameServer() then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..PlayName..'打开财神宝箱获得“财神”称号！')
			end
		end
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
		if SpringFestival_GodBoxSayWorld[JiangLiGoodsID] ~= nil then
			local JiaZhi = SpringFestival_GodBoxSayWorld[JiangLiGoodsID] 
			local GoodsName = API_GetGoodsName(JiangLiGoodsID)
			if not API_IsBattleGameServer() then
				if JiaZhi == 0 then
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..PlayName..'打开财神宝箱获得了最新英雄秘籍：'..GoodsName..'！')
				elseif JiaZhi == 1 then
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..PlayName..'打开财神宝箱获得了：'..GoodsName..'！')
				else
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..PlayName..'打开财神宝箱获得了：'..GoodsName..'！')
				end
			end
		end
		if SpringFestival_GodBoxCDTime[Hour] ~= nil then
			local CDKey = 44
			local CD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, CDKey)
			local AllNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 58)
			local MaxNum = SpringFestival_GodBoxCDTime[Hour].MaxNum
			local CDmin = SpringFestival_GodBoxCDTime[Hour].CDmin
			local CDmax = SpringFestival_GodBoxCDTime[Hour].CDmax
			if AllNum < MaxNum and Time >= CD then
				local OtherTab = SpringFestival_GodBoxOtherGoods[math.random(table.getn(SpringFestival_GodBoxOtherGoods))]
				local GoodsID = OtherTab.GoodsID
				local Num = OtherTab.Num
				local Key = OtherTab.Key
				local Max = OtherTab.Max
				local NowNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, Key)
				if NowNum < Max then
					CD = Time + (math.random(CDmin,CDmax) * 60)
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, CDKey, CD)
					NowNum = NowNum + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, Key, NowNum)
					AllNum = AllNum + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 58, AllNum)
					if API_ActorCanAddGoods(ActorID,GoodsID,Num,0,0) ~= -1 then
						API_AddActorGoods(ActorID, GoodsID, Num, '财神宝箱额外奖励')
						API_ActorSendMsg(ActorID,10,'打开财神宝箱获得额外奖励：'..Num..'个'..API_GetGoodsName(GoodsID)..'')
					else
						API_SendActorMailByName(PlayName, GoodsID, Num, 0, '[财神宝箱]额外奖励', ''..Num..'个'..API_GetGoodsName(GoodsID)..'')
						API_ActorSendMsg(ActorID,10,'打开财神宝箱获得额外奖励：'..Num..'个'..API_GetGoodsName(GoodsID)..'（请到邮箱领取）')
					end
					if not API_IsBattleGameServer() then
						API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..PlayName..'打开财神宝箱额外获得了：'..Num..'个'..API_GetGoodsName(GoodsID)..'！')
					end
				end
			end
		end
		if SpringFestival_GodBoxLuckTime[Hour] ~= nil and PD ~= 1 then
			local CDKey = 64
			local CD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, CDKey)
			local AllNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 65)
			local MaxNum = SpringFestival_GodBoxLuckTime[Hour].MaxNum
			local CDmin = SpringFestival_GodBoxLuckTime[Hour].CDmin
			local CDmax = SpringFestival_GodBoxLuckTime[Hour].CDmax
			if AllNum < MaxNum and Time >= CD then
				if API_IsOwnedName(ActorID,208,1) == 1 then
				else
					CD = Time + (math.random(CDmin,CDmax) * 60)
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, CDKey, CD)
					AllNum = AllNum + 1
					API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 65, AllNum)
					API_SetPlayerNickName(ActorID,208,'',1,0,1,1,{972001})
					if not API_IsBattleGameServer() then
						API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..PlayName..'开启财神宝箱，获得最新稀有称号“幸运之神”！')
					end
				end
			end
		end
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 3
		if GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][Type][LaiYuan] + 1
		end
		MLB_DaoJuShiYong(ActorID,1,1,0,0,0)
		MLB_DaoJuShiYong(ActorID,2,1,0,0,0)
	end
	return 1
end

--跨天12点清除：财神数据清除
function Hl_MeiRiCSShuJuQingChu(Param1,Param2)

	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local NowTime = os.time()
	--API_Trace('Week'..Week)
	if API_GetServerID() == 1 then
		if NowTime > API_VarDataGetNumber_Ex(1,0,-6199,1,100) then
			--API_Trace('1111')
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,1,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,2,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,3,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,4,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,5,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,6,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,7,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,8,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,9,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,10,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,11,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,12,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,13,0)    
			--API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,14,0) 
			--API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,15,0) 
			--API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,16,0) 
			--API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,17,0) 
			local NowTime = os.date("*t", os.time()) 
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 12 
			NowTime.min = 0 
			NowTime.sec = 0 
			local NextTime = os.time(NowTime) 
			RefreshTimeSofieCaiShen = NextTime + 86400   
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,100,RefreshTimeSofieCaiShen)                  
		end
		--[[if NowTime > API_VarDataGetNumber_Ex(1,0,-6199,1,101) then
			API_Trace('222')
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,18,0) 
			--API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,19,0) 
			--API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,20,0) 
			--API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,21,0) 
			local NowTime = os.date("*t", os.time()) 
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 12 
			NowTime.min = 0 
			NowTime.sec = 0 
			local NextTime = os.time(NowTime) 
			RefreshTimeSofieCaiShenTwo = NextTime + 604800   
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,101,RefreshTimeSofieCaiShenTwo)                  
		end
		if NowTime > API_VarDataGetNumber_Ex(1,0,-6199,1,102) then
			API_Trace('33')
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,19,0) 
			local NowTime = os.date("*t", os.time()) 
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 12 
			NowTime.min = 0 
			NowTime.sec = 0 
			local NextTime = os.time(NowTime) 
			RefreshTimeSofieCaiShenThree = NextTime + 604800   
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,102,RefreshTimeSofieCaiShenThree)                  
		end
		if NowTime > API_VarDataGetNumber_Ex(1,0,-6199,1,103) then
			API_Trace('444444444')
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,20,0) 
			local NowTime = os.date("*t", os.time()) 
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 12 
			NowTime.min = 0 
			NowTime.sec = 0 
			local NextTime = os.time(NowTime) 
			RefreshTimeSofieCaiShenFORE = NextTime + 604800   
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,103,RefreshTimeSofieCaiShenFORE)                  
		end
		if NowTime > API_VarDataGetNumber_Ex(1,0,-6199,1,104) then
			API_Trace('555555')
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,21,0) 
			local NowTime = os.date("*t", os.time()) 
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 12 
			NowTime.min = 0 
			NowTime.sec = 0 
			local NextTime = os.time(NowTime) 
			RefreshTimeSofieCaiShenFive = NextTime + 604800   
			API_VarDataSetNumber_Ex_Sync(1,0,-6199,1,104,RefreshTimeSofieCaiShenFive)                  
		end ]]--
		
	end
end

--~ 神秘之地活动
--~ 神秘之门npcid/12212   
--~ 神秘之门卷轴物品ID/88590 
--19100 记录玩家开了多少次神秘之门
--12732 神秘之地特殊道具计数

--WYL_MysteriousDoorNotUseMap = {1,2,3,4,5,6,11,12,13,14,15,16,17,18,19,20,21,26,27,28,32,33,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,91,92,93,94,95,96,97,100,103,104,105,106,107,108,109,121,122,123,124}

WYL_MysteriousDoorGoodsTab = {
	[1] = {
		{GoodsID=	89075	,Point=	50	}, --欢度国庆[国]
		{GoodsID=	80274	,Point=	20	},
		{GoodsID=	75	,Point=	100	},
		{GoodsID=	80397	,Point=	40	},
		{GoodsID=	250	,Point=	10	},
		{GoodsID=	80394	,Point=	100	},
		{GoodsID=	119	,Point=	9	},
		{GoodsID=	208	,Point=	9	},
		{GoodsID=	80686	,Point=	100	},
		{GoodsID=	80689	,Point=	100	},
		{GoodsID=	31101	,Point=	200	},
		{GoodsID=	311	,Point=	11	},
		{GoodsID=	80621	,Point=	50	},
		--{GoodsID=	88943	,Point=	100	}, --神奇的粽子，过完节要注释掉
		--{GoodsID=	89188	,Point=	100	}, --鲜花
		},
	[2] = {
		--{GoodsID=31020,GoodsNum=1,GaiLv=20000,Max=1,Key=7,Key2=24,},
		--{GoodsID=11071,GoodsNum=1,GaiLv=20000,Max=5,Key=8,Key2=24,},
		--{GoodsID=31025,GoodsNum=1,GaiLv=20000,Max=1,Key=26,Key2=24,},
		--{GoodsID=31024,GoodsNum=1,GaiLv=5000,Max=1,Key=9,Key2=25,},
		{GoodsType=5,GaiLv=150,}, --恶魔宝宝
		{GoodsType=3,GaiLv=250,}, --天使凤凰
		{GoodsType=2,GaiLv=1800,}, --塔夫娃娃
		{GoodsType=4,GaiLv=4000,}, --时装
		{GoodsType=1,GaiLv=7500,}, --三洞等
		},
}

WYL_MysteriousGoodsType = {
	[1] = {1,},
	[2] = {3,4,},
	[3] = {6,},
	[4] = {7,8,10,},
	[5] = {12,},
}

WYL_MysteriousGoodsList = {
	[1] = {20099,20100,20101,20102,20103,20104,20105,20106,20107,20111,20112,20113,20114,20115,20116,20117,20118,20119,20121,20122,20123,20124,20125,20126,20127,20128,20129,},
	[2] = {89236,89241,89246,},--英雄书
	[3] = {31027,31028,31029,},--宠物卡人马系列
	[4] = {11509,11510,},  --紫灵之心11073,11074,
	[5] = {89236,89241,89246,},--英雄书
	[6] = {31030,31044,31049,31043,},--宝宝卡，天使，护士，堕天使，炎龙，增加复仇者，丛林,迪奥
	[7] = {11326,11327,11596,11597,},--魅魔黄金套女
	[8] = {11328,11329,11598,11599,},--魅魔黄金套男
	[9] = {89236,89241,89246,}, --概率大 英雄书
	[10] = {89236,89241,89246,}, --概率低 英雄书
	[11] = {80952,},--四档升级魔晶
	[12] = {11517,11520,11551,11552,11515,11516,11518,11519,11695,11696,11697,11698,11699,11700,11701,11702,},--加总督披风
}

WYL_MysteriousSPGoods = {}

WYL_MysteriousCDTime = {
	[8] = {MaxNum=5,CDmin=50,CDmax=65,},
	[9] = {MaxNum=5,CDmin=50,CDmax=65,},
	[10] = {MaxNum=5,CDmin=50,CDmax=65,},
	[11] = {MaxNum=5,CDmin=50,CDmax=65,},
	[12] = {MaxNum=5,CDmin=50,CDmax=65,},
	[13] = {MaxNum=13,CDmin=15,CDmax=25,},
	[14] = {MaxNum=13,CDmin=15,CDmax=25,},
	[15] = {MaxNum=13,CDmin=15,CDmax=25,},
	[16] = {MaxNum=19,CDmin=15,CDmax=30,},
	[17] = {MaxNum=19,CDmin=15,CDmax=30,},
	[18] = {MaxNum=19,CDmin=15,CDmax=30,},
	[19] = {MaxNum=31,CDmin=10,CDmax=15,},
	[20] = {MaxNum=31,CDmin=10,CDmax=15,},
	[21] = {MaxNum=31,CDmin=10,CDmax=15,},
	[22] = {MaxNum=33,CDmin=50,CDmax=65,},
	[23] = {MaxNum=33,CDmin=50,CDmax=65,},
}
--1装备，2技能书，3女仆，4卡片，5新时装
WYL_MysteriousGoodsLimit = {
[1] = {	Key=10,	CD=15,	Max=10,	LuckKey=0,	LuckMax=0,	DropJF=4,	NeedJF=8,	MinT=4,		MaxT=6,		TimeX=-1,	TimeD=-1,	TimeZ=0,	LeiBie=1,	XZ=1,},
[2] = {	Key=0,	CD=29,	Max=0,	LuckKey=0,	LuckMax=0,	DropJF=4,	NeedJF=8,	MinT=15,	MaxT=25,	TimeX=-1,	TimeD=-1,	TimeZ=0,	LeiBie=2,	XZ=1,},
[3] = {	Key=26,	CD=24,	Max=2,	LuckKey=27,	LuckMax=1,	DropJF=20,	NeedJF=40,	MinT=30,	MaxT=60,	TimeX=0,	TimeD=24,	TimeZ=0,	LeiBie=4,	XZ=1,},
[4] = {	Key=8,	CD=24,	Max=5,	LuckKey=0,	LuckMax=0,	DropJF=20,	NeedJF=40,	MinT=300,	MaxT=480,	TimeX=12,	TimeD=24,	TimeZ=0,	LeiBie=3,	XZ=0,},
[5] = {	Key=28,	CD=30,	Max=5,	LuckKey=0,	LuckMax=0,	DropJF=4,	NeedJF=8,	MinT=60,	MaxT=90,	TimeX=15,	TimeD=24,	TimeZ=0,	LeiBie=2,	XZ=1,},
[6] = {	Key=9,	CD=25,	Max=1,	LuckKey=9,	LuckMax=1,	DropJF=30,	NeedJF=60,	MinT=600,	MaxT=960,	TimeX=12,	TimeD=24,	TimeZ=0,	LeiBie=4,	XZ=0,},

[7] = {	Key=31,	CD=15,	Max=2,	LuckKey=0,	LuckMax=0,	DropJF=10,	NeedJF=20,	MinT=35,	MaxT=40,	TimeX=-1,	TimeD=-1,	TimeZ=0,	LeiBie=5,	XZ=1,},
[8] = {	Key=32,	CD=15,	Max=4,	LuckKey=0,	LuckMax=0,	DropJF=10,	NeedJF=20,	MinT=35,	MaxT=40,	TimeX=-1,	TimeD=-1,	TimeZ=0,	LeiBie=5,	XZ=1,},

[9] = {	Key=28,	CD=29,	Max=5,	LuckKey=0,	LuckMax=0,	DropJF=4,	NeedJF=8,	MinT=20,	MaxT=40,	TimeX=12,	TimeD=24,	TimeZ=0,	LeiBie=2,	XZ=0,},
[10] = {Key=28,	CD=30,	Max=5,	LuckKey=0,	LuckMax=0,	DropJF=4,	NeedJF=8,	MinT=20,	MaxT=40,	TimeX=12,	TimeD=24,	TimeZ=0,	LeiBie=2,	XZ=0,},

[11] = {Key=81,	CD=15,	Max=5,	LuckKey=0,	LuckMax=0,	DropJF=4,	NeedJF=8,	MinT=20,	MaxT=40,	TimeX=-1,	TimeD=-1,	TimeZ=0,	LeiBie=6,	XZ=0,},

[12] = {Key=86,	CD=87,	Max=1,	LuckKey=89,	LuckMax=1,	DropJF=40,	NeedJF=80,	MinT=600,	MaxT=960,	TimeX=12,	TimeD=24,	TimeZ=0,	LeiBie=5,	XZ=0,},
}

WYL_MysteriousCDTab = {15,24,25,29,30,}
WYL_MysteriousNumKeyTab = {7,8,9,10,26,27,28,31,32,81,82,}
WYL_MysteriousLuckTab = {1,2,5,8,2,9,8,9,5,1,2,5,8,3,0,5,8,7,1,2,6,0,5,8,5,6,0,}

WYL_MysteriousDoorEquipGoods = {20099,20100,20101,20102,20103,20104,20105,20106,20107,20111,20112,20113,20114,20115,20116,20117,20118,20119,20121,20122,20123,20124,20125,20126,20127,20128,20129,}

function WYL_MysteriousDoorUseGoods(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove,High,Low)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID) 
	local MapConfigID = API_GetMapConfigID(MapID) 
	local StaticMapID = API_GetStaticMapID(MapID)
	if MapConfigID == 130 then
		API_ActorSendMsg(ActorID,3,'本地图内无法使用该道具')
		return 0
	end
	--获取物品剩余使用时间，过期不给用
--~ 	local Uid = API_GetUID(High,Low) 
--~ 	local BoxID,LocID = API_GetUIDGoodsInActor(Uid,ActorID) 
	API_ResponseWrite('<name></name>')
--~ 	if API_GoodsCanUse(ActorID,Uid) == false then
--~ 		API_ResponseWrite('<br><text>此物品已过期，不能使用！</text><br>') 
--~ 		API_ResponseWrite('<br><br><a>确定</a>')
--~ 		return 0
--~ 	end
	if MapID == StaticMapID then
		API_ResponseWrite('<br><text>您即将进入神秘之地。进入神秘之地消灭BOSS，您将获得超丰厚的奖励！更有机会额外获得高附加属性3洞装备、超稀有宠物卡片！</text><br>') 
		API_ResponseWrite('<br><text>您也可以带领其他队员一同进入，但队友必须与您在同一地图。</text><text color="255,0,255">组队进入能更快速、安全的击杀BOSS，获得更高额的奖励！</text><br>') 
		--API_ResponseWrite('<br><br><a href="WYL_MysteriousDoorOpenDoor?2='..GoodsID..'&3='..High..'&4='..Low..'">我要进入</a><br>')
		API_ResponseWrite('<br><br><a href="WYL_MysteriousDoorOpenDoor">我要进入</a><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_ResponseWrite('<br><text>神秘之地传送卷使用失败！亲爱的玩家，此卷轴只可以在浮空岛以外地图打开。</text><br>') 
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end
end

function WYL_MysteriousDoorOpenDoor()
	local ActorID = API_RequestGetActorID() 
	local GoodsID = 88590 --API_RequestGetNumber(2)
--~ 	local High = API_RequestGetNumber(3)
--~ 	local Low = API_RequestGetNumber(4)
--~ 	local Uid = API_GetUID(High,Low) 
--~ 	local BoxID,LocID = API_GetUIDGoodsInActor(Uid,ActorID) 
--~ 	local GoodsID2 = API_GetUIDGoodsPropNum(Uid,0) 
--~ 	if GoodsID ~= GoodsID2 then
--~ 		API_ActorSendMsg(ActorID,3,'无效道具')
--~ 		return 
--~ 	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 
	end
	--if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,BoxID,LocID, '使用神秘之地卷轴') then
	if MysteriousPlace_InJudge(ActorID,GoodsID) == 1 and API_ActorRemoveGoods(ActorID,GoodsID,1, '使用神秘之地卷轴') then
		local MapID = API_GetActorMapID(ActorID)
		local MapConfigID = API_GetMapConfigID(MapID)
		local ObjectMapID = API_CreateEctype(1949,0)
		API_CreateMonster(ObjectMapID,11607,62,40,3,0,-1)
		WYL_MysteriousDoor_Initialization(ObjectMapID,ActorID)
		API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'WYL_MysteriousDoor_PlayGotoMap')
		--周排名
		MLB_DaoJuShiYong(ActorID,3,1,0,0,0)
		--总排名
		MLB_DaoJuShiYong(ActorID,4,1,0,0,0)
		API_VarDataSetNumber(ActorID,0,12743,2)
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 1
		if GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] + 1
		end
	end
end

function WYL_MysteriousDoor_Initialization(ObjectMapID,ActorID)
	--创建BOSS，出口
	local FastID = API_CreateMonster(ObjectMapID,726449,60,69,5,0,-1)
	API_SetMonsterName(FastID, '神秘之地守护者', 1)
	API_CreateDieTriggerG(ActorID,0,0,FastID,'WYL_MysteriousDoor_BossDieFunc')
end

function WYL_MysteriousDoor_PlayGotoMap(ObjectMapID,ActorID)
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorIsOnline(ActorID) then
		local MapID = API_GetActorMapID(ActorID)
		local MapConfigID = API_GetMapConfigID(MapID)
		--判断组队
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 and API_GetTeamLeader(TeamID) == ActorID then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID and not API_ActorIsDying(TeamActorID) then
					API_ActorGoToMap(TeamActorID,ObjectMapID,62,45)
					local LaiYuan = API_ActorGetPropNum(TeamActorID,201)
					local Type = 2
					if GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] + 1
					end
				end
			end
		else
			API_ActorGoToMap(ActorID,ObjectMapID,62,45)
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type = 2
			if GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] + 1
			end
		end
	end
end

function WYL_MysteriousDoor_BossDieFunc(ActorID,b,Type,FastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY)
	if not API_MapIsValid(MapID) then
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local Time = os.time() 
--~ 	if (Month == 3 and Day == 31) or (Month == 4 and Day < 6) then
--~ 		API_CreateDropGoods(MapID,PosX,PosY,845,math.random(3,10),0,'神秘之门掉节日奖励',4,0,600,0)
--~ 	end
	local x1,y1,x2,y2 = 54,56,69,71
	local Table = WYL_MysteriousDoorGoodsTab
	local LinShiTab = {}
	--掉落保底奖励
	local NowPoint = 0
	local PointMax = 300
	local TableLong1 = table.getn(Table[1])
	for i = 1,TableLong1 do
		if NowPoint < PointMax then
			local RandomNum = math.random(TableLong1)
			local GoodsID = Table[1][RandomNum].GoodsID
			local Point = Table[1][RandomNum].Point
			local x,y,Num = 0,0,0
			--国庆特殊处理国字
			local nGqShiFouStart = API_DiffDatatime(HL_GqPeiHeHuoDong_StartTime.Year,HL_GqPeiHeHuoDong_StartTime.Month,HL_GqPeiHeHuoDong_StartTime.Day,HL_GqPeiHeHuoDong_StartTime.Hour,HL_GqPeiHeHuoDong_StartTime.Minute,HL_GqPeiHeHuoDong_StartTime.Second)
			local nGqShiFouEnd = API_DiffDatatime(HL_GqPeiHeHuoDong__EndTime.Year,HL_GqPeiHeHuoDong__EndTime.Month,HL_GqPeiHeHuoDong__EndTime.Day,HL_GqPeiHeHuoDong__EndTime.Hour,HL_GqPeiHeHuoDong__EndTime.Minute,HL_GqPeiHeHuoDong__EndTime.Second)
			--if nGqShiFouStart <= 0 and nGqShiFouEnd > 0 then
			if GoodsID == 89075 and (nGqShiFouStart > 0 or nGqShiFouEnd <= 0) then
				GoodsID = 80621
			end
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				NowPoint = NowPoint + Point
				API_CreateDropGoods(MapID,x,y,GoodsID,1,0,'神秘之门掉保底奖励',4,0,600,0)
				if Point >= 100 then
					if LinShiTab[GoodsID] == nil then
						LinShiTab[GoodsID] = 1
					else
						LinShiTab[GoodsID] = LinShiTab[GoodsID] + 1
					end
				end
			end
		else
			break
		end
	end
	--掉符文卷轴
	local RuneNum = 1
	local RuneRD = math.random(100)
	local RuneCD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 57)
	if RuneRD <= 5 and Time >= RuneCD then
		RuneNum = 3
		RuneCD = Time + (math.random(5,10) * 60)
		API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 57, RuneCD)
	elseif RuneRD <= 10 then
		RuneNum = 2
	end
	local LaiYuan = 0
	if API_ActorIsOnline(ActorID) then
		LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 3
		if GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = RuneNum
		else
			GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] + RuneNum
		end
	else
		LaiYuan = API_ActorGetPropNum(KillerID,201)
		local Type = 3
		if GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = RuneNum
		else
			GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] + RuneNum
		end
	end
	for i = 1,RuneNum do
		local x,y,Num = 0,0,0
		repeat
			Num = Num + 1
			x = math.random(x1,x2)
			y = math.random(y1,y2)
		until not API_IsBlockTile(MapID,x,y,0) or Num == 100
		if not API_IsBlockTile(MapID,x,y,0) then
			API_CreateDropGoods(MapID,x,y,88910,1,0,'神秘之门掉符文',4,0,600,0)
		end
	end
	--掉周年金币
--~ 	local Goldtest_wb_StartTime = API_DiffDatatime(Goldtest_wb_StartTimeTab.Year,Goldtest_wb_StartTimeTab.Month,Goldtest_wb_StartTimeTab.Day,Goldtest_wb_StartTimeTab.Hour,Goldtest_wb_StartTimeTab.Minute,Goldtest_wb_StartTimeTab.Second)
--~ 	local Goldtest_wb_EndTime= API_DiffDatatime(Goldtest_wb_EndTimeTab.Year,Goldtest_wb_EndTimeTab.Month,Goldtest_wb_EndTimeTab.Day,Goldtest_wb_EndTimeTab.Hour,Goldtest_wb_EndTimeTab.Minute,Goldtest_wb_EndTimeTab.Second)
--~ 	if Goldtest_wb_StartTime < 0 and Goldtest_wb_EndTime >= 0 then
--~ 		Drop_AnniversaryGoldCoin(MapID,ActorID,2)
--~ 	end
	--掉爱慕之心
	local nShiFouStart = API_DiffDatatime(HL_PeiHeHuoDong_StartTime.Year,HL_PeiHeHuoDong_StartTime.Month,HL_PeiHeHuoDong_StartTime.Day,HL_PeiHeHuoDong_StartTime.Hour,HL_PeiHeHuoDong_StartTime.Minute,HL_PeiHeHuoDong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(HL_PeiHeHuoDong__EndTime.Year,HL_PeiHeHuoDong__EndTime.Month,HL_PeiHeHuoDong__EndTime.Day,HL_PeiHeHuoDong__EndTime.Hour,HL_PeiHeHuoDong__EndTime.Minute,HL_PeiHeHuoDong__EndTime.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then										
	--if Time >= 1329062400 and Time < 1329667200 then
		local GoodsNum = math.random(3)
		for i = 1,GoodsNum do
			local x,y,Num = 0,0,0
			repeat
				Num = Num + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				API_CreateDropGoods(MapID,x,y,89188,1,0,'神秘之门掉鲜花',4,0,600,0)
			end
		end
	end
	local nShiFouStart = API_DiffDatatime(HLsd_PeiHeHuoDong_StartTime.Year,HLsd_PeiHeHuoDong_StartTime.Month,HLsd_PeiHeHuoDong_StartTime.Day,HLsd_PeiHeHuoDong_StartTime.Hour,HLsd_PeiHeHuoDong_StartTime.Minute,HLsd_PeiHeHuoDong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(HLsdzf_PeiHeHuoDong__EndTime.Year,HLsdzf_PeiHeHuoDong__EndTime.Month,HLsdzf_PeiHeHuoDong__EndTime.Day,HLsdzf_PeiHeHuoDong__EndTime.Hour,HLsdzf_PeiHeHuoDong__EndTime.Minute,HLsdzf_PeiHeHuoDong__EndTime.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
	--if Time >= 1323878400 and Time < 1326038400 then
		if math.random(100) <= 20 then
			API_CreateDropGoods(MapID,PosX,PosY,89126,1,0,'神秘掉祝福卡片',4,0,600,0)
		end
	end
	local JingYanNum = 1
	local ShuiJingBiNum = 1
	local TeamID = API_GetTeamID(KillerID)
	if TeamID > 0 then
		local TeamSize = API_GetTeamSize(TeamID)
		JingYanNum = JingYanNum * TeamSize
		ShuiJingBiNum = ShuiJingBiNum * TeamSize
	end
	--掉落金币
	for i = 1,10 do
		local x,y,Num = 0,0,0
		repeat
			Num = Num + 1
			x = math.random(x1,x2)
			y = math.random(y1,y2)
		until not API_IsBlockTile(MapID,x,y,0) or Num == 100
		if not API_IsBlockTile(MapID,x,y,0) then
			API_CreateDropGoods(MapID,x,y,80410,100,0,'神秘之门掉金币',4,0,600,0)
		end
	end
	for i = 1,15 do
		local x,y,Num = 0,0,0
		repeat
			Num = Num + 1
			x = math.random(x1,x2)
			y = math.random(y1,y2)
		until not API_IsBlockTile(MapID,x,y,0) or Num == 100
		if not API_IsBlockTile(MapID,x,y,0) then
			API_CreateDropGoods(MapID,x,y,80696,ShuiJingBiNum,0,'神秘之门掉水晶币',4,0,600,0)
		end
	end
	for i = 1,40 do
		local x,y,Num = 0,0,0
		repeat
			Num = Num + 1
			x = math.random(x1,x2)
			y = math.random(y1,y2)
		until not API_IsBlockTile(MapID,x,y,0) or Num == 100
		if not API_IsBlockTile(MapID,x,y,0) then
			API_CreateDropGoods(MapID,x,y,80498,JingYanNum,0,'神秘之门掉经验',4,0,600,0)
		end
	end
	--掉落高附加属性装备
	local DropEquipRD = math.random(100)
	local DropEquipCD = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 76)
	if DropEquipRD <= 10 and Time >= DropEquipCD then
		local EquipGoodsID = WYL_MysteriousDoorEquipGoods[math.random(table.getn(WYL_MysteriousDoorEquipGoods))]
		local x,y,Num = 0,0,0
		repeat
			Num = Num + 1
			x = math.random(x1,x2)
			y = math.random(y1,y2)
		until not API_IsBlockTile(MapID,x,y,0) or Num == 100
		if not API_IsBlockTile(MapID,x,y,0) then
			local CD = Time + 300
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 76, CD)
			if API_ActorIsOnline(ActorID) then
				API_CreateDropGoodsEx(MapID,x,y,EquipGoodsID,1,0,'神秘之门掉高附加装备',4,ActorID,600,120,7)
				local Type = 4
				if GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] + 1
				end
			else
				API_CreateDropGoodsEx(MapID,x,y,EquipGoodsID,1,0,'神秘之门掉高附加装备',0,0,600,0,7)
				local Type = 4
				if GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[56][Type][LaiYuan] + 1
				end
			end
		end
	end
	local DropType = 0
	local GoodsID = 0
	if API_ActorIsOnline(ActorID) then
		local EndTime = os.date("*t", os.time()) 
		EndTime.year = 2038
		EndTime.month = 1
		EndTime.day = 19
		EndTime.hour = 0 
		EndTime.min = 0 
		EndTime.sec = 0 
		local EndTime2 = os.time(EndTime) 
		local OpenNum =  API_VarDataGetNumber(ActorID,1,19100)
		if OpenNum < 0 then 
			OpenNum = 0
		end
		OpenNum = OpenNum + 1
		if OpenNum >= 200 then
			OpenNum = 200
		end
		API_VarDataSetNumber(ActorID,1,19100,OpenNum)
		--local SPNum =  API_VarDataGetNumber(ActorID,1,12732)
		--SPNum = SPNum + 1
		--API_VarDataSetNumber(ActorID,1,12732,SPNum)
		--API_Trace('最开始=')
		if Time < EndTime2 and OpenNum >= 0 and WYL_MysteriousCDTime[Hour] ~= nil then
			local DoorMaxNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 11)
			local DiaoLuoNum = WYL_MysteriousCDTime[Hour].MaxNum
			local RD = math.random(10000)
			for j,v in pairs(Table[2]) do
				local GoodsType = v.GoodsType
				local GaiLv = v.GaiLv
				if OpenNum >= 0 then
					if GoodsType == 4 then
						GaiLv = WYL_MysteriousDoor_LuckValue[OpenNum][2] * 1.5
					elseif GoodsType == 5 then
						GaiLv = WYL_MysteriousDoor_LuckValue[OpenNum][3]
					elseif GoodsType == 3 then
						GaiLv = WYL_MysteriousDoor_LuckValue[OpenNum][GoodsType] * 1.1
					else
						GaiLv = WYL_MysteriousDoor_LuckValue[OpenNum][GoodsType]
					end
				end
				--if RD > 0 then
				if RD <= GaiLv then
					local Type = WYL_MysteriousGoodsType[GoodsType][math.random(table.getn(WYL_MysteriousGoodsType[GoodsType]))]
					local LimitTab = WYL_MysteriousGoodsLimit[Type]
					local XZ = LimitTab.XZ
					local TimeX = LimitTab.TimeX
					local TimeD = LimitTab.TimeD
					local TimeZ = LimitTab.TimeZ
					local PD = 0
					if XZ == 0 then
--~ 						if TimeX < 0 and TimeD < 0 then
--~ 							PD = 1
--~ 						else
--~ 							if Hour >= TimeX and Hour <= TimeD then
--~ 								PD = 1
--~ 							end
--~ 						end
						if (Hour >= TimeX and Hour < TimeD) or (Hour == TimeD and Minute <= 30) then
							PD = 1
						end
					else
						if DoorMaxNum < DiaoLuoNum then
--~ 							if TimeZ > 0 then
--~ 								if Hour >= TimeX and Hour <= TimeD or Hour >= TimeZ then
--~ 									PD =1
--~ 								end
--~ 							else
--~ 								if TimeX < 0 and TimeD < 0 then
--~ 									PD = 1
--~ 								else
--~ 									if Type == 6 then
--~ 										if (Hour >= TimeX and Hour < TimeD) or (Hour == TimeD and Minute <= 30) then
--~ 											PD = 1
--~ 										end
--~ 									else
--~ 										if Hour >= TimeX and Hour <= TimeD then
--~ 											PD = 1
--~ 										end
--~ 									end
--~ 								end
--~ 							end
							PD = 1
						end
					end
--~ 					if Time < 1303790400 and GoodsType == 5 then
--~ 						PD = 0
--~ 					end
					if PD == 1 then
						local Key = LimitTab.Key
						local KeyNum = -1
						if Key > 0 then
							KeyNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, Key)
						end
						local CD = LimitTab.CD
						local CDTime = API_VarDataGetNumber_Ex(1, 0, -2000, 1, CD)
						local Max = LimitTab.Max
						if Type == 6 then
							Max = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 56)
						elseif Type == 12 then
							Max = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 88)
--~ 							if Week >= 1 and Week <= 5 then
--~ 								Max = 1
--~ 							end
						end
						local DropJF = LimitTab.DropJF
						local NeedJF = LimitTab.NeedJF
						local MinT = LimitTab.MinT
						local MaxT = LimitTab.MaxT
						local LeiBie = LimitTab.LeiBie
						--if KeyNum < Max and OpenNum >= DropJF then
						if KeyNum < Max and Time >= CDTime and OpenNum >= DropJF then
							local x,y,Num = 0,0,0
							repeat
								Num = Num + 1
								x = math.random(x1,x2)
								y = math.random(y1,y2)
							until not API_IsBlockTile(MapID,x,y,0) or Num == 100
							if not API_IsBlockTile(MapID,x,y,0) then
							--API_Trace('111111111=')
								if Key > 0 then
									KeyNum = KeyNum + 1
									API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, Key, KeyNum)
								end
								if XZ == 1 then
									DoorMaxNum = DoorMaxNum + 1
									API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 11, DoorMaxNum)
								end
								GoodsID = WYL_MysteriousGoodsList[Type][math.random(table.getn(WYL_MysteriousGoodsList[Type]))]
								local GoodsNum = 1
								OpenNum = OpenNum - NeedJF
								if OpenNum < 0 then
									OpenNum = 0
								end
								API_VarDataSetNumber(ActorID,1,19100,OpenNum)
--~ 								if GoodsID == 31022 then
--~ 									local NowTime = os.date("*t", os.time()) 
--~ 									NowTime.year = Year
--~ 									NowTime.month = Month
--~ 									NowTime.day = Day
--~ 									NowTime.hour = 23 
--~ 									NowTime.min = 59 
--~ 									NowTime.sec = 59 
--~ 									local NightTime = os.time(NowTime) 
--~ 									local LastTime = NightTime + (math.random(MinT,MaxT) * 60)
--~ 									API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, CD, LastTime)
--~ 								else
--~ 									
									local LastTime = Time + (math.random(MinT,MaxT) * 60)
									API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, CD, LastTime)
--~ 								end
								--[[for j in WYL_MysteriousCDTab do
									local CDKey = WYL_MysteriousCDTab[j]
									if CDKey ~= CD then
										local OtherTime = API_VarDataGetNumber_Ex(1, 0, -2000, 1, CDKey)
										if OtherTime - Time <= 200 then
											OtherTime = Time + (math.random(4,6) * 60)
											API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, CDKey, OtherTime)
										end
									end
								end]]--
								local Type2 = 2
								if LeiBie == 4 then
									API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'神秘之门掉卡片',0,ActorID,600,120)
									Type2 = 7
									--API_Trace('掉卡片=')
								elseif LeiBie == 1 then
									API_CreateDropGoodsEx(MapID,x,y,GoodsID,GoodsNum,0,'神秘之门掉三洞装备',4,ActorID,600,120,6)
									Type2 = 5
								elseif LeiBie == 2 then
									API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'神秘之门掉技能书',0,ActorID,600,120)
									Type2 = 6
								elseif LeiBie == 3 then
									API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'神秘之门掉饰品',0,ActorID,600,120)
									Type2 = 8
								elseif LeiBie == 5 then
									API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'神秘之门掉新时装',0,ActorID,600,120)
									Type2 = 8
								elseif LeiBie == 6 then
									API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'神秘之门掉四档升档',0,ActorID,600,120)
								end
								--API_Trace('最后面=')
								DropType = LeiBie
								if GLOBAL_FengXiangBiao_DateList[56][Type2][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[56][Type2][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[56][Type2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[56][Type2][LaiYuan] + 1
								end
								local b = os.date("*t",API_VarDataGetNumber_Ex(1, 0, -2000, 1, 25))
								local bTime = b.hour * 10000 + b.min * 100 + b.sec 
								GLOBAL_FengXiangBiao_DateList[56][9][LaiYuan] = bTime
							end
						end
					end
					break
				end
			end
			if DropType == 0 and GoodsID == 0 then
				if OpenNum >= 100 then
					if OpenNum > 200 then
						OpenNum = 200
					end
					local RD = math.random(10000)
					for j,v in pairs(Table[2]) do
						local GoodsType = v.GoodsType
						local GaiLv = v.GaiLv
						local LuckBeiLv = 1
						if OpenNum >= 200 then
							LuckBeiLv = 10
						elseif OpenNum >= 100 then
							LuckBeiLv = 5
						end
						if GoodsType == 4 then
							GaiLv = WYL_MysteriousDoor_LuckValue[OpenNum][2] * LuckBeiLv
						elseif GoodsType == 5 then
							GaiLv = WYL_MysteriousDoor_LuckValue[OpenNum][3] * LuckBeiLv
						else
							GaiLv = WYL_MysteriousDoor_LuckValue[OpenNum][GoodsType] * LuckBeiLv
						end
						if Time < 1303790400 and GoodsType == 5 then
							RD = 100000
						end
						if RD <= GaiLv then
							local Type = WYL_MysteriousGoodsType[GoodsType][math.random(table.getn(WYL_MysteriousGoodsType[GoodsType]))]
							local LimitTab = WYL_MysteriousGoodsLimit[Type]
							local LuckKey = LimitTab.LuckKey
							local LuckKeyNum = -1
							if LuckKey > 0 then
								LuckKeyNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, LuckKey)
							end
							local CD = LimitTab.CD
							local CDTime = API_VarDataGetNumber_Ex(1, 0, -2000, 1, CD)
							local LuckMax = LimitTab.LuckMax
							local NeedJF = LimitTab.NeedJF
							local MinT = LimitTab.MinT
							local MaxT = LimitTab.MaxT
							local LeiBie = LimitTab.LeiBie
							if LuckKeyNum < LuckMax and Time >= CDTime then
								local x,y,Num = 0,0,0
								repeat
									Num = Num + 1
									x = math.random(x1,x2)
									y = math.random(y1,y2)
								until not API_IsBlockTile(MapID,x,y,0) or Num == 100
								if not API_IsBlockTile(MapID,x,y,0) then
									if LuckKey > 0 then
										LuckKeyNum = LuckKeyNum + 1
										API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, LuckKey, LuckKeyNum)
									end
									GoodsID = WYL_MysteriousGoodsList[Type][math.random(table.getn(WYL_MysteriousGoodsList[Type]))]
									local GoodsNum = 1
									OpenNum = OpenNum - NeedJF
									if OpenNum < 0 then
										OpenNum = math.floor(OpenNum*0.5)
									end
									API_VarDataSetNumber(ActorID,1,19100,OpenNum)
--~ 									if GoodsID == 31022 then
--~ 										local NowTime = os.date("*t", os.time()) 
--~ 										NowTime.year = Year
--~ 										NowTime.month = Month
--~ 										NowTime.day = Day
--~ 										NowTime.hour = 23 
--~ 										NowTime.min = 59 
--~ 										NowTime.sec = 59 
--~ 										local NightTime = os.time(NowTime) 
--~ 										local LastTime = NightTime + (math.random(MinT,MaxT) * 60)
--~ 										API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, CD, LastTime)
--~ 									else
										
										local LastTime = Time + (math.random(MinT,MaxT) * 60)
										API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, CD, LastTime)
--~ 									end
									for j in WYL_MysteriousCDTab do
										local CDKey = WYL_MysteriousCDTab[j]
										if CDKey ~= CD then
											local OtherTime = API_VarDataGetNumber_Ex(1, 0, -2000, 1, CDKey)
											if OtherTime - Time <= 200 then
												OtherTime = Time + (math.random(4,6) * 60)
												API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, CDKey, OtherTime)
											end
										end
									end
									local Type2 = 2
									if LeiBie == 4 then
										API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'神秘之门掉卡片',0,ActorID,600,120)
										Type2 = 7
									elseif LeiBie == 1 then
										API_CreateDropGoodsEx(MapID,x,y,GoodsID,GoodsNum,0,'神秘之门掉三洞装备',4,ActorID,600,120,6)
										Type2 = 5
									elseif LeiBie == 2 then
										API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'神秘之门掉技能书',0,ActorID,600,120)
										Type2 = 6
									elseif LeiBie == 3 then
										API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'神秘之门掉时装',0,ActorID,600,120)
										Type2 = 8
									elseif LeiBie == 5 then
										API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'神秘之门掉新时装',0,ActorID,600,120)
										Type2 = 8
									elseif LeiBie == 6 then
										API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'神秘之门掉四档升档',0,ActorID,600,120)
									end
									DropType = LeiBie
									if GLOBAL_FengXiangBiao_DateList[56][Type2][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[56][Type2][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[56][Type2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[56][Type2][LaiYuan] + 1
									end
									local b = os.date("*t",API_VarDataGetNumber_Ex(1, 0, -2000, 1, 25))
									local bTime = b.hour * 10000 + b.min * 100 + b.sec 
									GLOBAL_FengXiangBiao_DateList[56][9][LaiYuan] = bTime
								end
							end
							break
						end
					end
				end
			end
		end
	end
	local LSGD = ''
	local BC = 0
	local BC2 = 0
	for j in LinShiTab do
		BC = BC + 1
	end
	for j,v in pairs(LinShiTab) do
		BC2 = BC2 + 1
		if BC2 ~= BC then
			LSGD = LSGD..''..API_GetGoodsName(j)..'×'..v..'、'
		else
			LSGD = LSGD..''..API_GetGoodsName(j)..'×'..v..''
		end
	end
	if API_IsBattleGameServer() then
		return
	end
	if API_ActorIsOnline(ActorID) then
		local ActorName = API_GetActorName(ActorID)
		if BC == 0 then
			if DropType == 4 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了超稀有宠物卡片：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 1 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了高附加属性3洞的'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 2 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了新英雄技能书：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 3 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了最新神秘饰品：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 5 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了最新神秘时装：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 6 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了：'..API_GetGoodsName(GoodsID)..'！')
			end
		else
			--API_ActorBroadcastMsg(-1, 17, ''..ActorName..'使用神秘之地传送卷进入神秘之地，击败BOSS，获得了'..LSGD..'。')
			if DropType == 4 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了超稀有宠物卡片：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 1 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了高附加属性3洞的'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 2 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了新英雄技能书：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 3 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了最新神秘饰品：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 5 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了最新神秘时装：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 6 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了：'..API_GetGoodsName(GoodsID)..'！')
			end
		end
		if RuneNum == 3 then
			API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了3个符文卷轴！')
		end
	else
		local ActorName = API_GetActorName(KillerID)
		if BC == 0 then
			if DropType == 4 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了超稀有宠物卡片：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 1 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了高附加属性3洞的'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 2 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了新英雄技能书：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 3 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了最新神秘饰品：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 5 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了最新神秘时装：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 6 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了：'..API_GetGoodsName(GoodsID)..'！')
			end
		else
			--API_ActorBroadcastMsg(-1, 17, ''..KillName..'击败神秘之地BOSS，获得了'..LSGD..'。')
			if DropType == 4 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了超稀有宠物卡片：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 1 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了高附加属性3洞的'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 2 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了新英雄技能书：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 3 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了最新神秘饰品：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 5 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了最新神秘时装：'..API_GetGoodsName(GoodsID)..'！')
			elseif DropType == 6 then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'人品大爆发！击败神秘之地BOSS获得了：'..API_GetGoodsName(GoodsID)..'！')
			end
		end
	end
end

WYL_MysteriousDoor_LuckValue = {
[	0	] = {	750	,	250	,	50	,},
[	1	] = {	796	,	265	,	53	,},
[	2	] = {	842	,	280	,	56	,},
[	3	] = {	888	,	296	,	59	,},
[	4	] = {	935	,	311	,	62	,},
[	5	] = {	981	,	327	,	65	,},
[	6	] = {	1027	,	342	,	68	,},
[	7	] = {	1073	,	357	,	71	,},
[	8	] = {	1120	,	373	,	74	,},
[	9	] = {	1166	,	388	,	77	,},
[	10	] = {	1212	,	404	,	80	,},
[	11	] = {	1258	,	419	,	83	,},
[	12	] = {	1305	,	435	,	87	,},
[	13	] = {	1351	,	450	,	90	,},
[	14	] = {	1397	,	465	,	93	,},
[	15	] = {	1443	,	481	,	96	,},
[	16	] = {	1490	,	496	,	99	,},
[	17	] = {	1536	,	512	,	102	,},
[	18	] = {	1582	,	527	,	105	,},
[	19	] = {	1628	,	542	,	108	,},
[	20	] = {	1675	,	558	,	111	,},
[	21	] = {	1721	,	573	,	114	,},
[	22	] = {	1767	,	589	,	117	,},
[	23	] = {	1813	,	604	,	120	,},
[	24	] = {	1860	,	619	,	124	,},
[	25	] = {	1906	,	635	,	127	,},
[	26	] = {	1952	,	650	,	130	,},
[	27	] = {	1998	,	666	,	133	,},
[	28	] = {	2045	,	681	,	136	,},
[	29	] = {	2091	,	697	,	139	,},
[	30	] = {	2137	,	712	,	142	,},
[	31	] = {	2183	,	727	,	145	,},
[	32	] = {	2230	,	743	,	148	,},
[	33	] = {	2276	,	758	,	151	,},
[	34	] = {	2322	,	774	,	154	,},
[	35	] = {	2368	,	789	,	157	,},
[	36	] = {	2415	,	804	,	161	,},
[	37	] = {	2461	,	820	,	164	,},
[	38	] = {	2507	,	835	,	167	,},
[	39	] = {	2553	,	851	,	170	,},
[	40	] = {	2600	,	866	,	173	,},
[	41	] = {	2646	,	882	,	176	,},
[	42	] = {	2692	,	897	,	179	,},
[	43	] = {	2738	,	912	,	182	,},
[	44	] = {	2785	,	928	,	185	,},
[	45	] = {	2831	,	943	,	188	,},
[	46	] = {	2877	,	959	,	191	,},
[	47	] = {	2923	,	974	,	194	,},
[	48	] = {	2970	,	989	,	198	,},
[	49	] = {	3016	,	1005	,	201	,},
[	50	] = {	3062	,	1020	,	204	,},
[	51	] = {	3108	,	1036	,	207	,},
[	52	] = {	3154	,	1051	,	210	,},
[	53	] = {	3201	,	1067	,	213	,},
[	54	] = {	3247	,	1082	,	216	,},
[	55	] = {	3293	,	1097	,	219	,},
[	56	] = {	3339	,	1113	,	222	,},
[	57	] = {	3386	,	1128	,	225	,},
[	58	] = {	3432	,	1144	,	228	,},
[	59	] = {	3478	,	1159	,	231	,},
[	60	] = {	3524	,	1175	,	235	,},
[	61	] = {	3571	,	1190	,	238	,},
[	62	] = {	3617	,	1205	,	241	,},
[	63	] = {	3663	,	1221	,	244	,},
[	64	] = {	3709	,	1236	,	247	,},
[	65	] = {	3756	,	1252	,	250	,},
[	66	] = {	3802	,	1267	,	253	,},
[	67	] = {	3848	,	1282	,	256	,},
[	68	] = {	3894	,	1298	,	259	,},
[	69	] = {	3941	,	1313	,	262	,},
[	70	] = {	3987	,	1329	,	265	,},
[	71	] = {	4033	,	1344	,	268	,},
[	72	] = {	4079	,	1360	,	272	,},
[	73	] = {	4126	,	1375	,	275	,},
[	74	] = {	4172	,	1390	,	278	,},
[	75	] = {	4218	,	1406	,	281	,},
[	76	] = {	4264	,	1421	,	284	,},
[	77	] = {	4311	,	1437	,	287	,},
[	78	] = {	4357	,	1452	,	290	,},
[	79	] = {	4403	,	1467	,	293	,},
[	80	] = {	4449	,	1483	,	296	,},
[	81	] = {	4496	,	1498	,	299	,},
[	82	] = {	4542	,	1514	,	302	,},
[	83	] = {	4588	,	1529	,	305	,},
[	84	] = {	4634	,	1545	,	308	,},
[	85	] = {	4681	,	1560	,	312	,},
[	86	] = {	4727	,	1575	,	315	,},
[	87	] = {	4773	,	1591	,	318	,},
[	88	] = {	4819	,	1606	,	321	,},
[	89	] = {	4866	,	1622	,	324	,},
[	90	] = {	4912	,	1637	,	327	,},
[	91	] = {	4958	,	1652	,	330	,},
[	92	] = {	5004	,	1668	,	333	,},
[	93	] = {	5051	,	1683	,	336	,},
[	94	] = {	5097	,	1699	,	339	,},
[	95	] = {	5143	,	1714	,	342	,},
[	96	] = {	5189	,	1730	,	345	,},
[	97	] = {	5236	,	1745	,	349	,},
[	98	] = {	5282	,	1760	,	352	,},
[	99	] = {	5328	,	1776	,	355	,},
[	100	] = {	5374	,	1791	,	358	,},
[	101	] = {	5421	,	1807	,	361	,},
[	102	] = {	5467	,	1822	,	364	,},
[	103	] = {	5513	,	1837	,	367	,},
[	104	] = {	5559	,	1853	,	370	,},
[	105	] = {	5606	,	1868	,	373	,},
[	106	] = {	5652	,	1884	,	376	,},
[	107	] = {	5698	,	1899	,	379	,},
[	108	] = {	5744	,	1915	,	382	,},
[	109	] = {	5791	,	1930	,	386	,},
[	110	] = {	5837	,	1945	,	389	,},
[	111	] = {	5883	,	1961	,	392	,},
[	112	] = {	5929	,	1976	,	395	,},
[	113	] = {	5976	,	1992	,	398	,},
[	114	] = {	6022	,	2007	,	401	,},
[	115	] = {	6068	,	2022	,	404	,},
[	116	] = {	6114	,	2038	,	407	,},
[	117	] = {	6161	,	2053	,	410	,},
[	118	] = {	6207	,	2069	,	413	,},
[	119	] = {	6253	,	2084	,	416	,},
[	120	] = {	6299	,	2100	,	419	,},
[	121	] = {	6346	,	2115	,	423	,},
[	122	] = {	6392	,	2130	,	426	,},
[	123	] = {	6438	,	2146	,	429	,},
[	124	] = {	6484	,	2161	,	432	,},
[	125	] = {	6531	,	2177	,	435	,},
[	126	] = {	6577	,	2192	,	438	,},
[	127	] = {	6623	,	2207	,	441	,},
[	128	] = {	6669	,	2223	,	444	,},
[	129	] = {	6716	,	2238	,	447	,},
[	130	] = {	6762	,	2254	,	450	,},
[	131	] = {	6808	,	2269	,	453	,},
[	132	] = {	6854	,	2285	,	456	,},
[	133	] = {	6901	,	2300	,	460	,},
[	134	] = {	6947	,	2315	,	463	,},
[	135	] = {	6993	,	2331	,	466	,},
[	136	] = {	7039	,	2346	,	469	,},
[	137	] = {	7086	,	2362	,	472	,},
[	138	] = {	7132	,	2377	,	475	,},
[	139	] = {	7178	,	2392	,	478	,},
[	140	] = {	7224	,	2408	,	481	,},
[	141	] = {	7271	,	2423	,	484	,},
[	142	] = {	7317	,	2439	,	487	,},
[	143	] = {	7363	,	2454	,	490	,},
[	144	] = {	7409	,	2470	,	493	,},
[	145	] = {	7456	,	2485	,	497	,},
[	146	] = {	7502	,	2500	,	500	,},
[	147	] = {	7548	,	2516	,	503	,},
[	148	] = {	7594	,	2531	,	506	,},
[	149	] = {	7641	,	2547	,	509	,},
[	150	] = {	7687	,	2562	,	512	,},
[	151	] = {	7733	,	2577	,	515	,},
[	152	] = {	7779	,	2593	,	518	,},
[	153	] = {	7826	,	2608	,	521	,},
[	154	] = {	7872	,	2624	,	524	,},
[	155	] = {	7918	,	2639	,	527	,},
[	156	] = {	7964	,	2654	,	530	,},
[	157	] = {	8011	,	2670	,	534	,},
[	158	] = {	8057	,	2685	,	537	,},
[	159	] = {	8103	,	2701	,	540	,},
[	160	] = {	8149	,	2716	,	543	,},
[	161	] = {	8196	,	2732	,	546	,},
[	162	] = {	8242	,	2747	,	549	,},
[	163	] = {	8288	,	2762	,	552	,},
[	164	] = {	8334	,	2778	,	555	,},
[	165	] = {	8381	,	2793	,	558	,},
[	166	] = {	8427	,	2809	,	561	,},
[	167	] = {	8473	,	2824	,	564	,},
[	168	] = {	8519	,	2839	,	567	,},
[	169	] = {	8566	,	2855	,	571	,},
[	170	] = {	8612	,	2870	,	574	,},
[	171	] = {	8658	,	2886	,	577	,},
[	172	] = {	8704	,	2901	,	580	,},
[	173	] = {	8751	,	2917	,	583	,},
[	174	] = {	8797	,	2932	,	586	,},
[	175	] = {	8843	,	2947	,	589	,},
[	176	] = {	8889	,	2963	,	592	,},
[	177	] = {	8936	,	2978	,	595	,},
[	178	] = {	8982	,	2994	,	598	,},
[	179	] = {	9028	,	3009	,	601	,},
[	180	] = {	9074	,	3024	,	604	,},
[	181	] = {	9121	,	3040	,	608	,},
[	182	] = {	9167	,	3055	,	611	,},
[	183	] = {	9213	,	3071	,	614	,},
[	184	] = {	9259	,	3086	,	617	,},
[	185	] = {	9306	,	3102	,	620	,},
[	186	] = {	9352	,	3117	,	623	,},
[	187	] = {	9398	,	3132	,	626	,},
[	188	] = {	9444	,	3148	,	629	,},
[	189	] = {	9491	,	3163	,	632	,},
[	190	] = {	9537	,	3179	,	635	,},
[	191	] = {	9583	,	3194	,	638	,},
[	192	] = {	9629	,	3209	,	641	,},
[	193	] = {	9676	,	3225	,	645	,},
[	194	] = {	9722	,	3240	,	648	,},
[	195	] = {	9768	,	3256	,	651	,},
[	196	] = {	9814	,	3271	,	654	,},
[	197	] = {	9861	,	3287	,	657	,},
[	198	] = {	9907	,	3302	,	660	,},
[	199	] = {	9953	,	3317	,	663	,},
[	200	] = {	10000	,	3333	,	666	,},
}

--掉周年金币公共函数
Drop_AnniversaryGoldTab = {
	--财神宝箱
	[1] = {GaiLv=1,CD=0,a=30,b=60,},
	--神秘之地
	[2] = {GaiLv=10,CD=0,a=10,b=20,},
	--深寒地宫
	[3] = {GaiLv=10,CD=0,a=10,b=20,},
}

function Drop_AnniversaryGoldCoin(MapID,ActorID,Num)
	if not API_ActorIsOnline(ActorID) or API_GetActorMapID(ActorID) ~= MapID then
		return
	end
	local Time = os.time()
	local Tab = Drop_AnniversaryGoldTab[Num]
	local GaiLv = Tab.GaiLv
	local CD = Tab.CD
	if math.random(100) <= GaiLv and Time >= CD then
		Drop_AnniversaryGoldTab[Num].CD = Time + math.random(Tab.a,Tab.b)
		local x,y = PublicFun_GetActorPosXY(ActorID) 
		API_CreateDropGoods(MapID,x,y,82003,1,0,'周年活动掉金币',0,ActorID,600,300)
	end
--~ 	local TeamID = API_GetTeamID(ActorID)
--~ 	if TeamID > 0 then
--~ 		local TeamSize = API_GetTeamSize(TeamID)
--~ 		for i = 1,TeamSize do
--~ 			local TeamActorID = API_GetTeamMem(TeamID,i)
--~ 			if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID and math.random(100) <= 10 then
--~ 				local x,y = PublicFun_GetActorPosXY(TeamActorID) 
--~ 				API_CreateDropGoods(MapID,x,y,82003,1,1,'周年活动掉金币',0,TeamActorID,180,180)
--~ 			end
--~ 		end
--~ 	end
end

--一盘饺子 状态ID 885001~885005
SpringFestival_StatusTab = {
	[88878] = {885001,885002,885003,885004,885005,},
	[88943] = {978001,978002,978003,978004,978005,},
	[88945] = {984001,984002,984003,984004,},
}
function SpringFestival_Dumpling(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if SpringFestival_StatusTab[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效道具')
		return 0
	end
	if GoodsID == 88945 and API_ActorFindStatus(ActorID, 978) then
		API_ActorSendMsg(ActorID,3,'不可以和'..API_GetGoodsName(88943)..'同时使用')
		return 0
	end
	if GoodsID == 88943 and API_ActorFindStatus(ActorID, 984) then
		API_ActorSendMsg(ActorID,3,'不可以和'..API_GetGoodsName(88945)..'同时使用')
		return 0
	end
	local Name = ''
	local Tips = ''
	if GoodsID == 88878 then
		Name = '饺子'
		Tips = '一个'
	elseif GoodsID == 88943 then
		Name = '粽子'
		Tips = '一个'
	elseif GoodsID == 88945 then
		Name = '西瓜'
		Tips = '一块'
	end
	if API_ActorRemoveGoods(ActorID, GoodsID, 1, '使用'..API_GetGoodsName(GoodsID)..'') then
		local Tab = SpringFestival_StatusTab[GoodsID]
		local StatusID = Tab[math.random(table.getn(Tab))]
		API_ActorAddStatus(ActorID, StatusID, 600000)
		API_ActorSendMsg(ActorID,10,'你狼吞虎咽的吃了'..Tips..''..API_GetGoodsName(GoodsID)..'，获得'..Name..'活力')
	end
	return 1
end

-- 88944	夏日海滩入场券
-- 88945	西瓜

--存地图内已获得特殊奖励的玩家
if SummerBeachTickets_Player == nil then
	SummerBeachTickets_Player = {}
end

--特殊奖励CD数量表
SummerBeachTickets_CDTime = {
	[1] = {
		NumKey = 66,
		CDKey = 67,
		Award = {40404,40406,40408,40304,40306,40308,40324,40326,40328,40344,40346,40348,},
		Time = {
			[0] = {MaxNum=15,CDmin=15,CDmax=20,},
			[1] = {MaxNum=1,CDmin=50,CDmax=60,},
			[2] = {MaxNum=1,CDmin=50,CDmax=60,},
			[3] = {MaxNum=1,CDmin=50,CDmax=60,},
			[4] = {MaxNum=1,CDmin=50,CDmax=60,},
			[5] = {MaxNum=1,CDmin=50,CDmax=60,},
			[6] = {MaxNum=1,CDmin=50,CDmax=60,},
			[7] = {MaxNum=1,CDmin=50,CDmax=60,},
			[8] = {MaxNum=2,CDmin=50,CDmax=60,},
			[9] = {MaxNum=2,CDmin=50,CDmax=60,},
			[10] = {MaxNum=2,CDmin=30,CDmax=40,},
			[11] = {MaxNum=2,CDmin=30,CDmax=40,},
			[12] = {MaxNum=2,CDmin=30,CDmax=40,},
			[13] = {MaxNum=4,CDmin=7,CDmax=15,},
			[14] = {MaxNum=4,CDmin=7,CDmax=15,},
			[15] = {MaxNum=4,CDmin=7,CDmax=15,},
			[16] = {MaxNum=8,CDmin=2,CDmax=15,},
			[17] = {MaxNum=8,CDmin=3,CDmax=15,},
			[18] = {MaxNum=8,CDmin=5,CDmax=15,},
			[19] = {MaxNum=12,CDmin=3,CDmax=10,},
			[20] = {MaxNum=12,CDmin=4,CDmax=10,},
			[21] = {MaxNum=12,CDmin=5,CDmax=10,},
			[22] = {MaxNum=15,CDmin=15,CDmax=20,},
			[23] = {MaxNum=15,CDmin=15,CDmax=20,},
			},
		},
	[2] = {
		NumKey = 68,
		CDKey = 69,
		Award = {31215,31216,31217,31218,31219,31220,31221,31222,31223,31224,31225,31226,31227,31228,},
		Time = {
			[0] = {MaxNum=30,CDmin=15,CDmax=20,},
			[1] = {MaxNum=2,CDmin=50,CDmax=60,},
			[2] = {MaxNum=2,CDmin=50,CDmax=60,},
			[3] = {MaxNum=2,CDmin=50,CDmax=60,},
			[4] = {MaxNum=2,CDmin=50,CDmax=60,},
			[5] = {MaxNum=2,CDmin=50,CDmax=60,},
			[6] = {MaxNum=2,CDmin=50,CDmax=60,},
			[7] = {MaxNum=2,CDmin=50,CDmax=60,},
			[8] = {MaxNum=4,CDmin=50,CDmax=60,},
			[9] = {MaxNum=4,CDmin=50,CDmax=60,},
			[10] = {MaxNum=4,CDmin=30,CDmax=40,},
			[11] = {MaxNum=4,CDmin=30,CDmax=40,},
			[12] = {MaxNum=4,CDmin=30,CDmax=40,},
			[13] = {MaxNum=8,CDmin=7,CDmax=15,},
			[14] = {MaxNum=8,CDmin=7,CDmax=15,},
			[15] = {MaxNum=8,CDmin=7,CDmax=15,},
			[16] = {MaxNum=16,CDmin=2,CDmax=15,},
			[17] = {MaxNum=16,CDmin=3,CDmax=15,},
			[18] = {MaxNum=16,CDmin=5,CDmax=15,},
			[19] = {MaxNum=24,CDmin=3,CDmax=10,},
			[20] = {MaxNum=24,CDmin=4,CDmax=10,},
			[21] = {MaxNum=24,CDmin=5,CDmax=10,},
			[22] = {MaxNum=30,CDmin=15,CDmax=20,},
			[23] = {MaxNum=30,CDmin=15,CDmax=20,},
			},
		},
	[3] = {
		NumKey = 70,
		CDKey = 71,
		Award = {11287,11288,11283,11284,11541,11542,11543},
		Time = {
			[0] = {MaxNum=5,CDmin=50,CDmax=60,},
			[13] = {MaxNum=1,CDmin=50,CDmax=60,},
			[14] = {MaxNum=1,CDmin=50,CDmax=60,},
			[15] = {MaxNum=1,CDmin=50,CDmax=60,},
			[16] = {MaxNum=2,CDmin=50,CDmax=60,},
			[17] = {MaxNum=2,CDmin=50,CDmax=60,},
			[18] = {MaxNum=2,CDmin=50,CDmax=60,},
			[19] = {MaxNum=4,CDmin=35,CDmax=45,},
			[20] = {MaxNum=4,CDmin=35,CDmax=45,},
			[21] = {MaxNum=4,CDmin=35,CDmax=45,},
			[22] = {MaxNum=5,CDmin=50,CDmax=60,},
			[23] = {MaxNum=5,CDmin=50,CDmax=60,},
			},
		},
}
--怪物掉基本奖励概率
SummerBeachTickets_DropProbability = {
	[730007] = {
			{GoodsID=80696,GoodsNum=1,GaiLv=60000,PinZhi=0},
			{GoodsID=88945,GoodsNum=1,GaiLv=30000,PinZhi=0},
		},
	[730008] = {
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88945,GoodsNum=1,GaiLv=200000,PinZhi=0},
			{GoodsID=88945,GoodsNum=1,GaiLv=200000,PinZhi=0},
			{GoodsID=88945,GoodsNum=1,GaiLv=200000,PinZhi=0},
		},
}
--特殊奖励价值表
SummerBeachTickets_BasicAward = {
	--{GoodsID = 	80274	,Point = 	40	,},
	{GoodsID = 	88945	,Point = 	50	,},
	{GoodsID = 	250	,Point = 	20	,},
	{GoodsID = 	80394	,Point = 	200	,},
	{GoodsID = 	119	,Point = 	18	,},
	{GoodsID = 	208	,Point = 	18	,},
	{GoodsID = 	80686	,Point = 	200	,},
	{GoodsID = 	311	,Point = 	22	,},
	{GoodsID = 	317	,Point = 	44	,},
	{GoodsID = 	958	,Point = 	200	,},
	{GoodsID = 	590	,Point = 	400	,},
	{GoodsID = 	80621	,Point = 	100	,},
	{GoodsID=	89188	,Point =	100	}, --鲜花
}

--夏日海滩入场券使用
function SummerBeachTickets_Use(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove,High,Low)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID) 
	local MapConfigID = API_GetMapConfigID(MapID) 
	local StaticMapID = API_GetStaticMapID(MapID)
	if MapConfigID == 130 then
		API_ActorSendMsg(ActorID,3,'本地图内无法使用该道具')
		return 0
	end
	API_ResponseWrite('<name></name>')
	if MapID == StaticMapID then
		API_ResponseWrite('<br><text>进入夏日海滩消灭西瓜强盗可以获得大量经验与西瓜（使用后能随机获得一种状态，维持10分钟）！还能额外获得宝物！！</text><br><text color="255,0,255">（组队进入能额外加成经验，每多组一名队友将额外加成5%的经验，推荐玩家组队进入！进入后每人消耗一张夏日海滩入场券，没有该物品的角色将无法进入。）</text><br>') 
		API_ResponseWrite('<br><br><a href="SummerBeachTickets_Click">我要进入</a><br>')
		API_ResponseWrite('<br><a>关闭</a>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_ResponseWrite('<br><text>夏日海滩入场券使用失败！亲爱的玩家，此卷轴只可以在浮空岛以外地图打开。</text><br>') 
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end
end
--夏日海滩入场券点击
function SummerBeachTickets_Click()
	local ActorID = API_RequestGetActorID() 
	local GoodsID = 88944
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 
	end
	if MysteriousPlace_InJudge(ActorID,GoodsID) == 1 then
		local ObjectMapID = API_CreateEctype(2025,0)
		if SummerBeachTickets_Player[ObjectMapID] ~= nil then
			SummerBeachTickets_Player[ObjectMapID] = nil
		end
		SummerBeachTickets_Player[ObjectMapID] = {}
		--刷出去的门
		API_CreateMonster(ObjectMapID,11607,86,59,3,0,-1)
		--设置这个副本将会掉落多少点券的道具
		API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.BaoZhengJin,math.random(100,500))
		--传送进副本
		API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'SummerBeachTickets_PlayGotoMap')
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 1
		if GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] + 1
		end
	end
end
function SummerBeachTickets_PlayGotoMap(ObjectMapID,ActorID)
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	local GoodsID = 88944
	if API_ActorIsOnline(ActorID) then
		local MapID = API_GetActorMapID(ActorID)
		local MapConfigID = API_GetMapConfigID(MapID)
		--判断组队
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 and API_GetTeamLeader(TeamID) == ActorID then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID and not API_ActorIsDying(TeamActorID) then
					if API_ActorGetGoodsNum(TeamActorID,GoodsID) > 0 and API_ActorRemoveGoods(TeamActorID,GoodsID,1,'使用夏日海滩入场券') then
						API_ActorGoToMap(TeamActorID,ObjectMapID,83,59)
						API_OpenArrowDir(TeamActorID,30,67,30)
						local LaiYuan = API_ActorGetPropNum(TeamActorID,201)
						local Type = 2
						if GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] + 1
						end
					end
				end
			end
		else
			if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用夏日海滩入场券') then
				API_ActorGoToMap(ActorID,ObjectMapID,83,59)
				API_OpenArrowDir(ActorID,30,67,30)
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 2
				if GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] + 1
				end
			end
		end
		--刷怪触发器
		local PlayLv = API_GetActorExpLevel(ActorID)
		local TimeF = 30
		if PlayLv > 40 then
			TimeF = 20
		end
		API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'SummerBeachTickets_CreateMon')
		API_CreateTimerTriggerG(ObjectMapID,ActorID,TimeF,4,'SummerBeachTickets_CreateMon')
	end
end
--夏日海滩刷怪和时间触发器
function SummerBeachTickets_CreateMon(ObjectMapID,ActorID)
	local TimerTriggerID = API_GetCurTriggerID()
	if not API_MapIsValid(ObjectMapID) then
		API_DestroyTriggerG(TimerTriggerID)
		return
	end
	local CountDown = API_GetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.CountDown)
	CountDown = CountDown + 1
	API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.CountDown,CountDown)
	if CountDown > 5 then
		API_DestroyTriggerG(TimerTriggerID)
		return
	end
	local CountDownCN = PublicFun_ArabianNumberToChineseNumber(CountDown)
	local Info = '第'..CountDownCN..'波西瓜强盗出现'
	if CountDown == 5 then
		Info = '最后一波西瓜强盗出现'
	end
	API_ActorBroadcastMsg(ObjectMapID,4,Info)
	--刷怪，共5波
	--boss坐标30,67，小怪xy范围50,42 72,78，死亡触发器
	local BossFastID = API_CreateMonster(ObjectMapID,730008,30,67,3,0,-1)
	API_CreateDieTriggerG(ActorID,0,0,BossFastID,'SummerBeachTickets_MonDieFunc')
	local x1,y1,x2,y2 = 50,42,72,78
	for i = 1,20 do 
		local x,y,Num = 0,0,0
		repeat
			Num = Num + 1
			x = math.random(x1,x2)
			y = math.random(y1,y2)
		until not API_IsBlockTile(ObjectMapID,x,y,0) or Num == 100
		if not API_IsBlockTile(ObjectMapID,x,y,0) then
			local FastID = API_CreateMonster(ObjectMapID,730007,x,y,3,0,-1)
			API_CreateDieTriggerG(ActorID,0,0,FastID,'SummerBeachTickets_MonDieFunc')
		end
	end
end

function SummerBeachTickets_MonDieFunc(ActorID,b,Type,FastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY)
	if not API_MapIsValid(MapID) then
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local Time = os.time() 
	--当前地图内人数
	local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
	local PlayNum = 1
	if PlayList ~= nil then
		PlayNum = table.getn(PlayList)
	end
	--根据当前地图内玩家算出总经验量
	local MapExp = 0
	for j,v in PlayList do
		local PlayLv = API_GetActorExpLevel(v)
		if PlayLv < 25 then
			PlayLv = 25
		elseif PlayLv < 40 then
			PlayLv = 40
		elseif PlayLv < 55 then
			PlayLv = 55
		end
		if PlayLv > 55 then
			PlayLv = 55
		end
		local PlayExp = MapRandomEvent_EventJiangLiTable[PlayLv].GX * 25
		MapExp = MapExp + PlayExp
	end
	MapExp = MapExp + MapExp * ((PlayNum-1) * 0.05)
	--每个怪物应该掉多少经验
	local MonExp = math.floor(MapExp/100)
	--经验折合成多少个经验兑换券
	local ExpGoodsNum = math.floor(MonExp/100)
	if ExpGoodsNum > 0 then
		--for i = 1,ExpGoodsNum do
		--	if math.random(100) < 80 then
				API_CreateDropGoods(MapID,PosX,PosY,80498,ExpGoodsNum,0,'夏日海滩掉经验奖励',4,0,900,600)
		--	end
		--end
	end
	--掉落基本奖励 经验、水晶币、金币等
	if SummerBeachTickets_DropProbability[MonsterID] ~= nil then
		local Table = SummerBeachTickets_DropProbability[MonsterID]
		for j in Table do
			local GaiLv = math.random(1000000)
			local GoodsID = Table[j].GoodsID
			local GoodsNum = Table[j].GoodsNum
			local GoodsGaiLv = Table[j].GaiLv
			if GaiLv <= GoodsGaiLv then
				API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,'夏日海滩掉普通奖励',4,0,900,600)
				if GoodsID == 88945 then
					local LaiYuan = API_ActorGetPropNum(KillerID,201)
					local Type = 3
					if GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] = GoodsNum
					else
						GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] + GoodsNum
					end
				end
			end
		end
	end
	--还有多少点券的保底奖励可以掉
	local PointGoods = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.BaoZhengJin)
	--保底奖励掉落
	if PointGoods > 0 then
		local AwardNum = math.random(table.getn(SummerBeachTickets_BasicAward))
		local AwardGoodsID = SummerBeachTickets_BasicAward[AwardNum].GoodsID
		local AwardPoint = SummerBeachTickets_BasicAward[AwardNum].Point
		if AwardPoint <= PointGoods then
			PointGoods = PointGoods - AwardPoint
			API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.BaoZhengJin,PointGoods)
			API_CreateDropGoods(MapID,PosX,PosY,AwardGoodsID,1,0,'夏日海滩掉保底奖励',4,0,900,600)
			local LaiYuan = API_ActorGetPropNum(KillerID,201)
			local Type = 4
			if GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] = AwardPoint
			else
				GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] + AwardPoint
			end
		end
	end
	--小头目掉特殊奖励
	if MonsterID == 730008 then
		API_ActorCallBack(MapID,0,-1,'SummerBeachTickets_ActorCallBack')
	end
end
--地图每个玩家回调，用于给特殊奖励
function SummerBeachTickets_ActorCallBack(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if MapConfigID ~= 2025 then
		return
	end
	if SummerBeachTickets_Player[MapID] == nil or SummerBeachTickets_Player[MapID][ActorID] ~= nil then
		return
	end
	local ActorName = API_GetActorName(ActorID)
	local x,y = PublicFun_GetActorPosXY(ActorID) 
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local Time = os.time() 
	local CountDown = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.CountDown)
	local DeathNum = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.DeathNum)
	DeathNum = DeathNum + 1
	API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.DeathNum,DeathNum)
	--掉爱慕之心
	--if Month == 8 and (Day >= 17 and Day < 31) then
	local nShiFouStart = API_DiffDatatime(HL_PeiHeHuoDong_StartTime.Year,HL_PeiHeHuoDong_StartTime.Month,HL_PeiHeHuoDong_StartTime.Day,HL_PeiHeHuoDong_StartTime.Hour,HL_PeiHeHuoDong_StartTime.Minute,HL_PeiHeHuoDong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(HL_PeiHeHuoDong__EndTime.Year,HL_PeiHeHuoDong__EndTime.Month,HL_PeiHeHuoDong__EndTime.Day,HL_PeiHeHuoDong__EndTime.Hour,HL_PeiHeHuoDong__EndTime.Minute,HL_PeiHeHuoDong__EndTime.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then										
	
		local a = math.random(100)
		if a > 50 then
			API_CreateDropGoods(MapID,x,y,89188,1,0,'夏日海滩掉鲜花',0,ActorID,900,600)
		end
	end
	local GL = math.random(100) 
	if GL <= 4 * DeathNum then --每一关有5%的概率，5管最高5*5=25
		local TypeGaiLv = math.random(100)
		local Type = 2 --奖励类别
		if TypeGaiLv <= 45 then
			Type = 1
		elseif TypeGaiLv > 90 then
			Type = 3
		end
		local Table = SummerBeachTickets_CDTime[Type]
		local NumKey = Table.NumKey
		local CDKey = Table.CDKey
		local Award = Table.Award
		local TimeTab = Table.Time
		if TimeTab[Hour] ~= nil then
			local MaxNum = TimeTab[Hour].MaxNum
			local CDmin = TimeTab[Hour].CDmin
			local CDmax = TimeTab[Hour].CDmax
			local NowNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, NumKey)
			local CDtime = API_VarDataGetNumber_Ex(1, 0, -2000, 1, CDKey)
			if Time >= CDtime and NowNum < MaxNum then
				SummerBeachTickets_Player[MapID][ActorID] = 1
				NowNum = NowNum + 1
				API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, NumKey, NowNum)
				local LastTime = Time + math.random(CDmin,CDmax) * 60
				API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, CDKey, LastTime)
				local AwardGoodsID = Award[math.random(table.getn(Award))]
				API_CreateDropGoods(MapID,x,y,AwardGoodsID,1,0,'夏日海滩掉特殊奖励',0,ActorID,900,600)
				if not API_IsBattleGameServer() then
					API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'击杀了夏日海滩的BOSS“西瓜强盗小头目”，获得了：'..API_GetGoodsName(AwardGoodsID)..'！')
				end
				local LSTab = {67,69,71,}
				for j in LSTab do
					local CDKey2 = LSTab[j]
					if CDKey2 ~= CDKey then
						local OtherTime = API_VarDataGetNumber_Ex(1, 0, -2000, 1, CDKey2)
						if OtherTime - Time <= 200 then
							OtherTime = Time + (math.random(4,10) * 60)
							API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, CDKey2, OtherTime)
						end
					end
				end
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type2 = Type + 4
				if GLOBAL_FengXiangBiao_DateList[55][Type2][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[55][Type2][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[55][Type2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[55][Type2][LaiYuan] + 1
				end
			end
		end
	end
	if DeathNum >= 5 then
		API_ActorSendMsg(ActorID, 4, '西瓜强盗头目已经消灭，可以从入口出去了')
	end
	if Hour >= 12 and math.random(100) == 1 then
		local NowNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 72)
		local CDtime = API_VarDataGetNumber_Ex(1, 0, -2000, 1, 73)
		if Time >= CDtime and NowNum < 4 then
			SummerBeachTickets_Player[MapID][ActorID] = 1
			NowNum = NowNum + 1
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 72, NowNum)
			CDtime = Time + math.random(40,90) * 60
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 73, CDtime)
			API_CreateDropGoods(MapID,x,y,88950,1,0,'夏日海滩掉称号',0,ActorID,900,600)
			if not API_IsBattleGameServer() then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..ActorName..'击杀了夏日海滩的BOSS“西瓜强盗小头目”，获得炫酷称号：'..API_GetGoodsName(88950)..'！')
			end
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type = 8
			if GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[55][Type][LaiYuan] + 1
			end
		end
	end
end
--WYL_AnniversaryChestCBFunc
--WYL_AnniversaryChestGoodsTable
--奖励表
WYL_AnniversaryChestCBFunc = {
	[89065] = {
		[1] = {
			{GoodsID=80383,GaiLv1=1,GaiLv2=713290,NumMax=1,NumMin=1},
			{GoodsID=80381,GaiLv1=713291,GaiLv2=1188817,NumMax=1,NumMin=1},
			{GoodsID=80397,GaiLv1=1188818,GaiLv2=1545463,NumMax=1,NumMin=1},
			{GoodsID=89042,GaiLv1=1545464,GaiLv2=1581128,NumMax=1,NumMin=1},
			{GoodsID=89040,GaiLv1=1581129,GaiLv2=1616793,NumMax=1,NumMin=1},
			{GoodsID=89041,GaiLv1=1616794,GaiLv2=1652458,NumMax=1,NumMin=1},
			{GoodsID=80394,GaiLv1=1652459,GaiLv2=1795117,NumMax=1,NumMin=1},
			{GoodsID=40003,GaiLv1=1795118,GaiLv2=1973440,NumMax=1,NumMin=1},
			{GoodsID=40013,GaiLv1=1973441,GaiLv2=2151763,NumMax=1,NumMin=1},
			{GoodsID=40023,GaiLv1=2151764,GaiLv2=2330086,NumMax=1,NumMin=1},
			{GoodsID=40093,GaiLv1=2330087,GaiLv2=2508409,NumMax=1,NumMin=1},
			{GoodsID=80181,GaiLv1=2508410,GaiLv2=3221700,NumMax=1,NumMin=1},
			{GoodsID=80191,GaiLv1=3221701,GaiLv2=3934991,NumMax=1,NumMin=1},
			{GoodsID=117,GaiLv1=3934992,GaiLv2=4291637,NumMax=5,NumMin=1},
			{GoodsID=206,GaiLv1=4291638,GaiLv2=4648283,NumMax=5,NumMin=1},
			{GoodsID=118,GaiLv1=4648284,GaiLv2=5004929,NumMax=5,NumMin=1},
			{GoodsID=207,GaiLv1=5004930,GaiLv2=5361575,NumMax=5,NumMin=1},
			{GoodsID=845,GaiLv1=5361576,GaiLv2=5718221,NumMax=1,NumMin=1},
			{GoodsID=968,GaiLv1=5718222,GaiLv2=5789551,NumMax=1,NumMin=1},
			{GoodsID=904,GaiLv1=5789552,GaiLv2=5932210,NumMax=1,NumMin=1},
			{GoodsID=88080,GaiLv1=5932211,GaiLv2=6074869,NumMax=1,NumMin=1},
			{GoodsID=10984,GaiLv1=6074870,GaiLv2=6089135,NumMax=1,NumMin=1},
			{GoodsID=10985,GaiLv1=6089136,GaiLv2=6103401,NumMax=1,NumMin=1},
			{GoodsID=80234,GaiLv1=6103402,GaiLv2=6198507,NumMax=1,NumMin=1},
			{GoodsID=80276,GaiLv1=6198508,GaiLv2=6293613,NumMax=1,NumMin=1},
			{GoodsID=80281,GaiLv1=6293614,GaiLv2=6578930,NumMax=1,NumMin=1},
			{GoodsID=89056,GaiLv1=6578931,GaiLv2=6586063,NumMax=1,NumMin=1},
			{GoodsID=89059,GaiLv1=6586064,GaiLv2=6600329,NumMax=1,NumMin=1},
			{GoodsID=0,GaiLv1=6600330,GaiLv2=6628861,NumMax=1,NumMin=1},
			{GoodsID=39507,GaiLv1=6628862,GaiLv2=6636787,NumMax=1,NumMin=1},
			{GoodsID=39508,GaiLv1=6636788,GaiLv2=6644713,NumMax=1,NumMin=1},
			{GoodsID=39509,GaiLv1=6644714,GaiLv2=6652639,NumMax=1,NumMin=1},
			{GoodsID=39512,GaiLv1=6652640,GaiLv2=6659124,NumMax=1,NumMin=1},
			{GoodsID=39509,GaiLv1=6659125,GaiLv2=6667050,NumMax=1,NumMin=1},
			{GoodsID=76,GaiLv1=6667051,GaiLv2=6702715,NumMax=1,NumMin=1},
			{GoodsID=80686,GaiLv1=6702716,GaiLv2=6845374,NumMax=1,NumMin=1},
			{GoodsID=80689,GaiLv1=6845375,GaiLv2=6988033,NumMax=1,NumMin=1},
			{GoodsID=31101,GaiLv1=6988034,GaiLv2=7059363,NumMax=1,NumMin=1},
			{GoodsID=75,GaiLv1=7059364,GaiLv2=7202022,NumMax=1,NumMin=1},
			{GoodsID=39511,GaiLv1=7202023,GaiLv2=7216288,NumMax=1,NumMin=1},
			{GoodsID=39514,GaiLv1=7216289,GaiLv2=7230554,NumMax=1,NumMin=1},
			{GoodsID=39504,GaiLv1=7230555,GaiLv2=7244820,NumMax=1,NumMin=1},
			{GoodsID=39505,GaiLv1=7244821,GaiLv2=7259086,NumMax=1,NumMin=1},
			{GoodsID=39506,GaiLv1=7259087,GaiLv2=7273352,NumMax=1,NumMin=1},
			{GoodsID=11102,GaiLv1=7273353,GaiLv2=7287618,NumMax=1,NumMin=1},
			{GoodsID=11103,GaiLv1=7287619,GaiLv2=7297129,NumMax=1,NumMin=1},
			{GoodsID=11030,GaiLv1=7297130,GaiLv2=7311395,NumMax=1,NumMin=1},
			{GoodsID=11031,GaiLv1=7311396,GaiLv2=7320906,NumMax=1,NumMin=1},
			{GoodsID=11032,GaiLv1=7320907,GaiLv2=7330417,NumMax=1,NumMin=1},
			{GoodsID=11033,GaiLv1=7330418,GaiLv2=7337550,NumMax=1,NumMin=1},
			{GoodsID=40204,GaiLv1=7337551,GaiLv2=7385103,NumMax=1,NumMin=1},
			{GoodsID=40220,GaiLv1=7385104,GaiLv2=7432656,NumMax=1,NumMin=1},
			{GoodsID=40236,GaiLv1=7432657,GaiLv2=7480209,NumMax=1,NumMin=1},
			{GoodsID=591,GaiLv1=7480210,GaiLv2=7551539,NumMax=1,NumMin=1},
			{GoodsID=88172,GaiLv1=7551540,GaiLv2=7580071,NumMax=1,NumMin=1},
			{GoodsID=82030,GaiLv1=7580072,GaiLv2=8293362,NumMax=6,NumMin=2},
			{GoodsID=82031,GaiLv1=8293363,GaiLv2=8436021,NumMax=1,NumMin=1},
			{GoodsID=11330,GaiLv1=8436022,GaiLv2=8439588,NumMax=1,NumMin=1},
			{GoodsID=11331,GaiLv1=8439589,GaiLv2=8443155,NumMax=1,NumMin=1},
			{GoodsID=11332,GaiLv1=8443156,GaiLv2=8446722,NumMax=1,NumMin=1},
			{GoodsID=11333,GaiLv1=8446723,GaiLv2=8450289,NumMax=1,NumMin=1},
			{GoodsID=310,GaiLv1=8450290,GaiLv2=9163580,NumMax=1,NumMin=1},
			{GoodsID=31042,GaiLv1=9163581,GaiLv2=9165007,NumMax=1,NumMin=1},
			{GoodsID=31032,GaiLv1=9165008,GaiLv2=9172140,NumMax=1,NumMin=1},
			{GoodsID=31033,GaiLv1=9172141,GaiLv2=9179273,NumMax=1,NumMin=1},
			{GoodsID=31040,GaiLv1=9179274,GaiLv2=9184029,NumMax=1,NumMin=1},
			{GoodsID=11334,GaiLv1=9184030,GaiLv2=9186883,NumMax=1,NumMin=1},
			{GoodsID=88044,GaiLv1=9186884,GaiLv2=9215415,NumMax=1,NumMin=1},
			{GoodsID=88171,GaiLv1=9215416,GaiLv2=9286745,NumMax=1,NumMin=1},
			{GoodsID=80274,GaiLv1=9286746,GaiLv2=10000000,NumMax=1,NumMin=1},
		},
		[2] = {
			{GoodsID=80384,GaiLv1=1,GaiLv2=666273,NumMax=1,NumMin=1},
			{GoodsID=80382,GaiLv1=666274,GaiLv2=1110456,NumMax=1,NumMin=1},
			{GoodsID=80181,GaiLv1=1110457,GaiLv2=1443593,NumMax=1,NumMin=1},
			{GoodsID=80192,GaiLv1=1443594,GaiLv2=1776730,NumMax=1,NumMin=1},
			{GoodsID=118,GaiLv1=1776731,GaiLv2=1998822,NumMax=5,NumMin=1},
			{GoodsID=207,GaiLv1=1998823,GaiLv2=2220914,NumMax=5,NumMin=1},
			{GoodsID=119,GaiLv1=2220915,GaiLv2=2443006,NumMax=5,NumMin=1},
			{GoodsID=208,GaiLv1=2443007,GaiLv2=2665098,NumMax=5,NumMin=1},
			{GoodsID=845,GaiLv1=2665099,GaiLv2=3331372,NumMax=1,NumMin=1},
			{GoodsID=968,GaiLv1=3331373,GaiLv2=3398000,NumMax=1,NumMin=1},
			{GoodsID=904,GaiLv1=3398001,GaiLv2=3531255,NumMax=1,NumMin=1},
			{GoodsID=88080,GaiLv1=3531256,GaiLv2=3664510,NumMax=1,NumMin=1},
			{GoodsID=10984,GaiLv1=3664511,GaiLv2=3677836,NumMax=1,NumMin=1},
			{GoodsID=10985,GaiLv1=3677837,GaiLv2=3691162,NumMax=1,NumMin=1},
			{GoodsID=80235,GaiLv1=3691163,GaiLv2=3710199,NumMax=1,NumMin=1},
			{GoodsID=80277,GaiLv1=3710200,GaiLv2=3729236,NumMax=1,NumMin=1},
			{GoodsID=80282,GaiLv1=3729237,GaiLv2=3773655,NumMax=1,NumMin=1},
			{GoodsID=80624,GaiLv1=3773656,GaiLv2=3964019,NumMax=1,NumMin=1},
			{GoodsID=80625,GaiLv1=3964020,GaiLv2=4154383,NumMax=1,NumMin=1},
			{GoodsID=80626,GaiLv1=4154384,GaiLv2=4344747,NumMax=1,NumMin=1},
			{GoodsID=80628,GaiLv1=4344748,GaiLv2=4535111,NumMax=1,NumMin=1},
			{GoodsID=80629,GaiLv1=4535112,GaiLv2=4725475,NumMax=1,NumMin=1},
			{GoodsID=89057,GaiLv1=4725476,GaiLv2=4731533,NumMax=1,NumMin=1},
			{GoodsID=89060,GaiLv1=4731534,GaiLv2=4743648,NumMax=1,NumMin=1},
			{GoodsID=0,GaiLv1=4743649,GaiLv2=4770299,NumMax=1,NumMin=1},
			{GoodsID=39507,GaiLv1=4770300,GaiLv2=4777703,NumMax=1,NumMin=1},
			{GoodsID=39508,GaiLv1=4777704,GaiLv2=4785107,NumMax=1,NumMin=1},
			{GoodsID=39509,GaiLv1=4785108,GaiLv2=4792511,NumMax=1,NumMin=1},
			{GoodsID=39512,GaiLv1=4792512,GaiLv2=4798569,NumMax=1,NumMin=1},
			{GoodsID=39509,GaiLv1=4798570,GaiLv2=4805973,NumMax=1,NumMin=1},
			{GoodsID=76,GaiLv1=4805974,GaiLv2=4839287,NumMax=1,NumMin=1},
			{GoodsID=40004,GaiLv1=4839288,GaiLv2=4928124,NumMax=1,NumMin=1},
			{GoodsID=40014,GaiLv1=4928125,GaiLv2=5016961,NumMax=1,NumMin=1},
			{GoodsID=40024,GaiLv1=5016962,GaiLv2=5105798,NumMax=1,NumMin=1},
			{GoodsID=40094,GaiLv1=5105799,GaiLv2=5194635,NumMax=1,NumMin=1},
			{GoodsID=89042,GaiLv1=5194636,GaiLv2=5227949,NumMax=1,NumMin=1},
			{GoodsID=89040,GaiLv1=5227950,GaiLv2=5261263,NumMax=1,NumMin=1},
			{GoodsID=89041,GaiLv1=5261264,GaiLv2=5294577,NumMax=1,NumMin=1},
			{GoodsID=250,GaiLv1=5294578,GaiLv2=5561087,NumMax=1,NumMin=1},
			{GoodsID=80397,GaiLv1=5561088,GaiLv2=5894224,NumMax=1,NumMin=1},
			{GoodsID=75,GaiLv1=5894225,GaiLv2=6027479,NumMax=1,NumMin=1},
			{GoodsID=80394,GaiLv1=6027480,GaiLv2=6160734,NumMax=1,NumMin=1},
			{GoodsID=80686,GaiLv1=6160735,GaiLv2=6293989,NumMax=1,NumMin=1},
			{GoodsID=80689,GaiLv1=6293990,GaiLv2=6427244,NumMax=1,NumMin=1},
			{GoodsID=32015,GaiLv1=6427245,GaiLv2=6429910,NumMax=1,NumMin=1},
			{GoodsID=39511,GaiLv1=6429911,GaiLv2=6443236,NumMax=1,NumMin=1},
			{GoodsID=39514,GaiLv1=6443237,GaiLv2=6456562,NumMax=1,NumMin=1},
			{GoodsID=39504,GaiLv1=6456563,GaiLv2=6469888,NumMax=1,NumMin=1},
			{GoodsID=39505,GaiLv1=6469889,GaiLv2=6483214,NumMax=1,NumMin=1},
			{GoodsID=39506,GaiLv1=6483215,GaiLv2=6496540,NumMax=1,NumMin=1},
			{GoodsID=88908,GaiLv1=6496541,GaiLv2=6629795,NumMax=8,NumMin=3},
			{GoodsID=32016,GaiLv1=6629796,GaiLv2=6632016,NumMax=1,NumMin=1},
			{GoodsID=11330,GaiLv1=6632017,GaiLv2=6635348,NumMax=1,NumMin=1},
			{GoodsID=11331,GaiLv1=6635349,GaiLv2=6638680,NumMax=1,NumMin=1},
			{GoodsID=11332,GaiLv1=6638681,GaiLv2=6642012,NumMax=1,NumMin=1},
			{GoodsID=11333,GaiLv1=6642013,GaiLv2=6645344,NumMax=1,NumMin=1},
			{GoodsID=11102,GaiLv1=6645345,GaiLv2=6658670,NumMax=1,NumMin=1},
			{GoodsID=11103,GaiLv1=6658671,GaiLv2=6667554,NumMax=1,NumMin=1},
			{GoodsID=11030,GaiLv1=6667555,GaiLv2=6680880,NumMax=1,NumMin=1},
			{GoodsID=11031,GaiLv1=6680881,GaiLv2=6689764,NumMax=1,NumMin=1},
			{GoodsID=11032,GaiLv1=6689765,GaiLv2=6698648,NumMax=1,NumMin=1},
			{GoodsID=11033,GaiLv1=6698649,GaiLv2=6705311,NumMax=1,NumMin=1},
			{GoodsID=39701,GaiLv1=6705312,GaiLv2=6721968,NumMax=1,NumMin=1},
			{GoodsID=39703,GaiLv1=6721969,GaiLv2=6738625,NumMax=1,NumMin=1},
			{GoodsID=39704,GaiLv1=6738626,GaiLv2=6755282,NumMax=1,NumMin=1},
			{GoodsID=39705,GaiLv1=6755283,GaiLv2=6771939,NumMax=1,NumMin=1},
			{GoodsID=39706,GaiLv1=6771940,GaiLv2=6788596,NumMax=1,NumMin=1},
			{GoodsID=40206,GaiLv1=6788597,GaiLv2=6815247,NumMax=1,NumMin=1},
			{GoodsID=40222,GaiLv1=6815248,GaiLv2=6841898,NumMax=1,NumMin=1},
			{GoodsID=40238,GaiLv1=6841899,GaiLv2=6868549,NumMax=1,NumMin=1},
			{GoodsID=591,GaiLv1=6868550,GaiLv2=6935177,NumMax=1,NumMin=1},
			{GoodsID=88101,GaiLv1=6935178,GaiLv2=6945838,NumMax=1,NumMin=1},
			{GoodsID=88102,GaiLv1=6945839,GaiLv2=6956499,NumMax=1,NumMin=1},
			{GoodsID=88103,GaiLv1=6956500,GaiLv2=6967160,NumMax=1,NumMin=1},
			{GoodsID=88104,GaiLv1=6967161,GaiLv2=6977821,NumMax=1,NumMin=1},
			{GoodsID=88105,GaiLv1=6977822,GaiLv2=6988482,NumMax=1,NumMin=1},
			{GoodsID=88106,GaiLv1=6988483,GaiLv2=6999143,NumMax=1,NumMin=1},
			{GoodsID=88107,GaiLv1=6999144,GaiLv2=7009804,NumMax=1,NumMin=1},
			{GoodsID=88108,GaiLv1=7009805,GaiLv2=7020465,NumMax=1,NumMin=1},
			{GoodsID=88109,GaiLv1=7020466,GaiLv2=7031126,NumMax=1,NumMin=1},
			{GoodsID=88110,GaiLv1=7031127,GaiLv2=7041787,NumMax=1,NumMin=1},
			{GoodsID=88111,GaiLv1=7041788,GaiLv2=7052448,NumMax=1,NumMin=1},
			{GoodsID=88112,GaiLv1=7052449,GaiLv2=7063109,NumMax=1,NumMin=1},
			{GoodsID=88113,GaiLv1=7063110,GaiLv2=7073770,NumMax=1,NumMin=1},
			{GoodsID=88114,GaiLv1=7073771,GaiLv2=7084431,NumMax=1,NumMin=1},
			{GoodsID=88115,GaiLv1=7084432,GaiLv2=7095092,NumMax=1,NumMin=1},
			{GoodsID=88116,GaiLv1=7095093,GaiLv2=7105753,NumMax=1,NumMin=1},
			{GoodsID=88117,GaiLv1=7105754,GaiLv2=7116414,NumMax=1,NumMin=1},
			{GoodsID=88118,GaiLv1=7116415,GaiLv2=7127075,NumMax=1,NumMin=1},
			{GoodsID=88119,GaiLv1=7127076,GaiLv2=7137736,NumMax=1,NumMin=1},
			{GoodsID=88120,GaiLv1=7137737,GaiLv2=7148397,NumMax=1,NumMin=1},
			{GoodsID=88121,GaiLv1=7148398,GaiLv2=7159058,NumMax=1,NumMin=1},
			{GoodsID=88122,GaiLv1=7159059,GaiLv2=7169719,NumMax=1,NumMin=1},
			{GoodsID=88123,GaiLv1=7169720,GaiLv2=7180380,NumMax=1,NumMin=1},
			{GoodsID=88124,GaiLv1=7180381,GaiLv2=7191041,NumMax=1,NumMin=1},
			{GoodsID=88173,GaiLv1=7191042,GaiLv2=7204367,NumMax=1,NumMin=1},
			{GoodsID=82030,GaiLv1=7204368,GaiLv2=7870641,NumMax=6,NumMin=2},
			{GoodsID=82031,GaiLv1=7870642,GaiLv2=8003896,NumMax=1,NumMin=1},
			{GoodsID=38352,GaiLv1=8003897,GaiLv2=8048315,NumMax=1,NumMin=1},
			{GoodsID=38353,GaiLv1=8048316,GaiLv2=8092734,NumMax=1,NumMin=1},
			{GoodsID=38354,GaiLv1=8092735,GaiLv2=8137153,NumMax=1,NumMin=1},
			{GoodsID=38355,GaiLv1=8137154,GaiLv2=8181572,NumMax=1,NumMin=1},
			{GoodsID=38356,GaiLv1=8181573,GaiLv2=8225991,NumMax=1,NumMin=1},
			{GoodsID=38357,GaiLv1=8225992,GaiLv2=8270410,NumMax=1,NumMin=1},
			{GoodsID=38358,GaiLv1=8270411,GaiLv2=8314829,NumMax=1,NumMin=1},
			{GoodsID=38359,GaiLv1=8314830,GaiLv2=8359248,NumMax=1,NumMin=1},
			{GoodsID=38360,GaiLv1=8359249,GaiLv2=8403667,NumMax=1,NumMin=1},
			{GoodsID=32101,GaiLv1=8403668,GaiLv2=8430318,NumMax=1,NumMin=1},
			{GoodsID=31040,GaiLv1=8430319,GaiLv2=8434760,NumMax=1,NumMin=1},
			{GoodsID=11334,GaiLv1=8434761,GaiLv2=8437426,NumMax=1,NumMin=1},
			{GoodsID=88044,GaiLv1=8437427,GaiLv2=8464077,NumMax=1,NumMin=1},
			{GoodsID=31042,GaiLv1=8464078,GaiLv2=8465410,NumMax=1,NumMin=1},
			{GoodsID=31032,GaiLv1=8465411,GaiLv2=8472073,NumMax=1,NumMin=1},
			{GoodsID=31033,GaiLv1=8472074,GaiLv2=8478736,NumMax=1,NumMin=1},
			{GoodsID=311,GaiLv1=8478737,GaiLv2=9145010,NumMax=1,NumMin=1},
			{GoodsID=80274,GaiLv1=9145011,GaiLv2=9811284,NumMax=1,NumMin=1},
			{GoodsID=88171,GaiLv1=9811285,GaiLv2=9866807,NumMax=1,NumMin=1},
			{GoodsID=80951,GaiLv1=9866808,GaiLv2=9955644,NumMax=1,NumMin=1},
			{GoodsID=80387,GaiLv1=9955645,GaiLv2=10000000,NumMax=1,NumMin=1},
		},
		[3] = {
			{GoodsID=80384,GaiLv1=1,GaiLv2=1036280,NumMax=1,NumMin=1},
			{GoodsID=80382,GaiLv1=1036281,GaiLv2=1554421,NumMax=1,NumMin=1},
			{GoodsID=80181,GaiLv1=1554422,GaiLv2=1593282,NumMax=1,NumMin=1},
			{GoodsID=80192,GaiLv1=1593283,GaiLv2=1632143,NumMax=1,NumMin=1},
			{GoodsID=119,GaiLv1=1632144,GaiLv2=1826446,NumMax=5,NumMin=1},
			{GoodsID=208,GaiLv1=1826447,GaiLv2=2020749,NumMax=5,NumMin=1},
			{GoodsID=120,GaiLv1=2020750,GaiLv2=2176192,NumMax=5,NumMin=1},
			{GoodsID=209,GaiLv1=2176193,GaiLv2=2331635,NumMax=5,NumMin=1},
			{GoodsID=845,GaiLv1=2331636,GaiLv2=3108846,NumMax=1,NumMin=1},
			{GoodsID=968,GaiLv1=3108847,GaiLv2=3186568,NumMax=1,NumMin=1},
			{GoodsID=904,GaiLv1=3186569,GaiLv2=3342011,NumMax=1,NumMin=1},
			{GoodsID=88080,GaiLv1=3342012,GaiLv2=3497454,NumMax=1,NumMin=1},
			{GoodsID=0,GaiLv1=3497455,GaiLv2=3528543,NumMax=1,NumMin=1},
			{GoodsID=10984,GaiLv1=3528544,GaiLv2=3544088,NumMax=1,NumMin=1},
			{GoodsID=10985,GaiLv1=3544089,GaiLv2=3559633,NumMax=1,NumMin=1},
			{GoodsID=89058,GaiLv1=3559634,GaiLv2=3565851,NumMax=1,NumMin=1},
			{GoodsID=89061,GaiLv1=3565852,GaiLv2=3578805,NumMax=1,NumMin=1},
			{GoodsID=39507,GaiLv1=3578806,GaiLv2=3587441,NumMax=1,NumMin=1},
			{GoodsID=39508,GaiLv1=3587442,GaiLv2=3596077,NumMax=1,NumMin=1},
			{GoodsID=39509,GaiLv1=3596078,GaiLv2=3604713,NumMax=1,NumMin=1},
			{GoodsID=39512,GaiLv1=3604714,GaiLv2=3611779,NumMax=1,NumMin=1},
			{GoodsID=39509,GaiLv1=3611780,GaiLv2=3620415,NumMax=1,NumMin=1},
			{GoodsID=76,GaiLv1=3620416,GaiLv2=3659276,NumMax=1,NumMin=1},
			{GoodsID=40005,GaiLv1=3659277,GaiLv2=3736998,NumMax=1,NumMin=1},
			{GoodsID=40015,GaiLv1=3736999,GaiLv2=3814720,NumMax=1,NumMin=1},
			{GoodsID=40025,GaiLv1=3814721,GaiLv2=3892442,NumMax=1,NumMin=1},
			{GoodsID=40095,GaiLv1=3892443,GaiLv2=3970164,NumMax=1,NumMin=1},
			{GoodsID=89042,GaiLv1=3970165,GaiLv2=4009025,NumMax=1,NumMin=1},
			{GoodsID=89040,GaiLv1=4009026,GaiLv2=4047886,NumMax=1,NumMin=1},
			{GoodsID=89041,GaiLv1=4047887,GaiLv2=4086747,NumMax=1,NumMin=1},
			{GoodsID=250,GaiLv1=4086748,GaiLv2=4397632,NumMax=1,NumMin=1},
			{GoodsID=80397,GaiLv1=4397633,GaiLv2=4786238,NumMax=1,NumMin=1},
			{GoodsID=75,GaiLv1=4786239,GaiLv2=4941681,NumMax=1,NumMin=1},
			{GoodsID=80394,GaiLv1=4941682,GaiLv2=5097124,NumMax=1,NumMin=1},
			{GoodsID=80686,GaiLv1=5097125,GaiLv2=5252567,NumMax=1,NumMin=1},
			{GoodsID=80689,GaiLv1=5252568,GaiLv2=5408010,NumMax=1,NumMin=1},
			{GoodsID=32015,GaiLv1=5408011,GaiLv2=5411119,NumMax=1,NumMin=1},
			{GoodsID=39511,GaiLv1=5411120,GaiLv2=5426664,NumMax=1,NumMin=1},
			{GoodsID=39514,GaiLv1=5426665,GaiLv2=5442209,NumMax=1,NumMin=1},
			{GoodsID=39504,GaiLv1=5442210,GaiLv2=5457754,NumMax=1,NumMin=1},
			{GoodsID=39505,GaiLv1=5457755,GaiLv2=5473299,NumMax=1,NumMin=1},
			{GoodsID=39506,GaiLv1=5473300,GaiLv2=5488844,NumMax=1,NumMin=1},
			{GoodsID=88908,GaiLv1=5488845,GaiLv2=5644287,NumMax=16,NumMin=8},
			{GoodsID=32016,GaiLv1=5644288,GaiLv2=5646878,NumMax=1,NumMin=1},
			{GoodsID=11330,GaiLv1=5646879,GaiLv2=5650765,NumMax=1,NumMin=1},
			{GoodsID=11331,GaiLv1=5650766,GaiLv2=5654652,NumMax=1,NumMin=1},
			{GoodsID=11332,GaiLv1=5654653,GaiLv2=5658539,NumMax=1,NumMin=1},
			{GoodsID=11333,GaiLv1=5658540,GaiLv2=5662426,NumMax=1,NumMin=1},
			{GoodsID=11102,GaiLv1=5662427,GaiLv2=5677971,NumMax=1,NumMin=1},
			{GoodsID=11103,GaiLv1=5677972,GaiLv2=5688334,NumMax=1,NumMin=1},
			{GoodsID=11030,GaiLv1=5688335,GaiLv2=5703879,NumMax=1,NumMin=1},
			{GoodsID=11031,GaiLv1=5703880,GaiLv2=5714242,NumMax=1,NumMin=1},
			{GoodsID=11032,GaiLv1=5714243,GaiLv2=5724605,NumMax=1,NumMin=1},
			{GoodsID=11033,GaiLv1=5724606,GaiLv2=5732378,NumMax=1,NumMin=1},
			{GoodsID=39701,GaiLv1=5732379,GaiLv2=5751809,NumMax=1,NumMin=1},
			{GoodsID=39703,GaiLv1=5751810,GaiLv2=5771240,NumMax=1,NumMin=1},
			{GoodsID=39704,GaiLv1=5771241,GaiLv2=5790671,NumMax=1,NumMin=1},
			{GoodsID=39705,GaiLv1=5790672,GaiLv2=5810102,NumMax=1,NumMin=1},
			{GoodsID=39706,GaiLv1=5810103,GaiLv2=5829533,NumMax=1,NumMin=1},
			{GoodsID=40208,GaiLv1=5829534,GaiLv2=5845078,NumMax=1,NumMin=1},
			{GoodsID=40224,GaiLv1=5845079,GaiLv2=5860623,NumMax=1,NumMin=1},
			{GoodsID=40240,GaiLv1=5860624,GaiLv2=5876168,NumMax=1,NumMin=1},
			{GoodsID=591,GaiLv1=5876169,GaiLv2=5953890,NumMax=1,NumMin=1},
			{GoodsID=88174,GaiLv1=5953891,GaiLv2=5961663,NumMax=1,NumMin=1},
			{GoodsID=80949,GaiLv1=5961664,GaiLv2=6738874,NumMax=5,NumMin=2},
			{GoodsID=82030,GaiLv1=6738875,GaiLv2=7516085,NumMax=6,NumMin=2},
			{GoodsID=82031,GaiLv1=7516086,GaiLv2=7671528,NumMax=1,NumMin=1},
			{GoodsID=38352,GaiLv1=7671529,GaiLv2=7723343,NumMax=1,NumMin=1},
			{GoodsID=38353,GaiLv1=7723344,GaiLv2=7775158,NumMax=1,NumMin=1},
			{GoodsID=38354,GaiLv1=7775159,GaiLv2=7826973,NumMax=1,NumMin=1},
			{GoodsID=38355,GaiLv1=7826974,GaiLv2=7878788,NumMax=1,NumMin=1},
			{GoodsID=38356,GaiLv1=7878789,GaiLv2=7930603,NumMax=1,NumMin=1},
			{GoodsID=38357,GaiLv1=7930604,GaiLv2=7982418,NumMax=1,NumMin=1},
			{GoodsID=38358,GaiLv1=7982419,GaiLv2=8034233,NumMax=1,NumMin=1},
			{GoodsID=38359,GaiLv1=8034234,GaiLv2=8086048,NumMax=1,NumMin=1},
			{GoodsID=38360,GaiLv1=8086049,GaiLv2=8137863,NumMax=1,NumMin=1},
			{GoodsID=32101,GaiLv1=8137864,GaiLv2=8168952,NumMax=1,NumMin=1},
			{GoodsID=31040,GaiLv1=8168953,GaiLv2=8174134,NumMax=1,NumMin=1},
			{GoodsID=11334,GaiLv1=8174135,GaiLv2=8177243,NumMax=1,NumMin=1},
			{GoodsID=88044,GaiLv1=8177244,GaiLv2=8208332,NumMax=1,NumMin=1},
			{GoodsID=31042,GaiLv1=8208333,GaiLv2=8209887,NumMax=1,NumMin=1},
			{GoodsID=31032,GaiLv1=8209888,GaiLv2=8217660,NumMax=1,NumMin=1},
			{GoodsID=31033,GaiLv1=8217661,GaiLv2=8225433,NumMax=1,NumMin=1},
			{GoodsID=317,GaiLv1=8225434,GaiLv2=9002644,NumMax=1,NumMin=1},
			{GoodsID=80274,GaiLv1=9002645,GaiLv2=9779855,NumMax=1,NumMin=1},
			{GoodsID=88171,GaiLv1=9779856,GaiLv2=9844623,NumMax=1,NumMin=1},
			{GoodsID=80952,GaiLv1=9844624,GaiLv2=9948252,NumMax=1,NumMin=1},
			{GoodsID=80388,GaiLv1=9948253,GaiLv2=10000000,NumMax=1,NumMin=1},
		},
	},
}
--物品类型表
WYL_AnniversaryChestGoodsType = {
	[10984] = 1,
	[10985] = 1,
	[89058] = 2,
	[89061] = 2,
	[39507] = 3,
	[39508] = 3,
	[39509] = 3,
	[39512] = 3,
	[39515] = 3,
	[89042] = 4,
	[89040] = 4,
	[89041] = 4,
	[75] = 5,
	[80394] = 5,
	[80686] = 5,
	[80689] = 5,
	[32015] = 6,
	[39511] = 1,
	[39514] = 1,
	[39504] = 1,
	[39505] = 1,
	[39506] = 1,
	[32016] = 6,
	[11330] = 7,
	[11331] = 7,
	[11332] = 7,
	[11333] = 7,
	[11102] = 1,
	[11103] = 1,
	[11030] = 1,
	[11031] = 1,
	[11032] = 1,
	[11033] = 1,
	[39701] = 6,
	[39703] = 6,
	[39704] = 6,
	[39705] = 6,
	[39706] = 6,
	[88174] = 8,
	[38352] = 5,
	[38353] = 5,
	[38354] = 5,
	[38355] = 5,
	[38356] = 5,
	[38357] = 5,
	[38358] = 5,
	[38359] = 5,
	[38360] = 5,
	[32101] = 5,
	[31040] = 9,
	[11334] = 9,
	[88044] = 5,
	[88101] = 10,
	[88102] = 10,
	[88103] = 10,
	[88104] = 10,
	[88105] = 10,
	[88106] = 10,
	[88107] = 10,
	[88108] = 10,
	[88109] = 10,
	[88110] = 10,
	[88111] = 10,
	[88112] = 10,
	[88113] = 10,
	[88114] = 10,
	[88115] = 10,
	[88116] = 10,
	[88117] = 10,
	[88118] = 10,
	[88119] = 10,
	[88120] = 10,
	[88121] = 10,
	[88122] = 10,
	[88123] = 10,
	[88124] = 10,
	[89057] = 2,
	[89060] = 2,
	[88173] = 8,
	[88172] = 8,
	[89056] = 2,
	[89059] = 2,
	[82031] = 5,
	[31042] = 11,
	[31032] = 9,
	[31033] = 9,
	[0] = 12,
}
--物品CD上限表
WYL_AnniversaryChestGoodsCdMax = {
	[1] = {Min=10,Max=20,NumMax=0,NumKey=0,NumCD=107,}, --白银时装和白银宝石
	[2] = {Min=20,Max=40,NumMax=10,NumKey=93,NumCD=94,}, --配方包
	[3] = {Min=5,Max=15,NumMax=10,NumKey=95,NumCD=96,}, --黄金时装宝石
	[4] = {Min=10,Max=20,NumMax=0,NumKey=0,NumCD=108,}, --武器光效石
	[5] = {Min=3,Max=10,NumMax=0,NumKey=0,NumCD=109,}, --宠物与其他高价值道具
	[6] = {Min=20,Max=50,NumMax=5,NumKey=97,NumCD=98,}, --高级载具卡片
	[7] = {Min=45,Max=60,NumMax=4,NumKey=99,NumCD=100,}, --黄金时装
	[8] = {Min=30,Max=60,NumMax=10,NumKey=101,NumCD=102,}, --灵魂石
	[9] = {Min=45,Max=60,NumMax=5,NumKey=103,NumCD=104,}, --宠物卡和饰品位时装
	[10] = {Min=20,Max=60,NumMax=0,NumKey=0,NumCD=110,}, --英雄秘籍
	[11] = {Min=1440,Max=2160,NumMax=1,NumKey=105,NumCD=106,}, --佩罗恩宝宝卡
	[12] = {Min=5,Max=20,NumMax=0,NumKey=0,NumCD=111,}, --各档次高附加材料
}

--周年庆宝箱使用函数
function WYL_AnniversaryChestGoodsTable(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if WYL_AnniversaryChestCBFunc[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return 0
	end
	if API_ActorGetPackageSize(ActorID) < 1 then
		API_ActorSendMsg(ActorID,3,'背包已满，无法使用')
		return 0
	end
	local Time = os.time() 
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local PlayName = API_GetActorName(ActorID)
	local PlayLv = API_GetActorExpLevel(ActorID)
	local JiangLiQuYu = 1
	local EquipmentType = 12
	if PlayLv > 40 then
		JiangLiQuYu = 3
		EquipmentType = 9
	elseif PlayLv > 25 then
		JiangLiQuYu = 2
		EquipmentType = 4
	end
	local JiangLiTable = WYL_AnniversaryChestCBFunc[GoodsID][JiangLiQuYu]
	local JiangLiGaiLv = math.random(10000000)
	local JiangLiGoodsID,JiangLiGoodsNum = 0,0
	local SayWorld = 0
	local IsEquipment = 0
	for j in JiangLiTable do
		local GaiLv1 = JiangLiTable[j].GaiLv1
		local GaiLv2 = JiangLiTable[j].GaiLv2
		if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
			JiangLiGoodsID = JiangLiTable[j].GoodsID
			local NumMax = JiangLiTable[j].NumMax
			local NumMin = JiangLiTable[j].NumMin
			JiangLiGoodsNum = math.random(NumMin,NumMax) 
			if JiangLiGoodsNum > 0 then
				if WYL_AnniversaryChestGoodsType[JiangLiGoodsID] ~= nil then
					local Type = WYL_AnniversaryChestGoodsType[JiangLiGoodsID]
					if WYL_AnniversaryChestGoodsCdMax[Type] ~= nil then
						local Min = WYL_AnniversaryChestGoodsCdMax[Type].Min
						local Max = WYL_AnniversaryChestGoodsCdMax[Type].Max
						local NumMax = WYL_AnniversaryChestGoodsCdMax[Type].NumMax
						local NumKey = WYL_AnniversaryChestGoodsCdMax[Type].NumKey
						local NumCD = WYL_AnniversaryChestGoodsCdMax[Type].NumCD
						local NowCDTime = API_VarDataGetNumber_Ex(1, 0, -2000, 1, NumCD)
						if Time >= NowCDTime then
							if NumMax > 0 then
								local NowNum = API_VarDataGetNumber_Ex(1, 0, -2000, 1, NumKey)
								if NowNum < NumMax then
									NowNum = NowNum + 1
									API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, NumKey, NowNum)
									Time = Time + (math.random(Min,Max) * 60)
									API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, NumCD, Time)
									SayWorld = 1
									for k in WYL_AnniversaryChestGoodsCdMax do
										if Type ~= k and WYL_AnniversaryChestGoodsCdMax[k].NumMax > 0 then
											local NumCD2 = WYL_AnniversaryChestGoodsCdMax[k].NumCD
											local Time2 = Time + (math.random(3,5) * 60)
											API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, NumCD2, Time2)
										end
									end
								else
									JiangLiGoodsID = math.random(89040,89042)
									JiangLiGoodsNum = 1
								end
							else
								if JiangLiGoodsID == 0 then
									JiangLiGoodsID = YXD_WorldDropGoodsTab[EquipmentType][math.random(table.getn(YXD_WorldDropGoodsTab[EquipmentType]))]
									IsEquipment = 1
								end
								if Type == 4 or Type == 10 then
									SayWorld = 1
								end
								Time = Time + (math.random(Min,Max) * 60)
								API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, NumCD, Time)
							end
						else
							JiangLiGoodsID = 845
							JiangLiGoodsNum = 1
						end
					else
						JiangLiGoodsID = 845
						JiangLiGoodsNum = 1
					end
				end
			else
				JiangLiGoodsID = 250
				JiangLiGoodsNum = 1
			end
			break
		end
	end
	if API_ActorRemoveGoods(ActorID, GoodsID, 1, '打开周年庆宝箱') then
		local PD2 = 0
		for j,v in baoshiwupinbiao do
			if JiangLiGoodsID == v then
				PD2 = 1
				break
			end
		end
		if PD2 == 1 then
			fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
		elseif IsEquipment == 1 then
			API_AddActorGoodsFlagEx(ActorID,JiangLiGoodsID,1,3,0,'周年庆宝箱奖励',0)
		else
			API_AddActorGoods(ActorID,JiangLiGoodsID,JiangLiGoodsNum,'周年庆宝箱奖励')
		end
		API_ActorSendMsg(ActorID,7,'周年送好礼，恭喜您获得：'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="150,150,300,220" alpha="240" balpha="230"></win>') 
		API_ResponseWrite('<br>br><text size="16" color="117,252,255">英雄岛两周年，好礼送不停！</text><br>')
		API_ResponseWrite('<br><text color="255,0,255">打开周年庆宝箱获得：</text><img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'"><text> × '..JiangLiGoodsNum..'</text><br>')
		API_ResponseWrite('<br><br><a>确定</a>')
		API_ResponseFlush(ActorID)
		if SayWorld == 1 then
			local GoodsName = API_GetGoodsName(JiangLiGoodsID)
			if not API_IsBattleGameServer() then
				API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..PlayName..'打开周年庆宝箱获得了：'..GoodsName..'！')
			end
		end
	end
	return 1
end

PetStarLvProbabilityTable = {
[1] = 3895,
[2] = 5000,
[3] = 1000,
[4] = 100,
[5] = 5,
}
function PetStarLvProbabilityFunc()
	local RD = math.random(10000)
	local StarLv,RDNum = 1,0
	for i = 1,table.getn(PetStarLvProbabilityTable) do
		RDNum = RDNum + PetStarLvProbabilityTable[i]
		if RD <= RDNum then
			StarLv = i
			break
		end
	end
	return StarLv
end
function AddStarLvPetCapsuleFunc(ActorID,Num)
	local text = ''
	if Num == 1 then
		text = '财神宝箱奖励'
	elseif Num == 2 then
		text = '幸运星奖励'
	elseif Num == 3 then
		text = '超级幸运星奖励'
	end
	if API_ActorCanAddGoods(ActorID,76,1,0,0) ~= -1 then
		local StarLv = PetStarLvProbabilityFunc()
		local UID = API_AddActorGoodsPropRetUID(ActorID, 76, 1, 0, ''..text..'', -1, -1) 
		API_SetUIDPetCapsulePropNum(ActorID, UID, 35, StarLv)
	else
		API_SendActorMail(ActorID,76,1,''..text..'','获得1个宠物胶囊')
	end
end
