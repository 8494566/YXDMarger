--个人财富排行榜
--/nRankType:排名项类型
--2 联邦金钱排行
--3 帝国金钱排行
--4 全部金钱排行
--2008.12.11
--林瑞宇

--[[
0 个人财富() 
1 个人财富(所有)
2 个人战力()
3 个人战力(所有)
4 兵团战力()
5 兵团战力(所有)
6 兄弟会声望()
7 兄弟会声望(所有)
]]
function PHB_GeRenJinBiPaiHangBang_Title() --函数名要替换
	local ActorID = API_RequestGetActorID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local zuotianriqi = 0
	
	if PHB_caifushuchutable == nil then     --表要改变
		PHB_caifushuchutable = {}
	end
	if PHB_caifushuchutable.quanbujinbi1 == nil then
	
		if Hour < 3 then
			local t = os.date("*t",os.time())
			t.day = t.day - 1
			zuotianriqi = os.date("%Y%m%d",(os.time(t))) 
		else
			local t = os.date("*t",os.time())
			zuotianriqi = os.date("%Y%m%d",(os.time(t))) 
		end
		
		PHB_caifushuchutable = {}
		PHB_gerenjinbinumqueren = 0
		API_SelectStatistic(ActorID,2,100,zuotianriqi,'PHB_caifushuchu')--这里有BUG现在只能查100个 回调函数名字
		API_SelectStatistic(ActorID,3,100,zuotianriqi,'PHB_caifushuchu')--这里有BUG现在只能查100个 回调函数名字	
		API_SelectStatistic(ActorID,4,100,zuotianriqi,'PHB_caifushuchu')--这里有BUG现在只能查100个 回调函数名字
	else
		
		if Hour < 3 then
		else
			local riqi = PHB_caifushuchutable.riqi --存储今天的日期 日期相同 就直接取 不相同就把表清空 重新来（表要改）
			local nowtime = API_GetDatatime(8) --一年中的第几天
			if nowtime ~= riqi then
				local t = os.date("*t",os.time())
				zuotianriqi = os.date("%Y%m%d",(os.time(t))) 
				PHB_caifushuchutable = {} --表要改
				PHB_gerenjinbinumqueren = 0
				API_SelectStatistic(ActorID,2,100,zuotianriqi,'PHB_caifushuchu')--这里有BUG现在只能查100个 回调函数名字
				API_SelectStatistic(ActorID,3,100,zuotianriqi,'PHB_caifushuchu')--这里有BUG现在只能查100个 回调函数名字
				API_SelectStatistic(ActorID,4,100,zuotianriqi,'PHB_caifushuchu')--这里有BUG现在只能查100个 回调函数名字
				return
			end
		end
		local lianbangnTotalNum = PHB_caifushuchutable.lianbangnTotalNum	
		local quanbunTotalNum = PHB_caifushuchutable.quanbunTotalNum
		local diguonTotalNum = PHB_caifushuchutable.diguonTotalNum
		
		local zj = API_GetActorRank(ActorID,0)
		local qb = API_GetActorRank(ActorID,1)
		
		if lianbangnTotalNum > 0 and lianbangnTotalNum < 31 then
			local lianbangjinbi1 = PHB_caifushuchutable.lianbangjinbi1
			API_ConsortiaRankInfo(ActorID,2,2,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangjinbi1..'</Info>')
		elseif lianbangnTotalNum > 30 and lianbangnTotalNum < 61 then
			local lianbangjinbi1 = PHB_caifushuchutable.lianbangjinbi1
			local lianbangjinbi2 = PHB_caifushuchutable.lianbangjinbi2
			API_ConsortiaRankInfo(ActorID,2,2,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangjinbi1)
			API_ConsortiaRankInfo(ActorID,2,2,lianbangjinbi2..'</Info>')
		elseif lianbangnTotalNum > 60 and lianbangnTotalNum < 91 then
			local lianbangjinbi1 = PHB_caifushuchutable.lianbangjinbi1
			local lianbangjinbi2 = PHB_caifushuchutable.lianbangjinbi2
			local lianbangjinbi3 = PHB_caifushuchutable.lianbangjinbi3
			API_ConsortiaRankInfo(ActorID,2,2,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangjinbi1)
			API_ConsortiaRankInfo(ActorID,2,2,lianbangjinbi2)
			API_ConsortiaRankInfo(ActorID,2,2,lianbangjinbi3..'</Info>')			
		elseif lianbangnTotalNum > 90 and lianbangnTotalNum < 101 then
			local lianbangjinbi1 = PHB_caifushuchutable.lianbangjinbi1
			local lianbangjinbi2 = PHB_caifushuchutable.lianbangjinbi2
			local lianbangjinbi3 = PHB_caifushuchutable.lianbangjinbi3
			local lianbangjinbi4 = PHB_caifushuchutable.lianbangjinbi4
			API_ConsortiaRankInfo(ActorID,2,2,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangjinbi1)
			API_ConsortiaRankInfo(ActorID,2,2,lianbangjinbi2)
			API_ConsortiaRankInfo(ActorID,2,2,lianbangjinbi3)
			API_ConsortiaRankInfo(ActorID,2,2,lianbangjinbi4..'</Info>')
		end 
		
		if diguonTotalNum > 0 and diguonTotalNum < 31 then
			local diguojinbi1 = PHB_caifushuchutable.diguojinbi1
			API_ConsortiaRankInfo(ActorID,2,1,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguojinbi1..'</Info>')
		elseif diguonTotalNum > 30 and diguonTotalNum < 61 then
			local diguojinbi1 = PHB_caifushuchutable.diguojinbi1
			local diguojinbi2 = PHB_caifushuchutable.diguojinbi2
			API_ConsortiaRankInfo(ActorID,2,1,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguojinbi1)
			API_ConsortiaRankInfo(ActorID,2,1,diguojinbi2..'</Info>')
		elseif diguonTotalNum > 60 and diguonTotalNum < 91 then
			local diguojinbi1 = PHB_caifushuchutable.diguojinbi1
			local diguojinbi2 = PHB_caifushuchutable.diguojinbi2
			local diguojinbi3 = PHB_caifushuchutable.diguojinbi3
			API_ConsortiaRankInfo(ActorID,2,1,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguojinbi1)
			API_ConsortiaRankInfo(ActorID,2,1,diguojinbi2)
			API_ConsortiaRankInfo(ActorID,2,1,diguojinbi3..'</Info>')			
		elseif diguonTotalNum > 90 and diguonTotalNum < 101 then
			local diguojinbi1 = PHB_caifushuchutable.diguojinbi1
			local diguojinbi2 = PHB_caifushuchutable.diguojinbi2
			local diguojinbi3 = PHB_caifushuchutable.diguojinbi3
			local diguojinbi4 = PHB_caifushuchutable.diguojinbi4
			API_ConsortiaRankInfo(ActorID,2,1,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguojinbi1)
			API_ConsortiaRankInfo(ActorID,2,1,diguojinbi2)
			API_ConsortiaRankInfo(ActorID,2,1,diguojinbi3)
			API_ConsortiaRankInfo(ActorID,2,1,diguojinbi4..'</Info>')
		end 
		
		if quanbunTotalNum > 0 and quanbunTotalNum < 31 then
			local quanbujinbi1 = PHB_caifushuchutable.quanbujinbi1
			API_ConsortiaRankInfo(ActorID,2,3,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'" allrank=\"'..qb..'\">'..quanbujinbi1..'</Info>')
		elseif quanbunTotalNum > 30 and quanbunTotalNum < 61 then
			local quanbujinbi1 = PHB_caifushuchutable.quanbujinbi1
			local quanbujinbi2 = PHB_caifushuchutable.quanbujinbi2
			API_ConsortiaRankInfo(ActorID,2,3,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanbujinbi1)
			API_ConsortiaRankInfo(ActorID,2,3,quanbujinbi2..'</Info>')
		elseif quanbunTotalNum > 60 and quanbunTotalNum < 91 then
			local quanbujinbi1 = PHB_caifushuchutable.quanbujinbi1
			local quanbujinbi2 = PHB_caifushuchutable.quanbujinbi2
			local quanbujinbi3 = PHB_caifushuchutable.quanbujinbi3
			API_ConsortiaRankInfo(ActorID,2,3,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanbujinbi1)
			API_ConsortiaRankInfo(ActorID,2,3,quanbujinbi2)
			API_ConsortiaRankInfo(ActorID,2,3,quanbujinbi3..'</Info>')			
		elseif quanbunTotalNum > 90 and quanbunTotalNum < 101 then
			local quanbujinbi1 = PHB_caifushuchutable.quanbujinbi1
			local quanbujinbi2 = PHB_caifushuchutable.quanbujinbi2
			local quanbujinbi3 = PHB_caifushuchutable.quanbujinbi3
			local quanbujinbi4 = PHB_caifushuchutable.quanbujinbi4
			API_ConsortiaRankInfo(ActorID,2,3,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanbujinbi1)
			API_ConsortiaRankInfo(ActorID,2,3,quanbujinbi2)
			API_ConsortiaRankInfo(ActorID,2,3,quanbujinbi3)
			API_ConsortiaRankInfo(ActorID,2,3,quanbujinbi4..'</Info>')
		end 
	end
end
function PHB_caifushuchu(chaxunzheID,nRankType,nStatDate,nTotalNum, nCampID, nExpLevel, nUserID, nActorID,szActorName, nActiveValue, nRankSerial, nRankValue,nDynamicValue1,nDynamicValue2,nDynamicValue3,szText)
	local sz = '回调值('..chaxunzheID..','..nRankType..','..nStatDate..','..nTotalNum..', '..nCampID..', '..nExpLevel..', '..nUserID..', '..nActorID..','..szActorName..', '..nActiveValue..', '..nRankSerial..', '..nRankValue..','..nDynamicValue1..','..nDynamicValue2..','..nDynamicValue3..','..szText..')'
	--[[if nTotalNum == 0 then
		API_ResponseWrite('<text>暂时没有可查询的信息，请稍候在试。</text><br>')
		API_ResponseFlush(chaxunzheID)
	end]]--
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if nRankType == 2 or nRankType == 3 or nRankType == 4 then
		if PHB_caifushuchutable == nil then --表要改变
			PHB_caifushuchutable = {}
		end
		if PHB_caifushuchutable[nRankType] == nil then
			PHB_caifushuchutable[nRankType] = {}
		end
		if PHB_caifushuchutable[nRankType][nRankSerial] == nil then
			PHB_caifushuchutable[nRankType][nRankSerial] = {}
		end
		
		PHB_caifushuchutable[nRankType][nRankSerial] = {[1]=nTotalNum,[2]=nCampID,[3]=nActorID,[4]=szActorName,[5]=nRankValue,[6]=szText,[7]=nExpLevel,[8]=nActiveValue}
		
		local biaochang = table.getn(PHB_caifushuchutable[nRankType])
		if biaochang == nTotalNum then
			PHB_gerenjinbinumqueren = PHB_gerenjinbinumqueren + 1
			local quanbujinbi1 = 0
			local quanbujinbi2 = 0
			local quanbujinbi3 = 0
			local quanbujinbi4 = 0
			local lianbangjinbi1 = 0
			local lianbangjinbi2 = 0
			local lianbangjinbi3 = 0
			local lianbangjinbi4 = 0
			local diguojinbi1 = 0
			local diguojinbi2 = 0
			local diguojinbi3 = 0
			local diguojinbi4 = 0
			if nRankType == 2 then
				lianbangjinbi1 = ''
				lianbangjinbi2 = ''
				lianbangjinbi3 = ''
				lianbangjinbi4 = ''
			elseif nRankType == 3 then
				diguojinbi1 = ''
				diguojinbi2 = ''
				diguojinbi3 = ''
				diguojinbi4 = ''
			elseif nRankType == 4 then
				quanbujinbi1 = ''
				quanbujinbi2 = ''
				quanbujinbi3 = ''
				quanbujinbi4 = ''
			end

			local zj = API_GetActorRank(chaxunzheID,0)
			local qb = API_GetActorRank(chaxunzheID,1)
			
			for i = 1,nTotalNum do
				if PHB_caifushuchutable[nRankType][i] ~= nil then
					local CampID = PHB_caifushuchutable[nRankType][i][2]
					if CampID == 0 then
						CampID = '帝国'
					elseif CampID == 1 then
						CampID = '联邦'
					end
					local ActorID = PHB_caifushuchutable[nRankType][i][3]
					local ActorName = PHB_caifushuchutable[nRankType][i][4]
					local RankValue = PHB_caifushuchutable[nRankType][i][5]
					local ConsortiaIdname = PHB_caifushuchutable[nRankType][i][6]
					local nlen = string.len(ConsortiaIdname)
					if nlen <= 1 then
						ConsortiaIdname = '无'
					end
					local ExpLevel = PHB_caifushuchutable[nRankType][i][7]
					if ExpLevel > 85 then
						ExpLevel = 85
					end
					if ExpLevel < 1 then
						ExpLevel = 1
					end
					local ExpLevelzw = GLOBAL_Exploit[ExpLevel].PeerageDepict				
					local ActiveValue = PHB_caifushuchutable[nRankType][i][8]
					local jinbishuchu1 = ''
					local jinbishuchu2 = ''
					local jinbishuchu3 = ''
					local jinbishuchu4 = ''
					if i >= 1 and i <= 30 then
						jinbishuchu1 = '<lt>'..i..','..ActorName..','..ExpLevelzw..','..ConsortiaIdname..','..RankValue..','..CampID..'-'..ActorID..'</lt>' --佣兵团这里最后要加 -兵团ID					
					elseif i >= 31 and i <= 60 then					
						jinbishuchu2 = '<lt>'..i..','..ActorName..','..ExpLevelzw..','..ConsortiaIdname..','..RankValue..','..CampID..'-'..ActorID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					elseif i >= 61 and i <= 90 then
						jinbishuchu3 = '<lt>'..i..','..ActorName..','..ExpLevelzw..','..ConsortiaIdname..','..RankValue..','..CampID..'-'..ActorID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					elseif i >= 91 and i <= 100 then
						jinbishuchu4 = '<lt>'..i..','..ActorName..','..ExpLevelzw..','..ConsortiaIdname..','..RankValue..','..CampID..'-'..ActorID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					end
					if nRankType == 2 then
						lianbangjinbi1 = lianbangjinbi1 .. jinbishuchu1
						lianbangjinbi2 = lianbangjinbi2 .. jinbishuchu2
						lianbangjinbi3 = lianbangjinbi3 .. jinbishuchu3
						lianbangjinbi4 = lianbangjinbi4 .. jinbishuchu4
					elseif nRankType == 3 then
						diguojinbi1 = diguojinbi1 .. jinbishuchu1
						diguojinbi2 = diguojinbi2 .. jinbishuchu2
						diguojinbi3 = diguojinbi3 .. jinbishuchu3
						diguojinbi4 = diguojinbi4 .. jinbishuchu4
					elseif nRankType == 4 then
						quanbujinbi1 = quanbujinbi1 .. jinbishuchu1
						quanbujinbi2 = quanbujinbi2 .. jinbishuchu2
						quanbujinbi3 = quanbujinbi3 .. jinbishuchu3
						quanbujinbi4 = quanbujinbi4 .. jinbishuchu4
					end
				end
			end			
			if lianbangjinbi1 ~= 0 and lianbangjinbi1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					--API_ConsortiaRankInfo(chaxunzheID,2,2,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangjinbi1..'</Info>')
					PHB_caifushuchutable.lianbangjinbi1 = lianbangjinbi1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					--API_ConsortiaRankInfo(chaxunzheID,2,2,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangjinbi1)
					--API_ConsortiaRankInfo(chaxunzheID,2,2,lianbangjinbi2..'</Info>')
					PHB_caifushuchutable.lianbangjinbi1 = lianbangjinbi1
					PHB_caifushuchutable.lianbangjinbi2 = lianbangjinbi2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					--API_ConsortiaRankInfo(chaxunzheID,2,2,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangjinbi1)
					--API_ConsortiaRankInfo(chaxunzheID,2,2,lianbangjinbi2)
					--API_ConsortiaRankInfo(chaxunzheID,2,2,lianbangjinbi3..'</Info>')			
					PHB_caifushuchutable.lianbangjinbi1 = lianbangjinbi1
					PHB_caifushuchutable.lianbangjinbi2 = lianbangjinbi2
					PHB_caifushuchutable.lianbangjinbi3 = lianbangjinbi3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					--API_ConsortiaRankInfo(chaxunzheID,2,2,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..lianbangjinbi1)
					--API_ConsortiaRankInfo(chaxunzheID,2,2,lianbangjinbi2)
					--API_ConsortiaRankInfo(chaxunzheID,2,2,lianbangjinbi3)
					--API_ConsortiaRankInfo(chaxunzheID,2,2,lianbangjinbi4..'</Info>')
					PHB_caifushuchutable.lianbangjinbi1 = lianbangjinbi1
					PHB_caifushuchutable.lianbangjinbi2 = lianbangjinbi2
					PHB_caifushuchutable.lianbangjinbi3 = lianbangjinbi3
					PHB_caifushuchutable.lianbangjinbi4 = lianbangjinbi4
				end
				PHB_caifushuchutable.lianbangnTotalNum = nTotalNum
			else
				API_ConsortiaRankInfo(chaxunzheID,2,2,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\"></Info>')
			end
			if diguojinbi1 ~= 0 and diguojinbi1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					--API_ConsortiaRankInfo(chaxunzheID,2,1,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'" allrank=\"'..qb..'\">'..diguojinbi1..'</Info>')
					PHB_caifushuchutable.diguojinbi1 = diguojinbi1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					--API_ConsortiaRankInfo(chaxunzheID,2,1,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguojinbi1)
					--API_ConsortiaRankInfo(chaxunzheID,2,1,diguojinbi2..'</Info>')
					PHB_caifushuchutable.diguojinbi1 = diguojinbi1
					PHB_caifushuchutable.diguojinbi2 = diguojinbi2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					--API_ConsortiaRankInfo(chaxunzheID,2,1,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguojinbi1)
					--API_ConsortiaRankInfo(chaxunzheID,2,1,diguojinbi2)
					--API_ConsortiaRankInfo(chaxunzheID,2,1,diguojinbi3..'</Info>')			
					PHB_caifushuchutable.diguojinbi1 = diguojinbi1
					PHB_caifushuchutable.diguojinbi2 = diguojinbi2
					PHB_caifushuchutable.diguojinbi3 = diguojinbi3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					--API_ConsortiaRankInfo(chaxunzheID,2,1,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..diguojinbi1)
					--API_ConsortiaRankInfo(chaxunzheID,2,1,diguojinbi2)
					--API_ConsortiaRankInfo(chaxunzheID,2,1,diguojinbi3)
					--API_ConsortiaRankInfo(chaxunzheID,2,1,diguojinbi4..'</Info>')
					PHB_caifushuchutable.diguojinbi1 = diguojinbi1
					PHB_caifushuchutable.diguojinbi2 = diguojinbi2
					PHB_caifushuchutable.diguojinbi3 = diguojinbi3
					PHB_caifushuchutable.diguojinbi4 = diguojinbi4
				end
				PHB_caifushuchutable.diguonTotalNum = nTotalNum
			else
				API_ConsortiaRankInfo(chaxunzheID,2,1,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\"></Info>')
			end
			if quanbujinbi1 ~= 0 and quanbujinbi1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					--API_ConsortiaRankInfo(chaxunzheID,2,3,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanbujinbi1..'</Info>')
					PHB_caifushuchutable.quanbujinbi1 = quanbujinbi1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					--API_ConsortiaRankInfo(chaxunzheID,2,3,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanbujinbi1)
					--API_ConsortiaRankInfo(chaxunzheID,2,3,quanbujinbi2..'</Info>')
					PHB_caifushuchutable.quanbujinbi1 = quanbujinbi1
					PHB_caifushuchutable.quanbujinbi2 = quanbujinbi2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					--API_ConsortiaRankInfo(chaxunzheID,2,3,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanbujinbi1)
					--API_ConsortiaRankInfo(chaxunzheID,2,3,quanbujinbi2)
					--API_ConsortiaRankInfo(chaxunzheID,2,3,quanbujinbi3..'</Info>')			
					PHB_caifushuchutable.quanbujinbi1 = quanbujinbi1
					PHB_caifushuchutable.quanbujinbi2 = quanbujinbi2
					PHB_caifushuchutable.quanbujinbi3 = quanbujinbi3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					--API_ConsortiaRankInfo(chaxunzheID,2,3,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..quanbujinbi1)
					--API_ConsortiaRankInfo(chaxunzheID,2,3,quanbujinbi2)
					--API_ConsortiaRankInfo(chaxunzheID,2,3,quanbujinbi3)
					--API_ConsortiaRankInfo(chaxunzheID,2,3,quanbujinbi4..'</Info>')
					PHB_caifushuchutable.quanbujinbi1 = quanbujinbi1
					PHB_caifushuchutable.quanbujinbi2 = quanbujinbi2
					PHB_caifushuchutable.quanbujinbi3 = quanbujinbi3
					PHB_caifushuchutable.quanbujinbi4 = quanbujinbi4
				end
				PHB_caifushuchutable.quanbunTotalNum = nTotalNum
			else
				API_ConsortiaRankInfo(chaxunzheID,2,3,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\"></Info>')
			end
			if Hour < 3 then
				PHB_caifushuchutable.riqi = API_GetDatatime(8) - 1
			else
				PHB_caifushuchutable.riqi = API_GetDatatime(8)
			end
			
			
			if PHB_gerenjinbinumqueren == 3 then 			
				local shuju1,shuju2,shuju3,shuju4 = 0,0,0,0
				for i=1,3 do
					if i == 1 then
						shuju1 = PHB_caifushuchutable.diguojinbi1
						shuju2 = PHB_caifushuchutable.diguojinbi2
						shuju3 = PHB_caifushuchutable.diguojinbi3
						shuju4 = PHB_caifushuchutable.diguojinbi4					
					elseif 	i == 2 then
						shuju1 = PHB_caifushuchutable.lianbangjinbi1
						shuju2 = PHB_caifushuchutable.lianbangjinbi2
						shuju3 = PHB_caifushuchutable.lianbangjinbi3
						shuju4 = PHB_caifushuchutable.lianbangjinbi4
					elseif 	i == 3 then	
						shuju1 = PHB_caifushuchutable.quanbujinbi1
						shuju2 = PHB_caifushuchutable.quanbujinbi2
						shuju3 = PHB_caifushuchutable.quanbujinbi3
						shuju4 = PHB_caifushuchutable.quanbujinbi4
					end
					if shuju1 ~= nil then
						if shuju4 ~= nil then
							API_ConsortiaRankInfo(chaxunzheID,2,i,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..shuju1)
						else
							API_ConsortiaRankInfo(chaxunzheID,2,i,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..shuju1..'</Info>')
						end
						if shuju2 ~= nil then
							API_ConsortiaRankInfo(chaxunzheID,2,i,shuju2)
						end
						if shuju3 ~= nil then
							API_ConsortiaRankInfo(chaxunzheID,2,i,shuju3)
						end
						if shuju4 ~= nil then
							API_ConsortiaRankInfo(chaxunzheID,2,i,shuju4..'</Info>')
						end
					else			
						API_ConsortiaRankInfo(chaxunzheID,2,i,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\"></Info>')
					end
				end	
				
				--[[API_ConsortiaRankInfo(chaxunzheID,2,2,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..PHB_caifushuchutable.lianbangjinbi1)
				API_ConsortiaRankInfo(chaxunzheID,2,2,PHB_caifushuchutable.lianbangjinbi2)
				API_ConsortiaRankInfo(chaxunzheID,2,2,PHB_caifushuchutable.lianbangjinbi3)
				API_ConsortiaRankInfo(chaxunzheID,2,2,PHB_caifushuchutable.lianbangjinbi4..'</Info>')
				
				API_ConsortiaRankInfo(chaxunzheID,2,1,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..PHB_caifushuchutable.diguojinbi1)
				API_ConsortiaRankInfo(chaxunzheID,2,1,PHB_caifushuchutable.diguojinbi2)
				API_ConsortiaRankInfo(chaxunzheID,2,1,PHB_caifushuchutable.diguojinbi3)
				API_ConsortiaRankInfo(chaxunzheID,2,1,PHB_caifushuchutable.diguojinbi4..'</Info>')
				
				API_ConsortiaRankInfo(chaxunzheID,2,3,'<Info name=\"排名,玩家名字,等级,佣兵团,金币,阵营\" width=\"70,142,104,142,115,75\" myrank=\"'..zj..'\" allrank=\"'..qb..'\">'..PHB_caifushuchutable.quanbujinbi1)
				API_ConsortiaRankInfo(chaxunzheID,2,3,PHB_caifushuchutable.quanbujinbi2)
				API_ConsortiaRankInfo(chaxunzheID,2,3,PHB_caifushuchutable.quanbujinbi3)
				API_ConsortiaRankInfo(chaxunzheID,2,3,PHB_caifushuchutable.quanbujinbi4..'</Info>')
				]]
			end
		end
	end
end
--[[
function PHB_meixiaoshishujuchongzhi()
API_Trace('开始获取数据')	
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local t = os.date("*t",os.time())
	if Hour < 3 then
		t.day = t.day - 1
	else
		t.day = t.day
	end
	local zuotianriqi = os.date("%Y%m%d",(os.time(t))) 	
API_Trace('日期='..zuotianriqi)		
	API_UpdateStatistic(2,100,zuotianriqi,'PHB_shujuduqu')--这里有BUG现在只能查100个 回调函数名字
	API_UpdateStatistic(3,100,zuotianriqi,'PHB_shujuduqu')--这里有BUG现在只能查100个 回调函数名字	
	API_UpdateStatistic(4,100,zuotianriqi,'PHB_shujuduqu')
	API_UpdateStatistic(5,100,zuotianriqi,'PHB_shujuduqu')
	API_UpdateStatistic(6,100,zuotianriqi,'PHB_shujuduqu')
	API_UpdateStatistic(7,100,zuotianriqi,'PHB_shujuduqu')
	API_UpdateStatistic(8,100,zuotianriqi,'PHB_shujuduqu')
	API_UpdateStatistic(9,100,zuotianriqi,'PHB_shujuduqu')
	API_UpdateStatistic(10,100,zuotianriqi,'PHB_shujuduqu')
	API_UpdateStatistic(11,100,zuotianriqi,'PHB_shujuduqu')
	API_UpdateStatistic(12,100,zuotianriqi,'PHB_shujuduqu')
	API_UpdateStatistic(13,100,zuotianriqi,'PHB_shujuduqu')
end
function PHB_shujuduqu(chaxunzheID,nRankType,nStatDate,nTotalNum, nCampID, nExpLevel, nUserID, nActorID,szActorName, nActiveValue, nRankSerial, nRankValue,nDynamicValue1,nDynamicValue2,nDynamicValue3,szText)
API_Trace('回调OK='..nRankType)		
	if nRankSerial == 0 then
		return
	end
	if nRankType == 2 or nRankType == 3 or nRankType == 4 then
		if PHB_caifushuchutable == nil then --表要改变
			PHB_caifushuchutable = {}
		end
		if PHB_caifushuchutable[nRankType] == nil then
			PHB_caifushuchutable[nRankType] = {}
		end
		if PHB_caifushuchutable[nRankType][nRankSerial] == nil then
			PHB_caifushuchutable[nRankType][nRankSerial] = {}
		end
		PHB_caifushuchutable[nRankType][nRankSerial] = {[1]=nTotalNum,[2]=nCampID,[3]=nActorID,[4]=szActorName,[5]=nRankValue,[6]=szText,[7]=nExpLevel,[8]=nActiveValue}
	end
	if nRankType == 5 or nRankType == 6 or nRankType == 7 then
		if PHB_zhanlishuchutable == nil then --表要改变
			PHB_zhanlishuchutable = {}
		end
		if PHB_zhanlishuchutable[nRankType] == nil then
			PHB_zhanlishuchutable[nRankType] = {}
		end
		if PHB_zhanlishuchutable[nRankType][nRankSerial] == nil then
			PHB_zhanlishuchutable[nRankType][nRankSerial] = {}
		end
		PHB_zhanlishuchutable[nRankType][nRankSerial] = {[1]=nTotalNum,[2]=nCampID,[3]=nActorID,[4]=szActorName,[5]=nRankValue,[6]=szText,[7]=nExpLevel,[8]=nActiveValue}	
	end
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
	end
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
	end
end
if not API_IsEctypeServer() or API_IsBranchServer() then
	PHB_meixiaoshishujuchongzhi()
	API_CreateTimerTriggerG(0,0,3600,-1,'PHB_meixiaoshishujuchongzhi')
end
]]