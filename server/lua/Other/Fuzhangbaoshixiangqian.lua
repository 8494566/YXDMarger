-------服装镶嵌宝石-------------
-----------7.31---------------
------创建宝石，给宝石添加记忆属性
------nStrKey 1 存储属性 字符串部分  nValueKey 1 存储属性
------nValueKey 5 存储数值MIn 
------nValueKey 6 存储数值MAX
------通过 nStrKey 1 nValueKey 5 nValueKey 6 决定宝石的属性
------TIPS显示 “字符串1” + MIN ~ MAX（镶上时在此范围内随机）
--------------nStrKey 1  + nValueKey 5 ~ nValueKey 6（镶上时在此范围内随机） 
baoshiwupinbiao = {39501,39502,39503,39504,39505,39506,39507,39508,39509,39510,39511,39512,39513,39514,39515,39516,39517,39518,39519,39520,39521,39522,39523,39524,39525,39526,39527,39528,39529,39530}
--宝石效果表
fuzhuangbaoshixiaoguotable = {
	[39501]={shuxingname='物理攻击',shuxing=40,min=2,max=12,},
	[39502]={shuxingname='火药攻击',shuxing=41,min=2,max=12,},
	[39503]={shuxingname='魔法攻击',shuxing=42,min=2,max=12,},
	[39504]={shuxingname='物理攻击',shuxing=40,min=4,max=17,},
	[39505]={shuxingname='火药攻击',shuxing=41,min=4,max=17,},
	[39506]={shuxingname='魔法攻击',shuxing=42,min=4,max=17,},
	[39507]={shuxingname='物理攻击',shuxing=40,min=10,max=31,},
	[39508]={shuxingname='火药攻击',shuxing=41,min=10,max=31,},
	[39509]={shuxingname='魔法攻击',shuxing=42,min=10,max=31,},
	[39510]={shuxingname='基础防御',shuxing=39,min=2,max=8,},
	[39511]={shuxingname='基础防御',shuxing=39,min=4,max=12,},
	[39512]={shuxingname='基础防御',shuxing=39,min=6,max=21,},
	[39513]={shuxingname='生命',shuxing=38,min=6,max=12,},
	[39514]={shuxingname='生命',shuxing=38,min=11,max=22,},
	[39515]={shuxingname='生命',shuxing=38,min=15,max=35,},
	[39516]={shuxingname='物理暴击',shuxing=45,min=16,max=40,},
	[39517]={shuxingname='物理暴击',shuxing=45,min=32,max=56,},
	[39518]={shuxingname='物理暴击',shuxing=45,min=48,max=80,},
	[39519]={shuxingname='火药暴击',shuxing=46,min=16,max=40,},
	[39520]={shuxingname='火药暴击',shuxing=46,min=32,max=56,},
	[39521]={shuxingname='火药暴击',shuxing=46,min=48,max=80,},
	[39522]={shuxingname='魔法暴击',shuxing=47,min=16,max=40,},
	[39523]={shuxingname='魔法暴击',shuxing=47,min=32,max=56,},
	[39524]={shuxingname='魔法暴击',shuxing=47,min=48,max=80,},
	[39525]={shuxingname='格挡点数',shuxing=48,min=20,max=40,},
	[39526]={shuxingname='格挡点数',shuxing=48,min=30,max=65,},
	[39527]={shuxingname='格挡点数',shuxing=48,min=40,max=95,},
	[39528]={shuxingname='反击强度',shuxing=49,min=30,max=70,},
	[39529]={shuxingname='反击强度',shuxing=49,min=40,max=100,},
	[39530]={shuxingname='反击强度',shuxing=49,min=50,max=130,},
	
}
--属性效果表
fuzhuangbaoshishuxingtable = {	
	[38] = {dangci1min = 6,dangci1max = 15,dangci2min = 16,dangci2max = 25,dangci3min = 26,dangci3max = 35,},
	[39] = {dangci1min = 2,dangci1max = 8,dangci2min = 9,dangci2max = 15,dangci3min = 16,dangci3max = 21,},
	[40] = {dangci1min = 2,dangci1max = 11,dangci2min = 12,dangci2max = 21,dangci3min = 22,dangci3max = 31,},
	[41] = {dangci1min = 2,dangci1max = 11,dangci2min = 12,dangci2max = 21,dangci3min = 22,dangci3max = 31,},
	[42] = {dangci1min = 2,dangci1max = 11,dangci2min = 12,dangci2max = 21,dangci3min = 22,dangci3max = 31,}, 
	[45] = {dangci1min = 16,dangci1max = 40,dangci2min = 41,dangci2max = 60,dangci3min = 61,dangci3max = 80,}, 
	[46] = {dangci1min = 16,dangci1max = 40,dangci2min = 41,dangci2max = 60,dangci3min = 61,dangci3max = 80,},
	[47] = {dangci1min = 16,dangci1max = 40,dangci2min = 41,dangci2max = 60,dangci3min = 61,dangci3max = 80,},
	[48] = {dangci1min = 20,dangci1max = 40,dangci2min = 41,dangci2max = 70,dangci3min = 71,dangci3max = 95,}, 	
	[49] = {dangci1min = 30,dangci1max = 70,dangci2min = 71,dangci2max = 100,dangci3min = 101,dangci3max = 130,}, 
}
local fenjiecailiao2 = 80195
local fenjiecailiao3 = 80196
fuzhuangbaoshixiexiajianglitable = {	
	[1] = {[1] = {[1]={fenjiecailiao2num =39,fenjiecailiao3num =1,},
				  [2]={fenjiecailiao2num =43,fenjiecailiao3num =1,},
				  [3]={fenjiecailiao2num =48,fenjiecailiao3num =1,},
				  },
		   [2] = {[1]={fenjiecailiao2num =78,fenjiecailiao3num =2,},
				  [2]={fenjiecailiao2num =87,fenjiecailiao3num =3,},
				  [3]={fenjiecailiao2num =96,fenjiecailiao3num =3,},
				  },
		   [3] = {[1]={fenjiecailiao2num =117,fenjiecailiao3num =3,},
				  [2]={fenjiecailiao2num =130,fenjiecailiao3num =4,},
				  [3]={fenjiecailiao2num =145,fenjiecailiao3num =4,},
				  },
		   },
	[2] = {[1] = {[1]={fenjiecailiao2num =156,fenjiecailiao3num =5,},
				  [2]={fenjiecailiao2num =173,fenjiecailiao3num =5,},
				  [3]={fenjiecailiao2num =193,fenjiecailiao3num =6,},
				  },
		   [2] = {[1]={fenjiecailiao2num =195,fenjiecailiao3num =6,},
				  [2]={fenjiecailiao2num =217,fenjiecailiao3num =6,},
				  [3]={fenjiecailiao2num =241,fenjiecailiao3num =7,},
				  },
		   [3] = {[1]={fenjiecailiao2num =234,fenjiecailiao3num =7,},
				  [2]={fenjiecailiao2num =260,fenjiecailiao3num =8,},
				  [3]={fenjiecailiao2num =289,fenjiecailiao3num =9,},
				  },
		   },
	[3] = {[1] = {[1]={fenjiecailiao2num =205,fenjiecailiao3num =16,},
				  [2]={fenjiecailiao2num =288,fenjiecailiao3num =18,},
				  [3]={fenjiecailiao2num =253,fenjiecailiao3num =20,},
				  },
		   [2] = {[1]={fenjiecailiao2num =234,fenjiecailiao3num =18,},
				  [2]={fenjiecailiao2num =260,fenjiecailiao3num =21,},
				  [3]={fenjiecailiao2num =289,fenjiecailiao3num =23,},
				  },
		   [3] = {[1]={fenjiecailiao2num =263,fenjiecailiao3num =21,},
				  [2]={fenjiecailiao2num =293,fenjiecailiao3num =23,},
				  [3]={fenjiecailiao2num =325,fenjiecailiao3num =26,},
				  },
		   },
}
fuzhuangbaoshixiexiajianglitable2 = {	
	[1] = {[1] = {[1]={fenjiecailiao2num =26,fenjiecailiao3num =1,},
				  [2]={fenjiecailiao2num =29,fenjiecailiao3num =1,},
				  [3]={fenjiecailiao2num =32,fenjiecailiao3num =1,},
				  },
		   [2] = {[1]={fenjiecailiao2num =52,fenjiecailiao3num =2,},
				  [2]={fenjiecailiao2num =58,fenjiecailiao3num =2,},
				  [3]={fenjiecailiao2num =64,fenjiecailiao3num =2,},
				  },
		   [3] = {[1]={fenjiecailiao2num =78,fenjiecailiao3num =2,},
				  [2]={fenjiecailiao2num =87,fenjiecailiao3num =3,},
				  [3]={fenjiecailiao2num =96,fenjiecailiao3num =3,},
				  },
		   },
	[2] = {[1] = {[1]={fenjiecailiao2num =104,fenjiecailiao3num =3,},
				  [2]={fenjiecailiao2num =116,fenjiecailiao3num =3,},
				  [3]={fenjiecailiao2num =128,fenjiecailiao3num =4,},
				  },
		   [2] = {[1]={fenjiecailiao2num =130,fenjiecailiao3num =4,},
				  [2]={fenjiecailiao2num =145,fenjiecailiao3num =4,},
				  [3]={fenjiecailiao2num =161,fenjiecailiao3num =5,},
				  },
		   [3] = {[1]={fenjiecailiao2num =156,fenjiecailiao3num =5,},
				  [2]={fenjiecailiao2num =173,fenjiecailiao3num =5,},
				  [3]={fenjiecailiao2num =193,fenjiecailiao3num =6,},
				  },
		   },
	[3] = {[1] = {[1]={fenjiecailiao2num =137,fenjiecailiao3num =11,},
				  [2]={fenjiecailiao2num =152,fenjiecailiao3num =12,},
				  [3]={fenjiecailiao2num =169,fenjiecailiao3num =13,},
				  },
		   [2] = {[1]={fenjiecailiao2num =156,fenjiecailiao3num =12,},
				  [2]={fenjiecailiao2num =173,fenjiecailiao3num =14,},
				  [3]={fenjiecailiao2num =193,fenjiecailiao3num =15,},
				  },
		   [3] = {[1]={fenjiecailiao2num =176,fenjiecailiao3num =14,},
				  [2]={fenjiecailiao2num =195,fenjiecailiao3num =15,},
				  [3]={fenjiecailiao2num =217,fenjiecailiao3num =17,},
				  },
			},			  
}
function fuzhuangbaoshicuhangjianshuxingadd(ActorID,GoodsID,bangdingzhuangk,huodong)
	local UID = 0
	if fuzhuangbaoshixiaoguotable[GoodsID] == nil then
		return
	end
	local shuxingname =''
	local shuxing = 0
	local nummin = 0
	local nummax = 0
	if type(fuzhuangbaoshixiaoguotable[GoodsID]) == 'table' then
		shuxingname = fuzhuangbaoshixiaoguotable[GoodsID].shuxingname
		shuxing = fuzhuangbaoshixiaoguotable[GoodsID].shuxing
		nummin = fuzhuangbaoshixiaoguotable[GoodsID].min
		nummax = fuzhuangbaoshixiaoguotable[GoodsID].max 
	end
	shuxing = shuxing * 1000
	if shuxing == 0 or nummin == 0 or nummax == 0 then
		return
	end
	if bangdingzhuangk == 1 then --绑定
		UID = API_AddActorGoodsPropRetUID(ActorID,GoodsID,1,1,'服装镶嵌用宝石创建',-1,-1)
	elseif 	bangdingzhuangk == 0 then --不绑定
		UID = API_AddActorGoodsPropRetUID(ActorID,GoodsID,1,0,'服装镶嵌用宝石创建',-1,-1)		 
	end
	local bagID,bagLoc = API_GetUIDGoodsInActor(UID,ActorID)--背包ID 和 位置
	API_ActorMeMScrollSetString(ActorID,bagID,bagLoc+1,1,shuxingname)
	API_ActorMeMScrollSetNumber(ActorID,bagID,bagLoc+1,1,shuxing)
	API_ActorMeMScrollSetNumber(ActorID,bagID,bagLoc+1,5,nummin)
	API_ActorMeMScrollSetNumber(ActorID,bagID,bagLoc+1,6,nummax)
	local PlayName =  API_GetActorName(ActorID)
	if API_IsBattleGameServer() then
	else
		if huodong == 1 then
--~ 			API_ActorBDCMsg(-1,0,-1,15,85,0,17,''..PlayName..'打开幸运星获得了“'..API_GetGoodsName(GoodsID)..'”一颗，价值600点券！')
		elseif 	huodong == 2 then
--~ 			API_ActorBDCMsg(-1,0,-1,15,85,0,17,''..PlayName..'打开星宝珠获得了“'..API_GetGoodsName(GoodsID)..'”一颗，价值600点券！')
		elseif 	huodong == 3 then
--~ 			API_ActorBDCMsg(-1,0,-1,15,85,0,17,''..PlayName..'兑换万圣节糖果获得了“'..API_GetGoodsName(GoodsID)..'”一颗，价值600点券！')
		elseif huodong == 4 then
--~ 			API_ActorBDCMsg(-1,0,-1,15,85,0,17,''..PlayName..'打开超级幸运星获得了“'..API_GetGoodsName(GoodsID)..'”一颗，价值600点券！')	
		elseif huodong == 5 then
			API_ActorBDCMsg(-1,0,-1,15,85,0,17,''..PlayName..'人品大爆发！开启时装魔法包额外获得价值1500点券的“'..API_GetGoodsName(GoodsID)..'”一颗！')			
		end
	end	
end
function fuzhuangbaoshitihuan(ActorID,shuxingID,beixiaohaodebaoshiid)
	local shuxing = math.floor(shuxingID/1000) --商
	local xiaoguo = math.mod(shuxingID,1000) --余
	local dangci1min = 0
	local dangci1max = 0
	local dangci2min = 0
	local dangci2max = 0
	local dangci3min = 0
	local dangci3max = 0	
	local dangci = 0
	local duanshu = 0
	if fuzhuangbaoshishuxingtable[shuxing] ~= nil then
		if type(fuzhuangbaoshishuxingtable[shuxing]) == 'table' then
			dangci1min = fuzhuangbaoshishuxingtable[shuxing].dangci1min
			dangci1max = fuzhuangbaoshishuxingtable[shuxing].dangci1max
			dangci2min = fuzhuangbaoshishuxingtable[shuxing].dangci2min
			dangci2max = fuzhuangbaoshishuxingtable[shuxing].dangci2max
			dangci3min = fuzhuangbaoshishuxingtable[shuxing].dangci3min
			dangci3max = fuzhuangbaoshishuxingtable[shuxing].dangci3max		
			if xiaoguo >= dangci1min and xiaoguo <= dangci1max then
				dangci = 1
				local chazhi = dangci1max - dangci1min
				chazhi = chazhi/3
				if xiaoguo >= dangci1min and xiaoguo <= dangci1min + chazhi then --6-9 2-4
					duanshu = 1
				elseif xiaoguo > dangci1min + chazhi and xiaoguo <= dangci1min + chazhi*2 then --10-12 5-6
					duanshu = 2
				elseif xiaoguo > dangci1min + chazhi*2  and xiaoguo <= dangci1min + chazhi*3 then --13-15 7-8
					duanshu = 3
				end
			elseif xiaoguo >= dangci2min and xiaoguo <= dangci2max then
				dangci = 2
				local chazhi = dangci2max - dangci2min
				chazhi = chazhi/3
				if xiaoguo >= dangci2min and xiaoguo <= dangci2min + chazhi then --16-19 9-11
					duanshu = 1
				elseif xiaoguo > dangci2min + chazhi and xiaoguo <= dangci2min + chazhi*2 then --20-22 12-13
					duanshu = 2
				elseif xiaoguo > dangci2min + chazhi*2  and xiaoguo <= dangci2min + chazhi*3 then --23-25 14-15
					duanshu = 3
				end	
			elseif xiaoguo >= dangci3min and xiaoguo <= dangci3max then
				dangci = 3
				local chazhi = dangci3max - dangci3min
				if chazhi == 5 then
					if xiaoguo == 16 or	xiaoguo == 17 then
						duanshu = 1
					elseif xiaoguo == 18 or	xiaoguo == 19 then
						duanshu = 2
					elseif xiaoguo == 20 or	xiaoguo == 21 then
						duanshu = 3
					end	
				else				
					chazhi = chazhi/3
					if xiaoguo >= dangci3min and xiaoguo <= dangci3min + chazhi then --26-29 16-11
						duanshu = 1
					elseif xiaoguo > dangci3min + chazhi and xiaoguo <= dangci3min + chazhi*2 then --30-32 12-13
						duanshu = 2
					elseif xiaoguo > dangci3min + chazhi*2  and xiaoguo <= dangci3min + chazhi*3 then --33-35 14-15
						duanshu = 3
					end	
				end	
			end
		end
	end
	if dangci > 0 and duanshu > 0 then
		local table1 
		if shuxing == 39 then
			table1 = fuzhuangbaoshixiexiajianglitable2
		else
			table1 = fuzhuangbaoshixiexiajianglitable
		end
		local randomgoods = math.random(1,100)
		local suiji = 0
		if randomgoods > 90 and randomgoods <= 100 then
			suiji = 3
		elseif randomgoods > 60 and randomgoods <= 90 then
			suiji = 2
		elseif randomgoods > 0 and randomgoods <= 60 then
			suiji = 1
		end
		if suiji <= 0 or suiji > 3 then
--API_Trace('suiji='..suiji)		
			return 1
		end
		if table1[dangci][duanshu][suiji] ~= nil then
			if type(table1[dangci][duanshu][suiji]) == 'table' then
				local num2 = 0
				local num3 = 0
				num2 = table1[dangci][duanshu][suiji].fenjiecailiao2num
				num3 = table1[dangci][duanshu][suiji].fenjiecailiao3num
				if num2 == 0 or num3 == 0 then
--API_Trace('dangci='..dangci)
--API_Trace('duanshu='..duanshu)
--API_Trace('suiji='..suiji)				
--API_Trace('num2='..num2)
--API_Trace('num3='..num3)				
					return 1
				end
				local fenjiecailiao2 = 80195
				local fenjiecailiao3 = 80196
				if API_ActorCanAddGoods(ActorID,fenjiecailiao2,num2,0,0) ~= -1 then
					if API_ActorCanAddGoods(ActorID,fenjiecailiao3,num3,0,0) ~= -1 then
						API_AddActorGoods(ActorID,fenjiecailiao2,num2,'替换服装宝石奖励')
						API_AddActorGoods(ActorID,fenjiecailiao3,num3,'替换服装宝石奖励')
						API_ActorSendMsg(ActorID,3,'替换服装上的宝石成功，获得“'..API_GetGoodsName(fenjiecailiao2)..'”'..num2..'个，获得“'..API_GetGoodsName(fenjiecailiao3)..'”'..num3..'个')	
						API_ActorSendMsg(ActorID,7,'替换服装上的宝石成功，获得“'..API_GetGoodsName(fenjiecailiao2)..'”'..num2..'个，获得“'..API_GetGoodsName(fenjiecailiao3)..'”'..num3..'个')	
						API_ResponseWrite('<name>服装宝石镶嵌</name>')
						API_ResponseWrite('<text>替换服装上的宝石成功，获得</text><img srcgd="'..fenjiecailiao2..'" tipgd="'..fenjiecailiao2..'"><text>*'..num2..'</text><img srcgd="'..fenjiecailiao3..'" tipgd="'..fenjiecailiao3..'"><text>*'..num3..'</text>')
						API_ResponseFlush(ActorID)
					else
						API_SendActorMailByName(API_GetActorName(ActorID),fenjiecailiao2,num2,0,'替换服装宝石奖励','替换服装上的宝石成功，获得“'..API_GetGoodsName(fenjiecailiao2)..'”'..num2..'个')
						API_SendActorMailByName(API_GetActorName(ActorID),fenjiecailiao3,num3,0,'替换服装宝石奖励','替换服装上的宝石成功，获得“'..API_GetGoodsName(fenjiecailiao3)..'”'..num3..'个')
						API_ActorSendMsg(ActorID,3,'替换服装上的宝石成功，获得“'..API_GetGoodsName(fenjiecailiao2)..'”'..num2..'个，获得“'..API_GetGoodsName(fenjiecailiao3)..'”'..num3..'个（请到邮箱领取）')	
						API_ResponseWrite('<name>服装宝石镶嵌</name>')
						API_ResponseWrite('<text>替换服装上的宝石成功，获得</text><img srcgd="'..fenjiecailiao2..'" tipgd="'..fenjiecailiao2..'"><text>*'..num2..'</text><img srcgd="'..fenjiecailiao3..'" tipgd="'..fenjiecailiao3..'"><text>*'..num3..'（请到邮箱领取）</text>')
						API_ResponseFlush(ActorID)
					end	
				else
					API_SendActorMailByName(API_GetActorName(ActorID),fenjiecailiao2,num2,0,'替换服装宝石奖励','替换服装上的宝石成功，获得“'..API_GetGoodsName(fenjiecailiao2)..'”'..num2..'个')
					API_SendActorMailByName(API_GetActorName(ActorID),fenjiecailiao3,num3,0,'替换服装宝石奖励','替换服装上的宝石成功，获得“'..API_GetGoodsName(fenjiecailiao3)..'”'..num3..'个')
					API_ActorSendMsg(ActorID,3,'替换服装上的宝石成功，获得“'..API_GetGoodsName(fenjiecailiao2)..'”'..num2..'个，获得“'..API_GetGoodsName(fenjiecailiao3)..'”'..num3..'个（请到邮箱领取）')	
					API_ActorSendMsg(ActorID,7,'替换服装上的宝石成功，获得“'..API_GetGoodsName(fenjiecailiao2)..'”'..num2..'个，获得“'..API_GetGoodsName(fenjiecailiao3)..'”'..num3..'个（请到邮箱领取）')	
					API_ResponseWrite('<name>服装宝石镶嵌</name>')
					API_ResponseWrite('<text>替换服装上的宝石成功，获得</text><img srcgd="'..fenjiecailiao2..'" tipgd="'..fenjiecailiao2..'"><text>*'..num2..'</text><img srcgd="'..fenjiecailiao3..'" tipgd="'..fenjiecailiao3..'"><text>*'..num3..'（请到邮箱领取）</text>')
					API_ResponseFlush(ActorID)
				end					
			end
		end
	end
	return 1
end

--[[function Fuzhangbaoshixiangqian_OnLogin(ActorID) 
	local wupinbiaochang = table.getn(baoshiwupinbiao)
	local randomgoods = math.random(1,wupinbiaochang)
	local goods = baoshiwupinbiao[randomgoods]
	fuzhuangbaoshicuhangjianshuxingadd(ActorID,goods,0)
end]]