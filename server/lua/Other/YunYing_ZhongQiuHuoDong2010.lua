-------------------------------
--文件名:	Scp\Lua\Other\YunYing_ZhongQiuHuoDong2010.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	刘操
--日  期:	2010-9-1
--版  本:	
--描  述:   2010中秋活动
--应  用:  
-------------------------------


--活动时间
local ZhongQiuHuoDong_StartTime = {Year = 2012,Month = 9,Day = 21,Hour = 0,Minute = 0,Second = 0}   -------开始时间
local ZhongQiuHuoDong__EndTime = {Year = 2020,Month = 10,Day = 7,Hour = 23,Minute = 59,Second = 59}   -------开始时间

--月饼模具
local ZhongQiuHuoDong_GoodsTable = {
[1]=88955,
[2]=88956,
}

--变身状态ID
local ZhongQiuHuoDong_StatusIDTable = {
[1] = {ID = 2006038,Name = '黄色小兔子'},
[2] = {ID = 2006039,Name = '粉色小兔子'},
[3] = {ID = 2006040,Name = '蓝色大兔子'},
[4] = {ID = 2006041,Name = '紫色大兔子'},
}

--付费玩家宝箱奖励物品表
local BaoXiang_GoodsTable = {		
	--{GoodsID = 88960,GaiLv1=1,GaiLv2=607136,Num=1,Bind = 2},
	--{GoodsID = 80689,GaiLv1=9392876,GaiLv2=9696444,Num=2,Bind = 2},
	{GoodsID=88960,GaiLv1=1     ,GaiLv2=638810,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=88959,GaiLv1=638811,GaiLv2=958216,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=88957,GaiLv1=958217,GaiLv2=1597027,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=11308,GaiLv1=1597028,GaiLv2=1660909,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=11307,GaiLv1=1660910,GaiLv2=1673686,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=11514,GaiLv1=1673687,GaiLv2=1705627,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=11513,GaiLv1=1705628,GaiLv2=1737568,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=31023,GaiLv1=1737569,GaiLv2=1769509,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=0    ,GaiLv1=1769510,GaiLv2=3898878,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=80383,GaiLv1=3898879,GaiLv2=4324752,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=80381,GaiLv1=4324753,GaiLv2=4750626,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=80384,GaiLv1=4750627,GaiLv2=5176500,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=80382,GaiLv1=5176501,GaiLv2=5602374,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=75   ,GaiLv1=5602375,GaiLv2=5815311,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=40004,GaiLv1=5815312,GaiLv2=6241185,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=40014,GaiLv1=6241186,GaiLv2=6667059,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=40024,GaiLv1=6667060,GaiLv2=7092933,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=40094,GaiLv1=7092934,GaiLv2=7518807,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=80196,GaiLv1=7518808,GaiLv2=7838213,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=250  ,GaiLv1=7838214,GaiLv2=8157619,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=89180,GaiLv1=8157620,GaiLv2=8178913,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=89185,GaiLv1=8178914,GaiLv2=8200207,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=89175,GaiLv1=8200208,GaiLv2=8221501,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=80394,GaiLv1=8221502,GaiLv2=8540907,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=80686,GaiLv1=8540908,GaiLv2=8860313,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=80274,GaiLv1=8860314,GaiLv2=9179719,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=80387,GaiLv1=9179720,GaiLv2=9361200,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=80689,GaiLv1=9361201,GaiLv2=9680606,NumGaiLv=10000,Num=1,Bind = 2},
	{GoodsID=31101,GaiLv1=9680607,GaiLv2=10000000,NumGaiLv=10000,Num=1,Bind = 2},

	
}

--普通玩家宝箱奖励物品表

local PuTongBaoXiang_GoodsTable = {		
	{GoodsID=80697,GaiLv1=1,GaiLv2=1200000,Num=4,Bind = 2},
	{GoodsID=80498,GaiLv1=1200001,GaiLv2=2400001,Num=50,Bind = 2},
	{GoodsID=88957,GaiLv1=2400002,GaiLv2=3600002,Num=1,Bind = 2},
	{GoodsID=80696,GaiLv1=3600003,GaiLv2=4800003,Num=30,Bind = 2},
	{GoodsID=80383,GaiLv1=4800004,GaiLv2=5100004,Num=1,Bind = 2},
	{GoodsID=80381,GaiLv1=5100005,GaiLv2=5400005,Num=1,Bind = 2},
	{GoodsID=80384,GaiLv1=5400006,GaiLv2=5700006,Num=1,Bind = 2},
	{GoodsID=80382,GaiLv1=5700007,GaiLv2=6000007,Num=1,Bind = 2},
	{GoodsID=0,GaiLv1=6000008,GaiLv2=10000000,Num=1,Bind = 2},
}

--月饼状态
local ZhongQiuHuoDong_YueBingXiaoGuo = {
[1] = {StatusID = 817001,Explain = '各类型攻击力增加25点（月饼效果只能存在一个）'},
[2] = {StatusID = 817002,Explain = '各类型防御力增加20点（月饼效果只能存在一个）'},
[3] = {StatusID = 817003,Explain = '移动速度增加5%（月饼效果只能存在一个）'},
[4] = {StatusID = 817004,Explain = '暴击抵抗增加10%（月饼效果只能存在一个）'},
[5] = {StatusID = 817005,Explain = '各类型攻击暴击增加100点（月饼效果只能存在一个）'},
[6] = {StatusID = 817006,Explain = '反击概率增加10%（月饼效果只能存在一个）'},
[7] = {StatusID = 817007,Explain = '每3秒恢复25点生命和3点能量（月饼效果只能存在一个）'},
}

local YueGongBaoKu_DiTuDingYi = {
	[1] = {
			NPC = {
					--传送门
					{NPCID = 11607,TileX = 60,TileY = 42,Direct = 3,AIInfoID = nil,Camp = nil,},
				  },
			BAOXIANG = {
					--宝箱1
					{NPCID = {[0] = 12323,[1] = 12259,},TileX = 49,TileY = 61,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱2
					{NPCID = {[0] = 12323,[1] = 12259,},TileX = 49,TileY = 67,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱3
					{NPCID = {[0] = 12323,[1] = 12259,},TileX = 49,TileY = 73,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱4
					{NPCID = {[0] = 12323,[1] = 12259,},TileX = 49,TileY = 79,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱5
					{NPCID = {[0] = 12323,[1] = 12259,},TileX = 55,TileY = 79,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱6
					{NPCID = {[0] = 12323,[1] = 12259,},TileX = 61,TileY = 79,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱7
					{NPCID = {[0] = 12323,[1] = 12259,},TileX = 67,TileY = 79,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱8
					{NPCID = {[0] = 12323,[1] = 12259,},TileX = 67,TileY = 73,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱9
					{NPCID = {[0] = 12323,[1] = 12259,},TileX = 67,TileY = 67,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱10
					{NPCID = {[0] = 12323,[1] = 12259,},TileX = 67,TileY = 61,Direct = 1,AIInfoID = nil,Camp = nil,},			
					},
			},
}

--月宫宝库怪物ID
local localtable_YueGongBaoKu_Monster = {
[1] = {730011,730012,730013},
[2] = {730014,730015,730016}
}

local localtable_YueGongBaoKu_Number = {
	[1] = 6,
	[2] = 8,
	[3] = 10,
	[4] = 12,
	[5] = 14,
}

local BingPiYueBing_PetExpTable = {
[1] = 10560,
[2] = 10560,
[3] = 10560,
[4] = 10560,
[5] = 10560,
[6] = 10560,
[7] = 10560,
[8] = 10560,
[9] = 10560,
[10] = 10560,
[11] = 13200,
[12] = 14960,
[13] = 16720,
[14] = 18480,
[15] = 20240,
[16] = 22000,
[17] = 23760,
[18] = 25520,
[19] = 27280,
[20] = 29040,
[21] = 34320,
[22] = 36960,
[23] = 39600,
[24] = 42240,
[25] = 44880,
[26] = 79200,
[27] = 84480,
[28] = 89760,
[29] = 95040,
[30] = 100320,
[31] = 124800,
[32] = 131040,
[33] = 137280,
[34] = 143520,
[35] = 149760,
[36] = 168480,
[37] = 176280,
[38] = 184080,
[39] = 191880,
[40] = 199680,
[41] = 223080,
[42] = 232440,
[43] = 241800,
[44] = 251160,
[45] = 260520,
[46] = 269880,
[47] = 279240,
[48] = 288600,
[49] = 297960,
[50] = 307320,
[51] = 307320,
[52] = 307320,
[53] = 307320,
[54] = 307320,
[55] = 307320,
}

local YueBingMuJuGetSave = 30210

--上线回调
function YueBingMuJu_OnLogin(ActorID)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end	
	local nShiFouStart = API_DiffDatatime(ZhongQiuHuoDong_StartTime.Year,ZhongQiuHuoDong_StartTime.Month,ZhongQiuHuoDong_StartTime.Day,ZhongQiuHuoDong_StartTime.Hour,ZhongQiuHuoDong_StartTime.Minute,ZhongQiuHuoDong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(ZhongQiuHuoDong__EndTime.Year,ZhongQiuHuoDong__EndTime.Month,ZhongQiuHuoDong__EndTime.Day,ZhongQiuHuoDong__EndTime.Hour,ZhongQiuHuoDong__EndTime.Minute,ZhongQiuHuoDong__EndTime.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		local BeginTime = ZhongQiuHuoDong_StartTime.Year * 10000 + ZhongQiuHuoDong_StartTime.Month * 100 + ZhongQiuHuoDong_StartTime.Day
		local GetTime = API_VarDataGetNumber(ActorID,1,YueBingMuJuGetSave)
		if GetTime < BeginTime then
			API_VarDataSetNumber(ActorID,1,YueBingMuJuGetSave,BeginTime)
			API_VarDataSetNumber(ActorID,1,18439,0)
			for i = 1,2 do
				local YueBingMuJu_GoodsID = ZhongQiuHuoDong_GoodsTable[i]
				API_SendActorMailByName(API_GetActorName(ActorID),YueBingMuJu_GoodsID,1,3,'中秋活动赠送','')
				API_ActorSendMsg(ActorID,17,'您的邮箱中获得“'..API_GetGoodsName(YueBingMuJu_GoodsID)..'”1个，请注意查收')
			end
		end
	end
end

--月宫飞符使用
function YueGongFeiFuUse(ActorID,GoodsID)
	local MapID = API_GetActorMapID(ActorID) 
	local StaticMapID = API_GetStaticMapID(MapID)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local TeamID = API_GetTeamID(ActorID)--获得玩家所在队伍的ID
	if TeamID > 0 then
		local NowTime = os.time()
		if NowTime > API_VarDataGetNumber(ActorID,0,30222) then
			local NextTime = NowTime + 5
			local TeamSize = API_GetTeamSize(TeamID)--获得队伍人数	
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)--获得队伍成员ID
				API_VarDataSetNumber(TeamActorID,0,30222,NextTime)
			end
		else
			API_ActorSendMsg(ActorID,3,'使用失败，请重新尝试。')
			return 0
		end
	end

	
	if MapID == StaticMapID then
		API_ResponseWrite('<name>月宫飞符</name>')
		API_ResponseWrite('<text>进入月宫宝库开启宝箱可获得丰富的奖励（宝箱每10秒刷新一次），更有几率获得月兔披风，月宫男女头饰，粉红兔宝宝卡等物品，使用月宫飞符需要消耗300点券。您可以组队携带队友一同进入，队友无需消耗任何道具以及点券。</text><br>')
		API_ResponseWrite('<br><a href="YueGongBaoKu_ShiFouStater?1=100">我要进入</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_ResponseWrite('<name>月宫飞符</name>')
		API_ResponseWrite('<text>月宫飞符使用失败！亲爱的玩家，当前地图不允许使用该物品，请切换地图尝试使用。</text><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return 0		
	end
end

function YueGongBaoKu_ShiFouStater()
	local ActorID = API_RequestGetActorID()
	local Point = API_ActorGetPropNum(ActorID,183)
	local NeedPoint = 300
	local TeamID = API_GetTeamID(ActorID)--获得玩家所在队伍的ID
	local MapID = API_GetActorMapID(ActorID) 
	if TeamID > 0 then
		local TeamSize = API_GetTeamSize(TeamID)--获得队伍人数	
		for i = 1,TeamSize do
			local TeamActorID = API_GetTeamMem(TeamID,i)--获得队伍成员ID
			if ActorID == TeamActorID then
				if Point < NeedPoint then
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text>您的点券不够，无法进入月宫宝库！</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)
					return 						
				end
			end
			if not API_ActorIsOnline(TeamActorID) then
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>队伍中有玩家不在线或不在同一地图无法进入！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return 
			end
			if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>快递中，无法进入月宫宝库！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return 
			end
			if API_ActorFindStatus(TeamActorID,519) then
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>摆摊中，无法进入月宫宝库！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return 
			end
			if API_ActorIsDying(TeamActorID) then
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>死亡，无法进入月宫宝库！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return 
			end
			if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>在公交车上无法进入月宫宝库！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return
			end
			if ActorID ~= TeamActorID then
				if MapID ~= API_GetActorMapID(TeamActorID)  then
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>不在同一场景中。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)
					return				
				end
			end
		end
	else
		if Point < NeedPoint then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>您的点券不够，无法进入月宫宝库！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return
		end
		if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>快递中，无法进入月宫宝库！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 
		end
		if API_ActorFindStatus(ActorID,519) then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>摆摊中，无法进入月宫宝库！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 
		end
		if API_ActorIsDying(ActorID) then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>角色死亡，无法进入月宫宝库！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 
		end
		if API_VarDataGetNumber(ActorID,1,11816) > 0 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>在公交车上无法进入月宫宝库！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return
		end
	end
		YueGongBaoKu_Create(ActorID)	
end

if YueGongBaoKu_MapInfoTable == nil then
	YueGongBaoKu_MapInfoTable = {}
end

if YueGongBaoKu_ActorInfoTable == nil then
	YueGongBaoKu_ActorInfoTable = {}
end

if YueGongBaoKu_BaoXiangFastID == nil then
	YueGongBaoKu_BaoXiangFastID = {}
end

if YueGongBaoKu_BaoXiangTileX == nil then
	YueGongBaoKu_BaoXiangTileX = {}
end

if YueGongBaoKu_BaoXiangTileY == nil then
	YueGongBaoKu_BaoXiangTileY = {}
end

function YueGongBaoKu_Create(ActorID)
	local StaticMapID = 2012
	local ObjectMapID = API_CreateEctype(StaticMapID,0)
	local CitadelTable = YueGongBaoKu_DiTuDingYi[1]
	YueGongBaoKu_MapInfoTable[ObjectMapID] = {}
	YueGongBaoKu_ActorInfoTable[ObjectMapID] = {}
	YueGongBaoKu_MapInfoTable[ObjectMapID].number1 = 0
	YueGongBaoKu_MapInfoTable[ObjectMapID].number2 = 0
	YueGongBaoKu_MapInfoTable[ObjectMapID].TimeTriggerGID = 0
	YueGongBaoKu_MapInfoTable[ObjectMapID].CloseQueRen = 0
	YueGongBaoKu_MapInfoTable[ObjectMapID].Time = 300
	YueGongBaoKu_MapInfoTable[ObjectMapID].QueRenTime = 20
	YueGongBaoKu_MapInfoTable[ObjectMapID].TimeStart = 0
	YueGongBaoKu_ActorInfoTable[ObjectMapID].ActorID = 0
	YueGongBaoKu_BaoXiangFastID[ObjectMapID] = {}
	YueGongBaoKu_BaoXiangTileX[ObjectMapID] = {}
	YueGongBaoKu_BaoXiangTileY[ObjectMapID] = {}

	--判断队伍中等级最高的玩家
	local GoToMapNum = 0
	local ActorExpLv1 = 0
	local ActorExpLv2 = 0
	local MapID = API_GetActorMapID(ActorID)
	local TeamID = API_GetTeamID(ActorID)
	if TeamID > 0 then
		local TeamSize = API_GetTeamSize(TeamID)
		for i = 1,TeamSize do
			local TeamActorID = API_GetTeamMem(TeamID,i)
			if API_ActorIsOnline(TeamActorID) then
				local Point = API_ActorGetPropNum(TeamActorID,183)			
				local NeedPoint = 300
				--if Point >= NeedPoint then
					if i == 1 then
						ActorExpLv1 = API_GetActorExpLevel(TeamActorID)
					end
						ActorExpLv2 = API_GetActorExpLevel(TeamActorID)
					if ActorExpLv1 < ActorExpLv2 then
						ActorExpLv1 = ActorExpLv2
					end	
					GoToMapNum = GoToMapNum + 1
				--end
			end			
		end
	else
		ActorExpLv1 = API_GetActorExpLevel(ActorID)
		GoToMapNum = 1
	end

	--设置难度
	local NanDu = 1
	if ActorExpLv1 <= 25 then
		NanDu = 1
	elseif ActorExpLv1 <= 40 then
		NanDu = 2
	elseif ActorExpLv1 <= 65 then
		NanDu = 3
	end	
	
	if GoToMapNum == 0 then	
		GoToMapNum = 1
	end
	
	local MonsterNum = localtable_YueGongBaoKu_Number[GoToMapNum]
	--创建怪物
	for i = 1, MonsterNum do
		local a = math.random(2)
		local MonsterID = localtable_YueGongBaoKu_Monster[a][NanDu]
		local TileX = 57
		local TileY = 70
		local FastID = API_CreateMonster(ObjectMapID,MonsterID,TileX,TileY,4,0,2)
	end	
		
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
	
	--创建宝箱
	if type(CitadelTable.BAOXIANG) == 'table' then
		for j = 1,table.getn(CitadelTable.BAOXIANG) do
			 local NPCTable = CitadelTable.BAOXIANG[j]
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
			YueGongBaoKu_MapInfoTable[ObjectMapID].number1 = YueGongBaoKu_MapInfoTable[ObjectMapID].number1 + 1
			YueGongBaoKu_BaoXiangFastID[ObjectMapID][YueGongBaoKu_MapInfoTable[ObjectMapID].number1] = FastID
			YueGongBaoKu_BaoXiangTileX[ObjectMapID][YueGongBaoKu_MapInfoTable[ObjectMapID].number1] = NPCTable.TileX
			YueGongBaoKu_BaoXiangTileY[ObjectMapID][YueGongBaoKu_MapInfoTable[ObjectMapID].number1] = NPCTable.TileY
		end
	end	
	YueGongBaoKu_PlayGotoMap(ObjectMapID,ActorID)
	--YueGongBaoKu_QueRen(ObjectMapID,ActorID)
end

--月宫宝库确认流程
function YueGongBaoKu_QueRen(ObjectMapID,ActorID)
	if API_ActorIsOnline(ActorID) then
		--判断组队
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if TeamActorID ~= ActorID then
					API_VarDataSetNumber(TeamActorID,1,30218,0)
					API_VarDataSetNumber(TeamActorID,1,30219,0)
					API_VarDataSetNumber(TeamActorID,1,30220,0)
				else
					API_VarDataSetNumber(ActorID,1,30219,0)				
				end
			end
			local TimeTriggerGID = API_CreateTimerTriggerG(ObjectMapID,ActorID,1,22,'YueGongBaoKu_CloseQueRen')
			YueGongBaoKu_MapInfoTable[ObjectMapID].CloseQueRen = TimeTriggerGID
		else
			YueGongBaoKu_PlayGotoMap(ObjectMapID,ActorID)
		end
	end
end

function YueGongBaoKu_QueRen_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local ObjectMapID = API_RequestGetNumber(2)
	if SelectItem == 100 then
		YueGongBaoKu_MapInfoTable[ObjectMapID].number2 = YueGongBaoKu_MapInfoTable[ObjectMapID].number2 + 1
		YueGongBaoKu_ActorInfoTable[ObjectMapID][YueGongBaoKu_MapInfoTable[ObjectMapID].number2] = ActorID
		API_VarDataSetNumber(ActorID,1,30218,1)	
	end
end

function YueGongBaoKu_CloseQueRen(ObjectMapID,ActorID)
	YueGongBaoKu_MapInfoTable[ObjectMapID].QueRenTime = YueGongBaoKu_MapInfoTable[ObjectMapID].QueRenTime - 1
	if YueGongBaoKu_MapInfoTable[ObjectMapID].QueRenTime <= 0 then
			--判断组队
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				--if TeamActorID ~= ActorID then
					API_ResponseWrite('<name>月宫飞符</name>')
					API_ResponseWrite('<win rect="2000,100,400,300"></win>')
					API_ResponseWrite('<text>进入时间已结束</text><br>')
					API_ResponseWrite('<br><a>关闭</a><br>')
					API_ResponseFlush(TeamActorID)
				--end
			end
		end
		local TriggerGID = YueGongBaoKu_MapInfoTable[ObjectMapID].CloseQueRen
		API_DestroyTriggerG(TriggerGID)
		YueGongBaoKu_PlayGotoMap(ObjectMapID,ActorID)
	else
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if TeamActorID ~= ActorID then
					if API_VarDataGetNumber(TeamActorID,1,30218) == 1 then
						if API_VarDataGetNumber(TeamActorID,1,30219) ~= 1 then
							API_ResponseWrite('<name>月宫飞符</name>')
							API_ResponseWrite('<text>请稍等'..YueGongBaoKu_MapInfoTable[ObjectMapID].QueRenTime..'秒后进入月宫宝库</text><br>')
							API_ResponseWrite('<br><a href="YueGongBaoKu_QuXiao?">关闭</a><br>')
							API_ResponseFlush(TeamActorID)	
						end
					else
						if API_VarDataGetNumber(TeamActorID,1,30219) ~= 1 then
							API_ResponseWrite('<name>月宫飞符</name>')
							API_ResponseWrite('<text>进入月宫宝库'..YueGongBaoKu_MapInfoTable[ObjectMapID].QueRenTime..'秒后结束</text><br>')
							API_ResponseWrite('<text>您的队友使用月宫飞符，您愿意与他（她）一同进入月宫宝库吗？进入月宫宝库需要消耗300点券</text><br>')
							API_ResponseWrite('<br><a href="YueGongBaoKu_QueRen_Title?1=100&2='..ObjectMapID..'">进入</a><br>')
							API_ResponseWrite('<br><a href="YueGongBaoKu_QuXiao?">关闭</a><br>')
							API_ResponseFlush(TeamActorID)
						end
					end
				else
					if API_VarDataGetNumber(TeamActorID,1,30219) ~= 1 then
						API_ResponseWrite('<name>月宫飞符</name>')
						API_ResponseWrite('<text>请稍等'..YueGongBaoKu_MapInfoTable[ObjectMapID].QueRenTime..'秒后进入月宫宝库</text><br>')
						API_ResponseWrite('<br><a href="YueGongBaoKu_QuXiao?">关闭</a><br>')
						API_ResponseFlush(TeamActorID)
					end
				end
			end
		end
	end
end

function YueGongBaoKu_QuXiao()
	local ActorID = API_RequestGetActorID()
	API_VarDataSetNumber(ActorID,1,30219,1)
end

--时间回调函数
function YueGongBaoKu_Main_TimerTriggerCallFunc(ObjectMapID,ActorID)
	YueGongBaoKu_MapInfoTable[ObjectMapID].Time = YueGongBaoKu_MapInfoTable[ObjectMapID].Time - 1
	local YueGongBaoKuTime = '剩余时间'.. YueGongBaoKu_MapInfoTable[ObjectMapID].Time ..'秒\n'
	if YueGongBaoKu_MapInfoTable[ObjectMapID].Time > 0 then
		API_ActorBroadcastMsg(ObjectMapID,4,YueGongBaoKuTime)
		if YueGongBaoKu_MapInfoTable[ObjectMapID].Time <= 30 then
			if YueGongBaoKu_MapInfoTable[ObjectMapID].Time == 30 or
			YueGongBaoKu_MapInfoTable[ObjectMapID].Time == 20 or
			YueGongBaoKu_MapInfoTable[ObjectMapID].Time == 10 then
				API_ActorBroadcastMsgEx(ObjectMapID,-1,0,8,''..YueGongBaoKu_MapInfoTable[ObjectMapID].Time..'秒后月宫宝库即将关闭，到时所有宝箱都将消失，请抓紧时间开启宝箱。')
			end
		end
	else
		API_ActorBroadcastMsg(ObjectMapID,4,'时间已到')
	end
	
	YueGongBaoKu_MapInfoTable[ObjectMapID].TimeStart = YueGongBaoKu_MapInfoTable[ObjectMapID].TimeStart + 1
	if YueGongBaoKu_MapInfoTable[ObjectMapID].Time > 0 then
		if math.mod(YueGongBaoKu_MapInfoTable[ObjectMapID].TimeStart,10) == 0 then
			for i = 1,table.getn(YueGongBaoKu_BaoXiangFastID[ObjectMapID]) do
				local MonsterID = API_GetMonsterID(YueGongBaoKu_BaoXiangFastID[ObjectMapID][i])
				if MonsterID <= 0 then
					local MonsterID = 12323
					local TileX = YueGongBaoKu_BaoXiangTileX[ObjectMapID][i]
					local TileY = YueGongBaoKu_BaoXiangTileY[ObjectMapID][i]
					if API_MapIsValid(ObjectMapID) then
						local FastID = API_CreateMonster(ObjectMapID,MonsterID,TileX,TileY,4,0,2)
						YueGongBaoKu_BaoXiangFastID[ObjectMapID][i] = FastID
					end
				end		
			end
		end
	end
	
    --时间结束	
	if YueGongBaoKu_MapInfoTable[ObjectMapID].Time == 0 then
		API_CreateTimerTriggerG(ObjectMapID,0,5,1,'YueGongBaoKu_Close')
	end
end

--关闭副本
function YueGongBaoKu_Close(MapID,Param2)
	for i = 1,table.getn(YueGongBaoKu_BaoXiangFastID[MapID]) do
	    local MonsterID = API_GetMonsterID(YueGongBaoKu_BaoXiangFastID[MapID][i])
		if MonsterID > 0 then
			API_DestroyMonster(YueGongBaoKu_BaoXiangFastID[MapID][i])
		end
	end
	local TriggerID = YueGongBaoKu_MapInfoTable[MapID].TimeTriggerGID
	API_DestroyTriggerG(TriggerID)
end

--传送玩家进副本
function YueGongBaoKu_PlayGotoMap(ObjectMapID,ActorID)
	local TileX=60
	local TileY=47
	local NeedPoint = 300
	local Point = API_ActorGetPropNum(ActorID,183)
	local GoodsID = 88961
	local MapID = API_GetActorMapID(ActorID)
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用月宫飞符') then--销毁玩家身上的物品
		API_ActorSendMsg(ActorID,3,'成功扣除月宫飞符。')
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		if GLOBAL_FengXiangBiao_DateList[58][5][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[58][5][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[58][5][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][5][LaiYuan] + 1
		end
	else
		API_ActorSendMsg(ActorID,3,'扣除月宫飞符失败。')
		return
	end
	if API_UsePoint(ActorID,3,88961,1,NeedPoint) == 0 then--判断扣除点券是否成功
		API_ActorGoToMap(ActorID,ObjectMapID,TileX,TileY)
		local TriggerID1 = API_VarDataGetNumber(ActorID,1,30211)
		local TriggerID2 = API_VarDataGetNumber(ActorID,1,30216)
		API_DestroyTrigger(ActorID,-1,TriggerID1)
		API_DestroyTrigger(ActorID,-1,TriggerID2)
	end
	--保存扣钱了的玩家	
	YueGongBaoKu_ActorInfoTable[ObjectMapID].ActorID = ActorID
	if API_ActorIsOnline(ActorID) then
		--判断组队
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if TeamActorID ~= ActorID then
					if MapID == API_GetActorMapID(TeamActorID) then
						API_ActorGoToMap(TeamActorID,ObjectMapID,TileX,TileY)
						local TriggerID1 = API_VarDataGetNumber(TeamActorID,1,30211)
						local TriggerID2 = API_VarDataGetNumber(TeamActorID,1,30216)
						API_DestroyTrigger(TeamActorID,-1,TriggerID1)
						API_DestroyTrigger(TeamActorID,-1,TriggerID2)
					end
				end
			end
		end
	end
	API_ActorBroadcastMsgEx(ObjectMapID,-1,0,8,'300秒后月宫宝库即将关闭，到时所有宝箱都将消失，请抓紧时间开启宝箱。')

	--创建时间触发器
	local TimeTriggerGID = API_CreateTimerTriggerG(ObjectMapID,ActorID,1,-1,'YueGongBaoKu_Main_TimerTriggerCallFunc')
	YueGongBaoKu_MapInfoTable[ObjectMapID].TimeTriggerGID = TimeTriggerGID
--	for i = 1,table.getn(YueGongBaoKu_ActorInfoTable[ObjectMapID]) do
--		TeamActorID = YueGongBaoKu_ActorInfoTable[ObjectMapID][i]
--		if MapID == API_GetActorMapID(TeamActorID) then
--			local Point = API_ActorGetPropNum(TeamActorID,183)
--			if Point < NeedPoint then
--				API_ResponseWrite('<name></name>')
--				API_ResponseWrite('<br><text>您的点券不够，无法进入月宫宝库！</text><br>')
--				API_ResponseWrite('<br><a>确定</a><br>')
--				API_ResponseFlush(TeamActorID)
--				API_VarDataSetNumber(TeamActorID,1,30220,1)
--			end
--			if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
--				API_ResponseWrite('<name></name>')
--				API_ResponseWrite('<br><text>快递中，无法进入月宫宝库！</text><br>')
--				API_ResponseWrite('<br><a>确定</a><br>')
--				API_ResponseFlush(TeamActorID)
--				API_VarDataSetNumber(TeamActorID,1,30220,1)
--			end
--			if API_ActorFindStatus(TeamActorID,519) then
--				API_ResponseWrite('<name></name>')
--				API_ResponseWrite('<br><text>摆摊中，无法进入月宫宝库！</text><br>')
--				API_ResponseWrite('<br><a>确定</a><br>')
--				API_ResponseFlush(TeamActorID)
--				API_VarDataSetNumber(TeamActorID,1,30220,1)
--			end
--			if API_ActorIsDying(TeamActorID) then
--				API_ResponseWrite('<name></name>')
--				API_ResponseWrite('<br><text>角色死亡，无法进入月宫宝库！</text><br>')
--				API_ResponseWrite('<br><a>确定</a><br>')
--				API_ResponseFlush(TeamActorID)
--				API_VarDataSetNumber(TeamActorID,1,30220,1)
--			end
--			if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
--				API_ResponseWrite('<name></name>')
--				API_ResponseWrite('<br><text>在公交车上无法进入月宫宝库！</text><br>')
--				API_ResponseWrite('<br><a>确定</a><br>')
--				API_ResponseFlush(TeamActorID)
--				API_VarDataSetNumber(TeamActorID,1,30220,1)
--			end
--			if API_VarDataGetNumber(TeamActorID,1,30220) ~= 1 then
--				if API_UsePoint(TeamActorID,3,88961,1,NeedPoint) == 0 then--判断扣除点券是否成功
--					API_ActorGoToMap(TeamActorID,ObjectMapID,TileX,TileY)
--					local TriggerID1 = API_VarDataGetNumber(TeamActorID,1,30211)
--					local TriggerID2 = API_VarDataGetNumber(TeamActorID,1,30216)
--					API_DestroyTrigger(TeamActorID,-1,TriggerID1)
--					API_DestroyTrigger(TeamActorID,-1,TriggerID2)
--				end
--			end
--		end
--	end
end

local KAIXIANGZHUANGTAI = 30213
local BAOXIANGFastID = 30214

--开宝箱
function YueGongBaoKu_KaiBaoXiang(ActorID,NPCID)
	API_ResponseClear()
	API_ResponseEnd()
	local ActorID = ActorID or API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)--获得玩家当前所在地图ID
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)

	if NPCID ~= 12323 then
		return
	end
	if API_GetStaticMapID(MapID) ~= 2012 then
		return
	end
	local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
	local PosX,PosY = PublicFun_GetMonsterPosXY(NPCFastID)

	if PublicFun_AccountDistance(TileX,TileY,PosX,PosY) < 3 then
		local KaiXiangInfo = API_VarDataGetNumber(ActorID,0,KAIXIANGZHUANGTAI)
		if KaiXiangInfo ~= 0 then
			API_ActorSendMsg(ActorID,3,'正在打开中，请稍后')
			API_ResponseEnd()
			API_ResponseClear()
		else
			API_VarDataSetNumber(ActorID,0,BAOXIANGFastID,NPCFastID)
			local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
			KaiXiangInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
			API_VarDataSetNumber(ActorID,0,KAIXIANGZHUANGTAI,KaiXiangInfo)	
			local YueGongBaoKu_DuTiaoTimerTrigge = API_CreateTimerTrigger(ActorID,1,7,-1,'YueGongBaoKu_DuTiao_TimerTriggerCallFunc')
			API_VarDataSetNumber(ActorID,1,30216,YueGongBaoKu_DuTiaoTimerTrigge)
			API_ActorShowProcess(ActorID,5000,400,500,'开宝箱')
			API_ResponseEnd()
			API_ResponseClear()
		end
	else
		API_ActorSendMsg(ActorID,3,'距离宝箱太远，靠近点再试试')
		API_ResponseEnd()
		API_ResponseClear()
	end
end


--移动监视触发器
--function YueGongBaoKu_MoveTo_TimerTriggerCallFunc(ActorID,lTaskID)
--	local NPCFastID = API_VarDataGetNumber(ActorID,0,BAOXIANGFastID)
--	local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
--	local PosX,PosY = PublicFun_GetMonsterPosXY(NPCFastID)
--	--if TileX ~= BackTileX or TileY ~= BackTileY then
--	if PublicFun_AccountDistance(TileX,TileY,PosX,PosY) <= 3 then
--		API_ActorStopMove(ActorID)
--		local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
--		KaiXiangInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
--		API_VarDataSetNumber(ActorID,0,KAIXIANGZHUANGTAI,KaiXiangInfo)	
--		local ActorMoveTo_TimerTrigge = API_VarDataGetNumber(ActorID,1,30215)
--		API_DestroyTrigger(ActorID,-1,ActorMoveTo_TimerTrigge)
--		API_ActorShowProcess(ActorID,5000,400,500,'开宝箱')
--		local YueGongBaoKu_DuTiaoTimerTrigge = API_CreateTimerTrigger(ActorID,1,-1,-1,'YueGongBaoKu_DuTiao_TimerTriggerCallFunc')
--		API_VarDataSetNumber(ActorID,1,30216,YueGongBaoKu_DuTiaoTimerTrigge)
--	end	
--end

--开宝箱读条时间回调
function YueGongBaoKu_DuTiao_TimerTriggerCallFunc(ActorID,lTaskID)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,BAOXIANGFastID)
	local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
	local KaiXiangInfo = API_VarDataGetNumber(ActorID,0,KAIXIANGZHUANGTAI)
	local BackTileXYandTime = math.mod(KaiXiangInfo,100000000)
	local BackTileYandTime = math.mod(BackTileXYandTime,100000)
	local BackTileX = math.floor(BackTileXYandTime/100000)
	local BackTileY = math.floor(BackTileYandTime/100)
	local Time = math.mod(BackTileYandTime,100)
--	if API_ActorGetPropNum(ActorID,180) == 1 then
--		local YueGongBaoKu_DuTiaoTimerTrigge = API_VarDataGetNumber(ActorID,1,30216)
--		API_DestroyTrigger(ActorID,-1,YueGongBaoKu_DuTiaoTimerTrigge)
--		API_VarDataSetNumber(ActorID,0,KAIXIANGZHUANGTAI,0)	
--		API_ActorShowProcess(ActorID,0,400,500,'开宝箱')
--		return
--	end
	if API_ActorIsOnline(ActorID) then
		if API_GetMonsterID(NPCFastID) <= 0 then
			local ObjectMapID = API_GetActorMapID(ActorID)
			local StaticMapID = API_GetStaticMapID(ObjectMapID)
			local YueGongBaoKu_DuTiaoTimerTrigge = API_VarDataGetNumber(ActorID,1,30216)
			API_DestroyTrigger(ActorID,-1,YueGongBaoKu_DuTiaoTimerTrigge)	
			API_VarDataSetNumber(ActorID,0,KAIXIANGZHUANGTAI,0)	
			API_ActorShowProcess(ActorID,0,400,500,'开宝箱')
			if StaticMapID == 2012 then
				if YueGongBaoKu_MapInfoTable[ObjectMapID].Time <= 0 then
					API_ActorSendMsg(ActorID,3,'打开失败，月宫宝库已关闭')
				else
					API_ActorSendMsg(ActorID,3,'打开失败，宝箱已被其他玩家开启')
				end
			end
			return
		end
		if API_ActorIsDying(ActorID) then
			local YueGongBaoKu_DuTiaoTimerTrigge = API_VarDataGetNumber(ActorID,1,30216)
			API_DestroyTrigger(ActorID,-1,YueGongBaoKu_DuTiaoTimerTrigge)	
			API_VarDataSetNumber(ActorID,0,KAIXIANGZHUANGTAI,0)	
			API_ActorShowProcess(ActorID,0,400,500,'开宝箱')
			API_ActorSendMsg(ActorID,3,'人物死亡，打开失败')			
			return
		end
		if TileX ~= BackTileX or TileY ~= BackTileY then
			local YueGongBaoKu_DuTiaoTimerTrigge = API_VarDataGetNumber(ActorID,1,30216)
			API_DestroyTrigger(ActorID,-1,YueGongBaoKu_DuTiaoTimerTrigge)	
			API_VarDataSetNumber(ActorID,0,KAIXIANGZHUANGTAI,0)	
			API_ActorShowProcess(ActorID,0,400,500,'开宝箱')
			API_ActorSendMsg(ActorID,3,'人物移动，打开失败')
			return
		end
		if Time >= 5 then
			local YueGongBaoKu_DuTiaoTimerTrigge = API_VarDataGetNumber(ActorID,1,30216)
			API_DestroyTrigger(ActorID,-1,YueGongBaoKu_DuTiaoTimerTrigge)
			API_VarDataSetNumber(ActorID,0,KAIXIANGZHUANGTAI,0)	
			API_ActorShowProcess(ActorID,0,400,500,'开宝箱')
			YueGongBaoKu_KaiBaoXiang_TimerTriggerCallFunc(ActorID)
		else
			Time = Time + 1
			KaiXiangInfo = 1 * 100000000 + TileX * 100000 + TileY * 100 + Time
			API_VarDataSetNumber(ActorID,0,KAIXIANGZHUANGTAI,KaiXiangInfo)		
		end
	end
end

local YueGongBaoKu_WuPingShangXian = {
[11308] = 3,
[11307] = 2,
[11514] = 5,
[11513] = 5,
[31023] = 5,
[89180] = 1,
[89185] = 1,
[89175] = 1,
}

if API_GetServerID() == 1 then
	local nShiFouStart = API_DiffDatatime(ZhongQiuHuoDong_StartTime.Year,ZhongQiuHuoDong_StartTime.Month,ZhongQiuHuoDong_StartTime.Day,ZhongQiuHuoDong_StartTime.Hour,ZhongQiuHuoDong_StartTime.Minute,ZhongQiuHuoDong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(ZhongQiuHuoDong__EndTime.Year,ZhongQiuHuoDong__EndTime.Month,ZhongQiuHuoDong__EndTime.Day,ZhongQiuHuoDong__EndTime.Hour,ZhongQiuHuoDong__EndTime.Minute,ZhongQiuHuoDong__EndTime.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		--创建时间触发器
		if YueGongBaoKu_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(YueGongBaoKu_TimeTriggerGID)
		end
		YueGongBaoKu_TimeTriggerGID = API_CreateTimerTriggerG(0,0,60,-1,'YueGongBaoKu_ShuJuQingChu')
	else
		if YueGongBaoKu_TimeTriggerGID ~= nil then
			API_DestroyTriggerG(YueGongBaoKu_TimeTriggerGID)
		end
	end
end

--清除全局交互数据
function YueGongBaoKu_ShuJuQingChu(Param1,Param2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.time()
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6010,1,7) and API_GetServerID() == 1 then
		API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,2,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,3,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,4,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,5,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,6,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,10,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,8,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,9,0)
		local NowTime = os.date("*t", os.time()) 
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 11 
		NowTime.min = 59 
		NowTime.sec = 59 
		local NightTime = os.time(NowTime)
		local NextQingChuTime = NightTime + 86400 + 1
		API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,7,NextQingChuTime)
	end
end

--开宝箱奖励
function YueGongBaoKu_KaiBaoXiang_TimerTriggerCallFunc(ActorID,lTaskID)
	local StatusID1 = 999001--宝箱爆炸
	local StatusID2 = 998001--爆炸眩晕
	local NPCFastID = API_VarDataGetNumber(ActorID,0,BAOXIANGFastID)
	local TriggerID = API_VarDataGetNumber(ActorID,1,30211)
	local PosX,PosY = PublicFun_GetMonsterPosXY(NPCFastID)
	local AgoBaoXiangInfo = API_VarDataGetNumber(ActorID,0,30215)
	local BackTileXYandTime = math.mod(AgoBaoXiangInfo,100000000)
	local BackTileYandTime = math.mod(BackTileXYandTime,100000)
	local BackTileX = math.floor(BackTileXYandTime/100000)
	local BackTileY = math.floor(BackTileYandTime/100)	
	API_DestroyTrigger(ActorID,-1,TriggerID)
	if NPCFastID ~= nil then
		AgoBaoXiangInfo = 1 * 100000000 + PosX * 100000 + PosY * 100
		API_VarDataSetNumber(ActorID,0,30215,AgoBaoXiangInfo)
		API_DestroyMonster(NPCFastID)
		if BackTileX ~= PosX or BackTileY ~= PosY then
			local GaiLv = math.random(10000000)
			local GoodTable = BaoXiang_GoodsTable
			
			local ObjectMapID = API_GetActorMapID(ActorID) 
			if YueGongBaoKu_ActorInfoTable[ObjectMapID].ActorID ~= nil then
				if ActorID == YueGongBaoKu_ActorInfoTable[ObjectMapID].ActorID then
					GoodTable = BaoXiang_GoodsTable
				else
					GoodTable = PuTongBaoXiang_GoodsTable
				end
			else
				GoodTable = PuTongBaoXiang_GoodsTable
			end
			
			for j in GoodTable do
				local GaiLv1 = GoodTable[j].GaiLv1
				local GaiLv2 = GoodTable[j].GaiLv2
				if GaiLv >= GaiLv1 and GaiLv <= GaiLv2 then
					local GoodsID = GoodTable[j].GoodsID
					local Num  = GoodTable[j].Num
					if GoodsID ~= 0 then
						if GoodsID == 11308 or GoodsID == 11307 or GoodsID == 11514 or GoodsID == 11513 or GoodsID == 31023 or GoodsID == 89180 or GoodsID == 89185 or GoodsID == 89175 then
							local MaxBiaoZhi = 0
							local NowTime = os.time()
							local CDTime = API_VarDataGetNumber_Ex(1,0,-6010,1,1)--特殊奖励CD时间
							local JiangLiNum1 = API_VarDataGetNumber_Ex(1,0,-6010,1,2)--月兔披风普通
							local JiangLiNum2 = API_VarDataGetNumber_Ex(1,0,-6010,1,3)--月兔披风稀有
							local JiangLiNum3 = API_VarDataGetNumber_Ex(1,0,-6010,1,4)--月宫女头饰
							local JiangLiNum4 = API_VarDataGetNumber_Ex(1,0,-6010,1,5)--月宫男头饰
							local JiangLiNum5 = API_VarDataGetNumber_Ex(1,0,-6010,1,6)--粉红兔宝宝卡
							local JiangLiNum6 = API_VarDataGetNumber_Ex(1,0,-6010,1,10)--元素
							local JiangLiNum7 = API_VarDataGetNumber_Ex(1,0,-6010,1,8)--炼金
							local JiangLiNum8 = API_VarDataGetNumber_Ex(1,0,-6010,1,9)--圣盾
							local WuPingShangXian = YueGongBaoKu_WuPingShangXian[GoodsID]
							if GoodsID == 11308 then
								if JiangLiNum1 >= WuPingShangXian then
									MaxBiaoZhi = 1
								end
							elseif GoodsID == 11307 then
								if JiangLiNum2 >= WuPingShangXian then
									MaxBiaoZhi = 1
								end
							elseif GoodsID == 11514 then
								if JiangLiNum3 >= WuPingShangXian then
									MaxBiaoZhi = 1
								end
							elseif GoodsID == 11513 then
								if JiangLiNum4 >= WuPingShangXian then
									MaxBiaoZhi = 1
								end
							elseif GoodsID == 31023 then
								if JiangLiNum5 >= WuPingShangXian then
									MaxBiaoZhi = 1
								end
							elseif GoodsID == 89180 then
								if JiangLiNum6 >= WuPingShangXian then
									MaxBiaoZhi = 1
								end
							elseif GoodsID == 89185 then
								if JiangLiNum7 >= WuPingShangXian then
									MaxBiaoZhi = 1
								end
							elseif GoodsID == 89175 then
								if JiangLiNum8 >= WuPingShangXian then
									MaxBiaoZhi = 1
								end
							end
							if NowTime > CDTime and MaxBiaoZhi ~= 1 then
								if API_ActorCanAddGoods(ActorID,GoodsID,Num,0,0) ~= -1 then
									local GoodsName = API_GetGoodsName(GoodsID)
									API_AddActorGoodsFlag(ActorID,GoodsID,Num,0,'')
									API_ActorSendMsg(ActorID,3,'获得'..GoodsName..''..Num..'个')
								else
									local GoodsName = API_GetGoodsName(GoodsID)
									API_SendActorMailByName(API_GetActorName(ActorID),GoodsID,Num,0,'中秋活动','月宫宝库开宝箱获得奖励')
									API_ActorSendMsg(ActorID,8,'获得'..GoodsName..''..Num..'个（请到邮箱领取）')
								end
								if GoodsID == 11308 then
									JiangLiNum1 = JiangLiNum1 + 1
									API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,2,JiangLiNum1)
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[58][6][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[58][6][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[58][6][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][6][LaiYuan] + 1
									end
								elseif GoodsID == 11307 then
									JiangLiNum2 = JiangLiNum2 + 1
									API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,3,JiangLiNum2)
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[58][7][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[58][7][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[58][7][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][7][LaiYuan] + 1
									end
								elseif GoodsID == 11514 then
									JiangLiNum3 = JiangLiNum3 + 1
									API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,4,JiangLiNum3)
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[58][8][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[58][8][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[58][8][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][8][LaiYuan] + 1
									end
								elseif GoodsID == 11513 then
									JiangLiNum4 = JiangLiNum4 + 1
									API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,5,JiangLiNum4)
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[58][9][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[58][9][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[58][9][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][9][LaiYuan] + 1
									end
								elseif GoodsID == 31023 then
									JiangLiNum5 = JiangLiNum5 + 1
									API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,6,JiangLiNum5)
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] + 1
									end
								elseif GoodsID == 89180 then
									JiangLiNum6 = JiangLiNum6 + 1
									API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,10,JiangLiNum6)
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[58][11][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[58][11][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[58][11][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][11][LaiYuan] + 1
									end
								elseif GoodsID == 89185 then
									JiangLiNum7 = JiangLiNum7 + 1
									API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,8,JiangLiNum7)
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[58][12][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[58][12][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[58][12][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][12][LaiYuan] + 1
									end
								elseif GoodsID == 89175 then
									JiangLiNum8 = JiangLiNum8 + 1
									API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,9,JiangLiNum8)
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[58][13][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[58][13][LaiYuan] = 1
									else
										GLOBAL_FengXiangBiao_DateList[58][13][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][13][LaiYuan] + 1
									end
								end
								local Time = os.time()
								local Tsec = math.random(600,1800)
								local NextTime = Time + Tsec
								API_VarDataSetNumber_Ex_Sync(1,0,-6010,1,1,NextTime)
								API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在月宫宝库中获得了'..API_GetGoodsName(GoodsID)..'')
							else
								if API_ActorCanAddGoods(ActorID,88960,Num,0,0) ~= -1 then
									local GoodsName = API_GetGoodsName(88960)
									API_AddActorGoodsFlag(ActorID,88960,Num,0,'')
									API_ActorSendMsg(ActorID,3,'获得'..GoodsName..''..Num..'个')
								else
									local GoodsName = API_GetGoodsName(88960)
									API_SendActorMailByName(API_GetActorName(ActorID),88960,Num,0,'中秋活动','月宫宝库开宝箱获得奖励')
									API_ActorSendMsg(ActorID,8,'获得'..GoodsName..''..Num..'个（请到邮箱领取）')
								end
							end
						else
							if fuzhuangbaoshixiaoguotable[GoodsID] ~= nil then
								if API_ActorCanAddGoods(ActorID,GoodsID,Num,0,0) ~= -1 then
									fuzhuangbaoshicuhangjianshuxingadd(ActorID,GoodsID,0,0)
								end
							else
								if API_ActorCanAddGoods(ActorID,GoodsID,Num,0,0) ~= -1 then
									local GoodsName = API_GetGoodsName(GoodsID)
									API_AddActorGoodsFlag(ActorID,GoodsID,Num,0,'')
									API_ActorSendMsg(ActorID,3,'获得'..GoodsName..''..Num..'个')
								else
									local GoodsName = API_GetGoodsName(GoodsID)
									API_SendActorMailByName(API_GetActorName(ActorID),GoodsID,Num,0,'中秋活动','月宫宝库开宝箱获得奖励')
									API_ActorSendMsg(ActorID,8,'获得'..GoodsName..''..Num..'个（请到邮箱领取）')
								end
							end
						end
					else
						API_ActorAddStatus(ActorID,StatusID1,1000)
						API_ActorAddStatus(ActorID,StatusID2,0)
						API_ActorSendMsg(ActorID,3,'开出一个炸弹......')	
					end
				end
			end
		else
--			API_ActorAddStatus(ActorID,StatusID1,1000)
--			API_ActorAddStatus(ActorID,StatusID2,0)
			API_ActorSendMsg(ActorID,3,'很遗憾...这个宝箱里什么都没有')			
		end
	else
	end
end


--魔法月饼模具
function MagicYueBingMuJuUse(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID() 
	local nShiFouEnd = API_DiffDatatime(ZhongQiuHuoDong__EndTime.Year,ZhongQiuHuoDong__EndTime.Month,ZhongQiuHuoDong__EndTime.Day,ZhongQiuHuoDong__EndTime.Hour,ZhongQiuHuoDong__EndTime.Minute,ZhongQiuHuoDong__EndTime.Second)
	local ZhongQiuJiFen = API_VarDataGetNumber(ActorID,1,18439)--中秋积分
	local XiaoHaoJiFen = 400
	local SelectItem = API_RequestGetNumber(1)
	if nShiFouEnd > 0 then
		if SelectItem == 100 then
			if ZhongQiuJiFen < XiaoHaoJiFen then
				API_ResponseWrite('<name>中秋活动</name>')
				API_ResponseWrite('<text>您的中秋积分不够，制作魔法月饼失败。（参加中秋活动，使用月桂枝，与兔子肉可以获得中秋积分）</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return 0
			else
				ZhongQiuJiFen = ZhongQiuJiFen - XiaoHaoJiFen
				API_VarDataSetNumber(ActorID,1,18439,ZhongQiuJiFen)--中秋积分
				if API_ActorCanAddGoods(ActorID,88958,1,0,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,88958,1,0,'获得魔法月饼')
					API_ActorSendMsg(ActorID,8,'扣除中秋积分400点，获得一个魔法月饼')
				else
					local GoodsName = API_GetGoodsName(88958)
					API_SendActorMailByName(API_GetActorName(ActorID),88958,1,0,'魔法月饼','')
					API_ActorSendMsg(ActorID,8,'扣除中秋积分400点，获得'..GoodsName..'一个（请到邮箱领取）')
				end
					return 1
			end
		else
			API_ResponseWrite('<name>中秋活动</name>')
			API_ResponseWrite('<win rect="300,100,400,300"></win>')
			API_ResponseWrite('<text>制作魔法月饼需要消耗400中秋积分。</text><br>')
			API_ResponseWrite('<br><text>您目前的中秋积分是：</text><text color="255,0,255">'..ZhongQiuJiFen..'</text><br>')
			API_ResponseWrite('<br><a href="MagicYueBingMuJuUse?1=100">制作魔法月饼</a><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
			API_ResponseFlush(ActorID)
			return 0				
		end
	else
		if API_ActorGetGoodsNum(ActorID,88955) > 0 and API_ActorRemoveGoods(ActorID,88955,1,'消耗魔法月饼模具') then--销毁玩家身上的物品
--			if API_ActorCanAddGoods(ActorID,80498,10,3,0) ~= -1 then
--				API_AddActorGoodsFlag(ActorID,80498,10,0,'获得10个经验兑换券')
--				API_ActorSendMsg(ActorID,8,'获得10个经验兑换券')
--			else
--				local GoodsName = API_GetGoodsName(80498)
--				API_SendActorMailByName(API_GetActorName(ActorID),80498,10,0,'中秋活动','')
--				API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'10个（请到邮箱领取）')
--			end
			API_ResponseWrite('<name>中秋活动</name>')
			API_ResponseWrite('<text>    中秋活动已结束，感谢您的参与。</text><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
			API_ResponseFlush(ActorID)
			return 1
		else
			return 0
		end
	end
end

--冰皮月饼模具
function BingPiYueBingMuJuUse(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID() 
	local nShiFouEnd = API_DiffDatatime(ZhongQiuHuoDong__EndTime.Year,ZhongQiuHuoDong__EndTime.Month,ZhongQiuHuoDong__EndTime.Day,ZhongQiuHuoDong__EndTime.Hour,ZhongQiuHuoDong__EndTime.Minute,ZhongQiuHuoDong__EndTime.Second)
	local Point = API_ActorGetPropNum(ActorID,183)--点券
	local GoodsID1 = 88957
	local NeedPoint = 50
	local SelectItem = API_RequestGetNumber(2)
	if nShiFouEnd > 0 then
		if SelectItem == 100 then
			if Point < NeedPoint then
				API_ResponseWrite('<name>中秋活动</name>')
				API_ResponseWrite('<text>您的点券不够，制作冰皮月饼失败。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
			if API_ActorGetGoodsNum(ActorID,GoodsID1) < 1 then--判断背包中是否有魔法月饼
				API_ResponseWrite('<name>中秋活动</name>')
				API_ResponseWrite('<text>缺少魔法莲蓉，制作冰皮月饼失败。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
			if API_UsePoint(ActorID,3,88959,1,NeedPoint) == 0 and API_ActorGetGoodsNum(ActorID,GoodsID1) > 0 and API_ActorRemoveGoods(ActorID,GoodsID1,1,'消耗魔法莲蓉') then--判断点券道具是否成功
				if API_ActorCanAddGoods(ActorID,88959,1,0,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,88959,1,0,'获得冰皮月饼')
					API_ActorSendMsg(ActorID,8,'扣除点券50点、魔法莲蓉一个，获得一个冰皮月饼')
				else
					local GoodsName = API_GetGoodsName(88959)
					API_SendActorMailByName(API_GetActorName(ActorID),88959,1,0,'冰皮月饼','')
					API_ActorSendMsg(ActorID,8,'扣除点券50点、魔法莲蓉一个，获得'..GoodsName..'一个（请到邮箱领取）')
				end
					return 1
			end
		else
			API_ResponseWrite('<name>中秋活动</name>')
			API_ResponseWrite('<win rect="300,100,400,300"></win>')
			API_ResponseWrite('<text>制作冰皮月饼需要消耗一个魔法莲蓉以及50点券</text><br>')
			API_ResponseWrite('<br><a href="BingPiYueBingMuJuUse?2=100">制作冰皮月饼</a><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
			API_ResponseFlush(ActorID)
			return 0				
		end
	else
		if API_ActorGetGoodsNum(ActorID,88956) > 0 and API_ActorRemoveGoods(ActorID,88956,1,'消耗冰皮月饼模具') then--销毁玩家身上的物品
--			if API_ActorCanAddGoods(ActorID,80498,10,3,0) ~= -1 then
--				API_AddActorGoodsFlag(ActorID,80498,10,0,'获得10个经验兑换券')
--				API_ActorSendMsg(ActorID,8,'获得10个经验兑换券')
--			else
--				local GoodsName = API_GetGoodsName(80498)
--				API_SendActorMailByName(API_GetActorName(ActorID),80498,10,0,'中秋活动','')
--				API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'10个（请到邮箱领取）')
--			end
			API_ResponseWrite('<name>中秋活动</name>')
			API_ResponseWrite('<text>    中秋活动已结束，感谢您的参与。</text><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
			API_ResponseFlush(ActorID)
			return 1
		else
			return 0
		end
	end
end

--魔法月饼
function MagicYueBingUse(ActorID,GoodsID)
	local GoodsID = 88958
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用魔法月饼') then--销毁玩家身上的物品
		local Number = math.random(4)
		local StatusID = ZhongQiuHuoDong_StatusIDTable[Number].ID
		local Name = ZhongQiuHuoDong_StatusIDTable[Number].Name
		API_ActorAddStatus(ActorID,StatusID,600000)
		API_ActorSendMsg(ActorID,3,'成功使用魔法月饼，变身为'..Name..'')
		local RD1 = math.random(10000)
		if RD1 < 50 then
			if API_ActorCanAddGoods(ActorID,31023,1,0,0) ~= -1 then
				API_AddActorGoodsFlag(ActorID,31023,1,0,'获得兔宝宝宠物卡')
				API_ActorSendMsg(ActorID,8,'获得兔宝宝宠物卡')
			else
				local GoodsName = API_GetGoodsName(31023)
				API_SendActorMailByName(API_GetActorName(ActorID),31023,1,0,'中秋活动','中秋吃月饼获得兔宝宝宠物卡')
				API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'1个（请到邮箱领取）')
			end
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] + 1
			end			
		end
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		if GLOBAL_FengXiangBiao_DateList[58][1][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[58][1][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[58][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][1][LaiYuan] + 1
		end
		return 1
	else
		return 0
	end
end

--魔法莲蓉
function MagiclianRong(ActorID,GoodsID)
	local GoodsID1 = 88957
	local GoodsID2 = 88958
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID2) < 1 then--判断背包中是否有魔法月饼
		API_ActorSendMsg(ActorID,3,'缺少魔法月饼')
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID1) > 0 and API_ActorRemoveGoods(ActorID,GoodsID1,1,'消耗魔法莲蓉') 
	and API_ActorGetGoodsNum(ActorID,GoodsID2) > 0 and API_ActorRemoveGoods(ActorID,GoodsID2,1,'消耗魔法月饼') then--销毁玩家身上的物品
			if API_ActorCanAddGoods(ActorID,88960,1,0,0) ~= -1 then
				API_AddActorGoodsFlag(ActorID,88960,1,0,'获得至尊魔法月饼')
				API_ActorSendMsg(ActorID,8,'消耗魔法月饼、魔法莲蓉各一个，获得至尊魔法月饼')
			else
				local GoodsName = API_GetGoodsName(88960)
				API_SendActorMailByName(API_GetActorName(ActorID),88960,1,0,'至尊魔法月饼','')
				API_ActorSendMsg(ActorID,8,'消耗魔法月饼、魔法莲蓉各一个，获得'..GoodsName..'一个（请到邮箱领取）')
			end
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		if GLOBAL_FengXiangBiao_DateList[58][2][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[58][2][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[58][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][2][LaiYuan] + 1
		end
		return 1
	else
		return 0
	end
end

--冰皮月饼
function BingPiYueBing(ActorID,GoodsID)
	local GoodsID = 88959
	local PetNum =  API_GetActorConjedPetPropNum(ActorID,2)
	local JinHua = API_GetActorConjedPetPropNum(ActorID,9)
	local ActorLeve = API_GetActorExpLevel(ActorID)
	local MaxLeve = 30
	if JinHua == 1 then
		MaxLeve = 55
	elseif JinHua == 2 then
		MaxLeve = 65
	end
	if PetNum == -1 then
		API_ActorSendMsg(ActorID,3,'您当前没有召唤出宠物')
		return 0	
	end
	if ActorLeve + 4 <= PetNum then
		API_ActorSendMsg(ActorID,3,'您的宠物等级已高出角色等级4级，不可再使用该道具')
		return 0	
	end
	if PetNum == MaxLeve then
		API_ActorSendMsg(ActorID,3,'您的宠物等级已达到上限')
		return 0	
	end
	if PetNum < 10 then
		API_ActorSendMsg(ActorID,3,'10级以下宠物不可使用此道具')
		return 0	
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	
	if PetNum > 55 then
		PetNum = 55
	end
	
	local Exp = BingPiYueBing_PetExpTable[PetNum]
	if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用冰皮月饼') then--销毁玩家身上的物品
		API_ActorAddPetExp(ActorID,Exp,0,'获得宠物经验')
		API_ActorSendMsg(ActorID,3,'成功使用一个冰皮月饼')
		local RD1 = math.random(10000)
		if RD1 < 50 then
			if API_ActorCanAddGoods(ActorID,31023,1,0,0) ~= -1 then
				API_AddActorGoodsFlag(ActorID,31023,1,0,'获得兔宝宝宠物卡')
				API_ActorSendMsg(ActorID,8,'获得兔宝宝宠物卡')
			else
				local GoodsName = API_GetGoodsName(31023)
				API_SendActorMailByName(API_GetActorName(ActorID),31023,1,0,'中秋活动','中秋吃月饼获得兔宝宝宠物卡')
				API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'1个（请到邮箱领取）')
			end
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] + 1
			end				
		end
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		if GLOBAL_FengXiangBiao_DateList[58][3][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[58][3][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[58][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][3][LaiYuan] + 1
		end
		return 1
	else
		return 0
	end
end

--至尊魔法月饼
function ZhiZunMagicYueBing(ActorID,GoodsID)
	local GoodsID = 88960
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用冰皮月饼') then--销毁玩家身上的物品
		local Number1 = math.random(4)
		local Number2 = math.random(7)
		local StatusID1 = ZhongQiuHuoDong_StatusIDTable[Number1].ID
		local Name = ZhongQiuHuoDong_StatusIDTable[Number1].Name
		local StatusID2 = ZhongQiuHuoDong_YueBingXiaoGuo[Number2].StatusID
		local Explain = ZhongQiuHuoDong_YueBingXiaoGuo[Number2].Explain
		API_ActorAddStatus(ActorID,StatusID1,600000)
		API_ActorAddStatus(ActorID,StatusID2,600000)
		API_ActorSendMsg(ActorID,3,'成功使用至尊魔法月饼，变身为'..Name..'并获得状态:'..Explain..'')
		local RD1 = math.random(10000)
		if RD1 < 50 then
			if API_ActorCanAddGoods(ActorID,31023,1,0,0) ~= -1 then
				API_AddActorGoodsFlag(ActorID,31023,1,0,'获得兔宝宝宠物卡')
				API_ActorSendMsg(ActorID,8,'获得兔宝宝宠物卡')
			else
				local GoodsName = API_GetGoodsName(31023)
				API_SendActorMailByName(API_GetActorName(ActorID),31023,1,0,'中秋活动','中秋吃月饼获得兔宝宝宠物卡')
				API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'1个（请到邮箱领取）')
			end
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][10][LaiYuan] + 1
			end				
		end
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		if GLOBAL_FengXiangBiao_DateList[58][4][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[58][4][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[58][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[58][4][LaiYuan] + 1
		end
		return 1
	else
		return 0
	end
end
