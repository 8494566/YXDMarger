-------------------------------
--文件名:	Scp\Lua\Act\LC_WanShengJie2012.lua
--版  权:	深圳腾讯计算机系统有限公司
--创建人:	刘操
--日  期:	2012-10-19
--版  本:	
--描  述:   万圣节活动
--应  用:  
-------------------------------


local WanShengJie2012_StartTime = {Year = 2012,Month = 10,Day = 22,Hour = 0,Minute = 0,Second = 0}
local WanShengJie2012_EndTime = {Year = 2012,Month = 11,Day = 12,Hour = 0,Minute = 0,Second = 0}


local  WanShengJie2012_DiTuDingYi = {
[1] = {
	NPC = {
				--传送门
				{NPCID = 11607,TileX = 62,TileY = 54,Direct = 3,AIInfoID = nil,Camp = nil,},
			},
	},
}

--神灯道具使用
function WanShengJie_ShenDengUse(ActorID,GoodsID)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID) 
	local StaticMapID = API_GetStaticMapID(MapID)
	if MapID == StaticMapID then
		API_ResponseWrite('<name>神灯</name>')
		API_ResponseWrite('<text>	 神灯秘境中有一个沉睡中的灯神，传说能够战胜他的人都能够向他许一个愿望，无论是什么愿望他都会满足你。</text><br>')
		API_ResponseWrite('<br><a href="WanShengJie_ShenDengStater?1=100">进入瓶中世界</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_ResponseWrite('<name>神灯</name>')
		API_ResponseWrite('<text>亲爱的玩家，当前地图不允许使用该物品，请切换地图尝试使用。</text><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
end

--进入条件判断
function WanShengJie_ShenDengStater()
	local ActorID = API_RequestGetActorID() 
	local MapID = API_GetActorMapID(ActorID)
	local TeamID = API_GetTeamID(ActorID)--获得玩家所在队伍的ID
	if TeamID > 0 then
		if API_GetTeamLeader(TeamID) == ActorID then
			local TeamSize = API_GetTeamSize(TeamID)--获得队伍人数	
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)--获得队伍成员ID
				if API_ActorIsOnline(TeamActorID) then
					local TeamActorMapID = API_GetActorMapID(TeamActorID)
					if TeamActorMapID ~= MapID then
					   API_ResponseWrite('<name>神秘淘金者</name>')
					   API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>不在同一场景中。</text><br>')
					   API_ResponseWrite('<br><a>确定</a><br>')
					   API_ResponseFlush(ActorID)
					   return
					end
					if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>快递中，无法进入神灯秘境！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return 
					end
					if API_ActorFindStatus(TeamActorID,519) then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>摆摊中，无法进入神灯秘境！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return 
					end
					if API_ActorIsDying(TeamActorID) then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>死亡，无法进入神灯秘境！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return 
					end
					if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>在公交车上无法进入神灯秘境！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return
					end
				end
			end
		else
			API_ResponseWrite('<name>神灯</name>')
			API_ResponseWrite('<text>	您不是队长，无法带领队友进入神灯秘境</text><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
			API_ResponseFlush(ActorID)
			return 			
		end
	else
		if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>快递中，无法进入神灯秘境！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 
		end
		if API_ActorFindStatus(ActorID,519) then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>摆摊中，无法进入神灯秘境！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 
		end
		if API_ActorIsDying(ActorID) then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>角色死亡，无法进入神灯秘境！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 
		end
		if API_VarDataGetNumber(ActorID,1,11816) > 0 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>在公交车上无法进入神灯秘境！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return
		end
	end
	WanShengJie_Create(ActorID)
end

--创建副本
function WanShengJie_Create(ActorID)
	local StaticMapID = 2014
	local ObjectMapID = API_CreateEctype(StaticMapID,0)	
	
	local CitadelTable = WanShengJie2012_DiTuDingYi[1]
	--创建NPC
	if type(CitadelTable.NPC) == 'table' then
		for j = 1,table.getn(CitadelTable.NPC) do
			 local NPCTable = CitadelTable.NPC[j]
			 local NPCID = NPCTable.NPCID
			 if type(NPCTable.NPCID) == 'table' then
				NPCID = NPCTable.NPCID[0]
			 end
			 
			 local Direct = NPCTable.Direct
			 if Direct == nil then
				Direct = 0
			 end
			 
			 local AIInfoID = NPCTable.AIInfoID
			 if AIInfoID == nil then
				AIInfoID = 0
			 end
			 
			 local Camp = NPCTable.Camp
			 if Camp == nil then
				Camp = -1
			 end
			local FastID = API_CreateMonster(ObjectMapID,NPCID,NPCTable.TileX,NPCTable.TileY,Direct,AIInfoID,Camp)--创建怪物
		end
	end
	
	local FastID = API_CreateMonster(ObjectMapID,958001,61,65,4,0,2)
	API_CreateDieTriggerG(ObjectMapID,0,0,FastID,'WanShengJie_BossDieFunc')

	WanShengJie_PlayGotoMap(ObjectMapID,ActorID)
end

--传送玩家进副本
function WanShengJie_PlayGotoMap(ObjectMapID,ActorID)
	local TileX=132
	local TileY=194
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
				if MapID == API_GetActorMapID(TeamActorID) then
					if TeamActorID ~= ActorID then
						API_VarDataSetNumber(TeamActorID,1,30299,0)
						API_ActorGoToMap(TeamActorID,ObjectMapID,63,55)
					else
						if API_ActorGetGoodsNum(ActorID,89194) > 0 and API_ActorRemoveGoods(ActorID,89194,1,'使用神灯') then--销毁玩家身上的物品
							API_VarDataSetNumber(ActorID,1,30299,1)
							API_ActorGoToMap(ActorID,ObjectMapID,63,55)
							local Num = API_VarDataGetNumber(ActorID,1,30300)
							Num = Num + 1
							API_VarDataSetNumber(ActorID,1,30300,Num)
							--风向标
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[77][3][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[77][3][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[77][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[77][3][LaiYuan] + 1
							end
						end
					end
				end
			end
		else
			if API_ActorGetGoodsNum(ActorID,89194) > 0 and API_ActorRemoveGoods(ActorID,89194,1,'使用神灯') then--销毁玩家身上的物品
				API_VarDataSetNumber(ActorID,1,30299,1)
				API_ActorGoToMap(ActorID,ObjectMapID,63,55)
				local Num = API_VarDataGetNumber(ActorID,1,30300)
				Num = Num + 1
				API_VarDataSetNumber(ActorID,1,30300,Num)
				--风向标
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[77][3][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[77][3][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[77][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[77][3][LaiYuan] + 1
				end
			end			
		end
	end
end


--怪物死亡回调函数
function WanShengJie_BossDieFunc(MapID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	local TriggerID = API_GetCurTriggerID()
	if not API_MapIsValid(MapID) then
		return
	end
	
	if MonsterID == 958001 then
		API_CreateMonster(MapID,12381,PosX,PosY,4,0,-1)--创建NPC
	elseif MonsterID == 271212 then--南瓜头领ID
		if KillerType == 1 then
			if WSJHD_BOSSdiaoluo[MonsterID] ~= nil then
				for i = 1,table.getn(WSJHD_BOSSdiaoluo[MonsterID]) do
					if math.random(100) <= WSJHD_BOSSdiaoluo[MonsterID][i].Gailv then
						if API_CreateDropGoods(DynamicMapID,PosX,PosY,WSJHD_BOSSdiaoluo[MonsterID][i].ID,WSJHD_BOSSdiaoluo[MonsterID][i].Num,0,'万圣节活动',4,0,300,0) == true then
						end
					end
				end
			end	
		end
	end
	API_DestroyTriggerG(TriggerID)
end

--灯神对话
function DengShen_Title(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local JinBiNum = API_VarDataGetNumber_Ex(1,0,-6022,1,18)
	if API_VarDataGetNumber(ActorID,1,30299) == 1 then
		API_ResponseWrite('<win rect="250,200,500,400"></win>')
		API_ResponseWrite('<name>神灯</name>')
		API_ResponseWrite('<text>	 恭喜你成功经过考验，告诉我你的愿望吧！</text><br>')
		API_ResponseWrite('<br><a href="DengShen_ShenDengJiangLi?1=100">神啊！赐我一个神宠物吧！</a>')
		API_ResponseWrite('<text>包括</text><img srcgd="31039" tipgd="31039"><img srcgd="31022" tipgd="31022"><img srcgd="31030" tipgd="31030"><img srcgd="31046" tipgd="31046"><img srcgd="31047" tipgd="31047"><text>等稀有宠物。</text><br>')
		API_ResponseWrite('<br><a href="DengShen_ShenDengJiangLi?1=200">神啊！赐我一件华丽的时装吧！</a>')
		API_ResponseWrite('<text>包括</text><img srcgd="11627" tipgd="11627"><img srcgd="11628" tipgd="11628"><img srcgd="11629" tipgd="11629"><img srcgd="11630" tipgd="11630"><img srcgd="11623" tipgd="11623"><img srcgd="11624" tipgd="11624"><img srcgd="11625" tipgd="11625"><img srcgd="11626" tipgd="11626"><text>等稀有时装。</text><br>')
		API_ResponseWrite('<br><a href="DengShen_ShenDengJiangLi?1=300">神啊！赐我一件强力的装备吧！</a>')
		API_ResponseWrite('<text>包括</text><img srcgd="89196" tipgd="89196"><text>，各类三洞装备等大礼。</text><br>')
		API_ResponseWrite('<br><a href="DengShen_ShenDengJiangLi?1=400">神啊！赐我一个快速的载具吧！</a>')
		API_ResponseWrite('<text>包括</text><img srcgd="32022" tipgd="32022"><img srcgd="39707" tipgd="39707"><img srcgd="39708" tipgd="39708"><text>等稀有载具。</text><br>')
		if JinBiNum < 100 then
			API_ResponseWrite('<br><a href="DengShen_ShenDengJiangLi?1=500">神啊！我要很多很多的钱！</a>')
			API_ResponseWrite('<text>最多可获得100个</text><img srcgd="89187" tipgd="89187"><text>。</text><br>')
		end
		API_ResponseWrite('<br><a href="DengShen_ShenDengJiangLi?1=600">神啊！上面的我都想要！</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
	else
		API_ResponseWrite('<win rect="250,200,500,140"></win>')
		API_ResponseWrite('<name>神灯</name>')
		API_ResponseWrite('<text>    抱歉我只能满足一个人的愿望，没有付出就没有回报，似乎有人付出的更多~</text><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
		API_ResponseFlush(ActorID)
	end
end

local XuYuanJiangLiTable = {
	[1] = {
			[1] = {
					[1] = {
						{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=845,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=80397,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=40,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
					},
					[2] = {
						{GoodsID=88991,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=80686,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=80689,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=80954,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31101,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
					},
					[3] = {
						{GoodsID=31204,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31238,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31201,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31207,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31208,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31231,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31206,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31240,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31237,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31236,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31229,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31205,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31239,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31202,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31214,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31212,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=31213,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
					},
					[4] = {
						{GoodsID=31224,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31251,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31221,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31227,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31228,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31244,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31226,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31253,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31223,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31203,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31249,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31242,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31225,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31252,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=31222,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
					},
				},
			[2] = {
				{GoodsID=31022,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 3},
				{GoodsID=31042,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=31024,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=31048,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=31030,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 3},
				{GoodsID=31046,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 3},
				{GoodsID=31047,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
			},
			
		},
	[2] = {
			[1] = {
					[1] = {
						{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=845,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=80397,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=40,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=75,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
					},
					[2] = {
						{GoodsID=32101,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=82032,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=89118,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=765,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=968,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=88910,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=32001,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
					},
					[3] = {
						{GoodsID=929,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
						{GoodsID=89079,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
						{GoodsID=80849,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
						{GoodsID=89195,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
					},
				},
			[2] = {
				{GoodsID=11596,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 2},
				{GoodsID=11597,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 2},
				{GoodsID=11598,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 2},
				{GoodsID=11599,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 2},
				{GoodsID=11610,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=11611,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=11612,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=11613,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=11071,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 6},
				{GoodsID=11072,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 6},
				{GoodsID=11073,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 6},
				{GoodsID=11074,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 6},
				{GoodsID=11313,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=11314,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=11315,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=11316,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=11317,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=11623,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 2},
				{GoodsID=11624,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 2},
				{GoodsID=11625,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 2},
				{GoodsID=11626,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 2},
				{GoodsID=11627,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 2},
				{GoodsID=11628,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 2},
				{GoodsID=11629,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 2},
				{GoodsID=11630,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 2},
				},
		},
	[3] = {
			[1] = {
					[1] = {
						{GoodsID=80191,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=4,Max = 10},
						{GoodsID=80196,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=26,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80381,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80383,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80192,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
					},
					[2] = {
						{GoodsID=80197,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=80065,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=80066,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=80067,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=80049,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=80050,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=80051,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=845,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=39602,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=30,Max = 10},
					},
					[3] = {
						{GoodsID=80397,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=40,Max = 10},
						{GoodsID=82034,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
					},
					[4] = {
						{GoodsID=904,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=80950,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=80235,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=80282,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=80277,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=82035,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
						{GoodsID=80951,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
						{GoodsID=88885,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
						{GoodsID=88886,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
						{GoodsID=902,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=80952,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=88887,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
						{GoodsID=88888,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=300,Max = 10},
					},
				},
			[2] = {
				{GoodsID=0,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=6,jiazhi=0,Max = 500},
				{GoodsID=89196,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 100},
				},
		},
	[4] = {
			[1] = {
					[1] = {
						{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80818,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=10,Max = 10},
						{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},	
					},
					[2] = {
						{GoodsID=845,GoodsNum=2,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=20,Max = 10},
						{GoodsID=80397,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=40,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50,Max = 10},			
					},
					[3] = {
						{GoodsID=75,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=32001,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=32101,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=82032,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=88910,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=100,Max = 10},
						{GoodsID=929,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},					
					},
					[4] = {
						{GoodsID=89118,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
						{GoodsID=89079,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
						{GoodsID=765,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
						{GoodsID=80849,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
						{GoodsID=968,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},
						{GoodsID=89195,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=200,Max = 10},					
					},
			},
			[2] = {
				{GoodsID=32022,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 2},
				{GoodsID=32020,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=39707,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=39708,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				{GoodsID=39704,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=50000,Max = 4},
				},
		},
	[5] = {
			[1] = {
					[1] = {
						{GoodsID=89187,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=11,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=12,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=13,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=14,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=15,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=16,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=17,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=18,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=19,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=21,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=22,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=23,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=24,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=25,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=25,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=25,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=25,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=25,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
						{GoodsID=89187,GoodsNum=30,Flag=0,GaiLv=1000000,PinZhi=0,jiazhi=0,Max = 5},
					},
				},
			[2] = {
				{GoodsID=89187,GoodsNum=50,Flag=0,GaiLv=1000000,PinZhi=0,Max = 5},
				{GoodsID=89187,GoodsNum=80,Flag=0,GaiLv=1000000,PinZhi=0,Max = 5},
				{GoodsID=89187,GoodsNum=100,Flag=0,GaiLv=1000000,PinZhi=0,Max = 5},
				},
		},
}

local EquipTable = {
		[1] = {
			{GoodsID = 4303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 4203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 4403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 4503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 5303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 5203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 5403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 5503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 6303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 6203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 6403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 6503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 4103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 4003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 5003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 5103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 6003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
			{GoodsID = 6103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 	
			{GoodsID = 6603,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
			{GoodsID = 6903,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
			{GoodsID = 8103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
			{GoodsID = 2003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
			{GoodsID = 3003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
			{GoodsID = 3903,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
			{GoodsID = 6703,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
			{GoodsID = 7003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
			{GoodsID = 8203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
			{GoodsID = 1503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
			{GoodsID = 6803,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
			{GoodsID = 8003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
			{GoodsID = 8303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
			{GoodsID = 1003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10}, 
		},
		[2] = {
			{GoodsID = 6602,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 6902,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 8102,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 4302,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 4202,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 4402,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 4502,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 6702,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 7002,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 8202,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 5302,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 5202,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 5402,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 5502,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 6802,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 8002,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 8302,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 6302,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 6202,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 6402,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 6502,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 4002,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 4102,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 5002,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 5102,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 6002,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 6102,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 2002,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 3002,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 3902,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 1502,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
			{GoodsID = 1002,Num = 1,Bind = 0,Odds =10000,PinZhi=6,Max = 10},
		},
}




local TeShuJiangLiTable = {
	--雪女凤凰天使炎龙
	--[31039] = {dateID = -6022,keyID = 2,cdID = 11,LuckNum = 20},
	--[31022] = {dateID = -6022,keyID = 2,cdID = 11,LuckNum = 20},
	--[31030] = {dateID = -6022,keyID = 2,cdID = 11,LuckNum = 20},
	--[31046] = {dateID = -6022,keyID = 2,cdID = 11,LuckNum = 20},
	--其他稀有宠物
	--[31042] = {dateID = -6022,keyID = 3,cdID = 11,LuckNum = 10},
	--[31041] = {dateID = -6022,keyID = 3,cdID = 11,LuckNum = 10},
	--[31024] = {dateID = -6022,keyID = 3,cdID = 11,LuckNum = 10},
	--[31048] = {dateID = -6022,keyID = 3,cdID = 11,LuckNum = 10},
	--[31043] = {dateID = -6022,keyID = 3,cdID = 11,LuckNum = 10},
	--[31047] = {dateID = -6022,keyID = 3,cdID = 11,LuckNum = 10},
	--[31044] = {dateID = -6022,keyID = 3,cdID = 11,LuckNum = 10},
	--鬼怪装
	--[11596] = {dateID = -6022,keyID = 4,cdID = 12,LuckNum = 20},
	--[11597] = {dateID = -6022,keyID = 4,cdID = 12,LuckNum = 20},
	--[11598] = {dateID = -6022,keyID = 4,cdID = 12,LuckNum = 20},
--	[11599] = {dateID = -6022,keyID = 4,cdID = 12,LuckNum = 20},
	--仆从装
	--[11071] = {dateID = -6022,keyID = 5,cdID = 12,LuckNum = 10},
	--[11072] = {dateID = -6022,keyID = 5,cdID = 12,LuckNum = 10},
	--[11073] = {dateID = -6022,keyID = 5,cdID = 12,LuckNum = 10},
	--[11074] = {dateID = -6022,keyID = 5,cdID = 12,LuckNum = 10},
	--魂器宝箱
	[89196] = {dateID = -6022,keyID = 6,cdID = 13,LuckNum = 0},
	[0] = {dateID = -6022,keyID = 19,cdID = 13,LuckNum = 0},
	--筋斗云
--	[32022] = {dateID = -6022,keyID = 8,cdID = 14,LuckNum = 20},
--	[32023] = {dateID = -6022,keyID = 8,cdID = 14,LuckNum = 20},
	--其他载具卡
	--[32020] = {dateID = -6022,keyID = 9,cdID = 14,LuckNum = 10},
	--[39707] = {dateID = -6022,keyID = 9,cdID = 14,LuckNum = 10},
	--[39708] = {dateID = -6022,keyID = 9,cdID = 14,LuckNum = 10},
	--[39704] = {dateID = -6022,keyID = 9,cdID = 14,LuckNum = 10},
	--大量金矿石
	[89187] = {dateID = -6022,keyID = 10,cdID = 15,LuckNum = 0},
	--旧万圣节时装
	--[11313] = {dateID = -6022,keyID = 20,cdID = 12,LuckNum = 10},
--	[11314] = {dateID = -6022,keyID = 20,cdID = 12,LuckNum = 10},
	--[11315] = {dateID = -6022,keyID = 20,cdID = 12,LuckNum = 10},
--	[11316] = {dateID = -6022,keyID = 20,cdID = 12,LuckNum = 10},
--	[11317] = {dateID = -6022,keyID = 20,cdID = 12,LuckNum = 10},
	--新万圣节时装
	--[11610] = {dateID = -6022,keyID = 21,cdID = 12,LuckNum = 20},
	--[11611] = {dateID = -6022,keyID = 21,cdID = 12,LuckNum = 20},
	--[11612] = {dateID = -6022,keyID = 21,cdID = 12,LuckNum = 20},
	--[11613] = {dateID = -6022,keyID = 21,cdID = 12,LuckNum = 20},
	--[11623] = {dateID = -6022,keyID = 21,cdID = 12,LuckNum = 20},
	--[11624] = {dateID = -6022,keyID = 21,cdID = 12,LuckNum = 20},
	--[11625] = {dateID = -6022,keyID = 21,cdID = 12,LuckNum = 20},
	--[11626] = {dateID = -6022,keyID = 21,cdID = 12,LuckNum = 20},
	--[11627] = {dateID = -6022,keyID = 21,cdID = 12,LuckNum = 20},
	--[11628] = {dateID = -6022,keyID = 21,cdID = 12,LuckNum = 20},
	--[11629] = {dateID = -6022,keyID = 21,cdID = 12,LuckNum = 20},
	--[11630] = {dateID = -6022,keyID = 21,cdID = 12,LuckNum = 20},
}

--风向标表格
local XuYuanFengXiangBiao = {
[31022] = 4,--凤凰
[31030] = 5, --天使
[31046] = 6, --炎龙
[11610] = 7, --鬼魅
[11611] = 8, --鬼魅
[11612] = 9, --邪恶
[11613] = 10, --邪恶
[89196] = 11, --五星宝箱
[0] = 12,     --三洞
[32022] = 13, --筋斗云
[89187] = 14, --金矿石
}

--奖励判断
function DengShen_ShenDengJiangLi()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local TileX = API_GetMonsterPosX(NPCFastID);
	local TileY = API_GetMonsterPosY(NPCFastID);
	local JiangLitype = 1
	if SelectItem == 100 then
		JiangLitype = 1
	elseif SelectItem == 200 then
		JiangLitype = 2
	elseif SelectItem == 300 then
		JiangLitype = 3
	elseif SelectItem == 400 then
		JiangLitype = 4
	elseif SelectItem == 500 then
		JiangLitype = 5
		local JinBiNum = API_VarDataGetNumber_Ex(1,0,-6022,1,18)
		if JinBiNum >= 100 then
			API_ResponseWrite('<name>神灯</name>')
			API_ResponseWrite('<text>	 抱歉我已经没有多余的金币给你了！</text><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
			API_ResponseFlush(ActorID)			
			return
		end
	elseif SelectItem == 600 then
		JiangLitype = math.random(1,5)
		if JiangLitype == 5 then
			local JinBiNum = API_VarDataGetNumber_Ex(1,0,-6022,1,18)
			if JinBiNum >= 100 then
				JiangLitype = 1
			end
		end
	end
	local LuckNum = API_VarDataGetNumber(ActorID,1,30300)
	local GoodsTable = XuYuanJiangLiTable[JiangLitype]
	local Odds = 200
	local NowTime = os.time()
	local number = math.random(10000)
	local LeiXing = 1
	if LuckNum < 58 then
		if number <= Odds + LuckNum*50 then
			LeiXing = 2
		end
	else
		if number <= 3000 then
			LeiXing = 2
		end
	end
	local j = math.random(table.getn(GoodsTable[LeiXing]))
	local GoodsId = GoodsTable[LeiXing][j].GoodsID
	local Num = GoodsTable[LeiXing][j].GoodsNum
	local Flag = GoodsTable[LeiXing][j].Flag
	local PinZhi = GoodsTable[LeiXing][j].PinZhi
	local ShangXian = GoodsTable[LeiXing][j].Max		
	
	--奖励条件判断
	if LeiXing == 2 then
		local Condition = TeShuJiangLiTable[GoodsId]
		if Condition == nil then
			return
		end
		local DateID = TeShuJiangLiTable[GoodsId].dateID
		local keyID = TeShuJiangLiTable[GoodsId].keyID
		local cdID = TeShuJiangLiTable[GoodsId].cdID
		local LuckNum = TeShuJiangLiTable[GoodsId].LuckNum
		local NowTime = os.time()
		local CDTime = API_VarDataGetNumber_Ex(1,0,DateID,1,cdID)
		local JiLiNum = API_VarDataGetNumber_Ex(1,0,DateID,1,keyID)
		local JinRuNum = API_VarDataGetNumber(ActorID,1,30300)
		if NowTime < CDTime or JinRuNum < LuckNum or JiLiNum >= ShangXian then
			LeiXing = 1
		end
	end
	
	--普通奖励
	local NowPoint = 0
	if LeiXing == 1 then
		API_DestroyMonster(NPCFastID) 
		if JiangLitype ~= 5 then
			for k = 1,30 do				
				local Number = math.random(table.getn(GoodsTable[LeiXing]))
				local j = math.random(table.getn(GoodsTable[LeiXing][Number]))
				GoodsId = GoodsTable[LeiXing][Number][j].GoodsID
				Num = GoodsTable[LeiXing][Number][j].GoodsNum
				Flag = GoodsTable[LeiXing][Number][j].Flag
				PinZhi = GoodsTable[LeiXing][Number][j].PinZhi
				local Point = GoodsTable[LeiXing][Number][j].jiazhi
				NowPoint = NowPoint + Point
				API_CreateDropGoods(MapID,TileX,TileY,GoodsId,Num,Flag,'获得宝藏',0,ActorID,600,60)
				if NowPoint > 400 then
					return
				end
			end
		else
			local Number = math.random(table.getn(GoodsTable[LeiXing]))
			local j = math.random(table.getn(GoodsTable[LeiXing][Number]))
			GoodsId = GoodsTable[LeiXing][Number][j].GoodsID
			Num = GoodsTable[LeiXing][Number][j].GoodsNum
			Flag = GoodsTable[LeiXing][Number][j].Flag
			PinZhi = GoodsTable[LeiXing][Number][j].PinZhi
			for k = 1,Num do
				API_CreateDropGoods(MapID,TileX,TileY,GoodsId,1,Flag,'获得宝藏',0,ActorID,600,60)
			end
			local JinBiNum = API_VarDataGetNumber_Ex(1,0,-6022,1,18)
			JinBiNum = JinBiNum + 1
			API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,18,JinBiNum)
		end
	end
	
	--特殊奖励
	if LeiXing == 2 then
		API_DestroyMonster(NPCFastID) 
		if PinZhi > 0 then
			local Condition = TeShuJiangLiTable[GoodsId]
			if Condition == nil then
				return
			end
			local DateID = TeShuJiangLiTable[GoodsId].dateID
			local keyID = TeShuJiangLiTable[GoodsId].keyID
			local cdID = TeShuJiangLiTable[GoodsId].cdID
			local LuckNum = TeShuJiangLiTable[GoodsId].LuckNum	
			local JiangLiNum = API_VarDataGetNumber_Ex(1,0,DateID,1,keyID)
			JiangLiNum = JiangLiNum + 1
			API_VarDataSetNumber_Ex_Sync(1,0,DateID,1,keyID,JiangLiNum)
			local Time = os.time()
			local Tsec = math.random(300,900)
			local NextTime = Time + Tsec
			API_VarDataSetNumber_Ex_Sync(1,0,DateID,1,cdID,NextTime)
			API_VarDataSetNumber(ActorID,1,30300,0)
			local Lv = API_GetActorExpLevel(ActorID)
			if Lv <= 40 then
				local j = math.random(table.getn(EquipTable[2]))
				GoodsId = EquipTable[2][j].GoodsID
				Num = EquipTable[2][j].Num
				Flag = EquipTable[2][j].Bind
				PinZhi = EquipTable[2][j].PinZhi
			else
				local j = math.random(table.getn(EquipTable[1]))
				GoodsId = EquipTable[1][j].GoodsID
				Num = EquipTable[1][j].Num
				Flag = EquipTable[1][j].Bind
				PinZhi = EquipTable[1][j].PinZhi
			end
			
			API_CreateDropGoodsEx(MapID,TileX,TileY,GoodsId,Num,Flag,'获得宝藏',4,ActorID,600,60,PinZhi)
			API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'通过神灯许愿获得了高附加属性3洞的'..API_GetGoodsName(GoodsId)..'')
			--风向标
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[77][12][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[77][12][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[77][12][LaiYuan] = GLOBAL_FengXiangBiao_DateList[77][12][LaiYuan] + 1
			end			
			return 
		else
			local Condition = TeShuJiangLiTable[GoodsId]
			if Condition == nil then
				return
			end
			local DateID = TeShuJiangLiTable[GoodsId].dateID
			local keyID = TeShuJiangLiTable[GoodsId].keyID
			local cdID = TeShuJiangLiTable[GoodsId].cdID
			local LuckNum = TeShuJiangLiTable[GoodsId].LuckNum
		
			if JiangLitype ~= 5 then
				local JiangLiNum = API_VarDataGetNumber_Ex(1,0,DateID,1,keyID)
				JiangLiNum = JiangLiNum + 1
				API_VarDataSetNumber_Ex_Sync(1,0,DateID,1,keyID,JiangLiNum)
				API_VarDataSetNumber(ActorID,1,30300,0)
				API_CreateDropGoods(MapID,TileX,TileY,GoodsId,Num,Flag,'获得宝藏',0,ActorID,600,60)
				API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'通过神灯许愿获得了'..API_GetGoodsName(GoodsId)..'') 
				local Time = os.time() 
				local Tsec = math.random(300,900)
				local NextTime = Time + Tsec
				API_VarDataSetNumber_Ex_Sync(1,0,DateID,1,cdID,NextTime)
				local Number = XuYuanFengXiangBiao[GoodsId]
				if Number ~= nil then
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[77][Number][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[77][Number][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[77][Number][LaiYuan] = GLOBAL_FengXiangBiao_DateList[77][Number][LaiYuan] + 1
					end					
				end
				return 
			else
				local JiangLiNum = API_VarDataGetNumber_Ex(1,0,DateID,1,keyID)
				JiangLiNum = JiangLiNum + 1
				API_VarDataSetNumber_Ex_Sync(1,0,DateID,1,keyID,JiangLiNum)
				local Time = os.time() 
				local Tsec = math.random(300,900)
				local NextTime = Time + Tsec
				API_VarDataSetNumber_Ex_Sync(1,0,DateID,1,cdID,NextTime)
				API_VarDataSetNumber(ActorID,1,30300,0)
				for k = 1,Num do
					API_CreateDropGoods(MapID,TileX,TileY,GoodsId,1,Flag,'获得宝藏',0,ActorID,600,60)
				end	
				API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'通过神灯许愿获得了'..Num..'个'..API_GetGoodsName(GoodsId)..'') 
				local JinBiNum = API_VarDataGetNumber_Ex(1,0,-6022,1,18)
				JinBiNum = JinBiNum + 1
				API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,18,JinBiNum)
				--风向标
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[77][14][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[77][14][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[77][14][LaiYuan] = GLOBAL_FengXiangBiao_DateList[77][14][LaiYuan] + 1
				end
				return
			end
		end
	end
end


if API_GetServerID() == 1 then
	--创建时间触发器
	local StartTimeTable = WanShengJie2012_StartTime
	local EndTimeTable = WanShengJie2012_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if ShenDengXuYuan_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(ShenDengXuYuan_TimeTriggerGID)
			ShenDengXuYuan_TimeTriggerGID = API_CreateTimerTriggerG(0,0,120,-1,'ShenDengXuYuan_ShuJuQingChu')
		else
			ShenDengXuYuan_TimeTriggerGID = API_CreateTimerTriggerG(0,0,120,-1,'ShenDengXuYuan_ShuJuQingChu')
		end
	end	
end

if WSJLiChe_TimeTriggerGID ~= nil then
	API_DestroyTriggerG(WSJLiChe_TimeTriggerGID)
	WSJLiChe_TimeTriggerGID = API_CreateTimerTriggerG(0,0,60,-1,'WanShengJie2012_TimerTriggerGCallFunc')
else
	WSJLiChe_TimeTriggerGID = API_CreateTimerTriggerG(0,0,60,-1,'WanShengJie2012_TimerTriggerGCallFunc')
end

--清除全局交互数据
function ShenDengXuYuan_ShuJuQingChu(Param1,Param2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.time()
	--设置奖励上限数量
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6022,1,1) and API_GetServerID() == 1 then
		local NowTime = os.date("*t", os.time()) 
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 11 
		NowTime.min = 59 
		NowTime.sec = 59 
		local NightTime = os.time(NowTime)
		local NextQingChuTime = NightTime + 86400 + 1
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,1,NextQingChuTime)
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,3,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,4,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,5,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,6,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,8,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,9,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,10,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,19,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,20,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,21,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,18,0)--每日金币许愿
	end
	--设置三天的奖励上限数量
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6022,1,17) and API_GetServerID() == 1 then
		local NowTime = os.date("*t", os.time()) 
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 11 
		NowTime.min = 59 
		NowTime.sec = 59 
		local NightTime = os.time(NowTime)
		local NextQingChuTime = NightTime + 259200 + 1
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,17,NextQingChuTime)	
		API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,2,0)		
	end
end

if WSJ2012_NanGuaGuaiList == nil then
	WSJ2012_NanGuaGuaiList = {}
end

if WSJ2012_NanGuaCheList == nil then
	WSJ2012_NanGuaCheList = {}
end

local NanGuaBossID = 271212 --南瓜头领ID
local NanGuaCheID = 11691 --万圣节礼车ID

--南瓜车巡礼活动
function WanShengJie2012_TimerTriggerGCallFunc()
	local WanShengJie2012_MapList = {9,25}
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local StartTimeTable = WanShengJie2012_StartTime
	local EndTimeTable = WanShengJie2012_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		if Hour == 21 and Minute == 0 then
			WSJHD_KaiShiBiaoZhi = 1
		end
		if Hour == 21 then
			if API_GetServerID() == 1 then
				if WSJHD_KaiShiBiaoZhi == nil or WSJHD_KaiShiBiaoZhi < 2 then
					WSJHD_KaiShiBiaoZhi = 2
					API_ActorBroadcastMsgEx(-1,-1,0,17,'万圣节礼车已经出现在暗礁海与麦穗平原！丰厚礼品等你来拿！')
					API_ActorBroadcastMsgEx(-1,-1,0,1,'万圣节礼车已经出现在暗礁海与麦穗平原！丰厚礼品等你来拿！')
					API_ActorBroadcastMsgEx(-1,-1,0,7,'万圣节礼车已经出现在暗礁海与麦穗平原！丰厚礼品等你来拿！')
				end			
			end
			for j,i in WanShengJie2012_MapList do
				local MapID = i
				if API_MapIsValid(MapID) then
					local MapConfigID = API_GetMapConfigID(MapID)
					if GLOBAL_NanGuaChe_Route[MapConfigID] ~= nil then
						if WSJ2012_NanGuaCheList[MapID] == nil then
							WSJ2012_NanGuaCheList[MapID] = {}
						end
						for j in GLOBAL_NanGuaChe_Route[MapConfigID] do
							if WSJ2012_NanGuaCheList[MapID][j] == nil then
								WSJ2012_NanGuaCheList[MapID][j] = {}
							end
							local NanGuaCheFastID = WSJ2012_NanGuaCheList[MapID][j].NanGuaCheFastID
							if NanGuaCheFastID == nil or API_GetMonsterID(NanGuaCheFastID) <= 0 then
								local TileX = GLOBAL_NanGuaChe_Route[MapConfigID][j].StartTile.TileX
								local TileY = GLOBAL_NanGuaChe_Route[MapConfigID][j].StartTile.TileY
								local RouteNum = GLOBAL_NanGuaChe_Route[MapConfigID][j].RouteNum
								local Route = GLOBAL_NanGuaChe_Route[MapConfigID][j].Route
								NanGuaCheFastID = API_CreateMonsterEx(MapID,NanGuaCheID,TileX,TileY,5,0,-1,1)
								GLOBAL_NanGuaChe_JiangLiZhongLiang[NanGuaCheFastID] = 1000
								local NanGuaBossAFastID = API_CreateMonster(MapID,NanGuaBossID,TileX,TileY,5,0,-1)
								local NanGuaBossBFastID = API_CreateMonster(MapID,NanGuaBossID,TileX,TileY,5,0,-1)
								WSJ2012_NanGuaCheList[MapID][j].NanGuaCheFastID = NanGuaCheFastID
								WSJ2012_NanGuaCheList[MapID][j].NanGuaBossAFastID = NanGuaBossAFastID
								WSJ2012_NanGuaCheList[MapID][j].NanGuaBossBFastID = NanGuaBossBFastID
								API_SetMonsterChief(NanGuaBossAFastID,NanGuaCheFastID)
								API_SetMonsterChief(NanGuaBossBFastID,NanGuaCheFastID)
								API_CreateDieTriggerG(MapID,0,0,NanGuaBossAFastID,'WanShengJie_BossDieFunc')
								API_CreateDieTriggerG(MapID,0,0,NanGuaBossBFastID,'WanShengJie_BossDieFunc')
								API_MonsterMoveTo(NanGuaCheFastID,RouteNum,Route) 
							else
								local TileX,TileY = PublicFun_GetMonsterPosXY(NanGuaCheFastID)
								local NanGuaBossAFastID = WSJ2012_NanGuaCheList[MapID][j].NanGuaBossAFastID
								local NanGuaBossBFastID = WSJ2012_NanGuaCheList[MapID][j].NanGuaBossBFastID
								if NanGuaBossAFastID == nil or API_GetMonsterID(NanGuaBossAFastID) <= 0 then
									NanGuaBossAFastID = API_CreateMonster(MapID,NanGuaBossID,TileX,TileY,5,0,-1)
									WSJ2012_NanGuaCheList[MapID][j].NanGuaBossAFastID = NanGuaBossAFastID
									API_SetMonsterChief(NanGuaBossAFastID,NanGuaCheFastID)
									API_CreateDieTriggerG(MapID,0,0,NanGuaBossAFastID,'WanShengJie_BossDieFunc')
								end
								if NanGuaBossBFastID == nil or API_GetMonsterID(NanGuaBossBFastID) <= 0 then
									NanGuaBossBFastID = API_CreateMonster(MapID,NanGuaBossID,TileX,TileY,5,0,-1)
									WSJ2012_NanGuaCheList[MapID][j].NanGuaBossBFastID = NanGuaBossBFastID
									API_SetMonsterChief(NanGuaBossBFastID,NanGuaCheFastID)
									API_CreateDieTriggerG(MapID,0,0,NanGuaBossBFastID,'WanShengJie_BossDieFunc')
								end
							end
						end
					end
				end
			end
		else
			if API_GetServerID() == 1 then
				if WSJHD_KaiShiBiaoZhi == nil or WSJHD_KaiShiBiaoZhi < 3 then
					WSJHD_KaiShiBiaoZhi = 3
					API_ActorBroadcastMsgEx(-1,-1,0,17,'万圣节礼车已经离开！')
					API_ActorBroadcastMsgEx(-1,-1,0,1,'万圣节礼车已经离开！')
					API_ActorBroadcastMsgEx(-1,-1,0,7,'万圣节礼车已经离开！')
				end
			end
			for i in WSJ2012_NanGuaCheList do
				local MapID = i
				if API_MapIsValid(MapID) then
					for j in WSJ2012_NanGuaCheList[MapID] do
						if type(WSJ2012_NanGuaCheList[MapID][j]) == 'table' then
							local NanGuaCheFastID = WSJ2012_NanGuaCheList[MapID][j].NanGuaCheFastID
							local NanGuaBossAFastID = WSJ2012_NanGuaCheList[MapID][j].NanGuaBossAFastID
							local NanGuaBossBFastID = WSJ2012_NanGuaCheList[MapID][j].NanGuaBossBFastID
							if NanGuaCheFastID ~= nil and API_GetMonsterID(NanGuaCheFastID) > 0 then
								API_DestroyMonster(NanGuaCheFastID)
							end
--							local AreaCreatureTriggerGID = WSJ2012_NanGuaCheList[MapID][j].AreaCreatureTriggerGID
--							if AreaCreatureTriggerGID ~= nil then
--								API_DestroyTriggerG(AreaCreatureTriggerGID)
--							end
						end
						WSJ2012_NanGuaCheList[MapID][j] = nil
					end
				end
			end
		end
	else
		
	end
end

local ShiZhuangBaoShi = {39504,39505,39506,39511,39514,39517,39520,39523,39526,39529,
						39507,39508,39509,39512,39515,39518,39521,39524,39527,39530}

--宝石宝箱使用
function WanShengJie_BaoShiUse(ActorID,GoodsID)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_ActorGetPackageSize(ActorID) < 1 then
		API_ResponseWrite('<br><text>背包空间不足，请至少保证有一个空格再打开宝箱！</text><br>') 
		API_ResponseWrite('<br><br><a>确定</a>')
		return 0
	end

	if API_ActorGetGoodsNum(ActorID,89195) > 0 and API_ActorRemoveGoods(ActorID,89195,1,'使用时装宝石宝箱') then--销毁玩家身上的物品
		local GoodsID = ShiZhuangBaoShi[math.random(table.getn(ShiZhuangBaoShi))]
		fuzhuangbaoshicuhangjianshuxingadd(ActorID,GoodsID,0,0)
		API_ActorSendMsg(ActorID,3,'打开时装宝石宝箱获得一个'..API_GetGoodsName(GoodsID)..'')
		return 1
	else
		return 0
	end
end

local HunQiGoodsID = {11578,11562,11557,11567,11572,11583,11588,11593}

local HunQiBaoXiang = {
	[11557] = {PropertyID = 1,QualityID = 4,},
	[11562] = {PropertyID = 2,QualityID = 4,},
	[11572] = {PropertyID = 3,QualityID = 4,},
	[11578] = {PropertyID = 4,QualityID = 4,},
	[11583] = {PropertyID = 5,QualityID = 4,},
	[11588] = {PropertyID = 6,QualityID = 4,},
	[11593] = {PropertyID = 7,QualityID = 4,},
	[11567] = {PropertyID = 8,QualityID = 4,},
}

local HunQiGoodsID_6 = {11709,11710,11712,11713,11714,11715,11716,11711}

local HunQiBaoXiang_6 = {
	[11709] = {PropertyID = 1,QualityID = 5,},
	[11710] = {PropertyID = 2,QualityID = 5,},
	[11712] = {PropertyID = 3,QualityID = 5,},
	[11713] = {PropertyID = 4,QualityID = 5,},
	[11714] = {PropertyID = 5,QualityID = 5,},
	[11715] = {PropertyID = 6,QualityID = 5,},
	[11716] = {PropertyID = 7,QualityID = 5,},
	[11711] = {PropertyID = 8,QualityID = 5,},
}

--魂器宝箱使用
function WanShengJie_HunQiUse(ActorID,GoodsID)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local ContainerSize = API_GetHorcruxesEmptySize(ActorID, 2)
	if ContainerSize <= 0 then
		API_ActorSendMsg(ActorID,3,'猎魂背包已满')
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用魂器宝箱') then--销毁玩家身上的物品
		local BoxGoodsID = GoodsID
		local UseTab = HunQiGoodsID
		local UseInfo = HunQiBaoXiang
		if BoxGoodsID == 89001 then
			UseTab = HunQiGoodsID_6
			UseInfo = HunQiBaoXiang_6
		end
		local Num = math.random(table.getn(UseTab))
		GoodsID = UseTab[Num]
		local PropertyID = UseInfo[GoodsID].PropertyID
		local QualityID = UseInfo[GoodsID].QualityID
		API_ActorNewHorcruxes(ActorID, GoodsID, PropertyID, QualityID, 480)
		API_ActorSendMsg(ActorID,3,'打开魂器宝箱获得一个'..API_GetGoodsName(GoodsID)..'')
		return 1
	else
		return 0
	end
end