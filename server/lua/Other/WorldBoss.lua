---------------------------------------------------------------------------------------------------------
--修 改 人：黄蕾
--修改时间：20120409
--修改内容：净月增加白熊BOSS,20:30刷新，刷新成功加状态2049001
---------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
--修改时间：20120423
--修 改 人：黄蕾
--修改内容：4月29日-5月6日机弩攻城活动地图ID：100，场景服是1，20点30
--          BOSSID：850031卡罗斯， 944065变异凶兽OK，850029空间领主，850023神龙安卡OK
--          伤害免疫效果2050001
-------------------------------------------------------------------------------------------------------------------------------------------------------

--~ 超能量护盾	822		
--~ 超能量护盾1级	822001	级吸收25%技能与普通攻击伤害	
--~ 超能量护盾2级	822002	级吸收50%技能与普通攻击伤害	
--~ 超能量护盾3级	822003	级吸收75%技能与普通攻击伤害	
--~ 超能量护盾4级	822004	级吸收所有技能与普通攻击伤害	
--~ 禁锢状态	823		时间
--~ 禁锢状态	823001	攻击力降低80%	10000
--~ 禁锢状态	823002	攻击力降低80%	20000
--~ 禁锢状态	823003	攻击力降低80%	30000
--~ 禁锢状态	823004	攻击力降低80%	40000
--~ 禁锢状态	823005	攻击力降低80%	50000
--~ 禁锢状态	823006	攻击力降低80%	60000

--~ 1.更新的文件路径以文件名
--~ 2.更新文件回牵涉到的修改内容
--~ PS：另外请把这些涉及到的文件打包发给我，我发给品质不走SVN流程。如果只是牵涉到资源文件，并没有涉及到对现有游戏内容修改的，可以直接上传SVN，不需要在清单上列出，清单请在下个星期1给我，谢谢合作
AnKaLaTime = 0

----------------------------------------------------------------------------------------------------
--【BOSS 固定刷新时间表】单位: 秒 —— BOSS 被打死后，过多久重新刷出来
--  想单独调某个场景就改下面那行的数字；没写的场景用 Default
--  14400 = 4 小时 | 7200 = 2 小时 | 21600 = 6 小时 | 3600 = 1 小时
----------------------------------------------------------------------------------------------------
YXD_WorldBoss_RefreshTime = {
	Default = 14400,   --默认 4 小时
	[102] = 14400,     --沙暴绿洲 · 850020
	[111] = 14400,     --光明遗迹 · 神龙安卡 850023
	[130] = 14400,     --镜月 · 变异凶兽 944065
	[107] = 14400,     --镜月地下城一层 · 幻影领主美兰达
	[136] = 14400,     --镜月地下城二层 · 安卡拉 948051
}

function YXD_WorldBoss_GetRefreshTime(MapConfigID)
	local t = YXD_WorldBoss_RefreshTime
	if t ~= nil and MapConfigID ~= nil and t[MapConfigID] ~= nil then
		return t[MapConfigID]
	end
	if t ~= nil and t.Default ~= nil then
		return t.Default
	end
	return 14400
end

YXD_WorldBoss_GoodsTab = {
	[850020] = {
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0},
		{GoodsID=782,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=782,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=782,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=782,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=782,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80181,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=796,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=796,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80819,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80819,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80819,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80819,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80819,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80819,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80235,GoodsNum=1,GaiLv=83000,PinZhi=0},
		{GoodsID=31020,GoodsNum=1,GaiLv=1000,PinZhi=0},
		{GoodsID=31021,GoodsNum=1,GaiLv=1000,PinZhi=0},
		{GoodsID=4002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=4102,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6602,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6902,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=8102,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=4302,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=4202,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=4402,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=4502,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=2002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=3002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=3902,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=5002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=5102,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6702,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=7002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=8202,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=5302,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=5202,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=5402,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=5502,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=1502,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6102,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6802,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=8002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=8302,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6302,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6202,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6402,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6502,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=1002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=40002,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40012,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40022,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40032,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40042,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40052,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40062,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40072,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40082,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40092,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40102,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40112,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40122,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40132,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40003,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40013,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40023,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40033,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40043,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40053,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40063,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40073,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40083,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40093,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40103,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40113,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40123,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40133,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40202,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40218,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40234,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40250,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40266,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40204,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40220,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40236,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40252,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40268,GoodsNum=1,GaiLv=74100,PinZhi=0},
		},
	[850021] = {
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0},
		{GoodsID=782,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=782,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=782,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=782,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=782,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80181,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=796,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=796,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80819,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80819,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80819,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80819,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80819,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80819,GoodsNum=2,GaiLv=1000000,PinZhi=0},
		{GoodsID=80235,GoodsNum=1,GaiLv=83000,PinZhi=0},
		{GoodsID=31020,GoodsNum=1,GaiLv=1000,PinZhi=0},
		{GoodsID=31021,GoodsNum=1,GaiLv=1000,PinZhi=0},
		{GoodsID=4002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=4102,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6602,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6902,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=8102,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=4302,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=4202,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=4402,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=4502,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=2002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=3002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=3902,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=5002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=5102,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6702,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=7002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=8202,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=5302,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=5202,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=5402,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=5502,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=1502,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6102,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6802,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=8002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=8302,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6302,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6202,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6402,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=6502,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=1002,GoodsNum=1,GaiLv=25000,PinZhi=6},
		{GoodsID=40002,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40012,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40022,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40032,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40042,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40052,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40062,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40072,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40082,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40092,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40102,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40112,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40122,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40132,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40003,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40013,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40023,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40033,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40043,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40053,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40063,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40073,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40083,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40093,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40103,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40113,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40123,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40133,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40202,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40218,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40234,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40250,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40266,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40204,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40220,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40236,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40252,GoodsNum=1,GaiLv=74100,PinZhi=0},
		{GoodsID=40268,GoodsNum=1,GaiLv=74100,PinZhi=0},
		},
	[944065] = {
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80698,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=31020,GoodsNum=1,Flag=0,GaiLv=10000,PinZhi=0},
		{GoodsID=80192,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=31021,GoodsNum=1,Flag=0,GaiLv=10000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},


		},
}

YXD_WorldBoss_SayGoodsTab = {
	[	4002	] = 2,
	[	4102	] = 3,
	[	6602	] = 4,
	[	6902	] = 5,
	[	8102	] = 6,
	[	4302	] = 7,
	[	4202	] = 8,
	[	4402	] = 9,
	[	4502	] = 10,
	[	2002	] = 11,
	[	3002	] = 12,
	[	3902	] = 13,
	[	5002	] = 14,
	[	5102	] = 15,
	[	6702	] = 16,
	[	7002	] = 17,
	[	8202	] = 18,
	[	5302	] = 19,
	[	5202	] = 20,
	[	5402	] = 21,
	[	5502	] = 22,
	[	1502	] = 23,
	[	6002	] = 24,
	[	6102	] = 25,
	[	6802	] = 26,
	[	8002	] = 27,
	[	8302	] = 28,
	[	6302	] = 29,
	[	6202	] = 30,
	[	6402	] = 31,
	[	6502	] = 32,
	[	1002	] = 33,
	[	4303	] = 1,
	[	4203	] = 2,
	[	4403	] = 3,
	[	4503	] = 4,
	[	5303	] = 5,
	[	5203	] = 6,
	[	5403	] = 7,
	[	5503	] = 8,
	[	6303	] = 9,
	[	6203	] = 10,
	[	6403	] = 11,
	[	6503	] = 12,
	[	4103	] = 14,
	[	4003	] = 15,
	[	5003	] = 16,
	[	5103	] = 17,
	[	6003	] = 18,
	[	6103	] = 19,
	[	2003	] = 21,
	[	3003	] = 22,
	[	3903	] = 23,
	[	1503	] = 24,
	[	1003	] = 25,
	[	6603	] = 27,
	[	6903	] = 28,
	[	8103	] = 29,
	[	6703	] = 30,
	[	7003	] = 31,
	[	8203	] = 32,
	[	6803	] = 33,
	[	8003	] = 34,
	[	8303	] = 35,
	[	20099	] = 1,
	[	20100	] = 2,
	[	20101	] = 3,
	[	20102	] = 4,
	[	20103	] = 5,
	[	20104	] = 6,
	[	20105	] = 7,
	[	20106	] = 8,
	[	20107	] = 9,
	[	20108	] = 10,
	[	20109	] = 11,
	[	20110	] = 12,
	[	20111	] = 12,
	[	20112	] = 13,
	[	20113	] = 14,
	[	20114	] = 15,
	[	20115	] = 16,
	[	20116	] = 17,
	[	20117	] = 18,
	[	20118	] = 19,
	[	20119	] = 20,
	[	20120	] = 21,
	[	20121	] = 21,
	[	20122	] = 22,
	[	20123	] = 23,
	[	20124	] = 24,
	[	20125	] = 25,
	[	20126	] = 26,
	[	20127	] = 27,
	[	20128	] = 28,
	[	20129	] = 29,
	[	20130	] = 30,
}

YXD_WorldBoss_SayCardTab = {
	[	31020	] = 0,
	[	31021	] = 1,
	[	31022	] = 2,
}

YXD_WorldBossTable = {
	[102] = {BossID=850020,Tile={657,532},},--沙暴绿洲场景8
	[111] = {BossID=850023,Tile={640,311},},--神龙安卡  光明遗迹，场景7
	[130] = {BossID=944065,Tile={352,525},},--镜月105
}

--镜月地下城一层场景8
if YXD_WorldBoss_MeiLanDa == nil then
	YXD_WorldBoss_MeiLanDa = {
			[107] = {MapID=107,JYID=850037,JYTile={{97,223},{160,292}},BossID=850022,BossFastID=0,BossTile={121,260},HWID=850033,HWTile={{131,248},{110,248},{110,270},{131,270},},HWJC=0,},
			
			}
end

--镜月地下城二层场景8
YXD_WorldBoss_AnKaLa = {
	[136] = {BossID=948051,Tile={227,221},},
}

local Twuyijinyingguaiwu = {850062,850028,850030} --51精英怪物ID

if sofie_tbfzdjygIDlist == nil then     ----------存放51精英怪物ID
   sofie_tbfzdjygIDlist = {}
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--创建天空城BOSS
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--BOSS信息表
if Boss_TaskTable == nil then
    Boss_TaskTable =
	{ 
	--天空城变异凶兽
	{nBossID=944065,nBossMapID=130,nBossX=352,nBossY=525,nRenovateTime=86400,nVerdictTime = 0, nFASTID = 0, nDeadTrg = 0, szDeadTrgDesc = "创建BOSS海煞死亡触发器", szMapName = "天空都市", nTrgTime = 0,},
	}
end
--创建BOSS（第一次刷BOSS）
--创建时间触发器场景服7
--5.1期间征战平原刷新BOSS场景服1
if API_GetServerID() == 1 then
	--创建时间触发器
	--API_Trace('调用创建时间触发器测试验证打印')
	if TKBossTask_TimeTriggerGID ~= nil then
		API_DestroyTriggerG(TKBossTask_TimeTriggerGID)
	end
	TKBossTask_TimeTriggerGID = API_CreateTimerTriggerG(0,0,120,-1,'Boss_Task_Halfhour')
end

--死亡回调函数
function Boss_Task_DeadTrgCallback(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	local MapConfigID = API_GetMapConfigID(MapID)
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
end	
--每天8:30必刷的时间触发函数 (判断时间触发器是否存在，不存在就创建一个)
function Boss_Task_Halfhour(MapConfigID)
	--API_Trace('调用Boss_Task_Halfhour')
	
	local nNowTime = os.time()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	
	local TStartTime = {Year = 2012,Month = 4,Day = 27,Hour = 0,Minute = 0,Second = 0} ;--开始时间
	local TEndTime = {Year = 2012,Month = 5,Day = 6,Hour = 23,Minute = 59,Second = 59}  ;--停止时间
	local nShiFouStart = API_DiffDatatime(TStartTime.Year,TStartTime.Month,TStartTime.Day,TStartTime.Hour,TStartTime.Minute,TStartTime.Second);
	local nShiFouEnd = API_DiffDatatime(TEndTime.Year,TEndTime.Month,TEndTime.Day,TEndTime.Hour,TEndTime.Minute,TEndTime.Second);
	
	--API_Trace('Hour'..Hour)
	--API_Trace('Minute'..Minute)
	if Hour == 20 and Minute >= 30 and Minute <= 33 then
			--API_Trace('调用Boss_Task_Halfhour调用成功1')
		if nNowTime > API_VarDataGetNumber_Ex(1,0,-6180,1,1)  then
			--API_Trace('调用成功2')
			--节日特殊处理
			if nShiFouStart <= 0 and nShiFouEnd > 0 then--活动时间内
				--API_Trace('调用节日特殊处理eeee')
				local RandomTime = math.random(50,120)
				API_CreateTimerTriggerG(100,0, 1,1, 'Boss_Task_SofieTKCreat')
				
			else
				--API_Trace('调用dd')
				local RandomTime = math.random(1,1800)
				--API_CreateTimerTriggerG(2,0, 30,1, 'Boss_Task_SofieTKCreat')--测试用
				API_CreateTimerTriggerG(130,0, 30,1, 'Boss_Task_SofieTKCreat')
				
				
			end
			local NowTime = os.date("*t", os.time()) --os.time()当前时间
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 20 
			NowTime.min = 30 
			NowTime.sec = 0 
			local NextTime = os.time(NowTime) 
			RefreshTimeSofieTKBoss = NextTime + 86400 
		        API_VarDataSetNumber_Ex_Sync(1,0,-6180,1,1,RefreshTimeSofieTKBoss) 
		  end
	end
end
--刷BOSS函数
function Boss_Task_SofieTKCreat(MapConfigID,b)
	--API_Trace('调用Boss_Task_SofieTKCreat')
	--API_Trace('调用MapConfigID'..MapConfigID)
	local TStartTime = {Year = 2012,Month = 4,Day = 27,Hour = 0,Minute = 0,Second = 0} ;--开始时间
	local TEndTime = {Year = 2020,Month = 5,Day = 6,Hour = 23,Minute = 59,Second = 59}  ;--停止时间
	local nShiFouStart = API_DiffDatatime(TStartTime.Year,TStartTime.Month,TStartTime.Day,TStartTime.Hour,TStartTime.Minute,TStartTime.Second);
	local nShiFouEnd = API_DiffDatatime(TEndTime.Year,TEndTime.Month,TEndTime.Day,TEndTime.Hour,TEndTime.Minute,TEndTime.Second);
	
	--检查BOSS是否存在，存在就删掉重新创建
	local MapID = API_GetRightMapID(MapConfigID)
	if API_MapIsValid(MapID) then
		if SOFIE_BossTKTask ~= nil then
			if API_GetMonsterID(SOFIE_BossTKTask) > 0 then
				API_DestroyMonster(SOFIE_BossTKTask)
			end
		end
		if SOFIE_BossTKjyTask ~= nil then
			if API_GetMonsterID(SOFIE_BossTKjyTask) > 0 then
				API_DestroyMonster(SOFIE_BossTKjyTask)
			end
		end
		if nShiFouStart <= 0 and nShiFouEnd > 0 then--活动时间内
			local FastID = API_CreateMonster(MapID, 944065, 384, 381, 4, 0, -1)
			--API_Trace('创建成功')
			
			if API_GetServerID() == 1 then
				API_ActorBroadcastMsgEx(-1, -1, 0, 1, '变异熊兽：哈哈哈，我终于穿越时空来到征战平原，兑现同兄弟卡罗斯千年的约定！')
				API_ActorBroadcastMsgEx(-1, -1, 0, 7, '变异熊兽：哈哈哈，我终于穿越时空来到征战平原，兑现同兄弟卡罗斯千年的约定！')
				API_ActorBroadcastMsgEx(-1, -1, 0, 17, '变异熊兽：哈哈哈，我终于穿越时空来到征战平原，兑现同兄弟卡罗斯千年的约定！')
			end
			API_MonsterAddStatus(FastID,2049001, 0)
			SOFIE_BossTKTask = FastID      
		        API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'Boss_Task_DeadTrgCallback')
		        
		       -- API_Trace('22222222')
			local RightMapID = API_GetRightMapID(100)
			if API_MapIsValid(RightMapID) then
				--API_Trace('33333333333')
				 if sofie_tbfzdjygIDlist[RightMapID] == nil then
				 	 sofie_tbfzdjygIDlist[RightMapID] = {}
			  	 end
				for j = 1,100 do
			           local FenMuFastID = sofie_tbfzdjygIDlist[RightMapID][j]
			           if FenMuFastID == nil or API_GetMonsterID(FenMuFastID) <= 0 then
			              local Width,Height = PublicFun_GetMapWidthHeight(RightMapID)
						  local TileX = 0
						  local TileY = 0
						  local Num = 0
						  repeat
							 Num = Num + 1
							 TileX = math.random(Width)
							 TileY = math.random(Height)
						  until not API_IsBlockTile(RightMapID,TileX,TileY,0) or Num == 100
			              if not API_IsBlockTile(RightMapID,TileX,TileY,0) then
							 local MonsterID = Twuyijinyingguaiwu[math.random(table.getn(Twuyijinyingguaiwu))]
							 local FenMuFastID = API_CreateMonster(RightMapID,MonsterID,TileX,TileY,3,0,-1)
							 API_CreateDieTriggerG(MapConfigID, 0, 0, FenMuFastID, 'Boss_Task_DeadTrgCallback')
							 sofie_tbfzdjygIDlist[RightMapID][j] = FenMuFastID
						  end
				   end
				 end
			 end 
		        --刷精英怪物
	        	local x = 392
			local y = 396
			local x1,y1,Num = 0,0,0
			for x1=x-5,x+5 do
				 for y1=y-5,y+5 do
					   if not API_IsBlockTile(MapID,x1,y1,0) then
						 local FastID = API_CreateMonster(MapID, 850100, x1, y1, 4, 0, -1)
						 --API_Trace('x1'..x1)
						 SOFIE_BossTKjyTask = FastID 
						 API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'Boss_Task_DeadTrgCallback')
						 x=x1
						 y=y1
						 return FastID,x1,y1
					   end
				 end
			end
			
		else
			--API_Trace('测试调用创建天空城变异凶兽创建成功')
			--local FastID = API_CreateMonster(MapID, 944065, 235, 170, 4, 0, -1)--测试用
			local FastID = API_CreateMonster(MapID, 944065, 352, 525, 4, 0, -1)
			--API_Trace('测试调用创建天空城变异凶兽创建成功'..MapID)
			API_MonsterAddStatus(FastID,2049001, 0)
			SOFIE_BossTKTask = FastID      
		        API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'Boss_Task_DeadTrgCallback')	
		end
       end

end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
for j in YXD_WorldBoss_AnKaLa do
	local MapID = API_GetRightMapID(j)
	local Table = YXD_WorldBoss_AnKaLa[j]
	if API_MapIsValid(MapID) then
		local RandomTime = math.random(3600)
		API_CreateTimerTriggerG(j,0, RandomTime,1, 'YXD_AnKaLa_CreatFunc')
	end	
end

function YXD_AnKaLa_CreatFunc(MapConfigID,b)
	if AnKaLaTime ~= nil then
		API_DestroyTriggerG(AnKaLaTime)
	end
	if YXD_WorldBoss_AnKaLa[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = YXD_WorldBoss_AnKaLa[MapConfigID]
		
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local Tile = Table.Tile
			local x = Tile[1]
			local y = Tile[2]
			local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
			API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'YXD_AnKaLa_DieFunc')
			if API_GetServerID() == 1 then
				API_ActorBroadcastMsgEx(-1, -1, 0, 1, '梦幻城二层领主安卡拉出现了。')
				API_ActorBroadcastMsgEx(-1, -1, 0, 7, '梦幻城二层领主安卡拉出现了。')
				API_ActorBroadcastMsgEx(-1, -1, 0, 17, '梦幻城二层领主安卡拉出现了。')
			end
		end
	end
end

function YXD_AnKaLa_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	local MapConfigID = API_GetMapConfigID(MapID)
	
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	local RandomTime = YXD_WorldBoss_GetRefreshTime(MapConfigID)
	AnKaLaTime = API_CreateTimerTriggerG(MapConfigID,0, RandomTime,1, 'YXD_AnKaLa_CreatFunc')
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if YXD_WorldBoss_MeiLanDa_JYTab == nil then
	YXD_WorldBoss_MeiLanDa_JYTab = {}
end

if API_GetServerID() == 1 then
	local RandomTime = math.random(3600)
	API_CreateTimerTriggerG(0,0, RandomTime,1, 'YXD_WorldBoss_CreatMeiLanDaJY')
end

function YXD_WorldBoss_CreatMeiLanDaJY(a,b)
	if a == 0 and b == 0 then
		for j in YXD_WorldBoss_MeiLanDa do
			local MapID = j
			local RightMapID = API_GetRightMapID(MapID)
			if YXD_WorldBoss_MeiLanDa_JYTab[RightMapID] == nil then
				YXD_WorldBoss_MeiLanDa_JYTab[RightMapID] = {}
			end
			for p in YXD_WorldBoss_MeiLanDa_JYTab[RightMapID] do
				local FastID = YXD_WorldBoss_MeiLanDa_JYTab[RightMapID][p]
				if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
					API_DestroyMonster(FastID)
					YXD_WorldBoss_MeiLanDa_JYTab[RightMapID][p] = nil
				end
			end
			if API_MapIsValid(RightMapID) then
				local JYID = YXD_WorldBoss_MeiLanDa[j].JYID
				local JYTile = YXD_WorldBoss_MeiLanDa[j].JYTile
				for i = 1,table.getn(JYTile) do
					local x = JYTile[i][1]
					local y = JYTile[i][2]
					local FastID = API_CreateMonster(MapID, JYID, x, y, 4, 0, -1)
					API_CreateDieTriggerG(0, 0, 0, FastID, 'YXD_WorldBoss_MeiLanDaJYDieFunc')
					table.insert(YXD_WorldBoss_MeiLanDa_JYTab[RightMapID],FastID)
				end
				API_CreateTimerTriggerG(RightMapID,j, 900,1, 'YXD_WorldBoss_CreatMeiLanDa')
			end
		end
	else
		if YXD_WorldBoss_MeiLanDa_JYTab[a] == nil then
			YXD_WorldBoss_MeiLanDa_JYTab[a] = {}
		end
		for p in YXD_WorldBoss_MeiLanDa_JYTab[a] do
			local FastID = YXD_WorldBoss_MeiLanDa_JYTab[a][p]
			if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
				API_DestroyMonster(FastID)
				YXD_WorldBoss_MeiLanDa_JYTab[a][p] = nil
			end
		end
		if API_MapIsValid(a) then
			local JYID = YXD_WorldBoss_MeiLanDa[b].JYID
			local JYTile = YXD_WorldBoss_MeiLanDa[b].JYTile
			for i = 1,table.getn(JYTile) do
				local x = JYTile[i][1]
				local y = JYTile[i][2]
				local FastID = API_CreateMonster(a, JYID, x, y, 4, 0, -1)
				API_CreateDieTriggerG(0, 0, 0, FastID, 'YXD_WorldBoss_MeiLanDaJYDieFunc')
				table.insert(YXD_WorldBoss_MeiLanDa_JYTab[a],FastID)
			end
			API_CreateTimerTriggerG(a,b, 900,1, 'YXD_WorldBoss_CreatMeiLanDa')
		end
	end
end

function YXD_WorldBoss_CreatMeiLanDa(MapID,MapConfigID)
	local Tab = YXD_WorldBoss_MeiLanDa[MapConfigID]
	local BossID = Tab.BossID
	local BossTile = Tab.BossTile
	local x = BossTile[1]
	local y = BossTile[2]
	local HWID = Tab.HWID
	local HWTile = Tab.HWTile
	local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
	API_MonsterAddStatus(FastID, 822004, -1)
	API_CreateDieTriggerG(0, 0, 0, FastID, 'YXD_WorldBoss_MeiLanDaDieFunc')
	YXD_WorldBoss_MeiLanDa[MapConfigID].BossFastID = FastID
	for i = 1,table.getn(HWTile) do
		local x2 = HWTile[i][1]
		local y2 = HWTile[i][2]
		local FastID2 = API_CreateMonster(MapID, HWID, x2, y2, 4, 0, -1)
		API_CreateDieTriggerG(0, 0, 0, FastID2, 'YXD_WorldBoss_MeiLanDaHWDieFunc')
		table.insert(YXD_WorldBoss_MeiLanDa_JYTab[MapID],FastID2)
	end
	YXD_WorldBoss_MeiLanDa[MapConfigID].HWJC = table.getn(HWTile)
end

function YXD_WorldBoss_MeiLanDaJYDieFunc(a,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
end

function YXD_WorldBoss_MeiLanDaHWDieFunc(a,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	if not API_MapIsValid(MapID) then
		return
	end
	local MapConfigID = API_GetMapConfigID(MapID) 
	local BossID = YXD_WorldBoss_MeiLanDa[MapConfigID].BossID
	local BossFastID = YXD_WorldBoss_MeiLanDa[MapConfigID].BossFastID
	local HWJC = YXD_WorldBoss_MeiLanDa[MapConfigID].HWJC
	if API_GetMonsterID(BossFastID) == BossID then
		HWJC = HWJC - 1
		if HWJC < 0 then
			HWJC = 0
		end
		YXD_WorldBoss_MeiLanDa[MapConfigID].HWJC = HWJC
		for i = 822001,822004 do
			API_MonsterRemoveStatus(BossFastID,i)
		end
		if HWJC ~= 0 then
			local StatusID = 822000 + HWJC
			API_MonsterAddStatus(BossFastID, StatusID, -1)
			API_ActorBroadcastMsg(MapID, 17,'幻影领主美兰达的防御护盾被削弱了25%！')
			API_ActorBroadcastMsg(MapID, 1,'幻影领主美兰达的防御护盾被削弱了25%！')
		else
			API_ActorBroadcastMsg(MapID, 17,'幻影领主美兰达的防御护盾已经完全消失了！')
			API_ActorBroadcastMsg(MapID, 1,'幻影领主美兰达的防御护盾已经完全消失了！')
		end
	end
end

function YXD_WorldBoss_MeiLanDaDieFunc(a,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	local MapConfigID = API_GetMapConfigID(MapID) 
	YXD_WorldBoss_MeiLanDa[MapConfigID].BossFastID = 0
	--美兰达死亡函数
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	local RandomTime = YXD_WorldBoss_GetRefreshTime(MapConfigID)
	API_CreateTimerTriggerG(MapID,MapConfigID, RandomTime,1, 'YXD_WorldBoss_CreatMeiLanDaJY')
end

for j in YXD_WorldBossTable do
	--五一特殊处理
	local TStartTime = {Year = 2012,Month = 4,Day = 27,Hour = 0,Minute = 0,Second = 0} ;--开始时间
	local TEndTime = {Year = 2020,Month = 5,Day = 6,Hour = 23,Minute = 59,Second = 59}  ;--停止时间
	local nShiFouStart = API_DiffDatatime(TStartTime.Year,TStartTime.Month,TStartTime.Day,TStartTime.Hour,TStartTime.Minute,TStartTime.Second);
	local nShiFouEnd = API_DiffDatatime(TEndTime.Year,TEndTime.Month,TEndTime.Day,TEndTime.Hour,TEndTime.Minute,TEndTime.Second);
	local MapID = API_GetRightMapID(j)
	--API_Trace('调用MapID'..MapID)
	local Table = YXD_WorldBossTable[j]
	
	if nShiFouStart <= 0 and nShiFouEnd > 0 then--活动时间内
		
		--if API_GetRightMapID(j) ~= 111 then
			
			if API_MapIsValid(MapID) then
				local RandomTime = math.random(3600)
				API_CreateTimerTriggerG(j,0, RandomTime,1, 'YXD_WorldBoss_CreatFunc')
				
			end	
		--end
	else
		if API_MapIsValid(MapID) then
			local RandomTime = math.random(3600)
			API_CreateTimerTriggerG(j,0, RandomTime,1, 'YXD_WorldBoss_CreatFunc')
			
		end	
	end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--五一，神龙安卡特殊处理
if API_GetServerID() == 1 then
	--API_Trace('触发器回调')
	if SLAKBossTask_TimeTriggerGIDsofie ~= nil then
		API_DestroyTriggerG(SLAKBossTask_TimeTriggerGIDsofie)
	end
	local RandomTime = math.random(1,120)
	--API_Trace('RandomTime'..RandomTime)
	SLAKBossTask_TimeTriggerGIDsofie = API_CreateTimerTriggerG(0,0,RandomTime,-1,'SLAKBoss_Task_Time')
	--API_Trace('触发器回调1')
end

--每天8:30必刷的时间触发函数 (判断时间触发器是否存在，不存在就创建一个)
function SLAKBoss_Task_Time(MapConfigID)
	--API_Trace('调用成功0')
	local nNowTime = os.time()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local TStartTime = {Year = 2012,Month = 4,Day = 27,Hour = 0,Minute = 0,Second = 0} ;--开始时间
	local TEndTime = {Year = 2020,Month = 5,Day = 6,Hour = 23,Minute = 59,Second = 59}  ;--停止时间
	local nShiFouStart = API_DiffDatatime(TStartTime.Year,TStartTime.Month,TStartTime.Day,TStartTime.Hour,TStartTime.Minute,TStartTime.Second);
	local nShiFouEnd = API_DiffDatatime(TEndTime.Year,TEndTime.Month,TEndTime.Day,TEndTime.Hour,TEndTime.Minute,TEndTime.Second);
	--API_Trace('调用成功')
	if Hour == 20 and Minute >= 30 and Minute <= 33 then
			--API_Trace('调用成功1')
		if nNowTime > API_VarDataGetNumber_Ex(1,0,-6189,1,2)  then
			--API_Trace('调用成功2')
			--节日特殊处理
			if nShiFouStart <= 0 and nShiFouEnd > 0 then--活动时间内
				--API_Trace('调用节日特殊处理')
				if API_GetServerID() == 1 then
					API_ActorBroadcastMsgEx(-1, -1, 0, 1, '五一期间20:30，征战平原准备开启世界BOSS攻城活动。')
					API_ActorBroadcastMsgEx(-1, -1, 0, 7, '五一期间20:30，征战平原准备开启世界BOSS攻城活动。')
					API_ActorBroadcastMsgEx(-1, -1, 0, 17, '五一期间20:30，征战平原准备开启世界BOSS攻城活动。')
				end

				local RandomTime = math.random(1,120)
				API_CreateTimerTriggerG(100,0, RandomTime,1, 'Boss_Task_SofieSLAKCreat')
				--API_Trace('调用成功3')
				
			end
			local NowTime = os.date("*t", os.time()) --os.time()当前时间
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 20 
			NowTime.min = 30 
			NowTime.sec = 0 
			local NextTime = os.time(NowTime) 
			RefreshTimeSofieSLAKBoss = NextTime + 86400 
		        API_VarDataSetNumber_Ex_Sync(1,0,-6189,1,2,RefreshTimeSofieSLAKBoss) 
		  end
	end
end
--刷5.1的神龙安卡函数
function Boss_Task_SofieSLAKCreat(MapConfigID,b)
	
	local TStartTime = {Year = 2012,Month = 4,Day = 27,Hour = 0,Minute = 0,Second = 0} ;--开始时间
	local TEndTime = {Year = 2020,Month = 5,Day = 6,Hour = 23,Minute = 59,Second = 59}  ;--停止时间
	local nShiFouStart = API_DiffDatatime(TStartTime.Year,TStartTime.Month,TStartTime.Day,TStartTime.Hour,TStartTime.Minute,TStartTime.Second);
	local nShiFouEnd = API_DiffDatatime(TEndTime.Year,TEndTime.Month,TEndTime.Day,TEndTime.Hour,TEndTime.Minute,TEndTime.Second);
	
	--检查BOSS是否存在，存在就删掉重新创建
	local MapID = API_GetRightMapID(MapConfigID)
	if API_MapIsValid(MapID) then
		if SOFIE_BossSLAKTask ~= nil then
			if API_GetMonsterID(SOFIE_BossSLAKTask) > 0 then
				API_DestroyMonster(SOFIE_BossSLAKTask)
			end
		end
		if nShiFouStart <= 0 and nShiFouEnd > 0 then--活动时间内
			local FastID = API_CreateMonster(MapID, 850023, 354, 360, 4, 0, -1)
			--API_Trace('创建成功')
			--API_ActorBroadcastMsgEx(-1, -1, 0, 1, '神龙安卡：哈哈哈，变异熊兽我就满足你千年的愿望吧！')
			--API_ActorBroadcastMsg(MapID, 17,'神龙安卡：哈哈哈，变异熊兽我就满足你千年的愿望吧！')
			if API_GetServerID() == 1 then
				API_ActorBroadcastMsgEx(-1, -1, 0, 1, '神龙安卡：哈哈哈，变异熊兽我就满足你千年的愿望吧！')
				API_ActorBroadcastMsgEx(-1, -1, 0, 7, '神龙安卡：哈哈哈，变异熊兽我就满足你千年的愿望吧！')
				API_ActorBroadcastMsgEx(-1, -1, 0, 17, '神龙安卡：哈哈哈，变异熊兽我就满足你千年的愿望吧！')
			end
			SOFIE_BossSLAKTask = FastID      
		        API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'Boss_Task_DeadTrgCallback')
		
		end
       end

end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function YXD_WorldBoss_CreatFunc(MapConfigID,b)
	--API_Trace('调用YXD_WorldBoss_CreatFunc')
	if YXD_WorldBossTable[MapConfigID] ~= nil then
		local MapID = API_GetRightMapID(MapConfigID)
		local Table = YXD_WorldBossTable[MapConfigID]
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		
		if API_MapIsValid(MapID) then
			local BossID = Table.BossID
			local Tile = Table.Tile
			local x = Tile[1]
			local y = Tile[2]
			local FastID = API_CreateMonster(MapID, BossID, x, y, 4, 0, -1)
			--if BossID == 850023 then
				--SOFIE_BossSLAKTask = FastID
			--end
			API_CreateDieTriggerG(MapConfigID, 0, 0, FastID, 'YXD_WorldBoss_DieFunc')
		end
	
	end
end

function YXD_WorldBoss_DieFunc(MapConfigID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	local MapConfigID = API_GetMapConfigID(MapID)
	
	YXD_WorldMonsterDieDrop(MonsterID,MapID,PosX,PosY,GuiShuXing,GuiShuID)
	local RandomTime = YXD_WorldBoss_GetRefreshTime(MapConfigID)
	API_CreateTimerTriggerG(MapConfigID,0, RandomTime,1, 'YXD_WorldBoss_CreatFunc')
end

--------------------------------------------------------------------------------------------------------------------
--针对天空都市BOSS，8:30刷BOSS时间回调函数
--------------------------------------------------------------------------------------------------------------------

--function YXD_WorldBoss_TKSofieTimeFunc (MapConfigID)
--	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
--	if Hour == 20 then
--		local RandomTime = math.random(1,1800)
--		API_CreateTimerTriggerG(MapConfigID,0, RandomTime,1, 'YXD_WorldBoss_CreatFunc')
--	end
--end

--灵魂石召唤巨人掉落
function YXD_SoulStone_DieFunc(ZhuRenID,b,Type,DieID,KillType,KillerID,MonsterID,MapID,PosX,PosY)
	if KillerType and KillerID == -1 then
		return
	end
	local ShiQuID = 0
	local ShiQuLeiXing = 0
	local ShiQuID2 = 0
	local ShiQuLeiXing2 = 4
	if API_ActorIsOnline(ZhuRenID) then
		ShiQuID = ZhuRenID
		ShiQuID2 = ZhuRenID
		if API_GetTeamID(ZhuRenID) > 0 then
			ShiQuLeiXing2 = 3 
			ShiQuID2 = API_GetTeamID(ZhuRenID)
			ShiQuLeiXing = 3
			ShiQuID = API_GetTeamID(ZhuRenID)
		end
	else
		ShiQuID = KillerID
		ShiQuID2 = KillerID
		if API_GetTeamID(KillerID) > 0 then
			ShiQuLeiXing2 = 3 
			ShiQuID2 = API_GetTeamID(KillerID)
			ShiQuLeiXing = 3
			ShiQuID = API_GetTeamID(KillerID)
		end
	end
	local MapConfigID = API_GetMapConfigID(MapID)	
	if YXD_WorldMonsterGoodsTab[MonsterID] ~= nil then
		local MonName = API_GetMonsterNameByID(MonsterID)
		local Table = YXD_WorldMonsterGoodsTab[MonsterID]
		local Say = ''
		local Num = 0
		local Card = 0
		for j in Table[1] do
			local RD = math.random(1000000)
			local GoodsID = Table[1][j].GoodsID
			local GoodsNum = Table[1][j].GoodsNum
			local GaiLv = Table[1][j].GaiLv
			local PinZhi = Table[1][j].PinZhi
			local GoodsName = API_GetGoodsName(GoodsID)
			if RD <= GaiLv then
				if PinZhi > 0 then
					API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',ShiQuLeiXing2,ShiQuID2,600,120,PinZhi)
				else
					API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',ShiQuLeiXing,ShiQuID,600,120)
				end
			end
		end
		for i in Table[2] do
			local RD = math.random(1000000)
			local GoodsID = 0
			local LeiXing = Table[2][i].LeiXing
			local GaiLv = Table[2][i].GaiLv
			local GoodsNum = Table[2][i].Num
			local PinZhi = Table[2][i].PinZhi
			if RD <= GaiLv then
				if YXD_WorldDropGoodsTab[LeiXing] ~= nil then
					GoodsID = YXD_WorldDropGoodsTab[LeiXing][math.random(table.getn(YXD_WorldDropGoodsTab[LeiXing]))]
					local GoodsName = API_GetGoodsName(GoodsID)
					if PinZhi > 0 then
						API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',ShiQuLeiXing2,ShiQuID2,600,120,PinZhi)
						if PinZhi == 6 then
							if b == 1 then
								if API_ActorIsOnline(ZhuRenID) then
									API_ActorBroadcastMsg(-1, 17,''..API_GetActorName(ZhuRenID)..'杀死庄园培养出的灵魂石BOSS掉落了高附加属性3洞的'..API_GetGoodsName(GoodsID)..'')
								else
									API_ActorBroadcastMsg(-1, 17,''..API_GetActorName(KillerID)..'杀死庄园培养出的灵魂石BOSS掉落了高附加属性3洞的'..API_GetGoodsName(GoodsID)..'')
								end
							else
								if API_ActorIsOnline(ZhuRenID) then
									API_ActorBroadcastMsg(-1, 17,''..API_GetActorName(ZhuRenID)..'杀死灵魂宝珠召唤的BOSS掉落了高附加属性3洞的'..API_GetGoodsName(GoodsID)..'')
								else
									API_ActorBroadcastMsg(-1, 17,''..API_GetActorName(KillerID)..'杀死灵魂宝珠召唤的BOSS掉落了高附加属性3洞的'..API_GetGoodsName(GoodsID)..'')
								end
							end
						end
					else
						API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',ShiQuLeiXing,ShiQuID,600,120)
					end
				end
			end
		end
		if Table[3] ~= nil then
			local RD = math.random(1000000)
			local LeiXing = Table[3].LeiXing
			local GoodsNum = Table[3].Num
			local PinZhi = 2
			local PinZhiTab = Table[3].PinZhiTab
			for j in PinZhiTab do
				local a = PinZhiTab[j].a
				local b = PinZhiTab[j].b
				if RD >= a and RD <= b then
					PinZhi = PinZhiTab[j].PinZhi
				end
			end
			if YXD_WorldDropGoodsTab[LeiXing] ~= nil then
				local GoodsID = YXD_WorldDropGoodsTab[LeiXing][math.random(table.getn(YXD_WorldDropGoodsTab[LeiXing]))]
				local GoodsName = API_GetGoodsName(GoodsID)
				API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,GoodsNum,0,''..MonName..'掉落物品',ShiQuLeiXing2,ShiQuID2,600,120,PinZhi)
			end
		end
	end
end
