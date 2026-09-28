----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\XiongDiHui.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	谭明礼
--日  期:	2008-10-23
--版  本:	1.0
--描  述:	兄弟会指挥官争夺战伯爵玩法
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：谭明礼
--日期：2009-10-23
--功能：创建
---------------------------------------------------------------------
--交互数据：
--11825 存储兄弟会成员领取BUFF的时间
--11826 存储兄弟会成员领取兄弟会BUFF效果情况(0--5)
--11827 存储争夺指挥官成功后给成员发送经验的时间
--11828 存储争夺指挥官成功后给成员发送经验的时间
--11829 存储争夺指挥官成功后给成员发送经验的时间
--11830 存储争夺指挥官成功后领取的仆从的FASTID
--11831 存储兄弟会成员领取仆从的时间
--11832 切换地图和换线时存储仆从的血量
--11833 存储切换地图前仆从的MonsterID

local OwnerID = -4005 --全局交互数据
if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 0 then
	API_VarDataLoad_Ex(1,0,OwnerID)
end
TML_XDH_BJXiongDiHuiGLF = 30000 --伯爵兄弟会管理费
TML_XDH_BJBUFFNum = 5 --伯爵指挥官可领取BUFF增益效果次数
TML_XDH_ZhiHuiGuanMaxLife = 727363 --指挥官最大血量
local BoJueMapID = 111 --伯爵争夺地图ID
local BoJueDTMapID = API_GetRightMapID(BoJueMapID)

--开启服务器时设置争夺区域为安全区域
API_SetAreaType(BoJueDTMapID,7,0)
API_SetAreaType(BoJueDTMapID,8,0)
API_SetAreaType(BoJueDTMapID,9,0)

--NPC争夺战时间
TML_XiongDiHui_BJReadyHour = 20
TML_XiongDiHui_BJReadyMinute = 30
TML_XiongDiHui_BJStartHour = 21
TML_XiongDiHui_BJStartMinute = 0
TML_XiongDiHui_BJEndHour = 21
TML_XiongDiHui_BJEndMinute = 30

--指挥官争夺战标记
TML_BJXiongDiHui_End = 0

--争夺NPC成功后发送经验表
XiongDiHui_BJSendEXPTable = {
	[1] = {EXP=144,AllEXP=13824},
	[2] = {EXP=192,AllEXP=18432},
	[3] = {EXP=240,AllEXP=23040},
	[4] = {EXP=288,AllEXP=27648},
	[5] = {EXP=336,AllEXP=32256},
	[6] = {EXP=384,AllEXP=36864},
	[7] = {EXP=432,AllEXP=41472},
	[8] = {EXP=480,AllEXP=46080},
	[9] = {EXP=528,AllEXP=50688},
	[10] = {EXP=576,AllEXP=55296},
	[11] = {EXP=720,AllEXP=69120},
	[12] = {EXP=816,AllEXP=78336},
	[13] = {EXP=912,AllEXP=87552},
	[14] = {EXP=1008,AllEXP=96768},
	[15] = {EXP=1104,AllEXP=105984},
	[16] = {EXP=1200,AllEXP=115200},
	[17] = {EXP=1296,AllEXP=124416},
	[18] = {EXP=1392,AllEXP=133632},
	[19] = {EXP=1488,AllEXP=142848},
	[20] = {EXP=1584,AllEXP=152064},
	[21] = {EXP=1872,AllEXP=179712},
	[22] = {EXP=2016,AllEXP=193536},
	[23] = {EXP=2160,AllEXP=207360},
	[24] = {EXP=2304,AllEXP=221184},
	[25] = {EXP=2448,AllEXP=235008},
	[26] = {EXP=4320,AllEXP=414720},
	[27] = {EXP=4608,AllEXP=442368},
	[28] = {EXP=4896,AllEXP=470016},
	[29] = {EXP=5184,AllEXP=497664},
	[30] = {EXP=5472,AllEXP=525312},
	[31] = {EXP=5760,AllEXP=552960},
	[32] = {EXP=6048,AllEXP=580608},
	[33] = {EXP=6336,AllEXP=608256},
	[34] = {EXP=6624,AllEXP=635904},
	[35] = {EXP=6912,AllEXP=663552},
	[36] = {EXP=7776,AllEXP=746496},
	[37] = {EXP=8136,AllEXP=781056},
	[38] = {EXP=8496,AllEXP=815616},
	[39] = {EXP=8856,AllEXP=850176},
	[40] = {EXP=9216,AllEXP=884736},
	[41] = {EXP=10296,AllEXP=988416},
	[42] = {EXP=10728,AllEXP=1029888},
	[43] = {EXP=11160,AllEXP=1071360},
	[44] = {EXP=11592,AllEXP=1112832},
	[45] = {EXP=12024,AllEXP=1154304},
	[46] = {EXP=12456,AllEXP=1195776},
	[47] = {EXP=12888,AllEXP=1237248},
	[48] = {EXP=13320,AllEXP=1278720},
	[49] = {EXP=13752,AllEXP=1320192},
	[50] = {EXP=14184,AllEXP=1361664},
	[51] = {EXP=14184,AllEXP=1361664},
	[52] = {EXP=14184,AllEXP=1361664},
	[53] = {EXP=14184,AllEXP=1361664},
	[54] = {EXP=14184,AllEXP=1361664},
	[55] = {EXP=14184,AllEXP=1361664},
	[56] = {EXP=15204,AllEXP=1459584},
	[57] = {EXP=15666,AllEXP=1503936},
	[58] = {EXP=16128,AllEXP=1548288},
	[59] = {EXP=16587,AllEXP=1592352},
	[60] = {EXP=17049,AllEXP=1636704},
	[61] = {EXP=17508,AllEXP=1680768},
	[62] = {EXP=17970,AllEXP=1725120},
	[63] = {EXP=18432,AllEXP=1769472},
	[64] = {EXP=18891,AllEXP=1813536},
	[65] = {EXP=19353,AllEXP=1857888},
	[66] = {EXP=20736,AllEXP=1990656},
	[67] = {EXP=21252,AllEXP=2040192},
	[68] = {EXP=21771,AllEXP=2090016},
	[69] = {EXP=22290,AllEXP=2139840},
	[70] = {EXP=22809,AllEXP=2189664},
	[71] = {EXP=24363,AllEXP=2338848},
	[72] = {EXP=24939,AllEXP=2394144},
	[73] = {EXP=25515,AllEXP=2449440},
	[74] = {EXP=26091,AllEXP=2504736},
	[75] = {EXP=26667,AllEXP=2560032},
	[76] = {EXP=27243,AllEXP=2615328},
	[77] = {EXP=27819,AllEXP=2670624},
	[78] = {EXP=28395,AllEXP=2725920},
	[79] = {EXP=28971,AllEXP=2781216},
	[80] = {EXP=29547,AllEXP=2836512},
	[81] = {EXP=31275,AllEXP=3002400},
	[82] = {EXP=31908,AllEXP=3063168},
	[83] = {EXP=32544,AllEXP=3124224},
	[84] = {EXP=33177,AllEXP=3184992},
	[85] = {EXP=33810,AllEXP=3245760},
}

XiongDiHui_BJGetPetTable = {
	[1] = {LV=36,PetID1=726330,PetID2=726350,PetID3=726370},
	[2] = {LV=37,PetID1=726331,PetID2=726351,PetID3=726371},
	[3] = {LV=38,PetID1=726332,PetID2=726352,PetID3=726372},
	[4] = {LV=39,PetID1=726333,PetID2=726353,PetID3=726373},
	[5] = {LV=40,PetID1=726334,PetID2=726354,PetID3=726374},
	[6] = {LV=41,PetID1=726335,PetID2=726355,PetID3=726375},
	[7] = {LV=42,PetID1=726336,PetID2=726356,PetID3=726376},
	[8] = {LV=43,PetID1=726337,PetID2=726357,PetID3=726377},
	[9] = {LV=44,PetID1=726338,PetID2=726358,PetID3=726378},
	[10] = {LV=45,PetID1=726339,PetID2=726359,PetID3=726379},
	[11] = {LV=46,PetID1=726340,PetID2=726360,PetID3=726380},
	[12] = {LV=47,PetID1=726341,PetID2=726361,PetID3=726381},
	[13] = {LV=48,PetID1=726342,PetID2=726362,PetID3=726382},
	[14] = {LV=49,PetID1=726343,PetID2=726363,PetID3=726383},
	[15] = {LV=50,PetID1=726344,PetID2=726364,PetID3=726384},
	[16] = {LV=51,PetID1=726345,PetID2=726365,PetID3=726385},
	[17] = {LV=52,PetID1=726346,PetID2=726366,PetID3=726386},
	[18] = {LV=53,PetID1=726347,PetID2=726367,PetID3=726387},
	[19] = {LV=54,PetID1=726348,PetID2=726368,PetID3=726388},
	[20] = {LV=55,PetID1=726349,PetID2=726369,PetID3=726389},
	[21] = {LV=56,PetID1=726556,PetID2=726656,PetID3=726756},
	[22] = {LV=57,PetID1=726557,PetID2=726657,PetID3=726757},
	[23] = {LV=58,PetID1=726558,PetID2=726658,PetID3=726758},
	[24] = {LV=59,PetID1=726559,PetID2=726659,PetID3=726759},
	[25] = {LV=60,PetID1=726560,PetID2=726660,PetID3=726760},
	[26] = {LV=61,PetID1=726561,PetID2=726661,PetID3=726761},
	[27] = {LV=62,PetID1=726562,PetID2=726662,PetID3=726762},
	[28] = {LV=63,PetID1=726563,PetID2=726663,PetID3=726763},
	[29] = {LV=64,PetID1=726564,PetID2=726664,PetID3=726764},
	[30] = {LV=65,PetID1=726565,PetID2=726665,PetID3=726765},
}

--兄弟会BUFF增益表
XiongDiHui_BJBUFFXiaoGuo_Table = {
	{BUFFID=763001,BUFFName='兄弟会意志',MaxNum=5,BUFFXiaoGuo='各类型攻击力增加25点，持续时间：1小时'},
	{BUFFID=763002,BUFFName='兄弟会意志',MaxNum=5,BUFFXiaoGuo='各类型防御力增加20点，持续时间：1小时'},
	{BUFFID=763003,BUFFName='兄弟会意志',MaxNum=5,BUFFXiaoGuo='移动速度增加5%，持续时间：1小时'},
	{BUFFID=763004,BUFFName='兄弟会意志',MaxNum=5,BUFFXiaoGuo='暴击抵抗增加10%，持续时间：1小时'},
	{BUFFID=763005,BUFFName='兄弟会意志',MaxNum=5,BUFFXiaoGuo='各类型攻击暴击增加100点，持续时间：1小时'},
	{BUFFID=763006,BUFFName='兄弟会意志',MaxNum=5,BUFFXiaoGuo='反击机率增加10%，持续时间：1小时'},
}

--Key:存储控制NPC的兄弟会ID；Key2:存储兄弟会领取管理费情况；Key3:存储控制NPC的兄弟会老大名字
if XiongDiHui_BJNPC_Table == nil then
	XiongDiHui_BJNPC_Table = {
		[111] = {
				{NPCID1=12208,NPCID2=12209,X=473,Y=163,FastID=0,FenShenFastID=0,Key=1,PKID=-1,Key2=11,Key3=21},--真实坐标：93，379
				{NPCID1=12208,NPCID2=12209,X=345,Y=387,FastID=0,FenShenFastID=0,Key=2,PKID=-1,Key2=12,Key3=22},--真实坐标：141，203
				{NPCID1=12208,NPCID2=12209,X=344,Y=594,FastID=0,FenShenFastID=0,Key=3,PKID=-1,Key2=13,Key3=23},--真实坐标：244，99
		},
	}
end

--创建争夺NPC(正常NPC)
--光明遗迹
if API_GetServerID() == 1 then
	if XiongDiHui_BJNPC_Table ~= nil then
		local ZhiHuiGuan = XiongDiHui_BJNPC_Table[111][1].NPCID1
		for i in XiongDiHui_BJNPC_Table[111] do
			local X = XiongDiHui_BJNPC_Table[111][i].X
			local Y = XiongDiHui_BJNPC_Table[111][i].Y
			local TML_XiongDiHui_ZhiHuiGuan = XiongDiHui_BJNPC_Table[111][i].FastID
			if TML_XiongDiHui_ZhiHuiGuan ~= nil and TML_XiongDiHui_ZhiHuiGuan ~= 0 then
				if API_GetMonsterID(TML_XiongDiHui_ZhiHuiGuan) > 0 then
					API_DestroyMonster(TML_XiongDiHui_ZhiHuiGuan)
				end
			end
			TML_XiongDiHui_ZhiHuiGuan = API_CreateMonsterEx(111,ZhiHuiGuan,X,Y,4,0,-1,1)
			XiongDiHui_BJNPC_Table[111][i].FastID = TML_XiongDiHui_ZhiHuiGuan
		end
	end
end

--~ function UpdateActorBHStatus(ActorID,XiongDiHuiID) --更新角色兄弟会关系
--~ 	local MapID = API_GetActorMapID(ActorID)
--~ 	local MapConfigID = API_GetMapConfigID(MapID)
--~ 	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
--~ 	local PuCongFastID = API_VarDataGetNumber(ActorID,1,11830)
--~ 	if Hour == TML_XiongDiHui_BJStartHour and (Minute >= TML_XiongDiHui_BJStartMinute and Minute <= TML_XiongDiHui_BJEndMinute) then
--~ 		if MapConfigID == BoJueMapID then
--~ 			if XiongDiHuiID == 0 then	--退出兄弟会
--~ 				API_ActorSetPKTeamID(ActorID,-1)
--~ 				if ep_PCfaID[ActorID] ~= nil then
--~ 					if ep_PCfaID[ActorID][1] ~= nil then
--~ 						local PCFastID1 = ep_PCfaID[ActorID][1]
--~ 						API_SetMonsterPKTeamID(PCFastID1,-1)
--~ 					end
--~ 					if ep_PCfaID[ActorID][2] ~= nil then
--~ 						local PCFastID2 = ep_PCfaID[ActorID][2]
--~ 						API_SetMonsterPKTeamID(PCFastID2,-1)
--~ 					end
--~ 				end
--~ 			else						--加入兄弟会
--~ 				API_ActorSetPKTeamID(ActorID,XiongDiHuiID)
--~ 				if ep_PCfaID[ActorID] ~= nil then
--~ 					if ep_PCfaID[ActorID][1] ~= nil then
--~ 						local PCFastID1 = ep_PCfaID[ActorID][1]
--~ 						API_SetMonsterPKTeamID(PCFastID1,XiongDiHuiID)
--~ 					end
--~ 					if ep_PCfaID[ActorID][2] ~= nil then
--~ 						local PCFastID2 = ep_PCfaID[ActorID][2]
--~ 						API_SetMonsterPKTeamID(PCFastID2,XiongDiHuiID)
--~ 					end
--~ 				end
--~ 			end
--~ 		end
--~ 	end
--~ 	if XiongDiHuiID == 0 then
--~ 		if PuCongFastID ~= 0 and PuCongFastID ~= nil then
--~ 			if API_GetMonsterID(PuCongFastID) > 0 then
--~ 				API_DestroyMonster(PuCongFastID)
--~ 			end
--~ 		end
--~ 	end
--~ end

function XiongDiHui_BJNPC_title(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local ActorMoney = API_ActorGetPropNum(ActorID,156)
	local ActorName = API_GetActorName(ActorID)
	local CampID = API_GetActorCamp(ActorID)
	local ActorLV = API_GetActorExpLevel(ActorID)
	local ActorX = API_GetActorPosX(ActorID)
	local ActorY = API_GetActorPosY(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local XiongDiHuiID = API_GetBrotherhoodID(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMDH = Year * 1000000 + Month * 10000 + Day * 100 + Hour
	local PlayLQYMDH = API_VarDataGetNumber(ActorID,1,11825)
	local PlayLQYMDH2 = API_VarDataGetNumber(ActorID,1,11831)
	local PlayLQYear = math.floor(PlayLQYMDH/1000000)
	local PlayLQYear2 = math.floor(PlayLQYMDH2/1000000)
	local PlayLQMonthDayHour = math.mod(PlayLQYMDH,1000000)
	local PlayLQMonthDayHour2 = math.mod(PlayLQYMDH2,1000000)
	local PlayLQMonth = math.floor(PlayLQMonthDayHour/10000)
	local PlayLQMonth2 = math.floor(PlayLQMonthDayHour2/10000)
	local PlayLQDayHour = math.mod(PlayLQMonthDayHour,10000)
	local PlayLQDayHour2 = math.mod(PlayLQMonthDayHour2,10000)
	local PlayLQDay = math.floor(PlayLQDayHour/100)
	local PlayLQDay2 = math.floor(PlayLQDayHour2/100)
	local PlayLQHour = math.mod(PlayLQDayHour,100)
	local PlayLQHour2 = math.mod(PlayLQDayHour2,100)
	if (Day > PlayLQDay and Hour >= TML_XiongDiHui_BJEndHour) or Day > PlayLQDay + 1 then
		API_VarDataSetNumber(ActorID,1,11826,0)
	end
	if Day == PlayLQDay and Hour >= TML_XiongDiHui_BJEndHour and PlayLQHour < TML_XiongDiHui_BJStartHour then
		API_VarDataSetNumber(ActorID,1,11826,0)
	end
	if (Day > PlayLQDay2 and Hour >= TML_XiongDiHui_BJEndHour) or Day > PlayLQDay2 + 1 then
		API_VarDataSetNumber(ActorID,1,11830,0)
	end
	if Day == PlayLQDay2 and Hour >= TML_XiongDiHui_BJEndHour and PlayLQHour2 < TML_XiongDiHui_BJStartHour then
		API_VarDataSetNumber(ActorID,1,11830,0)
	end
	local XiongDiHuiName = ''
	if XiongDiHuiID > 0 then
		XiongDiHuiName = API_BrotherhoodGetName(XiongDiHuiID)
	end
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712) --玩家点击的NPCFastID
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 0 then
		for i in XiongDiHui_BJNPC_Table[MapConfigID] do
			local FastID = XiongDiHui_BJNPC_Table[MapConfigID][i].FastID
			local Key = XiongDiHui_BJNPC_Table[MapConfigID][i].Key
			if FastID == NPCFastID then
				local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				if XiongDiHuiID > 0 then
					if KongZhiID > 0 then
						if KongZhiID == XiongDiHuiID then
							API_ResponseWrite('<br><a href="XiongDiHui_BJNPC_title?1=1">占领指挥官兄弟会查询</a>')
							API_ResponseWrite('<text>                   </text>')
							API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=2">查询占领指挥官可获得的经验值</a><br><br>')
							API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=3">查询兄弟会声望值</a>')
							API_ResponseWrite('<text>                       </text>')
							API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=4">领取管理费</a><br><br>')
							API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=6">领取兄弟会增益效果</a>')
							API_ResponseWrite('<text>                     </text>')
							API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=9">领取人马守护</a><br><br>')
							API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=8">关于兄弟会争夺指挥官的说明</a>')
							API_ResponseWrite('<text>             </text>')
							API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=13">关于奖励</a><br><br>')
							API_ResponseWrite('<br><br><a>离开</a>')
						else
							API_ResponseWrite('<br><a href="XiongDiHui_BJNPC_title?1=1">占领指挥官兄弟会查询</a>')
							API_ResponseWrite('<text>                   </text>')
							API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=2">查询占领指挥官可获得的经验值</a><br><br>')
							API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=3">查询兄弟会声望值</a>')
							API_ResponseWrite('<text>                       </text>')
							API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=8">关于兄弟会争夺指挥官的说明</a><br><br>')
							API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=13">关于奖励</a><br><br>')
							API_ResponseWrite('<br><br><a>离开</a>')
						end
					else
						API_ResponseWrite('<br><a href="XiongDiHui_BJNPC_title?1=1">占领指挥官兄弟会查询</a>')
						API_ResponseWrite('<text>                   </text>')
						API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=2">查询占领指挥官可获得的经验值</a><br><br>')
						API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=3">查询兄弟会声望值</a>')
						API_ResponseWrite('<text>                       </text>')
						API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=8">关于兄弟会争夺指挥官的说明</a><br><br>')
						API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=13">关于奖励</a><br><br>')
						API_ResponseWrite('<br><br><a>离开</a>')
					end
				else
					API_ResponseWrite('<br><a href="XiongDiHui_BJNPC_title?1=1">占领指挥官兄弟会查询</a><br><br>')
					API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=2">查询占领指挥官可获得的经验值</a><br><br>')
					API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=8">关于兄弟会争夺指挥官的说明</a><br><br>')
					API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=13">关于奖励</a><br><br>')
					API_ResponseWrite('<br><br><a>离开</a>')
				end
				break
			end
		end
	elseif SelectItem == 1 then
		local KongZhiID = 0
		local LaoDaName = ''
		for i in XiongDiHui_BJNPC_Table[MapConfigID] do
			local FastID = XiongDiHui_BJNPC_Table[MapConfigID][i].FastID
			local Key = XiongDiHui_BJNPC_Table[MapConfigID][i].Key
			local Key3 = XiongDiHui_BJNPC_Table[MapConfigID][i].Key3
			if FastID == NPCFastID then
				KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				LaoDaName = API_VarDataGetString_Ex(1,0,OwnerID,1,Key3)
				break
			end
		end
		if KongZhiID > 0 then
			if API_BrotherhoodGetName(KongZhiID) ~= nil then
				API_ResponseWrite('<text>当前控制我的兄弟会是：</text><text color="255,0,255">'..API_BrotherhoodGetName(KongZhiID)..'</text><br><br>')
				API_ResponseWrite('<text>该兄弟会会长是：</text>')
				local KongZhiTable = API_BrotherhoodGetAllActor(KongZhiID)
				if KongZhiTable == nil or table.getn(KongZhiTable) == 0 then
					API_ResponseWrite('<text color="0,255,255">'..LaoDaName..'</text>')
				else
					for j,v in KongZhiTable do
						if API_BrotherhoodGetMaster(0,v) == 1 then
							API_ResponseWrite('<text color="0,255,255">'..API_BrotherhoodGetActorName(v)..'</text>')
						end
					end
				end
				API_ResponseWrite('<br><br><a href="XiongDiHui_BJNPC_title?1=0">返回</a>')
			else
				API_ResponseWrite('<text>当前没有兄弟会控制我。</text><br><br>')
				API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=0">返回</a>')
			end
		else
			API_ResponseWrite('<text>当前没有兄弟会控制我。</text><br><br>')
			API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=0">返回</a>')
		end
	elseif SelectItem == 2 then
		if XiongDiHui_BJSendEXPTable ~= nil then
			local AllEXP = XiongDiHui_BJSendEXPTable[ActorLV].AllEXP
			local EXP = XiongDiHui_BJSendEXPTable[ActorLV].EXP
			API_ResponseWrite('<text>您的等级为</text><text color="255,0,255">'..ActorLV..'级</text><text>，成功占领我后在线24小时能获得</text><text color="255,0,255">'..AllEXP..'点经验值</text><text>。每15分钟发送一次经验，每次能获得</text><text color="255,0,255">'..EXP..'点经验值</text>')
			API_ResponseWrite('<br><br><a href="XiongDiHui_BJNPC_title?1=0">返回</a>')
		end
	elseif SelectItem == 3 then
		if XiongDiHuiID > 0 then
			API_ResponseWrite('<br><text>你的兄弟会声望值是：</text><text color="255,0,255">'..API_BrotherhoodGetScore(XiongDiHuiID)..'</text><br><br>')
			API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=0">返回</a>')
		else
			API_ResponseWrite('<br><text>你没有加入兄弟会，不能查询。</text><br><br>')
			API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=0">返回</a>')
		end
	elseif SelectItem == 4 then
		API_ResponseWrite('<text>成功占领我的兄弟会会长可以领取</text><text color="255,0,255">'..TML_XDH_BJXiongDiHuiGLF..'金币</text><text>的兄弟会管理费，每成功占领一次可以领取一次管理费。</text><br><br>')
		API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=5">领取管理费</a><br><br>')
		API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=0">返回</a>')
	elseif SelectItem == 5 then
		local KongZhiID = 0
		local ShiFouGetGold = 0
		local Key2 = 0
		for i in XiongDiHui_BJNPC_Table[MapConfigID] do
			local FastID = XiongDiHui_BJNPC_Table[MapConfigID][i].FastID
			local Key = XiongDiHui_BJNPC_Table[MapConfigID][i].Key
			Key2 = XiongDiHui_BJNPC_Table[MapConfigID][i].Key2
			if FastID == NPCFastID then
				KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				ShiFouGetGold = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key2)
				break
			end
		end
		if XiongDiHuiID > 0 then
			if XiongDiHuiID == KongZhiID then
				if API_BrotherhoodGetMaster(0,ActorID) == 1 then
					if ShiFouGetGold == 0 then
						if (ActorMoney + TML_XDH_BJXiongDiHuiGLF) <= 50000000 then
							API_ActorAddMoney(ActorID,TML_XDH_BJXiongDiHuiGLF,0,'领取管理费')
							API_ActorSendMsg(ActorID,3,'成功领取'..TML_XDH_BJXiongDiHuiGLF..'金币管理费')
							API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  × '..TML_XDH_BJXiongDiHuiGLF..'</text><br>')
							API_ResponseWrite('<br><text>恭喜您成功领取了</text><text color="255,0,255">'..TML_XDH_BJXiongDiHuiGLF..'金币</text><text>的兄弟会管理费。</text><br><br><br>')
							API_ResponseWrite('<a>确定</a>')
							API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key2,1)
						else
							API_ResponseWrite('<text>领取管理费后你身上的金币数量将超过五千万上限，请确保领取后金币数量没有超过上限再来领取。</text><br><br>')
							API_ResponseWrite('<a>确定</a>')
						end
					else
						API_ResponseWrite('<text>你的兄弟会已经领取过管理费，成功争夺一次只能领取一次管理费。</text><br><br>')
						API_ResponseWrite('<a>确定</a>')
					end
				else
					API_ResponseWrite('<text>你不是兄弟会会长，只有兄弟会会长才能领取管理费。</text><br><br>')
					API_ResponseWrite('<a>确定</a>')
				end
			else
				API_ResponseWrite('<text>你的兄弟会没有占领我，不能领取管理费。</text><br><br>')
				API_ResponseWrite('<a>确定</a>')
			end
		else
			API_ResponseWrite('<text>你还没有加入兄弟会，只有加入兄弟会后并且成功占领我才能领取管理费。</text><br><br>')
			API_ResponseWrite('<a>确定</a>')
		end
	elseif SelectItem == 6 then	--直接随机领取BUFF效果，可以领5次，后面领的会冲掉前面的BUFF效果
		API_ResponseWrite('<text>成功争夺我的兄弟会成员可以在我这里领取</text><text color="255,0,255">'..TML_XDH_BJBUFFNum..'次</text><text>增益效果。每领取一次都能随机得到一种增益效果，持续1小时，再次领取会覆盖前面的增益效果</text><br><br>')
		API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=7">领取增益效果</a><br><br>')
		API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=0">返回</a>')
	elseif SelectItem == 7 then
		local KongZhiID = 0
		for i in XiongDiHui_BJNPC_Table[MapConfigID] do
			local FastID = XiongDiHui_BJNPC_Table[MapConfigID][i].FastID
			local Key = XiongDiHui_BJNPC_Table[MapConfigID][i].Key
			if FastID == NPCFastID then
				KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				break
			end
		end
		if XiongDiHuiID > 0 then
			if XiongDiHuiID == KongZhiID then
				local SuiJiHang = XiongDiHui_BJBUFFXiaoGuo_Table[math.random(table.getn(XiongDiHui_BJBUFFXiaoGuo_Table))]
				local BUFFID = SuiJiHang.BUFFID
				local MaxNum = SuiJiHang.MaxNum
				local BUFFName = SuiJiHang.BUFFName
				local BUFFXiaoGuo = SuiJiHang.BUFFXiaoGuo
				local LQNumNow = API_VarDataGetNumber(ActorID,1,11826)
				if LQNumNow < MaxNum then
					API_ActorAddStatus(ActorID,BUFFID,0)
					LQNumNow = LQNumNow + 1
					API_VarDataSetNumber(ActorID,1,11826,LQNumNow)
					API_VarDataSetNumber(ActorID,1,11825,YMDH)
					local HaiYouCishu = MaxNum - LQNumNow
					API_ResponseWrite('<text>恭喜你成功领取了一次增益效果，增益效果为</text><text color="255,0,255">'..BUFFXiaoGuo..'</text><br><br>')
					API_ResponseWrite('<text>下一次争夺战开始前你还可以随机领取</text><text color="255,0,255">'..HaiYouCishu..'次</text><text>增益效果。</text><br><br><br>')
					API_ResponseWrite('<a>确定</a>')
				else
					API_ResponseWrite('<text>你已经领取过</text><text color="255,0,255">'..TML_XDH_BJBUFFNum..'次</text><text>增益效果，不能再领取了。</text><br><br>')
					API_ResponseWrite('<a>确定</a>')
				end
			else
				API_ResponseWrite('<text>你的兄弟会没有占领我，不能领取增益效果。</text><br><br>')
				API_ResponseWrite('<a>确定</a>')
			end
		else
			API_ResponseWrite('<text>你还没有加入兄弟会，只有加入兄弟会后并且成功占领我才能领取增益效果。</text><br><br>')
			API_ResponseWrite('<a>确定</a>')
		end
	elseif SelectItem == 8 then
		API_ResponseWrite('<text>每天的</text><text color="255,0,255">'..TML_XiongDiHui_BJStartHour..':00</text><text>兄弟会成员可以在我这里进行争夺战</text><br><br>')
		API_ResponseWrite('<text color="255,0,255">光明遗迹指挥官争夺战玩法：</text><br>')
		API_ResponseWrite('<text color="0,255,255">1、开战时间到时，除了己方兄弟会成员，其他兄弟会成员的血条变为可攻击的红色；</text><br>')
		API_ResponseWrite('<text color="0,255,255">2、所有兄弟会的成员都可以攻击指挥官，指挥官死亡时判断由哪个兄弟会的成员杀死，然后指挥官临时归为由哪个兄弟会占领；</text><br>')
		API_ResponseWrite('<text color="0,255,255">3、这时，在原地立刻会出现一个新的满血的指挥官，临时占领指挥官的兄弟会成为防守方，不能攻击该指挥官，可以使用回复技能为指挥官加血，并且需要阻止其他兄弟会成员攻击指挥官；</text><br>')
		API_ResponseWrite('<text color="0,255,255">4、其他兄弟会成员则能继续攻击该指挥官，指挥官死亡后，又临时归为成功击杀的兄弟会占领；</text><br>')
		API_ResponseWrite('<text color="0,255,255">5、30分钟时间到时，最后占领该指挥官的兄弟会争夺成功，拥有其控制权。</text><br>')
		API_ResponseWrite('<text color="255,0,255">在争夺过程中指挥官有时会一分为二，真假难辨，望各位英雄都能成功击杀真的指挥官</text>')
		API_ResponseWrite('<br><br><a href="XiongDiHui_BJNPC_title?1=0">返回</a>')
	elseif SelectItem == 9 then
		API_ResponseWrite('<text>成功争夺我的兄弟会成员可以在我这里领取一个异常强大的人马守护，争夺成功只能领取一个（不管控制了几个指挥官）。</text><br><br>')
		API_ResponseWrite('<text>领取人马守护规则：</text><br>')
		API_ResponseWrite('<text>1、人马守护死亡后消失，不能再次领取</text><br>')
		API_ResponseWrite('<text>2、切换地图和换线后人马守护不消失，进入拉锯浮空岛后也不消失（人马守护可以存在整个游戏世界）</text><br>')
		API_ResponseWrite('<text>3、玩家下线后人马守护消失，下次争夺战开始时人马守护消失</text><br>')
		API_ResponseWrite('<text>4、玩家退出兄弟会或者被会长踢出兄弟会后人马守护消失</text><br>')
		API_ResponseWrite('<text>5、根据玩家等级领取的人马守护有强弱之分。等级越高，领取的人马守护越强</text><br><br>')
		API_ResponseWrite('<text color="255,0,255">人马守护（物理攻击）  </text>')
		API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=10">领取</a>')
		API_ResponseWrite('<text color="255,0,255">        人马守护（火药攻击）  </text>')
		API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=11">领取</a>')
		API_ResponseWrite('<text color="255,0,255">        人马守护（魔法攻击）  </text>')
		API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=12">领取</a><br><br><br>')
		API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=0">返回</a>')
	elseif SelectItem == 10 then
		local KongZhiID = 0
		for i in XiongDiHui_BJNPC_Table[MapConfigID] do
			local FastID = XiongDiHui_BJNPC_Table[MapConfigID][i].FastID
			local Key = XiongDiHui_BJNPC_Table[MapConfigID][i].Key
			if FastID == NPCFastID then
				KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				break
			end
		end
		if XiongDiHuiID > 0 then
			if XiongDiHuiID == KongZhiID then
				if API_VarDataGetNumber(ActorID,1,11830) == 0 then
					if XiongDiHui_BJGetPetTable ~= nil then
						for i in XiongDiHui_BJGetPetTable do
							local LV = XiongDiHui_BJGetPetTable[i].LV
							local PetID1 = XiongDiHui_BJGetPetTable[i].PetID1
							if ActorLV == LV then
								PuCongFastID = API_CreateMonsterEx(MapID,PetID1,ActorX,ActorY,4,0,CampID,-1)
								API_SetMonsterName(PuCongFastID,'['..ActorName..'] 的人马守护',1)	--设置仆从名字
								API_SetActorChief(PuCongFastID,ActorID)	--设置仆从主人
								API_SetMonsterPrizeActor(PuCongFastID,ActorID)	--设置仆从的获益玩家
								API_VarDataSetNumber(ActorID,1,11830,PuCongFastID)
								API_VarDataSetNumber(ActorID,1,11831,YMDH)
								API_VarDataSetNumber(ActorID,1,11833,PetID1)
								API_ResponseWrite('<text>恭喜您成功领取了人马守护（物理攻击）</text><br><br>')
								API_ResponseWrite('<a>确定</a>')
							end
						end
					end
				else
					API_ResponseWrite('<text>你已经领取过人马守护了，不能再次领取。成功争夺一次只能领取一次人马守护。</text><br><br>')
					API_ResponseWrite('<a>确定</a>')
				end
			else
				API_ResponseWrite('<text>你的兄弟会没有占领我，不能领取人马守护。</text><br><br>')
				API_ResponseWrite('<a>确定</a>')
			end
		else
			API_ResponseWrite('<text>你还没有加入兄弟会，只有加入兄弟会并且成功占领我后才能领取人马守护。</text><br><br>')
			API_ResponseWrite('<a>确定</a>')
		end
	elseif SelectItem == 11 then
		local KongZhiID = 0
		for i in XiongDiHui_BJNPC_Table[MapConfigID] do
			local FastID = XiongDiHui_BJNPC_Table[MapConfigID][i].FastID
			local Key = XiongDiHui_BJNPC_Table[MapConfigID][i].Key
			if FastID == NPCFastID then
				KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				break
			end
		end
		if XiongDiHuiID > 0 then
			if XiongDiHuiID == KongZhiID then
				if API_VarDataGetNumber(ActorID,1,11830) == 0 then
					if XiongDiHui_BJGetPetTable ~= nil then
						for i in XiongDiHui_BJGetPetTable do
							local LV = XiongDiHui_BJGetPetTable[i].LV
							local PetID2 = XiongDiHui_BJGetPetTable[i].PetID2
							if ActorLV == LV then
								PuCongFastID = API_CreateMonsterEx(MapID,PetID2,ActorX,ActorY,4,0,CampID,-1)
								API_SetMonsterName(PuCongFastID,'['..ActorName..'] 的人马守护',1)	--设置仆从名字
								API_SetActorChief(PuCongFastID,ActorID)	--设置仆从主人
								API_SetMonsterPrizeActor(PuCongFastID,ActorID)	--设置仆从的获益玩家
								API_VarDataSetNumber(ActorID,1,11830,PuCongFastID)
								API_VarDataSetNumber(ActorID,1,11831,YMDH)
								API_VarDataSetNumber(ActorID,1,11833,PetID2)
								API_ResponseWrite('<text>恭喜您成功领取了人马守护（火药攻击）</text><br><br>')
								API_ResponseWrite('<a>确定</a>')
							end
						end
					end
				else
					API_ResponseWrite('<text>你已经领取过人马守护了，不能再次领取。成功争夺一次只能领取一次人马守护。</text><br><br>')
					API_ResponseWrite('<a>确定</a>')
				end
			else
				API_ResponseWrite('<text>你的兄弟会没有占领我，不能领取人马守护。</text><br><br>')
				API_ResponseWrite('<a>确定</a>')
			end
		else
			API_ResponseWrite('<text>你还没有加入兄弟会，只有加入兄弟会并且成功占领我后才能领取人马守护。</text><br><br>')
			API_ResponseWrite('<a>确定</a>')
		end
	elseif SelectItem == 12 then
		local KongZhiID = 0
		for i in XiongDiHui_BJNPC_Table[MapConfigID] do
			local FastID = XiongDiHui_BJNPC_Table[MapConfigID][i].FastID
			local Key = XiongDiHui_BJNPC_Table[MapConfigID][i].Key
			if FastID == NPCFastID then
				KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				break
			end
		end
		if XiongDiHuiID > 0 then
			if XiongDiHuiID == KongZhiID then
				if API_VarDataGetNumber(ActorID,1,11830) == 0 then
					if XiongDiHui_BJGetPetTable ~= nil then
						for i in XiongDiHui_BJGetPetTable do
							local LV = XiongDiHui_BJGetPetTable[i].LV
							local PetID3 = XiongDiHui_BJGetPetTable[i].PetID3
							if ActorLV == LV then
								PuCongFastID = API_CreateMonsterEx(MapID,PetID3,ActorX,ActorY,4,0,CampID,-1)
								API_SetMonsterName(PuCongFastID,'['..ActorName..'] 的人马守护',1)	--设置仆从名字
								API_SetActorChief(PuCongFastID,ActorID)	--设置仆从主人
								API_SetMonsterPrizeActor(PuCongFastID,ActorID)	--设置仆从的获益玩家
								API_VarDataSetNumber(ActorID,1,11830,PuCongFastID)
								API_VarDataSetNumber(ActorID,1,11831,YMDH)
								API_VarDataSetNumber(ActorID,1,11833,PetID3)
								API_ResponseWrite('<text>恭喜您成功领取了人马守护（魔法攻击）</text><br><br>')
								API_ResponseWrite('<a>确定</a>')
							end
						end
					end
				else
					API_ResponseWrite('<text>你已经领取过人马守护了，不能再次领取。成功争夺一次只能领取一次人马守护。</text><br><br>')
					API_ResponseWrite('<a>确定</a>')
				end
			else
				API_ResponseWrite('<text>你的兄弟会没有占领我，不能领取人马守护。</text><br><br>')
				API_ResponseWrite('<a>确定</a>')
			end
		else
			API_ResponseWrite('<text>你还没有加入兄弟会，只有加入兄弟会并且成功占领我后才能领取人马守护。</text><br><br>')
			API_ResponseWrite('<a>确定</a>')
		end
	elseif SelectItem == 13 then
		API_ResponseWrite('<br><text>1、争夺战结束时成功控制我的兄弟会会增加</text><text color="255,0,255">100点声望值</text><text>，声望值越高，体现在兄弟会声望排行榜上将越靠前；</text><br>')
		API_ResponseWrite('<br><text>2、争夺成功的兄弟会会长可以领取</text><text color="255,0,255">3万金币</text><text>的兄弟会管理费；</text><br>')
		API_ResponseWrite('<br><text>3、争夺成功的兄弟会所有成员可以领取</text><text color="255,0,255">5次兄弟会增益效果；</text><br>')
		API_ResponseWrite('<br><text>4、争夺成功的兄弟会所有在线成员有</text><text color="255,0,255">每15分钟的经验加成；</text><br>')
		API_ResponseWrite('<br><text>5、争夺成功的兄弟会所有成员可以领取一个</text><text color="255,0,255">异常强大的人马守护；</text><br><br><br>')
		API_ResponseWrite('<a href="XiongDiHui_BJNPC_title?1=0">返回</a>')
	end
end

--NPC争夺战触发器
if BJNPCBattle_CFQ ~= nil then
	API_DestroyTriggerG(BJNPCBattle_CFQ)
end
BJNPCBattle_CFQ = API_CreateTimerTriggerG(0,0,60,-1,'BJNPCBattle_TimerTriggerGCallFunc')

--NPC争夺成功奖励触发器
if BJNPCBattle_SendEXP_CFQ ~= nil then
	API_DestroyTriggerG(BJNPCBattle_SendEXP_CFQ)
end
BJNPCBattle_SendEXP_CFQ = API_CreateTimerTriggerG(0,0,60,-1,'BJNPCSendEXP_TimerTriggerGCallFunc')

function BJNPCSendEXP_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == TML_XiongDiHui_BJStartHour and Minute >= TML_XiongDiHui_BJStartMinute and Minute <= TML_XiongDiHui_BJEndMinute then
		return
	end
	XiongDiHui_NPC_BJJiaoHuDate = {}
	XiongDiHui_NPC_BJJiaoHuDate[111] = {[1] = 11827,[2] = 11828,[3] = 11829,}
	if math.mod(Minute,15) == 0 then
		local Time = Day * 10000 + Hour * 100 + Minute
		for i in XiongDiHui_BJNPC_Table[111] do
			local Key = XiongDiHui_BJNPC_Table[111][i].Key
			local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
			local JiaoHuDate = XiongDiHui_NPC_BJJiaoHuDate[111][i]
			if KongZhiID ~= 0 then
				local XiongDiHuiTable = API_BrotherhoodGetAllActor(KongZhiID)
				if XiongDiHuiTable ~= nil then
					for j,v in XiongDiHuiTable do
						if API_GetActorServerID(v) == API_GetServerID() then
							local LV = API_GetActorExpLevel(v)
							if XiongDiHui_BJSendEXPTable ~= nil then
								if LV > 0 then
									local EXP = XiongDiHui_BJSendEXPTable[LV].EXP
									if API_GetActorServerID(v) ~= -1 then
										if API_VarDataGetNumber(v,1,JiaoHuDate) ~= Time then
											API_ActorAddExp(v,EXP,0,'争夺伯爵指挥官成功加经验值')
											API_ActorSendMsg(v,3,'占领光明遗迹指挥官获得'..EXP..'点经验值')
											API_VarDataSetNumber(v,1,JiaoHuDate,Time)
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

function BJNPCBattle_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == TML_XiongDiHui_BJStartHour and Minute == TML_XiongDiHui_BJStartMinute then
		TML_BJXiongDiHui_End = 0 --争夺战开始置结束标志为0
		API_SetAreaType(BoJueDTMapID,7,1)
		API_SetAreaType(BoJueDTMapID,8,1)
		API_SetAreaType(BoJueDTMapID,9,1)
		API_ActorCallBack(-1,0,-1,'XiongDiHui_BJQingChuShuJu')
		--删除正常NPC，创建可攻击NPC并且创建死亡触发器
		if API_GetServerID() == 1 then
			if XiongDiHui_BJNPC_Table ~= nil then
				local ZhiHuiGuan = XiongDiHui_BJNPC_Table[111][1].NPCID2
				for i in XiongDiHui_BJNPC_Table[111] do
					local X = XiongDiHui_BJNPC_Table[111][i].X
					local Y = XiongDiHui_BJNPC_Table[111][i].Y
					local TML_XiongDiHui_ZhiHuiGuan = XiongDiHui_BJNPC_Table[111][i].FastID
					local Key = XiongDiHui_BJNPC_Table[111][i].Key
					local Key2 = XiongDiHui_BJNPC_Table[111][i].Key2
					API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,0)
					API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key2,0)
					if TML_XiongDiHui_ZhiHuiGuan ~= nil and TML_XiongDiHui_ZhiHuiGuan ~= 0 then
						if API_GetMonsterID(TML_XiongDiHui_ZhiHuiGuan) > 0 then
							API_DestroyMonster(TML_XiongDiHui_ZhiHuiGuan)
						end
					end
					TML_XiongDiHui_ZhiHuiGuan = API_CreateMonsterEx(111,ZhiHuiGuan,X,Y,4,0,-1,-1)
					if API_GetMonsterID(TML_XiongDiHui_ZhiHuiGuan) > 0 then API_SetMonsterName(TML_XiongDiHui_ZhiHuiGuan,'[无人占领]',3) end
					API_MonsterAddStatus(TML_XiongDiHui_ZhiHuiGuan,783001,0)	--给NPC加免疫控制技能
					API_MonsterAddStatus(TML_XiongDiHui_ZhiHuiGuan,92001,0)	--给NPC加免疫控制技能
					API_CreateDieTriggerG(0,0,0,TML_XiongDiHui_ZhiHuiGuan,'BJNPCDie_DirTriggerGCallFunc')
					API_SetMonsterPKTeamID(TML_XiongDiHui_ZhiHuiGuan,0)
					XiongDiHui_BJNPC_Table[111][i].FastID = TML_XiongDiHui_ZhiHuiGuan
				end
			end
		end
	end
	--指挥官出分身
	if (Hour == TML_XiongDiHui_BJStartHour and Minute == 10) or (Hour == TML_XiongDiHui_BJStartHour and Minute == 20) or (Hour == TML_XiongDiHui_BJStartHour and Minute == 25) then
		if API_GetServerID() == 1 then
			if XiongDiHui_BJNPC_Table ~= nil then
				local ZhiHuiGuan = XiongDiHui_BJNPC_Table[111][1].NPCID2
				for i in XiongDiHui_BJNPC_Table[111] do
					local FenShenFastID = XiongDiHui_BJNPC_Table[111][i].FenShenFastID
					local RealFastID = XiongDiHui_BJNPC_Table[111][i].FastID
					local RealLife = API_MonsterGetPropNum(RealFastID,2)
					local EightPCLife = RealLife * 0.8
					local NeedCancelLife = TML_XDH_ZhiHuiGuanMaxLife - EightPCLife
					local RealX = XiongDiHui_BJNPC_Table[111][i].X
					local RealY = XiongDiHui_BJNPC_Table[111][i].Y
					local LeftX = RealX - 3
					local LeftY = RealY - 3
					local RightX = RealX + 3
					local RightY = RealY + 3
					local Key = XiongDiHui_BJNPC_Table[111][i].Key
					local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
					if FenShenFastID == 0 then
						if RealLife > 0 then
							if math.random(1,2) == 1 then	--丢骰子，如果丢中，1/2机率
								if math.random(1,2) == 1 then
									API_DestroyMonster(RealFastID)
									RealFastID = API_CreateMonsterEx(111,ZhiHuiGuan,LeftX,LeftY,4,0,-1,-1) --真的指挥官在左边
									if KongZhiID > 0 then
										if API_BrotherhoodGetName(KongZhiID) ~= nil then
											local KongZhiName = API_BrotherhoodGetName(KongZhiID)
											API_SetMonsterName(RealFastID,'['..KongZhiName..']占领',3)
										else
											if API_GetMonsterID(RealFastID) > 0 then API_SetMonsterName(RealFastID,'[无人占领]',3) end
										end
									else
										if API_GetMonsterID(RealFastID) > 0 then API_SetMonsterName(RealFastID,'[无人占领]',3) end
									end
									API_MonsterAddStatus(RealFastID,783001,0)	--给NPC加免疫控制技能
									API_MonsterAddStatus(RealFastID,92001,0)	--给NPC加免疫控制技能
									API_CreateDieTriggerG(0,0,0,RealFastID,'BJNPCDie_DirTriggerGCallFunc')
									API_SetMonsterPKTeamID(RealFastID,KongZhiID)
									API_MonsterAddHP(RealFastID,-NeedCancelLife) --设置指挥官血量（减半）
									XiongDiHui_BJNPC_Table[111][i].FastID = RealFastID
									FenShenFastID = API_CreateMonsterEx(111,ZhiHuiGuan,RightX,RightY,4,0,-1,-1) --假的指挥官在右边
									if KongZhiID > 0 then
										if API_BrotherhoodGetName(KongZhiID) ~= nil then
											local KongZhiName = API_BrotherhoodGetName(KongZhiID)
											API_SetMonsterName(FenShenFastID,'['..KongZhiName..']占领',3)
										else
											if API_GetMonsterID(FenShenFastID) > 0 then API_SetMonsterName(FenShenFastID,'[无人占领]',3) end
										end
									else
										if API_GetMonsterID(FenShenFastID) > 0 then API_SetMonsterName(FenShenFastID,'[无人占领]',3) end
									end
									API_MonsterAddStatus(FenShenFastID,783001,0)	--给NPC加免疫控制技能
									API_MonsterAddStatus(FenShenFastID,92001,0)	--给NPC加免疫控制技能
									API_SetMonsterPKTeamID(FenShenFastID,KongZhiID)
									API_MonsterAddHP(FenShenFastID,-NeedCancelLife) --设置指挥官血量（减半）
									XiongDiHui_BJNPC_Table[111][i].FenShenFastID = FenShenFastID
								elseif math.random(1,2) == 2 then
									API_DestroyMonster(RealFastID)
									RealFastID = API_CreateMonsterEx(111,ZhiHuiGuan,RightX,RightY,4,0,-1,-1) --真的指挥官在右边
									if KongZhiID > 0 then
										if API_BrotherhoodGetName(KongZhiID) ~= nil then
											local KongZhiName = API_BrotherhoodGetName(KongZhiID)
											API_SetMonsterName(RealFastID,'['..KongZhiName..']占领',3)
										else
											if API_GetMonsterID(RealFastID) > 0 then API_SetMonsterName(RealFastID,'[无人占领]',3) end
										end
									else
										if API_GetMonsterID(RealFastID) > 0 then API_SetMonsterName(RealFastID,'[无人占领]',3) end
									end
									API_MonsterAddStatus(RealFastID,783001,0)	--给NPC加免疫控制技能
									API_MonsterAddStatus(RealFastID,92001,0)	--给NPC加免疫控制技能
									API_CreateDieTriggerG(0,0,0,RealFastID,'BJNPCDie_DirTriggerGCallFunc')
									API_SetMonsterPKTeamID(RealFastID,KongZhiID)
									API_MonsterAddHP(RealFastID,-NeedCancelLife) --设置指挥官血量（减半）
									XiongDiHui_BJNPC_Table[111][i].FastID = RealFastID
									FenShenFastID = API_CreateMonsterEx(111,ZhiHuiGuan,LeftX,LeftY,4,0,-1,-1) --假的指挥官在左边
									if KongZhiID > 0 then
										if API_BrotherhoodGetName(KongZhiID) ~= nil then
											local KongZhiName = API_BrotherhoodGetName(KongZhiID)
											API_SetMonsterName(FenShenFastID,'['..KongZhiName..']占领',3)
										else
											if API_GetMonsterID(FenShenFastID) > 0 then API_SetMonsterName(FenShenFastID,'[无人占领]',3) end
										end
									else
										if API_GetMonsterID(FenShenFastID) > 0 then API_SetMonsterName(FenShenFastID,'[无人占领]',3) end
									end
									API_MonsterAddStatus(FenShenFastID,783001,0)	--给NPC加免疫控制技能
									API_MonsterAddStatus(FenShenFastID,92001,0)	--给NPC加免疫控制技能
									API_SetMonsterPKTeamID(FenShenFastID,KongZhiID)
									API_MonsterAddHP(FenShenFastID,-NeedCancelLife) --设置指挥官血量（减半）
									XiongDiHui_BJNPC_Table[111][i].FenShenFastID = FenShenFastID
								end
							end
						end
					end
				end
			end
		end
	end
	if Hour == TML_XiongDiHui_BJEndHour and Minute >= TML_XiongDiHui_BJEndMinute and Minute < 59 then
		if TML_BJXiongDiHui_End == 0 then
			API_SetAreaType(BoJueDTMapID,7,0)
			API_SetAreaType(BoJueDTMapID,8,0)
			API_SetAreaType(BoJueDTMapID,9,0)
			API_ActorCallBack(-1,0,-1,'XiongDiHui_BJSheZhiPKID')
			--删除可攻击NPC，创建正常NPC
			--光明遗迹
			if API_GetServerID() == 1 then
				if XiongDiHui_BJNPC_Table ~= nil then
					local ZhiHuiGuan = XiongDiHui_BJNPC_Table[111][1].NPCID1
					for i in XiongDiHui_BJNPC_Table[111] do
						local X = XiongDiHui_BJNPC_Table[111][i].X
						local Y = XiongDiHui_BJNPC_Table[111][i].Y
						local TML_XiongDiHui_ZhiHuiGuan = XiongDiHui_BJNPC_Table[111][i].FastID
						local Key = XiongDiHui_BJNPC_Table[111][i].Key
						local Key3 = XiongDiHui_BJNPC_Table[111][i].Key3
						local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
						local FenShenFastID = XiongDiHui_BJNPC_Table[111][i].FenShenFastID
						if KongZhiID > 0 then
							API_BrotherhoodAddScore(KongZhiID,100) --给占领指挥官的兄弟会加声望值
							local KongZhiTable = API_BrotherhoodGetAllActor(KongZhiID)
							if KongZhiTable ~= nil then
								for j,v in KongZhiTable do
									if API_BrotherhoodGetMaster(0,v) == 1 then
										local LaoDaName = API_BrotherhoodGetActorName(v)
										API_VarDataSetString_Ex_Sync(1,0,OwnerID,1,Key3,LaoDaName)
									end
								end
							end
						else
							API_VarDataSetString_Ex_Sync(1,0,OwnerID,1,Key3,0)
						end
						if TML_XiongDiHui_ZhiHuiGuan ~= nil and TML_XiongDiHui_ZhiHuiGuan ~= 0 then
							if API_GetMonsterID(TML_XiongDiHui_ZhiHuiGuan) > 0 then
								API_DestroyMonster(TML_XiongDiHui_ZhiHuiGuan)
							end
						end
						TML_XiongDiHui_ZhiHuiGuan = API_CreateMonsterEx(111,ZhiHuiGuan,X,Y,4,0,-1,1)
						if KongZhiID > 0 then
							if API_BrotherhoodGetName(KongZhiID) ~= nil then
								local KongZhiName = API_BrotherhoodGetName(KongZhiID)
								API_SetMonsterName(TML_XiongDiHui_ZhiHuiGuan,'['..KongZhiName..']占领',3)
							else
								if API_GetMonsterID(TML_XiongDiHui_ZhiHuiGuan) > 0 then API_SetMonsterName(TML_XiongDiHui_ZhiHuiGuan,'[无人占领]',3) end
							end
						else
							if API_GetMonsterID(TML_XiongDiHui_ZhiHuiGuan) > 0 then API_SetMonsterName(TML_XiongDiHui_ZhiHuiGuan,'[无人占领]',3) end
						end
						XiongDiHui_BJNPC_Table[111][i].FastID = TML_XiongDiHui_ZhiHuiGuan
						--判断分身是否存在，存在就干掉，然后将表里面分身的FASTID置为0
						if FenShenFastID ~= nil and FenShenFastID ~= 0 then
							if API_GetMonsterID(FenShenFastID) > 0 then
								API_DestroyMonster(FenShenFastID)
							end
						end
						XiongDiHui_BJNPC_Table[111][i].FenShenFastID = 0
					end
				end
			end
			TML_BJXiongDiHui_End = 1
		end
	end
end

function XiongDiHui_BJQingChuShuJu(ActorID)
	local XiongDiHuiID = API_GetBrotherhoodID(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local PuCongFastID = API_VarDataGetNumber(ActorID,1,11830)
	if PuCongFastID ~= 0 and PuCongFastID ~= nil then
		if API_GetMonsterID(PuCongFastID) > 0 then
			API_DestroyMonster(PuCongFastID)
		end
	end
	API_VarDataSetNumber(ActorID,1,11826,0)--清除玩家领取过BUFF
	API_VarDataSetNumber(ActorID,1,11830,0)--清除玩家领取过仆从
	if MapConfigID == BoJueMapID then
		if XiongDiHuiID <= 0 then
			API_ActorSetPKTeamID(ActorID,-1)
			if ep_PCfaID[ActorID] ~= nil then
				if ep_PCfaID[ActorID][1] ~= nil then
					local PCFastID1 = ep_PCfaID[ActorID][1]
					API_SetMonsterPKTeamID(PCFastID1,-1)
				end
				if ep_PCfaID[ActorID][2] ~= nil then
					local PCFastID2 = ep_PCfaID[ActorID][2]
					API_SetMonsterPKTeamID(PCFastID2,-1)
				end
			end
		else
			API_ActorSetPKTeamID(ActorID,XiongDiHuiID)
			if ep_PCfaID[ActorID] ~= nil then
				if ep_PCfaID[ActorID][1] ~= nil then
					local PCFastID1 = ep_PCfaID[ActorID][1]
					API_SetMonsterPKTeamID(PCFastID1,XiongDiHuiID)
				end
				if ep_PCfaID[ActorID][2] ~= nil then
					local PCFastID2 = ep_PCfaID[ActorID][2]
					API_SetMonsterPKTeamID(PCFastID2,XiongDiHuiID)
				end
			end
		end
	end
end

function XiongDiHui_BJSheZhiPKID(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if MapConfigID == BoJueMapID then
		API_ActorSetPKTeamID(ActorID,-1)
		if ep_PCfaID[ActorID] ~= nil then
			if ep_PCfaID[ActorID][1] ~= nil then
				local PCFastID1 = ep_PCfaID[ActorID][1]
				API_SetMonsterPKTeamID(PCFastID1,-1)
			end
			if ep_PCfaID[ActorID][2] ~= nil then
				local PCFastID2 = ep_PCfaID[ActorID][2]
				API_SetMonsterPKTeamID(PCFastID2,-1)
			end
		end
	end
end

function BJNPCDie_DirTriggerGCallFunc(Param_1,Param_2,CType,NPCFastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY)
	local MapConfigID = API_GetMapConfigID(MapID)
	local XiongDiHuiID = API_GetBrotherhoodID(KillerID)
	local XiongDiHuiName = ''
	if XiongDiHuiID > 0 then
		XiongDiHuiName = API_BrotherhoodGetName(XiongDiHuiID)
	end
	if MapConfigID == BoJueMapID then
		API_ActorBroadcastMsgEx(BoJueMapID,-1,0,17,'['..XiongDiHuiName..']兄弟会控制了指挥官，如能坚守到战争结束，将获得大量经验和金币')
		API_ActorBroadcastMsgEx(BoJueMapID,-1,0,1,'['..XiongDiHuiName..']兄弟会控制了指挥官，如能坚守到战争结束，将获得大量经验和金币')
		API_ActorBroadcastMsgEx(BoJueMapID,-1,0,7,'['..XiongDiHuiName..']兄弟会控制了指挥官，如能坚守到战争结束，将获得大量经验和金币')
	end
	if XiongDiHui_BJNPC_Table[MapConfigID] ~= nil then
		for i in XiongDiHui_BJNPC_Table[MapConfigID] do
			local Key = XiongDiHui_BJNPC_Table[MapConfigID][i].Key
			local FastID = XiongDiHui_BJNPC_Table[MapConfigID][i].FastID
			local FenShenFastID = XiongDiHui_BJNPC_Table[MapConfigID][i].FenShenFastID
			local X = XiongDiHui_BJNPC_Table[MapConfigID][i].X
			local Y = XiongDiHui_BJNPC_Table[MapConfigID][i].Y
			if FastID == NPCFastID then
				FastID2 = API_CreateMonsterEx(MapConfigID,MonsterID,X,Y,4,0,-1,-1)
				API_MonsterAddStatus(FastID2,783001,0)	--给NPC加免疫控制技能
				API_MonsterAddStatus(FastID2,92001,0)	--给NPC加免疫控制技能
				API_SetMonsterName(FastID2,'['..XiongDiHuiName..']占领',3)
				API_CreateDieTriggerG(0,0,0,FastID2,'BJNPCDie_DirTriggerGCallFunc')
				if XiongDiHuiID > 0 then
					API_SetMonsterPKTeamID(FastID2,XiongDiHuiID)
					API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,XiongDiHuiID)
				end
				XiongDiHui_BJNPC_Table[MapConfigID][i].FastID = FastID2
				if FenShenFastID ~= nil and FenShenFastID ~= 0 then --判断分身是否存在，存在就干掉，然后将表中的分身FASTID置为0
					if API_GetMonsterID(FenShenFastID) > 0 then
						API_DestroyMonster(FenShenFastID)
					end
				end
				XiongDiHui_BJNPC_Table[MapConfigID][i].FenShenFastID = 0
				break
			end
		end
	end
end

function BJXiongDiHui_OnLoginMap(ActorID)
	local ActorName = API_GetActorName(ActorID)
	local CampID = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local ActorX = API_GetActorPosX(ActorID)
	local ActorY = API_GetActorPosY(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local XiongDiHuiID = API_GetBrotherhoodID(ActorID)
	local PuCongFastID = API_VarDataGetNumber(ActorID,1,11830)
	local PuCongMonsterID = API_VarDataGetNumber(ActorID,1,11833)
	if PuCongMonsterID > 0 then
		local Life = API_VarDataGetNumber(ActorID,1,11832) --切换地图前仆从的血量
		PuCongFastID2 = API_CreateMonsterEx(MapID,PuCongMonsterID,ActorX,ActorY,4,0,CampID,-1)
		local MaxLife = API_MonsterGetPropNum(PuCongFastID2,2) --仆从的最大血量
		local CancelLife = MaxLife - Life --需要减掉的血量
		API_MonsterAddHP(PuCongFastID2,-CancelLife)
		API_SetMonsterName(PuCongFastID2,'['..ActorName..'] 的人马守护',1)	--设置仆从名字
		API_SetActorChief(PuCongFastID2,ActorID)	--设置仆从主人
		API_SetMonsterPrizeActor(PuCongFastID2,ActorID)	--设置仆从的获益玩家
		API_VarDataSetNumber(ActorID,1,11830,PuCongFastID2)
	end
	if MapConfigID == BoJueMapID then
		API_ActorAddMapPoint(ActorID,992173,MapConfigID,473,163,1,'兄弟会指挥官')
		API_ActorAddMapPoint(ActorID,992174,MapConfigID,345,387,1,'兄弟会指挥官')
		API_ActorAddMapPoint(ActorID,992175,MapConfigID,344,594,1,'兄弟会指挥官')
	end
	if Hour == TML_XiongDiHui_BJStartHour and (Minute >= TML_XiongDiHui_BJStartMinute and Minute <= TML_XiongDiHui_BJEndMinute) then
		if MapConfigID == BoJueMapID then
			if XiongDiHuiID > 0 then
				API_ActorSetPKTeamID(ActorID,XiongDiHuiID)
				if ep_PCfaID[ActorID] ~= nil then
					if ep_PCfaID[ActorID][1] ~= nil then
						local PCFastID1 = ep_PCfaID[ActorID][1]
						API_SetMonsterPKTeamID(PCFastID1,XiongDiHuiID)
					end
					if ep_PCfaID[ActorID][2] ~= nil then
						local PCFastID2 = ep_PCfaID[ActorID][2]
						API_SetMonsterPKTeamID(PCFastID2,XiongDiHuiID)
					end
				end
			else
				API_ActorSetPKTeamID(ActorID,-1)
				if ep_PCfaID[ActorID] ~= nil then
					if ep_PCfaID[ActorID][1] ~= nil then
						local PCFastID1 = ep_PCfaID[ActorID][1]
						API_SetMonsterPKTeamID(PCFastID1,-1)
					end
					if ep_PCfaID[ActorID][2] ~= nil then
						local PCFastID2 = ep_PCfaID[ActorID][2]
						API_SetMonsterPKTeamID(PCFastID2,-1)
					end
				end
			end
		end
	else
		if MapConfigID == BoJueMapID then
			API_ActorSetPKTeamID(ActorID,-1)
			if ep_PCfaID[ActorID] ~= nil then
				if ep_PCfaID[ActorID][1] ~= nil then
					local PCFastID1 = ep_PCfaID[ActorID][1]
					API_SetMonsterPKTeamID(PCFastID1,-1)
				end
				if ep_PCfaID[ActorID][2] ~= nil then
					local PCFastID2 = ep_PCfaID[ActorID][2]
					API_SetMonsterPKTeamID(PCFastID2,-1)
				end
			end
		end
	end
end

function BJXiongDiHui_OnLogoutMap(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local PuCongFastID = API_VarDataGetNumber(ActorID,1,11830)
	local PetID = API_VarDataGetNumber(ActorID,1,11833)
	if API_GetMonsterID(PuCongFastID) == PetID then
		local Life = API_MonsterGetPropNum(PuCongFastID,2)
		API_VarDataSetNumber(ActorID,1,11832,Life)
	else
		API_VarDataSetNumber(ActorID,1,11833,0) --切换地图前仆从不存在，将交互数据设置为0
	end
	if Hour == TML_XiongDiHui_BJStartHour and (Minute >= TML_XiongDiHui_BJStartMinute and Minute <= TML_XiongDiHui_BJEndMinute) then
		if MapConfigID == BoJueMapID then
			API_ActorSetPKTeamID(ActorID,0)
			if ep_PCfaID[ActorID] ~= nil then
				if ep_PCfaID[ActorID][1] ~= nil then
					local PCFastID1 = ep_PCfaID[ActorID][1]
					API_SetMonsterPKTeamID(PCFastID1,0)
				end
				if ep_PCfaID[ActorID][2] ~= nil then
					local PCFastID2 = ep_PCfaID[ActorID][2]
					API_SetMonsterPKTeamID(PCFastID2,0)
				end
			end
		end
	end
end

function BJXiongDiHui_OnLogin(ActorID)
	local ActorName = API_GetActorName(ActorID)
	local ActorX = API_GetActorPosX(ActorID)
	local ActorY = API_GetActorPosY(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local XiongDiHuiID = API_GetBrotherhoodID(ActorID)
	local nType = API_VarDataGetNumber(ActorID,0,18368)
	local CampID = API_GetActorCamp(ActorID)
	local PuCongFastID = API_VarDataGetNumber(ActorID,1,11830)
	local PuCongMonsterID = API_VarDataGetNumber(ActorID,1,11833)
	if nType == 2 then --切换场景服
		if PuCongMonsterID > 0 then --切换场景服之前存在仆从
			local Life = API_VarDataGetNumber(ActorID,1,11832) --切换场景服前仆从的血量
			PuCongFastID2 = API_CreateMonsterEx(MapID,PuCongMonsterID,ActorX,ActorY,4,0,CampID,-1)
			local MaxLife = API_MonsterGetPropNum(PuCongFastID2,2) --仆从的最大血量
			local CancelLife = MaxLife - Life --需要减掉的血量
			API_MonsterAddHP(PuCongFastID2,-CancelLife)
			API_SetMonsterName(PuCongFastID2,'['..ActorName..'] 的人马守护',1)	--设置仆从名字
			API_SetActorChief(PuCongFastID2,ActorID)	--设置仆从主人
			API_SetMonsterPrizeActor(PuCongFastID2,ActorID)	--设置仆从的获益玩家
			API_VarDataSetNumber(ActorID,1,11830,PuCongFastID2)
		end
	end
	if MapConfigID == BoJueMapID then
		API_ActorAddMapPoint(ActorID,992173,MapConfigID,473,163,1,'兄弟会指挥官')
		API_ActorAddMapPoint(ActorID,992174,MapConfigID,345,387,1,'兄弟会指挥官')
		API_ActorAddMapPoint(ActorID,992175,MapConfigID,344,594,1,'兄弟会指挥官')
	end
	if Hour == TML_XiongDiHui_BJStartHour and (Minute >= TML_XiongDiHui_BJStartMinute and Minute <= TML_XiongDiHui_BJEndMinute) then
		if MapConfigID == BoJueMapID then
			if XiongDiHuiID > 0 then
				API_ActorSetPKTeamID(ActorID,XiongDiHuiID)
				if ep_PCfaID[ActorID] ~= nil then
					if ep_PCfaID[ActorID][1] ~= nil then
						local PCFastID1 = ep_PCfaID[ActorID][1]
						API_SetMonsterPKTeamID(PCFastID1,XiongDiHuiID)
					end
					if ep_PCfaID[ActorID][2] ~= nil then
						local PCFastID2 = ep_PCfaID[ActorID][2]
						API_SetMonsterPKTeamID(PCFastID2,XiongDiHuiID)
					end
				end
			else
				API_ActorSetPKTeamID(ActorID,-1)
				if ep_PCfaID[ActorID] ~= nil then
					if ep_PCfaID[ActorID][1] ~= nil then
						local PCFastID1 = ep_PCfaID[ActorID][1]
						API_SetMonsterPKTeamID(PCFastID1,-1)
					end
					if ep_PCfaID[ActorID][2] ~= nil then
						local PCFastID2 = ep_PCfaID[ActorID][2]
						API_SetMonsterPKTeamID(PCFastID2,-1)
					end
				end
			end
		end
	else
		if MapConfigID == BoJueMapID then
			API_ActorSetPKTeamID(ActorID,-1)
			if ep_PCfaID[ActorID] ~= nil then
				if ep_PCfaID[ActorID][1] ~= nil then
					local PCFastID1 = ep_PCfaID[ActorID][1]
					API_SetMonsterPKTeamID(PCFastID1,-1)
				end
				if ep_PCfaID[ActorID][2] ~= nil then
					local PCFastID2 = ep_PCfaID[ActorID][2]
					API_SetMonsterPKTeamID(PCFastID2,-1)
				end
			end
		end
	end
end

function BJXiongDiHui_OnLogout(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nType = API_VarDataGetNumber(ActorID,0,18368)
	local PuCongFastID = API_VarDataGetNumber(ActorID,1,11830)
	local PetID = API_VarDataGetNumber(ActorID,1,11833)
	if Hour == TML_XiongDiHui_BJStartHour and (Minute >= TML_XiongDiHui_BJStartMinute and Minute <= TML_XiongDiHui_BJEndMinute) then
		if MapConfigID == BoJueMapID then
			API_ActorSetPKTeamID(ActorID,0)
			if ep_PCfaID[ActorID] ~= nil then
				if ep_PCfaID[ActorID][1] ~= nil then
					local PCFastID1 = ep_PCfaID[ActorID][1]
					API_SetMonsterPKTeamID(PCFastID1,0)
				end
				if ep_PCfaID[ActorID][2] ~= nil then
					local PCFastID2 = ep_PCfaID[ActorID][2]
					API_SetMonsterPKTeamID(PCFastID2,0)
				end
			end
		end
	end
	if nType == 3 then --小退
		if API_GetMonsterID(PuCongFastID) == PetID then
			API_DestroyMonster(PuCongFastID)
		end
		API_VarDataSetNumber(ActorID,1,11833,0)
	elseif nType == 2 then --切换场景服
		if API_GetMonsterID(PuCongFastID) == PetID then
			local Life = API_MonsterGetPropNum(PuCongFastID,2)
			API_VarDataSetNumber(ActorID,1,11832,Life)
		else
			API_VarDataSetNumber(ActorID,1,11833,0) --将存储MonsterID的交互数据置为0
		end
	end
end

--服务器开启时NPC争夺战触发器
if BJNPCBattle_CFQ_2 ~= nil then
	API_DestroyTriggerG(BJNPCBattle_CFQ_2)
end
BJNPCBattle_CFQ_2 = API_CreateTimerTriggerG(0,0,180,1,'BJNPCBattle_2_TimerTriggerGCallFunc')

--服务器开启时改指挥官名称后缀触发器
if API_GetServerID() == 1 then
	if BJNPCFixName_CFQ ~= nil then
		API_DestroyTriggerG(BJNPCFixName_CFQ)
	end
	BJNPCFixName_CFQ = API_CreateTimerTriggerG(0,0,180,1,'BJNPCFixName_TimerTriggerGCallFunc')
end

--服务器开启后判断在争夺时间外则改后缀
function BJNPCFixName_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour < TML_XiongDiHui_BJStartHour or (Hour == TML_XiongDiHui_BJStartHour and Minute > TML_XiongDiHui_BJEndMinute) or Hour > TML_XiongDiHui_BJStartHour then
		if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 1 then
			if API_GetServerID() == 1 then
				if XiongDiHui_BJNPC_Table ~= nil then
					for i in XiongDiHui_BJNPC_Table[111] do
						local TML_XiongDiHui_ZhiHuiGuan = XiongDiHui_BJNPC_Table[111][i].FastID
						local Key = XiongDiHui_BJNPC_Table[111][i].Key
						local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
						if KongZhiID > 0 then
							if API_BrotherhoodGetName(KongZhiID) ~= nil then
								local KongZhiName = API_BrotherhoodGetName(KongZhiID)
								API_SetMonsterName(TML_XiongDiHui_ZhiHuiGuan,'['..KongZhiName..']占领',3)
							else
								if API_GetMonsterID(TML_XiongDiHui_ZhiHuiGuan) > 0 then API_SetMonsterName(TML_XiongDiHui_ZhiHuiGuan,'[无人占领]',3) end
							end
						else
							if API_GetMonsterID(TML_XiongDiHui_ZhiHuiGuan) > 0 then API_SetMonsterName(TML_XiongDiHui_ZhiHuiGuan,'[无人占领]',3) end
						end
					end
				end
			end
		else
			if API_GetServerID() == 1 then
				if BJNPCFixName_CFQ ~= nil then
					API_DestroyTriggerG(BJNPCFixName_CFQ)
				end
				BJNPCFixName_CFQ = API_CreateTimerTriggerG(0,0,180,1,'BJNPCFixName_TimerTriggerGCallFunc')
			end
		end
	end
end

--服务器开启时判断当前时间是否在争夺时间内
function BJNPCBattle_2_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == TML_XiongDiHui_BJStartHour and Minute > TML_XiongDiHui_BJStartMinute and Minute < TML_XiongDiHui_BJEndMinute then
		if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 1 then
			TML_BJXiongDiHui_End = 0
			API_SetAreaType(BoJueDTMapID,7,1)
			API_SetAreaType(BoJueDTMapID,8,1)
			API_SetAreaType(BoJueDTMapID,9,1)
			API_ActorCallBack(-1,0,-1,'XiongDiHui_BJQingChuShuJu')
			--删除正常NPC，创建可攻击NPC并且创建死亡触发器
			if API_GetServerID() == 1 then
				if XiongDiHui_BJNPC_Table ~= nil then
					local ZhiHuiGuan = XiongDiHui_BJNPC_Table[111][1].NPCID2
					for i in XiongDiHui_BJNPC_Table[111] do
						local X = XiongDiHui_BJNPC_Table[111][i].X
						local Y = XiongDiHui_BJNPC_Table[111][i].Y
						local TML_XiongDiHui_ZhiHuiGuan = XiongDiHui_BJNPC_Table[111][i].FastID
						local Key = XiongDiHui_BJNPC_Table[111][i].Key
						local Key2 = XiongDiHui_BJNPC_Table[111][i].Key2
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,0)
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key2,0)
						if TML_XiongDiHui_ZhiHuiGuan ~= nil and TML_XiongDiHui_ZhiHuiGuan ~= 0 then
							if API_GetMonsterID(TML_XiongDiHui_ZhiHuiGuan) > 0 then
								API_DestroyMonster(TML_XiongDiHui_ZhiHuiGuan)
							end
						end
						TML_XiongDiHui_ZhiHuiGuan = API_CreateMonsterEx(111,ZhiHuiGuan,X,Y,4,0,-1,-1)
						if API_GetMonsterID(TML_XiongDiHui_ZhiHuiGuan) > 0 then API_SetMonsterName(TML_XiongDiHui_ZhiHuiGuan,'[无人占领]',3) end
						API_MonsterAddStatus(TML_XiongDiHui_ZhiHuiGuan,783001,0)	--给NPC加免疫控制技能
						API_MonsterAddStatus(TML_XiongDiHui_ZhiHuiGuan,92001,0)	--给NPC加免疫控制技能
						API_CreateDieTriggerG(0,0,0,TML_XiongDiHui_ZhiHuiGuan,'BJNPCDie_DirTriggerGCallFunc')
						API_SetMonsterPKTeamID(TML_XiongDiHui_ZhiHuiGuan,0)
						XiongDiHui_BJNPC_Table[111][i].FastID = TML_XiongDiHui_ZhiHuiGuan
					end
				end
			end
		else
			if API_GetServerID() == 1 then
				if BJNPCBattle_CFQ_2 ~= nil then
					API_DestroyTriggerG(BJNPCBattle_CFQ_2)
				end
				BJNPCBattle_CFQ_2 = API_CreateTimerTriggerG(0,0,180,1,'BJNPCBattle_2_TimerTriggerGCallFunc')
			end
		end
	end
end

--争夺时间外更新指挥官名称后缀触发器
if API_GetServerID() == 7 then
	if BJNPCUpDateName_CFQ ~= nil then
		API_DestroyTriggerG(BJNPCUpDateName_CFQ)
	end
	BJNPCUpDateName_CFQ = API_CreateTimerTriggerG(0,0,180,-1,'BJNPCUpDateName_TimerTriggerGCallFunc')
end

function BJNPCUpDateName_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour < TML_XiongDiHui_BJStartHour or (Hour == TML_XiongDiHui_BJStartHour and Minute > TML_XiongDiHui_BJEndMinute) or Hour > TML_XiongDiHui_BJStartHour then
		if XiongDiHui_BJNPC_Table ~= nil then
			for i in XiongDiHui_BJNPC_Table[111] do
				local FastID = XiongDiHui_BJNPC_Table[111][i].FastID
				local Key = XiongDiHui_BJNPC_Table[111][i].Key
				local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				if FastID > 0 then
					if KongZhiID > 0 then
						if API_BrotherhoodGetName(KongZhiID) ~= nil then
							local KongZhiName = API_BrotherhoodGetName(KongZhiID)
							API_SetMonsterName(FastID,'['..KongZhiName..']占领',3)
						else
							if API_GetMonsterID(FastID) > 0 then API_SetMonsterName(FastID,'[无人占领]',3) end
						end
					else
						if API_GetMonsterID(FastID) > 0 then API_SetMonsterName(FastID,'[无人占领]',3) end
					end
				end
			end
		end
	end
end

--优化：争夺战期间判断指挥官存在与否，不存在就创建指挥官，并且创建死亡触发器
if API_GetServerID() == 1 then
	if BJNPCBuCunZai_CFQ ~= nil then
		API_DestroyTriggerG(BJNPCBuCunZai_CFQ)
	end
	BJNPCBuCunZai_CFQ = API_CreateTimerTriggerG(0,0,60,-1,'BJNPCBuCunZai_TimerTriggerGCallFunc')
end

function BJNPCBuCunZai_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == TML_XiongDiHui_BJStartHour and (Minute > TML_XiongDiHui_BJStartMinute and Minute < TML_XiongDiHui_BJEndMinute) then
		if XiongDiHui_BJNPC_Table ~= nil then
			local ZhiHuiGuan = XiongDiHui_BJNPC_Table[111][1].NPCID2
			for i in XiongDiHui_BJNPC_Table[111] do
				local X = XiongDiHui_BJNPC_Table[111][i].X
				local Y = XiongDiHui_BJNPC_Table[111][i].Y
				local Key = XiongDiHui_BJNPC_Table[111][i].Key
				local TML_XiongDiHui_ZhiHuiGuan = XiongDiHui_BJNPC_Table[111][i].FastID
				local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				local FenShenFastID = XiongDiHui_BJNPC_Table[111][i].FenShenFastID
				if TML_XiongDiHui_ZhiHuiGuan ~= nil and TML_XiongDiHui_ZhiHuiGuan ~= 0 then
					if API_GetMonsterID(TML_XiongDiHui_ZhiHuiGuan) <= 0 then
						TML_XiongDiHui_ZhiHuiGuan = API_CreateMonsterEx(111,ZhiHuiGuan,X,Y,4,0,-1,-1)
						API_MonsterAddStatus(TML_XiongDiHui_ZhiHuiGuan,783001,0)	--给NPC加免疫控制技能
						API_MonsterAddStatus(TML_XiongDiHui_ZhiHuiGuan,92001,0)		--给NPC加免疫控制技能
						if KongZhiID > 0 then
							API_SetMonsterPKTeamID(TML_XiongDiHui_ZhiHuiGuan,KongZhiID)
							if API_BrotherhoodGetName(KongZhiID) ~= nil then
								local KongZhiName = API_BrotherhoodGetName(KongZhiID)
								API_SetMonsterName(TML_XiongDiHui_ZhiHuiGuan,'['..KongZhiName..']占领',3)
							else
								if API_GetMonsterID(TML_XiongDiHui_ZhiHuiGuan) > 0 then API_SetMonsterName(TML_XiongDiHui_ZhiHuiGuan,'[无人占领]',3) end
							end
						else
							API_SetMonsterPKTeamID(TML_XiongDiHui_ZhiHuiGuan,0)
							if API_GetMonsterID(TML_XiongDiHui_ZhiHuiGuan) > 0 then API_SetMonsterName(TML_XiongDiHui_ZhiHuiGuan,'[无人占领]',3) end
						end
						API_CreateDieTriggerG(0,0,0,TML_XiongDiHui_ZhiHuiGuan,'BJNPCDie_DirTriggerGCallFunc')
						XiongDiHui_BJNPC_Table[111][i].FastID = TML_XiongDiHui_ZhiHuiGuan
						--判断分身是否存在，存在就干掉
						if FenShenFastID ~= nil and FenShenFastID ~= 0 then
							if API_GetMonsterID(FenShenFastID) > 0 then
								API_DestroyMonster(FenShenFastID)
							end
						end
						XiongDiHui_BJNPC_Table[111][i].FenShenFastID = 0
					end
				end
			end
		end
	end
end
