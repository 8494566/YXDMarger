--GM黑屋系统
--GM专用创建副本 最多创建10个
--2008年12月8日 林瑞宇制作
LRY_quanju={}
LRY_quanju_jzid = {}
LRY_quanju_jzid["GM卷轴"] = 40001
GMuseBLACKhouse_heiwutable = {}
function GMuseBLACKhouse_OnLogin()
	local ActorID = API_RequestGetActorID()
	if ActorID <= 200 then
		API_AddTaskScroll(ActorID,LRY_quanju_jzid["GM卷轴"],10555,'GMuseBLACKhouse')
	end
end
function GMuseBLACKhouse_OnLogout()
	local ActorID = API_RequestGetActorID()	
		if ActorID <= 200 then
			API_RemoveTaskScroll(ActorID,LRY_quanju_jzid["GM卷轴"])
		end
end
function GMuseBLACKhouse()
	local ActorID = API_RequestGetActorID()
	if ActorID <= 200 then
		local SelectItem = API_RequestGetNumber(1)
		local biaochang = table.getn(GMuseBLACKhouse_heiwutable)
		local roomnum = 0
		if biaochang > 0 then
			for i = 1,table.getn(GMuseBLACKhouse_heiwutable) do
				if API_MapIsValid(GMuseBLACKhouse_heiwutable[i]) then
					roomnum = roomnum + 1
				else
					GMuseBLACKhouse_heiwutable[i] = 0
				end
			end
		end
		if SelectItem == LRY_quanju_jzid["GM卷轴"] then
			API_ResponseWrite('<text>黑屋创建术使用说明：点击后创建1个黑屋副本，使用者会被传进去。持续5分钟黑屋没人会自动关闭。黑屋一个高级魔法结界，所以不存在门这种东西，只能入不能出。想出去必须使用GM权限，或者等待黑屋魔法散去。如果使用中遇见问题请咨询魔法创造者LIN</text><br>')
			API_ResponseWrite('<a href="GMuseBLACKhouse?1=98">黑暗法术：黑屋创建术</a><br><br>')
			API_ResponseWrite('<a href="GMuseBLACKhouse?1=99">进入已创建的黑屋</a><br><br>')
		elseif SelectItem == 98 then
			
			if roomnum < 10 then
				local MapID = API_CreateEctype(1974,0)
				if biaochang == 0 then
					local biaochang2 = biaochang + 1
						GMuseBLACKhouse_heiwutable[biaochang2] = MapID
				API_ActorGoToMap(ActorID,MapID,64,41)
				return
				end
				for i = 1,table.getn(GMuseBLACKhouse_heiwutable) do
					if GMuseBLACKhouse_heiwutable[i] == 0 then
						GMuseBLACKhouse_heiwutable[i] = MapID
						break
					elseif i == table.getn(GMuseBLACKhouse_heiwutable) then
						local biaochang2 = biaochang + 1
						GMuseBLACKhouse_heiwutable[biaochang2] = MapID
					end
				end
				API_ActorGoToMap(ActorID,MapID,64,41)
			elseif roomnum >= 10 then
				API_ResponseWrite('<text>按照主神的十界规则，禁止同时存在10个以上的黑屋。</text><br>')
				API_ResponseWrite('<a>关闭</a><br><br>')
			end
		elseif SelectItem == 99 then
			if roomnum > 0 then
				for i = 1,table.getn(GMuseBLACKhouse_heiwutable) do
					if GMuseBLACKhouse_heiwutable[i] > 0 then
						API_ResponseWrite('<a href="GMuseBLACKhouse?1='..i..'">进入已创建的黑屋'..i..'号</a><br><br>')
					end
				end
			else
				API_ResponseWrite('<text>现在没有创建好的黑屋。</text><br>')
				API_ResponseWrite('<a>关闭</a><br><br>')
			end
		else
			if API_MapIsValid(GMuseBLACKhouse_heiwutable[SelectItem]) then
				API_ActorGoToMap(ActorID,GMuseBLACKhouse_heiwutable[SelectItem],64,41)
			else
				API_ResponseWrite('<text>由于魔法失效，您要进入的黑屋已经不存在了，请重新施展法术。</text><br>')
				API_ResponseWrite('<a>关闭</a><br><br>')
			end 
		end
	end
end