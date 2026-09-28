-- ----------
-- 生活系统相关功能
-- Ver 20071203
-- ----------
--学习配方类生活技能 
Task_caiji_dibiao_taskIDGOODSduiyingtable = {[201]=452,[202]=563,[203]=558,[204]=554,[205]=458,[206]=552,[207]=454,[208]=463,[209]=569,[210]=1462,[211]=1512,[212]=1562,[213]=1612,[269]=607,[270]=618,[271]=627,[272]=302,[273]=309,[274]=322,}
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
	--艾钊用 任务矿
	if ResGoodsID >= 201 and ResGoodsID <= 213 or ResGoodsID >= 269 and ResGoodsID <= 274 then
		if Task_caiji_dibiao_taskIDGOODSduiyingtable[ResGoodsID] ~= nil then
			local taskid2 = 0
			if ResGoodsID == 271 then
				taskid2 = 630
			end
			local taskid = Task_caiji_dibiao_taskIDGOODSduiyingtable[ResGoodsID]
			if true == Fun_IsAcceptedTaskID(ActorID,taskid) then
				if 0 ==  TaskFrame_CanFinish(ActorID,0,taskid) then
					if taskid2 >0 then
						if true == Fun_IsAcceptedTaskID(ActorID,taskid2) then
							if 0 ==  TaskFrame_CanFinish(ActorID,0,taskid2) then
								return 1
							else
								return 0
							end		
						end
					end
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
	--佣兵团战争用
	if ResGoodsID == 276 then
		local task929renwubuzhou = 7650
		local jiaohushuju = API_VarDataGetNumber(ActorID,1,task929renwubuzhou)
		local jiaohushujuyu = math.mod(jiaohushuju,10) --余
		if jiaohushujuyu == 3 then
			return 1
		end
	end
	if ResGoodsID == 277 then
		local task928renwubuzhou = 7651
		local jiaohushuju = API_VarDataGetNumber(ActorID,1,task928renwubuzhou)
		local jiaohushujuyu = math.mod(jiaohushuju,10) --余
		if jiaohushujuyu == 3 then
			return 1
		end
	end
	if ResGoodsID == 278 then
		local task913renwubuzhou = 7665
		local task912renwubuzhou = 7666
		local jiaohushuju = API_VarDataGetNumber(ActorID,1,task913renwubuzhou)
		local jiaohushujuyu = math.mod(jiaohushuju,10) --余
		local jiaohushuju2 = API_VarDataGetNumber(ActorID,1,task912renwubuzhou)
		local jiaohushujuyu2 = math.mod(jiaohushuju2,10) --余
		if jiaohushujuyu == 3 or jiaohushujuyu2 == 3  then
			return 1
		end
	end
	--老万用 探矿
	if ResGoodsID >= 1501 and ResGoodsID <= 1516 then
		return 1
	end
	--采集金沙银沙
	if ResGoodsID == 214 or ResGoodsID == 215 then
		return 1
	end
	--雪人活动采集雪堆
	if ResGoodsID == 275 then
		return 1
	end
	--资源战争
	if MapConfigID == 101 then
	   if ResGoodsID == 101 or ResGoodsID == 102 or ResGoodsID == 103 then 
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
			   API_ActorSendMsg(ActorID,0,'您的负重量已达上限，请去材料加工师那里加工'..jinshuname..','..muname..','..shuijingname..'这三种材料。增加生活技能等级，可增加负重量。')
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
					return 1
			else
				API_ActorAddStatus(ActorID,3004,0)
					return 1
			end
		end
	end
	--例行活动2
	if MapConfigID == 104 then
		local zhuangtai = API_VarDataGetNumber(ActorID,1,7626)
		if ResGoodsID >=  224 and ResGoodsID <= 232 then --矿资源号段
			local chongwu = API_VarDataGetNumber(ActorID,1,7623)
			local chongwumID = API_VarDataGetNumber(ActorID,1,7622)
			local wupinID = 0
			if zhuangtai == 0 then
				API_ActorSendMsg(ActorID,0,'您没有为“饲养员”培养怪兽，不能进行采集。')
				API_ActorSendMsg(ActorID,7,'您没有为“饲养员”培养怪兽，不能进行采集。')
				return 0
			end
			if LiXingHuoDong2_chongwuwupintable[chongwumID] ~= nil then
				wupinID  = LiXingHuoDong2_chongwuwupintable[chongwumID]
			else
				API_ActorSendMsg(ActorID,0,'您身上没有“怪兽徽章”，不能进行采集')
				API_ActorSendMsg(ActorID,7,'您身上没有“怪兽徽章”，不能进行采集')
				return 0
			end
			if chongwu > 0 and wupinID > 0 then
				return 1
			else
				API_ActorSendMsg(ActorID,0,'您身上没有“怪兽徽章”，不能进行采集')
				return 0
			end
		end
		if ResGoodsID >= 216 and ResGoodsID <= 223 or ResGoodsID >= 233 and ResGoodsID <= 264 then --产物资源号段
			local playerbeibaokongjian = API_ActorGetPackageSize(ActorID)
			local chongwu = API_VarDataGetNumber(ActorID,1,7623)
			local chongwumID = API_VarDataGetNumber(ActorID,1,7622)
			--if zhuangtai == 0 then
			--	API_ActorSendMsg(ActorID,0,'您没有为“饲养员”培养怪兽，不能进行采集。')
			--	API_ActorSendMsg(ActorID,7,'您没有为“饲养员”培养怪兽，不能进行采集。')
			--	return 0
			--end
			local wupinID = 0
			if LiXingHuoDong2_chongwuwupintable[chongwumID] ~= nil then
				wupinID  = LiXingHuoDong2_chongwuwupintable[chongwumID]
			else
				API_ActorSendMsg(ActorID,0,'您身上没有“怪兽徽章”，不能进行采集')
				API_ActorSendMsg(ActorID,7,'您身上没有“怪兽徽章”，不能进行采集')
				return 0
			end
			if chongwu > 0 and wupinID > 0 then
				if playerbeibaokongjian > 0 then
					return 1
				else
					API_ActorSendMsg(ActorID,0,'您身上的背包空间不足，不能获得物品')
					return 0
				end
			else
				API_ActorSendMsg(ActorID,0,'您身上没有“怪兽徽章”，不能进行采集')
				return 0
			end
		end
	end
	--胡林 张春明需求 城战矿
	if ResGoodsID == 265 or ResGoodsID == 266 or ResGoodsID == 267 or ResGoodsID == 268 then
		return 1
	end
	--张春明塔防矿
	if ResGoodsID == 105 or ResGoodsID == 106 or ResGoodsID == 107 or ResGoodsID == 108 or ResGoodsID == 109 or ResGoodsID == 110 then
		return 1
	end
	--中秋活动
	if ResGoodsID == 281 then 
		local ExpLevel = API_GetActorExpLevel(ActorID)
		if ExpLevel < 16 then
			API_ActorSendMsg(ActorID,8,'等级低于16级不能砍伐月桂树')
			return 0
		end
		return 1
	end
	if ResGoodsID == 282 then 
		local ExpLevel = API_GetActorExpLevel(ActorID)
		if ExpLevel < 16 then
			API_ActorSendMsg(ActorID,8,'等级低于16级不能挖掘金矿')
			return 0
		end
		return 1
	end
	if ResGoodsID == 283 or ResGoodsID == 284 or ResGoodsID == 285 or ResGoodsID == 286 then 
		local ExpLevel = API_GetActorExpLevel(ActorID)
		if ExpLevel < 16 then
			API_ActorSendMsg(ActorID,8,'等级低于16级不能挖掘晶石矿')
			return 0
		end
		return 1
	end
	if ResGoodsID == 287 then 
		local ExpLevel = API_GetActorExpLevel(ActorID)
		if ExpLevel < 16 then
			API_ActorSendMsg(ActorID,8,'等级低于16级不能挖掘资源矿')
			return 0
		end
		return 1
	end
	if ResGoodsID == 280 then --佣兵团PVE副本
		if MapConfigID == 1999 then
			if API_ActorFindStatus(ActorID,770) == true then
--API_Trace('有BUFF=')			
				--API_ActorSendMsg(ActorID,0,'您中了瘟疫，现在不能进行采集')
				API_ActorSendMsg(ActorID,2,'您中了瘟疫，现在不能进行采集')
				return 0
			else			
--API_Trace('无BUFF=')			
				return 1
			end
		else
			return 0
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
	--老万用 探矿
	if ResGoodsID >= 1501 and ResGoodsID <= 1516 then
		return 0
	end
	--采集金沙银沙
	if ResGoodsID == 214 or ResGoodsID == 215 then
		return 0
	end
	--雪人活动采集雪堆
	if ResGoodsID == 275 then
		return 0
	end
	--中秋活动
	if ResGoodsID == 281 then 
		if MapConfigID == 10 or MapConfigID == 23 then
			if math.random(100) <= 2 then
				local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
				local FastID = API_CreateMonster(MapID,726321,TileX,TileY,0,0,-1)
				API_CreateDieTriggerG(ActorID,0,0,FastID,'MoonFestival_YueGuiJingDieFunc')
				API_ActorBroadcastMsg(MapID,1,''..API_GetActorName(ActorID)..'在砍伐月桂树的时候放出了'..API_GetMonsterNameByID(726321)..'')
				API_ActorBroadcastMsg(MapID,17,''..API_GetActorName(ActorID)..'在砍伐月桂树的时候放出了'..API_GetMonsterNameByID(726321)..'')
			end
		end
		return 0
	end
	--金矿副本
	if ResGoodsID == 282 then 
		if math.random(100) <= 2 then
			local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
			local ExpLevel = API_GetActorExpLevel(ActorID)
			local MonsterID = 954040
			if ExpLevel >= 41 then
				MonsterID =	954065
			end
			local FastID = API_CreateMonster(MapID,MonsterID,TileX,TileY,0,0,-1)
			API_CreateDieTriggerG(ActorID,0,0,FastID,'JiNuJinKuang_MonsterDie')
			API_ActorBroadcastMsg(MapID,1,''..API_GetActorName(ActorID)..'在挖金矿的时候放出了'..API_GetMonsterNameByID(MonsterID)..'')
			API_ActorBroadcastMsg(MapID,17,''..API_GetActorName(ActorID)..'在挖金矿的时候放出了'..API_GetMonsterNameByID(MonsterID)..'')
		end
		return 0
	end
	--资源战争
	if MapConfigID == 101 then
		if ResGoodsID == 101 or ResGoodsID == 102 or ResGoodsID == 103 then 	
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
			API_ActorAddStatus(ActorID,501001,0) --挖坑不能隐身
			if zhanlingybt == 0 then
				API_ActorAddStatus(ActorID,3004,0) 
				API_ActorAddHunger(ActorID,8)
				return 0
			end
			if zhanlingybt == TopConsortiaId then
				--API_ActorAddStatus(ActorID,5002,0)--每次多产出1个
				API_ActorAddHunger(ActorID,8)
				return 0
			else
				API_ActorAddStatus(ActorID,3004,0)
				API_ActorAddHunger(ActorID,8)
				return 0
			end
		end
	end
	--例行活动2
	if MapConfigID == 104 then
		if ResGoodsID >= 224 and ResGoodsID <= 232 then --矿资源号段
			if bSuccessful == 1 then
				local jiazhi = 0
				if LiXingHuoDong2_siliao_table[ResGoodsID] ~= nil then
					jiazhi = LiXingHuoDong2_siliao_table[ResGoodsID] --获取饲料的 增加值
				end
				LiXingHuoDong2_siliaoadd_jisuan(ActorID,jiazhi,1,ResGoodsID)
				LiXingHuoDong2_suijishijiancaijihuidiao1(ActorID,ResGoodsID)
				return 1
			end
		end
		if ResGoodsID >= 216 and ResGoodsID <= 223 or ResGoodsID >= 233 and ResGoodsID <= 264 then --产物资源号段
			if bSuccessful == 1 then
				return 0
			end
		end
	end
	if ResGoodsID == 280 then --佣兵团PVE副本	
		if MapConfigID == 1999 then		
			if API_ActorFindStatus(ActorID,770) == true then 			
			else				
				local gerenjifen = API_VarDataGetNumber(ActorID,1,12114)
				local YBTjifen = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.ybt_zyzh_shuaxinqi1)				
				gerenjifen = gerenjifen + 10
				YBTjifen = YBTjifen + 10				
				API_VarDataSetNumber(ActorID,1,12114,gerenjifen)
				local gerenjifen2 = API_VarDataGetNumber(ActorID,1,12114)		
				local TopConsortiaId = API_GetTopConsortiaId(ActorID)
				if TopConsortiaId > 0 then
					API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.ybt_zyzh_shuaxinqi1,YBTjifen)
				end
				API_ActorSendMsg(ActorID,2,'采集物资成功，获得10积分，当前积分为'..gerenjifen2..'')			
				if API_ActorGetPackageSize(ActorID) > 0 then			
					local shifouhuoqusuipian = API_VarDataGetNumber(ActorID,1,12115) --碎片记录				
					if shifouhuoqusuipian == 0 then
						local shusuishu = math.random(1,1000000)					
						if shusuishu <= 1543 then --1543							
							local shusuiji = math.random(88125,88127)						
							if HeroSkillBookTable[shusuiji] ~=	nil then							
								if type(HeroSkillBookTable[shusuiji]) == 'table' then
									local canyeid = math.random(1,4)									
									local jianlicanyeID = 0
									if HeroSkillBookTable[shusuiji][canyeid] ~= nil then								
										jianlicanyeID =  HeroSkillBookTable[shusuiji][canyeid]									
										API_AddActorGoods(ActorID,jianlicanyeID,1,'佣兵团PVE获得')										
										API_VarDataSetNumber(ActorID,1,12115,1)
										local PlayName =  API_GetActorName(ActorID)
										API_ActorBroadcastMsg(MapID,17,''..PlayName..'在命运之地活动中，采集物资意外的获得了“'..API_GetGoodsName(jianlicanyeID)..'”！')
										API_ActorBroadcastMsgEx(MapID,-1,0,1,''..PlayName..'采集物资时意外的获得了“'..API_GetGoodsName(jianlicanyeID)..'”！')	
-------------------------------------------------------------------------------------------------------风向标 秘籍残卷获得数
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										local Type = 3
										if GLOBAL_FengXiangBiao_DateList[29][Type][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[29][Type][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[29][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[29][Type][LaiYuan] + 1
										end
-------------------------------------------------------------------------------------------------------风向标										
									end
								end
							end
						end	
					end	
				end
			end	
			return 1	
		end
	end
	return 0
end
--产物和饲料分开处理
--产物返回0 饲料返回1
--产物需要做背包控制 满了禁止挖