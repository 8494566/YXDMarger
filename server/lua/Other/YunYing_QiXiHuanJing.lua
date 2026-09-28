-------------------------------
--文件名:	Scp\Lua\Other\YunYing_QiXiHuanJing.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	刘操
--日  期:	2010-7-13
--版  本:	
--描  述:   七夕幻境副本
--应  用:  
-------------------------------
local QiXiHuoDong_StartTime = {Year = 2012,Month = 2,Day = 13,Hour = 0,Minute = 0,Second = 0}   -------开始时间
local QiXiHuoDong_EndTime = {Year = 2020,Month = 9,Day = 3,Hour = 0,Minute = 0,Second = 0}   -------停止时间

GLOBAL_AiMuZhiXin_StartTime = {Year = 2012,Month = 2,Day = 13,Hour = 0,Minute = 0,Second = 0}   -------开始时间
GLOBAL_AiMuZhiXin_EndTime = {Year = 2012,Month = 9,Day = 3,Hour = 0,Minute = 0,Second = 0}   -------停止时间


 HLsdzf_PeiHeHuoDong_StartTime = {Year = 2012,Month = 12,Day = 14,Hour = 0,Minute = 0,Second = 0}
 HLsdzf_PeiHeHuoDong__EndTime = {Year = 2013,Month = 1,Day = 7,Hour = 0,Minute = 0,Second = 0}

TianYuanShuiJingUseSave = 30204--天缘水晶使用次数
TianYuanShuiJingGetSave = 30205--天缘水晶赠送标志

--怪物掉落表
local localtable_QiXiHuanJing_Goods = {
[1] = {
		[1] = {GoodsId=89188,Num=1,Odds=500000,Flag=0},
		[2] = {GoodsId=89189,Num=1,Odds=100000,Flag=0},
		[3] = {GoodsId=80696,Num=1,Odds=1000000,Flag=0},
		[4] = {GoodsId=80696,Num=1,Odds=1000000,Flag=0},
		[5] = {GoodsId=80696,Num=1,Odds=1000000,Flag=0},
		[6] = {GoodsId=80696,Num=1,Odds=1000000,Flag=0},
		[7] = {GoodsId=80696,Num=1,Odds=1000000,Flag=0},
		[8] = {GoodsId=80382,Num=1,Odds=1000000,Flag=3},
		[9] = {GoodsId=80384,Num=1,Odds=1000000,Flag=3},
		[10] = {GoodsId=819,Num=1,Odds=1000000,Flag=0},
		[11] = {GoodsId=820,Num=1,Odds=1000000,Flag=0},
		[12] = {GoodsId=821,Num=1,Odds=1000000,Flag=0},
		[13] = {GoodsId=822,Num=1,Odds=1000000,Flag=0},
		[14] = {GoodsId=823,Num=1,Odds=1000000,Flag=0},
		[15] = {GoodsId=824,Num=1,Odds=1000000,Flag=0},
		[16] = {GoodsId=825,Num=1,Odds=1000000,Flag=0},
		[17] = {GoodsId=11278,Num=1,Odds=10000,Flag=0},
		[18] = {GoodsId=11112,Num=1,Odds=10000,Flag=0},
	},
[2] = {
		[1] = {GoodsId=89188,Num=1,Odds=500000,Flag=0},
		[2] = {GoodsId=89189,Num=1,Odds=100000,Flag=0},
		[3] = {GoodsId=80696,Num=1,Odds=1000000,Flag=0},
		[4] = {GoodsId=80696,Num=1,Odds=1000000,Flag=0},
		[5] = {GoodsId=80696,Num=1,Odds=1000000,Flag=0},
		[6] = {GoodsId=80696,Num=1,Odds=1000000,Flag=0},
		[7] = {GoodsId=80696,Num=1,Odds=1000000,Flag=0},
		[8] = {GoodsId=80382,Num=1,Odds=1000000,Flag=3},
		[9] = {GoodsId=80384,Num=1,Odds=1000000,Flag=3},
		[10] = {GoodsId=819,Num=1,Odds=1000000,Flag=0},
		[11] = {GoodsId=820,Num=1,Odds=1000000,Flag=0},
		[12] = {GoodsId=821,Num=1,Odds=1000000,Flag=0},
		[13] = {GoodsId=822,Num=1,Odds=1000000,Flag=0},
		[14] = {GoodsId=823,Num=1,Odds=1000000,Flag=0},
		[15] = {GoodsId=824,Num=1,Odds=1000000,Flag=0},
		[16] = {GoodsId=825,Num=1,Odds=1000000,Flag=0},
		[17] = {GoodsId=11335,Num=1,Odds=5000,Flag=0},
		[18] = {GoodsId=11336,Num=1,Odds=5000,Flag=0},
	},	
}


local QiXiHuanJing_DiTuDingYi = {
[1] = {NPC = {
				--传送门
				{NPCID = 11607,TileX = 67,TileY = 49,Direct = 3,AIInfoID = nil,Camp = nil,},
			},
	},
}


local QiXiHuanJing_MonsterTable = {
[1] = {MonsterID=730009,TileX=63,TileY=71},
[2] = {MonsterID=730010,TileX=52,TileY=59},
}

local GoodsID_1,GoodsID_2,GoodsID_3,GoodsID_4,GoodsID_5,GoodsID_6,GoodsID_7,GoodsID_8,GoodsID_9,GoodsID_10 = 82005,82006,82007,82008,82009,82010,82011,82012,82013,82014


local TianYuanShuiJingGoodID = {
[1] = {[1] = 82005,[2] = 82007,[3] = 82009,[4] = 82011,[5] = 82013,},
[2] = {[1] = 82006,[2] = 82008,[3] = 82010,[4] = 82012,[5] = 82014,},
}

--天缘水晶配对表
local TianYuanShuiJingPeiDui = {
[1] = {[89190]=89191,[89191]=89190,[82007]=82008,[82009]=82010,[82011]=82012,[82013]=82014,},
[2] = {[89191]=89190,[89190]=89191,[82008]=82007,[82010]=82009,[82012]=82011,[82014]=82013,},
}

local ShuiJingBiao = {
[89190]=89191,
[89191]=89190,
}

--上线回调
function TianYuanShuiJing_OnLogin(ActorID)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end	
	local nShiFouStart = API_DiffDatatime(QiXiHuoDong_StartTime.Year,QiXiHuoDong_StartTime.Month,QiXiHuoDong_StartTime.Day,QiXiHuoDong_StartTime.Hour,QiXiHuoDong_StartTime.Minute,QiXiHuoDong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(QiXiHuoDong_EndTime.Year,QiXiHuoDong_EndTime.Month,QiXiHuoDong_EndTime.Day,QiXiHuoDong_EndTime.Hour,QiXiHuoDong_EndTime.Minute,QiXiHuoDong_EndTime.Second)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel < 25 then
		return
	end
--	if nShiFouStart <= 0 and nShiFouEnd > 0 then
--		local BeginTime = QiXiHuoDong_StartTime.Year * 10000 + QiXiHuoDong_StartTime.Month * 100 + QiXiHuoDong_StartTime.Day
--		local GetTime = API_VarDataGetNumber(ActorID,1,TianYuanShuiJingGetSave)
--		if GetTime < BeginTime then
--			local ActorSex = API_GetActorSex(ActorID)
--			local GoodsTable = TianYuanShuiJingGoodID[ActorSex]
--			API_VarDataSetNumber(ActorID,1,TianYuanShuiJingUseSave,0)--清除天缘水晶使用次数
--			API_VarDataSetNumber(ActorID,1,TianYuanShuiJingGetSave,BeginTime)
--			if ActorSex == 2 then
--				for i = 1,5 do
--					local RandNum = math.random(5)
--					local QiXiHuanJing_GoodsID = GoodsTable[RandNum]
--					API_SendActorMailByName(API_GetActorName(ActorID),QiXiHuanJing_GoodsID,1,3,'情人节活动赠送','活动期间（2月13日~2月19日）上线即可参与情人节活动。玩家找到与自己“天缘水晶”颜色一致的异性组队，即可使用天缘水晶进入“灵犀幻境”。成功通过考验者，便可获得“爱慕之心”，参与玩家将有机会获得限量海洋之星饰品。')
--					API_ActorSendMsg(ActorID,17,'您的邮箱中获得“'..API_GetGoodsName(QiXiHuanJing_GoodsID)..'”1个，请注意查收')
--				end
--			elseif ActorSex == 1 then
--				for i = 1,2 do
--					local RandNum = math.random(5)
--					local QiXiHuanJing_GoodsID = GoodsTable[RandNum]
--					API_SendActorMailByName(API_GetActorName(ActorID),QiXiHuanJing_GoodsID,1,3,'情人节活动赠送','活动期间（2月13日~2月19日）上线即可参与情人节活动。玩家找到与自己“天缘水晶”颜色一致的异性组队，即可使用天缘水晶进入“灵犀幻境”。成功通过考验者，便可获得“爱慕之心”，参与玩家将有机会获得限量海洋之星饰品。。')
--					API_ActorSendMsg(ActorID,17,'您的邮箱中获得“'..API_GetGoodsName(QiXiHuanJing_GoodsID)..'”1个，请注意查收')
--				end
--			end
--		end
--	end
end

--跨天回调
function TianYuanShuiJing_kuatianchuli(ActorID)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel < 25 then
		return
	end
	local nShiFouStart = API_DiffDatatime(QiXiHuoDong_StartTime.Year,QiXiHuoDong_StartTime.Month,QiXiHuoDong_StartTime.Day,QiXiHuoDong_StartTime.Hour,QiXiHuoDong_StartTime.Minute,QiXiHuoDong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(QiXiHuoDong_EndTime.Year,QiXiHuoDong_EndTime.Month,QiXiHuoDong_EndTime.Day,QiXiHuoDong_EndTime.Hour,QiXiHuoDong_EndTime.Minute,QiXiHuoDong_EndTime.Second)
--	if nShiFouStart < 0 and nShiFouEnd > 0 then
--		local usecishu = API_VarDataGetNumber(ActorID,1,TianYuanShuiJingUseSave)
--		if usecishu > 0 then
--			local ActorSex = API_GetActorSex(ActorID)
--			local GoodsTable = TianYuanShuiJingGoodID[ActorSex]
--			API_VarDataSetNumber(ActorID,1,TianYuanShuiJingUseSave,0)--清除天缘水晶使用次数
--			if ActorSex == 1 then
--				if usecishu > 2 then
--					usecishu = 2
--				end
--			elseif ActorSex == 2 then
--				if usecishu > 5 then
--					usecishu = 5
--				end
--			end
--			for i = 1,usecishu do
--				local RandNum = math.random(5)
--				local QiXiHuanJing_GoodsID = GoodsTable[RandNum]
--				API_SendActorMailByName(API_GetActorName(ActorID),QiXiHuanJing_GoodsID,1,3,'情人节活动赠送','活动期间（2月13日~2月19日）上线即可参与情人节活动。玩家找到与自己“天缘水晶”颜色一致的异性组队，即可使用天缘水晶进入“灵犀幻境”。成功通过考验者，便可获得“爱慕之心”，参与玩家将有机会获得限量海洋之星饰品。。')
--				API_ActorSendMsg(ActorID,17,'您的邮箱中获得“'..API_GetGoodsName(QiXiHuanJing_GoodsID)..'”1个，请注意查收')
--			end
--		end
--	end
end

--天缘水晶使用
function TianYuanShuiJingUse(ActorID,GoodsID)
	local MapID = API_GetActorMapID(ActorID) 
	local StaticMapID = API_GetStaticMapID(MapID)
	local nShiFouStart = API_DiffDatatime(QiXiHuoDong_StartTime.Year,QiXiHuoDong_StartTime.Month,QiXiHuoDong_StartTime.Day,QiXiHuoDong_StartTime.Hour,QiXiHuoDong_StartTime.Minute,QiXiHuoDong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(QiXiHuoDong_EndTime.Year,QiXiHuoDong_EndTime.Month,QiXiHuoDong_EndTime.Day,QiXiHuoDong_EndTime.Hour,QiXiHuoDong_EndTime.Minute,QiXiHuoDong_EndTime.Second)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if nShiFouEnd <= 0 then
		if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用天缘水晶') then--销毁玩家身上的物品
			if API_ActorCanAddGoods(ActorID,80498,10,3,0) ~= -1 then
				API_AddActorGoodsFlag(ActorID,80498,10,0,'获得10个经验兑换券')
				API_ActorSendMsg(ActorID,8,'获得10个经验兑换券')
			else
				local GoodsName = API_GetGoodsName(80498)
				API_SendActorMailByName(API_GetActorName(ActorID),80498,10,0,'情人节活动奖励','')
				API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'10个（请到邮箱领取）')
			end
			API_ResponseWrite('<name>天缘水晶</name>')
			API_ResponseWrite('<text>    七夕节活动已结束，您获得10个经验兑换券。</text><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
			API_ResponseFlush(ActorID)
			return 1
		end
	end
	if GoodsID == 89190 or GoodsID == 89191 then
		if MapID == StaticMapID then
			API_ResponseWrite('<name>天缘水晶</name>')
			API_ResponseWrite('<text>找到与自己天缘水晶颜色不同的同伴，即可组队进入“灵犀幻境”。\n成功通过考验者，便可获得“鲜花”，参与玩家将有机会获得限量海洋之星，灵犀对戒，永恒之心饰品。</text><br>')
			API_ResponseWrite('<br><a href="QiXiHuanJing_ShiFouStater?2='..GoodsID..'">进入灵犀幻境</a><br>')
			API_ResponseWrite('<br><a href="QiXiHuanJing_TianYuanShuiJingDiuQi?2='..GoodsID..'">丢弃天缘水晶</a><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
			API_ResponseFlush(ActorID)
			return 1
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<text>	天缘水晶使用失败！亲爱的玩家，当前地图不允许使用该物品，请切换地图尝试使用。</text><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
			API_ResponseFlush(ActorID)
			return 0
		end
	else
		return 0
	end
end

function QiXiHuanJing_TianYuanShuiJingDiuQi()
local ActorID = ActorID or API_RequestGetActorID()
local GoodsID = GoodsID or API_RequestGetNumber(2)
local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 3 then
		if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 then
			local num = API_ActorGetGoodsNum(ActorID,GoodsID)
			API_ActorRemoveGoods(ActorID,GoodsID,num,'天缘水晶丢弃')
			local usecishu = API_VarDataGetNumber(ActorID,1,TianYuanShuiJingUseSave)
			usecishu = usecishu + num
			API_VarDataSetNumber(ActorID,1,TianYuanShuiJingUseSave,usecishu)	
			API_ResponseEnd()
			API_ResponseClear()
			return 1
		end
	else
		API_ResponseWrite('<name>天缘水晶</name>')
		API_ResponseWrite('<text>您确定要丢弃'..API_ActorGetGoodsNum(ActorID,GoodsID)..'个'..API_GetGoodsName(GoodsID)..'吗？</text>')
		API_ResponseWrite('<br><br><a underline="1" href="QiXiHuanJing_TianYuanShuiJingDiuQi?1=3&2='..GoodsID..'">丢弃天缘水晶</a><br>')
		API_ResponseFlush(ActorID)
	end
end

--幻境副本开启条件判断
function QiXiHuanJing_ShiFouStater()
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = API_RequestGetNumber(2)
	local TeamID = API_GetTeamID(ActorID)--获得玩家所在队伍的ID
		if TeamID <= 0 then
			API_ResponseWrite('<name>灵犀幻境</name>')
			API_ResponseWrite('<text>	灵犀幻境需要两人组队方可进入，请寻到与您的天缘水晶颜色不同的同伴，即可组队进入“灵犀幻境”。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 	
		end
		local TeamSize = API_GetTeamSize(TeamID)--获得队伍人数	
		if TeamSize ~= 2 then
			API_ResponseWrite('<name>灵犀幻境</name>')
			API_ResponseWrite('<text>	灵犀幻境需要两人组队方可进入，您当前的队伍条件不满足。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return
		end
--		local Man,Woman = 0,0
--		for i = 1,TeamSize do
--			local TeamActorID = API_GetTeamMem(TeamID,i)--获得队伍成员ID
--			local ActorSex = API_GetActorSex(TeamActorID)
--			if ActorSex == 1 then
--				Man = 1
--			elseif ActorSex == 2 then
--				Woman = 1
--			end
--		end
--		if Man ~= 1 or Woman ~= 1 then
--			API_ResponseWrite('<name>灵犀幻境</name>')
--			API_ResponseWrite('<text>灵犀幻境需要一男一女组队方可进入，您当前的队伍条件不满足。</text><br>')
--			API_ResponseWrite('<br><a>确定</a><br>')
--			API_ResponseFlush(ActorID)
--			return 				
--		end
		for i = 1,TeamSize do
			local TeamActorID = API_GetTeamMem(TeamID,i)--获得队伍成员ID
			local ActorSex = API_GetActorSex(TeamActorID)
			if not API_ActorIsOnline(TeamActorID) then	
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>队伍中有玩家不在线，无法进入灵犀幻境！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return 			
			end
			if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>快递中，无法进入灵犀幻境！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return 
			end
			if API_ActorFindStatus(TeamActorID,519) then
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>摆摊中，无法进入灵犀幻境！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return 
			end
			if API_ActorIsDying(TeamActorID) then
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>死亡，无法进入灵犀幻境！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return 
			end
			if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>在公交车上无法进入灵犀幻境！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return
			end
			local Level = API_GetActorExpLevel(TeamActorID)
			if Level < 16 then
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>等级未达到16级以上。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return
			end
			local MapID = API_GetActorMapID(ActorID) 
			if ActorID ~= TeamActorID then
				if MapID ~= API_GetActorMapID(TeamActorID)  then
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>不在同一场景中。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)
					return				
				end
			end
			if ActorID ~= TeamActorID then
				local ActorSex = API_GetActorSex(ActorID)
				local GoodsID1 = TianYuanShuiJingPeiDui[ActorSex][GoodsID]
				if GoodsID1 ~= nil then
					if API_ActorGetGoodsNum(TeamActorID,GoodsID1) < 1 then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>没有配对的天缘水晶。</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return
					end
				end
			end
		end
		QiXiHuanJing_Create(ActorID, GoodsID)
end

if QiXiHuanJing_MapInfoTable == nil then
	QiXiHuanJing_MapInfoTable = {}
end


if QiXiHuanJing_MonsterFastID == nil then
	QiXiHuanJing_MonsterFastID = {}
end

if QiXiHuanJing_ActorID == nil then
	QiXiHuanJing_ActorID = {}
end

--创建副本
function QiXiHuanJing_Create(ActorID, GoodsID)
	local StaticMapID = 2026
	local ObjectMapID = API_CreateEctype(StaticMapID,0)
	QiXiHuanJing_MapInfoTable[ObjectMapID] = {}
	QiXiHuanJing_MapInfoTable[ObjectMapID].number1 = 0
	QiXiHuanJing_MapInfoTable[ObjectMapID].number2 = 0
	QiXiHuanJing_MonsterFastID[ObjectMapID] = {}
	QiXiHuanJing_ActorID[ObjectMapID] = {}
	local CitadelTable = QiXiHuanJing_DiTuDingYi[1]
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
			local FastID = API_CreateMonster(ObjectMapID,NPCID,NPCTable.TileX,NPCTable.TileY,Direct,AIInfoID,Camp)--创建NPC
		end
	end
	--创建BOSS
	for i = 1,2 do
		local MonsterID = QiXiHuanJing_MonsterTable[i].MonsterID
		local TileX = QiXiHuanJing_MonsterTable[i].TileX
		local TileY = QiXiHuanJing_MonsterTable[i].TileY
		local FastID = API_CreateMonster(ObjectMapID,MonsterID,TileX,TileY,4,0,2)
		QiXiHuanJing_MapInfoTable[ObjectMapID].number1 = QiXiHuanJing_MapInfoTable[ObjectMapID].number1 + 1
		QiXiHuanJing_MonsterFastID[ObjectMapID][QiXiHuanJing_MapInfoTable[ObjectMapID].number1] = FastID
		API_CreateDieTriggerG(ObjectMapID,0,0,FastID,'QiXiHuanJing_BossDieFunc')
	end
	QiXiHuanJing_PlayGotoMap(ObjectMapID,ActorID,GoodsID)
end

--传送玩家
function QiXiHuanJing_PlayGotoMap(ObjectMapID,ActorID,GoodsID)
	local TileX=63
	local TileY=54
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorIsOnline(ActorID) then
		--判断组队
		local MapID = API_GetActorMapID(ActorID)
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			if TeamSize == 2 then
				for i = 1,TeamSize do
					local TeamActorID = API_GetTeamMem(TeamID,i)
					if API_GetTeamLeader(TeamID) ~= ActorID then
						if ActorID ~= TeamActorID then
							local ActorSex = API_GetActorSex(ActorID)
							GoodsID = ShuiJingBiao[GoodsID]	
						else
							GoodsID = ShuiJingBiao[GoodsID]	
						end
					else
						if ActorID ~= TeamActorID then
							local ActorSex = API_GetActorSex(ActorID)
							GoodsID = ShuiJingBiao[GoodsID]	
						end						
					end
--					local ActorSex = API_GetActorSex(TeamActorID)
--					local GoodsIDPeiDui1 = TianYuanShuiJingPeiDui[1][GoodsID]
--					local GoodsIDPeiDui2 = TianYuanShuiJingPeiDui[2][GoodsID]
--					if ActorSex == 1 and GoodsIDPeiDui1 == nil then
--						GoodsID = TianYuanShuiJingPeiDui[2][GoodsID]	
--					end
--					if ActorSex == 2 and GoodsIDPeiDui2 == nil then
--						GoodsID = TianYuanShuiJingPeiDui[1][GoodsID]	
--					end
					if MapID == API_GetActorMapID(TeamActorID) then
						if API_ActorGetGoodsNum(TeamActorID,GoodsID) > 0 and API_ActorRemoveGoods(TeamActorID,GoodsID,1,'使用天缘水晶') then--销毁玩家身上的物品
							API_ActorGoToMap(TeamActorID,ObjectMapID,TileX,TileY)
							QiXiHuanJing_MapInfoTable[ObjectMapID].number2 = QiXiHuanJing_MapInfoTable[ObjectMapID].number2 + 1
							QiXiHuanJing_ActorID[ObjectMapID][QiXiHuanJing_MapInfoTable[ObjectMapID].number2] = TeamActorID
							--保存使用次数
							local UseNum = API_VarDataGetNumber(TeamActorID,1,TianYuanShuiJingUseSave)
							UseNum = UseNum + 1
							API_VarDataSetNumber(TeamActorID,1,TianYuanShuiJingUseSave,UseNum)
							--进入七夕幻境副本人数
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[57][1][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[57][1][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[57][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[57][1][LaiYuan] + 1
							end
						end
					end
				end
			end
		end
	end
end

--怪物死亡回调函数
function QiXiHuanJing_BossDieFunc(MapID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if MapID <= 0 then
		return
	end
	if not API_MapIsValid(MapID) then
		return
	end
	if MonsterID == 730009 then
		local DiaoLuoNum = table.getn(localtable_QiXiHuanJing_Goods[1])
		for i = 1,DiaoLuoNum do
			local GoodsTable = localtable_QiXiHuanJing_Goods[1][i]
			local GoodsId = GoodsTable.GoodsId
			local Num = GoodsTable.Num
			local Flag = GoodsTable.Flag
			local Odds = GoodsTable.Odds
			local Rand = math.random(10000)
			if Rand <= Odds then
				if GoodsId == 11278 then
					local Number = API_VarDataGetNumber_Ex(1,0,-6009,1,5)
					if Number > 0 then 
						Number = Number - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6009,1,5,Number)
					else
						GoodsId = 89188
					end
				elseif GoodsId == 11112 then
					local Number = API_VarDataGetNumber_Ex(1,0,-6009,1,7)
					if Number > 0 then 
						Number = Number - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6009,1,7,Number)
					else
						GoodsId = 89188
					end					
				end
				API_CreateDropGoods(MapID,PosX,PosY,GoodsId,Num,Flag,'掉落物品',4,0,600,60)
				if GoodsId == 89188 then
					--七夕幻境爱慕之星产出数量
					local LaiYuan = 1
					if GLOBAL_FengXiangBiao_DateList[57][3][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[57][3][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[57][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[57][3][LaiYuan] + 1
					end			
				end
			end

		end
	elseif MonsterID == 730010 then
		local DiaoLuoNum = table.getn(localtable_QiXiHuanJing_Goods[2])
		for i = 1,DiaoLuoNum do
			local GoodsTable = localtable_QiXiHuanJing_Goods[2][i]
			local GoodsId = GoodsTable.GoodsId
			local Num = GoodsTable.Num
			local Flag = GoodsTable.Flag
			local Odds = GoodsTable.Odds
			local Rand = math.random(10000)
			if Rand <= Odds then
				if GoodsId == 11335 then
					local Number = API_VarDataGetNumber_Ex(1,0,-6009,1,6)
					if Number > 0 then 
						Number = Number - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6009,1,6,Number)
					else
						GoodsId = 89188
					end
				elseif GoodsId == 11336 then
					local Number = API_VarDataGetNumber_Ex(1,0,-6009,1,8)
					if Number > 0 then 
						Number = Number - 1
						API_VarDataSetNumber_Ex_Sync(1,0,-6009,1,8,Number)
					else
						GoodsId = 89188
					end					
				end
				API_CreateDropGoods(MapID,PosX,PosY,GoodsId,Num,Flag,'掉落物品',4,0,600,60)
				if GoodsId == 89188 then
					--七夕幻境爱慕之星产出数量
					local LaiYuan = 1
					if GLOBAL_FengXiangBiao_DateList[57][3][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[57][3][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[57][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[57][3][LaiYuan] + 1
					end			
				end
			end
		end
	end
--	local DieNum = 0
--	for i = 1,table.getn(QiXiHuanJing_MonsterFastID[MapID]) do
--		local MonsterID = API_GetMonsterID(QiXiHuanJing_MonsterFastID[MapID][i])		
--		if MonsterID <= 0 then
--			DieNum = DieNum + 1
--		end
--	end
--	if DieNum == 2 then
--		if API_VarDataGetNumber_Ex(1,0,-6009,1,3) < API_VarDataGetNumber_Ex(1,0,-6009,1,2) then
--			local Rand = math.random(10000)
--			local NowTime = os.time()
--			local CDTime = API_VarDataGetNumber_Ex(1,0,-6009,1,4)--海洋之心奖励CD时间
--			if Rand <= 50 and NowTime > CDTime then
--				for i = 1,table.getn(QiXiHuanJing_ActorID[MapID]) do
--					local ActorID = QiXiHuanJing_ActorID[MapID][i]
--					if API_ActorCanAddGoods(ActorID,11278,1,3,0) ~= -1 then
--						API_AddActorGoodsFlag(ActorID,11278,1,0,'获得海洋之心')
--						API_ActorSendMsg(ActorID,8,'获得海洋之心')
--					else
--						local GoodsName = API_GetGoodsName(11278)
--						API_SendActorMailByName(API_GetActorName(ActorID),11278,1,0,'七夕幻境奖励','')
--						API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'一个（请到邮箱领取）')
--					end
--					--七夕幻境海洋之星产出数量
--					local LaiYuan = API_ActorGetPropNum(ActorID,201)
--					if GLOBAL_FengXiangBiao_DateList[57][2][LaiYuan] == nil then
--						GLOBAL_FengXiangBiao_DateList[57][2][LaiYuan] = 1
--					else
--						GLOBAL_FengXiangBiao_DateList[57][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[57][2][LaiYuan] + 1
--					end
--				end
--				local ActorID1 = QiXiHuanJing_ActorID[MapID][1]
--				local ActorID2 = QiXiHuanJing_ActorID[MapID][2]
--				local JiangLiNum = API_VarDataGetNumber_Ex(1,0,-6009,1,3)
--				JiangLiNum = JiangLiNum + 1
--				API_VarDataSetNumber_Ex_Sync(1,0,-6009,1,3,JiangLiNum)--海洋之心奖励次数
--				API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID1)..'与'..API_GetActorName(ActorID2)..'齐心协力消灭了七夕幻境里的魅魔，各获得了1枚海洋之心！')
--				local Time = os.time()
--				local NextTime = Time + 3600
--				API_VarDataSetNumber_Ex_Sync(1,0,-6009,1,4,NextTime)--海洋之心奖励CD时间
--			end
--		end
--	end
end

if QiXiHuoDong_TimeTriggerGID ~= nil then
	API_DestroyTriggerG(QiXiHuoDong_TimeTriggerGID)
	QiXiHuoDong_TimeTriggerGID = nil
end

if API_GetServerID() == 1 then
	--创建时间触发器
	local nShiFouStart = API_DiffDatatime(QiXiHuoDong_StartTime.Year,QiXiHuoDong_StartTime.Month,QiXiHuoDong_StartTime.Day,QiXiHuoDong_StartTime.Hour,QiXiHuoDong_StartTime.Minute,QiXiHuoDong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(QiXiHuoDong_EndTime.Year,QiXiHuoDong_EndTime.Month,QiXiHuoDong_EndTime.Day,QiXiHuoDong_EndTime.Hour,QiXiHuoDong_EndTime.Minute,QiXiHuoDong_EndTime.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if QiXiHuoDong_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(QiXiHuoDong_TimeTriggerGID)
		end
		QiXiHuoDong_TimeTriggerGID = API_CreateTimerTriggerG(0,0,60,-1,'QiXiHuoDong_ShuJuQingChu')
	else
		if QiXiHuoDong_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(QiXiHuoDong_TimeTriggerGID)
		end		
	end	
end


--清除全局交互数据
function QiXiHuoDong_ShuJuQingChu(Param1,Param2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.time()
	--设置奖励上限数量
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6009,1,1) and API_GetServerID() == 1 then
		local NowTime = os.date("*t", os.time()) 
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 11 
		NowTime.min = 59 
		NowTime.sec = 59 
		local NightTime = os.time(NowTime)
		local NextQingChuTime = NightTime + 86400 + 1
		API_VarDataSetNumber_Ex_Sync(1,0,-6009,1,1,NextQingChuTime)
--		local JiangLiMax = math.random(1,3)--随机海洋之星奖励上限
		API_VarDataSetNumber_Ex_Sync(1,0,-6009,1,2,3)
		API_VarDataSetNumber_Ex_Sync(1,0,-6009,1,3,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6009,1,5,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6009,1,6,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6009,1,7,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6009,1,8,1)
	end
end

--爱慕之心道具使用
function QiXiHuoDong_AiMuZhiXinUse(ActorID,GoodsID)
	if GoodsID == 89188 then
		local nShiFouStart = API_DiffDatatime(GLOBAL_AiMuZhiXin_StartTime.Year,GLOBAL_AiMuZhiXin_StartTime.Month,GLOBAL_AiMuZhiXin_StartTime.Day,GLOBAL_AiMuZhiXin_StartTime.Hour,GLOBAL_AiMuZhiXin_StartTime.Minute,GLOBAL_AiMuZhiXin_StartTime.Second)
		local nShiFouEnd = API_DiffDatatime(GLOBAL_AiMuZhiXin_EndTime.Year,GLOBAL_AiMuZhiXin_EndTime.Month,GLOBAL_AiMuZhiXin_EndTime.Day,GLOBAL_AiMuZhiXin_EndTime.Hour,GLOBAL_AiMuZhiXin_EndTime.Minute,GLOBAL_AiMuZhiXin_EndTime.Second)
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			return 0
		end
		if nShiFouStart > 0 then
			API_ActorSendMsg(ActorID,3,'七夕活动未开始，请在活动开始后使用该道具。')
			return 0
		elseif nShiFouStart <= 0 and nShiFouEnd > 0 then
			API_ActorStartSelect(ActorID,'QiXiHuoDong_AiMuZhiXin_PanDuan',15) 
			API_ActorSendMsg(ActorID,3,'请左键点击您想使用的对象')
			return 1
		elseif nShiFouEnd <= 0 then
			if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用天缘水晶') then--销毁玩家身上的物品
				if API_ActorCanAddGoods(ActorID,80498,10,3,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,80498,10,0,'获得10个经验兑换券')
					API_ActorSendMsg(ActorID,8,'获得10个经验兑换券')
				else
					local GoodsName = API_GetGoodsName(80498)
					API_SendActorMailByName(API_GetActorName(ActorID),80498,10,0,'七夕节活动奖励','')
					API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'10个（请到邮箱领取）')
				end
				API_ResponseWrite('<name>鲜花</name>')
				API_ResponseWrite('<text>    七夕节活动已结束，您获得10个经验兑换券。</text><br>')
				API_ResponseWrite('<br><a>关闭</a><br>')
				API_ResponseFlush(ActorID)
				return 1
			end
		end
	elseif GoodsID == 89126 then
		local nShiFouStart = API_DiffDatatime(HLsdzf_PeiHeHuoDong_StartTime.Year,HLsdzf_PeiHeHuoDong_StartTime.Month,HLsdzf_PeiHeHuoDong_StartTime.Day,HLsdzf_PeiHeHuoDong_StartTime.Hour,HLsdzf_PeiHeHuoDong_StartTime.Minute,HLsdzf_PeiHeHuoDong_StartTime.Second)
		local nShiFouEnd = API_DiffDatatime(HLsdzf_PeiHeHuoDong__EndTime.Year,HLsdzf_PeiHeHuoDong__EndTime.Month,HLsdzf_PeiHeHuoDong__EndTime.Day,HLsdzf_PeiHeHuoDong__EndTime.Hour,HLsdzf_PeiHeHuoDong__EndTime.Minute,HLsdzf_PeiHeHuoDong__EndTime.Second)
				
		local NowTime = os.time() 
		if nShiFouStart > 0 then
		--API_Trace('1111111111='..nShiFouStart)
		--if NowTime < 1324310400 then --1324310400  --1294502400
			API_ActorSendMsg(ActorID,3,'圣诞祝福活动未开始，请在活动开始后使用该道具。')
			return 0
		end
		if nShiFouStart <= 0 and nShiFouEnd > 0 then
		--API_Trace('33333333333='..nShiFouEnd)
		--if  NowTime >= 1324310400 and NowTime < 1326038400 then
			API_ActorStartSelect(ActorID,'WYL_ChristmasBlessingGame_User',15) 
			API_ActorSendMsg(ActorID,3,'请左键点击您想祝福的对象')
			return 1
		end
		
		if nShiFouEnd <= 0 then
		--API_Trace('2222222222222='..nShiFouEnd)
		--if NowTime >= 1326038400 then
			if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用圣诞祝福卡') then--销毁玩家身上的物品
				if API_ActorCanAddGoods(ActorID,80498,100,3,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,80498,100,0,'获得100个经验兑换券')
					API_ActorSendMsg(ActorID,8,'获得100个经验兑换券')
				else
					local GoodsName = API_GetGoodsName(80498)
					API_SendActorMailByName(API_GetActorName(ActorID),80498,100,0,'圣诞活动奖励','')
					API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'100个（请到邮箱领取）')
				end
				API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
				API_ResponseWrite('<text>    圣诞祝福活动已结束，您获得100个经验兑换券。</text><br>')
				API_ResponseWrite('<br><a>关闭</a><br>')
				API_ResponseFlush(ActorID)
				return 1
			end
		end
	elseif GoodsID == 89189 then 
		local nShiFouStart = API_DiffDatatime(GLOBAL_AiMuZhiXin_StartTime.Year,GLOBAL_AiMuZhiXin_StartTime.Month,GLOBAL_AiMuZhiXin_StartTime.Day,GLOBAL_AiMuZhiXin_StartTime.Hour,GLOBAL_AiMuZhiXin_StartTime.Minute,GLOBAL_AiMuZhiXin_StartTime.Second)
		local nShiFouEnd = API_DiffDatatime(GLOBAL_AiMuZhiXin_EndTime.Year,GLOBAL_AiMuZhiXin_EndTime.Month,GLOBAL_AiMuZhiXin_EndTime.Day,GLOBAL_AiMuZhiXin_EndTime.Hour,GLOBAL_AiMuZhiXin_EndTime.Minute,GLOBAL_AiMuZhiXin_EndTime.Second)
		if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
			API_ActorSendMsg(ActorID,3,'没有这个道具')
			return 0
		end
		if nShiFouStart > 0 then
			API_ActorSendMsg(ActorID,3,'七夕活动未开始，请在活动开始后使用该道具。')
			return 0
		elseif nShiFouStart <= 0 and nShiFouEnd > 0 then
			API_ActorStartSelect(ActorID,'QiXiHuoDong_JiDan_PanDuan',15) 
			API_ActorSendMsg(ActorID,3,'请左键点击您想使用的对象')
			return 1
		elseif nShiFouEnd <= 0 then
			if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用臭鸡蛋') then--销毁玩家身上的物品
				if API_ActorCanAddGoods(ActorID,80498,10,3,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,80498,10,0,'获得10个经验兑换券')
					API_ActorSendMsg(ActorID,8,'获得10个经验兑换券')
				else
					local GoodsName = API_GetGoodsName(80498)
					API_SendActorMailByName(API_GetActorName(ActorID),80498,10,0,'七夕节活动奖励','')
					API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'10个（请到邮箱领取）')
				end
				API_ResponseWrite('<name>鲜花</name>')
				API_ResponseWrite('<text>    七夕节活动已结束，您获得10个经验兑换券。</text><br>')
				API_ResponseWrite('<br><a>关闭</a><br>')
				API_ResponseFlush(ActorID)
				return 1
			end
		end		
	end
	return 0
end

--爱慕之心判断
function QiXiHuoDong_AiMuZhiXin_PanDuan()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local OtherID = API_RequestGetNumber(3) 
	local ActorSex = API_GetActorSex(OtherID)
--	if ActorID == OtherID then
--		API_ActorSendMsg(ActorID,2,'爱慕之心不能对自己使用')
--		return
--	end
--	if ActorSex == 1 then
--		API_ActorSendMsg(ActorID,2,'爱慕之心只能对女性玩家使用')
--		return
--	end
	if SelectType == 2 then	
		if API_ActorGetGoodsNum(ActorID,89188) > 0 and API_ActorRemoveGoods(ActorID,89188,1,'使用鲜花') then--销毁玩家身上的物品				
			if API_ActorIsOnline(OtherID) then
--				MLB_DaoJuShiYong(OtherID,9)--增加积分接口
				API_ActorSendMsg(OtherID,3,''..API_GetActorName(ActorID)..'对你使用了鲜花')
				API_ActorSendMsg(OtherID,7,''..API_GetActorName(ActorID)..'对你使用了鲜花')
				API_ActorSendMsg(ActorID,3,'你对'..API_GetActorName(OtherID)..'使用了鲜花')
				API_ActorSendMsg(ActorID,7,'你对'..API_GetActorName(OtherID)..'使用了鲜花')
				--周排名
				MLB_DaoJuShiYong(OtherID,25,1,0,0,0)
				--总排名
				MLB_DaoJuShiYong(OtherID,26,1,0,0,0)
				if API_ActorAddStatus(OtherID,989001,0) then
				end
			end
			--爱慕之星使用数量
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[57][4][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[57][4][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[57][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[57][4][LaiYuan] + 1
			end
		end
	else
		API_ActorSendMsg(ActorID,2,'选中目标无效，请重新选择。')
		API_ActorStartSelect(ActorID,'QiXiHuoDong_AiMuZhiXin_PanDuan',15)
	end
end

--圣诞祝福卡判断
function WYL_ChristmasBlessingGame_User()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local OtherID = API_RequestGetNumber(3) 
	local ActorSex = API_GetActorSex(OtherID)
	local GoodsID = 89126
--	if ActorID == OtherID then
--		API_ActorSendMsg(ActorID,3,'圣诞祝福卡不能对自己使用')
--		API_ActorStartSelect(ActorID,'WYL_ChristmasBlessingGame_User',15)
--		return
--	end
	if SelectType == 2 then	
		if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用圣诞祝福卡') then--销毁玩家身上的物品				
			if API_ActorIsOnline(OtherID) then
				--API_ActorSendMsg(OtherID,10,''..API_GetActorName(ActorID)..'把圣诞祝福送给了你')
				--API_ActorSendMsg(ActorID,10,'你把圣诞祝福送给了'..API_GetActorName(OtherID)..'')
				API_ActorSendMsg(OtherID,3,''..API_GetActorName(ActorID)..'对你使用了圣诞祝福')
				API_ActorSendMsg(OtherID,7,''..API_GetActorName(ActorID)..'对你使用了圣诞祝福')
				API_ActorSendMsg(ActorID,3,'你对'..API_GetActorName(OtherID)..'使用了圣诞祝福')
				API_ActorSendMsg(ActorID,7,'你对'..API_GetActorName(OtherID)..'使用了圣诞祝福')
				--周排名
				MLB_DaoJuShiYong(OtherID,22,1,0,0,0)
				--总排名
				--MLB_DaoJuShiYong(OtherID,20,1,0,0,0)
			end
			--爱慕之星使用数量
--~ 			local LaiYuan = API_ActorGetPropNum(ActorID,201)
--~ 			if GLOBAL_FengXiangBiao_DateList[57][4][LaiYuan] == nil then
--~ 				GLOBAL_FengXiangBiao_DateList[57][4][LaiYuan] = 1
--~ 			else
--~ 				GLOBAL_FengXiangBiao_DateList[57][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[57][4][LaiYuan] + 1
--~ 			end
		end
	else
		API_ActorSendMsg(ActorID,3,'选中目标无效，请重新选择。')
		API_ActorStartSelect(ActorID,'WYL_ChristmasBlessingGame_User',15)
	end
end

function QiXiHuoDong_JiDan_PanDuan()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local OtherID = API_RequestGetNumber(3) 
	local ActorSex = API_GetActorSex(OtherID)
	if SelectType == 2 then	
		if API_ActorGetGoodsNum(ActorID,89189) > 0 and API_ActorRemoveGoods(ActorID,89189,1,'使用鸡蛋') then--销毁玩家身上的物品				
			if API_ActorIsOnline(OtherID) then
--				MLB_DaoJuShiYong(OtherID,9)--增加积分接口
				API_ActorSendMsg(OtherID,3,''..API_GetActorName(ActorID)..'对你使用了鸡蛋')
				API_ActorSendMsg(OtherID,7,''..API_GetActorName(ActorID)..'对你使用了鸡蛋')
				API_ActorSendMsg(ActorID,3,'你对'..API_GetActorName(OtherID)..'使用了鸡蛋')
				API_ActorSendMsg(ActorID,7,'你对'..API_GetActorName(OtherID)..'使用了鸡蛋')
				--周排名
				MLB_DaoJuShiYong(OtherID,25,-1,0,0,0)
				--总排名
				MLB_DaoJuShiYong(OtherID,26,-1,0,0,0)
			end
		end
	else
		API_ActorSendMsg(ActorID,2,'选中目标无效，请重新选择。')
		API_ActorStartSelect(ActorID,'QiXiHuoDong_JiDan_PanDuan',15)
	end
end


--七夕怪物
if API_GetServerID() <11 then
	local StartTimeTable = QiXiHuoDong_StartTime
	local EndTimeTable = QiXiHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if QiXiHuoDong_TriggerID ~= nil then
			API_DestroyTriggerG(QiXiHuoDong_TriggerID)
			QiXiHuoDong_TriggerID = API_CreateTimerTriggerG(0,0,60,-1,'QiXiHuoDong_ActTimeFunc')
		else
			QiXiHuoDong_TriggerID = API_CreateTimerTriggerG(0,0,60,-1,'QiXiHuoDong_ActTimeFunc')
		end
	end
end

local QiXiHuoDong_MapList1 = {99,98,101}
local QiXiHuoDong_MapList2 = {101}

if QiXiHuoDong_FastIDlist == nil then 
   QiXiHuoDong_FastIDlist = {}
end

function QiXiHuoDong_ActTimeFunc()
	local StartTimeTable = QiXiHuoDong_StartTime
	local EndTimeTable = QiXiHuoDong_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if API_GetServerID() == 1 then
			if Hour == 19 and Minute >= 30 and math.mod(Minute,5) == 0 then
				API_ActorBroadcastMsg(-1,17,'现在可前往娜纱湿地，落日农庄，月暮草场采集天缘水晶。')
				API_ActorBroadcastMsg(-1,1,'现在可前往娜纱湿地，落日农庄，月暮草场采集天缘水晶。')
				API_ActorBroadcastMsg(-1,7,'现在可前往娜纱湿地，落日农庄，月暮草场采集天缘水晶。')
			end
		end
		if Hour == 19 then
			if math.mod(Minute,5) == 0 and Minute >= 30 then
				for i,v in QiXiHuoDong_MapList1 do
					local RightMapID = API_GetRightMapID(v)
					if API_MapIsValid(RightMapID) then
						for j = 1,100 do
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
								if j <= 50 then
									API_CreateResBoxEx_UID(RightMapID,TileX,TileY,283,1,'水晶',3,0,0,0,180)
								else
									API_CreateResBoxEx_UID(RightMapID,TileX,TileY,285,1,'水晶',3,0,0,0,180)
								end
							end
						end			
					end
				end
				for i,v in QiXiHuoDong_MapList2 do
					local RightMapID = API_GetRightMapID(v)
					if API_MapIsValid(RightMapID) then
						for j = 1,10 do
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
								if j <= 5 then
									API_CreateResBoxEx_UID(RightMapID,TileX,TileY,284,30,'水晶',3,0,0,0,300)
								else
									API_CreateResBoxEx_UID(RightMapID,TileX,TileY,286,30,'水晶',3,0,0,0,300)
								end
							end
						end			
					end
				end
			end
		end
	end
end