----------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\DuShen.lua
--描  述:	我是赌神（挂在「便捷功能」卷轴）：每次下注 100 万金币，按概率出奖，二次确认后扣钱
--修 改:	2026-09-26 新建
----------------------------------------------------------------------------------------------------

DuShen_Cost = 1000000          -- 每次下注金币
DuShen_MoneyProp = 156         -- 金币属性号（API_ActorGetPropNum）

-- 概率表（千分制，合计 1000）
DuShen_Rewards = {
	{Min = 1,   Max = 100,  Type = 'item',  GoodsID = 989, Num = 1,       Name = '岛猪的蛋 ×1',  Rate = '10%'},
	{Min = 101, Max = 200,  Type = 'item',  GoodsID = 988, Num = 1,       Name = '神龙的蛋 ×1',  Rate = '10%'},
	{Min = 201, Max = 300,  Type = 'money', Money = 2000000,             Name = '200万金币（翻倍）', Rate = '10%'},
	{Min = 301, Max = 500,  Type = 'money', Money = 1000000,             Name = '100万金币（保本）', Rate = '20%'},
	{Min = 501, Max = 700,  Type = 'money', Money = 500000,              Name = '50万金币（亏一半）', Rate = '20%'},
	{Min = 701, Max = 1000, Type = 'none',                                Name = '什么都没有',   Rate = '30%'},
}

function DuShen_RateText()
	local s = ''
	for i = 1, table.getn(DuShen_Rewards) do
		local e = DuShen_Rewards[i]
		s = s..'<text size="14">　· '..e.Name..'　——　</text><text size="14" color="255,128,0">'..e.Rate..'</text><br>'
	end
	return s
end

function DuShen_Money(ActorID)
	local ok, m = pcall(API_ActorGetPropNum, ActorID, DuShen_MoneyProp)
	if ok and m ~= nil then
		return m
	end
	return 0
end

-- 首页：规则 + 概率 + 下注入口
function DuShen_Title()
	API_ResponseWrite('<name>我是赌神</name>')
	API_ResponseWrite('<win rect="80,330,830,320"></win>')
	API_ResponseWrite('<br><text size="14">每次下注 </text><text size="14" color="255,255,0">100万金币</text><text size="14">，押中即得：</text><br>')
	API_ResponseWrite(DuShen_RateText())
	API_ResponseWrite('<br><a href="DuShen_Confirm?1=1">　我要赌一把（下注100万金币）</a><br>')
	API_ResponseWrite('<a href="SpringFestival_JuanZhou">返回</a> <a>关闭</a>')
end

-- 二次确认
function DuShen_Confirm()
	local ActorID = API_RequestGetActorID()
	local Money = DuShen_Money(ActorID)
	API_ResponseWrite('<name>我是赌神</name>')
	if Money < DuShen_Cost then
		API_ResponseWrite('<br><text size="14" color="255,0,0">金币不足！需要 100万，你当前只有 '..Money..' 金币。</text><br>')
		API_ResponseWrite('<br><a href="DuShen_Title">返回</a> <a>关闭</a>')
		return
	end
	API_ResponseWrite('<br><text size="14">确定要下注 </text><text size="14" color="255,255,0">100万金币</text><text size="14"> 吗？（你当前有 '..Money..' 金币）</text><br><br>')
	API_ResponseWrite('<a href="DuShen_Go?1=1">　确定下注</a><br><br>')
	API_ResponseWrite('<a href="DuShen_Title">　再想想</a>')
end

-- 开赌
function DuShen_Go()
	local ActorID = API_RequestGetActorID()
	local Money = DuShen_Money(ActorID)
	API_ResponseWrite('<name>我是赌神</name>')
	if Money < DuShen_Cost then
		API_ResponseWrite('<br><text size="14" color="255,0,0">金币不足！需要 100万，你当前只有 '..Money..' 金币。</text><br>')
		API_ResponseWrite('<br><a href="DuShen_Title">返回</a> <a>关闭</a>')
		return
	end
	API_ActorAddMoney(ActorID, -DuShen_Cost, 0, '我是赌神下注')

	local r = math.random(1000)
	local got = DuShen_Rewards[table.getn(DuShen_Rewards)]
	for i = 1, table.getn(DuShen_Rewards) do
		local e = DuShen_Rewards[i]
		if r >= e.Min and r <= e.Max then
			got = e
			break
		end
	end

	local say = ''
	if got.Type == 'item' then
		API_SendActorMail(ActorID, got.GoodsID, got.Num, '[我是赌神]中奖', '恭喜你押中 '..got.Name..'，请查收附件！')
		say = '<text size="14" color="0,255,0">恭喜！押中 '..got.Name..'，已通过邮件发放，请查收邮箱。</text>'
	elseif got.Type == 'money' then
		API_ActorAddMoney(ActorID, got.Money, 0, '我是赌神中奖')
		say = '<text size="14" color="0,255,0">恭喜！押中 '..got.Name..'，已直接到账。</text>'
	else
		say = '<text size="14" color="255,0,0">很遗憾，什么都没中，下次再来！</text>'
	end

	API_ResponseWrite('<br>'..say..'<br>')
	API_ResponseWrite('<text size="14">剩余金币：</text><text size="14" color="255,255,0">'..DuShen_Money(ActorID)..'</text><br><br>')
	API_ResponseWrite('<text size="14">【概率一览】</text><br>')
	API_ResponseWrite(DuShen_RateText())
	API_ResponseWrite('<br><a href="DuShen_Confirm?1=1">　再来一把（100万）</a><br>')
	API_ResponseWrite('<a href="DuShen_Title">返回</a> <a>关闭</a>')
end
