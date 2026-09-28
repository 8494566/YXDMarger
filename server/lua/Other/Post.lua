----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\Post.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2009-3-10
--版  本:	1.0
--描  述:	运营公告
--应  用:  

Post_StartTime = {Year = 2009,Month = 7,Day = 24,Hour = 0,Minute = 0,Second = 0}   -------开始时间
Post_EndTime = {Year = 2009,Month = 7,Day = 28,Hour = 0,Minute = 0,Second = 0}   -------停止时间

local QuestionList
local AnswerList
post_jianglitable = {
[1]={exp=1200,shuijingbi=1176},
[2]={exp=1600,shuijingbi=1176},
[3]={exp=2000,shuijingbi=1176},
[4]={exp=2304,shuijingbi=1344},
[5]={exp=2688,shuijingbi=1344},
[6]={exp=3072,shuijingbi=1344},
[7]={exp=3312,shuijingbi=1512},
[8]={exp=3680,shuijingbi=1512},
[9]={exp=4048,shuijingbi=1512},
[10]={exp=4224,shuijingbi=1680},
[11]={exp=5280,shuijingbi=3320},
[12]={exp=5984,shuijingbi=3320},
[13]={exp=6384,shuijingbi=3652},
[14]={exp=7056,shuijingbi=3652},
[15]={exp=7728,shuijingbi=3652},
[16]={exp=8000,shuijingbi=3984},
[17]={exp=8640,shuijingbi=3984},
[18]={exp=9280,shuijingbi=3984},
[19]={exp=9424,shuijingbi=4316},
[20]={exp=10032,shuijingbi=4316},
[21]={exp=11856,shuijingbi=4316},
[22]={exp=12096,shuijingbi=4648},
[23]={exp=12960,shuijingbi=4648},
[24]={exp=13824,shuijingbi=4648},
[25]={exp=13872,shuijingbi=4980},
[26]={exp=24480,shuijingbi=24000},
[27]={exp=26112,shuijingbi=24000},
[28]={exp=26112,shuijingbi=25600},
[29]={exp=27648,shuijingbi=25600},
[30]={exp=29184,shuijingbi=25600},
[31]={exp=28800,shuijingbi=27200},
[32]={exp=30240,shuijingbi=27200},
[33]={exp=31680,shuijingbi=27200},
[34]={exp=30912,shuijingbi=28800},
[35]={exp=32256,shuijingbi=28800},
[36]={exp=36288,shuijingbi=28800},
[37]={exp=35256,shuijingbi=30400},
[38]={exp=36816,shuijingbi=30400},
[39]={exp=38376,shuijingbi=30400},
[40]={exp=36864,shuijingbi=32000},
[41]={exp=41184,shuijingbi=32000},
[42]={exp=42912,shuijingbi=32000},
[43]={exp=40920,shuijingbi=33600},
[44]={exp=42504,shuijingbi=33600},
[45]={exp=44088,shuijingbi=33600},
[46]={exp=41520,shuijingbi=35200},
[47]={exp=42960,shuijingbi=35200},
[48]={exp=44400,shuijingbi=35200},
[49]={exp=41256,shuijingbi=36800},
[50]={exp=42552,shuijingbi=36800},
[51]={exp=42552,shuijingbi=36800},
[52]={exp=37824,shuijingbi=38400},
[53]={exp=37824,shuijingbi=38400},
[54]={exp=37824,shuijingbi=38400},
[55]={exp=33096,shuijingbi=40000},
}
local QuestionList1 = {
						[1] = '请选择您的真实性别',
						[2] = '请选择您的年龄',
						[3] = '您平时喜欢玩哪些类型的网络游戏？',
						[4] = '您觉得以下哪项最能吸引您参与体验《英雄岛》？',
						[5] = '请选择您玩《英雄岛》最多的地点',
						[6] = '您一般通过何种途径了解《英雄岛》的最新资讯？',
						}
local QuestionList2 = {
						[1] = '您玩了多长时间的网络游戏？',
						[2] = '您最主要通过哪种渠道知道《英雄岛》的？',
						[3] = '《英雄岛》最能吸引您关注的宣传推广内容是？',
						[4] = '以下哪种类型的广告，会吸引您去主动关注？',
						[5] = '以下哪种情况，您会主动拉您的朋友一起来玩游戏？',
						[6] = '除玩游戏外，您最喜欢在网上干什么？',
						}
						
local AnswerList1 = {
						[1] = {[1]='男',[2]='女',},
						[2] = {[1]='10-15岁',[2]='16岁-18岁',[3]='19岁-24岁',[4]='25岁以上',},
						[3] = {[1]='3D角色扮演（如魔兽世界）',[2]='2D角色扮演（如传奇）',[3]='Q版角色扮演（如梦幻西游）',[4]='休闲竞技类（如跑跑卡丁车）',},
						[4] = {[1]='宠物和仆从',[2]='浮空岛拉锯战',[3]='多英雄组合',[4]='房屋系统',},
						[5] = {[1]='家里',[2]='网吧',[3]='公司',[4]='学校',},
						[6] = {[1]='官方网站及官方论坛',[2]='游戏中朋友告之',[3]='客户端新闻广告',[4]='游戏内的公告',},
						}

local AnswerList2 = {
						[1] = {[1]='1年不到',[2]='1-2年',[3]='3-5年',[4]='5年以上',},
						[2] = {[1]='平面媒体（如报纸、杂志）',[2]='网吧宣传（如网吧活动、网吧海报）',[3]='搜索引擎（如百度、SOSO、GOOGLE）',[4]='网络媒体(如网络新闻、网络广告)',},
						[3] = {[1]='Q版画面',[2]='游戏视频、CG动画',[3]='点亮图标',[4]='开新服',},
						[4] = {[1]='广告中出现游戏角色形象',[2]='广告中出现热门明星人物',[3]='广告中出现奖品奖励',[4]='广告中出现时下热门的社会话题',},
						[5] = {[1]='游戏本身非常好玩，想分享给朋友',[2]='拉朋友来玩有机会获取奖励吧',[3]='想向朋友炫耀游戏内的高级角色与装备',},
						[6] = {[1]='逛论坛',[2]='看在线电影、电视剧、网络视频',[3]='网络购物',[4]='SNS社区（如爱情公寓、开心网）',},
						}						
local ChongFuTiShi = '    感谢您完成第一遍作答，现在请您开始复答。复答的答案需与第一遍的答案完全一致，才可视为成功作答。作答成功的玩家，将获得奖励。'
local WanBiTiShi = '    感谢您参与本次有奖用户调查，您的角色将自动获得我们送出的以下奖励：'

GLOBAL_Post_XuanXiang = {}

local SeeDate = 0
local SeeTime = 0
local datasave = 0

GLOBAL_Post_wenjuankaiguan = 1


function Post_OnLogin()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Day == 24 or Day == 25 then
		SeeDate = 12095
		SeeTime = 12096
		datasave = 12097
		QuestionList = QuestionList1
		AnswerList = AnswerList1
	elseif Day == 26 or Day == 27 then 
		SeeDate = 12098
		SeeTime = 12099
		datasave = 12100
		QuestionList = QuestionList2
		AnswerList = AnswerList2
	end
	if GLOBAL_Post_wenjuankaiguan == 0 then		
		return
	end
	if SeeDate == 0 or SeeTime == 0 or datasave == 0 then		
		return
	end
	local ActorID = API_RequestGetActorID()
	local ExpLevel = API_GetActorExpLevel(ActorID)
	if ExpLevel <= 16 then	
		return
	end
	local CampID = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(Post_StartTime.Year,Post_StartTime.Month,Post_StartTime.Day,Post_StartTime.Hour,Post_StartTime.Minute,Post_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(Post_EndTime.Year,Post_EndTime.Month,Post_EndTime.Day,Post_EndTime.Hour,Post_EndTime.Minute,Post_EndTime.Second)
	--判断是否在广告有效时间内
	if API_VarDataGetNumber(ActorID,1,datasave) == 0 then
		API_VarDataSetNumber(ActorID,1,SeeDate,0)
		API_VarDataSetNumber(ActorID,1,SeeTime,0)
	end
	if MapID == StaticMapID and API_VarDataGetNumber(ActorID,1,9901) > 0 and nShiFouStart < 0 and nShiFouEnd > 0 then
		--判断是否看过问卷
		local Biaozhi = API_VarDataGetNumber(ActorID,1,SeeDate)
		local Biaozhi2 = API_VarDataGetNumber(ActorID,1,SeeTime)
		Biaozhi = math.mod(Biaozhi,100000000)
		local LYear = math.floor(Biaozhi/10000)
		local LMonthDay = math.mod(Biaozhi,10000)
		local LMonth = math.floor(LMonthDay/100)
		local LDay = math.mod(LMonthDay,100)
		
		Biaozhi2 = math.mod(Biaozhi2,1000000)
		local LHour = math.floor(Biaozhi2/10000)
		local LMinuteSecond = math.mod(Biaozhi,10000)
		local LMinute = math.floor(LMinuteSecond/100)
		local LSecond = math.mod(LMinuteSecond,100)
		local nShiFouSee = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
		if nShiFouStart - nShiFouSee > 0 then
			API_RemoveTaskScroll(ActorID,2)
			API_AddTaskScrollEx(ActorID,2,104104,'Post_BodyText',0)
		end
	end
end



function Post_BodyText()
	local ActorID = API_RequestGetActorID()
	local CampID = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Day == 24 or Day == 25 then
		SeeDate = 12095
		SeeTime = 12096
		datasave = 12097
		QuestionList = QuestionList1
		AnswerList = AnswerList1
	elseif Day == 26 or Day == 27 then 
		SeeDate = 12098
		SeeTime = 12099
		datasave = 12100
		QuestionList = QuestionList2
		AnswerList = AnswerList2
	end
	local nShiFouStart = API_DiffDatatime(Post_StartTime.Year,Post_StartTime.Month,Post_StartTime.Day,Post_StartTime.Hour,Post_StartTime.Minute,Post_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(Post_EndTime.Year,Post_EndTime.Month,Post_EndTime.Day,Post_EndTime.Hour,Post_EndTime.Minute,Post_EndTime.Second)
	--判断是否在广告有效时间内
	if MapID == StaticMapID and API_VarDataGetNumber(ActorID,1,9901) > 0 and nShiFouStart < 0 and nShiFouEnd > 0 then
		--判断是否看过问卷
		if API_VarDataGetNumber(ActorID,1,datasave) == 0 then
			API_VarDataSetNumber(ActorID,1,SeeDate,0)
			API_VarDataSetNumber(ActorID,1,SeeTime,0)
		end
		local Biaozhi = API_VarDataGetNumber(ActorID,1,SeeDate)
		local Biaozhi2 = API_VarDataGetNumber(ActorID,1,SeeTime)
		Biaozhi = math.mod(Biaozhi,100000000)
		local LYear = math.floor(Biaozhi/10000)
		local LMonthDay = math.mod(Biaozhi,10000)
		local LMonth = math.floor(LMonthDay/100)
		local LDay = math.mod(LMonthDay,100)
		
		Biaozhi2 = math.mod(Biaozhi2,1000000)
		local LHour = math.floor(Biaozhi2/10000)
		local LMinuteSecond = math.mod(Biaozhi,10000)
		local LMinute = math.floor(LMinuteSecond/100)
		local LSecond = math.mod(LMinuteSecond,100)
		local nShiFouSee = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
		if nShiFouStart - nShiFouSee > 0 then
			API_ResponseWrite('<win rect="550,420,340,220" move="1" ></win>')
			API_ResponseWrite('<name>有奖问卷调查</name>')
			local selet = API_RequestGetNumber(1)
			if selet ~= 1 then
				API_ResponseWrite('<br><text>    亲爱的玩家，欢迎您开始问卷调查。本次调查设置了复答机制，复答的答案必须与第一次的答案一致。成功完成调查的玩家将获得以下奖励：</text><br><br>')
				local ExpLevel = API_GetActorExpLevel(ActorID)
				local exp = 0
				local shuijingbi = 0
				if post_jianglitable[ExpLevel] ~= nil then
					exp = post_jianglitable[ExpLevel].exp
					shuijingbi = post_jianglitable[ExpLevel].shuijingbi
				end
				API_ResponseWrite('<br><img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..exp..'</text>')
				API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..shuijingbi..'</text><br>')
				API_ResponseWrite('<br><a href="Post_BodyText?1=1">开始答题</a><br>')
			else
				local QuestionNo = math.random(table.getn(QuestionList)) --选题
				local Question = QuestionList[QuestionNo] --赋值
				API_ResponseWrite('<text>'..Question..'</text><br><br>') --出题 
				local AnswerNo = 0
				local YiXuanAnswerNo = {}
				for i = 1 , table.getn(AnswerList[QuestionNo]) do
					local ShiFouYiXuan = 1
					while ShiFouYiXuan == 1 do 
						AnswerNo = math.random(table.getn(AnswerList[QuestionNo])) --根据问题去找相应的答案列表
						if table.getn(YiXuanAnswerNo) == 0 then
							ShiFouYiXuan = 0
						end
						for j = 1, table.getn(YiXuanAnswerNo) do
							if YiXuanAnswerNo[j] == AnswerNo then
								ShiFouYiXuan = 1
								break
							elseif j == table.getn(YiXuanAnswerNo) then
								ShiFouYiXuan = 0
							end
						end
					end
					
					table.insert(YiXuanAnswerNo,AnswerNo)
					
					local Answer = AnswerList[QuestionNo][AnswerNo]
					
					API_ResponseWrite('<br><a href="QuestionAndAnswer?1='..QuestionNo..'&2='..AnswerNo..'">'..Answer..'</a><br>')
				end
				API_ResponseFlush(ActorID)
				GLOBAL_Post_XuanXiang[ActorID] = {}
			end
		end
	end
end



function QuestionAndAnswer()
	local ActorID = API_RequestGetActorID()
	local YiXuanList = {}
	local YiXuanQuestionNo = {}
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Day == 24 or Day == 25 then
		SeeDate = 12095
		SeeTime = 12096
		datasave = 12097
		QuestionList = QuestionList1
		AnswerList = AnswerList1
	elseif Day == 26 or Day == 27 then 
		SeeDate = 12098
		SeeTime = 12099
		datasave = 12100
		QuestionList = QuestionList2
		AnswerList = AnswerList2
	end
	for i = 1,table.getn(QuestionList) do
		local WenTiNo = API_RequestGetNumber(i*2 - 1)--???		
		if WenTiNo > 0 then
			local DaAnNo = API_RequestGetNumber(i*2)			
			table.insert(YiXuanList,WenTiNo)
			table.insert(YiXuanList,DaAnNo)
			table.insert(YiXuanQuestionNo,WenTiNo)
		end
	end
	if table.getn(YiXuanList) == table.getn(QuestionList) * 2 then
		if GLOBAL_Post_XuanXiang[ActorID] == nil then
			GLOBAL_Post_XuanXiang[ActorID] = {}
		end
		local YouXiao = 1
		local WanBi = 1
		for i in YiXuanList do	
			if math.mod(i,2) == 1 then
				if GLOBAL_Post_XuanXiang[ActorID][YiXuanList[i]] == nil then
					GLOBAL_Post_XuanXiang[ActorID][YiXuanList[i]] = YiXuanList[i+1]					
					YouXiao = 0
					WanBi = 0
				elseif GLOBAL_Post_XuanXiang[ActorID][YiXuanList[i]] ~= YiXuanList[i+1] then					
					YouXiao = 0
				end
			end
		end
		if WanBi == 1 then		
			
			if YouXiao == 1 then	
				for i=1,6 do
					if GLOBAL_Post_XuanXiang[ActorID][i] > 0 then
						local shuzhi = API_VarDataGetNumber(ActorID,1,datasave)						
						if i == 1 then
							shuzhi = shuzhi + GLOBAL_Post_XuanXiang[ActorID][i]	*100000
						elseif i == 2 then
							shuzhi = shuzhi + GLOBAL_Post_XuanXiang[ActorID][i]*10000
						elseif i == 3 then
							shuzhi = shuzhi + GLOBAL_Post_XuanXiang[ActorID][i]*1000
						elseif i == 4 then
							shuzhi = shuzhi + GLOBAL_Post_XuanXiang[ActorID][i]*100
						elseif i == 5 then
							shuzhi = shuzhi + GLOBAL_Post_XuanXiang[ActorID][i]*10
						elseif i == 6 then
							shuzhi = shuzhi + GLOBAL_Post_XuanXiang[ActorID][i]
						end
						API_VarDataSetNumber(ActorID,1,datasave,shuzhi)						
					end
				end	
				API_ResponseWrite('<win rect="550,420,340,220" move="1" ></win>')
				API_ResponseWrite('<name>有奖问卷调查</name>')
				API_ResponseWrite('<br><text>'..WanBiTiShi..'</text><br><br>')
				local ExpLevel = API_GetActorExpLevel(ActorID)
				local exp = 0
				local shuijingbi = 0
				if post_jianglitable[ExpLevel] ~= nil then
					exp = post_jianglitable[ExpLevel].exp
					shuijingbi = post_jianglitable[ExpLevel].shuijingbi
				end
				API_ResponseWrite('<br><img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>  ×'..exp..'</text>')
				API_ResponseWrite('<img srcgd="80289" tipgd="80289" ><text>  ×'..shuijingbi..'</text><br>')
				API_ResponseWrite('<br><a>关闭</a><br>')
				API_RemoveTaskScroll(ActorID,2)
				
				
				local MapID = API_GetActorMapID(ActorID)
				local StaticMapID = API_GetStaticMapID(MapID)
				local MapConfigID = API_GetMapConfigID(MapID)
				local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
				local nShiFouStart = API_DiffDatatime(Post_StartTime.Year,Post_StartTime.Month,Post_StartTime.Day,Post_StartTime.Hour,Post_StartTime.Minute,Post_StartTime.Second)
				local nShiFouEnd = API_DiffDatatime(Post_EndTime.Year,Post_EndTime.Month,Post_EndTime.Day,Post_EndTime.Hour,Post_EndTime.Minute,Post_EndTime.Second)
				if MapID == StaticMapID and API_VarDataGetNumber(ActorID,1,9901) > 0 and nShiFouStart < 0 and nShiFouEnd > 0 then
					--判断是否看过问卷
					local Biaozhi = API_VarDataGetNumber(ActorID,1,SeeDate)
					local Biaozhi2 = API_VarDataGetNumber(ActorID,1,SeeTime)
					local date = Year * 10000 + Month * 100 + Day
					local time = Hour * 10000 + Minute * 100 + Second
					API_VarDataSetNumber(ActorID,1,SeeDate,date)
					API_VarDataSetNumber(ActorID,1,SeeTime,time)
					Biaozhi = math.mod(Biaozhi,100000000)
					local LYear = math.floor(Biaozhi/10000)
					local LMonthDay = math.mod(Biaozhi,10000)
					local LMonth = math.floor(LMonthDay/100)
					local LDay = math.mod(LMonthDay,100)
					
					Biaozhi2 = math.mod(Biaozhi2,1000000)
					local LHour = math.floor(Biaozhi2/10000)
					local LMinuteSecond = math.mod(Biaozhi,10000)
					local LMinute = math.floor(LMinuteSecond/100)
					local LSecond = math.mod(LMinuteSecond,100)
					local nShiFouSee = API_DiffDatatime(LYear,LMonth,LDay,LHour,LMinute,LSecond)
					if nShiFouStart - nShiFouSee > 0 then
						API_ActorAddExp(ActorID,exp,1802,'问卷奖励')
						API_ActorShoppingM_Add(ActorID,shuijingbi,1802,'问卷奖励')
						API_ActorSendMsg(ActorID,0,'完成问卷，您的角色已获得'..exp..'经验。')
						API_ActorSendMsg(ActorID,0,'完成问卷，您的角色已获得'..shuijingbi..'水晶币。')
					end
				end
			elseif YouXiao == 0 then
				API_ResponseWrite('<win rect="550,420,340,220" move="1" ></win>')
				API_ResponseWrite('<text>两次回答答案不一致，请重新回答</text><br><br>')
				local QuestionNo = math.random(table.getn(QuestionList))
				local Question = QuestionList[QuestionNo]
				API_ResponseWrite('<text>'..Question..'</text><br><br>')
				local AnswerNo = 0
				local YiXuanAnswerNo = {}
				for i = 1 , table.getn(AnswerList[QuestionNo]) do
					local ShiFouYiXuan = 1
					while ShiFouYiXuan == 1 do 
						AnswerNo = math.random(table.getn(AnswerList[QuestionNo]))
						if table.getn(YiXuanAnswerNo) == 0 then
							ShiFouYiXuan = 0
						end
						for j = 1, table.getn(YiXuanAnswerNo) do
							if YiXuanAnswerNo[j] == AnswerNo then
								ShiFouYiXuan = 1
								break
							elseif j == table.getn(YiXuanAnswerNo) then
								ShiFouYiXuan = 0
							end
						end
					end
					
					table.insert(YiXuanAnswerNo,AnswerNo)
					
					local Answer = AnswerList[QuestionNo][AnswerNo]
					
					API_ResponseWrite('<br><a href="QuestionAndAnswer?1='..QuestionNo..'&2='..AnswerNo..'">'..Answer..'</a><br>')
				end
				API_ResponseFlush(ActorID)
				GLOBAL_Post_XuanXiang[ActorID] = {}
			end
		else
			API_ResponseWrite('<win rect="550,420,340,220" move="1" ></win>')
			API_ResponseWrite('<name>开始复答</name>')
			API_ResponseWrite('<br><text>'..ChongFuTiShi..'</text><br><br>')
			local QuestionNo = math.random(table.getn(QuestionList))
			local Question = QuestionList[QuestionNo]
			API_ResponseWrite('<text>'..Question..'</text><br><br>')
			local AnswerNo = 0
			local YiXuanAnswerNo = {}
			for i = 1 , table.getn(AnswerList[QuestionNo]) do
				local ShiFouYiXuan = 1
				while ShiFouYiXuan == 1 do 
					AnswerNo = math.random(table.getn(AnswerList[QuestionNo]))
					if table.getn(YiXuanAnswerNo) == 0 then
						ShiFouYiXuan = 0
					end
					for j = 1, table.getn(YiXuanAnswerNo) do
						if YiXuanAnswerNo[j] == AnswerNo then
							ShiFouYiXuan = 1
							break
						elseif j == table.getn(YiXuanAnswerNo) then
							ShiFouYiXuan = 0
						end
					end
				end
				
				table.insert(YiXuanAnswerNo,AnswerNo)
				
				local Answer = AnswerList[QuestionNo][AnswerNo]
				
				API_ResponseWrite('<br><a href="QuestionAndAnswer?1='..QuestionNo..'&2='..AnswerNo..'">'..Answer..'</a><br>')
			end
		end
	else
		API_ResponseWrite('<win rect="550,420,340,220" move="1" ></win>')
		API_ResponseWrite('<name>有奖问卷调查</name>')
		local QuestionNo = 0
		local ShiFouYiXuanWT = 1
		while ShiFouYiXuanWT == 1 do 
			QuestionNo = math.random(table.getn(QuestionList))
			if table.getn(YiXuanQuestionNo) == 0 then
				ShiFouYiXuanWT = 0
			end
			for j = 1, table.getn(YiXuanQuestionNo) do
				if YiXuanQuestionNo[j] == QuestionNo then
					ShiFouYiXuanWT = 1
					break
				elseif j == table.getn(YiXuanQuestionNo) then
					ShiFouYiXuanWT = 0
				end
			end
		end
		local Question = QuestionList[QuestionNo]
		API_ResponseWrite('<text>'..Question..'</text><br><br>')
		local AnswerNo = 0
		local YiXuanAnswerNo = {}
		for i = 1 , table.getn(AnswerList[QuestionNo]) do
			local ShiFouYiXuan = 1
			while ShiFouYiXuan == 1 do 
				AnswerNo = math.random(table.getn(AnswerList[QuestionNo]))
				if table.getn(YiXuanAnswerNo) == 0 then
					ShiFouYiXuan = 0
				end
				for j = 1, table.getn(YiXuanAnswerNo) do
					if YiXuanAnswerNo[j] == AnswerNo then
						ShiFouYiXuan = 1
						break
					elseif j == table.getn(YiXuanAnswerNo) then
						ShiFouYiXuan = 0
					end
				end
			end
			
			table.insert(YiXuanAnswerNo,AnswerNo)
			
			local Answer = AnswerList[QuestionNo][AnswerNo]
			
			local hrefShuChu = '"QuestionAndAnswer?'
			for j = 1,table.getn(YiXuanList) do
				hrefShuChu = hrefShuChu..''..j..'='..YiXuanList[j]..'&'
			end
			hrefShuChu = hrefShuChu..''.. table.getn(YiXuanList) + 1 ..'='..QuestionNo..'&'
			hrefShuChu = hrefShuChu..''.. table.getn(YiXuanList) + 2 ..'='..AnswerNo..'"'
			API_ResponseWrite('<br><a href='..hrefShuChu..'>'..Answer..'</a><br>')
		end
		API_ResponseFlush(ActorID)
	end
end

--设置客户端关闭时的弹出网页
--API_SetPopUpInfo(1,'http://qqyxd.21mmo.com/question/imdex.html')