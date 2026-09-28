----------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\SellShiZhuang.lua
--创建人：  谭明礼
--版  权:	(C)  深圳网域计算机网络有限公司
--描  叙：	云游商人出售时装等
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
--修改人：   黄蕾
--时  间：   2010-7-13
--描  叙：	 购买物品时候增加防沉迷判断
--时  间：   2010-7-19
--描  叙：   七夕活动装备，特殊处理(API_GetRelation(ActorID,0,8) ~= -1 表示已婚的)
--时  间：   2010-8-23
--描  叙：   88944，夏日海滩入场券物品设置购买时间
--时  间：   2010-10-19
--描  叙：   糖果ID：828，万圣节活动期间10月26号至11月4号
--时  间：   2011-09-06
--描  叙：   新增物品（神灯等）限量每天100个(限量;定时新功能)
--时  间：   2011-09-08
--描  叙：   新增物品（神灯等）限量每天100个(新增限时新功能)
--时  间：   2011-09-11
--描  叙：   取消双倍经验卡周末购买的限定。
--时  间：   2011-09-14
--描  叙：   限量购买礼包加风向标
--时  间：   2011-11-17
--描  叙：   新增新增物品（神灯等）周的礼包
--时  间:    20111227
--描  叙 :   增加神龙令牌2012/1/10(12:00停机维护后)-2012/1/31
--时  间:    20111230
--描  叙 :   增加新年时装限时限量销售,-6014交互数据用到167，167用于时间触发器
--时  间:    20120302
--描  叙 :   增加时装设计大赛时装（型男套，淑女套）云游打折限量销售，售价5000点券，每周一三五刷新，每次刷新上限1件。
--           -6014交互数据用到171，170用于时间触发器 175，184,187
----------------------------------------------------------------------------------------------------------------
---6014全局交互数据
--os.execute('date 2011-7-7')
--os.execute('time 23:59:50')
--云游商人ID
TML_YYSR_TeShuShangRenID = 12049

--联邦云游商人TILE坐标
TML_YYSR_LBYYSR_X = 228
TML_YYSR_LBYYSR_Y = 131
--帝国云游商人TILE坐标
TML_YYSR_DGYYSR_X = 258
TML_YYSR_DGYYSR_Y = 105

--联邦云游商人真实世界坐标
TML_YYSR_LBYYSR_RealX = 30
TML_YYSR_LBYYSR_RealY = 198
--帝国云游商人真实世界坐标
TML_YYSR_DGYYSR_RealX = 32
TML_YYSR_DGYYSR_RealY = 226

--销售系数：
TML_YYSR_QiTianHou_XS1 = 0.5	--乖乖女
TML_YYSR_QiTianHou_XS2 = 0.3	--兔宝宝
TML_YYSR_QiTianHou_XS3 = 0.05	--女管家
TML_YYSR_QiTianHou_XS4 = 0.4	--蝙蝠装
TML_YYSR_QiTianHou_XS5 = 0.7	--小李装
TML_YYSR_QiTianHou_XS6 = 0.05	--乖乖男
TML_YYSR_QiTianHou_XS7 = 4		--双倍经验卡
TML_YYSR_QiTianHou_XS8 = 1.7	--紫灵菇
TML_YYSR_QiTianHou_XS9 = 0.4	--紫云菇
TML_YYSR_QiTianHou_XS10 = 10.5	--超级VIP卡
TML_YYSR_QiTianHou_XS11 = 0.05	--能量回复影兽
TML_YYSR_QiTianHou_XS12 = 0.12	--佣兵团徽章
TML_YYSR_QiTianHou_XS13 = 200	--战斗技能经验券
TML_YYSR_QiTianHou_XS14 = 50	--战斗技能水晶币券
TML_YYSR_QiTianHou_XS15 = 0.2	--宠物变身药[A类药]
TML_YYSR_QiTianHou_XS51 = 200	--变身糖果
TML_YYSR_QiTianHou_XS52 = 6		--时装魔法包
TML_YYSR_QiTianHou_XS53 = 6		--神秘之地传送卷
TML_YYSR_QiTianHou_XS54 = 200	--圣诞礼袜
TML_YYSR_QiTianHou_XS55 = 0.2	--永恒之星
TML_YYSR_QiTianHou_XS56 = 0.45	--白金爵士礼帽[礼服]
TML_YYSR_QiTianHou_XS57 = 0.45	--白金爵士礼服[礼服]
TML_YYSR_QiTianHou_XS58 = 0.1	--花冠女王头饰[婚纱]
TML_YYSR_QiTianHou_XS59 = 0.1	--花冠女王婚纱[婚纱]
TML_YYSR_QiTianHou_XS60 = 6	    --夺宝奇兵传送卷轴
TML_YYSR_QiTianHou_XS61 = 6	    --契约魔坛传送卷
TML_YYSR_QiTianHou_XS62 = 6		--月神别苑传送卷
TML_YYSR_QiTianHou_XS63 = 6	    --深寒地宫传送卷
TML_YYSR_QiTianHou_XS64 = 10	--家具系数
TML_YYSR_QiTianHou_XS65 = 20	--神奇的粽子
--技能书系数
TML_YYSR_QiTianHou_XS16 = 0.07
TML_YYSR_QiTianHou_XS17 = 0.07
TML_YYSR_QiTianHou_XS18 = 0.07
TML_YYSR_QiTianHou_XS19 = 0.07
TML_YYSR_QiTianHou_XS20 = 0.12
TML_YYSR_QiTianHou_XS21 = 0.12
TML_YYSR_QiTianHou_XS22 = 0.12
TML_YYSR_QiTianHou_XS23 = 0.12
TML_YYSR_QiTianHou_XS24 = 0.09
TML_YYSR_QiTianHou_XS25 = 0.09
TML_YYSR_QiTianHou_XS26 = 0.09
TML_YYSR_QiTianHou_XS27 = 0.09
TML_YYSR_QiTianHou_XS39 = 0.09	--飞侠1
TML_YYSR_QiTianHou_XS40 = 0.09	--飞侠2
TML_YYSR_QiTianHou_XS41 = 0.09	--飞侠3
TML_YYSR_QiTianHou_XS42 = 0.09	--飞侠4
TML_YYSR_QiTianHou_XS43 = 0.12	--刀锋1
TML_YYSR_QiTianHou_XS44 = 0.12	--刀锋2
TML_YYSR_QiTianHou_XS45 = 0.12	--刀锋3
TML_YYSR_QiTianHou_XS46 = 0.12	--刀锋4
TML_YYSR_QiTianHou_XS47 = 0.07	--黑法1
TML_YYSR_QiTianHou_XS48 = 0.07	--黑法2
TML_YYSR_QiTianHou_XS49 = 0.07	--黑法3
TML_YYSR_QiTianHou_XS50 = 0.07	--黑法4

TML_YYSR_QiTianHou_XS28 = 0.8	--友达啤酒
TML_YYSR_QiTianHou_XS29 = 0.04	--雷霆兽卡
TML_YYSR_QiTianHou_XS30 = 0.2	--节日鸿运帽
TML_YYSR_QiTianHou_XS31 = 0.2	--节日鸿运装
TML_YYSR_QiTianHou_XS32 = 0.6	--节日招财帽
TML_YYSR_QiTianHou_XS33 = 0.6	--节日招财装
TML_YYSR_QiTianHou_XS34 = 0.6	--马戏团高帽（白银男装）
TML_YYSR_QiTianHou_XS35 = 0.6	--马戏团舞服（白银男装）
TML_YYSR_QiTianHou_XS36 = 0.2	--马戏团长耳（白银女装）
TML_YYSR_QiTianHou_XS37 = 0.2	--马戏团舞群（白银女装）
TML_YYSR_QiTianHou_XS38 = 0.2	--宠物变身药丸B类药

TML_YYSR_Switch = 0	--云游商人刷新库存开关
TML_YYSR_YYDJQID = 80818 --云游代金券ID
TML_YYSR_ZheKou = 1 --折扣在这里加
TML_YYSR_JiBenNum = 0
local OwnerID = -4003 --全局交互数据
local Hour = 20
local GameOnlineNum = API_VarDataGetNumber_Ex(1,0,-102,1,Hour)
if GameOnlineNum == 0 then
	GameOnlineNum = API_GetGameOnlineNum()
	TML_YYSR_JiBenNum = math.floor(GameOnlineNum/200)
elseif GameOnlineNum > 0 and GameOnlineNum < 1600 then
	TML_YYSR_JiBenNum = 8
elseif GameOnlineNum >= 1600 then
	TML_YYSR_JiBenNum = math.floor(GameOnlineNum/200)
end

--云游商人货物列表
--Money为点券，Point为云游代金券
--Key值为唯一值当前用1-307-332-334-336-344-352-364-386-388-428
--TeShuShangRen_LBGoods = nil
if TeShuShangRen_LBGoods == nil then
	TeShuShangRen_LBGoods = {
		[1] = {
				{GoodsID=10994,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=171},
				{GoodsID=10995,Money=0,Point=1500,ShuLiang=999,AllNum=0,Key=172},
				{GoodsID=11036,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=1},
				{GoodsID=11037,Money=0,Point=1500,ShuLiang=999,AllNum=0,Key=2},
				{GoodsID=11042,Money=0,Point=4000,ShuLiang=999,AllNum=0,Key=5},
				{GoodsID=11043,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=6},
				{GoodsID=11046,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=3},
				{GoodsID=11047,Money=0,Point=1500,ShuLiang=999,AllNum=0,Key=4},
					},
		[2] = {
				{GoodsID=10986,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=173},
				{GoodsID=10987,Money=0,Point=1500,ShuLiang=999,AllNum=0,Key=174},
				{GoodsID=11026,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=11},
				{GoodsID=11027,Money=0,Point=1500,ShuLiang=999,AllNum=0,Key=12},
				{GoodsID=11028,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=13},
				{GoodsID=11029,Money=0,Point=1500,ShuLiang=999,AllNum=0,Key=14},
				{GoodsID=11034,Money=0,Point=4000,ShuLiang=999,AllNum=0,Key=15},
				{GoodsID=11035,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=16},
					},
		[3] = {
				--{GoodsID=88132,Money=0,Point=900,ShuLiang=999,AllNum=0,Key=175},
				
				{GoodsID=88991,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=333},
				{GoodsID=88065,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=21},
				{GoodsID=902,Money=0,Point=400,ShuLiang=999,AllNum=0,Key=22},
				{GoodsID=80621,Money=0,Point=50,ShuLiang=999,AllNum=0,Key=24},
				{GoodsID=80832,Money=0,Point=15,ShuLiang=999,AllNum=0,Key=27},
				{GoodsID=80833,Money=0,Point=5,ShuLiang=999,AllNum=0,Key=28},
				--{GoodsID=88131,Money=0,Point=900,ShuLiang=999,AllNum=0,Key=29},
				{GoodsID=904,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=23},
				{GoodsID=968,Money=0,Point=200,ShuLiang=999,AllNum=0,Key=26},
				{GoodsID=11045,Money=0,Point=2900,ShuLiang=999,AllNum=0,Key=25},
				{GoodsID=88080,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=7},
				{GoodsID=31014,Money=0,Point=60000,ShuLiang=999,AllNum=0,Key=8},
					},
		[4] = {
				--20120807HUANGLEIZENGJA
				{GoodsID=88920,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=389},
				{GoodsID=88921,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=390},
				{GoodsID=88922,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=391},
				{GoodsID=88923,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=392},
				{GoodsID=88924,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=393},
				{GoodsID=88925,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=394},
				{GoodsID=88926,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=395},
				{GoodsID=88927,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=396},
				{GoodsID=88928,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=397},
				{GoodsID=88929,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=398},
				{GoodsID=88930,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=399},
				{GoodsID=88931,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=400},
				
				--100929新增英雄秘笈
				{GoodsID=88591,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=308},
				{GoodsID=88592,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=309},
				{GoodsID=88593,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=311},
				{GoodsID=88594,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=312},
				{GoodsID=88595,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=313},
				{GoodsID=88596,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=314},
				{GoodsID=88597,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=315},
				{GoodsID=88598,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=316},
				{GoodsID=88599,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=317},
				{GoodsID=88600,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=318},
				{GoodsID=88601,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=319},
				{GoodsID=88602,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=320},
				
				{GoodsID=88113,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=131},
				{GoodsID=88114,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=132},
				{GoodsID=88115,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=133},
				{GoodsID=88116,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=134},
				{GoodsID=88117,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=135},
				{GoodsID=88118,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=136},
				{GoodsID=88119,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=137},
				{GoodsID=88120,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=138},
				{GoodsID=88121,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=139},
				{GoodsID=88122,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=140},
				{GoodsID=88123,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=141},
				{GoodsID=88124,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=142},
				{GoodsID=88101,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=101},
				{GoodsID=88102,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=102},
				{GoodsID=88103,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=103},
				{GoodsID=88104,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=104},
				{GoodsID=88105,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=105},
				{GoodsID=88106,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=106},     
				{GoodsID=88107,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=107},
				{GoodsID=88108,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=108},
				{GoodsID=88109,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=109},
				{GoodsID=88110,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=110},
				{GoodsID=88111,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=111},
				{GoodsID=88112,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=112},
				
				
					},
		[5] = {
				{GoodsID=88589,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=9},
					},
		[6] = {
				{GoodsID=88590,Money=0,Point=500,ShuLiang=999,AllNum=0,Key=10},
					},
		[7] = {
				{GoodsID=88877,Money=0,Point=15,ShuLiang=999,AllNum=999,Key=17},
					},
		[8] = {
				{GoodsID=88909,Money=0,Point=500,ShuLiang=999,AllNum=0,Key=181},
					},
		[9] = {
				--{GoodsID=88916,Money=500,Point=0,ShuLiang=999,AllNum=0,Key=183},
				--{GoodsID=88917,Money=300,Point=0,ShuLiang=999,AllNum=0,Key=184},
				{GoodsID=88918,Money=0,Point=500,ShuLiang=999,AllNum=0,Key=185},
					},
		[10] = {
				{GoodsID=38078,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=190},
				{GoodsID=38079,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=191},
				{GoodsID=38080,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=192},
				{GoodsID=38081,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=193},
				{GoodsID=38082,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=194},
				{GoodsID=38083,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=195},
				{GoodsID=38084,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=196},
				{GoodsID=38085,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=197},
				{GoodsID=38034,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=198},
				{GoodsID=38035,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=199},
				{GoodsID=38036,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=200},
				{GoodsID=38037,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=201},
				{GoodsID=38038,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=202},
				{GoodsID=38039,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=203},
				{GoodsID=38040,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=204},
				{GoodsID=38041,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=205},
				{GoodsID=38042,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=206},
				{GoodsID=38043,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=207},
					},
		[12] = {
				--{GoodsID=88944,Money=0,Point=500,ShuLiang=999,AllNum=0,Key=228},--夏日海滩入场券
				  --{GoodsID=828,Money=0,Point=10,ShuLiang=999,AllNum=999,Key=228},--万圣节糖果
				  --{GoodsID=88606,Money=0,Point=5,ShuLiang=999,AllNum=999,Key=228},--万圣节糖果
					{GoodsID=89065,Money=0,Point=30,ShuLiang=999,AllNum=999,Key=353},--周年宝箱
					{GoodsID=89131,Money=0,Point=50,ShuLiang=999,AllNum=999,Key=354},--神龙令牌
					{GoodsID=89170,Money=0,Point=15,ShuLiang=999,AllNum=999,Key=355},--端午节宝箱
					{GoodsID=88910,Money=0,Point=10,ShuLiang=999,AllNum=999,Key=356},--符文卷轴
					{GoodsID=89194,Money=0,Point=1000,ShuLiang=999,AllNum=999,Key=357},--神灯
					{GoodsID=88606,Money=0,Point=9,ShuLiang=999,AllNum=999,Key=358},--圣诞礼袜
					
					},
		[13] = {
				
				{GoodsID=11303,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=413},--花冠女王头饰[七夕纪念时装](3档)
				{GoodsID=11304,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=414},--花冠女王婚纱[七夕纪念时装](3档)
				{GoodsID=11305,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=415},--贵族礼帽[七夕纪念时装](3档)
				{GoodsID=11306,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=416},--高贵戎装[七夕纪念时装](3档)
				
				{GoodsID=11289,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=300},--天鹅湖公主头冠[七夕时装](3档)
				{GoodsID=11290,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=301},--天鹅湖公主[七夕时装](3档)
				{GoodsID=11285,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=337},--法兰绒绅士礼帽[七夕时装](3档)
				{GoodsID=11286,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=338},--法兰绒绅士[七夕时装](3档)
				
					},
		[14] = {
				{GoodsID=11303,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=417},--花冠女王头饰[七夕纪念时装](3档)
				{GoodsID=11304,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=418},--花冠女王婚纱[七夕纪念时装](3档)
				{GoodsID=11305,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=419},--贵族礼帽[七夕纪念时装](3档)
				{GoodsID=11306,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=420},--高贵戎装[七夕纪念时装](3档)
				
				{GoodsID=11285,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=302},--法兰绒绅士礼帽[七夕时装](3档)
				{GoodsID=11286,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=303},--法兰绒绅士[七夕时装](3档)
				{GoodsID=11289,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=339},--天鹅湖公主头冠[七夕时装](3档)
				{GoodsID=11290,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=340},--天鹅湖公主[七夕时装](3档)
				
					},
		[15] = {
				--{GoodsID=88943,Money=0,Point=20,ShuLiang=999,AllNum=0,Key=335},--89131
				--{GoodsID=89065,Money=0,Point=30,ShuLiang=999,AllNum=999,Key=335},--周年庆宝箱
				--{GoodsID=89131,Money=0,Point=50,ShuLiang=999,AllNum=999,Key=335},--神龙令
				 -- {GoodsID=89170,Money=0,Point=15,ShuLiang=999,AllNum=999,Key=335},--端午节宝箱
				-- {GoodsID=88944,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=228},--夏日海滩入场券
				 {GoodsID=89194,Money=0,Point=1000,ShuLiang=999,AllNum=999,Key=228},--神灯
					},
		[16] = {
				{GoodsID=11548,Money=0,Point=3000,ShuLiang=999,AllNum=999,Key=429},--雨林精灵头饰（女）
				{GoodsID=11549,Money=0,Point=7000,ShuLiang=999,AllNum=999,Key=430},--雨林精灵外套（女）
				{GoodsID=11550,Money=0,Point=7000,ShuLiang=999,AllNum=999,Key=431},--雨林动感外套（男）
				{GoodsID=11595,Money=0,Point=3000,ShuLiang=999,AllNum=999,Key=432},--雨林精灵帽（男）

					},
		[17] = {
				{GoodsID=88589,Money=0,Point=100,ShuLiang=999,AllNum=999,Key=175},
					},
	}
end
--TeShuShangRen_DGGoods = nil
if TeShuShangRen_DGGoods == nil then
	TeShuShangRen_DGGoods = {
		[1] = {
				{GoodsID=10994,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=176},
				{GoodsID=10995,Money=0,Point=1500,ShuLiang=999,AllNum=0,Key=177},
				{GoodsID=11036,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=31},
				{GoodsID=11037,Money=0,Point=1500,ShuLiang=999,AllNum=0,Key=32},
				{GoodsID=11042,Money=0,Point=4000,ShuLiang=999,AllNum=0,Key=35},
				{GoodsID=11043,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=36},
				{GoodsID=11046,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=33},
				{GoodsID=11047,Money=0,Point=1500,ShuLiang=999,AllNum=0,Key=34},
					},
		[2] = {
				{GoodsID=10986,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=178},
				{GoodsID=10987,Money=0,Point=1500,ShuLiang=999,AllNum=0,Key=179},
				{GoodsID=11026,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=41},
				{GoodsID=11027,Money=0,Point=1500,ShuLiang=999,AllNum=0,Key=42},
				{GoodsID=11028,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=43},
				{GoodsID=11029,Money=0,Point=1500,ShuLiang=999,AllNum=0,Key=44},
				{GoodsID=11034,Money=0,Point=4000,ShuLiang=999,AllNum=0,Key=45},
				{GoodsID=11035,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=46},
					},
		[3] = {
				--{GoodsID=88132,Money=0,Point=900,ShuLiang=999,AllNum=0,Key=180},
				
				{GoodsID=88991,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=334},
				{GoodsID=88065,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=51},
				{GoodsID=902,Money=0,Point=400,ShuLiang=999,AllNum=0,Key=52},
				{GoodsID=80621,Money=0,Point=50,ShuLiang=999,AllNum=0,Key=54},
				{GoodsID=80832,Money=0,Point=15,ShuLiang=999,AllNum=0,Key=57},
				{GoodsID=80833,Money=0,Point=5,ShuLiang=999,AllNum=0,Key=58},
				--{GoodsID=88131,Money=0,Point=900,ShuLiang=999,AllNum=0,Key=59},
				{GoodsID=904,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=53},
				{GoodsID=968,Money=0,Point=200,ShuLiang=999,AllNum=0,Key=56},
				{GoodsID=11045,Money=0,Point=2900,ShuLiang=999,AllNum=0,Key=55},
				{GoodsID=88080,Money=0,Point=1000,ShuLiang=999,AllNum=0,Key=37},
				{GoodsID=31014,Money=0,Point=60000,ShuLiang=999,AllNum=0,Key=38},
					},
		[4] = {
				--20120807HUANGLEIZENGJA
				{GoodsID=88920,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=401},
				{GoodsID=88921,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=402},
				{GoodsID=88922,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=403},
				{GoodsID=88923,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=404},
				{GoodsID=88924,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=405},
				{GoodsID=88925,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=406},
				{GoodsID=88926,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=407},
				{GoodsID=88927,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=408},
				{GoodsID=88928,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=409},
				{GoodsID=88929,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=410},
				{GoodsID=88930,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=411},
				{GoodsID=88931,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=412},
				--100929新增英雄秘笈
				{GoodsID=88591,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=321},
				{GoodsID=88592,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=322},
				{GoodsID=88593,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=323},
				{GoodsID=88594,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=324},
				{GoodsID=88595,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=325},
				{GoodsID=88596,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=326},
				{GoodsID=88597,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=327},
				{GoodsID=88598,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=328},
				{GoodsID=88599,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=329},
				{GoodsID=88600,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=330},
				{GoodsID=88601,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=331},
				{GoodsID=88602,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=332},
				
				{GoodsID=88113,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=143},
				{GoodsID=88114,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=144},
				{GoodsID=88115,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=145},
				{GoodsID=88116,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=146},
				{GoodsID=88117,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=147},
				{GoodsID=88118,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=148},
				{GoodsID=88119,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=149},
				{GoodsID=88120,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=150},
				{GoodsID=88121,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=151},
				{GoodsID=88122,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=152},
				{GoodsID=88123,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=153},
				{GoodsID=88124,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=154},
				{GoodsID=88101,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=113},
				{GoodsID=88102,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=114},
				{GoodsID=88103,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=115},
				{GoodsID=88104,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=116},
				{GoodsID=88105,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=117},
				{GoodsID=88106,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=118},
				{GoodsID=88107,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=119},
				{GoodsID=88108,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=120},
				{GoodsID=88109,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=121},
				{GoodsID=88110,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=122},
				{GoodsID=88111,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=123},
				{GoodsID=88112,Money=0,Point=1250,ShuLiang=999,AllNum=0,Key=124},
				
				
				
					},
		[5] = {
				{GoodsID=88589,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=39},
					},
		[6] = {
				{GoodsID=88590,Money=0,Point=500,ShuLiang=999,AllNum=0,Key=20},
					},
		[7] = {
				{GoodsID=88877,Money=0,Point=15,ShuLiang=999,AllNum=999,Key=47},
					},
		[8] = {
				{GoodsID=88909,Money=0,Point=500,ShuLiang=999,AllNum=0,Key=182},
					},
		[9] = {
				--{GoodsID=88916,Money=500,Point=0,ShuLiang=999,AllNum=0,Key=186},
				--{GoodsID=88917,Money=300,Point=0,ShuLiang=999,AllNum=0,Key=187},
				{GoodsID=88918,Money=0,Point=500,ShuLiang=999,AllNum=0,Key=188},
					},
		[10] = {
				{GoodsID=38078,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=208},
				{GoodsID=38079,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=209},
				{GoodsID=38080,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=210},
				{GoodsID=38081,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=211},
				{GoodsID=38082,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=212},
				{GoodsID=38083,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=213},
				{GoodsID=38084,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=214},
				{GoodsID=38085,Money=0,Point=100,ShuLiang=999,AllNum=0,Key=215},
				{GoodsID=38034,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=216},
				{GoodsID=38035,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=217},
				{GoodsID=38036,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=218},
				{GoodsID=38037,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=219},
				{GoodsID=38038,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=220},
				{GoodsID=38039,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=221},
				{GoodsID=38040,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=222},
				{GoodsID=38041,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=223},
				{GoodsID=38042,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=224},
				{GoodsID=38043,Money=0,Point=180,ShuLiang=999,AllNum=0,Key=225},
					},
		[12] = {
				--{GoodsID=88944,Money=0,Point=500,ShuLiang=999,AllNum=0,Key=229},
				--{GoodsID=828,Money=0,Point=10,ShuLiang=999,AllNum=999,Key=229},--万圣节糖果
				--{GoodsID=88606,Money=0,Point=5,ShuLiang=999,AllNum=999,Key=229},--万圣节糖果
				{GoodsID=89065,Money=0,Point=20,ShuLiang=999,AllNum=999,Key=359},--周年宝箱
				{GoodsID=89131,Money=0,Point=20,ShuLiang=999,AllNum=999,Key=360},--神龙令牌
				{GoodsID=89170,Money=0,Point=50,ShuLiang=999,AllNum=999,Key=361},--端午节宝箱
				{GoodsID=88910,Money=0,Point=10,ShuLiang=999,AllNum=999,Key=362},--符文卷轴
				{GoodsID=89194,Money=0,Point=1000,ShuLiang=999,AllNum=999,Key=363},--神灯
				{GoodsID=88606,Money=0,Point=9,ShuLiang=999,AllNum=999,Key=364},--圣诞礼袜
				
					
					},
		[13] = {
				{GoodsID=11303,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=421},--花冠女王头饰[七夕纪念时装](3档)
				{GoodsID=11304,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=422},--花冠女王婚纱[七夕纪念时装](3档)
				{GoodsID=11305,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=423},--贵族礼帽[七夕纪念时装](3档)
				{GoodsID=11306,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=424},--高贵戎装[七夕纪念时装](3档)
				
				{GoodsID=11289,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=304},
				{GoodsID=11290,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=305},
				{GoodsID=11285,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=341},
				{GoodsID=11286,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=342},
					},
		[14] = {
				
				{GoodsID=11303,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=425},--花冠女王头饰[七夕纪念时装](3档)
				{GoodsID=11304,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=426},--花冠女王婚纱[七夕纪念时装](3档)
				{GoodsID=11305,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=427},--贵族礼帽[七夕纪念时装](3档)
				{GoodsID=11306,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=428},--高贵戎装[七夕纪念时装](3档)
				
				{GoodsID=11285,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=306},
				{GoodsID=11286,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=307},
				{GoodsID=11289,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=343},
				{GoodsID=11290,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=344},
				
					},
				
		[15] = {
				--{GoodsID=88943,Money=0,Point=20,ShuLiang=999,AllNum=0,Key=336},
				--{GoodsID=89065,Money=0,Point=30,ShuLiang=999,AllNum=999,Key=336},
				--{GoodsID=89131,Money=0,Point=50,ShuLiang=999,AllNum=999,Key=336},--神龙令
				--{GoodsID=89170,Money=0,Point=15,ShuLiang=999,AllNum=999,Key=336},--端午节宝箱
				 --{GoodsID=88944,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=229},
				 {GoodsID=89194,Money=0,Point=1000,ShuLiang=999,AllNum=999,Key=229},--神灯
					},
		[16] = {
				{GoodsID=11548,Money=0,Point=3000,ShuLiang=999,AllNum=999,Key=433},--雨林精灵头饰（女）
				{GoodsID=11549,Money=0,Point=7000,ShuLiang=999,AllNum=999,Key=434},--雨林精灵外套（女）
				{GoodsID=11550,Money=0,Point=7000,ShuLiang=999,AllNum=999,Key=435},--雨林动感外套（男）
				{GoodsID=11595,Money=0,Point=3000,ShuLiang=999,AllNum=999,Key=436},--雨林精灵帽（男）
				

					},
		[17] = {
				{GoodsID=88589,Money=0,Point=100,ShuLiang=999,AllNum=999,Key=180},
					},
	}
end

----------------------------------------------------------------------------------------------------------------
--每日限量购买表Data==9存YMD
HL_LBGoodsList = nil
if HL_LBGoodsList == nil then
	HL_LBGoodsList = {
		[1] = {
				--{GoodsID=89066,Money=0,Point=5000,ShuLiang=100,AllNum=100,Key=345,Data=1,Max=100},--宠物速成宝箱
				--{GoodsID=89067,Money=0,Point=5000,ShuLiang=100,AllNum=100,Key=346,Data=2,Max=100},--PK补给宝箱
				--{GoodsID=89068,Money=0,Point=5000,ShuLiang=100,AllNum=100,Key=347,Data=3,Max=100},--拉锯补给宝箱
				--{GoodsID=89069,Money=0,Point=5000,ShuLiang=100,AllNum=100,Key=348,Data=4,Max=100},--续时补给宝箱
				{GoodsID=11289,Money=0,Point=500,ShuLiang=3,AllNum=3,Key=365,Data=1,Max=3},--天鹅湖公主头冠[七夕时装](3档)
				{GoodsID=11290,Money=0,Point=40000,ShuLiang=3,AllNum=3,Key=366,Data=2,Max=3},--天鹅湖公主[七夕时装](3档)
				{GoodsID=11285,Money=0,Point=500,ShuLiang=3,AllNum=3,Key=367,Data=3,Max=3},--法兰绒绅士礼帽[七夕时装](3档)
				{GoodsID=11286,Money=0,Point=40000,ShuLiang=3,AllNum=3,Key=368,Data=4,Max=3},--法兰绒绅士[七夕时装](3档)
				{GoodsID=11521,Money=0,Point=500,ShuLiang=3,AllNum=3,Key=369,Data=5,Max=3},--美护士布帽[黄金女装](3档)
				{GoodsID=11522,Money=0,Point=40000,ShuLiang=3,AllNum=3,Key=370,Data=6,Max=3},--美护士制服[黄金女装](3档)
				{GoodsID=10911,Money=0,Point=500,ShuLiang=3,AllNum=3,Key=371,Data=7,Max=3},--女管家纱巾[黄金女装](3档)
				{GoodsID=10912,Money=0,Point=40000,ShuLiang=3,AllNum=3,Key=372,Data=8,Max=3},--女管家之梦[黄金女装](3档)
				{GoodsID=10948,Money=0,Point=500,ShuLiang=3,AllNum=3,Key=373,Data=9,Max=3},--魔街男耳机[黄金男装](3档)
				{GoodsID=10949,Money=0,Point=40000,ShuLiang=3,AllNum=3,Key=374,Data=10,Max=3},--魔街男休闲装[黄金男装](3档)
				{GoodsID=11313,Money=0,Point=500,ShuLiang=3,AllNum=3,Key=375,Data=11,Max=3},--巫女头饰[万圣节纪念时装](3档)
				{GoodsID=11314,Money=0,Point=40000,ShuLiang=3,AllNum=3,Key=376,Data=12,Max=3},--万圣节巫女[万圣节纪念时装](3档)
				{GoodsID=11315,Money=0,Point=500,ShuLiang=3,AllNum=3,Key=377,Data=13,Max=3},--爵士礼帽[万圣节纪念时装](3档)
				{GoodsID=11316,Money=0,Point=40000,ShuLiang=3,AllNum=3,Key=378,Data=14,Max=3},--万圣节爵士[万圣节纪念时装](3档)
				{GoodsID=11330,Money=0,Point=500,ShuLiang=3,AllNum=3,Key=379,Data=15,Max=3},--兔乖乖头饰（女装）
				{GoodsID=11331,Money=0,Point=40000,ShuLiang=3,AllNum=3,Key=380,Data=16,Max=3},--福兔新年装（女装）
				{GoodsID=11332,Money=0,Point=500,ShuLiang=3,AllNum=3,Key=381,Data=17,Max=3},--兔儿爷棉帽（男装）
				{GoodsID=11333,Money=0,Point=40000,ShuLiang=3,AllNum=3,Key=382,Data=18,Max=3},--福兔新年装（男装）
				{GoodsID=11334,Money=0,Point=18888,ShuLiang=3,AllNum=3,Key=383,Data=19,Max=3},--兔神披风
				{GoodsID=11317,Money=0,Point=18888,ShuLiang=3,AllNum=3,Key=384,Data=20,Max=3},--死神背饰[万圣节纪念]
				{GoodsID=11112,Money=0,Point=28888,ShuLiang=3,AllNum=3,Key=385,Data=21,Max=3},--永恒之心
				{GoodsID=11278,Money=0,Point=28888,ShuLiang=3,AllNum=3,Key=386,Data=22,Max=3},--海洋之心
				
				
			},
		[2] = {
				
				{GoodsID=10898,Money=0,Point=3000,ShuLiang=1,AllNum=1,Key=385,Data=151,Max=1},--乖乖女之帽[白银女装](3档
				{GoodsID=10899,Money=0,Point=5000,ShuLiang=1,AllNum=1,Key=386,Data=152,Max=1},--乖乖女之恋[白银女装](3档
				{GoodsID=10943,Money=0,Point=3000,ShuLiang=1,AllNum=1,Key=386,Data=153,Max=1},--小李功夫装[白银男装](3档
				{GoodsID=10942,Money=0,Point=5000,ShuLiang=1,AllNum=1,Key=386,Data=154,Max=1},--歌唱家飞机头[白银男装](3档
				{GoodsID=10900,Money=0,Point=3000,ShuLiang=1,AllNum=1,Key=386,Data=155,Max=1},--小蜜蜂花带[白银女装](3档
				{GoodsID=10901,Money=0,Point=5000,ShuLiang=1,AllNum=1,Key=386,Data=156,Max=1},--小蜜蜂之舞[白银女装](3档
				{GoodsID=10944,Money=0,Point=3000,ShuLiang=1,AllNum=1,Key=386,Data=157,Max=1},--歌唱家飞机头[白银男装](3档
				{GoodsID=10945,Money=0,Point=5000,ShuLiang=1,AllNum=1,Key=386,Data=158,Max=1},--歌唱家舞台装[白银男装](3档
				{GoodsID=11052,Money=0,Point=3000,ShuLiang=1,AllNum=1,Key=386,Data=159,Max=1},--红蘑菇顶冠[白银女装](3档
				{GoodsID=11053,Money=0,Point=5000,ShuLiang=1,AllNum=1,Key=386,Data=160,Max=1},--红蘑菇外衣[白银女装](3档
				{GoodsID=11058,Money=0,Point=3000,ShuLiang=1,AllNum=1,Key=386,Data=161,Max=1},--红蘑菇头冠[白银男装](3档
				{GoodsID=11059,Money=0,Point=5000,ShuLiang=1,AllNum=1,Key=386,Data=162,Max=1},--红蘑菇外套[白银男装](3档
				{GoodsID=11066,Money=0,Point=3000,ShuLiang=1,AllNum=1,Key=386,Data=163,Max=1},--猫女面罩[白银女装](3档
				{GoodsID=11067,Money=0,Point=5000,ShuLiang=1,AllNum=1,Key=386,Data=164,Max=1},--猫女外套[白银女装](3档
				{GoodsID=11062,Money=0,Point=3000,ShuLiang=1,AllNum=1,Key=386,Data=165,Max=1},--动感男孩眼镜[白银男装](3档
				{GoodsID=11063,Money=0,Point=5000,ShuLiang=1,AllNum=1,Key=386,Data=166,Max=1},--动感男孩外套[白银男装](3档
				
				
			},
		[3] = {
				
				{GoodsID=11531,Money=0,Point=10000,ShuLiang=2,AllNum=2,Key=387,Data=168,Max=2},--龙女吉
				{GoodsID=11532,Money=0,Point=500,ShuLiang=2,AllNum=2,Key=388,Data=171,Max=2},--龙女装
				{GoodsID=11533,Money=0,Point=100,ShuLiang=2,AllNum=2,Key=389,Data=172,Max=2},--龙女批
				{GoodsID=11534,Money=0,Point=10000,ShuLiang=2,AllNum=2,Key=390,Data=173,Max=2},--男龙记
				{GoodsID=11535,Money=0,Point=500,ShuLiang=2,AllNum=2,Key=391,Data=174,Max=2},--男龙装
				{GoodsID=11536,Money=0,Point=100,ShuLiang=2,AllNum=2,Key=392,Data=175,Max=2},--男龙皮
				
				--{GoodsID=11548,Money=0,Point=3000,ShuLiang=999,AllNum=999,Key=387,Data=168,Max=1},--雨林精灵头饰（女）
				--{GoodsID=11549,Money=0,Point=7000,ShuLiang=999,AllNum=999,Key=388,Data=171,Max=1},--雨林精灵外套（女）
				--{GoodsID=11550,Money=0,Point=7000,ShuLiang=999,AllNum=999,Key=389,Data=172,Max=1},--雨林动感外套（男）
				--{GoodsID=11595,Money=0,Point=3000,ShuLiang=999,AllNum=999,Key=390,Data=173,Max=1},--雨林精灵帽（男）
				--{GoodsID=11545,Money=0,Point=5000,ShuLiang=1,AllNum=1,Key=387,Data=168,Max=1},--型男装
				--{GoodsID=11544,Money=0,Point=5000,ShuLiang=1,AllNum=1,Key=388,Data=171,Max=1},--淑女装
				--{GoodsID=11313,Money=0,Point=100,ShuLiang=1,AllNum=1,Key=389,Data=172,Max=1},--巫女头饰[万圣节纪念时装](3档)
				--{GoodsID=11314,Money=0,Point=10000,ShuLiang=1,AllNum=1,Key=390,Data=173,Max=1},--万圣节巫女[万圣节纪念时装](3档)
				--{GoodsID=11315,Money=0,Point=100,ShuLiang=1,AllNum=1,Key=391,Data=174,Max=1},--爵士礼帽[万圣节纪念时装](3档)
				--{GoodsID=11316,Money=0,Point=10000,ShuLiang=1,AllNum=1,Key=392,Data=175,Max=1},--万圣节爵士[万圣节纪念时装](3档)
				
				--{GoodsID=11537,Money=0,Point=100,ShuLiang=2,AllNum=2,Key=399,Data=184,Max=2},--狂野牛仔帽（黄金男）
				--{GoodsID=11538,Money=0,Point=12000,ShuLiang=2,AllNum=2,Key=400,Data=185,Max=2},--狂野牛仔服（黄金男）
				--{GoodsID=11539,Money=0,Point=100,ShuLiang=2,AllNum=2,Key=401,Data=186,Max=2},--狂野牛仔帽（黄金女）
				--{GoodsID=11540,Money=0,Point=12000,ShuLiang=2,AllNum=2,Key=402,Data=187,Max=2},--狂野牛仔服（黄金女）
				
				--{GoodsID=11289,Money=0,Point=10000,ShuLiang=1,AllNum=1,Key=365,Data=188,Max=1},--天鹅湖公主头冠[七夕时装](3档)
				--{GoodsID=11290,Money=0,Point=500,ShuLiang=1,AllNum=1,Key=366,Data=189,Max=1},--天鹅湖公主[七夕时装](3档)
				--{GoodsID=11285,Money=0,Point=10000,ShuLiang=1,AllNum=1,Key=367,Data=190,Max=1},--法兰绒绅士礼帽[七夕时装](3档)
				--{GoodsID=11286,Money=0,Point=500,ShuLiang=1,AllNum=1,Key=368,Data=191,Max=1},--法兰绒绅士[七夕时装](3档)
				--{GoodsID=11313,Money=0,Point=10000,ShuLiang=1,AllNum=1,Key=375,Data=192,Max=1},--巫女头饰[万圣节纪念时装](3档)
				--{GoodsID=11314,Money=0,Point=500,ShuLiang=1,AllNum=1,Key=376,Data=193,Max=1},--万圣节巫女[万圣节纪念时装](3档)
				--{GoodsID=11315,Money=0,Point=10000,ShuLiang=1,AllNum=1,Key=377,Data=194,Max=1},--爵士礼帽[万圣节纪念时装](3档)
				--{GoodsID=11316,Money=0,Point=500,ShuLiang=1,AllNum=1,Key=378,Data=195,Max=1},--万圣节爵士[万圣节纪念时装](3档)
				--{GoodsID=11108,Money=0,Point=10000,ShuLiang=1,AllNum=1,Key=365,Data=208,Max=1},--翎羽头带[黄金女装](3档)
				--{GoodsID=11109,Money=0,Point=500,ShuLiang=1,AllNum=1,Key=366,Data=209,Max=1},--魅惑天使装[黄金女装](3档)
				--{GoodsID=11110,Money=0,Point=10000,ShuLiang=1,AllNum=1,Key=367,Data=210,Max=1},--贵族礼帽[黄金男装](3档)
				--{GoodsID=11111,Money=0,Point=500,ShuLiang=1,AllNum=1,Key=368,Data=211,Max=1},--高贵戎装[黄金男装](3档)
				
				
				
				
			},
		[4] = {
				
				{GoodsID=89154,Money=0,Point=5000,ShuLiang=5,AllNum=5,Key=393,Data=176,Max=5},--武器降级棒[二档]
				{GoodsID=89155,Money=0,Point=3000,ShuLiang=5,AllNum=5,Key=394,Data=177,Max=5},--防具降级棒[二档]
				{GoodsID=89156,Money=0,Point=7500,ShuLiang=5,AllNum=5,Key=395,Data=178,Max=5},--武器降级棒[三档]念时装](3档)
				{GoodsID=89157,Money=0,Point=4500,ShuLiang=5,AllNum=5,Key=396,Data=179,Max=5},--防具降级棒[三档]
				{GoodsID=89158,Money=0,Point=10000,ShuLiang=5,AllNum=5,Key=397,Data=180,Max=5},--武器降级棒[四档]
				{GoodsID=89159,Money=0,Point=6000,ShuLiang=5,AllNum=5,Key=398,Data=181,Max=5},--防具降级棒[四档]
				
			},
		[5] = {
				
				--{GoodsID=89112,Money=0,Point=2500,ShuLiang=5,AllNum=5,Key=399,Data=196,Max=5},--洗点十字章包
				--{GoodsID=89113,Money=0,Point=5000,ShuLiang=5,AllNum=5,Key=400,Data=197,Max=5},--洗点十字章包(100个)
				--{GoodsID=89114,Money=0,Point=2500,ShuLiang=5,AllNum=5,Key=401,Data=198,Max=5},--宠物技能重置玩偶包(50个)
				--{GoodsID=89115,Money=0,Point=5000,ShuLiang=5,AllNum=5,Key=402,Data=199,Max=5},--宠物技能重置玩偶包(100个)
				--{GoodsID=89116,Money=0,Point=500 ,ShuLiang=5,AllNum=5,Key=403,Data=200,Max=5},--洗点十字章包(10个)
				--{GoodsID=89117,Money=0,Point=500 ,ShuLiang=5,AllNum=5,Key=404,Data=201,Max=5},--宠物技能重置玩偶10个
				{GoodsID=89065,Money=0,Point=20,ShuLiang=5,AllNum=5,Key=359,Data=202,Max=5},--周年宝箱
				{GoodsID=89131,Money=0,Point=20,ShuLiang=5,AllNum=5,Key=360,Data=203,Max=5},--神龙令牌
				{GoodsID=89170,Money=0,Point=50,ShuLiang=5,AllNum=5,Key=361,Data=204,Max=5},--端午节宝箱
				{GoodsID=88910,Money=0,Point=10 ,ShuLiang=5,AllNum=5,Key=362,Data=205,Max=5},--符文卷轴
				{GoodsID=89194,Money=0,Point=1000 ,ShuLiang=5,AllNum=5,Key=363,Data=206,Max=5},--神灯
				{GoodsID=88606,Money=0,Point=9 ,ShuLiang=5,AllNum=5,Key=364,Data=207,Max=5},--圣诞礼袜
				
			},
		
		
	}
end





---------------------------
if TeShuShangRen_ActTime == nil then
	TeShuShangRen_ActTime = {
				[1] = {ReadyHour=14,ReadyMinute=30,StartHour=15,StartMinute=0,EndHour=16,EndMinute=0},
				[2] = {ReadyHour=19,ReadyMinute=0,StartHour=19,StartMinute=30,EndHour=20,EndMinute=30},
	}
end

if API_GetServerID() == 1 then
	if YYSR_LBYYSR ~= nil then
		if API_GetMonsterID(YYSR_LBYYSR) > 0 then
			API_DestroyMonster(YYSR_LBYYSR)
		end
	end
	YYSR_LBYYSR = API_CreateMonsterEx(2,TML_YYSR_TeShuShangRenID,TML_YYSR_LBYYSR_X,TML_YYSR_LBYYSR_Y,4,0,-1,1);
	if YYSR_DGYYSR ~= nil then
		if API_GetMonsterID(YYSR_DGYYSR) > 0 then
			API_DestroyMonster(YYSR_DGYYSR)
		end
	end
	YYSR_DGYYSR = API_CreateMonsterEx(1,TML_YYSR_TeShuShangRenID,TML_YYSR_DGYYSR_X,TML_YYSR_DGYYSR_Y,4,0,-1,1)
end

if API_GetServerID() == 1 or API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 6 or API_GetServerID() == 7 or API_GetServerID() == 8 or API_GetServerID() == 9 or API_GetServerID() == 10 then
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Second == 0 then
		if TSSR_CFQ ~= nil then
			API_DestroyTriggerG(TSSR_CFQ)
		end
		TSSR_CFQ = API_CreateTimerTriggerG(0,0,60,-1,'TSSR_TimerTriggerGCallFunc')
	else
		local Time = 60 - Second
		API_CreateTimerTriggerG(0,0,Time,1,'TSSR_TimerTriggerGCallFunc2')
	end
	---------------------------------------------------------------------------------------------------------
	--创建时间触发器，清除全局交互数据函数
	if API_GetServerID() == 1 then
		API_CreateTimerTriggerG(0,0,120,-1,'Meiriyunyou_ShuJuQingChu')
	end
end

function TSSR_TimerTriggerGCallFunc2(a,b)
	if TSSR_CFQ ~= nil then
		API_DestroyTriggerG(TSSR_CFQ)
	end
	TSSR_CFQ = API_CreateTimerTriggerG(0,0,60,-1,'TSSR_TimerTriggerGCallFunc')
end

--(nType)1：首次登录，2：切换场景服，3：小退
function TSSR_OnLogin(ActorID)
	local ActorLV = API_GetActorExpLevel(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if API_VarDataGetNumber(ActorID,1,9901) > 0 then	--判断玩家不是在新手任务
		if API_GetActorLuckyKilled(ActorID) > 0 then --判断玩家的幸运怪数量是否大于0
			API_ActorAddStatus(ActorID,1018001,0)
		end
		local OpenTian,OpenMiao = PublicFun_GetServerOpenDay()
		local nType = API_VarDataGetNumber(ActorID, 0, 18368)
		local StartHour1 = TeShuShangRen_ActTime[1].StartHour
		local EndHour1 = TeShuShangRen_ActTime[1].EndHour
		local StartHour2 = TeShuShangRen_ActTime[2].StartHour
		local StartMinute2 = TeShuShangRen_ActTime[2].StartMinute
		local EndHour2 = TeShuShangRen_ActTime[2].EndHour
		local EndMinute2 = TeShuShangRen_ActTime[2].EndMinute
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		if OpenTian > 2 then
			if nType == 1 then
				if Year == 2010 and Month == 11 and Day >= 25 and Day <= 28 then
					API_ActorMsgBoard(ActorID,0,0,'诚挚邀请您参与《英雄岛》座谈会，亲临腾讯大厦，与开发人员面对面、零距离沟通，丰厚好礼全心为您，详情请登录官网了解！')
				end
				if Week == 3 or Week == 5 or Week == 6 or Week == 7 then
					if ActorLV >= 15 then
						if MapID == StaticMapID then
							if not API_IsBattleGameServer() then
								API_ActorSendMsg(ActorID,17,'云游商人会在今天的15:00和19:30进货时装')
								API_ActorSendMsg(ActorID,1,'云游商人会在今天的15:00和19:30进货时装')
								API_ActorSendMsg(ActorID,7,'云游商人会在今天的15:00和19:30进货时装')
							end
						end
					end
				end
			end
			if MapID == StaticMapID then
				if Hour >= StartHour1 and Hour < EndHour1 then
					if not API_IsBattleGameServer() then
						API_RemoveTaskScroll(ActorID,60002)--删除卷轴
						LRY_UItwinkemanage(ActorID,11,85,104109,60002,41,'TSSR_DuiHua')--加卷轴
					end
				elseif (Hour == StartHour2 and Minute >= StartMinute2 and Minute <= 59) or (Hour == EndHour2 and Minute >= 0 and Minute < EndMinute2) then
					if not API_IsBattleGameServer() then
						API_RemoveTaskScroll(ActorID,60002)--删除卷轴
						--API_AddTaskScrollEx(ActorID,60002,104109,'TSSR_DuiHua',1)--加卷轴
						LRY_UItwinkemanage(ActorID,11,85,104109,60002,41,'TSSR_DuiHua')--加卷轴
					end
				end
			else
				API_RemoveTaskScroll(ActorID,60002)--删除卷轴
			end
		end	
	end
end

function TSSR_OnLogout(ActorID)
	local nType = API_VarDataGetNumber(ActorID, 0, 18368)
	if nType == 3 then
		API_RemoveTaskScroll(ActorID,60002)--删除卷轴
	end
end

function TSSR_OnLoginMap(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if API_VarDataGetNumber(ActorID,1,9901) > 0 then
		if API_GetActorLuckyKilled(ActorID) > 0 then --判断玩家的幸运怪数量是否大于0
			API_ActorAddStatus(ActorID,1018001,0)
		end
		local OpenTian,OpenMiao = PublicFun_GetServerOpenDay()
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local StartHour1 = TeShuShangRen_ActTime[1].StartHour
		local EndHour1 = TeShuShangRen_ActTime[1].EndHour
		local StartHour2 = TeShuShangRen_ActTime[2].StartHour
		local StartMinute2 = TeShuShangRen_ActTime[2].StartMinute
		local EndHour2 = TeShuShangRen_ActTime[2].EndHour
		local EndMinute2 = TeShuShangRen_ActTime[2].EndMinute
		if OpenTian > 2 then
			if MapID == StaticMapID then
				if Hour >= StartHour1 and Hour < EndHour1 then
					if not API_IsBattleGameServer() then
						API_RemoveTaskScroll(ActorID,60002)--删除卷轴
						LRY_UItwinkemanage(ActorID,11,85,104109,60002,41,'TSSR_DuiHua')--加卷轴
					end
				elseif (Hour == StartHour2 and Minute >= StartMinute2 and Minute <= 59) or (Hour == EndHour2 and Minute >= 0 and Minute < EndMinute2) then
					if not API_IsBattleGameServer() then
						API_RemoveTaskScroll(ActorID,60002)--删除卷轴
						--API_AddTaskScrollEx(ActorID,60002,104109,'TSSR_DuiHua',1)--加卷轴
						LRY_UItwinkemanage(ActorID,11,85,104109,60002,41,'TSSR_DuiHua')--加卷轴
					end
				end
			else
				API_RemoveTaskScroll(ActorID,60002)--删除卷轴	
			end
		end
	end
end

function TSSR_OnLogoutMap(ActorID)
	if API_VarDataGetNumber(ActorID,1,9901) > 0 then
		local OpenTian,OpenMiao = PublicFun_GetServerOpenDay()
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local StartHour1 = TeShuShangRen_ActTime[1].StartHour
		local EndHour1 = TeShuShangRen_ActTime[1].EndHour
		local StartHour2 = TeShuShangRen_ActTime[2].StartHour
		local StartMinute2 = TeShuShangRen_ActTime[2].StartMinute
		local EndHour2 = TeShuShangRen_ActTime[2].EndHour
		local EndMinute2 = TeShuShangRen_ActTime[2].EndMinute
		if OpenTian > 2 then
			if Hour >= StartHour1 and Hour < EndHour1 then
				if not API_IsBattleGameServer() then
					API_RemoveTaskScroll(ActorID,60002)--删除卷轴
					
					LRY_UItwinkemanage(ActorID,11,85,104109,60002,41,'TSSR_DuiHua')--加卷轴
				end
			elseif (Hour == StartHour2 and Minute >= StartMinute2 and Minute <= 59) or (Hour == EndHour2 and Minute >= 0 and Minute < EndMinute2) then
				if not API_IsBattleGameServer() then
					API_RemoveTaskScroll(ActorID,60002)--删除卷轴
					--API_AddTaskScrollEx(ActorID,60002,104109,'TSSR_DuiHua',1)--加卷轴
					LRY_UItwinkemanage(ActorID,11,85,104109,60002,41,'TSSR_DuiHua')--加卷轴
				end
			end
		end
	end
end

function TSSR_TimerTriggerGCallFunc(a,b)
	local OpenTian,OpenMiao = PublicFun_GetServerOpenDay()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ReadyHour,ReadyMinute,StartHour,StartMinute,EndHour,EndMinute = 0,0,0,0,0,0
	for i = 1,table.getn(TeShuShangRen_ActTime) do
		local RH = TeShuShangRen_ActTime[i].ReadyHour
		local RM = TeShuShangRen_ActTime[i].ReadyMinute
		local SH = TeShuShangRen_ActTime[i].StartHour
		local SM = TeShuShangRen_ActTime[i].StartMinute
		local EH = TeShuShangRen_ActTime[i].EndHour
		local EM = TeShuShangRen_ActTime[i].EndMinute
		local TM = TeShuShangRen_ActTime[i].Time
		if Hour >= RH and Hour < (EH + 1) then
			ReadyHour,ReadyMinute,StartHour,StartMinute,EndHour,EndMinute,Time = RH,RM,SH,SM,EH,EM,TM
		end
	end
	if ReadyHour ~= 0 and StartHour ~= 0 and EndHour ~= 0 then
		if Hour == ReadyHour and Minute >= ReadyMinute and Minute <= ReadyMinute + 29 then
			--TSSR_Start = 0
			if math.mod(Minute,10) == 0 then
				if OpenTian > 2 then
					if API_GetServerID() == 1 then
						if not API_IsBattleGameServer() then
							if StartMinute == 0 then
								API_ActorBDCMsg(-1,1,0,15,85,0,17,'云游商人'..StartHour..':00将刷新库存，云游商人位置：钢铁城出口处('..TML_YYSR_DGYYSR_RealX..','..TML_YYSR_DGYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,0,15,85,0,1,'云游商人'..StartHour..':00将刷新库存，云游商人位置：钢铁城出口处('..TML_YYSR_DGYYSR_RealX..','..TML_YYSR_DGYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,0,15,85,0,7,'云游商人'..StartHour..':00将刷新库存，云游商人位置：钢铁城出口处('..TML_YYSR_DGYYSR_RealX..','..TML_YYSR_DGYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,1,15,85,0,17,'云游商人'..StartHour..':00将刷新库存，云游商人位置：天空城出口处('..TML_YYSR_LBYYSR_RealX..','..TML_YYSR_LBYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,1,15,85,0,1,'云游商人'..StartHour..':00将刷新库存，云游商人位置：天空城出口处('..TML_YYSR_LBYYSR_RealX..','..TML_YYSR_LBYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,1,15,85,0,7,'云游商人'..StartHour..':00将刷新库存，云游商人位置：天空城出口处('..TML_YYSR_LBYYSR_RealX..','..TML_YYSR_LBYYSR_RealY..')')
							else
								API_ActorBDCMsg(-1,1,0,15,85,0,17,'云游商人'..StartHour..':'..StartMinute..'将刷新库存，云游商人位置：钢铁城出口处('..TML_YYSR_DGYYSR_RealX..','..TML_YYSR_DGYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,0,15,85,0,1,'云游商人'..StartHour..':'..StartMinute..'将刷新库存，云游商人位置：钢铁城出口处('..TML_YYSR_DGYYSR_RealX..','..TML_YYSR_DGYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,0,15,85,0,7,'云游商人'..StartHour..':'..StartMinute..'将刷新库存，云游商人位置：钢铁城出口处('..TML_YYSR_DGYYSR_RealX..','..TML_YYSR_DGYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,1,15,85,0,17,'云游商人'..StartHour..':'..StartMinute..'将刷新库存，云游商人位置：天空城出口处('..TML_YYSR_LBYYSR_RealX..','..TML_YYSR_LBYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,1,15,85,0,1,'云游商人'..StartHour..':'..StartMinute..'将刷新库存，云游商人位置：天空城出口处('..TML_YYSR_LBYYSR_RealX..','..TML_YYSR_LBYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,1,15,85,0,7,'云游商人'..StartHour..':'..StartMinute..'将刷新库存，云游商人位置：天空城出口处('..TML_YYSR_LBYYSR_RealX..','..TML_YYSR_LBYYSR_RealY..')')
							end
						end
					end
				end
			end
		end
		if (Hour == StartHour and Minute == StartMinute) or TML_YYSR_Switch == 1 then
			--if API_GetServerID() == 1 or API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 6 or API_GetServerID() == 7 or API_GetServerID() == 8 or API_GetServerID() == 9 or API_GetServerID() == 10 then
				--if TSSR_Start == nil or TSSR_Start < 1 then
					--TSSR_Start = 1
					if GLOBAL_GameOnlineNum_OnLoadIDataOK == 1 then
						local Hour = 20
						local GameOnlineNum = API_VarDataGetNumber_Ex(1,0,-102,1,Hour)
						if GameOnlineNum == 0 then
							GameOnlineNum = API_GetGameOnlineNum()
							TML_YYSR_JiBenNum = math.floor(GameOnlineNum/200)
						elseif GameOnlineNum > 0 and GameOnlineNum < 1600 then
							TML_YYSR_JiBenNum = 8
						elseif GameOnlineNum >= 1600 then
							TML_YYSR_JiBenNum = math.floor(GameOnlineNum/200)
						end
					end
					if OpenTian <= 3 then
						--销售系数：
						TML_YYSR_XS1 = 1.2	--乖乖女
						TML_YYSR_XS2 = 0.3	--兔宝宝
						TML_YYSR_XS3 = 0.12	--女管家
						TML_YYSR_XS4 = 1.2	--蝙蝠装
						TML_YYSR_XS5 = 1.2	--小李装
						TML_YYSR_XS6 = 0.12	--乖乖男
						TML_YYSR_XS7 = 1.2	--双倍经验卡
						TML_YYSR_XS8 = 10	--紫灵菇
						TML_YYSR_XS9 = 0.2	--紫云菇
						TML_YYSR_XS10 = 21	--超级VIP卡
						TML_YYSR_XS11 = 0.3	--能量回复影兽
						TML_YYSR_XS12 = 2	--佣兵团徽章
						TML_YYSR_XS13 = 20	--战斗技能经验券
						TML_YYSR_XS14 = 20	--战斗技能水晶币券
						TML_YYSR_XS15 = 0.1	--宠物变身药[A类药]
						TML_YYSR_XS16 = 0.14
						TML_YYSR_XS17 = 0.14
						TML_YYSR_XS18 = 0.14
						TML_YYSR_XS19 = 0.14
						TML_YYSR_XS20 = 0.24
						TML_YYSR_XS21 = 0.24
						TML_YYSR_XS22 = 0.24
						TML_YYSR_XS23 = 0.24
						TML_YYSR_XS24 = 0.18
						TML_YYSR_XS25 = 0.18
						TML_YYSR_XS26 = 0.18
						TML_YYSR_XS27 = 0.18
						TML_YYSR_XS28 = 1.6		--友达啤酒
						TML_YYSR_XS29 = 0.04	--雷霆兽卡
						TML_YYSR_XS30 = 0.3		--节日鸿运帽
						TML_YYSR_XS31 = 0.3		--节日鸿运装
						TML_YYSR_XS32 = 1.2		--节日招财帽
						TML_YYSR_XS33 = 1.2		--节日招财装
						TML_YYSR_XS34 = 1.2	--马戏团高帽（白银男装）
						TML_YYSR_XS35 = 1.2	--马戏团舞服（白银男装）
						TML_YYSR_XS36 = 0.3	--马戏团长耳（白银女装）
						TML_YYSR_XS37 = 0.3	--马戏团舞群（白银女装）
						TML_YYSR_XS38 = 0.1	--宠物变身药丸B类药
						TML_YYSR_XS39 = 0.18	--飞侠1
						TML_YYSR_XS40 = 0.18	--飞侠2
						TML_YYSR_XS41 = 0.18	--飞侠3
						TML_YYSR_XS42 = 0.18	--飞侠4
						TML_YYSR_XS43 = 0.24	--刀锋1
						TML_YYSR_XS44 = 0.24	--刀锋2
						TML_YYSR_XS45 = 0.24	--刀锋3
						TML_YYSR_XS46 = 0.24	--刀锋4
						TML_YYSR_XS47 = 0.14	--黑法1
						TML_YYSR_XS48 = 0.14	--黑法2
						TML_YYSR_XS49 = 0.14	--黑法3
						TML_YYSR_XS50 = 0.14	--黑法4
						TML_YYSR_XS51 = 200		--变身糖果
						TML_YYSR_XS52 = 6		--时装魔法包
						TML_YYSR_XS53 = 6		--神秘之地传送卷
						TML_YYSR_XS54 = 200		--圣诞礼袜
						TML_YYSR_XS55 = 0.4		--永恒之星
						TML_YYSR_XS56 = 0.6		--白金爵士礼帽[礼服]
						TML_YYSR_XS57 = 0.6		--白金爵士礼服[礼服]
						TML_YYSR_XS58 = 0.15	--花冠女王头饰[婚纱]
						TML_YYSR_XS59 = 0.15	--花冠女王婚纱[婚纱]
						TML_YYSR_XS60 = 6       --夺宝奇兵传送卷轴
						TML_YYSR_XS61 = 6	    --契约魔坛传送卷
						TML_YYSR_XS62 = 6	    --月神别苑传送卷
						TML_YYSR_XS63 = 6	    --深寒地宫传送卷
						TML_YYSR_XS64 = 10	    --家具
						TML_YYSR_XS65 = 20	    --神奇的粽子
					elseif OpenTian > 3 and OpenTian <= 7 then
						--销售系数：
						TML_YYSR_XS1 = 0.72	--乖乖女
						TML_YYSR_XS2 = 0.25	--兔宝宝
						TML_YYSR_XS3 = 0.11	--女管家
						TML_YYSR_XS4 = 0.9	--蝙蝠装
						TML_YYSR_XS5 = 0.9	--小李装
						TML_YYSR_XS6 = 0.11	--乖乖男
						TML_YYSR_XS7 = 0.725	--双倍经验卡
						TML_YYSR_XS8 = 5.3	--紫灵菇
						TML_YYSR_XS9 = 0.2	--紫云菇
						TML_YYSR_XS10 = 15	--超级VIP卡
						TML_YYSR_XS11 = 0.3	--能量回复影兽
						TML_YYSR_XS12 = 2	--佣兵团徽章
						TML_YYSR_XS13 = 110	--战斗技能经验券
						TML_YYSR_XS14 = 50	--战斗技能水晶币券
						TML_YYSR_XS15 = 0.15	--宠物变身药[A类药]
						TML_YYSR_XS16 = 0.07
						TML_YYSR_XS17 = 0.07
						TML_YYSR_XS18 = 0.07
						TML_YYSR_XS19 = 0.07
						TML_YYSR_XS20 = 0.12
						TML_YYSR_XS21 = 0.12
						TML_YYSR_XS22 = 0.12
						TML_YYSR_XS23 = 0.12
						TML_YYSR_XS24 = 0.09
						TML_YYSR_XS25 = 0.09
						TML_YYSR_XS26 = 0.09
						TML_YYSR_XS27 = 0.09
						TML_YYSR_XS28 = 1.6		--友达啤酒
						TML_YYSR_XS29 = 0.04	--雷霆兽卡
						TML_YYSR_XS30 = 0.25	--节日鸿运帽
						TML_YYSR_XS31 = 0.25	--节日鸿运装
						TML_YYSR_XS32 = 0.9		--节日招财帽
						TML_YYSR_XS33 = 0.9		--节日招财装
						TML_YYSR_XS34 = 0.9		--马戏团高帽（白银男装）
						TML_YYSR_XS35 = 0.9		--马戏团舞服（白银男装）
						TML_YYSR_XS36 = 0.25	--马戏团长耳（白银女装）
						TML_YYSR_XS37 = 0.25	--马戏团舞群（白银女装）
						TML_YYSR_XS38 = 0.15	--宠物变身药丸B类药
						TML_YYSR_XS39 = 0.09	--飞侠1
						TML_YYSR_XS40 = 0.09	--飞侠2
						TML_YYSR_XS41 = 0.09	--飞侠3
						TML_YYSR_XS42 = 0.09	--飞侠4
						TML_YYSR_XS43 = 0.12	--刀锋1
						TML_YYSR_XS44 = 0.12	--刀锋2
						TML_YYSR_XS45 = 0.12	--刀锋3
						TML_YYSR_XS46 = 0.12	--刀锋4
						TML_YYSR_XS47 = 0.07	--黑法1
						TML_YYSR_XS48 = 0.07	--黑法2
						TML_YYSR_XS49 = 0.07	--黑法3
						TML_YYSR_XS50 = 0.07	--黑法4
						TML_YYSR_XS51 = 200		--变身糖果
						TML_YYSR_XS52 = 6		--时装魔法包
						TML_YYSR_XS53 = 6		--神秘之地传送卷
						TML_YYSR_XS54 = 200		--圣诞礼袜
						TML_YYSR_XS55 = 0.3		--永恒之星
						TML_YYSR_XS56 = 0.525	--白金爵士礼帽[礼服]
						TML_YYSR_XS57 = 0.525	--白金爵士礼服[礼服]
						TML_YYSR_XS58 = 0.125	--花冠女王头饰[婚纱]
						TML_YYSR_XS59 = 0.125	--花冠女王婚纱[婚纱]
						TML_YYSR_XS60 = 6       --夺宝奇兵传送卷轴
						TML_YYSR_XS61 = 6	    --契约魔坛传送卷
						TML_YYSR_XS62 = 6	    --月神别苑传送卷
						TML_YYSR_XS63 = 6	    --深寒地宫传送卷
						TML_YYSR_XS64 = 10	    --家具
						TML_YYSR_XS65 = 20	    --神奇的粽子
					elseif OpenTian > 7 then
						--销售系数：
						TML_YYSR_XS1 = TML_YYSR_QiTianHou_XS1	--乖乖女
						TML_YYSR_XS2 = TML_YYSR_QiTianHou_XS2	--兔宝宝
						TML_YYSR_XS3 = TML_YYSR_QiTianHou_XS3	--女管家
						TML_YYSR_XS4 = TML_YYSR_QiTianHou_XS4	--蝙蝠装
						TML_YYSR_XS5 = TML_YYSR_QiTianHou_XS5	--小李装
						TML_YYSR_XS6 = TML_YYSR_QiTianHou_XS6	--乖乖男
						TML_YYSR_XS7 = TML_YYSR_QiTianHou_XS7	--双倍经验卡
						TML_YYSR_XS8 = TML_YYSR_QiTianHou_XS8	--紫灵菇
						TML_YYSR_XS9 = TML_YYSR_QiTianHou_XS9	--紫云菇
						TML_YYSR_XS10 = TML_YYSR_QiTianHou_XS10	--超级VIP卡
						TML_YYSR_XS11 = TML_YYSR_QiTianHou_XS11	--能量回复影兽
						TML_YYSR_XS12 = TML_YYSR_QiTianHou_XS12	--佣兵团徽章
						TML_YYSR_XS13 = TML_YYSR_QiTianHou_XS13	--战斗技能经验券
						TML_YYSR_XS14 = TML_YYSR_QiTianHou_XS14	--战斗技能水晶币券
						TML_YYSR_XS15 = TML_YYSR_QiTianHou_XS15	--宠物变身药[A类药]
						TML_YYSR_XS16 = TML_YYSR_QiTianHou_XS16
						TML_YYSR_XS17 = TML_YYSR_QiTianHou_XS17
						TML_YYSR_XS18 = TML_YYSR_QiTianHou_XS18
						TML_YYSR_XS19 = TML_YYSR_QiTianHou_XS19
						TML_YYSR_XS20 = TML_YYSR_QiTianHou_XS20
						TML_YYSR_XS21 = TML_YYSR_QiTianHou_XS21
						TML_YYSR_XS22 = TML_YYSR_QiTianHou_XS22
						TML_YYSR_XS23 = TML_YYSR_QiTianHou_XS23
						TML_YYSR_XS24 = TML_YYSR_QiTianHou_XS24
						TML_YYSR_XS25 = TML_YYSR_QiTianHou_XS25
						TML_YYSR_XS26 = TML_YYSR_QiTianHou_XS26
						TML_YYSR_XS27 = TML_YYSR_QiTianHou_XS27
						TML_YYSR_XS28 = TML_YYSR_QiTianHou_XS28	--友达啤酒
						TML_YYSR_XS29 = TML_YYSR_QiTianHou_XS29	--雷霆兽卡
						TML_YYSR_XS30 = TML_YYSR_QiTianHou_XS30	--节日鸿运帽
						TML_YYSR_XS31 = TML_YYSR_QiTianHou_XS31	--节日鸿运装
						TML_YYSR_XS32 = TML_YYSR_QiTianHou_XS32	--节日招财帽
						TML_YYSR_XS33 = TML_YYSR_QiTianHou_XS33	--节日招财装
						TML_YYSR_XS34 = TML_YYSR_QiTianHou_XS34	--马戏团高帽（白银男装）
						TML_YYSR_XS35 = TML_YYSR_QiTianHou_XS35	--马戏团舞服（白银男装）
						TML_YYSR_XS36 = TML_YYSR_QiTianHou_XS36	--马戏团长耳（白银女装）
						TML_YYSR_XS37 = TML_YYSR_QiTianHou_XS37	--马戏团舞群（白银女装）
						TML_YYSR_XS38 = TML_YYSR_QiTianHou_XS38	--宠物变身药丸B类药
						TML_YYSR_XS39 = TML_YYSR_QiTianHou_XS39	--飞侠1
						TML_YYSR_XS40 = TML_YYSR_QiTianHou_XS40	--飞侠2
						TML_YYSR_XS41 = TML_YYSR_QiTianHou_XS41	--飞侠3
						TML_YYSR_XS42 = TML_YYSR_QiTianHou_XS42	--飞侠4
						TML_YYSR_XS43 = TML_YYSR_QiTianHou_XS43	--刀锋1
						TML_YYSR_XS44 = TML_YYSR_QiTianHou_XS44	--刀锋2
						TML_YYSR_XS45 = TML_YYSR_QiTianHou_XS45	--刀锋3
						TML_YYSR_XS46 = TML_YYSR_QiTianHou_XS46	--刀锋4
						TML_YYSR_XS47 = TML_YYSR_QiTianHou_XS47	--黑法1
						TML_YYSR_XS48 = TML_YYSR_QiTianHou_XS48	--黑法2
						TML_YYSR_XS49 = TML_YYSR_QiTianHou_XS49	--黑法3
						TML_YYSR_XS50 = TML_YYSR_QiTianHou_XS50	--黑法4
						TML_YYSR_XS51 = TML_YYSR_QiTianHou_XS51	--变身糖果
						TML_YYSR_XS52 = TML_YYSR_QiTianHou_XS52	--时装魔法包
						TML_YYSR_XS53 = TML_YYSR_QiTianHou_XS53	--神秘之地传送卷
						TML_YYSR_XS54 = TML_YYSR_QiTianHou_XS54	--圣诞礼袜
						TML_YYSR_XS55 = TML_YYSR_QiTianHou_XS55		--永恒之星
						TML_YYSR_XS56 = TML_YYSR_QiTianHou_XS56		--白金爵士礼帽[礼服]
						TML_YYSR_XS57 = TML_YYSR_QiTianHou_XS57		--白金爵士礼服[礼服]
						TML_YYSR_XS58 = TML_YYSR_QiTianHou_XS58		--花冠女王头饰[婚纱]
						TML_YYSR_XS59 = TML_YYSR_QiTianHou_XS59		--花冠女王婚纱[婚纱]
						TML_YYSR_XS60 = TML_YYSR_QiTianHou_XS60		--夺宝奇兵传送卷轴
						TML_YYSR_XS61 = TML_YYSR_QiTianHou_XS61	    --契约魔坛传送卷
						TML_YYSR_XS62 = TML_YYSR_QiTianHou_XS62	    --月神别苑传送卷
						TML_YYSR_XS63 = TML_YYSR_QiTianHou_XS63	    --深寒地宫传送卷
						TML_YYSR_XS64 = TML_YYSR_QiTianHou_XS64	    --家具
						TML_YYSR_XS65 = TML_YYSR_QiTianHou_XS65	    --神奇的粽子
					end
					TeShuShangRen_LBGoods = {
						[1] = {
								{GoodsID=10994,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS36*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS36*TML_YYSR_JiBenNum),Key=171},
								{GoodsID=10995,Money=0,Point=1500,ShuLiang=math.floor(TML_YYSR_XS37*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS37*TML_YYSR_JiBenNum),Key=172},
								{GoodsID=11036,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),Key=1},
								{GoodsID=11037,Money=0,Point=1500,ShuLiang=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),Key=2},
								{GoodsID=11042,Money=0,Point=4000,ShuLiang=math.floor(TML_YYSR_XS3*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS3*TML_YYSR_JiBenNum),Key=5},
								{GoodsID=11043,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS3*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS3*TML_YYSR_JiBenNum),Key=6},
								{GoodsID=11046,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS2*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS2*TML_YYSR_JiBenNum),Key=3},
								{GoodsID=11047,Money=0,Point=1500,ShuLiang=math.floor(TML_YYSR_XS2*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS2*TML_YYSR_JiBenNum),Key=4},
									},
						[2] = {
								{GoodsID=10986,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS34*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS34*TML_YYSR_JiBenNum),Key=173},
								{GoodsID=10987,Money=0,Point=1500,ShuLiang=math.floor(TML_YYSR_XS35*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS35*TML_YYSR_JiBenNum),Key=174},
								{GoodsID=11026,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS4*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS4*TML_YYSR_JiBenNum),Key=11},
								{GoodsID=11027,Money=0,Point=1500,ShuLiang=math.floor(TML_YYSR_XS4*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS4*TML_YYSR_JiBenNum),Key=12},
								{GoodsID=11028,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS5*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS5*TML_YYSR_JiBenNum),Key=13},
								{GoodsID=11029,Money=0,Point=1500,ShuLiang=math.floor(TML_YYSR_XS5*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS5*TML_YYSR_JiBenNum),Key=14},
								{GoodsID=11034,Money=0,Point=4000,ShuLiang=math.floor(TML_YYSR_XS6*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS6*TML_YYSR_JiBenNum),Key=15},
								{GoodsID=11035,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS6*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS6*TML_YYSR_JiBenNum),Key=16},
									},
						[3] = {
								--{GoodsID=88132,Money=0,Point=900,ShuLiang=math.floor(TML_YYSR_XS38*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS38*TML_YYSR_JiBenNum),Key=175},
								--{GoodsID=89065,Money=0,Point=30,ShuLiang=999,AllNum=999,Key=335},
								{GoodsID=88991,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS7*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS7*TML_YYSR_JiBenNum),Key=333},
								{GoodsID=88065,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS7*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS7*TML_YYSR_JiBenNum),Key=21},
								{GoodsID=902,Money=0,Point=400,ShuLiang=math.floor(TML_YYSR_XS8*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS8*TML_YYSR_JiBenNum),Key=22},
								{GoodsID=80621,Money=0,Point=50,ShuLiang=math.floor(TML_YYSR_XS10*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS10*TML_YYSR_JiBenNum),Key=24},
								{GoodsID=80832,Money=0,Point=15,ShuLiang=math.floor(TML_YYSR_XS13*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS13*TML_YYSR_JiBenNum),Key=27},
								{GoodsID=80833,Money=0,Point=5,ShuLiang=math.floor(TML_YYSR_XS14*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS14*TML_YYSR_JiBenNum),Key=28},
								--{GoodsID=88131,Money=0,Point=900,ShuLiang=math.floor(TML_YYSR_XS15*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS15*TML_YYSR_JiBenNum),Key=29},
								{GoodsID=904,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS9*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS9*TML_YYSR_JiBenNum),Key=23},
								{GoodsID=968,Money=0,Point=200,ShuLiang=math.floor(TML_YYSR_XS12*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS12*TML_YYSR_JiBenNum),Key=26},
								{GoodsID=11045,Money=0,Point=2900,ShuLiang=math.floor(TML_YYSR_XS11*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS11*TML_YYSR_JiBenNum),Key=25},
								{GoodsID=88080,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS28*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS28*TML_YYSR_JiBenNum),Key=7},
								{GoodsID=31014,Money=0,Point=60000,ShuLiang=math.floor(TML_YYSR_XS29*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS29*TML_YYSR_JiBenNum),Key=8},
									},
						[4] = {
								{GoodsID=88920,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=389},
								{GoodsID=88921,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=390},
								{GoodsID=88922,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=391},
								{GoodsID=88923,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=392},
								{GoodsID=88924,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=393},
								{GoodsID=88925,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=394},
								{GoodsID=88926,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=395},
								{GoodsID=88927,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=396},
								{GoodsID=88928,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=397},
								{GoodsID=88929,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=398},
								{GoodsID=88930,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=399},
								{GoodsID=88931,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=400},
								
								{GoodsID=88591,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=308},
								{GoodsID=88592,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=309},
								{GoodsID=88593,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=311},
								{GoodsID=88594,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=312},
								{GoodsID=88595,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=313},
								{GoodsID=88596,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=314},
								{GoodsID=88597,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=315},
								{GoodsID=88598,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=316},
								{GoodsID=88599,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=317},
								{GoodsID=88600,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=318},
								{GoodsID=88601,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=319},
								{GoodsID=88602,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=320},
				
								{GoodsID=88113,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=131},
								{GoodsID=88114,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS40*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS40*TML_YYSR_JiBenNum),Key=132},
								{GoodsID=88115,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS41*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS41*TML_YYSR_JiBenNum),Key=133},
								{GoodsID=88116,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS42*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS42*TML_YYSR_JiBenNum),Key=134},
								{GoodsID=88117,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS43*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS43*TML_YYSR_JiBenNum),Key=135},
								{GoodsID=88118,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS44*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS44*TML_YYSR_JiBenNum),Key=136},
								{GoodsID=88119,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS45*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS45*TML_YYSR_JiBenNum),Key=137},
								{GoodsID=88120,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS46*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS46*TML_YYSR_JiBenNum),Key=138},
								{GoodsID=88121,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS47*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS47*TML_YYSR_JiBenNum),Key=139},
								{GoodsID=88122,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS48*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS48*TML_YYSR_JiBenNum),Key=140},
								{GoodsID=88123,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS49*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS49*TML_YYSR_JiBenNum),Key=141},
								{GoodsID=88124,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS50*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS50*TML_YYSR_JiBenNum),Key=142},
								{GoodsID=88101,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS16*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS16*TML_YYSR_JiBenNum),Key=101},
								{GoodsID=88102,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS17*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS17*TML_YYSR_JiBenNum),Key=102},
								{GoodsID=88103,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS18*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS18*TML_YYSR_JiBenNum),Key=103},
								{GoodsID=88104,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS19*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS19*TML_YYSR_JiBenNum),Key=104},
								{GoodsID=88105,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS20*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS20*TML_YYSR_JiBenNum),Key=105},
								{GoodsID=88106,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS21*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS21*TML_YYSR_JiBenNum),Key=106},
								{GoodsID=88107,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS22*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS22*TML_YYSR_JiBenNum),Key=107},
								{GoodsID=88108,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS23*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS23*TML_YYSR_JiBenNum),Key=108},
								{GoodsID=88109,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS24*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS24*TML_YYSR_JiBenNum),Key=109},
								{GoodsID=88110,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS25*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS25*TML_YYSR_JiBenNum),Key=110},
								{GoodsID=88111,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS26*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS26*TML_YYSR_JiBenNum),Key=111},
								{GoodsID=88112,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=112},
									
									},
						[5] = {
								{GoodsID=88589,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=9},
									},
						[6] = {
								{GoodsID=88590,Money=0,Point=500,ShuLiang=math.floor(TML_YYSR_XS53*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS53*TML_YYSR_JiBenNum),Key=10},
									},
						[7] = {
								{GoodsID=88877,Money=0,Point=15,ShuLiang=999,AllNum=999,Key=17},
									},
						[8] = {
								{GoodsID=88909,Money=0,Point=500,ShuLiang=math.floor(TML_YYSR_XS60*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS60*TML_YYSR_JiBenNum),Key=181},
									},
						[9] = {
								--{GoodsID=88916,Money=500,Point=0,ShuLiang=math.floor(TML_YYSR_XS61*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS61*TML_YYSR_JiBenNum),Key=183},
								--{GoodsID=88917,Money=300,Point=0,ShuLiang=math.floor(TML_YYSR_XS62*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS62*TML_YYSR_JiBenNum),Key=184},
								{GoodsID=88918,Money=0,Point=500,ShuLiang=math.floor(TML_YYSR_XS63*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS63*TML_YYSR_JiBenNum),Key=185},
									},
						[10] = {
								{GoodsID=38078,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=190},
								{GoodsID=38079,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=191},
								{GoodsID=38080,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=192},
								{GoodsID=38081,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=193},
								{GoodsID=38082,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=194},
								{GoodsID=38083,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=195},
								{GoodsID=38084,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=196},
								{GoodsID=38085,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=197},
								{GoodsID=38034,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=198},
								{GoodsID=38035,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=199},
								{GoodsID=38036,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=200},
								{GoodsID=38037,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=201},
								{GoodsID=38038,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=202},
								{GoodsID=38039,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=203},
								{GoodsID=38040,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=204},
								{GoodsID=38041,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=205},
								{GoodsID=38042,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=206},
								{GoodsID=38043,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=207},
									},
						[12] = {
								--{GoodsID=88944,Money=0,Point=500,ShuLiang=math.floor(TML_YYSR_XS53*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS53*TML_YYSR_JiBenNum),Key=228},
								--{GoodsID=88606,Money=0,Point=5,ShuLiang=999,AllNum=999,Key=228},--圣诞袜子
								--{GoodsID=828,Money=0,Point=10,ShuLiang=999,AllNum=999,Key=228},--万圣节糖果
								   {GoodsID=89065,Money=0,Point=20,ShuLiang=999,AllNum=999,Key=353},--周年宝箱
									{GoodsID=89131,Money=0,Point=20,ShuLiang=999,AllNum=999,Key=354},--神龙令牌
									{GoodsID=89170,Money=0,Point=50,ShuLiang=999,AllNum=999,Key=355},--端午节宝箱
									{GoodsID=88910,Money=0,Point=10,ShuLiang=999,AllNum=999,Key=356},--符文卷轴
									{GoodsID=89194,Money=0,Point=1000,ShuLiang=999,AllNum=999,Key=357},--神灯
									{GoodsID=88606,Money=0,Point=9,ShuLiang=999,AllNum=999,Key=358},--圣诞礼袜
									},
						[13] = {
								--{GoodsID=11289,Money=0,Point=500,ShuLiang=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),Key=300},
								--{GoodsID=11290,Money=0,Point=40000,ShuLiang=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),Key=301},
								{GoodsID=11303,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=413},--花冠女王头饰[七夕纪念时装](3档)
								{GoodsID=11304,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=414},--花冠女王婚纱[七夕纪念时装](3档)
								{GoodsID=11305,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=415},--贵族礼帽[七夕纪念时装](3档)
								{GoodsID=11306,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=416},--高贵戎装[七夕纪念时装](3档)
								
								{GoodsID=11289,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=300},
								{GoodsID=11290,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=301},
								{GoodsID=11285,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=337},--法兰绒绅士礼帽[七夕时装](3档)
								{GoodsID=11286,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=338},--法兰绒绅士[七夕时装](3档)
									
									},
						[14] = {
								--{GoodsID=11285,Money=0,Point=500,ShuLiang=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),Key=302},
								--{GoodsID=11286,Money=0,Point=40000,ShuLiang=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),Key=303},
								{GoodsID=11303,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=417},--花冠女王头饰[七夕纪念时装](3档)
								{GoodsID=11304,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=418},--花冠女王婚纱[七夕纪念时装](3档)
								{GoodsID=11305,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=419},--贵族礼帽[七夕纪念时装](3档)
								{GoodsID=11306,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=420},--高贵戎装[七夕纪念时装](3档)
								
								{GoodsID=11285,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=302},
								{GoodsID=11286,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=303},
								{GoodsID=11289,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=339},
								{GoodsID=11290,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=340},
								
								},
						[15] = {
								--{GoodsID=88943,Money=0,Point=20,ShuLiang=999,AllNum=999,Key=335},
								--{GoodsID=89065,Money=0,Point=30,ShuLiang=999,AllNum=999,Key=335},
								--{GoodsID=89131,Money=0,Point=50,ShuLiang=999,AllNum=999,Key=335},--神龙令
								--{GoodsID=89170,Money=0,Point=15,ShuLiang=999,AllNum=999,Key=335}
								--{GoodsID=88944,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=228},
								{GoodsID=89194,Money=0,Point=1000,ShuLiang=999,AllNum=999,Key=228},--神灯
								},
						[16] = {
								{GoodsID=11548,Money=0,Point=3000,ShuLiang=999,AllNum=999,Key=429},--雨林精灵头饰（女）
								{GoodsID=11549,Money=0,Point=7000,ShuLiang=999,AllNum=999,Key=430},--雨林精灵外套（女）
								{GoodsID=11550,Money=0,Point=7000,ShuLiang=999,AllNum=999,Key=431},--雨林动感外套（男）
								{GoodsID=11595,Money=0,Point=3000,ShuLiang=999,AllNum=999,Key=432},--雨林精灵帽（男）
							   },
						[17] = {
								{GoodsID=88589,Money=0,Point=100,ShuLiang=999,AllNum=999,Key=175},
							  },
					}
					for j in TeShuShangRen_LBGoods do
						for i in TeShuShangRen_LBGoods[j] do
							local ShuLiang = TeShuShangRen_LBGoods[j][i].ShuLiang
							local AllNum = TeShuShangRen_LBGoods[j][i].AllNum
							if ShuLiang == 0 and AllNum == 0 then
								TeShuShangRen_LBGoods[j][i].ShuLiang = 999
								TeShuShangRen_LBGoods[j][i].AllNum = 999
							end
						end
					end
					for j in TeShuShangRen_LBGoods do
						for i in TeShuShangRen_LBGoods[j] do
							local Key = TeShuShangRen_LBGoods[j][i].Key
							local AllNum = TeShuShangRen_LBGoods[j][i].AllNum
							API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,AllNum)
						end
					end
					TeShuShangRen_DGGoods = {
						[1] = {
								{GoodsID=10994,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS36*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS36*TML_YYSR_JiBenNum),Key=176},
								{GoodsID=10995,Money=0,Point=1500,ShuLiang=math.floor(TML_YYSR_XS37*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS37*TML_YYSR_JiBenNum),Key=177},
								{GoodsID=11036,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),Key=31},
								{GoodsID=11037,Money=0,Point=1500,ShuLiang=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),Key=32},
								{GoodsID=11042,Money=0,Point=4000,ShuLiang=math.floor(TML_YYSR_XS3*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS3*TML_YYSR_JiBenNum),Key=35},
								{GoodsID=11043,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS3*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS3*TML_YYSR_JiBenNum),Key=36},
								{GoodsID=11046,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS2*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS2*TML_YYSR_JiBenNum),Key=33},
								{GoodsID=11047,Money=0,Point=1500,ShuLiang=math.floor(TML_YYSR_XS2*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS2*TML_YYSR_JiBenNum),Key=34},
									},
						[2] = {
								{GoodsID=10986,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS34*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS34*TML_YYSR_JiBenNum),Key=178},
								{GoodsID=10987,Money=0,Point=1500,ShuLiang=math.floor(TML_YYSR_XS35*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS35*TML_YYSR_JiBenNum),Key=179},
								{GoodsID=11026,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS4*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS4*TML_YYSR_JiBenNum),Key=41},
								{GoodsID=11027,Money=0,Point=1500,ShuLiang=math.floor(TML_YYSR_XS4*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS4*TML_YYSR_JiBenNum),Key=42},
								{GoodsID=11028,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS5*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS5*TML_YYSR_JiBenNum),Key=43},
								{GoodsID=11029,Money=0,Point=1500,ShuLiang=math.floor(TML_YYSR_XS5*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS5*TML_YYSR_JiBenNum),Key=44},
								{GoodsID=11034,Money=0,Point=4000,ShuLiang=math.floor(TML_YYSR_XS6*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS6*TML_YYSR_JiBenNum),Key=45},
								{GoodsID=11035,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS6*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS6*TML_YYSR_JiBenNum),Key=46},
									},
						[3] = {
								--{GoodsID=88132,Money=0,Point=900,ShuLiang=math.floor(TML_YYSR_XS38*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS38*TML_YYSR_JiBenNum),Key=180},
								--{GoodsID=89065,Money=0,Point=30,ShuLiang=999,AllNum=999,Key=336},
								{GoodsID=88991,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS7*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS7*TML_YYSR_JiBenNum),Key=334},
								{GoodsID=88065,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS7*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS7*TML_YYSR_JiBenNum),Key=51},
								{GoodsID=902,Money=0,Point=400,ShuLiang=math.floor(TML_YYSR_XS8*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS8*TML_YYSR_JiBenNum),Key=52},
								{GoodsID=80621,Money=0,Point=50,ShuLiang=math.floor(TML_YYSR_XS10*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS10*TML_YYSR_JiBenNum),Key=54},
								{GoodsID=80832,Money=0,Point=15,ShuLiang=math.floor(TML_YYSR_XS13*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS13*TML_YYSR_JiBenNum),Key=57},
								{GoodsID=80833,Money=0,Point=5,ShuLiang=math.floor(TML_YYSR_XS14*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS14*TML_YYSR_JiBenNum),Key=58},
								--{GoodsID=88131,Money=0,Point=900,ShuLiang=math.floor(TML_YYSR_XS15*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS15*TML_YYSR_JiBenNum),Key=59},
								{GoodsID=904,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS9*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS9*TML_YYSR_JiBenNum),Key=53},
								{GoodsID=968,Money=0,Point=200,ShuLiang=math.floor(TML_YYSR_XS12*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS12*TML_YYSR_JiBenNum),Key=56},
								{GoodsID=11045,Money=0,Point=2900,ShuLiang=math.floor(TML_YYSR_XS11*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS11*TML_YYSR_JiBenNum),Key=55},
								{GoodsID=88080,Money=0,Point=1000,ShuLiang=math.floor(TML_YYSR_XS28*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS28*TML_YYSR_JiBenNum),Key=37},
								{GoodsID=31014,Money=0,Point=60000,ShuLiang=math.floor(TML_YYSR_XS29*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS29*TML_YYSR_JiBenNum),Key=38},
									},
						[4] = {
								
								--
								{GoodsID=88920,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=401},
								{GoodsID=88921,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=402},
								{GoodsID=88922,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=403},
								{GoodsID=88923,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=404},
								{GoodsID=88924,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=405},
								{GoodsID=88925,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=406},
								{GoodsID=88926,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=407},
								{GoodsID=88927,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=408},
								{GoodsID=88928,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=409},
								{GoodsID=88929,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=410},
								{GoodsID=88930,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=411},
								{GoodsID=88931,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=412},
								
								--100929新增英雄秘笈
								{GoodsID=88591,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=321},
								{GoodsID=88592,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=322},
								{GoodsID=88593,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=323},
								{GoodsID=88594,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=324},
								{GoodsID=88595,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=325},
								{GoodsID=88596,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=326},
								{GoodsID=88597,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=327},
								{GoodsID=88598,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=328},
								{GoodsID=88599,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=329},
								{GoodsID=88600,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=330},
								{GoodsID=88601,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=331},
								{GoodsID=88602,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=332},
						
								{GoodsID=88113,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS39*TML_YYSR_JiBenNum),Key=143},
								{GoodsID=88114,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS40*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS40*TML_YYSR_JiBenNum),Key=144},
								{GoodsID=88115,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS41*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS41*TML_YYSR_JiBenNum),Key=145},
								{GoodsID=88116,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS42*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS42*TML_YYSR_JiBenNum),Key=146},
								{GoodsID=88117,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS43*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS43*TML_YYSR_JiBenNum),Key=147},
								{GoodsID=88118,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS44*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS44*TML_YYSR_JiBenNum),Key=148},
								{GoodsID=88119,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS45*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS45*TML_YYSR_JiBenNum),Key=149},
								{GoodsID=88120,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS46*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS46*TML_YYSR_JiBenNum),Key=150},
								{GoodsID=88121,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS47*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS47*TML_YYSR_JiBenNum),Key=151},
								{GoodsID=88122,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS48*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS48*TML_YYSR_JiBenNum),Key=152},
								{GoodsID=88123,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS49*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS49*TML_YYSR_JiBenNum),Key=153},
								{GoodsID=88124,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS50*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS50*TML_YYSR_JiBenNum),Key=154},
								{GoodsID=88101,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS16*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS16*TML_YYSR_JiBenNum),Key=113},
								{GoodsID=88102,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS17*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS17*TML_YYSR_JiBenNum),Key=114},
								{GoodsID=88103,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS18*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS18*TML_YYSR_JiBenNum),Key=115},
								{GoodsID=88104,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS19*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS19*TML_YYSR_JiBenNum),Key=116},
								{GoodsID=88105,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS20*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS20*TML_YYSR_JiBenNum),Key=117},
								{GoodsID=88106,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS21*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS21*TML_YYSR_JiBenNum),Key=118},
								{GoodsID=88107,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS22*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS22*TML_YYSR_JiBenNum),Key=119},
								{GoodsID=88108,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS23*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS23*TML_YYSR_JiBenNum),Key=120},
								{GoodsID=88109,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS24*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS24*TML_YYSR_JiBenNum),Key=121},
								{GoodsID=88110,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS25*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS25*TML_YYSR_JiBenNum),Key=122},
								{GoodsID=88111,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS26*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS26*TML_YYSR_JiBenNum),Key=123},
								{GoodsID=88112,Money=0,Point=1250,ShuLiang=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS27*TML_YYSR_JiBenNum),Key=124},
								
									},
						[5] = {
								{GoodsID=88589,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=39},
									},
						[6] = {
								{GoodsID=88590,Money=0,Point=500,ShuLiang=math.floor(TML_YYSR_XS53*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS53*TML_YYSR_JiBenNum),Key=20},
									},
						[7] = {
								{GoodsID=88877,Money=0,Point=15,ShuLiang=999,AllNum=999,Key=47},
									},
						[8] = {
								{GoodsID=88909,Money=0,Point=500,ShuLiang=math.floor(TML_YYSR_XS60*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS60*TML_YYSR_JiBenNum),Key=182},
									},
						[9] = {
								--{GoodsID=88916,Money=500,Point=0,ShuLiang=math.floor(TML_YYSR_XS61*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS61*TML_YYSR_JiBenNum),Key=186},
								--{GoodsID=88917,Money=300,Point=0,ShuLiang=math.floor(TML_YYSR_XS62*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS62*TML_YYSR_JiBenNum),Key=187},
								{GoodsID=88918,Money=0,Point=500,ShuLiang=math.floor(TML_YYSR_XS63*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS63*TML_YYSR_JiBenNum),Key=188},
									},
						[10] = {
								{GoodsID=38078,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=208},
								{GoodsID=38079,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=209},
								{GoodsID=38080,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=210},
								{GoodsID=38081,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=211},
								{GoodsID=38082,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=212},
								{GoodsID=38083,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=213},
								{GoodsID=38084,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=214},
								{GoodsID=38085,Money=0,Point=100,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=215},
								{GoodsID=38034,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=216},
								{GoodsID=38035,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=217},
								{GoodsID=38036,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=218},
								{GoodsID=38037,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=219},
								{GoodsID=38038,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=220},
								{GoodsID=38039,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=221},
								{GoodsID=38040,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=222},
								{GoodsID=38041,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=223},
								{GoodsID=38042,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=224},
								{GoodsID=38043,Money=0,Point=180,ShuLiang=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS64*TML_YYSR_JiBenNum),Key=225},
									},
						[12] = {
								--{GoodsID=88944,Money=0,Point=500,ShuLiang=math.floor(TML_YYSR_XS53*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS53*TML_YYSR_JiBenNum),Key=229},
								  --{GoodsID=88606,Money=0,Point=5,ShuLiang=999,AllNum=999,Key=229},--圣诞节袜子
								--{GoodsID=828,Money=0,Point=10,ShuLiang=999,AllNum=999,Key=229},--万圣节糖果
								{GoodsID=89065,Money=0,Point=20,ShuLiang=999,AllNum=999,Key=359},--周年宝箱
								{GoodsID=89131,Money=0,Point=20,ShuLiang=999,AllNum=999,Key=360},--神龙令牌
								{GoodsID=89170,Money=0,Point=50,ShuLiang=999,AllNum=999,Key=361},--端午节宝箱
								{GoodsID=88910,Money=0,Point=10,ShuLiang=999,AllNum=999,Key=362},--符文卷轴
								{GoodsID=89194,Money=0,Point=1000,ShuLiang=999,AllNum=999,Key=363},--神灯
								{GoodsID=88606,Money=0,Point=5,ShuLiang=999,AllNum=999,Key=364},--圣诞礼袜
									},
						[13] = {
								{GoodsID=11303,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=421},--花冠女王头饰[七夕纪念时装](3档)
								{GoodsID=11304,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=422},--花冠女王婚纱[七夕纪念时装](3档)
								{GoodsID=11305,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=423},--贵族礼帽[七夕纪念时装](3档)
								{GoodsID=11306,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=424},--高贵戎装[七夕纪念时装](3档)
								
								--{GoodsID=11289,Money=0,Point=500,ShuLiang=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),Key=304},
								--{GoodsID=11290,Money=0,Point=40000,ShuLiang=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),Key=305},
								{GoodsID=11289,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=304},
								{GoodsID=11290,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=305},
								{GoodsID=11285,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=341},
				                		{GoodsID=11286,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=342},
								},
						[14] = {
								{GoodsID=11303,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=425},--花冠女王头饰[七夕纪念时装](3档)
								{GoodsID=11304,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=426},--花冠女王婚纱[七夕纪念时装](3档)
								{GoodsID=11305,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=427},--贵族礼帽[七夕纪念时装](3档)
								{GoodsID=11306,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=428},--高贵戎装[七夕纪念时装](3档)
								
								--{GoodsID=11285,Money=0,Point=500,ShuLiang=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),Key=306},
								--{GoodsID=11286,Money=0,Point=40000,ShuLiang=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),AllNum=math.floor(TML_YYSR_XS1*TML_YYSR_JiBenNum),Key=307},
								{GoodsID=11285,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=306},
								{GoodsID=11286,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=307},
								{GoodsID=11289,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=343},
								{GoodsID=11290,Money=0,Point=40000,ShuLiang=999,AllNum=999,Key=344},
								
								},
						[15] = {
								--{GoodsID=88943,Money=0,Point=20,ShuLiang=999,AllNum=999,Key=336},
								--{GoodsID=89065,Money=0,Point=30,ShuLiang=999,AllNum=999,Key=336},
								--{GoodsID=89131,Money=0,Point=50,ShuLiang=999,AllNum=999,Key=336},--神龙令
								--{GoodsID=89170,Money=0,Point=15,ShuLiang=999,AllNum=999,Key=336}
								--{GoodsID=88944,Money=0,Point=500,ShuLiang=999,AllNum=999,Key=229},
								{GoodsID=89194,Money=0,Point=1000,ShuLiang=999,AllNum=999,Key=229},--神灯
								},
						[16] = {
								{GoodsID=11548,Money=0,Point=3000,ShuLiang=999,AllNum=999,Key=433},--雨林精灵头饰（女）
								{GoodsID=11549,Money=0,Point=7000,ShuLiang=999,AllNum=999,Key=434},--雨林精灵外套（女）
								{GoodsID=11550,Money=0,Point=7000,ShuLiang=999,AllNum=999,Key=435},--雨林动感外套（男）
								{GoodsID=11595,Money=0,Point=3000,ShuLiang=999,AllNum=999,Key=436},--雨林精灵帽（男）
								},
						[17] = {
								{GoodsID=88589,Money=0,Point=100,ShuLiang=999,AllNum=999,Key=180},
									},
					}
					for j in TeShuShangRen_DGGoods do
						for i in TeShuShangRen_DGGoods[j] do
							local ShuLiang = TeShuShangRen_DGGoods[j][i].ShuLiang
							local AllNum = TeShuShangRen_DGGoods[j][i].AllNum
							if ShuLiang == 0 and AllNum == 0 then
								TeShuShangRen_DGGoods[j][i].ShuLiang = 999
								TeShuShangRen_DGGoods[j][i].AllNum = 999
							end
						end
					end
					for j in TeShuShangRen_DGGoods do
						for i in TeShuShangRen_DGGoods[j] do
							local Key = TeShuShangRen_DGGoods[j][i].Key
							local AllNum = TeShuShangRen_DGGoods[j][i].AllNum
							API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,AllNum)
						end
					end
					if TeShuShangRen_ActTime == nil then
						TeShuShangRen_ActTime = {
									[1] = {ReadyHour=14,ReadyMinute=30,StartHour=15,StartMinute=0,EndHour=16,EndMinute=0},
									[2] = {ReadyHour=19,ReadyMinute=0,StartHour=19,StartMinute=30,EndHour=20,EndMinute=30},
						}
					end
					--[[
					TSSS_LinShiTable = {}
					TSSS_LinShiTable[1] = {}
					TSSS_LinShiTable[2] = {}
					for i = 1,2 do
						local a = math.random(table.getn(TeShuShangRen_LBGoods[1]))
						local b = 0
						if math.mod(a,2) == 0 then
							b = a - 1
						else
							b = a + 1
						end
						local c = table.getn(TSSS_LinShiTable[1])
						if TSSS_LinShiTable[1][c+1] == nil then TSSS_LinShiTable[1][c+1] = {} end
						TSSS_LinShiTable[1][c+1] = TeShuShangRen_LBGoods[1][a]
						if TSSS_LinShiTable[1][c+2] == nil then TSSS_LinShiTable[1][c+2] = {} end
						TSSS_LinShiTable[1][c+2] = TeShuShangRen_LBGoods[1][b]
						table.remove(TeShuShangRen_LBGoods[1],a)
						table.remove(TeShuShangRen_LBGoods[1],b)
					end
					for i = 1,2 do
						local a = math.random(table.getn(TeShuShangRen_LBGoods[2]))
						local b = 0
						if math.mod(a,2) == 0 then
							b = a - 1
						else
							b = a + 1
						end
						local c = table.getn(TSSS_LinShiTable[2])
						if TSSS_LinShiTable[2][c+1] == nil then TSSS_LinShiTable[2][c+1] = {} end
						TSSS_LinShiTable[2][c+1] = TeShuShangRen_LBGoods[2][a]
						if TSSS_LinShiTable[2][c+2] == nil then TSSS_LinShiTable[2][c+2] = {} end
						TSSS_LinShiTable[2][c+2] = TeShuShangRen_LBGoods[2][b]
						table.remove(TeShuShangRen_LBGoods[2],a)
						table.remove(TeShuShangRen_LBGoods[2],b)
					end
					TeShuShangRen_LBGoods[1] = TSSS_LinShiTable[1]
					TeShuShangRen_LBGoods[2] = TSSS_LinShiTable[2]
					TeShuShangRen_DGGoods[1] = TSSS_LinShiTable[1]
					TeShuShangRen_DGGoods[2] = TSSS_LinShiTable[2]
					]]
					if OpenTian > 2 and TML_YYSR_Switch == 0 then
						if API_GetServerID() == 1 then
							if not API_IsBattleGameServer() then
								API_ActorBDCMsg(-1,1,0,15,85,0,17,'云游商人已经刷新库存，云游商人位置：钢铁城出口处('..TML_YYSR_DGYYSR_RealX..','..TML_YYSR_DGYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,0,15,85,0,1,'云游商人已经刷新库存，云游商人位置：钢铁城出口处('..TML_YYSR_DGYYSR_RealX..','..TML_YYSR_DGYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,0,15,85,0,7,'云游商人已经刷新库存，云游商人位置：钢铁城出口处('..TML_YYSR_DGYYSR_RealX..','..TML_YYSR_DGYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,1,15,85,0,17,'云游商人已经刷新库存，云游商人位置：天空城出口处('..TML_YYSR_LBYYSR_RealX..','..TML_YYSR_LBYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,1,15,85,0,1,'云游商人已经刷新库存，云游商人位置：天空城出口处('..TML_YYSR_LBYYSR_RealX..','..TML_YYSR_LBYYSR_RealY..')')
								API_ActorBDCMsg(-1,1,1,15,85,0,7,'云游商人已经刷新库存，云游商人位置：天空城出口处('..TML_YYSR_LBYYSR_RealX..','..TML_YYSR_LBYYSR_RealY..')')
							end
						end
						API_ActorCallBack(-1,1,-1,'YYSR_JiaJuanZhou')
					end
				--end
			--end
			TML_YYSR_Switch = 0
		end
		if Hour == EndHour and Minute == EndMinute then
			API_ActorCallBack(-1,0,-1,'YYSR_ShanChuJuanZhou')
		end
	end
end

function YYSR_JiaJuanZhou(ActorID)
	local CampID = API_GetActorCamp(ActorID)
	local ActorLV = API_GetActorExpLevel(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if not API_IsBattleGameServer() then
		if ActorLV >= 15 then
			if MapID == StaticMapID then
				if CampID == 1 then
					API_ActorMsgBoard(ActorID,-1,1,'云游商人已进货，云游商人位置：天空城出口处('..TML_YYSR_LBYYSR_RealX..','..TML_YYSR_LBYYSR_RealY..')，需要的玩家请速抢购吧！您也可以直接点击右下角的卷轴购买！')
				elseif CampID == 0 then
					API_ActorMsgBoard(ActorID,-1,0,'云游商人已进货，云游商人位置：钢铁城出口处('..TML_YYSR_DGYYSR_RealX..','..TML_YYSR_DGYYSR_RealY..')，需要的玩家请速抢购吧！您也可以直接点击右下角的卷轴购买！')
				end
			end
		end
		API_RemoveTaskScroll(ActorID,60002)--删除卷轴
		--API_AddTaskScrollEx(ActorID,60002,104109,'TSSR_DuiHua',1)--加卷轴
		LRY_UItwinkemanage(ActorID,11,85,104109,60002,41,'TSSR_DuiHua')--加卷轴
	end
end

function YYSR_ShanChuJuanZhou(ActorID)
	API_RemoveTaskScroll(ActorID,60002)--删除卷轴
end

function TSSR_DuiHua(ActorID, NPCID)
	
	if ActorID == 0 or ActorID == nil then
		ActorID = API_RequestGetActorID(); 
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	API_ResponseWrite('<name>云游商人</name>')
	API_ResponseWrite('<text>我这里的东西都是</text><text color="255,0,255">独一无二的“限量版”，数量有限，您可以使用"云游代金券"购买</text><text>，需要的玩家请速抢购吧！</text><br>')
	API_ResponseWrite('<br><text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br><br>')
	API_ResponseWrite('<a href="TSSR_MaiMai?1=1">购买女装</a>')
	API_ResponseWrite('<text>                </text>')
	API_ResponseWrite('<a href="TSSR_MaiMai?1=6">购买神秘之地传送卷</a>')
	API_ResponseWrite('<text>            </text>')
	API_ResponseWrite('<a href="TSSR_MaiMai?1=9">购买特殊活动传送卷</a><br><br>')
	API_ResponseWrite('<a href="TSSR_MaiMai?1=2">购买男装</a>')
	API_ResponseWrite('<text>                </text>')
	if Month == 11 and Day >= 9 and Day <= 19 then --在活动时间内11月9日到11月19日
		API_ResponseWrite('<a href="TSSR_MaiMai?1=17">购买时装魔法包</a>')
	else
		API_ResponseWrite('<a href="TSSR_MaiMai?1=5">购买时装魔法包</a>')
	end

	API_ResponseWrite('<text>                </text>')
	
	API_ResponseWrite('<a href="TSSR_MaiMai?1=10">购买家具</a><br><br>')
	API_ResponseWrite('<a href="TSSR_MaiMai?1=3">购买特殊道具</a>')
	API_ResponseWrite('<text>            </text>')
	API_ResponseWrite('<a href="TSSR_MaiMai?1=7">购买财神宝箱</a>')
	API_ResponseWrite('<text>                  </text>')

	---------------------------------------------------------------------------------------------------------
	--if nTimeok == 1 then --夏日海滩活动时间内2010年7月13日—2010年9月7日
						   --万圣节活动时间内10月26号至11月4号（包括10.26和11.4）
						   --圣诞袜子只在圣诞活动12月16日到1月4日销售
						   --优惠大礼包在2011年09月08-10月10日
						   --万圣节活动期间2011年10月20日0点至2011年11月1日23点59分59秒增加万圣节糖果销售
						   --购买新增物品（神灯等）周20111124-20111215;1228-1,6
						   --增加圣诞限量限时抢购2011/12/23  0:0:0  -   2012/1/10   23:59:59
						   --增加新时装出售2012.03.07-2012.05.07型男装11545，淑女装11544
	local TStartTime = {Year = 2012,Month = 12,Day = 28,Hour = 0,Minute = 0,Second = 0} ;--开始时间
	local TEndTime = {Year = 2035,Month = 1,Day = 6,Hour = 23,Minute = 59,Second =59}  ;--停止时间
	local nShiFouStart = API_DiffDatatime(TStartTime.Year,TStartTime.Month,TStartTime.Day,TStartTime.Hour,TStartTime.Minute,TStartTime.Second);
	local nShiFouEnd = API_DiffDatatime(TEndTime.Year,TEndTime.Month,TEndTime.Day,TEndTime.Hour,TEndTime.Minute,TEndTime.Second);
	--时间差判断
	--if nShiFouStart > 0 then--活动未开始
	--API_Trace("2nShiFouStart"..nShiFouStart)
	--API_Trace("2nShiFouEnd"..nShiFouEnd)
	--if nShiFouStart <= 0 and nShiFouEnd > 0 then--活动时间内
	--API_Trace("2方法"..nShiFouStart)
		--API_ResponseWrite('<a href="TSSR_MaiMai?1=12">购买夏日海滩入场券</a><br><br>')
		--API_ResponseWrite('<a href="TSSR_MaiMai?1=12">购买万圣节糖果    </a><br><br>')
		 -- API_ResponseWrite('<a href="TSSR_MaiMai?1=12">购买圣诞袜子      </a><br><br>')
	--elseif nShiFouEnd >= 0 then--活动结束
	--end	
	----------------------------------------------------------------------------------------------------------
	
	API_ResponseWrite('<a href="TSSR_MaiMai?1=4">购买英雄秘籍残卷</a>')
	--if nShiFouStart <= 0 and nShiFouEnd > 0 then--活动时间内
		--API_ResponseWrite('<text>        </text>')
	--else
		API_ResponseWrite('<text>        </text><br><br>')
	--end
	API_ResponseWrite('<a href="TSSR_MaiMai?1=8">购买夺宝奇兵传送卷</a>')
	--if nShiFouStart <= 0 and nShiFouEnd > 0 then--活动时间内
		--API_ResponseWrite('<text>            </text>')
	--else
	--	API_ResponseWrite('<text>      </text>')
	--end
	--API_Trace("我是谁1")
	--API_Trace("2");
	
	if Month == 8 and Day >= 16 and Day <= 31 then --在活动时间内8月2日到8月14日
		--API_Trace("2"..ActorID)
		--API_Trace("3"..API_RequestGetActorID() .. API_GetRelation(ActorID,0,8) )
		--20110720取消结婚玩家购买的限制
		--if API_GetRelation(ActorID,0,8) ~= -1 then --已婚玩家才显示可以购买的时装。
			--API_Trace("3")
			if API_GetActorSex(ActorID) == 2 then --判断角色性别是-1表示是改角色是女性
				API_ResponseWrite('<a href="TSSR_MaiMai?1=13">      购买七夕纪念时装</a><text color="255,0,255"></text>')--女
			else
				API_ResponseWrite('<a href="TSSR_MaiMai?1=14">      购买七夕纪念时装</a><text color="255,0,255"></text>')--男
			end
		--end
	end
	if Month == 9 and Day >= 1 and Day <= 2 then --在活动时间内9月1日到9月2日
		if API_GetActorSex(ActorID) == 2 then --判断角色性别是-1表示是改角色是女性
			API_ResponseWrite('<a href="TSSR_MaiMai?1=13">      购买七夕纪念时装</a><text color="255,0,255"></text>')--女
		else
			API_ResponseWrite('<a href="TSSR_MaiMai?1=14">      购买七夕纪念时装</a><text color="255,0,255"></text>')--男
		end
	end
	--API_ResponseWrite('<a href="TSSR_MaiMai?1=15">购买周年宝箱</a>')
	--API_ResponseWrite('<text>                  </text>')
	--API_ResponseWrite('<a href="TSSR_MaiMai?1=16">购买新增物品（神灯等）</a>')
	API_ResponseWrite('<text></text>')
	--if Month == 12 and Day >= 9 and Day <= 15 then --在活动时间内购买新增物品（神灯等）周20111124-20111215
		--API_ResponseWrite('<a href="TSSR_MaiMai?1=12">购买新增物品（神灯等）              </a>')
	--end
	if nShiFouStart <= 0 and nShiFouEnd > 0 then--优惠活动时间内
		--API_ResponseWrite('<a href="HL_DuiHuaXianShiSell?1=3">购买时装（稀有时装）  </a>')
		--API_ResponseWrite('<a href="HL_DuiHuaXianShiSell?1=1">购买稀有时装</a>')
		--API_ResponseWrite('<a href="TSSR_MaiMai?1=14">购买万圣节糖果</a><text color="255,0,255"></text><br><br>')
		--API_ResponseWrite('<a href="TSSR_MaiMai?1=12">购买万圣节糖果    </a><br><br>')
		API_ResponseWrite('<a href="TSSR_MaiMai?1=12">      购买新增物品（神灯等）    </a><br><br>')
	end
	--if Year == 2012 and Month == 1 and Day == 10 then
		--API_ResponseWrite('<text>		                  </text>')
		--API_ResponseWrite('<a href="TSSR_MaiMai?1=15">购买神龙令牌</a><br><br>')
	if Year == 2017  then
		--API_ResponseWrite('<a href="TSSR_MaiMai?1=15">        购买夏日海滩入场券</a>')
		API_ResponseWrite('<a href="TSSR_MaiMai?1=15">      购买神灯许愿</a>')
	elseif	Year == 2012 and Month == 11 and Day <= 11 then
		API_ResponseWrite('<a href="TSSR_MaiMai?1=15">购买神灯</a>')
	end
	if Year == 2012 and Month == 1 and Day == 10 then
		API_ResponseWrite('<a href="HL_DuiHuaXianShiSell?1=2">购买春节百分比时装</a>')
	elseif Year == 2012 and Month == 1 and Day >= 11 and Day <= 31 then
		API_ResponseWrite('<text>                  </text>')
		API_ResponseWrite('<a href="HL_DuiHuaXianShiSell?1=2">购买春节百分比时装</a>')
	end
	API_ResponseWrite('<text>      </text>')
	if Year == 2012 and Month == 12 and Day >= 7 and Day <= 18 then
		API_ResponseWrite('<a href="HL_DuiHuaXianShiSell?1=4">降级棒礼包（限时促销）</a>')
	--elseif Year == 2012 and Month == 4 and Day == 1 then
		--API_ResponseWrite('<a href="HL_DuiHuaXianShiSell?1=4">降级棒礼包（限时促销）</a>')
	end
	
	if Year == 2012 and Month == 5 and Day == 31 then
		API_ResponseWrite('<a href="HL_DuiHuaXianShiSell?1=5">配方道具（限时促销）</a>')
	elseif Year == 2012 and Month == 6 and Day >= 1 and Day <= 11 then
		API_ResponseWrite('<a href="HL_DuiHuaXianShiSell?1=5">配方道具（限时促销）</a>')
	end
	API_ResponseWrite('<text>                </text><br><br>')
	API_ResponseWrite('<a>关闭</a>')
end

function TSSR_MaiMai()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local CampID = API_GetActorCamp(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	local StartHour = TeShuShangRen_ActTime[1].StartHour
	local GoodsTable = {}
	if CampID == 0 then --帝国
		GoodsTable = TeShuShangRen_DGGoods
	elseif CampID == 1 then --联邦
		GoodsTable = TeShuShangRen_LBGoods
	end
	if GoodsTable[SelectItem] == nil then
		return
	end
	if type(GoodsTable[SelectItem]) ~= 'table' then
		return
	end
	--防沉迷判断
	if API_ActorIsEarnings (ActorID) then 
		API_ResponseWrite('<name>云游商人</name>')
		API_ResponseWrite('<text>您目前处于防沉迷状态，不能购买该道具，请到官网帐号管理(http://fcm.qq.com/)，查询补填方法。补填后未成年保护解除。</text><br><br>')
		API_ResponseWrite('<a>确定</a>')
		return
	end
	
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if GoodsTable[SelectItem][BuyNo] ~= nil then
			local BuyGoodsID = GoodsTable[SelectItem][BuyNo].GoodsID
			local BuyPoint = GoodsTable[SelectItem][BuyNo].Point
			local BuyMoney = GoodsTable[SelectItem][BuyNo].Money
			local Key = GoodsTable[SelectItem][BuyNo].Key
			local ZongNum = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
			
			if BuyGoodsID == 89065 and ZongNum == 0 then
				ZongNum = 999
			end
			local BuyNum = API_RequestGetNumber(num)
			if ZongNum > 0 then
				if BuyNum < 1 then
					BuyNum = 1
				elseif BuyNum > ZongNum then
					BuyNum = ZongNum
				end
				if BuyGoodsID == 88065 then
					BuyNum = 1
					if API_ActorGetGoodsNum(ActorID,BuyGoodsID) > 0 then
						API_ResponseWrite('<name>云游商人</name>')
						API_ResponseWrite('<text>您已经拥有该物品了，不能再购买</text><br><br>')
						API_ResponseWrite('<a>确定</a>')
						return
					end
				end
				BuyMoney = BuyMoney * BuyNum
				BuyPoint = BuyPoint * BuyNum
				if BuyMoney < 0 or BuyMoney > 100000000 or BuyPoint < 0 or BuyPoint > 100000000 then
					return
				end
				if BuyMoney > 0 then
					if API_ActorGetPropNum(ActorID,183) >= BuyMoney then
						if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
							if API_UsePoint(ActorID, 3, BuyGoodsID, BuyNum, BuyMoney) == 0 then
								ZongNum = ZongNum - BuyNum
								API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,ZongNum)
								API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'云游商人购买')
								API_ResponseWrite('<name>云游商人</name>')
								API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
								API_ResponseWrite('<text>您花费</text><text color="255,0,255">'..BuyMoney..'</text><text>点券购买了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
								API_ResponseWrite('<br><br><a>确定</a>')
								--风向标
								if GLOBAL_FengXiangBiao_DateList[22][BuyGoodsID] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[22][BuyGoodsID][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[22][BuyGoodsID][LaiYuan] = BuyNum
									else
										GLOBAL_FengXiangBiao_DateList[22][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[22][BuyGoodsID][LaiYuan] + BuyNum
									end
								end
							end
						else
							API_ResponseWrite('<name>云游商人</name>')
							API_ResponseWrite('<text>您的背包空间不足，无法购买</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name>云游商人</name>')
						API_ResponseWrite('<text>您的点券数量不够，无法购买</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				elseif BuyPoint > 0 then
					if API_ActorGetGoodsNum(ActorID,TML_YYSR_YYDJQID) >= BuyPoint then
						if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
							if API_ActorRemoveGoods(ActorID,TML_YYSR_YYDJQID,BuyPoint,"删除对应价格数量的云游代金券") then
								ZongNum = ZongNum - BuyNum
								--GoodsTable[SelectItem][BuyNo].ShuLiang = ZongNum
								API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,ZongNum)
								if BuyGoodsID == 88065 then
									ShuangBeiJingYan_AddCZK(ActorID)
								else
									API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'云游商人购买')
								end
								API_ResponseWrite('<name>云游商人</name>')
								API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
								API_ResponseWrite('<text>您花费</text><text color="255,0,255">'..BuyPoint..'张</text><text>云游代金券购买了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
								API_ResponseWrite('<br><br><a>确定</a>')
								--风向标
								if GLOBAL_FengXiangBiao_DateList[22][BuyGoodsID] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[22][BuyGoodsID][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[22][BuyGoodsID][LaiYuan] = BuyNum
									else
										GLOBAL_FengXiangBiao_DateList[22][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[22][BuyGoodsID][LaiYuan] + BuyNum
									end
								end
							end
						else
							API_ResponseWrite('<name>云游商人</name>')
							API_ResponseWrite('<text>您的背包空间不足，无法购买</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name>云游商人</name>')
						API_ResponseWrite('<text>您的云游代金券数量不够，无法购买</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				end
			else
				API_ResponseWrite('<name>云游商人</name>')
				API_ResponseWrite('<text>该物品已售空</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
			end
		end
		return
	end
	local GoodsNum = table.getn(GoodsTable[SelectItem])
	local Num = 0
	local Num2 = 0
	local Num3 = 0
	for i in GoodsTable[SelectItem] do 
		local GoodsID = GoodsTable[SelectItem][i].GoodsID
		local Key = GoodsTable[SelectItem][i].Key
		local GoodsNum = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
		Num = Num + GoodsNum
		if GoodsID == 88065 then
			Num2 = GoodsNum
		elseif GoodsID == 31014 then
			Num3 = GoodsNum
		end
		if GoodsID == 89065 and GoodsNum == 0 then
			Num = 999
		end
	end
	if SelectItem == 1 then
		--if Num <= 0 or Week < 3 or (Week == 3 and Hour < StartHour) or ((Week == 4 and Hour >= StartHour) and (Week < 5)) or (Week == 5 and Hour < StartHour) then
		 if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">所有女性时装已经被抢购一空</text><text>，我会在每</text><text color="255,0,255">周三、周五、周六和周日的15:00和19:30</text><text>去进货女性时装。</text><br>')
			API_ResponseWrite('<text>请看看其他商品吧！</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>女性时装</name>')
	elseif SelectItem == 2 then
		--if Num <= 0 or Week < 3 or (Week == 3 and Hour < StartHour) or ((Week == 4 and Hour >= StartHour) and (Week < 5)) or (Week == 5 and Hour < StartHour) then
		if Num <= 0 then	
			API_ResponseWrite('<text color="255,0,255">所有男性时装已经被抢购一空</text><text>，我会在每</text><text color="255,0,255">周三、周五、周六和周日的15:00和19:30</text><text>去进货男性时装。</text><br>')
			API_ResponseWrite('<text>请看看其他商品吧！</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>男性时装</name>')
	elseif SelectItem == 3 then
		if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">所有特殊道具已经被抢购一空</text><text>，我会在每天的</text><text color="255,0,255">15:00和19:30</text><text>去进货。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		elseif (Week < 5 and (Num2 + Num3) == Num) or (Week == 5 and Hour < StartHour and (Num2 + Num3) == Num) then
			API_ResponseWrite('<text color="255,0,255">所有特殊道具已经被抢购一空</text><text>，我会在每天的</text><text color="255,0,255">15:00和19:30</text><text>去进货。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>特殊道具</name>')
	elseif SelectItem == 4 then
		if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">所有英雄秘籍残卷已经被抢购一空</text><text>，我会在每天的</text><text color="255,0,255">15:00和19:30</text><text>去进货。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>英雄秘籍残卷</name>')
	elseif SelectItem == 5 then
		if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">所有时装魔法包已经被抢购一空</text><text>，我已经抓紧时间去进货了，请稍等片刻。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>时装魔法包</name>')
	elseif SelectItem == 6 then
		if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">所有神秘之地传送卷已经被抢购一空</text><text>，我已经抓紧时间去进货了，请稍等片刻。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>神秘之地传送卷</name>')
	elseif SelectItem == 7 then
		local SuiJiShu = math.random(100,300)
		API_VarDataSetNumber_Ex(1,0,OwnerID,1,17,SuiJiShu)
		API_VarDataSetNumber_Ex(1,0,OwnerID,1,47,SuiJiShu)
		if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">所有财神宝箱已经被抢购一空</text><text>，我已经抓紧时间去进货了，请稍等片刻。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>财神宝箱</name>')
	elseif SelectItem == 8 then
		if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">所有夺宝奇兵传送卷已经被抢购一空</text><text>，我已经抓紧时间去进货了，请稍等片刻。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>夺宝奇兵传送卷</name>')
	elseif SelectItem == 9 then
		if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">所有特殊活动传送卷已经被抢购一空</text><text>，我已经抓紧时间去进货了，请稍等片刻。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>特殊活动传送卷</name>')
	elseif SelectItem == 10 then
		if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">所有家具已经被抢购一空</text><text>，我已经抓紧时间去进货了，请稍等片刻。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>家具</name>')
	elseif SelectItem == 12 then
		if Num <= 0 then
			--API_ResponseWrite('<text color="255,0,255">所有夏日海滩入场券已经被抢购一空</text><text>，我已经抓紧时间去进货了，请稍等片刻。</text><br>')
			--API_ResponseWrite('<text color="255,0,255">所有万圣节糖果已经被抢购一空</text><text>，我已经抓紧时间去进货了，请稍等片刻。</text><br>')
			API_ResponseWrite('<text color="255,0,255">所有新增物品（神灯等）已经被抢购一空</text><text>，我已经抓紧时间去进货了，请稍等片刻。</text><br>')
			  --API_ResponseWrite('<text color="255,0,255">所有圣诞袜子已经被抢购一空</text><text>，我已经抓紧时间去进货了，请稍等片刻。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		--API_ResponseWrite('<name>万圣节糖果</name>')
		API_ResponseWrite('<name>新增物品（神灯等）</name>')
		--API_ResponseWrite('<name>圣诞袜子</name>')
	elseif SelectItem == 13 then
		if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">七夕纪念时装已经被抢购一空</text><text>，我已经抓紧时间去进货了，请稍等片刻。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>七夕纪念时装</name>')
	elseif SelectItem == 14 then
		if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">七夕纪念时装已经被抢购一空</text><text>，我已经抓紧时间去进货了，请稍等片刻。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>七夕纪念时装</name>')
	elseif SelectItem == 15 then
		if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">所有神灯已经被抢购一空</text><text>，我已经抓紧时间去进货了，请稍等片刻。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>端午节宝箱</name>')
	elseif SelectItem == 16 then
		if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">新时装已经被抢购一空</text><text>，我已经抓紧时间去进货了，请明天抢购。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>新增物品（神灯等）</name>')
	elseif SelectItem == 17 then
		if Num <= 0 then
			API_ResponseWrite('<text color="255,0,255">时魔法包已经被抢购一空</text><text>，我已经抓紧时间去进货了，请明天抢购。</text><br>')
			API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
			return
		end
		API_ResponseWrite('<name>时装魔法包</name>')
	end
	API_ResponseWrite('<win rect="30,75,500,510"></win>')
	if SelectItem == 3 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br>')
		API_ResponseWrite('<text color="255,0,255">本栏多数道具都会在每天的15:00和19:30进货（某些道具仅周末有货）</text><br><br>')
	elseif SelectItem == 1 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br>')
		API_ResponseWrite('<text color="255,0,255">女装会在周三、周五、周六和周日每天的15:00和19:30进货</text><br><br>')
	elseif SelectItem == 2 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br>')
		API_ResponseWrite('<text color="255,0,255">男装会在周三、周五、周六和周日每天的15:00和19:30进货</text><br><br>')
	elseif SelectItem == 4 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br>')
		API_ResponseWrite('<text color="255,0,255">英雄秘籍残卷会在每天的15:00和19:30进货</text><br><br>')
	elseif SelectItem == 5 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br><br>')
	elseif SelectItem == 6 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br><br>')
	elseif SelectItem == 7 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br><br>')
	elseif SelectItem == 8 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br><br>')
	elseif SelectItem == 9 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br><br>')
	elseif SelectItem == 10 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br><br>')
	elseif SelectItem == 12 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br><br>')
	elseif SelectItem == 13 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><text color="255,255,0"></text><br><br>')
	elseif SelectItem == 14 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><text color="255,255,0"></text><br><br>')
	elseif SelectItem == 15 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br><br>')
	elseif SelectItem == 16 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br><br>')
	elseif SelectItem == 17 then
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br><br>')
	end
	for i = 1,GoodsNum do
		if i > Page * 6 and i < (Page + 1) * 6 + 1 then
			local BuyGoodsID = GoodsTable[SelectItem][i].GoodsID
			local BuyPoint = GoodsTable[SelectItem][i].Point
			local BuyMoney = GoodsTable[SelectItem][i].Money
			--local ZongNum = GoodsTable[SelectItem][i].ShuLiang
			local AllNum = GoodsTable[SelectItem][i].AllNum
			local Key = GoodsTable[SelectItem][i].Key
			local ZongNum = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
			if BuyGoodsID == 89065 and ZongNum == 0 then
				ZongNum = 999
			end 
			
			--if BuyGoodsID == 89066 and ZongNum == 0 then
			--	ZongNum = 0
			--end
			
			if AllNum >= 1 then
				if Week == 1 or Week == 2 or Week == 3 or Week == 4 then
					if  BuyGoodsID ~= 31014 then
					--if BuyGoodsID ~= 88065 and BuyGoodsID ~= 31014 then
						API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
						API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
						local BuyNumTip = ''
						local BuyPointTip = '<text>  单价：'..string.format("%-7s",BuyPoint..'张')..' </text>'
						BuyPointTip = BuyPointTip ..'<text color="254,249,220">云游代金券</text>'
						BuyPointTip = BuyPointTip..'<text>   剩余库存：'..string.format("%-11s",ZongNum..'/'..AllNum)..'   </text>'
						local BuyMoneyTip = '<text>  单价：'..string.format("%-4s",BuyMoney)..' </text>'
						BuyMoneyTip = BuyMoneyTip..'<text color="254,249,220">点券</text>'
						BuyMoneyTip = BuyMoneyTip..'<text>   剩余库存：'..string.format("%-11s",ZongNum..'/'..AllNum)..'          </text>'
						if BuyPoint == 0 then
							BuyNumTip = BuyMoneyTip
						elseif BuyPoint ~= 0 then
							BuyNumTip = BuyPointTip
						end
						local BuyNumTipLen = string.len(BuyNumTip)
						if BuyNumTipLen < 44 then
							for j = 1,44 - BuyNumTipLen do
								BuyNumTip = BuyNumTip..' '
							end
						end
						API_ResponseWrite(''..BuyNumTip..'')
						local num = i * 100
						API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
						API_ResponseWrite('<text> </text>')
						API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" href="TSSR_MaiMai?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
						API_ResponseWrite('<text>—————————————————————————————————————</text><br>')
					end
				elseif Week == 5 or Week == 6 or Week == 7 then
					if Week == 5 and Hour < StartHour then
						if BuyGoodsID ~= 31014 then
						--if BuyGoodsID ~= 88065 and BuyGoodsID ~= 31014 then
							API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
							API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
							local BuyNumTip = ''
							local BuyPointTip = '<text>  单价：'..string.format("%-7s",BuyPoint..'张')..' </text>'
							BuyPointTip = BuyPointTip ..'<text color="254,249,220">云游代金券</text>'
							BuyPointTip = BuyPointTip..'<text>   剩余库存：'..string.format("%-11s",ZongNum..'/'..AllNum)..'   </text>'
							local BuyMoneyTip = '<text>  单价：'..string.format("%-4s",BuyMoney)..' </text>'
							BuyMoneyTip = BuyMoneyTip..'<text color="254,249,220">点券</text>'
							BuyMoneyTip = BuyMoneyTip..'<text>   剩余库存：'..string.format("%-11s",ZongNum..'/'..AllNum)..'          </text>'
							if BuyPoint == 0 then
								BuyNumTip = BuyMoneyTip
							elseif BuyPoint ~= 0 then
								BuyNumTip = BuyPointTip
							end
							local BuyNumTipLen = string.len(BuyNumTip)
							if BuyNumTipLen < 44 then
								for j = 1,44 - BuyNumTipLen do
									BuyNumTip = BuyNumTip..' '
								end
							end
							API_ResponseWrite(''..BuyNumTip..'')
							local num = i * 100
							API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
							API_ResponseWrite('<text> </text>')
							API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" href="TSSR_MaiMai?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
							API_ResponseWrite('<text>—————————————————————————————————————</text><br>')
						end
					else
						API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
						API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
						local BuyNumTip = ''
						local BuyPointTip = '<text>  单价：'..string.format("%-7s",BuyPoint..'张')..' </text>'
						BuyPointTip = BuyPointTip ..'<text color="254,249,220">云游代金券</text>'
						BuyPointTip = BuyPointTip..'<text>   剩余库存：'..string.format("%-11s",ZongNum..'/'..AllNum)..'   </text>'
						local BuyMoneyTip = '<text>  单价：'..string.format("%-4s",BuyMoney)..' </text>'
						BuyMoneyTip = BuyMoneyTip..'<text color="254,249,220">点券</text>'
						BuyMoneyTip = BuyMoneyTip..'<text>   剩余库存：'..string.format("%-11s",ZongNum..'/'..AllNum)..'          </text>'
						if BuyPoint == 0 then
							BuyNumTip = BuyMoneyTip
						elseif BuyPoint ~= 0 then
							BuyNumTip = BuyPointTip
						end
						local BuyNumTipLen = string.len(BuyNumTip)
						if BuyNumTipLen < 44 then
							for j = 1,44 - BuyNumTipLen do
								BuyNumTip = BuyNumTip..' '
							end
						end
						API_ResponseWrite(''..BuyNumTip..'')
						local num = i * 100
						API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
						API_ResponseWrite('<text> </text>')
						API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" href="TSSR_MaiMai?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
						API_ResponseWrite('<text>—————————————————————————————————————</text><br>')
					end
				end
			end
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
			API_ResponseWrite('<a href="TSSR_DuiHua">返回</a>')
			API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="TSSR_MaiMai?1='..SelectItem..'&2='..NextPage..'">')
		elseif (Page + 1) * 6 < GoodsNum then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="TSSR_MaiMai?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
			API_ResponseWrite('<a href="TSSR_DuiHua">返回</a>')
			API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="TSSR_MaiMai?1='..SelectItem..'&2='..NextPage..'">')
		else
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="TSSR_MaiMai?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
			API_ResponseWrite('<a href="TSSR_DuiHua">返回</a>')
			API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_g.bmp">')
		end
	else
		API_ResponseWrite('<br><a href="TSSR_DuiHua">  返回</a>')
	end
end
API_AddLUAReqFunc('SkillGoods_FriendBeer')

if API_GetServerID() == 1 then
	if YYSR_addKuCun ~= nil then
		API_DestroyTriggerG(YYSR_addKuCun)
	end
	YYSR_addKuCun = API_CreateTimerTriggerG(0,0,20,-1,'YYSR_BuKuCun')
end

function YYSR_BuKuCun(a,b)
	if math.random(1, 5) == 1 then	--丢骰子，如果丢中
		if GLOBAL_GameOnlineNum_OnLoadIDataOK == 1 then	--判断人数是否LOAD OK
			YYSR_ZhiXingBuKuCun()	--如果OK就执行YYSR_ZhiXingBuKuCun
		end	--否则什么不做
	end
end

-- 自动购买的数量什么范围随机，注意后面一个数必须大于前面的，两者表示总库存的百分比
YYSR_Autobuynum1 = 50
YYSR_Autobuynum2 = 70
function YYSR_ZhiXingBuKuCun()
	TML_YYSR_Switch = 1
	Year_090731,Month_090731,Day_090731,Hour_090731,Minute_090731,Second_090731,Week_090731 = PublicFun_time()
	if Minute_090731-1 < 0 then return end
	TeShuShangRen_ActTime = {
				[1] = {ReadyHour=Hour_090731,ReadyMinute=Minute_090731-1,StartHour=Hour_090731,StartMinute=Minute_090731,EndHour=Hour_090731+1,EndMinute=Minute_090731},
				[2] = {ReadyHour=Hour_090731,ReadyMinute=Minute_090731-1,StartHour=Hour_090731,StartMinute=Minute_090731,EndHour=Hour_090731+1,EndMinute=Minute_090731},
	}
	TSSR_TimerTriggerGCallFunc(0,0)
	TeShuShangRen_ActTime = {
				[1] = {ReadyHour=14,ReadyMinute=30,StartHour=15,StartMinute=0,EndHour=16,EndMinute=0},
				[2] = {ReadyHour=19,ReadyMinute=0,StartHour=19,StartMinute=30,EndHour=20,EndMinute=30},
	}
	
	if TeShuShangRen_LBGoods ~= nil then
		for i in TeShuShangRen_LBGoods do
			for j in TeShuShangRen_LBGoods[i] do
				local Key = TeShuShangRen_LBGoods[i][j].Key
				local OwnerID = -4003
				local ShuLiang = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				local AllNum = TeShuShangRen_LBGoods[i][j].AllNum
				if ShuLiang ~= 0 then
					local buybili = math.random(YYSR_Autobuynum1, YYSR_Autobuynum2) / 100
					ShuLiang = ShuLiang - math.floor(AllNum * buybili)
					if ShuLiang >= 0 then
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,ShuLiang)
					else
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,0)
					end
				end
			end
		end
	end
	if TeShuShangRen_DGGoods ~= nil then
		for i in TeShuShangRen_DGGoods do
			for j in TeShuShangRen_DGGoods[i] do
				local Key = TeShuShangRen_DGGoods[i][j].Key
				local OwnerID = -4003
				local ShuLiang = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				local AllNum = TeShuShangRen_DGGoods[i][j].AllNum
				if ShuLiang ~= 0 then
					local buybili = math.random(YYSR_Autobuynum1, YYSR_Autobuynum2) / 100
					ShuLiang = ShuLiang - math.floor(AllNum * buybili)
					if ShuLiang >= 0 then
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,ShuLiang)
					else
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,0)
					end
				end
			end
		end
	end
end


---------------------------------------------------------------------------------------------------------------
--NPC购买链接：限量具体购买
function HL_DuiHuaXianShiSell(ActorID, NPCID)
	if ActorID == 0 or ActorID == nil then
		ActorID = API_RequestGetActorID(); 
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	--API_Trace('HL_DuiHuaXianShiSell='..Hour)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local CampID = API_GetActorCamp(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	--API_Trace('SelectItem='..SelectItem)
	local GoodsTable = HL_LBGoodsList
	
	--local BuyNo = API_RequestGetNumber(3)
	--API_Trace('BuyNo='..BuyNo)
	
	if GoodsTable[SelectItem] == nil then
		--API_Trace('MapID='..MapID)
		return
	end
	if type(GoodsTable[SelectItem]) ~= 'table' then
		return
	end
	--local BuyNo = API_RequestGetNumber(3)
	--API_Trace('SelectItem='..SelectItem)
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if GoodsTable[SelectItem][BuyNo] ~= nil then
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
			local YMD = Year * 10000 + Month * 100 + Day
			local GoodsID = GoodsTable[SelectItem][BuyNo].GoodsID
			local Point = GoodsTable[SelectItem][BuyNo].Point
			local Data = GoodsTable[SelectItem][BuyNo].Data
			local Max = GoodsTable[SelectItem][BuyNo].Max
			local BuyNum = API_RequestGetNumber(num)
		
			if BuyNum < 1 then
				BuyNum = 1
			elseif BuyNum > 999 then
				BuyNum = 999
			end
			--云游物品ID是80818；身上云游
			local PTNum = API_ActorGetGoodsNum(ActorID,80818)
			--API_Trace("PTNum"..PTNum)
			--[[if Data > 0 and Max > 0 then
				local Num = API_VarDataGetNumber_Ex(1,0,-6014,1,Data)
				if Num >= Max then
					API_ResponseWrite('<text>该物品已售完，请明天再来。</text><br>')
					API_ResponseWrite('<br><a href="TSSR_DuiHua">  返回</a>')
					return
				end
				if BuyNum > Num then
					BuyNum = Num
				end
			end]]
			--全局交互数据  
				local Num = API_VarDataGetNumber_Ex(1,0,-6014,1,Data)
				if Num + BuyNum > Max then
					BuyNum = Max - Num
				end
				if BuyNum <= 0 then
					if SelectItem ==1 then
						API_ResponseWrite('<text>每天只能购买'..Max..'个'..API_GetGoodsName(GoodsID)..'，该物品今天已售完，请明天12点再来购买。</text><br>')
						API_ResponseWrite('<br><a href="TSSR_DuiHua">  返回</a>')
						return
					elseif SelectItem ==2 then
						API_ResponseWrite('<text>每次最多刷新'..Max..'个'..API_GetGoodsName(GoodsID)..'，该物品本次刷新已售完，请每周四或者周日12点再来购买。</text><br>')
						API_ResponseWrite('<br><a href="TSSR_DuiHua">  返回</a>')
						return
					end
				end
			--API_Trace("Point"..Point)
			PT = Point * BuyNum --购买所需钱
			--API_Trace("PT"..PT)
			--[[if API_ActorCanAddGoods(ActorID,GoodsID,BuyNum,0,0) ~= -1 then		
			else
				API_ResponseWrite('<text>背包空间不足，无法兑换。</text><br>')
				API_ResponseWrite('<br><a href="TSSR_DuiHua">  返回</a>')
			end]]
	
			if PT > 0 then
				if PTNum >= PT then
						if API_ActorCanAddGoods(ActorID,GoodsID,BuyNum,0,0) ~= -1 then
							if API_ActorRemoveGoods(ActorID,80818,PT,"云游商人删除") then
								if Data > 0 and Max > 0 then
									local Num = API_VarDataGetNumber_Ex(1,0,-6014,1,Data)
									Num = Num + BuyNum
									API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,Data,Num)
								end
								API_AddActorGoodsFlag(ActorID, GoodsID, BuyNum, 0, '云游购买')
								API_ActorSendMsg(ActorID,7,'使用'..PT..'个'..API_GetGoodsName(80818)..'购买了：'..API_GetGoodsName(GoodsID)..'  × '..BuyNum..'')
								API_ResponseWrite('<name>云游商人</name>')
								API_ResponseWrite('<text>购买获得：</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
								API_ResponseWrite('<text>您花费</text><text color="255,0,255">'..PT..'</text><text>云游代金券购买了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(GoodsID)..'</text><br><br>')
								API_ResponseWrite('<br><a href="TSSR_DuiHua">  返回</a>')
								--风向标
								if GLOBAL_FengXiangBiao_DateList[22][GoodsID] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[22][GoodsID][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[22][GoodsID][LaiYuan] = BuyNum
									else
										GLOBAL_FengXiangBiao_DateList[22][GoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[22][GoodsID][LaiYuan] + BuyNum
									end
								end
							end
						else
							API_ResponseWrite('<text>背包空间不足，无法购买。</text><br>')
							API_ResponseWrite('<br><a href="TSSR_DuiHua">  返回</a>')
						end
				else
						API_ResponseWrite('<text>你的'..API_GetGoodsName(80818)..'数量不足，无法购买。</text><br>')
						API_ResponseWrite('<br><a href="TSSR_DuiHua">返回</a>')
				end
			end
		end
		return
	end
	local GoodsNum = table.getn(GoodsTable[SelectItem])
	API_ResponseWrite('<name>云游商人</name>')
	API_ResponseWrite('<win rect="30,75,500,510"></win>')
	if SelectItem ==1 then
		API_ResponseWrite('<text color="255,0,225">            *****每种限量3个*****</text><br><br>')
	elseif SelectItem ==2 then 
		API_ResponseWrite('<text color="255,0,225">            *****每种限量1个*****</text><br><br>')
	elseif SelectItem ==3 then 
		API_ResponseWrite('<text color="255,0,225">            *****每种限量2个*****</text><br><br>')
	elseif SelectItem ==4 or SelectItem == 5 then 
		API_ResponseWrite('<text color="255,0,225">            *****每种限量5个*****</text><br><br>')
	end

	for i = 1,GoodsNum do
		if i > Page * 6 and i < (Page + 1) * 6 + 1 then
			local GoodsID = GoodsTable[SelectItem][i].GoodsID
			local PT = GoodsTable[SelectItem][i].Point
			local Data = GoodsTable[SelectItem][i].Data
			local Max = GoodsTable[SelectItem][i].Max
			API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(GoodsID)..'</text><br>')
			API_ResponseWrite('<img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'">')
			local BuyNumTip = '  购买需要：'
			if PT > 0 then
				BuyNumTip = BuyNumTip..''..API_GetGoodsName(80818)..' x '..PT..'  '
			end
			if Data > 0 and Max > 0 then
				local Num = API_VarDataGetNumber_Ex(1,0,-6014,1,Data)
				local a = Max - Num
				BuyNumTip = BuyNumTip..'剩余库存'..'('..a..'/'..Max..')  '
			end
			local BuyNumTipLen = string.len(BuyNumTip)
			if BuyNumTipLen < 50 then
				for j = 1,50- BuyNumTipLen do
					BuyNumTip = BuyNumTip..' '
				end
			end
			API_ResponseWrite('<text color="255,0,255">'..BuyNumTip..'</text>')
			local num = i * 100
			API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
			API_ResponseWrite('<text> </text>')
			API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" close="0" href="HL_DuiHuaXianShiSell?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
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
			API_ResponseWrite('<a href="TSSR_DuiHua">返回</a>')
			API_ResponseWrite('<text>                   </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="HL_DuiHuaXianShiSell?1='..SelectItem..'&2='..NextPage..'">')
		elseif (Page + 1) * 6 < GoodsNum then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="HL_DuiHuaXianShiSell?1='..SelectItem..'&2='..BackPage..'"><text>                   </text>')
			API_ResponseWrite('<a href="TSSR_DuiHua">返回</a>')
			API_ResponseWrite('<text>                   </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="HL_DuiHuaXianShiSell?1='..SelectItem..'&2='..NextPage..'">')
		else
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="HL_DuiHuaXianShiSell?1='..SelectItem..'&2='..BackPage..'"><text>                   </text>')
			API_ResponseWrite('<a href="TSSR_DuiHua">返回</a>')
			API_ResponseWrite('<text>                   </text><img src="LuaUse\\button_next_g.bmp">')
		end
	else
		API_ResponseWrite('<br><a href="TSSR_DuiHua">  返回</a>')
	end	
end
--跨天12点清除：新增物品（神灯等）
function Meiriyunyou_ShuJuQingChu(Param1,Param2)
--API_Trace('222')
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local NowTime = os.time()
	--API_Trace('Week'..Week)
	if API_GetServerID() == 1 then
		if NowTime > API_VarDataGetNumber_Ex(1,0,-6014,1,100) then
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,168,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,171,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,172,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,173,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,174,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,175,0)
			--API_Trace('222')
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,1,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,2,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,3,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,4,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,5,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,6,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,7,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,8,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,9,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,10,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,11,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,12,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,13,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,14,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,15,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,16,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,17,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,18,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,19,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,20,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,21,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,22,0) 
			
			--备注，下次注释掉31版本后
			
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,196,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,197,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,198,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,199,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,200,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,201,0) 
			   
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,202,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,203,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,204,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,205,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,206,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,207,0) 
			
			local NowTime = os.date("*t", os.time()) 
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 12 
			NowTime.min = 0 
			NowTime.sec = 0 
			local NextTime = os.time(NowTime) 
			RefreshTimeSofieTwo = NextTime + 86400   
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,100,RefreshTimeSofieTwo)                  
		end
		if Week == 4 or Week == 7 then
			--API_Trace('NowTime='..NowTime)
			local ny = API_VarDataGetNumber_Ex(1,0,-6014,1,167)
			--API_Trace('ny='..ny)
			if NowTime > API_VarDataGetNumber_Ex(1,0,-6014,1,167) then
			
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,151,0)
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,152,0)
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,153,0)
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,154,0) 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,155,0) 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,156,0) 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,157,0) 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,158,0) 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,159,0) 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,160,0) 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,161,0) 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,162,0) 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,163,0) 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,164,0) 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,165,0) 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,166,0) 
				local NowTime = os.date("*t", os.time()) 
				NowTime.year = Year
				NowTime.month = Month
				NowTime.day = Day
				NowTime.hour = 12
				NowTime.min = 0 
				NowTime.sec = 0 
				local NextTime = os.time(NowTime)
				--API_Trace('NextTime='..NextTime) 
				local Time = 0 
				if Week == 4 then
					Time = 259200
				elseif Week == 7 then
					Time = 345600
				end
				--API_Trace('Time='..Time)
				RefreshTimeSofieOne = NextTime + Time 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,167,RefreshTimeSofieOne)
			end
		end
		if Week == 1 or Week == 3 or Week == 5 then
			--API_Trace('NowTime='..NowTime)
			local nyy = API_VarDataGetNumber_Ex(1,0,-6014,1,170)
			--API_Trace('nyy='..nyy)
			if NowTime > API_VarDataGetNumber_Ex(1,0,-6014,1,170) then
			
				
				
				--API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,184,0)
				--API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,185,0)
				--API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,186,0)
				--API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,187,0)
				
				--API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,188,0)
				--API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,189,0)
				--API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,190,0)
				--API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,191,0)
				--API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,192,0)
				--API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,193,0)
				--API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,194,0)
				--API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,195,0)
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,208,0)
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,209,0)
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,210,0)
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,211,0)
				
				local NowTime = os.date("*t", os.time()) 
				NowTime.year = Year
				NowTime.month = Month
				NowTime.day = Day
				NowTime.hour = 12
				NowTime.min = 0 
				NowTime.sec = 0 
				local NextTime = os.time(NowTime)
				--API_Trace('NextTime='..NextTime) 
				local Time = 0 
				if Week == 1 then
					Time = 172800
				elseif Week == 3 then
					Time = 172800
				elseif Week == 5 then
					Time = 259200
				end
				--API_Trace('Time='..Time)
				RefreshTimeSofieOneSZ = NextTime + Time 
				API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,170,RefreshTimeSofieOneSZ)
			end
		end
		if NowTime > API_VarDataGetNumber_Ex(1,0,-6014,1,182) then
			
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,176,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,177,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,178,0)
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,179,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,180,0) 
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,181,0) 
			  
			local NowTime = os.date("*t", os.time()) 
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 19 
			NowTime.min = 0 
			NowTime.sec = 0 
			local NextTime = os.time(NowTime) 
			RefreshTimeSofiejjb = NextTime + 86400   
			API_VarDataSetNumber_Ex_Sync(1,0,-6014,1,182,RefreshTimeSofiejjb)                  
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

