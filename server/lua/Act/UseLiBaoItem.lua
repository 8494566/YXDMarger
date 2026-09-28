--新手礼包各项物品的使用
--11835 存储玩家领取的雪人仆从的FASTID
--11839 存储玩家领取的雪人仆从的MONSTERID
--11842 存储玩家是否已经召唤过雪人仆从：1、召唤过，0、没召唤过
TML_XueRenPCBao = 88867	--拜年小跟班
TML_XueRenID = 726453	--雪人ID
TML_HongBao = 88868	--辞旧迎新大红包
TML_JiaoZi = 88869	--瞬回饺子
TML_YanHua = 88870	--愿望成真烟花
TML_YanHuaLengQue_BiaoZhi = 0

--全局交换数据相关KEY
--10000金币： 1
--5000金币：2
--3000金币：3
--1000金币：4
--时装：5

--玩家等级对应的经验兑换券和水晶币兑换券表
TML_JingYanAndSJB_Table = {
	[1] = {EXPDuiHuanQuan=6,SJBDuiHuanQuan=3},
	[2] = {EXPDuiHuanQuan=12,SJBDuiHuanQuan=6},
	[3] = {EXPDuiHuanQuan=18,SJBDuiHuanQuan=9},
	[4] = {EXPDuiHuanQuan=24,SJBDuiHuanQuan=12},
	[5] = {EXPDuiHuanQuan=30,SJBDuiHuanQuan=15},
	[6] = {EXPDuiHuanQuan=36,SJBDuiHuanQuan=18},
	[7] = {EXPDuiHuanQuan=42,SJBDuiHuanQuan=21},
	[8] = {EXPDuiHuanQuan=48,SJBDuiHuanQuan=24},
	[9] = {EXPDuiHuanQuan=54,SJBDuiHuanQuan=27},
	[10] = {EXPDuiHuanQuan=60,SJBDuiHuanQuan=30},
	[11] = {EXPDuiHuanQuan=66,SJBDuiHuanQuan=33},
	[12] = {EXPDuiHuanQuan=72,SJBDuiHuanQuan=36},
	[13] = {EXPDuiHuanQuan=78,SJBDuiHuanQuan=39},
	[14] = {EXPDuiHuanQuan=84,SJBDuiHuanQuan=42},
	[15] = {EXPDuiHuanQuan=90,SJBDuiHuanQuan=45},
	[16] = {EXPDuiHuanQuan=96,SJBDuiHuanQuan=48},
	[17] = {EXPDuiHuanQuan=102,SJBDuiHuanQuan=51},
	[18] = {EXPDuiHuanQuan=108,SJBDuiHuanQuan=54},
	[19] = {EXPDuiHuanQuan=114,SJBDuiHuanQuan=57},
	[20] = {EXPDuiHuanQuan=120,SJBDuiHuanQuan=60},
	[21] = {EXPDuiHuanQuan=126,SJBDuiHuanQuan=63},
	[22] = {EXPDuiHuanQuan=132,SJBDuiHuanQuan=66},
	[23] = {EXPDuiHuanQuan=138,SJBDuiHuanQuan=69},
	[24] = {EXPDuiHuanQuan=144,SJBDuiHuanQuan=72},
	[25] = {EXPDuiHuanQuan=150,SJBDuiHuanQuan=75},
	[26] = {EXPDuiHuanQuan=156,SJBDuiHuanQuan=78},
	[27] = {EXPDuiHuanQuan=162,SJBDuiHuanQuan=81},
	[28] = {EXPDuiHuanQuan=168,SJBDuiHuanQuan=84},
	[29] = {EXPDuiHuanQuan=174,SJBDuiHuanQuan=87},
	[30] = {EXPDuiHuanQuan=180,SJBDuiHuanQuan=90},
	[31] = {EXPDuiHuanQuan=186,SJBDuiHuanQuan=93},
	[32] = {EXPDuiHuanQuan=192,SJBDuiHuanQuan=96},
	[33] = {EXPDuiHuanQuan=198,SJBDuiHuanQuan=99},
	[34] = {EXPDuiHuanQuan=204,SJBDuiHuanQuan=102},
	[35] = {EXPDuiHuanQuan=210,SJBDuiHuanQuan=105},
	[36] = {EXPDuiHuanQuan=216,SJBDuiHuanQuan=108},
	[37] = {EXPDuiHuanQuan=222,SJBDuiHuanQuan=111},
	[38] = {EXPDuiHuanQuan=228,SJBDuiHuanQuan=114},
	[39] = {EXPDuiHuanQuan=234,SJBDuiHuanQuan=117},
	[40] = {EXPDuiHuanQuan=240,SJBDuiHuanQuan=120},
	[41] = {EXPDuiHuanQuan=246,SJBDuiHuanQuan=123},
	[42] = {EXPDuiHuanQuan=252,SJBDuiHuanQuan=126},
	[43] = {EXPDuiHuanQuan=258,SJBDuiHuanQuan=129},
	[44] = {EXPDuiHuanQuan=264,SJBDuiHuanQuan=132},
	[45] = {EXPDuiHuanQuan=270,SJBDuiHuanQuan=135},
	[46] = {EXPDuiHuanQuan=276,SJBDuiHuanQuan=138},
	[47] = {EXPDuiHuanQuan=282,SJBDuiHuanQuan=141},
	[48] = {EXPDuiHuanQuan=288,SJBDuiHuanQuan=144},
	[49] = {EXPDuiHuanQuan=294,SJBDuiHuanQuan=147},
	[50] = {EXPDuiHuanQuan=300,SJBDuiHuanQuan=150},
	[51] = {EXPDuiHuanQuan=306,SJBDuiHuanQuan=153},
	[52] = {EXPDuiHuanQuan=312,SJBDuiHuanQuan=156},
	[53] = {EXPDuiHuanQuan=318,SJBDuiHuanQuan=159},
	[54] = {EXPDuiHuanQuan=324,SJBDuiHuanQuan=162},
	[55] = {EXPDuiHuanQuan=330,SJBDuiHuanQuan=165},
}

local OwnerID = -4007 --全局交互数据
if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 0 then
	API_VarDataLoad_Ex(1,0,OwnerID)
end

function TML_UseGoods(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local ActorName = API_GetActorName(ActorID)
	local Sex = API_GetActorSex(ActorID)
	local ActorMoney = API_ActorGetPropNum(ActorID,156)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID) --静态地图ID
	local ActorX = API_GetActorPosX(ActorID)
	local ActorY = API_GetActorPosY(ActorID)
	local CampID = API_GetActorCamp(ActorID)
	local GoodsName = API_GetGoodsName(GoodsID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if GoodsID == TML_XueRenPCBao then
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			return 0
		end
		--需要判断玩家完成了捉仆从这个任务没
		if API_VarDataGetNumber(ActorID,1,ep_jh_ZXstep) < 15 then
			API_ActorSendMsg(ActorID,3,'你没有使用过捕奴许可证，不能召唤雪人仆从')
			return 0
		end
		if API_VarDataGetNumber(ActorID,1,11842) == 1 then
			API_ActorSendMsg(ActorID,3,'你已经召唤过雪人仆从，不能再召唤了')
			return 0 
		end
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用'..GoodsName..'') then
			local XueRenFastID = API_CreateMonsterEx(MapID,TML_XueRenID,ActorX,ActorY,4,0,CampID,-1)
			API_SetActorChief(XueRenFastID,ActorID)
			API_SetMonsterPrizeActor(XueRenFastID,ActorID)
			API_VarDataSetNumber(ActorID,1,11835,XueRenFastID)
			API_VarDataSetNumber(ActorID,1,11839,TML_XueRenID)
			API_VarDataSetNumber(ActorID,1,11842,1) --设置玩家已经召唤过雪人仆从
			API_ActorSendMsg(ActorID,3,'成功召唤雪人仆从')
		end
	elseif GoodsID == TML_HongBao then
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			return 0
		end
		local AddPackageSize = API_ActorCanAddGoods(ActorID,80696,100,3,0)
		if AddPackageSize == -1 then
			API_ActorSendMsg(ActorID,3,'您的背包空间不足')
			return 0
		end
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用'..GoodsName..'') then
			API_AddActorGoodsFlag(ActorID,80696,100,3,'使用辞旧迎新大红包得到100个水晶币兑换券')
			API_ActorSendMsg(ActorID,3,'您得到 水晶币兑换券 X 100')
		end
	elseif GoodsID == TML_JiaoZi then
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			return 0
		end
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用'..GoodsName..'') then
			API_ActorAddStatus(ActorID,886001,0)
			if MapID ~= StaticMapID then
				API_ActorBroadcastMsgEx(MapID,-1,0,1,''..ActorName..'使用了瞬回饺子')
			end
		end
	elseif GoodsID == TML_YanHua then
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			return 0
		end
		if (Year == 2010 and Month == 1 and Hour >= 19 and Hour <= 23) or (Year == 2010 and Month == 2 and Hour >= 19 and Hour <= 23) then
			if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用'..GoodsName..'') then
				API_ActorUseSkill(ActorID,431,1,0,0,1,0)
				API_ActorPlaySound(ActorID,10163)
				--燃放烟花获得奖励
				if TML_YanHuaLengQue_BiaoZhi == 0 then
					if math.random(1000) == 1 then
						local Num = API_VarDataGetNumber_Ex(1,0,OwnerID,1,1)
						if Num < 2 then
							if (ActorMoney + 10000) <= 5000000 then
								API_ActorAddMoney(ActorID,10000,0,'燃放烟花获得10000金币')
							else
								API_SendActorMoneyMail(ActorID,10000,'燃放烟花获得金币','恭喜您，燃放烟花获得了10000金币的奖励，请查收！')
							end
							API_ActorSendMsg(ActorID,3,'恭喜你，燃放烟花获得10000金币')
							if not API_IsBattleGameServer() then
								API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,''..ActorName..'人品爆发，燃放烟花获得了10000金币的奖励')
								API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,''..ActorName..'人品爆发，燃放烟花获得了10000金币的奖励')
							end
							local Num2 = Num + 1
							API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,1,Num2)
							if TML_YanHuaLengQueTime_CFQ ~= nil then
								API_DestroyTriggerG(TML_YanHuaLengQueTime_CFQ)
							end
							TML_YanHuaLengQueTime_CFQ = API_CreateTimerTriggerG(0,0,300,1,'YanHuaLengQue_TimerTriggerGCallFunc')
							TML_YanHuaLengQue_BiaoZhi = 1
							return 0
						end
					end
					if math.random(1000) <= 3 then
						local Num = API_VarDataGetNumber_Ex(1,0,OwnerID,1,2)
						if Num < 5 then
							if (ActorMoney + 5000) <= 5000000 then
								API_ActorAddMoney(ActorID,5000,0,'燃放烟花获得5000金币')
							else
								API_SendActorMoneyMail(ActorID,5000,'燃放烟花获得金币','恭喜您，燃放烟花获得了5000金币的奖励，请查收！')
							end
							API_ActorSendMsg(ActorID,3,'恭喜你，燃放烟花获得5000金币')
							if not API_IsBattleGameServer() then
								API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,''..ActorName..'人品爆发，燃放烟花获得了5000金币的奖励')
								API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,''..ActorName..'人品爆发，燃放烟花获得了5000金币的奖励')
							end
							local Num2 = Num + 1
							API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,2,Num2)
							if TML_YanHuaLengQueTime_CFQ ~= nil then
								API_DestroyTriggerG(TML_YanHuaLengQueTime_CFQ)
							end
							TML_YanHuaLengQueTime_CFQ = API_CreateTimerTriggerG(0,0,300,1,'YanHuaLengQue_TimerTriggerGCallFunc')
							TML_YanHuaLengQue_BiaoZhi = 1
							return 0
						end
					end
					if math.random(1000) <= 6 then
						local Num = API_VarDataGetNumber_Ex(1,0,OwnerID,1,3)
						if Num < 10 then
							if (ActorMoney + 3000) <= 5000000 then
								API_ActorAddMoney(ActorID,3000,0,'燃放烟花获得3000金币')
							else
								API_SendActorMoneyMail(ActorID,3000,'燃放烟花获得金币','恭喜您，燃放烟花获得了3000金币的奖励，请查收！')
							end
							API_ActorSendMsg(ActorID,3,'恭喜你，燃放烟花获得3000金币')
							if not API_IsBattleGameServer() then
								API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,''..ActorName..'人品爆发，燃放烟花获得了3000金币的奖励')
								API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,''..ActorName..'人品爆发，燃放烟花获得了3000金币的奖励')
							end
							local Num2 = Num + 1
							API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,3,Num2)
							if TML_YanHuaLengQueTime_CFQ ~= nil then
								API_DestroyTriggerG(TML_YanHuaLengQueTime_CFQ)
							end
							TML_YanHuaLengQueTime_CFQ = API_CreateTimerTriggerG(0,0,300,1,'YanHuaLengQue_TimerTriggerGCallFunc')
							TML_YanHuaLengQue_BiaoZhi = 1
							return 0
						end
					end 
					if math.random(1000) <= 8 then
						local Num = API_VarDataGetNumber_Ex(1,0,OwnerID,1,4)
						if Num < 20 then
							if (ActorMoney + 1000) <= 5000000 then
								API_ActorAddMoney(ActorID,1000,0,'燃放烟花获得1000金币')
							else
								API_SendActorMoneyMail(ActorID,1000,'燃放烟花获得金币','恭喜您，燃放烟花获得了1000金币的奖励，请查收！')
							end
							API_ActorSendMsg(ActorID,3,'恭喜你，燃放烟花获得1000金币')
							if not API_IsBattleGameServer() then
								API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,''..ActorName..'人品爆发，燃放烟花获得了1000金币的奖励')
								API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,''..ActorName..'人品爆发，燃放烟花获得了1000金币的奖励')
							end
							local Num2 = Num + 1
							API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,4,Num2)
							if TML_YanHuaLengQueTime_CFQ ~= nil then
								API_DestroyTriggerG(TML_YanHuaLengQueTime_CFQ)
							end
							TML_YanHuaLengQueTime_CFQ = API_CreateTimerTriggerG(0,0,300,1,'YanHuaLengQue_TimerTriggerGCallFunc')
							TML_YanHuaLengQue_BiaoZhi = 1
							return 0
						end
					end 
					if math.random(1000) <= 5 then
						local Num = API_VarDataGetNumber_Ex(1,0,OwnerID,1,5)
						if Num < 100 then
							local AddPackageSize = 0
							if Sex == 1 then
								AddPackageSize = API_ActorCanAddGoods(ActorID,11114,1,3,0)
							elseif Sex == 2 then
								AddPackageSize = API_ActorCanAddGoods(ActorID,11116,1,3,0)
							end
							if AddPackageSize ~= -1 then
								if Sex == 1 then
									API_AddActorGoodsFlag(ActorID,11114,1,3,'燃放烟花获得节日招财装')
									API_ActorSendMsg(ActorID,3,'恭喜你，燃放烟花获得节日招财装')
								elseif Sex == 2 then
									API_AddActorGoodsFlag(ActorID,11116,1,3,'燃放烟花获得节日鸿运装')
									API_ActorSendMsg(ActorID,3,'恭喜你，燃放烟花获得节日鸿运装')
								end
							else
								if Sex == 1 then
									API_SendActorMailEx(ActorID,11114,1,0,'燃放烟花获得节日招财装','恭喜您，燃放烟花获得了节日招财装的奖励，请查收！')
									API_ActorSendMsg(ActorID,3,'恭喜你，燃放烟花获得节日招财装')
								elseif Sex == 2 then
									API_SendActorMailEx(ActorID,11116,1,0,'燃放烟花获得节日鸿运装','恭喜您，燃放烟花获得了节日鸿运装的奖励，请查收！')
									API_ActorSendMsg(ActorID,3,'恭喜你，燃放烟花获得节日鸿运装')
								end
							end
							local Num2 = Num + 1
							API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,5,Num2)
							if TML_YanHuaLengQueTime_CFQ ~= nil then
								API_DestroyTriggerG(TML_YanHuaLengQueTime_CFQ)
							end
							TML_YanHuaLengQueTime_CFQ = API_CreateTimerTriggerG(0,0,300,1,'YanHuaLengQue_TimerTriggerGCallFunc')
							TML_YanHuaLengQue_BiaoZhi = 1
							return 0
						end
					end 
				end
				if math.random(100) <= 2 then
					local LV = API_GetActorExpLevel(ActorID)
					if TML_JingYanAndSJB_Table ~= nil then
						local EXPDuiHuanQuan = TML_JingYanAndSJB_Table[LV].EXPDuiHuanQuan
						local AddPackageSize = API_ActorCanAddGoods(ActorID,80498,EXPDuiHuanQuan,3,0)
						if AddPackageSize ~= -1 then
							API_AddActorGoodsFlag(ActorID,80498,EXPDuiHuanQuan,3,'燃放烟花获得经验兑换券')
						else
							API_SendActorMailEx(ActorID,80498,EXPDuiHuanQuan,0,'燃放烟花获得经验兑换券','恭喜您，燃放烟花获得了'..EXPDuiHuanQuan..'个经验兑换券的奖励，请查收！')
						end
						API_ActorSendMsg(ActorID,3,'恭喜你，燃放烟花获得'..EXPDuiHuanQuan..'个经验兑换券')
						return 0
					end
				end 
				if math.random(100) <= 2 then
					local LV = API_GetActorExpLevel(ActorID)
					if TML_JingYanAndSJB_Table ~= nil then
						local SJBDuiHuanQuan = TML_JingYanAndSJB_Table[LV].SJBDuiHuanQuan
						local AddPackageSize = API_ActorCanAddGoods(ActorID,80696,SJBDuiHuanQuan,3,0)
						if AddPackageSize ~= -1 then
							API_AddActorGoodsFlag(ActorID,80696,SJBDuiHuanQuan,3,'燃放烟花获得水晶币兑换券')
						else
							API_SendActorMailEx(ActorID,80696,SJBDuiHuanQuan,0,'燃放烟花获得水晶币兑换券','恭喜您，燃放烟花获得了'..SJBDuiHuanQuan..'个水晶币兑换券的奖励，请查收！')
						end
						API_ActorSendMsg(ActorID,3,'恭喜你，燃放烟花获得'..SJBDuiHuanQuan..'个水晶币兑换券')
						return 0
					end
				end 
			end
		else
			if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用'..GoodsName..'') then
				API_ActorUseSkill(ActorID,431,1,0,0,1,0)
				API_ActorPlaySound(ActorID,10163)
			end
		end
	end
	return 1
end

function YanHuaLengQue_TimerTriggerGCallFunc(a,b)
	TML_YanHuaLengQue_BiaoZhi = 0
end

function XueRen_OnLogin(ActorID)
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local ActorX = API_GetActorPosX(ActorID)
	local ActorY = API_GetActorPosY(ActorID)
	local CampID = API_GetActorCamp(ActorID)
	local XueRenFastID = API_VarDataGetNumber(ActorID,1,11835)
	local XueRenID = API_VarDataGetNumber(ActorID,1,11839)
	if XueRenID > 0 then
		local XueRenFastID2 = API_CreateMonsterEx(MapID,XueRenID,ActorX,ActorY,4,0,CampID,-1)
		API_SetActorChief(XueRenFastID2,ActorID)
		API_SetMonsterPrizeActor(XueRenFastID2,ActorID)
		API_VarDataSetNumber(ActorID,1,11835,XueRenFastID2)
	end
end

function XueRen_OnLogout(ActorID)
	local ActorID = API_RequestGetActorID()
	local XueRenFastID = API_VarDataGetNumber(ActorID,1,11835)
	local XueRenID = API_VarDataGetNumber(ActorID,1,11839)
	if API_GetMonsterID(XueRenFastID) == XueRenID then
		API_DestroyMonster(XueRenFastID)
	else
		API_VarDataSetNumber(ActorID,1,11839,0) --将存储MonsterID的交互数据置为0
	end
end

function XueRen_OnLoginMap(ActorID)
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local ActorX = API_GetActorPosX(ActorID)
	local ActorY = API_GetActorPosY(ActorID)
	local CampID = API_GetActorCamp(ActorID)
	local XueRenFastID = API_VarDataGetNumber(ActorID,1,11835)
	local XueRenID = API_VarDataGetNumber(ActorID,1,11839)
	if XueRenID > 0 then --雪人仆从存在
		local XueRenFastID2 = API_CreateMonsterEx(MapID,XueRenID,ActorX,ActorY,4,0,CampID,-1)
		API_SetActorChief(XueRenFastID2,ActorID)
		API_SetMonsterPrizeActor(XueRenFastID2,ActorID)
		API_VarDataSetNumber(ActorID,1,11835,XueRenFastID2)
	end
end

function XueRen_OnLogoutMap(ActorID)
	local ActorID = API_RequestGetActorID()
	local XueRenFastID = API_VarDataGetNumber(ActorID,1,11835)
	local XueRenID = API_VarDataGetNumber(ActorID,1,11839)
	if API_GetMonsterID(XueRenFastID) == XueRenID then
		API_DestroyMonster(XueRenFastID)
	else
		API_VarDataSetNumber(ActorID,1,11839,0) --将存储MonsterID的交互数据置为0
	end
end

--清除交互数据时间触发器
if TML_ClearJiaoHu_CFQ ~= nil then
	API_DestroyTriggerG(TML_ClearJiaoHu_CFQ)
end
TML_ClearJiaoHu_CFQ = API_CreateTimerTriggerG(0,0,60,-1,'AboutYanHuaJiaoHu_TimerTriggerGCallFunc')

function AboutYanHuaJiaoHu_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == 1 then
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,1,0)
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,2,0)
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,3,0)
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,4,0)
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,5,0)
	end
end

local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'XueRen_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'XueRen_OnLogin') 
end

local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'XueRen_OnLoginMap' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'XueRen_OnLoginMap') 
end
local OnLogoutLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLogoutFuncNameList) do 
	if GLOBAL_ActMain_OnLogoutFuncNameList[i] == 'XueRen_OnLogout' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLogoutLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLogoutFuncNameList,'XueRen_OnLogout') 
end
local OnLogoutMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLogoutMapFuncNameList) do 
	if GLOBAL_ActMain_OnLogoutMapFuncNameList[i] == 'XueRen_OnLogoutMap' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLogoutMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLogoutMapFuncNameList,'XueRen_OnLogoutMap') 
end
