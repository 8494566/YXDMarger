-- ------------------------------------------------------------------------------
-- 武魂相关代码
-- 版本  v1.0
-- ------------------------------------------------------------------------------

--//////////////////////////////////////////////////////////////////////////
--// 描  述：删除某个区的武魂
--// 输  入：
--//	1. nLocation: 魂器物品
--//	2. nAreaType: 0=武魂装备栏区;1=武魂存储区;2=武魂猎魂区;3=不区分区域
--// 输  出: 1=成功,0=失败,2=未发现武魂
--//////////////////////////////////////////////////////////////////////////
--int API_RemoveHorcruxes(int lActorID, int nLocation, int nAreaType)

-- 武魂的API
-- int API_ActorNewHorcruxes(long lActorID, int nGoodsID, int nPropertyID, int nQualityID, int nExperience);
-- //////////////////////////////////////////////////////////////////////////
-- // 描  述：更新(同步)猎魂师的状态
-- // 输  入：
-- //	1. nHunter	: 猎魂师ID
-- //	2. nStatus	: 新状态1点亮，0熄灭
-- //	3. bSync	: 1=立即同步到客户端;0=仅更新服务端
-- // 输  出: 无
-- //////////////////////////////////////////////////////////////////////////
-- void API_UpdateHunterStatus(long lActorID, int nHunter, int nStatus, int bSync);
-- //////////////////////////////////////////////////////////////////////////
-- // 描  述：设置隐藏属性
-- // 输  入：
-- //	1. nLocation: 魂器物品
-- //	2. nProLoc	: 那一个属性[1,2]
-- //	3. nProValue: 属性值ID
-- // 输  出: 1=成,0=失败
-- //////////////////////////////////////////////////////////////////////////
-- int API_SetHorcruxesProperty(int lActorID, int nLocation, int nProLoc, int nProValue);
--	// 以下为武魂专用属性
--	enGoodsProp_Hor_Quality,	//14 = 武魂的品质
--	enGoodsProp_Hor_PropertyA,	//15 = 武魂的属性1
--	enGoodsProp_Hor_PropertyB,	//16 = 武魂的属性2
--	enGoodsProp_Hor_PropertyC,	//17 = 武魂的属性3
--	enGoodsProp_Hor_CurLevel,	//18 = 武魂的当前等级
--	enGoodsProp_Hor_Experience,	//19 = 武魂的经验

-- ------------------------------------------------------------------------------
-- 系统内猎魂方式定义:不能改动!!!
-- ------------------------------------------------------------------------------
local enHorcruxesStyle_Single	= 0	-- 单独一个个猎
local enHorcruxesStyle_multi	= 1	-- 一键猎魂


-- ------------------------------------------------------------------------------
-- 系统内猎魂师ID定义:不能改动!!!
-- ------------------------------------------------------------------------------
local enHorHunter_ZhouYiXian	= 0	-- 周一仙
local enHorHunter_XiaoXianNv	= 1	-- 小仙女
local enHorHunter_ZuoCi		= 2	-- 左慈
local enHorHunter_ZhangDaoLing	= 3	-- 张道陵
local enHorHunter_JiangZiYa	= 4	-- 姜子牙

---------------------------------------------------------------------------------
local HunterStatusTye = 30292 --猎魂师激活状态

API_AddLUAReqFunc("HorHunter_LiuXingChange")
local HorHunterTable = {
	[1] = {	
				Odds = 5000,
				Gold = 2000,
				GoodsNum = 2,
				GoodsIDTable = {
								[1] = {
									{GaiLv1=1,GaiLv2=980000,Exp = 1,GoodsID = {11573},},
									{GaiLv1=980001,GaiLv2=1000000,Exp = 10,GoodsID = {11584,11553,11563,11568,11574,11579,11589,11558,11614,11664,11669,11674},},
									},
								},
			},
	[2] = {
				Odds = 5000,
				Gold = 4000,
				GoodsNum = 4,
				GoodsIDTable = {
								[1] = {
									{GaiLv1=1,GaiLv2=890000,Exp = 1,GoodsID = {11573},},
									{GaiLv1=890001,GaiLv2=950000,Exp = 10,GoodsID = {11584,11553,11563,11568,11574,11579,11589,11558,11614,11664,11669,11674},},
									{GaiLv1=950001,GaiLv2=1000000,Exp = 20,GoodsID = {11554,11559,11564,11569,11575,11580,11585,11590,11615,11665,11670,11675},},
									},
								},
			},
	[3] = {
				Odds = 4000,
				Gold = 8000,
				GoodsNum = 6,
				GoodsIDTable = {
								[1] = {
									{GaiLv1=1,GaiLv2=890000,Exp = 1,GoodsID = {11573},},
									{GaiLv1=890001,GaiLv2=960000,Exp = 10,GoodsID = {11584,11553,11563,11568,11574,11579,11589,11558,11614,11664,11669,11674},},
									{GaiLv1=960001,GaiLv2=980000,Exp = 20,GoodsID = {11554,11559,11564,11569,11575,11580,11585,11590,11615,11665,11670,11675},},
									{GaiLv1=980001,GaiLv2=1000000,Exp = 30,GoodsID = {11555,11560,11565,11570,11576,11581,11586,11591,11616,11666,11671,11676},},
									},
								},
			},
	[4] = {
				Odds = 5000,
				Gold = 15000,
				GoodsNum = 8,
				GoodsIDTable = {
								[1] = {
									{GaiLv1=1,GaiLv2=200000,Exp = 1200,GoodsID = {11604},},
								--	{GaiLv1=540001,GaiLv2=760000,Exp = 60,GoodsID = {11554,11559,11564,11569,11575,11580,11585,11590,11615,11665,11670,11675},},
								--	{GaiLv1=760001,GaiLv2=860000,Exp = 120,GoodsID = {11555,11560,11565,11570,11576,11581,11586,11591,11616,11666,11671,11676},},
									{GaiLv1=340001,GaiLv2=920000,Exp = 40,GoodsID = {11556,11561,11566,11571,11577,11582,11587,11592,11617,11667,11672,11677},},
									{GaiLv1=920001,GaiLv2=1000000,Exp = 50,GoodsID = {11578,11562,11557,11567,11572,11583,11588,11593,11618,11668,11673,11678},},	
									},
								},
			},
	[5] = {
				Odds = 0,
				Gold = 150000,
				GoodsNum = 30,
				GoodsIDTable = {
								[1] = {
									{GaiLv1=1,GaiLv2=900000,Exp = 5000,GoodsID = {11604},},
								--	{GaiLv1=540001,GaiLv2=760000,Exp = 60,GoodsID = {11554,11559,11564,11569,11575,11580,11585,11590,11615,11665,11670,11675},},
								--	{GaiLv1=760001,GaiLv2=860000,Exp = 120,GoodsID = {11555,11560,11565,11570,11576,11581,11586,11591,11616,11666,11671,11676},},
								--	{GaiLv1=860001,GaiLv2=920000,Exp = 240,GoodsID = {11556,11561,11566,11571,11577,11582,11587,11592,11617,11667,11672,11677},},
								--	{GaiLv1=440001,GaiLv2=880000,Exp = 480,GoodsID = {11578,11562,11557,11567,11572,11583,11588,11593,11618,11668,11673,11678},},
									{GaiLv1=900001,GaiLv2=1000000,Exp = 960,GoodsID = {11709,11710,11711,11712,11713,11714,11715,11716,11717,11718,11719,11720,},},							
									},
								},
			},
}

local HunterEffectTable = {
			[11573] = {PropertyID = 1,QualityID = 1,},
			[11604] = {PropertyID = 1,QualityID = 1,},
			[11708] = {PropertyID = 1,QualityID = 1,},
			
			[11553] = {PropertyID = 1,QualityID = 1,},
			[11558] = {PropertyID = 2,QualityID = 1,},
			[11568] = {PropertyID = 3,QualityID = 1,},
			[11574] = {PropertyID = 4,QualityID = 1,},
			[11579] = {PropertyID = 5,QualityID = 1,},
			[11584] = {PropertyID = 6,QualityID = 1,},
			[11589] = {PropertyID = 7,QualityID = 1,},
			[11563] = {PropertyID = 8,QualityID = 1,},
			[11614] = {PropertyID = 59,QualityID = 1,},
			[11664] = {PropertyID = 70,QualityID = 1,},
			[11669] = {PropertyID = 71,QualityID = 1,},
			[11674] = {PropertyID = 72,QualityID = 1,},
			
			[11554] = {PropertyID = 1,QualityID = 1,},
			[11559] = {PropertyID = 2,QualityID = 1,},
			[11569] = {PropertyID = 3,QualityID = 1,},
			[11575] = {PropertyID = 4,QualityID = 1,},
			[11580] = {PropertyID = 5,QualityID = 1,},
			[11585] = {PropertyID = 6,QualityID = 1,},
			[11590] = {PropertyID = 7,QualityID = 1,},
			[11564] = {PropertyID = 8,QualityID = 1,},
			[11615] = {PropertyID = 59,QualityID = 1,},
			[11665] = {PropertyID = 70,QualityID = 1,},
			[11670] = {PropertyID = 71,QualityID = 1,},
			[11675] = {PropertyID = 72,QualityID = 1,},
			
			[11555] = {PropertyID = 1,QualityID = 2,},
			[11560] = {PropertyID = 2,QualityID = 2,},
			[11570] = {PropertyID = 3,QualityID = 2,},
			[11576] = {PropertyID = 4,QualityID = 2,},
			[11581] = {PropertyID = 5,QualityID = 2,},
			[11586] = {PropertyID = 6,QualityID = 2,},
			[11591] = {PropertyID = 7,QualityID = 2,},
			[11565] = {PropertyID = 8,QualityID = 2,},
			[11616] = {PropertyID = 59,QualityID = 2,},
			[11666] = {PropertyID = 70,QualityID = 2,},
			[11671] = {PropertyID = 71,QualityID = 2,},
			[11676] = {PropertyID = 72,QualityID = 2,},
			
			[11556] = {PropertyID = 1,QualityID = 3,},
			[11561] = {PropertyID = 2,QualityID = 3,},
			[11571] = {PropertyID = 3,QualityID = 3,},
			[11577] = {PropertyID = 4,QualityID = 3,},
			[11582] = {PropertyID = 5,QualityID = 3,},
			[11587] = {PropertyID = 6,QualityID = 3,},
			[11592] = {PropertyID = 7,QualityID = 3,},
			[11566] = {PropertyID = 8,QualityID = 3,},
			[11617] = {PropertyID = 59,QualityID = 3,},
			[11667] = {PropertyID = 70,QualityID = 3,},
			[11672] = {PropertyID = 71,QualityID = 3,},
			[11677] = {PropertyID = 72,QualityID = 3,},
			
			[11557] = {PropertyID = 1,QualityID = 4,},
			[11562] = {PropertyID = 2,QualityID = 4,},
			[11572] = {PropertyID = 3,QualityID = 4,},
			[11578] = {PropertyID = 4,QualityID = 4,},
			[11583] = {PropertyID = 5,QualityID = 4,},
			[11588] = {PropertyID = 6,QualityID = 4,},
			[11593] = {PropertyID = 7,QualityID = 4,},
			[11567] = {PropertyID = 8,QualityID = 4,},
			[11618] = {PropertyID = 59,QualityID = 4,},
			[11668] = {PropertyID = 70,QualityID = 4,},
			[11673] = {PropertyID = 71,QualityID = 4,},
			[11678] = {PropertyID = 72,QualityID = 4,},
			
			[11709] = {PropertyID = 1,QualityID = 5,},
			[11710] = {PropertyID = 2,QualityID = 5,},
			[11712] = {PropertyID = 3,QualityID = 5,},
			[11713] = {PropertyID = 4,QualityID = 5,},
			[11714] = {PropertyID = 5,QualityID = 5,},
			[11715] = {PropertyID = 6,QualityID = 5,},
			[11716] = {PropertyID = 7,QualityID = 5,},
			[11711] = {PropertyID = 8,QualityID = 5,},
			[11717] = {PropertyID = 59,QualityID = 5,},
			[11718] = {PropertyID = 70,QualityID = 5,},
			[11719] = {PropertyID = 71,QualityID = 5,},
			[11720] = {PropertyID = 72,QualityID = 5,},
}

local ShengMing = {11568,11569,11570,11571,11572,}
local WuLiGongJi = {11558,11559,11560,11561,11562,}
local HuoYaoGongJi = {11589,11590,11591,11592,11593,}
local MoFaGongJi = {11579,11580,11581,11582,11583,}
local BaoJi = {11553,11554,11555,11556,11557,11563,11564,11565,11566,11567,11584,11585,11586,11587,11588,}
local BaoJiDiKang = {11574,11575,11576,11577,11578,}
local NengLiang = {11614,11615,11616,11617,11618}
local WuFang = {11664,11665,11666,11667,11668,}
local HuoFang = {11669,11670,11671,11672,11678,}
local MoFang = {11674,11675,11676,11677,11673,}

local LShengMing = {11712,}
local LWuLiGongJi = {11710,}
local LHuoYaoGongJi = {11716,}
local LMoFaGongJi = {11714,}
local LBaoJi = {11709,11711,11715,}
local LBaoJiDiKang = {11713,}
local LNengLiang = {11717}
local LWuFang = {11718,}
local LHuoFang = {11720,}
local LMoFang = {11719,}

local YongShiGoodsID = 89186
-- ------------------------------------------------------------------------------
-- 玩家点击猎魂师开始猎魂时回调
-- lActorID	: 玩家ID
-- lStyle	: 猎魂方式[见上面定义]
-- lHunter	: 玩家要点亮的猎魂师ID[见上面的定义]
-- lContainerSize: 猎魂容器的空位,也就是最多可以猎魂的数量
-- ------------------------------------------------------------------------------
function OnActor_HunterHorcruxes(lActorID, lStyle, lHunter, lContainerSize)
	-- 猎魂
	local ActorID = lActorID or API_RequestGetActorID() 
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
--	API_Trace('lStyle ='..lStyle)
--	API_Trace('lHunter ='..lHunter)
--	API_Trace('lContainerSize ='..lContainerSize)
--	API_Trace('HunterStatus2 ='..HunterStatus2)
--	API_Trace('HunterStatus3 ='..HunterStatus3)
--	API_Trace('HunterStatus4 ='..HunterStatus4)
--	API_Trace('HunterStatus5 ='..HunterStatus5)
	if lContainerSize == 0 then	
		API_ActorSendMsg(ActorID,3,'背包已满')
		return
	end
	
	if lStyle == 0 then
--		local HunterStatus = API_VarDataGetNumber(ActorID,0,HunterStatusTye)
--		local BiaoZhi1 = math.mod(HunterStatus,100)
--		local BiaoZhi2 = math.floor(HunterStatus/100)
--		local HunterStatus2 = math.mod(BiaoZhi1,10)
--		local HunterStatus3 = math.floor(BiaoZhi1/10)
--		local HunterStatus4 = math.mod(BiaoZhi2,10)
--		local HunterStatus5 = math.floor(BiaoZhi2/10)
		local HunterStatus5,HunterStatus4,HunterStatus3,HunterStatus2 = F_Hor_GetHunterStatus(ActorID)
		if lHunter == 1 then
			if HunterStatus2 == 0 then
				return
			end
		elseif lHunter == 2 then
			if HunterStatus3 == 0 then
				return
			end
		elseif lHunter == 3 then
			if HunterStatus4 == 0 then
				return
			end
		elseif lHunter == 4 then
			if HunterStatus5 == 0 then
				return
			end
		end
		
		local HorHunter = HorHunterTable[lHunter+1]
		local NeedGold = HorHunter.Gold
		local NeedGoodNum = HorHunter.GoodsNum
		local Odds = HorHunter.Odds
		local GoodsIDTable = HorHunter.GoodsIDTable[1]
		if API_ActorGetGoodsNum(ActorID,YongShiGoodsID) >= NeedGoodNum then
			if API_ActorRemoveGoods(ActorID,YongShiGoodsID,NeedGoodNum,'使用勇士勋章') then
				API_ActorSendMsg(ActorID,3,'扣除勇士勋章猎魂')
			else
				API_ActorSendMsg(ActorID,3,'扣除勇士勋章失败')
				return
			end
		else
			if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) < NeedGold then
				API_ActorSendMsg(ActorID,3,'金币余额不足')
				return
			end
			API_ActorAddMoney(ActorID,-NeedGold,0,'猎魂扣除金币')
		end
		
			local Number = math.random(1)
			if Number <= Odds then
				if lHunter ~= 0 then
					API_UpdateHunterStatus(ActorID, lHunter, 0, 1)
				end	
				API_UpdateHunterStatus(ActorID, lHunter + 1, 1, 1)
--				if lHunter == 0 then
--					HunterStatus = HunterStatus5 * 1000 + HunterStatus4 * 100 + HunterStatus3 * 10 + 1
--				elseif lHunter == 1 then
--					HunterStatus = HunterStatus5 * 1000 + HunterStatus4 * 100 + 10
--				elseif lHunter == 2 then
--					HunterStatus = HunterStatus5 * 1000 + 100 + HunterStatus2
--				elseif lHunter == 3 then
--					HunterStatus = 1000 + HunterStatus3 * 10 + HunterStatus2
--				end
				if lHunter == 0 then
					HunterStatus2 = 1
				elseif lHunter == 1 then
					HunterStatus2 = 0
					HunterStatus3 = 1
				elseif lHunter == 2 then
					HunterStatus3 = 0
					HunterStatus4 = 1
				elseif lHunter == 3 then
					HunterStatus4 = 0
					HunterStatus5 = 0
					API_UpdateHunterStatus(ActorID, 4, 0, 1)
				end
			else
				if lHunter ~= 0 then
					API_UpdateHunterStatus(ActorID, lHunter, 0, 1)
				end
				
				-- if lHunter == 1 then
				-- 	HunterStatus = HunterStatus5 *  1000  + HunterStatus4 * 100 + HunterStatus3 * 10
				-- elseif lHunter == 2 then
				-- HunterStatus = HunterStatus5 *  1000  + HunterStatus4 * 100 + HunterStatus2
				-- elseif lHunter == 3 then
				-- 	HunterStatus = HunterStatus5 *  1000 + HunterStatus3 * 10 + HunterStatus2
				-- elseif lHunter == 4 then
				-- 	HunterStatus = HunterStatus4 * 100 + HunterStatus3 * 100 + HunterStatus2
				-- end
				 if lHunter == 1 then
				 	HunterStatus2 = 0
				 elseif lHunter == 2 then
					HunterStatus3 = 0
				 elseif lHunter == 3 then
				 	HunterStatus4 = 0
				 elseif lHunter == 4 then
				 	HunterStatus5 = 0
				 end
			end
--		API_VarDataSetNumber(ActorID,0,HunterStatusTye,HunterStatus)
		F_Hor_SetNewHunterStatus(ActorID, HunterStatus5, HunterStatus4, HunterStatus3, HunterStatus2)

		local JiangLiGaiLv = math.random(1000000)
		local Number = 1
		for j in GoodsIDTable do
			local GaiLv1 = GoodsIDTable[j].GaiLv1
			local GaiLv2 = GoodsIDTable[j].GaiLv2
			local LuckNum = API_VarDataGetNumber(ActorID,1,30293)
			if LuckNum > 50 then
				LuckNum = 50
			end
--			if lHunter == 4 and Number == 1 then
--				Number = Number + 1
--				JiangLiGaiLv = JiangLiGaiLv + LuckNum*2000
--				if JiangLiGaiLv > 1000000 then
--					JiangLiGaiLv = 1000000
--				end
--			end
			
			if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
				local Exp = GoodsIDTable[j].Exp
				local GoodsID = GoodsIDTable[j].GoodsID
				if type(GoodsID) == 'table' then
					local Num = math.random(table.getn(GoodsID))
					GoodsID = GoodsID[Num]
				end
				if HunterEffectTable[GoodsID] == nil then
					API_ActorSendMsg(ActorID,3,'非法物品')
					return 
				end
				local PropertyID = HunterEffectTable[GoodsID].PropertyID
				local QualityID = HunterEffectTable[GoodsID].QualityID
				local Level = API_GetActorExpLevel(ActorID)

				
				API_ActorNewHorcruxes(ActorID, GoodsID, PropertyID, QualityID, Exp)
				
				--公告
				if QualityID == 5  or QualityID == 6  then
					API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'人品大爆发，通过猎魂获得了'..API_GetGoodsName(GoodsID)..'') 					
				end

				--风向标代码
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if QualityID == 4 then
					if GLOBAL_FengXiangBiao_DateList[75][6][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[75][6][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[75][6][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][6][LaiYuan] + 1
					end
				elseif QualityID == 5 then
					if GLOBAL_FengXiangBiao_DateList[75][7][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[75][7][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[75][7][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][7][LaiYuan] + 1
					end
				elseif QualityID == 6 then
					if GLOBAL_FengXiangBiao_DateList[75][13][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[75][13][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[75][13][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][13][LaiYuan] + 1
					end
				end
			end
		end
		
		--风向标代码
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		if lHunter == 0 then
			if GLOBAL_FengXiangBiao_DateList[75][1][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[75][1][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[75][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][1][LaiYuan] + 1
			end
		elseif lHunter == 1 then
			if GLOBAL_FengXiangBiao_DateList[75][2][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[75][2][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[75][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][2][LaiYuan] + 1
			end
		elseif lHunter == 2 then
			if GLOBAL_FengXiangBiao_DateList[75][3][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[75][3][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[75][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][3][LaiYuan] + 1
			end
		elseif lHunter == 3 then
			if GLOBAL_FengXiangBiao_DateList[75][4][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[75][4][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[75][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][4][LaiYuan] + 1
			end
		elseif lHunter == 4 then
			if GLOBAL_FengXiangBiao_DateList[75][5][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[75][5][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[75][5][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][5][LaiYuan] + 1
			end
		end
	else
		OnActor_YiJianLieHun(ActorID)
	end

end

function OnActor_YiJianLieHun(ActorID)
			local ActorID = ActorID or API_RequestGetActorID() 
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
			local ContainerSize = API_GetHorcruxesEmptySize(ActorID, 2)
			if ContainerSize <= 0 then
				API_ActorSendMsg(ActorID,3,'背包已满')
				return
			end

			local HunterStatus5,HunterStatus4,HunterStatus3,HunterStatus2 = F_Hor_GetHunterStatus(ActorID)
			-- local HunterStatus = API_VarDataGetNumber(ActorID,0,HunterStatusTye)
			-- local BiaoZhi1 = math.mod(HunterStatus,100)
			-- local BiaoZhi2 = math.floor(HunterStatus/100)
			-- local HunterStatus2 = math.mod(BiaoZhi1,10)
			-- local HunterStatus3 = math.floor(BiaoZhi1/10)
			-- local HunterStatus4 = math.mod(BiaoZhi2,10)
			-- local HunterStatus5 = math.floor(BiaoZhi2/10)
	
			if HunterStatus5 == 1 then
				lHunter = 4
			elseif HunterStatus4 == 1 then
				lHunter = 3
			elseif HunterStatus3 == 1 then
				lHunter = 2
			elseif HunterStatus2 == 1 then
				lHunter = 1
--				return
			else
				lHunter = 0
			end
			
			local HorHunter = HorHunterTable[lHunter+1]
			local NeedGold = HorHunter.Gold
			local NeedGoodNum = HorHunter.GoodsNum
			local Odds = HorHunter.Odds
			local GoodsIDTable = HorHunter.GoodsIDTable[1]			
			if API_ActorGetGoodsNum(ActorID,YongShiGoodsID) >= NeedGoodNum then
				if API_ActorRemoveGoods(ActorID,YongShiGoodsID,NeedGoodNum,'使用勇士勋章') then
					API_ActorSendMsg(ActorID,3,'扣除勇士勋章猎魂')
				else
					API_ActorSendMsg(ActorID,3,'扣除勇士勋章失败')
					return
				end
			else
				if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) < NeedGold then
					API_ActorSendMsg(ActorID,3,'金币余额不足')
					return
				end
				API_ActorAddMoney(ActorID,-NeedGold,0,'猎魂扣除金币')
			end
		
			local Number = math.random(1)
			if Number <= Odds then
				if lHunter ~= 0 then
					API_UpdateHunterStatus(ActorID, lHunter, 0, 1)
				end	
				API_UpdateHunterStatus(ActorID, lHunter + 1, 1, 1)
--				if lHunter == 0 then
--					HunterStatus = HunterStatus5 * 1000 + HunterStatus4 * 100 + HunterStatus3 * 10 + 1
--				elseif lHunter == 1 then
--					HunterStatus = HunterStatus5 * 1000 + HunterStatus4 * 100 + 10
--				elseif lHunter == 2 then
--					HunterStatus = HunterStatus5 * 1000 + 100 + HunterStatus2
--				elseif lHunter == 3 then
--					HunterStatus = 1000 + HunterStatus3 * 10 + HunterStatus2
--				end
				if lHunter == 0 then
					HunterStatus2 = 1
				elseif lHunter == 1 then
					HunterStatus2 = 0
					HunterStatus3 = 1
				elseif lHunter == 2 then
					HunterStatus3 = 0
					HunterStatus4 = 1
				elseif lHunter == 3 then
					HunterStatus4 = 0
					HunterStatus5 = 0
					API_UpdateHunterStatus(ActorID, 4, 0, 1)
				end
			else
				if lHunter ~= 0 then
					API_UpdateHunterStatus(ActorID, lHunter, 0, 1)
				end
				
				-- if lHunter == 1 then
				-- 	HunterStatus = HunterStatus5 *  1000  + HunterStatus4 * 100 + HunterStatus3 * 10
				-- elseif lHunter == 2 then
				-- HunterStatus = HunterStatus5 *  1000  + HunterStatus4 * 100 + HunterStatus2
				-- elseif lHunter == 3 then
				-- 	HunterStatus = HunterStatus5 *  1000 + HunterStatus3 * 10 + HunterStatus2
				-- elseif lHunter == 4 then
				-- 	HunterStatus = HunterStatus4 * 100 + HunterStatus3 * 100 + HunterStatus2
				-- end
				 if lHunter == 1 then
				 	HunterStatus2 = 0
				 elseif lHunter == 2 then
					HunterStatus3 = 0
				 elseif lHunter == 3 then
				 	HunterStatus4 = 0
				 elseif lHunter == 4 then
				 	HunterStatus5 = 0
				 end
			end
			-- API_VarDataSetNumber(ActorID,0,HunterStatusTye,HunterStatus)
			F_Hor_SetNewHunterStatus(ActorID, HunterStatus5, HunterStatus4, HunterStatus3, HunterStatus2)
		
			local JiangLiGaiLv = math.random(1000000)
			local Number = 1
			for j in GoodsIDTable do
				local GaiLv1 = GoodsIDTable[j].GaiLv1
				local GaiLv2 = GoodsIDTable[j].GaiLv2
				local LuckNum = API_VarDataGetNumber(ActorID,1,30293)
				if LuckNum > 50 then
					LuckNum = 50
				end
--				if lHunter == 4 and Number == 1 then
--					Number = Number + 1
--					JiangLiGaiLv = JiangLiGaiLv + LuckNum*2000
--					if JiangLiGaiLv > 1000000 then
--						JiangLiGaiLv = 1000000
--					end
--				end		
				
				if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
					local Exp = GoodsIDTable[j].Exp
					local GoodsID = GoodsIDTable[j].GoodsID
					if type(GoodsID) == 'table' then
						local Num = math.random(table.getn(GoodsID))
						GoodsID = GoodsID[Num]
					end
					if HunterEffectTable[GoodsID] == nil then
						API_ActorSendMsg(ActorID,3,'非法物品')
						return 
					end
					local PropertyID = HunterEffectTable[GoodsID].PropertyID
					local QualityID = HunterEffectTable[GoodsID].QualityID
					local Level = API_GetActorExpLevel(ActorID)

					API_ActorNewHorcruxes(ActorID, GoodsID, PropertyID, QualityID, Exp)
					
					--公告
					if QualityID == 5  or QualityID == 6  then
						API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'人品大爆发，通过猎魂获得了'..API_GetGoodsName(GoodsID)..'') 					
					end

					--风向标代码
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if QualityID == 4 then
						if GLOBAL_FengXiangBiao_DateList[75][6][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[75][6][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[75][6][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][6][LaiYuan] + 1
						end
					elseif QualityID == 5 then
						if GLOBAL_FengXiangBiao_DateList[75][7][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[75][7][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[75][7][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][7][LaiYuan] + 1
						end
					elseif QualityID == 6 then
						if GLOBAL_FengXiangBiao_DateList[75][13][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[75][13][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[75][13][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][13][LaiYuan] + 1
						end
					end
				end
			end
			
			--风向标代码
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if lHunter == 0 then
				if GLOBAL_FengXiangBiao_DateList[75][1][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[75][1][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[75][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][1][LaiYuan] + 1
				end
			elseif lHunter == 1 then
				if GLOBAL_FengXiangBiao_DateList[75][2][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[75][2][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[75][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][2][LaiYuan] + 1
				end
			elseif lHunter == 2 then
				if GLOBAL_FengXiangBiao_DateList[75][3][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[75][3][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[75][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][3][LaiYuan] + 1
				end
			elseif lHunter == 3 then
				if GLOBAL_FengXiangBiao_DateList[75][4][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[75][4][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[75][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][4][LaiYuan] + 1
				end
			elseif lHunter == 4 then
				if GLOBAL_FengXiangBiao_DateList[75][5][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[75][5][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[75][5][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][5][LaiYuan] + 1
				end
			end
			
			local ContainerSize = API_GetHorcruxesEmptySize(ActorID, 2)
			if ContainerSize <= 0 then
				return
			end
--			local HunterStatus = API_VarDataGetNumber(ActorID,0,HunterStatusTye)
--			local BiaoZhi1 = math.mod(HunterStatus,100)
--			local BiaoZhi2 = math.floor(HunterStatus/100)
--			local HunterStatus2 = math.mod(BiaoZhi1,10)
--			local HunterStatus3 = math.floor(BiaoZhi1/10)
--			local HunterStatus4 = math.mod(BiaoZhi2,10)
--			local HunterStatus5 = math.floor(BiaoZhi2/10)
			local HunterStatus5,HunterStatus4,HunterStatus3,HunterStatus2 = F_Hor_GetHunterStatus(ActorID)


			if HunterStatus5 ~= 1 then
				API_SetHunterTimer(ActorID, 100, 1, lHunter, ContainerSize)
			end
end

-- ------------------------------------------------------------------------------
-- 玩家点击要点亮的猎魂师时回调
-- lActorID	: 玩家ID
-- lHunter	: 玩家要点亮的猎魂师ID[见上面的定义]
-- lStyle	: 方式(保留,暂时未用到)
-- ------------------------------------------------------------------------------
function OnHorcruxe_EnableHunter(lActorID, lHunter, lStyle)
	-- 获取玩家的猎魂师傅状态
	-- 扣除点亮代币
	-- 更新猎魂师状态
	local ActorID = lActorID or API_RequestGetActorID() 
--	local HunterStatus = API_VarDataGetNumber(ActorID,0,HunterStatusTye)
--	local BiaoZhi1 = math.mod(HunterStatus,100)
--	local BiaoZhi2 = math.floor(HunterStatus/100)
--	local HunterStatus2 = math.mod(BiaoZhi1,10)
--	local HunterStatus3 = math.floor(BiaoZhi1/10)
--	local HunterStatus4 = math.mod(BiaoZhi2,10)
--	local HunterStatus5 = math.floor(BiaoZhi2/10)
	local HunterStatus5,HunterStatus4,HunterStatus3,HunterStatus2 = F_Hor_GetHunterStatus(ActorID)
	local GoodsNum = API_ActorGetGoodsNum(ActorID,80818)
	if GoodsNum < 100 then
		API_ActorSendMsg(ActorID,3,'云游代金券数量不足')
		return
	end
	if lHunter == 4 then
		if HunterStatus5 ~= 1 then
			if API_ActorRemoveGoods(ActorID,80818,100,"删除对应数量的云游代金券") then
				API_UpdateHunterStatus(ActorID, 4, 1, 1)
				API_ActorSendMsg(ActorID,3,'成功点亮六星猎魂师')
--				HunterStatus = 1000 + HunterStatus4 * 100 + HunterStatus3 * 10 + HunterStatus2
				HunterStatus5 = 1
--				API_VarDataSetNumber(ActorID,0,HunterStatusTye,HunterStatus)
				F_Hor_SetNewHunterStatus(ActorID, HunterStatus5, HunterStatus4, HunterStatus3, HunterStatus2)
				local LuckNum = API_VarDataGetNumber(ActorID,1,30293)
				LuckNum = LuckNum + 1 
				API_VarDataSetNumber(ActorID,1,30293,LuckNum)
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[75][8][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[75][8][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[75][8][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][8][LaiYuan] + 1
				end
			else
				API_ActorSendMsg(ActorID,3,'扣除云游代金券失败')
			end
		else
			API_ActorSendMsg(ActorID,3,'猎魂师已处于点亮状态')
		end
	end
end

local QualityTable = {
[1] = {
		[1] = {ProValue = 9,Effect = 2063001},
		[2] = {ProValue = 9,Effect = 2063001},
		[3] = {ProValue = 9,Effect = 2063001},
		[4] = {ProValue = 9,Effect = 2063001},
		[5] = {ProValue = 9,Effect = 2063001},
		
		[6] = {ProValue = 10,Effect = 2063002},
		[7] = {ProValue = 10,Effect = 2063002},
		[8] = {ProValue = 10,Effect = 2063002},
		[9] = {ProValue = 10,Effect = 2063002},
		
		[10] = {ProValue = 11,Effect = 2063003},
		[11] = {ProValue = 11,Effect = 2063003},
		[12] = {ProValue = 11,Effect = 2063003},
		
		[13] = {ProValue = 12,Effect = 2063004},
		[14] = {ProValue = 12,Effect = 2063004},
		
		[15] = {ProValue = 13,Effect = 2063005},
		
		[16] = {ProValue = 14,Effect = 2065021},
		[17] = {ProValue = 14,Effect = 2065021},
		[18] = {ProValue = 14,Effect = 2065021},
		[19] = {ProValue = 14,Effect = 2065021},
		[20] = {ProValue = 14,Effect = 2065021},
		
		[21] = {ProValue = 15,Effect = 2065022},
		[22] = {ProValue = 15,Effect = 2065022},
		[23] = {ProValue = 15,Effect = 2065022},
		[24] = {ProValue = 15,Effect = 2065022},
		
		[25] = {ProValue = 16,Effect = 2065023},
		[26] = {ProValue = 16,Effect = 2065023},
		[27] = {ProValue = 16,Effect = 2065023},
		
		[28] = {ProValue = 17,Effect = 2065024},
		[29] = {ProValue = 17,Effect = 2065024},
		
		[30] = {ProValue = 18,Effect = 2065025},
	},
[2] = {
		[1] = {ProValue = 19,Effect = 2065001},
		[2] = {ProValue = 19,Effect = 2065001},
		[3] = {ProValue = 19,Effect = 2065001},
		[4] = {ProValue = 19,Effect = 2065001},
		[5] = {ProValue = 19,Effect = 2065001},
		
		[6] = {ProValue = 20,Effect = 2065002},
		[7] = {ProValue = 20,Effect = 2065002},
		[8] = {ProValue = 20,Effect = 2065002},
		[9] = {ProValue = 20,Effect = 2065002},
		
		[10] = {ProValue = 21,Effect = 2065003},
		[11] = {ProValue = 21,Effect = 2065003},
		[12] = {ProValue = 21,Effect = 2065003},
		
		[13] = {ProValue = 22,Effect = 2065004},
		[14] = {ProValue = 22,Effect = 2065004},
		
		[15] = {ProValue = 23,Effect = 2065005},
		
		[16] = {ProValue = 24,Effect = 2068001},
		[17] = {ProValue = 24,Effect = 2068001},
		[18] = {ProValue = 24,Effect = 2068001},
		[19] = {ProValue = 24,Effect = 2068001},
		[20] = {ProValue = 24,Effect = 2068001},
		
		[21] = {ProValue = 25,Effect = 2068002},
		[22] = {ProValue = 25,Effect = 2068002},
		[23] = {ProValue = 25,Effect = 2068002},
		[24] = {ProValue = 25,Effect = 2068002},
		
		[25] = {ProValue = 26,Effect = 2068003},
		[26] = {ProValue = 26,Effect = 2068003},
		[27] = {ProValue = 26,Effect = 2068003},
		
		[28] = {ProValue = 27,Effect = 2068004},
		[29] = {ProValue = 27,Effect = 2068004},
		
		[30] = {ProValue = 28,Effect = 2068005},
	},
[3] = {
		[1] = {ProValue = 19,Effect = 2065001},
		[2] = {ProValue = 19,Effect = 2065001},
		[3] = {ProValue = 19,Effect = 2065001},
		[4] = {ProValue = 19,Effect = 2065001},
		[5] = {ProValue = 19,Effect = 2065001},
		
		[6] = {ProValue = 20,Effect = 2065002},
		[7] = {ProValue = 20,Effect = 2065002},
		[8] = {ProValue = 20,Effect = 2065002},
		[9] = {ProValue = 20,Effect = 2065002},
		
		[10] = {ProValue = 21,Effect = 2065003},
		[11] = {ProValue = 21,Effect = 2065003},
		[12] = {ProValue = 21,Effect = 2065003},
		
		[13] = {ProValue = 22,Effect = 2065004},
		[14] = {ProValue = 22,Effect = 2065004},
		
		[15] = {ProValue = 23,Effect = 2065005},
		
		[16] = {ProValue = 49,Effect = 2068001},
		[17] = {ProValue = 49,Effect = 2068001},
		[18] = {ProValue = 49,Effect = 2068001},
		[19] = {ProValue = 49,Effect = 2068001},
		[20] = {ProValue = 49,Effect = 2068001},
		
		[21] = {ProValue = 50,Effect = 2068002},
		[22] = {ProValue = 50,Effect = 2068002},
		[23] = {ProValue = 50,Effect = 2068002},
		[24] = {ProValue = 50,Effect = 2068002},
		
		[25] = {ProValue = 51,Effect = 2068003},
		[26] = {ProValue = 51,Effect = 2068003},
		[27] = {ProValue = 51,Effect = 2068003},
		
		[28] = {ProValue = 52,Effect = 2068004},
		[29] = {ProValue = 52,Effect = 2068004},
		
		[30] = {ProValue = 53,Effect = 2068005},
	},
[4] = {
		[1] = {ProValue = 19,Effect = 2065001},
		[2] = {ProValue = 19,Effect = 2065001},
		[3] = {ProValue = 19,Effect = 2065001},
		[4] = {ProValue = 19,Effect = 2065001},
		[5] = {ProValue = 19,Effect = 2065001},
		
		[6] = {ProValue = 20,Effect = 2065002},
		[7] = {ProValue = 20,Effect = 2065002},
		[8] = {ProValue = 20,Effect = 2065002},
		[9] = {ProValue = 20,Effect = 2065002},
		
		[10] = {ProValue = 21,Effect = 2065003},
		[11] = {ProValue = 21,Effect = 2065003},
		[12] = {ProValue = 21,Effect = 2065003},
		
		[13] = {ProValue = 22,Effect = 2065004},
		[14] = {ProValue = 22,Effect = 2065004},
		
		[15] = {ProValue = 23,Effect = 2065005},
		
		[16] = {ProValue = 54,Effect = 2068001},
		[17] = {ProValue = 54,Effect = 2068001},
		[18] = {ProValue = 54,Effect = 2068001},
		[19] = {ProValue = 54,Effect = 2068001},
		[20] = {ProValue = 54,Effect = 2068001},
		
		[21] = {ProValue = 55,Effect = 2068002},
		[22] = {ProValue = 55,Effect = 2068002},
		[23] = {ProValue = 55,Effect = 2068002},
		[24] = {ProValue = 55,Effect = 2068002},
		
		[25] = {ProValue = 56,Effect = 2068003},
		[26] = {ProValue = 56,Effect = 2068003},
		[27] = {ProValue = 56,Effect = 2068003},
		
		[28] = {ProValue = 57,Effect = 2068004},
		[29] = {ProValue = 57,Effect = 2068004},
		
		[30] = {ProValue = 58,Effect = 2068005},
	},
[5] = {
		[1] = {ProValue = 29,Effect = 2065026},
		[2] = {ProValue = 29,Effect = 2065026},
		[3] = {ProValue = 29,Effect = 2065026},
		[4] = {ProValue = 29,Effect = 2065026},
		[5] = {ProValue = 29,Effect = 2065026},
		
		[6] = {ProValue = 30,Effect = 2065027},
		[7] = {ProValue = 30,Effect = 2065027},
		[8] = {ProValue = 30,Effect = 2065027},
		[9] = {ProValue = 30,Effect = 2065027},
		
		[10] = {ProValue = 31,Effect = 2065028},
		[11] = {ProValue = 31,Effect = 2065028},
		[12] = {ProValue = 31,Effect = 2065028},
		
		[13] = {ProValue = 32,Effect = 2065029},
		[14] = {ProValue = 32,Effect = 2065029},
		
		[15] = {ProValue = 33,Effect = 2065030},
		
		[16] = {ProValue = 34,Effect = 2067001},
		[17] = {ProValue = 34,Effect = 2067001},
		[18] = {ProValue = 34,Effect = 2067001},
		[19] = {ProValue = 34,Effect = 2067001},
		[20] = {ProValue = 34,Effect = 2067001},
		
		[21] = {ProValue = 35,Effect = 2067002},
		[22] = {ProValue = 35,Effect = 2067002},
		[23] = {ProValue = 35,Effect = 2067002},
		[24] = {ProValue = 35,Effect = 2067002},
		
		[25] = {ProValue = 36,Effect = 2067003},
		[26] = {ProValue = 36,Effect = 2067003},
		[27] = {ProValue = 36,Effect = 2067003},
		
		[28] = {ProValue = 37,Effect = 2067004},
		[29] = {ProValue = 37,Effect = 2067004},
		
		[30] = {ProValue = 38,Effect = 2067005},
	},
[6] = {
		[1] = {ProValue = 39,Effect = 2065031},
		[2] = {ProValue = 39,Effect = 2065031},
		[3] = {ProValue = 39,Effect = 2065031},
		[4] = {ProValue = 39,Effect = 2065031},
		[5] = {ProValue = 39,Effect = 2065031},
		
		[6] = {ProValue = 40,Effect = 2065032},
		[7] = {ProValue = 40,Effect = 2065032},
		[8] = {ProValue = 40,Effect = 2065032},
		[9] = {ProValue = 40,Effect = 2065032},
		
		[10] = {ProValue = 41,Effect = 2065033},
		[11] = {ProValue = 41,Effect = 2065033},
		[12] = {ProValue = 41,Effect = 2065033},
		
		[13] = {ProValue = 42,Effect = 2065034},
		[14] = {ProValue = 42,Effect = 2065034},
		
		[15] = {ProValue = 43,Effect = 2065035},
		
		[16] = {ProValue = 44,Effect = 2066001},
		[17] = {ProValue = 44,Effect = 2066001},
		[18] = {ProValue = 44,Effect = 2066001},
		[19] = {ProValue = 44,Effect = 2066001},
		[20] = {ProValue = 44,Effect = 2066001},
		
		[21] = {ProValue = 45,Effect = 2066002},
		[22] = {ProValue = 45,Effect = 2066002},
		[23] = {ProValue = 45,Effect = 2066002},
		[24] = {ProValue = 45,Effect = 2066002},
		
		[25] = {ProValue = 46,Effect = 2066003},
		[26] = {ProValue = 46,Effect = 2066003},
		[27] = {ProValue = 46,Effect = 2066003},
		
		[28] = {ProValue = 47,Effect = 2066004},
		[29] = {ProValue = 47,Effect = 2066004},
		
		[30] = {ProValue = 48,Effect = 2066005},
	},
[7] = {
		[1] = {ProValue = 60,Effect = 2064001},
		[2] = {ProValue = 60,Effect = 2064001},
		[3] = {ProValue = 60,Effect = 2064001},
		[4] = {ProValue = 60,Effect = 2064001},
		[5] = {ProValue = 60,Effect = 2064001},
		
		[6] = {ProValue = 61,Effect = 2064002},
		[7] = {ProValue = 61,Effect = 2064002},
		[8] = {ProValue = 61,Effect = 2064002},
		[9] = {ProValue = 61,Effect = 2064002},
		
		[10] = {ProValue = 62,Effect = 2064003},
		[11] = {ProValue = 62,Effect = 2064003},
		[12] = {ProValue = 62,Effect = 2064003},
		
		[13] = {ProValue = 63,Effect = 2064004},
		[14] = {ProValue = 63,Effect = 2064004},
		
		[15] = {ProValue = 64,Effect = 2064005},
		
		[16] = {ProValue = 65,Effect = 2067006},
		[17] = {ProValue = 65,Effect = 2067006},
		[18] = {ProValue = 65,Effect = 2067006},
		[19] = {ProValue = 65,Effect = 2067006},
		[20] = {ProValue = 65,Effect = 2067006},
		
		[21] = {ProValue = 66,Effect = 2067007},
		[22] = {ProValue = 66,Effect = 2067007},
		[23] = {ProValue = 66,Effect = 2067007},
		[24] = {ProValue = 66,Effect = 2067007},
		
		[25] = {ProValue = 67,Effect = 2067008},
		[26] = {ProValue = 67,Effect = 2067008},
		[27] = {ProValue = 67,Effect = 2067008},
		
		[28] = {ProValue = 68,Effect = 2067009},
		[29] = {ProValue = 68,Effect = 2067009},
		
		[30] = {ProValue = 69,Effect = 2067010},
	},
	
	[8] = {
		[1] = {ProValue = 73,Effect = 2065036},
		[2] = {ProValue = 73,Effect = 2065036},
		[3] = {ProValue = 73,Effect = 2065036},
		[4] = {ProValue = 73,Effect = 2065036},
		[5] = {ProValue = 73,Effect = 2065036},
		
		[6] = {ProValue = 74,Effect = 2065037},
		[7] = {ProValue = 74,Effect = 2065037},
		[8] = {ProValue = 74,Effect = 2065037},
		[9] = {ProValue = 74,Effect = 2065037},
		
		[10] = {ProValue = 75,Effect = 2065038},
		[11] = {ProValue = 75,Effect = 2065038},
		[12] = {ProValue = 75,Effect = 2065038},
		
		[13] = {ProValue = 76,Effect = 2065039},
		[14] = {ProValue = 76,Effect = 2065039},
		
		[15] = {ProValue = 77,Effect = 2065040},
		
		[16] = {ProValue = 88,Effect = 2065051},
		[17] = {ProValue = 88,Effect = 2065051},
		[18] = {ProValue = 88,Effect = 2065051},
		[19] = {ProValue = 88,Effect = 2065051},
		[20] = {ProValue = 88,Effect = 2065051},
		
		[21] = {ProValue = 89,Effect = 2065052},
		[22] = {ProValue = 89,Effect = 2065052},
		[23] = {ProValue = 89,Effect = 2065052},
		[24] = {ProValue = 89,Effect = 2065052},
		
		[25] = {ProValue = 90,Effect = 2065053},
		[26] = {ProValue = 90,Effect = 2065053},
		[27] = {ProValue = 90,Effect = 2065053},
		
		[28] = {ProValue = 91,Effect = 2065054},
		[29] = {ProValue = 91,Effect = 2065054},
		
		[30] = {ProValue = 92,Effect = 2065055},
	},
	
	
	[9] = {
		[1] = {ProValue = 83,Effect = 2065046},
		[2] = {ProValue = 83,Effect = 2065046},
		[3] = {ProValue = 83,Effect = 2065046},
		[4] = {ProValue = 83,Effect = 2065046},
		[5] = {ProValue = 83,Effect = 2065046},
		
		[6] = {ProValue = 84,Effect = 2065047},
		[7] = {ProValue = 84,Effect = 2065047},
		[8] = {ProValue = 84,Effect = 2065047},
		[9] = {ProValue = 84,Effect = 2065047},
		
		[10] = {ProValue = 85,Effect = 2065048},
		[11] = {ProValue = 85,Effect = 2065048},
		[12] = {ProValue = 85,Effect = 2065048},
		
		[13] = {ProValue = 86,Effect = 2065049},
		[14] = {ProValue = 86,Effect = 2065049},
		
		[15] = {ProValue = 87,Effect = 2065050},
		
		
		[16] = {ProValue = 88,Effect = 2065051},
		[17] = {ProValue = 88,Effect = 2065051},
		[18] = {ProValue = 88,Effect = 2065051},
		[19] = {ProValue = 88,Effect = 2065051},
		[20] = {ProValue = 88,Effect = 2065051},
		
		[21] = {ProValue = 89,Effect = 2065052},
		[22] = {ProValue = 89,Effect = 2065052},
		[23] = {ProValue = 89,Effect = 2065052},
		[24] = {ProValue = 89,Effect = 2065052},
		
		[25] = {ProValue = 90,Effect = 2065053},
		[26] = {ProValue = 90,Effect = 2065053},
		[27] = {ProValue = 90,Effect = 2065053},
		
		[28] = {ProValue = 91,Effect = 2065054},
		[29] = {ProValue = 91,Effect = 2065054},
		
		[30] = {ProValue = 92,Effect = 2065055},
	},
	
	
	[10] = {
		[1] = {ProValue = 78,Effect = 2065041},
		[2] = {ProValue = 78,Effect = 2065041},
		[3] = {ProValue = 78,Effect = 2065041},
		[4] = {ProValue = 78,Effect = 2065041},
		[5] = {ProValue = 78,Effect = 2065041},
		
		[6] = {ProValue = 79,Effect = 2065042},
		[7] = {ProValue = 79,Effect = 2065042},
		[8] = {ProValue = 79,Effect = 2065042},
		[9] = {ProValue = 79,Effect = 2065042},
		
		[10] = {ProValue = 80,Effect = 2065043},
		[11] = {ProValue = 80,Effect = 2065043},
		[12] = {ProValue = 80,Effect = 2065043},
		
		[13] = {ProValue = 81,Effect = 2065044},
		[14] = {ProValue = 81,Effect = 2065044},
		
		[15] = {ProValue = 82,Effect = 2065045},
		
		[16] = {ProValue = 88,Effect = 2065051},
		[17] = {ProValue = 88,Effect = 2065051},
		[18] = {ProValue = 88,Effect = 2065051},
		[19] = {ProValue = 88,Effect = 2065051},
		[20] = {ProValue = 88,Effect = 2065051},
		
		[21] = {ProValue = 89,Effect = 2065052},
		[22] = {ProValue = 89,Effect = 2065052},
		[23] = {ProValue = 89,Effect = 2065052},
		[24] = {ProValue = 89,Effect = 2065052},
		
		[25] = {ProValue = 90,Effect = 2065053},
		[26] = {ProValue = 90,Effect = 2065053},
		[27] = {ProValue = 90,Effect = 2065053},
		
		[28] = {ProValue = 91,Effect = 2065054},
		[29] = {ProValue = 91,Effect = 2065054},
		
		[30] = {ProValue = 92,Effect = 2065055},
	},
	
[11] = {
		[1] = {ProValue = 93,Effect = 3473001},
		[2] = {ProValue = 93,Effect = 3473001},
		[3] = {ProValue = 93,Effect = 3473001},
		[4] = {ProValue = 93,Effect = 3473001},
		[5] = {ProValue = 93,Effect = 3473001},
		
		[6] = {ProValue = 94,Effect = 3473002},
		[7] = {ProValue = 94,Effect = 3473002},
		[8] = {ProValue = 94,Effect = 3473002},
		[9] = {ProValue = 94,Effect = 3473002},
		
		[10] = {ProValue = 95,Effect = 3473003},
		[11] = {ProValue = 95,Effect = 3473003},
		[12] = {ProValue = 95,Effect = 3473003},
		
		[13] = {ProValue = 172,Effect = 3473004},
		[14] = {ProValue = 172,Effect = 3473004},
		
		[15] = {ProValue = 173,Effect = 3473005},
		
		[16] = {ProValue = 121,Effect = 3475021},
		[17] = {ProValue = 121,Effect = 3475021},
		[18] = {ProValue = 121,Effect = 3475021},
		[19] = {ProValue = 121,Effect = 3475021},
		[20] = {ProValue = 121,Effect = 3475021},
		
		[21] = {ProValue = 122,Effect = 3475022},
		[22] = {ProValue = 122,Effect = 3475022},
		[23] = {ProValue = 122,Effect = 3475022},
		[24] = {ProValue = 122,Effect = 3475022},
		
		[25] = {ProValue = 123,Effect = 3475023},
		[26] = {ProValue = 123,Effect = 3475023},
		[27] = {ProValue = 123,Effect = 3475023},
		
		[28] = {ProValue = 124,Effect = 3475024},
		[29] = {ProValue = 124,Effect = 3475024},
		
		[30] = {ProValue = 125,Effect = 3475025},
	},
[12] = {
		[1] = {ProValue = 101,Effect = 3475001},
		[2] = {ProValue = 101,Effect = 3475001},
		[3] = {ProValue = 101,Effect = 3475001},
		[4] = {ProValue = 101,Effect = 3475001},
		[5] = {ProValue = 101,Effect = 3475001},
		
		[6] = {ProValue = 102,Effect = 3475002},
		[7] = {ProValue = 102,Effect = 3475002},
		[8] = {ProValue = 102,Effect = 3475002},
		[9] = {ProValue = 102,Effect = 3475002},
		
		[10] = {ProValue = 103,Effect = 3475003},
		[11] = {ProValue = 103,Effect = 3475003},
		[12] = {ProValue = 103,Effect = 3475003},
		
		[13] = {ProValue = 104,Effect = 3475004},
		[14] = {ProValue = 104,Effect = 3475004},
		
		[15] = {ProValue = 105,Effect = 3475005},
		
		[16] = {ProValue = 106,Effect = 3478001},
		[17] = {ProValue = 106,Effect = 3478001},
		[18] = {ProValue = 106,Effect = 3478001},
		[19] = {ProValue = 106,Effect = 3478001},
		[20] = {ProValue = 106,Effect = 3478001},
		
		[21] = {ProValue = 107,Effect = 3478002},
		[22] = {ProValue = 107,Effect = 3478002},
		[23] = {ProValue = 107,Effect = 3478002},
		[24] = {ProValue = 107,Effect = 3478002},
		
		[25] = {ProValue = 108,Effect = 3478003},
		[26] = {ProValue = 108,Effect = 3478003},
		[27] = {ProValue = 108,Effect = 3478003},
		
		[28] = {ProValue = 109,Effect = 3478004},
		[29] = {ProValue = 109,Effect = 3478004},
		
		[30] = {ProValue = 110,Effect = 3478005},
	},
[13] = {
		[1] = {ProValue = 101,Effect = 3475001},
		[2] = {ProValue = 101,Effect = 3475001},
		[3] = {ProValue = 101,Effect = 3475001},
		[4] = {ProValue = 101,Effect = 3475001},
		[5] = {ProValue = 101,Effect = 3475001},
		
		[6] = {ProValue = 102,Effect = 3475002},
		[7] = {ProValue = 102,Effect = 3475002},
		[8] = {ProValue = 102,Effect = 3475002},
		[9] = {ProValue = 102,Effect = 3475002},
		
		[10] = {ProValue = 103,Effect = 3475003},
		[11] = {ProValue = 103,Effect = 3475003},
		[12] = {ProValue = 103,Effect = 3475003},
		
		[13] = {ProValue = 104,Effect = 3475004},
		[14] = {ProValue = 104,Effect = 3475004},
		
		[15] = {ProValue = 105,Effect = 3475004},
		
		[16] = {ProValue = 111,Effect = 3478001},
		[17] = {ProValue = 111,Effect = 3478001},
		[18] = {ProValue = 111,Effect = 3478001},
		[19] = {ProValue = 111,Effect = 3478001},
		[20] = {ProValue = 111,Effect = 3478001},
		
		[21] = {ProValue = 112,Effect = 3478002},
		[22] = {ProValue = 112,Effect = 3478002},
		[23] = {ProValue = 112,Effect = 3478002},
		[24] = {ProValue = 112,Effect = 3478002},
		
		[25] = {ProValue = 113,Effect = 3478003},
		[26] = {ProValue = 113,Effect = 3478003},
		[27] = {ProValue = 113,Effect = 3478003},
		
		[28] = {ProValue = 114,Effect = 3478004},
		[29] = {ProValue = 114,Effect = 3478004},
		
		[30] = {ProValue = 115,Effect = 3478005},
	},
[14] = {
		[1] = {ProValue = 101,Effect = 3475001},
		[2] = {ProValue = 101,Effect = 3475001},
		[3] = {ProValue = 101,Effect = 3475001},
		[4] = {ProValue = 101,Effect = 3475001},
		[5] = {ProValue = 101,Effect = 3475001},
		
		[6] = {ProValue = 102,Effect = 3475002},
		[7] = {ProValue = 102,Effect = 3475002},
		[8] = {ProValue = 102,Effect = 3475002},
		[9] = {ProValue = 102,Effect = 3475002},
		
		[10] = {ProValue = 103,Effect = 3475003},
		[11] = {ProValue = 103,Effect = 3475003},
		[12] = {ProValue = 103,Effect = 3475003},
		
		[13] = {ProValue = 104,Effect = 3475004},
		[14] = {ProValue = 104,Effect = 3475004},
		
		[15] = {ProValue = 105,Effect = 3475004},
		
		[16] = {ProValue = 116,Effect = 3478001},
		[17] = {ProValue = 116,Effect = 3478001},
		[18] = {ProValue = 116,Effect = 3478001},
		[19] = {ProValue = 116,Effect = 3478001},
		[20] = {ProValue = 116,Effect = 3478001},
		
		[21] = {ProValue = 117,Effect = 3478002},
		[22] = {ProValue = 117,Effect = 3478002},
		[23] = {ProValue = 117,Effect = 3478002},
		[24] = {ProValue = 117,Effect = 3478002},
		
		[25] = {ProValue = 118,Effect = 3478003},
		[26] = {ProValue = 118,Effect = 3478003},
		[27] = {ProValue = 118,Effect = 3478003},
		
		[28] = {ProValue = 119,Effect = 3478004},
		[29] = {ProValue = 119,Effect = 3478004},
		
		[30] = {ProValue = 120,Effect = 3478005},
	},
[15] = {
		[1] = {ProValue = 126,Effect = 3475026},
		[2] = {ProValue = 126,Effect = 3475026},
		[3] = {ProValue = 126,Effect = 3475026},
		[4] = {ProValue = 126,Effect = 3475026},
		[5] = {ProValue = 126,Effect = 3475026},
		
		[6] = {ProValue = 127,Effect = 3475027},
		[7] = {ProValue = 127,Effect = 3475027},
		[8] = {ProValue = 127,Effect = 3475027},
		[9] = {ProValue = 127,Effect = 3475027},
		
		[10] = {ProValue = 128,Effect = 3475028},
		[11] = {ProValue = 128,Effect = 3475028},
		[12] = {ProValue = 128,Effect = 3475028},
		
		[13] = {ProValue = 129,Effect = 3475029},
		[14] = {ProValue = 129,Effect = 3475029},
		
		[15] = {ProValue = 130,Effect = 3475030},
		
		[16] = {ProValue = 161,Effect = 3477001},
		[17] = {ProValue = 161,Effect = 3477001},
		[18] = {ProValue = 161,Effect = 3477001},
		[19] = {ProValue = 161,Effect = 3477001},
		[20] = {ProValue = 161,Effect = 3477001},
		
		[21] = {ProValue = 162,Effect = 3477002},
		[22] = {ProValue = 162,Effect = 3477002},
		[23] = {ProValue = 162,Effect = 3477002},
		[24] = {ProValue = 162,Effect = 3477002},
		
		[25] = {ProValue = 162,Effect = 3477003},
		[26] = {ProValue = 162,Effect = 3477003},
		[27] = {ProValue = 162,Effect = 3477003},
		
		[28] = {ProValue = 163,Effect = 3477004},
		[29] = {ProValue = 163,Effect = 3477004},
		
		[30] = {ProValue = 163,Effect = 3477005},
	},
[16] = {
		[1] = {ProValue = 131,Effect = 3475031},
		[2] = {ProValue = 131,Effect = 3475031},
		[3] = {ProValue = 131,Effect = 3475031},
		[4] = {ProValue = 131,Effect = 3475031},
		[5] = {ProValue = 131,Effect = 3475031},
		
		[6] = {ProValue = 132,Effect = 3475032},
		[7] = {ProValue = 132,Effect = 3475032},
		[8] = {ProValue = 132,Effect = 3475032},
		[9] = {ProValue = 132,Effect = 3475032},
		
		[10] = {ProValue = 133,Effect = 3475033},
		[11] = {ProValue = 133,Effect = 3475033},
		[12] = {ProValue = 133,Effect = 3475033},
		
		[13] = {ProValue = 134,Effect = 3475034},
		[14] = {ProValue = 134,Effect = 3475034},
		
		[15] = {ProValue = 135,Effect = 3475035},
		
		[16] = {ProValue = 156,Effect = 3476001},
		[17] = {ProValue = 156,Effect = 3476001},
		[18] = {ProValue = 156,Effect = 3476001},
		[19] = {ProValue = 156,Effect = 3476001},
		[20] = {ProValue = 156,Effect = 3476001},
		
		[21] = {ProValue = 157,Effect = 3476002},
		[22] = {ProValue = 157,Effect = 3476002},
		[23] = {ProValue = 157,Effect = 3476002},
		[24] = {ProValue = 157,Effect = 3476002},
		
		[25] = {ProValue = 158,Effect = 3476003},
		[26] = {ProValue = 158,Effect = 3476003},
		[27] = {ProValue = 158,Effect = 3476003},
		
		[28] = {ProValue = 159,Effect = 3476004},
		[29] = {ProValue = 159,Effect = 3476004},
		
		[30] = {ProValue = 160,Effect = 3476005},
	},
[17] = {
		[1] = {ProValue = 96,Effect = 3474001},
		[2] = {ProValue = 96,Effect = 2064001},
		[3] = {ProValue = 96,Effect = 2064001},
		[4] = {ProValue = 96,Effect = 2064001},
		[5] = {ProValue = 96,Effect = 2064001},
		
		[6] = {ProValue = 97,Effect = 2064002},
		[7] = {ProValue = 97,Effect = 2064002},
		[8] = {ProValue = 97,Effect = 2064002},
		[9] = {ProValue = 97,Effect = 2064002},
		
		[10] = {ProValue = 98,Effect = 2064003},
		[11] = {ProValue = 98,Effect = 2064003},
		[12] = {ProValue = 98,Effect = 2064003},
		
		[13] = {ProValue = 99,Effect = 2064004},
		[14] = {ProValue = 99,Effect = 2064004},
		
		[15] = {ProValue = 100,Effect = 2064005},
		
		[16] = {ProValue = 166,Effect = 3477006},
		[17] = {ProValue = 166,Effect = 3477006},
		[18] = {ProValue = 166,Effect = 3477006},
		[19] = {ProValue = 166,Effect = 3477006},
		[20] = {ProValue = 166,Effect = 3477006},
		
		[21] = {ProValue = 167,Effect = 3477007},
		[22] = {ProValue = 167,Effect = 3477007},
		[23] = {ProValue = 167,Effect = 3477007},
		[24] = {ProValue = 167,Effect = 3477007},
		
		[25] = {ProValue = 168,Effect = 3477008},
		[26] = {ProValue = 168,Effect = 3477008},
		[27] = {ProValue = 168,Effect = 3477008},
		
		[28] = {ProValue = 169,Effect = 3477009},
		[29] = {ProValue = 169,Effect = 3477009},
		
		[30] = {ProValue = 170,Effect = 3477010},
	},
	
	[18] = {
		[1] = {ProValue = 136,Effect = 3475036},
		[2] = {ProValue = 136,Effect = 3475036},
		[3] = {ProValue = 136,Effect = 3475036},
		[4] = {ProValue = 136,Effect = 3475036},
		[5] = {ProValue = 136,Effect = 3475036},
		
		[6] = {ProValue = 137,Effect = 3475037},
		[7] = {ProValue = 137,Effect = 3475037},
		[8] = {ProValue = 137,Effect = 3475037},
		[9] = {ProValue = 137,Effect = 3475037},
		
		[10] = {ProValue = 138,Effect = 3475038},
		[11] = {ProValue = 138,Effect = 3475038},
		[12] = {ProValue = 138,Effect = 3475038},
		
		[13] = {ProValue = 139,Effect = 3475039},
		[14] = {ProValue = 139,Effect = 3475039},
		
		[15] = {ProValue = 140,Effect = 3475040},
		
		[16] = {ProValue = 151,Effect = 3475051},
		[17] = {ProValue = 151,Effect = 3475051},
		[18] = {ProValue = 151,Effect = 3475051},
		[19] = {ProValue = 151,Effect = 3475051},
		[20] = {ProValue = 151,Effect = 3475051},
		
		[21] = {ProValue = 152,Effect = 3475052},
		[22] = {ProValue = 152,Effect = 3475052},
		[23] = {ProValue = 152,Effect = 3475052},
		[24] = {ProValue = 152,Effect = 3475052},
		
		[25] = {ProValue = 153,Effect = 3475053},
		[26] = {ProValue = 153,Effect = 3475053},
		[27] = {ProValue = 153,Effect = 3475053},
		
		[28] = {ProValue = 154,Effect = 3475054},
		[29] = {ProValue = 154,Effect = 3475054},
		
		[30] = {ProValue = 155,Effect = 3475055},
	},
	
	
	[19] = {
		[1] = {ProValue = 141,Effect = 3475041},
		[2] = {ProValue = 141,Effect = 3475041},
		[3] = {ProValue = 141,Effect = 3475041},
		[4] = {ProValue = 141,Effect = 3475041},
		[5] = {ProValue = 141,Effect = 3475041},
		
		[6] = {ProValue = 142,Effect = 3475042},
		[7] = {ProValue = 142,Effect = 3475042},
		[8] = {ProValue = 142,Effect = 3475042},
		[9] = {ProValue = 142,Effect = 3475042},
		
		[10] = {ProValue = 143,Effect = 3475043},
		[11] = {ProValue = 143,Effect = 3475043},
		[12] = {ProValue = 143,Effect = 3475043},
		
		[13] = {ProValue = 144,Effect = 3475044},
		[14] = {ProValue = 144,Effect = 3475044},
		
		[15] = {ProValue = 145,Effect = 3475045},
		
		
		[16] = {ProValue = 151,Effect = 3475051},
		[17] = {ProValue = 151,Effect = 3475051},
		[18] = {ProValue = 151,Effect = 3475051},
		[19] = {ProValue = 151,Effect = 3475051},
		[20] = {ProValue = 151,Effect = 3475051},
		
		[21] = {ProValue = 152,Effect = 3475052},
		[22] = {ProValue = 152,Effect = 3475052},
		[23] = {ProValue = 152,Effect = 3475052},
		[24] = {ProValue = 152,Effect = 3475052},
		
		[25] = {ProValue = 153,Effect = 3475053},
		[26] = {ProValue = 153,Effect = 3475053},
		[27] = {ProValue = 153,Effect = 3475053},
		
		[28] = {ProValue = 154,Effect = 3475054},
		[29] = {ProValue = 154,Effect = 3475054},
		
		[30] = {ProValue = 155,Effect = 3475055},
	},
	
	
	[20] = {
		[1] = {ProValue = 146,Effect = 3475046},
		[2] = {ProValue = 146,Effect = 3475046},
		[3] = {ProValue = 146,Effect = 3475046},
		[4] = {ProValue = 146,Effect = 3475046},
		[5] = {ProValue = 146,Effect = 3475046},
		
		[6] = {ProValue = 147,Effect = 3475047},
		[7] = {ProValue = 147,Effect = 3475047},
		[8] = {ProValue = 147,Effect = 3475047},
		[9] = {ProValue = 147,Effect = 3475047},
		
		[10] = {ProValue = 148,Effect = 3475048},
		[11] = {ProValue = 148,Effect = 3475048},
		[12] = {ProValue = 148,Effect = 3475048},
		
		[13] = {ProValue = 149,Effect = 3475049},
		[14] = {ProValue = 149,Effect = 3475049},
		
		[15] = {ProValue = 150,Effect = 3475050},
		
		[16] = {ProValue = 151,Effect = 3475051},
		[17] = {ProValue = 151,Effect = 3475051},
		[18] = {ProValue = 151,Effect = 3475051},
		[19] = {ProValue = 151,Effect = 3475051},
		[20] = {ProValue = 151,Effect = 3475051},
		
		[21] = {ProValue = 152,Effect = 3475052},
		[22] = {ProValue = 152,Effect = 3475052},
		[23] = {ProValue = 152,Effect = 3475052},
		[24] = {ProValue = 152,Effect = 3475052},
		
		[25] = {ProValue = 153,Effect = 3475053},
		[26] = {ProValue = 153,Effect = 3475053},
		[27] = {ProValue = 153,Effect = 3475053},
		
		[28] = {ProValue = 154,Effect = 3475054},
		[29] = {ProValue = 154,Effect = 3475054},
		
		[30] = {ProValue = 155,Effect = 3475055},
	},
}

-- ------------------------------------------------------------------------------
-- 玩家点击打开隐藏属性时回调
-- lActorID	: 玩家ID
-- lLocation	: 武魂所在位置,LUA不要改变,在设置武魂隐藏属性时用
-- lPropertyID	: 玩家要打开的隐藏属性位置,LUA不要改变,在设置武魂隐藏属性时用
-- lQuality	: 当前武魂的品质(备用)
-- lLevel	: 当前武魂的等级(备用)
-- ------------------------------------------------------------------------------
--激活
function OnHorcruxe_Property(lActorID, lLocation, lProLoc, lQuality, lLevel ,nAreaType ,lGoodsID)
	-- 随机出一个隐藏属性
	-- 扣除相关道具
	-- 设置隐藏属性

	local GoodsNum = API_ActorGetGoodsNum(lActorID,89186)
	if GoodsNum < 100 then
		API_ActorSendMsg(lActorID,3,'勇士勋章数量不足')
		return
	end

	if API_ActorRemoveGoods(lActorID,89186,100,"删除对应数量的勇士勋章") then
		local Quality = 0 
		local GoodsID = lGoodsID
		for j,v in ShengMing do
			if GoodsID == v then
				Quality = 1
			end
		end
		
		for j,v in WuLiGongJi do
			if GoodsID == v then
				Quality = 2
			end
		end
		
		for j,v in HuoYaoGongJi do
			if GoodsID == v then
				Quality = 3
			end
		end
		
		for j,v in MoFaGongJi do
			if GoodsID == v then
				Quality = 4
			end
		end
		
		for j,v in BaoJi do
			if GoodsID == v then
				Quality = 5
			end
		end

		for j,v in BaoJiDiKang do
			if GoodsID == v then
				Quality = 6
			end
		end
		
		for j,v in NengLiang do
			if GoodsID == v then
				Quality = 7
			end
		end
		
		for j,v in WuFang do
			if GoodsID == v then
				Quality = 8
			end
		end

		for j,v in HuoFang do
			if GoodsID == v then
				Quality = 9
			end
		end
		
		for j,v in MoFang do
			if GoodsID == v then
				Quality = 10
			end
		end
	
		for j,v in LShengMing do
			if GoodsID == v then
				Quality = 11
			end
		end
		
		for j,v in LWuLiGongJi do
			if GoodsID == v then
				Quality = 12
			end
		end
		
		for j,v in LHuoYaoGongJi do
			if GoodsID == v then
				Quality = 13
			end
		end
		
		for j,v in LMoFaGongJi do
			if GoodsID == v then
				Quality = 14
			end
		end
		
		for j,v in LBaoJi do
			if GoodsID == v then
				Quality = 15
			end
		end

		for j,v in LBaoJiDiKang do
			if GoodsID == v then
				Quality = 16
			end
		end
		
		for j,v in LNengLiang do
			if GoodsID == v then
				Quality = 17
			end
		end
		
		for j,v in LWuFang do
			if GoodsID == v then
				Quality = 18
			end
		end

		for j,v in LHuoFang do
			if GoodsID == v then
				Quality = 19
			end
		end
		
		for j,v in LMoFang do
			if GoodsID == v then
				Quality = 20
			end
		end
		
		local QualityTable = QualityTable[Quality][math.random(table.getn(QualityTable[Quality]))]
		local ProValue = QualityTable.ProValue
		local AreaType = nAreaType
		API_SetHorcruxesProperty(lActorID, lLocation, lProLoc, ProValue, AreaType)
		--风向标
		local LaiYuan = API_ActorGetPropNum(lActorID,201)
		if GLOBAL_FengXiangBiao_DateList[75][11][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[75][11][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[75][11][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][11][LaiYuan] + 1
		end
	end
end

--洗炼
function OnHorcruxe_FlushProperty(lActorID, lLocation, lPropertyID, lQuality, lLevel, lAreaType, lLockedNum, lGoodsID)
	local Year,Month,Day,Hour,Minute,Second = PublicFun_time()
	local NowTime =os.time()
	local ActorID = lActorID or API_RequestGetActorID()
	local XiLianTime = API_VarDataGetNumber(ActorID,1,30297)
	local XiLianDate = os.date("*t", XiLianTime)
	local LC_XiLianYear = XiLianDate.year
	local LC_XiLianMonth = XiLianDate.month
	local LC_XiLianDay = XiLianDate.day
	local NeedGoodNum = 100
	if lLockedNum == 1 then
		NeedGoodNum = 300
	end

	if lPropertyID == 0 then
		API_VarDataSetNumber(ActorID,1,30296,0)
		API_VarDataSetNumber(ActorID,1,30298,0)
	elseif lPropertyID == 1 then
		API_VarDataSetNumber(ActorID,1,30296,lPropertyID)
	elseif lPropertyID == 2 then
		API_VarDataSetNumber(ActorID,1,30298,lPropertyID)
	end
	
	
	if Year ~= LC_XiLianYear or Month ~= LC_XiLianMonth or Day ~= LC_XiLianDay then
		NeedGoodNum = 0
	end
	if lPropertyID == 0 then
		API_ResponseWrite('<win rect="280,250,300,140"></win>')
		API_ResponseWrite('<name>洗炼</name>')
		API_ResponseWrite('<text>   本次洗炼将消耗'..NeedGoodNum..'云游，确定洗炼魂器吗？</text><br>')
		API_ResponseWrite('<br><a href="OnHorcruxe_XiLian?1=100&2='..lLocation..'&3='..lPropertyID..'&4='..lAreaType..'&5='..lLockedNum..'&6='..lGoodsID..'">确定</a><br>')
		API_ResponseWrite('<br><a>取消</a>')
		API_ResponseFlush(lActorID)
	end
end

function OnHorcruxe_XiLian()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local lLocation = API_RequestGetNumber(2)
	local lPropertyID = API_RequestGetNumber(3)
	local lAreaType = API_RequestGetNumber(4)
	local lLockedNum = API_RequestGetNumber(5)
	local lGoodsID = API_RequestGetNumber(6)
	local Year,Month,Day,Hour,Minute,Second = PublicFun_time()
	local NowTime =os.time()
	local NeedGoodNum = 100
	if lLockedNum == 1 then
		NeedGoodNum = 300
	end
	
	if SelectItem == 100 then
		local Quality = 0 
		local GoodsID = lGoodsID
		for j,v in ShengMing do
			if GoodsID == v then
				Quality = 1
			end
		end
		
		for j,v in WuLiGongJi do
			if GoodsID == v then
				Quality = 2
			end
		end
		
		for j,v in HuoYaoGongJi do
			if GoodsID == v then
				Quality = 3
			end
		end
		
		for j,v in MoFaGongJi do
			if GoodsID == v then
				Quality = 4
			end
		end
		
		for j,v in BaoJi do
			if GoodsID == v then
				Quality = 5
			end
		end

		for j,v in BaoJiDiKang do
			if GoodsID == v then
				Quality = 6
			end
		end
		
		for j,v in NengLiang do
			if GoodsID == v then
				Quality = 7
			end
		end
		
		for j,v in WuFang do
			if GoodsID == v then
				Quality = 8
			end
		end

		for j,v in HuoFang do
			if GoodsID == v then
				Quality = 9
			end
		end
		
		for j,v in MoFang do
			if GoodsID == v then
				Quality = 10
			end
		end
		
		for j,v in LShengMing do
			if GoodsID == v then
				Quality = 11
			end
		end
		
		for j,v in LWuLiGongJi do
			if GoodsID == v then
				Quality = 12
			end
		end
		
		for j,v in LHuoYaoGongJi do
			if GoodsID == v then
				Quality = 13
			end
		end
		
		for j,v in LMoFaGongJi do
			if GoodsID == v then
				Quality = 14
			end
		end
		
		for j,v in LBaoJi do
			if GoodsID == v then
				Quality = 15
			end
		end

		for j,v in LBaoJiDiKang do
			if GoodsID == v then
				Quality = 16
			end
		end
		
		for j,v in LNengLiang do
			if GoodsID == v then
				Quality = 17
			end
		end
		
		for j,v in LWuFang do
			if GoodsID == v then
				Quality = 18
			end
		end

		for j,v in LHuoFang do
			if GoodsID == v then
				Quality = 19
			end
		end
		
		for j,v in LMoFang do
			if GoodsID == v then
				Quality = 20
			end
		end
		
		local XiLianTime = API_VarDataGetNumber(ActorID,1,30297)
		local XiLianDate = os.date("*t", XiLianTime)
		local LC_XiLianYear = XiLianDate.year
		local LC_XiLianMonth = XiLianDate.month
		local LC_XiLianDay = XiLianDate.day
		if Year ~= LC_XiLianYear or Month ~= LC_XiLianMonth or Day ~= LC_XiLianDay then
			if API_VarDataGetNumber(ActorID,1,30296) ~= 0 then
				local QualityTable = QualityTable[Quality][math.random(table.getn(QualityTable[Quality]))]
				local ProValue = QualityTable.ProValue
				API_SetHorcruxesProperty(ActorID, lLocation, 1, ProValue, lAreaType)
			end
			if API_VarDataGetNumber(ActorID,1,30298) ~= 0 then
				local QualityTable = QualityTable[Quality][math.random(table.getn(QualityTable[Quality]))]
				local ProValue = QualityTable.ProValue
				API_SetHorcruxesProperty(ActorID, lLocation, 2, ProValue, lAreaType)
			end
			API_VarDataSetNumber(ActorID,1,30296,0)
			API_VarDataSetNumber(ActorID,1,30298,0)
			API_VarDataSetNumber(ActorID,1,30297,NowTime)
			return
		end
		local GoodsNum = API_ActorGetGoodsNum(ActorID,80818)
		if GoodsNum < NeedGoodNum then
			API_VarDataSetNumber(ActorID,1,30296,0)
			API_VarDataSetNumber(ActorID,1,30298,0)
			API_ActorSendMsg(ActorID,3,'扣除云游代金券失败，您身上的云游代金券数量不够。')
			return
		end
		if API_ActorRemoveGoods(ActorID,80818,NeedGoodNum,"删除对应数量的云游代金券") then	
			if API_VarDataGetNumber(ActorID,1,30296) ~= 0 then
				local QualityTable = QualityTable[Quality][math.random(table.getn(QualityTable[Quality]))]
				local ProValue = QualityTable.ProValue
				API_SetHorcruxesProperty(ActorID, lLocation, 1, ProValue, lAreaType)
			end
			if API_VarDataGetNumber(ActorID,1,30298) ~= 0 then
				local QualityTable = QualityTable[Quality][math.random(table.getn(QualityTable[Quality]))]
				local ProValue = QualityTable.ProValue
				API_SetHorcruxesProperty(ActorID, lLocation, 2, ProValue, lAreaType)
			end
			API_VarDataSetNumber(ActorID,1,30296,0)
			API_VarDataSetNumber(ActorID,1,30298,0)
			--风向标
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if lLockedNum == 1 then
				if GLOBAL_FengXiangBiao_DateList[75][10][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[75][10][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[75][10][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][10][LaiYuan] + 1
				end
			else
				if GLOBAL_FengXiangBiao_DateList[75][9][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[75][9][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[75][9][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][9][LaiYuan] + 1
				end
			end
		else
			API_VarDataSetNumber(ActorID,1,30296,0)
			API_VarDataSetNumber(ActorID,1,30298,0)
			API_ActorSendMsg(ActorID,3,'扣除云游代金券失败，您身上的云游代金券数量不够。')
			return
		end	
	else
		API_ResponseWrite('<win rect="280,2000,300,140"></win>')
		API_ResponseWrite('<name>洗炼</name>')
		API_ResponseWrite('<text>   洗炼窗口已关闭或魂器改变，请重新洗炼。</text><br>')
		API_ResponseFlush(ActorID)
	end
end

--创建时间触发器
if API_GetServerID() == 1 then
	if LieHun_TimeTriggerGID ~= nil then
		API_DestroyTriggerG(LieHun_TimeTriggerGID)
	end
	local LieHun_TimeTriggerGID = API_CreateTimerTriggerG(0,0,120,-1,'LieHun_ShuJuQingChu')	
end

function LieHun_ShuJuQingChu(Param1,Param2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.time()
	--设置五星武魂奖励上限数量
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6020,1,5) and API_GetServerID() == 1 then
		local Num5 = API_VarDataGetNumber_Ex(1,0,-6020,1,1)
		Num5 = Num5 + 1 
		if Num5 > 48 then
			Num5 = 1
			API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,2,0)
		end
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,1,Num5)
		local NextTime = math.random(900,1800)
		local NextQingChuTime = NowTime + NextTime
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,5,NextQingChuTime)
	end
	--设置四星武魂奖励上限数量
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6020,1,6) and API_GetServerID() == 1 then
		local Num4 = API_VarDataGetNumber_Ex(1,0,-6020,1,3)
		Num4 = Num4 + 1 
		if Num4 > 96 then
			Num4 = 1
			API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,4,0)
		end
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,3,Num4)
		local NextQingChuTime = NowTime + 900
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,6,NextQingChuTime)
	end
end


-- long API_DataSetBit(long lData, long lBitIndex, long lValue)
-- long API_DataGetBit(long lData, long lBitIndex)

function F_Hor_GetHunterStatus(lActorID)

	local HunterStatus = API_VarDataGetNumber(lActorID,1,HunterStatusTye)
	
	if 1==HunterStatus then
		return 0,0,0,1
	end

	if HunterStatus>1111 then
		-- 新的保存方式		
		return F_Hor_GetNewHunterStatus(HunterStatus)
	end

	if 256==HunterStatus then
		return 0,0,1,0
	end

	if 257==HunterStatus then
		return 0,0,1,1
	end

	-- 下面是用旧的保存方式的数据
	local BiaoZhi1 = math.mod(HunterStatus,100)
	local BiaoZhi2 = math.floor(HunterStatus/100)
	local HunterStatus2 = math.mod(BiaoZhi1,10)
	local HunterStatus3 = math.floor(BiaoZhi1/10)
	local HunterStatus4 = math.mod(BiaoZhi2,10)
	local HunterStatus5 = math.floor(BiaoZhi2/10)

	F_Hor_SetNewHunterStatus(lActorID, HunterStatus5,HunterStatus4,HunterStatus3,HunterStatus2)

	return HunterStatus5,HunterStatus4,HunterStatus3,HunterStatus2
end


function F_Hor_GetNewHunterStatus(HunterStatus)

	local HunterStatus5 = API_DataGetBit(HunterStatus, 24)
	local HunterStatus4 = API_DataGetBit(HunterStatus, 16)
	local HunterStatus3 = API_DataGetBit(HunterStatus, 8)
	local HunterStatus2 = API_DataGetBit(HunterStatus, 0)

	return HunterStatus5,HunterStatus4,HunterStatus3,HunterStatus2
end

-- 用新的方式保存数据
function F_Hor_SetNewHunterStatus(lActorID, HunterStatus5,HunterStatus4,HunterStatus3,HunterStatus2)
	local lHunterStatus = 0

	lHunterStatus = API_DataSetBit(lHunterStatus, 0, HunterStatus2)
	lHunterStatus = API_DataSetBit(lHunterStatus, 8, HunterStatus3)	
	lHunterStatus = API_DataSetBit(lHunterStatus, 16, HunterStatus4)
	lHunterStatus = API_DataSetBit(lHunterStatus, 24, HunterStatus5)

	API_VarDataSetNumber(lActorID,1,HunterStatusTye,lHunterStatus)
end



--魂器商人
local HorHunter_StartTime = {Year = 2011,Month = 7,Day = 9,Hour = 0,Minute = 0,Second = 0}
local HorHunter_EndTime = {Year = 2020,Month = 1,Day = 1,Hour = 0,Minute = 0,Second = 0}

if API_GetServerID() == 1 then
	if HorHunter_TimeTriggerGID ~= nil then
		API_DestroyTriggerG(HorHunter_TimeTriggerGID)
	end
	HorHunter_TimeTriggerGID = API_CreateTimerTriggerG(0,0,10,1,'LC_HorHunter_ServerOpen')
end

function LC_HorHunter_ServerOpen()
	if API_GetServerID() == 1 then
		local StartTimeTable = HorHunter_StartTime
		local EndTimeTable = HorHunter_EndTime
		local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
		local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
		if nShiFouStart > 0 then
			--活动未开始
			LC_HorHunter_DestroyNPC()
			if LC_HorHunter_StartDateTimeTriggerGID == nil then
				LC_HorHunter_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'LC_HorHunter_CreateNPC')
			else
				API_DestroyTriggerG(LC_HorHunter_StartDateTimeTriggerGID)
				LC_HorHunter_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'LC_HorHunter_CreateNPC')
			end
			if LC_HorHunter_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(LC_HorHunter_EndDateTimeTriggerGID)
			end
		elseif nShiFouStart <= 0 then
			--活动开始
			LC_HorHunter_CreateNPC()
			if LC_HorHunter_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(LC_HorHunter_StartDateTimeTriggerGID)
			end
--		elseif nShiFouEnd <= 0 then
--			--活动结束
--			LC_ZhanBeiJunXuGuan_DestroyNPC()
--			if LC_XunZhangHuoDong_StartDateTimeTriggerGID ~= nil then
--				API_DestroyTriggerG(LC_XunZhangHuoDong_StartDateTimeTriggerGID)
--			end
--			if LC_XunZhangHuoDong_EndDateTimeTriggerGID ~= nil then
--				API_DestroyTriggerG(LC_XunZhangHuoDong_EndDateTimeTriggerGID)
--			end
		end
	end

end

function LC_HorHunter_CreateNPC()
	--创建帝国活动npc
	if API_GetServerID() == 1 then
		if HorHunter_DGNPCFastID1 == nil then
			HorHunter_DGNPCFastID1 = API_CreateMonsterEx(1,12378,266,211,4,0,-1,1)
		else
			if API_GetMonsterID(HorHunter_DGNPCFastID1) > 0 then
				API_DestroyMonster(HorHunter_DGNPCFastID1)
			end
			HorHunter_DGNPCFastID1 = API_CreateMonsterEx(1,12378,266,211,4,0,-1,1)
		end
	end
--	if API_GetServerID() == 7 then
--		if ZhanBeiJunXuGuan_DGNPCFastID2 == nil then
--			ZhanBeiJunXuGuan_DGNPCFastID2 = API_CreateMonsterEx(111,12361,244,516,3,0,-1,1)
--		else
--			if API_GetMonsterID(ZhanBeiJunXuGuan_DGNPCFastID2) > 0 then
--				API_DestroyMonster(ZhanBeiJunXuGuan_DGNPCFastID2)
--			end
--			ZhanBeiJunXuGuan_DGNPCFastID2 = API_CreateMonsterEx(111,12361,244,516,3,0,-1,1)
--		end
--	end
	--创建联邦活动npc
	if API_GetServerID() == 1 then
		if HorHunter_LBNPCFastID1 == nil then
			HorHunter_LBNPCFastID1 = API_CreateMonsterEx(2,12378,245,179,4,0,-1,1)
		else
			if API_GetMonsterID(HorHunter_LBNPCFastID1) > 0 then
				API_DestroyMonster(HorHunter_LBNPCFastID1)
			end
			HorHunter_LBNPCFastID1 = API_CreateMonsterEx(2,12378,245,179,4,0,-1,1)
		end
	end
--	if API_GetServerID() == 7 then
--		if ZhanBeiJunXuGuan_LBNPCFastID2 == nil then
--			ZhanBeiJunXuGuan_LBNPCFastID2 = API_CreateMonsterEx(111,12361,331,183,3,0,-1,1)
--		else
--			if API_GetMonsterID(ZhanBeiJunXuGuan_LBNPCFastID2) > 0 then
--				API_DestroyMonster(ZhanBeiJunXuGuan_LBNPCFastID2)
--			end
--			ZhanBeiJunXuGuan_LBNPCFastID2 = API_CreateMonsterEx(111,12361,331,183,3,0,-1,1)
--		end
--	end
	
--	local StartTimeTable = RongYuXunZhang_StartTime
--	local EndTimeTable = RongYuXunZhang_EndTime	
	
	--创结束触发器
--	if DuanWuJieHuoDong_EndDateTimeTriggerGID == nil then
--		LC_XunZhangHuoDong_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'LC_ZhanBeiJunXuGuan_DestroyNPC')
--	else
--		API_DestroyTriggerG(DuanWuJieHuoDong_EndDateTimeTriggerGID)
--		LC_XunZhangHuoDong_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'LC_ZhanBeiJunXuGuan_DestroyNPC')
--	end
end

function LC_HorHunter_DestroyNPC()
	--删除帝国活动npc
	if HorHunter_DGNPCFastID1 ~= nil then
		if API_GetMonsterID(HorHunter_DGNPCFastID1) > 0 then
			API_DestroyMonster(HorHunter_DGNPCFastID1)
		end
	end
--	if ZhanBeiJunXuGuan_DGNPCFastID2 ~= nil then
--		if API_GetMonsterID(ZhanBeiJunXuGuan_DGNPCFastID2) > 0 then
--			API_DestroyMonster(ZhanBeiJunXuGuan_DGNPCFastID2)
--		end
--	end
	--删除联邦活动npc
	if HorHunter_LBNPCFastID1 ~= nil then
		if API_GetMonsterID(HorHunter_LBNPCFastID1) > 0 then
			API_DestroyMonster(HorHunter_LBNPCFastID1)
		end
	end
--	if ZhanBeiJunXuGuan_LBNPCFastID2 ~= nil then
--		if API_GetMonsterID(ZhanBeiJunXuGuan_LBNPCFastID2) > 0 then
--			API_DestroyMonster(ZhanBeiJunXuGuan_LBNPCFastID2)
--		end
--	end
end

local HorHunter_String = {
[8] = {GoodsID = 11572,Name = '血战之魂[★★★★★]'},
[9] = {GoodsID = 11578,Name = '火女之魂[★★★★★]'},
[10] = {GoodsID = 11562,Name = '剑圣之魂[★★★★★]'},
[11] = {GoodsID = 11583,Name = '女王之魂[★★★★★]'},
[12] = {GoodsID = 11593,Name = '枪神之魂[★★★★★]'},
[13] = {GoodsID = 11567,Name = '屠夫之魂[★★★★★]'},
[14] = {GoodsID = 11588,Name = '冰女之魂[★★★★★]'},
[15] = {GoodsID = 11557,Name = '狼女之魂[★★★★★]'},
[17] = {GoodsID = 11618,Name = '浪客之魂[★★★★★]'},
[18] = {GoodsID = 11668,Name = '骑士之魂[★★★★★]'},
[19] = {GoodsID = 11673,Name = '冰霜之魂[★★★★★]'},
[20] = {GoodsID = 11678,Name = '修罗之魂[★★★★★]'},
}

local HorHunter_LiuXing = {
[8] = {GoodsID = 11712,Name = '血战之魂[★★★★★★]'},
[9] = {GoodsID = 11713,Name = '火女之魂[★★★★★★]'},
[10] = {GoodsID = 11710,Name = '剑圣之魂[★★★★★★]'},
[11] = {GoodsID = 11714,Name = '女王之魂[★★★★★★]'},
[12] = {GoodsID = 11716,Name = '枪神之魂[★★★★★★]'},
[13] = {GoodsID = 11711,Name = '屠夫之魂[★★★★★★]'},
[14] = {GoodsID = 11715,Name = '冰女之魂[★★★★★★]'},
[15] = {GoodsID = 11709,Name = '狼女之魂[★★★★★★]'},
[17] = {GoodsID = 11717,Name = '浪客之魂[★★★★★★]'},
[18] = {GoodsID = 11718,Name = '骑士之魂[★★★★★★]'},
[19] = {GoodsID = 11719,Name = '冰霜之魂[★★★★★★]'},
[20] = {GoodsID = 11720,Name = '修罗之魂[★★★★★★]'},
}


local HorHunterShopDate = {8,9,10,11,12,13,14,15,17,18,19,20}

function HorHunter_TraderTask(ActorID,NPCID)
	local ActorID = API_RequestGetActorID()
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
--	local ExpLevel = API_GetActorExpLevel(ActorID)
--	local XuanZe = API_RequestGetNumber(1)
	
	API_ResponseWrite('<name>魂器商人</name>')
	API_ResponseWrite('<text>    失落的英雄之魂散落在英雄岛大陆，每个人都在寻找属于自己的那一个，看看我这里是否有你需要的魂器！</text><br><br>')
	--API_ResponseWrite('<text>    当然你也可以用  </text><img srcgd="89213" tipgd="89213"><text>  和  </text><img srcgd="83121" tipgd="83121"><text>  来收买我哦！</text><br><br>')
	API_ResponseWrite('<br><a href="HorHunter_TraderTaskChange?1=1">五星魂器兑换</a><br>')
	API_ResponseWrite('<br><a href="HorHunter_LiuXingChange?1=1">六星魂器兑换</a><br>')
	--API_ResponseWrite('<br><a href="HunQi_NpcExchange?1=1">肮脏的PY交易</a><br>')
	API_ResponseWrite('<br><a>关闭</a>')
end

local WuXingHunQiTable = {
[11572] = {PropertyID = 3,QualityID = 4,Exp = 480},
[11618] = {PropertyID = 59,QualityID = 4,Exp = 480},
[11578] = {PropertyID = 4,QualityID = 4,Exp = 480},
[11562] = {PropertyID = 2,QualityID = 4,Exp = 480},
[11583] = {PropertyID = 5,QualityID = 4,Exp = 480},
[11593] = {PropertyID = 7,QualityID = 4,Exp = 480},
[11567] = {PropertyID = 8,QualityID = 4,Exp = 480},
[11588] = {PropertyID = 6,QualityID = 4,Exp = 480},
[11557] = {PropertyID = 1,QualityID = 4,Exp = 480},
[11668] = {PropertyID = 70,QualityID = 4,Exp = 480},
[11673] = {PropertyID = 71,QualityID = 4,Exp = 480},
[11678] = {PropertyID = 72,QualityID = 4,Exp = 480},
}

function HorHunter_TraderTaskChange()
		local ActorID = API_RequestGetActorID()
		API_ResponseWrite('<name></name>') 
		API_ResponseWrite('<win rect="120, 190, 300, 350" alpha="240" balpha="230"></win>') 
		if API_RequestGetNumber(2) == 1 then
			local XuanZe = API_RequestGetNumber(3)
			local GoodsID = HorHunter_String[XuanZe].GoodsID
			local PropertyID = WuXingHunQiTable[GoodsID].PropertyID
			local QualityID = WuXingHunQiTable[GoodsID].QualityID
			local Exp = WuXingHunQiTable[GoodsID].Exp
			if API_ActorGetPackageSize(ActorID) < 1 then
				API_ResponseWrite('<br><text>请将背包空出1个位置，方可进行合成！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			local UidHigh1 = API_RequestGetNumber(100)--高位UID
			local UidLow1 = API_RequestGetNumber(1100)--低位UID
			local Uid1 = API_GetUID(UidHigh1,UidLow1) --获取UID
			local BoxID1,LocID1 = API_GetUIDGoodsInActor(Uid1,ActorID)--背包ID 和 位置
			local GoodsID1 = API_GetUIDGoodsPropNum(Uid1,0)--提交的物品ID	
			local UidHigh2 = API_RequestGetNumber(200)--高位UID
			local UidLow2 = API_RequestGetNumber(1200)--低位UID
			local Uid2 = API_GetUID(UidHigh2,UidLow2) --获取UID	
			local BoxID2,LocID2 = API_GetUIDGoodsInActor(Uid2,ActorID)--背包ID 和 位置
			local GoodsID2 = API_GetUIDGoodsPropNum(Uid2,0)--提交的物品ID
			local ShengYuShuLiang = API_VarDataGetNumber_Ex(1,0,-6020,1,XuanZe)
			
			if ShengYuShuLiang <= 0 then
				API_ResponseWrite('<br><text>抱歉您选择兑换的魂器已经被抢先兑换完了，欢迎明天12点之后再来兑换。</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			
			if GoodsID1 <= 0 or GoodsID2 <= 0 then
				API_ResponseWrite('<br><text>请放入两个五星武魂，才可以正常兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if WuXingHunQiTable[GoodsID1] == nil or WuXingHunQiTable[GoodsID2] == nil then
				API_ResponseWrite('<br><text>此物品不在指定兑换范围内！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			local ContainerSize = API_GetHorcruxesEmptySize(ActorID, 2)
			if ContainerSize <= 0 then
				API_ResponseWrite('<br><text>请至少保持猎魂背包中有一个空位，再进行兑换。</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if API_RemoveHorcruxesByUID(Uid1, ActorID) and API_RemoveHorcruxesByUID(Uid2, ActorID) then
				local String = HorHunter_String[XuanZe].Name
				API_ActorNewHorcruxes(ActorID, GoodsID, PropertyID, QualityID, Exp)
				API_ResponseWrite('<name>魂器商人</name>')
				API_ResponseWrite('<br><text>成功兑换一个</text><text color="255,215,0">'..String..'</text><text>，请打开猎魂背包查看。</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')	
				API_ActorSendMsg(ActorID,0,'成功兑换1个'..String..'，请打开猎魂背包查看。')
				API_ActorSendMsg(ActorID,7,'成功兑换1个'..String..'，请打开猎魂背包查看。')	
				local Number = API_VarDataGetNumber_Ex(1,0,-6020,1,XuanZe)
				API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,XuanZe,Number)				
			end
		else
			local Stock = 0
			for i,v in HorHunterShopDate do
				local Number = API_VarDataGetNumber_Ex(1,0,-6020,1,v)
				if Number > 0 then
					Stock = Stock + 1
				end
			end
			API_ResponseWrite('<name>魂器商人</name>')
			if Stock ~= 0 then
				API_ResponseWrite('<text>    使用任意两个五星英雄之魂可以选择兑换一个指定的五星英雄之魂。放入闲置的五星英雄之魂，选择你需要的英雄之魂进行兑换。</text><br>') 
				API_ResponseWrite('<br><text>   </text><goodsHolder name="100"><text>    </text><goodsHolder name="200"><br>')
			else
				API_ResponseWrite('<text>    抱歉勇士，五星英雄之魂已经被兑换完了，每日12点会补满库存，请到时候再来兑换。</text><br>') 				
			end
			for i,v in HorHunterShopDate do
				local Number = API_VarDataGetNumber_Ex(1,0,-6020,1,v)
				local String = HorHunter_String[v].Name
				if Number > 0 then
					API_ResponseWrite('<br><a href="HorHunter_TraderTaskChange?2=1&3='..v..'">兑换'..String..'</a>')
				end
			end
			API_ResponseWrite('<br><br><a>关闭</a>')
		end
end

local LiuXingHunQiTable = {
	[11709] = {PropertyID = 1,QualityID = 5,Exp = 960},
	[11710] = {PropertyID = 2,QualityID = 5,Exp = 960},
	[11712] = {PropertyID = 3,QualityID = 5,Exp = 960},
	[11713] = {PropertyID = 4,QualityID = 5,Exp = 960},
	[11714] = {PropertyID = 5,QualityID = 5,Exp = 960},
	[11715] = {PropertyID = 6,QualityID = 5,Exp = 960},
	[11716] = {PropertyID = 7,QualityID = 5,Exp = 960},
	[11711] = {PropertyID = 8,QualityID = 5,Exp = 960},
	[11717] = {PropertyID = 59,QualityID = 5,Exp = 960},
	[11718] = {PropertyID = 70,QualityID = 5,Exp = 960},
	[11719] = {PropertyID = 71,QualityID = 5,Exp = 960},
	[11720] = {PropertyID = 72,QualityID = 5,Exp = 960},
}


function HorHunter_LiuXingChange()
		local ActorID = API_RequestGetActorID()
		API_ResponseWrite('<name></name>') 
		API_ResponseWrite('<win rect="120, 190, 300, 350" alpha="240" balpha="230"></win>') 
		if API_RequestGetNumber(2) == 1 then
			local XuanZe = API_RequestGetNumber(3)
			local GoodsID = HorHunter_LiuXing[XuanZe].GoodsID
			local PropertyID = LiuXingHunQiTable[GoodsID].PropertyID
			local QualityID = LiuXingHunQiTable[GoodsID].QualityID
			local Exp = LiuXingHunQiTable[GoodsID].Exp
			if API_ActorGetPackageSize(ActorID) < 1 then
				API_ResponseWrite('<br><text>请将背包空出1个位置，方可进行合成！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			local UidHigh1 = API_RequestGetNumber(100)--高位UID
			local UidLow1 = API_RequestGetNumber(1100)--低位UID
			local Uid1 = API_GetUID(UidHigh1,UidLow1) --获取UID
			local BoxID1,LocID1 = API_GetUIDGoodsInActor(Uid1,ActorID)--背包ID 和 位置
			local GoodsID1 = API_GetUIDGoodsPropNum(Uid1,0)--提交的物品ID	
			local UidHigh2 = API_RequestGetNumber(200)--高位UID
			local UidLow2 = API_RequestGetNumber(1200)--低位UID
			local Uid2 = API_GetUID(UidHigh2,UidLow2) --获取UID	
			local BoxID2,LocID2 = API_GetUIDGoodsInActor(Uid2,ActorID)--背包ID 和 位置
			local GoodsID2 = API_GetUIDGoodsPropNum(Uid2,0)--提交的物品ID
			local ShengYuShuLiang = API_VarDataGetNumber_Ex(1,0,-6020,1,XuanZe)
			
			if ShengYuShuLiang <= 0 then
				API_ResponseWrite('<br><text>抱歉您选择兑换的魂器已经被抢先兑换完了，欢迎明天12点之后再来兑换。</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			
			if GoodsID1 <= 0 or GoodsID2 <= 0 then
				API_ResponseWrite('<br><text>请放入两个六星武魂，才可以正常兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if LiuXingHunQiTable[GoodsID1] == nil or LiuXingHunQiTable[GoodsID2] == nil then
				API_ResponseWrite('<br><text>此物品不在指定兑换范围内！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			local ContainerSize = API_GetHorcruxesEmptySize(ActorID, 2)
			if ContainerSize <= 0 then
				API_ResponseWrite('<br><text>请至少保持猎魂背包中有一个空位，再进行兑换。</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if API_RemoveHorcruxesByUID(Uid1, ActorID) and API_RemoveHorcruxesByUID(Uid2, ActorID) then
				local String = HorHunter_LiuXing[XuanZe].Name
				API_ActorNewHorcruxes(ActorID, GoodsID, PropertyID, QualityID, Exp)
				API_ResponseWrite('<name>魂器商人</name>')
				API_ResponseWrite('<br><text>成功兑换一个</text><text color="255,215,0">'..String..'</text><text>，请打开猎魂背包查看。</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')	
				API_ActorSendMsg(ActorID,0,'成功兑换1个'..String..'，请打开猎魂背包查看。')
				API_ActorSendMsg(ActorID,7,'成功兑换1个'..String..'，请打开猎魂背包查看。')	
				local Number = API_VarDataGetNumber_Ex(1,0,-6020,1,XuanZe)
				API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,XuanZe,Number)				
			end
		else
			local Stock = 0
			for i,v in HorHunterShopDate do
				local Number = API_VarDataGetNumber_Ex(1,0,-6020,1,v)
				if Number > 0 then
					Stock = Stock + 1
				end
			end
			API_ResponseWrite('<name>魂器商人</name>')
			if Stock ~= 0 then
				API_ResponseWrite('<text>    使用任意两个六星英雄之魂可以选择兑换一个指定的六星英雄之魂。放入闲置的六星英雄之魂，选择你需要的英雄之魂进行兑换。</text><br>') 
				API_ResponseWrite('<br><text>   </text><goodsHolder name="100"><text>    </text><goodsHolder name="200"><br>')
			else
				API_ResponseWrite('<text>    抱歉勇士，六星英雄之魂已经被兑换完了，每日12点会补满库存，请到时候再来兑换。</text><br>') 				
			end
			for i,v in HorHunterShopDate do
				local Number = API_VarDataGetNumber_Ex(1,0,-6020,1,v)
				local String = HorHunter_LiuXing[v].Name
				if Number > 0 then
					API_ResponseWrite('<br><a href="HorHunter_LiuXingChange?2=1&3='..v..'">兑换'..String..'</a>')
				end
			end
			API_ResponseWrite('<br><br><a>关闭</a>')
		end
end


HunQi_ExchangeGoodsList = {
	[1] = {
		{GoodsID = 	89249	,PT = 	15	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	89250	,PT = 	150	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	89196	,PT = 	300	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	89001	,PT = 	600	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	89251	,PT = 	999	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	31012	,PT = 	15	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	31013	,PT = 	15	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	31040	,PT = 	1000	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	31041	,PT = 	1000	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	31044	,PT = 	1000	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	31045	,PT = 	1000	,GJ = 	0	,Data=0,Max=0,},
		{GoodsID = 	31039	,PT = 	9999	,GJ = 	0	,Data=0,Max=0,},
		},
}

function HunQi_NpcExchange()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	local NPCID = API_RequestGetNumber(4)
	if HunQi_ExchangeGoodsList[SelectItem] == nil then
		return
	end
	if type(HunQi_ExchangeGoodsList[SelectItem]) ~= 'table' then
		return
	end
	local PTGoodsID = 89213
	local GJGoodsID = 83121
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if HunQi_ExchangeGoodsList[SelectItem][BuyNo] ~= nil then
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
			local YMD = Year * 10000 + Month * 100 + Day
			local GoodsID = HunQi_ExchangeGoodsList[SelectItem][BuyNo].GoodsID
			local PT = HunQi_ExchangeGoodsList[SelectItem][BuyNo].PT
			local GJ = HunQi_ExchangeGoodsList[SelectItem][BuyNo].GJ
			local Data = HunQi_ExchangeGoodsList[SelectItem][BuyNo].Data
			local Max = HunQi_ExchangeGoodsList[SelectItem][BuyNo].Max
			local BuyNum = API_RequestGetNumber(num)
			if BuyNum < 1 then
				BuyNum = 1
			elseif BuyNum > 999 then
				BuyNum = 999
			end
			local PTNum = API_ActorGetGoodsNum(ActorID,PTGoodsID)
			local GJNum = API_ActorGetGoodsNum(ActorID,GJGoodsID)
			if Data > 0 and Max > 0 then
				local Num = API_VarDataGetNumber(ActorID,1,Data)
				if Num + BuyNum > Max then
					BuyNum = Max - Num
				end
				if BuyNum <= 0 then
					API_ResponseWrite('<text>每天只能兑换'..Max..'个'..API_GetGoodsName(GoodsID)..'，该物品今天您的兑换数量已达上限，请明天再来兑换。</text><br>')
					API_ResponseWrite('<br><a href="HorHunter_TraderTask">  返回</a>')
					return
				end
			end
			PT = PT * BuyNum
			GJ = GJ * BuyNum
			if PT > 0 and GJ > 0 then
				if PTNum >= PT then
					if GJNum >= GJ then
						if API_ActorCanAddGoods(ActorID,GoodsID,BuyNum,1,0) ~= -1 then
							if API_ActorRemoveGoods(ActorID,PTGoodsID,PT,"魂器商人删除") and API_ActorRemoveGoods(ActorID,GJGoodsID,GJ,"魂器商人删除") then
								if Data > 0 and Max > 0 then
									local Num = API_VarDataGetNumber(ActorID,1,Data)
									Num = Num + BuyNum
									API_VarDataSetNumber(ActorID,1,Data,Num)
									API_VarDataSetNumber(ActorID,1,11910,YMD)
								end
								API_AddActorGoodsFlag(ActorID, GoodsID, BuyNum, 1, '魂器商人兑换')
								API_ActorSendMsg(ActorID,7,'使用'..PT..'个'..API_GetGoodsName(PTGoodsID)..'和'..GJ..'个'..API_GetGoodsName(GJGoodsID)..'兑换了：'..API_GetGoodsName(GoodsID)..'  × '..BuyNum..'')
								API_ResponseWrite('<name>魂器商人</name>')
								API_ResponseWrite('<text>兑换获得：</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
								API_ResponseWrite('<br><a href="HorHunter_TraderTask">  返回</a>')
								--风向标
								if GLOBAL_FengXiangBiao_DateList[69][BuyGoodsID] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[69][BuyGoodsID][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[69][BuyGoodsID][LaiYuan] = BuyNum
									else
										GLOBAL_FengXiangBiao_DateList[69][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[69][BuyGoodsID][LaiYuan] + BuyNum
									end
								end
							end
						else
							API_ResponseWrite('<text>背包空间不足，无法兑换。</text><br>')
							API_ResponseWrite('<br><a href="HorHunter_TraderTask">  返回</a>')
						end
					else
						API_ResponseWrite('<text>你的'..API_GetGoodsName(GJGoodsID)..'数量不足，无法兑换。</text><br>')
						API_ResponseWrite('<br><a href="HorHunter_TraderTask">  返回</a>')
					end
				else
					API_ResponseWrite('<text>你的'..API_GetGoodsName(PTGoodsID)..'数量不足，无法兑换。</text><br>')
					API_ResponseWrite('<br><a href="HorHunter_TraderTask">  返回</a>')
				end
			elseif PT == 0 and GJ > 0 then
				if GJNum >= GJ then
					if API_ActorCanAddGoods(ActorID,GoodsID,BuyNum,1,0) ~= -1 then
						if API_ActorRemoveGoods(ActorID,GJGoodsID,GJ,"魂器商人删除") then
							if Data > 0 and Max > 0 then
								local Num = API_VarDataGetNumber(ActorID,1,Data)
								Num = Num + BuyNum
								API_VarDataSetNumber(ActorID,1,Data,Num)
								API_VarDataSetNumber(ActorID,1,11910,YMD)
							end
							API_AddActorGoodsFlag(ActorID, GoodsID, BuyNum, 1, '魂器商人兑换')
							API_ActorSendMsg(ActorID,7,'使用'..GJ..'个'..API_GetGoodsName(GJGoodsID)..'兑换了：'..API_GetGoodsName(GoodsID)..'  × '..BuyNum..'')
							API_ResponseWrite('<name>魂器商人</name>')
							API_ResponseWrite('<text>兑换获得：</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
							API_ResponseWrite('<br><a href="HorHunter_TraderTask">  返回</a>')
						end
					else
						API_ResponseWrite('<text>背包空间不足，无法兑换。</text><br>')
						API_ResponseWrite('<br><a href="HorHunter_TraderTask">  返回</a>')
					end
				else
					API_ResponseWrite('<text>你的'..API_GetGoodsName(GJGoodsID)..'数量不足，无法兑换。</text><br>')
					API_ResponseWrite('<br><a href="HorHunter_TraderTask">  返回</a>')
				end
			elseif PT > 0 and GJ == 0 then
				if PTNum >= PT then
					if API_ActorCanAddGoods(ActorID,GoodsID,BuyNum,1,0) ~= -1 then
						if API_ActorRemoveGoods(ActorID,PTGoodsID,PT,"魂器商人删除") then
							if Data > 0 and Max > 0 then
								local Num = API_VarDataGetNumber(ActorID,1,Data)
								Num = Num + BuyNum
								API_VarDataSetNumber(ActorID,1,Data,Num)
								API_VarDataSetNumber(ActorID,1,11910,YMD)
							end
							API_AddActorGoodsFlag(ActorID, GoodsID, BuyNum, 1, '魂器商人兑换')
							API_ActorSendMsg(ActorID,7,'使用'..PT..'个'..API_GetGoodsName(PTGoodsID)..'兑换了：'..API_GetGoodsName(GoodsID)..'  × '..BuyNum..'')
							API_ResponseWrite('<name>魂器商人</name>')
							API_ResponseWrite('<text>兑换获得：</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
							API_ResponseWrite('<br><a href="HorHunter_TraderTask">  返回</a>')
						end
					else
						API_ResponseWrite('<text>背包空间不足，无法兑换。</text><br>')
						API_ResponseWrite('<br><a href="HorHunter_TraderTask">  返回</a>')
					end
				else
					API_ResponseWrite('<text>你的'..API_GetGoodsName(PTGoodsID)..'数量不足，无法兑换。</text><br>')
					API_ResponseWrite('<br><a href="HorHunter_TraderTask">  返回</a>')
				end
			end
		end
		return
	end
	local GoodsNum = table.getn(HunQi_ExchangeGoodsList[SelectItem])
	API_ResponseWrite('<name>魂器物品兑换</name>')
	API_ResponseWrite('<win rect="30,75,500,510"></win>')
	for i = 1,GoodsNum do
		if i > Page * 6 and i < (Page + 1) * 6 + 1 then
			local GoodsID = HunQi_ExchangeGoodsList[SelectItem][i].GoodsID
			local PT = HunQi_ExchangeGoodsList[SelectItem][i].PT
			local GJ = HunQi_ExchangeGoodsList[SelectItem][i].GJ
			local Data = HunQi_ExchangeGoodsList[SelectItem][i].Data
			local Max = HunQi_ExchangeGoodsList[SelectItem][i].Max
			API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(GoodsID)..'</text><br>')
			API_ResponseWrite('<img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'">')
			local BuyNumTip = '  兑换需要：'
			if PT > 0 and GJ > 0 then
				BuyNumTip = BuyNumTip..''..API_GetGoodsName(PTGoodsID)..' x '..PT..'、'..API_GetGoodsName(GJGoodsID)..' x '..GJ..'  '
			elseif GJ > 0 and PT == 0 then
				BuyNumTip = BuyNumTip..''..API_GetGoodsName(GJGoodsID)..' x '..GJ..'  '
			elseif PT > 0 and GJ == 0 then
				BuyNumTip = BuyNumTip..''..API_GetGoodsName(PTGoodsID)..' x '..PT..'  '
			end
			if Data > 0 and Max > 0 then
				local Num = API_VarDataGetNumber(ActorID,1,Data)
				local a = Max - Num
				BuyNumTip = BuyNumTip..'('..a..'/'..Max..')  '
			end
			local BuyNumTipLen = string.len(BuyNumTip)
			if BuyNumTipLen < 50 then
				for j = 1,50- BuyNumTipLen do
					BuyNumTip = BuyNumTip..' '
				end
			end
			API_ResponseWrite('<text color="255,0,255">'..BuyNumTip..'</text>')
			local num = i * 100
			--API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
			API_ResponseWrite('<text> </text>')
			API_ResponseWrite('<img src="LuaUse\\button Exchange_u.bmp" src2="LuaUse\\button Exchange_l.bmp" close="0" href="HunQi_NpcExchange?1='..SelectItem..'&2='..Page..'&3='..i..'&4='..NPCID..'"><br>')
			API_ResponseWrite('<text>—————————————————————————————————————</text><br>')
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
			API_ResponseWrite('<br><img src="LuaUse\\button_back_g.bmp"><text>                   </text>')
			API_ResponseWrite('<a href="HorHunter_TraderTask">返回</a>')
			API_ResponseWrite('<text>                   </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="HunQi_NpcExchange?1='..SelectItem..'&2='..NextPage..'&4='..NPCID..'">')
		elseif (Page + 1) * 6 < GoodsNum then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="HunQi_NpcExchange?1='..SelectItem..'&2='..BackPage..'&4='..NPCID..'"><text>                   </text>')
			API_ResponseWrite('<a href="HorHunter_TraderTask">返回</a>')
			API_ResponseWrite('<text>                   </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="HunQi_NpcExchange?1='..SelectItem..'&2='..NextPage..'&4='..NPCID..'">')
		else
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="HunQi_NpcExchange?1='..SelectItem..'&2='..BackPage..'&4='..NPCID..'"><text>                   </text>')
			API_ResponseWrite('<a href="HorHunter_TraderTask">返回</a>')
			API_ResponseWrite('<text>                   </text><img src="LuaUse\\button_next_g.bmp">')
		end
	else
		API_ResponseWrite('<br><a href="HorHunter_TraderTask">  返回</a>')
	end
end

if API_GetServerID() == 1 then
	if HorHunterShuJu_TimeTriggerGID ~= nil then
		API_DestroyTriggerG(HorHunterShuJu_TimeTriggerGID)
	end
	HorHunterShuJu_TimeTriggerGID = API_CreateTimerTriggerG(0,0,10,-1,'LC_HorHunter_ShuJuQingChu')
end


function LC_HorHunter_ShuJuQingChu()
	--设置奖励上限数量
	if API_GetServerID() == 1 then
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,8,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,9,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,10,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,11,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,12,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,13,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,14,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,15,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,17,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,18,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,19,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6020,1,20,1)
	end
end

local HorHunterGeZi = 30311
local HorHunterChuShiTime = 30312


--魂器装备格开放状态回调
function HorHunter_GetBoxLockState(lActorID)
	if lActorID == nil then
		lActorID = API_RequestGetActorID()
	end
	local HorHunterChuShi = API_VarDataGetNumber(lActorID,1,HorHunterGeZi)
	return HorHunterChuShi
end

--魂器初始化
function HorHunter_OnLogin(ActorID)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local begintime = HorHunter_StartTime.Year * 10000 + HorHunter_StartTime.Month * 100 + HorHunter_StartTime.Day
	local usetime = API_VarDataGetNumber(ActorID,1,HorHunterChuShiTime)
	if usetime < begintime then
		local HorHunterChuShi = API_VarDataGetNumber(ActorID,1,HorHunterGeZi)
		local lHunterEquip = 0
		lHunterEquip = API_DataSetBit(lHunterEquip, 0, 1)
		lHunterEquip = API_DataSetBit(lHunterEquip, 1, 1)	
		lHunterEquip = API_DataSetBit(lHunterEquip, 2, 1)
		lHunterEquip = API_DataSetBit(lHunterEquip, 3, 0)
		lHunterEquip = API_DataSetBit(lHunterEquip, 4, 0)
		lHunterEquip = API_DataSetBit(lHunterEquip, 5, 0)
		API_VarDataSetNumber(ActorID,1,HorHunterGeZi,lHunterEquip)
		API_VarDataSetNumber(ActorID,1,HorHunterChuShiTime,begintime)
	end
end

--魂器开格子
function HorHunter_OpenGrid(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID() 
	local HorHunterChuShi = API_VarDataGetNumber(ActorID,1,HorHunterGeZi)
	local GoodsNum = API_ActorGetGoodsNum(ActorID,89199)
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 100 then
		if GoodsNum < 100 then
			API_ActorSendMsg(ActorID,3,'特制金属数量不足，需要100个才能开启一个魂器装备格。')
			return 0
		end
		if API_DataGetBit(HorHunterChuShi, 3) == 1 then
			API_ActorSendMsg(ActorID,3,'魂器装备格已达到开放上限')
			return 0
		end
		if API_ActorRemoveGoods(ActorID,89199,100,"删除特制金属") then
			local lHunterEquip = 0
			lHunterEquip = API_DataSetBit(lHunterEquip, 0, 1)
			lHunterEquip = API_DataSetBit(lHunterEquip, 1, 1)	
			lHunterEquip = API_DataSetBit(lHunterEquip, 2, 1)
			lHunterEquip = API_DataSetBit(lHunterEquip, 3, 1)
			lHunterEquip = API_DataSetBit(lHunterEquip, 4, 1)
			lHunterEquip = API_DataSetBit(lHunterEquip, 5, 1)
			API_VarDataSetNumber(ActorID,1,HorHunterGeZi,lHunterEquip)
			local HorHunterChuShi = API_VarDataGetNumber(ActorID,1,HorHunterGeZi)
			API_HorcruxesUnlockItem(ActorID, HorHunterChuShi)
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[75][12][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[75][12][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[75][12][LaiYuan] = GLOBAL_FengXiangBiao_DateList[75][12][LaiYuan] + 1
			end
			return 1
		else
			API_ActorSendMsg(ActorID,3,'扣除道具失败')
			return 0
		end
	else
		API_ResponseWrite('<name>特制金属</name>')
		API_ResponseWrite('<br><text>    使用100个特制金属开启一个魂器装备格。</text><br>')
		API_ResponseWrite('<br><a href="HorHunter_OpenGrid?1=100">确定</a><br>')
		API_ResponseFlush(ActorID)			
		return 0
	end
end