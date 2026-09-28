--个人财富排行榜
--/nRankType:排名项类型
--2 联邦金钱排行
--3 帝国金钱排行
--4 全部金钱排行
--2008.12.11
--林瑞宇

function PHB_GeRenJinBiPaiHangBang_Title() --函数名要替换
	local ActorID = API_RequestGetActorID()
	local t = os.date("*t",os.time())
	t.day = t.day-1
	local zuotianriqi = os.date("%Y%m%d",(os.time(t))) 
	if PHB_caifushuchutable == nil then     --表要改变
		PHB_caifushuchutable = {}
	end
	if PHB_caifushuchutable.quanbujinbi1 == nil then
		API_SelectStatistic(ActorID,2,100,zuotianriqi,'PHB_caifushuchu')--这里有BUG现在只能查100个 回调函数名字
		API_SelectStatistic(ActorID,3,100,zuotianriqi,'PHB_caifushuchu')--这里有BUG现在只能查100个 回调函数名字	
		API_SelectStatistic(ActorID,4,100,zuotianriqi,'PHB_caifushuchu')--这里有BUG现在只能查100个 回调函数名字
	else
		local riqi = PHB_caifushuchutable.riqi --存储今天的日期 日期相同 就直接取 不相同就把表清空 重新来（表要改）
		local nowtime = API_GetDatatime(8) --一年中的第几天
		if nowtime ~= riqi then
			PHB_caifushuchutable = {} --表要改
			API_SelectStatistic(ActorID,2,100,zuotianriqi,'PHB_caifushuchu')--这里有BUG现在只能查100个 回调函数名字
			API_SelectStatistic(ActorID,3,100,zuotianriqi,'PHB_caifushuchu')--这里有BUG现在只能查100个 回调函数名字
			API_SelectStatistic(ActorID,4,100,zuotianriqi,'PHB_caifushuchu')--这里有BUG现在只能查100个 回调函数名字
		else
			local lianbangnTotalNum = PHB_caifushuchutable.lianbangnTotalNum	
			local quanbunTotalNum = PHB_caifushuchutable.quanbunTotalNum
			local diguonTotalNum = PHB_caifushuchutable.diguonTotalNum
			
			if lianbangnTotalNum > 0 and lianbangnTotalNum < 31 then
				local lianbangjinbi1 = PHB_caifushuchutable.lianbangjinbi1
				API_ConsortiaRankInfo(ActorID,2,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangjinbi1..'</Info>')
			elseif lianbangnTotalNum > 30 and lianbangnTotalNum < 61 then
				local lianbangjinbi1 = PHB_caifushuchutable.lianbangjinbi1
				local lianbangjinbi2 = PHB_caifushuchutable.lianbangjinbi2
				API_ConsortiaRankInfo(ActorID,2,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangjinbi1)
				API_ConsortiaRankInfo(ActorID,2,2,lianbangjinbi2..'</Info>')
			elseif lianbangnTotalNum > 60 and lianbangnTotalNum < 91 then
				local lianbangjinbi1 = PHB_caifushuchutable.lianbangjinbi1
				local lianbangjinbi2 = PHB_caifushuchutable.lianbangjinbi2
				local lianbangjinbi3 = PHB_caifushuchutable.lianbangjinbi3
				API_ConsortiaRankInfo(ActorID,2,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangjinbi1)
				API_ConsortiaRankInfo(ActorID,2,2,lianbangjinbi2)
				API_ConsortiaRankInfo(ActorID,2,2,lianbangjinbi3..'</Info>')			
			elseif lianbangnTotalNum > 90 and lianbangnTotalNum < 101 then
				local lianbangjinbi1 = PHB_caifushuchutable.lianbangjinbi1
				local lianbangjinbi2 = PHB_caifushuchutable.lianbangjinbi2
				local lianbangjinbi3 = PHB_caifushuchutable.lianbangjinbi3
				local lianbangjinbi4 = PHB_caifushuchutable.lianbangjinbi4
				API_ConsortiaRankInfo(ActorID,2,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangjinbi1)
				API_ConsortiaRankInfo(ActorID,2,2,lianbangjinbi2)
				API_ConsortiaRankInfo(ActorID,2,2,lianbangjinbi3)
				API_ConsortiaRankInfo(ActorID,2,2,lianbangjinbi4..'</Info>')
			end 
			
			if diguonTotalNum > 0 and diguonTotalNum < 31 then
				local diguojinbi1 = PHB_caifushuchutable.diguojinbi1
				API_ConsortiaRankInfo(ActorID,2,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguojinbi1..'</Info>')
			elseif diguonTotalNum > 30 and diguonTotalNum < 61 then
				local diguojinbi1 = PHB_caifushuchutable.diguojinbi1
				local diguojinbi2 = PHB_caifushuchutable.diguojinbi2
				API_ConsortiaRankInfo(ActorID,2,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguojinbi1)
				API_ConsortiaRankInfo(ActorID,2,1,diguojinbi2..'</Info>')
			elseif diguonTotalNum > 60 and diguonTotalNum < 91 then
				local diguojinbi1 = PHB_caifushuchutable.diguojinbi1
				local diguojinbi2 = PHB_caifushuchutable.diguojinbi2
				local diguojinbi3 = PHB_caifushuchutable.diguojinbi3
				API_ConsortiaRankInfo(ActorID,2,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguojinbi1)
				API_ConsortiaRankInfo(ActorID,2,1,diguojinbi2)
				API_ConsortiaRankInfo(ActorID,2,1,diguojinbi3..'</Info>')			
			elseif diguonTotalNum > 90 and diguonTotalNum < 101 then
				local diguojinbi1 = PHB_caifushuchutable.diguojinbi1
				local diguojinbi2 = PHB_caifushuchutable.diguojinbi2
				local diguojinbi3 = PHB_caifushuchutable.diguojinbi3
				local diguojinbi4 = PHB_caifushuchutable.diguojinbi4
				API_ConsortiaRankInfo(ActorID,2,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguojinbi1)
				API_ConsortiaRankInfo(ActorID,2,1,diguojinbi2)
				API_ConsortiaRankInfo(ActorID,2,1,diguojinbi3)
				API_ConsortiaRankInfo(ActorID,2,1,diguojinbi4..'</Info>')
			end 
			
			if quanbunTotalNum > 0 and quanbunTotalNum < 31 then
				local quanbujinbi1 = PHB_caifushuchutable.quanbujinbi1
				API_ConsortiaRankInfo(ActorID,2,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbujinbi1..'</Info>')
			elseif quanbunTotalNum > 30 and quanbunTotalNum < 61 then
				local quanbujinbi1 = PHB_caifushuchutable.quanbujinbi1
				local quanbujinbi2 = PHB_caifushuchutable.quanbujinbi2
				API_ConsortiaRankInfo(ActorID,2,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbujinbi1)
				API_ConsortiaRankInfo(ActorID,2,3,quanbujinbi2..'</Info>')
			elseif quanbunTotalNum > 60 and quanbunTotalNum < 91 then
				local quanbujinbi1 = PHB_caifushuchutable.quanbujinbi1
				local quanbujinbi2 = PHB_caifushuchutable.quanbujinbi2
				local quanbujinbi3 = PHB_caifushuchutable.quanbujinbi3
				API_ConsortiaRankInfo(ActorID,2,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbujinbi1)
				API_ConsortiaRankInfo(ActorID,2,3,quanbujinbi2)
				API_ConsortiaRankInfo(ActorID,2,3,quanbujinbi3..'</Info>')			
			elseif quanbunTotalNum > 90 and quanbunTotalNum < 101 then
				local quanbujinbi1 = PHB_caifushuchutable.quanbujinbi1
				local quanbujinbi2 = PHB_caifushuchutable.quanbujinbi2
				local quanbujinbi3 = PHB_caifushuchutable.quanbujinbi3
				local quanbujinbi4 = PHB_caifushuchutable.quanbujinbi4
				API_ConsortiaRankInfo(ActorID,2,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbujinbi1)
				API_ConsortiaRankInfo(ActorID,2,3,quanbujinbi2)
				API_ConsortiaRankInfo(ActorID,2,3,quanbujinbi3)
				API_ConsortiaRankInfo(ActorID,2,3,quanbujinbi4..'</Info>')
			end 
		end
	end
end
function PHB_caifushuchu(chaxunzheID,nRankType,nStatDate,nTotalNum, nCampID, nExpLevel, nUserID, nActorID,szActorName, nActiveValue, nRankSerial, nRankValue,nDynamicValue1,nDynamicValue2,nDynamicValue3,szText)
	local sz = '回调值('..chaxunzheID..','..nRankType..','..nStatDate..','..nTotalNum..', '..nCampID..', '..nExpLevel..', '..nUserID..', '..nActorID..','..szActorName..', '..nActiveValue..', '..nRankSerial..', '..nRankValue..','..nDynamicValue1..','..nDynamicValue2..','..nDynamicValue3..','..szText..')'
	--[[if nTotalNum == 0 then
		API_ResponseWrite('<text>暂时没有可查询的信息，请稍候在试。</text><br>')
		API_ResponseFlush(chaxunzheID)
	end]]--
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
						jinbishuchu1 = '<lt>'..i..','..ActorName..','..ExpLevelzw..','..ConsortiaIdname..','..RankValue..','..ActiveValue..','..CampID..'-'..ActorID..'</lt>' --佣兵团这里最后要加 -兵团ID					
					elseif i >= 31 and i <= 60 then					
						jinbishuchu2 = '<lt>'..i..','..ActorName..','..ExpLevelzw..','..ConsortiaIdname..','..RankValue..','..ActiveValue..','..CampID..'-'..ActorID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					elseif i >= 61 and i <= 90 then
						jinbishuchu3 = '<lt>'..i..','..ActorName..','..ExpLevelzw..','..ConsortiaIdname..','..RankValue..','..ActiveValue..','..CampID..'-'..ActorID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					elseif i >= 91 and i <= 100 then
						jinbishuchu4 = '<lt>'..i..','..ActorName..','..ExpLevelzw..','..ConsortiaIdname..','..RankValue..','..ActiveValue..','..CampID..'-'..ActorID..'</lt>' --佣兵团这里最后要加 -兵团ID	
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
					API_ConsortiaRankInfo(chaxunzheID,2,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangjinbi1..'</Info>')
					PHB_caifushuchutable.lianbangjinbi1 = lianbangjinbi1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					API_ConsortiaRankInfo(chaxunzheID,2,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangjinbi1)
					API_ConsortiaRankInfo(chaxunzheID,2,2,lianbangjinbi2..'</Info>')
					PHB_caifushuchutable.lianbangjinbi1 = lianbangjinbi1
					PHB_caifushuchutable.lianbangjinbi2 = lianbangjinbi2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					API_ConsortiaRankInfo(chaxunzheID,2,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangjinbi1)
					API_ConsortiaRankInfo(chaxunzheID,2,2,lianbangjinbi2)
					API_ConsortiaRankInfo(chaxunzheID,2,2,lianbangjinbi3..'</Info>')			
					PHB_caifushuchutable.lianbangjinbi1 = lianbangjinbi1
					PHB_caifushuchutable.lianbangjinbi2 = lianbangjinbi2
					PHB_caifushuchutable.lianbangjinbi3 = lianbangjinbi3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					API_ConsortiaRankInfo(chaxunzheID,2,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangjinbi1)
					API_ConsortiaRankInfo(chaxunzheID,2,2,lianbangjinbi2)
					API_ConsortiaRankInfo(chaxunzheID,2,2,lianbangjinbi3)
					API_ConsortiaRankInfo(chaxunzheID,2,2,lianbangjinbi4..'</Info>')
					PHB_caifushuchutable.lianbangjinbi1 = lianbangjinbi1
					PHB_caifushuchutable.lianbangjinbi2 = lianbangjinbi2
					PHB_caifushuchutable.lianbangjinbi3 = lianbangjinbi3
					PHB_caifushuchutable.lianbangjinbi4 = lianbangjinbi4
				end
				PHB_caifushuchutable.lianbangnTotalNum = nTotalNum
			end
			if diguojinbi1 ~= 0 and diguojinbi1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					API_ConsortiaRankInfo(chaxunzheID,2,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguojinbi1..'</Info>')
					PHB_caifushuchutable.diguojinbi1 = diguojinbi1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					API_ConsortiaRankInfo(chaxunzheID,2,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguojinbi1)
					API_ConsortiaRankInfo(chaxunzheID,2,1,diguojinbi2..'</Info>')
					PHB_caifushuchutable.diguojinbi1 = diguojinbi1
					PHB_caifushuchutable.diguojinbi2 = diguojinbi2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					API_ConsortiaRankInfo(chaxunzheID,2,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguojinbi1)
					API_ConsortiaRankInfo(chaxunzheID,2,1,diguojinbi2)
					API_ConsortiaRankInfo(chaxunzheID,2,1,diguojinbi3..'</Info>')			
					PHB_caifushuchutable.diguojinbi1 = diguojinbi1
					PHB_caifushuchutable.diguojinbi2 = diguojinbi2
					PHB_caifushuchutable.diguojinbi3 = diguojinbi3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					API_ConsortiaRankInfo(chaxunzheID,2,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguojinbi1)
					API_ConsortiaRankInfo(chaxunzheID,2,1,diguojinbi2)
					API_ConsortiaRankInfo(chaxunzheID,2,1,diguojinbi3)
					API_ConsortiaRankInfo(chaxunzheID,2,1,diguojinbi4..'</Info>')
					PHB_caifushuchutable.diguojinbi1 = diguojinbi1
					PHB_caifushuchutable.diguojinbi2 = diguojinbi2
					PHB_caifushuchutable.diguojinbi3 = diguojinbi3
					PHB_caifushuchutable.diguojinbi4 = diguojinbi4
				end
				PHB_caifushuchutable.diguonTotalNum = nTotalNum
			end
			if quanbujinbi1 ~= 0 and quanbujinbi1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					API_ConsortiaRankInfo(chaxunzheID,2,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbujinbi1..'</Info>')
					PHB_caifushuchutable.quanbujinbi1 = quanbujinbi1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					API_ConsortiaRankInfo(chaxunzheID,2,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbujinbi1)
					API_ConsortiaRankInfo(chaxunzheID,2,3,quanbujinbi2..'</Info>')
					PHB_caifushuchutable.quanbujinbi1 = quanbujinbi1
					PHB_caifushuchutable.quanbujinbi2 = quanbujinbi2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					API_ConsortiaRankInfo(chaxunzheID,2,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbujinbi1)
					API_ConsortiaRankInfo(chaxunzheID,2,3,quanbujinbi2)
					API_ConsortiaRankInfo(chaxunzheID,2,3,quanbujinbi3..'</Info>')			
					PHB_caifushuchutable.quanbujinbi1 = quanbujinbi1
					PHB_caifushuchutable.quanbujinbi2 = quanbujinbi2
					PHB_caifushuchutable.quanbujinbi3 = quanbujinbi3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					API_ConsortiaRankInfo(chaxunzheID,2,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,金币,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbujinbi1)
					API_ConsortiaRankInfo(chaxunzheID,2,3,quanbujinbi2)
					API_ConsortiaRankInfo(chaxunzheID,2,3,quanbujinbi3)
					API_ConsortiaRankInfo(chaxunzheID,2,3,quanbujinbi4..'</Info>')
					PHB_caifushuchutable.quanbujinbi1 = quanbujinbi1
					PHB_caifushuchutable.quanbujinbi2 = quanbujinbi2
					PHB_caifushuchutable.quanbujinbi3 = quanbujinbi3
					PHB_caifushuchutable.quanbujinbi4 = quanbujinbi4
				end
				PHB_caifushuchutable.quanbunTotalNum = nTotalNum
			end
			PHB_caifushuchutable.riqi = API_GetDatatime(8)
		end
	end
end
