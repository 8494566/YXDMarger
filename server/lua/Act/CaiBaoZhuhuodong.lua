-------------------------猜宝珠活动
-------------------------活动简要说明
--活动开始 玩家通过邮件获得5个原始宝珠 使用后注入星数 变成X星宝珠 第二天开奖 获取奖励 通过卷轴查阅中奖号码开始循环 VIP钥匙半价
--程序部分划分
--1.login 添加卷轴 活动期判断交互数据 送5个宝珠
--2.卷轴函数 规则介绍 上次宝珠奖号
--3.原始宝珠使用函数 CaiBaoZhuhuodong_baozhu
--4.星宝珠使用函数 CaiBaoZhuhuodong_xingbaozhu
--5.TIPS显示开奖的日子
--6.需要1个公用算日期函数 可以算到下1天的日子
--7.星宝珠的存储 1.开奖日期
--8..12点处理  

local yuanshibaozhu = 88138 --原始宝珠 叠加 非记忆道具

local xingbaozhu1 = 88139 --1星宝珠 不叠加 记忆道具 可仓库 不可邮寄
local xingbaozhu2 = 88140 --2星宝珠 不叠加 记忆道具 可仓库 不可邮寄
local xingbaozhu3 = 88141 --3星宝珠 不叠加 记忆道具 可仓库 不可邮寄
local xingbaozhu4 = 88142 --4星宝珠 不叠加 记忆道具 可仓库 不可邮寄
local xingbaozhu5 = 88143 --5星宝珠 不叠加 记忆道具 可仓库 不可邮寄
local xingbaozhu6 = 88144 --6星宝珠 不叠加 记忆道具 可仓库 不可邮寄
local xingbaozhu7 = 88145 --7星宝珠 不叠加 记忆道具 可仓库 不可邮寄

CaiBaoZhuhuodong_juanzhouid = 40002 --卷轴ID
CaiBaoZhuhuodong_juanzhoutubiaoid = 104112 --卷轴图标ID

CaiBaoZhuhuodong_StartTime = {Year = 2010,Month = 4,Day = 7,Hour = 0,Minute = 0,Second = 0}  
CaiBaoZhuhuodong_EndTime = {Year = 2020,Month = 12,Day = 30,Hour = 0,Minute = 0,Second = 0}   
CaiBaoZhuhuodong_EndTime2 = {Year = 2020,Month = 12,Day = 31,Hour = 0,Minute = 0,Second = 0} 

CaiBaoZhuhuodong_shifouzengyusave = 12119 --是否获得

CaiBaoZhuhuodong_dianquanxiaohao = 10 --点券

CaiBaoZhuhuodong_chongzhiriqi = 12120

CaiBaoZhuhuodong_shiyongcishu = 12121

local OwnerID = -2001 --全局交互数据
if API_VarDataGetNumber_Ex(1,0,OwnerID,1,170) == 0 then
	API_VarDataLoad_Ex(1,0,OwnerID)
end


--进入游戏 添加卷轴
function CaiBaoZhuhuodong_OnLogin(ActorID)
 	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(CaiBaoZhuhuodong_StartTime.Year,CaiBaoZhuhuodong_StartTime.Month,CaiBaoZhuhuodong_StartTime.Day,CaiBaoZhuhuodong_StartTime.Hour,CaiBaoZhuhuodong_StartTime.Minute,CaiBaoZhuhuodong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(CaiBaoZhuhuodong_EndTime2.Year,CaiBaoZhuhuodong_EndTime2.Month,CaiBaoZhuhuodong_EndTime2.Day,CaiBaoZhuhuodong_EndTime2.Hour,CaiBaoZhuhuodong_EndTime2.Minute,CaiBaoZhuhuodong_EndTime2.Second)
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel < 15 then
		return
	end
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		local MapID = API_GetActorMapID(ActorID)
		local StaticMapID = API_GetStaticMapID(MapID)
		if MapID == StaticMapID then
			API_RemoveTaskScroll(ActorID,CaiBaoZhuhuodong_juanzhouid)
			local nType = API_VarDataGetNumber(ActorID,0, 18368)
			if nType == 1 then
				--if API_VarDataGetNumber(ActorID,1,XingYunxing_shiyongxingyunxingsave) < 1 then
					--API_AddTaskScrollEx(ActorID,CaiBaoZhuhuodong_juanzhouid,CaiBaoZhuhuodong_juanzhoutubiaoid,'CaiBaoZhuhuodong_juanzhoudianji',0)
--					LRY_UItwinkemanage(ActorID,15,85,CaiBaoZhuhuodong_juanzhoutubiaoid,CaiBaoZhuhuodong_juanzhouid,44,'CaiBaoZhuhuodong_juanzhoudianji')
				--end
			end
		end
		local begintime = CaiBaoZhuhuodong_StartTime.Year * 10000 + CaiBaoZhuhuodong_StartTime.Month * 100 + CaiBaoZhuhuodong_StartTime.Day
		local usetime = API_VarDataGetNumber(ActorID,1,CaiBaoZhuhuodong_shifouzengyusave)
--		if usetime < begintime then
--			API_ResponseWrite('<name>猜宝珠</name>')
--			API_ResponseWrite('<win rect="300,250,350,150"></win>')
--			local PackageSize = API_ActorGetPackageSize(ActorID)
--			if PackageSize > 1 then
--				API_AddActorGoods(ActorID,yuanshibaozhu,5,'猜宝珠活动')
--				API_ResponseWrite('<text>猜宝珠活动开始，获得5颗</text><img srcgd="'..yuanshibaozhu..'" tipgd="'..yuanshibaozhu..'">。')
--			else
--				API_SendActorMailByName(API_GetActorName(ActorID),yuanshibaozhu,5,3,''..API_GetGoodsName(yuanshibaozhu)..'活动赠送','为'..API_GetGoodsName(yuanshibaozhu)..'注入星数，第二日开奖的星数如果和你注入的星数一样，那么使用宝珠可以获得神秘奖励，如果和注入的星数不一样，也可以获得不错的普通奖励。所有奖励都和星数挂钩，星数越高，奖励越好。')
--				API_ResponseWrite('<text>猜宝珠活动开始，获得5颗</text><img srcgd="'..yuanshibaozhu..'" tipgd="'..yuanshibaozhu..'"><text>请到邮箱中查收。</text>')	
--			end	
--			API_VarDataSetNumber(ActorID,1,CaiBaoZhuhuodong_shifouzengyusave,begintime)
--			API_ResponseWrite('<br><br><a>                                             关闭</a><br>')
--		end
	end
end
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'CaiBaoZhuhuodong_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'CaiBaoZhuhuodong_OnLogin') 
end
local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'CaiBaoZhuhuodong_OnLogin' then
		OnLoginMapLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'CaiBaoZhuhuodong_OnLogin') 
end
-------------------LOGIN部分OK
--点击卷轴部分 文字介绍  发现没有参与过活动 那么赠送或邮寄5原始宝珠  上次中奖介绍
function CaiBaoZhuhuodong_juanzhoudianji()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()	
	local begintime = CaiBaoZhuhuodong_StartTime.Year * 10000 + CaiBaoZhuhuodong_StartTime.Month * 100 + CaiBaoZhuhuodong_StartTime.Day
	local usetime = API_VarDataGetNumber(ActorID,1,CaiBaoZhuhuodong_shifouzengyusave)
	API_ResponseWrite('<name>猜宝珠</name>')
	API_ResponseWrite('<win rect="300,100,400,300"></win>')
	local CaiBaoZhuhuodong_quanju_zhongjiangxingshu = API_VarDataGetNumber_Ex(1,0,OwnerID,1,1)
	local CaiBaoZhuhuodong_quanju_zhongjiangshijian = API_VarDataGetNumber_Ex(1,0,OwnerID,1,10)
--API_Trace('CaiBaoZhuhuodong_quanju_zhongjiangxingshu='..CaiBaoZhuhuodong_quanju_zhongjiangxingshu)	
	if CaiBaoZhuhuodong_quanju_zhongjiangxingshu > 0 and CaiBaoZhuhuodong_quanju_zhongjiangshijian > 0 then
		if CaiBaoZhuhuodong_quanju_zhongjiangshijian == 22 then
			if Hour < 22 then
				API_ResponseWrite('<text>昨日'..CaiBaoZhuhuodong_quanju_zhongjiangshijian..'时中奖的宝珠是</text><img srcgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'" tipgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'"><br><br>')
			else
				API_ResponseWrite('<text>'..Month..'月'..Day..'日'..CaiBaoZhuhuodong_quanju_zhongjiangshijian..'时中奖的宝珠是</text><img srcgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'" tipgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'"><br><br>')
			end
		else
			API_ResponseWrite('<text>'..Month..'月'..Day..'日'..CaiBaoZhuhuodong_quanju_zhongjiangshijian..'时中奖的宝珠是</text><img srcgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'" tipgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'"><br><br>')
		end
	end
	if SelectItem == 1 then
		API_RemoveTaskScroll(ActorID,CaiBaoZhuhuodong_juanzhouid)
		API_ResponseEnd()
		API_ResponseClear()
	elseif SelectItem == 2 then
		local PackageSize = API_ActorGetPackageSize(ActorID)
		if PackageSize > 1 then
			API_AddActorGoods(ActorID,yuanshibaozhu,5,'猜宝珠活动')
			API_ResponseWrite('<text>	 获得5颗</text><img srcgd="'..yuanshibaozhu..'" tipgd="'..yuanshibaozhu..'">')
		else
			API_SendActorMailByName(API_GetActorName(ActorID),yuanshibaozhu,5,3,''..API_GetGoodsName(yuanshibaozhu)..'活动赠送','为'..API_GetGoodsName(yuanshibaozhu)..'注入星数，第二日开奖的星数如果和你注入的星数一样，那么使用宝珠可以获得神秘奖励，如果和注入的星数不一样，也可以获得不错的普通奖励。所有奖励都和星数挂钩，星数越高，奖励越好。')
			API_ResponseWrite('<text>	 获得5颗</text><img srcgd="'..yuanshibaozhu..'" tipgd="'..yuanshibaozhu..'"><text>请到邮箱中查收</text>')	
		end	
		API_VarDataSetNumber(ActorID,1,CaiBaoZhuhuodong_shifouzengyusave,begintime)
	else
		--API_ResponseWrite('<win rect="300,100,400,400" move="1"></win>')	
		API_ResponseWrite('<text>猜宝珠，幸运大奖轻松拿！激活并猜出宝珠幸运星数，就能转动命运之轮，有机会收获</text><img srcgd="11045" tipgd="11045"><img srcgd="11043" tipgd="11043"><img srcgd="11035" tipgd="11035"><text>等大礼，绝对超值。</text><br><br>')
		API_ResponseWrite('<text>活动期间，拥有并使用</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,255">消耗减半</text><text>！</text><br>')
		--API_ResponseWrite('<text color="255,0,0">每'..XingYunxing_dianquan..'点券可以打开1颗</text><img srcgd="'..XingYunxing_goodsid..'" tipgd="'..XingYunxing_goodsid..'"><text color="255,0,0">获得神秘礼物，如果背包中拥有已开始计时的</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,0">，将仅需'..XingYunxing_dianquan2..'点券。</text><br><br>')
		--API_ResponseWrite('<a underline="1" tip="点击此处进行点券充值" closewindow="0" http="http://yxd.21mmo.com/pay/pay.html">点此领取</a><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><br><br>')
		
		--if usetime < begintime then --如果交互数据中存储的日期 小于活动开始日期 那么给予原始宝珠
			--API_ResponseWrite('<br><br><a href="CaiBaoZhuhuodong_juanzhoudianji?1=2">领取“'..API_GetGoodsName(yuanshibaozhu)..'”</a><br>')		
		--end 
		
		API_ResponseWrite('<br><a underline="1" tip="点击此处查询活动详情" closewindow="0" http="http://yxd.21mmo.com/eventpark/20090825box/">了解活动详情</a><br>')
		API_ResponseWrite('<br><br><a href="CaiBaoZhuhuodong_juanzhoudianji?1=1">关闭</a><br>')
		API_ResponseFlush(ActorID)
	end		
end
-------------------1.介绍  差文字部分
-------------------2.点击给宝珠 OK
-------------------3.查询昨日奖励 OK

------------------原始宝珠使用函数
function CaiBaoZhuhuodong_baozhu(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if GoodsID == nil then
		GoodsID = API_RequestGetNumber(3)
	end
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	if GoodsID ~= yuanshibaozhu then
--API_Trace('123=')		
		return
	end
	local ExpLevel = API_GetActorExpLevel(ActorID)
	API_ResponseWrite('<name>猜宝珠</name>')
	API_ResponseWrite('<win rect="300,100,450,400"></win>')
	if ExpLevel < 15 then
		API_ResponseWrite('<img srcgd="'..yuanshibaozhu..'" tipgd="'..yuanshibaozhu..'"><text>只有大于14级的玩家才能使用。</text>')
		API_ResponseFlush(ActorID)
		return 0
	end	
	local SelectItem = API_RequestGetNumber(1)
	local CaiBaoZhuhuodong_quanju_zhongjiangxingshu = API_VarDataGetNumber_Ex(1,0,OwnerID,1,1)
	local CaiBaoZhuhuodong_quanju_zhongjiangshijian = API_VarDataGetNumber_Ex(1,0,OwnerID,1,10)
	if SelectItem == 1 then --注魂
		local PackageSize = API_ActorGetPackageSize(ActorID)
		if PackageSize > 0 then
		else
			API_ResponseWrite('<text>您的背包已满，不能进行宝珠激活，请清理背包后再试</text><br>')
			return 0
		end
		API_ResponseWrite('<text>请选择要激活的星数：（一旦激活完成就不能再次更改，在系统公布幸运宝珠后可进行兑奖。）</text><br><br>')
		API_ResponseWrite('<text>8时、10时、12时、14时、16时、18时、20时、22时系统会选择本时段被激活最少的宝珠作为幸运宝珠并公布。已激活的宝珠可以进行兑奖。未中奖或过去的宝珠只能获得普通奖励。</text><br><br>')
		API_ResponseWrite('<text>激活的宝珠星数越大，普通奖励或特殊奖励的价值越好。</text><br><br>')
		for i=1,7 do
			local jixing = ''
			local dianquan = 0
			local dianquan2 = 0
			if i == 1 then
				jixing = '一颗星'
			elseif i == 2 then
				jixing = '二颗星'
			elseif i == 3 then
				jixing = '三颗星'
			elseif i == 4 then
				jixing = '四颗星'
			elseif i == 5 then
				jixing = '五颗星'
			elseif i == 6 then
				jixing = '六颗星'
			elseif i == 7 then
				jixing = '七颗星'		
			end
			dianquan = CaiBaoZhuhuodong_dianquanxiaohao * i
			dianquan2 = CaiBaoZhuhuodong_dianquanxiaohao/2 * i
			local usetime = API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave)			
			if usetime > 0 then
				API_ResponseWrite('<a underline="1" href="CaiBaoZhuhuodong_baozhu2?1='..i..'&2='..ActorID..'&3='..GoodsID..'">激活'..jixing..'</a><text>（需消耗'..dianquan2..'点券）</text><br><br>')
			else
				API_ResponseWrite('<a underline="1" href="CaiBaoZhuhuodong_baozhu2?1='..i..'&2='..ActorID..'&3='..GoodsID..'">激活'..jixing..'</a><text>（需消耗'..dianquan..'点券，</text><text color="255,0,255">vip钥匙持有并使用者仅需消耗'..dianquan2..'点券）</text><br><br>')
			end		
		end
	elseif SelectItem == 2 then --丢弃	
			API_ResponseWrite('<text>您确定要丢弃'..API_ActorGetGoodsNum(ActorID,yuanshibaozhu)..'个'..API_GetGoodsName(yuanshibaozhu)..'吗？</text>')
			API_ResponseWrite('<br><br><a href="CaiBaoZhuhuodong_baozhu?1=3&2='..ActorID..'&3='..GoodsID..'">丢弃宝珠</a><br>')	
			API_ResponseFlush(ActorID)
			return 0
	elseif SelectItem == 3 then --丢弃
		local num = API_ActorGetGoodsNum(ActorID,yuanshibaozhu)
		if num > 0 then
			API_ActorRemoveGoods(ActorID,yuanshibaozhu,num,'宝珠丢弃')
			local shiyongcishu = API_VarDataGetNumber(ActorID,1,CaiBaoZhuhuodong_shiyongcishu)
			shiyongcishu = shiyongcishu + num
			API_VarDataSetNumber(ActorID,1,CaiBaoZhuhuodong_shiyongcishu,shiyongcishu)
			API_ResponseEnd()
			API_ResponseClear()
			return 1
		end			
	else--描述
		local nShiFouStart = API_DiffDatatime(CaiBaoZhuhuodong_StartTime.Year,CaiBaoZhuhuodong_StartTime.Month,CaiBaoZhuhuodong_StartTime.Day,CaiBaoZhuhuodong_StartTime.Hour,CaiBaoZhuhuodong_StartTime.Minute,CaiBaoZhuhuodong_StartTime.Second)
		local nShiFouEnd = API_DiffDatatime(CaiBaoZhuhuodong_EndTime.Year,CaiBaoZhuhuodong_EndTime.Month,CaiBaoZhuhuodong_EndTime.Day,CaiBaoZhuhuodong_EndTime.Hour,CaiBaoZhuhuodong_EndTime.Minute,CaiBaoZhuhuodong_EndTime.Second)
		if nShiFouStart < 0 and nShiFouEnd > 0 then
			local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()	
			if CaiBaoZhuhuodong_quanju_zhongjiangxingshu > 0 and CaiBaoZhuhuodong_quanju_zhongjiangshijian > 0 then
				if CaiBaoZhuhuodong_quanju_zhongjiangshijian == 22 then
					if Hour < 22 then
						API_ResponseWrite('<text>昨日'..CaiBaoZhuhuodong_quanju_zhongjiangshijian..'时中奖的宝珠是</text><img srcgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'" tipgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'"><br><br>')
					else
						API_ResponseWrite('<text>'..Month..'月'..Day..'日'..CaiBaoZhuhuodong_quanju_zhongjiangshijian..'时中奖的宝珠是</text><img srcgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'" tipgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'"><br><br>')
					end
				else
					API_ResponseWrite('<text>'..Month..'月'..Day..'日'..CaiBaoZhuhuodong_quanju_zhongjiangshijian..'时中奖的宝珠是</text><img srcgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'" tipgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'"><br><br>')
				end
			end	
			--API_ResponseWrite('<text>猜宝珠活动进行中</text><br>')--<img srcgd="39507" tipgd="39507">
			API_ResponseWrite('<text>猜宝珠，幸运大奖轻松拿！激活并猜出宝珠幸运星数，就能转动命运之轮，有机会收获</text><img srcgd="11045" tipgd="11045"><img srcgd="11043" tipgd="11043"><img srcgd="11035" tipgd="11035"><text>等大礼，绝对超值。</text><br>')
			API_ResponseWrite('<text>活动期间，拥有并使用</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,255">消耗减半</text><text>！</text><br>')			
			API_ResponseWrite('<br><br><a href="CaiBaoZhuhuodong_baozhu?1=1&2='..ActorID..'&3='..GoodsID..'">激活宝珠</a><br>')
			API_ResponseWrite('<a underline="1" tip="点击此处进行点券充值" closewindow="0" http="http://yxd.21mmo.com/pay/pay.html">                                小贴士：点此领取</a><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><br><br>')
			API_ResponseWrite('<br><br><a href="CaiBaoZhuhuodong_baozhu?1=2&2='..ActorID..'&3='..GoodsID..'">丢弃宝珠</a><br>')			
			API_ResponseFlush(ActorID)
			return 1
		else
			API_ResponseWrite('<text>'..API_GetGoodsName(yuanshibaozhu)..'活动已结束，请等到下次活动开始再使用。</text><br>')
			API_ResponseFlush(ActorID)
			return 0
		end	
	end
end
function CaiBaoZhuhuodong_baozhu2()
	local SelectItem = API_RequestGetNumber(1)
	local ActorID = API_RequestGetNumber(2)
	local GoodsID = API_RequestGetNumber(3)
	if GoodsID ~= yuanshibaozhu then
		return
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 then
	else
		return
	end
	if SelectItem > 0 and SelectItem < 8 then
	else
		return
	end
	local PackageSize = API_ActorGetPackageSize(ActorID)
	if PackageSize > 0 then
	else
		API_ResponseWrite('<text>您的背包已满，不能进行激活，请清理背包后再试</text><br>')
		return 0
	end
	local dianquan = CaiBaoZhuhuodong_dianquanxiaohao * SelectItem
	local usetime = API_VarDataGetNumber(ActorID,1,VIPkey_usetimesave)			
	if usetime > 0 then		
		dianquan = CaiBaoZhuhuodong_dianquanxiaohao/2 * SelectItem
	end
	local xingshuid = 88138 + SelectItem
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()	
	if API_UsePoint(ActorID,3,xingshuid,1,dianquan) == 0 then 
		API_ActorRemoveGoods(ActorID,GoodsID,1,'猜宝珠活动')
		local xingbaozhuID = yuanshibaozhu + SelectItem
		local year1,month1,day1 = PublicFun_AfterTime(1)
--API_Trace('year1='..year1)		
--API_Trace('month1='..month1)
--API_Trace('day1='..day1)
		local shiyongriqi = year1 * 10000 + month1 * 100 + day1
--API_Trace('shiyongriqi='..shiyongriqi)		
		local UIDchongwu = API_AddActorGoodsPropRetUID(ActorID,xingbaozhuID,1,0,'获得星宝珠',-1,-1)
		local chongwubagID,chongwuLoc = API_GetUIDGoodsInActor(UIDchongwu,ActorID)--背包ID 和 位置
--API_Trace('chongwubagID='..chongwubagID)	
--API_Trace('chongwuLoc='..chongwuLoc)
		--API_ActorMeMScrollSetString(ActorID,chongwubagID,chongwuLoc+1,2,''..year1..''..month1..''..day1..'')
		--local b = API_ActorMeMScrollGetString(ActorID,chongwubagID,chongwuLoc+1,2)	
--API_Trace('b='..b)			
		API_ActorMeMScrollSetNumber(ActorID,chongwubagID,chongwuLoc+1,1,shiyongriqi)--后1天的年月日
		local timesave = Hour * 100 + Minute
		API_ActorMeMScrollSetNumber(ActorID,chongwubagID,chongwuLoc+1,2,timesave)--激活时的时和分
		
		local kaijiangshijian = API_VarDataGetNumber_Ex(1,0,OwnerID,1,10)
		local kaijiangshijian2 = 0
		local kaijiangshijian3 = 0
		if kaijiangshijian == 0 then
			if Hour < 8 then
				kaijiangshijian2 = 8
				kaijiangshijian3 = Month * 10000 + Day * 100 + kaijiangshijian2
			elseif Hour >= 8 and Hour < 10 then
				kaijiangshijian2 = 10
				kaijiangshijian3 = Month * 10000 + Day * 100 + kaijiangshijian2
			elseif Hour >= 10 and Hour < 12 then
				kaijiangshijian2 = 12
				kaijiangshijian3 = Month * 10000 + Day * 100 + kaijiangshijian2
			elseif Hour >= 12 and Hour < 14 then
				kaijiangshijian2 = 14
				kaijiangshijian3 = Month * 10000 + Day * 100 + kaijiangshijian2
			elseif Hour >= 14 and Hour < 16 then
				kaijiangshijian2 = 16
				kaijiangshijian3 = Month * 10000 + Day * 100 + kaijiangshijian2
			elseif Hour >= 16 and Hour < 18 then
				kaijiangshijian2 = 18
				kaijiangshijian3 = Month * 10000 + Day * 100 + kaijiangshijian2
			elseif Hour >= 18 and Hour < 20 then
				kaijiangshijian2 = 20
				kaijiangshijian3 = Month * 10000 + Day * 100 + kaijiangshijian2
			elseif Hour >= 20 and Hour < 22 then
				kaijiangshijian2 = 22
				kaijiangshijian3 = Month * 10000 + Day * 100 + kaijiangshijian2
			elseif Hour >= 22 then
				kaijiangshijian2 = 8
				kaijiangshijian3 = month1 * 10000 + day1 * 100 + kaijiangshijian2
			end			
		elseif kaijiangshijian == 22 then --如果开奖时间是22点
			kaijiangshijian2 = 8 
			if Hour >= 22 then  --如果当前小时大于等于22  那么就第二天 8点
				kaijiangshijian3 = month1 * 10000 + day1 * 100 + kaijiangshijian2
			else --如果已经小于22了 那么 就当天的 8点
				kaijiangshijian3 = Month * 10000 + Day * 100 + kaijiangshijian2
			end
		else
			kaijiangshijian2 = kaijiangshijian + 2
			kaijiangshijian3 = Month * 10000 + Day * 100 + kaijiangshijian2
		end
		API_ActorMeMScrollSetNumber(ActorID,chongwubagID,chongwuLoc+1,3,kaijiangshijian3) --开奖时
		local a = API_ActorMeMScrollGetNumber(ActorID,chongwubagID,chongwuLoc+1,1)
--API_Trace('a='..a)		
		local jiaohushujukey = SelectItem + 2
		local dangqianshuliang = API_VarDataGetNumber_Ex(1,0,OwnerID,1,jiaohushujukey)
		dangqianshuliang = dangqianshuliang + 1
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,jiaohushujukey,dangqianshuliang)
--API_Trace('dangqianshuliang='..dangqianshuliang)		
		local shiyongcishu = API_VarDataGetNumber(ActorID,1,CaiBaoZhuhuodong_shiyongcishu)
		shiyongcishu = shiyongcishu + 1
		API_VarDataSetNumber(ActorID,1,CaiBaoZhuhuodong_shiyongcishu,shiyongcishu)
		
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 0
		if SelectItem == 1 then
			Type = 8
		elseif SelectItem == 2 then
			Type = 9
		elseif SelectItem == 3 then
			Type = 10
		elseif SelectItem == 4 then
			Type = 11
		elseif SelectItem == 5 then
			Type = 12
		elseif SelectItem == 6 then
			Type = 13
		elseif SelectItem == 7 then
			Type = 14
		end		
		if GLOBAL_FengXiangBiao_DateList[32][Type] == nil then
			GLOBAL_FengXiangBiao_DateList[32][Type] = {}
		end
		if GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] + 1
		end	
		if usetime > 0 then	
			Type = 22
		else
			Type = 23
		end
		if GLOBAL_FengXiangBiao_DateList[32][Type] == nil then
			GLOBAL_FengXiangBiao_DateList[32][Type] = {}
		end
		if GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] + 1
		end	



		return 1
	elseif API_UsePoint(ActorID,3,xingshuid,1,dianquan) == 1 then
		API_ResponseWrite('<name>猜宝珠</name>')
		API_ResponseWrite('<win rect="300,100,400,300"></win>')
		API_ResponseWrite('<text>您身上的点券数量不足'..dianquan..'点，不能对'..API_GetGoodsName(yuanshibaozhu)..'进行激活。</text>')
		API_ResponseFlush(ActorID)
		return 0
	end
end
function CaiBaoZhuhuodong_xingbaozhu(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
--function CaiBaoZhu(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
--API_Trace('星宝珠=')	
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	if GoodsID < xingbaozhu1  or GoodsID > xingbaozhu7 then
--API_Trace('GoodsID='..GoodsID)	
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,0,'没有这个道具')
		API_ActorSendMsg(ActorID,7,'没有这个道具')
		return 0
	end
	API_ResponseWrite('<name>猜宝珠</name>')
	API_ResponseWrite('<win rect="300,100,400,300"></win>')
	--API_ResponseWrite('<text>猜宝珠，转轮盘，幸运大奖轻松拿！系统将于24点公布宝珠幸运星数，猜对宝珠幸运星数，就能转动命运之轮，收获</text><img srcgd="11045" tipgd="11045"><img srcgd="11043" tipgd="11043"><img srcgd="11035" tipgd="11035"><text>等大礼，绝对超值。</text><br>')
	--API_ResponseWrite('<text>活动期间，拥有</text><img srcgd="'..VIPkey_keyid..'" tipgd="'..VIPkey_keyid..'"><text color="255,0,255">消耗减半</text><text>！</text><br>')			
	local CaiBaoZhuhuodong_quanju_zhongjiangxingshu = API_VarDataGetNumber_Ex(1,0,OwnerID,1,1)
	local CaiBaoZhuhuodong_quanju_zhongjiangshijian = API_VarDataGetNumber_Ex(1,0,OwnerID,1,10)
--API_Trace('CaiBaoZhuhuodong_quanju_zhongjiangxingshu='..CaiBaoZhuhuodong_quanju_zhongjiangxingshu)		
	if CaiBaoZhuhuodong_quanju_zhongjiangxingshu > 0 and CaiBaoZhuhuodong_quanju_zhongjiangshijian > 0 then
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()	
		if CaiBaoZhuhuodong_quanju_zhongjiangshijian == 22 then
			if Hour < 22 then
				API_ResponseWrite('<text>昨日'..CaiBaoZhuhuodong_quanju_zhongjiangshijian..'时中奖的宝珠是</text><img srcgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'" tipgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'"><br><br>')
			else
				API_ResponseWrite('<text>'..Month..'月'..Day..'日'..CaiBaoZhuhuodong_quanju_zhongjiangshijian..'时中奖的宝珠是</text><img srcgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'" tipgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'"><br><br>')
			end
		else
			API_ResponseWrite('<text>'..Month..'月'..Day..'日'..CaiBaoZhuhuodong_quanju_zhongjiangshijian..'时中奖的宝珠是</text><img srcgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'" tipgd="'..CaiBaoZhuhuodong_quanju_zhongjiangxingshu..'"><br><br>')
		end
	end
	local uid = API_GetUID(High,Low) --获取UID
	local bagID,Loc = API_GetUIDGoodsInActor(uid,ActorID)--背包ID 和 位置]		
	local kaijiangriqi = API_ActorMeMScrollGetNumber(ActorID,bagID,Loc+1,1) --后1天的年月日
	local kaijiangtime = API_ActorMeMScrollGetNumber(ActorID,bagID,Loc+1,2) --激活时的时和分
	local kaijiangxianzhi = API_ActorMeMScrollGetNumber(ActorID,bagID,Loc+1,3) --首次开奖的月日时
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()	
	local todaytime = Year * 10000 + Month * 100 + Day
	local todaytime2 = Hour * 100 + Minute
	local kaijiangyear = math.floor(kaijiangriqi/10000)--取整
	local kaijiangyear2 = math.mod(kaijiangriqi,10000)--取余
	local kaijiangmonth = math.floor(kaijiangyear2/100)--取整
	local kaijianday = math.mod(kaijiangyear2,100)--取余
	
	local kaijiangHour = math.floor(kaijiangtime/100)--取整
	local kaijiangMinute = math.mod(kaijiangtime,100)--取余	
	
	local xianzhimonth = math.floor(kaijiangxianzhi/10000)--取整
	local xianzhimonth2 = math.mod(kaijiangxianzhi,10000)--取余
	local xianzhiday = math.floor(xianzhimonth2/100)--取整
	local xianzhihour = math.mod(xianzhimonth2,100)--取余
	
	local zhongjiangzhuangtai = 0
	local todaytime3 = Month * 10000 + Day * 100 + Hour
	if todaytime3 < kaijiangxianzhi then
		zhongjiangzhuangtai = 6
	end
	
	if zhongjiangzhuangtai ~= 6 then
		if Year <= kaijiangyear and Month <= kaijiangmonth then --如果年月小于等于标准年月
			if Day < kaijianday then --如果日 小于标准日
				zhongjiangzhuangtai = 5
			elseif Day == kaijianday then --如果日 等于标准日
				if Hour < kaijiangHour then --如果时小于标准时
					zhongjiangzhuangtai = 5
				elseif Hour == kaijiangHour then --如果时等于标准时
					if Minute <= kaijiangMinute then --如果分小于等于标准分
						zhongjiangzhuangtai = 5
					end
				end
			end
		end
	end	
	if zhongjiangzhuangtai == 5 then --时间OK
		if CaiBaoZhuhuodong_quanju_zhongjiangshijian > 0 then
			if CaiBaoZhuhuodong_quanju_zhongjiangxingshu == GoodsID then
				zhongjiangzhuangtai = 1 
			else
				zhongjiangzhuangtai = 2
			end
		end	
	end
--API_Trace('zhongjiangzhuangtai='..zhongjiangzhuangtai)	
	--0 过期--1 中奖--2 没中奖 --3未到兑奖日 -6 未到兑奖时间
	local guoqitime = CaiBaoZhuhuodong_quanju_zhongjiangshijian + 2	
	if CaiBaoZhuhuodong_quanju_zhongjiangshijian == 22 then
		guoqitime = 8
	end
	if zhongjiangzhuangtai == 0 then
		API_ResponseWrite('<text>这颗宝珠的最后兑奖日期是'..kaijiangyear..'年'..kaijiangmonth..'月'..kaijianday..'日'..kaijiangHour..'时'..kaijiangMinute..'分,已经错过了开奖时间，只能兑换普通奖励。</text>')
		API_ResponseWrite('<br><br><a href="CaiBaoZhuhuodong_duijiang1?1='..ActorID..'&2='..GoodsID..'&3='..High..'&4='..Low..'">兑换普通奖励</a><br>')
	elseif zhongjiangzhuangtai == 1 then
		API_ResponseWrite('<text color="255,0,0">恭喜您！这颗宝珠中奖了，可以兑换特殊奖励！</text>')
		API_ResponseWrite('<text color="255,0,0">请于下次开奖'..guoqitime..'点前兑换奖励，否则将按照下次开奖结果进行兑奖。</text>')
		API_ResponseWrite('<text color="255,0,0">'..kaijiangyear..'年'..kaijiangmonth..'月'..kaijianday..'日'..kaijiangHour..'时'..kaijiangMinute..'分后将只能兑换普通奖励。</text>')
		API_ResponseWrite('<br><br><a href="CaiBaoZhuhuodong_duijiang2?1='..ActorID..'&2='..GoodsID..'&3='..High..'&4='..Low..'">兑换特殊奖励</a><br>')
	elseif zhongjiangzhuangtai == 2 then
		API_ResponseWrite('<text>很遗憾的通知您，这颗宝珠</text><text color="255,0,0">没中奖，请在下个开奖时段'..guoqitime..'点再进行兑奖，也可直接兑换普通奖励。</text>')
		API_ResponseWrite('<br><text>每日开奖8次（08：00、10：00、12：00、14：00、16：00、18：00、20：00、22：00），中1次就可兑换特殊奖励</text>')
		API_ResponseWrite('<text color="255,0,0">'..kaijiangyear..'年'..kaijiangmonth..'月'..kaijianday..'日'..kaijiangHour..'时'..kaijiangMinute..'分后将只能兑换普通奖励。</text>')
		API_ResponseWrite('<br><br><a href="CaiBaoZhuhuodong_duijiang1?1='..ActorID..'&2='..GoodsID..'&3='..High..'&4='..Low..'">兑换普通奖励</a><br>')
	elseif zhongjiangzhuangtai == 3 then	
		API_ResponseWrite('<br><text>这颗宝珠的兑奖日期是'..kaijiangyear..'年'..kaijiangmonth..'月'..kaijianday..'日，8点开始</text><text color="255,0,0">错过兑奖时间或未在中奖时兑换奖励，将只能兑换普通奖励</text>')
		API_ResponseWrite('<br><text>每日开奖8次（08：00、10：00、12：00、14：00、16：00、18：00、20：00、22：00），中1次就可兑换特殊奖励</text>')	
	elseif zhongjiangzhuangtai == 4 then	
		API_ResponseWrite('<br><text>今日的开奖将从8点开始，请到时在试。</text>')
		API_ResponseWrite('<br><text>每日开奖8次（08：00、10：00、12：00、14：00、16：00、18：00、20：00、22：00），中1次就可兑换特殊奖励</text>')	
	elseif zhongjiangzhuangtai == 6 then
		API_ResponseWrite('<text>这颗宝珠的兑奖日期从'..xianzhimonth..'月'..xianzhiday..'日'..xianzhihour..'时开始，请到时开奖。</text>')
		API_ResponseWrite('<text color="255,0,0">'..kaijiangmonth..'月'..kaijianday..'日'..kaijiangHour..'时'..kaijiangMinute..'分后将只能兑换普通奖励。</text>')
		API_ResponseWrite('<br><text>每日开奖8次（08：00、10：00、12：00、14：00、16：00、18：00、20：00、22：00），中1次就可兑换特殊奖励</text>')
	end
	API_ResponseWrite('<br><br><a>关闭</a><br>')
	API_ResponseFlush(ActorID)
	return 1
end
function CaiBaoZhuhuodong_duijiang1() --普通奖励
	local ActorID = API_RequestGetNumber(1)
	local GoodsID = API_RequestGetNumber(2)
	local High = API_RequestGetNumber(3)
	local Low = API_RequestGetNumber(4)
	
	local CaiBaoZhuhuodong_quanju_zhongjiangxingshu = API_VarDataGetNumber_Ex(1,0,OwnerID,1,1)
	local CaiBaoZhuhuodong_quanju_zhongjiangshijian = API_VarDataGetNumber_Ex(1,0,OwnerID,1,10)
	local uid = API_GetUID(High,Low) --获取UID
	local bagID,Loc = API_GetUIDGoodsInActor(uid,ActorID)--背包ID 和 位置]		
	local kaijiangriqi = API_ActorMeMScrollGetNumber(ActorID,bagID,Loc+1,1)
	local kaijiangtime = API_ActorMeMScrollGetNumber(ActorID,bagID,Loc+1,2)
	local kaijiangxianzhi = API_ActorMeMScrollGetNumber(ActorID,bagID,Loc+1,3)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()	
	local todaytime = Year * 10000 + Month * 100 + Day
	local todaytime2 = Hour * 100 + Minute
	local kaijiangyear = math.floor(kaijiangriqi/10000)--取整
	local kaijiangyear2 = math.mod(kaijiangriqi,10000)--取余
	local kaijiangmonth = math.floor(kaijiangyear2/100)--取整
	local kaijianday = math.mod(kaijiangyear2,100)--取余
	
	local kaijiangHour = math.floor(kaijiangtime/100)--取整
	local kaijiangMinute = math.mod(kaijiangtime,100)--取余	
	
	local xianzhimonth = math.floor(kaijiangxianzhi/10000)--取整
	local xianzhimonth2 = math.mod(kaijiangxianzhi,10000)--取余
	local xianzhiday = math.floor(xianzhimonth2/100)--取整
	local xianzhihour = math.mod(xianzhimonth2,100)--取余
			
	if GoodsID < xingbaozhu1  or GoodsID > xingbaozhu7 then
--API_Trace('GoodsID='..GoodsID)	
		return
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,0,'没有这个道具')
		API_ActorSendMsg(ActorID,7,'没有这个道具')
		return
	end
--API_Trace('CaiBaoZhuhuodong_quanju_zhongjiangxingshu='..CaiBaoZhuhuodong_quanju_zhongjiangxingshu)		
	if CaiBaoZhuhuodong_quanju_zhongjiangxingshu > 0 then
	else
		--CaiBaoZhuhuodong_putongjianglijisuan(ActorID,GoodsID,High,Low)
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 0			
		if GoodsID == xingbaozhu1 then
			Type = 15	
		elseif  GoodsID == xingbaozhu2 then
			Type = 16
		elseif  GoodsID == xingbaozhu3 then
			Type = 17
		elseif  GoodsID == xingbaozhu4 then
			Type = 18
		elseif  GoodsID == xingbaozhu5 then
			Type = 19
		elseif  GoodsID == xingbaozhu6 then
			Type = 20
		elseif  GoodsID == xingbaozhu7 then
			Type = 21
		end	
		if GLOBAL_FengXiangBiao_DateList[32][Type] == nil then
			GLOBAL_FengXiangBiao_DateList[32][Type] = {}
		end
		if GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] + 1
		end			
		WYL_SevenDragonBalls_ZhuanPan(ActorID,GoodsID,High,Low,1)	
		CaiBaoZhuhuodong_yuanshibaozhuzengyu(ActorID)
		return
	end
	
	local zhongjiangzhuangtai = 0
	local todaytime3 = Month * 10000 + Day * 100 + Hour
	if todaytime3 < kaijiangxianzhi then
		zhongjiangzhuangtai = 6
	end
	
	if zhongjiangzhuangtai ~= 6 then
		if Year <= kaijiangyear and Month <= kaijiangmonth then --如果年月小于等于标准年月
			if Day < kaijianday then --如果日 小于标准日
				zhongjiangzhuangtai = 5
			elseif Day == kaijianday then --如果日 等于标准日
				if Hour < kaijiangHour then --如果时小于标准时
					zhongjiangzhuangtai = 5
				elseif Hour == kaijiangHour then --如果时等于标准时
					if Minute <= kaijiangMinute then --如果分小于等于标准分
						zhongjiangzhuangtai = 5
					end
				end
			end
		end
	end	
	if zhongjiangzhuangtai == 5 then --时间OK
		if CaiBaoZhuhuodong_quanju_zhongjiangshijian > 0 then
			if CaiBaoZhuhuodong_quanju_zhongjiangxingshu == GoodsID then
				zhongjiangzhuangtai = 1 
			else
				zhongjiangzhuangtai = 2
			end
		end	
	end
	if zhongjiangzhuangtai == 2 or zhongjiangzhuangtai == 0 then
		--执行奖励函数 传入高地位 进行删除
		--CaiBaoZhuhuodong_putongjianglijisuan(ActorID,GoodsID,High,Low)
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 0			
		if GoodsID == xingbaozhu1 then
			Type = 15	
		elseif  GoodsID == xingbaozhu2 then
			Type = 16
		elseif  GoodsID == xingbaozhu3 then
			Type = 17
		elseif  GoodsID == xingbaozhu4 then
			Type = 18
		elseif  GoodsID == xingbaozhu5 then
			Type = 19
		elseif  GoodsID == xingbaozhu6 then
			Type = 20
		elseif  GoodsID == xingbaozhu7 then
			Type = 21
		end	
		if GLOBAL_FengXiangBiao_DateList[32][Type] == nil then
			GLOBAL_FengXiangBiao_DateList[32][Type] = {}
		end
		if GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] + 1
		end			
		WYL_SevenDragonBalls_ZhuanPan(ActorID,GoodsID,High,Low,1)
		CaiBaoZhuhuodong_yuanshibaozhuzengyu(ActorID)
	else
		return
	end
end
function CaiBaoZhuhuodong_duijiang2()	--特殊奖励
	local ActorID = API_RequestGetNumber(1)
	local GoodsID = API_RequestGetNumber(2)
	local High = API_RequestGetNumber(3)
	local Low = API_RequestGetNumber(4)
	
	local CaiBaoZhuhuodong_quanju_zhongjiangxingshu = API_VarDataGetNumber_Ex(1,0,OwnerID,1,1)
	local CaiBaoZhuhuodong_quanju_zhongjiangshijian = API_VarDataGetNumber_Ex(1,0,OwnerID,1,10)
	local uid = API_GetUID(High,Low) --获取UID
	local bagID,Loc = API_GetUIDGoodsInActor(uid,ActorID)--背包ID 和 位置]		
	local kaijiangriqi = API_ActorMeMScrollGetNumber(ActorID,bagID,Loc+1,1)
	local kaijiangtime = API_ActorMeMScrollGetNumber(ActorID,bagID,Loc+1,2)
	local kaijiangxianzhi = API_ActorMeMScrollGetNumber(ActorID,bagID,Loc+1,3)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()	
	local todaytime = Year * 10000 + Month * 100 + Day
	local todaytime2 = Hour * 100 + Minute
	local kaijiangyear = math.floor(kaijiangriqi/10000)--取整
	local kaijiangyear2 = math.mod(kaijiangriqi,10000)--取余
	local kaijiangmonth = math.floor(kaijiangyear2/100)--取整
	local kaijianday = math.mod(kaijiangyear2,100)--取余
	
	local kaijiangHour = math.floor(kaijiangtime/100)--取整
	local kaijiangMinute = math.mod(kaijiangtime,100)--取余	
	
	local xianzhimonth = math.floor(kaijiangxianzhi/10000)--取整
	local xianzhimonth2 = math.mod(kaijiangxianzhi,10000)--取余
	local xianzhiday = math.floor(xianzhimonth2/100)--取整
	local xianzhihour = math.mod(xianzhimonth2,100)--取余
	
	if GoodsID < xingbaozhu1  or GoodsID > xingbaozhu7 then
		return
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,0,'没有这个道具')
		API_ActorSendMsg(ActorID,7,'没有这个道具')
		return
	end
	if CaiBaoZhuhuodong_quanju_zhongjiangxingshu > 0 then
	else
		return
	end
	local zhongjiangzhuangtai = 0
	local todaytime3 = Month * 10000 + Day * 100 + Hour
	if todaytime3 < kaijiangxianzhi then
		zhongjiangzhuangtai = 6
	end
	
	if zhongjiangzhuangtai ~= 6 then
		if Year <= kaijiangyear and Month <= kaijiangmonth then --如果年月小于等于标准年月
			if Day < kaijianday then --如果日 小于标准日
				zhongjiangzhuangtai = 5
			elseif Day == kaijianday then --如果日 等于标准日
				if Hour < kaijiangHour then --如果时小于标准时
					zhongjiangzhuangtai = 5
				elseif Hour == kaijiangHour then --如果时等于标准时
					if Minute <= kaijiangMinute then --如果分小于等于标准分
						zhongjiangzhuangtai = 5
					end
				end
			end
		end
	end	
	if zhongjiangzhuangtai == 5 then --时间OK
		if CaiBaoZhuhuodong_quanju_zhongjiangshijian > 0 then
			if CaiBaoZhuhuodong_quanju_zhongjiangxingshu == GoodsID then
				zhongjiangzhuangtai = 1 
			else
				zhongjiangzhuangtai = 2
			end
		end	
	end	
	if zhongjiangzhuangtai == 1 then
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 0			
		if GoodsID == xingbaozhu1 then
			Type = 15	
		elseif  GoodsID == xingbaozhu2 then
			Type = 16
		elseif  GoodsID == xingbaozhu3 then
			Type = 17
		elseif  GoodsID == xingbaozhu4 then
			Type = 18
		elseif  GoodsID == xingbaozhu5 then
			Type = 19
		elseif  GoodsID == xingbaozhu6 then
			Type = 20
		elseif  GoodsID == xingbaozhu7 then
			Type = 21
		end	
		if GLOBAL_FengXiangBiao_DateList[32][Type] == nil then
			GLOBAL_FengXiangBiao_DateList[32][Type] = {}
		end
		if GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] + 1
		end	
		WYL_SevenDragonBalls_ZhuanPan(ActorID,GoodsID,High,Low,2)
		CaiBaoZhuhuodong_yuanshibaozhuzengyu(ActorID)
		--执行奖励函数 传入高地位 进行删除 (ActorID,GoodsID,High,Low) 给奖励删除后CaiBaoZhuhuodong_yuanshibaozhuzengyu(ActorID)
	end
end
function CaiBaoZhuhuodong_putongjianglijisuan(ActorID,GoodsID,High,Low)
	local shuijingbi = 21
	local jingyan = 100
	--local shijijiangli = math.random(1,2)
	local jiangliID = 80697
	local xingshu =  GoodsID - yuanshibaozhu 
	if xingshu < 0 or xingshu > 7 then
		return
	end
	--[[if shijijiangli == 1 then
		shijijiangli = shuijingbi * xingshu
		jiangliID = 80696
	elseif shijijiangli == 2 then
		shijijiangli = jingyan * xingshu
		jiangliID = 80697 --80498
	end-]]--
	local shijijiangli = 2 * xingshu
	if jiangliID > 0 and shijijiangli > 0 then
		local uid = API_GetUID(High,Low) --获取UID
		local bagID,Loc = API_GetUIDGoodsInActor(uid,ActorID)--背包ID 和 位置
		if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,bagID,Loc,'使用宝珠') then
			if API_ActorCanAddGoods(ActorID,jiangliID,shijijiangli,1,0) ~= -1 then
				API_AddActorGoods(ActorID,jiangliID,shijijiangli,'宝珠奖励')
				API_ActorSendMsg(ActorID,3,'使用'..API_GetGoodsName(GoodsID)..'，获得“'..API_GetGoodsName(jiangliID)..'”'..shijijiangli..'张。')	
				API_ResponseWrite('<text>	 获得'..shijijiangli..'张</text><img srcgd="'..jiangliID..'" tipgd="'..jiangliID..'">')				
			else
				API_SendActorMailByName(API_GetActorName(ActorID),jiangliID,shijijiangli,1,''..API_GetGoodsName(yuanshibaozhu)..'奖励','使用'..API_GetGoodsName(GoodsID)..'获得'..shijijiangli..'个'..API_GetGoodsName(jiangliID)..'')
				API_ActorSendMsg(ActorID,3,'使用'..API_GetGoodsName(GoodsID)..'，获得“'..API_GetGoodsName(jiangliID)..'”'..shijijiangli..'张。（请到邮箱领取）')	
				API_ResponseWrite('<text>	 获得'..shijijiangli..'张</text><img srcgd="'..jiangliID..'" tipgd="'..jiangliID..'"><text>（请到邮箱领取）</text>')
			end	
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type = 0			
			if GoodsID == xingbaozhu1 then
				Type = 15	
			elseif  GoodsID == xingbaozhu2 then
				Type = 16
			elseif  GoodsID == xingbaozhu3 then
				Type = 17
			elseif  GoodsID == xingbaozhu4 then
				Type = 18
			elseif  GoodsID == xingbaozhu5 then
				Type = 19
			elseif  GoodsID == xingbaozhu6 then
				Type = 20
			elseif  GoodsID == xingbaozhu7 then
				Type = 21
			end	
			if GLOBAL_FengXiangBiao_DateList[32][Type] == nil then
				GLOBAL_FengXiangBiao_DateList[32][Type] = {}
			end
			if GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[32][Type][LaiYuan] + 1
			end	
			
			CaiBaoZhuhuodong_yuanshibaozhuzengyu(ActorID)
		end	
	end	
end
function CaiBaoZhuhuodong_yuanshibaozhuzengyu(ActorID)
	local nShiFouStart = API_DiffDatatime(CaiBaoZhuhuodong_StartTime.Year,CaiBaoZhuhuodong_StartTime.Month,CaiBaoZhuhuodong_StartTime.Day,CaiBaoZhuhuodong_StartTime.Hour,CaiBaoZhuhuodong_StartTime.Minute,CaiBaoZhuhuodong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(CaiBaoZhuhuodong_EndTime.Year,CaiBaoZhuhuodong_EndTime.Month,CaiBaoZhuhuodong_EndTime.Day,CaiBaoZhuhuodong_EndTime.Hour,CaiBaoZhuhuodong_EndTime.Minute,CaiBaoZhuhuodong_EndTime.Second)
	--[[if nShiFouStart < 0 and nShiFouEnd > 0 then
		local shiyongcishu = API_VarDataGetNumber(ActorID,1,CaiBaoZhuhuodong_shiyongcishu)
		if shiyongcishu < 5 then
			if API_ActorCanAddGoods(ActorID,yuanshibaozhu,1,3,0) ~= -1 then
				API_AddActorGoods(ActorID,yuanshibaozhu,1,'宝珠补给')
				API_ActorSendMsg(ActorID,3,'猜宝珠活动期间，使用宝珠，获得“'..API_GetGoodsName(yuanshibaozhu)..'”1颗。')	
				shiyongcishu = shiyongcishu + 1
				API_VarDataSetNumber(ActorID,1,CaiBaoZhuhuodong_shiyongcishu,shiyongcishu)
			else
				API_SendActorMailByName(API_GetActorName(ActorID),yuanshibaozhu,1,3,'猜宝珠活动','猜宝珠活动期间，使用宝珠获得1颗'..API_GetGoodsName(yuanshibaozhu)..'')
				API_ActorSendMsg(ActorID,3,'猜宝珠活动期间，使用宝珠，获得“'..API_GetGoodsName(yuanshibaozhu)..'”1颗。（请到邮箱领取）')
				shiyongcishu = shiyongcishu + 1
				API_VarDataSetNumber(ActorID,1,CaiBaoZhuhuodong_shiyongcishu,shiyongcishu)	
			end	
		else
			API_ActorSendMsg(ActorID,3,'您今天已经获得了5颗“'..API_GetGoodsName(yuanshibaozhu)..'”，达到上限，不能继续获得了。')	
		end
	end--]]

end
-------使用和奖励部分结束
function CaiBaoZhuhuodong_kuarihuidiao()
--API_Trace('进入回调')	

--修改注：由于兑奖次数从1改为8 所以系统回调改为 触发器回调 只在S1做 12点 只清理本日的兑奖日期 和 兑奖星数 时间

	if API_GetServerID() ~= 1 then
		return
	end
	local nShiFouStart = API_DiffDatatime(CaiBaoZhuhuodong_StartTime.Year,CaiBaoZhuhuodong_StartTime.Month,CaiBaoZhuhuodong_StartTime.Day,CaiBaoZhuhuodong_StartTime.Hour,CaiBaoZhuhuodong_StartTime.Minute,CaiBaoZhuhuodong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(CaiBaoZhuhuodong_EndTime2.Year,CaiBaoZhuhuodong_EndTime2.Month,CaiBaoZhuhuodong_EndTime2.Day,CaiBaoZhuhuodong_EndTime2.Hour,CaiBaoZhuhuodong_EndTime2.Minute,CaiBaoZhuhuodong_EndTime2.Second)
	--API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,1,0)
	--API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,2,0)
	--API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,10,0)
--[[	
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		local today = Year * 10000 + Month * 100 + Day
		local shangcikaijiangriqi = API_VarDataGetNumber_Ex(1,0,OwnerID,1,2)
		if shangcikaijiangriqi == today then
--API_Trace('日期相同了=')		
			return
		end
		local xing1 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,3)
		local xing2 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,4)
		local xing3 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,5)
		local xing4 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,6)
		local xing5 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,7)
		local xing6 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,8)
		local xing7 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,9)
--API_Trace('xing1='..xing1)
--API_Trace('xing2='..xing2)
--API_Trace('xing3='..xing3)
--API_Trace('xing4='..xing4)
--API_Trace('xing5='..xing5)
--API_Trace('xing6='..xing6)
--API_Trace('xing7='..xing7)		
		local maxxing = xing1
		local xingshu = 1
		local minxingjisuantable = {}
		minxingjisuantable[1] = xing1
		minxingjisuantable[2] = xing2
		minxingjisuantable[3] = xing3
		minxingjisuantable[4] = xing4
		minxingjisuantable[5] = xing5
		minxingjisuantable[6] = xing6
		minxingjisuantable[7] = xing7
		for i=1,7 do
			if minxingjisuantable[i] < maxxing then
				maxxing = minxingjisuantable[i]
				xingshu = i
--API_Trace('中奖='..i)					
			end
		end	
		
		if GLOBAL_FengXiangBiao_DateList[32][xingshu] == nil then
			GLOBAL_FengXiangBiao_DateList[32][xingshu] = {}
		end
		if GLOBAL_FengXiangBiao_DateList[32][xingshu][1] == nil then
			GLOBAL_FengXiangBiao_DateList[32][xingshu][1] = 1
		else
			GLOBAL_FengXiangBiao_DateList[32][xingshu][1] = 1
		end		
--API_Trace('fengxiangbiao1='..GLOBAL_FengXiangBiao_DateList[32][xingshu][1])	
		local zhongjiangxingshu = yuanshibaozhu + xingshu
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,1,zhongjiangxingshu)
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,2,today)
--API_Trace('zhongjiangxingshu='..zhongjiangxingshu)
--API_Trace('today='..today)			
	else
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,1,0)
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,2,0)
	end	
	API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,3,0)
	API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,4,0)
	API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,5,0)
	API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,6,0)
	API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,7,0)
	API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,8,0)
	API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,9,0)]]--
end
function CaiBaoZhuhuodong_kuarihuidiaopalyer(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local today = Year * 10000 + Month * 100 + Day
	local savetime = API_VarDataGetNumber(ActorID,1,CaiBaoZhuhuodong_chongzhiriqi)
	if today == savetime then
		return
	end
	local nShiFouStart = API_DiffDatatime(CaiBaoZhuhuodong_StartTime.Year,CaiBaoZhuhuodong_StartTime.Month,CaiBaoZhuhuodong_StartTime.Day,CaiBaoZhuhuodong_StartTime.Hour,CaiBaoZhuhuodong_StartTime.Minute,CaiBaoZhuhuodong_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(CaiBaoZhuhuodong_EndTime.Year,CaiBaoZhuhuodong_EndTime.Month,CaiBaoZhuhuodong_EndTime2.Day,CaiBaoZhuhuodong_EndTime.Hour,CaiBaoZhuhuodong_EndTime.Minute,CaiBaoZhuhuodong_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		local shiyongcishu = API_VarDataGetNumber(ActorID,1,CaiBaoZhuhuodong_shiyongcishu)
		if shiyongcishu > 5 then
			shiyongcishu = 5
		end
		local PackageSize = API_ActorGetPackageSize(ActorID)
		if shiyongcishu > 0 then
--			if PackageSize > 0 then
--				API_AddActorGoodsFlag(ActorID,yuanshibaozhu,shiyongcishu,1,'猜宝珠活动')
--				API_ActorSendMsg(ActorID,17,'获得'..shiyongcishu..'颗'..API_GetGoodsName(yuanshibaozhu)..'')
--				--API_ResponseWrite('<text>	 获得5颗</text><img srcgd="'..yuanshibaozhu..'" tipgd="'..yuanshibaozhu..'">')
--			else
--				API_SendActorMailByName(API_GetActorName(ActorID),yuanshibaozhu,shiyongcishu,3,''..API_GetGoodsName(yuanshibaozhu)..'活动赠送','为'..API_GetGoodsName(yuanshibaozhu)..'注入星数，第二日开奖的星数如果和你注入的星数一样，那么使用宝珠可以获得神秘奖励，如果和注入的星数不一样，也可以获得不错的普通奖励。所有奖励都和星数挂钩，星数越高，奖励越好。')
--				API_ActorSendMsg(ActorID,17,'获得'..shiyongcishu..'颗'..API_GetGoodsName(yuanshibaozhu)..',请到邮箱中查收')
--				--API_ResponseWrite('<text>	 获得5颗</text><img srcgd="'..yuanshibaozhu..'" tipgd="'..yuanshibaozhu..'"><text>请到邮箱中查收</text>')	
--			end	 
		end	
	end	
	API_VarDataSetNumber(ActorID,1,CaiBaoZhuhuodong_shiyongcishu,0)
	API_VarDataSetNumber(ActorID,1,CaiBaoZhuhuodong_chongzhiriqi,today)
end
if API_GetServerID() == 1 then
	if CaiBaoZhuhuodong_yaojiangchufaqi ~= nil then
		API_DestroyTriggerG(CaiBaoZhuhuodong_yaojiangchufaqi)
	end
	CaiBaoZhuhuodong_yaojiangchufaqi = API_CreateTimerTriggerG(0,0,60,-1,'teacher_yaojianghuidiao')
end
function teacher_yaojianghuidiao() --摇奖回调
	if API_GetServerID() ~= 1 then
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == 8 or Hour == 10 or Hour == 12 or Hour == 14 or Hour == 16 or Hour == 18 or Hour == 20 or Hour == 22 then
		if Minute ~= 0 then
			return
		end
		local nShiFouStart = API_DiffDatatime(CaiBaoZhuhuodong_StartTime.Year,CaiBaoZhuhuodong_StartTime.Month,CaiBaoZhuhuodong_StartTime.Day,CaiBaoZhuhuodong_StartTime.Hour,CaiBaoZhuhuodong_StartTime.Minute,CaiBaoZhuhuodong_StartTime.Second)
		local nShiFouEnd = API_DiffDatatime(CaiBaoZhuhuodong_EndTime2.Year,CaiBaoZhuhuodong_EndTime2.Month,CaiBaoZhuhuodong_EndTime2.Day,CaiBaoZhuhuodong_EndTime2.Hour,CaiBaoZhuhuodong_EndTime2.Minute,CaiBaoZhuhuodong_EndTime2.Second)
		if nShiFouStart < 0 and nShiFouEnd > 0 then
			local today = Year * 10000 + Month * 100 + Day
			local shangcikaijiangriqi = API_VarDataGetNumber_Ex(1,0,OwnerID,1,2)
			local shangcikaijianghour = API_VarDataGetNumber_Ex(1,0,OwnerID,1,2)
			if shangcikaijiangriqi == today then
	--API_Trace('日期相同了=')	
				if shangcikaijianghour == Hour then
					return
				end
			end
			local xing1 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,3)
			local xing2 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,4)
			local xing3 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,5)
			local xing4 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,6)
			local xing5 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,7)
			local xing6 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,8)
			local xing7 = API_VarDataGetNumber_Ex(1,0,OwnerID,1,9)
	--API_Trace('xing1='..xing1)
	--API_Trace('xing2='..xing2)
	--API_Trace('xing3='..xing3)
	--API_Trace('xing4='..xing4)
	--API_Trace('xing5='..xing5)
	--API_Trace('xing6='..xing6)
	--API_Trace('xing7='..xing7)		
			local maxxing = xing1
			local xingshu = 1
			local minxingjisuantable = {}
			minxingjisuantable[1] = xing1
			minxingjisuantable[2] = xing2
			minxingjisuantable[3] = xing3
			minxingjisuantable[4] = xing4
			minxingjisuantable[5] = xing5
			minxingjisuantable[6] = xing6
			minxingjisuantable[7] = xing7
			for i=1,7 do
				if minxingjisuantable[i] < maxxing then
					maxxing = minxingjisuantable[i]
					xingshu = i
	--API_Trace('中奖='..i)					
				end
			end	
			
			if GLOBAL_FengXiangBiao_DateList[32][xingshu] == nil then
				GLOBAL_FengXiangBiao_DateList[32][xingshu] = {}
			end
			if GLOBAL_FengXiangBiao_DateList[32][xingshu][1] == nil then
				GLOBAL_FengXiangBiao_DateList[32][xingshu][1] = 1
			else
				GLOBAL_FengXiangBiao_DateList[32][xingshu][1] = 1
			end		
	--API_Trace('fengxiangbiao1='..GLOBAL_FengXiangBiao_DateList[32][xingshu][1])	
			local zhongjiangxingshu = yuanshibaozhu + xingshu
			API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,1,zhongjiangxingshu)
			API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,2,today)
			API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,10,Hour)
	--API_Trace('zhongjiangxingshu='..zhongjiangxingshu)
	--API_Trace('today='..today)			
		else
			API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,1,0)
			API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,2,0)
			API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,10,0)
		end	
        API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,3,0)
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,4,0)
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,5,0)
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,6,0)
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,7,0)
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,8,0)
		API_VarDataSetNumber_Ex_Sync(1,0,OwnerID,1,9,0)
	end
end

