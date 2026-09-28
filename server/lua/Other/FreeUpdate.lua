--玩家升级到一定级别后免费升级技能

FreeUpdate_table = {
	[1] = {Lv=16,JiaoHuDate=1,Normal=2,BiSha=1},
	[2] = {Lv=26,JiaoHuDate=2,Normal=4,BiSha=3},
	[3] = {Lv=31,JiaoHuDate=3,Normal=5,BiSha=4},
	[4] = {Lv=36,JiaoHuDate=4,Normal=6,BiSha=5},
	[5] = {Lv=41,JiaoHuDate=5,Normal=7,BiSha=6},
	[6] = {Lv=46,JiaoHuDate=6,Normal=8,BiSha=7},
	[7] = {Lv=51,JiaoHuDate=7,Normal=9,BiSha=8},
	[8] = {Lv=56,JiaoHuDate=8,Normal=10,BiSha=9},
	[9] = {Lv=61,JiaoHuDate=9,Normal=11,BiSha=10},
}

function FreeUpdate_OnUpgrade(ActorID)
	local ActorLV = API_GetActorExpLevel(ActorID)
	for i = 1,table.getn(FreeUpdate_table) do
		local Lv = FreeUpdate_table[i].Lv
		local JiaoHuDate = FreeUpdate_table[i].JiaoHuDate
		local ActorLvUpJiaoHu = API_VarDataGetNumber(ActorID,1,11858)
		if ActorLV == Lv then
			API_VarDataSetNumber(ActorID,1,11858,JiaoHuDate)
			API_ActorSendMsg(ActorID,6,'点击右下卷轴免费升级技能')
			API_ActorSendMsg(ActorID,17,'点击右下卷轴免费升级技能')
			API_ActorSendMsg(ActorID,7,'点击右下卷轴免费升级技能')
			API_RemoveTaskScroll(ActorID,60007)
			LRY_UItwinkemanage(ActorID,1,85,104086,60007,9,'FreeUpdate_JuanZhou')
		end
	end
end

function FreeUpdate_JuanZhou()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local ActorLv = API_GetActorExpLevel(ActorID)
	for i = 1,table.getn(FreeUpdate_table) do
		if FreeUpdate_table[i+1] ~= nil then
			local Lv = FreeUpdate_table[i].Lv
			local Lv2 = FreeUpdate_table[i+1].Lv
			if ActorLv > Lv and ActorLv < Lv2 then
				ActorLv = Lv
				break
			end
		end
	end
	if ActorLv > 61 then
		ActorLv = 61
	end
	local ActorNormal = 0
	local ActorBiSha = 0
	local NextLevel = 0
	local JiaoHuDate = 0
	for i = 1,table.getn(FreeUpdate_table) do
		local Lv = FreeUpdate_table[i].Lv
		local Normal = FreeUpdate_table[i].Normal
		local BiSha = FreeUpdate_table[i].BiSha
		if ActorLv == Lv then
			ActorNormal = Normal
			ActorBiSha = BiSha
			if FreeUpdate_table[i+1] ~= nil then
				NextLevel = FreeUpdate_table[i+1].Lv
			else
				NextLevel = 0
			end
			JiaoHuDate = FreeUpdate_table[i].JiaoHuDate
			break
		end
	end
	if SelectItem == 1 then
		API_ShowFreeUpdateSkillWnd(ActorID,JiaoHuDate)	--打开技能控制面板的接口
		--API_ActorSendMsg(ActorID,3,'请点击您所需要升级的技能')
	else
		API_ResponseWrite('<name>免费升级技能</name>')
		API_ResponseWrite('<win close="0" move="1" rect="650,440,300,200"></win>')
		API_ResponseWrite('<text>您升级到</text><text color="255,0,255">'..ActorLv..'</text><text>级，获得一次免费升级</text><text color="255,0,255">'..ActorNormal..'</text><text>级或者以下技能的机会（必杀技能</text><text color="255,0,255">'..ActorBiSha..'</text><text>级）。升级条件无视经验、水晶币、熟练度要求。</text><br><br>')
		if NextLevel > 0 then
			API_ResponseWrite('<text color="255,0,255">该机会如果到'..NextLevel..'级不用将会自动消失</text><br>')
		end
		API_ResponseWrite('<br><a href="FreeUpdate_JuanZhou?1=1" underline="1">点击这里并选择你所需升级技能</a><br>')
		API_ResponseWrite('<br><a>取消</a>')
	end
end

function SkillFreeUpdateCost(ActorID,SkillID,JiaoHuDate)
	API_VarDataSetNumber(ActorID,1,11858,0)
	API_RemoveTaskScroll(ActorID,60007)
	API_ActorSendMsg(ActorID,3,'免费升级技能成功')
	API_ActorSendMsg(ActorID,7,'免费升级技能成功')
	API_ActorSendMsg(ActorID,17,'免费升级技能成功')
	return 1
end

function FreeUpdate_OnLogin()
	local ActorID = API_RequestGetActorID()
	local ActorLvUpJiaoHu = API_VarDataGetNumber(ActorID,1,11858)
	if ActorLvUpJiaoHu > 0 then
		API_RemoveTaskScroll(ActorID,60007)
		LRY_UItwinkemanage(ActorID,1,85,104086,60007,9,'FreeUpdate_JuanZhou')
	end
end

function FreeUpdate_OnLoginMap()
	local ActorID = API_RequestGetActorID()
	local ActorLvUpJiaoHu = API_VarDataGetNumber(ActorID,1,11858)
	if ActorLvUpJiaoHu > 0 then
		API_RemoveTaskScroll(ActorID,60007)
		LRY_UItwinkemanage(ActorID,1,85,104086,60007,9,'FreeUpdate_JuanZhou')
	end
end
