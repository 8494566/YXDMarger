----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\MidAutumnDay.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2009-9-18
--版  本:	1.0
--描  述:	中秋节活动
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：张春明
--日期：2009-9-18
--功能：创建
---------------------------------------------------------------------


MidAutumn_StartTime = {Year = 2012,Month = 9,Day = 21,Hour = 0,Minute = 0,Second = 0}   -------开始时间
MidAutumn_EndTime = {Year = 2012,Month = 10,Day = 7,Hour =23,Minute = 59,Second = 59}   -------停止时间

MidAutumn_LittleYueBingMoJuIDlist = {
[1] = 88154,	--小月饼【代】
[2] = 88155,	--小月饼【表】
[3] = 88156,	--小月饼【月】
[4] = 88157,	--小月饼【亮】
[5] = 88158,	--小月饼【惩】
[6] = 88159,	--小月饼【罚】
[7] = 88160,	--小月饼【你】
}

MidAutumn_MoJuToYueBing = {
[88154] = 88164,	
[88155] = 88165,	
[88156] = 88166,	
[88157] = 88167,	
[88158] = 88168,	
[88159] = 88169,	
[88160] = 88170,	
}

MidAutumn_LittleYueBingIDlist = {
[1] = 88164,	--小月饼【代】
[2] = 88165,	--小月饼【表】
[3] = 88166,	--小月饼【月】
[4] = 88167,	--小月饼【亮】
[5] = 88168,	--小月饼【惩】
[6] = 88169,	--小月饼【罚】
[7] = 88170,	--小月饼【你】
}

MidAutumn_LittleYueBingXiaoGuo = {

[88164] = {ZhuangTaiID = 817001,ZhuangTaiName = '月之祝福1',XIaoGuoMiaoShu = '各类型攻击力增加25点（月饼效果只能存在一个）'},	
[88165] = {ZhuangTaiID = 817002,ZhuangTaiName = '月之祝福2',XIaoGuoMiaoShu = '各类型防御力增加20点（月饼效果只能存在一个）'},	
[88166] = {ZhuangTaiID = 817003,ZhuangTaiName = '月之祝福3',XIaoGuoMiaoShu = '移动速度增加5%（月饼效果只能存在一个）'},	
[88167] = {ZhuangTaiID = 817004,ZhuangTaiName = '月之祝福4',XIaoGuoMiaoShu = '暴击抵抗增加10%（月饼效果只能存在一个）'},	
[88168] = {ZhuangTaiID = 817005,ZhuangTaiName = '月之祝福5',XIaoGuoMiaoShu = '各类型攻击暴击增加100点（月饼效果只能存在一个）'},	
[88169] = {ZhuangTaiID = 817006,ZhuangTaiName = '月之祝福6',XIaoGuoMiaoShu = '反击几率增加10%（月饼效果只能存在一个）'},	
[88170] = {ZhuangTaiID = 817007,ZhuangTaiName = '月之祝福7',XIaoGuoMiaoShu = '每3秒恢复25点生命和3点能量（月饼效果只能存在一个）'},	

}


MidAutumnTaskID= 1314


--制造一个月饼需要用到的积分
MidAutumn_MakeYueBingNeedJiFen = 400


--大月饼物品ID
MidAutumn_BigYueBingGoodsID = 88161

--至尊月饼ID
MidAutumn_ZhiZhunYueBingGoodsID = 88162

--月饼制作
function MidAutumn_MakeYueBing_GoodsCallFunc(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	local IDShiFouHeFa = 0
	for i,v in MidAutumn_LittleYueBingMoJuIDlist do 
		if GoodsID == v then
			IDShiFouHeFa = 1
			break
		end
	end
	if IDShiFouHeFa == 0 then
		return 0
	end
	local UID = API_GetUID(High,Low)
	local BagType,Loc = API_GetUIDGoodsInActor(UID,ActorID)
	if BagType == -1 or Loc == -1 then
		return 0
	end
	Loc = Loc + 1
	if API_ActorGetGoodsPropNum(ActorID,BagType,Loc,0) ~= GoodsID then
		return 0
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(MidAutumn_StartTime.Year,MidAutumn_StartTime.Month,MidAutumn_StartTime.Day,MidAutumn_StartTime.Hour,MidAutumn_StartTime.Minute,MidAutumn_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(MidAutumn_EndTime.Year,MidAutumn_EndTime.Month,MidAutumn_EndTime.Day,MidAutumn_EndTime.Hour,MidAutumn_EndTime.Minute,MidAutumn_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		API_ResponseWrite('<name>月饼制作</name>')
		API_ResponseWrite('<win rect="600,200,330,250"></win>') 
		API_ResponseWrite('<br><text>制作中秋月饼需要</text><text color="0,255,0">1个月饼模具和'..MidAutumn_MakeYueBingNeedJiFen..'中秋积分</text><br>')
		local DangQianJiFen = API_VarDataGetNumber(ActorID,1,18439)
		API_ResponseWrite('<br><text>您目前的中秋积分是：</text><text color="255,0,255">'..DangQianJiFen..'</text><br>')
		API_ResponseWrite('<br><a href="MidAutumn_MakeYueBing_GoodsCallFunc2?1='..GoodsID..'&2='..High..'&3='..Low..'">制作月饼</a><br>')
		API_ResponseFlush(ActorID)
	else
		local ExpLevel = API_GetActorExpLevel(ActorID)
		if ExpLevel > 55 then
			ExpLevel = 55
		end
		local ExpJiangLi = math.floor(MidAutumn_JiFenJiaZhi[ExpLevel].Exp * 200)
		
		if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,BagType,Loc - 1,'过时删除') then
			API_ActorSendMsg(ActorID,8,'非中秋活动期间使用'..API_GetGoodsName(GoodsID)..'，获得'..ExpJiangLi..'经验')
			API_ActorAddExp(ActorID,ExpJiangLi,MidAutumnTaskID,'中秋活动')
		end
	end
	return 1
end
function MidAutumn_MakeYueBing_GoodsCallFunc2()
	local ActorID = API_RequestGetActorID()
	local GoodsID = API_RequestGetNumber(1)
	local High = API_RequestGetNumber(2)
	local Low = API_RequestGetNumber(3)
	if API_RequestGetNumber(4) == 1 then
		API_ResponseWrite('<win rect="600,200,330,250"></win>') 
		API_ResponseWrite('<br><text>中秋积分有以下两个途径获得</text><br>')
		API_ResponseWrite('<br><text>1、参与“疯长的月桂树”活动，通过砍伐月桂树，得到月桂枝，每使用一支月桂枝可获得 5 点中秋积分</text><br>')
		API_ResponseWrite('<br><text>2、参与“月兔大作战”活动，通过消灭月兔，得到兔子肉，每使用一块兔子肉可获得 200 点中秋积分</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
	else
		for i,v in MidAutumn_LittleYueBingMoJuIDlist do 
			if GoodsID == v then
				IDShiFouHeFa = 1
				break
			end
		end
		if IDShiFouHeFa == 0 then
			return
		end
		local UID = API_GetUID(High,Low)
		local BagType,Loc = API_GetUIDGoodsInActor(UID,ActorID)
		if BagType == -1 or Loc == -1 then
			return
		end
		Loc = Loc + 1
		if API_ActorGetGoodsPropNum(ActorID,BagType,Loc,0) ~= GoodsID then
			return
		end
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local nShiFouStart = API_DiffDatatime(MidAutumn_StartTime.Year,MidAutumn_StartTime.Month,MidAutumn_StartTime.Day,MidAutumn_StartTime.Hour,MidAutumn_StartTime.Minute,MidAutumn_StartTime.Second)
		local nShiFouEnd = API_DiffDatatime(MidAutumn_EndTime.Year,MidAutumn_EndTime.Month,MidAutumn_EndTime.Day,MidAutumn_EndTime.Hour,MidAutumn_EndTime.Minute,MidAutumn_EndTime.Second)
		if nShiFouStart < 0 and nShiFouEnd > 0 then
			local DangQianJiFen = API_VarDataGetNumber(ActorID,1,18439)
			if DangQianJiFen >= MidAutumn_MakeYueBingNeedJiFen then
				if API_ActorGetPackageSize(ActorID) >= 1 then
					local Band = API_ActorGetGoodsPropNum(ActorID,BagType,Loc,4)
					DangQianJiFen = DangQianJiFen - MidAutumn_MakeYueBingNeedJiFen
					API_VarDataSetNumber(ActorID,1,18439,DangQianJiFen)
					if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,BagType,Loc - 1,'使用删除') then
						local YueBingID = MidAutumn_MoJuToYueBing[GoodsID]
						API_AddActorGoodsFlag(ActorID,YueBingID,1,Band,'制作月饼')
						API_ResponseWrite('<win rect="600,200,330,250"></win>') 
						API_ResponseWrite('<br><img srcgd="'..YueBingID..'" tipgd="'..YueBingID..'"><text>'..API_GetGoodsName(GoodsID)..'   制作成功！</text><br>')
						API_ResponseWrite('<br><text>您当前剩余中秋积分：</text><text color="0,255,0">'..DangQianJiFen..'</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						--风向标统计数据
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[36][1][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[36][1][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[36][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[36][1][LaiYuan] + 1
						end
					end
				else
					API_ResponseWrite('<win rect="600,200,330,250"></win>') 
					API_ResponseWrite('<text color="255,0,0">您的背包空间不够</text><br><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			else
				API_ResponseWrite('<win rect="600,200,330,250"></win>') 
				API_ResponseWrite('<br><text>制作中秋月饼需要1个月饼模具和</text><text color="0,255,0">'..MidAutumn_MakeYueBingNeedJiFen..'中秋积分</text><br>')
				API_ResponseWrite('<br><text>您当前的中秋积分只有：</text><text color="0,255,0">'..DangQianJiFen..'</text><br>')
				API_ResponseWrite('<br><a href="MidAutumn_MakeYueBing_GoodsCallFunc2?4=1">查看如何获得中秋积分</a><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	end
end


--小月饼使用函数
function MidAutumn_LittleYueBing_GoodsCallFunc(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	--三个选项：吃掉、合成大月饼、合成至尊月饼
	local IDShiFouHeFa = 0
	for i,v in MidAutumn_LittleYueBingIDlist do 
		if GoodsID == v then
			IDShiFouHeFa = 1
			break
		end
	end
	if IDShiFouHeFa == 0 then
		return 0
	end
	local UID = API_GetUID(High,Low)
	local BagType,Loc = API_GetUIDGoodsInActor(UID,ActorID)
	if BagType == -1 or Loc == -1 then
		return 0
	end
	Loc = Loc + 1
	if API_ActorGetGoodsPropNum(ActorID,BagType,Loc,0) ~= GoodsID then
		return 0
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(MidAutumn_StartTime.Year,MidAutumn_StartTime.Month,MidAutumn_StartTime.Day,MidAutumn_StartTime.Hour,MidAutumn_StartTime.Minute,MidAutumn_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(MidAutumn_EndTime.Year,MidAutumn_EndTime.Month,MidAutumn_EndTime.Day,MidAutumn_EndTime.Hour,MidAutumn_EndTime.Minute,MidAutumn_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		local ExpLevel = API_GetActorExpLevel(ActorID)
		if ExpLevel > 55 then
			ExpLevel = 55
		end
		local MoneyJiangLi = math.floor(MidAutumn_JiFenJiaZhi[ExpLevel].Money * 400)
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		API_ResponseWrite('<win rect="600,200,330,250"></win>') 
		API_ResponseWrite('<br><text>“月亮代表我的心”</text><br>')
		API_ResponseWrite('<br><a href="MidAutumn_LittleYueBing_GoodsCallFun2?1=1&2='..GoodsID..'&3='..High..'&4='..Low..'">吃掉小月饼</a><text>（获得 '..MoneyJiangLi..' 金币）</text><br>')
		API_ResponseWrite('<br><a href="MidAutumn_LittleYueBing_GoodsCallFun2?1=2&2='..GoodsID..'&3='..High..'&4='..Low..'">合成大月饼</a><text>（需要四种不同的小月饼）</text><br>')
		API_ResponseWrite('<br><a href="MidAutumn_LittleYueBing_GoodsCallFun2?1=3&2='..GoodsID..'&3='..High..'&4='..Low..'">合成至尊月饼</a><text>（需要七种不同的小月饼）</text><br>')
		API_ResponseFlush(ActorID)
	else
		local ExpLevel = API_GetActorExpLevel(ActorID)
			if ExpLevel > 55 then
			ExpLevel = 55
		end
		local ExpJiangLi = math.floor(MidAutumn_JiFenJiaZhi[ExpLevel].Exp * 200)
		if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,BagType,Loc - 1,'过期删除') then
			API_ActorSendMsg(ActorID,8,'非中秋活动期间使用'..API_GetGoodsName(GoodsID)..'，获得'..ExpJiangLi..'经验')
			API_ActorAddExp(ActorID,ExpJiangLi,MidAutumnTaskID,'中秋活动')
		end
	end
	return 1
end

function MidAutumn_LittleYueBing_GoodsCallFun2()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local GoodsID = API_RequestGetNumber(2)
	local High = API_RequestGetNumber(3)
	local Low = API_RequestGetNumber(4)
	local IDShiFouHeFa = 0
	for i,v in MidAutumn_LittleYueBingIDlist do 
		if GoodsID == v then
			IDShiFouHeFa = 1
			break
		end
	end
	if IDShiFouHeFa == 0 then
		return
	end
	local UID = API_GetUID(High,Low)
	local BagType,Loc = API_GetUIDGoodsInActor(UID,ActorID)
	if BagType == -1 or Loc == -1 then
		return
	end
	Loc = Loc + 1
	if API_ActorGetGoodsPropNum(ActorID,BagType,Loc,0) ~= GoodsID then
		return
	end
	if SelectItem == 1 then
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local nShiFouStart = API_DiffDatatime(MidAutumn_StartTime.Year,MidAutumn_StartTime.Month,MidAutumn_StartTime.Day,MidAutumn_StartTime.Hour,MidAutumn_StartTime.Minute,MidAutumn_StartTime.Second)
		local nShiFouEnd = API_DiffDatatime(MidAutumn_EndTime.Year,MidAutumn_EndTime.Month,MidAutumn_EndTime.Day,MidAutumn_EndTime.Hour,MidAutumn_EndTime.Minute,MidAutumn_EndTime.Second)
		if nShiFouStart < 0 and nShiFouEnd > 0 then
			if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,BagType,Loc - 1,'使用删除') then
				local ExpLevel = API_GetActorExpLevel(ActorID)
				if ExpLevel > 55 then
					ExpLevel = 55
				end
				local MoneyJiangLi = math.floor(MidAutumn_JiFenJiaZhi[ExpLevel].Money * 400)
				API_ActorAddMoney(ActorID,MoneyJiangLi,MidAutumnTaskID,'小月饼兑换金币')
				API_ActorSendMsg(ActorID,8,'您吃掉了'..API_GetGoodsName(GoodsID)..'，获得'..MoneyJiangLi..'金币')
				--风向标统计数据
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[36][2][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[36][2][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[36][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[36][2][LaiYuan] + 1
				end
			end
		end
	elseif SelectItem == 2 then
		if API_RequestGetNumber(10) == 0 then
			API_ResponseWrite('<win rect="600,200,330,250"></win>') 
			API_ResponseWrite('<text>请把</text><text color="255,0,255">四种不同的小月饼</text><text>放入提交框中进行合成</text><br><br>')
			API_ResponseWrite('<goodsHolder name="100"><goodsHolder name="200"><goodsHolder name="300"><goodsHolder name="400"><br>')
			API_ResponseWrite('<br><a href="MidAutumn_LittleYueBing_GoodsCallFun2?1=2&2='..GoodsID..'&3='..High..'&4='..Low..'&10=1">合成大月饼</a><text>（需要四种不同的小月饼）</text><br>')
		else
			local UidHigh1 = API_RequestGetNumber(100)--高位UID
			local UidLow1 = API_RequestGetNumber(1100)--低位UID
			local UID1 = API_GetUID(UidHigh1,UidLow1)
			
			local UidHigh2 = API_RequestGetNumber(200)--高位UID
			local UidLow2 = API_RequestGetNumber(1200)--低位UID
			local UID2 = API_GetUID(UidHigh2,UidLow2)
			
			local UidHigh3 = API_RequestGetNumber(300)--高位UID
			local UidLow3 = API_RequestGetNumber(1300)--低位UID
			local UID3 = API_GetUID(UidHigh3,UidLow3)
			
			local UidHigh4 = API_RequestGetNumber(400)--高位UID
			local UidLow4 = API_RequestGetNumber(1400)--低位UID
			local UID4 = API_GetUID(UidHigh4,UidLow4)
			
			
			local FangRuOK = 1
			local BagType1,Loc1 = API_GetUIDGoodsInActor(UID1,ActorID)
			local GoodsID1 = 0
			if BagType1 == -1 or Loc1 == -1 then
				FangRuOK = 0
			else
				Loc1 = Loc1 + 1
				GoodsID1 = API_ActorGetGoodsPropNum(ActorID,BagType1,Loc1,0) 
				local IDShiFouHeFa = 0
				for i,v in MidAutumn_LittleYueBingIDlist do 
					if GoodsID1 == v then
						IDShiFouHeFa = 1
						break
					end
				end
				if IDShiFouHeFa == 0 then
					FangRuOK = 0
				end
			end
			
						
			local BagType2,Loc2 = API_GetUIDGoodsInActor(UID2,ActorID)
			local GoodsID2 = 0
			if BagType2 == -1 or Loc2 == -1 then
				FangRuOK = 0
			else
				Loc2 = Loc2 + 1
				GoodsID2 = API_ActorGetGoodsPropNum(ActorID,BagType2,Loc2,0) 
				local IDShiFouHeFa = 0
				for i,v in MidAutumn_LittleYueBingIDlist do 
					if GoodsID2 == v then
						IDShiFouHeFa = 1
						break
					end
				end
				if IDShiFouHeFa == 0 then
					FangRuOK = 0
				end
			end
			
			
			if GoodsID2 == GoodsID1 then
				FangRuOK = 0
			end
			
			local BagType3,Loc3 = API_GetUIDGoodsInActor(UID3,ActorID)
			local GoodsID3 = 0
			if BagType3 == -1 or Loc3 == -1 then
				FangRuOK = 0
			else
				Loc3 = Loc3 + 1
				GoodsID3 = API_ActorGetGoodsPropNum(ActorID,BagType3,Loc3,0) 
				local IDShiFouHeFa = 0
				for i,v in MidAutumn_LittleYueBingIDlist do 
					if GoodsID3 == v then
						IDShiFouHeFa = 1
						break
					end
				end
				if IDShiFouHeFa == 0 then
					FangRuOK = 0
				end
			end
			
			
			if GoodsID3 == GoodsID1 or GoodsID3 == GoodsID2 then
				FangRuOK = 0
			end
			
			
			local BagType4,Loc4 = API_GetUIDGoodsInActor(UID4,ActorID)
			local GoodsID4 = 0
			if BagType4 == -1 or Loc4 == -1 then
				FangRuOK = 0
			else
				Loc4 = Loc4 + 1
				GoodsID4 = API_ActorGetGoodsPropNum(ActorID,BagType4,Loc4,0) 
				local IDShiFouHeFa = 0
				for i,v in MidAutumn_LittleYueBingIDlist do 
					if GoodsID4 == v then
						IDShiFouHeFa = 1
						break
					end
				end
				if IDShiFouHeFa == 0 then
					FangRuOK = 0
				end
			end
			
			
			if GoodsID4 == GoodsID1 or GoodsID4 == GoodsID2 or GoodsID4 == GoodsID3 then
				FangRuOK = 0
			end
			
			if FangRuOK == 1 then
				--删除小月饼，给大月饼
				if API_ActorGetPackageSize(ActorID) >= 1 then
					if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID1,1,BagType1,Loc1 - 1,'合成大月饼删除') and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID2,1,BagType2,Loc2 - 1,'合成大月饼删除') and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID3,1,BagType3,Loc3 - 1,'合成大月饼删除') and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID4,1,BagType4,Loc4 - 1,'合成大月饼删除') then
						API_AddActorGoods(ActorID,MidAutumn_BigYueBingGoodsID,1,'合成大月饼')
						API_ResponseWrite('<win rect="600,200,330,250"></win>') 
						API_ResponseWrite('<br><text color="0,255,0">代表月亮祝福你！</text><br>')
						API_ResponseWrite('<br><img srcgd="'..MidAutumn_BigYueBingGoodsID..'" tipgd="'..MidAutumn_BigYueBingGoodsID..'"><text>'..API_GetGoodsName(MidAutumn_BigYueBingGoodsID)..'  合成成功！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						--风向标统计数据
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[36][3][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[36][3][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[36][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[36][3][LaiYuan] + 1
						end
					end
				else
					API_ResponseWrite('<win rect="600,200,330,250"></win>') 
					API_ResponseWrite('<text color="255,0,0">您的背包空间不够</text><br><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			else
				API_ResponseWrite('<win rect="600,200,330,250"></win>') 
				API_ResponseWrite('<text>需要把</text><text color="255,0,255">四种不同的小月饼</text><text>放入提交框中才能合成大月饼</text><br><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	elseif SelectItem == 3 then
		if API_RequestGetNumber(10) == 0 then
			API_ResponseWrite('<win rect="600,200,330,250"></win>') 
			API_ResponseWrite('<text>请把</text><text color="255,0,255">七种不同的小月饼</text><text>放入提交框中进行合成</text><br><br>')
			API_ResponseWrite('<goodsHolder name="100"><goodsHolder name="200"><goodsHolder name="300"><goodsHolder name="400"><goodsHolder name="500"><goodsHolder name="600"><goodsHolder name="700"><br>')
			API_ResponseWrite('<br><a href="MidAutumn_LittleYueBing_GoodsCallFun2?1=3&2='..GoodsID..'&3='..High..'&4='..Low..'&10=1">合成至尊月饼</a><text>（需要七种不同的小月饼）</text><br>')
		else
			local UidHigh1 = API_RequestGetNumber(100)--高位UID
			local UidLow1 = API_RequestGetNumber(1100)--低位UID
			local UID1 = API_GetUID(UidHigh1,UidLow1)
			
			local UidHigh2 = API_RequestGetNumber(200)--高位UID
			local UidLow2 = API_RequestGetNumber(1200)--低位UID
			local UID2 = API_GetUID(UidHigh2,UidLow2)
			
			local UidHigh3 = API_RequestGetNumber(300)--高位UID
			local UidLow3 = API_RequestGetNumber(1300)--低位UID
			local UID3 = API_GetUID(UidHigh3,UidLow3)
			
			local UidHigh4 = API_RequestGetNumber(400)--高位UID
			local UidLow4 = API_RequestGetNumber(1400)--低位UID
			local UID4 = API_GetUID(UidHigh4,UidLow4)
			
			local UidHigh5 = API_RequestGetNumber(500)--高位UID
			local UidLow5 = API_RequestGetNumber(1500)--低位UID
			local UID5 = API_GetUID(UidHigh5,UidLow5)
			
			local UidHigh6 = API_RequestGetNumber(600)--高位UID
			local UidLow6 = API_RequestGetNumber(1600)--低位UID
			local UID6 = API_GetUID(UidHigh6,UidLow6)
			
			local UidHigh7 = API_RequestGetNumber(700)--高位UID
			local UidLow7 = API_RequestGetNumber(1700)--低位UID
			local UID7 = API_GetUID(UidHigh7,UidLow7)
			
			local FangRuOK = 1
			local BagType1,Loc1 = API_GetUIDGoodsInActor(UID1,ActorID)
			local GoodsID1 = 0
			if BagType1 == -1 or Loc1 == -1 then
				FangRuOK = 0
			else
				Loc1 = Loc1 + 1
				GoodsID1 = API_ActorGetGoodsPropNum(ActorID,BagType1,Loc1,0) 
				local IDShiFouHeFa = 0
				for i,v in MidAutumn_LittleYueBingIDlist do 
					if GoodsID1 == v then
						IDShiFouHeFa = 1
						break
					end
				end
				if IDShiFouHeFa == 0 then
					FangRuOK = 0
				end
			end
			
			
			local BagType2,Loc2 = API_GetUIDGoodsInActor(UID2,ActorID)
			local GoodsID2 = 0
			if BagType2 == -1 or Loc2 == -1 then
				FangRuOK = 0
			else
				Loc2 = Loc2 + 1
				GoodsID2 = API_ActorGetGoodsPropNum(ActorID,BagType2,Loc2,0) 
				local IDShiFouHeFa = 0
				for i,v in MidAutumn_LittleYueBingIDlist do 
					if GoodsID2 == v then
						IDShiFouHeFa = 1
						break
					end
				end
				if IDShiFouHeFa == 0 then
					FangRuOK = 0
				end
			end
			
			
			if GoodsID2 == GoodsID1 then
				FangRuOK = 0
			end
			
			local BagType3,Loc3 = API_GetUIDGoodsInActor(UID3,ActorID)
			local GoodsID3 = 0
			if BagType3 == -1 or Loc3 == -1 then
				FangRuOK = 0
			else
				Loc3 = Loc3 + 1
				GoodsID3 = API_ActorGetGoodsPropNum(ActorID,BagType3,Loc3,0) 
				local IDShiFouHeFa = 0
				for i,v in MidAutumn_LittleYueBingIDlist do 
					if GoodsID3 == v then
						IDShiFouHeFa = 1
						break
					end
				end
				if IDShiFouHeFa == 0 then
					FangRuOK = 0
				end
			end
			
			
			if GoodsID3 == GoodsID1 or GoodsID3 == GoodsID2 then
				FangRuOK = 0
			end
			
			
			local BagType4,Loc4 = API_GetUIDGoodsInActor(UID4,ActorID)
			local GoodsID4 = 0
			if BagType4 == -1 or Loc4 == -1 then
				FangRuOK = 0
			else
				Loc4 = Loc4 + 1
				GoodsID4 = API_ActorGetGoodsPropNum(ActorID,BagType4,Loc4,0) 
				local IDShiFouHeFa = 0
				for i,v in MidAutumn_LittleYueBingIDlist do 
					if GoodsID4 == v then
						IDShiFouHeFa = 1
						break
					end
				end
				if IDShiFouHeFa == 0 then
					FangRuOK = 0
				end
			end
			
			
			if GoodsID4 == GoodsID1 or GoodsID4 == GoodsID2 or GoodsID4 == GoodsID3 then
				FangRuOK = 0
			end
			
			local BagType5,Loc5 = API_GetUIDGoodsInActor(UID5,ActorID)
			local GoodsID5 = 0
			if BagType5 == -1 or Loc5 == -1 then
				FangRuOK = 0
			else
				Loc5 = Loc5 + 1
				GoodsID5 = API_ActorGetGoodsPropNum(ActorID,BagType5,Loc5,0) 
				local IDShiFouHeFa = 0
				for i,v in MidAutumn_LittleYueBingIDlist do 
					if GoodsID5 == v then
						IDShiFouHeFa = 1
						break
					end
				end
				if IDShiFouHeFa == 0 then
					FangRuOK = 0
				end
			end
			
			if GoodsID5 == GoodsID1 or GoodsID5 == GoodsID2 or GoodsID5 == GoodsID3 or GoodsID5 == GoodsID4 then
				FangRuOK = 0
			end
			
			
			local BagType6,Loc6 = API_GetUIDGoodsInActor(UID6,ActorID)
			local GoodsID6 = 0
			if BagType6 == -1 or Loc6 == -1 then
				FangRuOK = 0
			else
				Loc6 = Loc6 + 1
				GoodsID6 = API_ActorGetGoodsPropNum(ActorID,BagType6,Loc6,0) 
				local IDShiFouHeFa = 0
				for i,v in MidAutumn_LittleYueBingIDlist do 
					if GoodsID6 == v then
						IDShiFouHeFa = 1
						break
					end
				end
				if IDShiFouHeFa == 0 then
					FangRuOK = 0
				end
			end
			
			
			if GoodsID6 == GoodsID1 or GoodsID6 == GoodsID2 or GoodsID6 == GoodsID3 or GoodsID6 == GoodsID4 or GoodsID6 == GoodsID5 then
				FangRuOK = 0
			end
			
			
			local BagType7,Loc7 = API_GetUIDGoodsInActor(UID7,ActorID)
			local GoodsID7 = 0
			if BagType7 == -1 or Loc7 == -1 then
				FangRuOK = 0
			else
				Loc7 = Loc7 + 1
				GoodsID7 = API_ActorGetGoodsPropNum(ActorID,BagType7,Loc7,0) 
				local IDShiFouHeFa = 0
				for i,v in MidAutumn_LittleYueBingIDlist do 
					if GoodsID7 == v then
						IDShiFouHeFa = 1
						break
					end
				end
				if IDShiFouHeFa == 0 then
					FangRuOK = 0
				end
			end
			
			
			if GoodsID7 == GoodsID1 or GoodsID7 == GoodsID2 or GoodsID7 == GoodsID3 or GoodsID7 == GoodsID4 or GoodsID7 == GoodsID5 or GoodsID7 == GoodsID6 then
				FangRuOK = 0
			end
			
			if FangRuOK == 1 then
				--删除小月饼，给大月饼
				if API_ActorGetPackageSize(ActorID) >= 1 then
					if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID1,1,BagType1,Loc1 - 1,'合成大月饼删除') and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID2,1,BagType2,Loc2 - 1,'合成大月饼删除') and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID3,1,BagType3,Loc3 - 1,'合成大月饼删除') and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID4,1,BagType4,Loc4 - 1,'合成大月饼删除') and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID5,1,BagType5,Loc5 - 1,'合成大月饼删除') and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID6,1,BagType6,Loc6 - 1,'合成大月饼删除') and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID7,1,BagType7,Loc7 - 1,'合成大月饼删除') then
						API_AddActorGoods(ActorID,MidAutumn_ZhiZhunYueBingGoodsID,1,'合成大月饼')
						API_ResponseWrite('<win rect="600,200,330,250"></win>') 
						API_ResponseWrite('<br><text color="0,255,0">代表月亮祝福你！</text><br>')
						API_ResponseWrite('<br><img srcgd="'..MidAutumn_ZhiZhunYueBingGoodsID..'" tipgd="'..MidAutumn_ZhiZhunYueBingGoodsID..'"><text>'..API_GetGoodsName(MidAutumn_ZhiZhunYueBingGoodsID)..'   合成成功！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						--风向标统计数据
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[36][4][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[36][4][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[36][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[36][4][LaiYuan] + 1
						end
					end
				else
					API_ResponseWrite('<win rect="600,200,330,250"></win>') 
					API_ResponseWrite('<text color="255,0,0">您的背包空间不够</text><br><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			else
				API_ResponseWrite('<win rect="600,200,330,250"></win>') 
				API_ResponseWrite('<text>需要把</text><text color="255,0,255">七种不同的小月饼</text><text>放入提交框中才能合成至尊月饼</text><br><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	end
end


--大月饼使用函数
--大月饼等于四星龙珠
MidAutumn_BigYueBing_dianquan = 40
MidAutumn_ZhiZhunYueBing_dianquan = 70
function MidAutumn_BigYueBing_GoodsCallFunc(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	--选择打开使用消耗点券40点，有VIP卡减半
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end	
	if GoodsID ~= 88161 then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,0,'没有这个道具')
		API_ActorSendMsg(ActorID,7,'没有这个道具')
		return 0
	end
	local dianquan = MidAutumn_BigYueBing_dianquan
	local usetime = API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave)			
	if usetime > 0 then		
		dianquan = MidAutumn_BigYueBing_dianquan/2
	end
	API_ResponseWrite('<name>中秋活动</name>')
	API_ResponseWrite('<win rect="300,100,400,300"></win>')
	API_ResponseWrite('<br><text>千好万好事事好，月圆情圆人团圆</text><br>')
	--API_ResponseWrite('<text>活动期间，拥有并使用</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,255">消耗减半</text><text>！</text><br>')	
	local PackageSize = API_ActorGetPackageSize(ActorID)
	if PackageSize > 0 then
		local ExpLevel = API_GetActorExpLevel(ActorID)
		if ExpLevel > 55 then
			ExpLevel = 55
		end
		local MoneyJiangLi = math.floor(MidAutumn_JiFenJiaZhi[ExpLevel].Money * 1600)
		if dianquan == MidAutumn_BigYueBing_dianquan then
			API_ResponseWrite('<br><br><a underline="1" href="MidAutumn_BigYueBing_GoodsCallFunc2?1='..ActorID..'&2='..GoodsID..'&3='..High..'&4='..Low..'">吃掉大月饼</a><text>（可获得'..MoneyJiangLi..'金币和随机道具奖励，需消耗'..dianquan..'点券，</text><text color="255,0,255">vip钥匙持有者消耗减半）</text><br>')
		elseif dianquan == MidAutumn_BigYueBing_dianquan/2 then
			API_ResponseWrite('<br><br><a underline="1" href="MidAutumn_BigYueBing_GoodsCallFunc2?1='..ActorID..'&2='..GoodsID..'&3='..High..'&4='..Low..'">吃掉大月饼</a><text>（可获得'..MoneyJiangLi..'金币和随机道具奖励，需消耗'..dianquan..'点券）</text><br>')
		end
		API_ResponseFlush(ActorID)		
		return 1
	else
		API_ResponseWrite('<br><text>您的背包已满，请至少留出1个空格后再打开</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><br>')	
		API_ResponseWrite('<br><a>确定</a><br>')		
		API_ResponseFlush(ActorID)
		return 0
	end	
end
function MidAutumn_BigYueBing_GoodsCallFunc2()
	--选择打开使用消耗点券40点，有VIP卡减半
	local ActorID = API_RequestGetNumber(1)
	local GoodsID = API_RequestGetNumber(2)
	local High = API_RequestGetNumber(3)
	local Low = API_RequestGetNumber(4)	
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end	
	if GoodsID ~= 88161 then
		return
	end
	if API_ActorGetGoodsNum(ActorID,88161) < 1 then
		API_ActorSendMsg(ActorID,0,'没有这个道具')
		API_ActorSendMsg(ActorID,7,'没有这个道具')
		return
	end
	local dianquan = MidAutumn_BigYueBing_dianquan
	local usetime = API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave)			
	if usetime > 0 then		
		dianquan = MidAutumn_BigYueBing_dianquan/2
	end
	if API_UsePoint(ActorID,3,GoodsID,dianquan,dianquan) == 0 then --这里怎么搞
		local ExpLevel = API_GetActorExpLevel(ActorID)
		if ExpLevel > 55 then
			ExpLevel = 55
		end
		local MoneyJiangLi = math.floor(MidAutumn_JiFenJiaZhi[ExpLevel].Money * 1600)
		API_ActorAddMoney(ActorID,MoneyJiangLi,MidAutumnTaskID,'大月饼兑换金币')
		API_ActorSendMsg(ActorID,8,'您吃掉了'..API_GetGoodsName(GoodsID)..'，获得'..MoneyJiangLi..'金币')
		WYL_SevenDragonBalls_ZhuanPan(ActorID,GoodsID,High,Low,2)
		--风向标统计数据
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		if GLOBAL_FengXiangBiao_DateList[36][11][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[36][11][LaiYuan] = dianquan
		else
			GLOBAL_FengXiangBiao_DateList[36][11][LaiYuan] = GLOBAL_FengXiangBiao_DateList[36][11][LaiYuan] + dianquan
		end
	elseif API_UsePoint(ActorID,3,GoodsID,dianquan,dianquan) == 1 then
		API_ResponseWrite('<name>中秋活动</name>')
		API_ResponseWrite('<win rect="300,100,400,300"></win>')
		API_ResponseWrite('<text>您身上的点券数量不足'..dianquan..'点，不能使用月饼。</text>')
		API_ResponseFlush(ActorID)
		return
	end
end
--至尊月饼使用函数
--至尊月饼等于七星龙珠
function MidAutumn_ZhiZhunYueBing_GoodsCallFunc(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	--选择打开使用消耗点券70点，有VIP卡减半
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end	
	if GoodsID ~= 88162 then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,0,'没有这个道具')
		API_ActorSendMsg(ActorID,7,'没有这个道具')
		return 0
	end
	local dianquan = MidAutumn_ZhiZhunYueBing_dianquan
	local usetime = API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave)			
	if usetime > 0 then		
		dianquan = MidAutumn_ZhiZhunYueBing_dianquan/2
	end
	API_ResponseWrite('<name>中秋活动</name>')
	API_ResponseWrite('<win rect="300,100,400,300"></win>')
	API_ResponseWrite('<br><text>月圆家圆人圆事圆圆圆团团，国和家和人和事和和和美美</text><br>')
	--API_ResponseWrite('<text>活动期间，拥有并使用</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,255">消耗减半</text><text>！</text><br>')	
	local PackageSize = API_ActorGetPackageSize(ActorID)
	if PackageSize > 0 then
		local ExpLevel = API_GetActorExpLevel(ActorID)
		if ExpLevel > 55 then
			ExpLevel = 55
		end
		local MoneyJiangLi = math.floor(MidAutumn_JiFenJiaZhi[ExpLevel].Money * 2800)
		if dianquan == MidAutumn_ZhiZhunYueBing_dianquan then
			API_ResponseWrite('<br><br><a underline="1" href="MidAutumn_ZhiZhunYueBing_GoodsCallFunc2?1='..ActorID..'&2='..GoodsID..'&3='..High..'&4='..Low..'">吃掉至尊月饼</a><text>（可获得'..MoneyJiangLi..'金币和随机道具奖励，需消耗'..dianquan..'点券，</text><text color="255,0,255">vip钥匙持有者消耗减半）</text><br>')
		elseif dianquan == MidAutumn_ZhiZhunYueBing_dianquan/2 then
			API_ResponseWrite('<br><br><a underline="1" href="MidAutumn_ZhiZhunYueBing_GoodsCallFunc2?1='..ActorID..'&2='..GoodsID..'&3='..High..'&4='..Low..'">吃掉至尊月饼</a><text>（可获得'..MoneyJiangLi..'金币和随机道具奖励，需消耗'..dianquan..'点券）</text><br>')
		end
		API_ResponseFlush(ActorID)		
		return 1
	else
		API_ResponseWrite('<br><text>您的背包已满，请至少留出1个空格后再打开</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><br>')		
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end	
end
function MidAutumn_ZhiZhunYueBing_GoodsCallFunc2()
	--选择打开使用?牡闳?40点，有VIP卡减半
	local ActorID = API_RequestGetNumber(1)
	local GoodsID = API_RequestGetNumber(2)
	local High = API_RequestGetNumber(3)
	local Low = API_RequestGetNumber(4)	
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end	
	if GoodsID ~= 88162 then
		return
	end
	if API_ActorGetGoodsNum(ActorID,88162) < 1 then
		API_ActorSendMsg(ActorID,0,'没有这个道具')
		API_ActorSendMsg(ActorID,7,'没有这个道具')
		return
	end
	local dianquan = MidAutumn_ZhiZhunYueBing_dianquan
	local usetime = API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave)			
	if usetime > 0 then		
		dianquan = MidAutumn_ZhiZhunYueBing_dianquan/2
	end
	if API_UsePoint(ActorID,3,GoodsID,dianquan,dianquan) == 0 then --这里怎么搞
		local ExpLevel = API_GetActorExpLevel(ActorID)
		if ExpLevel > 55 then
			ExpLevel = 55
		end
		local MoneyJiangLi = math.floor(MidAutumn_JiFenJiaZhi[ExpLevel].Money * 2800)
		API_ActorAddMoney(ActorID,MoneyJiangLi,MidAutumnTaskID,'至尊月饼兑换金币')
		API_ActorSendMsg(ActorID,8,'您吃掉了'..API_GetGoodsName(GoodsID)..'，获得'..MoneyJiangLi..'金币')
		WYL_SevenDragonBalls_ZhuanPan(ActorID,GoodsID,High,Low,2)
		--风向标统计数据
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		if GLOBAL_FengXiangBiao_DateList[36][12][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[36][12][LaiYuan] = dianquan
		else
			GLOBAL_FengXiangBiao_DateList[36][12][LaiYuan] = GLOBAL_FengXiangBiao_DateList[36][12][LaiYuan] + dianquan
		end
	elseif API_UsePoint(ActorID,3,GoodsID,dianquan,dianquan) == 1 then
		API_ResponseWrite('<name>中秋活动</name>')
		API_ResponseWrite('<win rect="300,100,400,300"></win>')
		API_ResponseWrite('<text>您身上的点券数量不足'..dianquan..'点，不能使用月饼。</text>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
end

--月桂枝使用函数
function MidAutumn_YueGuiZhi_GoodsCallFunc(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if GoodsID ~= 80857 then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		return 0
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(MidAutumn_StartTime.Year,MidAutumn_StartTime.Month,MidAutumn_StartTime.Day,MidAutumn_StartTime.Hour,MidAutumn_StartTime.Minute,MidAutumn_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(MidAutumn_EndTime.Year,MidAutumn_EndTime.Month,MidAutumn_EndTime.Day,MidAutumn_EndTime.Hour,MidAutumn_EndTime.Minute,MidAutumn_EndTime.Second)
	local GoodsNum = API_ActorGetGoodsNum(ActorID,GoodsID)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel > 55 then
		ExpLevel = 55
	end
	if ExpLevel < 16 then
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		API_ResponseWrite('<win rect="600,200,330,250"></win>') 
		API_ResponseWrite('<br><text>等级低于16级不能使用</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	local ExpJiangLi = math.floor(MidAutumn_JiFenJiaZhi[ExpLevel].Exp * 5 * GoodsNum)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		--三个选项：兑换经验和积分、兑换桂冠/花冠、关于月兔大作战
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		API_ResponseWrite('<win rect="600,200,330,250"></win>') 
		API_ResponseWrite('<br><text>每个月桂枝可兑换5点中秋积分，中秋积分可用于制作月饼</text><br>')
		local ZuiHouRiQi = API_VarDataGetNumber(ActorID,1,18440)
		local JinTianJiFen = API_VarDataGetNumber(ActorID,1,18441)
		local ShenYuKeDuiHuan = 6000 - JinTianJiFen
		local JinTian = Year * 10000 + Month * 100 + Day
		if ZuiHouRiQi ~= JinTian then
			ShenYuKeDuiHuan = 6000
		end
		local KeDuiHuan = 5 * GoodsNum
		if KeDuiHuan > ShenYuKeDuiHuan then
			KeDuiHuan = ShenYuKeDuiHuan
		end
		if KeDuiHuan > 0 then
			API_ResponseWrite('<br><a href="MidAutumn_YueGuiZhi_GoodsCallFunc2?1=1">用'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'兑换 '..ExpJiangLi..'经验 和 '..KeDuiHuan..'点中秋积分</a><br><br>')
		else
			API_ResponseWrite('<br><a href="MidAutumn_YueGuiZhi_GoodsCallFunc2?1=1">用'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'兑换 '..ExpJiangLi..'经验</a><text color="255,0,0">（您今天可获得的中秋积分已达上限）</text><br><br>')
		end
		if API_ActorGetPropNum(ActorID,PD_PROP_SEX) == 1 then
			API_ResponseWrite('<br><a href="MidAutumn_YueGuiZhi_GoodsCallFunc2?1=2">兑换桂冠</a><text>（时装：需要600个'..API_GetGoodsName(GoodsID)..'）</text><br>')
		else
			API_ResponseWrite('<br><a href="MidAutumn_YueGuiZhi_GoodsCallFunc2?1=2">兑换花冠</a><text>（时装：需要600个'..API_GetGoodsName(GoodsID)..'）</text><br>')
		end
		API_ResponseFlush(ActorID)
	else
		local ExpJiangLi = math.floor(ExpJiangLi/2)
		if API_ActorRemoveGoods(ActorID,GoodsID,GoodsNum,'过期删除') then
			API_ActorSendMsg(ActorID,8,'非中秋活动期间使用'..API_GetGoodsName(GoodsID)..'，获得'..ExpJiangLi..'经验')
			API_ActorAddExp(ActorID,ExpJiangLi,MidAutumnTaskID,'中秋活动')
		end
	end
	return 1
end

function MidAutumn_YueGuiZhi_GoodsCallFunc2()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local GoodsID = 80857
	local GoodsNum = API_ActorGetGoodsNum(ActorID,GoodsID)
	if GoodsNum < 1 then
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(MidAutumn_StartTime.Year,MidAutumn_StartTime.Month,MidAutumn_StartTime.Day,MidAutumn_StartTime.Hour,MidAutumn_StartTime.Minute,MidAutumn_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(MidAutumn_EndTime.Year,MidAutumn_EndTime.Month,MidAutumn_EndTime.Day,MidAutumn_EndTime.Hour,MidAutumn_EndTime.Minute,MidAutumn_EndTime.Second)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel > 55 then
		ExpLevel = 55
	end
	if ExpLevel < 16 then
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		API_ResponseWrite('<win rect="600,200,330,250"></win>') 
		API_ResponseWrite('<br><text>等级低于16级不能使用</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		if SelectItem == 1 then
			
			local ExpJiangLi = math.floor(MidAutumn_JiFenJiaZhi[ExpLevel].Exp * 5 * GoodsNum)
			local JifenJiangli = 5 * GoodsNum
			local DangQianJiFen = API_VarDataGetNumber(ActorID,1,18439)
			local ZuiHouRiQi = API_VarDataGetNumber(ActorID,1,18440)
			local JinTianJiFen = API_VarDataGetNumber(ActorID,1,18441)
			local ShenYuKeDuiHuan = 6000 - JinTianJiFen
			local JinTian = Year * 10000 + Month * 100 + Day
			if ZuiHouRiQi ~= JinTian then
				ShenYuKeDuiHuan = 6000
				JinTianJiFen = 0
			end
			if JifenJiangli > ShenYuKeDuiHuan then
				JifenJiangli = ShenYuKeDuiHuan
			end
			if API_ActorRemoveGoods(ActorID,GoodsID,GoodsNum,'使用删除') then
				API_ActorAddExp(ActorID,ExpJiangLi,MidAutumnTaskID,'中秋活动')
				if JifenJiangli > 0 then
					DangQianJiFen = DangQianJiFen + JifenJiangli
					API_VarDataSetNumber(ActorID,1,18439,DangQianJiFen)
					API_VarDataSetNumber(ActorID,1,18440,JinTian)
					JinTianJiFen = JinTianJiFen + JifenJiangli
					API_VarDataSetNumber(ActorID,1,18441,JinTianJiFen)
				end
				API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
				API_ResponseWrite('<win rect="600,200,330,250"></win>') 
				if JinTianJiFen > 0 then
					API_ResponseWrite('<br><text>您成功的用'..GoodsNum..'个 '..API_GetGoodsName(GoodsID)..' 兑换了 '..ExpJiangLi..'经验 和 '..JifenJiangli..'点中秋积分</text><br>')
				else
					API_ResponseWrite('<br><text>您成功的用'..GoodsNum..'个 '..API_GetGoodsName(GoodsID)..' 兑换了 '..ExpJiangLi..'经验</text><text color="255,0,0">（您今天可获得的中秋积分已达上限）</text><br>')
				end
				API_ResponseWrite('<br><text color="255,0,255">您当前中秋积分是：'..DangQianJiFen..'</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				--风向标统计数据
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[36][5][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[36][5][LaiYuan] = GoodsNum
				else
					GLOBAL_FengXiangBiao_DateList[36][5][LaiYuan] = GLOBAL_FengXiangBiao_DateList[36][5][LaiYuan] + GoodsNum
				end
			end
		elseif SelectItem == 2 then
			if GoodsNum >= 600 then
				if API_ActorGetPackageSize(ActorID) >= 1 then
					if API_ActorRemoveGoods(ActorID,GoodsID,600,'兑换删除') then
						local ShiZhuID = 11085
						if API_ActorGetPropNum(ActorID,PD_PROP_SEX) == 1 then
							ShiZhuID = 11085
						else
							ShiZhuID = 11083
						end
						API_AddActorGoodsFlag(ActorID,ShiZhuID,1,3,'兑换时装')
						API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
						API_ResponseWrite('<win rect="600,200,330,250"></win>') 
						API_ResponseWrite('<text>您成功的用600个 '..API_GetGoodsName(GoodsID)..' 兑换了 '..API_GetGoodsName(ShiZhuID)..'</text><br><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						--风向标统计数据
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if ShiZhuID == 11085 then
							if GLOBAL_FengXiangBiao_DateList[36][7][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[36][7][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[36][7][LaiYuan] = GLOBAL_FengXiangBiao_DateList[36][7][LaiYuan] + 1
							end
						elseif ShiZhuID == 11083 then
							if GLOBAL_FengXiangBiao_DateList[36][8][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[36][8][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[36][8][LaiYuan] = GLOBAL_FengXiangBiao_DateList[36][8][LaiYuan] + 1
							end
						end
					end
				else
					API_ResponseWrite('<win rect="600,200,330,250"></win>') 
					API_ResponseWrite('<text color="255,0,0">您的背包空间不够</text><br><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			else
				API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
				API_ResponseWrite('<win rect="600,200,330,250"></win>') 
				API_ResponseWrite('<text color="255,0,0">需要600个 '..API_GetGoodsName(GoodsID)..' 才能兑换，您的 '..API_GetGoodsName(GoodsID)..' 数量不够</text><br><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	end
end

--兔子肉使用函数
function MidAutumn_TuZhiRou_GoodsCallFunc(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if GoodsID ~= 80859 then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		return 0
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(MidAutumn_StartTime.Year,MidAutumn_StartTime.Month,MidAutumn_StartTime.Day,MidAutumn_StartTime.Hour,MidAutumn_StartTime.Minute,MidAutumn_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(MidAutumn_EndTime.Year,MidAutumn_EndTime.Month,MidAutumn_EndTime.Day,MidAutumn_EndTime.Hour,MidAutumn_EndTime.Minute,MidAutumn_EndTime.Second)
	local GoodsNum = API_ActorGetGoodsNum(ActorID,GoodsID)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel > 55 then
		ExpLevel = 55
	end
	if ExpLevel < 26 then
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		API_ResponseWrite('<win rect="600,200,330,250"></win>') 
		API_ResponseWrite('<br><text>等级低于26级不能使用</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	local ExpJiangLi = math.floor(MidAutumn_JiFenJiaZhi[ExpLevel].Exp * 200 * GoodsNum)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		--三个选项：兑换经验和积分、兑换桂冠/花冠、关于月兔大作战
		local CrystalJiangLi = math.floor(MidAutumn_JiFenJiaZhi[ExpLevel].Crystal * 200 * GoodsNum)
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		API_ResponseWrite('<win rect="600,200,330,250"></win>') 
		API_ResponseWrite('<br><text>每个兔子肉可兑换200点中秋积分，中秋积分可用于制作月饼</text><br>')
		local ZuiHouRiQi = API_VarDataGetNumber(ActorID,1,18440)
		local JinTianJiFen = API_VarDataGetNumber(ActorID,1,18441)
		local ShenYuKeDuiHuan = 6000 - JinTianJiFen
		local JinTian = Year * 10000 + Month * 100 + Day
		if ZuiHouRiQi ~= JinTian then
			ShenYuKeDuiHuan = 6000
		end
		local KeDuiHuan = 200 * GoodsNum
		if KeDuiHuan > ShenYuKeDuiHuan then
			KeDuiHuan = ShenYuKeDuiHuan
		end
		if KeDuiHuan > 0 then
			API_ResponseWrite('<br><a href="MidAutumn_TuZhiRou_GoodsCallFunc2?1=1">用'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'兑换 '..CrystalJiangLi..'水晶币 和 '..KeDuiHuan..'点中秋积分</a><br>')
		else
			API_ResponseWrite('<br><a href="MidAutumn_TuZhiRou_GoodsCallFunc2?1=1">用'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..'兑换 '..CrystalJiangLi..'水晶币</a><text color="255,0,0">（您今天可获得的中秋积分已达上限）</text><br>')
		end
		API_ResponseWrite('<br><a href="MidAutumn_TuZhiRou_GoodsCallFunc2?1=2">兑换兔子耳朵</a><text>（时装：需要15个'..API_GetGoodsName(GoodsID)..'）</text><br>')
		API_ResponseFlush(ActorID)
	else
		local ExpJiangLi = math.floor(ExpJiangLi/2)
		if API_ActorRemoveGoods(ActorID,GoodsID,GoodsNum,'过期删除') then
			API_ActorSendMsg(ActorID,8,'非中秋活动期间使用'..API_GetGoodsName(GoodsID)..'，获得'..ExpJiangLi..'经验')
			API_ActorAddExp(ActorID,ExpJiangLi,MidAutumnTaskID,'中秋活动')
		end
	end
	return 1
end

function MidAutumn_TuZhiRou_GoodsCallFunc2()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local GoodsID = 80859
	local GoodsNum = API_ActorGetGoodsNum(ActorID,GoodsID)
	if GoodsNum < 1 then
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(MidAutumn_StartTime.Year,MidAutumn_StartTime.Month,MidAutumn_StartTime.Day,MidAutumn_StartTime.Hour,MidAutumn_StartTime.Minute,MidAutumn_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(MidAutumn_EndTime.Year,MidAutumn_EndTime.Month,MidAutumn_EndTime.Day,MidAutumn_EndTime.Hour,MidAutumn_EndTime.Minute,MidAutumn_EndTime.Second)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel > 55 then
		ExpLevel = 55
	end
	if ExpLevel < 26 then
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		API_ResponseWrite('<win rect="600,200,330,250"></win>') 
		API_ResponseWrite('<br><text>等级低于26级不能使用</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		if SelectItem == 1 then
			local CrystalJiangLi = math.floor(MidAutumn_JiFenJiaZhi[ExpLevel].Crystal * 200 * GoodsNum)
			local JifenJiangli = 200 * GoodsNum
			local DangQianJiFen = API_VarDataGetNumber(ActorID,1,18439)
			local ZuiHouRiQi = API_VarDataGetNumber(ActorID,1,18440)
			local JinTianJiFen = API_VarDataGetNumber(ActorID,1,18441)
			local ShenYuKeDuiHuan = 6000 - JinTianJiFen
			local JinTian = Year * 10000 + Month * 100 + Day
			if ZuiHouRiQi ~= JinTian then
				ShenYuKeDuiHuan = 6000
				JinTianJiFen = 0
			end
			if JifenJiangli > ShenYuKeDuiHuan then
				JifenJiangli = ShenYuKeDuiHuan
			end
			if API_ActorRemoveGoods(ActorID,GoodsID,GoodsNum,'使用删除') then
				API_ActorShoppingM_Add(ActorID,CrystalJiangLi,MidAutumnTaskID,'中秋活动')
				if JifenJiangli > 0 then
					DangQianJiFen = DangQianJiFen + JifenJiangli
					API_VarDataSetNumber(ActorID,1,18439,DangQianJiFen)
					API_VarDataSetNumber(ActorID,1,18440,JinTian)
					JinTianJiFen = JinTianJiFen + JifenJiangli
					API_VarDataSetNumber(ActorID,1,18441,JinTianJiFen)
				end
				API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
				API_ResponseWrite('<win rect="600,200,330,250"></win>') 
				if JinTianJiFen > 0 then
					API_ResponseWrite('<br><text>您成功的用'..GoodsNum..'个 '..API_GetGoodsName(GoodsID)..' 兑换了 '..CrystalJiangLi..'水晶币 和 '..JifenJiangli..'点中秋积分</text><br>')
				else
					API_ResponseWrite('<br><text>您成功的用'..GoodsNum..'个 '..API_GetGoodsName(GoodsID)..' 兑换了 '..CrystalJiangLi..'水晶币</text><text color="255,0,0">（您今天可获得的中秋积分已达上限）</text><br>')
				end
				API_ResponseWrite('<br><text color="255,0,255">您当前中秋积分是：'..DangQianJiFen..'</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				--风向标统计数据
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[36][6][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[36][6][LaiYuan] = GoodsNum
				else
					GLOBAL_FengXiangBiao_DateList[36][6][LaiYuan] = GLOBAL_FengXiangBiao_DateList[36][6][LaiYuan] + GoodsNum
				end
			end
		elseif SelectItem == 2 then
			if GoodsNum >= 15 then
				if API_ActorGetPackageSize(ActorID) >= 1 then
					if API_ActorRemoveGoods(ActorID,GoodsID,15,'兑换删除') then
						local ShiZhuID = 11086
						if API_ActorGetPropNum(ActorID,PD_PROP_SEX) == 1 then
							ShiZhuID = 11086
						else
							ShiZhuID = 11084
						end
						API_AddActorGoodsFlag(ActorID,ShiZhuID,1,3,'兑换时装')
						API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
						API_ResponseWrite('<win rect="600,200,330,250"></win>') 
						API_ResponseWrite('<text>您成功的用15个 '..API_GetGoodsName(GoodsID)..' 兑换了 '..API_GetGoodsName(ShiZhuID)..'</text><br><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						--风向标统计数据
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if ShiZhuID == 11086 then
							if GLOBAL_FengXiangBiao_DateList[36][9][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[36][9][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[36][9][LaiYuan] = GLOBAL_FengXiangBiao_DateList[36][9][LaiYuan] + 1
							end
						elseif ShiZhuID == 11084 then
							if GLOBAL_FengXiangBiao_DateList[36][10][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[36][10][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[36][10][LaiYuan] = GLOBAL_FengXiangBiao_DateList[36][10][LaiYuan] + 1
							end
						end
					end
				else
					API_ResponseWrite('<win rect="600,200,330,250"></win>') 
					API_ResponseWrite('<text color="255,0,0">您的背包空间不够</text><br><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			else
				API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
				API_ResponseWrite('<win rect="600,200,330,250"></win>') 
				API_ResponseWrite('<text color="255,0,0">需要15个 '..API_GetGoodsName(GoodsID)..' 才能兑换，您的 '..API_GetGoodsName(GoodsID)..' 数量不够</text><br><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	end
end

--兔子变身糖使用函数
function MidAutumn_TuZhiTangGuo_GoodsCallFunc(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if GoodsID ~= 88163 then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		return 0
	end
	if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用变身糖果') then
		--加状态
		API_ActorAddStatus(ActorID,818001,0)
	end
	return 1
end

if API_GetServerID() < 11 then
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(MidAutumn_StartTime.Year,MidAutumn_StartTime.Month,MidAutumn_StartTime.Day,MidAutumn_StartTime.Hour,MidAutumn_StartTime.Minute,MidAutumn_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(MidAutumn_EndTime.Year,MidAutumn_EndTime.Month,MidAutumn_EndTime.Day,MidAutumn_EndTime.Hour,MidAutumn_EndTime.Minute,MidAutumn_EndTime.Second)
	if nShiFouEnd > 0 then
		if MidAutumn_TimerTriggerID ~= nil then
			API_DestroyTriggerG(MidAutumn_TimerTriggerID)
		end
		MidAutumn_TimerTriggerID = API_CreateTimerTriggerG(0,0,60,-1,'MidAutumn_TimerTriggerGCallFunc')
	end
end

if MidAutumn_YueGuiShuIDlist == nil then
	MidAutumn_YueGuiShuIDlist = {}
end
if MidAutumn_YueTuIDlist == nil then
	MidAutumn_YueTuIDlist = {}
end
if MidAutumn_YueTuTouLingIDlist == nil then
	MidAutumn_YueTuTouLingIDlist = {}
end

if MidAutumn_FenZhangYueGuiShui == nil then
	MidAutumn_FenZhangYueGuiShui = 0
end

if MidAutumn_YueTuDaZuoZhan == nil then
	MidAutumn_YueTuDaZuoZhan = 0
end

function MidAutumn_TimerTriggerGCallFunc(a,b)
	local TimerTriggerID = API_GetCurTriggerID()
	local Time = os.time() 
	local NowTime = os.date("*t", os.time()) 
	NowTime.year = MidAutumn_StartTime.Year 
	NowTime.month = MidAutumn_StartTime.Month 
	NowTime.day = MidAutumn_StartTime.Day 
	NowTime.hour = 0 
	NowTime.min = 0 
	NowTime.sec = 0 
	local StartTime = os.time(NowTime) 
	local XiangChaDay = math.floor((Time - StartTime)/86400) + 1
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(MidAutumn_StartTime.Year,MidAutumn_StartTime.Month,MidAutumn_StartTime.Day,MidAutumn_StartTime.Hour,MidAutumn_StartTime.Minute,MidAutumn_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(MidAutumn_EndTime.Year,MidAutumn_EndTime.Month,MidAutumn_EndTime.Day,MidAutumn_EndTime.Hour,MidAutumn_EndTime.Minute,MidAutumn_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		if Hour >= 13 and Hour <= 21 then
			if XiangChaDay >= 1 then
				local YueGuShuMapIDList = {9,10,23,25}
				for i,v in YueGuShuMapIDList do
					local RightMapID = API_GetRightMapID(v)
					if API_MapIsValid(RightMapID) then
						local PlayNum = 50
						local PlayList = API_GetActorInArea(RightMapID,0,0,0,0,0)
						if PlayList ~= nil then
							PlayNum = table.getn(PlayList)
						end
						local ShuaYueGuiShuNum = 0
						--刷月桂树
						if PlayNum <= 50 then
							ShuaYueGuiShuNum = 100
						elseif PlayNum <= 100 then
							ShuaYueGuiShuNum = 200
						else
							ShuaYueGuiShuNum = PlayNum * 2
						end
						if MidAutumn_YueGuiShuIDlist[RightMapID] == nil then
							MidAutumn_YueGuiShuIDlist[RightMapID] = {}
						end
						for j = 1,ShuaYueGuiShuNum do
							local YueGuiShuUID = MidAutumn_YueGuiShuIDlist[RightMapID][j]
							if YueGuiShuUID == nil or not API_IsExistByUIDEx(YueGuiShuUID) then
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
									local YueGuiShuUID =  API_CreateResBoxEx_UID(RightMapID,TileX,TileY,281,10,'月桂树',3,0,0,0,0)
									MidAutumn_YueGuiShuIDlist[RightMapID][j] = YueGuiShuUID
								end
							end

						end
					end
				end
				--广告
				if MidAutumn_FenZhangYueGuiShui == 0 then
					MidAutumn_FenZhangYueGuiShui = 1
					if API_GetServerID() == 1 then
						API_ActorBroadcastMsg(-1,1,'“疯长的月桂树”活动正式开始，各位玩家前往暗礁海、麦穗平原、阳光雨林、珊瑚群岛砍伐月桂树可获得高额经验与月饼')
						API_ActorBroadcastMsg(-1,17,'“疯长的月桂树”活动正式开始，各位玩家前往暗礁海、麦穗平原、阳光雨林、珊瑚群岛砍伐月桂树可获得高额经验与月饼')
					end
				end
				if API_GetServerID() == 1 and math.mod(Minute,5) == 0 then
					local shijian = math.floor(Minute/5)
					if math.mod(shijian,2) == 0 then
						API_ActorBroadcastMsg(-1,1,'喜迎中秋，“疯长的月桂树”活动火热进行中，前往暗礁海、麦穗平原、阳光雨林、珊瑚群岛砍伐月桂树可获得高额经验与月饼')
						API_ActorBroadcastMsg(-1,17,'喜迎中秋，“疯长的月桂树”活动火热进行中，前往暗礁海、麦穗平原、阳光雨林、珊瑚群岛砍伐月桂树可获得高额经验与月饼')
					end
				end
			end
			
			
			if XiangChaDay >= 2 then
				--刷月兔
				local YueTuMapIDList = {98,99,101}
				for i,v in YueTuMapIDList do
					local RightMapID = API_GetRightMapID(v)
					if API_MapIsValid(RightMapID) then
						local PlayNum = 50
						local PlayList = API_GetActorInArea(RightMapID,0,0,0,0,0)
						if PlayList ~= nil then
							PlayNum = table.getn(PlayList)
						end
						local ShuaYueGuiShuNum = 0
						if PlayNum <= 50 then
							ShuaYueGuiShuNum = 250
						elseif PlayNum <= 100 then
							ShuaYueGuiShuNum = 500
							if v == 101 then
								ShuaYueGuiShuNum = 1000
							end
						else
							ShuaYueGuiShuNum = 500
							if v == 101 then
								ShuaYueGuiShuNum = 1000
							end
							ShuaYueGuiShuNum = (PlayNum - 100) * 5 + ShuaYueGuiShuNum
						end
						if MidAutumn_YueTuIDlist[RightMapID] == nil then
							MidAutumn_YueTuIDlist[RightMapID] = {}
						end
						for j = 1,ShuaYueGuiShuNum do
							local YueTuFastID = MidAutumn_YueTuIDlist[RightMapID][j]
							if YueTuFastID == nil or API_GetMonsterID(YueTuFastID) <= 0 then
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
									local YueTuFastID = API_CreateMonster(RightMapID,726322,TileX,TileY,0,0,-1)
									MidAutumn_YueTuIDlist[RightMapID][j] = YueTuFastID
								end
							end
						end
					end
				end
				--刷月兔头领
				local YueTuMapIDList = {98,99,101}
				for i,v in YueTuMapIDList do
					local RightMapID = API_GetRightMapID(v)
					if API_MapIsValid(RightMapID) then
						local PlayNum = 50
						local PlayList = API_GetActorInArea(RightMapID,0,0,0,0,0)
						if PlayList ~= nil then
							PlayNum = table.getn(PlayList)
						end
						local ShuaYueGuiShuNum = 0
						--刷月桂树
						if PlayNum <= 50 then
							ShuaYueGuiShuNum = 50
						elseif PlayNum <= 100 then
							ShuaYueGuiShuNum = 100
							if v == 101 then
								ShuaYueGuiShuNum = 200
							end
						else
							ShuaYueGuiShuNum = 50
							if v == 101 then
								ShuaYueGuiShuNum = 200
							end
							ShuaYueGuiShuNum = (PlayNum - 100) * 1 + ShuaYueGuiShuNum
						end
						if MidAutumn_YueTuTouLingIDlist[RightMapID] == nil then
							MidAutumn_YueTuTouLingIDlist[RightMapID] = {}
						end
						for j = 1,ShuaYueGuiShuNum do
							local YueTuTouLingFastID = MidAutumn_YueTuTouLingIDlist[RightMapID][j]
							if YueTuTouLingFastID == nil or API_GetMonsterID(YueTuTouLingFastID) <= 0 then
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
									local YueTuTouLingFastID = API_CreateMonster(RightMapID,726323,TileX,TileY,0,0,-1)
									API_CreateDieTriggerG(0,0,0,YueTuTouLingFastID,'MoonFestival_RabbitBossDieFunc')
									MidAutumn_YueTuTouLingIDlist[RightMapID][j] = YueTuTouLingFastID
								end
							end
						end
					end
				end
				--广告
				if MidAutumn_YueTuDaZuoZhan == 0 then
					MidAutumn_YueTuDaZuoZhan = 1
					if API_GetServerID() == 1 then
						API_ActorBroadcastMsg(-1,1,'“月兔大作战”活动正式开始，各位玩家前往娜沙湿地、落日农庄、月暮草场消灭月兔可获得高额水晶币与月饼')
						API_ActorBroadcastMsg(-1,17,'“月兔大作战”活动正式开始，各位玩家前往娜沙湿地、落日农庄、月暮草场消灭月兔可获得高额水晶币与月饼')
					end
				end
				if API_GetServerID() == 1 and math.mod(Minute,5) == 0 then
					local shijian = math.floor(Minute/5)
					if math.mod(shijian,2) == 1 then
						API_ActorBroadcastMsg(-1,1,'喜迎中秋，“月兔大作战”活动火热进行中，前往娜沙湿地、落日农庄、月暮草场消灭月兔可获得高额水晶币与月饼')
						API_ActorBroadcastMsg(-1,17,'喜迎中秋，“月兔大作战”活动火热进行中，前往娜沙湿地、落日农庄、月暮草场消灭月兔可获得高额水晶币与月饼')
					end
				end
			end
			
			
		elseif Hour == 22 then
--			if XiangChaDay >= 3 then
--				if API_GetServerID() == 1 and math.mod(Minute,5) == 0 then
--					API_ActorBroadcastMsg(-1,1,'金秋十月，举国同庆，“月球反击战”活动火热进行中，通过月暮草场的月宫传送门进入月宫，消灭月兔王可获得极品装备与至尊月饼')
--					API_ActorBroadcastMsg(-1,17,'金秋十月，举国同庆，“月球反击战”活动火热进行中，通过月暮草场的月宫传送门进入月宫，消灭月兔王可获得极品装备与至尊月饼')
--				end
--			end
			if MidAutumn_FenZhangYueGuiShui == 1 then
				MidAutumn_FenZhangYueGuiShui = 2
				if API_GetServerID() == 1 then
					API_ActorBroadcastMsg(-1,1,'今天的“疯长的月桂树”活动已经结束')
					API_ActorBroadcastMsg(-1,17,'今天的“疯长的月桂树”活动已经结束')
				end
			end
			if MidAutumn_YueTuDaZuoZhan == 1 then
				MidAutumn_YueTuDaZuoZhan = 2
				if API_GetServerID() == 1 then
					API_ActorBroadcastMsg(-1,1,'今天的“月兔大作战”活动已经结束')
					API_ActorBroadcastMsg(-1,17,'今天的“月兔大作战”活动已经结束')
				end
			end
--		elseif Hour == 21 then
--			if API_GetServerID() == 1 and math.mod(Minute,5) == 0 then
--				API_ActorBroadcastMsg(-1,1,'金秋十月，举国同庆，“中秋猜灯谜”活动火热进行中，前往主城猜对灯谜，可获得高额水晶币与月饼')
--				API_ActorBroadcastMsg(-1,17,'金秋十月，举国同庆，“中秋猜灯谜”活动火热进行中，前往主城猜对灯谜，可获得高额水晶币与月饼')
--			end
		elseif Hour < 13 then
			if API_GetServerID() == 1 and math.mod(Minute,10) == 0 then
				if XiangChaDay >= 3 then
					API_ActorBroadcastMsg(-1,17,'喜迎中秋，“疯长的月桂树（13点）”、“月兔大作战（13点）”等诸多活动轮番举行，至尊大奖等您来拿！')
				--	API_ActorBroadcastMsg(-1,17,'喜迎中秋，“七星伴月”、“疯长的月桂树（19点）”、“月兔大作战（19点）”、“月球反击战（20点）”、“中秋猜灯谜（21点）”等诸多活动轮番举行，至尊大奖等您来拿！')
				--	API_ActorBroadcastMsg(-1,17,'喜迎中秋，“七星伴月”、“疯长的月桂树（19点）”、“月兔大作战（19点）”、“月球反击战（20点）”等诸多活动轮番举行，至尊大奖等您来拿！')
				elseif XiangChaDay >= 2 then
					API_ActorBroadcastMsg(-1,17,'喜迎中秋，“疯长的月桂树（13点）”、“月兔大作战（13点）”等诸多活动轮番举行，至尊大奖等您来拿！')
				--	API_ActorBroadcastMsg(-1,17,'喜迎中秋，“七星伴月”、“疯长的月桂树（19点）”、“月兔大作战（19点）”、“中秋猜灯谜（21点）”等诸多活动轮番举行，至尊大奖等您来拿！（明天还将增加“月球反击战”活动）')
				--	API_ActorBroadcastMsg(-1,17,'喜迎中秋，“七星伴月”、“疯长的月桂树（19点）”、“月兔大作战（19点）”等诸多活动轮番举行，至尊大奖等您来拿！（明天还将增加“月球反击战”活动）')
				elseif XiangChaDay >= 1 then
					API_ActorBroadcastMsg(-1,17,'喜迎中秋，“疯长的月桂树（13点）”、“月兔大作战（13点）”等诸多活动轮番举行，至尊大奖等您来拿！')
				--	API_ActorBroadcastMsg(-1,17,'喜迎中秋，“七星伴月”、“疯长的月桂树（19点）”、“中秋猜灯谜（21点）”等诸多活动轮番举行，至尊大奖等您来拿！（明天还将增加“月兔大作战”活动，后天还将增加“月球反击战”活动）')
				--	API_ActorBroadcastMsg(-1,17,'喜迎中秋，“七星伴月”、“疯长的月桂树（19点）”等诸多活动轮番举行，至尊大奖等您来拿！（明天还将增加“月兔大作战”活动，后天还将增加“月球反击战”活动）')
				end
			end
		else
			--删除活动怪
			if MidAutumn_FenZhangYueGuiShui == 2 then
				MidAutumn_FenZhangYueGuiShui = 0
				for i in MidAutumn_YueGuiShuIDlist do
					for j,v in MidAutumn_YueGuiShuIDlist[i] do
						if API_IsExistByUIDEx(v) then
							local uidHigh,uidLow =API_GetLongOfUID(v)
							API_DestroyByUID(uidHigh,uidLow)
						end
					end
				end
				MidAutumn_YueGuiShuIDlist = {}
			end
			if MidAutumn_YueTuDaZuoZhan == 2 then
				MidAutumn_YueTuDaZuoZhan = 0
				for i in MidAutumn_YueTuIDlist do
					for j,v in MidAutumn_YueTuIDlist[i] do
						if API_GetMonsterID(v) > 0 then
							API_DestroyMonster(v)
						end
					end
				end
				MidAutumn_YueTuIDlist = {}
				for i in MidAutumn_YueTuTouLingIDlist do
					for j,v in MidAutumn_YueTuTouLingIDlist[i] do
						if API_GetMonsterID(v) > 0 then
							API_DestroyMonster(v)
						end
					end
				end
				MidAutumn_YueTuTouLingIDlist = {}
			end
			
		end
	elseif nShiFouStart > 0 then
		--活动还没开始
		--广告
		if API_GetServerID() == 1 and math.mod(Minute,20) == 0 then
		API_ActorBroadcastMsg(-1,17,'为迎接中秋，活动期间，“疯长的月桂树”、“月兔大作战”等诸多活动即将轮番举行，至尊大奖等您来拿！')
		--	API_ActorBroadcastMsg(-1,17,'为迎接中秋，黄金周期间，“七星伴月”、“疯长的月桂树”、“月兔大作战”、“月球反击战”、“中秋猜灯谜”等诸多活动即将轮番举行，至尊大奖等您来拿！')
		--	API_ActorBroadcastMsg(-1,17,'为迎接中秋，黄金周期间，“七星伴月”、“疯长的月桂树”、“月兔大作战”、“月球反击战”等诸多活动即将轮番举行，至尊大奖等您来拿！')
		end
	elseif nShiFouEnd < 0 then
		--活动已经结束
		API_DestroyTriggerG(TimerTriggerID)
	end
end

--积分对应奖励
MidAutumn_JiFenJiaZhi = {
[ 1 ] = {  Exp =  0.3 , Crystal =  0.15 , Money =  0.02  },
[ 2 ] = {  Exp =  0.59 , Crystal =  0.3 , Money =  0.05  },
[ 3 ] = {  Exp =  0.89 , Crystal =  0.44 , Money =  0.07  },
[ 4 ] = {  Exp =  1.18 , Crystal =  0.59 , Money =  0.09  },
[ 5 ] = {  Exp =  1.48 , Crystal =  0.74 , Money =  0.12  },
[ 6 ] = {  Exp =  1.78 , Crystal =  0.89 , Money =  0.14  },
[ 7 ] = {  Exp =  2.07 , Crystal =  1.04 , Money =  0.16  },
[ 8 ] = {  Exp =  2.37 , Crystal =  1.18 , Money =  0.18  },
[ 9 ] = {  Exp =  2.66 , Crystal =  1.33 , Money =  0.21  },
[ 10 ] = {  Exp =  2.96 , Crystal =  1.48 , Money =  0.23  },
[ 11 ] = {  Exp =  3.26 , Crystal =  1.63 , Money =  0.25  },
[ 12 ] = {  Exp =  3.55 , Crystal =  1.78 , Money =  0.28  },
[ 13 ] = {  Exp =  3.85 , Crystal =  1.92 , Money =  0.30  },
[ 14 ] = {  Exp =  4.14 , Crystal =  2.07 , Money =  0.32  },
[ 15 ] = {  Exp =  4.44 , Crystal =  2.22 , Money =  0.35  },
[ 16 ] = {  Exp =  4.74 , Crystal =  2.37 , Money =  0.37  },
[ 17 ] = {  Exp =  5.03 , Crystal =  2.52 , Money =  0.39  },
[ 18 ] = {  Exp =  5.33 , Crystal =  2.66 , Money =  0.41  },
[ 19 ] = {  Exp =  5.62 , Crystal =  2.81 , Money =  0.44  },
[ 20 ] = {  Exp =  5.92 , Crystal =  2.96 , Money =  0.46  },
[ 21 ] = {  Exp =  6.22 , Crystal =  3.11 , Money =  0.48  },
[ 22 ] = {  Exp =  6.51 , Crystal =  3.26 , Money =  0.51  },
[ 23 ] = {  Exp =  6.81 , Crystal =  3.4 , Money =  0.53  },
[ 24 ] = {  Exp =  7.1 , Crystal =  3.55 , Money =  0.55  },
[ 25 ] = {  Exp =  7.4 , Crystal =  3.7 , Money =  0.58  },
[ 26 ] = {  Exp =  9.1 , Crystal =  4.55 , Money =  0.61  },
[ 27 ] = {  Exp =  10.8 , Crystal =  5.4 , Money =  0.65  },
[ 28 ] = {  Exp =  12.5 , Crystal =  6.25 , Money =  0.69  },
[ 29 ] = {  Exp =  14.19 , Crystal =  7.1 , Money =  0.72  },
[ 30 ] = {  Exp =  15.89 , Crystal =  7.95 , Money =  0.76  },
[ 31 ] = {  Exp =  17.59 , Crystal =  8.8 , Money =  0.80  },
[ 32 ] = {  Exp =  19.29 , Crystal =  9.65 , Money =  0.84  },
[ 33 ] = {  Exp =  20.99 , Crystal =  10.49 , Money =  0.87  },
[ 34 ] = {  Exp =  22.69 , Crystal =  11.34 , Money =  0.91  },
[ 35 ] = {  Exp =  24.39 , Crystal =  12.19 , Money =  0.95  },
[ 36 ] = {  Exp =  26.09 , Crystal =  13.04 , Money =  0.99  },
[ 37 ] = {  Exp =  27.78 , Crystal =  13.89 , Money =  1.02  },
[ 38 ] = {  Exp =  29.48 , Crystal =  14.74 , Money =  1.06  },
[ 39 ] = {  Exp =  31.18 , Crystal =  15.59 , Money =  1.10  },
[ 40 ] = {  Exp =  32.88 , Crystal =  16.44 , Money =  1.13  },
[ 41 ] = {  Exp =  34.98 , Crystal =  17.49 , Money =  1.20  },
[ 42 ] = {  Exp =  37.09 , Crystal =  18.54 , Money =  1.27  },
[ 43 ] = {  Exp =  39.19 , Crystal =  19.6 , Money =  1.34  },
[ 44 ] = {  Exp =  41.3 , Crystal =  20.65 , Money =  1.41  },
[ 45 ] = {  Exp =  43.4 , Crystal =  21.7 , Money =  1.47  },
[ 46 ] = {  Exp =  45.5 , Crystal =  22.75 , Money =  1.54  },
[ 47 ] = {  Exp =  47.61 , Crystal =  23.8 , Money =  1.61  },
[ 48 ] = {  Exp =  49.71 , Crystal =  24.86 , Money =  1.68  },
[ 49 ] = {  Exp =  51.82 , Crystal =  25.91 , Money =  1.74  },
[ 50 ] = {  Exp =  53.92 , Crystal =  26.96 , Money =  1.81  },
[ 51 ] = {  Exp =  56.02 , Crystal =  28.01 , Money =  1.88  },
[ 52 ] = {  Exp =  58.13 , Crystal =  29.06 , Money =  1.95  },
[ 53 ] = {  Exp =  60.23 , Crystal =  30.12 , Money =  2.01  },
[ 54 ] = {  Exp =  62.34 , Crystal =  31.17 , Money =  2.08  },
[ 55 ] = {  Exp =  64.44 , Crystal =  32.22 , Money =  2.15  },
}

--中秋月门活动 MoonStrikeBack
--月宫地图ID：	2012
--可进入坐标	60,47
--月兔BOSS：	726324
--月门：		12199
--		12200

MoonStrikeBack_ZhenDoor = 12199
MoonStrikeBack_JiaDoor = 12200
MoonStrikeBack_DelJiFen = 400
MoonStrikeBack_DelPoint = 10

MoonStrikeBack_GoodsTable = {
	[1] = {
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
		{GoodsID=4002,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=4102,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=6602,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=6902,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=8102,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=4302,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=4202,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=4402,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=4502,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=2002,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=3002,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=3902,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=5002,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=5102,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=6702,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=7002,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=8202,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=5302,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=5202,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=5402,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=5502,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=1502,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=6002,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=6102,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=6802,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=8002,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=8302,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=6302,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=6202,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=6402,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=6502,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=1002,GoodsNum=1,GaiLv=31250,PinZhi=3},
		{GoodsID=782,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=782,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=782,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=782,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=782,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=782,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=80181,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80181,GoodsNum=1,GaiLv=500000,PinZhi=0},
		{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=40003,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40013,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40023,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40033,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40043,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40053,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40063,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40073,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40083,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40093,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40103,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40113,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40123,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40133,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40204,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40220,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40236,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40252,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=40268,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=796,GoodsNum=1,GaiLv=1000000,PinZhi=0},
	},
	[2] = {
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=600000,PinZhi=0},
		{GoodsID=80382,GoodsNum=1,GaiLv=600000,PinZhi=0},
		{GoodsID=80196,GoodsNum=1,GaiLv=1000000,PinZhi=0},
		{GoodsID=80196,GoodsNum=1,GaiLv=800000,PinZhi=0},
		{GoodsID=80196,GoodsNum=1,GaiLv=600000,PinZhi=0},
		{GoodsID=88161,GoodsNum=1,GaiLv=50000,PinZhi=0},
		{GoodsID=88161,GoodsNum=1,GaiLv=50000,PinZhi=0},
		{GoodsID=31023,GoodsNum=1,GaiLv=10000,PinZhi=0},
	},
}

if MoonStrikeBack_GoodsMaxNumTable == nil then
	MoonStrikeBack_GoodsMaxNumTable = {
		[88163] = {GoodsNum=1,GaiLv=500000,Num=0,MaxNum=999},
		[88162] = {GoodsNum=1,GaiLv=1000000,Num=0,MaxNum=999},
		[88162] = {GoodsNum=1,GaiLv=1000000,Num=0,MaxNum=999},
		[31023] = {GoodsNum=1,GaiLv=100000,Num=0,MaxNum=999},
		[31020] = {GoodsNum=1,GaiLv=1000,Num=0,MaxNum=1},
		[31021] = {GoodsNum=1,GaiLv=1000,Num=0,MaxNum=1},
		[80621] = {GoodsNum=1,GaiLv=1000000,Num=0,MaxNum=100},
		[88065] = {GoodsNum=1,GaiLv=100000,Num=0,MaxNum=10},
		[10940] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
		[10941] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
		[10902] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
		[10903] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
		[9507] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
		[31101] = {GoodsNum=1,GaiLv=500000,Num=0,MaxNum=50},
		[785] = {GoodsNum=1,GaiLv=200000,Num=0,MaxNum=20},
	}
end

--门的表名字
if MoonStrikeBack_DoorTable == nil then
	MoonStrikeBack_DoorTable = {}
end

--临时物品表
if MoonStrikeBack_LinShiTable == nil then
	MoonStrikeBack_LinShiTable = {}
end

--活动时间表
MoonStrikeBack_ActTime = {
	[1] = {RedayTime=19,StartTime=20,EndTime=21},
}

if MoonStrikeBack_CreateDoorTriggerID ~= nil then
	API_DestroyTriggerG(MoonStrikeBack_CreateDoorTriggerID)
	MoonStrikeBack_CreateDoorTriggerID = nil
end

if MoonStrikeBack_ActFunc ~= nil then
	API_DestroyTriggerG(MoonStrikeBack_ActFunc)
	MoonStrikeBack_ActFunc = nil
end

MoonStrikeBack_Start = 0
MoonStrikeBack_CreateDoorTriggerID = nil

--if not API_IsEctypeServer() or API_IsBranchServer() then
--	MoonStrikeBack_ActFunc = MoonStrikeBack_ActFunc or API_CreateTimerTriggerG(0,0,60,-1,'MoonStrikeBack_ActTimeFunc')
--end

MoonStrikeBack_MapTable = {
	[98] = {ServerID=6,ZhenNum=2,JiaNum=35,x1=177,y1=181,x2=578,y2=559,x3=326,y3=319,x4=442,y4=441},
	[99] = {ServerID=7,ZhenNum=2,JiaNum=35,x1=180,y1=110,x2=570,y2=612,x3=348,y3=343,x4=399,y4=397},
	[101] = {ServerID=8,ZhenNum=4,JiaNum=70,x1=282,y1=211,x2=620,y2=590,x3=423,y3=437,x4=443,y4=457},
}

function MoonStrikeBack_ActTimeFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	--获取现在是活动开始时间的第几天
	local Time = os.time() 
	local NowTime = os.date("*t", os.time()) 
	NowTime.year = MidAutumn_StartTime.Year 
	NowTime.month = MidAutumn_StartTime.Month 
	NowTime.day = MidAutumn_StartTime.Day 
	NowTime.hour = 0 
	NowTime.min = 0 
	NowTime.sec = 0 
	local StartTime = os.time(NowTime) 
	local NowDay = math.floor((Time - StartTime)/86400) + 1 
	if NowDay > 2 and NowDay < 8 then
		local RedayTime,StartTime,EndTime = 0,0,0
		for i = 1,table.getn(MoonStrikeBack_ActTime) do
			local RT = MoonStrikeBack_ActTime[i].RedayTime
			local ST = MoonStrikeBack_ActTime[i].StartTime
			local ET = MoonStrikeBack_ActTime[i].EndTime
			if Hour >= RT and Hour < ET then
				RedayTime,StartTime,EndTime = RT,ST,ET
			end
		end
		if RedayTime ~= 0 and StartTime ~= 0 and EndTime ~= 0 then
			--开始刷门
			if Hour == (StartTime - 1) and Minute >= 30 then
				MoonStrikeBack_Start = 0
				if math.mod(Minute,10) == 0 then
					API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 17, '月球反击战活动于'..StartTime..'：00--'..EndTime..'：00在落日农庄、娜纱湿地和月暮草场举行，欢迎各位英雄踊跃参与！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 8, '月球反击战活动于'..StartTime..'：00--'..EndTime..'：00在落日农庄、娜纱湿地和月暮草场举行，欢迎各位英雄踊跃参与！')
				end
			end
			if Hour >= StartTime and Hour < EndTime then
				if MoonStrikeBack_Start == nil or MoonStrikeBack_Start < 1 then
					MoonStrikeBack_Start = 1
					MoonStrikeBack_CreateDoorFunc()
					API_CreateTimerTriggerG(0,0,600,5,'MoonStrikeBack_CreateDoorFunc')
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17, '月球反击战活动现在开始！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8, '月球反击战活动现在开始！')
				end
				if math.mod(Minute,10) == 0 then
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17, '月球反击战活动正在落日农庄、娜纱湿地和月暮草场举行！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8, '月球反击战活动正在落日农庄、娜纱湿地和月暮草场举行！')
				end
			end
			if Hour == (EndTime - 1) and Minute >= 45 then
				if math.mod(Minute,5) == 0 then
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17, '请注意，月球反击战活动将在'..EndTime..'点结束！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8, '请注意，月球反击战活动将在'..EndTime..'点结束！')
				end
			end
			if Hour == (EndTime - 1) and Minute == 59 then
				if MoonStrikeBack_Start == nil or MoonStrikeBack_Start < 2 then
					MoonStrikeBack_Start = 2
					local EndTime2 = EndTime + 1
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17, '月球反击战活动已经结束！月宫传送门将在'..EndTime2..'点消失！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8, '月球反击战活动已经结束！月宫传送门将在'..EndTime2..'点消失！')
				end
			end
		end
		if Hour == 23 and Minute == 0 then
			for j in MoonStrikeBack_DoorTable do
				local FastID = MoonStrikeBack_DoorTable[j]
				if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
					API_DestroyMonster(FastID)
					MoonStrikeBack_DoorTable[j] = nil
				end
			end
		end
		if Hour == 23 and Minute == 30 then
			for j in MoonStrikeBack_GoodsMaxNumTable do
				MoonStrikeBack_GoodsMaxNumTable[j].Num = 0
			end
			MoonFestival_RabbitBossMaxGoodsTab.ZBNum = 0
			MoonFestival_RabbitBossMaxGoodsTab.YBNum = 0
		end
	end
end


function MoonStrikeBack_CreateDoorFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local Time = os.time() 
	local NowTime = os.date("*t", os.time()) 
	NowTime.year = MidAutumn_StartTime.Year 
	NowTime.month = MidAutumn_StartTime.Month 
	NowTime.day = MidAutumn_StartTime.Day 
	NowTime.hour = 0 
	NowTime.min = 0 
	NowTime.sec = 0 
	local StartTime = os.time(NowTime) 
	local NowDay = math.floor((Time - StartTime)/86400) + 1 
	if NowDay > 2 and NowDay < 8 then
		local RedayTime,StartTime,EndTime = 0,0,0
		for i = 1,table.getn(MoonStrikeBack_ActTime) do
			local RT = MoonStrikeBack_ActTime[i].RedayTime
			local ST = MoonStrikeBack_ActTime[i].StartTime
			local ET = MoonStrikeBack_ActTime[i].EndTime
			if Hour >= RT and Hour < ET then
				RedayTime,StartTime,EndTime = RT,ST,ET
			end
		end
		if RedayTime ~= 0 and StartTime ~= 0 and EndTime ~= 0 then
			if Hour >= StartTime and Hour < EndTime then
				local ZhenDoor = MoonStrikeBack_ZhenDoor
				local JiaDoor = MoonStrikeBack_JiaDoor
				for j in MoonStrikeBack_MapTable do
					local ServerID = MoonStrikeBack_MapTable[j].ServerID
					if API_GetServerID() == ServerID then
						local MapID = API_GetRightMapID(j)
						local ZhenNum = MoonStrikeBack_MapTable[j].ZhenNum
						local JiaNum = MoonStrikeBack_MapTable[j].JiaNum
						local x1 = MoonStrikeBack_MapTable[j].x1
						local y1 = MoonStrikeBack_MapTable[j].y1
						local x2 = MoonStrikeBack_MapTable[j].x2
						local y2 = MoonStrikeBack_MapTable[j].y2
						local x3 = MoonStrikeBack_MapTable[j].x3
						local y3 = MoonStrikeBack_MapTable[j].y3
						local x4 = MoonStrikeBack_MapTable[j].x4
						local y4 = MoonStrikeBack_MapTable[j].y4
						for i = 1,ZhenNum do
							local x,y
							local Num = 0
							repeat
								Num = Num + 1
								x = math.random(x1,x2)
								y = math.random(y1,y2)
							until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
							if not API_IsBlockTile(MapID,x,y,0) then
								local FastID = API_CreateMonster(MapID,ZhenDoor,x,y,5,0,-1)
								API_SetMonsterName(FastID, '月宫传送门', 1)
								table.insert(MoonStrikeBack_DoorTable,FastID)
							end
						end
						for i = 1,JiaNum do
							local x,y
							local Num = 0
							repeat
								Num = Num + 1
								x = math.random(x1,x2)
								y = math.random(y1,y2)
							until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
							if not API_IsBlockTile(MapID,x,y,0) then
								local FastID = API_CreateMonsterEx(MapID,JiaDoor,x,y,5,0,-1,1)
								API_SetMonsterName(FastID, '月宫传送门', 1)
								table.insert(MoonStrikeBack_DoorTable,FastID)
							end
						end
						API_ActorBroadcastMsgEx(MapID,-1,0,17,'月宫传送门出现了！')
						API_ActorBroadcastMsgEx(MapID,-1,0,8,'月宫传送门出现了！')
					end
				end
			end
		end
	end
end

--点击门的操作，判断是真的还是假的
function MoonStrikeBack_DoorMove(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local Time = API_VarDataGetNumber(ActorID,0,19033)
	if API_GetMonsterID(NPCFastID) <= 0 then
		return
	end
	if Time > 0 then
		API_ActorSendMsg(ActorID,10,'你还需要'..Time..'秒后才能继续使用月宫传送门')
		return
	end
	if XuanZe == 1 then
		local XuanZe2 = API_RequestGetNumber(2)
		local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID) 
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 and API_GetTeamLeader(TeamID) == ActorID then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) then
					if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>快递中，无法进入月宫传送门！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return 
					end
					if API_ActorFindStatus(TeamActorID,519) then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>摆摊中，无法进入月宫传送门！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return 
					end
					if API_ActorIsDying(TeamActorID) then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>死亡，无法进入月宫传送门！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return 
					end
					if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>在公交车上无法进入月宫传送门！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return
					end
				end
			end
			if XuanZe2 == 1 then
				local NeedJifen = MoonStrikeBack_DelJiFen
				if API_ActorHaveEquip(ActorID, 11083) or API_ActorHaveEquip(ActorID, 11084) or API_ActorHaveEquip(ActorID, 11085) or API_ActorHaveEquip(ActorID, 11086) then
					NeedJifen = MoonStrikeBack_DelJiFen / 2
				end
				local PlayJiFen = API_VarDataGetNumber(ActorID,1,18439)
				if PlayJiFen < NeedJifen then
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text>你的积分不足'..NeedJifen..'，无法使用月宫传送门！</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)
					return
				end
				PlayJiFen = PlayJiFen - NeedJifen
				API_VarDataSetNumber(ActorID,1,18439,PlayJiFen)
				API_ActorSendMsg(ActorID,10,'使用月宫传送门扣除'..NeedJifen..'积分')
			else
				local PlayPoint = API_ActorGetPropNum(ActorID,183)
				if PlayPoint < MoonStrikeBack_DelPoint then
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text>你的点券不足'..MoonStrikeBack_DelPoint..'，无法使用月宫传送门！</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)
					return
				end
				if API_UsePoint(ActorID,3,NPCID,1,MoonStrikeBack_DelPoint) == 0 then
					API_ActorSendMsg(ActorID,10,'使用月宫传送门扣除'..MoonStrikeBack_DelPoint..'点券')
					--风向标统计数据
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[36][13][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[36][13][LaiYuan] = MoonStrikeBack_DelPoint
					else
						GLOBAL_FengXiangBiao_DateList[36][13][LaiYuan] = GLOBAL_FengXiangBiao_DateList[36][13][LaiYuan] + MoonStrikeBack_DelPoint
					end
				else
					return
				end
			end
			local MapID = API_GetActorMapID(ActorID)
			local MapConfigID = API_GetMapConfigID(MapID)
			local ObjectMapID = API_CreateEctype(2012,0)
			if NPCID == MoonStrikeBack_ZhenDoor then
				API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.Peerage,1)
			else
				API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.Peerage,2)
			end
			API_CreateMonster(ObjectMapID,11607,59,42,3,0,-1)
			MoonStrikeBack_Initialization(ObjectMapID)
			API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'MoonStrikeBack_PlayGotoMap')
			API_DestroyMonster(NPCFastID)
			MoonStrikeBack_DoorTable[NPCFastID] = nil
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>月宫传送门必须拥有队长权限才可以打开，并且因为怪物的凶狠，需要你的队伍人数至少两人才能进入。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	else
		API_ResponseWrite('<name></name>') 
		API_ResponseWrite('<br><text>凶狠的月兔，就隐藏在月宫传送门的后面，前往消灭它们将获得丰厚的奖励。</text><br>') 
		API_ResponseWrite('<br><text>月宫传送门必须拥有队长权限才可以打开，并且因为怪物的凶狠，需要你的队伍人数至少两人才能进入。</text><br>') 
		API_ResponseWrite('<br><text color="255,0,0">如果装备了中秋节时装，选择消耗积分进入时只需消耗一半的积分。</text><br>') 
		API_ResponseWrite('<br><br><a href="MoonStrikeBack_DoorMove?1=1&2=1">消耗积分进入</a><text color="255,0,0">    需要 '..MoonStrikeBack_DelJiFen..' 积分</text><br>') 
		API_ResponseWrite('<br><a href="MoonStrikeBack_DoorMove?1=1&2=2">消耗点券进入</a><text color="255,0,0">    需要 '..MoonStrikeBack_DelPoint..' 点券</text><br>') 
		API_ResponseWrite('<br><a>关闭</a><br>') 
	end
	API_ResponseFlush(ActorID)
end

function MoonStrikeBack_Initialization(ObjectMapID)
	--创建BOSS
	local FastID = API_CreateMonster(ObjectMapID,726324,58,75,5,0,-1)
	API_CreateDieTriggerG(ObjectMapID,0,0,FastID,'MoonStrikeBack_BossDieFunc')
end

function MoonStrikeBack_PlayGotoMap(ObjectMapID,ActorID)
	--判断是否有队伍，是的话一起传进去
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorIsOnline(ActorID) then
		local MapID = API_GetActorMapID(ActorID)
		local MapConfigID = API_GetMapConfigID(MapID)
		--判断组队
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID then
					API_ActorGoToMap(TeamActorID,ObjectMapID,60,47)
					API_VarDataSetNumber(TeamActorID,0,19033,10)
					API_CreateTimerTrigger(TeamActorID,1,10,-1,'MoonStrikeBacke_DoorLengQueFunc')
				end
			end
		end
	end
end

function MoonStrikeBacke_DoorLengQueFunc(ActorID,b)
	if API_ActorIsOnline(ActorID) then 
		local Time = API_VarDataGetNumber(ActorID,0,19033)
		Time = Time -1
		API_VarDataSetNumber(ActorID,0,19033,Time)
	end
end

--BOSS死亡回调
function MoonStrikeBack_BossDieFunc(MapID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if MapID <= 0 then
		return
	end
	if not API_MapIsValid(MapID) then
		return
	end
	local ZhenJia = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
	local x1,y1,x2,y2 = 47,59,76,80
	if ZhenJia == 1 then
		local GDNum = 0
		for j in MoonStrikeBack_GoodsTable[ZhenJia] do
			local RD = math.random(1000000)
			local GoodsID = MoonStrikeBack_GoodsTable[ZhenJia][j].GoodsID
			local GoodsNum = MoonStrikeBack_GoodsTable[ZhenJia][j].GoodsNum
			local GaiLv = MoonStrikeBack_GoodsTable[ZhenJia][j].GaiLv
			local PinZhi = MoonStrikeBack_GoodsTable[ZhenJia][j].PinZhi
			if RD <= GaiLv then
				local x,y
				local Num = 0
				repeat
					Num = Num + 1
					x = math.random(x1,x2)
					y = math.random(y1,y2)
				until not API_IsBlockTile(MapID,x,y,0) or Num == 100
				if not API_IsBlockTile(MapID,x,y,0) then
					GDNum = GDNum + 1
					if PinZhi > 0 then
						API_CreateDropGoodsEx(MapID,x,y,GoodsID,GoodsNum,0,'月球反击战掉特殊物品',4,0,600,0,PinZhi)
					else
						API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'月球反击战掉特殊物品',4,0,600,0)
					end
				end
			end
		end
		MoonStrikeBack_LinShiTable[KillerID] = {}
		for j in MoonStrikeBack_GoodsMaxNumTable do
			local RD = math.random(1000000)
			local GoodsID = j
			local GoodsNum = MoonStrikeBack_GoodsMaxNumTable[j].GoodsNum
			local GaiLv = MoonStrikeBack_GoodsMaxNumTable[j].GaiLv
			local Num = MoonStrikeBack_GoodsMaxNumTable[j].Num
			local MaxNum = MoonStrikeBack_GoodsMaxNumTable[j].MaxNum
			if Num < MaxNum then
				if RD <= GaiLv then
					local x,y
					local Num2 = 0
					repeat
						Num2 = Num2 + 1
						x = math.random(x1,x2)
						y = math.random(y1,y2)
					until not API_IsBlockTile(MapID,x,y,0) or Num2 == 100
					if not API_IsBlockTile(MapID,x,y,0) then
						API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'月球反击战掉特殊物品',4,0,600,0)
						Num = Num + GoodsNum
						MoonStrikeBack_GoodsMaxNumTable[j].Num = Num
						table.insert(MoonStrikeBack_LinShiTable[KillerID],GoodsID)
					end
				end
			end
		end
		local BC = table.getn(MoonStrikeBack_LinShiTable[KillerID])
		if BC > 0 then
			local LSGD = ''
			for j,v in MoonStrikeBack_LinShiTable[KillerID] do
				if j ~= BC then
					LSGD = LSGD..''..API_GetGoodsName(v)..'、'
				elseif j == BC then
					LSGD = LSGD..''..API_GetGoodsName(v)..''
				end
			end
			API_ActorBroadcastMsgEx(-1,-1,0,17,''..API_GetActorName(KillerID)..'带领的队伍击败'..API_GetMonsterNameByID(MonsterID)..'（大爆'..GDNum..'堆奖励），获得了'..LSGD..'！')
			API_ActorBroadcastMsgEx(-1,-1,0,7,''..API_GetActorName(KillerID)..'带领的队伍击败'..API_GetMonsterNameByID(MonsterID)..'（大爆'..GDNum..'堆奖励），获得了'..LSGD..'！')
		else
			API_ActorBroadcastMsgEx(-1,-1,0,17,''..API_GetActorName(KillerID)..'带领的队伍击败'..API_GetMonsterNameByID(MonsterID)..'（大爆'..GDNum..'堆奖励）！')
			API_ActorBroadcastMsgEx(-1,-1,0,7,''..API_GetActorName(KillerID)..'带领的队伍击败'..API_GetMonsterNameByID(MonsterID)..'（大爆'..GDNum..'堆奖励）！')
		end
		MoonStrikeBack_LinShiTable[KillerID] = nil
	elseif ZhenJia == 2 or ZhenJia == 0 then
		if ZhenJia == 0 then
			ZhenJia = 2
		end
		for j in MoonStrikeBack_GoodsTable[ZhenJia] do
			local RD = math.random(1000000)
			local GoodsID = MoonStrikeBack_GoodsTable[ZhenJia][j].GoodsID
			local GoodsNum = MoonStrikeBack_GoodsTable[ZhenJia][j].GoodsNum
			local GaiLv = MoonStrikeBack_GoodsTable[ZhenJia][j].GaiLv
			if RD <= GaiLv then
				local x,y
				local Num = 0
				repeat
					Num = Num + 1
					x = math.random(x1,x2)
					y = math.random(y1,y2)
				until not API_IsBlockTile(MapID,x,y,0) or Num == 100
				if not API_IsBlockTile(MapID,x,y,0) then
					API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'月球反击战掉特殊物品',4,0,600,0)
				end
			end
		end
		API_ActorBroadcastMsg(DynamicMapID, 17, '原来这个'..API_GetMonsterNameByID(MonsterID)..'是普通怪物伪装的，抓紧时间再去消灭下一个'..API_GetMonsterNameByID(MonsterID)..'吧，加油！')
		API_ActorBroadcastMsg(DynamicMapID, 8, '原来这个'..API_GetMonsterNameByID(MonsterID)..'是普通怪物伪装的，抓紧时间再去消灭下一个'..API_GetMonsterNameByID(MonsterID)..'吧，加油！')
		--API_ActorCallBack(DynamicMapID, 0, -1, 'MoonStrikeBack_BossDieSay')
	end
end

function MoonStrikeBack_BossDieSay(ActorID)
	API_ResponseWrite('<name></name>')
	API_ResponseWrite('<br><text>很遗憾，这个BOSS是普通怪物伪装的，抓紧时间再去挑战下一个BOSS吧，极品奖励在等着你！</text><br>')
	API_ResponseWrite('<br><a>确定</a>')
	API_ResponseFlush(ActorID)
end

MoonFestival_RabbitBossGoodsTab = {
	{GoodsID=4002,GaiLv1=1,GaiLv2=31250,Num=1,PinZhi=2},
	{GoodsID=4102,GaiLv1=31251,GaiLv2=62500,Num=1,PinZhi=2},
	{GoodsID=6602,GaiLv1=62501,GaiLv2=93750,Num=1,PinZhi=2},
	{GoodsID=6902,GaiLv1=93751,GaiLv2=125000,Num=1,PinZhi=2},
	{GoodsID=8102,GaiLv1=125001,GaiLv2=156250,Num=1,PinZhi=2},
	{GoodsID=4302,GaiLv1=156251,GaiLv2=187500,Num=1,PinZhi=2},
	{GoodsID=4202,GaiLv1=187501,GaiLv2=218750,Num=1,PinZhi=2},
	{GoodsID=4402,GaiLv1=218751,GaiLv2=250000,Num=1,PinZhi=2},
	{GoodsID=4502,GaiLv1=250001,GaiLv2=281250,Num=1,PinZhi=2},
	{GoodsID=2002,GaiLv1=281251,GaiLv2=312500,Num=1,PinZhi=2},
	{GoodsID=3002,GaiLv1=312501,GaiLv2=343750,Num=1,PinZhi=2},
	{GoodsID=3902,GaiLv1=343751,GaiLv2=375000,Num=1,PinZhi=2},
	{GoodsID=5002,GaiLv1=375001,GaiLv2=406250,Num=1,PinZhi=2},
	{GoodsID=5102,GaiLv1=406251,GaiLv2=437500,Num=1,PinZhi=2},
	{GoodsID=6702,GaiLv1=437501,GaiLv2=468750,Num=1,PinZhi=2},
	{GoodsID=7002,GaiLv1=468751,GaiLv2=500000,Num=1,PinZhi=2},
	{GoodsID=8202,GaiLv1=500001,GaiLv2=531250,Num=1,PinZhi=2},
	{GoodsID=5302,GaiLv1=531251,GaiLv2=562500,Num=1,PinZhi=2},
	{GoodsID=5202,GaiLv1=562501,GaiLv2=593750,Num=1,PinZhi=2},
	{GoodsID=5402,GaiLv1=593751,GaiLv2=625000,Num=1,PinZhi=2},
	{GoodsID=5502,GaiLv1=625001,GaiLv2=656250,Num=1,PinZhi=2},
	{GoodsID=1502,GaiLv1=656251,GaiLv2=687500,Num=1,PinZhi=2},
	{GoodsID=6002,GaiLv1=687501,GaiLv2=718750,Num=1,PinZhi=2},
	{GoodsID=6102,GaiLv1=718751,GaiLv2=750000,Num=1,PinZhi=2},
	{GoodsID=6802,GaiLv1=750001,GaiLv2=781250,Num=1,PinZhi=2},
	{GoodsID=8002,GaiLv1=781251,GaiLv2=812500,Num=1,PinZhi=2},
	{GoodsID=8302,GaiLv1=812501,GaiLv2=843750,Num=1,PinZhi=2},
	{GoodsID=6302,GaiLv1=843751,GaiLv2=875000,Num=1,PinZhi=2},
	{GoodsID=6202,GaiLv1=875001,GaiLv2=906250,Num=1,PinZhi=2},
	{GoodsID=6402,GaiLv1=906251,GaiLv2=937500,Num=1,PinZhi=2},
	{GoodsID=6502,GaiLv1=937501,GaiLv2=968750,Num=1,PinZhi=2},
	{GoodsID=1002,GaiLv1=968751,GaiLv2=1000000,Num=1,PinZhi=2},
}

if MoonFestival_RabbitBossMaxGoodsTab == nil then
	if API_GetServerID() == 8 then
		MoonFestival_RabbitBossMaxGoodsTab = {ZBNum=0,ZBMaxNum=2400,YBNum=0,YBMaxNum=600}
	else
		MoonFestival_RabbitBossMaxGoodsTab = {ZBNum=0,ZBMaxNum=1200,YBNum=0,YBMaxNum=300}
	end
end

--小月饼模具
MoonFestival_YueBingMuJu = {[1]=88154,[2]=88155,[3]=88156,[4]=88157,[5]=88158,[6]=88159,[7]=88160,}
--月桂精掉落表
MoonFestival_YueGuiJingGoods = {4001,4101,6601,6901,8101,4301,4201,4401,4501,2001,3001,3901,5001,5101,6701,7001,8201,5301,5201,5401,5501,1501,6001,6101,6801,8001,8301,6301,6201,6401,6501,1001,}
--月桂精掉落
function MoonFestival_YueGuiJingDieFunc(ZhuRenID,b,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if KillerType and KillerID == -1 then
		return
	end
	local ShiQuID = 0
	local ShiQuLeiXing = 0
	local ShiQuID2 = 0
	local ShiQuLeiXing2 = 4
	if API_ActorIsOnline(ZhuRenID) then
		ShiQuID = ZhuRenID
		ShiQuID2 = ZhuRenID
	else
		ShiQuID = KillerID
		ShiQuID2 = KillerID
	end
	--获取现在是活动开始时间的第几天
	local Time = os.time() 
	local NowTime = os.date("*t", os.time()) 
	NowTime.year = MidAutumn_StartTime.Year 
	NowTime.month = MidAutumn_StartTime.Month 
	NowTime.day = MidAutumn_StartTime.Day 
	NowTime.hour = 0 
	NowTime.min = 0 
	NowTime.sec = 0 
	local StartTime = os.time(NowTime) 
	local Day = math.floor((Time - StartTime)/86400) + 1 
	if Day > 7 then
		Day = 7
	elseif Day <= 0 then
		Day = 1
	end
--	local YueBing = MoonFestival_YueBingMuJu[math.random(1,Day)]
--	API_CreateDropGoods(DynamicMapID,PosX,PosY,YueBing,1,0,'月桂精掉落物品',ShiQuLeiXing,ShiQuID,600,120)
	local RD1 = math.random(10000)
	if RD1 <= 500 then
		API_CreateDropGoods(DynamicMapID,PosX,PosY,88957,1,0,'月桂精掉落物品',ShiQuLeiXing,ShiQuID,600,120)		
	end
	local RD2 = math.random(10000)
	if RD2 <= 5000 then
		API_CreateDropGoods(DynamicMapID,PosX,PosY,88961,1,0,'月桂精掉落物品',ShiQuLeiXing,ShiQuID,600,120)		
	end	
	local GoodsID = MoonFestival_YueGuiJingGoods[math.random(table.getn(MoonFestival_YueGuiJingGoods))]
	API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,1,0,'月桂精掉落物品',ShiQuLeiXing2,ShiQuID2,600,120,2)
end
--月兔首领掉落
function MoonFestival_RabbitBossDieFunc(a,b,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY,ShiQuLeiXing,ShiQuID)
	if KillerType and KillerID == -1 then
		return
	end
	local ZBNum = MoonFestival_RabbitBossMaxGoodsTab.ZBNum
	local ZBMaxNum = MoonFestival_RabbitBossMaxGoodsTab.ZBMaxNum
	local YBNum = MoonFestival_RabbitBossMaxGoodsTab.YBNum
	local YBMaxNum = MoonFestival_RabbitBossMaxGoodsTab.YBMaxNum
	local Random = math.random(100)
	if Random <= 20 then
		if ZBNum < ZBMaxNum then
			local GaiLv = math.random(1000000)
			for j in MoonFestival_RabbitBossGoodsTab do
				local GaiLv1 = MoonFestival_RabbitBossGoodsTab[j].GaiLv1
				local GaiLv2 = MoonFestival_RabbitBossGoodsTab[j].GaiLv2
				if GaiLv >= GaiLv1 and GaiLv <= GaiLv2 then
					local GoodsID = MoonFestival_RabbitBossGoodsTab[j].GoodsID
					local Num = MoonFestival_RabbitBossGoodsTab[j].Num
					local PinZhi = MoonFestival_RabbitBossGoodsTab[j].PinZhi
					ZBNum = ZBNum + 1
					MoonFestival_RabbitBossMaxGoodsTab.ZBNum = ZBNum
					API_CreateDropGoodsEx(DynamicMapID,PosX,PosY,GoodsID,Num,0,'月兔队长掉落物品',ShiQuLeiXing,ShiQuID,600,120,PinZhi)
				end
			end
		end
	end
	local RD1 = math.random(10000)
	if RD1 <= 500 then
		API_CreateDropGoods(DynamicMapID,PosX,PosY,88957,1,0,'月兔队长掉落物品',ShiQuLeiXing,ShiQuID,600,120)		
	end
	local RD2 = math.random(10000)
	if RD2 <= 2000 then
		API_CreateDropGoods(DynamicMapID,PosX,PosY,88961,1,0,'月兔队长掉落物品',ShiQuLeiXing,ShiQuID,600,120)		
	end	
--	local RD = math.random(100)
--	if RD <= 5 then
--		--获取现在是活动开始时间的第几天
--		local Time = os.time() 
--		local NowTime = os.date("*t", os.time()) 
--		NowTime.year = MidAutumn_StartTime.Year 
--		NowTime.month = MidAutumn_StartTime.Month 
--		NowTime.day = MidAutumn_StartTime.Day 
--		NowTime.hour = 0 
--		NowTime.min = 0 
--		NowTime.sec = 0 
--		local StartTime = os.time(NowTime) 
--		local Day = math.floor((Time - StartTime)/86400) + 1 
--		if Day > 7 then
--			Day = 7
--		elseif Day <= 0 then
--			Day = 1
--		end
--		local YueBing = MoonFestival_YueBingMuJu[math.random(1,Day)]
--		API_CreateDropGoods(DynamicMapID,PosX,PosY,YueBing,1,0,'月兔队长掉落物品',ShiQuLeiXing,ShiQuID,600,120)
--	end
end

--上线处理
function MidAutumn_OnLogin()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if MapID == StaticMapID then
		local nType = API_VarDataGetNumber(ActorID, 0, 18368)
		local ExpLevel = API_GetActorExpLevel(ActorID)
		if nType == 1 and ExpLevel > 10 then
			local nShiFouEnd = API_DiffDatatime(MidAutumn_EndTime.Year,MidAutumn_EndTime.Month,MidAutumn_EndTime.Day,MidAutumn_EndTime.Hour,MidAutumn_EndTime.Minute,MidAutumn_EndTime.Second)
			if nShiFouEnd > 0 then
				API_RemoveTaskScroll(ActorID,4)
				API_AddTaskScrollEx(ActorID,4,104115,'MidAutumn_juanzhoudianji',0)
			end
		end
	end
end

function MidAutumn_juanzhoudianji()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 1 then
		API_RemoveTaskScroll(ActorID,4)
	elseif SelectItem == 20 then
		API_ResponseWrite('<name>七星伴月</name>')
		API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
		API_ResponseWrite('<br><text>活动时间： '.. MidAutumn_StartTime.Month ..' 月 '.. MidAutumn_StartTime.Day ..' 日 — '.. MidAutumn_EndTime.Month ..' 月 '.. MidAutumn_EndTime.Day - 2 ..' 日</text><br>')
		API_ResponseWrite('<br><text>活动简介： </text><br>')
		API_ResponseWrite('<text>          1、黄金周期间，每天上线可以获得双倍幸运星和一种小月饼模具（七天一共七种）</text><br>')
		API_ResponseWrite('<text>          2、用小月饼模具和中秋积分可制作小月饼，吃掉小月饼可获得金币奖励</text><br>')
		API_ResponseWrite('<text>          3、四种不同小月饼可合成一个大月饼，七种不同的小月饼可合成一个至尊月饼</text><br>')
		API_ResponseWrite('<text>          4、吃掉大月饼和至尊月饼可获得更高的金币奖励，并且还有随机的道具奖励</text><br>')
		API_ResponseWrite('<br><a href="MidAutumn_juanzhoudianji?1=0">返回</a><br>')
	elseif SelectItem == 30 then
		API_ResponseWrite('<name>疯长的月桂树</name>')
		API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
		API_ResponseWrite('<br><text>活动时间： '.. MidAutumn_StartTime.Month ..' 月 '.. MidAutumn_StartTime.Day ..' 日 — '.. MidAutumn_EndTime.Month ..' 月 '.. MidAutumn_EndTime.Day ..' 日  13：00-22：00</text><br>')
		API_ResponseWrite('<br><text>活动简介： </text><br>')
		API_ResponseWrite('<text>          暗礁海、麦穗平原、阳光雨林、珊瑚群岛的月桂树出现不明原因的疯长，严重影响交通和怪物出没，镇长召集有志之士前往砍伐</text><br>')
		API_ResponseWrite('<text>          1、16级以上的玩家可以去暗礁海、麦穗平原、阳光雨林、珊瑚群岛砍伐月桂树获得月桂枝</text><br>')
		API_ResponseWrite('<text>          2、使用月桂枝可以获得经验奖励以及中秋积分（每根5点积分）</text><br>')
		local ShiZhuID = 11085
		if API_ActorGetPropNum(ActorID,PD_PROP_SEX) == 1 then
			ShiZhuID = 11085
		else
			ShiZhuID = 11083
		end
		API_ResponseWrite('<text>          3、600个月桂枝可以编织成一个中秋时装：'..API_GetGoodsName(ShiZhuID)..'</text><br>')
		API_ResponseWrite('<text>          4、中秋积分可用于制作月饼</text><br>')
		API_ResponseWrite('<br><a href="MidAutumn_juanzhoudianji?1=0">返回</a><br>')
	elseif SelectItem == 40 then
		API_ResponseWrite('<name>月兔大作战</name>')
		API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
		API_ResponseWrite('<br><text>活动时间： '.. MidAutumn_StartTime.Month ..' 月 '.. MidAutumn_StartTime.Day  ..' 日 — '.. MidAutumn_EndTime.Month ..' 月 '.. MidAutumn_EndTime.Day ..' 日  13：00-22：00</text><br>')
		API_ResponseWrite('<br><text>活动简介： </text><br>')
		API_ResponseWrite('<text>          镇长经过多方调查总算了解到月桂树疯长的原因是因为外星月兔组团来地球度假，导致月球上的月桂种子也大量散落到地球上，要解决这场危机，必须要让阻止这群可恶兔子的疯狂行为，现在月兔们正在落日农庄、娜沙湿地、月暮草场晒月光浴，去尽情的消灭它们吧！</text><br>')
		API_ResponseWrite('<text>          1、26级以上的玩家可以去落日农庄、娜沙湿地、月暮草场消灭月兔获得兔子肉</text><br>')
		API_ResponseWrite('<text>          2、使用兔子肉可以获得水晶币奖励以及中秋积分（每块200点积分）</text><br>')
		local ShiZhuID = 11086
		if API_ActorGetPropNum(ActorID,PD_PROP_SEX) == 1 then
			ShiZhuID = 11086
		else
			ShiZhuID = 11084
		end
		API_ResponseWrite('<text>          3、15个兔子肉可以兑换成一个中秋时装：'..API_GetGoodsName(ShiZhuID)..'</text><br>')
		API_ResponseWrite('<text>          4、中秋积分可用于制作月饼</text><br>')
		API_ResponseWrite('<br><a href="MidAutumn_juanzhoudianji?1=0">返回</a><br>')
	elseif SelectItem == 50 then
		API_ResponseWrite('<name>月球反击战</name>')
		API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
		API_ResponseWrite('<br><text>活动时间： '.. MidAutumn_StartTime.Month ..' 月 '.. MidAutumn_StartTime.Day + 2 ..' 日 — '.. MidAutumn_EndTime.Month ..' 月 '.. MidAutumn_EndTime.Day - 1 ..' 日  20：00-21：00</text><br>')
		API_ResponseWrite('<br><text>活动简介： </text><br>')
		API_ResponseWrite('<text>          虽然咱们的勇士消灭的月兔不少，但还是有更多的月兔源源不断的从月球来到地球，看来必须从源头上消灭鼓动月兔到地球来的月兔王莱莱卡，落日农庄、娜沙湿地、月暮草场上已经建好了通往月球的传送门，反击战要开始了！</text><br>')
		API_ResponseWrite('<text>          1、玩家可以去落日农庄、娜沙湿地、月暮草场找到月宫传送门</text><br>')
		API_ResponseWrite('<text>          2、通过传送门前往月宫必须要组队，队长需要消耗中秋积分才能进入</text><br>')
		API_ResponseWrite('<text>          3、如果带有中秋时装，传送时积分消耗可以减半</text><br>')
		API_ResponseWrite('<text>          4、消灭月兔王莱莱卡有几率获得 兔宝宝宠物卡（绝版）、变身糖果、至尊月饼、高品质装备、时装的超级大奖</text><br>')
		API_ResponseWrite('<br><a href="MidAutumn_juanzhoudianji?1=0">返回</a><br>')
	elseif SelectItem == 60 then
		API_ResponseWrite('<name>中秋猜灯谜</name>')
		API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
		API_ResponseWrite('<br><text>活动时间： '.. MidAutumn_StartTime.Month ..' 月 '.. MidAutumn_StartTime.Day ..' 日 — '.. MidAutumn_EndTime.Month ..' 月 '.. MidAutumn_EndTime.Day - 1 ..' 日  21：00-22：00</text><br>')
		API_ResponseWrite('<br><text>活动简介： </text><br>')
		API_ResponseWrite('<text>          看到主城焕然一新的节日装饰了吗？晚上月亮高高升起的时候，城内还将举行猜灯谜活动哦</text><br>')
		API_ResponseWrite('<text>          1、玩家可以去主城点击灯笼回答问题</text><br>')
		API_ResponseWrite('<text>          2、回答正确可获得水晶币和50中秋积分（还有概率获得小月饼模具）</text><br>')
		API_ResponseWrite('<br><a href="MidAutumn_juanzhoudianji?1=0">返回</a><br>')
	elseif SelectItem == 70 then
		API_ResponseWrite('<name>月宫宝库</name>')
		API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
--		API_ResponseWrite('<br><text>活动时间： '.. MidAutumn_StartTime.Month ..' 月 '.. MidAutumn_StartTime.Day + 2 ..' 日 — '.. MidAutumn_EndTime.Month ..' 月 '.. MidAutumn_EndTime.Day - 1 ..' 日  20：00-21：00</text><br>')
		API_ResponseWrite('<br><text>活动简介： </text><br>')
		API_ResponseWrite('<text>          使用月宫飞符进入月宫宝库开启宝箱可获得丰富的奖励（宝箱每10秒刷新一次），更有几率获得月兔披风，月宫男女头饰，粉红兔宝宝卡等物品，使用月宫飞符需要消耗300点券。您可以组队携带队友一同进入，队友无需消耗任何道具以及点券。</text><br>')
		API_ResponseWrite('<text>          1、杀死月兔队长，月桂精有一定几率获得月宫飞符。</text><br>')
		API_ResponseWrite('<br><a href="MidAutumn_juanzhoudianji?1=0">返回</a><br>')
	elseif SelectItem == 80 then
		if API_ActorGetGoodsNum(ActorID,88955) > 0 then
			API_ResponseWrite('<name>领取魔法月饼模具</name>')
			API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
			API_ResponseWrite('<text>您的背包中已经拥有魔法月饼模具，不需要领取。</text><br>')
			API_ResponseWrite('<br><a href="MidAutumn_juanzhoudianji?1=0">返回</a><br>')
		else
			if API_ActorCanAddGoods(ActorID,88955,1,3,0) ~= -1 then
				API_AddActorGoodsFlag(ActorID,88955,1,0,'获得魔法月饼模具')
				API_ActorSendMsg(ActorID,8,'获得魔法月饼模具')
			else
				local GoodsName = API_GetGoodsName(88955)
				API_SendActorMailByName(API_GetActorName(ActorID),88955,1,0,'中秋活动','领取魔法月饼模具')
				API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'1个（请到邮箱领取）')
			end		
		end
	elseif SelectItem == 90 then
		if API_ActorGetGoodsNum(ActorID,88956) > 0 then
			API_ResponseWrite('<name>领取冰皮月饼模具</name>')
			API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
			API_ResponseWrite('<text>您的背包中已经拥有冰皮月饼模具，不需要领取。</text><br>')
			API_ResponseWrite('<br><a href="MidAutumn_juanzhoudianji?1=0">返回</a><br>')
		else
			if API_ActorCanAddGoods(ActorID,88956,1,3,0) ~= -1 then
				API_AddActorGoodsFlag(ActorID,88956,1,0,'获得冰皮月饼模具')
				API_ActorSendMsg(ActorID,8,'获得冰皮月饼模具')
			else
				local GoodsName = API_GetGoodsName(88956)
				API_SendActorMailByName(API_GetActorName(ActorID),88956,1,0,'中秋活动','领取冰皮月饼模具')
				API_ActorSendMsg(ActorID,8,'获得'..GoodsName..'1个（请到邮箱领取）')
			end	
		end	

	else
		API_ResponseWrite('<name>中秋活动</name>')
		API_ResponseWrite('<win rect="300,100,400,300" move="1"></win>')
		API_ResponseWrite('<text>喜迎中秋，“疯长的月桂树”、“月兔大作战”等诸多活动轮番举行，至尊大奖等您来拿！</text><br>')
--		API_ResponseWrite('<text>喜迎中秋，“七星伴月”、“疯长的月桂树”、“月兔大作战”、“月球反击战”、“中秋猜灯谜”等诸多活动轮番举行，至尊大奖等您来拿！</text><br>')
--		API_ResponseWrite('<text>喜迎中秋，“七星伴月”、“疯长的月桂树”、“月兔大作战”、“月球反击战”等诸多活动轮番举行，至尊大奖等您来拿！</text><br>')
		API_ResponseWrite('<text>请点击下面的链接查看活动详情：</text><br>')
		--API_ResponseWrite('<br><a underline="1" href="MidAutumn_juanzhoudianji?1=20">七星伴月</a><br>')
		API_ResponseWrite('<br><a underline="1" href="MidAutumn_juanzhoudianji?1=30">疯长的月桂树</a><br>')
		API_ResponseWrite('<br><a underline="1" href="MidAutumn_juanzhoudianji?1=40">月兔大作战</a><br>')
		--API_ResponseWrite('<br><a underline="1" href="MidAutumn_juanzhoudianji?1=50">月球反击战</a><br>')
		--API_ResponseWrite('<br><a underline="1" href="MidAutumn_juanzhoudianji?1=60">中秋猜灯谜</a><br>')
		API_ResponseWrite('<br><a underline="1" href="MidAutumn_juanzhoudianji?1=70">月宫宝库</a><br>')
		API_ResponseWrite('<br><a underline="1" href="MidAutumn_juanzhoudianji?1=80">领取魔法月饼模具</a><br>')
		API_ResponseWrite('<br><a underline="1" href="MidAutumn_juanzhoudianji?1=90">领取冰皮月饼模具</a><br>')
		API_ResponseWrite('<br><a href="MidAutumn_juanzhoudianji?1=1">删除此信</a><br>')
		API_ResponseFlush(ActorID)
	end	
end

local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'MidAutumn_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'MidAutumn_OnLogin') 
end