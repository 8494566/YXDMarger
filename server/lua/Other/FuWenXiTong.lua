----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\FuWenXiTong.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2010-3-29
--版  本:	1.0
--描  述:	符文系统
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：张春明
--日期：2010-3-29
--功能：创建
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------




FWXT_FuWenInfoList = {
	[1] = {
			Name = '生命符文', 
			Icon = {Open = 2341,Close = 2337},
			GaiLv = 24,
			StatusIDList = {
							[1] = {Min = 934001, Max = 934010},
							[2] = {Min = 934161, Max = 934170},
							},
			},
			
	[2] = {
			Name = '能量符文', 
			Icon = {Open = 2343,Close = 2339},
			GaiLv = 34,
			StatusIDList = {
							[1] = {Min = 934011, Max = 934020},
							[2] = {Min = 934171, Max = 934180},
							},
			},
	
	[3] = {
			Name = '巨人符文', 
			Icon = {Open = 2343,Close = 2339},
			GaiLv = 44,
			StatusIDList = {
							[1] = {Min = 934021, Max = 934030},
							},
			},
			
	[4] = {
			Name = '豹纹符文', 
			Icon = {Open = 2342,Close = 2338},
			GaiLv = 46,
			ColdTime = 60,
			CDTOwnID= -2000,
			CDTimeKey = 35,
			StatusIDList = {
							[1] = {Min = 934071, Max = 934080},
							[2] = {Min = 934151, Max = 934160},
							},
			},
	[5] = {
			Name = '盾芒符文', 
			Icon = {Open = 2336,Close = 2340},
			GaiLv = 52,
			StatusIDList = {
							[1] = {Min = 934061, Max = 934070},
							[2] = {Min = 934141, Max = 934150},
							},
			},
			
	[6] = {
			Name = '魔导符文', 
			Icon = {Open = 2343,Close = 2339},
			GaiLv = 62,
			StatusIDList = {
							[1] = {Min = 934031, Max = 934040},
							[2] = {Min = 934111, Max = 934120},
							},
			},
			
	[7] = {
			Name = '哨兵符文', 
			Icon = {Open = 2343,Close = 2339},
			GaiLv = 72,
			StatusIDList = {
							[1] = {Min = 934041, Max = 934050},
							[2] = {Min = 934121, Max = 934130},
							},
			},
			
	[8] = {
			Name = '勇士符文', 
			Icon = {Open = 2343,Close = 2339},
			GaiLv = 82,
			StatusIDList = {
							[1] = {Min = 934051, Max = 934060},
							[2] = {Min = 934131, Max = 934140},
							},
			},
			
	[9] = {
			Name = '敌法符文', 
			Icon = {Open = 2336,Close = 2340},
			GaiLv = 88,
			StatusIDList = {
							[1] = {Min = 934081, Max = 934090},
							},
			},
			
	[10] = {
			Name = '禁火符文', 
			Icon = {Open = 2336,Close = 2340},
			GaiLv = 94,
			StatusIDList = {
							[1] = {Min = 934091, Max = 934100},
							},
			},
			
	[11] = {
			Name = '戒律符文', 
			Icon = {Open = 2336,Close = 2340},
			GaiLv = 100,
			StatusIDList = {
							[1] = {Min = 934101, Max = 934110},
							},
			},
			
	--随机种子
	RandomNum = 100,
	--符文物品ID
	GoodsID = 39601,
	--最多同时打开数量
	MaxOpen = 2,
	--充值所需点券
	ChongZhiNeedOpenPoint = 10,
	--每次充值时间，单位秒,一个月等于2592000秒
	ChongZhiTime = 172800,
	--绑定符文的充值时间
	BindChongZhiTime = 21600,
}





--使用符文卷轴,生成符文
function FWXT_FuWenJuanZhou_GoodsCallFunc(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if GoodsID ~= 88910 then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_ActorGetPackageSize(ActorID) >= 1 then
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用符文卷轴') then
			local FuWenGoodsID = FWXT_FuWenInfoList.GoodsID
			local RandomNum = FWXT_FuWenInfoList.RandomNum
			local NowRandom = math.random(RandomNum)
			for i = 1 , table.getn(FWXT_FuWenInfoList) do
				local GoosTable = FWXT_FuWenInfoList[i]
				if NowRandom <= GoosTable.GaiLv and (GoosTable.ColdTime == nil or os.time() >= API_VarDataGetNumber_Ex(1,0,GoosTable.CDTOwnID,1,GoosTable.CDTimeKey)) then
					--获得随机属性表
					local StatusIDTable = {}
					for i,v in GoosTable.StatusIDList do
						local StatusID = math.random(v.Min,v.Max)
						table.insert(StatusIDTable,StatusID)
					end
					--获得物品图标
					local Icon = GoosTable.Icon.Close
					--获得物品名称
					local Name = GoosTable.Name
					--添加物品
					local UID = API_AddActorGoodsPropRetUID(ActorID,FuWenGoodsID,1,0,'获得'..Name..'',-1,-1)
					local BagType,Loc = API_GetUIDGoodsInActor(UID,ActorID)
					Loc = Loc + 1
					if API_ActorGetGoodsPropNum(ActorID,BagType,Loc,0) == FuWenGoodsID and API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,10) == 0 then
						--设置符文名称
						API_ActorMeMScrollSetString(ActorID,BagType,Loc,1,Name)
						--设置符文图标
						API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,5,Icon)
						--设置符文状态
						API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,9,0)
						--存储符文类型
						API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,10,i)
						--添加属性
						for j = 1,math.min(table.getn(StatusIDTable),4) do
							local StatusID = StatusIDTable[j]
							API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,j,StatusID)
						--	API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,j,810001)
						end
						API_ActorSendMsg(ActorID,0,'您获得了'..Name..'')
						API_ActorSendMsg(ActorID,7,'您获得了'..Name..'')
					end
					--记录CD
					if GoosTable.ColdTime ~= nil then
						local Time = os.time() + 60 
						API_VarDataSetNumber_Ex_Sync(1,0,GoosTable.CDTOwnID,1,GoosTable.CDTimeKey,Time) 
						API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'获得了'..Name..'')
					end
					--记录风向标
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[47][i][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[47][i][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[47][i][LaiYuan] = GLOBAL_FengXiangBiao_DateList[47][i][LaiYuan] + 1
					end
					break
				end
			end
			return 1
		end
	else
		API_ActorSendMsg(ActorID,0,'您的背包已满，请整理一下背包再试试吧')
		return 0
	end
	return 1
end


--使用符文，进行打开关闭充值操作
function FWXT_FuWen_GoodsCallFunc(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if FWXT_FuWenInfoList.GoodsID ~= GoodsID then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local UID = API_GetUID(High,Low)
	local BagType,Loc = API_GetUIDGoodsInActor(UID,ActorID)
	if BagType == -1 or Loc == -1 then
		return 0
	end
	Loc = Loc + 1
	if API_ActorGetGoodsPropNum(ActorID,BagType,Loc,0) ~= GoodsID then
		return 0
	end
	--判断是否过期
	local Name = API_ActorMeMScrollGetString(ActorID,BagType,Loc,1)
	API_ResponseWrite('<name>'..Name..'</name>')
	API_ResponseWrite('<win rect="600,200,330,220"></win>') 
	local RemainTime = API_ActorGetGoodsRemainTime(ActorID,BagType,Loc)
	if RemainTime > 0 then
		local ShengYuTian = math.ceil(RemainTime / 86400)
		if API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,9) == 0 then
			--判断已打开符文数量
			local BagTypeList = {[1]=0,[2]=3,[3]=4,[4]=5,[5]=6,}
			local YiDaKai = 0
			for i,v in BagTypeList do
				if i == 1 or API_ActorIsHaveBag(ActorID, i - 1 ) then
					for j = 1, API_ActorGetBagSize(ActorID, i - 1 ) do
						if API_ActorGetGoodsPropNum(ActorID,v,j,0) == FWXT_FuWenInfoList.GoodsID then
							if API_ActorMeMScrollGetNumber(ActorID,v,j,9) == 1 then
								YiDaKai = YiDaKai + 1
							end
						end
					end
				end
			end
			if YiDaKai >= FWXT_FuWenInfoList.MaxOpen then
				API_ResponseWrite('<br><text color="255,0,255">最多只允许同时开启 '.. FWXT_FuWenInfoList.MaxOpen ..' 个符文 ！</text><br>')
				API_ResponseWrite('<br><text>请先关闭其他符文之后再来开启'..Name..'</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			else
				API_ResponseWrite('<br><text color="255,0,255">您的'..Name..'尚未开启 ！</text><br>')
				API_ResponseWrite('<br><text>开启后你可以获得'..Name..'上的属性加成</text><br>')
				API_ResponseWrite('<br><text>每颗符文第一次开启后将绑定并且开始持续计时（关闭也不停止计时）</text><br>')
				API_ResponseWrite('<br><a href="FWXT_FuWen_ChaoZhuo?1=1&2='..High..'&3='..Low..'">开启符文</a><br>')
				if ShengYuTian < 366 and API_ActorGetGoodsPropNum(ActorID,BagType,Loc,4) ~= 0 then
					API_ResponseWrite('<br><a href="FWXT_FuWen_ChaoZhuo?1=3&2='..High..'&3='..Low..'">续时符文时间</a><br>')
				end
				API_ResponseWrite('<br><a>取消</a><br>')
			end
		else
			API_ResponseWrite('<br><text color="0,255,0">您的'..Name..'已经开启 ！</text><br>')
			API_ResponseWrite('<br><text>您目前已经获得'..Name..'上的属性加成</text><br>')
			API_ResponseWrite('<br><text>如果您选择关闭符文，将取消属性加成，并且符文使用时间仍然计时</text><br>')
			API_ResponseWrite('<br><a href="FWXT_FuWen_ChaoZhuo?1=2&2='..High..'&3='..Low..'">关闭符文</a><br>')
			if ShengYuTian < 366 and API_ActorGetGoodsPropNum(ActorID,BagType,Loc,4) ~= 0 then
				API_ResponseWrite('<br><a href="FWXT_FuWen_ChaoZhuo?1=3&2='..High..'&3='..Low..'">续时符文时间</a><br>')
			end
			API_ResponseWrite('<br><a>取消</a><br>')
		end
	else
		--判断是否关闭状态，没有关闭则关闭
		FWXT_FuWen_Close(ActorID,BagType,Loc)
		API_ResponseWrite('<br><text color="255,0,0">您的'..Name..'已经过期 ！</text><br>')
		API_ResponseWrite('<br><text>请先在下面框中</text><text color="255,0,255">放入其他任意符文</text><text>为本符文续时后再使用</text><br>')
		API_ResponseWrite('<text>每枚未绑定符文可续时'.. math.floor(FWXT_FuWenInfoList.ChongZhiTime/3600) ..'小时；绑定符文可续时'.. math.floor(FWXT_FuWenInfoList.BindChongZhiTime/3600) ..'小时</text><br>')
		API_ResponseWrite('<text>      </text><goodsHolder name="100"><br>')
		API_ResponseWrite('<br><a href="FWXT_FuWen_ChaoZhuo?1=3&2='..High..'&3='..Low..'">续时符文时间</a><br>')
		API_ResponseWrite('<br><a>取消</a><br>')
	end
	API_ResponseFlush(ActorID)
	return 1
end

function FWXT_FuWen_ChaoZhuo()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local High =  API_RequestGetNumber(2)
	local Low =  API_RequestGetNumber(3)
	local UID = API_GetUID(High,Low)
	local BagType,Loc = API_GetUIDGoodsInActor(UID,ActorID)
	if BagType == -1 or Loc == -1 then
		return 0
	end
	Loc = Loc + 1
	local GoodsID = API_ActorGetGoodsPropNum(ActorID,BagType,Loc,0)
	if GoodsID ~= FWXT_FuWenInfoList.GoodsID then
		return
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		return 
	end
	local Name = API_ActorMeMScrollGetString(ActorID,BagType,Loc,1)
	API_ResponseWrite('<name>'..Name..'</name>')
	API_ResponseWrite('<win rect="600,200,330,220"></win>') 
	if SelectItem == 1 then
		local RemainTime = API_ActorGetGoodsRemainTime(ActorID,BagType,Loc)
		if RemainTime > 0 then
			if FWXT_FuWen_Open(ActorID,BagType,Loc) == 1 then
				API_ResponseWrite('<br><text color="0,255,0">'..Name..'开启成功 ！</text><br>')
				API_ResponseWrite('<br><text>您目前已经获得'..Name..'上的属性加成</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		else
			FWXT_FuWen_Close(ActorID,BagType,Loc)
			API_ResponseWrite('<br><text color="255,0,0">您的'..Name..'已经过期 ！</text><br>')
			API_ResponseWrite('<br><text>请先在下面框中</text><text color="255,0,255">放入其他任意符文</text><text>为本符文续时后再使用</text><br>')
			API_ResponseWrite('<text>每枚未绑定符文可续时'.. math.floor(FWXT_FuWenInfoList.ChongZhiTime/3600) ..'小时；绑定符文可续时'.. math.floor(FWXT_FuWenInfoList.BindChongZhiTime/3600) ..'小时</text><br>')
			API_ResponseWrite('<text>      </text><goodsHolder name="100"><br>')
			API_ResponseWrite('<br><a href="FWXT_FuWen_ChaoZhuo?1=3&2='..High..'&3='..Low..'">续时符文时间</a><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
		end
	elseif SelectItem == 2 then
		if FWXT_FuWen_Close(ActorID,BagType,Loc) == 1 then
			API_ResponseWrite('<br><text color="255,0,255">'..Name..'关闭成功 ！</text><br>')
			API_ResponseWrite('<br><text>'..Name..'上的属性加成已经取消，符文计时仍然继续</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	elseif SelectItem == 3 then
		local CZHigh = API_RequestGetNumber(100)--高位UID
		local CZLow = API_RequestGetNumber(1100)--低位UID
		local CZUID = API_GetUID(CZHigh,CZLow)
		
		local CLBagType,CLLoc = API_GetUIDGoodsInActor(CZUID,ActorID)
		if CLBagType == -1 or CLLoc == -1 then
			API_ResponseWrite('<br><text>续时需要消耗</text><text color="255,0,255">一枚任意符文</text><text>，每枚未绑定符文可续时'.. math.floor(FWXT_FuWenInfoList.ChongZhiTime/3600) ..'小时；绑定符文可续时'.. math.floor(FWXT_FuWenInfoList.BindChongZhiTime/3600) ..'小时</text><br>')
			API_ResponseWrite('<br><text>请先在下面框中</text><text color="255,0,255">放入其他任意符文</text><text>为本符文续时</text><br>')
			API_ResponseWrite('<text>      </text><goodsHolder name="100"><br>')
			API_ResponseWrite('<br><a href="FWXT_FuWen_ChaoZhuo?1=3&2='..High..'&3='..Low..'">续时符文时间</a><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
			return
		end
		
		CLLoc = CLLoc + 1
		
		if API_ActorGetGoodsPropNum(ActorID,CLBagType,CLLoc,0) ~= FWXT_FuWenInfoList.GoodsID then
			API_ResponseWrite('<br><text>您放入的物品</text><text color="255,0,0">不是</text><text>符文</text><br>')
			API_ResponseWrite('<br><text>请先在下面框中</text><text color="255,0,255">放入其他任意符文</text><text>为本符文续时</text><br>')
			API_ResponseWrite('<text>每枚未绑定符文可续时'.. math.floor(FWXT_FuWenInfoList.ChongZhiTime/3600) ..'小时；绑定符文可续时'.. math.floor(FWXT_FuWenInfoList.BindChongZhiTime/3600) ..'小时</text><br>')
			API_ResponseWrite('<text>      </text><goodsHolder name="100"><br>')
			API_ResponseWrite('<br><a href="FWXT_FuWen_ChaoZhuo?1=3&2='..High..'&3='..Low..'">续时符文时间</a><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
			return
		end
		
		if API_ActorMeMScrollGetNumber(ActorID,CLBagType,CLLoc,9) ~= 0 then
			API_ResponseWrite('<br><text>请放入</text><text color="255,0,0">未开启</text><text>符文</text><br>')
			API_ResponseWrite('<br><text>请先在下面框中</text><text color="255,0,255">放入其他未开启任意符文</text><text>为本符文续时</text><br>')
			API_ResponseWrite('<text>每枚未绑定符文可续时'.. math.floor(FWXT_FuWenInfoList.ChongZhiTime/3600) ..'小时；绑定符文可续时'.. math.floor(FWXT_FuWenInfoList.BindChongZhiTime/3600) ..'小时</text><br>')
			API_ResponseWrite('<text>      </text><goodsHolder name="100"><br>')
			API_ResponseWrite('<br><a href="FWXT_FuWen_ChaoZhuo?1=3&2='..High..'&3='..Low..'">续时符文时间</a><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
			return
		end
		
		if BagType == CLBagType and Loc == CLLoc then
			API_ResponseWrite('<br><text>请放入</text><text color="255,0,0">其他</text><text>符文</text><br>')
			API_ResponseWrite('<br><text>请先在下面框中</text><text color="255,0,255">放入其他任意符文</text><text>为本符文续时</text><br>')
			API_ResponseWrite('<text>每枚未绑定符文可续时'.. math.floor(FWXT_FuWenInfoList.ChongZhiTime/3600) ..'小时；绑定符文可续时'.. math.floor(FWXT_FuWenInfoList.BindChongZhiTime/3600) ..'小时</text><br>')
			API_ResponseWrite('<text>      </text><goodsHolder name="100"><br>')
			API_ResponseWrite('<br><a href="FWXT_FuWen_ChaoZhuo?1=3&2='..High..'&3='..Low..'">续时符文时间</a><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
			return
		end
		
--		if API_ActorGetGoodsPropNum(ActorID,CLBagType,CLLoc,4) ~= 0 then
--			API_ResponseWrite('<br><text>放入的物品必须是</text><text color="255,0,0">未绑定</text><text>的符文</text><br>')
--			API_ResponseWrite('<br><text>请先在下面框中</text><text color="255,0,255">放入其他任意未绑定符文</text><text>为本符文续时</text><br>')
--			API_ResponseWrite('<text>      </text><goodsHolder name="100"><br>')
--			API_ResponseWrite('<br><a href="FWXT_FuWen_ChaoZhuo?1=3&2='..High..'&3='..Low..'">续时符文时间</a><br>')
--			API_ResponseWrite('<br><a>取消</a><br>')
--			return
--		end
		
--		--获取所需点券
--		local ChongZhiNeedOpenPoint = FWXT_FuWenInfoList.ChongZhiNeedOpenPoint
--		--获取玩家身上的点券数量
--		local Point = API_ActorGetPropNum(ActorID,183)
--		if Point < ChongZhiNeedOpenPoint then
--			API_ResponseWrite('<text>每次充值需要 </text><text color="255,0,255">'..ChongZhiNeedOpenPoint..'</text><text> 点券，您目前只有 </text><text color="255,0,255">'..Point..'</text><text> 点券，请先通过选择“去官网充值点券”或“去交易所用金币购买点券”得到足够数量的点券后，再来充值符文时间</text><br><br>')
--			API_ResponseWrite('<br><a http="http://yxd.21mmo.com/pay/pay.html" closewindow="0">去官网充值点券</a><br>')
--			API_ResponseWrite('<br><a href="DianQuanHuanJinBi_OpenBourse?1=2" closewindow="0">去交易所用金币购买点券</a><br>')
--			API_ResponseWrite('<br><a href="FWXT_FuWen_Open?1=2&2='..BagType..'&3='..Loc..'">充值符文时间</a><br>')
--			API_ResponseWrite('<br><a>取消</a><br>')
--			return 
--		end
		local ChongZhiTian = math.floor(FWXT_FuWenInfoList.ChongZhiTime/3600)
		if API_ActorGetGoodsPropNum(ActorID,CLBagType,CLLoc,4) ~= 0 then
			ChongZhiTian = math.floor(FWXT_FuWenInfoList.BindChongZhiTime/3600)
		end
		if FWXT_FuWen_ChongZhi(ActorID,BagType,Loc,CLBagType,CLLoc) == 1 then
			
			local RemainTime = API_ActorGetGoodsRemainTime(ActorID,BagType,Loc)
			local ShengYuTian = math.ceil(RemainTime / 86400)
			API_ResponseWrite('<br><text color="255,0,255">'..Name..'续时 '..ChongZhiTian..'小时 使用时间成功 ！</text><br>')
			API_ResponseWrite('<br><text>您的'..Name..'还可以继续使用 '..ShengYuTian..' 天</text><br>')
			if API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,9) == 0 then
				API_ResponseWrite('<br><a href="FWXT_FuWen_ChaoZhuo?1=1&2='..High..'&3='..Low..'">开启符文</a><br>')
			end
			API_ResponseWrite('<br><a>确定</a><br>')
			--记录风向标
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[47][1000][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[47][1000][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[47][1000][LaiYuan] = GLOBAL_FengXiangBiao_DateList[47][1000][LaiYuan] + 1
			end
		end
	end
end

--开启
function FWXT_FuWen_Open(ActorID,BagType,Loc,OnLogin)
	local GoodsID = API_ActorGetGoodsPropNum(ActorID,BagType,Loc,0)
	if GoodsID ~= FWXT_FuWenInfoList.GoodsID then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		return 0
	end
	local RemainTime = API_ActorGetGoodsRemainTime(ActorID,BagType,Loc)
	if RemainTime <= 0 then
		return 0
	end
	--判断已打开符文数量
	if OnLogin == nil then
		local BagTypeList = {[1]=0,[2]=3,[3]=4,[4]=5,[5]=6,}
		local YiDaKai = 0
		for i,v in BagTypeList do
			if i == 1 or API_ActorIsHaveBag(ActorID, i - 1 ) then
				for j = 1,API_ActorGetBagSize(ActorID,i - 1) do
					if API_ActorGetGoodsPropNum(ActorID,v,j,0) == FWXT_FuWenInfoList.GoodsID then
						if API_ActorMeMScrollGetNumber(ActorID,v,j,9) == 1 then
							YiDaKai = YiDaKai + 1
						end
					end
				end
			end
		end
		if YiDaKai >= FWXT_FuWenInfoList.MaxOpen then
			return 0
		end
	end
	--获取符文类型
	local FuWenID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,10)
	--设置物品绑定
	if API_ActorGetGoodsPropNum(ActorID,BagType,Loc,4) == 0 then
		API_ActorBindGoods(ActorID,BagType,Loc,3)
	end
	--获取符文开启图标
	if FWXT_FuWenInfoList[FuWenID] ~= nil then
		local Icon = FWXT_FuWenInfoList[FuWenID].Icon.Open
		--设置符文图标
		API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,5,Icon)
	end
	
	--设置符文状态
	if API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,9) == 0 or OnLogin == 1 then
		API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,9,1)
		--给玩家添加状态
		for i = 1 , 4 do
			local StatusID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,i)
			if StatusID > 0 then
				API_ActorAddStatus(ActorID,StatusID,-1)
			end
		end
	end
	return 1
end


--关闭
function FWXT_FuWen_Close(ActorID,BagType,Loc)
	local GoodsID = API_ActorGetGoodsPropNum(ActorID,BagType,Loc,0)
	if GoodsID ~= FWXT_FuWenInfoList.GoodsID then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		return 0
	end
	--获取符文类型
	local FuWenID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,10)
	
	--给玩家清除状态
	for i = 1 , 4 do
		local StatusID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,i)
		if StatusID > 0 then
			API_ActorRemoveStatus(ActorID,StatusID)
		end
	end
	--设置符文状态
	API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,9,0)
	--获取符文关闭图标
	if FWXT_FuWenInfoList[FuWenID] ~= nil then
		local Icon = FWXT_FuWenInfoList[FuWenID].Icon.Close
		--设置符文图标
		API_ActorMeMScrollSetNumber(ActorID,BagType,Loc,5,Icon)
	end
	return 1
end


--续时
function FWXT_FuWen_ChongZhi(ActorID,BagType,Loc,CLBagType,CLLoc)
	local GoodsID = API_ActorGetGoodsPropNum(ActorID,BagType,Loc,0)
	if GoodsID ~= FWXT_FuWenInfoList.GoodsID then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		return 0
	end
	local CLGoodsID = API_ActorGetGoodsPropNum(ActorID,CLBagType,CLLoc,0)
	if CLGoodsID ~= FWXT_FuWenInfoList.GoodsID then
		return 0
	end
	if BagType == CLBagType and Loc == CLLoc then
		return 0
	end
	local ChongZhiTime = FWXT_FuWenInfoList.ChongZhiTime
	if API_ActorGetGoodsPropNum(ActorID,CLBagType,CLLoc,4) ~= 0 then
		ChongZhiTime = FWXT_FuWenInfoList.BindChongZhiTime
	end
--	--获取所需点券
--	local ChongZhiNeedOpenPoint = FWXT_FuWenInfoList.ChongZhiNeedOpenPoint
--	--获取玩家身上的点券数量
--	local Point = API_ActorGetPropNum(ActorID,183)
--	if Point < ChongZhiNeedOpenPoint then
--		return 0
--	end
--	if API_UsePoint(ActorID,3,GoodsID,1,ChongZhiNeedOpenPoint) == 0 then
	CLLoc = CLLoc - 1
	if API_ActorRemoveGoodsOfLoc(ActorID,CLGoodsID,1,CLBagType,CLLoc,'续时删除') then
		
		if API_ActorAddGoodsRemainTime(ActorID,BagType,Loc,ChongZhiTime) then
			return 1
		else
			return 0
		end
	else
		return 0
	end
	return 1
end


--上线处理，遍历背包查询未到期且打开状态的符石，加状态
function FWXT_OnLogin()
	local ActorID = API_RequestGetActorID()
	local BagTypeList = {[1]=0,[2]=3,[3]=4,[4]=5,[5]=6,}
	local YiDaKai = 0
	for i,v in BagTypeList do
		if i == 1 or API_ActorIsHaveBag(ActorID, i - 1 ) then
			for j = 1,API_ActorGetBagSize(ActorID,i - 1) do
				if API_ActorGetGoodsPropNum(ActorID,v,j,0) == FWXT_FuWenInfoList.GoodsID then
					if API_ActorMeMScrollGetNumber(ActorID,v,j,9) == 1 then
						if YiDaKai < 2 then
							if FWXT_FuWen_Open(ActorID,v,j,1) == 1 then
								YiDaKai = YiDaKai + 1
							end
						else
							FWXT_FuWen_Close(ActorID,v,j)
						end
					end
				end
			end
		end
	end
end

--丢弃回调
--返回1允许丢弃、返回0不允许丢弃
function FWXT_OnDropGoods(ActorID,GoodsID,BagType,Loc,High,Low)
	if GoodsID ~= FWXT_FuWenInfoList.GoodsID then
		return 1
	end
	local UID = API_GetUID(High,Low)
	local BagType,Loc = API_GetUIDGoodsInActor(UID,ActorID)
	if BagType == -1 or Loc == -1 then
		return 1
	end
	Loc = Loc + 1
	if API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,9) == 1 then
		if FWXT_FuWen_Close(ActorID,BagType,Loc) ~= 1 then
			return 0
		end
	end
	return 1
end
