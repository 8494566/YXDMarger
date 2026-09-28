-------------------------------
--文件名:	Scp\Lua\Other\YunYing_LiBaoTeShi.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	刘操
--日  期:	2010-3-22
--版  本:	
--描  述:   礼包特使
--应  用:  
-------------------------------

--礼包购买标志
GLOBAL_LiBaoGouMaiBiaoZhi = 30285


local TeShiID = 12257--礼包特使ID
local Time = os.time()
local YunYingTime = {year=2009,month=4,day=13,hour=5,minute=59,second=59}--活动截止日期
local ActTime = os.time(YunYingTime)

if ActTime > Time then
	if DGTeShiFastID ~= nil then
		if API_GetMonsterID(DGTeShiFastID) > 0 then
			API_DestroyMonster(DGTeShiFastID)
		end
	end
	
	if LBTeShiFastID ~= nil then
		if API_GetMonsterID(LBTeShiFastID) > 0 then
			API_DestroyMonster(LBTeShiFastID)
		end
	end

	if API_GetServerID() == 1 or API_GetServerID() == 3 or API_GetServerID() == 4 or API_GetServerID() == 5 or API_GetServerID() == 10 then
		DGTeShiFastID = API_CreateMonsterEx(9,TeShiID,121,390,3,0,-1,1)
		LBTeShiFastID = API_CreateMonsterEx(25,TeShiID,124,340,3,0,-1,1)
	end
else
	--删除帝国活动npc
	if DGTeShiFastID ~= nil then
		if API_GetMonsterID(DGTeShiFastID) > 0 then
			API_DestroyMonster(DGTeShiFastID)
		end
	end
	--删除联邦活动npc
	if LBTeShiFastID ~= nil then
		if API_GetMonsterID(LBTeShiFastID) > 0 then
			API_DestroyMonster(LBTeShiFastID)
		end
	end
end


function YunYing_LiBaoTeShi(ActorID,NPCID)
	local BuySign = API_VarDataGetNumber(ActorID,1,30285)
	if BuySign == 1 then
		API_ResponseWrite('<text>如虎添翼大礼包每个角色仅限购一个，您已经购买过了。</text><br>')
		API_ResponseWrite('<text></text><br>')
		API_ResponseWrite('<a>关闭</a>')
	else
		API_ResponseWrite('<text>欢迎你,新的英雄!在我这,有为你量身定做的专属大礼包,每个角色仅限购买一个.销售截止日期4月13日6点!</text><br>')
		API_ResponseWrite('<br><a href="YunYing_LiBaoTeShi_Title?1=1">购买大礼包</a><br><br>')
		API_ResponseWrite('<a>关闭</a>')	
	end
end

function YunYing_LiBaoTeShi_Title()
	local SelectItem = API_RequestGetNumber(1)
	local ActorID = API_RequestGetActorID()
	local Point = API_ActorGetPropNum(ActorID,183)
	local ActorSex = API_GetActorSex(ActorID)
	local NeedPoint = 1000
	local BuySign = API_VarDataGetNumber(ActorID,1,30285)
	local GoodsID
	if ActorSex == 1 then
		GoodsID = 88906
	elseif ActorSex == 2 then
		GoodsID = 88907
	end
	if SelectItem == 1 then
		API_ResponseWrite('<text>购买如虎添翼大礼包需要1000点券</text><br>')
		API_ResponseWrite('<br><a href="YunYing_LiBaoTeShi_Title?1=2">购买</a><br><br>')
		API_ResponseWrite('<a>取消</a>')
	elseif SelectItem == 2 then
		if Point < NeedPoint then
			API_ResponseWrite('<text>您的点券不够,购买如虎添翼大礼包需要1000点券</text><br>')
			API_ResponseWrite('<a>关闭</a>')
			return 0	
		end
	
		if BuySign == 1 then
			API_ResponseWrite('<text>如虎添翼大礼包每个角色仅限购一个，您已经购买过了。</text><br>')
			API_ResponseWrite('<a>关闭</a>')
			return 0	
		end
		
		if API_ActorCanAddGoods(ActorID,88906,1,3,0) == -1 then
			API_ResponseWrite('<text>您的背包空间不够，请至少保证一个空格再购买</text><br>')
			API_ResponseWrite('<a>关闭</a>')
			return 0	
		end
	
		if API_UsePoint(ActorID,3,GoodsID,1,NeedPoint) == 0 then--判断扣除点券是否成功
			API_VarDataSetNumber(ActorID,1,30285,1)
			API_AddActorGoodsFlag(ActorID,GoodsID,1,3,'获得如虎添翼大礼包')
			API_ActorSendMsg(ActorID,3,'成功购买如虎添翼大礼包。')
			if GLOBAL_FengXiangBiao_DateList[45] ~= nil and GLOBAL_FengXiangBiao_DateList[45][GoodsID] ~= nil then
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[45][GoodsID][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[45][GoodsID][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[45][GoodsID][LaiYuan] = GLOBAL_FengXiangBiao_DateList[45][GoodsID][LaiYuan] + 1
				end
			end
		end
	end
end
