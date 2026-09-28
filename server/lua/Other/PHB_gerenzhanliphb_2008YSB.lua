--个人战力排行榜
--/nRankType:排名项类型
--5 联邦战力排行
--6 帝国战力排行
--7 全部战力排行
--2008.12.11
--林瑞宇
function PHB_GeRenZhanLiPaiHangBang() --函数名要替换
	local ActorID = API_RequestGetActorID()
	local t = os.date("*t",os.time())
	t.day = t.day-1
	local zuotianriqi = os.date("%Y%m%d",(os.time(t))) 
	if PHB_zhanlishuchutable == nil then     --表要改变
		PHB_zhanlishuchutable = {}
	end
	if PHB_zhanlishuchutable.quanbuzhanli1 == nil then
		API_SelectStatistic(ActorID,5,100,zuotianriqi,'PHB_zhanlishuchuhanshu')--这里有BUG现在只能查100个 回调函数名字
		API_SelectStatistic(ActorID,6,100,zuotianriqi,'PHB_zhanlishuchuhanshu')--这里有BUG现在只能查100个 回调函数名字	
		API_SelectStatistic(ActorID,7,100,zuotianriqi,'PHB_zhanlishuchuhanshu')--这里有BUG现在只能查100个 回调函数名字	
	else
		local riqi = PHB_zhanlishuchutable.riqi --存储今天的日期 日期相同 就直接取 不相同就把表清空 重新来（表要改）
		local nowtime = API_GetDatatime(8) --一年中的第几天
		if nowtime ~= riqi then
			PHB_zhanlishuchutable = {} --表要改
			API_SelectStatistic(ActorID,5,100,zuotianriqi,'PHB_zhanlishuchuhanshu')--这里有BUG现在只能查100个 回调函数名字
			API_SelectStatistic(ActorID,6,100,zuotianriqi,'PHB_zhanlishuchuhanshu')--这里有BUG现在只能查100个 回调函数名字
			API_SelectStatistic(ActorID,7,100,zuotianriqi,'PHB_zhanlishuchuhanshu')--这里有BUG现在只能查100个 回调函数名字
		else
			local lianbangnTotalNum = PHB_zhanlishuchutable.lianbangnTotalNum	
			local quanbunTotalNum = PHB_zhanlishuchutable.quanbunTotalNum
			local diguonTotalNum = PHB_zhanlishuchutable.diguonTotalNum
			
			if lianbangnTotalNum > 0 and lianbangnTotalNum < 31 then
				local lianbangzhanli1 = PHB_zhanlishuchutable.lianbangzhanli1
				API_ConsortiaRankInfo(ActorID,1,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangzhanli1..'</Info>')
			elseif lianbangnTotalNum > 30 and lianbangnTotalNum < 61 then
				local lianbangzhanli1 = PHB_zhanlishuchutable.lianbangzhanli1
				local lianbangzhanli2 = PHB_zhanlishuchutable.lianbangzhanli2
				API_ConsortiaRankInfo(ActorID,1,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangzhanli1)
				API_ConsortiaRankInfo(ActorID,1,2,lianbangzhanli2..'</Info>')
			elseif lianbangnTotalNum > 60 and lianbangnTotalNum < 91 then
				local lianbangzhanli1 = PHB_zhanlishuchutable.lianbangzhanli1
				local lianbangzhanli2 = PHB_zhanlishuchutable.lianbangzhanli2
				local lianbangzhanli3 = PHB_zhanlishuchutable.lianbangzhanli3
				API_ConsortiaRankInfo(ActorID,1,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangzhanli1)
				API_ConsortiaRankInfo(ActorID,1,2,lianbangzhanli2)
				API_ConsortiaRankInfo(ActorID,1,2,lianbangzhanli3..'</Info>')			
			elseif lianbangnTotalNum > 90 and lianbangnTotalNum < 101 then
				local lianbangzhanli1 = PHB_zhanlishuchutable.lianbangzhanli1
				local lianbangzhanli2 = PHB_zhanlishuchutable.lianbangzhanli2
				local lianbangzhanli3 = PHB_zhanlishuchutable.lianbangzhanli3
				local lianbangzhanli4 = PHB_zhanlishuchutable.lianbangzhanli4
				API_ConsortiaRankInfo(ActorID,1,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangzhanli1)
				API_ConsortiaRankInfo(ActorID,1,2,lianbangzhanli2)
				API_ConsortiaRankInfo(ActorID,1,2,lianbangzhanli3)
				API_ConsortiaRankInfo(ActorID,1,2,lianbangzhanli4..'</Info>')
			end 
			
			if diguonTotalNum > 0 and diguonTotalNum < 31 then
				local diguozhanli1 = PHB_zhanlishuchutable.diguozhanli1
				API_ConsortiaRankInfo(ActorID,1,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguozhanli1..'</Info>')
			elseif diguonTotalNum > 30 and diguonTotalNum < 61 then
				local diguozhanli1 = PHB_zhanlishuchutable.diguozhanli1
				local diguozhanli2 = PHB_zhanlishuchutable.diguozhanli2
				API_ConsortiaRankInfo(ActorID,1,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguozhanli1)
				API_ConsortiaRankInfo(ActorID,1,1,diguozhanli2..'</Info>')
			elseif diguonTotalNum > 60 and diguonTotalNum < 91 then
				local diguozhanli1 = PHB_zhanlishuchutable.diguozhanli1
				local diguozhanli2 = PHB_zhanlishuchutable.diguozhanli2
				local diguozhanli3 = PHB_zhanlishuchutable.diguozhanli3
				API_ConsortiaRankInfo(ActorID,1,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguozhanli1)
				API_ConsortiaRankInfo(ActorID,1,1,diguozhanli2)
				API_ConsortiaRankInfo(ActorID,1,1,diguozhanli3..'</Info>')			
			elseif diguonTotalNum > 90 and diguonTotalNum < 101 then
				local diguozhanli1 = PHB_zhanlishuchutable.diguozhanli1
				local diguozhanli2 = PHB_zhanlishuchutable.diguozhanli2
				local diguozhanli3 = PHB_zhanlishuchutable.diguozhanli3
				local diguozhanli4 = PHB_zhanlishuchutable.diguozhanli4
				API_ConsortiaRankInfo(ActorID,1,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguozhanli1)
				API_ConsortiaRankInfo(ActorID,1,1,diguozhanli2)
				API_ConsortiaRankInfo(ActorID,1,1,diguozhanli3)
				API_ConsortiaRankInfo(ActorID,1,1,diguozhanli4..'</Info>')
			end 
			
			if quanbunTotalNum > 0 and quanbunTotalNum < 31 then
				local quanbuzhanli1 = PHB_zhanlishuchutable.quanbuzhanli1
				API_ConsortiaRankInfo(ActorID,1,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbuzhanli1..'</Info>')
			elseif quanbunTotalNum > 30 and quanbunTotalNum < 61 then
				local quanbuzhanli1 = PHB_zhanlishuchutable.quanbuzhanli1
				local quanbuzhanli2 = PHB_zhanlishuchutable.quanbuzhanli2
				API_ConsortiaRankInfo(ActorID,1,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbuzhanli1)
				API_ConsortiaRankInfo(ActorID,1,3,quanbuzhanli2..'</Info>')
			elseif quanbunTotalNum > 60 and quanbunTotalNum < 91 then
				local quanbuzhanli1 = PHB_zhanlishuchutable.quanbuzhanli1
				local quanbuzhanli2 = PHB_zhanlishuchutable.quanbuzhanli2
				local quanbuzhanli3 = PHB_zhanlishuchutable.quanbuzhanli3
				API_ConsortiaRankInfo(ActorID,1,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbuzhanli1)
				API_ConsortiaRankInfo(ActorID,1,3,quanbuzhanli2)
				API_ConsortiaRankInfo(ActorID,1,3,quanbuzhanli3..'</Info>')			
			elseif quanbunTotalNum > 90 and quanbunTotalNum < 101 then
				local quanbuzhanli1 = PHB_zhanlishuchutable.quanbuzhanli1
				local quanbuzhanli2 = PHB_zhanlishuchutable.quanbuzhanli2
				local quanbuzhanli3 = PHB_zhanlishuchutable.quanbuzhanli3
				local quanbuzhanli4 = PHB_zhanlishuchutable.quanbuzhanli4
				API_ConsortiaRankInfo(ActorID,1,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbuzhanli1)
				API_ConsortiaRankInfo(ActorID,1,3,quanbuzhanli2)
				API_ConsortiaRankInfo(ActorID,1,3,quanbuzhanli3)
				API_ConsortiaRankInfo(ActorID,1,3,quanbuzhanli4..'</Info>')
			end 
		end
	end
end
function PHB_zhanlishuchuhanshu(chaxunzheID,nRankType,nStatDate,nTotalNum, nCampID, nExpLevel, nUserID, nActorID,szActorName, nActiveValue, nRankSerial, nRankValue,nDynamicValue1,nDynamicValue2,nDynamicValue3,szText)
	local sz = '回调值('..chaxunzheID..','..nRankType..','..nStatDate..','..nTotalNum..', '..nCampID..', '..nExpLevel..', '..nUserID..', '..nActorID..','..szActorName..', '..nActiveValue..', '..nRankSerial..', '..nRankValue..','..nDynamicValue1..','..nDynamicValue2..','..nDynamicValue3..','..szText..')'	
	--[[if nTotalNum == 0 then
		API_ResponseWrite('<text>暂时没有可查询的信息，请稍候在试。</text><br>')
		API_ResponseFlush(chaxunzheID)
	end]]--
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
		local biaochang = table.getn(PHB_zhanlishuchutable[nRankType])
		if biaochang == nTotalNum then
			local quanbuzhanli1 = 0
			local quanbuzhanli2 = 0
			local quanbuzhanli3 = 0
			local quanbuzhanli4 = 0
			local lianbangzhanli1 = 0
			local lianbangzhanli2 = 0
			local lianbangzhanli3 = 0
			local lianbangzhanli4 = 0
			local diguozhanli1 = 0
			local diguozhanli2 = 0
			local diguozhanli3 = 0
			local diguozhanli4 = 0
			if nRankType == 2 then
				lianbangzhanli1 = ''
				lianbangzhanli2 = ''
				lianbangzhanli3 = ''
				lianbangzhanli4 = ''
			elseif nRankType == 3 then
				diguozhanli1 = ''
				diguozhanli2 = ''
				diguozhanli3 = ''
				diguozhanli4 = ''
			elseif nRankType == 4 then
				quanbuzhanli1 = ''
				quanbuzhanli2 = ''
				quanbuzhanli3 = ''
				quanbuzhanli4 = ''
			end					
			for i = 1,nTotalNum do
				if PHB_zhanlishuchutable[nRankType][i] ~= nil then
					local CampID = PHB_zhanlishuchutable[nRankType][i][2]
					if CampID == 0 then
						CampID = '帝国'
					elseif CampID == 1 then
						CampID = '联邦'
					end
					local ActorID = PHB_zhanlishuchutable[nRankType][i][3]
					local ActorName = PHB_zhanlishuchutable[nRankType][i][4]
					local RankValue = PHB_zhanlishuchutable[nRankType][i][5]
					local ConsortiaIdname = PHB_zhanlishuchutable[nRankType][i][6]
					local nlen = string.len(ConsortiaIdname)
					if nlen <= 1 then
						ConsortiaIdname = '无'
					end
					local ExpLevel = PHB_zhanlishuchutable[nRankType][i][7]
					if ExpLevel > 85 then
						ExpLevel = 85
					end
					if ExpLevel < 1 then
						ExpLevel = 1
					end
					local ExpLevelzw = GLOBAL_Exploit[ExpLevel].PeerageDepict	
					local ActiveValue = PHB_zhanlishuchutable[nRankType][i][8]
					local zhanlishuchu1 = ''
					local zhanlishuchu2 = ''
					local zhanlishuchu3 = ''
					local zhanlishuchu4 = ''
					if i >= 1 and i <= 30 then
						zhanlishuchu1 = '<lt>'..i..','..ActorName..','..ExpLevelzw..','..ConsortiaIdname..','..RankValue..','..ActiveValue..','..CampID..'-'..ActorID..'</lt>' --佣兵团这里最后要加 -兵团ID					
					elseif i >= 31 and i <= 60 then					
						zhanlishuchu2 = '<lt>'..i..','..ActorName..','..ExpLevelzw..','..ConsortiaIdname..','..RankValue..','..ActiveValue..','..CampID..'-'..ActorID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					elseif i >= 61 and i <= 90 then
						zhanlishuchu3 = '<lt>'..i..','..ActorName..','..ExpLevelzw..','..ConsortiaIdname..','..RankValue..','..ActiveValue..','..CampID..'-'..ActorID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					elseif i >= 91 and i <= 100 then
						zhanlishuchu4 = '<lt>'..i..','..ActorName..','..ExpLevelzw..','..ConsortiaIdname..','..RankValue..','..ActiveValue..','..CampID..'-'..ActorID..'</lt>' --佣兵团这里最后要加 -兵团ID	
					end
					if nRankType == 5 then
						lianbangzhanli1 = lianbangzhanli1 .. zhanlishuchu1
						lianbangzhanli2 = lianbangzhanli2 .. zhanlishuchu2
						lianbangzhanli3 = lianbangzhanli3 .. zhanlishuchu3
						lianbangzhanli4 = lianbangzhanli4 .. zhanlishuchu4
					elseif nRankType == 6 then
						diguozhanli1 = diguozhanli1 .. zhanlishuchu1
						diguozhanli2 = diguozhanli2 .. zhanlishuchu2
						diguozhanli3 = diguozhanli3 .. zhanlishuchu3
						diguozhanli4 = diguozhanli4 .. zhanlishuchu4
					elseif nRankType == 7 then
						quanbuzhanli1 = quanbuzhanli1 .. zhanlishuchu1
						quanbuzhanli2 = quanbuzhanli2 .. zhanlishuchu2
						quanbuzhanli3 = quanbuzhanli3 .. zhanlishuchu3
						quanbuzhanli4 = quanbuzhanli4 .. zhanlishuchu4
					end
				end
			end			
			if lianbangzhanli1 ~= 0 and lianbangzhanli1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					API_ConsortiaRankInfo(chaxunzheID,1,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangzhanli1..'</Info>')
					PHB_zhanlishuchutable.lianbangzhanli1 = lianbangzhanli1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					API_ConsortiaRankInfo(chaxunzheID,1,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangzhanli1)
					API_ConsortiaRankInfo(chaxunzheID,1,2,lianbangzhanli2..'</Info>')
					PHB_zhanlishuchutable.lianbangzhanli1 = lianbangzhanli1
					PHB_zhanlishuchutable.lianbangzhanli2 = lianbangzhanli2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					API_ConsortiaRankInfo(chaxunzheID,1,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangzhanli1)
					API_ConsortiaRankInfo(chaxunzheID,1,2,lianbangzhanli2)
					API_ConsortiaRankInfo(chaxunzheID,1,2,lianbangzhanli3..'</Info>')			
					PHB_zhanlishuchutable.lianbangzhanli1 = lianbangzhanli1
					PHB_zhanlishuchutable.lianbangzhanli2 = lianbangzhanli2
					PHB_zhanlishuchutable.lianbangzhanli3 = lianbangzhanli3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					API_ConsortiaRankInfo(chaxunzheID,1,2,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..lianbangzhanli1)
					API_ConsortiaRankInfo(chaxunzheID,1,2,lianbangzhanli2)
					API_ConsortiaRankInfo(chaxunzheID,1,2,lianbangzhanli3)
					API_ConsortiaRankInfo(chaxunzheID,1,2,lianbangzhanli4..'</Info>')
					PHB_zhanlishuchutable.lianbangzhanli1 = lianbangzhanli1
					PHB_zhanlishuchutable.lianbangzhanli2 = lianbangzhanli2
					PHB_zhanlishuchutable.lianbangzhanli3 = lianbangzhanli3
					PHB_zhanlishuchutable.lianbangzhanli4 = lianbangzhanli4
				end
				PHB_zhanlishuchutable.lianbangnTotalNum = nTotalNum
			end
			if diguozhanli1 ~= 0 and diguozhanli1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					API_ConsortiaRankInfo(chaxunzheID,1,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguozhanli1..'</Info>')
					PHB_zhanlishuchutable.diguozhanli1 = diguozhanli1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					API_ConsortiaRankInfo(chaxunzheID,1,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguozhanli1)
					API_ConsortiaRankInfo(chaxunzheID,1,1,diguozhanli2..'</Info>')
					PHB_zhanlishuchutable.diguozhanli1 = diguozhanli1
					PHB_zhanlishuchutable.diguozhanli2 = diguozhanli2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					API_ConsortiaRankInfo(chaxunzheID,1,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguozhanli1)
					API_ConsortiaRankInfo(chaxunzheID,1,1,diguozhanli2)
					API_ConsortiaRankInfo(chaxunzheID,1,1,diguozhanli3..'</Info>')			
					PHB_zhanlishuchutable.diguozhanli1 = diguozhanli1
					PHB_zhanlishuchutable.diguozhanli2 = diguozhanli2
					PHB_zhanlishuchutable.diguozhanli3 = diguozhanli3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					API_ConsortiaRankInfo(chaxunzheID,1,1,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..diguozhanli1)
					API_ConsortiaRankInfo(chaxunzheID,1,1,diguozhanli2)
					API_ConsortiaRankInfo(chaxunzheID,1,1,diguozhanli3)
					API_ConsortiaRankInfo(chaxunzheID,1,1,diguozhanli4..'</Info>')
					PHB_zhanlishuchutable.diguozhanli1 = diguozhanli1
					PHB_zhanlishuchutable.diguozhanli2 = diguozhanli2
					PHB_zhanlishuchutable.diguozhanli3 = diguozhanli3
					PHB_zhanlishuchutable.diguozhanli4 = diguozhanli4
				end
				PHB_zhanlishuchutable.diguonTotalNum = nTotalNum
			end
			if quanbuzhanli1 ~= 0 and quanbuzhanli1 ~= nil then
				if nTotalNum > 0 and nTotalNum < 31 then
					API_ConsortiaRankInfo(chaxunzheID,2,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbuzhanli1..'</Info>')
					PHB_zhanlishuchutable.quanbuzhanli1 = quanbuzhanli1
				elseif nTotalNum > 30 and nTotalNum < 61 then
					API_ConsortiaRankInfo(chaxunzheID,1,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbuzhanli1)
					API_ConsortiaRankInfo(chaxunzheID,1,3,quanbuzhanli2..'</Info>')
					PHB_zhanlishuchutable.quanbuzhanli1 = quanbuzhanli1
					PHB_zhanlishuchutable.quanbuzhanli2 = quanbuzhanli2
				elseif nTotalNum > 60 and nTotalNum < 91 then
					API_ConsortiaRankInfo(chaxunzheID,1,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbuzhanli1)
					API_ConsortiaRankInfo(chaxunzheID,1,3,quanbuzhanli2)
					API_ConsortiaRankInfo(chaxunzheID,1,3,quanbuzhanli3..'</Info>')			
					PHB_zhanlishuchutable.quanbuzhanli1 = quanbuzhanli1
					PHB_zhanlishuchutable.quanbuzhanli2 = quanbuzhanli2
					PHB_zhanlishuchutable.quanbuzhanli3 = quanbuzhanli3
				elseif nTotalNum > 90 and nTotalNum < 101 then
					API_ConsortiaRankInfo(chaxunzheID,1,3,'<Info name=\"排名,玩家名字,爵位,佣兵团,战力,活跃,阵营\" width=\"60,125,124,125,100,56,59\">'..quanbuzhanli1)
					API_ConsortiaRankInfo(chaxunzheID,1,3,quanbuzhanli2)
					API_ConsortiaRankInfo(chaxunzheID,1,3,quanbuzhanli3)
					API_ConsortiaRankInfo(chaxunzheID,1,3,quanbuzhanli4..'</Info>')
					PHB_zhanlishuchutable.quanbuzhanli1 = quanbuzhanli1
					PHB_zhanlishuchutable.quanbuzhanli2 = quanbuzhanli2
					PHB_zhanlishuchutable.quanbuzhanli3 = quanbuzhanli3
					PHB_zhanlishuchutable.quanbuzhanli4 = quanbuzhanli4
				end
				PHB_zhanlishuchutable.quanbunTotalNum = nTotalNum
			end
			PHB_zhanlishuchutable.riqi = API_GetDatatime(8)
		end
	end
end