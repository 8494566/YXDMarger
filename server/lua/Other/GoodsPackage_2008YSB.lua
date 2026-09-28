----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\GoodsPackage.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-6-25
--版  本:	1.0
--描  述:	使用道具包裹
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-3-26
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------

--道具包裹内容表
GLOBAL_GoodsPackage_GoodsIDList={
	--[[0: 无绑定  
		1：不可以交易、拍卖、给予、邮寄 
		2：不可以出售给NPC 
		3：=1+2
		4：切换地图消失
		5：1+4
		6：2+4
		7：1+2+4--]]
	--注意有重复的物品ID不同。
		
		
	--道具店
		--魔盒钥匙包
		[550] = {
					{ID=80455,Num=18,Bind=0},
				},
				
				
		--配方钥匙包
		[551] = {
					{ID=80454,Num=18},
				},
				
				
		--重生十字章包
		[552] = {
					{ID=80274,Num=20},
				},
				
				
		--聊天石包
		[553] = {
					{ID=80397,Num=12},
				},
				
				
		--英雄转换魔盒包
		[554] = {
					{ID=80394,Num=9},
				},
				
				
		--跳关符包
		[555] = {
					{ID=727,Num=23},
				},
				
				
		--背包续时油包
		[556] = {
					{ID=27,Num=40},
				},
				
				
		--界石包
		[557] = {
					{ID=765,Num=10},
				},
				
				
		--点金手套新手包
		[789] = {
					{ID=714,Num=5},
				},
				
				
		--点金手套包
		[715] = {
					{ID=714,Num=900},
				},
				
				
		--奶包
		[558] = {
					{ID=80486,Num=10},
				},
				
				
		--蛋包
		[559] = {
					{ID=80487,Num=10},
				},
		
		
		--50空岛礼包
		[662] = {
					{ID=714,Num=100,Bind=1},
					{ID=80454,Num=50,Bind=1},
				},
				
				
		--100阳光礼包
		[663] = {
					{ID=714,Num=300,Bind=1},
					{ID=80274,Num=50,Bind=1},
				},
				
				
		--300绚彩礼包
		[664] = {
					{ID=9507,Num=1,Bind=1},
					{ID=27,Num=40,Bind=1},
				},
				
				
		--500华贵礼包
		[665] = {
					{ID=119,Num=100,Bind=1},
					{ID=80455,Num=100,Bind=1},
				},
				
				
		--800至尊礼包
		[666] = {
					{ID=714,Num=1000,Bind=1},
					{ID=80455,Num=100,Bind=1},
					{ID=80454,Num=100,Bind=1},
					{ID=80397,Num=50,Bind=1},
				},
				
				
		--1000英雄礼包
		[667] = {
					{ID=80181,Num=150,Bind=1},
					{ID=9507,Num=1,Bind=1},
					{ID=27,Num=40,Bind=1},
				},
				
				
		--豪华装普通合成魔盒包
		[846] = {
					{ID=80384,Num=1,Bind=3},
					{ID=118,Num=2,Bind=3},
					{ID=119,Num=2,Bind=3},
					{ID=208,Num=5,Bind=3},
					{ID=22,Num=1,Bind=3},
					{ID=23,Num=1,Bind=3},
					{ID=80274,Num=1,Bind=3},
				},
				
		--豪华装T2提炼石包
		[847] = {
					{ID=80399,Num=2,Bind=3},
					{ID=118,Num=2,Bind=3},
					{ID=119,Num=2,Bind=3},
					{ID=208,Num=5,Bind=3},
					{ID=22,Num=1,Bind=3},
					{ID=23,Num=1,Bind=3},
					{ID=80274,Num=1,Bind=3},
				},
				
		--豪华装T3提炼石包
		[848] = {
					{ID=80400,Num=2,Bind=3},
					{ID=118,Num=2,Bind=3},
					{ID=119,Num=2,Bind=3},
					{ID=208,Num=5,Bind=3},
					{ID=22,Num=1,Bind=3},
					{ID=23,Num=1,Bind=3},
					{ID=80274,Num=1,Bind=3},
				},
				
				
		--背包续时油包无用
		[668] = {
					{ID=27,Num=20},
				},
				
				
		--界石包无用
		[669] = {
					{ID=765,Num=450},
				},
				
				
		--奶包无用
		[670] = {
					{ID=80486,Num=300},
				},
				
				
		--蛋包无用
		[671] = {
					{ID=80487,Num=38},
				},
		
		
	--药品店
		--[特殊]微型能量药水包
		[560] = {
					{ID=206,Num=50},
				},
				
				
		--[特殊]小型能量药水包
		[561] = {
					{ID=207,Num=50},
				},
				
				
		--[特殊]中小型能量药水包
		[562] = {
					{ID=208,Num=50},
				},
				
				
		--[特殊]中型能量药水包
		[563] = {
					{ID=209,Num=50},
				},
				
				
		--[特殊]大型能量药水包
		[564] = {
					{ID=210,Num=50},
				},
				
				
		--[特殊]微型生命药水包
		[565] = {
					{ID=117,Num=50},
				},
				
				
		--[特殊]小型生命药水包
		[566] = {
					{ID=118,Num=50},
				},
				
				
		--[特殊]中小型生命药水包
		[567] = {
					{ID=119,Num=50},
				},
				
				
		--[特殊]中型生命药水包
		[568] = {
					{ID=120,Num=50},
				},
				
				
		--[特殊]大型生命药水包
		[569] = {
					{ID=121,Num=50},
				},
		

		--672到681都不需要用到
		--[特殊]微型能量药水包无用
		[672] = {
					{ID=206,Num=225},
				},
				
				
		--[特殊]小型能量药水包无用
		[673] = {
					{ID=207,Num=150},
				},
				
				
		--[特殊]中小型能量药水包无用
		[674] = {
					{ID=208,Num=90},
				},
				
				
		--[特殊]中型能量药水包无用
		[675] = {
					{ID=209,Num=75},
				},
				
				
		--[特殊]大型能量药水包无用
		[676] = {
					{ID=210,Num=74},
				},
				
				
		--[特殊]微型生命药水包无用
		[677] = {
					{ID=117,Num=100},
				},
				
				
		--[特殊]小型生命药水包无用
		[678] = {
					{ID=118,Num=70},
				},
				
				
		--[特殊]中小型生命药水包无用
		[679] = {
					{ID=119,Num=76},
				},
				
				
		--[特殊]中型生命药水包无用
		[680] = {
					{ID=120,Num=65},
				},
				
				
		--[特殊]大型生命药水包无用
		[681] = {
					{ID=121,Num=52},
				},

		
		
	--改造店
		--劣质合成魔盒包
		[570] = {
					{ID=80383,Num=10},
				},
				
				
		--普通合成魔盒包
		[571] = {
					{ID=80384,Num=10},
				},
				
				
		--劣质宝石合成剂包
		[572] = {
					{ID=80181,Num=10},
				},
				
				
		--T1提炼石包
		[573] = {
					{ID=80398,Num=13},
				},
				
				
		--T2提炼石包
		[574] = {
					{ID=80399,Num=9},
				},
				
				
		--T3提炼石包
		[575] = {
					{ID=80400,Num=6},
				},
				
				
		--T4提炼石包
		[576] = {
					{ID=80401,Num=6},
				},
				
				
		--1档套装激活魔盒包
		[577] = {
					{ID=80385,Num=2},
				},
				
				
		--2档套装激活魔盒包
		[578] = {
					{ID=80386,Num=2},
				},
				
				
		--3档套装激活魔盒包
		[579] = {
					{ID=80387,Num=2},
				},
				
				
		--劣质提炼魔盒包
		[580] = {
					{ID=80404,Num=10},
				},
				
				
		--普通提炼魔盒包
		[581] = {
					{ID=80405,Num=10},
				},
				
				
		--劣质点化魔盒包
		[582] = {
					{ID=80408,Num=10},
				},
				
				
		--普通点化魔盒包
		[583] = {
					{ID=80409,Num=10},
				},
				
				
		--普通润滑剂包
		[584] = {
					{ID=80192,Num=3},
				},
		
		--682到696都没不用到	
		--劣质合成魔盒包
		[682] = {
					{ID=80383,Num=45},
				},
				
				
		--普通合成魔盒包
		[683] = {
					{ID=80384,Num=25},
				},
				
				
		--劣质宝石合成剂包
		[684] = {
					{ID=80181,Num=30},
				},
				
				
		--T1提炼石包
		[685] = {
					{ID=80398,Num=13},
				},
				
				
		--T2提炼石包
		[686] = {
					{ID=80399,Num=9},
				},
				
				
		--T3提炼石包
		[687] = {
					{ID=80400,Num=6},
				},
				
				
		--T4提炼石包
		[688] = {
					{ID=80401,Num=6},
				},
				
				
		--1档套装激活魔盒包
		[689] = {
					{ID=80385,Num=6},
				},
				
				
		--2档套装激活魔盒包
		[690] = {
					{ID=80386,Num=3},
				},
				
				
		--3档套装激活魔盒包
		[691] = {
					{ID=80387,Num=2},
				},
				
				
		--劣质提炼魔盒包
		[692] = {
					{ID=80404,Num=60},
				},
				
				
		--普通提炼魔盒包
		[693] = {
					{ID=80405,Num=25},
				},
				
				
		--劣质点化魔盒包
		[694] = {
					{ID=80408,Num=60},
				},
				
				
		--普通点化魔盒包
		[695] = {
					{ID=80409,Num=25},
				},
				
				
		--普通润滑剂包
		[696] = {
					{ID=80192,Num=10},
				},

		
		
	--生活技能店
		
		
		
	--土地道具店
		--资源刷新凭证包
		[585] = {
					{ID=80279,Num=2},
				},
				
				
		--土地续约凭证包
		[586] = {
					{ID=80280,Num=2},
				},
				
				
		--资源刷新凭证包
		[697] = {
					{ID=80279,Num=12},
				},
				
				
		--土地续约凭证包
		[698] = {
					{ID=80280,Num=15},
				},
		
		
	--紧急补给店
	
	
	--新手礼包
		--英雄岛礼包
		[699] = {
					{ID=80274,Num=1,Bind=1},
					{ID=714,Num=1,Bind=1},
					{ID=117,Num=1,Bind=1},
				},


		--初级奖励礼包
		[934] = {
					{ID=941,Num=25,Bind=1},
					{ID=942,Num=25,Bind=1},
					{ID=943,Num=25,Bind=1},
					{ID=912,Num=100,Bind=1},
				},


		--二次奖励包
		[935] = {
					{ID=933,Num=1,Bind=1},
					{ID=939,Num=25,Bind=1},
					{ID=940,Num=25,Bind=1},
					{ID=944,Num=21,Bind=1},	
					{ID=908,Num=100,Bind=1},
				},


		--三次奖励包
		[936] = {
					{ID=784,Num=2,Bind=1},
					{ID=945,Num=2,Bind=1},
					{ID=80397,Num=70,Bind=1},
					{ID=714,Num=1000,Bind=1},
					{ID=765,Num=1000,Bind=1},
					{ID=904,Num=500,Bind=1},
					{ID=912,Num=300,Bind=1},
				},


		--四次奖励包
		[937] = {
					{ID=946,Num=2,Bind=1},
					{ID=947,Num=2,Bind=1},
					{ID=80485,Num=20,Bind=1},
					{ID=917,Num=50,Bind=1},
					{ID=919,Num=100,Bind=1},
					{ID=80397,Num=80,Bind=1},
					{ID=939,Num=100,Bind=1},
					{ID=940,Num=100,Bind=1},
				},


		--五次奖励包
		[938] = {
					{ID=9507,Num=2,Bind=1},
					{ID=80564,Num=200,Bind=1},
					{ID=80394,Num=250,Bind=1},
					{ID=911,Num=65,Bind=1},
					{ID=80563,Num=200,Bind=1},
				},


		--蛋包
		[945] = {
					{ID=80487,Num=10,Bind=1},
				},


		--[特殊]中小型能量药水包
		[946] = {
					{ID=208,Num=50,Bind=1},
				},


		--[特殊]中小型生命药水包
		[947] = {
					{ID=119,Num=50,Bind=1},
				},



	--士气道具店
		--【公民】士气药酒包
		[953] = {
					{ID=306,Num=10},
				},

		--【男爵】士气药酒包
		[954] = {
					{ID=307,Num=10},
				},
				
		--【子爵】士气药酒包
		[955] = {
					{ID=308,Num=10},
				},
				
		--【公民】超级士气药酒包
		[956] = {
					{ID=309,Num=10},
				},
				
		--【男爵】超级士气药酒包
		[957] = {
					{ID=310,Num=10},
				},
				
		--【子爵】超级士气药酒包
		[958] = {
					{ID=311,Num=10},
				},
				
		--【公民】超级点金手套包
		[959] = {
					{ID=312,Num=10},
				},
				
		--【男爵】超级点金手套包
		[960] = {
					{ID=313,Num=10},
				},
				
		--【子爵】超级点金手套包
		[961] = {
					{ID=314,Num=10},
				},


	--时装店
		--女管家时装包
		[966] = {
					{ID=10911,Num=1},
					{ID=10912,Num=1},
					NeedPoint = 1000,
				},

		--乖乖男时装包
		[967] = {
					{ID=10948,Num=1},
					{ID=10949,Num=1},
					NeedPoint = 1000,
				},
}




function GoodsPackage_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	ActorID = ActorID or API_RequestGetActorID()
	GoodsID = GoodsID or API_RequestGetNumber(2)
	local Agree = API_RequestGetNumber(1)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if GLOBAL_GoodsPackage_GoodsIDList[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'非法物品')
		return 0
	end
	local NeedPoint = GLOBAL_GoodsPackage_GoodsIDList[GoodsID].NeedPoint
	if NeedPoint ~= nil and NeedPoint > 0 and Agree ~= 100 then
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		API_ResponseWrite('<text>'..API_GetGoodsName(GoodsID)..'里面有这些的礼物：</text><br>')
		for i in GLOBAL_GoodsPackage_GoodsIDList[GoodsID] do
			if type(GLOBAL_GoodsPackage_GoodsIDList[GoodsID][i]) == 'table' then
				local ExchangeGoodsID = GLOBAL_GoodsPackage_GoodsIDList[GoodsID][i].ID
				local ExchangeGoodsNum = GLOBAL_GoodsPackage_GoodsIDList[GoodsID][i].Num
				local ExchangeGoodsName = API_GetGoodsName(ExchangeGoodsID)
				API_ResponseWrite('<br><img srcgd="'..ExchangeGoodsID..'" tipgd="'..ExchangeGoodsID..'"><text color="254,249,220"> '..ExchangeGoodsName..'</text><text> × '..ExchangeGoodsNum..' </text>')
			end
		end
		API_ResponseWrite('<br><text>您需要 </text><text color="255,0,255">'..NeedPoint..' 点券</text><text>才能打开它，您确定要打开它吗？</text><br>')
		API_ResponseWrite('<br><a href="GoodsPackage_GoodsCallFunc?1=100&2='..GoodsID..'">立刻花 '..NeedPoint..' 点券打开它</a><br>')
		API_ResponseWrite('<br><a>先不打开，以后再说</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	if NeedPoint ~= nil and NeedPoint > 0 then
		local Point = API_ActorGetPropNum(ActorID,183)
		if Point < NeedPoint then
			API_ActorSendMsg(ActorID,3,'打开'..API_GetGoodsName(GoodsID)..'需要 '..NeedPoint..' 点券，您的点券不够')
			return 0
		end
	end
	local NeedPackageSize = 0
	for i in GLOBAL_GoodsPackage_GoodsIDList[GoodsID] do
		if type(GLOBAL_GoodsPackage_GoodsIDList[GoodsID][i]) == 'table' then
			local ExchangeGoodsID = GLOBAL_GoodsPackage_GoodsIDList[GoodsID][i].ID
			local ExchangeGoodsNum = GLOBAL_GoodsPackage_GoodsIDList[GoodsID][i].Num
			local Bind = GLOBAL_GoodsPackage_GoodsIDList[GoodsID][i].Bind
			if Bind == nil then
				Bind = 0	
			end
			
			local AddPackageSize = API_ActorCanAddGoods(ActorID,ExchangeGoodsID,ExchangeGoodsNum,Bind,NeedPackageSize)
			if AddPackageSize == - 1 then
				NeedPackageSize = AddPackageSize
				break
			else
				NeedPackageSize = NeedPackageSize + AddPackageSize
			end
		end
	end
	if Agree == 100 or NeedPoint == nil or NeedPoint == 0 then
		if NeedPackageSize ~= -1 then
			local GoodsName = API_GetGoodsName(GoodsID)
			if NeedPoint ~= nil and NeedPoint > 0 then
				if API_UsePoint(ActorID,3,GoodsID,1,NeedPoint) ~= 0 then
					return 0
				else
					API_ActorSendMsg(ActorID,9,'开启'..GoodsName..'扣除'..NeedPoint..'点券')
				end
			end
			if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用'..GoodsName..'') then
				for i in GLOBAL_GoodsPackage_GoodsIDList[GoodsID] do
					if type(GLOBAL_GoodsPackage_GoodsIDList[GoodsID][i]) == 'table' then
						local ExchangeGoodsID = GLOBAL_GoodsPackage_GoodsIDList[GoodsID][i].ID
						local ExchangeGoodsNum = GLOBAL_GoodsPackage_GoodsIDList[GoodsID][i].Num
						local ExchangeGoodsName = API_GetGoodsName(ExchangeGoodsID)
						local Bind = GLOBAL_GoodsPackage_GoodsIDList[GoodsID][i].Bind
						if Bind == nil then
							Bind = 0
						end
						API_AddActorGoodsFlag(ActorID,ExchangeGoodsID,ExchangeGoodsNum,Bind,'使用'..GoodsName..'')
						API_ActorSendMsg(ActorID,3,'您得到 '..ExchangeGoodsName..' X '..ExchangeGoodsNum..'')
					end
				end
			end
		else
			API_ActorSendMsg(ActorID,3,'您的背包空间不足')
			return 0
		end
	end
	return 1
end
