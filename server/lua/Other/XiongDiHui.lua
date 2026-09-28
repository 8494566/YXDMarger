----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\XiongDiHui.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	谭明礼
--日  期:	2008-5-26
--版  本:	1.0
--描  述:	兄弟会系统
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：谭明礼
--日期：2009-5-26
--功能：创建
---------------------------------------------------------------------
--交互数据：
--11817 存储兄弟会成员领取BUFF的时间
--11818 存储兄弟会成员领取兄弟会BUFF效果情况(0--5)
--11819 存储争夺指挥官成功后给成员发送经验的时间
--11820 存储争夺指挥官成功后给成员发送经验的时间
--11821 存储争夺指挥官成功后给成员发送经验的时间
--11822 存储争夺指挥官成功后给成员发送经验的时间
--11823 存储争夺指挥官成功后给成员发送经验的时间
--11824 存储争夺指挥官成功后给成员发送经验的时间

local OwnerID = -4004 --全局交互数据
if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 0 then
	API_VarDataLoad_Ex(1,0,OwnerID)
end
TML_XDHGLYID = 12188 --兄弟会管理员的MonsterID
TML_XDH_JieBaiZiJin = 2000 --结拜资金
TML_XDH_XiongDiHuiGLF = 500000 --兄弟会管理费
TML_XDH_BUFFNum = 5 --可领取BUFF增益效果次数
local LBMapID = 98	--联邦地图ID
local DGMapID = 99	--帝国地图ID
local YueMuMapID = 101 --月幕草场地图ID
local LBDTMapID = API_GetRightMapID(LBMapID)
local DGDTMapID = API_GetRightMapID(DGMapID)
local YueMuDTMapID = API_GetRightMapID(YueMuMapID)
local BoJueMapID = 111 --伯爵争夺地图ID
local BoJueDTMapID = API_GetRightMapID(BoJueMapID)

--开启服务器时设置争夺区域为安全区域
API_SetAreaType(LBDTMapID,1,0)
API_SetAreaType(LBDTMapID,2,0)
API_SetAreaType(LBDTMapID,3,0)
API_SetAreaType(DGDTMapID,1,0)
API_SetAreaType(DGDTMapID,2,0)
API_SetAreaType(DGDTMapID,3,0)

--NPC争夺战时间
TML_XiongDiHui_ReadyHour = 20
TML_XiongDiHui_ReadyMinute = 30
TML_XiongDiHui_StartHour = 21
TML_XiongDiHui_StartMinute = 0
TML_XiongDiHui_EndHour = 21
TML_XiongDiHui_EndMinute = 30

--指挥官争夺战标记
TML_XiongDiHui_End = 0

--佣兵团时间（瑞宇）
ZYZZ_quanjubianliang_battletime1 = 13
ZYZZ_quanjubianliang_battletime2 = 19 

--争夺NPC成功后发送经验表
XiongDiHui_SendEXPTable = {
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
--兄弟会升级表
JieBai_UPLevelTable = {
	[1] = {NextJieBaiLV=2,HaoGanDu=500,JieBaiNum=5,RenShuMax=8,AddShengWang=400,JinBiNum=5000},
	[2] = {NextJieBaiLV=3,HaoGanDu=1000,JieBaiNum=8,RenShuMax=10,AddShengWang=1000,JinBiNum=10000},
}
--兄弟会BUFF增益表
XiongDiHui_BUFFXiaoGuo_Table = {
	{BUFFID=763001,BUFFName='兄弟会意志',MaxNum=5,BUFFXiaoGuo='各类型攻击力增加25点，持续时间：1小时'},
	{BUFFID=763002,BUFFName='兄弟会意志',MaxNum=5,BUFFXiaoGuo='各类型防御力增加20点，持续时间：1小时'},
	{BUFFID=763003,BUFFName='兄弟会意志',MaxNum=5,BUFFXiaoGuo='移动速度增加5%，持续时间：1小时'},
	{BUFFID=763004,BUFFName='兄弟会意志',MaxNum=5,BUFFXiaoGuo='暴击抵抗增加10%，持续时间：1小时'},
	{BUFFID=763005,BUFFName='兄弟会意志',MaxNum=5,BUFFXiaoGuo='各类型攻击暴击增加100点，持续时间：1小时'},
	{BUFFID=763006,BUFFName='兄弟会意志',MaxNum=5,BUFFXiaoGuo='反击机率增加10%，持续时间：1小时'},
}

--Key:存储控制NPC的兄弟会ID；Key2:存储兄弟会领取管理费情况；Key3:存储控制NPC的兄弟会老大名字
if XiongDiHui_NPC_Table == nil then
	XiongDiHui_NPC_Table = {
		[98] = {
				{NPCID1=12175,NPCID2=12177,X=221,Y=454,FastID=0,Key=1,PKID=-1,Key2=21,Key3=41},	--联邦(NPC1为不可攻击，NPC2为可攻击)
				{NPCID1=12175,NPCID2=12177,X=449,Y=278,FastID=0,Key=2,PKID=-1,Key2=22,Key3=42},
				{NPCID1=12175,NPCID2=12177,X=353,Y=507,FastID=0,Key=3,PKID=-1,Key2=23,Key3=43},	--换位置（353，507），游戏世界坐标（205，147）
		},
		[99] = {
				{NPCID1=12174,NPCID2=12176,X=220,Y=387,FastID=0,Key=11,PKID=-1,Key2=31,Key3=51},	--帝国(NPC1为不可攻击，NPC2为可攻击)
				{NPCID1=12174,NPCID2=12176,X=543,Y=330,FastID=0,Key=12,PKID=-1,Key2=32,Key3=52},	--换位置（543，330），游戏世界坐标（212，331）
				{NPCID1=12174,NPCID2=12176,X=387,Y=544,FastID=0,Key=13,PKID=-1,Key2=33,Key3=53},
		},
	}
end

--创建兄弟会管理员NPC
if API_GetServerID() == 1 then
	if TML_XDH_LBXDHGLY ~= nil then
		if API_GetMonsterID(TML_XDH_LBXDHGLY) > 0 then
			API_DestroyMonster(TML_XDH_LBXDHGLY)
		end
	end
	TML_XDH_LBXDHGLY = API_CreateMonsterEx(41,TML_XDHGLYID,59,66,5,0,-1,1)
	if TML_XDH_DGXDHGLY ~= nil then
		if API_GetMonsterID(TML_XDH_DGXDHGLY) > 0 then
			API_DestroyMonster(TML_XDH_DGXDHGLY)
		end
	end
	TML_XDH_DGXDHGLY = API_CreateMonsterEx(21,TML_XDHGLYID,60,71,5,0,-1,1)
end

--创建争夺NPC(正常NPC)
--娜纱湿地（联邦）
if API_GetServerID() == 1 then
	if XiongDiHui_NPC_Table ~= nil then
		local LBSW = XiongDiHui_NPC_Table[98][1].NPCID1
		for i in XiongDiHui_NPC_Table[98] do
			local X = XiongDiHui_NPC_Table[98][i].X
			local Y = XiongDiHui_NPC_Table[98][i].Y
			local TML_XiongDiHui_LBSW = XiongDiHui_NPC_Table[98][i].FastID
			if TML_XiongDiHui_LBSW ~= nil and TML_XiongDiHui_LBSW ~= 0 then
				if API_GetMonsterID(TML_XiongDiHui_LBSW) > 0 then
					API_DestroyMonster(TML_XiongDiHui_LBSW)
				end
			end
			TML_XiongDiHui_LBSW = API_CreateMonsterEx(98,LBSW,X,Y,4,0,-1,1)
			XiongDiHui_NPC_Table[98][i].FastID = TML_XiongDiHui_LBSW
		end
	end
end
--落日农庄（帝国）
if API_GetServerID() == 1 then
	if XiongDiHui_NPC_Table ~= nil then
		local DGSW = XiongDiHui_NPC_Table[99][1].NPCID1
		for i in XiongDiHui_NPC_Table[99] do
			local X = XiongDiHui_NPC_Table[99][i].X
			local Y = XiongDiHui_NPC_Table[99][i].Y
			local TML_XiongDiHui_DGSW = XiongDiHui_NPC_Table[99][i].FastID
			if TML_XiongDiHui_DGSW ~= nil and TML_XiongDiHui_DGSW ~= 0 then
				if API_GetMonsterID(TML_XiongDiHui_DGSW) > 0 then
					API_DestroyMonster(TML_XiongDiHui_DGSW)
				end
			end
			TML_XiongDiHui_DGSW = API_CreateMonsterEx(99,DGSW,X,Y,4,0,-1,1)
			XiongDiHui_NPC_Table[99][i].FastID = TML_XiongDiHui_DGSW
		end
	end
end

function UpdateActorBHStatus(ActorID,XiongDiHuiID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == TML_XiongDiHui_StartHour and (Minute >= TML_XiongDiHui_StartMinute and Minute <= TML_XiongDiHui_EndMinute) then
		if MapConfigID == LBMapID or MapConfigID == DGMapID or MapConfigID == BoJueMapID then
			if XiongDiHuiID == 0 then  --退出兄弟会
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
				API_ActorSetPKTeamID(ActorID,XiongDiHuiID) --加入兄弟会
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
	if XiongDiHuiID == 0 then
		if PuCongFastID ~= 0 and PuCongFastID ~= nil then
			if API_GetMonsterID(PuCongFastID) > 0 then
				API_DestroyMonster(PuCongFastID)
			end
		end
	end
end

function CanActorAddBrotherHood(ActorID1,ActorID2,Relation)
	local XiongDiHuiID1 = API_GetBrotherhoodID(ActorID1)
	local XiongDiHuiID2 = API_GetBrotherhoodID(ActorID2)
	local ActorLV1 = API_GetActorExpLevel(ActorID1)
	local ActorLV2 = API_GetActorExpLevel(ActorID2)
	local CanAddNum = API_BrotherhoodGetCurrNum(XiongDiHuiID2)
	local Camp1 = API_GetActorCamp(ActorID1)
	local Camp2 = API_GetActorCamp(ActorID2)
	if Relation == 0 then
		if XiongDiHuiID1 == 0 then
			if ActorLV1 >= 16 then
				if CanAddNum > 0 then
					if Camp1 == Camp2 then
						API_ActorSendMsg(ActorID1,3,'加入兄弟会后，当前人物会显示兄弟会称号，如果要显示其他称号请打开称号面板重新设置')
						return 1
					else
						API_ActorSendMsg(ActorID1,3,'您申请加入的兄弟会和您不是同一阵营')
						return 0
					end
				else
					API_ActorSendMsg(ActorID1,3,'您申请加入的兄弟会人数已满')
					return 0
				end
			else
				API_ActorSendMsg(ActorID1,3,'您的等级不够16级，需要等级达到16级以上才能加入兄弟会')
				return 0
			end
		else
			API_ActorSendMsg(ActorID1,3,'您已经加入了兄弟会，不能再申请加入兄弟会')
			return 0
		end
	elseif Relation == 1 then
		if XiongDiHuiID1 == 0 then
			if ActorLV1 >= 16 then
				if CanAddNum > 0 then
					if Camp1 == Camp2 then
						API_ActorSendMsg(ActorID1,3,'加入兄弟会后，当前人物会显示兄弟会称号，如果要显示其他称号请打开称号面板重新设置')
						return 1
					else
						API_ActorSendMsg(ActorID2,3,'您邀请的玩家和您不是同一阵营')
						return 0
					end
				else
					API_ActorSendMsg(ActorID2,3,'您的兄弟会人数已满，不能再添加新成员')
					return 0
				end
			else
				API_ActorSendMsg(ActorID2,3,'您邀请的玩家'..API_GetActorName(ActorID1)..'等级不够16级')
				return 0
			end
		else
			API_ActorSendMsg(ActorID2,3,'玩家'..API_GetActorName(ActorID1)..'已经加入了兄弟会')
			return 0
		end
	end
end

function JieBai_Title(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local XuanZe2 = API_RequestGetString(2)
	local XiongDiHuiID = API_GetBrotherhoodID(ActorID)
	local XiongDiHuiLV = API_BrotherhoodGetLevel(XiongDiHuiID)
	local TeamID = API_GetTeamID(ActorID)
	local TeamNum = 0
	local TeamLeaderID = 0
	local JBNum = 0	
	if TeamID > 0 then
		TeamNum = API_GetTeamSize(TeamID)
		TeamLeaderID = API_GetTeamLeader(TeamID)
		if API_ActorIsOnline(TeamLeaderID) then
			JBNum = API_ActorGetPropNum(TeamLeaderID,156)--获取队长身上金币数量
		end
	end
	local CampID = API_GetActorCamp(ActorID)
	if XuanZe == 0 then
		if XiongDiHuiID > 0 then
			API_ResponseWrite('<br><a href="JieBai_Title?1=1">结拜并创建兄弟会</a>')
			API_ResponseWrite('<text>           </text>')
			API_ResponseWrite('<a href="JieBai_Title?1=5">查询兄弟会成员好感度平均值</a><br><br>')
			API_ResponseWrite('<a href="JieBai_Title?1=6">升级兄弟会</a>')
			API_ResponseWrite('<text>                 </text>')
			API_ResponseWrite('<a href="JieBai_Title?1=10">查询兄弟会声望值</a><br><br>')
			API_ResponseWrite('<a href="JieBai_Title?1=8">关于兄弟会</a>')
			API_ResponseWrite('<text>                 </text>')
			API_ResponseWrite('<a href="JieBai_Title?1=9">关于兄弟会争夺指挥官</a><br>')
			API_ResponseWrite('<br><br><a>离开</a>')
		else
			API_ResponseWrite('<br><a href="JieBai_Title?1=1">结拜并创建兄弟会</a><br><br>')
			API_ResponseWrite('<a href="JieBai_Title?1=8">关于兄弟会</a><br>')
			API_ResponseWrite('<br><br><a>离开</a>')
		end
	elseif XuanZe == 1 then
		if XiongDiHuiID > 0 then
			API_ResponseWrite('<br><text>你已经加入了兄弟会，不能再次结拜创建兄弟会。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
		if TeamID > 0 then
			if ActorID ~= TeamLeaderID then
				API_ResponseWrite('<br><text>你不是队长，只有队长才能完成结拜并创建兄弟会。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
		else
			API_ResponseWrite('<br><text>你还没有组队，需要组队后才能结拜。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
		for i = 1,TeamNum do
			local TeamPlayID = API_GetTeamMem(TeamID,i)
			if not API_ActorIsOnline(TeamPlayID) then
				API_ResponseWrite('<br><text>队伍中有队员不在线或者不在本地图内，无法完成结拜。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(TeamLeaderID)
				return
			end
		end
		for i = 1,TeamNum do
			local TeamPlayID = API_GetTeamMem(TeamID,i)
			local TeamPlayXDHID = API_GetBrotherhoodID(TeamPlayID)
			local TeamPlayLV = API_GetActorExpLevel(TeamPlayID)
			local TeamPlayMapID = API_GetActorMapID(TeamPlayID)
			if TeamPlayXDHID > 0 then
				API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'已经加入了兄弟会。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(TeamLeaderID)
				return
			end
			if TeamPlayLV < 16 then
				API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'等级不够，请确认队伍中所有队员等级在16级以上。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(TeamLeaderID)
				return
			end
			if CampID == 1 then	--联邦
				if TeamPlayMapID ~= 41 then
					API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'不在本地图内，请确认队伍中所有队员都在本地图内才能完成结拜。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(TeamLeaderID)
					return
				end
			elseif CampID == 0 then	--帝国
				if TeamPlayMapID ~= 21 then
					API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'不在本地图内，请确认队伍中所有队员都在本地图内才能完成结拜。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(TeamLeaderID)
					return
				end
			end
		end
		API_ResponseWrite('<br><text>你们要结拜并创建兄弟会吗？结拜创建兄弟会需要消耗队长身上'..TML_XDH_JieBaiZiJin..'金币。</text><br>')
		API_ResponseWrite('<br><a href="JieBai_Title?1=2">结拜并创建兄弟会</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(TeamLeaderID)
	elseif XuanZe == 2 then
		if XiongDiHuiID > 0 then
			API_ResponseWrite('<br><text>你已经加入了兄弟会，不能再次结拜创建兄弟会。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
		if TeamID > 0 then
			if ActorID ~= TeamLeaderID then
				API_ResponseWrite('<br><text>你不是队长，只有队长才能完成结拜并创建兄弟会。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
		else
			API_ResponseWrite('<br><text>你还没有组队，需要组队后才能结拜。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
		if JBNum < TML_XDH_JieBaiZiJin then
			API_ResponseWrite('<br><text>你身上金币数量不够，需要'..TML_XDH_JieBaiZiJin..'金币才能结拜创建兄弟会。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
		for i = 1,TeamNum do
			local TeamPlayID = API_GetTeamMem(TeamID,i)
			if not API_ActorIsOnline(TeamPlayID) then
				API_ResponseWrite('<br><text>队伍中有队员不在线或者不在本地图内，无法完成结拜。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(TeamLeaderID)
				return
			end
		end
		for i = 1,TeamNum do
			local TeamPlayID = API_GetTeamMem(TeamID,i)
			local TeamPlayXDHID = API_GetBrotherhoodID(TeamPlayID)
			local TeamPlayLV = API_GetActorExpLevel(TeamPlayID)
			local TeamPlayMapID = API_GetActorMapID(TeamPlayID)
			if TeamPlayXDHID > 0 then
				API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'已经加入了兄弟会。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(TeamLeaderID)
				return
			end
			if TeamPlayLV < 16 then
				API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'等级不够，请确认队伍中所有队员等级在16级以上。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(TeamLeaderID)
				return
			end
			if CampID == 1 then	--联邦
				if TeamPlayMapID ~= 41 then
					API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'不在本地图内，请确认队伍中所有队员都在本地图内才能完成结拜。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(TeamLeaderID)
					return
				end
			elseif CampID == 0 then	--帝国
				if TeamPlayMapID ~= 21 then
					API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'不在本地图内，请确认队伍中所有队员都在本地图内才能完成结拜。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(TeamLeaderID)
					return
				end
			end
		end
		API_ResponseWrite('<text>请输入兄弟会名称：（最多可以输入4个字）</text><br>')
		API_ResponseWrite('<input type="string" name="3" size="8" width="80"><br>')
		API_ResponseWrite('<br><a href="JieBai_Title?1=3">输入完成</a><br>')
	elseif XuanZe == 3 then
		if XiongDiHuiID > 0 then
			API_ResponseWrite('<br><text>你已经加入了兄弟会，不能再次结拜创建兄弟会。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
		if TeamID > 0 then
			if ActorID ~= TeamLeaderID then
				API_ResponseWrite('<br><text>你不是队长，只有队长才能完成结拜并创建兄弟会。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
		else
			API_ResponseWrite('<br><text>你还没有组队，需要组队后才能结拜。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
		for i = 1,TeamNum do
			local TeamPlayID = API_GetTeamMem(TeamID,i)
			if not API_ActorIsOnline(TeamPlayID) then
				API_ResponseWrite('<br><text>队伍中有队员不在线或者不在本地图内，无法完成结拜。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(TeamLeaderID)
				return
			end
		end
		for i = 1,TeamNum do
			local TeamPlayID = API_GetTeamMem(TeamID,i)
			local TeamPlayXDHID = API_GetBrotherhoodID(TeamPlayID)
			local TeamPlayLV = API_GetActorExpLevel(TeamPlayID)
			local TeamPlayMapID = API_GetActorMapID(TeamPlayID)
			if TeamPlayXDHID > 0 then
				API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'已经加入了兄弟会。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(TeamLeaderID)
				return
			end
			if TeamPlayLV < 16 then
				API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'等级不够，请确认队伍中所有队员等级在16级以上。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(TeamLeaderID)
				return
			end
			if CampID == 1 then	--联邦
				if TeamPlayMapID ~= 41 then
					API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'不在本地图内，请确认队伍中所有队员都在本地图内才能完成结拜。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(TeamLeaderID)
					return
				end
			elseif CampID == 0 then	--帝国
				if TeamPlayMapID ~= 21 then
					API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'不在本地图内，请确认队伍中所有队员都在本地图内才能完成结拜。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(TeamLeaderID)
					return
				end
			end
		end
		local ShuRuXDHName = API_RequestGetString(3)
		local ZiFuLength = string.len(ShuRuXDHName)
		if ZiFuLength == 0 then
			API_ResponseWrite('<text>你没有输入兄弟会名称，请在之前的窗口中输入兄弟会名称</text><br><br>')
			API_ResponseWrite('<a href="JieBai_Title?1=2">返回</a>')
		elseif ZiFuLength > 0 and ZiFuLength <= 8 then
			API_ResponseWrite('<text>你输入的兄弟会名称是：</text><text color="255,0,0">'..ShuRuXDHName..'</text><text>，确定使用该名称吗？</text><br>')
			API_ResponseWrite('<br><a href="JieBai_Title?1=4&2='..ShuRuXDHName..'">确定</a><br>')
			API_ResponseWrite('<br><a href="JieBai_Title?1=2">重新输入</a><br>')
		elseif ZiFuLength > 8 then
			API_ResponseWrite('<text>你输入的兄弟会名称过长，请重新输入</text><br><br>')
			API_ResponseWrite('<a href="JieBai_Title?1=2">返回</a>')
		end
	elseif XuanZe == 4 then
		if XiongDiHuiID > 0 then
			API_ResponseWrite('<br><text>你已经加入了兄弟会，不能再次结拜创建兄弟会。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
		if TeamID > 0 then
			if ActorID ~= TeamLeaderID then
				API_ResponseWrite('<br><text>你不是队长，只有队长才能完成结拜并创建兄弟会。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
		else
			API_ResponseWrite('<br><text>你还没有组队，需要组队后才能结拜。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
		for i = 1,TeamNum do
			local TeamPlayID = API_GetTeamMem(TeamID,i)
			if not API_ActorIsOnline(TeamPlayID) then
				API_ResponseWrite('<br><text>队伍中有队员不在线或者不在本地图内，无法完成结拜。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(TeamLeaderID)
				return
			end
		end
		for i = 1,TeamNum do
			local TeamPlayID = API_GetTeamMem(TeamID,i)
			local TeamPlayXDHID = API_GetBrotherhoodID(TeamPlayID)
			local TeamPlayLV = API_GetActorExpLevel(TeamPlayID)
			local TeamPlayMapID = API_GetActorMapID(TeamPlayID)
			if TeamPlayXDHID > 0 then
				API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'已经加入了兄弟会。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(TeamLeaderID)
				return
			end
			if TeamPlayLV < 16 then
				API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'等级不够，请确认队伍中所有队员等级在16级以上。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(TeamLeaderID)
				return
			end
			if CampID == 1 then	--联邦
				if TeamPlayMapID ~= 41 then
					API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'不在本地图内，请确认队伍中所有队员都在本地图内才能完成结拜。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(TeamLeaderID)
					return
				end
			elseif CampID == 0 then	--帝国
				if TeamPlayMapID ~= 21 then
					API_ResponseWrite('<br><text>队员'..API_GetActorName(TeamPlayID)..'不在本地图内，请确认队伍中所有队员都在本地图内才能完成结拜。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(TeamLeaderID)
					return
				end
			end
		end
		if JBNum >= TML_XDH_JieBaiZiJin then
			local KouQianNum = 0 - TML_XDH_JieBaiZiJin
			local ShenYuZhiJin = API_ActorAddMoney(TeamLeaderID,KouQianNum,0,'创建兄弟会删除队长金币')
			if JBNum - TML_XDH_JieBaiZiJin == ShenYuZhiJin then
				local TeamID = API_GetTeamID(TeamLeaderID)
				local TeamNum = API_GetTeamSize(TeamID)
				local TeamTable = {}
				for i = 1,TeamNum do
					local DuiYuanID = API_GetTeamMem(TeamID,i)
					TeamTable[i] = DuiYuanID
				end
				API_CreateBrotherhood(XuanZe2,TeamLeaderID,TeamTable,TeamNum)
			end
		else
			API_ResponseWrite('<br><text>你身上金币数量不够，需要'..TML_XDH_JieBaiZiJin..'金币才能结拜创建兄弟会。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	elseif XuanZe == 5 then
		if XiongDiHuiID > 0 then
			API_ResponseWrite('<br><text>你的兄弟会成员好感度平均值是：</text><text color="255,0,255">'..API_BrotherhoodGetFriendValue(XiongDiHuiID)..'</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		else
			API_ResponseWrite('<br><text>你没有加入兄弟会，不能查询。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	elseif XuanZe == 6 then
		if API_BrotherhoodGetMaster(0,ActorID) == 1 then
			if XiongDiHuiLV <= 2 then
				for i = 1,table.getn(JieBai_UPLevelTable) do
					local NextJieBaiLV = JieBai_UPLevelTable[i].NextJieBaiLV
					local HaoGanDu = JieBai_UPLevelTable[i].HaoGanDu
					local JieBaiNum = JieBai_UPLevelTable[i].JieBaiNum
					local RenShuMax = JieBai_UPLevelTable[i].RenShuMax
					local AddShengWang = JieBai_UPLevelTable[i].AddShengWang
					local JinBiNum = JieBai_UPLevelTable[i].JinBiNum
					if XiongDiHuiLV == i then
						API_ResponseWrite('<text>你的兄弟会等级为</text><text color="255,0,255">'..XiongDiHuiLV..'级</text><text>，升级到下一级需要兄弟会中所有成员好感度平均值达到</text><text color="255,0,255">'..HaoGanDu..'</text><text>，兄弟会人数达到</text><text color="255,0,255">'..JieBaiNum..'人（包括会长）</text><text>,并且需要缴纳</text><text color="255,0,255">'..JinBiNum..'金币</text><text>升级费用</text><br>')
						API_ResponseWrite('<br><text>升级后兄弟会人数上限能达到</text><text color="255,0,255">'..RenShuMax..'人</text><text>，兄弟会声望增加</text><text color="255,0,255">'..AddShengWang..'点</text><br><br>')
						API_ResponseWrite('<br><a href="JieBai_Title?1=7">确定升级</a><br>')
						API_ResponseWrite('<br><a>取消</a><br>')
					end
				end
			else
				API_ResponseWrite('<br><text>你的兄弟会已经是最高等级，不能再升级了。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		else
			API_ResponseWrite('<br><text>你不是兄弟会会长，只有兄弟会会长才能升级兄弟会。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	elseif XuanZe == 7 then
		if API_BrotherhoodGetMaster(0,ActorID) ~= 1 then
			API_ResponseWrite('<br><text>你不是兄弟会会长，只有兄弟会会长才能升级兄弟会。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			return
		end
		if XiongDiHuiLV <= 2 then
			if API_BrotherhoodGetNum(XiongDiHuiID) ~= API_BrotherhoodGetMaxNum(XiongDiHuiID) then
				API_ResponseWrite('<br><text>你的兄弟会人数不够，需要达到</text><text color="255,0,255">'..API_BrotherhoodGetMaxNum(XiongDiHuiID)..'人</text><text>才能升级兄弟会。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			for i = 1,table.getn(JieBai_UPLevelTable) do
				local NextJieBaiLV = JieBai_UPLevelTable[i].NextJieBaiLV
				local HaoGanDu = JieBai_UPLevelTable[i].HaoGanDu
				local JieBaiNum = JieBai_UPLevelTable[i].JieBaiNum
				local RenShuMax = JieBai_UPLevelTable[i].RenShuMax
				local AddShengWang = JieBai_UPLevelTable[i].AddShengWang
				local JinBiNum = JieBai_UPLevelTable[i].JinBiNum
				if API_BrotherhoodGetNum(XiongDiHuiID) == JieBaiNum then
					if API_BrotherhoodGetFriendValue(XiongDiHuiID) >= HaoGanDu then
						if API_ActorGetPropNum(ActorID,156) >= JinBiNum then --获取会长身上的金币数量
							if API_ActorAddMoney(ActorID,-JinBiNum,0,'升级兄弟会扣除会长身上金币') then
								API_BrotherhoodLevelUp(XiongDiHuiID) --兄弟会升级
								API_BrotherhoodAddScore(XiongDiHuiID,AddShengWang)
								API_ActorSendMsg(ActorID,3,'升级兄弟会扣除'..JinBiNum..'金币')
								API_ResponseWrite('<text>您的兄弟会升级成功，当前等级为</text><text color="255,0,255">'..NextJieBaiLV..'级</text><br>')
								API_ResponseWrite('<br><text>目前兄弟会人数上限为</text><text color="255,0,255">'..RenShuMax..'人</text><text>，兄弟会声望增加</text><text color="255,0,255">'..AddShengWang..'点</text><br>')
								API_ResponseWrite('<br><a>确定</a><br>')
							end
						else
							API_ResponseWrite('<br><text>你身上的金币数量不够，需要'..JinBiNum..'金币才能完成升级。</text><br>')
							API_ResponseWrite('<br><a>确定</a><br>')
						end
					else
						API_ResponseWrite('<br><text>你的兄弟会成员好感度平均值不够，需要达到</text><text color="255,0,255">'..HaoGanDu..'点</text><text>才能升级。</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
					end
				end
			end
		else
			API_ResponseWrite('<br><text>你的兄弟会已经是最高等级，不能再升级了。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	elseif XuanZe == 8 then
		API_ResponseWrite('<text>几个志同道合的玩家可以通过结拜创立自己的小团体，这个小团体就是兄弟会，加入兄弟会后你将体会到：“你不是一个人在战斗”！</text><br>')
		API_ResponseWrite('<br><text>兄弟会的优势：</text><br>')
		API_ResponseWrite('<br><text>①一个人的力量是薄弱的，团体的力量能解决某些难题。如：消灭恶鬼任务。</text><br>')
		API_ResponseWrite('<br><text>②经常和兄弟会成员在一起，组成固定的团队可以增加您的成长速度和提高游戏体验。</text><br>')
		API_ResponseWrite('<br><text>③结拜成立了兄弟会后，兄弟会所有成员可以参加指挥官争夺战。成功争夺指挥官后可以获得大量的奖励，详情请前往可争夺的指挥官处查询。</text><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	elseif XuanZe == 9 then
		API_ResponseWrite('<text>可争夺的指挥官名称是：</text><text color="255,0,255">兄弟会指挥官</text><br><br>')
		API_ResponseWrite('<text>指挥官所在位置：</text><br>')
		API_ResponseWrite('<text>                ①娜纱湿地（113，107）</text>')
		API_ResponseWrite('<text>      ⑦光明遗迹（93，379）</text><br>')
		API_ResponseWrite('<text>                ②娜纱湿地（139，309）</text>')
		API_ResponseWrite('<text>      ⑧光明遗迹（141，203）</text><br>')
		API_ResponseWrite('<text>                ③娜纱湿地（205，147）</text>')
		API_ResponseWrite('<text>      ⑨光明遗迹（244，99）</text><br>')
		API_ResponseWrite('<text>                ④落日农庄（79，140）</text><br>')
		API_ResponseWrite('<text>                ⑤落日农庄（212，331）</text><br>')
		API_ResponseWrite('<text>                ⑥落日农庄（240，145）</text><br><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	elseif XuanZe == 10 then
		if XiongDiHuiID > 0 then
			API_ResponseWrite('<br><text>你的兄弟会声望值是：</text><text color="255,0,255">'..API_BrotherhoodGetScore(XiongDiHuiID)..'</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		else
			API_ResponseWrite('<br><text>你没有加入兄弟会，不能查询。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	end
end

function BrotherHoodCreateResult(TeamLeaderID,ChengGong,XiongDiHuiID,SBResult)
	if not API_ActorIsOnline(TeamLeaderID) then
		return
	end
	if ChengGong == 1 then
		API_ActorSendMsg(TeamLeaderID,3,'成功创建兄弟会扣除'..TML_XDH_JieBaiZiJin..'金币')
		local TeamID = API_GetTeamID(TeamLeaderID)
		local TeamNum = API_GetTeamSize(TeamID)
		local XDHName = API_BrotherhoodGetName(XiongDiHuiID)
		for i = 1,TeamNum do
			local TeamPlayID = API_GetTeamMem(TeamID,i)
			API_ResponseWrite('<name>兄弟会管理员</name>')
			API_ResponseWrite('<br><text>恭喜你们，结拜成功并创建了</text><text color="255,0,255">'..XDHName..'兄弟会</text><text>！会长是</text><text color="255,0,255">'..API_GetActorName(TeamLeaderID)..'</text><br><br>')
			API_ResponseWrite('<text color="255,0,0">兄弟会中所有成员最好都互相加好友，兄弟会升级时需要兄弟会成员之间好感度平均值达到一定数值才能升级。</text><br><br>')
			API_ResponseWrite('<text color="255,0,0">成功创建兄弟会后，当前人物会显示兄弟会称号，如果要显示其他称号请打开称号面板重新设置。</text><br><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(TeamPlayID)
		end
	elseif ChengGong == 0 then
		if SBResult == -1 or SBResult == -9 then
			API_ResponseWrite('<br><text>创建兄弟会失败，请稍候再试。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(TeamLeaderID)
		elseif SBResult == -2 then
			API_ResponseWrite('<br><text>创建兄弟会失败，名称存在被屏蔽字符，请重试。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(TeamLeaderID)
		elseif SBResult == -3 then
			API_ResponseWrite('<br><text>创建兄弟会失败，名称已被其它玩家注册，请重试。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(TeamLeaderID)
		elseif SBResult == -4 then
			API_ResponseWrite('<br><text>创建兄弟会失败，您已经创建了兄弟会或者已经加入了兄弟会。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(TeamLeaderID)
		elseif SBResult == -5 then
			API_ResponseWrite('<br><text>获取兄弟会ID失败，请稍候再试。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(TeamLeaderID)
		end
		API_ActorAddMoney(TeamLeaderID,TML_XDH_JieBaiZiJin,0,'创建兄弟会失败返还队长金币')
	end
end

function XiongDiHui_NPC_title(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local ActorMoney = API_ActorGetPropNum(ActorID,156)
	local ActorLV = API_GetActorExpLevel(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local XiongDiHuiID = API_GetBrotherhoodID(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMDH = Year * 1000000 + Month * 10000 + Day * 100 + Hour
	local PlayLQYMDH = API_VarDataGetNumber(ActorID,1,11817)
	local PlayLQYear = math.floor(PlayLQYMDH/1000000)
	local PlayLQMonthDayHour = math.mod(PlayLQYMDH,1000000)
	local PlayLQMonth = math.floor(PlayLQMonthDayHour/10000)
	local PlayLQDayHour = math.mod(PlayLQMonthDayHour,10000)
	local PlayLQDay = math.floor(PlayLQDayHour/100)
	local PlayLQHour = math.mod(PlayLQDayHour,100)
	if (Day > PlayLQDay and Hour >= TML_XiongDiHui_EndHour) or Day > PlayLQDay + 1 then
		API_VarDataSetNumber(ActorID,1,11818,0)
	end
	if Day == PlayLQDay and Hour >= TML_XiongDiHui_EndHour and PlayLQHour < TML_XiongDiHui_StartHour then
		API_VarDataSetNumber(ActorID,1,11818,0)
	end
	local XiongDiHuiName = 0
	if XiongDiHuiID > 0 then
		XiongDiHuiName = API_BrotherhoodGetName(XiongDiHuiID)
	end
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712) --玩家点击的NPCFastID
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 0 then
		for i in XiongDiHui_NPC_Table[MapConfigID] do
			local FastID = XiongDiHui_NPC_Table[MapConfigID][i].FastID
			local Key = XiongDiHui_NPC_Table[MapConfigID][i].Key
			if FastID == NPCFastID then
				local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				if XiongDiHuiID > 0 then
					if KongZhiID > 0 then
						if KongZhiID == XiongDiHuiID then
							API_ResponseWrite('<br><a href="XiongDiHui_NPC_title?1=1">占领指挥官兄弟会查询</a>')
							API_ResponseWrite('<text>                   </text>')
							API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=2">查询占领指挥官可获得的经验值</a><br><br>')
							API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=3">指挥官争夺战开始时间查询</a>')
							API_ResponseWrite('<text>               </text>')
							API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=4">领取管理费</a><br><br>')
							API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=6">领取兄弟会增益效果</a>')
							API_ResponseWrite('<text>                     </text>')
							API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=8">关于兄弟会争夺指挥官的说明</a><br><br>')
							API_ResponseWrite('<br><br><a>离开</a>')
						else
							API_ResponseWrite('<br><a href="XiongDiHui_NPC_title?1=1">占领指挥官兄弟会查询</a>')
							API_ResponseWrite('<text>                   </text>')
							API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=2">查询占领指挥官可获得的经验值</a><br><br>')
							API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=3">指挥官争夺战开始时间查询</a>')
							API_ResponseWrite('<text>               </text>')
							API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=8">关于兄弟会争夺指挥官的说明</a><br><br>')
							API_ResponseWrite('<br><br><a>离开</a>')
						end
					else
						API_ResponseWrite('<br><a href="XiongDiHui_NPC_title?1=1">占领指挥官兄弟会查询</a>')
						API_ResponseWrite('<text>                   </text>')
						API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=2">查询占领指挥官可获得的经验值</a><br><br>')
						API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=3">指挥官争夺战开始时间查询</a>')
						API_ResponseWrite('<text>               </text>')
						API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=8">关于兄弟会争夺指挥官的说明</a><br><br>')
						API_ResponseWrite('<br><br><a>离开</a>')
					end
				else
					API_ResponseWrite('<br><a href="XiongDiHui_NPC_title?1=1">占领指挥官兄弟会查询</a>')
					API_ResponseWrite('<text>                   </text>')
					API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=2">查询占领指挥官可获得的经验值</a><br><br>')
					API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=3">指挥官争夺战开始时间查询</a>')
					API_ResponseWrite('<text>               </text>')
					API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=8">关于兄弟会争夺指挥官的说明</a><br><br>')
					API_ResponseWrite('<br><br><a>离开</a>')
				end
				break
			end
		end
	elseif SelectItem == 1 then
		local KongZhiID = 0
		local LaoDaName = ''
		for i in XiongDiHui_NPC_Table[MapConfigID] do
			local FastID = XiongDiHui_NPC_Table[MapConfigID][i].FastID
			local Key = XiongDiHui_NPC_Table[MapConfigID][i].Key
			local Key3 = XiongDiHui_NPC_Table[MapConfigID][i].Key3
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
				API_ResponseWrite('<br><br><a href="XiongDiHui_NPC_title?1=0">返回</a>')
			else
				API_ResponseWrite('<text>当前没有兄弟会控制我。</text><br><br>')
				API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=0">返回</a>')
			end
		else
			API_ResponseWrite('<text>当前没有兄弟会控制我。</text><br><br>')
			API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=0">返回</a>')
		end
	elseif SelectItem == 2 then
		if XiongDiHui_SendEXPTable ~= nil then
			local AllEXP = XiongDiHui_SendEXPTable[ActorLV].AllEXP
			local EXP = XiongDiHui_SendEXPTable[ActorLV].EXP
			API_ResponseWrite('<text>您的等级为</text><text color="255,0,255">'..ActorLV..'级</text><text>，成功占领我后在线24小时能获得</text><text color="255,0,255">'..AllEXP..'点经验值</text><text>。每15分钟发送一次经验，每次能获得</text><text color="255,0,255">'..EXP..'点经验值</text>')
			API_ResponseWrite('<br><br><a href="XiongDiHui_NPC_title?1=0">返回</a>')
		end
	elseif SelectItem == 3 then
		API_ResponseWrite('<text>指挥官争夺战将会在每天的</text><text color="255,0,255">'..TML_XiongDiHui_StartHour..':00开始</text><br><br>')
		API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=0">返回</a>')
	elseif SelectItem == 4 then
		API_ResponseWrite('<text>成功占领我的兄弟会会长可以领取</text><text color="255,0,255">'..TML_XDH_XiongDiHuiGLF..'金币</text><text>的兄弟会管理费，每成功占领一次可以领取一次管理费。</text><br><br>')
		API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=5">领取管理费</a><br><br>')
		API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=0">返回</a>')
	elseif SelectItem == 5 then
		local KongZhiID = 0
		local ShiFouGetGold = 0
		local Key2 = 0
		for i in XiongDiHui_NPC_Table[MapConfigID] do
			local FastID = XiongDiHui_NPC_Table[MapConfigID][i].FastID
			local Key = XiongDiHui_NPC_Table[MapConfigID][i].Key
			Key2 = XiongDiHui_NPC_Table[MapConfigID][i].Key2
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
						if (ActorMoney + TML_XDH_XiongDiHuiGLF) <= 50000000 then
							API_ActorAddMoney(ActorID,TML_XDH_XiongDiHuiGLF,0,'领取管理费')
							API_ActorSendMsg(ActorID,3,'成功领取'..TML_XDH_XiongDiHuiGLF..'金币管理费')
							API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  × '..TML_XDH_XiongDiHuiGLF..'</text><br>')
							API_ResponseWrite('<br><text>恭喜您成功领取了</text><text color="255,0,255">'..TML_XDH_XiongDiHuiGLF..'金币</text><text>的兄弟会管理费。</text><br><br><br>')
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
		API_ResponseWrite('<text>成功争夺我的兄弟会成员可以在我这里领取</text><text color="255,0,255">'..TML_XDH_BUFFNum..'次</text><text>增益效果。每领取一次都能随机得到一种增益效果，持续1小时，再次领取会覆盖前面的增益效果</text><br><br>')
		API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=7">领取增益效果</a><br><br>')
		API_ResponseWrite('<a href="XiongDiHui_NPC_title?1=0">返回</a>')
	elseif SelectItem == 7 then
		local KongZhiID = 0
		for i in XiongDiHui_NPC_Table[MapConfigID] do
			local FastID = XiongDiHui_NPC_Table[MapConfigID][i].FastID
			local Key = XiongDiHui_NPC_Table[MapConfigID][i].Key
			if FastID == NPCFastID then
				KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				break
			end
		end
		if XiongDiHuiID > 0 then
			if XiongDiHuiID == KongZhiID then
				local SuiJiHang = XiongDiHui_BUFFXiaoGuo_Table[math.random(table.getn(XiongDiHui_BUFFXiaoGuo_Table))]
				local BUFFID = SuiJiHang.BUFFID
				local MaxNum = SuiJiHang.MaxNum
				local BUFFName = SuiJiHang.BUFFName
				local BUFFXiaoGuo = SuiJiHang.BUFFXiaoGuo
				local LQNumNow = API_VarDataGetNumber(ActorID,1,11818)
				if LQNumNow < MaxNum then
					API_ActorAddStatus(ActorID,BUFFID,0)
					LQNumNow = LQNumNow + 1
					API_VarDataSetNumber(ActorID,1,11818,LQNumNow)
					API_VarDataSetNumber(ActorID,1,11817,YMDH)
					local HaiYouCishu = MaxNum - LQNumNow
					API_ResponseWrite('<text>恭喜你成功领取了一次增益效果，增益效果为</text><text color="255,0,255">'..BUFFXiaoGuo..'</text><br><br>')
					API_ResponseWrite('<text>下一次争夺战开始前你还可以随机领取</text><text color="255,0,255">'..HaiYouCishu..'次</text><text>增益效果。</text><br><br><br>')
					API_ResponseWrite('<a>确定</a>')
				else
					API_ResponseWrite('<text>你已经领取过</text><text color="255,0,255">'..TML_XDH_BUFFNum..'次</text><text>增益效果，不能再领取了。</text><br><br>')
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
		API_ResponseWrite('<text>每天的</text><text color="255,0,255">'..TML_XiongDiHui_StartHour..':00</text><text>兄弟会成员可以在我这里进行争夺战</text><br><br>')
		API_ResponseWrite('<text color="255,0,255">指挥官争夺战玩法：</text><br>')
		API_ResponseWrite('<text color="0,255,255">1、开战时间到时，除了己方兄弟会成员，其他兄弟会成员的血条变为可攻击的红色；</text><br>')
		API_ResponseWrite('<text color="0,255,255">2、所有兄弟会的成员都可以攻击指挥官，指挥官死亡时判断由哪个兄弟会的成员杀死，然后指挥官临时归为由哪个兄弟会占领；</text><br>')
		API_ResponseWrite('<text color="0,255,255">3、这时，在原地立刻会出现一个新的满血的指挥官，临时占领指挥官的兄弟会成为防守方，不能攻击该指挥官，可以使用回复技能为指挥官加血，并且需要阻止其他兄弟会成员攻击指挥官；</text><br>')
		API_ResponseWrite('<text color="0,255,255">4、其他兄弟会成员则能继续攻击该指挥官，指挥官死亡后，又临时归为成功击杀的兄弟会占领；</text><br>')
		API_ResponseWrite('<text color="0,255,255">5、30分钟时间到时，最后占领该指挥官的兄弟会争夺成功，拥有其控制权。</text>')
		API_ResponseWrite('<br><br><a href="XiongDiHui_NPC_title?1=0">返回</a>')
	end
end

--NPC争夺战广播提示触发器
if API_GetServerID() == 1 then
	if NPCBattle_GuangBo_CFQ ~= nil then
		API_DestroyTriggerG(NPCBattle_GuangBo_CFQ)
	end
	NPCBattle_GuangBo_CFQ = API_CreateTimerTriggerG(0,0,60,-1,'NPCGuangBo_TimerTriggerGCallFunc')
end
--NPC争夺战触发器
if NPCBattle_CFQ ~= nil then
	API_DestroyTriggerG(NPCBattle_CFQ)
end
NPCBattle_CFQ = API_CreateTimerTriggerG(0,0,60,-1,'NPCBattle_TimerTriggerGCallFunc')

--NPC争夺成功奖励触发器
if NPCBattle_SendEXP_CFQ ~= nil then
	API_DestroyTriggerG(NPCBattle_SendEXP_CFQ)
end
NPCBattle_SendEXP_CFQ = API_CreateTimerTriggerG(0,0,60,-1,'NPCSendEXP_TimerTriggerGCallFunc')

function NPCSendEXP_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == TML_XiongDiHui_StartHour and Minute >= TML_XiongDiHui_StartMinute and Minute <= TML_XiongDiHui_EndMinute then
		return
	end
	XiongDiHui_NPC_JiaoHuDate = {}
	XiongDiHui_NPC2_JiaoHuDate = {}
	XiongDiHui_NPC_JiaoHuDate[98] = {[1] = 11819,[2] = 11820,[3] = 11821,}
	XiongDiHui_NPC2_JiaoHuDate[99] = {[1] = 11822,[2] = 11823,[3] = 11824,}
	if math.mod(Minute,15) == 0 then
		local Time = Day * 10000 + Hour * 100 + Minute
		for i in XiongDiHui_NPC_Table[98] do
			local Key = XiongDiHui_NPC_Table[98][i].Key
			local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
			local JiaoHuDate = XiongDiHui_NPC_JiaoHuDate[98][i]
			if KongZhiID ~= 0 then
				local XiongDiHuiTable = API_BrotherhoodGetAllActor(KongZhiID)
				if XiongDiHuiTable ~= nil then
					for j,v in XiongDiHuiTable do
						if API_GetActorServerID(v) == API_GetServerID() then
							local LV = API_GetActorExpLevel(v)
							if XiongDiHui_SendEXPTable ~= nil then
								if LV > 0 then
									local EXP = XiongDiHui_SendEXPTable[LV].EXP
									if API_GetActorServerID(v) ~= -1 then
										if API_VarDataGetNumber(v,1,JiaoHuDate) ~= Time then
											API_ActorAddExp(v,EXP,0,'争夺指挥官成功加经验值')
											API_ActorSendMsg(v,3,'占领娜纱湿地指挥官获得'..EXP..'点经验值')
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
		for i in XiongDiHui_NPC_Table[99] do
			local Key = XiongDiHui_NPC_Table[99][i].Key
			local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
			local JiaoHuDate = XiongDiHui_NPC2_JiaoHuDate[99][i]
			if KongZhiID ~= 0 then
				local XiongDiHuiTable = API_BrotherhoodGetAllActor(KongZhiID)
				if XiongDiHuiTable ~= nil then
					for j,v in XiongDiHuiTable do
						if API_GetActorServerID(v) == API_GetServerID() then
							local LV = API_GetActorExpLevel(v)
							if XiongDiHui_SendEXPTable ~= nil then
								if LV > 0 then
									local EXP = XiongDiHui_SendEXPTable[LV].EXP
									if API_GetActorServerID(v) ~= -1 then
										if API_VarDataGetNumber(v,1,JiaoHuDate) ~= Time then
											API_ActorAddExp(v,EXP,0,'争夺指挥官成功加经验值')
											API_ActorSendMsg(v,3,'占领落日农庄指挥官获得'..EXP..'点经验值')
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

function NPCGuangBo_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == TML_XiongDiHui_ReadyHour and Minute >= TML_XiongDiHui_ReadyMinute and Minute <= 59 then
		if math.mod(Minute,10) == 0 then
			if API_GetServerID() == 1 then
				if not API_IsBattleGameServer() then
					API_ActorBDCMsg(-1,0,0,16,85,0,17,''..TML_XiongDiHui_StartHour..':00在落日农庄和光明遗迹将开始指挥官争夺战，请兄弟会成员做好准备')
					API_ActorBDCMsg(-1,0,0,16,85,0,1,''..TML_XiongDiHui_StartHour..':00在落日农庄和光明遗迹将开始指挥官争夺战，请兄弟会成员做好准备')
					API_ActorBDCMsg(-1,0,0,16,85,0,7,''..TML_XiongDiHui_StartHour..':00在落日农庄和光明遗迹将开始指挥官争夺战，请兄弟会成员做好准备')
					API_ActorBDCMsg(-1,0,1,16,85,0,17,''..TML_XiongDiHui_StartHour..':00在娜纱湿地和光明遗迹将开始指挥官争夺战，请兄弟会成员做好准备')
					API_ActorBDCMsg(-1,0,1,16,85,0,1,''..TML_XiongDiHui_StartHour..':00在娜纱湿地和光明遗迹将开始指挥官争夺战，请兄弟会成员做好准备')
					API_ActorBDCMsg(-1,0,1,16,85,0,7,''..TML_XiongDiHui_StartHour..':00在娜纱湿地和光明遗迹将开始指挥官争夺战，请兄弟会成员做好准备')
				end
			end
		end
	end
	if Hour == TML_XiongDiHui_StartHour and Minute == TML_XiongDiHui_StartMinute then
		if API_GetServerID() == 1 then
			if not API_IsBattleGameServer() then
				API_ActorBDCMsg(-1,0,0,16,85,0,17,'指挥官争夺战已经在落日农庄和光明遗迹打响了，请兄弟会成员前往争夺')
				API_ActorBDCMsg(-1,0,0,16,85,0,1,'指挥官争夺战已经在落日农庄和光明遗迹打响了，请兄弟会成员前往争夺')
				API_ActorBDCMsg(-1,0,0,16,85,0,7,'指挥官争夺战已经在落日农庄和光明遗迹打响了，请兄弟会成员前往争夺')
				API_ActorBDCMsg(-1,0,1,16,85,0,17,'指挥官争夺战已经在娜纱湿地和光明遗迹打响了，请兄弟会成员前往争夺')
				API_ActorBDCMsg(-1,0,1,16,85,0,1,'指挥官争夺战已经在娜纱湿地和光明遗迹打响了，请兄弟会成员前往争夺')
				API_ActorBDCMsg(-1,0,1,16,85,0,7,'指挥官争夺战已经在娜纱湿地和光明遗迹打响了，请兄弟会成员前往争夺')
			end
		end
	end
	if Hour == TML_XiongDiHui_EndHour and Minute == TML_XiongDiHui_EndMinute - 10 then
		if API_GetServerID() == 1 then
			if not API_IsBattleGameServer() then
				--娜纱湿地
				API_ActorBDCMsg(848,1,-1,16,85,0,17,'请注意，兄弟会指挥官争夺战将在10分钟后结束')
				API_ActorBDCMsg(848,1,-1,16,85,0,1,'请注意，兄弟会指挥官争夺战将在10分钟后结束')
				API_ActorBDCMsg(848,1,-1,16,85,0,7,'请注意，兄弟会指挥官争夺战将在10分钟后结束')
				--落日农庄
				API_ActorBDCMsg(999,1,-1,16,85,0,17,'请注意，兄弟会指挥官争夺战将在10分钟后结束')
				API_ActorBDCMsg(999,1,-1,16,85,0,1,'请注意，兄弟会指挥官争夺战将在10分钟后结束')
				API_ActorBDCMsg(999,1,-1,16,85,0,7,'请注意，兄弟会指挥官争夺战将在10分钟后结束')
				--光明遗迹
				API_ActorBDCMsg(1011,1,-1,16,85,0,17,'请注意，兄弟会指挥官争夺战将在10分钟后结束')
				API_ActorBDCMsg(1011,1,-1,16,85,0,1,'请注意，兄弟会指挥官争夺战将在10分钟后结束')
				API_ActorBDCMsg(1011,1,-1,16,85,0,7,'请注意，兄弟会指挥官争夺战将在10分钟后结束')
			end
		end
	end
	if Hour == TML_XiongDiHui_EndHour and Minute == TML_XiongDiHui_EndMinute then
		if API_GetServerID() == 1 then
			if not API_IsBattleGameServer() then
				--娜纱湿地
				API_ActorBDCMsg(848,1,-1,16,85,0,17,'指挥官争夺战已结束,请兄弟会密切关注下次争夺时间')
				API_ActorBDCMsg(848,1,-1,16,85,0,1,'指挥官争夺战已结束,请兄弟会密切关注下次争夺时间')
				API_ActorBDCMsg(848,1,-1,16,85,0,7,'指挥官争夺战已结束,请兄弟会密切关注下次争夺时间')
				--落日农庄
				API_ActorBDCMsg(999,1,-1,16,85,0,17,'指挥官争夺战已结束,请兄弟会密切关注下次争夺时间')
				API_ActorBDCMsg(999,1,-1,16,85,0,1,'指挥官争夺战已结束,请兄弟会密切关注下次争夺时间')
				API_ActorBDCMsg(999,1,-1,16,85,0,7,'指挥官争夺战已结束,请兄弟会密切关注下次争夺时间')
				--光明遗迹
				API_ActorBDCMsg(1011,1,-1,16,85,0,17,'指挥官争夺战已结束,请兄弟会密切关注下次争夺时间')
				API_ActorBDCMsg(1011,1,-1,16,85,0,1,'指挥官争夺战已结束,请兄弟会密切关注下次争夺时间')
				API_ActorBDCMsg(1011,1,-1,16,85,0,7,'指挥官争夺战已结束,请兄弟会密切关注下次争夺时间')
			end
		end
	end
end

function NPCBattle_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Week == 1 or Week == 2 or Week == 3 or Week == 4 or Week == 5 then
		if (Hour >= ZYZZ_quanjubianliang_battletime1 and Hour < (ZYZZ_quanjubianliang_battletime1 + 1)) or (Hour >= ZYZZ_quanjubianliang_battletime2 and Hour < (ZYZZ_quanjubianliang_battletime2 + 1)) then
			API_SetAreaType(YueMuDTMapID,0,1)
		elseif Hour == (ZYZZ_quanjubianliang_battletime1 + 1) or Hour == (ZYZZ_quanjubianliang_battletime2 + 1) then
			API_SetAreaType(YueMuDTMapID,0,3)
		end
	elseif Week == 6 or Week == 7 then
		if (Hour >= ZYZZ_quanjubianliang_battletime1 and Hour < (ZYZZ_quanjubianliang_battletime1 + 1)) then
			API_SetAreaType(YueMuDTMapID,0,1)
		elseif Hour == ZYZZ_quanjubianliang_battletime1 + 1 then
			API_SetAreaType(YueMuDTMapID,0,3)
		end
	end
	if Hour == TML_XiongDiHui_StartHour and Minute == TML_XiongDiHui_StartMinute then
		TML_XiongDiHui_End = 0 --争夺战开始置结束标志为0
		API_SetAreaType(LBDTMapID,1,1)
		API_SetAreaType(LBDTMapID,2,1)
		API_SetAreaType(LBDTMapID,3,1)
		API_SetAreaType(DGDTMapID,1,1)
		API_SetAreaType(DGDTMapID,2,1)
		API_SetAreaType(DGDTMapID,3,1)
		API_ActorCallBack(-1,0,-1,'XiongDiHui_QingChuShuJu')
		--删除正常NPC，创建可攻击NPC并且创建死亡触发器
		if API_GetServerID() == 1 then
			if XiongDiHui_NPC_Table ~= nil then
				local LBSW = XiongDiHui_NPC_Table[98][1].NPCID2
				for i in XiongDiHui_NPC_Table[98] do
					local X = XiongDiHui_NPC_Table[98][i].X
					local Y = XiongDiHui_NPC_Table[98][i].Y
					local TML_XiongDiHui_LBSW = XiongDiHui_NPC_Table[98][i].FastID
					local Key = XiongDiHui_NPC_Table[98][i].Key
					local Key2 = XiongDiHui_NPC_Table[98][i].Key2
					API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,0)
					API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key2,0)
					if TML_XiongDiHui_LBSW ~= nil and TML_XiongDiHui_LBSW ~= 0 then
						if API_GetMonsterID(TML_XiongDiHui_LBSW) > 0 then
							API_DestroyMonster(TML_XiongDiHui_LBSW)
						end
					end
					TML_XiongDiHui_LBSW = API_CreateMonsterEx(98,LBSW,X,Y,4,0,-1,-1)
					if API_GetMonsterID(TML_XiongDiHui_LBSW) > 0 then API_SetMonsterName(TML_XiongDiHui_LBSW,'[无人占领]',3) end
					API_MonsterAddStatus(TML_XiongDiHui_LBSW,783001,0)	--给NPC加免疫控制技能
					API_MonsterAddStatus(TML_XiongDiHui_LBSW,92001,0)	--给NPC加免疫控制技能
					API_CreateDieTriggerG(0,0,0,TML_XiongDiHui_LBSW,'NPCDie_DirTriggerGCallFunc')
					API_SetMonsterPKTeamID(TML_XiongDiHui_LBSW,0)
					XiongDiHui_NPC_Table[98][i].FastID = TML_XiongDiHui_LBSW
				end
			end
		end
		if API_GetServerID() == 1 then
			if XiongDiHui_NPC_Table ~= nil then
				local DGSW = XiongDiHui_NPC_Table[99][1].NPCID2
				for i in XiongDiHui_NPC_Table[99] do
					local X = XiongDiHui_NPC_Table[99][i].X
					local Y = XiongDiHui_NPC_Table[99][i].Y
					local TML_XiongDiHui_DGSW = XiongDiHui_NPC_Table[99][i].FastID
					local Key = XiongDiHui_NPC_Table[99][i].Key
					local Key2 = XiongDiHui_NPC_Table[99][i].Key2
					API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,0)
					API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key2,0)
					if TML_XiongDiHui_DGSW ~= nil and TML_XiongDiHui_DGSW ~= 0 then
						if API_GetMonsterID(TML_XiongDiHui_DGSW) > 0 then
							API_DestroyMonster(TML_XiongDiHui_DGSW)
						end
					end
					TML_XiongDiHui_DGSW = API_CreateMonsterEx(99,DGSW,X,Y,4,0,-1,-1)
					if API_GetMonsterID(TML_XiongDiHui_DGSW) > 0 then API_SetMonsterName(TML_XiongDiHui_DGSW,'[无人占领]',3) end
					API_MonsterAddStatus(TML_XiongDiHui_DGSW,783001,0)	--给NPC加免疫控制技能
					API_MonsterAddStatus(TML_XiongDiHui_DGSW,92001,0)	--给NPC加免疫控制技能
					API_CreateDieTriggerG(0,0,0,TML_XiongDiHui_DGSW,'NPCDie_DirTriggerGCallFunc')
					API_SetMonsterPKTeamID(TML_XiongDiHui_DGSW,0)
					XiongDiHui_NPC_Table[99][i].FastID = TML_XiongDiHui_DGSW
				end
			end
		end
	end
	if Hour == TML_XiongDiHui_EndHour and Minute >= TML_XiongDiHui_EndMinute and Minute < 59 then
		if TML_XiongDiHui_End == 0 then
			API_SetAreaType(LBDTMapID,1,0)
			API_SetAreaType(LBDTMapID,2,0)
			API_SetAreaType(LBDTMapID,3,0)
			API_SetAreaType(DGDTMapID,1,0)
			API_SetAreaType(DGDTMapID,2,0)
			API_SetAreaType(DGDTMapID,3,0)
			API_ActorCallBack(-1,0,-1,'XiongDiHui_SheZhiPKID')
			--删除可攻击NPC，创建正常NPC
			--娜纱湿地（联邦）
			if API_GetServerID() == 1 then
				if XiongDiHui_NPC_Table ~= nil then
					local LBSW = XiongDiHui_NPC_Table[98][1].NPCID1
					for i in XiongDiHui_NPC_Table[98] do
						local X = XiongDiHui_NPC_Table[98][i].X
						local Y = XiongDiHui_NPC_Table[98][i].Y
						local TML_XiongDiHui_LBSW = XiongDiHui_NPC_Table[98][i].FastID
						local Key = XiongDiHui_NPC_Table[98][i].Key
						local Key3 = XiongDiHui_NPC_Table[98][i].Key3
						local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
						if KongZhiID > 0 then
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
						if TML_XiongDiHui_LBSW ~= nil and TML_XiongDiHui_LBSW ~= 0 then
							if API_GetMonsterID(TML_XiongDiHui_LBSW) > 0 then
								API_DestroyMonster(TML_XiongDiHui_LBSW)
							end
						end
						TML_XiongDiHui_LBSW = API_CreateMonsterEx(98,LBSW,X,Y,4,0,-1,1)
						if KongZhiID > 0 then
							if API_BrotherhoodGetName(KongZhiID) ~= nil then
								local KongZhiName = API_BrotherhoodGetName(KongZhiID)
								API_SetMonsterName(TML_XiongDiHui_LBSW,'['..KongZhiName..']占领',3)
							else
								if API_GetMonsterID(TML_XiongDiHui_LBSW) > 0 then API_SetMonsterName(TML_XiongDiHui_LBSW,'[无人占领]',3) end
							end
						else
							if API_GetMonsterID(TML_XiongDiHui_LBSW) > 0 then API_SetMonsterName(TML_XiongDiHui_LBSW,'[无人占领]',3) end
						end
						XiongDiHui_NPC_Table[98][i].FastID = TML_XiongDiHui_LBSW
					end
				end
			end
			--落日农庄（帝国）
			if API_GetServerID() == 1 then
				if XiongDiHui_NPC_Table ~= nil then
					local DGSW = XiongDiHui_NPC_Table[99][1].NPCID1
					for i in XiongDiHui_NPC_Table[99] do
						local X = XiongDiHui_NPC_Table[99][i].X
						local Y = XiongDiHui_NPC_Table[99][i].Y
						local TML_XiongDiHui_DGSW = XiongDiHui_NPC_Table[99][i].FastID
						local Key = XiongDiHui_NPC_Table[99][i].Key
						local Key3 = XiongDiHui_NPC_Table[99][i].Key3
						local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
						if KongZhiID > 0 then
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
						if TML_XiongDiHui_DGSW ~= nil and TML_XiongDiHui_DGSW ~= 0 then
							if API_GetMonsterID(TML_XiongDiHui_DGSW) > 0 then
								API_DestroyMonster(TML_XiongDiHui_DGSW)
							end
						end
						TML_XiongDiHui_DGSW = API_CreateMonsterEx(99,DGSW,X,Y,4,0,-1,1)
						if KongZhiID > 0 then
							if API_BrotherhoodGetName(KongZhiID) ~= nil then
								local KongZhiName = API_BrotherhoodGetName(KongZhiID)
								API_SetMonsterName(TML_XiongDiHui_DGSW,'['..KongZhiName..']占领',3)
							else
								if API_GetMonsterID(TML_XiongDiHui_DGSW) > 0 then API_SetMonsterName(TML_XiongDiHui_DGSW,'[无人占领]',3) end
							end
						else
							if API_GetMonsterID(TML_XiongDiHui_DGSW) > 0 then API_SetMonsterName(TML_XiongDiHui_DGSW,'[无人占领]',3) end
						end
						XiongDiHui_NPC_Table[99][i].FastID = TML_XiongDiHui_DGSW
					end
				end
			end
			TML_XiongDiHui_End = 1
		end
	end
end

function XiongDiHui_QingChuShuJu(ActorID)
	local XiongDiHuiID = API_GetBrotherhoodID(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local XDHID = API_GetBrotherhoodID(ActorID)
	local CampID = API_GetActorCamp(ActorID)
	API_VarDataSetNumber(ActorID,1,11818,0)--清除玩家领取过BUFF
	if MapConfigID == LBMapID or MapConfigID == DGMapID then
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
	if XDHID > 0 then
		if API_BrotherhoodGetMaster(0,ActorID) == 1 then
			if not API_IsBattleGameServer() then
				if CampID == 1 then
					API_ActorMsgBoard(ActorID,-1,1,'指挥官争夺战已经在娜纱湿地和光明遗迹打响了，请兄弟会成员前往争夺。在娜纱湿地和光明遗迹按M键打开地图可查看兄弟会指挥官所在位置。')
				elseif CampID == 0 then
					API_ActorMsgBoard(ActorID,-1,0,'指挥官争夺战已经在落日农庄和光明遗迹打响了，请兄弟会成员前往争夺。在落日农庄和光明遗迹按M键打开地图可查看兄弟会指挥官所在位置。')
				end
			end
		end
	end
end

function XiongDiHui_SheZhiPKID(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if MapConfigID == LBMapID or MapConfigID == DGMapID then
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

function NPCDie_DirTriggerGCallFunc(Param_1,Param_2,CType,NPCFastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY)
	local MapConfigID = API_GetMapConfigID(MapID)
	local XiongDiHuiID = API_GetBrotherhoodID(KillerID)
	local XiongDiHuiName = ''
	if XiongDiHuiID > 0 then
		XiongDiHuiName = API_BrotherhoodGetName(XiongDiHuiID)
	end
	if MapConfigID == LBMapID then	--联邦
		API_ActorBroadcastMsgEx(LBMapID,-1,0,17,'['..XiongDiHuiName..']兄弟会控制了指挥官，如能坚守到战争结束，将获得大量经验和金币')
		API_ActorBroadcastMsgEx(LBMapID,-1,0,1,'['..XiongDiHuiName..']兄弟会控制了指挥官，如能坚守到战争结束，将获得大量经验和金币')
		API_ActorBroadcastMsgEx(LBMapID,-1,0,7,'['..XiongDiHuiName..']兄弟会控制了指挥官，如能坚守到战争结束，将获得大量经验和金币')
	elseif MapConfigID == DGMapID then	--帝国
		API_ActorBroadcastMsgEx(DGMapID,-1,0,17,'['..XiongDiHuiName..']兄弟会控制了指挥官，如能坚守到战争结束，将获得大量经验和金币')
		API_ActorBroadcastMsgEx(DGMapID,-1,0,1,'['..XiongDiHuiName..']兄弟会控制了指挥官，如能坚守到战争结束，将获得大量经验和金币')
		API_ActorBroadcastMsgEx(DGMapID,-1,0,7,'['..XiongDiHuiName..']兄弟会控制了指挥官，如能坚守到战争结束，将获得大量经验和金币')
	end
	if XiongDiHui_NPC_Table[MapConfigID] ~= nil then
		for i in XiongDiHui_NPC_Table[MapConfigID] do
			local Key = XiongDiHui_NPC_Table[MapConfigID][i].Key
			local FastID = XiongDiHui_NPC_Table[MapConfigID][i].FastID
			if FastID == NPCFastID then
				FastID2 = API_CreateMonsterEx(MapConfigID,MonsterID,PosX,PosY,4,0,-1,-1)
				API_MonsterAddStatus(FastID2,783001,0)	--给NPC加免疫控制技能
				API_MonsterAddStatus(FastID2,92001,0)	--给NPC加免疫控制技能
				API_SetMonsterName(FastID2,''..XiongDiHuiName..'占领的指挥官',1)
				API_CreateDieTriggerG(0,0,0,FastID2,'NPCDie_DirTriggerGCallFunc')
				if XiongDiHuiID > 0 then
					API_SetMonsterPKTeamID(FastID2,XiongDiHuiID)
					API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,XiongDiHuiID)
				end
				XiongDiHui_NPC_Table[MapConfigID][i].FastID = FastID2
				break
			end
		end
	end
end

function XiongDiHui_OnLoginMap(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local XiongDiHuiID = API_GetBrotherhoodID(ActorID)
	if MapConfigID == LBMapID then
		API_ActorAddMapPoint(ActorID,992170,MapConfigID,221,454,1,'兄弟会指挥官')
		API_ActorAddMapPoint(ActorID,992171,MapConfigID,449,278,1,'兄弟会指挥官')
		API_ActorAddMapPoint(ActorID,992172,MapConfigID,353,507,1,'兄弟会指挥官')
	elseif MapConfigID == DGMapID then
		API_ActorAddMapPoint(ActorID,992170,MapConfigID,220,387,1,'兄弟会指挥官')
		API_ActorAddMapPoint(ActorID,992171,MapConfigID,543,330,1,'兄弟会指挥官')
		API_ActorAddMapPoint(ActorID,992172,MapConfigID,387,544,1,'兄弟会指挥官')
	end
	if Hour == TML_XiongDiHui_StartHour and (Minute >= TML_XiongDiHui_StartMinute and Minute <= TML_XiongDiHui_EndMinute) then
		if MapConfigID == LBMapID or MapConfigID == DGMapID then
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
		if MapConfigID == LBMapID or MapConfigID == DGMapID then
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

function XiongDiHui_OnLogoutMap(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == TML_XiongDiHui_StartHour and (Minute >= TML_XiongDiHui_StartMinute and Minute <= TML_XiongDiHui_EndMinute) then
		if MapConfigID == LBMapID or MapConfigID == DGMapID then
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

function XiongDiHui_OnLogin(ActorID)
	local XDHID = API_GetBrotherhoodID(ActorID)
	local ActorLV = API_GetActorExpLevel(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local XiongDiHuiID = API_GetBrotherhoodID(ActorID)
	local nType = API_VarDataGetNumber(ActorID,0,18368)
	local CampID = API_GetActorCamp(ActorID)
	if MapConfigID == LBMapID then
		API_ActorAddMapPoint(ActorID,992170,MapConfigID,221,454,1,'兄弟会指挥官')
		API_ActorAddMapPoint(ActorID,992171,MapConfigID,449,278,1,'兄弟会指挥官')
		API_ActorAddMapPoint(ActorID,992172,MapConfigID,353,507,1,'兄弟会指挥官')
	elseif MapConfigID == DGMapID then
		API_ActorAddMapPoint(ActorID,992170,MapConfigID,220,387,1,'兄弟会指挥官')
		API_ActorAddMapPoint(ActorID,992171,MapConfigID,543,330,1,'兄弟会指挥官')
		API_ActorAddMapPoint(ActorID,992172,MapConfigID,387,544,1,'兄弟会指挥官')
	end
	if Hour == TML_XiongDiHui_StartHour and (Minute >= TML_XiongDiHui_StartMinute and Minute <= TML_XiongDiHui_EndMinute) then
		if MapConfigID == LBMapID or MapConfigID == DGMapID then
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
		if nType == 1 then
			if ActorLV >= 16 then
				if MapID == StaticMapID then
					if not API_IsBattleGameServer() then
						if CampID == 0 then	--帝国
							if XDHID > 0 then
								if API_BrotherhoodGetMaster(0,ActorID) == 1 then
									API_ActorMsgBoard(ActorID,-1,0,'指挥官争夺战已经在落日农庄和光明遗迹打响了，请兄弟会成员前往争夺。在落日农庄和光明遗迹按M键打开地图可查看兄弟会指挥官所在位置。')
								end
							end
							API_ActorSendMsg(ActorID,17,'指挥官争夺战已经在落日农庄和光明遗迹打响了，请兄弟会成员前往争夺')
							API_ActorSendMsg(ActorID,1,'指挥官争夺战已经在落日农庄和光明遗迹打响了，请兄弟会成员前往争夺')
							API_ActorSendMsg(ActorID,7,'指挥官争夺战已经在落日农庄和光明遗迹打响了，请兄弟会成员前往争夺')
						elseif CampID == 1 then	--联邦
							if XDHID > 0 then
								if API_BrotherhoodGetMaster(0,ActorID) == 1 then
									API_ActorMsgBoard(ActorID,-1,1,'指挥官争夺战已经在娜纱湿地和光明遗迹打响了，请兄弟会成员前往争夺。在娜纱湿地和光明遗迹按M键打开地图可查看兄弟会指挥官所在位置。')
								end
							end
							API_ActorSendMsg(ActorID,17,'指挥官争夺战已经在娜纱湿地和光明遗迹打响了，请兄弟会成员前往争夺')
							API_ActorSendMsg(ActorID,1,'指挥官争夺战已经在娜纱湿地和光明遗迹打响了，请兄弟会成员前往争夺')
							API_ActorSendMsg(ActorID,7,'指挥官争夺战已经在娜纱湿地和光明遗迹打响了，请兄弟会成员前往争夺')
						end
					end
				end
			end
		end
	else
		if MapConfigID == LBMapID or MapConfigID == DGMapID then
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

function XiongDiHui_OnLogout(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == TML_XiongDiHui_StartHour and (Minute >= TML_XiongDiHui_StartMinute and Minute <= TML_XiongDiHui_EndMinute) then
		if MapConfigID == LBMapID or MapConfigID == DGMapID then
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

--服务器开启时NPC争夺战触发器
if NPCBattle_CFQ_2 ~= nil then
	API_DestroyTriggerG(NPCBattle_CFQ_2)
end
NPCBattle_CFQ_2 = API_CreateTimerTriggerG(0,0,180,1,'NPCBattle_2_TimerTriggerGCallFunc')

--服务器开启时改指挥官名称后缀触发器
if API_GetServerID() == 1 then
	if NPCFixName_CFQ ~= nil then
		API_DestroyTriggerG(NPCFixName_CFQ)
	end
	NPCFixName_CFQ = API_CreateTimerTriggerG(0,0,180,1,'NPCFixName_TimerTriggerGCallFunc')
end

--服务器开启后判断在争夺时间外则改后缀
function NPCFixName_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour < TML_XiongDiHui_StartHour or (Hour == TML_XiongDiHui_StartHour and Minute > TML_XiongDiHui_EndMinute) or Hour > TML_XiongDiHui_StartHour then
		if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 1 then
			if API_GetServerID() == 1 then
				if XiongDiHui_NPC_Table ~= nil then
					for i in XiongDiHui_NPC_Table[98] do
						local TML_XiongDiHui_LBSW = XiongDiHui_NPC_Table[98][i].FastID
						local Key = XiongDiHui_NPC_Table[98][i].Key
						local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
						if KongZhiID > 0 then
							if API_BrotherhoodGetName(KongZhiID) ~= nil then
								local KongZhiName = API_BrotherhoodGetName(KongZhiID)
								API_SetMonsterName(TML_XiongDiHui_LBSW,'['..KongZhiName..']占领',3)
							else
								if API_GetMonsterID(TML_XiongDiHui_LBSW) > 0 then API_SetMonsterName(TML_XiongDiHui_LBSW,'[无人占领]',3) end
							end
						else
							if API_GetMonsterID(TML_XiongDiHui_LBSW) > 0 then API_SetMonsterName(TML_XiongDiHui_LBSW,'[无人占领]',3) end
						end
					end
				end
			end
			if API_GetServerID() == 1 then
				if XiongDiHui_NPC_Table ~= nil then
					for i in XiongDiHui_NPC_Table[99] do
						local TML_XiongDiHui_DGSW = XiongDiHui_NPC_Table[99][i].FastID
						local Key = XiongDiHui_NPC_Table[99][i].Key
						local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
						if KongZhiID > 0 then
							if API_BrotherhoodGetName(KongZhiID) ~= nil then
								local KongZhiName = API_BrotherhoodGetName(KongZhiID)
								API_SetMonsterName(TML_XiongDiHui_DGSW,'['..KongZhiName..']占领',3)
							else
								if API_GetMonsterID(TML_XiongDiHui_DGSW) > 0 then API_SetMonsterName(TML_XiongDiHui_DGSW,'[无人占领]',3) end
							end
						else
							if API_GetMonsterID(TML_XiongDiHui_DGSW) > 0 then API_SetMonsterName(TML_XiongDiHui_DGSW,'[无人占领]',3) end
						end
					end
				end
			end
		else
			if API_GetServerID() == 1 then
				if NPCFixName_CFQ ~= nil then
					API_DestroyTriggerG(NPCFixName_CFQ)
				end
				NPCFixName_CFQ = API_CreateTimerTriggerG(0,0,180,1,'NPCFixName_TimerTriggerGCallFunc')
			end
		end
	end
end

--服务器开启时判断当前时间是否在争夺时间内
function NPCBattle_2_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == TML_XiongDiHui_StartHour and Minute > TML_XiongDiHui_StartMinute and Minute < TML_XiongDiHui_EndMinute then
		if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 1 then
			TML_XiongDiHui_End = 0
			if API_GetServerID() == 1 then
				if not API_IsBattleGameServer() then
					API_ActorBDCMsg(-1,0,0,16,85,0,17,'指挥官争夺战已经在落日农庄和光明遗迹打响了，请兄弟会成员前往争夺')
					API_ActorBDCMsg(-1,0,0,16,85,0,1,'指挥官争夺战已经在落日农庄和光明遗迹打响了，请兄弟会成员前往争夺')
					API_ActorBDCMsg(-1,0,0,16,85,0,7,'指挥官争夺战已经在落日农庄和光明遗迹打响了，请兄弟会成员前往争夺')
					API_ActorBDCMsg(-1,0,1,16,85,0,17,'指挥官争夺战已经在娜纱湿地和光明遗迹打响了，请兄弟会成员前往争夺')
					API_ActorBDCMsg(-1,0,1,16,85,0,1,'指挥官争夺战已经在娜纱湿地和光明遗迹打响了，请兄弟会成员前往争夺')
					API_ActorBDCMsg(-1,0,1,16,85,0,7,'指挥官争夺战已经在娜纱湿地和光明遗迹打响了，请兄弟会成员前往争夺')
				end
			end
			API_SetAreaType(LBDTMapID,1,1)
			API_SetAreaType(LBDTMapID,2,1)
			API_SetAreaType(LBDTMapID,3,1)
			API_SetAreaType(DGDTMapID,1,1)
			API_SetAreaType(DGDTMapID,2,1)
			API_SetAreaType(DGDTMapID,3,1)
			API_ActorCallBack(-1,0,-1,'XiongDiHui_QingChuShuJu')
			--删除正常NPC，创建可攻击NPC并且创建死亡触发器
			if API_GetServerID() == 1 then
				if XiongDiHui_NPC_Table ~= nil then
					local LBSW = XiongDiHui_NPC_Table[98][1].NPCID2
					for i in XiongDiHui_NPC_Table[98] do
						local X = XiongDiHui_NPC_Table[98][i].X
						local Y = XiongDiHui_NPC_Table[98][i].Y
						local TML_XiongDiHui_LBSW = XiongDiHui_NPC_Table[98][i].FastID
						local Key = XiongDiHui_NPC_Table[98][i].Key
						local Key2 = XiongDiHui_NPC_Table[98][i].Key2
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,0)
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key2,0)
						if TML_XiongDiHui_LBSW ~= nil and TML_XiongDiHui_LBSW ~= 0 then
							if API_GetMonsterID(TML_XiongDiHui_LBSW) > 0 then
								API_DestroyMonster(TML_XiongDiHui_LBSW)
							end
						end
						TML_XiongDiHui_LBSW = API_CreateMonsterEx(98,LBSW,X,Y,4,0,-1,-1)
						if API_GetMonsterID(TML_XiongDiHui_LBSW) > 0 then API_SetMonsterName(TML_XiongDiHui_LBSW,'[无人占领]',3) end
						API_MonsterAddStatus(TML_XiongDiHui_LBSW,783001,0)	--给NPC加免疫控制技能
						API_MonsterAddStatus(TML_XiongDiHui_LBSW,92001,0)	--给NPC加免疫控制技能
						API_CreateDieTriggerG(0,0,0,TML_XiongDiHui_LBSW,'NPCDie_DirTriggerGCallFunc')
						API_SetMonsterPKTeamID(TML_XiongDiHui_LBSW,0)
						XiongDiHui_NPC_Table[98][i].FastID = TML_XiongDiHui_LBSW
					end
				end
			end
			if API_GetServerID() == 1 then
				if XiongDiHui_NPC_Table ~= nil then
					local DGSW = XiongDiHui_NPC_Table[99][1].NPCID2
					for i in XiongDiHui_NPC_Table[99] do
						local X = XiongDiHui_NPC_Table[99][i].X
						local Y = XiongDiHui_NPC_Table[99][i].Y
						local TML_XiongDiHui_DGSW = XiongDiHui_NPC_Table[99][i].FastID
						local Key = XiongDiHui_NPC_Table[99][i].Key
						local Key2 = XiongDiHui_NPC_Table[99][i].Key2
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,0)
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key2,0)
						if TML_XiongDiHui_DGSW ~= nil and TML_XiongDiHui_DGSW ~= 0 then
							if API_GetMonsterID(TML_XiongDiHui_DGSW) > 0 then
								API_DestroyMonster(TML_XiongDiHui_DGSW)
							end
						end
						TML_XiongDiHui_DGSW = API_CreateMonsterEx(99,DGSW,X,Y,4,0,-1,-1)
						if API_GetMonsterID(TML_XiongDiHui_DGSW) > 0 then API_SetMonsterName(TML_XiongDiHui_DGSW,'[无人占领]',3) end
						API_MonsterAddStatus(TML_XiongDiHui_DGSW,783001,0)	--给NPC加免疫控制技能
						API_MonsterAddStatus(TML_XiongDiHui_DGSW,92001,0)	--给NPC加免疫控制技能
						API_CreateDieTriggerG(0,0,0,TML_XiongDiHui_DGSW,'NPCDie_DirTriggerGCallFunc')
						API_SetMonsterPKTeamID(TML_XiongDiHui_DGSW,0)
						XiongDiHui_NPC_Table[99][i].FastID = TML_XiongDiHui_DGSW
					end
				end
			end
		else
			if API_GetServerID() == 1 then
				if NPCBattle_CFQ_2 ~= nil then
					API_DestroyTriggerG(NPCBattle_CFQ_2)
				end
				NPCBattle_CFQ_2 = API_CreateTimerTriggerG(0,0,180,1,'NPCBattle_2_TimerTriggerGCallFunc')
			end
		end
	end
end

--争夺时间外更新指挥官名称后缀触发器
if API_GetServerID() == 1 then
	if NPCUpDateName_CFQ ~= nil then
		API_DestroyTriggerG(NPCUpDateName_CFQ)
	end
	NPCUpDateName_CFQ = API_CreateTimerTriggerG(0,0,180,-1,'NPCUpDateName_TimerTriggerGCallFunc')
end

function NPCUpDateName_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour < TML_XiongDiHui_StartHour or (Hour == TML_XiongDiHui_StartHour and Minute > TML_XiongDiHui_EndMinute) or Hour > TML_XiongDiHui_StartHour then
		if XiongDiHui_NPC_Table ~= nil then
			for i in XiongDiHui_NPC_Table[98] do
				local FastID = XiongDiHui_NPC_Table[98][i].FastID
				local Key = XiongDiHui_NPC_Table[98][i].Key
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
			for i in XiongDiHui_NPC_Table[99] do
				local FastID = XiongDiHui_NPC_Table[99][i].FastID
				local Key = XiongDiHui_NPC_Table[99][i].Key
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
	if NPCBuCunZai_CFQ ~= nil then
		API_DestroyTriggerG(NPCBuCunZai_CFQ)
	end
	NPCBuCunZai_CFQ = API_CreateTimerTriggerG(0,0,60,-1,'NPCBuCunZai_TimerTriggerGCallFunc')
end

function NPCBuCunZai_TimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == TML_XiongDiHui_StartHour and (Minute > TML_XiongDiHui_StartMinute and Minute < TML_XiongDiHui_EndMinute) then
		if XiongDiHui_NPC_Table ~= nil then
			local LBSW = XiongDiHui_NPC_Table[98][1].NPCID2
			local DGSW = XiongDiHui_NPC_Table[99][1].NPCID2
			for i in XiongDiHui_NPC_Table[98] do
				local X = XiongDiHui_NPC_Table[98][i].X
				local Y = XiongDiHui_NPC_Table[98][i].Y
				local Key = XiongDiHui_NPC_Table[98][i].Key
				local TML_XiongDiHui_LBSW = XiongDiHui_NPC_Table[98][i].FastID
				local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				if TML_XiongDiHui_LBSW ~= nil and TML_XiongDiHui_LBSW ~= 0 then
					if API_GetMonsterID(TML_XiongDiHui_LBSW) <= 0 then
						TML_XiongDiHui_LBSW = API_CreateMonsterEx(98,LBSW,X,Y,4,0,-1,-1)
						API_MonsterAddStatus(TML_XiongDiHui_LBSW,783001,0)	--给NPC加免疫控制技能
						API_MonsterAddStatus(TML_XiongDiHui_LBSW,92001,0)	--给NPC加免疫控制技能
						if KongZhiID > 0 then
							API_SetMonsterPKTeamID(TML_XiongDiHui_LBSW,KongZhiID)
							if API_BrotherhoodGetName(KongZhiID) ~= nil then
								local KongZhiName = API_BrotherhoodGetName(KongZhiID)
								API_SetMonsterName(TML_XiongDiHui_LBSW,''..KongZhiName..'占领的指挥官',1)
							else
								if API_GetMonsterID(TML_XiongDiHui_LBSW) > 0 then API_SetMonsterName(TML_XiongDiHui_LBSW,'[无人占领]',3) end
							end
						else
							API_SetMonsterPKTeamID(TML_XiongDiHui_LBSW,0)
							if API_GetMonsterID(TML_XiongDiHui_LBSW) > 0 then API_SetMonsterName(TML_XiongDiHui_LBSW,'[无人占领]',3) end
						end
						API_CreateDieTriggerG(0,0,0,TML_XiongDiHui_LBSW,'NPCDie_DirTriggerGCallFunc')
						XiongDiHui_NPC_Table[98][i].FastID = TML_XiongDiHui_LBSW
					end
				end
			end
			for j in XiongDiHui_NPC_Table[99] do
				local X = XiongDiHui_NPC_Table[99][j].X
				local Y = XiongDiHui_NPC_Table[99][j].Y
				local Key = XiongDiHui_NPC_Table[99][j].Key
				local TML_XiongDiHui_DGSW = XiongDiHui_NPC_Table[99][j].FastID
				local KongZhiID = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				if TML_XiongDiHui_DGSW ~= nil and TML_XiongDiHui_DGSW ~= 0 then
					if API_GetMonsterID(TML_XiongDiHui_DGSW) <= 0 then
						TML_XiongDiHui_DGSW = API_CreateMonsterEx(99,DGSW,X,Y,4,0,-1,-1)
						API_MonsterAddStatus(TML_XiongDiHui_DGSW,783001,0)	--给NPC加免疫控制技能
						API_MonsterAddStatus(TML_XiongDiHui_DGSW,92001,0)	--给NPC加免疫控制技能
						if KongZhiID > 0 then
							API_SetMonsterPKTeamID(TML_XiongDiHui_DGSW,KongZhiID)
							if API_BrotherhoodGetName(KongZhiID) ~= nil then
								local KongZhiName = API_BrotherhoodGetName(KongZhiID)
								API_SetMonsterName(TML_XiongDiHui_DGSW,''..KongZhiName..'占领的指挥官',1)
							else
								if API_GetMonsterID(TML_XiongDiHui_DGSW) > 0 then API_SetMonsterName(TML_XiongDiHui_DGSW,'[无人占领]',3) end
							end
						else
							API_SetMonsterPKTeamID(TML_XiongDiHui_DGSW,0)
							if API_GetMonsterID(TML_XiongDiHui_DGSW) > 0 then API_SetMonsterName(TML_XiongDiHui_DGSW,'[无人占领]',3) end
						end
						API_CreateDieTriggerG(0,0,0,TML_XiongDiHui_DGSW,'NPCDie_DirTriggerGCallFunc')
						XiongDiHui_NPC_Table[99][j].FastID = TML_XiongDiHui_DGSW
					end
				end
			end
		end
	end
end
