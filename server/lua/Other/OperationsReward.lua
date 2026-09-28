----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\OperationsReward.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2009-5-11
--版  本:	1.0
--描  述:	运营奖励NPC
--应  用:  
---------------------------------------------------------------------


---------------------------------------------------------------------
--修改记录
--修改人：刘操
--日期：2010/3/23
--描述：增加战力达人活动
---------------------------------------------------------------------

OperationsReward_StartTime = {Year = 2009,Month = 5,Day = 22,Hour = 0,Minute = 0,Second = 0}   -------开始时间
OperationsReward_EndTime = {Year = 2010,Month = 5,Day = 31,Hour = 23,Minute = 59,Second = 59}   -------停止时间



OperationsReward_ActivityList = {
	[1] = {	
			Name = '初级声望达人' , 
			Title = 'OperationsReward_ActivityFunc1_Title' , 
			CanAccept = 'OperationsReward_ActivityFunc1_CanAccept' , 
			NeedLaJuZhanShengWang = 140,
			Reward = {
						{Type='Goods',ID=80498,Num=300,Bind=1},	
						{Type='Goods',ID=102,Num=30,Bind=1},	
						{Type='Goods',ID=202,Num=30,Bind=1},
						},
			RewardDate = 18372 , 
			RewardTime = 18373 ,
			},
	[2] = {
			Name = '中级声望达人' , 
			Title = 'OperationsReward_ActivityFunc2_Title' , 
			CanAccept = 'OperationsReward_ActivityFunc2_CanAccept' , 
			NeedLaJuZhanShengWang = 700,
			MaxFinishActorNum = 1000,
			Reward = {
						{Type='Goods',ID=80498,Num=1000,Bind=1},
						{Type='Goods',ID=103,Num=50,Bind=1},
						{Type='Goods',ID=203,Num=50,Bind=1},
						{Type='Goods',ID=80381,Num=10,Bind=1},
						{Type='Goods',ID=80383,Num=30,Bind=1},
						},
			RewardDate = 18374 , 
			RewardTime = 18375 , 
			},
	[3] = {
			Name = '高级声望达人' , 
			Title = 'OperationsReward_ActivityFunc3_Title' , 
			CanAccept = 'OperationsReward_ActivityFunc3_CanAccept' , 
			NeedLaJuZhanShengWang = 1400,
			MaxFinishActorNum = 100,
			Reward = {
						{Type='Money',Num=50000,},
						{Type='Goods',ID=80498,Num=1500,Bind=1},
						{Type='Goods',ID=80298,Num=40,Bind=1},
						{Type='Goods',ID=80273,Num=10,Bind=1},
						{Type='Goods',ID=119,Num=30,Bind=1},
						{Type='Goods',ID=208,Num=20,Bind=1},
						{Type='Goods',ID=80382,Num=10,Bind=1},
						{Type='Goods',ID=80384,Num=30,Bind=1},
						{Type='Goods',ID=315,Num=20,Bind=1},
						},
			RewardDate = 18376 , 
			RewardTime = 18377 , 
			},
--	[4] = {
--			Name = '顶级声望达人' , 
--			Title = 'OperationsReward_ActivityFunc4_Title' , 
--			CanAccept = 'OperationsReward_ActivityFunc4_CanAccept' , 
--			NeedLaJuZhanShengWang = 100,
--			MaxFinishActorNum = 1,
--			Reward = {
--						{Type='Money',Num=66666,},
--						{Type='Goods',ID=80498,Num=2000,Bind=1},
--						{Type='Goods',ID=80298,Num=66,Bind=1},
--						{Type='Goods',ID=80274,Num=66,Bind=1},
--						{Type='Goods',ID=31014,Num=1,Bind=1},
--						},
--			RewardDate = 18378 , 
--			RewardTime = 18379 , 
--			},
	[5] = {
			Name = '初级工匠达人' , 
			Title = 'OperationsReward_ActivityFunc5_Title' , 
			CanAccept = 'OperationsReward_ActivityFunc5_CanAccept' , 
			Reward = {
						{Type='Crystal',Num=50000},
						{Type='Goods',ID=501,Num=2,Bind=1},
						{Type='Goods',ID=80195,Num=20,Bind=1},
						{Type='Goods',ID=80191,Num=10,Bind=1},
						},
			RewardDate = 18380 , 
			RewardTime = 18381 , 
			},
	[6] = {
			Name = '中级工匠达人' , 
			Title = 'OperationsReward_ActivityFunc6_Title' , 
			CanAccept = 'OperationsReward_ActivityFunc6_CanAccept' , 
			MaxFinishActorNum = 1000,
			Reward = {
						{Type='Crystal',Num=100000},
						{Type='Goods',ID=501,Num=10,Bind=1},
						{Type='Goods',ID=80181,Num=10,Bind=1},
						{Type='Goods',ID=80196,Num=30,Bind=1},
						{Type='Goods',ID=80192,Num=10,Bind=1},
						{Type='Goods',ID=80486,Num=30,Bind=1},
						},
			RewardDate = 18382 , 
			RewardTime = 18383 , },
	[7] = {
			Name = '高级工匠达人' , 
			Title = 'OperationsReward_ActivityFunc7_Title' , 
			CanAccept = 'OperationsReward_ActivityFunc7_CanAccept' , 
			MaxFinishActorNum = 100,
			Reward = {
						{Type='Money',Num=20000,},
						{Type='Crystal',Num=200000},
						{Type='Goods',ID=501,Num=30,Bind=1},
						{Type='Goods',ID=80181,Num=20,Bind=1},
						{Type='Goods',ID=80197,Num=30,Bind=1},
						{Type='Goods',ID=80192,Num=20,Bind=1},
						{Type='Goods',ID=757,Num=10,Bind=1},
						{Type='Goods',ID=756,Num=10,Bind=1},
						{Type='Goods',ID=80486,Num=50,Bind=1},
						},
			RewardDate = 18384 , 
			RewardTime = 18385 , },
--	[8] = {
--			Name = '顶级工匠达人' , 
--			Title = 'OperationsReward_ActivityFunc8_Title' , 
--			CanAccept = 'OperationsReward_ActivityFunc8_CanAccept' , 
--			MaxFinishActorNum = 1,
--			Reward = {
--						{Type='Money',Num=100000,},
--						{Type='Crystal',Num=500000},
--						{Type='Goods',ID=501,Num=100,Bind=1},
--						},
--			RewardDate = 18386 , 
--			RewardTime = 18387 , 
--			},
	[9] = {
			Name = '战力达人',
			Title = 'OperationsReward_ActivityFunc9_Title',
			CanAccept='OperationsReward_ActivityFunc9_CanAccept',
			NeedZhanLiZhi = 8000,
			MaxFinishActorNum = 100,
			Reward = {
						{Type='Goods',ID=31026,Num=1,Bind=3},						
						},
			RewardDate = 30284 , 
			RewardTime = 30283 , 				
			},
}

--交互数据信息加载成功信息
if OperationsReward_OnLoadIDataOK == nil then
	OperationsReward_OnLoadIDataOK = 0
end

--加载全局交互数据
if API_VarDataGetNumber_Ex(1,0,-100,1,170) == 0 then
	API_VarDataLoad_Ex(1,0,-100)
end

if API_VarDataGetNumber_Ex(1,0,-6001,1,170) == 0 then
	API_VarDataLoad_Ex(1,0,-6001)
end

--活动开始创建活动NPC
function OperationsReward_CreateNPC(Param1,Param2)
	--判断数据是否初始化
	if OperationsReward_InitializationIsOk() == 0 then
		--执行数据初始化
		OperationsReward_Initialization()
	end
	--创建帝国活动npc
	if OperationsReward_DGNPCFastID == nil then
		OperationsReward_DGNPCFastID = API_CreateMonsterEx(82,12040,123,166,3,0,-1,1)
	else
		if API_GetMonsterID(OperationsReward_DGNPCFastID) > 0 then
			API_DestroyMonster(OperationsReward_DGNPCFastID)
		end
		OperationsReward_DGNPCFastID = API_CreateMonsterEx(82,12040,123,166,3,0,-1,1)
	end
	--创建联邦活动npc
	if OperationsReward_LBNPCFastID == nil then
		OperationsReward_LBNPCFastID = API_CreateMonsterEx(67,12040,125,171,3,0,-1,1)
	else
		if API_GetMonsterID(OperationsReward_LBNPCFastID) > 0 then
			API_DestroyMonster(OperationsReward_LBNPCFastID)
		end
		OperationsReward_LBNPCFastID = API_CreateMonsterEx(67,12040,125,171,3,0,-1,1)
	end
	local StartTimeTable = OperationsReward_StartTime
	local EndTimeTable = OperationsReward_EndTime
	--创结束触发器
	if OperationsReward_EndDateTimeTriggerGID == nil then
		OperationsReward_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'OperationsReward_DestroyNPC')
	else
		API_DestroyTriggerG(OperationsReward_EndDateTimeTriggerGID)
		OperationsReward_EndDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'OperationsReward_DestroyNPC')
	end
end

--活动结束删除活动NPC
function OperationsReward_DestroyNPC(Param1,Param2)
	--删除帝国活动npc
	if OperationsReward_DGNPCFastID ~= nil then
		if API_GetMonsterID(OperationsReward_DGNPCFastID) > 0 then
			API_DestroyMonster(OperationsReward_DGNPCFastID)
		end
	end
	--删除联邦活动npc
	if OperationsReward_LBNPCFastID ~= nil then
		if API_GetMonsterID(OperationsReward_LBNPCFastID) > 0 then
			API_DestroyMonster(OperationsReward_LBNPCFastID)
		end
	end
end



function OperationsReward_OnLogin()
	local ActorID = API_RequestGetActorID()
	for i in OperationsReward_ActivityList do
		if OperationsReward_CanAccept(ActorID,i) == 1 then
			--提示玩家去参加活动
		end
	end
end

--NPC默认对白
function OperationsReward_NPCDialog(ActorID,NPCID)
	--判断数据是否加载成功
	if OperationsReward_OnLoadIDataOK ~= 1 then
		return
	end
	--判断数据是否是活动时间
	if OperationsReward_IsActivityTime() == 0 then
		API_ResponseWrite('<text>目前不是活动时间</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		return
	end
	--判断数据是否进行过初始化
	if OperationsReward_InitializationIsOk() == 0 then
		--执行数据初始化
		OperationsReward_Initialization()
	end
	API_ResponseWrite('<text>目前正在举行 </text><text color="255,0,255">声望达人</text><text>, </text><text color="255,0,255">工匠达人</text><text>, </text><text color="255,0,255">战力达人</text><text> 评选活动</text><br>')
	API_ResponseWrite('<text>本次活动共评出 高级达人100名，中级达人1000名，初级达人若干</text><br>')
	API_ResponseWrite('<text>评出 战力达人100名</text><br>')
	API_ResponseWrite('<text>符合条件的达人可以来我这里领取奖励</text><br>')
	local EndTimeTable = OperationsReward_EndTime
	API_ResponseWrite('<text  color="0,255,255">活动截止 '.. EndTimeTable.Month ..'月'.. EndTimeTable.Day ..'日 '.. EndTimeTable.Hour ..'时'..  EndTimeTable.Minute ..'分 结束，奖品数量有限，先到先得</text><br>')
	for i in OperationsReward_ActivityList do
		if OperationsReward_CanAccept(ActorID,i) == 1 then
			local Name = OperationsReward_ActivityList[i].Name
			local Title = OperationsReward_ActivityList[i].Title
			if type(Title) == 'string' then	
				local Function = _G[Title]
				if type(Function) == 'function' then
					API_ResponseWrite('<br><a href="'..Title..'?1='..i..'">'..Name..'</a><br>')
				end
			end
		end
	end
end

--判断
function OperationsReward_IsActivityTime()
	local StartTimeTable = OperationsReward_StartTime
	local EndTimeTable = OperationsReward_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	--判断是否在活动时间内
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		return 1
	end
	return 0
end

--判断是否初始化数据
function OperationsReward_InitializationIsOk()
	local StartTimeTable = OperationsReward_StartTime
	local EndTimeTable = OperationsReward_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	--判断是否在活动时间内
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		local InitializationDate = API_VarDataGetNumber_Ex(1,0,-100,1,100)
		local InitializationTime = API_VarDataGetNumber_Ex(1,0,-100,1,101)
		InitializationDate = math.mod(InitializationDate,100000000)
		local LYear = math.floor(InitializationDate/10000)
		local LMonthDay = math.mod(InitializationDate,10000)
		local LMonth = math.floor(LMonthDay/100)
		local LDay = math.mod(LMonthDay,100)
		
		InitializationTime = math.mod(InitializationTime,1000000)
		local LHour = math.floor(InitializationTime/10000)
		local LMinuteSecond = math.mod(InitializationTime,10000)
		local LMinute = math.floor(LMinuteSecond/100)
		local LSecond = math.mod(LMinuteSecond,100)
		local nShiFouInitialization= API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
		if nShiFouStart - nShiFouInitialization <= 0 then
			return 1
		end
	end
	return 0
end

--执行初始化数据
function OperationsReward_Initialization()
	local StartTimeTable = OperationsReward_StartTime
	local EndTimeTable = OperationsReward_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	--判断是否在活动时间内
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		for i = 1,99 do
			API_VarDataSetNumber_Ex_Sync(1,0,-100,1,i,0)
		end
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local InitializationDate = Year * 10000 + Month * 100 + Day
		local InitializationTime = Hour * 10000 + Minute * 100 + Second
		API_VarDataSetNumber_Ex_Sync(1,0,-100,1,100,InitializationDate)
		API_VarDataSetNumber_Ex_Sync(1,0,-100,1,101,InitializationTime)
	end
end

--判断是否可接任务
function OperationsReward_CanAccept(ActorID,ActivityNo)
	if OperationsReward_ActivityList[ActivityNo] == nil then
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local StartTimeTable = OperationsReward_StartTime
	local EndTimeTable = OperationsReward_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	--判断是否在活动时间内
	if MapID == StaticMapID and API_VarDataGetNumber(ActorID,1,9901) > 0 and nShiFouStart <= 0 and nShiFouEnd > 0 then
		--判断是否领过活动奖励
		local RewardDate = OperationsReward_ActivityList[ActivityNo].RewardDate
		local RewardTime = OperationsReward_ActivityList[ActivityNo].RewardTime
		local Biaozhi = API_VarDataGetNumber(ActorID,1,RewardDate)
		local Biaozhi2 = API_VarDataGetNumber(ActorID,1,RewardTime)
		Biaozhi = math.mod(Biaozhi,100000000)
		local LYear = math.floor(Biaozhi/10000)
		local LMonthDay = math.mod(Biaozhi,10000)
		local LMonth = math.floor(LMonthDay/100)
		local LDay = math.mod(LMonthDay,100)
		
		Biaozhi2 = math.mod(Biaozhi2,1000000)
		local LHour = math.floor(Biaozhi2/10000)
		local LMinuteSecond = math.mod(Biaozhi,10000)
		local LMinute = math.floor(LMinuteSecond/100)
		local LSecond = math.mod(LMinuteSecond,100)
		local nShiFouReward = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
		if nShiFouStart - nShiFouReward > 0 or ActivityNo == 9 then
			--判断是否满足了解活动条件
			local String = OperationsReward_ActivityList[ActivityNo].CanAccept
			if type(String) == 'string' then
				local Function = _G[String]
				if type(Function) == 'function' then
					if Function(ActorID) == 1 then
						return 1
					end
				end
			end
		end
	end
	return 0
end



function OperationsReward_ActivityFunc1_CanAccept(ActorID)
	return 1
end


function OperationsReward_ActivityFunc1_Title()
	local ActorID = API_RequestGetActorID()
	local ActivityNo = 1
	if OperationsReward_CanAccept(ActorID,ActivityNo) == 1 then
		local LaJuZhanShengWang = API_VarDataGetNumber(ActorID,1,GLOBAL_LaJuZhanShengWang) --拉锯战声望
		local NeedLaJuZhanShengWang = OperationsReward_ActivityList[ActivityNo].NeedLaJuZhanShengWang
		local Name = OperationsReward_ActivityList[ActivityNo].Name
		if API_RequestGetNumber(1) == 999 then
			if LaJuZhanShengWang >= NeedLaJuZhanShengWang then
				local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
				local RewardDate = OperationsReward_ActivityList[ActivityNo].RewardDate
				local RewardTime = OperationsReward_ActivityList[ActivityNo].RewardTime
				local date = Year * 10000 + Month * 100 + Day
				local time = Hour * 10000 + Minute * 100 + Second
				API_VarDataSetNumber(ActorID,1,RewardDate,date)
				API_VarDataSetNumber(ActorID,1,RewardTime,time)
				local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
				if type(RewardTabel) ~= 'table' then
					return
				end
				API_ResponseWrite('<text>您获得 '..Name..' 的奖励：</text><br>')
				for i in RewardTabel do
					local Jiangli = RewardTabel[i]
					local JiangliType = Jiangli.Type
					local JiangliGoodsID = Jiangli.ID
					local JiangliNum = Jiangli.Num
					local Bind = Jiangli.Bind
					if JiangliType == 'Money' and JiangliNum > 0 then
						API_ActorAddMoney(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 金币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 金币')
						API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Exp' and JiangliNum > 0 then
						API_ActorAddExp(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 经验')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 经验')
						API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Crystal' and JiangliNum > 0 then
						API_ActorShoppingM_Add(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 水晶币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 水晶币')
						API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
						if API_ActorCanAddGoods(ActorID,JiangliGoodsID,JiangliNum,Bind,0) ~= -1 then
							API_AddActorGoodsFlag(ActorID,JiangliGoodsID,JiangliNum,Bind,Name)
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
						else
							API_SendActorMailByName(API_GetActorName(ActorID),JiangliGoodsID,JiangliNum,Bind,'['..Name..']','获得'..JiangliNum..'个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' （请到邮箱领取）</text><text>        </text>')
						end
					else
						return
					end
				end
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			local EndTimeTable = OperationsReward_EndTime
			API_ResponseWrite('<text color="255,0,255">在 '.. EndTimeTable.Month ..'月'.. EndTimeTable.Day ..'日 '.. EndTimeTable.Hour ..'时'..  EndTimeTable.Minute ..'分 活动结束前，只要您的 拉锯战声望达到'..NeedLaJuZhanShengWang..'</text><text> ，就可以在我这里领取一次奖励：</text><br>')
			local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
			if type(RewardTabel) ~= 'table' then
				return
			end
			for i in RewardTabel do
				local Jiangli = RewardTabel[i]
				local JiangliType = Jiangli.Type
				local JiangliGoodsID = Jiangli.ID
				local JiangliNum = Jiangli.Num
				local Bind = Jiangli.Bind
				if JiangliType == 'Money' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Exp' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Crystal' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
				else
					return
				end
			end
			if LaJuZhanShengWang >= NeedLaJuZhanShengWang then
				API_ResponseWrite('<br><br><text>目前您的拉锯战声望已达到 '..LaJuZhanShengWang..' ，符合 '..Name..' 的领奖条件！</text><br>')
				API_ResponseWrite('<br><a href="OperationsReward_ActivityFunc1_Title?1=999">领取奖励</a><br>')
			else
				API_ResponseWrite('<br><text>您的拉锯战声望是 '..LaJuZhanShengWang..' ，</text><text color="0,255,255">请前往拉锯战浮空岛赢取'.. NeedLaJuZhanShengWang - LaJuZhanShengWang ..'声望后再来领奖</text><text>！</text><br>')
			end
			API_ResponseWrite('<br><a>关闭</a><br>')
		end
	end
end


function OperationsReward_ActivityFunc2_CanAccept(ActorID)
	local ActivityNo = 2
	local VarData = 1
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 1 then
		VarData = 2
	end
	local RewardDate = OperationsReward_ActivityList[ActivityNo-1].RewardDate
	local RewardTime = OperationsReward_ActivityList[ActivityNo-1].RewardTime
	local LaJuZhanShengWang = API_VarDataGetNumber(ActorID,1,GLOBAL_LaJuZhanShengWang) --拉锯战声望
	local NeedLaJuZhanShengWang = OperationsReward_ActivityList[ActivityNo-1].NeedLaJuZhanShengWang
	local Biaozhi = API_VarDataGetNumber(ActorID,1,RewardDate)
	local Biaozhi2 = API_VarDataGetNumber(ActorID,1,RewardTime)
	Biaozhi = math.mod(Biaozhi,100000000)
	local LYear = math.floor(Biaozhi/10000)
	local LMonthDay = math.mod(Biaozhi,10000)
	local LMonth = math.floor(LMonthDay/100)
	local LDay = math.mod(LMonthDay,100)
	
	Biaozhi2 = math.mod(Biaozhi2,1000000)
	local LHour = math.floor(Biaozhi2/10000)
	local LMinuteSecond = math.mod(Biaozhi,10000)
	local LMinute = math.floor(LMinuteSecond/100)
	local LSecond = math.mod(LMinuteSecond,100)
	local nShiFouReward = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
	local StartTimeTable = OperationsReward_StartTime
	local EndTimeTable = OperationsReward_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if MapID == StaticMapID and API_VarDataGetNumber(ActorID,1,9901) > 0 and nShiFouStart <= 0 and nShiFouEnd > 0 then
		if nShiFouStart - nShiFouReward <= 0 then
			local MaxFinishActorNum = OperationsReward_ActivityList[ActivityNo].MaxFinishActorNum
			local NowFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData)
			if NowFinishActorNum < MaxFinishActorNum then
				return 1
			end
		end
	end
	return 0
end

function OperationsReward_ActivityFunc2_Title()
	local ActorID = API_RequestGetActorID()
	local ActivityNo = 2
	local VarData = 1
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 1 then
		VarData = 2
	end
	if OperationsReward_CanAccept(ActorID,ActivityNo) == 1 then
		local LaJuZhanShengWang = API_VarDataGetNumber(ActorID,1,GLOBAL_LaJuZhanShengWang) --拉锯战声望
		local NeedLaJuZhanShengWang = OperationsReward_ActivityList[ActivityNo].NeedLaJuZhanShengWang
		local MaxFinishActorNum = OperationsReward_ActivityList[ActivityNo].MaxFinishActorNum
		local NowFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData)
		local Name = OperationsReward_ActivityList[ActivityNo].Name
		if API_RequestGetNumber(1) == 999 then
			if LaJuZhanShengWang >= NeedLaJuZhanShengWang and MaxFinishActorNum > NowFinishActorNum then
				NowFinishActorNum = NowFinishActorNum + 1
				API_VarDataSetNumber_Ex_Sync(1,0,-100,1,VarData,NowFinishActorNum)
				local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
				local RewardDate = OperationsReward_ActivityList[ActivityNo].RewardDate
				local RewardTime = OperationsReward_ActivityList[ActivityNo].RewardTime
				local date = Year * 10000 + Month * 100 + Day
				local time = Hour * 10000 + Minute * 100 + Second
				API_VarDataSetNumber(ActorID,1,RewardDate,date)
				API_VarDataSetNumber(ActorID,1,RewardTime,time)
				local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
				if type(RewardTabel) ~= 'table' then
					return
				end
				API_ResponseWrite('<text>您获得 '..Name..' 的奖励：</text><br>')
				for i in RewardTabel do
					local Jiangli = RewardTabel[i]
					local JiangliType = Jiangli.Type
					local JiangliGoodsID = Jiangli.ID
					local JiangliNum = Jiangli.Num
					local Bind = Jiangli.Bind
					if JiangliType == 'Money' and JiangliNum > 0 then
						API_ActorAddMoney(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 金币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 金币')
						API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Exp' and JiangliNum > 0 then
						API_ActorAddExp(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 经验')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 经验')
						API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Crystal' and JiangliNum > 0 then
						API_ActorShoppingM_Add(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 水晶币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 水晶币')
						API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
						if API_ActorCanAddGoods(ActorID,JiangliGoodsID,JiangliNum,Bind,0) ~= -1 then
							API_AddActorGoodsFlag(ActorID,JiangliGoodsID,JiangliNum,Bind,Name)
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
						else
							API_SendActorMailByName(API_GetActorName(ActorID),JiangliGoodsID,JiangliNum,Bind,'['..Name..']','获得'..JiangliNum..'个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' （请到邮箱领取）</text><text>        </text>')
						end
					else
						return
					end
				end
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			local EndTimeTable = OperationsReward_EndTime
			API_ResponseWrite('<text color="255,0,255">在 '.. EndTimeTable.Month ..'月'.. EndTimeTable.Day ..'日 '.. EndTimeTable.Hour ..'时'..  EndTimeTable.Minute ..'分 活动结束前，只要您的 拉锯战声望达到'..NeedLaJuZhanShengWang..'</text><text> ，就可以在我这里领取一次奖励：</text><br>')
			local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
			if type(RewardTabel) ~= 'table' then
				return
			end
			for i in RewardTabel do
				local Jiangli = RewardTabel[i]
				local JiangliType = Jiangli.Type
				local JiangliGoodsID = Jiangli.ID
				local JiangliNum = Jiangli.Num
				local Bind = Jiangli.Bind
				if JiangliType == 'Money' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Exp' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Crystal' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
				else
					return
				end
			end
			API_ResponseWrite('<br><text color="255,0,0">最多允许'..MaxFinishActorNum..'人领奖，目前已经有'..NowFinishActorNum..'人领取过奖励！</text><br>')
			if LaJuZhanShengWang >= NeedLaJuZhanShengWang and MaxFinishActorNum > NowFinishActorNum then
				API_ResponseWrite('<br><br><text>目前您的拉锯战声望已达到 '..LaJuZhanShengWang..' ，符合 '..Name..' 的领奖条件！</text><br>')
				API_ResponseWrite('<br><a href="OperationsReward_ActivityFunc2_Title?1=999">领取奖励</a><br>')
			else
				API_ResponseWrite('<br><text>目前您的拉锯战声望是 '..LaJuZhanShengWang..' ，</text><text color="0,255,255">请前往拉锯战浮空岛赢取'.. NeedLaJuZhanShengWang - LaJuZhanShengWang ..'声望后再来领奖</text><text>！</text><br>')
			end
			API_ResponseWrite('<br><a>关闭</a><br>')
		end
	end
end


function OperationsReward_ActivityFunc3_CanAccept(ActorID)
	local ActivityNo = 3
	local VarData = 3
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 1 then
		VarData = 4
	end
	local MaxFinishActorNum = OperationsReward_ActivityList[ActivityNo].MaxFinishActorNum
	local NowFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData)
	if NowFinishActorNum >= MaxFinishActorNum then
		return 0
	end
	local RewardDate = OperationsReward_ActivityList[ActivityNo-1].RewardDate
	local RewardTime = OperationsReward_ActivityList[ActivityNo-1].RewardTime
	local LaJuZhanShengWang = API_VarDataGetNumber(ActorID,1,GLOBAL_LaJuZhanShengWang) --拉锯战声望
	local NeedLaJuZhanShengWang = OperationsReward_ActivityList[ActivityNo-1].NeedLaJuZhanShengWang
	local Biaozhi = API_VarDataGetNumber(ActorID,1,RewardDate)
	local Biaozhi2 = API_VarDataGetNumber(ActorID,1,RewardTime)
	Biaozhi = math.mod(Biaozhi,100000000)
	local LYear = math.floor(Biaozhi/10000)
	local LMonthDay = math.mod(Biaozhi,10000)
	local LMonth = math.floor(LMonthDay/100)
	local LDay = math.mod(LMonthDay,100)
	
	Biaozhi2 = math.mod(Biaozhi2,1000000)
	local LHour = math.floor(Biaozhi2/10000)
	local LMinuteSecond = math.mod(Biaozhi,10000)
	local LMinute = math.floor(LMinuteSecond/100)
	local LSecond = math.mod(LMinuteSecond,100)
	local nShiFouReward = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
	local StartTimeTable = OperationsReward_StartTime
	local EndTimeTable = OperationsReward_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if MapID == StaticMapID and API_VarDataGetNumber(ActorID,1,9901) > 0 and nShiFouStart <= 0 and nShiFouEnd > 0 then
		local ShangMaxFinishActorNum = OperationsReward_ActivityList[ActivityNo-1].MaxFinishActorNum
		local ShangFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData - 2)
		if nShiFouStart - nShiFouReward <= 0 then
			return 1
		elseif ShangFinishActorNum >= ShangMaxFinishActorNum then
			--2没完成，获取1是否完成
			local RewardDate = OperationsReward_ActivityList[1].RewardDate
			local RewardTime = OperationsReward_ActivityList[1].RewardTime
			local Biaozhi = API_VarDataGetNumber(ActorID,1,RewardDate)
			local Biaozhi2 = API_VarDataGetNumber(ActorID,1,RewardTime)
			Biaozhi = math.mod(Biaozhi,100000000)
			local LYear = math.floor(Biaozhi/10000)
			local LMonthDay = math.mod(Biaozhi,10000)
			local LMonth = math.floor(LMonthDay/100)
			local LDay = math.mod(LMonthDay,100)
			
			Biaozhi2 = math.mod(Biaozhi2,1000000)
			local LHour = math.floor(Biaozhi2/10000)
			local LMinuteSecond = math.mod(Biaozhi,10000)
			local LMinute = math.floor(LMinuteSecond/100)
			local LSecond = math.mod(LMinuteSecond,100)
			local nShiFouReward = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
			--判断是否完成1
			if nShiFouStart - nShiFouReward <= 0 then
				return 1
			else
				return 0
			end
		end
	end
	return 0
end

function OperationsReward_ActivityFunc3_Title()
	local ActorID = API_RequestGetActorID()
	local ActivityNo = 3
	local VarData = 3
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 1 then
		VarData = 4
	end
	if OperationsReward_CanAccept(ActorID,ActivityNo) == 1 then
		local LaJuZhanShengWang = API_VarDataGetNumber(ActorID,1,GLOBAL_LaJuZhanShengWang) --拉锯战声望
		local NeedLaJuZhanShengWang = OperationsReward_ActivityList[ActivityNo].NeedLaJuZhanShengWang
		local MaxFinishActorNum = OperationsReward_ActivityList[ActivityNo].MaxFinishActorNum
		local NowFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData)
		local Name = OperationsReward_ActivityList[ActivityNo].Name
		if API_RequestGetNumber(1) == 999 then
			if LaJuZhanShengWang >= NeedLaJuZhanShengWang and MaxFinishActorNum > NowFinishActorNum then
				NowFinishActorNum = NowFinishActorNum + 1
				API_VarDataSetNumber_Ex_Sync(1,0,-100,1,VarData,NowFinishActorNum)
				local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
				local RewardDate = OperationsReward_ActivityList[ActivityNo].RewardDate
				local RewardTime = OperationsReward_ActivityList[ActivityNo].RewardTime
				local date = Year * 10000 + Month * 100 + Day
				local time = Hour * 10000 + Minute * 100 + Second
				API_VarDataSetNumber(ActorID,1,RewardDate,date)
				API_VarDataSetNumber(ActorID,1,RewardTime,time)
				local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
				if type(RewardTabel) ~= 'table' then
					return
				end
				API_ResponseWrite('<text>您获得 '..Name..' 的奖励：</text><br>')
				for i in RewardTabel do
					local Jiangli = RewardTabel[i]
					local JiangliType = Jiangli.Type
					local JiangliGoodsID = Jiangli.ID
					local JiangliNum = Jiangli.Num
					local Bind = Jiangli.Bind
					if JiangliType == 'Money' and JiangliNum > 0 then
						API_ActorAddMoney(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 金币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 金币')
						API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Exp' and JiangliNum > 0 then
						API_ActorAddExp(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 经验')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 经验')
						API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Crystal' and JiangliNum > 0 then
						API_ActorShoppingM_Add(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 水晶币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 水晶币')
						API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
						if API_ActorCanAddGoods(ActorID,JiangliGoodsID,JiangliNum,Bind,0) ~= -1 then
							API_AddActorGoodsFlag(ActorID,JiangliGoodsID,JiangliNum,Bind,Name)
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
						else
							API_SendActorMailByName(API_GetActorName(ActorID),JiangliGoodsID,JiangliNum,Bind,'['..Name..']','获得'..JiangliNum..'个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' （请到邮箱领取）</text><text>        </text>')
						end
					else
						return
					end
				end
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			local EndTimeTable = OperationsReward_EndTime
			API_ResponseWrite('<text color="255,0,255">在 '.. EndTimeTable.Month ..'月'.. EndTimeTable.Day ..'日 '.. EndTimeTable.Hour ..'时'..  EndTimeTable.Minute ..'分 活动结束前，只要您的拉锯战声望达到'..NeedLaJuZhanShengWang..'</text><text> ，就可以在我这里领取一次奖励：</text><br>')
			local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
			if type(RewardTabel) ~= 'table' then
				return
			end
			for i in RewardTabel do
				local Jiangli = RewardTabel[i]
				local JiangliType = Jiangli.Type
				local JiangliGoodsID = Jiangli.ID
				local JiangliNum = Jiangli.Num
				local Bind = Jiangli.Bind
				if JiangliType == 'Money' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Exp' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Crystal' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
				else
					return
				end
			end
			API_ResponseWrite('<br><text color="255,0,0">最多允许'..MaxFinishActorNum..'人领奖，目前已经有'..NowFinishActorNum..'人领取过奖励！</text><br>')
			if LaJuZhanShengWang >= NeedLaJuZhanShengWang and MaxFinishActorNum > NowFinishActorNum then
				API_ResponseWrite('<br><br><text>目前您的拉锯战声望已达到 '..LaJuZhanShengWang..' ，符合 '..Name..' 的领奖条件！</text><br>')
				API_ResponseWrite('<br><a href="OperationsReward_ActivityFunc3_Title?1=999">领取奖励</a><br>')
			else
				API_ResponseWrite('<text>目前您的拉锯战声望是 '..LaJuZhanShengWang..' ，</text><text color="0,255,255">请前往拉锯战浮空岛赢取'.. NeedLaJuZhanShengWang - LaJuZhanShengWang ..'声望后再来领奖</text><text>！</text><br>')
			end
			API_ResponseWrite('<br><a>关闭</a><br>')
		end
	end
end


function OperationsReward_ActivityFunc4_CanAccept(ActorID)
	local ActivityNo = 4
	local VarData = 3
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 1 then
		VarData = 4
	end
	local RewardDate = OperationsReward_ActivityList[ActivityNo-1].RewardDate
	local RewardTime = OperationsReward_ActivityList[ActivityNo-1].RewardTime
	local LaJuZhanShengWang = API_VarDataGetNumber(ActorID,1,GLOBAL_LaJuZhanShengWang) --拉锯战声望
	local NeedLaJuZhanShengWang = OperationsReward_ActivityList[ActivityNo-1].NeedLaJuZhanShengWang
	local Biaozhi = API_VarDataGetNumber(ActorID,1,RewardDate)
	local Biaozhi2 = API_VarDataGetNumber(ActorID,1,RewardTime)
	Biaozhi = math.mod(Biaozhi,100000000)
	local LYear = math.floor(Biaozhi/10000)
	local LMonthDay = math.mod(Biaozhi,10000)
	local LMonth = math.floor(LMonthDay/100)
	local LDay = math.mod(LMonthDay,100)
	
	Biaozhi2 = math.mod(Biaozhi2,1000000)
	local LHour = math.floor(Biaozhi2/10000)
	local LMinuteSecond = math.mod(Biaozhi,10000)
	local LMinute = math.floor(LMinuteSecond/100)
	local LSecond = math.mod(LMinuteSecond,100)
	local nShiFouReward = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
	local StartTimeTable = OperationsReward_StartTime
	local EndTimeTable = OperationsReward_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if MapID == StaticMapID and API_VarDataGetNumber(ActorID,1,9901) > 0 and nShiFouStart <= 0 and nShiFouEnd > 0 then
		local ShangMaxFinishActorNum = OperationsReward_ActivityList[ActivityNo-1].MaxFinishActorNum
		local ShangFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData)
		if nShiFouStart - nShiFouReward <= 0 then
			return 1
		elseif ShangFinishActorNum >= ShangMaxFinishActorNum then
			--3没有的情况
			--获取2是否完成
			local RewardDate = OperationsReward_ActivityList[2].RewardDate
			local RewardTime = OperationsReward_ActivityList[2].RewardTime
			local Biaozhi = API_VarDataGetNumber(ActorID,1,RewardDate)
			local Biaozhi2 = API_VarDataGetNumber(ActorID,1,RewardTime)
			Biaozhi = math.mod(Biaozhi,100000000)
			local LYear = math.floor(Biaozhi/10000)
			local LMonthDay = math.mod(Biaozhi,10000)
			local LMonth = math.floor(LMonthDay/100)
			local LDay = math.mod(LMonthDay,100)
			
			Biaozhi2 = math.mod(Biaozhi2,1000000)
			local LHour = math.floor(Biaozhi2/10000)
			local LMinuteSecond = math.mod(Biaozhi,10000)
			local LMinute = math.floor(LMinuteSecond/100)
			local LSecond = math.mod(LMinuteSecond,100)
			local nShiFouReward = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
			local VarData = 1
			if CampID == 1 then
				VarData = 2
			end
			local ShangMaxFinishActorNum = OperationsReward_ActivityList[2].MaxFinishActorNum
			local ShangFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData)
			--判断是否完成2
			if nShiFouStart - nShiFouReward <= 0 then
				--完成2，直接显示4
				return 1
			elseif ShangFinishActorNum >= ShangMaxFinishActorNum then
				--2没完成且没有了，获取1是否完成
				local RewardDate = OperationsReward_ActivityList[1].RewardDate
				local RewardTime = OperationsReward_ActivityList[1].RewardTime
				local Biaozhi = API_VarDataGetNumber(ActorID,1,RewardDate)
				local Biaozhi2 = API_VarDataGetNumber(ActorID,1,RewardTime)
				Biaozhi = math.mod(Biaozhi,100000000)
				local LYear = math.floor(Biaozhi/10000)
				local LMonthDay = math.mod(Biaozhi,10000)
				local LMonth = math.floor(LMonthDay/100)
				local LDay = math.mod(LMonthDay,100)
				
				Biaozhi2 = math.mod(Biaozhi2,1000000)
				local LHour = math.floor(Biaozhi2/10000)
				local LMinuteSecond = math.mod(Biaozhi,10000)
				local LMinute = math.floor(LMinuteSecond/100)
				local LSecond = math.mod(LMinuteSecond,100)
				local nShiFouReward = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
				--判断是否完成1
				if nShiFouStart - nShiFouReward <= 0 then
					--1完成
					return 1
				else
					return 0
				end
			end
		end
	end
	return 0
end

function OperationsReward_ActivityFunc4_Title()
	local ActorID = API_RequestGetActorID()
	local ActivityNo = 4
	local CampID = API_GetActorCamp(ActorID)
	if OperationsReward_CanAccept(ActorID,ActivityNo) == 1 then
		local LaJuZhanShengWang = API_VarDataGetNumber(ActorID,1,GLOBAL_LaJuZhanShengWang) --拉锯战声望
		local EndTimeTable = OperationsReward_EndTime
		API_ResponseWrite('<text color="255,0,255">只要在 '.. EndTimeTable.Month ..'月'.. EndTimeTable.Day ..'日 '.. EndTimeTable.Hour ..'时'..  EndTimeTable.Minute ..'分 活动结束时，您的 拉锯战声望是'..GLOBAL_CampName[CampID]..'最高的</text><text>，那么您将收到'..GLOBAL_CampName[CampID]..'总督寄给您的超级大奖（通过邮箱领取）：</text><br>')
		local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
		if type(RewardTabel) ~= 'table' then
			return
		end
		for i in RewardTabel do
			local Jiangli = RewardTabel[i]
			local JiangliType = Jiangli.Type
			local JiangliGoodsID = Jiangli.ID
			local JiangliNum = Jiangli.Num
			local Bind = Jiangli.Bind
			if JiangliType == 'Money' and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Exp' and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Crystal' and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
			else
				return
			end
		end
		API_ResponseWrite('<br><br><text color="0,255,0">目前您的拉锯战声望是 '..LaJuZhanShengWang..' </text><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	end
	return 0
end



--工匠达人

function OperationsReward_ActivityFunc5_CanAccept(ActorID)
	return 1
end


function OperationsReward_ActivityFunc5_Title()
	local ActorID = API_RequestGetActorID()
	local ActivityNo = 5
	if OperationsReward_CanAccept(ActorID,ActivityNo) == 1 then
		local ManZhuTiaoJian = 0
		for i in GLOBAL_WorkSkillList do
			for j,v in GLOBAL_WorkSkillList[i] do
				if API_GetWorkSkillLevel(ActorID,v) >= 3 then
					ManZhuTiaoJian = 1
					break
				end
				if ManZhuTiaoJian == 1 then
					break
				end
			end
		end
		if API_RequestGetNumber(1) == 999 then
			if ManZhuTiaoJian == 1 then
				local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
				local RewardDate = OperationsReward_ActivityList[ActivityNo].RewardDate
				local RewardTime = OperationsReward_ActivityList[ActivityNo].RewardTime
				local date = Year * 10000 + Month * 100 + Day
				local time = Hour * 10000 + Minute * 100 + Second
				API_VarDataSetNumber(ActorID,1,RewardDate,date)
				API_VarDataSetNumber(ActorID,1,RewardTime,time)
				local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
				if type(RewardTabel) ~= 'table' then
					return
				end
				local Name = OperationsReward_ActivityList[ActivityNo].Name
				API_ResponseWrite('<text>您获得 '..Name..' 的奖励：</text><br>')
				for i in RewardTabel do
					local Jiangli = RewardTabel[i]
					local JiangliType = Jiangli.Type
					local JiangliGoodsID = Jiangli.ID
					local JiangliNum = Jiangli.Num
					local Bind = Jiangli.Bind
					if JiangliType == 'Money' and JiangliNum > 0 then
						API_ActorAddMoney(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 金币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 金币')
						API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Exp' and JiangliNum > 0 then
						API_ActorAddExp(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 经验')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 经验')
						API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Crystal' and JiangliNum > 0 then
						API_ActorShoppingM_Add(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 水晶币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 水晶币')
						API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
						if API_ActorCanAddGoods(ActorID,JiangliGoodsID,JiangliNum,Bind,0) ~= -1 then
							API_AddActorGoodsFlag(ActorID,JiangliGoodsID,JiangliNum,Bind,Name)
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
						else
							API_SendActorMailByName(API_GetActorName(ActorID),JiangliGoodsID,JiangliNum,Bind,'['..Name..']','获得'..JiangliNum..'个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' （请到邮箱领取）</text><text>        </text>')
						end
					else
						return
					end
				end
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			local EndTimeTable = OperationsReward_EndTime
			API_ResponseWrite('<text color="255,0,255">在 '.. EndTimeTable.Month ..'月'.. EndTimeTable.Day ..'日 '.. EndTimeTable.Hour ..'时'..  EndTimeTable.Minute ..'分 活动结束前，只要您 任意1个生活技能达到3级</text><text>，就可以在我这里领取一次奖励：</text><br>')
			local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
			if type(RewardTabel) ~= 'table' then
				return
			end
			for i in RewardTabel do
				local Jiangli = RewardTabel[i]
				local JiangliType = Jiangli.Type
				local JiangliGoodsID = Jiangli.ID
				local JiangliNum = Jiangli.Num
				local Bind = Jiangli.Bind
				if JiangliType == 'Money' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Exp' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Crystal' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
				else
					return
				end
			end
			API_ResponseWrite('<br>')
			if ManZhuTiaoJian == 1 then
				API_ResponseWrite('<br><a href="OperationsReward_ActivityFunc5_Title?1=999">领取奖励</a><br>')
			end
			API_ResponseWrite('<br><a>关闭</a><br>')
		end
	end
end


function OperationsReward_ActivityFunc6_CanAccept(ActorID)
	local ActivityNo = 6
	local VarData = 5
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 1 then
		VarData = 6
	end
	local RewardDate = OperationsReward_ActivityList[ActivityNo-1].RewardDate
	local RewardTime = OperationsReward_ActivityList[ActivityNo-1].RewardTime
	local Biaozhi = API_VarDataGetNumber(ActorID,1,RewardDate)
	local Biaozhi2 = API_VarDataGetNumber(ActorID,1,RewardTime)
	Biaozhi = math.mod(Biaozhi,100000000)
	local LYear = math.floor(Biaozhi/10000)
	local LMonthDay = math.mod(Biaozhi,10000)
	local LMonth = math.floor(LMonthDay/100)
	local LDay = math.mod(LMonthDay,100)
	
	Biaozhi2 = math.mod(Biaozhi2,1000000)
	local LHour = math.floor(Biaozhi2/10000)
	local LMinuteSecond = math.mod(Biaozhi,10000)
	local LMinute = math.floor(LMinuteSecond/100)
	local LSecond = math.mod(LMinuteSecond,100)
	local nShiFouReward = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
	local StartTimeTable = OperationsReward_StartTime
	local EndTimeTable = OperationsReward_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if MapID == StaticMapID and API_VarDataGetNumber(ActorID,1,9901) > 0 and nShiFouStart <= 0 and nShiFouEnd > 0 then
		if nShiFouStart - nShiFouReward <= 0 then
			local MaxFinishActorNum = OperationsReward_ActivityList[ActivityNo].MaxFinishActorNum
			local NowFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData)
			if NowFinishActorNum < MaxFinishActorNum then
				return 1
			end
		end
	end
	return 0
end


function OperationsReward_ActivityFunc6_Title()
	local ActorID = API_RequestGetActorID()
	local ActivityNo = 6
	local VarData = 5
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 1 then
		VarData = 6
	end
	if OperationsReward_CanAccept(ActorID,ActivityNo) == 1 then
		local ManZhuTiaoJian = 0
		for i in GLOBAL_WorkSkillList do
			for j,v in GLOBAL_WorkSkillList[i] do
				if API_GetWorkSkillLevel(ActorID,v) >= 7 then
					ManZhuTiaoJian = 1
					break
				end
				if ManZhuTiaoJian == 1 then
					break
				end
			end
		end
		local MaxFinishActorNum = OperationsReward_ActivityList[ActivityNo].MaxFinishActorNum
		local NowFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData)
		if API_RequestGetNumber(1) == 999 then
			if ManZhuTiaoJian == 1 and MaxFinishActorNum > NowFinishActorNum then
				NowFinishActorNum = NowFinishActorNum + 1
				API_VarDataSetNumber_Ex_Sync(1,0,-100,1,VarData,NowFinishActorNum)
				local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
				local RewardDate = OperationsReward_ActivityList[ActivityNo].RewardDate
				local RewardTime = OperationsReward_ActivityList[ActivityNo].RewardTime
				local date = Year * 10000 + Month * 100 + Day
				local time = Hour * 10000 + Minute * 100 + Second
				API_VarDataSetNumber(ActorID,1,RewardDate,date)
				API_VarDataSetNumber(ActorID,1,RewardTime,time)
				local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
				if type(RewardTabel) ~= 'table' then
					return
				end
				local Name = OperationsReward_ActivityList[ActivityNo].Name
				API_ResponseWrite('<text>您获得 '..Name..' 的奖励：</text><br>')
				for i in RewardTabel do
					local Jiangli = RewardTabel[i]
					local JiangliType = Jiangli.Type
					local JiangliGoodsID = Jiangli.ID
					local JiangliNum = Jiangli.Num
					local Bind = Jiangli.Bind
					if JiangliType == 'Money' and JiangliNum > 0 then
						API_ActorAddMoney(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 金币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 金币')
						API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Exp' and JiangliNum > 0 then
						API_ActorAddExp(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 经验')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 经验')
						API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Crystal' and JiangliNum > 0 then
						API_ActorShoppingM_Add(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 水晶币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 水晶币')
						API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
						if API_ActorCanAddGoods(ActorID,JiangliGoodsID,JiangliNum,Bind,0) ~= -1 then
							API_AddActorGoodsFlag(ActorID,JiangliGoodsID,JiangliNum,Bind,Name)
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
						else
							API_SendActorMailByName(API_GetActorName(ActorID),JiangliGoodsID,JiangliNum,Bind,'['..Name..']','获得'..JiangliNum..'个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' （请到邮箱领取）</text><text>        </text>')
						end
					else
						return
					end
				end
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			local EndTimeTable = OperationsReward_EndTime
			API_ResponseWrite('<text color="255,0,255">在 '.. EndTimeTable.Month ..'月'.. EndTimeTable.Day ..'日 '.. EndTimeTable.Hour ..'时'..  EndTimeTable.Minute ..'分 活动结束前，只要您 任意1个生活技能达到7级</text><text>，就可以在我这里领取一次奖励：</text><br>')
			local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
			if type(RewardTabel) ~= 'table' then
				return
			end
			for i in RewardTabel do
				local Jiangli = RewardTabel[i]
				local JiangliType = Jiangli.Type
				local JiangliGoodsID = Jiangli.ID
				local JiangliNum = Jiangli.Num
				local Bind = Jiangli.Bind
				if JiangliType == 'Money' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Exp' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Crystal' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
				else
					return
				end
			end
			API_ResponseWrite('<br><text color="255,0,0">最多允许'..MaxFinishActorNum..'人领奖，目前已经有'..NowFinishActorNum..'人领取过奖励！</text><br>')
			if ManZhuTiaoJian == 1 and MaxFinishActorNum > NowFinishActorNum then
				API_ResponseWrite('<br><a href="OperationsReward_ActivityFunc6_Title?1=999">领取奖励</a><br>')
			end
			API_ResponseWrite('<br><a>关闭</a><br>')
		end
	end
end


function OperationsReward_ActivityFunc7_CanAccept(ActorID)
	local ActivityNo = 7
	local VarData = 7
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 1 then
		VarData = 8
	end
	local MaxFinishActorNum = OperationsReward_ActivityList[ActivityNo].MaxFinishActorNum
	local NowFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData)
	if NowFinishActorNum >= MaxFinishActorNum then
		return 0
	end
	local RewardDate = OperationsReward_ActivityList[ActivityNo-1].RewardDate
	local RewardTime = OperationsReward_ActivityList[ActivityNo-1].RewardTime
	local Biaozhi = API_VarDataGetNumber(ActorID,1,RewardDate)
	local Biaozhi2 = API_VarDataGetNumber(ActorID,1,RewardTime)
	Biaozhi = math.mod(Biaozhi,100000000)
	local LYear = math.floor(Biaozhi/10000)
	local LMonthDay = math.mod(Biaozhi,10000)
	local LMonth = math.floor(LMonthDay/100)
	local LDay = math.mod(LMonthDay,100)
	
	Biaozhi2 = math.mod(Biaozhi2,1000000)
	local LHour = math.floor(Biaozhi2/10000)
	local LMinuteSecond = math.mod(Biaozhi,10000)
	local LMinute = math.floor(LMinuteSecond/100)
	local LSecond = math.mod(LMinuteSecond,100)
	local nShiFouReward = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
	local StartTimeTable = OperationsReward_StartTime
	local EndTimeTable = OperationsReward_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if MapID == StaticMapID and API_VarDataGetNumber(ActorID,1,9901) > 0 and nShiFouStart <= 0 and nShiFouEnd > 0 then
		local ShangMaxFinishActorNum = OperationsReward_ActivityList[ActivityNo-1].MaxFinishActorNum
		local ShangFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData - 2)
		if nShiFouStart - nShiFouReward <= 0 then
			return 1
		elseif ShangFinishActorNum >= ShangMaxFinishActorNum then
			--2没完成，获取1是否完成
			local RewardDate = OperationsReward_ActivityList[5].RewardDate
			local RewardTime = OperationsReward_ActivityList[5].RewardTime
			local Biaozhi = API_VarDataGetNumber(ActorID,1,RewardDate)
			local Biaozhi2 = API_VarDataGetNumber(ActorID,1,RewardTime)
			Biaozhi = math.mod(Biaozhi,100000000)
			local LYear = math.floor(Biaozhi/10000)
			local LMonthDay = math.mod(Biaozhi,10000)
			local LMonth = math.floor(LMonthDay/100)
			local LDay = math.mod(LMonthDay,100)
			
			Biaozhi2 = math.mod(Biaozhi2,1000000)
			local LHour = math.floor(Biaozhi2/10000)
			local LMinuteSecond = math.mod(Biaozhi,10000)
			local LMinute = math.floor(LMinuteSecond/100)
			local LSecond = math.mod(LMinuteSecond,100)
			local nShiFouReward = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
			--判断是否完成1
			if nShiFouStart - nShiFouReward <= 0 then
				return 1
			else
				return 0
			end
		end
	end
	return 0
end


function OperationsReward_ActivityFunc7_Title()
	local ActorID = API_RequestGetActorID()
	local ActivityNo = 7
	local VarData = 7
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 1 then
		VarData = 8
	end
	if OperationsReward_CanAccept(ActorID,ActivityNo) == 1 then
		local CaiJiManZhuTiaoJian = 0
		local ZhiZhaoManZhuTiaoJian
		for i,v in GLOBAL_WorkSkillList[1] do
			if API_GetWorkSkillLevel(ActorID,v) >= 7 then
				CaiJiManZhuTiaoJian = 1
				break
			end
		end
		for i,v in GLOBAL_WorkSkillList[2] do
			if API_GetWorkSkillLevel(ActorID,v) >= 7 then
				ZhiZhaoManZhuTiaoJian = 1
				break
			end
		end
		for i,v in GLOBAL_WorkSkillList[3] do
			if API_GetWorkSkillLevel(ActorID,v) >= 7 then
				ZhiZhaoManZhuTiaoJian = 1
				break
			end
		end
		local MaxFinishActorNum = OperationsReward_ActivityList[ActivityNo].MaxFinishActorNum
		local NowFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData)
		if API_RequestGetNumber(1) == 999 then
			if CaiJiManZhuTiaoJian == 1 and ZhiZhaoManZhuTiaoJian == 1 and MaxFinishActorNum > NowFinishActorNum then
				NowFinishActorNum = NowFinishActorNum + 1
				API_VarDataSetNumber_Ex_Sync(1,0,-100,1,VarData,NowFinishActorNum)
				local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
				local RewardDate = OperationsReward_ActivityList[ActivityNo].RewardDate
				local RewardTime = OperationsReward_ActivityList[ActivityNo].RewardTime
				local date = Year * 10000 + Month * 100 + Day
				local time = Hour * 10000 + Minute * 100 + Second
				API_VarDataSetNumber(ActorID,1,RewardDate,date)
				API_VarDataSetNumber(ActorID,1,RewardTime,time)
				local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
				if type(RewardTabel) ~= 'table' then
					return
				end
				local Name = OperationsReward_ActivityList[ActivityNo].Name
				API_ResponseWrite('<text>您获得 '..Name..' 的奖励：</text><br>')
				for i in RewardTabel do
					local Jiangli = RewardTabel[i]
					local JiangliType = Jiangli.Type
					local JiangliGoodsID = Jiangli.ID
					local JiangliNum = Jiangli.Num
					local Bind = Jiangli.Bind
					if JiangliType == 'Money' and JiangliNum > 0 then
						API_ActorAddMoney(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 金币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 金币')
						API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Exp' and JiangliNum > 0 then
						API_ActorAddExp(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 经验')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 经验')
						API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Crystal' and JiangliNum > 0 then
						API_ActorShoppingM_Add(ActorID,JiangliNum,0,Name)
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 水晶币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 水晶币')
						API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
						if API_ActorCanAddGoods(ActorID,JiangliGoodsID,JiangliNum,Bind,0) ~= -1 then
							API_AddActorGoodsFlag(ActorID,JiangliGoodsID,JiangliNum,Bind,Name)
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
						else
							API_SendActorMailByName(API_GetActorName(ActorID),JiangliGoodsID,JiangliNum,Bind,'['..Name..']','获得'..JiangliNum..'个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' （请到邮箱领取）</text><text>        </text>')
						end
					else
						return
					end
				end
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			local EndTimeTable = OperationsReward_EndTime
			API_ResponseWrite('<text color="255,0,255">在 '.. EndTimeTable.Month ..'月'.. EndTimeTable.Day ..'日 '.. EndTimeTable.Hour ..'时'..  EndTimeTable.Minute ..'分 活动结束前，只要您 任意1个采集技能 + 任意1个制造技能 达到7级</text><text>，就可以在我这里领取一次奖励：</text><br>')
			local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
			if type(RewardTabel) ~= 'table' then
				return
			end
			for i in RewardTabel do
				local Jiangli = RewardTabel[i]
				local JiangliType = Jiangli.Type
				local JiangliGoodsID = Jiangli.ID
				local JiangliNum = Jiangli.Num
				local Bind = Jiangli.Bind
				if JiangliType == 'Money' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Exp' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Crystal' and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
				elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
				else
					return
				end
			end
			API_ResponseWrite('<br><text color="255,0,0">最多允许'..MaxFinishActorNum..'人领奖，目前已经有'..NowFinishActorNum..'人领取过奖励！</text><br>')
			if CaiJiManZhuTiaoJian == 1 and ZhiZhaoManZhuTiaoJian == 1 and MaxFinishActorNum > NowFinishActorNum then
				API_ResponseWrite('<br><a href="OperationsReward_ActivityFunc7_Title?1=999">领取奖励</a><br>')
			end
			API_ResponseWrite('<br><a>关闭</a><br>')
		end
	end
end



function OperationsReward_ActivityFunc8_CanAccept(ActorID)
	local ActivityNo = 8
	local VarData = 7
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 1 then
		VarData = 8
	end
	local RewardDate = OperationsReward_ActivityList[ActivityNo-1].RewardDate
	local RewardTime = OperationsReward_ActivityList[ActivityNo-1].RewardTime
	local Biaozhi = API_VarDataGetNumber(ActorID,1,RewardDate)
	local Biaozhi2 = API_VarDataGetNumber(ActorID,1,RewardTime)
	Biaozhi = math.mod(Biaozhi,100000000)
	local LYear = math.floor(Biaozhi/10000)
	local LMonthDay = math.mod(Biaozhi,10000)
	local LMonth = math.floor(LMonthDay/100)
	local LDay = math.mod(LMonthDay,100)
	
	Biaozhi2 = math.mod(Biaozhi2,1000000)
	local LHour = math.floor(Biaozhi2/10000)
	local LMinuteSecond = math.mod(Biaozhi,10000)
	local LMinute = math.floor(LMinuteSecond/100)
	local LSecond = math.mod(LMinuteSecond,100)
	local nShiFouReward = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
	local StartTimeTable = OperationsReward_StartTime
	local EndTimeTable = OperationsReward_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if MapID == StaticMapID and API_VarDataGetNumber(ActorID,1,9901) > 0 and nShiFouStart <= 0 and nShiFouEnd > 0 then
		local ShangMaxFinishActorNum = OperationsReward_ActivityList[ActivityNo-1].MaxFinishActorNum
		local ShangFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData)
		if nShiFouStart - nShiFouReward <= 0 then
			return 1
		elseif ShangFinishActorNum >= ShangMaxFinishActorNum then
			--3没有的情况
			--获取2是否完成
			local RewardDate = OperationsReward_ActivityList[6].RewardDate
			local RewardTime = OperationsReward_ActivityList[6].RewardTime
			local Biaozhi = API_VarDataGetNumber(ActorID,1,RewardDate)
			local Biaozhi2 = API_VarDataGetNumber(ActorID,1,RewardTime)
			Biaozhi = math.mod(Biaozhi,100000000)
			local LYear = math.floor(Biaozhi/10000)
			local LMonthDay = math.mod(Biaozhi,10000)
			local LMonth = math.floor(LMonthDay/100)
			local LDay = math.mod(LMonthDay,100)
			
			Biaozhi2 = math.mod(Biaozhi2,1000000)
			local LHour = math.floor(Biaozhi2/10000)
			local LMinuteSecond = math.mod(Biaozhi,10000)
			local LMinute = math.floor(LMinuteSecond/100)
			local LSecond = math.mod(LMinuteSecond,100)
			local nShiFouReward = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
			local VarData = 5
			if CampID == 1 then
				VarData = 6
			end
			local ShangMaxFinishActorNum = OperationsReward_ActivityList[6].MaxFinishActorNum
			local ShangFinishActorNum = API_VarDataGetNumber_Ex(1,0,-100,1,VarData)
			--判断是否完成2
			if nShiFouStart - nShiFouReward <= 0 then
				--完成2，直接显示4
				return 1
			elseif ShangFinishActorNum >= ShangMaxFinishActorNum then
				--2没完成且没有了，获取1是否完成
				local RewardDate = OperationsReward_ActivityList[5].RewardDate
				local RewardTime = OperationsReward_ActivityList[5].RewardTime
				local Biaozhi = API_VarDataGetNumber(ActorID,1,RewardDate)
				local Biaozhi2 = API_VarDataGetNumber(ActorID,1,RewardTime)
				Biaozhi = math.mod(Biaozhi,100000000)
				local LYear = math.floor(Biaozhi/10000)
				local LMonthDay = math.mod(Biaozhi,10000)
				local LMonth = math.floor(LMonthDay/100)
				local LDay = math.mod(LMonthDay,100)
				
				Biaozhi2 = math.mod(Biaozhi2,1000000)
				local LHour = math.floor(Biaozhi2/10000)
				local LMinuteSecond = math.mod(Biaozhi,10000)
				local LMinute = math.floor(LMinuteSecond/100)
				local LSecond = math.mod(LMinuteSecond,100)
				local nShiFouReward = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
				--判断是否完成1
				if nShiFouStart - nShiFouReward <= 0 then
					--1完成
					return 1
				else
					return 0
				end
			end
		end
		
	end
	return 0
end


function OperationsReward_ActivityFunc8_Title()
	local ActorID = API_RequestGetActorID()
	local ActivityNo = 8
	local CampID = API_GetActorCamp(ActorID)
	if OperationsReward_CanAccept(ActorID,ActivityNo) == 1 then
		local EndTimeTable = OperationsReward_EndTime
		API_ResponseWrite('<text color="255,0,255">只要在 '.. EndTimeTable.Month ..'月'.. EndTimeTable.Day ..'日 '.. EndTimeTable.Hour ..'时'..  EndTimeTable.Minute ..'分 活动结束时，您的 所有生活技能熟练度总和'..GLOBAL_CampName[CampID]..'最高的</text><text>，那么您将收到'..GLOBAL_CampName[CampID]..'总督寄给您的超级大奖（通过邮箱领取）:</text><br>')
		local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
		if type(RewardTabel) ~= 'table' then
			return
		end
		for i in RewardTabel do
			local Jiangli = RewardTabel[i]
			local JiangliType = Jiangli.Type
			local JiangliGoodsID = Jiangli.ID
			local JiangliNum = Jiangli.Num
			local Bind = Jiangli.Bind
			if JiangliType == 'Money' and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Exp' and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Crystal' and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
			else
				return
			end
		end
		API_ResponseWrite('<br><br><a>关闭</a><br>')
	end
end

function OperationsReward_ActivityFunc9_CanAccept(ActorID)
	local ActivityNo = 9
	local VarData = 9
	local CampID = API_GetActorCamp(ActorID)
	if CampID == 1 then
		VarData = 10
	end
	local ZhanLiZhi = API_VarDataGetNumber(ActorID,1,7572) + API_VarDataGetNumber(ActorID,1,7573)
	local NeedZhanLiZhi = OperationsReward_ActivityList[ActivityNo].NeedZhanLiZhi
	local StartTimeTable = OperationsReward_StartTime
	local EndTimeTable = OperationsReward_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if MapID == StaticMapID and API_VarDataGetNumber(ActorID,1,9901) > 0 and nShiFouStart <= 0 and nShiFouEnd > 0 then
		return 1
	end
	return 0
end

function OperationsReward_ActivityFunc9_Title()
	local ActorID = API_RequestGetActorID()
	local ActivityNo = 9
	local CampID = API_GetActorCamp(ActorID)
	local VarData = 9
	local CampID = API_GetActorCamp(ActorID)
	local LingJiang = API_VarDataGetNumber(ActorID,1,30284)
	if CampID == 1 then
		VarData = 10
	end
	if OperationsReward_CanAccept(ActorID,ActivityNo) == 1 then
		local ZhanLiZhi = API_VarDataGetNumber(ActorID,1,7572) + API_VarDataGetNumber(ActorID,1,7573)
		local NeedZhanLiZhi = OperationsReward_ActivityList[ActivityNo].NeedZhanLiZhi
		local MaxFinishActorNum = OperationsReward_ActivityList[ActivityNo].MaxFinishActorNum
		local NowFinishActorNum = API_VarDataGetNumber_Ex(1,0,-6001,1,VarData)
		local Name = OperationsReward_ActivityList[ActivityNo].Name
		if API_RequestGetNumber(1) == 999 then
			if ZhanLiZhi >= NeedZhanLiZhi and LingJiang ~= 1 then
				NowFinishActorNum = NowFinishActorNum + 1
				API_VarDataSetNumber_Ex_Sync(1,0,-6001,1,VarData,NowFinishActorNum)
				local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
				local RewardDate = OperationsReward_ActivityList[ActivityNo].RewardDate
				local RewardTime = OperationsReward_ActivityList[ActivityNo].RewardTime
				local date = Year * 10000 + Month * 100 + Day
				local time = Hour * 10000 + Minute * 100 + Second
				API_VarDataSetNumber(ActorID,1,RewardDate,date)
				API_VarDataSetNumber(ActorID,1,RewardTime,time)
				local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
				if type(RewardTabel) ~= 'table' then
					return
				end
				API_ResponseWrite('<text>您获得 '..Name..' 的奖励：</text><br>')
				API_VarDataSetNumber(ActorID,1,30284,1)
				for i in RewardTabel do
					local Jiangli = RewardTabel[i]
					local JiangliType = Jiangli.Type
					local JiangliGoodsID = Jiangli.ID
					local JiangliNum = Jiangli.Num
					local Bind = Jiangli.Bind
					if JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
						if API_ActorCanAddGoods(ActorID,JiangliGoodsID,JiangliNum,Bind,0) ~= -1 then
							API_AddActorGoodsFlag(ActorID,JiangliGoodsID,JiangliNum,Bind,Name)
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
						else
							API_SendActorMailByName(API_GetActorName(ActorID),JiangliGoodsID,JiangliNum,Bind,'['..Name..']','获得'..JiangliNum..'个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' （请到邮箱领取）</text><text>        </text>')
						end
					else
						return
					end
				end
				API_ResponseWrite('<br><br><a>确定</a><br>')
			end
		else
			local EndTimeTable = OperationsReward_EndTime
			API_ResponseWrite('<text color="255,0,255">在 '.. EndTimeTable.Month ..'月'.. EndTimeTable.Day ..'日 '.. EndTimeTable.Hour ..'时'..  EndTimeTable.Minute ..'分 活动结束前，只要您的 战力值达到'..NeedZhanLiZhi..'</text><text> ，就可以在我这里领取一次奖励(奖励有限先到先得)：</text><br>')
			local RewardTabel =OperationsReward_ActivityList[ActivityNo].Reward
			if type(RewardTabel) ~= 'table' then
				return
			end
			for i in RewardTabel do
				local Jiangli = RewardTabel[i]
				local JiangliType = Jiangli.Type
				local JiangliGoodsID = Jiangli.ID
				local JiangliNum = Jiangli.Num
				local Bind = Jiangli.Bind
				if JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
					API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
				else
					return
				end
			end
			API_ResponseWrite('<br><text color="255,0,0">最多允许'..MaxFinishActorNum..'人领奖，目前已经有'..NowFinishActorNum..'人领取过奖励！</text><br>')
				if ZhanLiZhi >= NeedZhanLiZhi then
					if LingJiang ~= 1 then
						if NowFinishActorNum < MaxFinishActorNum then
							API_ResponseWrite('<br><br><text>目前您的战力值已达到 '..ZhanLiZhi..' ，符合 '..Name..' 的领奖条件！</text><br>')
							API_ResponseWrite('<br><a href="OperationsReward_ActivityFunc9_Title?1=999">领取奖励</a><br>')
						end
					else
						API_ResponseWrite('<br><br><text>您已经领取过奖品。</text><br>')				
					end
				else
					API_ResponseWrite('<br><text>您的战力值是 '..ZhanLiZhi..' ，</text><text color="0,255,255">请赢取'.. NeedZhanLiZhi - ZhanLiZhi ..'战力后再来领奖</text><text>！</text><br>')
				end
					API_ResponseWrite('<br><a>关闭</a><br>')
		end
	end	
end


if API_GetServerID() == 1 then
	if OperationsReward_LoadingTimeTriggerGID ~= nil then
		API_DestroyTriggerG(OperationsReward_LoadingTimeTriggerGID)
	end
	OperationsReward_LoadingTimeTriggerGID = API_CreateTimerTriggerG(0,0,120,1,'OperationsReward_ServerOpen')
end

function OperationsReward_ServerOpen(Param1,Param2)
	local OpenYear = API_VarDataGetNumber_Ex(1,0,-101,1,1)
	local OpenMonth = API_VarDataGetNumber_Ex(1,0,-101,1,2)
	local OpenDay = API_VarDataGetNumber_Ex(1,0,-101,1,3)
	local OpenTime = API_VarDataGetNumber_Ex(1,0,-101,1,8)
	OperationsReward_StartTime.Year = OpenYear
	OperationsReward_StartTime.Month = OpenMonth
	OperationsReward_StartTime.Day = OpenDay
	
	local NextTimeSec = OpenTime + 86400 * 11
	local time = os.date("*t",NextTimeSec)
	OperationsReward_EndTime.Year = time.year
	OperationsReward_EndTime.Month = time.month
	OperationsReward_EndTime.Day = time.day
	
	if API_GetServerID() == 1 then
		local StartTimeTable = OperationsReward_StartTime
		local EndTimeTable = OperationsReward_EndTime
		local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)
		local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
		if nShiFouStart > 0 then
			OperationsReward_DestroyNPC()
			--活动未开始
			if OperationsReward_StartDateTimeTriggerGID == nil then
				OperationsReward_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'OperationsReward_CreateNPC')
			else
				API_DestroyTriggerG(OperationsReward_StartDateTimeTriggerGID)
				OperationsReward_StartDateTimeTriggerGID = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'OperationsReward_CreateNPC')
			end
			if OperationsReward_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(OperationsReward_EndDateTimeTriggerGID)
			end
		elseif nShiFouStart <= 0 and nShiFouEnd > 0 then
			--活动时间内
			OperationsReward_CreateNPC()
			if OperationsReward_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(OperationsReward_StartDateTimeTriggerGID)
			end
		elseif nShiFouEnd <= 0 then
			--活动已结束
			OperationsReward_DestroyNPC()
			if OperationsReward_StartDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(OperationsReward_StartDateTimeTriggerGID)
			end
			if OperationsReward_EndDateTimeTriggerGID ~= nil then
				API_DestroyTriggerG(OperationsReward_EndDateTimeTriggerGID)
			end
		end
	end
end
