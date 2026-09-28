--变量部分
local nengliangyuan = 80946  --能量源 在天空都市每分钟消耗的
local nengliangyuannum =  1 --每次掉落的能量源数量
local nengliangyuansuijilv = 80 --能量源掉率

local feitingguanliyuanid = 12307 --光明遗迹飞艇管理员ID
local feitingguanliyuanid2 = 12317 --遗迹都市的飞艇管理员ID
--光明遗迹飞艇管理员坐标
local feitingguanliyuanX = 582
local feitingguanliyuanY = 382
--天空城联邦飞艇管理员坐标
local LB_feitingguanliyuanX = 415
local LB_feitingguanliyuanY = 190
--天空城帝国飞艇管理员坐标
local DG_feitingguanliyuanX = 518
local DG_feitingguanliyuanY = 187

local feitingxiaohaodejinbi = 10000 --飞艇消耗的金币 
local yijidushibegintime = 10 --遗迹都市可进入时间
local yijidushiovertime = 24 --遗迹都市关闭时间
local yijidushiovertime2 = 23 --24点关闭 23点40开始禁止进入 
local yijidushiovertime3 = 40
local yijidushilvneed = 52
local nengliangyuanmin = 20 --进入上面最少的能量源数量 10-20个

local yijidushipeizhimapid = 130 --遗迹之城的配置地图ID
local yijidushilianbangx = 415 --联邦进入坐标X
local yijidushilianbangy = 182 --联邦进入坐标Y
local yijidushidiguox = 524 --帝国进入坐标X
local yijidushidiguoy = 181 --帝国进入坐标Y

local jingyuankapaiid = 80949 --卡牌ID
local jingyuankapainum = 20	--卡牌数量
local jingyuanduihuanguanid = 12321 --卡牌兑换官ID
local yijidushishenmikongjian = 2030 --牌子打BOSS地方的配置地图ID
local yijidushishenmikongjianX = 88 --神秘空间传入点X
local yijidushishenmikongjianY = 58	--神秘空间传入点Y

local qianxianzhihuiguan1 = 12318 --前线指挥官ID
local qianxianzhihuiguan2 = 12319
local qianxianzhihuiguan3 = 12320
local qianxianzhihuiguan4 = 12331
local qianxianzhihuiguan5 = 12332
local chongche1 = 904009
local chongche2 = 904010

local jixiewulibing56 = 901056
local jixiehuoyaobing56 = 902056
local jixiemofabing56 = 903056
local jyjixiewulibing57 = 905001
local jyjixiehuoyaobing57 = 905007
local jyjixiemofabing57 = 905011
--巡逻队
local jixiewulibing58 = 901058
local jixiehuoyaobing58 = 902058
local jixiemofabing58 = 903058
local jyjixiewulibing58 = 905019
local jyjixiehuoyaobing58 = 905020

local chengmenwulishouwei58 = 904011
local chengmenhuoyaoshouwei58  = 904015
local chengmenmofashouwei58 = 904019
local jychengmenwulishouwei58 = 905015
local jychengmenhuoyaoshouwei58 = 905016
local jychengmenmofashouwei58 = 905017

local chengmen = 12301 --可以被攻击的城门
local chengmenzhanwei = 12311 --可以被攻击的占位块
local jixiepao = 906005 --BOSS机械炮
local bingying = 12303 --不可以被攻击的兵营

local lianbangquchuchufaqiX = 417 --联邦区域触发器X坐标
local lianbangquchuchufaqiY = 303 --联邦区域触发器Y坐标
local diguoquchuchufaqiX = 506 --帝国区域触发器X坐标
local diguoquchuchufaqiY = 303 --帝国区域触发器Y坐标

local jinshuid = 80947 --金属ID
local jinshunum = 1 --兑换冲车所需要的金属数量
local feijiujinshuID = 80948 --废旧金属ID
local feijiujinshukuaishu = 1 --兑换冲车所需要的废旧金属数量

local jixiewulibing60 = 901060
local jixiehuoyaobing60 = 902060
local jixiemofabing60 = 903060
local jyjixiewulibing60 = 905002
local jyjixiehuoyaobing60 = 905008
local jyjixiemofabing60 = 905012

local jyjixiewulibing61 = 905003
local jyjixiehuoyaobing61 = 905009
local jixiebuxuebing60 = 904001

local jyjixiewulibing62 = 905004
local jyjixiehuoyaobing62 = 905010
local jyjixiemofabing62 = 905014

local dushiguangchangBoss1 = 906011	
local dushiguangchangBoss2 = 906012
local dushiguangchangBoss3 = 906013

local chengmen2 = 12302 --不可以被攻击的城门
local chengmen2zhanwei = 12312 -- 不可以被攻击的占位块
local jixiezhiyaqi = 12306

local jixiebuxuebingpc62 = 904008
local jixiewulibingpc62 = 904005
local jixiehuoyaobingpc62 = 904006
local jixiemofabingpc62 = 904007

local jixiewulibingdanti62 = 901162
local jixiekongzhimofabing62 = 903162
local jyjixiewulibingdanti63 = 905005

local jixiewulibingqunti63 = 901263
local jixieyiliaomofabing63 = 903163
local jyjixiewulibingqunti64 = 905006

local jixiepaobing64 = 904004
local jixiehuoyaojituibing64 = 902164
local jyjixiepaobing65 = 905018

local jiangjun = 906014
local bingying2 = 12304
local bingying3 = 12305
local chengmen3 = 12325
local chengmen4 = 12326

local jixiewulibingdanti65 = 901265
local jixiekongzhimofabing65 = 903165
local jixiewulibingqunti65 = 901165
local jixieyiliaomofabing65 = 904003
local jixiepaobing65 = 904021
local jixiehuoyaojituibing65 = 902165
--镜像怪ID
local jixiewulibing65 = 901165
local jixiehuoyaobing65 = 902165
local jixiemofabing65 = 903165
local jixiebuxuebing65 = 904002
local jingxiangBOSS = 906015 --镜像BOSSID
local chuqudemen = 11607 --镜像出去的门

local OwnerID = -2001 --全局交互数据

local zhihuiguan3x = 451
local zhihuiguan3y = 531

--表部分
--掉落能量源的表
yjdsh_gmyjjingshiguaitable = {901355,9000,8000,
}

--刷新时间表部分
yjdsh_quanqushuaxintimetable = {
[1] = {[1]={n=50,t=90},[2]={n=100,t=75},[3]={n=150,t=50},[4]={n=99999,t=40},}, --联邦练级1区
[2] = {[1]={n=50,t=90},[2]={n=100,t=75},[3]={n=150,t=50},[4]={n=99999,t=40},}, --帝国练级1区
[3] = {[1]={n=50,t=80},[2]={n=100,t=65},[3]={n=150,t=50},[4]={n=99999,t=35},}, --联邦练级2区
[4] = {[1]={n=50,t=80},[2]={n=100,t=65},[3]={n=150,t=50},[4]={n=99999,t=35},}, --帝国练级2区
[5] = {[1]={n=50,t=300},[2]={n=100,t=240},[3]={n=150,t=180},[4]={n=99999,t=120},}, --都市广场
[6] = {[1]={n=50,t=80},[2]={n=100,t=60},[3]={n=150,t=40},[4]={n=99999,t=20},}, --将军1区
[7] = {[1]={n=50,t=80},[2]={n=100,t=60},[3]={n=150,t=40},[4]={n=99999,t=20},}, --将军2区
[8] = {[1]={n=50,t=80},[2]={n=100,t=60},[3]={n=150,t=40},[4]={n=99999,t=20},}, --将军3区
[9] = {[1]={n=50,t=60},[2]={n=100,t=40},[3]={n=150,t=30},[4]={n=99999,t=20},}, --将军4区
[10] = {[1]={n=50,t=80},[2]={n=100,t=60},[3]={n=150,t=40},[4]={n=99999,t=20},}, --联邦城门区
[11] = {[1]={n=50,t=80},[2]={n=100,t=60},[3]={n=150,t=40},[4]={n=99999,t=20},}, --帝国城门区
}

--通过怪物ID做表 在代码中对怪物ID进行+- 产生同种怪 3种等级  刷新地点不随机 刷新区域不随机 刷新等级随机 刷新时间 随机 组不随机
--1-11对应11个区域 3 4 是城门区  11是将军4区
--12是 将军1-3区兵营和门
--13是 牌子进入的区域的怪
yjdsh_1qumonstertable = {
	[jixiewulibing56] = {[1]={x=389,y=201,z=909001,},[2]={x=383,y=215,z=909001,},[3]={x=381,y=230,z=909001,},[4]={x=384,y=245,z=909001,},[5]={x=393,y=261,z=909001,},},
	[jixiehuoyaobing56] = {[1]={x=392,y=203,z=909001,},[2]={x=386,y=216,z=909001,},[3]={x=384,y=230,z=909001,},[4]={x=387,y=244,z=909001,},[5]={x=395,y=259,z=909001,},},
	[jixiemofabing56] = {[1]={x=395,y=205,z=909001,},[2]={x=389,y=217,z=909001,},[3]={x=387,y=230,z=909001,},[4]={x=390,y=243,z=909001,},[5]={x=397,y=257,z=909001,},},
	[jyjixiewulibing57] = {[1]={x=392,y=202,z=909001,lujing=4,xys={392,202,5,385,216,5,384,230,5,385,216,5,},},},
	[jyjixiehuoyaobing57] = {[1]={x=385,y=216,z=909001,lujing=4,xys={385,216,5,384,230,5,386,244,5,384,230,5,},},},
	[jyjixiemofabing57] = {[1]={x=384,y=230,z=909001,lujing=4,xys={384,230,5,386,244,5,395,259,5,386,244,5,},},},
	--巡逻队
	[jyjixiewulibing58] = {[1]={x=392,y=202,z=909001,},[2]={x=384,y=230,z=909001,},[3]={x=395,y=259,z=909001,},},
}
yjdsh_1quxunluoduitable= {
	--巡逻队
	[jyjixiehuoyaobing58] = {[1]={x=390,y=183,z=909001,lujing=1,},},
	[jixiewulibing58] = {[1]={x=391,y=184,z=909001,lujing=1,},},
	[jixiehuoyaobing58] = {[1]={x=390,y=186,z=909001,lujing=1,},},
	[jixiemofabing58] = {[1]={x=389,y=185,z=909001,lujing=1,},},
}
yjdsh_2qumonstertable = {
	[jixiewulibing56] = {[1]={x=544,y=201,z=909001,},[2]={x=550,y=212,z=909001,},[3]={x=554,y=227,z=909001,},[4]={x=552,y=242,z=909001,},[5]={x=547,y=252,z=909001,},[6]={x=538,y=264,z=909001,},},
	[jixiehuoyaobing56] = {[1]={x=547,y=199,z=909001,},[2]={x=553,y=211,z=909001,},[3]={x=557,y=227,z=909001,},[4]={x=555,y=243,z=909001,},[5]={x=550,y=254,z=909001,},[6]={x=540,y=266,z=909001,},},
	[jixiemofabing56] = {[1]={x=549,y=197,z=909001,},[2]={x=556,y=209,z=909001,},[3]={x=560,y=227,z=909001,},[4]={x=558,y=244,z=909001,},[5]={x=553,y=256,z=909001,},[6]={x=542,y=268,z=909001,},},
	[jyjixiewulibing57] = {[1]={x=547,y=200,z=909001,lujing=4,xys={547,200,5,555,215,5,557,236,5,555,215,5,},},},
	[jyjixiehuoyaobing57] = {[2]={x=556,y=219,z=909001,lujing=4,xys={556,219,5,557,236,5,548,257,5,557,236,5,},},},
	[jyjixiemofabing57] = {[1]={x=557,y=236,z=909001,lujing=4,xys={557,236,5,548,257,5,540,266,5,548,257,5,},},},
	--巡逻队
	[jyjixiewulibing58] = {[1]={x=547,y=200,z=909001,},[2]={x=556,y=219,z=909001,},[3]={x=551,y=252,z=909001,},},
}
yjdsh_2quxunluoduitable= {
	--巡逻队
	[jyjixiehuoyaobing58] = {[1]={x=548,y=200,z=909001,lujing=1,},},
	[jixiewulibing58] = {[1]={x=546,y=200,z=909001,lujing=1,},},
	[jixiehuoyaobing58] = {[1]={x=547,y=201,z=909001,lujing=1,},},
	[jixiemofabing58] = {[1]={x=547,y=199,z=909001,lujing=1,},},
}
yjdsh_3qumonstertable = {
	[chengmenwulishouwei58] = {[1]={x=405,y=280,z=909001,},[2]={x=408,y=280,z=909001,},[3]={x=411,y=280,z=909001,},[4]={x=405,y=275,z=909001,},[5]={x=408,y=275,z=909001,},[6]={x=411,y=275,z=909001,},[7]={x=405,y=270,z=909001,},[8]={x=408,y=270,z=909001,},[9]={x=411,y=270,z=909001,},},
	[chengmenmofashouwei58] = {[1]={x=414,y=280,z=909002,},[2]={x=417,y=280,z=909002,},[3]={x=420,y=280,z=909002,},[4]={x=414,y=275,z=909002,},[5]={x=417,y=275,z=909002,},[6]={x=420,y=275,z=909002,},[7]={x=414,y=270,z=909002,},[8]={x=417,y=270,z=909002,},[9]={x=420,y=270,z=909002,},},
	[chengmenhuoyaoshouwei58] = {[1]={x=423,y=280,z=909003,},[2]={x=426,y=280,z=909003,},[3]={x=429,y=280,z=909003,},[4]={x=423,y=275,z=909003,},[5]={x=426,y=275,z=909003,},[6]={x=429,y=275,z=909003,},[7]={x=423,y=270,z=909003,},[8]={x=426,y=270,z=909003,},[9]={x=429,y=270,z=909003,},},
	[jychengmenwulishouwei58] = {[1]={x=411,y=285,z=909001,},},
	[jychengmenmofashouwei58] = {[1]={x=417,y=285,z=909002,},},
	[jychengmenhuoyaoshouwei58] = {[1]={x=423,y=285,z=909003,},},
	[chengmen] = {[1]={x=417,y=295,z=0,},},
	--[chengmenzhanwei] = {[1]={x=411,y=295,z=0,},[2]={x=412,y=295,z=0,},[3]={x=413,y=295,z=0,},[4]={x=414,y=295,z=0,},[5]={x=415,y=295,z=0,},[6]={x=416,y=295,z=0,},[7]={x=417,y=295,z=0,},[8]={x=418,y=295,z=0,},[9]={x=419,y=295,z=0,},[10]={x=420,y=295,z=0,},[11]={x=421,y=295,z=0,},[12]={x=422,y=295,z=0,},[13]={x=423,y=295,z=0,},[14]={x=424,y=295,z=0,},},
	[jixiepao] = {[1]={x=408,y=293,z=0,},[2]={x=427,y=293,z=0,},},
	[bingying] = {[1]={x=413,y=290,z=0,},[2]={x=421,y=290,z=0,},},
}
yjdsh_4qumonstertable = {
	[chengmenwulishouwei58] = {[1]={x=494,y=280,z=909001,},[2]={x=497,y=280,z=909001,},[3]={x=500,y=280,z=909001,},[4]={x=494,y=275,z=909001,},[5]={x=497,y=275,z=909001,},[6]={x=500,y=275,z=909001,},[7]={x=494,y=270,z=909001,},[8]={x=497,y=270,z=909001,},[9]={x=500,y=270,z=909001,},},
	[chengmenmofashouwei58] = {[1]={x=503,y=280,z=909002,},[2]={x=506,y=280,z=909002,},[3]={x=509,y=280,z=909002,},[4]={x=503,y=275,z=909002,},[5]={x=506,y=275,z=909002,},[6]={x=509,y=275,z=909002,},[7]={x=503,y=270,z=909002,},[8]={x=506,y=270,z=909002,},[9]={x=509,y=270,z=909002,},},
	[chengmenhuoyaoshouwei58] = {[1]={x=512,y=280,z=909003,},[2]={x=515,y=280,z=909003,},[3]={x=518,y=280,z=909003,},[4]={x=512,y=275,z=909003,},[5]={x=515,y=275,z=909003,},[6]={x=518,y=275,z=909003,},[7]={x=512,y=270,z=909003,},[8]={x=515,y=270,z=909003,},[9]={x=518,y=270,z=909003,},},
	[jychengmenwulishouwei58] = {[1]={x=500,y=285,z=909001,},},
	[jychengmenmofashouwei58] = {[1]={x=506,y=285,z=909002,},},
	[jychengmenhuoyaoshouwei58] = {[1]={x=512,y=285,z=909003,},},
	[chengmen] = {[1]={x=506,y=295,z=0,},},
	--[chengmenzhanwei] = {[1]={x=500,y=295,z=0,},[2]={x=501,y=295,z=0,},[3]={x=502,y=295,z=0,},[4]={x=503,y=295,z=0,},[5]={x=504,y=295,z=0,},[6]={x=505,y=295,z=0,},[7]={x=506,y=295,z=0,},[8]={x=507,y=295,z=0,},[9]={x=508,y=295,z=0,},[10]={x=509,y=295,z=0,},[11]={x=510,y=295,z=0,},[12]={x=511,y=295,z=0,},[13]={x=512,y=295,z=0,},[14]={x=513,y=295,z=0,},},
	[jixiepao] = {[1]={x=494,y=293,z=0,},[2]={x=516,y=293,z=0,},},
	[bingying] = {[1]={x=502,y=290,z=0,},[2]={x=510,y=290,z=0,},},	
}
yjdsh_5qumonstertable = {
	[jixiewulibing60] = {[1]={x=371,y=387,z=909001,},[2]={x=355,y=393,z=909001,},[3]={x=341,y=404,z=909001,},[4]={x=332,y=420,z=909001,},[5]={x=328,y=437,z=909001,},[6]={x=332,y=455,z=909001,},[7]={x=342,y=470,z=909001,},[8]={x=354,y=480,z=909001,},[9]={x=371,y=486,z=909001,},[10]={x=389,y=487,z=909001,},[11]={x=408,y=487,z=909001,},[12]={x=394,y=464,z=909001,},[13]={x=398,y=446,z=909001,},[14]={x=407,y=431,z=909001,},[15]={x=419,y=421,z=909001,},[16]={x=437,y=414,z=909001,},},
	[jixiehuoyaobing60] = {[1]={x=370,y=384,z=909001,},[2]={x=352,y=390,z=909001,},[3]={x=339,y=402,z=909001,},[4]={x=329,y=419,z=909001,},[5]={x=325,y=437,z=909001,},[6]={x=329,y=456,z=909001,},[7]={x=339,y=472,z=909001,},[8]={x=353,y=483,z=909001,},[9]={x=371,y=489,z=909001,},[10]={x=389,y=490,z=909001,},[11]={x=408,y=490,z=909001,},[12]={x=390,y=464,z=909001,},[13]={x=395,y=445,z=909001,},[14]={x=404,y=429,z=909001,},[15]={x=418,y=418,z=909001,},[16]={x=437,y=411,z=909001,},},
	[jixiemofabing60] = {[1]={x=372,y=390,z=909001,},[2]={x=356,y=397,z=909001,},[3]={x=344,y=407,z=909001,},[4]={x=335,y=421,z=909001,},[5]={x=331,y=437,z=909001,},[6]={x=335,y=454,z=909001,},[7]={x=344,y=468,z=909001,},[8]={x=356,y=477,z=909001,},[9]={x=371,y=483,z=909001,},[10]={x=389,y=484,z=909001,},[11]={x=408,y=484,z=909001,},[12]={x=397,y=464,z=909001,},[13]={x=401,y=448,z=909001,},[14]={x=409,y=434,z=909001,},[15]={x=421,y=424,z=909001,},[16]={x=437,y=417,z=909001,},},
	--精英
	[jyjixiewulibing60] = {[1]={x=371,y=387,z=909001,lujing=8,xys={371,387,5,355,393,5,341,404,5,332,420,5,328,437,5,332,420,5,341,404,5,355,393,5,},},[2]={x=394,y=462,z=909001,lujing=8,xys={394,462,5,398,446,5,407,431,5,419,421,5,437,414,5,419,421,5,407,431,5,398,446,5,},},},
	[jyjixiehuoyaobing60] = {[1]={x=332,y=420,z=909001,lujing=8,xys={332,420,5,328,437,5,332,455,5,342,470,5,354,480,5,342,470,5,332,455,5,328,437,5,},},[2]={x=394,y=462,z=909001,lujing=8,xys={394,462,5,398,446,5,407,431,5,419,421,5,437,414,5,419,421,5,407,431,5,398,446,5,},},},
	[jyjixiemofabing60] = {[1]={x=342,y=470,z=909001,lujing=8,xys={342,470,5,354,480,5,371,486,5,389,487,5,408,487,5,389,487,5,371,486,5,354,480,5,},},[2]={x=394,y=462,z=909001,lujing=8,xys={394,462,5,398,446,5,407,431,5,419,421,5,437,414,5,419,421,5,407,431,5,398,446,5,},},},
	--巡逻队
	[jyjixiewulibing61] = {[1]={x=371,y=389,z=909001,},},
}
yjdsh_5quxunluoduitable= {
	--巡逻队
	[jyjixiehuoyaobing61] = {[1]={x=371,y=389,z=909001,lujing=1,},},
	[jixiebuxuebing60] = {[1]={x=371,y=389,z=909001,lujing=1,},[2]={x=371,y=389,z=909001,lujing=1,},[3]={x=371,y=389,z=909001,lujing=1,},},
}
yjdsh_6qumonstertable = {
	[jixiewulibing60] = {[1]={x=530,y=386,z=909001,},[2]={x=547,y=389,z=909001,},[3]={x=562,y=399,z=909001,},[4]={x=573,y=410,z=909001,},[5]={x=580,y=427,z=909001,},[6]={x=580,y=445,z=909001,},[7]={x=573,y=462,z=909001,},[8]={x=563,y=474,z=909001,},[9]={x=548,y=484,z=909001,},[10]={x=530,y=488,z=909001,},[11]={x=512,y=487,z=909001,},[12]={x=492,y=487,z=909001,},[13]={x=523,y=463,z=909001,},[14]={x=519,y=446,z=909001,},[15]={x=509,y=431,z=909001,},[16]={x=497,y=421,z=909001,},[17]={x=480,y=414,z=909001,},},
	[jixiehuoyaobing60] = {[1]={x=530,y=383,z=909001,},[2]={x=548,y=386,z=909001,},[3]={x=560,y=401,z=909001,},[4]={x=570,y=412,z=909001,},[5]={x=577,y=428,z=909001,},[6]={x=577,y=444,z=909001,},[7]={x=571,y=460,z=909001,},[8]={x=561,y=471,z=909001,},[9]={x=547,y=481,z=909001,},[10]={x=530,y=485,z=909001,},[11]={x=512,y=484,z=909001,},[12]={x=492,y=484,z=909001,},[13]={x=520,y=463,z=909001,},[14]={x=516,y=447,z=909001,},[15]={x=507,y=433,z=909001,},[16]={x=495,y=424,z=909001,},[17]={x=480,y=417,z=909001,},},
	[jixiemofabing60] = {[1]={x=530,y=389,z=909001,},[2]={x=546,y=392,z=909001,},[3]={x=565,y=396,z=909001,},[4]={x=575,y=409,z=909001,},[5]={x=583,y=426,z=909001,},[6]={x=583,y=445,z=909001,},[7]={x=576,y=463,z=909001,},[8]={x=566,y=476,z=909001,},[9]={x=550,y=486,z=909001,},[10]={x=530,y=491,z=909001,},[11]={x=512,y=490,z=909001,},[12]={x=492,y=490,z=909001,},[13]={x=526,y=463,z=909001,},[14]={x=522,y=444,z=909001,},[15]={x=512,y=428,z=909001,},[16]={x=499,y=418,z=909001,},[17]={x=480,y=411,z=909001,},},
	--精英
	[jyjixiewulibing60] = {[1]={x=530,y=386,z=909001,lujing=6,xys={530,386,5,547,389,5,562,399,5,573,410,5,562,399,5,547,389,5,},},[2]={x=523,y=461,z=909001,lujing=8,xys={523,461,5,519,446,5,509,431,5,497,421,5,480,414,5,497,421,5,509,431,5,519,446,5,},},},
	[jyjixiehuoyaobing60] = {[1]={x=580,y=427,z=909001,lujing=6,xys={580,427,5,580,445,5,573,462,5,563,474,5,573,462,5,580,445,5,},},[2]={x=523,y=461,z=909001,lujing=8,xys={523,461,5,519,446,5,509,431,5,497,421,5,480,414,5,497,421,5,509,431,5,519,446,5,},},},
	[jyjixiemofabing60] = {[1]={x=530,y=386,z=909001,lujing=6,xys={548,484,5,530,488,5,512,487,5,492,487,5,512,487,5,530,488,5,},},[2]={x=523,y=461,z=909001,lujing=8,xys={523,461,5,519,446,5,509,431,5,497,421,5,480,414,5,497,421,5,509,431,5,519,446,5,},},},
	--巡逻队
	[jyjixiewulibing61] = {[1]={x=532,y=388,z=909001,},},
}
yjdsh_6quxunluoduitable= {
	--巡逻队
	[jyjixiehuoyaobing61] = {[1]={x=532,y=388,z=909001,lujing=1,},},
	[jixiebuxuebing60] = {[1]={x=532,y=388,z=909001,lujing=1,},[2]={x=532,y=388,z=909001,lujing=1,},[3]={x=532,y=388,z=909001,lujing=1,},},
}
yjdsh_7qumonstertable = {
	[jyjixiewulibing62] = {[1]={x=437,y=497,z=909001,},[2]={x=464,y=497,z=909001,},[3]={x=437,y=470,z=909001,},[4]={x=464,y=470,z=909001,},},
	[jyjixiehuoyaobing62] = {[1]={x=438,y=498,z=909001,},[2]={x=465,y=498,z=909001,},[3]={x=438,y=471,z=909001,},[4]={x=465,y=471,z=909001,},},
	[jyjixiemofabing62] = {[1]={x=436,y=496,z=909001,},[2]={x=463,y=496,z=909001,},[3]={x=436,y=469,z=909001,},[4]={x=463,y=469,z=909001,},},
	[dushiguangchangBoss1] = {[1]={x=450,y=484,z=0,},},
	[chengmen2] = {[1]={x=451,y=507,z=0,},},
	--[chengmen2zhanwei] = {[1]={x=445,y=507,z=0,},[2]={x=446,y=507,z=0,},[3]={x=447,y=507,z=0,},[4]={x=448,y=507,z=0,},[5]={x=449,y=507,z=0,},[6]={x=450,y=507,z=0,},[7]={x=451,y=507,z=0,},[8]={x=452,y=507,z=0,},[9]={x=453,y=507,z=0,},[10]={x=454,y=507,z=0,},[11]={x=455,y=507,z=0,},[12]={x=456,y=507,z=0,},[13]={x=457,y=507,z=0,},[14]={x=458,y=507,z=0,},},
}
yjdsh_8qumonstertable = {
	[jixiewulibingdanti62] = {[1]={x=0,y=0,z=0,},[2]={x=0,y=0,z=0,},[3]={x=0,y=0,z=0,},[4]={x=0,y=0,z=0,},[5]={x=0,y=0,z=0,},[6]={x=0,y=0,z=0,},[7]={x=0,y=0,z=0,},[8]={x=0,y=0,z=0,},[9]={x=0,y=0,z=0,},[10]={x=0,y=0,z=0,},[11]={x=0,y=0,z=0,},[12]={x=0,y=0,z=0,},[13]={x=0,y=0,z=0,},[14]={x=0,y=0,z=0,},[15]={x=0,y=0,z=0,},[16]={x=0,y=0,z=0,},[17]={x=0,y=0,z=0,},[18]={x=0,y=0,z=0,},[19]={x=0,y=0,z=0,},[20]={x=0,y=0,z=0,},},
	[jixiekongzhimofabing62] = {[1]={x=0,y=0,z=0,},[2]={x=0,y=0,z=0,},[3]={x=0,y=0,z=0,},[4]={x=0,y=0,z=0,},[5]={x=0,y=0,z=0,},[6]={x=0,y=0,z=0,},[7]={x=0,y=0,z=0,},[8]={x=0,y=0,z=0,},[9]={x=0,y=0,z=0,},[10]={x=0,y=0,z=0,},[11]={x=0,y=0,z=0,},[12]={x=0,y=0,z=0,},[13]={x=0,y=0,z=0,},[14]={x=0,y=0,z=0,},[15]={x=0,y=0,z=0,},[16]={x=0,y=0,z=0,},[17]={x=0,y=0,z=0,},[18]={x=0,y=0,z=0,},[19]={x=0,y=0,z=0,},[20]={x=0,y=0,z=0,},},
	[jyjixiewulibingdanti63] = {[1]={x=0,y=0,z=0,},[2]={x=0,y=0,z=0,},[3]={x=0,y=0,z=0,},[4]={x=0,y=0,z=0,},[5]={x=0,y=0,z=0,},},
}
yjdsh_9qumonstertable = {
	[jixiewulibingqunti63] = {[1]={x=0,y=0,z=0,},[2]={x=0,y=0,z=0,},[3]={x=0,y=0,z=0,},[4]={x=0,y=0,z=0,},[5]={x=0,y=0,z=0,},[6]={x=0,y=0,z=0,},[7]={x=0,y=0,z=0,},[8]={x=0,y=0,z=0,},[9]={x=0,y=0,z=0,},[10]={x=0,y=0,z=0,},[11]={x=0,y=0,z=0,},[12]={x=0,y=0,z=0,},[13]={x=0,y=0,z=0,},[14]={x=0,y=0,z=0,},[15]={x=0,y=0,z=0,},[16]={x=0,y=0,z=0,},[17]={x=0,y=0,z=0,},[18]={x=0,y=0,z=0,},[19]={x=0,y=0,z=0,},[20]={x=0,y=0,z=0,},[21]={x=0,y=0,z=0,},[22]={x=0,y=0,z=0,},[23]={x=0,y=0,z=0,},[24]={x=0,y=0,z=0,},[25]={x=0,y=0,z=0,},},
	[jixieyiliaomofabing63] = {[1]={x=0,y=0,z=0,},[2]={x=0,y=0,z=0,},[3]={x=0,y=0,z=0,},[4]={x=0,y=0,z=0,},[5]={x=0,y=0,z=0,},[6]={x=0,y=0,z=0,},[7]={x=0,y=0,z=0,},[8]={x=0,y=0,z=0,},[9]={x=0,y=0,z=0,},[10]={x=0,y=0,z=0,},[11]={x=0,y=0,z=0,},[12]={x=0,y=0,z=0,},[13]={x=0,y=0,z=0,},[14]={x=0,y=0,z=0,},[15]={x=0,y=0,z=0,},[16]={x=0,y=0,z=0,},[17]={x=0,y=0,z=0,},[18]={x=0,y=0,z=0,},[19]={x=0,y=0,z=0,},[20]={x=0,y=0,z=0,},[21]={x=0,y=0,z=0,},[22]={x=0,y=0,z=0,},[23]={x=0,y=0,z=0,},[24]={x=0,y=0,z=0,},[25]={x=0,y=0,z=0,},},
	[jyjixiewulibingqunti64] = {[1]={x=0,y=0,z=0,},[2]={x=0,y=0,z=0,},[3]={x=0,y=0,z=0,},[4]={x=0,y=0,z=0,},[5]={x=0,y=0,z=0,},[6]={x=0,y=0,z=0,},[7]={x=0,y=0,z=0,},[8]={x=0,y=0,z=0,},[9]={x=0,y=0,z=0,},[10]={x=0,y=0,z=0,},},
}
yjdsh_10qumonstertable = {
	[jixiepaobing64] = {[1]={x=430,y=706,z=909001,},[2]={x=434,y=714,z=909001,},[3]={x=438,y=714,z=909001,},[4]={x=442,y=706,z=909001,},[5]={x=434,y=699,z=909001,},[6]={x=427,y=710,z=909001,},[7]={x=433,y=721,z=909001,},[8]={x=448,y=710,z=909001,},[9]={x=445,y=698,z=909001,},[10]={x=425,y=698,z=909001,},[11]={x=422,y=722,z=909001,},[12]={x=449,y=722,z=909001,},[13]={x=433,y=693,z=909001,},[14]={x=420,y=710,z=909001,},[15]={x=434,y=728,z=909001,},[16]={x=455,y=710,z=909001,},},
	[jixiehuoyaojituibing64] = {[1]={x=434,y=706,z=909001,},[2]={x=430,y=714,z=909001,},[3]={x=442,y=714,z=909001,},[4]={x=438,y=706,z=909001,},[5]={x=438,y=699,z=909001,},[6]={x=423,y=710,z=909001,},[7]={x=437,y=721,z=909001,},[8]={x=444,y=710,z=909001,},[9]={x=449,y=698,z=909001,},[10]={x=421,y=698,z=909001,},[11]={x=426,y=722,z=909001,},[12]={x=445,y=722,z=909001,},[13]={x=437,y=693,z=909001,},[14]={x=416,y=710,z=909001,},[15]={x=438,y=728,z=909001,},[16]={x=451,y=710,z=909001,},},
	[jyjixiepaobing65] = {[1]={x=432,y=706,z=909001,},[2]={x=432,y=714,z=909001,},[3]={x=440,y=714,z=909001,},[4]={x=440,y=706,z=909001,},[5]={x=436,y=699,z=909001,},[6]={x=425,y=710,z=909001,},[7]={x=435,y=721,z=909001,},[8]={x=446,y=710,z=909001,},[9]={x=447,y=698,z=909001,},[10]={x=423,y=698,z=909001,},[11]={x=424,y=722,z=909001,},[12]={x=447,y=722,z=909001,},[13]={x=383,y=638,z=909001,},[14]={x=466,y=638,z=909001,},[15]={x=442,y=624,z=909001,},[16]={x=405,y=619,z=909001,},[17]={x=468,y=574,z=909001,},},
}
yjdsh_11qumonstertable = {
	[jiangjun] = {[1]={x=320,y=711,z=909001,},},
	[bingying3] = {[1]={x=320,y=699,z=909001,},[2]={x=310,y=705,z=909001,},[3]={x=310,y=716,z=909001,},[4]={x=320,y=723,z=909001,},[5]={x=331,y=717,z=909001,},[6]={x=331,y=706,z=909001,},},
	--物理单体
	[jixiewulibingdanti65] = {[1]={x=331,y=705,z=909001,},[2]={x=331,y=707,z=909001,},[3]={x=330,y=706,z=909001,},[4]={x=332,y=706,z=909001,},[5]={x=330,y=705,z=909001,},[6]={x=332,y=707,z=909001,},},
	--控制魔法
	[jixiekongzhimofabing65] = {[1]={x=310,y=704,z=909001,},[2]={x=310,y=706,z=909001,},[3]={x=309,y=705,z=909001,},[4]={x=311,y=705,z=909001,},[5]={x=311,y=706,z=909001,},[6]={x=309,y=704,z=909001,},},
	--物理群体
	[jixiewulibingqunti65] = {[1]={x=320,y=724,z=909001,},[2]={x=320,y=722,z=909001,},[3]={x=321,y=723,z=909001,},[4]={x=319,y=723,z=909001,},[5]={x=319,y=722,z=909001,},[6]={x=321,y=724,z=909001,},},
	--加血
	[jixieyiliaomofabing65] = {[1]={x=310,y=715,z=909001,},[2]={x=310,y=717,z=909001,},[3]={x=311,y=716,z=909001,},[4]={x=309,y=716,z=909001,},[5]={x=309,y=715,z=909001,},[6]={x=311,y=717,z=909001,},},
	--炮兵
	[jixiepaobing65] = {[1]={x=320,y=700,z=909001,},[2]={x=320,y=698,z=909001,},[3]={x=321,y=699,z=909001,},[4]={x=319,y=699,z=909001,},[5]={x=319,y=698,z=909001,},[6]={x=321,y=700,z=909001,},},
	--火药击退
	[jixiehuoyaojituibing65] = {[1]={x=331,y=716,z=909001,},[2]={x=331,y=718,z=909001,},[3]={x=330,y=717,z=909001,},[4]={x=332,y=718,z=909001,},[5]={x=330,y=716,z=909001,},[6]={x=332,y=718,z=909001,},},
}
yjdsh_12qumonstertable = {
	[1] = {[bingying2]={x=380,y=641,},[chengmen3]={x=453,y=640,},},
	[2] = {[bingying2]={x=469,y=641,},[chengmen3]={x=435,y=685,},},
	[3] = {[bingying2]={x=436,y=710,},[chengmen4]={x=411,y=710,},},
}
yjdsh_12qumentable = {[chengmen4]={x=411,y=710,},}
yjdsh_13qumonstertable = {
	[jixiewulibing65] = {[1]={x=58,y=59,},[2]={x=53,y=59,},[3]={x=48,y=59,},},
	[jixiehuoyaobing65] = {[1]={x=59,y=66,},[2]={x=53,y=66,},[3]={x=47,y=66,},},
	[jixiemofabing65] = {[1]={x=59,y=72,},[2]={x=53,y=73,},[3]={x=47,y=74,},},
	[jixiebuxuebing65] = {[1]={x=39,y=60,},[2]={x=41,y=66,},[3]={x=39,y=73,},},
	[jixiepaobing65] = {[1]={x=55,y=64,},[2]={x=55,y=71,},[3]={x=49,y=68,},},
	[jingxiangBOSS] = {[1]={x=37,y=67,},},
	[chuqudemen] = {[1]={x=94,y=58,},},
}
--BOSS护卫表
yjdsh_dshgch_Bossshouweitable = {
	jixiewulibingpc62,jixiewulibingpc62,jixiehuoyaobingpc62,jixiemofabingpc62,
	jixiewulibingpc62,jixiehuoyaobingpc62,jixiemofabingpc62,jixiebuxuebingpc62,
	jixiewulibingpc62,jixiehuoyaobingpc62,jixiebuxuebingpc62,jixiebuxuebingpc62,
	jixiemofabingpc62,jixiebuxuebingpc62,jixiebuxuebingpc62,jixiebuxuebingpc62,
}
--普通怪物表 没用到
yjdsh_monstertable1 = {
[1] = {jixiewulibing56,jixiehuoyaobing56,jixiemofabing56,},
[2] = {chengmenwulishouwei58,chengmenmofashouwei58,chengmenhuoyaoshouwei58,},
[3] = {jixiewulibing60,jixiehuoyaobing60,jixiemofabing60,},
[4] = {jixiewulibingdanti62,jixiekongzhimofabing62,jixiewulibingqunti63,jixieyiliaomofabing63,jixiepaobing64,jixiehuoyaojituibing64,},
}
--精英怪物表 没用到
yjdsh_monstertable2 = {
[1] = {jyjixiewulibing57,jyjixiehuoyaobing57,jyjixiemofabing57,},
[2] = {jychengmenwulishouwei58,jychengmenmofashouwei58,jychengmenhuoyaoshouwei58,},
[3] = {jyjixiewulibing60,jyjixiehuoyaobing60,jyjixiemofabing60,},
[4] = {jyjixiewulibingdanti63,jyjixiewulibingqunti64,jyjixiepaobing65,},
}
--4区怪物表 没用到
yjdsh_guaiwuweizhitable = {
	[jixiewulibing56] = {x=389,y=201,},--1807任务普通怪物
	[jixiehuoyaobing56] = {x=392,y=203,},--1807任务普通怪物
	[jixiemofabing56] = {x=395,y=205,},--1807任务普通怪物
	
	[jyjixiewulibing57] = {x=0,y=0,},--1807任务精英怪物
	[jyjixiehuoyaobing57] = {x=0,y=0,},--1807任务精英怪物
	[jyjixiemofabing57] = {x=0,y=0,},--1807任务精英怪物

[jixiewulibingdanti62] = {x=0,y=0,},
[jixiekongzhimofabing62] = {x=0,y=0,}, 
[jixiewulibingqunti63] = {x=0,y=0,}, 
[jixieyiliaomofabing63] = {x=0,y=0,}, 
[jixiepaobing64] = {x=0,y=0,}, 
[jixiehuoyaojituibing64] = {x=0,y=0,}, 
[jyjixiewulibingdanti63] = {x=0,y=0,}, 
[jyjixiewulibingqunti64] = {x=0,y=0,}, 
[jyjixiepaobing65] = {x=0,y=0,}, 
[bingying2] = {x=0,y=0,}, --关卡兵营
[bingying3] = {x=0,y=0,},  --BOSS兵营
[jiangjun] = {x=320,y=711,},  --将军
[dushiguangchangBoss1] = {x=450,y=484,},  --血勇士
[dushiguangchangBoss2] = {x=400,y=379,},  --血勇士2
[dushiguangchangBoss3] = {x=504,y=379,},  --血勇士3
[chongche1] = {x=0,y=0,},  --冲车
}

--普通怪物掉落类型
yjdsh_ptmonsterdroptypetable = {
[901055] = 1,
[901056] = 1,
[901057] = 1,
[901058] = 1,
[901059] = 1,
[901060] = 2,
[901061] = 2,
[901162] = 3,
[901163] = 3,
[901164] = 3,
[901165] = 3,
[901263] = 3,
[901264] = 3,
[901265] = 3,
[901355] = 1,
[902055] = 1,
[902056] = 1,
[902057] = 1,
[902058] = 1,
[902059] = 1,
[902060] = 2,
[902061] = 2,
[902164] = 3,
[902165] = 3,
[903055] = 1,
[903056] = 1,
[903057] = 1,
[903058] = 1,
[903059] = 1,
[903060] = 2,
[903061] = 2,
[903162] = 3,
[903163] = 3,
[903164] = 3,
[903165] = 3,
[904001] = 2,
[904002] = 3,
[904003] = 3,
[904004] = 3,
[904021] = 3,
[904005] = 3,
[904006] = 3,
[904007] = 3,
[904008] = 3,
[904011] = 1,
[904012] = 1,
[904015] = 1,
[904016] = 1,
[904019] = 1,
[904020] = 1,
[904101] = 1,
[904102] = 2,
}
--普通怪物掉落物品
yjdsh_ptmonsterdropgoodstable  = {
[1] = {
	[1] = {
		{GoodsID=104,GoodsNum=1,GaiLv=10000,PinZhi=0},
		{GoodsID=204,GoodsNum=1,GaiLv=10000,PinZhi=0},
		{GoodsID=80289,GoodsNum=20,GaiLv=100000,PinZhi=0},
		{GoodsID=80289,GoodsNum=20,GaiLv=100000,PinZhi=0},
		{GoodsID=80289,GoodsNum=20,GaiLv=100000,PinZhi=0},
		{GoodsID=80947,GoodsNum=1,GaiLv=10000,PinZhi=0},
		{GoodsID=80947,GoodsNum=1,GaiLv=10000,PinZhi=0},
		{GoodsID=80947,GoodsNum=1,GaiLv=10000,PinZhi=0},
		},
	[2] = {
		GaiLv=10000,LeiXing=9,Num=1,
		PinZhiTab = {
			{a=1,b=99,PinZhi=2,},
			{a=100,b=100,PinZhi=7,},
			},
		},
	},
[2] = {
	[1] = {
		{GoodsID=104,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=204,GoodsNum=1,GaiLv=30000,PinZhi=0},
		{GoodsID=80289,GoodsNum=30,GaiLv=100000,PinZhi=0},
		{GoodsID=80289,GoodsNum=30,GaiLv=100000,PinZhi=0},
		{GoodsID=80289,GoodsNum=30,GaiLv=100000,PinZhi=0},
		},
	[2] = {
		GaiLv=10000,LeiXing=9,Num=1,
		PinZhiTab = {
			{a=1,b=99,PinZhi=2,},
			{a=100,b=100,PinZhi=7,},
			},
		},
	},
[3] = {
	[1] = {
		{GoodsID=104,GoodsNum=1,GaiLv=50000,PinZhi=0},
		{GoodsID=204,GoodsNum=1,GaiLv=50000,PinZhi=0},
		{GoodsID=80289,GoodsNum=40,GaiLv=100000,PinZhi=0},
		{GoodsID=80289,GoodsNum=40,GaiLv=100000,PinZhi=0},
		{GoodsID=80289,GoodsNum=40,GaiLv=100000,PinZhi=0},
		{GoodsID=80948,GoodsNum=1,GaiLv=30000,PinZhi=0},
		},
	[2] = {
		GaiLv=10000,LeiXing=9,Num=1,
		PinZhiTab = {
			{a=1,b=99,PinZhi=2,},
			{a=100,b=100,PinZhi=7,},
			},
		},
	},
}

--精英怪物掉落类型
yjdsh_jymonsterdroptypetable = {
[905001] = 1,
[905002] = 2,
[905003] = 2,
[905004] = 3,
[905005] = 3,
[905006] = 3,
[905007] = 1,
[905008] = 2,
[905009] = 2,
[905010] = 3,
[905011] = 1,
[905012] = 2,
[905013] = 2,
[905014] = 3,
[905015] = 1,
[905016] = 1,
[905017] = 1,
[905018] = 3,
[905019] = 1,
[905020] = 1,
[12301] = 4, --城门
[906011] = 5, --都市广场boss
[906012] = 5, --回归boss
[906013] = 5, --回归boss
[906014] = 6, --将军
[906015] = 7, --镜像boss
}
--精英怪物掉落物品
yjdsh_jymonsterdropgoodstable = {
[1] = {
	[1] = {
		{GoodsID=80410,GoodsNum=100,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=100,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=20,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=20,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=20,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=20,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=20,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=20,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=20,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=20,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=20,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=2000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=1000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=10,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=10,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=10,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80947,GoodsNum=1,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80947,GoodsNum=1,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80947,GoodsNum=1,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80952,GoodsNum=1,GaiLv=1000,PinZhi=0,Bind=0,},
		},
--~ 	[2] = {
--~ 		GaiLv=10000,GoodsTab={88923,88927,88931,},Bind=0,
--~ 		},
	[3] = {
		[1] = {
			GaiLv=5000,LeiXing=20,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=100,LeiXing=20,},
				},
			PinZhiTab = {
				{a=1,b=99,PinZhi=2,},
				{a=100,b=100,PinZhi=7,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		[2] = {
			GaiLv=50000,LeiXing=9,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=100,LeiXing=9,},
				},
			PinZhiTab = {
				{a=1,b=97,PinZhi=2,},
				{a=98,b=100,PinZhi=7,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		},
	},
[2] = {
	[1] = {
		{GoodsID=80410,GoodsNum=100,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=100,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=100,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=100,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=30,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=30,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=30,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=30,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=30,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=30,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=30,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=30,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=30,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=20000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=10,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=10,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=10,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80952,GoodsNum=1,GaiLv=1000,PinZhi=0,Bind=0,},
		},
--~ 	[2] = {
--~ 		GaiLv=10000,GoodsTab={88923,88927,88931,},Bind=0,
--~ 		},
	[3] = {
		[1] = {
			GaiLv=5000,LeiXing=20,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=100,LeiXing=20,},
				},
			PinZhiTab = {
				{a=1,b=99,PinZhi=2,},
				{a=100,b=100,PinZhi=7,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		[2] = {
			GaiLv=50000,LeiXing=9,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=100,LeiXing=9,},
				},
			PinZhiTab = {
				{a=1,b=97,PinZhi=2,},
				{a=98,b=100,PinZhi=7,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		},
	[4] = {
		GaiLv=10000,GoodsTab={40206,40222,40238,40254,40270,},Bind=0,
		},
	},
[3] = {
	[1] = {
		{GoodsID=80410,GoodsNum=100,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=100,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=100,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=100,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=100,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=1000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=40,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=40,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=40,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=40,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=40,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=40,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=40,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=40,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=40,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=20000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		{GoodsID=80948,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80952,GoodsNum=1,GaiLv=1000,PinZhi=0,Bind=0,},
		},
--~ 	[2] = {
--~ 		GaiLv=10000,GoodsTab={88923,88927,88931,},Bind=0,
--~ 		},
	[3] = {
		[1] = {
			GaiLv=5000,LeiXing=20,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=100,LeiXing=20,},
				},
			PinZhiTab = {
				{a=1,b=95,PinZhi=2,},
				{a=96,b=100,PinZhi=7,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		[2] = {
			GaiLv=50000,LeiXing=9,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=100,LeiXing=9,},
				},
			PinZhiTab = {
				{a=1,b=97,PinZhi=2,},
				{a=98,b=100,PinZhi=7,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		},
	[4] = {
		GaiLv=40000,GoodsTab={40206,40222,40238,40254,40270,},Bind=0,
		},
	},
[4] = {
	[1] = {
		{GoodsID=89187,GoodsNum=120,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=83114,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		
		{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=200000,PinZhi=0,Bind=0,},
		
		{GoodsID=82004,GoodsNum=1,GaiLv=700000,PinZhi=0,Bind=0,},
		{GoodsID=82004,GoodsNum=1,GaiLv=400000,PinZhi=0,Bind=0,},
		{GoodsID=82004,GoodsNum=1,GaiLv=200000,PinZhi=0,Bind=0,},
		
		{GoodsID=80952,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		},
--~ 	[2] = {
--~ 		GaiLv=200000,GoodsTab={88923,88927,88931,},Bind=0,
--~ 		},
	[3] = {
		--高附加
		[1] = {
			GaiLv=1000000,LeiXing=9,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=90,LeiXing=9,},
				{a=91,b=100,LeiXing=18,},
				},
			PinZhiTab = {
				{a=1,b=97,PinZhi=7,},
				{a=98,b=100,PinZhi=3,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		--三洞
		[2] = {
			GaiLv=1000000,LeiXing=9,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=95,LeiXing=9,},
				{a=96,b=100,LeiXing=18,},
				},
			PinZhiTab = {
				{a=1,b=100,PinZhi=6,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		--完美
		[3] = {
			GaiLv=1000000,LeiXing=9,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=90,LeiXing=9,},
				{a=91,b=100,LeiXing=18,},
				},
			PinZhiTab = {
				{a=1,b=75,PinZhi=2,},
				{a=76,b=100,PinZhi=7,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		},
	[4] = {
		GaiLv=300000,GoodsTab={40206,40222,40238,40254,40270,},Bind=0,
		},
	},
[5] = {
	[1] = {
		{GoodsID=89187,GoodsNum=120,GaiLv=1000000,PinZhi=0,Bind=0,},
                {GoodsID=89187,GoodsNum=120,GaiLv=1000000,PinZhi=0,Bind=0,},
                {GoodsID=89187,GoodsNum=120,GaiLv=1000000,PinZhi=0,Bind=0,},
                {GoodsID=89187,GoodsNum=120,GaiLv=1000000,PinZhi=0,Bind=0,},
                {GoodsID=89187,GoodsNum=120,GaiLv=1000000,PinZhi=0,Bind=0,},
				{GoodsID=83114,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=40006,GoodsNum=4,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40016,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40026,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=730,GoodsNum=1,GaiLv=1000000,PinZhi=6,Bind=0,},
		{GoodsID=40046,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40056,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40066,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40076,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40086,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40096,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40106,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40116,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40126,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40136,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40310,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40330,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40350,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40370,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40390,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40410,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40214,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40230,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40246,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=1500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=400000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=200000,PinZhi=0,Bind=0,},
		
		{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=200000,PinZhi=0,Bind=0,},
		
		{GoodsID=80388,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80388,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		
		{GoodsID=80401,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80401,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		
		{GoodsID=82004,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=82004,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=82004,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=82004,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=82004,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		
		{GoodsID=31020,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		{GoodsID=31021,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		--{GoodsID=31022,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		{GoodsID=80621,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80949,GoodsNum=1,GaiLv=600000,PinZhi=0,Bind=0,},
		
		{GoodsID=80952,GoodsNum=1,GaiLv=600000,PinZhi=0,Bind=0,},
		},
--~ 	[2] = {
--~ 		GaiLv=200000,GoodsTab={88923,88927,88931,},Bind=0,
--~ 		},
	[3] = {
		[1] = {
			GaiLv=1000000,LeiXing=9,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=50,LeiXing=9,},
				{a=51,b=100,LeiXing=18,},
				},
			PinZhiTab = {
				{a=1,b=90,PinZhi=7,},
				{a=91,b=100,PinZhi=3,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		[2] = {
			GaiLv=1000000,LeiXing=9,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=85,LeiXing=9,},
				{a=86,b=100,LeiXing=18,},
				},
			PinZhiTab = {
				{a=1,b=100,PinZhi=6,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		[3] = {
			GaiLv=1000000,LeiXing=18,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=100,LeiXing=18,},
				},
			PinZhiTab = {
				{a=1,b=50,PinZhi=2,},
				{a=51,b=100,PinZhi=7,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=90,Make1=3,},
				{a=91,b=100,Make1=4,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=90,Make2=3,},
				{a=91,b=100,Make2=4,},
				},
			},
		},
	[4] = {
		GaiLv=50000,GoodsTab={40206,40222,40238,40254,40270,},Bind=0,
		},
	},
[6] = {
	[1] = {
		{GoodsID=89187,GoodsNum=120,GaiLv=1000000,PinZhi=0,Bind=0,},
                {GoodsID=89187,GoodsNum=120,GaiLv=1000000,PinZhi=0,Bind=0,},
                {GoodsID=89187,GoodsNum=120,GaiLv=1000000,PinZhi=0,Bind=0,},
                {GoodsID=89187,GoodsNum=120,GaiLv=1000000,PinZhi=0,Bind=0,},
                {GoodsID=89187,GoodsNum=120,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=39742,GoodsNum=1,GaiLv=100000,PinZhi=0,Bind=0,},
			{GoodsID=83114,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
{GoodsID=730,GoodsNum=1,GaiLv=1000000,PinZhi=6,Bind=0,},
		{GoodsID=40006,GoodsNum=4,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40016,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40026,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40036,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40046,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40056,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40066,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40076,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40086,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40096,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40106,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40116,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40126,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40136,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40310,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40330,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40350,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40370,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40390,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40410,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40214,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40230,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=40246,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=2000,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		
		{GoodsID=80197,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		
		{GoodsID=80274,GoodsNum=1,GaiLv=400000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=200000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		
		{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=400000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=200000,PinZhi=0,Bind=0,},
		
		{GoodsID=80388,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80388,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		
		{GoodsID=80401,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80401,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		
		{GoodsID=82004,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=82004,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=82004,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=82004,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=82004,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		
		{GoodsID=31020,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		{GoodsID=31021,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		--{GoodsID=31022,GoodsNum=1,GaiLv=10000,PinZhi=0,Bind=0,},
		{GoodsID=80621,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80949,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		
		{GoodsID=80952,GoodsNum=1,GaiLv=700000,PinZhi=0,Bind=0,},
		},
--~ 	[2] = {
--~ 		GaiLv=200000,GoodsTab={88923,88927,88931,},Bind=0,
--~ 		},
	[3] = {
		[1] = {
			GaiLv=1000000,LeiXing=18,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=100,LeiXing=18,},
				},
			PinZhiTab = {
				{a=1,b=100,PinZhi=3,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		[2] = {
			GaiLv=1000000,LeiXing=9,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=75,LeiXing=9,},
				{a=76,b=100,LeiXing=18,},
				},
			PinZhiTab = {
				{a=1,b=100,PinZhi=6,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		[3] = {
			GaiLv=1000000,LeiXing=18,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=100,LeiXing=18,},
				},
			PinZhiTab = {
				{a=1,b=60,PinZhi=7,},
				{a=61,b=100,PinZhi=3,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=60,Make1=2,},
				{a=61,b=80,Make1=3,},
				{a=81,b=100,Make1=4,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=60,Make2=2,},
				{a=61,b=80,Make2=3,},
				{a=81,b=100,Make2=4,},
				},
			},
		},
	[4] = {
		GaiLv=100000,GoodsTab={40206,40222,40238,40254,40270,},Bind=0,
		},
	},
[7] = {
	[1] = {
		{GoodsID=89187,GoodsNum=120,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
{GoodsID=730,GoodsNum=1,GaiLv=1000000,PinZhi=6,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=83114,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80498,GoodsNum=25,GaiLv=1000000,PinZhi=0,Bind=0,},
		
		{GoodsID=80410,GoodsNum=200,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=200,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=200,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=200,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=200,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=200,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=200,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=200,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=200,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80410,GoodsNum=200,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=104,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=204,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80192,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80289,GoodsNum=500,GaiLv=600000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=800000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=500000,PinZhi=0,Bind=0,},
		{GoodsID=80197,GoodsNum=1,GaiLv=300000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=100000,PinZhi=0,Bind=0,},
		{GoodsID=80274,GoodsNum=1,GaiLv=100000,PinZhi=0,Bind=0,},
		
		{GoodsID=80382,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80382,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		
		{GoodsID=80384,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},
		{GoodsID=80384,GoodsNum=1,GaiLv=50000,PinZhi=0,Bind=0,},

		{GoodsID=82004,GoodsNum=1,GaiLv=1000000,PinZhi=0,Bind=0,},
		{GoodsID=80621,GoodsNum=1,GaiLv=200000,PinZhi=0,Bind=0,},
		
		{GoodsID=80952,GoodsNum=1,GaiLv=600000,PinZhi=0,Bind=0,},
		},
--~ 	[2] = {
--~ 		GaiLv=200000,GoodsTab={88923,88927,88931,},Bind=0,
--~ 		},
	[3] = {
		[1] = {
			GaiLv=1000000,LeiXing=20,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=100,LeiXing=20,},
				},
			PinZhiTab = {
				{a=1,b=40,PinZhi=2,},
				{a=41,b=100,PinZhi=7,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		[2] = {
			GaiLv=400000,LeiXing=18,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=100,LeiXing=18,},
				},
			PinZhiTab = {
				{a=1,b=50,PinZhi=2,},
				{a=51,b=90,PinZhi=7,},
				{a=91,b=100,PinZhi=3,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=100,Make1=3,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=100,Make2=3,},
				},
			},
		[3] = {
			GaiLv=100000,LeiXing=18,Num=1,Bind=0,
			LeiXingTab = {
				{a=1,b=100,LeiXing=18,},
				},
			PinZhiTab = {
				{a=1,b=50,PinZhi=2,},
				{a=51,b=100,PinZhi=7,},
				},
			Make1Tab = {
				{a=1,b=40,Make1=1,},
				{a=41,b=70,Make1=2,},
				{a=71,b=90,Make1=3,},
				{a=91,b=100,Make1=4,},
				},
			Make2Tab = {
				{a=1,b=40,Make2=1,},
				{a=41,b=70,Make2=2,},
				{a=71,b=90,Make2=3,},
				{a=91,b=100,Make2=4,},
				},
			},
		},
	[4] = {
		GaiLv=50000,GoodsTab={40206,40222,40238,40254,40270,},Bind=0,
		},
	},
}
