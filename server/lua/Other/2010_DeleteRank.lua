--庄园排行榜重复姓名临时清理脚本 by万钰林
if API_GetServerID() == 1 then 
	for p = 1, table.getn(MLB_DBSaveTable) do
		local DBTable = MLB_DBSaveTable[p]
		local LingShiWeekTable = {}
		local LinShiZhongTable = {}
		local LinShiActorWeekMingCi = {}
		local LinShiActorZhongMingCi = {}
		local ChongFuNameWeek = {}
		local ChongFuNameZhong = {}
		for i = 1, 500 do
			local PaiMinSave = DBTable.DBSaveDZ[i]
			local KeySave = PaiMinSave.Key
			local WeekNameSave = PaiMinSave.WeekName
			local WeekNumSave = PaiMinSave.WeekNum
			local WeekNumType = PaiMinSave.WeekNumType
			local WeekIDSave = PaiMinSave.WeekID
			local ZhongNameSave = PaiMinSave.ZhongName
			local ZhongNumSave = PaiMinSave.ZhongNum
			local ZhongNumType = PaiMinSave.ZhongNumType
			local ZhongIDSave = PaiMinSave.ZhongID
			
			local WeekName = API_VarDataGetString_Ex(1,0,WeekNameSave,1,KeySave)
			local WeekID = API_VarDataGetNumber_Ex(1,0,WeekIDSave,1,KeySave)
			local ZhongName = API_VarDataGetString_Ex(1,0,ZhongNameSave,1,KeySave)
			local ZhongID = API_VarDataGetNumber_Ex(1,0,ZhongIDSave,1,KeySave)
			
			LingShiWeekTable[i] = {Name = WeekName,ID = WeekID, Num = {},Type={}, XuHao = i}
			LinShiZhongTable[i] = {Name = ZhongName,ID = ZhongID, Num = {},Type={}, XuHao = i}
			for j = 1,table.getn(WeekNumSave) do
				LingShiWeekTable[i].Type[j] = WeekNumType[j]
				if LingShiWeekTable[i].Type[j] == 1 then
					local WeekNum = API_VarDataGetNumber_Ex(1,0,WeekNumSave[j],1,KeySave)
					LingShiWeekTable[i].Num[j] = WeekNum
				else
					local WeekNum = API_VarDataGetString_Ex(1,0,WeekNumSave[j],1,KeySave)
					LingShiWeekTable[i].Num[j] = WeekNum
				end
				
			end
			
			for j = 1,table.getn(ZhongNumSave) do
				LinShiZhongTable[i].Type[j] = ZhongNumType[j]
				if LinShiZhongTable[i].Type[j] == 1 then
					local ZhongNum = API_VarDataGetNumber_Ex(1,0,ZhongNumSave[j],1,KeySave)
					LinShiZhongTable[i].Num[j] = ZhongNum
				else
					local ZhongNum = API_VarDataGetString_Ex(1,0,ZhongNumSave[j],1,KeySave)
					LinShiZhongTable[i].Num[j] = ZhongNum
				end
				
			end
			LinShiActorWeekMingCi[WeekName] = i
			LinShiActorZhongMingCi[ZhongName] = i
			ChongFuNameWeek[WeekName] = {Num = 0,Rank = {},}
			ChongFuNameZhong[WeekName] = {Num = 0,Rank = {},}
		end
		--给每个名字计数，如果只有一个名字，那么数字最多为1
		for j in ChongFuNameWeek do 
			for i = 1, 500 do
				if string.len(j) ~= 0 and j == LingShiWeekTable[i].Name then
					ChongFuNameWeek[j].Num = ChongFuNameWeek[j].Num + 1
					table.insert(ChongFuNameWeek[j].Rank,i)
				end
				if i == 500 and ChongFuNameWeek[j].Num <= 1 then
					ChongFuNameWeek[j] = nil
				end
			end
		end
		for j in ChongFuNameZhong do 
			for i = 1, 500 do
				if string.len(j) ~= 0 and j == LinShiZhongTable[i].Name then
					ChongFuNameZhong[j].Num = ChongFuNameZhong[j].Num + 1
					table.insert(ChongFuNameZhong[j].Rank,i)
				end
				if i == 500 and ChongFuNameZhong[j].Num <= 1 then
					ChongFuNameZhong[j] = nil
				end
			end
		end
		--如果有超过1的，往死里整
		for k in ChongFuNameWeek do
			if ChongFuNameWeek[k].Num > 1 then
				for i in ChongFuNameWeek[k].Rank do
					if i ~= 1 then
						local PaiMinSave = DBTable.DBSaveDZ[ChongFuNameWeek[k].Rank[i]]
						local KeySave = PaiMinSave.Key
						local WeekNameSave = PaiMinSave.WeekName
						local WeekNumSave = PaiMinSave.WeekNum
						local WeekName = API_VarDataGetString_Ex(1,0,WeekNameSave,1,KeySave)
						local WeekIDSave = PaiMinSave.WeekID
						local WeekID = API_VarDataGetNumber_Ex(1,0,WeekIDSave,1,KeySave)
						API_VarDataSetString_Ex_Sync(1,0,WeekNameSave,1,KeySave,'')
						API_VarDataSetNumber_Ex_Sync(1,0,WeekIDSave,1,KeySave,0)
						for j = 1,table.getn(WeekNumSave) do
							local NewWeekNum = LingShiWeekTable[i].Num[j]
							if type(NewWeekNum) == 'number' then
								API_VarDataSetNumber_Ex_Sync(1,0,WeekNumSave[j],1,KeySave,0)
							else
								API_VarDataSetString_Ex_Sync(1,0,WeekNumSave[j],1,KeySave,'')
							end
						end
					end
				end
			end
		end
		for k in ChongFuNameZhong do
			if ChongFuNameZhong[k].Num > 1 then
				for i in ChongFuNameZhong[k].Rank do
					if i ~= 1 then
						local PaiMinSave = DBTable.DBSaveDZ[ChongFuNameZhong[k].Rank[i]]
						local KeySave = PaiMinSave.Key
						local ZhongNameSave = PaiMinSave.ZhongName
						local ZhongNumSave = PaiMinSave.ZhongNum
						local ZhongName = API_VarDataGetString_Ex(1,0,ZhongNameSave,1,KeySave)
						local ZhongIDSave = PaiMinSave.ZhongID
						local ZhongID = API_VarDataGetNumber_Ex(1,0,ZhongIDSave,1,KeySave)
						API_VarDataSetString_Ex_Sync(1,0,ZhongNameSave,1,KeySave,'')
						API_VarDataSetNumber_Ex_Sync(1,0,ZhongIDSave,1,KeySave,0)
						for j = 1,table.getn(ZhongNumSave) do
							local NewZhongNum = LinShiZhongTable[i].Num[j]
							if type(NewZhongNum) == 'number' then
								API_VarDataSetNumber_Ex_Sync(1,0,ZhongNumSave[j],1,KeySave,0)
							else
								API_VarDataSetString_Ex_Sync(1,0,ZhongNumSave[j],1,KeySave,'')
							end
						end
					end
				end
			end
		end
	end
end

--[[
if API_GetServerID() == 1 then  
	local Name = {'孤傲逆天','孤独','寂寞','我靠','非诚勿扰','拜金主义','搞毛',}  
	local DBTable = MLB_DBSaveTable[8] 
	for i = 2,200 do  
		local PaiMinSave = DBTable.DBSaveDZ[i] 
		local KeySave = PaiMinSave.Key 
		local WeekNameSave = PaiMinSave.WeekName 
		local WeekNumSave = PaiMinSave.WeekNum 
		local WeekName = API_VarDataGetString_Ex(1,0,WeekNameSave,1,KeySave) 
		local WeekIDSave = PaiMinSave.WeekID 
		local WeekID = API_VarDataGetNumber_Ex(1,0,WeekIDSave,1,KeySave) 
		local N = Name[math.random(table.getn(Name))] 
		API_VarDataSetString_Ex_Sync(1,0,WeekNameSave,1,KeySave,N) 
		API_VarDataSetNumber_Ex_Sync(1,0,WeekIDSave,1,KeySave,10) 
	end 
end  

]]