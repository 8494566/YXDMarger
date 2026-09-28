GLOBAL_DiaoYu_ZhiFaRenActID_tab = {}

Fishing_AddEquip = 12600 --存储钓鱼系统的鱼饵是否领取过装备

Fishing_EquipTab = {
	[1] = {
		[1] = {4000,4100,6600,6900,6900,8100,8100,8100,8100,4300,4200,4200,4400,4500,2000,},
		[2] = {4001,4101,6601,6901,6901,8101,8101,8101,8101,4301,4201,4201,4401,4501,2001,},
		[3] = {4001,4101,6601,6901,6901,8101,8101,8101,8101,4301,4201,4201,4401,4501,2001,},
		[4] = {4002,4102,6602,6902,6902,8102,8102,8102,8102,4302,4202,4202,4402,4502,2002,},
		[5] = {4002,4102,6602,6902,6902,8102,8102,8102,8102,4302,4202,4202,4402,4502,2002,},
		},
	[2] = {
		[1] = {5000,5100,6700,7000,7000,8200,8200,8200,8200,5300,5200,5200,5400,5500,1500,},
		[2] = {5001,5101,6701,7001,7001,8201,8201,8201,8201,5301,5201,5201,5401,5501,1501,},
		[3] = {5001,5101,6701,7001,7001,8201,8201,8201,8201,5301,5201,5201,5401,5501,1501,},
		[4] = {5002,5102,6702,7002,7002,8202,8202,8202,8202,5302,5202,5202,5402,5502,1502,},
		[5] = {5002,5102,6702,7002,7002,8202,8202,8202,8202,5302,5202,5202,5402,5502,1502,},
		},
	[3] = {
		[1] = {6000,6100,6800,8000,8000,8300,8300,8300,8300,6300,6200,6200,6400,6500,1000,},
		[2] = {6001,6101,6801,8001,8001,8301,8301,8301,8301,6301,6201,6201,6401,6501,1001,},
		[3] = {6001,6101,6801,8001,8001,8301,8301,8301,8301,6301,6201,6201,6401,6501,1001,},
		[4] = {6002,6102,6802,8002,8002,8302,8302,8302,8302,6302,6202,6202,6402,6502,1002,},
		[5] = {},
		},
}

--钓鱼上线函数，给卷轴
function Fishing_OnLogin(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	local PlayName = API_GetActorName(ActorID)
	local PD = 0
	for j,v in ipairs(GLOBAL_DiaoYu_ZhiFaRenActID_tab) do
		if v == ActorID then
			PD = 1
			break
		end
	end
	for j,v in ipairs(GLOBAL_DiaoYu_ZhiFaRenName_tab) do
		if v == PlayName then
			PD = 1
			break
		end
	end
	for i = 1,10 do 
		local nKey = 4 + i
		local YuErName = API_VarDataGetString_Ex(1,0,-103,1,nKey)
		if PlayName == YuErName then
			PD = 2
			break
		end
	end
	for i, v in GLOBAL_DiaoYu_YuErName_tab do
		if PlayName == v then
			PD = 2
			break
		end
	end	
	if PD == 1 then
		API_ActorAddStatus(ActorID,774001,-1) --GM隐身
		API_RemoveTaskScroll(ActorID,50005)--删除卷轴
		API_AddTaskScrollEx(ActorID,50005,10160,'Fishing_Scroll',1)--加卷轴
	elseif PD == 2 then
		API_RemoveTaskScroll(ActorID,50005)--删除卷轴
		API_AddTaskScrollEx(ActorID,50005,10160,'Fishing_Scroll',1)--加卷轴
	end
end

function Fishing_Scroll()
	local ActorID = API_RequestGetActorID()
	local PlayLv = API_GetActorExpLevel(ActorID)
	API_ResponseWrite('<win ntype="5" rect="650,230,280,285"></win>')
	API_ResponseWrite('<br><text>对于破坏游戏环境的人，要严惩不贷！</text><br>')
	API_ResponseWrite('<br><br><a href="Fishing_GongNeng?1=1">脱离新手流程</a><br>')
	API_ResponseWrite('<br><a href="Fishing_GongNeng?1=2">有钱人列表</a>')
	API_ResponseWrite('<text>  </text><input type="number" name="3" bFilter="1" size="10" width="100"><br>')
	if PlayLv <= 35 then
		API_ResponseWrite('<br><a href="Fishing_GongNeng?1=4">得到50000经验</a>')
	end
	API_ResponseWrite('<br><a href="Fishing_GongNeng?1=5">发我鱼饵套装</a><text>  (只可领取一次)</text><br>')
	API_ResponseWrite('<br><br><br><a>关闭窗口</a>')
	API_ResponseFlush(ActorID)
end

function Fishing_GongNeng()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local PlayName = API_GetActorName(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local PD = 0
	for j,v in ipairs(GLOBAL_DiaoYu_ZhiFaRenActID_tab) do
		if v == ActorID then
			PD = 1
			break
		end
	end
	for j,v in ipairs(GLOBAL_DiaoYu_ZhiFaRenName_tab) do
		if v == PlayName then
			PD = 1
			break
		end
	end
	for i = 1,10 do 
		local nKey = 4 + i
		local YuErName = API_VarDataGetString_Ex(1,0,-103,1,nKey)
		if PlayName == YuErName then
			PD = 2
			break
		end
	end
	for i, v in GLOBAL_DiaoYu_YuErName_tab do
		if PlayName == v then
			PD = 2
			break
		end
	end
	if PD == 0 then
		return
	end
	if XuanZe == 1 then
		API_ActorSetNovice(ActorID, 1)
		API_ActorSetNovice(ActorID, 2)
		API_ActorSetNovice(ActorID, 3)
		API_ActorSetNovice(ActorID, 4)
		API_ActorSetNovice(ActorID, 5)
		API_ActorSetNovice(ActorID, 6)
		API_VarDataSetNumber(ActorID, 1, 7900, 0)
		API_VarDataSetNumber(ActorID, 1, GLOBAL_FoolNewActorTaskStep, 64)  ---18338，傻瓜新手步骤
		local ActorCamp = API_GetActorCamp(ActorID)
		if ActorCamp == 0 then
			API_ActorGoToMap(ActorID, 1, 217, 208)
		else
			API_ActorGoToMap(ActorID, 2, 241, 170)
		end
		API_ResponseEnd()
		API_ResponseClear()
	elseif XuanZe == 2 then
		API_ResponseWrite('<win ntype="2" rect="90,350,830,285"></win>')
		local MaxMoney = API_RequestGetNumber(3)
		if MaxMoney <= 0 then
			MaxMoney = 1000000
		end
		local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
		API_ResponseWrite('<br><text>有钱人列表：</text><br>')
		for j,v in ipairs(PlayList) do
			local MONEYNum = API_ActorGetPropNum(v,PD_PROP_MONEY_HOLD) + API_ActorGetGoodsNum(v,790) * 1000000
			if MONEYNum >= MaxMoney then
				local Name = API_GetActorName(v)
				local Lv = API_GetActorExpLevel(v)
				API_ResponseWrite('<br><text>名字：'..Name..'   ID：'..v..'   级别：'..Lv..'   </text>')
				local HouseID = API_GetActorHouserSerialID(v)
				if HouseID > 0 then
					API_ResponseWrite('<text>有房屋   </text>')
				else
					API_ResponseWrite('<text>没房屋   </text>')
				end
				API_ResponseWrite('<text>金币总量：'..MONEYNum..'   </text>')
				if PD == 1 then
					API_ResponseWrite('<a href="Fishing_GongNeng?1=3&2='..v..'&3='..MONEYNum..'" close="0">封10年</a>')
				end
			end
		end
	elseif XuanZe == 3 then
		if PD == 1 then
			local KillID = API_RequestGetNumber(2)
			local MONEYNum = API_RequestGetNumber(3)
			if KillID > 0 then
				local KillName = API_ActorIsOnline(KillID)
				API_ActorPunish(KillID,2,1,0,0,0,'数据异常','数据异常')
				API_ActorSendMsg(ActorID,10,'将'..KillID..'封号操作完成')
				for j,v in ipairs(GLOBAL_DiaoYu_ZhiFaRenName_tab) do
					API_SendActorMailByName(v, 0, 0, 0, '地图内手工封('..PlayName..')', ''..KillName..'因携带('..MONEYNum..')金币，正好在交易员交易地图('..MapConfigID..')内被封。')
				end
			else
				API_ActorSendMsg(ActorID,10,'封号失败，请联系GM')
			end
		else
			API_ActorSendMsg(ActorID,3,'没有此权限')
		end
	elseif XuanZe == 4 then
		local PlayLv = API_GetActorExpLevel(ActorID)
		if PlayLv <= 35 then
			local AddJY = 50000
			local ExploitL = API_GetActorExpLevel(ActorID)
			local expMax = API_GetExploitInfo(ExploitL,3)
			local expNow = API_GetActorCurExp(ActorID)
			local expAddMax = expMax - expNow
			if expAddMax >= AddJY then
				API_ActorAddExp(ActorID,AddJY,0,'执法人员给经验')
			elseif expAddMax == 0 then
				API_ActorSendMsg(ActorID,3,'经验已满，无法给经验')
			else
				API_ActorAddExp(ActorID,expAddMax,0,'执法人员给经验')
			end
		else
			API_ActorSendMsg(ActorID,3,'等级太高，无法给经验')
		end
	elseif XuanZe == 5 then
		local YesNo = API_VarDataGetNumber(ActorID,1,Fishing_AddEquip)
		if YesNo > 0 then
			API_ActorSendMsg(ActorID,3,'一个角色一生只能领取一次装备')
			return
		end
		local PlayJW = API_GetActorPeerageLevel(ActorID)
		if PlayJW > 5 then
			PlayJW = 5
		end
		local HeroID = API_ActorGetCurHeroID(ActorID,0)
		local HeroType = PublicFun_GetHeroType(HeroID)
		if Fishing_EquipTab[HeroType] ~= nil and Fishing_EquipTab[HeroType][PlayJW] ~= nil then
			local Tab = Fishing_EquipTab[HeroType][PlayJW]
			local TabCD = table.getn(Tab)
			if API_ActorGetPackageSize(ActorID) >= TabCD then
				API_VarDataSetNumber(ActorID,1,Fishing_AddEquip,1)
				for i = 1,TabCD do
					local GoodsID = Tab[i]
					local GoodsNum = 1
					local PinZhi = math.random(1,2)
					API_AddActorGoodsFlagEx(ActorID, GoodsID, GoodsNum, PinZhi, 3, '鱼饵领取装备', 1)
				end
				API_ActorSendMsg(ActorID,3,'领取装备成功，请查看背包')
			else
				API_ActorSendMsg(ActorID,3,'背包物品太多，请空出'..TabCD..'个空位后再试')
			end
		end
	end
end
