----------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\BossLunHuan.lua
--描  述:	八门 / 五行 / 冰雪寒宫  BOSS 「整点·半点」轮换
--		规则：每 30 分钟一档（对齐 :00 和 :30）；当前档只有对应那一只 BOSS 存在，其它地图的 BOSS 会被清掉；
--		      同一档里 BOSS 被打死不会立刻重刷，换档才换下一只；一圈走完自动从头循环。
--		地图是动态副本(进去才生成实例) —— 所以脚本每 20 秒巡查一次，谁进去了就补刷该档的 BOSS。
--修 改:	2026-09-24 新建
----------------------------------------------------------------------------------------------------

BossLunHuan_SlotSec  = 1800     --一档多少秒（1800 = 30 分钟，正好对齐整点/半点）
BossLunHuan_CheckSec = 20       --巡查间隔（秒）
BossLunHuan_VarSlot  = 1        --地图变量1：当前刷的是哪一只 BOSS（0 = 没刷）
BossLunHuan_VarFid   = 2        --地图变量2：BOSS 的 FastID

--★轮换表★（Group 相同的按下面的顺序轮流；X,Y = 刷怪点）
BossLunHuan_Table = {
	--====== 八门（8 只 → 4 小时一圈）======
	{Group='八门', Name='休-门', MapID=139, X=124, Y=125, Boss=943066},	--卡迪加(休-门守护)
	{Group='八门', Name='生-门', MapID=140, X=48,  Y=62,  Boss=943067},	--乌坦斯(生-门守护)
	{Group='八门', Name='伤-门', MapID=141, X=57,  Y=68,  Boss=943068},	--变异熊兽(伤-门守护)
	{Group='八门', Name='杜-门', MapID=142, X=63,  Y=62,  Boss=943069},	--斯兰克(杜-门守护)
	{Group='八门', Name='景-门', MapID=143, X=57,  Y=71,  Boss=943070},	--蒙里多(景-门守护)
	{Group='八门', Name='死-门', MapID=144, X=68,  Y=70,  Boss=943071},	--嗜血屠夫(死-门守护)
	{Group='八门', Name='惊-门', MapID=145, X=45,  Y=69,  Boss=943072},	--熔岩巨兽(惊-门守护)
	{Group='八门', Name='开-门', MapID=146, X=66,  Y=64,  Boss=943073},	--死神魅影(开-门守护)

	--====== 五行（5 只 → 2.5 小时一圈）======
	{Group='五行', Name='金相', MapID=4, X=123, Y=125, Boss=943074},	--金守护
	{Group='五行', Name='木相', MapID=5, X=46,  Y=62,  Boss=943075},	--木守护
	{Group='五行', Name='水相', MapID=6, X=57,  Y=66,  Boss=943076},	--水守护
	{Group='五行', Name='火相', MapID=7, X=62,  Y=61,  Boss=943077},	--火守护
	{Group='五行', Name='土相', MapID=8, X=57,  Y=70,  Boss=943078},	--土守护

	--====== 冰雪（6 只 → 一层一张图）======
	{Group='冰雪', Name='冰雪1层', MapID=12, X=68, Y=75, Boss=943079},	--冰雪美人1层
	{Group='冰雪', Name='冰雪2层', MapID=13, X=67, Y=75, Boss=943080},	--冰雪美人2层
	{Group='冰雪', Name='冰雪3层', MapID=14, X=67, Y=92, Boss=943081},	--冰雪美人3层
	{Group='冰雪', Name='冰雪4层', MapID=15, X=64, Y=94, Boss=943082},	--冰雪美人4层
	{Group='冰雪', Name='冰雪5层', MapID=16, X=60, Y=64, Boss=943083},	--冰雪美人5层
	{Group='冰雪', Name='奇迹之岛', MapID=126, X=302, Y=408, Boss=943084},	--冰雪美人真身
}

--BOSS 死亡回调：走统一的掉落流程（原版 BossJia/Shouhu 都是这么挂的）
function BossLunHuan_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
end

--把表里用到的地图去重
function BossLunHuan_InitMapList()
	if BossLunHuan_MapList ~= nil then
		return
	end
	BossLunHuan_MapList = {}
	for i = 1, table.getn(BossLunHuan_Table) do
		local mid = BossLunHuan_Table[i].MapID
		local found = 0
		for j = 1, table.getn(BossLunHuan_MapList) do
			if BossLunHuan_MapList[j] == mid then
				found = 1
			end
		end
		if found == 0 then
			table.insert(BossLunHuan_MapList, mid)
		end
	end
end

--算出当前档：返回 mapID -> 该地图应当存在的条目
function BossLunHuan_WantTable()
	local groups = {}
	local gorder = {}
	for i = 1, table.getn(BossLunHuan_Table) do
		local e = BossLunHuan_Table[i]
		if groups[e.Group] == nil then
			groups[e.Group] = {}
			table.insert(gorder, e.Group)
		end
		table.insert(groups[e.Group], e)
	end
	local slot = math.floor(os.time() / BossLunHuan_SlotSec)
	local want = {}
	for i = 1, table.getn(gorder) do
		local list = groups[gorder[i]]
		local idx = math.mod(slot, table.getn(list)) + 1
		local e = list[idx]
		want[e.MapID] = e
	end
	return want
end

--清掉地图里我们自己刷的 BOSS
function BossLunHuan_ClearOne(MapID, fid)
	if fid ~= nil and fid > 0 then
		if API_GetMonsterID(fid) > 0 then
			API_DestroyMonster(fid)
		end
	end
	API_SetMapVarData(MapID, BossLunHuan_VarFid, 0)
	API_SetMapVarData(MapID, BossLunHuan_VarSlot, 0)
end

--巡查
function BossLunHuan_Tick(a, b)
	BossLunHuan_InitMapList()
	local want = BossLunHuan_WantTable()
	local slotNow = math.floor(os.time() / BossLunHuan_SlotSec)

	for i = 1, table.getn(BossLunHuan_MapList) do
		local Mid = BossLunHuan_MapList[i]
		local MapID = API_GetRightMapID(Mid)
		if MapID ~= nil and MapID > 0 and API_MapIsValid(MapID) then
			local e = want[Mid]
			local fid = API_GetMapVarData(MapID, BossLunHuan_VarFid)
			local saved = API_GetMapVarData(MapID, BossLunHuan_VarSlot)

			if e == nil then
				--这一档不该有 BOSS：清掉
				if fid ~= nil and (fid > 0 or saved ~= 0) then
					BossLunHuan_ClearOne(MapID, fid)
				end
			else
				local cur = 0
				if fid ~= nil and fid > 0 then
					cur = API_GetMonsterID(fid)
				end
				if saved ~= e.Boss then
					--换档了（或者第一次进）：换怪
					if cur > 0 then
						API_DestroyMonster(fid)
					end
					local nf = API_CreateMonster(MapID, e.Boss, e.X, e.Y, 4, 0, -1)
					if nf ~= nil and nf > 0 then
						API_SetMapVarData(MapID, BossLunHuan_VarFid, nf)
						API_SetMapVarData(MapID, BossLunHuan_VarSlot, e.Boss)
						API_CreateDieTriggerG(Mid, 0, 0, nf, 'BossLunHuan_DieFunc')
						if BossLunHuan_LastAD ~= slotNow then
							BossLunHuan_LastAD = slotNow
							local msg = '[BOSS轮换] '..e.Name..' 的 '..API_GetMonsterNameByID(e.Boss)..' 已经出现，勇士们快去挑战！'
							API_ActorBroadcastMsgEx(-1, -1, 0, 1, msg)
							API_ActorBroadcastMsgEx(-1, -1, 0, 7, msg)
							API_ActorBroadcastMsgEx(-1, -1, 0, 17, msg)
						end
					end
				end
			end
		end
	end
end

--注册全局定时器（每 20 秒巡查一次）
if BossLunHuan_TimerID == nil then
	BossLunHuan_TimerID = API_CreateTimerTriggerG(0, 0, BossLunHuan_CheckSec, -1, 'BossLunHuan_Tick')
end
