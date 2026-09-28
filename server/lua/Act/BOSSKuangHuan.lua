----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\BOSSKuangHuan.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-9-22
--版  本:	1.0
--描  述:	BOSS夺宝战
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-9-22
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------

BOSSKH_StartTime = {Year = 2008,Month = 9,Day = 29,Hour = 0,Minute = 0,Second = 0}   -------开始时间
BOSSKH_EndTime = {Year = 2008,Month = 10,Day = 5,Hour = 23,Minute = 59,Second = 59}   -------停止时间


--Boss列表
local BossList = {270431,}



if not API_IsEctypeServer() then
	if BOSSKuangHuan_TimerTriggerID == nil then
		BOSSKuangHuan_TimerTriggerID = API_CreateTimerTriggerG(0,0,300,-1,'BOSSKuangHuan_TimerTriggerGCallFunc')
		BOSSKuangHuan_ADTimerTriggerID = API_CreateTimerTriggerG(0,0,300,-1,'BOSSKuangHuan_ADTimerTriggerGCallFunc')
	end
end

if BOSSKuangHuan_KuangHuanBossList == nil then
	BOSSKuangHuan_DiGuoBossList = {}
	BOSSKuangHuan_LianBangBossList = {}
end

-- 暗礁海BOSS刷新位置表
AnJiaoHai_BossWeiZhiAddress_Tab = 
{
{AddrName = "公民空间传送塔", AddrMapID = 9, AddrLocX = 212, AddrLocY = 396, IfEndLine = 1, CampID = 0},
{AddrName = "男爵空间传送塔", AddrMapID = 9, AddrLocX = 105, AddrLocY = 367, IfEndLine = 1, CampID = 0},
{AddrName = "高级男爵空间传送塔", AddrMapID = 9, AddrLocX = 78, AddrLocY = 292, IfEndLine = 1, CampID = 0},
{AddrName = "国有资源采集区", AddrMapID = 9, AddrLocX = 100, AddrLocY = 317, IfEndLine = 1, CampID = 0},
{AddrName = "1档资源采集区A", AddrMapID = 9, AddrLocX = 222, AddrLocY = 359, IfEndLine = 1, CampID = 0},
{AddrName = "1档资源采集区B", AddrMapID = 9, AddrLocX = 189, AddrLocY = 303, IfEndLine = 1, CampID = 0},
{AddrName = "2档资源采集区A", AddrMapID = 9, AddrLocX = 132, AddrLocY = 253, IfEndLine = 1, CampID = 0},
{AddrName = "2档资源采集区B", AddrMapID = 9, AddrLocX = 206, AddrLocY = 232, IfEndLine = 1, CampID = 0},
{AddrName = "3档资源采集区A", AddrMapID = 9, AddrLocX = 258, AddrLocY = 145, IfEndLine = 1, CampID = 0},
}

-- 珊瑚群岛BOSS刷新位置表
ShanHuQunDao_BossWeiZhiAddress_Tab = 
{
{AddrName = "公民空间传送塔", AddrMapID = 10, AddrLocX = 265, AddrLocY = 219, IfEndLine = 1, CampID = 1},
{AddrName = "男爵空间传送塔", AddrMapID = 10, AddrLocX = 175, AddrLocY = 315, IfEndLine = 1, CampID = 1},
{AddrName = "高级男爵空间传送塔", AddrMapID = 10, AddrLocX = 162, AddrLocY = 260, IfEndLine = 1, CampID = 1},
{AddrName = "国有资源采集区", AddrMapID = 10, AddrLocX = 166, AddrLocY = 240, IfEndLine = 1, CampID = 1},
{AddrName = "1档资源采集区A", AddrMapID = 10, AddrLocX = 349, AddrLocY = 133, IfEndLine = 1, CampID = 1},
{AddrName = "1档资源采集区B", AddrMapID = 10, AddrLocX = 157, AddrLocY = 325, IfEndLine = 1, CampID = 1},
{AddrName = "2档资源采集区A", AddrMapID = 10, AddrLocX = 334, AddrLocY = 243, IfEndLine = 1, CampID = 1},
{AddrName = "2档资源采集区B", AddrMapID = 10, AddrLocX = 325, AddrLocY = 261, IfEndLine = 1, CampID = 1},
{AddrName = "3档资源采集区A", AddrMapID = 10, AddrLocX = 257, AddrLocY = 358, IfEndLine = 1, CampID = 1},
}

function BOSSKuangHuan_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(BOSSKH_StartTime.Year,BOSSKH_StartTime.Month,BOSSKH_StartTime.Day,BOSSKH_StartTime.Hour,BOSSKH_StartTime.Minute,BOSSKH_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(BOSSKH_EndTime.Year,BOSSKH_EndTime.Month,BOSSKH_EndTime.Day,BOSSKH_EndTime.Hour,BOSSKH_EndTime.Minute,BOSSKH_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		if Hour > 19  and Hour < 22 and (Week == 1 or Week == 3 or Week == 5 or Week == 7) then
			if type(BOSSKuangHuan_DiGuoBossList) == 'table' then
				for i = 1,1 do
					if BOSSKuangHuan_DiGuoBossList[i] == nil then
						local BossID = BossList[math.random(table.getn(BossList))]
						local WeiZhiTable = AnJiaoHai_BossWeiZhiAddress_Tab[math.random(table.getn(AnJiaoHai_BossWeiZhiAddress_Tab))]
						local TileX = WeiZhiTable.AddrLocX
						local TileY = WeiZhiTable.AddrLocY
						local DiDianName = WeiZhiTable.AddrName
						local BossFastID = API_CreateMonster(9,BossID,TileX,TileY,4,0,-1)
					--	API_MonsterAddStatus(BossFastID,159001,0)
						BOSSKuangHuan_DiGuoBossList[i] = BossFastID
						API_ActorBroadcastMsgEx(-1,0,0,8,''..API_GetMonsterNameByID(BossID)..'携带大量宝物出现在 '..DiDianName..' 附近')
						API_CreateDieTriggerG(0,0,0,BossFastID,'BOSSKuangHuan_Boss_DieTriggerGCallFunc')
					else
						local FastID = BOSSKuangHuan_DiGuoBossList[i]
						if API_GetMonsterID(FastID) <= 0 then
							local BossID = BossList[math.random(table.getn(BossList))]
							local WeiZhiTable = AnJiaoHai_BossWeiZhiAddress_Tab[math.random(table.getn(AnJiaoHai_BossWeiZhiAddress_Tab))]
							local TileX = WeiZhiTable.AddrLocX
							local TileY = WeiZhiTable.AddrLocY
							local DiDianName = WeiZhiTable.AddrName
							local BossFastID = API_CreateMonster(9,BossID,TileX,TileY,4,0,-1)
						--	API_MonsterAddStatus(BossFastID,159001,0)
							BOSSKuangHuan_DiGuoBossList[i] = BossFastID
							API_ActorBroadcastMsgEx(-1,0,0,8,''..API_GetMonsterNameByID(BossID)..'携带大量宝物出现在 '..DiDianName..' 附近')
							API_CreateDieTriggerG(0,0,0,BossFastID,'BOSSKuangHuan_Boss_DieTriggerGCallFunc')
						end
					end
				end
			end
			if type(BOSSKuangHuan_LianBangBossList) == 'table' then
				for i = 1,1 do
					if BOSSKuangHuan_LianBangBossList[i] == nil then
						local BossID = BossList[math.random(table.getn(BossList))]
						local WeiZhiTable = ShanHuQunDao_BossWeiZhiAddress_Tab[math.random(table.getn(ShanHuQunDao_BossWeiZhiAddress_Tab))]
						local TileX = WeiZhiTable.AddrLocX
						local TileY = WeiZhiTable.AddrLocY
						local DiDianName = WeiZhiTable.AddrName
						local BossFastID = API_CreateMonster(10,BossID,TileX,TileY,4,0,-1)
					--	API_MonsterAddStatus(BossFastID,159001,0)
						BOSSKuangHuan_LianBangBossList[i] = BossFastID
						API_ActorBroadcastMsgEx(-1,1,0,8,''..API_GetMonsterNameByID(BossID)..'携带大量宝物出现在 '..DiDianName..' 附近')
						API_CreateDieTriggerG(0,0,0,BossFastID,'BOSSKuangHuan_Boss_DieTriggerGCallFunc')
					else
						local FastID = BOSSKuangHuan_LianBangBossList[i]
						if API_GetMonsterID(FastID) <= 0 then
							local BossID = BossList[math.random(table.getn(BossList))]
							local WeiZhiTable = ShanHuQunDao_BossWeiZhiAddress_Tab[math.random(table.getn(ShanHuQunDao_BossWeiZhiAddress_Tab))]
							local TileX = WeiZhiTable.AddrLocX
							local TileY = WeiZhiTable.AddrLocY
							local DiDianName = WeiZhiTable.AddrName
							local BossFastID = API_CreateMonster(10,BossID,TileX,TileY,4,0,-1)
						--	API_MonsterAddStatus(BossFastID,159001,0)
							BOSSKuangHuan_LianBangBossList[i] = BossFastID
							API_ActorBroadcastMsgEx(-1,1,0,8,''..API_GetMonsterNameByID(BossID)..'携带大量宝物出现在 '..DiDianName..' 附近')
							API_CreateDieTriggerG(0,0,0,BossFastID,'BOSSKuangHuan_Boss_DieTriggerGCallFunc')
						end
					end
				end
			end
		end
	elseif nShiFouEnd < 0 then
		if BOSSKuangHuan_TimerTriggerID ~= nil then
			API_DestroyTriggerG(BOSSKuangHuan_TimerTriggerID)
			BOSSKuangHuan_TimerTriggerID = nil
		end
		if type(BOSSKuangHuan_DiGuoBossList) == 'table' then
			for i ,v in pairs(BOSSKuangHuan_DiGuoBossList) do
				if API_GetMonsterID(v) > 0 then
					API_DestroyMonster(v)
				end
			end
		end
		BOSSKuangHuan_DiGuoBossList = nil
		if type(BOSSKuangHuan_LianBangBossList) == 'table' then
			for i ,v in pairs(BOSSKuangHuan_LianBangBossList) do
				if API_GetMonsterID(v) > 0 then
					API_DestroyMonster(v)
				end
			end
		end
		BOSSKuangHuan_LianBangBossList = nil
	end
end

local BossJiangLi = {
[270431] = {
			--金币
			[1]={ID=80410,Num=1000,Gailv=100},
			[2]={ID=80410,Num=1000,Gailv=100},
			[3]={ID=80410,Num=1000,Gailv=100},
			[4]={ID=80410,Num=1000,Gailv=100},
			[5]={ID=80410,Num=1000,Gailv=100},
			[6]={ID=80410,Num=1000,Gailv=100},
			[7]={ID=80410,Num=1000,Gailv=100},
			[8]={ID=80410,Num=1000,Gailv=100},
			[9]={ID=80410,Num=1000,Gailv=100},
			[10]={ID=80410,Num=1000,Gailv=100},
			[11]={ID=80410,Num=1000,Gailv=100},
			[12]={ID=80410,Num=1000,Gailv=100},
			[13]={ID=80410,Num=1000,Gailv=100},
			[14]={ID=80410,Num=1000,Gailv=100},
			[15]={ID=80410,Num=1000,Gailv=100},
			[16]={ID=80410,Num=1000,Gailv=100},
			[17]={ID=80410,Num=1000,Gailv=100},
			[18]={ID=80410,Num=1000,Gailv=100},
			[19]={ID=80410,Num=1000,Gailv=100},
			[20]={ID=80410,Num=1000,Gailv=100},
			[21]={ID=80410,Num=1000,Gailv=100},
			[22]={ID=80410,Num=1000,Gailv=100},
			[23]={ID=80410,Num=1000,Gailv=100},
			[24]={ID=80410,Num=1000,Gailv=100},
			[25]={ID=80410,Num=1000,Gailv=100},
			[26]={ID=80410,Num=1000,Gailv=100},
			[27]={ID=80410,Num=1000,Gailv=100},
			[28]={ID=80410,Num=1000,Gailv=100},
			[29]={ID=80410,Num=1000,Gailv=100},
			[30]={ID=80410,Num=1000,Gailv=100},
			[31]={ID=80410,Num=1000,Gailv=100},
			[32]={ID=80410,Num=1000,Gailv=100},
			[33]={ID=80410,Num=1000,Gailv=100},
			[34]={ID=80410,Num=1000,Gailv=100},
			[35]={ID=80410,Num=1000,Gailv=100},
			[36]={ID=80410,Num=1000,Gailv=100},
			[37]={ID=80410,Num=1000,Gailv=100},
			[38]={ID=80410,Num=1000,Gailv=100},
			
			--1档盾和武器打造配方
			[39]={ID=80048,Num=1,Gailv=100},
			[40]={ID=80048,Num=1,Gailv=100},
			[41]={ID=80048,Num=1,Gailv=100},
			[42]={ID=80048,Num=1,Gailv=100},
			[43]={ID=80048,Num=1,Gailv=100},
			
			--1档衣服打造配方
			[44]={ID=80064,Num=1,Gailv=50},
			[45]={ID=80064,Num=1,Gailv=50},
			[46]={ID=80064,Num=1,Gailv=50},
			[47]={ID=80064,Num=1,Gailv=50},
			
			--1档帽子打造配方
			[48]={ID=80083,Num=1,Gailv=50},
			[49]={ID=80083,Num=1,Gailv=50},
			[50]={ID=80083,Num=1,Gailv=50},
			[51]={ID=80083,Num=1,Gailv=50},
			
			--1档手套打造配方
			[52]={ID=80093,Num=1,Gailv=20},
			[53]={ID=80093,Num=1,Gailv=20},
			[54]={ID=80093,Num=1,Gailv=20},
			
			--1档鞋子打造配方
			[55]={ID=80103,Num=1,Gailv=10},
			[56]={ID=80103,Num=1,Gailv=10},
			[57]={ID=80103,Num=1,Gailv=10},
			[58]={ID=80103,Num=1,Gailv=10},
			
			--1档护腿打造配方
			[59]={ID=80113,Num=1,Gailv=20},
			[60]={ID=80113,Num=1,Gailv=20},
			[61]={ID=80113,Num=1,Gailv=20},
			[62]={ID=80113,Num=1,Gailv=20},
			[63]={ID=80113,Num=1,Gailv=20},
			
			--1档腰带打造配方
			[64]={ID=80123,Num=1,Gailv=20},
			[65]={ID=80123,Num=1,Gailv=20},
			[66]={ID=80123,Num=1,Gailv=20},
			[67]={ID=80123,Num=1,Gailv=20},
			[68]={ID=80123,Num=1,Gailv=20},
			
			--1档饰品打造配方
			[69]={ID=80133,Num=1,Gailv=100},
			[70]={ID=80133,Num=1,Gailv=100},
			[71]={ID=80133,Num=1,Gailv=100},
			[72]={ID=80133,Num=1,Gailv=100},
			[73]={ID=80133,Num=1,Gailv=100},
			[74]={ID=80133,Num=1,Gailv=100},
			
			--2档盾和武器打造配方
			[75]={ID=80049,Num=1,Gailv=50},
			[76]={ID=80049,Num=1,Gailv=50},
			[77]={ID=80049,Num=1,Gailv=50},
			
			--2档衣服打造配方
			[78]={ID=80065,Num=1,Gailv=50},
			[79]={ID=80065,Num=1,Gailv=50},
			[80]={ID=80065,Num=1,Gailv=50},
			},
[270434] = {
			--金币
			[1]={ID=80410,Num=1400,Gailv=100},
			[2]={ID=80410,Num=1400,Gailv=100},
			[3]={ID=80410,Num=1400,Gailv=100},
			[4]={ID=80410,Num=1400,Gailv=100},
			[5]={ID=80410,Num=1400,Gailv=100},
			[6]={ID=80410,Num=1400,Gailv=100},
			[7]={ID=80410,Num=1400,Gailv=100},
			[8]={ID=80410,Num=1400,Gailv=100},
			[9]={ID=80410,Num=1400,Gailv=100},
			[10]={ID=80410,Num=1400,Gailv=100},
			[11]={ID=80410,Num=1400,Gailv=100},
			[12]={ID=80410,Num=1400,Gailv=100},
			[13]={ID=80410,Num=1400,Gailv=100},
			[14]={ID=80410,Num=1400,Gailv=100},
			[15]={ID=80410,Num=1400,Gailv=100},
			[16]={ID=80410,Num=1400,Gailv=100},
			[17]={ID=80410,Num=1400,Gailv=100},
			[18]={ID=80410,Num=1400,Gailv=100},
			[19]={ID=80410,Num=1400,Gailv=100},
			[20]={ID=80410,Num=1400,Gailv=100},
			[21]={ID=80410,Num=1400,Gailv=100},
			[22]={ID=80410,Num=1400,Gailv=100},
			[23]={ID=80410,Num=1400,Gailv=100},
			[24]={ID=80410,Num=1400,Gailv=100},
			[25]={ID=80410,Num=1400,Gailv=100},
			[26]={ID=80410,Num=1400,Gailv=100},
			[27]={ID=80410,Num=1400,Gailv=100},
			[28]={ID=80410,Num=1400,Gailv=100},
			[29]={ID=80410,Num=1400,Gailv=100},
			[30]={ID=80410,Num=1400,Gailv=100},
			[31]={ID=80410,Num=1400,Gailv=100},
			[32]={ID=80410,Num=1400,Gailv=100},
			[33]={ID=80410,Num=1400,Gailv=100},
			[34]={ID=80410,Num=1400,Gailv=100},
			[35]={ID=80410,Num=1400,Gailv=100},
			[36]={ID=80410,Num=1400,Gailv=100},
			[37]={ID=80410,Num=1400,Gailv=100},
			[38]={ID=80410,Num=1400,Gailv=100},
			
			--1档盾和武器打造配方
			[39]={ID=80048,Num=2,Gailv=100},
			[40]={ID=80048,Num=2,Gailv=100},
			[41]={ID=80048,Num=2,Gailv=100},
			[42]={ID=80048,Num=2,Gailv=100},
			[43]={ID=80048,Num=2,Gailv=100},
			
			--1档衣服打造配方
			[44]={ID=80064,Num=2,Gailv=50},
			[45]={ID=80064,Num=2,Gailv=50},
			[46]={ID=80064,Num=2,Gailv=50},
			[47]={ID=80064,Num=2,Gailv=50},
			
			--1档帽子打造配方
			[48]={ID=80083,Num=2,Gailv=50},
			[49]={ID=80083,Num=2,Gailv=50},
			[50]={ID=80083,Num=2,Gailv=50},
			[51]={ID=80083,Num=2,Gailv=50},
			
			--1档手套打造配方
			[52]={ID=80093,Num=2,Gailv=20},
			[53]={ID=80093,Num=2,Gailv=20},
			[54]={ID=80093,Num=2,Gailv=20},
			
			--1档鞋子打造配方
			[55]={ID=80103,Num=2,Gailv=10},
			[56]={ID=80103,Num=2,Gailv=10},
			[57]={ID=80103,Num=2,Gailv=10},
			[58]={ID=80103,Num=2,Gailv=10},
			
			--1档护腿打造配方
			[59]={ID=80113,Num=2,Gailv=20},
			[60]={ID=80113,Num=2,Gailv=20},
			[61]={ID=80113,Num=2,Gailv=20},
			[62]={ID=80113,Num=2,Gailv=20},
			[63]={ID=80113,Num=2,Gailv=20},
			
			--1档腰带打造配方
			[64]={ID=80123,Num=2,Gailv=20},
			[65]={ID=80123,Num=2,Gailv=20},
			[66]={ID=80123,Num=2,Gailv=20},
			[67]={ID=80123,Num=2,Gailv=20},
			[68]={ID=80123,Num=2,Gailv=20},
			
			--1档饰品打造配方
			[69]={ID=80133,Num=2,Gailv=100},
			[70]={ID=80133,Num=2,Gailv=100},
			[71]={ID=80133,Num=2,Gailv=100},
			[72]={ID=80133,Num=2,Gailv=100},
			[73]={ID=80133,Num=2,Gailv=100},
			[74]={ID=80133,Num=2,Gailv=100},
			
			--2档盾和武器打造配方
			[75]={ID=80049,Num=2,Gailv=50},
			[76]={ID=80049,Num=2,Gailv=50},
			[77]={ID=80049,Num=2,Gailv=50},
			
			--2档衣服打造配方
			[78]={ID=80065,Num=2,Gailv=50},
			[79]={ID=80065,Num=2,Gailv=50},
			[80]={ID=80065,Num=2,Gailv=50},
			},
}


function BOSSKuangHuan_Boss_DieTriggerGCallFunc(a,b,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if KillerType ~= -1 or KillerID ~= -1 then
		if BossJiangLi[MonsterID] ~= nil then
			for i = 1,table.getn(BossJiangLi[MonsterID]) do
				if math.random(100) <= BossJiangLi[MonsterID][i].Gailv then
					API_CreateDropGoods(DynamicMapID,PosX,PosY,BossJiangLi[MonsterID][i].ID,BossJiangLi[MonsterID][i].Num,0,'BOSS大献礼活动',4,0,300,0)
				end
			end
		end
	end
end

function BOSSKuangHuan_ADTimerTriggerGCallFunc(a,b)
--	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
--	local nShiFouStart = API_DiffDatatime(BOSSKH_StartTime.Year,BOSSKH_StartTime.Month,BOSSKH_StartTime.Day,BOSSKH_StartTime.Hour,BOSSKH_StartTime.Minute,BOSSKH_StartTime.Second)
--	local nShiFouEnd = API_DiffDatatime(BOSSKH_EndTime.Year,BOSSKH_EndTime.Month,BOSSKH_EndTime.Day,BOSSKH_EndTime.Hour,BOSSKH_EndTime.Minute,BOSSKH_EndTime.Second)
--	if nShiFouStart < 0 and nShiFouEnd > 0 then
--		local shiduan = math.floor(Minute/5)
--		if shiduan == 0 or shiduan == 3 or shiduan == 6 or shiduan == 9 then
--			for i in GLOBAL_AD_MapIDList do
--				local MapID = GLOBAL_AD_MapIDList[i]
--				local RightMapID = API_GetRightMapID(MapID)
--				API_ActorMsgBoard(0,RightMapID,-1,'国庆乐翻天:                悠长假期，英雄岛上激战正酣。国庆七天之内防守、拉锯、争夺、塔防等浮空岛的功勋和金币奖励翻倍拉！')
--			end
--		elseif shiduan == 1 or shiduan == 4 or shiduan == 7 or shiduan == 10 then
--			for i in GLOBAL_AD_MapIDList do
--				local MapID = GLOBAL_AD_MapIDList[i]
--				local RightMapID = API_GetRightMapID(MapID)
--				API_ActorMsgBoard(0,RightMapID,-1,'机奴大作战:               国庆七天,大批神秘BOSS携带大量金币和配方奖励,将于每晚19点30分-22点30分期间现身珊瑚群岛和暗礁海')
--			end
--		elseif shiduan == 2 or shiduan == 5 or shiduan == 8 or shiduan == 11 then
--			for i in GLOBAL_AD_MapIDList do
--				local MapID = GLOBAL_AD_MapIDList[i]
--				local RightMapID = API_GetRightMapID(MapID)
--				API_ActorMsgBoard(0,RightMapID,-1,'BOSS夺宝战:               国庆七天,大批神秘BOSS携带大量金币和配方奖励,将于每晚19点30分-22点30分期间现身珊瑚群岛和暗礁海')
--			end
--		end
--	elseif nShiFouEnd < 0 then
--		if BOSSKuangHuan_ADTimerTriggerID ~= nil then
--			API_DestroyTriggerG(BOSSKuangHuan_ADTimerTriggerID)
--			BOSSKuangHuan_ADTimerTriggerID = nil
--		end
--	end
end
