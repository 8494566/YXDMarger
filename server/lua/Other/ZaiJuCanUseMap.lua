function CanUseVehical(ActorID,MapID)
	if API_GetStaticMapID(MapID) == 2020 then
		return 1
	elseif API_GetStaticMapID(MapID) == 2043 then
		return 1
	end
	if Decide_BattleType(MapID) == 4 then	--拉锯
		return 0
	else
		if API_IsCurVehicalHaveTheSkill(ActorID,5) then
			return 1
		else
			return 0
		end
	end
end

function ActorTakeOnVehical(ActorID,index)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if 	MapConfigID == ZJGJ_Dennis_WBMapID then
		--玩家是否处于载具可攻击状态
		if API_IsVehicalAttackState(ActorID) <=	0 then
			return
		else
			local StatusTime = API_IsVehicalAttackState(ActorID) * 1000	     
			API_ActorAddStatus(ActorID, ZJGJ_Dennis_StatusID , StatusTime)     
		end	
	end
end

function ActorTakeOffVehical(ActorID,index)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if 	MapConfigID == ZJGJ_Dennis_WBMapID then
		--玩家是否处于载具可攻击状态
		if API_ActorFindStatus(ActorID, ZJGJ_Dennis_ZStatusID)	== true then
			API_ActorRemoveStatus(ActorID, ZJGJ_Dennis_StatusID)
		end	
	end	
end
