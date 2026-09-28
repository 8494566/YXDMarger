
TML_Jinkela = 83113	

XinNian_Goods_Table2 = {
	[1] = {
                          {GoodsID=728,Point=0,Jinkela=120},
                          {GoodsID=729,Point=0,Jinkela=150},
                           {GoodsID=39744,Point=0,Jinkela=200},
                          {GoodsID=89147,Point=0,Jinkela=10},
                         {GoodsID=89142,Point=0,Jinkela=10},
                          {GoodsID=89137,Point=0,Jinkela=10},
                          {GoodsID=88934,Point=0,Jinkela=10},
                         {GoodsID=88933,Point=0,Jinkela=10},
                          {GoodsID=89185,Point=0,Jinkela=10},
                          {GoodsID=89236,Point=0,Jinkela=10},
                          {GoodsID=88932,Point=0,Jinkela=10},
                          {GoodsID=88126,Point=0,Jinkela=10},
                          {GoodsID=89180,Point=0,Jinkela=10},
                         {GoodsID=88129,Point=0,Jinkela=10},
                          {GoodsID=88605,Point=0,Jinkela=10},
                          {GoodsID=88127,Point=0,Jinkela=10},
                         {GoodsID=88603,Point=0,Jinkela=10},
                          {GoodsID=88125,Point=0,Jinkela=10},
                          {GoodsID=88604,Point=0,Jinkela=10},
                          {GoodsID=88130,Point=0,Jinkela=10},
                          {GoodsID=88128,Point=0,Jinkela=10},		
				},
}

function JinkelaDuiHuan_Title()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local PlayLV = API_GetActorExpLevel(ActorID)
	local Camp = API_GetActorCamp(ActorID)
if XuanZe == 1 then
	local ActorID = API_RequestGetActorID()
	local ActorName = API_GetActorName(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if XinNian_Goods_Table2[SelectItem] == nil then
		return
	end
	if type(XinNian_Goods_Table2[SelectItem]) ~= 'table' then
		return
	end
	local GoodsNum = table.getn(XinNian_Goods_Table2[SelectItem])
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if XinNian_Goods_Table2[SelectItem][BuyNo] ~= nil then
			local BuyGoodsID = XinNian_Goods_Table2[SelectItem][BuyNo].GoodsID
			local BuyPoint = XinNian_Goods_Table2[SelectItem][BuyNo].Point
			local BuyJinkela = XinNian_Goods_Table2[SelectItem][BuyNo].Jinkela
			local BuyNum = API_RequestGetNumber(num)
			if BuyNum < 1 then
				BuyNum = 1
			end
			BuyPoint = BuyPoint * BuyNum
			BuyJinkela = BuyJinkela * BuyNum
			if BuyPoint < 0 or BuyPoint > 100000000 then
				return
			end
			if BuyJinkela < 0 or BuyJinkela > 100000000 then
				return
			end
			--if Year == 2020 and Month == 2 and Day >= 4 and Day <= 20 then
			local nShiFouStart = API_DiffDatatime(SpringFestival_StartTime.Year,SpringFestival_StartTime.Month,SpringFestival_StartTime.Day,SpringFestival_StartTime.Hour,SpringFestival_StartTime.Minute,SpringFestival_StartTime.Second)
			local nShiFouEnd = API_DiffDatatime(SpringFestival_EndTime.Year,SpringFestival_EndTime.Month,SpringFestival_EndTime.Day,SpringFestival_EndTime.Hour,SpringFestival_EndTime.Minute,SpringFestival_EndTime.Second)
			if nShiFouStart < 2010 and nShiFouEnd > 2 then
				if BuyPoint > 4 and BuyJinkela > 2 then
					if API_ActorGetGoodsNum(ActorID,TML_Jinkela) >= BuyJinkela then
						if API_ActorGetGoodsNum(ActorID,TML_YYSR_YYDJQID) >= BuyPoint then
							if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
								if API_ActorRemoveGoods(ActorID,TML_YYSR_YYDJQID,BuyPoint,"删除对应价格数量的云游代金券") then
									if API_ActorRemoveGoods(ActorID,TML_Jinkela,BuyJinkela,"删除对应价格数量的金克拉") then
										API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'兑换道具兑换')
										API_ResponseWrite('<name>兑换道具</name>')
										API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
										API_ResponseWrite('<text>您消耗</text><text color="255,0,255">'..BuyPoint..'张</text><text>云游代金券，</text><text color="255,0,255">'..BuyJinkela..'个</text><text>“金克拉”兑换了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
										API_ResponseWrite('<br><br><a>确定</a>')
										API_ResponseWrite('<text>     </text>')
										API_ResponseWrite('<a href="JinkelaDuiHuan_Title?1=1">返回</a>')
										if BuyGoodsID == 32101 and not API_IsBattleGameServer() then
											API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,''..ActorName..'在兑换道具处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
											API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,''..ActorName..'在兑换道具处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
										end
										--风向标
										if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID] ~= nil then
											local LaiYuan = API_ActorGetPropNum(ActorID,201)
											if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] == nil then
												GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = BuyNum
											else
												GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] + BuyNum
											end
										end
									end
								end
							else
								API_ResponseWrite('<name>兑换道具</name>')
								API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
								API_ResponseWrite('<br><br><a>确定</a>')
							end
						else
							API_ResponseWrite('<name>兑换道具</name>')
							API_ResponseWrite('<text>您的云游代金券数量不够，无法兑换</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name>兑换道具</name>')
						API_ResponseWrite('<text>您的“金克拉”数量不够，无法兑换</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				elseif BuyPoint > 0 and BuyJinkela == 0 then
					if API_ActorGetGoodsNum(ActorID,TML_YYSR_YYDJQID) >= BuyPoint then
						if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
							if API_ActorRemoveGoods(ActorID,TML_YYSR_YYDJQID,BuyPoint,"删除对应价格数量的云游代金券") then
								API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'兑换道具兑换')
								API_ResponseWrite('<name>兑换道具</name>')
								API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
								API_ResponseWrite('<text>您消耗</text><text color="255,0,255">'..BuyPoint..'张</text><text>云游代金券，兑换了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
								API_ResponseWrite('<br><br><a>确定</a>')
								API_ResponseWrite('<text>     </text>')
								API_ResponseWrite('<a href="JinkelaDuiHuan_Title?1=1">返回</a>')
								if BuyGoodsID == 32101 and not API_IsBattleGameServer() then
									API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,''..ActorName..'在兑换道具处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
									API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,''..ActorName..'在兑换道具处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
								end
								--风向标
								if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = BuyNum
									else
										GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] + BuyNum
									end
								end
							end
						else
							API_ResponseWrite('<name>兑换道具</name>')
							API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name>兑换道具</name>')
						API_ResponseWrite('<text>您的云游代金券数量不够，无法兑换</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				elseif BuyPoint == 0 and BuyJinkela > 0 then
					if API_ActorGetGoodsNum(ActorID,TML_Jinkela) >= BuyJinkela then
						if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
							if API_ActorRemoveGoods(ActorID,TML_Jinkela,BuyJinkela,"删除对应价格数量的金克拉") then
								API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'兑换道具兑换')
								API_ResponseWrite('<name>兑换道具</name>')
								API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
								API_ResponseWrite('<text>您消耗</text><text color="255,0,255">'..BuyJinkela..'个</text><text>“金克拉”兑换了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
								API_ResponseWrite('<br><br><a>确定</a>')
								API_ResponseWrite('<text>     </text>')
								API_ResponseWrite('<a href="JinkelaDuiHuan_Title?1=1">返回</a>')
								if BuyGoodsID == 32101 and not API_IsBattleGameServer() then
									API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 17,''..ActorName..'在兑换道具处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
									API_ActorBroadcastMsgLevRang(-1, -1, 12,85, 0, 8,''..ActorName..'在兑换道具处成功兑换到了'..API_GetGoodsName(BuyGoodsID)..'')
								end
								--风向标
								if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID] ~= nil then
									local LaiYuan = API_ActorGetPropNum(ActorID,201)
									if GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] == nil then
										GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = BuyNum
									else
										GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[8][BuyGoodsID][LaiYuan] + BuyNum
									end
								end
							end
						else
							API_ResponseWrite('<name>兑换道具</name>')
							API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name>兑换道具</name>')
						API_ResponseWrite('<text>您的“金克拉”数量不够，无法兑换</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				end
			else
				API_ResponseWrite('<name>兑换道具</name>')
				API_ResponseWrite('<text>兑换活动已结束</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
			end
		end
		return
	end
	if SelectItem == 1 then
		API_ResponseWrite('<name>兑换道具</name>')
		API_ResponseWrite('<win rect="30,75,470,510"></win>')
		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br>')
		API_ResponseWrite('<text color="255,0,255">活动时间：永久开放 </text><br><br>')
		for i = 1,GoodsNum do
			if i > Page * 6 and i < (Page + 1) * 6 + 1 then
				local BuyGoodsID = XinNian_Goods_Table2[SelectItem][i].GoodsID
				local BuyPoint = XinNian_Goods_Table2[SelectItem][i].Point
				local BuyJinkela = XinNian_Goods_Table2[SelectItem][i].Jinkela
				API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
				API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
				local BuyNumTip = ''
				local BuyPointTip = '<text>  单价：'..string.format("%-6s",BuyPoint..'张')..'</text>'
				BuyPointTip = BuyPointTip..'<text color="254,249,220">云游代金券 + </text>'
				BuyPointTip = BuyPointTip..'<text>'..string.format("%-5s",BuyJinkela..'个')..'</text>'
				BuyPointTip = BuyPointTip..'<text color="254,249,220">金克拉       </text>'
				local BuyNumTipLen = string.len(BuyPointTip)
				if BuyNumTipLen < 44 then
					for j = 1,44 - BuyNumTipLen do
						BuyPointTip = BuyPointTip..' '
					end
				end
				API_ResponseWrite(''..BuyPointTip..'')
				local num = i * 100
				API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
				API_ResponseWrite('<text> </text>')
				API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" href="JinkelaDuiHuan_Title?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
				API_ResponseWrite('<text>——————————————————————————————————</text><br>')
			end
		end
		if GoodsNum < (Page + 1) * 6 then
			for i = 1,(Page + 1) * 6 - GoodsNum do
				API_ResponseWrite('<br><br><br><br>')
			end
		end
		if GoodsNum > 6 then
			local BackPage = Page - 1
			local NextPage = Page + 1
			if Page == 0 then
				API_ResponseWrite('<br><img src="LuaUse\\button_back_g.bmp"><text>       </text>')
				--API_ResponseWrite('<a href="XinNian_DuiHua">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="JinkelaDuiHuan_Title?1='..SelectItem..'&2='..NextPage..'">')
			elseif (Page + 1) * 6 < GoodsNum then
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="JinkelaDuiHuan_Title?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				--API_ResponseWrite('<a href="XinNian_DuiHua">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="JinkelaDuiHuan_Title?1='..SelectItem..'&2='..NextPage..'">')
			else
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="JinkelaDuiHuan_Title?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				--API_ResponseWrite('<a href="XinNian_DuiHua">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_g.bmp">')
			end
		else
			--API_ResponseWrite('<br><a href="XinNian_DuiHua">  返回</a>')
		end
	end
	elseif XuanZe == 4 then
		local x,y
		if Camp == 0 then
			x,y = 59,149
		elseif Camp == 1 then
			x,y = 55,188
		end
		API_ResponseWrite('<name>金克拉收集活动</name>')
		API_ResponseWrite('<win rect="80,390,830,255"></win>')
		API_ResponseWrite('<br><text color="117,252,255">  每天通过击杀领主BOSS可以获得金克拉。</text><br>')

		API_ResponseWrite('<br><text>                                                                                                                                    在那乱世风尘中,她翩然而舞,衣袖飘袂间,雪女,你可还记得,是谁在人海茫茫中为你苦苦寻觅?                                                                                                                                                        </text>')
		API_ResponseWrite('<br><text>  记忆划过脚尖,她还依稀记得他的模样,那个为她绽放了一生的温暖的人,是他陪伴她走过所有,却似风一样悄然而逝,犹如她生命过客般走失在记忆   的巷口.                                                                                                                  </text>')
		API_ResponseWrite('<br><text>  曾经的过往,她从最初那个笑傲王侯,不食人间烟火的舞姬,到甘愿为了他而浪迹天涯,生死相随的雪女,是因为她相信,无论发生什么,身边只要有他,                                                                                                                                    所有的事情她都有勇气坦然面对,只是这一切,来得太晚,太突然……                                                                        </text>')
		
		API_ResponseWrite('<br><a>                                                                                                                                    确定</a><br>')
	end
end	

function JinkelaDuiHuan(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local PlayJF = API_ActorGetGoodsNum(ActorID,TML_Jinkela)
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Week == 6 or Week == 7 or Week == 1 or Week == 2 or Week == 3 or Week == 4 or Week == 5 then
		API_ResponseWrite('<name>水晶商人</name>')
		API_ResponseWrite('<br><text size="14">  我是水晶商人，如果您有金克拉的话可以在我这里兑换丰厚的礼品。</text><br>')
		API_ResponseWrite('<br><text size="14">  每兑换一次礼物将消耗 </text><text size="14" color="117,252,255">'..API_GetGoodsName(TML_Jinkela)..'</text><img srcgd="'..TML_Jinkela..'" tipgd="'..TML_Jinkela..'"><br><br>') --<text size="14">兑换圣诞帽需消耗</text><text size="14" color="117,252,255"> 200点 </text><text size="14"> 雪人积分。</text><br><br>')
		API_ResponseWrite('<br><text size="14">  您目前的金克拉数量：</text><text size="14" color="255,0,255">'..PlayJF..' </text><text size="14">个。</text><br><br>')
		API_ResponseWrite('<br><a href="JinkelaDuiHuan_Title?1=1">  我要兑换</a><text>          </text>')
		--API_ResponseWrite('<a href="JinkelaDuiHuan_Title?1=3">  兑换圣诞帽</a><text>          </text>')
		API_ResponseWrite('<a href="JinkelaDuiHuan_Title?1=4">  活动介绍</a><text>          </text>')
		API_ResponseWrite('<a>  关闭</a><br>')
		API_ResponseFlush(ActorID)

	end
end
