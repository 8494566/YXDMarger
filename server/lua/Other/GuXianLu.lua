----------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\GuXianLu.lua
--描  述:	古仙路（单人副本，挂在「便捷功能」卷轴上）
--		  每天 1 次；组队不可进；100 层幻影，每层属性 ×1.1（复利）；第 N 层给 N 个「古仙令」
--		  死亡/离开/通关 100 层 → 结束并销毁副本
--修 改:	2026-09-26 新建 / 2026-09-26 修复组队判断(API_GetTeamID)、怪在玩家脚下生成、销毁守护
----------------------------------------------------------------------------------------------------

GuXianLu_MapStatic   = 139        -- 副本用哪张静态地图（139 = 休门场地）
GuXianLu_BossFirst   = 944100     -- 第 1 层怪物 ID
GuXianLu_LayerMax    = 100        -- 最高层
GuXianLu_SpawnX      = 124
GuXianLu_SpawnY      = 125
GuXianLu_FlagVar     = 19030      -- 每天次数的 VarData 号
GuXianLu_Goods       = 83000      -- 古仙令
GuXianLu_Run         = {}         -- [ActorID] = {Map=,Layer=,Fast=}

-- 今天日期数字（YYYYMMDD）
function GuXianLu_Today()
	local Y, Mo, D = PublicFun_time()
	return Y * 10000 + Mo * 100 + D
end

function GuXianLu_UsedToday(ActorID)
	local ok, v = pcall(API_VarDataGetNumber, ActorID, 1, GuXianLu_FlagVar)
	if ok and v ~= nil then
		return v == GuXianLu_Today()
	end
	return false
end

-- 组队状态判断：API_GetTeamID > 0 即为有队伍（API_GetTeamSize 要传 TeamID，不能传 ActorID）
function GuXianLu_IsInTeam(ActorID)
	local ok, TeamID = pcall(API_GetTeamID, ActorID)
	if ok and TeamID ~= nil and TeamID > 0 then
		return true
	end
	return false
end

function GuXianLu_Title()
	local ActorID = API_RequestGetActorID()
	API_ResponseWrite('<name>古仙路</name>')
	API_ResponseWrite('<win rect="80,330,830,300"></win>')
	API_ResponseWrite('<br><text size="14">古仙路 —— 单人挑战，共 </text><text size="14" color="255,255,0">'..GuXianLu_LayerMax..'</text><text size="14"> 层。</text><br>')
	API_ResponseWrite('<text size="14">　· 每层刷新一只「幻影」，<text color="255,128,0">实力每层 ×1.1（复利）</text></text><br>')
	API_ResponseWrite('<text size="14">　· 击杀第 N 层可得 <text color="0,255,0">N 个「古仙令」</text>（邮件发放）</text><br>')
	API_ResponseWrite('<text size="14">　· <text color="255,0,0">每天只能进一次</text>；<text color="255,0,0">组队不能进</text>；死亡或通关即结束</text><br>')
	API_ResponseWrite('<text size="14">　· 每 </text><text size="14" color="255,255,0">3000</text><text size="14"> 个「古仙令」可在本卷轴兑换界面换一件好礼</text><br><br>')
	if GuXianLu_UsedToday(ActorID) then
		API_ResponseWrite('<text size="14" color="255,0,0">你今天已经挑战过古仙路了，明天再来吧！</text><br><br>')
	elseif GuXianLu_IsInTeam(ActorID) then
		API_ResponseWrite('<text size="14" color="255,0,0">古仙路是单人副本，请先解散队伍再来！</text><br><br>')
	else
		API_ResponseWrite('<a href="GuXianLu_Start?1=1">　进入古仙路（挑战）</a><br><br>')
	end
	API_ResponseWrite('<a href="SpringFestival_JuanZhou">返回</a> <a>关闭</a>')
end

-- 在玩家当前所在位置刷出第 Layer 层的幻影；失败重试 3 次
function GuXianLu_SpawnLayer(ActorID, MapID, Layer)
	local x, y = GuXianLu_SpawnX, GuXianLu_SpawnY
	local okp, px, py = pcall(PublicFun_GetActorPosXY, ActorID)
	if okp and px ~= nil and px > 0 then
		x, y = px, py
	end
	local MonID = GuXianLu_BossFirst + Layer - 1
	for try = 1, 3 do
		local ok, FastID = pcall(API_CreateMonster, MapID, MonID, x + try - 1, y + try - 1, 4, 0, -1)
		if ok and FastID ~= nil and FastID > 0 then
			pcall(API_CreateDieTriggerG, ActorID, 0, 0, FastID, 'GuXianLu_DieFunc')
			return FastID
		end
	end
	API_Trace('GuXianLu 刷怪失败 layer='..tostring(Layer)..' map='..tostring(MapID)..' mon='..tostring(MonID))
	return 0
end

function GuXianLu_Start()
	local ActorID = API_RequestGetActorID()
	API_ResponseWrite('<name>古仙路</name>')
	if GuXianLu_UsedToday(ActorID) then
		API_ResponseWrite('<br><text size="14" color="255,0,0">你今天已经挑战过了，明天再来。</text><br><br><a>关闭</a>')
		return
	end
	if GuXianLu_IsInTeam(ActorID) then
		API_ResponseWrite('<br><text size="14" color="255,0,0">请先解散队伍！古仙路只能单人挑战。</text><br><br><a>关闭</a>')
		return
	end
	local ok, ObjectMapID = pcall(API_CreateEctype, GuXianLu_MapStatic, 0)
	if not ok or ObjectMapID == nil then
		API_ResponseWrite('<br><text size="14" color="255,0,0">副本创建失败，请联系管理员。</text><br><br><a>关闭</a>')
		return
	end
	GuXianLu_Run[ActorID] = {Map = ObjectMapID, Layer = 1, Fast = 0}
	API_VarDataSetNumber(ActorID, 1, GuXianLu_FlagVar, GuXianLu_Today())
	-- 先进副本，再在玩家脚下刷第 1 层
	pcall(API_ActorGoToMap, ActorID, ObjectMapID, GuXianLu_SpawnX, GuXianLu_SpawnY)
	GuXianLu_Run[ActorID].Fast = GuXianLu_SpawnLayer(ActorID, ObjectMapID, 1)
	pcall(API_CreateTimerTriggerG, ObjectMapID, ActorID, 3, 1, 'GuXianLu_Poll')
	API_Trace('GuXianLu 开始 ActorID='..tostring(ActorID)..' 副本地图='..tostring(ObjectMapID)..' 怪='..tostring(GuXianLu_Run[ActorID].Fast))
	API_ResponseWrite('<br><text size="14" color="0,255,0">已进入古仙路第 1 层，击杀幻影可获得 1 个「古仙令」！</text><br><br><a>关闭</a>')
end

-- 定时检查：玩家离开副本就结束
function GuXianLu_Poll(a, ActorID)
	local r = GuXianLu_Run[ActorID]
	if r == nil then
		return
	end
	local ok, MapID = pcall(API_GetActorMapID, ActorID)
	if ok and MapID ~= r.Map then
		GuXianLu_End(ActorID)
		return
	end
	pcall(API_CreateTimerTriggerG, r.Map, ActorID, 3, 1, 'GuXianLu_Poll')
end

function GuXianLu_End(ActorID)
	local r = GuXianLu_Run[ActorID]
	GuXianLu_Run[ActorID] = nil
	if r == nil then
		return
	end
	if r.Fast ~= nil and r.Fast ~= 0 and r.Fast > 0 then
		pcall(API_DestroyMonster, r.Fast)
	end
	pcall(API_DestroyEctype, r.Map)
	pcall(API_ActorSendMsg, ActorID, 2, '古仙路挑战结束（到第 '..tostring(r.Layer)..' 层）。')
	API_Trace('GuXianLu 结束 ActorID='..tostring(ActorID)..' 层='..tostring(r.Layer))
end

function GuXianLu_DieFunc(keyID, b, Type, DieID, KillType, KillerID, MonsterID, MapID, PosX, PosY, GuiShuXing, GuiShuID)
	local ActorID = keyID
	local r = GuXianLu_Run[ActorID]
	if r == nil then
		return
	end
	if MonsterID == nil or MonsterID < GuXianLu_BossFirst or MonsterID > GuXianLu_BossFirst + GuXianLu_LayerMax - 1 then
		return
	end
	local Layer = MonsterID - GuXianLu_BossFirst + 1
	-- 发 N 个古仙令（邮件）
	pcall(API_SendActorMail, ActorID, GuXianLu_Goods, Layer, '[古仙路]第'..Layer..'层奖励', '恭喜通过古仙路第 '..Layer..' 层，获得 '..Layer..' 个「古仙令」！')
	pcall(API_ActorSendMsg, ActorID, 2, '通过第 '..Layer..' 层，获得 '..Layer..' 个「古仙令」（邮件发放）。')
	if Layer >= GuXianLu_LayerMax then
		pcall(API_ActorSendMsg, ActorID, 2, '恭喜！你已打穿古仙路 100 层！')
		GuXianLu_End(ActorID)
		return
	end
	r.Layer = Layer + 1
	r.Fast = GuXianLu_SpawnLayer(ActorID, r.Map, r.Layer)
end
