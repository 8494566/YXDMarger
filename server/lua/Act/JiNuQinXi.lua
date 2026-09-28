----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\JiNuQinXi.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	万钰林
--日  期:	2009-7-15
--版  本:	1.0
--描  述:	机奴奇袭活动
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：万钰林
--日期：2009-7-15
--功能：创建
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
--修改人：黄蕾
--时  间：20120717
--真门一个"真门"奖励5000金币，"真门"玩家自由拾取 金币兑换券 80697，使用后获得100金币
--------------------------------------------------------------------------------------------------------------------------

JNQX_ZhenDoor = 12145
JNQX_JiaDoor = 12146

--掉落表名字
if JiNuQinXi_GoodsTable == nil then
	JiNuQinXi_GoodsTable = {
		[1] = {
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80696,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=80498,GoodsNum=5,GaiLv=500000,PinZhi=0},
			{GoodsID=4002,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=4102,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=6602,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=6902,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=8102,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=4302,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=4202,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=4402,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=4502,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=2002,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=3002,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=3902,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=5002,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=5102,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=6702,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=7002,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=8202,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=5302,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=5202,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=5402,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=5502,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=1502,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=6002,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=6102,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=6802,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=8002,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=8302,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=6302,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=6202,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=6402,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=6502,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=1002,GoodsNum=1,GaiLv=31250,PinZhi=3},
			{GoodsID=782,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=782,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=782,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=782,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=782,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=782,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80181,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80181,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=40002,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40012,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40022,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40032,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40042,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40052,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40062,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40072,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40082,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40092,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40102,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40112,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40122,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40132,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40202,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40218,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40234,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40250,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40266,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40003,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40013,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40023,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40033,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40043,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40053,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40063,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40073,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40083,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40093,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40103,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40113,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40123,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40133,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40204,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40220,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40236,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40252,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=40268,GoodsNum=1,GaiLv=30000,PinZhi=0},
			{GoodsID=796,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=31020,GoodsNum=1,GaiLv=1000,PinZhi=0},
			{GoodsID=31021,GoodsNum=1,GaiLv=1000,PinZhi=0},
			{GoodsID=80621,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			--{GoodsID=88065,GoodsNum=1,GaiLv=100000,PinZhi=0},
			--{GoodsID=10940,GoodsNum=1,GaiLv=10000,PinZhi=0},
			--{GoodsID=10941,GoodsNum=1,GaiLv=10000,PinZhi=0},
			--{GoodsID=10902,GoodsNum=1,GaiLv=10000,PinZhi=0},
			--{GoodsID=10903,GoodsNum=1,GaiLv=10000,PinZhi=0},
			{GoodsID=10992,GoodsNum=1,GaiLv=10000,PinZhi=0},
			{GoodsID=10993,GoodsNum=1,GaiLv=10000,PinZhi=0},
			{GoodsID=10996,GoodsNum=1,GaiLv=10000,PinZhi=0},
			{GoodsID=10997,GoodsNum=1,GaiLv=10000,PinZhi=0},
			{GoodsID=9507,GoodsNum=1,GaiLv=10000,PinZhi=0},
			{GoodsID=31101,GoodsNum=1,GaiLv=500000,PinZhi=0},
			{GoodsID=785,GoodsNum=1,GaiLv=200000,PinZhi=0},
		},
		[2] = {
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80696,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80498,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=88101,GoodsNum=1,GaiLv=750,PinZhi=0},
			{GoodsID=88102,GoodsNum=1,GaiLv=600,PinZhi=0},
			{GoodsID=88103,GoodsNum=1,GaiLv=450,PinZhi=0},
			{GoodsID=88104,GoodsNum=1,GaiLv=300,PinZhi=0},
			{GoodsID=88105,GoodsNum=1,GaiLv=750,PinZhi=0},
			{GoodsID=88106,GoodsNum=1,GaiLv=600,PinZhi=0},
			{GoodsID=88107,GoodsNum=1,GaiLv=450,PinZhi=0},
			{GoodsID=88108,GoodsNum=1,GaiLv=300,PinZhi=0},
			{GoodsID=88109,GoodsNum=1,GaiLv=750,PinZhi=0},
			{GoodsID=88110,GoodsNum=1,GaiLv=600,PinZhi=0},
			{GoodsID=88111,GoodsNum=1,GaiLv=450,PinZhi=0},
			{GoodsID=88112,GoodsNum=1,GaiLv=300,PinZhi=0},
			{GoodsID=88113,GoodsNum=1,GaiLv=750,PinZhi=0},
			{GoodsID=88114,GoodsNum=1,GaiLv=600,PinZhi=0},
			{GoodsID=88115,GoodsNum=1,GaiLv=450,PinZhi=0},
			{GoodsID=88116,GoodsNum=1,GaiLv=300,PinZhi=0},
			{GoodsID=88117,GoodsNum=1,GaiLv=750,PinZhi=0},
			{GoodsID=88118,GoodsNum=1,GaiLv=600,PinZhi=0},
			{GoodsID=88119,GoodsNum=1,GaiLv=450,PinZhi=0},
			{GoodsID=88120,GoodsNum=1,GaiLv=300,PinZhi=0},
			{GoodsID=88121,GoodsNum=1,GaiLv=750,PinZhi=0},
			{GoodsID=88122,GoodsNum=1,GaiLv=600,PinZhi=0},
			{GoodsID=88123,GoodsNum=1,GaiLv=450,PinZhi=0},
			{GoodsID=88124,GoodsNum=1,GaiLv=300,PinZhi=0},
			{GoodsID=80196,GoodsNum=1,GaiLv=1000000,PinZhi=0},
			{GoodsID=80196,GoodsNum=1,GaiLv=800000,PinZhi=0},
			{GoodsID=80196,GoodsNum=1,GaiLv=600000,PinZhi=0},
			{GoodsID=80382,GoodsNum=1,GaiLv=600000,PinZhi=0},
		},
	}
end

--物品上限表
if JiNuQinXi_GoodsMaxNumTable == nil then
	JiNuQinXi_GoodsMaxNumTable = {
		[31020] = {GoodsNum=1,GaiLv=1000,Num=0,MaxNum=1},
		[31021] = {GoodsNum=1,GaiLv=1000,Num=0,MaxNum=1},
		[80621] = {GoodsNum=1,GaiLv=1000000,Num=0,MaxNum=100},
		--[88065] = {GoodsNum=1,GaiLv=100000,Num=0,MaxNum=10},
		--[10940] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
		--[10941] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
		--[10902] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
		--[10903] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
		[9507] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
		[31101] = {GoodsNum=1,GaiLv=500000,Num=0,MaxNum=50},
		[785] = {GoodsNum=1,GaiLv=200000,Num=0,MaxNum=20},
		[10992] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
		[10993] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
		[10996] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
		[10997] = {GoodsNum=1,GaiLv=10000,Num=0,MaxNum=1},
	}
end

--门的表名字
if JiNuQinXi_DoorTable == nil then
	JiNuQinXi_DoorTable = {}
end

--临时物品表
if JiNuQinXi_LinShiTable == nil then
	JiNuQinXi_LinShiTable = {}
end

--活动时间表
JiNuQinXi_ActTime = {
	--[1] = {RedayTime=15,StartTime=16,EndTime=17},
	[1] = {RedayTime=20,StartTime=21,EndTime=22},
}

if JiNuQinXi_CreateDoorTriggerID ~= nil then
	API_DestroyTriggerG(JiNuQinXi_CreateDoorTriggerID)
	JiNuQinXi_CreateDoorTriggerID = nil
end

if JiNuQinXi_ActFunc ~= nil then
	API_DestroyTriggerG(JiNuQinXi_ActFunc)
	JiNuQinXi_ActFunc = nil
end

JNQX_Start = 0
JiNuQinXi_CreateDoorTriggerID = nil

if not API_IsEctypeServer() or API_IsBranchServer() then
	if not API_IsBattleGameServer() then
		JiNuQinXi_ActFunc = JiNuQinXi_ActFunc or API_CreateTimerTriggerG(0,0,60,-1,'JiNuQinXi_ActTimeFunc')
	end
	if API_GetServerID() == 1 then
		HeroHallAddExpFunc = HeroHallAddExpFunc or API_CreateTimerTriggerG(91,0,600,-1,'HeroHallAddExpTimeFunc')
		WYL_SDKillBoss_ActTimeTG = WYL_SDKillBoss_ActTimeTG or API_CreateTimerTriggerG(91,0,60,-1,'WYL_SDKillBoss_ActFunc')
	end
end

JiNuQinXi_MapTable = {
	[98] = {ServerID=6,ZhenNum=3,JiaNum=45,x1=177,y1=181,x2=578,y2=559,x3=326,y3=319,x4=442,y4=441},
	[99] = {ServerID=7,ZhenNum=3,JiaNum=45,x1=180,y1=110,x2=570,y2=612,x3=348,y3=343,x4=399,y4=397},
	[101] = {ServerID=8,ZhenNum=6,JiaNum=85,x1=282,y1=211,x2=620,y2=590,x3=423,y3=437,x4=443,y4=457},
}

function JiNuQinXi_ActTimeFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	
--~ 	--获取现在是活动开始时间的第几天
	local Time = os.time() 
--~ 	local NowTime = os.date("*t", os.time()) 
--~ 	NowTime.year = MidAutumn_StartTime.Year 
--~ 	NowTime.month = MidAutumn_StartTime.Month 
--~ 	NowTime.day = MidAutumn_StartTime.Day 
--~ 	NowTime.hour = 0 
--~ 	NowTime.min = 0 
--~ 	NowTime.sec = 0 
--~ 	local StartTime = os.time(NowTime) 
--~ 	local NowDay = math.floor((Time - StartTime)/86400) + 1 
--~ 	if NowDay > 2 and NowDay < 9 then
--~ 		return
--~ 	end
	
--~ 	if Week == 1 or Week == 3 or Week == 5 or Week == 7 then
		local RedayTime,StartTime,EndTime = 0,0,0
		for i = 1,table.getn(JiNuQinXi_ActTime) do
			local RT = JiNuQinXi_ActTime[i].RedayTime
			local ST = JiNuQinXi_ActTime[i].StartTime
			local ET = JiNuQinXi_ActTime[i].EndTime
			if Hour >= RT and Hour < ET then
				RedayTime,StartTime,EndTime = RT,ST,ET
			end
		end
		if RedayTime ~= 0 and StartTime ~= 0 and EndTime ~= 0 then
			--开始刷门
			if Hour == (StartTime - 1) and Minute >= 30 then
				JNQX_Start = 0
				if math.mod(Minute,10) == 0 then
					API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 17, '机奴奇袭活动于'..StartTime..'：00--'..EndTime..'：00在落日农庄、娜纱湿地和月暮草场举行，欢迎各位英雄踊跃参与！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 8, '机奴奇袭活动于'..StartTime..'：00--'..EndTime..'：00在落日农庄、娜纱湿地和月暮草场举行，欢迎各位英雄踊跃参与！')
					--API_ActorBroadcastMsgEx(-1,-1,0,17,'机奴奇袭活动于'..StartTime..'：00--'..EndTime..'：00在落日农庄、娜纱湿地和月暮草场举行，欢迎各位英雄踊跃参与！')
				end
			end
			if Hour >= StartTime and Hour < EndTime then
				if JNQX_Start == nil or JNQX_Start < 1 then
					JNQX_Start = 1
					JiNuQinXi_CreateDoorFunc()
					API_CreateTimerTriggerG(0,0,600,5,'JiNuQinXi_CreateDoorFunc')
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17, '机奴奇袭活动现在开始！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8, '机奴奇袭活动现在开始！')
					--API_ActorBroadcastMsgEx(MapID,-1,0,17,'机奴奇袭活动现在开始！')
				end
				if math.mod(Minute,10) == 0 then
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17, '机奴奇袭活动正在落日农庄、娜纱湿地和月暮草场举行！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8, '机奴奇袭活动正在落日农庄、娜纱湿地和月暮草场举行！')
				end
			end
			if Hour == (EndTime - 1) and Minute >= 45 then
				if math.mod(Minute,5) == 0 then
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17, '请注意，机奴奇袭活动将在'..EndTime..'点结束！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8, '请注意，机奴奇袭活动将在'..EndTime..'点结束！')
					--API_ActorBroadcastMsgEx(MapID,-1,0,17,'请注意，机奴奇袭活动将在'..EndTime..'点结束！')
				end
			end
			if Hour == (EndTime - 1) and Minute == 59 then
				if JNQX_Start == nil or JNQX_Start < 2 then
					JNQX_Start = 2
					local EndTime2 = EndTime + 1
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 17, '机奴奇袭活动已经结束！时空之门将在'..EndTime2..'点消失！')
					API_ActorBroadcastMsgLevelEx(-1, -1, 26, 0, 8, '机奴奇袭活动已经结束！时空之门将在'..EndTime2..'点消失！')
					--API_ActorBroadcastMsgEx(MapID,-1,0,17,'机奴奇袭活动已经结束！时空之门将在'..EndTime2..'点消失！')
				end
			end
		end
		if (Hour == 18 and Minute == 0) or (Hour == 23 and Minute == 0) then
			for j in JiNuQinXi_DoorTable do
				local FastID = JiNuQinXi_DoorTable[j]
				if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
					API_DestroyMonster(FastID)
					JiNuQinXi_DoorTable[j] = nil
				end
			end
		end
		if Hour == 23 and Minute == 30 then
			for j in JiNuQinXi_GoodsMaxNumTable do
				JiNuQinXi_GoodsMaxNumTable[j].Num = 0
			end
			for j in LRY_LuckStar_MaxGoodsNumTable do
				LRY_LuckStar_MaxGoodsNumTable[j].Num = 0
			end
			for j in WYL_SevenDragonBalls_MaxGoodsNumTable do
				WYL_SevenDragonBalls_MaxGoodsNumTable[j].Num = 0
			end
			for j in WYL_HappyOnline_MaxGoodsNumTable do
				WYL_HappyOnline_MaxGoodsNumTable[j].Num = 0
			end
			for j in SuperLuckStar_MaxNumTab do
				SuperLuckStar_MaxNumTab[j].Num = 0
			end
			JiNuQinXi_HeroBookFour = 0
			JiNuQinXi_HeroBookOne = 0
		end
--~ 	end
	if API_GetServerID() == 1 and Hour == 23 and Minute == 45 then
		local KeyTab = {2,3,4,5,6,7,10,12,13,14,26,27,28,31,32,33,34,37,39,41,43,45,46,47,48,49,50,51,52,53,54,55,58,59,61,63,65,74,78,80,81,82,83,89,90,92,93,95,97,99,101,103,105,112,114,116,}
		for j in KeyTab do
			local Key = KeyTab[j]
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, Key, 0)
		end
		API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 75, math.random(45,60))
	end
	if API_GetServerID() == 1 and Hour == 1 and Minute == 0 then
		local KeyTab = {66,68,70,72,}
		for j in KeyTab do
			local Key = KeyTab[j]
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, Key, 0)
		end
	end
	if API_GetServerID() == 1 and Hour == 0 and Minute <= 1 then
		API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 11, 0)
		--龙珠
		local KeyTab = {1,2,3,4,5,6,7,15,17,19,21,}
		for j in KeyTab do
			local Key = KeyTab[j]
			API_VarDataSetNumber_Ex_Sync(1, 0, -1999, 1, Key, 0)
		end
		--神秘之地每日第三类奖励随机上限
--~ 		local ShangXian = math.random(3,5)
--~ 		if Week == 6 or Week == 7 then
--~ 			ShangXian = math.random(2,5)
--~ 		else
--~ 			ShangXian = math.random(2,3)
--~ 		end
--~ 		API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 56, ShangXian)
		if Week == 1 then
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 8, 0) --神秘娃娃饰品掉落清0
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 9, 0) --天使宝宝卡掉落清0
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 56, 3) --设置每周天使宝宝卡掉落上限为3
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 86, 0) --恶魔宝宝卡掉落清0
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 88, 3) --设置每周恶魔宝宝卡掉落上限为3
		end
		if  Week == 4 then
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 8, 0) --神秘娃娃饰品掉落清0
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 9, 0) --天使宝宝卡掉落清0
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 56, 3) --设置每周天使宝宝卡掉落上限为3
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 86, 0) --恶魔宝宝卡掉落清0
			API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 88, 3) --设置每周恶魔宝宝卡掉落上限为3
		end
	end
	--清除夏日海滩表信息
	if Hour == 1 and Minute == 0 then
		SummerBeachTickets_Player = {}
	end
	if API_GetServerID() == 1 and (Hour >= 12 and Hour < 14 and math.mod(Minute,10) == 0) then
		if Time >= 1321934400 and Time < 1322539200 then
			API_ActorBDCMsg(-1, 0, -1, 26, 85, 0, 17, '现在截获敌对阵营玩家邮车可获得双倍押金奖励。')
		end
	end
end

function JiNuQinXi_CreateDoorFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
--~ 	if Week == 1 or Week == 3 or Week == 5 or Week == 7 then
		local RedayTime,StartTime,EndTime = 0,0,0
		for i = 1,table.getn(JiNuQinXi_ActTime) do
			local RT = JiNuQinXi_ActTime[i].RedayTime
			local ST = JiNuQinXi_ActTime[i].StartTime
			local ET = JiNuQinXi_ActTime[i].EndTime
			if Hour >= RT and Hour < ET then
				RedayTime,StartTime,EndTime = RT,ST,ET
			end
		end
		if RedayTime ~= 0 and StartTime ~= 0 and EndTime ~= 0 then
			if Hour >= StartTime and Hour < EndTime then
				local ZhenDoor = JNQX_ZhenDoor
				local JiaDoor = JNQX_JiaDoor
				for j in JiNuQinXi_MapTable do
					local ServerID = JiNuQinXi_MapTable[j].ServerID
					if API_GetServerID() == ServerID then
						local MapID = API_GetRightMapID(j)
						local ZhenNum = JiNuQinXi_MapTable[j].ZhenNum
						local JiaNum = JiNuQinXi_MapTable[j].JiaNum
						local x1 = JiNuQinXi_MapTable[j].x1
						local y1 = JiNuQinXi_MapTable[j].y1
						local x2 = JiNuQinXi_MapTable[j].x2
						local y2 = JiNuQinXi_MapTable[j].y2
						local x3 = JiNuQinXi_MapTable[j].x3
						local y3 = JiNuQinXi_MapTable[j].y3
						local x4 = JiNuQinXi_MapTable[j].x4
						local y4 = JiNuQinXi_MapTable[j].y4
						
						local ZNum = ZhenNum + JiaNum
						for i = 1,ZNum do
							local MonID = JiaDoor
							if i <= ZhenNum then 
								MonID = ZhenDoor
							end
							if JiNuQinXi_DoorTable[i] == nil then
								local x,y
								local Num = 0
								repeat
									Num = Num + 1
									x = math.random(x1,x2)
									y = math.random(y1,y2)
								until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
								if not API_IsBlockTile(MapID,x,y,0) then
									local FastID = API_CreateMonster(MapID,MonID,x,y,5,0,-1)
									API_SetMonsterName(FastID, '时空之门', 1)
									JiNuQinXi_DoorTable[i] = FastID
								end
							else
								local FastID = JiNuQinXi_DoorTable[i]
								if FastID ~= nil and API_GetMonsterID(FastID) <= 0 then
									local x,y
									local Num = 0
									repeat
										Num = Num + 1
										x = math.random(x1,x2)
										y = math.random(y1,y2)
									until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
									if not API_IsBlockTile(MapID,x,y,0) then
										FastID = API_CreateMonster(MapID,MonID,x,y,5,0,-1)
										API_SetMonsterName(FastID, '时空之门', 1)
										JiNuQinXi_DoorTable[i] = FastID
									end
								end
							end
						end
						
--~ 						for i = 1,ZhenNum do
--~ 							local x,y
--~ 							local Num = 0
--~ 							repeat
--~ 								Num = Num + 1
--~ 								x = math.random(x1,x2)
--~ 								y = math.random(y1,y2)
--~ 							until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
--~ 							if not API_IsBlockTile(MapID,x,y,0) then
--~ 								local FastID = API_CreateMonster(MapID,ZhenDoor,x,y,5,0,-1)
--~ 								API_SetMonsterName(FastID, '时空之门', 1)
--~ 								table.insert(JiNuQinXi_DoorTable,FastID)
--~ 							end
--~ 						end
--~ 						for i = 1,JiaNum do
--~ 							local x,y
--~ 							local Num = 0
--~ 							repeat
--~ 								Num = Num + 1
--~ 								x = math.random(x1,x2)
--~ 								y = math.random(y1,y2)
--~ 							until not API_IsBlockTile(MapID,x,y,0) and not ((x > x3 and x < x4) and (y > y3 and y < y4)) or Num == 100
--~ 							if not API_IsBlockTile(MapID,x,y,0) then
--~ 								local FastID = API_CreateMonsterEx(MapID,JiaDoor,x,y,5,0,-1,1)
--~ 								API_SetMonsterName(FastID, '时空之门', 1)
--~ 								table.insert(JiNuQinXi_DoorTable,FastID)
--~ 							end
--~ 						end
						API_ActorBroadcastMsgEx(MapID,-1,0,17,'时空之门出现了！')
						API_ActorBroadcastMsgEx(MapID,-1,0,8,'时空之门出现了！')
					end
				end
			end
		end
--~ 	end
end

--API_AddLUAReqFunc(JiNuQinXi_DoorMove)
--点击门的操作，判断是真的还是假的
function JiNuQinXi_DoorMove(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local XuanZe = API_RequestGetNumber(1)
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local Time = API_VarDataGetNumber(ActorID,0,19033)
	if API_GetMonsterID(NPCFastID) <= 0 then
		API_ResponseEnd()
		API_ResponseClear()
		return
	end
	if Time > 0 then
		API_ActorSendMsg(ActorID,10,'你还需要'..Time..'秒后才能继续使用时空之门')
		API_ResponseEnd()
		API_ResponseClear()
		return
	end
	--传送玩家进去
	--创建0秒触发器刷新BOSS，里面的出口
	--将真假BOSS写入地图临时信息
	if XuanZe == 1 then
		local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID) 
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 and API_GetTeamLeader(TeamID) == ActorID then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
--~ 				if not API_ActorIsOnline(TeamActorID) then
--~ 					API_ResponseWrite('<name></name>')
--~ 					API_ResponseWrite('<br><text>有队友不在线或不在同一张地图，无法进入时空之门！</text><br>')
--~ 					API_ResponseWrite('<br><a>确定</a><br>')
--~ 					API_ResponseFlush(ActorID)
--~ 					return
--~ 				end
				--if API_ActorIsOnline(TeamActorID) and TeamActorID ~= ActorID then
				if API_ActorIsOnline(TeamActorID) then
--~ 					local PlayX2,PlayY2 = PublicFun_GetActorPosXY(TeamActorID) 
--~ 					local JuLi = PublicFun_AccountDistance(PlayX,PlayY,PlayX2,PlayY2)
--~ 					if JuLi > 15 then
--~ 						API_ResponseWrite('<name></name>')
--~ 						API_ResponseWrite('<br><text>'..API_GetActorName(TeamActorID)..'距离太远或不在同一张地图，无法进入时空之门！</text><br>')
--~ 						API_ResponseWrite('<br><a>确定</a><br>')
--~ 						API_ResponseFlush(ActorID)
--~ 						return
--~ 					end
					if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>快递中，无法进入时空之门！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return 
					end
					if API_ActorFindStatus(TeamActorID,519) then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>摆摊中，无法进入时空之门！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return 
					end
					if API_ActorIsDying(TeamActorID) then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>死亡，无法进入时空之门！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return 
					end
					if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>在公交车上无法进入时空之门！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return
					end
				end
			end
			local PlayMoney = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD)
			if PlayMoney < 100 then
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>你身上的金币不足100，无法使用时空之门！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				return
			end
			API_ActorAddMoney(ActorID, -100, 0, '机奴奇袭扣钱')
			API_ActorSendMsg(ActorID,10,'使用时空之门扣除100金币')
			local MapID = API_GetActorMapID(ActorID)
			local MapConfigID = API_GetMapConfigID(MapID)
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type = 1
			local ObjectMapID = API_CreateEctype(1949,0)
			if NPCID == JNQX_ZhenDoor then
				API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.Peerage,1)
				if MapConfigID == 98 then
					Type = 3
				elseif MapConfigID == 99 then
					Type = 1
				else
					Type = 5
				end
				if GLOBAL_FengXiangBiao_DateList[33][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[33][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[33][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[33][Type][LaiYuan] + 1
				end
			else
				API_SetMapVarData(ObjectMapID,GLOBAL_MAPVARDATA.Peerage,2)
				if MapConfigID == 98 then
					Type = 4
				elseif MapConfigID == 99 then
					Type = 2
				else
					Type = 6
				end
				if GLOBAL_FengXiangBiao_DateList[33][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[33][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[33][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[33][Type][LaiYuan] + 1
				end
			end
			API_CreateMonster(ObjectMapID,11607,62,40,3,0,-1)
			JiNuQinXi_Initialization(ObjectMapID)
			API_CreateTimerTriggerG(ObjectMapID,ActorID,0,1,'JiNuQinXi_PlayGotoMap')
			API_DestroyMonster(NPCFastID)
			--JiNuQinXi_DoorTable[NPCFastID] = nil
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>时空之门必须拥有队长权限才可以打开，并且因为怪物的凶狠，需要你的队伍人数至少多于两人才能进入。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
		end
	else
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>机奴侵袭的部队，就隐藏在时空之门的后面，前往消灭它们将获得丰厚的奖励。</text><br>')
		API_ResponseWrite('<br><text>时空之门必须拥有队长权限才可以打开，并且因为怪物的凶狠，需要你的队伍人数至少多于两人才能进入。</text><br>')
		API_ResponseWrite('<br><text color="255,0,0">为了维持时空之门的正常运转，每人需要消耗100金币才能进入。</text><br>')
		API_ResponseWrite('<br><br><a href="JiNuQinXi_DoorMove?1=1">我要进入</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	end
	API_ResponseFlush(ActorID)
end

JiNuQinXi_BianShenBuff = {482002,482004,482005,482006,482007,482011,482016}

function JiNuQinXi_Initialization(ObjectMapID)
	--创建BOSS，出口
	local FastID = API_CreateMonster(ObjectMapID,726225,60,69,5,2358,-1)
	API_SetMonsterName(FastID, '机奴幻象领主', 1)
	--加变身
	local StatusID = JiNuQinXi_BianShenBuff[math.random(table.getn(JiNuQinXi_BianShenBuff))]
	API_MonsterAddStatus(FastID, StatusID, -1)
	--加状态
	API_MonsterAddMaxHP(FastID, 125385)
	API_MonsterAddHP(FastID, 125385)
	API_MonsterAddStatus(FastID, 543003, -1)
	API_CreateDieTriggerG(ObjectMapID,0,0,FastID,'JiNuQinXi_BossDieFunc')
end

function JiNuQinXi_PlayGotoMap(ObjectMapID,ActorID)
	--判断是否有队伍，是的话一起传进去
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorIsOnline(ActorID) then
		local MapID = API_GetActorMapID(ActorID)
		local MapConfigID = API_GetMapConfigID(MapID)
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 1
		--判断组队
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) and API_GetActorMapID(TeamActorID) == MapID then
					API_ActorGoToMap(TeamActorID,ObjectMapID,62,45)
					API_VarDataSetNumber(TeamActorID,0,19033,10)
					API_CreateTimerTrigger(TeamActorID,1,10,-1,'JiNuQinXie_DoorLengQueFunc')
				end
			end
			if MapConfigID == 98 then
				Type = 8
			elseif MapConfigID == 99 then
				Type = 7
			else
				Type = 9
			end
			if GLOBAL_FengXiangBiao_DateList[33][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[33][Type][LaiYuan] = TeamSize
			else
				GLOBAL_FengXiangBiao_DateList[33][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[33][Type][LaiYuan] + TeamSize
			end
		end
	end
end

function JiNuQinXie_DoorLengQueFunc(ActorID,b)
	if API_ActorIsOnline(ActorID) then 
		local Time = API_VarDataGetNumber(ActorID,0,19033)
		Time = Time -1
		API_VarDataSetNumber(ActorID,0,19033,Time)
	end
end

JiNuQinXi_HeroBookFour = 0
JiNuQinXi_HeroBookOne = 0
JiNuQinXi_HeroBookCD = 0
--BOSS死亡回调
function JiNuQinXi_BossDieFunc(MapID,a,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	if MapID <= 0 then
		return
	end
	if not API_MapIsValid(MapID) then
		return
	end
	local Time = os.time() 
	local ZhenJia = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
	local x1,y1,x2,y2 = 54,56,69,71
	if ZhenJia == 1 then
		local GDNum = 0
		for j in JiNuQinXi_GoodsTable[ZhenJia] do
			local RD = math.random(1000000)
			local GoodsID = JiNuQinXi_GoodsTable[ZhenJia][j].GoodsID
			local GoodsNum = JiNuQinXi_GoodsTable[ZhenJia][j].GoodsNum
			local GaiLv = JiNuQinXi_GoodsTable[ZhenJia][j].GaiLv
			local PinZhi = JiNuQinXi_GoodsTable[ZhenJia][j].PinZhi
			if RD <= GaiLv then
				local x,y
				local Num = 0
				repeat
					Num = Num + 1
					x = math.random(x1,x2)
					y = math.random(y1,y2)
				until not API_IsBlockTile(MapID,x,y,0) or Num == 100
				if not API_IsBlockTile(MapID,x,y,0) then
					GDNum = GDNum + 1
					if PinZhi > 0 then
						API_CreateDropGoodsEx(MapID,x,y,GoodsID,GoodsNum,0,'机奴奇袭掉特殊物品',4,0,600,0,PinZhi)
					else
						API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'机奴奇袭掉特殊物品',4,0,600,0)
					end
					
				end
			end
			
		end
		-------------------------------------------------------------------------------------------------------------------------
		--真门黄蕾增加特殊奖励
		local SofieAddGoodsID = 89186
		local nSofieRD =math.random(100)
		if nSofieRD <= 100 then
			API_CreateDropGoods(MapID, 60, 69, SofieAddGoodsID, 1, 0, '机奴幸运掉落',4, 0, 360, 120);	
		end
		--真门金币兑换券增加80697,50个。80697
		local SofieAddMoneyID = 80410
		local nSofieMoneyRD =math.random(100)
		if nSofieMoneyRD <= 100 then
			for i = 1,50 do
				local x,y
				local Num2 = 0
				repeat
					Num2 = Num2 + 1
					x = math.random(x1,x2)
					y = math.random(y1,y2)
				until not API_IsBlockTile(MapID,x,y,0) or Num2 == 50
				if not API_IsBlockTile(MapID,x,y,0) then
					API_CreateDropGoods(MapID,x,y,80410,100,0,'机奴奇袭掉金币',4,0,360,120)
					--API_CreateDropGoods(2,242,169,80410,100,0,'机奴奇袭掉金币',4,0,360,120)
				end
			end
		end
		-------------------------------------------------------------------------------------------------------------------------
		JiNuQinXi_LinShiTable[KillerID] = {}
		for j in JiNuQinXi_GoodsMaxNumTable do
			local RD = math.random(1000000)
			local GoodsID = j
			local GoodsNum = JiNuQinXi_GoodsMaxNumTable[j].GoodsNum
			local GaiLv = JiNuQinXi_GoodsMaxNumTable[j].GaiLv
			local Num = JiNuQinXi_GoodsMaxNumTable[j].Num
			local MaxNum = JiNuQinXi_GoodsMaxNumTable[j].MaxNum
			if Num < MaxNum then
				if RD <= GaiLv then
					local x,y
					local Num2 = 0
					repeat
						Num2 = Num2 + 1
						x = math.random(x1,x2)
						y = math.random(y1,y2)
					until not API_IsBlockTile(MapID,x,y,0) or Num2 == 100
					if not API_IsBlockTile(MapID,x,y,0) then
						API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'机奴奇袭掉特殊物品',4,0,600,0)
						Num = Num + GoodsNum
						JiNuQinXi_GoodsMaxNumTable[j].Num = Num
						table.insert(JiNuQinXi_LinShiTable[KillerID],GoodsID)
					end
				end
			end
		end
		local HeroBook1 = {88591,88592,88593,88595,88596,88597,88599,88600,88601,}
		local HeroBook2 = {88594,88598,88602,}
		local BookRD = math.random(100)
		local BookID = 0
		if Time > JiNuQinXi_HeroBookCD then
			JiNuQinXi_HeroBookCD = Time + 15 * 60
			if BookRD == 1 and JiNuQinXi_HeroBookFour == 0 then
				BookID = HeroBook2[math.random(table.getn(HeroBook2))]
				JiNuQinXi_HeroBookFour = 1
			elseif BookRD >= 2 and BookRD <= 6 and JiNuQinXi_HeroBookOne < 2 then
				BookID = HeroBook1[math.random(table.getn(HeroBook1))]
				JiNuQinXi_HeroBookOne = JiNuQinXi_HeroBookOne + 1
			end
		end
		if BookID > 0 then
			local x,y
			local Num2 = 0
			repeat
				Num2 = Num2 + 1
				x = math.random(x1,x2)
				y = math.random(y1,y2)
			until not API_IsBlockTile(MapID,x,y,0) or Num2 == 100
			if not API_IsBlockTile(MapID,x,y,0) then
				API_CreateDropGoods(MapID,x,y,BookID,1,0,'机奴奇袭掉英雄书',4,0,600,0)
				table.insert(JiNuQinXi_LinShiTable[KillerID],BookID)
			end
		end
		local BC = table.getn(JiNuQinXi_LinShiTable[KillerID])
		if BC > 0 then
			local LSGD = ''
			for j,v in JiNuQinXi_LinShiTable[KillerID] do
				if j ~= BC then
					LSGD = LSGD..''..API_GetGoodsName(v)..'、'
				elseif j == BC then
					LSGD = LSGD..''..API_GetGoodsName(v)..''
				end
			end
			API_ActorBroadcastMsgEx(-1,-1,0,17,''..API_GetActorName(KillerID)..'带领的队伍击败BOSS（大爆'..GDNum..'堆奖励），获得了'..LSGD..'！')
			API_ActorBroadcastMsgEx(-1,-1,0,7,''..API_GetActorName(KillerID)..'带领的队伍击败BOSS（大爆'..GDNum..'堆奖励），获得了'..LSGD..'！')
		else
			API_ActorBroadcastMsgEx(-1,-1,0,17,''..API_GetActorName(KillerID)..'带领的队伍击败BOSS（大爆'..GDNum..'堆奖励）！')
			API_ActorBroadcastMsgEx(-1,-1,0,7,''..API_GetActorName(KillerID)..'带领的队伍击败BOSS（大爆'..GDNum..'堆奖励）！')
		end
		JiNuQinXi_LinShiTable[KillerID] = nil
	elseif ZhenJia == 2 or ZhenJia == 0 then
		if ZhenJia == 0 then
			ZhenJia = 2
		end
		for j in JiNuQinXi_GoodsTable[ZhenJia] do
			local RD = math.random(1000000)
			local GoodsID = JiNuQinXi_GoodsTable[ZhenJia][j].GoodsID
			local GoodsNum = JiNuQinXi_GoodsTable[ZhenJia][j].GoodsNum
			local GaiLv = JiNuQinXi_GoodsTable[ZhenJia][j].GaiLv
			if RD <= GaiLv then
				local x,y
				local Num = 0
				repeat
					Num = Num + 1
					x = math.random(x1,x2)
					y = math.random(y1,y2)
				until not API_IsBlockTile(MapID,x,y,0) or Num == 100
				if not API_IsBlockTile(MapID,x,y,0) then
					API_CreateDropGoods(MapID,x,y,GoodsID,GoodsNum,0,'机奴奇袭掉特殊物品',4,0,600,0)
				end
			end
		end
		API_ActorBroadcastMsg(DynamicMapID, 17, '很遗憾，这个BOSS是普通怪物伪装的，抓紧时间再去挑战下一个BOSS吧，极品奖励在等着你！')
		API_ActorBroadcastMsg(DynamicMapID, 8, '很遗憾，这个BOSS是普通怪物伪装的，抓紧时间再去挑战下一个BOSS吧，极品奖励在等着你！')
		------------------------------------------------------------------------------------------------------------
		--假门黄蕾增加特殊奖励
		local SofieAddGoodsID = 89186
		local nSofieRD =math.random(100)
		if nSofieRD <= 60 then
			API_CreateDropGoods(MapID, 60, 69, SofieAddGoodsID, 1, 0, '机奴幸运掉落',4, 0, 360, 120);
		end
		------------------------------------------------------------------------------------------------------------
		--API_ActorCallBack(DynamicMapID, 0, -1, 'JiNuQinXi_BossDieSay')
	end
end

function JiNuQinXi_BossDieSay(ActorID)
	API_ResponseWrite('<name></name>')
	API_ResponseWrite('<br><text>很遗憾，这个BOSS是普通怪物伪装的，抓紧时间再去挑战下一个BOSS吧，极品奖励在等着你！</text><br>')
	API_ResponseWrite('<br><a>确定</a>')
	API_ResponseFlush(ActorID)
end

--英雄大厅加经验  
--by cloudwan
--2011/11/9
function HeroHallAddExpTimeFunc(MapConfigID,b)
	local RightMapID = API_GetRightMapID(MapConfigID) 
	API_ActorCallBack(RightMapID, 1, -1, 'HeroHallAddExpCallBackFunc')
end
function HeroHallAddExpCallBackFunc(ActorID)
	local PlayLv = API_GetActorExpLevel(ActorID)
	local AddExp = PlayLv * 100
	if API_ActorAddExp(ActorID,AddExp,0,'英雄大厅挂机奖励') then
		API_ActorSendMsg(ActorID,10,'获得'..AddExp..'经验')
	end
end
--[[
//////////////////////////////////////////////////////////////////////////
// BOSS伤害广播的2个相关API
//////////////////////////////////////////////////////////////////////////
bool API_BroadcastBOSSHurtStart(int nFastID, int nMaxActors, long dwElapse, const char * szCallbackFunction); 启动相关的操作
// nFastID: BOSS 的FastID
// nMaxActors: 计算的最大人数
// dwElapse: 回调LUA的时间间隔
// szCallbackFunction: LUA的回调函数
// void OnBossUpdateDamageList(lFastID, lActorID, nDamageNum, bKiller, lIndex) 回调函数的格式
void API_BroadcastBOSSHurtStop(int nFastID); 停止,BOSS死亡会自动停止



local ActorID = API_RequestGetActorID() 
local MapID = API_GetActorMapID(ActorID) 
local x,y = PublicFun_GetActorPosXY(ActorID) 
local FastID = API_CreateMonster(MapID, 731217, x, y, 0, 0, -1) 
API_BroadcastBOSSHurtStart(FastID, 5, 5000, 'OnBossUpdateDamageList') 


local ActorID = API_RequestGetActorID() 
local MapID = API_GetActorMapID(ActorID) 
local Info = '伤害排行\n' 
API_ActorBroadcastMsg(MapID,4,Info) 

function OnBossUpdateDamageList(FastID, ActorID, DamageNum, Killer, Index, MaxActorList, lActorKiller) 
后面添加一个 lActorKiller 参数, 如果 lActorKiller > 0 的时候就应该是BOSS被杀后的回调
]]

WYL_SDKillBoss_DropGoodsTab = {
{GoodsID=80832,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80832,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80832,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80832,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80832,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80832,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80832,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80832,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80832,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80832,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80833,GoodsNum=10,GaiLv=1000000,PinZhi=0},
{GoodsID=80833,GoodsNum=10,GaiLv=1000000,PinZhi=0},
{GoodsID=80833,GoodsNum=10,GaiLv=1000000,PinZhi=0},
{GoodsID=80833,GoodsNum=10,GaiLv=1000000,PinZhi=0},
{GoodsID=80833,GoodsNum=10,GaiLv=1000000,PinZhi=0},
{GoodsID=80818,GoodsNum=50,GaiLv=800000,PinZhi=0},
{GoodsID=80818,GoodsNum=50,GaiLv=600000,PinZhi=0},
{GoodsID=80818,GoodsNum=50,GaiLv=400000,PinZhi=0},
{GoodsID=80818,GoodsNum=50,GaiLv=200000,PinZhi=0},
{GoodsID=89094,GoodsNum=4,GaiLv=1000000,PinZhi=0},
{GoodsID=89094,GoodsNum=4,GaiLv=1000000,PinZhi=0},
{GoodsID=89094,GoodsNum=4,GaiLv=1000000,PinZhi=0},
{GoodsID=89094,GoodsNum=4,GaiLv=1000000,PinZhi=0},
{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0},
{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0},
{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0},
{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0},
{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0},
{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0},
{GoodsID=31047,GoodsNum=1,GaiLv=200000,PinZhi=0},
{GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=80498,GoodsNum=20,GaiLv=1000000,PinZhi=0},
{GoodsID=5,GoodsNum=1,GaiLv=600000,PinZhi=6},
{GoodsID=1,GoodsNum=1,GaiLv=600000,PinZhi=6},
{GoodsID=5,GoodsNum=1,GaiLv=600000,PinZhi=7},
{GoodsID=1,GoodsNum=1,GaiLv=600000,PinZhi=7},
}
local Christmas2012_StartTime = {Year = 2012,Month = 12,Day = 7,Hour = 0,Minute = 0,Second = 0}
local Christmas2012_EndTime = {Year = 2013,Month = 1,Day = 4,Hour = 0,Minute = 0,Second = 0}

WYL_2011SDBossDamageList = {} --可以用怪物monsterid为下标

function WYL_SDKillBoss_ActFunc(MapConfigID,b)
	local TriggerID = API_GetCurTriggerID()
	local NowTime = os.time()
	local StartTimeTable = Christmas2012_StartTime
	local EndTimeTable = Christmas2012_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)

--	if NowTime >= 1323878400 and NowTime < 1326124800 then
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		--活动开始阶段
		local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		if Hour == 12 or Hour == 18 then
			if Minute > 30 and math.mod(Minute,5) == 0 then
					--通知活动要开始
					--API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 17, '追缉雪人BOSS活动于'..Hour..'：30--'..(Hour+1)..'：00在英雄大厅举行，欢迎各位英雄踊跃参与！击杀雪人BOSS将获得大量奖励！')
					--API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 8, '追缉雪人BOSS活动于'..Hour..'：30--'..(Hour+1)..'：00在英雄大厅举行，欢迎各位英雄踊跃参与！击杀雪人BOSS将获得大量奖励！')
					Hour = Hour + 1
					API_ActorBroadcastMsg(-1, 17,'号外，号外，'..Hour..'点英雄大厅会出现一只大雪人，大家准备好手中的雪球，等着使劲砸它吧。')
			end
		end
		if Hour == 13 or Hour == 19 then
			if Minute == 0 then
				--刷boss
				local MapID = API_GetRightMapID(MapConfigID)
				local BaoXiangFastID = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.BaoXiangFastID)
				if BaoXiangFastID > 0 then
					if API_GetMonsterID(BaoXiangFastID) ~= 731217 then
						local FastID = API_CreateMonster(MapID, 731217, 127, 92, 3, 0, -1) 
						API_BroadcastBOSSHurtStart(FastID, 5, 10000, 'OnBossUpdateDamageList') 
						API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.BaoXiangFastID,FastID)
						WYL_2011SDBossDamageList = {}
					end
				else
					local FastID = API_CreateMonster(MapID, 731217, 127, 92, 3, 0, -1) 
					API_BroadcastBOSSHurtStart(FastID, 5, 10000, 'OnBossUpdateDamageList') 
					API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.BaoXiangFastID,FastID)
					WYL_2011SDBossDamageList = {}
				end
				--API_ActorBroadcastMsgLevelEx(-1, -1, 12, 0, 17, '追缉雪人BOSS活动在英雄大厅开始啦~，欢迎各位英雄踊跃参与！用你手上的雪球干掉它吧！')
				API_ActorBroadcastMsg(-1, 17,'英雄大厅出现了一只大雪人！大家快拿起手中的雪球，使劲砸它吧！丰富奖励等着你哟~')
			end
		end
	elseif nShiFouEnd <= 0 then
		--活动已经结束
		API_DestroyTriggerG(TriggerID)
	end
end


--怪物FASTID，玩家ID，伤害数值，是否杀手，顺序号，最大玩家数，是否boss死亡
function OnBossUpdateDamageList(FastID, ActorID, DamageNum, Killer, Index, MaxActorList, ActorKiller) 
	if API_ActorIsOnline(ActorID) then
		API_Trace(FastID..'，ol'..ActorID..'，'..DamageNum..'，'..Killer..'，'..Index..'，'..MaxActorList..'，'..ActorKiller)
	else
		API_Trace(FastID..'，ot'..ActorID..'，'..DamageNum..'，'..Killer..'，'..Index..'，'..MaxActorList..'，'..ActorKiller)		
	end
	if WYL_2011SDBossDamageList[Index] == nil then WYL_2011SDBossDamageList[Index] = {} end
	WYL_2011SDBossDamageList[Index][1] = ActorID
	WYL_2011SDBossDamageList[Index][2] = DamageNum
	if Index == MaxActorList then
		local MapID = API_GetMonsterMap(FastID) 
		local Info = '伤害排行\n'
		for j in WYL_2011SDBossDamageList do
			local Text = ''..j..'：'
			if API_ActorIsOnline(WYL_2011SDBossDamageList[j][1]) then
				Text = Text..''..API_GetActorName(WYL_2011SDBossDamageList[j][1])..' '
			else
				Text = Text..''..WYL_2011SDBossDamageList[j][1]..' '
			end
			Text = Text..''..WYL_2011SDBossDamageList[j][2]..'\n'
			Info = Info..Text
		end
		API_ActorBroadcastMsg(MapID,4,Info)
	end
	if ActorKiller > 0 then
		local MapID = API_GetMonsterMap(FastID) 
		
		if API_ActorIsOnline(ActorID) then
			local ObjectMapID = API_GetActorMapID(ActorID)
			API_ActorBroadcastMsg(ObjectMapID,4,'')
		end
		
		local PosX,PosY = PublicFun_GetMonsterPosXY(FastID)
		--API_ActorBroadcastMsg(MapID,4,'BOSS被击杀了')
		--前5名奖励
		if Index == 1 then
			API_SendActorMail(ActorID, 89186, 100, '[追缉雪人BOSS]击退奖励', '你在追缉雪人BOSS活动中表现突出，对雪人BOSS造成了'..DamageNum..'伤害，获得了'..API_GetGoodsName(89186)..' X 100')
--			API_SendActorMail(ActorID, 82030, 120, '[追缉雪人BOSS]击退奖励', '你在追缉雪人BOSS活动中表现突出，对雪人BOSS造成了'..DamageNum..'伤害，获得了'..API_GetGoodsName(82030)..' X 120')
		end
		if Index == 2 then
			API_SendActorMail(ActorID, 89186, 80, '[追缉雪人BOSS]击退奖励', '你在追缉雪人BOSS活动中表现突出，对雪人BOSS造成了'..DamageNum..'伤害，获得了'..API_GetGoodsName(89186)..' X 80')
--			API_SendActorMail(ActorID, 82030, 90, '[追缉雪人BOSS]击退奖励', '你在追缉雪人BOSS活动中表现突出，对雪人BOSS造成了'..DamageNum..'伤害，获得了'..API_GetGoodsName(82030)..' X 90')
		end
		if Index == 3 then
			API_SendActorMail(ActorID, 89186, 60, '[追缉雪人BOSS]击退奖励', '你在追缉雪人BOSS活动中表现突出，对雪人BOSS造成了'..DamageNum..'伤害，获得了'..API_GetGoodsName(89186)..' X 60')
--			API_SendActorMail(ActorID, 82030, 70, '[追缉雪人BOSS]击退奖励', '你在追缉雪人BOSS活动中表现突出，对雪人BOSS造成了'..DamageNum..'伤害，获得了'..API_GetGoodsName(82030)..' X 70')
		end
		if Index == 4 then
			API_SendActorMail(ActorID, 89186, 40, '[追缉雪人BOSS]击退奖励', '你在追缉雪人BOSS活动中表现突出，对雪人BOSS造成了'..DamageNum..'伤害，获得了'..API_GetGoodsName(89186)..' X 40')
--			API_SendActorMail(ActorID, 82030, 50, '[追缉雪人BOSS]击退奖励', '你在追缉雪人BOSS活动中表现突出，对雪人BOSS造成了'..DamageNum..'伤害，获得了'..API_GetGoodsName(82030)..' X 50')
		end
		if Index == 5 then
			API_SendActorMail(ActorID, 89186, 20, '[追缉雪人BOSS]击退奖励', '你在追缉雪人BOSS活动中表现突出，对雪人BOSS造成了'..DamageNum..'伤害，获得了'..API_GetGoodsName(89186)..' X 20')
--			API_SendActorMail(ActorID, 82030, 30, '[追缉雪人BOSS]击退奖励', '你在追缉雪人BOSS活动中表现突出，对雪人BOSS造成了'..DamageNum..'伤害，获得了'..API_GetGoodsName(82030)..' X 30')
		end
		if Index <= 5 then
			local KillerName = API_GetActorName(ActorID)
			API_ActorBroadcastMsg(-1, 17,'击杀雪人BOSS英雄榜第'..Index..'名：'..KillerName..'')
		end
		--击杀者奖励
		if ActorID == ActorKiller then
			local KillerName = API_GetActorName(ActorKiller)
			local LinShiTab = {}
			local Say = ''
			local BiaoZhi = 0
			local Num = 0
			local Card = 0
			local Ka = 0
			for j in WYL_SDKillBoss_DropGoodsTab do
				local GaiLv = WYL_SDKillBoss_DropGoodsTab[j].GaiLv
				local RD = math.random(1000000)
				if RD <= GaiLv then
					local GoodsID = WYL_SDKillBoss_DropGoodsTab[j].GoodsID
					local GoodsNum = WYL_SDKillBoss_DropGoodsTab[j].GoodsNum
					local PinZhi = WYL_SDKillBoss_DropGoodsTab[j].PinZhi
					if PinZhi > 0 then
						local GoodsID2 = YXD_WorldDropGoodsTab[GoodsID][math.random(table.getn(YXD_WorldDropGoodsTab[GoodsID]))]
						local GoodsName = API_GetGoodsName(GoodsID2)
						if API_CreateDropGoodsEx(MapID,PosX,PosY,GoodsID2,1,0,'雪人BOSS掉落物品',4,ActorKiller,600,120,PinZhi) == true then
							if PinZhi > 6 then
								Num = Num + 1
								if Num == 1 then
									if Card == 0 then
										Say = Say..'高附加属性3洞的'..GoodsName..''
									else
										Say = Say..'，高附加属性3洞的'..GoodsName..''
									end
									BiaoZhi = BiaoZhi + 1
								else
									Say = Say..'、'..GoodsName..''
								end
							end
						end
					else
						local GoodsName = API_GetGoodsName(GoodsID)
						if API_CreateDropGoods(MapID,PosX,PosY,GoodsID,GoodsNum,0,'雪人BOSS掉落物品',0,ActorKiller,600,120) == true then
							if GoodsID == 31047 then
								Card = Card + 1
								if Card == 1 then
									if Ka > 0 then
										Say = Say..'、高级宠物卡'..GoodsName..''
									else
										Say = Say..'高级宠物卡'..GoodsName..''
									end
								else
									Say = Say..'、'..GoodsName..''
								end
								BiaoZhi = BiaoZhi + 1
							elseif GoodsID >= 83103 and GoodsID <= 83106 then
								Ka = Ka + 1
								if Ka  == 1 then
									Say = Say..'最新装备卡片'..GoodsName..''
								else
									Say = Say..'、'..GoodsName..''
								end
								BiaoZhi = BiaoZhi + 1
							end
						end
					end
				end
			end
			local a = {'犀利的','英俊的','潇洒的','帅气的','长得好的',}
			local b = {'一招秒杀了','使出终极绝招干掉了','Hold住全场，用眼神杀死了','看准时机，趁着雪人还有一丝血的时候，果断出手干掉了',}
			local a2 = a[math.random(table.getn(a))]
			local b2 = b[math.random(table.getn(b))]
			if BiaoZhi > 0 then
				API_ActorBroadcastMsg(-1, 17,''..a2..''..KillerName..''..b2..'雪人BOSS，获得了'..Say..'。')
			else
				API_ActorBroadcastMsg(-1, 17,''..a2..''..KillerName..''..b2..'雪人BOSS，获得了丰厚奖励。')
			end
		end
		--伤害奖
		local ExpNum = math.floor(DamageNum/100)
		if ExpNum > 0 then
			if ExpNum > 9999 then
				local a = math.floor(ExpNum/9999)
				local b = math.mod(ExpNum,9999)
				for i = 1,a do
					API_SendActorMail(ActorID, 80498, 9999, '[追缉雪人BOSS]活动奖励', '你在追缉雪人BOSS活动中对雪人BOSS造成了'..DamageNum..'伤害，获得了'..API_GetGoodsName(80498)..' X 9999')
				end
				API_SendActorMail(ActorID, 80498, b, '[追缉雪人BOSS]活动奖励', '你在追缉雪人BOSS活动中对雪人BOSS造成了'..DamageNum..'伤害，获得了'..API_GetGoodsName(80498)..' X '..b..'')
			else
				API_SendActorMail(ActorID, 80498, ExpNum, '[追缉雪人BOSS]活动奖励', '你在追缉雪人BOSS活动中对雪人BOSS造成了'..DamageNum..'伤害，获得了'..API_GetGoodsName(80498)..' X '..ExpNum..'')
			end
		end
	end
end 

function ZaXueRenPaiMing(MapID,Param2)
	local TriggerID = API_GetCurTriggerID()
	API_DestroyTriggerG(TriggerID)
	API_ActorBroadcastMsg(MapID,4,'')
end
