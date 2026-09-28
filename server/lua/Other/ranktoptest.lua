if API_GetServerID() == 1 then
API_Trace('开始转换排行榜数据到临时请求列表---------------')
	for j in MLB_DBSaveTable do 
		local SelectHuoDong = j
		API_Trace('开始转换第'..j..'个排行榜数据')
		if SelectHuoDong ~= 9 then
			local DBTable = MLB_DBSaveTable[SelectHuoDong] 
			for i = 1, 500 do 
				local PaiMinSave = DBTable.DBSaveDZ[i] 
				local KeySave = PaiMinSave.Key 
				local WeekNameSave = PaiMinSave.WeekName 
				local WeekNumSave = PaiMinSave.WeekNum 
				local WeekNumType = PaiMinSave.WeekNumType 
				local WeekName = API_VarDataGetString_Ex(1,0,WeekNameSave,1,KeySave) 
				local WeekIDSave = PaiMinSave.WeekID 
				local WeekID = API_VarDataGetNumber_Ex(1,0,WeekIDSave,1,KeySave) 
				if WeekName ~= '' then 
					local LSTab = {} 
					local LSText = WeekName
					for j = 1,table.getn(WeekNumSave) do 
						local WeekNum 
						if WeekNumType[j] == 1 then 
							WeekNum = API_VarDataGetNumber_Ex(1,0,WeekNumSave[j],1,KeySave) 
						else 
							WeekNum = API_VarDataGetString_Ex(1,0,WeekNumSave[j],1,KeySave) 
						end 
						if SelectHuoDong == 7 and j == 2 then 
							WeekNum = -WeekNum 
						end 
						LSTab[j] = WeekNum 
					end 
					local lValue1,lValue2,lValue3,lValue4 = 0,0,0,0 
					if LSTab[1] ~= nil then
						if type(LSTab[1]) == "number" then
							lValue1 = LSTab[1]
						elseif type(LSTab[1]) == "string" then
							LSText = LSText..','..LSTab[1]
						end 
					end
					if LSTab[2] ~= nil then
						if type(LSTab[2]) == "number" then
							lValue2 = LSTab[2]
						elseif type(LSTab[2]) == "string" then
							LSText = LSText..','..LSTab[2]
						end 
					end
					if LSTab[3] ~= nil then
						if type(LSTab[3]) == "number" then
							lValue3 = LSTab[3]
						elseif type(LSTab[3]) == "string" then
							LSText = LSText..','..LSTab[3]
						end 
					end
					if LSTab[4] ~= nil then
						if type(LSTab[4]) == "number" then
							lValue4 = LSTab[4]
						elseif type(LSTab[4]) == "string" then
							LSText = LSText..','..LSTab[4]
						end 
					end
					local NewType = (SelectHuoDong * 2) - 1 
					API_UpdateTempDataStatistic( NewType, WeekName, lValue1,lValue2, lValue3, lValue4, LSText ) 
				end 
			end 
			
			for i = 1, 500 do 
				local PaiMinSave = DBTable.DBSaveDZ[i]
				local KeySave = PaiMinSave.Key
				local ZhongNameSave = PaiMinSave.ZhongName
				local ZhongNumSave = PaiMinSave.ZhongNum
				local ZhongNumType = PaiMinSave.ZhongNumType
				local ZhongName = API_VarDataGetString_Ex(1,0,ZhongNameSave,1,KeySave)
				local ZhongIDSave = PaiMinSave.ZhongID
				local ZhongID = API_VarDataGetNumber_Ex(1,0,ZhongIDSave,1,KeySave)
				if ZhongName ~= '' then 
					local LSTab = {} 
					local LSText = ZhongName
					for j = 1,table.getn(ZhongNumSave) do 
						local ZhongNum 
						if ZhongNumType[j] == 1 then 
							ZhongNum = API_VarDataGetNumber_Ex(1,0,ZhongNumSave[j],1,KeySave) 
						else 
							ZhongNum = API_VarDataGetString_Ex(1,0,ZhongNumSave[j],1,KeySave) 
						end 
						if SelectHuoDong == 7 and j == 2 then 
							ZhongNum = -ZhongNum 
						end 
						LSTab[j] = ZhongNum 
					end 
					local lValue1,lValue2,lValue3,lValue4 = 0,0,0,0 
					if LSTab[1] ~= nil then
						if type(LSTab[1]) == "number" then
							lValue1 = LSTab[1]
						elseif type(LSTab[1]) == "string" then
							LSText = LSText..','..LSTab[1]
						end 
					end
					if LSTab[2] ~= nil then
						if type(LSTab[2]) == "number" then
							lValue2 = LSTab[2]
						elseif type(LSTab[2]) == "string" then
							LSText = LSText..','..LSTab[2]
						end 
					end
					if LSTab[3] ~= nil then
						if type(LSTab[3]) == "number" then
							lValue3 = LSTab[3]
						elseif type(LSTab[3]) == "string" then
							LSText = LSText..','..LSTab[3]
						end 
					end
					if LSTab[4] ~= nil then
						if type(LSTab[4]) == "number" then
							lValue4 = LSTab[4]
						elseif type(LSTab[4]) == "string" then
							LSText = LSText..','..LSTab[4]
						end 
					end
					local NewType = SelectHuoDong * 2 
					API_UpdateTempDataStatistic( NewType, ZhongName, lValue1,lValue2, lValue3, lValue4, LSText ) 
				end 
			end 
		end 
		API_Trace('第'..j..'个排行榜数据转换完毕')
	end  
API_Trace('转换排行榜数据到临时请求列表完成-------------')
end 
