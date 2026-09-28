----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\DiaoYuGongNeng.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2010-2-4
--版  本:	1.0
--描  述:	钓鱼功能
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：张春明
--日期：2010-2-4
--功能：创建
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

--//惩罚玩家，lUserID为账号ID，lActorID为惩罚玩家的ID，szDesc为惩罚的描述，szToActorMsg为发给被惩罚玩家的消息，可以是空字符串""，
--//lType为惩罚类型，1：踢下线，2：封号(会将玩家踢下线)，3：解封
--//                 lType为1时，4个参数保留，填0
--//                 lType为2时，lParam_1，封号的单位，0：天，1：分钟
--//                             lParam_2，封号的时间(单位见lParam_1)
--//                             lParam_3，0：本服封号，1：所有服封号
--//                             其余参数保留，填0
--//                 lType为3时，4个参数保留，填0
--bool API_ActorPunish(long lUserID, long lActorID, long lType, long lParam_1, long lParam_2, long lParam_3, long lParam_4, char *szDesc, char *szToActorMsg)

--目前数据库返回的单的数据有
--char szUser[32];	       //挂单用户的ID
--char szTrade[32];		//成交单的唯一ID
--char szServerName[16];	//游戏世界名字
--int nMoney;			//成交的金币数额
--int nRMB;			//成交的RMB数额，单位：元
--char chState;			//状态，2：下单后，未成交；3：成功交易；4：钓鱼成功；5：交易被取消；6：单被删除



--[[
--通过角色ID获取玩家的IP地址
--lActorID: 角色ID
char* API_GetActorIP(long lActorID);

--设置某个单据是否已经处理完
--lSerialID:流水号ID
--lIsProcessed:是否处理完成.1为完成,0为未完成
void API_Set5173RecordProcessed(long lSerialID, long lIsProcessed);

--通过流水号获取单据信息
--lSerialID: 流水号ID
API_Get5173TradeRecord(long lSerialID)
返回:
szUser(用户ID),
szTrade(交易单唯一ID),
szServerName(游戏世界名),
nMoney(游戏金币),
nRMB(人民币),
chState(状态)


--有单据新增,删除,状态更新都会回调此LUA接口
--lSerialID:流水号
--lState:单据状态. 2：下单后，未成交；3：成功交易；4：钓鱼成功；5：交易被取消；6：单被删除
DiaoYu_DBCallFunc(lSerialID, lState)
]]




if GLOBAL_DiaoYu_YiTongZhiList == nil then
	GLOBAL_DiaoYu_YiTongZhiList = {}
end
	
if GLOBAL_DiaoYu_XianYiRenList == nil then
	GLOBAL_DiaoYu_XianYiRenList = {}
end

--DB回调
function DiaoYu_DBCallFunc(OrderTradeID,OrderState)
	--判断单处于准备交易状态
	--获取单信息
	local OrderUserName,OrderTradeID1,OrderServerName,OrderMoney,OrderRMB,OrderState = API_Get5173TradeRecord(OrderTradeID)
	--建立是否已通知数据库
	if GLOBAL_DiaoYu_YiTongZhiList == nil then
		GLOBAL_DiaoYu_YiTongZhiList = {}
	end
	if (OrderRMB == nil) then
		OrderRMB = 0
	end
	if (OrderMoney == nil) then
		OrderMoney = 0
	end
	if GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID] == nil then
		GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID] = {}
		GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1] = {OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState}
	end
	local StateList = {[2]='下单后，未成交',[3]='成功交易',[4]='钓鱼成功',[5]='交易被取消',[6]='单被删除',}
	local StateCN = StateList[OrderState]
	if StateCN == nil then
		StateCN = '未知'
	end
	local Info = '交易单号：'..OrderTradeID..';挂单用户：'..OrderUserName..';'..OrderServerName..''..OrderMoney..'金 = '..OrderRMB..'元；当前状态：'..StateCN..''
	--发给渔夫
	for i,v in GLOBAL_DiaoYu_YuFuActorIDList do
		if API_ActorIsOnline(v) then
			API_ResponseWrite('<RequestOrder JYDH="'..OrderTradeID..'" GDYH="'..OrderUserName..'" YXSJ="'..OrderServerName..'" JYJE="'..OrderMoney..'" JZRMB="'..OrderRMB..'" JYZT="'..OrderState..'">'..Info..'</RequestOrder>')
			API_ResponseFlush(v)
		end
	end
	if OrderState == 2 then
		DiaoYu_MaxHeiJin = API_VarDataGetNumber_Ex(1,0,-104,1,1)
		DiaoYu_MinLevel = API_VarDataGetNumber_Ex(1,0,-104,1,2)
		
		if OrderMoney < DiaoYu_MaxHeiJin then
			
			--先查找本场景的满足条件的人
			DiaoYu_ChaZhaoXianYiRen(OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState)
			--跨服回调查找所有满足条件的人
			local KuaFuCanShu = {OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState}
			API_OpenRPC(-1,OrderTradeID,OrderMoney,1,6,KuaFuCanShu,'DiaoYu_ChaZhaoXianYiRen')
		else
			return
		end
	else
		local KuaFuCanShu = {OrderTradeID}
		--跨服回调删除单信息
		API_OpenRPC(-1,OrderTradeID,0,0,1,KuaFuCanShu,'DiaoYu_ClearDanInFo')
	end
end 

--收到单据通知
function DiaoYu_ChaZhaoXianYiRen(OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState)
	DiaoYu_MaxHeiJin = API_VarDataGetNumber_Ex(1,0,-104,1,1)
	DiaoYu_MinLevel = API_VarDataGetNumber_Ex(1,0,-104,1,2)
	--建立单据数据库
	if type(GLOBAL_DiaoYu_XianYiRenList) ~= 'table' then
		GLOBAL_DiaoYu_XianYiRenList = {}
	end
	if GLOBAL_DiaoYu_XianYiRenList[OrderTradeID] == nil then
		GLOBAL_DiaoYu_XianYiRenList[OrderTradeID] = {}
	end
	GLOBAL_DiaoYu_XianYiRenList[OrderTradeID][1] = {OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState}
--	API_ActorCallBack(-1,0,-1,'DiaoYu_ShouShenJianCha')
end

--检查英雄数量
function DiaoYu_GetHeroSkillInfo(ActorID)
	local Txt = ''
	for j in GLOBAL_HeroInfo do
		if string.len(Txt) > 230 then
			break
		end
		local HeroLv = epfunc_FH_SkillLvSum(ActorID, j)
		if HeroLv > 0 then
			local HeroName = GLOBAL_HeroInfo[j].HeroName
			Txt = Txt..''..HeroName..''..HeroLv..'级；'
		end
	end
	if string.len(Txt) > 0 then
		return Txt
	else
		return '这丫是新手'
	end
end

--检查生活技能等级
function DiaoYu_GetWorkSkillInfo(ActorID)
	local Txt = ''
	for i in GLOBAL_WorkSkillInfo do
		for j in GLOBAL_WorkSkillInfo[i] do
			if string.len(Txt) > 230 then
				break
			end
			local WorkLv = API_GetWorkSkillLevel(ActorID, j)
			if WorkLv > 1 then
				local SkillName = GLOBAL_WorkSkillInfo[i][j].SkillName
				Txt = Txt..''..SkillName..''..WorkLv..'级；'
			end
		end
	end
	if string.len(Txt) > 0 then
		return Txt
	else
		return '这丫是新手'
	end
end


--获取宠物信息
function DiaoYu_GetPetInfo(ActorID)
	local PetNum = API_GetTakePetNums(ActorID)
	local ActorConjedPetName = API_GetActorConjedPetName(ActorID)
	local Txt = ''
	for i = 0,2 do
		if string.len(Txt) > 230 then
			break
		end
		local PetName = API_GetTakePetName(ActorID,i)
		if PetName ~= '' then
			Txt = Txt..'  '..PetName..''
			if PetName == ActorConjedPetName then
				Txt = Txt..'（已召唤，'..API_GetActorConjedPetLevel(ActorID)..'级）  ；'
			else
				Txt = Txt..'  ；'
			end
		end
	end
	if string.len(Txt) > 0 then
		return Txt
	else
		return '这丫是新手'
	end
end


--获取佣兵团信息
function DiaoYu_GetMercGroupInfo(ActorID)
	local conskillnametable = {
								[1] = {'能量加强'},
								[2] = {'生命加强'},
								[3] = {'物理技能伤害吸收'},
								[4] = {'火药技能伤害吸收'},
								[5] = {'魔法技能伤害吸收'},
								[6] = {'物理普通攻击反弹'},
								[7] = {'火药普通攻击反弹'},
								[8] = {'魔法普通攻击反弹'},
								[10] = {'物理攻击加强'},
								[11] = {'魔法攻击加强'},
								[12] = {'火药攻击加强'},
								[13] = {'物理防御加强'},
								[14] = {'魔法防御加强'},
								[15] = {'火药防御加强'},
								}
	local Txt = ''
	local TopConsortiaId = API_GetTopConsortiaId(ActorID)
	if TopConsortiaId < 1 then
		return '没有佣兵团'
	end
	local conlevel = API_ConGetNumInfo(TopConsortiaId,7)
	local Conname = ''..API_ConGetStrInfo(TopConsortiaId,1)..'佣兵团('..conlevel..')级，佣兵团技能：'
	local conSkillInfo = ''
	
	for j in conskillnametable do
		if string.len(conSkillInfo) > 230 then
			break
		end
		local ConskillLv = API_ConGetSkillLevel(ActorID,j)
		if ConskillLv > 0 then
			local ConskillName = conskillnametable[j]
			conSkillInfo = conSkillInfo..''..ConskillName..''..ConskillLv..'级；'
		end
	end
	if string.len(conSkillInfo) <= 0 then
		conSkillInfo = '这丫是新手'
	end
	Txt = Conname..conSkillInfo
	return Txt

end


--搜身函数
function DiaoYu_ShouShenJianCha(ActorID,Type)
	if ActorID <= 200 then
		return
	end
	local MONEYNum = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) + API_ActorGetGoodsNum(ActorID,790) * 1000000
	local ActorExpLevel = API_GetActorExpLevel(ActorID)
	DiaoYu_MaxHeiJin = API_VarDataGetNumber_Ex(1,0,-104,1,1)
	DiaoYu_MinLevel = API_VarDataGetNumber_Ex(1,0,-104,1,2)
	if Type == nil then
		Type = 0
	end
	if type(GLOBAL_DiaoYu_XianYiRenList) == 'table' then
		for i in GLOBAL_DiaoYu_XianYiRenList do
			--获取单据信息
			local OrderUserName = GLOBAL_DiaoYu_XianYiRenList[i][1][1]
			local OrderTradeID = GLOBAL_DiaoYu_XianYiRenList[i][1][2]
			local OrderServerName = GLOBAL_DiaoYu_XianYiRenList[i][1][3]
			local OrderMoney = GLOBAL_DiaoYu_XianYiRenList[i][1][4]
			local OrderRMB = GLOBAL_DiaoYu_XianYiRenList[i][1][5]
			local OrderState = GLOBAL_DiaoYu_XianYiRenList[i][1][6]
			if ActorExpLevel <= DiaoYu_MinLevel and MONEYNum >= OrderMoney and MONEYNum >= DiaoYu_MaxHeiJin then
				GLOBAL_DiaoYu_XianYiRenList[i][ActorID] = 1
				local ActorName = API_GetActorName(ActorID)
				local ActorIP = API_GetActorIP(ActorID)
				local UserID = API_GetUserID(ActorID)
				local PlayHouseID = API_GetActorHouserSerialID(ActorID)
				local HouseLv = 0
				if PlayHouseID > 0 then
					HouseLv = API_GetCrtNumProperty(PlayHouseID,5)
				end
				local HeroLV = DiaoYu_GetHeroSkillInfo(ActorID)
				local WorkSkillInfo = DiaoYu_GetWorkSkillInfo(ActorID)
				local MercGroupInfo = DiaoYu_GetMercGroupInfo(ActorID)
				local PetInfo = DiaoYu_GetPetInfo(ActorID)
				--跨服通知客户端
				if API_GetServerID() == 1 then
					DiaoYu_TongZhiKeHuDuan(OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState,ActorName,ActorID,ActorExpLevel,MONEYNum,ActorIP,UserID,HouseLv,HeroLV,WorkSkillInfo,MercGroupInfo,PetInfo,Type)
				else
					local KuaFuCanShu = {OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState,ActorName,ActorID,ActorExpLevel,MONEYNum,ActorIP,UserID,HouseLv,HeroLV,WorkSkillInfo,MercGroupInfo,PetInfo,Type}
					API_OpenRPC(1,0,0,0,15,KuaFuCanShu,'DiaoYu_TongZhiKeHuDuan')
				end
			end
		end
	end
end

--通知客户端函数
function DiaoYu_TongZhiKeHuDuan(OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState,ActorName,ActorID,ActorExpLevel,MONEYNum,ActorIP,UserID,HouseLv,HeroLV,WorkSkillInfo,MercGroupInfo,PetInfo,Type)
	--建立是否已通知数据库
	if GLOBAL_DiaoYu_YiTongZhiList == nil then
		GLOBAL_DiaoYu_YiTongZhiList = {}
	end
	if GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID] == nil then
		GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID] = {}
		GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1] = {OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState}
	end
	if GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][ActorID] == nil or Type ~= 0 then
		local TypeCNlist = {[0]='在线',[1]='上线',[2]='点邮箱',[3]='使用交易所',[4]='与NPC交易',[5]='与玩家交易',[6]='摆摊购买',[7]='点发邮件'}
		local TypeCN = TypeCNlist[Type]
		if TypeCN == nil then
			TypeCN = '未知'
		end
		local Fanwuzhuangtai = '没有房屋'
		if HouseLv > 0 then
			Fanwuzhuangtai = ''..HouseLv..'级房屋'
		end
		GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][ActorID] = {ActorName,ActorID,ActorExpLevel,MONEYNum,ActorIP,UserID,HouseLv,HeroLV,WorkSkillInfo,MercGroupInfo,PetInfo,Type}
		local Info = '姓名：'..ActorName..'；状态：'..TypeCN..'；ID：'..ActorID..'；IP：'..ActorIP..'；等级：'..ActorExpLevel..'级；金币：'..MONEYNum..'金；||英雄:'..HeroLV..'；生活技能：'..WorkSkillInfo..'；佣兵团：'..MercGroupInfo..'；宠物：'..PetInfo..'；房屋：'..Fanwuzhuangtai..''
		--发给渔夫
		for i,v in GLOBAL_DiaoYu_YuFuActorIDList do
			if API_ActorIsOnline(v) then
				API_ResponseWrite('<RequestFishByOrderID>')
				API_ResponseWrite('<Fish JYDH="'..OrderTradeID..'" GDYH="'..OrderUserName..'" YXSJ="'..OrderServerName..'" JYJE="'..OrderMoney..'" JZRMB="'..OrderRMB..'" XYRMZ="'..ActorName..'" XYRID="'..ActorID..'" XYRUSEID="'..UserID..'" XYRDJ="'..ActorExpLevel..'" XYRJB="'..MONEYNum..'" XYRIP="'..ActorIP..'" XYRZT="'..Type..'" XYRFW="'..HouseLv..'" XYRHERO="'..HeroLV..'">'..Info..'</Fish>')
				API_ResponseWrite('</RequestFishByOrderID>')
				API_ResponseFlush(v)
			end
		end
	end
end

--验证客户端请求角色ID是否合法
function G_IsWebActor(UserID,YuFuActorID)
	for i,v in GLOBAL_DiaoYu_YuFuActorIDList do
		if YuFuActorID == v then
			return 1
		end
	end
	return 0
end

--收到客户端请求改变搜索条件
function DiaoYu_ChangeSetting()
	local YuFuActorID = API_RequestGetActorID()
	if  G_IsWebActor(nil,YuFuActorID) == 0 then
		return
	end
	DiaoYu_MinLevel = API_RequestGetNumber(1)
	API_VarDataSetNumber_Ex_Sync(1,0,-104,1,2,DiaoYu_MinLevel)
	DiaoYu_MaxHeiJin = API_RequestGetNumber(2)
	API_VarDataSetNumber_Ex_Sync(1,0,-104,1,1,DiaoYu_MaxHeiJin)
	local KuaFuCanShu = {}
	--跨服回调删除单信息
	DiaoYu_ClearDanXianYiRen()
	API_OpenRPC(-1,OrderTradeID,0,0,1,KuaFuCanShu,'DiaoYu_ClearDanXianYiRen')
	--创建时间触发器10秒后全服重新查找
	API_CreateTimerTriggerG(0,0,10,1,'DiaoYu_ChongXinChaZhao_TimeCallFuncName')
	
end

function DiaoYu_ClearDanXianYiRen()
	for i in GLOBAL_DiaoYu_XianYiRenList do
		--获取单据信息
		local OrderUserName = GLOBAL_DiaoYu_XianYiRenList[i][1][1]
		local OrderTradeID = GLOBAL_DiaoYu_XianYiRenList[i][1][2]
		local OrderServerName = GLOBAL_DiaoYu_XianYiRenList[i][1][3]
		local OrderMoney = GLOBAL_DiaoYu_XianYiRenList[i][1][4]
		local OrderRMB = GLOBAL_DiaoYu_XianYiRenList[i][1][5]
		local OrderState = GLOBAL_DiaoYu_XianYiRenList[i][1][6]
		GLOBAL_DiaoYu_XianYiRenList[i] = {}
		GLOBAL_DiaoYu_XianYiRenList[i][1] = {OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState}
	end
	for i in GLOBAL_DiaoYu_YiTongZhiList do
		local OrderUserName = GLOBAL_DiaoYu_YiTongZhiList[i][1][1]
		local OrderTradeID = GLOBAL_DiaoYu_YiTongZhiList[i][1][2]
		local OrderServerName = GLOBAL_DiaoYu_YiTongZhiList[i][1][3]
		local OrderMoney = GLOBAL_DiaoYu_YiTongZhiList[i][1][4]
		local OrderRMB = GLOBAL_DiaoYu_YiTongZhiList[i][1][5]
		local OrderState = GLOBAL_DiaoYu_YiTongZhiList[i][1][6]
		GLOBAL_DiaoYu_YiTongZhiList[i] = {}
		GLOBAL_DiaoYu_YiTongZhiList[i][1] = {OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState}
	end
	
end

function DiaoYu_ChongXinChaZhao_TimeCallFuncName(Param1,Param2)
	DiaoYu_MaxHeiJin = API_VarDataGetNumber_Ex(1,0,-104,1,1)
	DiaoYu_MinLevel = API_VarDataGetNumber_Ex(1,0,-104,1,2)
	for i in GLOBAL_DiaoYu_YiTongZhiList do
		local OrderUserName = GLOBAL_DiaoYu_YiTongZhiList[i][1][1]
		local OrderTradeID = GLOBAL_DiaoYu_YiTongZhiList[i][1][2]
		local OrderServerName = GLOBAL_DiaoYu_YiTongZhiList[i][1][3]
		local OrderMoney = GLOBAL_DiaoYu_YiTongZhiList[i][1][4]
		local OrderRMB = GLOBAL_DiaoYu_YiTongZhiList[i][1][5]
		local OrderState = GLOBAL_DiaoYu_YiTongZhiList[i][1][6]
		
		if OrderMoney < DiaoYu_MaxHeiJin then
			--先查找本场景的满足条件的人
			DiaoYu_ChaZhaoXianYiRen(OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState)
			--跨服回调查找所有满足条件的人
			local KuaFuCanShu = {OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState}
			API_OpenRPC(-1,OrderTradeID,OrderMoney,1,6,KuaFuCanShu,'DiaoYu_ChaZhaoXianYiRen')
		end
	end
end


--收到客户端请求返回所有订单
function DiaoYu_RequestOrder()
	local YuFuActorID = API_RequestGetActorID()
	if  G_IsWebActor(nil,YuFuActorID) == 0 then
		return
	end
	API_ResponseWrite('<RequestOrder>')
	for i in GLOBAL_DiaoYu_YiTongZhiList do
		local OrderUserName = GLOBAL_DiaoYu_YiTongZhiList[i][1][1]
		local OrderTradeID = GLOBAL_DiaoYu_YiTongZhiList[i][1][2]
		local OrderServerName = GLOBAL_DiaoYu_YiTongZhiList[i][1][3]
		local OrderMoney = GLOBAL_DiaoYu_YiTongZhiList[i][1][4]
		local OrderRMB = GLOBAL_DiaoYu_YiTongZhiList[i][1][5]
		local OrderState = GLOBAL_DiaoYu_YiTongZhiList[i][1][6]
		local StateList = {[2]='下单后，未成交',[3]='成功交易',[4]='钓鱼成功',[5]='交易被取消',[6]='单被删除',}
		local StateCN = StateList[OrderState]
		if StateCN == nil then
			StateCN = '未知'
		end
		local Info = '交易单号：'..OrderTradeID..';挂单用户：'..OrderUserName..';'..OrderServerName..''..OrderMoney..'金 = '..OrderRMB..'元；当前状态：'..StateCN..''
		if API_ActorIsOnline(YuFuActorID) then
			API_ResponseWrite('<Order JYDH="'..OrderTradeID..'" GDYH="'..OrderUserName..'" YXSJ="'..OrderServerName..'" JYJE="'..OrderMoney..'" JZRMB="'..OrderRMB..'" JYZT="'..OrderState..'">'..Info..'</Order>')
		end
	end
	API_ResponseWrite('</RequestOrder>')
	API_ResponseFlush(YuFuActorID)
end


--收到客户端请求返回订单的所有嫌疑人
function DiaoYu_RequestFishByOrderID()
	local YuFuActorID = API_RequestGetActorID()
	if  G_IsWebActor(nil,YuFuActorID)  == 0 then
		return
	end
	local OrderTradeID = API_RequestGetNumber(1)
	if GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID] ~= nil then
		local OrderUserName = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1][1]
		local OrderTradeID = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1][2]
		local OrderServerName = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1][3]
		local OrderMoney = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1][4]
		local OrderRMB = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1][5]
		local OrderState = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1][6]
		local TypeCNlist = {[0]='在线',[1]='上线',[2]='点邮箱',[3]='使用交易所',[4]='与NPC交易',[5]='与玩家交易',[6]='摆摊购买',[7]='点发邮件'}
		
		API_ResponseWrite('<RequestFishByOrderID>')
		for i in GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID] do
			if i ~= 1 then
				local ActorName = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][i][1]
				local ActorID = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][i][2]
				local ActorExpLevel = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][i][3]
				local MONEYNum = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][i][4]
				local ActorIP = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][i][5]
				local UserID = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][i][6]
				local HouseLv = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][i][7]
				local HeroLV = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][i][8]
				local WorkSkillInfo = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][i][9]
				local MercGroupInfo = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][i][10]
				local PetInfo = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][i][11]
				local Type = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][i][12]
				local TypeCN = TypeCNlist[Type]
				if TypeCN == nil then
					TypeCN = '未知'
				end
				local Fanwuzhuangtai = '没有房屋'
				if HouseLv > 0 then
					Fanwuzhuangtai = ''..HouseLv..'级房屋'
				end
				local Info = '姓名：'..ActorName..'；状态：'..TypeCN..'；ID：'..ActorID..'；IP：'..ActorIP..'；等级：'..ActorExpLevel..'级；金币：'..MONEYNum..'金；||英雄:'..HeroLV..'；生活技能：'..WorkSkillInfo..'；佣兵团：'..MercGroupInfo..'；宠物：'..PetInfo..'；房屋：'..Fanwuzhuangtai..''
				API_ResponseWrite('<Fish JYDH="'..OrderTradeID..'" GDYH="'..OrderUserName..'" YXSJ="'..OrderServerName..'" JYJE="'..OrderMoney..'" JZRMB="'..OrderRMB..'" XYRMZ="'..ActorName..'" XYRID="'..ActorID..'" XYRUSEID="'..UserID..'" XYRDJ="'..ActorExpLevel..'" XYRJB="'..MONEYNum..'" XYRIP="'..ActorIP..'" XYRZT="'..Type..'" XYRFW="'..HouseLv..'" XYRHERO="'..HeroLV..'">'..Info..'</Fish>')
			end
		end
		API_ResponseWrite('</RequestFishByOrderID>')
		API_ResponseFlush(YuFuActorID)
	end
end

--收到客户端请求结束交易
function DiaoYu_EndOrder()
	local YuFuActorID = API_RequestGetActorID()
	if  G_IsWebActor(nil,YuFuActorID)  == 0 then
		return
	end
	local OrderTradeID = API_RequestGetNumber(1)
	API_Set5173RecordProcessed(OrderTradeID,1)
	local KuaFuCanShu = {OrderTradeID}
	--跨服回调删除单信息
	DiaoYu_ClearDanInFo(OrderTradeID)
	API_OpenRPC(-1,OrderTradeID,0,0,1,KuaFuCanShu,'DiaoYu_ClearDanInFo')
	API_ResponseWrite('<Ret><EndOrder JYDH="'..OrderTradeID..'">TRUE</EndOrder></Ret>')
	API_ResponseFlush(YuFuActorID)
end

function DiaoYu_ClearDanInFo(OrderTradeID)
	GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID] = nil
	GLOBAL_DiaoYu_XianYiRenList[OrderTradeID] = nil
end


--对某个嫌疑人封号
function DiaoYu_DisableAccount()
	local YuFuActorID = API_RequestGetActorID()
	if  G_IsWebActor(nil,YuFuActorID)  == 0 then
		return
	end
	local OrderTradeID = API_RequestGetNumber(1)
	local ActorID = API_RequestGetNumber(2)
	if GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID] ~= nil and GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][ActorID] ~= nil then
		local UserID = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][ActorID][6]
		API_ActorPunish(UserID,ActorID,2,0,3650,0,0,'数据异常','数据异常')
		API_ResponseWrite('<Ret><DisableAccount ActorID="'..ActorID..'">TRUE</DisableAccount></Ret>')
		API_ResponseFlush(YuFuActorID)
	end
end

--对某个嫌疑人解封
function DiaoYu_EnableAccount()
	local YuFuActorID = API_RequestGetActorID()
	if  G_IsWebActor(nil,YuFuActorID)  == 0 then
		return
	end
	local OrderTradeID = API_RequestGetNumber(1)
	local ActorID = API_RequestGetNumber(2)
	if GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID] ~= nil and GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][ActorID] ~= nil then
		local UserID = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][ActorID][6]
		API_ActorPunish(UserID,ActorID,3,0,0,0,0,'','')
		API_ResponseWrite('<Ret><EnableAccount ActorID="'..ActorID..'">TRUE</EnableAccount></Ret>')
		API_ResponseFlush(YuFuActorID)
	end
end

--清除某个订单的所有嫌疑人
function DiaoYu_CleanFishByOrder()
	local YuFuActorID = API_RequestGetActorID()
	if  G_IsWebActor(nil,YuFuActorID)  == 0 then
		return
	end
	local OrderTradeID = API_RequestGetNumber(1)
	local KuaFuCanShu = {OrderTradeID}
	--跨服回调删除单信息
	DiaoYu_ClearZhiDingDanXianYiRen(OrderTradeID)
	
	API_OpenRPC(-1,OrderTradeID,0,0,1,KuaFuCanShu,'DiaoYu_ClearZhiDingDanXianYiRen')
	API_ResponseWrite('<Ret><CleanFishByOrder JYDH="'..OrderTradeID..'">TRUE</CleanFishByOrder></Ret>')
	API_ResponseFlush(YuFuActorID)
end


function DiaoYu_ClearZhiDingDanXianYiRen(OrderTradeID)
	if GLOBAL_DiaoYu_XianYiRenList[OrderTradeID] ~= nil then
		--获取单据信息
		local OrderUserName = GLOBAL_DiaoYu_XianYiRenList[OrderTradeID][1][1]
		local OrderTradeID = GLOBAL_DiaoYu_XianYiRenList[OrderTradeID][1][2]
		local OrderServerName = GLOBAL_DiaoYu_XianYiRenList[OrderTradeID][1][3]
		local OrderMoney = GLOBAL_DiaoYu_XianYiRenList[OrderTradeID][1][4]
		local OrderRMB = GLOBAL_DiaoYu_XianYiRenList[OrderTradeID][1][5]
		local OrderState = GLOBAL_DiaoYu_XianYiRenList[OrderTradeID][1][6]
		GLOBAL_DiaoYu_XianYiRenList[OrderTradeID] = {}
		GLOBAL_DiaoYu_XianYiRenList[OrderTradeID][1] = {OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState}
	end
	if GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID] ~= nil then
		local OrderUserName = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1][1]
		local OrderTradeID = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1][2]
		local OrderServerName = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1][3]
		local OrderMoney = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1][4]
		local OrderRMB = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1][5]
		local OrderState = GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1][6]
		GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID] = {}
		GLOBAL_DiaoYu_YiTongZhiList[OrderTradeID][1] = {OrderUserName,OrderTradeID,OrderServerName,OrderMoney,OrderRMB,OrderState}
	end
	
end

--清除所有订单的所有嫌疑人
function DiaoYu_CleanAllFish()
	local YuFuActorID = API_RequestGetActorID()
	if  G_IsWebActor(nil,YuFuActorID)  == 0 then
		return
	end
	local KuaFuCanShu = {}
	--跨服回调删除单信息
	DiaoYu_ClearDanXianYiRen()
	API_OpenRPC(-1,OrderTradeID,0,0,1,KuaFuCanShu,'DiaoYu_ClearDanXianYiRen')
	--创建时间触发器10秒后全服重新查找
	API_CreateTimerTriggerG(0,0,10,1,'DiaoYu_ChongXinChaZhao_TimeCallFuncName')
	API_ResponseWrite('<Ret><CleanAllFish>TRUE</CleanAllFish></Ret>')
	API_ResponseFlush(YuFuActorID)
end

--清除对某个角色的嫌疑
function DiaoYu_CleanSingleFish()
	local YuFuActorID = API_RequestGetActorID()
	if  G_IsWebActor(nil,YuFuActorID)  == 0 then
		return
	end
	local ActorID = API_RequestGetNumber(1)
	local KuaFuCanShu = {ActorID}
	--跨服回调清除对某个角色的嫌疑
	DiaoYu_ClearZhiDingXianYiRen(ActorID)
	API_OpenRPC(-1,0,0,0,1,KuaFuCanShu,'DiaoYu_ClearZhiDingXianYiRen')
	API_ResponseWrite('<Ret><CleanSingleFish XYWJ="'..ActorID..'">TRUE</CleanSingleFish></Ret>')
	API_ResponseFlush(YuFuActorID)
end

function DiaoYu_ClearZhiDingXianYiRen(ActorID)
	for i in GLOBAL_DiaoYu_XianYiRenList do
		if GLOBAL_DiaoYu_XianYiRenList[i][ActorID] ~= nil then
			GLOBAL_DiaoYu_XianYiRenList[i][ActorID] = nil
		end
	end
	for i in GLOBAL_DiaoYu_YiTongZhiList do
		if GLOBAL_DiaoYu_YiTongZhiList[i][ActorID] ~= nil then
			GLOBAL_DiaoYu_YiTongZhiList[i][ActorID] = nil
		end
	end
end

