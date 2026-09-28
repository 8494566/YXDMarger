-------------------------------
--文件名:	Scp\Lua\Act\LC_OnLogoutJiangLi.lua
--版  权:	深圳腾讯计算机系统有限公司
--创建人:	刘操
--日  期:	2011-11-8
--版  本:	
--描  述:   离线修炼
--应  用:  
-------------------------------


local LC_OnLogoutTime = 30276
local LC_GuaJiStart = 30275
local LC_ShenYuShiChang = 30274
local LC_SetTimesave = 30273

local OnLogoutExpTable = {
[1] = 3,
[2] = 6,
[3] = 9,
[4] = 12,
[5] = 15,
[6] = 18,
[7] = 21,
[8] = 24,
[9] = 27,
[10] = 30,
[11] = 34,
[12] = 38,
[13] = 42,
[14] = 46,
[15] = 50,
[16] = 54,
[17] = 58,
[18] = 62,
[19] = 66,
[20] = 70,
[21] = 75,
[22] = 80,
[23] = 85,
[24] = 90,
[25] = 95,
[26] = 100,
[27] = 105,
[28] = 110,
[29] = 115,
[30] = 120,
[31] = 126,
[32] = 132,
[33] = 138,
[34] = 144,
[35] = 150,
[36] = 156,
[37] = 162,
[38] = 168,
[39] = 174,
[40] = 180,
[41] = 187,
[42] = 194,
[43] = 201,
[44] = 208,
[45] = 215,
[46] = 222,
[47] = 229,
[48] = 236,
[49] = 243,
[50] = 250,
[51] = 258,
[52] = 266,
[53] = 274,
[54] = 282,
[55] = 290,
[56] = 298,
[57] = 306,
[58] = 314,
[59] = 322,
[60] = 330,
[61] = 338,
[62] = 346,
[63] = 354,
[64] = 362,
[65] = 370,
}


--上线判断
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'LC_OnLogoutJiangLi_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'LC_OnLogoutJiangLi_OnLogin') 
end

--下线判断
local OnLogoutLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLogoutFuncNameList) do 
	if GLOBAL_ActMain_OnLogoutFuncNameList[i] == 'LC_OnLogoutJiangLi_OnLogout' then
		OnLogoutLoadOK = 1
		break
	end 
end 
if OnLogoutLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLogoutFuncNameList,'LC_OnLogoutJiangLi_OnLogout') 
end

--上线回调
function LC_OnLogoutJiangLi_OnLogin() 
	local ActorID = API_RequestGetActorID()
	local Level = API_GetActorExpLevel(ActorID)
	local OnLoginType = API_VarDataGetNumber(ActorID,0,18368)
	local NowTime = os.time()
	local OnLogoutTime = API_VarDataGetNumber(ActorID,1,LC_OnLogoutTime)
	local Switch = API_VarDataGetNumber(ActorID,1,LC_GuaJiStart)
	local LastDate = os.date("*t", OnLogoutTime) 
	local Lastyear = LastDate.year
	local Lastmonth = LastDate.month
	local Lastday = LastDate.day
	local Lasthour = LastDate.hour
	local Lastmin = LastDate.min
	local NowDate = os.date("*t", NowTime) 
	local Nowyear = NowDate.year
	local Nowmonth = NowDate.month
	local Nowday = NowDate.day
	local Nowhour = NowDate.hour
	local Nowmin = NowDate.min
	local BeginTime = API_VarDataGetNumber(ActorID,1,LC_SetTimesave)
	if BeginTime < 1 then
		API_VarDataSetNumber(ActorID,1,LC_SetTimesave,1)
		API_VarDataSetNumber(ActorID,1,LC_ShenYuShiChang,360000)
	end
	if OnLoginType ~= 2 and Switch == 1 then
		local Time = NowTime - OnLogoutTime
		if Time > 360000 then
			Time = 360000
		end
		local Number = math.floor(Time/1800)
		local UseTime = Number*1800
		local ShenYuShiChang = API_VarDataGetNumber(ActorID,1,LC_ShenYuShiChang)
		if UseTime > ShenYuShiChang then
			Number = math.floor(ShenYuShiChang/1800)
			ShenYuShiChang = 0
		else
			ShenYuShiChang = ShenYuShiChang - UseTime
		end

		API_VarDataSetNumber(ActorID,1,LC_ShenYuShiChang,ShenYuShiChang)
		if Number >= 1 then
			local GoodNum = OnLogoutExpTable[Level]*Number
			local GoodsName = API_GetGoodsName(80498)
			local MailNum1 = math.floor(GoodNum/5000)
			local MailNum2 = math.mod(GoodNum,5000)
			local MailNum = 0
			if MailNum2 == 0 then
				MailNum = MailNum1
			else
				MailNum = MailNum1 + 1
			end
			for i=1,MailNum do
				if MailNum2 == 0 then
					API_SendActorMailByName(API_GetActorName(ActorID),80498,5000,0,'离线修炼','尊敬的玩家：您于'..Lastyear..'年'..Lastmonth..'月'..Lastday..'日'..Lasthour..'点'..Lastmin..'分--：'..Nowyear..'年'..Nowmonth..'月'..Nowday..'日'..Nowhour..'点'..Nowmin..'分离线修炼，总计获得'..GoodNum..'个经验兑换券（如经验兑换券较多将分多批邮件发送），请查收。祝您游戏愉快！')
				else
					if i ~= MailNum then
						API_SendActorMailByName(API_GetActorName(ActorID),80498,5000,0,'离线修炼','尊敬的玩家：您于'..Lastyear..'年'..Lastmonth..'月'..Lastday..'日'..Lasthour..'点'..Lastmin..'分--'..Nowyear..'年'..Nowmonth..'月'..Nowday..'日'..Nowhour..'点'..Nowmin..'分离线修炼，总计获得'..GoodNum..'个经验兑换券（如经验兑换券较多将分多批邮件发送），请查收。祝您游戏愉快！')
					else
						API_SendActorMailByName(API_GetActorName(ActorID),80498,MailNum2,0,'离线修炼','尊敬的玩家：您于'..Lastyear..'年'..Lastmonth..'月'..Lastday..'日'..Lasthour..'点'..Lastmin..'分--'..Nowyear..'年'..Nowmonth..'月'..Nowday..'日'..Nowhour..'点'..Nowmin..'分离线修炼，总计获得'..GoodNum..'个经验兑换券（如经验兑换券较多将分多批邮件发送），请查收。祝您游戏愉快！')
					end
				end
			end
		end
	end
end

--下线回调
function LC_OnLogoutJiangLi_OnLogout()
	local ActorID = API_RequestGetActorID()
	local Switch = API_VarDataGetNumber(ActorID,1,LC_GuaJiStart)
	if Switch == 1 then
		local NowTime = os.time()
		API_VarDataSetNumber(ActorID,1,LC_OnLogoutTime,NowTime)
	end
end

function LiXianXiuLianSheZhi(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	local Level = API_GetActorExpLevel(ActorID)
	local ShenYuShiChang = API_VarDataGetNumber(ActorID,1,LC_ShenYuShiChang)
	local Switch = API_VarDataGetNumber(ActorID,1,LC_GuaJiStart)
	local Hour = ShenYuShiChang/3600
	local Number = ShenYuShiChang/1800
	local Exp = OnLogoutExpTable[Level]*Number*100
	
	API_ResponseWrite('<win rect="340,220,280,350"></win>')
	API_ResponseWrite('<name>离线修炼</name>')
	API_ResponseWrite('<text>当前剩余离线修炼时长：</text><text color="255,0,255">'..Hour..'小时</text><br>')
	API_ResponseWrite('<text>最大可获得经验：</text><text color="255,0,255">'..Exp..'</text><br>')
	if Switch == 0 then
		API_ResponseWrite('<br><a href="XiuLianStart?1=100">开启离线挂机</a><br>')
	elseif Switch == 1 then  
		API_ResponseWrite('<br><a href="XiuLianStart?1=200">关闭离线挂机</a><br>')
	end
	API_ResponseWrite('<br><a>确定</a><br>')
	API_ResponseWrite('<br><text>温馨提示：</text><br>')
	API_ResponseWrite('<text>1、修炼时长可以通过离线修炼道具“修炼令牌”续时。该道具可以通过交易所和商城道具栏购买获得，直接右键点击道具使用。</text><br>')
	API_ResponseWrite('<text>2、离线修炼单次最多为100小时，超过100小时将自动停止，也不会扣除您的时间。</text><br>')
	API_ResponseWrite('<text>3、设置自动开启后系统将在您下线后自动扣除您的修炼时间。</text><br>')
	API_ResponseWrite('<text>4、离线修炼半小时以上才可以获得经验，不足半小时将不给经验，也不会扣除您的离线时长。等级越高相同离线时间可获得经验越多。</text><br>')
	API_ResponseFlush(ActorID)
end 

function XiuLianStart(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 100 then
		API_VarDataSetNumber(ActorID,1,LC_GuaJiStart,1)
		API_ActorSendMsg(ActorID,3,'离线修炼已开启')
		LiXianXiuLianSheZhi(ActorID)
	elseif SelectItem == 200 then
		API_VarDataSetNumber(ActorID,1,LC_GuaJiStart,0)
		API_ActorSendMsg(ActorID,3,'离线修炼已关闭')
		LiXianXiuLianSheZhi(ActorID)
	end
end

function XiuLianLingPaiUse(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = 89118
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local ShenYuShiChang = API_VarDataGetNumber(ActorID,1,LC_ShenYuShiChang)
	ShenYuShiChang = ShenYuShiChang + 36000
	if ShenYuShiChang > 3600000 then
		local ShenYuShiChang = API_VarDataGetNumber(ActorID,1,LC_ShenYuShiChang)
		local Hour = ShenYuShiChang/3600
		API_ResponseWrite('<name>修炼令牌</name>')
		API_ResponseWrite('<text>    修炼令牌剩余时间超出上限（上限1000小时），补充失败，当前剩余离线修炼时间为'..Hour..'小时。</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	
	if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用修炼令牌') then--销毁玩家身上的物品
		API_VarDataSetNumber(ActorID,1,LC_ShenYuShiChang,ShenYuShiChang)
		local Hour = ShenYuShiChang/3600
		API_ResponseWrite('<name>修炼令牌</name>')
		API_ResponseWrite('<text>    本次补充修炼令牌剩余时间10小时，当前剩余离线修炼时间为'..Hour..'小时。</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 1
	else
		return 0
	end
end