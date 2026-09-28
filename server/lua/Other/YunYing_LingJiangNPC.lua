----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\YunYing_LingJiangNPC.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	谭明礼
--日  期:	2009-6-3
--版  本:	1.0
--描  述:	领奖密使NPC
--应  用:  
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
--修改人：  黄蕾
--日  期：  2010-11-23
--描  叙：  1,对回调函数和关键API增加注释描叙
--          2,英雄岛市场部会员合作礼包需求10_11_12.doc
--           (【双蛋】有礼超级大礼包&DB类型38)
--           (新手礼包，每周礼包，节日礼包【VIP1、VIP2,VIP3】&DB类型39-43)
--        20120507增加媒体营销活动礼包
------------------------------------------------------------------------------------------------------------------------

if API_GetServerID() == 1 then
	YunYing_ChongWuKaTable = {
		[1] = {
				{CWKID=31005,CWKNum=200,Key=1},		--光灵兽卡
				{CWKID=31006,CWKNum=700,Key=2},		--熊宝宝卡
				{CWKID=31007,CWKNum=700,Key=3},		--粉红魔灵卡
				{CWKID=31015,CWKNum=150,Key=4},		--绿龙宝宝卡
				{CWKID=31016,CWKNum=185,Key=5},		--恶魔猪卡
				{CWKID=31014,CWKNum=3,Key=6},		--雷霆兽卡
			},
		[2] = {
				{CWKID=31005,CWKNum=40,Key=11},		--光灵兽卡
				{CWKID=31006,CWKNum=140,Key=12},	--熊宝宝卡
				{CWKID=31007,CWKNum=140,Key=13},	--粉红魔灵卡
				{CWKID=31015,CWKNum=30,Key=14},		--绿龙宝宝卡
				{CWKID=31016,CWKNum=38,Key=15},		--恶魔猪卡
				{CWKID=31014,CWKNum=1,Key=16},		--雷霆兽卡
			},
		[3] = {
				{CWKID=31005,CWKNum=20,Key=21},		--光灵兽卡
				{CWKID=31006,CWKNum=70,Key=22},		--熊宝宝卡
				{CWKID=31007,CWKNum=70,Key=23},		--粉红魔灵卡
			},
	}
end

local LJMSID = 12050 --领奖密使ID
local OwnerID = -4002 --全局交互数据
local Time = os.time()
local YunYingTime = {year=2009,month=6,day=25,hour=0,minute=0,second=0}
local ActTime = os.time(YunYingTime)

--根据当前服务器时间和服务器ID判断
if ActTime > Time then
	local CFQTime = ActTime - Time
	if API_GetServerID() == 1 then
		if YunYing_CFQ ~= nil then
			API_DestroyTriggerG(YunYing_CFQ)
		end
		YunYing_CFQ = API_CreateTimerTriggerG(0,0,CFQTime,1,'YunYing_TimerTriggerGCallFunc')
	end
else
	if API_GetServerID() == 1 then
		if YunYing_LBLJMS ~= nil then
			if API_GetMonsterID(YunYing_LBLJMS) > 0 then
				API_DestroyMonster(YunYing_LBLJMS)
			end
		end
		YunYing_LBLJMS = API_CreateMonsterEx(25,LJMSID,126,312,3,0,-1,1);--返回NPC的FastID
		if YunYing_DGLJMS ~= nil then
			if API_GetMonsterID(YunYing_DGLJMS) > 0 then
				API_DestroyMonster(YunYing_DGLJMS)
			end
		end
		YunYing_DGLJMS = API_CreateMonsterEx(9,LJMSID,157,389,5,0,-1,1)
	end
end

--全局时间触发回调函数(创建NPC)
function YunYing_TimerTriggerGCallFunc(a,b)
	if API_GetServerID() == 1 then
		if YunYing_LBLJMS ~= nil then
			if API_GetMonsterID(YunYing_LBLJMS) > 0 then
				API_DestroyMonster(YunYing_LBLJMS)
			end
		end
		YunYing_LBLJMS = API_CreateMonsterEx(25,LJMSID,126,312,3,0,-1,1)
		if YunYing_DGLJMS ~= nil then
			if API_GetMonsterID(YunYing_DGLJMS) > 0 then
				API_DestroyMonster(YunYing_DGLJMS)
			end
		end
		YunYing_DGLJMS = API_CreateMonsterEx(9,LJMSID,157,389,5,0,-1,1)
	end
end


--点击NPC回调函数。( LUAReqFunc.csv文件相关联)
function YunYing_LQJL(ActorID,NPCID)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	--获取服务器开启天数(OpenTian:比较传入时间和当前时间相差天数；OpenMiao：已经开放的时间。)
	local OpenTian,OpenMiao = PublicFun_GetServerOpenDay()
	local Playname = API_GetActorName(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local XuLieHao = API_RequestGetString(2);-- Request对象获取玩家提交的字符串变量值
	local ZiFuLength = string.len(XuLieHao)
	if OpenTian > 7 then
		if SelectItem == 0 then
			--第一个面板
			API_ResponseWrite('<text>亲爱的'..Playname..'，在我这里可以通过输入</text><text color="255,0,0">有奖序列号</text><text>领取到丰厚的游戏道具礼包哦！</text><br>')
			--API_ResponseWrite('<br><text color="255,0,0">一个帐号一种礼包只能领取一次</text><br><br>')
			API_ResponseWrite('<br><a href="YunYing_LQJL?1=1">输入序列号</a><br><br>')
			API_ResponseWrite('<a>关闭</a>')
		elseif SelectItem == 1 then
				API_ResponseWrite('<text>请在下面窗口中输入</text><text color="255,0,0">序列号(13个字符)</text><text>。</text><br><br>')
				API_ResponseWrite('<input type="string" name="2" size="13" width="140">')
				API_ResponseWrite('<text> </text>')
				API_ResponseWrite('<a href="YunYing_LQJL?1=2">输入完成，提交</a><br><br>')
				API_ResponseWrite('<a>关闭</a>')
		elseif SelectItem == 2 then
			if ZiFuLength == 0 then
				API_ResponseWrite('<text>你没有输入序列号，请在之前的窗口中输入序列号</text><br><br>')
				API_ResponseWrite('<a>确定</a>')
				return
			end
			if API_ActorGetPackageSize(ActorID) > 0 then
				API_CheckCDKEY(ActorID,0,0,0,XuLieHao)
			else
				API_ResponseWrite('<text>背包空间不足，请至少保留一个空位再来领取奖励。</text><br><br>')
				API_ResponseWrite('<a>确定</a>')
			end
		end
	else
		API_ResponseWrite('<text>服务器开启的一周内不能领取奖励。</text><br><br>')
		API_ResponseWrite('<a>确定</a>')
	end
end

--{[DBType]={GoodsID,GoodsNum,GoodsFlag,szDesc}}; 
YunYing_CDKEYTable = {
			[1] = {GoodsID=88057,GoodsNum=1,GoodsFlag=3,szDesc='【下载有礼】大礼包'},
			[2] = {GoodsID=88059,GoodsNum=1,GoodsFlag=3,szDesc='QQ会员超级礼包'},
			[3] = {GoodsID=88060,GoodsNum=1,GoodsFlag=3,szDesc='QQ会员特权礼包'},
			[4] = {GoodsID=88061,GoodsNum=1,GoodsFlag=3,szDesc='QQ红钻特权礼包'},
			[5] = {GoodsID=88062,GoodsNum=1,GoodsFlag=3,szDesc='QQ黄钻·蓓蕾公主礼包'},
			[6] = {GoodsID=88063,GoodsNum=1,GoodsFlag=3,szDesc='QQ蓝钻特权礼包'},
			[7] = {GoodsID=88064,GoodsNum=1,GoodsFlag=3,szDesc='QQ网吧特权礼包'},
			[8] = {GoodsID=88058,GoodsNum=1,GoodsFlag=3,szDesc='【英雄岛】超级礼包'},
			[9] = {GoodsID=88079,GoodsNum=1,GoodsFlag=3,szDesc='【英雄岛】88元大礼包'},
			[10] = {GoodsID=88098,GoodsNum=1,GoodsFlag=3,szDesc='皇冠礼包'},
			[11] = {GoodsID=88099,GoodsNum=1,GoodsFlag=3,szDesc='钻石礼包'},
			[12] = {GoodsID=88100,GoodsNum=1,GoodsFlag=3,szDesc='白金礼包'},
			[13] = {GoodsID=88148,GoodsNum=1,GoodsFlag=3,szDesc='QQ传递达人礼包'},
			[14] = {GoodsID=88866,GoodsNum=1,GoodsFlag=3,szDesc='贺岁公测大礼包'},
			[27] = {GoodsID=88937,GoodsNum=1,GoodsFlag=3,szDesc='移动大礼包'},
			[38] = {GoodsID=88983,GoodsNum=1,GoodsFlag=3,szDesc='双“蛋”有礼超级大礼包'},
			[39] = {GoodsID=88984,GoodsNum=1,GoodsFlag=3,szDesc='新手礼包'},
			[40] = {GoodsID=88987,GoodsNum=1,GoodsFlag=3,szDesc='每周礼包'},
			[41] = {GoodsID=88988,GoodsNum=1,GoodsFlag=3,szDesc='节日礼包'},--VIP1专属礼包
			[42] = {GoodsID=88989,GoodsNum=1,GoodsFlag=3,szDesc='节日礼包'},--VIP2专属礼包
			[43] = {GoodsID=88990,GoodsNum=1,GoodsFlag=3,szDesc='节日礼包'},--VIP3专属礼包
			[44] = {GoodsID=89048,GoodsNum=1,GoodsFlag=3,szDesc='QQ会员年费特权礼包'},--年费特权礼包
			[45] = {GoodsID=89120,GoodsNum=1,GoodsFlag=3,szDesc='会员专享礼包'},--会员专享礼包
			[50] = {GoodsID=89161,GoodsNum=1,GoodsFlag=3,szDesc='勇士礼包'},--勇士礼包
			[51] = {GoodsID=89162,GoodsNum=1,GoodsFlag=3,szDesc='新手尊贵大礼包'},--新手尊贵大礼包
			[52] = {GoodsID=89164,GoodsNum=1,GoodsFlag=3,szDesc='黄金大礼包'},--黄金大礼包
			[53] = {GoodsID=89163,GoodsNum=1,GoodsFlag=3,szDesc='白金礼包'},--白金礼包
			[54] = {GoodsID=89192,GoodsNum=1,GoodsFlag=3,szDesc='腾讯嘉年华(2012)礼包'},--腾讯嘉年华(2012)礼包
			
}
--YunYing_CheckCDKEY是API_CheckCDKEY的回调函数（lType为活动类型（和DB约定）；lReturn为1表示CDKEY使用成功（或者有效））
function YunYing_CheckCDKEY(ActorID,CDKEY,UsedType,Return,DBType,szRetDesc,Type,Param)
	local ActorName = API_GetActorName(ActorID)
	local nActorLev = API_GetActorExpLevel(ActorID)--获取玩家等级
	local GoodsID,GoodsNum,GoodsFlag = 0,0,0
	local szDesc = ''
	if YunYing_CDKEYTable[DBType] ~= nil then
		GoodsID = YunYing_CDKEYTable[DBType].GoodsID
		GoodsNum = YunYing_CDKEYTable[DBType].GoodsNum
		GoodsFlag = YunYing_CDKEYTable[DBType].GoodsFlag
		szDesc = YunYing_CDKEYTable[DBType].szDesc
	end
	if Param == 1 and Return == 1 then
		if DBType == 10 then
			if API_AddActorGoodsFlag(ActorID,GoodsID,GoodsNum,GoodsFlag,'输入序列号成功添加'..szDesc..'') then
				API_ResponseWrite('<img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><text>  × '..GoodsNum..'</text><br>')
				API_ResponseWrite('<br><text>恭喜你获得</text><text color="255,0,0">'..szDesc..'</text><br><br>')
				API_ResponseWrite('<br><a>确定</a>')
				API_ResponseFlush(ActorID)
			end	
			if math.random(100000) <= 3876 then
				local a = YunYing_ChongWuKaTable[1][math.random(table.getn(YunYing_ChongWuKaTable[1]))]
				local CWKID = a.CWKID
				local MaxNum = a.CWKNum
				local Key = a.Key
				local CWKNowNum = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				if CWKNowNum < MaxNum then
					if API_ActorGetPackageSize(ActorID) > 0 then
						API_AddActorGoodsFlag(ActorID,CWKID,1,3,'领取'..szDesc..'时随机获得宠物卡')
						API_ActorSendMsg(ActorID,3,'恭喜您领取'..szDesc..'随机获得了宠物卡片')
						CWKNowNum = CWKNowNum + 1
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,CWKNowNum)
					else
						API_SendActorMailByName(ActorName,CWKID,1,3,'宠物卡','领取'..szDesc..'随机获得宠物卡')
						API_ActorSendMsg(ActorID,3,'恭喜您领取'..szDesc..'随机获得了宠物卡片，请前往邮箱收取')
						CWKNowNum = CWKNowNum + 1
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,CWKNowNum)
					end
				end
			end	
		elseif DBType == 11 then
			if API_AddActorGoodsFlag(ActorID,GoodsID,GoodsNum,GoodsFlag,'输入序列号成功添加'..szDesc..'') then
				API_ResponseWrite('<img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><text>  × '..GoodsNum..'</text><br>')
				API_ResponseWrite('<br><text>恭喜你获得</text><text color="255,0,0">'..szDesc..'</text><br><br>')
				API_ResponseWrite('<br><a>确定</a>')
				API_ResponseFlush(ActorID)
			end	
			if math.random(100000) <= 259 then
				local a = YunYing_ChongWuKaTable[2][math.random(table.getn(YunYing_ChongWuKaTable[2]))]
				local CWKID = a.CWKID
				local MaxNum = a.CWKNum
				local Key = a.Key
				local CWKNowNum = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				if CWKNowNum < MaxNum then
					if API_ActorGetPackageSize(ActorID) > 0 then
						API_AddActorGoodsFlag(ActorID,CWKID,1,3,'领取'..szDesc..'时随机获得宠物卡')
						API_ActorSendMsg(ActorID,3,'恭喜您领取'..szDesc..'随机获得了宠物卡片')
						CWKNowNum = CWKNowNum + 1
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,CWKNowNum)
					else
						API_SendActorMailByName(ActorName,CWKID,1,3,'宠物卡','领取'..szDesc..'随机获得宠物卡')
						API_ActorSendMsg(ActorID,3,'恭喜您领取'..szDesc..'随机获得了宠物卡片，请前往邮箱收取')
						CWKNowNum = CWKNowNum + 1
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,CWKNowNum)
					end
				end
			end	
		elseif DBType == 12 then
			if API_AddActorGoodsFlag(ActorID,GoodsID,GoodsNum,GoodsFlag,'输入序列号成功添加'..szDesc..'') then
				API_ResponseWrite('<img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><text>  × '..GoodsNum..'</text><br>')
				API_ResponseWrite('<br><text>恭喜你获得</text><text color="255,0,0">'..szDesc..'</text><br><br>')
				API_ResponseWrite('<br><a>确定</a>')
				API_ResponseFlush(ActorID)
			end
			if math.random(100000) <= 53 then
				local a = YunYing_ChongWuKaTable[3][math.random(table.getn(YunYing_ChongWuKaTable[3]))]
				local CWKID = a.CWKID
				local MaxNum = a.CWKNum
				local Key = a.Key
				local CWKNowNum = API_VarDataGetNumber_Ex(1,0,OwnerID,1,Key)
				if CWKNowNum < MaxNum then
					if API_ActorGetPackageSize(ActorID) > 0 then
						API_AddActorGoodsFlag(ActorID,CWKID,1,3,'领取'..szDesc..'时随机获得宠物卡')
						API_ActorSendMsg(ActorID,3,'恭喜您领取'..szDesc..'随机获得了宠物卡片')
						CWKNowNum = CWKNowNum + 1
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,CWKNowNum)
					else
						API_SendActorMailByName(ActorName,CWKID,1,3,'宠物卡','领取'..szDesc..'随机获得宠物卡')
						API_ActorSendMsg(ActorID,3,'恭喜您领取'..szDesc..'随机获得了宠物卡片，请前往邮箱收取')
						CWKNowNum = CWKNowNum + 1
						API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,Key,CWKNowNum)
					end
				end
			end
		else
			if API_AddActorGoodsFlag(ActorID,GoodsID,GoodsNum,GoodsFlag,'输入序列号成功添加'..szDesc..'') then
				API_ResponseWrite('<img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><text>  × '..GoodsNum..'</text><br>')
				API_ResponseWrite('<br><text>恭喜你获得</text><text color="255,0,0">'..szDesc..'</text><br><br>')
				API_ResponseWrite('<br><a>确定</a>')
				API_ResponseFlush(ActorID)
			end
		end
		return
	end
	if Return == 1 then
		if DBType ~= 5 and DBType~= 7 and DBType~= 39 then
			API_CheckCDKEY(ActorID,DBType,1,1,CDKEY)
		elseif DBType == 5 then
			if API_GetActorSex(ActorID) == 2 then
				API_CheckCDKEY(ActorID,DBType,1,1,CDKEY)
			else
				API_ResponseWrite('<text>该礼包只有女性角色才能领取。</text><br><br>')
				API_ResponseWrite('<br><a>确定</a>')
				API_ResponseFlush(ActorID)
			end
		elseif DBType == 7 then
			API_ResponseWrite('<text>该序列号不在此处领取礼包</text><br><br>')
			API_ResponseWrite('<text>请点击网址：</text><a http="http://game.qq.com/act/a20090622hero/" underline="1">http://game.qq.com/act/a20090622hero/</a><text>  领取礼包</text><br>')
			API_ResponseWrite('<br><br><a http="http://game.qq.com/act/a20090622hero/">确定</a>')
			API_ResponseFlush(ActorID)
		--新手礼包判断 (大于15级的玩家不能领取该礼包。)
		-----------------------------------------------------------------------------------------
		elseif DBType == 39 then
			if nActorLev <= 15 then
				API_CheckCDKEY(ActorID,DBType,1,1,CDKEY)
			else
				API_ResponseWrite('<text>角色大于15级，不能领取新手礼包。</text><br><br>')
				API_ResponseWrite('<br><br><a>确定</a>')
				API_ResponseFlush(ActorID)
			end
		---------------------------------------------------------------------------------------
		--新手尊贵大礼包判断 (大于20级的玩家不能领取该礼包。)
		elseif DBType == 51 then
			if nActorLev <= 20 then
				API_CheckCDKEY(ActorID,DBType,1,1,CDKEY)
			else
				API_ResponseWrite('<text>角色大于20级，不能领取新手礼包。</text><br><br>')
				API_ResponseWrite('<br><br><a>确定</a>')
				API_ResponseFlush(ActorID)
			end
		end
	elseif Return == -1 then
		API_ResponseWrite('<text>'..szRetDesc..'</text><br><br>')
		API_ResponseWrite('<a>确定</a>')
		API_ResponseFlush(ActorID)
	else
		API_ResponseWrite('<text>领取失败，请稍候再试</text><br><br>')
		API_ResponseWrite('<a>确定</a>')
		API_ResponseFlush(ActorID)
	end
end
