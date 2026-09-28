----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\ZiLiaoPianDaLiBao.lua
--版  权:	深圳网域计算机网络有限公司
--创建人:	刘操
--日  期:	2010.9.28
--版  本:	1.0
--描  述:	
--应  用:  高阶黄金宝箱
----------------------------------------------------------------------------------------------------------------------




--黄金宝箱打开次数
local ZiLiaoPian_LibaoOpen = 30223

--宝箱物品ID
local ZiLiaoPian_LibaoID = {[0]=88972,[1]=88973,[2]=88974,[3]=88975,[4]=88976,[5]=88977,[6]=88978,}

local ZiLiaoPianLibao_GoodList={
[0] = {	NeedLv=41,
		List={
				{Type='Goods',ID=82004,Num=800,Lock=1},
				{Type='Goods',ID=80384,Num=2,Lock=1},
				{Type='Goods',ID=80382,Num=2,Lock=1},
				{Type='Goods',ID=80196,Num=20,Lock=1},
				{Type='Goods',ID=88973,Num=1,Lock=1},
				{Type='Goods',ID={[1]=4103,[2]=5103,[3]=6103},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=4,make2=3},--装备
				},
		},
[1] = {	NeedLv=44,
		List={
				{Type='Goods',ID=82004,Num=1000,Lock=1},
				{Type='Goods',ID=80384,Num=2,Lock=1},
				{Type='Goods',ID=80382,Num=2,Lock=1},
				{Type='Goods',ID=80196,Num=20,Lock=1},
				{Type='Goods',ID=88974,Num=1,Lock=1},
				{Type='Goods',ID={[1]=4303,[2]=5303,[3]=6303},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[2] = {	NeedLv=48,
		List={
				{Type='Goods',ID=82004,Num=1400,Lock=1},
				{Type='Goods',ID=80384,Num=2,Lock=1},
				{Type='Goods',ID=80382,Num=2,Lock=1},
				{Type='Goods',ID=80196,Num=20,Lock=1},
				{Type='Goods',ID=80951,Num=1,Lock=1},
				{Type='Goods',ID=88975,Num=1,Lock=1},
				{Type='Goods',ID={[1]=4403,[2]=5403,[3]=6403},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[3] = {	NeedLv=52,
		List={
				{Type='Goods',ID=82004,Num=2000,Lock=1},
				{Type='Goods',ID=80384,Num=2,Lock=1},
				{Type='Goods',ID=80382,Num=2,Lock=1},
				{Type='Goods',ID=80197,Num=10,Lock=1},
				{Type='Goods',ID=80951,Num=1,Lock=1},
				{Type='Goods',ID=88976,Num=1,Lock=1},
				{Type='Goods',ID={[1]=4003,[2]=5003,[3]=6003},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=4503,[2]=5503,[3]=6503},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[4] = {	NeedLv=56,
		List={
				{Type='Goods',ID=82004,Num=3000,Lock=1},
				{Type='Goods',ID=80384,Num=3,Lock=1},
				{Type='Goods',ID=80382,Num=3,Lock=1},
				{Type='Goods',ID=80197,Num=10,Lock=1},
				{Type='Goods',ID=80952,Num=1,Lock=1},
				{Type='Goods',ID=88977,Num=1,Lock=1},
				{Type='Goods',ID={[1]=4203,[2]=5203,[3]=6203},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=4203,[2]=5203,[3]=6203},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=2003,[2]=1503,[3]=1003},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=6903,[2]=7003,[3]=8003},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=6903,[2]=7003,[3]=8003},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[5] = {	NeedLv=60,
		List={
				{Type='Goods',ID=82004,Num=4000,Lock=1},
				{Type='Goods',ID=80384,Num=3,Lock=1},
				{Type='Goods',ID=80382,Num=3,Lock=1},
				{Type='Goods',ID=80197,Num=10,Lock=1},
				{Type='Goods',ID=80952,Num=1,Lock=1},
				{Type='Goods',ID=88978,Num=1,Lock=1},
				{Type='Goods',ID={[1]=8103,[2]=8203,[3]=8303},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=8103,[2]=8203,[3]=8303},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=8103,[2]=8203,[3]=8303},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				{Type='Goods',ID={[1]=8103,[2]=8203,[3]=8303},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
[6] = {	NeedLv=64,
		List={
				{Type='Goods',ID=82004,Num=5000,Lock=1},
				{Type='Goods',ID=80384,Num=3,Lock=1},
				{Type='Goods',ID=80382,Num=3,Lock=1},
				{Type='Goods',ID=80197,Num=10,Lock=1},
				{Type='Goods',ID=80952,Num=1,Lock=1},
				{Type='Goods',ID={[1]=6603,[2]=6703,[3]=6803},Num=1,Lock=1,QosLevel=2,AutoIdentify=0,arm=1,make1=3,make2=4},--装备
				},
		},
}

local GaoJiHuangJinBaoXiang_StartTime = {Year = 2010,Month = 9,Day = 30,Hour = 0,Minute = 0,Second = 0}

local ZiLiaoPianLibaoGetSave = 30224

--上线回调
function ZiLiaoPianLibao_OnLogin(ActorID)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local ExpLevel = API_GetActorExpLevel(ActorID)
	local nShiFouStart = API_DiffDatatime(GaoJiHuangJinBaoXiang_StartTime.Year,GaoJiHuangJinBaoXiang_StartTime.Month,GaoJiHuangJinBaoXiang_StartTime.Day,GaoJiHuangJinBaoXiang_StartTime.Hour,GaoJiHuangJinBaoXiang_StartTime.Minute,GaoJiHuangJinBaoXiang_StartTime.Second)

	if ExpLevel > 36 then
		local BeginTime = GaoJiHuangJinBaoXiang_StartTime.Year * 10000 + GaoJiHuangJinBaoXiang_StartTime.Month * 100 + GaoJiHuangJinBaoXiang_StartTime.Day
		local GetTime = API_VarDataGetNumber(ActorID,1,ZiLiaoPianLibaoGetSave)
		if GetTime < BeginTime then
			API_VarDataSetNumber(ActorID,1,ZiLiaoPianLibaoGetSave,BeginTime)
			API_SendActorMailByName(API_GetActorName(ActorID),88972,1,3,'高级黄金宝箱','系统赠送：等级大于36级玩家可获得')
			API_ActorSendMsg(ActorID,17,'您的邮箱中获得“'..API_GetGoodsName(88972)..'”1个，请注意查收')
		end
	end
end

--黄金宝箱使用函数
function ZiLiaoPianLibao_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local OpenNum = API_VarDataGetNumber(ActorID,1,ZiLiaoPian_LibaoOpen)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if GoodsID ~= ZiLiaoPian_LibaoID[OpenNum] then
		API_ResponseWrite('<text>这个宝箱里面空空如也~~</text><br>')
		API_ResponseWrite('<br><a>暂时收好</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
	if ZiLiaoPianLibao_GoodList[OpenNum] ~= nil then
		local JiangliList = ZiLiaoPianLibao_GoodList[OpenNum].List
		local ExpLevel = API_GetActorExpLevel(ActorID)
		local NeedLv = ZiLiaoPianLibao_GoodList[OpenNum].NeedLv
		API_ResponseWrite('<br><text>这个宝箱里面藏着这些宝贝：</text><br>')
		for i in JiangliList do
			local Jiangli = JiangliList[i]
			local JiangliType = Jiangli.Type
			local JiangliGoodsID = Jiangli.ID
			local JiangliNum = Jiangli.Num
			if type(JiangliGoodsID) == 'table' then
				local HeroID = API_ActorGetCurHeroID(ActorID,0)
				local HeroType = Libao_HeroTypejisuan(ActorID)
				JiangliGoodsID = JiangliGoodsID[HeroType]
			end
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
			API_ResponseWrite('<br><a href="ZiLiaoPian_OpenLibao?1='..GoodsID..'">马上打开</a><br>')
			API_ResponseWrite('<br><a>暂时收好</a><br>')
			API_ResponseFlush(ActorID)
		elseif ExpLevel < NeedLv then
			API_ResponseWrite('<br><br><text color="255,0,0">只有达到'.. NeedLv ..'级的人</text><text>才能得到其中的礼物！</text><br>')
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



function ZiLiaoPian_OpenLibao()
	local ActorID = API_RequestGetActorID()
	local LibaoGoodsID = API_RequestGetNumber(1)
	local OpenNum = API_VarDataGetNumber(ActorID,1,ZiLiaoPian_LibaoOpen)
	if LibaoGoodsID ~= ZiLiaoPian_LibaoID[OpenNum] then
		return
	end
	local ExpLevel = API_GetActorExpLevel(ActorID)
	local PackageSize = API_ActorGetPackageSize(ActorID)
	local LibaoNum = API_ActorGetGoodsNum(ActorID,LibaoGoodsID)
	if LibaoNum > 0 then
		API_ResponseWrite('<name>'..API_GetGoodsName(LibaoGoodsID)..'</name>')
		if ZiLiaoPianLibao_GoodList[OpenNum] ~= nil then
			local NeedLv = ZiLiaoPianLibao_GoodList[OpenNum].NeedLv
			if NeedLv <= 0 then
				return
			end
			if ExpLevel >= ZiLiaoPianLibao_GoodList[OpenNum].NeedLv then
				local JiangliList = ZiLiaoPianLibao_GoodList[OpenNum].List
				if type(JiangliList) ~= 'table' then
					return
				end
				local jianglineedbagnum = 0
				for i in JiangliList do
					local Jiangli = JiangliList[i]
					local JiangliType = Jiangli.Type
					local JiangliGoodsID = Jiangli.ID
					local JiangliNum = Jiangli.Num
					if type(JiangliGoodsID) == 'table' then
						local HeroID = API_ActorGetCurHeroID(ActorID,0)
						local HeroType = Libao_HeroTypejisuan(ActorID)
						JiangliGoodsID = JiangliGoodsID[HeroType]
					end
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
				API_VarDataSetNumber(ActorID,1,ZiLiaoPian_LibaoOpen,NowOpenNum)
				API_ResponseWrite('<text>您打开'..API_GetGoodsName(LibaoGoodsID)..'，获得里面藏着的礼物：</text><br>')
				for i in JiangliList do
					local Jiangli = JiangliList[i]
					local JiangliType = Jiangli.Type
					local JiangliGoodsID = Jiangli.ID
					local JiangliNum = Jiangli.Num
					if type(JiangliGoodsID) == 'table' then
						local HeroID = API_ActorGetCurHeroID(ActorID,0)
						local HeroType = Libao_HeroTypejisuan(ActorID)
						JiangliGoodsID = JiangliGoodsID[HeroType]
					end
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
				API_ResponseWrite('<br><br><text color="255,0,0">只有达到'.. NeedLv ..'级的人</text><text>才能得到其中的礼物！</text><br>')
				API_ResponseWrite('<br><a>暂时收好</a><br>')
			end
		end
	end
end