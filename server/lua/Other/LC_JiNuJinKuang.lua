-------------------------------
--文件名:	Scp\Lua\Other\LC_JiNuJinKuang.lua
--版  权:	(C)  深圳腾讯计算机网络有限公司
--创建人:	
--日  期:	
--版  本:	
--描  述: 
--应  用:  
-------------------------------

local JiNuJinKuang_StartTime = {Year = 2011,Month = 7,Day = 9,Hour = 0,Minute = 0,Second = 0}
local JiNuJinKuang_EndTime = {Year = 2018,Month = 1,Day = 1,Hour = 0,Minute = 0,Second = 0}


local JinKuangMapID = 2044

local JiNuJinKuang_MapList = {23,10,101}


if JiNuJinKuang_FuBenIDlist == nil then 
   JiNuJinKuang_FuBenIDlist = {}
end


local JiNuJinKuang_MapInfo = {
[1] = {
		NPC = {
				{NPCID = 11607,TileX = 248,TileY = 134,Direct = 3,AIInfoID = nil,Camp = nil,},
				{NPCID = 11607,TileX = 183,TileY = 123,Direct = 3,AIInfoID = nil,Camp = nil,},
			},
		Monster = {
				{MonsterID = {949020,949045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950020,950045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951020,951045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949020,949045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950020,950045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951020,951045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949020,949045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950020,950045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951020,951045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949020,949045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950020,950045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951020,951045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949020,949045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950020,950045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951020,951045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {952020,952045},TileX1 = 227,TileX2 = 251,TileY1 = 176,TileY2 = 180,Direct = 3,AIInfoID = 0,Camp = 2,},
				
				{MonsterID = {949025,949050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950025,950050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951025,951050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949025,949050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950025,950050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951025,951050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949025,949050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950025,950050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951025,951050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949025,949050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950025,950050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951025,951050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949025,949050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950025,950050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951025,951050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {952025,952050},TileX1 = 214,TileX2 = 248,TileY1 = 209,TileY2 = 216,Direct = 3,AIInfoID = 0,Camp = 2,},
				
				{MonsterID = {949030,949055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950030,950055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951030,951055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949030,949055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950030,950055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951030,951055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949030,949055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950030,950055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951030,951055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949030,949055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950030,950055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951030,951055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949030,949055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950030,950055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951030,951055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {952030,952055},TileX1 = 151,TileX2 = 175,TileY1 = 206,TileY2 = 215,Direct = 3,AIInfoID = 0,Camp = 2,},
				
				{MonsterID = {949035,949060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950035,950060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951035,951060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949035,949060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950035,950060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951035,951060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949035,949060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950035,950060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951035,951060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949035,949060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950035,950060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951035,951060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949035,949060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950035,950060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951035,951060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {952035,952060},TileX1 = 118,TileX2 = 140,TileY1 = 185,TileY2 = 186,Direct = 3,AIInfoID = 0,Camp = 2,},
				
				{MonsterID = {949040,949065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950040,950065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951040,951065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949040,949065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950040,950065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951040,951065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949040,949065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950040,950065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951040,951065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949040,949065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950040,950065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951040,951065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949040,949065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950040,950065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951040,951065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {952040,952065},TileX1 = 118,TileX2 = 150,TileY1 = 152,TileY2 = 156,Direct = 3,AIInfoID = 0,Camp = 2,},

				{MonsterID = {949040,949065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950040,950065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951040,951065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949040,949065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950040,950065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951040,951065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949040,949065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950040,950065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951040,951065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949040,949065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950040,950065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951040,951065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {949040,949065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 1,AIInfoID = 0,Camp = 2,},
				{MonsterID = {950040,950065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 2,AIInfoID = 0,Camp = 2,},
				{MonsterID = {951040,951065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 3,AIInfoID = 0,Camp = 2,},
				{MonsterID = {953040,953065},TileX1 = 172,TileX2 = 207,TileY1 = 153,TileY2 = 157,Direct = 3,AIInfoID = 0,Camp = 2,},
			},
		Gold = {
				{TileX = 129,TileY = 164},
				{TileX = 129,TileY = 215},
				{TileX = 163,TileY = 215},
				{TileX = 206,TileY = 217},
				{TileX = 237,TileY = 181},
			},
		},
}

if API_GetServerID() <11 then
	local StartTimeTable = JiNuJinKuang_StartTime
	local EndTimeTable = JiNuJinKuang_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if JiNuJinKuang_TriggerID ~= nil then
			API_DestroyTriggerG(JiNuJinKuang_TriggerID)
			JiNuJinKuang_TriggerID = API_CreateTimerTriggerG(0,0,60,-1,'JiNuJinKuang_ActTimeFunc')
		else
			JiNuJinKuang_TriggerID = API_CreateTimerTriggerG(0,0,60,-1,'JiNuJinKuang_ActTimeFunc')
		end
	end
end

--创建门
function JiNuJinKuang_ActTimeFunc()
	local StartTimeTable = JiNuJinKuang_StartTime
	local EndTimeTable = JiNuJinKuang_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	if nShiFouStart <= 0 and nShiFouEnd > 0 and Week >= 5 then
		if API_GetServerID() == 1 then
			if Hour == 19 and math.mod(Minute,10) == 0 then
				API_ActorBroadcastMsg(-1,17,'英雄大陆出现大批神秘淘金者。')
				API_ActorBroadcastMsg(-1,1,'英雄大陆出现大批神秘淘金者。')
				API_ActorBroadcastMsg(-1,7,'英雄大陆出现大批神秘淘金者。')
			end
		end
		if Hour == 19 then
			if math.mod(Minute,5) == 0 then
				for i,v in JiNuJinKuang_MapList do
					local RightMapID = API_GetRightMapID(v)
					if API_MapIsValid(RightMapID) then
						local PlayNum = 30 
						local PlayList = API_GetActorInArea(RightMapID,0,0,0,0,0)
						if PlayList ~= nil then
							PlayNum = table.getn(PlayList)
						end
						if PlayNum > 30 then
							PlayNum = 30
						end
						local JiNuJinKuangNum = PlayNum
						if JiNuJinKuang_FuBenIDlist[RightMapID] == nil then
							JiNuJinKuang_FuBenIDlist[RightMapID] = {}
						end
						for j = 1,JiNuJinKuangNum do
							local YeWaiFastID = JiNuJinKuang_FuBenIDlist[RightMapID][j]
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
									local YeWaiFastID = API_CreateMonsterEx(RightMapID,12379,TileX,TileY,4,0,-1,1)
									JiNuJinKuang_FuBenIDlist[RightMapID][j] = YeWaiFastID
								end
							end
						end			
					end
				end
			end
		else
			for i in JiNuJinKuang_FuBenIDlist do
				for j,v in JiNuJinKuang_FuBenIDlist[i] do
					if API_GetMonsterID(v) > 0 then
						API_DestroyMonster(v)
					end
				end
			end
			JiNuJinKuang_FuBenIDlist = {}
		end
	end
	local StartTimeTable = GLOBAL_GuoQingOnline_StartTime
	local EndTimeTable = GLOBAL_GuoQingOnline_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)

	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		if API_GetServerID() == 1 then
			if Hour == 20 and Minute >= 30 and math.mod(Minute,5) == 0 then
				API_ActorBroadcastMsg(-1,17,'现在前往暗礁海或者麦穗平原找到爱国者可以前往夏日海滩')
				API_ActorBroadcastMsg(-1,1,'现在前往暗礁海或者麦穗平原找到爱国者可以前往夏日海滩')
				API_ActorBroadcastMsg(-1,7,'现在前往暗礁海或者麦穗平原找到爱国者可以前往夏日海滩')
			end
		end

	end

end

local JinKuangFuBen = 30295

--对话
function JiNuJinKuang_Click(ActorID,NPCID)
    local ActorID = ActorID or API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local NextTime = API_VarDataGetNumber(ActorID,1,JinKuangFuBen)
	local NowTime = os.time()
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
    if API_GetMonsterID(NPCFastID) <= 0 then
		API_ResponseEnd()
		API_ResponseClear()
		return
	end

	if NextTime > NowTime then
		local CountDown = NextTime - NowTime
		local Minute = math.floor(CountDown/60)
		if Minute == 0 then
			Minute = 1
		end
		API_ActorSendMsg(ActorID,10,'你还需要'..Minute..'分钟后才能继续进入机奴金矿。')
		API_ResponseEnd()
		API_ResponseClear()
		return
	end
	if MapConfigID == 23 or MapConfigID == 10 then
		local ExpLevel = API_GetActorExpLevel(ActorID)
		if ExpLevel >= 41 then
		   API_ResponseWrite('<name>神秘淘金者</name>')
		   API_ResponseWrite('<br><text>您的</text><text color="255,0,255">等级</text><text>超出当前副本上限，不能进入此机奴金矿，请前往更高级的地图寻找神秘淘金者。</text><br>')
		   API_ResponseWrite('<br><a>确定</a><br>')
		   API_ResponseFlush(ActorID)
			return
		end
		if ExpLevel < 16 then
			API_ResponseWrite('<name>神秘淘金者</name>')
			API_ResponseWrite('<br><text>您的</text><text color="255,0,255">等级</text><text>低于16级，不能进入此机奴金矿。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return
		end	
	end

    if XuanZe == 0 then
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 and API_GetTeamLeader(TeamID) == ActorID then
			API_ResponseWrite('<name>神秘淘金者</name>')
		    API_ResponseWrite('<br><text color="255,0,0">机奴势力掌控着英雄大陆最大的地下金矿，如果能够找到这些宝藏你将成为世上最富有的人。</text><br>')
		    API_ResponseWrite('<br><a href="JiNuJinKuang_Click?1=2">现在进入</a><br>')
--		    API_ResponseWrite('<br><a href="JiNuJinKuang_Click?1=3">花费300云游获取消息</a><br>')
		    API_ResponseWrite('<br><a>关闭</a><br>')
		else
			API_ResponseWrite('<name>神秘淘金者</name>')
			API_ResponseWrite('<br><text>我只和拥有队长权限的人协商，机奴金矿太过凶险，你最好去召集一些队友。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	elseif  XuanZe == 2 or XuanZe == 3 then
		local TeamID = API_GetTeamID(ActorID)
	    local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID)
	    local TeamSize = API_GetTeamSize(TeamID)    ----------------------队伍人数
	    if TeamID <= 0  then
	       API_ResponseWrite('<name>神秘淘金者</name>')
           API_ResponseWrite('<br><text>你没有加入任何</text><text color="255,0,255">队伍</text><text>不能进入机奴金矿。</text><br>')
		   API_ResponseWrite('<br><a>确定</a><br>')
		   API_ResponseFlush(ActorID)
		   return
	    end
	    if API_GetTeamLeader(TeamID) ~= ActorID then
		   API_ResponseWrite('<name>神秘淘金者</name>')
           API_ResponseWrite('<br><text>你不是</text><text color="255,0,255">队长</text><text>，不能带领队伍进入机奴金矿。</text><br>')
		   API_ResponseWrite('<br><a>确定</a><br>')
		   API_ResponseFlush(ActorID)
		   return
		end
	    for i = 1,TeamSize do
			local TeamActorID = API_GetTeamMem(TeamID,i)
			if API_ActorIsOnline(TeamActorID) then
				local PlayX2,PlayY2 = PublicFun_GetActorPosXY(TeamActorID)
				local TeamActorMapID = API_GetActorMapID(TeamActorID)
				local TeamActorIDLevel = API_GetActorExpLevel(TeamActorID)
				if TeamActorMapID ~= MapID then
				   API_ResponseWrite('<name>神秘淘金者</name>')
				   API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>不在同一场景中。</text><br>')
				   API_ResponseWrite('<br><a>确定</a><br>')
				   API_ResponseFlush(ActorID)
				   return
				end
				if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
				  API_ResponseWrite('<name>神秘淘金者</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>正在快递，无法进入机奴金矿！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
				end
				if API_ActorFindStatus(TeamActorID,519) then
				  API_ResponseWrite('<name>神秘淘金者</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>正在摆摊，无法进入机奴金矿！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
				end
				if API_ActorIsDying(TeamActorID) then
				  API_ResponseWrite('<name>神秘淘金者</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>死亡，无法进入机奴金矿！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
				end
				if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
				  API_ResponseWrite('<name>神秘淘金者</name>')
				  API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>在公交车上无法进入机奴金矿！</text><br>')
				  API_ResponseWrite('<br><a>确定</a><br>')
				  API_ResponseFlush(ActorID)
				  return
				end
				if MapConfigID == 23 or MapConfigID == 10 then
					local ExpLevel = API_GetActorExpLevel(TeamActorID)
					if ExpLevel >= 41 then
						API_ResponseWrite('<name>神秘淘金者</name>')
						API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>的等级超出当前副本上限，不能进入此机奴金矿！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return
					end
					if ExpLevel < 16 then
						API_ResponseWrite('<name>神秘淘金者</name>')
						API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>的等级低于16级，不能进入此机奴金矿！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return
					end					
				end
				local NextTime = API_VarDataGetNumber(TeamActorID,1,JinKuangFuBen)
				local NowTime = os.time()
				if NextTime > NowTime then
					API_ResponseWrite('<name>神秘淘金者</name>')
					API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>进入金矿太过频繁，需要休息一会！</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)	
					return
				end
			end
		end
--		if XuanZe == 2 then
--			if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) < 100 then
--				API_ActorSendMsg(ActorID,3,'金币余额不足')
--				return
--			end
--			API_ActorAddMoney(ActorID,-100,0,'扣除金币')
--		elseif XuanZe == 3 then
--			if API_ActorRemoveGoods(ActorID,80818,300,"删除对应数量的云游代金券") then

--			else
--				API_ActorSendMsg(ActorID,3,'扣除云游代金券失败')
--				return
--			end
--		end
		JiNuJinKuang_Create(ActorID,NPCFastID,XuanZe)
	end
	API_ResponseFlush(ActorID)
end


--创建副本
function JiNuJinKuang_Create(ActorID,NPCFastID,XuanZe)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)

	API_DestroyMonster(NPCFastID)            -------------------------------点击删除门
	local ObjectMapID = API_CreateEctype(JinKuangMapID,0)  ---------------创建副本
	local CitadelTable = JiNuJinKuang_MapInfo[1]
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
	--创建怪物
	if type(CitadelTable.Monster) == 'table' then
		for j = 1,table.getn(CitadelTable.Monster) do
			local NPCTable = CitadelTable.Monster[j]
			local MonsterID = NPCTable.MonsterID
			local a = 1
			if MapConfigID == 23 or MapConfigID == 10 then
				a = 1
			else
				a = 2
			end
			if type(NPCTable.MonsterID) == 'table' then
				MonsterID = NPCTable.MonsterID[a]
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
			local TileX = math.random(NPCTable.TileX1,NPCTable.TileX2)
			local TileY = math.random(NPCTable.TileY1,NPCTable.TileY2)
			local FastID = API_CreateMonster(ObjectMapID,MonsterID,TileX,TileY,Direct,AIInfoID,Camp)--创建怪物
			API_CreateDieTriggerG(0,0,0,FastID,'JiNuJinKuang_MonsterDie')
		end
	end	
--	if type(CitadelTable.Gold) == 'table' then
--		for j = 1,table.getn(CitadelTable.Gold) do
--			local GoldTable = CitadelTable.Gold[j]
--			API_CreateResBoxEx_UID(ObjectMapID,GoldTable.TileX,GoldTable.TileY,282,5,'金矿',3,0,0,0,0)
--		end
--	end
--	if MapConfigID == 98 or MapConfigID == 99 then
--		for j = 1,5 do
--			local Width,Height = PublicFun_GetMapWidthHeight(ObjectMapID)
--			local TileX = 0
--			local TileY = 0
--			local Num = 0
--			repeat
--				Num = Num + 1
--				TileX = math.random(Width)
--				TileY = math.random(Height)
--			until not API_IsBlockTile(ObjectMapID,TileX,TileY,0) or Num == 100
--			if not API_IsBlockTile(ObjectMapID,TileX,TileY,0) then
--				API_CreateResBoxEx_UID(ObjectMapID,TileX,TileY,282,5,'金矿',3,0,0,0,0)
--			end
--		end	
--	end
--	if XuanZe == 3 then
--		for j = 1,20 do
--			local Width,Height = PublicFun_GetMapWidthHeight(ObjectMapID)
--			local TileX = 0
--			local TileY = 0
--			local Num = 0
--			repeat
--				Num = Num + 1
--				TileX = math.random(Width)
--				TileY = math.random(Height)
--			until not API_IsBlockTile(ObjectMapID,TileX,TileY,0) or Num == 100
--			if not API_IsBlockTile(ObjectMapID,TileX,TileY,0) then
--				API_CreateResBoxEx_UID(ObjectMapID,TileX,TileY,282,10,'金矿',3,0,0,0,0)
--			end
--		end			
--	end
	JiNuJinKuang_PlayGotoMap(ActorID,ObjectMapID)
	local Type = 1
	if MapConfigID == 23 or MapConfigID == 10 then
		Type = 1
	else
		Type = 2
	end
	local LaiYuan = API_ActorGetPropNum(ActorID,201)
	if GLOBAL_FengXiangBiao_DateList[76][Type][LaiYuan] == nil then
		GLOBAL_FengXiangBiao_DateList[76][Type][LaiYuan] = 1
	else
		GLOBAL_FengXiangBiao_DateList[76][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[76][Type][LaiYuan] + 1
	end
end

--传送进副本
function JiNuJinKuang_PlayGotoMap(ActorID,ObjectMapID)
	local TileX = 254
	local TileY = 141
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
					local MapID = API_GetActorMapID(TeamActorID)
					local MapConfigID = API_GetMapConfigID(MapID)
					local Type = 5
					if MapConfigID == 23 or MapConfigID == 10 then
						Type = 5
					else
						Type = 6
					end
					API_ActorGoToMap(TeamActorID,ObjectMapID,TileX,TileY)
					local NowTime = os.time()
					local NextTime = NowTime + 300
					API_VarDataSetNumber(TeamActorID,1,JinKuangFuBen,NextTime)
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[76][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[76][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[76][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[76][Type][LaiYuan] + 1
					end
				end
			end
		else
			API_ActorGoToMap(ActorID,ObjectMapID,TileX,TileY)
		end
	end
end


local JiNuJinKuang_Goodstable = {
		[949020] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[949025] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[949030] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[949035] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[949040] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[949045] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[949050] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[949055] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[949060] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[949065] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[950020] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[950025] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[950030] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[950035] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[950040] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[950045] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[950050] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[950055] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[950060] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[950065] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[951020] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[951025] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[951030] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[951035] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[951040] = {
					{GoodsID=80410,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[951045] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[951050] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[951055] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[951060] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[951065] = {
					{GoodsID=80410,GoodsNum=20,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		--精英
		[952020] = {
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[952025] = {
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[952030] = {
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[952035] = {
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[952040] = {
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=200,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[952045] = {
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},		
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=200000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[952050] = {
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=300000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[952055] = {
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=400000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[952060] = {
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=500000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[952065] = {
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=600000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=400,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		--boss
		[953040] = {
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=80410,GoodsNum=500,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=500,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=500,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=500,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=500,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=500,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=500,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=500,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=500,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=500,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[953065] = {
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
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=700000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		--隐藏
		[954040] = {
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
				},
		[954065] = {
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
					{GoodsID=80410,GoodsNum=1000,Flag=0,GaiLv=1000000,PinZhi=0},
				},
}

--怪物死亡回调
function JiNuJinKuang_MonsterDie(ActorID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if JiNuJinKuang_Goodstable[MonsterID] == nil then
		return
	end
	local DiaoLuoNum = table.getn(JiNuJinKuang_Goodstable[MonsterID])
	for i = 1,DiaoLuoNum do
		local GoodsTable = JiNuJinKuang_Goodstable[MonsterID][i]
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
				API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落装备',4,KillerID,600,60,PinZhi)
			else
				API_CreateDropGoods(DynamicMapID,PosX,PosY,GoodsId,Num,Flag,'掉落物品',4,0,600,60)
			end
		end
	end
	if MonsterID == 952020 or MonsterID == 952025 or MonsterID == 952030 or MonsterID == 952035 or MonsterID == 952040 then
		API_CreateResBoxEx_UID(DynamicMapID,PosX,PosY,282,3,'金矿',3,0,0,0,0)
	elseif MonsterID == 952045 or MonsterID == 952050 or MonsterID == 952055 or MonsterID == 952060 or MonsterID == 952065 then				
		API_CreateResBoxEx_UID(DynamicMapID,PosX,PosY,282,5,'金矿',3,0,0,0,0)
	elseif MonsterID == 953040 then
		API_CreateResBoxEx_UID(DynamicMapID,PosX,PosY,282,6,'金矿',3,0,0,0,0)
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		if GLOBAL_FengXiangBiao_DateList[76][3][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[76][3][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[76][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[76][3][LaiYuan] + 1
		end
	elseif MonsterID == 953065 then
		API_CreateResBoxEx_UID(DynamicMapID,PosX,PosY,282,15,'金矿',3,0,0,0,0)
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		if GLOBAL_FengXiangBiao_DateList[76][4][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[76][4][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[76][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[76][4][LaiYuan] + 1
		end
	end
end

function LC_GoldRockUse(ActorID,GoodsID) 
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用金矿石') then--销毁玩家身上的物品
		local QuJian = math.random(10000)
		local GoldNum = 1000
		if QuJian > 8000 then
			GoldNum = math.random(5000,10000)
		else
			GoldNum = math.random(1000,5000)
		end
		API_ActorAddMoney(ActorID,GoldNum,0,'添加金币')
		API_ActorSendMsg(ActorID,3,'使用金矿石获得'..GoldNum..'金币')
		return 1
	else
		return 0
	end
end

