----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\GongXunMiHan.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-7-24
--版  本:	1.0
--描  述:	经验密函
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-7-24
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------
--上次拆开时间
GongXunMiHan_LastTime = 18283
--今天拆开次数
GongXunMiHan_LingjiangNum = 18284


--转盘老虎机奖励表
GLOBAL_GongXunMiHan_IconTigerList = {
	--经验密函ID对应表
	--公民经验密函
	[794]={
		--奖励列表：ID，数量
		List = {80498,1,80498,2,80498,3,80498,4,80498,7,80498,7,80498,8,80498,9,80498,9,80498,10,80498,11,80498,12,80498,12,80498,12,80498,25,80498,50,},
		--奖品概率
		Gailv = {0,0,0,0,4,4,4,4,4,14,14,12,13,13,6,8},
		--奖品ID
		GoosID = 80498,
		--最小数量
		NumMin = 1,
		--最大数量
		NumMax = 50,
		--单位
		Danwei = '张',
		--开密函所需最小爵位
		NeedMinLevel = 1,
		--开密函所需最大爵位
		NeedMaxLevel = 85,
		--开密函所需点券
		NeedOpenPoint = 0,
		--刷新所需点券
		NeedAgainPoint = 0,
		--开密函所需活力
		NeedHunger = 80,
		--每天允许开的次数
		OpenNum = 2,
		},
		
	--男爵经验密函
	[795]={
		List = {80498,10,80498,11,80498,13,80498,15,80498,30,80498,32,80498,34,80498,36,80498,38,80498,42,80498,42,80498,44,80498,48,80498,50,80498,100,80498,200,},
		Gailv = {0,0,0,0,4,4,4,4,4,14,13,14,14,13,6,7},
		GoosID = 80498,
		NumMin = 10,
		NumMax = 200,
		Danwei = '张',
		NeedMinLevel = 11,
		NeedMaxLevel = 85,
		NeedOpenPoint = 0,
		NeedAgainPoint = 0,
		NeedHunger = 130,
		OpenNum = 2,
		},
		
	--子爵经验密函
	[796]={
		List = {80498,40,80498,40,80498,50,80498,60,80498,88,80498,90,80498,100,80498,110,80498,120,80498,132,80498,135,80498,140,80498,142,80498,146,80498,292,80498,584,},
		Gailv = {0,0,0,0,4,4,4,4,4,13,13,15,15,14,5,5},
		GoosID = 80498,
		NumMin = 40,
		NumMax = 584,
		Danwei = '张',
		NeedMinLevel = 26,
		NeedMaxLevel = 85,
		NeedOpenPoint = 0,
		NeedAgainPoint = 0,
		NeedHunger = 180,
		OpenNum = 2,
		},
	--伯爵经验密函
	[800]={
		List = {80498,100,80498,120,80498,140,80498,160,80498,182,80498,200,80498,210,80498,220,80498,230,80498,250,80498,270,80498,287,80498,292,80498,300,80498,600,80498,1200,},
		Gailv = {0,0,0,0,4,4,4,4,4,14,14,14,14,14,5,5},
		GoosID = 80498,
		NumMin = 100,
		NumMax = 1200,
		Danwei = '张',
		NeedMinLevel = 41,
		NeedMaxLevel = 85,
		NeedOpenPoint = 0,
		NeedAgainPoint = 0,
		NeedHunger = 260,
		OpenNum = 2,
		},
	--超级经验密函
	[88908]={
		List = {80498,200,80498,300,80498,400,80498,500,80498,600,80498,615,80498,630,80498,660,80498,690,80498,750,80498,810,80498,861,80498,876,80498,900,80498,1800,80498,3600,},
		Gailv = {0,0,0,0,4,4,4,4,4,14,14,14,14,14,5,5},
		GoosID = 80498,
		NumMin = 200,
		NumMax = 3600,
		Danwei = '张',
		NeedMinLevel = 21,
		NeedMaxLevel = 85,
		NeedOpenPoint = 50,
		NeedAgainPoint = 0,
		NeedHunger = 0,
		OpenNum = 500,
		},
		
	--超级经验密函二档
	[89093]={
		List = {82004,12,82004,14,82004,16,82004,18,82004,20,82004,22,82004,24,82004,32,82004,40,82004,48,82004,56,82004,72,},
		Gailv = {10,11,12,13,14,5,5,2,2,2,1,1},
		GoosID = 82004,
		NumMin = 12,
		NumMax = 72,
		Danwei = '张',
		NeedMinLevel = 31,
		NeedMaxLevel = 85,
		NeedOpenPoint = 80,
		NeedAgainPoint = 0,
		NeedHunger = 0,
		OpenNum = 500,
		},
		
	--超级经验密函三档
	[89094]={
		List = {82004,50,82004,60,82004,70,82004,80,82004,90,82004,100,82004,110,82004,120,82004,130,82004,140,82004,150,82004,160,},
		Gailv = {12,12,10,10,4,4,2,2,2,1,1,1},
		GoosID = 82004,
		NumMin = 50,
		NumMax = 160,
		Danwei = '张',
		NeedMinLevel = 41,
		NeedMaxLevel = 85,
		NeedOpenPoint = 120,
		NeedAgainPoint = 0,
		NeedHunger = 0,
		OpenNum = 500,
		},
		
	--超级经验密函四档
	[89095]={
		List = {82004,100,82004,120,82004,140,82004,160,82004,180,82004,200,82004,220,82004,240,82004,260,82004,280,82004,300,82004,320,},
		Gailv = {20,20,15,15,4,4,2,2,2,1,1,1},
		GoosID = 82004,
		NumMin = 100,
		NumMax = 320,
		Danwei = '张',
		NeedMinLevel = 51,
		NeedMaxLevel = 85,
		NeedOpenPoint = 160,
		NeedAgainPoint = 0,
		NeedHunger = 0,
		OpenNum = 500,
		},
}

function GongXunMiHan_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if GLOBAL_GongXunMiHan_IconTigerList[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return 0
	end
	if API_ActorIsEarnings(ActorID) then
		API_ResponseWrite('<text>您目前处于防沉迷状态，不能使用该道具，请到官网帐号管理</text><a http="http://fcm.qq.com/" closewindow="0">（http://fcm.qq.com/）</a><text>，查询补填方法。补填后未成年保护接触。</text>')
		API_ResponseWrite('<br><br><a>确定</a><br>')
		return 0
	end
	local GoosTable = GLOBAL_GongXunMiHan_IconTigerList[GoodsID]
	local JiangPingGoosID = GoosTable.GoosID
	local NumMin = GoosTable.NumMin
	local NumMax = GoosTable.NumMax
	local Danwei = GoosTable.Danwei
	local NeedOpenPoint = GoosTable.NeedOpenPoint
	local NeedHunger = GoosTable.NeedHunger
	local OpenNum = GoosTable.OpenNum
	local TodayLingjiangNum = API_VarDataGetNumber(ActorID,1,GongXunMiHan_LingjiangNum)
	local year,month,day,hour,min,sec,wday = PublicFun_time()
	local Biaozhi = API_VarDataGetNumber(ActorID,1,GongXunMiHan_LastTime)
	Biaozhi = math.mod(Biaozhi,100000000)
	local LYear = math.floor(Biaozhi/10000)
	local LMonthDay = math.mod(Biaozhi,10000)
	local LMonth = math.floor(LMonthDay/100)
	local LDay = math.mod(LMonthDay,100)
	
	if year ~= LYear or month ~= LMonth or day ~= LDay then
		TodayLingjiangNum = 1
	else
		TodayLingjiangNum = TodayLingjiangNum + 1
	end
	
	API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
	if JiangPingGoosID == 80498 then
		API_ResponseWrite('<text>这封密函内装着 </text><text color="255,0,255"> '..NumMin..' </text><text>到</text><text color="255,0,255"> '..NumMax..' </text><text>'..Danwei..'</text><img srcgd="'..JiangPingGoosID..'" tipgd="'..JiangPingGoosID..'"><a color="254,249,220" tip="每张'..API_GetGoodsName(JiangPingGoosID)..'可换100经验" closewindow="0">'..API_GetGoodsName(JiangPingGoosID)..'</a><text>（每张</text><text color="255,0,255"> 100 经验</text><text>） ！</text><br><br>')
	elseif JiangPingGoosID == 82004 then
		API_ResponseWrite('<text>这封密函内装着 </text><text color="255,0,255"> '..NumMin..' </text><text>到</text><text color="255,0,255"> '..NumMax..' </text><text>'..Danwei..'</text><img srcgd="'..JiangPingGoosID..'" tipgd="'..JiangPingGoosID..'"><a color="254,249,220" tip="每张'..API_GetGoodsName(JiangPingGoosID)..'可换10000经验" closewindow="0">'..API_GetGoodsName(JiangPingGoosID)..'</a><text>（每张</text><text color="255,0,255"> 10000 经验</text><text>） ！</text><br><br>')	
	end
	--	API_ResponseWrite('<br><a tip="<text size=\'14\' color=\'0,255,0\'>自由开密函需要消耗：</text>\n<img sc=\'57004\' frame=\'1\' Delay=\'200\' type=\'2\'>浮空岛声望 X '..PointPrestige..'" href="GongXunMiHan_OpenMiHan?1=1&2='..GoodsID..'">自由拆开密函</a><text>                 [消耗 '..PointPrestige..' 点“浮空岛声望”和 '..NeedOpenPoint..' 点券]</text><br>')
	if GoodsID == 88908 or GoodsID == 89093 or GoodsID == 89094 or GoodsID == 89095 then
		if TodayLingjiangNum > OpenNum then
			API_ResponseWrite('<br><a color="150,150,150" tip="<text size=\'14\' color=\'0,255,0\'>开密函需要消耗：</text>\n<img sc=\'57004\' frame=\'1\' Delay=\'200\' type=\'2\'>点券 X '..NeedOpenPoint..'\n---\n每天允许开'..OpenNum..'次超级经验密函\n您今天已经不能再开超级经验密函了">拆开密函（每天最多'..OpenNum..'次）</a><text>    [消耗 '..NeedOpenPoint..' 点“点券”（今天已经开完 '..OpenNum..' 次了）]</text><br>')
		else
			API_ResponseWrite('<br><a tip="<text size=\'14\' color=\'0,255,0\'>开密函需要消耗：</text>\n<img sc=\'57004\' frame=\'1\' Delay=\'200\' type=\'2\'>点券 X '..NeedOpenPoint..'" href="GongXunMiHan_OpenMiHan?1='..GoodsID..'">拆开密函</a><text>    [每次消耗 '..NeedOpenPoint..' 点“点券”]</text><br>')
		end
	else
		if TodayLingjiangNum > OpenNum then
			API_ResponseWrite('<br><a color="150,150,150" tip="<text size=\'14\' color=\'0,255,0\'>开密函需要消耗：</text>\活力 X '..NeedHunger..'\n---\n每天允许开'..OpenNum..'次经验密函\n您今天已经不能再开经验密函了" href="GongXunMiHan_OpenMiHan?1='..GoodsID..'">拆开密函（每天'..OpenNum..'次）</a><text>    [消耗 '..NeedHunger..' 点“活力值”（今天已经开完 '..OpenNum..' 次了）]</text><br>')
		else
			API_ResponseWrite('<br><a tip="<text size=\'14\' color=\'0,255,0\'>开密函需要消耗：</text>\n活力 X '..NeedHunger..'\n---\n每天允许开'..OpenNum..'次'..API_GetGoodsName(GoodsID)..'\n这是您今天第'..TodayLingjiangNum..'次开经验密函" href="GongXunMiHan_OpenMiHan?1='..GoodsID..'">拆开密函（每天'..OpenNum..'次）</a><text>    [消耗 '..NeedHunger..' 点“活力值”（今天还可以开 '.. OpenNum - TodayLingjiangNum + 1 ..' 张）]</text><br>')
		end
	end
	API_ResponseWrite('<br><a>取消</a><br>')
	API_ResponseFlush(ActorID)
	
	return 1
end



function GongXunMiHan_OpenMiHan()
	local ActorID = API_RequestGetActorID()
	local GoodsID = API_RequestGetNumber(1)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if GLOBAL_GongXunMiHan_IconTigerList[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return 0
	end
	if API_ActorIsEarnings(ActorID) then
		API_ResponseWrite('<text>您目前处于防沉迷状态，不能使用该道具，请到官网帐号管理</text><a http="http://fcm.qq.com/" closewindow="0">（http://fcm.qq.com/）</a><text>，查询补填方法。补填后未成年保护接触。</text>')
		API_ResponseWrite('<br><br><a>确定</a><br>')
		return 0
	end
	local GoosTable = GLOBAL_GongXunMiHan_IconTigerList[GoodsID]
	local JiangPingGoosID = GoosTable.GoosID
	local NumMin = GoosTable.NumMin
	local NumMax = GoosTable.NumMax
	local Danwei = GoosTable.Danwei
	local NeedMinLevel = GoosTable.NeedMinLevel
	local NeedMaxLevel = GoosTable.NeedMaxLevel
	local NeedOpenPoint = GoosTable.NeedOpenPoint
	local NeedAgainPoint = GoosTable.NeedAgainPoint
	local NeedHunger = GoosTable.NeedHunger
	local OpenNum = GoosTable.OpenNum
	
	local Hunger = API_ActorGetPropNum(ActorID,PD_PROP_HUNGER)
	local Point = API_ActorGetPropNum(ActorID,183)
	
	local TodayLingjiangNum = API_VarDataGetNumber(ActorID,1,GongXunMiHan_LingjiangNum)
	local year,month,day,hour,min,sec,wday = PublicFun_time()
	local Biaozhi = API_VarDataGetNumber(ActorID,1,GongXunMiHan_LastTime)
	Biaozhi = math.mod(Biaozhi,100000000)
	local LYear = math.floor(Biaozhi/10000)
	local LMonthDay = math.mod(Biaozhi,10000)
	local LMonth = math.floor(LMonthDay/100)
	local LDay = math.mod(LMonthDay,100)
	
	if year ~= LYear or month ~= LMonth or day ~= LDay then
		TodayLingjiangNum = 1
	else
		TodayLingjiangNum = TodayLingjiangNum + 1
	end
	Biaozhi = year * 10000 + month * 100 + day
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel < NeedMinLevel then
		API_ResponseWrite('<text>需要等级达到 </text><text color="255,0,255">'.. GLOBAL_Exploit[NeedMinLevel].PeerageDepict ..'</text><text> 以上才能拆开这封密函，请尽快提高自己的等级！</text><br><br>')
		API_ResponseWrite('<br><a>我明白了</a><br>')
	elseif ExpLevel > NeedMaxLevel then
		API_ResponseWrite('<text>等级超过 </text><text color="255,0,255">'.. GLOBAL_Exploit[NeedMaxLevel].PeerageDepict ..'</text><text> 后不能再拆开这封密函，请去寻找更高级的经验密函！</text><br><br>')
		API_ResponseWrite('<br><a>我明白了</a><br>')
	else
		if NeedOpenPoint > Point then
			API_ResponseWrite('<text>拆开经验密函需要消耗 </text><text color="255,0,255">'..NeedOpenPoint..'</text><text> 点券，您目前只有 </text><text color="255,0,255">'..Point..'</text><text> 点券，请先通过选择“去官网充值点券”或“去交易所用金币购买点券”得到足够数量的点券后，再来拆开经验密函</text><br><br>')
			API_ResponseWrite('<br><a http="http://yxd.21mmo.com/pay/pay.html" closewindow="0">去官网充值点券</a><br>')
			API_ResponseWrite('<br><a href="DianQuanHuanJinBi_OpenBourse?1=2" closewindow="0">去交易所用金币购买点券</a><br>')
			API_ResponseWrite('<br><a tip="<text size=\'14\' color=\'0,255,0\'>开密函需要消耗：</text>\n<img sc=\'57004\' frame=\'1\' Delay=\'200\' type=\'2\'>点券 X '..NeedOpenPoint..'" href="GongXunMiHan_OpenMiHan?1='..GoodsID..'">拆开密函</a><text>    [每次消耗 '..NeedOpenPoint..' 点“点券”]</text><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
		elseif Hunger < NeedHunger then
			API_ResponseWrite('<text>开启这封密函需要 </text><text color="255,0,255">'..NeedHunger..'</text><text> 点“活力值”，您目前只有 </text><text color="255,0,255">'..Hunger..'</text><text> 点“活力值”，请先去参加各个浮空岛的战斗获得“活力值”！</text><br><br>')
			API_ResponseWrite('<br><a tip="<text size=\'14\' color=\'0,255,0\'>拆开密函需要消耗：</text>\n活力 X '..NeedHunger..'" href="GongXunMiHan_OpenMiHan?1='..GoodsID..'">拆开密函</a><text>  [消耗 '..NeedHunger..' 点“活力值”]</text><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
		elseif TodayLingjiangNum > OpenNum then
			API_ResponseWrite('<text>每天允许开 </text><text color="255,0,255">'..OpenNum..'</text><text> 次经验密函，您今天已经不能再开经验密函了！</text><br><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
		else
			
			if API_ActorRemoveGoods(ActorID,GoodsID,1,'开密函') then
				if NeedOpenPoint > 0 then
					if API_UsePoint(ActorID,3,GoodsID,1,NeedOpenPoint) == 0 then
						API_ActorSendMsg(ActorID,0,'拆开'..API_GetGoodsName(GoodsID)..'，消耗'..NeedOpenPoint..'点券')
						API_ActorSendMsg(ActorID,7,'拆开'..API_GetGoodsName(GoodsID)..'，消耗'..NeedOpenPoint..'点券')
					else
						return
					end
				end
				if NeedHunger > 0 then
					API_ActorAddHunger(ActorID,-NeedHunger)
					API_ActorSendMsg(ActorID,0,'拆开'..API_GetGoodsName(GoodsID)..'，消耗'..NeedHunger..'活力值')
					API_ActorSendMsg(ActorID,7,'拆开'..API_GetGoodsName(GoodsID)..'，消耗'..NeedHunger..'活力值')
				end
				API_VarDataSetNumber(ActorID,1,GongXunMiHan_LastTime,Biaozhi)
				API_VarDataSetNumber(ActorID,1,GongXunMiHan_LingjiangNum,TodayLingjiangNum)
				local RewardTable = GoosTable.List
				local TigerID = GoodsID* 10 + 3
				API_VarDataSetNumber(ActorID,1,18261,TigerID)
				local FinishLoc = 0
				local GailvMax = 0
				for i = 1, table.getn(GoosTable.Gailv) do
					GailvMax = GailvMax + GoosTable.Gailv[i]
				end
				local GailvLuoDian = math.random(GailvMax)
				local DangQianGailv = 0
				for i = 1, table.getn(GoosTable.Gailv) do
					DangQianGailv = DangQianGailv + GoosTable.Gailv[i]
					if DangQianGailv >= GailvLuoDian then
						FinishLoc = i
						break
					end
				end
				API_VarDataSetNumber(ActorID,1,18262,FinishLoc)
				if GoodsID == 88908 or GoodsID == 89093 or GoodsID == 89094 or GoodsID == 89095 then
					GongXunMiHan_IconTigerPickFunc(ActorID,TigerID)
				else
					API_OpenIconTiger(ActorID,TigerID,FinishLoc,'','GongXunMiHan_IconTigerAgainFunc','GongXunMiHan_IconTigerPickFunc',16,RewardTable)
					API_ActorSendMsg(ActorID,0,'拆开经验密函，幸运大抽奖：幸运转轮开始转动，祝您好运！')
				--	API_ActorSendMsg(ActorID,2,'如果您对本次抽奖结果不满意，可以点击“再来一次”按钮获得重新摇奖的机会')
				end
			end
		end
	end
end

function GongXunMiHan_IconTigerAgainFunc()
	local ActorID = API_RequestGetActorID()
	API_ActorSendMsg(ActorID,9,'积极响应文化部号召，取消“再来一次”功能！')
	return
--	local TigerID = API_RequestGetNumber(1)
--	if TigerID ~= API_VarDataGetNumber(ActorID,1,18261) then
--		return
--	end
--	local TigerType = math.mod(TigerID,10)
--	if TigerType ~= 3 then
--		return
--	end
--	local GoodsID = math.floor(TigerID/10)
--	local GoosTable = GLOBAL_GongXunMiHan_IconTigerList[GoodsID]
--	if GoosTable ~= nil then
--		local JiangPingGoosID = GoosTable.GoosID
--		local NumMin = GoosTable.NumMin
--		local NumMax = GoosTable.NumMax
--		local Danwei = GoosTable.Danwei
--		local NeedMinLevel = GoosTable.NeedMinLevel
--		local NeedMaxLevel = GoosTable.NeedMaxLevel
--		local NeedHunger = GoosTable.NeedHunger
--		local NeedOpenPoint = GoosTable.NeedOpenPoint
--		local NeedAgainPoint = GoosTable.NeedAgainPoint
--		local OpenNum = GoosTable.OpenNum
--		local Hunger = API_ActorGetPropNum(ActorID,PD_PROP_HUNGER)
--		local Point = API_ActorGetPropNum(ActorID,183)
--		local RewardTable = GoosTable.List
--		
--		local FinishLoc = API_VarDataGetNumber(ActorID,1,18262)
--		local JiangPingGoodsID = RewardTable[FinishLoc*2-1]
--		local JiangPingGoodsNum = RewardTable[FinishLoc*2]
--		if JiangPingGoodsID == nil or JiangPingGoodsNum == nil or JiangPingGoodsID <= 0 or JiangPingGoodsNum <= 0 then
--			return
--		end
--		if Point > NeedAgainPoint then
--			if API_UsePoint(ActorID,3,GoodsID*10000,1,NeedAgainPoint) == 0 then
--				local FinishLoc = 0
--				local GailvMax = 0
--				for i = 1, table.getn(GoosTable.Gailv) do
--					GailvMax = GailvMax + GoosTable.Gailv[i]
--				end
--				local GailvLuoDian = math.random(GailvMax)
--				local DangQianGailv = 0
--				for i = 1, table.getn(GoosTable.Gailv) do
--					DangQianGailv = DangQianGailv + GoosTable.Gailv[i]
--					if DangQianGailv >= GailvLuoDian then
--						FinishLoc = i
--						break
--					end
--				end
--				API_VarDataSetNumber(ActorID,1,18262,FinishLoc)
--				API_OpenIconTiger(ActorID,TigerID,FinishLoc,'点“再来一次”需要消耗'..NeedAgainPoint..'点券','GongXunMiHan_IconTigerAgainFunc','GongXunMiHan_IconTigerPickFunc',16,RewardTable)
--				API_ActorSendMsg(ActorID,2,'拆开经验密函，幸运大抽奖：幸运转轮再一次开始转动，祝您好运！')
--				API_ActorSendMsg(ActorID,2,'如果您对本次抽奖结果不满意，可以点击“再来一次”按钮获得重新摇奖的机会')
--				API_ActorSendMsg(ActorID,9,'您使用'..NeedAgainPoint..'点券让轮盘重新开始转动，祝您好运！')
--			end
--		else
--			API_ActorSendMsg(ActorID,9,'再来一次需要'..NeedAgainPoint..'点券')
--			return
--		end
--	end
end

function GongXunMiHan_IconTigerPickFunc(ActorID,TigerID)
	local ActorID = ActorID or API_RequestGetActorID()
	local TigerID = TigerID or API_RequestGetNumber(1)
	if TigerID ~= API_VarDataGetNumber(ActorID,1,18261) then
		return
	end
	local TigerType = math.mod(TigerID,10)
	if TigerType ~= 3 then
		return
	end
	local GoodsID = math.floor(TigerID/10)
	local GoosTable = GLOBAL_GongXunMiHan_IconTigerList[GoodsID]
	if GoosTable ~= nil then
		local RewardTable = GoosTable.List
		local FinishLoc = API_VarDataGetNumber(ActorID,1,18262)
		local FinishLoc = API_VarDataGetNumber(ActorID,1,18262)
		local JiangPingGoodsID = RewardTable[FinishLoc*2-1]
		local JiangPingGoodsNum = RewardTable[FinishLoc*2]
		if JiangPingGoodsID == nil or JiangPingGoodsNum == nil or JiangPingGoodsID <= 0 or JiangPingGoodsNum <= 0 then
			return
		end
		API_VarDataSetNumber(ActorID,1,18261,0)
		API_VarDataSetNumber(ActorID,1,18262,0)
		local JiangPingGoodsName = API_GetGoodsName(JiangPingGoodsID)
		if API_ActorCanAddGoods(ActorID,JiangPingGoodsID,JiangPingGoodsNum,0,0) ~= -1 then
			API_AddActorGoods(ActorID,JiangPingGoodsID,JiangPingGoodsNum,'经验密函')
			API_ActorSendMsg(ActorID,0,'拆开经验密函得到：'..JiangPingGoodsNum..'个'..JiangPingGoodsName..'')
			API_ActorSendMsg(ActorID,7,'拆开经验密函得到：'..JiangPingGoodsNum..'个'..JiangPingGoodsName..'')
		else
			API_SendActorMail(ActorID,JiangPingGoodsID,JiangPingGoodsNum,'[经验密函]奖励','获得'..JiangPingGoodsNum..'个'..JiangPingGoodsName..'')
			API_ActorSendMsg(ActorID,0,'拆开经验密函得到：'..JiangPingGoodsNum..'个'..JiangPingGoodsName..'（请到邮箱领取）')
			API_ActorSendMsg(ActorID,7,'拆开经验密函得到：'..JiangPingGoodsNum..'个'..JiangPingGoodsName..'（请到邮箱领取）')
		end
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		if JiangPingGoodsID == 80498 then
			API_ResponseWrite('<text>拆开经验密函得到： </text><text color="255,0,255"> '..JiangPingGoodsNum..' 张</text><img srcgd="'..JiangPingGoodsID..'" tipgd="'..JiangPingGoodsID..'"><a color="254,249,220" tip="每张'..JiangPingGoodsName..'可换100经验" closewindow="0">'..JiangPingGoodsName..'</a><text>（每张</text><text color="255,0,255"> 100 经验</text><text>） ！</text><br><br>')
		elseif JiangPingGoodsID == 82004 then
			API_ResponseWrite('<text>拆开经验密函得到： </text><text color="255,0,255"> '..JiangPingGoodsNum..' 张</text><img srcgd="'..JiangPingGoodsID..'" tipgd="'..JiangPingGoodsID..'"><a color="254,249,220" tip="每张'..JiangPingGoodsName..'可换10000经验" closewindow="0">'..JiangPingGoodsName..'</a><text>（每张</text><text color="255,0,255"> 10000 经验</text><text>） ！</text><br><br>')
		end
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
	end
end


----广告
--API_CreateTimerTriggerG(0,0,60,-1,'GongXunMiHan_TipMsg')
--function GongXunMiHan_TipMsg(Param1,Param2)
--	local year,month,day,hour,min,sec,wday = PublicFun_time()
--	if hour >= 20 and hour < 21 and math.mod(min,15) == 0 then
--		for i in GLOBAL_AD_MapIDList do
--			local MapID = GLOBAL_AD_MapIDList[i]
--			local RightMapID = API_GetRightMapID(MapID)
--			API_ActorMsgBoard(0,RightMapID,-1,'去机奴巢穴消灭机奴族可获得经验密函！                                             拆开经验密函可以获得大量经验')
--			API_ActorMsgBoard(0,RightMapID,-1,'现在去机奴巢穴消灭机奴族可以获得经验密函                                         拆开经验密函可以获得大量经验')
--		end
--	end
--end
