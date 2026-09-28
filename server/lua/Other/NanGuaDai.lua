----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\NanGuaDai.lua
--版  权:	深圳网域计算机网络有限公司
--创建人:	梁宇宁
--日  期:	2010.10.14
--版  本:	1.0
--描  述:
--应  用:  南瓜袋和南瓜徽章
----------------------------------------------------------------------------------------------------------------------





--南瓜袋开出物品ID
--local NanGuaDaiWuPinID = {
--[0] = {GoodsID= 88972,GoodsNum = 1,GaiLv1 = 0,GaiLv2 = 500000,Pinzhi = 0},
--[1] = {GoodsID= 88973,GoodsNum = 1,GaiLv1 = 500000,GaiLv2 = 1000000,Pinzhi = 0},
--}


NanGuaDaiWuPinID = {
{GoodsID=11313,GaiLv1=1,GaiLv2=10092,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=11314,GaiLv1=10093,GaiLv2=20185,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=11315,GaiLv1=20186,GaiLv2=30278,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=11316,GaiLv1=30279,GaiLv2=40371,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=10983,GaiLv1=40372,GaiLv2=60557,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=10984,GaiLv1=60558,GaiLv2=76706,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=10985,GaiLv1=76707,GaiLv2=92855,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=11317,GaiLv1=92856,GaiLv2=99584,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=80383,GaiLv1=99585,GaiLv2=772441,NumGaiLv=10000,NumMax=10,NumMin=9},
{GoodsID=80381,GaiLv1=772442,GaiLv2=1445298,NumGaiLv=10000,NumMax=5,NumMin=4},
{GoodsID=80384,GaiLv1=1445299,GaiLv2=1849013,NumGaiLv=10000,NumMax=10,NumMin=9},
{GoodsID=80382,GaiLv1=1849014,GaiLv2=2252728,NumGaiLv=10000,NumMax=5,NumMin=4},
{GoodsID=80832,GaiLv1=2252729,GaiLv2=2656443,NumGaiLv=10000,NumMax=10,NumMin=5},
{GoodsID=80833,GaiLv1=2656444,GaiLv2=3060158,NumGaiLv=10000,NumMax=10,NumMin=5},
{GoodsID=82004,GaiLv1=3060159,GaiLv2=3867587,NumGaiLv=10000,NumMax=5,NumMin=2},
{GoodsID=80697,GaiLv1=3867588,GaiLv2=4405873,NumGaiLv=10000,NumMax=5,NumMin=4},
{GoodsID=80195,GaiLv1=4405874,GaiLv2=5213302,NumGaiLv=10000,NumMax=5,NumMin=4},
{GoodsID=9503,GaiLv1=5213303,GaiLv2=5280588,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=88044,GaiLv1=5280589,GaiLv2=5442074,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=82032,GaiLv1=5442075,GaiLv2=5845789,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=9504,GaiLv1=5845790,GaiLv2=5913075,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=89041,GaiLv1=5913076,GaiLv2=6047647,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=89044,GaiLv1=6047648,GaiLv2=6182219,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=80949,GaiLv1=6182220,GaiLv2=6283148,NumGaiLv=10000,NumMax=2,NumMin=1},
{GoodsID=80951,GaiLv1=6283149,GaiLv2=6350434,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=80952,GaiLv1=6350435,GaiLv2=6366583,NumGaiLv=10000,NumMax=1,NumMin=0},
{GoodsID=80949,GaiLv1=6366584,GaiLv2=6501155,NumGaiLv=10000,NumMax=5,NumMin=4},
{GoodsID=75,GaiLv1=6501156,GaiLv2=6904870,NumGaiLv=10000,NumMax=2,NumMin=1},
{GoodsID=82004,GaiLv1=6904871,GaiLv2=7577727,NumGaiLv=9999,NumMax=8,NumMin=7},
{GoodsID=80394,GaiLv1=7577728,GaiLv2=8116013,NumGaiLv=10000,NumMax=4,NumMin=3},
{GoodsID=80686,GaiLv1=8116014,GaiLv2=8654299,NumGaiLv=10000,NumMax=4,NumMin=3},
{GoodsID=80274,GaiLv1=8654300,GaiLv2=9058014,NumGaiLv=10000,NumMax=3,NumMin=2},
{GoodsID=80689,GaiLv1=9058015,GaiLv2=9596300,NumGaiLv=10000,NumMax=2,NumMin=1},
{GoodsID=80196,GaiLv1=9596301,GaiLv2=10000000,NumGaiLv=10000,NumMax=5,NumMin=4},
}

WSJ_Buff = {
[1] = {Name = '狂战之魂',StatusID = 2000001,Num = 10,Explain = '各类型攻击力增加50点（南瓜徽章效果只能存在一个）'},
[2] = {Name = '岩魔附体',StatusID = 2000002,Num = 10,Explain = '各类型防御力增加40点（南瓜徽章效果只能存在一个）'},
[3] = {Name = '战争光环',StatusID = 2000003,Num = 10,Explain = '暴击抵抗增加15%（南瓜徽章效果只能存在一个）'},
[4] = {Name = '暗影风暴',StatusID = 2000004,Num = 10,Explain = '各类型攻击暴击增加150点（南瓜徽章效果只能存在一个）'},
[5] = {Name = '士气战鼓',StatusID = 2000005,Num = 10,Explain = '反击概率增加15%（南瓜徽章效果只能存在一个）'},
}



WSJ_ZhuanHuan = {
   [10983] = '鬼脸面具',
   [10984] = '猫脸面具【女装】',
   [10985] = '狂欢面具【男装】',
   [11313] = '巫女头饰',
   [11314] = '万圣节巫女',
   [11315] = '爵士礼帽',
   [11316] = '万圣节爵士',

}


NanGuaDaiZhenGui = {
{GoodsID=11317,NumMax=1}, ---------死神
{GoodsID=11313,NumMax=1},
{GoodsID=11314,NumMax=1},
{GoodsID=11315,NumMax=1},
{GoodsID=11316,NumMax=1},
{GoodsID=10983,NumMax=1},
{GoodsID=10984,NumMax=1},
{GoodsID=10985,NumMax=1},
{GoodsID=80952,NumMax=1},

}





-------------------全局ID-----------------------
------------------------------------------------

SiShenMaxCtrID = -7002 ---------这一天死神背饰的最大数量1
ShiZhuangMaxCtrID = -7004 ---------时装每天上限为6
SiShenMaxShuaID = -7003 ---------死神背饰数量是否要刷新
SiDangMaxCtrID = -7006 ---------四档魔晶每天上限为5


--南瓜袋ID

NanGuaDaiID = 88980
NanGuaHuiZhangID = 88979

function NanGuaDai_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if GoodsID ~= NanGuaDaiID  then
		API_ResponseWrite('<text>这个南瓜袋里面空空如也~~</text><br>')
		API_ResponseWrite('<br><a>暂时收好</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	-----------死神饰品刷新-------------
	if API_VarDataGetNumber_Ex(1,0,SiShenMaxShuaID,1,1) == 0 then  ---------初始化为一年中第几天
		API_VarDataSetNumber_Ex_Sync(1,0,SiShenMaxShuaID,1,1,os.date('*t').yday)
	end
	local Yday = API_VarDataGetNumber_Ex(1,0,SiShenMaxShuaID,1,1)
	if Yday ~= os.date('*t').yday then                   ------------------如果这一天已经过
		API_VarDataSetNumber_Ex_Sync(1,0,SiShenMaxShuaID,1,1,os.date('*t').yday) -------置为今天
		API_VarDataSetNumber_Ex_Sync(1,0,SiShenMaxCtrID,1,1,0)       ------------死神数量刷新
		API_VarDataSetNumber_Ex_Sync(1,0,ShiZhuangMaxCtrID,1,1,0)    ------------时装数量刷新
		API_VarDataSetNumber_Ex_Sync(1,0,SiDangMaxCtrID,1,1,0)    ------------四档魔晶数量刷新
	end
	API_ResponseWrite('<name>'..API_GetGoodsName(NanGuaDaiID)..'</name>')
	if ExpLevel < 10 then
		API_ResponseWrite('<br><br><text color="255,0,0">只有达到10级的人使用</text><text color="255,255,0">200点券</text><text>才能使用得到其中的礼物！</text><br>')
		API_ResponseWrite('<br><a>暂时收好</a><br>')
		API_ResponseFlush(ActorID)
	else
		API_ResponseWrite('<br><br><text>此南瓜袋需要</text><text color="186,0,255">200点券</text><text>打开，打开有几率获死神时装，四档升档魔晶等价值不菲的东西！</text><br>')
		for j in NanGuaDaiZhenGui do
			local JiangliGoodsID = NanGuaDaiZhenGui[j].GoodsID
			local JiangliNum = NanGuaDaiZhenGui[j].NumMax
			API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..'</text><text>      </text>')
		end
		API_ResponseWrite('<br><br><text>您要现在打开它吗？</text><br>')
		API_ResponseWrite('<br><a href="NanGuaDai_Open?1=1">马上打开</a><br>')
		API_ResponseWrite('<br><a>暂时收好</a><br>')
		API_ResponseFlush(ActorID)
	end
	return 1
end

function NanGuaDai_Open()
	local ActorID = API_RequestGetActorID()
	local ExpLevel = API_GetActorExpLevel(ActorID)
	local PackageSize = API_ActorGetPackageSize(ActorID)
	local Point = API_ActorGetPropNum(ActorID,183)  ---------------玩家的点券数
	API_ResponseWrite('<name>'..API_GetGoodsName(NanGuaDaiID)..'</name>')
	if PackageSize < 1 then
		API_ResponseWrite('<text>您的背包剩余空间少于</text><text color="255,0,0">1</text><text>格，无法获得奖励。请清理背包后再试。</text><br>')
		API_ResponseWrite('<br><a>暂时收好</a><br>')
		return
	end
	if ExpLevel < 10 then
		API_ResponseWrite('<br><br><text color="255,0,0">只有达到10级的人使用</text><text color="255,255,0">200点券</text><text>才能使用得到其中的礼物！</text><br>')
		API_ResponseWrite('<br><a>暂时收好</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
	if Point < 200 then
		API_ResponseWrite('<br><br><text color="255,0,0">你身上不足</text><text color="255,255,0">200点券</text><br>')
		API_ResponseWrite('<br><a>暂时收好</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
	if API_UsePoint(ActorID,3,88980,1,200) == 0 and API_ActorRemoveGoods(ActorID,NanGuaDaiID,1,'删除南瓜袋') then
		local WSJ_ZhuanHuan = {
			[10983] = '鬼脸面具',
			[10984] = '猫脸面具【女装】',
			[10985] = '狂欢面具【男装】',
			[11313] = '巫女头饰',
			[11314] = '万圣节巫女',
			[11315] = '爵士礼帽',
			[11316] = '万圣节爵士',
		}
		local GaiLv = math.random(10000000)
		for j in NanGuaDaiWuPinID do
			local JiangliGoodsID = NanGuaDaiWuPinID[j].GoodsID
			local JiangliNum = NanGuaDaiWuPinID[j].NumMax
			local GaiLv1 = NanGuaDaiWuPinID[j].GaiLv1
			local GaiLv2 = NanGuaDaiWuPinID[j].GaiLv2
			if GaiLv >= GaiLv1 and GaiLv < GaiLv2 then
				local NowTime = os.time()
				local CD = API_VarDataGetNumber_Ex(1,0,-6016,1,1)
				if JiangliGoodsID == 11317 then   ----如果是死神的话
					local MaxNum = API_VarDataGetNumber_Ex(1,0,SiShenMaxCtrID,1,1)
					if MaxNum >= 3 or NowTime <= CD then
						JiangliGoodsID = 82004   ------死神背饰已出的话就出超级经验兑换券10个
						JiangliNum = 10
					else
						API_VarDataSetNumber_Ex_Sync(1,0,SiShenMaxCtrID,1,1,API_VarDataGetNumber_Ex(1,0,SiShenMaxCtrID,1,1)+1)
						API_ActorBDCMsg(-1,0,-1,1,65,0,17, '【'..API_GetActorName(ActorID)..'】在打开南瓜袋时貌似出了一件珍宝，定睛一看，竟是价值连城的死神背饰！')
						--API_ActorBDCMsg(-1,0,-1,1,65,0,8, '【'..API_GetActorName(ActorID)..'】在打开南瓜袋时貌似出了一件珍宝，定睛一看，竟是价值连城的死神背饰！')
						local Time = os.time()
						local Tsec = math.random(900,1200)					
						local NextTime = Time + Tsec
						API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,1,NextTime)
					end
				end
				if JiangliGoodsID == 11313 or JiangliGoodsID == 11314 or JiangliGoodsID == 11315 or JiangliGoodsID == 11316  then   ----如果是时装的话
					local MaxNum = API_VarDataGetNumber_Ex(1,0,ShiZhuangMaxCtrID,1,1)
					if MaxNum >= 10 or NowTime <= CD then
						JiangliGoodsID = 82004   ------时装超过6的话的话就出超级经验兑换券10个
						JiangliNum = 10
					else
						API_VarDataSetNumber_Ex_Sync(1,0,ShiZhuangMaxCtrID,1,1,API_VarDataGetNumber_Ex(1,0,ShiZhuangMaxCtrID,1,1)+1)
						local ShiZhuangName = WSJ_ZhuanHuan[JiangliGoodsID]
						if ShiZhuangName ~= nil then
							API_ActorBDCMsg(-1,0,-1,1,65,0,17, '【'..API_GetActorName(ActorID)..'】打开南瓜袋，梦寐以求的'..ShiZhuangName..'竟出现在眼前！')
							--API_ActorBDCMsg(-1,0,-1,1,65,0,8, '【'..API_GetActorName(ActorID)..'】打开南瓜袋，梦寐以求的'..ShiZhuangName..'竟出现在眼前！')
						end
						local Time = os.time()
						local Tsec = math.random(900,1200)					
						local NextTime = Time + Tsec
						API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,1,NextTime)						
					end
				end
				if JiangliGoodsID == 80952 then   ----如果是四档升级魔晶的话
					local MaxNum = API_VarDataGetNumber_Ex(1,0,SiDangMaxCtrID,1,1)
					if MaxNum >= 5 or NowTime <= CDthen then
						JiangliGoodsID = 82004   ------四档升级超出5个的话就出超级经验兑换券10个
						JiangliNum = 10
					else
						API_VarDataSetNumber_Ex_Sync(1,0,SiDangMaxCtrID,1,1,API_VarDataGetNumber_Ex(1,0,SiDangMaxCtrID,1,1)+1)
						API_ActorBDCMsg(-1,0,-1,1,65,0,17, '【'..API_GetActorName(ActorID)..'】在打开南瓜袋时貌似出了一件珍宝，定睛一看，竟是价值连城的四档升档魔晶！')
						--API_ActorBDCMsg(-1,0,-1,1,65,0,8, '【'..API_GetActorName(ActorID)..'】在打开南瓜袋时貌似出了一件珍宝，定睛一看，竟是价值连城的四档升档魔晶！')
						local Time = os.time()
						local Tsec = math.random(900,1200)					
						local NextTime = Time + Tsec
						API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,1,NextTime)
					end
				end
				if JiangliGoodsID == 10983 or JiangliGoodsID == 10984 or JiangliGoodsID == 10985 then
					local ShiZhuangName = WSJ_ZhuanHuan[JiangliGoodsID]
					if ShiZhuangName ~= nil then
						API_ActorBDCMsg(-1,0,-1,1,65,0,17, '【'..API_GetActorName(ActorID)..'】在打开南瓜袋后，拿起一个'..ShiZhuangName..'戴上，心里暗喜：还挺合适的！')
						--API_ActorBDCMsg(-1,0,-1,1,65,0,8, '【'..API_GetActorName(ActorID)..'】在打开南瓜袋后，拿起一个'..ShiZhuangName..'戴上，心里暗喜：还挺合适的！')
					end
				end
				if API_ActorCanAddGoods(ActorID,JiangliGoodsID,JiangliNum,0,0) ~= -1 then
					API_AddActorGoodsFlagEx(ActorID,JiangliGoodsID,JiangliNum,1,0,'南瓜袋',0)
					API_ActorSendMsg(ActorID,0,'你消耗了200点券')
					API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
					API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'')
					API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' </text><text>        </text>')
				else
					API_SendActorMailByName(API_GetActorName(ActorID),JiangliGoodsID,JiangliNum,2,'南瓜袋','打开南瓜袋：获得'..JiangliNum..'个'..API_GetGoodsName(JiangliGoodsID)..'')
					API_ActorSendMsg(ActorID,0,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
					API_ActorSendMsg(ActorID,7,'你获得 '..JiangliNum..' 个'..API_GetGoodsName(JiangliGoodsID)..'（请到邮箱领取）')
					API_ResponseWrite('<img srcgd="'..JiangliGoodsID..'" tipgd="'..JiangliGoodsID..'"><text> × '..JiangliNum..' （请到邮箱领取）</text><text>        </text>')
				end
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 0
				if JiangliGoodsID == 11317 then ----死神背饰
					Type = 4
				elseif JiangliGoodsID == 11313 or JiangliGoodsID == 11314 or JiangliGoodsID == 11315 or JiangliGoodsID == 11316 then ----新时装
					Type = 5
				end
				if Type ~= 0 then
					if GLOBAL_FengXiangBiao_DateList[60][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[60][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[60][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[60][Type][LaiYuan] + 1
					end
				end
				if GLOBAL_FengXiangBiao_DateList[60][9][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[60][9][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[60][9][LaiYuan] = GLOBAL_FengXiangBiao_DateList[60][9][LaiYuan] + 1
				end
			end
		end
		API_ResponseWrite('<br><br><a>确定</a><br>')
	end
end

--------------------南瓜徽章----------------

function   NanGuaHuiZhang_CallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) >= 10 and API_ActorRemoveGoods(ActorID,GoodsID,10,'消耗10个南瓜徽章') then--销毁玩家身上的物品
		local Ran = math.random(table.getn(WSJ_Buff))
		local Num = WSJ_Buff[Ran]. Num
		local Name = WSJ_Buff[Ran]. Name
		API_ActorAddStatus(ActorID,WSJ_Buff[Ran].StatusID,600000)
		API_ActorSendMsg(ActorID,3,'使用'..Num..'个南瓜徽章兑换一个'..Name..'')
	end
	return 1
end

local ChongZhiBaoXiang_GoodsTable = {
		{GoodsID=82032,GaiLv1=1,GaiLv2=135309,Num=2,BiaoZhi=0},
		{GoodsID=89079,GaiLv1=135310,GaiLv2=221220,Num=1,BiaoZhi=0},
		{GoodsID=929,GaiLv1=221221,GaiLv2=311427,Num=3,BiaoZhi=0},
		{GoodsID=80274,GaiLv1=311428,GaiLv2=446737,Num=20,BiaoZhi=0},
		{GoodsID=88991,GaiLv1=446738,GaiLv2=554985,Num=5,BiaoZhi=0},
		{GoodsID=75,GaiLv1=554986,GaiLv2=663233,Num=5,BiaoZhi=0},
		{GoodsID=88044,GaiLv1=663234,GaiLv2=771481,Num=1,BiaoZhi=0},
		{GoodsID=32001,GaiLv1=771482,GaiLv2=879729,Num=1,BiaoZhi=0},
		{GoodsID=80686,GaiLv1=879730,GaiLv2=987977,Num=5,BiaoZhi=0},
		{GoodsID=80689,GaiLv1=987978,GaiLv2=1096225,Num=5,BiaoZhi=0},
		{GoodsID=80621,GaiLv1=1096226,GaiLv2=1204473,Num=10,BiaoZhi=0},
		{GoodsID=89093,GaiLv1=1204474,GaiLv2=1312721,Num=25,BiaoZhi=0},
		{GoodsID=82004,GaiLv1=1312722,GaiLv2=1420969,Num=100,BiaoZhi=0},
		{GoodsID=32101,GaiLv1=1420970,GaiLv2=1529217,Num=1,BiaoZhi=0},
		{GoodsID=88171,GaiLv1=1529218,GaiLv2=1637465,Num=5,BiaoZhi=0},
		{GoodsID=88910,GaiLv1=1637466,GaiLv2=1745713,Num=5,BiaoZhi=0},
		{GoodsID=557,GaiLv1=1745714,GaiLv2=1853961,Num=1,BiaoZhi=0},
		{GoodsID=82032,GaiLv1=1853962,GaiLv2=1908085,Num=5,BiaoZhi=0},
		{GoodsID=929,GaiLv1=1908086,GaiLv2=1962209,Num=5,BiaoZhi=0},
		{GoodsID=80274,GaiLv1=1962210,GaiLv2=2016333,Num=50,BiaoZhi=0},
		{GoodsID=88991,GaiLv1=2016334,GaiLv2=2070457,Num=10,BiaoZhi=0},
		{GoodsID=75,GaiLv1=2070458,GaiLv2=2124581,Num=10,BiaoZhi=0},
		{GoodsID=80686,GaiLv1=2124582,GaiLv2=2178705,Num=10,BiaoZhi=0},
		{GoodsID=80689,GaiLv1=2178706,GaiLv2=2232829,Num=10,BiaoZhi=0},
		{GoodsID=80621,GaiLv1=2232830,GaiLv2=2286953,Num=20,BiaoZhi=0},
		{GoodsID=88171,GaiLv1=2286954,GaiLv2=2341077,Num=10,BiaoZhi=0},
		{GoodsID=88910,GaiLv1=2341078,GaiLv2=2395201,Num=10,BiaoZhi=0},
		{GoodsID=89093,GaiLv1=2395202,GaiLv2=2449325,Num=50,BiaoZhi=0},
		{GoodsID=82004,GaiLv1=2449326,GaiLv2=2503449,Num=200,BiaoZhi=0},
		{GoodsID=88885,GaiLv1=2503450,GaiLv2=2557573,Num=1,BiaoZhi=0},
		{GoodsID=88886,GaiLv1=2557574,GaiLv2=2629739,Num=1,BiaoZhi=0},
		{GoodsID=88887,GaiLv1=2629740,GaiLv2=2665822,Num=1,BiaoZhi=0},
		{GoodsID=88888,GaiLv1=2665823,GaiLv2=2719946,Num=1,BiaoZhi=0},
		{GoodsID=31221,GaiLv1=2719947,GaiLv2=2828194,Num=1,BiaoZhi=0},
		{GoodsID=31222,GaiLv1=2828195,GaiLv2=2936442,Num=1,BiaoZhi=0},
		{GoodsID=31223,GaiLv1=2936443,GaiLv2=3044690,Num=1,BiaoZhi=0},
		{GoodsID=31224,GaiLv1=3044691,GaiLv2=3152938,Num=1,BiaoZhi=0},
		{GoodsID=31225,GaiLv1=3152939,GaiLv2=3261186,Num=1,BiaoZhi=0},
		{GoodsID=31226,GaiLv1=3261187,GaiLv2=3369434,Num=1,BiaoZhi=0},
		{GoodsID=39511,GaiLv1=3369435,GaiLv2=3423558,Num=1,BiaoZhi=0},
		{GoodsID=39514,GaiLv1=3423559,GaiLv2=3531806,Num=1,BiaoZhi=0},
		{GoodsID=39504,GaiLv1=3531807,GaiLv2=3609126,Num=1,BiaoZhi=0},
		{GoodsID=39505,GaiLv1=3609127,GaiLv2=3686446,Num=1,BiaoZhi=0},
		{GoodsID=39506,GaiLv1=3686447,GaiLv2=3763766,Num=1,BiaoZhi=0},
		{GoodsID=11026,GaiLv1=3763767,GaiLv2=3817890,Num=1,BiaoZhi=0},
		{GoodsID=11027,GaiLv1=3817891,GaiLv2=3853973,Num=1,BiaoZhi=0},
		{GoodsID=11028,GaiLv1=3853974,GaiLv2=3908097,Num=1,BiaoZhi=0},
		{GoodsID=11029,GaiLv1=3908098,GaiLv2=3944180,Num=1,BiaoZhi=0},
		{GoodsID=11036,GaiLv1=3944181,GaiLv2=3998304,Num=1,BiaoZhi=0},
		{GoodsID=11037,GaiLv1=3998305,GaiLv2=4034387,Num=1,BiaoZhi=0},
		{GoodsID=11046,GaiLv1=4034388,GaiLv2=4088511,Num=1,BiaoZhi=0},
		{GoodsID=11047,GaiLv1=4088512,GaiLv2=4124594,Num=1,BiaoZhi=0},
		{GoodsID=10986,GaiLv1=4124595,GaiLv2=4178718,Num=1,BiaoZhi=0},
		{GoodsID=10987,GaiLv1=4178719,GaiLv2=4214801,Num=1,BiaoZhi=0},
		{GoodsID=10994,GaiLv1=4214802,GaiLv2=4268925,Num=1,BiaoZhi=0},
		{GoodsID=10995,GaiLv1=4268926,GaiLv2=4305008,Num=1,BiaoZhi=0},
		{GoodsID=10996,GaiLv1=4305009,GaiLv2=4359132,Num=1,BiaoZhi=0},
		{GoodsID=10997,GaiLv1=4359133,GaiLv2=4395215,Num=1,BiaoZhi=0},
		{GoodsID=10992,GaiLv1=4395216,GaiLv2=4431298,Num=1,BiaoZhi=0},
		{GoodsID=10993,GaiLv1=4431299,GaiLv2=4458360,Num=1,BiaoZhi=0},
		{GoodsID=11137,GaiLv1=4458361,GaiLv2=4494443,Num=1,BiaoZhi=0},
		{GoodsID=11138,GaiLv1=4494444,GaiLv2=4521505,Num=1,BiaoZhi=0},
		{GoodsID=11133,GaiLv1=4521506,GaiLv2=4557588,Num=1,BiaoZhi=0},
		{GoodsID=11134,GaiLv1=4557589,GaiLv2=4584650,Num=1,BiaoZhi=0},
		{GoodsID=11139,GaiLv1=4584651,GaiLv2=4620733,Num=1,BiaoZhi=0},
		{GoodsID=11140,GaiLv1=4620734,GaiLv2=4647795,Num=1,BiaoZhi=0},
		{GoodsID=11135,GaiLv1=4647796,GaiLv2=4683878,Num=1,BiaoZhi=0},
		{GoodsID=11136,GaiLv1=4683879,GaiLv2=4710940,Num=1,BiaoZhi=0},
		{GoodsID=82032,GaiLv1=4710941,GaiLv2=4981560,Num=1,BiaoZhi=0},
		{GoodsID=929,GaiLv1=4981561,GaiLv2=5252180,Num=1,BiaoZhi=0},
		{GoodsID=80274,GaiLv1=5252181,GaiLv2=5793419,Num=5,BiaoZhi=0},
		{GoodsID=88991,GaiLv1=5793420,GaiLv2=6064039,Num=2,BiaoZhi=0},
		{GoodsID=75,GaiLv1=6064040,GaiLv2=6334659,Num=2,BiaoZhi=0},
		{GoodsID=80686,GaiLv1=6334660,GaiLv2=6605279,Num=2,BiaoZhi=0},
		{GoodsID=80689,GaiLv1=6605280,GaiLv2=6875899,Num=2,BiaoZhi=0},
		{GoodsID=80621,GaiLv1=6875900,GaiLv2=7417138,Num=2,BiaoZhi=0},
		{GoodsID=89093,GaiLv1=7417139,GaiLv2=7687758,Num=10,BiaoZhi=0},
		{GoodsID=82004,GaiLv1=7687759,GaiLv2=7904254,Num=50,BiaoZhi=0},
		{GoodsID=80397,GaiLv1=7904255,GaiLv2=8174874,Num=5,BiaoZhi=0},
		{GoodsID=88910,GaiLv1=8174875,GaiLv2=8716113,Num=1,BiaoZhi=0},
		{GoodsID=765,GaiLv1=8716114,GaiLv2=8986733,Num=2,BiaoZhi=0},
		{GoodsID=88932,GaiLv1=8986734,GaiLv2=8989740,Num=1,BiaoZhi=1},
		{GoodsID=88933,GaiLv1=8989741,GaiLv2=8992747,Num=1,BiaoZhi=1},
		{GoodsID=88934,GaiLv1=8992748,GaiLv2=8995754,Num=1,BiaoZhi=1},
		{GoodsID=40346,GaiLv1=8995755,GaiLv2=9003272,Num=1,BiaoZhi=1},
		{GoodsID=40348,GaiLv1=9003273,GaiLv2=9009286,Num=1,BiaoZhi=1},
		{GoodsID=40326,GaiLv1=9009287,GaiLv2=9016804,Num=1,BiaoZhi=1},
		{GoodsID=40328,GaiLv1=9016805,GaiLv2=9022818,Num=1,BiaoZhi=1},
		{GoodsID=40306,GaiLv1=9022819,GaiLv2=9030336,Num=1,BiaoZhi=1},
		{GoodsID=40308,GaiLv1=9030337,GaiLv2=9036350,Num=1,BiaoZhi=1},
		{GoodsID=9507,GaiLv1=9036351,GaiLv2=9044942,Num=1,BiaoZhi=1},
		{GoodsID=39704,GaiLv1=9044943,GaiLv2=9054965,Num=1,BiaoZhi=1},
		{GoodsID=39705,GaiLv1=9054966,GaiLv2=9070000,Num=1,BiaoZhi=1},
		{GoodsID=39706,GaiLv1=9070001,GaiLv2=9085035,Num=1,BiaoZhi=1},
		{GoodsID=32016,GaiLv1=9085036,GaiLv2=9088794,Num=1,BiaoZhi=1},
		{GoodsID=32017,GaiLv1=9088795,GaiLv2=9092553,Num=1,BiaoZhi=1},
		{GoodsID=32020,GaiLv1=9092554,GaiLv2=9095560,Num=1,BiaoZhi=1},
		{GoodsID=32021,GaiLv1=9095561,GaiLv2=9098567,Num=1,BiaoZhi=1},
		{GoodsID=89040,GaiLv1=9098568,GaiLv2=9118613,Num=1,BiaoZhi=1},
		{GoodsID=89041,GaiLv1=9118614,GaiLv2=9138659,Num=1,BiaoZhi=1},
		{GoodsID=89042,GaiLv1=9138660,GaiLv2=9153694,Num=1,BiaoZhi=1},
		{GoodsID=89043,GaiLv1=9153695,GaiLv2=9173740,Num=1,BiaoZhi=1},
		{GoodsID=31027,GaiLv1=9173741,GaiLv2=9177499,Num=1,BiaoZhi=1},
		{GoodsID=31028,GaiLv1=9177500,GaiLv2=9181795,Num=1,BiaoZhi=1},
		{GoodsID=31029,GaiLv1=9181796,GaiLv2=9186091,Num=1,BiaoZhi=1},
		{GoodsID=31031,GaiLv1=9186092,GaiLv2=9189850,Num=1,BiaoZhi=1},
		{GoodsID=31215,GaiLv1=9189851,GaiLv2=9209896,Num=1,BiaoZhi=1},
		{GoodsID=31216,GaiLv1=9209897,GaiLv2=9229942,Num=1,BiaoZhi=1},
		{GoodsID=31217,GaiLv1=9229943,GaiLv2=9249988,Num=1,BiaoZhi=1},
		{GoodsID=31218,GaiLv1=9249989,GaiLv2=9270034,Num=1,BiaoZhi=1},
		{GoodsID=39512,GaiLv1=9270035,GaiLv2=9282062,Num=1,BiaoZhi=1},
		{GoodsID=39507,GaiLv1=9282063,GaiLv2=9302108,Num=1,BiaoZhi=1},
		{GoodsID=39508,GaiLv1=9302109,GaiLv2=9322154,Num=1,BiaoZhi=1},
		{GoodsID=39509,GaiLv1=9322155,GaiLv2=9342200,Num=1,BiaoZhi=1},
		{GoodsID=39515,GaiLv1=9342201,GaiLv2=9362246,Num=1,BiaoZhi=1},
		{GoodsID=11252,GaiLv1=9362247,GaiLv2=9369764,Num=1,BiaoZhi=1},
		{GoodsID=11253,GaiLv1=9369765,GaiLv2=9374776,Num=1,BiaoZhi=1},
		{GoodsID=11254,GaiLv1=9374777,GaiLv2=9382294,Num=1,BiaoZhi=1},
		{GoodsID=11255,GaiLv1=9382295,GaiLv2=9387306,Num=1,BiaoZhi=1},
		{GoodsID=11270,GaiLv1=9387307,GaiLv2=9399334,Num=1,BiaoZhi=1},
		{GoodsID=11271,GaiLv1=9399335,GaiLv2=9407926,Num=1,BiaoZhi=1},
		{GoodsID=11272,GaiLv1=9407927,GaiLv2=9419954,Num=1,BiaoZhi=1},
		{GoodsID=11273,GaiLv1=9419955,GaiLv2=9428546,Num=1,BiaoZhi=1},
		{GoodsID=11274,GaiLv1=9428547,GaiLv2=9440574,Num=1,BiaoZhi=1},
		{GoodsID=11275,GaiLv1=9440575,GaiLv2=9449166,Num=1,BiaoZhi=1},
		{GoodsID=11276,GaiLv1=9449167,GaiLv2=9459189,Num=1,BiaoZhi=1},
		{GoodsID=11277,GaiLv1=9459190,GaiLv2=9466707,Num=1,BiaoZhi=1},
		{GoodsID=11281,GaiLv1=9466708,GaiLv2=9476730,Num=1,BiaoZhi=1},
		{GoodsID=11282,GaiLv1=9476731,GaiLv2=9484248,Num=1,BiaoZhi=1},
		{GoodsID=11340,GaiLv1=9484249,GaiLv2=9491766,Num=1,BiaoZhi=1},
		{GoodsID=11341,GaiLv1=9491767,GaiLv2=9496778,Num=1,BiaoZhi=1},
		{GoodsID=11342,GaiLv1=9496779,GaiLv2=9504296,Num=1,BiaoZhi=1},
		{GoodsID=11343,GaiLv1=9504297,GaiLv2=9509308,Num=1,BiaoZhi=1},
		{GoodsID=11501,GaiLv1=9509309,GaiLv2=9515322,Num=1,BiaoZhi=1},
		{GoodsID=11502,GaiLv1=9515323,GaiLv2=9519081,Num=1,BiaoZhi=1},
		{GoodsID=11503,GaiLv1=9519082,GaiLv2=9525095,Num=1,BiaoZhi=1},
		{GoodsID=11504,GaiLv1=9525096,GaiLv2=9528854,Num=1,BiaoZhi=1},
		{GoodsID=11505,GaiLv1=9528855,GaiLv2=9538877,Num=1,BiaoZhi=1},
		{GoodsID=11506,GaiLv1=9538878,GaiLv2=9546395,Num=1,BiaoZhi=1},
		{GoodsID=11507,GaiLv1=9546396,GaiLv2=9553913,Num=1,BiaoZhi=1},
		{GoodsID=11508,GaiLv1=9553914,GaiLv2=9558925,Num=1,BiaoZhi=1},
		{GoodsID=11283,GaiLv1=9558926,GaiLv2=9563937,Num=1,BiaoZhi=1},
		{GoodsID=11284,GaiLv1=9563938,GaiLv2=9566944,Num=1,BiaoZhi=1},
		{GoodsID=11287,GaiLv1=9566945,GaiLv2=9571956,Num=1,BiaoZhi=1},
		{GoodsID=11288,GaiLv1=9571957,GaiLv2=9574963,Num=1,BiaoZhi=1},
		{GoodsID=11034,GaiLv1=9574964,GaiLv2=9580977,Num=1,BiaoZhi=1},
		{GoodsID=11035,GaiLv1=9580978,GaiLv2=9584736,Num=1,BiaoZhi=1},
		{GoodsID=11042,GaiLv1=9584737,GaiLv2=9590750,Num=1,BiaoZhi=1},
		{GoodsID=11043,GaiLv1=9590751,GaiLv2=9594509,Num=1,BiaoZhi=1},
		{GoodsID=11330,GaiLv1=9594510,GaiLv2=9599521,Num=1,BiaoZhi=1},
		{GoodsID=11331,GaiLv1=9599522,GaiLv2=9602528,Num=1,BiaoZhi=1},
		{GoodsID=11332,GaiLv1=9602529,GaiLv2=9607540,Num=1,BiaoZhi=1},
		{GoodsID=11333,GaiLv1=9607541,GaiLv2=9610547,Num=1,BiaoZhi=1},
		{GoodsID=11334,GaiLv1=9610548,GaiLv2=9612552,Num=1,BiaoZhi=1},
		{GoodsID=82032,GaiLv1=9612553,GaiLv2=9627587,Num=10,BiaoZhi=1},
		{GoodsID=929,GaiLv1=9627588,GaiLv2=9642622,Num=10,BiaoZhi=1},
		{GoodsID=80274,GaiLv1=9642623,GaiLv2=9657657,Num=100,BiaoZhi=1},
		{GoodsID=88991,GaiLv1=9657658,GaiLv2=9672692,Num=20,BiaoZhi=1},
		{GoodsID=75,GaiLv1=9672693,GaiLv2=9687727,Num=20,BiaoZhi=1},
		{GoodsID=80686,GaiLv1=9687728,GaiLv2=9702762,Num=20,BiaoZhi=1},
		{GoodsID=80689,GaiLv1=9702763,GaiLv2=9717797,Num=20,BiaoZhi=1},
		{GoodsID=80621,GaiLv1=9717798,GaiLv2=9732832,Num=40,BiaoZhi=1},
		{GoodsID=88171,GaiLv1=9732833,GaiLv2=9747867,Num=20,BiaoZhi=0},
		{GoodsID=88910,GaiLv1=9747868,GaiLv2=9762902,Num=20,BiaoZhi=1},
		{GoodsID=89093,GaiLv1=9762903,GaiLv2=9777937,Num=100,BiaoZhi=0},
		{GoodsID=82004,GaiLv1=9777938,GaiLv2=9792972,Num=400,BiaoZhi=1},
		{GoodsID=88885,GaiLv1=9792973,GaiLv2=9808007,Num=2,BiaoZhi=1},
		{GoodsID=88886,GaiLv1=9808008,GaiLv2=9828053,Num=2,BiaoZhi=1},
		{GoodsID=88887,GaiLv1=9828054,GaiLv2=9838076,Num=2,BiaoZhi=1},
		{GoodsID=88888,GaiLv1=9838077,GaiLv2=9853111,Num=2,BiaoZhi=1},
		{GoodsID=82032,GaiLv1=9853112,GaiLv2=9859125,Num=25,BiaoZhi=1},
		{GoodsID=929,GaiLv1=9859126,GaiLv2=9865139,Num=25,BiaoZhi=1},
		{GoodsID=80274,GaiLv1=9865140,GaiLv2=9871153,Num=250,BiaoZhi=1},
		{GoodsID=88991,GaiLv1=9871154,GaiLv2=9877167,Num=50,BiaoZhi=1},
		{GoodsID=75,GaiLv1=9877168,GaiLv2=9883181,Num=50,BiaoZhi=1},
		{GoodsID=80686,GaiLv1=9883182,GaiLv2=9889195,Num=50,BiaoZhi=1},
		{GoodsID=80689,GaiLv1=9889196,GaiLv2=9895209,Num=50,BiaoZhi=1},
		{GoodsID=80621,GaiLv1=9895210,GaiLv2=9901223,Num=100,BiaoZhi=1},
		{GoodsID=88171,GaiLv1=9901224,GaiLv2=9907237,Num=50,BiaoZhi=0},
		{GoodsID=88910,GaiLv1=9907238,GaiLv2=9913251,Num=50,BiaoZhi=1},
		{GoodsID=89093,GaiLv1=9913252,GaiLv2=9919265,Num=250,BiaoZhi=0},
		{GoodsID=82004,GaiLv1=9919266,GaiLv2=9925279,Num=1000,BiaoZhi=1},
		{GoodsID=88885,GaiLv1=9925280,GaiLv2=9935302,Num=3,BiaoZhi=1},
		{GoodsID=88886,GaiLv1=9935303,GaiLv2=9948666,Num=3,BiaoZhi=1},
		{GoodsID=88887,GaiLv1=9948667,GaiLv2=9955348,Num=3,BiaoZhi=1},
		{GoodsID=88888,GaiLv1=9955349,GaiLv2=9965371,Num=3,BiaoZhi=1},
		{GoodsID=31041,GaiLv1=9965372,GaiLv2=9966274,Num=1,BiaoZhi=1},
		{GoodsID=31043,GaiLv1=9966275,GaiLv2=9967357,Num=1,BiaoZhi=1},
		{GoodsID=31044,GaiLv1=9967358,GaiLv2=9968190,Num=1,BiaoZhi=1},
		{GoodsID=31045,GaiLv1=9968191,GaiLv2=9969273,Num=1,BiaoZhi=1},
		{GoodsID=31038,GaiLv1=9969274,GaiLv2=9971438,Num=1,BiaoZhi=1},
		{GoodsID=31039,GaiLv1=9971439,GaiLv2=9972115,Num=1,BiaoZhi=1},
		{GoodsID=31030,GaiLv1=9972116,GaiLv2=9973198,Num=1,BiaoZhi=1},
		{GoodsID=31022,GaiLv1=9973199,GaiLv2=9973875,Num=1,BiaoZhi=1},
		{GoodsID=31024,GaiLv1=9973876,GaiLv2=9975680,Num=1,BiaoZhi=1},
		{GoodsID=11509,GaiLv1=9975681,GaiLv2=9976763,Num=1,BiaoZhi=1},
		{GoodsID=11510,GaiLv1=9976764,GaiLv2=9977846,Num=1,BiaoZhi=1},
		{GoodsID=10948,GaiLv1=9977847,GaiLv2=9980011,Num=1,BiaoZhi=1},
		{GoodsID=10949,GaiLv1=9980012,GaiLv2=9981816,Num=1,BiaoZhi=1},
		{GoodsID=10911,GaiLv1=9981817,GaiLv2=9983981,Num=1,BiaoZhi=1},
		{GoodsID=10912,GaiLv1=9983982,GaiLv2=9985786,Num=1,BiaoZhi=1},
		{GoodsID=11515,GaiLv1=9985787,GaiLv2=9986689,Num=1,BiaoZhi=1},
		{GoodsID=11516,GaiLv1=9986690,GaiLv2=9987366,Num=1,BiaoZhi=1},
		{GoodsID=11517,GaiLv1=9987367,GaiLv2=9988449,Num=1,BiaoZhi=1},
		{GoodsID=11518,GaiLv1=9988450,GaiLv2=9989352,Num=1,BiaoZhi=1},
		{GoodsID=11519,GaiLv1=9989353,GaiLv2=9990029,Num=1,BiaoZhi=1},
		{GoodsID=11520,GaiLv1=9990030,GaiLv2=9991112,Num=1,BiaoZhi=1},
		{GoodsID=11071,GaiLv1=9991113,GaiLv2=9992917,Num=1,BiaoZhi=1},
		{GoodsID=11072,GaiLv1=9992918,GaiLv2=9994722,Num=1,BiaoZhi=1},
		{GoodsID=11073,GaiLv1=9994723,GaiLv2=9996527,Num=1,BiaoZhi=1},
		{GoodsID=11074,GaiLv1=9996528,GaiLv2=9998332,Num=1,BiaoZhi=1},
		{GoodsID=32019,GaiLv1=9998333,GaiLv2=9999415,Num=1,BiaoZhi=1},
		{GoodsID=32023,GaiLv1=9999416,GaiLv2=10000000,Num=1,BiaoZhi=1},
}

--local ChongZhiBoxTeShuGoodsID = {88932,88933,88934,40346,40348,40326,40328,40306,40308,9507,39704,39705,39706,32016,32017,32020,
--								32021,89040,89041,89042,89043,31027,31028,31029,31031,31215,31216,31217,31218,39512,39507,39508,
--								39509,39515,11252,11253,11254,11255,11270,11271,11272,11273,11274,11275,11276,11277,11281,11282,
--								11340,11341,11342,11343,11501,11502,11503,11504,11505,11506,11507,11508,11283,11284,11287,11288,
--								11034,11035,11042,11043,11330,11331,11332,11333,11334,82032,929,80274,88991,75,80686,80689,80621,
--								88171,39601,89093,82004,88885,88886,88887,88888,82032,929,80274,88991,75,80686,80689,80621,88171,
--								39601,89093,82004,88885,88886,88887,88888,31041,31043,31044,31045,31038,31039,31030,31022,31024,
--								11509,11510,10948,10949,10911,10912,11515,11516,11517,11518,11519,11520,11071,11072,11073,11074,32019,32023,}

local ChongZhiBoxTeShuGoodsID = {
[31041] = 4,
[31043] = 5,
[31044] = 6,
[31045] = 7,
[31038] = 8,
[31039] = 9,
[31030] = 10,
[31022] = 11,
[31024] = 12,
[11509] = 13,
[11510] = 14,
[10948] = 15,
[10949] = 16,
[10911] = 17,
[10912] = 18,
[11515] = 19,
[11516] = 20,
[11517] = 21,
[11518] = 22,
[11519] = 23,
[11520] = 24,
[11071] = 25,
[11072] = 26,
[11073] = 27,
[11074] = 28,
[32019] = 29,
[32023] = 30,
}
function LC_ChongZhiBoxUse(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID()
	local JiangLiTable = ChongZhiBaoXiang_GoodsTable
	local JiangLiGaiLv = math.random(10000000)
	for j in JiangLiTable do
		local GaiLv1 = JiangLiTable[j].GaiLv1
		local GaiLv2 = JiangLiTable[j].GaiLv2

		if JiangLiGaiLv >= GaiLv1 and JiangLiGaiLv <= GaiLv2 then
			local JiangLiGoodsID = JiangLiTable[j].GoodsID
			local JiangLiGoodsNum = JiangLiTable[j].Num
			local BiaoZhi = JiangLiTable[j].BiaoZhi			
			
			if API_ActorGetPackageSize(ActorID) < 3 then
				API_ResponseWrite('<name>英雄宝箱</name>')
				API_ResponseWrite('<text>您的背包空间不足，请至少保留三个空格，再打开英雄宝箱。</text>')
				API_ResponseWrite('<br><br><a>确定</a>')
				API_ResponseFlush(ActorID)
				return 0						
			end
			if API_ActorGetGoodsNum(ActorID,89099) > 0 and API_ActorRemoveGoods(ActorID,89099,1,'删除英雄宝箱') then				
				if BiaoZhi == 1 then
					local Key = ChongZhiBoxTeShuGoodsID[JiangLiGoodsID]
					if Key ~= nil then
						local ShengYuNum = API_VarDataGetNumber_Ex(1,0,-6016,1,Key)
						if ShengYuNum > 0 then
							ShengYuNum = ShengYuNum - 1
							API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,Key,ShengYuNum)
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在打开英雄宝箱获得了'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')					
						else
							JiangLiGoodsID = 88887
							JiangLiGoodsNum = 3
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在打开英雄宝箱获得了'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')					
						end
					else
						API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在打开英雄宝箱获得了'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')					
					end
				end

				local PD = 0
				for j,v in baoshiwupinbiao do
					if JiangLiGoodsID == v then
						PD = 1
					end
				end
				if PD == 1 then
					fuzhuangbaoshicuhangjianshuxingadd(ActorID,JiangLiGoodsID,0,0)
				else
					API_AddActorGoodsFlag(ActorID,JiangLiGoodsID,JiangLiGoodsNum,0,'')
				end
				API_ActorSendMsg(ActorID,8,'获得'..JiangLiGoodsNum..'个'..API_GetGoodsName(JiangLiGoodsID)..'')
				return 1
			else
				API_ActorSendMsg(ActorID,3,'扣除英雄宝箱失败')
				return 0	
			end
		end
	end
end


if API_GetServerID() == 1 then
	if LC_ChongZhiBox_LoadingTimeTriggerGID ~= nil then
		API_DestroyTriggerG(LC_ChongZhiBox_LoadingTimeTriggerGID)
	end
	LC_ChongZhiBox_LoadingTimeTriggerGID = API_CreateTimerTriggerG(0,0,120,-1,'LC_ChongZhiBox_ShujuQingChu')
end

function LC_ChongZhiBox_ShujuQingChu()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.time()
	
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6016,1,3) and API_GetServerID() == 1 then
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,4,5)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,5,2)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,6,2)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,7,5)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,8,5)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,9,2)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,10,2)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,11,2)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,12,5)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,13,2)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,14,2)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,15,5)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,16,5)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,17,5)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,18,5)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,19,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,20,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,21,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,22,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,23,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,24,1)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,25,5)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,26,5)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,27,5)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,28,5)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,29,5)
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,30,2)
		
		local DayTime = (7 - Week) * 86400
		local NowTime = os.date("*t", os.time()) 
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 23 
		NowTime.min = 59 
		NowTime.sec = 59 
		local NightTime = os.time(NowTime) 
		local NextTime = NightTime + DayTime + 1
		API_VarDataSetNumber_Ex_Sync(1,0,-6016,1,3,NextTime)
	end
end
