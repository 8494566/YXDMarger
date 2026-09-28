----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\Jinlinbaohe.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-2-27
--版  本:	1.0
--描  述:	黄金宝箱使用函数
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-2-27
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------




--礼包打开次数
local LibaoOpen = 18067

--礼包物品ID
local LibaoID = {[0]=702,[1]=997,[2]=998,[3]=88047,[4]=88048,[5]=88049,[6]=88050,[7]=88051,[8]=88052,[9]=88053,[10]=88054,[11]=88084,[12]=88085,[13]=88086,[14]=88087,[15]=88088,[16]=88089,[17]=88090,[18]=88091,}
--[1]=物理,[2]=火药,[3]=魔法,QosLevel=装备品质

local Libao_GoodList={
[0] = {	NeedLv=1,
		List={
				{Type='Crystal',Num=2000},
				{Type='Goods',ID=997,Num=1,Lock=1},
				{Type='Goods',ID=101,Num=50,Lock=1},
				{Type='Goods',ID=201,Num=50,Lock=1},
				{Type='Goods',ID=31121,Num=100,Lock=1},
				{Type='Goods',ID=80249,Num=100,Lock=1},
				{Type='Goods',ID=9507,Num=2,Lock=1},
				},
		},
[1] = {	NeedLv=4,
		List={
				{Type='Exp',Num=400,},
				{Type='Crystal',Num=2000},
				{Type='Goods',ID=80049,Num=9999,Lock=1},
				{Type='Goods',ID=80050,Num=9999,Lock=1},
				{Type='Goods',ID=80051,Num=9999,Lock=1},
				{Type='Goods',ID=80065,Num=9999,Lock=1},
				{Type='Goods',ID=80066,Num=9999,Lock=1},
				{Type='Goods',ID=80067,Num=9999,Lock=1},
				{Type='Goods',ID=80002,Num=9999,Lock=1},
				{Type='Goods',ID=80004,Num=9999,Lock=1},
				{Type='Goods',ID=80006,Num=9999,Lock=1},
				{Type='Goods',ID=80013,Num=9999,Lock=1},
				{Type='Goods',ID=80014,Num=9999,Lock=1},
				{Type='Goods',ID=80015,Num=9999,Lock=1},
				{Type='Goods',ID=80019,Num=9999,Lock=1},
				{Type='Goods',ID=80020,Num=9999,Lock=1},
				{Type='Goods',ID=80021,Num=9999,Lock=1},
				{Type='Goods',ID=80037,Num=9999,Lock=1},
				{Type='Goods',ID=80038,Num=9999,Lock=1},
				{Type='Goods',ID=80039,Num=9999,Lock=1},
				{Type='Goods',ID=80195,Num=9999,Lock=1},
				{Type='Goods',ID=80196,Num=9999,Lock=1},
				{Type='Goods',ID=80197,Num=9999,Lock=1},
				{Type='Goods',ID=80381,Num=2000,Lock=1},
				{Type='Goods',ID=80382,Num=2000,Lock=1},
				{Type='Goods',ID=80383,Num=1000,Lock=1},
				{Type='Goods',ID=80384,Num=1000,Lock=1},
				{Type='Goods',ID=998,Num=1,Lock=1},
				},
		},
[2] = {	NeedLv=7,
		List={
				{Type='Exp',Num=700,},	
				{Type='Crystal',Num=2000},
				{Type='Goods',ID=89081,Num=1,Lock=1},
				{Type='Goods',ID=82004,Num=2000,Lock=1},
				{Type='Goods',ID=80832,Num=29997,Lock=1},
				{Type='Goods',ID=89199,Num=300,Lock=1},
				{Type='Goods',ID=78,Num=1,Lock=1},
				{Type='Goods',ID=32001,Num=1,Lock=1},
				{Type='Goods',ID=39703,Num=1,Lock=1},
				{Type='Goods',ID=31034,Num=1,Lock=1},
				{Type='Goods',ID=88047,Num=1,Lock=1},
				{Type='Goods',ID=88044,Num=1,Lock=1},
				{Type='Goods',ID=505,Num=1000,Lock=1},
				},
		},
[3] = {	NeedLv=10,
		List={
				{Type='Exp',Num=1400,},
				{Type='Crystal',Num=4000},
				{Type='Goods',ID=88048,Num=1,Lock=1},
				{Type='Goods',ID=88055,Num=2,Lock=1},
				},
		},
[4] = {	NeedLv=11,
		List={
				{Type='Exp',Num=3500,},
				{Type='Goods',ID=88049,Num=1,Lock=1},
				{Type='Goods',ID=501,Num=10,Lock=1},
				{Type='Goods',ID={[1]=80002,[2]=80019,[3]=80013},Num=70,Lock=1},
				{Type='Goods',ID={[1]=4101,[2]=5101,[3]=6101},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=4,make2=3},--装备
				{Type='Goods',ID=80065,Num=60,Lock=1},
				},
		},
[5] = {	NeedLv=13,
		List={
				{Type='Exp',Num=4000,},	
				{Type='Goods',ID=88050,Num=1,Lock=1},
				{Type='Goods',ID=9502,Num=1,Lock=1},
				{Type='Goods',ID=88055,Num=5,Lock=1},
				{Type='Goods',ID={[1]=4301,[2]=5301,[3]=6301},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=4401,[2]=5401,[3]=6401},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备			
				},
		},
[6] = {	NeedLv=16,
		List={
				{Type='Exp',Num=6000,},
				{Type='Goods',ID=88051,Num=1,Lock=1},
				{Type='Goods',ID=80381,Num=10,Lock=1},
				{Type='Goods',ID=80195,Num=10,Lock=1},
				{Type='Goods',ID={[1]=4001,[2]=5001,[3]=6001},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=4501,[2]=5501,[3]=6501},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=4201,[2]=5201,[3]=6201},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=4201,[2]=5201,[3]=6201},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备				
				},
		},
[7] = {	NeedLv=19,
		List={
				{Type='Exp',Num=8500,},
				{Type='Crystal',Num=10000},
				{Type='Goods',ID=88052,Num=1,Lock=1},
				{Type='Goods',ID=501,Num=20,Lock=1},
				{Type='Goods',ID=80381,Num=10,Lock=1},
				{Type='Goods',ID=80195,Num=10,Lock=1},
				{Type='Goods',ID={[1]=2001,[2]=1501,[3]=1001},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=6901,[2]=7001,[3]=8001},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=6901,[2]=7001,[3]=8001},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备				
				},
		},
[8] = {	NeedLv=21,
		List={
				{Type='Exp',Num=21000,},	
				{Type='Crystal',Num=20000},
				{Type='Goods',ID=88053,Num=1,Lock=1},
				{Type='Goods',ID=80383,Num=24,Lock=1},
				{Type='Goods',ID=80381,Num=10,Lock=1},
				{Type='Goods',ID=80195,Num=10,Lock=1},
				{Type='Goods',ID=80517,Num=70,Lock=1},
				{Type='Goods',ID=80518,Num=70,Lock=1},
				{Type='Goods',ID=80519,Num=70,Lock=1},
				{Type='Goods',ID={[1]=8101,[2]=8201,[3]=8301},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=8101,[2]=8201,[3]=8301},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=8101,[2]=8201,[3]=8301},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=8101,[2]=8201,[3]=8301},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[9] = {	NeedLv=23,
		List={
				{Type='Exp',Num=27000,},
				{Type='Goods',ID=88054,Num=1,Lock=1},
				{Type='Goods',ID=40252,Num=2,Lock=1},
				{Type='Goods',ID=80298,Num=5,Lock=1},
				{Type='Goods',ID=80517,Num=80,Lock=1},
				{Type='Goods',ID=80518,Num=80,Lock=1},
				{Type='Goods',ID=80519,Num=80,Lock=1},
				{Type='Goods',ID={[1]=6601,[2]=6701,[3]=6801},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[10] = {NeedLv=26,
		List={
				{Type='Exp',Num=201154,},
				{Type='Crystal',Num=100000},
				{Type='Goods',ID=88084,Num=1,Lock=1},
				{Type='Goods',ID=80382,Num=30,Lock=1},
				{Type='Goods',ID=80384,Num=5,Lock=1},
				{Type='Goods',ID=119,Num=50,Lock=1},
				{Type='Goods',ID=208,Num=50,Lock=1},
				{Type='Goods',ID=308,Num=10,Lock=1},
				{Type='Goods',ID=88137,Num=1,Lock=1},
				{Type='Goods',ID={[1]=4102,[2]=5102,[3]=6102},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=4,make2=3},--装备
				},
		},
[11] = {NeedLv=27,
		List={
				{Type='Exp',Num=225740,},
				{Type='Goods',ID=88085,Num=1,Lock=1},
			--	{Type='Goods',ID=80686,Num=1,Lock=1},				
				{Type='Goods',ID={[1]=4302,[2]=5302,[3]=6302},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[12] = {NeedLv=28,
		List={
				{Type='Exp',Num=251270,},
				{Type='Goods',ID=88086,Num=1,Lock=1},
				{Type='Goods',ID={[1]=4402,[2]=5402,[3]=6402},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[13] = {NeedLv=29,
		List={
				{Type='Exp',Num=278144,},
				{Type='Goods',ID=88087,Num=1,Lock=1},
				{Type='Goods',ID={[1]=4002,[2]=5002,[3]=6002},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=4502,[2]=5502,[3]=6502},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[14] = {NeedLv=30,
		List={
				{Type='Exp',Num=306362,},
				{Type='Goods',ID=88088,Num=1,Lock=1},
				{Type='Goods',ID={[1]=4202,[2]=5202,[3]=6202},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=4202,[2]=5202,[3]=6202},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[15] = {NeedLv=31,
		List={
				{Type='Exp',Num=335923,},
				{Type='Goods',ID=88089,Num=1,Lock=1},
				{Type='Goods',ID={[1]=2002,[2]=1502,[3]=1002},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=6902,[2]=7002,[3]=8002},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=6902,[2]=7002,[3]=8002},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[16] = {NeedLv=32,
		List={
				{Type='Exp',Num=352719,},
				{Type='Goods',ID=88090,Num=1,Lock=1},
				{Type='Goods',ID={[1]=8102,[2]=8202,[3]=8302},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=8102,[2]=8202,[3]=8302},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[17] = {NeedLv=33,
		List={
				{Type='Exp',Num=370355,},
				{Type='Goods',ID=88091,Num=1,Lock=1},
				{Type='Goods',ID={[1]=8102,[2]=8202,[3]=8302},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=8102,[2]=8202,[3]=8302},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[18] = {NeedLv=36,
		List={
				{Type='Exp',Num=388873,},
				{Type='Goods',ID={[1]=6602,[2]=6702,[3]=6802},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
}

--黄金宝箱使用函数
function Libao_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local OpenNum = API_VarDataGetNumber(ActorID,1,LibaoOpen)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if GoodsID ~= LibaoID[OpenNum] then
		API_ResponseWrite('<text>这个宝箱里面空空如也~~</text><br>')
		API_ResponseWrite('<br><a>暂时收好</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
	if Libao_GoodList[OpenNum] ~= nil then
		local JiangliList = Libao_GoodList[OpenNum].List
		local ExpLevel = API_GetActorExpLevel(ActorID)
		local NeedLv = Libao_GoodList[OpenNum].NeedLv
		API_ResponseWrite('<br><text>这个宝箱里面藏着这些宝贝：</text><br>')
		for i in JiangliList do
			local Jiangli = JiangliList[i]
			local JiangliType = Jiangli.Type
			local JiangliGoodsID = Jiangli.ID
			if type(JiangliGoodsID) == 'table' then
				local HeroID = API_ActorGetCurHeroID(ActorID,0)
				local HeroType = Libao_HeroTypejisuan(ActorID)
				--local HeroType = PublicFun_GetHeroType(HeroID)
				JiangliGoodsID = JiangliGoodsID[HeroType]
			end
			local JiangliNum = Jiangli.Num
			if JiangliType == 'Money' and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Exp' and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Crystal' and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
			elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
				API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
			end
		end
		if ExpLevel >= NeedLv then
			API_ResponseWrite('<br><br><text>您要现在打开它吗？</text><br>')
			API_ResponseWrite('<br><a href="OpenLibao?1='..GoodsID..'">马上打开</a><br>')
			API_ResponseWrite('<br><a>暂时收好</a><br>')
			API_ResponseFlush(ActorID)
		elseif ExpLevel < NeedLv then
			API_ResponseWrite('<br><br><text color="255,0,0">只有'.. GLOBAL_Exploit[NeedLv].PeerageDepict ..'或者更高等级的人</text><text>才能得到其中的礼物！</text><br>')
			API_ResponseWrite('<br><a>暂时收好</a><br>')
			API_ResponseFlush(ActorID)
		end
	else
		API_ResponseWrite('<br><text>这个宝箱里面空空如也~~</text><br>')
		API_ResponseWrite('<br><a>暂时收好</a><br>')
		API_ResponseFlush(ActorID)
	end
	return 1
end



function OpenLibao()
	local ActorID = API_RequestGetActorID()
	local LibaoGoodsID = API_RequestGetNumber(1)
	local OpenNum = API_VarDataGetNumber(ActorID,1,LibaoOpen)
	if LibaoGoodsID ~= LibaoID[OpenNum] then
		return
	end
	local ExpLevel = API_GetActorExpLevel(ActorID)
	local PackageSize = API_ActorGetPackageSize(ActorID)
	local LibaoNum = API_ActorGetGoodsNum(ActorID,LibaoGoodsID)
	if LibaoNum > 0 then
		API_ResponseWrite('<name>'..API_GetGoodsName(LibaoGoodsID)..'</name>')
		if Libao_GoodList[OpenNum] ~= nil then
			local NeedLv = Libao_GoodList[OpenNum].NeedLv
			if NeedLv <= 0 then
				return
			end
			if ExpLevel >= Libao_GoodList[OpenNum].NeedLv then
				local JiangliList = Libao_GoodList[OpenNum].List
				if type(JiangliList) ~= 'table' then
					return
				end
				local jianglineedbagnum = 0
				for i in JiangliList do
					local Jiangli = JiangliList[i]
					local JiangliType = Jiangli.Type
					local JiangliGoodsID = Jiangli.ID
					
					if type(JiangliGoodsID) == 'table' then
						local HeroID = API_ActorGetCurHeroID(ActorID,0)
						local HeroType = Libao_HeroTypejisuan(ActorID)
					--	local HeroType = PublicFun_GetHeroType(HeroID)
						JiangliGoodsID = JiangliGoodsID[HeroType]
					end
					local JiangliNum = Jiangli.Num
					if JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
						jianglineedbagnum = jianglineedbagnum + 1
					end
				end
				if PackageSize < jianglineedbagnum then
					API_ResponseWrite('<text>您的背包剩余空间少于</text><text color="255,0,0">'..jianglineedbagnum..'</text><text>格，无法获得奖励。请清理背包后再试。</text><br>')
					API_ResponseWrite('<br><a>暂时收好</a><br>')
					return
				end
				API_ActorRemoveGoods(ActorID,LibaoGoodsID,1,'删除黄金宝箱')
				local NowOpenNum = OpenNum + 1
				API_VarDataSetNumber(ActorID,1,LibaoOpen,NowOpenNum)
				API_ResponseWrite('<text>您打开'..API_GetGoodsName(LibaoGoodsID)..'，获得里面藏着的礼物：</text><br>')
				for i in JiangliList do
					local Jiangli = JiangliList[i]
					local JiangliType = Jiangli.Type
					local JiangliGoodsID = Jiangli.ID
					if type(JiangliGoodsID) == 'table' then
						local HeroID = API_ActorGetCurHeroID(ActorID,0)
						local HeroType = Libao_HeroTypejisuan(ActorID)
					--	local HeroType = PublicFun_GetHeroType(HeroID)
						JiangliGoodsID = JiangliGoodsID[HeroType]
					end
					local JiangliNum = Jiangli.Num
					if JiangliType == 'Money' and JiangliNum > 0 then
						API_ActorAddMoney(ActorID,JiangliNum,0,'黄金宝箱')
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 金币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 金币')
						API_ResponseWrite('<img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Exp' and JiangliNum > 0 then
						API_ActorAddExp(ActorID,JiangliNum,0,'黄金宝箱')
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 经验')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 经验')
						API_ResponseWrite('<img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Crystal' and JiangliNum > 0 then
						API_ActorShoppingM_Add(ActorID,JiangliNum,0,'黄金宝箱')
						API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 水晶币')
						API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 水晶币')
						API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..JiangliNum..'</text><text>        </text>')
					elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
						if API_ActorCanAddGoods(ActorID,JiangliGoodsID,JiangliNum,3,0) ~= -1 then
							local QosLevel = Jiangli.QosLevel
							if QosLevel == nil then
								QosLevel = 1
							end
							local AutoIdentify = Jiangli.AutoIdentify
							if AutoIdentify == nil then
								AutoIdentify = 0
							end
							local arm = Jiangli.arm
							local make1 = Jiangli.make1
							local make2 = Jiangli.make2
							if arm == 1 then
								API_AddGoodsWithMakeFlag(ActorID, JiangliGoodsID, JiangliNum,QosLevel, 3, '黄金宝箱',  AutoIdentify,  make1,make2)
							else
								API_AddActorGoodsFlagEx(ActorID,JiangliGoodsID,JiangliNum,QosLevel,3,'黄金宝箱',AutoIdentify)
							end
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
							if JiangliGoodsID == 31121 then
								API_ActorSetShortCut(ActorID,2,31121,11)
							end
						else
							API_SendActorMailByName(API_GetActorName(ActorID),JiangliGoodsID,JiangliNum,3,'['..API_GetGoodsName(LibaoGoodsID)..']','打开'..API_GetGoodsName(LibaoGoodsID)..'：获得'..JiangliNum..'个'..API_GetGoodsName(JiangliGoodsID)..'')
							API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
							API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' （请到邮箱领取）</text><text>        </text>')
						end
					end
				end
				API_ResponseWrite('<br><br><a>确定</a><br>')
				g_EventSystem:FireAction(ActorID, nil, _EVENT_ID_ONUSEGOODS, _E_SRC_TYPE_GOODS,LibaoGoodsID)
			else
				local NeedExploitName =  GLOBAL_Exploit[NeedLv].PeerageDepict
				API_ResponseWrite('<text>这个宝箱上贴着烫金的封条，只有</text><text color="255,0,0">'..NeedExploitName..'</text><text>或者更高等级的人才能得到其中的礼物！</text><br>')
				API_ResponseWrite('<br><a>暂时收好</a><br>')
			end
		end
	end
end
function Libao_HeroTypejisuan(ActorID)
	local heroskill1 = 0
	local hero1 = 0
	local herotable = API_GetActorHeroList(ActorID)
	for i in pairs(herotable) do
		local HeroID = herotable[i]
		local newheroskilllevel = epfunc_FH_SkillLvSum(ActorID,HeroID)	
		if newheroskilllevel >= heroskill1 then
			heroskill1 = newheroskilllevel
			hero1 = HeroID			
		end
	end
	if hero1 == 0 then
		return 1
	end
	local hero1Type = PublicFun_GetHeroType(hero1)
	return hero1Type
end