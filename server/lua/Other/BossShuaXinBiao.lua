----------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\BossShuaXinBiao.lua
--描  述:	BOSS 刷新表（便捷功能卷轴）
--		  4 页：①轮换·八门 ②轮换·五行+冰雪 ③每日+每小时 ④世界+随机地穴
--		  ★ 控制在客户端渲染上限内（原 19 条挤 1 页超限，≤25 级会打不开）——去掉 size 标签、精简每行
--修 改:	2026-09-28 拆分/精简，修复 ≤25 级点不开
----------------------------------------------------------------------------------------------------

BossShuaXinBiao_LvMaxBingXue = 25
BossShuaXinBiao_LvMaxTaFu    = 25
BossShuaXinBiao_CDSec        = 300
BossShuaXinBiao_PageMax      = 5
BossShuaXinBiao_VER          = '2026-09-28-split5p'   -- 版本标记

function BossShuaXinBiao_Fmt(s)
	if s == nil or s < 0 then s = 0 end
	local d = math.floor(s / 86400)
	local h = math.floor(math.mod(s, 86400) / 3600)
	local m = math.floor(math.mod(s, 3600) / 60)
	local r = math.mod(s, 60)
	if d > 0 then return d..'天'..h..'小时'
	elseif h > 0 then return h..'小时'..m..'分'
	elseif m > 0 then return m..'分'..r..'秒'
	else return r..'秒' end
end

function BossShuaXinBiao_GameTime()
	local Y, Mo, D, H, Mi, S = PublicFun_time()
	return string.format('%04d-%02d-%02d %02d:%02d:%02d', Y, Mo, D, H, Mi, S)
end

function BossShuaXinBiao_GameSecOfDay()
	local _, _, _, H, Mi, S = PublicFun_time()
	return H * 3600 + Mi * 60 + S
end

function BossShuaXinBiao_ServerClock()
	local t = os.date('*t', os.time())
	return string.format('%02d:%02d:%02d', t.hour, t.min, t.sec)
end

function BossShuaXinBiao_NextDaily(hh, mm)
	local diff = (hh * 3600 + mm * 60) - BossShuaXinBiao_GameSecOfDay()
	if diff <= 0 then diff = diff + 86400 end
	return diff
end

function BossShuaXinBiao_IsBingXue(mid)
	return mid >= 943079 and mid <= 943084
end

function BossShuaXinBiao_IsTaFu(mid)
	return mid == 850040 or mid == 850005 or mid == 850019
end

function BossShuaXinBiao_CanShow(mid, Lv)
	if BossShuaXinBiao_IsBingXue(mid) and Lv > BossShuaXinBiao_LvMaxBingXue then return false end
	if BossShuaXinBiao_IsTaFu(mid) and Lv > BossShuaXinBiao_LvMaxTaFu then return false end
	return true
end

function BossShuaXinBiao_MonName(mid)
	local ok, nm = pcall(API_GetMonsterNameByID, mid)
	if ok and nm ~= nil then return tostring(nm) end
	return '怪物'..tostring(mid)
end

BossShuaXinBiao_Tp = {
	[943066] = {Map=139, X=124, Y=125},
	[943067] = {Map=140, X=48,  Y=62},
	[943068] = {Map=141, X=57,  Y=68},
	[943069] = {Map=142, X=63,  Y=62},
	[943070] = {Map=143, X=57,  Y=71},
	[943071] = {Map=144, X=68,  Y=70},
	[943072] = {Map=145, X=45,  Y=69},
	[943073] = {Map=146, X=66,  Y=64},
	[943074] = {Map=4,   X=123, Y=125},
	[943075] = {Map=5,   X=46,  Y=62},
	[943076] = {Map=6,   X=57,  Y=66},
	[943077] = {Map=7,   X=62,  Y=61},
	[943078] = {Map=8,   X=57,  Y=70},
	[943079] = {Map=12,  X=68,  Y=75},
	[943080] = {Map=13,  X=67,  Y=75},
	[943081] = {Map=14,  X=67,  Y=92},
	[943082] = {Map=15,  X=64,  Y=94},
	[943083] = {Map=16,  X=60,  Y=64},
	[943084] = {Map=126, X=302, Y=408},
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
	[823084] = {Map=137, X=128, Y=172},
	[823082] = {Map=137, X=128, Y=167},
	[823083] = {Map=137, X=135, Y=166},
	[823085] = {Map=107, X=119, Y=260},
	[823081] = {Map=11,  X=60,  Y=73},
	[12416] = {Map=101, X=451, Y=445},
	[12417] = {Map=102, X=578, Y=559},
	[12418] = {Map=111, X=423, Y=356},
}

BossShuaXinBiao_CD = {}

function BossShuaXinBiao_Pos(MonID)
	local tp = BossShuaXinBiao_Tp[MonID]
	if tp == nil then return '（随机）' end
	return '（'..tp.Map..'图'..tp.X..','..tp.Y..'）'
end

function BossShuaXinBiao_Link(MonID)
	if BossShuaXinBiao_Tp[MonID] == nil then return '' end
	return '<a href="BossShuaXinBiao_Go?1='..MonID..'">传</a>'
end

BossShuaXinBiao_Daily = {
	{Name = '空间主宰曼德拉（空间领主）', Times = {{19,00}}, Mon = {850029}},
	{Name = '雪岭巨兽卡罗斯',             Times = {{19,00}}, Mon = {850031}},
	{Name = '年兽王',                     Times = {{19,00}}, Mon = {730603}},
	{Name = '天空城变异凶兽',             Times = {{20,30}}, Mon = {944065}},
	{Name = '三巨头（英雄BOSS）',           Times = {{0,00},{13,00},{20,00}}, Mon = {823084,823082,823083}},
	{Name = '死神（镜月3）',                 Times = {{21,00}}, Mon = {823085}},
	{Name = '岛主的化身（五行空间）',         Times = {{23,05}}, Mon = {823081}},
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

-- 轮换分组（供页1/页2用）
BossShuaXinBiao_GroupNames = {'八门','五行','冰雪'}

function BossShuaXinBiao_WriteRotate(W, gname, Lv)
	if BossLunHuan_Table == nil or BossLunHuan_SlotSec == nil or BossLunHuan_SlotSec <= 0 then
		W('<br>（轮换脚本未加载）')
		return
	end
	local nowT = os.time()
	local slot = math.floor(nowT / BossLunHuan_SlotSec)
	local slotSec = BossLunHuan_SlotSec
	local remainSec = slotSec - math.mod(nowT, slotSec)
	local list = {}
	for i = 1, table.getn(BossLunHuan_Table) do
		if BossLunHuan_Table[i].Group == gname then
			table.insert(list, BossLunHuan_Table[i])
		end
	end
	if table.getn(list) == 0 then return end
	local n = table.getn(list)
	local curIdx = math.mod(slot, n) + 1
	if not BossShuaXinBiao_CanShow(list[1].Boss, Lv) then return end
	W('<br><text color="255,255,0">'..gname..'</text>（每'..(slotSec/60)..'分钟一只）')
	for k = 1, n do
		local e = list[k]
		local off = math.mod(k - curIdx, n)
		local waitSec = 0
		if off > 0 then waitSec = remainSec + (off - 1) * slotSec end
		local cd
		if waitSec <= 0 then cd = '已刷新' else cd = '剩余'..BossShuaXinBiao_Fmt(waitSec) end
		W('<br>·'..BossShuaXinBiao_MonName(e.Boss)..'（'..e.Name..'）'..BossShuaXinBiao_Pos(e.Boss)..' <text color="0,255,0">'..cd..'</text>'..BossShuaXinBiao_Link(e.Boss))
	end
end

function BossShuaXinBiao_Build(page)
	if page == nil or page < 1 or page > BossShuaXinBiao_PageMax then page = 1 end
	local ActorID = API_RequestGetActorID()
	local Lv = API_GetActorExpLevel(ActorID)

	local L = {}
	local function W(s) table.insert(L, s) end

	W('<name>BOSS刷新表</name>')
	W('<win rect="80,200,830,420"></win>')
	W('<br>游戏时间：<text color="255,255,0">'..BossShuaXinBiao_GameTime()..'</text><text color="200,200,200">（轮换按服务器时间 '..BossShuaXinBiao_ServerClock()..'）</text>')
	W('<br>你的等级：<text color="0,255,255">'..Lv..'</text>　第 <text color="255,128,0">'..page..'</text> / '..BossShuaXinBiao_PageMax..' 页')

	if page == 1 then
		W('<br><br><text color="255,128,0">【轮换BOSS·八门】每30分钟一只</text>')
		BossShuaXinBiao_WriteRotate(W, '八门', Lv)
	elseif page == 2 then
		W('<br><br><text color="255,128,0">【轮换BOSS·五行】每30分钟一只</text>')
		BossShuaXinBiao_WriteRotate(W, '五行', Lv)
	elseif page == 3 then
		W('<br><br><text color="255,128,0">【轮换BOSS·冰雪】每30分钟一只</text>')
		BossShuaXinBiao_WriteRotate(W, '冰雪', Lv)
	elseif page == 4 then
		W('<br><br><text color="255,128,0">【每日固定刷新】到点必刷</text>')
		for i = 1, table.getn(BossShuaXinBiao_Daily) do
			local d = BossShuaXinBiao_Daily[i]
			if BossShuaXinBiao_CanShow(d.Mon[1], Lv) then
				local best, bestTime, timeTxt = nil, '', ''
				for j = 1, table.getn(d.Times) do
					local sec = BossShuaXinBiao_NextDaily(d.Times[j][1], d.Times[j][2])
					local tt = string.format('%02d:%02d', d.Times[j][1], d.Times[j][2])
					if timeTxt ~= '' then timeTxt = timeTxt..'/' end
					timeTxt = timeTxt..tt
					if best == nil or sec < best then best = sec; bestTime = tt end
				end
				W('<br>·'..d.Name..'（'..table.getn(d.Mon)..'只）'..timeTxt..' <text color="0,255,0">下次 '..bestTime..' 剩余'..BossShuaXinBiao_Fmt(best)..'</text>')
				for j = 1, table.getn(d.Mon) do
					local mid = d.Mon[j]
					if BossShuaXinBiao_CanShow(mid, Lv) then
						W('<br>　'..BossShuaXinBiao_MonName(mid)..BossShuaXinBiao_Pos(mid)..BossShuaXinBiao_Link(mid))
					end
				end
			end
		end
		local hourLeft = 3600 - math.mod(BossShuaXinBiao_GameSecOfDay(), 3600)
		W('<br><br><text color="255,128,0">【每小时整点】</text>')
		W('<br>·宝箱争夺（3只）每小时整点 <text color="0,255,0">剩余'..BossShuaXinBiao_Fmt(hourLeft)..'</text>')
		local boxs = {12416,12417,12418}
		for i = 1, table.getn(boxs) do
			W('<br>　'..BossShuaXinBiao_MonName(boxs[i])..BossShuaXinBiao_Pos(boxs[i])..BossShuaXinBiao_Link(boxs[i]))
		end
	else
		W('<br><br><text color="255,128,0">【世界BOSS】被击杀后按固定时长重刷</text>')
		for i = 1, table.getn(BossShuaXinBiao_World) do
			local kk = BossShuaXinBiao_World[i]
			for j = 1, table.getn(kk.Mon) do
				local mid = kk.Mon[j]
				if BossShuaXinBiao_CanShow(mid, Lv) then
					W('<br>·'..BossShuaXinBiao_MonName(mid)..'（'..kk.Name..'）'..BossShuaXinBiao_Pos(mid)..' <text color="255,0,255">'..kk.Rule..'</text>'..BossShuaXinBiao_Link(mid))
				end
			end
		end
		W('<br><br><text color="255,128,0">【随机地穴】地图随机出现"门"，需组队进入</text>')
		for i = 1, table.getn(BossShuaXinBiao_Cave) do
			local c = BossShuaXinBiao_Cave[i]
			if c.LvMax == nil or Lv <= c.LvMax then
				W('<br>·'..BossShuaXinBiao_MonName(c.Boss)..'（'..c.Name..'）'..c.Where..'<text color="255,0,255"> '..c.Rule..'</text>'..BossShuaXinBiao_Link(c.Boss))
			end
		end
	end

	W('<br><br><text color="200,200,200">（同只BOSS 5 分钟内只能传送一次；倒计时点【刷新】更新）</text><br>')
	W('<a href="BossShuaXinBiao_Show?1=1">①八门</a><a href="BossShuaXinBiao_Show?1=2">②五行</a><a href="BossShuaXinBiao_Show?1=3">③冰雪</a><a href="BossShuaXinBiao_Show?1=4">④每日</a><a href="BossShuaXinBiao_Show?1=5">⑤世界地穴</a>')
	W('<a href="BossShuaXinBiao_Show?1='..page..'">刷新</a> <a href="SpringFestival_JuanZhou">返回</a> <a>关闭</a>')

	local out = table.concat(L)
	API_Trace('BossShuaXinBiao 组装 page='..page..' len='..string.len(out))
	return out
end

function BossShuaXinBiao_Show()
	API_Trace('BossShuaXinBiao_Show 进入 VER='..tostring(BossShuaXinBiao_VER))
	local page = API_RequestGetNumber(1)
	local ok, res = pcall(BossShuaXinBiao_Build, page)
	if ok then
		API_ResponseWrite(res)
	else
		API_Trace('BossShuaXinBiao_Show 出错: '..tostring(res))
		API_ResponseWrite('<name>BOSS刷新表</name>生成出错，请联系管理员<br><a>关闭</a>')
	end
end

function BossShuaXinBiao_Go()
	local ActorID = API_RequestGetActorID()
	local MonID = API_RequestGetNumber(1)
	local Lv = API_GetActorExpLevel(ActorID)
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
	if BossShuaXinBiao_CD[ActorID] == nil then BossShuaXinBiao_CD[ActorID] = {} end
	local last = BossShuaXinBiao_CD[ActorID][MonID] or 0
	if now - last < BossShuaXinBiao_CDSec then
		API_ActorSendMsg(ActorID, 2, '传送冷却中，还需等待 '..BossShuaXinBiao_Fmt(BossShuaXinBiao_CDSec - (now - last)))
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

function GmZhuShouDaShiDianJi()
	BossShuaXinBiao_Show()
end
