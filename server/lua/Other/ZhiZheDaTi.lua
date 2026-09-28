-------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\ZhiZheDaTi.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	吴圣奇
--日  期:	2010-12-13
--版  本:	1.0
--描  述:	智者答题活动
--应  用:  
-------------------------------------------------------------------------------------------------------------------


local baomingxuyaojinbi = {}
	baomingxuyaojinbi[1] = {42}
	baomingxuyaojinbi[2] = {85}
	baomingxuyaojinbi[3] = {127}
	baomingxuyaojinbi[4] = {170}
	baomingxuyaojinbi[5] = {212}
	baomingxuyaojinbi[6] = {254}
	baomingxuyaojinbi[7] = {297}
	baomingxuyaojinbi[8] = {339}
	baomingxuyaojinbi[9] = {382}
	baomingxuyaojinbi[10] = {424}
	baomingxuyaojinbi[11] = {528}
	baomingxuyaojinbi[12] = {576}
	baomingxuyaojinbi[13] = {624}
	baomingxuyaojinbi[14] = {672}
	baomingxuyaojinbi[15] = {720}
	baomingxuyaojinbi[16] = {768}
	baomingxuyaojinbi[17] = {816}
	baomingxuyaojinbi[18] = {864}
	baomingxuyaojinbi[19] = {912}
	baomingxuyaojinbi[20] = {960}
	baomingxuyaojinbi[21] = {1226}
	baomingxuyaojinbi[22] = {1285}
	baomingxuyaojinbi[23] = {1343}
	baomingxuyaojinbi[24] = {1402}
	baomingxuyaojinbi[25] = {1460}
	baomingxuyaojinbi[26] = {2226}
	baomingxuyaojinbi[27] = {2311}
	baomingxuyaojinbi[28] = {2397}
	baomingxuyaojinbi[29] = {2482}
	baomingxuyaojinbi[30] = {2568}
	baomingxuyaojinbi[31] = {2654}
	baomingxuyaojinbi[32] = {2739}
	baomingxuyaojinbi[33] = {2825}
	baomingxuyaojinbi[34] = {2910}
	baomingxuyaojinbi[35] = {2996}
	baomingxuyaojinbi[36] = {4752}
	baomingxuyaojinbi[37] = {4884}
	baomingxuyaojinbi[38] = {5016}
	baomingxuyaojinbi[39] = {5148}
	baomingxuyaojinbi[40] = {5280}
	baomingxuyaojinbi[41] = {7544}
	baomingxuyaojinbi[42] = {7728}
	baomingxuyaojinbi[43] = {7912}
	baomingxuyaojinbi[44] = {8096}
	baomingxuyaojinbi[45] = {8280}
	baomingxuyaojinbi[46] = {8464}
	baomingxuyaojinbi[47] = {8648}
	baomingxuyaojinbi[48] = {8832}
	baomingxuyaojinbi[49] = {9016}
	baomingxuyaojinbi[50] = {9200}
	baomingxuyaojinbi[51] = {12281}
	baomingxuyaojinbi[52] = {12522}
	baomingxuyaojinbi[53] = {12762}
	baomingxuyaojinbi[54] = {13003}
	baomingxuyaojinbi[55] = {13244}
	baomingxuyaojinbi[56] = {16979}
	baomingxuyaojinbi[57] = {17282}
	baomingxuyaojinbi[58] = {17586}
	baomingxuyaojinbi[59] = {17889}
	baomingxuyaojinbi[60] = {18192}
	baomingxuyaojinbi[61] = {18495}
	baomingxuyaojinbi[62] = {18798}
	baomingxuyaojinbi[63] = {19102}
	baomingxuyaojinbi[64] = {19405}
	baomingxuyaojinbi[65] = {19708}
	baomingxuyaojinbi[66] = {24552}
	baomingxuyaojinbi[67] = {24924}
	baomingxuyaojinbi[68] = {25296}
	baomingxuyaojinbi[69] = {25668}
	baomingxuyaojinbi[70] = {26040}
	baomingxuyaojinbi[71] = {31751}
	baomingxuyaojinbi[72] = {32198}
	baomingxuyaojinbi[73] = {32646}
	baomingxuyaojinbi[74] = {33093}
	baomingxuyaojinbi[75] = {33540}
	baomingxuyaojinbi[76] = {33987}
	baomingxuyaojinbi[77] = {34434}
	baomingxuyaojinbi[78] = {34882}
	baomingxuyaojinbi[79] = {35329}
	baomingxuyaojinbi[80] = {35776}
	baomingxuyaojinbi[81] = {43222}
	baomingxuyaojinbi[82] = {43755}
	baomingxuyaojinbi[83] = {44289}
	baomingxuyaojinbi[84] = {44822}
	baomingxuyaojinbi[85] = {45356}

ZhiZheID = API_CreateTimerTriggerG(0,0,1,0,'ZhiZheFunc')

----------加载触发器-------------------
function ZhiZheFunc(a,b) 
		API_CreateTimerTriggerG(0 ,  0,  1,  0, 'ZhiZheNpcFunc')
end



----------在帝国和联邦的三个地图分别创建答题的NPC------------
function ZhiZheNpcFunc()
if WSQ_ZhiZheDaTiBiao == nil then
WSQ_ZhiZheDaTiBiao = {}
WSQ_ZhiZheDaTiBiao[1] = 0
WSQ_ZhiZheDaTiBiao[2] = 0
WSQ_ZhiZheDaTiBiao[3] = 0
WSQ_ZhiZheDaTiBiao[4] = 0
WSQ_ZhiZheDaTiBiao[5] = 0
WSQ_ZhiZheDaTiBiao[6] = 0
end
	if API_GetServerID() == 1 then
	local XunBaoNpcID = WSQ_ZhiZheDaTiBiao[1]
		if XunBaoNpcID == nil or XunBaoNpcID ~= nil and API_GetMonsterID(XunBaoNpcID) ~= 12342 then
		local fastid = API_CreateMonster(2,12342,240,160,5,0,-1)--创建答题的NPC-天空城
			API_SetMonsterName(fastid, '答题活动使者', 1)
			WSQ_ZhiZheDaTiBiao[1] = fastid
		end
	end
	if API_GetServerID() == 1 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
	local XunBaoNpcID = WSQ_ZhiZheDaTiBiao[2]
		if XunBaoNpcID == nil or XunBaoNpcID ~= nil and API_GetMonsterID(XunBaoNpcID) ~= 12342 then
		local fastid = API_CreateMonster(25,12342,151,324,5,0,-1)--创建答题的NPC-麦穗平原
			API_SetMonsterName(fastid, '答题活动使者', 1)
			WSQ_ZhiZheDaTiBiao[2] = fastid
		end
	end
	if API_GetServerID() == 1 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
	local XunBaoNpcID = WSQ_ZhiZheDaTiBiao[3]
		if XunBaoNpcID == nil or XunBaoNpcID ~= nil and API_GetMonsterID(XunBaoNpcID) ~= 12342 then
		local fastid = API_CreateMonster(10,12342,136,332,5,0,-1)--创建答题的NPC-珊瑚群岛
			API_SetMonsterName(fastid, '答题活动使者', 1)
			WSQ_ZhiZheDaTiBiao[3] = fastid
		end
	end
	if API_GetServerID() == 1 then
	local XunBaoNpcID = WSQ_ZhiZheDaTiBiao[4]
		if XunBaoNpcID == nil or XunBaoNpcID ~= nil and API_GetMonsterID(XunBaoNpcID) ~= 12342 then
		local fastid = API_CreateMonster(1,12342,242,173,3,0,-1)--创建答题的NPC-钢铁城
			API_SetMonsterName(fastid, '答题活动使者', 1)
			WSQ_ZhiZheDaTiBiao[4] = fastid
		end
	end
	if API_GetServerID() == 1 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
	local XunBaoNpcID = WSQ_ZhiZheDaTiBiao[5]
		if XunBaoNpcID == nil or XunBaoNpcID ~= nil and API_GetMonsterID(XunBaoNpcID) ~= 12342 then
		local fastid = API_CreateMonster(9,12342,165,388,5,0,-1)--创建答题的NPC-暗礁海
			API_SetMonsterName(fastid, '答题活动使者', 1)
			WSQ_ZhiZheDaTiBiao[5] = fastid
		end
	end
	if API_GetServerID() == 1 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
	local XunBaoNpcID = WSQ_ZhiZheDaTiBiao[6]
		if XunBaoNpcID == nil or XunBaoNpcID ~= nil and API_GetMonsterID(XunBaoNpcID) ~= 12342 then
		local fastid = API_CreateMonster(23,12342,139,341,5,0,-1)--创建答题的NPC-阳光雨林
			API_SetMonsterName(fastid, '答题活动使者', 1)
			WSQ_ZhiZheDaTiBiao[6] = fastid
		end
	end
end

function ZhiZheDuiHua(ActorID,NpcID)--答题活动使者的相关对话
	local ActorID = ActorID or API_RequestGetActorID() 
	local xuanze = API_RequestGetNumber(1)--取玩家的选择
	local WanJiaLevel = API_GetActorExpLevel(ActorID)--获取玩家等级
	local WanJiaName = API_GetActorName(ActorID) --获取玩家姓名
	local Money = API_ActorGetPropNum(ActorID, PD_PROP_MONEY_HOLD)
	local needmoney = baomingxuyaojinbi[WanJiaLevel][1]
	API_ResponseWrite('<name>答题活动使者</name>') 
	API_ResponseWrite('<br><text>亲爱的'..WanJiaName..'，你可以在我这里开启个人答题。</text><text color="255,0,255">每人每天只能参加两次个人答题，</text><text>如果你答对了，就可以获得经验奖励，答对的题目越多，经验奖励便越多。你需要准备一些金币，当做我作为出题人的辛苦费。</text><br>') 
	API_ResponseWrite('<br><text>'..WanJiaName..'，如果你舍不得金币，我劝你要好好考虑一下。参加个人答题可以得到经验，经验可以用来提升等级，而等级高了，还怕赚不到金币吗？</text><br>') 
	API_ResponseWrite('<br><a href="ZhiZheDuiHua?1=1">有道理，我想开始答题。</a><br>') 
	API_ResponseWrite('<br><a>我没钱。</a><br>') 
	API_ResponseFlush(ActorID)

	if xuanze == 1 then
	local XiTongDaTi = APT_IsActiveQuestion(ActorID)--判断玩家当前是不是处于答题状态
			if XiTongDaTi == 1 then
			API_ResponseWrite('<br><text>很抱歉，'..WanJiaName..'，当前你已经处于答题状态，无法参加个人答题。请认真完成答题，不要捣乱。否则后果自负。</text><br>') 
			API_ResponseWrite('<br><a>明白了！</a><br>')
			else
	API_ResponseWrite('<name>答题活动使者</name>') 
	API_ResponseWrite('<br><text color="255,0,255">每天的12：30和19：30会有两次系统统一答题。</text"><text>若在此期间参与个人答题，就不能参加系统答题，你确定要参加个人答题吗？</text><br>') 
	API_ResponseWrite('<br><text>'..WanJiaName..'，如果你确定要参加，请先为我准备好一些辛苦费。你当前的等级是</text><text color="255,0,255">'..WanJiaLevel..'级。</text><text>按照市场价再减三成，我收你</text><text color="255,0,255">'..needmoney..'个金币</text><text>好了。如果你同意的话，点开始答题后我就会拿走你的金币，而你则开始答题。</text><br>') 
	API_ResponseWrite('<br><text color="255,0,0">小提示：个人答题期间请勿关闭答题窗口，否则无法继续答题并视为已完成一次答题。每人每天只能完成两次答题，请你做好准备，不要浪费机会。</text><br>') 
	API_ResponseWrite('<br><a href="ZhiZheJinBi">开始答题。</a><br>') 
	API_ResponseWrite('<br><a>还是算了。</a><br>') 
		end
	end
end

----每天固定的时间清除使用的次数
function ZhiZheDaTi_QingChuShuJu(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local NowTime = os.time()
	--每日清除
	if NowTime > API_VarDataGetNumber(ActorID,1,19512) then
		local NowTime = os.date("*t", os.time())
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 23
		NowTime.min = 59
		NowTime.sec = 59
		local NightTime = os.time(NowTime)
		local NextTime = NightTime + 1
		API_VarDataSetNumber(ActorID,1,19511,0)--每天领取数量
		API_VarDataSetNumber(ActorID,1,19512,NextTime)--下次每日清除时间
	end
end

function ZhiZheJinBi(ActorID,NpcID)--检测金币与活动开始
	local ActorID = ActorID or API_RequestGetActorID() 
	local WanJiaLevel = API_GetActorExpLevel(ActorID)--获取玩家等级
	local Money = API_ActorGetPropNum(ActorID, PD_PROP_MONEY_HOLD)--获取玩家金币
	local WanJiaName = API_GetActorName(ActorID) --获取玩家姓名
	local needmoney = baomingxuyaojinbi[WanJiaLevel][1]--判断玩家身上的钱是否小于可以报名的钱
	local DaTiZhong = APT_IsActiveQuestion(ActorID)--判断玩家当前是不是处于答题状态

	if DaTiZhong == 1 then
		API_ResponseWrite('<br><text>很抱歉，'..WanJiaName..'，你目前正在答题中，请认真完成答题，不要捣乱。否则后果自负。</text><br>') 
		API_ResponseWrite('<br><a>好吧我错了！</a><br>')
	else

		ZhiZheDaTi_QingChuShuJu(ActorID)--取玩家的ID
		local a = API_VarDataGetNumber(ActorID,1,19511) --定义交互数据
		if a >= 2 then --判断交互数据
			API_ResponseWrite('<br><text>很抱歉，'..WanJiaName..'，</text><text color="255,0,255">每人每天只能完成两次答题。</text><text>你今日已经完成了两次答题，明日再来找我吧。</text><br>') 
			API_ResponseWrite('<br><a>好的。</a><br>') 
		else
			if Money < needmoney then--判断身上的钱够不够答题的钱
				API_ResponseWrite('<br><text>哦不不不，亲爱的'..WanJiaName..'，你身上的这点钱实在是太少了。想让我为你出题，你至少要准备</text><text color="255,0,255">'..needmoney..'个金币。</text><text>什么？打折？你太爱开玩笑了。我上次去买墓地，他们都没给我打折。</text><br>') 
				API_ResponseWrite('<br><a>好吧，我再去想想办法。</a><br>') 	
			else
				API_ActorAddMoney(ActorID,-needmoney,0,'参加答题活动扣除金币')
				API_RequestStartPersonalQuestion(ActorID)--开始答题
				local cishu = API_VarDataGetNumber(ActorID,1,19511)
				cishu = cishu + 1
				API_VarDataSetNumber(ActorID,1,19511,cishu)
			end
		end
	end
end