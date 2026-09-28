-- [sync-test] 2026-09-28 A→B 自动同步链路验证（纯注释，可删）
----------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\BossShuaXinBiao.lua
--描  述:	BOSS 刷新表（便捷功能卷轴 / 客户端GM助手按钮 GmZhuShouDaShiDianJi）
--		  顶部显示"游戏当前时间"（PublicFun_time），每只 BOSS 都有倒计时 + 坐标 + 点击传送（同只 5 分钟 CD）
--		  分 3 页（内容太长客户端会渲染不出）：①轮换类 ②每日固定 ③世界BOSS+随机地穴
--		  塔夫（地穴 850040）只对 <=25 级显示；冰雪类（943079~943084）只对 <=25 级显示
--修 改:	2026-09-26 新建 / 2026-09-27 补全官方BOSS + 游戏时间 + 倒计时 + 分页
----------------------------------------------------------------------------------------------------

BossShuaXinBiao_LvMaxBingXue = 25      --冰雪类只对 <=25 级显示
BossShuaXinBiao_LvMaxTaFu    = 25      --塔夫只对 <=25 级显示
BossShuaXinBiao_CDSec        = 300     --同一只BOSS传送冷却（秒）
BossShuaXinBiao_PageMax      = 3

--================================ 工具函数 ================================

function BossShuaXinBiao_Fmt(s)
	if s == nil or s < 0 then s = 0 end
	local d = math.floor(s / 86400)
	local h = math.floor(math.mod(s, 86400) / 3600)
	local m = math.floor(math.mod(s, 3600) / 60)
	local r = math.mod(s, 60)
	if d > 0 then
		return d..'天'..h..'小时'
	elseif h > 0 then
		return h..'小时'..m..'分'
	elseif m > 0 then
		return m..'分'..r..'秒'
	else
		return r..'秒'
	end
end

function BossShuaXinBiao_GameTime()
	local Y, Mo, D, H, Mi, S = PublicFun_time()
	return string.format('%04d-%02d-%02d %02d:%02d:%02d', Y, Mo, D, H, Mi, S)
end

function BossShuaXinBiao_GameSecOfDay()
	local _, _, _, H, Mi, S = PublicFun_time()
	return H * 3600 + Mi * 60 + S
end

--记录 游戏时钟 与 服务器时钟 的偏移（秒），写日志备查
function BossShuaXinBiao_RecordOffset()
	local _, _, _, H, Mi, S = PublicFun_time()
	local gameDoD = H * 3600 + Mi * 60 + S
	local o = os.date('*t', os.time())
	local osDoD = o.hour * 3600 + o.min * 60 + o.sec
	local off = gameDoD - osDoD
	if off > 43200 then off = off - 86400 elseif off < -43200 then off = off + 86400 end
	BossShuaXinBiao_TimeOffset = off
	API_Trace('BossShuaXinBiao 游戏时间='..BossShuaXinBiao_GameTime()..' 游戏/服务器时差(秒)='..tostring(off))
	return off
end

function BossShuaXinBiao_NextDaily(hh, mm)
	local nowSec = BossShuaXinBiao_GameSecOfDay()
	local tarSec = hh * 3600 + mm * 60
	local diff = tarSec - nowSec
	if diff <= 0 then
		diff = diff + 86400
	end
	return diff
end

function BossShuaXinBiao_IsBingXue(mid)
	return mid == 943079 or mid == 943080 or mid == 943081 or mid == 943082 or mid == 943083 or mid == 943084
end

function BossShuaXinBiao_IsTaFu(mid)
	return mid == 850040 or mid == 850005 or mid == 850019
end

function BossShuaXinBiao_CanShow(mid, Lv)
	if BossShuaXinBiao_IsBingXue(mid) and Lv > BossShuaXinBiao_LvMaxBingXue then
		return false
	end
	if BossShuaXinBiao_IsTaFu(mid) and Lv > BossShuaXinBiao_LvMaxTaFu then
		return false
	end
	return true
end

function BossShuaXinBiao_MonName(mid)
	local ok, nm = pcall(API_GetMonsterNameByID, mid)
	if ok and nm ~= nil then
		return tostring(nm)
	end
	return '怪物'..tostring(mid)
end

--================================ 传送坐标（Map=静态地图号）================================
BossShuaXinBiao_Tp = {
	--轮换：八门
	[943066] = {Map=139, X=124, Y=125},
	[943067] = {Map=140, X=48,  Y=62},
	[943068] = {Map=141, X=57,  Y=68},
	[943069] = {Map=142, X=63,  Y=62},
	[943070] = {Map=143, X=57,  Y=71},
	[943071] = {Map=144, X=68,  Y=70},
	[943072] = {Map=145, X=45,  Y=69},
	[943073] = {Map=146, X=66,  Y=64},
	--轮换：五行
	[943074] = {Map=4,   X=123, Y=125},
	[943075] = {Map=5,   X=46,  Y=62},
	[943076] = {Map=6,   X=57,  Y=66},
	[943077] = {Map=7,   X=62,  Y=61},
	[943078] = {Map=8,   X=57,  Y=70},
	--轮换：冰雪
	[943079] = {Map=12,  X=68,  Y=75},
	[943080] = {Map=13,  X=67,  Y=75},
	[943081] = {Map=14,  X=67,  Y=92},
	[943082] = {Map=15,  X=64,  Y=94},
	[943083] = {Map=16,  X=60,  Y=64},
	[943084] = {Map=126, X=302, Y=408},
	--每日固定 / 世界BOSS
	[944065] = {Map=130, X=352, Y=525},
	[850029] = {Map=102, X=658, Y=534},
	[850031] = {Map=107, X=109, Y=276},
	[730603] = {Map=101, X=455, Y=448},
	[850020] = {Map=102, X=657, Y=532},
	[850023] = {Map=111, X=640, Y=311},
	[850022] = {Map=107, X=121, Y=260},
	[948051] = {Map=136, X=227, Y=221},
	[850021] = {Map=98,  X=177, Y=181},
	[850040] = {Map=10,  X=111, Y=283},
	[850042] = {Map=111, X=156, Y=450},
}

BossShuaXinBiao_CD = {}

function BossShuaXinBiao_Pos(MonID)
	local tp = BossShuaXinBiao_Tp[MonID]
	if tp == nil then
		return '（随机位置）'
	end
	return '（'..tp.Map..'图 '..tp.X..','..tp.Y..'）'
end

function BossShuaXinBiao_Link(MonID)
	if BossShuaXinBiao_Tp[MonID] == nil then
		return ''
	end
	return ' <a href="BossShuaXinBiao_Go?1='..MonID..'">传送</a>'
end

--================================ 数据表 ================================

BossShuaXinBiao_Daily = {
	{Name = '空间主宰曼德拉（空间领主）', Times = {{19,00}}, Mon = {850029}},
	{Name = '雪岭巨兽卡罗斯',             Times = {{19,00}}, Mon = {850031}},
	{Name = '年兽王',                     Times = {{19,00}}, Mon = {730603}},
	{Name = '八门守护',                   Times = {{20,00}}, Mon = {943066,943067,943068,943069,943070,943071,943072,943073}},
	{Name = '五行守护',                   Times = {{20,00}}, Mon = {943074,943075,943076,943077,943078}},
	{Name = '天空城变异凶兽',             Times = {{20,30}}, Mon = {944065}},
	{Name = '冰雪美人',                   Times = {{6,35},{22,35}}, Mon = {943079,943080,943081,943082,943083,943084}},
}

BossShuaXinBiao_World = {
	{Name = '沙暴绿洲 · 世界BOSS',            Rule = '被击杀后 4 小时重刷', Mon = {850020}},
	{Name = '光明遗迹 · 神龙安卡',            Rule = '被击杀后 4 小时重刷', Mon = {850023}},
	{Name = '镜月地下城一层 · 幻影领主美兰达', Rule = '被击杀后 4 小时重刷', Mon = {850022}},
	{Name = '镜月地下城二层 · 安卡拉',        Rule = '被击杀后 4 小时重刷', Mon = {948051}},
}

BossShuaXinBiao_Cave = {
	{Name = '塔夫地穴',     Boss = 850040, Where = '10图 / 23图 随机出现门', Rule = '开门后随机 6~10 小时再出现', LvMax = 25},
	{Name = '诅咒巨人之门', Boss = 850021, Where = '98 / 99 / 102图 随机出现门', Rule = '开门后随机 6~12 小时再出现'},
	{Name = '神龙安卡巢穴', Boss = 850042, Where = '111图 随机出现门', Rule = '开门后随机 10~16 小时再出现'},
}

--================================ 组装（分页）================================

function BossShuaXinBiao_Build(page)
	if page == nil or page < 1 or page > BossShuaXinBiao_PageMax then
		page = 1
	end
	local ActorID = API_RequestGetActorID()
	local Lv = API_GetActorExpLevel(ActorID)
	BossShuaXinBiao_RecordOffset()

	local L = {}
	local function W(s)
		table.insert(L, s)
	end
	local function CDText(sec)
		if sec == nil then
			return '未知'
		elseif sec <= 0 then
			return '已刷新'
		else
			return '还有 '..BossShuaXinBiao_Fmt(sec)
		end
	end

	W('<name>BOSS刷新表</name>')
	W('<win rect="80,200,830,420"></win>')
	W('<br><text size="14">游戏时间：</text><text size="14" color="255,255,0">'..BossShuaXinBiao_GameTime()..'</text>')
	W('<text size="14">　你的等级：</text><text size="14" color="0,255,255">'..Lv..'</text>')
	W('<text size="14">　第 </text><text size="14" color="255,128,0">'..page..'</text><text size="14"> / '..BossShuaXinBiao_PageMax..' 页</text>')

	if page == 1 then
		--============ ① 轮换类 ============
		if BossLunHuan_Table ~= nil and BossLunHuan_SlotSec ~= nil and BossLunHuan_SlotSec > 0 then
			local slot = math.floor(os.time() / BossLunHuan_SlotSec)
			local slotSec = BossLunHuan_SlotSec
			local groups, order = {}, {}
			for i = 1, table.getn(BossLunHuan_Table) do
				local e = BossLunHuan_Table[i]
				if groups[e.Group] == nil then
					groups[e.Group] = {}
					table.insert(order, e.Group)
				end
				table.insert(groups[e.Group], e)
			end
			W('<br><br><text size="14" color="255,128,0">【轮换类】每'..(slotSec / 60)..'分钟换一只，正在刷的显示"已刷新"</text>')
			for gi = 1, table.getn(order) do
				local g = order[gi]
				local list = groups[g]
				local n = table.getn(list)
				local curIdx = math.mod(slot, n) + 1
				if BossShuaXinBiao_CanShow(list[1].Boss, Lv) then
					W('<br><text size="14" color="255,255,0">'..g..'</text>')
					for k = 1, n do
						local e = list[k]
						local waitSec = math.mod(k - curIdx, n) * slotSec
						W('<br><text size="14">　· '..BossShuaXinBiao_MonName(e.Boss)..'（'..e.Name..'）'..BossShuaXinBiao_Pos(e.Boss)..' </text>'
							..'<text size="14" color="0,255,0">'..CDText(waitSec)..'</text>'..BossShuaXinBiao_Link(e.Boss))
					end
				end
			end
		else
			W('<br><br><text size="14">（轮换脚本未加载）</text>')
		end

	elseif page == 2 then
		--============ ② 每日固定 ============
		W('<br><br><text size="14" color="255,128,0">【每日固定刷新】到点必刷（按游戏时钟）</text>')
		for i = 1, table.getn(BossShuaXinBiao_Daily) do
			local d = BossShuaXinBiao_Daily[i]
			if BossShuaXinBiao_CanShow(d.Mon[1], Lv) then
				local best, bestTime, timeTxt = nil, '', ''
				for j = 1, table.getn(d.Times) do
					local sec = BossShuaXinBiao_NextDaily(d.Times[j][1], d.Times[j][2])
					local tt = string.format('%02d:%02d', d.Times[j][1], d.Times[j][2])
					if timeTxt ~= '' then
						timeTxt = timeTxt..' / '
					end
					timeTxt = timeTxt..tt
					if best == nil or sec < best then
						best = sec
						bestTime = tt
					end
				end
				W('<br><text size="14">　· '..d.Name..'（'..table.getn(d.Mon)..'只） 每天 '..timeTxt..' </text>'
					..'<text size="14" color="0,255,0">下次 '..bestTime..' 还有 '..BossShuaXinBiao_Fmt(best)..'</text>')
				for j = 1, table.getn(d.Mon) do
					local mid = d.Mon[j]
					if BossShuaXinBiao_CanShow(mid, Lv) then
						W('<br><text size="14">　　　'..BossShuaXinBiao_MonName(mid)..BossShuaXinBiao_Pos(mid)..'</text>'..BossShuaXinBiao_Link(mid))
					end
				end
			end
		end

	else
		--============ ③ 世界BOSS + 随机地穴 ============
		W('<br><br><text size="14" color="255,128,0">【世界BOSS】被击杀后按固定时长重刷</text>')
		for i = 1, table.getn(BossShuaXinBiao_World) do
			local kk = BossShuaXinBiao_World[i]
			for j = 1, table.getn(kk.Mon) do
				local mid = kk.Mon[j]
				if BossShuaXinBiao_CanShow(mid, Lv) then
					W('<br><text size="14">　· '..BossShuaXinBiao_MonName(mid)..'（'..kk.Name..'）'..BossShuaXinBiao_Pos(mid)..' </text>'
						..'<text size="14" color="255,0,255">'..kk.Rule..'</text>'..BossShuaXinBiao_Link(mid))
				end
			end
		end
		W('<br><br><text size="14" color="255,128,0">【随机地穴】地图随机出现"门"，需组队进入</text>')
		for i = 1, table.getn(BossShuaXinBiao_Cave) do
			local c = BossShuaXinBiao_Cave[i]
			if c.LvMax == nil or Lv <= c.LvMax then
				W('<br><text size="14">　· '..BossShuaXinBiao_MonName(c.Boss)..'（'..c.Name..'）</text>'
					..'<text size="14" color="200,200,200">'..c.Where..'</text>'
					..'<text size="14" color="255,0,255"> '..c.Rule..'</text>'..BossShuaXinBiao_Link(c.Boss))
			end
		end
	end

	W('<br><br><text size="14" color="200,200,200">（同一只BOSS '..(BossShuaXinBiao_CDSec / 60)..' 分钟内只能传送一次）</text><br>')
	W('<a href="BossShuaXinBiao_Show?1=1">①轮换</a> <text> </text>')
	W('<a href="BossShuaXinBiao_Show?1=2">②每日</a> <text> </text>')
	W('<a href="BossShuaXinBiao_Show?1=3">③世界/地穴</a> <text> </text>')
	W('<a href="BossShuaXinBiao_Show?1='..page..'">刷新</a> <text> </text>')
	W('<a href="SpringFestival_JuanZhou">返回</a> <text> </text>')
	W('<a>关闭</a>')

	local out = table.concat(L)
	API_Trace('BossShuaXinBiao 组装完成 page='..page..' len='..string.len(out))
	return out
end

function BossShuaXinBiao_Show()
	API_Trace('BossShuaXinBiao_Show 进入')
	local page = API_RequestGetNumber(1)
	local ok, res = pcall(BossShuaXinBiao_Build, page)
	if ok then
		API_ResponseWrite(res)
		API_Trace('BossShuaXinBiao_Show 写出完成')
	else
		API_Trace('BossShuaXinBiao_Show 出错: '..tostring(res))
		API_ResponseWrite('<name>BOSS刷新表</name><text size="14">刷新表生成出错，请联系管理员（详见服务端日志）</text><br><a>关闭</a>')
	end
end

function BossShuaXinBiao_Go()
	local ActorID = API_RequestGetActorID()
	local MonID = API_RequestGetNumber(1)
	local Lv = API_GetActorExpLevel(ActorID)
	API_Trace('BossShuaXinBiao_Go 进入 MonID='..tostring(MonID)..' Lv='..tostring(Lv))
	if not BossShuaXinBiao_CanShow(MonID, Lv) then
		API_ActorSendMsg(ActorID, 2, '该BOSS只对 '..BossShuaXinBiao_LvMaxBingXue..' 级及以下玩家开放')
		BossShuaXinBiao_Show()
		return
	end
	local tp = BossShuaXinBiao_Tp[MonID]
	if tp == nil then
		API_ActorSendMsg(ActorID, 2, '该BOSS暂无坐标，无法传送')
		BossShuaXinBiao_Show()
		return
	end
	local now = os.time()
	if BossShuaXinBiao_CD[ActorID] == nil then
		BossShuaXinBiao_CD[ActorID] = {}
	end
	local last = BossShuaXinBiao_CD[ActorID][MonID] or 0
	if now - last < BossShuaXinBiao_CDSec then
		local left = BossShuaXinBiao_CDSec - (now - last)
		API_ActorSendMsg(ActorID, 2, '传送冷却中，还需等待 '..BossShuaXinBiao_Fmt(left))
	else
		local MapID = API_GetRightMapID(tp.Map)
		if MapID ~= nil and API_MapIsValid(MapID) then
			BossShuaXinBiao_CD[ActorID][MonID] = now
			if API_IsEctypeServer() then
				API_ActorGoToMapEx(ActorID, 1, MapID, tp.X, tp.Y)
			else
				API_ActorGoToMap(ActorID, MapID, tp.X, tp.Y)
			end
			API_ActorSendMsg(ActorID, 2, '已传送至 '..BossShuaXinBiao_MonName(MonID))
		else
			API_ActorSendMsg(ActorID, 2, '该地图当前不可进入')
		end
	end
	BossShuaXinBiao_Show()
end

--兼容客户端（GM助手/工具）里那个按钮名
function GmZhuShouDaShiDianJi()
	API_Trace('GmZhuShouDaShiDianJi 进入 -> 打开 BOSS刷新表')
	BossShuaXinBiao_Show()
end
