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
		--帝国男爵空间传送塔
		[4] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--帝国高级男爵空间传送塔
		[5] = {CampID=0,PeerageMin=11,PeerageMax=85,},
		--1档资源采集区A
		[6] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--1档资源采集区B
		[7] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--2档资源采集区A
		[8] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--国有资源采集区
		[9] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--迷雾镇杂货店
		[10] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--迷雾镇药水店
		[11] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--2档资源采集区B
		[12] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--3档资源采集区A
		[13] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		},
	--珊瑚群岛
	[10]={
		--天空城入口
		[2] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--联邦高级男爵空间传送塔
		[3] = {CampID=1,PeerageMin=11,PeerageMax=85,},
		--联邦男爵空间传送塔
		[4] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--联邦公民空间传送塔
		[5] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--1档资源采集区A
		[6] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--1档资源采集区B
		[7] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--2档资源采集区A
		[8] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--国有资源采集区
		[9] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--迷雾镇杂货店
		[10] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--迷雾镇药水店
		[11] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--2档资源采集区B
		[12] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--3档资源采集区A
		[13] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		},
	--阳光雨林
	[23]={
		--暗礁海入口
		[1] = {CampID=0,PeerageMin=1,PeerageMax=85,},
		--帝国高级伯爵空间传送塔
		[3] = {CampID=0,PeerageMin=41,PeerageMax=85,},
		--帝国子爵空间传送塔
		[4] = {CampID=0,PeerageMin=21,PeerageMax=85,},
		--帝国高级子爵空间传送塔
		[5] = {CampID=0,PeerageMin=26,PeerageMax=85,},
		--帝国伯爵空间传送塔
		[6] = {CampID=0,PeerageMin=36,PeerageMax=85,},
		--帝国侯爵空间传送塔
		[7] = {CampID=0,PeerageMin=51,PeerageMax=85,},
		--帝国高级侯爵空间传送塔
		[8] = {CampID=0,PeerageMin=56,PeerageMax=85,},
		},
	--麦穗平原
	[25]={
		--珊瑚群岛入口
		[2] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--联邦高级侯爵空间传送塔
		[3] = {CampID=1,PeerageMin=56,PeerageMax=85,},
		--联邦侯爵空间传送塔
		[4] = {CampID=1,PeerageMin=51,PeerageMax=85,},
		--联邦高级伯爵空间传送塔
		[5] = {CampID=1,PeerageMin=41,PeerageMax=85,},
		--联邦伯爵空间传送塔
		[6] = {CampID=1,PeerageMin=36,PeerageMax=85,},
		--联邦高级子爵空间传送塔
		[7] = {CampID=1,PeerageMin=26,PeerageMax=85,},
		--联邦子爵空间传送塔
		[8] = {CampID=1,PeerageMin=21,PeerageMax=85,},
		},
	--联邦英雄广场
	[91]={
		--联邦公民空间传送塔
		[1] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--联邦男爵空间传送塔
		[2] = {CampID=1,PeerageMin=1,PeerageMax=85,},
		--联邦高级男爵空间传送塔
		[3] = {CampID=1,PeerageMin=11,PeerageMax=85,},
		--联邦子爵空间传送塔
		[4] = {CampID=1,PeerageMin=21,PeerageMax=85,},
		--联邦高级子爵空间传送塔
		[5] = {CampID=1,PeerageMin=26,PeerageMax=85,},
		--联邦伯爵空间传送塔
		[6] = {CampID=1,PeerageMin=36,PeerageMax=85,},
		--联邦高级伯爵空间传送塔
		[7] = {CampID=1,PeerageMin=41,PeerageMax=85,},
		--联邦侯爵空间传送塔
		[8] = {CampID=1,PeerageMin=51,PeerageMax=85,},
		--联邦高级侯爵空间传送塔
		[9] = {CampID=1,PeerageMin=56,PeerageMax=85,},
		--联邦公爵空间传送塔
		[10] = {CampID=1,PeerageMin=66,PeerageMax=85,},
		--联邦高级公爵空间传送塔
		[11] = {CampID=1,PeerageMin=71,PeerageMax=85,},
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
		[5] = {CampID=0,PeerageMin=26,PeerageMax=85,},
		--帝国伯爵空间传送塔
		[6] = {CampID=0,PeerageMin=36,PeerageMax=85,},
		--帝国高级伯爵空间传送塔
		[7] = {CampID=0,PeerageMin=41,PeerageMax=85,},
		--帝国侯爵空间传送塔
		[8] = {CampID=0,PeerageMin=51,PeerageMax=85,},
		--帝国高级侯爵空间传送塔
		[9] = {CampID=0,PeerageMin=56,PeerageMax=85,},
		--帝国公爵空间传送塔
		[10] = {CampID=0,PeerageMin=66,PeerageMax=85,},
		--帝国高级公爵空间传送塔
		[11] = {CampID=0,PeerageMin=71,PeerageMax=85,},
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
}
--传送判断
function ChunnelVerdict(Index,ActorID,NowMapID,TargetMapID)
	if ActorID < 200 then
		return 1
	end
	local lNowMapID = API_GetMapConfigID(NowMapID)
	local lTargetMapID = API_GetMapConfigID(TargetMapID)
	if (lNowMapID == 82 or lNowMapID == 67) and Index == 1 and API_VarDataGetNumber(ActorID,1,18336) == 1 then
		API_VarDataSetNumber(ActorID,1,18336,2)
		GLOBAL_FengXiangBiao_DateList[4][1].Date = GLOBAL_FengXiangBiao_DateList[4][1].Date + 1
	elseif ((lNowMapID == 1 and Index == 1) or (lNowMapID == 2 and Index == 13)) and API_VarDataGetNumber(ActorID,1,18336) == 2 then
		API_VarDataSetNumber(ActorID,1,18336,3)
		GLOBAL_FengXiangBiao_DateList[4][2].Date = GLOBAL_FengXiangBiao_DateList[4][2].Date + 1
	elseif ((lNowMapID == 10 and Index == 5) or (lNowMapID == 9 and Index == 3)) and API_VarDataGetNumber(ActorID,1,18336) == 3 then
		API_VarDataSetNumber(ActorID,1,18336,4)
		GLOBAL_FengXiangBiao_DateList[4][3].Date = GLOBAL_FengXiangBiao_DateList[4][3].Date + 1
	end
	if 2==lNowMapID and 2==lTargetMapID then
		if 0==LoopTaskBodyGuard_ChunnelVerdict(ActorID,Index,NowMapID,TargetMapID) then
			return 0
		end
		if CCPetFrame_ChunnelVerdict(ActorID) == 0 then
			return 0
		end
	end
	if GLOBAL_ChunnelVerdict_Info[lNowMapID] ~= nil then
		if GLOBAL_ChunnelVerdict_Info[lNowMapID][Index] ~= nil then
			local CampID = API_GetActorCamp(ActorID)
			if CampID == GLOBAL_ChunnelVerdict_Info[lNowMapID][Index].CampID or GLOBAL_ChunnelVerdict_Info[lNowMapID][Index].CampID == nil then
				local Peerage = API_GetActorPeerageLevel(ActorID)
				local ExpLevel = API_GetActorExpLevel(ActorID)
				local NeedPeerageMin = GLOBAL_ChunnelVerdict_Info[lNowMapID][Index].PeerageMin
				local NeedPeerageMax = GLOBAL_ChunnelVerdict_Info[lNowMapID][Index].PeerageMax
				if ExpLevel >= NeedPeerageMin then
					if ExpLevel <= NeedPeerageMax then
						return 1
					else
						local NeedPeerageMaxCN = GLOBAL_Exploit[NeedPeerageMax].PeerageDepict
						API_ActorSendMsg(ActorID, 2,'爵位高于'..NeedPeerageMaxCN..'的玩家不得入内')
						return 0
					end
				else
					local NeedPeerageMinCN = GLOBAL_Exploit[NeedPeerageMin].PeerageDepict
					API_ActorSendMsg(ActorID, 2,'爵位低于'..NeedPeerageMinCN..'的玩家不得入内')
					return 0
				end
			else
				API_ActorSendMsg(ActorID, 2,''..GLOBAL_CampName[CampID]..'人员不得入内')
				return 0
			end
		end
	end
	return 1
end
