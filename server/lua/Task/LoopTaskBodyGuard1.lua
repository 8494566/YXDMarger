-- ------------------------------------------------------------------------------------------------
-- 快递任务	交互数据配置[TaskID=102]
-- 3506		目的NPC1/邮车当前血量
-- 3507		邮车GoodsId / 邮车FastId
-- 3508		是否要创建邮船/邮船死亡触发器ID
-- 3509		奖励金额/奖励类型
-- 3510		状态ID1/状态ID2
-- ------------------------------------------------------------------------------------------------
local constTaskID = 102

local constTargetID = 3506
local constLeftValue = 3506
local constMonsterID = 3507
local constFastID = 3507
local constCreateMonster = 3508
local constDieTriggerID = 3508
local constAward = 3509
local constAwardTypeID = 3509
local constStatusID1 = 3510
local constStatusID2 = 3510

-- 有效距离
local constMaxTitle = 30

-- 购物券ID：80289
local constBuyBillID = 80289

-- 刷怪地图ID
local constCreateMonsterMapList = {74,93}

-- 刷怪后10s 的效果ID
local constXuanYunEffValue = 279009
local constXuanYunEffTimeout = 10000

-- 状态
local constBodyStatusPercent = 16
local constBodyStatusID = {278001,278002,278003,278004,278005,278006,278007,278008,278009,278010,278011}
local constMovingStatusID = {279001,279002,279003,279004,279005,279006,279007,279008,279009,279010,279011}

-- 全局变量
g_nBodyGuardFastList = {}

--- 时间检查
local constMaxKillTimeTitle = 25
local constMaxKillTimeSpan = 1
local constMaxKillTimeNum = 30
g_BodyGuardKillYouChe = {}

-- --------------------------------------------------------------------------------------------------------------
-- 邮车目的地NPC的帮助信息配置表
-- --------------------------------------------------------------------------------------------------------------
--[[
local constTargetMonsterHelpString =
{
	[11517] = '送给天空城秘密通道1层的</text><text color="255,0,0">1层联邦守卫1</text><text>，可以从</text><text color="255,0,0">联邦总督府（46,62）</text><text>进入秘密通道1层寻找1层联邦守卫1',
	[11518] = '送给天空城秘密通道1层的</text><text color="255,0,0">1层联邦守卫2</text><text>，可以从</text><text color="255,0,0">联邦总督府（46,62）</text><text>进入秘密通道1层寻找1层联邦守卫2',
	[11519] = '送给天空城秘密通道1层的</text><text color="255,0,0">1层联邦守卫3</text><text>，可以从</text><text color="255,0,0">联邦总督府（46,62）</text><text>进入秘密通道1层寻找1层联邦守卫3',
	[11520] = '送给天空城秘密通道1层的</text><text color="255,0,0">1层联邦守卫4</text><text>，可以从</text><text color="255,0,0">联邦总督府（46,62）</text><text>进入秘密通道1层寻找1层联邦守卫4',
	[11521] = '送给天空城秘密通道1层的</text><text color="255,0,0">1层联邦守卫5</text><text>，可以从</text><text color="255,0,0">联邦总督府（46,62）</text><text>进入秘密通道1层寻找1层联邦守卫5',
	[11522] = '送给天空城秘密通道1层的</text><text color="255,0,0">1层联邦守卫6</text><text>，可以从</text><text color="255,0,0">联邦总督府（46,62）</text><text>进入秘密通道1层寻找1层联邦守卫6',
	[11523] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层联邦守卫1</text><text>，可以从</text><text color="255,0,0">联邦总督府（41,66）</text><text>进入秘密通道2层寻找2层联邦守卫1',
	[11524] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层联邦守卫2</text><text>，可以从</text><text color="255,0,0">联邦总督府（41,66）</text><text>进入秘密通道2层寻找2层联邦守卫2',
	[11525] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层联邦守卫3</text><text>，可以从</text><text color="255,0,0">联邦总督府（41,66）</text><text>进入秘密通道2层寻找2层联邦守卫3',
	[11526] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层联邦守卫4</text><text>，可以从</text><text color="255,0,0">联邦总督府（41,66）</text><text>进入秘密通道2层寻找2层联邦守卫4',
	[11527] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层联邦守卫5</text><text>，可以从</text><text color="255,0,0">联邦总督府（41,66）</text><text>进入秘密通道2层寻找2层联邦守卫5',
	[11528] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层联邦守卫6</text><text>，可以从</text><text color="255,0,0">联邦总督府（41,66）</text><text>进入秘密通道2层寻找2层联邦守卫6',
	[11529] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层联邦守卫7</text><text>，可以从</text><text color="255,0,0">联邦总督府（41,66）</text><text>进入秘密通道2层寻找2层联邦守卫7',
	[11530] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层联邦守卫8</text><text>，可以从</text><text color="255,0,0">联邦总督府（41,66）</text><text>进入秘密通道2层寻找2层联邦守卫8',
	[11531] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层联邦守卫9</text><text>，可以从</text><text color="255,0,0">联邦总督府（41,66）</text><text>进入秘密通道2层寻找2层联邦守卫9',
	[11532] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层联邦守卫10</text><text>，可以从</text><text color="255,0,0">联邦总督府（41,66）</text><text>进入秘密通道2层寻找2层联邦守卫10',
	[11303] = '送给天空城联邦交易所的</text><text color="255,0,0">联邦交易员</text><text>，可以从</text><text color="255,0,0">天空城（58,91）</text><text>进入联邦交易所寻找联邦交易员',
	[11013] = '送给天空城联邦研究所的</text><text color="255,0,0">联邦装备保养员</text><text>，可以从</text><text color="255,0,0">天空城（29,173）</text><text>进入联邦研究所寻找联邦装备保养员',
	[11009] = '送给天空城联邦研究所的</text><text color="255,0,0">联邦装备改造师</text><text>，可以从</text><text color="255,0,0">天空城（29,173）</text><text>进入联邦研究所寻找联邦装备改造师',
	[11019] = '送给天空城联邦装备店的</text><text color="255,0,0">联邦饰品商人</text><text>，可以从</text><text color="255,0,0">天空城（46,174）</text><text>进入联邦装备店寻找联邦饰品商人',
	[11015] = '送给天空城联邦装备店的</text><text color="255,0,0">联邦武器商人</text><text>，可以从</text><text color="255,0,0">天空城（46,174）</text><text>进入联邦装备店寻找联邦武器商人',
	[11017] = '送给天空城联邦装备店的</text><text color="255,0,0">联邦防具商人</text><text>，可以从</text><text color="255,0,0">天空城（46,174）</text><text>进入联邦装备店寻找联邦防具商人',
	[11023] = '送给天空城联邦装备店的</text><text color="255,0,0">联邦生产供应商</text><text>，可以从</text><text color="255,0,0">天空城（46,174）</text><text>进入联邦装备店寻找联邦生产供应商',
	[11021] = '送给天空城联邦药店的</text><text color="255,0,0">材料药品商</text><text>，可以从</text><text color="255,0,0">天空城（36,187）</text><text>进入联邦药店寻找材料药品商',
	[11269] = '送给天空城联邦学院的</text><text color="255,0,0">联邦生活技能导师</text><text>，可以从</text><text color="255,0,0">天空城（122,187）</text><text>进入联邦学院寻找联邦生活技能导师',
	[11027] = '送给天空城联邦学院的</text><text color="255,0,0">战斗技能导师</text><text>，可以从</text><text color="255,0,0">天空城（122,187）</text><text>进入联邦学院寻找战斗技能导师',
	[11025] = '送给天空城联邦宝石店的</text><text color="255,0,0">联邦宝石商人</text><text>，可以从</text><text color="255,0,0">天空城（75,73）</text><text>进入联邦宝石店寻找联邦宝石商人',
	[11011] = '送给天空城联邦宝石店的</text><text color="255,0,0">联邦珠宝工匠</text><text>，可以从</text><text color="255,0,0">天空城（75,73）</text><text>进入联邦宝石店寻找联邦珠宝工匠',
	[11005] = '送给天空城联邦教堂的</text><text color="255,0,0">联邦牧师</text><text>，可以从</text><text color="255,0,0">天空城（151,182）</text><text>进入联邦教堂寻找联邦牧师',

	[11501] = '送给天空城秘密通道1层的</text><text color="255,0,0">1层帝国守卫1</text><text>，可以从</text><text color="255,0,0">帝国总督府（42,66）</text><text>进入秘密通道1层寻找1层帝国守卫1',
	[11502] = '送给天空城秘密通道1层的</text><text color="255,0,0">1层帝国守卫2</text><text>，可以从</text><text color="255,0,0">帝国总督府（42,66）</text><text>进入秘密通道1层寻找1层帝国守卫2',
	[11503] = '送给天空城秘密通道1层的</text><text color="255,0,0">1层帝国守卫3</text><text>，可以从</text><text color="255,0,0">帝国总督府（42,66）</text><text>进入秘密通道1层寻找1层帝国守卫3',
	[11504] = '送给天空城秘密通道1层的</text><text color="255,0,0">1层帝国守卫4</text><text>，可以从</text><text color="255,0,0">帝国总督府（42,66）</text><text>进入秘密通道1层寻找1层帝国守卫4',
	[11505] = '送给天空城秘密通道1层的</text><text color="255,0,0">1层帝国守卫5</text><text>，可以从</text><text color="255,0,0">帝国总督府（42,66）</text><text>进入秘密通道1层寻找1层帝国守卫5',
	[11506] = '送给天空城秘密通道1层的</text><text color="255,0,0">1层帝国守卫6</text><text>，可以从</text><text color="255,0,0">帝国总督府（42,66）</text><text>进入秘密通道1层寻找1层帝国守卫6',
	[11507] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层帝国守卫1</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫1',
	[11508] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层帝国守卫2</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫2',
	[11509] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层帝国守卫3</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫3',
	[11510] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层帝国守卫4</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫4',
	[11511] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层帝国守卫5</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫5',
	[11512] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层帝国守卫6</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫6',
	[11513] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层帝国守卫7</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫7',
	[11514] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层帝国守卫8</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫8',
	[11515] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层帝国守卫9</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫9',
	[11516] = '送给天空城秘密通道2层的</text><text color="255,0,0">2层帝国守卫10</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫10',
	[11304] = '送给天空城帝国交易所的</text><text color="255,0,0">帝国交易员</text><text>，可以从</text><text color="255,0,0">钢铁城（61,183）</text><text>进入帝国交易所寻找帝国交易员',
	[11012] = '送给天空城帝国研究所的</text><text color="255,0,0">帝国装备保养员</text><text>，可以从</text><text color="255,0,0">钢铁城（115,173）</text><text>进入帝国研究所寻找帝国装备保养员',
	[11008] = '送给天空城帝国研究所的</text><text color="255,0,0">帝国装备改造师</text><text>，可以从</text><text color="255,0,0">钢铁城（115,173）</text><text>进入帝国研究所寻找帝国装备改造师',
	[11018] = '送给天空城帝国装备店的</text><text color="255,0,0">帝国饰品商人</text><text>，可以从</text><text color="255,0,0">钢铁城（110,145）</text><text>进入帝国装备店寻找帝国饰品商人',
	[11014] = '送给天空城帝国装备店的</text><text color="255,0,0">帝国武器商人</text><text>，可以从</text><text color="255,0,0">钢铁城（110,145）</text><text>进入帝国装备店寻找帝国武器商人',
	[11016] = '送给天空城帝国装备店的</text><text color="255,0,0">帝国防具商人</text><text>，可以从</text><text color="255,0,0">钢铁城（110,145）</text><text>进入帝国装备店寻找帝国防具商人',
	[11022] = '送给天空城帝国装备店的</text><text color="255,0,0">帝国生产供应商</text><text>，可以从</text><text color="255,0,0">钢铁城（110,145）</text><text>进入帝国装备店寻找帝国生产供应商',
	[11020] = '送给天空城帝国药店的</text><text color="255,0,0">材料药品商</text><text>，可以从</text><text color="255,0,0">钢铁城（118,136）</text><text>进入帝国药店寻找材料药品商',
	[11268] = '送给天空城帝国学院的</text><text color="255,0,0">帝国生活技能导师</text><text>，可以从</text><text color="255,0,0">钢铁城（67,126）</text><text>进入帝国学院寻找帝国生活技能导师',
	[11026] = '送给天空城帝国学院的</text><text color="255,0,0">战斗技能导师</text><text>，可以从</text><text color="255,0,0">钢铁城（67,126）</text><text>进入帝国学院寻找战斗技能导师',
	[11024] = '送给天空城帝国宝石店的</text><text color="255,0,0">帝国宝石商人</text><text>，可以从</text><text color="255,0,0">钢铁城（96,112）</text><text>进入帝国宝石店寻找帝国宝石商人',
	[11010] = '送给天空城帝国宝石店的</text><text color="255,0,0">帝国珠宝工匠</text><text>，可以从</text><text color="255,0,0">钢铁城（96,112）</text><text>进入帝国宝石店寻找帝国珠宝工匠',
	[11004] = '送给天空城帝国教堂的</text><text color="255,0,0">帝国主教</text><text>，可以从</text><text color="255,0,0">钢铁城（135,104）</text><text>进入帝国教堂寻找帝国主教',
}
]]

--  --------------------------------------------------------------------------------------------------------------
--  根据
--  --------------------------------------------------------------------------------------------------------------
--[[
function LoopTaskBodyGuard_GetMonsterHelpString(lMonsterID)
	local szHelpString = constTargetMonsterHelpString[lMonsterID]
	if nil==szHelpString then
		szHelpString = API_GetMonsterNameByID(lMonsterID)
		szHelpString = '送给'..szHelpString
	end
	return szHelpString
end
]]

--[[
-- 帝国的4个档次的NPC配置
local lTaskMonster_DG1 = {11304,11012,11008,11018,11014,11016,11022,11020,11268,11026,11024,11010,11004,11501,11502,11503,11504,11505,11506,11501,11502,11503,11504,11505,11506,11501,11502,11503,11504,11505,11506,11501,11502,11503,11504,11505,11506,11501,11502,11503,11504,11505,11506,11501,11502,11503,11504,11505,11506,11501,11502,11503,11504,11505,11506}
local lTaskMonster_DG2 = {11507,11508,11509,11510,11511,11512}
local lTaskMonster_DG3 = {11507,11508,11509,11510,11511,11512,11513,11514}
local lTaskMonster_DG4 = {11507,11508,11509,11510,11511,11512,11513,11514,11515,11516}

-- 联邦的4个档次的NPC配置
local lTaskMonster_LB1 = {11303,11013,11009,11019,11015,11017,11023,11021,11269,11027,11025,11011,11005,11517,11518,11519,11520,11521,11522,11517,11518,11519,11520,11521,11522,11517,11518,11519,11520,11521,11522,11517,11518,11519,11520,11521,11522,11517,11518,11519,11520,11521,11522,11517,11518,11519,11520,11521,11522,11517,11518,11519,11520,11521,11522}
local lTaskMonster_LB2 = {11523,11524,11525,11526,11527,11528}
local lTaskMonster_LB3 = {11523,11524,11525,11526,11527,11528,11529,11530}
local lTaskMonster_LB4 = {11523,11524,11525,11526,11527,11528,11529,11530,11531,11532}

local lTaskMonster_DG =
{
	[1] = lTaskMonster_DG1,
	[2] = lTaskMonster_DG2,
	[3] = lTaskMonster_DG3,
	[4] = lTaskMonster_DG4,
}
local lTaskMonster_LB =
{
	[1] = lTaskMonster_LB1,
	[2] = lTaskMonster_LB2,
	[3] = lTaskMonster_LB3,
	[4] = lTaskMonster_LB4,
}

--  --------------------------------------------------------------------------------------------------------------
--  根据任务等级获得一个目标NPC
--  --------------------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_GetTargetMonster(lActorID)
	local lTaskMonsterTable = lTaskMonster_DG
	local lCampId = API_GetActorCamp(lActorID)
	if 1==lCampId then
		lTaskMonsterTable = lTaskMonster_LB
	end

	local lMonsterId = 0
	local lTaskLevel = BodyGuard_GetAcceptedTaskLevel(lActorID)
	if 1==lTaskLevel then
		local lTabMonsters = lTaskMonsterTable[1]
		local lRandom = math.random(table.getn(lTabMonsters))
		lMonsterId = lTabMonsters[lRandom]
	elseif 2==lTaskLevel then
		local lRandom = math.random(100)
		local lTabMonsters = lTaskMonsterTable[2]
-- 		if lRandom<21 then
-- 			lTabMonsters = lTaskMonsterTable[1]
-- 		end
		lRandom = math.random(table.getn(lTabMonsters))
		lMonsterId = lTabMonsters[lRandom]
	elseif 3==lTaskLevel then
		local lRandom = math.random(100)
		local lTabMonsters = lTaskMonsterTable[3]
-- 		if lRandom<6 then
-- 			lTabMonsters = lTaskMonsterTable[1]
-- 		elseif lRandom>5 and lRandom<16 then
-- 			lTabMonsters = lTaskMonsterTable[2]
-- 		end
		lRandom = math.random(table.getn(lTabMonsters))
		lMonsterId = lTabMonsters[lRandom]
	else
		local lRandom = math.random(100)
		local lTabMonsters = lTaskMonsterTable[4]
-- 		if lRandom<3 then
-- 			lTabMonsters = lTaskMonsterTable[1]
-- 		elseif lRandom>2 and lRandom<9 then
-- 			lTabMonsters = lTaskMonsterTable[2]
-- 		elseif lRandom>8 and lRandom<10 then
-- 			lTabMonsters = lTaskMonsterTable[3]
-- 		end
		lRandom = math.random(table.getn(lTabMonsters))
		lMonsterId = lTabMonsters[lRandom]
	end
	return lMonsterId
end
]]

--  --------------------------------------------------------------------------------------------------------------
--  邮车配置
--  --------------------------------------------------------------------------------------------------------------
--[[
local lTabLoopTaskBody_DG1 = {20001,20006,20011,20016,20021}
local lTabLoopTaskBody_DG2 = {20002,20007,20012,20017,20022}
local lTabLoopTaskBody_DG3 = {20003,20008,20013,20018,20023}
local lTabLoopTaskBody_DG4 = {20004,20009,20014,20019,20024}
local lTabLoopTaskBody_DG5 = {20005,20010,20015,20020,20025}

local lTabLoopTaskBody_LB1 = {20026,20031,20036,20041,20046}
local lTabLoopTaskBody_LB2 = {20027,20032,20037,20042,20047}
local lTabLoopTaskBody_LB3 = {20028,20033,20038,20043,20048}
local lTabLoopTaskBody_LB4 = {20029,20034,20039,20044,20049}
local lTabLoopTaskBody_LB5 = {20030,20035,20040,20045,20050}

local lTabLoopTaskBody_DG =
{
	lTabLoopTaskBody_DG1,
	lTabLoopTaskBody_DG2,
	lTabLoopTaskBody_DG3,
	lTabLoopTaskBody_DG4,
	lTabLoopTaskBody_DG5,
	lTabLoopTaskBody_DG5,
	lTabLoopTaskBody_DG5,
	lTabLoopTaskBody_DG5,
	lTabLoopTaskBody_DG5,
	lTabLoopTaskBody_DG5,
	lTabLoopTaskBody_DG5
}
local lTabLoopTaskBody_LB =
{
	lTabLoopTaskBody_LB1,
	lTabLoopTaskBody_LB2,
	lTabLoopTaskBody_LB3,
	lTabLoopTaskBody_LB4,
	lTabLoopTaskBody_LB5,
	lTabLoopTaskBody_LB5,
	lTabLoopTaskBody_LB5,
	lTabLoopTaskBody_LB5,
	lTabLoopTaskBody_LB5,
	lTabLoopTaskBody_LB5,
	lTabLoopTaskBody_LB5
}
--  --------------------------------------------------------------------------------------------------------------
--  根据任务等级获得一个邮车ID
--  --------------------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_GetBodyID(lActorID)
	local lCampId = API_GetActorCamp(lActorID)
	local lTable = lTabLoopTaskBody_DG
	if 1==lCampId then
		lTable = lTabLoopTaskBody_LB
	end
	local lTaskLevel = BodyGuard_GetAcceptedTaskLevel(lActorID)
	local lTabBodys = lTable[lTaskLevel]
	local lRandom = math.random(table.getn(lTabBodys))
	local lBodyID = lTabBodys[lRandom]
	return lBodyID
end
]]

--  --------------------------------------------------------------------------------------------------------------
--  把配置文件加载进来
--  --------------------------------------------------------------------------------------------------------------
require 'Scp\\LUA\\Task\\LoopTaskBodyGuardConfig.lua'

--  --------------------------------------------------------------------------------------------------------------
-- 获得状态配置值
--  --------------------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_GetStatusValue(lActorID, nStatusID)
	local nStatusValue = 0
	if 1==nStatusID then
		local nRandom = math.random(100)
		if nRandom<constBodyStatusPercent then
			nRandom = math.random(table.getn(constBodyStatusID))
			nStatusValue = constBodyStatusID[nRandom]
		end
	elseif 2==nStatusID then
		local nRandom = math.random(100)
		if nRandom<constBodyStatusPercent then
			nRandom = math.random(table.getn(constMovingStatusID))
			nStatusValue = constMovingStatusID[nRandom]
		end
	end
	DBG_TRACE('快递任务:取得第'..nStatusID..'个附加状态ID('..nStatusValue..')')
	return nStatusValue
end

--  --------------------------------------------------------------------------------------------------------------
--  刷怪物出来
--  --------------------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_GetQiangDaoMonsterID(lActorID)
	local lExpLevel = API_GetActorExpLevel(lActorID)
	local nQiangDaoTypeID = math.random(8)
	local nBaseMonsterID = 55020 + (55 * (nQiangDaoTypeID-1))
	local nOffset = 0
	if math.random(100)<91 then
		if math.random(100)<61 then
			nOffset = lExpLevel + 4
		else
			nOffset = lExpLevel - 4
		end
	else
		nOffset = lExpLevel + 9
	end
	if nOffset<0 then
		nOffset = 0
	elseif nOffset>54 then
		nOffset = 54
	end
	local nMonsterID = nBaseMonsterID + nOffset
	DBG_TRACE('快递任务:刷怪MonsterID='..nMonsterID)
	return nMonsterID
end

function LoopTaskBodyGuard_IsCreateMonsterMapID(lMapID)
	--local nMapID = API_GetStaticMapID(lMapID)
	local nMapID = TaskPub_GetStaticMapID(lMapID)
	for nKey,nMapValue in pairs(constCreateMonsterMapList) do
		if nMapID==nMapValue then
			return 1
		end
	end
	return 0
end

function LoopTaskBodyGuard_CreateMonsterOnTimer(lActorID)
	local lFastId = API_VarDataGetNumber(lActorID, 0, constFastID)
	if lFastId<=0 or API_GetMonsterID(lFastId)<=0 then
		return
	end
	local nMapID = API_GetMonsterMap(lFastId)
	if 0==LoopTaskBodyGuard_IsCreateMonsterMapID(nMapID) then
		return
	end

	--创建怪物
	local lCampId = API_GetActorCamp(lActorID)
	local nTileX = API_GetMonsterPosX(lFastId)
	local nTileY = API_GetMonsterPosY(lFastId)

	local nFastList = g_nBodyGuardFastList[lActorID]
	if nil==nFastList then
		g_nBodyGuardFastList[lActorID] = {}
		nFastList = g_nBodyGuardFastList[lActorID]
		if nil==nFastList then
			return
		end
	end

    local nActorLevel = API_GetActorExpLevel(lActorID)
    local nMonsterOffset = 0
	local nAddCount = math.random(1,3)
	for i=1,nAddCount do
		local lMonsterID = LoopTaskBodyGuard_GetQiangDaoMonsterID(lActorID)
		local nMonsterLevel = API_GetMonsterLvByID(lMonsterID)
		if nMonsterLevel>=(nActorLevel+9) then
            nMonsterOffset = nMonsterOffset + 1
		end
		if (lMonsterID>0) and (nMonsterOffset<3) then
			local nFID = API_CreateMonsterEx(nMapID,lMonsterID,nTileX,nTileY,4,0,1-lCampId,-1)
			if nFID>0 then
                nFastList[nFID] = 1
            end
		end
	end

	if lFastId>0 and API_GetMonsterID(lFastId)>0 then
		DBG_TRACE('快递任务:邮车周围刷怪,给邮车添加附加状态('..constXuanYunEffValue..'),状态时间:'..constXuanYunEffTimeout..'ms')
		if true==API_ActorFindStatus(lActorID, constXuanYunEffValue) then
			if false==API_MonsterAddStatus(lFastId, constXuanYunEffValue, constXuanYunEffTimeout) then
				API_Trace('快递任务:给邮车('..lFastId..')添加附加状态('..constXuanYunEffValue..')失败!')
			end
		else
			DBG_TRACE('快递任务:邮车周围刷怪,给邮车添加附加状态('..constXuanYunEffValue..'),时发现该状态已经存在')
		end
	end
end

-- -------------------------------------------------------------------------------------------------------------
-- 计算奖励 ：金币和功勋
-- -------------------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_AddActorAward(lActorID)
	local lTaskLevel = BodyGuard_GetAcceptedTaskLevel(lActorID)
	local lAddMoney = BodyGuard_GetTaskDeposit(lActorID,lTaskLevel)
	local lAwardMoney = API_VarDataGetNumber(lActorID, 1, constAward)
	TaskPub_SendSysMsg(lActorID, '完成快递任务')
	if 1==lTaskLevel then
		local lAwardTypeID = API_VarDataGetNumber(lActorID, 0, constAwardTypeID)
		if 1==lAwardTypeID then
			API_ActorAddMoney(lActorID, lAddMoney, constTaskID, '快递押金')
			TaskPub_SendSysMsg(lActorID, '返还'..lAddMoney..'金币的押金')
		else
			API_AddActorGoodsEx(lActorID, constBuyBillID, lAddMoney, 0,"快递押金")
			TaskPub_SendSysMsg(lActorID, '返还'..lAddMoney..'购物券的押金')
		end
	else
		API_ActorAddMoney(lActorID, lAddMoney, constTaskID, '快递押金')
		TaskPub_SendSysMsg(lActorID, '返还'..lAddMoney..'金币的押金')
	end
	
	API_ActorAddExp(lActorID, lAwardMoney, constTaskID, '快递奖励')
	TaskPub_SendSysMsg(lActorID, '获得'..lAwardMoney..'功勋奖励')
	LoopTaskBodyGuard_AddGoodsAward(lActorID)
end

function LoopTaskBodyGuard_AddGoodsAward(lActorID)
	local nRandom = math.random(100)
	local lTaskLevel = BodyGuard_GetAcceptedTaskLevel(lActorID)
	if nRandom < ( ( lTaskLevel < 3 and 50 ) or 25 ) then
		local nGoodsID = ( ( lTaskLevel < 3 and 80408 ) or 80409 )
		if -1 == API_ActorCanAddGoods(lActorID, nGoodsID, 1, 0,0 ) then
			API_SendActorMail( lActorID, nGoodsID, 1, "快递任务奖励", "")
			TaskPub_SendSysMsg(lActorID, '获得1个'..API_GetGoodsName(nGoodsID).."已邮寄")
		else
			API_AddActorGoods( lActorID, nGoodsID, 1, "快递任务奖励" )
			TaskPub_SendSysMsg(lActorID, '获得1个'..API_GetGoodsName(nGoodsID))
		end
	end
end

--  --------------------------------------------------------------------------------------------------------------
-- 快递配置入口
--  --------------------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_TaskMain(lActorID, lTaskCount)
	local lTastState = API_VarDataGetNumber(lActorID, 1, constTaskID)
	if lTastState>0 then
		return
	end

	local lTargetID = LoopTaskBodyGuard_GetTargetMonster(lActorID)
	local lMonsterID = LoopTaskBodyGuard_GetBodyID(lActorID)

	API_VarDataSetNumber(lActorID, 1, constTargetID, lTargetID)
	API_VarDataSetNumber(lActorID, 1, constMonsterID, lMonsterID)
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_Title()
	-- 获取当前交互的玩家ID
	local lActorID = API_RequestGetActorID()
	-- 属于接受任务列表
	local lType = API_RequestGetNumber(1)
	if 2 == lType then
		LoopTaskBodyGuard_TitleAccept(lActorID)
	-- 属于完成任务列表
	elseif 1 == lType then
		LoopTaskBodyGuard_TitleFinish(lActorID)
	-- 属于还没有完成的任务列表
	elseif 3==lType then
		LoopTaskBodyGuard_TitleUndone(lActorID)

	elseif 10==lType then
		LoopTaskBodyGuard_TitleAcceptTask(lActorID)
	elseif 11==lType then
		LoopTaskBodyGuard_TitleDescription(lActorID)
	end
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_TitleAccept(lActorID)
	API_ResponseWrite('<text>  快递局广招天下英雄送快递，爵位越高所能领取的快递任务档次越高，你现在的爵位可以完成</text><br><br>')
	local lTaskLevel = BodyGuard_GetAcceptedTaskLevel(lActorID)
	local lMoney = BodyGuard_GetTaskDeposit(lActorID,lTaskLevel)
	local szText = ''
	if 1==lTaskLevel then
		szText = '一档任务(需要押金:'..lMoney..'购物券或金币)'
	elseif 2==lTaskLevel then
		szText = '二档任务(需要押金:'..lMoney..'金币)'
	elseif 3==lTaskLevel then
		szText = '三档任务(需要押金:'..lMoney..'金币)'
	else
		szText = '四档任务(需要押金:'..lMoney..'金币)'
	end
	API_ResponseWrite('<a href="LoopTaskBodyGuard_Title?1=10">  '..szText..' </a><br>')
	API_ResponseWrite('<a href="LoopTaskBodyGuard_Title?1=11">  任务说明 </a><br>')
	API_ResponseWrite('<a>  取消  </a><br>')
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(接受)
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_TitleAcceptTask(lActorID)

	local lMonsterId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local lGoodsId = API_VarDataGetNumber(lActorID, 1, constMonsterID)
	local szGoodsName = API_GetMonsterNameByID(lGoodsId)
	local szName = LoopTaskBodyGuard_GetMonsterHelpString(lMonsterId)

	local lTaskLevel = BodyGuard_GetAcceptedTaskLevel(lActorID)
	local lNeedMoney = BodyGuard_GetTaskDeposit(lActorID,lTaskLevel)

	if 1==lTaskLevel then
		local lGoodsNum = API_ActorGetGoodsNum(lActorID,constBuyBillID)
		if lGoodsNum<lNeedMoney then
			local lNowMoney = TaskPub_GetActorMoney(lActorID)
			if lNowMoney<lNeedMoney then
				API_ResponseWrite('<text>  现在，这里有个'..szGoodsName..'要'..szName..'，但你的押金不足，暂时不能给你任务。</text><br><br>')
				API_ResponseWrite('<a href="LoopTaskBodyGuard_Title?1=2">  返回 </a><br>')
				API_ResponseWrite('<a>  取消  </a><br>')
			else
				API_ResponseWrite('<text>  现在，这里有个'..szGoodsName..'要'..szName..'，一路小心。</text><br><br>')
				API_ResponseWrite('<a href="Task_SelectAccept?1='..constTaskID..'">  交给我，你放心 </a><br>')
				API_ResponseWrite('<a>  取消  </a><br>')
			end
		else
			API_ResponseWrite('<text>  现在，这里有个'..szGoodsName..'要'..szName..'，一路小心。</text><br><br>')
			API_ResponseWrite('<a href="Task_SelectAccept?1='..constTaskID..'">  交给我，你放心 </a><br>')
			API_ResponseWrite('<a>  取消  </a><br>')
		end
	else
		local lNowMoney = TaskPub_GetActorMoney(lActorID)
		if lNowMoney<lNeedMoney then
			API_ResponseWrite('<text>  现在，这里有个'..szGoodsName..'要'..szName..'，但你的押金不足，暂时不能给你任务。</text><br><br>')
			API_ResponseWrite('<a href="LoopTaskBodyGuard_Title?1=2">  返回 </a><br>')
			API_ResponseWrite('<a>  取消  </a><br>')
		else
			API_ResponseWrite('<text>  现在，这里有个'..szGoodsName..'要'..szName..'，一路小心。</text><br><br>')
			API_ResponseWrite('<a href="Task_SelectAccept?1='..constTaskID..'">  交给我，你放心 </a><br>')
			API_ResponseWrite('<a>  取消  </a><br>')
		end
	end
end

-- ------------------------------------------------------------------------------------------------
--  任务说明
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_TitleDescription(lActorID)
	local szText = '<text>  快递任务接取需要玩家等级至少达到十等男爵，每位玩家每天（00：00—24：00）最多可以完成任务3次，如果在快递发货时间内（</text>'
	szText = szText..'<text color="255,0,0">帝国：12：00-13：00、19：30-20：30；联邦：13：00-14：00、20：30-21：30</text>'
	szText = szText..'<text>）进行任务，任务奖励增加1倍。邮车护送过程中会遇到怪物攻击邮车(主城不会遇到怪物)。'
	szText = szText..'玩家可以以劫取敌对阵营的邮车获得奖励（劫取和玩家爵位处于同一大档或高于玩家爵位大档的邮车，获得'
	szText = szText..'对方押金100%，劫取低于玩家爵位1大档的邮车，获得对方押金50%，劫取低于玩家爵位2大档以上的邮车，无法获得对方押金）！'
	szText = szText..'邮车的玩家死亡、邮车生命为0、玩家离邮车太远超时、玩家下线后，任务将失败！</text>'

	API_ResponseWrite(szText..'<br><br>')
	API_ResponseWrite('<a href="LoopTaskBodyGuard_Title?1=2">  明白 </a><br>')
	API_ResponseWrite('<a>  取消 </a><br>')
end

-- -------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(待完成)
-- -------------------------------------------------------------------------
function LoopTaskBodyGuard_TitleUndone(lActorID)
	local lMonsterId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local lGoodsId = API_VarDataGetNumber(lActorID, 1, constMonsterID)
	local szMonsterName = LoopTaskBodyGuard_GetMonsterHelpString(lMonsterId)
	local szGoodsName = API_GetMonsterNameByID(lGoodsId)

	API_ResponseWrite('<text>  赶紧把'..szGoodsName..szMonsterName..'。</text><br><br>')
	API_ResponseWrite('<a>    明白 </a><br>')
end

-- ------------------------------------------------------------------------------------------------
-- 玩家选择本任务标题后触发此函数(完成)
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_TitleFinish(lActorID)
	local lAwardMoney = API_VarDataGetNumber(lActorID, 1, constAward)
	API_ResponseWrite('<text>这就是我的包裹吗,太谢谢你了. 这</text><text color="255,128,0">  '..lAwardMoney..'  </text><text>功勋是给你的奖励,如果您运气好的话有概率获得点化魔盒.</text><br><br>')
	API_ResponseWrite('<a href="Task_SelectFinish?1='..constTaskID..'">   不客气 </a><br>')
end

-- ------------------------------------------------------------------------------------------------
-- 玩家可接受本任务的条件
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_CanAccept(lActorID, lNPCID)
	local lTaskState = API_VarDataGetNumber(lActorID, 1, constTaskID)
	if 0~=lTaskState then
		DBG_TRACE('LoopTaskBodyGuard_CanAccept 1')
		return 0
	end

	if 0==BodyGuard_CanAcceptBodyGuard(lActorID) then
		DBG_TRACE('LoopTaskBodyGuard_CanAccept 2')
		return 0
	end

	local lTarMonsterID = API_VarDataGetNumber(lActorID, 1, constTargetID)
	if lTarMonsterID<=0 then
		DBG_TRACE('LoopTaskBodyGuard_CanAccept 3')
		return 0
	end

	local lTaskCount = BodyGuard_GetTaskCount(lActorID)
	if lTaskCount>=BodyGuard_MaxCount() then
		DBG_TRACE('LoopTaskBodyGuard_CanAccept 4')
		return 0
	end
	
	return 1
end

-- ------------------------------------------------------------------------------------------------
-- 玩家可完成本任务的条件
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_CanFinish(lActorID, lNPCID)
	-- 如果不是目的NPC，则不能完成
	local lTargetId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	if lNPCID ~= lTargetId then
		return 0
	end

	-- 判断邮车距离
	local lFastId = API_VarDataGetNumber(lActorID, 0, constFastID)
	if lFastId<=0 or API_GetMonsterID(lFastId)<=0 then
		return 0
	end
	local lMonsterMapID = API_GetMonsterMap(lFastId)
	local lMapID = TaskPub_GetActorMapID(lActorID)
	local lMonsterPosX = API_GetMonsterPosX(lFastId)
	local lMonsterPosY = API_GetMonsterPosY(lFastId)
	local lPosX = API_GetActorPosX(lActorID)
	local lPosY = API_GetActorPosY(lActorID)
	if lMonsterMapID~=lMapID or math.abs(lPosX-lMonsterPosX)>constMaxTitle or math.abs(lPosY-lMonsterPosY)>constMaxTitle then
		return 0
	end

	return 1
end

-- -------------------------------------------------------------------------
-- 玩家准备放弃本任务的条件
-- -------------------------------------------------------------------------
function LoopTaskBodyGuard_CanGiveup(lActorID, lNPCID)
	DBG_TRACE('LoopTaskBodyGuard_CanGiveup('..lActorID..','..lNPCID..')')
	return 1
end

-- ------------------------------------------------------------------------------------------------
-- 时间触发器触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_OnTimerOfCreateMonster(lActorID, lTaskId)
	LoopTaskBodyGuard_CreateMonsterOnTimer(lActorID)
	-- 继续刷怪触发器
	local nTimeOffset = math.random(60,90)
	API_CreateTimerTrigger(lActorID, nTimeOffset, 1, constTaskID, 'LoopTaskBodyGuard_OnTimerOfCreateMonster')
end

-- ------------------------------------------------------------------------------------------------
-- 时间触发器触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_OnTimerOfKillMonster(lActorID, lTaskId)
	local nRemoveList = {}
	local nFastList = g_nBodyGuardFastList[lActorID]
	if nil==nFastList then
		return
	end

	for nFastID,nValue in pairs(nFastList) do
		if nValue>2 then
			if nFastID>0 and API_GetMonsterID(nFastID)>0 then
				API_DestroyMonster(nFastID)
				table.insert(nRemoveList,nFastID)
			end
		else
			nFastList[nFastID] = nValue + 1
		end
	end

	if nil~=nRemoveList then
		for i,nKey in pairs(nRemoveList) do
			table.remove(nFastList,nKey)
		end
	end

	if table.getn(nFastList)<=0 then
		table.remove(g_nBodyGuardFastList,lActorID)
	end
end

function LoopTaskBodyGuard_OnKillCreateMonster(lActorID)
	local nFastList = g_nBodyGuardFastList[lActorID]
	if nil==nFastList then
		return
	end
	for nFastID,nValue in pairs(nFastList) do
		if nFastID>0 and API_GetMonsterID(nFastID)>0 then
			API_DestroyMonster(nFastID)
		end
	end
	table.remove(g_nBodyGuardFastList,lActorID)
end

-- ------------------------------------------------------------------------------------------------
-- 时间触发器
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_OnTimerOfKillYouChe(lActorID, lTaskID)
	local lFastId = API_VarDataGetNumber(lActorID, 0, constFastID)
	if lFastId<=0 or API_GetMonsterID(lFastId)<=0 then
		DBG_TRACE('快递任务:时间触发器,邮车不见了')
		return
	end

	local lMonsterMapID = API_GetMonsterMap(lFastId)
	local lMonsterPosX = API_GetMonsterPosX(lFastId)
	local lMonsterPosY = API_GetMonsterPosY(lFastId)
	local lMapID = TaskPub_GetActorMapID(lActorID)
	local lPosX = API_GetActorPosX(lActorID)
	local lPosY = API_GetActorPosY(lActorID)
	if lMonsterMapID==lMapID and math.abs(lPosX-lMonsterPosX)<constMaxKillTimeTitle and math.abs(lPosY-lMonsterPosY)<constMaxKillTimeTitle then
		g_BodyGuardKillYouChe[lActorID] = 0
	else
		if nil==g_BodyGuardKillYouChe[lActorID] then
			g_BodyGuardKillYouChe[lActorID] = 0
		end
		local nValue = g_BodyGuardKillYouChe[lActorID]
		nValue = nValue + 1
		g_BodyGuardKillYouChe[lActorID] = nValue
		local nCount = constMaxKillTimeNum - nValue
		local nCountSecond = nCount * constMaxKillTimeSpan

		local szMapName = TaskPub_GetMapNameByID(lMonsterMapID)
		local nPosX = API_TileToPixelX(lMonsterMapID, lMonsterPosX, lMonsterPosY)
		local nPosY = API_TileToPixelY(lMonsterMapID, lMonsterPosX, lMonsterPosY)
		-- DBG_TRACE('API_TileToPixel('..lMonsterMapID..','..lMonsterPosX..','..lMonsterPosY..')==>('..nPosX..','..nPosY..')')
		if nValue<=1 then
            TaskPub_SendNotifyMsg(lActorID,'邮车遗失在'..szMapName..'('..nPosX..','..nPosY..')附近')
            TaskPub_SendMessage(lActorID, '邮车遗失在'..szMapName..'('..nPosX..','..nPosY..')附近,'..nCountSecond..'秒')
		else
            TaskPub_SendMessage(lActorID, '邮车遗失在'..szMapName..'('..nPosX..','..nPosY..')附近,'..nCountSecond..'秒')
		end
		if nCount<=0 then
			TaskPub_SendSysMsg(lActorID, '遗失邮车,该次快递任务失败')
			API_GiveupTask(lActorID, lTaskID)
		end
	end
end

-- ------------------------------------------------------------------------------------------------
-- 玩家创建邮船
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_CreateMonster(lActorID,lMapId,lPosX,lPosY)
	local lMonsterID = API_VarDataGetNumber(lActorID, 1, constMonsterID)
	if 0==lMonsterID then
		DBG_TRACE('快递任务:邮车MonsterID='..lMonsterID..'错误')
		return 0
	end
	if 0==lMapId then
		lMapId = TaskPub_GetActorMapID(lActorID)
	end
	if 0==lPosX then
		lPosX = API_GetActorPosX(lActorID)
	end
	if 0==lPosY then
		lPosY = API_GetActorPosY(lActorID)
	end

	local lFastId = API_CreateMonster(lMapId, lMonsterID, lPosX, lPosY, 4, 0, -1)
	if nil==lFastId or lFastId<=0 or API_GetMonsterID(lFastId)<=0 then
		DBG_TRACE('快递任务:创建邮车失败('..lMonsterID..')')
		return 0
	end
	API_VarDataSetNumber(lActorID, 0, constFastID, lFastId)
	API_SetActorChief(lFastId, lActorID)

	local szActorName = API_GetActorName(lActorID)
	local szMonsterName = API_GetMonsterName(lFastId)
	API_SetMonsterName(lFastId, szActorName..'的'..szMonsterName, 1)

	local nStatus = API_VarDataGetNumber(lActorID, 1, constStatusID1)
	if nStatus>0 then
		DBG_TRACE('快递任务:给邮车添加第1个附加状态('..nStatus..')')
		if false==API_MonsterAddStatus(lFastId, nStatus, -1) then
			API_Trace('快递任务:给邮车('..lMonsterID..':'..lFastId..')添加附加状态('..nStatus..')失败!')
		end
	end
	nStatus = API_VarDataGetNumber(lActorID, 0, constStatusID2)
	if nStatus>0 then
		DBG_TRACE('快递任务:给邮车添加第2个附加状态('..nStatus..')')
		if false==API_MonsterAddStatus(lFastId, nStatus, -1) then
			API_Trace('快递任务:给邮车('..lMonsterID..':'..lFastId..')添加附加状态('..nStatus..')失败!')
		end
	end

	local nOldLeftValue = API_VarDataGetNumber(lActorID, 0, constLeftValue)
	-- DBG_TRACE('快递任务:邮车旧的血量'..nOldLeftValue)
	if nOldLeftValue>0 then
		local nLeftValue = API_MonsterGetPropNum(lFastId, PD_PROP_HP)
		local nAddValue = nOldLeftValue - nLeftValue
		-- DBG_TRACE('快递任务:邮车(Max='..nLeftValue..')旧血量('..nOldLeftValue..'),减少('..nAddValue..')')
		API_MonsterAddHP(lFastId, nAddValue)
		API_VarDataSetNumber(lActorID, 0, constLeftValue, 0)
	end

	local lTriggerId = API_CreateDieTrigger(lActorID, 0, lFastId, constTaskID, 'LoopTaskBodyGuard_DieCallback')
	if 0==lTriggerId then
		DBG_TRACE('快递任务:创建邮车死亡触发器失败')
	end
	API_VarDataSetNumber(lActorID, 0, constDieTriggerID, lTriggerId)
	return lFastId
end

-- ------------------------------------------------------------------------------------------------
-- 销毁邮船
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_DestoryMonster(lActorID,lFlag)
	local lTriggerId = API_VarDataGetNumber(lActorID, 0, constDieTriggerID)
	if lTriggerId>0 then
		API_VarDataSetNumber(lActorID, 0, constDieTriggerID, 0)
		API_DestroyTrigger(lActorID, constTaskID, lTriggerId)
	end
	local lFastId = API_VarDataGetNumber(lActorID, 0, constFastID)
	if lFastId>0 and API_GetMonsterID(lFastId)>0 then
		API_VarDataSetNumber(lActorID, 0, constFastID, 0)
		if 1==lFlag then
			local nLeftValue = API_MonsterGetPropNum(lFastId, PD_PROP_HP)
			API_VarDataSetNumber(lActorID, 0, constLeftValue, nLeftValue)
		end
		API_DestroyMonster(lFastId)
	end
	API_VarDataSetNumber(lActorID, 0, constFastID, 0)
end

-- ------------------------------------------------------------------------------------------------
-- 玩家在做本任务时切换地图前调用此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_SWPrevMap(lActorID)
	local lTastState = API_VarDataGetNumber(lActorID, 1, constTaskID)
	if lTastState<=0 then
		return
	end

	local lFastId = API_VarDataGetNumber(lActorID, 0, constFastID)
	if lFastId<=0 or API_GetMonsterID(lFastId)<=0 then
		return
	end

	local lMonsterMapID = API_GetMonsterMap(lFastId)
	local lMapID = TaskPub_GetActorMapID(lActorID)

	local lMonsterPosX = API_GetMonsterPosX(lFastId)
	local lMonsterPosY = API_GetMonsterPosY(lFastId)
	local lPosX = API_GetActorPosX(lActorID)
	local lPosY = API_GetActorPosY(lActorID)

	if lMonsterMapID==lMapID and math.abs(lPosX-lMonsterPosX)<constMaxTitle and math.abs(lPosY-lMonsterPosY)<constMaxTitle then
		-- DBG_TRACE('切换地图前,删除邮车')
		LoopTaskBodyGuard_DestoryMonster(lActorID,1)
		API_VarDataSetNumber(lActorID, 1, constCreateMonster, 0)
	else
		if lMonsterMapID==lMapID then
			-- DBG_TRACE('切换地图前,解除和邮车的关系')
			API_DelChief(lFastId)
		end
		API_VarDataSetNumber(lActorID, 1, constCreateMonster, 1)
	end
end

-- ------------------------------------------------------------------------------------------------
-- 玩家在做本任务时切换地图后调用此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_SwitchMap(lActorID)
	local lTastState = API_VarDataGetNumber(lActorID, 1, constTaskID)
	if lTastState<=0 then
		return
	end

	-- 判断邮车MonsterID
	local lMonsterID = API_VarDataGetNumber(lActorID, 1, constMonsterID)
	if lMonsterID<=0 then
		return
	end

	-- 处理创建问题
	local lCreate = API_VarDataGetNumber(lActorID, 1, constCreateMonster)
	if 1==lCreate then
		local lFastId = API_VarDataGetNumber(lActorID, 0, constFastID)
		if lFastId<=0 or API_GetMonsterID(lFastId)<=0 then
			return
		end

		local lActorMapId = TaskPub_GetActorMapID(lActorID)
		local lMonsterMapID = API_GetMonsterMap(lFastId)
		if lActorMapId==lMonsterMapID then
			API_SetActorChief(lFastId, lActorID)
		end
	elseif 0==lCreate then
		LoopTaskBodyGuard_CreateMonster(lActorID,0,0,0)
	end
end

-- ------------------------------------------------------------------------------------------------
-- 玩家在做通道切换前调用此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_ChunnelVerdict(lActorID,nChunnelID,lNowMapID,lTargetMapID)

	DBG_TRACE('快递任务:nChunnelID='..nChunnelID)

	local lTastState = API_VarDataGetNumber(lActorID, 1, constTaskID)
	if lTastState<=0 then
		DBG_TRACE('快递任务:nChunnelID2='..nChunnelID)
		return 1
	end

	local lFastId = API_VarDataGetNumber(lActorID, 0, constFastID)
	if lFastId<=0 or API_GetMonsterID(lFastId)<=0 then
		DBG_TRACE('快递任务:nChunnelID3='..nChunnelID)
		return 1
	end

	local lMonsterMapID = API_GetMonsterMap(lFastId)
	local lMapID = TaskPub_GetActorMapID(lActorID)

	local lMonsterPosX = API_GetMonsterPosX(lFastId)
	local lMonsterPosY = API_GetMonsterPosY(lFastId)
	local lPosX = API_GetActorPosX(lActorID)
	local lPosY = API_GetActorPosY(lActorID)

	if lMonsterMapID==lMapID and math.abs(lPosX-lMonsterPosX)<constMaxTitle and math.abs(lPosY-lMonsterPosY)<constMaxTitle then
		DBG_TRACE('快递任务:nChunnelID4='..nChunnelID)
		if 12==nChunnelID then
			LoopTaskBodyGuard_DestoryMonster(lActorID,1)
			LoopTaskBodyGuard_CreateMonster(lActorID,2,260,186)
		elseif 9==nChunnelID then
			LoopTaskBodyGuard_DestoryMonster(lActorID,1)
			LoopTaskBodyGuard_CreateMonster(lActorID,2,205,175)
		elseif 11==nChunnelID then
			LoopTaskBodyGuard_DestoryMonster(lActorID,1)
			LoopTaskBodyGuard_CreateMonster(lActorID,2,310,218)
		elseif 10==nChunnelID then
			LoopTaskBodyGuard_DestoryMonster(lActorID,1)
			LoopTaskBodyGuard_CreateMonster(lActorID,2,150,237)
		end
	else
		DBG_TRACE('快递任务:nChunnelID5='..nChunnelID)
		if lMonsterMapID==lMapID then
			DBG_TRACE('快递任务:nChunnelID6='..nChunnelID)
			return 0
		end
	end
	return 1
end

-- -----------------------------------------------------------------------------------
-- 创建怪物死亡触发器
-- -----------------------------------------------------------------------------------
function LoopTaskBodyGuard_DieCallback(lActorID, lTaskID, lType, lID, lKillerType, lKillID)
	if 0~=lType then
		return
	end
	local lMonsterID = API_VarDataGetNumber(lActorID, 1, constMonsterID)
	local lFastId = API_VarDataGetNumber(lActorID, 0, constFastID)
	if lID==lMonsterID or lID==lFastId then
		if 1==lKillerType and lKillID>0 then
			local lActorCampID = API_GetActorCamp(lActorID)
			local lKillerCampID = API_GetActorCamp(lKillID)
			if lActorCampID~=lKillerCampID then
				local lExpLevel = API_GetActorPeerageLevel(lActorID)
				local lKillerExpLevel = API_GetActorPeerageLevel(lKillID)
				local nExpOffset = lKillerExpLevel - lExpLevel
				local lTaskLevel = BodyGuard_GetAcceptedTaskLevel(lActorID)
				local lDeposit = BodyGuard_GetTaskDeposit(lActorID,lTaskLevel)
				if nExpOffset<=0 then
					if 1==lTaskLevel then
						local lAwardTypeID = API_VarDataGetNumber(lActorID, 0, constAwardTypeID)
						if 1==lAwardTypeID then
							API_ActorAddMoney(lKillID, lDeposit, 0, '抢劫邮车')
							TaskPub_SendMessage(lKillID, '抢劫邮车,获利'..lDeposit..'金币')
						else
							API_AddActorGoodsEx(lKillID, constBuyBillID, lDeposit, 0, '抢劫邮车')
							TaskPub_SendMessage(lKillID, '抢劫邮车,获得'..lDeposit..'购物券')
						end
					else
						API_ActorAddMoney(lKillID, lDeposit, 0, '抢劫邮车')
						TaskPub_SendMessage(lKillID, '抢劫邮车,获利'..lDeposit..'金币')
					end
				elseif nExpOffset>0 and nExpOffset<=2 then
					lDeposit = math.floor(lDeposit/2)
					if 1==lTaskLevel then
						API_AddActorGoodsEx(lKillID, constBuyBillID, lDeposit, 0, '抢劫邮车')
						TaskPub_SendMessage(lKillID, '抢劫邮车,获得'..lDeposit..'购物券')
					else
						API_ActorAddMoney(lKillID, lDeposit, 0, '抢劫邮车')
						TaskPub_SendMessage(lKillID, '抢劫邮车,获利'..lDeposit..'金币')
					end
				end
			end
		end
		API_GiveupTask(lActorID, lTaskID)
	end
	local szName = API_GetMonsterNameByID(lMonsterID)
	TaskPub_SendMessage(lActorID, szName..'被劫，该次快递任务失败')
end

-- ------------------------------------------------------------------------------------------------
--  玩家死亡触发器回调
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_ActorDieCallback(lActorID, lTaskID, lType, lID, lKillerType, lKillID)
	DBG_TRACE('LoopTaskBodyGuard_ActorDieCallback('..lActorID..','..lTaskID..','..lType..','..lID..','..lKillerType..','..lKillID..')')
	
	if 1~=lType or lActorID~=lID or (-1==lKillerType and -1==lKillID) then
		DBG_TRACE("玩家死亡触发器回调:不是自己相关的")
		if -1==lKillerType and -1==lKillID then
			-- 创建一个玩家死亡触发器
			local lActorTrigID = API_CreateDieTrigger(lActorID,1,lActorID,constTaskID, 'LoopTaskBodyGuard_ActorDieCallback')
			if lActorTrigID<=0 then
				API_Trace('快递任务:创建玩家死亡触发器失败')
			end	
		end
		return
	end
	
	DBG_TRACE('2==LoopTaskBodyGuard_ActorDieCallback('..lActorID..','..lTaskID..','..lType..','..lID..','..lKillerType..','..lKillID..')')

	-- 置任务失败
	API_GiveupTask(lActorID, lTaskID)
	
	-- 发送消息到客户端
	TaskPub_SendMessage(lActorID, '玩家死亡，请继续努力')
end

-- ------------------------------------------------------------------------------------------------
-- 玩家接受本任务时触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_Accept(lActorID, lNPCID)
	-- 计算状态效果
	local nStatusID1 = LoopTaskBodyGuard_GetStatusValue(lActorID,1)
	local nStatusID2 = LoopTaskBodyGuard_GetStatusValue(lActorID,2)
	if nStatusID1>0 then
		API_VarDataSetNumber(lActorID, 1, constStatusID1, nStatusID1)
	end
	if nStatusID2>0 then
		API_VarDataSetNumber(lActorID, 0, constStatusID2, nStatusID2)
	end

	local lFastId = LoopTaskBodyGuard_CreateMonster(lActorID,0,0,0)
	if lFastId<=0 or API_GetMonsterID(lFastId)<=0 then
		DBG_TRACE('快递任务:接受任务时创建邮车出错')
		return
	end

	-- 扣除押金
	local lTaskLevel = BodyGuard_GetAcceptedTaskLevel(lActorID)
	local lDeposit = BodyGuard_GetTaskDeposit(lActorID,lTaskLevel)
	DBG_TRACE('快递任务:接受'..lTaskLevel..'任务,押金:'..lDeposit..'金币')

	if 1==lTaskLevel then
		local lGoodsNum = API_ActorGetGoodsNum(lActorID,constBuyBillID)
		DBG_TRACE('快递任务: 购物券数目'..lGoodsNum..'张,押金:'..lDeposit..'金币')
		if lGoodsNum<lDeposit then
			DBG_TRACE('快递任务: 扣金币押金')
			local lNowMoney = TaskPub_GetActorMoney(lActorID)
			if lNowMoney<lDeposit then
				LoopTaskBodyGuard_DestoryMonster(lActorID,0)
				return
			else
				API_ActorAddMoney(lActorID, lDeposit * (-1), constTaskID, '快递押金')
				API_VarDataSetNumber(lActorID,0,constAwardTypeID,1)
				TaskPub_SendMessage(lActorID, '支付'..lDeposit..'金币的快递押金')
			end
		else
			DBG_TRACE('快递任务: 扣购物券押金')
			API_ActorRemoveGoods(lActorID, constBuyBillID, lDeposit, '快递押金')
			TaskPub_SendMessage(lActorID, '支付'..lDeposit..'购物券的快递押金')
		end
	else
		local lNowMoney = TaskPub_GetActorMoney(lActorID)
		if lNowMoney<lDeposit then
			LoopTaskBodyGuard_DestoryMonster(lActorID,0)
			return
		else
			API_ActorAddMoney(lActorID, lDeposit * (-1), constTaskID, '快递押金')
			TaskPub_SendMessage(lActorID, '支付'..lDeposit..'金币的快递押金')
		end
	end

	-- 处理接受任务过程
	BodyGuard_AcceptTaskProc(lActorID, constTaskID)
	local lTargetID = API_VarDataGetNumber(lActorID, 1, constTargetID)
	API_VarDataSetNumber(lActorID, 0, constTaskID, lTargetID)

	-- 计算奖励
	local lAwardMoney = BodyGuard_GetAwardValue(lActorID, lTaskLevel)
	API_VarDataSetNumber(lActorID, 1, constAward, lAwardMoney)

	local lRet = API_CreateTimerTrigger(lActorID, 60, 1, constTaskID, 'LoopTaskBodyGuard_OnTimerOfCreateMonster')
	if lRet<=0 then
		DBG_TRACE('快递任务:创建刷怪定时触发器失败')
	end

	lRet = API_CreateTimerTrigger(lActorID, 35, -1, constTaskID, 'LoopTaskBodyGuard_OnTimerOfKillMonster')
	if lRet<=0 then
		DBG_TRACE('快递任务:创建销毁怪定时触发器失败')
	end

	lRet = API_CreateTimerTrigger(lActorID, constMaxKillTimeSpan, -1, constTaskID, 'LoopTaskBodyGuard_OnTimerOfKillYouChe')
	if lRet<=0 then
		DBG_TRACE('快递任务:创建检查邮车定时触发器失败')
	end
	
	-- 创建一个玩家死亡触发器
 	local lActorTrigID = API_CreateDieTrigger(lActorID,1,lActorID,constTaskID, 'LoopTaskBodyGuard_ActorDieCallback')
 	if lActorTrigID<=0 then
 		API_Trace('快递任务:创建玩家死亡触发器失败')
 	end	

	TaskPub_SendMessage(lActorID, '你接受了<快递任务>')

	LoopTaskBodyGuard_UpdateLog(lActorID)
end

-- ------------------------------------------------------------------------------------------------
-- 玩家完成本任务时触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_Finish(lActorID, lNPCID)
	LoopTaskBodyGuard_DestoryMonster(lActorID,0)

	-- 杀怪
	LoopTaskBodyGuard_OnKillCreateMonster(lActorID)
	table.remove(g_BodyGuardKillYouChe,lActorID)

	-- 给奖励
	LoopTaskBodyGuard_AddActorAward(lActorID)

	-- 调用任务完成例程
	BodyGuard_FinishTaskProc(lActorID, constTaskID)

	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	API_VarDataSetNumber(lActorID, 1, constMonsterID, 0)
	API_VarDataSetNumber(lActorID, 1, constAward, 0)
	API_VarDataSetNumber(lActorID, 1, constCreateMonster, 0)
	API_VarDataSetNumber(lActorID, 1, constStatusID1, 0)
	API_VarDataSetNumber(lActorID, 0, constLeftValue, 0)
	API_VarDataSetNumber(lActorID, 0, constAwardTypeID, 0)
	API_VarDataSetNumber(lActorID, 0, constStatusID2, 0)

	-- 当天押镖次数
	local lTaskCount = BodyGuard_GetTaskCount(lActorID)
	if lTaskCount<BodyGuard_MaxCount() then
		BodyGuard_GenTaskQueue(lActorID)
	else
		TaskPub_SendMessage(lActorID, "今天的快递任务结束")
	end
end

-- ------------------------------------------------------------------------------------------------
-- 玩家放弃本任务时触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_Giveup(lActorID)
	DBG_TRACE('LoopTaskBodyGuard_Giveup('..lActorID..')')

	LoopTaskBodyGuard_DestoryMonster(lActorID,0)

	-- 杀怪
	LoopTaskBodyGuard_OnKillCreateMonster(lActorID)
	table.remove(g_BodyGuardKillYouChe,lActorID)

	-- 结束任务环
	BodyGuard_GiveupTaskProc(lActorID, constTaskID)

	-- 删除任务标志
	API_VarDataSetNumber(lActorID, 1, constTargetID, 0)
	API_VarDataSetNumber(lActorID, 1, constMonsterID, 0)
	API_VarDataSetNumber(lActorID, 1, constAward, 0)
	API_VarDataSetNumber(lActorID, 1, constCreateMonster, 0)
	API_VarDataSetNumber(lActorID, 1, constStatusID1, 0)
	API_VarDataSetNumber(lActorID, 0, constAwardTypeID, 0)
	API_VarDataSetNumber(lActorID, 0, constLeftValue, 0)
	API_VarDataSetNumber(lActorID, 0, constStatusID2, 0)

	-- 当天押镖次数
	local lTaskCount = BodyGuard_GetTaskCount(lActorID)
	if lTaskCount<BodyGuard_MaxCount() then
		BodyGuard_GenTaskQueue(lActorID)
	else
		TaskPub_SendSysMsg(lActorID, "今天的快递任务已经结束")
	end
end

-- ------------------------------------------------------------------------------------------------
-- 玩家共享本任务时触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_Share(lActorID)
end

-- ------------------------------------------------------------------------------------------------
-- 玩家上线时本任务初始化触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_Login(lActorID)
	local lTaskState = API_VarDataGetNumber(lActorID, 1, constTaskID)
	if lTaskState>0 then
		LoopTaskBodyGuard_UpdateLog(lActorID)
	end
end

-- ------------------------------------------------------------------------------------------------
-- 玩家下线时本任务结束处理触发此函数
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_Logout(lActorID)
	-- 强制放弃任务
	API_GiveupTask(lActorID, constTaskID)
end

-- ------------------------------------------------------------------------------------------------
-- 刷新任务日志
-- ------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_UpdateLog(lActorID)
	local lTaskCount = BodyGuard_GetTaskCount(lActorID)
	API_TaskLogUpdate(lActorID, constTaskID, 1, 0, '快递任务 第'..lTaskCount..'轮')

	-- 取环境变量
	local lCampName = TaskPub_GetCountryName(lActorID)
	local lMonsterId = API_VarDataGetNumber(lActorID, 1, constTargetID)
	local lGoodsId = API_VarDataGetNumber(lActorID, 1, constMonsterID)
	local lAwardMoney = API_VarDataGetNumber(lActorID, 1, constAward)
	local szMonsterName = LoopTaskBodyGuard_GetMonsterHelpString(lMonsterId)
	local szGoodsName = API_GetMonsterNameByID(lGoodsId)

	local szText = ''
	szText = '<text>快递局广招天下英雄送快递，你是'..lCampName..'英才，这正是您大展身手，扬名立万的好时机啊。</text>'
	szText = szText..'<text>现在，这里有个'..szGoodsName..'要'..szMonsterName..'。</text>'
	API_TaskLogUpdate(lActorID, constTaskID, 1, 1, szText)

	szText = '<text>赶紧把'..szGoodsName..szMonsterName..'</text>'
	API_TaskLogUpdate(lActorID, constTaskID, 1, 2, szText)

	szText = '<text>获得'..lAwardMoney..'功勋的奖励,如果您运气好的话有概率获得点化魔盒.</text>'
	API_TaskLogUpdate(lActorID, constTaskID, 1, 3, szText)
end


-- ------------------------------------------------------------------------------------------------
-- end files!!!
-- ------------------------------------------------------------------------------------------------
