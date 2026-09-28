--兵团人气排行榜
--/nRankType:排名项类型
--11 联邦兄弟会排行
--12 帝国兄弟会排行
--13 全部兄弟会排行
--2008.12.12
--林瑞宇
function PHB_XiongDiHuiPaiHangBang_Title(ActorID) --函数名要替换
	if ActorID == nil or ActorID == 0 then
		ActorID = API_RequestGetActorID()
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local zuotianriqi = 0	
	if PHB_xiongdihuishengwangshuchutable == nil then     --表要改变
		PHB_xiongdihuishengwangshuchutable = {}
	end	
	if PHB_xiongdihuishengwangshuchutable.quanburenqi1 == nil then
		if Hour < 3 then
			local t = os.date("*t",os.time())
			t.day = t.day-1
			zuotianriqi = os.date("%Y%m%d",(os.time(t))) 
		else
			local t = os.date("*t",os.time())
			zuotianriqi = os.date("%Y%m%d",(os.time(t))) 
		end
		PHB_xiongdihuishengwangshuchutable = {}
		PHB_xiongdihuinumqueren = 0
		API_SelectStatistic(ActorID,11,100,zuotianriqi,'PHB_xiongdihuishengwangshuchu')--这里有BUG现在只能查100个 回调函数名字
		API_SelectStatistic(ActorID,12,100,zuotianriqi,'PHB_xiongdihuishengwangshuchu')--这里有BUG现在只能查100个 回调函数名字	
		API_SelectStatistic(ActorID,13,100,zuotianriqi,'PHB_xiongdihuishengwangshuchu')--这里有BUG现在只能查100个 回调函数名字
	else
		if Hour < 3 then
		else
			local riqi = PHB_xiongdihuishengwangshuchutable.riqi --存储今天的日期 日期相同 就直接取 不相同就把表清空 重新来（表要改）
			local nowtime = API_GetDatatime(8) --一年中的第几天
			if nowtime ~= riqi then
				local t = os.date("*t",os.time())
				zuotianriqi = os.date("%Y%m%d",(os.time(t))) 
				PHB_xiongdihuishengwangshuchutable = {} --表要改
				PHB_xiongdihuinumqueren = 0
				API_SelectStatistic(ActorID,11,100,zuotianriqi,'PHB_xiongdihuishengwangshuchu')--这里有BUG现在只能查100个 回调函数名字
				API_SelectStatistic(ActorID,12,100,zuotianriqi,'PHB_xiongdihuishengwangshuchu')--这里有BUG现在只能查100个 回调函数名字
				API_SelectStatistic(ActorID,13,100,zuotianriqi,'PHB_xiongdihuishengwangshuchu')--这里有BUG现在只能查100个 回调函数名字
					return
			end
		end
		local lianbangnTotalNum = PHB_xiongdihuishengwangshuchutable.lianbangnTotalNum	
		local quanbunTotalNum = PHB_xiongdihuishengwangshuchutable.quanbunTotalNum
		local diguonTotalNum = PHB_xiongdihuishengwangshuchutable.diguonTotalNum
		
		local zj = API_GetActorRank(ActorID,6)
		local qb = API_GetActorRank(ActorID,7)
		
		if lianbangnTotalNum > 0 and lianbangnTotalNum < 31 then
			local lianbangrenqi1 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi1
			API_ConsortiaRankInfo(ActorID,4,2,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1..'</Info>')
		elseif lianbangnTotalNum > 30 and lianbangnTotalNum < 61 then
			local lianbangrenqi1 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi1
			local lianbangrenqi2 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi2
			API_ConsortiaRankInfo(ActorID,4,2,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1)
			API_ConsortiaRankInfo(ActorID,4,2,lianbangrenqi2..'</Info>')
		elseif lianbangnTotalNum > 60 and lianbangnTotalNum < 91 then
			local lianbangrenqi1 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi1
			local lianbangrenqi2 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi2
			local lianbangrenqi3 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi3
			API_ConsortiaRankInfo(ActorID,4,2,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1)
			API_ConsortiaRankInfo(ActorID,4,2,lianbangrenqi2)
			API_ConsortiaRankInfo(ActorID,4,2,lianbangrenqi3..'</Info>')			
		elseif lianbangnTotalNum > 90 and lianbangnTotalNum < 101 then
			local lianbangrenqi1 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi1
			local lianbangrenqi2 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi2
			local lianbangrenqi3 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi3
			local lianbangrenqi4 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi4
			API_ConsortiaRankInfo(ActorID,4,2,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1)
			API_ConsortiaRankInfo(ActorID,4,2,lianbangrenqi2)
			API_ConsortiaRankInfo(ActorID,4,2,lianbangrenqi3)
			API_ConsortiaRankInfo(ActorID,4,2,lianbangrenqi4..'</Info>')
		end 
		--API_OpenSmallTip(ActorID,725,475,2,469,-1,"[k]  请点击此处#申请加入佣兵团[/k]")
		if diguonTotalNum > 0 and diguonTotalNum < 31 then
			local diguorenqi1 = PHB_xiongdihuishengwangshuchutable.diguorenqi1
			API_ConsortiaRankInfo(ActorID,4,1,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguorenqi1..'</Info>')
		elseif diguonTotalNum > 30 and diguonTotalNum < 61 then
			local diguorenqi1 = PHB_xiongdihuishengwangshuchutable.diguorenqi1
			local diguorenqi2 = PHB_xiongdihuishengwangshuchutable.diguorenqi2
			API_ConsortiaRankInfo(ActorID,4,1,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguorenqi1)
			API_ConsortiaRankInfo(ActorID,4,1,diguorenqi2..'</Info>')
		elseif diguonTotalNum > 60 and diguonTotalNum < 91 then
			local diguorenqi1 = PHB_xiongdihuishengwangshuchutable.diguorenqi1
			local diguorenqi2 = PHB_xiongdihuishengwangshuchutable.diguorenqi2
			local diguorenqi3 = PHB_xiongdihuishengwangshuchutable.diguorenqi3
			API_ConsortiaRankInfo(ActorID,4,1,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguorenqi1)
			API_ConsortiaRankInfo(ActorID,4,1,diguorenqi2)
			API_ConsortiaRankInfo(ActorID,4,1,diguorenqi3..'</Info>')			
		elseif diguonTotalNum > 90 and diguonTotalNum < 101 then
			local diguorenqi1 = PHB_xiongdihuishengwangshuchutable.diguorenqi1
			local diguorenqi2 = PHB_xiongdihuishengwangshuchutable.diguorenqi2
			local diguorenqi3 = PHB_xiongdihuishengwangshuchutable.diguorenqi3
			local diguorenqi4 = PHB_xiongdihuishengwangshuchutable.diguorenqi4
			API_ConsortiaRankInfo(ActorID,4,1,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguorenqi1)
			API_ConsortiaRankInfo(ActorID,4,1,diguorenqi2)
			API_ConsortiaRankInfo(ActorID,4,1,diguorenqi3)
			API_ConsortiaRankInfo(ActorID,4,1,diguorenqi4..'</Info>')
		end 
		--API_OpenSmallTip(ActorID,725,455,2,469,-1,"[k]  请点击此处#申请加入兄弟会[/k]")
		if quanbunTotalNum > 0 and quanbunTotalNum < 31 then
			local quanburenqi1 = PHB_xiongdihuishengwangshuchutable.quanburenqi1
			API_ConsortiaRankInfo(ActorID,4,3,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanburenqi1..'</Info>')
		elseif quanbunTotalNum > 30 and quanbunTotalNum < 61 then
			local quanburenqi1 = PHB_xiongdihuishengwangshuchutable.quanburenqi1
			local quanburenqi2 = PHB_xiongdihuishengwangshuchutable.quanburenqi2
			API_ConsortiaRankInfo(ActorID,4,3,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanburenqi1)
			API_ConsortiaRankInfo(ActorID,4,3,quanburenqi2..'</Info>')
		elseif quanbunTotalNum > 60 and quanbunTotalNum < 91 then
			local quanburenqi1 = PHB_xiongdihuishengwangshuchutable.quanburenqi1
			local quanburenqi2 = PHB_xiongdihuishengwangshuchutable.quanburenqi2
			local quanburenqi3 = PHB_xiongdihuishengwangshuchutable.quanburenqi3
			API_ConsortiaRankInfo(ActorID,4,3,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanburenqi1)
			API_ConsortiaRankInfo(ActorID,4,3,quanburenqi2)
			API_ConsortiaRankInfo(ActorID,4,3,quanburenqi3..'</Info>')			
		elseif quanbunTotalNum > 90 and quanbunTotalNum < 101 then
			local quanburenqi1 = PHB_xiongdihuishengwangshuchutable.quanburenqi1
			local quanburenqi2 = PHB_xiongdihuishengwangshuchutable.quanburenqi2
			local quanburenqi3 = PHB_xiongdihuishengwangshuchutable.quanburenqi3
			local quanburenqi4 = PHB_xiongdihuishengwangshuchutable.quanburenqi4
			API_ConsortiaRankInfo(ActorID,4,3,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanburenqi1)
			API_ConsortiaRankInfo(ActorID,4,3,quanburenqi2)
			API_ConsortiaRankInfo(ActorID,4,3,quanburenqi3)
			API_ConsortiaRankInfo(ActorID,4,3,quanburenqi4..'</Info>')
		end
		--API_OpenSmallTip(ActorID,725,475,2,469,-1,"[k]  请点击此处#申请加入兄弟会[/k]")
		API_ResponseEnd()
		API_ResponseClear()
	end
end
function PHB_xiongdihuishengwangshuchu(chaxunzheID,nRankType,nStatDate,nTotalNum, nCampID, nExpLevel, nUserID, nActorID,szActorName, nActiveValue, nRankSerial, nRankValue,nDynamicValue1,nDynamicValue2,nDynamicValue3,szText)
	local sz = '回调值('..chaxunzheID..','..nRankType..','..nStatDate..','..nTotalNum..', '..nCampID..', '..nExpLevel..', '..nUserID..', '..nActorID..','..szActorName..', '..nActiveValue..', '..nRankSerial..', '..nRankValue..','..nDynamicValue1..','..nDynamicValue2..','..nDynamicValue3..','..szText..')'	
	--API_Trace('sz='..sz)
--[[	if nTotalNum == 0 then
		API_ResponseWrite('<text>暂时没有可查询的信息，请稍候在试。</text><br>')
		API_ResponseFlush(chaxunzheID)
	end--]]
	--[[
chaxunzheID,--点击排行榜者ID
nRankType, --排行榜类型
nStatDate, 
nTotalNum, --数据条目总数
nCampID,   --兄弟会阵营
nExpLevel, --兄弟会等级
nUserID
nActorID --兄弟会ID
szActorName, --兄弟会名称
nActiveValue, 
nRankSerial,  --排名
nRankValue, --兄弟会声望
nDynamicValue1, --兄弟会总人数
nDynamicValue2, --兄弟会平均好感度
nDynamicValue3, 
szText --兄弟会会长名字	
	]]
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if nRankType == 11 or nRankType == 12 or nRankType == 13 then
		if PHB_xiongdihuishengwangshuchutable == nil then --表要改变
			PHB_xiongdihuishengwangshuchutable = {}
		end
		if PHB_xiongdihuishengwangshuchutable[nRankType] == nil then
			PHB_xiongdihuishengwangshuchutable[nRankType] = {}
		end
		if PHB_xiongdihuishengwangshuchutable[nRankType][nRankSerial] == nil then
			PHB_xiongdihuishengwangshuchutable[nRankType][nRankSerial] = {}
		end
		PHB_xiongdihuishengwangshuchutable[nRankType][nRankSerial] = {[1]=szActorName,[2]=nActorID,[3]=nCampID,[4]=nRankValue,[5]=nExpLevel,[6]=szText,[7]=nDynamicValue1,[8]=nDynamicValue2}
		local biaochang = table.getn(PHB_xiongdihuishengwangshuchutable[nRankType])
		if biaochang == nTotalNum then
			PHB_xiongdihuinumqueren = PHB_xiongdihuinumqueren + 1
			local quanburenqi1 = 0
			local quanburenqi2 = 0
			local quanburenqi3 = 0
			local quanburenqi4 = 0
			local lianbangrenqi1 = 0
			local lianbangrenqi2 = 0
			local lianbangrenqi3 = 0
			local lianbangrenqi4 = 0
			local diguorenqi1 = 0
			local diguorenqi2 = 0
			local diguorenqi3 = 0
			local diguorenqi4 = 0
			if nRankType == 11 then
				lianbangrenqi1 = ''
				lianbangrenqi2 = ''
				lianbangrenqi3 = ''
				lianbangrenqi4 = ''
			elseif nRankType == 12 then
				diguorenqi1 = ''
				diguorenqi2 = ''
				diguorenqi3 = ''
				diguorenqi4 = ''
			elseif nRankType == 13 then
				quanburenqi1 = ''
				quanburenqi2 = ''
				quanburenqi3 = ''
				quanburenqi4 = ''
			end		

			local zj = API_GetActorRank(chaxunzheID,6)
			local qb = API_GetActorRank(chaxunzheID,7)
			
			for i = 1,nTotalNum do
				if PHB_xiongdihuishengwangshuchutable[nRankType][i] ~= nil then
					local CampID = PHB_xiongdihuishengwangshuchutable[nRankType][i][3]
					if CampID == 0 then
						CampID = '帝国'
					elseif CampID == 1 then
						CampID = '联邦'
					end
					local bingtuanID = PHB_xiongdihuishengwangshuchutable[nRankType][i][2]
					local bingtuanName = PHB_xiongdihuishengwangshuchutable[nRankType][i][1] --兄弟会名称
					local renqizhi = PHB_xiongdihuishengwangshuchutable[nRankType][i][4]
					local tuanzhangname = PHB_xiongdihuishengwangshuchutable[nRankType][i][6] --兄弟会会长名称
					local Level = PHB_xiongdihuishengwangshuchutable[nRankType][i][5] + 1 --兄弟会等级
					local zongrenshu = PHB_xiongdihuishengwangshuchutable[nRankType][i][7]
					local jinqian = PHB_xiongdihuishengwangshuchutable[nRankType][i][8]
					local renqishuchu1 = ''
					local renqishuchu2 = ''
					local renqishuchu3 = ''
					local renqishuchu4 = ''
					if i >= 1 and i <= 30 then
						renqishuchu1 = '<lt>'..i..','..bingtuanName..','..Level..','..tuanzhangname..','..zongrenshu..','..jinqian..','..renqizhi..','..CampID..'-'..bingtuanID..'</lt>' --佣兵团这里最后要加 -兵团ID					
					elseif i >= 31 and i <= 60 then
						renqishuchu2 = '<lt>'..i..','..bingtuanName..','..Level..','..tuanzhangname..','..zongrenshu..','..jinqian..','..renqizhi..','..CampID..'-'..bingtuanID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					elseif i >= 61 and i <= 90 then
						renqishuchu3 = '<lt>'..i..','..bingtuanName..','..Level..','..tuanzhangname..','..zongrenshu..','..jinqian..','..renqizhi..','..CampID..'-'..bingtuanID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					elseif i >= 91 and i <= 100 then
						renqishuchu4 = '<lt>'..i..','..bingtuanName..','..Level..','..tuanzhangname..','..zongrenshu..','..jinqian..','..renqizhi..','..CampID..'-'..bingtuanID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					end
					if nRankType == 11 then
						lianbangrenqi1 = lianbangrenqi1 .. renqishuchu1
						lianbangrenqi2 = lianbangrenqi2 .. renqishuchu2
						lianbangrenqi3 = lianbangrenqi3 .. renqishuchu3
						lianbangrenqi4 = lianbangrenqi4 .. renqishuchu4
					elseif nRankType == 12 then
						diguorenqi1 = diguorenqi1 .. renqishuchu1
						diguorenqi2 = diguorenqi2 .. renqishuchu2
						diguorenqi3 = diguorenqi3 .. renqishuchu3
						diguorenqi4 = diguorenqi4 .. renqishuchu4
					elseif nRankType == 13 then
						quanburenqi1 = quanburenqi1 .. renqishuchu1
						quanburenqi2 = quanburenqi2 .. renqishuchu2
						quanburenqi3 = quanburenqi3 .. renqishuchu3
						quanburenqi4 = quanburenqi4 .. renqishuchu4
					end
				end
			end			
			
			if lianbangrenqi1 ~= 0 and lianbangrenqi1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					--API_ConsortiaRankInfo(chaxunzheID,4,2,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1..'</Info>')
					PHB_xiongdihuishengwangshuchutable.lianbangrenqi1 = lianbangrenqi1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					--API_ConsortiaRankInfo(chaxunzheID,4,2,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,4,2,lianbangrenqi2..'</Info>')
					PHB_xiongdihuishengwangshuchutable.lianbangrenqi1 = lianbangrenqi1
					PHB_xiongdihuishengwangshuchutable.lianbangrenqi2 = lianbangrenqi2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					--API_ConsortiaRankInfo(chaxunzheID,4,2,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,4,2,lianbangrenqi2)
					--API_ConsortiaRankInfo(chaxunzheID,4,2,lianbangrenqi3..'</Info>')			
					PHB_xiongdihuishengwangshuchutable.lianbangrenqi1 = lianbangrenqi1
					PHB_xiongdihuishengwangshuchutable.lianbangrenqi2 = lianbangrenqi2
					PHB_xiongdihuishengwangshuchutable.lianbangrenqi3 = lianbangrenqi3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					--API_ConsortiaRankInfo(chaxunzheID,4,2,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,4,2,lianbangrenqi2)
					--API_ConsortiaRankInfo(chaxunzheID,4,2,lianbangrenqi3)
					--API_ConsortiaRankInfo(chaxunzheID,4,2,lianbangrenqi4..'</Info>')
					PHB_xiongdihuishengwangshuchutable.lianbangrenqi1 = lianbangrenqi1
					PHB_xiongdihuishengwangshuchutable.lianbangrenqi2 = lianbangrenqi2
					PHB_xiongdihuishengwangshuchutable.lianbangrenqi3 = lianbangrenqi3
					PHB_xiongdihuishengwangshuchutable.lianbangrenqi4 = lianbangrenqi4
				end
				PHB_xiongdihuishengwangshuchutable.lianbangnTotalNum = nTotalNum
			else		
				API_ConsortiaRankInfo(chaxunzheID,4,2,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\"></Info>')
			end
			if diguorenqi1 ~= 0 and diguorenqi1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					--API_ConsortiaRankInfo(chaxunzheID,4,1,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguorenqi1..'</Info>')
					PHB_xiongdihuishengwangshuchutable.diguorenqi1 = diguorenqi1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					--API_ConsortiaRankInfo(chaxunzheID,4,1,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguorenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,4,1,diguorenqi2..'</Info>')
					PHB_xiongdihuishengwangshuchutable.diguorenqi1 = diguorenqi1
					PHB_xiongdihuishengwangshuchutable.diguorenqi2 = diguorenqi2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					--API_ConsortiaRankInfo(chaxunzheID,4,1,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguorenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,4,1,diguorenqi2)
					--API_ConsortiaRankInfo(chaxunzheID,4,1,diguorenqi3..'</Info>')			
					PHB_xiongdihuishengwangshuchutable.diguorenqi1 = diguorenqi1
					PHB_xiongdihuishengwangshuchutable.diguorenqi2 = diguorenqi2
					PHB_xiongdihuishengwangshuchutable.diguorenqi3 = diguorenqi3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					--API_ConsortiaRankInfo(chaxunzheID,4,1,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguorenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,4,1,diguorenqi2)
					--API_ConsortiaRankInfo(chaxunzheID,4,1,diguorenqi3)
					--API_ConsortiaRankInfo(chaxunzheID,4,1,diguorenqi4..'</Info>')
					PHB_xiongdihuishengwangshuchutable.diguorenqi1 = diguorenqi1
					PHB_xiongdihuishengwangshuchutable.diguorenqi2 = diguorenqi2
					PHB_xiongdihuishengwangshuchutable.diguorenqi3 = diguorenqi3
					PHB_xiongdihuishengwangshuchutable.diguorenqi4 = diguorenqi4
				end
				PHB_xiongdihuishengwangshuchutable.diguonTotalNum = nTotalNum
			else		
				API_ConsortiaRankInfo(chaxunzheID,4,1,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\"></Info>')
			end
			if quanburenqi1 ~= 0 and quanburenqi1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					--API_ConsortiaRankInfo(chaxunzheID,4,3,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanburenqi1..'</Info>')
					PHB_xiongdihuishengwangshuchutable.quanburenqi1 = quanburenqi1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					--API_ConsortiaRankInfo(chaxunzheID,4,3,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanburenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,4,3,quanburenqi2..'</Info>')
					PHB_xiongdihuishengwangshuchutable.quanburenqi1 = quanburenqi1
					PHB_xiongdihuishengwangshuchutable.quanburenqi2 = quanburenqi2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					--API_ConsortiaRankInfo(chaxunzheID,4,3,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanburenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,4,3,quanburenqi2)
					--API_ConsortiaRankInfo(chaxunzheID,4,3,quanburenqi3..'</Info>')			
					PHB_xiongdihuishengwangshuchutable.quanburenqi1 = quanburenqi1
					PHB_xiongdihuishengwangshuchutable.quanburenqi2 = quanburenqi2
					PHB_xiongdihuishengwangshuchutable.quanburenqi3 = quanburenqi3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					--API_ConsortiaRankInfo(chaxunzheID,4,3,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\">..quanburenqi1')
					--API_ConsortiaRankInfo(chaxunzheID,4,3,quanburenqi2)
					--API_ConsortiaRankInfo(chaxunzheID,4,3,quanburenqi3)
					--API_ConsortiaRankInfo(chaxunzheID,4,3,quanburenqi4..'</Info>')
					PHB_xiongdihuishengwangshuchutable.quanburenqi1 = quanburenqi1
					PHB_xiongdihuishengwangshuchutable.quanburenqi2 = quanburenqi2
					PHB_xiongdihuishengwangshuchutable.quanburenqi3 = quanburenqi3
					PHB_xiongdihuishengwangshuchutable.quanburenqi4 = quanburenqi4
				end
				PHB_xiongdihuishengwangshuchutable.quanbunTotalNum = nTotalNum
				--API_OpenSmallTip(chaxunzheID,725,455,2,469,-1,"[k]  请点击此处#申请加入兄弟会[/k]")
			else		
				API_ConsortiaRankInfo(chaxunzheID,4,3,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\"></Info>')
			end
			if Hour < 3 then
				PHB_xiongdihuishengwangshuchutable.riqi = API_GetDatatime(8) - 1
			else
				PHB_xiongdihuishengwangshuchutable.riqi = API_GetDatatime(8)
			end
			if PHB_xiongdihuinumqueren == 3 then				
				local shuju1,shuju2,shuju3,shuju4 = 0,0,0,0
				for i=1,3 do
					if i == 1 then
						shuju1 = PHB_xiongdihuishengwangshuchutable.diguorenqi1
						shuju2 = PHB_xiongdihuishengwangshuchutable.diguorenqi2
						shuju3 = PHB_xiongdihuishengwangshuchutable.diguorenqi3
						shuju4 = PHB_xiongdihuishengwangshuchutable.diguorenqi4					
					elseif 	i == 2 then
						shuju1 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi1
						shuju2 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi2
						shuju3 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi3
						shuju4 = PHB_xiongdihuishengwangshuchutable.lianbangrenqi4
					elseif 	i == 3 then	
						shuju1 = PHB_xiongdihuishengwangshuchutable.quanburenqi1
						shuju2 = PHB_xiongdihuishengwangshuchutable.quanburenqi2
						shuju3 = PHB_xiongdihuishengwangshuchutable.quanburenqi3
						shuju4 = PHB_xiongdihuishengwangshuchutable.quanburenqi4
					end
					if shuju1 ~= nil then
						if shuju4 ~= nil then
							API_ConsortiaRankInfo(chaxunzheID,4,i,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..shuju1)
						else
							API_ConsortiaRankInfo(chaxunzheID,4,i,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..shuju1..'</Info>')
						end
						if shuju2 ~= nil then
							API_ConsortiaRankInfo(chaxunzheID,4,i,shuju2)
						end
						if shuju3 ~= nil then
							API_ConsortiaRankInfo(chaxunzheID,4,i,shuju3)
						end
						if shuju4 ~= nil then
							API_ConsortiaRankInfo(chaxunzheID,4,i,shuju4..'</Info>')
						end
					else						
						API_ConsortiaRankInfo(chaxunzheID,4,i,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\"></Info>')
					end
				end
				--[[
				API_ConsortiaRankInfo(chaxunzheID,4,2,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..PHB_xiongdihuishengwangshuchutable.lianbangrenqi1)
				API_ConsortiaRankInfo(chaxunzheID,4,2,PHB_xiongdihuishengwangshuchutable.lianbangrenqi2)
				API_ConsortiaRankInfo(chaxunzheID,4,2,PHB_xiongdihuishengwangshuchutable.lianbangrenqi3)
				API_ConsortiaRankInfo(chaxunzheID,4,2,PHB_xiongdihuishengwangshuchutable.lianbangrenqi4..'</Info>')
					
				API_ConsortiaRankInfo(chaxunzheID,4,1,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..PHB_xiongdihuishengwangshuchutable.diguorenqi1)
				API_ConsortiaRankInfo(chaxunzheID,4,1,PHB_xiongdihuishengwangshuchutable.diguorenqi2)
				API_ConsortiaRankInfo(chaxunzheID,4,1,PHB_xiongdihuishengwangshuchutable.diguorenqi3)
				API_ConsortiaRankInfo(chaxunzheID,4,1,PHB_xiongdihuishengwangshuchutable.diguorenqi4..'</Info>')
					
				API_ConsortiaRankInfo(chaxunzheID,4,3,'<Info name=\"排名,兄弟会名称,等级,兄弟会会长名字,总人数,平均好感度,声望值,阵营\" width=\"60,125,48,125,60,110,61,59\">..PHB_xiongdihuishengwangshuchutable.quanburenqi1')
				API_ConsortiaRankInfo(chaxunzheID,4,3,PHB_xiongdihuishengwangshuchutable.quanburenqi2)
				API_ConsortiaRankInfo(chaxunzheID,4,3,PHB_xiongdihuishengwangshuchutable.quanburenqi3)
				API_ConsortiaRankInfo(chaxunzheID,4,3,PHB_xiongdihuishengwangshuchutable.quanburenqi4..'</Info>')
				]]
			end
		end
	end
end
