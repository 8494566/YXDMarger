------------------------------------------------------------------------------------------------------------------------------------------------------------
--文件名:Scp\Lua\Act\HalloweenTimeChannel.lua
--版  权:(C)  深圳腾讯计算机网络有限公司
--创建人:   黄蕾
--日  期:   2012年10月23日	
--版  本:   1.0
--描  述:   月暮刷门，进入门需要灵魂珠和面具，门里面有2个宝箱，点击一个宝箱删除另外一个宝箱。
--          开宝箱遇到2种情况,一种直接掉神灯，一种触发怪物，杀怪得奖。
--应  用:   英雄岛
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--定义
--全局万圣节活动时间区:(2012/10/31-2012/11/11)--文件名:  Scp\Lua\Act\HalloweenActivity.lua
--tHalloweenStartTime_HL = {Year = 2012,Month = 10,Day = 23,Hour = 0 ,Minute = 0 ,Second = 0 }
--tHalloweenEndTime_HL   = {Year = 2012,Month = 11,Day = 11,Hour = 23,Minute = 59,Second = 59}

local nTimeChannelMapID = 2012 --副本地图
local tTimeChannel_MapList = {101} --月暮
local nTimeChannelDoorNPC  = 12385 --时光隧道进入门的ID
local nTimeChannelDoorNPC  = 12386 --时光隧道出来门的ID
local nLinHunZhuID = 89193 --灵魂珠ID    
local nnvmianjvID = 10984  --猫女面具
local nnanmianjvID = 10985 --狂欢面具
local nBOXID1 = 12383      --点开前的箱子
local nBOXID2 = 12384      --打开后的箱子
local nShenDengID = 89194       --神灯ID
--月暮刷门保存表
if TimeChannel_FuBenIDlist == nil then 
   TimeChannel_FuBenIDlist = {}
end
--副本箱子表 958001
local TimeChannel_MapInfo = {
[1] = {
		NPC = {
				{NPCID = 12383,TileX = 58,TileY = 74,Direct = 3,AIInfoID = nil,Camp = nil,},
				{NPCID = 12383,TileX = 53,TileY = 70,Direct = 3,AIInfoID = nil,Camp = nil,},
				--{NPCID = 12386,TileX = 60,TileY = 53,Direct = 3,AIInfoID = nil,Camp = nil,},--门
			},
		Monster = {
				{NPCID = 12386,TileX = 60,TileY = 53,Direct = 3,AIInfoID = nil,Camp = nil,},--门
			},
		
		},
}
--突击骷髅怪(精英)的掉落
local TimeChannel_YeWaiGoodsID = {           
    [1] = {
                [1] = {GoodsID=845,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},--变身糖果
		[2] ={GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		[3] ={GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		[4] ={GoodsID=89093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		[5] ={GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		[6] ={GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
		[7] ={GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
		[8] ={GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		[9] ={GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
		[10] ={GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
		[11] ={GoodsID=40003,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[12] ={GoodsID=40013,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[13] ={GoodsID=40023,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[14] ={GoodsID=40033,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[15] ={GoodsID=40043,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[16] ={GoodsID=40053,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[17] ={GoodsID=40063,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[18] ={GoodsID=40073,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[19] ={GoodsID=40083,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[20] ={GoodsID=40093,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[21] ={GoodsID=40103,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[22] ={GoodsID=40113,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[23] ={GoodsID=40123,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[24] ={GoodsID=40133,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[25] ={GoodsID=40204,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[26] ={GoodsID=40220,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[27] ={GoodsID=40236,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[28] ={GoodsID=40252,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[29] ={GoodsID=40268,GoodsNum=1,Flag=0,GaiLv=30000,PinZhi=0},
		[30] ={GoodsID=80621,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		[31] ={GoodsID=80621,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
		[32] ={GoodsID=80621,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
		[33] ={GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		[34] ={GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
		[35] ={GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
		[36] ={GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		[37] ={GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
		[38] ={GoodsID=11609,GoodsNum=1,Flag=0,GaiLv=100000,PinZhi=0},
	   },
}
--护卫怪物的掉落表
local TimeChannel_YeWaiGoodsIDOne = {           
    [1] = {
                [1] ={GoodsID=80498,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		[2] ={GoodsID=80696,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},     
                },
}
local TimeChannel_YeWaiGoodsIDTwo = {           
    [1] = {
                [1] ={GoodsID=80410,GoodsNum=150,Flag=0,GaiLv=1000000,PinZhi=0},
		
                },
}
--------------------------------------------------------------------------------------------------------------------------------------------------------
--逻辑
--------------------------------------------------------------------------------------------------------------------------------------------------------
--1时间触发回调
if API_GetServerID() == 1 then
	local StartTimeTable = tHalloweenStartTime_HL
	local EndTimeTable   = tHalloweenEndTime_HL
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if HLTimeChannel_TriggerID ~= nil then
			API_DestroyTriggerG(HLTimeChannel_TriggerID)
			HLTimeChannel_TriggerID = API_CreateTimerTriggerG(0,0,60,-1,'HLTimeChannel_ActTimeFunc')
			--API_Trace('隧道创建时间触发器1')
		else
			HLTimeChannel_TriggerID = API_CreateTimerTriggerG(0,0,60,-1,'HLTimeChannel_ActTimeFunc')
			--API_Trace('隧道创建时间触发器2')
		end
	end
end
--2创建门
function HLTimeChannel_ActTimeFunc()
	
	--2012/10/31-2012/11/11   13：00-14：00  20：00-21：00
	local StartTimeTable = tHalloweenStartTime_HL
	local EndTimeTable = tHalloweenEndTime_HL
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if API_GetServerID() == 1 then
			if Hour == 12 and  Minute >= 58 and Minute <= 59 then
				API_ActorBroadcastMsg(-1,17,'时光隧道活动：13：00-14：00将在月暮草场展开。')
				API_ActorBroadcastMsg(-1,1,'时光隧道活动：13：00-14：00将在月暮草场展开。')
				API_ActorBroadcastMsg(-1,7,'时光隧道活动：13：00-14：00将在月暮草场展开。')
			elseif Hour == 19 and  Minute >= 58 and Minute <= 59 then
				API_ActorBroadcastMsg(-1,17,'时光隧道活动：20：00-21：00将在月暮草场展开。')
				API_ActorBroadcastMsg(-1,1,'时光隧道活动：20：00-21：00将在月暮草场展开。')
				API_ActorBroadcastMsg(-1,7,'时光隧道活动：20：00-21：00将在月暮草场展开。')
			elseif Hour == 13 and math.mod(Minute,10) == 0 then
				API_ActorBroadcastMsg(-1,17,'月暮草场出现许多时光隧道。')
				API_ActorBroadcastMsg(-1,1,'月暮草场出现许多时光隧道。')
				API_ActorBroadcastMsg(-1,7,'月暮草场出现许多时光隧道。')
			elseif Hour == 20 and math.mod(Minute,10) == 0 then
				API_ActorBroadcastMsg(-1,17,'月暮草场出现许多时光隧道。')
				API_ActorBroadcastMsg(-1,1,'月暮草场出现许多时光隧道。')
				API_ActorBroadcastMsg(-1,7,'月暮草场出现许多时光隧道。')
			
			end	
		end	
	--API_Trace('活动时间内')
		if Hour == 13 or Hour == 20 then
		--API_Trace('活动区间内')
			for i,v in tTimeChannel_MapList do
				--API_Trace('11111111111111')
				local RightMapID = API_GetRightMapID(v)
				if API_MapIsValid(RightMapID) then
				--API_Trace('222222222')
					local PlayNum = 50 
					local PlayList = API_GetActorInArea(RightMapID,0,0,0,0,0)
					if PlayList ~= nil then
						PlayNum = table.getn(PlayList)
					end
					if PlayNum > 50 then
						PlayNum = 50
					end
					local nTimeChannelNPC = PlayNum
					if TimeChannel_FuBenIDlist[RightMapID] == nil then
						TimeChannel_FuBenIDlist[RightMapID] = {}
					end
					--API_Trace('nTimeChannelNPC='..nTimeChannelNPC)
					for j = 1,nTimeChannelNPC do
						--API_Trace('3333333')
						local YeWaiFastID = TimeChannel_FuBenIDlist[RightMapID][j]
						if YeWaiFastID == nil or API_GetMonsterID(YeWaiFastID) <= 0 then
							local Width,Height = PublicFun_GetMapWidthHeight(RightMapID)
							local TileX = 0
							local TileY = 0
							local Num = 0
							repeat
								Num = Num + 1
								TileX = math.random(Width)
								TileY = math.random(Height)
							until not API_IsBlockTile(RightMapID,TileX,TileY,0) or Num == 100
							if not API_IsBlockTile(RightMapID,TileX,TileY,0) then
								local YeWaiFastID = API_CreateMonsterEx(RightMapID,12385,TileX,TileY,4,0,-1,1)
								--API_Trace('TileX='..TileX)
								--API_Trace('TileY='..TileY)
								--API_Trace('创建隧道门成功')
								TimeChannel_FuBenIDlist[RightMapID][j] = YeWaiFastID
							end
						end
					end			
				end
			end
			
		else
			for i in TimeChannel_FuBenIDlist do
				for j,v in TimeChannel_FuBenIDlist[i] do
					if API_GetMonsterID(v) > 0 then
						API_DestroyMonster(v)
					end
				end
			end
			TimeChannel_FuBenIDlist = {}
		end
	end
	
end
--3门点击函数（副本函数调用）
function HLTimeChannel_Click(ActorID,NPCID)
	--API_Trace('HLTimeChannel_Click')
	local ActorID = ActorID or API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	--通用判断FASTID
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
      	--门不存在
        if API_GetMonsterID(NPCFastID) <= 0 then
		API_ResponseEnd()
		API_ResponseClear()
		return
	end
	--门存在
   	if XuanZe == 0 then
		API_ResponseWrite('<name>时光隧道</name>')
		API_ResponseWrite('<br><text color="255,0,0">哇，传说进入时光隧道找到神灯就能美梦成真。（进入条件：30个灵魂珠，并且要装备上猫脸面具[女装]或者狂欢面具[男装]）</text><br>')
		API_ResponseWrite('<br><a href="HLTimeChannel_Click?1=2">现在进入</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	elseif  XuanZe == 2 or XuanZe == 3 then		
		if API_ActorIsOnline(ActorID) then
			if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
			  API_ResponseWrite('<name>时光隧道</name>')
			  API_ResponseWrite('<br><text>亲爱的 </text><text color="255,0,255">'..API_GetActorName(ActorID)..' </text><text>您正在快递，无法进入时光隧道！</text><br>')
			  API_ResponseWrite('<br><a>确定</a><br>')
			  API_ResponseFlush(ActorID)
			  return
			end
			if API_ActorIsDying(ActorID) then
			  API_ResponseWrite('<name>时光隧道</name>')
			  API_ResponseWrite('<br><text>亲爱的 </text><text color="255,0,255">'..API_GetActorName(ActorID)..' </text><text>，您死亡，无法进入时光隧道！</text><br>')
			  API_ResponseWrite('<br><a>确定</a><br>')
			  API_ResponseFlush(ActorID)
			  return
			end
			if API_VarDataGetNumber(ActorID,1,11816) > 0 then
			  API_ResponseWrite('<name>时光隧道</name>')
			  API_ResponseWrite('<br><text>亲爱的 </text><text color="255,0,255">'..API_GetActorName(ActorID)..' </text><text>您在公交车上无法进入时光隧道！</text><br>')
			  API_ResponseWrite('<br><a>确定</a><br>')
			  API_ResponseFlush(ActorID)
			  return
			end
			--判断是否有灵魂珠和装备了面具
			if API_ActorHaveEquip(ActorID,nnvmianjvID) or API_ActorHaveEquip(ActorID,nnanmianjvID) then
				if API_ActorGetGoodsNum(ActorID,nLinHunZhuID) < 30 then
					API_ResponseWrite('<name>时光隧道</name>')
				  	API_ResponseWrite('<br><text>亲爱的 </text><text color="255,0,255">'..API_GetActorName(ActorID)..' </text><text>您的灵魂珠少于30个，无法进入时光隧道。</text><br>')
				  	API_ResponseWrite('<br><a>确定</a><br>')
				else
					if API_ActorRemoveGoods(ActorID,nLinHunZhuID,30,"时装隧道删除") then
						API_ActorSendMsg(ActorID,7,'消耗了30个'..API_GetGoodsName(nLinHunZhuID)..'进入时光隧道')
						HLTimeChannel_Create(ActorID,NPCFastID,XuanZe)
					end
				end
			else
				API_ResponseWrite('<name>时光隧道</name>')
			  	API_ResponseWrite('<br><text>亲爱的 </text><text color="255,0,255">'..API_GetActorName(ActorID)..' </text><text>您没有装备面具，无法进入时光隧道。</text><br>')
			  	API_ResponseWrite('<br><a>确定</a><br>')	
			end
			
		end
			
	end
		
	API_ResponseFlush(ActorID)	
end
--4副本创建函数（点击删除门，创建副本，创建宝箱，宝箱死亡回调，传送至副本回调，风向标）
function HLTimeChannel_Create(ActorID,NPCFastID,XuanZe)
	
	local ActorID = ActorID or API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	--点击删除门
	API_DestroyMonster(NPCFastID)
	--初始化箱子是否开启过
	API_VarDataSetNumber(ActorID,1,30308,0)
	--创建副本        
	local ObjectMapID = API_CreateEctype(nTimeChannelMapID,0)  
	local CitadelTable = TimeChannel_MapInfo[1]
	--创建箱子NPC
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
			
			--保存FAATID 
		end
	end
	--创建传送门
	if type(CitadelTable.Monster) == 'table' then
		for j = 1,table.getn(CitadelTable.Monster) do
			 local NPCTable = CitadelTable.Monster[j]
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
			--API_VarDataSetNumber_Ex_Sync(1,0,-6179,1,1,FastID) 
			--保存FAATID 
		end
	end
	HLTimeChannel_PlayGotoMap(ActorID,ObjectMapID)
	
end
--5传送至副本回调函数
function HLTimeChannel_PlayGotoMap(ActorID,ObjectMapID)
	
	local TileX = 57
	local TileY = 71
	local ActorID = ActorID or API_RequestGetActorID()
	
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorIsOnline(ActorID) then
		API_ActorGoToMap(ActorID,ObjectMapID,TileX,TileY)
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		if GLOBAL_FengXiangBiao_DateList[77][1][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[77][1][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[77][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[77][1][LaiYuan] + 1
		end
	end
end

--6点击箱子函数
function HLTimeChannel_BoxClick (ActorID,NPCID)
	--随机点箱子
	local ActorID = ActorID or API_RequestGetActorID()
	local nMapID  =API_GetActorMapID(ActorID)
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local TileX = API_GetMonsterPosX(NPCFastID);
	local TileY = API_GetMonsterPosY(NPCFastID);
	local ax = TileX +1
	local ay = TileY +1
	--local DynamicMapID = nMapID
	--判断归属
	local TeamID = API_GetTeamID(ActorID)
	local GuiShuType = 0
	local WhatID = 0
	if TeamID > 0 then
	   GuiShuType = 3
	   WhatID = TeamID
	else
	   GuiShuType = 0
	   WhatID = ActorID
	end
	
	if API_GetMonsterID(NPCFastID) ~= 12383 then
		return
	end
	
	local nRandNum = math.random(10000)
	if nRandNum < 5000 then
	
	  	--存角色交互判断是否已经打开过箱子
		 if  API_VarDataGetNumber(ActorID,1,30308) ~= 1 then
			
			--删掉地表箱子
			API_DestroyMonster(NPCFastID)
			----------------------------------------------------------------------------------------------------------------------
			--判断是否在CD时间内
			local NowTime = os.time()
			local NextTime = API_VarDataGetNumber_Ex(1,0,-6179,1,1)
			--创建神灯掉落还是怪物掉落
			if NowTime >= NextTime then
			        --3代表绑定的物品
				API_CreateDropGoodsEx(nMapID,TileX,TileY,nShenDengID,1,3,'万圣节时光隧道掉落',GuiShuType,WhatID,600,120,0)
				API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在时光隧道活动中获得了'..API_GetGoodsName(nShenDengID)..'')
				local CDTime = 120
				NextTime = NowTime + CDTime
				API_VarDataSetNumber_Ex_Sync(1,0,-6179,1,1,NextTime)
				--神灯掉落风向标
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[77][2][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[77][2][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[77][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[77][2][LaiYuan] + 1
				end
			else
				--创建BOSS突击骷髅怪(精英)【ID:730150】
				local FastID = API_CreateMonster(nMapID, 730150, TileX, TileY, 4, 0, -1)
				API_CreateDieTriggerG(nMapID, 0, 0, FastID, 'HLTimeChannel_MonsterDie')
				--万圣南瓜怪730023
				for i = 1,10 do
					local Width,Height = PublicFun_GetMapWidthHeight(nMapID)
					local TileX = 0
					local TileY = 0
					local Num = 0
					repeat
						Num = Num + 1
						TileX = math.random(Width)
						TileY = math.random(Height)
					until not API_IsBlockTile(nMapID,TileX,TileY,0) or Num == 100
					if not API_IsBlockTile(nMapID,TileX,TileY,0) then
						local YeWaiFastID1 = API_CreateMonster(nMapID,730023, TileX, TileY, 4, 0, -1)
						API_CreateDieTriggerG(nMapID, 0, 0, YeWaiFastID1, 'HLTimeChannel_MonsterDieOne')
					end	
				end
				--万圣杰森怪730025
				for i = 1,5 do
					local Width,Height = PublicFun_GetMapWidthHeight(nMapID)
					local TileX = 0
					local TileY = 0
					local Num = 0
					repeat
						Num = Num + 1
						TileX = math.random(Width)
						TileY = math.random(Height)
					until not API_IsBlockTile(nMapID,TileX,TileY,0) or Num == 100
					if not API_IsBlockTile(nMapID,TileX,TileY,0) then
						local YeWaiFastID2 = API_CreateMonster(nMapID,730025, TileX, TileY, 4, 0, -1)
						API_CreateDieTriggerG(nMapID, 0, 0, YeWaiFastID2, 'HLTimeChannel_MonsterDieTwo')
					end	
				end
				
			end
			-----------------------------------------------------------------------------------------------------------------------
			--创建打开的箱子
			API_CreateMonster(nMapID, nBOXID2, ax, ay, 4, 0, -1)
			API_VarDataSetNumber(ActorID,1,30308,1)
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<text>您已经开启过一个隧道宝箱了，每个玩家只能开启一个宝藏！</text><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
		end
	else
		--存角色交互判断是否已经打开过箱子
		 if  API_VarDataGetNumber(ActorID,1,30308) ~= 1 then
			--删掉地表箱子
			API_DestroyMonster(NPCFastID)
			--创建BOSS突击骷髅怪(精英)【ID:730150】
			local FastID = API_CreateMonster(nMapID, 730150, TileX, TileY, 4, 0, -1)
			API_CreateDieTriggerG(nMapID, 0, 0, FastID, 'HLTimeChannel_MonsterDie')
			--万圣南瓜怪730023
			for i = 1,10 do
				local Width,Height = PublicFun_GetMapWidthHeight(nMapID)
				local TileX = 0
				local TileY = 0
				local Num = 0
				repeat
					Num = Num + 1
					TileX = math.random(Width)
					TileY = math.random(Height)
				until not API_IsBlockTile(nMapID,TileX,TileY,0) or Num == 100
				if not API_IsBlockTile(nMapID,TileX,TileY,0) then
					local YeWaiFastID1 = API_CreateMonster(nMapID,730023, TileX, TileY, 4, 0, -1)
					API_CreateDieTriggerG(nMapID, 0, 0, YeWaiFastID1, 'HLTimeChannel_MonsterDieOne')
				end	
			end
			--万圣杰森怪730025
			for i = 1,5 do
				local Width,Height = PublicFun_GetMapWidthHeight(nMapID)
				local TileX = 0
				local TileY = 0
				local Num = 0
				repeat
					Num = Num + 1
					TileX = math.random(Width)
					TileY = math.random(Height)
				until not API_IsBlockTile(nMapID,TileX,TileY,0) or Num == 100
				if not API_IsBlockTile(nMapID,TileX,TileY,0) then
					local YeWaiFastID2 = API_CreateMonster(nMapID,730025, TileX, TileY, 4, 0, -1)
					API_CreateDieTriggerG(nMapID, 0, 0, YeWaiFastID2, 'HLTimeChannel_MonsterDieTwo')
				end	
			end
			--创建打开的箱子
			API_CreateMonster(nMapID, nBOXID2, ax, ay, 4, 0, -1)
			API_VarDataSetNumber(ActorID,1,30308,1)
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<text>您已经开启过一个隧道宝箱了，每个玩家只能开启一个宝藏！</text><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
		end	
		
		
	end
end
--7死亡回调函数
function HLTimeChannel_MonsterDie(ActorID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	--local DynamicMapID = nMapID
	local ActorID = ActorID or API_RequestGetActorID()
	
	if DynamicMapID <= 0 then
		return
	end
	if not API_MapIsValid(DynamicMapID) then
		return
	end
	--判断归属
	local TeamID = API_GetTeamID(KillerID)
	local GuiShuType = 0
	local WhatID = 0
	if TeamID > 0 then
	   GuiShuType = 3
	   WhatID = TeamID
	else
	   GuiShuType = 0
	   WhatID = KillerID
	end
	--判断掉落
	local MapConfigID = API_GetMapConfigID(DynamicMapID)
	local GoodTable = TimeChannel_YeWaiGoodsID
	for j in GoodTable do
		for i in GoodTable[j] do
			local GaiLv1 = GoodTable[j][i].GaiLv
			local GaiLv = math.random(1000000)
			if GaiLv <= GaiLv1 then
			         local GoodsID = GoodTable[j][i].GoodsID
			         local Num  = GoodTable[j][i].GoodsNum
			         local PinZhi  = GoodTable[j][i].PinZhi
			         if PinZhi > 0 then
			    		API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,Num,0,'万圣节野外怪掉落',GuiShuType,WhatID,600,120,PinZhi)
			         else
			   		API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsID,Num,0,'万圣节野外怪掉落',GuiShuType,WhatID,600,120)
			         end 
			end
		end
		
	end
	
end
function HLTimeChannel_MonsterDieOne(ActorID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	local ActorID = ActorID or API_RequestGetActorID()
	
	if DynamicMapID <= 0 then
		return
	end
	if not API_MapIsValid(DynamicMapID) then
		return
	end
	local TeamID = API_GetTeamID(KillerID)
	local GuiShuType = 0
	local WhatID = 0
	if TeamID > 0 then
	   GuiShuType = 3
	   WhatID = TeamID
	else
	   GuiShuType = 0
	   WhatID = KillerID
	end  
	--判断掉落
	local MapConfigID = API_GetMapConfigID(DynamicMapID)
	local GoodTable = TimeChannel_YeWaiGoodsIDOne
	for j in GoodTable do
		for i in GoodTable[j] do
			local GaiLv1 = GoodTable[j][i].GaiLv
			local GaiLv = math.random(1000000)
			if GaiLv <= GaiLv1 then
			         local GoodsID = GoodTable[j][i].GoodsID
			         local Num  = GoodTable[j][i].GoodsNum
			         local PinZhi  = GoodTable[j][i].PinZhi
			         if PinZhi > 0 then
			    		API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,Num,0,'万圣节野外怪掉落',GuiShuType,WhatID,600,120,PinZhi)
			         else
			   		API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsID,Num,0,'万圣节野外怪掉落',GuiShuType,WhatID,600,120)
			         end 
			end
		end
		
	end
end
function HLTimeChannel_MonsterDieTwo(ActorID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	local ActorID = ActorID or API_RequestGetActorID()
	
	if DynamicMapID <= 0 then
		return
	end
	if not API_MapIsValid(DynamicMapID) then
		return
	end
	local TeamID = API_GetTeamID(KillerID)
	local GuiShuType = 0
	local WhatID = 0
	if TeamID > 0 then
	   GuiShuType = 3
	   WhatID = TeamID
	else
	   GuiShuType = 0
	   WhatID = KillerID
	end  
	--判断掉落
	local MapConfigID = API_GetMapConfigID(DynamicMapID)
	local GoodTable = TimeChannel_YeWaiGoodsIDTwo
	for j in GoodTable do
		for i in GoodTable[j] do
			local GaiLv1 = GoodTable[j][i].GaiLv
			local GaiLv = math.random(1000000)
			if GaiLv <= GaiLv1 then
			         local GoodsID = GoodTable[j][i].GoodsID
			         local Num  = GoodTable[j][i].GoodsNum
			         local PinZhi  = GoodTable[j][i].PinZhi
			         if PinZhi > 0 then
			    		API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,Num,0,'万圣节野外怪掉落',GuiShuType,WhatID,600,120,PinZhi)
			         else
			   		API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsID,Num,0,'万圣节野外怪掉落',GuiShuType,WhatID,600,120)
			         end 
			end
		end
		
	end
end
--8传送出副本回调函数
function HLTimeChannel_PlayGotoMapTwo(ActorID,ObjectMapID)
	
	local ActorID = ActorID or API_RequestGetActorID()
	local TileX = 367
	local TileY = 477
	local XuanZe = API_RequestGetNumber(1)
	--API_Trace('ActorID'..ActorID)
	--门存在
   	if XuanZe == 0 then
		API_ResponseWrite('<name>时光隧道</name>')
		API_ResponseWrite('<br><text color="255,0,0">出去寻找另外一个“时光隧道”吧。</text><br>')
		API_ResponseWrite('<br><a href="HLTimeChannel_PlayGotoMapTwo?1=2">传出地图</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	else
		--API_Trace('XuanZe'..XuanZe)		
		API_ActorGoToMap(ActorID,101,TileX,TileY)	
	end	
	API_ResponseFlush(ActorID)	
end


--传送测试
--local ActorID = API_RequestGetActorID()
--API_ActorGoToMap(ActorID,2,314,260)	
