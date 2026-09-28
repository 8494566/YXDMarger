-------------------------------
--文件名:	Scp\LUA\Act\DuoBaoQiBing.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	刘操
--日  期:	2010-3-24
--版  本:	
--描  述:	夺宝奇兵活动副本
--应  用:  
-------------------------------

-------------------------------
--作者：刘操
--创建日期：2010/3/24
--功能：夺宝奇兵副本
-------------------------------
---------------------------------
--修改人：黄蕾
--日期  ：20120813
--内容  ：修改爱慕之心掉落的时间（活动时间掉复活十字章）
--日期  ：20120919 国庆活动开启
--------------------------------------

local DuoBaoQiBing_OpenBox = 30283

local LC_PeiHeHuoDong_StartTime = {Year = 2012,Month = 12,Day = 14,Hour = 0,Minute = 0,Second = 0}
local LC_PeiHeHuoDong__EndTime = {Year = 2013,Month = 1,Day = 7,Hour = 0,Minute = 0,Second = 0}

--夺宝物品表
local localtable_DuoBaoQiBing_Goods = {
[1] = {
			{GoodsID = 80274,Num = 1,Bind = 0,Odds =10000,PinZhi=0,Point=20},
			{GoodsID = 80818,Num = 10,Bind = 0,Odds =10000,PinZhi=0,Point=10},
			{GoodsID = 80397,Num = 1,Bind = 0,Odds =10000,PinZhi=0,Point=20},
			{GoodsID = 89126,Num = 1,Bind = 0,Odds =10000,PinZhi=0,Point=50},
			{GoodsID = 250,Num = 1,Bind = 0,Odds =10000,PinZhi=0,Point=10},
--			{GoodsID = 89075,Num = 1,Bind = 0,Odds =10000,PinZhi=0,Point=50},
			{GoodsID = 80686,Num = 1,Bind = 0,Odds =10000,PinZhi=0,Point=100},
			{GoodsID = 80689,Num = 1,Bind = 0,Odds =10000,PinZhi=0,Point=100},
			{GoodsID = 82032,Num = 1,Bind = 0,Odds =10000,PinZhi=0,Point=200},
			{GoodsID = 89118,Num = 1,Bind = 0,Odds =10000,PinZhi=0,Point=100},
			{GoodsID = 75,Num = 1,Bind = 0,Odds =10000,PinZhi=0,Point=100},
			{GoodsID = 39602,Num = 1,Bind = 0,Odds =10000,PinZhi=0,Point=30},
			{GoodsID = 80621,Num = 1,Bind = 0,Odds =10000,PinZhi=0,Point=50},
		},
[2] = {
		[1]={
			{GoodsID = 2001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--夺目钥匙
			{GoodsID = 3001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--树妖扫帚
			{GoodsID = 3901,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--猫人之盾
			
			{GoodsID = 4001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸头盔
			{GoodsID = 4101,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸胸甲
			{GoodsID = 4001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸头盔
			{GoodsID = 4101,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸胸甲
			
			{GoodsID = 6601,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--刺客飘带
			{GoodsID = 6901,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--猛兽之眼
			{GoodsID = 8101,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--猛兽之戒
			{GoodsID = 6601,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--刺客飘带
			{GoodsID = 6901,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--猛兽之眼
			{GoodsID = 8101,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--猛兽之戒
			
			{GoodsID = 4401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸腿甲
			{GoodsID = 4501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸之靴
			{GoodsID = 4401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸腿甲
			{GoodsID = 4501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸之靴
			{GoodsID = 4401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸腿甲
			{GoodsID = 4501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸之靴
			{GoodsID = 4401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸腿甲
			{GoodsID = 4501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸之靴
			
			{GoodsID = 4301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸腰带
			{GoodsID = 4201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸手套
			{GoodsID = 4301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸腰带
			{GoodsID = 4201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸手套
			{GoodsID = 4301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸腰带
			{GoodsID = 4201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸手套
			{GoodsID = 4301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸腰带
			{GoodsID = 4201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸手套
			{GoodsID = 4301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸腰带
			{GoodsID = 4201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--钢铸手套

			{GoodsID = 1501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--长筒狩猎步枪
			
			{GoodsID = 5001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影之帽
			{GoodsID = 5101,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影之服
			{GoodsID = 5001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影之帽
			{GoodsID = 5101,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影之服
			
			{GoodsID = 6701,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔王之眼
			{GoodsID = 7001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--鬼魅项链
			{GoodsID = 8201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--鬼魅之戒 
			{GoodsID = 6701,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔王之眼
			{GoodsID = 7001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--鬼魅项链
			{GoodsID = 8201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--鬼魅之戒 
			
			{GoodsID = 5401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影护腿 
			{GoodsID = 5501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影马靴
			{GoodsID = 5401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影护腿 
			{GoodsID = 5501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影马靴
			{GoodsID = 5401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影护腿 
			{GoodsID = 5501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影马靴
			{GoodsID = 5401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影护腿 
			{GoodsID = 5501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影马靴
			
			{GoodsID = 5301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影腰带
			{GoodsID = 5201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影手套
			{GoodsID = 5301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影腰带
			{GoodsID = 5201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影手套
			{GoodsID = 5301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影腰带
			{GoodsID = 5201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影手套
			{GoodsID = 5301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影腰带
			{GoodsID = 5201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影手套
			{GoodsID = 5301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影腰带
			{GoodsID = 5201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--幻影手套
			
			{GoodsID = 1001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--智者之书
			
			{GoodsID = 6001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀头巾
			{GoodsID = 6101,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀法袍
			{GoodsID = 6001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀头巾
			{GoodsID = 6101,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀法袍
			
			{GoodsID = 6801,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--鬼魅披肩
			{GoodsID = 8001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--地狱项链
			{GoodsID = 8301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--地狱之戒
			{GoodsID = 6801,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--鬼魅披肩
			{GoodsID = 8001,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--地狱项链
			{GoodsID = 8301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--地狱之戒
			
			{GoodsID = 6401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀护腿
			{GoodsID = 6501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀之靴
			{GoodsID = 6401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀护腿
			{GoodsID = 6501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀之靴
			{GoodsID = 6401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀护腿
			{GoodsID = 6501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀之靴
			{GoodsID = 6401,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀护腿
			{GoodsID = 6501,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀之靴
			
			{GoodsID = 6301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀束带
			{GoodsID = 6201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀手套
			{GoodsID = 6301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀束带
			{GoodsID = 6201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀手套
			{GoodsID = 6301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀束带
			{GoodsID = 6201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀手套
			{GoodsID = 6301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀束带
			{GoodsID = 6201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀手套
			{GoodsID = 6301,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀束带
			{GoodsID = 6201,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--闪耀手套
			},
		[2] = {
			{GoodsID = 2002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--阔刃双手剑 
			{GoodsID = 3002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--夜行短剑
			{GoodsID = 3902,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--十字钢盾

			{GoodsID = 4002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护头盔 
			{GoodsID = 4102,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护胸甲
			{GoodsID = 4002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护头盔 
			{GoodsID = 4102,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护胸甲
			
			{GoodsID = 6602,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--怒焰披风
			{GoodsID = 6902,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--虎击项链
			{GoodsID = 8102,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--虎击指环
			{GoodsID = 6602,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--怒焰披风
			{GoodsID = 6902,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--虎击项链
			{GoodsID = 8102,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--虎击指环
			
			{GoodsID = 4402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护腿甲
			{GoodsID = 4502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护之靴
			{GoodsID = 4402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护腿甲
			{GoodsID = 4502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护之靴
			{GoodsID = 4402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护腿甲
			{GoodsID = 4502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护之靴
			{GoodsID = 4402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护腿甲
			{GoodsID = 4502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护之靴
			
			{GoodsID = 4302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护腰带
			{GoodsID = 4202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护手套
			{GoodsID = 4302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护腰带
			{GoodsID = 4202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护手套
			{GoodsID = 4302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护腰带
			{GoodsID = 4202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护手套
			{GoodsID = 4302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护腰带
			{GoodsID = 4202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护手套
			{GoodsID = 4302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护腰带
			{GoodsID = 4202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--守护手套
			
			{GoodsID = 1502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--大口径霰弹枪
			
			{GoodsID = 5002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风军帽 
			{GoodsID = 5102,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风制服
			{GoodsID = 5002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风军帽 
			{GoodsID = 5102,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风制服
			
			{GoodsID = 6702,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--血魂飘带
			{GoodsID = 7002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--夜幕项链 
			{GoodsID = 8202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--夜幕指环
			{GoodsID = 6702,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--血魂飘带
			{GoodsID = 7002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--夜幕项链 
			{GoodsID = 8202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--夜幕指环

			{GoodsID = 5402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风护腿
			{GoodsID = 5502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风马靴
			{GoodsID = 5402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风护腿
			{GoodsID = 5502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风马靴
			{GoodsID = 5402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风护腿
			{GoodsID = 5502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风马靴
			{GoodsID = 5402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风护腿
			{GoodsID = 5502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风马靴
			
			{GoodsID = 5302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风腰带
			{GoodsID = 5202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风手套
			{GoodsID = 5302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风腰带
			{GoodsID = 5202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风手套
			{GoodsID = 5302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风腰带
			{GoodsID = 5202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风手套
			{GoodsID = 5302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风腰带
			{GoodsID = 5202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风手套
			{GoodsID = 5302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风腰带
			{GoodsID = 5202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--防风手套
			
			{GoodsID = 1002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--贤者之书
			
			{GoodsID = 6002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力头巾
			{GoodsID = 6102,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力法袍	
			{GoodsID = 6002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力头巾
			{GoodsID = 6102,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力法袍
			
			{GoodsID = 6802,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--傀儡师披风
			{GoodsID = 8002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--圣光项链
			{GoodsID = 8302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--圣光之戒 
			{GoodsID = 6802,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--傀儡师披风
			{GoodsID = 8002,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--圣光项链
			{GoodsID = 8302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--圣光之戒 
			
			{GoodsID = 6402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力护腿
			{GoodsID = 6502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力之靴
			{GoodsID = 6402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力护腿
			{GoodsID = 6502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力之靴
			{GoodsID = 6402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力护腿
			{GoodsID = 6502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力之靴
			{GoodsID = 6402,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力护腿
			{GoodsID = 6502,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力之靴
			
			{GoodsID = 6302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力束带 
			{GoodsID = 6202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力手套
			{GoodsID = 6302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力束带 
			{GoodsID = 6202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力手套
			{GoodsID = 6302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力束带 
			{GoodsID = 6202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力手套
			{GoodsID = 6302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力束带 
			{GoodsID = 6202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力手套
			{GoodsID = 6302,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力束带 
			{GoodsID = 6202,Num = 1,Bind = 0,Odds =10000,PinZhi=7},--魔力手套
			},
		[3] = {
			{GoodsID = 2003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--咆哮重剑 
			{GoodsID = 3003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--骑士之剑 
			{GoodsID = 3903,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--守卫之盾 

			{GoodsID = 4103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮胸甲
			{GoodsID = 4003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮头盔
			{GoodsID = 4103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮胸甲
			{GoodsID = 4003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮头盔
			
			{GoodsID = 6703,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--恶魔翅膀 
			{GoodsID = 7003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--搏击项链 
			{GoodsID = 8203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--搏击指环 
			{GoodsID = 6703,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--恶魔翅膀 
			{GoodsID = 7003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--搏击项链 
			{GoodsID = 8203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--搏击指环 
			
			{GoodsID = 4403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮护腿
			{GoodsID = 4503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮战靴
			{GoodsID = 4403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮护腿
			{GoodsID = 4503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮战靴
			{GoodsID = 4403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮护腿
			{GoodsID = 4503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮战靴
			{GoodsID = 4403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮护腿
			{GoodsID = 4503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮战靴
			
			{GoodsID = 4303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮腰带
			{GoodsID = 4203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮护手
			{GoodsID = 4303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮腰带
			{GoodsID = 4203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮护手
			{GoodsID = 4303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮腰带
			{GoodsID = 4203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮护手
			{GoodsID = 4303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮腰带
			{GoodsID = 4203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮护手
			{GoodsID = 4303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮腰带
			{GoodsID = 4203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--野蛮护手
			
			{GoodsID = 1503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--强力射钉枪 

			{GoodsID = 5003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧之帽
			{GoodsID = 5103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧制服
			{GoodsID = 5003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧之帽
			{GoodsID = 5103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧制服
			
			{GoodsID = 6603,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--蝙蝠飘带			
			{GoodsID = 6903,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--恋人之心 
			{GoodsID = 8103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--恋人之戒 
			{GoodsID = 6603,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--蝙蝠飘带			
			{GoodsID = 6903,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--恋人之心 
			{GoodsID = 8103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--恋人之戒 
			
			{GoodsID = 5303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧腰带
			{GoodsID = 5203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧手套
			{GoodsID = 5303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧腰带
			{GoodsID = 5203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧手套
			{GoodsID = 5303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧腰带
			{GoodsID = 5203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧手套
			{GoodsID = 5303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧腰带
			{GoodsID = 5203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧手套
			
			{GoodsID = 5403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧护腿
			{GoodsID = 5503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧马靴
			{GoodsID = 5403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧护腿
			{GoodsID = 5503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧马靴
			{GoodsID = 5403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧护腿
			{GoodsID = 5503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧马靴
			{GoodsID = 5403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧护腿
			{GoodsID = 5503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧马靴
			{GoodsID = 5403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧护腿
			{GoodsID = 5503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--灵巧马靴
			
			{GoodsID = 1003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--缚法之书
			
			{GoodsID = 6003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑头巾
			{GoodsID = 6103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑法袍
			{GoodsID = 6003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑头巾
			{GoodsID = 6103,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑法袍
			
			{GoodsID = 6803,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--魔咒披风 
			{GoodsID = 8003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--魔龙之心 
			{GoodsID = 8303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--魔龙之戒 
			{GoodsID = 6803,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--魔咒披风 
			{GoodsID = 8003,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--魔龙之心 
			{GoodsID = 8303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--魔龙之戒 
			
			{GoodsID = 6403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑护腿
			{GoodsID = 6503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑之靴 
			{GoodsID = 6403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑护腿
			{GoodsID = 6503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑之靴 
			{GoodsID = 6403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑护腿
			{GoodsID = 6503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑之靴 
			{GoodsID = 6403,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑护腿
			{GoodsID = 6503,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑之靴 
			
			{GoodsID = 6303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑束带
			{GoodsID = 6203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑手套
			{GoodsID = 6303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑束带
			{GoodsID = 6203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑手套
			{GoodsID = 6303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑束带
			{GoodsID = 6203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑手套
			{GoodsID = 6303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑束带
			{GoodsID = 6203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑手套
			{GoodsID = 6303,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑束带
			{GoodsID = 6203,Num = 1,Bind = 0,Odds = 10000,PinZhi = 7},--星屑手套
			},
		},
[3] = {
		--悍马装甲车卡片
		{GoodsID = 39704,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 1},
		{GoodsID = 39704,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 1},
		{GoodsID = 39704,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 1},
		{GoodsID = 39704,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 1},
		{GoodsID = 39704,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 1},
		--兔斯基私车卡片
		{GoodsID = 39706,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 2},
		{GoodsID = 39706,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 2},
		{GoodsID = 39706,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 2},
		{GoodsID = 39706,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 2},
		{GoodsID = 39706,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 2},
		--炎龙宝宝卡
		{GoodsID = 31023,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 1,BiaoZhi = 3},
		{GoodsID = 31023,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 1,BiaoZhi = 3},
		{GoodsID = 31023,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 1,BiaoZhi = 3},
		{GoodsID = 31023,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 1,BiaoZhi = 3},
		{GoodsID = 31023,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 1,BiaoZhi = 3},
		--幻彩之鱼
		{GoodsID = 32020,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 4},
		{GoodsID = 32020,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 4},
		{GoodsID = 32020,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 4},
		{GoodsID = 32020,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 4},
		{GoodsID = 32020,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 4},
		--四档三洞
		{GoodsID = 4303,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 4203,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 4403,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 4503,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 5303,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 5203,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 5403,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 5503,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 6303,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 6203,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 6403,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 6503,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 4103,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 4003,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 5003,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 5103,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 6003,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5},
		{GoodsID = 6103,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 	
		{GoodsID = 6603,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		{GoodsID = 6903,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		{GoodsID = 8103,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		{GoodsID = 2003,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		{GoodsID = 3003,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		{GoodsID = 3903,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		{GoodsID = 6703,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		{GoodsID = 7003,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		{GoodsID = 8203,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		{GoodsID = 1503,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		{GoodsID = 6803,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		{GoodsID = 8003,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		{GoodsID = 8303,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		{GoodsID = 1003,Num = 1,Bind = 0,Odds = 100000,PinZhi = 6,Max = 10,BiaoZhi = 5}, 
		--异世界飞碟卡
		{GoodsID = 32021,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 6},
		{GoodsID = 32021,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 6},
		{GoodsID = 32021,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 6},
		{GoodsID = 32021,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 6},
		--五彩筋斗云
		{GoodsID = 32023,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 9},
		{GoodsID = 32023,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 9},
		{GoodsID = 32023,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 9},
		{GoodsID = 32023,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 2,BiaoZhi = 9},
		--超级宝石
		{GoodsID = 40304,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 10,BiaoZhi = 7},
		--
		{GoodsID = 40306,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 10,BiaoZhi = 7},
		--
		{GoodsID = 40308,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 10,BiaoZhi = 7},
		--
		{GoodsID = 40324,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 10,BiaoZhi = 7},
		--
		{GoodsID = 40326,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 10,BiaoZhi = 7},
		--
		{GoodsID = 40328,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 10,BiaoZhi = 7},
		--
		{GoodsID = 40344,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 10,BiaoZhi = 7},
		--		
		{GoodsID = 40346,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 10,BiaoZhi = 7},
		--		
		{GoodsID = 40348,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 10,BiaoZhi = 7},		
		--圣盾秘籍一【物理】
		{GoodsID = 89175,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,BiaoZhi = 8},
		{GoodsID = 89175,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,BiaoZhi = 8},
		--元素秘籍一【魔法】
		{GoodsID = 89180,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,BiaoZhi = 8},
		{GoodsID = 89180,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,BiaoZhi = 8},
		--炼金秘籍一【火药】
		{GoodsID = 89185,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,BiaoZhi = 8}, 
		{GoodsID = 89185,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,BiaoZhi = 8}, 		
		--武僧秘籍一【物理】
		{GoodsID = 89137,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,BiaoZhi = 8},
		{GoodsID = 89137,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,BiaoZhi = 8},
		--亡灵秘籍一【魔法】
		{GoodsID = 89142,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,BiaoZhi = 8},
		{GoodsID = 89142,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,BiaoZhi = 8},
		--海贼秘籍一【火药】
		{GoodsID = 89147,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,BiaoZhi = 8}, 
		{GoodsID = 89147,Num = 1,Bind = 0,Odds = 10000,PinZhi = 0,Max = 6,BiaoZhi = 8},
		},
[4] = {
		{GoodsID = 82003,Num = 1,Bind = 2,Odds = 10000}, 
		},
[5] = {
		--三档三洞
		{GoodsID = 6602,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 6902,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 8102,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 4302,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 4202,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 4402,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 4502,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 6702,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 7002,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 8202,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 5302,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 5202,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 5402,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 5502,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 6802,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 8002,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 8302,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 6302,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 6202,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 6402,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 6502,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 4002,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 4102,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 5002,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 5102,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 6002,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 6102,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 2002,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 3002,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 3902,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 1502,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		{GoodsID = 1002,Num = 1,Bind = 0,Odds =100000,PinZhi=6},
		},
}
local localtable_DuoBaoQiBing_ShiJianJiangLiMax = {
[0] = 32,
[1] = 32,
[2] = 0,
[3] = 0,
[4] = 0,
[5] = 0,
[6] = 0,
[7] = 0,
[8] = 4,
[9] = 4,
[10] = 8,
[11] = 8,
[12] = 12,
[13] = 12,
[14] = 16,
[15] = 16,
[16] = 20,
[17] = 20,
[18] = 24,
[19] = 24,
[20] = 28,
[21] = 28,
[22] = 32,
[23] = 32,
}
local localtable_DuoBaoQiBing_Monster = {
		[1] = {[1] = 726463,[2] = 726466,[3] = 726466,[4] = 726466},
		[2] = {[1] = 726464,[2] = 726467,[3] = 726467,[4] = 726467},
		[3] = {[1] = 726465,[2] = 726468,[3] = 726468,[4] = 726468},
}


local localtable_DuoBaoQiBing_Number = {
	[1] = 15,
	[2] = 20,
	[3] = 25,
	[4] = 30,
	[5] = 35,
}
	
local localtable_DuoBaoQiBing_NanDu = {
	[1] = 25,
	[2] = 40,
	[3] = 50,
	[4] = 55,
}

local localtable_DuoBaoQiBing_ShuaGuaiDian = {
[1] = {TileX =133,TileY =155},
[2] = {TileX =120,TileY =139},
[3] = {TileX =103,TileY =159},
[4] = {TileX =77,TileY =178},
[5] = {TileX =65,TileY =115},
}

local localtable_DuoBaoQiBing_Life = {
TileX =197,
TileY =112,
}


local DuoBaoQiBing_DiTuDingYi = {
	[1] = {
			NPC = {
					--传送门
					{NPCID = 11607,TileX = 131,TileY = 81,Direct = 3,AIInfoID = nil,Camp = nil,},
					--封印之柱
					--{NPCID = 12260,TileX = 102,TileY = 83,Direct = 3,AIInfoID = nil,Camp = nil,},
					--宝箱1
					{NPCID = {[0] = 12258,[1] = 12259,},TileX = 108,TileY = 90,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱2
					{NPCID = {[0] = 12258,[1] = 12259,},TileX = 113,TileY = 90,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱3
					{NPCID = {[0] = 12258,[1] = 12259,},TileX = 118,TileY = 90,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱4
					{NPCID = {[0] = 12258,[1] = 12259,},TileX = 123,TileY = 90,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱5
					{NPCID = {[0] = 12258,[1] = 12259,},TileX = 128,TileY = 90,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱6
					{NPCID = {[0] = 12258,[1] = 12259,},TileX = 108,TileY = 75,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱7
					{NPCID = {[0] = 12258,[1] = 12259,},TileX = 113,TileY = 75,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱8
					{NPCID = {[0] = 12258,[1] = 12259,},TileX = 118,TileY = 75,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱9
					{NPCID = {[0] = 12258,[1] = 12259,},TileX = 123,TileY = 75,Direct = 1,AIInfoID = nil,Camp = nil,},
					--宝箱10
					{NPCID = {[0] = 12258,[1] = 12259,},TileX = 128,TileY = 75,Direct = 1,AIInfoID = nil,Camp = nil,},
				  },
			},
}

local GoodsID = 88909

--使用物品
function DuoBaoQiBing_JuanZhouUse(ActorID,GoodsID)
	local MapID = API_GetActorMapID(ActorID) 
	local StaticMapID = API_GetStaticMapID(MapID)
	local XuanZe = API_RequestGetNumber(1)
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,3,'没有这个道具')
		return 0
	end
	if MapID == StaticMapID then
		API_ResponseWrite('<name>夺宝奇兵</name>')
		API_ResponseWrite('<text>您进入夺宝奇兵后，在规定时间内成功抵达终点，您将有机会获得高品质装备材料、载具卡片和各种道具！\n若要快速获得奖励，推荐玩家组队进入！进入后每人消耗一张夺宝奇兵传送卷，没有该物品的角色将无法进入.</text><br>')
		API_ResponseWrite('<br><a href="DuoBaoQiBing_ShiFouStater?1=100">我要进入</a><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return 1
	else
		API_ResponseWrite('<name>夺宝奇兵</name>')
		API_ResponseWrite('<text>夺宝奇兵传送卷使用失败！亲爱的玩家，当前地图不允许使用该物品，请切换地图尝试使用。</text><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return 0
	end
end

--进入夺宝奇兵副本判断
function DuoBaoQiBing_ShiFouStater()
	local ActorID = API_RequestGetActorID() 
	local TeamID = API_GetTeamID(ActorID)--获得玩家所在队伍的ID
	if TeamID > 0 then
		if API_GetTeamLeader(TeamID) == ActorID then
			local TeamSize = API_GetTeamSize(TeamID)--获得队伍人数	
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)--获得队伍成员ID
				if API_ActorIsOnline(TeamActorID) then
					if API_VarDataGetNumber(TeamActorID,1,101) > 0 or API_VarDataGetNumber(TeamActorID,1,102) > 0 then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>快递中，无法进入夺宝奇兵！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return 
					end
					if API_ActorFindStatus(TeamActorID,519) then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>摆摊中，无法进入夺宝奇兵！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return 
					end
					if API_ActorIsDying(TeamActorID) then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>死亡，无法进入夺宝奇兵！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return 
					end
					if API_VarDataGetNumber(TeamActorID,1,11816) > 0 then
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>队伍中 </text><text color="255,0,255">'..API_GetActorName(TeamActorID)..' </text><text>在公交车上无法进入夺宝奇兵！</text><br>')
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						return
					end
				end
			end
		else
			API_ResponseWrite('<name>夺宝奇兵</name>')
			API_ResponseWrite('<text>您不是队长，无法开启夺宝奇兵卷轴</text><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
			API_ResponseFlush(ActorID)
			return 			
		end
	else
		if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>快递中，无法进入夺宝奇兵！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 
		end
		if API_ActorFindStatus(ActorID,519) then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>摆摊中，无法进入夺宝奇兵！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 
		end
		if API_ActorIsDying(ActorID) then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>角色死亡，无法进入夺宝奇兵！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return 
		end
		if API_VarDataGetNumber(ActorID,1,11816) > 0 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>在公交车上无法进入夺宝奇兵！</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
			return
		end
	end
		DuoBaoQiBing_Create(ActorID)
end

if DuoBaoQiBing_MapInfoTable == nil then
	DuoBaoQiBing_MapInfoTable = {}
end

if DuoBaoQiBing_MonsterFastID == nil then
	DuoBaoQiBing_MonsterFastID = {}
end

if DuoBaoQiBing_MonsterTileX == nil then
	DuoBaoQiBing_MonsterTileX = {}
end

if DuoBaoQiBing_MonsterTileY == nil then
	DuoBaoQiBing_MonsterTileY = {}
end

--创建副本
function DuoBaoQiBing_Create(ActorID)
	local StaticMapID = 2020
	local ObjectMapID = API_CreateEctype(StaticMapID,0)
	DuoBaoQiBing_MapInfoTable[ObjectMapID] = {}
	DuoBaoQiBing_MapInfoTable[ObjectMapID].TimeOut = 0
	DuoBaoQiBing_MapInfoTable[ObjectMapID].Time = 300
	DuoBaoQiBing_MapInfoTable[ObjectMapID].TimeStart = 0
	DuoBaoQiBing_MapInfoTable[ObjectMapID].number = 0
	DuoBaoQiBing_MapInfoTable[ObjectMapID].TimeTriggerGID = 0
	DuoBaoQiBing_MonsterFastID[ObjectMapID] = {}
	DuoBaoQiBing_MonsterTileX[ObjectMapID] = {}
	DuoBaoQiBing_MonsterTileY[ObjectMapID] = {}
	local GoToMapNum = 0
	local CitadelTable = DuoBaoQiBing_DiTuDingYi[1]
	--判断队伍中等级最高的玩家
	local ActorExpLv1 = 0
	local ActorExpLv2 = 0
	local MapID = API_GetActorMapID(ActorID)
	local TeamID = API_GetTeamID(ActorID)
	if TeamID > 0 then
		local TeamSize = API_GetTeamSize(TeamID)
		for i = 1,TeamSize do
			local TeamActorID = API_GetTeamMem(TeamID,i)
			if API_ActorIsOnline(TeamActorID) then
				if API_ActorGetGoodsNum(TeamActorID,GoodsID) > 0 and MapID == API_GetActorMapID(TeamActorID) then
					if i == 1 then
						ActorExpLv1 = API_GetActorExpLevel(TeamActorID)
					end
						ActorExpLv2 = API_GetActorExpLevel(TeamActorID)
					if ActorExpLv1 < ActorExpLv2 then
						ActorExpLv1 = ActorExpLv2
					end	
					GoToMapNum = GoToMapNum + 1
				end
			end			
		end
	else
		ActorExpLv1 = API_GetActorExpLevel(ActorID)
		GoToMapNum = 1
	end
	--设置难度
	if ActorExpLv1 <= 25 then
		NanDu = 1
	elseif ActorExpLv1 <= 40 then
		NanDu = 2
	elseif ActorExpLv1 <= 50 then
		NanDu = 3
	else
		NanDu = 4
	end	
	if GoToMapNum == 0 then	
		GoToMapNum = 1
		--API_Trace('进入地图人数为0')
	end
	--创建怪物
	local MonsterNum = localtable_DuoBaoQiBing_Number[GoToMapNum]
	local ShuaGuaiNum = math.floor(MonsterNum/5)
	for j = 1,5 do
		for i = 1, ShuaGuaiNum do
			local a = math.random(3)
			local MonsterID = localtable_DuoBaoQiBing_Monster[a][NanDu]
			local TileX = localtable_DuoBaoQiBing_ShuaGuaiDian[j].TileX
			local TileY = localtable_DuoBaoQiBing_ShuaGuaiDian[j].TileY
			local FastID = API_CreateMonster(ObjectMapID,MonsterID,TileX,TileY,4,0,2)
			DuoBaoQiBing_MapInfoTable[ObjectMapID].number = DuoBaoQiBing_MapInfoTable[ObjectMapID].number + 1
			DuoBaoQiBing_MonsterFastID[ObjectMapID][DuoBaoQiBing_MapInfoTable[ObjectMapID].number] = FastID
			DuoBaoQiBing_MonsterTileX[ObjectMapID][DuoBaoQiBing_MapInfoTable[ObjectMapID].number] = TileX
			DuoBaoQiBing_MonsterTileY[ObjectMapID][DuoBaoQiBing_MapInfoTable[ObjectMapID].number] = TileY
		end
	end
	--创建NPC
	if type(CitadelTable.NPC) == 'table' then
		for j = 1,table.getn(CitadelTable.NPC) do
			 local NPCTable = CitadelTable.NPC[j]
			 local NPCID = NPCTable.NPCID
			 if type(NPCTable.NPCID) == 'table' then
				NPCID = NPCTable.NPCID[0]
			 end
			 
			 local Direct = NPCTable.Direct
			 if Direct == nil then
				Direct = 0
			 end
			 
			 local AIInfoID = NPCTable.AIInfoID
			 if AIInfoID == nil then
				AIInfoID = 0
			 end
			 
			 local Camp = NPCTable.Camp
			 if Camp == nil then
				Camp = -1
			 end
			local FastID = API_CreateMonster(ObjectMapID,NPCID,NPCTable.TileX,NPCTable.TileY,Direct,AIInfoID,Camp)--创建怪物
		end
	end
	
	DuoBaoQiBing_PlayGotoMap(ObjectMapID,ActorID)
	--创建时间触发器
	local TimeTriggerGID = API_CreateTimerTriggerG(ObjectMapID,ActorID,1,-1,'DuoBaoQiBing_Main_TimerTriggerCallFunc')
	DuoBaoQiBing_MapInfoTable[ObjectMapID].TimeTriggerGID = TimeTriggerGID
end

--传送玩家至副本
function DuoBaoQiBing_PlayGotoMap(ObjectMapID,ActorID)
	local TileX=132
	local TileY=194
	if not API_MapIsValid(ObjectMapID) then
		return
	end
	if API_ActorIsOnline(ActorID) then
		local MapID = API_GetActorMapID(ActorID)
		--判断组队
		local TeamID = API_GetTeamID(ActorID)
		if TeamID > 0 then
			local TeamSize = API_GetTeamSize(TeamID)
			for i = 1,TeamSize do
				local TeamActorID = API_GetTeamMem(TeamID,i)
				if API_ActorIsOnline(TeamActorID) and MapID == API_GetActorMapID(TeamActorID) then
					if API_ActorGetGoodsNum(TeamActorID,GoodsID) > 0 and API_ActorRemoveGoods(TeamActorID,GoodsID,1,'使用夺宝奇兵卷轴') then--销毁玩家身上的物品
						API_VarDataSetNumber(TeamActorID,0,12743,4)
						API_ActorGoToMap(TeamActorID,ObjectMapID,TileX,TileY)
						API_VarDataSetNumber(TeamActorID,1,30283,0)
						API_VarDataSetNumber(TeamActorID,1,30281,0)
						local Num = API_VarDataGetNumber(TeamActorID,1,30282)
						Num = Num + 1
						API_VarDataSetNumber(TeamActorID,1,30282,Num)
						--周排名
						MLB_DaoJuShiYong(TeamActorID,7,1,0,0,0)
						--总排名
						MLB_DaoJuShiYong(TeamActorID,8,1,0,0,0)
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						if GLOBAL_FengXiangBiao_DateList[48][1][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[48][1][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[48][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][1][LaiYuan] + 1
						end
					end
				end
			end
		else
			if API_ActorGetGoodsNum(ActorID,GoodsID) > 0 and API_ActorRemoveGoods(ActorID,GoodsID,1,'使用夺宝奇兵卷轴') then--销毁玩家身上的物品
				API_VarDataSetNumber(ActorID,0,12743,4)
				API_ActorGoToMap(ActorID,ObjectMapID,TileX,TileY)
				API_VarDataSetNumber(ActorID,1,30283,0)
				API_VarDataSetNumber(ActorID,1,30281,0)
				local Num = API_VarDataGetNumber(ActorID,1,30282)
				Num = Num + 1
				API_VarDataSetNumber(ActorID,1,30282,Num)
				--周排名
				MLB_DaoJuShiYong(ActorID,7,1,0,0,0)
				--总排名
				MLB_DaoJuShiYong(ActorID,8,1,0,0,0)
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[48][1][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[48][1][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[48][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][1][LaiYuan] + 1
				end
			end
		end
	end
end

if API_GetServerID() == 1 then
	--创建时间触发器
	local TimeTriggerGID = API_CreateTimerTriggerG(0,0,60,-1,'DuoBaoQiBing_ShuJuQingChu')	
end

--清除全局交互数据
function DuoBaoQiBing_ShuJuQingChu(Param1,Param2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	local NowTime = os.time()
	--设置奖励上限数量
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6004,1,5) and API_GetServerID() == 1 then
		API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,1,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,2,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,3,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,4,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,5,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,6,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,7,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,8,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6019,1,4,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6019,1,5,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6019,1,6,0)
		API_VarDataSetNumber_Ex_Sync(1,0,-6019,1,12,0)
		local NowTime = os.date("*t", os.time()) 
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 2 
		NowTime.min = 59 
		NowTime.sec = 59 
		local NightTime = os.time(NowTime)
		local NextQingChuTime = NightTime + 86400 + 1
		API_VarDataSetNumber_Ex_Sync(1,0,-6004,1,5,NextQingChuTime)
		local JiangLiMax = math.random(25,29)--随机稀有奖励上限
		API_VarDataSetNumber_Ex_Sync(1,0,-6008,1,1,JiangLiMax)
	end
	if NowTime > API_VarDataGetNumber_Ex(1,0,-6004,1,4) and API_GetServerID() == 1 then
		local DayTime = 0
		if Week < 5 then
			DayTime = (5 - Week) * 86400
		elseif Week == 5 then
			DayTime = 7 * 86400
		elseif Week == 6 then
			DayTime = 6 * 86400
		elseif Week == 7 then	
			DayTime = 5 * 86400		
		end
		local NowTime = os.date("*t", os.time()) 
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 2 
		NowTime.min = 59 
		NowTime.sec = 59 
		local NightTime = os.time(NowTime) 
		local NextTime = NightTime + DayTime + 1
		if API_VarDataGetNumber_Ex(1,0,-6003,1,9) >= 2 then
			API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,9,3)
		else
			API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,9,2)
		end   
		API_VarDataSetNumber_Ex_Sync(1,0,-6004,1,4,NextTime)--下次每周清除时间
	end

	--设置奖励时段
	if Hour >= 2 and Hour < 8 and API_GetServerID() == 1 then
		API_VarDataSetNumber_Ex_Sync(1,0,-6005,1,1,0)		
	else
		API_VarDataSetNumber_Ex_Sync(1,0,-6005,1,1,1)	
	end
end

--时间回调函数
function DuoBaoQiBing_Main_TimerTriggerCallFunc(ObjectMapID,ActorID)
	DuoBaoQiBing_MapInfoTable[ObjectMapID].Time = DuoBaoQiBing_MapInfoTable[ObjectMapID].Time - 1
	local DuoBaoQiBingTime = '夺宝奇兵剩余时间'.. DuoBaoQiBing_MapInfoTable[ObjectMapID].Time ..'秒\n'
	if DuoBaoQiBing_MapInfoTable[ObjectMapID].Time > 0 then
		API_ActorBroadcastMsg(ObjectMapID,4,DuoBaoQiBingTime)
	else
		API_ActorBroadcastMsg(ObjectMapID,4,'时间已到')
	end
	DuoBaoQiBing_MapInfoTable[ObjectMapID].TimeStart = DuoBaoQiBing_MapInfoTable[ObjectMapID].TimeStart + 1
	if DuoBaoQiBing_MapInfoTable[ObjectMapID].Time > 0 then
		if math.mod(DuoBaoQiBing_MapInfoTable[ObjectMapID].TimeStart,30) == 0 then
			for i = 1,table.getn(DuoBaoQiBing_MonsterFastID[ObjectMapID]) do
				local MonsterID = API_GetMonsterID(DuoBaoQiBing_MonsterFastID[ObjectMapID][i])
				--DuoBaoQiBing_MapInfoTable[ObjectMapID].number
				if MonsterID <= 0 then
					local a = math.random(3)
					local MonsterID = localtable_DuoBaoQiBing_Monster[a][NanDu]
					local TileX = DuoBaoQiBing_MonsterTileX[ObjectMapID][i]
					local TileY = DuoBaoQiBing_MonsterTileY[ObjectMapID][i]
					local FastID = API_CreateMonster(ObjectMapID,MonsterID,TileX,TileY,4,0,2)
					DuoBaoQiBing_MonsterFastID[ObjectMapID][i] = FastID
				end		
			end
		end
	end
	
	
    --时间结束	
	if DuoBaoQiBing_MapInfoTable[ObjectMapID].Time == 0 then
		API_CreateTimerTriggerG(ObjectMapID,0,5,1,'DuoBaoQiBing_Close')
	end
end

--开宝箱
function DuoBaoQiBing_KaiBaoXiang(ActorID,NPCID)
	if API_VarDataGetNumber(ActorID,1,30283) ~= 3 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<text>开启宝藏可以获得各种奖励道具，快试试运气吧！</text><br>')
		API_ResponseWrite('<br><a href="DuoBaoQiBing_KaiBaoXiang_Title?1=200">打开宝箱</a><br>')
		API_ResponseWrite('<br><a>等会打开</a><br>')
	else
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<text>您已经开启过一个宝藏了，每个玩家只能开启一个宝藏！</text><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
	end
end


function DuoBaoQiBing_KaiBaoXiang_Title()
local ActorID = API_RequestGetActorID()
local MapID = API_GetActorMapID(ActorID)--获得玩家当前所在地图ID
local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time() 
	if API_GetMonsterID(NPCFastID) ~= 12258 then
		return
	end
	
	if API_GetStaticMapID(MapID) ~= 2020 then
		return
	end
		if API_VarDataGetNumber(ActorID,1,30283) ~= 3 then
			if NPCFastID ~= nil then
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[48][8][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[48][8][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[48][8][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][8][LaiYuan] + 1
				end
				local TileX = API_GetMonsterPosX(NPCFastID);
				local TileY = API_GetMonsterPosY(NPCFastID);
				API_VarDataSetNumber(ActorID,1,30283,1)--开宝箱标志		
				API_DestroyMonster(NPCFastID)
				local FastID = API_CreateMonster(MapID,12259,TileX,TileY,1,0,-1)--创建打开宝箱
				local GoodTable = localtable_DuoBaoQiBing_Goods
				local GoodsId = 0
				local Num = 0
				local Flag = 0
				local Odds = 0
				local PinZhi = 0
				local ShangXian = 0
				local number = math.random(10000)
				local i = 1
				--判断奖励类型
				local NowTime = os.time()
				local CDTime1 = API_VarDataGetNumber_Ex(1,0,-6004,1,1)--三类奖励CD时间
				local CDTime2 = API_VarDataGetNumber_Ex(1,0,-6004,1,2)--二类奖励CD时间	
				local CDTime3 = API_VarDataGetNumber_Ex(1,0,-6004,1,3)--黄金石CD时间
				local KaiFangTime = API_VarDataGetNumber_Ex(1,0,-6005,1,1)
				local DuoBaoNum = API_VarDataGetNumber(ActorID,1,30282)
				local Odds = 200
				if Week == 6 or Week == 7 then
					if Hour >= 14 and Hour <= 16 then
						Odds = 500
					elseif Hour >= 19 and Hour <= 21 then
						Odds = 500
					end
				else
					if Hour >= 13 and Hour <= 14 then
						Odds = 500
					elseif Hour >= 19 and Hour <= 21 then
						Odds = 500
					end
				end
				if DuoBaoNum < 50 then
					if number <= Odds + DuoBaoNum*100 then
						if KaiFangTime == 1 then
							i = 3
						end
					end
				else
					if number <= 5000 then
						if KaiFangTime == 1  then
							i = 3
						end
					end
				end
				
				if i == 3 then
					local j = math.random(table.getn(GoodTable[i]))
					GoodsId = GoodTable[i][j].GoodsID
					Num = GoodTable[i][j].Num
					Flag = GoodTable[i][j].Bind
					PinZhi = GoodTable[i][j].PinZhi
					ShangXian = GoodTable[i][j].Max
					BiaoZhi = GoodTable[i][j].BiaoZhi
				end
				local JiangLiNum1 = API_VarDataGetNumber_Ex(1,0,-6003,1,1)--幻彩之鱼卡片
				local JiangLiNum2 = API_VarDataGetNumber_Ex(1,0,-6003,1,2)--超级宝石
				local JiangLiNum3 = API_VarDataGetNumber_Ex(1,0,-6003,1,3)--3洞装备
				local JiangLiNum4 = API_VarDataGetNumber_Ex(1,0,-6003,1,4)--昆虫保姆车卡
				local JiangLiNum5 = API_VarDataGetNumber_Ex(1,0,-6003,1,5)--悍马装甲车卡片
				local JiangLiNum6 = API_VarDataGetNumber_Ex(1,0,-6003,1,6)--兔斯基私车卡片
				local JiangLiNum7 = API_VarDataGetNumber_Ex(1,0,-6003,1,7)--足球宝宝卡
				local JiangLiNum8 = API_VarDataGetNumber_Ex(1,0,-6003,1,8)--英雄残卷	
				local JiangLiNum9 = API_VarDataGetNumber_Ex(1,0,-6003,1,9)--异世界飞碟卡					
				local JiangLiZhongShu = JiangLiNum1 + JiangLiNum2 + JiangLiNum3 + JiangLiNum4 + JiangLiNum5 + JiangLiNum6 + JiangLiNum7 + JiangLiNum8
				--当前点奖励上限判断
				local JiangLiMax = localtable_DuoBaoQiBing_ShiJianJiangLiMax[Hour]
--				local JiangLiMax1 = localtable_DuoBaoQiBing_ShiJianJiangLiMax[Hour]
--				local JiangLiMax2 = API_VarDataGetNumber_Ex(1,0,-6008,1,1)
--				if JiangLiMax2 == 0 then
--					JiangLiMax2 = 29
--				end
--				if JiangLiMax1 > JiangLiMax2 then
--					JiangLiMax = JiangLiMax2
--				else
--					JiangLiMax = JiangLiMax1
--				end
				if JiangLiMax <= 0 then
					JiangLiMax = 32
				end
				if i == 3  then
					if JiangLiZhongShu < JiangLiMax then
						if BiaoZhi == 1 then --悍马
							if JiangLiNum5 >= ShangXian then
								i = 1
							end
						elseif BiaoZhi == 2 then--兔斯基
							if JiangLiNum6 >= ShangXian then
								i = 1
							end
						elseif BiaoZhi == 3 then--足球宝宝
							if JiangLiNum7 >= ShangXian then
								i = 1
							end
						elseif BiaoZhi == 4 then--幻彩
							if JiangLiNum1 >= ShangXian then
								i = 1
							end
						elseif BiaoZhi == 5 then--三洞
							if JiangLiNum3 >= ShangXian then
								i = 1
							end
						elseif BiaoZhi == 6 then--飞碟
							if JiangLiNum9 <= 0 then
								i = 1
							end
							if Hour <= 12 or Hour >= 23 then
								i = 1
							end
						elseif BiaoZhi == 7 then--宝石
							if JiangLiNum2 >= ShangXian then
								i = 1
							end
						elseif BiaoZhi == 8 then--残卷
							if JiangLiNum8 >= ShangXian then
								i = 1
							end
						elseif BiaoZhi == 9 then--五彩筋斗云
							local CD_WuCai = API_VarDataGetNumber_Ex(1,0,-6004,1,1)
							local NowTime = os.time()
							if CD_WuCai >= NowTime then
								i = 1
							end
						end
					else
						i = 1
					end
				end
				
				if Week == 4 and Hour > 12 and Hour < 23 then
					if JiangLiNum9 >= 2 and DuoBaoNum >= 20 then
						if number > 2000 then
							i = 3
							GoodsId = 32021
							Num = 1
							Flag = 0
							PinZhi = 0
						end
					end
				end
				--判断周年金币产出是否在活动之内
				if i == 4 then
					local Goldtest_wb_StartTime = API_DiffDatatime(Goldtest_wb_StartTimeTab.Year,Goldtest_wb_StartTimeTab.Month,Goldtest_wb_StartTimeTab.Day,Goldtest_wb_StartTimeTab.Hour,Goldtest_wb_StartTimeTab.Minute,Goldtest_wb_StartTimeTab.Second)
					local Goldtest_wb_EndTime= API_DiffDatatime(Goldtest_wb_EndTimeTab.Year,Goldtest_wb_EndTimeTab.Month,Goldtest_wb_EndTimeTab.Day,Goldtest_wb_EndTimeTab.Hour,Goldtest_wb_EndTimeTab.Minute,Goldtest_wb_EndTimeTab.Second)
					if  Goldtest_wb_StartTime > 0 or Goldtest_wb_EndTime < 0 then
						i = 1
					end
				end
				local NowPoint = 0
				if i == 1 then
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					if GLOBAL_FengXiangBiao_DateList[48][2][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[48][2][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[48][2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][2][LaiYuan] + 1
					end
					local Lv = API_GetActorPeerageLevel(ActorID)
					if Lv <= 3 then
						local j = math.random(table.getn(GoodTable[2][1]))
						GoodsId = GoodTable[2][1][j].GoodsID
						Num = GoodTable[2][1][j].Num
						Flag = GoodTable[2][1][j].Bind
						PinZhi = GoodTable[2][1][j].PinZhi
						if PinZhi == 7 then
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[48][5][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[48][5][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[48][5][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][5][LaiYuan] + 1
							end
						end
					elseif Lv <= 5 then
						local j = math.random(table.getn(GoodTable[2][2]))
						GoodsId = GoodTable[2][2][j].GoodsID
						Num = GoodTable[2][2][j].Num
						Flag = GoodTable[2][2][j].Bind
						PinZhi = GoodTable[2][2][j].PinZhi
						if PinZhi == 7 then
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[48][6][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[48][6][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[48][6][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][6][LaiYuan] + 1
							end
						end
					else
						local j = math.random(table.getn(GoodTable[2][3]))
						GoodsId = GoodTable[2][3][j].GoodsID
						Num = GoodTable[2][3][j].Num
						Flag = GoodTable[2][3][j].Bind
						PinZhi = GoodTable[2][3][j].PinZhi
						if PinZhi == 7 then
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[48][7][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[48][7][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[48][7][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][7][LaiYuan] + 1
							end
						end
					end
					local Number = math.random(10000)
					if Number < 5000 then
						API_CreateDropGoodsEx(MapID,TileX,TileY-3,GoodsId,Num,Flag,'获得宝藏',4,ActorID,600,60,PinZhi)
					end
					for k = 1,table.getn(GoodTable[i]) do				
						local j = math.random(table.getn(GoodTable[i]))
						GoodsId = GoodTable[i][j].GoodsID
						Num = GoodTable[i][j].Num
						Flag = GoodTable[i][j].Bind
						PinZhi = GoodTable[i][j].PinZhi
						local Point = GoodTable[i][j].Point
						NowPoint = NowPoint + Point
						if GoodsId == 89126 then
							local nShiFouStart = API_DiffDatatime(LC_PeiHeHuoDong_StartTime.Year,LC_PeiHeHuoDong_StartTime.Month,LC_PeiHeHuoDong_StartTime.Day,LC_PeiHeHuoDong_StartTime.Hour,LC_PeiHeHuoDong_StartTime.Minute,LC_PeiHeHuoDong_StartTime.Second)
							local nShiFouEnd = API_DiffDatatime(LC_PeiHeHuoDong__EndTime.Year,LC_PeiHeHuoDong__EndTime.Month,LC_PeiHeHuoDong__EndTime.Day,LC_PeiHeHuoDong__EndTime.Hour,LC_PeiHeHuoDong__EndTime.Minute,LC_PeiHeHuoDong__EndTime.Second)
							if nShiFouStart > 0 or nShiFouEnd < 0 then
								GoodsId = 80274
							end
						end
						API_CreateDropGoods(MapID,TileX,TileY-3,GoodsId,Num,Flag,'获得宝藏',0,ActorID,600,60)
						if NowPoint > 400 then
							return
						end
					end
				end
				
				if i == 4 then
					API_CreateDropGoods(MapID,TileX,TileY-3,GoodsId,Num,Flag,'获得宝藏',0,ActorID,600,60)
					local Time = os.time()
					local Tsec = math.random(10,20)					
					local NextTime = Time + Tsec
					API_VarDataSetNumber_Ex_Sync(1,0,-6004,1,3,NextTime)
					return
				end

				if i == 3 then
					if PinZhi > 0 then
						if BiaoZhi == 5 and JiangLiNum3 < ShangXian then
							JiangLiNum3 = JiangLiNum3 + 1
							API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,3,JiangLiNum3)
							API_VarDataSetNumber(ActorID,1,30282,0)
							
							local Lv = API_GetActorExpLevel(ActorID)
							if Lv <= 40 then
								local j = math.random(table.getn(GoodTable[5]))
								GoodsId = GoodTable[5][j].GoodsID
								Num = GoodTable[5][j].Num
								Flag = GoodTable[5][j].Bind
								PinZhi = GoodTable[5][j].PinZhi
							end
							
							API_CreateDropGoodsEx(MapID,TileX,TileY-3,GoodsId,Num,Flag,'获得宝藏',4,ActorID,600,60,PinZhi)
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在夺宝奇兵中获得了高附加属性3洞的'..API_GetGoodsName(GoodsId)..'')
							local Time = os.time()
							local Tsec = math.random(300,900)
							local NextTime = Time + Tsec
							API_VarDataSetNumber_Ex_Sync(1,0,-6004,1,1,NextTime)
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[48][9][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[48][9][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[48][9][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][9][LaiYuan] + 1
							end
							return 
						end
					else
						if BiaoZhi == 4 and JiangLiNum1 < ShangXian then--幻彩之鱼
							JiangLiNum1 = JiangLiNum1 + 1
							API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,1,JiangLiNum1)
							API_VarDataSetNumber(ActorID,1,30282,0)
							API_CreateDropGoods(MapID,TileX,TileY-3,GoodsId,Num,Flag,'获得宝藏',0,ActorID,600,60)
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在夺宝奇兵中获得了'..API_GetGoodsName(GoodsId)..'') 
							local Time = os.time() 
							local Tsec = math.random(300,900)
							local NextTime = Time + Tsec
							API_VarDataSetNumber_Ex_Sync(1,0,-6004,1,1,NextTime)
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] + 1
							end
							return 
						elseif BiaoZhi == 1  and JiangLiNum5 < ShangXian then--悍马装甲车
							JiangLiNum5 = JiangLiNum5 + 1							
							API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,5,JiangLiNum5)
							API_VarDataSetNumber(ActorID,1,30282,0)
							API_CreateDropGoods(MapID,TileX,TileY-3,GoodsId,Num,Flag,'获得宝藏',0,ActorID,600,60)
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在夺宝奇兵中获得了'..API_GetGoodsName(GoodsId)..'')
							local Time = os.time() 
							local Tsec = math.random(300,900)
							local NextTime = Time + Tsec
							API_VarDataSetNumber_Ex_Sync(1,0,-6004,1,1,NextTime)
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] + 1
							end
							return							
						elseif BiaoZhi == 2  and JiangLiNum6 < ShangXian then--兔斯基私车卡
							JiangLiNum6 = JiangLiNum6 + 1							
							API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,6,JiangLiNum6)
							API_VarDataSetNumber(ActorID,1,30282,0)
							API_CreateDropGoods(MapID,TileX,TileY-3,GoodsId,Num,Flag,'获得宝藏',0,ActorID,600,60)
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在夺宝奇兵中获得了'..API_GetGoodsName(GoodsId)..'')
							local Time = os.time() 
							local Tsec = math.random(300,900)
							local NextTime = Time + Tsec
							API_VarDataSetNumber_Ex_Sync(1,0,-6004,1,1,NextTime)
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] + 1
							end
							return
						elseif BiaoZhi == 3  and JiangLiNum7 < ShangXian then--足球宝宝卡
							JiangLiNum7 = JiangLiNum7 + 1							
							API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,7,JiangLiNum7)
							API_VarDataSetNumber(ActorID,1,30282,0)
							API_CreateDropGoods(MapID,TileX,TileY-3,GoodsId,Num,Flag,'获得宝藏',0,ActorID,600,60)
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在夺宝奇兵中获得了'..API_GetGoodsName(GoodsId)..'')
							local Time = os.time() 
							local Tsec = math.random(300,900)
							local NextTime = Time + Tsec
							API_VarDataSetNumber_Ex_Sync(1,0,-6004,1,1,NextTime)
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] + 1
							end
							return
						elseif BiaoZhi == 6  and JiangLiNum9 > 0 then--异世界飞碟
							JiangLiNum9 = JiangLiNum9 - 1							
							API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,9,JiangLiNum9)
							API_VarDataSetNumber(ActorID,1,30282,0)
							API_CreateDropGoods(MapID,TileX,TileY-3,GoodsId,Num,Flag,'获得宝藏',0,ActorID,600,60)
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在夺宝奇兵中获得了'..API_GetGoodsName(GoodsId)..'')
							local Time = os.time() 
							local Tsec = math.random(300,900)
							local NextTime = Time + Tsec
							API_VarDataSetNumber_Ex_Sync(1,0,-6004,1,1,NextTime)
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] + 1
							end
							return		
						elseif BiaoZhi == 7 then
							JiangLiNum2 = JiangLiNum2 + 1
							API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,2,JiangLiNum2)
							API_VarDataSetNumber(ActorID,1,30282,0)
							API_CreateDropGoods(MapID,TileX,TileY-3,GoodsId,Num,Flag,'获得宝藏',0,ActorID,600,60)
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在夺宝奇兵中获得了'..API_GetGoodsName(GoodsId)..'')
							local Time = os.time() 
							local Tsec = math.random(300,900)
							local NextTime = Time + Tsec
							API_VarDataSetNumber_Ex_Sync(1,0,-6004,1,1,NextTime)
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] + 1
							end
							return 							
						elseif BiaoZhi == 8 then
							JiangLiNum8 = JiangLiNum8 + 1
							API_VarDataSetNumber_Ex_Sync(1,0,-6003,1,8,JiangLiNum8)
							API_VarDataSetNumber(ActorID,1,30282,0)
							API_CreateDropGoods(MapID,TileX,TileY-3,GoodsId,Num,Flag,'获得宝藏',0,ActorID,600,60)
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在夺宝奇兵中获得了'..API_GetGoodsName(GoodsId)..'')
							local Time = os.time() 
							local Tsec = math.random(300,900)
							local NextTime = Time + Tsec
							API_VarDataSetNumber_Ex_Sync(1,0,-6004,1,1,NextTime)	
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							if GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = 1
							else
								GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] = GLOBAL_FengXiangBiao_DateList[48][4][LaiYuan] + 1
							end
							return
						elseif BiaoZhi == 9 then	
							API_VarDataSetNumber(ActorID,1,30282,0)
							API_CreateDropGoods(MapID,TileX,TileY-3,GoodsId,Num,Flag,'获得宝藏',0,ActorID,600,60)
							API_ActorBroadcastMsg(-1,17,''..API_GetActorName(ActorID)..'在夺宝奇兵中获得了'..API_GetGoodsName(GoodsId)..'')
							local Time = os.time() 
							local NextTime = Time + 259200
							API_VarDataSetNumber_Ex_Sync(1,0,-6004,1,1,NextTime)	
							return							
						end					
					end				
				end
			end
		end
		--API_ResponseClear()
		--API_ResponseEnd()
end

--夺宝奇兵封印之柱
function DuoBaoQiBing_ChuanSongMen(ActorID,NPCID)
	if API_VarDataGetNumber(ActorID,1,30281) ~= 1 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<text>您确定要进入宝藏区吗？进入宝藏区之后将不能再返回闯关通道.</text><br>')
		API_ResponseWrite('<br><a href="DuoBaoQiBing_ChuanSongMen_Title?1=300">现在进入</a><br>')
		API_ResponseWrite('<br><a>等会进入</a><br>')
	else
		API_ResponseClear()
		API_ResponseEnd()
	end
end

--时间结束后创建夺宝奇兵传送门
function DuoBaoQiBing_ChuanSongMen_Title()
local TileX = 105
local TileY = 81
local ActorID = API_RequestGetActorID()
local MapID = API_GetActorMapID(ActorID)--获得玩家当前所在地图ID
	if API_VarDataGetNumber(ActorID,1,30281) ~= 1 then
		API_VarDataSetNumber(ActorID,1,30281,1)
		API_ActorGoToMap(ActorID,MapID,TileX,TileY)
	end
end

--关闭副本
function DuoBaoQiBing_Close(MapID,Param2)
	for i = 1,table.getn(DuoBaoQiBing_MonsterFastID[MapID]) do
	    local MonsterID = API_GetMonsterID(DuoBaoQiBing_MonsterFastID[MapID][i])
		if MonsterID > 0 then
			API_DestroyMonster(DuoBaoQiBing_MonsterFastID[MapID][i])
		end
	end
	DuoBaoQiBing_MapInfoTable[MapID].TimeOut = 1
	local TriggerID = DuoBaoQiBing_MapInfoTable[MapID].TimeTriggerGID
	API_DestroyTriggerG(TriggerID)
end