----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\JieHun.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2008-10-29
--版  本:	1.0
--描  述:	结婚系统
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：万钰林
--日期：2008-10-29
--功能：创建
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改人：黄蕾
--日  期：20120814
--功  能：七夕租用教堂免费
----------------------------------------------------------------------------------------------------------------------
-- 19001 存储男方是否求婚，值为求婚对象ID
-- 19002 判断婚姻进程，1=已求婚，2=已预约结婚场地，3=已结婚，4=正在结婚中，5=已举办婚礼，未登记
-- 19003 离婚状态，1=强制离婚，2=协议离婚
-- 19004 存储玩家租用教堂的年月日
-- 19005 存储玩家租用教堂的时分秒,一般分和秒都是0
-- 19006 申请离婚年月日
-- 19007 申请离婚时分秒
-- 19008 丘比特的庇护 状态等级ID
-- 19009 丘比特的愤怒 状态等级ID
-- 19010 丘比特的锁链 状态等级ID
-- 19011 丘比特的圣疗 状态等级ID
-- 19012 求婚用临时交互数据
-- 19013 存储租教堂的服务器ID
--七夕活动特殊处理
local HLjhTStartTime = {Year = 2012,Month = 8,Day =23,Hour = 0,Minute = 0,Second = 0} ;--开始时间
local HLjhTEndTime   = {Year = 2012,Month = 8,Day = 23,Hour = 23,Minute = 59,Second =59}  ;--停止时间
	
--结婚系统TaskID
local MarriageSystemTaskID = 1451
--结婚所需好感度
local MarriageHaoGanDu = 1500

Marriage_NewMapTable = {}

function Marriage_goto(ActorID)
	--传送玩家去某个地方，根据阵营
	local Camp = API_GetActorCamp(ActorID)
	if Camp == 0 then
		API_ActorGoToMap(ActorID,1,239,310)
		API_ActorSendMsg(ActorID,2,'教堂租用时间已到，您被请出了教堂。')
	elseif Camp == 1 then
		API_ActorGoToMap(ActorID,2,316,228)
		API_ActorSendMsg(ActorID,2,'教堂租用时间已到，您被请出了教堂。')
	end
end

XiTangBoxTable = {
[1] = {
	[1] = {GoodsID=40091},
	[2] = {GoodsID=40101},
	[3] = {GoodsID=40001},
	[4] = {GoodsID=40011},
	[5] = {GoodsID=40021},
	[6] = {GoodsID=40031},
	[7] = {GoodsID=40041},
	[8] = {GoodsID=40051},
	[9] = {GoodsID=40061},
	[10] = {GoodsID=40071},
	[11] = {GoodsID=40081},
	[12] = {GoodsID=40111},
	[13] = {GoodsID=40121},
	[14] = {GoodsID=40131},
	},
[2] = {
	[1] = {GoodsID=80064},
	[2] = {GoodsID=80083},
	[3] = {GoodsID=80093},
	[4] = {GoodsID=80103},
	[5] = {GoodsID=80113},
	[6] = {GoodsID=80123},
	[7] = {GoodsID=80048},
	[8] = {GoodsID=80133},
	},
}

function Marriage_XiTangBox_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local PlayMoney = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD)
	local PackageSize = API_ActorGetPackageSize(ActorID)
	local YaoJiang = math.random(100)
	local Money = math.random(1000)
	local MaxMoney = 50000000
	local JiangLiNum1 = math.random(table.getn(XiTangBoxTable[1]))
	local JiangLiNum2 = math.random(table.getn(XiTangBoxTable[2]))
	local JiangLiGoodsID1 = XiTangBoxTable[1][JiangLiNum1].GoodsID
	local JiangLiGoodsID2 = XiTangBoxTable[2][JiangLiNum2].GoodsID
	local GoodsName1 = API_GetGoodsName(JiangLiGoodsID1)
	local GoodsName2 = API_GetGoodsName(JiangLiGoodsID2)
	if PackageSize >= 1 then
		if PlayMoney <= MaxMoney - Money then
			if YaoJiang < 3 then
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除喜糖盒子') then
					API_AddActorGoods(ActorID,JiangLiGoodsID1,1,'打开喜糖盒子奖励')
					API_ActorSendMsg(ActorID,2,'使用喜糖盒子获得'..GoodsName1..' X 1')
					return 1
				end
			elseif YaoJiang > 2 and YaoJiang < 6 then
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除喜糖盒子') then
					API_AddActorGoods(ActorID,JiangLiGoodsID2,1,'打开喜糖盒子奖励')
					API_ActorSendMsg(ActorID,2,'使用喜糖盒子获得'..GoodsName2..' X 1')
					return 1
				end
			elseif YaoJiang > 5 then
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除喜糖盒子') then
					API_ActorAddMoneyUnStat(ActorID,Money,MarriageSystemTaskID,'使用喜糖盒子增加'..PublicFun_ArabianNumberToChineseNumber(Money)..'金币')
					API_ActorSendMsg(ActorID,2,'使用喜糖盒子获得金币 X '..Money..'')
					return 1
				end
			end
		else
			API_ActorSendMsg(ActorID,2,'您身上的金币太多了，不能使用喜糖盒子')
			return 0
		end
	else
		API_ActorSendMsg(ActorID,2,'背包已满，无法使用喜糖盒子。')
		return 0
	end
end

function Marriage_HongBao_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local PlayMoney = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD)
	local Money = 0
	local Money2 = 0
	local MaxMoney = 50000000
	if GoodsID == 929 then
		Money = 10000
		Money2 = 1000
	elseif GoodsID == 930 then
		Money = 5000
		Money2 = 500
	elseif GoodsID == 931 then
		Money = 2000
		Money2 = 200
	elseif GoodsID == 932 then
		Money = 500
		Money2 = 50
	end
	local GoodsName = API_GetGoodsName(GoodsID)
	if PlayMoney <= MaxMoney - Money then
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除红包') then
			API_ActorAddMoneyUnStat(ActorID,Money,MarriageSystemTaskID,'使用红包增加'..PublicFun_ArabianNumberToChineseNumber(Money)..'金币')
			API_ActorSendMsg(ActorID,2,'使用'..GoodsName..'获得金币 X '..Money..'')
			API_OSSLogMoneyChg(ActorID,-Money2,MarriageSystemTaskID,'打开红包消耗'..Money2..'金币')
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			if GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = Money2
			else
				GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] + Money2
			end
			return 1
		end
	else
		API_ActorSendMsg(ActorID,2,'您身上的金币太多了，不能使用'..GoodsName..'')
		return 0
	end
end

function Marriage_fireworks_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local SkillID = 0
	--如果道具ID是XX，状态ID是XX，未写，需加上
	if GoodsID == 819 then
		SkillID = 408
	elseif GoodsID == 820 then
		SkillID = 409
	elseif GoodsID == 821 then
		SkillID = 410
	elseif GoodsID == 822 then
		SkillID = 411
	elseif GoodsID == 823 then
		SkillID = 412
	elseif GoodsID == 824 then
		SkillID = 413
	elseif GoodsID == 825 then
		SkillID = 414
	end
	if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除烟花') then
		--API_ActorAddStatus(ActorID,StatusID,1)
		API_ActorUseSkill(ActorID,SkillID,1,0,0,1,0)
		return 1
	end
end

--使用圣疗技能的道具
function  Marriage_ShengLiao_GoodsCallFunc(ActorID,GoodsID,Target_Type,Target_Value,Target_MapID,Target_x,Target_y)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	--要判断圣疗交互数据是否是1，是的话才给用
	local PlayGoodsNum = API_ActorGetGoodsNum(ActorID,GoodsID)
	local JNLV = API_VarDataGetNumber(ActorID,1,19011)
	local GoodsNum
	if JNLV == 0 then
		API_ActorSendMsg(ActorID,3,'您还未学会此技能')
		return 0
	elseif JNLV >0 and JNLV <=2 then
		GoodsNum = 1
	elseif JNLV >2 and JNLV <=4 then
		GoodsNum = 1
	elseif JNLV >4 and JNLV <=6 then
		GoodsNum = 1
	elseif JNLV >6 and JNLV <=8 then
		GoodsNum = 1
	elseif JNLV >8 then
		GoodsNum = 1
	end
	if PlayGoodsNum >= GoodsNum then
		if Target_Type == 1 then
			if API_GetRelation(ActorID,0,8) == Target_Value then
				if API_ActorRemoveGoods(ActorID,GoodsID,GoodsNum,'删除圣疗道具') then
					API_ActorUseSkill(ActorID,407,JNLV,0,0,1,Target_Value)
					return 1
				end
			else
				API_ActorUseOrEquipGoods(ActorID,GoodsID)
				API_ActorSendMsg(ActorID,3,'请点击您的伴侣使用')
				return 0
			end
		else
			API_ActorUseOrEquipGoods(ActorID,GoodsID)
			API_ActorSendMsg(ActorID,2,'此道具只能对您的伴侣使用')
			return 0
		end
	else
		API_ActorSendMsg(ActorID,3,'施放技能需要'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..',您背包内技能材料不足,无法施放技能')
		return 0
	end
end

function Marriage_Skill_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local JNLV
	local GoodsNum
	local SkillID
	local PlayGoodsNum = API_ActorGetGoodsNum(ActorID,GoodsID)
	local JN1 = API_VarDataGetNumber(ActorID,1,19008)
	local JN2 = API_VarDataGetNumber(ActorID,1,19009)
	local JN3 = API_VarDataGetNumber(ActorID,1,19010)
	local JN1Table = Marriage_FuQiJiNengTable[1]
	local JN2Table = Marriage_FuQiJiNengTable[2]
	local JN3Table = Marriage_FuQiJiNengTable[3]
	if GoodsID == 830 then
		JNLV = JN1
		SkillID = 416
	elseif GoodsID == 831 then
		JNLV = JN2
		SkillID = 417
	elseif GoodsID == 832 then
		JNLV = JN3
		SkillID = 418
	end
	if JNLV == 0 then
		API_ActorSendMsg(ActorID,3,'您还未学会此技能')
		return 0
	elseif JNLV >0 and JNLV <=2 then
		GoodsNum = 1
	elseif JNLV >2 and JNLV <=4 then
		GoodsNum = 1
	elseif JNLV >4 and JNLV <=6 then
		GoodsNum = 1
	elseif JNLV >6 and JNLV <=8 then
		GoodsNum = 1
	elseif JNLV >8 then
		GoodsNum = 1
	end
	if API_GetRelation(ActorID,0,8) ~= -1 then
		if PlayGoodsNum >= GoodsNum then
			if API_ActorRemoveGoods(ActorID,GoodsID,GoodsNum,'删除结婚技能道具') then
				API_ActorUseSkill(ActorID,SkillID,JNLV,0,0,1,0)
				return 1
			end
		else
			API_ActorSendMsg(ActorID,3,'施放技能需要'..GoodsNum..'个'..API_GetGoodsName(GoodsID)..',您背包内技能材料不足,无法施放技能')
			return 0
		end
	else
		API_ActorSendMsg(ActorID,2,'您还没有结婚，无法施放技能')
		return 0
	end
end

function Marriage_OnAddEquip(ActorID,GoodsID,GoodsSubClass,GoodsKind,GoodsLevel)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local Camp = API_GetActorCamp(ActorID)
	if GoodsID == 10923 or GoodsID == 10924 or GoodsID == 10925 or GoodsID == 10926 then
		if API_GetRelation(ActorID,0,8) ~= -1 then
			return 1
		else
			API_ActorSendMsg(ActorID,2,'您还没有结婚，无法装备结婚戒指')
			return 0
		end
	elseif GoodsID == 10928 or GoodsID == 10929 or GoodsID == 10930 or GoodsID == 10931 or GoodsID == 10932 or GoodsID == 10933 or GoodsID == 10934 or GoodsID == 10935 or GoodsID == 10936 or GoodsID == 10937 or GoodsID == 10938 or GoodsID == 10939 then
		return 1
	end
end

function Marriage_Rose_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local PlayLV = API_GetActorExpLevel(ActorID)
	local HanShuMing = ''
	if GoodsID == 826 then 
		HanShuMing = 'Marriage_QiuHun_MG'
	--elseif GoodsID == 715 then 
		--HanShuMing = 'Marriage_QiuHun_BH'
	end
	local HunYinZhuangTai = API_VarDataGetNumber(ActorID,1,19002)
	if HanShuMing ~= '' then
		if API_GetActorSex(ActorID) == 1 then --性别判断
			if API_GetRelation(ActorID,0,8) == -1 then
				if HunYinZhuangTai == 0 then					
					if PlayLV >= 20 then
						API_ActorStartSelect(ActorID,HanShuMing,15)
						API_ActorSendMsg(ActorID,3,'请点击您要求婚的对象')
						return 1
					else
						API_ActorSendMsg(ActorID,2,'等级未达到20级，请提升等级后再使用该道具。')
						return 0
					end
				else
					API_ActorSendMsg(ActorID,2,'您已经有爱人了，不能使用该道具。')
					return 0
				end
			else
				API_ActorSendMsg(ActorID,2,'您已经结婚了，不能使用该道具。')
				return 0
			end
		else 
			API_ActorSendMsg(ActorID,2,'该物品只有男性才可以使用哦')
			return 0
		end
	else
		return 0
	end
end

function Marriage_QiuHun_MG()
	local ActorID = API_RequestGetNumber(1)
	local SelectType = API_RequestGetNumber(2)
	local OtherID = API_RequestGetNumber(3)
	local GoodsID = 826 -- 物品正确ID未设置
	local ActorName = API_GetActorName(ActorID)
	local OtherName = API_RequestGetNumber(OtherID)
	--local HaoGanDdu = 2000 --好感度需要设置
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local PlayLV = API_GetActorExpLevel(ActorID)
	local PlayCamp = API_GetActorCamp(ActorID)
	local OtherCamp = API_GetActorCamp(OtherID)
	local OtherQiuHun = API_VarDataGetNumber(OtherID,1,19001)
	local OtherQiuHun2 = API_VarDataGetNumber(OtherID,0,19012)
	if SelectType == 0 then
		API_ActorSendMsg(ActorID,2,'请选择您心仪的对象')
		API_ActorStartSelect(ActorID,'Marriage_QiuHun_MG',15)
	elseif SelectType == 1 then
		API_ActorSendMsg(ActorID,2,'请选择您心仪的对象')
		API_ActorStartSelect(ActorID,'Marriage_QiuHun_MG',15)
	elseif SelectType == 2 then
		if OtherID ~= ActorID then
			if PlayCamp == OtherCamp then
				if API_GetRelation(ActorID,0,8) == -1 then
					if API_GetActorSex(OtherID) == 2 then --性别判断
						local OtherLV = API_GetActorExpLevel(OtherID)
						if OtherLV >= 20 then
							if  API_GetRelation(ActorID,OtherID,2) >= MarriageHaoGanDu and API_GetRelation(OtherID,ActorID,2) >= MarriageHaoGanDu then
								if API_GetRelation(OtherID,0,8) == -1 then
									if OtherQiuHun == 0 then
										if OtherQiuHun2 == 0 then
												local OtherName = API_GetActorName(OtherID)
												API_ResponseWrite('<name></name>')
												API_ResponseWrite('<win balpha="0" rect="300,400,400,180"></win>')
												API_ResponseWrite('<text>请输入您想向</text><text color="255,0,255">'..OtherName..'</text><text>求婚的话：（最大可输入一百字）</text><br>')
												API_ResponseWrite('<input type="string" name="3" bFilter="1" size="200" width="350"><br>')
												API_ResponseWrite('<br><a href="Marriage_QiuHun_JieShou?1='..OtherID..'&2='..GoodsID..'">确定求婚</a><br>')
												API_ResponseWrite('<br><a>还是算了</a><br>')
											
										else
											API_ActorSendMsg(ActorID,2,'您心仪的对象正在被其他帅哥求婚，不能重复求婚')
										end
									else
										API_ActorSendMsg(ActorID,2,'您心仪的对象已经心有所属了，莫非您想横刀夺爱？')
									end
								else
									API_ActorSendMsg(ActorID,2,'您心仪的对象已经结婚了，不可以向她求婚。')
								end
							else
								API_ActorSendMsg(ActorID,2,'双方互相好感度达到'..MarriageHaoGanDu..'或以上才可以求婚。')
							end
						else
							API_ActorSendMsg(ActorID,2,'您心仪的对象等级还未达到20级，不能接受您的求婚。')
						end
					else
						API_ActorSendMsg(ActorID,2,'不能向同性进行求婚')
						API_ActorStartSelect(ActorID,'Marriage_QiuHun_MG',15)
					end	
				else
					API_ActorSendMsg(ActorID,2,'您已经结婚了，不能使用该道具。')
				end
			else
				API_ActorSendMsg(ActorID,2,'不同阵营的玩家是不可以结婚的哦。')
			end
		else
			API_ActorSendMsg(ActorID,2,'不能对自己使用')
		end
	else 
		API_ActorStartSelect(ActorID,'Marriage_QiuHun_MG',15)
	end
end

StatusList = {
[826] = 485001, --状态ID未设置，可添加N个ID
}

function Marriage_QiuHun_JieShou()
	local ActorID = API_RequestGetActorID()
	local OtherID = API_RequestGetNumber(1)
	local GoodsID = API_RequestGetNumber(2)
	local BiaoBai = API_RequestGetString(3)
	local StatusID = StatusList[GoodsID]
	if StatusID == nil then
		return
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return
	end
	local PlayLV = API_GetActorExpLevel(ActorID)
	local OtherLV = API_GetActorExpLevel(OtherID)
	if API_ActorIsOnline(OtherID) then
		if API_GetRelation(ActorID,0,8) == -1 then
			if PlayLV >= 20 then
				if OtherLV >= 20 then
					if API_ActorGetGoodsNum(ActorID,GoodsID) >= 1 then
						if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除求婚物品') then
							local ActorName = API_GetActorName(ActorID)
							local OtherName = API_GetActorName(OtherID)
							API_VarDataSetNumber(OtherID,0,19012,1)
							API_ActorAddStatus(OtherID,StatusID,30000) --状态ID未设置
							API_ActorBroadcastMsgEx(-1,-1,0,7,'“'..ActorName..'”向“'..OtherName..'”求婚啦：'..BiaoBai..'')
							API_ActorBroadcastMsg(-1,17,'“'..ActorName..'”向“'..OtherName..'”求婚啦：'..BiaoBai..'')
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<win ntype="5" close="0" balpha="0" rect="300,380,400,160"></win>')
							API_ResponseWrite('<text color="255,0,255">'..ActorName..'</text><text>向您求婚：'..BiaoBai..'，您愿意接受吗？</text><br>')
							API_ResponseWrite('<br><text>            </text>')
							API_ResponseWrite('<a href="Marriage_QiuHun_QueDing?1=1&2='..ActorID..'&3='..GoodsID..'">接受求婚</a>')
							API_ResponseWrite('<text>                </text>')
							API_ResponseWrite('<a href="Marriage_QiuHun_QueDing?1=2&2='..ActorID..'&3='..GoodsID..'">我不愿意</a>')
							API_ResponseFlush(OtherID)
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[2][38][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[2][38][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[2][38][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][38][LaiYuan] + 1
							end
						end
					else
						API_ActorSendMsg(ActorID,3,'您的背包内没有该道具，无法求婚。')
					end
				else
					API_ActorSendMsg(ActorID,2,'您的对象等级还未达到20级，不能接受您的求婚。')
				end
			else 
				API_ActorSendMsg(ActorID,2,'等级未达到20级，请提升等级后再使用该道具。')
			end
		else
			API_ActorSendMsg(ActorID,2,'您已经结婚了，不能使用该道具。')
		end
	else
		API_ResponseWrite('<br><text>您选择的对象不在线，无法进行求婚。</text><br>')
		API_ResponseWrite('<br><a>取消</a><br>')
	end
end

function Marriage_QiuHun_QueDing()
	local OtherID = API_RequestGetActorID()
	local ActorID = API_RequestGetNumber(2)
	local XuanZe = API_RequestGetNumber(1)
	local OtherLV = API_GetActorExpLevel(ActorID)
	local PlayLV = API_GetActorExpLevel(OtherID)
	local OtherName = API_GetActorName(OtherID)
	local ActorName = API_GetActorName(ActorID)
	local ActorZT = API_VarDataGetNumber(ActorID,1,19002)
	if XuanZe == 1 then
		if API_ActorIsOnline(ActorID) then
			if ActorZT == 0 then
				if API_GetRelation(OtherID,0,8) == -1 and API_GetRelation(ActorID,0,8) == -1 and PlayLV >= 20 and OtherLV >= 20 and API_GetActorSex(OtherID) == 2 and API_GetActorSex(ActorID) == 1 then
					API_VarDataSetNumber(ActorID,1,19002,1)
					API_VarDataSetNumber(OtherID,1,19002,1)
					API_VarDataSetNumber(ActorID,1,19001,OtherID)
					API_VarDataSetNumber(OtherID,1,19001,ActorID)
					API_VarDataSetNumber(OtherID,0,19012,0)
					if API_IsTeammate(ActorID,OtherID) then
						HaoYouZhuDuiXiTong_UpdateRelation(ActorID,OtherID)
						HaoYouZhuDuiXiTong_UpdateRelation(OtherID,ActorID)
					end
					API_ActorBroadcastMsgEx(-1,-1,0,7,'恭喜“'..ActorName..'”向“'..OtherName..'”求婚成功。')
					API_ActorBroadcastMsg(-1,17,'恭喜“'..ActorName..'”向“'..OtherName..'”求婚成功。')
					API_ActorSendMsg(ActorID,1,'恭喜您向'..OtherName..'求婚成功')
					API_ActorSendMsg(OtherID,1,'恭喜您接受了'..ActorName..'的求婚')
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<win ntype="5" close="0" balpha="0" rect="300,380,400,160"></win>')
					API_ResponseWrite('<br><text>恭喜你们，现在你们可以找教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”</text><text color="255,0,255">预约结婚教堂</text><text>了，成功预约结婚教堂后，即可在预约的时间找婚礼司仪</text><text color="255,0,255">开启结婚场地</text><text>。只有举行完婚礼才能成为正式的夫妻。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(OtherID)
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<win ntype="5" close="0" balpha="0" rect="300,380,400,160"></win>')
					API_ResponseWrite('<br><text>恭喜你们，现在你们可以找教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”</text><text color="255,0,255">预约结婚教堂</text><text>了，成功预约结婚教堂后，即可在预约的时间找婚礼司仪</text><text color="255,0,255">开启结婚场地</text><text>。只有举行完婚礼才能成为正式的夫妻。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[2][39][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[2][39][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[2][39][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][39][LaiYuan] + 1
					end
				end
			else
				API_ActorSendMsg(OtherID,2,''..ActorName..'已经有爱人了，您无法接受他的求婚')
			end
		else
			API_ActorSendMsg(OtherID,2,'对您求婚的男人不负责任的离开了...')
		end
	elseif XuanZe == 2 then
		API_VarDataSetNumber(OtherID,0,19012,0)
		API_ActorBroadcastMsgEx(-1,-1,0,7,'很遗憾，“'..OtherName..'”拒绝了“'..ActorName..'”的求婚。')
		API_ActorBroadcastMsg(-1,17,'很遗憾，“'..OtherName..'”拒绝了“'..ActorName..'”的求婚。')
		API_ActorSendMsg(ActorID,1,'非常遗憾，'..OtherName..'拒绝了您的求婚')
	end
end

function Marriage_ZhuShou_PanDuan_Title()
	local ActorID = API_RequestGetActorID()
	local Sex = API_GetActorSex(ActorID)
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local Camp = API_GetActorCamp(ActorID)
	local HunYinZhuangTai = API_VarDataGetNumber(ActorID,1,19002)
	local WoManZhuangTai = API_VarDataGetNumber(OtherID,1,19002)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ZhuRenYMD = API_VarDataGetNumber(ActorID,1,19004)
	local ZhuRenHMS = API_VarDataGetNumber(ActorID,1,19005)
	local ZhuRenYear = math.floor(ZhuRenYMD/10000) --取年月日的商数
	local ZhuRenMonthDay = math.mod(ZhuRenYMD,10000) --取年月日的余数
	local ZhuRenMonth = math.floor(ZhuRenMonthDay/100) --取年月日余数的商数
	local ZhuRenDay = math.mod(ZhuRenMonthDay,100) --取年月日余数的商数的余数
	local PlayServer = API_VarDataGetNumber(ActorID,1,19013)
	local ServerID = API_GetServerID()
	local NPCID = API_VarDataGetNumber(ActorID,0,32711)
	API_ResponseWrite('<name>婚礼司仪</name>')
	if HunYinZhuangTai == 0 then
		if Sex == 1 then
			API_ResponseWrite('<br><text>您现在还没有心爱的女人吗？如果有的话赶快使用</text><img srcgd="826" tipgd="826"><text>向她求婚吧。</text><a href="Marriage_HunLiWuPin?1=1&4='..NPCID..'">  点此购买</a><img srcgd="826" tipgd="826"><br>')
		elseif Sex == 2 then
			API_ResponseWrite('<br><text>您现在还没有心爱的男人吗？如果有的话赶快让他使用</text><img srcgd="826" tipgd="826"><text>向您求婚吧。</text><a href="Marriage_HunLiWuPin?1=1&4='..NPCID..'">  点此购买</a><img srcgd="826" tipgd="826"><br>')
		end
		API_ResponseWrite('<br><a href="Marriage_ZuYongLiTangShuoMing?1=2">查看结婚条件</a><br>')
		API_ResponseWrite('<br><a tip="参加正在举行的婚礼" href="Marriage_HunLiLieBiao">进入婚礼场地</a><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
	elseif HunYinZhuangTai == 1 then
		API_ResponseWrite('<br><text>看来您已经找到您心爱的人了呢，如果想要使用教堂举行婚礼的话，需要先在我这里申请</text><text color="255,0,255">预约教堂</text><text>。</text><br>')
		API_ResponseWrite('<br><a href="Marriage_LiTangLieBiao">1、预约结婚教堂</a>')
		API_ResponseWrite('<text>         </text><a href="Marriage_ZuYongLiTangShuoMing?1=3">查看教堂预约说明</a><br>')
		API_ResponseWrite('<br><a tip="参加正在举行的婚礼" href="Marriage_HunLiLieBiao">2、进入婚礼场地</a><br>')
		API_ResponseWrite('<br><a href="Marriage_Parson_XuanZe?1=1&4='..NPCID..'">3、购买婚庆商品</a><br>')
		API_ResponseWrite('<br><a tip="如果你想重新再找一个爱人的话……" href="Marriage_LoveOver">4、我想另寻新欢……</a><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
	elseif HunYinZhuangTai == 2 then
		if API_DiffDatatime(ZhuRenYear,ZhuRenMonth,ZhuRenDay,ZhuRenHMS,0,0) > 0 then
			API_ResponseWrite('<br><text>您已经预约了'..ZhuRenYear..'年'..ZhuRenMonth..'月'..ZhuRenDay..'日'..ZhuRenHMS..'点的教堂，但还没有到您使用教堂的时间，请耐心等待。现在您可以在我这里</text><text color="255,0,255">免费领取喜帖</text><text>。</text><br>')
			API_ResponseWrite('<br><a tip="喜帖是进入婚礼场地的唯一凭证" href="Marriage_ZhuShou_QingTie">1、领取喜帖</a><br>')
			API_ResponseWrite('<br><a tip="参加正在举行的婚礼" href="Marriage_HunLiLieBiao">2、进入婚礼场地</a>')
			API_ResponseWrite('<text>         </text><a href="Marriage_ZuYongLiTangShuoMing?1=3">查看教堂预约说明</a><br>')
			API_ResponseWrite('<br><a href="Marriage_Parson_XuanZe?1=3&4='..NPCID..'">3、购买婚庆商品</a><br>')
			API_ResponseWrite('<br><a tip="你们的爱情真的无法挽回吗？" href="Marriage_LoveOver">4、我想另寻新欢……</a><br>')
			API_ResponseWrite('<br><a>5、离开</a>')
		elseif API_DiffDatatime(ZhuRenYear,ZhuRenMonth,ZhuRenDay,ZhuRenHMS,0,0) < -86400 then
			API_ResponseWrite('<br><text>您预约的'..ZhuRenYear..'年'..ZhuRenMonth..'月'..ZhuRenDay..'日'..ZhuRenHMS..'点的教堂已经过期，如果您还需要使用教堂，请您重新预约。</text><br>')
			API_ResponseWrite('<br><a href="Marriage_LiTangLieBiao">1、预约结婚教堂</a>')
			API_ResponseWrite('<text>         </text><a href="Marriage_ZuYongLiTangShuoMing?1=3">查看教堂预约说明</a><br>')
			API_ResponseWrite('<br><a tip="参加正在举行的婚礼" href="Marriage_HunLiLieBiao">2、进入婚礼场地</a><br>')
			API_ResponseWrite('<br><a href="Marriage_Parson_XuanZe?1=1&4='..NPCID..'">3、购买婚庆商品</a><br>')
			API_ResponseWrite('<br><a tip="如果你想重新再找一个爱人的话……" href="Marriage_LoveOver">4、我想另寻新欢……</a><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		else
			if PlayServer == ServerID then
				API_ResponseWrite('<br><text>现在到了您预约教堂的时间，您可以在我这里开启和进入您的婚礼场地，也可以购买一些婚礼上使用的道具。</text><br>')
				local PanDuan = 0
				for j in Marriage_NewMapTable do
					if ActorID == Marriage_NewMapTable[j].ZhuRenID or ActorID == Marriage_NewMapTable[j].BanLvID then
						PanDuan = 1
					end
				end
				if PanDuan == 1 then
					API_ResponseWrite('<br><a tip="参加正在举行的婚礼" href="Marriage_HunLiLieBiao">1、进入婚礼场地</a><br>')
				else
					API_ResponseWrite('<br><a href="OpenNewMap">1、开启婚礼场地</a><br>')
				end
			else
				API_ResponseWrite('<br><text>您是在</text><text color="255,0,255">'..GLOBAL_Navigate_ServerID[PlayServer].name..'</text><text>预约的教堂，如果需要开启婚礼场地结婚，请您前往</text><text color="255,0,255">'..GLOBAL_Navigate_ServerID[PlayServer].name..'</text><text>开启。</text><br>')
				API_ResponseWrite('<br><a tip="参加正在举行的婚礼" href="Marriage_HunLiLieBiao">1、进入婚礼场地</a><br>')
			end
			API_ResponseWrite('<br><a href="Marriage_Parson_XuanZe?1=3&4='..NPCID..'">2、购买婚庆商品</a><br>')
			API_ResponseWrite('<br><a tip="都走到这一步了，你真的这么想？" href="Marriage_LoveOver">3、取消婚约</a><br>')
			API_ResponseWrite('<br><a>离开</a>')
		end
	elseif HunYinZhuangTai == 3 then
		API_ResponseWrite('<win rect="80,390,830,275"></win>')
		API_ResponseWrite('<br><text>我衷心的祝福你们，愿你们的爱情能够海枯石烂、至死不逾……</text><br>')
		API_ResponseWrite('<br><a tip="参加正在举行的婚礼" href="Marriage_HunLiLieBiao">1、进入婚礼场地</a><br>')
		API_ResponseWrite('<br><a href="Marriage_Parson_XuanZe?1=1&4='..NPCID..'">2、购买婚庆商品</a><br>')
		API_ResponseWrite('<br><a href="Marriage_HunLiWuPin?1=3&4='..NPCID..'">3、购买夫妻技能道具</a><br>')
		API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng">4、学习夫妻技能</a><br>')
		API_ResponseWrite('<br><a href="Marriage_JieZhiDuiHuan">5、兑换结婚戒指</a><br>')
		API_ResponseWrite('<br><a href="Marriage_LiHun">6、申请离婚</a><br>') 
		API_ResponseWrite('<br><a>离开</a>')
	elseif HunYinZhuangTai == 4 then
		if PlayServer == ServerID then
			API_ResponseWrite('<br><text>好像婚礼出了点意外……您想做什么呢？</text><br>')
			local PanDuan = 0
			for j in Marriage_NewMapTable do
				if ActorID == Marriage_NewMapTable[j].ZhuRenID or ActorID == Marriage_NewMapTable[j].BanLvID then
					PanDuan = 1
				end
			end
			if PanDuan == 1 then
				API_ResponseWrite('<br><a tip="参加正在举行的婚礼" href="Marriage_HunLiLieBiao">1、进入婚礼场地</a><br>')
			else
				API_ResponseWrite('<br><a href="OpenNewMap">1、开启婚礼场地</a><br>')
			end
		else
			API_ResponseWrite('<br><text>您是在</text><text color="255,0,255">'..GLOBAL_Navigate_ServerID[PlayServer].name..'</text><text>预约的教堂，请您前往</text><text color="255,0,255">'..GLOBAL_Navigate_ServerID[PlayServer].name..'</text><text>查看。</text><br>')
			API_ResponseWrite('<br><a tip="参加正在举行的婚礼" href="Marriage_HunLiLieBiao">1、进入婚礼场地</a><br>')
		end
		API_ResponseWrite('<br><a href="Marriage_DengJi">2、办理婚姻登记</a><br>') 
		API_ResponseWrite('<br><a href="Marriage_Parson_XuanZe?1=1&4='..NPCID..'">3、购买婚庆商品</a><br>') 
		API_ResponseWrite('<br><a tip="好不容易相伴到今天，好好想想吧" href="Marriage_LoveOver">4、我不结婚了，我要再找一个</a><br>')
		API_ResponseWrite('<br><a>离开</a>')
	elseif HunYinZhuangTai == 5 then
		API_ResponseWrite('<br><text>您现在可以在我这里办理婚姻登记，和您的爱人成为正式夫妻。</text><br>')
		API_ResponseWrite('<br><a tip="喜帖是进入婚礼场地的唯一凭证" href="Marriage_ZhuShou_QingTie">1、领取喜帖</a><br>')
		API_ResponseWrite('<br><a tip="参加正在举行的婚礼" href="Marriage_HunLiLieBiao">2、进入婚礼场地</a><br>')
		API_ResponseWrite('<br><a href="Marriage_DengJi">3、办理婚姻登记</a><br>')
		API_ResponseWrite('<br><a href="Marriage_Parson_XuanZe?1=1&4='..NPCID..'">4、购买婚庆商品</a><br>') 
		API_ResponseWrite('<br><a tip="一路走来风风雨雨，三思啊……" href="Marriage_LoveOver">5、我想另寻新欢……</a><br>')
		API_ResponseWrite('<br><a>离开</a>')
	end
	API_ResponseFlush(ActorID) 
end

function Marriage_Parson_PanDuan_Title()
	local ActorID = API_RequestGetActorID()
	local Sex = API_GetActorSex(ActorID)
	local ServerID = API_GetServerID()
	local PlayServer = API_VarDataGetNumber(ActorID,1,19013)
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local Camp = API_GetActorCamp(ActorID)
	local HunYinZhuangTai = API_VarDataGetNumber(ActorID,1,19002)
	local WoManZhuangTai = API_VarDataGetNumber(OtherID,1,19002)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ZhuRenYMD = API_VarDataGetNumber(ActorID,1,19004)
	local ZhuRenHMS = API_VarDataGetNumber(ActorID,1,19005)
	local ZhuRenYear = math.floor(ZhuRenYMD/10000) --取年月日的商数
	local ZhuRenMonthDay = math.mod(ZhuRenYMD,10000) --取年月日的余数
	local ZhuRenMonth = math.floor(ZhuRenMonthDay/100) --取年月日余数的商数
	local ZhuRenDay = math.mod(ZhuRenMonthDay,100) --取年月日余数的商数的余数
	API_ResponseWrite('<name></name>')
	if HunYinZhuangTai == 0 then
		if Sex == 1 then
			API_ResponseWrite('<br><text>您现在还没有心爱的女人吗？如果有的话赶快使用</text><img srcgd="826" tipgd="826"><text>向她求婚吧。</text><br><img srcgd="826" tipgd="826"><text>在教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”处有出售，并且</text><text color="255,0,255">异界商店</text><text>内也有出售哦，让您随时随地都可以进行求婚。</text><br>')
		elseif Sex == 2 then
			API_ResponseWrite('<br><text>您现在还没有心爱的男人吗？如果有的话赶快让他使用</text><img srcgd="826" tipgd="826"><text>向您求婚吧。</text><br><img srcgd="826" tipgd="826"><text>在教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”处有出售，并且</text><text color="255,0,255">异界商店</text><text>内也有出售哦。</text><br>')
		end
		API_ResponseWrite('<br><a href="Marriage_ZuYongLiTangShuoMing?1=1">查看结婚条件</a><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
	elseif HunYinZhuangTai == 1 then
		API_ResponseWrite('<br><text>看来您已经找到您心爱的人了呢，如果想要使用教堂举行婚礼的话，需要先向教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”申请</text><text color="255,0,255">预约教堂</text><text>哦。</text><br>')
		API_ResponseWrite('<br><a href="Marriage_ZuYongLiTangShuoMing?1=3">查看租订教堂说明</a><br>')
		API_ResponseWrite('<br><br><a>确定</a>')
	elseif HunYinZhuangTai == 2 then 
		if API_DiffDatatime(ZhuRenYear,ZhuRenMonth,ZhuRenDay,ZhuRenHMS,0,0) > 0 then
			API_ResponseWrite('<br><text>您已经预约了'..ZhuRenYear..'年'..ZhuRenMonth..'月'..ZhuRenDay..'日'..ZhuRenHMS..'点的教堂，但还没有到您使用教堂的时间，请耐心等待。</text><br><br><text>现在您可以找教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”</text><text color="255,0,255">免费领取喜帖</text><text>。</text><br>')
			API_ResponseWrite('<br><a href="Marriage_ZuYongLiTangShuoMing?1=3">查看教堂预约说明</a><br>')
			API_ResponseWrite('<br><a href="Marriage_ZuYongLiTangShuoMing?1=1">查看结婚条件</a><br>')
			API_ResponseWrite('<br><a>确定</a>')
		elseif API_DiffDatatime(ZhuRenYear,ZhuRenMonth,ZhuRenDay,ZhuRenHMS,0,0) < -86400 then
			API_ResponseWrite('<br><text>您预约的'..ZhuRenYear..'年'..ZhuRenMonth..'月'..ZhuRenDay..'日'..ZhuRenHMS..'点的教堂已经过期，如果您还需要使用教堂，请您找教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”重新预约。</text><br>')
			API_ResponseWrite('<br><a href="Marriage_ZuYongLiTangShuoMing?1=3">查看教堂预约说明</a><br>')
			API_ResponseWrite('<br><a href="Marriage_ZuYongLiTangShuoMing?1=1">查看结婚条件</a><br>')
			API_ResponseWrite('<br><a>确定</a>')
		else
			if PlayServer == ServerID then
				API_ResponseWrite('<br><text>现在到了您预约教堂的时间，您可以找教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”开启和进入您的婚礼场地。</text><br>')
				
			else
				API_ResponseWrite('<br><text>您是在</text><text color="255,0,255">'..GLOBAL_Navigate_ServerID[PlayServer].name..'</text><text>预约的教堂，如果需要开启婚礼场地结婚，请您前往</text><text color="255,0,255">'..GLOBAL_Navigate_ServerID[PlayServer].name..'</text><text>找教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”开启。</text><br>')
			end
			API_ResponseWrite('<br><a href="Marriage_ZuYongLiTangShuoMing?1=3">查看教堂预约说明</a><br>')
			API_ResponseWrite('<br><a href="Marriage_ZuYongLiTangShuoMing?1=1">查看结婚条件</a><br>')
			API_ResponseWrite('<br><a>确定</a>')
		end
	elseif HunYinZhuangTai == 3 then 
		API_ResponseWrite('<br><text>爱情就是相知、相爱、相守，我在这神圣的殿堂里为所有的有情人祈祷。</text><br>')
		API_ResponseWrite('<br><text>愿有情人能够海枯石烂、天长地久……</text><br><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
	else
		if PlayServer == ServerID then
			API_ResponseWrite('<br><text>如果要办理婚姻登记，请找教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”办理。</text><br>')
			API_ResponseWrite('<br><a>确定</a>')
		else
			API_ResponseWrite('<br><text>您是在</text><text color="255,0,255">'..GLOBAL_Navigate_ServerID[PlayServer].name..'</text><text>预约的教堂，如果需要办理婚姻登记，请找</text><text color="255,0,255">'..GLOBAL_Navigate_ServerID[PlayServer].name..'</text><text>教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”办理。</text><br>')
			API_ResponseWrite('<br><a>确定</a>')
		end
	end
	API_ResponseFlush(ActorID) 
end

function Marriage_ZhuChi_PanDuan_Title()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local Sex = API_GetActorSex(ActorID)
	local ServerID = API_GetServerID()
	local PlayServer = API_VarDataGetNumber(ActorID,1,19013)
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local Camp = API_GetActorCamp(ActorID)
	local HunYinZhuangTai = API_VarDataGetNumber(ActorID,1,19002)
	local WoManZhuangTai = API_VarDataGetNumber(OtherID,1,19002)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ZhuRenYMD = API_VarDataGetNumber(ActorID,1,19004)
	local ZhuRenHMS = API_VarDataGetNumber(ActorID,1,19005)
	local ZhuRenYear = math.floor(ZhuRenYMD/10000) --取年月日的商数
	local ZhuRenMonthDay = math.mod(ZhuRenYMD,10000) --取年月日的余数
	local ZhuRenMonth = math.floor(ZhuRenMonthDay/100) --取年月日余数的商数
	local ZhuRenDay = math.mod(ZhuRenMonthDay,100) --取年月日余数的商数的余数
	local PanDuan = 0
	local NPCID = API_VarDataGetNumber(ActorID,0,32711)
	if Marriage_NewMapTable[MapID] == nil then
		return
	end
	local ZhuRenName = Marriage_NewMapTable[MapID].ZhuRenName
	local BanLvName = Marriage_NewMapTable[MapID].BanLvName
	if ActorID == Marriage_NewMapTable[MapID].ZhuRenID or ActorID == Marriage_NewMapTable[MapID].BanLvID then
		PanDuan = 1
	end
	API_ResponseWrite('<name>婚礼主持</name>')
	API_ResponseWrite('<br><text>现在举行的是</text><text color="255,0,255"> '..ZhuRenName..' </text><text>和</text><text color="255,0,255"> '..BanLvName..' </text><text>的婚礼。</text><br>')
	if PanDuan == 0 then
		API_ResponseWrite('<br><text>让我们一起为他们祝福吧。</text><br>')
		API_ResponseWrite('<br><a href="Marriage_HunLiWuPin?1=1&4='..NPCID..'">1、购买结婚花束</a><br>')
		API_ResponseWrite('<br><a href="Marriage_HunLiWuPin?1=5&4='..NPCID..'">2、购买烟花</a><br>')
		API_ResponseWrite('<br><a>离开</a>')
	elseif PanDuan == 1 then
		if HunYinZhuangTai == 0 then
			if Sex == 1 then
				API_ResponseWrite('<br><text>您现在还没有心爱的女人吗？如果有的话赶快使用</text><img srcgd="826" tipgd="826"><text>向她求婚吧。</text><br><img srcgd="826" tipgd="826"><text>在教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”处有出售，并且</text><text color="255,0,255">异界商店</text><text>内也有出售哦，让您随时随地都可以进行求婚。</text><br>')
			elseif Sex == 2 then
				API_ResponseWrite('<br><text>您现在还没有心爱的男人吗？如果有的话赶快让他使用</text><img srcgd="826" tipgd="826"><text>向您求婚吧。</text><br><img srcgd="826" tipgd="826"><text>在教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”处有出售，并且</text><text color="255,0,255">异界商店</text><text>内也有出售哦。</text><br>')
			end
			API_ResponseWrite('<br><a>确定</a><br>')
		elseif HunYinZhuangTai == 1 then
			API_ResponseWrite('<br><text>看来您已经找到您心爱的人了呢，如果想要使用教堂举行婚礼的话，需要先向教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”申请</text><text color="255,0,255">预约教堂</text><text>哦。</text><br>')
			API_ResponseWrite('<br><a href="Marriage_ZuYongLiTangShuoMing?1=3">查看租订教堂说明</a><br>')
			API_ResponseWrite('<br><br><a>确定</a>')
		elseif HunYinZhuangTai == 2 then
			API_ResponseWrite('<br><text>婚礼即将开始，您现在可以使用“装扮教堂”功能让教堂更加的华丽眩目。</text><br>')
			API_ResponseWrite('<br><a href="Marriage_JieHun">1、举行婚礼</a><br>')
			API_ResponseWrite('<br><a href="Marriage_Parson_XuanZe?1=2&4='..NPCID..'">2、装饰教堂</a><br>')
			API_ResponseWrite('<br><a>离开</a>')
		elseif HunYinZhuangTai == 3 then
			API_ResponseWrite('<br><text>我衷心的祝福你们，愿你们的爱情能够海枯石烂、至死不逾……</text><br>')
			API_ResponseWrite('<br><a href="Marriage_Parson_XuanZe?1=2&4='..NPCID..'">1、购买婚庆商品</a><br>')
			API_ResponseWrite('<br><a>离开</a>')
		elseif HunYinZhuangTai == 4 then
			if HunYinZhuangTai == WoManZhuangTai then
				API_ResponseWrite('<br><text>婚礼正在进行中，您想做什么呢？</text><br>')
				API_ResponseWrite('<br><a href="Marriage_HunLiAgain">1、重新举行婚礼</a><br>') 
				API_ResponseWrite('<br><a href="Marriage_Parson_XuanZe?1=2&4='..NPCID..'">2、装饰教堂</a><br>')
				API_ResponseWrite('<br><a>离开</a>')
			else
				API_ResponseWrite('<br><text>好像婚礼出了点意外……您想做什么呢？</text><br>')
				API_ResponseWrite('<br><a href="Marriage_HunLiAgain">1、重新举行婚礼</a><br>') 
				API_ResponseWrite('<br><a href="Marriage_Parson_XuanZe?1=2&4='..NPCID..'">2、装饰教堂</a><br>')
				API_ResponseWrite('<br><a>离开</a>')
			end
		elseif HunYinZhuangTai == 5 then
			API_ResponseWrite('<br><text>您现在可以在我这里指定证婚人（一对新人最多指定三个），也可以办理婚姻登记，和您的爱人成为正式夫妻。</text><br>')
			API_ResponseWrite('<br><a href="Marriage_Parson_XuanZe?1=4&2='..MapID..'">1、指定证婚人</a><br>') 
			API_ResponseWrite('<br><a href="Marriage_DengJi">2、办理婚姻登记</a><br>')
			API_ResponseWrite('<br><a href="Marriage_Parson_XuanZe?1=2&4='..NPCID..'">3、装饰教堂</a><br>')
			API_ResponseWrite('<br><a>离开</a>')
		end
	end
	API_ResponseFlush(ActorID) 
end

function Marriage_Parson_XuanZe()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local MapID = API_RequestGetNumber(2)
	local NPCID = API_RequestGetNumber(4)
	local Camp = API_GetActorCamp(ActorID)
	if XuanZe == 1 then
		API_ResponseWrite('<br><text>烟花会带给你欢乐，愿祝福常伴你。</text><br>')
		API_ResponseWrite('<br><a href="Marriage_HunLiWuPin?1=1&4='..NPCID..'">1、购买求婚道具</a><br>') 
		API_ResponseWrite('<br><a href="Marriage_HunLiWuPin?1=5&4='..NPCID..'">2、购买烟花</a><br>')
		API_ResponseWrite('<br><a>3、离开</a>')
		return
	elseif XuanZe == 2 then
		API_ResponseWrite('<br><text>美丽的装饰品能将教堂变成花的海洋，爱美的你千万不要错过哦。</text><br>')
		if Camp == 0 then
			API_ResponseWrite('<br><a href="Marriage_ZhuangShiPin?1=1">1、添加教堂装饰品</a><br>')
		elseif Camp == 1 then
			API_ResponseWrite('<br><a href="Marriage_ZhuangShiPin?1=2">1、添加教堂装饰品</a><br>')
		end
	elseif XuanZe == 3 then
		API_ResponseWrite('<br><a href="Marriage_ZhuShou_QingTie">1、领取喜帖</a><br>')
	elseif XuanZe == 4 then
		local ZhengHunNum = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.HuiDiaoTime)
		if ZhengHunNum < 3 then
			API_ActorStartSelect(ActorID,'Marriage_ZhengHunRen',15)
			API_ActorSendMsg(ActorID,3,'请点击玩家指定证婚人，一对新人最多可指定三个')
		else
			API_ResponseWrite('<br><text>本次婚礼已经指定了三个证婚人，不可以再指定证婚人了。</text><br>')
			API_ResponseWrite('<br><a>离开</a>')
		end
		return
	end
	API_ResponseWrite('<br><a href="Marriage_HunLiWuPin?1=1&4='..NPCID..'">2、购买结婚花束</a><br>')
	API_ResponseWrite('<br><a href="Marriage_HunLiWuPin?1=4&4='..NPCID..'">3、购买红包</a><br>')
	API_ResponseWrite('<br><a href="Marriage_HunLiWuPin?1=5&4='..NPCID..'">4、购买烟花</a><br>')
	API_ResponseWrite('<br><a href="Marriage_HunLiWuPin?1=2&4='..NPCID..'">5、租用婚纱礼服</a><br>')
	API_ResponseWrite('<br><a>离开</a>')
	API_ResponseFlush(ActorID) 
end

function Marriage_ZhengHunRen()
	local ActorID = API_RequestGetNumber(1)
	local SelectType = API_RequestGetNumber(2)
	local OtherID = API_RequestGetNumber(3)
	local MapID = API_GetActorMapID(ActorID)
	local OtherSex = API_GetActorSex(OtherID)
	local ZhengHunNum = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.HuiDiaoTime)
	if ZhengHunNum > 2 then
		API_ActorSendMsg(ActorID,2,'本次婚礼已经指定了三个证婚人，不可以再指定证婚人了。')
		return
	end
	local ZhuRenID = Marriage_NewMapTable[MapID].ZhuRenID
	local BanLvID = Marriage_NewMapTable[MapID].BanLvID
	if OtherID == ZhuRenID or OtherID == BanLvID then
		API_ActorSendMsg(ActorID,2,'不可以指定新人为证婚人。')
		return
	end
	if SelectType == 0 then
		API_ActorStartSelect(ActorID,'Marriage_ZhengHunRen',15)
		API_ActorSendMsg(ActorID,3,'请点击玩家指定证婚人，一对新人最多可指定三个')
	elseif SelectType == 1 then
		API_ActorStartSelect(ActorID,'Marriage_ZhengHunRen',15)
		API_ActorSendMsg(ActorID,3,'请点击玩家指定证婚人，一对新人最多可指定三个')
	elseif SelectType == 2 then
		if API_ActorGetPackageSize(OtherID) >= 2 then
			if API_ActorHaveEquip(OtherID,10999) or API_ActorHaveEquip(OtherID,11000) or API_ActorHaveEquip(OtherID,11001) or API_ActorHaveEquip(OtherID,11002) then
				API_ActorSendMsg(ActorID,2,'您选择的玩家已经是证婚人了，不可以重复指定。')
			else
				if API_ActorGetGoodsNum(OtherID,10999) == 0 and API_ActorGetGoodsNum(OtherID,11000) == 0 and API_ActorGetGoodsNum(OtherID,11001) == 0 and API_ActorGetGoodsNum(OtherID,11002) == 0 then
					API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.HuiDiaoTime,ZhengHunNum+1)
					if OtherSex == 1 then
						API_AddActorGoodsFlag(OtherID,10999,1,6,'给证婚人时装(男)')
						API_AddActorGoodsFlag(OtherID,11000,1,6,'给证婚人时装(男)')
						API_ActorSendMsg(ActorID,2,'指定证婚人成功')
					else
						API_AddActorGoodsFlag(OtherID,11001,1,6,'给证婚人时装(女)')
						API_AddActorGoodsFlag(OtherID,11002,1,6,'给证婚人时装(女)')
						API_ActorSendMsg(ActorID,2,'指定证婚人成功')
					end
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<text>您已是这对新人的证婚人，并已获得证婚人服装，请打开背包查看。</text><br>')
					API_ResponseWrite('<br><br><a>确定</a><br>')
					API_ResponseFlush(OtherID)
				else
					API_ActorSendMsg(ActorID,2,'您选择的玩家已经是证婚人了，不可以重复指定。')
				end
			end
		else
			API_ActorSendMsg(ActorID,2,'您选择的玩家背包已满，请让TA留出两个背包空位后再试。')
		end
	else
		API_ActorStartSelect(ActorID,'Marriage_ZhengHunRen',15)
	end
end

Marriage_ZhuangShiPinTable = {
[1] = {
	[1] = {Name='婚礼蛋糕',Tip='豪华美丽的婚礼蛋糕，让你的婚礼更加有气派。',Money=15000,
		NPCList = {
				{NPCID=11664,X=76,Y=69},
				},
		},
	[2] = {Name='婚礼花环',Tip='花团锦簇的婚礼花环，将它铺在婚台的四周简直漂亮极了。',Money=10000,
		NPCList = {
				{NPCID=11665,X=60,Y=79},
				{NPCID=11666,X=73,Y=80},
				},
		},
	[3] = {Name='婚礼花门',Tip='与你最亲密的爱人携手穿越这道花门吧，大家将见证你们的爱情。',Money=15000,
		NPCList = {
				{NPCID=11667,X=71,Y=38}, 
				{NPCID=11668,X=64,Y=38},
				},
		},
	[4] = {Name='婚礼花盆',Tip='这些花盆放置在教堂的走廊两侧，你将看到一片绚丽的花海。',Money=10000,
		NPCList = {
				{NPCID=11669,X=65,Y=48},
				{NPCID=11669,X=71,Y=48},
				{NPCID=11669,X=65,Y=53},
				{NPCID=11669,X=71,Y=53},
				{NPCID=11669,X=65,Y=57},
				{NPCID=11669,X=71,Y=57},
				{NPCID=11669,X=65,Y=62},
				{NPCID=11669,X=71,Y=62},
				},
		},
	[5] = {Name='婚礼花柱',Tip='这条拱形的花柱挂在教堂的天顶，宛如一条彩虹。',Money=15000,
		NPCList = {
				{NPCID=11670,X=72,Y=80},
				{NPCID=11671,X=60,Y=77},
				},
		},
	[6] = {Name='婚礼花丛',Tip='靠墙壁放置的花丛，能为漂亮的婚礼会场锦上添花。',Money=10000,
		NPCList = {
				{NPCID=11672,X=53,Y=47},
				{NPCID=11672,X=53,Y=42},
				{NPCID=11672,X=53,Y=50},
				{NPCID=11672,X=53,Y=54},
				{NPCID=11672,X=53,Y=56},
				{NPCID=11672,X=53,Y=61},
				{NPCID=11672,X=53,Y=64},
				},
		},
	},
[2] = {
	[1] = {Name='婚礼蛋糕',Tip='豪华美丽的婚礼蛋糕，让你的婚礼更加有气派。',Money=15000,
		NPCList = {
				{NPCID=11664,X=74,Y=68},
				},
		},
	[2] = {Name='婚礼花环',Tip='花团锦簇的婚礼花环，将它铺在婚台的四周简直漂亮极了。',Money=10000,
		NPCList = {
				{NPCID=11673,X=58,Y=79},
				{NPCID=11703,X=72,Y=78},
				},
		},
	[3] = {Name='婚礼花柱',Tip='两条花柱自教堂的天顶倒挂而下，宛如鲜花汇成的瀑布般美丽。',Money=15000,
		NPCList = {
				{NPCID=11676,X=59,Y=75},
				{NPCID=11676,X=71,Y=75},
				},
		},
	[4] = {Name='婚礼心环',Tip='这件巨大的心环是由999朵玫瑰编织而成，它能让平凡的爱情变得璀璨。',Money=25000,
		NPCList = {
				{NPCID=11677,X=64,Y=75},
				},
		},
	[5] = {Name='婚礼花盆',Tip='这些花盆放置在教堂的走廊两侧，你将看到一片绚丽的花海。',Money=10000,
		NPCList = {
				{NPCID=11674,X=63,Y=48},
				{NPCID=11674,X=69,Y=48},
				{NPCID=11674,X=63,Y=53},
				{NPCID=11674,X=69,Y=53},
				{NPCID=11674,X=63,Y=56},
				{NPCID=11674,X=69,Y=56},
				{NPCID=11674,X=63,Y=61},
				{NPCID=11674,X=69,Y=61},
				},
		},
	[6] = {Name='婚礼花门',Tip='与你最亲密的爱人携手穿越这道花门吧，大家将见证你们的爱情。',Money=25000,
		NPCList = {
				{NPCID=11675,X=69,Y=41},
				},
		},
	},
}

function Marriage_ZhuangShiPin()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local Camp = API_GetActorCamp(ActorID)
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local PlayPoint = API_ActorGetPropNum(ActorID,183) --获取玩家身上点卷
	local PlayMoney = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) --获取玩家身上金钱
	local MapID = API_GetActorMapID(ActorID)
	if Marriage_ZhuangShiPinTable[XuanZe] == nil then
		return
	end
	if type(Marriage_ZhuangShiPinTable[XuanZe]) ~= 'table' then
		return
	end
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local Table = Marriage_ZhuangShiPinTable[XuanZe]
	if API_RequestGetNumber(2) > 0 then
		local NPCNo = API_RequestGetNumber(2)
		if Table[NPCNo] ~= nil then
			local NPCName = Table[NPCNo].Name
			local Money = Table[NPCNo].Money
			if Month == 11 and Day == 11 then
				Money = 1
			end
			if PlayMoney >= Money then
				local NPCSL = table.getn(Table[NPCNo].NPCList)
				for i = 1,NPCSL do
					local NPCID = Table[NPCNo].NPCList[i].NPCID
					local X = Table[NPCNo].NPCList[i].X
					local Y = Table[NPCNo].NPCList[i].Y
					if API_IsBlockTile(MapID,X,Y,0) then
						API_ActorSendMsg(ActorID,2,'您已经添加过'..NPCName..'或'..NPCName..'的位置已经被占用，无法添加'..NPCName..'。')
						return
					end
				end
				if API_ActorAddMoney(ActorID,-Money,MarriageSystemTaskID,'添加'..NPCName..'扣钱') then
					for i = 1,NPCSL do
						local NPCID = Table[NPCNo].NPCList[i].NPCID
						local X = Table[NPCNo].NPCList[i].X
						local Y = Table[NPCNo].NPCList[i].Y
						local FastID = API_CreateMonster(MapID,NPCID,X,Y,0,0,-1)
					end
					API_ActorSendMsg(ActorID,9,'扣除'..Money..'金币，添加'..NPCName..'成功。')
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = Money
					else
						GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] + Money
					end
				end
			else
				API_ActorSendMsg(ActorID,2,'您的金币不足，无法添加'..NPCName..'。')
			end
		end
	end
	local NPCNum =  table.getn(Table)
	API_ResponseWrite('<name>教堂装饰品</name>')
	API_ResponseWrite('<win rect="30,75,430,455"></win>') 
	for i = 1,NPCNum do
		local NPCName = Table[i].Name
		local Tip = Table[i].Tip
		local Money = Table[i].Money
		if Month == 11 and Day == 11 then
				Money = 1
			end
		API_ResponseWrite('<text size="14" color="254,249,220">'..NPCName..'    </text>')
		local BuyNumTip = '  装饰品价格：'..Money..'金币  '
		local BuyNumTipLen = string.len(BuyNumTip)
		if BuyNumTipLen < 38 then
			for j = 1,38- BuyNumTipLen do
				BuyNumTip = BuyNumTip..' '
			end
		end
		API_ResponseWrite('<text>'..BuyNumTip..'</text>')
		API_ResponseWrite('<a href="Marriage_ZhuangShiPin?1='..XuanZe..'&2='..i..'">添加装饰品</a><br>')
		API_ResponseWrite('<br><text color="254,249,220">'..Tip..'</text><br>')
		API_ResponseWrite('<text>————————————————————————————————</text><br>')
	end
	API_ResponseWrite('<br><a href="Marriage_ZhuChi_PanDuan_Title">返回</a>')
end

function Marriage_LoveOver()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local ActorName = API_GetActorName(ActorID)
	local Camp = API_GetActorCamp(ActorID)
	local CampName = ''
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local OtherDX = API_VarDataGetNumber(OtherID,1,19001)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Camp == 0 then
		CampName = '帝国'
	elseif Camp == 1 then
		CampName = '联邦'
	end
	if XuanZe == 1 then
		if API_ActorIsOnline(OtherID) and OtherDX == ActorID then
			if API_GetRelation(ActorID,0,8) == -1 then
				for j in Marriage_NewMapTable do
					local ZhuRenID = Marriage_NewMapTable[j].ZhuRenID
					local BanLvID = Marriage_NewMapTable[j].BanLvID
					if (ActorID == ZhuRenID and OtherID == BanLvID) or (OtherID == ZhuRenID and ActorID == BanLvID) then
						local TableNum = table.getn(Marriage_NewMapTable)
						Marriage_NewMapTable[j] = nil
						table.setn(Marriage_NewMapTable,TableNum-1)
						API_DestroyEctype(j)
						break
					end
				end
				if API_IsTeammate(ActorID,OtherID) then
					HaoYouZhuDuiXiTong_UpdateRelation(ActorID,OtherID)
					HaoYouZhuDuiXiTong_UpdateRelation(OtherID,ActorID)
				end
				API_VarDataSetNumber(ActorID,1,19001,0)
				API_VarDataSetNumber(ActorID,1,19002,0)
				API_VarDataSetNumber(ActorID,1,19004,0)
				API_VarDataSetNumber(ActorID,1,19005,0)
				API_VarDataSetNumber(ActorID,1,19013,0)
				API_VarDataSetNumber(OtherID,1,19001,0)
				API_VarDataSetNumber(OtherID,1,19002,0)
				API_VarDataSetNumber(OtherID,1,19004,0)
				API_VarDataSetNumber(OtherID,1,19005,0)
				API_VarDataSetNumber(OtherID,1,19013,0)
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>好吧，如您所愿，您们现在不存在任何关系了……</text><br>')
				API_ResponseWrite('<br><a>确定</a>')
				API_ResponseFlush(ActorID)
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您的爱人已经和您断绝了关系……</text><br><text>希望您可以早日找到真正属于自己的幸福。</text><br>')
				API_ResponseWrite('<br><a>确定</a>')
				API_ResponseFlush(OtherID)
			else
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您已经结婚了，请找婚礼司仪申请离婚。</text><br><br>')
				API_ResponseWrite('<a>我知道了</a>')
			end
		else
			if API_GetRelation(ActorID,0,8) == -1 then
				API_SendActorMoneyMail_UnLine('#'..OtherID..'',0,'婚约取消通知书','亲爱的朋友\r\n    我们不得不很遗憾的通知您，由于某种原因，您的爱人'..ActorName..'已经取消了和您的婚约。希望您能够尽快到主城的教堂门口找婚礼司仪取消您的订婚状态。\r\n    此外，在您取消订婚状态之前，您无法向任何人求婚，也无法接受其他人的求婚。我们为您感到遗憾的同时，也祝愿您早日拥有自己的幸福。\r\n\r\n                            '..CampName..'教堂\r\n                            '..Year..'年'..Month..'月'..Day..'日')
				for j in Marriage_NewMapTable do
					local ZhuRenID = Marriage_NewMapTable[j].ZhuRenID
					local BanLvID = Marriage_NewMapTable[j].BanLvID
					if (ActorID == ZhuRenID and OtherID == BanLvID) or (OtherID == ZhuRenID and ActorID == BanLvID) then
						local TableNum = table.getn(Marriage_NewMapTable)
						Marriage_NewMapTable[j] = nil
						table.setn(Marriage_NewMapTable,TableNum-1)
						API_DestroyEctype(j)
						break
					end
				end
				if API_IsTeammate(ActorID,OtherID) then
					HaoYouZhuDuiXiTong_UpdateRelation(ActorID,OtherID)
					HaoYouZhuDuiXiTong_UpdateRelation(OtherID,ActorID)
				end
				API_VarDataSetNumber(ActorID,1,19001,0)
				API_VarDataSetNumber(ActorID,1,19002,0)
				API_VarDataSetNumber(ActorID,1,19004,0)
				API_VarDataSetNumber(ActorID,1,19005,0)
				API_VarDataSetNumber(ActorID,1,19013,0)
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>好吧，如您所愿，您们现在不存在任何关系了……</text><br>')
				API_ResponseWrite('<br><a>确定</a>')
			else
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您已经结婚了，请找婚礼司仪申请离婚。</text><br><br>')
				API_ResponseWrite('<a>我知道了</a>')
			end
		end
	else
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
		API_ResponseWrite('<text>您真的打算再找一个爱人？您真的打算就这么放弃了？曾经的山盟海誓您都不记得了吗？</text><br>')
		API_ResponseWrite('<br><a href="Marriage_LoveOver?1=1">是的，我要再找一个</a><br>')
		API_ResponseWrite('<br><a>我想……还是算了……</a><br>')
	end
end

function Marriage_HunLiAgain()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local NPCID = API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	if XuanZe == 1 then
		if API_GetRelation(ActorID,0,8) == -1 and API_GetRelation(OtherID,0,8) == -1 then
			if API_ActorIsOnline(OtherID) then
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win ntype="5" close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您的爱人希望重新举行婚礼，您同意吗？</text><br>')
				API_ResponseWrite('<br><a href="Marriage_HunLiAgainEr?1=1&2='..ActorID..'&3='..NPCFastID..'">是的，我同意</a><br>')
				API_ResponseWrite('<br><a href="Marriage_HunLiAgainEr?1=2&2='..ActorID..'&3='..NPCFastID..'">不，我不同意</a><br>')
				API_ResponseFlush(OtherID)
			else
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您的爱人不在线或跟您不在同一个岛，无法重新举行婚礼。</text><br><br>')
				API_ResponseWrite('<a>我知道了</a>')
				return 
			end
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
			API_ResponseWrite('<text>您已经结婚了，无法重新举行婚礼。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
			return 
		end
	else
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win ntype="5" close="0" balpha="0" rect="300,380,400,160"></win>')
		API_ResponseWrite('<text>您确定重新举行婚礼吗？</text><br><br>')
		API_ResponseWrite('<a href="Marriage_HunLiAgain?1=1">是的</a><br>')
		API_ResponseWrite('<br><a>取消</a><br>')
	end
end

function Marriage_HunLiAgainEr()
	local OtherID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local ActorID = API_RequestGetNumber(2)
	local NPCFastID = API_RequestGetNumber(3)
	if XuanZe == 1 then
		if API_GetRelation(ActorID,0,8) == -1 and API_GetRelation(OtherID,0,8) == -1 then
			if API_ActorIsOnline(ActorID) then
				API_VarDataSetNumber(ActorID,1,19002,2)
				API_VarDataSetNumber(OtherID,1,19002,2)
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win ntype="5" close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>好吧，让我们重新开始婚礼……</text><br><br>')
				API_ResponseWrite('<a>确定</a>')
				API_ResponseFlush(ActorID)
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win ntype="5" close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>好吧，让我们重新开始婚礼……</text><br><br>')
				API_ResponseWrite('<a>确定</a>')
				API_ResponseFlush(OtherID)
				API_CreateTimerTriggerG(ActorID,NPCFastID,3,1,'Marriage_HunLiAgainSan')
			else
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您的爱人不在线或跟您不在同一个岛，无法重新举行婚礼。</text><br><br>')
				API_ResponseWrite('<a>我知道了</a>')
				return 
			end
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
			API_ResponseWrite('<text>您已经结婚了，无法重新举行婚礼。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
			return 
		end
	elseif XuanZe == 2 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
		API_ResponseWrite('<text>您爱人不同意重新举行婚礼</text><br><br>')
		API_ResponseWrite('<a>我知道了</a>')
		API_ResponseFlush(ActorID)
	end
end

function Marriage_HunLiAgainSan(ActorID,NPCFastID)
	API_ResponseWrite('<name></name>')
	API_ResponseWrite('<win ntype="5" close="0" balpha="0" rect="300,380,400,180"></win>')
	API_ResponseWrite('<text size="18">     您是否需要我为您们主持婚礼呢？</text><br><br><br>')
	API_ResponseWrite('<text>            </text>')
	API_ResponseWrite('<a href="Marriage_JieHun?1=1&2='..NPCFastID..'">需要</a>')
	API_ResponseWrite('<text>                      </text>')
	API_ResponseWrite('<a href="Marriage_JieHun?1=2&2='..NPCFastID..'">不需要</a><br>') 
	API_ResponseWrite('<br><br><text>                        </text>')
	API_ResponseWrite('<a>稍等一会</a>') 
	API_ResponseFlush(ActorID)
end

function OpenNewMap()
	local ActorID = API_RequestGetActorID()
	local Sexy = API_GetActorSex(ActorID)
	local Camp = API_GetActorCamp(ActorID)
	local HunYin = API_VarDataGetNumber(ActorID,1,19002)
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local ZhuRenName = API_GetActorName(ActorID)
	local TeamID = API_GetTeamID(ActorID)
	local TeamNum = 0
	if HunYin == 2 then
		if Sexy == 1 then
			if API_ActorIsOnline(OtherID) then --伴侣是否在线
				local BanLvName = API_GetActorName(OtherID)
				if API_GetActorMapID(ActorID) == API_GetActorMapID(OtherID) then --两人是否在同一地图
					if API_IsTeammate(ActorID,OtherID) then --两人是否队友
						local TeamID = API_GetTeamID(ActorID) --判断队伍ID
						if API_GetTeamSize(TeamID) == 2 then --判断队伍人数
							--判断两人都在线，并且是组队状态在往下走，把两人都传进去
							local MapConfigID = 0
							local x,y
							if Camp == 0 then
								MapConfigID = 81
								x,y = 68,39
							elseif Camp == 1 then
								MapConfigID = 40
								x,y = 66,42
							end
							local StaticMapID = API_GetRightMapID(MapConfigID)
							local MapID = API_CreateEctype(StaticMapID,0)
							local TableNum = table.getn(Marriage_NewMapTable)
							Marriage_NewMapTable[MapID] = {
											MapID = MapID,
											MapConfigID = MapConfigID,
											ZhuRenID = ActorID,
											BanLvID = OtherID,
											ZhuRenName = ZhuRenName,
											BanLvName = BanLvName,
											Time = 0,
											Camp = Camp,
											ZhuangShiPin = {},
											}
							table.setn(Marriage_NewMapTable,TableNum+1) 
							Marriage_NewMap(MapID)
							API_ActorGoToMap(ActorID,MapID,x,y)
							API_ActorGoToMap(OtherID,MapID,x+1,y+1)
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
							API_ResponseWrite('<text>请注意：如果婚礼场地内超过</text><text color="255,0,255">20分钟</text><text>没有任何玩家，将会自动关闭。</text><br>')
							API_ResponseWrite('<a>确定</a>')
							API_ResponseFlush(ActorID)
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
							API_ResponseWrite('<text>请注意：如果婚礼场地内超过</text><text color="255,0,255">20分钟</text><text>没有任何玩家，将会自动关闭。</text><br>')
							API_ResponseWrite('<a>确定</a>')
							API_ResponseFlush(OtherID)
						else
							API_ActorSendMsg(ActorID,2,'只有情侣两个人组队才可以开启结婚场地哦。')
						end
					else
						API_ActorSendMsg(ActorID,2,'您需要和您的爱人组队后才可以开启结婚场地。')
					end
				else 
					API_ActorSendMsg(ActorID,2,'您和您的爱人需要在同一地图内才可以开启结婚场地。')
				end
			else
				API_ActorSendMsg(ActorID,2,'您的爱人不在线或跟您不在同一个岛，不能开启结婚场地。')
			end
		else
			API_ActorSendMsg(ActorID,2,'只有男方才可以开启结婚场地')
		end
	else
		API_ActorSendMsg(ActorID,2,'您还没有预约教堂，不能开启结婚场地。')
	end
end

function Marriage_NewMap(MapID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local NPCID,DoorID,NPCX,NPCY,DoorX,DoorY
	if MapConfigID == 81 then
		NPCID,DoorID,NPCX,NPCY,DoorX,DoorY = 11725,11660,66,73,68,33
	elseif MapConfigID == 40 then
		NPCID,DoorID,NPCX,NPCY,DoorX,DoorY = 11726,11661,64,74,66,37
	end
	local NPCFastID = API_CreateMonster(MapID,NPCID,NPCX,NPCY,5,0,-1)
	local DoorFastID = API_CreateMonster(MapID,DoorID,DoorX,DoorY,5,0,-1)
	--在表中保存信息
	API_CreateTimerTriggerG(MapID,0,60,-1,'Marriage_CloseBasilica_TimerTriggerCallFunc')
end

function Marriage_CloseBasilica_TimerTriggerCallFunc(MapID,b)
	local TriggerGID = API_GetCurTriggerID()
	if not API_MapIsValid(MapID) then
		local TableNum = table.getn(Marriage_NewMapTable)
		Marriage_NewMapTable[MapID] = nil
		table.setn(Marriage_NewMapTable,TableNum-1)
		API_DestroyTriggerG(TriggerGID)
		return
	end
	local Time = Marriage_NewMapTable[MapID].Time
	Time = Time + 1
	Marriage_NewMapTable[MapID].Time = Time
	if Time == 119 then
		API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.CountDown,60)
		API_CreateTimerTriggerG(MapID,0,1,61,'Marriage_CloseBasilica_TongZhi')
		API_ActorBroadcastMsgEx(MapID,-1,0,1,'一分钟后所有人将被传送至教堂门口')
	elseif Time == 120 then
		local TableNum = table.getn(Marriage_NewMapTable)
		Marriage_NewMapTable[MapID] = nil
		table.setn(Marriage_NewMapTable,TableNum-1)
		API_ActorCallBack(MapID,0,-1,'Marriage_goto')
		API_DestroyEctype(MapID)
		API_DestroyTriggerG(TriggerGID)
	end
end

function Marriage_CloseBasilica_TongZhi(MapID,b)
	local TriggerGID = API_GetCurTriggerID()
	local CountDown = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.CountDown)
	CountDown = CountDown - 1
	API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.CountDown,CountDown)
	local CountDownCN = PublicFun_ArabianNumberToChineseNumber(CountDown)
	API_ActorBroadcastMsg(MapID,1,''..CountDownCN..'')
	if CountDown == 0 then
		API_ActorBroadcastMsg(MapID,1,''..CountDownCN..'')
		API_ActorCallBack(MapID,0,-1,'Marriage_goto')
		API_DestroyTriggerG(TriggerGID)
	end
end

Marriage_HunLiWuPin_Goods = {
--普通道具，如红包、喜糖盒子
[1] = {
		{GoodsID=826,Money=0,Point=100,}, --求婚花束
		{GoodsID=10927,Money=5000,Point=0,}, --结婚花束
		--{GoodsID=926,Money=999,Point=0,}, --喜糖盒子
		--{GoodsID=927,Money=999,Point=0,}, --喜糖盒子
		--{GoodsID=928,Money=999,Point=0,}, --喜糖盒子
		--可以加N个物品
		},
--结婚时装
[2] = {
		{GoodsID=10938,Money=0,Point=2000,}, --浪漫嬉皮士礼帽
		{GoodsID=10939,Money=0,Point=2500,}, --浪漫嬉皮士礼服
		{GoodsID=10932,Money=0,Point=2000,}, --羽翼天使头饰
		{GoodsID=10933,Money=0,Point=2500,}, --羽翼天使婚纱
		--{GoodsID=10934,Money=0,Point=2500,}, --燕尾绅士礼帽
		--{GoodsID=10935,Money=0,Point=3000,}, --燕尾绅士礼服
		--{GoodsID=10928,Money=0,Point=2500,}, --灵界仙子头饰
		--{GoodsID=10929,Money=0,Point=3000,}, --灵界仙子婚纱
		--{GoodsID=10936,Money=0,Point=3500,}, --白金爵士礼帽
		--{GoodsID=10937,Money=0,Point=4000,}, --白金爵士礼服
		--{GoodsID=10930,Money=0,Point=3500,}, --花冠女王头饰
		--{GoodsID=10931,Money=0,Point=4000,}, --花冠女王婚纱
		--可以加N个物品
		},
[3] = {
		{GoodsID=830,Money=100,Point=0,}, --丘比特的庇护
		{GoodsID=831,Money=100,Point=0,}, --丘比特的愤怒
		{GoodsID=832,Money=100,Point=0,}, --丘比特的锁链
		{GoodsID=827,Money=100,Point=0,}, --丘比特的圣疗
	},
[4] = {
		{GoodsID=929,Money=11000,Point=0,}, --超大红包
		{GoodsID=930,Money=5500,Point=0,}, --大红包
		{GoodsID=931,Money=2200,Point=0,}, --中红包
		{GoodsID=932,Money=550,Point=0,}, --小红包
	},
[5] = {
		{GoodsID=819,Money=500,Point=0,}, --烟花
		{GoodsID=820,Money=500,Point=0,},  --烟花
		{GoodsID=821,Money=500,Point=0,},  --烟花
		{GoodsID=822,Money=500,Point=0,},  --烟花
		{GoodsID=823,Money=500,Point=0,},  --烟花
		{GoodsID=824,Money=500,Point=0,},  --烟花
		{GoodsID=825,Money=500,Point=0,},  --烟花
	},
}

function Marriage_HunLiWuPin()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	local NPCID = API_RequestGetNumber(4)
	local HunYinZhuangTai = API_VarDataGetNumber(ActorID,1,19002)
	if Marriage_HunLiWuPin_Goods[SelectItem] == nil then
		return
	end
	if type(Marriage_HunLiWuPin_Goods[SelectItem]) ~= 'table' then
		return
	end
	if API_RequestGetNumber(3) > 0 then
		local BuyNo = API_RequestGetNumber(3)
		local num = BuyNo * 100
		if Marriage_HunLiWuPin_Goods[SelectItem][BuyNo] ~= nil then
			local BuyGoodsID = Marriage_HunLiWuPin_Goods[SelectItem][BuyNo].GoodsID
			local BuyPoint = Marriage_HunLiWuPin_Goods[SelectItem][BuyNo].Point
			local BuyMoney = Marriage_HunLiWuPin_Goods[SelectItem][BuyNo].Money
			local BuyNum = API_RequestGetNumber(num)
			if BuyNum < 1 then
				BuyNum = 1
			elseif BuyNum > 999 then
				BuyNum = 999
			end
			BuyMoney = BuyMoney * BuyNum
			BuyPoint = BuyPoint * BuyNum
			if BuyMoney > 0 then
				if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) >= BuyMoney then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
						if SelectItem == 4 then
							if API_ActorAddMoneyUnStat(ActorID,-BuyMoney,MarriageSystemTaskID,'购买婚庆商品扣钱') then
								API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'婚礼助手购买')
								API_ActorSendMsg(ActorID,2,'您花费 '..BuyMoney..' 金币购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
								API_ActorSendMsg(ActorID,7,'您花费 '..BuyMoney..' 金币购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							end
						else
							if API_ActorAddMoney(ActorID,-BuyMoney,MarriageSystemTaskID,'购买婚庆商品扣钱') then
								API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'婚礼助手购买')
								API_ActorSendMsg(ActorID,2,'您花费 '..BuyMoney..' 金币购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
								API_ActorSendMsg(ActorID,7,'您花费 '..BuyMoney..' 金币购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
								local LaiYuan = API_ActorGetPropNum(ActorID,201)
								if GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] == nil then
									GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = BuyMoney
								else
									GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] + BuyMoney
								end
							end
						end
					else
						API_ActorSendMsg(ActorID,3,'背包空间不足，无法购买')
					end
				else
					API_ActorSendMsg(ActorID,3,'您的金币不够')
				end
			elseif BuyPoint > 0 then
				if API_ActorGetPropNum(ActorID,183) >= BuyPoint then
					if API_ActorCanAddGoods(ActorID,BuyGoodsID,BuyNum,0,0) ~= -1 then
						if API_UsePoint(ActorID,3,BuyGoodsID,1,BuyPoint) == 0 then
							API_AddActorGoods(ActorID,BuyGoodsID,BuyNum,'婚礼助手购买')
							API_ActorSendMsg(ActorID,2,'您花费 '..BuyPoint..' 点卷购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							API_ActorSendMsg(ActorID,7,'您花费 '..BuyPoint..' 点卷购买了 '..BuyNum..' 个 '..API_GetGoodsName(BuyGoodsID)..'')
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[2][40][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[2][40][LaiYuan] = BuyPoint
							else
								GLOBAL_FengXiangBiao_DateList[2][40][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][40][LaiYuan] + BuyPoint
							end
						end
					else
						API_ActorSendMsg(ActorID,3,'背包空间不足，无法购买')
					end
				else
					API_ActorSendMsg(ActorID,3,'您的点卷不够')
				end
			end
		end
		return
	end
	local GoodsNum = table.getn(Marriage_HunLiWuPin_Goods[SelectItem])
	if SelectItem == 1 then
		API_ResponseWrite('<name>求婚道具</name>')
	elseif SelectItem == 2 then
		API_ResponseWrite('<name>婚礼服装</name>')
	elseif SelectItem == 3 then
		API_ResponseWrite('<name>技能材料</name>')
	elseif SelectItem == 4 then
		API_ResponseWrite('<name>红包</name>')
	elseif SelectItem == 5 then
		API_ResponseWrite('<name>烟花</name>')
	end
	API_ResponseWrite('<win rect="30,75,350,465"></win>')
	for i = 1,GoodsNum do
		if i > Page * 6 and i < (Page + 1) * 6 + 1 then
			local BuyGoodsID = Marriage_HunLiWuPin_Goods[SelectItem][i].GoodsID
			local BuyPoint = Marriage_HunLiWuPin_Goods[SelectItem][i].Point
			local BuyMoney = Marriage_HunLiWuPin_Goods[SelectItem][i].Money
			API_ResponseWrite('<text color="254,249,220">'..API_GetGoodsName(BuyGoodsID)..'</text><br>')
			API_ResponseWrite('<img srcgd="'..BuyGoodsID..'" tipgd="'..BuyGoodsID..'">')
			local BuyNumTip = ''
			local BuyNumPointTip = '  购买单价：'..BuyPoint..'点卷      '
			local BuyNumMoneyTip = '  购买单价：'..BuyMoney..'金币      '
			if BuyPoint == 0 then
				BuyNumTip = BuyNumMoneyTip
			elseif BuyPoint ~= 0 then
				BuyNumTip = BuyNumPointTip
			end
			local BuyNumTipLen = string.len(BuyNumTip)
			if BuyNumTipLen < 27 then
				for j = 1,27- BuyNumTipLen do
					BuyNumTip = BuyNumTip..' '
				end
			end
			API_ResponseWrite('<text>'..BuyNumTip..'</text>')
			local num = i * 100
			API_ResponseWrite('<input type="number" name="'..num..'" size="3" width="40">')
			API_ResponseWrite('<text> </text>')
			API_ResponseWrite('<img src="LuaUse\\button buy_u.bmp" src2="LuaUse\\button buy_l.bmp" close="0" href="Marriage_HunLiWuPin?1='..SelectItem..'&2='..Page..'&3='..i..'&4='..NPCID..'"><br>')
			API_ResponseWrite('<text>—————————————————————————</text><br>')
		end
	end
	if GoodsNum < (Page + 1) * 6 then
		for i = 1,(Page + 1) * 6 - GoodsNum do
			API_ResponseWrite('<br><br><br><br>')
		end
	end
	if GoodsNum > 6 then
		local BackPage = Page - 1
		local NextPage = Page + 1
		if Page == 0 then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_g.bmp"><text>       </text>')
			if NPCID == 11725 or NPCID == 11726 then
				API_ResponseWrite('<a href="Marriage_ZhuChi_PanDuan_Title">返回</a>')
			else
				API_ResponseWrite('<a href="Marriage_ZhuShou_PanDuan_Title">返回</a>')
			end
			API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="Marriage_HunLiWuPin?1='..SelectItem..'&2='..NextPage..'&4='..NPCID..'">')
		elseif (Page + 1) * 6 < GoodsNum then
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="Marriage_HunLiWuPin?1='..SelectItem..'&2='..BackPage..'&4='..NPCID..'"><text>       </text>')
			if NPCID == 11725 or NPCID == 11726 then
				API_ResponseWrite('<a href="Marriage_ZhuChi_PanDuan_Title">返回</a>')
			else
				API_ResponseWrite('<a href="Marriage_ZhuShou_PanDuan_Title">返回</a>')
			end
			API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="Marriage_HunLiWuPin?1='..SelectItem..'&2='..NextPage..'&4='..NPCID..'">')
		else
			API_ResponseWrite('<br><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="Marriage_HunLiWuPin?1='..SelectItem..'&2='..BackPage..'&4='..NPCID..'"><text>       </text>')
			if NPCID == 11725 or NPCID == 11726 then
				API_ResponseWrite('<a href="Marriage_ZhuChi_PanDuan_Title">返回</a>')
			else
				API_ResponseWrite('<a href="Marriage_ZhuShou_PanDuan_Title">返回</a>')
			end
			API_ResponseWrite('<text>       </text><img src="LuaUse\\button_next_g.bmp">')
		end
	else
		if NPCID == 11725 or NPCID == 11726 then
			API_ResponseWrite('<br><a href="Marriage_ZhuChi_PanDuan_Title">  返回</a>')
		else
			API_ResponseWrite('<br><a href="Marriage_ZhuShou_PanDuan_Title">  返回</a>')
		end
	end
end		

function Marriage_ZhuShou_QingTie() --领取喜帖
	local ActorID = API_RequestGetActorID()
	local Camp = API_GetActorCamp(ActorID)
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local HunYinZhuangTai = API_VarDataGetNumber(ActorID,1,19002)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ZhuRenYMD = API_VarDataGetNumber(ActorID,1,19004)
	local ZhuRenHMS = API_VarDataGetNumber(ActorID,1,19005)
	local ZhuRenYear = math.floor(ZhuRenYMD/10000) --取年月日的商数
	local ZhuRenMonthDay = math.mod(ZhuRenYMD,10000) --取年月日的余数
	local ZhuRenMonth = math.floor(ZhuRenMonthDay/100) --取年月日余数的商数
	local ZhuRenDay = math.mod(ZhuRenMonthDay,100) --取年月日余数的商数的余数
	local DayDay = PublicFun_Difftime(ZhuRenYear,ZhuRenMonth,ZhuRenDay) 
	local GoodsID = 73
	if API_RequestGetNumber(3) > 0 then
		local LingQuNum = API_RequestGetNumber(3)
		if LingQuNum < 1 then
			LingQuNum = 1
		elseif LingQuNum > 50 then
			LingQuNum = 50
		end
		if API_ActorIsOnline(OtherID) then
			local ActorName = API_GetActorName(ActorID)
			local OtherName = API_GetActorName(OtherID)
			if API_DiffDatatime(ZhuRenYear,ZhuRenMonth,ZhuRenDay,ZhuRenHMS,0,0) > -86400 then
				if API_ActorCanAddGoods(ActorID,GoodsID,LingQuNum,0,0) ~= -1  then
					for p = 1,LingQuNum do 
						API_AddActorInvitation(ActorID,''..ActorName..'',''..OtherName..'',GoodsID,ZhuRenYear,ZhuRenMonth,ZhuRenDay,ZhuRenHMS)
					end
					API_ActorSendMsg(ActorID,2,'获得喜帖 X '..LingQuNum..'')
				else
					API_ActorSendMsg(ActorID,2,'您的背包空间不足，请保留足够的空格再领取喜帖。')
				end
			else
				API_ActorSendMsg(ActorID,2,'您预约的教堂已经到期，请重新预约教堂再领取喜帖。')
			end
		else
			API_ActorSendMsg(ActorID,2,'您的爱人不在线或跟您不在同一个岛，不能领取喜帖。')
		end
	end
	if HunYinZhuangTai == 2 then
		API_ResponseWrite('<name>领取喜帖</name>')
		API_ResponseWrite('<text>请输入领取喜帖的数量：</text>')
		API_ResponseWrite('<input type="number" name="3" size="3" width="45">')
		API_ResponseWrite('<a href="Marriage_ZhuShou_QingTie?1=1"> 领取喜帖</a><br>')
		API_ResponseWrite('<br><text color="254,0,255">喜帖是您的好友进入婚礼场地的唯一凭证，请谨慎使用。</text><br>')
		API_ResponseWrite('<br><a>取消</a><br>')
	else
		API_ActorSendMsg(ActorID,2,'您还未预约教堂，不能领取喜帖')
	end
end

function Marriage_JieHun() --结婚
	local ActorID = API_RequestGetActorID()
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local SelectItem = API_RequestGetNumber(1)
	local AgainFastID = API_RequestGetNumber(2)
	local Camp = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local NPCID = API_VarDataGetNumber(ActorID,0,32711) or API_GetMonsterID(AgainFastID)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712) or AgainFastID
	local Sexy = API_GetActorSex(ActorID)
	if SelectItem == 1 then
		if API_GetRelation(ActorID,0,8) == -1 and API_GetRelation(OtherID,0,8) == -1 then
			if API_ActorIsOnline(OtherID) then
				if API_GetActorMapID(ActorID) == API_GetActorMapID(OtherID) then
					if API_IsTeammate(ActorID,OtherID) then
						local TeamID = API_GetTeamID(ActorID)
						if API_GetTeamSize(TeamID) == 2 then
							if NPCID == 11725 then
								API_AddMagicToMap(MapID,71,78,197) 
								API_AddMagicToMap(MapID,70,74,197) 
								API_AddMagicToMap(MapID,67,71,197) 
								API_AddMagicToMap(MapID,62,72,197) 
								API_AddMagicToMap(MapID,59,76,197) 
								API_AddMagicToMap(MapID,58,79,197) 
							elseif NPCID == 11726 then
								API_AddMagicToMap(MapID,70,79,197) 
								API_AddMagicToMap(MapID,69,74,197) 
								API_AddMagicToMap(MapID,67,71,197) 
								API_AddMagicToMap(MapID,61,71,197) 
								API_AddMagicToMap(MapID,57,75,197) 
								API_AddMagicToMap(MapID,55,80,197) 
							end
							API_BroadcastScreenEffect(MapID,1)
							API_VarDataSetNumber(ActorID,1,19002,4)
							API_VarDataSetNumber(OtherID,1,19002,4)
							API_SendMonsterMsg(NPCFastID,0,'今天，我们站在上帝及众人面前，见证两个真心相爱的人结成一段美好的姻缘。')
							API_ActorBroadcastMsgEx(MapID,-1,0,17,'今天，我们站在上帝及众人面前，见证两个真心相爱的人结成一段美好的姻缘。')
							API_ActorCallBack(MapID,0,-1,'Marriage_Music')
							if Sexy == 1 then
								ActorID = API_RequestGetActorID()
							elseif Sexy == 2 then
								ActorID = API_VarDataGetNumber(ActorID,1,19001)
							end
							API_CreateTimerTriggerG(ActorID,NPCFastID,5,1,'Marriage_Parson_A')
						else
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
							API_ResponseWrite('<text>只有新人两个人组队才可以开始婚礼哦。</text><br>')
							API_ResponseWrite('<br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
						API_ResponseWrite('<text>您需要和您的爱人组队后才可以开始婚礼。</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
					end
				else 
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
					API_ResponseWrite('<text>您和您的爱人需要都在教堂内才可以开始婚礼。</text><br>')
					API_ResponseWrite('<br><a>确定</a>')
				end
			else
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您的爱人不在线或跟您不在同一个岛，无法开始婚礼。</text><br><br>')
				API_ResponseWrite('<a>我知道了</a>')
			end
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
			API_ResponseWrite('<text>您已经结婚了，不能再次举行婚礼。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	elseif SelectItem == 2 then
		if API_GetRelation(ActorID,0,8) == -1 and API_GetRelation(OtherID,0,8) == -1 then
			if API_ActorIsOnline(OtherID) then
				if API_GetActorMapID(ActorID) == API_GetActorMapID(OtherID) then
					if API_IsTeammate(ActorID,OtherID) then
						local TeamID = API_GetTeamID(ActorID)
						if API_GetTeamSize(TeamID) == 2 then
							API_VarDataSetNumber(ActorID,1,19002,5)
							API_VarDataSetNumber(OtherID,1,19002,5)
							API_ActorCallBack(MapID,0,-1,'Marriage_Music')
							API_BroadcastScreenEffect(MapID,1)
							if NPCID == 11725 then
								API_MonsterMoveTo(NPCFastID,2,{55,75,0,56,75,1})
							elseif NPCID == 11726 then
								API_MonsterMoveTo(NPCFastID,2,{54,76,0,55,76,1})
							end
							API_SendMonsterMsg(NPCFastID,0,'婚礼结束后记得来我这办理婚姻登记')
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
							API_ResponseWrite('<text>祝福您们，婚礼结束后记得来我这办理婚姻登记，否则是无法真正成为夫妻的哦。</text><br><br><text color="255,0,255">如果想指定证婚人，可以与我谈谈。</text><br><br>')
							API_ResponseWrite('<a>我知道了</a>')
							API_ResponseFlush(ActorID)
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
							API_ResponseWrite('<text>祝福您们，婚礼结束后记得来我这办理婚姻登记，否则是无法真正成为夫妻的哦。</text><br><br><text color="255,0,255">如果想指定证婚人，可以与我谈谈。</text><br><br>')
							API_ResponseWrite('<a>我知道了</a>')
							API_ResponseFlush(OtherID)
						else
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
							API_ResponseWrite('<text>只有新人两个人组队才可以举行婚礼哦。</text><br>')
							API_ResponseWrite('<br><a>确定</a>')
						end
					else
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
						API_ResponseWrite('<text>您需要和您的爱人组队后才可以举行婚礼。</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
					end
				else 
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
					API_ResponseWrite('<text>您和您的爱人需要都在教堂内才可以举行婚礼。</text><br>')
					API_ResponseWrite('<br><a>确定</a>')
				end
			else
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您的爱人不在线或跟您不在同一个岛，无法举行婚礼。</text><br><br>')
				API_ResponseWrite('<a>我知道了</a>')
			end
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
			API_ResponseWrite('<text>您已经结婚了，不能再次举行婚礼。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	else
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win ntype="5" close="0" balpha="0" rect="300,380,400,180"></win>')
		API_ResponseWrite('<text size="18">     您是否需要我为您们主持婚礼呢？</text><br><text> </text><br><br>')
		API_ResponseWrite('<text>            </text>')
		API_ResponseWrite('<a href="Marriage_JieHun?1=1">需要</a>')
		API_ResponseWrite('<text>                      </text>')
		API_ResponseWrite('<a href="Marriage_JieHun?1=2">不需要</a><br>') 
		API_ResponseWrite('<br><br><text>                        </text>')
		API_ResponseWrite('<a>稍等一会</a>') 
		API_ResponseFlush(ActorID)
	end
end

function Marriage_Music(ActorID)
	API_ActorPlaySoundEx(ActorID,33,1,1,0,0)
end

function Marriage_Parson_A(ActorID,NPCFastID)
	local MapID = API_GetMonsterMap(NPCFastID) 
	API_ActorBroadcastMsgEx(MapID,-1,0,17,'现在，他们就站在我们的面前。我将代表无上的神来主持这个仪式，把他们的爱意传达到对方的心里。') 
	API_SendMonsterMsg(NPCFastID,0,'现在，他们就站在我们的面前。我将代表无上的神来主持这个仪式，把他们的爱意传达到对方的心里。')
	API_CreateTimerTriggerG(ActorID,NPCFastID,5,1,'Marriage_Parson_B')
end

function Marriage_Parson_B(ActorID,NPCFastID)
	local MapID = API_GetMonsterMap(NPCFastID) 
	API_ActorBroadcastMsgEx(MapID,-1,0,17,'世界上最英俊的新郎，您愿意娶这个美丽的女人吗？') 
	API_SendMonsterMsg(NPCFastID,0,'世界上最英俊的新郎，您愿意娶这个美丽的女人吗？')
	API_CreateTimerTriggerG(ActorID,NPCFastID,5,1,'Marriage_Parson_C')
end

function Marriage_Parson_C(ActorID,NPCFastID)
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local MapID = API_GetMonsterMap(NPCFastID) 
	API_ActorBroadcastMsgEx(MapID,-1,0,17,'您愿意爱她、忠诚于她，无论她遭遇怎样的贫困、痛苦、失意，用您唯一的灵魂和生命去永远守护她吗？') 
	API_SendMonsterMsg(NPCFastID,0,'您愿意爱她、忠诚于她，无论她遭遇怎样的贫困、痛苦、失意，用您唯一的灵魂和生命去永远守护她吗？')
	API_ResponseWrite('<name></name>')
	API_ResponseWrite('<win ntype="5" close="0" balpha="0" rect="300,380,400,160"></win>')
	API_ResponseWrite('<text size="18">您愿意爱她、忠诚于她，无论她遭遇怎样的贫困、痛苦、失意，用您唯一的灵魂和生命去永远守护她吗？</text><br><br>')
	API_ResponseWrite('<text>           </text>')
	API_ResponseWrite('<a href="Marriage_Parson_L?1=1&2='..ActorID..'&3='..NPCFastID..'">我愿意！</a>')
	API_ResponseWrite('<text>                   </text>')
	API_ResponseWrite('<a href="Marriage_Parson_L?1=2&2='..ActorID..'&3='..NPCFastID..'">我不愿意！</a>')
	API_ResponseFlush(ActorID)
end

function Marriage_Parson_L()
	local SelectItem = API_RequestGetNumber(1)
	local ActorID = API_RequestGetNumber(2)
	local NPCFastID = API_RequestGetNumber(3)
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local MapID = API_GetActorMapID(ActorID)
	local NPCID = API_GetMonsterID(NPCFastID)
	if SelectItem == 1 then
		if API_GetRelation(ActorID,0,8) == -1 and API_GetRelation(OtherID,0,8) == -1 then
			if API_ActorIsOnline(OtherID) then
				if API_GetActorMapID(ActorID) == API_GetActorMapID(OtherID) then
					if API_IsTeammate(ActorID,OtherID) then
						local TeamID = API_GetTeamID(ActorID)
						if API_GetTeamSize(TeamID) == 2 then
							if NPCID == 11725 then
								API_AddMagicToMap(MapID,71,78,191) 
								API_AddMagicToMap(MapID,70,74,191) 
								API_AddMagicToMap(MapID,67,71,191) 
								API_AddMagicToMap(MapID,62,72,191) 
								API_AddMagicToMap(MapID,59,76,191) 
								API_AddMagicToMap(MapID,58,79,191) 
							elseif NPCID == 11726 then
								API_AddMagicToMap(MapID,70,79,191) 
								API_AddMagicToMap(MapID,69,74,191) 
								API_AddMagicToMap(MapID,67,71,191) 
								API_AddMagicToMap(MapID,61,71,191) 
								API_AddMagicToMap(MapID,57,75,191) 
								API_AddMagicToMap(MapID,55,80,191) 
							end
							API_ActorBroadcastMsgEx(MapID,-1,0,17,'欢呼吧！我们的新郎已经准备好了！') 
							API_SendMonsterMsg(NPCFastID,0,'欢呼吧！我们的新郎已经准备好了！')
							API_CreateTimerTriggerG(ActorID,NPCFastID,5,1,'Marriage_Parson_E')
						else
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
							API_ResponseWrite('<text>只有新人两个人组队才可以进行婚礼。</text><br>')
							API_ResponseWrite('<br><a>确定</a>')
							API_ResponseFlush(ActorID)
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
							API_ResponseWrite('<text>只有新人两个人组队才可以进行婚礼。</text><br>')
							API_ResponseWrite('<br><a>确定</a>')
							API_ResponseFlush(OtherID)
						end
					else
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
						API_ResponseWrite('<text>您需要和您的爱人组队后才可以进行婚礼。</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
						API_ResponseFlush(ActorID)
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
						API_ResponseWrite('<text>您需要和您的爱人组队后才可以进行婚礼。</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
						API_ResponseFlush(OtherID)
					end
				else 
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
					API_ResponseWrite('<text>您和您的爱人需要都在教堂内才可以进行婚礼。</text><br>')
					API_ResponseWrite('<br><a>确定</a>')
					API_ResponseFlush(ActorID)
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
					API_ResponseWrite('<text>您和您的爱人需要都在教堂内才可以进行婚礼。</text><br>')
					API_ResponseWrite('<br><a>确定</a>')
					API_ResponseFlush(OtherID)
				end
			else
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您的爱人不在线或跟您不在同一个岛，婚礼无法继续。</text><br><br>')
				API_ResponseWrite('<a>我知道了</a>')
				API_ResponseFlush(ActorID)
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您的爱人不在线或跟您不在同一个岛，婚礼无法继续。</text><br><br>')
				API_ResponseWrite('<a>我知道了</a>')
				API_ResponseFlush(OtherID)
			end
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
			API_ResponseWrite('<text>您已经结婚了，婚礼无法继续。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	elseif SelectItem == 2 then
		API_ActorBroadcastMsgEx(MapID,-1,0,17,'很遗憾，看起来我们的新郎还没有做好准备！我想您不该错过一个如此美丽的女人。') 
		API_SendMonsterMsg(NPCFastID,0,'很遗憾，看起来我们的新郎还没有做好准备！我想您不该错过一个如此美丽的女人。')
		API_VarDataSetNumber(ActorID,1,19002,2)
		API_VarDataSetNumber(OtherID,1,19002,2)
		API_CreateTimerTriggerG(ActorID,NPCFastID,3,1,'Marriage_Parson_D')
	end
end

function Marriage_Parson_D(ActorID,NPCFastID)
	local MapID = API_GetMonsterMap(NPCFastID) 
	API_ActorBroadcastMsgEx(MapID,-1,0,17,'现在，我宣布仪式结束！如果您们还想结为伴侣的话，就再来找我谈谈吧！') 
	API_SendMonsterMsg(NPCFastID,0,'现在，我宣布仪式结束！如果您们还想结为伴侣的话，就再来找我谈谈吧！')
end

function Marriage_Parson_E(ActorID,NPCFastID)
	local MapID = API_GetMonsterMap(NPCFastID) 
	API_ActorBroadcastMsgEx(MapID,-1,0,17,'那么……世界上最美丽的新娘，您愿意成为这个男人的伴侣吗？') 
	API_SendMonsterMsg(NPCFastID,0,'那么……世界上最美丽的新娘，您愿意成为这个男人的伴侣吗？')
	API_CreateTimerTriggerG(ActorID,NPCFastID,5,1,'Marriage_Parson_F')
end

function Marriage_Parson_F(ActorID,NPCFastID)
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local MapID = API_GetMonsterMap(NPCFastID) 
	API_ActorBroadcastMsgEx(MapID,-1,0,17,'您愿意爱他、忠诚于他，无论他遭遇怎样的贫困、痛苦、失意，陪伴他一直走下去吗？') 
	API_SendMonsterMsg(NPCFastID,0,'您愿意爱他、忠诚于他，无论他遭遇怎样的贫困、痛苦、失意，陪伴他一直走下去吗？')
	API_ResponseWrite('<name></name>')
	API_ResponseWrite('<win ntype="5" close="0" balpha="0" rect="300,380,400,160"></win>')
	API_ResponseWrite('<text size="18">您愿意爱他、忠诚于他，无论他遭遇怎样的贫困、痛苦、失意，陪伴他一直走下去吗？</text><br><br>')
	API_ResponseWrite('<text>           </text>')
	API_ResponseWrite('<a href="Marriage_Parson_G?1=1&2='..ActorID..'&3='..NPCFastID..'">我愿意！</a>')
	API_ResponseWrite('<text>                   </text>')
	API_ResponseWrite('<a href="Marriage_Parson_G?1=2&2='..ActorID..'&3='..NPCFastID..'">我不愿意！</a>')
	API_ResponseFlush(OtherID)
end

function Marriage_Parson_G()
	local OtherID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local ActorID = API_RequestGetNumber(2)
	local NPCFastID = API_RequestGetNumber(3)
	local MapID = API_GetActorMapID(ActorID)
	local NPCID = API_GetMonsterID(NPCFastID)
	if SelectItem == 1 then
		if API_GetRelation(ActorID,0,8) == -1 and API_GetRelation(OtherID,0,8) == -1 then
			if API_ActorIsOnline(ActorID) then
				if API_GetActorMapID(ActorID) == API_GetActorMapID(OtherID) then
					if API_IsTeammate(ActorID,OtherID) then
						local TeamID = API_GetTeamID(ActorID)
						if API_GetTeamSize(TeamID) == 2 then
							if NPCID == 11725 then
								API_AddMagicToMap(MapID,71,78,191) 
								API_AddMagicToMap(MapID,70,74,191) 
								API_AddMagicToMap(MapID,67,71,191) 
								API_AddMagicToMap(MapID,62,72,191) 
								API_AddMagicToMap(MapID,59,76,191) 
								API_AddMagicToMap(MapID,58,79,191) 
							elseif NPCID == 11726 then
								API_AddMagicToMap(MapID,70,79,191) 
								API_AddMagicToMap(MapID,69,74,191) 
								API_AddMagicToMap(MapID,67,71,191) 
								API_AddMagicToMap(MapID,61,71,191) 
								API_AddMagicToMap(MapID,57,75,191) 
								API_AddMagicToMap(MapID,55,80,191) 
							end
							API_ActorBroadcastMsgEx(MapID,-1,0,17,'太棒了，我们的新娘已经准备好了！') 
							API_SendMonsterMsg(NPCFastID,0,'太棒了，我们的新娘已经准备好了！')
							API_CreateTimerTriggerG(ActorID,NPCFastID,5,1,'Marriage_Parson_J')
						else
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
							API_ResponseWrite('<text>只有新人两个人组队才可以进行婚礼。</text><br>')
							API_ResponseWrite('<br><a>确定</a>')
							API_ResponseFlush(ActorID)
							API_ResponseWrite('<name></name>')
							API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
							API_ResponseWrite('<text>只有新人两个人组队才可以进行婚礼。</text><br>')
							API_ResponseWrite('<br><a>确定</a>')
							API_ResponseFlush(OtherID)
						end
					else
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
						API_ResponseWrite('<text>您需要和您的爱人组队后才可以进行婚礼。</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
						API_ResponseFlush(ActorID)
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
						API_ResponseWrite('<text>您需要和您的爱人组队后才可以进行婚礼。</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
						API_ResponseFlush(OtherID)
					end
				else 
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
					API_ResponseWrite('<text>您和您的爱人需要都在教堂内才可以进行婚礼。</text><br>')
					API_ResponseWrite('<br><a>确定</a>')
					API_ResponseFlush(ActorID)
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
					API_ResponseWrite('<text>您和您的爱人需要都在教堂内才可以进行婚礼。</text><br>')
					API_ResponseWrite('<br><a>确定</a>')
					API_ResponseFlush(OtherID)
				end
			else
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您的爱人不在线或跟您不在同一个岛，婚礼无法继续。</text><br><br>')
				API_ResponseWrite('<a>我知道了</a>')
				API_ResponseFlush(ActorID)
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您的爱人不在线或跟您不在同一个岛，婚礼无法继续。</text><br><br>')
				API_ResponseWrite('<a>我知道了</a>')
				API_ResponseFlush(OtherID)
			end
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
			API_ResponseWrite('<text>您已经结婚了，婚礼无法继续。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	elseif SelectItem == 2 then
		API_ActorBroadcastMsgEx(MapID,-1,0,17,'很遗憾，看起来我们的新娘还没有做好准备！我想您不该错过一个如此优秀的男人。') 
		API_SendMonsterMsg(NPCFastID,0,'很遗憾，看起来我们的新娘还没有做好准备！我想您不该错过一个如此优秀的男人。')
		API_VarDataSetNumber(ActorID,1,19002,2)
		API_VarDataSetNumber(OtherID,1,19002,2)
		API_CreateTimerTriggerG(ActorID,NPCFastID,3,1,'Marriage_Parson_D')
	end
end

function Marriage_Parson_J(ActorID,NPCFastID)
	local MapID = API_GetMonsterMap(NPCFastID) 
	API_ActorBroadcastMsgEx(MapID,-1,0,17,'现在，我以神的名义宣布这两个有情人结为伴侣。从今以后，您们将受到爱神的祝福，愿您们相携到老，永远忠诚于对方……！') 
	API_SendMonsterMsg(NPCFastID,0,'现在，我以神的名义宣布这两个有情人结为伴侣。从今以后，您们将受到爱神的祝福，愿您们相携到老，永远忠诚于对方……！')
	API_CreateTimerTriggerG(ActorID,NPCFastID,8,1,'Marriage_Parson_K')
end

function Marriage_Parson_K(ActorID,NPCFastID)
	local MapID = API_GetActorMapID(ActorID)
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local NPCID = API_GetMonsterID(NPCFastID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local Time = ''..Year..' 年 '..Month..' 月 '..Day..' 日 '..Hour..' 时 '..Minute..' 分 '..Second..' 秒'
	if API_GetRelation(ActorID,0,8) == -1 and API_GetRelation(OtherID,0,8) == -1 then
		if API_ActorIsOnline(ActorID) and API_ActorIsOnline(OtherID) then
			if NPCID == 11725 then
				API_AddMagicToMap(MapID,71,78,194) 
				API_AddMagicToMap(MapID,71,76,194) 
				API_AddMagicToMap(MapID,70,74,194) 
				API_AddMagicToMap(MapID,68,73,194) 
				API_AddMagicToMap(MapID,67,71,194) 
				API_AddMagicToMap(MapID,64,71,194) 
				API_AddMagicToMap(MapID,62,72,194) 
				API_AddMagicToMap(MapID,61,73,194) 
				API_AddMagicToMap(MapID,60,74,194) 
				API_AddMagicToMap(MapID,59,76,194) 
				API_AddMagicToMap(MapID,58,78,194) 
				API_AddMagicToMap(MapID,58,80,194) 
			elseif NPCID == 11726 then
				API_AddMagicToMap(MapID,70,79,194) 
				API_AddMagicToMap(MapID,69,75,194)
				API_AddMagicToMap(MapID,68,73,194) 
				API_AddMagicToMap(MapID,66,71,194) 
				API_AddMagicToMap(MapID,62,70,194) 
				API_AddMagicToMap(MapID,59,73,194) 
				API_AddMagicToMap(MapID,57,76,194) 
				API_AddMagicToMap(MapID,55,80,194) 
			end
			API_ActorBroadcastMsgEx(MapID,-1,0,17,'尽情的欢呼吧！在场的所有人，把你们的祝福献给这对情侣吧。焰火将为您们而绽放！') 
			API_SendMonsterMsg(NPCFastID,0,'尽情的欢呼吧！在场的所有人，把你们的祝福献给这对情侣吧。焰火将为您们而绽放！')
			--API_AddRelation(ActorID,OtherID,5,1,1)
			API_AddRelationNoQuery(ActorID,OtherID,5,1,1)
			API_CreateTimerTriggerG(MapID,NPCFastID,4,1,'Marriage_Parson_M')
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
			API_ResponseWrite('<text>您的爱人不在线或跟您不在同一个岛，婚礼无法继续。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
			API_ResponseFlush(ActorID)
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
			API_ResponseWrite('<text>您的爱人不在线或跟您不在同一个岛，婚礼无法继续。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
			API_ResponseFlush(OtherID)
		end
	else
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
		API_ResponseWrite('<text>您已经结婚了，婚礼无法继续。</text><br><br>')
		API_ResponseWrite('<a>我知道了</a>')
	end
end

function Marriage_Parson_M(MapID,NPCFastID)
	local NPCID = API_GetMonsterID(NPCFastID)
	if NPCID == 11725 then
		API_AddMagicToMap(MapID,54,52,195) 
		API_AddMagicToMap(MapID,58,52,195) 
		API_AddMagicToMap(MapID,62,52,195) 
		API_AddMagicToMap(MapID,70,52,195) 
		API_AddMagicToMap(MapID,74,52,195) 
		API_AddMagicToMap(MapID,78,52,195) 
	elseif NPCID == 11726 then
		API_AddMagicToMap(MapID,51,52,195) 
		API_AddMagicToMap(MapID,56,52,195) 
		API_AddMagicToMap(MapID,61,52,195) 
		API_AddMagicToMap(MapID,68,51,195) 
		API_AddMagicToMap(MapID,72,51,195) 
		API_AddMagicToMap(MapID,77,51,195)
	end
	API_CreateTimerTriggerG(MapID,NPCFastID,2,1,'Marriage_Parson_N')
end

function Marriage_Parson_N(MapID,NPCFastID)
	local NPCID = API_GetMonsterID(NPCFastID)
	if NPCID == 11725 then
		API_AddMagicToMap(MapID,54,60,197) 
		API_AddMagicToMap(MapID,58,60,197) 
		API_AddMagicToMap(MapID,62,60,197) 
		API_AddMagicToMap(MapID,70,60,197) 
		API_AddMagicToMap(MapID,74,60,197) 
		API_AddMagicToMap(MapID,78,60,197) 
	elseif NPCID == 11726 then
		API_AddMagicToMap(MapID,51,60,197) 
		API_AddMagicToMap(MapID,56,60,197) 
		API_AddMagicToMap(MapID,61,60,197) 
		API_AddMagicToMap(MapID,68,59,197) 
		API_AddMagicToMap(MapID,72,59,197) 
		API_AddMagicToMap(MapID,77,59,197) 
	end
	API_CreateTimerTriggerG(MapID,NPCFastID,2,1,'Marriage_Parson_O')
end

function Marriage_Parson_O(MapID,NPCFastID)
	local NPCID = API_GetMonsterID(NPCFastID)
	if NPCID == 11725 then
		API_AddMagicToMap(MapID,54,66,194) 
		API_AddMagicToMap(MapID,58,66,194) 
		API_AddMagicToMap(MapID,62,66,194) 
		API_AddMagicToMap(MapID,70,66,194) 
		API_AddMagicToMap(MapID,74,66,194) 
		API_AddMagicToMap(MapID,78,66,194) 
	elseif NPCID == 11726 then
		API_AddMagicToMap(MapID,51,66,194) 
		API_AddMagicToMap(MapID,56,66,194) 
		API_AddMagicToMap(MapID,61,66,194) 
		API_AddMagicToMap(MapID,68,65,194) 
		API_AddMagicToMap(MapID,72,65,194) 
		API_AddMagicToMap(MapID,77,65,194) 
	end
	API_CreateTimerTriggerG(MapID,NPCFastID,3,1,'Marriage_Parson_P')
end

function Marriage_Parson_P(MapID,NPCFastID)
	local NPCID = API_GetMonsterID(NPCFastID)
	if NPCID == 11725 then
		API_AddMagicToMap(MapID,63,74,192) 
		API_AddMagicToMap(MapID,63,76,192) 
		API_AddMagicToMap(MapID,64,77,192) 
		API_AddMagicToMap(MapID,66,77,192) 
		API_AddMagicToMap(MapID,68,75,192) 
		API_AddMagicToMap(MapID,69,73,192) 
		API_AddMagicToMap(MapID,69,71,192) 
		API_AddMagicToMap(MapID,69,68,192) 
		API_AddMagicToMap(MapID,66,68,192) 
		API_AddMagicToMap(MapID,64,68,192) 
		API_AddMagicToMap(MapID,62,69,192) 
		API_AddMagicToMap(MapID,60,71,192) 
		API_AddMagicToMap(MapID,60,73,192) 
		API_AddMagicToMap(MapID,61,74,192) 
	elseif NPCID == 11726 then
		API_AddMagicToMap(MapID,61,74,193) 
		API_AddMagicToMap(MapID,61,76,193) 
		API_AddMagicToMap(MapID,62,77,193) 
		API_AddMagicToMap(MapID,64,77,193) 
		API_AddMagicToMap(MapID,66,75,193) 
		API_AddMagicToMap(MapID,67,73,193) 
		API_AddMagicToMap(MapID,67,71,193) 
		API_AddMagicToMap(MapID,67,68,193) 
		API_AddMagicToMap(MapID,64,68,193) 
		API_AddMagicToMap(MapID,62,68,193) 
		API_AddMagicToMap(MapID,60,69,193) 
		API_AddMagicToMap(MapID,58,71,193) 
		API_AddMagicToMap(MapID,58,73,193) 
		API_AddMagicToMap(MapID,59,74,193) 
	end
end

function Marriage_DengJi() --结婚登记
	local ActorID = API_RequestGetActorID()
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 1 then
		if API_ActorIsOnline(OtherID) then
			if API_GetActorMapID(ActorID) == API_GetActorMapID(OtherID) then
				if API_IsTeammate(ActorID,OtherID) then
					local TeamID = API_GetTeamID(ActorID)
					if API_GetTeamSize(TeamID) == 2 then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<win ntype="5" close="0" balpha="0" rect="300,380,400,160"></win>')
						API_ResponseWrite('<text>您的爱人希望和您办理婚姻登记，您是否愿意呢？</text><br><br>')
						API_ResponseWrite('<a href="Marriage_DengJiEr?1=1&2='..ActorID..'">是的，我愿意！</a>')
						API_ResponseWrite('<text>                   </text>')
						API_ResponseWrite('<a href="Marriage_DengJiEr?1=2&2='..ActorID..'">我想还是算了……</a>')
						API_ResponseFlush(OtherID)
					else
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
						API_ResponseWrite('<text>只有未婚夫妻两个人组队才可以办理婚姻登记。</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
					end
				else
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
					API_ResponseWrite('<text>您需要和您的爱人组队后才可以办理婚姻登记。</text><br>')
					API_ResponseWrite('<br><a>确定</a>')
				end
			else 
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您和您的爱人需要在同一个地图内才可以办理婚姻登记。</text><br>')
				API_ResponseWrite('<br><a>确定</a>')
			end
		else 
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
			API_ResponseWrite('<text>您的爱人不在线或跟您不在同一个岛，无法和您办理婚姻登记。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	elseif SelectItem == 2 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
		API_ResponseWrite('<text>很遗憾……</text><br><br>')
		API_ResponseWrite('<a>取消</a>')
		API_ResponseFlush(ActorID)
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
		API_ResponseWrite('<text>很遗憾，您的爱人不愿意和您办理婚姻登记。</text><br><br>')
		API_ResponseWrite('<a>我知道了</a>')
		API_ResponseFlush(OtherID)
	else
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
		API_ResponseWrite('<text>您想和您的爱人办理婚姻登记吗？</text><br><br>')
		API_ResponseWrite('<a href="Marriage_DengJi?1=1">是的，我要办理！</a>')
		API_ResponseWrite('<text>                   </text>')
		API_ResponseWrite('<a href="Marriage_DengJi?1=2">我想还是算了……</a>')
	end
end

function Marriage_DengJiEr()
	local OtherID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	local ActorID = API_RequestGetNumber(2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local Time = ''..Year..' 年 '..Month..' 月 '..Day..' 日 '..Hour..' 时 '..Minute..' 分 '..Second..' 秒'
	if SelectItem == 1 then
		if API_ActorIsOnline(ActorID) then
			if API_GetActorMapID(ActorID) == API_GetActorMapID(OtherID) then
				if API_IsTeammate(ActorID,OtherID) then
					local TeamID = API_GetTeamID(ActorID)
					if API_GetTeamSize(TeamID) == 2 then
						--API_AddRelation(ActorID,OtherID,5,1,1) 
						API_AddRelationNoQuery(ActorID,OtherID,5,1,1)
					else
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
						API_ResponseWrite('<text>只有未婚夫妻两个人组队才可以办理婚姻登记。</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
					end
				else
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
					API_ResponseWrite('<text>您需要和您的爱人组队后才可以办理婚姻登记。</text><br>')
					API_ResponseWrite('<br><a>确定</a>')
				end
			else 
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
				API_ResponseWrite('<text>您和您的爱人需要在同一个地图内才可以办理婚姻登记。</text><br>')
				API_ResponseWrite('<br><a>确定</a>')
			end
		else 
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
			API_ResponseWrite('<text>您的爱人不在线或跟您不在同一个岛，无法和您办理婚姻登记。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	elseif SelectItem == 2 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win close="0" balpha="0" rect="300,380,400,160"></win>')
		API_ResponseWrite('<text>很遗憾，您爱人不愿意和您办理婚姻登记。</text><br><br>')
		API_ResponseWrite('<a>我知道了</a>')
		API_ResponseFlush(ActorID)
	end
end

function Marriage_LiHun() --离婚
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local OtherID = API_GetRelation(ActorID,0,8)
	local LiHunZT = API_VarDataGetNumber(ActorID,1,19003)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local LHYear = Year
	local LHMonth = Month
	local LHDay = Day
	local LHHour = Hour
	local LHMinute = Minute
	local LHSecond = Second
	local Time = ''..Year..'年'..Month..' 月'..Day..' 日'..Hour..'时'..Minute..'分'..Second..' 秒'
	local LHYMD = LHYear * 10000 + LHMonth * 100 + LHDay
	local LHHMS = LHHour * 10000 + LHMinute * 100 + LHSecond
	local QDYMD = API_VarDataGetNumber(ActorID,1,19006)
	local QDHMS = API_VarDataGetNumber(ActorID,1,19007)
	local QDYear = math.floor(QDYMD/10000)
	local QDMonthDay = math.mod(QDYMD,10000)
	local QDMonth = math.floor(QDMonthDay/100)
	local QDDay = math.mod(QDMonthDay,100)
	local QDHour = math.floor(QDHMS/10000)
	local QDMinuteSecond = math.mod(QDHMS,10000)
	local QDMinute = math.floor(QDMinuteSecond/100)
	local QDSecond = math.mod(QDMinuteSecond,100)
	local PDtime = API_DiffDatatime(QDYear,QDMonth,QDDay,QDHour,QDMinute,QDSecond)
	local FenShouFei = 100000
	local HaoGanDu = API_GetRelation(ActorID,OtherID,2)
	local JN1Table = Marriage_FuQiJiNengTable[1]
	local JN2Table = Marriage_FuQiJiNengTable[2]
	local JN3Table = Marriage_FuQiJiNengTable[3]
	--离婚，判断各种条件，设置双方相关交互数据
	--需要存储双方离婚时间，以便日后确认离婚，要加交互数据判断
	--还要加一个函数，上线时判断对方的交互数据是否结婚，否就将自己的婚姻状态解除
	--强制离婚时给另一半发送一封信，但现在不支持离线收信
	if XuanZe == 1 then
		if LiHunZT == 0 then
			API_ResponseWrite('<text>请选择申请离婚的方式：</text><br>')
			API_ResponseWrite('<br><a href="Marriage_LiHun?1=2">申请强制离婚</a><br>')
			API_ResponseWrite('<br><a href="Marriage_LiHun?1=3">申请协议离婚</a><br>')
			API_ResponseWrite('<br><a>取消</a>')
		elseif LiHunZT == 1 then
			if PDtime > -604800 then
				API_ResponseWrite('<text>申请强制离婚时间还没到七天，您想做什么呢？</text><br>')
				API_ResponseWrite('<br><a href="Marriage_LiHun?1=7">撤消申请</a><br>')
				API_ResponseWrite('<br><a>取消</a>')
			elseif PDtime < -604800 and PDtime > -1296000 then
				API_ResponseWrite('<text>您真的确定要强制离婚吗？</text><text color="255,0,255">（申请强制离婚后，需要在申请后的7--15天内找婚礼助手再次确认强制离婚才能生效，并且将会扣除申请人强制离婚费用 '..FenShouFei..'金币。离婚后，双方的婚姻关系、夫妻称号、夫妻技能将被取消，并且双方好感度降为1，如好感度小于1，则不变。)</text><br>')
				API_ResponseWrite('<br><a href="Marriage_LiHun?1=6">强制离婚</a><br>')
				API_ResponseWrite('<br><a href="Marriage_LiHun?1=7">撤消申请</a><br>')
				API_ResponseWrite('<br><a>取消</a>')
			elseif PDtime < -1296000 then
				API_ResponseWrite('<text>申请强制离婚时间已经超过十五天，请点击“撤消申请”按钮结束申请。</text><br>')
				API_ResponseWrite('<br><a href="Marriage_LiHun?1=7">撤消申请</a><br>')
				API_ResponseWrite('<br><a>取消</a>')
			end
		elseif LiHunZT == 2 then
			if PDtime > -259200 then
				API_ResponseWrite('<text>申请协议离婚时间还没到三天，您想做什么呢？</text><br>')
				API_ResponseWrite('<br><a href="Marriage_LiHun?1=9">撤消申请</a><br>')
				API_ResponseWrite('<br><a>取消</a>')
			elseif PDtime < -259200 and PDtime > -864000 then
				API_ResponseWrite('<text>您真的确定要协议离婚吗？</text><text color="255,0,255">（离婚后，双方的婚姻关系、夫妻称号、夫妻技能将被取消，并且双方好感度降为500，如好感度小于500，则不变。)</text><br>')
				API_ResponseWrite('<br><a href="Marriage_LiHun?1=8">协议离婚</a><br>')
				API_ResponseWrite('<br><a href="Marriage_LiHun?1=9">撤消申请</a><br>')
				API_ResponseWrite('<br><a href="Marriage_LiHun?1=10">单方面撤消申请</a><br>')
				API_ResponseWrite('<br><a>取消</a>')
			elseif PDtime < -864000 then
				API_ResponseWrite('<text>申请协议离婚时间已经超过十天，请点击“撤消申请”按钮结束申请。</text><br>')
				API_ResponseWrite('<br><a href="Marriage_LiHun?1=10">撤消申请</a><br>')
				API_ResponseWrite('<br><a>取消</a>')
			end
		end
	elseif XuanZe == 2 then
		API_ResponseWrite('<text>您真的希望用强制离婚的方式结束您的婚姻吗？</text><text color="255,0,255">（申请强制离婚后，需要在申请后的7--15天内找婚礼助手再次确认强制离婚才能生效，并且将会扣除申请人强制离婚费用'..FenShouFei..'金币。	离婚后，双方的婚姻关系、夫妻称号、夫妻技能将被取消，并且双方好感度降为1，如好感度小于1，则不变。)</text><br>')
		API_ResponseWrite('<br><a href="Marriage_LiHun?1=4">我要强制离婚</a><br>')
		API_ResponseWrite('<br><a>取消</a>')
	elseif XuanZe == 3 then
		API_ResponseWrite('<text>您真的希望用协议离婚的方式结束您的婚姻吗？</text><text color="255,0,255">（申请协议离婚后，双方需要在申请后的3--10天内组队找婚礼助手再次确认协议离婚才能生效。离婚后，双方的婚姻关系、夫妻称号、夫妻技能将被取消，并且双方好感度降为500，如好感度小于500，则不变。)</text><br>')
		API_ResponseWrite('<br><a href="Marriage_LiHun?1=5">我要协议离婚</a><br>')
		API_ResponseWrite('<br><a>取消</a>')
	elseif XuanZe == 4 then
		API_VarDataSetNumber(ActorID,1,19003,1)
		API_VarDataSetNumber(ActorID,1,19006,LHYMD)
		API_VarDataSetNumber(ActorID,1,19007,LHHMS)
		API_SendActorMoneyMail_UnLine('#'..OtherID..'',0,'离婚通知书','您的伴侣在'..Time..'申请强制离婚，如对方在申请后的7--15天内再次确认强制离婚，那么您们的婚姻关系、夫妻称号、夫妻技能将被取消，并且双方好感度降为1，如好感度小于1，则不变。')
		API_ResponseWrite('<text>请在申请后的7--15天内找我再次确认强制离婚，否则申请将被取消，确认强制离婚时，将会扣除申请人强制离婚费用'..FenShouFei..'金币。离婚后，双方的婚姻关系、夫妻称号、夫妻技能将被取消，并且双方好感度降为1，如好感度小于1，则不变。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
	elseif XuanZe == 5 then
		if API_ActorIsOnline(OtherID) then
			if API_GetActorMapID(ActorID) == API_GetActorMapID(OtherID) then
				if API_IsTeammate(ActorID,OtherID) then
					local TeamID = API_GetTeamID(ActorID)
					if API_GetTeamSize(TeamID) == 2 then
						API_ResponseWrite('<text>请等待对方确认。</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
						API_ResponseFlush(ActorID)
						API_ResponseWrite('<text>您的伴侣正在申请协议离婚，请问您是否同意呢？</text><text color="255,0,255">（申请协议离婚后，双方需要在申请后的3--10天内组队找婚礼助手再次确认协议离婚才能生效。离婚后，双方的婚姻关系、夫妻称号、夫妻技能将被取消，并且双方好感度降为500，如好感度小于500，则不变。)</text><br>')
						API_ResponseWrite('<br><a href="Marriage_LiHunEr?1=1&2='..ActorID..'&3='..LHYMD..'&4='..LHHMS..'">我同意</a><br>')
						API_ResponseWrite('<br><a href="Marriage_LiHunEr?1=2&2='..ActorID..'&3='..LHYMD..'&4='..LHHMS..'">我不同意</a>')
						API_ResponseFlush(OtherID)
					else
						API_ResponseWrite('<text>只有申请协议离婚双方两人组队才可以申请协议离婚。</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
					end
				else
					API_ResponseWrite('<text>申请协议离婚双方需要组队后才可以申请协议离婚。</text><br>')
					API_ResponseWrite('<br><a>确定</a>')
				end
			else 
				API_ResponseWrite('<text>申请协议离婚双方需要在同一张地图内才可以申请。</text><br>')
				API_ResponseWrite('<br><a>确定</a>')
			end
		else 
			API_ResponseWrite('<text>您的伴侣不在线，无法申请协议离婚。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	elseif XuanZe == 6 then
		if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) >= FenShouFei then
			if API_ActorAddMoney(ActorID,-FenShouFei,MarriageSystemTaskID,'强制离婚扣钱') then
				if HaoGanDu > 1 then
					API_UpdateRelation(ActorID,OtherID,2,1)
				end
				if API_IsTeammate(ActorID,OtherID) then
					HaoYouZhuDuiXiTong_UpdateRelation(ActorID,OtherID)
					HaoYouZhuDuiXiTong_UpdateRelation(OtherID,ActorID)
				end
				API_UpdateRelation(ActorID,OtherID,3,6)
				API_SendActorMoneyMail_UnLine('#'..OtherID..'',0,'离婚通知书','您的伴侣在'..Time..'办理了强制离婚，您们的婚姻关系、夫妻称号、夫妻技能已被取消，并且双方好感度降为1，如好感度小于1，则不变。')
				API_VarDataSetNumber(ActorID,1,19001,0)
				API_VarDataSetNumber(ActorID,1,19002,0)
				API_VarDataSetNumber(ActorID,1,19003,0)
				API_VarDataSetNumber(ActorID,1,19004,0)
				API_VarDataSetNumber(ActorID,1,19005,0)
				API_VarDataSetNumber(ActorID,1,19006,0)
				API_VarDataSetNumber(ActorID,1,19007,0)
				API_VarDataSetNumber(ActorID,1,19008,0)
				API_VarDataSetNumber(ActorID,1,19009,0)
				API_VarDataSetNumber(ActorID,1,19010,0)
				API_VarDataSetNumber(ActorID,1,19011,0)
				API_VarDataSetNumber(ActorID,1,19013,0)
				API_DelRelation(ActorID,0)
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = FenShouFei
				else
					GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] + FenShouFei
				end
			end
		else
			API_ActorSendMsg(ActorID,2,'您身上的金币不足'..FenShouFei..'，不能强制离婚。')
		end
	elseif XuanZe == 7 then
		API_VarDataSetNumber(ActorID,1,19003,0)
		API_VarDataSetNumber(ActorID,1,19006,0)
		API_VarDataSetNumber(ActorID,1,19007,0)
		API_ResponseWrite('<text>您已经撤消强制离婚的申请。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
	elseif XuanZe == 8 then
		if API_ActorIsOnline(OtherID) then
			if API_GetActorMapID(ActorID) == API_GetActorMapID(OtherID) then
				if API_IsTeammate(ActorID,OtherID) then
					local TeamID = API_GetTeamID(ActorID)
					if API_GetTeamSize(TeamID) == 2 then
						if API_VarDataGetNumber(ActorID,1,19003) == API_VarDataGetNumber(OtherID,1,19003) then
							API_ResponseWrite('<text>请等待对方确认。</text><br>')
							API_ResponseWrite('<br><a>确定</a>')
							API_ResponseFlush(ActorID)
							API_ResponseWrite('<text>您的伴侣正在办理协议离婚，请问您是否同意呢？</text><text color="255,0,255">（离婚后，双方的婚姻关系、夫妻称号、夫妻技能将被取消，并且双方好感度降为500，如好感度小于500，则不变。)</text><br>')
							API_ResponseWrite('<br><a href="Marriage_LiHunEr?1=3&2='..ActorID..'">我同意</a><br>')
							API_ResponseWrite('<br><a href="Marriage_LiHunEr?1=4&2='..ActorID..'">我不同意</a>')
							API_ResponseFlush(OtherID)
						else
							API_ResponseWrite('<text>您的伴侣已经单方面撤消申请，您现在可以撤消申请。</text><br>')
							API_ResponseWrite('<br><a href="Marriage_LiHun?1=10">撤消申请</a>')
						end
					else
						API_ResponseWrite('<text>只有办理协议离婚双方两人组队才可以办理协议离婚。</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
					end
				else
					API_ResponseWrite('<text>办理协议离婚双方需要组队后才可以办理协议离婚。</text><br>')
					API_ResponseWrite('<br><a>确定</a>')
				end
			else 
				API_ResponseWrite('<text>办理协议离婚双方需要在同一张地图内才可以办理。</text><br>')
				API_ResponseWrite('<br><a>确定</a>')
			end
		else 
			API_ResponseWrite('<text>您的伴侣不在线，无法办理协议离婚。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	elseif XuanZe == 9 then
		if API_ActorIsOnline(OtherID) then
			if API_GetActorMapID(ActorID) == API_GetActorMapID(OtherID) then
				if API_IsTeammate(ActorID,OtherID) then
					local TeamID = API_GetTeamID(ActorID)
					if API_GetTeamSize(TeamID) == 2 then
						if API_VarDataGetNumber(ActorID,1,19003) == API_VarDataGetNumber(OtherID,1,19003) then
							API_ResponseWrite('<text>请等待对方确认。</text><br>')
							API_ResponseWrite('<br><a>确定</a>')
							API_ResponseFlush(ActorID)
							API_ResponseWrite('<text>您的伴侣正在申请撤消协议离婚，请问您是否同意呢？</text><text color="255,0,255">（离婚后，双方的婚姻关系、夫妻称号、夫妻技能将被取消，并且双方好感度降为500，如好感度小于500，则不变。)</text><br>')
							API_ResponseWrite('<br><a href="Marriage_LiHunEr?1=5&2='..ActorID..'">我同意</a><br>')
							API_ResponseWrite('<br><a href="Marriage_LiHunEr?1=6&2='..ActorID..'">我不同意</a>')
							API_ResponseFlush(OtherID)
						else
							API_ResponseWrite('<text>您的伴侣已经单方面撤消申请，您现在可以撤消申请。</text><br>')
							API_ResponseWrite('<br><a href="Marriage_LiHun?1=10">撤消申请</a>')
						end
					else
						API_ResponseWrite('<text>只有撤消协议离婚双方两人组队才可以撤消申请。</text><br>')
						API_ResponseWrite('<br><a>确定</a>')
					end
				else
					API_ResponseWrite('<text>撤消协议离婚双方需要组队后才可以撤消申请。</text><br>')
					API_ResponseWrite('<br><a>确定</a>')
				end
			else 
				API_ResponseWrite('<text>撤消协议离婚双方需要在同一张地图内才可以撤消申请。</text><br>')
				API_ResponseWrite('<br><a>确定</a>')
			end
		else 
			API_ResponseWrite('<text>您的伴侣不在线，无法撤消申请。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	elseif XuanZe == 10 then
		API_SendActorMoneyMail_UnLine('#'..OtherID..'',0,'撤消协议通知书','您的伴侣在'..Time..'单方面撤消了协议离婚申请，您现在可以找婚礼助手撤消自己的协议离婚申请。')
		API_VarDataSetNumber(ActorID,1,19003,0)
		API_VarDataSetNumber(ActorID,1,19006,0)
		API_VarDataSetNumber(ActorID,1,19007,0)
		API_ResponseWrite('<text>您已经撤消协议离婚的申请。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
	else
		API_ResponseWrite('<text>长久以来，爱神见证了你们的相爱，目睹你们曾多么温柔地对待彼此，给对方带去无尽的快乐。</text><br>')
		API_ResponseWrite('<text>而现在，就在这几乎要熄灭的爱情中，爱神还能看到关于往昔的一丝丝甜蜜记忆。</text><br>')
		API_ResponseWrite('<text>就算你们曾经犯下再多的错误，就算一切已无法挽回，可爱神相信你们全心全意的爱过。直到现在，你还有转身重新拥抱他的机会。</text><br>')
		API_ResponseWrite('<text>如果你已经累了，疲倦了，请对彼此道一句分手快乐吧。在不远的未来，你们都将得到爱神真正的赐福。</text><br>')
		API_ResponseWrite('<br><text color="255,0,255">您确定要申请离婚吗？</text><br>')
		API_ResponseWrite('<br><a href="Marriage_LiHun?1=1">确定申请离婚</a><br>')
		API_ResponseWrite('<br><a href="Marriage_ZhuShou_PanDuan_Title">返回</a>')
	end
end

function Marriage_LiHunEr()
	local OtherID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local ActorID = API_RequestGetNumber(2)
	local LHYMD = API_RequestGetNumber(3)
	local LHHMS = API_RequestGetNumber(4)
	local HaoGanDu = API_GetRelation(ActorID,OtherID,2)
	local HaoGanDuNv = API_GetRelation(OtherID,ActorID,2)
	if XuanZe == 1 then
		if API_ActorIsOnline(ActorID) then
			API_VarDataSetNumber(ActorID,1,19003,2)
			API_VarDataSetNumber(ActorID,1,19006,LHYMD)
			API_VarDataSetNumber(ActorID,1,19007,LHHMS)
			API_VarDataSetNumber(OtherID,1,19003,2)
			API_VarDataSetNumber(OtherID,1,19006,LHYMD)
			API_VarDataSetNumber(OtherID,1,19007,LHHMS)
			API_ResponseWrite('<text>请在申请后的3--10天内组队找我再次确认协议离婚，否则申请将被取消。离婚后，双方的婚姻关系、夫妻称号、夫妻技能将被取消，并且双方好感度降为500，如好感度小于500，则不变。</text><br>')
			API_ResponseWrite('<br><a>确定</a>')
			API_ResponseFlush(ActorID)
			API_ResponseWrite('<text>请在申请后的3--10天内组队找我再次确认协议离婚，否则申请将被取消。离婚后，双方的婚姻关系、夫妻称号、夫妻技能将被取消，并且双方好感度降为500，如好感度小于500，则不变。</text><br>')
			API_ResponseWrite('<br><a>确定</a>')
			API_ResponseFlush(OtherID)
		else
			API_ResponseWrite('<text>您的伴侣不在线，无法申请协议离婚。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	elseif XuanZe == 2 then
		API_ResponseWrite('<text>您的伴侣不同意申请协议离婚。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(ActorID)
		API_ResponseWrite('<text>您拒绝了申请协议离婚。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(OtherID)
	elseif XuanZe == 3 then
		if API_ActorIsOnline(ActorID) then
			if HaoGanDu > 500 then
				API_UpdateRelation(ActorID,OtherID,2,500)
			end
			if HaoGanDuNv > 500 then
				API_UpdateRelation(OtherID,ActorID,2,500)
			end
			if API_IsTeammate(ActorID,OtherID) then
					HaoYouZhuDuiXiTong_UpdateRelation(ActorID,OtherID)
					HaoYouZhuDuiXiTong_UpdateRelation(OtherID,ActorID)
				end
			API_UpdateRelation(ActorID,OtherID,3,7)
			API_UpdateRelation(OtherID,ActorID,3,7)
			API_VarDataSetNumber(ActorID,1,19001,0)
			API_VarDataSetNumber(ActorID,1,19002,0)
			API_VarDataSetNumber(ActorID,1,19003,0)
			API_VarDataSetNumber(ActorID,1,19004,0)
			API_VarDataSetNumber(ActorID,1,19005,0)
			API_VarDataSetNumber(ActorID,1,19006,0)
			API_VarDataSetNumber(ActorID,1,19007,0)
			API_VarDataSetNumber(ActorID,1,19008,0)
			API_VarDataSetNumber(ActorID,1,19009,0)
			API_VarDataSetNumber(ActorID,1,19010,0)
			API_VarDataSetNumber(ActorID,1,19011,0)
			API_VarDataSetNumber(ActorID,1,19013,0)
			API_VarDataSetNumber(OtherID,1,19001,0)
			API_VarDataSetNumber(OtherID,1,19002,0)
			API_VarDataSetNumber(OtherID,1,19003,0)
			API_VarDataSetNumber(OtherID,1,19004,0)
			API_VarDataSetNumber(OtherID,1,19005,0)
			API_VarDataSetNumber(OtherID,1,19006,0)
			API_VarDataSetNumber(OtherID,1,19007,0)
			API_VarDataSetNumber(OtherID,1,19008,0)
			API_VarDataSetNumber(OtherID,1,19009,0)
			API_VarDataSetNumber(OtherID,1,19010,0)
			API_VarDataSetNumber(OtherID,1,19011,0)
			API_VarDataSetNumber(OtherID,1,19013,0)
			API_DelRelation(ActorID,0)
		else
			API_ResponseWrite('<text>您的伴侣不在线，无法办理协议离婚。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	elseif XuanZe == 4 then
		API_ResponseWrite('<text>您的伴侣不同意办理协议离婚。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(ActorID)
		API_ResponseWrite('<text>您拒绝了办理协议离婚。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(OtherID)
	elseif XuanZe == 5 then
		if API_ActorIsOnline(ActorID) then
			API_VarDataSetNumber(ActorID,1,19003,0)
			API_VarDataSetNumber(ActorID,1,19006,0)
			API_VarDataSetNumber(ActorID,1,19007,0)
			API_VarDataSetNumber(OtherID,1,19003,0)
			API_VarDataSetNumber(OtherID,1,19006,0)
			API_VarDataSetNumber(OtherID,1,19007,0)
			API_ResponseWrite('<text>您已经撤消协议离婚的申请。</text><br>')
			API_ResponseWrite('<br><a>确定</a>')
			API_ResponseFlush(ActorID)
			API_ResponseWrite('<text>您已经撤消协议离婚的申请。</text><br>')
			API_ResponseWrite('<br><a>确定</a>')
			API_ResponseFlush(OtherID)
		else
			API_ResponseWrite('<text>您的伴侣不在线，无法撤消协议离婚申请。</text><br><br>')
			API_ResponseWrite('<a>我知道了</a>')
		end
	elseif XuanZe == 6 then
		API_ResponseWrite('<text>您的伴侣不同意撤消协议离婚申请。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(ActorID)
		API_ResponseWrite('<text>您拒绝了撤消协议离婚申请。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(OtherID)	
	end
end

Marriage_FuQiJiNengTable = {
[1] = {
	[1] = {JN=416001,DaoJu=1,DJ=20,JW='20级',XYHGD=500,KCHGD=50,JQ=2000,SM='物理防御，火药防御，魔法防御各增加5，每2秒回3点生命值',},
	[2] = {JN=416002,DaoJu=1,DJ=35,JW='35级',XYHGD=900,KCHGD=90,JQ=3210,SM='物理防御，火药防御，魔法防御各增加10，每2秒回6点生命值',},
	[3] = {JN=416003,DaoJu=1,DJ=40,JW='40级',XYHGD=1300,KCHGD=130,JQ=7600,SM='物理防御，火药防御，魔法防御各增加15，每2秒回9点生命值',},
	[4] = {JN=416004,DaoJu=1,DJ=50,JW='50级',XYHGD=1700,KCHGD=170,JQ=16810,SM='物理防御，火药防御，魔法防御各增加20，每2秒回12点生命值',},
	[5] = {JN=416005,DaoJu=1,DJ=55,JW='55级',XYHGD=2100,KCHGD=210,JQ=33200,SM='物理防御，火药防御，魔法防御各增加25，每2秒回15点生命值',},
	[6] = {JN=416006,DaoJu=1,DJ=65,JW='65级',XYHGD=2500,KCHGD=250,JQ=58410,SM='物理防御，火药防御，魔法防御各增加30，每2秒回18点生命值',},
	[7] = {JN=416007,DaoJu=1,DJ=70,JW='70级',XYHGD=2900,KCHGD=290,JQ=94800,SM='物理防御，火药防御，魔法防御各增加35，每2秒回21点生命值',},
	[8] = {JN=416008,DaoJu=1,DJ=80,JW='80级',XYHGD=3300,KCHGD=330,JQ=144010,SM='物理防御，火药防御，魔法防御各增加40，每2秒回24点生命值',},
	[9] = {JN=416009,DaoJu=1,DJ=83,JW='83级',XYHGD=3700,KCHGD=370,JQ=208400,SM='物理防御，火药防御，魔法防御各增加45，每2秒回27点生命值',},
	[10] = {JN=416010,DaoJu=1,DJ=85,JW='85级',XYHGD=4000,KCHGD=400,JQ=289700,SM='物理防御，火药防御，魔法防御各增加50，每2秒回30点生命值',},
	},
[2] = {
	[1] = {JN=417001,DaoJu=1,DJ=20,JW='20级',XYHGD=500,KCHGD=50,JQ=2000,SM='物理攻击，火药攻击，魔法攻击各增加5，每3秒回2点能量值',},
	[2] = {JN=417002,DaoJu=1,DJ=35,JW='35级',XYHGD=900,KCHGD=90,JQ=3210,SM='物理攻击，火药攻击，魔法攻击各增加10，每3秒回4点能量值',},
	[3] = {JN=417003,DaoJu=1,DJ=40,JW='40级',XYHGD=1300,KCHGD=130,JQ=7600,SM='物理攻击，火药攻击，魔法攻击各增加15，每3秒回6点能量值',},
	[4] = {JN=417004,DaoJu=1,DJ=50,JW='50级',XYHGD=1700,KCHGD=170,JQ=16810,SM='物理攻击，火药攻击，魔法攻击各增加20，每3秒回8点能量值',},
	[5] = {JN=417005,DaoJu=1,DJ=55,JW='55级',XYHGD=2100,KCHGD=210,JQ=33200,SM='物理攻击，火药攻击，魔法攻击各增加25，每3秒回10点能量值',},
	[6] = {JN=417006,DaoJu=1,DJ=65,JW='65级',XYHGD=2500,KCHGD=250,JQ=58410,SM='物理攻击，火药攻击，魔法攻击各增加30，每3秒回12点能量值',},
	[7] = {JN=417007,DaoJu=1,DJ=70,JW='70级',XYHGD=2900,KCHGD=290,JQ=94800,SM='物理攻击，火药攻击，魔法攻击各增加35，每3秒回14点能量值',},
	[8] = {JN=417008,DaoJu=1,DJ=80,JW='80级',XYHGD=3300,KCHGD=330,JQ=144010,SM='物理攻击，火药攻击，魔法攻击各增加40，每3秒回16点能量值',},
	[9] = {JN=417009,DaoJu=1,DJ=83,JW='83级',XYHGD=3700,KCHGD=370,JQ=208400,SM='物理攻击，火药攻击，魔法攻击各增加45，每3秒回18点能量值',},
	[10] = {JN=417010,DaoJu=1,DJ=85,JW='85级',XYHGD=4000,KCHGD=400,JQ=289700,SM='物理攻击，火药攻击，魔法攻击各增加50，每3秒回20点能量值',},
	},
[3] = {
	[1] = {JN=418001,DaoJu=1,DJ=20,JW='20级',XYHGD=500,KCHGD=50,JQ=2000,SM='当生命低于10%的时候把所受伤害的5%转移给伴侣',},
	[2] = {JN=418002,DaoJu=1,DJ=35,JW='35级',XYHGD=900,KCHGD=90,JQ=3210,SM='当生命低于10%的时候把所受伤害的10%转移给伴侣',},
	[3] = {JN=418003,DaoJu=1,DJ=40,JW='40级',XYHGD=1300,KCHGD=130,JQ=7600,SM='当生命低于10%的时候把所受伤害的15%转移给伴侣',},
	[4] = {JN=418004,DaoJu=1,DJ=50,JW='50级',XYHGD=1700,KCHGD=170,JQ=16810,SM='当生命低于10%的时候把所受伤害的20%转移给伴侣',},
	[5] = {JN=418005,DaoJu=1,DJ=55,JW='55级',XYHGD=2100,KCHGD=210,JQ=33200,SM='当生命低于10%的时候把所受伤害的25%转移给伴侣',},
	[6] = {JN=418006,DaoJu=1,DJ=65,JW='65级',XYHGD=2500,KCHGD=250,JQ=58410,SM='当生命低于10%的时候把所受伤害的30%转移给伴侣',},
	[7] = {JN=418007,DaoJu=1,DJ=70,JW='70级',XYHGD=2900,KCHGD=290,JQ=94800,SM='当生命低于10%的时候把所受伤害的35%转移给伴侣',},
	[8] = {JN=418008,DaoJu=1,DJ=80,JW='80级',XYHGD=3300,KCHGD=330,JQ=144010,SM='当生命低于10%的时候把所受伤害的40%转移给伴侣',},
	[9] = {JN=418009,DaoJu=1,DJ=83,JW='83级',XYHGD=3700,KCHGD=370,JQ=208400,SM='当生命低于10%的时候把所受伤害的45%转移给伴侣',},
	[10] = {JN=418010,DaoJu=1,DJ=85,JW='85级',XYHGD=4000,KCHGD=400,JQ=289700,SM='当生命低于10%的时候把所受伤害的50%转移给伴侣',},
	},
[4] = {
	[1] = {JN=407001,DaoJu=1,DJ=20,JW='20级',XYHGD=500,KCHGD=50,JQ=2000,SM='立刻治疗伴侣1000生命',},
	[2] = {JN=407002,DaoJu=1,DJ=35,JW='35级',XYHGD=900,KCHGD=90,JQ=3210,SM='立刻治疗伴侣1500生命',},
	[3] = {JN=407003,DaoJu=1,DJ=40,JW='40级',XYHGD=1300,KCHGD=130,JQ=7600,SM='立刻治疗伴侣2500生命',},
	[4] = {JN=407004,DaoJu=1,DJ=50,JW='50级',XYHGD=1700,KCHGD=170,JQ=16810,SM='立刻治疗伴侣3500生命',},
	[5] = {JN=407005,DaoJu=1,DJ=55,JW='55级',XYHGD=2100,KCHGD=210,JQ=33200,SM='立刻治疗伴侣4500生命',},
	[6] = {JN=407006,DaoJu=1,DJ=65,JW='65级',XYHGD=2500,KCHGD=250,JQ=58410,SM='立刻治疗伴侣5500生命',},
	[7] = {JN=407007,DaoJu=1,DJ=70,JW='70级',XYHGD=2900,KCHGD=290,JQ=94800,SM='立刻治疗伴侣6500生命',},
	[8] = {JN=407008,DaoJu=1,DJ=80,JW='80级',XYHGD=3300,KCHGD=330,JQ=144010,SM='立刻治疗伴侣7500生命',},
	[9] = {JN=407009,DaoJu=1,DJ=83,JW='83级',XYHGD=3700,KCHGD=370,JQ=208400,SM='立刻治疗伴侣8500生命',},
	[10] = {JN=407010,DaoJu=1,DJ=85,JW='85级',XYHGD=4000,KCHGD=400,JQ=289700,SM='立刻治疗伴侣9500生命',},
	},
}

function Marriage_FuQiJiNeng()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local PlayLV = API_GetActorExpLevel(ActorID)
	local OtherID = API_GetRelation(ActorID,0,8)
	local JN1 = API_VarDataGetNumber(ActorID,1,19008)
	local JN2 = API_VarDataGetNumber(ActorID,1,19009)
	local JN3 = API_VarDataGetNumber(ActorID,1,19010)
	local JN4 = API_VarDataGetNumber(ActorID,1,19011)
	local money = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD)
	local ShengLiaoNum = 1500000 --学习圣疗的钱
	local HaoGanDu = API_GetRelation(ActorID,OtherID,2)
	local Table = Marriage_FuQiJiNengTable[XuanZe]
	local JN1Table = Marriage_FuQiJiNengTable[1]
	local JN2Table = Marriage_FuQiJiNengTable[2]
	local JN3Table = Marriage_FuQiJiNengTable[3]
	local JN4Table = Marriage_FuQiJiNengTable[4]
	local DaoJu
	if XuanZe == 1 then
		if JN1 == 10 then
			API_ResponseWrite('<text>丘比特的庇护：'..Table[JN1].SM..'</text><br>')
			API_ResponseWrite('<br><text>此技能您已达到满级，无法再升级。</text><br>')
			API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
		elseif Table[JN1] == nil then
			API_ResponseWrite('<text>丘比特的庇护：</text><br>')
			API_ResponseWrite('<br><text>当前技能效果：您还未学会此技能</text><br>')
			API_ResponseWrite('<br><text>下一级技能效果：'..Table[JN1+1].SM..'</text><br>')
			API_ResponseWrite('<text>学习条件：等级需达到'..Table[JN1+1].JW..'，好感度需达到'..Table[JN1+1].XYHGD..'，学习技能后消耗好感度'..Table[JN1+1].KCHGD..'，金钱'..Table[JN1+1].JQ..'</text><br>')
			API_ResponseWrite('<text>下一级施放技能需消耗 1 个丘比特的庇护</text><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng?1=5">学习技能</a><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng">返回</a>')
		else
			local DaoJu = Table[JN1+1].DaoJu
			API_ResponseWrite('<text>丘比特的庇护第'..JN1..'级：</text><br>')
			API_ResponseWrite('<br><text>当前技能效果：'..Table[JN1].SM..'</text><br>')
			API_ResponseWrite('<br><text>下一级技能效果：'..Table[JN1+1].SM..'</text><br>')
			API_ResponseWrite('<text>学习条件：等级需达到'..Table[JN1+1].JW..'，好感度需达到'..Table[JN1+1].XYHGD..'，学习技能后消耗好感度'..Table[JN1+1].KCHGD..'，金钱'..Table[JN1+1].JQ..'</text><br>')
			API_ResponseWrite('<text>下一级施放技能需消耗 '..DaoJu..' 个丘比特的庇护</text><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng?1=5">升级技能</a><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng">返回</a>')
		end
	elseif XuanZe == 2 then
		if JN2 == 10 then
			API_ResponseWrite('<text>丘比特的愤怒第10级：'..Table[JN2].SM..'</text><br>')
			API_ResponseWrite('<br><text>此技能您已达到满级，无法再升级。</text><br>')
			API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
		elseif Table[JN2] == nil then
			API_ResponseWrite('<text>丘比特的愤怒：</text><br>')
			API_ResponseWrite('<br><text>当前技能效果：您还未学会此技能</text><br>')
			API_ResponseWrite('<br><text>下一级技能效果：'..Table[JN2+1].SM..'</text><br>')
			API_ResponseWrite('<text>学习条件：等级需达到'..Table[JN2+1].JW..'，好感度需达到'..Table[JN2+1].XYHGD..'，学习技能后消耗好感度'..Table[JN2+1].KCHGD..'，金钱'..Table[JN2+1].JQ..'</text><br>')
			API_ResponseWrite('<text>下一级施放技能需消耗 1 个丘比特的愤怒</text><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng?1=6">学习技能</a><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng">返回</a>')
		else
			local DaoJu = Table[JN2+2].DaoJu
			API_ResponseWrite('<text>丘比特的愤怒第'..JN2..'级：</text><br>')
			API_ResponseWrite('<br><text>当前技能效果：'..Table[JN2].SM..'</text><br>')
			API_ResponseWrite('<br><text>下一级技能效果：'..Table[JN2+1].SM..'</text><br>')
			API_ResponseWrite('<text>学习条件：等级需达到'..Table[JN2+1].JW..'，好感度需达到'..Table[JN2+1].XYHGD..'，学习技能后消耗好感度'..Table[JN2+1].KCHGD..'，金钱'..Table[JN2+1].JQ..'</text><br>')
			API_ResponseWrite('<text>下一级施放技能需消耗 '..DaoJu..' 个丘比特的愤怒</text><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng?1=6">升级技能</a><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng">返回</a>')
		end
	elseif XuanZe == 3 then
		if JN3 == 10 then
			API_ResponseWrite('<text>丘比特的锁链第10级：'..Table[JN3].SM..'</text><br>')
			API_ResponseWrite('<br><text>此技能您已达到满级，无法再升级。</text><br>')
			API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
		elseif Table[JN3] == nil then
			API_ResponseWrite('<text>丘比特的锁链：</text><br>')
			API_ResponseWrite('<br><text>当前技能效果：您还未学会此技能</text><br>')
			API_ResponseWrite('<br><text>下一级技能效果：'..Table[JN3+1].SM..'</text><br>')
			API_ResponseWrite('<text>学习条件：等级需达到'..Table[JN3+1].JW..'，好感度需达到'..Table[JN3+1].XYHGD..'，学习技能后消耗好感度'..Table[JN3+1].KCHGD..'，金钱'..Table[JN3+1].JQ..'</text><br>')
			API_ResponseWrite('<text>下一级施放技能需消耗 1 个丘比特的锁链</text><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng?1=7">学习技能</a><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng">返回</a>')
		else
			local DaoJu = Table[JN3+1].DaoJu
			API_ResponseWrite('<text>丘比特的锁链第'..JN3..'级：</text><br>')
			API_ResponseWrite('<br><text>当前技能效果：'..Table[JN3].SM..'</text><br>')
			API_ResponseWrite('<br><text>下一级技能效果：'..Table[JN3+1].SM..'</text><br>')
			API_ResponseWrite('<text>学习条件：等级需达到'..Table[JN3+1].JW..'，好感度需达到'..Table[JN3+1].XYHGD..'，学习技能后消耗好感度'..Table[JN3+1].KCHGD..'，金钱'..Table[JN3+1].JQ..'</text><br>')
			API_ResponseWrite('<text>下一级施放技能需消耗 '..DaoJu..' 个丘比特的锁链</text><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng?1=7">升级技能</a><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng">返回</a>')
		end
	elseif XuanZe == 4 then
		if JN4 == 10 then
			API_ResponseWrite('<text>丘比特的圣疗第10级：'..Table[JN4].SM..'</text><br>')
			API_ResponseWrite('<br><text>此技能您已达到满级，无法再升级。</text><br>')
			API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
		elseif Table[JN4] == nil then
			API_ResponseWrite('<text>丘比特的圣疗：</text><br>')
			API_ResponseWrite('<br><text>当前技能效果：您还未学会此技能</text><br>')
			API_ResponseWrite('<br><text>下一级技能效果：'..Table[JN4+1].SM..'</text><br>')
			API_ResponseWrite('<text>学习条件：等级需达到'..Table[JN4+1].JW..'，好感度需达到'..Table[JN4+1].XYHGD..'，学习技能后消耗好感度'..Table[JN4+1].KCHGD..'，金钱'..Table[JN4+1].JQ..'</text><br>')
			API_ResponseWrite('<text>下一级施放技能需消耗 1 个丘比特的圣疗</text><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng?1=8">学习技能</a><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng">返回</a>')
		else
			local DaoJu =Table[JN4+1].DaoJu
			API_ResponseWrite('<text>丘比特的圣疗第'..JN4..'级：</text><br>')
			API_ResponseWrite('<br><text>当前技能效果：'..Table[JN4].SM..'</text><br>')
			API_ResponseWrite('<br><text>下一级技能效果：'..Table[JN4+1].SM..'</text><br>')
			API_ResponseWrite('<text>学习条件：等级需达到'..Table[JN4+1].JW..'，好感度需达到'..Table[JN4+1].XYHGD..'，学习技能后消耗好感度'..Table[JN4+1].KCHGD..'，金钱'..Table[JN4+1].JQ..'</text><br>')
			API_ResponseWrite('<text>下一级施放技能需消耗 '..DaoJu..' 个丘比特的圣疗</text><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng?1=8">升级技能</a><br>')
			API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng">返回</a>')
		end
	elseif XuanZe == 5 then
		if PlayLV >= JN1Table[JN1+1].DJ then
			if HaoGanDu >= JN1Table[JN1+1].XYHGD then
				if money >= JN1Table[JN1+1].JQ then
					if API_ActorAddMoney(ActorID,-JN1Table[JN1+1].JQ,MarriageSystemTaskID,'学习丘比特的庇护LV'..(JN1+1)..'扣钱') and API_UpdateRelation(ActorID,OtherID,2,HaoGanDu-JN1Table[JN1+1].KCHGD) then
						API_ResponseWrite('<text>学习技能成功，当前技能效果：'..JN1Table[JN1+1].SM..'</text><br>')
						API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
						API_VarDataSetNumber(ActorID,1,19008,JN1+1)
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = JN1Table[JN1+1].JQ
						else
							GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] + JN1Table[JN1+1].JQ
						end
					end
				else
					API_ResponseWrite('<text>您的金币不足，不能学习此技能。</text><br>')
					API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
				end
			else
				API_ResponseWrite('<text>好感度不足，不能学习此技能。</text><br>')
				API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
			end
		else
			API_ResponseWrite('<text>您的等级太低，不能学习此技能。</text><br>')
			API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
		end
	elseif XuanZe == 6 then
		if PlayLV >= JN2Table[JN2+1].DJ then
			if HaoGanDu >= JN2Table[JN2+1].XYHGD then
				if money >= JN2Table[JN2+1].JQ then
					if API_ActorAddMoney(ActorID,-JN2Table[JN2+1].JQ,MarriageSystemTaskID,'学习丘比特的愤怒LV'..(JN2+1)..'扣钱') and API_UpdateRelation(ActorID,OtherID,2,HaoGanDu-JN2Table[JN2+1].KCHGD) then
						API_ResponseWrite('<text>学习技能成功，当前技能效果：'..JN2Table[JN2+1].SM..'</text><br>')
						API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
						API_VarDataSetNumber(ActorID,1,19009,JN2+1)
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = JN2Table[JN2+1].JQ
						else
							GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] + JN2Table[JN2+1].JQ
						end
					end
				else
					API_ResponseWrite('<text>您的金币不足，不能学习此技能。</text><br>')
					API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
				end
			else
				API_ResponseWrite('<text>好感度不足，不能学习此技能。</text><br>')
				API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
			end
		else
			API_ResponseWrite('<text>您的等级太低，不能学习此技能。</text><br>')
			API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
		end
	elseif XuanZe == 7 then
		if PlayLV >= JN3Table[JN3+1].DJ then
			if HaoGanDu >= JN3Table[JN3+1].XYHGD then
				if money >= JN3Table[JN3+1].JQ then
					if API_ActorAddMoney(ActorID,-JN3Table[JN3+1].JQ,MarriageSystemTaskID,'学习丘比特的锁链LV'..(JN3+1)..'扣钱') and API_UpdateRelation(ActorID,OtherID,2,HaoGanDu-JN3Table[JN3+1].KCHGD) then
						API_ResponseWrite('<text>学习技能成功，当前技能效果：'..JN3Table[JN3+1].SM..'</text><br>')
						API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
						API_VarDataSetNumber(ActorID,1,19010,JN3+1)
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = JN3Table[JN3+1].JQ
						else
							GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] + JN3Table[JN3+1].JQ
						end
					end
				else
					API_ResponseWrite('<text>您的金币不足，不能学习此技能。</text><br>')
					API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
				end
			else
				API_ResponseWrite('<text>好感度不足，不能学习此技能。</text><br>')
				API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
			end
		else
			API_ResponseWrite('<text>您的等级太低，不能学习此技能。</text><br>')
			API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
		end
	elseif XuanZe == 8 then
		if PlayLV >= JN4Table[JN4+1].DJ then
			if HaoGanDu >= JN4Table[JN4+1].XYHGD then
				if money >= JN4Table[JN4+1].JQ then
					if API_ActorAddMoney(ActorID,-JN4Table[JN4+1].JQ,MarriageSystemTaskID,'学习丘比特的圣疗LV'..(JN4+1)..'扣钱') and API_UpdateRelation(ActorID,OtherID,2,HaoGanDu-JN4Table[JN4+1].KCHGD) then
						API_ResponseWrite('<text>学习技能成功，当前技能效果：'..JN4Table[JN4+1].SM..'</text><br>')
						API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
						API_VarDataSetNumber(ActorID,1,19011,JN4+1)
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = JN4Table[JN4+1].JQ
						else
							GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][37][LaiYuan] + JN4Table[JN4+1].JQ
						end
					end
				else
					API_ResponseWrite('<text>您的金币不足，不能学习此技能。</text><br>')
					API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
				end
			else
				API_ResponseWrite('<text>好感度不足，不能学习此技能。</text><br>')
				API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
			end
		else
			API_ResponseWrite('<text>您的等级太低，不能学习此技能。</text><br>')
			API_ResponseWrite('<br><br><a href="Marriage_FuQiJiNeng">返回</a>')
		end
	else
		API_ResponseWrite('<text>您想学习什么技能呢？（学会技能后，需</text><text color="255,0,255">购买夫妻技能道具</text><text>，并使用道具才能施放技能）</text><br>')
		API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng?1=1">丘比特的庇护</a><br>')
		API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng?1=2">丘比特的愤怒</a><br>')
		API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng?1=3">丘比特的锁链</a><br>')
		API_ResponseWrite('<br><a href="Marriage_FuQiJiNeng?1=4">丘比特的圣疗</a><br>')
		API_ResponseWrite('<br><a href="Marriage_ZhuShou_PanDuan_Title">返回</a>')
	end
end

function Marriage_OnLogin(ActorID) --上线后调用该函数
	API_CreateTimerTrigger(ActorID, 3, 1, -1, 'Marriage_OnLoginLiHun')
end

function Marriage_OnLoginLiHun(ActorID,TaskID)
	if API_ActorIsOnline(ActorID) then
		local OtherID = API_VarDataGetNumber(ActorID,1,19001)
		if API_GetRelation(ActorID,0,8) == -1 and OtherID > 0 and API_VarDataGetNumber(ActorID,1,19002) == 3 then
			if API_GetRelation(ActorID,OtherID,2) > 1 then
				API_UpdateRelation(ActorID,OtherID,2,1)
			end
			API_UpdateRelation(ActorID,OtherID,3,6)
			API_VarDataSetNumber(ActorID,1,19001,0)
			API_VarDataSetNumber(ActorID,1,19002,0)
			API_VarDataSetNumber(ActorID,1,19003,0)
			API_VarDataSetNumber(ActorID,1,19004,0)
			API_VarDataSetNumber(ActorID,1,19005,0)
			API_VarDataSetNumber(ActorID,1,19006,0)
			API_VarDataSetNumber(ActorID,1,19007,0)
			API_VarDataSetNumber(ActorID,1,19008,0)
			API_VarDataSetNumber(ActorID,1,19009,0)
			API_VarDataSetNumber(ActorID,1,19010,0)
			API_VarDataSetNumber(ActorID,1,19011,0)
			API_VarDataSetNumber(ActorID,1,19013,0)
		end
	end
end

function Marriage_LiTangLieBiao()
	local ActorID = API_RequestGetActorID()
	local Camp = API_GetActorCamp(ActorID)
	local ServerID = API_GetServerID()
	local ActorFWQ = API_VarDataGetNumber(ActorID,1,19013)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ZhuRenYMD = API_VarDataGetNumber(ActorID,1,19004)
	local ZhuRenHMS = API_VarDataGetNumber(ActorID,1,19005)
	local ZhuRenYear = math.floor(ZhuRenYMD/10000) --取年月日的商数
	local ZhuRenMonthDay = math.mod(ZhuRenYMD,10000) --取年月日的余数
	local ZhuRenMonth = math.floor(ZhuRenMonthDay/100) --取年月日余数的商数
	local ZhuRenDay = math.mod(ZhuRenMonthDay,100) --取年月日余数的商数的余数
	local CampName = ''
	if Camp == 0 then
		CampName = '帝国'
	elseif Camp == 1 then
		CampName = '联邦'
	end
	API_ResponseWrite('<name>教堂列表</name>')
	API_ResponseWrite('<win rect="50,80,325,485"></win>')
	API_ResponseWrite('<text>   '..CampName..'教堂预约时间表：</text><br>')
	if ActorFWQ == 0 then
		API_ResponseWrite('<text color="255,0,255">   您目前还没有预约教堂</text><br>')
	else
		if ActorFWQ == ServerID then
			if API_DiffDatatime(ZhuRenYear,ZhuRenMonth,ZhuRenDay,ZhuRenHMS,0,0) > -86400 then
				API_ResponseWrite('<text color="255,0,255">   您已经预约了'..ZhuRenYear..'年'..ZhuRenMonth..'月'..ZhuRenDay..'日'..ZhuRenHMS..'时的教堂</text><br>')
			else
				API_ResponseWrite('<text color="255,0,255">    您预约的教堂已过期，请重新预约。</text><br>')
			end
		else
			if API_DiffDatatime(ZhuRenYear,ZhuRenMonth,ZhuRenDay,ZhuRenHMS,0,0) > -86400 then
				API_ResponseWrite('<text color="255,0,255">   您已在'..GLOBAL_Navigate_ServerID[ActorFWQ].name..'预约了教堂，请前往'..GLOBAL_Navigate_ServerID[ActorFWQ].name..'查看。</text><br>')
			else
				API_ResponseWrite('<text color="255,0,255">   您在'..GLOBAL_Navigate_ServerID[ActorFWQ].name..'预约的教堂已过期，请重新预约。</text><br>')
			end
		end
	end
	local WeekDay = Week
	if WeekDay == 0 or WeekDay == 7 then
		WeekDay = '天'
	else
		WeekDay = PublicFun_ArabianNumberToChineseNumber(WeekDay)
	end
	API_ResponseWrite('<br><a href="Marriage_ZuYongLiTang?1=0">   '..Year..'年'..Month..'月'..Day..'日 礼拜'..WeekDay..' 可预约教堂列表</a><br><br>')
	for j = 1,7 do
		local NextDay = Day
		local NextMonth = Month
		local NextYear = Year
		local NextWeek = math.mod(Week + j,7)
		local MaxDay = 31
		if (math.mod(Year,4) == 0 and math.mod(Year,100) ~= 0) or math.mod(Year,400) == 0 then
			if Month == 2 then
				MaxDay = 29
			elseif Month == 1 or Month == 3 or Month == 5 or Month == 7 or Month == 8 or Month == 10 or Month == 12 then
				MaxDay = 31
			elseif Month == 4 or Month == 6 or Month == 9 or Month == 11 then
				MaxDay = 30
			end
		else
			if Month == 2 then
				MaxDay = 28
			elseif Month == 1 or Month == 3 or Month == 5 or Month == 7 or Month == 8 or Month == 10 or Month == 12 then
				MaxDay = 31
			elseif Month == 4 or Month == 6 or Month == 9 or Month == 11 then
				MaxDay = 30
			end
		end
		NextDay = math.mod(Day+j,MaxDay)
		if NextDay == 0 then
			NextDay = MaxDay
		end
		NextMonth = math.floor((Day + j - 1)/MaxDay) + Month
		if NextMonth > 12 then
			NextMonth = math.mod(NextMonth,12)
			NextYear = NextYear + 1
		end
		if NextWeek == 0 or NextWeek == 7 then
			NextWeek = '天'
		else
			NextWeek = PublicFun_ArabianNumberToChineseNumber(NextWeek)
		end
		local Time = ''..NextYear..'年'..NextMonth..'月'..NextDay..'日 礼拜'..NextWeek..''
		API_ResponseWrite('<br><a href="Marriage_ZuYongLiTang?1='..j..'">   '..Time..' 可预约教堂列表</a><br><br>')
	end
	API_ResponseWrite('<br><a href="Marriage_ZuYongLiTangShuoMing?1=3">   教堂预约说明</a><br>')
	API_ResponseWrite('<br><a href="Marriage_ZhuShou_PanDuan_Title">   返回</a>')
end

function Marriage_ZuYongLiTangShuoMing()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	if XuanZe == 1 then
		API_ResponseWrite('<name>结婚条件</name>')
		API_ResponseWrite('<br><text>结婚条件：</text><br>')
		API_ResponseWrite('<br><text>1、双方必须为</text><text color="255,0,255">异性</text><text>；</text><br>')
		API_ResponseWrite('<br><text>2、双方等级需要达到</text><text color="255,0,255">20级或以上</text><text>；</text><br>')
		API_ResponseWrite('<br><text>3、双方互相好感度需达到</text><text color="255,0,255">'..MarriageHaoGanDu..'或以上</text><text>。</text><br>')
		API_ResponseWrite('<br><br><a href="Marriage_Parson_PanDuan_Title">返回</a>')
	elseif XuanZe == 2 then
		API_ResponseWrite('<name>结婚条件</name>')
		API_ResponseWrite('<br><text>结婚条件：</text><br>')
		API_ResponseWrite('<br><text>1、双方必须为</text><text color="255,0,255">异性</text><text>；</text><br>')
		API_ResponseWrite('<br><text>2、双方等级需要达到</text><text color="255,0,255">20级或以上</text><text>；</text><br>')
		API_ResponseWrite('<br><text>3、双方互相好感度需达到</text><text color="255,0,255">'..MarriageHaoGanDu..'或以上</text><text>。</text><br>')
		API_ResponseWrite('<br><br><a href="Marriage_ZhuShou_PanDuan_Title">返回</a>')
	elseif XuanZe == 3 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<text>1、教堂预约采用一次性收费，价格为</text><text color="255,0,255">5万</text><text>金币。</text><br>')
		API_ResponseWrite('<br><text>2、教堂预约的时间从当天的</text><text color="255,0,255">下个时段</text><text>开始，每天分</text><text color="255,0,255">12个时段</text><text>，教堂使用时间为</text><text color="255,0,255">2小时。</text><br>')
		API_ResponseWrite('<br><text>3、如预约的时间已经</text><text color="255,0,255">超过一天</text><text>，那么预约将作废，玩家必须重新预约教堂。</text><br>')
		API_ResponseWrite('<br><text>4、当成功预约教堂之后，玩家可以在教堂门口的“婚礼司仪”处免费领取喜帖，喜帖是新人朋友进入婚礼场地的唯一凭证。</text><br>')
		API_ResponseWrite('<br><text>5、当达到教堂预约时间时，玩家可以在教堂门口的“婚礼司仪”处开启并进入自己的婚礼场地。</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
	end
end

function Marriage_JieHunLiuChengShuoMing_Title()
	local ActorID = API_RequestGetActorID()
	API_ResponseWrite('<name>结婚流程</name>')
	API_ResponseWrite('<win rect="80,390,830,300"></win>')
	API_ResponseWrite('<text>1、由男方在教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”处或</text><text color="255,0,255">异界商店</text><text>的</text><text color="255,0,255">婚庆道具店</text><text>内购买一朵</text><img srcgd="826" tipgd="826"><text>，然后由男方使用</text><img srcgd="826" tipgd="826"><text>向女方求婚，求婚成功后，双方变为情侣关系。</text><br>')
	API_ResponseWrite('<br><text>2、求婚完毕，在教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”处预约结婚教堂。  </text><a href="Marriage_ZuYongLiTangShuoMing?1=3">查看教堂预约说明</a><br>')
	API_ResponseWrite('<br><text>3、成功预约教堂后，可以在教堂门口的“</text><text color="255,0,255">婚礼司仪</text><text>”处免费领取</text><text color="255,0,255">喜帖</text><text>，喜帖是新人朋友进入教堂时的唯一凭证。</text><br>')
	API_ResponseWrite('<br><text>4、在使用教堂的时间段内，可以在教堂内的</text><text color="255,0,255">婚礼主持</text><text>处选择</text><text color="255,0,255">装扮教堂</text><text>或是购买一件美丽无双的</text><text color="255,0,255">结婚礼服</text><text color="255,255,0">。提醒：不装饰教堂和不使用结婚礼服也可以正常举行婚礼。</text><br>')
	API_ResponseWrite('<br><text>5、举行婚礼，分</text><text color="255,0,255">NPC主持婚礼</text><text>和</text><text color="255,0,255">玩家自行主持婚礼</text><text>两种，如果选择NPC主持婚礼，那么会让玩家按照设定的流程举行婚礼，直到确认夫妻关系，如果选择由玩家自行主持婚礼，那么婚礼中的各种活动都由玩家自行操作，最后在NPC处办理结婚登记即可成为正式夫妻。</text><br>')
	API_ResponseWrite('<br><text>6、如果婚礼场地内超过</text><text color="255,0,255">20分钟</text><text>没有任何玩家，将会自动关闭。</text><br>')
	API_ResponseWrite('<br><a>确定</a>')
end

function Marriage_ZuYongLiTang() --租用结婚教堂函数
	local ActorID = API_RequestGetActorID()
	local OtherID = API_VarDataGetNumber(ActorID,1,19001)
	local Sexy = API_GetActorSex(ActorID)
	local Camp = API_GetActorCamp(ActorID)
	local JiaGeNum = 50000
	local ServerID = API_GetServerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
--~ 	if Month == 11 and Day == 11 then
--~ 		JiaGeNum = 1
--~ 	end
	local SelectDay = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	local NextDay = Day
	local NextMonth = Month
	local NextYear = Year
	local MaxDay = 31
	local NextMinute = 0
	local NextSecond = 0
	if (math.mod(Year,4) == 0 and math.mod(Year,100) ~= 0) or math.mod(Year,400) == 0 then
		if Month == 2 then
			MaxDay = 29
		elseif Month == 1 or Month == 3 or Month == 5 or Month == 7 or Month == 8 or Month == 10 or Month == 12 then
			MaxDay = 31
		elseif Month == 4 or Month == 6 or Month == 9 or Month == 11 then
			MaxDay = 30
		end
	else
		if Month == 2 then
			MaxDay = 28
		elseif Month == 1 or Month == 3 or Month == 5 or Month == 7 or Month == 8 or Month == 10 or Month == 12 then
			MaxDay = 31
		elseif Month == 4 or Month == 6 or Month == 9 or Month == 11 then
			MaxDay = 30
		end
	end
	NextDay = math.mod(Day+SelectDay,MaxDay)
	if NextDay == 0 then
		NextDay = MaxDay
	end
	NextMonth = math.floor((Day + SelectDay - 1)/MaxDay) + Month
	if NextMonth > 12 then
		NextMonth = math.mod(NextMonth,12)
		NextYear = NextYear + 1
	end
	if API_RequestGetNumber(3) > 0 then
		local XuanZe = API_RequestGetNumber(3)
		if API_ActorIsOnline(OtherID) then
			if API_GetActorHouserSerialID(ActorID) > 0 or API_GetActorHouserSerialID(OtherID) > 0 then
				if API_GetActorMapID(ActorID) == API_GetActorMapID(OtherID) then
					if API_IsTeammate(ActorID,OtherID) then
						local TeamID = API_GetTeamID(ActorID)
						if API_GetTeamSize(TeamID) == 2 then	
							local NextHour = (XuanZe - 1) * 2
							local YMD = NextYear * 10000 + NextMonth * 100 + NextDay
							if NextMonth == 11 and NextDay == 11 then
								JiaGeNum = 1
							end
							local HMS = NextHour
							local nShiFouStart = API_DiffDatatime(HLjhTStartTime.Year,HLjhTStartTime.Month,HLjhTStartTime.Day,HLjhTStartTime.Hour,HLjhTStartTime.Minute,HLjhTStartTime.Second);
							local nShiFouEnd = API_DiffDatatime(HLjhTEndTime.Year,HLjhTEndTime.Month,HLjhTEndTime.Day,HLjhTEndTime.Hour,HLjhTEndTime.Minute,HLjhTEndTime.Second);
							if nShiFouStart <= 0 and nShiFouEnd > 0 then
								if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) >= 0 then
									if API_ActorAddMoneyUnStat(ActorID,0,MarriageSystemTaskID,'七夕当天租用教堂不扣钱') then
										API_ActorPlaySound(ActorID,10035)
										API_VarDataSetNumber(ActorID,1,19002,2)
										API_VarDataSetNumber(OtherID,1,19002,2)
										API_VarDataSetNumber(ActorID,1,19004,YMD)
										API_VarDataSetNumber(OtherID,1,19004,YMD)
										API_VarDataSetNumber(ActorID,1,19005,HMS)
										API_VarDataSetNumber(OtherID,1,19005,HMS)
										API_VarDataSetNumber(ActorID,1,19013,ServerID)
										API_VarDataSetNumber(OtherID,1,19013,ServerID)
										API_ActorSendMsg(ActorID,9,'庆七夕，您免费预约了七夕'..GLOBAL_Navigate_ServerID[ServerID].name..''..NextYear..'年'..NextMonth..'月'..NextDay..'日'..NextHour..'点的教堂。')
										API_ActorSendMsg(OtherID,7,'您的爱人在七夕当天免费预约了'..GLOBAL_Navigate_ServerID[ServerID].name..''..NextYear..'年'..NextMonth..'月'..NextDay..'日'..NextHour..'点的教堂。')
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[2][XuanZe][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[2][XuanZe][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[2][XuanZe][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][XuanZe][LaiYuan] + 1
										end
									end
								end
							else	
								if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) >= JiaGeNum then
									if API_ActorAddMoneyUnStat(ActorID,-JiaGeNum,MarriageSystemTaskID,'租用教堂扣钱') then
										API_ActorPlaySound(ActorID,10035)
										API_VarDataSetNumber(ActorID,1,19002,2)
										API_VarDataSetNumber(OtherID,1,19002,2)
										API_VarDataSetNumber(ActorID,1,19004,YMD)
										API_VarDataSetNumber(OtherID,1,19004,YMD)
										API_VarDataSetNumber(ActorID,1,19005,HMS)
										API_VarDataSetNumber(OtherID,1,19005,HMS)
										API_VarDataSetNumber(ActorID,1,19013,ServerID)
										API_VarDataSetNumber(OtherID,1,19013,ServerID)
										API_ActorSendMsg(ActorID,9,'您花费 '..JiaGeNum..' 金币预约了'..GLOBAL_Navigate_ServerID[ServerID].name..''..NextYear..'年'..NextMonth..'月'..NextDay..'日'..NextHour..'点的教堂。')
										API_ActorSendMsg(OtherID,7,'您的爱人花费 '..JiaGeNum..' 金币预约了'..GLOBAL_Navigate_ServerID[ServerID].name..''..NextYear..'年'..NextMonth..'月'..NextDay..'日'..NextHour..'点的教堂。')
										local LaiYuan = API_ActorGetPropNum(ActorID,201)
										if GLOBAL_FengXiangBiao_DateList[2][XuanZe][LaiYuan] == nil then
											GLOBAL_FengXiangBiao_DateList[2][XuanZe][LaiYuan] = 1
										else
											GLOBAL_FengXiangBiao_DateList[2][XuanZe][LaiYuan] = GLOBAL_FengXiangBiao_DateList[2][XuanZe][LaiYuan] + 1
										end
									end
									
								else
									API_ActorSendMsg(ActorID,2,'教堂预约需'..JiaGeNum..'金币，您的金币不够，不能预约教堂。')
								end
							end
						else
							API_ActorSendMsg(ActorID,2,'只有情侣两个人组队才可以预约教堂哦。')
						end
					else
						API_ActorSendMsg(ActorID,2,'您需要和您的爱人组队后才可以预约教堂。')
					end
				else 
					API_ActorSendMsg(ActorID,2,'您和您的爱人需要在同一地图内才可以预约教堂。')
				end
			else
				API_ActorSendMsg(ActorID,2,'预约失败，必须有一个人拥有房屋才可以预约教堂。')
				API_ActorSendMsg(OtherID,2,'预约失败，必须有一个人拥有房屋才可以预约教堂。')
			end
		else
			API_ActorSendMsg(ActorID,2,'您的爱人不在线或跟您不在同一个岛，不能预约教堂。')
		end
		return
	end
	local LiTangNum = 12
	API_ResponseWrite('<name>教堂列表</name>')
	API_ResponseWrite('<win rect="50,80,460,473"></win>')
	API_ResponseWrite('<text>'..NextYear..'年'..NextMonth..'月'..NextDay..'日可预约教堂列表如下：</text><br><br>')
	for j = 1,LiTangNum do
		local Time = (j - 1) * 2
		if j > Page * 6 and j < (Page + 1) * 6 + 1 then
			API_ResponseWrite('<br><text color="254,249,220"> '..NextYear..'年'..NextMonth..'月'..NextDay..'日'..Time..'点的教堂  </text>')
			if NextMonth == 11 and NextDay == 11 then
				JiaGeNum = 1
			end
			local JingBiaoTip = ' 预约价格：'..JiaGeNum..'金币'
			local JingBiaoTipLen = string.len(JingBiaoTip)
			if JingBiaoTipLen < 20 then
				for j = 1,20- JingBiaoTipLen do
					JingBiaoTip = JingBiaoTip..' '
				end
			end
			API_ResponseWrite('<text color="254,0,220"> '..JingBiaoTip..'</text>')
			API_ResponseWrite('<text>   </text>')
			if API_DiffDatatime(NextYear,NextMonth,NextDay,Time,NextMinute,NextSecond) > 60 then
				API_ResponseWrite('<a href="Marriage_ZuYongLiTang?1='..SelectDay..'&2='..Page..'&3='..j..'">预约教堂</a><br>')
			else
				API_ResponseWrite('<text>停止预约</text><br>')
			end
			API_ResponseWrite('<br><text>——————————————————————————————————</text><br>')
		end
	end
	if LiTangNum < (Page + 1) * 6 then
		for i = 1,(Page + 1) * 6 - LiTangNum do
			API_ResponseWrite('<br><br><br><br>')
		end
	end
	if LiTangNum > 6 then
		local BackPage = Page - 1
		local NextPage = Page + 1
		if Page == 0 then
			API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button_back_g.bmp"><text>        </text><a href="Marriage_LiTangLieBiao">返回</a><text>        </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="Marriage_ZuYongLiTang?1='..SelectDay..'&2='..NextPage..'">')
		elseif (Page + 1) * 6 < LiTangNum then
			API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="Marriage_ZuYongLiTang?1='..SelectDay..'&2='..BackPage..'"><text>        </text><a href="Marriage_LiTangLieBiao">返回</a><text>        </text><img src="LuaUse\\button_next_u.bmp" src2="LuaUse\\button_next_l.bmp" close="0" href="Marriage_ZuYongLiTang?1='..SelectDay..'&2='..NextPage..'">')
		else
			API_ResponseWrite('<br><text>            </text><img src="LuaUse\\button_back_u.bmp" src2="LuaUse\\button_back_l.bmp" close="0" href="Marriage_ZuYongLiTang?1='..SelectDay..'&2='..BackPage..'"><text>        </text><a href="Marriage_LiTangLieBiao">返回</a><text>        </text><img src="LuaUse\\button_next_g.bmp">')
		end
	end
	--API_ResponseWrite('<br><br><a href="Marriage_LiTangLieBiao">返回</a>')
end

function Marriage_HunLiLieBiao()
	local ActorID = API_RequestGetActorID()
	local Camp = API_GetActorCamp(ActorID)
	local Page = API_RequestGetNumber(2)
	local x,y
	local CampName = ''
	if Camp == 0 then
		x,y = 68,39
		CampName = '帝国'
	elseif Camp == 1 then
		x,y = 66,42
		CampName = '联邦'
	end
	if API_RequestGetNumber(3) > 0 then
		local MapID = API_RequestGetNumber(3)
		if Marriage_NewMapTable[MapID] == nil then
			API_ActorSendMsg(ActorID,2,'该婚礼场地已关闭，无法进入')
			return
		end
		if not API_MapIsValid(MapID) then
			API_ActorSendMsg(ActorID,2,'该婚礼场地已关闭，无法进入')
			return
		end
		local ZhuRenID = Marriage_NewMapTable[MapID].ZhuRenID
		local BanLvID = Marriage_NewMapTable[MapID].BanLvID
		if ActorID < 200 then
			API_ActorGoToMap(ActorID,MapID,x,y)
			return
		end
		if ActorID == ZhuRenID or ActorID == BanLvID then
			API_ActorGoToMap(ActorID,MapID,x,y)
			return
		end
		if API_ActorGetGoodsNum(ActorID, 73) > 0 then
			if API_GetInvitationHostID(ActorID) == ZhuRenID or API_GetInvitationHostID(ActorID) == BanLvID then 
				API_ActorGoToMap(ActorID,MapID,x,y)
				return
			else
				API_ActorSendMsg(ActorID,2,'请将这对新人的喜帖放在背包第一格位置再尝试进入婚礼教堂。')
				return
			end
		end
		API_ActorSendMsg(ActorID,2,'您没有这两位新人的喜帖，无法进入婚礼教堂。')
	end
	API_ResponseWrite('<name>结婚列表</name>')
	local LiTangNum = table.getn(Marriage_NewMapTable)
	if LiTangNum > 0 then
		local CampNum = 0
		for j in Marriage_NewMapTable do 
			local TCamp = Marriage_NewMapTable[j].Camp
			if Camp == TCamp then
				CampNum = CampNum + 1
			end
		end
		if CampNum > 0 then 
			API_ResponseWrite('<win rect="50,80,528,520"></win>')
			API_ResponseWrite('<text>  '..CampName..'正在结婚的新人列表如下：</text><br>')
			for j in Marriage_NewMapTable do 
				local ZhuRenName = Marriage_NewMapTable[j].ZhuRenName
				local BanLvName = Marriage_NewMapTable[j].BanLvName
				local TTime = Marriage_NewMapTable[j].Time
				local TCamp = Marriage_NewMapTable[j].Camp
				local Time = 120 - TTime
				if Camp == TCamp then
					local XinRenTip = ' '..ZhuRenName..' 和 '..BanLvName..' 的婚礼 '
					local XinRenTipLen = string.len(XinRenTip)
					if XinRenTipLen < 38 then
						for k = 1,38- XinRenTipLen do
							XinRenTip = XinRenTip..' '
						end
					end
					API_ResponseWrite('<br><text color="254,249,220">  '..XinRenTip..'</text><text>场地剩余时间：</text><text color="255,0,255">'..Time..' </text><text>分钟    </text>')
					API_ResponseWrite('<a href="Marriage_HunLiLieBiao?3='..j..'">进入婚礼教堂</a><br>')
					API_ResponseWrite('<br><text>————————————————————————————————————————</text><br>')
				end
			end
			if CampNum < 8 then
				local HunLiNum = 7 - CampNum
				for i = 1,HunLiNum,1 do
					API_ResponseWrite('<br><text></text><br>')
					API_ResponseWrite('<br><text>————————————————————————————————————————</text><br>')
				end
			end
		else
			API_ResponseWrite('<text>  '..CampName..'正在结婚的新人列表如下：</text><br>')
			API_ResponseWrite('<br><text>  目前没有玩家结婚</text><br>')
		end
	else
		API_ResponseWrite('<text>  '..CampName..'正在结婚的新人列表如下：</text><br>')
		API_ResponseWrite('<br><text>  目前没有玩家结婚</text><br>')
	end
	API_ResponseWrite('<br><br><a href="Marriage_ZhuShou_PanDuan_Title">  返回</a>')
end

function Marriage_HunLiChangDi(ActorID) --结婚场地，点击进入光圈后调用该函数
	--传送玩家去某个地方，根据阵营
	local ActorID = ActorID or API_RequestGetActorID()
	local Camp = API_GetActorCamp(ActorID)
	API_ResponseEnd()
	API_ResponseClear()
	if Camp == 0 then
		API_ActorGoToMap(ActorID,1,239,310)
	elseif Camp == 1 then
		API_ActorGoToMap(ActorID,2,316,228)
	end	
end

function Marriage_JieZhiDuiHuan() --兑换结婚戒指
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 1 then
		API_ResponseWrite('<text>您确定兑换</text><text color="255,0,255">爱情海钻戒</text><text>吗？</text><br>')
		API_ResponseWrite('<text>需要定情之戒、恋人之心、爱神守护三个戒指中的其中一个戒指和一个钻石</text>')
		API_ResponseWrite('<img srcgd="80558" tipgd="80558">') 
		API_ResponseWrite('<br><br><br><a href="Marriage_JieZhiDuiHuan?1=4">是的，我要兑换</a><br><br>')
		API_ResponseWrite('<a>算了，不兑换了</a>')
	elseif SelectItem == 2 then
		API_ResponseWrite('<text>您确定兑换</text><text color="255,0,255">恋人之心</text><text>吗？</text><br>')
		API_ResponseWrite('<text>需要定情之戒、爱情海钻戒、爱神守护三个戒指中的其中一个戒指和一个红宝石</text>')
		API_ResponseWrite('<img srcgd="80556" tipgd="80556">') 
		API_ResponseWrite('<br><br><br><a href="Marriage_JieZhiDuiHuan?1=5">是的，我要兑换</a><br><br>')
		API_ResponseWrite('<a>算了，不兑换了</a>')
	elseif SelectItem == 3 then
		API_ResponseWrite('<text>您确定兑换</text><text color="255,0,255">爱神守护</text><text>吗？</text><br>')
		API_ResponseWrite('<text>需要定情之戒、爱情海钻戒、恋人之心三个戒指中的其中一个戒指和一个黄宝石</text>')
		API_ResponseWrite('<img srcgd="80557" tipgd="80557">') 
		API_ResponseWrite('<br><br><br><a href="Marriage_JieZhiDuiHuan?1=6">是的，我要兑换</a><br><br>')
		API_ResponseWrite('<a>算了，不兑换了</a>')
	elseif SelectItem == 4 then
		if API_ActorGetGoodsNum(ActorID,10923) >= 1 and API_ActorGetGoodsNum(ActorID,80558) >= 1 or API_ActorGetGoodsNum(ActorID,10925) >= 1 and API_ActorGetGoodsNum(ActorID,80558) >= 1 or API_ActorGetGoodsNum(ActorID,10926) >= 1 and API_ActorGetGoodsNum(ActorID,80558) >= 1 then
			if API_ActorRemoveGoods(ActorID,10923,1,'删除定情之戒') and API_ActorRemoveGoods(ActorID,80558,1,'删除钻石') or API_ActorRemoveGoods(ActorID,10925,1,'删除恋人之心') and API_ActorRemoveGoods(ActorID,80558,1,'删除钻石') or API_ActorRemoveGoods(ActorID,10926,1,'删除爱神守护') and API_ActorRemoveGoods(ActorID,80558,1,'删除钻石') then
				API_AddActorGoods(ActorID,10924,1,'兑换爱情海钻戒')
				API_ActorSendMsg(ActorID,2,'获得一枚爱情海钻戒')
				API_ActorSendMsg(ActorID,7,'获得一枚爱情海钻戒')
			end
		else
			API_ActorSendMsg(ActorID,2,'材料不足，无法兑换，请确认您的背包里有足够的材料。')
		end
	elseif SelectItem == 5 then
		if API_ActorGetGoodsNum(ActorID,10923) >= 1 and API_ActorGetGoodsNum(ActorID,80556) >= 1 or API_ActorGetGoodsNum(ActorID,10924) >= 1 and API_ActorGetGoodsNum(ActorID,80556) >= 1 or API_ActorGetGoodsNum(ActorID,10926) >= 1 and API_ActorGetGoodsNum(ActorID,80556) >= 1 then
			if API_ActorRemoveGoods(ActorID,10923,1,'删除定情之戒') and API_ActorRemoveGoods(ActorID,80556,1,'删除红宝石') or API_ActorRemoveGoods(ActorID,10924,1,'删除爱情海钻戒') and API_ActorRemoveGoods(ActorID,80556,1,'删除红宝石') or API_ActorRemoveGoods(ActorID,10926,1,'删除爱神守护') and API_ActorRemoveGoods(ActorID,80556,1,'删除红宝石') then
				API_AddActorGoods(ActorID,10925,1,'兑换恋人之心')
				API_ActorSendMsg(ActorID,2,'获得一枚恋人之心')
				API_ActorSendMsg(ActorID,7,'获得一枚恋人之心')
			end
		else
			API_ActorSendMsg(ActorID,2,'材料不足，无法兑换，请确认您的背包里有足够的材料。')
		end
	elseif SelectItem == 6 then
		if API_ActorGetGoodsNum(ActorID,10923) >= 1 and API_ActorGetGoodsNum(ActorID,80557) >= 1 or API_ActorGetGoodsNum(ActorID,10924) >= 1 and API_ActorGetGoodsNum(ActorID,80557) >= 1 or API_ActorGetGoodsNum(ActorID,10925) >= 1 and API_ActorGetGoodsNum(ActorID,80557) >= 1 then
			if API_ActorRemoveGoods(ActorID,10923,1,'删除定情之戒') and API_ActorRemoveGoods(ActorID,80557,1,'删除黄宝石') or API_ActorRemoveGoods(ActorID,10924,1,'删除爱情海钻戒') and API_ActorRemoveGoods(ActorID,80557,1,'删除黄宝石') or API_ActorRemoveGoods(ActorID,10925,1,'删除恋人之心') and API_ActorRemoveGoods(ActorID,80557,1,'删除黄宝石') then
				API_AddActorGoods(ActorID,10926,1,'兑换爱神守护')
				API_ActorSendMsg(ActorID,2,'获得一枚爱神守护')
				API_ActorSendMsg(ActorID,7,'获得一枚爱神守护')
			end
		else
			API_ActorSendMsg(ActorID,2,'材料不足，无法兑换，请确认您的背包里有足够的材料。')
		end
	else
		API_ResponseWrite('<a href="Marriage_JieZhiDuiHuan?1=1">兑换爱情海钻戒</a><text>      来自浪漫之都的祝福，您们的爱情将永不磨灭。</text><br><br>')
		API_ResponseWrite('<a href="Marriage_JieZhiDuiHuan?1=2">兑换恋人之心</a><text>      还有什么比恋人的心更珍贵呢，用您的生命去珍藏它吧。</text><br><br>')
		API_ResponseWrite('<a href="Marriage_JieZhiDuiHuan?1=3">兑换爱神守护</a><text>      爱神赐予您们无尽的能量，愿您们相携到老，永生相守。</text><br><br>')
		API_ResponseWrite('<a href="Marriage_ZhuShou_PanDuan_Title">返回</a><br>')
	end
end

--------------------------结婚主持专用道具函数----------------------------------
Marriage_DGActorIDTable = {}
Marriage_LBActorIDTable = {}
Marriage_DGActorXYTable = {}
Marriage_LBActorXYTable = {}

function Marriage_ZhuChi_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local Camp = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	--如果要测试，注释掉这一段--
	if ActorID > 200 then
		API_ResponseWrite('<name>结婚圣典</name>')
		API_ResponseWrite('<text>  GM专用道具 ^_^ ，你不是GM哦，嘿嘿~</text><br>')
		API_ResponseWrite('<br><br><br><text>  </text><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end
	if Camp == 0 and MapConfigID ~= 81 then
		API_ResponseWrite('<name>结婚圣典</name>')
		API_ResponseWrite('<br><text>  结婚圣典只能在教堂内使用。</text><br>')
		API_ResponseWrite('<br><text>  </text><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	elseif Camp == 1 and MapConfigID ~= 40 then
		API_ResponseWrite('<name>结婚圣典</name>')
		API_ResponseWrite('<br><text>  结婚圣典只能在教堂内使用。</text><br>')
		API_ResponseWrite('<br><text>  </text><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end
	--注释上面那段--
	API_ResponseWrite('<name>结婚圣典</name>')
	API_ResponseWrite('<text>  我以神的名义赐于你们幸福！</text><br>')
	API_ResponseWrite('<br><text>   ①</text><a tip="播放婚礼进行曲" href="Marriage_ZhuChi_GongNeng?1=1">播放音乐</a>')
	API_ResponseWrite('<text>   ②</text><a tip="让天空下起美丽的玫瑰花瓣~" href="Marriage_ZhuChi_GongNeng?1=2">下玫瑰雨</a>')
	API_ResponseWrite('<text>   ③</text><a tip="各种绚丽的烟花让整个场地充满着浪漫的气息" href="Marriage_ZhuChi_YanHua">燃放烟花</a>')
	API_ResponseWrite('<text>   ④</text><a tip="对教堂内所有玩家发起结婚投票" href="Marriage_ZhuChi_TouPiao">发起投票</a>')
	API_ResponseWrite('<text>   ⑤</text><a tip="查看投票结果" href="Marriage_ZhuChi_ChaKanTouPiao">查看投票</a>')
	if Camp == 0 then
		API_ResponseWrite('<text>   ⑥</text><a tip="让婚礼变得更美丽吧" href="Marriage_ZhuangShiPin?1=1">装饰教堂</a>')
	else
		API_ResponseWrite('<text>   ⑥</text><a tip="让婚礼变得更美丽吧" href="Marriage_ZhuangShiPin?1=2">装饰教堂</a>')
	end
	API_ResponseWrite('<br><br><br><text>  </text><a>取消</a>')
	API_ResponseFlush(ActorID)
	return 0
end

function Marriage_ZhuChi_YanHua()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local Camp = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local ActorX,ActorY = PublicFun_GetActorPosXY(ActorID)
	local ZhenYingTable = {}
	if Camp == 0 then
		ZhenYingTable = Marriage_DGActorXYTable
	elseif Camp == 1 then
		ZhenYingTable = Marriage_LBActorXYTable
	end
	if API_RequestGetNumber(3) > 0 then
		local YanHuaNum = API_RequestGetNumber(3)
		if YanHuaNum < 1 then
			YanHuaNum = 1
		elseif YanHuaNum > 100 then
			YanHuaNum = 100
		end
		if ActorID > 200 then
			local Money = YanHuaNum * 500
			if API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD) >= Money then
				if API_ActorAddMoneyUnStat(ActorID,-Money,MarriageSystemTaskID,'结婚圣典放烟花') then
					for j = 1,YanHuaNum do
						local X = math.random(50,80)
						local Y = math.random(40,80)
						local MagicID = math.random(191,197)
						API_AddMagicToMap(MapID,X,Y,MagicID) 
					end
				end
			else
				API_ActorSendMsg(ActorID,2,'您身上的金币不足，无法燃放烟花')
			end
		else
			for j = 1,YanHuaNum do
				local X = math.random(50,80)
				local Y = math.random(40,80)
				local MagicID = math.random(191,197)
				API_AddMagicToMap(MapID,X,Y,MagicID) 
			end
		end
	end
	if XuanZe == 1 then
		if MapConfigID == 81 or MapConfigID == 40 then
			API_CreateTimerTriggerG(MapID,Camp,1,1,'Marriage_ZhuChi_YanHua_A')
		else
			API_ResponseWrite('<name>结婚圣典</name>')
			API_ResponseWrite('<br><text>  此功能只能在教堂内使用</text><br>')
			API_ResponseWrite('<br><text>  </text><a>确定</a>')
		end
	elseif XuanZe == 2 then
		if MapConfigID == 81 or MapConfigID == 40 then
			API_CreateTimerTriggerG(MapID,Camp,1,1,'Marriage_ZhuChi_YanHua_D')
		else
			API_ResponseWrite('<name>结婚圣典</name>')
			API_ResponseWrite('<br><text>  此功能只能在教堂内使用</text><br>')
			API_ResponseWrite('<br><text>  </text><a>确定</a>')
		end
	elseif XuanZe == 3 then
		if MapConfigID == 81 or MapConfigID == 40 then
			API_CreateTimerTriggerG(MapID,Camp,1,1,'Marriage_ZhuChi_YanHua_E')
		else
			API_ResponseWrite('<name>结婚圣典</name>')
			API_ResponseWrite('<br><text>  此功能只能在教堂内使用</text><br>')
			API_ResponseWrite('<br><text>  </text><a>确定</a>')
		end
	elseif XuanZe == 4 then
		if MapConfigID == 81 or MapConfigID == 40 then
			API_ResponseWrite('<name>结婚圣典</name>')
			API_ResponseWrite('<text>请输入烟花燃放的数量：</text>')
			API_ResponseWrite('<input type="number" name="3" size="3" width="45">')
			API_ResponseWrite('<a href="Marriage_ZhuChi_YanHua?1=4"> 开始燃放</a><br><br><text>每个烟花500金币，一次性最多燃放100个烟花。</text><br>')
			API_ResponseWrite('<br><a>取消</a><br>')
		else
			API_ResponseWrite('<name>结婚圣典</name>')
			API_ResponseWrite('<br><text>  此功能只能在教堂内使用</text><br>')
			API_ResponseWrite('<br><text>  </text><a>确定</a>')
		end
	elseif XuanZe == 5 then
		if MapConfigID == 81 or MapConfigID == 40 then
			if ZhenYingTable[ActorID] == nil then
				ZhenYingTable[ActorID] = {}
			end
			for j = 1,100 do
				if ZhenYingTable[ActorID][j] == nil then
					ZhenYingTable[ActorID][j] = {}
					repeat
						ZhenYingTable[ActorID][j].X = ActorX
						ZhenYingTable[ActorID][j].Y = ActorY
					until not ZhenYingTable[ActorID][j].X ~= nil
					API_ActorSendMsg(ActorID,2,'保存位置成功')
					break
				else
					j = j + 1
					if j > 100 then
						API_ActorSendMsg(ActorID,2,'最多只能保存100个位置')
						return
					end
					if ZhenYingTable[ActorID][j] == nil then
						ZhenYingTable[ActorID][j] = {}
						repeat
							ZhenYingTable[ActorID][j].X = ActorX
							ZhenYingTable[ActorID][j].Y = ActorY
						until not ZhenYingTable[ActorID][j].X ~= nil
						API_ActorSendMsg(ActorID,2,'保存位置成功')
						break
					end
				end
			end
		else
			API_ResponseWrite('<name>结婚圣典</name>')
			API_ResponseWrite('<br><text>  此功能只能在教堂内使用</text><br>')
			API_ResponseWrite('<br><text>  </text><a>确定</a>')
		end
	elseif XuanZe == 6 then
		if MapConfigID == 81 or MapConfigID == 40 then
			if ZhenYingTable[ActorID] == nil then
				API_ActorSendMsg(ActorID,2,'请先保存至少一个燃放烟花的位置')
				return
			end
			for j = 1,100 do
				if ZhenYingTable[ActorID][1] == nil then
					API_ActorSendMsg(ActorID,2,'请先保存至少一个燃放烟花的位置')
					return
				end
				if ZhenYingTable[ActorID][j] == nil then
					break
				end
				local X = ZhenYingTable[ActorID][j].X
				local Y = ZhenYingTable[ActorID][j].Y
				local MagicID = math.random(191,197)
				API_AddMagicToMap(MapID,X,Y,MagicID) 
			end
			ZhenYingTable[ActorID] = {}
			API_ActorSendMsg(ActorID,2,'燃放烟花完毕并清除所有保存位置')
		else
			API_ResponseWrite('<name>结婚圣典</name>')
			API_ResponseWrite('<br><text>  此功能只能在教堂内使用</text><br>')
			API_ResponseWrite('<br><text>  </text><a>确定</a>')
		end
	elseif XuanZe == 7 then
		API_ActorStartSelect(ActorID,'Marriage_ZhuChi_XinYanHua',15)
		API_ActorSendMsg(ActorID,3,'请点击燃放烟花的目标')
	else
		API_ResponseWrite('<name>结婚圣典</name>')
		API_ResponseWrite('<text>  用绚丽的烟花点缀这美好的时刻……</text><br>')
		API_ResponseWrite('<br><text>   ①</text><a tip="一波接一波，高潮迭起" href="Marriage_ZhuChi_YanHua?1=1">波涛汹涌</a>')
		API_ResponseWrite('<text>   ②</text><a tip="让爱情爆发的更猛烈些吧~" href="Marriage_ZhuChi_YanHua?1=2">激情澎湃</a>')
		API_ResponseWrite('<text>   ③</text><a tip="让我们的心永不分离" href="Marriage_ZhuChi_YanHua?1=3">心心相映</a>')
		API_ResponseWrite('<text>   ④</text><a tip="在整个教堂内随机燃放烟花，无比的绚丽~" href="Marriage_ZhuChi_YanHua?1=4">随机燃放</a>')
		API_ResponseWrite('<br><br><text>   ⑤</text><a tip="走到一个位置，按这个按钮，可以保存所在位置的坐标" href="Marriage_ZhuChi_YanHua?1=5">自定义烟花位置</a>')
		API_ResponseWrite('<text>   ⑥</text><a tip="在保存的位置燃放烟花，并清除保存的坐标" href="Marriage_ZhuChi_YanHua?1=6">燃放自定义烟花</a>')
		API_ResponseWrite('<br><br><text>   ⑦</text><a tip="以目标为中心燃放心型烟花" href="Marriage_ZhuChi_YanHua?1=7">定点燃放</a>')
		API_ResponseWrite('<br><br><br><text>  </text><a>取消</a>')
	end
end

function Marriage_ZhuChi_XinYanHua()
	local ActorID = API_RequestGetNumber(1)
	local SelectType = API_RequestGetNumber(2)
	local OtherID = API_RequestGetNumber(3)
	local Camp = API_GetActorCamp(ActorID)
	local YanHua
	if Camp == 0 then
		YanHua = 192
	elseif Camp == 1 then
		YanHua = 193
	end
	if SelectType == 0 then
		API_ActorStartSelect(ActorID,'Marriage_ZhuChi_XinYanHua',15)
		API_ActorSendMsg(ActorID,3,'请点击燃放烟花的目标')
	elseif SelectType == 1 then
		API_ActorStartSelect(ActorID,'Marriage_ZhuChi_XinYanHua',15)
		API_ActorSendMsg(ActorID,3,'请点击燃放烟花的目标')
	elseif SelectType == 2 then
		if API_ActorIsOnline(OtherID) then
			local MapID = API_GetActorMapID(OtherID) 
			local X,Y = PublicFun_GetActorPosXY(OtherID) 
			API_AddMagicToMap(MapID,X+2,Y-2,YanHua) 
			API_AddMagicToMap(MapID,X+2,Y,YanHua) 
			API_AddMagicToMap(MapID,X+3,Y+1,YanHua) 
			API_AddMagicToMap(MapID,X+5,Y+1,YanHua) 
			API_AddMagicToMap(MapID,X+7,Y-1,YanHua) 
			API_AddMagicToMap(MapID,X+8,Y-3,YanHua) 
			API_AddMagicToMap(MapID,X+8,Y-5,YanHua) 
			API_AddMagicToMap(MapID,X+8,Y-8,YanHua) 
			API_AddMagicToMap(MapID,X+5,Y-8,YanHua) 
			API_AddMagicToMap(MapID,X+3,Y-8,YanHua) 
			API_AddMagicToMap(MapID,X+1,Y-7,YanHua) 
			API_AddMagicToMap(MapID,X-1,Y-5,YanHua) 
			API_AddMagicToMap(MapID,X-1,Y-3,YanHua) 
			API_AddMagicToMap(MapID,X,Y-2,YanHua) 
		end
	else
		API_ActorStartSelect(ActorID,'Marriage_ZhuChi_XinYanHua',15)
		API_ActorSendMsg(ActorID,3,'请点击燃放烟花的目标')
	end
	
end

function Marriage_ZhuChi_YanHua_A(MapID,Camp)
	if Camp == 0 then
		API_AddMagicToMap(MapID,54,52,195) 
		API_AddMagicToMap(MapID,58,52,195) 
		API_AddMagicToMap(MapID,62,52,195) 
		API_AddMagicToMap(MapID,70,52,195) 
		API_AddMagicToMap(MapID,74,52,195) 
		API_AddMagicToMap(MapID,78,52,195) 
	elseif Camp == 1 then
		API_AddMagicToMap(MapID,51,52,195) 
		API_AddMagicToMap(MapID,56,52,195) 
		API_AddMagicToMap(MapID,61,52,195) 
		API_AddMagicToMap(MapID,68,51,195) 
		API_AddMagicToMap(MapID,72,51,195) 
		API_AddMagicToMap(MapID,77,51,195)
	end
	API_CreateTimerTriggerG(MapID,Camp,2,1,'Marriage_ZhuChi_YanHua_B')
end

function Marriage_ZhuChi_YanHua_B(MapID,Camp)
	if Camp == 0 then
		API_AddMagicToMap(MapID,54,60,197) 
		API_AddMagicToMap(MapID,58,60,197) 
		API_AddMagicToMap(MapID,62,60,197) 
		API_AddMagicToMap(MapID,70,60,197) 
		API_AddMagicToMap(MapID,74,60,197) 
		API_AddMagicToMap(MapID,78,60,197)  
	elseif Camp == 1 then
		API_AddMagicToMap(MapID,51,60,197) 
		API_AddMagicToMap(MapID,56,60,197) 
		API_AddMagicToMap(MapID,61,60,197) 
		API_AddMagicToMap(MapID,68,59,197) 
		API_AddMagicToMap(MapID,72,59,197) 
		API_AddMagicToMap(MapID,77,59,197) 
	end
	API_CreateTimerTriggerG(MapID,Camp,2,1,'Marriage_ZhuChi_YanHua_C')
end

function Marriage_ZhuChi_YanHua_C(MapID,Camp)
	if Camp == 0 then
		API_AddMagicToMap(MapID,54,66,194) 
		API_AddMagicToMap(MapID,58,66,194) 
		API_AddMagicToMap(MapID,62,66,194) 
		API_AddMagicToMap(MapID,70,66,194) 
		API_AddMagicToMap(MapID,74,66,194) 
		API_AddMagicToMap(MapID,78,66,194) 
	elseif Camp == 1 then
		API_AddMagicToMap(MapID,51,66,194) 
		API_AddMagicToMap(MapID,56,66,194) 
		API_AddMagicToMap(MapID,61,66,194) 
		API_AddMagicToMap(MapID,68,65,194) 
		API_AddMagicToMap(MapID,72,65,194) 
		API_AddMagicToMap(MapID,77,65,194) 
	end
end

function Marriage_ZhuChi_YanHua_D(MapID,Camp)
	if Camp == 0 then
		API_AddMagicToMap(MapID,71,78,191) 
		API_AddMagicToMap(MapID,70,74,191) 
		API_AddMagicToMap(MapID,67,71,191) 
		API_AddMagicToMap(MapID,62,72,191) 
		API_AddMagicToMap(MapID,59,76,191) 
		API_AddMagicToMap(MapID,58,79,191) 
	elseif Camp == 1 then
		API_AddMagicToMap(MapID,70,79,191) 
		API_AddMagicToMap(MapID,69,74,191) 
		API_AddMagicToMap(MapID,67,71,191) 
		API_AddMagicToMap(MapID,61,71,191) 
		API_AddMagicToMap(MapID,57,75,191) 
		API_AddMagicToMap(MapID,55,80,191) 
	end
end

function Marriage_ZhuChi_YanHua_E(MapID,Camp)
	if Camp == 0 then
		API_AddMagicToMap(MapID,63,74,192) 
		API_AddMagicToMap(MapID,63,76,192) 
		API_AddMagicToMap(MapID,64,77,192) 
		API_AddMagicToMap(MapID,66,77,192) 
		API_AddMagicToMap(MapID,68,75,192) 
		API_AddMagicToMap(MapID,69,73,192) 
		API_AddMagicToMap(MapID,69,71,192) 
		API_AddMagicToMap(MapID,69,68,192) 
		API_AddMagicToMap(MapID,66,68,192) 
		API_AddMagicToMap(MapID,64,68,192) 
		API_AddMagicToMap(MapID,62,69,192) 
		API_AddMagicToMap(MapID,60,71,192) 
		API_AddMagicToMap(MapID,60,73,192) 
		API_AddMagicToMap(MapID,61,74,192) 
	elseif Camp == 1 then
		API_AddMagicToMap(MapID,61,74,193) 
		API_AddMagicToMap(MapID,61,76,193) 
		API_AddMagicToMap(MapID,62,77,193) 
		API_AddMagicToMap(MapID,64,77,193) 
		API_AddMagicToMap(MapID,66,75,193) 
		API_AddMagicToMap(MapID,67,73,193) 
		API_AddMagicToMap(MapID,67,71,193) 
		API_AddMagicToMap(MapID,67,68,193) 
		API_AddMagicToMap(MapID,64,68,193) 
		API_AddMagicToMap(MapID,62,68,193) 
		API_AddMagicToMap(MapID,60,69,193) 
		API_AddMagicToMap(MapID,58,71,193) 
		API_AddMagicToMap(MapID,58,73,193) 
		API_AddMagicToMap(MapID,59,74,193) 
	end
end

function Marriage_ZhuChi_GongNeng()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local Camp = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if XuanZe == 1 then
		if Camp == 0 and MapConfigID == 81 then
			API_ActorCallBack(MapID,0,-1,'Marriage_Music')
		elseif Camp == 1 and MapConfigID == 40 then
			API_ActorCallBack(MapID,0,-1,'Marriage_Music')
		else
			API_ResponseWrite('<name>结婚圣典</name>')
			API_ResponseWrite('<br><text>  此功能只能在教堂内使用</text><br>')
			API_ResponseWrite('<br><text>  </text><a>确定</a>')
		end
	elseif XuanZe == 2 then
		if Camp == 0 and MapConfigID == 81 then
			API_BroadcastScreenEffect(MapID,1)
		elseif Camp == 1 and MapConfigID == 40 then
			API_BroadcastScreenEffect(MapID,1)
		else
			API_ResponseWrite('<name>结婚圣典</name>')
			API_ResponseWrite('<br><text>  此功能只能在教堂内使用</text><br>')
			API_ResponseWrite('<br><text>  </text><a>确定</a>')
		end
	end
end

function Marriage_ZhuChi_TouPiao()
	local ActorID = API_RequestGetActorID()
	local Camp = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if Marriage_NewMapTable[MapID] == nil then
		API_ActorSendMsg(ActorID,2,'错误，只能在玩家开启的教堂内使用')
		return
	end
	if Camp == 0 and MapConfigID == 81 then
		API_ActorCallBack(MapID,0,-1,'Marriage_ZhuChi_TouPiao2')
	elseif Camp == 1 and MapConfigID == 40 then
		API_ActorCallBack(MapID,0,-1,'Marriage_ZhuChi_TouPiao2')
	else
		API_ResponseWrite('<name>结婚圣典</name>')
		API_ResponseWrite('<br><text>  此功能只能在教堂内使用</text><br>')
		API_ResponseWrite('<br><text>  </text><a>确定</a>')
	end
end

function Marriage_ZhuChi_TouPiao2(ActorID)
	if ActorID < 200 then
		return
	end
	local Camp = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	if Marriage_NewMapTable[MapID] == nil then
		API_ActorSendMsg(ActorID,2,'错误，只能在玩家开启的教堂内使用')
		return
	end
	local ZhuRenName = Marriage_NewMapTable[MapID].ZhuRenName
	local BanLvName = Marriage_NewMapTable[MapID].BanLvName
	API_ResponseWrite('<name>结婚圣典</name>')
	API_ResponseWrite('<br><text>  你是否同意让</text><text color="255,0,255"> '..ZhuRenName..' </text><text>和</text><text color="255,0,255"> '..BanLvName..' </text><text>结婚呢？（请在下面写上同意或不同意的理由）</text><br><br>')
	API_ResponseWrite('<text>  </text><input type="string" name="3" bFilter="1" size="60" width="350"><br>')
	API_ResponseWrite('<br><text>  </text><a href="Marriage_ZhuChi_TouPiao3?1=1">同意</a><br>')
	API_ResponseWrite('<br><text>  </text><a href="Marriage_ZhuChi_TouPiao3?1=2">不同意</a>')
	API_ResponseFlush(ActorID) 
end

function Marriage_ZhuChi_TouPiao3()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local LiYou = API_RequestGetString(3)
	local Camp = API_GetActorCamp(ActorID)
	local TouPiaoBiao = {}
	if Camp == 0 then
		TouPiaoBiao = Marriage_DGActorIDTable
	elseif Camp == 1 then
		TouPiaoBiao = Marriage_LBActorIDTable
	end
	if XuanZe == 1 then
		for i = 1,table.getn(TouPiaoBiao) do 
			if TouPiaoBiao[i].ActorID == ActorID then
				API_ActorSendMsg(ActorID,2,'你已经投过票了，不能重复投票')
				return
			end
		end
		for j = 1,100 do
			if TouPiaoBiao[j] == nil then
				TouPiaoBiao[j] = {}
				repeat
					TouPiaoBiao[j].ActorID = ActorID
					TouPiaoBiao[j].Yes = 1
					TouPiaoBiao[j].No = 0
					TouPiaoBiao[j].LiYou = LiYou
				until not TouPiaoBiao[j].ActorID ~= nil
				API_ResponseWrite('<name>结婚圣典</name>')
				API_ResponseWrite('<br><text>  投票成功：同意</text><br>')
				API_ResponseWrite('<br><text>  </text><a>确定</a>')
				break
			else
				j = j + 1
				if j > 100 then
					API_ActorSendMsg(ActorID,2,'最多只能允许100人投票')
					return
				end
				if TouPiaoBiao[j] == nil then
					TouPiaoBiao[j] = {}
					repeat
						TouPiaoBiao[j].ActorID = ActorID
						TouPiaoBiao[j].Yes = 1
						TouPiaoBiao[j].No = 0
						TouPiaoBiao[j].LiYou = LiYou
					until not TouPiaoBiao[j].ActorID ~= nil
					API_ResponseWrite('<name>结婚圣典</name>')
					API_ResponseWrite('<br><text>  投票成功：同意</text><br>')
					API_ResponseWrite('<br><text>  </text><a>确定</a>')
					break
				end
			end	
		end
	elseif XuanZe == 2 then
		for i = 1,table.getn(TouPiaoBiao) do 
			if TouPiaoBiao[i].ActorID == ActorID then
				API_ActorSendMsg(ActorID,2,'你已经投过票了，不能重复投票')
				return
			end
		end
		for j = 1,100 do
			if TouPiaoBiao[j] == nil then
				TouPiaoBiao[j] = {}
				repeat
					TouPiaoBiao[j].ActorID = ActorID
					TouPiaoBiao[j].No = 1
					TouPiaoBiao[j].Yes = 0
					TouPiaoBiao[j].LiYou = LiYou
				until not TouPiaoBiao[j].ActorID ~= nil
				API_ResponseWrite('<name>结婚圣典</name>')
				API_ResponseWrite('<br><text>  投票成功：不同意</text><br>')
				API_ResponseWrite('<br><text>  </text><a>确定</a>')
				break
			else				
				j = j + 1
				if j > 100 then
					API_ActorSendMsg(ActorID,2,'最多只能允许100人投票')
					return
				end
				if TouPiaoBiao[j] == nil then
					TouPiaoBiao[j] = {}
					repeat
						TouPiaoBiao[j].ActorID = ActorID
						TouPiaoBiao[j].No = 1
						TouPiaoBiao[j].Yes = 0
						TouPiaoBiao[j].LiYou = LiYou
					until not TouPiaoBiao[j].ActorID ~= nil
					API_ResponseWrite('<name>结婚圣典</name>')
					API_ResponseWrite('<br><text>  投票成功：不同意</text><br>')
					API_ResponseWrite('<br><text>  </text><a>确定</a>')
					break
				end
			end	
		end
	end
end

--这里对角色ID做了限制，只有GM和新人才可以看详细的投票名单
function Marriage_ZhuChi_ChaKanTouPiao(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	local Camp = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local TouPiaoBiao = {}
	if Marriage_NewMapTable[MapID] == nil then
		if ActorID < 200 then
			API_ActorSendMsg(ActorID,2,'错误，只能在玩家开启的教堂内使用')
			return
		end
	end
	if Camp == 0 then
		TouPiaoBiao = Marriage_DGActorIDTable
	elseif Camp == 1 then
		TouPiaoBiao = Marriage_LBActorIDTable
	end
	local ZhuRenID = Marriage_NewMapTable[MapID].ZhuRenID
	local BanLvID = Marriage_NewMapTable[MapID].BanLvID
	local Y = 0
	local N = 0
	API_ResponseWrite('<name>投票结果</name>')
	if ActorID < 200 or ActorID == ZhuRenID or ActorID == BanLvID then 
		API_ResponseWrite('<win rect="50,80,480,480"></win>')
		for j = 1,table.getn(TouPiaoBiao) do 
			if TouPiaoBiao[j] == nil then
				break
			end
			local PlayID = TouPiaoBiao[j].ActorID
			local Yes = TouPiaoBiao[j].Yes
			local No = TouPiaoBiao[j].No
			local LiYou = TouPiaoBiao[j].LiYou
			local JieGuo = ''
			if API_ActorIsOnline(PlayID) then
				if Yes == 1 and No == 0 then
					JieGuo = ''..API_GetActorName(PlayID)..' 投票：同意'
					Y = Y + 1
				elseif No == 1 and Yes == 0 then
					JieGuo = ''..API_GetActorName(PlayID)..' 投票：不同意'
					N = N + 1
				else
					JieGuo = ''..API_GetActorName(PlayID)..' 投票：保持意见'
				end
				local JieGuoTip = ''..JieGuo..''
				local JieGuoTipLen = string.len(JieGuoTip)
				if JieGuoTipLen < 40 then
					for j = 1,40- JieGuoTipLen do
						JieGuoTip = JieGuoTip..' '
					end
				end
				API_ResponseWrite('<text> '..JieGuoTip..'</text>')
				API_ResponseWrite('<a href="Marriage_ZhuChi_ChaKanTouPiao2?1=1&2='..PlayID..'">把TA变成……</a>')
				API_ResponseWrite('<br><text> TA想说：'..LiYou..'</text>')
			else
				API_ResponseWrite('<text> 此人不在线</text>')
			end
			API_ResponseWrite('<br><text>———————————————————————————————————</text><br>')
		end
		API_ResponseWrite('<br><text>同意： '..Y..' 人    不同意： '..N..' 人</text><br><br>')
	else
		for j = 1,table.getn(TouPiaoBiao) do 
			if TouPiaoBiao[j] == nil then
				break
			end
			local Yes = TouPiaoBiao[j].Yes
			local No = TouPiaoBiao[j].No
			if Yes == 1 and No == 0 then
				Y = Y + 1
			elseif No == 1 and Yes == 0 then
				N = N + 1
			end
		end
		API_ResponseWrite('<br><text>同意： '..Y..' 人    不同意： '..N..' 人</text><br><br>')
	end
	
	if ActorID < 200 then
		API_ResponseWrite('<a href="Marriage_ZhuChi_ChaKanTouPiao2?1=2">清除投票结果</a><text>         </text>')
		API_ResponseWrite('<a href="Marriage_ZhuChi_ChaKanTouPiao2?1=3">公布投票结果</a><text>         </text>')
	end
	API_ResponseWrite('<a>关闭</a><br>')
	API_ResponseFlush(ActorID)
end

function Marriage_ZhuChi_ChaKanTouPiao2()
	local ActorID = API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local PigID = API_RequestGetNumber(2)
	local Camp = API_GetActorCamp(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if XuanZe == 1 then
		local bianshenbuff = fhjhd_bianshentangguobufftable[math.random(table.getn(fhjhd_bianshentangguobufftable))]
		API_ActorAddStatus(PigID,bianshenbuff,0) 
		API_ActorSendMsg(ActorID,2,'恶搞成功')
		API_ActorBroadcastMsg(MapID,1,''..API_GetActorName(ActorID)..'把'..API_GetActorName(PigID)..'变成了……')
		API_ResponseWrite('<br><text>恶搞成功</text><br><br>')
		API_ResponseWrite('<a href="Marriage_ZhuChi_ChaKanTouPiao">返回</a>')
	elseif XuanZe == 2 then
		if Camp == 0 then
			Marriage_DGActorIDTable = {}
			API_ActorSendMsg(ActorID,2,'清除投票结果成功')
		elseif Camp == 1 then
			Marriage_LBActorIDTable = {}
			API_ActorSendMsg(ActorID,2,'清除投票结果成功')
		end
	elseif XuanZe == 3 then
		if Camp == 0 and MapConfigID == 81 then
			API_ActorCallBack(MapID,0,-1,'Marriage_ZhuChi_ChaKanTouPiao')
		elseif Camp == 1 and MapConfigID == 40 then
			API_ActorCallBack(MapID,0,-1,'Marriage_ZhuChi_ChaKanTouPiao')
		else
			API_ResponseWrite('<name>结婚圣典</name>')
			API_ResponseWrite('<br><text>  此功能只能在教堂内使用</text><br>')
			API_ResponseWrite('<br><text>  </text><a>确定</a>')
		end
	end
end
