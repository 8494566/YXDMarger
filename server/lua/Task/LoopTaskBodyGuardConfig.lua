-- 快递任务基本数据配置
-- 由策划配置完成

-- 以下是配置邮车送往的目的NPC
-- 这个改了要通知 艾钊在 任务 102 的完成任务NPC上做同步的修改!!!! 重要!!!!
-- 帝国的4个档次的NPC配置
local lTaskMonster_DG1 = {11304,11012,11008,11018,11014,11016,11022,11020,11268,11026,11024,11010,11501,11502,11503,11504,11505,11506,11501,11502,11503,11504,11505,11506,11501,11502,11503,11504,11505,11506,11501,11502,11503,11504,11505,11506,11501,11502,11503,11504,11505,11506,11501,11502,11503,11504,11505,11506,11501,11502,11503,11504,11505,11506}
local lTaskMonster_DG2 = {11507,11508,11509,11510,11511,11512}
local lTaskMonster_DG3 = {11507,11508,11509,11510,11511,11512,11513,11514}
local lTaskMonster_DG4 = {11507,11508,11509,11510,11511,11512,11513,11514,11515,11516}

-- 联邦的4个档次的NPC配置
local lTaskMonster_LB1 = {11303,11013,11009,11019,11015,11017,11023,11021,11269,11027,11025,11011,11517,11518,11519,11520,11521,11522,11517,11518,11519,11520,11521,11522,11517,11518,11519,11520,11521,11522,11517,11518,11519,11520,11521,11522,11517,11518,11519,11520,11521,11522,11517,11518,11519,11520,11521,11522,11517,11518,11519,11520,11521,11522}
local lTaskMonster_LB2 = {11523,11524,11525,11526,11527,11528}
local lTaskMonster_LB3 = {11523,11524,11525,11526,11527,11528,11529,11530}
local lTaskMonster_LB4 = {11523,11524,11525,11526,11527,11528,11529,11530,11531,11532}

-- 邮车目的地NPC的帮助信息配置表
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
	--[11005] = '送给天空城联邦教堂的</text><text color="255,0,0">联邦牧师</text><text>，可以从</text><text color="255,0,0">天空城（151,182）</text><text>进入联邦教堂寻找联邦牧师',

	[11501] = '送给钢铁城秘密通道1层的</text><text color="255,0,0">1层帝国守卫1</text><text>，可以从</text><text color="255,0,0">帝国总督府（42,66）</text><text>进入秘密通道1层寻找1层帝国守卫1',
	[11502] = '送给钢铁城秘密通道1层的</text><text color="255,0,0">1层帝国守卫2</text><text>，可以从</text><text color="255,0,0">帝国总督府（42,66）</text><text>进入秘密通道1层寻找1层帝国守卫2',
	[11503] = '送给钢铁城秘密通道1层的</text><text color="255,0,0">1层帝国守卫3</text><text>，可以从</text><text color="255,0,0">帝国总督府（42,66）</text><text>进入秘密通道1层寻找1层帝国守卫3',
	[11504] = '送给钢铁城秘密通道1层的</text><text color="255,0,0">1层帝国守卫4</text><text>，可以从</text><text color="255,0,0">帝国总督府（42,66）</text><text>进入秘密通道1层寻找1层帝国守卫4',
	[11505] = '送给钢铁城秘密通道1层的</text><text color="255,0,0">1层帝国守卫5</text><text>，可以从</text><text color="255,0,0">帝国总督府（42,66）</text><text>进入秘密通道1层寻找1层帝国守卫5',
	[11506] = '送给钢铁城秘密通道1层的</text><text color="255,0,0">1层帝国守卫6</text><text>，可以从</text><text color="255,0,0">帝国总督府（42,66）</text><text>进入秘密通道1层寻找1层帝国守卫6',
	[11507] = '送给钢铁城秘密通道2层的</text><text color="255,0,0">2层帝国守卫1</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫1',
	[11508] = '送给钢铁城秘密通道2层的</text><text color="255,0,0">2层帝国守卫2</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫2',
	[11509] = '送给钢铁城秘密通道2层的</text><text color="255,0,0">2层帝国守卫3</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫3',
	[11510] = '送给钢铁城秘密通道2层的</text><text color="255,0,0">2层帝国守卫4</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫4',
	[11511] = '送给钢铁城秘密通道2层的</text><text color="255,0,0">2层帝国守卫5</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫5',
	[11512] = '送给钢铁城秘密通道2层的</text><text color="255,0,0">2层帝国守卫6</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫6',
	[11513] = '送给钢铁城秘密通道2层的</text><text color="255,0,0">2层帝国守卫7</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫7',
	[11514] = '送给钢铁城秘密通道2层的</text><text color="255,0,0">2层帝国守卫8</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫8',
	[11515] = '送给钢铁城秘密通道2层的</text><text color="255,0,0">2层帝国守卫9</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫9',
	[11516] = '送给钢铁城秘密通道2层的</text><text color="255,0,0">2层帝国守卫10</text><text>，可以从</text><text color="255,0,0">帝国总督府（39,69）</text><text>进入秘密通道2层寻找2层帝国守卫10',
	[11304] = '送给钢铁城帝国交易所的</text><text color="255,0,0">帝国交易员</text><text>，可以从</text><text color="255,0,0">钢铁城（61,183）</text><text>进入帝国交易所寻找帝国交易员',
	[11012] = '送给钢铁城帝国研究所的</text><text color="255,0,0">帝国装备保养员</text><text>，可以从</text><text color="255,0,0">钢铁城（115,173）</text><text>进入帝国研究所寻找帝国装备保养员',
	[11008] = '送给钢铁城帝国研究所的</text><text color="255,0,0">帝国装备改造师</text><text>，可以从</text><text color="255,0,0">钢铁城（115,173）</text><text>进入帝国研究所寻找帝国装备改造师',
	[11018] = '送给钢铁城帝国装备店的</text><text color="255,0,0">帝国饰品商人</text><text>，可以从</text><text color="255,0,0">钢铁城（110,145）</text><text>进入帝国装备店寻找帝国饰品商人',
	[11014] = '送给钢铁城帝国装备店的</text><text color="255,0,0">帝国武器商人</text><text>，可以从</text><text color="255,0,0">钢铁城（110,145）</text><text>进入帝国装备店寻找帝国武器商人',
	[11016] = '送给钢铁城帝国装备店的</text><text color="255,0,0">帝国防具商人</text><text>，可以从</text><text color="255,0,0">钢铁城（110,145）</text><text>进入帝国装备店寻找帝国防具商人',
	[11022] = '送给钢铁城帝国装备店的</text><text color="255,0,0">帝国生产供应商</text><text>，可以从</text><text color="255,0,0">钢铁城（110,145）</text><text>进入帝国装备店寻找帝国生产供应商',
	[11020] = '送给钢铁城帝国药店的</text><text color="255,0,0">材料药品商</text><text>，可以从</text><text color="255,0,0">钢铁城（118,136）</text><text>进入帝国药店寻找材料药品商',
	[11268] = '送给钢铁城帝国学院的</text><text color="255,0,0">帝国生活技能导师</text><text>，可以从</text><text color="255,0,0">钢铁城（67,126）</text><text>进入帝国学院寻找帝国生活技能导师',
	[11026] = '送给钢铁城帝国学院的</text><text color="255,0,0">战斗技能导师</text><text>，可以从</text><text color="255,0,0">钢铁城（67,126）</text><text>进入帝国学院寻找战斗技能导师',
	[11024] = '送给钢铁城帝国宝石店的</text><text color="255,0,0">帝国宝石商人</text><text>，可以从</text><text color="255,0,0">钢铁城（96,112）</text><text>进入帝国宝石店寻找帝国宝石商人',
	[11010] = '送给钢铁城帝国宝石店的</text><text color="255,0,0">帝国珠宝工匠</text><text>，可以从</text><text color="255,0,0">钢铁城（96,112）</text><text>进入帝国宝石店寻找帝国珠宝工匠',
	--[11004] = '送给钢铁城帝国教堂的</text><text color="255,0,0">帝国主教</text><text>，可以从</text><text color="255,0,0">钢铁城（135,104）</text><text>进入帝国教堂寻找帝国主教',
}

--  以下是不同档次的邮车配置
-- 帝国不同档次的邮车配置
local lTabLoopTaskBody_DG1 = {20001,20006,20011,20016,20021}	-- 1档次
local lTabLoopTaskBody_DG2 = {20002,20007,20012,20017,20022}	-- 2档次
local lTabLoopTaskBody_DG3 = {20003,20008,20013,20018,20023}
local lTabLoopTaskBody_DG4 = {20004,20009,20014,20019,20024}
local lTabLoopTaskBody_DG5 = {20005,20010,20015,20020,20025}

-- 联邦不同档次的邮车配置
local lTabLoopTaskBody_LB1 = {20026,20031,20036,20041,20046}	-- 1档次
local lTabLoopTaskBody_LB2 = {20027,20032,20037,20042,20047}	-- 2档次
local lTabLoopTaskBody_LB3 = {20028,20033,20038,20043,20048}
local lTabLoopTaskBody_LB4 = {20029,20034,20039,20044,20049}
local lTabLoopTaskBody_LB5 = {20030,20035,20040,20045,20050}

--  --------------------------------------------------------------------------------------------------------------
--  !!!!!以下各表不要更动!!! 有疑问请及时问询!!!
--  --------------------------------------------------------------------------------------------------------------
-- 该表不用更动
local lTaskMonster_DG =
{
	[1] = lTaskMonster_DG1,
	[2] = lTaskMonster_DG2,
	[3] = lTaskMonster_DG3,
	[4] = lTaskMonster_DG4,
}

-- 该表不用更动
local lTaskMonster_LB =
{
	[1] = lTaskMonster_LB1,
	[2] = lTaskMonster_LB2,
	[3] = lTaskMonster_LB3,
	[4] = lTaskMonster_LB4,
}

-- 下面的表不用更动
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

-- 下面的表不用更动
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
--  !!!!!以下是代码部分, 不要更动!!!!!! don't touch it!!!!
--  --------------------------------------------------------------------------------------------------------------
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
		lRandom = math.random(table.getn(lTabMonsters))
		lMonsterId = lTabMonsters[lRandom]
	elseif 3==lTaskLevel then
		local lRandom = math.random(100)
		local lTabMonsters = lTaskMonsterTable[3]
		lRandom = math.random(table.getn(lTabMonsters))
		lMonsterId = lTabMonsters[lRandom]
	else
		local lRandom = math.random(100)
		local lTabMonsters = lTaskMonsterTable[4]
		lRandom = math.random(table.getn(lTabMonsters))
		lMonsterId = lTabMonsters[lRandom]
	end
	return lMonsterId
end

--  --------------------------------------------------------------------------------------------------------------
--  根据
--  --------------------------------------------------------------------------------------------------------------
function LoopTaskBodyGuard_GetMonsterHelpString(lMonsterID)
	local szHelpString = constTargetMonsterHelpString[lMonsterID]
	if nil==szHelpString then
		szHelpString = API_GetMonsterNameByID(lMonsterID)
		szHelpString = '送给'..szHelpString
	end
	return szHelpString
end

--  --------------------------------------------------------------------------------------------------------------
--  end files
--  --------------------------------------------------------------------------------------------------------------


