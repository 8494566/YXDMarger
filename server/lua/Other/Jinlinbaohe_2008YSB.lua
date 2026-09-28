----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\Jinlinbaohe.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-2-27
--版  本:	1.0
--描  述:	精灵宝盒使用函数
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-2-27
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------


--礼包物品ID
local LibaoID = {[0]=702,[1]=702,[2]=702,}

--礼包打开次数
local LibaoOpen = 18067

--精灵宝盒使用函数
function Libao_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local OpenNum = API_VarDataGetNumber(ActorID,1,LibaoOpen)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	API_ResponseWrite('<name>精灵宝盒</name>')
	if OpenNum == 0 then
		if ExpLevel >= 4 then
			API_ResponseWrite('<text>一个外观别致的盒子，您要打开它看看里面藏着什么宝贝吗？</text><br>')
			API_ResponseWrite('<br><a href="OpenLibao?1='..GoodsID..'">马上打开</a><br>')
			API_ResponseWrite('<br><a>暂时收好</a><br>')
			API_ResponseFlush(ActorID)
		else
			API_ResponseWrite('<text>这个宝盒上贴着烫金的封条，只有</text><text color="255,0,0">七等公民</text><text>或者更高爵位的人才能得到其中的礼物！</text><br>')
			API_ResponseWrite('<br><a>暂时收好</a><br>')
			API_ResponseFlush(ActorID)
		end
	elseif OpenNum == 1 then
		if ExpLevel >= 11 then
			API_ResponseWrite('<text>一个外观精致的盒子，您要打开它看看里面藏着什么宝贝吗？</text><br>')
			API_ResponseWrite('<br><a href="OpenLibao?1='..GoodsID..'">马上打开</a><br>')
			API_ResponseWrite('<br><a>暂时收好</a><br>')
			API_ResponseFlush(ActorID)
		else
			API_ResponseWrite('<text>这个宝盒上贴着烫金的封条，只有</text><text color="255,0,0">十等男爵</text><text>或者更高爵位的人才能得到其中的礼物！</text><br>')
			API_ResponseWrite('<br><a>暂时收好</a><br>')
			API_ResponseFlush(ActorID)
		end
	elseif OpenNum == 2 then
		if ExpLevel >= 16 then
			API_ResponseWrite('<text>一个外观华丽的盒子，您要打开它看看里面藏着什么宝贝吗？</text><br>')
			API_ResponseWrite('<br><a href="OpenLibao?1='..GoodsID..'">马上打开</a><br>')
			API_ResponseWrite('<br><a>暂时收好</a><br>')
			API_ResponseFlush(ActorID)
		else
			API_ResponseWrite('<text>这个宝盒由光滑的魔法绸缎织成，</text><text color="255,0,0">五等男爵</text><text>或者更高爵位的人才有能力得到其中的礼物！</text><br>')
			API_ResponseWrite('<br><a>暂时收好</a><br>')
			API_ResponseFlush(ActorID)
		end
	else
		API_ResponseWrite('<text>这个宝盒里面空空如也~~</text><br>')
		API_ResponseWrite('<br><a>暂时收好</a><br>')
		API_ResponseFlush(ActorID)
	end
	return 1
end

local Libao_GoodList={
[0] = {	NeedLv=4,
		List={
				{Type='Goods',ID=80289,Num=9999,Lock=1},
				{Type='Goods',ID=714,Num=200,Lock=1},
				{Type='Goods',ID=80274,Num=40,Lock=1},
				},
		},
[1] = {	NeedLv=11,
		List={
				{Type='Money',Num=3000,},
				{Type='Goods',ID=80397,Num=50,Lock=1},
				{Type='Goods',ID=9504,Num=1,Lock=1},
				},
		},
[2] = {	NeedLv=16,
		List={
				{Type='Money',Num=5000,},
				{Type='Goods',ID=80455,Num=24,Lock=1},
				{Type='Goods',ID=207,Num=40,Lock=1},
				},
		},
}

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
		API_ResponseWrite('<name>精灵宝盒</name>')
		if Libao_GoodList[OpenNum] ~= nil then
			local NeedLv = Libao_GoodList[OpenNum].NeedLv
			if NeedLv <= 0 then
				return
			end
			if ExpLevel >= Libao_GoodList[OpenNum].NeedLv then
				API_ActorRemoveGoods(ActorID,LibaoGoodsID,1,'删除精灵宝盒')
				local NowOpenNum = OpenNum + 1
				API_VarDataSetNumber(ActorID,1,LibaoOpen,NowOpenNum)
				local JiangliList = Libao_GoodList[OpenNum].List
				if type(JiangliList) ~= 'table' then
					return
				end
				local Jiangli = JiangliList[math.random(table.getn(JiangliList))]
				local JiangliType = Jiangli.Type
				local JiangliGoodsID = Jiangli.ID
				local JiangliNum = Jiangli.Num
				API_ResponseWrite('<text>您打开第'..PublicFun_ArabianNumberToChineseNumber(NowOpenNum)..'个精灵宝盒，获得里面藏着的礼物：</text><br>')
				if JiangliType == 'Money' and JiangliNum > 0 then
					API_ActorAddMoney(ActorID,JiangliNum,0,'精灵宝盒')
					API_ResponseWrite('<br><img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><text>  ×'..JiangliNum..'</text><br>')
				elseif JiangliType == 'Exp' and JiangliNum > 0 then
					API_ActorAddExp(ActorID,JiangliNum,0,'精灵宝盒')
					API_ResponseWrite('<br><img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..JiangliNum..'</text><br>')
				elseif JiangliType == 'Goods' and JiangliGoodsID > 0 and JiangliNum > 0 then
					if API_ActorCanAddGoods(ActorID,JiangliGoodsID,JiangliNum,3,0) ~= -1 then
						API_AddActorGoodsFlag(ActorID,JiangliGoodsID,JiangliNum,3,'精灵宝盒')
						API_ActorSendMsg(ActorID,9,'防守奖励：获得'..GoodsNum..'个'..GoodsName..'')
						API_ResponseWrite('<br><img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text>')
					else
						API_SendActorMailByName(API_GetActorName(ActorID),JiangliGoodsID,JiangliNum,3,'[精灵宝盒]','打开精灵宝盒：获得'..JiangliNum..'个'..API_GetGoodsName(JiangliGoodsID)..'')
						API_ResponseWrite('<br><img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' （请到邮箱领取）</text>')
					end
				else
					return
				end
				API_ResponseWrite('<br><a>确定</a><br>')
			else
				local NeedExploitName =  GLOBAL_Exploit[NeedLv].PeerageDepict
				API_ResponseWrite('<text>这个宝盒上贴着烫金的封条，只有</text><text color="255,0,0">'..NeedExploitName..'</text><text>或者更高爵位的人才能得到其中的礼物！</text><br>')
				API_ResponseWrite('<br><a>暂时收好</a><br>')
			end
		end
	end
end
