-----------------------------------------------------------------------------------------------------------------------------------------
--路径    ：
--修 改 人：黄蕾
--修改时间：2011年10月19日
--修改内容：1、	NPC增加：落日、娜沙、光明增加战斗技能导师
-----------------------------------------------------------------------------------------------------------------------------------------
local FastID
if API_GetServerID() == 1  then
	--麦穗平原（联邦）
	API_CreateMonster(25,11265,138,316,3,0,-1)		--联邦新手商人
	LianBangZhengZhang = API_CreateMonster(25,11821,138,312,5,0,-1)		--老镇长贝安
	API_CreateMonster(25,11822,189,308,5,0,-1)		--勇士埃蒙
	--API_CreateMonster(25,11824,150,298,3,0,-1)	--铁匠萨兰
	API_CreateMonster(25,11826,320,229,4,0,-1)		--哨兵努曼
	API_CreateMonster(25,11029,124,316,3,0,-1)		--联邦邮箱
	API_CreateMonster(25,11227,155,322,5,0,-1)		--联邦仓库：联邦仓库管理员
	API_CreateMonster(25,11994,178,288,3,0,-1)		--五级房屋
	API_CreateMonster(25,11469,122,326,3,0,-1)		--联邦装备收购商
	FastID = API_CreateMonster(25,11226,95,279,1,0,-1)		--跨岛传送阵
	API_SetMonsterName(FastID,'  (换线)',3)
	FastID = API_CreateMonster(25,11226,128,328,1,0,-1)		--跨岛传送阵
	API_SetMonsterName(FastID,'  (换线)',3)
	API_CreateMonster(25,11027,135,313,5,0,-1)		--联邦战斗技能导师
	--API_CreateMonster(25,12054,127,297,3,0,-1)		--水晶币兑换商
	--API_CreateMonster(25,11500,124,308,3,0,-1)		--联邦引导者
    --API_CreateMonster(25,12194,122,321,3,0,-1)		--载具商人
	API_CreateMonster(25,12055,148,303,3,0,-1)		--名师榜
    --API_CreateMonster(25,12285,126,308,3,0,-1)		--周年庆典使者
	API_CreateMonster(25,12358,125,305,3,0,-1)      --火爆拉锯大使
	
	--珊瑚群岛（联邦）
	API_CreateMonster(10,11827,131,313,5,0,-1)		--镇长布尔
	API_CreateMonster(10,11833,118,328,4,0,-1)		--工匠西比利
	API_CreateMonster(10,11834,120,298,3,0,-1)		--剑士帕尔
	API_CreateMonster(10,11835,208,293,5,0,-1)		--哨兵比德
	API_CreateMonster(10,11265,131,317,3,0,-1)		--新手商人
	API_CreateMonster(10,11023,119,308,3,0,-1)		--联邦生产供应商
	API_CreateMonster(10,11029,139,332,5,0,-1)		--联邦邮箱
	API_CreateMonster(10,11227,119,312,3,0,-1)		--联邦仓库：联邦仓库管理员
	API_CreateMonster(10,11469,155,307,5,0,-1)		--联邦装备收购商
	API_CreateMonster(10,11027,128,314,5,0,-1)		--联邦战斗技能导师
	API_CreateMonster(10,11269,117,304,3,0,-1)		--联邦生活技能导师
	API_CreateMonster(10,12054,123,321,3,0,-1)		--水晶币兑换商
	--API_CreateMonster(10,11500,119,332,3,0,-1)		--联邦引导者
    API_CreateMonster(10,12194,144,337,5,0,-1)		--载具商人
	API_CreateMonster(10,12055,122,316,3,0,-1)		--名师榜
	API_CreateMonster(10,12358,150,307,5,0,-1)      --火爆拉锯大使
	
	
	--API_CreateMonster(10,11929,129,317,4,0,-1)		--临时商人
	
	--暗礁海（帝国）
	API_CreateMonster(9,11264,157,378,5,0,-1)		--帝国新手商人
	DiGuoZhengZhang = API_CreateMonster(9,11800,154,378,5,0,-1)		--镇长尼赫
	API_CreateMonster(9,11801,177,300,5,0,-1)		--勇士巴纳
	--API_CreateMonster(9,11803,143,364,3,0,-1)		--工匠斯卡拉
	API_CreateMonster(9,11805,284,182,5,0,-1)		--侦察员基多
	API_CreateMonster(9,11028,160,389,5,0,-1)		--帝国邮箱
	API_CreateMonster(9,11228,169,361,3,0,-1)		--帝国仓库：帝国仓库管理员
	API_CreateMonster(9,11994,116,310,3,0,-1)		--五级房屋
	API_CreateMonster(9,11468,176,379,5,0,-1)		--帝国装备收购商
	FastID = API_CreateMonster(9,11216,235,349,1,0,-1)		--跨岛传送阵
	API_SetMonsterName(FastID,'  (换线)',3)
	FastID = API_CreateMonster(9,11216,140,376,1,0,-1)		--跨岛传送阵
	API_SetMonsterName(FastID,'  (换线)',3)
	API_CreateMonster(9,11026,157,381,3,0,-1)		--帝国战斗技能导师
	--API_CreateMonster(9,12053,144,362,3,0,-1)		--水晶币兑换商
	--API_CreateMonster(9,11500,144,367,3,0,-1)		--帝国引导者
    --API_CreateMonster(9,12193,152,400,5,0,-1)		--载具商人
	API_CreateMonster(9,12055,153,383,3,0,-1)		--名师榜
	--API_CreateMonster(9,12285,143,372,3,0,-1)		--周年庆典使者
	API_CreateMonster(9,12358,144,368,3,0,-1)       --火爆拉锯大使
	
	--阳光雨林（帝国）
	API_CreateMonster(23,11806,127,328,5,0,-1)		--村长加罗
	API_CreateMonster(23,11809,320,307,3,0,-1)		--侦察员皮斯
	API_CreateMonster(23,11813,157,338,5,0,-1)		--技师瓦特利
	API_CreateMonster(23,11814,152,321,5,0,-1)		--狂战士拜耶
	API_CreateMonster(23,11815,207,281,4,0,-1)		--哨兵西斯
	API_CreateMonster(23,11264,130,328,5,0,-1)		--新手商人
	API_CreateMonster(23,11022,115,341,5,0,-1)		--帝国生产供应商
	API_CreateMonster(23,11028,118,320,3,0,-1)		--帝国邮箱
	API_CreateMonster(23,11228,144,316,5,0,-1)		--帝国仓库：帝国仓库管理员
	API_CreateMonster(23,11468,118,314,3,0,-1)		--帝国装备收购商
	API_CreateMonster(23,11268,110,338,3,0,-1)		--帝国生活技能导师
	API_CreateMonster(23,11026,130,331,3,0,-1)		--帝国战斗技能导师
	API_CreateMonster(23,12053,133,342,5,0,-1)		--水晶币兑换商
	--API_CreateMonster(23,11500,123,343,5,0,-1)		--帝国引导者
	API_CreateMonster(23,12193,136,342,5,0,-1)		--载具商人
	API_CreateMonster(23,12055,115,331,3,0,-1)		--名师榜
	API_CreateMonster(23,12358,120,343,5,0,-1)       --火爆拉锯大使
	
	
	--API_CreateMonster(23,11929,118,320,4,0,-1)		--临时商人
	
	--塔夫的矿井
	API_CreateMonster(103,11811,197,499,5,0,-1)		--戈登子爵（帝国）
	API_CreateMonster(103,11830,431,139,5,0,-1)		--罗沙子爵（帝国）
	
	--快递任务NPC
	API_CreateMonster(23,11876,118,324,4,0,-1)		--帝国男爵邮政官
	API_CreateMonster(23,11843,194,224,4,0,-1)		--帝国守卫1
	API_CreateMonster(23,11844,261,109,4,0,-1)		--帝国守卫2
	API_CreateMonster(23,11845,329,142,4,0,-1)		--帝国守卫3
	API_CreateMonster(23,11846,349,228,4,0,-1)		--帝国守卫4
	API_CreateMonster(23,11847,280,315,4,0,-1)		--帝国守卫5
	API_CreateMonster(23,11848,211,326,4,0,-1)		--帝国守卫6
	API_CreateMonster(9,11854,282,129,4,0,-1)		--帝国守卫12
	API_CreateMonster(9,11855,151,212,4,0,-1)		--帝国守卫13
	API_CreateMonster(9,11875,144,390,4,0,-1)		--帝国公民邮政官
	API_CreateMonster(9,11856,245,297,4,0,-1)		--帝国守卫14
	API_CreateMonster(9,11857,295,185,4,0,-1)		--帝国守卫15
	API_CreateMonster(9,11858,299,67,4,0,-1)		--帝国守卫16
	
	API_CreateMonster(10,11879,144,307,4,0,-1)		--联邦男爵邮政官
	API_CreateMonster(10,11859,211,307,4,0,-1)		--联邦守卫1
	API_CreateMonster(10,11860,303,270,4,0,-1)		--联邦守卫2
	API_CreateMonster(10,11861,322,148,4,0,-1)		--联邦守卫3
	API_CreateMonster(10,11862,241,180,4,0,-1)		--联邦守卫4
	API_CreateMonster(10,11863,206,235,4,0,-1)		--联邦守卫5
	API_CreateMonster(10,11864,151,249,4,0,-1)		--联邦守卫6
	API_CreateMonster(25,11870,328,239,4,0,-1)		--联邦守卫12
	API_CreateMonster(25,11871,235,345,4,0,-1)		--联邦守卫13
	API_CreateMonster(25,11878,146,326,4,0,-1)		--联邦公民邮政官
	API_CreateMonster(25,11872,165,243,4,0,-1)		--联邦守卫14
	API_CreateMonster(25,11873,225,180,4,0,-1)		--联邦守卫15
	API_CreateMonster(25,11874,315,214,4,0,-1)		--联邦守卫16
	
	
	--跨服联赛赛区	
	FastID = API_CreateMonster(127,11226,133,78,1,0,-1)		--跨岛传送阵
	API_SetMonsterName(FastID,'  (换线)',3)
			
end

if API_GetServerID() == 1 then
	--联邦主城NPC
	API_CreateMonster(2,11265,250,154,4,0,-1)		--联邦新手商店
	API_CreateMonster(2,11029,247,187,5,0,-1)		--联邦邮箱
	API_CreateMonster(2,11029,144,254,3,0,-1)		--联邦邮箱
	API_CreateMonster(2,11469,232,188,3,0,-1)		--联邦装备收购商
	API_CreateMonster(2,11841,240,149,4,0,-1)		--灵魂石导师
	API_CreateMonster(2,12257,240,149,4,0,-1)		--礼包商人
	API_CreateMonster(2,11621,330,268,4,0,-1)		--联邦婚礼助手
	API_CreateMonster(2,12002,257,139,3,0,-1)		--联邦家具商人
	API_CreateMonster(2,12044,261,147,3,0,-1)		--联邦售楼小姐
	API_CreateMonster(2,12054,246,148,3,0,-1)		--水晶币兑换商
	API_CreateMonster(2,11719,227,136,6,0,-1)       --排行榜
	API_CreateMonster(2,12048,222,136,6,0,-1)		--战争信息板
    FastID = API_CreateMonster(2,11352,269,342,4,0,-1)
    API_SetMonsterName(FastID ,'竞技场入口',1)
	API_CreateMonster(2,12194,228,175,3,0,-1)		--载具商人
	API_CreateMonster(2,12395,228,172,3,0,-1)		--GM小助手
	API_CreateMonster(2,12213,262,130,3,0,-1)		--题卷兑换使者
	API_CreateMonster(2,12242,247,152,3,0,-1)		--新年礼物兑换官
	API_CreateMonster(2,12397,250,149,3,0,-1)		--金克拉兑换官
	API_CreateMonster(2,12396,246,141,3,0,-1)		--题卷兑换使者
        API_CreateMonster(2,12414,244,160,3,0,-1)		--宝箱
        API_CreateMonster(2,12415,233,138,3,0,-1)		--签到
	       

	--联邦主城室内NPC
	API_CreateMonster(40,11005,64,74,5,0,-1)		--联邦教堂：联邦牧师
	
	API_CreateMonster(41,11007,52,69,5,0,-1)		--联邦佣兵团管理员
	API_CreateMonster(41,11575,62,68,5,0,-1)		--联邦调酒师
	API_CreateMonster(41,12144,69,63,3,0,-1)        --联邦酒吧内排行榜
	
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
	
	API_CreateMonster(65,11027,25,56,3,0,-1)		--联邦学院：联邦技能导师
	API_CreateMonster(65,11269,80,53,3,0,-1)		--联邦学院：联邦生活技能导师
	
	API_CreateMonster(66,11303,50,59,3,0,-1)		--联邦交易所：联邦交易员
	API_CreateMonster(66,11303,50,73,3,0,-1)		--联邦交易所：联邦交易员
	
	API_CreateMonster(67,11043,129,173,5,0,-1)		--联邦皇宫：联邦总督
	API_CreateMonster(67,11003,62,109,3,0,-1)		--联邦皇宫：联邦辅政官
	API_CreateMonster(67,11001,182,107,2,0,-1)		--联邦皇宫：联邦议会议长
	
	API_CreateMonster(68,11013,54,68,4,0,-1)		--联邦研究所：联邦装备保养员
	API_CreateMonster(68,11009,67,68,5,0,-1)		--联邦研究所：联邦装备改造师
	API_CreateMonster(68,11029,51,57,3,0,-1)		--联邦研究所：联邦邮箱
	API_CreateMonster(68,11469,51,63,3,0,-1)		--联邦研究所：联邦装备收购商
	API_CreateMonster(68,11227,51,61,3,0,-1)		--联邦仓库：联邦仓库管理员
	
	
	API_CreateMonster(69,11025,53,68,4,0,-1)		--联邦宝石店：联邦宝石商人
	API_CreateMonster(69,11011,67,68,4,0,-1)		--联邦宝石店：联邦珠宝工匠
	API_CreateMonster(69,11029,51,57,1,0,-1)		--联邦邮箱
	
	
	--帝国主城NPC
	API_CreateMonster(1,11264,217,217,4,0,-1)		--帝国新手商店
	API_CreateMonster(1,11028,271,217,4,0,-1)		--帝国邮箱
	API_CreateMonster(1,11028,288,307,5,0,-1)		--帝国邮箱
	API_CreateMonster(1,12395,268,213,4,0,-1)		--GM小助手
	API_CreateMonster(1,12242,223,214,4,0,-1)		--新年礼物兑换官
	API_CreateMonster(1,12397,220,212,3,0,-1)		--金克拉兑换官
	API_CreateMonster(1,11468,278,206,4,0,-1)		--帝国装备收购商
	API_CreateMonster(1,11840,252,181,4,0,-1)		--灵魂石导师
	API_CreateMonster(1,12257,252,181,4,0,-1)		--礼包商人
	API_CreateMonster(1,11228,293,312,3,0,-1)		--帝国仓库：帝国仓库管理员
	API_CreateMonster(1,11620,237,330,4,0,-1)		--帝国婚礼助手
	API_CreateMonster(1,12001,281,289,3,0,-1)		--帝国家具商人
	API_CreateMonster(1,12043,287,289,3,0,-1)		--帝国售楼小姐
	API_CreateMonster(1,12053,255,185,3,0,-1)		--水晶币兑换商
	API_CreateMonster(1,11719,267,94,5,0,-1)        --排行榜
	API_CreateMonster(1,12048,253,94,5,0,-1)		--战争信息板
    FastID = API_CreateMonster(1,11351,205,173,4,0,-1)
    API_SetMonsterName(FastID,'竞技场入口',1)
    API_CreateMonster(1,12193,283,306,5,0,-1)		--载具商人
	API_CreateMonster(1,12213,269,300,3,0,-1)		--题卷兑换使者
	API_CreateMonster(1,12396,228,209,3,0,-1)		--题卷兑换使者
        API_CreateMonster(1,12414,224,208,3,0,-1)		--宝箱
        API_CreateMonster(1,12415,254,99,3,0,-1)		--签到

	
	--帝国主城室内NPC
	API_CreateMonster(81,11004,66,73,5,0,-1)		--帝国教堂：帝国主教
	
	API_CreateMonster(21,11006,66,71,5,0,-1)		--帝国佣兵团管理员
	API_CreateMonster(21,11574,57,57,3,0,-1)		--帝国调酒师
	API_CreateMonster(21,12144,55,69,3,0,-1)        --帝国酒吧内排行榜
	
	API_CreateMonster(80,11014,56,68,3,0,-1)		--帝国装备店：帝国武器商人
	API_CreateMonster(80,11016,54,65,4,0,-1)		--帝国装备店：帝国防具商人
	API_CreateMonster(80,11022,55,55,3,0,-1)		--帝国装备店：帝国生产供应商
	API_CreateMonster(80,11018,66,70,5,0,-1)		--帝国装备店：帝国饰品商人
	API_CreateMonster(80,11264,54,60,3,0,-1)		--帝国装备店：帝国新手商店
	API_CreateMonster(80,11468,60,71,5,0,-1)		--帝国装备店：帝国装备收购商
	
	API_CreateMonster(77,11020,53,66,3,0,-1)		--帝国药店：帝国药品商人
	API_CreateMonster(77,11264,61,71,5,0,-1)		--帝国装备店：帝国新手商店
	
	API_CreateMonster(79,11026,40,74,3,0,-1)		--帝国学院：帝国战斗技能导师
	API_CreateMonster(79,11268,52,85,4,0,-1)		--帝国学院：帝国生活技能导师
	
	API_CreateMonster(75,11304,61,68,3,0,-1)		--帝国交易所：帝国交易员
	API_CreateMonster(75,11304,57,66,5,0,-1)		--帝国交易所：帝国交易员
	
	API_CreateMonster(82,11042,127,168,4,0,-1)		--帝国皇宫：帝国总督
	API_CreateMonster(82,11002,60,117,4,0,-1)		--帝国皇宫：帝国枢密院长
	API_CreateMonster(82,11000,186,128,5,0,-1)		--帝国皇宫：帝国元老院长
	
	API_CreateMonster(78,11012,56,62,3,0,-1)		--帝国研究所：帝国装备保养员
	API_CreateMonster(78,11008,68,68,4,0,-1)		--帝国研究所：帝国装备改造师
	API_CreateMonster(78,11028,56,55,3,0,-1)		--帝国邮箱
	API_CreateMonster(78,11468,63,68,5,0,-1)		--帝国研究所：帝国装备收购商
	API_CreateMonster(78,11228,56,59,3,0,-1)		--帝国仓库：帝国仓库管理员
	
	API_CreateMonster(76,11024,57,57,2,0,-1)		--帝国宝石店：帝国宝石商人
	API_CreateMonster(76,11010,57,60,3,0,-1)		--帝国宝石店：帝国珠宝工匠
	API_CreateMonster(76,11028,59,68,5,0,-1)		--帝国邮箱
	
		--帝国空间传送塔内npc
		--20110924取消浮空岛争夺和拉锯 
	--API_CreateMonster(33,12219,125,91,3,0,-1)			--新手争夺浮空岛传送阵门框
	--API_CreateMonster(33,12232,125,91,3,0,-1)			--新手争夺浮空岛传送阵字体
	--API_CreateMonster(33,11716,125,91,3,0,-1)			--新手争夺浮空岛传送阵光效
	API_CreateMonster(42,12219,125,91,3,0,-1)			--男爵拉锯战浮空岛传送阵门框
	API_CreateMonster(42,12228,125,91,3,0,-1)			--男爵拉锯战浮空岛传送阵字体
	API_CreateMonster(42,11907,125,91,3,0,-1)			--男爵拉锯战浮空岛传送阵光效
	--API_CreateMonster(33,12219,125,107,3,0,-1)			--男爵拉锯战浮空岛传送阵门框
	--API_CreateMonster(33,12228,125,107,3,0,-1)			--男爵拉锯战浮空岛传送阵字体
	--API_CreateMonster(33,11907,125,107,3,0,-1)			--男爵拉锯战浮空岛传送阵光效
	API_CreateMonster(44,12219,125,91,3,0,-1)			--子爵拉锯战浮空岛传送阵门框
	API_CreateMonster(44,12228,125,91,3,0,-1)			--子爵拉锯战浮空岛传送阵字体
	API_CreateMonster(44,11911,125,91,3,0,-1)			--子爵拉锯战浮空岛传送阵光效
	API_CreateMonster(46,12219,125,91,3,0,-1)			--伯爵拉锯战浮空岛传送阵门框
	API_CreateMonster(46,12228,125,91,3,0,-1)			--伯爵拉锯战浮空岛传送阵字体
	API_CreateMonster(46,11915,125,91,3,0,-1)			--伯爵拉锯战浮空岛传送阵光效
	API_CreateMonster(33,11264,135,77,3,0,-1)			--帝国新手商人
	API_CreateMonster(42,11264,135,77,3,0,-1)			--帝国新手商人
	
	API_CreateMonster(44,12387,135,77,3,0,-1)			--夜莺山谷守护者
	API_CreateMonster(46,12387,135,77,3,0,-1)			--夜莺山谷守护者
	
	FastID = API_CreateMonster(33,12219,125,99,3,0,-1)	--公民防守浮空岛传送阵门框
	FastID = API_CreateMonster(33,12227,125,99,3,0,-1)	--公民防守浮空岛传送阵字体
	FastID = API_CreateMonster(33,11209,125,99,3,0,-1)	--公民防守浮空岛传送阵光效
	FastID = API_CreateMonster(42,12219,125,99,3,0,-1)	--男爵防守浮空岛传送阵门框
	FastID = API_CreateMonster(42,12227,125,99,3,0,-1)	--男爵防守浮空岛传送阵字体
	FastID = API_CreateMonster(42,11240,125,99,3,0,-1)	--男爵防守浮空岛传送阵光效
	FastID = API_CreateMonster(44,12219,125,99,3,0,-1)	--子爵防守浮空岛传送阵门框
	FastID = API_CreateMonster(44,12227,125,99,3,0,-1)	--子爵防守浮空岛传送阵字体
	FastID = API_CreateMonster(44,11248,125,99,3,0,-1)	--子爵防守浮空岛传送阵光效
	FastID = API_CreateMonster(46,12219,125,99,3,0,-1)	--伯爵防守浮空岛传送阵门框
	FastID = API_CreateMonster(46,12227,125,99,3,0,-1)	--伯爵防守浮空岛传送阵字体
	FastID = API_CreateMonster(46,11256,125,99,3,0,-1)	--伯爵防守浮空岛传送阵光效
	
	API_CreateMonster(44,12219,125,115,3,0,-1)			--子爵塔防浮空岛传送阵门框
	API_CreateMonster(44,12231,125,115,3,0,-1)			--子爵塔防浮空岛传送阵字体
	API_CreateMonster(44,11211,125,115,3,0,-1)			--子爵塔防浮空岛传送阵光效
	API_CreateMonster(46,12219,125,115,3,0,-1)			--伯爵塔防浮空岛传送阵门框
	API_CreateMonster(46,12231,125,115,3,0,-1)			--伯爵塔防浮空岛传送阵字体
	API_CreateMonster(46,11412,125,115,3,0,-1)			--伯爵塔防浮空岛传送阵光效
	
	
	FastID = API_CreateMonsterEx(42,12219,125,107,3,0,-1,1)	--男爵训练营浮空岛传送阵门框
	FastID = API_CreateMonsterEx(42,12223,125,107,3,0,-1,1)	--男爵训练营浮空岛传送阵字体
	FastID = API_CreateMonsterEx(42,11382,125,107,3,0,-1,1)	--男爵训练营浮空岛传送阵光效
	FastID = API_CreateMonsterEx(44,12219,125,107,3,0,-1,1)	--子爵训练营浮空岛传送阵门框
	FastID = API_CreateMonsterEx(44,12223,125,107,3,0,-1,1)	--子爵训练营浮空岛传送阵字体
	FastID = API_CreateMonsterEx(44,11384,125,107,3,0,-1,1)	--子爵训练营浮空岛传送阵光效
	FastID = API_CreateMonsterEx(46,12219,125,107,3,0,-1,1)	--伯爵训练营浮空岛传送阵门框
	FastID = API_CreateMonsterEx(46,12223,125,107,3,0,-1,1)	--伯爵训练营浮空岛传送阵字体
	FastID = API_CreateMonsterEx(46,11386,125,107,3,0,-1,1)	--伯爵训练营浮空岛传送阵光效
	
	
	FastID = API_CreateMonster(42,12219,117,99,3,0,-1)	--帝国男爵试炼空间门框
	FastID = API_CreateMonster(42,12225,117,99,3,0,-1)	--帝国男爵试炼空间字体
	FastID = API_CreateMonster(42,12154,117,99,3,0,-1)	--帝国男爵试炼空间光效
	FastID = API_CreateMonster(44,12219,117,99,3,0,-1)	--帝国子爵试炼空间门框
	FastID = API_CreateMonster(44,12225,117,99,3,0,-1)	--帝国子爵试炼空间字体
	FastID = API_CreateMonster(44,12158,117,99,3,0,-1)	--帝国子爵试炼空间光效
	FastID = API_CreateMonster(46,12219,117,99,3,0,-1)	--帝国伯爵试炼空间门框
	FastID = API_CreateMonster(46,12225,117,99,3,0,-1)	--帝国伯爵试炼空间字体
	FastID = API_CreateMonster(46,12162,117,99,3,0,-1)	--帝国伯爵试炼空间光效
	
	
	FastID = API_CreateMonster(42,12219,117,91,3,0,-1) --帝国男爵命运之地门框
	FastID = API_CreateMonster(42,12234,117,91,3,0,-1) --帝国男爵命运之地字体
	FastID = API_CreateMonster(42,12196,117,91,3,0,-1) --帝国男爵命运之地光效
	FastID = API_CreateMonster(44,12219,117,91,3,0,-1) --帝国子爵命运之地门框
	FastID = API_CreateMonster(44,12234,117,91,3,0,-1) --帝国子爵命运之地字体
	FastID = API_CreateMonster(44,12196,117,91,3,0,-1) --帝国子爵命运之地光效
	FastID = API_CreateMonster(46,12219,117,91,3,0,-1) --帝国伯爵命运之地门框
	FastID = API_CreateMonster(46,12234,117,91,3,0,-1) --帝国伯爵命运之地字体
	FastID = API_CreateMonster(46,12196,117,91,3,0,-1) --帝国伯爵命运之地光效
	
--	API_CreateMonster(44,12219,125,123,3,0,-1)			--夺旗战争（帝国子爵）门框
--	API_CreateMonster(44,12226,125,123,3,0,-1)			--夺旗战争（帝国子爵）字体
--	API_CreateMonster(44,11889,125,123,3,0,-1)			--夺旗战争（帝国子爵）光效
--	API_CreateMonster(46,12219,125,123,3,0,-1)			--夺旗战争（帝国伯爵）门框
--	API_CreateMonster(46,12226,125,123,3,0,-1)			--夺旗战争（帝国伯爵）字体
--	API_CreateMonster(46,11893,125,123,3,0,-1)			--夺旗战争（帝国伯爵）光效
--	API_CreateMonster(48,12219,125,123,3,0,-1)			--夺旗战争（帝国侯爵）门框
--	API_CreateMonster(48,12226,125,123,3,0,-1)			--夺旗战争（帝国侯爵）字体
--	API_CreateMonster(48,11897,125,123,3,0,-1)			--夺旗战争（帝国侯爵）光效
--	API_CreateMonster(50,12219,125,123,3,0,-1)			--夺旗战争（帝国公爵）门框
--	API_CreateMonster(50,12226,125,123,3,0,-1)			--夺旗战争（帝国公爵）字体
--	API_CreateMonster(50,11901,125,123,3,0,-1)			--夺旗战争（帝国公爵）光效
	
	--API_CreateMonster(42,12219,125,131,3,0,-1)			--强者之路（帝国男爵）门框
	--API_CreateMonster(42,12224,125,131,3,0,-1)			--强者之路（帝国男爵）字体
	--API_CreateMonster(42,11474,125,131,3,0,-1)			--强者之路（帝国男爵）光效
	--API_CreateMonster(43,12219,125,131,3,0,-1)			--强者之路（帝国高男）门框
	--API_CreateMonster(43,12224,125,131,3,0,-1)			--强者之路（帝国高男）字体
	--API_CreateMonster(43,11474,125,131,3,0,-1)			--强者之路（帝国高男）光效
	--API_CreateMonster(44,12219,125,131,3,0,-1)			--强者之路（帝国子爵）门框
	--API_CreateMonster(44,12224,125,131,3,0,-1)			--强者之路（帝国子爵）字体
	--API_CreateMonster(44,11474,125,131,3,0,-1)			--强者之路（帝国子爵）光效
	--API_CreateMonster(45,12219,125,131,3,0,-1)			--强者之路（帝国高子）门框
	--API_CreateMonster(45,12224,125,131,3,0,-1)			--强者之路（帝国高子）字体
	--API_CreateMonster(45,11474,125,131,3,0,-1)			--强者之路（帝国高子）光效
	--API_CreateMonster(46,12219,125,131,3,0,-1)			--强者之路（帝国伯爵）门框
	--API_CreateMonster(46,12224,125,131,3,0,-1)			--强者之路（帝国伯爵）字体
	--API_CreateMonster(46,11474,125,131,3,0,-1)			--强者之路（帝国伯爵）光效
	--API_CreateMonster(47,12219,125,131,3,0,-1)			--强者之路（帝国高伯）门框
	--API_CreateMonster(47,12224,125,131,3,0,-1)			--强者之路（帝国高伯）字体
	--API_CreateMonster(47,11474,125,131,3,0,-1)			--强者之路（帝国高伯）光效
	--API_CreateMonster(48,12219,125,131,3,0,-1)			--强者之路（帝国侯爵）门框
	--API_CreateMonster(48,12224,125,131,3,0,-1)			--强者之路（帝国侯爵）字体
	--API_CreateMonster(48,11474,125,131,3,0,-1)			--强者之路（帝国侯爵）光效
	--API_CreateMonster(49,12219,125,131,3,0,-1)			--强者之路（帝国高侯）门框
	--API_CreateMonster(49,12224,125,131,3,0,-1)			--强者之路（帝国高侯）字体
	--API_CreateMonster(49,11474,125,131,3,0,-1)			--强者之路（帝国高侯）光效
	--API_CreateMonster(50,12219,125,131,3,0,-1)			--强者之路（帝国公爵）门框
	--API_CreateMonster(50,12224,125,131,3,0,-1)			--强者之路（帝国公爵）字体
	--API_CreateMonster(50,11474,125,131,3,0,-1)			--强者之路（帝国公爵）光效
	--API_CreateMonster(51,12219,125,131,3,0,-1)			--强者之路（帝国高公）门框
	--API_CreateMonster(51,12224,125,131,3,0,-1)			--强者之路（帝国高公）字体
	--API_CreateMonster(51,11474,125,131,3,0,-1)			--强者之路（帝国高公）光效

	
	--帝国2档生产基地npc
	API_CreateMonster(17,11266,181,181,3,0,-1)			--帝国生产管理员
	API_CreateMonster(17,11264,197,191,5,0,-1)			--帝国新手商店

	--奇迹之岛npc
	API_CreateMonster(126,12364,290,235,3,0,-1)			--帝国生产管理员
	API_CreateMonster(126,11500,290,265,5,0,-1)			--帝国新手商店
	API_CreateMonster(126,12363,320,265,3,0,-1)			--帝国生产管理员
	API_CreateMonster(126,11265,320,235,5,0,-1)			--帝国新手商店
	API_CreateMonster(126,12397,299,243,3,0,-1)			--帝国生产管理员
	API_CreateMonster(126,12242,299,226,5,0,-1)			--帝国新手商店
	API_CreateMonster(126,12396,312,226,3,0,-1)			--帝国生产管理员
	API_CreateMonster(126,12257,312,256,5,0,-1)			--帝国新手商店
	API_CreateMonster(126,12194,299,256,3,0,-1)			--帝国生产管理员
	API_CreateMonster(126,12415,299,213,5,0,-1)			--帝国新手商店
	API_CreateMonster(126,12424,305,219,3,0,-1)			--帝国生产管理员
	
	--联邦2档生产基地npc
	API_CreateMonster(19,11267,179,184,3,0,-1)			--联邦生产管理员
	API_CreateMonster(19,11265,197,192,5,0,-1)			--联邦新手商店
	
	--帝国3档生产基地npc
	API_CreateMonster(86,11266,181,181,3,0,-1)			--帝国生产管理员
	API_CreateMonster(86,11264,197,191,5,0,-1)			--帝国新手商店
	
	--联邦3档生产基地npc
	API_CreateMonster(85,11267,179,184,3,0,-1)			--联邦生产管理员
	API_CreateMonster(85,11265,197,192,5,0,-1)			--联邦新手商店
	
	--光明遗迹室内npc
	API_CreateMonster(123,11303,50,59,3,0,-1)		--联邦交易所：联邦交易员
	API_CreateMonster(123,11303,50,73,3,0,-1)		--联邦交易所：联邦交易员
	FastID = API_CreateMonster(123,11727,50,66,3,0,-1)		--联邦佣兵团使者
	API_SetTaskNpcState(0,FastID,1)

	API_CreateMonster(124,11304,61,68,3,0,-1)		--帝国交易所：帝国交易员
	API_CreateMonster(124,11304,57,66,5,0,-1)		--帝国交易所：帝国交易员
	FastID = API_CreateMonster(124,11727,66,71,5,0,-1)		--帝国佣兵团使者
	API_SetTaskNpcState(0,FastID,1)
end

if API_GetServerID() == 6 or API_GetServerID() == 1 or API_GetServerID() == 2 then
	--双子岛
	API_CreateMonster(104,11931,439,431,5,0,-1)		--饲养员
	API_CreateMonster(104,11931,440,293,5,0,-1)		--饲养员
	API_CreateMonster(104,11931,433,585,5,0,-1)		--饲养员
	API_CreateMonster(104,12045,434,237,5,0,1)		--跨岛传送联邦
	API_CreateMonster(104,12045,438,667,5,0,0)		--跨岛传送帝国

	--英雄大陆之娜纱湿地（联邦）
	API_CreateMonster(98,11741,293,519,5,0,-1)		--猎户西弗
	API_CreateMonster(98,11742,256,386,4,0,-1)		--探险家麦利
	API_CreateMonster(98,11743,448,314,4,0,-1)		--渔夫拉菲
	API_CreateMonster(98,11749,358,357,5,0,-1)		--铁匠古德
	API_CreateMonster(98,11750,373,372,4,0,-1)		--可米拉子爵
	API_CreateMonster(98,11751,404,369,3,0,-1)		--受伤的指挥官多西
	API_CreateMonster(98,11752,364,408,3,0,-1)		--游击士莱特
	API_CreateMonster(98,11753,453,458,3,0,-1)		--哨兵加森
	API_CreateMonster(98,11754,459,459,5,0,-1)		--侦察兵基墨
	API_CreateMonster(98,11023,357,389,3,0,-1)		--联邦生产供应商
	API_CreateMonster(98,11029,369,369,5,0,-1)		--联邦邮箱
	API_CreateMonster(98,11227,352,346,3,0,-1)		--联邦仓库：联邦仓库管理员
	API_CreateMonster(98,11265,358,352,3,0,-1)		--新手商人
	API_CreateMonster(98,11469,351,384,4,0,-1)		--联邦装备收购商
	API_CreateMonster(98,12054,393,366,3,0,-1)		--水晶币兑换商
	API_CreateMonster(98,11719,359,369,3,0,-1)      --排行榜
	API_CreateMonster(98,12048,359,365,3,0,-1)		--战争信息板
	API_CreateMonster(98,12194,387,344,3,0,-1)		--载具商人
	API_CreateMonster(98,12244,382,407,5,0,-1)		--战备指挥官摩罗
	API_CreateMonster(98,12358,374,375,3,0,-1)		--火爆拉锯大使
	API_CreateMonster(98,11027,389,363,5,0,-1)      --战斗技能导师
	
	--快递任务NPC
	API_CreateMonster(98,11880,365,398,4,0,-1)		--联邦子爵邮政官
	API_CreateMonster(98,11865,506,294,4,0,-1)		--联邦守卫7
	API_CreateMonster(98,11866,572,424,4,0,-1)		--联邦守卫8
	
	
	--五级房屋(联邦)
	API_CreateMonster(118,11983,103,154,5,0,-1)
	API_CreateMonster(118,11978,107,155,5,0,-1)
	API_CreateMonster(118,11978,102,155,5,0,-1)
	API_CreateMonster(118,11982,103,154,5,0,-1)
	API_CreateMonster(118,11981,101,154,5,0,-1)
	API_CreateMonster(118,11988,109,155,5,0,-1)
	API_CreateMonster(118,11985,98,154,4,0,-1)
	API_CreateMonster(118,11977,97,147,3,0,-1)
	API_CreateMonster(118,11984,98,151,3,0,-1)
	API_CreateMonster(118,11987,100,154,5,0,-1)
	API_CreateMonster(118,11980,104,147,5,0,-1)
	API_CreateMonster(118,11979,103,148,5,0,-1)
	API_CreateMonster(118,11979,106,148,5,0,-1)
	API_CreateMonster(118,11979,104,144,1,0,-1)
	API_CreateMonster(118,11979,106,144,1,0,-1)
	API_CreateMonster(118,11989,98,139,3,0,-1)
	API_CreateMonster(118,11990,100,137,5,0,-1)
	API_CreateMonster(118,11992,103,137,5,0,-1)
	API_CreateMonster(118,11993,106,137,5,0,-1)
	--五级房屋(帝国)
	API_CreateMonster(119,11983,103,154,5,0,-1)
	API_CreateMonster(119,11978,107,155,5,0,-1)
	API_CreateMonster(119,11978,102,155,5,0,-1)
	API_CreateMonster(119,11982,103,154,5,0,-1)
	API_CreateMonster(119,11981,101,154,5,0,-1)
	API_CreateMonster(119,11988,109,155,5,0,-1)
	API_CreateMonster(119,11985,98,154,4,0,-1)
	API_CreateMonster(119,11977,97,147,3,0,-1)
	API_CreateMonster(119,11984,98,151,3,0,-1)
	API_CreateMonster(119,11987,100,154,5,0,-1)
	API_CreateMonster(119,11980,104,147,5,0,-1)
	API_CreateMonster(119,11979,103,148,5,0,-1)
	API_CreateMonster(119,11979,106,148,5,0,-1)
	API_CreateMonster(119,11979,104,144,1,0,-1)
	API_CreateMonster(119,11979,106,144,1,0,-1)
	API_CreateMonster(119,11989,97,139,3,0,-1)
	API_CreateMonster(119,11990,100,137,5,0,-1)
	API_CreateMonster(119,11992,103,137,5,0,-1)
	API_CreateMonster(119,11993,106,137,5,0,-1)
	
end

if API_GetServerID() == 7 or API_GetServerID() == 1 or API_GetServerID() == 2 then
	--双子岛
	API_CreateMonster(104,11931,439,431,5,0,-1)		--饲养员
	API_CreateMonster(104,11931,440,293,5,0,-1)		--饲养员
	API_CreateMonster(104,11931,433,585,5,0,-1)		--饲养员
	API_CreateMonster(104,12045,434,237,5,0,1)		--跨岛传送联邦
	API_CreateMonster(104,12045,438,667,5,0,0)		--跨岛传送帝国
	
	--英雄大陆之落日农庄（帝国）
	API_CreateMonster(99,11745,283,477,5,0,-1)		--农场主谢曼
	API_CreateMonster(99,11746,443,432,5,0,-1)		--护林人雷斯特
	API_CreateMonster(99,11747,353,427,3,0,-1)		--小镇治安官摩林
	API_CreateMonster(99,11756,361,371,3,0,-1)		--木匠德塞
	API_CreateMonster(99,11757,377,367,4,0,-1)		--女伯爵谬纱
	API_CreateMonster(99,11758,379,351,3,0,-1)		--勇猛的库班
	API_CreateMonster(99,11759,370,389,5,0,-1)		--冲锋手西波
	API_CreateMonster(99,11760,260,255,5,0,-1)		--哨兵奈利
	API_CreateMonster(99,11761,353,174,4,0,-1)		--血卫士古蓝达
	API_CreateMonster(99,11762,358,172,5,0,-1)		--哨兵凯宾
	API_CreateMonster(99,11022,380,392,3,0,-1)		--帝国生产供应商
	API_CreateMonster(99,11028,387,393,5,0,-1)		--帝国邮箱
	API_CreateMonster(99,11228,391,367,5,0,-1)		--帝国仓库：帝国仓库管理员
	API_CreateMonster(99,11264,360,353,3,0,-1)		--新手商人
	API_CreateMonster(99,11468,376,386,5,0,-1)		--帝国装备收购商
	API_CreateMonster(99,12053,363,366,3,0,-1)		--水晶币兑换商
	API_CreateMonster(99,11719,359,380,3,0,-1)      --排行榜
	API_CreateMonster(99,12048,359,376,3,0,-1)		--战争信息板
	API_CreateMonster(99,12193,398,367,5,0,-1)		--载具商人
	API_CreateMonster(99,12244,403,365,5,0,-1)		--战备指挥官摩罗
	API_CreateMonster(99,12358,379,369,4,0,-1)      --火爆拉锯大使
	API_CreateMonster(99,11026,361,362,3,0,-1)      --战斗技能导师
	--快递任务NPC
	API_CreateMonster(99,11877,384,393,4,0,-1)		--帝国子爵邮政官
	API_CreateMonster(99,11849,430,338,4,0,-1)		--帝国守卫7
	API_CreateMonster(99,11850,334,208,4,0,-1)		--帝国守卫8
	
	--光明遗迹
	API_CreateMonster(111,11966,196,318,3,0,-1)		--战士艾伦
	API_CreateMonster(111,11967,262,423,5,0,-1)		--游击士诺顿
	API_CreateMonster(111,11968,248,516,5,0,-1)		--指挥官摩西
	API_CreateMonster(111,11969,294,282,3,0,-1)		--炼金术士迪克
	API_CreateMonster(111,11970,425,554,5,0,-1)		--垂死的达恩
	API_CreateMonster(111,11971,530,347,3,0,-1)		--猎杀者魔眼
	API_CreateMonster(111,11719,210,502,5,0,-1)     --排行榜
	API_CreateMonster(111,12048,205,502,5,0,-1)		--战争信息板
	API_CreateMonster(111,11028,215,509,3,0,-1)		--帝国邮箱
	API_CreateMonster(111,11264,231,519,5,0,-1)		--新手商人
	API_CreateMonster(111,11228,206,528,5,0,-1)		--帝国仓库：帝国仓库管理员
	API_CreateMonster(111,11022,217,534,3,0,-1)		--帝国生产供应商
	API_CreateMonster(111,11468,197,530,5,0,-1)		--帝国装备收购商
	API_CreateMonster(111,12193,213,530,5,0,-1)		--载具商人
	API_CreateMonster(111,11719,332,202,5,0,-1)     --排行榜
	API_CreateMonster(111,12048,337,202,5,0,-1)		--战争信息板
	API_CreateMonster(111,11029,322,171,5,0,-1)		--联邦邮箱
	API_CreateMonster(111,11265,349,173,5,0,-1)		--新手商人
	API_CreateMonster(111,11469,353,177,3,0,-1)		--联邦装备收购商
	API_CreateMonster(111,11227,323,180,3,0,-1)		--联邦仓库：联邦仓库管理员
	API_CreateMonster(111,11023,348,145,3,0,-1)		--联邦生产供应商
	API_CreateMonster(111,12194,371,157,5,0,-1)		--载具商人
	API_CreateMonster(111,11962,370,195,5,0,-1)		--治安官莫雷
	API_CreateMonster(111,11972,417,370,5,0,-1)		--守卫者
	API_CreateMonster(111,11009,304,209,3,0,-1)		--联邦装备改造师
	API_CreateMonster(111,11013,312,213,5,0,-1)		--联邦装备保养员
	API_CreateMonster(111,11011,316,170,5,0,-1)		--联邦珠宝工匠
	API_CreateMonster(111,11012,168,534,5,0,-1)		--帝国装备保养员
	API_CreateMonster(111,11008,177,513,3,0,-1)		--帝国装备改造师
	API_CreateMonster(111,11010,188,533,4,0,-1)		--帝国珠宝工匠
	API_CreateMonster(111,12219,252,546,5,0,-1)		--帝国医疗门门框
	API_CreateMonster(111,12335,252,546,5,0,-1)		--帝国医疗门字体
	API_CreateMonster(111,12336,252,546,5,0,-1)		--帝国医疗门光效
	API_CreateMonster(111,12328,323,201,5,0,-1)		--联邦医疗门
	API_CreateMonster(111,11021,328,171,4,0,-1)		--联邦材料药品商
	API_CreateMonster(111,11020,243,540,5,0,-1)		--帝国材料药品商
	API_CreateMonster(111,12358,239,517,5,0,-1)      --火爆拉锯大使
	API_CreateMonster(111,12358,366,193,5,0,-1)      --火爆拉锯大使
	API_CreateMonster(111,11027,353,151,3,0,-1)      --战斗技能导师
	API_CreateMonster(111,11026,226,537,5,0,-1)      --战斗技能导师
	
	--天空都市
    API_CreateMonster(130,12330,401,378,5,0,-1)		--联邦传送门
	API_CreateMonster(130,12273,413,182,5,0,-1)		--联邦前敌指挥官马凯
    API_CreateMonster(130,12275,423,332,5,0,-1)		--联邦突击营营长列宾
	API_CreateMonster(130,12330,505,375,5,0,-1)		--帝国传送门
	API_CreateMonster(130,12272,527,182,5,0,-1)		--帝国前敌指挥官费斯
	API_CreateMonster(130,12274,502,329,5,0,-1)		--帝国突击营营长艾宁
	API_CreateMonster(130,12271,445,538,5,0,-1)		--盟军指挥官公用
	API_CreateMonster(130,12279,366,543,5,0,-1)		--机械族鲁卡
	API_CreateMonster(111,12321,216,513,3,0,-1)		--帝国卡牌兑换官 --12321
	API_CreateMonster(111,12307,582,382,3,0,-1)		--光明遗迹飞艇管理员 --12307
	API_CreateMonster(130,12317,415,190,5,0,-1)		--天空都市联邦飞艇管理员 --12317
	API_CreateMonster(130,12317,518,187,4,0,-1)		--天空都市帝国飞艇管理员 --12317
	API_CreateMonster(111,12321,352,174,4,0,-1)		--联邦卡牌兑换官 --12321
	API_CreateMonster(130,12319,529,282,7,0,-1)		--帝国先驱者(嗯戈斯)
	API_CreateMonster(130,12318,397,271,2,0,-1)		--联邦先驱者(麻客斯)
	API_CreateMonster(130,12331,481,494,7,0,-1)		--帝国冒险者(水沝淼)
	API_CreateMonster(130,12320,420,494,3,0,-1)		--联邦冒险者(火炎焱)
	API_CreateMonster(130,12332,353,719,6,0,-1)		--探路王(木林森)
end

if API_GetServerID() == 8 or API_GetServerID() == 1 or API_GetServerID() == 2  then
	--英雄广场
	API_CreateMonster(91,12363,134,116,5,0,-1)		--联邦引导者
	API_CreateMonster(91,12362,118,116,5,0,-1)		--联邦引导者
	API_CreateMonster(91,11500,118,132,4,0,-1)		--联邦引导者
	API_CreateMonster(91,12364,134,132,5,0,-1)		--联邦引导者
	API_CreateMonster(91,12424,125,79,5,0,-1)		--联邦引导者
	
	API_CreateMonster(92,11500,134,116,0,0,-1)		--帝国引导者
	API_CreateMonster(92,11500,118,116,2,0,-1)		--帝国引导者
	API_CreateMonster(92,11500,118,132,4,0,-1)		--帝国引导者
	API_CreateMonster(92,11500,134,132,5,0,-1)		--帝国引导者

	--英雄大厅 一排兑换商人（联邦91 / 帝国92）
	API_CreateMonsterEx(91,12378,109,79,5,0,-1,1)		--联邦英雄大厅 特殊商人(魂器商人)
	API_CreateMonster(91,12415,115,79,5,0,-1)		--联邦英雄大厅 签到商人(签到达人)
	API_CreateMonster(91,12242,121,79,5,0,-1)		--联邦英雄大厅 龙鳞商人(龙鳞兑换官)
	API_CreateMonster(91,12257,118,79,5,0,-1)		--联邦英雄大厅 礼包特使
	API_CreateMonster(91,12397,127,79,5,0,-1)		--联邦英雄大厅 金克拉商人(金克拉兑换官)
	API_CreateMonster(91,12396,133,79,5,0,-1)		--联邦英雄大厅 冰晶商人(冰晶兑换官)

	API_CreateMonsterEx(92,12378,109,79,5,0,-1,1)		--帝国英雄大厅 特殊商人(魂器商人)
	API_CreateMonster(92,12415,115,79,5,0,-1)		--帝国英雄大厅 签到商人(签到达人)
	API_CreateMonster(92,12242,121,79,5,0,-1)		--帝国英雄大厅 龙鳞商人(龙鳞兑换官)
	API_CreateMonster(92,12257,118,79,5,0,-1)		--帝国英雄大厅 礼包特使
	API_CreateMonster(92,12397,127,79,5,0,-1)		--帝国英雄大厅 金克拉商人(金克拉兑换官)
	API_CreateMonster(92,12396,133,79,5,0,-1)		--帝国英雄大厅 冰晶商人(冰晶兑换官)

	
	--英雄大陆之月暮草场
	API_CreateMonster(101,11662,470,590,4,0,-1)		--帝国PK值查询官
	API_CreateMonster(101,11663,282,381,4,0,-1)		--联邦PK值查询官
	API_CreateMonster(101,11648,469,586,4,0,-1)		--帝国材料兑换官
	API_CreateMonster(101,11648,288,382,4,0,-1)		--联邦材料兑换官
	API_CreateMonster(101,11949,404,493,5,0,-1)		--守护者爱达
	API_CreateMonster(101,11755,319,365,5,0,-1)		--游击士高姆
	API_CreateMonster(101,11951,414,604,5,0,-1)		--雷德子爵
	API_CreateMonster(101,11952,448,433,3,0,-1)		--地穴守卫
	API_CreateMonster(101,11953,537,421,5,0,-1)		--吟游诗人西泽
	--快递任务NPC
	API_CreateMonster(101,11851,354,452,4,0,-1)		--帝国守卫9
	API_CreateMonster(101,11852,508,430,4,0,-1)		--帝国守卫10
	API_CreateMonster(101,11853,479,548,4,0,-1)		--帝国守卫11
	API_CreateMonster(101,11867,422,529,4,0,-1)		--联邦守卫9
	API_CreateMonster(101,11868,449,363,4,0,-1)		--联邦守卫10
	API_CreateMonster(101,11869,328,374,4,0,-1)		--联邦守卫11
	
	--英雄大陆之沙暴绿洲
	API_CreateMonster(102,11954,476,651,5,0,-1)		--旅行家肖恩
	API_CreateMonster(102,11955,755,432,3,0,-1)		--女神阿芙拉
	API_CreateMonster(102,11956,532,310,4,0,-1)		--莎拉子爵
	API_CreateMonster(102,11957,640,817,5,0,-1)		--赛拉子爵
	API_CreateMonster(102,11228,645,822,5,0,-1)		--帝国仓库：帝国仓库管理员
    API_CreateMonster(102,11028,629,826,5,0,-1)		--帝国邮箱
    API_CreateMonster(102,11264,629,790,4,0,-1)		--新手商人
    API_CreateMonster(102,11227,535,315,5,0,-1)		--联邦仓库：联邦仓库管理员
    API_CreateMonster(102,11029,517,328,5,0,-1)		--联邦邮箱
    API_CreateMonster(102,11265,540,303,3,0,-1)		--新手商人
	API_CreateMonster(102,12358,642,820,5,0,-1)      --火爆拉锯大使
	API_CreateMonster(102,12358,546,332,5,0,-1)		 --火爆拉锯大使
	--API_CreateMonster(102,12285,542,587,5,0,-1)		--周年庆典使者
	
	--冰封隧道
	API_CreateMonster(129,12309,119,147,3,0,-1)		--新手商人
	API_CreateMonster(129,12193,119,150,3,0,-1)		--载具商人
	
	--艾斯雪域
	API_CreateMonster(128,12309,442,399,3,0,-1)		--新手商人
	--API_CreateMonster(128,12310,442,417,5,0,-1)		--雪域密使

	
end

if API_GetServerID() == 9 or API_GetServerID() == 1 or API_GetServerID() == 2 then
	--联邦空间传送塔内npc
	--API_CreateMonster(32,12220,124,90,3,0,-1)			--新手争夺浮空岛传送阵门框
	--API_CreateMonster(32,12232,124,90,3,0,-1)			--新手争夺浮空岛传送阵字体
	--API_CreateMonster(32,11717,124,90,3,0,-1)			--新手争夺浮空岛传送阵光效
	API_CreateMonster(52,12220,124,90,3,0,-1)			--男爵拉锯战浮空岛传送阵门框
	API_CreateMonster(52,12228,124,90,3,0,-1)			--男爵拉锯战浮空岛传送阵字体
	API_CreateMonster(52,11908,124,90,3,0,-1)			--男爵拉锯战浮空岛传送阵光效
	--API_CreateMonster(32,12220,124,107,3,0,-1)			--男爵拉锯战浮空岛传送阵门框
    --API_CreateMonster(32,12228,124,107,3,0,-1)			--男爵拉锯战浮空岛传送阵字体
	--API_CreateMonster(32,11908,124,107,3,0,-1)			--男爵拉锯战浮空岛传送阵光效
	API_CreateMonster(54,12220,124,90,3,0,-1)			--子爵拉锯战浮空岛传送阵门框
	API_CreateMonster(54,12228,124,90,3,0,-1)			--子爵拉锯战浮空岛传送阵字体
	API_CreateMonster(54,11912,124,90,3,0,-1)			--子爵拉锯战浮空岛传送阵光效
	API_CreateMonster(56,12220,124,90,3,0,-1)			--伯爵拉锯战浮空岛传送阵门框
	API_CreateMonster(56,12228,124,90,3,0,-1)			--伯爵拉锯战浮空岛传送阵字体
	API_CreateMonster(56,11916,124,90,3,0,-1)			--伯爵拉锯战浮空岛传送阵光效
	API_CreateMonster(32,11265,133,78,3,0,-1)			--联邦新手商人
	API_CreateMonster(52,11265,133,78,3,0,-1)			--联邦新手商人
	
	FastID = API_CreateMonster(32,12220,124,98,3,0,-1)	--公民防守浮空岛传送阵门框
	FastID = API_CreateMonster(32,12227,124,98,3,0,-1)	--公民防守浮空岛传送阵字体
	FastID = API_CreateMonster(32,11219,124,98,3,0,-1)	--公民防守浮空岛传送阵光效
	FastID = API_CreateMonster(52,12220,124,98,3,0,-1)	--男爵防守浮空岛传送阵门框
	FastID = API_CreateMonster(52,12227,124,98,3,0,-1)	--男爵防守浮空岛传送阵字体
	FastID = API_CreateMonster(52,11242,124,98,3,0,-1)	--男爵防守浮空岛传送阵光效
	FastID = API_CreateMonster(54,12220,124,98,3,0,-1)	--子爵防守浮空岛传送阵门框
	FastID = API_CreateMonster(54,12227,124,98,3,0,-1)	--子爵防守浮空岛传送阵字体
	FastID = API_CreateMonster(54,11250,124,98,3,0,-1)	--子爵防守浮空岛传送阵光效
	FastID = API_CreateMonster(56,12220,124,98,3,0,-1)	--伯爵防守浮空岛传送阵门框
	FastID = API_CreateMonster(56,12227,124,98,3,0,-1)	--伯爵防守浮空岛传送阵字体
	FastID = API_CreateMonster(56,11258,124,98,3,0,-1)	--伯爵防守浮空岛传送阵光效
	
	API_CreateMonster(54,12387,135,77,3,0,-1)			--夜莺山谷守护者
	API_CreateMonster(56,12387,135,77,3,0,-1)			--夜莺山谷守护者
	
	API_CreateMonster(54,12220,124,114,3,0,-1)			--子爵塔防浮空岛传送阵门框
	API_CreateMonster(54,12231,124,114,3,0,-1)			--子爵塔防浮空岛传送阵字体
	API_CreateMonster(54,11221,124,114,3,0,-1)			--子爵塔防浮空岛传送阵光效
	API_CreateMonster(56,12220,124,114,3,0,-1)			--伯爵塔防浮空岛传送阵门框
	API_CreateMonster(56,12231,124,114,3,0,-1)			--伯爵塔防浮空岛传送阵字体
	API_CreateMonster(56,11413,124,114,3,0,-1)			--伯爵塔防浮空岛传送阵光效
	
	FastID = API_CreateMonsterEx(52,12220,124,106,3,0,-1,1)	--男爵训练营浮空岛传送阵门框
	FastID = API_CreateMonsterEx(52,12230,124,106,3,0,-1,1)	--男爵训练营浮空岛传送阵字体
	FastID = API_CreateMonsterEx(52,11393,124,106,3,0,-1,1)	--男爵训练营浮空岛传送阵光效
	FastID = API_CreateMonsterEx(54,12220,124,106,3,0,-1,1)	--子爵训练营浮空岛传送阵门框
	FastID = API_CreateMonsterEx(54,12230,124,106,3,0,-1,1)	--子爵训练营浮空岛传送阵字体
	FastID = API_CreateMonsterEx(54,11395,124,106,3,0,-1,1)	--子爵训练营浮空岛传送阵光效
	FastID = API_CreateMonsterEx(56,12220,124,106,3,0,-1,1)	--伯爵训练营浮空岛传送阵门框
	FastID = API_CreateMonsterEx(56,12230,124,106,3,0,-1,1)	--伯爵训练营浮空岛传送阵字体
	FastID = API_CreateMonsterEx(56,11397,124,106,3,0,-1,1)	--伯爵训练营浮空岛传送阵光效
	
	
	FastID = API_CreateMonster(52,12220,116,98,3,0,-1)	--联邦男爵试炼空间门框
	FastID = API_CreateMonster(52,12225,116,98,3,0,-1)	--联邦男爵试炼空间字体
	FastID = API_CreateMonster(52,12155,116,98,3,0,-1)	--联邦男爵试炼空间光效
	FastID = API_CreateMonster(54,12220,116,98,3,0,-1)	--联邦子爵试炼空间门框
	FastID = API_CreateMonster(54,12225,116,98,3,0,-1)	--联邦子爵试炼空间字体
	FastID = API_CreateMonster(54,12159,116,98,3,0,-1)	--联邦子爵试炼空间光效
	FastID = API_CreateMonster(56,12220,116,98,3,0,-1)	--联邦伯爵试炼空间门框
	FastID = API_CreateMonster(56,12225,116,98,3,0,-1)	--联邦伯爵试炼空间字体
	FastID = API_CreateMonster(56,12163,116,98,3,0,-1)	--联邦伯爵试炼空间光效
	
	FastID = API_CreateMonster(52,12220,116,90,3,0,-1) --联邦男爵命运之地门框
	FastID = API_CreateMonster(52,12234,116,90,3,0,-1) --联邦男爵命运之地字体
	FastID = API_CreateMonster(52,12197,116,90,3,0,-1) --联邦男爵命运之地光效
	FastID = API_CreateMonster(54,12220,116,90,3,0,-1) --联邦子爵命运之地门框
	FastID = API_CreateMonster(54,12234,116,90,3,0,-1) --联邦子爵命运之地字体
	FastID = API_CreateMonster(54,12197,116,90,3,0,-1) --联邦子爵命运之地光效
	FastID = API_CreateMonster(56,12220,116,90,3,0,-1) --联邦伯爵命运之地门框
	FastID = API_CreateMonster(56,12234,116,90,3,0,-1) --联邦伯爵命运之地字体
	FastID = API_CreateMonster(56,12197,116,90,3,0,-1) --联邦伯爵命运之地光效
	
--	API_CreateMonster(54,12220,124,122,3,0,-1)			--夺旗战争（联邦子爵）门框
--	API_CreateMonster(54,12226,124,122,3,0,-1)			--夺旗战争（联邦子爵）字体
--	API_CreateMonster(54,11890,124,122,3,0,-1)			--夺旗战争（联邦子爵）光效
--	API_CreateMonster(56,12220,124,122,3,0,-1)			--夺旗战争（联邦伯爵）门框
--	API_CreateMonster(56,12226,124,122,3,0,-1)			--夺旗战争（联邦伯爵）字体
--	API_CreateMonster(56,11894,124,122,3,0,-1)			--夺旗战争（联邦伯爵）光效
--	API_CreateMonster(58,12220,124,122,3,0,-1)			--夺旗战争（联邦侯爵）门框
--	API_CreateMonster(58,12226,124,122,3,0,-1)			--夺旗战争（联邦侯爵）字体
--	API_CreateMonster(58,11898,124,122,3,0,-1)			--夺旗战争（联邦侯爵）光效
--	API_CreateMonster(60,12220,124,122,3,0,-1)			--夺旗战争（联邦公爵）门框
--	API_CreateMonster(60,12226,124,122,3,0,-1)			--夺旗战争（联邦公爵）字体
--	API_CreateMonster(60,11902,124,122,3,0,-1)			--夺旗战争（联邦公爵）光效
	
	--API_CreateMonster(52,12220,124,130,3,0,-1)			--强者之路传送阵门框
	--API_CreateMonster(52,12224,124,130,3,0,-1)			--强者之路传送阵字体
	--API_CreateMonster(52,11475,124,130,3,0,-1)			--强者之路传送阵光效
	--API_CreateMonster(53,12220,124,130,3,0,-1)			--强者之路传送阵门框
	--API_CreateMonster(53,12224,124,130,3,0,-1)			--强者之路传送阵字体
	--API_CreateMonster(53,11475,124,130,3,0,-1)			--强者之路传送阵光效
	--API_CreateMonster(54,12220,124,130,3,0,-1)			--强者之路传送阵门框
	--API_CreateMonster(54,12224,124,130,3,0,-1)			--强者之路传送阵字体
	--API_CreateMonster(54,11475,124,130,3,0,-1)			--强者之路传送阵光效
	--API_CreateMonster(55,12220,124,130,3,0,-1)			--强者之路传送阵门框
	--API_CreateMonster(55,12224,124,130,3,0,-1)			--强者之路传送阵字体
	--API_CreateMonster(55,11475,124,130,3,0,-1)			--强者之路传送阵光效
	--API_CreateMonster(56,12220,124,130,3,0,-1)			--强者之路传送阵门框
	--API_CreateMonster(56,12224,124,130,3,0,-1)			--强者之路传送阵字体
	--API_CreateMonster(56,11475,124,130,3,0,-1)			--强者之路传送阵光效
	--API_CreateMonster(57,12220,124,130,3,0,-1)			--强者之路传送阵门框
	--API_CreateMonster(57,12224,124,130,3,0,-1)			--强者之路传送阵字体
	--API_CreateMonster(57,11475,124,130,3,0,-1)			--强者之路传送阵光效
	--API_CreateMonster(58,12220,124,130,3,0,-1)			--强者之路传送阵门框
	--API_CreateMonster(58,12224,124,130,3,0,-1)			--强者之路传送阵字体
	--API_CreateMonster(58,11475,124,130,3,0,-1)			--强者之路传送阵光效
	--API_CreateMonster(59,12220,124,130,3,0,-1)			--强者之路传送阵门框
	--API_CreateMonster(59,12224,124,130,3,0,-1)			--强者之路传送阵字体
	--API_CreateMonster(59,11475,124,130,3,0,-1)			--强者之路传送阵光效
	--API_CreateMonster(60,12220,124,130,3,0,-1)			--强者之路传送阵门框
	--API_CreateMonster(60,12224,124,130,3,0,-1)			--强者之路传送阵字体
	--API_CreateMonster(60,11475,124,130,3,0,-1)			--强者之路传送阵光效
	--API_CreateMonster(61,12220,124,130,3,0,-1)			--强者之路传送阵门框
	--API_CreateMonster(61,12224,124,130,3,0,-1)			--强者之路传送阵字体
	--API_CreateMonster(61,11475,124,130,3,0,-1)			--强者之路传送阵光效
	
	--火山岛npc
	API_CreateMonster(121,12211,170,150,5,0,-1)			--生产供应商人
end
