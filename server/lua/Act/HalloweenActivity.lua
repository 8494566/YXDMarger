---------------------------------------------------------------------------------------------------------------------------------------
--文件名:  Scp\Lua\Act\HalloweenActivity.lua
--版  权:  (C)  腾讯网域计算机网络有限公司
--创建人:   黄蕾  sofiehuang
--日  期:   2012-10-19
--版  本:   1.0
--描  述:   万圣节活动
--应  用:   功能1：鬼怪盛宴活动
--          珊瑚群岛，阳光雨林将会出现大规模的万圣节活动怪，玩家可以通过击杀活动怪物获得"灵魂珠"。
--          灵魂珠作用：参与 时空隧道活动，南瓜车巡礼活动，在万圣狂欢大使处兑换奖励
--          功能2：万圣狂欢大使处兑换到 猫脸面具[女装]  狂欢面具[男装]
----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
--定义区
----------------------------------------------------------------------------------------------------------------------------------------
--全局万圣节活动时间区:(2012/10/31-2012/11/11)
 tHalloweenStartTime_HL = {Year = 2012,Month = 10,Day = 23,Hour = 0 ,Minute = 0 ,Second = 0 }
 tHalloweenEndTime_HL   = {Year = 2012,Month = 11,Day = 11,Hour = 23,Minute = 59,Second = 59}
--万圣节每天野外刷怪时间段：12：00-13：00  19：00-20：00（此表没用）
local tHalloween_DayStart = 
	{
		[1]={Hour = 12,Minute = 0,Second = 0};
		[2]={Hour = 19,Minute = 0,Second = 0};
	} 
local tHalloween_DayEnd =   
	{
		[1]={Hour = 13,Minute = 0,Second = 0};
		[2]={Hour = 20,Minute = 0,Second = 0};
	}
--活动广播时间
--活动地图：{珊瑚群岛，阳光雨林}10,23
local tHalloween_MapList = {10,23}
--怪物{怪物标志，怪物ID}
local tWanShengJie_ZhuanHuan = {   
    [10] = {1,730024},
    [23] = {1,730024},
}
--怪物类型的刷新频率
local tWanShengJie_PinLv = {        
   [1] = {least = 50 ,most = 200},
   [2] = {least = 50 ,most = 200},
}
--怪物掉落奖励
local tWanShengJie_YeWaiGoodsID = {           
    [1] = {
	        [1] = {GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0 },--经验兑换券
	        [2] = {GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0 },
	        [3] = {GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0 },
		[4] = {GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0 },
		[5] = {GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0 },
		[6] = {GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0 },
		[7] = {GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0 },--水晶币兑换券
		[8] = {GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0 },
		[9] = {GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0 },
		[10] = {GoodsID=80696,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		[11] = {GoodsID=89193,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},--灵魂珠
		[12] = {GoodsID=89193,GoodsNum=1,Flag=0,GaiLv=500000 ,PinZhi=0},
		[13] = {GoodsID=89193,GoodsNum=1,Flag=0,GaiLv=300000 ,PinZhi=0},
	   },

    [2] = {
	        [1] = {GoodsID=80498,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0 },--经验兑换券
	        
	   }
}

--万圣节活动总触发器
if HalloweenTimeFuncID == nil then 
	HalloweenTimeFuncID = 0
end
--存放每张地图怪临时ID
if Halloween_YeWaiGuaiIDlist == nil then   
   Halloween_YeWaiGuaiIDlist = {}
end
--是否刷过野外怪物的标志
if tWanShengJie_YeWaiShuaGuo == nil then   
   tWanShengJie_YeWaiShuaGuo = 0
end
--NPC兑换定义
local nLinHunZhuID =89193--灵魂珠
local nDuiHuanNum  =500
local nNpcID    = 12382 --npcID
--联邦TILE坐标
local nLBNpcID_X = 122     
local nLBNpcID_Y = 327
--帝国TILE坐标
local nDGNpcID_X = 123
local nDGNpcID_Y = 333

local nmaolianID   =  10984--猫脸面具【女装】
local nkuanghuanID =  10985--狂欢面具【男装】
-----------------------------------------------------------------------------------------------------------------------------------------
--逻辑区
-----------------------------------------------------------------------------------------------------------------------------------------
--灵魂珠兑换功能
--创建NPC
if API_GetServerID() == 1 or API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 6 or API_GetServerID() == 7 or API_GetServerID() == 10 then
	if HalloweenLoadingTimeTriggerGIDSofie ~= nil then
		API_DestroyTriggerG(HalloweenLoadingTimeTriggerGIDSofie)
	end
	HalloweenLoadingTimeTriggerGIDSofie = API_CreateTimerTriggerG(0,0,60,1,'HL_HalloweenServerOpen')
end

function HL_HalloweenServerOpen(Param1,Param2)
	if API_GetServerID() == 1 or API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 6 or API_GetServerID() == 7 or API_GetServerID() == 10 then
		local StartTimeTable = tHalloweenStartTime_HL
		local EndTimeTable = tHalloweenEndTime_HL
		local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
		local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
		if nShiFouStart > 0 then
			--活动未开始
			HalloweenFuShen_DestroyNPC2012()
			if Halloween_StartDateTimeTriggerGID2012 == nil then
				Halloween_StartDateTimeTriggerGID2012 = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'HalloweenFuShen_CreateNPC2012')
			else
				API_DestroyTriggerG(NewYearHuoDong_StartDateTimeTriggerGID2012)
				Halloween_StartDateTimeTriggerGID2012 = API_CreateDateTimeTriggerG(0,0,StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second,'HalloweenFuShen_CreateNPC2012')
			end
			if Halloween_EndDateTimeTriggerGID2012 ~= nil then
				API_DestroyTriggerG(Halloween_EndDateTimeTriggerGID2012)
			end
			--API_Trace('活动未开始=')
		elseif nShiFouStart <= 0 and nShiFouEnd > 0 then
			--活动开始
			HalloweenFuShen_CreateNPC2012()
			if Halloween_StartDateTimeTriggerGID2012 ~= nil then
				API_DestroyTriggerG(Halloween_StartDateTimeTriggerGID2012)
			end
			--API_Trace('活动开始=')
		elseif nShiFouEnd <= 0 then
			--活动结束
			HalloweenFuShen_DestroyNPC2012()
			if Halloween_StartDateTimeTriggerGID2012 ~= nil then
				API_DestroyTriggerG(Halloween_StartDateTimeTriggerGID2012)
			end
			if Halloween_EndDateTimeTriggerGID2012 ~= nil then
				API_DestroyTriggerG(Halloween_EndDateTimeTriggerGID2012)
			end
			--API_Trace('活动结束=')
		end
	end
end
function HalloweenFuShen_CreateNPC2012()
	--创建帝国活动npc
	if API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
		if FuShen_DGNPCFastID1sofiewsj == nil then
			FuShen_DGNPCFastID1sofiewsj = API_CreateMonsterEx(23,nNpcID,nDGNpcID_X,nDGNpcID_Y,4,0,-1,1)
		else
			if API_GetMonsterID(FuShen_DGNPCFastID1sofiewsj) > 0 then
				API_DestroyMonster(FuShen_DGNPCFastID1sofiewsj)
			end
			FuShen_DGNPCFastID1sofiewsj = API_CreateMonsterEx(23,nNpcID,nDGNpcID_X,nDGNpcID_Y,4,0,-1,1)
		end
		--API_Trace('创建帝国活动npc='..nNpcID)
	end
	--创建联邦活动npc
	if  API_GetServerID() == 2 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
		if FuShen_LBNPCFastID1sofiewsj == nil then
			FuShen_LBNPCFastID1sofiewsj = API_CreateMonsterEx(10,nNpcID,nLBNpcID_X,nLBNpcID_Y,4,0,-1,1)
		else
			if API_GetMonsterID(FuShen_LBNPCFastID1sofiewsj) > 0 then
				API_DestroyMonster(FuShen_LBNPCFastID1sofiewsj)
			end
			FuShen_LBNPCFastID1sofiewsj = API_CreateMonsterEx(10,nNpcID,nLBNpcID_X,nLBNpcID_Y,4,0,-1,1)
		end
		--API_Trace('创建联邦活动npc='..nNpcID)
	end
	
	local StartTimeTable = tHalloweenStartTime_HL
	local EndTimeTable = tHalloweenEndTime_HL
	--创结束触发器
	if Halloween_EndDateTimeTriggerGIDSOFIE == nil then
		Halloween_EndDateTimeTriggerGIDSOFIE = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'HalloweenFuShen_DestroyNPC2012')
	else
		API_DestroyTriggerG(Halloween_EndDateTimeTriggerGIDSOFIE)
		Halloween_EndDateTimeTriggerGIDSOFIE = API_CreateDateTimeTriggerG(0,0,EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second,'HalloweenFuShen_DestroyNPC2012')
	end
end

function HalloweenFuShen_DestroyNPC2012()
	--删除帝国活动npc
	if FuShen_DGNPCFastID1sofiewsj ~= nil then
		if API_GetMonsterID(FuShen_DGNPCFastID1sofiewsj) > 0 then
			API_DestroyMonster(FuShen_DGNPCFastID1sofiewsj)
		end
	end
	--删除联邦活动npc
	if FuShen_LBNPCFastID1sofiewsj ~= nil then
		if API_GetMonsterID(FuShen_LBNPCFastID1sofiewsj) > 0 then
			API_DestroyMonster(FuShen_LBNPCFastID1sofiewsj)
		end
	end
end

--点击NPC
function HL_HalloweenChange(ActorID, NPCID,XuanZe,Num)
	
	local ActorID = ActorID or API_RequestGetActorID()
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,12382)
	
	local XuanZe = XuanZe or API_RequestGetNumber(1)
	API_ResponseWrite('<name>万圣节狂欢大使</name>')
	--API_Trace('万圣节狂欢大使'..NPCID)
	API_ResponseWrite('<text>	     亲爱的玩家您好，我是万圣节狂欢大使，在这里您可以通过【灵魂珠</text>')
	API_ResponseWrite('<img srcgd="'..nLinHunZhuID..'" tipgd="'..nLinHunZhuID..'" >')
	API_ResponseWrite('<text>】兑换到商城出售的面具噢。（兑换时间：2012/10/31-2012/11/11）提示：每天12:00-13:00或19:00-20:00，在阳光，珊瑚地图出现万圣节怪物，击败它你将获得“灵魂珠”。</text>')		
	API_ResponseWrite('<br><br><br><text> 兑换条件        兑换奖励	 </text>')
	API_ResponseWrite('<br><br><text> 灵魂珠*200    </text>')
	API_ResponseWrite('<a href="HL_HalloweenChangeTwo?1=1&4='..NPCID..'">兑换猫脸面具【女装】</a><br>')
	API_ResponseWrite('<br><text> 灵魂珠*200    </text>')
	API_ResponseWrite('<a href="HL_HalloweenChangeTwo?1=2&4='..NPCID..'">兑换狂欢面具【男装】</a><br>')
	API_ResponseWrite('<br><br><a> 确定</a>')
	API_ResponseFlush(ActorID)
end

function HL_HalloweenChangeTwo()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local NPCID = API_RequestGetNumber(4)
	--判断玩家身上灵魂珠的物品数量
	if SelectItem == 1 then
		if API_ActorGetGoodsNum(ActorID,nLinHunZhuID) < 200 then
			API_ResponseWrite('<text>您背包中灵魂珠</text>')
			API_ResponseWrite('<img srcgd="'..nLinHunZhuID..'" tipgd="'..nLinHunZhuID..'" >')
			API_ResponseWrite('<text>不足200个,不符合兑换条件。</text>')
			API_ResponseWrite('<br><br><br><a>确定</a>')
		else
			if API_ActorCanAddGoods(ActorID,nmaolianID,1,1,0) ~= -1 then
				if API_ActorRemoveGoods(ActorID,nLinHunZhuID,200,"万圣节狂欢大使删除") then
					API_AddActorGoodsFlag(ActorID, nmaolianID, 1, 0, '万圣节狂欢大使兑换')
					API_ActorSendMsg(ActorID,7,'使用200个'..API_GetGoodsName(nLinHunZhuID)..'兑换了：猫脸面具【女装】')
					API_ResponseWrite('<name>万圣节狂欢大使</name>')
					API_ResponseWrite('<text>兑换获得：</text><img srcgd="'..nmaolianID..'" tipgd="'..nmaolianID..'" ><text>  × 1</text><br><br>')
					API_ResponseWrite('<br><a href="HL_HalloweenChange">  返回</a>')
				end
			else
				API_ResponseWrite('<text>背包空间不足，无法兑换。</text><br>')
				API_ResponseWrite('<br><a href="HL_HalloweenChange">  返回</a>')
			end
		end
	elseif SelectItem == 2 then
		if API_ActorGetGoodsNum(ActorID,nLinHunZhuID) < 200 then
			API_ResponseWrite('<text>您背包中灵魂珠</text>')
			API_ResponseWrite('<img srcgd="'..nLinHunZhuID..'" tipgd="'..nLinHunZhuID..'" >')
			API_ResponseWrite('<text>不足200个,不符合兑换条件。</text>')
			API_ResponseWrite('<br><br><br><a>确定</a>')
		else
			if API_ActorCanAddGoods(ActorID,nkuanghuanID,1,1,0) ~= -1 then
				if API_ActorRemoveGoods(ActorID,nLinHunZhuID,200,"万圣节狂欢大使删除") then
					API_AddActorGoodsFlag(ActorID, nkuanghuanID, 1, 0, '万圣节狂欢大使兑换')
					API_ActorSendMsg(ActorID,7,'使用200个'..API_GetGoodsName(nLinHunZhuID)..'兑换了：狂欢面具【男装】')
					API_ResponseWrite('<name>万圣节狂欢大使</name>')
					API_ResponseWrite('<text>兑换获得：</text><img srcgd="'..nkuanghuanID..'" tipgd="'..nkuanghuanID..'" ><text>  × 1</text><br><br>')
					API_ResponseWrite('<br><a href="HL_HalloweenChange">  返回</a>')
				end
			else
				API_ResponseWrite('<text>背包空间不足，无法兑换。</text><br>')
				API_ResponseWrite('<br><a href="HL_HalloweenChange">  返回</a>')
			end
		end
	end
	API_ResponseFlush(ActorID)
end
--------------------------------------------------------------------------------------------------------------------------------------------------
--鬼怪盛宴活动
--------------------------------------------------------------------------------------------------------------------------------------------------
--时间触发器 （触发时间）
if API_GetServerID() <11 then
	local nShiFouStart = API_DiffDatatime(tHalloweenStartTime_HL.Year,tHalloweenStartTime_HL.Month,tHalloweenStartTime_HL.Day,tHalloweenStartTime_HL.Hour,tHalloweenStartTime_HL.Minute,tHalloweenStartTime_HL.Second)
	local nShiFouEnd = API_DiffDatatime(tHalloweenEndTime_HL.Year,tHalloweenEndTime_HL.Month,tHalloweenEndTime_HL.Day,tHalloweenEndTime_HL.Hour,tHalloweenEndTime_HL.Minute,tHalloweenEndTime_HL.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if HalloweenTimeFuncID ~= nil then
			API_DestroyTriggerG(HalloweenTimeFuncID)
			HalloweenTimeFuncID = API_CreateTimerTriggerG(0,0,60,-1,'Halloween_HLTimeFunc')
			--API_Trace('万圣节狂欢大使时间触发回调1')
		else
			--120S回调一次
			HalloweenTimeFuncID = API_CreateTimerTriggerG(0,0,60,-1,'Halloween_HLTimeFunc')
			--API_Trace('万圣节狂欢大使时间触发回调2')
		end
		
	end
end

--触发器回调函数（怪物创建）
function Halloween_HLTimeFunc()
	
    if API_GetServerID() <11 then
	--活动时间点判断
     local StartTimeTable = tHalloweenStartTime_HL
     local EndTimeTable = tHalloweenEndTime_HL
     local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
     local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
     if nShiFouStart <= 0 and nShiFouEnd > 0 then
	--在活动时间内12：00-13：00  19：00-20：00
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ntimebiaozhi = 0 
	if Hour == 12 or Hour == 19 then
		ntimebiaozhi = 1
	end
	if  ntimebiaozhi == 1 then
		--在正确的地图内
		--API_Trace('在正确的地图内创建怪物')
	        for i,v in tHalloween_MapList do
	        	local RightMapID = API_GetRightMapID(v)
	        	if API_MapIsValid(RightMapID) then
	        		--根据当前地图人数刷怪数量
	        		local PlayNum = 50
				local PlayList = API_GetActorInArea(RightMapID,0,0,0,0,0)
				if PlayList ~= nil then
					PlayNum = table.getn(PlayList)
				end
				local MID = tWanShengJie_ZhuanHuan[v][1]
				local WanShengJieShua = 0
				if PlayNum <= 50 then
					WanShengJieShua = tWanShengJie_PinLv[MID].least
				else
					local Number = PlayNum - 50
					if PlayNum > 50 and PlayNum <= 200 then
					   	WanShengJieShua = Number + tWanShengJie_PinLv[MID].least
					elseif PlayNum > 200 then
					  	WanShengJieShua = tWanShengJie_PinLv[MID].most
					end
				end
				if Halloween_YeWaiGuaiIDlist[RightMapID] == nil then
					Halloween_YeWaiGuaiIDlist[RightMapID] = {}
				end
				
				--真正开始获取地图大小随机创建怪物
				for j = 1,WanShengJieShua do
					local YeWaiFastID = Halloween_YeWaiGuaiIDlist[RightMapID][j]
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
							local MonsterID = tWanShengJie_ZhuanHuan[v][2]
							local YeWaiFastID = API_CreateMonster(RightMapID,MonsterID,TileX,TileY,0,0,-1)
							--野外怪物死亡回调函数
							local bb = API_CreateDieTriggerG(0,0,0,YeWaiFastID,'Halloween_YeWaiDieFunc') 
							Halloween_YeWaiGuaiIDlist[RightMapID][j] = YeWaiFastID
						end
					end
				end
				tWanShengJie_YeWaiShuaGuo = 1
	        	end
	        end
	else
	--不在活动时间内
		if tWanShengJie_YeWaiShuaGuo == 1 then
			tWanShengJie_YeWaiShuaGuo = 0
			for i in Halloween_YeWaiGuaiIDlist do
				for j,v in Halloween_YeWaiGuaiIDlist[i] do
					if API_GetMonsterID(v) > 0 then
						API_DestroyMonster(v)
					end
				end
			end
			Halloween_YeWaiGuaiIDlist = {}
		 end
	end
	--活动开始广播
	if Hour == 11 and  Minute >= 58 and Minute <= 59 then
		--API_Trace('活动开始广播1')
		if API_GetServerID() == 1 then
			API_ActorBroadcastMsgEx(-1, -1, 0, 1 , '鬼怪盛宴活动：12：00-13：00将在珊瑚群岛和阳光雨林展开。')
			API_ActorBroadcastMsgEx(-1, -1, 0, 7 , '鬼怪盛宴活动：12：00-13：00将在珊瑚群岛和阳光雨林展开。')
			API_ActorBroadcastMsgEx(-1, -1, 0, 17, '鬼怪盛宴活动：12：00-13：00将在珊瑚群岛和阳光雨林展开。')
		end
	elseif Hour == 18 and  Minute >= 58 and Minute <= 59 then
		--API_Trace('活动开始广播2')
		if API_GetServerID() == 1 then
			API_ActorBroadcastMsgEx(-1, -1, 0, 1 , '鬼怪盛宴活动：19：00-20：00将在珊瑚群岛和阳光雨林展开。')
			API_ActorBroadcastMsgEx(-1, -1, 0, 7 , '鬼怪盛宴活动：19：00-20：00将在珊瑚群岛和阳光雨林展开。')
			API_ActorBroadcastMsgEx(-1, -1, 0, 17, '鬼怪盛宴活动：19：00-20：00将在珊瑚群岛和阳光雨林展开。')
		end
	--活动中系统播报
	elseif (Hour == 12 or Hour == 19) and (Minute == 15 or Minutet == 30 or Minutet == 45) then
		--API_Trace('活动开始广播3')
		if API_GetServerID() == 1 then
			API_ActorBroadcastMsgEx(-1, -1, 0, 1 , '鬼怪盛宴活动正在在珊瑚群岛和阳光雨林展开。')
			API_ActorBroadcastMsgEx(-1, -1, 0, 7 , '鬼怪盛宴活动正在在珊瑚群岛和阳光雨林展开。')
			API_ActorBroadcastMsgEx(-1, -1, 0, 17, '鬼怪盛宴活动正在在珊瑚群岛和阳光雨林展开。')
		end
	end
    end
  end
end

--怪物死亡回调函数（怪物掉落）
function Halloween_YeWaiDieFunc (MapID,ActorID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
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
	local GoodTable = tWanShengJie_YeWaiGoodsID
	for j in GoodTable do
		if j == tWanShengJie_ZhuanHuan[MapConfigID][1]  then
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
end