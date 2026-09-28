----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\JingYueCheng.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	谭明礼
--日  期:	2009-4-7
--版  本:	1.0
--描  述:	镜月碎片兑换功能
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 谭明礼
--日  期: 2009-4-7
--描  述: 创建

--谭明礼使用的交互数据保留分配区
--任务ID[1761-1800]
--玩家交互ID[11849-12000]

----------------------------------------------------------------------------------------------------------------------
--11849 判断玩家在一层领取了几次奖励
--11854 判断玩家在二层领取了几次奖励
--11850 判断玩家在一层挑战了几次
--11855 判断玩家在二层挑战了几次
--11851 存储玩家在第一层是否挑战成功
--11856 存储玩家在第二层是否挑战成功
--11852 存储玩家领取奖励的时间
--11857 存储玩家挑战的时间
--11853 存储PK触发器ID

Mirror_DuiHuanJiangLiNPC_Table={
		[12291] = {NPCID=12291,JYSPNum=15,JYSPID=80690,JingYan1=32880,JingYan2=54800,NeedLv=36,LQCiShu=2,PlayLQID=11849,ChengGong=11851,DHCWJY1=32880*0.6*0.1,DHCWJY2=32880*0.6*0.5,DHCWJY3=32880*0.6,TZCWJY1=54800*0.6*0.1,TZCWJY2=54800*0.6*0.5,TZCWJY3=54800*0.6},
		[12292] = {NPCID=12292,JYSPNum=30,JYSPID=80690,JingYan1=64440,JingYan2=107400,NeedLv=41,LQCiShu=1,PlayLQID=11854,ChengGong=11856,DHCWJY1=64440*0.6*0.1,DHCWJY2=64440*0.6*0.5,DHCWJY3=64440*0.6,TZCWJY1=107400*0.6*0.1,TZCWJY2=107400*0.6*0.5,TZCWJY3=107400*0.6},
}

Mirror_TiaoZhanNPC_Table={
		[12293]={NPCID=12293,JYSPNum=15,JYSPID=80690,BossID=726255,CiShu=2,NeedLv=36,TiaoZhanID=11850,ChengGong=11851,LQCiShu=2,PlayLQID=11849,JingYan2=54800,TZCWJY1=54800*0.6*0.1,TZCWJY2=54800*0.6*0.5,TZCWJY3=54800*0.6},
		[12294]={NPCID=12294,JYSPNum=30,JYSPID=80690,BossID=726256,CiShu=1,NeedLv=41,TiaoZhanID=11855,ChengGong=11856,LQCiShu=1,PlayLQID=11854,JingYan2=107400,TZCWJY1=107400*0.6*0.1,TZCWJY2=107400*0.6*0.5,TZCWJY3=107400*0.6},
}

if Mirror_TiaoZhanBoss_Table == nil then
	Mirror_TiaoZhanBoss_Table={
		[726255]={BossID=726255,BossFastID=0,MapID=1987,X=66, Y=63, X2=90,Y2=60,ChengGong=11851,JRMSQMapID=128},
		[726256]={BossID=726256,BossFastID=0,MapID=1988,X=61, Y=63, X2=60,Y2=37,ChengGong=11856,JRMSQMapID=129},
	}
end

Mirror_MovePlay_Table = {
		[128] = {X=51,Y=222,X1=1,X2=60,Y1=210,Y2=269},
		[129] = {X=157,Y=225,X1=143,X2=230,Y1=202,Y2=305},
}

Mirror_ActTime = {
			[1] = {RedayTime=7,StartTime=8,EndTime=10,LastTime='8点',LastTime2='12点'},
			[2] = {RedayTime=11,StartTime=12,EndTime=14,LastTime='12点',LastTime2='18点'},
			[3] = {RedayTime=17,StartTime=18,EndTime=20,LastTime='18点',LastTime2='22点'},
			[4] = {RedayTime=21,StartTime=22,EndTime=24,LastTime='22点',LastTime2='明天8点'},
}
--[[
if API_GetServerID() == 8 then
	JYCLJNPC1_Mirror = JYCLJNPC1_Mirror or API_CreateMonsterEx(128,12291,277,345,3,0,-1,1)
	JYCLJNPC2_Mirror = JYCLJNPC2_Mirror or API_CreateMonsterEx(129,12292,144,378,4,0,-1,1)
	JYCTZNPC1_Mirror = JYCTZNPC1_Mirror or API_CreateMonsterEx(128,12293,277,261,3,0,-1,1)
	JYCTZNPC2_Mirror = JYCTZNPC2_Mirror or API_CreateMonsterEx(129,12294,161,387,5,0,-1,1)
	JYCJXCYZ_LB = JYCJXCYZ_LB or API_CreateMonsterEx(105,12296,231,211,5,0,-1,1)
	JYCJXCYZ_DG = JYCJXCYZ_DG or API_CreateMonsterEx(105,12295,413,397,3,0,-1,1)
	JYCJXCYZ_LB_Mirror = JYCJXCYZ_LB_Mirror or API_CreateMonsterEx(128,12296,231,211,5,0,-1,1)
	JYCJXCYZ_DG_Mirror = JYCJXCYZ_DG_Mirror or API_CreateMonsterEx(128,12295,413,397,3,0,-1,1)
end]]

function Mirror_JXCYZ_DuiHua(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local XuanZe = API_RequestGetNumber(1)
	local Camp = API_GetActorCamp(ActorID)
	if XuanZe == 1 then
		if Camp == 0 then --帝国
			API_ActorGoToMap(ActorID,128,424,391)
		elseif Camp == 1 then
			API_ActorGoToMap(ActorID,128,221,201)
		end
	elseif XuanZe == 2 then
		if Camp == 0 then --帝国
			API_ActorGoToMap(ActorID,105,424,391)
		elseif Camp == 1 then
			API_ActorGoToMap(ActorID,105,221,201)
		end
	else
		if MapConfigID == 105 then
			API_ResponseWrite('<text>通过我你可以进入镜像的世界，在这个里面你可以发挥载具的最大威力，里面也有数不尽的财宝</text><br><br>')
			API_ResponseWrite('<a href="Mirror_JXCYZ_DuiHua?1=1">进入镜像世界</a><br><br>')
			API_ResponseWrite('<a>关闭</a>')
		elseif MapConfigID == 128 then
			API_ResponseWrite('<text>通过我你可以离开镜像的世界，你确定要离开吗？</text><br><br>')
			API_ResponseWrite('<a href="Mirror_JXCYZ_DuiHua?1=2">离开镜像世界</a><br><br>')
			API_ResponseWrite('<a>关闭</a>')
		end
	end
end

function Mirror_MonsterCorner_DieTriggerGCallFunc(a,b,Type,BossFastID,KillerType,KillerID,BossID,MapID,X,Y)
	if Mirror_TiaoZhanBoss_Table[BossID] == nil then
		return
	end
	local PlayTiaoZhan = Mirror_TiaoZhanBoss_Table[BossID].ChengGong
	local TeamID = API_GetTeamID(KillerID)
	local KillerMapID = API_GetActorMapID(KillerID)
	if TeamID == 0 then
	--单个玩家的操作
		if API_ActorIsOnline(KillerID) then
			API_VarDataSetNumber(KillerID,1,PlayTiaoZhan,1)
			API_ResponseWrite('<name>挑战成功</name>')
			API_ResponseWrite('<text>恭喜挑战成功，现在可以直接去</text><text color="255,0,255">密室里面的挑战官</text><text>处领取奖励并传送出去。</text><br>')
			API_ResponseWrite('<text>如果你没有在密室挑战官处领取奖励就退出游戏，重新进入游戏可能已经自动被传送出了镜月挑战密室，这时你同样可以去镜月城地下城相应的</text><text color="255,0,255">奖励兑换官</text><text>处领取挑战奖励。</text><br>')
			API_ResponseWrite('<br><br><br><a>确定</a><br>')
			API_ResponseFlush(KillerID)
		end
	else
		local TeamNum = API_GetTeamSize(TeamID)
		for i = 1,TeamNum do
			local TeamPlayID = API_GetTeamMem(TeamID,i)
			if API_ActorIsOnline(TeamPlayID) then
				local TeamPlayMapID = API_GetActorMapID(TeamPlayID)
				if KillerMapID == TeamPlayMapID then
					API_VarDataSetNumber(TeamPlayID,1,PlayTiaoZhan,1)
					API_ResponseWrite('<name>挑战成功</name>')
					API_ResponseWrite('<text>恭喜挑战成功，现在可以直接去</text><text color="255,0,255">密室里面的挑战官</text><text>处领取奖励并传送出去。</text><br>')
					API_ResponseWrite('<text>如果你没有在密室挑战官处领取奖励就退出游戏，重新进入游戏可能已经自动被传送出了镜月挑战密室，这时你同样可以去镜月城地下城相应的</text><text color="255,0,255">奖励兑换官</text><text>处领取挑战奖励。</text><br>')
					API_ResponseWrite('<br><br><br><a>确定</a><br>')
					API_ResponseFlush(TeamPlayID)
				end
			end
		end
	end
end

function Mirror_Title()
	local ActorID = API_RequestGetActorID()
	local TeamID = API_GetTeamID(ActorID)
	local Playname = API_GetActorName(ActorID) --通过玩家ID获取玩家名字
	local SelectItem = API_RequestGetNumber(1) --Request对象获取玩家提交的数字变量值
	local NPCID = API_VarDataGetNumber(ActorID,0,32711)--获取玩家点击的NPCID
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	if Mirror_DuiHuanJiangLiNPC_Table[NPCID] == nil then
		return
	end
	local PlayLQID = Mirror_DuiHuanJiangLiNPC_Table[NPCID].PlayLQID
	local ChengGong = Mirror_DuiHuanJiangLiNPC_Table[NPCID].ChengGong
	local PlayLQYMD = API_VarDataGetNumber(ActorID,1,11852)
	local PlayLQYear = math.floor(PlayLQYMD/10000)
	local PlayLQMonthDay = math.mod(PlayLQYMD,10000)
	local PlayLQMonth = math.floor(PlayLQMonthDay/100)
	local PlayLQDay = math.mod(PlayLQMonthDay,100)
	if TeamID == 0 then
		if Year ~= PlayLQYear or Month ~= PlayLQMonth or Day ~= PlayLQDay then
			API_VarDataSetNumber(ActorID,1,PlayLQID,0)
		end
	elseif TeamID > 0 then
		local TeamNum = API_GetTeamSize(TeamID)
		for i = 1,TeamNum do
			local TeamPlayID = API_GetTeamMem(TeamID,i)
			local TeamPlayLQYMD = API_VarDataGetNumber(TeamPlayID,1,11852)
			local TeamPlayLQYear = math.floor(TeamPlayLQYMD/10000)
			local TeamPlayLQMonthDay = math.mod(TeamPlayLQYMD,10000)
			local TeamPlayLQMonth = math.floor(TeamPlayLQMonthDay/100)
			local TeamPlayLQDay = math.mod(TeamPlayLQMonthDay,100)
			if Year ~= TeamPlayLQYear or Month ~= TeamPlayLQMonth or Day ~= TeamPlayLQDay then
				API_VarDataSetNumber(TeamPlayID,1,PlayLQID,0)
			end
		end
	end
	local JYJLNPCTable = Mirror_DuiHuanJiangLiNPC_Table[NPCID]
	local JYSPID = JYJLNPCTable.JYSPID
	local JYSPNum = JYJLNPCTable.JYSPNum
	local JingYan1 = JYJLNPCTable.JingYan1
	local JingYan2 = JYJLNPCTable.JingYan2
	local DHCWJY1 = JYJLNPCTable.DHCWJY1
	local DHCWJY2 = JYJLNPCTable.DHCWJY2
	local DHCWJY3 = JYJLNPCTable.DHCWJY3
	local TZCWJY1 = JYJLNPCTable.TZCWJY1
	local TZCWJY2 = JYJLNPCTable.TZCWJY2
	local TZCWJY3 = JYJLNPCTable.TZCWJY3
	local ChongWuLV = API_GetActorConjedPetLevel(ActorID)
	local NeedLv = JYJLNPCTable.NeedLv
	local LQCiShu = JYJLNPCTable.LQCiShu
	local PlayLQNum = API_VarDataGetNumber(ActorID,1,PlayLQID)
	local ShiFouChengGong = API_VarDataGetNumber(ActorID,1,ChengGong)--存储玩家在一层是否挑战成功
	if SelectItem == 1 then
		if API_GetActorExpLevel(ActorID) >= NeedLv then
			if PlayLQNum < LQCiShu then
				if API_ActorGetGoodsNum(ActorID, JYSPID) >= JYSPNum then
					if API_ActorRemoveGoods(ActorID, JYSPID, JYSPNum, '直接兑换奖励扣除镜月碎片') then
						API_VarDataSetNumber(ActorID,1,11852,YMD)
						API_VarDataSetNumber(ActorID,1,PlayLQID,PlayLQNum+1)
						local PlayLQNum2 = API_VarDataGetNumber(ActorID,1,PlayLQID)
						if PlayLQNum2 == PlayLQNum + 1 then
							API_ActorAddExp(ActorID, JingYan1, 0, '直接兑换经验值')
							if ChongWuLV ~= -1 then
								if ChongWuLV >= 0 and ChongWuLV <= 10 then
									API_ActorAddPetExp(ActorID,DHCWJY1,0,'直接兑换宠物经验1')
								elseif ChongWuLV >= 11 and ChongWuLV <= 25 then
									API_ActorAddPetExp(ActorID,DHCWJY2,0,'直接兑换宠物经验2')
								elseif ChongWuLV >= 26 and ChongWuLV <= 40 then
									API_ActorAddPetExp(ActorID,DHCWJY3,0,'直接兑换宠物经验3')
								elseif ChongWuLV >= 41 and ChongWuLV <= 55 then
									API_ActorAddPetExp(ActorID,DHCWJY3,0,'直接兑换宠物经验3')
								elseif ChongWuLV >= 56 and ChongWuLV <= 65 then
									API_ActorAddPetExp(ActorID,DHCWJY3,0,'直接兑换宠物经验3')
								end
							end
							API_ActorSendMsg(ActorID,0,'领取奖励成功，恭喜你获得'..JingYan1..'经验值')
							if MapConfigID == 128 then
								API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  × '..JingYan1..'</text><br>')
								API_ResponseWrite('<br><text>您成功的领取了奖励，还需要继续领奖吗？</text><br>')
								API_ResponseWrite('<text>直接领取奖励需要消耗</text><text color="255,0,255">'..JYSPNum..'个'..API_GetGoodsName(JYSPID)..'</text><text>。</text><br>')
								API_ResponseWrite('<br><br><a href="Mirror_Title?1=1">继续领奖</a>')
								API_ResponseWrite('<text>             </text>')
								API_ResponseWrite('<a>取消</a>')
							elseif MapConfigID == 129 then
								API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  × '..JingYan1..'</text><br>')
								API_ResponseWrite('<br><text>您成功的领取了奖励，今天在本层的领奖次数已经用完，请明天再来吧！</text><br>')
								API_ResponseWrite('<br><br><a>我知道了</a><br>')
							end
						end
					
					end
				else
					API_ResponseWrite('<text>你身上的</text><text color="255,0,255">'..API_GetGoodsName(JYSPID)..'</text><text>不足，需要</text><text color="255,0,255">'..JYSPNum..'个</text><text>才能领奖。</text><br>')
					API_ResponseWrite('<br><br><a>我知道了</a><br>')
				end
			else
				API_ResponseWrite('<text>你今天已经领取了</text><text color="255,0,255">'..LQCiShu..'次</text><text>奖励，请明天再来吧。</text><br>')
				API_ResponseWrite('<br><br><a>我知道了</a><br>')
			end
		else
			API_ResponseWrite('<text>你的等级太低，需要达到</text><text color="255,0,255">'..NeedLv..'级</text><text>以上才能领取奖励。</text><br>')
			API_ResponseWrite('<br><br><a>我知道了</a><br>')
		end
	elseif SelectItem == 2 then
		if API_GetActorExpLevel(ActorID) >= NeedLv then
			if PlayLQNum < LQCiShu then
				if ShiFouChengGong > 0 then
					if API_ActorGetGoodsNum(ActorID, JYSPID) >= JYSPNum then
						if API_ActorRemoveGoods(ActorID, JYSPID, JYSPNum, '挑战成功兑换奖励扣除镜月碎片') then
							API_VarDataSetNumber(ActorID,1,11852,YMD)
							API_VarDataSetNumber(ActorID,1,PlayLQID,PlayLQNum+1)
							local PlayLQNum2 = API_VarDataGetNumber(ActorID,1,PlayLQID)
							if PlayLQNum2 == PlayLQNum + 1 then
								API_ActorAddExp(ActorID, JingYan2, 0, '挑战成功领取奖励')
								if ChongWuLV ~= -1 then
									if ChongWuLV >= 0 and ChongWuLV <= 10 then
										API_ActorAddPetExp(ActorID,TZCWJY1,0,'挑战成功兑换宠物经验1')
									elseif ChongWuLV >= 11 and ChongWuLV <= 25 then
										API_ActorAddPetExp(ActorID,TZCWJY2,0,'挑战成功兑换宠物经验2')
									elseif ChongWuLV >= 26 and ChongWuLV <= 40 then
										API_ActorAddPetExp(ActorID,TZCWJY3,0,'挑战成功兑换宠物经验3')
									elseif ChongWuLV >= 41 and ChongWuLV <= 55 then
										API_ActorAddPetExp(ActorID,TZCWJY3,0,'挑战成功兑换宠物经验3')
									elseif ChongWuLV >= 56 and ChongWuLV <= 65 then
										API_ActorAddPetExp(ActorID,TZCWJY3,0,'挑战成功兑换宠物经验3')
									end
								end
								API_VarDataSetNumber(ActorID,1,ChengGong,0)--领取奖励后一层挑战成功交互数据设为0
								API_ActorSendMsg(ActorID,0,'领取奖励成功，恭喜你获得'..JingYan2..'经验值')
								API_ResponseWrite('<text>恭喜您挑战成功。</text><br>')
								API_ResponseWrite('<br><img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  × '..JingYan2..'</text><br>')
								API_ResponseWrite('<br><a>确定</a><br>')
							end
						end
					else
						API_ResponseWrite('<text>你身上的</text><text color="255,0,255">'..API_GetGoodsName(JYSPID)..'</text><text>不足，需要</text><text color="255,0,255">'..JYSPNum..'个</text><text>才能领奖。</text><br>')
						API_ResponseWrite('<br><br><a>我知道了</a><br>')
					end
				else
					API_ResponseWrite('<text>您没有挑战BOSS或者挑战BOSS不成功，请</text><text color="255,0,255">成功挑战</text><text>后再来领取奖励。</text><br>')
					API_ResponseWrite('<br><br><a>我知道了</a><br>')
				end
			else
				API_ResponseWrite('<text>你今天已经领取了</text><text color="255,0,255">'..LQCiShu..'次</text><text>奖励，请明天再来吧。</text><br>')
				API_ResponseWrite('<br><br><a>我知道了</a><br>')
			end
		else
			API_ResponseWrite('<text>你的等级太低，需要达到</text><text color="255,0,255">'..NeedLv..'级</text><text>以上才能领取奖励。</text><br>')
			API_ResponseWrite('<br><br><a>我知道了</a><br>')
		end
	else
		API_ResponseWrite('<text>亲爱的</text><text color="255,0,255">'..Playname..'</text><text>，你需要兑换奖励吗？兑换奖励需要等级达到</text><text color="255,0,255">'..NeedLv..'级</text><text>以上。每天可以兑换</text><text color="255,0,255">'..LQCiShu..'次</text><text>奖励。</text><br>')
		API_ResponseWrite('<text color="255,0,255">（兑换奖励次数总和 = 直接兑换奖励次数 + 挑战成功领取奖励次数）</text><br>')
		API_ResponseWrite('<br><text color="255,0,255">'..JYSPNum..'个'..API_GetGoodsName(JYSPID)..'</text><text>可以直接兑换</text><text color="255,0,255">'..JingYan1..'经验值</text><text>。</text><br>')
		API_ResponseWrite('<text>你也可以进入挑战密室挑战BOSS，挑战成功后可以兑换</text><text color="255,0,255">'..JingYan2..'经验值</text><text>。进入挑战密室需要背包中至少有</text><text color="255,0,255">'..JYSPNum..'个'..API_GetGoodsName(JYSPID)..'</text><text>作为凭证。</text><br>')
		API_ResponseWrite('<br><br><a href="Mirror_Title?1=1">直接兑换奖励</a>')
		API_ResponseWrite('<text>            </text>')
		API_ResponseWrite('<a href="Mirror_Title?1=2">挑战成功，领取奖励</a>')
		API_ResponseWrite('<text>            </text>')
		API_ResponseWrite('<a>取消</a>')
	end
end 

function Mirror_TiaoZhanNPC_Title()
	local ActorID = API_RequestGetActorID()
	local TeamID = API_GetTeamID(ActorID)
	local SelectItem = API_RequestGetNumber(1) --Request对象获取玩家提交的数字变量值
	local NPCID = API_VarDataGetNumber(ActorID,0,32711)--获取玩家点击的NPCID
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local JYTable = Mirror_TiaoZhanNPC_Table[NPCID]
	local JingYan2 = JYTable.JingYan2
	local PlayLQID = JYTable.PlayLQID
	local LQCiShu = JYTable.LQCiShu
	local JYSPID = JYTable.JYSPID
	local JYSPNum = JYTable.JYSPNum
	local TZCWJY1 = JYTable.TZCWJY1
	local TZCWJY2 = JYTable.TZCWJY2
	local TZCWJY3 = JYTable.TZCWJY3
	local ChongWuLV = API_GetActorConjedPetLevel(ActorID)
	local PlayLQNum = API_VarDataGetNumber(ActorID,1,PlayLQID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
		if Mirror_TiaoZhanNPC_Table[NPCID] == nil then
			return
		end
	local TiaoZhanID = Mirror_TiaoZhanNPC_Table[NPCID].TiaoZhanID
	local ChengGong = Mirror_TiaoZhanNPC_Table[NPCID].ChengGong
	local PlayTZNum = API_VarDataGetNumber(ActorID,1,TiaoZhanID) --存储玩家挑战次数
	local ShiFouChengGong = API_VarDataGetNumber(ActorID,1,ChengGong)--存储玩家是否挑战成功
	local PlayLQYMD = API_VarDataGetNumber(ActorID,1,11852)
	local PlayLQYear = math.floor(PlayLQYMD/10000)
	local PlayLQMonthDay = math.mod(PlayLQYMD,10000)
	local PlayLQMonth = math.floor(PlayLQMonthDay/100)
	local PlayLQDay = math.mod(PlayLQMonthDay,100)
	if TeamID == 0 then
		if Year ~= PlayLQYear or Month ~= PlayLQMonth or Day ~= PlayLQDay then
			API_VarDataSetNumber(ActorID,1,PlayLQID,0)
		end
	elseif TeamID > 0 then
		local TeamNum = API_GetTeamSize(TeamID)
		for i = 1,TeamNum do
			local TeamPlayID = API_GetTeamMem(TeamID,i)
			local TeamPlayLQYMD = API_VarDataGetNumber(TeamPlayID,1,11852)
			local TeamPlayLQYear = math.floor(TeamPlayLQYMD/10000)
			local TeamPlayLQMonthDay = math.mod(TeamPlayLQYMD,10000)
			local TeamPlayLQMonth = math.floor(TeamPlayLQMonthDay/100)
			local TeamPlayLQDay = math.mod(TeamPlayLQMonthDay,100)
			if Year ~= TeamPlayLQYear or Month ~= TeamPlayLQMonth or Day ~= TeamPlayLQDay then
				API_VarDataSetNumber(TeamPlayID,1,PlayLQID,0)
			end
		end
	end
	local PlayTZYMD = API_VarDataGetNumber(ActorID,1,11857)
	local PlayTZYear = math.floor(PlayTZYMD/10000)
	local PlayTZMonthDay = math.mod(PlayTZYMD,10000)
	local PlayTZMonth = math.floor(PlayTZMonthDay/100)
	local PlayTZDay = math.mod(PlayTZMonthDay,100)
	if TeamID == 0 then
		if Year ~= PlayTZYear or Month ~= PlayTZMonth or Day ~= PlayTZDay then
			API_VarDataSetNumber(ActorID,1,TiaoZhanID,0)
		end
	elseif TeamID > 0 then
		local TeamNum = API_GetTeamSize(TeamID)
		for i = 1,TeamNum do
			local TeamPlayID = API_GetTeamMem(TeamID,i)
			local TeamPlayTZYMD = API_VarDataGetNumber(TeamPlayID,1,11857)
			local TeamPlayTZYear = math.floor(TeamPlayTZYMD/10000)
			local TeamPlayTZMonthDay = math.mod(TeamPlayTZYMD,10000)
			local TeamPlayTZMonth = math.floor(TeamPlayTZMonthDay/100)
			local TeamPlayTZDay = math.mod(TeamPlayTZMonthDay,100)
			if Year ~= TeamPlayTZYear or Month ~= TeamPlayTZMonth or Day ~= TeamPlayTZDay then
				API_VarDataSetNumber(TeamPlayID,1,TiaoZhanID,0)
			end
		end
	end
	if MapConfigID == 1987 or MapConfigID == 1988 then
		--判断是否挑战成功
		if ShiFouChengGong == 0 then
			if SelectItem == 2 then
				if MapConfigID == 1987 then
					API_ActorGoToMap(ActorID,128,280,260)
				elseif MapConfigID == 1988 then
					API_ActorGoToMap(ActorID,129,163,383)
				end
			else
				API_ResponseWrite('<text color="255,0,255">您想放弃挑战并传送出密室吗?</text><br>')
				API_ResponseWrite('<br><br><a href="Mirror_TiaoZhanNPC_Title?1=2">放弃挑战并传送出去</a>')
				API_ResponseWrite('<text>            </text>')
				API_ResponseWrite('<a>继续挑战</a>')
			end
		elseif ShiFouChengGong > 0 then
			if PlayLQNum < LQCiShu then
				if API_ActorGetGoodsNum(ActorID, JYSPID) >= JYSPNum then
					if SelectItem == 3 then
						if API_ActorRemoveGoods(ActorID, JYSPID, JYSPNum, '挑战成功兑换奖励扣除镜月碎片') then
							API_VarDataSetNumber(ActorID,1,11852,YMD)
							API_VarDataSetNumber(ActorID,1,PlayLQID,PlayLQNum+1)
							local PlayLQNum2 = API_VarDataGetNumber(ActorID,1,PlayLQID)
							if PlayLQNum2 == PlayLQNum + 1 then
								API_ActorAddExp(ActorID, JingYan2, 0, '挑战成功领取奖励')
								if ChongWuLV ~= -1 then
									if ChongWuLV >= 0 and ChongWuLV <= 10 then
										API_ActorAddPetExp(ActorID,TZCWJY1,0,'挑战成功兑换宠物经验1')
									elseif ChongWuLV >= 11 and ChongWuLV <= 25 then
										API_ActorAddPetExp(ActorID,TZCWJY2,0,'挑战成功兑换宠物经验2')
									elseif ChongWuLV >= 26 and ChongWuLV <= 40 then
										API_ActorAddPetExp(ActorID,TZCWJY3,0,'挑战成功兑换宠物经验3')
									elseif ChongWuLV >= 41 and ChongWuLV <= 55 then
										API_ActorAddPetExp(ActorID,TZCWJY3,0,'挑战成功兑换宠物经验3')
									elseif ChongWuLV >= 56 and ChongWuLV <= 65 then
										API_ActorAddPetExp(ActorID,TZCWJY3,0,'挑战成功兑换宠物经验3')
									end
								end
								API_VarDataSetNumber(ActorID,1,ChengGong,0)--领取奖励后挑战成功交互数据设为0
								API_ActorSendMsg(ActorID,0,'领取奖励成功，恭喜你获得'..JingYan2..'经验值')
								if MapConfigID == 1987 then
									API_ActorGoToMap(ActorID,128,280,260)
								elseif MapConfigID == 1988 then
									API_ActorGoToMap(ActorID,129,163,383)
								end
							end
						end
					else
						API_ResponseWrite('<text color="255,0,255">恭喜您挑战成功!</text><br>')
						API_ResponseWrite('<br><text>领取奖励将获得：</text>')
						API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  × '..JingYan2..'</text><br>')
						API_ResponseWrite('<br><br><a href="Mirror_TiaoZhanNPC_Title?1=3">领取奖励并传送出去</a>')
					end
						
				else
					if SelectItem == 4 then
						if MapConfigID == 1987 then
							API_ActorGoToMap(ActorID,128,280,260)
						elseif MapConfigID == 1988 then
							API_ActorGoToMap(ActorID,129,163,383)
						end
					else
						API_ResponseWrite('<text>你身上的</text><text color="255,0,255">'..API_GetGoodsName(JYSPID)..'</text><text>不足，需要</text><text color="255,0,255">'..JYSPNum..'个</text><text>才能领奖。</text><br>')
						API_ResponseWrite('<br><br><a href="Mirror_TiaoZhanNPC_Title?1=4">传送出去</a>')
					end
				end
			else
				if SelectItem == 5 then
					if MapConfigID == 1987 then
						API_ActorGoToMap(ActorID,128,280,260)
					elseif MapConfigID == 1988 then
						API_ActorGoToMap(ActorID,129,163,383)
					end
				else
					API_ResponseWrite('<text>你今天已经领取了</text><text color="255,0,255">'..LQCiShu..'次</text><text>奖励，请明天再来吧。</text><br>')
					API_ResponseWrite('<br><br><a href="Mirror_TiaoZhanNPC_Title?1=5">传送出去</a>')
				end
			end
		end
	else
		local NeedLv = JYTable.NeedLv
		local BossID = JYTable.BossID
		local JinRuCiShu = JYTable.CiShu
		local JYBossTable = Mirror_TiaoZhanBoss_Table[BossID]
		local BossFastID = JYBossTable.BossFastID
		local TiaoZhanMapID = JYBossTable.MapID
		local JRMSQMapID = JYBossTable.JRMSQMapID--JRMSQMapID:进入密室前MapID
		local X2 = JYBossTable.X2
		local Y2 = JYBossTable.Y2
		local X = JYBossTable.X
		local Y = JYBossTable.Y
		if SelectItem == 1 then
			if PlayLQNum < LQCiShu then
				local TeamID = API_GetTeamID(ActorID)
				if TeamID > 0 then
					local TeamNum = API_GetTeamSize(TeamID)
					for i = 1,TeamNum do
						local TeamPlayID = API_GetTeamMem(TeamID,i)
						local TeamPlayName = API_GetActorName(TeamPlayID)
						local MapID = 0
						if API_ActorIsOnline(TeamPlayID) then
							MapID = API_GetActorMapID(TeamPlayID)
						end
						local MapConfigID = API_GetMapConfigID(MapID)
						if not API_ActorIsOnline(TeamPlayID) then
							local TeamNum2 = API_GetTeamSize(TeamID)
							for j = 1,TeamNum2 do
								local TeamPlayID2 = API_GetTeamMem(TeamID,j)
								if API_ActorIsOnline(TeamPlayID2) then
									if API_GetMapConfigID(API_GetActorMapID(TeamPlayID2)) == JRMSQMapID then
										API_ResponseWrite('<text color="255,0,255">队伍中有玩家不在线或者不在本地图内</text><text>，无法进入密室挑战。</text><br>')
										API_ResponseWrite('<br><br><a>确定</a><br>')
										API_ResponseFlush(TeamPlayID2)
									end
								end
							end
							return
						end
						if API_GetActorExpLevel(TeamPlayID) < NeedLv then
							local TeamNum2 = API_GetTeamSize(TeamID)
							for j = 1,TeamNum2 do
								local TeamPlayID2 = API_GetTeamMem(TeamID,j)
								if API_ActorIsOnline(TeamPlayID2) then
									if API_GetMapConfigID(API_GetActorMapID(TeamPlayID2)) == JRMSQMapID then
										API_ResponseWrite('<text color="255,0,255">'..TeamPlayName..'</text><text>等级太低，无法进入密室挑战。</text><br>')
										API_ResponseWrite('<br><br><a>确定</a><br>')
										API_ResponseFlush(TeamPlayID2)
									end
								end
							end
							return
						end
						if API_ActorIsDying(TeamPlayID) then
							local TeamNum2 = API_GetTeamSize(TeamID)
							for j = 1,TeamNum2 do
								local TeamPlayID2 = API_GetTeamMem(TeamID,j)
								if API_ActorIsOnline(TeamPlayID2) then
									if API_GetMapConfigID(API_GetActorMapID(TeamPlayID2)) == JRMSQMapID then
										API_ResponseWrite('<text color="255,0,255">'..TeamPlayName..'</text><text>已经死亡，无法进入密室挑战。</text><br>')
										API_ResponseWrite('<br><br><a>确定</a><br>')
										API_ResponseFlush(TeamPlayID2)
									end
								end
							end
							return
						end
						if MapConfigID ~= JRMSQMapID then
							local TeamNum2 = API_GetTeamSize(TeamID)
							for j = 1,TeamNum2 do
								local TeamPlayID2 = API_GetTeamMem(TeamID,j)
								if API_ActorIsOnline(TeamPlayID2) then
									if API_GetMapConfigID(API_GetActorMapID(TeamPlayID2)) == JRMSQMapID then
										API_ResponseWrite('<text color="255,0,255">'..TeamPlayName..'</text><text>不在本地图内，无法进入密室挑战。</text><br>')
										API_ResponseWrite('<br><br><a>确定</a><br>')
										API_ResponseFlush(TeamPlayID2)
									end
								end
							end
							return
						end
						if API_ActorGetGoodsNum(TeamPlayID, JYSPID) < JYSPNum then
							local TeamNum2 = API_GetTeamSize(TeamID)
							for j = 1,TeamNum2 do
								local TeamPlayID2 = API_GetTeamMem(TeamID,j)
								if API_ActorIsOnline(TeamPlayID2) then
									if API_GetMapConfigID(API_GetActorMapID(TeamPlayID2)) == JRMSQMapID then
										API_ResponseWrite('<text color="255,0,255">'..TeamPlayName..'</text><text>身上没有足够的</text><text color="255,0,255">'..API_GetGoodsName(JYSPID)..'</text><text>，无法进入密室挑战。</text><br>')
										API_ResponseWrite('<br><br><a>确定</a><br>')
										API_ResponseFlush(TeamPlayID2)
									end
								end
							end
							return
						end
						local TeamPlayTZNum = API_VarDataGetNumber(TeamPlayID,1,TiaoZhanID)--存储玩家在一层挑战的次数
						if TeamPlayTZNum >= JinRuCiShu then
							local TeamNum2 = API_GetTeamSize(TeamID)
							for j = 1,TeamNum2 do
								local TeamPlayID2 = API_GetTeamMem(TeamID,j)
								if API_ActorIsOnline(TeamPlayID2) then
									if API_GetMapConfigID(API_GetActorMapID(TeamPlayID2)) == JRMSQMapID then
										API_ResponseWrite('<text color="255,0,255">'..TeamPlayName..'</text><text>今天已经进入了</text><text color="255,0,255">'..JinRuCiShu..'次</text><text>挑战密室，请确定满足条件后再来挑战BOSS吧。</text><br>')
										API_ResponseWrite('<br><br><a>确定</a><br>')
										API_ResponseFlush(TeamPlayID2)
									end
								end
							end
							return
						end
					end
					local StaticMapID = API_GetRightMapID(TiaoZhanMapID)
					local MapDTID = API_CreateEctype(StaticMapID,0)--MapDTID:动态地图ID
					local FastID = API_CreateMonster(MapDTID,BossID,X,Y,4,0,-1)
					API_CreateDieTriggerG(0,0,0,FastID,'Mirror_MonsterCorner_DieTriggerGCallFunc')
					--根据配置地图ID创建NPC,XY坐标
					local MapConfigID = API_GetMapConfigID(MapDTID)
					if MapConfigID == 1987 then
						API_CreateMonsterEx(MapDTID,12293,91,69,5,0,-1,1)
					elseif 	MapConfigID == 1988 then
						API_CreateMonsterEx(MapDTID,12294,49,38,3,0,-1,1)
					end
					for k = 1,TeamNum do
						local TeamPlayID = API_GetTeamMem(TeamID,k)
						local TeamPlayTZNum = API_VarDataGetNumber(TeamPlayID,1,TiaoZhanID)
						API_VarDataSetNumber(TeamPlayID,1,TiaoZhanID,TeamPlayTZNum+1)
						API_VarDataSetNumber(TeamPlayID,1,11857,YMD)
						local TeamPlayTZNum2 = API_VarDataGetNumber(TeamPlayID,1,TiaoZhanID)
						if TeamPlayTZNum2 == TeamPlayTZNum + 1 then
							API_ActorGoToMap(TeamPlayID,MapDTID,X2,Y2)
						end
						local TeamPlayLQNum = API_VarDataGetNumber(TeamPlayID,1,PlayLQID)
						if TeamPlayLQNum >= LQCiShu then
							API_ResponseWrite('<text>你今天已经领取了</text><text color="255,0,255">2次</text><text>奖励，即使挑战成功也</text><text color="255,0,255">不能领取奖励</text><text>。</text><br>')
							API_ResponseWrite('<text>你可以选择继续挑战BOSS或者点击密室挑战官传送出去。</text><br>')
							API_ResponseWrite('<br><br><a>我知道了</a><br>')
							API_ResponseFlush(TeamPlayID)
						end
					end
				elseif TeamID == 0 then --单个玩家的操作
					if API_GetActorExpLevel(ActorID) >= NeedLv then
						if PlayTZNum < JinRuCiShu then
							if API_ActorGetGoodsNum(ActorID, JYSPID) >= JYSPNum then
								API_VarDataSetNumber(ActorID,1,TiaoZhanID,PlayTZNum+1)
								API_VarDataSetNumber(ActorID,1,11857,YMD)
								local PlayTZNum2 = API_VarDataGetNumber(ActorID,1,TiaoZhanID)
								if PlayTZNum2 == PlayTZNum + 1 then
									local StaticMapID = API_GetRightMapID(TiaoZhanMapID) 
									local MapDTID = API_CreateEctype(StaticMapID,0)
									local FastID = API_CreateMonster(MapDTID,BossID,X,Y,4,0,-1)
									API_CreateDieTriggerG(0,0,0,FastID,'Mirror_MonsterCorner_DieTriggerGCallFunc')
									local MapConfigID = API_GetMapConfigID(MapDTID)
									if MapConfigID == 1987 then
										API_CreateMonsterEx(MapDTID,12293,91,69,5,0,-1,1)
									elseif 	MapConfigID == 1988 then
										API_CreateMonsterEx(MapDTID,12294,49,38,3,0,-1,1)
									end
									API_ActorGoToMap(ActorID,MapDTID,X2,Y2)
								end
							else
								API_ResponseWrite('<text>您身上没有足够的</text><text color="255,0,255">'..API_GetGoodsName(JYSPID)..'</text><text>，无法进入密室挑战。</text><br>')
								API_ResponseWrite('<br><br><a>确定</a><br>')
							end
						else
							API_ResponseWrite('<text>你今天已经进入了</text><text color="255,0,255">'..JinRuCiShu..'次</text><text>挑战密室，明天再来挑战BOSS吧。</text><br>')
							API_ResponseWrite('<br><br><a>确定</a><br>')
						end
					else
						API_ResponseWrite('<text>您的</text><text color="255,0,255">等级太低</text><text>，无法进入密室挑战。</text><br>')
						API_ResponseWrite('<br><br><a>确定</a><br>')
					end
				end
			else	
				API_ResponseWrite('<text>您今天已经领取过</text><text color="255,0,255">'..LQCiShu..'次</text><text>奖励了，进入密室挑战BOSS成功后将</text><text color="255,0,255">不能领取奖励</text><text>，需要挑战BOSS吗？</text><br>')
				API_ResponseWrite('<br><br><a href="Mirror_TiaoZhanNPC_Title?1=2">挑战BOSS</a>')
				API_ResponseWrite('<text>          </text>')
				API_ResponseWrite('<a>取消</a>')
			end
		elseif SelectItem == 2 then
			local TeamID = API_GetTeamID(ActorID)
			if TeamID > 0 then
				local TeamNum = API_GetTeamSize(TeamID)
				for i = 1,TeamNum do
					local TeamPlayID = API_GetTeamMem(TeamID,i)
					local TeamPlayName = API_GetActorName(TeamPlayID)
					local MapID = 0
					if API_ActorIsOnline(TeamPlayID) then
						MapID = API_GetActorMapID(TeamPlayID)
					end
					local MapConfigID = API_GetMapConfigID(MapID)
					if not API_ActorIsOnline(TeamPlayID) then
						local TeamNum2 = API_GetTeamSize(TeamID)
						for j = 1,TeamNum2 do
							local TeamPlayID2 = API_GetTeamMem(TeamID,j)
							if API_ActorIsOnline(TeamPlayID2) then
								if API_GetMapConfigID(API_GetActorMapID(TeamPlayID2)) == JRMSQMapID then
									API_ResponseWrite('<text color="255,0,255">队伍中有玩家不在线或者不在本地图内</text><text>，无法进入密室挑战。</text><br>')
									API_ResponseWrite('<br><br><a>确定</a><br>')
									API_ResponseFlush(TeamPlayID2)
								end
							end
						end
						return
					end
					if API_GetActorExpLevel(TeamPlayID) < NeedLv then
						local TeamNum2 = API_GetTeamSize(TeamID)
						for j = 1,TeamNum2 do
							local TeamPlayID2 = API_GetTeamMem(TeamID,j)
							if API_ActorIsOnline(TeamPlayID2) then
								if API_GetMapConfigID(API_GetActorMapID(TeamPlayID2)) == JRMSQMapID then
									API_ResponseWrite('<text color="255,0,255">'..TeamPlayName..'</text><text>等级太低，无法进入密室挑战。</text><br>')
									API_ResponseWrite('<br><br><a>确定</a><br>')
									API_ResponseFlush(TeamPlayID2)
								end
							end
						end
						return
					end
					if API_ActorIsDying(TeamPlayID) then
						local TeamNum2 = API_GetTeamSize(TeamID)
						for j = 1,TeamNum2 do
							local TeamPlayID2 = API_GetTeamMem(TeamID,j)
							if API_ActorIsOnline(TeamPlayID2) then
								if API_GetMapConfigID(API_GetActorMapID(TeamPlayID2)) == JRMSQMapID then
									API_ResponseWrite('<text color="255,0,255">'..TeamPlayName..'</text><text>已经死亡，无法进入密室挑战。</text><br>')
									API_ResponseWrite('<br><br><a>确定</a><br>')
									API_ResponseFlush(TeamPlayID2)
								end
							end
						end
						return
					end
					if MapConfigID ~= JRMSQMapID then
						local TeamNum2 = API_GetTeamSize(TeamID)
						for j = 1,TeamNum2 do
							local TeamPlayID2 = API_GetTeamMem(TeamID,j)
							if API_ActorIsOnline(TeamPlayID2) then
								if API_GetMapConfigID(API_GetActorMapID(TeamPlayID2)) == JRMSQMapID then
									API_ResponseWrite('<text color="255,0,255">'..TeamPlayName..'</text><text>不在本地图内，无法进入密室挑战。</text><br>')
									API_ResponseWrite('<br><br><a>确定</a><br>')
									API_ResponseFlush(TeamPlayID2)
								end
							end
						end
						return
					end
					if API_ActorGetGoodsNum(TeamPlayID, JYSPID) < JYSPNum then
						local TeamNum2 = API_GetTeamSize(TeamID)
						for j = 1,TeamNum2 do
							local TeamPlayID2 = API_GetTeamMem(TeamID,j)
							if API_ActorIsOnline(TeamPlayID2) then
								if API_GetMapConfigID(API_GetActorMapID(TeamPlayID2)) == JRMSQMapID then
									API_ResponseWrite('<text color="255,0,255">'..TeamPlayName..'</text><text>身上没有足够的</text><text color="255,0,255">'..API_GetGoodsName(JYSPID)..'</text><text>，无法进入密室挑战。</text><br>')
									API_ResponseWrite('<br><br><a>确定</a><br>')
									API_ResponseFlush(TeamPlayID2)
								end
							end
						end
						return
					end
					local TeamPlayTZNum = API_VarDataGetNumber(TeamPlayID,1,TiaoZhanID)--存储玩家在一层挑战的次数
					if TeamPlayTZNum >= JinRuCiShu then
						local TeamNum2 = API_GetTeamSize(TeamID)
						for j = 1,TeamNum2 do
							local TeamPlayID2 = API_GetTeamMem(TeamID,j)
							if API_ActorIsOnline(TeamPlayID2) then
								if API_GetMapConfigID(API_GetActorMapID(TeamPlayID2)) == JRMSQMapID then
									API_ResponseWrite('<text color="255,0,255">'..TeamPlayName..'</text><text>今天已经进入了</text><text color="255,0,255">'..JinRuCiShu..'次</text><text>挑战密室，请确定满足条件后再来挑战BOSS吧。</text><br>')
									API_ResponseWrite('<br><br><a>确定</a><br>')
									API_ResponseFlush(TeamPlayID2)
								end
							end
						end
						return
					end
				end
				local StaticMapID = API_GetRightMapID(TiaoZhanMapID) 
				local MapDTID = API_CreateEctype(StaticMapID,0)
				local FastID = API_CreateMonster(MapDTID,BossID,X,Y,4,0,-1)
				API_CreateDieTriggerG(0,0,0,FastID,'Mirror_MonsterCorner_DieTriggerGCallFunc')
				--根据配置地图ID创建NPC,XY坐标
				local MapConfigID = API_GetMapConfigID(MapDTID)
				if MapConfigID == 1987 then
					API_CreateMonsterEx(MapDTID,12293,91,69,5,0,-1,1)
				elseif 	MapConfigID == 1988 then
					API_CreateMonsterEx(MapDTID,12294,49,38,3,0,-1,1)
				end
				for p = 1,TeamNum do
					local TeamPlayID = API_GetTeamMem(TeamID,p)
					local TeamPlayTZNum = API_VarDataGetNumber(TeamPlayID,1,TiaoZhanID)
					API_VarDataSetNumber(TeamPlayID,1,TiaoZhanID,TeamPlayTZNum+1)
					API_VarDataSetNumber(TeamPlayID,1,11857,YMD)
					local TeamPlayTZNum2 = API_VarDataGetNumber(TeamPlayID,1,TiaoZhanID)
					if TeamPlayTZNum2 == TeamPlayTZNum + 1 then
						API_ActorGoToMap(TeamPlayID,MapDTID,X2,Y2)
					end
					local TeamPlayLQNum = API_VarDataGetNumber(TeamPlayID,1,PlayLQID)
					if TeamPlayLQNum >= LQCiShu then
						API_ResponseWrite('<text>你今天已经领取了</text><text color="255,0,255">2次</text><text>奖励，即使挑战成功也</text><text color="255,0,255">不能领取奖励</text><text>。</text><br>')
						API_ResponseWrite('<text>你可以选择继续挑战BOSS或者点击密室挑战官传送出去。</text><br>')
						API_ResponseWrite('<br><br><a>我知道了</a><br>')
						API_ResponseFlush(TeamPlayID)
					end
				end
			elseif TeamID == 0 then --单个玩家的操作
				if API_GetActorExpLevel(ActorID) >= NeedLv then
					if PlayTZNum < JinRuCiShu then
						if API_ActorGetGoodsNum(ActorID, JYSPID) >= JYSPNum then
							API_VarDataSetNumber(ActorID,1,TiaoZhanID,PlayTZNum+1)
							API_VarDataSetNumber(ActorID,1,11857,YMD)
							local PlayTZNum2 = API_VarDataGetNumber(ActorID,1,TiaoZhanID)
							if PlayTZNum2 == PlayTZNum + 1 then
								local StaticMapID = API_GetRightMapID(TiaoZhanMapID) 
								local MapDTID = API_CreateEctype(StaticMapID,0)
								local FastID = API_CreateMonster(MapDTID,BossID,X,Y,4,0,-1)
								API_CreateDieTriggerG(0,0,0,FastID,'Mirror_MonsterCorner_DieTriggerGCallFunc')
								local MapConfigID = API_GetMapConfigID(MapDTID)
								if MapConfigID == 1987 then
									API_CreateMonsterEx(MapDTID,12293,91,69,5,0,-1,1)
								elseif 	MapConfigID == 1988 then
									API_CreateMonsterEx(MapDTID,12294,49,38,3,0,-1,1)
								end
								API_ActorGoToMap(ActorID,MapDTID,X2,Y2)
							end
						else
							API_ResponseWrite('<text>您身上没有足够的</text><text color="255,0,255">'..API_GetGoodsName(JYSPID)..'</text><text>，无法进入密室挑战。</text><br>')
							API_ResponseWrite('<br><br><a>确定</a><br>')
						end
					else
						API_ResponseWrite('<text>你今天已经进入了</text><text color="255,0,255">'..JinRuCiShu..'次</text><text>挑战密室，明天再来挑战BOSS吧。</text><br>')
						API_ResponseWrite('<br><br><a>确定</a><br>')
					end
				else
					API_ResponseWrite('<text>您的</text><text color="255,0,255">等级太低</text><text>，无法进入密室挑战。</text><br>')
					API_ResponseWrite('<br><br><a>确定</a><br>')
				end
			end
		else
			API_ResponseWrite('<text>您想进入密室挑战BOSS吗？挑战BOSS需要等级达到</text><text color="255,0,255">'..NeedLv..'级</text><text>以上。</text><br>')
			API_ResponseWrite('<text>同时您的背包中必须要拥有</text><text color="255,0,255">'..JYSPNum..'个'..API_GetGoodsName(JYSPID)..'</text><text>才能进入此挑战密室。</text><br>')
			API_ResponseWrite('<br><br><a href="Mirror_TiaoZhanNPC_Title?1=1">挑战BOSS</a>')
			API_ResponseWrite('<text>         </text>')
			API_ResponseWrite('<a>取消</a>')
		end
	end
end

function Mirror_PKTrigger(ActorID,KilledID,MapID,MapConfigID)
	local JYSPID = 80690
	local JYSPName = API_GetGoodsName(JYSPID)
	local JYSPNum = API_ActorGetGoodsNum(KilledID,JYSPID)
	local ActorName = API_GetActorName(ActorID)
	local KilledName = API_GetActorName(KilledID)
	local KilledX,KilledY = PublicFun_GetActorPosXY(KilledID)
	local CampID = API_GetActorCamp(ActorID)
	local CampName = GLOBAL_CampName[CampID]
	if JYSPNum > 0 then
	--掉落数量，地图通告
		local DropGoodsNum = JYSPNum * 0.2
		local DropGoodsNum2 = math.floor(DropGoodsNum/1)
		local DropGoodsNum3 = math.mod(DropGoodsNum2,1)
		local DropGoodsNum4 = DropGoodsNum3 * 10
		if DropGoodsNum4 > 5 then
			DropGoodsNum2 = DropGoodsNum2 + 1
		end
		if DropGoodsNum2 > 0 then
			API_ActorRemoveGoods(KilledID,JYSPID,DropGoodsNum2,'挂机地表被玩家杀')
			API_CreateDropGoods(MapID,KilledX,KilledY,JYSPID,DropGoodsNum2,4,'被敌对玩家杀死',4,0,120,1)
			API_ActorSendMsg(ActorID,8,'您杀死了'..KilledName..',使他掉落了'..DropGoodsNum2..'个'..JYSPName..'。')
			API_ActorSendMsg(KilledID,8,'您被'..ActorName..'杀死了，被夺走'..DropGoodsNum2..'个'..JYSPName..'。')
			API_ActorBroadcastMsgEx(MapID,-1,0,1,''..CampName..'的 '..ActorName..' 杀死了 '..KilledName..',夺得'..DropGoodsNum2..'个'..JYSPName..'。')
		else
			API_ActorSendMsg(ActorID,8,'您杀死了'..KilledName..'。')
			API_ActorSendMsg(KilledID,8,'您被'..ActorName..'杀死了。')
			API_ActorBroadcastMsgEx(MapID,-1,0,1,''..CampName..'的 '..ActorName..' 杀死了 '..KilledName..'。')
		end
	else
		API_ActorSendMsg(ActorID,8,'您杀死了'..KilledName..'。')
		API_ActorSendMsg(KilledID,8,'您被'..ActorName..'杀死了。')
		API_ActorBroadcastMsgEx(MapID,-1,0,1,''..CampName..'的 '..ActorName..' 杀死了 '..KilledName..'。')
	end
end
