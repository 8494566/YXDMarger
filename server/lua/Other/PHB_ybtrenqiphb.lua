--兵团人气排行榜
--/nRankType:排名项类型
--8 联邦金钱排行
--9 帝国金钱排行
--10 全部金钱排行
--2008.12.12
--林瑞宇

function PHB_YBThuoyuezhiPaiHangBang_Title(ActorID) --函数名要替换
	if ActorID == nil or ActorID == 0 then
		ActorID = API_RequestGetActorID()
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local zuotianriqi = 0		
	if PHB_YBT_huoyuezhishuchutable == nil then     --表要改变
		PHB_YBT_huoyuezhishuchutable = {}
	end	
	if PHB_YBT_huoyuezhishuchutable.quanburenqi1 == nil then
		if Hour < 3 then
			local t = os.date("*t",os.time())
			t.day = t.day-1
			zuotianriqi = os.date("%Y%m%d",(os.time(t))) 
		else
			local t = os.date("*t",os.time())
			zuotianriqi = os.date("%Y%m%d",(os.time(t))) 
		end
		PHB_YBT_huoyuezhishuchutable = {}
		PHB_YBT_huoyuenumqueren = 0
		API_SelectStatistic(ActorID,8,100,zuotianriqi,'PHB_YBT_huoyuezhishuchu')--这里有BUG现在只能查100个 回调函数名字
		API_SelectStatistic(ActorID,9,100,zuotianriqi,'PHB_YBT_huoyuezhishuchu')--这里有BUG现在只能查100个 回调函数名字	
		API_SelectStatistic(ActorID,10,100,zuotianriqi,'PHB_YBT_huoyuezhishuchu')--这里有BUG现在只能查100个 回调函数名字
	else
		if Hour < 3 then
		else	
			local riqi = PHB_YBT_huoyuezhishuchutable.riqi --存储今天的日期 日期相同 就直接取 不相同就把表清空 重新来（表要改）
			local nowtime = API_GetDatatime(8) --一年中的第几天
			if nowtime ~= riqi then
				local t = os.date("*t",os.time())
				zuotianriqi = os.date("%Y%m%d",(os.time(t))) 
				PHB_YBT_huoyuezhishuchutable = {} --表要改
				PHB_YBT_huoyuenumqueren = 0
				API_SelectStatistic(ActorID,8,100,zuotianriqi,'PHB_YBT_huoyuezhishuchu')--这里有BUG现在只能查100个 回调函数名字
				API_SelectStatistic(ActorID,9,100,zuotianriqi,'PHB_YBT_huoyuezhishuchu')--这里有BUG现在只能查100个 回调函数名字
				API_SelectStatistic(ActorID,10,100,zuotianriqi,'PHB_YBT_huoyuezhishuchu')--这里有BUG现在只能查100个 回调函数名字
					return
			end				
		end
		local lianbangnTotalNum = PHB_YBT_huoyuezhishuchutable.lianbangnTotalNum	
		local quanbunTotalNum = PHB_YBT_huoyuezhishuchutable.quanbunTotalNum
		local diguonTotalNum = PHB_YBT_huoyuezhishuchutable.diguonTotalNum
		
		local zj = API_GetActorRank(ActorID,4)
		local qb = API_GetActorRank(ActorID,5)		
		if lianbangnTotalNum > 0 and lianbangnTotalNum < 31 then
			local lianbangrenqi1 = PHB_YBT_huoyuezhishuchutable.lianbangrenqi1
			API_ConsortiaRankInfo(ActorID,3,2,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1..'</Info>')
		elseif lianbangnTotalNum > 30 and lianbangnTotalNum < 61 then
			local lianbangrenqi1 = PHB_YBT_huoyuezhishuchutable.lianbangrenqi1
			local lianbangrenqi2 = PHB_YBT_huoyuezhishuchutable.lianbangrenqi2
			API_ConsortiaRankInfo(ActorID,3,2,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1)
			API_ConsortiaRankInfo(ActorID,3,2,lianbangrenqi2..'</Info>')
		elseif lianbangnTotalNum > 60 and lianbangnTotalNum < 91 then
			local lianbangrenqi1 = PHB_YBT_huoyuezhishuchutable.lianbangrenqi1
			local lianbangrenqi2 = PHB_YBT_huoyuezhishuchutable.lianbangrenqi2
			local lianbangrenqi3 = PHB_YBT_huoyuezhishuchutable.lianbangrenqi3
			API_ConsortiaRankInfo(ActorID,3,2,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1)
			API_ConsortiaRankInfo(ActorID,3,2,lianbangrenqi2)
			API_ConsortiaRankInfo(ActorID,3,2,lianbangrenqi3..'</Info>')			
		elseif lianbangnTotalNum > 90 and lianbangnTotalNum < 101 then
			local lianbangrenqi1 = PHB_YBT_huoyuezhishuchutable.lianbangrenqi1
			local lianbangrenqi2 = PHB_YBT_huoyuezhishuchutable.lianbangrenqi2
			local lianbangrenqi3 = PHB_YBT_huoyuezhishuchutable.lianbangrenqi3
			local lianbangrenqi4 = PHB_YBT_huoyuezhishuchutable.lianbangrenqi4
			API_ConsortiaRankInfo(ActorID,3,2,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1)
			API_ConsortiaRankInfo(ActorID,3,2,lianbangrenqi2)
			API_ConsortiaRankInfo(ActorID,3,2,lianbangrenqi3)
			API_ConsortiaRankInfo(ActorID,3,2,lianbangrenqi4..'</Info>')
		end 
		API_OpenSmallTip(ActorID,725,475,2,469,-1,"[k]  请点击此处#申请加入佣兵团[/k]")
		if diguonTotalNum > 0 and diguonTotalNum < 31 then
			local diguorenqi1 = PHB_YBT_huoyuezhishuchutable.diguorenqi1
			API_ConsortiaRankInfo(ActorID,3,1,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\">'..diguorenqi1..'</Info>')
		elseif diguonTotalNum > 30 and diguonTotalNum < 61 then
			local diguorenqi1 = PHB_YBT_huoyuezhishuchutable.diguorenqi1
			local diguorenqi2 = PHB_YBT_huoyuezhishuchutable.diguorenqi2
			API_ConsortiaRankInfo(ActorID,3,1,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\">'..diguorenqi1)
			API_ConsortiaRankInfo(ActorID,3,1,diguorenqi2..'</Info>')
		elseif diguonTotalNum > 60 and diguonTotalNum < 91 then
			local diguorenqi1 = PHB_YBT_huoyuezhishuchutable.diguorenqi1
			local diguorenqi2 = PHB_YBT_huoyuezhishuchutable.diguorenqi2
			local diguorenqi3 = PHB_YBT_huoyuezhishuchutable.diguorenqi3
			API_ConsortiaRankInfo(ActorID,3,1,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\">'..diguorenqi1)
			API_ConsortiaRankInfo(ActorID,3,1,diguorenqi2)
			API_ConsortiaRankInfo(ActorID,3,1,diguorenqi3..'</Info>')			
		elseif diguonTotalNum > 90 and diguonTotalNum < 101 then
			local diguorenqi1 = PHB_YBT_huoyuezhishuchutable.diguorenqi1
			local diguorenqi2 = PHB_YBT_huoyuezhishuchutable.diguorenqi2
			local diguorenqi3 = PHB_YBT_huoyuezhishuchutable.diguorenqi3
			local diguorenqi4 = PHB_YBT_huoyuezhishuchutable.diguorenqi4
			API_ConsortiaRankInfo(ActorID,3,1,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\">'..diguorenqi1)
			API_ConsortiaRankInfo(ActorID,3,1,diguorenqi2)
			API_ConsortiaRankInfo(ActorID,3,1,diguorenqi3)
			API_ConsortiaRankInfo(ActorID,3,1,diguorenqi4..'</Info>')
		end 
		API_OpenSmallTip(ActorID,725,455,2,469,-1,"[k]  请点击此处#申请加入佣兵团[/k]")
		if quanbunTotalNum > 0 and quanbunTotalNum < 31 then
			local quanburenqi1 = PHB_YBT_huoyuezhishuchutable.quanburenqi1
			API_ConsortiaRankInfo(ActorID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\">'..quanburenqi1..'</Info>')
		elseif quanbunTotalNum > 30 and quanbunTotalNum < 61 then
			local quanburenqi1 = PHB_YBT_huoyuezhishuchutable.quanburenqi1
			local quanburenqi2 = PHB_YBT_huoyuezhishuchutable.quanburenqi2
			API_ConsortiaRankInfo(ActorID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\">'..quanburenqi1)
			API_ConsortiaRankInfo(ActorID,3,3,quanburenqi2..'</Info>')
		elseif quanbunTotalNum > 60 and quanbunTotalNum < 91 then
			local quanburenqi1 = PHB_YBT_huoyuezhishuchutable.quanburenqi1
			local quanburenqi2 = PHB_YBT_huoyuezhishuchutable.quanburenqi2
			local quanburenqi3 = PHB_YBT_huoyuezhishuchutable.quanburenqi3
			API_ConsortiaRankInfo(ActorID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\">'..quanburenqi1)
			API_ConsortiaRankInfo(ActorID,3,3,quanburenqi2)
			API_ConsortiaRankInfo(ActorID,3,3,quanburenqi3..'</Info>')			
		elseif quanbunTotalNum > 90 and quanbunTotalNum < 101 then
			local quanburenqi1 = PHB_YBT_huoyuezhishuchutable.quanburenqi1
			local quanburenqi2 = PHB_YBT_huoyuezhishuchutable.quanburenqi2
			local quanburenqi3 = PHB_YBT_huoyuezhishuchutable.quanburenqi3
			local quanburenqi4 = PHB_YBT_huoyuezhishuchutable.quanburenqi4
			API_ConsortiaRankInfo(ActorID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\">'..quanburenqi1)
			API_ConsortiaRankInfo(ActorID,3,3,quanburenqi2)
			API_ConsortiaRankInfo(ActorID,3,3,quanburenqi3)
			API_ConsortiaRankInfo(ActorID,3,3,quanburenqi4..'</Info>')
		end
		API_OpenSmallTip(ActorID,725,475,2,469,-1,"[k]  请点击此处#申请加入佣兵团[/k]")
	end
	API_ResponseClear()	
	API_ResponseEnd()
end
function PHB_YBT_huoyuezhishuchu(chaxunzheID,nRankType,nStatDate,nTotalNum, nCampID, nExpLevel, nUserID, nActorID,szActorName, nActiveValue, nRankSerial, nRankValue,nDynamicValue1,nDynamicValue2,nDynamicValue3,szText)
	local sz = '回调值('..chaxunzheID..','..nRankType..','..nStatDate..','..nTotalNum..', '..nCampID..', '..nExpLevel..', '..nUserID..', '..nActorID..','..szActorName..', '..nActiveValue..', '..nRankSerial..', '..nRankValue..','..nDynamicValue1..','..nDynamicValue2..','..nDynamicValue3..','..szText..')'	
--[[	if nTotalNum == 0 then
		API_ResponseWrite('<text>暂时没有可查询的信息，请稍候在试。</text><br>')
		API_ResponseFlush(chaxunzheID)
	end--]]
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if nRankType == 8 or nRankType == 9 or nRankType == 10 then
		if PHB_YBT_huoyuezhishuchutable == nil then --表要改变
			PHB_YBT_huoyuezhishuchutable = {}
		end
		if PHB_YBT_huoyuezhishuchutable[nRankType] == nil then
			PHB_YBT_huoyuezhishuchutable[nRankType] = {}
		end
		if PHB_YBT_huoyuezhishuchutable[nRankType][nRankSerial] == nil then
			PHB_YBT_huoyuezhishuchutable[nRankType][nRankSerial] = {}
		end
		PHB_YBT_huoyuezhishuchutable[nRankType][nRankSerial] = {[1]=szActorName,[2]=nActorID,[3]=nCampID,[4]=nRankValue,[5]=nExpLevel,[6]=szText,[7]=nDynamicValue1,[8]=nDynamicValue2}
		local biaochang = table.getn(PHB_YBT_huoyuezhishuchutable[nRankType])
		if biaochang == nTotalNum then	
	
			PHB_YBT_huoyuenumqueren = PHB_YBT_huoyuenumqueren + 1
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
			if nRankType == 8 then
				lianbangrenqi1 = ''
				lianbangrenqi2 = ''
				lianbangrenqi3 = ''
				lianbangrenqi4 = ''
			elseif nRankType == 9 then
				diguorenqi1 = ''
				diguorenqi2 = ''
				diguorenqi3 = ''
				diguorenqi4 = ''
			elseif nRankType == 10 then
				quanburenqi1 = ''
				quanburenqi2 = ''
				quanburenqi3 = ''
				quanburenqi4 = ''
			end			

			local zj = API_GetActorRank(chaxunzheID,4)
			local qb = API_GetActorRank(chaxunzheID,5)
			
			for i = 1,nTotalNum do
				if PHB_YBT_huoyuezhishuchutable[nRankType][i] ~= nil then
					local CampID = PHB_YBT_huoyuezhishuchutable[nRankType][i][3]
					if CampID == 0 then
						CampID = '帝国'
					elseif CampID == 1 then
						CampID = '联邦'
					end
					local bingtuanID = PHB_YBT_huoyuezhishuchutable[nRankType][i][2]
					local bingtuanName = PHB_YBT_huoyuezhishuchutable[nRankType][i][1]
					local renqizhi = PHB_YBT_huoyuezhishuchutable[nRankType][i][4]
					local tuanzhangname = PHB_YBT_huoyuezhishuchutable[nRankType][i][6]
					local Level = PHB_YBT_huoyuezhishuchutable[nRankType][i][5]
					local zongrenshu = PHB_YBT_huoyuezhishuchutable[nRankType][i][7]
					local jinqian = PHB_YBT_huoyuezhishuchutable[nRankType][i][8]
					local renqishuchu1 = ''
					local renqishuchu2 = ''
					local renqishuchu3 = ''
					local renqishuchu4 = ''
					if i >= 1 and i <= 30 then
						renqishuchu1 = '<lt>'..i..','..bingtuanName..','..Level..','..tuanzhangname..','..jinqian..','..zongrenshu..','..renqizhi..','..CampID..'-'..bingtuanID..'</lt>' --佣兵团这里最后要加 -兵团ID					
					elseif i >= 31 and i <= 60 then
						renqishuchu2 = '<lt>'..i..','..bingtuanName..','..Level..','..tuanzhangname..','..jinqian..','..zongrenshu..','..renqizhi..','..CampID..'-'..bingtuanID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					elseif i >= 61 and i <= 90 then
						renqishuchu3 = '<lt>'..i..','..bingtuanName..','..Level..','..tuanzhangname..','..jinqian..','..zongrenshu..','..renqizhi..','..CampID..'-'..bingtuanID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					elseif i >= 91 and i <= 100 then
						renqishuchu4 = '<lt>'..i..','..bingtuanName..','..Level..','..tuanzhangname..','..jinqian..','..zongrenshu..','..renqizhi..','..CampID..'-'..bingtuanID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					end
					if nRankType == 8 then
						lianbangrenqi1 = lianbangrenqi1 .. renqishuchu1
						lianbangrenqi2 = lianbangrenqi2 .. renqishuchu2
						lianbangrenqi3 = lianbangrenqi3 .. renqishuchu3
						lianbangrenqi4 = lianbangrenqi4 .. renqishuchu4
					elseif nRankType == 9 then
						diguorenqi1 = diguorenqi1 .. renqishuchu1
						diguorenqi2 = diguorenqi2 .. renqishuchu2
						diguorenqi3 = diguorenqi3 .. renqishuchu3
						diguorenqi4 = diguorenqi4 .. renqishuchu4
					elseif nRankType == 10 then
						quanburenqi1 = quanburenqi1 .. renqishuchu1
						quanburenqi2 = quanburenqi2 .. renqishuchu2
						quanburenqi3 = quanburenqi3 .. renqishuchu3
						quanburenqi4 = quanburenqi4 .. renqishuchu4
					end
				end
			end
			if lianbangrenqi1 ~= 0 and lianbangrenqi1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					--API_ConsortiaRankInfo(chaxunzheID,3,2,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1..'</Info>')
					PHB_YBT_huoyuezhishuchutable.lianbangrenqi1 = lianbangrenqi1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					--API_ConsortiaRankInfo(chaxunzheID,3,2,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,3,2,lianbangrenqi2..'</Info>')
					PHB_YBT_huoyuezhishuchutable.lianbangrenqi1 = lianbangrenqi1
					PHB_YBT_huoyuezhishuchutable.lianbangrenqi2 = lianbangrenqi2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					--API_ConsortiaRankInfo(chaxunzheID,3,2,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,3,2,lianbangrenqi2)
					--API_ConsortiaRankInfo(chaxunzheID,3,2,lianbangrenqi3..'</Info>')			
					PHB_YBT_huoyuezhishuchutable.lianbangrenqi1 = lianbangrenqi1
					PHB_YBT_huoyuezhishuchutable.lianbangrenqi2 = lianbangrenqi2
					PHB_YBT_huoyuezhishuchutable.lianbangrenqi3 = lianbangrenqi3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					--API_ConsortiaRankInfo(chaxunzheID,3,2,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangrenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,3,2,lianbangrenqi2)
					--API_ConsortiaRankInfo(chaxunzheID,3,2,lianbangrenqi3)
					--API_ConsortiaRankInfo(chaxunzheID,3,2,lianbangrenqi4..'</Info>')
					PHB_YBT_huoyuezhishuchutable.lianbangrenqi1 = lianbangrenqi1
					PHB_YBT_huoyuezhishuchutable.lianbangrenqi2 = lianbangrenqi2
					PHB_YBT_huoyuezhishuchutable.lianbangrenqi3 = lianbangrenqi3
					PHB_YBT_huoyuezhishuchutable.lianbangrenqi4 = lianbangrenqi4
				end
				PHB_YBT_huoyuezhishuchutable.lianbangnTotalNum = nTotalNum
			else
				API_ConsortiaRankInfo(chaxunzheID,3,2,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\"></Info>')
			end
			if diguorenqi1 ~= 0 and diguorenqi1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					--API_ConsortiaRankInfo(chaxunzheID,3,1,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguorenqi1..'</Info>')
					PHB_YBT_huoyuezhishuchutable.diguorenqi1 = diguorenqi1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					--API_ConsortiaRankInfo(chaxunzheID,3,1,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguorenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,3,1,diguorenqi2..'</Info>')
					PHB_YBT_huoyuezhishuchutable.diguorenqi1 = diguorenqi1
					PHB_YBT_huoyuezhishuchutable.diguorenqi2 = diguorenqi2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					--API_ConsortiaRankInfo(chaxunzheID,3,1,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguorenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,3,1,diguorenqi2)
					--API_ConsortiaRankInfo(chaxunzheID,3,1,diguorenqi3..'</Info>')			
					PHB_YBT_huoyuezhishuchutable.diguorenqi1 = diguorenqi1
					PHB_YBT_huoyuezhishuchutable.diguorenqi2 = diguorenqi2
					PHB_YBT_huoyuezhishuchutable.diguorenqi3 = diguorenqi3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					--API_ConsortiaRankInfo(chaxunzheID,3,1,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguorenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,3,1,diguorenqi2)
					--API_ConsortiaRankInfo(chaxunzheID,3,1,diguorenqi3)
					--API_ConsortiaRankInfo(chaxunzheID,3,1,diguorenqi4..'</Info>')
					PHB_YBT_huoyuezhishuchutable.diguorenqi1 = diguorenqi1
					PHB_YBT_huoyuezhishuchutable.diguorenqi2 = diguorenqi2
					PHB_YBT_huoyuezhishuchutable.diguorenqi3 = diguorenqi3
					PHB_YBT_huoyuezhishuchutable.diguorenqi4 = diguorenqi4
				end
				PHB_YBT_huoyuezhishuchutable.diguonTotalNum = nTotalNum
			else
				API_ConsortiaRankInfo(chaxunzheID,3,1,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\"></Info>')
			end
			if quanburenqi1 ~= 0 and quanburenqi1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					--API_ConsortiaRankInfo(chaxunzheID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanburenqi1..'</Info>')
					PHB_YBT_huoyuezhishuchutable.quanburenqi1 = quanburenqi1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					--API_ConsortiaRankInfo(chaxunzheID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanburenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,3,3,quanburenqi2..'</Info>')
					PHB_YBT_huoyuezhishuchutable.quanburenqi1 = quanburenqi1
					PHB_YBT_huoyuezhishuchutable.quanburenqi2 = quanburenqi2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					--API_ConsortiaRankInfo(chaxunzheID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanburenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,3,3,quanburenqi2)
					--API_ConsortiaRankInfo(chaxunzheID,3,3,quanburenqi3..'</Info>')			
					PHB_YBT_huoyuezhishuchutable.quanburenqi1 = quanburenqi1
					PHB_YBT_huoyuezhishuchutable.quanburenqi2 = quanburenqi2
					PHB_YBT_huoyuezhishuchutable.quanburenqi3 = quanburenqi3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					--API_ConsortiaRankInfo(chaxunzheID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanburenqi1)
					--API_ConsortiaRankInfo(chaxunzheID,3,3,quanburenqi2)
					--API_ConsortiaRankInfo(chaxunzheID,3,3,quanburenqi3)
					--API_ConsortiaRankInfo(chaxunzheID,3,3,quanburenqi4..'</Info>')
					PHB_YBT_huoyuezhishuchutable.quanburenqi1 = quanburenqi1
					PHB_YBT_huoyuezhishuchutable.quanburenqi2 = quanburenqi2
					PHB_YBT_huoyuezhishuchutable.quanburenqi3 = quanburenqi3
					PHB_YBT_huoyuezhishuchutable.quanburenqi4 = quanburenqi4
				end
				PHB_YBT_huoyuezhishuchutable.quanbunTotalNum = nTotalNum
				API_OpenSmallTip(chaxunzheID,725,455,2,469,-1,"[k]  请点击此处#申请加入佣兵团[/k]")
			else
				API_ConsortiaRankInfo(chaxunzheID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\"></Info>')
			end
			if Hour < 3 then
				PHB_YBT_huoyuezhishuchutable.riqi = API_GetDatatime(8) - 1
			else
				PHB_YBT_huoyuezhishuchutable.riqi = API_GetDatatime(8)
			end		
			if PHB_YBT_huoyuenumqueren == 3 then
				if PHB_YBT_huoyuezhishuchutable.lianbangrenqi1 ~= nil then
					if PHB_YBT_huoyuezhishuchutable.lianbangrenqi4 ~= nil then
						API_ConsortiaRankInfo(chaxunzheID,3,2,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..PHB_YBT_huoyuezhishuchutable.lianbangrenqi1)
					else
						API_ConsortiaRankInfo(chaxunzheID,3,2,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..PHB_YBT_huoyuezhishuchutable.lianbangrenqi1..'</Info>')
					end
					if PHB_YBT_huoyuezhishuchutable.lianbangrenqi2 ~= nil then
						API_ConsortiaRankInfo(chaxunzheID,3,2,PHB_YBT_huoyuezhishuchutable.lianbangrenqi2)
					end
					if PHB_YBT_huoyuezhishuchutable.lianbangrenqi3 ~= nil then
						API_ConsortiaRankInfo(chaxunzheID,3,2,PHB_YBT_huoyuezhishuchutable.lianbangrenqi3)
					end	
					if PHB_YBT_huoyuezhishuchutable.lianbangrenqi4 ~= nil then
						API_ConsortiaRankInfo(chaxunzheID,3,2,PHB_YBT_huoyuezhishuchutable.lianbangrenqi4..'</Info>')
					end
				else	
					API_ConsortiaRankInfo(chaxunzheID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\"></Info>')
				end					
				if PHB_YBT_huoyuezhishuchutable.diguorenqi1 ~= nil then					
					if PHB_YBT_huoyuezhishuchutable.diguorenqi4 ~= nil then	
						API_ConsortiaRankInfo(chaxunzheID,3,1,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..PHB_YBT_huoyuezhishuchutable.diguorenqi1)
					else
						API_ConsortiaRankInfo(chaxunzheID,3,1,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..PHB_YBT_huoyuezhishuchutable.diguorenqi1..'</Info>')
					end
					if PHB_YBT_huoyuezhishuchutable.diguorenqi2 ~= nil then	
						API_ConsortiaRankInfo(chaxunzheID,3,1,PHB_YBT_huoyuezhishuchutable.diguorenqi2)
					end	
					if PHB_YBT_huoyuezhishuchutable.diguorenqi3 ~= nil then	
						API_ConsortiaRankInfo(chaxunzheID,3,1,PHB_YBT_huoyuezhishuchutable.diguorenqi3)
					end
					if PHB_YBT_huoyuezhishuchutable.diguorenqi4 ~= nil then						
						API_ConsortiaRankInfo(chaxunzheID,3,1,PHB_YBT_huoyuezhishuchutable.diguorenqi4..'</Info>')
					end	
				else	
					API_ConsortiaRankInfo(chaxunzheID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\"></Info>')					
				end	
				if PHB_YBT_huoyuezhishuchutable.quanburenqi1 ~= nil then		
					if PHB_YBT_huoyuezhishuchutable.quanburenqi4 ~= nil then
						API_ConsortiaRankInfo(chaxunzheID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..PHB_YBT_huoyuezhishuchutable.quanburenqi1)
					else	
						API_ConsortiaRankInfo(chaxunzheID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..PHB_YBT_huoyuezhishuchutable.quanburenqi1..'</Info>')
					end
					if PHB_YBT_huoyuezhishuchutable.quanburenqi2 ~= nil then
						API_ConsortiaRankInfo(chaxunzheID,3,3,PHB_YBT_huoyuezhishuchutable.quanburenqi2)
					end
					if PHB_YBT_huoyuezhishuchutable.quanburenqi3 ~= nil then					
						API_ConsortiaRankInfo(chaxunzheID,3,3,PHB_YBT_huoyuezhishuchutable.quanburenqi3)
					end
					if PHB_YBT_huoyuezhishuchutable.quanburenqi4 ~= nil then					
						API_ConsortiaRankInfo(chaxunzheID,3,3,PHB_YBT_huoyuezhishuchutable.quanburenqi4..'</Info>')
					end	
				else
					API_ConsortiaRankInfo(chaxunzheID,3,3,'<Info name=\"排名,佣兵团名称,等级,佣兵团团长名字,佣兵团资金,总人数,人气,阵营\" width=\"60,125,48,125,125,50,56,59\"></Info>')
				end	
			end
		end
		API_ResponseClear()
		API_ResponseEnd()
	end
end