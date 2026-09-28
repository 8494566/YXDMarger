
if not API_IsEctypeServer() then
-- ---------------------
-- 创建所有静态地图的NPC
-- ---------------------
local FastID

--联邦新手空间传送塔
API_CreateMonster(96,11713,126,115,3,0,-1)		--新手防守浮空岛传送阵
API_CreateMonster(96,11717,126,126,3,0,-1)		--新手争夺浮空岛传送阵
API_CreateMonster(96,11265,130,129,5,0,-1)		--联邦新手商人
API_CreateMonster(96,11559,134,129,5,0,-1)		--联邦战斗技能导师


--帝国新手空间传送塔
API_CreateMonster(97,11712,126,115,3,0,-1)		--新手防守浮空岛传送阵
API_CreateMonster(97,11716,126,126,3,0,-1)		--新手争夺浮空岛传送阵
API_CreateMonster(97,11264,130,129,5,0,-1)		--帝国新手商人
API_CreateMonster(97,11558,134,129,5,0,-1)		--帝国战斗技能导师


--帝国国有生产基地npc
API_CreateMonster(18,11266,179,182,3,0,-1)			--帝国生产管理员
API_CreateMonster(18,11264,197,191,5,0,-1)			--帝国新手商店

--联邦国有生产基地npc
API_CreateMonster(20,11267,179,184,3,0,-1)			--联邦生产管理员
API_CreateMonster(20,11265,197,192,5,0,-1)			--联邦新手商店


--帝国空间传送塔内npc
FastID = API_CreateMonster(33,11209,125,91,3,0,-1)	--防守浮空岛传送阵
FastID = API_CreateMonster(42,11240,125,91,3,0,-1)	--防守浮空岛传送阵
FastID = API_CreateMonster(43,11244,125,91,3,0,-1)	--防守浮空岛传送阵
FastID = API_CreateMonster(44,11248,125,91,3,0,-1)	--防守浮空岛传送阵
FastID = API_CreateMonster(45,11252,125,91,3,0,-1)	--防守浮空岛传送阵
--FastID = API_CreateMonster(46,11256,125,91,3,0,-1)	--防守浮空岛传送阵
--FastID = API_CreateMonster(47,11260,125,91,3,0,-1)	--防守浮空岛传送阵

API_CreateMonster(33,11626,113,91,3,0,-1)			--公民机奴巢穴浮空岛传送阵
API_CreateMonster(42,11628,113,91,3,0,-1)			--男爵机奴巢穴浮空岛传送阵
API_CreateMonster(43,11628,113,91,3,0,-1)			--高男机奴巢穴浮空岛传送阵
API_CreateMonster(44,11632,113,91,3,0,-1)			--子爵机奴巢穴浮空岛传送阵
API_CreateMonster(45,11632,113,91,3,0,-1)			--高子机奴巢穴浮空岛传送阵
API_CreateMonster(46,11636,113,91,3,0,-1)			--伯爵机奴巢穴浮空岛传送阵
API_CreateMonster(47,11636,113,91,3,0,-1)			--高伯机奴巢穴浮空岛传送阵
API_CreateMonster(48,11640,113,91,3,0,-1)			--侯爵机奴巢穴浮空岛传送阵
API_CreateMonster(49,11640,113,91,3,0,-1)			--高侯机奴巢穴浮空岛传送阵
API_CreateMonster(50,11644,113,91,3,0,-1)			--公爵机奴巢穴浮空岛传送阵
API_CreateMonster(51,11644,113,91,3,0,-1)			--高公机奴巢穴浮空岛传送阵

API_CreateMonster(33,11208,125,99,3,0,-1)			--拉锯战浮空岛传送阵
API_CreateMonster(42,11208,125,99,3,0,-1)			--拉锯战浮空岛传送阵
API_CreateMonster(43,11208,125,99,3,0,-1)			--拉锯战浮空岛传送阵
API_CreateMonster(44,11208,125,99,3,0,-1)			--拉锯战浮空岛传送阵
API_CreateMonster(45,11208,125,99,3,0,-1)			--拉锯战浮空岛传送阵
API_CreateMonster(46,11208,125,99,3,0,-1)			--拉锯战浮空岛传送阵
API_CreateMonster(47,11208,125,99,3,0,-1)			--拉锯战浮空岛传送阵

API_CreateMonster(33,11211,125,115,3,0,-1)			--塔防浮空岛传送阵
API_CreateMonster(42,11211,125,115,3,0,-1)			--塔防浮空岛传送阵
API_CreateMonster(43,11211,125,115,3,0,-1)			--塔防浮空岛传送阵
API_CreateMonster(44,11412,125,115,3,0,-1)			--塔防浮空岛传送阵
API_CreateMonster(45,11412,125,115,3,0,-1)			--塔防浮空岛传送阵
API_CreateMonster(46,11412,125,115,3,0,-1)			--塔防浮空岛传送阵
API_CreateMonster(47,11412,125,115,3,0,-1)			--塔防浮空岛传送阵

FastID = API_CreateMonster(33,11210,125,107,3,0,-1)	--争夺浮空岛传送阵
FastID = API_CreateMonster(42,11241,125,107,3,0,-1)	--争夺浮空岛传送阵
FastID = API_CreateMonster(43,11245,125,107,3,0,-1)	--争夺浮空岛传送阵
FastID = API_CreateMonster(44,11249,125,107,3,0,-1)	--争夺浮空岛传送阵
FastID = API_CreateMonster(45,11253,125,107,3,0,-1)	--争夺浮空岛传送阵
--FastID = API_CreateMonster(46,11257,125,107,3,0,-1)	--争夺浮空岛传送阵
--FastID = API_CreateMonster(47,11261,125,107,3,0,-1)	--争夺浮空岛传送阵

FastID = API_CreateMonsterEx(42,11382,125,123,3,0,-1,1)	--训练营浮空岛传送阵
FastID = API_CreateMonsterEx(43,11383,125,123,3,0,-1,1)	--训练营浮空岛传送阵
FastID = API_CreateMonsterEx(44,11384,125,123,3,0,-1,1)	--训练营浮空岛传送阵
FastID = API_CreateMonsterEx(45,11385,125,123,3,0,-1,1)	--训练营浮空岛传送阵
FastID = API_CreateMonsterEx(46,11386,125,123,3,0,-1,1)	--训练营浮空岛传送阵
FastID = API_CreateMonsterEx(47,11387,125,123,3,0,-1,1)	--训练营浮空岛传送阵

API_CreateMonster(42,11583,125,131,3,0,-1)			--夺旗战争（帝国男爵）
API_CreateMonster(43,11583,125,131,3,0,-1)			--夺旗战争（帝国高男）
API_CreateMonster(44,11583,125,131,3,0,-1)			--夺旗战争（帝国子爵）
API_CreateMonster(45,11583,125,131,3,0,-1)			--夺旗战争（帝国高子）
API_CreateMonster(46,11583,125,131,3,0,-1)			--夺旗战争（帝国伯爵）
API_CreateMonster(47,11583,125,131,3,0,-1)			--夺旗战争（帝国高伯）
API_CreateMonster(48,11583,125,131,3,0,-1)			--夺旗战争（帝国侯爵）
API_CreateMonster(49,11583,125,131,3,0,-1)			--夺旗战争（帝国高侯）
API_CreateMonster(50,11583,125,131,3,0,-1)			--夺旗战争（帝国公爵）
API_CreateMonster(51,11583,125,131,3,0,-1)			--夺旗战争（帝国高公）

--API_CreateMonster(42,11474,125,131,3,0,-1)			--强者之路（帝国男爵）
--API_CreateMonster(43,11474,125,131,3,0,-1)			--强者之路（帝国高男）
--API_CreateMonster(44,11474,125,131,3,0,-1)			--强者之路（帝国子爵）
--API_CreateMonster(45,11474,125,131,3,0,-1)			--强者之路（帝国高子）
--API_CreateMonster(46,11474,125,131,3,0,-1)			--强者之路（帝国伯爵）
--API_CreateMonster(47,11474,125,131,3,0,-1)			--强者之路（帝国高伯）
--API_CreateMonster(48,11474,125,131,3,0,-1)			--强者之路（帝国侯爵）
--API_CreateMonster(49,11474,125,131,3,0,-1)			--强者之路（帝国高侯）
--API_CreateMonster(50,11474,125,131,3,0,-1)			--强者之路（帝国公爵）
--API_CreateMonster(51,11474,125,131,3,0,-1)			--强者之路（帝国高公）


--联邦空间传送塔内npc
FastID = API_CreateMonster(32,11219,124,90,3,0,-1)	--防守浮空岛传送阵
FastID = API_CreateMonster(52,11242,124,90,3,0,-1)	--防守浮空岛传送阵
FastID = API_CreateMonster(53,11246,124,90,3,0,-1)	--防守浮空岛传送阵
FastID = API_CreateMonster(54,11250,124,90,3,0,-1)	--防守浮空岛传送阵
FastID = API_CreateMonster(55,11254,124,90,3,0,-1)	--防守浮空岛传送阵
--FastID = API_CreateMonster(56,11258,124,90,3,0,-1)	--防守浮空岛传送阵
--FastID = API_CreateMonster(57,11262,124,90,3,0,-1)	--防守浮空岛传送阵

API_CreateMonster(32,11627,112,90,3,0,-1)			--机奴巢穴浮空岛传送阵
API_CreateMonster(52,11629,112,90,3,0,-1)			--机奴巢穴浮空岛传送阵
API_CreateMonster(53,11629,112,90,3,0,-1)			--机奴巢穴浮空岛传送阵
API_CreateMonster(54,11633,112,90,3,0,-1)			--机奴巢穴浮空岛传送阵
API_CreateMonster(55,11633,112,90,3,0,-1)			--机奴巢穴浮空岛传送阵
API_CreateMonster(56,11637,112,90,3,0,-1)			--机奴巢穴浮空岛传送阵
API_CreateMonster(57,11637,112,90,3,0,-1)			--机奴巢穴浮空岛传送阵
API_CreateMonster(58,11641,112,90,3,0,-1)			--机奴巢穴浮空岛传送阵
API_CreateMonster(59,11641,112,90,3,0,-1)			--机奴巢穴浮空岛传送阵
API_CreateMonster(60,11645,112,90,3,0,-1)			--机奴巢穴浮空岛传送阵
API_CreateMonster(61,11645,112,90,3,0,-1)			--机奴巢穴浮空岛传送阵

API_CreateMonster(32,11218,124,98,3,0,-1)			--拉锯战浮空岛传送阵
API_CreateMonster(52,11218,124,98,3,0,-1)			--拉锯战浮空岛传送阵
API_CreateMonster(53,11218,124,98,3,0,-1)			--拉锯战浮空岛传送阵
API_CreateMonster(54,11218,124,98,3,0,-1)			--拉锯战浮空岛传送阵
API_CreateMonster(55,11218,124,98,3,0,-1)			--拉锯战浮空岛传送阵
API_CreateMonster(56,11218,124,98,3,0,-1)			--拉锯战浮空岛传送阵
API_CreateMonster(57,11218,124,98,3,0,-1)			--拉锯战浮空岛传送阵

API_CreateMonster(32,11221,124,114,3,0,-1)			--塔防浮空岛传送阵
API_CreateMonster(52,11221,124,114,3,0,-1)			--塔防浮空岛传送阵
API_CreateMonster(53,11221,124,114,3,0,-1)			--塔防浮空岛传送阵
API_CreateMonster(54,11413,124,114,3,0,-1)			--塔防浮空岛传送阵
API_CreateMonster(55,11413,124,114,3,0,-1)			--塔防浮空岛传送阵
API_CreateMonster(56,11413,124,114,3,0,-1)			--塔防浮空岛传送阵
API_CreateMonster(57,11413,124,114,3,0,-1)			--塔防浮空岛传送阵

FastID = API_CreateMonster(32,11220,124,106,3,0,-1)	--争夺浮空岛传送阵
FastID = API_CreateMonster(52,11243,124,106,3,0,-1)	--争夺浮空岛传送阵
FastID = API_CreateMonster(53,11247,124,106,3,0,-1)	--争夺浮空岛传送阵
FastID = API_CreateMonster(54,11251,124,106,3,0,-1)	--争夺浮空岛传送阵
FastID = API_CreateMonster(55,11255,124,106,3,0,-1)	--争夺浮空岛传送阵
--FastID = API_CreateMonster(56,11259,124,106,3,0,-1)	--争夺浮空岛传送阵
--FastID = API_CreateMonster(57,11263,124,106,3,0,-1)	--争夺浮空岛传送阵

FastID = API_CreateMonsterEx(52,11393,124,122,3,0,-1,1)	--训练营浮空岛传送阵
FastID = API_CreateMonsterEx(53,11394,124,122,3,0,-1,1)	--训练营浮空岛传送阵
FastID = API_CreateMonsterEx(54,11395,124,122,3,0,-1,1)	--训练营浮空岛传送阵
FastID = API_CreateMonsterEx(55,11396,124,122,3,0,-1,1)	--训练营浮空岛传送阵
FastID = API_CreateMonsterEx(56,11397,124,122,3,0,-1,1)	--训练营浮空岛传送阵
FastID = API_CreateMonsterEx(57,11398,124,122,3,0,-1,1)	--训练营浮空岛传送阵

API_CreateMonster(52,11584,124,130,3,0,-1)			--夺旗战争（联邦男爵）
API_CreateMonster(53,11584,124,130,3,0,-1)			--夺旗战争（联邦高男）
API_CreateMonster(54,11584,124,130,3,0,-1)			--夺旗战争（联邦子爵）
API_CreateMonster(55,11584,124,130,3,0,-1)			--夺旗战争（联邦高子）
API_CreateMonster(56,11584,124,130,3,0,-1)			--夺旗战争（联邦伯爵）
API_CreateMonster(57,11584,124,130,3,0,-1)			--夺旗战争（联邦高伯）
API_CreateMonster(58,11584,124,130,3,0,-1)			--夺旗战争（联邦侯爵）
API_CreateMonster(59,11584,124,130,3,0,-1)			--夺旗战争（联邦高侯）
API_CreateMonster(60,11584,124,130,3,0,-1)			--夺旗战争（联邦公爵）
API_CreateMonster(61,11584,124,130,3,0,-1)			--夺旗战争（联邦高公）

--API_CreateMonster(52,11475,124,130,3,0,-1)			--强者之路传送阵
--API_CreateMonster(53,11475,124,130,3,0,-1)			--强者之路传送阵
--API_CreateMonster(54,11475,124,130,3,0,-1)			--强者之路传送阵
--API_CreateMonster(55,11475,124,130,3,0,-1)			--强者之路传送阵
--API_CreateMonster(56,11475,124,130,3,0,-1)			--强者之路传送阵
--API_CreateMonster(57,11475,124,130,3,0,-1)			--强者之路传送阵
--API_CreateMonster(58,11475,124,130,3,0,-1)			--强者之路传送阵
--API_CreateMonster(59,11475,124,130,3,0,-1)			--强者之路传送阵
--API_CreateMonster(60,11475,124,130,3,0,-1)			--强者之路传送阵
--API_CreateMonster(61,11475,124,130,3,0,-1)			--强者之路传送阵

--联邦主城NPC
API_CreateMonster(2,11265,250,154,4,0,-1)		--联邦新手商店
API_CreateMonster(2,11029,247,187,5,0,-1)		--联邦邮箱
API_CreateMonster(2,11029,144,254,3,0,-1)		--联邦邮箱
API_CreateMonster(2,11469,232,188,3,0,-1)		--联邦装备收购商

API_CreateMonster(2,11226,243,126,1,0,-1)			--跨岛传送阵


--联邦主城室内NPC
API_CreateMonster(40,11005,64,74,5,0,-1)		--联邦教堂：联邦牧师

API_CreateMonster(41,11007,52,69,5,0,-1)		--联邦佣兵团管理员
API_CreateMonster(41,11575,62,68,5,0,-1)		--联邦调酒师

API_CreateMonster(62,11015,67,65,5,0,-1)		--联邦装备店：联邦武器商人
API_CreateMonster(62,11017,70,65,5,0,-1)		--联邦装备店：联邦防具商人
API_CreateMonster(62,11023,53,52,3,0,-1)		--联邦装备店：联邦生产供应商
API_CreateMonster(62,11019,53,65,4,0,-1)		--联邦装备店：联邦饰品商人
API_CreateMonster(62,11265,52,56,3,0,-1)		--联邦装备店：联邦新手商店
API_CreateMonster(62,11469,62,65,4,0,-1)		--联邦装备店：联邦装备收购商

API_CreateMonster(63,11227,54,60,3,0,-1)		--联邦仓库：联邦仓库管理员
API_CreateMonster(63,11029,56,65,7,0,-1)		--联邦邮箱

API_CreateMonster(64,11021,57,50,3,0,-1)		--联邦药店：联邦药品商人
API_CreateMonster(64,11265,56,59,3,0,-1)		--联邦药店：联邦新手商店

API_CreateMonster(65,11027,27,62,3,0,-1)		--联邦学院：联邦技能导师
API_CreateMonster(65,11269,82,58,3,0,-1)		--联邦学院：联邦生活技能导师

API_CreateMonster(66,11303,50,59,3,0,-1)		--联邦交易所：联邦交易员
API_CreateMonster(66,11303,50,73,3,0,-1)		--联邦交易所：联邦交易员

API_CreateMonster(67,11043,129,173,5,0,-1)		--联邦皇宫：联邦总督
API_CreateMonster(67,11003,62,109,3,0,-1)		--联邦皇宫：联邦辅政官
API_CreateMonster(67,11001,182,107,2,0,-1)		--联邦皇宫：联邦议会议长

API_CreateMonster(68,11013,54,68,4,0,-1)		--联邦研究所：联邦装备保养员
API_CreateMonster(68,11009,67,68,5,0,-1)		--联邦研究所：联邦装备改造师
API_CreateMonster(68,11029,51,57,1,0,-1)		--联邦研究所：联邦邮箱
API_CreateMonster(68,11469,51,63,4,0,-1)		--联邦研究所：联邦装备收购商

API_CreateMonster(69,11025,53,68,4,0,-1)		--联邦宝石店：联邦宝石商人
API_CreateMonster(69,11011,67,68,4,0,-1)		--联邦宝石店：联邦珠宝工匠
API_CreateMonster(69,11029,51,57,1,0,-1)		--联邦邮箱


--帝国主城NPC
API_CreateMonster(1,11264,217,217,4,0,-1)		--帝国新手商店
API_CreateMonster(1,11028,271,217,4,0,-1)		--帝国邮箱
API_CreateMonster(1,11028,288,307,5,0,-1)		--帝国邮箱
API_CreateMonster(1,11468,278,206,4,0,-1)		--帝国装备收购商
API_CreateMonster(1,11216,273,170,1,0,-1)			--跨岛传送阵


--帝国主城室内NPC
API_CreateMonster(81,11004,66,73,5,0,-1)		--帝国教堂：帝国主教

API_CreateMonster(21,11006,66,71,5,0,-1)		--帝国佣兵团管理员
API_CreateMonster(21,11574,57,57,3,0,-1)		--帝国调酒师

API_CreateMonster(80,11014,56,68,3,0,-1)		--帝国装备店：帝国武器商人
API_CreateMonster(80,11016,54,65,4,0,-1)		--帝国装备店：帝国防具商人
API_CreateMonster(80,11022,55,55,3,0,-1)		--帝国装备店：帝国生产供应商
API_CreateMonster(80,11018,66,70,5,0,-1)		--帝国装备店：帝国饰品商人
API_CreateMonster(80,11264,54,60,3,0,-1)		--帝国装备店：帝国新手商店
API_CreateMonster(80,11468,60,71,5,0,-1)		--帝国装备店：帝国装备收购商

API_CreateMonster(1,11228,293,312,3,0,-1)		--帝国仓库：帝国仓库管理员

API_CreateMonster(77,11020,53,66,3,0,-1)		--帝国药店：帝国药品商人
API_CreateMonster(77,11264,61,71,5,0,-1)		--帝国装备店：帝国新手商店

API_CreateMonster(79,11026,47,68,3,0,-1)		--帝国学院：帝国技能导师
API_CreateMonster(79,11268,55,77,4,0,-1)		--帝国学院：帝国生活技能导师

API_CreateMonster(75,11304,61,68,3,0,-1)		--帝国交易所：帝国交易员
API_CreateMonster(75,11304,57,66,5,0,-1)		--帝国交易所：帝国交易员

API_CreateMonster(82,11042,127,168,4,0,-1)		--帝国皇宫：帝国总督
API_CreateMonster(82,11002,60,117,4,0,-1)		--帝国皇宫：帝国枢密院长
API_CreateMonster(82,11000,186,128,5,0,-1)		--帝国皇宫：帝国元老院长

API_CreateMonster(78,11012,56,62,3,0,-1)		--帝国研究所：帝国装备保养员
API_CreateMonster(78,11008,68,68,4,0,-1)		--帝国研究所：帝国装备改造师
API_CreateMonster(78,11028,56,55,3,0,-1)		--帝国邮箱
API_CreateMonster(78,11468,63,68,5,0,-1)		--帝国研究所：帝国装备收购商

API_CreateMonster(76,11024,57,57,2,0,-1)		--帝国宝石店：帝国宝石商人
API_CreateMonster(76,11010,57,60,3,0,-1)		--帝国宝石店：帝国珠宝工匠
API_CreateMonster(76,11028,59,68,5,0,-1)		--帝国邮箱

--野外NPC
API_CreateMonster(3,11021,57,50,3,0,-1)			--联邦药店商人
API_CreateMonster(5,11023,54,68,4,0,-1)			--联邦生产供应商
API_CreateMonster(10,11265,194,196,5,0,-1)		--联邦新手商店
API_CreateMonster(10,11567,193,186,4,0,-1)		--联邦小镇卫兵
API_CreateMonster(10,11569,256,218,5,0,-1)		--联邦公民空间传送塔卫兵
API_CreateMonster(10,11573,178,241,4,0,-1)		--联邦国有资源采集区卫兵
API_CreateMonster(10,11648,196,204,4,0,-1)		--联邦材料加工师
API_CreateMonster(25,11663,368,178,3,0,-1)		--联邦PK值查询官

API_CreateMonster(4,11020,53,66,3,0,-1)			--帝国药店商人
API_CreateMonster(6,11022,68,68,4,0,-1)			--帝国生产供应商
API_CreateMonster(9,11264,155,377,4,0,-1)		--帝国新手商店
API_CreateMonster(9,11566,139,389,5,0,-1)		--帝国小镇卫兵
API_CreateMonster(9,11568,196,393,4,0,-1)		--帝国公民空间传送塔卫兵
API_CreateMonster(9,11572,113,317,4,0,-1)		--帝国国有资源采集区卫兵
API_CreateMonster(9,11648,158,382,4,0,-1)		--帝国材料加工师
API_CreateMonster(23,11662,389,239,3,0,-1)		--帝国PK值查询官

--快递任务NPC

API_CreateMonster(74,11501,195,348,4,0,-1)		--1层帝国守卫
API_CreateMonster(74,11502,195,264,4,0,-1)		--1层帝国守卫
API_CreateMonster(74,11503,195,180,4,0,-1)		--1层帝国守卫
API_CreateMonster(74,11504,236,137,4,0,-1)		--1层帝国守卫
API_CreateMonster(74,11505,236,221,4,0,-1)		--1层帝国守卫
API_CreateMonster(74,11506,236,305,4,0,-1)		--1层帝国守卫

API_CreateMonster(74,11517,280,119,4,0,-1)		--1层联邦守卫
API_CreateMonster(74,11518,280,203,4,0,-1)		--1层联邦守卫
API_CreateMonster(74,11519,280,287,4,0,-1)		--1层联邦守卫
API_CreateMonster(74,11520,280,371,4,0,-1)		--1层联邦守卫
API_CreateMonster(74,11521,236,361,4,0,-1)		--1层联邦守卫
API_CreateMonster(74,11522,236,277,4,0,-1)		--1层联邦守卫

API_CreateMonster(93,11507,195,390,4,0,-1)		--2层帝国守卫
API_CreateMonster(93,11508,195,306,4,0,-1)		--2层帝国守卫
API_CreateMonster(93,11509,195,222,4,0,-1)		--2层帝国守卫
API_CreateMonster(93,11510,195,138,4,0,-1)		--2层帝国守卫
API_CreateMonster(93,11511,236,151,4,0,-1)		--2层帝国守卫
API_CreateMonster(93,11512,236,235,4,0,-1)		--2层帝国守卫
API_CreateMonster(93,11513,236,319,4,0,-1)		--2层帝国守卫
API_CreateMonster(93,11514,259,393,4,0,-1)		--2层帝国守卫
API_CreateMonster(93,11515,280,329,4,0,-1)		--2层帝国守卫
API_CreateMonster(93,11516,280,245,4,0,-1)		--2层帝国守卫

API_CreateMonster(93,11523,280,119,4,0,-1)		--2层联邦守卫
API_CreateMonster(93,11524,280,203,4,0,-1)		--2层联邦守卫
API_CreateMonster(93,11525,280,287,4,0,-1)		--2层联邦守卫
API_CreateMonster(93,11526,280,371,4,0,-1)		--2层联邦守卫
API_CreateMonster(93,11527,236,361,4,0,-1)		--2层联邦守卫
API_CreateMonster(93,11528,236,277,4,0,-1)		--2层联邦守卫
API_CreateMonster(93,11529,236,193,4,0,-1)		--2层联邦守卫
API_CreateMonster(93,11530,222,123,4,0,-1)		--2层联邦守卫
API_CreateMonster(93,11531,195,180,4,0,-1)		--2层联邦守卫
API_CreateMonster(93,11532,195,264,4,0,-1)		--2层联邦守卫

--英雄广场
API_CreateMonster(91,11500,169,128,2,0,-1)		--联邦引导者
API_CreateMonster(91,11500,212,128,2,0,-1)		--联邦引导者
API_CreateMonster(91,11500,248,158,7,0,-1)		--联邦引导者
API_CreateMonster(91,11500,248,188,7,0,-1)		--联邦引导者
API_CreateMonster(91,11500,248,216,7,0,-1)		--联邦引导者
API_CreateMonster(91,11500,218,246,4,0,-1)		--联邦引导者
API_CreateMonster(91,11500,190,246,4,0,-1)		--联邦引导者
API_CreateMonster(91,11500,161,246,4,0,-1)		--联邦引导者
API_CreateMonster(91,11500,131,217,3,0,-1)		--联邦引导者
API_CreateMonster(91,11500,131,188,3,0,-1)		--联邦引导者
API_CreateMonster(91,11500,131,159,3,0,-1)		--联邦引导者

API_CreateMonster(91,11571,173,99,5,0,-1)		--联邦英雄广场卫兵

API_CreateMonster(92,11500,169,128,2,0,-1)		--帝国引导者
API_CreateMonster(92,11500,212,128,2,0,-1)		--帝国引导者
API_CreateMonster(92,11500,248,158,7,0,-1)		--帝国引导者
API_CreateMonster(92,11500,248,188,7,0,-1)		--帝国引导者
API_CreateMonster(92,11500,248,216,7,0,-1)		--帝国引导者
API_CreateMonster(92,11500,218,246,4,0,-1)		--帝国引导者
API_CreateMonster(92,11500,190,246,4,0,-1)		--帝国引导者
API_CreateMonster(92,11500,161,246,4,0,-1)		--帝国引导者
API_CreateMonster(92,11500,131,217,3,0,-1)		--帝国引导者
API_CreateMonster(92,11500,131,188,3,0,-1)		--帝国引导者
API_CreateMonster(92,11500,131,159,3,0,-1)		--帝国引导者

API_CreateMonster(92,11570,173,99,5,0,-1)		--帝国英雄广场卫兵
--结婚助手
API_CreateMonster(1,11620,237,330,4,0,-1)      --帝国婚礼助手
API_CreateMonster(2,11621,330,268,4,0,-1)      --联邦婚礼助手
end
