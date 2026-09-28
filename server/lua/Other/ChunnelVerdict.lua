----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\ChunnelVerdict.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-3-11
--版  本:	1.0
--描  述:	传送门判断
--应  用:  

----------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------
--作者：张春明
--日期：2008/3/11 
--功能：创建
---------------------------------------------------------------------
GLOBAL_ChunnelVerdict_Info = 
{
	
	--火山冰原
	[8]={
		--帝国高级公爵空间传送塔
		[3] = {CampID=0,PeerageMin=71,PeerageMax=85,},
		--帝国公爵空间传送塔
		[4] = {CampID=0,PeerageMin=66,PeerageMax=85,},
		--联邦高级公爵空间传送塔
		[5] = {CampID=1,PeerageMin=71,PeerageMax=85,},
		--联邦公爵空间传送塔
		[6] = {CampID=1,PeerageMin=66,PeerageMax=85,},
		},
	--暗礁海
	[9]={
		--钢铁城入口
		[2] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--帝国公民空间传送塔
		[3] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--五级房屋
		[4] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		},
	--珊瑚群岛
	[10]={
		--娜纱湿地入口
		[2] = {PeerageMin=16,PeerageMax=85,},
		--联邦男爵空间传送塔
		[3] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--塔夫的矿井（地下城）
		[4] = {CampID=1,PeerageMin=16,PeerageMax=30,},
		--双子岛（活动地图）
		[6] = {CampID=1,PeerageMin=11,PeerageMax=85,},
		},
	--阳光雨林
	[23]={
		--暗礁海入口
		[1] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--落日农庄入口
		[2] = {PeerageMin=16,PeerageMax=85,},
		--帝国公民空间传送塔
		[3] = {CampID=0,PeerageMin=1,PeerageMax=85,},	
		--塔夫的矿井（地下城）
		[4] = {CampID=0,PeerageMin=16,PeerageMax=30,},
		--双子岛（活动地图）
		[6] = {CampID=0,PeerageMin=11,PeerageMax=85,},	
		},
	--麦穗平原
	[25]={
		--返回天空城
		[2] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--联邦公民空间传送塔
		[3] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--五级房屋
		[4] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		},
	--塔夫的矿井
	[103]={
		--返回珊瑚群岛
		[1] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--返回阳光雨林
		[2] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		},

	--联邦英雄广场
	[91]={
		--联邦公民空间传送塔
		[1] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--联邦男爵空间传送塔
		[2] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--联邦高级男爵空间传送塔
		[3] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--联邦子爵空间传送塔
		[4] = {CampID=1,PeerageMin=1,PeerageMax=25,},
		--联邦高级子爵空间传送塔
		[5] = {CampID=0,PeerageMin=1,PeerageMax=25,},
		[6] = {CampID=1,PeerageMin=1,PeerageMax=25,},
		[7] = {CampID=1,PeerageMin=1,PeerageMax=25,},
		[8] = {CampID=0,PeerageMin=1,PeerageMax=25,},
		--联邦高级侯爵空间传送塔
		[9] = {CampID=1,PeerageMin=56,PeerageMax=85,},
		--联邦公爵空间传送塔
		[10] = {CampID=1,PeerageMin=66,PeerageMax=85,},
		--联邦高级公爵空间传送塔
		[11] = {CampID=1,PeerageMin=71,PeerageMax=85,},
		--返回奇迹之岛
		[12] = {CampID=1,PeerageMin=1,PeerageMax=25,},
		},

	--帝国英雄广场
	[92]={
		--帝国公民空间传送塔
		[1] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--帝国男爵空间传送塔
		[2] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--帝国高级男爵空间传送塔
		[3] = {CampID=0,PeerageMin=11,PeerageMax=85,},
		--帝国子爵空间传送塔
		[4] = {CampID=0,PeerageMin=21,PeerageMax=85,},
		--帝国高级子爵空间传送塔
		[5] = {CampID=0,PeerageMin=1,PeerageMax=25,},
		--帝国伯爵空间传送塔
		[6] = {CampID=0,PeerageMin=1,PeerageMax=25,},
		--帝国高级伯爵空间传送塔
		[7] = {CampID=0,PeerageMin=1,PeerageMax=25,},
		--帝国侯爵空间传送塔
		[8] = {CampID=0,PeerageMin=1,PeerageMax=25,},
		--帝国高级侯爵空间传送塔
		[9] = {CampID=0,PeerageMin=56,PeerageMax=85,},
		--帝国公爵空间传送塔
		[10] = {CampID=0,PeerageMin=66,PeerageMax=85,},
		--帝国高级公爵空间传送塔
		[11] = {CampID=0,PeerageMin=71,PeerageMax=85,},
		--返回奇迹之岛
		[12] = {CampID=0,PeerageMin=1,PeerageMax=25,},
		},
	--联邦总督府
	[67]={
		--秘密通道1
		[2] = {CampID=1,PeerageMin=1,PeerageMax=15,},
		--秘密通道2
		[3] = {CampID=1,PeerageMin=16,PeerageMax=85,},
		},
	--帝国总督府
	[82]={
		--秘密通道1
		[2] = {CampID=0,PeerageMin=1,PeerageMax=15,},
		--秘密通道2
		[3] = {CampID=0,PeerageMin=16,PeerageMax=85,},
		},
	--帝国总督府
	[82]={
		--秘密通道1
		[2] = {CampID=0,PeerageMin=1,PeerageMax=15,},
		--秘密通道2
		[3] = {CampID=0,PeerageMin=16,PeerageMax=85,},
		},
	--秘密通道1层
	[74]={
		--秘密通道1
		[1] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--秘密通道2
		[2] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		},
	--秘密通道2层
	[93]={
		--秘密通道1
		[1] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--秘密通道2
		[2] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		},
	--娜纱湿地
	[98]={
		--珊瑚群岛入口
		[1] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--联邦子爵空间传送塔入口
		[4] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		},
	--落日农庄
	[99]={
		--阳光雨林入口
		[1] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--帝国子爵空间传送塔入口
		[4] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		},
	--沙暴绿洲
	[102]={
		--月暮草场入口
		[1] = {PeerageMin=26,PeerageMax=85,},
		--光明遗迹入口
		[2] = {PeerageMin=36,PeerageMax=85,},	
		--联邦
		[4] = {CampID=1,PeerageMin=1,PeerageMax=50,},
		--帝国
		[5] = {CampID=0,PeerageMin=1,PeerageMax=50,},
		
		},
	--双子岛
	[104]={
		--珊瑚群岛
		[1] = {CampID=1,PeerageMin=11,PeerageMax=85,},
		--阳光雨林
		[2] = {CampID=0,PeerageMin=11,PeerageMax=85,},
		},
	--月暮草场
	[101]={
		--沙暴绿洲入口
		[3] = {PeerageMin=26,PeerageMax=85,},
		--恶鬼的宫殿
		[4] = {PeerageMin=26,PeerageMax=85,},
		},	
	--镜月地下城一层
	[105]={
		--返回光明遗迹
		[2] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--返回光明遗迹
		[3] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		},	
	--恶鬼的宫殿一层
	[108]={
		--返回月暮草场
		[2] = {CampID=1,PeerageMin=26,PeerageMax=85,},
		--返回月暮草场
		[3] = {CampID=0,PeerageMin=26,PeerageMax=85,},
		},	
	--征战平原
	[100]={
		--前往联邦三档资源采集区
		[3] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--前往帝国三档资源采集区
		[4] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		},	
	--夜莺山谷
	[110]={
		--前往空间传送塔(41级~55级)
		[2] = {CampID=1,PeerageMin=41,PeerageMax=85,},
		},	
	--光明遗迹
	[111]={
		--前往帝国41-55级空间传送塔(41级~55级)
		[2] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--镜月地下城
		[3] = {PeerageMin=41,PeerageMax=85,},
		--联邦41-55级空间传送塔入口
		[4] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--前往联邦交易所室内(光明遗迹)
		[5] = {CampID=1,PeerageMin=1,PeerageMax=85,},	
		--前往帝国交易所室内(光明遗迹)
		[6] = {CampID=0,PeerageMin=1,PeerageMax=85,},	
		},	
	--梦幻城一层
	[134]={
		--前往沙暴帝国
		[1] = {CampID=0,PeerageMin=1,PeerageMax=80,},
	    --前往沙暴联邦
		[2] = {CampID=1,PeerageMin=1,PeerageMax=80,},
		},			
}
--传送判断
function ChunnelVerdict(Index,ActorID,NowMapID,TargetMapID)
	if ActorID < 200 then
		return 1
	end
	local lNowMapID = API_GetMapConfigID(NowMapID)
	local lTargetMapID = API_GetMapConfigID(TargetMapID)
	local LaiYuan = API_ActorGetPropNum(ActorID,201)
	if (lNowMapID == 82 or lNowMapID == 67) and Index == 1 and API_VarDataGetNumber(ActorID,1,18336) == 1 then
		API_VarDataSetNumber(ActorID,1,18336,2)
		if GLOBAL_FengXiangBiao_DateList[4][1][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[4][1][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[4][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[4][1][LaiYuan] + 1
		end
	elseif ((lNowMapID == 1 and Index == 1) or (lNowMapID == 2 and Index == 13)) and API_VarDataGetNumber(ActorID,1,18336) == 2 then
		API_VarDataSetNumber(ActorID,1,18336,3)
		if GLOBAL_FengXiangBiao_DateList[4][2][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[4][2][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[4][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[4][2][LaiYuan] + 1
		end
	elseif ((lNowMapID == 10 and Index == 5) or (lNowMapID == 9 and Index == 3)) and API_VarDataGetNumber(ActorID,1,18336) == 3 then
		API_VarDataSetNumber(ActorID,1,18336,4)
		if GLOBAL_FengXiangBiao_DateList[4][3][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[4][3][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[4][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[4][3][LaiYuan] + 1
		end
	end
	if lTargetMapID == 100 then
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local ConsortiaID = API_GetTopConsortiaId(ActorID)
		if Week == 6 or Week == 7 then
			if (Hour == 19 and Minute >= 30) or (Hour >= 20 and Hour < 22) then
				local CityInfoOwnerID = CastteBette_Def_CityInfo[1].CityInfo.CityInfoOwnerID
				local CastellanSaveKey = CastteBette_Def_CityInfo[1].CityInfo.CityInfoListKeyID.CastellanSaveKey
				local LinShiCastellanSaveKey = CastteBette_Def_CityInfo[1].CityInfo.CityInfoListKeyID.LinShiCastellanSaveKey
				local CastellanDate = API_VarDataGetNumber_Ex(1,0,CityInfoOwnerID,1,CastellanSaveKey)
				local LinShiCastellanDate = API_VarDataGetNumber_Ex(1,0,CityInfoOwnerID,1,LinShiCastellanSaveKey)
				if CastellanDate == ConsortiaID or LinShiCastellanDate == ConsortiaID then
					return 1
				end
				local BaoMingListOwnerID = CastteBette_Def_CityInfo[1].BaoMingList.BaoMingListOwnerID
				local BaoMingList = CastteBette_Def_CityInfo[1].BaoMingList.BaoMingListKeyID[Week]
				local ShiFouYouRen = 0
				local ShiFouCanZhan = 0
				for j in BaoMingList do
					local BaoMingKeyID = BaoMingList[j]
					local BaoMingConsortiaID = API_VarDataGetNumber_Ex(1,0,BaoMingListOwnerID,1,BaoMingKeyID)
					if BaoMingConsortiaID > 0 then
						ShiFouYouRen = 1
						if ConsortiaID == BaoMingConsortiaID then
							ShiFouCanZhan = 1
						end
					end
				end
				if ShiFouYouRen == 1 and ShiFouCanZhan ~= 1 then
					API_ActorSendMsg(ActorID, 2,'由于征战平原正在进行激烈的城战，为避免伤及无辜，目前禁止进入！')
					return 0
				end
			end
		end
	end
	local CampID = API_GetActorCamp(ActorID)
	if GLOBAL_ChunnelVerdict_Info[lNowMapID] ~= nil then
		if GLOBAL_ChunnelVerdict_Info[lNowMapID][Index] ~= nil then
			if CampID == GLOBAL_ChunnelVerdict_Info[lNowMapID][Index].CampID or GLOBAL_ChunnelVerdict_Info[lNowMapID][Index].CampID == nil then
				local Peerage = API_GetActorPeerageLevel(ActorID)
				local ExpLevel = API_GetActorExpLevel(ActorID)
				local NeedPeerageMin = GLOBAL_ChunnelVerdict_Info[lNowMapID][Index].PeerageMin
				local NeedPeerageMax = GLOBAL_ChunnelVerdict_Info[lNowMapID][Index].PeerageMax
				if ExpLevel >= NeedPeerageMin then
					if ExpLevel <= NeedPeerageMax then
					else
						local NeedPeerageMaxCN = GLOBAL_Exploit[NeedPeerageMax].PeerageDepict
						API_ActorSendMsg(ActorID, 2,'前方是低级区域，等级高于'..NeedPeerageMaxCN..'的玩家无法进入')
						return 0
					end
				else
					local NeedPeerageMinCN = GLOBAL_Exploit[NeedPeerageMin].PeerageDepict
					API_ActorSendMsg(ActorID, 2,'前方危险，等级低于'..NeedPeerageMinCN..'的玩家无法进入')
					return 0
				end
			else
				API_ActorSendMsg(ActorID, 2,''..GLOBAL_CampName[CampID]..'人员不得入内')
				return 0
			end
		end
	end
	if LoopTaskBodyGuard_ChunnelVerdict_New(ActorID,Index,NowMapID,TargetMapID) == 1 then
	else
		return 0
	end
	if (lNowMapID == 10 and Index == 6) or (lNowMapID == 23 and Index == 6) then
		local ActorServerID = API_GetServerID()
		local ServerID = math.random(6,7)
		local x = 439
		local y = 229
		if CampID == 0 then
			x = 430
			y = 677
		end
		API_VarDataSetNumber(ActorID,1,12065,ActorServerID)
		API_ActorGoToMapEx(ActorID,ServerID,104,x,y)
	end
	if (lNowMapID == 104 and Index == 1) or (lNowMapID == 104 and Index == 2) then
		local ServerID = API_VarDataGetNumber(ActorID,1,12065)
		if not API_ServerIsOpen(ServerID) then
			ServerID = 2
		end
		local x = 344
		local y = 316
		local mapid = 10
		if CampID == 0 then
			x = 249
			y = 75
			mapid = 23
		end
		API_VarDataSetNumber(ActorID,1,12065,0)
		API_ActorGoToMapEx(ActorID,ServerID,mapid,x,y)
	end
	return 1
end
