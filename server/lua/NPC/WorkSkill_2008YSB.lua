-- ----------
-- 生活系统相关功能
-- Ver 20071203
-- ----------
--学习配方类生活技能 
Task_caiji_dibiao_taskIDGOODSduiyingtable = {[201]=452,[202]=563,[203]=558,[204]=554,[205]=458,[206]=552,[207]=454,[208]=463,}
function WorkSkill_StudySkillByGoods(ActorID,GoodsID,Location,ObjectX,ObjectY,lParam_1,lParam_2,lParam_3,lParam_4) 
	if API_ActorStudyWorkSkill(ActorID,lParam_1) then
		return 1
	else
		return 0
	end
end

--判断能否采集战场矿. 在角色准备采集战场矿时 通知调用
--传入参数: 角色ID,战场矿物品ID
--返回: 1，可以采集；0 不能采集   (不能采集的原因在此函数里提示)
function CanUseBattleWorkSkill(ActorID,ResGoodsID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local fuzhongshangxian = API_VarDataGetNumber(ActorID,1,7558)
	local dangqianwupin = API_VarDataGetNumber(ActorID,1,7560)
	local CampID = API_GetActorCamp(ActorID)
	if ResGoodsID >= 201 and ResGoodsID <= 208 then
		if Task_caiji_dibiao_taskIDGOODSduiyingtable[ResGoodsID] ~= nil then
			local taskid = Task_caiji_dibiao_taskIDGOODSduiyingtable[ResGoodsID]
			if true == Fun_IsAcceptedTaskID(ActorID,taskid) then
				if 0 ==  TaskFrame_CanFinish(nActorID, nNPCID,nTaskID) then
					return 1
				else
					return 0
				end
			else
				return 0
			end
		else
			return 0
		end
	end
	if MapConfigID == 23 or MapConfigID == 25 then
	   local X = API_GetActorPosX(ActorID)
	   local Y = API_GetActorPosY(ActorID)
	   local weizhi
	   local zhanlingybt
	   local TopConsortiaId = API_GetTopConsortiaId(ActorID)
	   local jinengID
	   for i = 1,3 do 
			local x1 = ybt_zyzh_zysxqtable[MapConfigID][i].x
			local y1 = ybt_zyzh_zysxqtable[MapConfigID][i].y
			if PublicFun_AccountDistance(X,Y,x1,y1) <= 25 then
					weizhi = i
			break
			end
		end
		API_ActorRemoveStatus(ActorID,191001)
		if weizhi == 1 then
			zhanlingybt = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.ybt_zyzh_shuaxinqi1)
		elseif weizhi == 2 then
			zhanlingybt = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.ybt_zyzh_shuaxinqi2)
		elseif weizhi == 3 then
			zhanlingybt = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.ybt_zyzh_shuaxinqi3)
		end
		local jinshuname = API_GetGoodsName(80560)
		local muname = API_GetGoodsName(80561)
		local shuijingname = API_GetGoodsName(80562)
		if fuzhongshangxian == 0 then
			fuzhongshangxian = 250
			API_VarDataSetNumber(ActorID,1,7558,250)
		end
		if dangqianwupin >= fuzhongshangxian then
		   API_ActorSendMsg(ActorID,2,'您的负重量已达上限，请去材料加工师那里加工'..jinshuname..','..muname..','..shuijingname..'这三种材料。增加生活技能等级，可增加负重量。')
			return 0
		end
		API_ActorAddStatus(ActorID,501001,0)
		if zhanlingybt == 0 then
			API_ActorAddStatus(ActorID,3004,0)  --减速BUFF
			return 1
		end
		if ResGoodsID == 101 then
			jinengID = 0
		elseif ResGoodsID == 102 then
			jinengID = 2
		elseif ResGoodsID == 103 then
			jinengID = 1
		end
		local jinenglevel = API_GetWorkSkillLevel(ActorID,jinengID)
		if zhanlingybt == TopConsortiaId then
			--API_ActorAddStatus(ActorID,5002,0)--每次多产出1个
			if MapConfigID == 23 then
				if CampID ==1 then
					API_ActorAddStatus(ActorID,5002,0) --5004
				end
			elseif MapConfigID == 25 then
				if CampID ==0 then
					API_ActorAddStatus(ActorID,5002,0)
				end
			end
			return 1
		else
			if MapConfigID == 23 then
				if CampID ==0 then
					API_ActorAddStatus(ActorID,3004,0)
					return 1
				end
			elseif MapConfigID == 25 then
				if CampID ==1 then
					API_ActorAddStatus(ActorID,3004,0)
					return 1
				end
			end
		end
	end
	return 0
end

--采集战场矿成功通知. 在角色成功采集战场矿时 通知调用
--传入参数: 角色ID,战场矿物品ID，产出的物品ID，产出的物品数量
--返回: 1，已处理; 0，未处理，产品直接放背包
function OnBattleSkillCompleted(ActorID,ResGoodsID,dwGoodsID,nGoodsNum,bSuccessful)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local CampID = API_GetActorCamp(ActorID)
	if MapConfigID == 23 or MapConfigID == 25 then
	   local X = API_GetActorPosX(ActorID)
	   local Y = API_GetActorPosY(ActorID)
	   local weizhi
	   local zhanlingybt
	   local TopConsortiaId = API_GetTopConsortiaId(ActorID)
	   for i = 1,3 do 
			local x1 = ybt_zyzh_zysxqtable[MapConfigID][i].x
			local y1 = ybt_zyzh_zysxqtable[MapConfigID][i].y
			if PublicFun_AccountDistance(X,Y,x1,y1) <= 25 then
					weizhi = i
			break
			end
		end
		API_ActorRemoveStatus(ActorID,191001)
		if weizhi == 1 then
			zhanlingybt = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.ybt_zyzh_shuaxinqi1)
		elseif weizhi == 2 then
			zhanlingybt = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.ybt_zyzh_shuaxinqi2)
		elseif weizhi == 3 then
			zhanlingybt = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.ybt_zyzh_shuaxinqi3)
		end
		API_ActorAddStatus(ActorID,501001,0)
		if zhanlingybt == 0 then
			API_ActorAddStatus(ActorID,3004,0) 
			return 0
		end
		if zhanlingybt == TopConsortiaId then
			--API_ActorAddStatus(ActorID,5002,0)--每次多产出1个
			if MapConfigID == 23 then
				if CampID ==1 then
					API_ActorAddStatus(ActorID,5002,0)
				end
			elseif MapConfigID == 25 then
				if CampID ==0 then
					API_ActorAddStatus(ActorID,5002,0)
				end
			end
			return 0
		else
			if MapConfigID == 23 then
				if CampID ==0 then
					API_ActorAddStatus(ActorID,3004,0)
				end
			elseif MapConfigID == 25 then
				if CampID ==1 then
					API_ActorAddStatus(ActorID,3004,0)
				end
			end
		return 0
		end
	end
	return 0
end

