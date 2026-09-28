--给宠物增加变身效果临时脚本 PetTurned.lua

--//获取玩家当前召唤出的宠物的怪物FastID，返回-1表示当前未召唤出
--API_GetActorConjedPetFastID(long lActorID)


--交互数据
--19090 存储宠物的MonsterID
--19091 存储相应的状态ID
--19092 存储变身到期时间

local CPet_TurnedTime = 1814400

--上线
--判断玩家交互中的时间是否为0，不为0则判断召唤出的MonsterID，是否到期，然后加上相应的状态
--如果到期，那么交互清零
function CPetTurned_OnLogin(ActorID)
	local PlayPetMonID = API_VarDataGetNumber(ActorID,1,19090)
	if PlayPetMonID > 0 then
		local PetFastID = API_GetActorConjedPetFastID(ActorID)
		if PetFastID ~= -1 then
			local Time = os.time()
			local PetMonID = API_GetMonsterID(PetFastID)
			local PetBuffID = API_VarDataGetNumber(ActorID,1,19091)
			local PetTurnedTime = API_VarDataGetNumber(ActorID,1,19092)
			if PlayPetMonID == PetMonID then
				if Time < PetTurnedTime then
					API_MonsterAddStatus(PetFastID, PetBuffID, 0)
					local Time2 = PetTurnedTime - Time
					if Time2 > 86400 then
						local Day = math.floor(Time2/86400)
						local Time3 = math.mod(Time2,86400)
						local Hour = math.floor(Time3/3600)
						API_ActorSendMsg(ActorID,0,'您的宠物变身状态剩余'..Day..'天'..Hour..'小时')
						API_ActorSendMsg(ActorID,7,'您的宠物变身状态剩余'..Day..'天'..Hour..'小时')
					else
						local Hour = math.floor(Time2/3600)
						if Hour > 0 then
							API_ActorSendMsg(ActorID,0,'您的宠物变身状态剩余'..Hour..'小时')
							API_ActorSendMsg(ActorID,7,'您的宠物变身状态剩余'..Hour..'小时')
						else
							API_ActorSendMsg(ActorID,0,'您的宠物变身状态即将到期')
							API_ActorSendMsg(ActorID,7,'您的宠物变身状态即将到期')
						end
					end
				else
					API_VarDataSetNumber(ActorID,1,19090,0)
					API_VarDataSetNumber(ActorID,1,19091,0)
					API_VarDataSetNumber(ActorID,1,19092,0)
				end
			end
		end
	end
end

--下线
--可以不用管
function CPetTurned_OnLogout(ActorID)
end

--进地图
--判断玩家交互中的时间是否为0，不为0则判断召唤出的MonsterID，是否到期，然后加上相应的状态
--如果到期，那么交互清零
function CPetTurned_OnLoginMap(ActorID)
	local PlayPetMonID = API_VarDataGetNumber(ActorID,1,19090)
	if PlayPetMonID > 0 then
		local PetFastID = API_GetActorConjedPetFastID(ActorID)
		if PetFastID ~= -1 then
			local Time = os.time()
			local PetMonID = API_GetMonsterID(PetFastID)
			local PetBuffID = API_VarDataGetNumber(ActorID,1,19091)
			local PetTurnedTime = API_VarDataGetNumber(ActorID,1,19092)
			if PlayPetMonID == PetMonID then
				if Time < PetTurnedTime then
					API_MonsterAddStatus(PetFastID, PetBuffID, 0)
				else
					API_VarDataSetNumber(ActorID,1,19090,0)
					API_VarDataSetNumber(ActorID,1,19091,0)
					API_VarDataSetNumber(ActorID,1,19092,0)
				end
			end
		end
	end
end

--出地图
--可以不用管
function CPetTurned_OnLogoutMap(ActorID)
end

--召唤宠物时回调
--判断玩家交互中的时间是否为0，不为0则判断召唤出的MonsterID，是否到期，然后加上相应的状态
--如果到期，那么交互清零
--20110927任务宠物交互为1
function CPet_AddBuff(ActorID,PetFastID,PetMonID)
	--API_Trace("aaaaaaaaaaaaaaaaaaa------1")
	local PlayPetMonID = API_VarDataGetNumber(ActorID,1,19090)
	if PlayPetMonID > 0 then
		local Time = os.time()
		local PetBuffID = API_VarDataGetNumber(ActorID,1,19091)
		local PetTurnedTime = API_VarDataGetNumber(ActorID,1,19092)
		if PlayPetMonID == PetMonID then
			if Time < PetTurnedTime then
				API_MonsterAddStatus(PetFastID, PetBuffID, 0)
			else
				API_VarDataSetNumber(ActorID,1,19090,0)
				API_VarDataSetNumber(ActorID,1,19091,0)
				API_VarDataSetNumber(ActorID,1,19092,0)				
			end
		end
		--API_Trace("aaaaaaaaaaaaaaaaaaa------")
	end
	API_VarDataSetNumber(ActorID,1,4006,1)
	API_VarDataSetNumber(ActorID,1,4015,1)
	--API_Trace("aaaaaaaaaaaaaaaaaaa------3")
end

CPet_TurnedBuffTable = {
	[88131] = {
			[1] = {BuffID=765001,TurnedTime=1814400,TurnedName='碧灵兽外形',BuffSM='一种浅蓝色的皮卡丘'},
			[2] = {BuffID=765002,TurnedTime=1814400,TurnedName='黑地精外形',BuffSM='小个的地精，皮肤是黑色的'},
			[3] = {BuffID=765003,TurnedTime=1814400,TurnedName='蓝钟灵外形',BuffSM='蓝色机奴钟灵外型'},
			[4] = {BuffID=765004,TurnedTime=1814400,TurnedName='紫泥浆怪外形',BuffSM='紫色的泥浆怪'},
			[5] = {BuffID=765005,TurnedTime=1814400,TurnedName='蓝蝙蝠外型',BuffSM='蓝色的小蝙蝠外型'},
		},
	[88132] = {
			[1] = {BuffID=765006,TurnedTime=1814400,TurnedName='火灵兽外形',BuffSM='一种粉红色体形较大的皮卡丘'},
			[2] = {BuffID=765007,TurnedTime=1814400,TurnedName='幽暗沙虫外形',BuffSM='暗紫色的小沙虫外形'},
			[3] = {BuffID=765008,TurnedTime=1814400,TurnedName='绿蝈蝈外形',BuffSM='绿色的蝈蝈外形'},
			[4] = {BuffID=765009,TurnedTime=1814400,TurnedName='黑色恶魔椅外形',BuffSM='黑色的椅子，但是可以咬人'},
			[5] = {BuffID=765010,TurnedTime=1814400,TurnedName='白熊宝宝外形',BuffSM='白色的熊宝宝外形'},
		},
	[88133] = {
			[1] = {BuffID=765011,TurnedTime=1814400,TurnedName='恶魔猪外形',BuffSM='紫色的会飞的猪'},
			[2] = {BuffID=765012,TurnedTime=1814400,TurnedName='绿龙宝宝外形',BuffSM='绿色的小草龙，有蜻蜓的翅膀'},
			[3] = {BuffID=765013,TurnedTime=1814400,TurnedName='三尾灵猫外形',BuffSM='三只尾巴不停的转的五彩飞猫'},
			[4] = {BuffID=765014,TurnedTime=1814400,TurnedName='RT-X外形',BuffSM='小形侦察型机械卫星'},
			[5] = {BuffID=765015,TurnedTime=1814400,TurnedName='瑞狐外形',BuffSM='一种脑袋很大的小狐狸，有鹿角'},
		},
	[89062] = {
			[1] = {BuffID=765001,TurnedTime=259200,TurnedName='碧灵兽外形',BuffSM='一种浅蓝色的皮卡丘'},
			[2] = {BuffID=765002,TurnedTime=259200,TurnedName='黑地精外形',BuffSM='小个的地精，皮肤是黑色的'},
			[3] = {BuffID=765003,TurnedTime=259200,TurnedName='蓝钟灵外形',BuffSM='蓝色机奴钟灵外型'},
			[4] = {BuffID=765004,TurnedTime=259200,TurnedName='紫泥浆怪外形',BuffSM='紫色的泥浆怪'},
			[5] = {BuffID=765005,TurnedTime=259200,TurnedName='蓝蝙蝠外型',BuffSM='蓝色的小蝙蝠外型'},
		},
	[89063] = {
			[1] = {BuffID=765006,TurnedTime=259200,TurnedName='火灵兽外形',BuffSM='一种粉红色体形较大的皮卡丘'},
			[2] = {BuffID=765007,TurnedTime=259200,TurnedName='幽暗沙虫外形',BuffSM='暗紫色的小沙虫外形'},
			[3] = {BuffID=765008,TurnedTime=259200,TurnedName='绿蝈蝈外形',BuffSM='绿色的蝈蝈外形'},
			[4] = {BuffID=765009,TurnedTime=259200,TurnedName='黑色恶魔椅外形',BuffSM='黑色的椅子，但是可以咬人'},
			[5] = {BuffID=765010,TurnedTime=259200,TurnedName='白熊宝宝外形',BuffSM='白色的熊宝宝外形'},
		},
	[89064] = {
			[1] = {BuffID=765011,TurnedTime=259200,TurnedName='恶魔猪外形',BuffSM='紫色的会飞的猪'},
			[2] = {BuffID=765012,TurnedTime=259200,TurnedName='绿龙宝宝外形',BuffSM='绿色的小草龙，有蜻蜓的翅膀'},
			[3] = {BuffID=765013,TurnedTime=259200,TurnedName='三尾灵猫外形',BuffSM='三只尾巴不停的转的五彩飞猫'},
			[5] = {BuffID=765015,TurnedTime=259200,TurnedName='瑞狐外形',BuffSM='一种脑袋很大的小狐狸，有鹿角'},
			[4] = {BuffID=765014,TurnedTime=259200,TurnedName='RT-X外形',BuffSM='小形侦察型机械卫星'},
		},
}

-- 88131 宠物变身药丸【低级】
-- 88132 宠物变身药丸【中级】
-- 88133 宠物变身药丸【高级】
--使用三种变身卡回调（建立相应的表）
--根据使用的物品ID读取相应的表：状态ID、其他数据
function CPet_TurnedGoodsFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	CPet_AddTurnedBuff(ActorID,GoodsID)
	return 1
end

function CPet_AddTurnedBuff(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = GoodsID or API_RequestGetNumber(2)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if CPet_TurnedBuffTable[GoodsID] == nil then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local XuanXiang = API_RequestGetNumber(1)
	local Time = os.time()
	local PetFastID = API_GetActorConjedPetFastID(ActorID)
	if XuanXiang == 1 then
		if PetFastID ~= -1 then
			local XuanZe = API_RequestGetNumber(3)
			local BuffID = CPet_TurnedBuffTable[GoodsID][XuanZe].BuffID
			local TurnedName = CPet_TurnedBuffTable[GoodsID][XuanZe].TurnedName
			local BuffSM = CPet_TurnedBuffTable[GoodsID][XuanZe].BuffSM
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>您选择的是：</text><br>')
			API_ResponseWrite('<br><text color="255,0,255">'..TurnedName..'：'..BuffSM..'</text><br>')
			API_ResponseWrite('<br><text>确定要将现在召唤的宠物使用这个宠物外形吗？</text><br>')
			API_ResponseWrite('<br><text color="255,0,0">新的宠物变身效果会覆盖原有宠物变身效果</text><br>')
			API_ResponseWrite('<br><a href="CPet_AddTurnedBuff?1=2&2='..GoodsID..'&3='..XuanZe..'">确定</a><br>')
			API_ResponseWrite('<br><a href="CPet_AddTurnedBuff?2='..GoodsID..'">返回</a><br>')
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>您没有召唤宠物，无法使用'..API_GetGoodsName(GoodsID)..'。</text><br>')
			API_ResponseWrite('<br><a>我知道了</a>')
		end
	elseif XuanXiang == 2 then
		if PetFastID ~= -1 then
			if API_ActorRemoveGoods(ActorID,GoodsID, 1, '宠物变身删除道具') then
				local PetBuffID = API_VarDataGetNumber(ActorID,1,19091)
				if PetBuffID > 0 then
					API_MonsterRemoveStatus(PetFastID, PetBuffID)
				end
				local XuanZe = API_RequestGetNumber(3)
				local PetMonID = API_GetMonsterID(PetFastID)
				local BuffID = CPet_TurnedBuffTable[GoodsID][XuanZe].BuffID
				local TurnedName = CPet_TurnedBuffTable[GoodsID][XuanZe].TurnedName
				local TurnedTime = CPet_TurnedBuffTable[GoodsID][XuanZe].TurnedTime
				local BuffSM = CPet_TurnedBuffTable[GoodsID][XuanZe].BuffSM
				local Time2 = TurnedTime + Time
				local Time3 = math.floor(TurnedTime/86400)
				API_VarDataSetNumber(ActorID,1,19090,PetMonID)
				API_VarDataSetNumber(ActorID,1,19091,BuffID)
				API_VarDataSetNumber(ActorID,1,19092,Time2)
				API_MonsterAddStatus(PetFastID, BuffID, 0)
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>成功将您现在使用的宠物变身为'..TurnedName..'</text><br>')
				API_ResponseWrite('<br><text color="255,0,255">宠物变身时间重置为'..Time3..'天。</text><br>')
				API_ResponseWrite('<br><a>确定</a>')
			end
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>您没有召唤宠物，无法使用'..API_GetGoodsName(GoodsID)..'。</text><br>')
			API_ResponseWrite('<br><a>我知道了</a>')
		end
	else
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>只能对当前已经召唤出来的宠物进行变身，如没有召唤宠物，则无法使用'..API_GetGoodsName(GoodsID)..'。</text><br>')
		for i = 1,table.getn(CPet_TurnedBuffTable[GoodsID]) do
			local BuffID = CPet_TurnedBuffTable[GoodsID][i].BuffID
			local TurnedName = CPet_TurnedBuffTable[GoodsID][i].TurnedName
			local BuffSM = CPet_TurnedBuffTable[GoodsID][i].BuffSM
			API_ResponseWrite('<br><a href="CPet_AddTurnedBuff?1=1&2='..GoodsID..'&3='..i..'">'..TurnedName..'</a><text>：'..BuffSM..'</text><br>')
		end
		API_ResponseWrite('<br><a>关闭</a>')
	end
	API_ResponseFlush(ActorID)
end
--[[
//参数说明：uID, 指定的胶囊， 
//lPropID意义同 API_GetActorConjedPetPropNum
long API_GetUIDPetCapsulePropNum(UID uID,long lPropID)

//参数说明：uID, 指定的胶囊， 
//lPropID意义同 API_GetActorConjedPetPropNum
//属性的新值
long API_SetUIDPetCapsulePropNum(UID uID,long lPropID, long lNewValue)

宠物管理员  12367
]]
if not API_IsEctypeServer() or API_IsBranchServer() then
	if not API_IsEctypeServer() and API_GetServerID() == 1 then
		LBPetAdminNpc = LBPetAdminNpc or API_CreateMonster(63,12367,69,67,5,0,-1)
		DGPetAdminNpc = DGPetAdminNpc or API_CreateMonster(1,12367,293,316,3,0,-1)
	end
end

function WYL_PetCapsulesSynthesis()
	local ActorID = API_RequestGetActorID()
	local Sexy = API_GetActorSex(ActorID)
	local XuanZe = API_RequestGetNumber(1)
	if XuanZe == 1 then
		API_ResponseWrite('<name></name>') 
		API_ResponseWrite('<win rect="120, 190, 350, 300" alpha="240" balpha="230"></win>') 
		if API_RequestGetNumber(2) == 1 then
			local UidHigh1 = API_RequestGetNumber(100)--高位UID
			local UidLow1 = API_RequestGetNumber(1100)--低位UID
			local Uid1 = API_GetUID(UidHigh1,UidLow1) --获取UID
			local BoxID1,LocID1 = API_GetUIDGoodsInActor(Uid1,ActorID)--背包ID 和 位置
			local GoodsID1 = API_GetUIDGoodsPropNum(Uid1,0)--提交的物品ID
			local UidHigh2 = API_RequestGetNumber(200)--高位UID
			local UidLow2 = API_RequestGetNumber(1200)--低位UID
			local Uid2 = API_GetUID(UidHigh2,UidLow2) --获取UID	
			local BoxID2,LocID2 = API_GetUIDGoodsInActor(Uid2,ActorID)--背包ID 和 位置
			local GoodsID2 = API_GetUIDGoodsPropNum(Uid2,0)--提交的物品ID
			if GoodsID1 <= 0 or GoodsID2 <= 0 then
				API_ResponseWrite('<br><text>请放入2个宠物胶囊，才可以进行合成！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if GoodsID1 ~= 76 or GoodsID2 ~= 76 then
				API_ResponseWrite('<br><text>请放入2个宠物胶囊，才可以进行合成！！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if API_GetUIDGoodsPropNum(Uid2,4) > 0 then
				API_ResponseWrite('<br><text>废弃胶囊已绑定，不能合成！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if BoxID1 < 0 or BoxID2 < 0 then
				API_ResponseWrite('<br><text>合成失败，请重新合成！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			local Pet1SM = API_GetUIDPetCapsulePropNum(Uid1,3)
			local AddSM = 5 * 128
			if Pet1SM > 128 * 99 then
				API_ResponseWrite('<br><text>宠物寿命值已达到最大值，无法再增加！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if AddSM < 12800 and AddSM > 12160 then
				AddSM = 12800 - 12160
			end
			if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID2,1,BoxID2,LocID2, '宠物胶囊合成') then
				local NewSM = Pet1SM + AddSM
				if NewSM > 12800 then NewSM = 12800 end
				API_SetUIDPetCapsulePropNum(ActorID,Uid1,3, NewSM)
				if AddSM < 5 * 128 then
					API_ResponseWrite('<br><text>合成完成，宠物寿命已达到最大值。</text><br>') 
				else
					API_ResponseWrite('<br><text>合成完成，宠物寿命增加 5点。</text><br>') 
				end
				API_ResponseWrite('<br><br><a>确定</a>')
			end
		else
			API_ResponseWrite('<text>宠物胶囊合成说明：</text><br>') 
			API_ResponseWrite('<br><text>    左框放入需要提高寿命的宠物胶囊，右框放入废弃的宠物胶囊，合成功能将会把废弃的胶囊转换为宠物寿命，附加到左框的胶囊上（请注意胶囊摆放位置，已绑定胶囊无法用于合成）</text><br>') 
			API_ResponseWrite('<br><text color="255,0,255">   主胶囊</text><text color="255,0,255">    废弃胶囊</text><br>')
			API_ResponseWrite('<br><text>   </text><goodsHolder name="100"><text>    </text><goodsHolder name="200"><br>')
			API_ResponseWrite('<br><a href="WYL_PetCapsulesSynthesis?1=1&2=1">  合成胶囊</a><br>')
			API_ResponseWrite('<br><a href="WYL_PetCapsulesSynthesis">  返回</a><br>')
		end
	else
		API_ResponseWrite('<name></name>') 
		--API_ResponseWrite('<win rect="120, 190, 350, 320" alpha="240" balpha="230"></win>') 
		API_ResponseWrite('<br><a href="WYL_PetCapsulesSynthesis?1=1">  宠物胶囊合成</a><br>')
		API_ResponseWrite('<br><a>  关闭</a>')
	end
end
