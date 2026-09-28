--公测活动
TML_BaiNianTie1 = 88871	--拜年银帖
TML_BaiNianTie2 = 88872	--拜年金帖
TML_BaiNianTie3 = 88873	--拜年白金帖
TML_BaiNianTie4 = 88874	--拜年金钻帖
TML_GongCeHuoDong_BaoXiang = 12241	--宝箱物品ID
TML_GongCeHuoDong_YanHua = 88870	--怪物掉落的烟花
TML_GongCeHuoDong_NPC = 12240	--新春幸运大使ID
TML_GongCeHuoDong_XueQiu = 88875	--雪球ID
TML_GongCeHuoDong_MonsterID = 726454 --宝箱开出的怪物ID
ShengDanHuoDong_PT_XueQiu = 89121 --雪球[普通]
ShengDanHuoDong_JZ_XueQiu = 89122 --雪球[精致]
ShengDanHuoDong_WM_XueQiu = 89123 --雪球[完美]
ShengDanHuoDong_XueRenBossID = 731217 --雪人BOSS
--11836 存储玩家领取新年礼物的时间
--11841 存储玩家今天是否领取过新年礼物
--11837 存储玩家被雪球砸的次数
--11838 存储玩家今天是否领取过雪球
--11840 存储玩家领取雪球的时间
--每个地图的宝箱
if GongCeHuoDong_ActBaoXiang == nil then
	GongCeHuoDong_ActBaoXiang = {}
end

--活动时间
GongCeHuoDong_ActTime = {
	StartYear=2010,StartMonth=1,StartDay=29,EndYear=2010,EndMonth=2,EndDay=28,
	RedayTime=12,StartTime=13,EndTime=14,
}

--活动地图表
GongCeHuoDong_ACTMapTable = {
	[10] = {BaoXiangID=12241,BaoXiangNum=600,x1=80,y1=140,x2=410,y2=430,x3=111,y3=291,x4=154,y4=344,},--珊瑚群岛(X1,Y1,X2,Y2大地图坐标点，X3,Y3,X4,Y4村庄坐标点)
	[23] = {BaoXiangID=12241,BaoXiangNum=600,x1=80,y1=100,x2=410,y2=410,x3=107,y3=307,x4=160,y4=349,},--阳光雨林
}

GongCeHuoDong_JingYanAndSJB_Table = {
	[1] = {EXPDuiHuanQuan=6,SJBDuiHuanQuan=3},
	[2] = {EXPDuiHuanQuan=12,SJBDuiHuanQuan=6},
	[3] = {EXPDuiHuanQuan=18,SJBDuiHuanQuan=9},
	[4] = {EXPDuiHuanQuan=24,SJBDuiHuanQuan=12},
	[5] = {EXPDuiHuanQuan=30,SJBDuiHuanQuan=15},
	[6] = {EXPDuiHuanQuan=36,SJBDuiHuanQuan=18},
	[7] = {EXPDuiHuanQuan=42,SJBDuiHuanQuan=21},
	[8] = {EXPDuiHuanQuan=48,SJBDuiHuanQuan=24},
	[9] = {EXPDuiHuanQuan=54,SJBDuiHuanQuan=27},
	[10] = {EXPDuiHuanQuan=60,SJBDuiHuanQuan=30},
	[11] = {EXPDuiHuanQuan=66,SJBDuiHuanQuan=33},
	[12] = {EXPDuiHuanQuan=72,SJBDuiHuanQuan=36},
	[13] = {EXPDuiHuanQuan=78,SJBDuiHuanQuan=39},
	[14] = {EXPDuiHuanQuan=84,SJBDuiHuanQuan=42},
	[15] = {EXPDuiHuanQuan=90,SJBDuiHuanQuan=45},
	[16] = {EXPDuiHuanQuan=96,SJBDuiHuanQuan=48},
	[17] = {EXPDuiHuanQuan=102,SJBDuiHuanQuan=51},
	[18] = {EXPDuiHuanQuan=108,SJBDuiHuanQuan=54},
	[19] = {EXPDuiHuanQuan=114,SJBDuiHuanQuan=57},
	[20] = {EXPDuiHuanQuan=120,SJBDuiHuanQuan=60},
	[21] = {EXPDuiHuanQuan=126,SJBDuiHuanQuan=63},
	[22] = {EXPDuiHuanQuan=132,SJBDuiHuanQuan=66},
	[23] = {EXPDuiHuanQuan=138,SJBDuiHuanQuan=69},
	[24] = {EXPDuiHuanQuan=144,SJBDuiHuanQuan=72},
	[25] = {EXPDuiHuanQuan=150,SJBDuiHuanQuan=75},
	[26] = {EXPDuiHuanQuan=156,SJBDuiHuanQuan=78},
	[27] = {EXPDuiHuanQuan=162,SJBDuiHuanQuan=81},
	[28] = {EXPDuiHuanQuan=168,SJBDuiHuanQuan=84},
	[29] = {EXPDuiHuanQuan=174,SJBDuiHuanQuan=87},
	[30] = {EXPDuiHuanQuan=180,SJBDuiHuanQuan=90},
	[31] = {EXPDuiHuanQuan=186,SJBDuiHuanQuan=93},
	[32] = {EXPDuiHuanQuan=192,SJBDuiHuanQuan=96},
	[33] = {EXPDuiHuanQuan=198,SJBDuiHuanQuan=99},
	[34] = {EXPDuiHuanQuan=204,SJBDuiHuanQuan=102},
	[35] = {EXPDuiHuanQuan=210,SJBDuiHuanQuan=105},
	[36] = {EXPDuiHuanQuan=216,SJBDuiHuanQuan=108},
	[37] = {EXPDuiHuanQuan=222,SJBDuiHuanQuan=111},
	[38] = {EXPDuiHuanQuan=228,SJBDuiHuanQuan=114},
	[39] = {EXPDuiHuanQuan=234,SJBDuiHuanQuan=117},
	[40] = {EXPDuiHuanQuan=240,SJBDuiHuanQuan=120},
	[41] = {EXPDuiHuanQuan=246,SJBDuiHuanQuan=123},
	[42] = {EXPDuiHuanQuan=252,SJBDuiHuanQuan=126},
	[43] = {EXPDuiHuanQuan=258,SJBDuiHuanQuan=129},
	[44] = {EXPDuiHuanQuan=264,SJBDuiHuanQuan=132},
	[45] = {EXPDuiHuanQuan=270,SJBDuiHuanQuan=135},
	[46] = {EXPDuiHuanQuan=276,SJBDuiHuanQuan=138},
	[47] = {EXPDuiHuanQuan=282,SJBDuiHuanQuan=141},
	[48] = {EXPDuiHuanQuan=288,SJBDuiHuanQuan=144},
	[49] = {EXPDuiHuanQuan=294,SJBDuiHuanQuan=147},
	[50] = {EXPDuiHuanQuan=300,SJBDuiHuanQuan=150},
	[51] = {EXPDuiHuanQuan=306,SJBDuiHuanQuan=153},
	[52] = {EXPDuiHuanQuan=312,SJBDuiHuanQuan=156},
	[53] = {EXPDuiHuanQuan=318,SJBDuiHuanQuan=159},
	[54] = {EXPDuiHuanQuan=324,SJBDuiHuanQuan=162},
	[55] = {EXPDuiHuanQuan=330,SJBDuiHuanQuan=165},
}

function BaiNianTie1_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if (Month == 1 and Day < 29) or Month > 2 then
		API_ActorSendMsg(ActorID,3,'贺岁公测活动已结束，不能再使用拜年帖')
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local HanShuMing = ''
	if GoodsID == TML_BaiNianTie1 then 
		HanShuMing = 'GongCeHuoDong_BaiNian1'
	end
	if HanShuMing ~= '' then
		API_ActorStartSelect(ActorID,HanShuMing,15)
		API_ActorSendMsg(ActorID,3,'请点击您要拜年的对象')
		return 1
	else
		return 0
	end
end

function BaiNianTie2_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if (Month == 1 and Day < 29) or Month > 2 then
		API_ActorSendMsg(ActorID,3,'贺岁公测活动已结束，不能再使用拜年帖')
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local HanShuMing = ''
	if GoodsID == TML_BaiNianTie2 then 
		HanShuMing = 'GongCeHuoDong_BaiNian2'
	end
	if HanShuMing ~= '' then
		API_ActorStartSelect(ActorID,HanShuMing,15)
		API_ActorSendMsg(ActorID,3,'请点击您要拜年的对象')
		return 1
	else
		return 0
	end
end

function BaiNianTie3_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if (Month == 1 and Day < 29) or Month > 2 then
		API_ActorSendMsg(ActorID,3,'贺岁公测活动已结束，不能再使用拜年帖')
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local HanShuMing = ''
	if GoodsID == TML_BaiNianTie3 then 
		HanShuMing = 'GongCeHuoDong_BaiNian3'
	end
	if HanShuMing ~= '' then
		API_ActorStartSelect(ActorID,HanShuMing,15)
		API_ActorSendMsg(ActorID,3,'请点击您要拜年的对象')
		return 1
	else
		return 0
	end
end

function BaiNianTie4_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if (Month == 1 and Day < 29) or Month > 2 then
		API_ActorSendMsg(ActorID,3,'贺岁公测活动已结束，不能再使用拜年帖')
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local HanShuMing = ''
	if GoodsID == TML_BaiNianTie4 then 
		HanShuMing = 'GongCeHuoDong_BaiNian4'
	end
	if HanShuMing ~= '' then
		API_ActorStartSelect(ActorID,HanShuMing,15)
		API_ActorSendMsg(ActorID,3,'请点击您要拜年的对象')
		return 1
	else
		return 0
	end
end

function GongCeHuoDong_BaiNian1()
	local ActorID = API_RequestGetNumber(1)
	local SelectType = API_RequestGetNumber(2)
	local OtherID = API_RequestGetNumber(3)
	local GoodsID = TML_BaiNianTie1
	local ActorName = API_GetActorName(ActorID)
	local OtherName = API_RequestGetNumber(OtherID)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_VarDataGetNumber(OtherID,0,19012) ~= 0 then
		API_ActorSendMsg(ActorID,3,'你要拜年的对象正在忙碌中，请稍候再试')
		return 0
	end
	if SelectType == 0 then
		API_ActorSendMsg(ActorID,2,'请点击您要拜年的对象')
		API_ActorStartSelect(ActorID,'GongCeHuoDong_BaiNian1',15)
	elseif SelectType == 1 then
		API_ActorSendMsg(ActorID,2,'请点击您要拜年的对象')
		API_ActorStartSelect(ActorID,'GongCeHuoDong_BaiNian1',15)
	elseif SelectType == 2 then
		if OtherID ~= ActorID then
			local PlayCamp = API_GetActorCamp(ActorID)
			local OtherCamp = API_GetActorCamp(OtherID)
			if PlayCamp == OtherCamp then
				local OtherName = API_GetActorName(OtherID)
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win balpha="0" rect="300,400,400,180"></win>')
				API_ResponseWrite('<text>请输入您想向</text><text color="255,0,255">'..OtherName..'</text><text>拜年的话：（最大可输入五十个字）</text><br>')
				API_ResponseWrite('<input type="string" name="3" bFilter="1" size="100" width="350"><br>')
				API_ResponseWrite('<br><a href="GongCeHuoDong_BaiNian_JieShou?1='..OtherID..'&2='..GoodsID..'">拜年</a><br>')
				API_ResponseWrite('<br><a>还是算了</a><br>')
			else
				API_ActorSendMsg(ActorID,2,'不同阵营的玩家是不可以拜年的哦。')
			end
		else
			API_ActorSendMsg(ActorID,2,'不能向自己拜年')
		end
	else 
		API_ActorStartSelect(ActorID,'GongCeHuoDong_BaiNian1',15)
	end
end

function GongCeHuoDong_BaiNian2()
	local ActorID = API_RequestGetNumber(1)
	local SelectType = API_RequestGetNumber(2)
	local OtherID = API_RequestGetNumber(3)
	local GoodsID = TML_BaiNianTie2
	local ActorName = API_GetActorName(ActorID)
	local OtherName = API_RequestGetNumber(OtherID)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_VarDataGetNumber(OtherID,0,19012) ~= 0 then
		API_ActorSendMsg(ActorID,3,'你要拜年的对象正在忙碌中，请稍候再试')
		return 0
	end
	if SelectType == 0 then
		API_ActorSendMsg(ActorID,2,'请点击您要拜年的对象')
		API_ActorStartSelect(ActorID,'GongCeHuoDong_BaiNian2',15)
	elseif SelectType == 1 then
		API_ActorSendMsg(ActorID,2,'请点击您要拜年的对象')
		API_ActorStartSelect(ActorID,'GongCeHuoDong_BaiNian2',15)
	elseif SelectType == 2 then
		if OtherID ~= ActorID then
			local PlayCamp = API_GetActorCamp(ActorID)
			local OtherCamp = API_GetActorCamp(OtherID)
			if PlayCamp == OtherCamp then
				local OtherName = API_GetActorName(OtherID)
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win balpha="0" rect="300,400,400,180"></win>')
				API_ResponseWrite('<text>请输入您想向</text><text color="255,0,255">'..OtherName..'</text><text>拜年的话：（最大可输入五十个字）</text><br>')
				API_ResponseWrite('<input type="string" name="3" bFilter="1" size="100" width="350"><br>')
				API_ResponseWrite('<br><a href="GongCeHuoDong_BaiNian_JieShou?1='..OtherID..'&2='..GoodsID..'">拜年</a><br>')
				API_ResponseWrite('<br><a>还是算了</a><br>')
			else
				API_ActorSendMsg(ActorID,2,'不同阵营的玩家是不可以拜年的哦。')
			end
		else
			API_ActorSendMsg(ActorID,2,'不能向自己拜年')
		end
	else 
		API_ActorStartSelect(ActorID,'GongCeHuoDong_BaiNian2',15)
	end
end

function GongCeHuoDong_BaiNian3()
	local ActorID = API_RequestGetNumber(1)
	local SelectType = API_RequestGetNumber(2)
	local OtherID = API_RequestGetNumber(3)
	local GoodsID = TML_BaiNianTie3
	local ActorName = API_GetActorName(ActorID)
	local OtherName = API_RequestGetNumber(OtherID)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_VarDataGetNumber(OtherID,0,19012) ~= 0 then
		API_ActorSendMsg(ActorID,3,'你要拜年的对象正在忙碌中，请稍候再试')
		return 0
	end
	if SelectType == 0 then
		API_ActorSendMsg(ActorID,2,'请点击您要拜年的对象')
		API_ActorStartSelect(ActorID,'GongCeHuoDong_BaiNian3',15)
	elseif SelectType == 1 then
		API_ActorSendMsg(ActorID,2,'请点击您要拜年的对象')
		API_ActorStartSelect(ActorID,'GongCeHuoDong_BaiNian3',15)
	elseif SelectType == 2 then
		if OtherID ~= ActorID then
			local PlayCamp = API_GetActorCamp(ActorID)
			local OtherCamp = API_GetActorCamp(OtherID)
			if PlayCamp == OtherCamp then
				local OtherName = API_GetActorName(OtherID)
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win balpha="0" rect="300,400,400,180"></win>')
				API_ResponseWrite('<text>请输入您想向</text><text color="255,0,255">'..OtherName..'</text><text>拜年的话：（最大可输入五十个字）</text><br>')
				API_ResponseWrite('<input type="string" name="3" bFilter="1" size="100" width="350"><br>')
				API_ResponseWrite('<br><a href="GongCeHuoDong_BaiNian_JieShou?1='..OtherID..'&2='..GoodsID..'">拜年</a><br>')
				API_ResponseWrite('<br><a>还是算了</a><br>')
			else
				API_ActorSendMsg(ActorID,2,'不同阵营的玩家是不可以拜年的哦。')
			end
		else
			API_ActorSendMsg(ActorID,2,'不能向自己拜年')
		end
	else 
		API_ActorStartSelect(ActorID,'GongCeHuoDong_BaiNian3',15)
	end
end

function GongCeHuoDong_BaiNian4()
	local ActorID = API_RequestGetNumber(1)
	local SelectType = API_RequestGetNumber(2)
	local OtherID = API_RequestGetNumber(3)
	local GoodsID = TML_BaiNianTie4
	local ActorName = API_GetActorName(ActorID)
	local OtherName = API_RequestGetNumber(OtherID)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_VarDataGetNumber(OtherID,0,19012) ~= 0 then
		API_ActorSendMsg(ActorID,3,'你要拜年的对象正在忙碌中，请稍候再试')
		return 0
	end
	if SelectType == 0 then
		API_ActorSendMsg(ActorID,2,'请点击您要拜年的对象')
		API_ActorStartSelect(ActorID,'GongCeHuoDong_BaiNian4',15)
	elseif SelectType == 1 then
		API_ActorSendMsg(ActorID,2,'请点击您要拜年的对象')
		API_ActorStartSelect(ActorID,'GongCeHuoDong_BaiNian4',15)
	elseif SelectType == 2 then
		if OtherID ~= ActorID then
			local PlayCamp = API_GetActorCamp(ActorID)
			local OtherCamp = API_GetActorCamp(OtherID)
			if PlayCamp == OtherCamp then
				local OtherName = API_GetActorName(OtherID)
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win balpha="0" rect="300,400,400,180"></win>')
				API_ResponseWrite('<text>请输入您想向</text><text color="255,0,255">'..OtherName..'</text><text>拜年的话：（最大可输入五十个字）</text><br>')
				API_ResponseWrite('<input type="string" name="3" bFilter="1" size="100" width="350"><br>')
				API_ResponseWrite('<br><a href="GongCeHuoDong_BaiNian_JieShou?1='..OtherID..'&2='..GoodsID..'">拜年</a><br>')
				API_ResponseWrite('<br><a>还是算了</a><br>')
			else
				API_ActorSendMsg(ActorID,2,'不同阵营的玩家是不可以拜年的哦。')
			end
		else
			API_ActorSendMsg(ActorID,2,'不能向自己拜年')
		end
	else 
		API_ActorStartSelect(ActorID,'GongCeHuoDong_BaiNian4',15)
	end
end

function GongCeHuoDong_BaiNian_JieShou()
	local ActorID = API_RequestGetActorID()
	local OtherID = API_RequestGetNumber(1)
	local OtherLV = API_GetActorExpLevel(OtherID)
	local GoodsID = API_RequestGetNumber(2)
	local ZhuFuYu = API_RequestGetString(3)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return
	end
	if API_ActorIsOnline(OtherID) then
		if API_ActorGetGoodsNum(ActorID,GoodsID) >= 1 then
			if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除拜年帖') then
				local ActorName = API_GetActorName(ActorID)
				local OtherName = API_GetActorName(OtherID)
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win ntype="5" close="0" balpha="0" rect="300,380,400,100"></win>')
				API_ResponseWrite('<text color="255,0,255">'..ActorName..'</text><text>向您拜年：'..ZhuFuYu..'</text><br><br>')
				API_ResponseWrite('<a>确定</a>')
				API_ResponseFlush(OtherID)
				local SJBDHQNum = 0
				if GongCeHuoDong_JingYanAndSJB_Table ~= nil then
					if GoodsID == TML_BaiNianTie1 then
						SJBDHQNum = GongCeHuoDong_JingYanAndSJB_Table[OtherLV].SJBDuiHuanQuan
					elseif GoodsID == TML_BaiNianTie2 then
						local XiShu = GongCeHuoDong_JingYanAndSJB_Table[OtherLV].SJBDuiHuanQuan
						SJBDHQNum = XiShu * 2
					elseif GoodsID == TML_BaiNianTie3 then
						local XiShu = GongCeHuoDong_JingYanAndSJB_Table[OtherLV].SJBDuiHuanQuan
						SJBDHQNum = XiShu * 3
					elseif GoodsID == TML_BaiNianTie4 then
						local XiShu = GongCeHuoDong_JingYanAndSJB_Table[OtherLV].SJBDuiHuanQuan
						SJBDHQNum = XiShu * 4
					end
				end
				local AddPackageSize = API_ActorCanAddGoods(OtherID,80696,SJBDHQNum,3,0)
				if AddPackageSize ~= -1 then
					API_AddActorGoodsFlag(OtherID,80696,SJBDHQNum,3,'被拜年获得水晶币兑换券')
				else
					API_SendActorMailEx(OtherID,80696,SJBDHQNum,0,'拜年祝福',''..ActorName..'给你拜年，你获得'..SJBDHQNum..'个水晶币兑换券')
				end
				API_ActorSendMsg(OtherID,3,''..ActorName..'给你拜年，你获得'..SJBDHQNum..'个水晶币兑换券')
				API_ActorSendMsg(ActorID,3,'成功给'..OtherName..'拜年')
			end
		else
			API_ActorSendMsg(ActorID,3,'您的背包内没有该道具，无法拜年。')
		end
	else
		API_ResponseWrite('<br><text>对象不在线，无法拜年。</text><br>')
		API_ResponseWrite('<br><a>取消</a><br>')
	end
end

function GongCeHuoDong_OpenBaoXiang(ActorID, NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local LV = API_GetActorExpLevel(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local FastID = API_VarDataGetNumber(ActorID,0,32712) --点击的宝箱的FASTID
	local BeiBaoKongJian = API_ActorGetPackageSize(ActorID)
	if SelectItem == 1 then
		if BeiBaoKongJian > 0 then
			if API_GetMonsterID(FastID) == TML_GongCeHuoDong_BaoXiang then
				local BaoXiangX = API_GetMonsterPosX(FastID)
				local BaoXiangY = API_GetMonsterPosY(FastID)
				API_DestroyMonster(FastID)
				local SuiJiShu = math.random(100)
				if SuiJiShu <= 30 then
					if GongCeHuoDong_JingYanAndSJB_Table ~= nil then
						local EXPDuiHuanQuan = GongCeHuoDong_JingYanAndSJB_Table[LV].EXPDuiHuanQuan
						API_AddActorGoodsFlag(ActorID,80498,EXPDuiHuanQuan,3,'开宝箱获得经验兑换券')
						API_ActorSendMsg(ActorID,3,'打开宝箱获得'..EXPDuiHuanQuan..'个经验兑换券')
					end
				elseif SuiJiShu > 30 and SuiJiShu <= 60 then
					if GongCeHuoDong_JingYanAndSJB_Table ~= nil then
						local SJBDuiHuanQuan = GongCeHuoDong_JingYanAndSJB_Table[LV].SJBDuiHuanQuan
						API_AddActorGoodsFlag(ActorID,80696,SJBDuiHuanQuan,3,'开宝箱获得水晶币兑换券')
						API_ActorSendMsg(ActorID,3,'打开宝箱获得'..SJBDuiHuanQuan..'个水晶币兑换券')
					end
				elseif SuiJiShu > 60 and SuiJiShu <= 80 then
					local MonsterFastID = API_CreateMonsterEx(MapID,TML_GongCeHuoDong_MonsterID,BaoXiangX,BaoXiangY,4,0,-1,-1)
					API_CreateDieTriggerG(ActorID,0,0,MonsterFastID,'MonsterDie_DirTriggerGCallFunc')
					API_ActorSendMsg(ActorID,3,'打开宝箱放出了宝箱窃贼')
				elseif SuiJiShu > 80 and SuiJiShu <= 100 then
					API_AddActorGoodsFlag(ActorID,88869,1,3,'开宝箱获得瞬回饺子')
					API_ActorSendMsg(ActorID,3,'打开宝箱获得1个瞬回饺子')
				end
			else
				API_ResponseWrite('<text>宝箱已经被其他玩家打开了或者活动已结束</text><br><br>')
				API_ResponseWrite('<a>我知道了</a>')
			end
		else
			API_ResponseWrite('<text>背包已满，无法打开宝箱，请清理背包后再来开宝箱</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	else
		API_ResponseWrite('<text>你好，我是万人迷的宝箱，打开我后将会有意想不到的收获哦～</text><br><br>')
		API_ResponseWrite('<a href="GongCeHuoDong_OpenBaoXiang?1=1">开宝箱</a><br><br>')
		API_ResponseWrite('<a>关闭</a>')
	end
end

--创建活动刷宝箱触发器
if not API_IsEctypeServer() or API_IsBranchServer() then
	GongCeHuoDong_TimerTriggerID = GongCeHuoDong_TimerTriggerID or API_CreateTimerTriggerG(0,0,60,-1,'GongCeHuoDong_TimerTriggerGCallFunc')
end

function GongCeHuoDong_TimerTriggerGCallFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local Time = os.time() 
	local NowTime = os.date("*t", os.time()) 
	NowTime.year = GongCeHuoDong_ActTime.StartYear
	NowTime.month = GongCeHuoDong_ActTime.StartMonth
	NowTime.day = GongCeHuoDong_ActTime.StartDay
	NowTime.hour = 0 
	NowTime.min = 0 
	NowTime.sec = 0 
	local StartTime = os.time(NowTime) 
	local EndTime = os.date("*t", os.time()) 
	EndTime.year = GongCeHuoDong_ActTime.EndYear
	EndTime.month = GongCeHuoDong_ActTime.EndMonth
	EndTime.day = GongCeHuoDong_ActTime.EndDay
	EndTime.hour = 0 
	EndTime.min = 0 
	EndTime.sec = 0 
	local EndTime2 = os.time(EndTime) 
	if Time >= StartTime and Time < EndTime2 then
		for j in GongCeHuoDong_ACTMapTable do
			local MapID = API_GetRightMapID(j)
			if API_MapIsValid(MapID) then
				if GongCeHuoDong_ActBaoXiang[MapID] == nil then
					GongCeHuoDong_ActBaoXiang[MapID] = {}
				end
			end
		end
		local RedayTime = GongCeHuoDong_ActTime.RedayTime
		local StartTime = GongCeHuoDong_ActTime.StartTime
		local EndTime = GongCeHuoDong_ActTime.EndTime
		if Hour == (StartTime - 1) and Minute >= 30 then
			GongCeHuoDong_Start = 0
			if math.mod(Minute,10) == 0 then
				if API_GetServerID() == 1 then
					if not API_IsBattleGameServer() then
						API_ActorBDCMsg(-1,0,-1,12,85,0,17,'贺岁公测活动于'..StartTime..'：00--'..EndTime..'：00在珊瑚群岛、阳光雨林举行，欢迎各位英雄踊跃参与！')
						API_ActorBDCMsg(-1,0,-1,12,85,0,8,'贺岁公测活动于'..StartTime..'：00--'..EndTime..'：00在珊瑚群岛、阳光雨林举行，欢迎各位英雄踊跃参与！')
					end
				end
			end
		end
		if Hour >= StartTime and Hour < EndTime then
			if GongCeHuoDong_Start == nil or GongCeHuoDong_Start < 1 then
				GongCeHuoDong_Start = 1
				GongCeHuoDong_BaoXiang_TimerFunc = nil
				GongCeHuoDong_BaoXiang_CallFunc()
				GongCeHuoDong_BaoXiang_TimerFunc = GongCeHuoDong_BaoXiang_TimerFunc or API_CreateTimerTriggerG(0,0,60,-1,'GongCeHuoDong_BaoXiang_CallFunc')
				if API_GetServerID() == 1 then
					if not API_IsBattleGameServer() then
						API_ActorBDCMsg(-1,0,-1,12,85,0,17,'贺岁公测活动现在开始！')
						API_ActorBDCMsg(-1,0,-1,12,85,0,8,'贺岁公测活动现在开始！')
					end
					if math.mod (Minute,10) == 0 and Minute < 45 then
						if not API_IsBattleGameServer() then
							API_ActorBDCMsg(-1,1,-1,12,85,0,17,'现在去珊瑚群岛、阳光雨林寻找宝箱，找到打开后就能获得意外的惊喜！')
							API_ActorBDCMsg(-1,1,-1,12,85,0,8,'现在去珊瑚群岛、阳光雨林寻找宝箱，找到打开后就能获得意外的惊喜！')
						end
					end
				end
			end
		end
		if Hour == (EndTime - 1) and Minute >= 45 then
			if GongCeHuoDong_Start == nil or GongCeHuoDong_Start < 2 then
				GongCeHuoDong_Start = 2
				if math.mod(Minute,5) == 0 then
					if API_GetServerID() == 1 then
						if not API_IsBattleGameServer() then
							--珊瑚群岛
							API_ActorBDCMsg(10,1,-1,12,85,0,17,'请注意，珊瑚群岛出现的宝箱将在'..EndTime..'点消失！')
							API_ActorBDCMsg(10,1,-1,12,85,0,8,'请注意，珊瑚群岛出现的宝箱将在'..EndTime..'点消失！')
							--阳光雨林
							API_ActorBDCMsg(23,1,-1,12,85,0,17,'请注意，阳光雨林出现的宝箱将在'..EndTime..'点消失！')
							API_ActorBDCMsg(23,1,-1,12,85,0,8,'请注意，阳光雨林出现的宝箱将在'..EndTime..'点消失！')
						end
					end
				end
			end
		end
		if Hour == EndTime and Minute == 0 then
			if GongCeHuoDong_Start == nil or GongCeHuoDong_Start < 3 then
				GongCeHuoDong_Start = 3
				if API_GetServerID() == 1 then
					if not API_IsBattleGameServer() then
						--珊瑚群岛
						API_ActorBDCMsg(10,1,-1,12,85,0,17,'今天的贺岁公测活动已经结束！')
						API_ActorBDCMsg(10,1,-1,12,85,0,8,'今天的贺岁公测活动已经结束！')
						--阳光雨林
						API_ActorBDCMsg(23,1,-1,12,85,0,17,'今天的贺岁公测活动已经结束！')
						API_ActorBDCMsg(23,1,-1,12,85,0,8,'今天的贺岁公测活动已经结束！')
					end
				end
			end
		end
	elseif Time >= EndTime2 then
		API_DestroyTriggerG(TriggerID)
	end
end

--刷活动宝箱
function GongCeHuoDong_BaoXiang_CallFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local RedayTime = GongCeHuoDong_ActTime.RedayTime
	local StartTime = GongCeHuoDong_ActTime.StartTime
	local EndTime = GongCeHuoDong_ActTime.EndTime
	if Hour >= StartTime and Hour < EndTime then
		--判断地图存在，则刷宝箱
		for j in GongCeHuoDong_ACTMapTable do
			local MapID = API_GetRightMapID(j)
			if API_MapIsValid(MapID) and GongCeHuoDong_ActBaoXiang[MapID] ~= nil and type(GongCeHuoDong_ActBaoXiang[MapID]) == 'table' then
				local PlayList = API_GetActorInArea(MapID,0,0,0,0,0)
				local PlayNum = 50
				if PlayList ~= nil then
					PlayNum = table.getn(PlayList)
				end
				local BaoXiangID = GongCeHuoDong_ACTMapTable[j].BaoXiangID
				local BaoXiangNum = GongCeHuoDong_ACTMapTable[j].BaoXiangNum
				local x1 = GongCeHuoDong_ACTMapTable[j].x1
				local y1 = GongCeHuoDong_ACTMapTable[j].y1
				local x2 = GongCeHuoDong_ACTMapTable[j].x2
				local y2 = GongCeHuoDong_ACTMapTable[j].y2
				local x3 = GongCeHuoDong_ACTMapTable[j].x3
				local y3 = GongCeHuoDong_ACTMapTable[j].y3
				local x4 = GongCeHuoDong_ACTMapTable[j].x4
				local y4 = GongCeHuoDong_ACTMapTable[j].y4
				local PlayMin = 40
				local PlayMax = 200
				if PlayNum <= PlayMin then
					BaoXiangNum = 40
				elseif PlayNum > PlayMin and PlayNum < PlayMax then
					local PlayNum2 = PlayNum - PlayMin
					BaoXiangNum = 40 + math.floor(PlayNum2/2)
				elseif PlayNum >= PlayMax then
					BaoXiangNum = 200
				end
				for i = 1,BaoXiangNum do
					if GongCeHuoDong_ActBaoXiang[MapID][i] == nil then
						local x,y,Num = 0,0,0
						repeat
							Num = Num + 1
							x = math.random(x1,x2)
							y = math.random(y1,y2)
						until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
						if not API_IsBlockTile(MapID,x,y,0) then
							local FastID = API_CreateMonster(MapID,BaoXiangID,x,y,5,0,-1)
							GongCeHuoDong_ActBaoXiang[MapID][i] = FastID
						end
					else
						local FastID = GongCeHuoDong_ActBaoXiang[MapID][i]
						if API_GetMonsterID(FastID) ~= BaoXiangID then
							local x,y,Num = 0,0,0
							repeat
								Num = Num + 1
								x = math.random(x1,x2)
								y = math.random(y1,y2)
							until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
							if not API_IsBlockTile(MapID,x,y,0) then
								local FastID = API_CreateMonster(MapID,BaoXiangID,x,y,5,0,-1)
								GongCeHuoDong_ActBaoXiang[MapID][i] = FastID
							end
						end
					end
				end
			end
		end
	else
		for j in GongCeHuoDong_ACTMapTable do
			local MapID = API_GetRightMapID(j)
			if API_MapIsValid(MapID) and GongCeHuoDong_ActBaoXiang[MapID] ~= nil and type(GongCeHuoDong_ActBaoXiang[MapID]) == 'table' then
				local BaoXiangID = GongCeHuoDong_ACTMapTable[j].BaoXiangID
				local BaoXiangNum = GongCeHuoDong_ACTMapTable[j].BaoXiangNum
				for i = 1,BaoXiangNum do
					local FastID = GongCeHuoDong_ActBaoXiang[MapID][i]
					if FastID ~= nil and API_GetMonsterID(FastID) == BaoXiangID then
						API_DestroyMonster(FastID)
						GongCeHuoDong_ActBaoXiang[MapID][i] = nil
					end
				end
			end
		end
		API_DestroyTriggerG(TriggerID)
	end
end

GongCeHuoDong_2PinZhiZhuangBei_Table = {4001,4101,6601,6901,8101,4301,4201,4401,4501,2001,3001,3901,5001,5101,6701,7001,8201,5301,5201,5401,5501,1501,6001,6101,6801,8001,8301,6301,6201,6401,6501,1001,}

--怪物死亡触发器回调函数
function MonsterDie_DirTriggerGCallFunc(ActorID,Param_2,CType,NPCFastID,KillerType,KillerID,MonsterID,MapID,PosX,PosY)
	local SuiJiShu = math.random(100)
	local GoodsID = 0
	if SuiJiShu <= 10 then --2品质装备
		GoodsID = GongCeHuoDong_2PinZhiZhuangBei_Table[math.random(table.getn(GongCeHuoDong_2PinZhiZhuangBei_Table))]
		API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID,1,2,'怪物死亡掉落',0,ActorID,300,120,2)
	elseif SuiJiShu > 10 and SuiJiShu <= 50 then --新年烟花
		GoodsID = 88870
		API_CreateDropGoods(MapID,PosX,PosY,GoodsID,1,2,'怪物死亡掉落',0,ActorID,300,120)
	elseif SuiJiShu > 50 and SuiJiShu <= 80 then --拜年银帖
		GoodsID = TML_BaiNianTie1
		API_CreateDropGoods(MapID,PosX,PosY,GoodsID,1,2,'怪物死亡掉落',0,ActorID,300,120)
	elseif SuiJiShu > 80 and SuiJiShu <= 90 then --拜年金帖
		GoodsID = TML_BaiNianTie2
		API_CreateDropGoods(MapID,PosX,PosY,GoodsID,1,2,'怪物死亡掉落',0,ActorID,300,120)
	elseif SuiJiShu > 90 and SuiJiShu <= 98 then --拜年白金帖
		GoodsID = TML_BaiNianTie3
		API_CreateDropGoods(MapID,PosX,PosY,GoodsID,1,2,'怪物死亡掉落',0,ActorID,300,120)
	elseif SuiJiShu > 98 and SuiJiShu <= 100 then --拜年金钻帖
		GoodsID = TML_BaiNianTie4
		API_CreateDropGoods(MapID,PosX,PosY,GoodsID,1,2,'怪物死亡掉落',0,ActorID,300,120)
	end
end

if TML_GongCeHuoDong_NPCCFQ ~= nil then
	API_DestroyTriggerG(TML_GongCeHuoDong_NPCCFQ)
end
TML_GongCeHuoDong_NPCCFQ = API_CreateTimerTriggerG(0,0,60,-1,'GongCeHuoDong_NPCTimerTriggerGCallFunc')

--创建新春幸运大使NPC
function GongCeHuoDong_NPCTimerTriggerGCallFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if (Year == 2010 and Month == 1 and Day >= 29) or (Year == 2010 and Month == 2) then
		if API_GetServerID() == 1 then
			if TML_GongCeHuoDong_LBXCXYDS ~= nil then
				if API_GetMonsterID(TML_GongCeHuoDong_LBXCXYDS) > 0 then
					API_DestroyMonster(TML_GongCeHuoDong_LBXCXYDS)
				end
			end
			TML_GongCeHuoDong_LBXCXYDS = API_CreateMonsterEx(2,TML_GongCeHuoDong_NPC,233,140,3,0,-1,1)
			if TML_GongCeHuoDong_DGXCXYDS ~= nil then
				if API_GetMonsterID(TML_GongCeHuoDong_DGXCXYDS) > 0 then
					API_DestroyMonster(TML_GongCeHuoDong_DGXCXYDS)
				end
			end
			TML_GongCeHuoDong_DGXCXYDS = API_CreateMonsterEx(1,TML_GongCeHuoDong_NPC,254,102,3,0,-1,1)
		end
	else
		if API_GetServerID() == 1 then
			if TML_GongCeHuoDong_LBXCXYDS ~= nil then
				if API_GetMonsterID(TML_GongCeHuoDong_LBXCXYDS) > 0 then
					API_DestroyMonster(TML_GongCeHuoDong_LBXCXYDS)
				end
			end
			if TML_GongCeHuoDong_DGXCXYDS ~= nil then
				if API_GetMonsterID(TML_GongCeHuoDong_DGXCXYDS) > 0 then
					API_DestroyMonster(TML_GongCeHuoDong_DGXCXYDS)
				end
			end
		end
	end
end

--砸雪球活动NPC对话
function GongCeHuoDong_NPC_DuiHua(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local ActorLV = API_GetActorExpLevel(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local XingYunNum = API_VarDataGetNumber(ActorID,1,11837)
	local GetPresentTime = API_VarDataGetNumber(ActorID,1,11836)
	local GetXueQiuTime = API_VarDataGetNumber(ActorID,1,11840)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local YMD = Year * 10000 + Month * 100 + Day
	local PlayLQYear = math.floor(GetXueQiuTime/10000)
	local PlayLQMonthDay = math.mod(GetXueQiuTime,10000)
	local PlayLQMonth = math.floor(PlayLQMonthDay/100)
	local PlayLQDay = math.mod(PlayLQMonthDay,100)
	local PlayGetYear = math.floor(GetPresentTime/10000)
	local PlayGetMonthDay = math.mod(GetPresentTime,10000)
	local PlayGetMonth = math.floor(PlayGetMonthDay/100)
	local PlayGetDay = math.mod(PlayGetMonthDay,100)
	if Year ~= PlayGetYear or Month ~= PlayGetMonth or Day ~= PlayGetDay then
		API_VarDataSetNumber(ActorID,1,11841,0)
	end
	if Year ~= PlayLQYear or Month ~= PlayLQMonth or Day ~= PlayLQDay then
		API_VarDataSetNumber(ActorID,1,11838,0)
	end
	if SelectItem == 0 then
		API_ResponseWrite('<text>我是新春幸运大使，你可以在我这里领取</text><text color="255,0,255">10颗雪球</text><br>')
		API_ResponseWrite('<text>使用雪球后点击其他玩家就能砸他/她，被砸后的玩家将能获得</text><text color="255,0,255">1点新年幸运</text><br>')
		API_ResponseWrite('<text>当新年幸运累积到</text><text color="255,0,255">5点</text><text>后，就能在我这里领取一份新年礼物</text><text color="255,0,255">（2个升级魔晶）</text><br>')
		API_ResponseWrite('<text>赶紧领取雪球去互砸吧!</text><br>')
		API_ResponseWrite('<text color="255,0,0">你当前的新年幸运点数为：'..XingYunNum..'点</text><br><br>')
		API_ResponseWrite('<a href="GongCeHuoDong_NPC_DuiHua?1=1">领雪球</a><br><br>')
		API_ResponseWrite('<a href="GongCeHuoDong_NPC_DuiHua?1=2">领取新年礼物</a><br><br>')
		API_ResponseWrite('<a>离开</a>')
	elseif SelectItem == 1 then
		if (Year == 2010 and Month == 1 and Day >= 29) or (Year == 2010 and Month == 2) then
			if API_VarDataGetNumber(ActorID,1,11838) == 0 then
				if API_ActorCanAddGoods(ActorID,TML_GongCeHuoDong_XueQiu,10,3,0) == -1 then
					API_ResponseWrite('<text>您的背包空间不足</text><br><br>')
					API_ResponseWrite('<a>我知道了</a>')
					return
				end
				API_AddActorGoodsFlag(ActorID,TML_GongCeHuoDong_XueQiu,10,3,'玩家领取雪球')
				API_ResponseWrite('<name>新春幸运大使</name>')
				API_ResponseWrite('<img srcgd="'..TML_GongCeHuoDong_XueQiu..'" tipgd="'..TML_GongCeHuoDong_XueQiu..'" ><text>  × 10</text><br><br>')
				API_ResponseWrite('<text>恭喜你成功领取了10个雪球</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
				API_VarDataSetNumber(ActorID,1,11840,YMD) --存储玩家领取雪球的时间
				API_VarDataSetNumber(ActorID,1,11838,1)	  --玩家领取雪球，设置交互数据为1
			elseif API_VarDataGetNumber(ActorID,1,11838) == 1 then
				API_ResponseWrite('<text>你今天已经领取过雪球了，请明天再来领取</text><br><br>')
				API_ResponseWrite('<a>我知道了</a>')
			end
		else
			API_ResponseWrite('<text>活动已结束，不能再领取雪球了</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	elseif SelectItem == 2 then
		if (Year == 2010 and Month == 1 and Day >= 29) or (Year == 2010 and Month == 2) then
			if API_VarDataGetNumber(ActorID,1,11841) == 1 then
				API_ResponseWrite('<text>你今天已经领取过新年礼物了</text><br><br>')
				API_ResponseWrite('<a>我知道了</a>')
			elseif API_VarDataGetNumber(ActorID,1,11841) == 0 then
				local XinNianLiWu = 0
				if ActorLV <= 25 then
					XinNianLiWu = 80381
				else
					XinNianLiWu = 80382
				end
				if API_ActorCanAddGoods(ActorID,XinNianLiWu,2,3,0) == -1 then
					API_ResponseWrite('<text>您的背包空间不足</text><br><br>')
					API_ResponseWrite('<a>我知道了</a>')
					return
				end
				if XingYunNum ~= 5 then
					API_ResponseWrite('<text>你的幸运点数不足5点，不能领取新年礼物，快去找别人砸你吧！</text><br><br>')
					API_ResponseWrite('<a>我知道了</a>')
					return
				end
				API_VarDataSetNumber(ActorID,1,11836,YMD)
				API_VarDataSetNumber(ActorID,1,11841,1)
				API_VarDataSetNumber(ActorID,1,11837,0)
				API_AddActorGoodsFlag(ActorID,XinNianLiWu,2,3,'玩家领取新年礼物（升级魔晶）')
				API_ResponseWrite('<name>新春幸运大使</name>')
				API_ResponseWrite('<img srcgd="'..XinNianLiWu..'" tipgd="'..XinNianLiWu..'" ><text>  × 2</text><br><br>')
				API_ResponseWrite('<text>恭喜你成功领取了2个'..API_GetGoodsName(XinNianLiWu)..'</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
			end
		else
			API_ResponseWrite('<text>活动已结束，不能再领取新年礼物了</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	end
end

function GongCeHuoDong_XueQiu_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if API_ActorGetGoodsNum(ActorID,TML_GongCeHuoDong_XueQiu) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	--if (Month == 1 and Day < 29) or Month > 2 then
		--API_ActorSendMsg(ActorID,3,'贺岁公测活动已结束，不能再使用雪球了')
		--return 0
	--end
	API_ActorStartSelect(ActorID,'GongCeHuoDong_XueQiu',15) 
	API_ActorSendMsg(ActorID,3,'请左键点击您想砸的对象')
	return 1
end

function GongCeHuoDong_XueQiu()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local OtherID = API_RequestGetNumber(3) 
	local ActorName = API_GetActorName(ActorID)
	local OtherName = API_GetActorName(OtherID)
	if API_ActorGetGoodsNum(ActorID,TML_GongCeHuoDong_XueQiu) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if SelectType == 0 then
		API_ActorSendMsg(ActorID,2,'请左键点击您想砸的对象')
		API_ActorStartSelect(ActorID,'GongCeHuoDong_XueQiu',15)
	elseif SelectType == 1 then
		API_ActorSendMsg(ActorID,2,'请左键点击您想砸的对象')
		API_ActorStartSelect(ActorID,'GongCeHuoDong_XueQiu',15)
	elseif SelectType == 2 then
		if OtherID ~= ActorID then
			local PlayCamp = API_GetActorCamp(ActorID)
			local OtherCamp = API_GetActorCamp(OtherID)
			if PlayCamp == OtherCamp then
				local XingYunNum = API_VarDataGetNumber(OtherID,1,11837)
				if XingYunNum < 5 then
					if API_ActorRemoveGoods(ActorID,TML_GongCeHuoDong_XueQiu,1,'使用雪球') then
						API_ActorUseSkill(ActorID,500,1,0,0,1,OtherID)
						API_ActorSendMsg(ActorID,3,'您用雪球砸向'..OtherName..'，使他获得了1点新年幸运')
						API_ActorSendMsg(OtherID,3,''..ActorName..'用雪球砸你，你获得了1点新年幸运')
						XingYunNum = XingYunNum + 1
						API_VarDataSetNumber(OtherID,1,11837,XingYunNum)
					end
				else
					API_ActorSendMsg(ActorID,2,'该玩家已经被砸了5次，不能再砸了')
				end
			else
				API_ActorSendMsg(ActorID,2,'不能砸不同阵营的玩家')
			end
		else
			API_ActorSendMsg(ActorID,2,'不能砸自己')
		end
	else 
		API_ActorStartSelect(ActorID,'GongCeHuoDong_XueQiu',15)
	end
end


--------------2011年12月圣诞活动----------------
LJW_ShengDan_XueQiu_GoodsFunc = {
[89121] = 'LJW_ShengDan_XueQiu_Goods1', --雪球[普通]
[89122] = 'LJW_ShengDan_XueQiu_Goods2', --雪球[精致]
[89123] = 'LJW_ShengDan_XueQiu_Goods3', --雪球[完美]
}

WYL_ShengDan_XueQiu_FightBuff = {
[1] = {1128,576,1,},
[2] = {1129,576,2,},
[3] = {1130,576,3,},
[4] = {1131,576,4,},
}

--------2012圣诞活动开启--------
local Christmas2012_StartTime = {Year = 2012,Month = 12,Day = 7,Hour = 0,Minute = 0,Second = 0}
local Christmas2012_EndTime = {Year = 2020,Month = 1,Day = 2,Hour = 0,Minute = 0,Second = 0}


function LJW_ShengDan_XueQiu_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1  then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local StartTimeTable = Christmas2012_StartTime
	local EndTimeTable = Christmas2012_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)

	local MapID = API_GetActorMapID(ActorID) 
	local MapConfigID = API_GetMapConfigID(MapID) 
	local StaticMapID = API_GetStaticMapID(MapID)
	if MapID ~= StaticMapID then
		if MapConfigID ~= 2043 then
			API_ActorSendMsg(ActorID,3,'不能在浮空岛内使用')
			return 0
		end
	end
	local NowTime = os.time() 
	if nShiFouStart > 0 or nShiFouEnd <= 0 then
		API_ActorSendMsg(ActorID,3,'只能在活动时间内使用')
		return 0
	end
	if LJW_ShengDan_XueQiu_GoodsFunc[GoodsID] ~= nil then
		API_ActorStartSelect(ActorID,''..LJW_ShengDan_XueQiu_GoodsFunc[GoodsID]..'',15) 
		API_ActorSendMsg(ActorID,3,'请左键点击目标')
	else
		API_ActorSendMsg(ActorID,3,'无效道具')
		return 0
	end
	return 1
end

function LJW_ShengDan_XueQiu_Goods1()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local MonsterFastID = API_RequestGetNumber(3)
	local GoodsID = 89121
	local SkillID = 573
	LJW_ShengDan_XueQiu(ActorID,SelectType,MonsterFastID,GoodsID,SkillID)
end
function LJW_ShengDan_XueQiu_Goods2()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local MonsterFastID = API_RequestGetNumber(3)
	local GoodsID = 89122
	local SkillID = 574
	LJW_ShengDan_XueQiu(ActorID,SelectType,MonsterFastID,GoodsID,SkillID)
end
function LJW_ShengDan_XueQiu_Goods3()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local MonsterFastID = API_RequestGetNumber(3)
	local GoodsID = 89123
	local SkillID = 575
	LJW_ShengDan_XueQiu(ActorID,SelectType,MonsterFastID,GoodsID,SkillID)
end

function LJW_ShengDan_XueQiu(ActorID,SelectType,MonsterFastID,GoodsID,SkillID)
	local MonsterID = API_GetMonsterID(MonsterFastID)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if SelectType == 0 then
		API_ActorSendMsg(ActorID,2,'不能对该目标使用，请左键点击目标')
		if LJW_ShengDan_XueQiu_GoodsFunc[GoodsID] ~= nil then
			API_ActorStartSelect(ActorID,''..LJW_ShengDan_XueQiu_GoodsFunc[GoodsID]..'',15) 
			API_ActorSendMsg(ActorID,3,'请左键点击目标')
		else
			API_ActorSendMsg(ActorID,3,'无效道具')
		end
	elseif SelectType == 2 then
		if LJW_ShengDan_XueQiu_GoodsFunc[GoodsID] ~= nil then
			local x,y = PublicFun_GetActorPosXY(ActorID)
			local x2,y2 = PublicFun_GetActorPosXY(MonsterFastID)
			if PublicFun_AccountDistance(x,y,x2,y2) < 10 then
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用雪球') then
					local BuffTabLong = table.getn(WYL_ShengDan_XueQiu_FightBuff)
					--随机buffid
					local PD = 1
					for j = 1, BuffTabLong do
						local OldBuffID = WYL_ShengDan_XueQiu_FightBuff[j][1]
						if API_ActorFindStatus(MonsterFastID, OldBuffID) then
							PD = j + 1
							if PD > BuffTabLong then
								PD = BuffTabLong
							end
							OldBuffID = OldBuffID * 1000 + 1
							--API_Trace(OldBuffID)
							if PD <= BuffTabLong then
								API_ActorRemoveStatus(MonsterFastID, OldBuffID)
							end
							break
						end
					end
					local SkillID = WYL_ShengDan_XueQiu_FightBuff[PD][2]
					local SkillLV = WYL_ShengDan_XueQiu_FightBuff[PD][3]
					--API_Trace(PD..'，'..SkillID..'，'..SkillLV)
					--加buff
					API_ActorUseSkill(ActorID,SkillID,SkillLV,0,0,1,MonsterFastID)
--~ 					if PD > 3 then
--~ 						local a = API_ActorGetPropNum(MonsterFastID, 1) 
--~ 						if a ~= 3 then
--~ 							API_ActorSetPropNum(MonsterFastID, 1,3) 
--~ 						end
--~ 					end
				end
			else
				API_ActorSendMsg(ActorID,3,'超出射程，射不中，靠近点试试')
			end
		else
			API_ActorSendMsg(ActorID,3,'无效道具')
		end
	elseif SelectType == 1 then
		if MonsterID ~= ShengDanHuoDong_XueRenBossID then
			API_ActorSendMsg(ActorID,2,'不能对该目标使用，请左键点击雪人BOSS')
			if LJW_ShengDan_XueQiu_GoodsFunc[GoodsID] ~= nil then
				API_ActorStartSelect(ActorID,''..LJW_ShengDan_XueQiu_GoodsFunc[GoodsID]..'',15) 
				API_ActorSendMsg(ActorID,3,'请左键点击雪人BOSS')
			else
				API_ActorSendMsg(ActorID,3,'无效道具')
			end
		else
			local x,y = PublicFun_GetActorPosXY(ActorID)
			local x2,y2 = PublicFun_GetMonsterPosXY(MonsterFastID)
			if PublicFun_AccountDistance(x,y,x2,y2) < 10 then
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用雪球') then
					API_ActorUseSkill(ActorID,SkillID,1,0,0,0,MonsterFastID)
				end
			else
				API_ActorSendMsg(ActorID,3,'超出射程，射不中，靠近点试试')
			end
		end
	else 
		if LJW_ShengDan_XueQiu_GoodsFunc[GoodsID] ~= nil then
			API_ActorStartSelect(ActorID,''..LJW_ShengDan_XueQiu_GoodsFunc[GoodsID]..'',15) 
			API_ActorSendMsg(ActorID,3,'请左键点击雪人BOSS')
		else
			API_ActorSendMsg(ActorID,3,'无效道具')
		end
	end
end

