-------------------------------
--文件名:	Scp\Lua\Other\LC_DiaoYuDao.lua
--版  权:	深圳腾讯计算机系统有限公司
--创建人:	刘操
--日  期:	2012-9-18
--版  本:	
--描  述:   钓鱼岛活动
--应  用:  
-------------------------------

local DiaoYuDao_StartTime = {Year = 2012,Month = 9,Day = 18,Hour = 0,Minute = 0,Second = 0}
local DiaoYuDao_EndTime = {Year = 2012,Month = 10,Day = 8,Hour = 0,Minute = 0,Second = 0}


if API_GetServerID() == 1 or API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
	if  DiaoYuDao_LoadingTimeTriggerGID ~= nil then
		API_DestroyTriggerG(DiaoYuDao_LoadingTimeTriggerGID)
	end
	DiaoYuDao_LoadingTimeTriggerGID = API_CreateTimerTriggerG(0,0,60,1,'DiaoYuDaoServerOpen')
end

function DiaoYuDaoServerOpen(Param1,Param2)
	if API_GetServerID() == 1 or API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
		local StartTimeTable = DiaoYuDao_StartTime
		local EndTimeTable = DiaoYuDao_EndTime
		local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
		local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
		if nShiFouStart > 0 then
			--活动未开始
			DiaoYuDao_DestroyNPC()
			if DiaoYuDao_StartDateTimeTriggerGID == nil then
				DiaoYuDao_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'DiaoYuDao_CreateNPC')
			else
				API_DestroyTriggerG(DiaoYuDao_StartDateTimeTriggerGID)
				DiaoYuDao_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'DiaoYuDao_CreateNPC')
			end
			if DiaoYuDao_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(DiaoYuDao_EndDateTimeTriggerGID)
			end
		elseif nShiFouStart <= 0 and nShiFouEnd > 0 then
			--活动开始
			DiaoYuDao_CreateNPC()
			if DiaoYuDao_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(DiaoYuDao_StartDateTimeTriggerGID)
			end
		elseif nShiFouEnd <= 0 then
			--活动结束
			DiaoYuDao_DestroyNPC()
			if DiaoYuDao_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(DiaoYuDao_StartDateTimeTriggerGID)
			end
			if DiaoYuDao_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(DiaoYuDao_EndDateTimeTriggerGID)
			end
		end
	end
end

function DiaoYuDao_CreateNPC()
	--创建帝国活动npc
	if API_GetServerID() == 1 then
		if DiaoYuDao_DGNPCFastID1 == nil then
			DiaoYuDao_DGNPCFastID1 = API_CreateMonsterEx(1,12380,210,206,4,0,-1,1)
		else
			if API_GetMonsterID(DiaoYuDao_DGNPCFastID1) > 0 then
				API_DestroyMonster(DiaoYuDao_DGNPCFastID1)
			end
			DiaoYuDao_DGNPCFastID1 = API_CreateMonsterEx(1,12380,210,206,4,0,-1,1)
		end
	end
	if API_GetServerID() == 1 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
		if DiaoYuDao_DGNPCFastID2 == nil then
			DiaoYuDao_DGNPCFastID2 = API_CreateMonsterEx(9,12380,147,380,3,0,-1,1)
		else
			if API_GetMonsterID(DiaoYuDao_DGNPCFastID2) > 0 then
				API_DestroyMonster(DiaoYuDao_DGNPCFastID2)
			end
			DiaoYuDao_DGNPCFastID2 = API_CreateMonsterEx(9,12380,147,380,3,0,-1,1)
		end
	end
	--创建联邦活动npc
	if API_GetServerID() == 1 then
		if DiaoYuDao_LBNPCFastID1 == nil then
			DiaoYuDao_LBNPCFastID1 = API_CreateMonsterEx(2,12380,241,169,4,0,-1,1)
		else
			if API_GetMonsterID(DiaoYuDao_LBNPCFastID1) > 0 then
				API_DestroyMonster(DiaoYuDao_LBNPCFastID1)
			end
			DiaoYuDao_LBNPCFastID1 = API_CreateMonsterEx(2,12380,241,169,4,0,-1,1)
		end
	end
	if API_GetServerID() == 1 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
		if DiaoYuDao_LBNPCFastID2 == nil then
			DiaoYuDao_LBNPCFastID2 = API_CreateMonsterEx(25,12380,124,322,3,0,-1,1)
		else
			if API_GetMonsterID(DiaoYuDao_LBNPCFastID2) > 0 then
				API_DestroyMonster(DiaoYuDao_LBNPCFastID2)
			end
			DiaoYuDao_LBNPCFastID2 = API_CreateMonsterEx(25,12380,124,322,3,0,-1,1)
		end
	end
	
	local StartTimeTable = DiaoYuDao_StartTime
	local EndTimeTable = DiaoYuDao_EndTime

	--创结束触发器
	if DiaoYuDao_EndDateTimeTriggerGID == nil then
		DiaoYuDao_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'DiaoYuDao_DestroyNPC')
	else
		API_DestroyTriggerG(DiaoYuDao_EndDateTimeTriggerGID)
		DiaoYuDao_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'DiaoYuDao_DestroyNPC')
	end
end

function DiaoYuDao_DestroyNPC()
	--删除帝国活动npc
	if DiaoYuDao_DGNPCFastID1 ~= nil then
		if API_GetMonsterID(DiaoYuDao_DGNPCFastID1) > 0 then
			API_DestroyMonster(DiaoYuDao_DGNPCFastID1)
		end
	end
	if DiaoYuDao_DGNPCFastID2 ~= nil then
		if API_GetMonsterID(DiaoYuDao_DGNPCFastID2) > 0 then
			API_DestroyMonster(DiaoYuDao_DGNPCFastID2)
		end
	end
	--删除联邦活动npc
	if DiaoYuDao_LBNPCFastID1 ~= nil then
		if API_GetMonsterID(DiaoYuDao_LBNPCFastID1) > 0 then
			API_DestroyMonster(DiaoYuDao_LBNPCFastID1)
		end
	end
	if DiaoYuDao_LBNPCFastID2 ~= nil then
		if API_GetMonsterID(DiaoYuDao_LBNPCFastID2) > 0 then
			API_DestroyMonster(DiaoYuDao_LBNPCFastID2)
		end
	end
end

--NPC对话
function BaoDiaoZhe(ActorID,NPCID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local StartTimeTable = DiaoYuDao_StartTime
	local EndTimeTable = DiaoYuDao_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		API_ResponseWrite('<name>爱国者</name>')
		API_ResponseWrite('<text>可恶的倭寇对我们的钓鱼岛虎视眈眈，具可靠消息今晚20点30分至21点他们会从夏日海滩登录，让我们一起击退他们吧!</text><br>')
		API_ResponseWrite('<br><a href="BaoDiaoZhe_Title?1=1">前往夏日海滩</a><br>')
	else
		API_ResponseWrite('<name>爱国者</name>')
		API_ResponseWrite('<text>守卫钓鱼岛活动已结束。</text><br>')
		API_ResponseWrite('<a>确定</a>')	
		return
	end
end

--条件判断
function BaoDiaoZhe_Title()
	local SelectItem = API_RequestGetNumber(1)
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local StartTimeTable = DiaoYuDao_StartTime
	local EndTimeTable = DiaoYuDao_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	
	local TeamID = API_GetTeamID(ActorID)
	
	if TeamID > 0 and API_GetTeamLeader(TeamID) ~= ActorID then
		API_ResponseWrite('<name>爱国者</name>')
		API_ResponseWrite('<br><text>你已经加入了队伍，那么叫你们队长来跟我对话。</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		return
	end
	
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel < 11 then
		API_ResponseWrite('<name>爱国者</name>')
		API_ResponseWrite('<br><text>您的</text><text color="255,0,255">等级</text><text>还不到11级，请提升等级后再来参与。</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
	if TeamID > 0 then
		local TeamSize = API_GetTeamSize(TeamID)
		for i = 1,TeamSize do
			local TeamActorID = API_GetTeamMem(TeamID,i)
			if API_ActorIsOnline(TeamActorID) then
				local TeamActorMapID = API_GetActorMapID(TeamActorID)
				local TeamActorIDLevel = API_GetActorExpLevel(TeamActorID)
				if TeamActorMapID ~= MapID then
				   API_ResponseWrite('<name>爱国者</name>')
				   API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>不在同一场景中。</text><br>')
				   API_ResponseWrite('<br><a>确定</a><br>')
				   API_ResponseFlush(ActorID)
				   return
				end
				if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
				  API_ResponseWrite('<name>爱国者</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>正在快递，无法前往夏日海滩！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
				end
				if API_ActorFindStatus(TeamActorID,519) then
				  API_ResponseWrite('<name>爱国者</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>正在摆摊，无法前往夏日海滩！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
				end
				if API_ActorIsDying(TeamActorID) then
				  API_ResponseWrite('<name>爱国者</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>死亡，无法前往夏日海滩！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
				end
				if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
				  API_ResponseWrite('<name>爱国者</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>在公交车上无法前往夏日海滩！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
				end
				local ExpLevel = API_GetActorExpLevel(TeamActorID)
				if ExpLevel < 11 then
					API_ResponseWrite('<name>爱国者</name>')
					API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>的等级低于11级，不能前往夏日海滩！</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)
					return
				end					
			end
		end
	else
		if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>快递中，无法前往夏日海滩！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 
		end
		if API_ActorFindStatus(ActorID,519) then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>摆摊中，无法前往夏日海滩！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 
		end
		if API_ActorIsDying(ActorID) then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>角色死亡，无法前往夏日海滩！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 
		end
		if API_VarDataGetNumber(ActorID,1,11816) > 0 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>在公交车上无法前往夏日海滩！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return
		end
	end
		
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if Hour == 20 and Minute >= 30 then
			DiaoYuDao_Create(ActorID)
		else
			API_ResponseWrite('<name>爱国者</name>')
			API_ResponseWrite('<text>现在还不是出发的时间，请20点30至21点再来找我。</text><br>')
			API_ResponseWrite('<a>确定</a>')	
			return
		end
	else
		API_ResponseWrite('<name>爱国者</name>')
		API_ResponseWrite('<text>守卫钓鱼岛活动已结束。</text><br>')
		API_ResponseWrite('<a>确定</a>')	
		return
	end
end

if DiaoYuDao_MapInfoTable == nil then
	DiaoYuDao_MapInfoTable = {}
end

if DiaoYuDao_MonsterFastID == nil then
	DiaoYuDao_MonsterFastID = {}
end

--创建副本
function DiaoYuDao_Create(ActorID)
	local ObjectMapID = API_CreateEctype(2025,0)  ---------------创建副本
	DiaoYuDao_MapInfoTable[ObjectMapID] = {}
	DiaoYuDao_MonsterFastID[ObjectMapID] = {}
	DiaoYuDao_MapInfoTable[ObjectMapID].number = 0
	DiaoYuDao_MapInfoTable[ObjectMapID].lunshu = 0
	--刷出去的门
	API_CreateMonster(ObjectMapID,11607,86,59,3,0,-1)
	
	local Camp = API_GetActorCamp(ActorID)
	local NPCID = 0
	if Camp == 0 then
		NPCID = 956001
	elseif Camp == 1 then
		NPCID = 957001
	end
	local FastID = API_CreateMonster(ObjectMapID,NPCID,67,62,3,0,-1)
	API_CreateDieTriggerG(ObjectMapID,0,0,FastID,'DiaoYuDao_DieFunc')
	
	DiaoYuDao_PlayGotoMap(ActorID,ObjectMapID)
	
	--创建时间触发器
	local TimeTriggerGID = API_CreateTimerTriggerG(ObjectMapID,ActorID,1,-1,'DiaoYuDao_Main_TimerTriggerCallFunc')
	DiaoYuDao_MapInfoTable[ObjectMapID].TimeTriggerGID = TimeTriggerGID
end

local DiaoYuDao_Monster = {
	[1]={name='东瀛战士',MonsterID = 30011,},
	[2]={name='东瀛武士',MonsterID = 30111,},
	[3]={name='东瀛火法',MonsterID = 30211,},
	[4]={name='东瀛火枪手',MonsterID = 30311,},
	[5]={name='东瀛冰法',MonsterID = 30411,},
	[6]={name='东瀛巫师',MonsterID = 30511,},
	[7]={name='东瀛凶狼',MonsterID = 30611,},
	[8]={name='东瀛攻城车',MonsterID = 30811,},
	[9]={name='东瀛火炮手',MonsterID = 838211,},
}
local DiaoYuDao_LuJing ={
	[1] = {
		TileX = 30,
		TileY = 67,
		PosNum = 3,
		lujing = {30,67,0,46,66,0,64,61,0},
		},
	[2] = {
		TileX = 58,
		TileY = 33,
		PosNum = 3,
		lujing = {58,33,0,61,48,0,64,61,0},
		},
	[3] = {
		TileX = 51,
		TileY = 86,
		PosNum = 3,
		lujing = {51,86,0,63,74,0,64,61,0},
		},
}

--传送进副本
function DiaoYuDao_PlayGotoMap(ActorID,ObjectMapID)
	local TileX = 83
	local TileY = 59
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorIsOnline(ActorID) then
		local MapID = API_GetActorMapID(ActorID)
		--判断组队
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) and MapID == API_GetActorMapID(TeamActorID) then
					API_ActorGoToMap(TeamActorID,ObjectMapID,TileX,TileY)
				end
			end
		else
			API_ActorGoToMap(ActorID,ObjectMapID,TileX,TileY)
		end
	end
end

--时间回调
function DiaoYuDao_Main_TimerTriggerCallFunc(ObjectMapID,ActorID)
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	local JinGongLunShu = '进攻轮数'.. DiaoYuDao_MapInfoTable[ObjectMapID].lunshu ..'\n'
	API_ActorBroadcastMsg(ObjectMapID,4,JinGongLunShu)

	DiaoYuDao_MapInfoTable[ObjectMapID].ShengYuNum = 0
	for i = 1,table.getn(DiaoYuDao_MonsterFastID[ObjectMapID]) do
	    MonsterID = API_GetMonsterID(DiaoYuDao_MonsterFastID[ObjectMapID][i])
		if MonsterID > 0 then
		   DiaoYuDao_MapInfoTable[ObjectMapID].ShengYuNum  = DiaoYuDao_MapInfoTable[ObjectMapID].ShengYuNum + 1
		end
	end 
	
	if DiaoYuDao_MapInfoTable[ObjectMapID].ShengYuNum == 0 then
		local Leixing = math.random(9)
		for i = 1,3 do
			for m = 1,8 do
				local MonsterID = DiaoYuDao_Monster[Leixing].MonsterID + DiaoYuDao_MapInfoTable[ObjectMapID].lunshu + 1
				local Name = DiaoYuDao_Monster[Leixing].name
				local FastID = API_CreateMonster(ObjectMapID,MonsterID,DiaoYuDao_LuJing[i].TileX,DiaoYuDao_LuJing[i].TileY,4,0,2) 
				API_SetMonsterName(FastID,Name,1)
				API_MonsterMoveTo(FastID,DiaoYuDao_LuJing[i].PosNum,DiaoYuDao_LuJing[i].lujing,1)
				DiaoYuDao_MapInfoTable[ObjectMapID].number = DiaoYuDao_MapInfoTable[ObjectMapID].number + 1
				DiaoYuDao_MonsterFastID[ObjectMapID][DiaoYuDao_MapInfoTable[ObjectMapID].number] = FastID
				API_CreateDieTriggerG(ObjectMapID,0,0,FastID,'DiaoYuDao_DieFunc')
			end
		end
		local Name = DiaoYuDao_Monster[Leixing].name
		DiaoYuDao_MapInfoTable[ObjectMapID].lunshu = DiaoYuDao_MapInfoTable[ObjectMapID].lunshu + 1
		API_ActorBroadcastMsg(ObjectMapID,1,'第'..PublicFun_ArabianNumberToChineseNumber(DiaoYuDao_MapInfoTable[ObjectMapID].lunshu)..'轮：'..Name..'开始大举进攻')
		if DiaoYuDao_MapInfoTable[ObjectMapID].lunshu == 10 then
			local FastID = API_CreateMonster(ObjectMapID,955001,30,67,4,0,2) 
			API_MonsterMoveTo(FastID,DiaoYuDao_LuJing[1].PosNum,DiaoYuDao_LuJing[1].lujing,1)
			API_CreateDieTriggerG(ObjectMapID,0,0,FastID,'DiaoYuDao_DieFunc')
			local TriggerID = DiaoYuDao_MapInfoTable[ObjectMapID].TimeTriggerGID
			API_DestroyTriggerG(TriggerID)
			local JinGongLunShu = '进攻轮数'.. DiaoYuDao_MapInfoTable[ObjectMapID].lunshu ..'\n'
			API_ActorBroadcastMsg(ObjectMapID,4,JinGongLunShu)
		end
	end
end

local DiaoYuDao_GoodsTable = {
	[1] = {
			{GoodsId=80696,Num=1,Odds=1000000,Band=0},
			{GoodsId=80696,Num=1,Odds=1000000,Band=0},
			{GoodsId=80696,Num=1,Odds=1000000,Band=0},
			{GoodsId=80696,Num=1,Odds=1000000,Band=0},
			{GoodsId=80696,Num=1,Odds=1000000,Band=0},
			{GoodsId=80696,Num=1,Odds=1000000,Band=0},
			{GoodsId=80696,Num=1,Odds=1000000,Band=0},
			{GoodsId=80696,Num=1,Odds=1000000,Band=0},
			{GoodsId=80696,Num=1,Odds=1000000,Band=0},
			{GoodsId=80696,Num=1,Odds=1000000,Band=0},
			{GoodsId=80697,Num=1,Odds=1000000,Band=0},
			{GoodsId=80697,Num=1,Odds=1000000,Band=0},
			{GoodsId=80697,Num=1,Odds=1000000,Band=0},
			{GoodsId=80697,Num=1,Odds=1000000,Band=0},
			{GoodsId=80697,Num=1,Odds=1000000,Band=0},
			{GoodsId=80498,Num=1,Odds=1000000,Band=0},
			{GoodsId=80498,Num=1,Odds=1000000,Band=0},
			{GoodsId=80498,Num=1,Odds=1000000,Band=0},
			{GoodsId=80498,Num=1,Odds=1000000,Band=0},
			{GoodsId=80498,Num=1,Odds=1000000,Band=0},
			{GoodsId=80498,Num=1,Odds=1000000,Band=0},
			{GoodsId=80498,Num=1,Odds=1000000,Band=0},
			{GoodsId=80498,Num=1,Odds=1000000,Band=0},
			{GoodsId=80498,Num=1,Odds=1000000,Band=0},
			{GoodsId=80498,Num=1,Odds=1000000,Band=0},
			{GoodsId=89186,Num=1,Odds=500000,Band=3},
			{GoodsId=89186,Num=1,Odds=500000,Band=3},
			{GoodsId=89186,Num=1,Odds=500000,Band=3},
			{GoodsId=250,Num=1,Odds=300000,Band=0},
			{GoodsId=250,Num=1,Odds=300000,Band=0},
			{GoodsId=250,Num=1,Odds=300000,Band=0},
			{GoodsId=89074,Num=1,Odds=1000000,Band=0},
			{GoodsId=89074,Num=1,Odds=500000,Band=0},
			{GoodsId=89074,Num=1,Odds=100000,Band=0},
		},
	[2] = {
			{GoodsId=80689,Num=1,Odds=20000,Band=3},
			{GoodsId=80686,Num=1,Odds=20000,Band=3},
			{GoodsId=80954,Num=1,Odds=20000,Band=3},
			{GoodsId=75,Num=1,Odds=20000,Band=3},
			{GoodsId=80397,Num=1,Odds=20000,Band=3},
			{GoodsId=80274,Num=1,Odds=20000,Band=3},
			{GoodsId=82034,Num=1,Odds=20000,Band=3},
			{GoodsId=89118,Num=1,Odds=20000,Band=3},
			{GoodsId=39602,Num=1,Odds=20000,Band=3},
			{GoodsId=88991,Num=1,Odds=20000,Band=3},
		},
	[3] = {
			{GoodsId=38056,Num=1,Odds=50000,Band=3},
			{GoodsId=38057,Num=1,Odds=50000,Band=3},
			{GoodsId=38058,Num=1,Odds=50000,Band=3},
			{GoodsId=38059,Num=1,Odds=50000,Band=3},
			{GoodsId=38060,Num=1,Odds=50000,Band=3},
			{GoodsId=38063,Num=1,Odds=50000,Band=3},
			{GoodsId=38065,Num=1,Odds=50000,Band=3},
		},
}

--死亡回调
function DiaoYuDao_DieFunc(MapID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if MapID <= 0 then
		return
	end
	if not API_MapIsValid(MapID) then
		return
	end
	if MonsterID == 955001 then
		local DiaoLuoNum1 = table.getn(DiaoYuDao_GoodsTable[1])
		for i = 1,DiaoLuoNum1 do
			local GoodsTable = DiaoYuDao_GoodsTable[1][i]
			local GoodsId = GoodsTable.GoodsId
			local Num = GoodsTable.Num
			local Odds = GoodsTable.Odds
			local Band = GoodsTable.Band
			local Rand = math.random(1000000)
			if Rand <= Odds then
				API_CreateDropGoods(MapID,PosX,PosY,GoodsId,Num,Band,'掉落物品',4,0,600,60)
			end
		end
		
		local DiaoLuoNum2 = math.random(table.getn(DiaoYuDao_GoodsTable[2]))
		local GoodsTable = DiaoYuDao_GoodsTable[2][DiaoLuoNum2]
		local GoodsId = GoodsTable.GoodsId
		local Num = GoodsTable.Num
		local Odds = GoodsTable.Odds
		local Band = GoodsTable.Band
		local Rand = math.random(1000000)
		if Rand <= Odds then
			API_CreateDropGoods(MapID,PosX,PosY,GoodsId,Num,Band,'掉落物品',4,0,600,60)
		end
		
		local DiaoLuoNum3 = math.random(table.getn(DiaoYuDao_GoodsTable[3]))
		local GoodsTable = DiaoYuDao_GoodsTable[3][DiaoLuoNum3]
		local GoodsId = GoodsTable.GoodsId
		local Num = GoodsTable.Num
		local Odds = GoodsTable.Odds
		local Band = GoodsTable.Band
		local Rand = math.random(1000000)
		if Rand <= Odds then
			API_CreateDropGoods(MapID,PosX,PosY,GoodsId,Num,Band,'掉落物品',4,0,600,60)
		end		
		
		API_ActorBroadcastMsg(MapID,1,'成功击杀入侵者头目')
	elseif MonsterID == 956001 or MonsterID == 957001  then	
		local TriggerID = DiaoYuDao_MapInfoTable[MapID].TimeTriggerGID
		API_DestroyTriggerG(TriggerID)
		API_ActorBroadcastMsg(MapID,1,'守望塔被摧毁防守失败')
	else
		local Rand = math.random(10000)
		if Rand < 5000 then
			API_CreateDropGoods(MapID,PosX,PosY,80498,1,3,'掉落物品',4,0,600,60)
		end
	end
end


