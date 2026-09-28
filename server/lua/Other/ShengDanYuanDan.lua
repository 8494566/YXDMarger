--圣诞元旦活动
--19038  存储玩家冰寒积分的交互数据
--圣诞活动兑换官积分兑换道具时间：1月5日-1月10日
--卷轴ID：60003
API_VarDataLoad_Ex(1,0, -6011)

if ZheKouShangRen_Goods_Table == nil then
	ZheKouShangRen_Goods_Table = {
		[1] = {
				[1] = {
						{GoodsID=88994,Point=40000,JiFen=0},	--
						{GoodsID=88999,Point=1000,JiFen=0},		--
						{GoodsID=88998,Point=500,JiFen=0},		--
						{GoodsID=89000,Point=10000,JiFen=0},	--
					},
				[63] = {
						{GoodsID=88994,Point=20000,JiFen=0},	--
						{GoodsID=88999,Point=500,JiFen=0},		--
						{GoodsID=88998,Point=250,JiFen=0},		--
						{GoodsID=89000,Point=5000,JiFen=0},		--
					},
				[64] = {
						{GoodsID=88994,Point=11000,JiFen=0},	--
						{GoodsID=88999,Point=280,JiFen=0},		--
						{GoodsID=88998,Point=140,JiFen=0},		--
						{GoodsID=89000,Point=2800,JiFen=0},		--
					},
				[65] = {
						{GoodsID=88994,Point=6000,JiFen=0},		--
						{GoodsID=88999,Point=160,JiFen=0},		--
						{GoodsID=88998,Point=80,JiFen=0},		--
						{GoodsID=89000,Point=1600,JiFen=0},		--
					},
				[66] = {
						{GoodsID=88994,Point=6000,JiFen=0},		--
						{GoodsID=88999,Point=150,JiFen=0},		--
						{GoodsID=88998,Point=75,JiFen=0},		--
						{GoodsID=89000,Point=1500,JiFen=0},		--
					},
				[67] = {
						{GoodsID=88994,Point=4000,JiFen=0},		--
						{GoodsID=88999,Point=80,JiFen=0},		--
						{GoodsID=88998,Point=40,JiFen=0},		--
						{GoodsID=89000,Point=800,JiFen=0},		--
					},
				[68] = {
						{GoodsID=88994,Point=2400,JiFen=0},		--
						{GoodsID=88999,Point=60,JiFen=0},		--
						{GoodsID=88998,Point=30,JiFen=0},		--
						{GoodsID=89000,Point=600,JiFen=0},		--
					},
				},
		[2] = {
				{GoodsID=80879,Point=0,JiFen=60},	--怪兽蛋
				{GoodsID=80884,Point=0,JiFen=30},	--宠物技能书原料A
				{GoodsID=80885,Point=0,JiFen=30},	--宠物技能书原料B
				{GoodsID=80880,Point=0,JiFen=30},	--宝石原料
				{GoodsID=80882,Point=0,JiFen=30},	--载具卡原料A
				{GoodsID=80883,Point=0,JiFen=30},	--载具卡原料B
				{GoodsID=80886,Point=0,JiFen=30},	--家具原料
				},
		[5] = {
				{GoodsID=89030,Point=33 ,JiFen=830 },	--圣诞缤纷礼包
				{GoodsID=38345,Point=144 ,JiFen=1439 },	--圣诞－主题装饰(2级家具)
				{GoodsID=38346,Point=144 ,JiFen=1439 },	--圣诞－坐垫(2级家具)
				{GoodsID=38347,Point=144 ,JiFen=1439 },	--圣诞－宝箱(2级家具)
				{GoodsID=38348,Point=144 ,JiFen=1439 },	--圣诞－杂物箱(2级家具)
				{GoodsID=38349,Point=144 ,JiFen=1439 },	--圣诞－阳台东南(2级家具)
				{GoodsID=38350,Point=144 ,JiFen=1439 },	--圣诞－阳台西南(2级家具)
				{GoodsID=38351,Point=144 ,JiFen=1439 },	--圣诞－壁橱(2级家具)
				{GoodsID=75,Point=97 ,JiFen=973 },		--时装续时油
				{GoodsID=32001,Point=97 ,JiFen=973 },		--载具攻击续时油
				{GoodsID=88044,Point=69 ,JiFen=687 },		--拾取徽章
				{GoodsID=80274,Point=55 ,JiFen=548 },		--重生十字章
				{GoodsID=80397,Point=41 ,JiFen=411 },		--聊天石
				{GoodsID=31039,Point=4772 ,JiFen=47718 },	--雪女宠物
				{GoodsID=11702,Point=2372 ,JiFen=23720 },	--男圣诞时装
				{GoodsID=11323,Point=2372 ,JiFen=23720 },	--男圣诞时装
				{GoodsID=11324,Point=2372 ,JiFen=23720 },	--女圣诞时装
				{GoodsID=11325,Point=2372 ,JiFen=23720 },	--女圣诞时装
				{GoodsID=32016,Point=1772 ,JiFen=17721  },	--
				{GoodsID=32020,Point=1172 ,JiFen=11723  },	--
				{GoodsID=39701,Point=813 ,JiFen=8126  },	--
				{GoodsID=39705,Point=813 ,JiFen=8126  },	--
				{GoodsID=32014,Point=453 ,JiFen=4533  },	--
				{GoodsID=88992,Point=274 ,JiFen=2742 },	--
				
				},
	}
end

function ZheKouShangRen_DuiHua(ActorID, NPCID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ActorID = ActorID or API_RequestGetActorID()
	local WanJiaJiFen = API_VarDataGetNumber(ActorID,1,19038) --获取玩家身上的冰寒积分
--	if Year == 2010 and Month == 1 and Day >= 4 and Day <= 10 then
		API_ResponseWrite('<name>圣诞活动兑换官</name>')
		API_ResponseWrite('<text color="255,0,0">积分兑换道具时间：1月4日～1月10日，1月10日后将不可兑换</text><br>')
		API_ResponseWrite('<text color="255,0,255">你当前的冰寒积分为：'..WanJiaJiFen..'分</text><br><br>')
		API_ResponseWrite('<a href="ZheKouShangRen_MaiMai?1=2">积分兑换庄园道具</a><br><br>')
		API_ResponseWrite('<a href="Christmas_PointsAwards?1=1">20点冰寒积分兑换奖励</a>')
		API_ResponseWrite('<br><br><a>关闭</a>')
--	else
--		API_ResponseWrite('<name>圣诞活动兑换官</name>')
--		API_ResponseWrite('<text>积分兑换活动已结束</text><br><br>')
--		API_ResponseWrite('<a href="ZheKouShangRen_SCJZ">关闭</a>')
--	end
end

function ZheKouShangRen_SCJZ()
	local ActorID = API_RequestGetActorID()
	API_RemoveTaskScroll(ActorID,60003)--删除卷轴
end

function ZheKouShangRen_MaiMai()
	local ActorID = API_RequestGetActorID()
	local UidHigh = API_RequestGetNumber(100)--高位UID
	local UidLow = API_RequestGetNumber(1100)--低位UID
	local Uid = API_GetUID(UidHigh,UidLow) --获取UID	
	local BoxID,LocID = API_GetUIDGoodsInActor(Uid,ActorID)--背包ID 和 位置
	local SelectItem = API_RequestGetNumber(1)
	local XuanZheFangShi = API_RequestGetNumber(3)
	local Page = API_RequestGetNumber(2)
	local WanJiaJiFen = API_VarDataGetNumber(ActorID,1,19038) --获取玩家身上的冰寒积分
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ServerID = API_GetGameServerID() 
	if SelectItem == 3 then
		if XuanZheFangShi == 0 then
			API_ResponseWrite('<win close="0"></win>')
			API_ResponseWrite('<text>您可以在我这里兑换霉运卷轴，</text><text color="255,0,255">20个圣诞礼袜可以兑换1个霉运卷轴</text><text>，请将足够数量的圣诞礼袜放入下面的空格内。</text><br><br>')
			API_ResponseWrite('<goodsHolder name="100"><br>')
			API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=1">兑换1个霉运卷轴</a><br>')
			API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=2">全部兑换</a><br>')
			API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
		elseif XuanZheFangShi == 1 then
			if BoxID == -1 or LocID == -1 then
				API_ResponseWrite('<win close="0"></win>')
				API_ResponseWrite('<br><text>你的圣诞礼袜呢？请将足够数量的圣诞礼袜放在下面的空格内。</text><br>')
				API_ResponseWrite('<goodsHolder name="100"><br>')
				API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=1">兑换1个霉运卷轴</a><br>')
				API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=2">全部兑换</a><br>')
				API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
				return
			end
			local GoodsID = API_GetUIDGoodsPropNum(Uid,0)--提交的物品ID
			local Num = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,3)
			if API_ActorCanAddGoods(ActorID,88607,1,2,0) ~= -1 then
				if GoodsID == 88606 then
					if Num >= 20 then
						if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,20,BoxID,LocID, '兑换霉运卷轴删除20个圣诞礼袜') then
							API_AddActorGoodsFlag(ActorID,88607,1,2,'兑换获得1个霉运卷轴')
							API_ResponseWrite('<win close="0"></win>')
							API_ResponseWrite('<br><text>兑换成功，您获得：</text><img srcgd="88607" tipgd="88607"><text> × 1</text><br>')
							API_ResponseWrite('<br><text>如果要继续兑换霉运卷轴，请将足够数量的圣诞礼袜放入下面的空格内。</text><br><br>')
							API_ResponseWrite('<goodsHolder name="100"><br>')
							API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=1">兑换1个霉运卷轴</a><br>')
							API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=2">全部兑换</a><br>')
							API_ResponseWrite('<br><a>关闭</a><br>')
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[63][9][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[63][9][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[63][9][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][9][LaiYuan] + 1
							end
						end
					else
						API_ResponseWrite('<win close="0"></win>')
						API_ResponseWrite('<br><text>你放入的圣诞礼袜数量不足，请将20个圣诞礼袜放在下面的空格内。</text><br>')
						API_ResponseWrite('<goodsHolder name="100"><br>')
						API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=1">兑换1个霉运卷轴</a><br>')
						API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=2">全部兑换</a><br>')
						API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
					end
				else
					API_ResponseWrite('<win close="0"></win>')
					API_ResponseWrite('<br><text>你的圣诞礼袜呢？请将足够数量的圣诞礼袜放在下面的空格内。</text><br>')
					API_ResponseWrite('<goodsHolder name="100"><br>')
					API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=1">兑换1个霉运卷轴</a><br>')
					API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=2">全部兑换</a><br>')
					API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
				end
			else
				API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
			end
		elseif XuanZheFangShi == 2 then
			if BoxID == -1 or LocID == -1 then
				API_ResponseWrite('<win close="0"></win>')
				API_ResponseWrite('<br><text>你的圣诞礼袜呢？请将足够数量的圣诞礼袜放在下面的空格内。</text><br>')
				API_ResponseWrite('<goodsHolder name="100"><br>')
				API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=1">兑换1个霉运卷轴</a><br>')
				API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=2">全部兑换</a><br>')
				API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
				return
			end
			local GoodsID = API_GetUIDGoodsPropNum(Uid,0)--提交的物品ID
			local Num = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,3)
			local JuanZhouNum = math.floor(Num/20)
			if GoodsID == 88606 then
				if Num >= 20 then
					if API_ActorCanAddGoods(ActorID,88607,JuanZhouNum,2,0) ~= -1 then
						if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,20*JuanZhouNum,BoxID,LocID,'兑换霉运卷轴删除圣诞礼袜') then
							API_AddActorGoodsFlag(ActorID,88607,JuanZhouNum,2,'兑换获得霉运卷轴')
							API_ResponseWrite('<win close="0"></win>')
							API_ResponseWrite('<br><text>兑换成功，您获得：</text><img srcgd="88607" tipgd="88607"><text> × '..JuanZhouNum..'</text><br>')
							API_ResponseWrite('<br><text>如果要继续兑换霉运卷轴，请将足够数量的圣诞礼袜放入下面的空格内。</text><br><br>')
							API_ResponseWrite('<goodsHolder name="100"><br>')
							API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=1">兑换1个霉运卷轴</a><br>')
							API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=2">全部兑换</a><br>')
							API_ResponseWrite('<br><a>关闭</a><br>')
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[63][9][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[63][9][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[63][9][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][9][LaiYuan] + 1
							end
						end
					else
						API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end	
				else
					API_ResponseWrite('<win close="0"></win>')
					API_ResponseWrite('<br><text>你放入的圣诞礼袜数量不足，请将足够数量的圣诞礼袜放在下面的空格内。</text><br>')
					API_ResponseWrite('<goodsHolder name="100"><br>')
					API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=1">兑换1个霉运卷轴</a><br>')
					API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=2">全部兑换</a><br>')
					API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
				end
			else
				API_ResponseWrite('<win close="0"></win>')
				API_ResponseWrite('<br><text>你的圣诞礼袜呢？请将足够数量的圣诞礼袜放在下面的空格内。</text><br>')
				API_ResponseWrite('<goodsHolder name="100"><br>')
				API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=1">兑换1个霉运卷轴</a><br>')
				API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=3&3=2">全部兑换</a><br>')
				API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
			end
		end
	elseif SelectItem == 4 then
		if XuanZheFangShi == 0 then
			API_ResponseWrite('<win close="0"></win>')
			API_ResponseWrite('<text>您可以在我这里兑换净化卷轴，</text><text color="255,0,255">15个圣诞礼袜可以兑换1个净化卷轴</text><text>，请将足够数量的圣诞礼袜放入下面的空格内。</text><br><br>')
			API_ResponseWrite('<goodsHolder name="100"><br>')
			API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=1">兑换1个净化卷轴</a><br>')
			API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=2">全部兑换</a><br>')
			API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
		elseif XuanZheFangShi == 1 then
			if BoxID == -1 or LocID == -1 then
				API_ResponseWrite('<win close="0"></win>')
				API_ResponseWrite('<br><text>你的圣诞礼袜呢？请将足够数量的圣诞礼袜放在下面的空格内。</text><br>')
				API_ResponseWrite('<goodsHolder name="100"><br>')
				API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=1">兑换1个净化卷轴</a><br>')
				API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=2">全部兑换</a><br>')
				API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
				return
			end
			local GoodsID = API_GetUIDGoodsPropNum(Uid,0)--提交的物品ID
			local Num = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,3)
			if API_ActorCanAddGoods(ActorID,88608,1,2,0) ~= -1 then
				if GoodsID == 88606 then
					if Num >= 15 then
						if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,15,BoxID,LocID, '兑换净化卷轴删除15个圣诞礼袜') then
							API_AddActorGoodsFlag(ActorID,88608,1,2,'兑换获得1个净化卷轴')
							API_ResponseWrite('<win close="0"></win>')
							API_ResponseWrite('<br><text>兑换成功，您获得：</text><img srcgd="88608" tipgd="88608"><text> × 1</text><br>')
							API_ResponseWrite('<br><text>如果要继续兑换净化卷轴，请将足够数量的圣诞礼袜放入下面的空格内。</text><br><br>')
							API_ResponseWrite('<goodsHolder name="100"><br>')
							API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=1">兑换1个净化卷轴</a><br>')
							API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=2">全部兑换</a><br>')
							API_ResponseWrite('<br><a>关闭</a><br>')
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[63][10][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[63][10][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[63][10][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][10][LaiYuan] + 1
							end
						end
					else
						API_ResponseWrite('<win close="0"></win>')
						API_ResponseWrite('<br><text>你放入的圣诞礼袜数量不足，请将15个圣诞礼袜放在下面的空格内。</text><br>')
						API_ResponseWrite('<goodsHolder name="100"><br>')
						API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=1">兑换1个净化卷轴</a><br>')
						API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=2">全部兑换</a><br>')
						API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
					end
				else
					API_ResponseWrite('<win close="0"></win>')
					API_ResponseWrite('<br><text>你的圣诞礼袜呢？请将足够数量的圣诞礼袜放在下面的空格内。</text><br>')
					API_ResponseWrite('<goodsHolder name="100"><br>')
					API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=1">兑换1个净化卷轴</a><br>')
					API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=2">全部兑换</a><br>')
					API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
				end
			else
				API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
			end
		elseif XuanZheFangShi == 2 then
			if BoxID == -1 or LocID == -1 then
				API_ResponseWrite('<win close="0"></win>')
				API_ResponseWrite('<br><text>你的圣诞礼袜呢？请将足够数量的圣诞礼袜放在下面的空格内。</text><br>')
				API_ResponseWrite('<goodsHolder name="100"><br>')
				API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=1">兑换1个净化卷轴</a><br>')
				API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=2">全部兑换</a><br>')
				API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
				return
			end
			local GoodsID = API_GetUIDGoodsPropNum(Uid,0)--提交的物品ID
			local Num = API_ActorGetGoodsPropNum(ActorID,BoxID,LocID+1,3)
			local JuanZhouNum = math.floor(Num/15)
			if GoodsID == 88606 then
				if Num >= 15 then
					if API_ActorCanAddGoods(ActorID,88608,JuanZhouNum,2,0) ~= -1 then
						if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,15*JuanZhouNum,BoxID,LocID,'兑换净化卷轴删除圣诞礼袜') then
							API_AddActorGoodsFlag(ActorID,88608,JuanZhouNum,2,'兑换获得净化卷轴')
							API_ResponseWrite('<win close="0"></win>')
							API_ResponseWrite('<br><text>兑换成功，您获得：</text><img srcgd="88608" tipgd="88608"><text> × '..JuanZhouNum..'</text><br>')
							API_ResponseWrite('<br><text>如果要继续兑换净化卷轴，请将足够数量的圣诞礼袜放入下面的空格内。</text><br><br>')
							API_ResponseWrite('<goodsHolder name="100"><br>')
							API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=1">兑换1个净化卷轴</a><br>')
							API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=2">全部兑换</a><br>')
							API_ResponseWrite('<br><a>关闭</a><br>')
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[63][10][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[63][10][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[63][10][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][10][LaiYuan] + 1
							end
						end
					else
						API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end	
				else
					API_ResponseWrite('<win close="0"></win>')
					API_ResponseWrite('<br><text>你放入的圣诞礼袜数量不足，请将足够数量的圣诞礼袜放在下面的空格内。</text><br>')
					API_ResponseWrite('<goodsHolder name="100"><br>')
					API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=1">兑换1个净化卷轴</a><br>')
					API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=2">全部兑换</a><br>')
					API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
				end
			else
				API_ResponseWrite('<win close="0"></win>')
				API_ResponseWrite('<br><text>你的圣诞礼袜呢？请将足够数量的圣诞礼袜放在下面的空格内。</text><br>')
				API_ResponseWrite('<goodsHolder name="100"><br>')
				API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=1">兑换1个净化卷轴</a><br>')
				API_ResponseWrite('<br><a href="ZheKouShangRen_MaiMai?1=4&3=2">全部兑换</a><br>')
				API_ResponseWrite('<br><a>算了先不兑换了</a><br>')
			end
		end
	end
	local GoodsNum = 0
	if SelectItem == 1 then
		if ZheKouShangRen_Goods_Table[SelectItem][1] == nil then
			return
		end
		if type(ZheKouShangRen_Goods_Table[SelectItem][1]) ~= 'table' then
			return
		end
		GoodsNum = table.getn(ZheKouShangRen_Goods_Table[SelectItem][1])	
	else
		if ZheKouShangRen_Goods_Table[SelectItem] == nil then
			return
		end
		if type(ZheKouShangRen_Goods_Table[SelectItem]) ~= 'table' then
			return
		end
		GoodsNum = table.getn(ZheKouShangRen_Goods_Table[SelectItem])
	end
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if ZheKouShangRen_Goods_Table[SelectItem][BuyNo] ~= nil or ZheKouShangRen_Goods_Table[SelectItem][1][BuyNo] ~= nil then
			local BuyGoodsID = 0
			local BuyPoint = 0
			local BuyJiFen = 0
			if SelectItem == 1 then
				if ServerID == 63 or ServerID == 64 or ServerID ==65 or ServerID ==66 or ServerID ==67 or ServerID ==68 then			
					BuyGoodsID = ZheKouShangRen_Goods_Table[SelectItem][ServerID][BuyNo].GoodsID
					BuyPoint = ZheKouShangRen_Goods_Table[SelectItem][ServerID][BuyNo].Point
					BuyJiFen = ZheKouShangRen_Goods_Table[SelectItem][ServerID][BuyNo].JiFen
				else
					BuyGoodsID = ZheKouShangRen_Goods_Table[SelectItem][1][BuyNo].GoodsID
					BuyPoint = ZheKouShangRen_Goods_Table[SelectItem][1][BuyNo].Point
					BuyJiFen = ZheKouShangRen_Goods_Table[SelectItem][1][BuyNo].JiFen				
				end
			else
				BuyGoodsID = ZheKouShangRen_Goods_Table[SelectItem][BuyNo].GoodsID
				BuyPoint = ZheKouShangRen_Goods_Table[SelectItem][BuyNo].Point
				BuyJiFen = ZheKouShangRen_Goods_Table[SelectItem][BuyNo].JiFen
			end
			local BuyNum = API_RequestGetNumber(num)
			if BuyNum < 1 then
				BuyNum = 1
			end
			BuyPoint = BuyPoint * BuyNum
			BuyJiFen = BuyJiFen * BuyNum
			if BuyPoint < 0 or BuyPoint > 100000000 then
				return
			end
--			if Year == 2010 and Month == 1 and Day >= 5 and Day <= 10 then
				if BuyPoint == 0 and BuyJiFen > 0 then
					if WanJiaJiFen >= BuyJiFen then
						if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
							WanJiaJiFen2 = WanJiaJiFen - BuyJiFen
							API_VarDataSetNumber(ActorID,1,19038,WanJiaJiFen2)
							API_AddActorGoodsFlag(ActorID,BuyGoodsID,BuyNum,3,'冰寒积分兑换')
							API_ResponseWrite('<name>圣诞活动兑换官</name>')
							API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
							API_ResponseWrite('<text>您消耗</text><text color="255,0,255">'..BuyJiFen..'点</text><text>冰寒积分兑换了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
							API_ResponseWrite('<text>     </text>')
							API_ResponseWrite('<a href="ZheKouShangRen_MaiMai?1=2">返回</a>')
							--风向标
							if GLOBAL_FengXiangBiao_DateList[42][BuyGoodsID] ~= nil then
								local LaiYuan = API_ActorGetPropNum(ActorID,201)
								if GLOBAL_FengXiangBiao_DateList[42][BuyGoodsID][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[42][BuyGoodsID][LaiYuan] = BuyNum
								else
									GLOBAL_FengXiangBiao_DateList[42][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[42][BuyGoodsID][LaiYuan] + BuyNum
								end
							end
						else
							API_ResponseWrite('<name>圣诞活动兑换官</name>')
							API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name>圣诞活动兑换官</name>')
						API_ResponseWrite('<text>您的冰寒积分不够，无法兑换，您当前的冰寒积分为：</text><text color="255,0,255">'..WanJiaJiFen..'点</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				elseif BuyPoint > 0 and BuyJiFen == 0 then
					if API_ActorGetPropNum(ActorID,156) >= BuyPoint then
						if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
							if API_ActorAddMoney(ActorID,-BuyPoint,0,'购买圣诞活动道具扣除金币') then
								API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'圣诞活动大使购买')
								API_ResponseWrite('<name>圣诞大使</name>')
								API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
								API_ResponseWrite('<text>您花费</text><text color="255,0,255">'..BuyPoint..'</text><text>金币，</text><text color="255,0,255">'..BuyJiFen..'点</text><text>冰寒积分购买了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
								API_ResponseWrite('<br><br><a>确定</a>')
								API_ResponseWrite('<text>     </text>')
								API_ResponseWrite('<a href="ZheKouShangRen_MaiMai?1=1">返回</a>')
								for i = 1,BuyNum do
									if BuyGoodsID == 88994 then
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[63][5][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[63][5][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[63][5][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][5][LaiYuan] + 1
										end
									elseif BuyGoodsID == 88999 then
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[63][6][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[63][6][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[63][6][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][6][LaiYuan] + 1
										end
									elseif BuyGoodsID == 88998 then
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[63][7][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[63][7][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[63][7][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][7][LaiYuan] + 1
										end
									elseif BuyGoodsID == 89000 then
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[63][14][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[63][14][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[63][14][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][14][LaiYuan] + 1
										end									
									end
								end
							end
						else
							API_ResponseWrite('<name>圣诞大使</name>')
							API_ResponseWrite('<text>您的背包空间不足，无法购买</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name>圣诞大使</name>')
						API_ResponseWrite('<text>您的金币数量不够，无法购买</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				elseif BuyPoint > 0 and BuyJiFen > 0 then
					if API_ActorGetGoodsNum(ActorID,82019) >= BuyPoint then
						if WanJiaJiFen >= BuyJiFen then
							if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
--								if API_ActorRemoveGoods(ActorID,TML_YYSR_YYDJQID,BuyPoint,"删除对应价格数量的云游代金券") then
								if BuyGoodsID == 31039 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,1) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,1)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,1,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end
								elseif BuyGoodsID == 11702 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,4) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,4)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,4,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')
										return
									end
								elseif BuyGoodsID == 11323 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,5) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,5)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,5,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end
								elseif BuyGoodsID == 11324 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,6) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,6)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,6,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end
								elseif BuyGoodsID == 11325 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,7) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,7)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,7,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end
								elseif BuyGoodsID == 75 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,8) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,8)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,8,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end								
								elseif BuyGoodsID == 32001 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,9) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,9)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,9,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end
								elseif BuyGoodsID == 88044 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,10) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,10)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,10,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end
								elseif BuyGoodsID == 80274 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,11) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,11)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,11,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end
								elseif BuyGoodsID == 80397 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,12) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,12)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,12,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end
								elseif BuyGoodsID == 32016 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,13) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,13)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,13,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end
								elseif BuyGoodsID == 32020 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,14) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,14)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,14,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end
								elseif BuyGoodsID == 39701 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,15) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,15)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,15,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end
								elseif BuyGoodsID == 39705 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,16) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,16)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,16,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end
								elseif BuyGoodsID == 32014 then
									if API_VarDataGetNumber_Ex(1,0,-6011,1,17) >= BuyNum then
										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,17)
										ShengYuNum = ShengYuNum - BuyNum
										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,17,ShengYuNum)
									else
										API_ResponseWrite('<name>圣诞大使</name>')
										API_ResponseWrite('<text>该物品库存不够。</text>')
										API_ResponseWrite('<br><br><a>确定</a>')										
										return
									end
--								elseif BuyGoodsID == 32012 then
--									if API_VarDataGetNumber_Ex(1,0,-6011,1,18) >= BuyNum then
--										local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6011,1,18)
--										ShengYuNum = ShengYuNum - BuyNum
--										API_VarDataSetNumber_Ex_Sync(1,0,-6011,1,18,ShengYuNum)
--									else
--										API_ResponseWrite('<name>圣诞大使</name>')
--										API_ResponseWrite('<text>该物品库存不够。</text>')
--										API_ResponseWrite('<br><br><a>确定</a>')										
--										return
--									end
								end
								if API_ActorRemoveGoods(ActorID,82019,BuyPoint,'扣除冰寒晶片') then
									WanJiaJiFen2 = WanJiaJiFen - BuyJiFen
									API_VarDataSetNumber(ActorID,1,19038,WanJiaJiFen2)
									API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'圣诞活动大使购买')
									API_ResponseWrite('<name>圣诞大使</name>')
									API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'" ><text>  × '..BuyNum..'</text><br><br>')
									API_ResponseWrite('<text>您消耗</text><text color="255,0,255">'..BuyPoint..'</text><text>冰寒晶片，</text><text color="255,0,255">'..BuyJiFen..'点</text><text>冰寒积分兑换了</text><text color="255,0,255">'..BuyNum..'个</text><text>'..API_GetGoodsName(BuyGoodsID)..'</text>')
									API_ResponseWrite('<br><br><a>确定</a>')
									API_ResponseWrite('<text>     </text>')
									API_ResponseWrite('<a href="ZheKouShangRen_MaiMai?1=5">返回</a>')
									--风向标
--									if GLOBAL_FengXiangBiao_DateList[42][BuyGoodsID] ~= nil then
--										local LaiYuan = API_ActorGetPropNum(ActorID,201)
--										if GLOBAL_FengXiangBiao_DateList[42][BuyGoodsID][LaiYuan] == nil then
--											GLOBAL_FengXiangBiao_DateList[42][BuyGoodsID][LaiYuan] = BuyNum
--										else
--											GLOBAL_FengXiangBiao_DateList[42][BuyGoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[42][BuyGoodsID][LaiYuan] + BuyNum
--										end
--									end
									for i = 1,BuyNum do
										if BuyGoodsID == 11702 or BuyGoodsID == 11323 or BuyGoodsID == 11324 or BuyGoodsID == 11325 then
											local LaiYuan = API_ActorGetPropNum(ActorID,201)
											if GLOBAL_FengXiangBiao_DateList[63][11][LaiYuan] == nil then
												GLOBAL_FengXiangBiao_DateList[63][11][LaiYuan] = 1
											else
												GLOBAL_FengXiangBiao_DateList[63][11][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][11][LaiYuan] + 1
											end
										elseif BuyGoodsID == 31039 then
											API_ActorBDCMsg(-1,0,-1,11,85,0,17,''..API_GetActorName(ActorID)..'真是雷厉风行，快如闪电通过圣诞大使兑换了雪女宝宝，恭喜这位玩家，同时感谢各位玩家对英雄岛的支持！')
											local LaiYuan = API_ActorGetPropNum(ActorID,201)
											if GLOBAL_FengXiangBiao_DateList[63][12][LaiYuan] == nil then
												GLOBAL_FengXiangBiao_DateList[63][12][LaiYuan] = 1
											else
												GLOBAL_FengXiangBiao_DateList[63][12][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][12][LaiYuan] + 1
											end
										elseif BuyGoodsID == 75 or BuyGoodsID == 32001 or BuyGoodsID == 88044 or BuyGoodsID == 80274 or BuyGoodsID == 80397 then    
											local LaiYuan = API_ActorGetPropNum(ActorID,201)
											if GLOBAL_FengXiangBiao_DateList[63][13][LaiYuan] == nil then
												GLOBAL_FengXiangBiao_DateList[63][13][LaiYuan] = 1
											else
												GLOBAL_FengXiangBiao_DateList[63][13][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][13][LaiYuan] + 1
											end
										elseif BuyGoodsID == 89030 then
											local LaiYuan = API_ActorGetPropNum(ActorID,201)
											if GLOBAL_FengXiangBiao_DateList[63][15][LaiYuan] == nil then
												GLOBAL_FengXiangBiao_DateList[63][15][LaiYuan] = 1
											else
												GLOBAL_FengXiangBiao_DateList[63][15][LaiYuan] = GLOBAL_FengXiangBiao_DateList[63][15][LaiYuan] + 1
											end
										end
									end
								end
							else
								API_ResponseWrite('<name>圣诞大使</name>')
								API_ResponseWrite('<text>您的背包空间不足，无法兑换</text>')
								API_ResponseWrite('<br><br><a>确定</a>')
							end
						else
							API_ResponseWrite('<name>圣诞大使</name>')
							API_ResponseWrite('<text>您的冰寒积分不够，无法兑换，您当前的冰寒积分为：</text><text color="255,0,255">'..WanJiaJiFen..'点</text>')
							API_ResponseWrite('<br><br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name>圣诞大使</name>')
						API_ResponseWrite('<text>您的冰寒晶片数量不够，无法兑换</text>')
						API_ResponseWrite('<br><br><a>确定</a>')
					end
				end
--			else
--				API_ResponseWrite('<name>圣诞活动兑换官</name>')
--				API_ResponseWrite('<text>积分兑换活动已结束</text>')
--				API_ResponseWrite('<br><br><a>确定</a>')
--			end
		end
		return
	end
	if SelectItem == 1 then
		API_ResponseWrite('<name>圣诞大使</name>')
		API_ResponseWrite('<win rect="30,75,490,510"></win>')
--		API_ResponseWrite('<text color="255,0,255">可按"P"键在商城购买"云游代金券"</text><br>')
		API_ResponseWrite('<text color="255,0,255">圣诞活动时间：12月16日～1月4日</text><br><br>')
		for i = 1,GoodsNum do
			if i > Page * 6 and i < (Page + 1) * 6 + 1 then
				local BuyGoodsID = 0
				local BuyPoint = 0
				local BuyJiFen = 0
				if ServerID == 63 or ServerID == 64 or ServerID ==65 or ServerID ==66 or ServerID ==67 or ServerID ==68 then
					BuyGoodsID = ZheKouShangRen_Goods_Table[SelectItem][ServerID][i].GoodsID
					BuyPoint = ZheKouShangRen_Goods_Table[SelectItem][ServerID][i].Point
					BuyJiFen = ZheKouShangRen_Goods_Table[SelectItem][ServerID][i].JiFen
				else
					BuyGoodsID = ZheKouShangRen_Goods_Table[SelectItem][1][i].GoodsID
					BuyPoint = ZheKouShangRen_Goods_Table[SelectItem][1][i].Point
					BuyJiFen = ZheKouShangRen_Goods_Table[SelectItem][1][i].JiFen
				end
				API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
				API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
				local BuyNumTip = ''
				local BuyPointTip = '<text>  单价：'..string.format("%-5s",BuyPoint)..'</text>'
				BuyPointTip = BuyPointTip..'<text color="254,249,220">金币             </text>'
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
				API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
				API_ResponseWrite('<text>————————————————————————————————————</text><br>')
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
				API_ResponseWrite('<a href="ChristmasDaShiDianJi">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..NextPage..'">')
			elseif (Page + 1) * 6 < GoodsNum then
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="ChristmasDaShiDianJi">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..NextPage..'">')
			else
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="ChristmasDaShiDianJi">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_g.bmp">')
			end
		else
--			API_ResponseWrite('<br><a href="ZheKouShangRen_DuiHua">  返回</a>')
			API_ResponseWrite('<br><a href="ChristmasDaShiDianJi">  返回</a>')
		end
	elseif SelectItem == 2 then
		API_ResponseWrite('<name>积分道具</name>')
		API_ResponseWrite('<win rect="30,75,370,510"></win>')
		API_ResponseWrite('<text color="255,0,255">兑换时间：1月5日～1月10日</text><br><br>')
		for i = 1,GoodsNum do
			if i > Page * 6 and i < (Page + 1) * 6 + 1 then
				local BuyGoodsID = ZheKouShangRen_Goods_Table[SelectItem][i].GoodsID
				local BuyJiFen = ZheKouShangRen_Goods_Table[SelectItem][i].JiFen
				API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
				API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
				local BuyNumTip = ''
				local BuyPointTip = '<text>  单价：'..string.format("%-6s",BuyJiFen..'点')..'</text>'
				BuyPointTip = BuyPointTip..'<text color="254,249,220">冰寒积分       </text>'
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
				API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
				API_ResponseWrite('<text>——————————————————————————</text><br>')
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
				API_ResponseWrite('<a href="ZheKouShangRen_DuiHua">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..NextPage..'">')
			elseif (Page + 1) * 6 < GoodsNum then
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="ZheKouShangRen_DuiHua">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..NextPage..'">')
			else
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="ZheKouShangRen_DuiHua">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_g.bmp">')
			end
		else
			API_ResponseWrite('<br><a href="ZheKouShangRen_DuiHua">  返回</a>')
		end
	elseif SelectItem == 5 then
		API_ResponseWrite('<name>圣诞大使</name>')
		API_ResponseWrite('<win rect="30,75,490,510"></win>')
		API_ResponseWrite('<text color="255,0,255">圣诞活动时间：12月16日～1月4日</text><br><br>')
		for i = 1,GoodsNum do
			if i > Page * 6 and i < (Page + 1) * 6 + 1 then
				local BuyGoodsID = ZheKouShangRen_Goods_Table[SelectItem][i].GoodsID
				local BuyPoint = ZheKouShangRen_Goods_Table[SelectItem][i].Point
				local BuyJiFen = ZheKouShangRen_Goods_Table[SelectItem][i].JiFen
				if BuyGoodsID == 31039 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,1)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：周六14点)</text><br>')
				elseif BuyGoodsID == 11702 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,4)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：周六14点)</text><br>')
				elseif BuyGoodsID == 11323 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,5)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：周六14点)</text><br>')
				elseif BuyGoodsID == 11324 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,6)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：周六14点)</text><br>')
				elseif BuyGoodsID == 11325 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,7)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：周六14点)</text><br>')
				elseif BuyGoodsID == 75 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,8)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：每日12点与19点)</text><br>')
				elseif BuyGoodsID == 32001 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,9)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：每日12点与19点)</text><br>')
				elseif BuyGoodsID == 88044 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,10)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：每日12点与19点)</text><br>')
				elseif BuyGoodsID == 80274 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,11)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：每日12点与19点)</text><br>')
				elseif BuyGoodsID == 80397 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,12)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：每日12点与19点)</text><br>')
				elseif BuyGoodsID == 32016 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,13)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：周六14点)</text><br>')
				elseif BuyGoodsID == 32020 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,14)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：周六14点)</text><br>')
				elseif BuyGoodsID == 39701 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,15)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：周六14点)</text><br>')
				elseif BuyGoodsID == 39705 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,16)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：周六14点)</text><br>')
				elseif BuyGoodsID == 32014 then
					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,17)
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..' 刷新时间：周六14点)</text><br>')
--				elseif BuyGoodsID == 32012 then
--					local Number =  API_VarDataGetNumber_Ex(1,0,-6011,1,18)
--					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><text color="255,0,255">  (剩余数量：'..Number..')</text><br>')
				else
					API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
				end
				API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
				local BuyNumTip = ''
				local BuyPointTip = '<text>  消耗：'..string.format("%-5s",BuyPoint)..'</text>'
				BuyPointTip = BuyPointTip..'<text color="254,249,220">冰寒晶片</text>'
				BuyPointTip = BuyPointTip..'<text>    '..string.format("%-5s",BuyJiFen..'点')..'</text>'
				BuyPointTip = BuyPointTip..'<text color="254,249,220">冰寒积分       </text>'
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
				API_ResponseWrite('<img src="LuaUse\\button Exchange_u.bmp" src2="LuaUse\\button Exchange_l.bmp" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..Page..'&3='..i..'"><br>')
				API_ResponseWrite('<text>————————————————————————————————————</text><br>')
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
				API_ResponseWrite('<a href="ChristmasDaShiDianJi">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..NextPage..'">')
			elseif (Page + 1) * 6 < GoodsNum then
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="ChristmasDaShiDianJi">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..NextPage..'">')
			else
				API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="ZheKouShangRen_MaiMai?1='..SelectItem..'&2='..BackPage..'"><text>       </text>')
				API_ResponseWrite('<a href="ChristmasDaShiDianJi">返回</a>')
				API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_g.bmp">')
			end
		else
			API_ResponseWrite('<br><a href="ChristmasDaShiDianJi">  返回</a>')
		end
	end
end

function ZheKouShangRen_OnLogin(ActorID)
	local LV = API_GetActorExpLevel(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID) 
	if LV < 11 then
		return
	end
	if MapID ~= StaticMapID then
		return
	end
	if API_VarDataGetNumber(ActorID,1,9901) > 0 then	--判断玩家不是在新手任务
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		if (Year == Christmas_ActTime.StartYear and Month == Christmas_ActTime.StartMonth and Day >= Christmas_ActTime.StartDay) or (Year == Christmas_ActTime.EndYear and Month == Christmas_ActTime.EndMonth and Day <= Christmas_ActTime.EndDay) then
			API_RemoveTaskScroll(ActorID,60003)--删除卷轴
			--API_AddTaskScrollEx(ActorID,60003,104117,'Christmas_Scroll',1)--加卷轴
			LRY_UItwinkemanage(ActorID,11,85,104117,60003,34,'Christmas_Scroll')--加卷轴
		else
			API_RemoveTaskScroll(ActorID,60003)--删除卷轴
		end
	end
end

function ZheKouShangRen_OnLogout(ActorID)
	local nType = API_VarDataGetNumber(ActorID, 0, 18368)
	if nType == 3 then
		API_RemoveTaskScroll(ActorID,60003)--删除卷轴
	end
	API_ResponseWrite('<name></name>')
	API_ResponseWrite('<win rect="1330,1400,1,1"></win>')
	API_ResponseFlush(ActorID)
end

function ZheKouShangRen_OnLoginMap(ActorID)
	local LV = API_GetActorExpLevel(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID) 
	if LV < 11 then
		return
	end
	if MapID ~= StaticMapID then
		return
	end
	if API_VarDataGetNumber(ActorID,1,9901) > 0 then
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		if (Year == Christmas_ActTime.StartYear and Month == Christmas_ActTime.StartMonth and Day >= Christmas_ActTime.StartDay) or (Year == Christmas_ActTime.EndYear and Month == Christmas_ActTime.EndMonth and Day <= Christmas_ActTime.EndDay) then
			API_RemoveTaskScroll(ActorID,60003)--删除卷轴
			--API_AddTaskScrollEx(ActorID,60003,104117,'Christmas_Scroll',1)--加卷轴
			LRY_UItwinkemanage(ActorID,11,85,104117,60003,34,'Christmas_Scroll')--加卷轴
		else
			API_RemoveTaskScroll(ActorID,60003)--删除卷轴
		end
	end
end

function ZheKouShangRen_OnLogoutMap(ActorID)
	if API_VarDataGetNumber(ActorID,1,9901) > 0 then
		API_RemoveTaskScroll(ActorID,60003)--删除卷轴
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="1330,1400,1,1"></win>')
		API_ResponseFlush(ActorID)
	end
end
