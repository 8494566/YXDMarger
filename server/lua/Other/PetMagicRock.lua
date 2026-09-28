-------------------------------
--文件名:	Scp\Lua\Other\PetMagicRock.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	刘操
--日  期:	2010-11-12
--版  本:	
--描  述:   宠物经验活动
--应  用:  
-------------------------------


local PetMagicRock_StartTime = {Year = 2010,Month = 12,Day = 1,Hour = 0,Minute = 0,Second = 0}   -------开始时间
local PetMagicRock_EndTime = {Year = 2011,Month = 9,Day = 1,Hour = 0,Minute = 0,Second = 0}   -------开始时间

local PetLevelTable = {
[0] = {Exp = 1760,Status = 2005001,},
[1] = {Exp = 1760,Status = 2005001,},
[2] = {Exp = 1760,Status = 2005001,},
[3] = {Exp = 1760,Status = 2005001,},
[4] = {Exp = 1760,Status = 2005001,},
[5] = {Exp = 1760,Status = 2005001,},
[6] = {Exp = 3520,Status = 2005001,},
[7] = {Exp = 5280,Status = 2005001,},
[8] = {Exp = 7040,Status = 2005001,},
[9] = {Exp = 8800,Status = 2005001,},
[10] = {Exp = 10560,Status = 2005001,},
[11] = {Exp = 13200,Status = 2005002,},
[12] = {Exp = 14960,Status = 2005003,},
[13] = {Exp = 16720,Status = 2005004,},
[14] = {Exp = 18480,Status = 2005005,},
[15] = {Exp = 20240,Status = 2005006,},
[16] = {Exp = 22000,Status = 2005007,},
[17] = {Exp = 23760,Status = 2005008,},
[18] = {Exp = 25520,Status = 2005009,},
[19] = {Exp = 27280,Status = 2005010,},
[20] = {Exp = 29040,Status = 2005011,},
[21] = {Exp = 34320,Status = 2005012,},
[22] = {Exp = 36960,Status = 2005013,},
[23] = {Exp = 39600,Status = 2005014,},
[24] = {Exp = 42240,Status = 2005015,},
[25] = {Exp = 44880,Status = 2005016,},
[26] = {Exp = 79200,Status = 2005017,},
[27] = {Exp = 84480,Status = 2005018,},
[28] = {Exp = 89760,Status = 2005019,},
[29] = {Exp = 95040,Status = 2005020,},
[30] = {Exp = 100320,Status = 2005021,},
[31] = {Exp = 124800,Status = 2005022,},
[32] = {Exp = 131040,Status = 2005023,},
[33] = {Exp = 137280,Status = 2005024,},
[34] = {Exp = 143520,Status = 2005025,},
[35] = {Exp = 149760,Status = 2005026,},
[36] = {Exp = 168480,Status = 2005027,},
[37] = {Exp = 176280,Status = 2005028,},
[38] = {Exp = 184080,Status = 2005029,},
[39] = {Exp = 191880,Status = 2005030,},
[40] = {Exp = 199680,Status = 2005031,},
[41] = {Exp = 223080,Status = 2005032,},
[42] = {Exp = 232440,Status = 2005033,},
[43] = {Exp = 241800,Status = 2005034,},
[44] = {Exp = 251160,Status = 2005035,},
[45] = {Exp = 260520,Status = 2005036,},
[46] = {Exp = 269880,Status = 2005037,},
[47] = {Exp = 279240,Status = 2005038,},
[48] = {Exp = 288600,Status = 2005039,},
[49] = {Exp = 297960,Status = 2005040,},
[50] = {Exp = 307320,Status = 2005041,},
[51] = {Exp = 316940,Status = 2005042,},
[52] = {Exp = 326560,Status = 2005043,},
[53] = {Exp = 336180,Status = 2005044,},
[54] = {Exp = 345800,Status = 2005045,},
[55] = {Exp = 355420,Status = 2005046,},
[56] = {Exp = 365040,Status = 2005047,},
[57] = {Exp = 374660,Status = 2005048,},
[58] = {Exp = 384280,Status = 2005049,},
[59] = {Exp = 393900,Status = 2005050,},
[60] = {Exp = 403520,Status = 2005051,},
[61] = {Exp = 413660,Status = 2005052,},
[62] = {Exp = 423800,Status = 2005053,},
[63] = {Exp = 433940,Status = 2005054,},
[64] = {Exp = 444080,Status = 2005055,},
[65] = {Exp = 455780,Status = 2005056,},
[66] = {Exp = 467480,Status = 2005057,},
[67] = {Exp = 479180,Status = 2005058,},
[68] = {Exp = 490880,Status = 2005059,},
[69] = {Exp = 502580,Status = 2005060,},
[70] = {Exp = 518180,Status = 2005061,},
[71] = {Exp = 533780,Status = 2005062,},
[72] = {Exp = 549380,Status = 2005063,},
[73] = {Exp = 564980,Status = 2005064,},
[74] = {Exp = 580580,Status = 2005065,},
[75] = {Exp = 596180,Status = 2005066,},
[76] = {Exp = 619580,Status = 2005067,},
[77] = {Exp = 642980,Status = 2005068,},
[78] = {Exp = 666380,Status = 2005069,},
[79] = {Exp = 689780,Status = 2005070,},
[80] = {Exp = 713180,Status = 2005071,},
[81] = {Exp = 739180,Status = 2005072,},
[82] = {Exp = 765180,Status = 2005073,},
[83] = {Exp = 791180,Status = 2005074,},
[84] = {Exp = 817180,Status = 2005075,},
[85] = {Exp = 843180,Status = 2005076,},
}

local GoodsID1 = 88991
local GoodsID2 = 88992

--上线回调
function PetMagicRock_OnLogin(ActorID)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end	
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel < 10 then
		return
	end
	local nShiFouStart = API_DiffDatatime(PetMagicRock_StartTime.Year,PetMagicRock_StartTime.Month,PetMagicRock_StartTime.Day,PetMagicRock_StartTime.Hour,PetMagicRock_StartTime.Minute,PetMagicRock_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(PetMagicRock_EndTime.Year,PetMagicRock_EndTime.Month,PetMagicRock_EndTime.Day,PetMagicRock_EndTime.Hour,PetMagicRock_EndTime.Minute,PetMagicRock_EndTime.Second)
	if nShiFouStart <= 0 and nShiFouEnd >= 0 then
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
		local BeginTime = PetMagicRock_StartTime.Year * 10000 + PetMagicRock_StartTime.Month * 100 + PetMagicRock_StartTime.Day
		local GetTime = API_VarDataGetNumber(ActorID,1,30225)
		local NowTime = Year * 10000 + Month * 100 + Day		
		if GetTime < BeginTime then
			API_VarDataSetNumber(ActorID,1,30225,NowTime)
			API_SendActorMailByName(API_GetActorName(ActorID),GoodsID2,1,3,'宠物经验活动','活动期间（12月2日起）每日上线即可获赠一个宠物魔力石，参与双子岛怪兽进化活动可获得更多的宠物魔力石。')
			API_ActorSendMsg(ActorID,17,'您的邮箱中获得“'..API_GetGoodsName(GoodsID2)..'”1个，请注意查收')
		end
	end
end

--跨天回调
function PetMagicRock_kuatianchuli(ActorID)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end	
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel < 10 then
		return
	end
	local nShiFouStart = API_DiffDatatime(PetMagicRock_StartTime.Year,PetMagicRock_StartTime.Month,PetMagicRock_StartTime.Day,PetMagicRock_StartTime.Hour,PetMagicRock_StartTime.Minute,PetMagicRock_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(PetMagicRock_EndTime.Year,PetMagicRock_EndTime.Month,PetMagicRock_EndTime.Day,PetMagicRock_EndTime.Hour,PetMagicRock_EndTime.Minute,PetMagicRock_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd >= 0 then
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
		local GetTime = API_VarDataGetNumber(ActorID,1,30225)
		local shangcilingquriqi = API_VarDataGetNumber(ActorID,1,30232) 
		local begintime = PetMagicRock_StartTime.Year * 10000 + PetMagicRock_StartTime.Month * 100 + PetMagicRock_StartTime.Day
		local NowTime = Year * 10000 + Month * 100 + Day
		if GetTime >= begintime and NowTime ~= GetTime and shangcilingquriqi ~= NowTime then
			API_SendActorMailByName(API_GetActorName(ActorID),GoodsID2,1,3,'宠物经验活动','活动期间（12月2日起）每日上线即可获赠一个宠物魔力石，参与双子岛怪兽进化活动可获得更多的宠物魔力石。')
			API_ActorSendMsg(ActorID,17,'您的邮箱中获得“'..API_GetGoodsName(GoodsID2)..'”1个，请注意查收')
			API_VarDataSetNumber(ActorID,1,30232,NowTime)
		end
	end
end



--使用宠物魔力石
--function PetMagicRockUse(ActorID,GoodsID)
--	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
--		API_ActorSendMsg(ActorID,3,'没有这个道具')
--		return 0
--	end
--	if GoodsID == GoodsID2 then
--		API_ResponseWrite('<name>宠物魔力石</name>')
--		API_ResponseWrite('<text>使用宠物魔力石后，将获得持续增加宠物经验的状态，每十秒增加一次宠物经验。</text><br>')
--		API_ResponseWrite('<br><a href="PetMagicRockUse_Title?1=100">使用宠物魔力石</a><br>')
--		API_ResponseWrite('<br><a>关闭</a><br>')
--		API_ResponseFlush(ActorID)
--		return 1
--	elseif GoodsID == GoodsID1 then
--		API_ResponseWrite('<name>宠物经验丹</name>')
--		API_ResponseWrite('<text>使用宠物经验丹能够增加大量宠物经验。</text><br>')
--		API_ResponseWrite('<br><a href="PetMagicRockUse_Title?1=200">使用宠物经验丹</a><br>')
--		API_ResponseWrite('<br><a>关闭</a><br>')
--		API_ResponseFlush(ActorID)
--		return 1
--	else
--		return 0
--	end
--end


function PetMagicRockUse(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID() 
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
--	local SelectItem = API_RequestGetNumber(1)
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
		return 	0
	end
	if ActorLeve + 4 <= PetNum then
		API_ActorSendMsg(ActorID,3,'您的宠物等级已高出角色等级4级，不可再使用该道具')
		return 	0
	end
	if PetNum == MaxLeve then
		API_ActorSendMsg(ActorID,3,'您的宠物等级已达到上限')
		return 0
	end
--	if PetNum < 10 then
--		API_ActorSendMsg(ActorID,3,'10级以下宠物不可使用此道具')
--		return 	
--	end
	local Exp = PetLevelTable[PetNum].Exp
	local Status = PetLevelTable[PetNum].Status
	if GoodsID == GoodsID2 then
		if API_ActorGetGoodsNum(ActorID,GoodsID2) > 0 and API_ActorRemoveGoods(ActorID,GoodsID2,1,'使用宠物魔力石') then--销毁玩家身上的物品
			API_ActorAddStatus(ActorID,Status,0)
			API_ActorSendMsg(ActorID,3,'使用宠物魔力石')
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[62][2][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[62][2][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[62][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[62][2][LaiYuan] + 1
			end
			return 1
		else
			return 0
		end
	elseif GoodsID == GoodsID1 then
		if API_ActorGetGoodsNum(ActorID,GoodsID1) > 0 and API_ActorRemoveGoods(ActorID,GoodsID1,1,'使用宠物经验丹') then--销毁玩家身上的物品
			API_ActorAddPetExp(ActorID,Exp,0,'获得宠物经验')
			API_ActorSendMsg(ActorID,3,'成功使用一个宠物经验丹')
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[62][1][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[62][1][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[62][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[62][1][LaiYuan] + 1
			end
			return 1
		else
			return 0
		end
	else
		return 0
	end
end