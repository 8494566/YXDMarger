------------------------------------------------------------------------------------------------------------
--文件名：	\scp\Lua\Other\FriendKillMonster.lua
--版  权：	(C)  深圳网域计算机网络有限公司
--创建人：	刘疆蓝
--日  期：	2009-08-04
--版  本：	1.0
--描  述：	地表杀怪加友好度 
--应  用：	
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
--修改人：	刘疆蓝
--日  期：	2009-08-04
--描  述：	创建
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

--定义交互
local TriggerNum = 19101
local HaoGanDuJiaoHu = 19102	

--定义表
if  PlayFrinendTable == nil then  
	PlayFrinendTable = {} 
end

FriendKillMonsterTable = {
[	-13	] = 	2	,
[	-12	] = 	4	,
[	-11	] = 	6	,
[	-10	] = 	8	,
[	-9	] = 	10	,
[	-8	] = 	12	,
[	-7	] = 	14	,
[	-6	] = 	16	,
[	-5	] = 	18	,
[	-4	] = 	20	,
[	-3	] = 	20	,
[	-2	] = 	20	,
[	-1	] = 	20	,
[	0	] = 	20	,
[	1	] = 	20	,
[	2	] = 	20	,
[	3	] = 	20	,
[	4	] = 	20	,
[	5	] = 	21	,
[	6	] = 	22	,
[	7	] = 	23	,
[	8	] = 	24	,
[	9	] = 	25	,
[	10	] = 	26	,
[	11	] = 	27	,
[	12	] = 	28	,
[	13	] = 	29	,
[	14	] = 	30	,

}

FriendKillMonster_BossTab = {
	[850005] = 1,
	[850006] = 1,
	[850011] = 1,
	[850012] = 1,
	[850015] = 1,
	[850016] = 1,
}

--上线处理
function FriendKillMonster_OnLogin() 
	local ActorID = API_RequestGetActorID() 
	local TeamID = API_GetTeamID(ActorID) 
	if TeamID > 0  then  
		FriendKillMonster_Format(ActorID,TeamID,Type)	
	end
end

--下线处理
function FriendKillMonster_OnLogout() 
	local ActorID = API_RequestGetActorID() 
	local ChunChuID = API_VarDataGetNumber(ActorID, 0, TriggerNum) 
	if ChunChuID > 0 then 
		API_DestroyTrigger(ActorID, -1, ChunChuID) 
		API_VarDataSetNumber(ActorID, 0, TriggerNum,0) 
	end 
	PlayFrinendTable[ActorID] = nil
end

--切出地图
function FriendKillMonster_OnLogoutMap() 
	local ActorID = API_RequestGetActorID() 
	local ChunChuID = API_VarDataGetNumber(ActorID, 0, TriggerNum) 
	if ChunChuID > 0 then 
		API_DestroyTrigger(ActorID, -1, ChunChuID) 
		API_VarDataSetNumber(ActorID, 0, TriggerNum,0) 
	end
	PlayFrinendTable[ActorID] = nil
end

--进入地图
function FriendKillMonster_OnLoginMap() 
	local ActorID = API_RequestGetActorID() 
	local TeamID = API_GetTeamID(ActorID)
	if TeamID > 0 then
		FriendKillMonster_Format(ActorID,TeamID,Type)
	end 
end  

--杀怪函数
function FriendKillMonster_TriggerCallFunc(ActorID,TaskID, MonsterID) 
	local TeamID = API_GetTeamID(ActorID) 
	local ActorMap = API_GetActorMapID(ActorID) 
	if TeamID > 0 then 
		local TeamSize = API_GetTeamSize(TeamID)
		for i = 1,TeamSize do 
			local TeamActorID = API_GetTeamMem(TeamID,i) 
			if API_ActorIsOnline(TeamActorID) then
				if ActorID ~= TeamActorID and API_GetRelation(TeamActorID,ActorID,1) == 0 then 
					local TeamActorMap = API_GetActorMapID(TeamActorID)
					if PlayFrinendTable[TeamActorID] == nil then 
						PlayFrinendTable[TeamActorID] = {}
					end
					if PlayFrinendTable[TeamActorID][ActorID] == nil then 
						PlayFrinendTable[TeamActorID][ActorID] = 0
					end
					local IsNear = false
					local X = API_GetActorPosX(ActorID) 
					local Y = API_GetActorPosY(ActorID) 
					local X1 = API_GetActorPosX(TeamActorID) 
					local Y1 = API_GetActorPosY(TeamActorID) 
					if math.abs(X - X1) <= 30 and math.abs(Y - Y1) <= 30 then
						IsNear = true  
					end 
					local TongMap = false	
					if ActorMap == TeamActorMap then 
						TongMap = true 
					end 
					if IsNear == true and TongMap == true then 
						local ShaGuaiZongJiFen = PlayFrinendTable[TeamActorID][ActorID]
						local ZongGongJiFen =0
						if FriendKillMonster_BossTab[MonsterID] ~= nil then
							ZongGongJiFen = 20000 
						else
							local PlayerLv = API_GetActorExpLevel(TeamActorID) 
							local MonsterLv = API_GetMonsterLvByID(MonsterID) 
							local LV = MonsterLv - PlayerLv 
							if LV >= -13 then
								if FriendKillMonsterTable[LV] ~= nil then 
									ZongGongJiFen = FriendKillMonsterTable[LV] 
								end
							elseif LV > 13 then
								ZongGongJiFen = 30
							end
						end
						ShaGuaiZongJiFen =  ShaGuaiZongJiFen + ZongGongJiFen   
						PlayFrinendTable[TeamActorID][ActorID] =  ShaGuaiZongJiFen
						if ShaGuaiZongJiFen >= 1000 then
							AddedFavor = math.floor(ShaGuaiZongJiFen / 1000)
							local HaoGanDu = API_GetRelation(TeamActorID,ActorID,2)
							HaoGanDu = HaoGanDu + AddedFavor
							if HaoGanDu < 4000 then
								API_UpdateRelation(TeamActorID,ActorID,2,HaoGanDu)
								HaoYouZhuDuiXiTong_UpdateRelation(TeamActorID,ActorID)
								PlayFrinendTable[TeamActorID][ActorID] = math.mod(ShaGuaiZongJiFen,1000)
							end
						end
					end
				end
			end
		end
	end
end


	
--加入队伍与离开队伍
function FriendKillMonster_OnTeamMemberCall(ActorID,TeamID,Type) 
	if API_ActorIsOnline(ActorID) then
		if Type == 0 then
			FriendKillMonster_Format(ActorID,TeamID,Type)
			
		elseif Type == 1 then
			local ChunChuID = API_VarDataGetNumber(ActorID, 0, TriggerNum) 
			if ChunChuID >0 then 
				API_DestroyTrigger(ActorID, -1, ChunChuID) 
				API_VarDataSetNumber(ActorID, 0, TriggerNum,0)
			end
		end
	end
end

--解散队伍
function FriendKillMonster_OutTeam(ActorID,TeamID)  
	if API_ActorIsOnline(ActorID) then
		local ChunChuID = API_VarDataGetNumber(ActorID, 0, TriggerNum) 
		if ChunChuID >0 then 
			API_DestroyTrigger(ActorID, -1, ChunChuID) 
			API_VarDataSetNumber(ActorID, 0, TriggerNum,0) 
		end 
		PlayFrinendTable[ActorID] = nil
	end
	
end

--调用的初始化函数
function FriendKillMonster_Format(ActorID,TeamID,Type)	
	local TeamSize = API_GetTeamSize(TeamID) 
	local PanDuan = 0  
	if TeamSize > 1 then
		for i = 1,TeamSize do 
			local TeamActorID = API_GetTeamMem(TeamID,i) 
			if API_ActorIsOnline(TeamActorID) then
				local ChunChuID = API_VarDataGetNumber(TeamActorID,0, TriggerNum) 
				if ChunChuID > 0 then 
					API_DestroyTrigger(TeamActorID, -1, ChunChuID)  
				end
				for j = 1,TeamSize do
					local OtherTeamActorID = API_GetTeamMem(TeamID,j) 
					if TeamActorID ~= OtherTeamActorID and API_ActorIsOnline(OtherTeamActorID) then
						local TeamActorMapID = API_GetActorMapID(TeamActorID)
						if TeamActorMapID == API_GetStaticMapID(TeamActorMapID) and API_GetActorMapID(TeamActorID) == API_GetActorMapID(OtherTeamActorID) then
							local FriendKillMonster_TriggerCallFuncID = API_CreateKillMonsterTrigger(TeamActorID, 0, -1, 0, 0, -1, 'FriendKillMonster_TriggerCallFunc') 
							API_VarDataSetNumber(TeamActorID, 0, TriggerNum, FriendKillMonster_TriggerCallFuncID)
							break
						end
					end
				end
			end
		end
	end
end
