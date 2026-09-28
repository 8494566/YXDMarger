----------------------遗迹之城（55-65）
----------------------3月17日 林瑞宇制作
----------------------详细注释风格 灵活的框架体
----------------------BEGIN
--变量部分
local nengliangyuan = 80946  --能量源 在遗迹之城每分钟消耗的
local nengliangyuannum =  1 --每次掉落的能量源数量
local nengliangyuansuijilv = 80 --能量源掉率

local feitingguanliyuanid = 12307 --光明遗迹飞艇管理员ID
local feitingguanliyuanid2 = 12317 --遗迹都市的飞艇管理员ID
--光明遗迹飞艇管理员坐标
local feitingguanliyuanX = 582
local feitingguanliyuanY = 382
--天空城联邦飞艇管理员坐标
local LB_feitingguanliyuanX = 415
local LB_feitingguanliyuanY = 190
--天空城帝国飞艇管理员坐标
local DG_feitingguanliyuanX = 518
local DG_feitingguanliyuanY = 187

local feitingxiaohaodejinbi = 10000 --飞艇消耗的金币 
local yijidushibegintime = 0 --遗迹都市可进入时间
local yijidushiovertime = 24 --遗迹都市关闭时间
local yijidushiovertime2 = 24 --24点关闭 23点40开始禁止进入 
local yijidushiovertime3 = 40
local yijidushilvneed = 52
local nengliangyuanmin = 20 --进入上面最少的能量源数量 10-20个

local yijidushipeizhimapid = 130 --遗迹之城的配置地图ID
local yijidushilianbangx = 415 --联邦进入坐标X
local yijidushilianbangy = 182 --联邦进入坐标Y
local yijidushidiguox = 524 --帝国进入坐标X
local yijidushidiguoy = 181 --帝国进入坐标Y

local jingyuankapaiid = 80949 --卡牌ID
local jingyuankapainum = 1	--卡牌数量
local jingyuanduihuanguanid = 12321 --卡牌兑换官ID
local yijidushishenmikongjian = 2030 --牌子打BOSS地方的配置地图ID
local yijidushishenmikongjianX = 88 --神秘空间传入点X
local yijidushishenmikongjianY = 58	--神秘空间传入点Y

local qianxianzhihuiguan1 = 12318 --前线指挥官ID
local qianxianzhihuiguan2 = 12319
local qianxianzhihuiguan3 = 12320
local qianxianzhihuiguan4 = 12331
local qianxianzhihuiguan5 = 12332
local chongche1 = 904009
local chongche2 = 904010

local jixiewulibing56 = 901056
local jixiehuoyaobing56 = 902056
local jixiemofabing56 = 903056
local jyjixiewulibing57 = 905001
local jyjixiehuoyaobing57 = 905007
local jyjixiemofabing57 = 905011
--巡逻队
local jixiewulibing58 = 901058
local jixiehuoyaobing58 = 902058
local jixiemofabing58 = 903058
local jyjixiewulibing58 = 905019
local jyjixiehuoyaobing58 = 905020

local chengmenwulishouwei58 = 904011
local chengmenhuoyaoshouwei58  = 904015
local chengmenmofashouwei58 = 904019
local jychengmenwulishouwei58 = 905015
local jychengmenhuoyaoshouwei58 = 905016
local jychengmenmofashouwei58 = 905017

local chengmen = 12301 --可以被攻击的城门
local chengmenzhanwei = 12311 --可以被攻击的占位块
local jixiepao = 906005 --BOSS机械炮
local bingying = 12303 --不可以被攻击的兵营

local lianbangquchuchufaqiX = 417 --联邦区域触发器X坐标
local lianbangquchuchufaqiY = 304 --联邦区域触发器Y坐标
local diguoquchuchufaqiX = 506 --帝国区域触发器X坐标
local diguoquchuchufaqiY = 304 --帝国区域触发器Y坐标

local jinshuid = 80947 --金属ID
local jinshunum = 0 --兑换冲车所需要的金属数量
local feijiujinshuID = 80948 --废旧金属ID
local feijiujinshukuaishu = 0 --兑换冲车所需要的废旧金属数量

local jixiewulibing60 = 901060
local jixiehuoyaobing60 = 902060
local jixiemofabing60 = 903060
local jyjixiewulibing60 = 905002
local jyjixiehuoyaobing60 = 905008
local jyjixiemofabing60 = 905012

local jyjixiewulibing61 = 905003
local jyjixiehuoyaobing61 = 905009
local jixiebuxuebing60 = 904001

local jyjixiewulibing62 = 905004
local jyjixiehuoyaobing62 = 905010
local jyjixiemofabing62 = 905014

local dushiguangchangBoss1 = 906011	
local dushiguangchangBoss2 = 906012
local dushiguangchangBoss3 = 906013

local chengmen2 = 12302 --不可以被攻击的城门
local chengmen2zhanwei = 12312 -- 不可以被攻击的占位块
local jixiezhiyaqi = 12306

local jixiebuxuebingpc62 = 904008
local jixiewulibingpc62 = 904005
local jixiehuoyaobingpc62 = 904006
local jixiemofabingpc62 = 904007

local jixiewulibingdanti62 = 901162
local jixiekongzhimofabing62 = 903162
local jyjixiewulibingdanti63 = 905005

local jixiewulibingqunti63 = 901263
local jixieyiliaomofabing63 = 903163
local jyjixiewulibingqunti64 = 905006

local jixiepaobing64 = 904004
local jixiehuoyaojituibing64 = 902164
local jyjixiepaobing65 = 905018

local jiangjun = 906014
local bingying2 = 12304
local bingying3 = 12305
local chengmen3 = 12325
local chengmen4 = 12326

local jixiewulibingdanti65 = 901265
local jixiekongzhimofabing65 = 903165
local jixiewulibingqunti65 = 901165
local jixieyiliaomofabing65 = 904003
local jixiepaobing65 = 904021
local jixiehuoyaojituibing65 = 902165
--镜像怪ID
local jixiewulibing65 = 901165
local jixiehuoyaobing65 = 902165
local jixiemofabing65 = 903165
local jixiebuxuebing65 = 904002
local jingxiangBOSS = 906015 --镜像BOSSID
local chuqudemen = 11607 --镜像出去的门

local OwnerID = -2001 --全局交互数据

local zhihuiguan3x = 451
local zhihuiguan3y = 531

--佣兵团竞拍免费复活区域
--西部城门区
local xibuchengmenx1 = 399
local xibuchengmeny1 = 266
local xibuchengmenx2 = 438
local xibuchengmeny2 = 291
--东部城门区
local dongbuchengmenx1 = 489
local dongbuchengmeny1 = 269
local dongbuchengmenx2 = 527
local dongbuchengmeny2 = 296
--都市广场区
local dushiguangchangx1 = 430
local dushiguangchangy1 = 461
local dushiguangchangx2 = 473
local dushiguangchangy2 = 503
--将军区
local jiangjunx1 = 301
local jiangjuny1 = 687
local jiangjunx2 = 343
local jiangjuny2 = 730
--boss刷新时间
local BossShuaXinShiJian = 14400

yjdsh_dshgchBOSSkillnum = 0

--BOSS归城事件回调函数，禁止50级以上玩家进入拉锯
function SkyCity_CanOpenBattle(ActorID)
	local ActorLV = API_GetActorExpLevel(ActorID)
	local BossGuiChengBiaoZhi = API_VarDataGetNumber_Ex(1,0,OwnerID,1,14)
	if BossGuiChengBiaoZhi == 1 then --发生归城事件
		if ActorLV >= 50 then
			API_ResponseWrite('<text>天空都市的法斯勒广场发生了机械族首领归城事件，首领死亡前或归城事件到达关闭时间前，50级以上玩家不能进入拉锯战</text><br><br>')
			API_ResponseWrite('<a>确定</a>')
			return 0
		end
	end
	return 1
end

--地图信息 ID 对应表
--1-11  1-11区的人数 每分钟 统计1次
--12 13 14 15 BOSS重置时间存储 为0时没重置  每分钟回调1次
--16 17 城门的后面区域 城门重置时 把这里的人传送
--18 19  2 3 号BOSS的战斗状态 为1 就是在战斗中

--第一部分 前期部分
---------------------------------------------------loginmap logoutmap 用login 和 logmap  这部分角色进入光明遗迹 就会增加1个杀怪触发器 离开的时候删除 根据杀怪触发器 获得 “能量源”
if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 0 then
	API_VarDataLoad_Ex(1,0,OwnerID)
end

--代码部分
--(nType)1：首次登录，2：切换场景服，3：小退
function yjdsh_gmyjOnLogin(ActorID)
	local ActorID = ActorID or API_RequestGetActorID() 
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local chufaqiid = API_VarDataGetNumber(ActorID,1,12140) --光明遗迹“能量源”掉落杀怪触发器ID
	local chufaqiid2 = API_VarDataGetNumber(ActorID,1,12141) --遗迹都市杀怪触发器ID
	local chufaqiid3 = API_VarDataGetNumber(ActorID,1,12177) --PK触发器ID
	local nType = API_VarDataGetNumber(ActorID,0,18368)
	local CampID = API_GetActorCamp(ActorID)
	if MapConfigID == 111 then --光明遗迹
		API_ActorAddMapPoint(ActorID,992183,MapConfigID,580,382,1,'天空都市')
		if chufaqiid > 0 then
			API_DestroyTrigger(ActorID,-1,chufaqiid)
		end
		chufaqiid = API_CreateKillMonsterTrigger(ActorID,0,-1,1,0,-1,'yijicitydiaoluodongliyuan') --光明遗迹 动力源 杀怪触发器
		API_VarDataSetNumber(ActorID,1,12140,chufaqiid) --光明遗迹杀怪触发器存交互
		
		local CheFastid = API_VarDataGetNumber(ActorID,1,12142) --冲车的FASTID
		if API_GetMonsterID(CheFastid) > 0 then	
			API_DestroyMonster(CheFastid)
		end
	end
	if MapConfigID == yijidushipeizhimapid then
		yijicity_AreaChongZhi(MapID)
		API_ActorAddMapPoint(ActorID,992176,MapConfigID,415,190,1,'飞艇管理员')
		API_ActorAddMapPoint(ActorID,992177,MapConfigID,397,271,1,'先驱者(麻客斯)')
		API_ActorAddMapPoint(ActorID,992178,MapConfigID,420,494,1,'冒险者(火炎焱)')
		API_ActorAddMapPoint(ActorID,992179,MapConfigID,481,494,1,'冒险者(水沝淼)')
		API_ActorAddMapPoint(ActorID,992180,MapConfigID,529,282,1,'先驱者(嗯戈斯)')
		API_ActorAddMapPoint(ActorID,992181,MapConfigID,518,187,1,'飞艇管理员')
		API_ActorAddMapPoint(ActorID,992182,MapConfigID,353,719,1,'探路王(木林森)')
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local Day2 = API_VarDataGetNumber(ActorID,1,12182) --获取玩家进入日
		if Day2 ~= Day then
			--yjdsh_gohome(ActorID)
			API_CreateTimerTrigger(ActorID, 0, 1, -1, 'yjdsh_gohomecallback')
			API_ActorSendMsg(ActorID,3,'天空都市关闭后需要重新进入，你被传送出去')
			return
		end
		if nType == 1 then
			if CampID == 1 then --联邦
				API_ActorGoToMap(ActorID,MapID,yijidushilianbangx,yijidushilianbangy)
			elseif CampID == 0 then --帝国
				API_ActorGoToMap(ActorID,MapID,yijidushidiguox,yijidushidiguoy)
			end
			API_ActorSendMsg(ActorID,3,'为了您的安全，您已经被传送到天空都市入口处')
		end
		if chufaqiid2 > 0 then
			API_DestroyTrigger(ActorID,-1,chufaqiid2)
		end
		chufaqiid2 = API_CreateKillMonsterTrigger(ActorID,0,-1,1,0,-1,'yijicityshaguaichufaqi') --遗迹之城杀怪触发器
		API_VarDataSetNumber(ActorID,1,12141,chufaqiid2) --杀怪触发器存交互
		
		local cheid = API_VarDataGetNumber(ActorID,1,12181) --获取冲车的MONSTERID
		if cheid > 0 then
			if cheid == chongche1 then
				yjdsh_chongchechuangjian(ActorID,chongche1,MapID)
			elseif cheid == chongche2 then
				yjdsh_chongchechuangjian(ActorID,chongche2,MapID)
			end
		end
		local renwuzhuangtai = API_VarDataGetNumber(ActorID,1,12174) --任务状态1816
		if renwuzhuangtai > 0 then
			if chufaqiid3 > 0 then
				API_DestroyTrigger(ActorID,-1,chufaqiid3)
				API_VarDataSetNumber(ActorID,1,12233,0)
			end
			chufaqiid3 = API_CreatePKTrigger(0,0,ActorID,0,-1,-1,'YBT_1816PKfunc')
			API_VarDataSetNumber(ActorID,1,12233,chufaqiid3)
		end
		--[[local buffid =  API_VarDataGetNumber(ActorID,1,12184) --BOSS防包BUFFID记录
		local lasttime =  API_VarDataGetNumber(ActorID,1,12183) --BOSS防包BUFF计时
		local nowtime = os.time()
		if buffid > 0 then
			local difftime1 = os.difftime(nowtime,lasttime)
			if difftime1 >= 1800 then
				API_VarDataSetNumber(ActorID,1,12183,0)
				API_VarDataSetNumber(ActorID,1,12184,0)
			else
				local shijiancha = (1800 - difftime1)*1000
				API_ActorAddStatus(ActorID,buffid,shijiancha)
			end
		end]]
		yjdsh_meifenzhonghuidiao2(ActorID,1)
		--删除boss归城地图打点
		local MapPointID1 = MapConfigID * 1000000 + 906012
		API_ActorDelMapPoint(ActorID,MapPointID1)
		local MapPointID2 = MapConfigID * 1000000 + 906013
		API_ActorDelMapPoint(ActorID,MapPointID2)
	end
end

function yjdsh_gohomecallback(ActorID,TaskID)
	yjdsh_gohome(ActorID)
end

function yjdsh_gmyjOnLogout(ActorID)
	local ActorID = ActorID or API_RequestGetActorID() 
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local chufaqiid = API_VarDataGetNumber(ActorID,1,12140) --光明遗迹“能量源”掉落杀怪触发器ID
	local chufaqiid2 = API_VarDataGetNumber(ActorID,1,12141) --遗迹都市杀怪触发器ID
	local chufaqiid3 = API_VarDataGetNumber(ActorID,1,12177) --PK触发器ID
	if MapConfigID == 111 then
		if chufaqiid > 0 then
			API_DestroyTrigger(ActorID,-1,chufaqiid)
		end
		API_VarDataSetNumber(ActorID,1,12140,0)
	end
	if MapConfigID == yijidushipeizhimapid then
		API_ActorSendMsg(ActorID,4,'')
		if chufaqiid2 > 0 then
			API_DestroyTrigger(ActorID,-1,chufaqiid2)
		end
		API_VarDataSetNumber(ActorID,1,12141,0)
		
		local cheid = API_VarDataGetNumber(ActorID,1,12142) --获取冲车的FASTID
		if cheid > 0 then
			if API_GetMonsterID(cheid) > 0 then	
				local FastHP = API_MonsterGetPropNum(cheid,2) --获取冲车的当前血量
				local FastMAXHP = API_MonsterGetPropNum(cheid,3) --获取冲车的最大血量
				local addhp = FastMAXHP - FastHP
				API_DestroyMonster(cheid)
				API_VarDataSetNumber(ActorID,1,12143,addhp) --存储冲车需要添加的血量
			end	
			local chetimechufaqi = API_VarDataGetNumber(ActorID,1,12144) --冲车时间触发器ID
			if chetimechufaqi > 0 then
				API_DestroyTrigger(ActorID,-1,chetimechufaqi)
			end	
		end
		if chufaqiid3 > 0 then
			API_DestroyTrigger(ActorID,-1,chufaqiid3)
			API_VarDataSetNumber(ActorID,1,12233,0) --任务状态1816
		end
		--[[local buffid =  API_VarDataGetNumber(ActorID,1,12184) --BOSS防包BUFFID记录
		local lasttime =  API_VarDataGetNumber(ActorID,1,12183) --BOSS防包BUFF计时
		local nowtime = os.time()
		if buffid > 0 then
			local difftime1 = os.difftime(nowtime,lasttime)
			if difftime1 >= 1800 then
				API_VarDataSetNumber(ActorID,1,12183,0)
				API_VarDataSetNumber(ActorID,1,12184,0)
			end
			if API_ActorFindStatusEx(ActorID,buffid) then
				API_ActorRemoveStatus(ActorID,buffid)
			end
		end]]
	end
end

function yjdsh_gmyjOnLoginMap(ActorID)
	local ActorID = ActorID or API_RequestGetActorID() 
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local chufaqiid = API_VarDataGetNumber(ActorID,1,12140) --光明遗迹“能量源”掉落杀怪触发器ID
	local chufaqiid2 = API_VarDataGetNumber(ActorID,1,12141) --遗迹都市杀怪触发器ID
	local chufaqiid3 = API_VarDataGetNumber(ActorID,1,12177) --PK触发器ID
	if MapConfigID == 111 then
		API_ActorAddMapPoint(ActorID,992183,MapConfigID,580,382,1,'天空都市')
		if chufaqiid > 0 then
			API_DestroyTrigger(ActorID,-1,chufaqiid)
		end
		chufaqiid = API_CreateKillMonsterTrigger(ActorID,0,-1,1,0,-1,'yijicitydiaoluodongliyuan') --光明遗迹 动力源 杀怪触发器
		API_VarDataSetNumber(ActorID,1,12140,chufaqiid) --杀怪触发器存交互
		
		local CheFastid = API_VarDataGetNumber(ActorID,1,12142) --获取冲车的FASTID
		if API_GetMonsterID(CheFastid) > 0 then	
			API_DestroyMonster(CheFastid)
		end
	end
	if MapConfigID == yijidushipeizhimapid then
		yijicity_AreaChongZhi(MapID)
		API_ActorAddMapPoint(ActorID,992176,MapConfigID,415,190,1,'飞艇管理员')
		API_ActorAddMapPoint(ActorID,992177,MapConfigID,397,271,1,'先驱者(麻客斯)')
		API_ActorAddMapPoint(ActorID,992178,MapConfigID,420,494,1,'冒险者(火炎焱)')
		API_ActorAddMapPoint(ActorID,992179,MapConfigID,481,494,1,'冒险者(水沝淼)')
		API_ActorAddMapPoint(ActorID,992180,MapConfigID,529,282,1,'先驱者(嗯戈斯)')
		API_ActorAddMapPoint(ActorID,992181,MapConfigID,518,187,1,'飞艇管理员')
		API_ActorAddMapPoint(ActorID,992182,MapConfigID,353,719,1,'探路王(木林森)')
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local Day2 = API_VarDataGetNumber(ActorID,1,12182) --获取遗迹都市进入日
		if Day2 ~= Day then
			yjdsh_gohome(ActorID)
			API_ActorSendMsg(ActorID,3,'天空都市关闭后需要重新进入，你被传送出去')
			return
		end
		if chufaqiid2 > 0 then
			API_DestroyTrigger(ActorID,-1,chufaqiid2)
		end
		chufaqiid2 = API_CreateKillMonsterTrigger(ActorID,0,-1,1,0,-1,'yijicityshaguaichufaqi') --遗迹之城杀怪触发器
		API_VarDataSetNumber(ActorID,1,12141,chufaqiid2) --杀怪触发器记录
		
		local cheid = API_VarDataGetNumber(ActorID,1,12181)	--获取冲车MONSTERID
		if cheid > 0 then
			if cheid == chongche1 then
				yjdsh_chongchechuangjian(ActorID,chongche1,MapID)
			elseif cheid == chongche2 then
				yjdsh_chongchechuangjian(ActorID,chongche2,MapID)
			end
		end
		local renwuzhuangtai = API_VarDataGetNumber(ActorID,1,12174) --任务状态1816
		if renwuzhuangtai > 0 then
			if chufaqiid3 > 0 then
				API_DestroyTrigger(ActorID,-1,chufaqiid3)
				API_VarDataSetNumber(ActorID,1,12233,0)
			end
			chufaqiid3 = API_CreatePKTrigger(0,0,ActorID,0,-1,-1,'YBT_1816PKfunc')
			API_VarDataSetNumber(ActorID,1,12233,chufaqiid3)
		end
		--[[local buffid =  API_VarDataGetNumber(ActorID,1,12184) --BOSS防包BUFFID记录
		local lasttime =  API_VarDataGetNumber(ActorID,1,12183) --BOSS防包BUFF计时
		local nowtime = os.time()
		if buffid > 0 then
			local difftime1 = os.difftime(nowtime,lasttime)
			if difftime1 >= 1800 then
				API_VarDataSetNumber(ActorID,1,12183,0)
				API_VarDataSetNumber(ActorID,1,12184,0)
			else
				local shijiancha = (1800 - difftime1)*1000
				API_ActorAddStatus(ActorID,buffid,shijiancha)
			end
		end]]
		yjdsh_meifenzhonghuidiao2(ActorID,1)
		--删除boss归城地图打点
		local MapPointID1 = MapConfigID * 1000000 + 906012
		API_ActorDelMapPoint(ActorID,MapPointID1)
		local MapPointID2 = MapConfigID * 1000000 + 906013
		API_ActorDelMapPoint(ActorID,MapPointID2)
	end	
end

function yjdsh_gmyjOnLogoutmap(ActorID)
	local ActorID = ActorID or API_RequestGetActorID() 
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local chufaqiid = API_VarDataGetNumber(ActorID,1,12140) --光明遗迹“能量源”掉落杀怪触发器ID
	local chufaqiid2 = API_VarDataGetNumber(ActorID,1,12141) --遗迹都市杀怪触发器ID
	local chufaqiid3 = API_VarDataGetNumber(ActorID,1,12177) --PK触发器ID
	if MapConfigID == 111 then
		if chufaqiid > 0 then
			API_DestroyTrigger(ActorID,-1,chufaqiid)
		end
		API_VarDataSetNumber(ActorID,1,12140,0)
	end
	if MapConfigID == yijidushipeizhimapid then
		API_ActorSendMsg(ActorID,4,'')
		if chufaqiid2 > 0 then
			API_DestroyTrigger(ActorID,-1,chufaqiid2)
		end
		API_VarDataSetNumber(ActorID,1,12141,0)
		
		local cheid = API_VarDataGetNumber(ActorID,1,12142) --冲车的FASTID
		if cheid > 0 then
			if API_GetMonsterID(cheid) > 0 then	
				API_DestroyMonster(cheid)
			end	
			local chetimechufaqi = API_VarDataGetNumber(ActorID,1,12144) --冲车触发器ID
			if chetimechufaqi > 0 then
				API_DestroyTrigger(ActorID,-1,chetimechufaqi)
			end	
			API_VarDataSetNumber(ActorID,1,12142,0)
			API_VarDataSetNumber(ActorID,1,12143,0)
			API_VarDataSetNumber(ActorID,1,12144,0)
			API_VarDataSetNumber(ActorID,1,12145,0)
			API_VarDataSetNumber(ActorID,1,12181,0)
		end
		if chufaqiid3 > 0 then
			API_DestroyTrigger(ActorID,-1,chufaqiid3)
			API_VarDataSetNumber(ActorID,1,12233,0) --任务状态1816
		end
		--[[local buffid =  API_VarDataGetNumber(ActorID,1,12184) --BOSS防包BUFFID记录
		local lasttime =  API_VarDataGetNumber(ActorID,1,12183) --BOSS防包BUFF计时
		local nowtime = os.time()
		if buffid > 0 then
			local difftime1 = os.difftime(nowtime,lasttime)
			if difftime1 >= 1800 then
				API_VarDataSetNumber(ActorID,1,12183,0)
				API_VarDataSetNumber(ActorID,1,12184,0)
			end
			if API_ActorFindStatusEx(ActorID,buffid) then
				API_ActorRemoveStatus(ActorID,buffid)
			end
		end]]		
	end
end

function yijicitydiaoluodongliyuan(ActorID,TaskID,MonsterID,MapID,PosX,PosY) --能量源掉落
	local ok = 0
	local biaochang = table.getn(yjdsh_gmyjjingshiguaitable)
	for i = 1, biaochang do
		if MonsterID == yjdsh_gmyjjingshiguaitable[i] then
			ok = 1
		end
	end
	if ok == 1 then
		local suiji = math.random(100)
		if suiji <= nengliangyuansuijilv then
			API_CreateDropGoods(MapID,PosX,PosY,nengliangyuan,nengliangyuannum,3,'打怪掉落能量源',0,ActorID,90,50)
		end	
	end
end

--天空都市各区域重置时间计算和显示函数
function yijicity_AreaChongZhi(MapID)
	local info1 = ''
	local info2 = ''
	local info3 = ''
	local info4 = ''
	local info = ''
	local nowtime = os.time()
	--西部城门区
	if API_GetMapVarData(MapID,12) > 0 then --联邦12，帝国13
		local oldtime = API_GetMapVarData(MapID,12)
		local TimePast = os.difftime(nowtime,oldtime)
		local shengyutime = BossShuaXinShiJian - TimePast
		if shengyutime < 0 then
			shengyutime = 0
		end
		if shengyutime > 0 then
			shengyutime = math.floor(shengyutime/60)
		end
		if shengyutime > 0 then
			info1 = '风暴要塞城门将于'..shengyutime..'分钟后出现\n'
		else
			info1 = '风暴要塞城门出现时间小于1分钟\n'
			
		end
		if shengyutime <= 1 then
			local TriggerG = API_GetMapVarData(MapID,37)
			if TriggerG == 0 then
				TriggerG = API_CreateAreaCreatureTriggerG(2,MapID,MapID,417,295,8,'yjdsh_chengmenquyujiankong2')
				API_SetMapVarData(MapID,37,TriggerG)
			end
		end
	else
		info1 = '风暴要塞城门还未被攻破\n'
	end
	--东部城门区
	if API_GetMapVarData(MapID,13) > 0 then --联邦12，帝国13
		local oldtime = API_GetMapVarData(MapID,13)
		local TimePast = os.difftime(nowtime,oldtime)
		local shengyutime = BossShuaXinShiJian - TimePast
		if shengyutime < 0 then
			shengyutime = 0
		end
		if shengyutime > 0 then
			shengyutime = math.floor(shengyutime/60)
		end
		if shengyutime > 0 then
			info2 = '磐石要塞城门将于'..shengyutime..'分钟后出现\n'
		else
			info2 = '磐石要塞城门出现时间小于1分钟\n'
		end
		if shengyutime <= 1 then
			local TriggerG = API_GetMapVarData(MapID,38)
			if TriggerG == 0 then
				TriggerG = API_CreateAreaCreatureTriggerG(1,MapID,MapID,506,295,8,'yjdsh_chengmenquyujiankong2')
				API_SetMapVarData(MapID,38,TriggerG)
			end
		end
	else
		info2 = '磐石要塞城门还未被攻破\n'
	end
	--都市广场区
	if API_GetMapVarData(MapID,14) > 0 then
		local oldtime = API_GetMapVarData(MapID,14)
		local TimePast = os.difftime(nowtime,oldtime)
		local shengyutime = BossShuaXinShiJian - TimePast
		if shengyutime < 0 then
			shengyutime = 0
		end
		if shengyutime > 0 then
			shengyutime = math.floor(shengyutime/60)
		end
		if shengyutime > 0 then
			info3 = '法斯勒广场的首领将于'..shengyutime..'分钟后出现\n'
		else
			info3 = '法斯勒广场的首领出现时间小于1分钟\n'
		end
	else
		info3 = '法斯勒广场的首领还未被击杀\n'
	end
	--将军区
	if API_GetMapVarData(MapID,15) > 0 then
		local oldtime = API_GetMapVarData(MapID,15)
		local TimePast = os.difftime(nowtime,oldtime)
		local shengyutime = BossShuaXinShiJian - TimePast
		if shengyutime < 0 then
			shengyutime = 0
		end
		if shengyutime > 0 then
			shengyutime = math.floor(shengyutime/60)
		end
		if shengyutime > 0 then
			info4 = '雷杰斯营地的首领将于'..shengyutime..'分钟后出现\n'
		else
			info4 = '雷杰斯营地的首领出现时间小于1分钟\n'
		end
	else
		info4 = '雷杰斯营地的首领还未被击杀\n'
	end
	info = info1..info2..info3..info4
	API_ActorBroadcastMsg(MapID,4,info)
end

----------------------------------------光明遗迹传送遗迹之城NPC
--NPC创建部分 此部分最后整合到 CREATNPC中
--点击飞艇管理员时
--进入的条件 1.10-21点40 开放时间是10-22  2进入消耗金币 3进入需要等级 4进入需要最少有20个动力源
function yjdsh_feitingguanliyuandianji(ActorID,NPCID) --飞艇管理员点击
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	if NPCID ~= feitingguanliyuanid then
		return
	end	
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local level = API_GetActorExpLevel(ActorID)
	local goodsnum = API_ActorGetGoodsNum(ActorID,nengliangyuan)	
	API_ResponseWrite('<name>飞艇管理员</name>')
	API_ResponseWrite('<br><text>你好啊"</text><text color="255,0,255">'..API_GetActorName(ActorID)..'</text><text>",我是飞艇管理员，你想不想坐上飞艇去天空都市转转？那上面既有强大的机械族也有从远古流传下来的宝物。只要满足以下要求就能获得天空都市的进入资格，怎么样准备好了吗？要不要上去？</text><br><br>')
	API_ResponseWrite('<text>1.需要</text><text color="255,0,255">'..feitingxiaohaodejinbi..'</text><text>金币，我可不会免费带你上去</text><br>')
	API_ResponseWrite('<text>2.每天的</text><text color="255,0,255">'..yijidushibegintime..'点到'..yijidushiovertime..'点</text><text>是天空都市的开放时间，</text><text color="255,0,255">'..yijidushiovertime2..'点'..yijidushiovertime3..'分</text><text>开始停止飞往天空都市</text><br>')
	API_ResponseWrite('<text>3.按规定需要等级达到</text><text color="255,0,255">'..yijidushilvneed..'级</text><text>，不然会有危险</text><br>')
	API_ResponseWrite('<text>4.身上必须带有</text><text color="255,0,255">'..API_GetGoodsName(nengliangyuan)..''..nengliangyuanmin..'</text><text>个才许进入天空都市，因为上面每分钟需要消耗</text><text color="255,0,255">1个</text><text>。没有了就会被禁止使用英雄技能，听说光明遗迹的怪物身上能获得这东西</text><br><br>')
	API_ResponseWrite('<a href="yjdsh_feitingguanliyuandianji2?1='..ActorID..'">OK,我要上飞艇</a><br>')
	API_ResponseWrite('<br><a>算了，下次再说吧</a><br>')
	API_ResponseFlush(ActorID)
end

--条件核算时
function yjdsh_feitingguanliyuandianji2() --传送审核
	local ActorID = API_RequestGetNumber(1)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local level = API_GetActorExpLevel(ActorID)
	local goodsnum = API_ActorGetGoodsNum(ActorID,nengliangyuan)
	if API_ActorGetPackageSize(ActorID) <= 0 then
		API_ActorSendMsg(ActorID,3,'背包空间已满，请至少保留一格空间')
		return
	end
	API_ResponseWrite('<name>飞艇管理员</name>')
	if Hour >= yijidushibegintime and Hour < yijidushiovertime then
		if Hour == yijidushiovertime2 and Minute > yijidushiovertime3 then
			API_ResponseWrite('<text>每天的'..yijidushibegintime..'点到'..yijidushiovertime..'点是飞艇开往天空都市的时间，还有不到20分钟就要下班了，明天再来吧。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		else
			if level >= yijidushilvneed then
				if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) >= feitingxiaohaodejinbi then
					if goodsnum >= nengliangyuanmin then
						API_ActorAddMoney(ActorID,-feitingxiaohaodejinbi,1805,'传送天空都市扣钱')
						local Camp = API_GetActorCamp(ActorID)
						if Camp == 0 then
							API_VarDataSetNumber(ActorID,1,12182,Day) --记录进入日
							API_ActorGoToMap(ActorID,yijidushipeizhimapid,yijidushidiguox,yijidushidiguoy) 
							API_AddActorGoods(ActorID,GLOBAL_PresentReliveRoodID,1,'进入佣兵团PVE副本赠送')
							API_ActorSendMsg(ActorID,3,'免费获得一枚“重生十字章”')
							API_VarDataSetNumber(ActorID,1,GLOBAL_DeathDegree,0)
							API_VarDataSetNumber(ActorID,1,GLOBAL_ReliveDegree,0)
							API_VarDataSetNumber(ActorID,1,12185,0) --免费复活 死亡回调记录
						end
						if Camp == 1 then
							API_VarDataSetNumber(ActorID,1,12182,Day) --记录进入日
							API_ActorGoToMap(ActorID,yijidushipeizhimapid,yijidushilianbangx,yijidushilianbangy) 
							API_AddActorGoods(ActorID,GLOBAL_PresentReliveRoodID,1,'进入佣兵团PVE副本赠送')
							API_ActorSendMsg(ActorID,3,'免费获得一枚“重生十字章”')
							API_VarDataSetNumber(ActorID,1,GLOBAL_DeathDegree,0)
							API_VarDataSetNumber(ActorID,1,GLOBAL_ReliveDegree,0)
							API_VarDataSetNumber(ActorID,1,12185,0) --免费复活 死亡回调记录
						end
						API_ResponseEnd()
						API_ResponseClear()
					else
						API_ResponseWrite('<text>天空都市每分钟都要消耗1个'..API_GetGoodsName(nengliangyuan)..'，不然会被传送回来。不准备好</text><text color="255,0,255">'..nengliangyuanmin..'个'..API_GetGoodsName(nengliangyuan)..'</text><text>我是不会用飞艇把你送过去的。</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
					end
				else	
					API_ResponseWrite('<text>飞艇飞往天空都市一次需要'..feitingxiaohaodejinbi..'金币，你的金币不足，我可不能工作</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			else
				API_ResponseWrite('<text>天空都市里有很强大的机械族怪物，你的实力还不够，等你到达'..yijidushilvneed..'级时才能进入。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	else
		API_ResponseWrite('<text>每天的'..yijidushibegintime..'点～'..yijidushiovertime..'点是天空都市的开放时间，'..yijidushiovertime2..'点'..yijidushiovertime3..'分开始停止飞往天空都市</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
	end
	API_ResponseFlush(ActorID)
end

function yjdsh_feitingguanliyuan2dianji(ActorID,NPCID) --飞艇管理员点击
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	if NPCID ~= feitingguanliyuanid2 then
		return
	end	
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local level = API_GetActorExpLevel(ActorID)
	local goodsnum = API_ActorGetGoodsNum(ActorID,nengliangyuan)		
	API_ResponseWrite('<name>飞艇管理员</name>')
	API_ResponseWrite('<text>怎么要回去了吗？</text><br><br><br>')
	API_ResponseWrite('<a href="yjdsh_feitingguanliyuan2dianji2?1='..ActorID..'">嗯,我要回去了</a><br>')
	API_ResponseWrite('<br><a>算了，先不回去</a><br>')
	API_ResponseFlush(ActorID)
end

function yjdsh_feitingguanliyuan2dianji2() --传送审核
	local ActorID = API_RequestGetNumber(1)
	local MapID1 = API_GetRightMapID(111) 
	local Camp = API_GetActorCamp(ActorID)
	local x = 0
	local y = 0
	if Camp == 0 then
		x = 590
		y = 383
	elseif Camp == 1 then
		x = 590
		y = 377
	end
	if x > 0 and y > 0 then
		API_ActorGoToMap(ActorID,MapID1,x,y) 
	end	
end

--判断玩家是否有动力之源 有就消耗 没有就禁止使用英雄技能
function yjdsh_meifenzhonghuidiao2(ActorID,type1) --能量源每分钟扣除 不足禁止使用技能	
	local goodsnum = API_ActorGetGoodsNum(ActorID,nengliangyuan) --能量源数量	
	if goodsnum > 0 then
		if type1 == 1 then
			return
		end
		API_ActorRemoveGoods(ActorID,nengliangyuan,1,'天空都市每分钟消耗1个能量源')	
		if goodsnum <= 6 then
			API_ActorSendMsg(ActorID,17,'您身上的'..API_GetGoodsName(nengliangyuan)..'已经不多，请在消耗完前想办法补足，否则会被禁止使用英雄技能')
			API_ActorSendMsg(ActorID,1,'您身上的'..API_GetGoodsName(nengliangyuan)..'已经不多，请在消耗完前想办法补足，否则会被禁止使用英雄技能')			
		end
	else	
		API_ActorAddStatus(ActorID,2001001,0) --能量源消耗完，添加状态，禁止使用英雄技能
		API_ActorSendMsg(ActorID,17,'您身上的'..API_GetGoodsName(nengliangyuan)..'已经用光，英雄技能已被禁止使用，请想办法补足或者离开天空都市。')
		API_ActorSendMsg(ActorID,1,'您身上的'..API_GetGoodsName(nengliangyuan)..'已经用光，英雄技能已被禁止使用，请想办法补足或者离开天空都市。')				
	end
end

--遗迹之城每分钟回调
function yjdsh_meifenzhonghuidiao() --每分钟回调
	local MapID = API_GetRightMapID(yijidushipeizhimapid)
--每分钟判断门是否存在，存在则给将军区域的玩家加持续掉血DEBUFF
	local JiangJunQuMenFastID = yjdsh_12qufidtable[4][1]
	if JiangJunQuMenFastID ~= nil then
		if API_GetMonsterID(JiangJunQuMenFastID) > 0 then
			local JiangJunQuArea = API_GetActorInArea(MapID,1,291,680,410,740)
			if type(JiangJunQuArea) == "table" then
				for i,v in pairs(JiangJunQuArea) do
					local ActorID = v
					if API_ActorIsOnline(ActorID) then
						if not API_ActorIsDying(ActorID) then
							API_ActorAddStatus(ActorID,994001,59000) --给玩家添加持续掉血的DEBUFF
							local JiangJunFastID = yjdsh_11qufidtable[jiangjun][1]
							if JiangJunFastID ~= nil then
								if API_GetMonsterID(JiangJunFastID) > 0 then
									API_ActorSendMsg(ActorID,1,'你受到了辐射伤害，请尽快离开该区域，并摧毁掉电网前的三个铸魔兵营')
								else
									API_ActorSendMsg(ActorID,1,'你受到了辐射伤害，请尽快离开该区域')
								end
							end
						end
					end
				end
			end
		end
	end
--每分钟地图回调删除 动力源	
	API_ActorCallBack(MapID,1,-1,'yjdsh_meifenzhonghuidiao2')
--每分钟地图回调更新一下各个区域重置显示
	yijicity_AreaChongZhi(MapID)
--每5分钟获得存储1次地图人数	
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local yushu = math.mod(Minute,5) --如果分可以被5整除 那么就是每5分钟统计1次人维护
	if yushu == 0 then
		--开始统计人数
		local playernumtable1 = API_GetActorInArea(MapID,1,376,200,410,275) --联邦1号练级区
		local playernum1 = table.getn(playernumtable1)
		
		local playernumtable2 = API_GetActorInArea(MapID,1,530,200,563,275) --帝国1号练级区
		local playernum2 = table.getn(playernumtable2)
		
		local playernumtable3 = API_GetActorInArea(MapID,1,320,405,420,495) --联邦民房
		local playernum3 = table.getn(playernumtable3)
				
		local playernumtable4 = API_GetActorInArea(MapID,1,480,405,590,495) --帝国民房
		local playernum4 = table.getn(playernumtable4)
				
		local playernumtable5 = API_GetActorInArea(MapID,1,420,453,480,510) --都市广场
		local playernum5 = table.getn(playernumtable5)
				
		local playernumtable6 = API_GetActorInArea(MapID,1,406,558,480,592) --将军1
		local playernum6 = table.getn(playernumtable6)
				
		local playernumtable7 = API_GetActorInArea(MapID,1,381,596,469,640) --将军2
		local playernum7 = table.getn(playernumtable7)
				
		local playernumtable8 = API_GetActorInArea(MapID,1,412,688,459,734) --将军3
		local playernum8 = table.getn(playernumtable8)
				
		local playernumtable9 = API_GetActorInArea(MapID,1,295,685,345,735) --将军4
		local playernum9 = table.getn(playernumtable9)
				
		local playernumtable10 = API_GetActorInArea(MapID,1,392,265,440,297) --联邦城门
		local playernum10 = table.getn(playernumtable10)
				
		local playernumtable11 = API_GetActorInArea(MapID,1,480,265,530,297) --帝国城门
		local playernum11 = table.getn(playernumtable11)				
		
		API_SetMapVarData(MapID,1,playernum1) --1区人数
		API_SetMapVarData(MapID,2,playernum2) --2区人数
		API_SetMapVarData(MapID,3,playernum3) --3区人数
		API_SetMapVarData(MapID,4,playernum4) --4区人数
		API_SetMapVarData(MapID,5,playernum5) --5区人数
		API_SetMapVarData(MapID,6,playernum6) --6区人数
		API_SetMapVarData(MapID,7,playernum7) --7区人数
		API_SetMapVarData(MapID,8,playernum8) --8区人数
		API_SetMapVarData(MapID,9,playernum9) --9区人数
		API_SetMapVarData(MapID,10,playernum10) --10区人数
		API_SetMapVarData(MapID,11,playernum11) --11区人数
	end
	
	if Hour == 23 then
		if Minute == 40 or Minute == 50 or Minute == 55 or Minute == 56 or Minute == 57 or Minute == 58 or Minute == 59 then
			local shengyutime = 60 - Minute
			API_ActorBDCMsg(MapID,0,-1,50,85,0,1,'天空都市将在'..shengyutime..'分钟后关闭，请各位做好撤离准备。')
			API_ActorBDCMsg(MapID,0,-1,50,85,0,17,'天空都市将在'..shengyutime..'分钟后关闭，请各位做好撤离准备。')
		end
	end
	if Hour >= yijidushiovertime or Hour < yijidushibegintime then
		API_ActorCallBack(MapID,1,-1,'yjdsh_yiduclose')
	end
--每分钟对地图上的BOSS信息 进行判断 如果到达重置时间 那么刷新BOSS
	local nowtime = os.time()
	if API_GetMapVarData(MapID,12) > 0 then --联邦城门
		local oldtime = API_GetMapVarData(MapID,12)
		local TimePast = os.difftime(nowtime,oldtime)
		if TimePast >= BossShuaXinShiJian then
			--执行BOSS刷新函数 
			API_SetMapVarData(MapID,12,0)
			yjdsh_lbchengmenqushuaguai(MapID,0)
			yjdsh_Bossfangshuafuhuoqueren(MapID,1)
		end
	end
	if API_GetMapVarData(MapID,13) > 0 then --帝国城门
		local oldtime = API_GetMapVarData(MapID,13)
		local TimePast = os.difftime(nowtime,oldtime)
		if TimePast >= BossShuaXinShiJian then
			--执行BOSS刷新函数 
			API_SetMapVarData(MapID,13,0)
			yjdsh_dgchengmenqushuaguai(MapID,0)
			yjdsh_Bossfangshuafuhuoqueren(MapID,2)
		end
	end
	if API_GetMapVarData(MapID,14) > 0 then --都市广场
		local oldtime = API_GetMapVarData(MapID,14)
		local TimePast = os.difftime(nowtime,oldtime)
		if TimePast >= BossShuaXinShiJian then
			--执行BOSS刷新函数 
			API_SetMapVarData(MapID,14,0)
			yjdsh_dushiguangchangshuaguai(MapID)
			yjdsh_Bossfangshuafuhuoqueren(MapID,3)
		end
	end
	if API_GetMapVarData(MapID,15) > 0 then --将军
		local oldtime = API_GetMapVarData(MapID,15)
		local TimePast = os.difftime(nowtime,oldtime)
		if TimePast >= BossShuaXinShiJian then
			--执行BOSS刷新函数 
			API_SetMapVarData(MapID,15,0)
			yjdsh_jiangjun4qu(MapID,0)
			yjdsh_Bossfangshuafuhuoqueren(MapID,4)
		end
	end
	
	--将军区 门和兵营刷新函数
	--每分钟重置1次3个区的兵营和门
	--yjdsh_jiangjunqumenhebingying(MapID) 
end
function yjdsh_yiduclose(ActorID)
	API_ActorSendMsg(ActorID,1,'天空都市已经关闭，你被传送出。请到'..yijidushibegintime..'点后再次进入。')
	API_ActorSendMsg(ActorID,17,'天空都市已经关闭，你被传送出。请到'..yijidushibegintime..'点后再次进入。')
	yjdsh_gohome(ActorID)
end

--遗迹之城杀怪触发器
--小怪的死亡 BOSS的死亡 装备的掉落等等 都通过这个
--小怪的刷新方案修改 把通过死亡开始计时 然后刷新 改为 通过统一时间刷新 每次刷新时判断条件 通过杀怪触发器 判断怪物的掉落
--完成到找到怪物部分 后面的根据实际情况改变
function yijicityshaguaichufaqi(ActorID,taskid,MonsterID,MapID,PosX,PosY)--遗迹之城杀怪触发器
	local renwu1807 = API_VarDataGetNumber(ActorID,1,12149)
	local renwu1807zt = math.mod(renwu1807,10)
	if  renwu1807zt > 0 and renwu1807zt ~= 2 then
		yijicity1807shaguaichufaqi(ActorID,taskid,MonsterID,MapID,PosX,PosY)
	end	
	local renwu1808 = API_VarDataGetNumber(ActorID,1,12155)
	local renwu1808zt = math.mod(renwu1808,10)
	if  renwu1808zt > 0 and renwu1808zt ~= 2 then
		yijicity1808shaguaichufaqi(ActorID,taskid,MonsterID,MapID,PosX,PosY)
	end
	local renwu1809 = API_VarDataGetNumber(ActorID,1,12160)
	local renwu1809zt = math.mod(renwu1809,10)
	if  renwu1809zt > 0 and renwu1809zt ~= 2 then
		yijicity1809shaguaichufaqi(ActorID,taskid,MonsterID,MapID,PosX,PosY)
	end	
	local renwu1810 = API_VarDataGetNumber(ActorID,1,12162)
	local renwu1810zt = math.mod(renwu1810,10)
	if  renwu1810zt > 0 and renwu1810zt ~= 2 then
		yijicity1810shaguaichufaqi(ActorID,taskid,MonsterID,MapID,PosX,PosY)
	end
	
--	local renwu1811 = API_VarDataGetNumber(ActorID,1,12164)
--	--API_Trace("renwu1811"..renwu1811)
--	local renwu1811zt = math.mod(renwu1811,10)
--	--API_Trace("renwu1811zt"..renwu1811zt)
--	if  renwu1811zt > 0 and renwu1811zt ~= 2 then
--		yijicity1811shaguaichufaqi(ActorID,taskid,MonsterID,MapID,PosX,PosY)
--	end
	
	local renwu1812 = API_VarDataGetNumber(ActorID,1,12166)
	local renwu1812zt = math.mod(renwu1812,10)
	if  renwu1812zt > 0 and renwu1812zt ~= 2 then
		yijicity1812shaguaichufaqi(ActorID,taskid,MonsterID,MapID,PosX,PosY)
	end	
	
	local renwu1813 = API_VarDataGetNumber(ActorID,1,12168)
	local renwu1813zt = math.mod(renwu1813,10)
	if  renwu1813zt > 0 and renwu1813zt ~= 2 then
		yijicity1813shaguaichufaqi(ActorID,taskid,MonsterID,MapID,PosX,PosY)
	end	
	
	local renwu1814 = API_VarDataGetNumber(ActorID,1,12170)
	local renwu1814zt = math.mod(renwu1814,10)
	if  renwu1814zt > 0 and renwu1814zt ~= 2 then
		yijicity1814shaguaichufaqi(ActorID,taskid,MonsterID,MapID,PosX,PosY)
	end
	
	local renwu1817 = API_VarDataGetNumber(ActorID,1,12178)
	local renwu1817zt = math.mod(renwu1817,10)
	if  renwu1817zt > 0 and renwu1817 ~= 2 then
		yijicity1817shaguaichufaqi(ActorID,taskid,MonsterID,MapID,PosX,PosY)
	end
	--[[local biaochang = table.getn(yjdsh_monstertable)
	for i = 1, biaochang do
		if yjdsh_monstertable[i] ~= nil then
			local biaochang2 = table.getn(yjdsh_monstertable[i])
			for j =1,biaochang2 do
				if MonsterID == yjdsh_monstertable[i][j] then
				end
			end
		end
	end]]--
	
	--普通怪掉落部分 by 万钰林
	if yjdsh_ptmonsterdroptypetable[MonsterID] ~= nil then
		local DropType = yjdsh_ptmonsterdroptypetable[MonsterID]
		if yjdsh_ptmonsterdropgoodstable[DropType] == nil then
			return
		end
		local Table = yjdsh_ptmonsterdropgoodstable[DropType]
		--掉普通道具
		for j in Table[1] do
			local RD = math.random(1000000)
			local GoodsID = Table[1][j].GoodsID
			local GoodsNum = Table[1][j].GoodsNum
			local GaiLv = Table[1][j].GaiLv
			local PinZhi = Table[1][j].PinZhi
			if RD <= GaiLv then
				if API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,'天空都市普通怪掉落',4,0,600,120) == true then
				end
			end
		end
		if Table[2] ~= nil then
			local RD = math.random(1000000)
			local GaiLv = Table[2].GaiLv
			if RD < GaiLv then
				local LeiXing = Table[2].LeiXing
				local GoodsNum = Table[2].Num
				local PinZhi = 2
				local PinZhiTab = Table[2].PinZhiTab
				local RD2 = math.random(100)
				for j in PinZhiTab do
					local a = PinZhiTab[j].a
					local b = PinZhiTab[j].b
					if RD2 >= a and RD2 <= b then
						PinZhi = PinZhiTab[j].PinZhi
					end
				end
				if YXD_WorldDropGoodsTab[LeiXing] ~= nil then
					local GoodsID = YXD_WorldDropGoodsTab[LeiXing][math.random(table.getn(YXD_WorldDropGoodsTab[LeiXing]))]
					if API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,1,'天空都市普通怪掉落',4,ActorID,600,120,PinZhi) == true then
					end
				end
			end
		end
	end
end

--每日系统重置 正式版本要加到MAIN函数中
function yjdsh_everydayhuidiao()
	API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,14,0)
end

--晶源卡牌 兑换
--上缴规定量的牌子 传送小队进入
function yjdsh_jingyuanduihuanguandianji(ActorID,NPCID)--卡牌兑换NPC点击
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	if NPCID ~= jingyuanduihuanguanid then
		return
	end	
	API_ResponseWrite('<name>晶源卡牌兑换官</name>')
	API_ResponseWrite('<text color="255,0,255">"'..API_GetActorName(ActorID)..'"</text><text>,我可以用魔法把你或者你的小队传送到一个神秘的空间（小队成员必须和你在同一地图,最少要52级），在那里你可以与机械族首领的镜像进行战斗。击败他们可以获得强大的装备和神秘的宝物。他们虽说是镜像，但是也拥有恐怖的能力，你最好找些强力的同伴一起进去挑战。我每使用一次魔法需要'..jingyuankapainum..'块'..API_GetGoodsName(jingyuankapaiid)..'。</text><text color="255,0,255">(晶源卡牌获取途径：四档佣兵团任务和击杀天空都市各大BOSS均可获得)</text><text>只要队长有就可以了，作为回报队长可以在一分钟内优先挑选战利品。怎么样准备好了吗？</text><br>')	
	--API_ResponseWrite('<text>当然了，如果你觉得自己不够强力，也没有强大的队友来帮助，我可以给你另外一个选择，但能获得什么就要看你的运气是否足够好了，</text><text color="255,0,0">而且只有一件灵魂绑定装备</text><text>，除了'..jingyuankapainum..'块'..API_GetGoodsName(jingyuankapaiid)..'之外，我也要收点魔力补充费，不多，就100000金币。</text><br>')
	API_ResponseWrite('<br><a href="yjdsh_jingyuanduihuanguandianji2?1='..ActorID..'">这个给你，开始传送我们吧</a><br>')
	--API_ResponseWrite('<br><a href="yjdsh_jingyuanduihuanguandianji3">我不够强力，也没有强大的队友</a><br>')
	API_ResponseWrite('<br><a>算了，下次再说吧</a><br>')
	API_ResponseFlush(ActorID)
end

--扣除牌子
--创建副本
--判断是否组队 
--没组队直接传送
--组队 判断成员是否和队长在同一地图 YES 传 NO 不传
function yjdsh_jingyuanduihuanguandianji2()
	local ActorID = API_RequestGetNumber(1)
	local level = API_GetActorExpLevel(ActorID)
	local TeamID = API_GetTeamID(ActorID)
	if level < 52 then
		API_ResponseWrite('<text>你未达到52级，不能进入。</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return
	end	
	if TeamID > 0 then
		local DuiZhangID = API_GetTeamLeader(TeamID)
		if ActorID ~= DuiZhangID then
			API_ResponseWrite('<text>你不是队长，只有队长才能带队进入。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return
		end
	end
	local goodsnum = API_ActorGetGoodsNum(ActorID,jingyuankapaiid)	
	if goodsnum >= jingyuankapainum then
		API_ActorRemoveGoods(ActorID,jingyuankapaiid,jingyuankapainum,'进入天空都市神秘空间删除牌子')
		API_ActorSendMsg(ActorID,17,'进入天空都市神秘空间，扣除“'..API_GetGoodsName(jingyuankapaiid)..'”'..jingyuankapainum..'块')
		local MapID = API_CreateEctype(yijidushishenmikongjian,0) --创建遗迹都市神秘空间副本
		yjdsh_shenmikongjian_Initialization(MapID,ActorID) --转入5部分
		if TeamID > 0 then
			local tesmnum = API_GetTeamSize(TeamID)
			local ActorMapID = API_GetActorMapID(ActorID)
			for i = 1,tesmnum do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				local cishiMapID = API_GetActorMapID(TeamActorID)
				if ActorMapID == cishiMapID then
					local level2 = API_GetActorExpLevel(TeamActorID)
					if level2 >= 52 then
						API_ActorGoToMap(TeamActorID,MapID,yijidushishenmikongjianX,yijidushishenmikongjianY) 
					end
				end
			end	
		else
			API_ActorGoToMap(ActorID,MapID,yijidushishenmikongjianX,yijidushishenmikongjianY) 
		end
	else
		API_ResponseWrite('<text>你身上的“'..API_GetGoodsName(jingyuankapaiid)..'”不足'..jingyuankapainum..'块，我可不做亏本的买卖。</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
	end
end

yjdsh_jingyuankapaiduihuanguanzhuangbei = {
	[1] = {Name='四档强化物理装备',GoodsTab={20099,20100,20104,20105,20106,20107,},},
	[2] = {Name='四档强化火药装备',GoodsTab={20111,20112,20116,20117,20118,20119,},},
	[3] = {Name='四档强化魔法装备',GoodsTab={20121,20122,20126,20127,20128,20129,},},
}
--直接兑换奖励
function yjdsh_jingyuanduihuanguandianji3()
	local ActorID = API_RequestGetActorID() 
	local XuanZe = API_RequestGetNumber(1)
	local level = API_GetActorExpLevel(ActorID)
	local Money = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD)
	local goodsnum = API_ActorGetGoodsNum(ActorID,jingyuankapaiid)	
	if XuanZe == 1 then
		if level < 52 then
			API_ResponseWrite('<text>你未达到52级，找我也是白找。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return
		end	
		if API_ActorGetPackageSize(ActorID) < 1 then
			API_ResponseWrite('<text>你背包满啦，清理一下再来找我吧。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
		if goodsnum < jingyuankapainum then
			API_ResponseWrite('<text>你身上的“'..API_GetGoodsName(jingyuankapaiid)..'”不足'..jingyuankapainum..'块，我可不做亏本的买卖。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
		if Money < 100000 then
			API_ResponseWrite('<text>你身上的金币不足100000，我可不做亏本的买卖。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
		local Select = API_RequestGetNumber(2)
		if Select > 0 then
			if yjdsh_jingyuankapaiduihuanguanzhuangbei[Select] ~= nil then
				if API_ActorRemoveGoods(ActorID,jingyuankapaiid,jingyuankapainum,'直接换奖励删除牌子') and API_ActorAddMoney(ActorID,-100000,0,'晶源卡牌兑换奖励') then
					local Table = yjdsh_jymonsterdropgoodstable[7][3]
					local Table2 = {3,2,1,}
					for j,i in Table2 do 
						local RD = math.random(1000000)
						local GaiLv = Table[i].GaiLv
						if RD < GaiLv then
--~ 							local LeiXing = Table[i].LeiXing
--~ 							local LeiXingTab = Table[i].LeiXingTab
--~ 							local LXRD = math.random(100)
--~ 							for j in LeiXingTab do
--~ 								local a = LeiXingTab[j].a
--~ 								local b = LeiXingTab[j].b
--~ 								if LXRD >= a and LXRD <= b then
--~ 									LeiXing = LeiXingTab[j].LeiXing
--~ 									break
--~ 								end
--~ 							end
							local GoodsNum = Table[i].Num
							local Bind = 1
							local PinZhi = 2
							local PinZhiTab = Table[i].PinZhiTab
							local PZRD = math.random(100)
							for j in PinZhiTab do
								local a = PinZhiTab[j].a
								local b = PinZhiTab[j].b
								if PZRD >= a and PZRD <= b then
									PinZhi = PinZhiTab[j].PinZhi
									break
								end
							end
							local Make1 = 1
							local Make1Tab = Table[i].Make1Tab
							local M1RD = math.random(100)
							for j in Make1Tab do
								local a = Make1Tab[j].a
								local b = Make1Tab[j].b
								if M1RD >= a and M1RD <= b then
									Make1 = Make1Tab[j].Make1
									break
								end
							end
							local Make2 = 1
							local Make2Tab = Table[i].Make2Tab
							local M2RD = math.random(100)
							for j in Make2Tab do
								local a = Make2Tab[j].a
								local b = Make2Tab[j].b
								if M2RD >= a and M2RD <= b then
									Make2 = Make2Tab[j].Make2
									break
								end
							end
							local GoodsID = yjdsh_jingyuankapaiduihuanguanzhuangbei[Select].GoodsTab[math.random(table.getn(yjdsh_jingyuankapaiduihuanguanzhuangbei[Select].GoodsTab))]
							local GoodsName = API_GetGoodsName(GoodsID)
							API_AddGoodsWithMakeFlag(ActorID, GoodsID, GoodsNum,PinZhi, Bind, '晶源卡牌兑换奖励',  0,  Make1,Make2) 
							API_ActorSendMsg(ActorID,10,'在晶源卡牌兑换官处使用'..jingyuankapainum..'块“'..API_GetGoodsName(jingyuankapaiid)..'”和100000金币获得了'..GoodsName..'')
							API_ResponseWrite('<br><text>魔法施放成功，获得一个灵魂绑定的'..GoodsName..'。</text><br>')
							API_ResponseWrite('<br><a href="yjdsh_jingyuanduihuanguandianji3">返回</a>')
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							local Type = 10
							if GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] + 1
							end
							if PinZhi == 7 or PinZhi == 3 then
								local Type = 11
								if GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] + 1
								end
							end
							if Make1 == 4 and Make2 == 4 then
								local Type = 12
								if GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = 1
								else
									GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] + 1
								end
							end
							break
						end
					end
				end
			else
				API_ResponseWrite('<text>魔法施放失败，再来一次吧。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
			end
		else
			API_ResponseWrite('<text>魔法施放失败，再来一次吧。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
		end
	else
		API_ResponseWrite('<text>那么，你希望获得什么样的灵魂绑定装备呢？</text><br><br>')
		for j in yjdsh_jingyuankapaiduihuanguanzhuangbei do
			local Name = yjdsh_jingyuankapaiduihuanguanzhuangbei[j].Name
			local Tip = ''
			Tip = Tip..'<br><text color="255,255,255">'..string.format("%-22s",Name)..'  </text>'
			API_ResponseWrite(''..Tip..'')
			API_ResponseWrite('<a href="yjdsh_jingyuanduihuanguandianji3?1=1&2='..j..'">兑换</a><br>') 
		end
		API_ResponseWrite('<br><br><a href="yjdsh_jingyuanduihuanguandianji">返回</a>')
		API_ResponseFlush(ActorID)
	end
end

function yjdsh_BOSSbeginoverpanduan(MapID,mid,fid,type1) --boss开战 结束 判断
	if type1 == 1 then
		yjdsh_BOSSbegin(MapID,mid,fid)
	elseif type1 == 2 then
		yjdsh_BOSSover(MapID,mid,fid)
	end
end
function yjdsh_BOSSbegin(MapID,mid,fid) --BOSS开战
	if mid == dushiguangchangBoss1 then
		API_SetMapVarData(MapID,18,1)
	end
	if mid == jiangjun then
		API_SetMapVarData(MapID,19,1)
		--启动一个增加BUFF的时间触发器
		API_CreateTimerTriggerG(0,0,10,1,'yjdsh_jiangjunBOSSxiaoguaibuff')
	end
end
function yjdsh_BOSSover(MapID,mid,fid) --BOSS结束
	if mid == dushiguangchangBoss1 then
		API_SetMapVarData(MapID,18,0)
		for i = 1,10 do
			local StatusID = 1002000 + i
			API_MonsterRemoveStatus(fid,StatusID)
		end
		yjdsh_dshgchBOSSkillnum = 0
		local FastHP = API_MonsterGetPropNum(fid,2)
		local FastMAXHP = API_MonsterGetPropNum(fid,3)
		local addhp = FastMAXHP - FastHP
		API_MonsterAddHP(fid,addhp)
		--范围广播
		local playernumtable9 = API_GetActorInArea(MapID,1,400,453,500,510) --都市广场
		if type(playernumtable9) == "table" then
			for i,v in pairs(playernumtable9) do
				API_ActorSendMsg(v, 1, '“'..API_GetMonsterNameByID(mid)..'”距离起始位置过远，脱离了战斗，恢复到最初状态。')
			end
		end
	end
	if mid == jiangjun then
		API_SetMapVarData(MapID,19,0)
		local FastHP = API_MonsterGetPropNum(fid,2)
		local FastMAXHP = API_MonsterGetPropNum(fid,3)
		local addhp = FastMAXHP - FastHP
		API_MonsterAddHP(fid,addhp)
		yjdsh_jiangjunquguaiwushangchu(MapID)
		yjdsh_jiangjun4qu(MapID,0)
		--范围广播
		local playernumtable9 = API_GetActorInArea(MapID,1,295,685,410,735) --将军4
		if type(playernumtable9) == "table" then
			for i,v in pairs(playernumtable9) do
				API_ActorSendMsg(v, 1, '“'..API_GetMonsterNameByID(mid)..'”距离起始位置过远，脱离了战斗，恢复到最初状态。')
			end
		end
	end
	--API_ActorBDCMsg(MapID,0,-1,50,85,0,1,'“'..API_GetMonsterNameByID(mid)..'”距离起始位置过远，脱离了战斗，恢复到最初状态。')	
end
--[[function yjdsh_fangbaoBossaddbuff(ActorID)
	--判断玩家身上是否由XX BUFF 有的话 BUFFID+1 没用的话用1级BUFF
	local buffid = 973001 --第一层BUFFID
	for i = 1,10 do
		local StatusMainID =  973000 + i 
		if API_ActorFindStatusEx(ActorID,StatusMainID) then
			if i == 10 then
				buffid = StatusMainID
			else
				buffid = StatusMainID + 1
			end
			break
		end
	end
	API_ActorAddStatus(ActorID,buffid,1800000)
	local nowtime = os.time()
	API_VarDataSetNumber(ActorID,1,12183,nowtime)
	API_VarDataSetNumber(ActorID,1,12184,buffid)
	--yjdsh_zhuangbeinaijiujiangdi(ActorID)
end]]
function yjdsh_wanjiaquanjuwanjiasiwangchufaqi(Param_1,Param_2,Type, CreatureID, lKillerType, lKillerID, lMonsterID,MapID, lPosX, lPosY)--全局玩家死亡回调
	if Type ~= 1 then
		return
	end
	if lKillerType == -1 or lKillerID == -1 then
		return
	end	
	if API_GetMapVarData(MapID,14) > 0 then  --如果2区BOSS已经进入重置时间了 那么返回
		return
	end
	local guichengshijian = API_VarDataGetNumber_Ex(1,0,OwnerID,1,14) --如果正在进行归城事件 那么返回
	if guichengshijian == 1 then
		return
	end	
	if API_GetMapVarData(MapID,18) ~= 1 then  --如果2号BOSS不在开战状态 那么返回
		return
	end
	if lKillerType == 0 then
		if yjdsh_7qufidtable[dushiguangchangBoss1][1] ~= nil and yjdsh_7qufidtable[dushiguangchangBoss1][1] > 0 then
			local fastid = yjdsh_7qufidtable[dushiguangchangBoss1][1]
			if fastid ~= nil then
				if lKillerID == fastid then
					--执行BOSS属性添加函数
					yjdsh_dshgchBOSS1shuxingadd(MapID,lMonsterID)
				end
			end	
		end	
	end
	if lKillerType == 1 then
		if API_ActorFindStatus(lKillerID,930) then
			yjdsh_dshgchBOSS1shuxingadd(MapID,lMonsterID)
		end
	end
end
--[[function yjdsh_zhuangbeinaijiujiangdi(ActorID)
	for i=1,20 do
		local shuzhi = 2 * 128 --每128下 扣1点 所以实际数值是*128
		API_ChgActorEquipCurWare(ActorID,i,-shuzhi)
	end
end]]
function yjdsh_ReliveRood1(ActorID,ReliveTime,MapID,StaticMapID,DynamicReliveTileX,DynamicReliveTileY)
	local MapConfigID = API_GetMapConfigID(MapID)
	if MapConfigID ~= yijidushipeizhimapid then
		return
	end
	local ReliveDegree = API_VarDataGetNumber(ActorID,1,GLOBAL_ReliveDegree) --获取玩家的复活次数 进出时需要重置
	local PresentReliveRoodNum = API_ActorGetGoodsNum(ActorID,GLOBAL_PresentReliveRoodID) --获取徽章数量
	local DeathDegree = API_VarDataGetNumber(ActorID,1,GLOBAL_DeathDegree) --获取玩家的死亡数
	DeathDegree = DeathDegree + 1
	API_VarDataSetNumber(ActorID,1,GLOBAL_DeathDegree,DeathDegree)		
	local freerelivenum = yjdsh_freerelivenumchaxun(ActorID) --判断免费复活情况
	if freerelivenum > 0 then --可以免费复活
		local NeedReliveRoodNum = ReliveDegree + 1
		local YDNeedReliveRoodNum = NeedReliveRoodNum + 1
		if freerelivenum >  12 then
			freerelivenum = 12
		end
		API_VarDataSetNumber(ActorID,1,12185,freerelivenum)
		API_CreateTimerTrigger(ActorID,5,freerelivenum,-1,'yjdsh_freerelivetime')
		local freerelivetime = freerelivenum * 5
		API_ActorSendMsg(ActorID,2,'佣兵团获得此区域免费复活权，'..freerelivetime..'秒后原地复活')
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win ntype="1" close="0" rect="530,175,285,289" move="1" alpha="0" balpha="0"></win>')
		API_ResponseWrite('<img src="LuaUse\\Relive.tga" pos="1" x="0" y="0">')
		API_ResponseWrite('<br><br><br><br><text Size="15" color="255,255,0">    在复活倒计时中，点击“原地  复活”，可以直接复活。（需要消 耗“重生十字章”）</text><br><br><text></text><br><br>')
		API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_YuanDiFuHuo_u.tga" src2="LuaUse\\button1_YuanDiFuHuo_l.tga" tip="<text size=\'14\' color=\'0,255,0\'>复活消耗：</text>\n<img sc=\'57040\' frame=\'1\' Delay=\'200\' type=\'2\'>\n重生十字章 X '..YDNeedReliveRoodNum..'" href="yjdsh_ReliveRood2?1=1&2='..ActorID..'&3='..ReliveTime..'&4='..MapID..'&5='..StaticMapID..'&6='..DynamicReliveTileX..'&7='..DynamicReliveTileY..'"><br>')
		API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_LiKaiyijizhicheng_u.tga" src2="LuaUse\\button1_LiKaiyijizhicheng_l.tga" href="YBT_PVE_ReliveRood2?1=3&2='..ActorID..'&3='..ReliveTime..'&4='..MapID..'&5='..StaticMapID..'&6='..DynamicReliveTileX..'&7='..DynamicReliveTileY..'"><br>')
		return
	end
	if PresentReliveRoodNum > 0 then
		local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
		API_ActorRemoveGoods(ActorID,GLOBAL_PresentReliveRoodID,1,'复活删除装备1') --去除一个徽章
		API_ActorRelive(ActorID,MapID,TileX,TileY,-1,-1) --原地复活玩家
		local shengyucishu = PresentReliveRoodNum - 1
		if shengyucishu > 0 then
			API_ActorSendMsg(ActorID,2,'您已复活，消耗系统赠送重生十字章1枚,本次战斗还可以免费复活'..shengyucishu..'次')
		else
			API_ActorSendMsg(ActorID,2,'您已复活，消耗系统赠送重生十字章1枚,本次战斗您已经不能免费复活了')
		end
		--API_ActorSendMsg(ActorID,1,'因死亡离开命运之地，需要等10分钟才能再次进入。')
	else
		--记录复活点
		local FuHuoDianSave = DynamicReliveTileX * 10000 + DynamicReliveTileY
		API_VarDataSetNumber(ActorID,0,18403,FuHuoDianSave)
		API_VarDataSetNumber(ActorID,0,18404,ReliveTime)
		--丢卷轴
		API_RemoveTaskScroll(ActorID,3)
		API_AddTaskScrollEx(ActorID,3,104105,'ReliveRood_JuanZhou',0)
		local NeedReliveRoodNum = ReliveDegree + 1
		local ExpLevel = API_GetActorExpLevel(ActorID)
		local YDNeedReliveRoodNum = NeedReliveRoodNum + 1
		local DeathDegreeCN = PublicFun_ArabianNumberToChineseNumber(DeathDegree)
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win ntype="1" close="0" rect="530,175,285,289" move="1" alpha="0" balpha="0"></win>')
		API_ResponseWrite('<img src="LuaUse\\Relive.tga" pos="1" x="0" y="0">')
		API_ResponseWrite('<br><br><br><br><text Size="20" color="255,255,0">       第'..DeathDegreeCN..'次死亡</text><br><br><text>       （您已经不能再免费复活了）</text><br><br>')
		API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_YuanDiFuHuo_u.tga" src2="LuaUse\\button1_YuanDiFuHuo_l.tga" tip="<text size=\'14\' color=\'0,255,0\'>复活消耗：</text>\n<img sc=\'57040\' frame=\'1\' Delay=\'200\' type=\'2\'>\n重生十字章 X '..YDNeedReliveRoodNum..'" href="yjdsh_ReliveRood2?1=1&2='..ActorID..'&3='..ReliveTime..'&4='..MapID..'&5='..StaticMapID..'&6='..DynamicReliveTileX..'&7='..DynamicReliveTileY..'"><br>')
		--API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_GotoBase_u.tga" src2="LuaUse\\button1_GotoBase_l.tga" tip="<text size=\'14\' color=\'0,255,0\'>复活消耗：</text>\n<img sc=\'57040\' frame=\'1\' Delay=\'200\' type=\'2\'>\n重生十字章 X '..NeedReliveRoodNum..'" href="YBT_PVE_ReliveRood2?1=2&2='..ActorID..'&3='..ReliveTime..'&4='..MapID..'&5='..StaticMapID..'&6='..DynamicReliveTileX..'&7='..DynamicReliveTileY..'"><br>')
--离开遗迹之城的图片		
		API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_LiKaiyijizhicheng_u.tga" src2="LuaUse\\button1_LiKaiyijizhicheng_l.tga" href="YBT_PVE_ReliveRood2?1=3&2='..ActorID..'&3='..ReliveTime..'&4='..MapID..'&5='..StaticMapID..'&6='..DynamicReliveTileX..'&7='..DynamicReliveTileY..'"><br>')
		API_ResponseFlush(ActorID)
	end
	local Type = 6
	local LaiYuan = API_ActorGetPropNum(ActorID,201)
	if GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] == nil then
		GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = 1
	else
		GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] + 1
	end
end
function yjdsh_ReliveRood2(ActorID,ReliveTime,MapID,StaticMapID,DynamicReliveTileX,DynamicReliveTileY)

	local ActorID = API_RequestGetActorID()
	API_RemoveTaskScroll(ActorID,3)
	local SelectItem = API_RequestGetNumber(1)
	local ReliveTime = API_RequestGetNumber(3)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local DynamicReliveTileX = API_RequestGetNumber(6)
	local DynamicReliveTileY = API_RequestGetNumber(7)
	local ExpLevel = API_GetActorExpLevel(ActorID)	
	--if GLOBAL_ReliveRoodNum_StaticMapID[MapConfigID] ~= nil then
	 
	local Point = API_ActorGetPropNum(ActorID,183)
	if SelectItem == 1  then
		local ReliveDegree = API_VarDataGetNumber(ActorID,1,GLOBAL_ReliveDegree)
		local DeathDegree = API_VarDataGetNumber(ActorID,1,GLOBAL_DeathDegree)
		local DeathDegreeCN = PublicFun_ArabianNumberToChineseNumber(DeathDegree)
		local PurchaseReliveRoodNum = API_ActorGetGoodsNum(ActorID,GLOBAL_PurchaseReliveRoodID)
		local NeedReliveRoodNum = ReliveDegree + 1
		local YDNeedReliveRoodNum = NeedReliveRoodNum + 1
		local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
		if PurchaseReliveRoodNum >= YDNeedReliveRoodNum then
			GLOBAL_ReliveRoodNum_PlayTable[ActorID] = 1
			API_ActorRemoveGoods(ActorID,GLOBAL_PurchaseReliveRoodID,YDNeedReliveRoodNum,'复活删除装备2')
-------------------------------------------------------------------------------------------------------风向标  复活徽章使用数			
			API_ActorRelive(ActorID,MapID,TileX,TileY,-1,-1)
			ReliveDegree = ReliveDegree + 1
			API_VarDataSetNumber(ActorID,1,GLOBAL_ReliveDegree,ReliveDegree)
			API_VarDataSetNumber(ActorID,1,12185,0)
			local Type = 5
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = YDNeedReliveRoodNum
			else
				GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] + YDNeedReliveRoodNum
			end
		else
			local needNum = YDNeedReliveRoodNum - PurchaseReliveRoodNum
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win ntype="1" close="0" rect="530,175,285,289" move="1" alpha="0" balpha="0"></win>')
			API_ResponseWrite('<img src="LuaUse\\Relive.tga" pos="1" x="0" y="0">')
			API_ResponseWrite('<br><br><br><br><text Size="20" color="255,255,0">       第'..DeathDegreeCN..'次死亡</text><br><br><text color="255,0,0">   本次原地复活需要：</text><text color="254,249,220">'.. YDNeedReliveRoodNum ..'个 </text>')
			API_ResponseWrite('<a allcolor="254,249,220" closewindow="0" tip="复活道具\n请点击右下角的“商城”按钮购买\n<img sc=\'57040\' frame=\'1\' Delay=\'200\' type=\'2\'>\n重生十字章 X '..needNum..'">重生十字章</a><br><br>')
			API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_YuanDiFuHuo_u.tga" src2="LuaUse\\button1_YuanDiFuHuo_l.tga" tip="<text size=\'14\' color=\'0,255,0\'>复活消耗：</text>\n<img sc=\'57040\' frame=\'1\' Delay=\'200\' type=\'2\'>\n重生十字章 X '..YDNeedReliveRoodNum..'" href="YBT_PVE_ReliveRood2?1=1&2='..ActorID..'&3='..ReliveTime..'&4='..MapID..'&5='..StaticMapID..'&6='..DynamicReliveTileX..'&7='..DynamicReliveTileY..'"><br>')
			--API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_GotoBase_u.tga" src2="LuaUse\\button1_GotoBase_l.tga" tip="<text size=\'14\' color=\'0,255,0\'>复活消耗：</text>\n<img sc=\'57040\' frame=\'1\' Delay=\'200\' type=\'2\'>\n重生十字章 X '..NeedReliveRoodNum..'" href="YBT_PVE_ReliveRood2?1=2&2='..ActorID..'&3='..ReliveTime..'&4='..MapID..'&5='..StaticMapID..'&6='..DynamicReliveTileX..'&7='..DynamicReliveTileY..'"><br>')
			API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button1_LiKaiyijizhicheng_u.tga" src2="LuaUse\\button1_LiKaiyijizhicheng_l.tga" href="YBT_PVE_ReliveRood2?1=3&2='..ActorID..'&3='..ReliveTime..'&4='..MapID..'&5='..StaticMapID..'&6='..DynamicReliveTileX..'&7='..DynamicReliveTileY..'"><br>')
		end
	elseif SelectItem == 2 then
	elseif SelectItem == 3 then		
		GLOBAL_ReliveRoodNum_PlayTable[ActorID] = 1
		API_ActorRelive(ActorID,-1,-1,-1,-1,-1)
		API_VarDataSetNumber(ActorID,1,12185,0)
	end
end
function yjdsh_freerelivetime(ActorID)
	local TriggerID = API_GetCurTriggerID()
	local freerelivenum = API_VarDataGetNumber(ActorID,1,12185)
	if freerelivenum == 0 then
		API_DestroyTrigger(ActorID,-1,TriggerID)
		return
	end
	freerelivenum = freerelivenum - 1
	API_VarDataSetNumber(ActorID,1,12185,freerelivenum)
	local freerelivetime = freerelivenum * 5
	if freerelivenum == 0 then
		local MapID = API_GetActorMapID(ActorID)
		local x = API_GetActorPosX(ActorID)
		local y = API_GetActorPosY(ActorID)
		API_ActorRelive(ActorID,MapID,x,y,-1,-1)
		API_ActorSendMsg(ActorID,2,'佣兵团获得此区域免费复活权，原地复活成功')
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win ntype="1" close="0" rect="1530,1175,285,289" move="1" alpha="0" balpha="0"></win>')
		API_ResponseWrite('<br><text></text>')
		API_ResponseFlush(ActorID)
		API_DestroyTrigger(ActorID,-1,TriggerID)
	else
		API_ActorSendMsg(ActorID,2,'佣兵团获得此区域免费复活权，'..freerelivetime..'秒后原地复活')
	end	
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------第一部分结束
--第二部分 一区部分 
--怪物创建部分 怪物的创建和刷新
--刷怪思路修改 由一个触发器统一控制 改为9个触发器分别控制 BOSS部分刷新方案也更改
--代码部分
function yjdsh_lblianji1qushuaguai(MapID) --联邦练级1区
	local renshu = API_GetMapVarData(MapID,1) --获取当前区域人数 根据人数进表 决定下次回调时间
	local time1 = 20
	for i in yjdsh_quanqushuaxintimetable[1] do
		if yjdsh_quanqushuaxintimetable[1][i] ~= nil then
			local biaozhun = yjdsh_quanqushuaxintimetable[1][i].n
			if renshu <= biaozhun then
				time1 = yjdsh_quanqushuaxintimetable[1][i].t
				break
			end
		end
	end
	local xunluodui = 0
	for i in yjdsh_1qumonstertable do --进入1区表进行循环 找怪 放置
		if yjdsh_1qumonstertable[i] ~= nil then  
			for j in yjdsh_1qumonstertable[i] do  --找到怪物后进行循环
				if yjdsh_1qumonstertable[i][j] ~= nil then		--如果怪物对应的坐标不是空		
					if type(yjdsh_1qufidtable[i])  ~= 'table' or yjdsh_1qufidtable[i] == nil then  --判断要放置怪物FID的表是否存在 不存在就创建
						yjdsh_1qufidtable[i] = {}
					end 
					local ok = 0	--设置1个是否刷怪的标志
					if yjdsh_1qufidtable[i][j] == nil then	--判断放置怪物FID的表 要放置的位置 是否为空 这个位置对应怪物坐标的位置	
					else
						local Fid = yjdsh_1qufidtable[i][j]  --如果已经有数值了 那么取出来 看看怪物是否还存在
						if Fid ~= nil then
							local mid2 = API_GetMonsterID(Fid)
							if mid2 > 0 then	--如果存在 那么标志设置为 1 不刷新了
								ok = 1
							end
						end	
					end
					if ok == 0 then				
						--巡逻队处理
						--只要1号存在 就肯定不刷
						--1号不存在的时候 要看2号是否存在 如果存在不刷
						--如果2号也不存在 那么刷新1号 同时设置标志 2号判断有标志才刷
						--如果精英1不存在 那么判断精英2是否存在 如果不存在那么刷新精英1
						--如果精英2不存在 那么判断精英1是否存在 如果不存在那么刷新精英2
						--如果精英1 精英2 都不存在 那么小怪删除
						if i == jyjixiewulibing58 then --如果精英1不存在
							local mid2 = yjdsh_1qufidtable[jyjixiehuoyaobing58][1]
							if mid2 ~= nil then
								if API_GetMonsterID(mid2) > 0 then --如果精英2存在 则 OK = 1
									ok = 1 --存在则 不刷
								end
							end	
						end
						--1号刷新的时候 2号肯定不存在的  每次刷新操作 标志都会重置为 0
						--巡逻队处理结束
					end
					if ok == 0 then
						local x =  yjdsh_1qumonstertable[i][j].x
						local y =  yjdsh_1qumonstertable[i][j].y
						local z =  yjdsh_1qumonstertable[i][j].z
						local lujing = yjdsh_1qumonstertable[i][j].lujing
						local levelcha = 0
						if i == jixiewulibing56 or i == jixiehuoyaobing56 or i == jixiemofabing56 then
							levelcha = math.random(-1,1)
						end
						--巡逻队处理
						
						local mID = i + levelcha 
						local fastid = 0
						if yjdsh_jymonsterdroptypetable[mID] ~= nil then
							local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
							if math.mod(Minute,8) == 0 then
								fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
							end
						else
							fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
						end
						if fastid > 0 then
							yjdsh_1qufidtable[i][j] = fastid
							if z > 0 then
								API_MonsterAddStatus(fastid,z,0)
								local z2 = z + 2000
								API_MonsterAddStatus(fastid,z2,0)
							end
							if lujing ~= nil and lujing > 0 then
								local xys = yjdsh_1qumonstertable[i][j].xys
								API_MonsterPathPatrol(fastid,lujing,xys)
							end
							--创建精英怪死亡触发器
							if yjdsh_jymonsterdroptypetable[mID] ~= nil then
								API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
							end
							if i == jyjixiewulibing58 then
								API_MonsterPathPatrol(fastid,8,{x,y,3,386,216,3,384,230,3,387,244,3,397,261,3,387,244,3,384,230,3,386,216,3,}) --WYL巡逻
								for k in yjdsh_1quxunluoduitable do
									for p in yjdsh_1quxunluoduitable[k] do
										local Fid2 = yjdsh_1qufidtable[k][p]
										if Fid2 ~= nil then									
											if API_GetMonsterID(Fid2) > 0 then --如果精英2存在 则 OK = 1
												API_DestroyMonster(Fid2)
											end
										end
										local x =  yjdsh_1quxunluoduitable[k][p].x
										local y =  yjdsh_1quxunluoduitable[k][p].y
										local z =  yjdsh_1quxunluoduitable[k][p].z
										local lujing = yjdsh_1quxunluoduitable[k][p].lujing
										local fastid = API_CreateMonster(MapID,k,x,y,5,0,-1) 	
										yjdsh_1qufidtable[k][p] = fastid
										if z > 0 then
											API_MonsterAddStatus(fastid,z,0)
											local z2 = z + 2000
											API_MonsterAddStatus(fastid,z2,0)
										end		
										API_MonsterPathPatrol(fastid,8,{x,y,3,386,216,3,384,230,3,387,244,3,397,261,3,387,244,3,384,230,3,386,216,3,}) --WYL巡逻
										--创建精英怪死亡触发器
										if yjdsh_jymonsterdroptypetable[k] ~= nil then
											API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
										end
									end
								end							
							end
						end
					end
				end
			end
		end
	end
	API_CreateTimerTriggerG(MapID,0,time1,1,'yjdsh_lblianji1qushuaguai')
end
function yjdsh_dglianji1qushuaguai(MapID) --帝国练级1区
	local renshu = API_GetMapVarData(MapID,2)
	local time1 = 20
	for i in yjdsh_quanqushuaxintimetable[2] do
		if yjdsh_quanqushuaxintimetable[2][i] ~= nil then
			local biaozhun = yjdsh_quanqushuaxintimetable[2][i].n
			if renshu <= biaozhun then
				time1 = yjdsh_quanqushuaxintimetable[2][i].t
				break
			end
		end
	end
	local xunluodui = 0
	for i in yjdsh_2qumonstertable do --进入1区表进行循环 找怪 放置
		if yjdsh_2qumonstertable[i] ~= nil then  
			for j in yjdsh_2qumonstertable[i] do  --找到怪物后进行循环
				if yjdsh_2qumonstertable[i][j] ~= nil then		--如果怪物对应的坐标不是空		
					if type(yjdsh_2qufidtable[i])  ~= 'table' or yjdsh_2qufidtable[i] == nil then  --判断要放置怪物FID的表是否存在 不存在就创建
						yjdsh_2qufidtable[i] = {}
					end 
					local ok = 0	--设置1个是否刷怪的标志
					if yjdsh_2qufidtable[i][j] == nil then	--判断放置怪物FID的表 要放置的位置 是否为空 这个位置对应怪物坐标的位置	
					else
						local Fid = yjdsh_2qufidtable[i][j]  --如果已经有数值了 那么取出来 看看怪物是否还存在
						if Fid ~= nil then
							local mid2 = API_GetMonsterID(Fid)
							if mid2 > 0 then	--如果存在 那么标志设置为 1 不刷新了
								ok = 1
							end
						end	
					end	
					if ok == 0 then				
						--巡逻队处理
						--只要1号存在 就肯定不刷
						--1号不存在的时候 要看2号是否存在 如果存在不刷
						--如果2号也不存在 那么刷新1号 同时设置标志 2号判断有标志才刷
						--如果精英1不存在 那么判断精英2是否存在 如果不存在那么刷新精英1
						--如果精英2不存在 那么判断精英1是否存在 如果不存在那么刷新精英2
						--如果精英1 精英2 都不存在 那么小怪删除
						if i == jyjixiewulibing58 then --如果精英1不存在
							local mid2 = yjdsh_2qufidtable[jyjixiehuoyaobing58][1]
							if mid2 ~= nil then
								if API_GetMonsterID(mid2) > 0 then --如果精英2存在 则 OK = 1
									ok = 1 --存在则 不刷
								end	
							end
						end
					end						
					if ok == 0 then
						local x =  yjdsh_2qumonstertable[i][j].x
						local y =  yjdsh_2qumonstertable[i][j].y
						local z =  yjdsh_2qumonstertable[i][j].z
						local lujing = yjdsh_2qumonstertable[i][j].lujing
						local levelcha = 0
						if i == jixiewulibing56 or i == jixiehuoyaobing56 or i == jixiemofabing56 then
							levelcha = math.random(-1,1)
						end
						--巡逻队处理
					
						local mID = i + levelcha 
						local fastid = 0
						if yjdsh_jymonsterdroptypetable[mID] ~= nil then
							local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
							if math.mod(Minute,8) == 0 then
								fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
							end
						else
							fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
						end
						if fastid > 0 then
							yjdsh_2qufidtable[i][j] = fastid
							if z > 0 then
								API_MonsterAddStatus(fastid,z,0)
								local z2 = z + 2000
								API_MonsterAddStatus(fastid,z2,0)
							end	
							if lujing ~= nil and lujing > 0 then
								local xys = yjdsh_2qumonstertable[i][j].xys
								API_MonsterPathPatrol(fastid,lujing,xys)
							end
							--创建精英怪死亡触发器
							if yjdsh_jymonsterdroptypetable[mID] ~= nil then
								API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
							end
							if i == jyjixiewulibing58 then
								API_MonsterPathPatrol(fastid,10,{x,y,2,553,211,2,557,225,2,556,239,2,551,252,2,537,268,2,551,252,2,556,239,2,557,225,2,553,211,2,}) --WYL巡逻
								for k in yjdsh_2quxunluoduitable do
									for p in yjdsh_2quxunluoduitable[k] do
										local Fid2 = yjdsh_2qufidtable[k][p]
										if Fid2 ~= nil then								
											if API_GetMonsterID(Fid2) > 0 then --如果精英2存在 则 OK = 1
												API_DestroyMonster(Fid2)
											end
										end
										local x =  yjdsh_2quxunluoduitable[k][p].x
										local y =  yjdsh_2quxunluoduitable[k][p].y
										local z =  yjdsh_2quxunluoduitable[k][p].z
										local lujing = yjdsh_2quxunluoduitable[k][p].lujing
										local fastid = API_CreateMonster(MapID,k,x,y,5,0,-1) 	
										yjdsh_2qufidtable[k][p] = fastid
										if z > 0 then
											API_MonsterAddStatus(fastid,z,0)
											local z2 = z + 2000
											API_MonsterAddStatus(fastid,z2,0)
										end
										--创建精英怪死亡触发器
										if yjdsh_jymonsterdroptypetable[k] ~= nil then
											API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
										end
										API_MonsterPathPatrol(fastid,10,{x,y,2,553,211,2,557,225,2,556,239,2,551,252,2,537,268,2,551,252,2,556,239,2,557,225,2,553,211,2,}) --WYL巡逻
									end
								end							
							end
						end
					end
				end
			end
		end
	end
	API_CreateTimerTriggerG(MapID,0,time1,1,'yjdsh_dglianji1qushuaguai')
end
function yjdsh_lbchengmenqushuaguai(MapID,Type) --联邦城门区
	local renshu = API_GetMapVarData(MapID,10)
	local time1 = 20
	for i in yjdsh_quanqushuaxintimetable[10] do
		if yjdsh_quanqushuaxintimetable[10][i] ~= nil then
			local biaozhun = yjdsh_quanqushuaxintimetable[10][i].n
			if renshu <= biaozhun then
				time1 = yjdsh_quanqushuaxintimetable[10][i].t
				break
			end
		end
	end
	if API_GetMapVarData(MapID,12) == 0 then --没有重置时间 就刷怪
		for i in yjdsh_3qumonstertable do --进入1区表进行循环 找怪 放置
			if yjdsh_3qumonstertable[i] ~= nil then  
				for j in yjdsh_3qumonstertable[i] do  --找到怪物后进行循环
					if yjdsh_3qumonstertable[i][j] ~= nil then		--如果怪物对应的坐标不是空		
						if type(yjdsh_3qufidtable[i])  ~= 'table' or yjdsh_3qufidtable[i] == nil then  --判断要放置怪物FID的表是否存在 不存在就创建
							yjdsh_3qufidtable[i] = {}
						end 
						local ok = 0	--设置1个是否刷怪的标志
						if yjdsh_3qufidtable[i][j] == nil then	--判断放置怪物FID的表 要放置的位置 是否为空 这个位置对应怪物坐标的位置	
						else
							local mid2 = yjdsh_3qufidtable[i][j]  --如果已经有数值了 那么取出来 看看怪物是否还存在
							if mid2 ~= nil then
								if API_GetMonsterID(mid2) > 0 then	--如果存在 那么标志设置为 1 不刷新了
									ok = 1
								end
							end	
						end	
						if ok == 0 then
							local x =  yjdsh_3qumonstertable[i][j].x
							local y =  yjdsh_3qumonstertable[i][j].y
							local z =  yjdsh_3qumonstertable[i][j].z
							local levelcha = 0
							if i == chengmenwulishouwei58 or i == chengmenmofashouwei58 or i == chengmenhuoyaoshouwei58 then
								levelcha = math.random(0,1)
								--x = math.random(396,436)  --WYL防报错
								--y = math.random(265,295)  --WYL防报错
							end
							local mID = i + levelcha 
							local fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
							if mID == chengmen then
								API_CreateDieTriggerG(1,0,0,fastid,'yjdsh_chengmensiwanghuidiao') --创建门死亡触发器 联邦第一项填1 帝国第一项填2
								API_SetVariantProperty(1,fastid,1,1,2)

								local TriggerG = API_GetMapVarData(MapID,16)
								if TriggerG > 0 then
									API_DestroyTriggerG(TriggerG)
								end
								TriggerG = API_CreateAreaCreatureTriggerG(1,MapID,MapID,lianbangquchuchufaqiX,lianbangquchuchufaqiY,8,'yjdsh_chengmenquyujiankong')
								API_SetMapVarData(MapID,16,TriggerG) --17区域触发器
								local TriggerG = API_GetMapVarData(MapID,37)
								if TriggerG > 0 then
									API_DestroyTriggerG(TriggerG)
								end
								API_SetMapVarData(MapID,37,0)
													
							end
							yjdsh_3qufidtable[i][j] = fastid
							if bingying == i or jixiepao == i then --如果是机械跑和兵营的表 那么增加无敌BUFF
								--添加无敌BUFF
								API_MonsterAddStatus(fastid,206001,0)
							end
							if z > 0 then
								API_MonsterAddStatus(fastid,z,0)
								local z2 = z + 2000
								API_MonsterAddStatus(fastid,z2,0)
							end
							--创建精英怪死亡触发器
							if yjdsh_jymonsterdroptypetable[mID] ~= nil and mID ~= chengmen then
								API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
							end
						end
					end
				end
			end
		end
	end
	if Type == 1 then
		API_CreateTimerTriggerG(MapID,Type,time1,1,'yjdsh_lbchengmenqushuaguai')
	end
end
function yjdsh_dgchengmenqushuaguai(MapID,Type) --帝国城门区
	local renshu = API_GetMapVarData(MapID,11) 
	local time1 = 20
	for i in yjdsh_quanqushuaxintimetable[11] do
		if yjdsh_quanqushuaxintimetable[11][i] ~= nil then
			local biaozhun = yjdsh_quanqushuaxintimetable[11][i].n
			if renshu <= biaozhun then
				time1 = yjdsh_quanqushuaxintimetable[11][i].t
				break
			end
		end
	end
	if API_GetMapVarData(MapID,13) == 0 then --没有重置时间 就刷怪
		for i in yjdsh_4qumonstertable do --进入1区表进行循环 找怪 放置
			if yjdsh_4qumonstertable[i] ~= nil then  
				for j in yjdsh_4qumonstertable[i] do  --找到怪物后进行循环
					if yjdsh_4qumonstertable[i][j] ~= nil then		--如果怪物对应的坐标不是空		
						if type(yjdsh_4qufidtable[i])  ~= 'table' or yjdsh_4qufidtable[i] == nil then  --判断要放置怪物FID的表是否存在 不存在就创建
							yjdsh_4qufidtable[i] = {}
						end 
						local ok = 0	--设置1个是否刷怪的标志
						if yjdsh_4qufidtable[i][j] == nil then	--判断放置怪物FID的表 要放置的位置 是否为空 这个位置对应怪物坐标的位置	
						else
							local mid2 = yjdsh_4qufidtable[i][j]  --如果已经有数值了 那么取出来 看看怪物是否还存在
							if mid2 ~= nil then
								if API_GetMonsterID(mid2) > 0 then	--如果存在 那么标志设置为 1 不刷新了
									ok = 1
								end
							end	
						end	
						if ok == 0 then
							local x =  yjdsh_4qumonstertable[i][j].x
							local y =  yjdsh_4qumonstertable[i][j].y
							local z =  yjdsh_4qumonstertable[i][j].z
							local levelcha = 0
							if i == chengmenwulishouwei58 or i == chengmenmofashouwei58 or i == chengmenhuoyaoshouwei58 then
								levelcha = math.random(0,1)
								--x = math.random(485,526)  --WYL防报错
								--y = math.random(266,294)  --WYL防报错
							end
							local mID = i + levelcha 
							local fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
							if mID == chengmen then
								API_CreateDieTriggerG(2,0,0,fastid,'yjdsh_chengmensiwanghuidiao') --创建门死亡触发器 联邦第一项填1 帝国第一项填2
								API_SetVariantProperty(1,fastid,1,1,2)
								
								local TriggerG = API_GetMapVarData(MapID,17)
								if TriggerG > 0 then
									API_DestroyTriggerG(TriggerG)
								end
								TriggerG = API_CreateAreaCreatureTriggerG(2,MapID,MapID,diguoquchuchufaqiX,diguoquchuchufaqiY,8,'yjdsh_chengmenquyujiankong')
								API_SetMapVarData(MapID,17,TriggerG) --17区域触发器
								local TriggerG = API_GetMapVarData(MapID,38)
								if TriggerG > 0 then
									API_DestroyTriggerG(TriggerG)
								end
								API_SetMapVarData(MapID,38,0)
							end
							yjdsh_4qufidtable[i][j] = fastid
							if bingying == i or jixiepao == i then --如果是机械跑和兵营的表 那么增加无敌BUFF
								--添加无敌BUFF
								API_MonsterAddStatus(fastid,206001,0)
							end			
							if z > 0 then
								API_MonsterAddStatus(fastid,z,0)
								local z2 = z + 2000
								API_MonsterAddStatus(fastid,z2,0)
							end
							--创建精英怪死亡触发器
							if yjdsh_jymonsterdroptypetable[mID] ~= nil and mID ~= chengmen then
								API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
							end
						end
					end
				end
			end
		end
	end
	if Type == 1 then
		API_CreateTimerTriggerG(MapID,Type,time1,1,'yjdsh_dgchengmenqushuaguai')
	end
end
function yjdsh_chengmenquyujiankong(zhenying,MapID,Type,CreatureID) --城门刷新 和 存在的时候 把周围的人传走
	if Type == 1 then
		local chuansongzuobiaoX = 0
		local chuansongzuobiaoY = 0
		if zhenying == 1 then
			chuansongzuobiaoX = 407
			chuansongzuobiaoY = 358
		end
		if zhenying == 2 then
			chuansongzuobiaoX = 496
			chuansongzuobiaoY = 358
		end
		API_ActorGoToMap(CreatureID,MapID,chuansongzuobiaoX,chuansongzuobiaoY) 	
		API_ActorSendMsg(CreatureID,1,'前方正在开战，不能通过')
	end
end
function yjdsh_chengmenquyujiankong2(zhenying,MapID,Type,CreatureID)
	if Type == 1 then
		local camp = API_GetActorCamp(CreatureID)
		local chuansongzuobiaoX = 0
		local chuansongzuobiaoY = 0
		if camp == 0 then
			chuansongzuobiaoX = 527
			chuansongzuobiaoY = 179
		else
			chuansongzuobiaoX = 412
			chuansongzuobiaoY = 179
		end
		API_ActorGoToMap(CreatureID,MapID,chuansongzuobiaoX,chuansongzuobiaoY) 	
		API_ActorSendMsg(CreatureID,1,'城门即将刷新，不能通过')
	end
end
--门死亡触发器
--调用后 掉落
--喊话
--记录重置
function yjdsh_chengmensiwanghuidiao(zhenying,Param_2,Type,CreatureID,KillerType,KillerID, MonsterID, MapID,PosX,PosY,leixing,shuzhi) --城门死亡回调
	if MapID == 0 then
		MapID = API_GetRightMapID(yijidushipeizhimapid)
	end
	local nowtime = os.time()
	local playernumtable = {}
	local playernum = 0
	local zhengying2 = ''
	local Conname = ''
	local chengmen = '城门'
	if zhenying == 1 then
		yjdsh_freerelivetriggerdelete(28,MapID)
		API_SetMapVarData(MapID,12,nowtime)
		playernumtable = API_GetActorInArea(MapID,1,392,265,440,297)
		playernum = table.getn(playernumtable)
		zhengying2 = '联邦'
		chengmen = '风暴要塞城门'
		--城门破碎  兵营和炮台删除
		local fastid2 = yjdsh_3qufidtable[jixiepao][1] 
		if fastid2 ~= nil then
			if API_GetMonsterID(fastid2) > 0 then
				API_DestroyMonster(fastid2)
			end
		end	
		local fastid2 = yjdsh_3qufidtable[jixiepao][2] 
		if fastid2 ~= nil then
			if API_GetMonsterID(fastid2) > 0 then
				API_DestroyMonster(fastid2)
			end		
		end	
		local fastid2 = yjdsh_3qufidtable[bingying][1] 
		if fastid2 ~= nil then
			if API_GetMonsterID(fastid2) > 0 then
				API_DestroyMonster(fastid2)
			end
		end	
		local fastid2 = yjdsh_3qufidtable[bingying][2] 
		if fastid2 ~= nil then
			if API_GetMonsterID(fastid2) > 0 then
				API_DestroyMonster(fastid2)
			end
		end	
		--WYL删除占位块
--~ 		for i = 1,14 do
--~ 			local fastid2 = yjdsh_3qufidtable[chengmenzhanwei][i]
--~ 			if fastid2 ~= nil then
--~ 				if API_GetMonsterID(fastid2) > 0 then
--~ 					API_DestroyMonster(fastid2)
--~ 				end
--~ 			end
--~ 		end
		--城门破碎区域触发器删除
		local TriggerG = API_GetMapVarData(MapID,16)
		if TriggerG > 0 then
			API_DestroyTriggerG(TriggerG)
		end
		API_SetMapVarData(MapID,16,0) --16区域触发器
	end
	if zhenying == 2 then
		yjdsh_freerelivetriggerdelete(29,MapID)
		API_SetMapVarData(MapID,13,nowtime)
		playernumtable = API_GetActorInArea(MapID,1,480,265,530,297)
		playernum = table.getn(playernumtable)
		zhengying2 = '帝国'
		chengmen = '磐石要塞城门'
		--城门破碎  兵营和炮台删除
		local fastid2 = yjdsh_4qufidtable[jixiepao][1] 
		if fastid2 ~= nil then
			if API_GetMonsterID(fastid2) > 0 then
				API_DestroyMonster(fastid2)
			end
		end	
		local fastid2 = yjdsh_4qufidtable[jixiepao][2] 
		if fastid2 ~= nil then
			if API_GetMonsterID(fastid2) > 0 then
				API_DestroyMonster(fastid2)
			end		
		end	
		local fastid2 = yjdsh_4qufidtable[bingying][1] 
		if fastid2 ~= nil then
			if API_GetMonsterID(fastid2) > 0 then
				API_DestroyMonster(fastid2)
			end
		end	
		local fastid2 = yjdsh_4qufidtable[bingying][2] 
		if fastid2 ~= nil then
			if API_GetMonsterID(fastid2) > 0 then
				API_DestroyMonster(fastid2)
			end
		end	
		--WYL删除占位块
--~ 		for i = 1,14 do
--~ 			local fastid2 = yjdsh_4qufidtable[chengmenzhanwei][i]
--~ 			if fastid2 ~= nil then
--~ 				if API_GetMonsterID(fastid2) > 0 then
--~ 					API_DestroyMonster(fastid2)
--~ 				end
--~ 			end
--~ 		end
		--城门破碎区域触发器删除
		local TriggerG = API_GetMapVarData(MapID,17)
		if TriggerG > 0 then
			API_DestroyTriggerG(TriggerG)
		end
		API_SetMapVarData(MapID,17,0) --17区域触发器
	end	
	local CF1,CF2,CF3,CF4,CF5 = 0,0,0,0,0
	local bingtuancunzai = 0
	if leixing == 3 then
		local renshu = API_GetTeamSize(shuzhi)
		for i = 1, renshu do
			if i == 1 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF1 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			elseif i == 2 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF2 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			elseif i == 3 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF3 = API_GetTopConsortiaId(aid)	
				bingtuancunzai = 1				
			elseif i == 4 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF4 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			elseif i == 5 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF5 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			end
		end	
	end
	--对兵团任务进行处理(此判断最好加个先决条件)
	if KillerType == 0 then	
		for i in playernumtable do
			local ConsortiaId = API_GetTopConsortiaId(playernumtable[i])
			local Camp2 = API_GetActorCamp(playernumtable[i])
			local TopConsortiaId = API_GetTopConsortiaId(playernumtable[i])
			if TopConsortiaId > 0 then	
				local renwujiaohu2 = API_VarDataGetNumber(playernumtable[i],1,12164)
				local zhuangtai2 = math.mod(renwujiaohu2,10)
				local taskid = 1811
				local taskname = '摧毁城门'
				local ybtshizheMAPID = YBT_yongbingtuanshizheweihi(Camp2)	
				if zhuangtai2 == 1 then
					API_UpdateTaskLeadEx(playernumtable[i],taskid,0,2,'成功摧毁可攻击的城门')
					--API_UpdateTaskLeadEx(playernumtable[i],taskid,0,2,'成功摧毁'..API_GetMonsterNameByID(MonsterID)..'')
					renwujiaohu2 = renwujiaohu2 + 1
					API_TaskLogUpdate(playernumtable[i],taskid,0,4,'<Task NPCName="'..API_GetMonsterNameByID(11727)..'" NpcID="11727" NPCPos="'..ybtshizheMAPID..'" condition="0" FinishNum="0" IsFinish="2">'..taskname..'</Task>')
					API_VarDataSetNumber(playernumtable[i],1,12164,renwujiaohu2)
					API_ActorSendMsg(playernumtable[i],6,'['..taskname..']完成')
					API_TaskLogUpdate(playernumtable[i],taskid,0,2,'<text color="183,0,28">成功摧毁'..API_GetMonsterNameByID(MonsterID)..'</text>')
				end								
			end
		end
		
	end
	if KillerType == 1 then
		local TeamID = API_GetTeamID(KillerID)
		local TopConsortiaId = API_GetTopConsortiaId(KillerID)
		local Camp2 = API_GetActorCamp(KillerID)
		
		if TopConsortiaId > 0 or bingtuancunzai == 1 then	
			for i in playernumtable do
				local ConsortiaId = API_GetTopConsortiaId(playernumtable[i])
				if TopConsortiaId > 0 then	
					Conname = ''..API_ConGetStrInfo(TopConsortiaId,1)..'的'
					if ConsortiaId == TopConsortiaId then
						--佣兵团任务
						--做同佣兵团相关处理
						--yjdsh_fangbaoBossaddbuff(playernumtable[i])
						local renwujiaohu2 = API_VarDataGetNumber(playernumtable[i],1,12164)
						local zhuangtai2 = math.mod(renwujiaohu2,10)
						local taskid = 1811
						local taskname = '摧毁城门'
						local ybtshizheMAPID = YBT_yongbingtuanshizheweihi(Camp2)	
						if zhuangtai2 == 1 then
							API_UpdateTaskLeadEx(playernumtable[i],taskid,0,2,'成功摧毁'..API_GetMonsterNameByID(MonsterID)..'')
							renwujiaohu2 = renwujiaohu2 + 1
							API_TaskLogUpdate(playernumtable[i],taskid,0,4,'<Task NPCName="'..API_GetMonsterNameByID(11727)..'" NpcID="11727" NPCPos="'..ybtshizheMAPID..'" condition="0" FinishNum="0" IsFinish="2">'..taskname..'</Task>')
							API_VarDataSetNumber(playernumtable[i],1,12164,renwujiaohu2)
							API_ActorSendMsg(playernumtable[i],6,'['..taskname..']完成')
							API_TaskLogUpdate(playernumtable[i],taskid,0,2,'<text color="183,0,28">成功摧毁'..API_GetMonsterNameByID(MonsterID)..'</text>')
						end					
					end
					--[[if leixing == 4 then
						local CFConsortiaId = API_GetTopConsortiaId(shuzhi)
						if ConsortiaId == CFConsortiaId then
							yjdsh_fangbaoBossaddbuff(playernumtable[i])
						end
					end]]
				end
				--[[if bingtuancunzai == 1 then
					if ConsortiaId == CF1 or ConsortiaId == CF2 or ConsortiaId == CF3 or ConsortiaId == CF4 or ConsortiaId == CF5 then
						yjdsh_fangbaoBossaddbuff(playernumtable[i])
					end					
				end]]
			end
	-----------------------------------------------------------杀怪地图内全兵团回调由于效率问题暂时不做			
		end		
		--进入掉落部分
		yjdsh_jymonsterdeadcallback(0,1,Type,CreatureID,KillerType,KillerID, MonsterID, MapID,PosX,PosY,leixing,shuzhi)
		--此部分预留
		--进入喊话函数
		API_ActorBDCMsg(MapID,0,-1,50,85,0,1,''..zhengying2..''..Conname..''..API_GetActorName(KillerID)..'对'..chengmen..'造成了最后一击，通往法斯勒广场的道路打开了。')
	end
	yijicity_AreaChongZhi(MapID)
	local Type = 1
	if zhenying == 2 then
		Type = 2
	end
	local LaiYuan = 1
	if GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] == nil then
		GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = 1
	else
		GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] + 1
	end
end
--1介绍打法
--2冲车兑换
--3重置时间
--4分阵营
function yjdsh_qianxianzhihuiguan1(ActorID,NPCID) --前线指挥官1 （城门区）
	local ActorID = ActorID or API_RequestGetActorID() 
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	if NPCID ~= qianxianzhihuiguan1 and NPCID ~= qianxianzhihuiguan2 then
		return
	end		
	local MapID = API_GetActorMapID(ActorID)
	local Camp = API_GetActorCamp(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	API_ResponseWrite('<name>'..API_GetMonsterNameByID(NPCID)..'</name>')
	local chongzhitime = 0 
	if NPCID == qianxianzhihuiguan1 then --联邦
		chongzhitime = 12
	end	
	if NPCID == qianxianzhihuiguan2 then --帝国
		chongzhitime = 13
	end	
	--YBT_1806panduan(ActorID,1)
	if SelectItem == 1 then --获得冲车
		if API_GetMapVarData(MapID,chongzhitime) > 0 then
			API_ResponseWrite('<text>城门存活时才能获得'..API_GetMonsterNameByID(chongche1)..'</text><br>')
			API_ResponseWrite('<br><a>确定</a>')
			API_ResponseFlush(ActorID)
			return
		end		
		local num = API_ActorGetGoodsNum(ActorID,jinshuid) --玩家身上金属数量
		if num < jinshunum then
			local cha = jinshunum - num
			API_ResponseWrite('<text>再搞到'..cha..'块“'..API_GetGoodsName(jinshuid)..'”就可以换取'..API_GetMonsterNameByID(chongche1)..'。</text><br>')
			API_ResponseWrite('<br><a>确定</a>')
		else
			local chetimechufaqi = API_VarDataGetNumber(ActorID,1,12144) --冲车触发器
			if chetimechufaqi > 0 then
				API_DestroyTrigger(ActorID,-1,chetimechufaqi)
			end	
			API_VarDataSetNumber(ActorID,1,12142,0)
			API_VarDataSetNumber(ActorID,1,12143,0)
			API_VarDataSetNumber(ActorID,1,12144,0)
			API_VarDataSetNumber(ActorID,1,12145,0)
			API_VarDataSetNumber(ActorID,1,12181,0)
			API_ActorRemoveGoods(ActorID,jinshuid,jinshunum,'兑换冲车消耗金属')
			API_ActorSendMsg(ActorID,17,'消耗'..jinshunum..'块'..API_GetGoodsName(jinshuid)..'成功换取'..API_GetMonsterNameByID(chongche1)..'')			
			yjdsh_chongchechuangjian(ActorID,chongche1,MapID)
			API_ResponseEnd()
			API_ResponseClear()		
		end
	elseif SelectItem == 2 then --传送出遗迹之城
		API_ResponseWrite('<text>确定要离开吗？离开后如果你带有'..API_GetMonsterNameByID(chongche2)..'，那么会消失的</text><br><br>')
		API_ResponseWrite('<a href="yjdsh_qianxianzhihuiguan1?1=3">是的，请传送吧</a><br><br>')
		API_ResponseWrite('<a>取消</a><br>')		
	elseif SelectItem == 3 then	--传送出遗迹之城
		yjdsh_gohome(ActorID)
		API_ResponseEnd()
		API_ResponseClear()				
	elseif SelectItem == 4 then	--竞拍
		API_ResponseWrite('<text>随着天空都市上战争的爆发，牧师协会的牧师也出现在了天空都市的各个区域为佣兵团成员提供免费复活服务。想要享受这项服务，就必须在城门被攻破或机械族首领被击杀后的情况下，在我这里通过佣兵团资金竞拍使用权。当城门或首领出现后，竞拍将结束（竞拍失败的将返还资金），获得使用权的兵团将在这场BOSS战中免费原地复活，但是每次复活将增加5秒的复活时间，复活时间内不能复活。这个服务只能持续到本区域的首领（城门）死亡或达到30分钟，并只作用于当前区域。</text><br>')
		--获得权限的兵团
		local text = '暂时没有兵团获得免费复活权'
		local text2 = '当前免费复活权竞赛价格为100000佣兵团资金'
		local text3 = '未进入重置时间，不能进行竞拍'
		if NPCID == qianxianzhihuiguan2 then --帝国
			local bingtuanid = API_GetMapVarData(MapID,20) --获取当前有免费复活权限的佣兵团ID
			local dangqianjinbi = API_GetMapVarData(MapID,21) --获取当前竞拍资金
			if bingtuanid > 0 then
				text = '“'..API_ConGetStrInfo(bingtuanid,1)..'”佣兵团获得免费复活权'
			end
			if dangqianjinbi > 100000 then
				text2 = '当前免费复活权竞赛价格为'..dangqianjinbi..'佣兵团资金'
			end
			if API_GetMapVarData(MapID,13) > 0 then --有重置时间 就	
				local TopConsortiaId = API_GetTopConsortiaId(ActorID)
				if TopConsortiaId <= 0 then
					text3 = '只有有权限的佣兵团成员才能进行竞拍'
				else
					if API_IsOperate(TopConsortiaId,ActorID,17) ~= 1 then
						text3 = '只有有权限的佣兵团成员才能进行竞拍'
					else
						text3 = 2
						--API_ResponseWrite('<a href="yjdsh_qianxianzhihuiguan1?1=5">竞拍免费复活权限</a><br>')
					end
				end
			end
		end
		if NPCID == qianxianzhihuiguan1 then --联邦
			local bingtuanid = API_GetMapVarData(MapID,22) ----获取当前有免费复活权限的佣兵团ID
			local dangqianjinbi = API_GetMapVarData(MapID,23) --获取当前竞拍资金
			if bingtuanid > 0 then
				text = '“'..API_ConGetStrInfo(bingtuanid,1)..'”佣兵团获得免费复活权'
			end
			if dangqianjinbi > 100000 then
				text2 = '当前免费复活权竞赛价格为'..dangqianjinbi..'佣兵团资金'
			end		
			if API_GetMapVarData(MapID,12) > 0 then --没有重置时间 就刷怪
				local TopConsortiaId = API_GetTopConsortiaId(ActorID)
				if TopConsortiaId <= 0 then
					text3 = '只有有权限的佣兵团成员才能进行竞拍'
				else
					if API_IsOperate(TopConsortiaId,ActorID,17) ~= 1 then
						text3 = '只有有权限的佣兵团成员才能进行竞拍'
					else
						text3 = 1
						--API_ResponseWrite('<a href="yjdsh_qianxianzhihuiguan1?1=5">竞拍免费复活权限</a><br>')
					end
				end
			end
		end
		API_ResponseWrite('<br><text>'..text..'</text><br>')
		API_ResponseWrite('<br><text>'..text2..'</text><br><br>')
		if text3 == 1 then
			API_ResponseWrite('<a href="yjdsh_qianxianzhihuiguan1?1=5">竞拍免费复活权限</a><br>')
		elseif text3 == 2 then
			API_ResponseWrite('<a href="yjdsh_qianxianzhihuiguan1?1=6">竞拍免费复活权限</a><br>')
		else
			API_ResponseWrite('<br><text>'..text3..'</text><br>')
		end
		API_ResponseWrite('<br><a>关闭</a>')
		--当前出价
	elseif SelectItem == 5 then	--竞拍西部城门免费复活权
		API_ResponseWrite('<text>请输入要竞拍的金额，每次最少加价10000</text><br>')
		API_ResponseWrite('<input type="number" name="3" size="13" width="50"><br><br>')
		API_ResponseWrite('<a href="yjdsh_freerelivejingpai?1=1&2='..ActorID..'">竞拍风暴要塞免费复活权</a><br><br>')
		API_ResponseWrite('<a>关闭</a><br><br>')
	elseif SelectItem == 6 then	--竞拍东部城门免费复活权
		API_ResponseWrite('<text>请输入要竞拍的金额，每次最少加价10000</text><br>')
		API_ResponseWrite('<input type="number" name="3" size="13" width="50"><br><br>')
		API_ResponseWrite('<a href="yjdsh_freerelivejingpai?1=2&2='..ActorID..'">竞拍磐石要塞免费复活权</a><br><br>')
		API_ResponseWrite('<a>关闭</a><br><br>')
	else
		API_ResponseWrite('<text>看，前面那道门就是天空都市的入口，打破它就可以进入天空都市了。城门两边的兵营和大炮是不能被攻击的。</text><br>')
		API_ResponseWrite('<text>从那些机械身上搞到“'..jinshunum..'块'..API_GetGoodsName(jinshuid)..'”，把他们交给我，我将为你们提供能有效对城门造成伤害的“'..API_GetMonsterNameByID(chongche1)..'”，你有5分钟的使用权</text><br>')
		if API_GetMapVarData(MapID,chongzhitime) > 0 then
			local nowtime = os.time()
			local oldtime = API_GetMapVarData(MapID,chongzhitime)
			local TimePast = os.difftime(nowtime,oldtime)
			local shengyutime = BossShuaXinShiJian - TimePast
			if shengyutime < 0 then
				shengyutime = 0
			end
			if shengyutime > 0 then
				shengyutime = math.floor(shengyutime/60)
			end
			if shengyutime > 0 then
				API_ResponseWrite('<br><text>城门将于'..shengyutime..'分钟后刷新。</text><br>')
			else
				API_ResponseWrite('<br><text>城门刷新时间小于1分钟。</text><br>')
			end
		end
		API_ResponseWrite('<text>好了勇士，说说你要我为你做点什么。</text><br>')
		API_ResponseWrite('<br><a href="yjdsh_qianxianzhihuiguan1?1=1">给我来辆'..API_GetMonsterNameByID(chongche1)..'</a><br>')
		API_ResponseWrite('<br><a href="yjdsh_qianxianzhihuiguan1?1=4">竞拍“复活仪式”</a><br>')
		API_ResponseWrite('<br><a href="yjdsh_qianxianzhihuiguan1?1=2">离开天空都市</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	end
	--API_ResponseWrite('<text>战术说明</text><br>')
	API_ResponseFlush(ActorID)
end

--boss防包场机制
--重置时间内可进行竞拍，非重置时间可了解
--任何人都可了解，有职权的可竞拍
--通过地图交互数据存数竞拍信息 当前出价兵团 当前出价
--免费复活持续到BOSS死亡或30分钟
--死亡增加次数监控 每次延长5秒
function yjdsh_freerelivejingpai()
	local quyu = API_RequestGetNumber(1)
	local ActorID = API_RequestGetNumber(2)
	local jingpaizijin = API_RequestGetNumber(3)
	local TopConsortiaId = API_GetTopConsortiaId(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local conlevel = API_ConGetNumInfo(TopConsortiaId,7)
	if TopConsortiaId <= 0 then
		API_ResponseWrite('<text>只有有权限的佣兵团成员才能进行竞拍</text><br>')
		API_ResponseWrite('<a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
	if API_IsOperate(TopConsortiaId,ActorID,17) ~= 1 then
		API_ResponseWrite('<text>只有有权限的佣兵团成员才能进行竞拍</text><br>')
		API_ResponseWrite('<a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return
	end	
	local ok = 0
	local bingtanid = 0
	local feiyong = 0
	if quyu == 1 then
		if API_GetMapVarData(MapID,12) == 0 then --没有重置时间 就刷怪	
			ok = 1
		end
		bingtanid = API_GetMapVarData(MapID,22)
		feiyong = API_GetMapVarData(MapID,23)
	elseif quyu == 2 then
		if API_GetMapVarData(MapID,13) == 0 then --没有重置时间 就刷怪	
			ok = 1
		end
		bingtanid = API_GetMapVarData(MapID,20)
		feiyong = API_GetMapVarData(MapID,21)
	elseif quyu == 3 then
		if API_GetMapVarData(MapID,14) == 0 then --没有重置时间 就刷怪	
			ok = 1
		end
		bingtanid = API_GetMapVarData(MapID,24)
		feiyong = API_GetMapVarData(MapID,25)
	elseif quyu == 4 then
		if API_GetMapVarData(MapID,15) == 0 then --没有重置时间 就刷怪	
			ok = 1
		end		
		bingtanid = API_GetMapVarData(MapID,26)
		feiyong = API_GetMapVarData(MapID,27)
	end	
	if feiyong == 0 then
		feiyong = 100000
	end
	if ok == 1 then
		API_ResponseWrite('<text>首领（门）已经重置结束，不能进行竞拍</text><br>')
		API_ResponseWrite('<a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
	if feiyong <= 100000 then
		if jingpaizijin < feiyong then
			API_ResponseWrite('<text>您所提出的竞拍资金小于'..feiyong..'，不能进行竞拍</text><br><br>')
			API_ResponseWrite('<a>关闭</a><br>')
			API_ResponseFlush(ActorID)
			return
		end			
	else
		if jingpaizijin < feiyong + 10000 then
			local feiyong2 = feiyong + 10000
			API_ResponseWrite('<text>您所提出的竞拍资金小于'..feiyong2..'，不能进行竞拍。每次竞拍最少加价10000</text><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
			API_ResponseFlush(ActorID)
			return		
		end	
	end
	if API_ConGetNumInfo(TopConsortiaId,5) - jingpaizijin <= weihufeitable[conlevel]*5  then
		API_ResponseWrite('<text>扣除竞拍资金后，剩余佣兵团资金小于5日维护费用，不能进行竞拍</text><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
	if bingtanid == TopConsortiaId then
		API_ResponseWrite('<text>已经获得竞拍第一价位，不用再次出价</text><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
	if API_SetConMoney(TopConsortiaId,-jingpaizijin) then
		if bingtanid > 0 then
			API_SetConMoney(bingtanid,feiyong)
		end	
		if quyu == 1 then
			API_SetMapVarData(MapID,22,TopConsortiaId)
			API_SetMapVarData(MapID,23,jingpaizijin)
			API_ActorBDCMsg(MapID,0,-1,50,85,0,17,'“'..API_ConGetStrInfo(TopConsortiaId,1)..'”佣兵团以“'..jingpaizijin..'”的佣兵团资金暂时获得“风暴要塞”的免费复活权')
		elseif quyu == 2 then
			API_SetMapVarData(MapID,20,TopConsortiaId)
			API_SetMapVarData(MapID,21,jingpaizijin)
			API_ActorBDCMsg(MapID,0,-1,50,85,0,17,'“'..API_ConGetStrInfo(TopConsortiaId,1)..'”佣兵团以“'..jingpaizijin..'”的佣兵团资金暂时获得“磐石要塞”的免费复活权')
		elseif quyu == 3 then
			API_SetMapVarData(MapID,24,TopConsortiaId)
			API_SetMapVarData(MapID,25,jingpaizijin)
			API_ActorBDCMsg(MapID,0,-1,50,85,0,17,'“'..API_ConGetStrInfo(TopConsortiaId,1)..'”佣兵团以“'..jingpaizijin..'”的佣兵团资金暂时获得“法斯勒广场”的免费复活权')
		elseif quyu == 4 then	
			API_SetMapVarData(MapID,26,TopConsortiaId)
			API_SetMapVarData(MapID,27,jingpaizijin)
			API_ActorBDCMsg(MapID,0,-1,50,85,0,17,'“'..API_ConGetStrInfo(TopConsortiaId,1)..'”佣兵团以“'..jingpaizijin..'”的佣兵团资金暂时获得“雷杰斯营地”的免费复活权')
		end	
	end
end

function yjdsh_Bossfangshuafuhuoqueren(MapID,quyu)
	local TopConsortiaId = 0
	local jingpaizijin = 0 
	local quyuname = ''
	if quyu == 1 then
		TopConsortiaId = API_GetMapVarData(MapID,22)
		jingpaizijin = API_GetMapVarData(MapID,23)
		quyuname = '风暴要塞'
	elseif quyu == 2 then
		TopConsortiaId = API_GetMapVarData(MapID,20)
		jingpaizijin = API_GetMapVarData(MapID,21)
		quyuname = '磐石要塞'
	elseif quyu == 3 then
		TopConsortiaId = API_GetMapVarData(MapID,24)
		jingpaizijin = API_GetMapVarData(MapID,25)
		quyuname = '法斯勒广场'
	elseif quyu == 4 then	
		TopConsortiaId = API_GetMapVarData(MapID,26)
		jingpaizijin = API_GetMapVarData(MapID,27)
		quyuname = '雷杰斯营地'
	end	
	if TopConsortiaId <= 0 then
		return
	end
	if jingpaizijin < 100000 then
		return
	end
	if quyuname == '' then
		return
	end
	API_ActorBDCMsg(MapID,0,-1,50,85,0,1,'“'..API_ConGetStrInfo(TopConsortiaId,1)..'”佣兵团最终以“'..jingpaizijin..'”的佣兵团资金获得了“'..quyuname..'区”的免费复活权')
	API_ActorBDCMsg(MapID,0,-1,50,85,0,17,'“'..API_ConGetStrInfo(TopConsortiaId,1)..'”佣兵团最终以“'..jingpaizijin..'”的佣兵团资金获得了“'..quyuname..'区”的免费复活权')
	if quyu == 1 then
		local TriggerGID = API_CreateTimerTriggerG(28,MapID,1800,1,'yjdsh_freerelivetriggerdelete')
		API_SetMapVarData(MapID,28,TriggerGID)
	elseif quyu == 2 then
		local TriggerGID = API_CreateTimerTriggerG(29,MapID,1800,1,'yjdsh_freerelivetriggerdelete')
		API_SetMapVarData(MapID,29,TriggerGID)
	elseif quyu == 3 then
		local TriggerGID = API_CreateTimerTriggerG(30,MapID,1800,1,'yjdsh_freerelivetriggerdelete')
		API_SetMapVarData(MapID,30,TriggerGID)
	elseif quyu == 4 then	
		local TriggerGID = API_CreateTimerTriggerG(31,MapID,1800,1,'yjdsh_freerelivetriggerdelete')
		API_SetMapVarData(MapID,31,TriggerGID)
	end	
end

function yjdsh_freerelivetriggerdelete(type1,MapID)
	local TriggerGID = API_GetMapVarData(MapID,type1)
	if TriggerGID > 0 then
		API_SetMapVarData(MapID,type1,0)
		API_DestroyTriggerG(TriggerGID) 
		if type1 == 28 then
			API_SetMapVarData(MapID,22,0)
			API_SetMapVarData(MapID,23,0)
			yjdsh_freerelivenumsavetable[1] = {}
		elseif type1 == 29 then
			API_SetMapVarData(MapID,20,0)
			API_SetMapVarData(MapID,21,0)
			yjdsh_freerelivenumsavetable[2] = {}
		elseif type1 == 30 then
			API_SetMapVarData(MapID,24,0)
			API_SetMapVarData(MapID,25,0)
			yjdsh_freerelivenumsavetable[3] = {}
		elseif type1 == 31 then	
			API_SetMapVarData(MapID,26,0)
			API_SetMapVarData(MapID,27,0)
			yjdsh_freerelivenumsavetable[4] = {}
		end		
	end
end

function yjdsh_freerelivenumchaxun(ActorID)
	local TopConsortiaId = API_GetTopConsortiaId(ActorID)
	if TopConsortiaId <= 0 then
		return 0
	end
	--先通过玩家的坐标 定位玩家的位置 当位置确定后 判断玩家兵团ID 是否等于收益兵团ID 如果等于收益兵团ID 那么计数 如果不是则不计数 如果为0 则不继续	
	local x = API_GetActorPosX(ActorID)
	local y = API_GetActorPosY(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local quyu = 0
	if x >= xibuchengmenx1 and x <= xibuchengmenx2 and y >= xibuchengmeny1 and y <= xibuchengmeny2 then
		if TopConsortiaId == API_GetMapVarData(MapID,22) then
			quyu = 1
		end
	elseif x >= dongbuchengmenx1 and x <= dongbuchengmenx2 and y >= dongbuchengmeny1 and y <= dongbuchengmeny2 then
		if TopConsortiaId == API_GetMapVarData(MapID,20) then
			quyu = 2
		end
	elseif x >= dushiguangchangx1 and x <= dushiguangchangx2 and y >= dushiguangchangy1 and y <= dushiguangchangy2 then
		if TopConsortiaId == API_GetMapVarData(MapID,24) then
			quyu = 3
		end
	elseif x >= jiangjunx1 and x <= jiangjunx2 and y >= jiangjuny1 and y <= jiangjuny2 then
		if TopConsortiaId == API_GetMapVarData(MapID,26) then
			quyu = 4
		end
	end
	if quyu == 0 then
		return 0 
	end
	--兵团ID寻找正确后 根据区域ID 玩家ID 查表
	local num = 0
	if yjdsh_freerelivenumsavetable[quyu] ~= nil then
		if yjdsh_freerelivenumsavetable[quyu][ActorID] ~= nil then
			num = yjdsh_freerelivenumsavetable[quyu][ActorID]
		end
	end
	num = num + 1
	yjdsh_freerelivenumsavetable[quyu][ActorID] = num
	return num 
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------第二部分结束
--第三部分
--点击NPC查询BOSS重置时间
function yjdsh_qianxianzhihuiguan2(ActorID,NPCID) --前线指挥官（都市广场区）
	local ActorID = ActorID or API_RequestGetActorID() 
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	if NPCID ~= qianxianzhihuiguan3 and NPCID ~= qianxianzhihuiguan4 then
		return
	end		
	YBT_1806panduan(ActorID,2)
	local MapID = API_GetActorMapID(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	API_ResponseWrite('<name>'..API_GetMonsterNameByID(NPCID)..'</name>')
	if SelectItem == 1 then --传送出遗迹之城
		API_ResponseWrite('<text>确定要离开吗？离开后如果你带有'..API_GetMonsterNameByID(chongche2)..'，那么会消失的</text><br><br>')
		API_ResponseWrite('<a href="yjdsh_qianxianzhihuiguan2?1=2">是的，请传送吧</a><br><br>')
		API_ResponseWrite('<a>取消</a><br>')		
	elseif SelectItem == 2 then	--传送出遗迹之城
		yjdsh_gohome(ActorID)
		API_ResponseEnd()
		API_ResponseClear()			
	elseif SelectItem == 3 then	--竞拍“复活仪式”
		API_ResponseWrite('<text>随着天空都市上战争的爆发，牧师协会的牧师也出现在了天空都市的各个区域为佣兵团成员提供免费复活服务。想要享受这项服务，就必须在城门被攻破或机械族首领被击杀后，在我这里通过佣兵团资金竞拍使用权。当城门或首领出现后，竞拍将结束（竞拍失败的将返还资金），获得使用权的兵团将在这场BOSS战中免费原地复活，但是每次复活将增加5秒的复活时间，复活时间内不能复活。这个服务只能持续到本区域的首领（城门）死亡或达到30分钟，并只作用于当前区域。</text><br>')
		--获得权限的兵团
		local text = '暂时没有兵团获得免费复活权'
		local text2 = '当前免费复活权竞赛价格为100000佣兵团资金'
		local text3 = '未进入重置时间，不能进行竞拍'			
		local bingtuanid = API_GetMapVarData(MapID,24)
		local dangqianjinbi = API_GetMapVarData(MapID,25)
		if bingtuanid > 0 then
			text = '“'..API_ConGetStrInfo(bingtuanid,1)..'”佣兵团获得免费复活权'
		end
		if dangqianjinbi > 100000 then
			text2 = '当前免费复活权竞赛价格为'..dangqianjinbi..'佣兵团资金'
		end
		if API_GetMapVarData(MapID,14) > 0 then --有重置时间 就	
			local TopConsortiaId = API_GetTopConsortiaId(ActorID)
			if TopConsortiaId <= 0 then
				text3 = '只有有权限的佣兵团成员才能进行竞拍'
			else
				if API_IsOperate(TopConsortiaId,ActorID,17) ~= 1 then
					text3 = '只有有权限的佣兵团成员才能进行竞拍'
				else
					text3 = 3
				end
			end
		end
		API_ResponseWrite('<br><text>'..text..'</text><br>')
		API_ResponseWrite('<br><text>'..text2..'</text><br><br>')
		if text3 == 3 then
			API_ResponseWrite('<a href="yjdsh_qianxianzhihuiguan2?1=4">竞拍免费复活权限</a><br>')
		else
			API_ResponseWrite('<br><text>'..text3..'</text><br>')
		end
		API_ResponseWrite('<br><a>关闭</a>')
		--当前出价		
	elseif SelectItem == 4 then	--竞拍免费复活权限	
		API_ResponseWrite('<text>请输入要竞拍的金额，每次最少加价10000</text><br>')
		API_ResponseWrite('<input type="number" name="3" size="13" width="50"><br><br>')
		API_ResponseWrite('<a href="yjdsh_freerelivejingpai?1=3&2='..ActorID..'">竞拍法斯勒广场免费复活权</a><br><br>')
		API_ResponseWrite('<a>关闭</a><br><br>')
	else	
		API_ResponseWrite('<text>嘿，看到那个家伙了吗？如果被那个家伙的雷电击中，一定要远离人群，不然会害死很多人。这个嗜血的家伙每杀死一个人就会强大一点。如果不能尽早消灭他那么后果不堪设想。</text><br>')
		if API_GetMapVarData(MapID,14) > 0 then --都市广场
			--广播剩余时间
			local nowtime = os.time()
			local oldtime = API_GetMapVarData(MapID,14)
			local TimePast = os.difftime(nowtime,oldtime)
			local shengyutime = BossShuaXinShiJian - TimePast
			if shengyutime < 0 then
				shengyutime = 0
			end
			if shengyutime > 0 then
				shengyutime = math.floor(shengyutime/60)
			end
			if shengyutime > 0 then
				API_ResponseWrite('<text>这个区域的首领将于'..shengyutime..'分钟后刷新。</text><br>')
			else
				API_ResponseWrite('<text>这个区域的首领刷新时间小于1分钟。</text><br>')
			end
		end
		API_ResponseWrite('<text>好了勇士，说说你要我为你做点什么。</text><br>')
		API_ResponseWrite('<br><a href="yjdsh_qianxianzhihuiguan2?1=3">竞拍“复活仪式”</a><br>')
		API_ResponseWrite('<br><a href="yjdsh_qianxianzhihuiguan2?1=1">离开天空都市</a><br>')	
		API_ResponseWrite('<br><a>关闭</a><br>')
	end	
	API_ResponseFlush(ActorID)
end

-------------刷怪部分
function yjdsh_lblianji2qushuaguai(MapID) --联邦练级2区
	local renshu = API_GetMapVarData(MapID,3) --获取当前区域人数 根据人数进表 决定下次回调时间
	local time1 = 20
	for i in yjdsh_quanqushuaxintimetable[3] do
		if yjdsh_quanqushuaxintimetable[3][i] ~= nil then
			local biaozhun = yjdsh_quanqushuaxintimetable[3][i].n
			if renshu <= biaozhun then
				time1 = yjdsh_quanqushuaxintimetable[3][i].t
				break
			end
		end
	end
	local xunluodui = 0
	local guichengshijian = API_VarDataGetNumber_Ex(1,0,OwnerID,1,14)
	if guichengshijian == 1 then
		API_CreateTimerTriggerG(MapID,0,time1,1,'yjdsh_lblianji2qushuaguai')
		return
	end
	for i in yjdsh_5qumonstertable do --进入1区表进行循环 找怪 放置
		if yjdsh_5qumonstertable[i] ~= nil then  
			for j in yjdsh_5qumonstertable[i] do  --找到怪物后进行循环
				if yjdsh_5qumonstertable[i][j] ~= nil then		--如果怪物对应的坐标不是空		
					if type(yjdsh_5qufidtable[i])  ~= 'table' or yjdsh_5qufidtable[i] == nil then  --判断要放置怪物FID的表是否存在 不存在就创建
						yjdsh_5qufidtable[i] = {}
					end 
					local ok = 0	--设置1个是否刷怪的标志
					if yjdsh_5qufidtable[i][j] == nil then	--判断放置怪物FID的表 要放置的位置 是否为空 这个位置对应怪物坐标的位置	
					else						
						local Fid = yjdsh_5qufidtable[i][j]  --如果已经有数值了 那么取出来 看看怪物是否还存在
						if Fid ~= nil then
							local mid2 = API_GetMonsterID(Fid)
							if mid2 > 0 then	--如果存在 那么标志设置为 1 不刷新了
								ok = 1
								--巡逻队处理 如果有标志 则删除小怪 重新刷小怪
							end
						end	
					end	
					if ok == 0 then				
						--巡逻队处理
						--只要1号存在 就肯定不刷
						--1号不存在的时候 要看2号是否存在 如果存在不刷
						--如果2号也不存在 那么刷新1号 同时设置标志 2号判断有标志才刷
						--如果精英1不存在 那么判断精英2是否存在 如果不存在那么刷新精英1
						--如果精英2不存在 那么判断精英1是否存在 如果不存在那么刷新精英2
						--如果精英1 精英2 都不存在 那么小怪删除
						if i == jyjixiewulibing61 then --如果精英1不存在
							local mid2 = yjdsh_5qufidtable[jyjixiehuoyaobing61][1]
							if mid2 ~= nil then
								if API_GetMonsterID(mid2) > 0 then --如果精英2存在 则 OK = 1
									ok = 1 --存在则 不刷
								end
							end	
						end
						--巡逻队处理结束
					end						
					if ok == 0 then
						local x =  yjdsh_5qumonstertable[i][j].x
						local y =  yjdsh_5qumonstertable[i][j].y
						local z =  yjdsh_5qumonstertable[i][j].z
						local levelcha = 0
						local lujing = yjdsh_5qumonstertable[i][j].lujing
						if i == jixiewulibing60 or i == jixiehuoyaobing60 or i == jixiemofabing60 then
							levelcha = math.random(-1,1)
						end				
						local mID = i + levelcha 						
						local fastid = 0
						if yjdsh_jymonsterdroptypetable[mID] ~= nil then
							local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
							if math.mod(Minute,8) == 0 then
								fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
							end
						else
							fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
						end
						if fastid > 0 then
							yjdsh_5qufidtable[i][j] = fastid
							if z > 0 then
								API_MonsterAddStatus(fastid,z,0)
								local z2 = z + 2000
								API_MonsterAddStatus(fastid,z2,0)
							end
							if lujing ~= nil and lujing > 0 then
								local xys = yjdsh_5qumonstertable[i][j].xys
								API_MonsterPathPatrol(fastid,lujing,xys)
							end
							--创建精英怪死亡触发器
							if yjdsh_jymonsterdroptypetable[mID] ~= nil then
								API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
							end
							--巡逻队处理
							if i == jyjixiewulibing61 then
								API_MonsterPathPatrol(fastid,20,{x,y,3,355,393,3,341,404,3,332,420,3,328,437,3,332,455,3,342,470,3,354,480,3,371,486,3,389,487,3,408,487,3,389,487,3,371,486,3,354,480,3,342,470,3,332,455,3,328,437,3,332,420,3,341,404,3,355,393,3,})
								for k in yjdsh_5quxunluoduitable do
									for p in  yjdsh_5quxunluoduitable[k] do
										local Fid2 = yjdsh_5qufidtable[k][p]
										if Fid2 ~= nil then								
											if API_GetMonsterID(Fid2) > 0 then --如果精英2存在 则 OK = 1
												API_DestroyMonster(Fid2)
											end
										end
										local x =  yjdsh_5quxunluoduitable[k][p].x
										local y =  yjdsh_5quxunluoduitable[k][p].y
										local z =  yjdsh_5quxunluoduitable[k][p].z
										local lujing = yjdsh_5quxunluoduitable[k][p].lujing
										local fastid = API_CreateMonster(MapID,k,x,y,5,0,-1) 	
										yjdsh_5qufidtable[k][p] = fastid
										if z > 0 then
											API_MonsterAddStatus(fastid,z,0)
											local z2 = z + 2000
											API_MonsterAddStatus(fastid,z2,0)
										end
										--创建精英怪死亡触发器
										if yjdsh_jymonsterdroptypetable[k] ~= nil then
											API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
										end
										API_MonsterPathPatrol(fastid,20,{x,y,3,355,393,3,341,404,3,332,420,3,328,437,3,332,455,3,342,470,3,354,480,3,371,486,3,389,487,3,408,487,3,389,487,3,371,486,3,354,480,3,342,470,3,332,455,3,328,437,3,332,420,3,341,404,3,355,393,3,})
									end	
								end							
							end
						end
					end
				end
			end
		end
	end
	API_CreateTimerTriggerG(MapID,0,time1,1,'yjdsh_lblianji2qushuaguai')
end
function yjdsh_dglianji2qushuaguai(MapID)	--帝国练级2区
	local renshu = API_GetMapVarData(MapID,4) --获取当前区域人数 根据人数进表 决定下次回调时间
	local time1 = 20
	for i in yjdsh_quanqushuaxintimetable[4] do
		if yjdsh_quanqushuaxintimetable[4][i] ~= nil then
			local biaozhun = yjdsh_quanqushuaxintimetable[4][i].n
			if renshu <= biaozhun then
				time1 = yjdsh_quanqushuaxintimetable[4][i].t
				break
			end
		end
	end
	local xunluodui = 0
	local guichengshijian = API_VarDataGetNumber_Ex(1,0,OwnerID,1,14)
	if guichengshijian == 1 then
		API_CreateTimerTriggerG(MapID,0,time1,1,'yjdsh_dglianji2qushuaguai')
		return
	end
	for i in yjdsh_6qumonstertable do --进入1区表进行循环 找怪 放置
		if yjdsh_6qumonstertable[i] ~= nil then  
			for j in yjdsh_6qumonstertable[i] do  --找到怪物后进行循环
				if yjdsh_6qumonstertable[i][j] ~= nil then		--如果怪物对应的坐标不是空		
					if type(yjdsh_6qufidtable[i])  ~= 'table' or yjdsh_6qufidtable[i] == nil then  --判断要放置怪物FID的表是否存在 不存在就创建
						yjdsh_6qufidtable[i] = {}
					end 
					local ok = 0	--设置1个是否刷怪的标志
					if yjdsh_6qufidtable[i][j] == nil then	--判断放置怪物FID的表 要放置的位置 是否为空 这个位置对应怪物坐标的位置	
					else						
						local Fid = yjdsh_6qufidtable[i][j]  --如果已经有数值了 那么取出来 看看怪物是否还存在
						if Fid ~= nil then
							local mid2 = API_GetMonsterID(Fid)
							if mid2 > 0 then	--如果存在 那么标志设置为 1 不刷新了
								ok = 1
							end
						end	
					end	
					if ok == 0 then				
						--巡逻队处理
						--只要1号存在 就肯定不刷
						--1号不存在的时候 要看2号是否存在 如果存在不刷
						--如果2号也不存在 那么刷新1号 同时设置标志 2号判断有标志才刷
						--如果精英1不存在 那么判断精英2是否存在 如果不存在那么刷新精英1
						--如果精英2不存在 那么判断精英1是否存在 如果不存在那么刷新精英2
						--如果精英1 精英2 都不存在 那么小怪删除
						if i == jyjixiewulibing61 then --如果精英1不存在
							local mid2 = yjdsh_6qufidtable[jyjixiehuoyaobing61][1]
							if mid2 ~= nil then
								if API_GetMonsterID(mid2) > 0 then --如果精英2存在 则 OK = 1
									ok = 1 --存在则 不刷
								end
							end	
						end
						--巡逻队处理结束
					end											
					if ok == 0 then
						local x =  yjdsh_6qumonstertable[i][j].x
						local y =  yjdsh_6qumonstertable[i][j].y
						local z =  yjdsh_6qumonstertable[i][j].z
						local levelcha = 0
						local lujing = yjdsh_6qumonstertable[i][j].lujing
						if i == jixiewulibing60 or i == jixiehuoyaobing60 or i == jixiemofabing60 then
							levelcha = math.random(-1,1)
						end						
						local mID = i + levelcha 
						local fastid = 0
						if yjdsh_jymonsterdroptypetable[mID] ~= nil then
							local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
							if math.mod(Minute,8) == 0 then
								fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
							end
						else
							fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
						end
						if fastid > 0 then
							yjdsh_6qufidtable[i][j] = fastid
							if z > 0 then
								API_MonsterAddStatus(fastid,z,0)
								local z2 = z + 2000
								API_MonsterAddStatus(fastid,z2,0)
							end				
							if lujing ~= nil and lujing > 0 then
								local xys = yjdsh_6qumonstertable[i][j].xys
								API_MonsterPathPatrol(fastid,lujing,xys)
							end
							--创建精英怪死亡触发器
							if yjdsh_jymonsterdroptypetable[mID] ~= nil then
								API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
							end
							if i == jyjixiewulibing61 then
								API_MonsterPathPatrol(fastid,22,{530,386,3,547,389,3,562,399,3,573,410,3,580,427,3,580,445,3,573,462,3,563,474,3,548,484,3,530,488,3,512,487,3,492,487,3,512,487,3,530,488,3,548,484,3,563,474,3,573,462,3,580,445,3,580,427,3,573,410,3,562,399,3,547,389,3,})
								for k in yjdsh_6quxunluoduitable do
									for p in yjdsh_6quxunluoduitable[k] do -- yjdsh_6qufidtable改了下WYL
										local Fid2 = yjdsh_6qufidtable[k][p]
										if Fid2 ~= nil then								
											if API_GetMonsterID(Fid2) > 0 then --如果精英2存在 则 OK = 1
												API_DestroyMonster(Fid2)
											end
										end
										local x =  yjdsh_6quxunluoduitable[k][p].x
										local y =  yjdsh_6quxunluoduitable[k][p].y
										local z =  yjdsh_6quxunluoduitable[k][p].z
										local lujing = yjdsh_6quxunluoduitable[k][p].lujing
										local fastid = API_CreateMonster(MapID,k,x,y,5,0,-1) 	
										yjdsh_6qufidtable[k][p] = fastid
										if z > 0 then
											API_MonsterAddStatus(fastid,z,0)
											local z2 = z + 2000
											API_MonsterAddStatus(fastid,z2,0)
										end
										--创建精英怪死亡触发器
										if yjdsh_jymonsterdroptypetable[k] ~= nil then
											API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
										end
										API_MonsterPathPatrol(fastid,22,{530,386,3,547,389,3,562,399,3,573,410,3,580,427,3,580,445,3,573,462,3,563,474,3,548,484,3,530,488,3,512,487,3,492,487,3,512,487,3,530,488,3,548,484,3,563,474,3,573,462,3,580,445,3,580,427,3,573,410,3,562,399,3,547,389,3,})
									end	
								end							
							end
						end
					end
				end
			end
		end
	end
	API_CreateTimerTriggerG(MapID,0,time1,1,'yjdsh_dglianji2qushuaguai')
end
--BOSS不死亡 按正常情况循环刷怪 谁死了补谁
--BOSS死亡 看情况是否进入归城 不进入 就开始倒计时
--倒计时中不能进  倒计时有专门的1分钟触发器
--倒计时过后 判断 计时状态 和 归城状态 进行刷新
--归城结束后 开始倒计时 归城设置为2 
function yjdsh_dushiguangchangshuaguai(MapID) --都市广场区
	local renshu = API_GetMapVarData(MapID,5)
	local time1 = 20
	for i in yjdsh_quanqushuaxintimetable[5] do
		if yjdsh_quanqushuaxintimetable[5][i] ~= nil then
			local biaozhun = yjdsh_quanqushuaxintimetable[5][i].n
			if renshu <= biaozhun then
				time1 = yjdsh_quanqushuaxintimetable[5][i].t
				break
			end
		end
	end
	local guichengshijian = API_VarDataGetNumber_Ex(1,0,OwnerID,1,14)
	if guichengshijian == 1 then
		API_CreateTimerTriggerG(MapID,0,time1,1,'yjdsh_dushiguangchangshuaguai')
		return
	end	
	if API_GetMapVarData(MapID,18) == 1 then
		API_CreateTimerTriggerG(MapID,0,time1,1,'yjdsh_dushiguangchangshuaguai')
		return
	end	
	if API_GetMapVarData(MapID,14) == 0 then --没有重置时间 就刷怪
		for i in yjdsh_7qumonstertable do --进入1区表进行循环 找怪 放置
			if yjdsh_7qumonstertable[i] ~= nil then  
				for j in yjdsh_7qumonstertable[i] do  --找到怪物后进行循环
					if yjdsh_7qumonstertable[i][j] ~= nil then		--如果怪物对应的坐标不是空		
						if type(yjdsh_7qufidtable[i])  ~= 'table' or yjdsh_7qufidtable[i] == nil then  --判断要放置怪物FID的表是否存在 不存在就创建
							yjdsh_7qufidtable[i] = {}
						end 
						local ok = 0	--设置1个是否刷怪的标志
						if yjdsh_7qufidtable[i][j] == nil then	--判断放置怪物FID的表 要放置的位置 是否为空 这个位置对应怪物坐标的位置	
						else
							local mid2 = yjdsh_7qufidtable[i][j]  --如果已经有数值了 那么取出来 看看怪物是否还存在
							if mid2 ~= nil then
								if API_GetMonsterID(mid2) > 0 then	--如果存在 那么标志设置为 1 不刷新了
									ok = 1
								end
							end	
						end	
						if ok == 0 then
							local x =  yjdsh_7qumonstertable[i][j].x
							local y =  yjdsh_7qumonstertable[i][j].y
							local z =  yjdsh_7qumonstertable[i][j].z
							local levelcha = 0
							local mID = i + levelcha 
							local fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
							if mID == dushiguangchangBoss1 then
								API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_dushiguangchangboss1siwanghuidiao') --都市广场死亡触发器 													
							end
							if mID == chengmen2 then --城门加无敌
								API_MonsterAddStatus(fastid,206001,0) 
							end
							yjdsh_7qufidtable[i][j] = fastid
							if z > 0 then
								API_MonsterAddStatus(fastid,z,0)
								local z2 = z + 2000
								API_MonsterAddStatus(fastid,z2,0)
							end
							--创建精英怪死亡触发器
							if yjdsh_jymonsterdroptypetable[mID] ~= nil and mID ~= dushiguangchangBoss1 then
								API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
							end
						end
					end
				end
			end
		end
	end
	API_CreateTimerTriggerG(MapID,0,time1,1,'yjdsh_dushiguangchangshuaguai')
end

--都市广场BOSS死亡回调
-- 1号BOSS
function yjdsh_dushiguangchangboss1siwanghuidiao(Param_1,Param_2,Type,CreatureID,KillerType,KillerID, MonsterID, MapID,PosX,PosY,leixing,shuzhi) --2号BOSS死亡回调	
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local guichengshijian = API_VarDataGetNumber_Ex(1,0,OwnerID,1,14)
	API_SetMapVarData(MapID,18,0)	
	yjdsh_freerelivetriggerdelete(30,MapID)
	local ok = 0
	--WYL取消归城事件 2011.1.12
--~ 	if Week == 6 or Week == 7 then --如果是周末 并且没有进行BOSS归城事件
--~ 		if guichengshijian == 0 then --没进行过
--~ 			if Hour >= 19 then
--~ 				yjdsh_BOSSguichenghanshu(MapID)
--~ 				ok = 1
--~ 			end
--~ 		end		
--~ 	end
	local nowtime = os.time()
	local playernumtable = API_GetActorInArea(MapID,1,420,453,480,510) --都市广场区坐标
	local playernum = table.getn(playernumtable)
	local zhengying2 = ''
	local Conname = ''
	local chengmenid = yjdsh_7qufidtable[chengmen2][1] --删除门
	if ok == 0 then
		if chengmenid ~=nil and API_GetMonsterID(chengmenid) > 0 then
			API_DestroyMonster(chengmenid)
			--WYL删除占位块
--~ 			for i = 1,14 do
--~ 				local fastid2 = yjdsh_7qufidtable[chengmen2zhanwei][i]
--~ 				if fastid2 ~= nil then
--~ 					if API_GetMonsterID(fastid2) > 0 then
--~ 						API_DestroyMonster(fastid2)
--~ 					end
--~ 				end
--~ 			end
		end
		API_SetMapVarData(MapID,14,nowtime) --设定击杀时间 为重置用
	end	
	local CF1,CF2,CF3,CF4,CF5 = 0,0,0,0,0
	local bingtuancunzai = 0
	if leixing == 3 then
		local renshu = API_GetTeamSize(shuzhi)
		for i = 1, renshu do
			if i == 1 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF1 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			elseif i == 2 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF2 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			elseif i == 3 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF3 = API_GetTopConsortiaId(aid)	
				bingtuancunzai = 1				
			elseif i == 4 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF4 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			elseif i == 5 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF5 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			end
		end	
	end	
	if KillerType == 1 then
		local TeamID = API_GetTeamID(KillerID)
		local TopConsortiaId = API_GetTopConsortiaId(KillerID)
		local Camp2 = API_GetActorCamp(KillerID)
		if Camp2 == 0 then
			zhengying2 = '帝国'
		end
		if Camp2 == 1 then
			zhengying2 = '联邦'
		end
		if TopConsortiaId > 0 or bingtuancunzai == 1 then
			for i in playernumtable do
				local ConsortiaId = API_GetTopConsortiaId(playernumtable[i])	
				if TopConsortiaId > 0 then	
					Conname = ''..API_ConGetStrInfo(TopConsortiaId,1)..'的'				
					--[[if ConsortiaId == TopConsortiaId then
						--佣兵团任务
						--做同佣兵团相关处理
						local renwujiaohu2 = API_VarDataGetNumber(playernumtable[i],1,12166)
						local zhuangtai2 = math.mod(renwujiaohu2,10)
						local taskid = 1812
						local taskname = ''
						local ybtshizheMAPID = YBT_yongbingtuanshizheweihi(Camp2)	
						if zhuangtai2 == 1 then
							API_UpdateTaskLeadEx(playernumtable[i],taskid,0,2,'成功击杀“'..API_GetMonsterNameByID(dushiguangchangBoss1)..'”' )
							renwujiaohu2 = renwujiaohu2 + 1
							API_TaskLogUpdate(playernumtable[i],taskid,0,4,'<Task NPCName="'..API_GetMonsterNameByID(11727)..'" NpcID="11727" NPCPos="'..ybtshizheMAPID..'" condition="0" FinishNum="0" IsFinish="2">'..taskname..'</Task>')
							API_VarDataSetNumber(playernumtable[i],1,12166,renwujiaohu2)
							API_ActorSendMsg(playernumtable[i],6,'['..taskname..']完成')
							API_TaskLogUpdate(playernumtable[i],taskid,0,2,'<text color="183,0,28">成功击杀“'..API_GetMonsterNameByID(dushiguangchangBoss1)..'”</text>')
						end						
					end]]
					--[[if leixing == 4 then
						local CFConsortiaId = API_GetTopConsortiaId(shuzhi)
						if ConsortiaId == CFConsortiaId then
							yjdsh_fangbaoBossaddbuff(playernumtable[i])
						end
					end]]
				end
				--[[if bingtuancunzai == 1 then
					if ConsortiaId == CF1 or ConsortiaId == CF2 or ConsortiaId == CF3 or ConsortiaId == CF4 or ConsortiaId == CF5 then
						yjdsh_fangbaoBossaddbuff(playernumtable[i])
					end					
				end	]]				
			end
	-----------------------------------------------------------杀怪地图内全兵团回调由于效率问题暂时不做
		end		
		--进入掉落部分
		yjdsh_jymonsterdeadcallback(0,0,Type,CreatureID,KillerType,KillerID, MonsterID, MapID,PosX,PosY,leixing,shuzhi)
		--此部分预留
		--进入喊话函数
		if ok == 0 then
			API_ActorBDCMsg(MapID,0,-1,50,85,0,1,''..zhengying2..''..Conname..''..API_GetActorName(KillerID)..'对“'..API_GetMonsterNameByID(MonsterID)..'”造成了最后一击，通往雷杰斯营地的道路打开了。')
		else
			API_ActorBDCMsg(MapID,0,-1,50,85,0,1,''..zhengying2..''..Conname..''..API_GetActorName(KillerID)..'对“'..API_GetMonsterNameByID(MonsterID)..'”造成了最后一击。')
		end
	end
	yijicity_AreaChongZhi(MapID)
	local Type = 3
	local LaiYuan = 1
	if GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] == nil then
		GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = 1
	else
		GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] + 1
	end
end

--BOSS属性添加
function yjdsh_dshgchBOSS1shuxingadd(MapID,CreatureID)
	if API_GetMapVarData(MapID,18) ~= 1 then  --如果2号BOSS不在开战状态 那么返回
		return
	end
	if yjdsh_7qufidtable[dushiguangchangBoss1][1] == nil or yjdsh_7qufidtable[dushiguangchangBoss1][1] <= 0 then
		return
	end
	local fastid = yjdsh_7qufidtable[dushiguangchangBoss1][1]
	if API_GetMonsterID(fastid) <= 0 then	
		return
	end
	yjdsh_dshgchBOSSkillnum = yjdsh_dshgchBOSSkillnum + 1
	if yjdsh_dshgchBOSSkillnum > 10 then
		yjdsh_dshgchBOSSkillnum = 10
	end
	local StatusID = 1002000 + yjdsh_dshgchBOSSkillnum
	local mid = API_GetMonsterID(fastid)
	API_MonsterAddStatus(fastid,StatusID,0)
	local FastHP = API_MonsterGetPropNum(fastid,2)
	local FastMAXHP = API_MonsterGetPropNum(fastid,3)
	local addhp = FastMAXHP * 0.03
	if FastHP + addhp > FastMAXHP then
		addhp = FastMAXHP - FastHP
	end
	API_MonsterAddHP(fastid,addhp)
	API_ActorBDCMsg(MapID,0,-1,50,85,0,1,''..API_GetActorName(CreatureID)..'死亡了，“'..API_GetMonsterNameByID(mid)..'”的生命恢复了3%，属性得到提升。')	
	API_ActorBDCMsg(MapID,0,-1,50,85,0,17,''..API_GetActorName(CreatureID)..'死亡了，“'..API_GetMonsterNameByID(mid)..'”的生命恢复了3%，属性得到提升。')	
end
--BOSS归城事件
--设置标志
--5 6 7 区在有标志的情况下 不刷怪
--创建5、6、7区怪
--2个BOSS死亡开门
--删除门
function yjdsh_BOSSguichenghanshu(MapID) --BOSS归程函数
	API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,14,1) --BOSS归城事件设置为 1 --进行中
	local x,y = 450,484
	local fastid1 = API_CreateMonster(MapID,jixiezhiyaqi,x,y,5,0,-1) 
	x,y = 389,384
	local fastid2 = API_CreateMonster(MapID,dushiguangchangBoss2,x,y,5,0,-1) 
	x,y = 513,384
	local fastid3 = API_CreateMonster(MapID,dushiguangchangBoss3,x,y,5,0,-1) 
	API_CreateDieTriggerG(fastid2,fastid3,0,fastid1,'yjdsh_dshgch_jixiezhiyaqi') --机械制压器 死亡触发器  固定坐标被BOSS摧毁后 地图秒杀
	API_CreateDieTriggerG(fastid3,fastid1,0,fastid2,'yjdsh_dshgch_2Boss3Boss')  --BOSS2死亡触发器 
	API_CreateDieTriggerG(fastid2,fastid1,0,fastid3,'yjdsh_dshgch_2Boss3Boss')  --BOSS3死亡触发器
	API_MonsterPathPatrol(fastid2,20,{389,384,1,371,387,1,355,393,1,341,404,1,332,420,1,328,437,1,332,455,1,342,470,1,354,480,1,371,486,1,389,487,1,409,487,1,422,488,1,431,488,1,441,486,1,447,484,1,449,484,1,450,485,1,449,484,1,450,485,1,449,484,81600,})
	API_MonsterPathPatrol(fastid3,21,{513,384,1,530,386,1,547,389,1,562,399,1,573,410,1,580,427,1,580,445,1,573,462,1,563,474,1,548,484,1,530,488,1,512,487,1,492,487,1,478,488,1,469,488,1,460,486,1,452,484,1,450,482,1,452,484,1,450,482,1,452,484,81600,})
	--API_CreateTimerTriggerG(0,0,5, long lCallNum, char *szCallFuncName) 机械压制器 血量监控  程序说可能有别的实现方法
	yjdsh_dshgch_Bosszhaoguai(MapID,fastid2) --BOSS召怪函数 判断怪物是否存在  根据血量 召唤 建表 方便删除 死1个BOSS 删1表怪 死2个删2个 到时间也删
	yjdsh_dshgch_Bosszhaoguai(MapID,fastid3)
	--喊话 进入归城事件 BOSS行为等等 像所有人广播
	API_ActorBDCMsg(MapID,0,-1,50,85,0,1,'机械族首领“'..API_GetMonsterNameByID(dushiguangchangBoss2)..'”和“'..API_GetMonsterNameByID(dushiguangchangBoss3)..'”从要塞向法斯勒广场进攻了，它们要夺回这里。')
	API_ActorBDCMsg(MapID,0,-1,50,85,0,1,'我们需要保护“'..API_GetMonsterNameByID(jixiezhiyaqi)..'”，在它被摧毁前击败那2个家伙。如果这个机器被摧毁，那么它们将毁灭一切。并且会造成浮空岛之间的通道变得极不稳定，50级以上的勇士将不能进入拉锯战！')
	API_ActorBDCMsg(MapID,0,-1,50,85,0,17,'机械族首领“'..API_GetMonsterNameByID(dushiguangchangBoss2)..'”和“'..API_GetMonsterNameByID(dushiguangchangBoss3)..'”从要塞向法斯勒广场进攻了，它们要夺回这里。')
	API_ActorBDCMsg(MapID,0,-1,50,85,0,17,'我们需要保护“'..API_GetMonsterNameByID(jixiezhiyaqi)..'”，在它被摧毁前击败那2个家伙。如果这个机器被摧毁，那么它们将毁灭一切。并且会造成浮空岛之间的通道变得极不稳定，50级以上的勇士将不能进入拉锯战！')
end
--通过时间触发器回调 
--先判断BOSS是否存活 然后根据BOSS坐标进行刷怪 设定为仆从
--数量根据BOSS HP决定
function yjdsh_dshgch_Bosszhaoguai(MapID,fastid) --BOSS护卫召唤
	if not API_MapIsValid(MapID) then
		return
	end
	local MonsterID = API_GetMonsterID(fastid)
	if MonsterID > 0 then
		local X = API_GetMonsterPosX(fastid)
		local Y = API_GetMonsterPosY(fastid)
		local FastHP = API_MonsterGetPropNum(fastid,2)
		local FastMAXHP = API_MonsterGetPropNum(fastid,3)
		local biaochang = 4
		local baifenbi = FastHP/FastMAXHP * 100
		if baifenbi <= 30 then
			biaochang = 16
		elseif baifenbi > 30 and baifenbi <= 50 then
			biaochang = 12
		elseif baifenbi > 50 and baifenbi <= 80 then
			biaochang = 8
		end
		if yjdsh_dshgch_Bossshouweitable2 == nil then
			yjdsh_dshgch_Bossshouweitable2 = {}
		end
		if type(yjdsh_dshgch_Bossshouweitable2[fastid])  ~= 'table' or yjdsh_dshgch_Bossshouweitable2[fastid] == nil then
			yjdsh_dshgch_Bossshouweitable2[fastid] = {}
		end
		for i=1,biaochang do
			--如果存放FID的表 中的 I 项 是空值 那么这个值变为0
			if yjdsh_dshgch_Bossshouweitable2[fastid][i] == nil then
				yjdsh_dshgch_Bossshouweitable2[fastid][i] = 0				
			end
			--如果FID 存在 那么不处理 否则 
			local fid = yjdsh_dshgch_Bossshouweitable2[fastid][i]
			if fid ~= nil then
				if API_GetMonsterID(fid) > 0 then
				else
				--根据I的位置 获取MID 创建FID 保存FID
					local mid = yjdsh_dshgch_Bossshouweitable[i]
					local fid2 = API_CreateMonster(MapID,mid,X,Y,5,0,-1) 
					yjdsh_dshgch_Bossshouweitable2[fastid][i] = fid2
					API_SetMonsterChief(fid2,fastid) --设置怪物为BOSS的仆
				end
			else
				local mid = yjdsh_dshgch_Bossshouweitable[i]
				local fid2 = API_CreateMonster(MapID,mid,X,Y,5,0,-1) 
				yjdsh_dshgch_Bossshouweitable2[fastid][i] = fid2
				API_SetMonsterChief(fid2,fastid) --设置怪物为BOSS的仆
			end	
		end
		--全地图打点
		local MapConfigID = API_GetMapConfigID(MapID)
		local MapPointID = MapConfigID * 1000000 + MonsterID
		local playernumtable = API_GetActorInArea(MapID,0,0,0,0,0)
		if type(playernumtable) == "table" then
			for i,v in pairs(playernumtable) do
				API_ActorAddMapPoint(v,MapPointID,MapConfigID,X,Y,3,''..API_GetMonsterNameByID(MonsterID)..'')
			end
		end
		API_CreateTimerTriggerG(MapID,fastid,10,1,'yjdsh_dshgch_Bosszhaoguai')
	end	
end
--Boss全部死亡 开门  Boss死的时候 判断另外一只是否存活 机械压制器删除
--压制器死亡  清屏幕  Boss 满血
function yjdsh_dshgch_jixiezhiyaqi(Boss2,Boss3,Type,CreatureID,KillerType,KillerID, MonsterID, MapID,PosX,PosY) --压制器死亡触发器
	if KillerType == 0 then
		--if KillerID == Boss2 or KillerID == Boss3 then
			--全屏幕秒杀 + 广播
			API_ActorBDCMsg(MapID,0,-1,50,85,0,17,'“'..API_GetMonsterNameByID(jixiezhiyaqi)..'”被毁坏了，机械首领的压制解除，释放足以毁灭一切的巨大的雷电攻击。广场区所有英雄遭到毁灭性打击！机械首领将存在两小时，只有消灭它们才能打开通往雷杰斯营地的大门！')
			local playernumtable = API_GetActorInArea(MapID,1,420,453,480,510) --都市广场区坐标
			local playernum = table.getn(playernumtable)
			for i in playernumtable do
				--给玩家增加死亡状态
				--for i=1,playernum do 
					for p=1,6 do
						API_ActorAddStatus(playernumtable[i],766001,0) 
					end
				--end 
			end
			--给BOSS补血 直接满血
			if API_GetMonsterID(Boss2) > 0 then	
				local FastHP = API_MonsterGetPropNum(Boss2,2)
				local FastMAXHP = API_MonsterGetPropNum(Boss2,3)
				local HPcha = FastMAXHP - FastHP
				API_MonsterAddHP(Boss2,HPcha)
			end	
			if API_GetMonsterID(Boss3) > 0 then	
				local FastHP = API_MonsterGetPropNum(Boss3,2)
				local FastMAXHP = API_MonsterGetPropNum(Boss3,3)
				local HPcha = FastMAXHP - FastHP
				API_MonsterAddHP(Boss3,HPcha)
			end
		--end
		API_CreateTimerTriggerG(Boss2,Boss3,7200,1,'yjdsh_dshgch_Bossguichengover')
	end
end
function yjdsh_dshgch_2Boss3Boss(boss,jixieqi,Type,CreatureID,KillerType,KillerID, MonsterID, MapID,PosX,PosY,leixing,shuzhi) --2 3号BOSS死亡触发器
	--如果BOSS的FASTID 在表内  那么通过表 获取FID 
	--如果fid不为空 那么通过FID取MID 
	--如果MID >0 那么删除这个怪物
	--删除所有怪物后 表为0
	if type(yjdsh_dshgch_Bossshouweitable2[CreatureID])  == 'table' then
		for i=1,16 do
			local fid = yjdsh_dshgch_Bossshouweitable2[CreatureID][i]
			if fid ~= nil then
				if API_GetMonsterID(fid) > 0 then
					API_DestroyMonster(fid)
				end
			end	
		end
		yjdsh_dshgch_Bossshouweitable2[CreatureID] = nil
	end	
	if KillerType ~= 1 then
		return
	end
	local ok = 0
	if API_GetMonsterID(boss) > 0 then	--如果存在 那么标志设置为 1 不刷新了
		ok = 1
	end
	if ok == 0 then --全部击杀
		yjdsh_dshgch_Bossguichengover(boss,CreatureID,jixieqi,MapID,1)
	end
	local zhengying2 = ''
	local Conname = ''
	local Camp2 = API_GetActorCamp(KillerID)
	if Camp2 == 0 then
		zhengying2 = '帝国'
	end
	if Camp2 == 1 then
		zhengying2 = '联邦'
	end
	local CF1,CF2,CF3,CF4,CF5 = 0,0,0,0,0
	local bingtuancunzai = 0
	if leixing == 3 then
		local renshu = API_GetTeamSize(shuzhi)
		for i = 1, renshu do
			if i == 1 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF1 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			elseif i == 2 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF2 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			elseif i == 3 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF3 = API_GetTopConsortiaId(aid)	
				bingtuancunzai = 1				
			elseif i == 4 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF4 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			elseif i == 5 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF5 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			end
		end	
	end	
	local TopConsortiaId = API_GetTopConsortiaId(KillerID)
	if TopConsortiaId > 0 or bingtuancunzai == 1 then
		local x1 = PosX - 10
		local x2 = PosX + 10
		local y1 = PosY - 10
		local y2 = PosY + 10
		local playernumtable = API_GetActorInArea(MapID,1,x1,y1,x2,y2) --都市广场区坐标
		for i in playernumtable do
			local ConsortiaId = API_GetTopConsortiaId(playernumtable[i])	
			if TopConsortiaId > 0 then	
				Conname = ''..API_ConGetStrInfo(TopConsortiaId,1)..'的'			
				if ConsortiaId == TopConsortiaId then
					--佣兵团任务
					--做同佣兵团相关处理
					local renwujiaohu2 = API_VarDataGetNumber(playernumtable[i],1,12168)
					local zhuangtai2 = math.mod(renwujiaohu2,10)
					local taskid = 1813
					local taskname = ''
					local ybtshizheMAPID = YBT_yongbingtuanshizheweihi(Camp2)	
					if zhuangtai2 == 1 then
						API_UpdateTaskLeadEx(playernumtable[i],taskid,0,2,'成功击杀“'..API_GetMonsterNameByID(yongshibossID)..'”的帮手' )
						renwujiaohu2 = renwujiaohu2 + 1
						API_TaskLogUpdate(playernumtable[i],taskid,0,4,'<Task NPCName="'..API_GetMonsterNameByID(11727)..'" NpcID="11727" NPCPos="'..ybtshizheMAPID..'" condition="0" FinishNum="0" IsFinish="2">'..taskname..'</Task>')
						API_VarDataSetNumber(playernumtable[i],1,12168,renwujiaohu2)
						API_ActorSendMsg(playernumtable[i],6,'['..taskname..']完成')
						API_TaskLogUpdate(playernumtable[i],taskid,0,2,'<text color="183,0,28">成功击杀“'..API_GetMonsterNameByID(yongshibossID)..'”的帮手</text>')
					end						
				end
				--[[if leixing == 4 then
					local CFConsortiaId = API_GetTopConsortiaId(shuzhi)
					if ConsortiaId == CFConsortiaId then
						yjdsh_fangbaoBossaddbuff(playernumtable[i])
					end
				end]]
			end	
			--[[if bingtuancunzai == 1 then
				if ConsortiaId == CF1 or ConsortiaId == CF2 or ConsortiaId == CF3 or ConsortiaId == CF4 or ConsortiaId == CF5 then
					yjdsh_fangbaoBossaddbuff(playernumtable[i])
				end					
			end	]]
		end	
	end		
	--进入掉落部分
	yjdsh_jymonsterdeadcallback(0,0,Type,CreatureID,KillerType,KillerID, MonsterID, MapID,PosX,PosY,leixing,shuzhi)
	--全地图打点
	local MapConfigID = API_GetMapConfigID(MapID)
	local MapPointID = MapConfigID * 1000000 + MonsterID
	local playernumtable = API_GetActorInArea(MapID,0,0,0,0,0)
	if type(playernumtable) == "table" then
		for i,v in pairs(playernumtable) do
			API_ActorDelMapPoint(v,MapPointID)
		end
	end
	--此部分预留
	--进入喊话函数
	if ok == 0 then
		API_ActorBDCMsg(MapID,0,-1,50,85,0,1,''..zhengying2..''..Conname..''..API_GetActorName(KillerID)..'对“'..API_GetMonsterNameByID(MonsterID)..'”造成了最后一击,通往雷杰斯营地的大门打开了。')
		yjdsh_dshgch_Bossshouweitable2 = nil
	else
		API_ActorBDCMsg(MapID,0,-1,50,85,0,1,''..zhengying2..''..Conname..''..API_GetActorName(KillerID)..'对“'..API_GetMonsterNameByID(MonsterID)..'”造成了最后一击,击败另一个首领可打开通往雷杰斯营地的大门。')
	end
end
--2个BOSS死亡 或者 到达2小时候后 执行这个函数 
--如果是BOSS死亡 那么开门 如果不是BOSS死亡 那么不开门
--BOSS重置时间重置 压制器删除 攻城事件设置为结束
function yjdsh_dshgch_Bossguichengover(boss2,boss3,jixieqi,MapID,win) --BOSS归城结束
	local guichengshijian = API_VarDataGetNumber_Ex(1,0,OwnerID,1,14)
	if guichengshijian == 2 then
		return
	end
	if jixieqi ~= nil and jixieqi > 0 then
		if API_GetMonsterID(jixieqi) > 0 then	
			API_DestroyMonster(jixieqi) --压制器删除
		end	
	end	
	if MapID == nil then
		MapID = 0
	end
	if API_GetMonsterID(boss2) > 0 then	
		if MapID == 0 then
			MapID = API_GetMonsterMap(boss2)
		end
		API_DestroyMonster(boss2) --2号BOSS删除
	end	
	if API_GetMonsterID(boss3) > 0 then	
		if MapID == 0 then
			MapID = API_GetMonsterMap(boss3)
		end
		API_DestroyMonster(boss3) --3号BOSS删除
	end	
	if win == 1 then
		local chengmenid = yjdsh_7qufidtable[chengmen2][1] --删除门
		if API_GetMonsterID(chengmenid) > 0 then	
			API_DestroyMonster(chengmenid)
			--WYL删除占位块
--~ 			for i = 1,14 do
--~ 				local fastid2 = yjdsh_7qufidtable[chengmen2zhanwei][i]
--~ 				if fastid2 ~= nil then
--~ 					if API_GetMonsterID(fastid2) > 0 then
--~ 						API_DestroyMonster(fastid2)
--~ 					end
--~ 				end
--~ 			end
		end
	end
	local nowtime = os.time()
	API_SetMapVarData(MapID,14,nowtime) --设定击杀时间 为重置用
	API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,14,2) --攻城事件设定为结束
	API_ActorCallBack(MapID,1,-1,'yjdsh_shanchuguichengbossdadian')
end

--删除boss归城地图打点
function yjdsh_shanchuguichengbossdadian(ActorID)
	local MapID = API_GetActorMapID(ActorID) 
	local MapConfigID = API_GetMapConfigID(MapID) 
	local MapPointID1 = MapConfigID * 1000000 + 906012
	API_ActorDelMapPoint(ActorID,MapPointID1)
	local MapPointID2 = MapConfigID * 1000000 + 906013
	API_ActorDelMapPoint(ActorID,MapPointID2)
end
------------------------------------------------------------------------------------------第三部分结束
--第四部分
--代码部分
--门和兵营
--每分钟重置1次门
function yjdsh_jiangjunqumenhebingying(MapID) --门和兵营 1-3 重置
	for i=1,3 do
		local ok = 0
		if type(yjdsh_12qufidtable[i])  ~= 'table' or yjdsh_12qufidtable[i] == nil then
			yjdsh_12qufidtable[i] = {}
		end
		if yjdsh_12qufidtable[i][1] ~= nil then
			local Fid = yjdsh_12qufidtable[i][1]  --如果已经有数值了 那么取出来 看看怪物是否还存在
			if Fid ~= nil then
				local mid2 = API_GetMonsterID(Fid)
				if mid2 > 0 then	--如果存在 那么标志设置为 1 不刷新了
					ok = 1
				end		
			end	
		end
		if ok == 0 then			
			local x = yjdsh_12qumonstertable[i][bingying2].x
			local y = yjdsh_12qumonstertable[i][bingying2].y
			local fastid = API_CreateMonster(MapID,bingying2,x,y,5,0,-1) 
			yjdsh_12qufidtable[i][1] = fastid
			
--~ 			if yjdsh_12qufidtable[i][2] ~= nil then
--~ 				local Fid = yjdsh_12qufidtable[i][2]  --如果已经有数值了 那么取出来 看看怪物是否还存在
--~ 				if Fid ~= nil then
--~ 					local mid2 = API_GetMonsterID(Fid)
--~ 					if mid2 > 0 then	--如果存在 那么标志设置为 1 不刷新了
--~ 						API_DestroyMonster(mid2)
--~ 					end		
--~ 				end	
--~ 			end
--~ 			local chengmenid = chengmen3
--~ 			if i == 3 then
--~ 				chengmenid = chengmen4
--~ 			end
--~ 			local x2 = yjdsh_12qumonstertable[i][chengmenid].x
--~ 			local y2 = yjdsh_12qumonstertable[i][chengmenid].y
--~ 			local fastid2 = API_CreateMonster(MapID,chengmenid,x2,y2,5,0,-1) 
--~ 			yjdsh_12qufidtable[i][2] = fastid2
			
			--创建兵营的死亡触发器
			API_CreateDieTriggerG(0,i,0,fastid,'yjdsh_jiangjunqubingyingsiwanghuidiao')
		end
	end
	local ok = 0
	if type(yjdsh_12qufidtable[4])  ~= 'table' or yjdsh_12qufidtable[4] == nil then
		yjdsh_12qufidtable[4] = {}
	end
	if yjdsh_12qufidtable[4][1] ~= nil then
		local Fid = yjdsh_12qufidtable[4][1]  --如果已经有数值了 那么取出来 看看怪物是否还存在
		if Fid ~= nil then
			local mid2 = API_GetMonsterID(Fid)
			if mid2 > 0 then	--如果存在 那么标志设置为 1 不刷新了
				ok = 1
			end		
		end	
	end
	if ok == 0 then
		local playernumtable = API_GetActorInArea(MapID,1,411,703,411,717) --都市广场
		if type(playernumtable) == "table" then
			for i,v in pairs(playernumtable) do
				local x,y = PublicFun_GetActorPosXY(v) 
				API_ActorGoToMap(v, MapID, x+1, y)
			end
		end
		local x = yjdsh_12qumentable[chengmen4].x
		local y = yjdsh_12qumentable[chengmen4].y
		local fastid = API_CreateMonster(MapID,chengmen4,x,y,3,0,-1) 
		yjdsh_12qufidtable[4][1] = fastid
	end
	--API_CreateTimerTriggerG(MapID,0,180,1,'yjdsh_jiangjunqumenhebingying')
end
function yjdsh_jiangjunqubingyingsiwanghuidiao(a,quyu, lCType, lCreatureID, lKillerType, lKillerID,lMonsterID, lMapID, lPosX, lPosY,leixing,shuzhi) --1-3兵营死亡触发器
	if lKillerType == 1 then
		if quyu == 3 and API_GetMapVarData(lMapID,15) > 0 then --将军
			local x = yjdsh_12qumonstertable[3][bingying2].x
			local y = yjdsh_12qumonstertable[3][bingying2].y
			local fastid = API_CreateMonster(lMapID,bingying2,x,y,5,0,-1) 
			yjdsh_12qufidtable[3][1] = fastid
			API_CreateDieTriggerG(0,3,0,fastid,'yjdsh_jiangjunqubingyingsiwanghuidiao')
			
			API_ActorBDCMsg(lMapID,0,-1,50,85,0,1,'雷杰斯营地还处于重置中，重置结束前大门不会开启。')
		else
			local ok = 0
			for i=1,3 do
				if type(yjdsh_12qufidtable[i])  ~= 'table' or yjdsh_12qufidtable[i] == nil then
					yjdsh_12qufidtable[i] = {}
				end
				if yjdsh_12qufidtable[i][1] ~= nil then
					local Fid = yjdsh_12qufidtable[i][1]  --如果已经有数值了 那么取出来 看看怪物是否还存在
					if Fid ~= nil then
						local mid2 = API_GetMonsterID(Fid)
						if mid2 > 0 then	--如果存在 那么标志设置为 1 不刷新了
							ok = 1
						end		
					end	
				end
			end
			if ok == 0 then
				if type(yjdsh_12qufidtable[4])  ~= 'table' or yjdsh_12qufidtable[4] == nil then
					yjdsh_12qufidtable[4] = {}
				end
				if yjdsh_12qufidtable[4][1] ~= nil then
					local Fid = yjdsh_12qufidtable[4][1]  
					if Fid ~= nil then
						local mid2 = API_GetMonsterID(Fid)
						if mid2 > 0 then
							API_DestroyMonster(Fid)
							API_ActorBDCMsg(lMapID,0,-1,50,85,0,1,'雷杰斯营地的大门已经开启！')
						end		
					end	
				end
				if type(yjdsh_11qufidtable[jiangjun])  ~= 'table' or yjdsh_11qufidtable[jiangjun] == nil then
					yjdsh_11qufidtable[jiangjun] = {}
				end
				local jiangjunfastid = yjdsh_11qufidtable[jiangjun][1] 
				if jiangjunfastid ~= nil then
					local mid2 = API_GetMonsterID(jiangjunfastid)
					if mid2 > 0 then
						API_MonsterRemoveStatus(jiangjunfastid, 2002001)
					end
				end
			end
--~ 			local mid2 = API_GetMonsterID(menfid)
--~ 			if mid2 > 0 then	--如果存在 那么标志设置为 1 不刷新了
--~ 				API_DestroyMonster(menfid)
--~ 			end	
		end	
	end
end
function yjdsh_jiangjun1qu(MapID) --将军1区
	local renshu = API_GetMapVarData(MapID,6) --获取当前区域人数 根据人数进表 决定下次回调时间
	local time1 = 20
	for i in yjdsh_quanqushuaxintimetable[6] do
		if yjdsh_quanqushuaxintimetable[6][i] ~= nil then
			local biaozhun = yjdsh_quanqushuaxintimetable[6][i].n
			if renshu <= biaozhun then
				time1 = yjdsh_quanqushuaxintimetable[6][i].t
				break
			end
		end
	end
	for i in yjdsh_8qumonstertable do --进入1区表进行循环 找怪 放置
		if yjdsh_8qumonstertable[i] ~= nil then  
			for j in yjdsh_8qumonstertable[i] do  --找到怪物后进行循环
				if yjdsh_8qumonstertable[i][j] ~= nil then		--如果怪物对应的坐标不是空		
					if type(yjdsh_8qufidtable[i])  ~= 'table' or yjdsh_8qufidtable[i] == nil then  --判断要放置怪物FID的表是否存在 不存在就创建
						yjdsh_8qufidtable[i] = {}
					end 
					local ok = 0	--设置1个是否刷怪的标志
					if yjdsh_8qufidtable[i][j] == nil then	--判断放置怪物FID的表 要放置的位置 是否为空 这个位置对应怪物坐标的位置	
					else
						local Fid = yjdsh_8qufidtable[i][j]  --如果已经有数值了 那么取出来 看看怪物是否还存在
						if Fid ~= nil then
							local mid2 = API_GetMonsterID(Fid)
							if mid2 > 0 then	--如果存在 那么标志设置为 1 不刷新了
								ok = 1
							end
						end	
					end	
					--判断兵营是否存在
					if i == jyjixiewulibingdanti63 then
						if yjdsh_12qufidtable[1][1] == nil then
							ok = 1
						else
							local byid = yjdsh_12qufidtable[1][1]
							if API_GetMonsterID(byid) <= 0 then
								ok = 1
							end
						end 
					end
					if ok == 0 then
						local x =  yjdsh_8qumonstertable[i][j].x
						local y =  yjdsh_8qumonstertable[i][j].y
						local z =  yjdsh_8qumonstertable[i][j].z
						local levelcha = 0
						if i == jixiewulibingdanti62 or i == jixiekongzhimofabing62 then
							levelcha = math.random(0,1)
						end
						local Num = 0
						repeat
							Num = Num + 1
							x = math.random(406,480)  --WYL防报错
							y = math.random(558,592)  --WYL防报错
						until not API_IsBlockTile(MapID,x,y,0) or Num == 50
						local mID = i + levelcha 
						if not API_IsBlockTile(MapID,x,y,0) then
							local fastid = 0
							if yjdsh_jymonsterdroptypetable[mID] ~= nil then
								local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
								if math.mod(Minute,8) == 0 then
									fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
								end
							else
								fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
							end
							if fastid > 0 then				
								yjdsh_8qufidtable[i][j] = fastid
								if z > 0 then
									API_MonsterAddStatus(fastid,z,0)
									local z2 = z + 2000
									API_MonsterAddStatus(fastid,z2,0)
								end
								--创建精英怪死亡触发器
								if yjdsh_jymonsterdroptypetable[mID] ~= nil then
									API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
								end
							end
						end
					end
				end
			end
		end
	end
	API_CreateTimerTriggerG(MapID,0,time1,1,'yjdsh_jiangjun1qu')
end
function yjdsh_jiangjun2qu(MapID) --将军2区
	local renshu = API_GetMapVarData(MapID,7) --获取当前区域人数 根据人数进表 决定下次回调时间
	local time1 = 20
	for i in yjdsh_quanqushuaxintimetable[7] do
		if yjdsh_quanqushuaxintimetable[7][i] ~= nil then
			local biaozhun = yjdsh_quanqushuaxintimetable[7][i].n
			if renshu <= biaozhun then
				time1 = yjdsh_quanqushuaxintimetable[7][i].t
				break
			end
		end
	end
	for i in yjdsh_9qumonstertable do --进入1区表进行循环 找怪 放置
		if yjdsh_9qumonstertable[i] ~= nil then  
			for j in yjdsh_9qumonstertable[i] do  --找到怪物后进行循环
				if yjdsh_9qumonstertable[i][j] ~= nil then		--如果怪物对应的坐标不是空		
					if type(yjdsh_9qufidtable[i])  ~= 'table' or yjdsh_9qufidtable[i] == nil then  --判断要放置怪物FID的表是否存在 不存在就创建
						yjdsh_9qufidtable[i] = {}
					end 
					local ok = 0	--设置1个是否刷怪的标志
					if yjdsh_9qufidtable[i][j] == nil then	--判断放置怪物FID的表 要放置的位置 是否为空 这个位置对应怪物坐标的位置	
					else
						local Fid = yjdsh_9qufidtable[i][j]  --如果已经有数值了 那么取出来 看看怪物是否还存在
						if Fid ~= nil then
							local mid2 = API_GetMonsterID(Fid)
							if mid2 > 0 then	--如果存在 那么标志设置为 1 不刷新了
								ok = 1
							end
						end	
					end	
					--判断兵营是否存在
					if i == jyjixiewulibingqunti64 then
						if yjdsh_12qufidtable[2][1] == nil then
							ok = 1
						else
							local byid = yjdsh_12qufidtable[2][1]
							if API_GetMonsterID(byid) <= 0 then
								ok = 1
							end
						end 
					end
					if ok == 0 then
						local x =  yjdsh_9qumonstertable[i][j].x
						local y =  yjdsh_9qumonstertable[i][j].y
						local z =  yjdsh_9qumonstertable[i][j].z
						local levelcha = 0
						if i == jixiewulibingqunti63 then
							levelcha = math.random(0,1)
						end
						local Num = 0
						repeat
							Num = Num + 1
							x = math.random(381,469)  --WYL防报错
							y = math.random(596,640)  --WYL防报错
						until not API_IsBlockTile(MapID,x,y,0) or Num == 50
						local mID = i + levelcha 
						if not API_IsBlockTile(MapID,x,y,0) then
							local fastid = 0
							if yjdsh_jymonsterdroptypetable[mID] ~= nil then
								local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
								if math.mod(Minute,8) == 0 then
									fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
								end
							else
								fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
							end
							if fastid > 0 then
								yjdsh_9qufidtable[i][j] = fastid
								if z > 0 then
									API_MonsterAddStatus(fastid,z,0)
									local z2 = z + 2000
									API_MonsterAddStatus(fastid,z2,0)
								end
								--创建精英怪死亡触发器
								if yjdsh_jymonsterdroptypetable[mID] ~= nil then
									API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
								end
							end
						end
					end
				end
			end
		end
	end
	API_CreateTimerTriggerG(MapID,0,time1,1,'yjdsh_jiangjun2qu')
end
function yjdsh_jiangjun3qu(MapID) --将军3区
	local renshu = API_GetMapVarData(MapID,8) --获取当前区域人数 根据人数进表 决定下次回调时间
	local time1 = 20
	for i in yjdsh_quanqushuaxintimetable[8] do
		if yjdsh_quanqushuaxintimetable[8][i] ~= nil then
			local biaozhun = yjdsh_quanqushuaxintimetable[8][i].n
			if renshu <= biaozhun then
				time1 = yjdsh_quanqushuaxintimetable[8][i].t
				break
			end
		end
	end
	for i in yjdsh_10qumonstertable do --进入1区表进行循环 找怪 放置
		if yjdsh_10qumonstertable[i] ~= nil then  
			for j in yjdsh_10qumonstertable[i] do  --找到怪物后进行循环
				if yjdsh_10qumonstertable[i][j] ~= nil then		--如果怪物对应的坐标不是空		
					if type(yjdsh_10qufidtable[i])  ~= 'table' or yjdsh_10qufidtable[i] == nil then  --判断要放置怪物FID的表是否存在 不存在就创建
						yjdsh_10qufidtable[i] = {}
					end 
					local ok = 0	--设置1个是否刷怪的标志
					if yjdsh_10qufidtable[i][j] == nil then	--判断放置怪物FID的表 要放置的位置 是否为空 这个位置对应怪物坐标的位置	
					else
						local Fid = yjdsh_10qufidtable[i][j]  --如果已经有数值了 那么取出来 看看怪物是否还存在
						if Fid ~= nil then	
							local mid2 = API_GetMonsterID(Fid)
							if mid2 > 0 then	--如果存在 那么标志设置为 1 不刷新了
								ok = 1
							end
						end	
					end	
					--判断兵营是否存在
					if i == jyjixiepaobing65 then
						if yjdsh_12qufidtable[3][1] == nil then
							ok = 1
						else
							local byid = yjdsh_12qufidtable[3][1]
							if API_GetMonsterID(byid) <= 0 then
								ok = 1
							end
						end 
					end
					if ok == 0 then
						local x =  yjdsh_10qumonstertable[i][j].x
						local y =  yjdsh_10qumonstertable[i][j].y
						local z =  yjdsh_10qumonstertable[i][j].z
						local levelcha = 0
						if i == jixiepaobing64 or i == jixiehuoyaojituibing64 then
							levelcha = math.random(0,1)
							--x = math.random(418,451)  --WYL防报错
							--y = math.random(693,728)  --WYL防报错
						end
						--if i == jyjixiepaobing65 then  --WYL防报错
							--x = math.random(418,451)  --WYL防报错
							--y = math.random(693,728)  --WYL防报错
						--end
						local mID = i + levelcha 
						local fastid = 0
						if yjdsh_jymonsterdroptypetable[mID] ~= nil then
							local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
							if math.mod(Minute,8) == 0 then
								fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
							end
						else
							fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 
						end
						if fastid > 0 then
							yjdsh_10qufidtable[i][j] = fastid
							if z > 0 then
								API_MonsterAddStatus(fastid,z,0)
								local z2 = z + 2000
								API_MonsterAddStatus(fastid,z2,0)
							end
							--创建精英怪死亡触发器
							if yjdsh_jymonsterdroptypetable[mID] ~= nil then
								API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jymonsterdeadcallback') 
							end
						end
					end
				end
			end
		end
	end
	API_CreateTimerTriggerG(MapID,0,time1,1,'yjdsh_jiangjun3qu')
end
function yjdsh_jiangjun4qu(MapID,Type) --将军4区
	local renshu = API_GetMapVarData(MapID,9) --获取当前区域人数 根据人数进表 决定下次回调时间
	local time1 = 20
	for i in yjdsh_quanqushuaxintimetable[9] do
		if yjdsh_quanqushuaxintimetable[9][i] ~= nil then
			local biaozhun = yjdsh_quanqushuaxintimetable[9][i].n
			if renshu <= biaozhun then
				time1 = yjdsh_quanqushuaxintimetable[9][i].t
				break
			end
		end
	end
	if API_GetMapVarData(MapID,15) == 0 then --没有重置时间 就刷怪
		local biaochang = 2
		if yjdsh_11qufidtable[jiangjun][1] ~= nil then
			local Bossfid = yjdsh_11qufidtable[jiangjun][1]
			if Bossfid ~= nil and API_GetMonsterID(Bossfid) > 0 then --WYL防报错
				local FastHP = API_MonsterGetPropNum(Bossfid,2)
				local FastMAXHP = API_MonsterGetPropNum(Bossfid,3)
				local baifenbi = FastHP/FastMAXHP * 100			
				if baifenbi <= 30 then
					biaochang = 6
				elseif baifenbi > 30 and baifenbi <= 50 then
					biaochang = 4
				elseif baifenbi > 50 and baifenbi <= 80 then
					biaochang = 3
				end
			end	
		end
	
		for i in yjdsh_11qumonstertable do --进入1区表进行循环 找怪 放置
			if yjdsh_11qumonstertable[i] ~= nil then  
				for j in yjdsh_11qumonstertable[i] do  --找到怪物后进行循环
					local ok = 0	--设置1个是否刷怪的标志
					if i == jixiewulibingdanti65 or i == jixiekongzhimofabing65 or i == jixiewulibingqunti65 or i == jixieyiliaomofabing65 or i == jixiepaobing65 or i == jixiehuoyaojituibing65 then
						if j > biaochang then
							ok = 1
						end
					end
					if i == bingying3 then
						if API_GetMapVarData(MapID,19) > 0 then --如果BOSS进入战斗状态 就不刷新
							ok = 1
						end
					end
					if ok == 0 then
						if yjdsh_11qumonstertable[i][j] ~= nil then		--如果怪物对应的坐标不是空		
							if type(yjdsh_11qufidtable[i])  ~= 'table' or yjdsh_11qufidtable[i] == nil then  --判断要放置怪物FID的表是否存在 不存在就创建
								yjdsh_11qufidtable[i] = {}
							end 
							if yjdsh_11qufidtable[i][j] == nil then	--判断放置怪物FID的表 要放置的位置 是否为空 这个位置对应怪物坐标的位置	
							else
								local Fid = yjdsh_11qufidtable[i][j]  --如果已经有数值了 那么取出来 看看怪物是否还存在
								if Fid ~= nil then
									local mid2 = API_GetMonsterID(Fid)
									if mid2 > 0 then	--如果存在 那么标志设置为 1 不刷新了
										ok = 1
									end
								end
							end	
							if ok == 0 then
								if i == jixiewulibingdanti65 then
									if yjdsh_11qufidtable[bingying3][1] == nil then
										ok = 1
									else
										local byid = yjdsh_11qufidtable[bingying3][1]
										if API_GetMonsterID(byid) <= 0 then
											ok = 1
										end
									end	
								elseif i == jixiekongzhimofabing65 then
									if yjdsh_11qufidtable[bingying3][2] == nil then
										ok = 1
									else	
										local byid = yjdsh_11qufidtable[bingying3][2]
										if API_GetMonsterID(byid) <= 0 then
											ok = 1
										end
									end	
								elseif i == jixiewulibingqunti65 then
									if yjdsh_11qufidtable[bingying3][3] == nil then
										ok = 1
									else	
										local byid = yjdsh_11qufidtable[bingying3][3]
										if API_GetMonsterID(byid) <= 0 then
											ok = 1
										end
									end	
								elseif i == jixieyiliaomofabing65 then
									if yjdsh_11qufidtable[bingying3][4] == nil then
										ok = 1
									else	
										local byid = yjdsh_11qufidtable[bingying3][4]
										if API_GetMonsterID(byid) <= 0 then
											ok = 1
										end
									end	
								elseif i == jixiepaobing65 then
									if yjdsh_11qufidtable[bingying3][5] == nil then
										ok = 1
									else	
										local byid = yjdsh_11qufidtable[bingying3][5]
										if API_GetMonsterID(byid) <= 0 then
											ok = 1
										end
									end	
								elseif i == jixiehuoyaojituibing65 then
									if yjdsh_11qufidtable[bingying3][6] == nil then
										ok = 1
									else	
										local byid = yjdsh_11qufidtable[bingying3][6]
										if API_GetMonsterID(byid) <= 0 then
											ok = 1
										end
									end	
								end
							end	
							if ok == 0 then
								local x =  yjdsh_11qumonstertable[i][j].x
								local y =  yjdsh_11qumonstertable[i][j].y
								local z =  yjdsh_11qumonstertable[i][j].z
								local mID = i
								
								local fastid = API_CreateMonster(MapID,mID,x,y,5,0,-1) 			
								if mID == jiangjun then
									API_MonsterAddStatus(fastid,2002001,0)
									API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jiangjunqubosssiwanghuidiao') --都市广场死亡触发器 	
									yjdsh_jiangjunqumenhebingying(MapID)
								end								
								yjdsh_11qufidtable[i][j] = fastid
								if z > 0 then
									API_MonsterAddStatus(fastid,z,0)
									local z2 = z + 2000
									API_MonsterAddStatus(fastid,z2,0)
								end								
							end
						end	
					end
				end
			end
		end
	end
	if Type == 1 then
		API_CreateTimerTriggerG(MapID,Type,time1,1,'yjdsh_jiangjun4qu')
	end
end
--将军区BOSS死亡回调
function yjdsh_jiangjunqubosssiwanghuidiao(Param_1,Param_2,Type,CreatureID,KillerType,KillerID, MonsterID, MapID,PosX,PosY,leixing,shuzhi)
	if MapID == 0 then
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	API_SetMapVarData(MapID,19,0)
	yjdsh_freerelivetriggerdelete(31,MapID)
	local nowtime = os.time()
	local playernumtable = API_GetActorInArea(MapID,1,295,685,345,735) --将军4区坐标
	local playernum = table.getn(playernumtable)
	local zhengying2 = ''
	local Conname = ''
	API_SetMapVarData(MapID,15,nowtime) --设定击杀时间 为重置用
	local CF1,CF2,CF3,CF4,CF5 = 0,0,0,0,0
	local bingtuancunzai = 0
	if leixing == 3 then
		local renshu = API_GetTeamSize(shuzhi)
		for i = 1, renshu do
			if i == 1 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF1 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			elseif i == 2 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF2 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			elseif i == 3 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF3 = API_GetTopConsortiaId(aid)	
				bingtuancunzai = 1				
			elseif i == 4 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF4 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			elseif i == 5 then
				local aid = API_GetTeamMem(shuzhi,i)
				CF5 = API_GetTopConsortiaId(aid)
				bingtuancunzai = 1
			end
		end	
	end	
	if KillerType == 1 then
		local TeamID = API_GetTeamID(KillerID)
		local TopConsortiaId = API_GetTopConsortiaId(KillerID)
		local Camp2 = API_GetActorCamp(KillerID)
		if Camp2 == 0 then
			zhengying2 = '帝国'
		end
		if Camp2 == 1 then
			zhengying2 = '联邦'
		end
		if TopConsortiaId > 0 or bingtuancunzai == 1 then	
			for i in playernumtable do
				local ConsortiaId = API_GetTopConsortiaId(playernumtable[i])	
				if TopConsortiaId > 0 then	
					Conname = ''..API_ConGetStrInfo(TopConsortiaId,1)..'的'				
					--[[if ConsortiaId == TopConsortiaId then
						--佣兵团任务
						--做同佣兵团相关处理
						for i in playernumtable do
							local ConsortiaId = API_GetTopConsortiaId(playernumtable[i])		
							if ConsortiaId == TopConsortiaId then
								--佣兵团任务
								--做同佣兵团相关处理
								local renwujiaohu2 = API_VarDataGetNumber(playernumtable[i],1,12170)
								local zhuangtai2 = math.mod(renwujiaohu2,10)
								local taskid = 1814
								local taskname = ''
								local ybtshizheMAPID = YBT_yongbingtuanshizheweihi(Camp2)	
								if zhuangtai2 == 1 then
									API_UpdateTaskLeadEx(playernumtable[i],taskid,0,2,'成功击杀“'..API_GetMonsterNameByID(jiangjun)..'”')
									renwujiaohu2 = renwujiaohu2 + 1
									API_TaskLogUpdate(playernumtable[i],taskid,0,4,'<Task NPCName="'..API_GetMonsterNameByID(11727)..'" NpcID="11727" NPCPos="'..ybtshizheMAPID..'" condition="0" FinishNum="0" IsFinish="2">'..taskname..'</Task>')
									API_VarDataSetNumber(playernumtable[i],1,12164,renwujiaohu2)
									API_ActorSendMsg(playernumtable[i],6,'['..taskname..']完成')
									API_TaskLogUpdate(playernumtable[i],taskid,0,2,'<text color="183,0,28">成功击杀“'..API_GetMonsterNameByID(jiangjun)..'”</text>')
								end					
							end
						end					
					end]]
					--[[if leixing == 4 then
						local CFConsortiaId = API_GetTopConsortiaId(shuzhi)
						if ConsortiaId == CFConsortiaId then
							yjdsh_fangbaoBossaddbuff(playernumtable[i])
						end
					end]]
				end
				--[[if bingtuancunzai == 1 then
					if ConsortiaId == CF1 or ConsortiaId == CF2 or ConsortiaId == CF3 or ConsortiaId == CF4 or ConsortiaId == CF5 then
						yjdsh_fangbaoBossaddbuff(playernumtable[i])
					end					
				end]]
			end
	-----------------------------------------------------------杀怪地图内全兵团回调由于效率问题暂时不做
		else
			--佣兵团任务
			--做无佣兵团相关处理	
		end		
		--进入掉落部分
		yjdsh_jymonsterdeadcallback(0,0,Type,CreatureID,KillerType,KillerID, MonsterID, MapID,PosX,PosY,leixing,shuzhi)
		--此部分预留
		--进入喊话函数
		--API_ActorBDCMsg(MapID,0,-1,50,85,0,1,'天空都市最终BOSS“'..API_GetMonsterNameByID(MonsterID)..'”被'..zhengying2..''..Conname..''..API_GetActorName(KillerID)..'击杀！5分钟后雷杰斯营地会产生大量辐射污染并关闭此区域，请尽快离开此区域！')
		--范围广播
		local playernumtable9 = API_GetActorInArea(MapID,1,295,685,410,735) --将军4
		if type(playernumtable9) == "table" then
			for i,v in pairs(playernumtable9) do
				API_ActorSendMsg(v, 1,'天空都市最终BOSS“'..API_GetMonsterNameByID(MonsterID)..'”被'..zhengying2..''..Conname..''..API_GetActorName(KillerID)..'击杀！5分钟后雷杰斯营地会产生大量辐射污染并关闭此区域，请尽快离开此区域！')
			end
		end
	end
	yjdsh_jiangjunquguaiwushangchu(MapID)
	yijicity_AreaChongZhi(MapID)
	API_CreateTimerTriggerG(MapID, 0, 300, 1, 'yjdsh_jiangjunsiwanghoushuamen')
	local Type = 4
	local LaiYuan = 1
	if GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] == nil then
		GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = 1
	else
		GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] + 1
	end
end
--将军死亡后5分钟刷门清场
function yjdsh_jiangjunsiwanghoushuamen(MapID,b)
	if not API_MapIsValid(MapID) then
		return
	end
	yjdsh_jiangjunqumenhebingying(MapID)
end
--将军区怪物清除
function yjdsh_jiangjunquguaiwushangchu(MapID)
	for i in yjdsh_11qufidtable do
		if yjdsh_11qufidtable[i] ~= nil then
			for j in yjdsh_11qufidtable[i] do			
				local Fid = yjdsh_11qufidtable[i][j]  --如果已经有数值了 那么取出来 看看怪物是否还存在
				if Fid ~= nil then
					if API_GetMonsterID(Fid) > 0 and API_GetMonsterID(Fid) ~= jiangjun then	--如果存在 那么标志设置为 1 不刷新了
						API_DestroyMonster(Fid)
						yjdsh_11qufidtable[i][j] = 0
					end
				end	
			end
		end	
	end
end
-- 功能NPC  
--重置时间查询
function yjdsh_qianxianzhihuiguan3(ActorID,NPCID) --前线指挥官（将军区）
	local ActorID = ActorID or API_RequestGetActorID() 
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	if NPCID ~= qianxianzhihuiguan3 then
		return
	end		
	YBT_1806panduan(ActorID,3)
	local SelectItem = API_RequestGetNumber(1)
	local MapID = API_GetActorMapID(ActorID)
	API_ResponseWrite('<name>'..API_GetMonsterNameByID(NPCID)..'</name>')
	if SelectItem == 1 then --传送出遗迹之城
		API_ResponseWrite('<text>确定要离开吗？离开后如果你带有'..API_GetMonsterNameByID(chongche2)..'，那么会消失的</text><br><br>')
		API_ResponseWrite('<a href="yjdsh_qianxianzhihuiguan3?1=2">是的，请传送吧</a><br><br>')
		API_ResponseWrite('<a>取消</a><br>')		
	elseif SelectItem == 2 then	--传送出遗迹之城
		yjdsh_gohome(ActorID)
		API_ResponseEnd()
		API_ResponseClear()		
	elseif SelectItem == 3 then	--竞拍“复活仪式”
		API_ResponseWrite('<text>随着天空都市上战争的爆发，牧师协会的牧师也出现在了天空都市的各个区域为佣兵团成员提供免费复活服务。想要享受这项服务，就必须在城门被攻破或机械族首领被击杀后，在我这里通过佣兵团资金竞拍使用权。当城门或首领出现后，竞拍将结束（竞拍失败的将返还资金），获得使用权的兵团将在这场BOSS战中免费原地复活，但是每次复活将增加5秒的复活时间，复活时间内不能复活。这个服务只能持续到本区域的首领（城门）死亡或达到30分钟，并只作用于当前区域。</text><br>')
		--获得权限的兵团
		local text = '暂时没有兵团获得免费复活权'
		local text2 = '当前免费复活权竞赛价格为100000佣兵团资金'
		local text3 = '未进入重置时间，不能进行竞拍'			
		local bingtuanid = API_GetMapVarData(MapID,26)
		local dangqianjinbi = API_GetMapVarData(MapID,27)
		if bingtuanid > 0 then
			text = '“'..API_ConGetStrInfo(bingtuanid,1)..'”佣兵团获得免费复活权'
		end
		if dangqianjinbi > 100000 then
			text2 = '当前免费复活权竞赛价格为'..dangqianjinbi..'佣兵团资金'
		end
		if API_GetMapVarData(MapID,15) > 0 then --有重置时间 就	
			local TopConsortiaId = API_GetTopConsortiaId(ActorID)
			if TopConsortiaId <= 0 then
				text3 = '只有有权限的佣兵团成员才能进行竞拍'
			else
				if API_IsOperate(TopConsortiaId,ActorID,17) ~= 1 then
					text3 = '只有有权限的佣兵团成员才能进行竞拍'
				else
					text3 = 3
				end
			end
		end
		API_ResponseWrite('<br><text>'..text..'</text><br>')
		API_ResponseWrite('<br><text>'..text2..'</text><br><br>')
		if text3 == 3 then
			API_ResponseWrite('<a href="yjdsh_qianxianzhihuiguan3?1=4">竞拍免费复活权限</a><br>')
		else
			API_ResponseWrite('<br><text>'..text3..'</text><br>')
		end
		API_ResponseWrite('<br><a>关闭</a>')
		--当前出价		
	elseif SelectItem == 4 then	--输入竞拍金额
		API_ResponseWrite('<text>请输入要竞拍的金额，每次最少加价10000</text><br>')
		API_ResponseWrite('<input type="number" name="3" size="13" width="50"><br><br>')
		API_ResponseWrite('<a href="yjdsh_freerelivejingpai?1=4&2='..ActorID..'">竞拍雷杰斯营地免费复活权</a><br><br>')
		API_ResponseWrite('<a>关闭</a><br><br>')		
	else
		if API_GetMapVarData(MapID,15) > 0 then --将军区
			--广播剩余时间
			local nowtime = os.time()
			local oldtime = API_GetMapVarData(MapID,15)
			local TimePast = os.difftime(nowtime,oldtime)
			local shengyutime = BossShuaXinShiJian - TimePast
			if shengyutime < 0 then
				shengyutime = 0
			end
			if shengyutime > 0 then
				shengyutime = math.floor(shengyutime/60)
			end
			if shengyutime > 0 then
				API_ResponseWrite('<text>这个区域的首领将于'..shengyutime..'分钟后刷新。</text><br>')
			else
				API_ResponseWrite('<text>这个区域的首领刷新时间小于1分钟。</text><br>')
			end
		end	
		API_ResponseWrite('<text>好了勇士，说说你要我为你做点什么。</text><br>')
		API_ResponseWrite('<br><a href="yjdsh_qianxianzhihuiguan3?1=3">竞拍“复活仪式”</a><br>')
		API_ResponseWrite('<br><a href="yjdsh_qianxianzhihuiguan3?1=1">回到飞艇处</a><br>')	
		API_ResponseWrite('<br><a>关闭</a><br>')
	end
	--API_ResponseWrite('<text>战术说明</text><br>')
	API_ResponseFlush(ActorID)
end

--冲车兑换  回到3区 离开遗迹之城  
function yjdsh_qianxianzhihuiguan4(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID() 
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	if NPCID ~= qianxianzhihuiguan5 then
		return
	end		
	YBT_1806panduan(ActorID,3)
	YBT_1806panduan(ActorID,4)
	local MapID = API_GetActorMapID(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	API_ResponseWrite('<name>'..API_GetMonsterNameByID(NPCID)..'</name>')
	if SelectItem == 1 then --传送回3部分
		API_ResponseWrite('<text>确定要过去吗？过去后如果你带有'..API_GetMonsterNameByID(chongche2)..'，那么会消失的</text><br><br>')
		API_ResponseWrite('<a href="yjdsh_qianxianzhihuiguan4?1=5">是的，请传送吧</a><br>')
		API_ResponseWrite('<br><a>取消</a><br>')
	elseif SelectItem == 2 then --传送出遗迹之城
		API_ResponseWrite('<text>确定要离开吗？离开后如果你带有'..API_GetMonsterNameByID(chongche2)..'，那么会消失的</text><br><br>')
		API_ResponseWrite('<a href="yjdsh_qianxianzhihuiguan4?1=4">是的，请传送吧</a><br><br>')
		API_ResponseWrite('<a>取消</a><br>')
	elseif SelectItem == 3 then	--传送换取冲车
		if API_GetMapVarData(MapID,19) == 0 then
			API_ResponseWrite('<text>开战后才能获得'..API_GetMonsterNameByID(chongche2)..'</text><br>')
			API_ResponseWrite('<br><a>关闭</a>')
			API_ResponseFlush(ActorID)
			return
		end				
		local chetime = API_VarDataGetNumber(ActorID,1,12145) --获取车的时间
		if chetime > 0 then
			local cheid = API_VarDataGetNumber(ActorID,1,12142) --获取车是否存在
			if API_GetMonsterID(cheid) > 0 then	
				API_ResponseWrite('<text>您同时只能拥有一辆'..API_GetMonsterNameByID(chongche2)..'</text><br>')
				API_ResponseWrite('<br><a>关闭</a>')
				API_ResponseFlush(ActorID)
				return
			end
		end
		local num = API_ActorGetGoodsNum(ActorID,feijiujinshuID)
		if num < feijiujinshukuaishu then
			local cha = feijiujinshukuaishu - num
			API_ResponseWrite('<text>再搞到'..cha..'块'..API_GetGoodsName(feijiujinshuID)..'”就可以换取'..API_GetMonsterNameByID(chongche2)..'。</text><br>')
			API_ResponseWrite('<br><a>关闭</a>')
		else
			local chetimechufaqi = API_VarDataGetNumber(ActorID,1,12144)
			if chetimechufaqi > 0 then
				API_DestroyTrigger(ActorID,-1,chetimechufaqi)
			end	
			API_VarDataSetNumber(ActorID,1,12142,0)
			API_VarDataSetNumber(ActorID,1,12143,0)
			API_VarDataSetNumber(ActorID,1,12144,0)
			API_VarDataSetNumber(ActorID,1,12145,0)
			API_VarDataSetNumber(ActorID,1,12181,0)
			API_ActorRemoveGoods(ActorID,feijiujinshuID,feijiujinshukuaishu,'兑换冲车')
			API_ActorSendMsg(ActorID,17,'消耗'..feijiujinshukuaishu..'块'..API_GetGoodsName(feijiujinshuID)..'成功换取'..API_GetMonsterNameByID(chongche2)..'')			
			yjdsh_chongchechuangjian(ActorID,chongche2,MapID)
			API_ResponseEnd()
			API_ResponseClear()		
		end
	elseif SelectItem == 4 then	--传送出遗迹之城
		yjdsh_gohome(ActorID)
		API_ResponseEnd()
		API_ResponseClear()		
	elseif SelectItem == 5 then	--传送回3部分
		local cheid = API_VarDataGetNumber(ActorID,1,12142)
		if cheid > 0 then
			if API_GetMonsterID(cheid) > 0 then	
				API_DestroyMonster(cheid)
			end	
			local chetimechufaqi = API_VarDataGetNumber(ActorID,1,12144)
			if chetimechufaqi > 0 then
				API_DestroyTrigger(ActorID,-1,chetimechufaqi)
			end	
			API_VarDataSetNumber(ActorID,1,12142,0)
			API_VarDataSetNumber(ActorID,1,12143,0)
			API_VarDataSetNumber(ActorID,1,12144,0)
			API_VarDataSetNumber(ActorID,1,12145,0)
			API_VarDataSetNumber(ActorID,1,12181,0)
		end		
		API_ActorGoToMap(ActorID,MapID,zhihuiguan3x,zhihuiguan3y) --NPC3的XY
		API_ResponseEnd()
		API_ResponseClear()		
	elseif SelectItem == 6 then
		API_ResponseWrite('<text>随着天空都市上战争的爆发，牧师协会的牧师也出现在了天空都市的各个区域为佣兵团成员提供免费复活服务。想要享受这项服务，就必须在城门被攻破或机械族首领被击杀后，在我这里通过佣兵团资金竞拍使用权。当城门或首领出现后，竞拍将结束（竞拍失败的将返还资金），获得使用权的兵团将在这场BOSS战中免费原地复活，但是每次复活将增加5秒的复活时间，复活时间内不能复活。这个服务只能持续到本区域的首领（城门）死亡或达到30分钟，并只作用于当前区域。</text><br>')
		--获得权限的兵团
		local text = '暂时没有兵团获得免费复活权'
		local text2 = '当前免费复活权竞赛价格为100000佣兵团资金'
		local text3 = '未进入重置时间，不能进行竞拍'			
		local bingtuanid = API_GetMapVarData(MapID,26)
		local dangqianjinbi = API_GetMapVarData(MapID,27)
		if bingtuanid > 0 then
			text = '“'..API_ConGetStrInfo(bingtuanid,1)..'”佣兵团获得免费复活权'
		end
		if dangqianjinbi > 100000 then
			text2 = '当前免费复活权竞赛价格为'..dangqianjinbi..'佣兵团资金'
		end
		if API_GetMapVarData(MapID,15) > 0 then --有重置时间 就	
			local TopConsortiaId = API_GetTopConsortiaId(ActorID)
			if TopConsortiaId <= 0 then
				text3 = '只有有权限的佣兵团成员才能进行竞拍'
			else
				if API_IsOperate(TopConsortiaId,ActorID,17) ~= 1 then
					text3 = '只有有权限的佣兵团成员才能进行竞拍'
				else
					text3 = 3
				end
			end
		end
		API_ResponseWrite('<br><text>'..text..'</text><br>')
		API_ResponseWrite('<br><text>'..text2..'</text><br><br>')
		if text3 == 3 then
			API_ResponseWrite('<a href="yjdsh_qianxianzhihuiguan4?1=7">竞拍免费复活权限</a><br>')
		else
			API_ResponseWrite('<br><text>'..text3..'</text><br>')
		end
		API_ResponseWrite('<br><a>关闭</a>')
		--当前出价		
	elseif SelectItem == 7 then	--输入竞拍金额	
		API_ResponseWrite('<text>请输入要竞拍的金额，每次最少加价10000</text><br>')
		API_ResponseWrite('<input type="number" name="3" size="13" width="50"><br><br>')
		API_ResponseWrite('<a href="yjdsh_freerelivejingpai?1=4&2='..ActorID..'">竞拍雷杰斯营地免费复活权</a><br><br>')
		API_ResponseWrite('<a>关闭</a><br><br>')
	else
		if API_GetMapVarData(MapID,15) > 0 then --将军区
			--广播剩余时间
			local nowtime = os.time()
			local oldtime = API_GetMapVarData(MapID,15)
			local TimePast = os.difftime(nowtime,oldtime)
			local shengyutime = BossShuaXinShiJian - TimePast
			if shengyutime < 0 then
				shengyutime = 0
			end
			if shengyutime > 0 then
				shengyutime = math.floor(shengyutime/60)
			end
			if shengyutime > 0 then
				API_ResponseWrite('<text>这个区域的首领将于'..shengyutime..'分钟后刷新。</text><br><br>')
			else
				API_ResponseWrite('<text>这个区域的首领刷新时间小于1分钟。</text><br><br>')
			end
		end	
		API_ResponseWrite('<text>勇士们，这里是机械族首领'..API_GetMonsterNameByID(906014)..'的营地。'..API_GetMonsterNameByID(906014)..'会根据战争情况从那6个兵营中调兵增援。并会对那些士兵进行强化。一定要尽早的消灭那些士兵并拆掉兵营来削弱'..API_GetMonsterNameByID(906014)..'，没有了士兵那家伙根本不值一提。</text><br>')
		API_ResponseWrite('<text>从那些机械身上搞到“'..feijiujinshukuaishu..'块'..API_GetGoodsName(feijiujinshuID)..'”，把他们交给我，我将为你们提供对付那些兵营的“'..API_GetMonsterNameByID(chongche2)..'，你有5分钟的使用权”</text><br>')
		API_ResponseWrite('<text>好了勇士，说说你要我为你做点什么。</text><br>')
		API_ResponseWrite('<br><a href="yjdsh_qianxianzhihuiguan4?1=3">给我来辆'..API_GetMonsterNameByID(chongche2)..'</a><br>')
		API_ResponseWrite('<br><a href="yjdsh_qianxianzhihuiguan4?1=6">竞拍“复活仪式”</a><br>')
		API_ResponseWrite('<br><a href="yjdsh_qianxianzhihuiguan4?1=1">回到门的另外一边</a><br>')
		API_ResponseWrite('<br><a href="yjdsh_qianxianzhihuiguan4?1=2">离开天空都市</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	end
	--API_ResponseWrite('<text>战术说明</text><br>')
	API_ResponseFlush(ActorID)
end

function yjdsh_gohome(ActorID) --将玩家传送出遗迹都市
	if ActorID <= 200 then
		return
	end
	
	local MapID1 = API_GetRightMapID(111)
	local Camp = API_GetActorCamp(ActorID)
	local x = 0
	local y = 0
	if Camp == 0 then
		x = 590
		y = 383
	elseif Camp == 1 then
		x = 590
		y = 377
	end
	if x > 0 and y > 0 then
		local CheFastid = API_VarDataGetNumber(ActorID,1,12142) --获取玩家的冲车FASTID
		if CheFastid > 0 then
			if API_GetMonsterID(CheFastid) > 0 then	
				API_DestroyMonster(CheFastid)
			end	
			local chetimechufaqi = API_VarDataGetNumber(ActorID,1,12144) --获取玩家的冲车时间触发器
			if chetimechufaqi > 0 then
				API_DestroyTrigger(ActorID,-1,chetimechufaqi)
			end	
			API_VarDataSetNumber(ActorID,1,12142,0) --冲车FASTID清零
			API_VarDataSetNumber(ActorID,1,12143,0) --冲车血量清零
			API_VarDataSetNumber(ActorID,1,12144,0) --冲车时间触发器清零
			API_VarDataSetNumber(ActorID,1,12145,0) --冲车时间清零
			API_VarDataSetNumber(ActorID,1,12181,0) --冲车MONSTERID清零
		end
		API_ActorRemoveStatus(ActorID,2001001) --清除玩家状态
		API_ActorGoToMap(ActorID,MapID1,x,y) --传出位置：光明遗迹飞艇处 
	end
end

function yjdsh_chongchechuangjian(ActorID,chongcheID,MapID) --冲车创建
	if ActorID <= 0 then
		return
	end
	local cheid = API_VarDataGetNumber(ActorID,1,12142) --获取冲车的FASTID
	local lasttime = API_VarDataGetNumber(ActorID,1,12145) --获取领取冲车的时间
	local nowtime = os.time()
	local TimePast = os.difftime(nowtime,lasttime)
	if cheid > 0 then
		if API_GetMonsterID(cheid) > 0 then	
			API_DestroyMonster(cheid)
			API_VarDataSetNumber(ActorID,1,12142,0) --冲车FASTID清零
			API_VarDataSetNumber(ActorID,1,12181,0) --冲车MONSTERID清零
		end
	end	
	local chetime = API_VarDataGetNumber(ActorID,1,12145) --领取冲车的时间
	if chetime > 0 then
		if TimePast >= 300 then
			local chetimechufaqi = API_VarDataGetNumber(ActorID,1,12144) --冲车时间触发器ID
			if chetimechufaqi > 0 then
				API_DestroyTrigger(ActorID,-1,chetimechufaqi)
			end	
			API_VarDataSetNumber(ActorID,1,12144,0) --冲车时间触发器清零
			API_VarDataSetNumber(ActorID,1,12145,0) --领取冲车的时间清零
			API_VarDataSetNumber(ActorID,1,12143,0) --冲车血量清零
		end	
	end
	local ok = 0
	local Camp = API_GetActorCamp(ActorID)
	if chongcheID == chongche1 then
		if Camp == 0 then
			if API_GetMapVarData(MapID,13) > 0 then
				ok = 1
			end
		elseif Camp == 1 then
			if API_GetMapVarData(MapID,12) > 0 then
				ok = 1
			end
		end	
	elseif chongcheID == chongche2 then
		if API_GetMapVarData(MapID,19) == 0 then
			ok = 1
		end
	end
	if ok == 0 then
		local hp = API_VarDataGetNumber(ActorID,1,12143) --获取冲车血量
		local x = API_GetActorPosX(ActorID)	
		local y = API_GetActorPosY(ActorID)
		local fastid = API_CreateMonster(MapID,chongcheID,x,y,5,0,-1)
		local TimePast2 = 300 
		if lasttime > 0 then
			TimePast2 = 300 - TimePast
		end
		local Trigger = API_CreateTimerTrigger(ActorID,TimePast2,1,-1,'yjdsh_chongcheshanchuhuidiao') --创建冲车删除时间触发器
		if hp > 0 then
			API_MonsterAddHP(fastid,-hp)
		end
		API_SetActorChief(fastid,ActorID)
		API_VarDataSetNumber(ActorID,1,12142,fastid) --冲车FASTID存交互
		API_VarDataSetNumber(ActorID,1,12143,0) --冲车血量存交互
		API_VarDataSetNumber(ActorID,1,12144,Trigger) --冲车存在时间触发器存交互
		if API_VarDataGetNumber(ActorID,1,12145) == 0 then
			API_VarDataSetNumber(ActorID,1,12145,nowtime) --领取冲车时间
		end
		API_VarDataSetNumber(ActorID,1,12181,chongcheID) --冲车MONSTERID
		--兵团冲车兑换任务完成情况判定
		local renwujiaohu2 = API_VarDataGetNumber(ActorID,1,12172) --佣兵团任务状态1815
		local zhuangtai2 = math.mod(renwujiaohu2,10)
		local taskid = 1815
		local taskname = '兑换蛮牛战车'
		local ybtshizheMAPID = YBT_yongbingtuanshizheweihi(Camp)	
		if zhuangtai2 == 1 then
			API_UpdateTaskLeadEx(ActorID,taskid,0,2,'成功获得一辆"'..API_GetMonsterNameByID(chongche1)..'" ')
			renwujiaohu2 = renwujiaohu2 + 1
			API_TaskLogUpdate(ActorID,taskid,0,4,'<Task NPCName="'..API_GetMonsterNameByID(11727)..'" NpcID="11727" NPCPos="'..ybtshizheMAPID..'" condition="0" FinishNum="0" IsFinish="2">'..taskname..'</Task>')
			API_VarDataSetNumber(ActorID,1,12172,renwujiaohu2)
			API_ActorSendMsg(ActorID,6,'['..taskname..']完成')
			API_TaskLogUpdate(ActorID,taskid,0,2,'<text color="183,0,28">成功获得一辆"'..API_GetMonsterNameByID(chongche1)..'" </text>')
		end
	end	
end

function yjdsh_chongcheshanchuhuidiao(ActorID,TaskID) --冲车删除回调
	if API_ActorIsOnline(ActorID) then
		local fastid = API_VarDataGetNumber(ActorID,1,12142)
		if API_GetMonsterID(fastid) > 0 then	
			local ChongCheName = API_GetMonsterName(fastid)
			API_DestroyMonster(fastid)
			API_ActorSendMsg(ActorID,3,''..ChongCheName..'有效期已到，已删除')
		end
		API_VarDataSetNumber(ActorID,1,12142,0)
		API_VarDataSetNumber(ActorID,1,12143,0)
		API_VarDataSetNumber(ActorID,1,12144,0)
		API_VarDataSetNumber(ActorID,1,12145,0)
		API_VarDataSetNumber(ActorID,1,12181,0)
	end
end

function yjdsh_jiangjunBOSSxiaoguaibuff() --将军BOSS小怪BUFF
	local time1 = 30
	if yjdsh_11qufidtable[jiangjun][1] ~= nil then
		local Bossfid = yjdsh_11qufidtable[jiangjun][1]
		if API_GetMonsterID(Bossfid) > 0 then --WYL防报错
			local FastHP = API_MonsterGetPropNum(Bossfid,2)
			local FastMAXHP = API_MonsterGetPropNum(Bossfid,3)
			local baifenbi = FastHP/FastMAXHP * 100			
			if baifenbi <= 30 then
				time1 = 10
			elseif baifenbi > 30 and baifenbi <= 50 then
				time1 = 20
			elseif baifenbi > 50 and baifenbi <= 80 then
				time1 = 25
			end
		end
	end
	for i in yjdsh_11qufidtable do
		if type(yjdsh_11qufidtable[i])  == 'table' and yjdsh_11qufidtable[i] ~= nil then
			if i ~= jiangjun and i ~= bingying3 then
				for j in yjdsh_11qufidtable[i] do
					local fastid = yjdsh_11qufidtable[i][j]
					if fastid ~= nil then
						if API_GetMonsterID(fastid) > 0 then
							--添加 BUFF
							API_MonsterAddStatus(fastid,917001,0)
							API_MonsterAddStatus(fastid,918001,0)
						end
					end	
				end
			end	
		end	
	end
	API_CreateTimerTriggerG(0,0,time1,1,'yjdsh_jiangjunBOSSxiaoguaibuff')
end
--第五部分
--创建副本
function yjdsh_shenmikongjian_Initialization(MapID,ActorID) 
	for i in yjdsh_13qumonstertable do --进入1区表进行循环 找怪 放置
		if yjdsh_13qumonstertable[i] ~= nil then  
			for j in yjdsh_13qumonstertable[i] do  --找到怪物后进行循环
				if yjdsh_13qumonstertable[i][j] ~= nil then		--如果怪物对应的坐标不是空		
					local x =  yjdsh_13qumonstertable[i][j].x
					local y =  yjdsh_13qumonstertable[i][j].y
					local fastid = API_CreateMonster(MapID,i,x,y,5,0,-1) 		
					if i == jingxiangBOSS then
						API_CreateDieTriggerG(ActorID,0,0,fastid,'yjdsh_jingxiangbosssiwanghuidiao') --镜像BOSS死亡触发器 	
					elseif i ~= chuqudemen then
						API_MonsterAddStatus(fastid,72001,0) --血量少40%，基础防少50%
						API_CreateDieTriggerG(0,0,0,fastid,'yjdsh_jingxiangxiaoguaisiwanghuidiao')
					end							
				end
			end
		end
	end
end

function yjdsh_jingxiangbosssiwanghuidiao(shouyizheid,Param_2,Type,CreatureID,KillerType,KillerID, MonsterID, MapID,PosX,PosY,leixing,shuzhi) --镜像BOSS死亡回调
	if KillerType == 1 then
		--执行掉落函数 物品增加1分钟保护 受益人是 shouyizheid（队长）
		yjdsh_jymonsterdeadcallback(shouyizheid,0,Type,CreatureID,KillerType,KillerID, MonsterID, MapID,PosX,PosY,leixing,shuzhi)
		local TeamID = API_GetTeamID(shouyizheid)
		if TeamID > 0 then
			API_ActorBDCMsg(MapID,0,-1,50,85,0,1,'“'..API_GetMonsterNameByID(MonsterID)..'”已死亡。掉落的宝物队长'..API_GetActorName(shouyizheid)..'有1分钟的优先拾取权。')
			API_ActorBDCMsg(MapID,0,-1,50,85,0,17,'“'..API_GetMonsterNameByID(MonsterID)..'”已死亡。掉落的宝物队长'..API_GetActorName(shouyizheid)..'有1分钟的优先拾取权。')
		else
			API_ActorBDCMsg(MapID,0,-1,50,85,0,1,'“'..API_GetMonsterNameByID(MonsterID)..'”已死亡。')
			API_ActorBDCMsg(MapID,0,-1,50,85,0,17,'“'..API_GetMonsterNameByID(MonsterID)..'”已死亡。')
		end
	end
end

function yjdsh_jingxiangxiaoguaisiwanghuidiao(Param_1,Param_2,Type,CreatureID,KillerType,KillerID, MonsterID, MapID,PosX,PosY) --镜像小怪死亡回调
	if KillerType == 1 then
		--执行掉落函数 所有人都可以拾取
		if yjdsh_ptmonsterdroptypetable[MonsterID] ~= nil then
			local DropType = yjdsh_ptmonsterdroptypetable[MonsterID]
			if yjdsh_ptmonsterdropgoodstable[DropType] == nil then
				return
			end
			local Table = yjdsh_ptmonsterdropgoodstable[DropType]
			--掉普通道具
			for j in Table[1] do
				local RD = math.random(1000000)
				local GoodsID = Table[1][j].GoodsID
				local GoodsNum = Table[1][j].GoodsNum
				local GaiLv = Table[1][j].GaiLv
				local PinZhi = Table[1][j].PinZhi
				if RD <= GaiLv and GoodsID ~= 80947 and GoodsID ~= 80948 then
					API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,'天空都市副本怪掉落',4,0,600,120)
				end
			end
			if Table[2] ~= nil then
				local RD = math.random(1000000)
				local GaiLv = Table[2].GaiLv
				if RD < GaiLv then
					local LeiXing = Table[2].LeiXing
					local GoodsNum = Table[2].Num
					local PinZhi = 2
					local PinZhiTab = Table[2].PinZhiTab
					local RD2 = math.random(100)
					for j in PinZhiTab do
						local a = PinZhiTab[j].a
						local b = PinZhiTab[j].b
						if RD2 >= a and RD2 <= b then
							PinZhi = PinZhiTab[j].PinZhi
						end
					end
					if YXD_WorldDropGoodsTab[LeiXing] ~= nil then
						local GoodsID = YXD_WorldDropGoodsTab[LeiXing][math.random(table.getn(YXD_WorldDropGoodsTab[LeiXing]))]
						API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,1,'天空都市副本怪掉落',0,0,600,120,PinZhi)
					end
				end
			end
		end
	end	
end

--将军区前的门点击对话，提示玩家需摧毁三个兵营才会开门
function yjdsh_jiangjunquqiandemenduihua(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID) 
	local MapConfigID = API_GetMapConfigID(MapID)
	API_ResponseWrite('<br><text>需要干掉下方的三个铸魔兵营才能继续打开通往雷杰斯营地的大门。</text><br>')
	API_ResponseWrite('<br><a mapid="'..MapConfigID..'" x="380" y="641" npcid="0" underline="1">一号铸魔兵营</a><br>')
	API_ResponseWrite('<br><a mapid="'..MapConfigID..'" x="469" y="641" npcid="0" underline="1">二号铸魔兵营</a><br>')
	API_ResponseWrite('<br><a mapid="'..MapConfigID..'" x="436" y="710" npcid="0" underline="1">三号铸魔兵营</a><br>')
	API_ResponseWrite('<br><br><a>关闭</a>')
end

--精英怪死亡触发器 by 万钰林
function yjdsh_jymonsterdeadcallback(YouXianID,KillPanDuan,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
--~ 	if MonsterID == chengmen and KillPanDuan == 0 then
--~ 		return
--~ 	end
	if yjdsh_jymonsterdroptypetable[MonsterID] == nil then
		return
	end
	local DropType = yjdsh_jymonsterdroptypetable[MonsterID]
	if yjdsh_jymonsterdropgoodstable[DropType] == nil then
		return
	end
	local MonName = API_GetMonsterNameByID(MonsterID)
	local Say = ''
	local Num = 0
	local Card = 0
	local LinShiTable = {}
	local Table = yjdsh_jymonsterdropgoodstable[DropType]
	local BeiLv = 1
	if WYL_2011NationalDay_BossDropTab[MonsterID] ~= nil then
		local Time = os.time() 
		if Time >= 1317312000 and Time < 1318003200 then
			BeiLv = 3
		end
	end
	--掉普通道具
	for j in Table[1] do
		local RD = math.random(1000000)
		local GoodsID = Table[1][j].GoodsID
		local GoodsNum = Table[1][j].GoodsNum
		local GaiLv = Table[1][j].GaiLv * BeiLv
		local PinZhi = Table[1][j].PinZhi
		local Bind = Table[1][j].Bind
		local GoodsName = API_GetGoodsName(GoodsID)
		if RD <= GaiLv then
			local XuHao = table.getn(LinShiTable) + 1
			if LinShiTable[XuHao] == nil then
				LinShiTable[XuHao] = {}
			end
			LinShiTable[XuHao].GoodsID = GoodsID
			LinShiTable[XuHao].GoodsNum = GoodsNum
			LinShiTable[XuHao].PinZhi = PinZhi
			LinShiTable[XuHao].Bind = Bind
			LinShiTable[XuHao].Make1 = 0
			LinShiTable[XuHao].Make2 = 0
		end
	end
	--掉英雄书
	if Table[2] ~= nil then
		local RD = math.random(1000000)
		local GaiLv = Table[2].GaiLv * BeiLv
		local GoodsTab = Table[2].GoodsTab
		local Bind = Table[2].Bind
		if RD < GaiLv then
			local GoodsID = GoodsTab[math.random(table.getn(GoodsTab))]
			local XuHao = table.getn(LinShiTable) + 1
			if LinShiTable[XuHao] == nil then
				LinShiTable[XuHao] = {}
			end
			LinShiTable[XuHao].GoodsID = GoodsID
			LinShiTable[XuHao].GoodsNum = 1
			LinShiTable[XuHao].PinZhi = 0
			LinShiTable[XuHao].Bind = Bind
			LinShiTable[XuHao].Make1 = 0
			LinShiTable[XuHao].Make2 = 0
		end
	end
	--掉装备
	if Table[3] ~= nil then
		for i in Table[3] do
			local RD = math.random(1000000)
			local GaiLv = Table[3][i].GaiLv * BeiLv
			if RD < GaiLv then
				local LeiXing = Table[3][i].LeiXing
				local LeiXingTab = Table[3][i].LeiXingTab
				local LXRD = math.random(100)
				for j in LeiXingTab do
					local a = LeiXingTab[j].a
					local b = LeiXingTab[j].b
					if LXRD >= a and LXRD <= b then
						LeiXing = LeiXingTab[j].LeiXing
					end
				end
				
				local GoodsNum = Table[3][i].Num
				local Bind = Table[3][i].Bind
				
				local PinZhi = 2
				local PinZhiTab = Table[3][i].PinZhiTab
				local PZRD = math.random(100)
				for j in PinZhiTab do
					local a = PinZhiTab[j].a
					local b = PinZhiTab[j].b
					if PZRD >= a and PZRD <= b then
						PinZhi = PinZhiTab[j].PinZhi
					end
				end
				
				local Make1 = 0
				local Make1Tab = Table[3][i].Make1Tab
				local M1RD = math.random(100)
				for j in Make1Tab do
					local a = Make1Tab[j].a
					local b = Make1Tab[j].b
					if M1RD >= a and M1RD <= b then
						Make1 = Make1Tab[j].Make1
					end
				end
				
				local Make2 = 0
				local Make2Tab = Table[3][i].Make2Tab
				local M2RD = math.random(100)
				for j in Make2Tab do
					local a = Make2Tab[j].a
					local b = Make2Tab[j].b
					if M2RD >= a and M2RD <= b then
						Make2 = Make2Tab[j].Make2
					end
				end
				
				if YXD_WorldDropGoodsTab[LeiXing] ~= nil then
					local GoodsID = YXD_WorldDropGoodsTab[LeiXing][math.random(table.getn(YXD_WorldDropGoodsTab[LeiXing]))]
					local GoodsName = API_GetGoodsName(GoodsID)
					local XuHao = table.getn(LinShiTable) + 1
					if LinShiTable[XuHao] == nil then
						LinShiTable[XuHao] = {}
					end
					LinShiTable[XuHao].GoodsID = GoodsID
					LinShiTable[XuHao].GoodsNum = GoodsNum
					LinShiTable[XuHao].PinZhi = PinZhi
					LinShiTable[XuHao].Bind = Bind
					LinShiTable[XuHao].Make1 = Make1
					LinShiTable[XuHao].Make2 = Make2
					
				end
			end
		end
	end
	--掉宝石？ Table[4]
	if Table[4] ~= nil then
		local RD = math.random(1000000)
		local GaiLv = Table[4].GaiLv * BeiLv
		local GoodsTab = Table[4].GoodsTab
		local Bind = Table[4].Bind
		if RD < GaiLv then
			local GoodsID = GoodsTab[math.random(table.getn(GoodsTab))]
			local XuHao = table.getn(LinShiTable) + 1
			if LinShiTable[XuHao] == nil then
				LinShiTable[XuHao] = {}
			end
			LinShiTable[XuHao].GoodsID = GoodsID
			LinShiTable[XuHao].GoodsNum = 1
			LinShiTable[XuHao].PinZhi = 0
			LinShiTable[XuHao].Bind = Bind
			LinShiTable[XuHao].Make1 = 0
			LinShiTable[XuHao].Make2 = 0
		end
	end
	--正式掉物品
	local DiaoLuoTable = {}
	while table.getn(LinShiTable) > 0 do
		local XuHao = table.getn(DiaoLuoTable) + 1
		local RandomXuHao = math.random(table.getn(LinShiTable))
		if DiaoLuoTable[XuHao] == nil then
			DiaoLuoTable[XuHao] = {}
		end
		DiaoLuoTable[XuHao].GoodsID = LinShiTable[RandomXuHao].GoodsID
		DiaoLuoTable[XuHao].GoodsNum = LinShiTable[RandomXuHao].GoodsNum
		DiaoLuoTable[XuHao].PinZhi = LinShiTable[RandomXuHao].PinZhi
		DiaoLuoTable[XuHao].Bind = LinShiTable[RandomXuHao].Bind
		DiaoLuoTable[XuHao].Make1 = LinShiTable[RandomXuHao].Make1
		DiaoLuoTable[XuHao].Make2 = LinShiTable[RandomXuHao].Make2
		table.remove(LinShiTable,RandomXuHao)
	end
	local DropTime = 120
	for j in DiaoLuoTable do
		local GoodsID = DiaoLuoTable[j].GoodsID
		local GoodsNum = DiaoLuoTable[j].GoodsNum
		local PinZhi = DiaoLuoTable[j].PinZhi
		local Bind = DiaoLuoTable[j].Bind
		local Make1 = DiaoLuoTable[j].Make1
		local Make2 = DiaoLuoTable[j].Make2
		local GoodsName = API_GetGoodsName(GoodsID)
		if PinZhi > 0 then
			if YouXianID > 0 then
				GuiShuXing = 4
				GuiShuID = YouXianID
				DropTime = 60
			end
			if KillPanDuan == 1 then
				GuiShuXing = 4
				GuiShuID = KillerID
				local TeamID = API_GetTeamID(KillerID)
				if TeamID > 0 then
					GuiShuXing = 3
					GuiShuID = TeamID
				end
			end
			if API_DropGoodsWithMakeFlag(MapID,PosX,PosY,GoodsID,GoodsNum,Bind,''..MonName..'掉落物品',GuiShuXing,GuiShuID,600,DropTime,PinZhi,Make1,Make2) == true then
				if PinZhi == 6 then
					if YXD_WorldBoss_SayGoodsTab[GoodsID] ~= nil then
						Num = Num + 1
						if Num == 1 then
							if Card == 0 then
								Say = Say..'高附加属性3洞的'..GoodsName..''
							else
								Say = Say..'，高附加属性3洞的'..GoodsName..''
							end
						else
							Say = Say..'、'..GoodsName..''
						end
					end
				end
			end
			if Make1 == 4 and Make2 == 4 then
				local Type = 9
				local LaiYuan = 1
				if GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] + 1
				end
			end
		else
			local GuiShuXing2 = GuiShuXing 
			if GuiShuXing == 4 then
				GuiShuXing2 = 0
			elseif GuiShuXing == 0 then
				GuiShuXing2 = 4
			end
			if YouXianID > 0 then
				GuiShuXing2 = 0
				GuiShuID = YouXianID
				DropTime = 60
			end
			if KillPanDuan == 1 then
				GuiShuXing2 = 0
				GuiShuID = KillerID
				local TeamID = API_GetTeamID(KillerID)
				if TeamID > 0 then
					GuiShuXing2 = 3
					GuiShuID = TeamID
				end
			end
			if API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,Bind,''..MonName..'掉落物品',GuiShuXing2,GuiShuID,600,DropTime) == true then
				if YXD_WorldBoss_SayCardTab[GoodsID] ~= nil then
					Card = Card + 1
					if Card == 1 then
						Say = Say..'高级宠物卡'..GoodsName..''
					else
						Say = Say..'、'..GoodsName..''
					end
				end
			end
			if GoodsID == 80952 and yjdsh_jymonsterdroptypetable[MonsterID] ~= nil then
				local Type = 7
				if yjdsh_jymonsterdroptypetable[MonsterID] > 3 then
					Type = 8
				end
				local LaiYuan = 1
				if GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[59][Type][LaiYuan] + 1
				end
			end
		end
	end
	if Card > 0 or Num > 0 then
		if KillPanDuan == 0 then
			if GuiShuXing == 4 then
				if API_ActorIsOnline(GuiShuID) then
					API_ActorBroadcastMsg(-1, 17,''..API_GetActorName(GuiShuID)..'杀死'..MonName..'，掉落了'..Say..'。')
				else
					API_ActorBroadcastMsg(-1, 17,''..MonName..'死亡，掉落了'..Say..'。')
				end
			elseif GuiShuXing == 3 then
				local TeamLeaderID = API_GetTeamLeader(GuiShuID)
				if API_ActorIsOnline(TeamLeaderID) then
					API_ActorBroadcastMsg(-1, 17,''..API_GetActorName(TeamLeaderID)..'带领的队伍杀死了'..MonName..'，掉落了'..Say..'。')
				else
					API_ActorBroadcastMsg(-1, 17,''..MonName..'死亡，掉落了'..Say..'。')
				end
			else
				API_ActorBroadcastMsg(-1, 17,''..MonName..'死亡，掉落了'..Say..'。')
			end
		else
			local Camp = API_GetActorCamp(KillerID)
			local CampName = ''
			local QuYuName = ''
			if Camp == 0 then
				CampName = '帝国'
				QuYuName = '磐石要塞'
			else
				CampName = '联邦'
				QuYuName = '风暴要塞'
			end
			local TopConsortiaId = API_GetTopConsortiaId(KillerID)
			local TxT = {'超强','强悍','变态','幸运','勇猛',}
			local Conname = ''..TxT[math.random(table.getn(TxT))]..'的'
			if TopConsortiaId > 0 then
				Conname = ''..API_ConGetStrInfo(TopConsortiaId,1)..'佣兵团的'
			end
			API_ActorBroadcastMsg(-1, 17,''..QuYuName..'的城门被'..CampName..''..Conname..''..API_GetActorName(KillerID)..'攻破，掉落了'..Say..'。')
		end
	end
end

--[[function yjdsh_DuShiGuangChangChuanSong()
	local DuShiGuangChangArea = API_GetActorInArea(yijidushipeizhimapid,1, long X1, long Y1, long X2, long Y2)
	if type(DuShiGuangChangArea) == "table" then
		for i,v in pairs(DuShiGuangChangArea) do
			local ActorID = v
			local CampID = API_GetActorCamp(ActorID)
			if API_ActorIsOnline(ActorID) then
				if CampID == 1 then --联邦
					API_ActorGoToMap(ActorID,yijidushipeizhimapid, long x, long y)
				elseif CampID == 0 then --帝国
					API_ActorGoToMap(ActorID,yijidushipeizhimapid, long x, long y)
				end
				API_ActorSendMsg(ActorID,3,'法斯勒广场BOSS已出现，为了您的安全，您被传送到安全区域')
			end
		end
	end
end

function yidsh_JiangJunQuChuanSong()
	local JiangJunQuArea = API_GetActorInArea(yijidushipeizhimapid,1, long X1, long Y1, long X2, long Y2)
	if type(JiangJunQuArea) == "table" then
		for i,v in pairs(JiangJunQuArea) do
			local ActorID = v
			local CampID = API_GetActorCamp(ActorID)
			if API_ActorIsOnline(ActorID) then
				if CampID == 1 then --联邦
					API_ActorGoToMap(ActorID,yijidushipeizhimapid, long x, long y)
				elseif CampID == 0 then --帝国
					API_ActorGoToMap(ActorID,yijidushipeizhimapid, long x, long y)
				end
				API_ActorSendMsg(ActorID,3,'雷杰斯营地BOSS已出现，为了您的安全，您被传送到安全区域')
			end
		end
	end
end]]
