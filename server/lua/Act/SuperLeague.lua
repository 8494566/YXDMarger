----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\SuperLeague.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-8-27
--版  本:	1.0
--描  述:	超级联赛系统
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-8-27
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------

--加载联赛全局交互数据
if API_VarDataGetNumber_Ex(1,0,-2,1,170) == 0 then
	API_VarDataLoad_Ex(1,0,-2)
end
if API_VarDataGetNumber_Ex(1,0,-3,1,170) == 0 then
	API_VarDataLoad_Ex(1,0,-2)
end

--联赛赛场地图ID
GLOBAL_SuperLeagueMapID = 0

--A队柱子ID

--B队柱子ID



--总进度控制器
function SuperLeague_Main_TimerTriggerCallFunc(MapID,CampID)
	--比赛时间：每天中午 
	--平常每天2场
	--周五3场
	--周六周日下午晚上
	local year,month,day,hour,min,sec,wday = PublicFun_time()
	if wday == 7 and hour > 0 then
		
	end
	--如果到了入场时间
	if Time == GoinTime then
		for i in SuperLeague_SaiChangMapIDList do
			local SaiChangMapID = i
			if API_MapIsValid(SaiChangMapID) and type(SuperLeague_SaiChangMapIDList[i]) == 'table' and type(SuperLeague_SaiChangMapIDList[i][1]) == 'table' and type(SuperLeague_SaiChangMapIDList[i][2]) == 'table' then
				--删除赛场入口的火柱
				for k in SuperLeague_SaiChangMapIDList[i].RuKouHuoZhu do
					local HuoZhuFastID = SuperLeague_SaiChangMapIDList[i].RuKouHuoZhu[k]
					if API_GetMonsterID(HuoZhuFastID) > 0 then
						API_DestroyMonster(HuoZhuFastID)
					end
				end
			end
		end
	end
	--如果判断是到了开场时间
	if Time == OpenTime then
		for i in SuperLeague_SaiChangMapIDList do
			local SaiChangMapID = i
			if API_MapIsValid(SaiChangMapID) and type(SuperLeague_SaiChangMapIDList[i]) == 'table' and type(SuperLeague_SaiChangMapIDList[i][1]) == 'table' and type(SuperLeague_SaiChangMapIDList[i][2]) == 'table' then
				local DuiyuanNum1 = 0
				local DuiyuanNum2 = 0
				for j in SuperLeague_SaiChangMapIDList[i][1].DuiyuanList do
					local DuiYuanID = SuperLeague_SaiChangMapIDList[i][1].DuiyuanList[j]
					if API_ActorIsOnline(DuiYuanID) and API_GetActorMapID(DuiYuanID) == SaiChangMapID then
						DuiyuanNum1 = DuiyuanNum1 + 1
					end
				end
				for j in SuperLeague_SaiChangMapIDList[i][2].DuiyuanList do
					local DuiYuanID = SuperLeague_SaiChangMapIDList[i][2].DuiyuanList[j]
					if API_ActorIsOnline(DuiYuanID) and API_GetActorMapID(DuiYuanID) == SaiChangMapID then
						DuiyuanNum2 = DuiyuanNum2 + 1
					end
				end
				if DuiyuanNum1 < 5 and DuiyuanNum2 >= 5 then
					--判定第二队直接胜利
				elseif DuiyuanNum1 >= 5 and DuiyuanNum2 < 5 then
					--判定第一队直接胜利
				elseif DuiyuanNum1 < 5 and DuiyuanNum2 < 5 then
					--双方均缺赛，双方均不加积分
				elseif DuiyuanNum1 >= 5 and DuiyuanNum2 >= 5 then
					--双方人数足够，开打
					--删除赛场中间的火柱
					for k in SuperLeague_SaiChangMapIDList[i].GeLiDaiHuoZhu do
						local HuoZhuFastID = SuperLeague_SaiChangMapIDList[i].GeLiDaiHuoZhu[k]
						if API_GetMonsterID(HuoZhuFastID) > 0 then
							API_DestroyMonster(HuoZhuFastID)
						end
					end
					--比赛开始
				end
			end
		end
	end
	
	--如果到了终场时间
	if Time == OverTime then
		for i in SuperLeague_SaiChangMapIDList do
			local SaiChangMapID = i
			if API_MapIsValid(SaiChangMapID) and type(SuperLeague_SaiChangMapIDList[i]) == 'table' and type(SuperLeague_SaiChangMapIDList[i][1]) == 'table' and type(SuperLeague_SaiChangMapIDList[i][2]) == 'table' then
				--记录最后比分
				--结束比赛
				--广播结算界面
				--创建清场触发器
			end
		end
	end
	--如果到了超级联赛结算时间
end



--报名函数
function SuperLeague_BattleMaker(ActorID,NPCID)
	if ActorID ==nil then
		ActorID = API_RequestGetActorID()
	end
	local TopConsortiaID = API_GetTopConsortiaId(ActorID)
	if TopConsortiaID <= 0 then
		API_ResponseWrite('<text>想要参加佣兵团联赛的比赛吗？</text><br><text color="255,0,255">你必须先加入佣兵团才行哦！</text><br>')
		API_ResponseWrite('<br><a>取消进入</a><br>')
		return
	end
	local TopConsortiaLeaderID = API_ConGetNumInfo(TopConsortiaID,4)
	if ActorID == TopConsortiaLeaderID then
	--判断角色是否是佣兵团团长
		--如果是
		API_VarDataGetNumber_Ex(1,1,-1,1,1)
		--获取佣兵图应该参加哪个级别的联赛
		--获取该佣兵团所对应的联赛等级，判断是否应该在本岛报名
		
			--如果允许，做扣钱判断与操作
			--扣钱成功后开创团队的比赛休息室，将比赛休息室对应的地图ID记录到佣兵团信息表中去
			--传送团长长进入比赛休息室，设置团长比赛资格，赠送三张队长卡和17张队员卡
			
			local DuiShouTopConsortiaID = 0
			local MapID = API_CreateEctype(1948,0)
			SuperLeague_OnBattleCreate(MapID,TopConsortiaID,DuiShouTopConsortiaID)
			API_ActorGoToMap(ActorID,MapID,212,241)
				
			--否则提示玩家去对应的岛报名
	else
	--否则
		--查询其所在的佣兵团应该在哪个岛参赛
			--如果在本岛
				--查询团队信息表判断其团长是否已经开创了比赛休息室
				--如果已经开创休息室，让玩家选择是否进入比赛休息室
				--没有开创休息室提示玩家需要团长才能报名比赛
			--否则提示玩家去哪个岛参赛
	end
end


--队员卡使用函数
function SuperLeague_PlayerCard_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,962) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == GLOBAL_SuperLeagueMapID then
		--判断所处地图
		local TopConsortiaID = API_GetTopConsortiaId(ActorID)
		if TopConsortiaID <= 0 then
			return 0
		end
		local TopConsortiaLeaderID = API_ConGetNumInfo(TopConsortiaID,4)
		if ActorID == TopConsortiaLeaderID then
			--判断使用者身份
			if OK then
				--判断是否处于比赛报名后的准备期
				API_ActorStartSelect(ActorID,'SuperLeague_PlayerCard',16) 
				API_ActorSendMsg(ActorID,3,'请指定参赛队员')
			else
				return 0
			end
		else
			return 0
		end
		
		--让玩家选择队员
	end
	
end


function SuperLeague_PlayerCard()
	--判断所处地图
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 
	if API_ActorGetGoodsNum(ActorID,962) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == GLOBAL_SuperLeagueMapID then
		--判断所处地图
		local TopConsortiaID = API_GetTopConsortiaId(ActorID)
		if TopConsortiaID <= 0 then
			return 0
		end
		local TopConsortiaLeaderID = API_ConGetNumInfo(TopConsortiaID,4)
		if ActorID == TopConsortiaLeaderID then
			--判断使用者身份
			if OK then
				--判断被选择者的身份
				if OK then
					--加入被选择这进入成员表
				end
			end
		end
	end
end


--队长卡使用函数
function SuperLeague_LeaderCard_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,963) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
end

SuperLeague_SaiChangMapIDList = {}
SuperLeague_MonsterList = {}
SuperLeague_GuaiWuWeiZhiBiao = {
[1] = {TileX=168,TileY=158},
[2] = {TileX=175,TileY=165},
[3] = {TileX=183,TileY=158},
[4] = {TileX=175,TileY=150},
[5] = {TileX=202,TileY=158},
[6] = {TileX=210,TileY=166},
[7] = {TileX=219,TileY=157},
[8] = {TileX=211,TileY=149},
[9] = {TileX=241,TileY=159},
[10] = {TileX=248,TileY=166},
[11] = {TileX=256,TileY=158},
[12] = {TileX=249,TileY=150},
}

SuperLeague_GeLiDaiWeiZhiBiao = {
[1]={NpcID=11458,TileX=168,TileY=141},
[2]={NpcID=11458,TileX=175,TileY=141},
[3]={NpcID=11458,TileX=182,TileY=141},
[4]={NpcID=11458,TileX=189,TileY=141},
[5]={NpcID=11458,TileX=196,TileY=141},
[6]={NpcID=11458,TileX=203,TileY=141},
[7]={NpcID=11458,TileX=210,TileY=141},
[8]={NpcID=11458,TileX=217,TileY=141},
[9]={NpcID=11458,TileX=224,TileY=141},
[10]={NpcID=11458,TileX=231,TileY=141},
[11]={NpcID=11458,TileX=238,TileY=141},
[12]={NpcID=11458,TileX=245,TileY=141},
[13]={NpcID=11458,TileX=252,TileY=141},
[14]={NpcID=11458,TileX=259,TileY=141},

[15]={NpcID=11465,TileX=168,TileY=173},
[16]={NpcID=11465,TileX=175,TileY=173},
[17]={NpcID=11465,TileX=182,TileY=173},
[18]={NpcID=11465,TileX=189,TileY=173},
[19]={NpcID=11465,TileX=196,TileY=173},
[20]={NpcID=11465,TileX=203,TileY=173},
[21]={NpcID=11465,TileX=210,TileY=173},
[22]={NpcID=11465,TileX=217,TileY=173},
[23]={NpcID=11465,TileX=224,TileY=173},
[24]={NpcID=11465,TileX=231,TileY=173},
[25]={NpcID=11465,TileX=238,TileY=173},
[26]={NpcID=11465,TileX=245,TileY=173},
[27]={NpcID=11465,TileX=252,TileY=173},
[28]={NpcID=11465,TileX=259,TileY=173},
}

SuperLeague_ZhiYuanWeiZhiBiao = {
[1] = {TileX=176,TileY=157,},
[2] = {TileX=211,TileY=157,},
[3] = {TileX=248,TileY=158,},
}

--战场创建回调
function SuperLeague_OnBattleCreate(MapID,TopConsortiaID,DuiShouTopConsortiaID)
	SuperLeague_SaiChangMapIDList[MapID] = {}
	SuperLeague_SaiChangMapIDList[MapID][1] = {}
	SuperLeague_SaiChangMapIDList[MapID][2] = {}
	--创建得分柱
	local FastID = API_CreateMonsterEx(MapID,11611,212,93,1,0,-1,1)
	SuperLeague_SaiChangMapIDList[MapID][1].DefenzhuA = FastID
	API_SetMonsterPKTeamID(FastID,TopConsortiaID)
	
	FastID = API_CreateMonsterEx(MapID,11611,212,72,1,0,-1,1)
	SuperLeague_SaiChangMapIDList[MapID][1].DefenzhuB = FastID
	API_SetMonsterPKTeamID(FastID,TopConsortiaID)
	
	FastID = API_CreateMonsterEx(MapID,11611,212,222,1,0,-1,1)
	SuperLeague_SaiChangMapIDList[MapID][2].DefenzhuA = FastID
	API_SetMonsterPKTeamID(FastID,DuiShouTopConsortiaID)
	
	FastID = API_CreateMonsterEx(MapID,11611,212,243,1,0,-1,1)
	SuperLeague_SaiChangMapIDList[MapID][2].DefenzhuB = FastID
	API_SetMonsterPKTeamID(FastID,DuiShouTopConsortiaID)
	
	--创建入口传送门
	--下方入口传送门
	FastID = API_CreateMonsterEx(MapID,11327,158,104,1,0,-1,0)
	--上方入口传送门
	FastID = API_CreateMonsterEx(MapID,11327,157,220,1,0,-1,0)
	
	--创建入口火柱
	--下方入口火柱
	SuperLeague_SaiChangMapIDList[i].RuKouHuoZhu = {}
	FastID = API_CreateMonsterEx(MapID,11464,158,102,1,0,-1,0)
	SuperLeague_SaiChangMapIDList[MapID].RuKouHuoZhu[1] = FastID
	FastID = API_CreateMonsterEx(MapID,11464,158,106,1,0,-1,0)
	SuperLeague_SaiChangMapIDList[MapID].RuKouHuoZhu[2] = FastID
	FastID = API_CreateMonsterEx(MapID,11466,158,220,1,0,-1,0)
	SuperLeague_SaiChangMapIDList[MapID].RuKouHuoZhu[3] = FastID
	
	--休息室隔离火柱
	FastID = API_CreateMonsterEx(MapID,11455,162,102,1,0,-1,0)
	FastID = API_CreateMonsterEx(MapID,11455,162,106,1,0,-1,0)
	FastID = API_CreateMonsterEx(MapID,11457,162,220,1,0,-1,0)
	
	--创建中间隔离带火柱
	for i = 1,table.getn(SuperLeague_GeLiDaiWeiZhiBiao) do
	--创建怪物表
		local NpcID = SuperLeague_GeLiDaiWeiZhiBiao[i].NpcID
		local TileX = SuperLeague_GeLiDaiWeiZhiBiao[i].TileX
		local TileY = SuperLeague_GeLiDaiWeiZhiBiao[i].TileY
		local FastID = API_CreateMonsterEx(MapID,NpcID,TileX,TileY,1,0,-1,-1)
		SuperLeague_SaiChangMapIDList[MapID].GeLiDaiHuoZhu[i] = FastID
		
	end
	
	
	--创建火鸟
	SuperLeague_MonsterList[MapID] = {}
	for i = 1,table.getn(SuperLeague_GuaiWuWeiZhiBiao) do
	--创建怪物表
		local TileX = SuperLeague_GuaiWuWeiZhiBiao[i].TileX
		local TileY = SuperLeague_GuaiWuWeiZhiBiao[i].TileY
		local FastID = API_CreateMonsterEx(MapID,271161,TileX,TileY,1,0,-1,-1)
		SuperLeague_MonsterList[MapID][i] = FastID
		--创建怪物死亡触发器
		API_CreateDieTriggerG(MapID,i,0,FastID,'SuperLeague_XiaoBingSiWang')
	end
	--创建BOSS
	local BOSSlist={[1]=271149,[2]=271152,[3]=271155}
	local BossID = BOSSlist[math.random(3)]
	FastID = API_CreateMonsterEx(MapID,BossID,285,157,1,0,-1,-1)
	--创建Boss死亡触发器
	API_CreateDieTriggerG(MapID,0,0,FastID,'SuperLeague_XiaoBingSiWang')
	--创建冲锋车
	FastID = API_CreateMonsterEx(MapID,11609,212,82,1,0,-1,-1)
	API_SetMonsterPKTeamID(FastID,TopConsortiaID)
	FastID = API_CreateMonsterEx(MapID,11610,212,233,5,0,-1,-1)
	API_SetMonsterPKTeamID(FastID,DuiShouTopConsortiaID)
	
	
	--创建资源
	for i in SuperLeague_ZhiYuanWeiZhiBiao do
		local TileX = SuperLeague_ZhiYuanWeiZhiBiao[i].TileX
		local TileY = SuperLeague_ZhiYuanWeiZhiBiao[i].TileY
		if TileX ~= nil and TileY ~= nil then
			for k = TileX - 2 ,TileX + 2,2 do
				for l = TileY - 2 ,TileY + 2,2 do
					if API_HaveNoBlockTile(MapID,k,l,1) then
						API_CreateResBoxEx(MapID,k,l,104,99999,'联赛战场矿',4)
					end
				end
			end
		end
	end
	
	
end

--点击入场传送门
function SuperLeague_RuChang(ActorID,NPCID)
	local MapID = API_GetActorMapID(ActorID)
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	--如果到了入场时间
	if Time == GoinTime then
		if '身份合法' then
			--
			--判断职业
			--
		end
	else
		API_ResponseWrite('<text>目前还没到比赛入场时间，不能入场</text><br>')
	end
end


function SuperLeague_XiaoBingSiWang(MapID,XuHao,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if KillerType ~= -1 or KillerID ~= -1 then
		if SuperLeague_MonsterList[MapID] ~= nil then
			API_CreateTimerTriggerG(MapID,XuHao,5,1, 'SuperLeague_XiaoBingChongJian')
		end
	end
end

function SuperLeague_XiaoBingChongJian(MapID,XuHao)
	local TileX = SuperLeague_Gaiwuweizhibiao[XuHao].TileX
	local TileY = SuperLeague_Gaiwuweizhibiao[XuHao].TileY
	local FastID = API_CreateMonsterEx(MapID,271161,TileX,TileY,1,0,-1,-1)
	SuperLeague_MonsterList[MapID][XuHao] = FastID
	--创建怪物死亡触发器
	API_CreateDieTriggerG(MapID,i,0,FastID,'SuperLeague_XiaoBingSiWang')
	--添加怪物状态
	
end



--点击得分柱
function SuperLeague_Defenzhu(ActorID,NPCID)
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	if API_GetMonsterID(FastID) <= 0 then
		API_ResponseClear()
		API_ResponseEnd()
		return
	end
	if API_GetMonsterMap(FastID) ~= MapID then
		API_ResponseClear()
		API_ResponseEnd()
		return
	end
	if API_ActorGetPropNum(ActorID,16) ~= API_MonsterGetPropNum(FastID,16) then
		--判断点击的人是否有带冲锋车
		local Chongfengche = API_VarDataGetNumber(ActorID,1,18327)
		if API_GetMonsterID(Chongfengche) <= 0 or API_GetMonsterPrizeActor(Chongfengche) ~= ActorID then
			API_ResponseWrite('<text color="255,0,0">必须携带冲锋车</text><text>点击敌方得分柱才能得分</text><br>')
			return
		end
		local TopConsortiaID = API_GetTopConsortiaId(ActorID)
		local ZhuduiID = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.ZhuduiID)
		local KeduiID = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.KeduiID)
		local Zhuduidefen = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Zhuduidefen)
		local Keduidefen = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Keduidefen)
		if TopConsortiaID == ZhuduiID then
			Zhuduidefen = Zhuduidefen + 1
			API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.Zhuduidefen,Zhuduidefen)
		else
			Keduidefen = Keduidefen + 1
			API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.Keduidefen,Keduidefen)
		end
		API_DestroyMonster(Chongfengche)
		return
	else
		API_ResponseWrite('<text>必须携带冲锋车点击</text><text color="255,0,0">敌方得分柱</text><text>才能得分</text><br>')
		return
	end
end

