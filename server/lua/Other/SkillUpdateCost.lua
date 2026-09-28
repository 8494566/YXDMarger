----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\SkillUpdateCost.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2009-8-3
--版  本:	1.0
--描  述:	技能升级扣除道具
--应  用:  

----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2009-8-3
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------

--技能等级小于5不能用、不能用，小于30级的玩家每天最多使用50张

local TodayUseExpGoodsNumSave = 18408	--今天使用技能经验替代卷的数量
local TodayUseCrystalGoodsNumSave = 18410	--今天使用技能水晶币替代卷的数量
local LastUseExpGoodsDateSave = 18409	--最后使用技能经验替代卷的日期
local LastUseCrystalGoodsDateSave = 18411	--最后使用技能水晶币替代卷的日期

local ExpGoodsID = 80832
local CrystalGoodsID = 80833

--道具价值
local ExpGoodsJiaZhi = 10000
local CrystalGoodsJiaZhi = 1000

local SkillUpdateTaskID = 1312

SkillUpdateCost_TodayMaxUseGoods = {
	[20] = {ExpGoodsNum = 1000, CrystalGoodsNum = 100,},
	[21] = {ExpGoodsNum = 1000, CrystalGoodsNum = 100,},
	[22] = {ExpGoodsNum = 1000, CrystalGoodsNum = 100,},
	[23] = {ExpGoodsNum = 1000, CrystalGoodsNum = 100,},
	[24] = {ExpGoodsNum = 1000, CrystalGoodsNum = 100,},
	[25] = {ExpGoodsNum = 1000, CrystalGoodsNum = 100,},
	[26] = {ExpGoodsNum = 1000, CrystalGoodsNum = 100,},
	[27] = {ExpGoodsNum = 1000, CrystalGoodsNum = 100,},
	[28] = {ExpGoodsNum = 1000, CrystalGoodsNum = 100,},
	[29] = {ExpGoodsNum = 1000, CrystalGoodsNum = 100,},
	[30] = {ExpGoodsNum = 1000, CrystalGoodsNum = 100,},
	[31] = {ExpGoodsNum = 1040, CrystalGoodsNum = 140,},
	[32] = {ExpGoodsNum = 1100, CrystalGoodsNum = 140,},
	[33] = {ExpGoodsNum = 1180, CrystalGoodsNum = 140,},
	[34] = {ExpGoodsNum = 1280, CrystalGoodsNum = 140,},
	[35] = {ExpGoodsNum = 1400, CrystalGoodsNum = 260,},
	[36] = {ExpGoodsNum = 1540, CrystalGoodsNum = 400,},
	[37] = {ExpGoodsNum = 1700, CrystalGoodsNum = 400,},
	[38] = {ExpGoodsNum = 1880, CrystalGoodsNum = 400,},
	[39] = {ExpGoodsNum = 2080, CrystalGoodsNum = 400,},
	[40] = {ExpGoodsNum = 2300, CrystalGoodsNum = 620,},
	[41] = {ExpGoodsNum = 2540, CrystalGoodsNum = 860,},
	[42] = {ExpGoodsNum = 2800, CrystalGoodsNum = 860,},
	[43] = {ExpGoodsNum = 3080, CrystalGoodsNum = 860,},
	[44] = {ExpGoodsNum = 3380, CrystalGoodsNum = 860,},
	[45] = {ExpGoodsNum = 6580, CrystalGoodsNum = 1180,},
	[46] = {ExpGoodsNum = 9640, CrystalGoodsNum = 1520,},
	[47] = {ExpGoodsNum = 12520, CrystalGoodsNum = 1520,},
	[48] = {ExpGoodsNum = 15560, CrystalGoodsNum = 1520,},
	[49] = {ExpGoodsNum = 18760, CrystalGoodsNum = 1520,},
	[50] = {ExpGoodsNum = 22120, CrystalGoodsNum = 1940,},
	[51] = {ExpGoodsNum = 25640, CrystalGoodsNum = 2380,},
	[52] = {ExpGoodsNum = 29320, CrystalGoodsNum = 2380,},
	[53] = {ExpGoodsNum = 33160, CrystalGoodsNum = 2380,},
	[54] = {ExpGoodsNum = 37160, CrystalGoodsNum = 2380,},
	[55] = {ExpGoodsNum = 41320, CrystalGoodsNum = 2900,},
	[56] = {ExpGoodsNum = 45640, CrystalGoodsNum = 3440,},
	[57] = {ExpGoodsNum = 50120, CrystalGoodsNum = 3440,},
	[58] = {ExpGoodsNum = 54760, CrystalGoodsNum = 3440,},
	[59] = {ExpGoodsNum = 59560, CrystalGoodsNum = 3440,},
	[60] = {ExpGoodsNum = 64520, CrystalGoodsNum = 4060,},
	[61] = {ExpGoodsNum = 69640, CrystalGoodsNum = 4700,},
	[62] = {ExpGoodsNum = 74920, CrystalGoodsNum = 4700,},
	[63] = {ExpGoodsNum = 80360, CrystalGoodsNum = 4700,},
	[64] = {ExpGoodsNum = 85960, CrystalGoodsNum = 4700,},
	[65] = {ExpGoodsNum = 91720, CrystalGoodsNum = 5420,},
	[66] = {ExpGoodsNum = 97640, CrystalGoodsNum = 6160,},
	[67] = {ExpGoodsNum = 103720, CrystalGoodsNum = 6160,},
	[68] = {ExpGoodsNum = 109960, CrystalGoodsNum = 6940,},
	[69] = {ExpGoodsNum = 116360, CrystalGoodsNum = 7740,},
	[70] = {ExpGoodsNum = 122920, CrystalGoodsNum = 8560,},
	[71] = {ExpGoodsNum = 129640, CrystalGoodsNum = 9400,},
	[72] = {ExpGoodsNum = 136520, CrystalGoodsNum = 9400,},
	[73] = {ExpGoodsNum = 143560, CrystalGoodsNum = 10280,},
	[74] = {ExpGoodsNum = 150760, CrystalGoodsNum = 11180,},
	[75] = {ExpGoodsNum = 158120, CrystalGoodsNum = 11180,},
	[76] = {ExpGoodsNum = 165640, CrystalGoodsNum = 12120,},
	[77] = {ExpGoodsNum = 173320, CrystalGoodsNum = 13080,},
	[78] = {ExpGoodsNum = 181160, CrystalGoodsNum = 13080,},
	[79] = {ExpGoodsNum = 189160, CrystalGoodsNum = 14080,},
	[80] = {ExpGoodsNum = 209160, CrystalGoodsNum = 16240,},
	[81] = {ExpGoodsNum = 269160, CrystalGoodsNum = 18900,},
	[82] = {ExpGoodsNum = 269160, CrystalGoodsNum = 18900,},
	[83] = {ExpGoodsNum = 269160, CrystalGoodsNum = 18900,},
	[84] = {ExpGoodsNum = 269160, CrystalGoodsNum = 18900,},
	[85] = {ExpGoodsNum = 269160, CrystalGoodsNum = 18900,},
}


function SkillUpdateCost(ActorID,SkillID,SkillLV,NeedExp,NeedCrystal)
	local ActorExploit = API_GetActorCurExp(ActorID)
	local ActorCrystal = API_ActorGetPropNum(ActorID,208)
	if SkillLV < 6 then
		
		if ActorExploit >= NeedExp and ActorCrystal >= NeedCrystal then
			API_ActorAddExp(ActorID,-NeedExp,SkillUpdateTaskID,'升级技能扣经验')
			API_ActorShoppingM_Reduce(ActorID,-NeedCrystal,SkillUpdateTaskID,'升级技能扣水晶币')
			API_ActorSendMsg(ActorID,0,'技能升级，扣除'..NeedExp..'经验')
			API_ActorSendMsg(ActorID,7,'技能升级，扣除'..NeedExp..'经验')
			API_ActorSendMsg(ActorID,0,'技能升级，扣除'..NeedCrystal..'水晶币')
			API_ActorSendMsg(ActorID,7,'技能升级，扣除'..NeedCrystal..'水晶币')
			return 1
		else
			local TiShi = ''
			if ActorExploit < NeedExp then
				TiShi = '经验不足'..NeedExp..''
				if ActorCrystal < NeedCrystal then
					TiShi = TiShi..'，水晶币不足'..NeedCrystal..''
				end
			else
				if ActorCrystal < NeedCrystal then
					TiShi = '水晶币不足'..NeedCrystal..''
				end
			end
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win rect="425,150,270,200"></win>')
			API_ResponseWrite('<text color="255,0,0">'..TiShi..'</text><text>，无法升级！</text><br><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 0
		end
	else
		local ActorExpGoodsNum = API_ActorGetGoodsNum(ActorID,ExpGoodsID)
		local ActorCrystalGoodsNum = API_ActorGetGoodsNum(ActorID,CrystalGoodsID)
		local ExpLevel = API_GetActorExpLevel(ActorID)
		if ExpLevel < 20 then
			ExpLevel = 20
		end
		if ExpLevel > 85 then
			ExpLevel = 85
		end
		if SkillUpdateCost_TodayMaxUseGoods[ExpLevel] ~= nil then
			local TodayMaxUseExpGoods = SkillUpdateCost_TodayMaxUseGoods[ExpLevel].ExpGoodsNum
			local TodayMaxUseCrystalGoods = SkillUpdateCost_TodayMaxUseGoods[ExpLevel].CrystalGoodsNum
			
			local TodayUseExpGoodsNum = API_VarDataGetNumber(ActorID,1,TodayUseExpGoodsNumSave)
			local year,month,day,hour,min,sec,wday = PublicFun_time()
			local Biaozhi = API_VarDataGetNumber(ActorID,1,LastUseExpGoodsDateSave)
			Biaozhi = math.mod(Biaozhi,100000000)
			local LYear = math.floor(Biaozhi/10000)
			local LMonthDay = math.mod(Biaozhi,10000)
			local LMonth = math.floor(LMonthDay/100)
			local LDay = math.mod(LMonthDay,100)
			if year ~= LYear or month ~= LMonth or day ~= LDay then
				TodayUseExpGoodsNum = 0
			end
			
			local TodayUseCrystalGoodsNum = API_VarDataGetNumber(ActorID,1,TodayUseCrystalGoodsNumSave)
			local Biaozhi = API_VarDataGetNumber(ActorID,1,LastUseCrystalGoodsDateSave)
			Biaozhi = math.mod(Biaozhi,100000000)
			local LYear = math.floor(Biaozhi/10000)
			local LMonthDay = math.mod(Biaozhi,10000)
			local LMonth = math.floor(LMonthDay/100)
			local LDay = math.mod(LMonthDay,100)
			if year ~= LYear or month ~= LMonth or day ~= LDay then
				TodayUseCrystalGoodsNum = 0
			end
			
			Biaozhi = year * 10000 + month * 100 + day
			
			local TodayShenYuUseExpGoodsNum = TodayMaxUseExpGoods - TodayUseExpGoodsNum
			local TodayShenYuCrystalGoodsNum = TodayMaxUseCrystalGoods - TodayUseCrystalGoodsNum
			
			local NeedExpGoodsNum = math.floor(NeedExp/ExpGoodsJiaZhi)
			local NeedCrystalGoodsNum = math.floor(NeedCrystal/CrystalGoodsJiaZhi)
			
			local NeedKouExpGoodsNum = NeedExpGoodsNum
			local NeedKouCrystalGoodsNum = NeedCrystalGoodsNum
			
			if NeedKouExpGoodsNum > TodayShenYuUseExpGoodsNum then
				NeedKouExpGoodsNum = TodayShenYuUseExpGoodsNum
			end
			if NeedKouCrystalGoodsNum > TodayShenYuCrystalGoodsNum then
				NeedKouCrystalGoodsNum = TodayShenYuCrystalGoodsNum
			end
			
			if NeedKouExpGoodsNum > ActorExpGoodsNum then
				NeedKouExpGoodsNum = ActorExpGoodsNum
			end
			if NeedKouCrystalGoodsNum > ActorCrystalGoodsNum then
				NeedKouCrystalGoodsNum = ActorCrystalGoodsNum
			end
			
			local NeedKouExp = NeedExp - NeedKouExpGoodsNum * ExpGoodsJiaZhi
			local NeedKouCrystal = NeedCrystal - NeedKouCrystalGoodsNum * CrystalGoodsJiaZhi
			
			if ActorExploit >= NeedKouExp and ActorCrystal >= NeedKouCrystal then
				if NeedKouExpGoodsNum > 0 then
					if not API_ActorRemoveGoods(ActorID,ExpGoodsID,NeedKouExpGoodsNum,'技能升级扣经验道具') then
						return 0
					else
						API_ActorSendMsg(ActorID,0,'技能升级，扣除'..NeedKouExpGoodsNum..'个'..API_GetGoodsName(ExpGoodsID)..'')
						API_ActorSendMsg(ActorID,7,'技能升级，扣除'..NeedKouExpGoodsNum..'个'..API_GetGoodsName(ExpGoodsID)..'')
						--记录消耗
						TodayUseExpGoodsNum = TodayUseExpGoodsNum + NeedKouExpGoodsNum
						API_VarDataSetNumber(ActorID,1,TodayUseExpGoodsNumSave,TodayUseExpGoodsNum)
						API_VarDataSetNumber(ActorID,1,LastUseExpGoodsDateSave,Biaozhi)
						--记录风向标
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[26][1][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[26][1][LaiYuan] = NeedKouExpGoodsNum
						else
							GLOBAL_FengXiangBiao_DateList[26][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[26][1][LaiYuan] + NeedKouExpGoodsNum
						end
					end
				end
				if NeedKouCrystalGoodsNum > 0 then
					if not API_ActorRemoveGoods(ActorID,CrystalGoodsID,NeedKouCrystalGoodsNum,'技能升级扣水晶币道具') then
						return 0
					else
						API_ActorSendMsg(ActorID,0,'技能升级，扣除'..NeedKouCrystalGoodsNum..'个'..API_GetGoodsName(CrystalGoodsID)..'')
						API_ActorSendMsg(ActorID,7,'技能升级，扣除'..NeedKouCrystalGoodsNum..'个'..API_GetGoodsName(CrystalGoodsID)..'')
						--记录消耗
						TodayUseCrystalGoodsNum = TodayUseCrystalGoodsNum + NeedKouCrystalGoodsNum
						API_VarDataSetNumber(ActorID,1,TodayUseCrystalGoodsNumSave,TodayUseCrystalGoodsNum)
						API_VarDataSetNumber(ActorID,1,LastUseCrystalGoodsDateSave,Biaozhi)
						--记录风向标
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[26][2][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[26][2][LaiYuan] = NeedKouCrystalGoodsNum
						else
							GLOBAL_FengXiangBiao_DateList[26][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[26][2][LaiYuan] + NeedKouCrystalGoodsNum
						end
						
					end
				end
				if NeedKouExp > 0 then
					API_ActorAddExp(ActorID,-NeedKouExp,SkillUpdateTaskID,'升级技能扣经验')
					API_ActorSendMsg(ActorID,0,'技能升级，扣除'..NeedKouExp..'经验')
					API_ActorSendMsg(ActorID,7,'技能升级，扣除'..NeedKouExp..'经验')
				end
				if NeedKouCrystal > 0 then
					API_ActorShoppingM_Reduce(ActorID,-NeedKouCrystal,SkillUpdateTaskID,'升级技能扣水晶币')
					API_ActorSendMsg(ActorID,0,'技能升级，扣除'..NeedKouCrystal..'水晶币')
					API_ActorSendMsg(ActorID,7,'技能升级，扣除'..NeedKouCrystal..'水晶币')
				end
				
				return 1
			else
				local TiShi = ''
				if ActorExploit < NeedKouExp then
					TiShi = '经验不足'..NeedKouExp..''
					if ActorCrystal < NeedKouCrystal then
						TiShi = TiShi..'，水晶币不足'..NeedKouCrystal..''
					end
				else
					if ActorCrystal < NeedKouCrystal then
						TiShi = '水晶币不足'..NeedKouCrystal..''
					end
				end
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win rect="425,150,270,200"></win>')
				API_ResponseWrite('<text color="255,0,0">'..TiShi..'</text><text>，无法升级！</text><br><br>')
				API_ResponseWrite('<text>按照您的等级</text><br>')
				API_ResponseWrite('<text color="255,0,255">您每天最多可以使用'..TodayMaxUseExpGoods..'张'..API_GetGoodsName(ExpGoodsID)..'，今天还可以使用：'..TodayShenYuUseExpGoodsNum..'张</text><br><br>')
				API_ResponseWrite('<text color="255,0,255">您每天最多可以使用'..TodayMaxUseCrystalGoods..'张'..API_GetGoodsName(CrystalGoodsID)..'，今天还可以使用：'..TodayShenYuCrystalGoodsNum..'张</text><br><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
		else
			return 0
		end
	end
end
