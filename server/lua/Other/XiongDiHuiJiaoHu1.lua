--11844	存储PK触发器ID
--11845	存储玩家下次可传送的时间
--传送服务需要判断在同一个岛的情况
--传送之前判断服务器所在的目标地图是否开启

XiongDiHui_LvUpTable = {
	[1] = {LV=20,GoldMin=10,GoldMax=12000,JingYanJiaCheng=1,BiaoZhunEXP=528,GoldPrice=8.8},
	[2] = {LV=25,GoldMin=10,GoldMax=14600,JingYanJiaCheng=4,BiaoZhunEXP=816,GoldPrice=11.18},
	[3] = {LV=30,GoldMin=10,GoldMax=21400,JingYanJiaCheng=8,BiaoZhunEXP=1824,GoldPrice=17.05},
	[4] = {LV=35,GoldMin=10,GoldMax=21400,JingYanJiaCheng=16,BiaoZhunEXP=2304,GoldPrice=21.53},
	[5] = {LV=40,GoldMin=10,GoldMax=33000,JingYanJiaCheng=24,BiaoZhunEXP=3072,GoldPrice=18.62},
	[6] = {LV=45,GoldMin=10,GoldMax=46000,JingYanJiaCheng=30,BiaoZhunEXP=4008,GoldPrice=17.43},
	[7] = {LV=50,GoldMin=10,GoldMax=46000,JingYanJiaCheng=40,BiaoZhunEXP=4728,GoldPrice=20.56},
	[8] = {LV=55,GoldMin=10,GoldMax=60200,JingYanJiaCheng=58,BiaoZhunEXP=4728,GoldPrice=15.71},
	[9] = {LV=60,GoldMin=10,GoldMax=75800,JingYanJiaCheng=77,BiaoZhunEXP=5683,GoldPrice=14.99},
	[10] = {LV=65,GoldMin=10,GoldMax=75800,JingYanJiaCheng=109,BiaoZhunEXP=6451,GoldPrice=17.02},
	[11] = {LV=70,GoldMin=10,GoldMax=93000,JingYanJiaCheng=140,BiaoZhunEXP=7603,GoldPrice=16.35},
	[12] = {LV=75,GoldMin=10,GoldMax=111800,JingYanJiaCheng=164,BiaoZhunEXP=8889,GoldPrice=15.9},
	[13] = {LV=80,GoldMin=10,GoldMax=111800,JingYanJiaCheng=232,BiaoZhunEXP=9849,GoldPrice=17.62},
	[14] = {LV=85,GoldMin=10,GoldMax=133400,JingYanJiaCheng=270,BiaoZhunEXP=11270,GoldPrice=16.9},
}

function XiongDiHuiJiaoHu_OnLoginMap(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local StaticMapID = API_GetStaticMapID(MapID) --静态地图ID
	if MapID == StaticMapID then --角色在地表
		--创建PK触发器
		local XiongDiHui_PKTriggerID = API_VarDataGetNumber(ActorID,1,11844)
		if XiongDiHui_PKTriggerID ~= 0 then
			API_DestroyTrigger(ActorID,-1,XiongDiHui_PKTriggerID)
		end
		XiongDiHui_PKTriggerID = API_CreatePKTrigger(MapID,MapConfigID,ActorID,0,-1,-1,'XiongDiHui_PKTrigger')
		API_VarDataSetNumber(ActorID,1,11844,XiongDiHui_PKTriggerID)
	end
end

function XiongDiHuiJiaoHu_OnLogoutMap(ActorID)
	local XiongDiHui_PKTriggerID = API_VarDataGetNumber(ActorID,1,11844)
	API_DestroyTrigger(ActorID,-1,XiongDiHui_PKTriggerID)
	API_VarDataSetNumber(ActorID,1,11844,0)
end

function XiongDiHuiJiaoHu_OnLogin(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local StaticMapID = API_GetStaticMapID(MapID) --静态地图ID
	if MapID == StaticMapID then --角色在地表
		--创建PK触发器
		local XiongDiHui_PKTriggerID = API_VarDataGetNumber(ActorID,1,11844)
		if XiongDiHui_PKTriggerID ~= 0 then
			API_DestroyTrigger(ActorID,-1,XiongDiHui_PKTriggerID)
		end
		XiongDiHui_PKTriggerID = API_CreatePKTrigger(MapID,MapConfigID,ActorID,0,-1,-1,'XiongDiHui_PKTrigger')
		API_VarDataSetNumber(ActorID,1,11844,XiongDiHui_PKTriggerID)
	end
end

function XiongDiHuiJiaoHu_OnLogout(ActorID)
	local XiongDiHui_PKTriggerID = API_VarDataGetNumber(ActorID,1,11844)
	API_DestroyTrigger(ActorID,-1,XiongDiHui_PKTriggerID)
	API_VarDataSetNumber(ActorID,1,11844,0)
end

function XiongDiHui_PKTrigger(ActorID,KilledID,MapID,MapConfigID)
	local StaticMapID = API_GetStaticMapID(MapID) --静态地图ID
	local KilledX,KilledY = PublicFun_GetActorPosXY(KilledID)
	local X = API_TileToPixelX(MapID,KilledX,KilledY)
	local Y = API_TileToPixelY(MapID,KilledX,KilledY)
	local XiongDiHuiID = API_GetBrotherhoodID(KilledID)
	local ServerID2 = API_GetActorServerID(KilledID)
	local KillerName = API_GetActorName(ActorID)
	local KillerCampID = API_GetActorCamp(ActorID) --杀手阵营ID
--	local KilledCampID = API_GetActorCamp(KilledID) --被杀者阵营ID
--    local NowTime = os.time()
	if KillerCampID == KilledCampID then --如果杀手和被杀的人是同一阵营
	return
	end
	if MapConfigID == 100 or MapConfigID == 121 or MapConfigID == 130 or MapConfigID == 135 or MapConfigID == 136 or MapConfigID == 137 or MapConfigID == 138 or MapConfigID == 139 or MapConfigID == 140 or MapConfigID == 141 or MapConfigID == 142 or MapConfigID == 143 then --征战平原、红名村和天空都市
		return
	end
	if XiongDiHuiID > 0 then
		local KilledName = API_BrotherhoodGetActorName(KilledID)
		local XiongDiHuiTable = API_BrotherhoodGetAllActor(XiongDiHuiID)
		if XiongDiHuiTable ~= nil then
			for j,v in XiongDiHuiTable do
				if v ~= KilledID then
					local ServerID = API_GetActorServerID(v)
					if ServerID > 0 then
						if ServerID == ServerID2 then
							local ChengYuanLV = API_GetActorExpLevel(v)
							if MapConfigID == 108 then --恶鬼1层
								if ChengYuanLV < 26 then
									return
								end
							elseif MapConfigID == 109 then --恶鬼2层
								if ChengYuanLV < 26 then
									return
								end
							elseif MapConfigID == 102 then --沙暴绿洲
								if ChengYuanLV < 26 then
									return
								end
							elseif MapConfigID == 111 then --光明遗迹
								if ChengYuanLV < 36 then
									return
								end
							elseif MapConfigID == 105 then --镜月城1层
								if ChengYuanLV < 36 then
									return
								end
							elseif MapConfigID == 106 then --镜月城2层
								if ChengYuanLV < 36 then
									return
								end
							elseif MapConfigID == 107 then --镜月城3层
								if ChengYuanLV < 36 then
									return
								end
							end
							--local Time = API_VarDataGetNumber(v,1,11845)
							--if NowTime < Time then
							--	return
							--end
							if MapID == StaticMapID then
								local ChengYuanMapID = API_GetActorMapID(v)
								local ChengYuanStaticMapID = API_GetStaticMapID(ChengYuanMapID)
								local ChengYuanMapConfigID = API_GetMapConfigID(ChengYuanMapID)
								if ChengYuanMapID == ChengYuanStaticMapID then
									if not API_ActorIsDying(v) then
										if not API_ActorFindStatus(v,519) then --摆摊
											if not API_ActorFindStatus(v,726) then --公交车
												if ChengYuanMapConfigID ~= 100 and ChengYuanMapConfigID ~= 121 and ChengYuanMapConfigID ~= 130 then --成员不在征战平原也不在红名村也不在天空都市
													if API_VarDataGetNumber(v,1,101) <= 0 and API_VarDataGetNumber(v,1,102) <= 0 then --快递
														if KillerName ~= nil and KilledName ~= nil then
															API_ResponseWrite('<name></name>')
															API_ResponseWrite('<win ntype="5" close="0" move="1" rect="370,470,269,130"></win>')
															API_ResponseWrite('<text>兄弟</text><text color="255,0,255">'..KilledName..'</text><text>在'..API_GetMapName(MapConfigID)..'的('..X..','..Y..')被玩家</text><text color="255,0,255">'..KillerName..'</text><text>杀死，赶紧去为兄弟报仇吧！</text>')
															API_ResponseWrite('<br><br><text color="255,0,255">传送服务需要消耗5点券</text>')
															API_ResponseWrite('<br><br><a href="XiongDiHui_ChuanSong?1='..v..'&2='..ServerID2..'&3='..MapConfigID..'&4='..KilledX..'&5='..KilledY..'">传送过去</a>')
															API_ResponseWrite('<text>      </text>')
															API_ResponseWrite('<a>关闭</a>')
															API_ResponseFlush(v)
														elseif KillerName == nil and KilledName ~= nil then
															API_ResponseWrite('<name></name>')
															API_ResponseWrite('<win ntype="5" close="0" move="1" rect="370,470,269,130"></win>')
															API_ResponseWrite('<text>兄弟</text><text color="255,0,255">'..KilledName..'</text><text>在'..API_GetMapName(MapConfigID)..'的('..X..','..Y..')被其他玩家杀死，赶紧去为兄弟报仇吧！</text>')
															API_ResponseWrite('<br><br><text color="255,0,255">传送服务需要消耗5点券</text>')
															API_ResponseWrite('<br><br><a href="XiongDiHui_ChuanSong?1='..v..'&2='..ServerID2..'&3='..MapConfigID..'&4='..KilledX..'&5='..KilledY..'">传送过去</a>')
															API_ResponseWrite('<text>      </text>')
															API_ResponseWrite('<a>关闭</a>')
															API_ResponseFlush(v)
														elseif KillerName ~= nil and KilledName == nil then
															API_ResponseWrite('<name></name>')
															API_ResponseWrite('<win ntype="5" close="0" move="1" rect="370,470,269,130"></win>')
															API_ResponseWrite('<text>有兄弟在'..API_GetMapName(MapConfigID)..'的('..X..','..Y..')被玩家</text><text color="255,0,255">'..KillerName..'</text><text>杀死，赶紧去为兄弟报仇吧！</text>')
															API_ResponseWrite('<br><br><text color="255,0,255">传送服务需要消耗5点券</text>')
															API_ResponseWrite('<br><br><a href="XiongDiHui_ChuanSong?1='..v..'&2='..ServerID2..'&3='..MapConfigID..'&4='..KilledX..'&5='..KilledY..'">传送过去</a>')
															API_ResponseWrite('<text>      </text>')
															API_ResponseWrite('<a>关闭</a>')
															API_ResponseFlush(v)
														elseif KillerName == nil and KilledName == nil then
															API_ResponseWrite('<name></name>')
															API_ResponseWrite('<win ntype="5" close="0" move="1" rect="370,470,269,130"></win>')
															API_ResponseWrite('<text>有兄弟在'..API_GetMapName(MapConfigID)..'的('..X..','..Y..')被其他玩家杀死，赶紧去为兄弟报仇吧！</text>')
															API_ResponseWrite('<br><br><text color="255,0,255">传送服务需要消耗5点券</text>')
															API_ResponseWrite('<br><br><a href="XiongDiHui_ChuanSong?1='..v..'&2='..ServerID2..'&3='..MapConfigID..'&4='..KilledX..'&5='..KilledY..'">传送过去</a>')
															API_ResponseWrite('<text>      </text>')
															API_ResponseWrite('<a>关闭</a>')
															API_ResponseFlush(v)
														end
													end
												end
											end
										end
									end
								end
							end
						else
							API_OpenRPC(ServerID,0,0,0,10,{ServerID2,v,ActorID,KilledID,X,Y,MapID,MapConfigID,KilledX,KilledY},'XiongDiHui_OnRpc')
						end
					end
				end
			end
		end
	end
end

function XiongDiHui_OnRpc(ServerID2,v,ActorID,KilledID,X,Y,MapID,MapConfigID,KilledX,KilledY)
	local MapID = API_GetActorMapID(v)
	local StaticMapID = API_GetStaticMapID(MapID) --静态地图ID
	local ChengYuanMapConfigID = API_GetMapConfigID(MapID)
	local ChengYuanLV = API_GetActorExpLevel(v)
	local KilledName = ''
	if KilledID > 0 then
		KilledName = API_BrotherhoodGetActorName(KilledID)
	end
	local KillerName = API_BrotherhoodGetActorName(ActorID)
	--local NowTime = os.time()
	if MapConfigID == 108 then --恶鬼1层
		if ChengYuanLV < 26 then
			return
		end
	elseif MapConfigID == 109 then --恶鬼2层
		if ChengYuanLV < 26 then
			return
		end
	elseif MapConfigID == 102 then --沙暴绿洲
		if ChengYuanLV < 26 then
			return
		end
	elseif MapConfigID == 111 then --光明遗迹
		if ChengYuanLV < 36 then
			return
		end
	elseif MapConfigID == 105 then --镜月城1层
		if ChengYuanLV < 36 then
			return
		end
	elseif MapConfigID == 106 then --镜月城2层
		if ChengYuanLV < 36 then
			return
		end
	elseif MapConfigID == 107 then --镜月城3层
		if ChengYuanLV < 36 then
			return
		end
	end
	--local Time = API_VarDataGetNumber(v,1,11845)
	--if NowTime < Time then
	--	return
	--end
	if MapID == StaticMapID then
		if not API_ActorIsDying(v) then
			if not API_ActorFindStatus(v,519) then --摆摊
				if not API_ActorFindStatus(v,726) then --公交车
					if ChengYuanMapConfigID ~= 100 and ChengYuanMapConfigID ~= 121 and ChengYuanMapConfigID ~= 130 then --成员不在征战平原也不在红名村也不在天空都市
						if API_VarDataGetNumber(v,1,101) <= 0 and API_VarDataGetNumber(v,1,102) <= 0 then --快递
							if KillerName ~= nil and KilledName ~= nil then
								API_ResponseWrite('<name></name>')
								API_ResponseWrite('<win ntype="5" close="0" move="1" rect="370,470,269,130"></win>')
								API_ResponseWrite('<text>兄弟</text><text color="255,0,255">'..KilledName..'</text><text>在'..API_GetMapName(MapConfigID)..'的('..X..','..Y..')被玩家</text><text color="255,0,255">'..KillerName..'</text><text>杀死，赶紧去为兄弟报仇吧！</text>')
								API_ResponseWrite('<br><br><text color="255,0,255">传送服务需要消耗5点券</text>')
								API_ResponseWrite('<br><br><a href="XiongDiHui_ChuanSong?1='..v..'&2='..ServerID2..'&3='..MapConfigID..'&4='..KilledX..'&5='..KilledY..'">传送过去</a>')
								API_ResponseWrite('<text>      </text>')
								API_ResponseWrite('<a>关闭</a>')
								API_ResponseFlush(v)
							elseif KillerName == nil and KilledName ~= nil then
								API_ResponseWrite('<name></name>')
								API_ResponseWrite('<win ntype="5" close="0" move="1" rect="370,470,269,130"></win>')
								API_ResponseWrite('<text>兄弟</text><text color="255,0,255">'..KilledName..'</text><text>在'..API_GetMapName(MapConfigID)..'的('..X..','..Y..')被其他玩家杀死，赶紧去为兄弟报仇吧！</text>')
								API_ResponseWrite('<br><br><text color="255,0,255">传送服务需要消耗5点券</text>')
								API_ResponseWrite('<br><br><a href="XiongDiHui_ChuanSong?1='..v..'&2='..ServerID2..'&3='..MapConfigID..'&4='..KilledX..'&5='..KilledY..'">传送过去</a>')
								API_ResponseWrite('<text>      </text>')
								API_ResponseWrite('<a>关闭</a>')
								API_ResponseFlush(v)
							elseif KillerName ~= nil and KilledName == nil then
								API_ResponseWrite('<name></name>')
								API_ResponseWrite('<win ntype="5" close="0" move="1" rect="370,470,269,130"></win>')
								API_ResponseWrite('<text>有兄弟在'..API_GetMapName(MapConfigID)..'的('..X..','..Y..')被玩家</text><text color="255,0,255">'..KillerName..'</text><text>杀死，赶紧去为兄弟报仇吧！</text>')
								API_ResponseWrite('<br><br><text color="255,0,255">传送服务需要消耗5点券</text>')
								API_ResponseWrite('<br><br><a href="XiongDiHui_ChuanSong?1='..v..'&2='..ServerID2..'&3='..MapConfigID..'&4='..KilledX..'&5='..KilledY..'">传送过去</a>')
								API_ResponseWrite('<text>      </text>')
								API_ResponseWrite('<a>关闭</a>')
								API_ResponseFlush(v)
							elseif KillerName == nil and KilledName == nil then
								API_ResponseWrite('<name></name>')
								API_ResponseWrite('<win ntype="5" close="0" move="1" rect="370,470,269,130"></win>')
								API_ResponseWrite('<text>有兄弟在'..API_GetMapName(MapConfigID)..'的('..X..','..Y..')被其他玩家杀死，赶紧去为兄弟报仇吧！</text>')
								API_ResponseWrite('<br><br><text color="255,0,255">传送服务需要消耗5点券</text>')
								API_ResponseWrite('<br><br><a href="XiongDiHui_ChuanSong?1='..v..'&2='..ServerID2..'&3='..MapConfigID..'&4='..KilledX..'&5='..KilledY..'">传送过去</a>')
								API_ResponseWrite('<text>      </text>')
								API_ResponseWrite('<a>关闭</a>')
								API_ResponseFlush(v)
							end
						end
					end
				end
			end
		end
	end
end

function XiongDiHui_ChuanSong()--这个函数要注册点击
	local v = API_RequestGetNumber(1)
	local ServerID2 = API_RequestGetNumber(2)
	local MapID = API_RequestGetNumber(3)
	local KilledX = API_RequestGetNumber(4)
	local KilledY = API_RequestGetNumber(5)
	--local NowTime = os.time()
	--local NextTime = NowTime + 60
	if API_MapIsOpen(ServerID2,MapID) then
		if not API_ActorIsDying(v) then
			if API_ActorGetPropNum(v,183) >= 5 then
				if API_UsePoint(v,3,1765,0,5) == 0 then
					API_ActorSendMsg(v,3,'传送扣除5点券')
					API_ActorGoToMapEx(v,ServerID2,MapID,KilledX,KilledY)
					--API_VarDataSetNumber(v,1,11845,NextTime)
					--风向标
					if GLOBAL_FengXiangBiao_DateList[43][1] ~= nil then
						local LaiYuan = API_ActorGetPropNum(v,201)
						if GLOBAL_FengXiangBiao_DateList[43][1][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[43][1][LaiYuan] = 5
						else
							GLOBAL_FengXiangBiao_DateList[43][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[43][1][LaiYuan] + 5
						end
					end
				else
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<win ntype="5" close="0" move="1" rect="370,470,200,100"></win>')
					API_ResponseWrite('<text color="255,0,255">传送失败，请稍候再试</text>')
					API_ResponseWrite('<br><br><a href="XiongDiHui_ChuanSong?1='..v..'&2='..ServerID2..'&3='..MapID..'&4='..KilledX..'&5='..KilledY..'">传送过去</a>')
					API_ResponseWrite('<text>      </text>')
					API_ResponseWrite('<a>关闭</a>')
					API_ResponseFlush(v)
				end
			else
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win ntype="5" close="0" move="1" rect="370,470,250,120"></win>')
				API_ResponseWrite('<text color="255,0,255">点券不足，传送服务需要消耗5点券</text><br><br>')
				API_ResponseWrite('<text color="0,255,255">请按“P”键在商城进行充值和领点券</text>')
				API_ResponseWrite('<br><br><a href="XiongDiHui_ChuanSong?1='..v..'&2='..ServerID2..'&3='..MapID..'&4='..KilledX..'&5='..KilledY..'">传送过去</a>')
				API_ResponseWrite('<text>      </text>')
				API_ResponseWrite('<a>关闭</a>')
				API_ResponseFlush(v)
			end
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win ntype="5" close="0" move="1" rect="370,470,200,100"></win>')
			API_ResponseWrite('<text color="255,0,255">你已死亡，无法传送</text><br><br>')
			API_ResponseWrite('<a>关闭</a>')
			API_ResponseFlush(v)
		end
	else
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win ntype="5" close="0" move="1" rect="370,470,200,100"></win>')
		API_ResponseWrite('<text color="255,0,255">目的地服务器尚未开启，请稍候再试</text>')
		API_ResponseWrite('<br><br><a href="XiongDiHui_ChuanSong?1='..v..'&2='..ServerID2..'&3='..MapID..'&4='..KilledX..'&5='..KilledY..'">传送过去</a>')
		API_ResponseWrite('<text>      </text>')
		API_ResponseWrite('<a>关闭</a>')
		API_ResponseFlush(v)
	end
end

function XiongDiHui_OnUpgrade(ActorID)
	local XiongDiHuiID = API_GetBrotherhoodID(ActorID)
	local LV = API_GetActorExpLevel(ActorID)
	local ServerID2 = API_GetActorServerID(ActorID)
	if XiongDiHuiID <= 0 then
		return
	end
	local LvUpName = API_BrotherhoodGetActorName(ActorID)
	if XiongDiHui_LvUpTable ~= nil then
		for i in XiongDiHui_LvUpTable do
			local Level = XiongDiHui_LvUpTable[i].LV
			if LV == Level then
				local XiongDiHuiTable = API_BrotherhoodGetAllActor(XiongDiHuiID)
				if XiongDiHuiTable ~= nil then
					for j,v in XiongDiHuiTable do
						if v ~= ActorID then
							local ServerID = API_GetActorServerID(v)
							if ServerID > 0 then
								if ServerID == ServerID2 then
									if not API_ActorIsDying(v) then
										API_ResponseWrite('<name></name>')
										API_ResponseWrite('<win ntype="5" close="0" move="1" rect="300,400,300,150"></win>')
										API_ResponseWrite('<text>兄弟</text><text color="255,0,255">'..LvUpName..'</text><text>升级到</text><text color="255,0,255">'..LV..'级</text><text>，你可以赠送金币来表示祝贺，系统会根据赠送的金币数量邮寄经验兑换券到你邮箱。</text><br>')
										API_ResponseWrite('<br><text>请在下面窗口中输入</text><text color="255,0,0">你要赠送的金币数量</text><text>。</text><br><br>')
										API_ResponseWrite('<input type="number" name="11" size="6" width="50">')
										API_ResponseWrite('<a href="XiongDiHui_SendGold?2='..v..'&3='..ActorID..'&4='..LV..'&5='..XiongDiHuiID..'">  输入完成，赠送</a>')
										API_ResponseWrite('<text>            </text>')
										API_ResponseWrite('<a>关闭</a>')
										API_ResponseFlush(v)
									end
								else
									API_OpenRPC(ServerID,0,0,0,5,{ServerID2,v,ActorID,LV,XiongDiHuiID},'XiongDiHui_SendGold_OnRpc')
								end
							end
						end
					end
				end
				break
			end
		end
	end			
end

function XiongDiHui_SendGold_OnRpc(ServerID2,v,ActorID,LV,XiongDiHuiID)
	local LvUpName = API_BrotherhoodGetActorName(ActorID)
	if not API_ActorIsDying(v) then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win ntype="5" close="0" move="1" rect="300,400,300,150"></win>')
		API_ResponseWrite('<text>兄弟</text><text color="255,0,255">'..LvUpName..'</text><text>升级到</text><text color="255,0,255">'..LV..'级</text><text>，你可以赠送金币来表示祝贺，系统会根据赠送的金币数量邮寄经验兑换券到你邮箱。</text><br>')
		API_ResponseWrite('<br><text>请在下面窗口中输入</text><text color="255,0,0">你要赠送的金币数量</text><text>。</text><br><br>')
		API_ResponseWrite('<input type="number" name="11" size="6" width="50">')
		API_ResponseWrite('<a href="XiongDiHui_SendGold?2='..v..'&3='..ActorID..'&4='..LV..'&5='..XiongDiHuiID..'">  输入完成，赠送</a>')
		API_ResponseWrite('<text>            </text>')
		API_ResponseWrite('<a>关闭</a>')
		API_ResponseFlush(v)
	end
end

function XiongDiHui_SendGold() --这个函数要注册点击
	local InPutNum = API_RequestGetNumber(11)
	local v = API_RequestGetNumber(2)
	local ActorID = API_RequestGetNumber(3)
	local JinBiNum = API_ActorGetPropNum(v,156)
	local LvUpName = API_BrotherhoodGetActorName(ActorID)
	local ChengYuanName = API_BrotherhoodGetActorName(v)
	local LV = API_RequestGetNumber(4)
	local SJWJXDHID = API_RequestGetNumber(5)
	local GoldMin = 0
	local GoldMax = 0
	local JingYanJiaCheng = 0
	local BiaoZhunEXP = 0
	local GoldPrice = 0
	local XiongDiHuiID = API_GetBrotherhoodID(v)
	if XiongDiHuiID <= 0 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win ntype="5" close="0" move="1" rect="300,400,200,100"></win>')
		API_ResponseWrite('<text>你已退出兄弟会，不能再赠送金币</text><br><br>')
		API_ResponseWrite('<a>关闭</a>')
		API_ResponseFlush(v)
		return
	end
	if XiongDiHuiID ~= SJWJXDHID then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win ntype="5" close="0" move="1" rect="300,400,200,100"></win>')
		API_ResponseWrite('<text>你和升级玩家不在同一个兄弟会，不能赠送金币</text><br><br>')
		API_ResponseWrite('<a>关闭</a>')
		API_ResponseFlush(v)
		return
	end
	if LvUpName == nil then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win ntype="5" close="0" move="1" rect="300,400,200,100"></win>')
		API_ResponseWrite('<text>升级玩家已经退出兄弟会，不能赠送金币</text><br><br>')
		API_ResponseWrite('<a>关闭</a>')
		API_ResponseFlush(v)
		return
	end
	if XiongDiHui_LvUpTable ~= nil then
		for i in XiongDiHui_LvUpTable do
			local Level = XiongDiHui_LvUpTable[i].LV
			local GoldMin1 = XiongDiHui_LvUpTable[i].GoldMin
			local GoldMax1 = XiongDiHui_LvUpTable[i].GoldMax
			local JingYanJiaCheng1 = XiongDiHui_LvUpTable[i].JingYanJiaCheng
			local BiaoZhunEXP1 = XiongDiHui_LvUpTable[i].BiaoZhunEXP
			local GoldPrice1 = XiongDiHui_LvUpTable[i].GoldPrice
			if LV == Level then
				GoldMin = GoldMin1
				GoldMax = GoldMax1
				JingYanJiaCheng = JingYanJiaCheng1
				BiaoZhunEXP = BiaoZhunEXP1
				GoldPrice = GoldPrice1
				break
			end
		end
	end
	if InPutNum < GoldMin or InPutNum > GoldMax then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win ntype="5" close="0" move="1" rect="300,400,300,110"></win>')
		API_ResponseWrite('<text>赠送的金币数量不能小于'..GoldMin..'，也不能大于'..GoldMax..'，请重新输入。</text><br><br>')
		API_ResponseWrite('<input type="number" name="11" size="6" width="50">')
		API_ResponseWrite('<a href="XiongDiHui_SendGold?2='..v..'&3='..ActorID..'&4='..LV..'&5='..XiongDiHuiID..'">  输入完成，赠送</a>')
		API_ResponseWrite('<text>            </text>')
		API_ResponseWrite('<a>关闭</a>')
		API_ResponseFlush(v)
	else
		if JinBiNum >= InPutNum then
			if API_ActorAddMoney(v,-InPutNum,0,'赠送金币扣除玩家身上金币') then
				local GetGold = InPutNum - math.floor(InPutNum * 0.1)
				local XiTongSF = math.floor(InPutNum * 0.1)
				local ReturnEXP = (math.floor(InPutNum * 0.1)) * GoldPrice + JingYanJiaCheng * BiaoZhunEXP
				local ReturnEXPQuan = math.floor(ReturnEXP/100)
				if API_SendActorMoneyMail_UnLine(LvUpName,GetGold,'升级获得兄弟赠送金币','你升级到'..LV..'级，兄弟'..ChengYuanName..'赠送你'..GetGold..'金币表示祝贺') then
					API_SendActorMailEx(v,80498,ReturnEXPQuan,0,'赠送兄弟金币奖励','兄弟'..LvUpName..'升级到'..LV..'级，你赠送了'..GetGold..'金币，系统收取'..XiTongSF..'金币费用，你获得了'..ReturnEXPQuan..'个经验兑换券。')
					API_ActorSendMsg(v,3,'赠送兄弟'..LvUpName..''..GetGold..'金币获得'..ReturnEXPQuan..'个经验兑换券')
				end
			end
		else				
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win ntype="5" close="0" move="1" rect="300,400,300,100"></win>')
			API_ResponseWrite('<text>你身上没有'..InPutNum..'金币，请重新输入。</text><br><br>')
			API_ResponseWrite('<input type="number" name="11" size="6" width="50">')
			API_ResponseWrite('<a href="XiongDiHui_SendGold?2='..v..'&3='..ActorID..'&4='..LV..'&5='..XiongDiHuiID..'">  输入完成，赠送</a>')
			API_ResponseWrite('<text>            </text>')
			API_ResponseWrite('<a>关闭</a>')
			API_ResponseFlush(v)
		end
	end
end
