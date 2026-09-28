----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\MeiLaoBanList.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2010-4-15
--版  本:	1.0
--描  述:	煤老板排行榜
--应  用:  

----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2010-4-15
--描  述: 创建
--修改人：黄蕾
--日  期：20120814
--描  叙：修改七夕排行版
--备注：中心服，RandTopInfo.scp(Top 记录多少人数  Mod 排名的格式，2进制   SaveTime 保存排行报时间间隔 AwardTop 调用发奖励的函数时，给前多少名回调本函数
----------------------------------------------------------------------------------------------------------------------

MLB_Initialization_DBSave = -185
--一共显示多少名
MLB_XianShiMingCi = 100
--每页显示多少名
MLB_PageMingCi = 30

 HLph_PeiHeHuoDong_StartTime = {Year = 2011,Month = 12,Day = 14,Hour = 0,Minute = 0,Second = 0}
 HLph_PeiHeHuoDong__EndTime = {Year = 2011,Month = 12,Day = 31,Hour = 23,Minute = 59,Second = 59}
 
 HLsd_PeiHeHuoDong_StartTime = {Year = 2012,Month = 12,Day = 14,Hour = 0,Minute = 0,Second = 0}
 HLsd_PeiHeHuoDong__EndTime = {Year = 2013,Month = 1,Day = 7,Hour = 0,Minute = 30,Second = 0}
 
 
 
MLB_DBSaveTable = {
	--财神宝箱
	[1] = {
			WeekNameOwnerIDList = {-105,-106,-107,-108,-109,Size = '254'},
			WeekNumOwnerIDList = {
									{-110,-111,-112,-113,-114,Name = '本周财神宝箱使用次数',Size = '294'},
									},
			ZhongNameOwnerIDList = {-115,-116,-117,-118,-119,Size = '254'},
			ZhongNumOwnerIDList = {
									{-120,-121,-122,-123,-124,Name = '财神宝箱总使用次数',Size = '294'},
									},
			DBSaveDZ = {},
			ActorWeekNumDBSave = 18445,
			ActorZhongNumDBSave = 18446,
			ActorShiYongTimeDBSave = 18447,
			PaiHangBangName = '财神宝箱',
			JiangLiGoodsID = {[1]=32022,[2]=32017},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 0,
			Top3JiangLiGoodsID = {[1]=31021,[2]=31021},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 0,
			},
			
	--神秘之地
	[2] = {
			WeekNameOwnerIDList = {-125,-126,-127,-128,-129,Size = '254'},
			WeekNumOwnerIDList = {
									{-130,-131,-132,-133,-134,Name = '本周神秘之地使用次数',Size = '294'},
									},
			ZhongNameOwnerIDList = {-135,-136,-137,-138,-139,Size = '254'},
			ZhongNumOwnerIDList = {
									{-140,-141,-142,-143,-144,Name = '神秘之地总使用次数',Size = '294'},
									},
			DBSaveDZ = {},
			ActorWeekNumDBSave = 18448,
			ActorZhongNumDBSave = 18449,
			ActorShiYongTimeDBSave = 18450,
			PaiHangBangName = '神秘之地',
			JiangLiGoodsID = {[1]=32022,[2]=32017},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 0,
			Top3JiangLiGoodsID = {[1]=31020,[2]=31020},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 0,
			},
			
	--深寒地宫
	[3] = {
			WeekNameOwnerIDList = {-145,-146,-147,-148,-149,Size = '254'},
			WeekNumOwnerIDList = {
									{-150,-151,-152,-153,-154,Name = '本周深寒地宫使用次数',Size = '294'},
									},
			ZhongNameOwnerIDList = {-155,-156,-157,-158,-159,Size = '254'},
			ZhongNumOwnerIDList = {
									{-160,-161,-162,-163,-164,Name = '深寒地宫总使用次数',Size = '294'},
									},
			DBSaveDZ = {},
			ActorWeekNumDBSave = 18451,
			ActorZhongNumDBSave = 18452,
			ActorShiYongTimeDBSave = 18453,
			PaiHangBangName = '深寒地宫',
			JiangLiGoodsID = {[1]=32017,[2]=32022},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 0,
			Top3JiangLiGoodsID = {[1]=31020,[2]=31020},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 0,
			},
			
	--夺宝奇兵
	[4] = {
			WeekNameOwnerIDList = {-165,-166,-167,-168,-169,Size = '254'},
			WeekNumOwnerIDList = {
									{-170,-171,-172,-173,-174,Name = '本周夺宝奇兵使用次数',Size = '294'},
									},
			ZhongNameOwnerIDList = {-175,-176,-177,-178,-179,Size = '254'},
			ZhongNumOwnerIDList = {
									{-180,-181,-182,-183,-184,Name = '夺宝奇兵总使用次数',Size = '294'},
									},
			DBSaveDZ = {},
			ActorWeekNumDBSave = 18454,
			ActorZhongNumDBSave = 18455,
			ActorShiYongTimeDBSave = 18456,
			PaiHangBangName = '夺宝奇兵',
			JiangLiGoodsID = {[1]=32017,[2]=32022},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 0,
			Top3JiangLiGoodsID = {[1]=31021,[2]=31021},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 0,
			},
	--拉锯关门后杀人次数
	[5] = {
			WeekNameOwnerIDList = {-186,-187,-188,-189,-190,Size = '254'},
			WeekNumOwnerIDList = {
									{-191,-192,-193,-194,-195,Name = '本周31级以上拉锯战关门后击杀次数',Size = '294'},
									},
			ZhongNameOwnerIDList = {-196,-197,-198,-199,-200,Size = '254'},
			ZhongNumOwnerIDList = {
									{-201,-202,-203,-204,-205,Name = '31级以上拉锯战关门后总击杀次数',Size = '294'},
									},
			DBSaveDZ = {},
			ActorWeekNumDBSave = 18457,
			ActorZhongNumDBSave = 18458,
			ActorShiYongTimeDBSave = 18459,
			PaiHangBangName = '拉锯击杀',
			JiangLiGoodsID = {[1]=88938,[2]=88935},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88939,[2]=88936},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
	--拉锯胜利次数
	[6] = {
			WeekNameOwnerIDList = {-206,-207,-208,-209,-210,Size = '254'},
			WeekNumOwnerIDList = {
									{-211,-212,-213,-214,-215,Name = '本周31级以上拉锯战胜利次数',Size = '294'},
									},
			ZhongNameOwnerIDList = {-216,-217,-218,-219,-220,Size = '254'},
			ZhongNumOwnerIDList = {
									{-221,-222,-223,-224,-225,Name = '31级以上拉锯战总胜利次数',Size = '294'},
									},
			DBSaveDZ = {},
			ActorWeekNumDBSave = 18460,
			ActorZhongNumDBSave = 18461,
			ActorShiYongTimeDBSave = 18462,
			PaiHangBangName = '拉锯胜利',
			JiangLiGoodsID = {[1]=88938,[2]=88935},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88939,[2]=88936},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
			
	--英雄之塔
	[7] = {
			WeekNameOwnerIDList = {-226,-227,-228,-229,-230,Size = '148'},
			WeekNumOwnerIDList = {
									{-231,-232,-233,-234,-235,Name = '最高挑战层数',Size = '100'},
									{-236,-237,-238,-239,-240,Name = '最快挑战时间',Size = '100'},
									{-241,-242,-243,-244,-245,Name = 'BOSS击杀数量',Size = '100'},
									{-246,-247,-248,-249,-250,Name = '精英击杀数量',Size = '100'},
									},
			ZhongNameOwnerIDList = {-251,-252,-253,-254,-255,Size = '148'},
			ZhongNumOwnerIDList = {
									{-256,-257,-258,-259,-260,Name = '最高挑战层数',Size = '100'},
									{-261,-262,-263,-264,-265,Name = '最快挑战时间',Size = '100'},
									{-266,-267,-268,-269,-270,Name = 'BOSS击杀数量',Size = '100'},
									{-271,-272,-273,-274,-275,Name = '精英击杀数量',Size = '100'},
									},
			DBSaveDZ = {},
			PaiHangBangName = '英雄之塔',
			JiangLiGoodsID = {[1]=88935,[2]=88938},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88936,[2]=88939},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
	
	--庄园人气
	[8] = {
			WeekNameOwnerIDList = {-1001,-1002,-1003,-1004,-1005,Size = '148'},
			WeekIDOwnerIDList = {-1006,-1007,-1008,-1009,-1010},
			WeekNumOwnerIDList = {
									{-1011,-1012,-1013,-1014,-1015,Name = '庄园人气',Size = '110'},
									{-1016,-1017,-1018,-1019,-1020,Name = '庄园等级',Size = '70'},
									{-1021,-1022,-1023,-1024,-1025,Name = '庄园名称',Size = '155',Type = 2},
									{-1026,-1027,-1028,-1029,-1030,Name = '阵  营',Size = '75',Type = 2},
									},
			ZhongNameOwnerIDList = {-1031,-1032,-1033,-1034,-1035,Size = '148'},
			ZhongIDOwnerIDList = {-1036,-1037,-1038,-1039,-1040},
			ZhongNumOwnerIDList = {
									{-1041,-1042,-1043,-1044,-1045,Name = '庄园人气',Size = '110'},
									{-1046,-1047,-1048,-1049,-1050,Name = '庄园等级',Size = '70'},
									{-1051,-1052,-1053,-1054,-1055,Name = '庄园名称',Size = '155',Type = 2},
									{-1056,-1057,-1058,-1059,-1060,Name = '阵  营',Size = '75',Type = 2},
									},
			DBSaveDZ = {},
			PaiHangBangName = '庄园人气',
			JiangLiGoodsID = {[1]=88935,[2]=88938},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88936,[2]=88939},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
			
	--七夕排行
	[9] = {
			WeekNameOwnerIDList = {-276,-277,-278,-279,-280,Size = '254'},
			WeekNumOwnerIDList = {
									{-281,-282,-283,-284,-285,Name = '本周获得爱慕次数',Size = '294'},
									},
			ZhongNameOwnerIDList = {-286,-287,-288,-289,-290,Size = '254'},
			ZhongNumOwnerIDList = {
									{-291,-292,-293,-294,-295,Name = '获得爱慕总次数',Size = '294'},
									},
			DBSaveDZ = {},
			ActorWeekNumDBSave = 18466,
			ActorZhongNumDBSave = 18464,
			ActorShiYongTimeDBSave = 18465,
			PaiHangBangName = '魅力佳人',
			JiangLiGoodsID = {[1]=32022,[2]=32017},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 0,
			Top3JiangLiGoodsID = {[1]=31021,[2]=31021},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 0,
			},
}

--显示顺序
MLB_XSSXTable = {25,26,23,24,22,19,20,13,14,15,16,9,10,11,12,7,8,1,2,3,4,5,6,}
--[[
for i = 1,500 do
	for j = 1,table.getn(MLB_DBSaveTable) do
		local Type = math.ceil(i/100)
		local Key = math.mod(i,100)
		if Key == 0 then
			Key = 100
		end
		local DBSaveTable = MLB_DBSaveTable[j]
		DBSaveTable.DBSaveDZ[i] = {	Key = Key, 
									WeekName = DBSaveTable.WeekNameOwnerIDList[Type], 
									WeekID = 0,
									WeekNum = {},
									WeekNumType = {},
									ZhongName = DBSaveTable.ZhongNameOwnerIDList[Type],
									ZhongID = 0,
									ZhongNum = {},
									ZhongNumType = {},
									}
		for k = 1, table.getn(DBSaveTable.WeekNumOwnerIDList) do
			DBSaveTable.DBSaveDZ[i].WeekNum[k] = DBSaveTable.WeekNumOwnerIDList[k][Type]
			if DBSaveTable.WeekNumOwnerIDList[k].Type ~= nil then
				DBSaveTable.DBSaveDZ[i].WeekNumType[k] = DBSaveTable.WeekNumOwnerIDList[k].Type
			else
				DBSaveTable.DBSaveDZ[i].WeekNumType[k] = 1
			end
		end
		for k = 1, table.getn(DBSaveTable.ZhongNumOwnerIDList) do
			DBSaveTable.DBSaveDZ[i].ZhongNum[k] = DBSaveTable.ZhongNumOwnerIDList[k][Type]
			if DBSaveTable.ZhongNumOwnerIDList[k].Type ~= nil then
				DBSaveTable.DBSaveDZ[i].ZhongNumType[k] = DBSaveTable.ZhongNumOwnerIDList[k].Type
			else
				DBSaveTable.DBSaveDZ[i].ZhongNumType[k] = 1
			end
		end
		if DBSaveTable.WeekIDOwnerIDList ~= nil then
			DBSaveTable.DBSaveDZ[i].WeekID = DBSaveTable.WeekIDOwnerIDList[Type]
		end
		if DBSaveTable.ZhongIDOwnerIDList ~= nil then
			DBSaveTable.DBSaveDZ[i].ZhongID = DBSaveTable.ZhongIDOwnerIDList[Type]
		end
	end
end
]]

--加载交互数据
if API_GetServerID() == 1 then
	if API_VarDataGetNumber_Ex(1,0,MLB_Initialization_DBSave,1,170) == 0 then
		-- 装载变量数据
		API_VarDataLoad_Ex(1,0,MLB_Initialization_DBSave)
	end
	CRandTopSys:LoadList(0, 1) 
	CRandTopSys:LoadList(0, 3) 
	CRandTopSys:LoadList(0, 5) 
	CRandTopSys:LoadList(0, 7) 
	CRandTopSys:LoadList(0, 9) 
	CRandTopSys:LoadList(0, 11) 
	CRandTopSys:LoadList(0, 13) 
	CRandTopSys:LoadList(0, 15) 
	CRandTopSys:LoadList(0, 17) 
	CRandTopSys:LoadList(0, 19) 
	CRandTopSys:LoadList(0, 22) 
	CRandTopSys:LoadList(0, 23) 
	CRandTopSys:LoadList(0, 25)
	--API_TraceError("k="..MLB_Initialization_DBSave)
	
end
--[[
for i = 1,table.getn(MLB_DBSaveTable) do
	local DBSaveTable = MLB_DBSaveTable[i]
	for j = 1,table.getn(DBSaveTable.WeekNameOwnerIDList) do
		local OwnerID = DBSaveTable.WeekNameOwnerIDList[j]
		if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 0 then
			API_VarDataLoad_Ex(1,0,OwnerID)
		end
	end
	for j = 1,table.getn(DBSaveTable.WeekNumOwnerIDList) do
		for k = 1,table.getn(DBSaveTable.WeekNumOwnerIDList[j]) do
			local OwnerID = DBSaveTable.WeekNumOwnerIDList[j][k]
			if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 0 then
				API_VarDataLoad_Ex(1,0,OwnerID)
			end
		end
	end
	for j = 1,table.getn(DBSaveTable.ZhongNameOwnerIDList) do
		local OwnerID = DBSaveTable.ZhongNameOwnerIDList[j]
		if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 0 then
			API_VarDataLoad_Ex(1,0,OwnerID)
		end
	end
	for j = 1,table.getn(DBSaveTable.ZhongNumOwnerIDList) do
		for k = 1,table.getn(DBSaveTable.ZhongNumOwnerIDList[j]) do
			local OwnerID = DBSaveTable.ZhongNumOwnerIDList[j][k]
			if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 0 then
				API_VarDataLoad_Ex(1,0,OwnerID)
			end
		end
	end
	if DBSaveTable.WeekIDOwnerIDList ~= nil then
		for j = 1,table.getn(DBSaveTable.WeekIDOwnerIDList) do
			local OwnerID = DBSaveTable.WeekIDOwnerIDList[j]
			if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 0 then
				API_VarDataLoad_Ex(1,0,OwnerID)
			end
		end
	end
	if DBSaveTable.ZhongIDOwnerIDList ~= nil then
		for j = 1,table.getn(DBSaveTable.ZhongIDOwnerIDList) do
			local OwnerID = DBSaveTable.ZhongIDOwnerIDList[j]
			if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 0 then
				API_VarDataLoad_Ex(1,0,OwnerID)
			end
		end
	end
end
]]
--付费道具使用回调（记录自己总使用次数、本周使用次数、比较自己的总名次、比较自己的本周名次）
function MLB_DaoJuShiYong(ActorID,Type,Param1,Param2,Param3,Param4,ZhuRenName)
	local DBTable = MLB_RandTop_RankList[Type]
	if DBTable == nil then
		return
	end
	
	local nMode = DBTable.nMode
	
	local ActorName = API_GetActorName(ActorID)
	if ZhuRenName ~= nil then
		ActorName = ZhuRenName
	end
	
	local tNewItem = IRandTopListItem:New{}
	tNewItem.nKey = ActorID
	tNewItem.nValue1 = Param1
	tNewItem.nValue2 = Param2
	tNewItem.nValue3 = Param3
	tNewItem.nValue4 = Param4
	--重新赋值字符串
	tNewItem.sAttInf = ActorName
	
	--API_TraceError("k="..tNewItem.nKey)
	
	--//数据操作掩码 4位二进制 0 覆盖 1累加
	CRandTopSys:UpdateRecord( Type, tNewItem.nKey,nMode, tNewItem)	
end



--所有16级以上玩家上线掉落卷轴
function MLB_OnLogin()
--	local ActorID = API_RequestGetActorID()
--	local ActorExpLevel = API_GetActorExpLevel(ActorID)
--	if ActorExpLevel > 15 then
--		API_RemoveTaskScroll(ActorID, 5)
--		API_AddTaskScrollEx(ActorID,5,10160,'MLB_Scroll',0)
--	end
end


--玩家点击卷轴回调(点榜图标)
function MLB_Scroll(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	API_ResponseWrite('<name>排行榜</name>')
	--API_ResponseWrite('<win rect="650,330,300,320"></win>')
	API_ResponseWrite('<win rect="700,185,300,320"></win>')
	API_ResponseWrite('<text>请选择您要查看的排行榜</text><text color="255,255,255">(从4月20日开始统计)</text><br>') 
	for j = 1 ,table.getn(MLB_XSSXTable) do 
		local i = MLB_XSSXTable[j]
		if MLB_RandTop_RankList[i] ~= nil then
			local RankType = MLB_RandTop_RankList[i].RankType
			if i == 25 or i == 26 then
				local NowTime = os.time() 
				local nShiFouStart = API_DiffDatatime(HLph_PeiHeHuoDong_StartTime.Year,HLph_PeiHeHuoDong_StartTime.Month,HLph_PeiHeHuoDong_StartTime.Day,HLph_PeiHeHuoDong_StartTime.Hour,HLph_PeiHeHuoDong_StartTime.Minute,HLph_PeiHeHuoDong_StartTime.Second)
				local nShiFouEnd = API_DiffDatatime(HLph_PeiHeHuoDong__EndTime.Year,HLph_PeiHeHuoDong__EndTime.Month,HLph_PeiHeHuoDong__EndTime.Day,HLph_PeiHeHuoDong__EndTime.Hour,HLph_PeiHeHuoDong__EndTime.Minute,HLph_PeiHeHuoDong__EndTime.Second)
				if nShiFouStart <= 0 and nShiFouEnd > 0 then
				--if NowTime >= 1329062400 and NowTime < 1329670800 then
					if RankType == 1 then
						API_ResponseWrite('<br><text color="255,0,255">    '.. MLB_RandTop_RankList[i].PaiHangBangName ..' ：</text>') 
						API_ResponseWrite('<a underline="1" href="MLB_Scroll_Select?1='..i..'">  本周排行榜</a>') 
						--API_TraceError("k="..i)
					elseif RankType == 2 then
						API_ResponseWrite('<text>    </text>') 
						API_ResponseWrite('<a underline="1" href="MLB_Scroll_Select?1='..i..'">总排行榜</a><br>') 
					end
				end
			elseif i == 22 then
				local NowTime = os.time() 
				local nShiFouStart = API_DiffDatatime(HLsd_PeiHeHuoDong_StartTime.Year,HLsd_PeiHeHuoDong_StartTime.Month,HLsd_PeiHeHuoDong_StartTime.Day,HLsd_PeiHeHuoDong_StartTime.Hour,HLsd_PeiHeHuoDong_StartTime.Minute,HLsd_PeiHeHuoDong_StartTime.Second)
				local nShiFouEnd = API_DiffDatatime(HLsd_PeiHeHuoDong__EndTime.Year,HLsd_PeiHeHuoDong__EndTime.Month,HLsd_PeiHeHuoDong__EndTime.Day,HLsd_PeiHeHuoDong__EndTime.Hour,HLsd_PeiHeHuoDong__EndTime.Minute,HLsd_PeiHeHuoDong__EndTime.Second)
				if nShiFouStart <= 0 and nShiFouEnd > 0 then
				--if NowTime >= 1324310400 and NowTime < 1326038400 then
					API_ResponseWrite('<br><text color="255,0,255">    '.. MLB_RandTop_RankList[i].PaiHangBangName ..' ：</text>') 
					API_ResponseWrite('<a underline="1" href="MLB_Scroll_Select?1='..i..'">  本周排行榜</a><br>') 
				end
			else
				if RankType == 1 then
					API_ResponseWrite('<br><text color="255,0,255">    '.. MLB_RandTop_RankList[i].PaiHangBangName ..' ：</text>') 
					API_ResponseWrite('<a underline="1" href="MLB_Scroll_Select?1='..i..'">  本周排行榜</a>') 
				elseif RankType == 2 then
					API_ResponseWrite('<text>    </text>') 
					API_ResponseWrite('<a underline="1" href="MLB_Scroll_Select?1='..i..'">总排行榜</a><br>') 
				end
			end
		end
	end 
	API_ResponseWrite('<br><a href="MLB_GuiZeShuoMing">查看排行榜奖励</a><br>') 
	API_ResponseWrite('<br><a>关闭</a><br>') 
	API_ResponseFlush(ActorID)
end

function MLB_GuiZeShuoMing()
	API_ResponseWrite('<name>排行榜奖励说明</name>')
	--API_ResponseWrite('<win rect="650,360,300,300"></win>')
	API_ResponseWrite('<win rect="700,185,300,320"></win>')
	local SelectHuoDong = API_RequestGetNumber(1)
	if SelectHuoDong == 0 then
		API_ResponseWrite('<text>请选择您想要了解排行榜奖励说明</text><br>') 
		for j = 1 ,table.getn(MLB_XSSXTable) do 
			local i = MLB_XSSXTable[j]
			if MLB_RandTop_RankList[i] ~= nil then
				if i == 25 or i == 26 then
					local NowTime = os.time() 
					local nShiFouStart = API_DiffDatatime(HLph_PeiHeHuoDong_StartTime.Year,HLph_PeiHeHuoDong_StartTime.Month,HLph_PeiHeHuoDong_StartTime.Day,HLph_PeiHeHuoDong_StartTime.Hour,HLph_PeiHeHuoDong_StartTime.Minute,HLph_PeiHeHuoDong_StartTime.Second)
					local nShiFouEnd = API_DiffDatatime(HLph_PeiHeHuoDong__EndTime.Year,HLph_PeiHeHuoDong__EndTime.Month,HLph_PeiHeHuoDong__EndTime.Day,HLph_PeiHeHuoDong__EndTime.Hour,HLph_PeiHeHuoDong__EndTime.Minute,HLph_PeiHeHuoDong__EndTime.Second)
					if nShiFouStart <= 0 and nShiFouEnd > 0 then
					--if NowTime >= 1329062400 and NowTime < 1329670800 then
						local RankType = MLB_RandTop_RankList[i].RankType
						if RankType == 1 then
							API_ResponseWrite('<br><a href="MLB_GuiZeShuoMing?1='..i..'">'.. MLB_RandTop_RankList[i].PaiHangBangName ..' </a><br>') 
							--API_TraceError("RankType" ..RankType)
						end
					end
				else
					local RankType = MLB_RandTop_RankList[i].RankType
					if RankType == 1 then
						API_ResponseWrite('<br><a href="MLB_GuiZeShuoMing?1='..i..'">'.. MLB_RandTop_RankList[i].PaiHangBangName ..' </a><br>') 
					end
				end
			end
		end 
		API_ResponseWrite('<br><a href="MLB_Scroll">返回</a><br>') 
	else
		if MLB_RandTop_RankList[SelectHuoDong] == nil then
			return
		end
		local PaiHangBangName = MLB_RandTop_RankList[SelectHuoDong].PaiHangBangName
		if SelectHuoDong == 25 or SelectHuoDong == 26 then
			API_ResponseWrite('<text>奖励：</text><br>') 
			API_ResponseWrite('<text>'..PaiHangBangName..'本周排行榜</text><text color="255,0,255">第一名</text><text>奖励：</text><img srcgd="11600" tipgd="11600" ><text>  × 1、</text><img srcgd="11601" tipgd="11601" ><text>  × 1、</text><img srcgd="11602" tipgd="11602" ><text>  × 1、</text><img srcgd="11603" tipgd="11603" ><text>  × 1、</text><br>') 
			API_ResponseWrite('<text>'..PaiHangBangName..'本周排行榜</text><text color="255,0,255">第二名</text><text>奖励：</text><img srcgd="11112" tipgd="11112" ><text>  × 2、</text><img srcgd="11278" tipgd="11278" ><text>  × 2</text><br>') 
			API_ResponseWrite('<text>'..PaiHangBangName..'本周排行榜</text><text color="255,0,255">第三名</text><text>奖励：</text><img srcgd="11278" tipgd="11278" ><text>  × 2</text><br>') 
			API_ResponseWrite('<br><text>说明：</text><br>') 
			--API_ResponseWrite('<text>1、本排行榜从2月13日开始统计，直到2月19日23点59分59秒</text><br>') 
			API_ResponseWrite('<text>1、本排行榜从8月16日开始统计，直到9月2日23点59分59秒</text><br>') 
			--API_ResponseWrite('<text>2、2月20日零点会清除排行榜统计数据</text><br>') 
			API_ResponseWrite('<text>2、8月20日，8月27日，9月3日零点会清除排行榜统计数据</text><br>') 
			--API_ResponseWrite('<text>3、奖励将在2月20日零点通过邮件发给排名前三的玩家</text><br>') 
			API_ResponseWrite('<text>3、奖励将在8月20日，8月27日，9月3日零点通过邮件发给排名前三的玩家</text><br>') 
			API_ResponseWrite('<br><a href="MLB_GuiZeShuoMing">返回</a><br>') 
		elseif SelectHuoDong == 22 then
			API_ResponseWrite('<text>奖励：</text><br>') 
			API_ResponseWrite('<text>'..PaiHangBangName..'本周排行榜</text><text color="255,0,255">第一名</text><text>奖励：</text><img srcgd="89202" tipgd="89202" ><text>  × 1、</text><img srcgd="11509" tipgd="11509" ><text>  × 1、</text><img srcgd="11510" tipgd="11510" ><text>  × 1</text><br>') 
			API_ResponseWrite('<text>'..PaiHangBangName..'本周排行榜</text><text color="255,0,255">第二名</text><text>奖励：</text><img srcgd="89202" tipgd="89202" ><text>  × 1、</text><br>') 
			API_ResponseWrite('<text>'..PaiHangBangName..'本周排行榜</text><text color="255,0,255">第三名</text><text>奖励：</text><img srcgd="11511" tipgd="11511" ><text>  × 1</text><img srcgd="11512" tipgd="11512" ><text>  × 1</text><br>') 
			API_ResponseWrite('<br><text>说明：</text><br>') 
			API_ResponseWrite('<text>1、本排行榜从12月14日开始统计，直到2013年1月6日23点59分59秒</text><br>') 
			API_ResponseWrite('<text>2、12月17日、12月24日、12月31日、2013年1月7日零点会清除排行榜统计数据</text><br>') 
			API_ResponseWrite('<text>3、奖励将在12月17日、12月24日、12月31日、2013年1月7日零点通过邮件发给排名前三的玩家</text><br>') 
			API_ResponseWrite('<text>4、排行榜前100名都有机会获得额外幸运奖励</text><br>') 
			API_ResponseWrite('<br><a href="MLB_GuiZeShuoMing">返回</a><br>') 
		elseif SelectHuoDong == 23 then
			API_ResponseWrite('<text>特殊奖励：</text><br>') 
			API_ResponseWrite('<text>'..PaiHangBangName..'本周排行榜</text><text color="255,0,255">第一名</text><text>奖励：</text><img srcgd="89150" tipgd="89150" ><text>  × 1</text><br>') 
			API_ResponseWrite('<text>'..PaiHangBangName..'本周排行榜</text><text color="255,0,255">第二名</text><text>奖励：</text><img srcgd="89151" tipgd="89151" ><text>  × 1</text><br>') 
			API_ResponseWrite('<text>'..PaiHangBangName..'本周排行榜</text><text color="255,0,255">第三名</text><text>奖励：</text><img srcgd="89152" tipgd="89152" ><text>  × 1</text><br>') 
			API_ResponseWrite('<br><text>其他奖励：</text><br>') 
			API_ResponseWrite('<text>'..PaiHangBangName..'本周排行榜</text><text color="255,0,255">1-10名</text><text>奖励：</text><img srcgd="82004" tipgd="82004" ><text>  × 500、</text><text color="255,0,255">11-30名</text><text>奖励：</text><img srcgd="82004" tipgd="82004" ><text>  × 200、</text><text color="255,0,255">31-100名</text><text>奖励：</text><img srcgd="82004" tipgd="82004" ><text>  × 50</text><br>') 
			API_ResponseWrite('<br><text>说明：</text><br>') 
			API_ResponseWrite('<text>1、本周排行榜从星期一零点开始统计，直到下一个星期一零点</text><br>') 
			API_ResponseWrite('<text>2、每个星期一零点会清除上一周的周排行榜统计数据</text><br>') 
			API_ResponseWrite('<text>3、奖励将在每星期一零点通过邮件发给获奖玩家</text><br>') 
			API_ResponseWrite('<br><a href="MLB_GuiZeShuoMing">返回</a><br>') 
		else
			local WeekNum = PublicFun_GetWeekNum()
			local JiangLiGoodsIDTable = MLB_RandTop_RankList[SelectHuoDong].JiangLiGoodsID
			local JiangLiGoodsID = JiangLiGoodsIDTable[1]
			if math.mod(WeekNum,2) ~= 0 then
				JiangLiGoodsID = JiangLiGoodsIDTable[1]
			else
				JiangLiGoodsID = JiangLiGoodsIDTable[2]
			end
			local JiangLiGoodsNum = MLB_RandTop_RankList[SelectHuoDong].JiangLiGoodsNum
			local Top3JiangLiGoodsIDTable = MLB_RandTop_RankList[SelectHuoDong].Top3JiangLiGoodsID
			local Top3JiangLiGoodsID = Top3JiangLiGoodsIDTable[1]
			if math.mod(WeekNum,2) ~= 0 then
				Top3JiangLiGoodsID = Top3JiangLiGoodsIDTable[1]
			else
				Top3JiangLiGoodsID = Top3JiangLiGoodsIDTable[2]
			end
			local Top3JiangLiGoodsNum = MLB_RandTop_RankList[SelectHuoDong].Top3JiangLiGoodsNum
			API_ResponseWrite('<text>奖励：</text><br>') 
			API_ResponseWrite('<text>'..PaiHangBangName..'本周排行榜</text><text color="255,0,255">第一名</text><text>奖励：</text><img srcgd="'..JiangLiGoodsID..'" tipgd="'..JiangLiGoodsID..'" ><text>  ×'..JiangLiGoodsNum..'</text><br>') 
			API_ResponseWrite('<text>'..PaiHangBangName..'本周排行榜</text><text color="255,0,255">前三甲</text><text>奖励：</text><img srcgd="'..Top3JiangLiGoodsID..'" tipgd="'..Top3JiangLiGoodsID..'" ><text>  ×'..Top3JiangLiGoodsNum..'</text><br>') 
			if SelectHuoDong == 9 or SelectHuoDong == 10 or SelectHuoDong == 11 or SelectHuoDong == 12 then
				API_ResponseWrite('<text>4、本排行榜只统计</text><text color="255,0,255">31级以上每天正常拉锯次数内</text><text>的成绩</text><br>') 
			end
			API_ResponseWrite('<br><text>说明：</text><br>') 
			API_ResponseWrite('<text>1、本周排行榜从星期一零点开始统计，直到下一个星期一零点</text><br>') 
			API_ResponseWrite('<text>2、每个星期一零点会清除上一周的周排行榜统计数据</text><br>') 
			API_ResponseWrite('<text>3、奖励将在每星期一零点通过邮件发给获奖玩家</text><br>') 
			API_ResponseWrite('<br><a href="MLB_GuiZeShuoMing">返回</a><br>') 
		end
	end
end

function MLB_Scroll_Select(ActorID,SelectHuoDong)
		--API_TraceError("调用MLB_Scroll_Select函数")
	local ActorID = ActorID or API_RequestGetActorID()
	local SelectHuoDong = SelectHuoDong or API_RequestGetNumber(1)
	local DBTable = MLB_RandTop_RankList[SelectHuoDong]
	if DBTable == nil then
		
		return
	end
	local Page = API_RequestGetNumber(3)
		--API_TraceError("Page" ..Page)
	if Page ~= 999 and (Page < 0 or Page > 16) then
		return
	end
		--API_TraceError("SelectHuoDong" ..ActorID..SelectHuoDong)
	CRandTopSys:LoadList(ActorID, SelectHuoDong)
end

--定时清数据并发奖励
if API_GetServerID() == 1 then
	if MLB_TimerTriggerID == nil then
		MLB_TimerTriggerID = API_CreateTimerTriggerG(0,0,1,-1,'MLB_TimerTriggerCallFunc')
	else
		API_DestroyTriggerG(MLB_TimerTriggerID)
		MLB_TimerTriggerID = API_CreateTimerTriggerG(0,0,1,-1,'MLB_TimerTriggerCallFunc')
	end
end
--普通发排行榜奖励
function MLB_TimerTriggerCallFunc(Param1,Param2)
	if API_GetServerID() ~= 1 then
		return
	end
	if API_VarDataGetNumber_Ex(1,0,MLB_Initialization_DBSave,1,170) == 0 then
		return
	end
	if API_VarDataGetNumber_Ex(1,0,-2000,1,170) == 0 then
		return
	end
	local LastTime = API_VarDataGetNumber_Ex(1,0,MLB_Initialization_DBSave,1,1)
	if LastTime < PublicFun_GetWeekTime() then
		--记录本次重置时间
		local NowTime = os.time()
		API_VarDataSetNumber_Ex_Sync(1,0,MLB_Initialization_DBSave,1,1,NowTime)
		CRandTopSys:RandBalance(1)
		CRandTopSys:RandBalance(3)
		CRandTopSys:RandBalance(5)
		CRandTopSys:RandBalance(7)
		CRandTopSys:RandBalance(9)
		CRandTopSys:RandBalance(11)
		CRandTopSys:RandBalance(13)
		CRandTopSys:RandBalance(15)
		CRandTopSys:RandBalance(23)
		--CRandTopSys:RandBalance(17)
		local nShiFouStart = API_DiffDatatime(HLph_PeiHeHuoDong_StartTime.Year,HLph_PeiHeHuoDong_StartTime.Month,HLph_PeiHeHuoDong_StartTime.Day,HLph_PeiHeHuoDong_StartTime.Hour,HLph_PeiHeHuoDong_StartTime.Minute,HLph_PeiHeHuoDong_StartTime.Second)
		local nShiFouEnd = API_DiffDatatime(HLph_PeiHeHuoDong__EndTime.Year,HLph_PeiHeHuoDong__EndTime.Month,HLph_PeiHeHuoDong__EndTime.Day,HLph_PeiHeHuoDong__EndTime.Hour,HLph_PeiHeHuoDong__EndTime.Minute,HLph_PeiHeHuoDong__EndTime.Second)
		if nShiFouStart <= 0 and nShiFouEnd > 0 then		
		--if NowTime >= 1329062400 and NowTime < 1329670800 then
			CRandTopSys:RandBalance(25)
		end
		local nShiFouStart = API_DiffDatatime(HLsd_PeiHeHuoDong_StartTime.Year,HLsd_PeiHeHuoDong_StartTime.Month,HLsd_PeiHeHuoDong_StartTime.Day,HLsd_PeiHeHuoDong_StartTime.Hour,HLsd_PeiHeHuoDong_StartTime.Minute,HLsd_PeiHeHuoDong_StartTime.Second)
		local nShiFouEnd = API_DiffDatatime(HLsd_PeiHeHuoDong__EndTime.Year,HLsd_PeiHeHuoDong__EndTime.Month,HLsd_PeiHeHuoDong__EndTime.Day,HLsd_PeiHeHuoDong__EndTime.Hour,HLsd_PeiHeHuoDong__EndTime.Minute,HLsd_PeiHeHuoDong__EndTime.Second)
		if nShiFouStart <= 0 and nShiFouEnd > 0 then
		--if NowTime >= 1324310400 and NowTime < 1326042000 then
			CRandTopSys:RandBalance(22)
		end
	end
end

--{13,14,15,16,9,10,11,12,7,8,1,2,3,4,5,6,}

MLB_RandTop_RankList = {
	--财神宝箱周排名
	[1] = {
			nMode = 15,
			RankType = 1,
			PlayNameSize = '254',
			RankList = {
					{RankName = '本周财神宝箱使用次数',RankNameSize = '294',},
				},
			PaiHangBangName = '财神宝箱',
			JiangLiGoodsID = {[1]=32022,[2]=32018},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 0,
			Top3JiangLiGoodsID = {[1]=31021,[2]=31021},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 0,
			},
	--财神宝箱总排名
	[2] = {
			nMode = 15,
			RankType = 2,
			PlayNameSize = '254',
			RankList = {
					{RankName = '财神宝箱总使用次数',RankNameSize = '294',},
				},
			PaiHangBangName = '财神宝箱',
			JiangLiGoodsID = {[1]=32022,[2]=32018},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 0,
			Top3JiangLiGoodsID = {[1]=31021,[2]=31021},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 0,
			},
			
	--神秘之地周排名
	[3] = {
			nMode = 15,
			RankType = 1,
			PlayNameSize = '254',
			RankList = {
					{RankName = '本周神秘之地使用次数',RankNameSize = '294',},
				},
			PaiHangBangName = '神秘之地',
			JiangLiGoodsID = {[1]=32022,[2]=32018},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 0,
			Top3JiangLiGoodsID = {[1]=31020,[2]=31020},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 0,
			},
	--神秘之地总排名
	[4] = {
			nMode = 15,
			RankType = 2,
			PlayNameSize = '254',
			RankList = {
					{RankName = '神秘之地总使用次数',RankNameSize = '294',},
				},
			PaiHangBangName = '神秘之地',
			JiangLiGoodsID = {[1]=32022,[2]=32018},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 0,
			Top3JiangLiGoodsID = {[1]=31020,[2]=31020},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 0,
			},
	
	--深寒地宫周排名
	[5] = {
			nMode = 15,
			RankType = 1,
			PlayNameSize = '254',
			RankList = {
					{RankName = '本周深寒地宫使用次数',RankNameSize = '294',},
				},
			PaiHangBangName = '深寒地宫',
			JiangLiGoodsID = {[1]=32018,[2]=32022},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 0,
			Top3JiangLiGoodsID = {[1]=31020,[2]=31020},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 0,
			},
	--深寒地宫总排名
	[6] = {
			nMode = 15,
			RankType = 2,
			PlayNameSize = '254',
			RankList = {
					{RankName = '深寒地宫总使用次数',RankNameSize = '294',},
				},
			PaiHangBangName = '深寒地宫',
			JiangLiGoodsID = {[1]=32018,[2]=32022},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 0,
			Top3JiangLiGoodsID = {[1]=31020,[2]=31020},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 0,
			},
			
	--夺宝奇兵周排名
	[7] = {
			nMode = 15,
			RankType = 1,
			PlayNameSize = '254',
			RankList = {
					{RankName = '本周夺宝奇兵使用次数',RankNameSize = '294',},
				},
			PaiHangBangName = '夺宝奇兵',
			JiangLiGoodsID = {[1]=32018,[2]=32022},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 0,
			Top3JiangLiGoodsID = {[1]=31021,[2]=31021},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 0,
			},
	--夺宝奇兵总排名
	[8] = {
			nMode = 15,
			RankType = 2,
			PlayNameSize = '254',
			RankList = {
					{RankName = '夺宝奇兵总使用次数',RankNameSize = '294',},
				},
			PaiHangBangName = '夺宝奇兵',
			JiangLiGoodsID = {[1]=32018,[2]=32022},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 0,
			Top3JiangLiGoodsID = {[1]=31021,[2]=31021},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 0,
			},
			
	--拉锯关门后杀人次数周排名
	[9] = {
			nMode = 15,
			RankType = 1,
			PlayNameSize = '254',
			RankList = {
					{RankName = '本周31级以上拉锯战关门后击杀次数',RankNameSize = '294',},
				},
			PaiHangBangName = '拉锯击杀',
			JiangLiGoodsID = {[1]=88938,[2]=88935},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88939,[2]=88936},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
	--拉锯关门后杀人次数总排名
	[10] = {
			nMode = 15,
			RankType = 2,
			PlayNameSize = '254',
			RankList = {
					{RankName = '31级以上拉锯战关门后总击杀次数',RankNameSize = '294',},
				},
			PaiHangBangName = '拉锯击杀',
			JiangLiGoodsID = {[1]=88938,[2]=88935},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88939,[2]=88936},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
	
	--拉锯胜利次数周排名
	[11] = {
			nMode = 15,
			RankType = 1,
			PlayNameSize = '254',
			RankList = {
					{RankName = '本周31级以上拉锯战胜利次数',RankNameSize = '294',},
				},
			PaiHangBangName = '拉锯胜利',
			JiangLiGoodsID = {[1]=88938,[2]=88935},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88939,[2]=88936},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
	--拉锯胜利次数总排名
	[12] = {
			nMode = 15,
			RankType = 2,
			PlayNameSize = '254',
			RankList = {
					{RankName = '31级以上拉锯战总胜利次数',RankNameSize = '294',},
				},
			PaiHangBangName = '拉锯胜利',
			JiangLiGoodsID = {[1]=88938,[2]=88935},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88939,[2]=88936},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
	
	--英雄之塔周排名
	[13] = {
			nMode = 0,
			RankType = 1,
			PlayNameSize = '148',
			RankList = {
					{RankName = '最高挑战层数',RankNameSize = '100',},
					{RankName = '最快挑战时间',RankNameSize = '100',},
					{RankName = 'BOSS击杀数量',RankNameSize = '100',},
					{RankName = '精英击杀数量',RankNameSize = '100',},
				},
			PaiHangBangName = '英雄之塔',
			JiangLiGoodsID = {[1]=88935,[2]=88938},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88936,[2]=88939},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
	--英雄之塔总排名
	[14] = {
			nMode = 0,
			RankType = 2,
			PlayNameSize = '148',
			RankList = {
					{RankName = '最高挑战层数',RankNameSize = '100',},
					{RankName = '最快挑战时间',RankNameSize = '100',},
					{RankName = 'BOSS击杀数量',RankNameSize = '100',},
					{RankName = '精英击杀数量',RankNameSize = '100',},
				},
			PaiHangBangName = '英雄之塔',
			JiangLiGoodsID = {[1]=88935,[2]=88938},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88936,[2]=88939},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
	
	--庄园人气周排名
	[15] = {
			nMode = 13,
			RankType = 1,
			PlayNameSize = '148',
			RankList = {
					{RankName = '庄园人气',RankNameSize = '110',},
					{RankName = '庄园等级',RankNameSize = '70',},
					{RankName = '庄园名称',RankNameSize = '155',},
					{RankName = '阵  营',RankNameSize = '75',},
				},
			PaiHangBangName = '庄园人气',
			JiangLiGoodsID = {[1]=88935,[2]=88938},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88936,[2]=88939},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
	--庄园人气总排名
	[16] = {
			nMode = 13,
			RankType = 2,
			PlayNameSize = '148',
			RankList = {
					{RankName = '庄园人气',RankNameSize = '110',},
					{RankName = '庄园等级',RankNameSize = '70',},
					{RankName = '庄园名称',RankNameSize = '155',},
					{RankName = '阵  营',RankNameSize = '75',},
				},
			PaiHangBangName = '庄园人气',
			JiangLiGoodsID = {[1]=88935,[2]=88938},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88936,[2]=88939},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},	
	
	--2010圣诞节周排名
	[17] = {
			nMode = 0,
			RankType = 1,
			PlayNameSize = '148',
			RankList = {
					{RankName = '轮  数',RankNameSize = '60',},
					{RankName = '总击杀怪数',RankNameSize = '100',},
					{RankName = '精英怪击杀数量',RankNameSize = '120',},
					{RankName = '普通怪击杀数量',RankNameSize = '120',},
				},
			PaiHangBangName = '冰雪寒宫',
			JiangLiGoodsID = {[1]=32023,[2]=32023},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88936,[2]=88939},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
	--2010圣诞节总排名
	[18] = {
			nMode = 0,
			RankType = 2,
			PlayNameSize = '148',
			RankList = {
					{RankName = '轮  数',RankNameSize = '60',},
					{RankName = '总击杀怪数',RankNameSize = '100',},
					{RankName = '精英怪击杀数量',RankNameSize = '120',},
					{RankName = '普通怪击杀数量',RankNameSize = '120',},
				},
			PaiHangBangName = '冰雪寒宫',
			JiangLiGoodsID = {[1]=32023,[2]=32023},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88936,[2]=88939},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
	--2011情人节周排名
	--[19] = {
			--nMode = 15,
			--RankType = 1,
			--PlayNameSize = '254',
			--RankList = {
			--		{RankName = '获得爱慕次数',RankNameSize = '294',},
			--	},
			--PaiHangBangName = '魅力达人',
			--JiangLiGoodsID = {[1]=88938,[2]=88935},
			--JiangLiGoodsNum = 1,
			--JiangLiGoodsBind = 3,
			--Top3JiangLiGoodsID = {[1]=88939,[2]=88936},
			--Top3JiangLiGoodsNum = 1,
			--Top3JiangLiGoodsBind = 3,
			--},
	--2011情人节总排名
	--[20] = {
			--nMode = 15,
			--RankType = 2,
			--PlayNameSize = '254',
			--RankList = {
			--		{RankName = '获得爱慕总次数',RankNameSize = '294',},
			--	},
			--PaiHangBangName = '魅力达人',
			--JiangLiGoodsID = {[1]=88938,[2]=88935},
			--JiangLiGoodsNum = 1,
			--JiangLiGoodsBind = 3,
			--Top3JiangLiGoodsID = {[1]=88939,[2]=88936},
			--Top3JiangLiGoodsNum = 1,
			--Top3JiangLiGoodsBind = 3,
			--},
	--阵营战杀人榜
	[21] = {
			nMode = 13,
			RankType = 0,
			PlayNameSize = '148',
			RankList = {
					{RankName = '击 杀 数',RankNameSize = '110',},
					{RankName = '角色等级',RankNameSize = '70',},
					{RankName = '兵团名称',RankNameSize = '155',},
					{RankName = '阵  营',RankNameSize = '75',},
				},
			PaiHangBangName = '击 杀 榜',
			JiangLiGoodsID = {[1]=0,[2]=0},
			JiangLiGoodsNum = 0,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=0,[2]=0},
			Top3JiangLiGoodsNum = 0,
			Top3JiangLiGoodsBind = 3,
			},
	--2011圣诞祝福榜
	[22] = {
			nMode = 15,
			RankType = 1,
			PlayNameSize = '254',
			RankList = {
					{RankName = '获得祝福次数',RankNameSize = '294',},
				},
			PaiHangBangName = '圣诞祝福',
			JiangLiGoodsID = {[1]=88938,[2]=88935},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88939,[2]=88936},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
			
--	--竞技场周排行
--	[23] = {
--			nMode = 15,
--			RankType = 1,
--			PlayNameSize = '254',
--			RankList = {
--					{RankName = '竞技场积分',RankNameSize = '294',},
--				},
--			PaiHangBangName = '竞技场',
--			JiangLiGoodsID = {[1]=88938,[2]=88935},
--			JiangLiGoodsNum = 1,
--			JiangLiGoodsBind = 3,
--			Top3JiangLiGoodsID = {[1]=88939,[2]=88936},
--			Top3JiangLiGoodsNum = 1,
--			Top3JiangLiGoodsBind = 3,
--			},

--	--竞技场总排行
--	[24] = {
--			nMode = 15,
--			RankType = 2,
--			PlayNameSize = '254',
--			RankList = {
--					{RankName = '竞技场积分',RankNameSize = '294',},
--				},
--			PaiHangBangName = '竞技场',
--			JiangLiGoodsID = {[1]=88938,[2]=88935},
--			JiangLiGoodsNum = 1,
--			JiangLiGoodsBind = 3,
--			Top3JiangLiGoodsID = {[1]=88939,[2]=88936},
--			Top3JiangLiGoodsNum = 1,
--			Top3JiangLiGoodsBind = 3,
--			},
	--2012情人节周排名
	[25] = {
			nMode = 15,
			RankType = 1,
			PlayNameSize = '254',
			RankList = {
					{RankName = '获得鲜花次数',RankNameSize = '294',},
				},
			PaiHangBangName = '魅力达人',
			JiangLiGoodsID = {[1]=88938,[2]=88935},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88939,[2]=88936},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
	--2012情人节总排名
	[26] = {
			nMode = 15,
			RankType = 2,
			PlayNameSize = '254',
			RankList = {
					{RankName = '获得鲜花总次数',RankNameSize = '294',},
				},
			PaiHangBangName = '魅力达人',
			JiangLiGoodsID = {[1]=88938,[2]=88935},
			JiangLiGoodsNum = 1,
			JiangLiGoodsBind = 3,
			Top3JiangLiGoodsID = {[1]=88939,[2]=88936},
			Top3JiangLiGoodsNum = 1,
			Top3JiangLiGoodsBind = 3,
			},
}

WYL_2011ShengDan_EWaiJiangLiGoodsTab = {
{GoodsID=80274,GoodsNum=5,GaiLv=1000,Flag=0},
{GoodsID=80397,GoodsNum=10,GaiLv=1000,Flag=0},
{GoodsID=250,GoodsNum=10,GaiLv=1000,Flag=0},
{GoodsID=568,GoodsNum=10,GaiLv=1000,Flag=0},
{GoodsID=80686,GoodsNum=5,GaiLv=1000,Flag=0},
{GoodsID=80689,GoodsNum=5,GaiLv=1000,Flag=0},
{GoodsID=31101,GoodsNum=5,GaiLv=1000,Flag=0},
{GoodsID=89040,GoodsNum=1,GaiLv=1000,Flag=0},
{GoodsID=89041,GoodsNum=1,GaiLv=1000,Flag=0},
{GoodsID=89042,GoodsNum=1,GaiLv=1000,Flag=0},
}

--湘军模块
--定义接收排行数据的回调函数
function RandTop_OnDataLoad(ActorID,lRandType)
	if ActorID == 0 then
		return
	end
	local RankTab = MLB_RandTop_RankList[lRandType] 
	--循环表，先设置玩家名次变量为0，如果有则赋值
	local ActorName = API_GetActorName(ActorID)
	local ActorMingCi = 0
	
	local oTopList = CRandTopSys:GetList(lRandType)
	
	if oTopList == nil then
		return
	end
	
	local tItem = oTopList:GetItemByKey(ActorID)
	if tItem ~= nil then
		ActorMingCi = tItem.nIndex 
	end
	--打印面板表头
	local PaiHangBangType = 5
	if lRandType == 15 or lRandType == 16 then
		PaiHangBangType = 6
	end
	local RankType = RankTab.RankType
	local RankTypeName = '本周排名' 
	if RankType ~= 1 then
		RankTypeName = '总排名'
	end
	if lRandType == 21 then
		RankTypeName = '击杀排名'
	end
	local RankName = ''
	local Size = '100,'
	Size = Size..RankTab.PlayNameSize
	for i = 1,table.getn(RankTab.RankList) do
		RankName = RankName ..','..RankTab.RankList[i].RankName
		Size = Size..','..RankTab.RankList[i].RankNameSize
	end
	API_ConsortiaRankInfo(ActorID,PaiHangBangType,3,'<Info name=\"'..RankTypeName..',玩家名字'..RankName..'\" width=\"'..Size..'\" myrank=\"'..ActorMingCi..'\" allrank=\"'..ActorMingCi..'\">')
	local Info = ''
	--循环表，链接各种信息
	--打印信息
	--找到了 洗具 循环取数据
	for v in oTopList:Itemiter() do
		--数据v为IRandTopListItem类型
		--处理数据示范: 
		--API_Trace( "排名:"..v.nIndex..", Key="..v.nKey..", Value1="..v.nValue1..", Value2="..v.nValue2..",Value3="..v.nValue3..",Value4="..v.nValue4..",sAttInf="..v.sAttInf)
		--分段取出字符串操作
		local tStrList = {} 
		local strDesc = v.sAttInf
		local strItem = "" 
		while true do 
			i,j = string.find(strDesc, "," ) 
			if i == nil or j == nil then 
				table.insert(tStrList, strDesc) 
				break 
			end 
			strItem = string.sub(strDesc,1,i-1) 
			table.insert(tStrList, strItem) 
			strDesc = string.sub(strDesc,j+1,string.len(strDesc)) 
		end 
		local RankPlayName = tStrList[1]
		local RankPlayHouseName = tStrList[2]
		local RankPlayCamp = tStrList[3]
		--分段取字符串结束
		
		

		if RankPlayName == '' then
			RankPlayName = '无'
		end
		-- v 是控制，报错了
		Info = Info..'<lt>'..v.nIndex..','..RankPlayName
		--判断链接文字还是数字
		local ZhongNum = ''
		local LinShiTab = {}
		LinShiTab[1] = v.nValue1
		LinShiTab[2] = v.nValue2
		LinShiTab[3] = v.nValue3
		LinShiTab[4] = v.nValue4
		if lRandType == 15 or lRandType == 16 or lRandType == 21 then --如果是庄园
			if RankPlayCamp ~= '帝国' and RankPlayCamp ~= '联邦' then
				RankPlayCamp = '玩家'
			end
			ZhongNum = ZhongNum..','..v.nValue1..','..v.nValue2..','..RankPlayHouseName..','..RankPlayCamp
		else
			--ZhongNum = ZhongNum..','..v.nValue1..','..v.nValue2..','..v.nValue3..','..v.nValue4
			for i = 1,table.getn(RankTab.RankList) do
				ZhongNum = ZhongNum..','..LinShiTab[i]
			end
		end
		Info = Info..','..ZhongNum
		
		Info = Info..'-'..v.nKey
		Info = Info..'</lt>'
		--API_Trace(Info)
		if math.mod(v.nIndex,10) == 0 then 
			API_ConsortiaRankInfo(ActorID,PaiHangBangType,3,Info) 
			Info = '' 
		end 
		if v.nIndex >= 100 then
			break
		end
	end
	
	API_ConsortiaRankInfo(ActorID,PaiHangBangType,3,Info)
	API_ConsortiaRankInfo(ActorID,PaiHangBangType,3,'</Info>')
end

--定义接收排行结算数据的回调函数
function RandTop_OnAwardBalance(lRandType, tItem)
	--API_Trace('第1111')
	if MLB_RandTop_RankList[lRandType] == nil then
		return
	end
	if MLB_RandTop_RankList[lRandType].RankType ~= 1 then
		return
	end
	
	--分段取出字符串操作
	local tStrList = {} 
	local strDesc = tItem.sAttInf
	local strItem = "" 
	while true do 
		i,j = string.find(strDesc, "," ) 
		if i == nil or j == nil then 
			table.insert(tStrList, strDesc) 
			break 
		end 
		strItem = string.sub(strDesc,1,i-1) 
		table.insert(tStrList, strItem) 
		strDesc = string.sub(strDesc,j+1,string.len(strDesc)) 
	end 
	local RankPlayName = tStrList[1]
	local RankPlayHouseName = tStrList[2]
	local RankPlayCamp = tStrList[3]
	--分段取字符串结束
	if RankPlayName == nil or type(RankPlayName) ~= 'string' then
		return
	end
	
	--发奖励
	local WeekNum = PublicFun_GetWeekNum()
	local JiangLiGoodsIDTable = MLB_RandTop_RankList[lRandType].JiangLiGoodsID
	local JiangLiGoodsID = JiangLiGoodsIDTable[1]
	if math.mod(WeekNum,2) == 0 then
		JiangLiGoodsID = JiangLiGoodsIDTable[1]
	else
		JiangLiGoodsID = JiangLiGoodsIDTable[2]
	end
	local JiangLiGoodsNum = MLB_RandTop_RankList[lRandType].JiangLiGoodsNum
	local JiangLiGoodsBind = MLB_RandTop_RankList[lRandType].JiangLiGoodsBind
	local PaiHangBangName = MLB_RandTop_RankList[lRandType].PaiHangBangName
	
	if lRandType == 25 then
		API_Trace(PaiHangBangName..'第'..tItem.nIndex..'名：'..RankPlayName..'；成绩：'.. tItem.nValue1)
		if tItem.nIndex == 1 then
			API_SendActorMailByName(RankPlayName,11600,1,0,'上周'..PaiHangBangName..'第一名','恭喜您成为上周'..PaiHangBangName..'第一名，系统奖励您1个'..API_GetGoodsName(11600)..' !')
			API_SendActorMailByName(RankPlayName,11601,1,0,'上周'..PaiHangBangName..'第一名','恭喜您成为上周'..PaiHangBangName..'第一名，系统奖励您1个'..API_GetGoodsName(11601)..' !')
			API_SendActorMailByName(RankPlayName,11602,1,0,'上周'..PaiHangBangName..'第一名','恭喜您成为上周'..PaiHangBangName..'第一名，系统奖励您1个'..API_GetGoodsName(11602)..' !')
			API_SendActorMailByName(RankPlayName,11603,1,0,'上周'..PaiHangBangName..'第一名','恭喜您成为上周'..PaiHangBangName..'第一名，系统奖励您1个'..API_GetGoodsName(11603)..' !')
			--API_SendActorMailByName(RankPlayName,11278,2,0,'上周'..PaiHangBangName..'第一名','恭喜您成为上周'..PaiHangBangName..'第一名，系统奖励您2个'..API_GetGoodsName(11278)..' !')
			--公告
			if not API_IsBattleGameServer() then
				 API_ActorBroadcastMsg(-1,5,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(11600)..'”、“'..API_GetGoodsName(11601)..'”、“'..API_GetGoodsName(11602)..'”、“'..API_GetGoodsName(11603)..'”！')
				 API_ActorBroadcastMsg(-1,7,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(11600)..'”、“'..API_GetGoodsName(11601)..'”、“'..API_GetGoodsName(11602)..'”、“'..API_GetGoodsName(11603)..'”！')
				API_ActorBroadcastMsg(-1,17,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(11600)..'”、“'..API_GetGoodsName(11601)..'”、“'..API_GetGoodsName(11602)..'”、“'..API_GetGoodsName(11603)..'”！')
				API_ActorBroadcastMsg(-1,21,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(11600)..'”、“'..API_GetGoodsName(11601)..'”、“'..API_GetGoodsName(11602)..'”、“'..API_GetGoodsName(11603)..'”！')
				
				--API_ActorBroadcastMsg(-1,7,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(11335)..'”、“'..API_GetGoodsName(11336)..'”、“'..API_GetGoodsName(11278)..'” X 2！')
				--API_ActorBroadcastMsg(-1,17,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(11335)..'”、“'..API_GetGoodsName(11336)..'”、“'..API_GetGoodsName(11278)..'” X 2！')
				--API_ActorBroadcastMsg(-1,21,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(11335)..'”、“'..API_GetGoodsName(11336)..'”、“'..API_GetGoodsName(11278)..'” X 2！')
			end
		end
		if tItem.nIndex == 2 then
			API_SendActorMailByName(RankPlayName,11112,2,0,'上周'..PaiHangBangName..'第二名','恭喜您成为上周'..PaiHangBangName..'第二名，系统奖励您2个'..API_GetGoodsName(11112)..' !')
			API_SendActorMailByName(RankPlayName,11278,2,0,'上周'..PaiHangBangName..'第二名','恭喜您成为上周'..PaiHangBangName..'第二名，系统奖励您2个'..API_GetGoodsName(11278)..' !')
		end
		if tItem.nIndex == 3 then
			API_SendActorMailByName(RankPlayName,11278,2,0,'上周'..PaiHangBangName..'第三名','恭喜您成为上周'..PaiHangBangName..'第三名，系统奖励您2个'..API_GetGoodsName(11278)..' !')
		end
		return
	end
	if lRandType == 22 then
		API_Trace(PaiHangBangName..'第'..tItem.nIndex..'名：'..RankPlayName..'；成绩：'.. tItem.nValue1)
		if tItem.nIndex == 1 then
			API_SendActorMailByName(RankPlayName,89202,1,0,'上周'..PaiHangBangName..'第一名','恭喜您成为上周'..PaiHangBangName..'第一名，系统奖励您1个'..API_GetGoodsName(89202)..' !')
			API_SendActorMailByName(RankPlayName,11509,1,0,'上周'..PaiHangBangName..'第一名','恭喜您成为上周'..PaiHangBangName..'第一名，系统奖励您1个'..API_GetGoodsName(11509)..' !')
			API_SendActorMailByName(RankPlayName,11510,1,0,'上周'..PaiHangBangName..'第一名','恭喜您成为上周'..PaiHangBangName..'第一名，系统奖励您1个'..API_GetGoodsName(11510)..' !')
			--公告
			if not API_IsBattleGameServer() then
				API_ActorBroadcastMsg(-1,5,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(89202)..'”、“'..API_GetGoodsName(11509)..'”、“'..API_GetGoodsName(11510)..'”！')
				API_ActorBroadcastMsg(-1,7,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(89202)..'”、“'..API_GetGoodsName(11509)..'”、“'..API_GetGoodsName(11510)..'”！')
				API_ActorBroadcastMsg(-1,17,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(89202)..'”、“'..API_GetGoodsName(11509)..'”、“'..API_GetGoodsName(11510)..'”！')
				API_ActorBroadcastMsg(-1,21,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(89202)..'”、“'..API_GetGoodsName(11509)..'”、“'..API_GetGoodsName(11510)..'”！')
			end
		end
		if tItem.nIndex == 2 then
			API_SendActorMailByName(RankPlayName,89202,1,0,'上周'..PaiHangBangName..'第二名','恭喜您成为上周'..PaiHangBangName..'第二名，系统奖励您1个'..API_GetGoodsName(89202)..' !')
			--API_SendActorMailByName(RankPlayName,11278,2,0,'上周'..PaiHangBangName..'第二名','恭喜您成为上周'..PaiHangBangName..'第二名，系统奖励您2个'..API_GetGoodsName(11278)..' !')
		end
		if tItem.nIndex == 3 then
			API_SendActorMailByName(RankPlayName,11511,1,0,'上周'..PaiHangBangName..'第三名','恭喜您成为上周'..PaiHangBangName..'第三名，系统奖励您1个'..API_GetGoodsName(11511)..' !')
			API_SendActorMailByName(RankPlayName,11512,1,0,'上周'..PaiHangBangName..'第三名','恭喜您成为上周'..PaiHangBangName..'第三名，系统奖励您1个'..API_GetGoodsName(11512)..' !')
		end
		if tItem.nIndex > 3 then
			local RD = math.random(10000)
			for j in WYL_2011ShengDan_EWaiJiangLiGoodsTab do
				local GoodsID = WYL_2011ShengDan_EWaiJiangLiGoodsTab[j].GoodsID
				local GoodsNum = WYL_2011ShengDan_EWaiJiangLiGoodsTab[j].GoodsNum
				local GaiLv = WYL_2011ShengDan_EWaiJiangLiGoodsTab[j].GaiLv
				if RD <= GaiLv then
					API_SendActorMailByName(RankPlayName,GoodsID,GoodsNum,0,'上周'..PaiHangBangName..'幸运奖','恭喜您获得上周'..PaiHangBangName..'的幸运奖：'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..' !')
					break
				end
			end
		end
		return
	end
	--竞技场排行奖励
	if lRandType == 23 then
		API_Trace(PaiHangBangName..'第'..tItem.nIndex..'名：'..RankPlayName..'；成绩：'.. tItem.nValue1)
		if tItem.nIndex == 1 then
			API_SendActorMailByName(RankPlayName,89150,1,0,'上周'..PaiHangBangName..'第一名','恭喜您成为上周'..PaiHangBangName..'第一名，系统奖励您1个'..API_GetGoodsName(89150)..' !')
			API_SendActorMailByName(RankPlayName,82004,500,0,'上周'..PaiHangBangName..'1-10名','系统奖励您500个'..API_GetGoodsName(82004)..' !')
			--公告
			if not API_IsBattleGameServer() then
				API_ActorBroadcastMsg(-1,5,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(89150)..'”！')
				API_ActorBroadcastMsg(-1,7,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(89150)..'”！')
				API_ActorBroadcastMsg(-1,17,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(89150)..'”！')
				API_ActorBroadcastMsg(-1,21,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(89150)..'”！')
			end
		end
		if tItem.nIndex == 2 then
			API_SendActorMailByName(RankPlayName,89151,1,0,'上周'..PaiHangBangName..'第二名','恭喜您成为上周'..PaiHangBangName..'第二名，系统奖励您1个'..API_GetGoodsName(89151)..' !')
			API_SendActorMailByName(RankPlayName,82004,500,0,'上周'..PaiHangBangName..'1-10名','系统奖励您500个'..API_GetGoodsName(82004)..' !')
		end
		if tItem.nIndex == 3 then
			API_SendActorMailByName(RankPlayName,89152,1,0,'上周'..PaiHangBangName..'第三名','恭喜您成为上周'..PaiHangBangName..'第三名，系统奖励您1个'..API_GetGoodsName(89152)..' !')
			API_SendActorMailByName(RankPlayName,82004,500,0,'上周'..PaiHangBangName..'1-10名','系统奖励您500个'..API_GetGoodsName(82004)..' !')
		end
		if tItem.nIndex > 3 and tItem.nIndex < 11 then
			API_SendActorMailByName(RankPlayName,82004,500,0,'上周'..PaiHangBangName..'1-10名','系统奖励您500个'..API_GetGoodsName(82004)..' !')
		end
		if tItem.nIndex > 10 and tItem.nIndex < 31 then
			API_SendActorMailByName(RankPlayName,82004,200,0,'上周'..PaiHangBangName..'11-30名','系统奖励您200个'..API_GetGoodsName(82004)..' !')
		end
		if tItem.nIndex > 30 and tItem.nIndex < 101 then
			API_SendActorMailByName(RankPlayName,82004,50,0,'上周'..PaiHangBangName..'31-100名','系统奖励您50个'..API_GetGoodsName(82004)..' !')
		end
		return
	end
	
	API_Trace(PaiHangBangName..'第'..tItem.nIndex..'名：'..RankPlayName..'；成绩：'.. tItem.nValue1)
	
	if tItem.nIndex == 1 then
		if JiangLiGoodsID > 0 and JiangLiGoodsNum > 0 then
			API_SendActorMailByName(RankPlayName,JiangLiGoodsID,JiangLiGoodsNum,JiangLiGoodsBind,'上周'..PaiHangBangName..'第一名','恭喜您成为上周'..PaiHangBangName..'第一名，系统奖励您'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..' !')
			--公告
			if not API_IsBattleGameServer() then
				API_ActorBroadcastMsg(-1,5,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(JiangLiGoodsID)..'” x '..JiangLiGoodsNum..'！')
				API_ActorBroadcastMsg(-1,7,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(JiangLiGoodsID)..'” x '..JiangLiGoodsNum..'！')
				API_ActorBroadcastMsg(-1,17,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(JiangLiGoodsID)..'” x '..JiangLiGoodsNum..'！')
				API_ActorBroadcastMsg(-1,21,''..RankPlayName..'成为上周“'..PaiHangBangName..'”第一人，获得系统奖励：“'..API_GetGoodsName(JiangLiGoodsID)..'” x '..JiangLiGoodsNum..'！')
			end
		end
	end
	local Top3JiangLiGoodsIDTable = MLB_RandTop_RankList[lRandType].Top3JiangLiGoodsID
	local Top3JiangLiGoodsID = Top3JiangLiGoodsIDTable[1]
	if math.mod(WeekNum,2) == 0 then
		Top3JiangLiGoodsID = Top3JiangLiGoodsIDTable[1]
	else
		Top3JiangLiGoodsID = Top3JiangLiGoodsIDTable[2]
	end
	local Top3JiangLiGoodsNum = MLB_RandTop_RankList[lRandType].Top3JiangLiGoodsNum
	local Top3JiangLiGoodsBind = MLB_RandTop_RankList[lRandType].Top3JiangLiGoodsBind
	if tItem.nIndex <= 3 then	
		if Top3JiangLiGoodsID > 0 and Top3JiangLiGoodsNum > 0 then
			API_SendActorMailByName(RankPlayName,Top3JiangLiGoodsID,Top3JiangLiGoodsNum,Top3JiangLiGoodsBind,'上周'..PaiHangBangName..'第'..PublicFun_ArabianNumberToChineseNumber(tItem.nIndex)..'名','恭喜您成为上周'..PaiHangBangName..'第'..PublicFun_ArabianNumberToChineseNumber(tItem.nIndex)..'名，系统奖励您'..Top3JiangLiGoodsNum..'个'..API_GetGoodsName(Top3JiangLiGoodsID)..' !')

		end
	end
	--通过lRandType判断是哪个排行榜的奖励
	--访问 tItem.nIndex ,tItem.nKey,tItem.nValue1,tItem.nValue2,tItem.nValue3,tItem.nValue4,tItem.sAttInf 来处理给tItem对应的对象发奖
	if lRandType == 1 then --财神给额外称号奖励周
		local Time = os.time()
		if Time > 1324656000 and Time < 1325437200 then
			if tItem.nIndex == 1 then
				API_SendActorMailByName(RankPlayName,89096,1,1,'上周'..PaiHangBangName..'第'..PublicFun_ArabianNumberToChineseNumber(tItem.nIndex)..'名','恭喜您成为上周'..PaiHangBangName..'第'..PublicFun_ArabianNumberToChineseNumber(tItem.nIndex)..'名，系统奖励您1个'..API_GetGoodsName(89096)..' !')
			end
			if tItem.nIndex == 2 or tItem.nIndex == 3 then
				API_SendActorMailByName(RankPlayName,89097,1,1,'上周'..PaiHangBangName..'第'..PublicFun_ArabianNumberToChineseNumber(tItem.nIndex)..'名','恭喜您成为上周'..PaiHangBangName..'第'..PublicFun_ArabianNumberToChineseNumber(tItem.nIndex)..'名，系统奖励您1个'..API_GetGoodsName(89097)..' !')
			end
			if tItem.nIndex > 3 and tItem.nIndex < 11 then
				API_SendActorMailByName(RankPlayName,89098,1,1,'上周'..PaiHangBangName..'第'..PublicFun_ArabianNumberToChineseNumber(tItem.nIndex)..'名','恭喜您成为上周'..PaiHangBangName..'第'..PublicFun_ArabianNumberToChineseNumber(tItem.nIndex)..'名，系统奖励您1个'..API_GetGoodsName(89098)..' !')
			end
		end
	end
end

CRandTopSys:Set_Dataload_Handle(RandTop_OnDataLoad) --向RandTopSys注册回调函数
CRandTopSys:Set_Award_Handle(RandTop_OnAwardBalance)
--湘军模块
