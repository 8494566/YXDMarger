----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\SkillGoods.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-3-26
--版  本:	1.0
--描  述:	使用物品调用技能
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 谭明礼
--日  期: 2009-4-1
--描  述: 修改点金手套、增加伯爵士气药酒和超级士气药酒
----------------------------------------------------------------------------------------------------------------------
local HeroBook1 = 88125
local HeroBook1fenye1 = 88101
local HeroBook1fenye2 = 88102
local HeroBook1fenye3 = 88103
local HeroBook1fenye4 = 88104
local HeroBook2 = 88126
local HeroBook2fenye1 = 88105
local HeroBook2fenye2 = 88106
local HeroBook2fenye3 = 88107
local HeroBook2fenye4 = 88108
local HeroBook3 = 88127
local HeroBook3fenye1 = 88109
local HeroBook3fenye2 = 88110
local HeroBook3fenye3 = 88111
local HeroBook3fenye4 = 88112
local HeroBook4 = 88128
local HeroBook4fenye1 = 88113
local HeroBook4fenye2 = 88114
local HeroBook4fenye3 = 88115
local HeroBook4fenye4 = 88116
local HeroBook5 = 88129
local HeroBook5fenye1 = 88117
local HeroBook5fenye2 = 88118
local HeroBook5fenye3 = 88119
local HeroBook5fenye4 = 88120
local HeroBook6 = 88130 
local HeroBook6fenye1 = 88121
local HeroBook6fenye2 = 88122
local HeroBook6fenye3 = 88123
local HeroBook6fenye4 = 88124
local HeroBook7 = 88603 
local HeroBook7fenye1 = 88591
local HeroBook7fenye2 = 88592
local HeroBook7fenye3 = 88593
local HeroBook7fenye4 = 88594
local HeroBook8 = 88604 
local HeroBook8fenye1 = 88595
local HeroBook8fenye2 = 88596
local HeroBook8fenye3 = 88597
local HeroBook8fenye4 = 88598
local HeroBook9 = 88605 
local HeroBook9fenye1 = 88599
local HeroBook9fenye2 = 88600
local HeroBook9fenye3 = 88601
local HeroBook9fenye4 = 88602
local HeroBook10 = 88932 
local HeroBook10fenye1 = 88920
local HeroBook10fenye2 = 88921
local HeroBook10fenye3 = 88922
local HeroBook10fenye4 = 88923
local HeroBook11 = 88933 
local HeroBook11fenye1 = 88924
local HeroBook11fenye2 = 88925
local HeroBook11fenye3 = 88926
local HeroBook11fenye4 = 88927
local HeroBook12 = 88934 
local HeroBook12fenye1 = 88928
local HeroBook12fenye2 = 88929
local HeroBook12fenye3 = 88930
local HeroBook12fenye4 = 88931
local HeroBook13 = 89137
local HeroBook13fenye1 = 89133
local HeroBook13fenye2 = 89134
local HeroBook13fenye3 = 89135
local HeroBook13fenye4 = 89136
local HeroBook14 = 89142 
local HeroBook14fenye1 = 89138
local HeroBook14fenye2 = 89139
local HeroBook14fenye3 = 89140
local HeroBook14fenye4 = 89141
local HeroBook15 = 89147 
local HeroBook15fenye1 = 89143
local HeroBook15fenye2 = 89144
local HeroBook15fenye3 = 89145
local HeroBook15fenye4 = 89146
local HeroBook16 = 89175
local HeroBook16fenye1 = 89171
local HeroBook16fenye2 = 89172
local HeroBook16fenye3 = 89173
local HeroBook16fenye4 = 89174
local HeroBook17 = 89180 
local HeroBook17fenye1 = 89176
local HeroBook17fenye2 = 89177
local HeroBook17fenye3 = 89178
local HeroBook17fenye4 = 89179
local HeroBook18 = 89185 
local HeroBook18fenye1 = 89181
local HeroBook18fenye2 = 89182
local HeroBook18fenye3 = 89183
local HeroBook18fenye4 = 89184
local HeroBook19 = 89236 
local HeroBook19fenye1 = 89232
local HeroBook19fenye2 = 89233
local HeroBook19fenye3 = 89234
local HeroBook19fenye4 = 89235
local HeroBook20 = 89241
local HeroBook20fenye1 = 89237
local HeroBook20fenye2 = 89238
local HeroBook20fenye3 = 89239
local HeroBook20fenye4 = 89240
local HeroBook21 = 89246
local HeroBook21fenye1 = 89242
local HeroBook21fenye2 = 89243
local HeroBook21fenye3 = 89244
local HeroBook21fenye4 = 89245
HeroSkillBookTable = {
[HeroBook1]={HeroBook1fenye1,HeroBook1fenye2,HeroBook1fenye3,HeroBook1fenye4,},
[HeroBook2]={HeroBook2fenye1,HeroBook2fenye2,HeroBook2fenye3,HeroBook2fenye4,},
[HeroBook3]={HeroBook3fenye1,HeroBook3fenye2,HeroBook3fenye3,HeroBook3fenye4,},
[HeroBook4]={HeroBook4fenye1,HeroBook4fenye2,HeroBook4fenye3,HeroBook4fenye4,},
[HeroBook5]={HeroBook5fenye1,HeroBook5fenye2,HeroBook5fenye3,HeroBook5fenye4,},
[HeroBook6]={HeroBook6fenye1,HeroBook6fenye2,HeroBook6fenye3,HeroBook6fenye4,},
[HeroBook7]={HeroBook7fenye1,HeroBook7fenye2,HeroBook7fenye3,HeroBook7fenye4,},
[HeroBook8]={HeroBook8fenye1,HeroBook8fenye2,HeroBook8fenye3,HeroBook8fenye4,},
[HeroBook9]={HeroBook9fenye1,HeroBook9fenye2,HeroBook9fenye3,HeroBook9fenye4,},
[HeroBook10]={HeroBook10fenye1,HeroBook10fenye2,HeroBook10fenye3,HeroBook10fenye4,},
[HeroBook11]={HeroBook11fenye1,HeroBook11fenye2,HeroBook11fenye3,HeroBook11fenye4,},
[HeroBook12]={HeroBook12fenye1,HeroBook12fenye2,HeroBook12fenye3,HeroBook12fenye4,},
[HeroBook13]={HeroBook13fenye1,HeroBook13fenye2,HeroBook13fenye3,HeroBook13fenye4,},
[HeroBook14]={HeroBook14fenye1,HeroBook14fenye2,HeroBook14fenye3,HeroBook14fenye4,},
[HeroBook15]={HeroBook15fenye1,HeroBook15fenye2,HeroBook15fenye3,HeroBook15fenye4,},
[HeroBook16]={HeroBook16fenye1,HeroBook16fenye2,HeroBook16fenye3,HeroBook16fenye4,},
[HeroBook17]={HeroBook17fenye1,HeroBook17fenye2,HeroBook17fenye3,HeroBook17fenye4,},
[HeroBook18]={HeroBook18fenye1,HeroBook18fenye2,HeroBook18fenye3,HeroBook18fenye4,},
[HeroBook19]={HeroBook19fenye1,HeroBook19fenye2,HeroBook19fenye3,HeroBook19fenye4,},
[HeroBook20]={HeroBook20fenye1,HeroBook20fenye2,HeroBook20fenye3,HeroBook20fenye4,},
[HeroBook21]={HeroBook21fenye1,HeroBook21fenye2,HeroBook21fenye3,HeroBook21fenye4,},
}
HeroSkillBookTable2 = {
[HeroBook1]={heroid = 25,heroname='魔王',},
[HeroBook2]={heroid = 26,heroname='血战',},
[HeroBook3]={heroid = 27,heroname='暗影',},
[HeroBook4]={heroid = 28,heroname='飞侠',},
[HeroBook5]={heroid = 29,heroname='刀锋',},
[HeroBook6]={heroid = 30,heroname='黑法',},
[HeroBook7]={heroid = 32,heroname='双子英雄',},
[HeroBook8]={heroid = 31,heroname='使魔',},
[HeroBook9]={heroid = 33,heroname='赌神',},
[HeroBook10]={heroid = 34,heroname='浪客',},
[HeroBook11]={heroid = 35,heroname='RX',},
[HeroBook12]={heroid = 36,heroname='星云',},
[HeroBook13]={heroid = 37,heroname='武僧',},
[HeroBook14]={heroid = 38,heroname='亡灵',},
[HeroBook15]={heroid = 39,heroname='海贼',},
[HeroBook16]={heroid = 40,heroname='圣盾',},
[HeroBook17]={heroid = 41,heroname='元素',},
[HeroBook18]={heroid = 42,heroname='炼金',},
[HeroBook19]={heroid = 43,heroname='巨魔',},
[HeroBook20]={heroid = 44,heroname='水妖',},
[HeroBook21]={heroid = 45,heroname='炎兽',},
[89253]={heroid = 46,heroname='耶舒',},
[89247]={heroid = 47,heroname='索尔',},
[89249]={heroid = 48,heroname='蒂尔',},
[89248]={heroid = 49,heroname='靡尔',},
[89250]={heroid = 50,heroname='魔帝',},
[89251]={heroid = 51,heroname='忍者',},
[89252]={heroid = 52,heroname='天启',},
[89267]={heroid = 53,heroname='无极',},
}
SkyCityBUFF_Table = {101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,301,302,303,304,305}
--英雄技能书
function HeroSkillBooksuipianshiyong(ActorID,GoodsID)	
--API_Trace('11111=')
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = GoodsID or API_RequestGetNumber(1)
	local HeroBookID = 0
	for i in HeroSkillBookTable do
		if HeroSkillBookTable[i] ~= nil then
			for j in HeroSkillBookTable[i] do
				if HeroSkillBookTable[i][j] == GoodsID then
					HeroBookID = i
--API_Trace('HeroBookID='..HeroBookID)					
				end
			end
		end
	end
	local HeroBookfenye1 = 0
	local HeroBookfenye2 = 0
	local HeroBookfenye3 = 0
	local HeroBookfenye4 = 0
	HeroBookfenye1 = HeroSkillBookTable[HeroBookID][1]
	HeroBookfenye2 = HeroSkillBookTable[HeroBookID][2]
	HeroBookfenye3 = HeroSkillBookTable[HeroBookID][3]
	HeroBookfenye4 = HeroSkillBookTable[HeroBookID][4]
	if HeroBookfenye1 == 0 or HeroBookfenye2 == 0 or HeroBookfenye3 == 0 or HeroBookfenye4 == 0 then
		return 0
	end
	if HeroBookID == 0 then
		return 0 
	end
	local hecheng = 1
	for i in HeroSkillBookTable[HeroBookID] do
		if API_ActorGetGoodsNum(ActorID,HeroSkillBookTable[HeroBookID][i]) == 0 then
			hecheng = 0
		end
	end
	local heroname = ''
	for i in HeroSkillBookTable2 do
		if heroid == HeroSkillBookTable2[i].heroid then
			heroname = HeroSkillBookTable2[i].heroname
		end
	end 
	API_ResponseWrite('<name>英雄技能书合成</name>')
	API_ResponseWrite('<win rect="600,200,330,250"></win>') 
	API_ResponseWrite('<text color="0,255,0">合成</text><img srcgd="'..HeroBookID..'" tipgd="'..HeroBookID..'" ><text color="0,255,0">需要</text><img srcgd="'..HeroBookfenye1..'" tipgd="'..HeroBookfenye1..'" ><img srcgd="'..HeroBookfenye2..'" tipgd="'..HeroBookfenye2..'" ><img srcgd="'..HeroBookfenye3..'" tipgd="'..HeroBookfenye3..'" ><img srcgd="'..HeroBookfenye4..'" tipgd="'..HeroBookfenye4..'" ><br><br>')
	if hecheng==1 then
		API_ResponseWrite('<text color="0,255,0">请把这四卷放入提交框中进行合成</text><br><br>')
		API_ResponseWrite('<goodsHolder name="1"><goodsHolder name="2"><goodsHolder name="3"><goodsHolder name="4"><br>')
		API_OpenWindow(ActorID,68,1)
		API_ResponseWrite('<a href="HeroSkillBooksuipianhecheng?5='..ActorID..'&6='..HeroBookID..'">合成英雄技能书</a><br><br>')
	else
		API_ResponseWrite('<text color="0,255,0">请准备好一、二、三、四卷后，进行技能书合成</text><br><br>')
	end
	API_ResponseWrite('<a>关闭</a><br>')
	API_ResponseFlush(ActorID)
	return 1
end
function HeroSkillBooksuipianhecheng(ActorID,HeroBookID)
	local ActorID = API_RequestGetNumber(5)
	local HeroBookID = API_RequestGetNumber(6)
	
	local HeroBookfenye1 = 0
	local HeroBookfenye2 = 0
	local HeroBookfenye3 = 0
	local HeroBookfenye4 = 0
	HeroBookfenye1 = HeroSkillBookTable[HeroBookID][1]	
	HeroBookfenye2 = HeroSkillBookTable[HeroBookID][2]		
	HeroBookfenye3 = HeroSkillBookTable[HeroBookID][3]		
	HeroBookfenye4 = HeroSkillBookTable[HeroBookID][4]		
	if HeroBookfenye1 == 0 or HeroBookfenye2 == 0 or HeroBookfenye3 == 0 or HeroBookfenye4 == 0 then
		return 0
	end
	
	local wupin1guoqi = 0
	local wupin2guoqi = 0
	local wupin3guoqi = 0
	local wupin4guoqi = 0
	
	local bookzhengqueshuliang = 0
	
	local UidHigh1 = API_RequestGetNumber(1)--高位UID
	local UidLow1 = API_RequestGetNumber(1001)--低位UID
	if UidHigh1 == -1 or UidHigh1 == -1 or UidLow1 == -1 or UidLow1 == -1 then
		API_ResponseWrite('<text>您提交的秘籍残卷不足四个，请重新提交</text><br>')
		API_ResponseFlush(ActorID)
		return
	end
	local uid1 = API_GetUID(UidHigh1,UidLow1) --获取UID	
	local a,b = API_GetLongOfUID(uid1)
	local bagID1,Loc1 = API_GetUIDGoodsInActor(uid1,ActorID)--背包ID 和 位置	
	local wupinID1 = API_GetUIDGoodsPropNum(uid1,0)--提交的物品ID
--API_Trace('wupinID1='..wupinID1)
	if API_GoodsCanUse(ActorID,uid1) == true then
	else
		wupin1guoqi = wupinID1
	end
	if wupinID1 == HeroBookfenye1 or wupinID1 == HeroBookfenye2 or wupinID1 == HeroBookfenye3 or wupinID1 == HeroBookfenye4 then 
		bookzhengqueshuliang = bookzhengqueshuliang + 1
	end
--API_Trace('bookzhengqueshuliang1='..bookzhengqueshuliang)	
	
	local UidHigh2 = API_RequestGetNumber(2)--高位UID
	local UidLow2 = API_RequestGetNumber(1002)--低位UID
	if UidHigh2 == -1 or UidHigh2 == -1 or UidLow2 == -1 or UidLow2 == -1 then
		API_ResponseWrite('<text>您提交的秘籍残卷不足四个，请重新提交</text><br>')
		API_ResponseFlush(ActorID)
		return
	end
	local uid2 = API_GetUID(UidHigh2,UidLow2) --获取UID	
	local a,b = API_GetLongOfUID(uid2)
	local bagID2,Loc2 = API_GetUIDGoodsInActor(uid2,ActorID)--背包ID 和 位置	
	local wupinID2 = API_GetUIDGoodsPropNum(uid2,0)--提交的物品ID
--API_Trace('wupinID2='..wupinID2)
	if API_GoodsCanUse(ActorID,uid2) == true then
	else
		wupin2guoqi = wupinID2
	end
	if wupinID2 == HeroBookfenye1 or wupinID2 == HeroBookfenye2 or wupinID2 == HeroBookfenye3 or wupinID2 == HeroBookfenye4 then 
		bookzhengqueshuliang = bookzhengqueshuliang + 1
	end
--API_Trace('bookzhengqueshuliang2='..bookzhengqueshuliang)	
	
	local UidHigh3 = API_RequestGetNumber(3)--高位UID
	local UidLow3 = API_RequestGetNumber(1003)--低位UID
	if UidHigh3 == -1 or UidHigh3 == -1 or UidLow3 == -1 or UidLow3 == -1 then
		API_ResponseWrite('<text>您提交的秘籍残卷不足四个，请重新提交</text><br>')
		API_ResponseFlush(ActorID)
		return
	end	
	local uid3 = API_GetUID(UidHigh3,UidLow3) --获取UID	
	local a,b = API_GetLongOfUID(uid3)
	local bagID3,Loc3 = API_GetUIDGoodsInActor(uid3,ActorID)--背包ID 和 位置	
	local wupinID3 = API_GetUIDGoodsPropNum(uid3,0)--提交的物品ID
--API_Trace('wupinID3='..wupinID3)
	if API_GoodsCanUse(ActorID,uid3) == true then
	else
		wupin3guoqi = wupinID3
	end
	if wupinID3 == HeroBookfenye1 or wupinID3 == HeroBookfenye2 or wupinID3 == HeroBookfenye3 or wupinID3 == HeroBookfenye4 then 
		bookzhengqueshuliang = bookzhengqueshuliang + 1
	end
--API_Trace('bookzhengqueshuliang3='..bookzhengqueshuliang)		
	
	local UidHigh4 = API_RequestGetNumber(4)--高位UID
	local UidLow4 = API_RequestGetNumber(1004)--低位UID
	if UidHigh4 == -1 or UidHigh4 == -1 or UidLow4 == -1 or UidLow4 == -1 then
		API_ResponseWrite('<text>您提交的秘籍残卷不足四个，请重新提交</text><br>')
		API_ResponseFlush(ActorID)
		return
	end		
	local uid4 = API_GetUID(UidHigh4,UidLow4) --获取UID	
	local a,b = API_GetLongOfUID(uid4)
	local bagID4,Loc4 = API_GetUIDGoodsInActor(uid4,ActorID)--背包ID 和 位置	
	local wupinID4 = API_GetUIDGoodsPropNum(uid4,0)--提交的物品ID
--API_Trace('wupinID4='..wupinID4)	
	if API_GoodsCanUse(ActorID,uid4) == true then
	else
		wupin4guoqi = wupinID4
	end
	if wupinID4 == HeroBookfenye1 or wupinID4 == HeroBookfenye2 or wupinID4 == HeroBookfenye3 or wupinID4 == HeroBookfenye4 then 
		bookzhengqueshuliang = bookzhengqueshuliang + 1
	end
--API_Trace('bookzhengqueshuliang4='..bookzhengqueshuliang)		
	
	if wupin1guoqi > 0 or wupin2guoqi > 0 or wupin3guoqi > 0 or wupin4guoqi > 0 then
		API_ResponseWrite('<name>英雄技能书合成</name>')
		API_ResponseWrite('<win rect="600,200,330,250"></win>') 
		API_ResponseWrite('<text>因以下物品过期，所以合成失败，请重新放入后再试</text><br>')
		if wupin1guoqi > 0 then
			API_ResponseWrite('<img srcgd="'..wupin1guoqi..'" tipgd="'..wupin1guoqi..'" ><text>已过期</text><br>')
		end
		if wupin2guoqi > 0 then
			API_ResponseWrite('<img srcgd="'..wupin2guoqi..'" tipgd="'..wupin2guoqi..'" ><text>已过期</text><br>')
		end
		if wupin3guoqi > 0 then
			API_ResponseWrite('<img srcgd="'..wupin3guoqi..'" tipgd="'..wupin3guoqi..'" ><text>已过期</text><br>')
		end
		if wupin4guoqi > 0 then
			API_ResponseWrite('<img srcgd="'..wupin4guoqi..'" tipgd="'..wupin4guoqi..'" ><text>已过期</text><br>')
		end	
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return	
	end
	
	if bookzhengqueshuliang < 4 then
		API_ResponseWrite('<name>英雄技能书合成</name>')
		API_ResponseWrite('<win rect="600,200,330,250"></win>') 
		API_ResponseWrite('<text>您放入的合成材料不对，请重新放入后再试</text><br><br>')
		API_ResponseWrite('<a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
	
	if wupinID1 == wupinID2 or wupinID1 == wupinID3 or wupinID1 == wupinID4 or wupinID2 == wupinID3 or wupinID2 == wupinID4 or wupinID3 == wupinID4 then
		API_ResponseWrite('<name>英雄技能书合成</name>')
		API_ResponseWrite('<win rect="600,200,330,250"></win>') 
		API_ResponseWrite('<text>您放入的合成材料重复，请重新放入后再试</text><br><br>')
		API_ResponseWrite('<a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return	
	end
	
	if API_ActorRemoveGoodsOfLoc(ActorID,wupinID1,1,bagID1,Loc1,'合成技能书') and API_ActorRemoveGoodsOfLoc(ActorID,wupinID2,1,bagID2,Loc2,'合成技能书') and API_ActorRemoveGoodsOfLoc(ActorID,wupinID3,1,bagID3,Loc3,'合成技能书') and API_ActorRemoveGoodsOfLoc(ActorID,wupinID4,1,bagID4,Loc4,'合成技能书') then
		API_AddActorGoods(ActorID,HeroBookID,1,'技能书合成')
		API_ResponseWrite('<name>英雄技能书合成</name>')
		API_ResponseWrite('<win rect="600,200,330,250"></win>') 
		API_ResponseWrite('<text>恭喜您，</text><img srcgd="'..HeroBookID..'" tipgd="'..HeroBookID..'" ><text>合成成功！</text><br><br>')
		API_ResponseWrite('<a>关闭</a><br>')
		API_ResponseFlush(ActorID)
	end
end
--[[function HeroSkillBooksuipianhecheng2(ActorID,HeroBookID)
	local ActorID = API_RequestGetNumber(1)
	local HeroBookID = API_RequestGetNumber(2)
	local hecheng = 1
	for i in HeroSkillBookTable[HeroBookID] do
		if API_ActorGetGoodsNum(ActorID,HeroSkillBookTable[HeroBookID][i]) == 0 then
			hecheng = 0
		end
	end
	if hecheng == 1 then
		for i in HeroSkillBookTable[HeroBookID] do
			API_ActorRemoveGoods(ActorID,HeroSkillBookTable[HeroBookID][i],1,'技能书合成')
		end	
		API_AddActorGoods(ActorID,HeroBookID,1,'技能书合成')
		API_ResponseWrite('<name>英雄技能书合成</name>')
		API_ResponseWrite('<win rect="600,200,330,200"></win>') 
		API_ResponseWrite('<text>恭喜您，</text><img srcgd="'..HeroBookID..'" tipgd="'..HeroBookID..'" ><text>合成成功！</text><br><br>')
		API_ResponseWrite('<a>关闭</a><br>')
		API_ResponseFlush(ActorID)
	else
		API_ResponseWrite('<name>英雄技能书合成</name>')
		API_ResponseWrite('<win rect="600,200,330,200"></win>') 
		API_ResponseWrite('<text>您身上的技能书碎片不足，不能进行合成。请准备好A,B,C,D碎片再来合成。</text><br><br>')
		API_ResponseWrite('<a>关闭</a><br>')
		API_ResponseFlush(ActorID)
	end
end--]]
function HeroSkillBookshiyong(ActorID,GoodsID)
--API_Trace('22222')
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = GoodsID or API_RequestGetNumber(1)
	local ok = 0
	local heroid = 0
	local heroname = ''
	for i in HeroSkillBookTable2 do
--API_Trace('i='..i)	
		if i == GoodsID then
--API_Trace('i1='..i)		
			ok = 1
			heroid = HeroSkillBookTable2[i].heroid
			heroname = HeroSkillBookTable2[i].heroname
--API_Trace('heroid='..heroid)	
--API_Trace('heroname='..heroname)				
		end
	end
	if ok == 0 then
		return 0
	end
--API_Trace('123=')		
	if API_ActorIsLearnHero(ActorID,heroid) then
--API_Trace('124=')	
		API_ResponseWrite('<name>英雄技能书</name>')
		API_ResponseWrite('<text>您已经接受了'..heroname..'的英雄传承，不能使用此技能书。</text><br><br>')
		API_ResponseWrite('<a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
--API_Trace('125=')	
	API_ResponseWrite('<name>英雄技能书</name>')
	API_ResponseWrite('<text>使用</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'" ><text>后将接受</text><text color="0,255,0">'..heroname..'的英雄传承</text><text>成功后技能书将消失。</text><text>如果你已经接受了这个英雄的传承，将不能使用这本技能书。</text><br><br>')
	API_ResponseWrite('<a href="HeroSkillBookxuexi?1='..ActorID..'&2='..heroid..'&3='..GoodsID..'">英雄技能书使用</a><br><br>')
	API_ResponseWrite('<a>关闭</a><br>')
	API_ResponseFlush(ActorID)
	return 1
end
function HeroSkillBookxuexi(ActorID,heroid,GoodsID)
	local ActorID = API_RequestGetNumber(1)
	local heroid = API_RequestGetNumber(2)
	local GoodsID = API_RequestGetNumber(3)
	if API_ActorGetGoodsNum(ActorID,GoodsID) == 0 then
		API_ResponseWrite('<text>您身上没有</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'" ><text>不能进行英雄传承。</text><br><br>')
		API_ResponseFlush(ActorID)
		return
	end
	API_WindowOnEventII(ActorID,90002,256,heroid,0)
end
function HeroSkillxuexichengg(ActorID,heroid,lHasLearned)
	if heroid > 30 then
		local PlayName =  API_GetActorName(ActorID)
		local heroname = ''
		for i in HeroSkillBookTable2 do
			if heroid == HeroSkillBookTable2[i].heroid then
				heroname = HeroSkillBookTable2[i].heroname
			end
		end
		if lHasLearned == 0 then
			API_ActorBDCMsg(-1,0,-1,15,85,0,17,'“'..PlayName..'”通过技能书接受了新英雄“'..heroname..'”的传承，学会了他的技能！')
		end
	end
end
function toufaranseyaoji(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)	
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = GoodsID or API_RequestGetNumber(1)
	if GoodsID ~= 88136 then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'您没有这个道具')
		return 0
	end
	API_ResponseWrite('<name>染发剂</name>')
	API_ResponseWrite('<win rect="600,200,330,200"></win>') 
	API_ResponseWrite('<text color="0,255,0">此功能即将开放，敬请期待！</text><br><br>')
	API_ResponseFlush(ActorID)
	return 1
end
function SkillGoods_QiBaoQi_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local YaoKongDiLeiLV = API_GetSkillLevel(ActorID,19)
	if YaoKongDiLeiLV == 0 then 
		YaoKongDiLeiLV = 1
	end
	local NeedNum = 1
	local NeedCaiLiaoID = 80249
	if YaoKongDiLeiLV >= 11 then
		NeedNum = 3
	elseif YaoKongDiLeiLV >= 6 then
		NeedNum = 2
	end
	if API_ActorGetGoodsNum(ActorID,NeedCaiLiaoID) < NeedNum then
		API_ActorSendMsg(ActorID,1,'没有足够的'..API_GetGoodsName(NeedCaiLiaoID)..'无法起爆')
		return 0
	else
		API_ActorUseSkill(ActorID,18,YaoKongDiLeiLV,0,0,0,0)
		API_ActorSendMsg(ActorID,3,'您使用引爆器引爆了您放置的所有地雷！')
		return 1
	end
	return 1
end

GLOBAL_ZhengChaShouWei_GoodsList = {
	--侦察守卫[公民]
	[834] = {NeedMorale=126,SkillID=421,SkillLV=1,},
	--侦察守卫[男爵]
	[835] = {NeedMorale=252,SkillID=421,SkillLV=2,},
	--侦察守卫[高级男爵]
	[836] = {NeedMorale=336,SkillID=421,SkillLV=3,},
	--侦察守卫[子爵]
	[837] = {NeedMorale=819,SkillID=421,SkillLV=4,},
	--侦察守卫[高级子爵]
	[838] = {NeedMorale=1029,SkillID=421,SkillLV=5,},
	--侦察守卫[伯爵]
	[839] = {NeedMorale=1372,SkillID=421,SkillLV=6,},
	--侦察守卫[高级伯爵]
	[840] = {NeedMorale=2226,SkillID=421,SkillLV=7,},
	--侦察守卫[侯爵]
	[841] = {NeedMorale=2940,SkillID=421,SkillLV=8,},
	--侦察守卫[高级侯爵]
	[842] = {NeedMorale=3528,SkillID=421,SkillLV=9,},
	--侦察守卫[公爵]
	[843] = {NeedMorale=4410,SkillID=421,SkillLV=10,},
	--侦察守卫[高级公爵]
	[844] = {NeedMorale=5180,SkillID=421,SkillLV=11,},
}

function SkillGoods_ZhengChaShouWei_GoodsCallFunc(ActorID,GoodsID,Target_Type,Target_Value,Target_MapID,Target_x,Target_y)
	if GLOBAL_ZhengChaShouWei_GoodsList[GoodsID] == nil then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
	if PublicFun_AccountDistance(TileX,TileY,Target_x,Target_y) > 7 then
		API_ActorSendMsg(ActorID,3,'选择的位置太远，请就近释放')
		return 0
	end
	local SkillID = GLOBAL_ZhengChaShouWei_GoodsList[GoodsID].SkillID
	local SkillLV = GLOBAL_ZhengChaShouWei_GoodsList[GoodsID].SkillLV
	if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用侦察守卫') then
		API_ActorUseSkill(ActorID,SkillID,SkillLV,Target_x,Target_y,0,0)
	end
	return 1
end


function SkillGoods_DianJinShouTao2_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,714) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == MapID then
		API_ActorSendMsg(ActorID,3,'本道具只能在浮空岛内使用')
		return 0
	end
	local PD = 0
	--拉锯可使用
	for i = 1,table.getn(LaJuZhanFuBenMapID) do 
		if StaticMapID == LaJuZhanFuBenMapID[i] then
			PD = 1
			break
		elseif i == table.getn(LaJuZhanFuBenMapID) then
			PD = 0
		end
	end
	--训练营可使用
	if PD == 0 and (StaticMapID >= 1876 and StaticMapID <= 1920) then
		PD = 1
	end
	--英雄领域可使用
	if PD == 0 and StaticMapID == 1941 then
		PD = 1
	end
	
	if PD == 1 then
		API_ActorStartSelect(ActorID,'SkillGoods_DianJinShouTao',16) 
		API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
		return 1
	end
	API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(GoodsID)..'暂时不能在本地图使用')
	return 0
	
	--[[for i = 1,table.getn(FangShouFuBenMapID) do 
		if StaticMapID == FangShouFuBenMapID[i] then
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(GoodsID)..'暂时不能在本地图使用')
			return 0
		end
	end
	for i = 1,table.getn(TaFangFuBenMapID) do 
		if StaticMapID == TaFangFuBenMapID[i] then
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(GoodsID)..'暂时不能在本地图使用')
			return 0
		end
	end
	for i = 1,table.getn(ShiLianKongJianMapID) do 
		if StaticMapID == ShiLianKongJianMapID[i] then
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(GoodsID)..'暂时不能在本地图使用')
			return 0
		end
	end
	if StaticMapID == 2043 or StaticMapID == 2032 then
		API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(GoodsID)..'暂时不能在本地图使用')
		return 0
	end	
	API_ActorStartSelect(ActorID,'SkillGoods_DianJinShouTao',16) 
	API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
	return 1]]
end

function SkillGoods_DianJinShouTao()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 
	local MapID = API_GetActorMapID(ActorID)
	if API_ActorGetGoodsNum(ActorID,714) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == MapID then
		API_ActorSendMsg(ActorID,3,'本道具只能在浮空岛内使用')
		return 0
	end
	--[[for i = 1,table.getn(FangShouFuBenMapID) do 
		if StaticMapID == FangShouFuBenMapID[i] then
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(714)..'不能在本地图使用')
			return 0
		end
	end
	for i = 1,table.getn(TaFangFuBenMapID) do 
		if StaticMapID == TaFangFuBenMapID[i] then
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(714)..'不能在本地图使用')
			return 0
		end
	end
	for i = 1,table.getn(ShiLianKongJianMapID) do 
		if StaticMapID == ShiLianKongJianMapID[i] then
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(714)..'暂时不能在本地图使用')
			return 0
		end
	end
	if StaticMapID == 2043 or StaticMapID == 2032 then
		API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(714)..'暂时不能在本地图使用')
		return 0
	end]]
	
	local PD = 0
	--拉锯可使用
	for i = 1,table.getn(LaJuZhanFuBenMapID) do 
		if StaticMapID == LaJuZhanFuBenMapID[i] then
			PD = 1
			break
		elseif i == table.getn(LaJuZhanFuBenMapID) then
			PD = 0
		end
	end
	--训练营可使用
	if PD == 0 and (StaticMapID >= 1876 and StaticMapID <= 1920) then
		PD = 1
	end
	--英雄领域可使用
	if PD == 0 and StaticMapID == 1941 then
		PD = 1
	end
	if PD == 0 then
		API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(714)..'暂时不能在本地图使用')
		return 0
	end
	if SelectType == 1 then
		if API_GetMonsterID(SelectID) <= 0 then
			API_ActorStartSelect(ActorID,'SkillGoods_DianJinShouTao',16) 
			API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
			return
		end
		local CampIsOK = 0
		if API_MonsterGetPropNum(SelectID,PD_PROP_CAMPID) ~= API_GetActorCamp(ActorID) then
			CampIsOK = 1
		end
		for i = 1,table.getn(LaJuZhanFuBenMapID) do 
			if StaticMapID == LaJuZhanFuBenMapID[i] then
				if API_MonsterGetPropNum(SelectID,PD_PROP_CAMPID) ~= API_GetActorBattleCamp(ActorID) then
					CampIsOK = 1
				else
					CampIsOK = 0
				end
				break
			end
		end
		if API_MonsterGetPropNum(SelectID,242) == 4 and API_MonsterGetPropNum(SelectID,244) <= 0 and CampIsOK == 1 then
			if not API_MonsterIsBoss(SelectID) then
				local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
				if PublicFun_AccountDistance(TileX,TileY,SelectTileX,SelectTileY) > 10 then
					API_ActorSendMsg(ActorID,3,'目标的位置太远，请就近选择')
					return 0
				end
				if API_GetMonsterLv(SelectID) <= 40 then
					if API_ActorRemoveGoods(ActorID,714,1,'使用点金手套包') then
						API_ActorUseSkill(ActorID,319,1,0,0,0,SelectID)
						API_ActorSendMsg(ActorID,3,'您使用点金手套杀死了 '..API_GetMonsterName(SelectID)..'')
					end
				elseif API_ActorGetGoodsNum(ActorID,714) > 1 then
					if API_ActorRemoveGoods(ActorID,714,2,'使用点金手套包') then
						API_ActorUseSkill(ActorID,319,1,0,0,0,SelectID)
						API_ActorSendMsg(ActorID,3,'您使用2个点金手套杀死了 '..API_GetMonsterName(SelectID)..'')
					end
				else
					API_ActorStartSelect(ActorID,'SkillGoods_DianJinShouTao',16) 
					API_ActorSendMsg(ActorID,3,'杀死伯爵档以上的敌兵需要消耗两个点金手套')
				end
			else
				API_ActorStartSelect(ActorID,'SkillGoods_DianJinShouTao',16) 
				API_ActorSendMsg(ActorID,3,'不能对BOSS使用，请左键点击您想杀死的敌方小兵')
			end
		else
			API_ActorStartSelect(ActorID,'SkillGoods_DianJinShouTao',16) 
			API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
		end
	else
		API_ActorStartSelect(ActorID,'SkillGoods_DianJinShouTao',16) 
		API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
	end
end

function SkillGoods_LinShiXinTuoPinZheng_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,725) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local JiangLi = math.random(15000,22500)
	if API_ActorRemoveGoods(ActorID,725,1,'使用临时信托凭证') then
		API_ActorAddMoney(ActorID,JiangLi,0,'使用临时信托凭证')
		API_ActorSendMsg(ActorID,3,'使用临时信托凭证，获得'..JiangLi..'金币')
		return 1
	end
	return 0
end

function SkillGoods_YuanXinXie_GoodsCallFunc(ActorID,GoodsID,Target_Type,Target_Value,Target_MapID,Target_x,Target_y)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_MapIsValid(Target_MapID) then
		if API_HaveNoBlockTile(Target_MapID,Target_x,Target_y,4) then
			local CampID = API_GetActorCamp(ActorID)
			local SHENGCUNZHUANGTAI = API_VarDataGetNumber(ActorID,1,GLOBAL_FangShouFuBen_SCZHUANGTAI)
			if SHENGCUNZHUANGTAI == 0 then
				if API_BattleMapCanSee(Target_MapID,CampID,Target_x,Target_y) then
					if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用飞行卷') then
						API_ActorGoToMap(ActorID,Target_MapID,Target_x,Target_y)
						return 1
					else
						return 0
					end
				else
					API_ActorSendMsg(ActorID,3,'飞行卷只能将您传送到拥有己方视野的区域')
					return 0
				end
			else
			  API_ActorSendMsg(ActorID,3,'生存挑战中不能使用飞行卷')
			end
		else
			return 0
		end
	else
		return 0
	end
	return 0
end


-- 月门传送表
MoonDoorNoGoToAddress_Tab = {
[9] = {
		--暗礁海
		{AddrName = "钢铁城入口", AddrLocX = 114,AddrLocY = 404},
		{AddrName = "阳光雨林入口", AddrLocX = 292, AddrLocY = 39},
		{AddrName = "空间传送塔", AddrLocX = 186, AddrLocY = 293},
		{AddrName = "样板房入口", AddrLocX = 122, AddrLocY = 310},
		{AddrName = "跨岛传送阵", AddrLocX = 235, AddrLocY = 352},
		CampID = 0,
		MinLevel = 1,
		MaxLevel = 85,
		},
[23] = {
		--阳光雨林
		{AddrName = "暗礁海入口", AddrLocX = 93, AddrLocY = 377},
		{AddrName = "落日农庄入口", AddrLocX = 402, AddrLocY = 116},
		{AddrName = "空间传送塔", AddrLocX = 208, AddrLocY = 286},
		{AddrName = "塔夫的矿井", AddrLocX = 142, AddrLocY = 274},
		{AddrName = "二档资源采集区", AddrLocX = 193, AddrLocY = 250},
		{AddrName = "双子岛入口", AddrLocX = 248, AddrLocY = 67},
		CampID = 0,
		MinLevel = 1,
		MaxLevel = 85,
		},
		
[25] = {
		--麦穗平原
		{AddrName = "天空城入口", AddrLocX = 121, AddrLocY = 348},
		{AddrName = "珊瑚群岛入口", AddrLocX = 386, AddrLocY = 175},
		{AddrName = "空间传送塔", AddrLocX = 199, AddrLocY = 298},
		{AddrName = "样板房", AddrLocX = 185, AddrLocY = 288},
		{AddrName = "跨岛传送阵", AddrLocX = 96, AddrLocY = 277},
		CampID = 1,
		MinLevel = 1,
		MaxLevel = 85,
		},
[10] = {
		--珊瑚群岛
		{AddrName = "麦穗平原入口", AddrLocX = 85, AddrLocY = 275},
		{AddrName = "娜纱湿地入口", AddrLocX = 420, AddrLocY = 134},
		{AddrName = "空间传送塔", AddrLocX = 201, AddrLocY = 295},
		{AddrName = "塔夫的矿井", AddrLocX = 183, AddrLocY = 357},
		{AddrName = "二档资源采集区", AddrLocX = 232, AddrLocY = 319},
		{AddrName = "双子岛入口", AddrLocX = 344, AddrLocY = 322},
		CampID = 1,
		MinLevel = 1,
		MaxLevel = 85,
		},
		
[98] = {
		--娜纱湿地
		{AddrName = "珊瑚群岛入口", AddrLocX = 255, AddrLocY = 560},
		{AddrName = "征战平原入口", AddrLocX = 498, AddrLocY = 485},
		{AddrName = "月暮草场入口", AddrLocX = 582, AddrLocY = 419},
		{AddrName = "空间传送塔", AddrLocX = 293, AddrLocY = 328},
		MinLevel = 16,
		MaxLevel = 85,
		},
		
[99] = {
		--落日农庄
		{AddrName = "阳光雨林入口", AddrLocX = 259, AddrLocY = 505},
		{AddrName = "征战平原入口", AddrLocX = 261, AddrLocY = 247},
		{AddrName = "月暮草场入口", AddrLocX = 341, AddrLocY = 156},
		{AddrName = "空间传送塔", AddrLocX = 418, AddrLocY = 415},
		MinLevel = 16,
		MaxLevel = 85,
		},
		
[101] = {
		--月暮草场
		{AddrName = "娜纱湿地入口", AddrLocX = 276, AddrLocY = 374},
		{AddrName = "落日农庄入口", AddrLocX = 480, AddrLocY = 588},
		{AddrName = "沙暴绿洲入口", AddrLocX = 553, AddrLocY = 352},
		{AddrName = "恶鬼的地穴", AddrLocX = 436, AddrLocY = 444},
		MinLevel = 16,
		MaxLevel = 85,
		},

[102] = {
		--沙暴绿洲
		{AddrName = "月暮草场入口", AddrLocX = 424, AddrLocY = 706},
		{AddrName = "夜莺山谷入口", AddrLocX = 617, AddrLocY = 223},
		{AddrName = "光明遗迹入口", AddrLocX = 766, AddrLocY = 492},
		{AddrName = "众神领域入口", AddrLocX = 772, AddrLocY = 288},
		{AddrName = "镜月城", AddrLocX = 686, AddrLocY = 443},
		MinLevel = 16,
		MaxLevel = 85,
		},

--[104] = {
--		--双子岛
--		{AddrName = "珊瑚群岛入口", AddrLocX = 439, AddrLocY = 221},
--		{AddrName = "阳光雨林入口", AddrLocX = 430, AddrLocY = 686},
--		MinLevel = 1,
--		MaxLevel = 85,
--		},

[110] = {
		--夜莺山谷
		{AddrName = "沙暴绿洲入口", AddrLocX = 378, AddrLocY = 574},
		{AddrName = "叹息平原入口", AddrLocX = 385, AddrLocY = 97},
		{AddrName = "空间传送塔", AddrLocX = 304, AddrLocY = 464},
		MinLevel = 41,
		MaxLevel = 85,
		},
		
[111] = {
		--光明遗迹
		{AddrName = "沙暴绿洲入口", AddrLocX = 132, AddrLocY = 352},
		{AddrName = "鸣沙沙漠入口", AddrLocX = 650, AddrLocY = 270},
		{AddrName = "空间传送塔", AddrLocX = 269, AddrLocY = 422},
		MinLevel = 36,
		MaxLevel = 85,
		},
[120] = {
		--众神领域
		{AddrName = "叹息平原入口", AddrLocX = 251, AddrLocY = 223},
		{AddrName = "鸣沙沙漠入口", AddrLocX = 525, AddrLocY = 505},
		{AddrName = "沙暴绿洲入口", AddrLocX = 151, AddrLocY = 540},
		{AddrName = "梦幻城", AddrLocX = 524, AddrLocY = 332},
		MinLevel = 41,
		MaxLevel = 85,
		},
}


function SkillGoods_JieShi_GoodsCallFunc(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if GoodsID ~= 765 or API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local CampID = API_GetActorCamp(ActorID)
	local UID = API_GetUID(High,Low)
	local BagType,Loc = API_GetUIDGoodsInActor(UID,ActorID)
	Loc = Loc + 1
	
	--读取界石信息
	local SaveMapName = API_ActorMeMScrollGetString(ActorID,BagType,Loc,1)
	local SavePosX = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,1)
	local SavePosY = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,2)
	local SaveMapID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,3)
	local SaveTileX = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,4)
	local SaveTileY = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,5)
	local SaveServerID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,6)
	local SaveNeedCampID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,7)
	local SaveNeedMinLevel = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,8)
	local SaveNeedMaxLevel = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,9)
	API_ResponseWrite('<name>界石</name>')
	API_ResponseWrite('<win rect="600,200,330,200"></win>') 
	if SaveMapID > 0 and SaveTileX > 0 and SaveTileY > 0 then
		API_ResponseWrite('<text>这颗'..API_GetGoodsName(GoodsID)..'记录的位置是：</text><br>')
		API_ResponseWrite('<text color="255,0,255">'..SaveMapName..' （'..SavePosX..'，'..SavePosY..'）</text><br>')
		API_ResponseWrite('<br><a href="NPCFunc_MoonDoor?1=1&2='..High..'&3='..Low..'">前往记录的位置</a><br>')
		API_ResponseWrite('<br><a href="NPCFunc_MoonDoor?1=2&2='..High..'&3='..Low..'" tip="<text size=\'14\' color=\'0,255,0\'>开启月门需要消耗：</text>\n<img sc=\'57004\' frame=\'1\' Delay=\'200\' type=\'2\'>点券 X 5\n月门持续30秒\n队伍内的所有成员都可以通过月门到达界石的记录点">开启月门</a><br>')
		API_ResponseWrite('<br><a href="NPCFunc_MoonDoor?1=4&2='..High..'&3='..Low..'">修改备注</a><br>')
		API_ResponseWrite('<br><a href="NPCFunc_MoonDoor?1=3&2='..High..'&3='..Low..'">重新记录位置</a>')
	else
		API_ResponseWrite('<text>这颗'..API_GetGoodsName(GoodsID)..'还有没开始记录位置：</text><br>')
		API_ResponseWrite('<br><a href="NPCFunc_MoonDoor?1=3&2='..High..'&3='..Low..'">记录位置</a><br>')
		API_ResponseWrite('<br><a>取消</a>')
	end
	API_ResponseFlush(ActorID)
	return 1
end


if GLOBAL_MoonDoor_Convection == nil then
	GLOBAL_MoonDoor_Convection={}
end

function SkillGoods_MoonDoor_TimerTriggerCallFunc(FastID1,FastID2)
	if API_GetMonsterID(FastID1) > 0 then
		API_DestroyMonster(FastID1)
		if GLOBAL_MoonDoor_Convection[FastID1] ~= nil then
			local ActorID = GLOBAL_MoonDoor_Convection[FastID1].Master
			if API_ActorIsOnline(ActorID) then
				API_VarDataSetNumber(ActorID,0,18111,0)
				API_VarDataSetNumber(ActorID,0,18112,0)
				API_VarDataSetNumber(ActorID,0,18113,0)
			end
			GLOBAL_MoonDoor_Convection[FastID1] = nil
		end
	end
	if API_GetMonsterID(FastID2) > 0 then
		API_DestroyMonster(FastID2)
		if GLOBAL_MoonDoor_Convection[FastID2] ~= nil then
			local ActorID = GLOBAL_MoonDoor_Convection[FastID2].Master
			if API_ActorIsOnline(ActorID) then
				API_VarDataSetNumber(ActorID,0,18111,0)
				API_VarDataSetNumber(ActorID,0,18112,0)
				API_VarDataSetNumber(ActorID,0,18113,0)
			end
			GLOBAL_MoonDoor_Convection[FastID2] = nil
		end
	end
end

SkillGoods_SDJST_Table = {
				{MinLv=1,MaxLv=10,NeedNum=4,AddShiQi=150},
				{MinLv=11,MaxLv=25,NeedNum=6,AddShiQi=280},
				{MinLv=26,MaxLv=40,NeedNum=8,AddShiQi=420},
				{MinLv=41,MaxLv=55,NeedNum=15,AddShiQi=890},
				{MinLv=56,MaxLv=70,NeedNum=25,AddShiQi=1900},
				{MinLv=71,MaxLv=85,NeedNum=40,AddShiQi=4200},
}

function SkillGoods_SDJST_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,315) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == MapID then
		API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
		return 0
	else
		for i = 1,table.getn(LaJuZhanFuBenMapID) do 
			if StaticMapID == LaJuZhanFuBenMapID[i] then
				API_ActorStartSelect(ActorID,'SkillGoods_SDJST',16) 
				API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
				return 1
			elseif i == table.getn(LaJuZhanFuBenMapID) then
				API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
				return 0
			end
		end
	end		
	return 0
end

function SkillGoods_SDJST()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 
	if API_ActorGetGoodsNum(ActorID,315) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == MapID then
		API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
		return 0
	else
		for i = 1,table.getn(LaJuZhanFuBenMapID) do 
			if StaticMapID == LaJuZhanFuBenMapID[i] then
				if SelectType == 1 then
					if API_GetMonsterID(SelectID) <= 0 then
						API_ActorStartSelect(ActorID,'SkillGoods_SDJST',16) 
						API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
						return
					end
					local MonsterLv = API_GetMonsterLv(SelectID)
					local NeedNum = 0
					local AddShiQi = 0
					for j in SkillGoods_SDJST_Table do
						local MinLv = SkillGoods_SDJST_Table[j].MinLv
						local MaxLv = SkillGoods_SDJST_Table[j].MaxLv
						if MonsterLv >= MinLv and MonsterLv <= MaxLv then
							NeedNum = SkillGoods_SDJST_Table[j].NeedNum
							AddShiQi = SkillGoods_SDJST_Table[j].AddShiQi
							break
						end
					end
					if API_MonsterGetPropNum(SelectID,242) == 4 and API_MonsterGetPropNum(SelectID,244) <= 0 and API_MonsterGetPropNum(SelectID,PD_PROP_CAMPID) ~= API_GetActorBattleCamp(ActorID) then
						if not API_MonsterIsBoss(SelectID) then
							if API_ActorGetGoodsNum(ActorID,315) >= NeedNum then
								if API_ActorRemoveGoods(ActorID,315,NeedNum,'使用超级点金手套') then
									API_ActorUseSkill(ActorID,319,1,0,0,0,SelectID)
									API_ActorSendMsg(ActorID,10,'您使用'..NeedNum..'个'..API_GetGoodsName(315)..'杀死了 '..API_GetMonsterName(SelectID)..',并额外获得'..AddShiQi..'士气')
									API_ActorAddMorale(ActorID,AddShiQi,0,'使用超级点金手套得士气')
								end
							else
								API_ActorStartSelect(ActorID,'SkillGoods_SDJST',16) 
								API_ActorSendMsg(ActorID,3,'杀死'..MonsterLv..'级的敌兵需要消耗'..NeedNum..'个'..API_GetGoodsName(315)..'')
							end
						else
							API_ActorStartSelect(ActorID,'SkillGoods_SDJST',16) 
							API_ActorSendMsg(ActorID,3,'不能对BOSS使用，请左键点击您想杀死的敌方小兵')
						end
					else
						API_ActorStartSelect(ActorID,'SkillGoods_SDJST',16) 
						API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
					end
				else
					API_ActorStartSelect(ActorID,'SkillGoods_SDJST',16) 
					API_ActorSendMsg(ActorID,3,'请左键点击您想杀死的敌方小兵')
				end
				break
			elseif i == table.getn(LaJuZhanFuBenMapID) then
				API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
				return 0
			end
		end
	end
end

ShiQiYaoJiu_InfoTable = {
	[306]={NeedLV=1,NeedPeerage=1,Xiaoguo=700,Zhuangtai=177001,},
	[307]={NeedLV=16,NeedPeerage=2,Xiaoguo=1400,Zhuangtai=177002,},
	[308]={NeedLV=31,NeedPeerage=4,Xiaoguo=2100,Zhuangtai=177003,},
	[316]={NeedLV=41,NeedPeerage=6,Xiaoguo=3000,Zhuangtai=177010,},
	[309]={NeedLV=1,NeedPeerage=1,Xiaoguo=1500,Zhuangtai=177004,},
	[310]={NeedLV=16,NeedPeerage=2,Xiaoguo=2800,Zhuangtai=177005,},
	[311]={NeedLV=31,NeedPeerage=4,Xiaoguo=3800,Zhuangtai=177006,},
	[317]={NeedLV=41,NeedPeerage=6,Xiaoguo=4800,Zhuangtai=177011,},
}


function SkillGoods_SQYJ_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if ShiQiYaoJiu_InfoTable[GoodsID] == nil then
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if StaticMapID == MapID then
		API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
		return 0
	else
		for i = 1,table.getn(LaJuZhanFuBenMapID) do 
			if StaticMapID == LaJuZhanFuBenMapID[i] then
				local CampID = API_GetActorCamp(ActorID)
				local Peerage = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
				local Redcishu = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Redcishu)
				local Bluecishu = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Bluecishu)
				local LoseOK = 0
				if CampID == 0 and Redcishu >= 1 then
					LoseOK = 1
				elseif CampID == 1 and Bluecishu >= 1 then
					LoseOK = 1
				end
				if Redcishu + Bluecishu >= 1 then
					local ExpLevel = API_GetActorExpLevel(ActorID)
					local NeedLV = ShiQiYaoJiu_InfoTable[GoodsID].NeedLV
					local NeedPeerage = ShiQiYaoJiu_InfoTable[GoodsID].NeedPeerage
					if NeedPeerage <= Peerage then
						if NeedLV <= ExpLevel then
							local Xiaoguo = ShiQiYaoJiu_InfoTable[GoodsID].Xiaoguo
							local StatusID = ShiQiYaoJiu_InfoTable[GoodsID].Zhuangtai
							if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用士气药酒') then
								API_ActorAddStatus(ActorID,StatusID,0)
								API_ActorSendMsg(ActorID,3,'您使用一瓶'..API_GetGoodsName(GoodsID)..'获得'..Xiaoguo..'士气')
								return 1
							else
								return 0
							end
						else
							API_ActorSendMsg(ActorID,3,'必须等级达到'.. GLOBAL_Exploit[NeedLV].PeerageDepict ..'以上才能使用')
							return 0
						end
					else
						API_ActorSendMsg(ActorID,3,'本道具只能在'..Battle_GuankaInfo[NeedPeerage]..'以上的拉锯战浮空岛使用')
						return 0
					end
				else
					API_ActorSendMsg(ActorID,3,'本道具只能在有城堡已经被摧毁一次以上的拉锯战浮空岛内使用')
					return 0
				end
				break
			elseif i == table.getn(LaJuZhanFuBenMapID) then
				API_ActorSendMsg(ActorID,3,'本道具只能在拉锯战浮空岛使用')
				return 0
			end
		end
	end
	return 0
end

OnUseUnBandGoods_Table={
[1] = 1,
[2] = 2,
[3] = 10,
[4] = 20,
[5] = 40,
[6] = 40,
[7] = 40,
[8] = 40,
}

--装备解绑
function OnUseUnBandGoods(lActorID,lUseGoodsID,lBandGoodsID,lBGMainType,lBGSubType,lBGLevel,lBGContType,lBGLoc)
	if lBGMainType == 1 then --判断是否是装备
		local DangCi = API_ActorGetGoodsPropNum(lActorID,lBGContType,lBGLoc,51) --判断装备档次
		local NeedNum = OnUseUnBandGoods_Table[DangCi]
		if NeedNum ~= nil then
			return NeedNum
		end
	else
		API_ActorSendMsg(lActorID,2,'只能解绑装备')
	end
	return 0
end

--使用生命药水
function LifeProps_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local StaticMapID = API_GetStaticMapID(MapID)
	local PanDuan = 0
	local StatusID = 0
	if MapConfigID == 130 or MapConfigID == 2032 then
		if GoodsID == 250 then
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(GoodsID)..'不允许在这里使用')
			return 0
		end
	end
	for i in TML_HuoBaoLaJuMapID do
		if StaticMapID == TML_HuoBaoLaJuMapID[i] then
			API_ActorSendMsg(ActorID,3,'火爆拉锯中只能使用战地商人处的专用药水')
			return 0
		end
	end
	if	API_ActorFindStatus(ActorID, 994)	==	true then
		for i,v in pairs(SkyCityBUFF_Table) do
			if GoodsID == v then	
				API_ActorSendMsg(ActorID,3,'你身上有"异域辐射"状态，不允许使用'..API_GetGoodsName(GoodsID)..'')
				return 0
			end	
		end	
	end	
--~ 	for i,v in Public_NewPlayMapTable do
--~ 		if MapConfigID == v or MapID == StaticMapID  then
--~ 			PanDuan = 1
--~ 			break
--~ 		else
--~ 			PanDuan = 2
--~ 		end
--~ 	end
	for i,v in LaJuZhanFuBenMapID do
		if MapConfigID == v then
			PanDuan = 2
			break
		else
			PanDuan = 1
		end
	end
	if GoodsID == 250 and (MapConfigID == 1994 or MapConfigID == 2019 or MapConfigID == 2042) then
		PanDuan = 2
	end
	if PanDuan == 1 then
		if GoodsID == 101 then
			StatusID = 621001
		elseif GoodsID == 102 then
			StatusID = 621002
		elseif GoodsID == 103 then
			StatusID = 621003
		elseif GoodsID == 104 then
			StatusID = 621004
		elseif GoodsID == 105 then
			StatusID = 621005
		elseif GoodsID == 117 then
			StatusID = 107001
		elseif GoodsID == 118 then
			StatusID = 107002
		elseif GoodsID == 119 then
			StatusID = 107003
		elseif GoodsID == 120 then
			StatusID = 107004
		elseif GoodsID == 121 then
			StatusID = 107005
		elseif GoodsID == 206 then
			StatusID = 43001
		elseif GoodsID == 207 then
			StatusID = 43002
		elseif GoodsID == 208 then
			StatusID = 43003
		elseif GoodsID == 209 then
			StatusID = 43004
		elseif GoodsID == 210 then
			StatusID = 43005
		elseif GoodsID == 201 then
			StatusID = 31001
		elseif GoodsID == 202 then
			StatusID = 31002
		elseif GoodsID == 203 then
			StatusID = 31003
		elseif GoodsID == 204 then
			StatusID = 31004
		elseif GoodsID == 205 then
			StatusID = 31005
		elseif GoodsID == 250 then
			StatusID = 810001
		end
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除'..API_GetGoodsName(GoodsID)..'') then
			if StaticMapID == 2039 then
				API_ActorAddStatus(ActorID,715001,0)
				if API_VarDataGetNumber(ActorID,1,GLOBAL_FoolNewActorTaskStep) == 32 then
					API_ShowAnimateIip(ActorID,7,-1)
				end
			else
				API_ActorAddStatus(ActorID,StatusID,0)
			end
			return 1
		end
	elseif PanDuan == 2 then
		if GoodsID == 101 then
			StatusID = 30001
		elseif GoodsID == 102 then
			StatusID = 30002
		elseif GoodsID == 103 then
			StatusID = 30003
		elseif GoodsID == 104 then
			StatusID = 30004
		elseif GoodsID == 105 then
			StatusID = 30005
		elseif GoodsID == 117 then
			StatusID = 107001
		elseif GoodsID == 118 then
			StatusID = 107002
		elseif GoodsID == 119 then
			StatusID = 107003
		elseif GoodsID == 120 then
			StatusID = 107004
		elseif GoodsID == 121 then
			StatusID = 107005
		elseif GoodsID == 206 then
			StatusID = 43001
		elseif GoodsID == 207 then
			StatusID = 43002
		elseif GoodsID == 208 then
			StatusID = 43003
		elseif GoodsID == 209 then
			StatusID = 43004
		elseif GoodsID == 210 then
			StatusID = 43005
		elseif GoodsID == 201 then
			StatusID = 31001
		elseif GoodsID == 202 then
			StatusID = 31002
		elseif GoodsID == 203 then
			StatusID = 31003
		elseif GoodsID == 204 then
			StatusID = 31004
		elseif GoodsID == 205 then
			StatusID = 31005
		elseif GoodsID == 250 then
			API_ActorSendMsg(ActorID,3,''..API_GetGoodsName(GoodsID)..'不允许在浮空岛使用')
			return 0
		end
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'删除'..API_GetGoodsName(GoodsID)..'') then
			API_ActorAddStatus(ActorID,StatusID,0)
			if GoodsID >= 117 and GoodsID <= 121 then
				API_ActorBroadcastMsgEx(MapID,-1,0,8,''..API_GetActorName(ActorID)..'使用了瞬间回血药水')
			end
			return 1
		end
	end
	return 0
end

--宠物胶囊卷轴
function WYL_BoxHuanChongWu_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if GoodsID ~= 999 then
		API_ActorSendMsg(ActorID,3,'非法物品')
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local ChongWuID = 76
	if API_ActorGetPackageSize(ActorID) >= 1 then
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'打开'..API_GetGoodsName(GoodsID)..'拿'..API_GetGoodsName(ChongWuID)..'') then
			API_AddActorGoodsFlag(ActorID,ChongWuID,1,3,'打开'..API_GetGoodsName(GoodsID)..'获得1个 '.. API_GetGoodsName(ChongWuID)..'')
			API_ActorSendMsg(ActorID,10,'打开'..API_GetGoodsName(GoodsID)..'获得1个 '.. API_GetGoodsName(ChongWuID)..'')
			return 1
		end
	else
		API_ActorSendMsg(ActorID,3,'您的背包已满，请整理一下背包再试试吧')
		return 0
	end
end

--载具胶囊卷轴
function TML_BoxHuanZaiJu_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if GoodsID ~= 88137 and GoodsID ~= 88149 and GoodsID ~= 88150 and GoodsID ~= 88151 then
		API_ActorSendMsg(ActorID,3,'非法物品')
		return 0
	elseif API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local queshaobujian = ''
	if API_ActorGetGoodsNum(ActorID,88137) < 1 then
		queshaobujian = queshaobujian..API_GetGoodsName(88137)
	end
	if API_ActorGetGoodsNum(ActorID,88149) < 1 then
		if queshaobujian == '' then
			queshaobujian = queshaobujian..API_GetGoodsName(88149)
		else
			queshaobujian = queshaobujian..'、'..API_GetGoodsName(88149)
		end
	end
	if API_ActorGetGoodsNum(ActorID,88150) < 1 then
		if queshaobujian == '' then
			queshaobujian = queshaobujian..API_GetGoodsName(88150)
		else
			queshaobujian = queshaobujian..'、'..API_GetGoodsName(88150)
		end
	end
	if API_ActorGetGoodsNum(ActorID,88151) < 1 then
		if queshaobujian == '' then
			queshaobujian = queshaobujian..API_GetGoodsName(88151)
		else
			queshaobujian = queshaobujian..'、'..API_GetGoodsName(88151)
		end
	end
	local ZaiJuID = 78
	if API_ActorGetGoodsNum(ActorID,88137) < 1 or API_ActorGetGoodsNum(ActorID,88149) < 1 or API_ActorGetGoodsNum(ActorID,88150) < 1 or API_ActorGetGoodsNum(ActorID,88151) < 1 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>您还需要收集到</text><text color="255,0,255"> '..queshaobujian..' </text><text>后才能合成'.. API_GetGoodsName(ZaiJuID)..'</text><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
	if API_ActorGetPackageSize(ActorID) >= 1 then
		if API_ActorRemoveGoods(ActorID,88137,1,'合成载具胶囊') and API_ActorRemoveGoods(ActorID,88149,1,'合成载具胶囊') and API_ActorRemoveGoods(ActorID,88150,1,'合成载具胶囊') and API_ActorRemoveGoods(ActorID,88151,1,'合成载具胶囊') then
			API_AddActorGoodsFlag(ActorID,ZaiJuID,1,0,'合成'.. API_GetGoodsName(ZaiJuID)..'')
			API_ActorSendMsg(ActorID,10,'获得1个 '.. API_GetGoodsName(ZaiJuID)..'')
			return 1
		end
	else
		API_ActorSendMsg(ActorID,3,'您的背包已满，请整理一下背包再试试吧')
		return 0
	end
end

--自动拾取物品
function WYL_AutoShiQu_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if API_ActorGetPropNum(ActorID,210) == 1 then
		if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用'..API_GetGoodsName(GoodsID)..'开启自动拾取') then
			API_ActorAddAutoColtTime(ActorID,1296000)
			local ShenYuTime = API_ActorGetPropNum(ActorID,215)
			local NowTime = os.time()
			local ZhongTime = NowTime + ShenYuTime
			local time = os.date("*t",ZhongTime)
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win rect="530,175,260,210"></win>')
			API_ResponseWrite('<br><text>您使用'..API_GetGoodsName(GoodsID)..'</text><text color="255,0,255">增加了15天的自动拾取时间</text><br><br><text>您的自动拾取功能可以使用到：</text><br><text color="255,0,255">'.. time.year ..'年'.. time.month ..'月'.. time.day ..'日  '.. time.hour ..':'.. time.min ..':'.. time.sec ..'</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 1
		end
	else
		API_ActorSendMsg(ActorID,3,'使用失败，目前禁止使用自动拾取功能')
		return 0
	end
	return 0
end

--地契功能
function SkillGoods_DiQi_GoodsCallFunc(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if GoodsID ~= 77 or API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local UID = API_GetUID(High,Low)
	local BagType,Loc = API_GetUIDGoodsInActor(UID,ActorID)
	Loc = Loc + 1
	local EntryID = API_ActorMeMScrollGetNumber(ActorID,BagType,Loc,1)
	if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,BagType,Loc - 1,'使用地契') then
		Pub_CreateDoor(ActorID,nEntryID)
	end
end

--经验兑换券
function SkillGoods_JYDHQ_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = GoodsID or API_RequestGetNumber(1)
	if GoodsID ~= 80498 then
		return 0
	end
	local XuanZheFangShi = API_RequestGetNumber(2)
	API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
	API_ResponseWrite('<win rect="600,200,330,200"></win>') 
	if XuanZheFangShi == 0 then
		API_ResponseWrite('<text>每张'..API_GetGoodsName(80498)..'允许兑换100经验，请问您要兑换多少张？</text><br>')
		API_ResponseWrite('<br><input type="number" name="3" size="4" width="60"><a href="SkillGoods_JYDHQ_GoodsCallFunc?1='..GoodsID..'&2=1">我要兑换这些</a><br>')
		API_ResponseWrite('<br><a href="SkillGoods_JYDHQ_GoodsCallFunc?1='..GoodsID..'&2=2">全部兑换</a><br>')
		API_ResponseWrite('<br><a>取消</a><br>')
	elseif XuanZheFangShi == 1 or XuanZheFangShi == 2 then
		local anzhuangshuliang = API_RequestGetNumber(3)
		if XuanZheFangShi == 2 then
			anzhuangshuliang = API_ActorGetGoodsNum(ActorID,80498)
		end
		if anzhuangshuliang <= 0 then
			anzhuangshuliang = 1
		end
		if anzhuangshuliang > API_ActorGetGoodsNum(ActorID,80498) then
			anzhuangshuliang = API_ActorGetGoodsNum(ActorID,80498)
		end
		if API_ActorGetGoodsNum(ActorID,80498) <= 0 then
			API_ResponseWrite('<text>您身上没有</text><text color="255,0,0">'..API_GetGoodsName(80498)..'</text><text>，不能兑换。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		elseif anzhuangshuliang > 99999 then
			API_ResponseWrite('<text>一次最多只能兑换 99999 张</text><text color="255,0,0">'..API_GetGoodsName(80498)..'</text><text>。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		else
			local exp = anzhuangshuliang * 100
			local ExploitL = API_GetActorExpLevel(ActorID)
			local expMax = API_GetExploitInfo(ExploitL,3)
			local expNow = API_GetActorCurExp(ActorID)
			local expAddMax = expMax - expNow
			if exp > expAddMax then
				anzhuangshuliang = math.ceil(expAddMax/100)
			end
			if anzhuangshuliang > 0 then
				if API_ActorRemoveGoods(ActorID,80498,anzhuangshuliang,'兑换经验') then
					local expAdd = anzhuangshuliang * 100
					API_ActorAddExp(ActorID,expAdd,1811,'引导者兑换经验')
					API_ResponseWrite('<text>您用 '..anzhuangshuliang..' 张</text><text color="255,0,0">'..API_GetGoodsName(80498)..'</text><text>兑换了'..expAdd..'经验。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					g_EventSystem:FireAction(ActorID,nil,_EVENT_ID_ONUSEGOODS,_E_SRC_TYPE_GOODS,GoodsID)
				end
			else
				API_ResponseWrite('<text>您当前经验达到上限，无法继续兑换经验，请提升等级后再来兑换</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	end
	API_ResponseFlush(ActorID)
	return 1
end
--超级经验兑换券
function SkillGoods_JYDHQ1_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = GoodsID or API_RequestGetNumber(1)
	if GoodsID ~= 82004 then
		return 0
	end
	local XuanZheFangShi = API_RequestGetNumber(2)
	API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
	API_ResponseWrite('<win rect="600,200,330,200"></win>') 
	if XuanZheFangShi == 0 then
		API_ResponseWrite('<text>每张'..API_GetGoodsName(82004)..'允许兑换10000经验，请问您要兑换多少张？</text><br>')
		API_ResponseWrite('<br><input type="number" name="3" size="4" width="60"><a href="SkillGoods_JYDHQ1_GoodsCallFunc?1='..GoodsID..'&2=1">我要兑换这些</a><br>')
		API_ResponseWrite('<br><a href="SkillGoods_JYDHQ1_GoodsCallFunc?1='..GoodsID..'&2=2">全部兑换</a><br>')
		API_ResponseWrite('<br><a>取消</a><br>')
	elseif XuanZheFangShi == 1 or XuanZheFangShi == 2 then
		local anzhuangshuliang = API_RequestGetNumber(3)
		if XuanZheFangShi == 2 then
			anzhuangshuliang = API_ActorGetGoodsNum(ActorID,82004)
		end
		if anzhuangshuliang <= 0 then
			anzhuangshuliang = 1
		end
		if anzhuangshuliang > API_ActorGetGoodsNum(ActorID,82004) then
			anzhuangshuliang = API_ActorGetGoodsNum(ActorID,82004)
		end
		if API_ActorGetGoodsNum(ActorID,82004) <= 0 then
			API_ResponseWrite('<text>您身上没有</text><text color="255,0,0">'..API_GetGoodsName(82004)..'</text><text>，不能兑换。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		elseif anzhuangshuliang > 99999 then
			API_ResponseWrite('<text>一次最多只能兑换 99999 张</text><text color="255,0,0">'..API_GetGoodsName(82004)..'</text><text>。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		else
			local exp = anzhuangshuliang * 10000
			local ExploitL = API_GetActorExpLevel(ActorID)
			local expMax = API_GetExploitInfo(ExploitL,3)
			local expNow = API_GetActorCurExp(ActorID)
			local expAddMax = expMax - expNow
			if exp > expAddMax then
				anzhuangshuliang = math.ceil(expAddMax/10000)
			end
			if anzhuangshuliang > 0 then
				if API_ActorRemoveGoods(ActorID,82004,anzhuangshuliang,'兑换经验') then
					local expAdd = anzhuangshuliang * 10000
					API_ActorAddExp(ActorID,expAdd,1811,'引导者兑换经验')
					API_ResponseWrite('<text>您用 '..anzhuangshuliang..' 张</text><text color="255,0,0">'..API_GetGoodsName(82004)..'</text><text>兑换了'..expAdd..'经验。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
				end
			else
				API_ResponseWrite('<text>您当前经验达到上限，无法继续兑换经验，请提升等级后再来兑换</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	end
	API_ResponseFlush(ActorID)
	return 1
end

--金币兑换券
function SkillGoods_JBDHQ_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = GoodsID or API_RequestGetNumber(1)
	if GoodsID ~= 80697 then
		return 0
	end
	local XuanZheFangShi = API_RequestGetNumber(2)
	API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
	API_ResponseWrite('<win rect="600,200,330,200"></win>') 
	if XuanZheFangShi == 0 then
		API_ResponseWrite('<text>每张'..API_GetGoodsName(80697)..'允许兑换100金币，请问您要兑换多少张？</text><br>')
		API_ResponseWrite('<br><input type="number" name="3" size="4" width="60"><a href="SkillGoods_JBDHQ_GoodsCallFunc?1='..GoodsID..'&2=1">我要兑换这些</a><br>')
		API_ResponseWrite('<br><a href="SkillGoods_JBDHQ_GoodsCallFunc?1='..GoodsID..'&2=2">全部兑换</a><br>')
		API_ResponseWrite('<br><a>取消</a><br>')
	elseif XuanZheFangShi == 1 or XuanZheFangShi == 2 then
		local anzhuangshuliang = API_RequestGetNumber(3)
		if XuanZheFangShi == 2 then
			anzhuangshuliang = API_ActorGetGoodsNum(ActorID,80697)
		end
		if anzhuangshuliang <= 0 then
			anzhuangshuliang = 1
		end
		if anzhuangshuliang > API_ActorGetGoodsNum(ActorID,80697) then
			anzhuangshuliang = API_ActorGetGoodsNum(ActorID,80697)
		end
		if API_ActorGetGoodsNum(ActorID,80697) <= 0 then
			API_ResponseWrite('<text>您身上没有</text><text color="255,0,0">'..API_GetGoodsName(80697)..'</text><text>，不能兑换。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		elseif anzhuangshuliang > 99999 then
			API_ResponseWrite('<text>一次最多只能兑换 99999 张</text><text color="255,0,0">'..API_GetGoodsName(80697)..'</text><text>。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		else
			local Money = anzhuangshuliang * 100
			local MoneyMax = PD_ActorGold_Max
			local MoneyNow = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD)
			local MoneyAddMax = MoneyMax - MoneyNow
			if Money > MoneyAddMax then
				anzhuangshuliang = math.ceil(MoneyAddMax/100)
			end
			if anzhuangshuliang > 0 then
				if API_ActorRemoveGoods(ActorID,80697,anzhuangshuliang,'兑换金币') then
					local MoneyAdd = anzhuangshuliang * 100
					API_ActorAddMoney(ActorID,MoneyAdd,1811,'引导者兑换金币')
					API_ResponseWrite('<text>您用 '..anzhuangshuliang..' 张</text><text color="255,0,0">'..API_GetGoodsName(80697)..'</text><text>兑换了'..MoneyAdd..'金币。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					g_EventSystem:FireAction(ActorID,nil,_EVENT_ID_ONUSEGOODS,_E_SRC_TYPE_GOODS,GoodsID)
				end
			else
				API_ResponseWrite('<text>您当前金币达到上限，无法继续兑换金币，请前往交易所将金币转换成金砖后再来兑换</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	end
	API_ResponseFlush(ActorID)
	return 1
end

--水晶币兑换券
function SkillGoods_SJBDHQ_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = GoodsID or API_RequestGetNumber(1)
	if GoodsID ~= 80696 then
		return 0
	end
	local XuanZheFangShi = API_RequestGetNumber(2)
	API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
	API_ResponseWrite('<win rect="600,200,330,200"></win>') 
	if XuanZheFangShi == 0 then
		API_ResponseWrite('<text>每张'..API_GetGoodsName(80696)..'允许兑换100水晶币，请问您要兑换多少张？</text><br>')
		API_ResponseWrite('<br><input type="number" name="3" size="4" width="60"><a href="SkillGoods_SJBDHQ_GoodsCallFunc?1='..GoodsID..'&2=1">我要兑换这些</a><br>')
		API_ResponseWrite('<br><a href="SkillGoods_SJBDHQ_GoodsCallFunc?1='..GoodsID..'&2=2">全部兑换</a><br>')
		API_ResponseWrite('<br><a>取消</a><br>')
	elseif XuanZheFangShi == 1 or XuanZheFangShi == 2 then
		local anzhuangshuliang = API_RequestGetNumber(3)
		if XuanZheFangShi == 2 then
			anzhuangshuliang = API_ActorGetGoodsNum(ActorID,80696)
		end
		if anzhuangshuliang <= 0 then
			anzhuangshuliang = 1
		end
		if anzhuangshuliang > API_ActorGetGoodsNum(ActorID,80696) then
			anzhuangshuliang = API_ActorGetGoodsNum(ActorID,80696)
		end
		if API_ActorGetGoodsNum(ActorID,80696) <= 0 then
			API_ResponseWrite('<text>您身上没有</text><text color="255,0,0">'..API_GetGoodsName(80696)..'</text><text>，不能兑换。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		elseif anzhuangshuliang > 99999 then
			API_ResponseWrite('<text>一次最多只能兑换 99999 张</text><text color="255,0,0">'..API_GetGoodsName(80696)..'</text><text>。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		else
			local Crystal = anzhuangshuliang * 100
			local CrystalMax = 100000000
			local CrystalNow = API_ActorGetPropNum(ActorID,208)
			local CrystalAddMax = CrystalMax - CrystalNow
			if Crystal > CrystalAddMax then
				anzhuangshuliang = math.ceil(CrystalAddMax/100)
			end
			if anzhuangshuliang > 0 then
				if API_ActorRemoveGoods(ActorID,80696,anzhuangshuliang,'兑换金币') then
					local CrystalAdd = anzhuangshuliang * 100
					API_ActorShoppingM_Add(ActorID,CrystalAdd,1811,'引导者兑换水晶币')
					API_ResponseWrite('<text>您用 '..anzhuangshuliang..' 张</text><text color="255,0,0">'..API_GetGoodsName(80696)..'</text><text>兑换了'..CrystalAdd..'水晶币。</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					g_EventSystem:FireAction(ActorID,nil,_EVENT_ID_ONUSEGOODS,_E_SRC_TYPE_GOODS,GoodsID)
				end
			else
				API_ResponseWrite('<text>您当前水晶币达到上限，无法继续兑换水晶币</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
			end
		end
	end
	API_ResponseFlush(ActorID)
	return 1
end


function SkillGoods_YJHFKJL_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	local k = 0 
	for i = 0,1 do 
		local Index = i 
		local HeroID = API_ActorGetCurHeroID(ActorID,Index) 
		if GLOBAL_HeroInfo[HeroID] ~= nil then 
			local HeroName = GLOBAL_HeroInfo[HeroID].HeroName 
			local HeroSkillList = GLOBAL_HeroInfo[HeroID].HeroSkillList 
			for j,v in HeroSkillList do 
				k = k + 1 
				API_ActorSetShortCut(ActorID,0,v,k) 
			end 
		else  
			k = k + 4 
		end 
	end 
	return 1
end

--友谊啤酒
function SkillGoods_FriendBeer_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if GoodsID ~= 88080 then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	API_ActorStartSelect(ActorID,'SkillGoods_FriendBeer',16) 
	API_ActorSendMsg(ActorID,3,'请左键点击您的好友')
	return 1
end

function SkillGoods_FriendBeer()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 

	if API_ActorGetGoodsNum(ActorID,88080) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return
	end
	if SelectType == 2 then
		if API_ActorIsOnline(SelectID) and (API_GetRelation(ActorID,SelectID,1) == 0 or API_GetRelation(ActorID,SelectID,1) == 5) and API_GetRelation(ActorID,SelectID,2) < 4000 then
			if API_ActorRemoveGoods(ActorID,88080,1,'使用友达啤酒') then
				local dangqianHaogandu = API_GetRelation(ActorID,SelectID,2)
				local MaxaddHaogandu = 4000 - dangqianHaogandu
				local addHaogandu = math.min(MaxaddHaogandu,100)
				dangqianHaogandu = dangqianHaogandu + addHaogandu
				API_UpdateRelation(ActorID,SelectID,2,dangqianHaogandu)
				API_ActorSendMsg(ActorID,8,'您与'..API_GetActorName(SelectID)..'共饮'..API_GetGoodsName(88080)..'，增加'..addHaogandu..'点好感度')
				API_ActorSendMsg(SelectID,8,''..API_GetActorName(ActorID)..'与您共饮'..API_GetGoodsName(88080)..','..API_GetActorName(ActorID)..'对您的好感加深了！')
				HaoYouZhuDuiXiTong_UpdateRelation(ActorID,SelectID)
			end
		elseif API_GetRelation(ActorID,SelectID,2) >= 4000 then
			API_ActorStartSelect(ActorID,'SkillGoods_FriendBeer',16) 
			API_ActorSendMsg(ActorID,3,'您与'..API_GetActorName(SelectID)..'的好感度已经达到极限，请对其他好友使用')
		else
			API_ActorStartSelect(ActorID,'SkillGoods_FriendBeer',16) 
			API_ActorSendMsg(ActorID,3,'请左键点击您的好友')
		end
	else
		API_ActorStartSelect(ActorID,'SkillGoods_FriendBeer',16) 
		API_ActorSendMsg(ActorID,3,'请左键点击您的好友')
	end
end


--浮空岛双倍卡
function SkillGoods_FKDSBK_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if GoodsID ~= 88083 then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local BattleType = Decide_BattleType(MapID)
	if BattleType == 1 then
		if API_VarDataGetNumber(ActorID,1,18407) == 0 then
			local TodayLingjiangNum = API_VarDataGetNumber(ActorID,1,FangShouFuBen_LingjiangNum)
			local StandardNum = FuKongDao_TypeInFo[1].StandardNum
			if TodayLingjiangNum < StandardNum then
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用浮空岛双倍卡') then
					TodayLingjiangNum = TodayLingjiangNum + 1
					API_VarDataSetNumber(ActorID,1,FangShouFuBen_LingjiangNum,TodayLingjiangNum)
					API_VarDataSetNumber(ActorID,1,18407,1)
					local zhiqianExp = API_VarDataGetNumber(ActorID,1,18069)
					local zhiqianHunger = API_VarDataGetNumber(ActorID,1,18359)
					local zhiqianGouWuQuan = API_VarDataGetNumber(ActorID,1,18005)
					zhiqianExp = zhiqianExp * 2
					zhiqianHunger = zhiqianHunger * 2
					zhiqianGouWuQuan = zhiqianGouWuQuan * 2
					API_VarDataSetNumber(ActorID,1,18069,zhiqianExp)
					API_VarDataSetNumber(ActorID,1,18359,zhiqianHunger)
					API_VarDataSetNumber(ActorID,1,18005,zhiqianGouWuQuan)
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text>您使用了一张</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><text color="255,0,0">'..API_GetGoodsName(GoodsID)..'</text><text>，本次防守浮空岛奖励翻倍，并额外消耗一次今天防守浮空岛进入次数！</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)
					API_ActorSendMsg(ActorID,8,'您使用了一张'..API_GetGoodsName(GoodsID)..'，本次防守浮空岛奖励翻倍，并额外消耗一次今天防守浮空岛进入次数！')
				end
			else
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>由于您今天进入防守浮空岛的次数超过'..PublicFun_ArabianNumberToChineseNumber(StandardNum)..'次，无法再使用</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><text color="255,0,0">'..API_GetGoodsName(GoodsID)..'</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
			end
		else
			API_ActorSendMsg(ActorID,8,'您在本浮空岛已经使用过'..API_GetGoodsName(GoodsID)..'了！')
		end
--	elseif BattleType == 4 then
--		if API_VarDataGetNumber(ActorID,1,18407) == 0 then
--			local Peerage = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
--			local TodayLingjiangNum = API_VarDataGetNumber(ActorID,1,LaJuZhanFuBen_LingjiangNum)
--			local StandardNum = FuKongDao_TypeInFo[2].StandardNum[Peerage]
--			if TodayLingjiangNum < StandardNum then
--				if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用浮空岛双倍卡') then
--					TodayLingjiangNum = TodayLingjiangNum + 1
--					API_VarDataSetNumber(ActorID,1,LaJuZhanFuBen_LingjiangNum,TodayLingjiangNum)
--					API_VarDataSetNumber(ActorID,1,18407,1)
--					API_ResponseWrite('<name></name>')
--					API_ResponseWrite('<br><text>您使用了一张</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><text color="255,0,0">'..API_GetGoodsName(GoodsID)..'</text><text>，本次拉锯战浮空岛奖励翻倍，并额外消耗一次今天拉锯战浮空岛进入次数！</text><br>')
--					API_ResponseWrite('<br><a>确定</a><br>')
--					API_ResponseFlush(ActorID)
--					API_ActorSendMsg(ActorID,8,'您使用了一张'..API_GetGoodsName(GoodsID)..'，本次拉锯战浮空岛奖励翻倍，并额外消耗一次今天拉锯战浮空岛进入次数！')
--				end
--			else
--				API_ResponseWrite('<name></name>')
--				API_ResponseWrite('<br><text>由于您今天进入拉锯战浮空岛的次数超过'..PublicFun_ArabianNumberToChineseNumber(StandardNum)..'次，无法再使用</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><text color="255,0,0">'..API_GetGoodsName(GoodsID)..'</text><br>')
--				API_ResponseWrite('<br><a>确定</a><br>')
--				API_ResponseFlush(ActorID)
--			end
--		else
--			API_ActorSendMsg(ActorID,8,'您在本浮空岛已经使用过'..API_GetGoodsName(GoodsID)..'了！')
--		end
	elseif BattleType == 5 then
		if API_VarDataGetNumber(ActorID,1,18407) == 0 then
			local TodayLingjiangNum = API_VarDataGetNumber(ActorID,1,XunLianYingFuBen_LingjiangNum)
			local StandardNum = FuKongDao_TypeInFo[4].StandardNum
			if TodayLingjiangNum < StandardNum then
				if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用浮空岛双倍卡') then
					TodayLingjiangNum = TodayLingjiangNum + 1
					API_VarDataSetNumber(ActorID,1,XunLianYingFuBen_LingjiangNum,TodayLingjiangNum)
					API_VarDataSetNumber(ActorID,1,18407,1)
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text>您使用了一张</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><text color="255,0,0">'..API_GetGoodsName(GoodsID)..'</text><text>，本次训练营浮空岛奖励翻倍，并额外消耗一次今天训练营浮空岛进入次数！</text><br>')
					API_ResponseWrite('<br><a>确定</a><br>')
					API_ResponseFlush(ActorID)
					API_ActorSendMsg(ActorID,8,'您使用了一张'..API_GetGoodsName(GoodsID)..'，本次训练营浮空岛奖励翻倍，并额外消耗一次今天训练营浮空岛进入次数！')
				end
			else
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>由于您今天进入训练营浮空岛的次数超过'..PublicFun_ArabianNumberToChineseNumber(StandardNum)..'次，无法再使用</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><text color="255,0,0">'..API_GetGoodsName(GoodsID)..'</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
			end
		else
			API_ActorSendMsg(ActorID,8,'您在本浮空岛已经使用过'..API_GetGoodsName(GoodsID)..'了！')
		end
	else
		API_ActorSendMsg(ActorID,3,'只能在防守浮空岛和训练营浮空岛内使用')
	end
	return 1
end



--能量烈酒
function PowerBeer_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'您没有这个道具')
		return 0
	end
	local StatusMainID = 142001
	if GoodsID == 211 then
		if API_ActorFindStatus(ActorID, 142) then 
			local Time = API_GetActorStausTime(ActorID, 142)
			if   Time < 320400000 then 
				API_ActorRemoveGoods(ActorID,GoodsID, 1,'删除1个能量烈酒')
				API_ActorAddStatus(ActorID,142001, 3600000)
				return 1
			else 
				API_ActorSendMsg(ActorID,3,'无法使用！原因：此类物品积累时间不能超过90小时')
				return 0
			end
		elseif  API_ActorFindStatus(ActorID, 761) then 
			API_ActorRemoveGoods(ActorID,GoodsID, 1,'删除1个能量烈酒')
			API_ActorRemoveStatus(ActorID, 761001)
			API_ActorAddStatus(ActorID, 142001, 3600000)
			return 1
		else
			API_ActorRemoveGoods(ActorID,GoodsID, 1,'删除1个能量烈酒')
			API_ActorAddStatus(ActorID, 142001, 3600000)
			return 1
		end
	end
	return 0
end

--醇香能量烈酒
function ChunXiangPowerBeer_GoodsCallFunc(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'您没有这个道具')
		return 0
	end
	local StatusMainID2 = 761001
	if GoodsID == 212 then
		if API_ActorFindStatus(ActorID, 761) then 
			local Time = API_GetActorStausTime(ActorID, 761)
			if   Time < 320400000 then 
				API_ActorRemoveGoods(ActorID,GoodsID, 1,'删除1个醇香能量烈酒')
				API_ActorAddStatus(ActorID, 761001, 3600000)
				return 1
			else 
				API_ActorSendMsg(ActorID,3,'无法使用！原因：此类物品积累时间不能超过90小时')
				return 0
			end
		elseif API_ActorFindStatus(ActorID, 142) then 
			API_ActorRemoveGoods(ActorID,GoodsID, 1,'删除1个醇香能量烈酒')
			API_ActorRemoveStatus(ActorID, 142001)
			API_ActorAddStatus(ActorID, 761001, 3600000)
			return 1
		else
			API_ActorRemoveGoods(ActorID,GoodsID, 1,'删除1个醇香能量烈酒')
			API_ActorAddStatus(ActorID, 761001, 3600000)
			return 1
		end		
	end
	return 0
end
--遗忘药膏
function Yiwangyaogaoshiyong(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)	
	local ActorID = ActorID or API_RequestGetActorID()
	local GoodsID = GoodsID or API_RequestGetNumber(1)
	if GoodsID ~= 80485 then
		return 0
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'您没有这个道具')
		return 0
	end
	API_ResponseWrite('<name>遗忘药膏</name>')
	API_ResponseWrite('<win rect="600,200,330,200"></win>') 
	API_ResponseWrite('<text color="0,255,0">请选择您要使用的功能：</text><br><br>')
	API_ResponseWrite('<a href="NPCFunc_WSkillBranchConvert_Title">生活技能分支转换</a><br><br>')
	API_ResponseWrite('<a href="NPCFunc_WSkillForget_Title">生活技能遗忘</a><br><br>')
	API_ResponseFlush(ActorID)
	return 1
end

--动力源补给包
local NengLiangBao = {
[88971] = {ID=80946,Num=100,Bind=3},
}

function DongLiYuanBaoUse(ActorID,GoodsID)
	local ActorID = ActorID or API_RequestGetActorID()
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then--判断玩家是否拥有物品
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if NengLiangBao[GoodsID] == nil then--判断物品是否属于道具包裹
		API_ActorSendMsg(ActorID,3,'非法物品')
		return 0
	end
	local ExchangeGoodsID = NengLiangBao[GoodsID].ID
	local ExchangeGoodsNum = NengLiangBao[GoodsID].Num
	local ExchangeGoodsBind = NengLiangBao[GoodsID].Bind
	
	local AddPackageSize = API_ActorCanAddGoods(ActorID,ExchangeGoodsID,ExchangeGoodsNum,ExchangeGoodsBind,0)
	if AddPackageSize ~= -1 then
		if API_ActorGetGoodsNum(ActorID,88971) > 0 and API_ActorRemoveGoods(ActorID,88971,1,'扣除能量包') then--销毁玩家身上的物品
			API_AddActorGoodsFlag(ActorID,ExchangeGoodsID,ExchangeGoodsNum,ExchangeGoodsBind,'获得能量源')
			API_ActorSendMsg(ActorID,3,'打开动力源补给包，获得动力源100个')
			local Number = math.random(10000)
			if Number <= 100 then
				if API_ActorCanAddGoods(ActorID,80949,1,1,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,80949,1,1,'获得晶源卡牌')
					API_ActorSendMsg(ActorID,3,'获得晶源卡牌')
				else
					local GoodsName = API_GetGoodsName(80949)
					API_SendActorMailByName(API_GetActorName(ActorID),80949,1,1,'动力源补给包奖励','开启动力源补给包获得额外奖励')
					API_ActorSendMsg(ActorID,3,'获得'..GoodsName..'1个（请到邮箱领取）')
				end	
			end
			local StatusMainID = 2001	
			if API_ActorFindStatus(ActorID,StatusMainID) then
				API_ActorRemoveStatus(ActorID,2001001)
			end
			return 1
		end
	else
		API_ActorSendMsg(ActorID,3,'您的背包空间不足')
		API_ResponseWrite('<name>'..API_GetGoodsName(GoodsID)..'</name>')
		API_ResponseWrite('<br><text>您的背包空间不足，请整理背包，留出更多空间后再来打开'..API_GetGoodsName(GoodsID)..'</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
end