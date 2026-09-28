----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\GongXunMiHan.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-7-24
--版  本:	1.0
--描  述:	功勋密函
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-7-24
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------
--上次打开时间
GongXunMiHan_LastTime = 18283
--今天打开次数
GongXunMiHan_LingjiangNum = 18284


--转盘老虎机奖励表
GLOBAL_GongXunMiHan_IconTigerList = {
	--功勋密函ID对应表
	--公民功勋密函
	[794]={
		--奖励列表：ID，数量
		List = {80498,1,80498,2,80498,3,80498,4,80498,5,80498,12,80498,13,80498,14,80498,15,80498,16,80498,35,80498,36,80498,37,80498,78,80498,80,80498,82,},
		--奖品概率
		Gailv = {1,1,1,1,1,9,9,9,9,9,10,10,10,5,5,5},
		--奖品ID
		GoosID = 80498,
		--最小数量
		NumMin = 1,
		--最大数量
		NumMax = 82,
		--单位
		Danwei = '张',
		--开密函所需最小爵位
		NeedMinLevel = 1,
		--开密函所需最大爵位
		NeedMaxLevel = 85,
		--开密函所需点券
		NeedOpenPoint = 12,
		--刷新所需点券
		NeedAgainPoint = 12,
		--开密函所需声望等级爵位每个大档爵位已经对应好一个值公民1男爵2子爵4伯爵6
		PrestigePeerage = 1,
		--点券开密函的声望倍率
		PointPrestigeBelv = 3,
		--免费开密函的声望倍率
		FreePrestigeBelv = 40,
		--每天允许免费开的次数
		FreeOpenNum = 3,
		},
		
	--男爵功勋密函
	[795]={
		List = {80498,3,80498,4,80498,5,80498,6,80498,7,80498,31,80498,32,80498,33,80498,34,80498,35,80498,80,80498,81,80498,82,80498,300,80498,320,80498,340,},
		Gailv = {1,1,1,1,1,9,9,9,9,9,10,10,10,5,5,5},
		GoosID = 80498,
		NumMin = 3,
		NumMax = 340,
		Danwei = '张',
		NeedMinLevel = 11,
		NeedMaxLevel = 85,
		NeedOpenPoint = 40,
		NeedAgainPoint = 40,
		PrestigePeerage = 2,
		PointPrestigeBelv = 3,
		FreePrestigeBelv = 40,
		FreeOpenNum = 3,
		},
		
	--子爵功勋密函
	[796]={
		List = {80498,30,80498,31,80498,32,80498,33,80498,34,80498,83,80498,84,80498,85,80498,86,80498,87,80498,160,80498,170,80498,180,80498,900,80498,920,80498,940,},
		Gailv = {1,1,1,1,1,9,9,9,9,9,10,10,10,5,5,5},
		GoosID = 80498,
		NumMin = 30,
		NumMax = 940,
		Danwei = '张',
		NeedMinLevel = 26,
		NeedMaxLevel = 85,
		NeedOpenPoint = 90,
		NeedAgainPoint = 90,
		PrestigePeerage = 4,
		PointPrestigeBelv = 3,
		FreePrestigeBelv = 40,
		FreeOpenNum = 3,
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
	local GoosTable = GLOBAL_GongXunMiHan_IconTigerList[GoodsID]
	local JiangPingGoosID = GoosTable.GoosID
	local NumMin = GoosTable.NumMin
	local NumMax = GoosTable.NumMax
	local Danwei = GoosTable.Danwei
	local Peerage = GoosTable.PrestigePeerage
	local Prestige = GLOBAL_PrestigeCriterion[Peerage]
	if Prestige > 0 then
		local PointPrestigeBelv = GoosTable.PointPrestigeBelv
		local FreePrestigeBelv = GoosTable.FreePrestigeBelv
		local PointPrestige = PointPrestigeBelv * Prestige
		local FreePrestige = FreePrestigeBelv * Prestige
		local NeedOpenPoint = GoosTable.NeedOpenPoint
		local FreeOpenNum = GoosTable.FreeOpenNum
		
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
		
		API_ResponseWrite('<name>功勋密函</name>')
		API_ResponseWrite('<text>这封密函内装着 </text><text color="255,0,255"> '..NumMin..' </text><text>到</text><text color="255,0,255"> '..NumMax..' </text><text>'..Danwei..'</text><img srcgd="'..JiangPingGoosID..'" tipgd="'..JiangPingGoosID..'"><a color="254,249,220" tip="前往英雄广场找引导者兑换功勋\n每张功勋兑换券可换100功勋" closewindow="0">'..API_GetGoodsName(JiangPingGoosID)..'</a><text>（每张</text><text color="255,0,255"> 100 功勋</text><text>） ！</text><br><br>')
		API_ResponseWrite('<br><a tip="<text size=\'14\' color=\'0,255,0\'>自由开密函需要消耗：</text>\n<img sc=\'57004\' frame=\'1\' Delay=\'200\' type=\'2\'>点券 X '..NeedOpenPoint..'\n浮空岛声望 X '..PointPrestige..'" href="GongXunMiHan_OpenMiHan?1=1&2='..GoodsID..'">自由拆开密函</a><text>                 [消耗 '..PointPrestige..' 点“浮空岛声望”和 '..NeedOpenPoint..' 点券]</text><br>')
		if TodayLingjiangNum > FreeOpenNum then
			API_ResponseWrite('<br><a color="150,150,150" tip="<text size=\'14\' color=\'0,255,0\'>限次开密函需要消耗：</text>\n浮空岛声望 X '..FreePrestige..'\n---\n每天允许免点券开'..FreeOpenNum..'次功勋密函\n您今天已经不能再免点券开功勋密函了\n请选择以“自由拆开密函”的方式开启功勋密函" href="GongXunMiHan_OpenMiHan?1=2&2='..GoodsID..'">限次拆开密函（每天仅'..FreeOpenNum..'次）</a><text>    [消耗 '..FreePrestige..' 点“浮空岛声望”（今天已经开完 '..FreeOpenNum..' 次了）]</text><br>')
		else
			API_ResponseWrite('<br><a tip="<text size=\'14\' color=\'0,255,0\'>限次开密函需要消耗：</text>\n浮空岛声望 X '..FreePrestige..'\n---\n每天允许免点券开'..FreeOpenNum..'次功勋密函\n这是您今天第'..TodayLingjiangNum..'次免点券开功勋密函" href="GongXunMiHan_OpenMiHan?1=2&2='..GoodsID..'">限次拆开密函（每天仅'..FreeOpenNum..'次）</a><text>    [消耗 '..FreePrestige..' 点“浮空岛声望”（今天还可以开 '.. FreeOpenNum - TodayLingjiangNum + 1 ..' 张）]</text><br>')
		end
		API_ResponseFlush(ActorID)
		return 1
	else
		return 0
	end
end



function GongXunMiHan_OpenMiHan()
	local ActorID = API_RequestGetActorID()
	local GoodsID = API_RequestGetNumber(2)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if GLOBAL_GongXunMiHan_IconTigerList[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'无效物品')
		return 0
	end
	local SelectItem = API_RequestGetNumber(1)
	local GoosTable = GLOBAL_GongXunMiHan_IconTigerList[GoodsID]
	local JiangPingGoosID = GoosTable.GoosID
	local NumMin = GoosTable.NumMin
	local NumMax = GoosTable.NumMax
	local Danwei = GoosTable.Danwei
	local Peerage = GoosTable.PrestigePeerage
	local Prestige = GLOBAL_PrestigeCriterion[Peerage]
	if Prestige > 0 then
		local NeedMinLevel = GoosTable.NeedMinLevel
		local NeedMaxLevel = GoosTable.NeedMaxLevel
		local PointPrestigeBelv = GoosTable.PointPrestigeBelv
		local FreePrestigeBelv = GoosTable.FreePrestigeBelv
		local PointPrestige = PointPrestigeBelv * Prestige
		local FreePrestige = FreePrestigeBelv * Prestige
		local NeedOpenPoint = GoosTable.NeedOpenPoint
		local NeedAgainPoint = GoosTable.NeedAgainPoint
		local FreeOpenNum = GoosTable.FreeOpenNum
		local FuKongDaoShengWang = API_VarDataGetNumber(ActorID,1,GLOBAL_FuKongDaoShengWang)
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
			API_ResponseWrite('<text>等级超过 </text><text color="255,0,255">'.. GLOBAL_Exploit[NeedMaxLevel].PeerageDepict ..'</text><text> 后不能再拆开这封密函，请去寻找更高级的功勋密函！</text><br><br>')
			API_ResponseWrite('<br><a>我明白了</a><br>')
		elseif SelectItem == 1 then
			if NeedOpenPoint > Point then
				API_ResponseWrite('<text>自由拆开功勋密函需要消耗 </text><text color="255,0,255">'..NeedOpenPoint..'</text><text> 点券，您目前只有 </text><text color="255,0,255">'..Point..'</text><text> 点券，请先通过选择“去官网充值点券”或“去交易所用金币购买点券”得到足够数量的点券后，再来选择以“自由拆开密函”的方式开启功勋密函</text><br><br>')
				API_ResponseWrite('<br><a http="http://pay.21mmo.com/" closewindow="0">去官网充值点券</a><br>')
				API_ResponseWrite('<br><a href="DianQuanHuanJinBi_OpenBourse?1=2" closewindow="0">去交易所用金币购买点券</a><br>')
				API_ResponseWrite('<br><a tip="<text size=\'14\' color=\'0,255,0\'>自由开密函需要消耗：</text>\n<img sc=\'57004\' frame=\'1\' Delay=\'200\' type=\'2\'>点券 X '..NeedOpenPoint..'\n浮空岛声望 X '..PointPrestige..'" href="GongXunMiHan_OpenMiHan?1=1&2='..GoodsID..'">自由拆开密函</a><text>  [消耗 '..PointPrestige..' 点“浮空岛声望”和 '..NeedOpenPoint..' 点券]</text><br>')
			--	API_ResponseWrite('<br><a>取消</a><br>')
			elseif FuKongDaoShengWang < PointPrestige then
				API_ResponseWrite('<text>开启这封密函需要 </text><text color="255,0,255">'..PointPrestige..'</text><text> 点“浮空岛声望”，您目前只有 </text><text color="255,0,255">'..FuKongDaoShengWang..'</text><text> 点“浮空岛声望”，请先去参加各个浮空岛的战斗获得“浮空岛声望”！</text><br><br>')
				API_ResponseWrite('<br><a tip="<text size=\'14\' color=\'0,255,0\'>自由开密函需要消耗：</text>\n<img sc=\'57004\' frame=\'1\' Delay=\'200\' type=\'2\'>点券 X '..NeedOpenPoint..'\n浮空岛声望 X '..PointPrestige..'" href="GongXunMiHan_OpenMiHan?1=1&2='..GoodsID..'">自由拆开密函</a><text>  [消耗 '..PointPrestige..' 点“浮空岛声望”和 '..NeedOpenPoint..' 点券]</text><br>')
				API_ResponseWrite('<br><a>取消</a><br>')
			else
				if API_UsePoint(ActorID,3,GoodsID,1,NeedOpenPoint) == 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'点券开密函') then
					FuKongDaoShengWang = FuKongDaoShengWang - PointPrestige
					API_VarDataSetNumber(ActorID,1,GLOBAL_FuKongDaoShengWang,FuKongDaoShengWang)
					API_ActorSendMsg(ActorID,2,'自由开启功勋密函，消耗'..NeedOpenPoint..'点券和'..PointPrestige..'和浮空岛声望')
					API_ActorSendMsg(ActorID,7,'自由开启功勋密函，消耗'..NeedOpenPoint..'点券和'..PointPrestige..'和浮空岛声望')
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
					API_OpenIconTiger(ActorID,TigerID,FinishLoc,'点“再来一次”需要消耗'..NeedAgainPoint..'点券','GongXunMiHan_IconTigerAgainFunc','GongXunMiHan_IconTigerPickFunc',16,RewardTable)
					API_ActorSendMsg(ActorID,2,'打开功勋密函，幸运大抽奖：幸运转轮开始转动，祝您好运！')
					API_ActorSendMsg(ActorID,2,'如果您对本次抽奖结果不满意，可以点击“再来一次”按钮获得重新摇奖的机会')
				end
			end
		elseif SelectItem == 2 then
			if TodayLingjiangNum > FreeOpenNum then
				API_ResponseWrite('<text>每天允许免点券开 </text><text color="255,0,255">'..FreeOpenNum..'</text><text> 次功勋密函，您今天已经不能再免点券开功勋密函了，请选择以“自由拆开密函”的方式开启功勋密函</text><br><br>')
				API_ResponseWrite('<br><a tip="<text size=\'14\' color=\'0,255,0\'>自由开密函需要消耗：</text>\n<img sc=\'57004\' frame=\'1\' Delay=\'200\' type=\'2\'>点券 X '..NeedOpenPoint..'\n浮空岛声望 X '..PointPrestige..'" href="GongXunMiHan_OpenMiHan?1=1&2='..GoodsID..'">自由拆开密函</a><text>  [消耗 '..PointPrestige..' 点“浮空岛声望”和 '..NeedOpenPoint..' 点券]</text><br>')
				API_ResponseWrite('<br><a>取消</a><br>')
			elseif FuKongDaoShengWang < FreePrestige then
				API_ResponseWrite('<text>开启这封密函需要 </text><text color="255,0,255">'..FreePrestige..'</text><text> 点“浮空岛声望”，您目前只有 </text><text color="255,0,255">'..FuKongDaoShengWang..'</text><text> 点“浮空岛声望”，请先去参加各个浮空岛的战斗获得“浮空岛声望”！</text><br><br>')
				API_ResponseWrite('<br><a tip="<text size=\'14\' color=\'0,255,0\'>自由开密函需要消耗：</text>\n<img sc=\'57004\' frame=\'1\' Delay=\'200\' type=\'2\'>点券 X '..NeedOpenPoint..'\n浮空岛声望 X '..PointPrestige..'" href="GongXunMiHan_OpenMiHan?1=1&2='..GoodsID..'">自由拆开密函</a><text>  [消耗 '..PointPrestige..' 点“浮空岛声望”和 '..NeedOpenPoint..' 点券]</text><br>')
				API_ResponseWrite('<br><a>取消</a><br>')
			else
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'限次开密函') then
					API_VarDataSetNumber(ActorID,1,GongXunMiHan_LastTime,Biaozhi)
					API_VarDataSetNumber(ActorID,1,GongXunMiHan_LingjiangNum,TodayLingjiangNum)
					FuKongDaoShengWang = FuKongDaoShengWang - FreePrestige
					API_VarDataSetNumber(ActorID,1,GLOBAL_FuKongDaoShengWang,FuKongDaoShengWang)
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
					API_OpenIconTiger(ActorID,TigerID,FinishLoc,'点“再来一次”需要消耗'..NeedAgainPoint..'点券','GongXunMiHan_IconTigerAgainFunc','GongXunMiHan_IconTigerPickFunc',16,RewardTable)
					API_ActorSendMsg(ActorID,2,'打开功勋密函，幸运大抽奖：幸运转轮开始转动，祝您好运！')
					API_ActorSendMsg(ActorID,2,'如果您对本次抽奖结果不满意，可以点击“再来一次”按钮获得重新摇奖的机会')
				end
			end
		end
	end
end

function GongXunMiHan_IconTigerAgainFunc()
	local ActorID = API_RequestGetActorID()
	local TigerID = API_RequestGetNumber(1)
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
		local JiangPingGoosID = GoosTable.GoosID
		local NumMin = GoosTable.NumMin
		local NumMax = GoosTable.NumMax
		local Danwei = GoosTable.Danwei
		local Peerage = GoosTable.PrestigePeerage
		local Prestige = GLOBAL_PrestigeCriterion[Peerage]
		local NeedMinLevel = GoosTable.NeedMinLevel
		local NeedMaxLevel = GoosTable.NeedMaxLevel
		local PointPrestigeBelv = GoosTable.PointPrestigeBelv
		local FreePrestigeBelv = GoosTable.FreePrestigeBelv
		local PointPrestige = PointPrestigeBelv * Prestige
		local FreePrestige = FreePrestigeBelv * Prestige
		local NeedOpenPoint = GoosTable.NeedOpenPoint
		local NeedAgainPoint = GoosTable.NeedAgainPoint
		local FreeOpenNum = GoosTable.FreeOpenNum
		local FuKongDaoShengWang = API_VarDataGetNumber(ActorID,1,GLOBAL_FuKongDaoShengWang)
		local Point = API_ActorGetPropNum(ActorID,183)
		local RewardTable = GoosTable.List
		
		local FinishLoc = API_VarDataGetNumber(ActorID,1,18262)
		local JiangPingGoodsID = RewardTable[FinishLoc*2-1]
		local JiangPingGoodsNum = RewardTable[FinishLoc*2]
		if JiangPingGoodsID == nil or JiangPingGoodsNum == nil or JiangPingGoodsID <= 0 or JiangPingGoodsNum <= 0 then
			return
		end
		if Point > NeedAgainPoint then
			if API_UsePoint(ActorID,3,GoodsID*10000,1,NeedAgainPoint) == 0 then
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
				API_OpenIconTiger(ActorID,TigerID,FinishLoc,'点“再来一次”需要消耗'..NeedAgainPoint..'点券','GongXunMiHan_IconTigerAgainFunc','GongXunMiHan_IconTigerPickFunc',16,RewardTable)
				API_ActorSendMsg(ActorID,2,'打开功勋密函，幸运大抽奖：幸运转轮再一次开始转动，祝您好运！')
				API_ActorSendMsg(ActorID,2,'如果您对本次抽奖结果不满意，可以点击“再来一次”按钮获得重新摇奖的机会')
				API_ActorSendMsg(ActorID,9,'您使用'..NeedAgainPoint..'点券让轮盘重新开始转动，祝您好运！')
			end
		else
			API_ActorSendMsg(ActorID,9,'再来一次需要'..NeedAgainPoint..'点券')
			return
		end
	end
end

function GongXunMiHan_IconTigerPickFunc()
	local ActorID = API_RequestGetActorID()
	local TigerID = API_RequestGetNumber(1)
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
			API_AddActorGoods(ActorID,JiangPingGoodsID,JiangPingGoodsNum,'功勋密函')
			API_ActorSendMsg(ActorID,2,'打开功勋密函得到：'..JiangPingGoodsNum..'个'..JiangPingGoodsName..'')
			API_ActorSendMsg(ActorID,7,'打开功勋密函得到：'..JiangPingGoodsNum..'个'..JiangPingGoodsName..'')
		else
			API_SendActorMail(ActorID,JiangPingGoodsID,JiangPingGoodsNum,'[功勋密函]奖励','获得'..JiangPingGoodsNum..'个'..JiangPingGoodsName..'')
			API_ActorSendMsg(ActorID,2,'打开功勋密函得到：'..JiangPingGoodsNum..'个'..JiangPingGoodsName..'（请到邮箱领取）')
			API_ActorSendMsg(ActorID,7,'打开功勋密函得到：'..JiangPingGoodsNum..'个'..JiangPingGoodsName..'（请到邮箱领取）')
		end
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
--			API_ActorMsgBoard(0,RightMapID,-1,'去机奴巢穴消灭机奴族可获得功勋密函！                                             拆开功勋密函可以获得大量功勋')
--			API_ActorMsgBoard(0,RightMapID,-1,'现在去机奴巢穴消灭机奴族可以获得功勋密函                                         拆开功勋密函可以获得大量功勋')
--		end
--	end
--end
