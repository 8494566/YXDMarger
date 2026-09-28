----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\MapRandomEventConfig.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2009-3-16
--版  本:	1.0
--描  述:	地表随机事件配置脚本
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：万钰林
--日期：2009-3-16
--功能：创建
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--地图内玩家回调时间
MapRandomEvent_TimeCallFunc = 30
--XX秒内有打怪就增加嫌疑值
MapRandomEvent_KillMonsterTime = 45
--增加嫌疑值的数量
MapRandomEvent_AddXianYiZhi = 1
--减少嫌疑值的数量
MapRandomEvent_KouChuXianYiZhi = 5
--达到多少嫌疑值后开始出现随机事件
MapRandomEvent_RandomXianYiZhi = 500
--达到多少嫌疑值后才随机事件编号
MapRandomEvent_RandomEventNum = 70
--随机事件最小编号
MapRandomEvent_RandomNumMin = 4
--随机事件最大编号
MapRandomEvent_RandomNumMax = 4
--随机事件系统提示信息间隔差
MapRandomEvent_RandomTiShiTime = 3
--随机事件1中，玩家与怪物的距离
MapRandomEvent_RandomEvent1_JuLi = 30
--随机事件2中，吃花的时间
MapRandomEvent_EatFlowerTime = 1
--随机事件3中，解除变身的时间
MapRandomEvent_BianShenTime = 1
--随机事件3中，计算数字的大小
MapRandomEvent_Event3NumMin = 10
MapRandomEvent_Event3NumMax = 10
--随机事件4中，一号怪物ID和数量
MapRandomEvent_Event4Monster1 = 271248
MapRandomEvent_Event4Monster1Min = 2
MapRandomEvent_Event4Monster1Max = 10
--随机事件4中，二号怪物ID和数量
MapRandomEvent_Event4Monster2 = 802020
MapRandomEvent_Event4Monster2Min = 5
MapRandomEvent_Event4Monster2Max = 10

--随机事件奖励最小编号
MapRandomEvent_JiangLiNumMin = 1
--随机事件奖励最大编号
MapRandomEvent_JiangLiNumMax = 5

--会触发随机事件的地图
MapRandomEvent_MapIDTable = {10,23,98,99,100,101,102,110,111,112,113,120}

--杀怪掉装备的地图
KillMonsterDropGoodsMapTab = {10,23,103,105,106,107,108,109,122,134,}
--杀怪掉装备地图分类
KillMonsterDropGoodsMapType = {
	[10] = 13,
	[23] = 13,
	[103] = 13,
	[122] = 12,
	[108] = 4,
	[109] = 4,
	[105] = 9,
	[106] = 9,
	[107] = 9,
	[134] = 4,
	--[128] = 9,
	--[129] = 9,
	--[130] = 9,
}

SearchTreasure_DropMap = {
	--二档
	[10] = {88008,88008,88008,88009,},
	[23] = {88008,88009,88009,88009,},
	--三档
	[98] = {88012,88012,88012,88013,},
	[99] = {88012,88013,88013,88013,},
	[100] = {88012,88012,88012,88013,},
	[101] = {88012,88013,88013,88013,},
	[102] = {88012,88013,},
	--四档
	[111] = {88016,88017,},
}

MapRandomEvent_EventTable = {
			[1] = {HSM='MapRandomEvent_RandomEvent1'},
			[2] = {HSM='MapRandomEvent_RandomEvent2'},
			[3] = {HSM='MapRandomEvent_RandomEvent3'},
			[4] = {HSM='MapRandomEvent_RandomEvent4'},
			[5] = {HSM='MapRandomEvent_RandomEvent5'},
			[6] = {HSM='MapRandomEvent_RandomEvent6'},
			[7] = {HSM='MapRandomEvent_RandomEvent7'},
			[8] = {HSM='MapRandomEvent_RandomEvent8'},
			[9] = {HSM='MapRandomEvent_RandomEvent9'},
			[10] = {HSM='MapRandomEvent_RandomEvent10'},
}

MapRandomEvent_EventJiangLiNumTable = {
			[1] = {HSM='MapRandomEvent_RandomEventJiangLi1'},
			[2] = {HSM='MapRandomEvent_RandomEventJiangLi2'},
			[3] = {HSM='MapRandomEvent_RandomEventJiangLi3'},
			[4] = {HSM='MapRandomEvent_RandomEventJiangLi4'},
			[5] = {HSM='MapRandomEvent_RandomEventJiangLi5'},
			[6] = {HSM='MapRandomEvent_RandomEventJiangLi6'},
}

if MapRandomEvent_MonsterTable == nil then
	MapRandomEvent_MonsterTable = {}
end

if MapRandomEvent_EventNpcTable == nil then
	MapRandomEvent_EventNpcTable = {}
end

if MapRandomEvent_NPCTable == nil then
	MapRandomEvent_NPCTable = {
				[98] = {
					SunFlowerID=11934,SunX1=1,SunX2=680,SunY1=1,SunY2=680,SunFlowerFID=0,SunFX=0,SunFY=0,
					ShouShouID=11935,ShouX1=1,ShouX2=680,ShouY1=1,ShouY2=680,ShouShouFID=0,ShouFX=0,ShouFY=0,
					},
				[99] = {
					SunFlowerID=11934,SunX1=1,SunX2=680,SunY1=1,SunY2=680,SunFlowerFID=0,SunFX=0,SunFY=0,
					ShouShouID=11935,ShouX1=1,ShouX2=680,ShouY1=1,ShouY2=680,ShouShouFID=0,ShouFX=0,ShouFY=0,
					},
				[100] = {
					SunFlowerID=11934,SunX1=1,SunX2=680,SunY1=1,SunY2=680,SunFlowerFID=0,SunFX=0,SunFY=0,
					ShouShouID=11935,ShouX1=1,ShouX2=680,ShouY1=1,ShouY2=680,ShouShouFID=0,ShouFX=0,ShouFY=0,
					},
				[101] = {
					SunFlowerID=11934,SunX1=1,SunX2=680,SunY1=1,SunY2=680,SunFlowerFID=0,SunFX=0,SunFY=0,
					ShouShouID=11935,ShouX1=1,ShouX2=680,ShouY1=1,ShouY2=680,ShouShouFID=0,ShouFX=0,ShouFY=0,
					},
				[102] = {
					SunFlowerID=11934,SunX1=1,SunX2=680,SunY1=1,SunY2=680,SunFlowerFID=0,SunFX=0,SunFY=0,
					ShouShouID=11935,ShouX1=1,ShouX2=680,ShouY1=1,ShouY2=680,ShouShouFID=0,ShouFX=0,ShouFY=0,
					},
				}
end
--[[
if not API_IsEctypeServer() and API_GetServerID() ~= 6 and API_GetServerID() ~= 7 then
	for j in MapRandomEvent_NPCTable do
		--刷太阳花
		local SunFlowerFID = MapRandomEvent_NPCTable[j].SunFlowerFID
		if SunFlowerFID == 0 then
			local SunFlowerID = MapRandomEvent_NPCTable[j].SunFlowerID
			local SunX1 = MapRandomEvent_NPCTable[j].SunX1
			local SunX2 = MapRandomEvent_NPCTable[j].SunX2
			local SunY1 = MapRandomEvent_NPCTable[j].SunY1
			local SunY2 = MapRandomEvent_NPCTable[j].SunY2
			local X1,Y1
			local Num = 0
			repeat
				Num = Num + 1
				X1 = math.random(SunX1,SunX2)
				Y1 = math.random(SunY1,SunY2)
			until not API_IsBlockTile(j,X1,Y1,0) or Num == 100
			if not API_IsBlockTile(j,X1,Y1,0) then
				local SunFID = API_CreateMonster(j,SunFlowerID,X1,Y1,4,0,-1)
				if SunFID > 0 then
					MapRandomEvent_NPCTable[j].SunFlowerFID = SunFID
					MapRandomEvent_NPCTable[j].SunFX = X1
					MapRandomEvent_NPCTable[j].SunFY = Y1
				end
			end
		end
		--刷兽兽
		local ShouShouFID = MapRandomEvent_NPCTable[j].ShouShouFID
		if ShouShouFID == 0 then
			local ShouShouID = MapRandomEvent_NPCTable[j].ShouShouID
			local ShouX1 = MapRandomEvent_NPCTable[j].ShouX1
			local ShouX2 = MapRandomEvent_NPCTable[j].ShouX2
			local ShouY1 = MapRandomEvent_NPCTable[j].ShouY1
			local ShouY2 = MapRandomEvent_NPCTable[j].ShouY2
			local X2,Y2
			local Num = 0
			repeat
				Num = Num + 1
				X2 = math.random(ShouX1,ShouX2)
				Y2 = math.random(ShouY1,ShouY2)
			until not API_IsBlockTile(j,X2,Y2,0) or Num == 100
			if not API_IsBlockTile(j,X2,Y2,0) then
				local ShouFID = API_CreateMonster(j,ShouShouID,X2,Y2,4,0,-1)
				if ShouFID > 0 then
					MapRandomEvent_NPCTable[j].ShouShouFID = ShouFID
					MapRandomEvent_NPCTable[j].ShouFX = X2
					MapRandomEvent_NPCTable[j].ShouFY = Y2
				end
			end
		end
	end
end
]]
MapRandomEvent_EventJiangLiTable = {
[1]={GX=	48	,SJB=	53	,HLZ=	1	},
[2]={GX=	64	,SJB=	53	,HLZ=	1	},
[3]={GX=	80	,SJB=	53	,HLZ=	1	},
[4]={GX=	96	,SJB=	53	,HLZ=	1	},
[5]={GX=	112	,SJB=	53	,HLZ=	1	},
[6]={GX=	128	,SJB=	53	,HLZ=	1	},
[7]={GX=	144	,SJB=	53	,HLZ=	1	},
[8]={GX=	160	,SJB=	53	,HLZ=	1	},
[9]={GX=	176	,SJB=	53	,HLZ=	1	},
[10]={GX=	192	,SJB=	53	,HLZ=	1	},
[11]={GX=	240	,SJB=	60	,HLZ=	3	},
[12]={GX=	272	,SJB=	60	,HLZ=	3	},
[13]={GX=	304	,SJB=	60	,HLZ=	3	},
[14]={GX=	336	,SJB=	60	,HLZ=	3	},
[15]={GX=	368	,SJB=	60	,HLZ=	3	},
[16]={GX=	400	,SJB=	60	,HLZ=	3	},
[17]={GX=	432	,SJB=	60	,HLZ=	3	},
[18]={GX=	464	,SJB=	60	,HLZ=	3	},
[19]={GX=	496	,SJB=	60	,HLZ=	3	},
[20]={GX=	528	,SJB=	60	,HLZ=	3	},
[21]={GX=	624	,SJB=	73	,HLZ=	3	},
[22]={GX=	672	,SJB=	73	,HLZ=	3	},
[23]={GX=	720	,SJB=	73	,HLZ=	3	},
[24]={GX=	768	,SJB=	73	,HLZ=	3	},
[25]={GX=	816	,SJB=	73	,HLZ=	3	},
[26]={GX=	1440	,SJB=	107	,HLZ=	5	},
[27]={GX=	1536	,SJB=	107	,HLZ=	5	},
[28]={GX=	1632	,SJB=	107	,HLZ=	5	},
[29]={GX=	1728	,SJB=	107	,HLZ=	5	},
[30]={GX=	1824	,SJB=	107	,HLZ=	5	},
[31]={GX=	1920	,SJB=	107	,HLZ=	5	},
[32]={GX=	2016	,SJB=	107	,HLZ=	5	},
[33]={GX=	2112	,SJB=	107	,HLZ=	5	},
[34]={GX=	2208	,SJB=	107	,HLZ=	5	},
[35]={GX=	2304	,SJB=	107	,HLZ=	5	},
[36]={GX=	2592	,SJB=	165	,HLZ=	5	},
[37]={GX=	2712	,SJB=	165	,HLZ=	5	},
[38]={GX=	2832	,SJB=	165	,HLZ=	5	},
[39]={GX=	2952	,SJB=	165	,HLZ=	5	},
[40]={GX=	3072	,SJB=	165	,HLZ=	5	},
[41]={GX=	3432	,SJB=	230	,HLZ=	7	},
[42]={GX=	3576	,SJB=	230	,HLZ=	7	},
[43]={GX=	3720	,SJB=	230	,HLZ=	7	},
[44]={GX=	3864	,SJB=	230	,HLZ=	7	},
[45]={GX=	4008	,SJB=	230	,HLZ=	7	},
[46]={GX=	4152	,SJB=	230	,HLZ=	7	},
[47]={GX=	4296	,SJB=	230	,HLZ=	7	},
[48]={GX=	4440	,SJB=	230	,HLZ=	7	},
[49]={GX=	4584	,SJB=	230	,HLZ=	7	},
[50]={GX=	4728	,SJB=	230	,HLZ=	7	},
[51]={GX=	4728	,SJB=	301	,HLZ=	7	},
[52]={GX=	4728	,SJB=	301	,HLZ=	7	},
[53]={GX=	4728	,SJB=	301	,HLZ=	7	},
[54]={GX=	4728	,SJB=	301	,HLZ=	7	},
[55]={GX=	4728	,SJB=	301	,HLZ=	7	},
[56]={GX=	5068	,SJB=	379	,HLZ=	9	},
[57]={GX=	5222	,SJB=	379	,HLZ=	9	},
[58]={GX=	5376	,SJB=	379	,HLZ=	9	},
[59]={GX=	5529	,SJB=	379	,HLZ=	9	},
[60]={GX=	5683	,SJB=	379	,HLZ=	9	},
[61]={GX=	5836	,SJB=	379	,HLZ=	9	},
[62]={GX=	5990	,SJB=	379	,HLZ=	9	},
[63]={GX=	6144	,SJB=	379	,HLZ=	9	},
[64]={GX=	6297	,SJB=	379	,HLZ=	9	},
[65]={GX=	6451	,SJB=	379	,HLZ=	9	},
[66]={GX=	6912	,SJB=	465	,HLZ=	9	},
[67]={GX=	7084	,SJB=	465	,HLZ=	9	},
[68]={GX=	7257	,SJB=	465	,HLZ=	9	},
[69]={GX=	7430	,SJB=	465	,HLZ=	9	},
[70]={GX=	7603	,SJB=	465	,HLZ=	9	},
[71]={GX=	8121	,SJB=	559	,HLZ=	11	},
[72]={GX=	8313	,SJB=	559	,HLZ=	11	},
[73]={GX=	8505	,SJB=	559	,HLZ=	11	},
[74]={GX=	8697	,SJB=	559	,HLZ=	11	},
[75]={GX=	8889	,SJB=	559	,HLZ=	11	},
[76]={GX=	9081	,SJB=	559	,HLZ=	11	},
[77]={GX=	9273	,SJB=	559	,HLZ=	11	},
[78]={GX=	9465	,SJB=	559	,HLZ=	11	},
[79]={GX=	9657	,SJB=	559	,HLZ=	11	},
[80]={GX=	9849	,SJB=	559	,HLZ=	11	},
[81]={GX=	10425	,SJB=	667	,HLZ=	11	},
[82]={GX=	10636	,SJB=	667	,HLZ=	11	},
[83]={GX=	10848	,SJB=	667	,HLZ=	11	},
[84]={GX=	11059	,SJB=	667	,HLZ=	11	},
[85]={GX=	11270	,SJB=	667	,HLZ=	11	},
}
