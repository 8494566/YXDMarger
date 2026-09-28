----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\BaoXiang.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-5-16
--版  本:	1.0
--描  述:	宝箱使用函数
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-5-16
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修 改 人：黄蕾
--修改时间：20120327
--修改内容：增加可使用物品函数 HL_BoxAndGoods
----------------------------------------------------------------------------------------------------------------------

--宝箱兑换列表
GLOBAL_BaoXiang_GoodsIDList={
--特殊时装宝箱（可用神奇钥匙开启，出特殊时装）
[728] = {
		GoodList={
					{ID=11721,Num=1,},
					{ID=11722,Num=1,},
					{ID=11723,Num=1,},
					},
		NeedKey=80454,
		KeyNum=1,
		},

--神奇宝箱（可用神奇钥匙开启，出特殊时装）
[729] = {
		GoodList={
					{ID=11721,Num=1,},
					{ID=11722,Num=1,},
					{ID=11723,Num=1,},
					},
		NeedKey=80454,
		KeyNum=2,
		},
		
--1档武器盾配方宝箱
[730] = {
		GoodList={
					{ID=80048,Num=1,},
					},
		NeedKey=80454,
		KeyNum=1,
		},
		
--1档饰品配方宝箱
[731] = {
		GoodList={
					{ID=80133,Num=1,},
					},
		NeedKey=80454,
		KeyNum=1,
		},
		
--1档手套配方宝箱
[732] = {
		GoodList={
					{ID=80093,Num=1,},
					},
		NeedKey=80454,
		KeyNum=1,
		},
		
--1档鞋子配方宝箱
[733] = {
		GoodList={
					{ID=80103,Num=1,},
					},
		NeedKey=80454,
		KeyNum=1,
		},

--1档护腿配方宝箱
[734] = {
		GoodList={
					{ID=80113,Num=1,},
					},
		NeedKey=80454,
		KeyNum=1,
		},
		
--1档腰带配方宝箱
[735] = {
		GoodList={
					{ID=80123,Num=1,},
					},
		NeedKey=80454,
		KeyNum=1,
		},
		
--1档神秘配方宝箱
[736] = {
		GoodList={
					{ID=80083,Num=1,},
					{ID=80064,Num=1,},
					{ID=80048,Num=1,},
					{ID=80133,Num=1,},
					{ID=80093,Num=1,},
					{ID=80103,Num=1,},
					{ID=80113,Num=1,},
					{ID=80123,Num=1,},
					},
		NeedKey=80454,
		KeyNum=1,
		NeedPackageSize=1,
		},
		
--2档帽子配方宝箱
[737] = {
		GoodList={
					{ID=80084,Num=1,},
					},
		NeedKey=80454,
		KeyNum=2,
		},
		
--2档衣服配方宝箱
[738] = {
		GoodList={
					{ID=80065,Num=1,},
					},
		NeedKey=80454,
		KeyNum=2,
		},
		
--2档武器盾配方宝箱
[739] = {
		GoodList={
					{ID=80049,Num=1,},
					},
		NeedKey=80454,
		KeyNum=2,
		},
		
--2档饰品配方宝箱
[740] = {
		GoodList={
					{ID=80134,Num=1,},
					},
		NeedKey=80454,
		KeyNum=2,
		},
		
--2档手套配方宝箱
[741] = {
		GoodList={
					{ID=80094,Num=1,},
					},
		NeedKey=80454,
		KeyNum=2,
		},
		
--2档鞋子配方宝箱
[742] = {
		GoodList={
					{ID=80104,Num=1,},
					},
		NeedKey=80454,
		KeyNum=2,
		},
		
--2档护腿配方宝箱
[743] = {
		GoodList={
					{ID=80114,Num=1,},
					},
		NeedKey=80454,
		KeyNum=2,
		},
		
--2档腰带配方宝箱
[744] = {
		GoodList={
					{ID=80124,Num=1,},
					},
		NeedKey=80454,
		KeyNum=2,
		},
		
--2档神秘配方宝箱
[745] = {
		GoodList={
					{ID=80084,Num=1,},
					{ID=80065,Num=1,},
					{ID=80049,Num=1,},
					{ID=80134,Num=1,},
					{ID=80094,Num=1,},
					{ID=80104,Num=1,},
					{ID=80114,Num=1,},
					{ID=80124,Num=1,},
					},
		NeedKey=80454,
		KeyNum=2,
		NeedPackageSize=1,
		},
		
--3档帽子配方宝箱
[746] = {
		GoodList={
					{ID=80085,Num=1,},
					},
		NeedKey=80454,
		KeyNum=3,
		},
		
--3档衣服配方宝箱
[747] = {
		GoodList={
					{ID=80066,Num=1,},
					},
		NeedKey=80454,
		KeyNum=3,
		},
		
--3档武器盾配方宝箱
[748] = {
		GoodList={
					{ID=80050,Num=1,},
					},
		NeedKey=80454,
		KeyNum=3,
		},
		
--3档饰品配方宝箱
[749] = {
		GoodList={
					{ID=80135,Num=1,},
					},
		NeedKey=80454,
		KeyNum=3,
		},
		
--3档手套配方宝箱
[750] = {
		GoodList={
					{ID=80095,Num=1,},
					},
		NeedKey=80454,
		KeyNum=3,
		},
		
--3档鞋子配方宝箱
[751] = {
		GoodList={
					{ID=80105,Num=1,},
					},
		NeedKey=80454,
		KeyNum=3,
		},
		
--3档护腿配方宝箱
[752] = {
		GoodList={
					{ID=80115,Num=1,},
					},
		NeedKey=80454,
		KeyNum=3,
		},
		
--3档腰带配方宝箱
[753] = {
		GoodList={
					{ID=80125,Num=1,},
					},
		NeedKey=80454,
		KeyNum=3,
		},

--3档神秘配方宝箱
[754] = {
		GoodList={
					{ID=80085,Num=1,},
					{ID=80066,Num=1,},
					{ID=80050,Num=1,},
					{ID=80135,Num=1,},
					{ID=80095,Num=1,},
					{ID=80105,Num=1,},
					{ID=80115,Num=1,},
					{ID=80125,Num=1,},
					},
		NeedKey=80454,
		KeyNum=3,
		NeedPackageSize=1,
		},

		
--4档帽子配方宝箱		
[755] = {
		GoodList={
					{ID=80086,Num=1,},
					},
		NeedKey=80454,
		KeyNum=4,
		},
		
--4档衣服配方宝箱
[756] = {
		GoodList={
					{ID=80067,Num=1,},
					},
		NeedKey=80454,
		KeyNum=4,
		},
		
--4档武器盾配方宝箱
[757] = {
		GoodList={
					{ID=80051,Num=1,},
					},
		NeedKey=80454,
		KeyNum=4,
		},
		
--4档饰品配方宝箱
[758] = {
		GoodList={
					{ID=80136,Num=1,},
					},
		NeedKey=80454,
		KeyNum=4,
		},
		
--4档手套配方宝箱
[759] = {
		GoodList={
					{ID=80096,Num=1,},
					},
		NeedKey=80454,
		KeyNum=4,
		},
		
--4档鞋子配方宝箱
[760] = {
		GoodList={
					{ID=80106,Num=1,},
					},
		NeedKey=80454,
		KeyNum=4,
		},
		
--4档护腿配方宝箱
[761] = {
		GoodList={
					{ID=80116,Num=1,},
					},
		NeedKey=80454,
		KeyNum=4,
		},
		
--4档腰带配方宝箱
[762] = {
		GoodList={
					{ID=80126,Num=1,},
					},
		NeedKey=80454,
		KeyNum=4,
		},
		
--4档神秘配方宝箱
[763] = {
		GoodList={
					{ID=80086,Num=1,},
					{ID=80067,Num=1,},
					{ID=80051,Num=1,},
					{ID=80136,Num=1,},
					{ID=80096,Num=1,},
					{ID=80106,Num=1,},
					{ID=80116,Num=1,},
					{ID=80126,Num=1,},
					},
		NeedKey=80454,
		KeyNum=4,
		NeedPackageSize=1,
		},
		
--1档升级魔盒宝箱
[764] = {
		GoodList={
					{ID=80381,Num=1,},
					},
		NeedKey=80455,
		KeyNum=1,
		},
		
--2档升级魔盒宝箱
[782] = {
		GoodList={
					{ID=80382,Num=1,},
					},
		NeedKey=80455,
		KeyNum=2,
		},
}


function SkillGoods_BaoXiang_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	ActorID = ActorID or API_RequestGetActorID()
	GoodsID = GoodsID or API_RequestGetNumber(2)
	local Agree = API_RequestGetNumber(1)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if GLOBAL_BaoXiang_GoodsIDList[GoodsID] == nil then
		return 0
	end
	local KeyID = GLOBAL_BaoXiang_GoodsIDList[GoodsID].NeedKey
	local KeyNum = GLOBAL_BaoXiang_GoodsIDList[GoodsID].KeyNum
	if KeyNum == nil then
		KeyNum = 0
	end
	local NeedPackageSize = GLOBAL_BaoXiang_GoodsIDList[GoodsID].NeedPackageSize
	local TiDaiKeyID = 80563
	if KeyID == 80455 then
		TiDaiKeyID = 80564
	end
	if KeyNum > 0 then
		if API_ActorGetGoodsNum(ActorID,KeyID) < KeyNum and API_ActorGetGoodsNum(ActorID,TiDaiKeyID) < KeyNum then
			API_ActorSendMsg(ActorID,2,''..API_GetGoodsName(GoodsID)..' 被 '..PublicFun_ArabianNumberToChineseNumber(KeyNum)..'把锁牢牢锁着')
			API_ActorSendMsg(ActorID,2,'需要 '..PublicFun_ArabianNumberToChineseNumber(KeyNum)..'把'..API_GetGoodsName(KeyID)..' 才能打开')
			API_ActorSendMsg(ActorID,2,'您身上的 '..API_GetGoodsName(KeyID)..' 数量不足(绑定和非绑定'..API_GetGoodsName(KeyID)..'不能混合使用)')
			API_ActorSendMsg(ActorID,2,'请点击右下角的“商城”按钮购买 '..API_GetGoodsName(KeyID)..'')
			return 0
		end
	end
	local ZhongGaiLv = 0
	for i = 1,table.getn(GLOBAL_BaoXiang_GoodsIDList[GoodsID].GoodList) do
		if GLOBAL_BaoXiang_GoodsIDList[GoodsID].GoodList[i].Gailv == nil then
			ZhongGaiLv = ZhongGaiLv + 1
		else
			ZhongGaiLv = ZhongGaiLv + GLOBAL_BaoXiang_GoodsIDList[GoodsID].GoodList[i].Gailv
		end
	end
	local Luodian = math.random(ZhongGaiLv)
	local NowGaiLv = 0
	local Xuhao = 1
	for i = 1,table.getn(GLOBAL_BaoXiang_GoodsIDList[GoodsID].GoodList) do
		if GLOBAL_BaoXiang_GoodsIDList[GoodsID].GoodList[i].Gailv == nil then
			NowGaiLv = NowGaiLv + 1
		else
			NowGaiLv = NowGaiLv + GLOBAL_BaoXiang_GoodsIDList[GoodsID].GoodList[i].Gailv
		end
		if Luodian <= NowGaiLv then
			Xuhao = i
			break
		end
	end
	local ExchangeNo = GLOBAL_BaoXiang_GoodsIDList[GoodsID].GoodList[Xuhao]
	local ExchangeGoodID = ExchangeNo.ID
	local ExchangeGoodNum = ExchangeNo.Num
	if type(ExchangeGoodNum) == 'table' then
		ExchangeGoodNum = math.random(ExchangeGoodNum.Min,ExchangeGoodNum.Max)
	end
	if ExchangeGoodNum == 0 then
		return 0
	end
	local GrantOpen = 0
	local Band = 0
	if KeyNum > 0 then
		if API_ActorGetGoodsNum(ActorID,KeyID) >= KeyNum then
			if API_ActorRemoveGoods(ActorID,KeyID,KeyNum,'开宝箱删钥匙') then
				GrantOpen = 1
			end
		elseif API_ActorGetGoodsNum(ActorID,TiDaiKeyID) >= KeyNum then
			if Agree ~= 100 then
				API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
				API_ResponseWrite('<br><text>您身上</text><text color="255,0,0"> 未绑定 </text><text>的 </text><img srcgd="'..KeyID..'" tipgd="'..KeyID..'"><text color="254,249,220"> '..API_GetGoodsName(KeyID)..' </text><text>数量不足</text><text color="255,0,255"> '..KeyNum..' </text><text>把</text><br>')
				API_ResponseWrite('<br><text>你可以选择使用</text><text color="255,0,255"> '..KeyNum..' </text><text>把</text><text color="255,0,0"> 已绑定 </text><text>的 </text><img srcgd="'..TiDaiKeyID..'" tipgd="'..TiDaiKeyID..'"><text color="254,249,220"> '..API_GetGoodsName(TiDaiKeyID)..' </text><text>来打开 </text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><text color="254,249,220"> '..API_GetGoodsName(GoodsID)..' </text><br>')
				API_ResponseWrite('<text color="255,0,255">但打开后得到的物品将被绑定</text><br>')
				API_ResponseWrite('<text>您确定要打开它吗？</text><br>')
				API_ResponseWrite('<br><a href="SkillGoods_BaoXiang_GoodsCallFunc?1=100&2='..GoodsID..'">立刻打开它</a><br>')
				API_ResponseWrite('<br><a>先不打开，以后再说</a><br>')
				API_ResponseFlush(ActorID)
				return 0
			else
				if API_ActorRemoveGoods(ActorID,TiDaiKeyID,KeyNum,'开宝箱删钥匙') then
					GrantOpen = 1
					Band = 3
				end
			end
		end
	else
		GrantOpen = 1
	end
	if GrantOpen == 1 then
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'开宝箱删宝箱') then
			if ExchangeGoodID == 'Money' and ExchangeGoodNum > 0 then
				if NeedPackageSize == nil or API_ActorGetPackageSize(ActorID) >= NeedPackageSize then
					API_ActorAddMoney(ActorID,ExchangeGoodNum,2108,'开宝箱得金币')
					local tipinfo = '您'
					if KeyNum > 0 then
						tipinfo = tipinfo..'使用'..PublicFun_ArabianNumberToChineseNumber(KeyNum)..'把'..API_GetGoodsName(KeyID)..''
					end
					tipinfo = tipinfo..'打开了'..API_GetGoodsName(GoodsID)..''
					API_ActorSendMsg(ActorID,2,''..tipinfo..'')
					API_ActorSendMsg(ActorID,2,'从宝箱中得到 '..ExchangeGoodNum..' 金币')
					return 1
				else
					API_ActorSendMsg(ActorID,2,'背包空间不够，无法打开宝箱')
					if KeyNum > 0 then
						if Band == 0 then
							API_AddActorGoods(ActorID,KeyID,KeyNum,'开宝箱返还钥匙')
						else
							API_AddActorGoods(ActorID,TiDaiKeyID,KeyNum,'开宝箱返还钥匙')
						end
					end
					API_AddActorGoods(ActorID,GoodsID,1,'开宝箱返还宝箱')
					return 0
				end
			elseif ExchangeGoodID == 'Exp' and ExchangeGoodNum > 0 then
				if NeedPackageSize == nil or API_ActorGetPackageSize(ActorID) >= NeedPackageSize then
					API_ActorAddExp(ActorID,ExchangeGoodNum,2108,'开宝箱得经验')
					local tipinfo = '您'
					if KeyNum > 0 then
						tipinfo = tipinfo..'使用'..PublicFun_ArabianNumberToChineseNumber(KeyNum)..'把'..API_GetGoodsName(KeyID)..''
					end
					tipinfo = tipinfo..'打开了'..API_GetGoodsName(GoodsID)..''
					API_ActorSendMsg(ActorID,2,''..tipinfo..'')
					API_ActorSendMsg(ActorID,2,'从宝箱中得到 '..ExchangeGoodNum..' 经验')
					return 1
				else
					API_ActorSendMsg(ActorID,2,'背包空间不够，无法打开宝箱')
					if KeyNum > 0 then
						if Band == 0 then
							API_AddActorGoods(ActorID,KeyID,KeyNum,'开宝箱返还钥匙')
						else
							API_AddActorGoods(ActorID,TiDaiKeyID,KeyNum,'开宝箱返还钥匙')
						end
					end
					API_AddActorGoods(ActorID,GoodsID,1,'开宝箱返还宝箱')
					return 0
				end
			elseif type(ExchangeGoodID) == 'number' and ExchangeGoodID > 0 and ExchangeGoodNum > 0 then
				if API_ActorCanAddGoods(ActorID,ExchangeGoodID,ExchangeGoodNum,Band,0) ~= -1 and (NeedPackageSize == nil or API_ActorGetPackageSize(ActorID) >= NeedPackageSize) then
					API_AddActorGoodsFlag(ActorID,ExchangeGoodID,ExchangeGoodNum,Band,'开宝箱得物品')
					local tipinfo = '您'
					if KeyNum > 0 then
						tipinfo = tipinfo..'使用'..PublicFun_ArabianNumberToChineseNumber(KeyNum)..'把'..API_GetGoodsName(KeyID)..''
					end
					tipinfo = tipinfo..'打开了'..API_GetGoodsName(GoodsID)..''
					API_ActorSendMsg(ActorID,2,''..tipinfo..'')
					API_ActorSendMsg(ActorID,2,'从宝箱中得到 '..API_GetGoodsName(ExchangeGoodID)..' X '..ExchangeGoodNum..'')
					return 1
				else
					API_ActorSendMsg(ActorID,2,'背包空间不够，无法打开宝箱')
					if KeyNum > 0 then
						if Band == 0 then
							API_AddActorGoods(ActorID,KeyID,KeyNum,'开宝箱返还钥匙')
						else
							API_AddActorGoods(ActorID,TiDaiKeyID,KeyNum,'开宝箱返还钥匙')
						end
					end
					API_AddActorGoods(ActorID,GoodsID,1,'开宝箱返还宝箱')
					return 0
				end
			end
		else
			return 0
		end
	else
		return 0
	end
	return 1
end


--潘多拉之盒
GLOBAL_PandoraBox_List = {
[829] = {
		[1] = {
				GoodList={
							{ID='Exp',Num={Min=1728,Max=2112},Gailv=5000},
							{ID='Money',Num={Min=530,Max=636},Gailv=5000},
							},
				NeedPackageSize=1,
				NeedMoney=0,
				},
		[2] = {
				GoodList={
							{ID='Exp',Num={Min=4752,Max=5808},Gailv=5000},
							{ID='Money',Num={Min=600,Max=720},Gailv=5000},
							},
				NeedPackageSize=1,
				NeedMoney=0,
				},
		[3] = {
				GoodList={						
							{ID='Exp',Num={Min=7344,Max=8976},Gailv=5000},
							{ID='Money',Num={Min=730,Max=876},Gailv=5000},
							},
				NeedPackageSize=1,
				NeedMoney=0,
				},
		[4] = {
				GoodList={
							{ID='Exp',Num={Min=20736,Max=25344},Gailv=5000},
							{ID='Money',Num={Min=1070,Max=1284},Gailv=5000},
							},
				NeedPackageSize=1,
				NeedMoney=0,
				},
		[5] = {
				GoodList={
							{ID='Exp',Num={Min=27648,Max=33792},Gailv=5000},
							{ID='Money',Num={Min=1650,Max=1980},Gailv=5000},
							},
				NeedPackageSize=1,
				NeedMoney=0,
				},
		[6] = {
				GoodList={
							{ID='Exp',Num={Min=42552,Max=52008},Gailv=5000},
							{ID='Money',Num={Min=2300,Max=2760},Gailv=5000},
							},
				NeedPackageSize=1,
				NeedMoney=0,
				},
		[7] = {
				GoodList={
							{ID='Exp',Num={Min=42552,Max=52008},Gailv=5000},
							{ID='Money',Num={Min=3010,Max=3612},Gailv=5000},
							},
				NeedPackageSize=1,
				NeedMoney=0,
				},
		[8] = {
				GoodList={
							{ID='Exp',Num={Min=58059,Max=70961},Gailv=5000},
							{ID='Money',Num={Min=3790,Max=4548},Gailv=5000},
							},
				NeedPackageSize=1,
				NeedMoney=0,
				},
		[9] = {
				GoodList={
							{ID=80050,Num=1,Gailv=204},
							{ID=80066,Num=1,Gailv=151},
							{ID=80085,Num=1,Gailv=93},
							{ID=80095,Num=1,Gailv=98},
							{ID=80105,Num=1,Gailv=47},
							{ID=80115,Num=1,Gailv=46},
							{ID=80125,Num=1,Gailv=40},
							{ID=80135,Num=1,Gailv=49},
							{ID=80181,Num=1,Gailv=647},
							{ID=80192,Num=1,Gailv=51},
							{ID=80383,Num=1,Gailv=722},
							{ID=80384,Num=1,Gailv=111},
							{ID=80405,Num=1,Gailv=53},
							{ID=80409,Num=1,Gailv=52},
							{ID=782,Num=1,Gailv=2310},
							{ID=27,Num=1,Gailv=1000},	
							{ID=80279,Num=1,Gailv=93},
							{ID=80280,Num=1,Gailv=11},
							{ID=80400,Num=1,Gailv=11},
							{ID=80458,Num=1,Gailv=2},
							{ID=80459,Num=1,Gailv=2},
							{ID=80460,Num=1,Gailv=1},
							{ID=80461,Num=1,Gailv=2},
							{ID=80462,Num=1,Gailv=2},
							{ID=80463,Num=1,Gailv=3},
							{ID=80464,Num=1,Gailv=2},
							{ID=80465,Num=1,Gailv=3},
							{ID=80466,Num=1,Gailv=2},
							{ID=80550,Num=1,Gailv=15},
							{ID=80551,Num=1,Gailv=15},
							{ID=80552,Num=1,Gailv=15},
							{ID=80554,Num=1,Gailv=15},
							{ID=80555,Num=1,Gailv=15},
							{ID=40204,Num=1,Gailv=5},
							{ID=40206,Num=1,Gailv=3},
							{ID=40220,Num=1,Gailv=5},
							{ID=40222,Num=1,Gailv=3},
							{ID=40236,Num=1,Gailv=5},
							{ID=40238,Num=1,Gailv=3},
							{ID=40252,Num=1,Gailv=7},
							{ID=40268,Num=1,Gailv=7},
							{ID=40270,Num=1,Gailv=4},
							{ID='Exp',Num={Min=300,Max=2244},Gailv=19771},
							{ID='Money',Num={Min=500,Max=4500},Gailv=4000},
							},
				NeedPackageSize=1,
				NeedMoney=0,
				},
		[10] = {
				GoodList={
							{ID=80050,Num=1,Gailv=204},
							{ID=80066,Num=1,Gailv=151},
							{ID=80085,Num=1,Gailv=93},
							{ID=80095,Num=1,Gailv=98},
							{ID=80105,Num=1,Gailv=47},
							{ID=80115,Num=1,Gailv=46},
							{ID=80125,Num=1,Gailv=40},
							{ID=80135,Num=1,Gailv=49},
							{ID=80181,Num=1,Gailv=647},
							{ID=80192,Num=1,Gailv=51},
							{ID=80383,Num=1,Gailv=722},
							{ID=80384,Num=1,Gailv=111},
							{ID=80405,Num=1,Gailv=53},
							{ID=80409,Num=1,Gailv=52},
							{ID=782,Num=1,Gailv=2310},
							{ID=27,Num=1,Gailv=1000},	
							{ID=80279,Num=1,Gailv=93},
							{ID=80280,Num=1,Gailv=11},
							{ID=80400,Num=1,Gailv=11},
							{ID=80458,Num=1,Gailv=2},
							{ID=80459,Num=1,Gailv=2},
							{ID=80460,Num=1,Gailv=1},
							{ID=80461,Num=1,Gailv=2},
							{ID=80462,Num=1,Gailv=2},
							{ID=80463,Num=1,Gailv=3},
							{ID=80464,Num=1,Gailv=2},
							{ID=80465,Num=1,Gailv=3},
							{ID=80466,Num=1,Gailv=2},
							{ID=80550,Num=1,Gailv=15},
							{ID=80551,Num=1,Gailv=15},
							{ID=80552,Num=1,Gailv=15},
							{ID=80554,Num=1,Gailv=15},
							{ID=80555,Num=1,Gailv=15},
							{ID=40204,Num=1,Gailv=5},
							{ID=40206,Num=1,Gailv=3},
							{ID=40220,Num=1,Gailv=5},
							{ID=40222,Num=1,Gailv=3},
							{ID=40236,Num=1,Gailv=5},
							{ID=40238,Num=1,Gailv=3},
							{ID=40252,Num=1,Gailv=7},
							{ID=40268,Num=1,Gailv=7},
							{ID=40270,Num=1,Gailv=4},
							{ID='Exp',Num={Min=300,Max=2244},Gailv=19771},
							{ID='Money',Num={Min=500,Max=4500},Gailv=4000},
							},
				NeedPackageSize=1,
				NeedMoney=0,
				},
		[11] = {
				GoodList={
							{ID=80050,Num=1,Gailv=204},
							{ID=80066,Num=1,Gailv=151},
							{ID=80085,Num=1,Gailv=93},
							{ID=80095,Num=1,Gailv=98},
							{ID=80105,Num=1,Gailv=47},
							{ID=80115,Num=1,Gailv=46},
							{ID=80125,Num=1,Gailv=40},
							{ID=80135,Num=1,Gailv=49},
							{ID=80181,Num=1,Gailv=647},
							{ID=80192,Num=1,Gailv=51},
							{ID=80383,Num=1,Gailv=722},
							{ID=80384,Num=1,Gailv=111},
							{ID=80405,Num=1,Gailv=53},
							{ID=80409,Num=1,Gailv=52},
							{ID=782,Num=1,Gailv=2310},
							{ID=27,Num=1,Gailv=1000},	
							{ID=80279,Num=1,Gailv=93},
							{ID=80280,Num=1,Gailv=11},
							{ID=80400,Num=1,Gailv=11},
							{ID=80458,Num=1,Gailv=2},
							{ID=80459,Num=1,Gailv=2},
							{ID=80460,Num=1,Gailv=1},
							{ID=80461,Num=1,Gailv=2},
							{ID=80462,Num=1,Gailv=2},
							{ID=80463,Num=1,Gailv=3},
							{ID=80464,Num=1,Gailv=2},
							{ID=80465,Num=1,Gailv=3},
							{ID=80466,Num=1,Gailv=2},
							{ID=80550,Num=1,Gailv=15},
							{ID=80551,Num=1,Gailv=15},
							{ID=80552,Num=1,Gailv=15},
							{ID=80554,Num=1,Gailv=15},
							{ID=80555,Num=1,Gailv=15},
							{ID=40204,Num=1,Gailv=5},
							{ID=40206,Num=1,Gailv=3},
							{ID=40220,Num=1,Gailv=5},
							{ID=40222,Num=1,Gailv=3},
							{ID=40236,Num=1,Gailv=5},
							{ID=40238,Num=1,Gailv=3},
							{ID=40252,Num=1,Gailv=7},
							{ID=40268,Num=1,Gailv=7},
							{ID=40270,Num=1,Gailv=4},
							{ID='Exp',Num={Min=300,Max=2244},Gailv=19771},
							{ID='Money',Num={Min=500,Max=4500},Gailv=4000},
							},
				NeedPackageSize=1,
				NeedMoney=0,
				},
		},
}

function PandoraBox_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	ActorID = ActorID or API_RequestGetActorID()
	GoodsID = GoodsID or API_RequestGetNumber(2)
	local Agree = API_RequestGetNumber(1)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if GLOBAL_PandoraBox_List[GoodsID] == nil then
		return 0
	end
	local Peerage = API_GetActorPeerageLevel(ActorID)
	if GLOBAL_PandoraBox_List[GoodsID][Peerage] == nil then
		return 0
	end
	local NeedMoney = GLOBAL_PandoraBox_List[GoodsID][Peerage].NeedMoney
	if NeedMoney == nil then
		NeedMoney = 0
	end
	local NeedPackageSize = GLOBAL_PandoraBox_List[GoodsID][Peerage].NeedPackageSize
	if NeedMoney > 0 then
		if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) < NeedMoney then
			API_ActorSendMsg(ActorID,2,'开启 '..API_GetGoodsName(GoodsID)..' 需要 '..NeedMoney..' 金币，您身上的金币数量不足')
			return 0
		end
	end
	local ZhongGaiLv = 0
	for i = 1,table.getn(GLOBAL_PandoraBox_List[GoodsID][Peerage].GoodList) do
		if GLOBAL_PandoraBox_List[GoodsID][Peerage].GoodList[i].Gailv == nil then
			ZhongGaiLv = ZhongGaiLv + 1
		else
			ZhongGaiLv = ZhongGaiLv + GLOBAL_PandoraBox_List[GoodsID][Peerage].GoodList[i].Gailv
		end
	end
	local Luodian = math.random(ZhongGaiLv)
	local NowGaiLv = 0
	local Xuhao = 1
	for i = 1,table.getn(GLOBAL_PandoraBox_List[GoodsID][Peerage].GoodList) do
		if GLOBAL_PandoraBox_List[GoodsID][Peerage].GoodList[i].Gailv == nil then
			NowGaiLv = NowGaiLv + 1
		else
			NowGaiLv = NowGaiLv + GLOBAL_PandoraBox_List[GoodsID][Peerage].GoodList[i].Gailv
		end
		if Luodian <= NowGaiLv then
			Xuhao = i
			break
		end
	end
	local ExchangeNo = GLOBAL_PandoraBox_List[GoodsID][Peerage].GoodList[Xuhao]
	local ExchangeGoodID = ExchangeNo.ID
	local ExchangeGoodNum = ExchangeNo.Num
	if type(ExchangeGoodNum) == 'table' then
		ExchangeGoodNum = math.random(ExchangeGoodNum.Min,ExchangeGoodNum.Max)
	end
	if ExchangeGoodNum == 0 then
		return 0
	end
	local GrantOpen = 0
	local Band = 0
	if NeedMoney > 0 then
		if API_ActorAddMoney(ActorID,-NeedMoney,0,'潘多拉盒子') then
			GrantOpen = 1
		end
	else
		GrantOpen = 1
	end
	if GrantOpen == 1 then
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'开宝箱删宝箱') then
			if ExchangeGoodID == 'Money' and ExchangeGoodNum > 0 then
				if NeedPackageSize == nil or API_ActorGetPackageSize(ActorID) >= NeedPackageSize then
					API_ActorAddMoney(ActorID,ExchangeGoodNum,0,'开潘多拉得金币')
					local tipinfo = '您'
					if NeedMoney > 0 then
						tipinfo = tipinfo..'花费 '..NeedMoney..' 金币'
					end
					tipinfo = tipinfo..'打开了'..API_GetGoodsName(GoodsID)..''
					API_ActorSendMsg(ActorID,2,''..tipinfo..'')
					API_ActorSendMsg(ActorID,2,'从宝箱中得到 '..ExchangeGoodNum..' 金币')
					return 1
				else
					API_ActorSendMsg(ActorID,2,'背包空间不够，无法打开'..API_GetGoodsName(GoodsID)..'')
					if NeedMoney > 0 then
						API_ActorAddMoney(ActorID,NeedMoney,0,'潘多拉返还金币')
					end
					API_AddActorGoods(ActorID,GoodsID,1,'开宝箱返还宝箱')
					return 0
				end
			elseif ExchangeGoodID == 'Exp' and ExchangeGoodNum > 0 then
				if NeedPackageSize == nil or API_ActorGetPackageSize(ActorID) >= NeedPackageSize then
					API_ActorAddExp(ActorID,ExchangeGoodNum,0,'开潘多拉得经验')
					local tipinfo = '您'
					if NeedMoney > 0 then
						tipinfo = tipinfo..'花费 '..NeedMoney..' 金币'
					end
					tipinfo = tipinfo..'打开了'..API_GetGoodsName(GoodsID)..''
					API_ActorSendMsg(ActorID,2,''..tipinfo..'')
					API_ActorSendMsg(ActorID,2,'从宝箱中得到 '..ExchangeGoodNum..' 经验')
					return 1
				else
					API_ActorSendMsg(ActorID,2,'背包空间不够，无法打开宝箱')
					if NeedMoney > 0 then
						API_ActorAddMoney(ActorID,NeedMoney,0,'潘多拉返还金币')
					end
					API_AddActorGoods(ActorID,GoodsID,1,'开宝箱返还宝箱')
					return 0
				end
			elseif type(ExchangeGoodID) == 'number' and ExchangeGoodID > 0 and ExchangeGoodNum > 0 then
				if API_ActorCanAddGoods(ActorID,ExchangeGoodID,ExchangeGoodNum,Band,0) ~= -1 and (NeedPackageSize == nil or API_ActorGetPackageSize(ActorID) >= NeedPackageSize) then
					API_ActorSendMsg(ActorID,10,'您花费 '..NeedMoney..' 金币打开了 '..API_GetGoodsName(GoodsID)..'')
					API_AddActorGoodsFlag(ActorID,ExchangeGoodID,ExchangeGoodNum,Band,'开潘多拉得物品')
					local tipinfo = '您'
					if NeedMoney > 0 then
						tipinfo = tipinfo..'花费 '..NeedMoney..' 金币'
					end
					tipinfo = tipinfo..'打开了'..API_GetGoodsName(GoodsID)..''
					API_ActorSendMsg(ActorID,2,''..tipinfo..'')
					API_ActorSendMsg(ActorID,2,'从宝箱中得到 '..API_GetGoodsName(ExchangeGoodID)..' X '..ExchangeGoodNum..'')
					return 1
				else
					API_ActorSendMsg(ActorID,2,'背包空间不够，无法打开宝箱')
					if NeedMoney > 0 then
						API_ActorAddMoney(ActorID,NeedMoney,0,'潘多拉返还金币')
					end
					API_AddActorGoods(ActorID,GoodsID,1,'开宝箱返还宝箱')
					return 0
				end
			end
		else
			return 0
		end
	else
		return 0
	end
	return 1

end




-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--远征军活动宝箱HL_BoxAndGoods  89160
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local HL2012_YZJGoodsTable = {
	
	[1] = {
			{GoodsID=39511,GaiLv1=1     ,GaiLv2=10715,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39504,GaiLv1=10716 ,GaiLv2=21431,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39514,GaiLv1=21432 ,GaiLv2=32147,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39505,GaiLv1=32148 ,GaiLv2=42863,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39506,GaiLv1=42864 ,GaiLv2=53579,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39517,GaiLv1=53580 ,GaiLv2=64295,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39520,GaiLv1=64296 ,GaiLv2=75011,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39523,GaiLv1=75012 ,GaiLv2=85727,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39526,GaiLv1=85728 ,GaiLv2=96443,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=39529,GaiLv1=96444 ,GaiLv2=107159,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80383,GaiLv1=107160,GaiLv2=171454,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80381,GaiLv1=171455,GaiLv2=235749,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80397,GaiLv1=235750,GaiLv2=396487,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=250  ,GaiLv1=396488,GaiLv2=610804,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80394,GaiLv1=610805,GaiLv2=825121,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40003,GaiLv1=825122,GaiLv2=1253754,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40013,GaiLv1=1253755,GaiLv2=1682387,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40023,GaiLv1=1682388,GaiLv2=2111020,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40093,GaiLv1=2111021,GaiLv2=2539653,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=76   ,GaiLv1=2539654,GaiLv2=2571801,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80949,GaiLv1=2571802,GaiLv2=2579838,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89040,GaiLv1=2579839,GaiLv2=2644133,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89041,GaiLv1=2644134,GaiLv2=2708428,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89042,GaiLv1=2708429,GaiLv2=2772723,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80686,GaiLv1=2772724,GaiLv2=2815587,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80689,GaiLv1=2815588,GaiLv2=2858451,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=31101,GaiLv1=2858452,GaiLv2=2922746,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80195,GaiLv1=2922747,GaiLv2=6137491,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80384,GaiLv1=6137492,GaiLv2=6201786,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80382,GaiLv1=6201787,GaiLv2=6266081,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40004,GaiLv1=6266082,GaiLv2=6394671,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40014,GaiLv1=6394672,GaiLv2=6523261,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40024,GaiLv1=6523262,GaiLv2=6651851,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=40094,GaiLv1=6651852,GaiLv2=6780441,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80387,GaiLv1=6780442,GaiLv2=6844736,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80196,GaiLv1=6844737,GaiLv2=7487685,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80197,GaiLv1=7487686,GaiLv2=7671385,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=75   ,GaiLv1=7671386,GaiLv2=7684244,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=82032,GaiLv1=7684245,GaiLv2=7693429,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80621,GaiLv1=7693430,GaiLv2=7757724,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=89079,GaiLv1=7757725,GaiLv2=7768440,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88171,GaiLv1=7768441,GaiLv2=7800588,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=88991,GaiLv1=7800589,GaiLv2=8014905,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80498,GaiLv1=8014906,GaiLv2=8657854,NumGaiLv=860,NumMax=10,NumMin=0},
			{GoodsID=80696,GaiLv1=8657855,GaiLv2=9300803,NumGaiLv=860,NumMax=10,NumMin=0},
			{GoodsID=80049,GaiLv1=9300804,GaiLv2=9365098,NumGaiLv=4300,NumMax=2,NumMin=0},
			{GoodsID=80050,GaiLv1=9365099,GaiLv2=9407962,NumGaiLv=4300,NumMax=2,NumMin=0},
			{GoodsID=80051,GaiLv1=9407963,GaiLv2=9440110,NumGaiLv=4300,NumMax=2,NumMin=0},
			{GoodsID=80065,GaiLv1=9440111,GaiLv2=9520479,NumGaiLv=4300,NumMax=2,NumMin=0},
			{GoodsID=80066,GaiLv1=9520480,GaiLv2=9574059,NumGaiLv=4300,NumMax=2,NumMin=0},
			{GoodsID=80067,GaiLv1=9574060,GaiLv2=9614244,NumGaiLv=4300,NumMax=2,NumMin=0},
			{GoodsID=88171,GaiLv1=9614245,GaiLv2=9678539,NumGaiLv=8600,NumMax=1,NumMin=0},
			{GoodsID=80274,GaiLv1=9678540,GaiLv2=10000000,NumGaiLv=8600,NumMax=1,NumMin=0},
			--{GoodsID=80949,GaiLv1=1,GaiLv2=10000000,NumGaiLv=8600,NumMax=1,NumMin=0},
		},

}
--创建奖励限制表
local tXianZhiGoods ={ 
	       [80949]={nGoodsID=80949,nMax= 10,Data=1,CDData=2,CDTime=30,},--晶源卡牌800点券
	       }
	       
--创建触发（某些奖励的特殊物品上限的时间触发器）
if API_GetServerID() == 1 then
	if shujiasoifehuang_JiangLiChongZhi ~= nil then
		API_DestroyTriggerG(shujiasoifehuang_JiangLiChongZhi)
	end
	
	shujiasoifehuang_JiangLiChongZhi = API_CreateTimerTriggerG(0,0,120,-1,'shujiasofiehuang_ShuJuQingChu')
	
end
function HL_BoxAndGoods(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	
	--API_Trace('调用HL_BoxAndGoods')
	local ActorID = ActorID or API_RequestGetActorID() 
	
	
	if API_ActorGetGoodsNum(ActorID,89160) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local JiangLiQuYu = 1
	local JiangLiTable = HL2012_YZJGoodsTable[JiangLiQuYu]
	local JiangLiGaiLv = math.random(10000000)
	
	for j in JiangLiTable do
		local GaiLv1 = JiangLiTable[j].GaiLv1
		local GaiLv2 = JiangLiTable[j].GaiLv2
		local NumGaiLv = JiangLiTable[j].NumGaiLv
		local JiangLiGoodsNum = JiangLiTable[j].NumMax
		local NumMin = JiangLiTable[j].NumMin
		local NumRandom = math.random(10000)
		--if NumRandom <= NumGaiLv then
		--	JiangLiGoodsNum = NumMax
		--else
		--	JiangLiGoodsNum = NumMin
		--end	
		if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
			local JiangLiGoodsID = JiangLiTable[j].GoodsID
				
			if API_ActorGetPackageSize(ActorID) < 1 then
				API_ResponseWrite('<name>荣誉宝箱</name>')
				API_ResponseWrite('<text>您的背包空间不足，请至少保留一个空格，再打开荣誉宝箱。</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
				API_ResponseFlush(ActorID)
				return 0					
			end
			if API_ActorGetGoodsNum(ActorID,89160) > 0 and API_ActorRemoveGoods(ActorID,89160,1,'删除荣誉宝箱') then
				--如果随机到的是宝石
				local PD = 0
				for j,v in baoshiwupinbiao do
					if JiangLiGoodsID == v then
						PD = 1
					end
				end
				if PD == 1 then
					fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
				else
					if JiangLiGoodsID == 76 then
						local nRandomXingNum = math.random(1,4) 
						local UID = API_AddActorGoodsPropRetUID(ActorID, JiangLiGoodsID, 1, 0, ''..API_GetGoodsName(JiangLiGoodsID)..'', -1, -1)
						API_SetUIDPetCapsulePropNum(ActorID, UID, 35, nRandomXingNum) 
						
					elseif  tXianZhiGoods[JiangLiGoodsID] ~= nil then
						local nMax = tXianZhiGoods[JiangLiGoodsID].nMax;
						local Data = tXianZhiGoods[JiangLiGoodsID].Data;
						local Num5 = API_VarDataGetNumber_Ex(1,0,-6182,1,Data)
						local CDData = tXianZhiGoods[JiangLiGoodsID].CDData;
						local CDTime = tXianZhiGoods[JiangLiGoodsID].CDTime;
						if Num5 >= nMax then
							API_AddActorGoods(ActorID,80498, 10, "给背包中加的物品");
							JiangLiGoodsID = 80498
							--API_Trace('11111')
						else
							local NowTime = os.time()
							--API_Trace('NowTime='..NowTime)
							--local NextTime = API_VarDataGetNumber_Ex(1,0,-6182,1,CDData)
							local NextTime = 0
							if NowTime >= NextTime then
								Num5 = Num5 + 1
								--API_Trace('小于Num5='..Num5)
								API_VarDataSetNumber_Ex_Sync(1,0,-6182,1,Data,Num5)
								API_AddActorGoods(ActorID,JiangLiGoodsID, 1, "给背包中加警员卡牌");
								--NextTime = NowTime + (CDTime * 60)
								--API_VarDataSetNumber_Ex_Sync(1,0,-6182,1,CDData,NextTime)
								--API_Trace('奖励物品特殊='..JiangLiGoodsID)
							else
								JiangLiGoodsID = 82032
								--API_Trace('NowTime='..NowTime)
							end
						end
						
					else
						API_AddActorGoodsFlag(ActorID,JiangLiGoodsID,JiangLiGoodsNum,3,'')
					end
				end
				API_ActorSendMsg(ActorID,8,''..API_GetActorName(ActorID)..'使用荣誉宝箱获得'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')
			
				return 1	
			else
				API_ActorSendMsg(ActorID,3,'扣除荣誉宝箱失败')
				return 0			
			end
		end
	end
end

function shujiasofiehuang_ShuJuQingChu()
--跨天12点清除：
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local NowTime = os.time()
	--API_Trace('111')
	if API_GetServerID() == 1 then
		if NowTime > API_VarDataGetNumber_Ex(1,0,-6182,1,101) then
			--API_Trace('222')
			API_VarDataSetNumber_Ex_Sync(1,0,-6182,1,1,0)
			local NowTime = os.date("*t", os.time()) 
			NowTime.year = Year
			NowTime.month = Month
			NowTime.day = Day
			NowTime.hour = 12 
			NowTime.min = 0 
			NowTime.sec = 0 
			local NextTime = os.time(NowTime) 
			RefreshTimeSofiehuangshabao = NextTime + 86400   
			API_VarDataSetNumber_Ex_Sync(1,0,-6182,1,101,RefreshTimeSofiehuangshabao)                  
		end
	end
end