-------------------------------
--文件名:	Scp\Lua\Act\LC_YeYingShanGuHuoDong.lua
--版  权:	深圳腾讯计算机系统有限公司
--创建人:	刘操
--日  期:	2012-11-6
--版  本:	
--描  述:   夜莺山谷活动
--应  用:  
-------------------------------


local YeYingShanGu_MapInfo = {
[1] = {
		NPC = {
				{NPCID = 12388,TileX = 171,TileY = 529,Direct = 3,AIInfoID = nil,Camp = nil,},
				{NPCID = 12364,TileX = 163,TileY = 505,Direct = 3,AIInfoID = nil,Camp = nil,},
				{NPCID = 12391,TileX = 163,TileY = 508,Direct = 3,AIInfoID = nil,Camp = nil,},
				{NPCID = 12389,TileX = 154,TileY = 497,Direct = 3,AIInfoID = nil,Camp = nil,},
				{NPCID = 12390,TileX = 158,TileY = 499,Direct = 3,AIInfoID = nil,Camp = nil,},
--				{NPCID = {12057,12057},TileX = 163,TileY = 513,Direct = 3,AIInfoID = nil,Camp = nil,},
				{NPCID = {970001,970002},TileX = 232,TileY = 507,Direct = 3,AIInfoID = nil,Camp = nil,},
				{NPCID = {970001,970002},TileX = 232,TileY = 495,Direct = 3,AIInfoID = nil,Camp = nil,},
				{NPCID = {970001,970002},TileX = 192,TileY = 461,Direct = 3,AIInfoID = nil,Camp = nil,},
				{NPCID = {970001,970002},TileX = 204,TileY = 461,Direct = 3,AIInfoID = nil,Camp = nil,},
			},
		}
}


if YeYingShanGu_FuBenIDlist == nil then 
   YeYingShanGu_FuBenIDlist = {}
end

if YeYingShanGu_MonsterFastID == nil then 
   YeYingShanGu_MonsterFastID = {}
end

if YeYingShanGu_JiNuGuaiIDlist == nil then 
   YeYingShanGu_JiNuGuaiIDlist = {}
end

if YeYingShanGu_CunMinIDlist == nil then 
   YeYingShanGu_CunMinIDlist = {}
end

if YeYingShanGu_DaoZeiIDlist == nil then 
   YeYingShanGu_DaoZeiIDlist = {}
end

if YeYingShanGu_DengLongIDlist == nil then 
   YeYingShanGu_DengLongIDlist = {}
end	

if YeYingShanGu_ZiYuanKuangIDlist == nil then 
   YeYingShanGu_ZiYuanKuangIDlist = {}
end	



--创建时间触发器
if API_GetServerID() == 1 then
	--创建时间触发器
	if YeYingShanGu_TimeTriggerGID ~= nil then
		API_DestroyTriggerG(YeYingShanGu_TimeTriggerGID)
		YeYingShanGu_TimeTriggerGID = API_CreateTimerTriggerG(0,0,60,-1,'YeYingShanGuBattle')
	else
		YeYingShanGu_TimeTriggerGID = API_CreateTimerTriggerG(0,0,60,-1,'YeYingShanGuBattle')
	end
end

--时间回调函数
function YeYingShanGuBattle(Param1,Param2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()	
	if Hour >= 18 and Hour < 22 then
		if  math.mod(Minute,15) == 0 and API_GetServerID() == 1 then
			API_ActorBroadcastMsg(-1,17,'现在可以前往夜莺山谷守卫战！')
			API_ActorBroadcastMsg(-1,1,'现在可以前往夜莺山谷守卫战！')
			API_ActorBroadcastMsg(-1,7,'现在可以前往夜莺山谷守卫战！')
		end
	end
end

--对话函数
function YeYingShanGuShouHuZhe(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour >= 18 and Hour < 22 then
		API_ResponseWrite('<name>夜莺山谷守护者</name>')
		API_ResponseWrite('<text>    夜莺山谷正在遭受机奴族的入侵，我需要强大的佣兵团帮助我度过难关。如果能够帮助我们击退机奴族的进攻，你将会获得夜莺山谷最高的荣誉。</text><br>')
		API_ResponseWrite('<br><a href="ShouHuZhe_Title?1=100">佣兵团报名</a><br>')
		API_ResponseWrite('<br><a href="ShouHuZhe_Title?1=200">进入夜莺山谷</a><br>')
		API_ResponseFlush(ActorID)
	else
		API_ResponseWrite('<name>夜莺山谷守护者</name>')
		API_ResponseWrite('<text>    夜莺山谷正在遭受机奴族的入侵，我需要强大的佣兵团帮助我度过难关。如果能够帮助我们击退机奴族的进攻，你将会获得夜莺山谷最高的荣誉。(夜莺山谷开放时间每日18：00至22：00)</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
	end
	return 1
end	


--守护者对话判断
function ShouHuZhe_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local ConsortiaID = API_GetConsortiaId(ActorID)
	if SelectItem == 100 then
		local BingTuanMoney = API_ConGetNumInfo(ConsortiaID,5)
		local TuanZhangID = API_ConGetNumInfo(ConsortiaID,4)
		if TuanZhangID ~= ActorID then
			API_ResponseWrite('<name>夜莺山谷守护者</name>')
			API_ResponseWrite('<br><text>    你不是佣兵团团长，叫你们团长过来说话！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return
		end
		if API_ActorGetGoodsNum(ActorID,89197) < 1 then
			API_ResponseWrite('<name>夜莺山谷守护者</name>')
			API_ResponseWrite('<br><text>    你没有收到国王特令不能报名，完成每日的佣兵团人气任务可获得国王特令！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return
		end
		if BingTuanMoney < 1000000 then
			API_ResponseWrite('<name>夜莺山谷守护者</name>')
			API_ResponseWrite('<br><text>    佣兵团资金不足！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return
		end
		if YeYingShanGu_FuBenIDlist[ConsortiaID] ~= nil then
			if YeYingShanGu_FuBenIDlist[ConsortiaID].ObjectMapID ~= nil then
				local ObjectMapID = YeYingShanGu_FuBenIDlist[ConsortiaID].ObjectMapID
				if API_MapIsValid(ObjectMapID) then
					API_ResponseWrite('<name>夜莺山谷守护者</name>')
					API_ResponseWrite('<br><text>    您已经报名了夜莺山谷守护战，可以直接进入！</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)			
					return
				end
			end
		end
		if API_ActorGetGoodsNum(ActorID,89197) > 0 and API_ActorRemoveGoods(ActorID,89197,1,'扣除国王特令') then--销毁玩家身上的物品
			if API_SetConMoney(ConsortiaID,-1000000) then
				YeYingShanGu_Create(ActorID)
			end
		end
	elseif SelectItem == 200 then
		if YeYingShanGu_FuBenIDlist[ConsortiaID].ObjectMapID == nil then
			API_ResponseWrite('<name>夜莺山谷守护者</name>')
			API_ResponseWrite('<br><text>    我的名单上没有你的佣兵团，你们没有报名！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)			
			return
		else
			if not API_MapIsValid(YeYingShanGu_FuBenIDlist[ConsortiaID].ObjectMapID) then
				API_ResponseWrite('<name>夜莺山谷守护者</name>')
				API_ResponseWrite('<br><text>    让你们的团长来报名之后才能进入夜莺山谷</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)	
				return
			end
		end
		local ObjectMapID = YeYingShanGu_FuBenIDlist[ConsortiaID].ObjectMapID
		YeYingShanGu_PlayGotoMap(ActorID,ObjectMapID)
	end
end


--创建副本
function YeYingShanGu_Create(ActorID)
	local StaticMapID = 2045
	local ObjectMapID = API_CreateEctype(StaticMapID,0)	
	local ConsortiaID = API_GetConsortiaId(ActorID)
	
	if YeYingShanGu_FuBenIDlist[ConsortiaID] == nil then
		YeYingShanGu_FuBenIDlist[ConsortiaID] = {}
	end
	if YeYingShanGu_FuBenIDlist[ObjectMapID] == nil then
		YeYingShanGu_FuBenIDlist[ObjectMapID] = {}
	end
	if YeYingShanGu_MonsterFastID[ObjectMapID] == nil then
		YeYingShanGu_MonsterFastID[ObjectMapID] = {}
	end
	if YeYingShanGu_JiNuGuaiIDlist[ObjectMapID] == nil then
		YeYingShanGu_JiNuGuaiIDlist[ObjectMapID] = {}
	end
	if YeYingShanGu_CunMinIDlist[ObjectMapID] == nil then
		YeYingShanGu_CunMinIDlist[ObjectMapID] = {}
	end
	if YeYingShanGu_DaoZeiIDlist[ObjectMapID] == nil then
		YeYingShanGu_DaoZeiIDlist[ObjectMapID] = {}
	end
	if YeYingShanGu_DengLongIDlist[ObjectMapID] == nil then
		YeYingShanGu_DengLongIDlist[ObjectMapID] = {}
	end
	YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu = 0
	YeYingShanGu_FuBenIDlist[ObjectMapID].number = 0
	YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan = 0
	YeYingShanGu_FuBenIDlist[ObjectMapID].Time = 0
	YeYingShanGu_FuBenIDlist[ObjectMapID].Die = 0
	YeYingShanGu_FuBenIDlist[ObjectMapID].CloseTime = 300
	YeYingShanGu_FuBenIDlist[ObjectMapID].suspend = 0
	YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime = 120
	YeYingShanGu_FuBenIDlist[ObjectMapID].ZiYuanNum = 0
	YeYingShanGu_FuBenIDlist[ObjectMapID].JiShaNum = 0
	YeYingShanGu_FuBenIDlist[ObjectMapID].SiWangNum = 0
	YeYingShanGu_FuBenIDlist[ObjectMapID].DaTiNum = 0
	YeYingShanGu_FuBenIDlist[ObjectMapID].Win = 1
	
	YeYingShanGu_FuBenIDlist[ConsortiaID].ObjectMapID = ObjectMapID
	API_ConSendMsg(ConsortiaID,'团长已报名夜莺山谷守卫战，请团员们立刻前往夜莺山谷支援！')
	
	local CitadelTable = YeYingShanGu_MapInfo[1]
	--创建NPC
	if type(CitadelTable.NPC) == 'table' then
		for j = 1,table.getn(CitadelTable.NPC) do
			 local NPCTable = CitadelTable.NPC[j]
			 local NPCID = NPCTable.NPCID
			 if type(NPCTable.NPCID) == 'table' then
				local Camp = API_GetActorCamp(ActorID)
				if Camp == 0 then
					NPCID = NPCTable.NPCID[1]
				elseif Camp == 1 then
					NPCID = NPCTable.NPCID[2]
				end
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
	
	local Camp = API_GetActorCamp(ActorID)
	local NPCID = 0
	if Camp == 0 then
		NPCID = 968001
	elseif Camp == 1 then
		NPCID = 969001
	end
	local FastID = API_CreateMonster(ObjectMapID,NPCID,173,492,3,0,-1)
	API_CreateDieTriggerG(ObjectMapID,ConsortiaID,0,FastID,'YeYingShanGu_DieFunc')
	
	YeYingShanGu_PlayGotoMap(ActorID,ObjectMapID)
	
	--创建时间触发器
	local TimeTriggerGID = API_CreateTimerTriggerG(ObjectMapID,ActorID,10,-1,'YeYingShanGuMain_TimerTriggerCallFunc')
	YeYingShanGu_FuBenIDlist[ObjectMapID].TimeTriggerGID = TimeTriggerGID
	
	--风向标
	local LaiYuan = API_ActorGetPropNum(ActorID,201)
	if GLOBAL_FengXiangBiao_DateList[78][1][LaiYuan] == nil then
		GLOBAL_FengXiangBiao_DateList[78][1][LaiYuan] = 1
	else
		GLOBAL_FengXiangBiao_DateList[78][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[78][1][LaiYuan] + 1
	end	
end

--传送玩家进战场
function YeYingShanGu_PlayGotoMap(ActorID,ObjectMapID)
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	local ConsortiaID = API_GetConsortiaId(ActorID)
	local ObjectMapID = YeYingShanGu_FuBenIDlist[ConsortiaID].ObjectMapID
	API_ActorGoToMap(ActorID,ObjectMapID,196,478)
end

--怪物表
local YeYingShanGu_Monster = {
	[1]={name='机奴嗜血者',MonsterID = {960045,960050,960055,960060,960065}},
	[2]={name='机奴敢死队',MonsterID = {961045,961050,961055,961060,961065}},
	[3]={name='黑暗巫师',MonsterID = {962045,962050,962055,962060,962065}},
	[4]={name='机奴攻城车',MonsterID = {963045,963050,963055,963060,963065}},
}


--小boss表
local YeYingShanGu_SmallBoss = {
[1] = {964045,964046},
[2] = {965050,965051},
[3] = {966055,966056},
[4] = {966060,966061},
[5] = {967064,967065},
}

--移动参数
local YeYingShanGu_LuJing ={
	[1] = {
		TileX = 235,
		TileY = 295,
		PosNum = 6,
		lujing = {235,295,0,227,414,0,211,431,0,199,452,0,195,476,0,173,492,0},
		},
	[2] = {
		TileX = 278,
		TileY = 482,
		PosNum = 6,
		lujing = {278,482,0,260,491,0,238,500,0,208,500,0,184,500,0,173,492,0},
		},
	[3] = {
		TileX = 224,
		TileY = 469,
		PosNum = 4,
		lujing = {224,469,0,202,479,0,186,487,0,173,492,0},
		},
	[4] = {
		TileX = 165,
		TileY = 467,
		PosNum = 3,
		lujing = {165,467,0,162,481,0,173,492,0},
		},
	[5] = {
		TileX = 173,
		TileY = 492,
		PosNum = 11,
		lujing = {173,492,0,184,500,0,208,500,0,238,500,0,265,502,0,266,523,0,258,533,0,248,556,0,246,567,0,249,584,0,261,593,0},
		},
}


local JiaQiangBuff = {2098002,2098001,2098003,2098004}

local ShiQiGoodsID = {11144,11155,11166,11177,11188,11199,11210,11221,11232}

--副本刷怪时间回调
function YeYingShanGuMain_TimerTriggerCallFunc(ObjectMapID,ActorID)
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	local ConsortiaID = API_GetConsortiaId(ActorID)
	YeYingShanGu_FuBenIDlist[ObjectMapID].ShengYuNum = 0
	for i = 1,table.getn(YeYingShanGu_MonsterFastID[ObjectMapID]) do
	    MonsterID = API_GetMonsterID(YeYingShanGu_MonsterFastID[ObjectMapID][i])
		if MonsterID > 0 then
			YeYingShanGu_FuBenIDlist[ObjectMapID].ShengYuNum  = YeYingShanGu_FuBenIDlist[ObjectMapID].ShengYuNum + 1
		end
	end 
	YeYingShanGu_FuBenIDlist[ObjectMapID].Time = YeYingShanGu_FuBenIDlist[ObjectMapID].Time + 10
	local ShenYuTime = 100 - YeYingShanGu_FuBenIDlist[ObjectMapID].Time 
	if ShenYuTime > 0 then
		API_ActorBroadcastMsg(ObjectMapID,1,'机奴族将在'..ShenYuTime..'秒后开始大举进攻')
		return
	end
	
	
	--刷资源矿
	if YeYingShanGu_ZiYuanKuangIDlist[ObjectMapID] == nil then
		YeYingShanGu_ZiYuanKuangIDlist[ObjectMapID] = {}
	end
	
	for j = 1,10 do
		local ZiYuanKuangUID =  YeYingShanGu_ZiYuanKuangIDlist[ObjectMapID][j]
		if ZiYuanKuangUID == nil or not API_IsExistByUIDEx(ZiYuanKuangUID) then
			local TileX = 0
			local TileY = 0
			local Num = 0
			repeat
			Num = Num + 1
			TileX = math.random(431,536)
			TileY = math.random(466,490)
			until not API_IsBlockTile(ObjectMapID,TileX,TileY,0) or Num == 100
			if not API_IsBlockTile(ObjectMapID,TileX,TileY,0) then
				local ZiYuanKuangUID =  API_CreateResBoxEx_UID(ObjectMapID,TileX,TileY,287,3,'聚能水晶',3,0,0,0,0)
				YeYingShanGu_ZiYuanKuangIDlist[ObjectMapID][j] = ZiYuanKuangUID
			end
		end
	end
	
	if YeYingShanGu_FuBenIDlist[ObjectMapID].ShengYuNum == 0 then
		if YeYingShanGu_FuBenIDlist[ObjectMapID].suspend == 0 then
			if YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu < 5 and YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu > 0 then
				if math.mod(YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan,2) == 1 then
					YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan = YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan + 1
					YeYingShanGu_FuBenIDlist[ObjectMapID].suspend = 1
					local TimeTriggerGID = API_CreateTimerTriggerG(ObjectMapID,ActorID,1,180,'YeYingShanGu_TeShuShiJian')
					YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTimeTriggerGID = TimeTriggerGID
					
					if YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 2 then
						YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime = 60
						API_ActorBroadcastMsg(ObjectMapID,1,'去魔力花园采集聚能水晶交给民政官，完成任务可获得士气装备奖励')
						API_ActorBroadcastMsg(ObjectMapID,7,'去魔力花园采集聚能水晶交给民政官，完成任务可获得士气装备奖励')
						API_ActorBroadcastMsg(ObjectMapID,17,'去魔力花园采集聚能水晶交给民政官，完成任务可获得士气装备奖励')
					elseif YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 4 then
						YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime = 180
						API_ActorBroadcastMsg(ObjectMapID,1,'前往蝙蝠森林剿灭蝙蝠怪，完成任务可获得士气装备奖励')
						API_ActorBroadcastMsg(ObjectMapID,7,'前往蝙蝠森林剿灭蝙蝠怪，完成任务可获得士气装备奖励')
						API_ActorBroadcastMsg(ObjectMapID,17,'前往蝙蝠森林剿灭蝙蝠怪，完成任务可获得士气装备奖励')
					elseif YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 6 then
						YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime = 100
						local Camp = API_GetActorCamp(ActorID)
						local MonsterID = 0
						if Camp == 0 then
							MonsterID = 974065
						elseif Camp == 1 then
							MonsterID = 975065
						end
						local FastID = API_CreateMonster(ObjectMapID,MonsterID,YeYingShanGu_LuJing[5].TileX,YeYingShanGu_LuJing[5].TileY,4,0,Camp) 
						API_MonsterMoveTo(FastID,YeYingShanGu_LuJing[5].PosNum,YeYingShanGu_LuJing[5].lujing,1)
						API_CreateDieTriggerG(ObjectMapID,ConsortiaID,0,FastID,'YeYingShanGu_DieFunc')
						YeYingShanGu_FuBenIDlist[ObjectMapID].QingBaoGuanID = FastID
						API_ActorBroadcastMsg(ObjectMapID,1,'护送情报官前往巨石阵，完成任务可获得士气装备奖励！')
						API_ActorBroadcastMsg(ObjectMapID,7,'护送情报官前往巨石阵，完成任务可获得士气装备奖励！')
						API_ActorBroadcastMsg(ObjectMapID,17,'护送情报官前往巨石阵，完成任务可获得士气装备奖励！')
					elseif YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 8 then
						YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime = 60
						API_ActorBroadcastMsg(ObjectMapID,1,'战旗问答时间，完成任务可获得士气装备奖励！')
						API_ActorBroadcastMsg(ObjectMapID,7,'战旗问答时间，完成任务可获得士气装备奖励！')
						API_ActorBroadcastMsg(ObjectMapID,17,'战旗问答时间，完成任务可获得士气装备奖励！')
					end
				end
			end
		end
		if YeYingShanGu_FuBenIDlist[ObjectMapID].suspend == 0 then
			if math.mod(YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan,2) == 0 or YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 9 then
				if YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu == 5 then
					API_ActorBroadcastMsg(ObjectMapID,1,'机奴入侵者首领已经出现在埋骨之地，反击的时刻到来了！')
					API_ActorBroadcastMsg(ObjectMapID,7,'机奴入侵者首领已经出现在埋骨之地，反击的时刻到来了！')
					API_ActorBroadcastMsg(ObjectMapID,17,'机奴入侵者首领已经出现在埋骨之地，反击的时刻到来了！')
					API_ActorBroadcastMsg(ObjectMapID,4,'去埋骨之地击败入侵者首领')
					API_ActorCallBack(ObjectMapID, 0, -1, 'YeYingShanGu_BossBiaoShi')
					local FastID = API_CreateMonster(ObjectMapID,959060,101,429,4,0,2) 
					API_MonsterAddStatus(FastID, 2096001, 0)
					API_CreateDieTriggerG(ObjectMapID,ConsortiaID,0,FastID,'YeYingShanGu_DieFunc')
					local FastID = API_CreateMonster(ObjectMapID,959065,101,429,4,0,2) 
					API_MonsterAddStatus(FastID, 2096001, 0)
					API_CreateDieTriggerG(ObjectMapID,ConsortiaID,0,FastID,'YeYingShanGu_DieFunc')
					local TriggerID = YeYingShanGu_FuBenIDlist[ObjectMapID].TimeTriggerGID
					API_DestroyTriggerG(TriggerID)
					return
				end
				
				YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu = YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu + 1
				YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan = YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan + 1
				local JinGongLunShu = '夜莺山谷守卫战第'..YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu..'轮\n'
				if YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu <= 5 then
					API_ActorBroadcastMsg(ObjectMapID,4,JinGongLunShu)
				end
				
				for i = 1,2 do
					for m = 1,5 do
						for j = 1,table.getn(YeYingShanGu_Monster) do
							local MonsterID = YeYingShanGu_Monster[j].MonsterID[YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu] 
							local FastID = API_CreateMonster(ObjectMapID,MonsterID,YeYingShanGu_LuJing[i].TileX,YeYingShanGu_LuJing[i].TileY,4,0,2) 
							if YeYingShanGu_FuBenIDlist[ObjectMapID].Win == 0 then
								local BuffType = 1
								if YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu == 3 then
									BuffType = 2
								elseif YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu == 4 then
									BuffType = 3
								elseif YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu == 5 then
									BuffType = 4
								end
								local BuffID = JiaQiangBuff[BuffType]
								API_MonsterAddStatus(FastID, BuffID, 0)
							end
							API_MonsterMoveTo(FastID,YeYingShanGu_LuJing[i].PosNum,YeYingShanGu_LuJing[i].lujing,1)
							YeYingShanGu_FuBenIDlist[ObjectMapID].number = YeYingShanGu_FuBenIDlist[ObjectMapID].number + 1
							YeYingShanGu_MonsterFastID[ObjectMapID][YeYingShanGu_FuBenIDlist[ObjectMapID].number] = FastID
							API_CreateDieTriggerG(ObjectMapID,ConsortiaID,0,FastID,'YeYingShanGu_DieFunc')
						end
					end
				end
				for i = 1,2 do
					local MonsterID = YeYingShanGu_SmallBoss[YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu][i]
					local FastID = API_CreateMonster(ObjectMapID,MonsterID,YeYingShanGu_LuJing[i].TileX,YeYingShanGu_LuJing[i].TileY,4,0,2) 
					if YeYingShanGu_FuBenIDlist[ObjectMapID].Win == 0 then
						local BuffType = 1
						if YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu == 3 then
							BuffType = 2
						elseif YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu == 4 then
							BuffType = 3
						elseif YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu == 5 then
							BuffType = 4
						end
						local BuffID = JiaQiangBuff[BuffType]
						API_MonsterAddStatus(FastID, BuffID, 0)
					end
					API_MonsterMoveTo(FastID,YeYingShanGu_LuJing[i].PosNum,YeYingShanGu_LuJing[i].lujing,1)
					YeYingShanGu_FuBenIDlist[ObjectMapID].number = YeYingShanGu_FuBenIDlist[ObjectMapID].number + 1
					YeYingShanGu_MonsterFastID[ObjectMapID][YeYingShanGu_FuBenIDlist[ObjectMapID].number] = FastID
					API_CreateDieTriggerG(ObjectMapID,ConsortiaID,0,FastID,'YeYingShanGu_DieFunc')
				end

				API_ActorBroadcastMsg(ObjectMapID,1,'第'..PublicFun_ArabianNumberToChineseNumber(YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu)..'轮机奴入侵者即将开始大举进攻')
				YeYingShanGu_FuBenIDlist[ObjectMapID].Win = 1
				
				local Rand = math.random(10000)
				if Rand >= 8000 and YeYingShanGu_FuBenIDlist[ObjectMapID].lunshu ~= 5 then
					API_ActorBroadcastMsg(ObjectMapID,1,'偷袭！一小队机奴怪物已经潜入村庄大家小心！')
					API_ActorBroadcastMsg(ObjectMapID,7,'偷袭！一小队机奴怪物已经潜入村庄大家小心！')
					API_ActorBroadcastMsg(ObjectMapID,17,'偷袭！一小队机奴怪物已经潜入村庄大家小心！')
					local Number = math.random(3,4)
					for i = 1,6 do
						local FastID = API_CreateMonster(ObjectMapID,961045,YeYingShanGu_LuJing[Number].TileX,YeYingShanGu_LuJing[Number].TileY,4,0,2) 
						API_MonsterMoveTo(FastID,YeYingShanGu_LuJing[Number].PosNum,YeYingShanGu_LuJing[Number].lujing,1)
					end
				end
			end
		end
	end
end

local TeShuMonster = {971055,972055,973055}

--特殊事件处理
function YeYingShanGu_TeShuShiJian(ObjectMapID,ActorID)
	local ConsortiaID = API_GetConsortiaId(ActorID)
	YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime = YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime - 1
	--地图广播
	local JinGongLunShu = ''
	local TeShuShiJian = ''
	if YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 2 then
		JinGongLunShu = '资源采集剩余时间'..YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime..'秒\n'
		TeShuShiJian = '缴纳聚能水晶'..YeYingShanGu_FuBenIDlist[ObjectMapID].ZiYuanNum..'/200\n'
		JinGongLunShu = JinGongLunShu..TeShuShiJian
	elseif YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 4 then
		JinGongLunShu = '击杀剩余时间'..YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime..'秒\n'
		TeShuShiJian = '击杀蝙蝠怪'..YeYingShanGu_FuBenIDlist[ObjectMapID].JiShaNum..'/500\n'
		JinGongLunShu = JinGongLunShu..TeShuShiJian
	
		for j = 1,20 do
			local JiNuFastID = YeYingShanGu_JiNuGuaiIDlist[ObjectMapID][j]
			if JiNuFastID == nil or API_GetMonsterID(JiNuFastID) <= 0 then
				local TileX = 0
				local TileY = 0
				local Num = 0
				repeat
					Num = Num + 1
					TileX = math.random(363,407)
					TileY = math.random(389,420)
				until not API_IsBlockTile(ObjectMapID,TileX,TileY,0) or Num == 100
				if not API_IsBlockTile(ObjectMapID,TileX,TileY,0) then
					local JiNuFastID = API_CreateMonsterEx(ObjectMapID,976055,TileX,TileY,4,0,-1,1)
					YeYingShanGu_JiNuGuaiIDlist[ObjectMapID][j] = JiNuFastID
					API_CreateDieTriggerG(ObjectMapID,ConsortiaID,0,JiNuFastID,'YeYingShanGu_DieFunc')
				end
			end
		end			
	elseif YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 6 then
		JinGongLunShu = '护送情报官剩余时间'..YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime..'秒\n'

--		for j = 1,40 do
--			local JiNuFastID = YeYingShanGu_JiNuGuaiIDlist[ObjectMapID][j]
--			if JiNuFastID == nil or API_GetMonsterID(JiNuFastID) <= 0 then
--				local TileX = 0
--				local TileY = 0
--				local Num = 0
--				repeat
--					Num = Num + 1
--					TileX = math.random(237,263)
--					TileY = math.random(586,593)
--				until not API_IsBlockTile(ObjectMapID,TileX,TileY,0) or Num == 100
--				if not API_IsBlockTile(ObjectMapID,TileX,TileY,0) then
--					local JiNuFastID = API_CreateMonsterEx(ObjectMapID,971055,TileX,TileY,4,0,-1,1)
--					YeYingShanGu_JiNuGuaiIDlist[ObjectMapID][j] = JiNuFastID
--					API_CreateDieTriggerG(ObjectMapID,ConsortiaID,0,JiNuFastID,'YeYingShanGu_DieFunc')
--				end
--			end
--		end		
		if math.mod(YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime,5) == 0 then
			local QingBaoGuanID = YeYingShanGu_FuBenIDlist[ObjectMapID].QingBaoGuanID
			local TileX = API_GetMonsterPosX(QingBaoGuanID)
			local TileY = API_GetMonsterPosY(QingBaoGuanID);
			for j = 1,4 do
				local MonsterID = TeShuMonster[math.random(1,3)]
				local JiNuFastID = API_CreateMonsterEx(ObjectMapID,MonsterID,TileX,TileY,4,0,-1,1)
				API_CreateDieTriggerG(ObjectMapID,ConsortiaID,0,JiNuFastID,'YeYingShanGu_DieFunc')
			end
		end

	elseif YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 8 then
		JinGongLunShu = '答题剩余时间'..YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime..'秒\n'
		TeShuShiJian = '答对题目'..YeYingShanGu_FuBenIDlist[ObjectMapID].DaTiNum..'/50\n'
		JinGongLunShu = JinGongLunShu..TeShuShiJian
		
		for j = 1,10 do
			local DengLongFastID = YeYingShanGu_DengLongIDlist[ObjectMapID][j]
			if DengLongFastID == nil or API_GetMonsterID(DengLongFastID) <= 0 then
				local TileX = 0
				local TileY = 0
				local Num = 0
				repeat
					Num = Num + 1
					TileX = math.random(188,203)
					TileY = math.random(484,499)
				until not API_IsBlockTile(ObjectMapID,TileX,TileY,0) or Num == 100
				if not API_IsBlockTile(ObjectMapID,TileX,TileY,0) then
					local DengLongFastID = API_CreateMonsterEx(ObjectMapID,12392,TileX,TileY,4,0,-1,1)
					YeYingShanGu_DengLongIDlist[ObjectMapID][j] = DengLongFastID
				end
			end
		end	
	end
	if YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime > 0 then
		API_ActorBroadcastMsg(ObjectMapID,4,JinGongLunShu)
	else
		API_ActorBroadcastMsg(ObjectMapID,4,'')
	end	
	
	if YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTime <= 0 then
		API_DestroyTriggerG(YeYingShanGu_FuBenIDlist[ObjectMapID].TeShuTimeTriggerGID)
		YeYingShanGu_FinishCondition(ObjectMapID)
	end
end

--完成条件判断
function YeYingShanGu_FinishCondition(ObjectMapID)
	if YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 2 then
		if YeYingShanGu_FuBenIDlist[ObjectMapID].ZiYuanNum >= 200 then
			YeYingShanGu_FuBenIDlist[ObjectMapID].Win = 1
			API_ActorBroadcastMsg(ObjectMapID,1,'任务完成，民政官准备了一批士气装备给大家在英雄殿堂前的空地上！')
			API_ActorBroadcastMsg(ObjectMapID,7,'任务完成，民政官准备了一批士气装备给大家在英雄殿堂前的空地上！')
			API_ActorBroadcastMsg(ObjectMapID,17,'任务完成，民政官准备了一批士气装备给大家在英雄殿堂前的空地上！')
			for i = 1,3 do
				local GoodsID = ShiQiGoodsID[math.random(table.getn(ShiQiGoodsID))]
				API_CreateDropGoods(ObjectMapID,180,491,GoodsID,1,2,'获得极品士气装备奖励',4,0,180,60)
			end
--			API_ActorCallBack(ObjectMapID, 0, -1, 'YeYingShanGu_ShiQiJiangLi')
		else
			YeYingShanGu_FuBenIDlist[ObjectMapID].Win = 0
			API_ActorBroadcastMsg(ObjectMapID,1,'任务失败，下一轮怪物攻击防御加强！')
			API_ActorBroadcastMsg(ObjectMapID,7,'任务失败，下一轮怪物攻击防御加强！')
			API_ActorBroadcastMsg(ObjectMapID,17,'任务失败，下一轮怪物攻击防御加强！')
		end
	elseif YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 4 then
		if YeYingShanGu_FuBenIDlist[ObjectMapID].JiShaNum >= 500 then
			YeYingShanGu_FuBenIDlist[ObjectMapID].Win = 1
			API_ActorBroadcastMsg(ObjectMapID,1,'任务完成，民政官准备了一批士气装备给大家在英雄殿堂前的空地上！')
			API_ActorBroadcastMsg(ObjectMapID,7,'任务完成，民政官准备了一批士气装备给大家在英雄殿堂前的空地上！')
			API_ActorBroadcastMsg(ObjectMapID,17,'任务完成，民政官准备了一批士气装备给大家在英雄殿堂前的空地上！')
			for i = 1,3 do
				local GoodsID = ShiQiGoodsID[math.random(table.getn(ShiQiGoodsID))]
				API_CreateDropGoods(ObjectMapID,180,491,GoodsID,1,2,'获得极品士气装备奖励',4,0,180,60)
			end
--			API_ActorCallBack(ObjectMapID, 0, -1, 'YeYingShanGu_ShiQiJiangLi')
		else
			YeYingShanGu_FuBenIDlist[ObjectMapID].Win = 0
			API_ActorBroadcastMsg(ObjectMapID,1,'任务失败，下一轮怪物攻击防御加强！')
			API_ActorBroadcastMsg(ObjectMapID,7,'任务失败，下一轮怪物攻击防御加强！')
			API_ActorBroadcastMsg(ObjectMapID,17,'任务失败，下一轮怪物攻击防御加强！')
		end
	elseif YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 6 then
		local QingBaoGuanID = YeYingShanGu_FuBenIDlist[ObjectMapID].QingBaoGuanID
		if QingBaoGuanID ~= nil and API_GetMonsterID(QingBaoGuanID) > 0 then
			YeYingShanGu_FuBenIDlist[ObjectMapID].Win = 1
			API_ActorBroadcastMsg(ObjectMapID,1,'任务完成，民政官准备了一批士气装备给大家在英雄殿堂前的空地上！')
			API_ActorBroadcastMsg(ObjectMapID,7,'任务完成，民政官准备了一批士气装备给大家在英雄殿堂前的空地上！')
			API_ActorBroadcastMsg(ObjectMapID,17,'任务完成，民政官准备了一批士气装备给大家在英雄殿堂前的空地上！')
			for i = 1,3 do
				local GoodsID = ShiQiGoodsID[math.random(table.getn(ShiQiGoodsID))]
				API_CreateDropGoods(ObjectMapID,180,491,GoodsID,1,2,'获得极品士气装备奖励',4,0,180,60)
			end
--			API_ActorCallBack(ObjectMapID, 0, -1, 'YeYingShanGu_ShiQiJiangLi')
			API_DestroyMonster(QingBaoGuanID)
		else
			YeYingShanGu_FuBenIDlist[ObjectMapID].Win = 0
			API_ActorBroadcastMsg(ObjectMapID,1,'任务失败，下一轮怪物攻击防御加强！')
			API_ActorBroadcastMsg(ObjectMapID,7,'任务失败，下一轮怪物攻击防御加强！')
			API_ActorBroadcastMsg(ObjectMapID,17,'任务失败，下一轮怪物攻击防御加强！')
		end
	elseif YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 8 then
		if YeYingShanGu_FuBenIDlist[ObjectMapID].DaTiNum > 50 then
			YeYingShanGu_FuBenIDlist[ObjectMapID].Win = 1
			API_ActorBroadcastMsg(ObjectMapID,1,'任务完成，民政官准备了一批士气装备给大家在英雄殿堂前的空地上！')
			API_ActorBroadcastMsg(ObjectMapID,7,'任务完成，民政官准备了一批士气装备给大家在英雄殿堂前的空地上！')
			API_ActorBroadcastMsg(ObjectMapID,17,'任务完成，民政官准备了一批士气装备给大家在英雄殿堂前的空地上！')
			for i = 1,3 do
				local GoodsID = ShiQiGoodsID[math.random(table.getn(ShiQiGoodsID))]
				API_CreateDropGoods(ObjectMapID,180,491,GoodsID,1,2,'获得极品士气装备奖励',4,0,180,60)
			end
			for j,v in YeYingShanGu_DengLongIDlist[ObjectMapID] do
				if API_GetMonsterID(v) > 0 then
					API_DestroyMonster(v)
				end
			end
--			API_ActorCallBack(ObjectMapID, 0, -1, 'YeYingShanGu_ShiQiJiangLi')
		else
			YeYingShanGu_FuBenIDlist[ObjectMapID].Win = 0
			API_ActorBroadcastMsg(ObjectMapID,1,'任务失败，下一轮怪物攻击防御加强！')
			API_ActorBroadcastMsg(ObjectMapID,7,'任务失败，下一轮怪物攻击防御加强！')
			API_ActorBroadcastMsg(ObjectMapID,17,'任务失败，下一轮怪物攻击防御加强！')
			for j,v in YeYingShanGu_DengLongIDlist[ObjectMapID] do
				if API_GetMonsterID(v) > 0 then
					API_DestroyMonster(v)
				end
			end
		end		
	end
	YeYingShanGu_FuBenIDlist[ObjectMapID].suspend = 0
end

--民政官对话
function YeYingShanGu_MinZhengGuan(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local MapID = API_GetActorMapID(ActorID)
	
	if SelectItem == 0 then
		API_ResponseWrite('<text>将采集到的聚能水晶交给我完成任务，可以换取士气装备奖励。</text><br><br>')
		API_ResponseWrite('<a href="YeYingShanGu_MinZhengGuan?1=1">上缴聚能水晶</a><br><br>')
		API_ResponseWrite('<a>关闭</a>')
	elseif SelectItem == 1 then
--		local PlayNum = API_ActorGetGoodsNum(ActorID,89198)
		if API_RequestGetNumber(2) > 0 then
			local InputNum = API_RequestGetNumber(2)
			local GoodsNum = API_ActorGetGoodsNum(ActorID,89198)
			if GoodsNum >= InputNum then
				if API_ActorRemoveGoods(ActorID,89198,InputNum,'上缴给NPC') then
					local ObjectMapID = API_GetActorMapID(ActorID)
					local MoraleNum = InputNum * 100
	--				API_ActorSendMsg(ActorID,1,'上缴聚能水晶获得士气奖励')
	--				API_ActorAddMorale(ActorID,MoraleNum,0,'上缴聚能水晶奖励士气')
					YeYingShanGu_FuBenIDlist[ObjectMapID].ZiYuanNum = YeYingShanGu_FuBenIDlist[ObjectMapID].ZiYuanNum + InputNum
					API_ResponseWrite('<text>上缴了'..InputNum..'个聚能水晶。</text><br><br>')
					API_ResponseWrite('<a>确定</a>')
				else
					API_ActorSendMsg(ActorID,3,'您身上的聚能水晶数量不足')
				end
			else
				API_ActorSendMsg(ActorID,3,'您身上的聚能水晶数量不足')
			end
		else
			API_ResponseWrite('<text>请输入要上缴的聚能水晶数量，按确定按钮。</text><br><br>')
			API_ResponseWrite('<br><input type="number" name="2" size="4" width="60"><a href="YeYingShanGu_MinZhengGuan?1=1"> 确定</a><br>')
			API_ResponseWrite('<br><a href="YeYingShanGu_MinZhengGuan?1=2">上缴全部水晶</a><br>')		
		end
	elseif SelectItem == 2 then
		local InputNum = API_ActorGetGoodsNum(ActorID,89198)
		if InputNum > 0 then
			if API_ActorRemoveGoods(ActorID,89198,InputNum,'上缴给NPC') then
				local ObjectMapID = API_GetActorMapID(ActorID)
				local MoraleNum = InputNum * 100
				YeYingShanGu_FuBenIDlist[ObjectMapID].ZiYuanNum = YeYingShanGu_FuBenIDlist[ObjectMapID].ZiYuanNum + InputNum
				API_ResponseWrite('<text>上缴了'..InputNum..'个聚能水晶。</text><br><br>')
				API_ResponseWrite('<a>确定</a>')
			else
				API_ActorSendMsg(ActorID,3,'上缴聚能水晶失败')
			end
		else
			API_ActorSendMsg(ActorID,3,'你身上没有聚能水晶')
		end
	end
end

--boss刷新位置标识
function YeYingShanGu_BossBiaoShi(ActorID)
	API_OpenArrowDir(ActorID,101,429,10) --显示动画指示箭头
end


--boss掉落表
local BossGoodsTable = {
		{GoodsID=80498,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82031,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82031,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82031,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82031,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82031,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82030,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82030,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82030,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82030,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82030,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82030,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82030,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82030,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82030,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=82030,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80192,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80388,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=89095,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80409,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80409,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80409,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80409,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80409,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID=80410,GoodsNum=5000,Flag=0,GaiLv=1000000,PinZhi=0},
		{GoodsID={83103,83104,83105,83106,83107,83108},GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
		{GoodsID=0,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=6},
}



--三洞装备表
local EquipTable = {
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
		{GoodsID = 6602,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 6902,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 8102,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 4302,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 4202,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 4402,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 4502,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 6702,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 7002,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 8202,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 5302,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 5202,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 5402,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 5502,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 6802,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 8002,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 8302,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 6302,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 6202,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 6402,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 6502,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 4002,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 4102,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 5002,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 5102,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 6002,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 6102,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 2002,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 3002,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 3902,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 1502,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
		{GoodsID = 1002,Num = 1,Bind = 0,Odds = 10000,PinZhi = 6,Max = 10},
}


--死亡回调
function YeYingShanGu_DieFunc(MapID,ConsortiaID,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if MapID <= 0 then
		return
	end
	if not API_MapIsValid(MapID) then
		return
	end
	if MonsterID == 959060 or MonsterID == 959065 then
		YeYingShanGu_FuBenIDlist[MapID].Die  = YeYingShanGu_FuBenIDlist[MapID].Die  + 1
		if YeYingShanGu_FuBenIDlist[MapID].Die  == 2 then
						
			local DiaoLuoNum = table.getn(BossGoodsTable)
			for i = 1,DiaoLuoNum do
				local GoodsTable = BossGoodsTable[i]
				local GoodsId = GoodsTable.GoodsID
				if type(GoodsId) == 'table' then
					local Type = math.random(1,table.getn(GoodsId))
					GoodsId = GoodsId[Type]
				end
				local Num = GoodsTable.GoodsNum
				local Flag = GoodsTable.Flag
				local Odds = GoodsTable.GaiLv
				local PinZhi = GoodsTable.PinZhi
				local Rand = math.random(1000000)
				if Rand <= Odds then
					if PinZhi > 0 then
						--一半装备，一半道具
						local nTXRandNum = math.random(100)
						if nTXRandNum <= 50 then
							local Data = math.random(table.getn(EquipTable))
							local GoodsId = EquipTable[Data].GoodsID
							API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsId,Num,Flag,'掉落装备',4,KillerID,600,60,PinZhi)
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(KillerID)..'的佣兵团在夜莺山谷中击败阿塔卡斯获得了高附加属性3洞的'..API_GetGoodsName(GoodsId)..'')
							--风向标
							local LaiYuan = API_ActorGetPropNum(KillerID,201)
							if GLOBAL_FengXiangBiao_DateList[78][3][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[78][3][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[78][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[78][3][LaiYuan] + 1
							end
						else
							--掉开魂器格子的金属物品道具
							--local nJSNumber = math.random(5,10)
							API_CreateDropGoods(MapID,PosX,PosY,89199,5,0,'掉落道具',0,KillerID,600,60)
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(KillerID)..'的佣兵团在夜莺山谷中击败阿塔卡斯获得了5个'..API_GetGoodsName(89199)..'')
							
						end
						
							
					else
						API_CreateDropGoods(MapID,PosX,PosY,GoodsId,Num,Flag,'掉落物品',0,KillerID,600,60)
					end
				end
				
			end
			API_ActorBroadcastMsg(MapID,1,'夜莺山谷保卫战获胜')
			API_ActorBroadcastMsg(MapID,7,'夜莺山谷保卫战获胜')
			API_ActorBroadcastMsg(MapID,17,'夜莺山谷保卫战获胜')
			API_ActorBroadcastMsg(MapID,4,'')
			YeYingShanGu_FuBenIDlist[ConsortiaID].ObjectMapID = nil
			local TimeTriggerGID = API_CreateTimerTriggerG(MapID,0,1,300,'YeYingShanGu_GetOutPlayFunc')
			YeYingShanGu_FuBenIDlist[MapID].DaoJiShi = TimeTriggerGID
			--风向标
			local LaiYuan = API_ActorGetPropNum(KillerID,201)
			if GLOBAL_FengXiangBiao_DateList[78][2][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[78][2][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[78][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[78][2][LaiYuan] + 1
			end	
		end
	elseif MonsterID == 968001 or MonsterID == 969001 then
		local TriggerID = YeYingShanGu_FuBenIDlist[MapID].TimeTriggerGID
		API_DestroyTriggerG(TriggerID)
		API_ActorBroadcastMsg(MapID,1,'夜莺山谷保卫战失败')
		API_ActorBroadcastMsg(MapID,7,'夜莺山谷保卫战失败')
		API_ActorBroadcastMsg(MapID,17,'夜莺山谷保卫战失败')
		API_ActorBroadcastMsg(MapID,4,'')
		YeYingShanGu_FuBenIDlist[ConsortiaID].ObjectMapID = nil
		local TimeTriggerGID = API_CreateTimerTriggerG(MapID,0,1,300,'YeYingShanGu_GetOutPlayFunc')
		YeYingShanGu_FuBenIDlist[MapID].DaoJiShi = TimeTriggerGID
	elseif MonsterID == 976055 then
		YeYingShanGu_FuBenIDlist[MapID].JiShaNum = YeYingShanGu_FuBenIDlist[MapID].JiShaNum + 1
	elseif MonsterID == 974065 or  MonsterID == 974065 then
		YeYingShanGu_FuBenIDlist[MapID].SiWangNum = YeYingShanGu_FuBenIDlist[MapID].SiWangNum - 1
	elseif MonsterID == 964045 or MonsterID == 964046 or MonsterID == 965050 or MonsterID == 965051 or MonsterID == 966055 or
		MonsterID == 966056 or MonsterID == 966060 or MonsterID == 966061 or MonsterID == 967064 or MonsterID == 967065 then
		local GoodsID = ShiQiGoodsID[math.random(table.getn(ShiQiGoodsID))]
		API_CreateDropGoods(MapID,PosX,PosY,GoodsID,1,2,'获得极品士气装备奖励',0,KillerID,180,60)
	end
end


--倒计时
function YeYingShanGu_GetOutPlayFunc(MapID,a)
	local CountDown = YeYingShanGu_FuBenIDlist[MapID].CloseTime
	API_ActorBroadcastMsg(MapID,1,''..CountDown..'秒后所有人将被传送出去')

	YeYingShanGu_FuBenIDlist[MapID].CloseTime = YeYingShanGu_FuBenIDlist[MapID].CloseTime - 1
	if YeYingShanGu_FuBenIDlist[MapID].CloseTime == 0 then
		local TimeTriggerGID = YeYingShanGu_FuBenIDlist[MapID].DaoJiShi
		if TimeTriggerGID ~= nil then
			API_DestroyTriggerG(TimeTriggerGID)
		end
		API_ActorCallBack(MapID, 0, -1, 'YeYingShanGu_GetOutMap')
	end
end

--夜莺山谷
function YeYingShanGu_ShiQiJiangLi(ActorID)
	local ObjectMapID = API_GetActorMapID(ActorID)
	if YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 2 then
		API_ActorAddMorale(ActorID,600,0,'士气奖励')
	elseif YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 4 then
		API_ActorAddMorale(ActorID,800,0,'士气奖励')
	elseif YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 6 then
		API_ActorAddMorale(ActorID,1000,0,'士气奖励')
	elseif YeYingShanGu_FuBenIDlist[ObjectMapID].JieDuan == 8 then
		API_ActorAddMorale(ActorID,1200,0,'士气奖励')
	end
end

--传送玩家返回后备地图
function YeYingShanGu_GetOutMap(ActorID)
	API_ActorGoToBackMap(ActorID)
end

--传送玩家返回后备地图
function YeYingShanGu_ChuanSong(ActorID,NPCID)
	API_ActorGoToBackMap(ActorID)
	local ObjectMapID = API_GetActorMapID(ActorID)
	API_ActorBroadcastMsg(ObjectMapID,4,'')
end

--------------------------------答题----------------------------------

local RiceGlueBallDengMi_QuestionList ={
[1] = {Question = '非典，非典，携手清除（打一字）'},
[2] = {Question = '姚明一溜烟 （打一体育词语）'},
[3] = {Question = '“玄德请二人到庄”（打2字古礼仪用语）'},
[4] = {Question = '遮住了花容月貌（打3字出版新词）'},
[5] = {Question = '七日速变俏姿容（打一影星名）'},
[6] = {Question = '宾客尽脱帽，洒泪来反思（打一音乐人，2字）'},
[7] = {Question = '细雨如丝正及时（打一古语称谓）'},
[8] = {Question = '玄德先来，云长未到（打一田径运动员，2字）'},
[9] = {Question = '此章节错误较少（打5字口语）'},
[10] = {Question = '元宵隔日始营业（打4字出版名词，纸张类型）'},
[11] = {Question = '战乱重圆何感叹（打9笔字）'},
[12] = {Question = '不肖遭父笞，药疗得痊愈（打二公安名词）'},
[13] = {Question = '太阳出来喜洋洋（打3字天文名词）'},
[14] = {Question = '吾与一家人，离散又重逢（打一党史人物，2字）'},
[15] = {Question = '“有连山”（打2字国际名词）'},
[16] = {Question = '娘娘懿旨：刀下留人（打7字成语）'},
[17] = {Question = '介入一部分（打2字音乐名词）'},
[18] = {Question = '“夫妻本是同林鸟”（打4字名电视剧）'},
[19] = {Question = '滚滚长江东逝水（打两个2字手机品牌）'},
[20] = {Question = '文章不写半句空（打两个2字文学名词）'},
[21] = {Question = '不要江山要美人（打两个汽车品牌）'},
[22] = {Question = '寄人篱下为糊口（打16笔字）'},
[23] = {Question = '“煌煌太宗业”（打一相声演员，3字）'},
[24] = {Question = '做事手段好精明（打一3字教育机构简称）'},
[25] = {Question = '曲意奉承不可取（打一两字港台歌星，）'},
[26] = {Question = '还是分开吧（打一2字外国名）'},
[27] = {Question = '这一章情节纯属虚构（打5字口语）'},
[28] = {Question = '弃曹会刘本为云长心愿（打《三国演义》歌词一句）'},
[29] = {Question = '高不成，低不就 　（打一金融机构名称）'},
[30] = {Question = '早穿皮袄午穿纱 （打一医学名词）'},
[31] = {Question = '大会 （打一成语）'},
[32] = {Question = '不舒服 （打一成语）'},
[33] = {Question = '人比黄花瘦 （打一农业名词）'},
[34] = {Question = '中华民族繁荣昌盛 （打一近代烈士）'},
[35] = {Question = '天下谁人不识君 （打两个我国地名）'},
[36] = {Question = '荐之于平原君（打一成语）'},
[37] = {Question = '东京北京通贸易 （打一成语）'},
[38] = {Question = '未成油团 （打一外国著名小说）'},
[39] = {Question = '卷尾猴 （打一字）'},
[40] = {Question = '贞观之治 （打一电影演员）'},
[41] = {Question = '唐代瑰宝 （打一古代科学家）'},
[42] = {Question = '儿童节放假 （打一中成药名）'},
[43] = {Question = '并非阴历初一 （打一广西地名）'},
[44] = {Question = '孟母三迁 （打一杂志名称）'},
[45] = {Question = '家中添一口 （打一字）'},
[46] = {Question = '湖光水影月当空 （打一字）'},
[47] = {Question = '百病不单由口入 （打一外国故事片）'},
[48] = {Question = '千分之一百分之一 （打一字）'},
[49] = {Question = '因 （打一谚语）'},
[50] = {Question = '甜咸苦辣各味俱备 （打一字）'},
[51] = {Question = '魏蜀相争 （打一经济名词）'},
[52] = {Question = '只公开谜目 （打两个出版名词）'},
[53] = {Question = '重点支援大西北 （打一字）'},
[54] = {Question = '到黄昏点点滴滴 （打一气象术语）'},
[55] = {Question = '座中泣下谁最多 （打两个文学名词）'},
[56] = {Question = '山中无老虎 （打两个法律名词）'},
[57] = {Question = '大胆改组 （打一鲁迅作品篇名）'},
[58] = {Question = '巧立名目 （打一字）'},
[59] = {Question = '专吃金木火 （打一医学术语）'},
[60] = {Question = '天苍苍、野—— ——（打一句白居易七言诗句）'},
[61] = {Question = '减四余二、减二余四 （打一字）'},
[62] = {Question = '遇水则清、遇火则明 （打一字）'},
[63] = {Question = '冷冷清清凄凄惨惨切切 （打一故事片）'},
[64] = {Question = '丫丫 （打一文艺名词）'},
[65] = {Question = '长安美女 （此谜用心方能猜中，打一词牌）'},
[66] = {Question = '所有的王八穿龙袍（打一电影名）'},
[67] = {Question = '凤凰台上凤凰游 （打数学名词一）'},
[68] = {Question = '为什么要控制人口 （打成语一）'},
[69] = {Question = '半价出售 （打字一）'},
[70] = {Question = '打算明年生小孩（打一电影名）'},
[71] = {Question = '拦河坝 （打字一）'},
[72] = {Question = '羊叫 （打词牌一）'},
[73] = {Question = '蟋蟀对鸣 （打《木兰辞》句一）'},
[74] = {Question = '曲 （打曹操诗句一）'},
[75] = {Question = '分 （打广告用语一）'},
[76] = {Question = '他有你没有，地有天没有 （打字一）'},
[77] = {Question = '有凤凰而没有孔雀 （打字一）'},
[78] = {Question = '鲁迅逝世一世纪（打一成语）'},
[79] = {Question = '画中不是田 （打一字）'},
[80] = {Question = '谜面空白无字 （打一字）'},
[81] = {Question = '说与旁人浑不解 ，用红笔书写（打一现代散文家）'},
[82] = {Question = '百年松柏老芭蕉（打一成语）'},
[83] = {Question = '塞外秋菊漫野金 （打三个中药名）'},
[84] = {Question = '谢绝参观 （打一常用语）'},
[85] = {Question = '夫人何处去（打一字）'},
[86] = {Question = '一人一张口，口下长只手（打一字）'},
[87] = {Question = '推开又来　（打一字）'},
[88] = {Question = '高尔基　（打一字）'},
[89] = {Question = '日近黄昏（打一中国地名）'},
[90] = {Question = '珍珠港（打一中国地名）'},
[91] = {Question = '大热天，猫，狗等都在气喘吁吁，只有羊在吃草 （打一成语）'},
[92] = {Question = '有头无颈，有眼无眉， 无脚能走，有翅难飞（打一动物）'},
[93] = {Question = '夏前它来到，秋后没处找， 摧咱快播种，年年来一遭（打一动物）'},
[94] = {Question = '前有毒夹，后有尾巴， 全身二十一节，中药铺要它（打一动物）'},
[95] = {Question = '同穿衣服同穿鞋（打一与人有关的东西）'},
[96] = {Question = '一线相通，飞行空中(打一物)'},
[97] = {Question = '一片全是草的地（打一植物名称）'},
[98] = {Question = '两对听觉器官（打一音乐家名）'},
[99] = {Question = '刽子手的嘴脸（打一两字官名）'},
[100] = {Question = '开花结桃，桃不能吃（打一物）'},
}
local RiceGlueBallDengMi_AnswerList ={
[1] = {[1]='排',[2]='挡',},
[2] = {[1]='男子长跑',[2]='男子跳高',},
[3] = {[1]='备座',[2]='作揖',},
[4] = {[1]='封面秀',[2]='盖面秀',},
[5] = {[1]='周迅',[2]='周海媚',},
[6] = {[1]='洛兵',[2]='周杰伦',},
[7] = {[1]='在下',[2]='仁兄',},
[8] = {[1]='刘翔',[2]='史东鹏',},
[9] = {[1]='这回差不多',[2]='这样还不行',},
[10] = {[1]='十六开张',[2]='十七出炉',},
[11] = {[1]='哉',[2]='宰',},
[12] = {[1]='严打、治安',[2]='扫黄、打黑',},
[13] = {[1]='日心说',[2]='万有引力',},
[14] = {[1]='伍豪',[2]='伍威',},
[15] = {[1]='峰会',[2]='和谈',},
[16] = {[1]='置之死地而后生',[2]='柳暗花明又一村',},
[17] = {[1]='音阶',[2]='音节',},
[18] = {[1]='难舍真情',[2]='两难相忘',},
[19] = {[1]='波导、海尔',[2]='长虹、联想',},
[20] = {[1]='成语、实录',[2]='文笔、谐语',},
[21] = {[1]='爱丽舍、皇冠',[2]='奔驰、红旗',},
[22] = {[1]='噙',[2]='嗜',},
[23] = {[1]='李国盛',[2]='唐国强',},
[24] = {[1]='高招办',[2]='招就办',},
[25] = {[1]='阿杜',[2]='黎明',},
[26] = {[1]='古巴',[2]='巴西',},
[27] = {[1]='没有那回事',[2]='这怎么可能',},
[28] = {[1]='离合总关情',[2]='我等燕归来',},
[29] = {[1]='中行',[2]='建设银行',},
[30] = {[1]='日服二次',[2]='增加剂量',},
[31] = {[1]='年幼无知',[2]='少不更事',},
[32] = {[1]='适得其反',[2]='正好相同',},
[33] = {[1]='植物肥',[2]='植物瘦',},
[34] = {[1]='黄兴',[2]='董存瑞',},
[35] = {[1]='常熟、大名',[2]='宿州、苏州',},
[36] = {[1]='引人入胜',[2]='令人遐想',},
[37] = {[1]='日中为市',[2]='中西合璧',},
[38] = {[1]='羊脂球',[2]='王子复仇记',},
[39] = {[1]='电',[2]='风',},
[40] = {[1]='唐国强',[2]='张国立',},
[41] = {[1]='李时珍',[2]='张仲景',},
[42] = {[1]='六一散',[2]='五石散',},
[43] = {[1]='阳朔',[2]='桂林',},
[44] = {[1]='《为了孩子》',[2]='《动漫先锋》',},
[45] = {[1]='豪',[2]='爽',},
[46] = {[1]='古',[2]='早',},
[47] = {[1]='《白痴》',[2]='《二傻》',},
[48] = {[1]='伯',[2]='仲',},
[49] = {[1]='有火就有烟',[2]='有烟就有火',},
[50] = {[1]='口',[2]='舌',},
[51] = {[1]='专利权',[2]='专营权',},
[52] = {[1]='封面、封底',[2]='竖页、横板',},
[53] = {[1]='头',[2]='颈',},
[54] = {[1]='晚间有零星小雨',[2]='晚间有倾盆大雨',},
[55] = {[1]='独白，悲剧',[2]='配音、喜剧',},
[56] = {[1]='申诉、自首',[2]='一审、判决',},
[57] = {[1]='《明天》',[2]='《呐喊》',},
[58] = {[1]='啰',[2]='嗦',},
[59] = {[1]='水土不服',[2]='花草过敏',},
[60] = {[1]='两处茫茫皆不见',[2]='两只黄鹂鸣翠柳',},
[61] = {[1]='园',[2]='圆',},
[62] = {[1]='登',[2]='爬',},
[63] = {[1]='《绝唱》',[2]='《绝响》',},
[64] = {[1]='二人转',[2]='黄梅戏',},
[65] = {[1]='忆秦娥',[2]='孟姜女',},
[66] = {[1]='《满城尽带黄金甲》',[2]='《赤壁》',},
[67] = {[1]='相似三角形',[2]='相等三角形',},
[68] = {[1]='多难兴邦',[2]='立国建业',},
[69] = {[1]='催',[2]='促',},
[70] = {[1]='《宝贝计划》',[2]='《窃听风云》',},
[71] = {[1]='汇',[2]='流',},
[72] = {[1]='声声慢',[2]='临江仙',},
[73] = {[1]='唧唧复唧唧',[2]='木兰当户织',},
[74] = {[1]='对酒当歌',[2]='譬如朝露',},
[75] = {[1]='时间就是金钱',[2]='时间就是生命',},
[76] = {[1]='也',[2]='还',},
[77] = {[1]='有',[2]='没有',},
[78] = {[1]='百年树人',[2]='十年树木',},
[79] = {[1]='十',[2]='士',},
[80] = {[1]='迷',[2]='眯',},
[81] = {[1]='朱自清',[2]='沈雁冰',},
[82] = {[1]='粗枝大叶',[2]='马虎不得',},
[83] = {[1]='天冬、前胡、地黄',[2]='当归、防风、半夏',},
[84] = {[1]='不同意见',[2]='签字画押',},
[85] = {[1]='二',[2]='三',},
[86] = {[1]='拿',[2]='擒',},
[87] = {[1]='摊',[2]='派',},
[88] = {[1]='尚',[2]='为',},
[89] = {[1]='洛阳',[2]='长安',},
[90] = {[1]='蚌埠',[2]='阜阳',},
[91] = {[1]='扬眉吐气',[2]='趾高气昂',},
[92] = {[1]='鱼',[2]='虾',},
[93] = {[1]='布谷鸟',[2]='蜂鸟',},
[94] = {[1]='蜈蚣',[2]='蝎子',},
[95] = {[1]='人影',[2]='灯光',},
[96] = {[1]='风筝',[2]='陀螺',},
[97] = {[1]='梅花',[2]='梨花',},
[98] = {[1]='聂耳',[2]='冼星海',},
[99] = {[1]='宰相 ',[2]='太师',},
[100] = {[1]='棉花',[2]='番薯',},
}

local RiceGlueBallDengMi_TrueAnswerList = {
[1] = {TrueAnswer='排',},
[2] = {TrueAnswer='男子长跑',},
[3] = {TrueAnswer='备座',},
[4] = {TrueAnswer='封面秀',},
[5] = {TrueAnswer='周迅',},
[6] = {TrueAnswer='洛兵',},
[7] = {TrueAnswer='在下',},
[8] = {TrueAnswer='刘翔',},
[9] = {TrueAnswer='这回差不多',},
[10] = {TrueAnswer='十六开张',},
[11] = {TrueAnswer='哉',},
[12] = {TrueAnswer='严打、治安',},
[13] = {TrueAnswer='日心说',},
[14] = {TrueAnswer='伍豪',},
[15] = {TrueAnswer='峰会',},
[16] = {TrueAnswer='置之死地而后生',},
[17] = {TrueAnswer='音阶',},
[18] = {TrueAnswer='难舍真情',},
[19] = {TrueAnswer='波导、海尔',},
[20] = {TrueAnswer='成语、实录',},
[21] = {TrueAnswer='爱丽舍、皇冠',},
[22] = {TrueAnswer='噙',},
[23] = {TrueAnswer='李国盛',},
[24] = {TrueAnswer='高招办',},
[25] = {TrueAnswer='阿杜',},
[26] = {TrueAnswer='古巴',},
[27] = {TrueAnswer='没有那回事',},
[28] = {TrueAnswer='离合总关情',},
[29] = {TrueAnswer='中行',},
[30] = {TrueAnswer='日服二次',},
[31] = {TrueAnswer='年幼无知',},
[32] = {TrueAnswer='适得其反',},
[33] = {TrueAnswer='植物肥',},
[34] = {TrueAnswer='黄兴',},
[35] = {TrueAnswer='常熟、大名',},
[36] = {TrueAnswer='引人入胜',},
[37] = {TrueAnswer='日中为市',},
[38] = {TrueAnswer='羊脂球',},
[39] = {TrueAnswer='电',},
[40] = {TrueAnswer='唐国强',},
[41] = {TrueAnswer='李时珍',},
[42] = {TrueAnswer='六一散',},
[43] = {TrueAnswer='阳朔',},
[44] = {TrueAnswer='《为了孩子》',},
[45] = {TrueAnswer='豪',},
[46] = {TrueAnswer='古',},
[47] = {TrueAnswer='《白痴》',},
[48] = {TrueAnswer='伯',},
[49] = {TrueAnswer='有火就有烟',},
[50] = {TrueAnswer='口',},
[51] = {TrueAnswer='专利权',},
[52] = {TrueAnswer='封面、封底',},
[53] = {TrueAnswer='头',},
[54] = {TrueAnswer='晚间有零星小雨',},
[55] = {TrueAnswer='独白，悲剧',},
[56] = {TrueAnswer='申诉、自首',},
[57] = {TrueAnswer='《明天》',},
[58] = {TrueAnswer='啰',},
[59] = {TrueAnswer='水土不服',},
[60] = {TrueAnswer='两处茫茫皆不见',},
[61] = {TrueAnswer='园',},
[62] = {TrueAnswer='登',},
[63] = {TrueAnswer='《绝唱》',},
[64] = {TrueAnswer='二人转',},
[65] = {TrueAnswer='忆秦娥',},
[66] = {TrueAnswer='《满城尽带黄金甲》',},
[67] = {TrueAnswer='相似三角形',},
[68] = {TrueAnswer='多难兴邦',},
[69] = {TrueAnswer='催',},
[70] = {TrueAnswer='《宝贝计划》',},
[71] = {TrueAnswer='汇',},
[72] = {TrueAnswer='声声慢',},
[73] = {TrueAnswer='唧唧复唧唧',},
[74] = {TrueAnswer='对酒当歌',},
[75] = {TrueAnswer='时间就是金钱',},
[76] = {TrueAnswer='也',},
[77] = {TrueAnswer='有',},
[78] = {TrueAnswer='百年树人',},
[79] = {TrueAnswer='十',},
[80] = {TrueAnswer='迷',},
[81] = {TrueAnswer='朱自清',},
[82] = {TrueAnswer='粗枝大叶',},
[83] = {TrueAnswer='天冬、前胡、地黄',},
[84] = {TrueAnswer='不同意见',},
[85] = {TrueAnswer='二',},
[86] = {TrueAnswer='拿',},
[87] = {TrueAnswer='摊',},
[88] = {TrueAnswer='尚',},
[89] = {TrueAnswer='洛阳',},
[90] = {TrueAnswer='蚌埠',},
[91] = {TrueAnswer='扬眉吐气',},
[92] = {TrueAnswer='鱼',},
[93] = {TrueAnswer='布谷鸟',},
[94] = {TrueAnswer='蜈蚣',},
[95] = {TrueAnswer='人影',},
[96] = {TrueAnswer='风筝',},
[97] = {TrueAnswer='梅花',},
[98] = {TrueAnswer='聂耳',},
[99] = {TrueAnswer='宰相',},
[100] = {TrueAnswer='棉花',},
}

function YeYingShanGu_ZhanQi(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local XuanZe = API_RequestGetNumber(1)	

	if API_GetMonsterID(NPCFastID) <= 0 then
		API_ActorSendMsg(ActorID,10,'这个战旗已经被人捷足先登，请找寻另外的战旗答题。')
		API_ResponseWrite('<br><text>这个战旗已经被人捷足先登，请找寻另外的战旗答题。</text><br>')
		return
	end
	
	if XuanZe == 1 then
		API_DestroyMonster(NPCFastID)
		local YuanXiaoDM_True = API_RequestGetNumber(2)
		if  YuanXiaoDM_True == 1 then
			local ObjectMapID = API_GetActorMapID(ActorID)
			YeYingShanGu_FuBenIDlist[ObjectMapID].DaTiNum = YeYingShanGu_FuBenIDlist[ObjectMapID].DaTiNum + 1
--			API_ActorAddMorale(ActorID,10,0,'答题士气奖励')
--			API_ActorSendMsg(ActorID,1,'获得10点士气奖励')
			API_ActorSendMsg(ActorID,3,'恭喜你答对了')
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>很抱歉您答错本道题目，无法获得奖励，请您不要气馁，更多的奖励在等着您。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
		end
	else	
		local DMQuestionNo = math.random(table.getn(RiceGlueBallDengMi_QuestionList)) 
		local Question = RiceGlueBallDengMi_QuestionList[DMQuestionNo].Question
		local Answer = RiceGlueBallDengMi_AnswerList[DMQuestionNo]
		local TrueAnswer = RiceGlueBallDengMi_TrueAnswerList[DMQuestionNo].TrueAnswer
		local LinShi = {}
		for i = 1,table.getn(RiceGlueBallDengMi_AnswerList[DMQuestionNo]) do
			LinShi[i] = RiceGlueBallDengMi_AnswerList[DMQuestionNo][i]
		end
		LinShiBC = table.getn(LinShi)
		local LinShi2 = {}
		local TureDaAn = 1
		while LinShiBC > 0 do
			local XH = math.random(LinShiBC)
			LinShi2BC = table.getn(LinShi2)
			LinShi2[LinShi2BC+1] = LinShi[XH]
			LinShiBC = LinShiBC -1
			if LinShi[XH] == TrueAnswer then
				TrueDaAn = table.getn(LinShi2)
			end
			--删除LinShi表里面XH这一行
			table.remove(LinShi,XH)
		end
		API_ResponseWrite('<name>战旗答题</name>')
		API_ResponseWrite('<br><text>根据问题，选择一个正确答案。</text><br>')
		API_ResponseWrite('<text>'..Question..'</text><br>')
		for i =1,table.getn(LinShi2) do
			local ABC = 0
			if	i == TrueDaAn then
				ABC = 1
			end
			API_ResponseWrite('<br><a href="YeYingShanGu_ZhanQi?1=1&2='..ABC..'">'..i..'、'..LinShi2[i]..'</a><br>')
		end
		API_ResponseFlush(ActorID)
	end
end

