--例行活动2 成长吧，宠物！
--第一部分 饲料刷新 
--第二部分 NPC部分幼年鸡获得 说明 兑换 特殊关
--第三部分 
--第四部分 
--第五部分 

--2009.3.9 开始制作 林瑞宇

--饲养员ID 11931  X = 439  Y = 431

--饲料ID
--草
local lieyancao = 80646 --青草
local qingcao = 80645  --烈焰草
local kuhuangdecao = 80647
--青草和烈焰草 ID对调 名字不换


--肉
local xiaokuaiderou = 80648
local zhongkuaiderou = 80649
local dakuaiderou = 80650
--骨头
local xiaokuaidegutou = 80651
local zhongkuaidegutou = 80652
local dakuaidegutou = 80653

--蛋ID
local baisedan = 80637
local reddan = 80638
local fenreddan = 80639
local lvsedan = 80640
local yinsedan = 80641
local golddan = 80642
local qicaidan = 80643
local blackdan = 80644

--怪兽ID
local sanyanshou2 = 726183
local anyuniao2 = 726184
local sanyanshou4 = 726185
local anyuniao4 = 726186
local sanyanshou6 = 726187
local anyuniao6 = 726188

--怪兽徽章 
local chongwuhuizhang2 = 88000
local chongwuhuizhang4 = 88000
local chongwuhuizhang6 = 88000
--怪兽粮 80513-80516

LiXingHuoDong2_StartTime = 22
LiXingHuoDong2_EndTime = 23

LiXingHuoDong3_StartTime = 12
LiXingHuoDong3_EndTime = 13

--产物、怪兽、饲料 定点清理

--怪兽表
LiXingHuoDong2_chongwutable={
	[2]={sanyanshou2,anyuniao2},
	[3]={sanyanshou2,anyuniao2},
	[4]={sanyanshou4,anyuniao4},
	[5]={sanyanshou4,anyuniao4},
	[6]={sanyanshou6,anyuniao6},
	[7]={sanyanshou6,anyuniao6},
	[8]={sanyanshou6,anyuniao6},
	[9]={sanyanshou6,anyuniao6},
	[10]={sanyanshou6,anyuniao6},
	[11]={sanyanshou6,anyuniao6},
}
LiXingHuoDong2_chongwutable2={
[sanyanshou2]={[1]={chengzhangMAX=240,chanwuMAX=100,chengzhangcishuMAX=30,chandancishuMAX=5,xihuan=xiaokuaidegutou,zuixihuan=xiaokuaiderou,taoyan=lieyancao,},
			   [2]={chengzhangMAX=480,chanwuMAX=100,chengzhangcishuMAX=48,chandancishuMAX=5,xihuan=zhongkuaidegutou,zuixihuan=zhongkuaiderou,taoyan=qingcao,},
			   [3]={chengzhangMAX=850,chanwuMAX=100,chengzhangcishuMAX=78,chandancishuMAX=5,xihuan=zhongkuaiderou,zuixihuan=dakuaiderou,taoyan=qingcao,},
			   [4]={chengzhangMAX=1620,chanwuMAX=100,chengzhangcishuMAX=120,chandancishuMAX=5,xihuan=dakuaidegutou,zuixihuan=dakuaiderou,taoyan=kuhuangdecao,},
			   [5]={chengzhangMAX=999999,chanwuMAX=100,chengzhangcishuMAX=999,chandancishuMAX=5,xihuan=dakuaidegutou,zuixihuan=dakuaiderou,taoyan=kuhuangdecao,},
			},
[anyuniao2]={[1]={chengzhangMAX=240,chanwuMAX=100,chengzhangcishuMAX=30,chandancishuMAX=5,xihuan=xiaokuaidegutou,zuixihuan=lieyancao,taoyan=xiaokuaiderou,},
			 [2]={chengzhangMAX=480,chanwuMAX=100,chengzhangcishuMAX=48,chandancishuMAX=5,xihuan=qingcao,zuixihuan=zhongkuaidegutou,taoyan=zhongkuaiderou,},
			 [3]={chengzhangMAX=850,chanwuMAX=100,chengzhangcishuMAX=78,chandancishuMAX=5,xihuan=zhongkuaidegutou,zuixihuan=kuhuangdecao,taoyan=zhongkuaiderou,},
			 [4]={chengzhangMAX=1620,chanwuMAX=100,chengzhangcishuMAX=120,chandancishuMAX=5,xihuan=dakuaidegutou,zuixihuan=kuhuangdecao,taoyan=dakuaiderou,},
			 [5]={chengzhangMAX=999999,chanwuMAX=100,chengzhangcishuMAX=999,chandancishuMAX=5,xihuan=dakuaidegutou,zuixihuan=kuhuangdecao,taoyan=dakuaiderou,},
			},
[sanyanshou4]={[1]={chengzhangMAX=240,chanwuMAX=100,chengzhangcishuMAX=30,chandancishuMAX=5,xihuan=xiaokuaidegutou,zuixihuan=xiaokuaiderou,taoyan=lieyancao,},
			   [2]={chengzhangMAX=480,chanwuMAX=100,chengzhangcishuMAX=48,chandancishuMAX=5,xihuan=zhongkuaidegutou,zuixihuan=zhongkuaiderou,taoyan=qingcao,},
			   [3]={chengzhangMAX=850,chanwuMAX=100,chengzhangcishuMAX=78,chandancishuMAX=5,xihuan=zhongkuaiderou,zuixihuan=dakuaiderou,taoyan=qingcao,},
			   [4]={chengzhangMAX=1620,chanwuMAX=100,chengzhangcishuMAX=120,chandancishuMAX=5,xihuan=dakuaidegutou,zuixihuan=dakuaiderou,taoyan=kuhuangdecao,},
			   [5]={chengzhangMAX=999999,chanwuMAX=100,chengzhangcishuMAX=999,chandancishuMAX=5,xihuan=dakuaidegutou,zuixihuan=dakuaiderou,taoyan=kuhuangdecao,},

			},
[anyuniao4]={[1]={chengzhangMAX=240,chanwuMAX=100,chengzhangcishuMAX=30,chandancishuMAX=5,xihuan=xiaokuaidegutou,zuixihuan=lieyancao,taoyan=xiaokuaiderou,},
			 [2]={chengzhangMAX=480,chanwuMAX=100,chengzhangcishuMAX=40,chandancishuMAX=5,xihuan=qingcao,zuixihuan=zhongkuaidegutou,taoyan=zhongkuaiderou,},
			 [3]={chengzhangMAX=850,chanwuMAX=100,chengzhangcishuMAX=78,chandancishuMAX=5,xihuan=zhongkuaidegutou,zuixihuan=kuhuangdecao,taoyan=zhongkuaiderou,},
			 [4]={chengzhangMAX=1620,chanwuMAX=100,chengzhangcishuMAX=120,chandancishuMAX=5,xihuan=dakuaidegutou,zuixihuan=kuhuangdecao,taoyan=dakuaiderou,},
			 [5]={chengzhangMAX=999999,chanwuMAX=100,chengzhangcishuMAX=999,chandancishuMAX=5,xihuan=dakuaidegutou,zuixihuan=kuhuangdecao,taoyan=dakuaiderou,},
			 },
[sanyanshou6]={[1]={chengzhangMAX=240,chanwuMAX=100,chengzhangcishuMAX=30,chandancishuMAX=5,xihuan=xiaokuaidegutou,zuixihuan=xiaokuaiderou,taoyan=lieyancao,},
			   [2]={chengzhangMAX=480,chanwuMAX=100,chengzhangcishuMAX=48,chandancishuMAX=5,xihuan=zhongkuaidegutou,zuixihuan=zhongkuaiderou,taoyan=qingcao,},
			   [3]={chengzhangMAX=850,chanwuMAX=100,chengzhangcishuMAX=78,chandancishuMAX=5,xihuan=zhongkuaiderou,zuixihuan=dakuaiderou,taoyan=qingcao,},
			   [4]={chengzhangMAX=1620,chanwuMAX=100,chengzhangcishuMAX=120,chandancishuMAX=5,xihuan=dakuaidegutou,zuixihuan=dakuaiderou,taoyan=kuhuangdecao,},
			   [5]={chengzhangMAX=999999,chanwuMAX=100,chengzhangcishuMAX=999,chandancishuMAX=5,xihuan=dakuaidegutou,zuixihuan=dakuaiderou,taoyan=kuhuangdecao,},			
			},
[anyuniao6]={[1]={chengzhangMAX=240,chanwuMAX=100,chengzhangcishuMAX=30,chandancishuMAX=5,xihuan=xiaokuaidegutou,zuixihuan=lieyancao,taoyan=xiaokuaiderou,},
			 [2]={chengzhangMAX=480,chanwuMAX=100,chengzhangcishuMAX=48,chandancishuMAX=5,xihuan=qingcao,zuixihuan=zhongkuaidegutou,taoyan=zhongkuaiderou,},
			 [3]={chengzhangMAX=850,chanwuMAX=100,chengzhangcishuMAX=78,chandancishuMAX=5,xihuan=zhongkuaidegutou,zuixihuan=kuhuangdecao,taoyan=zhongkuaiderou,},
			 [4]={chengzhangMAX=1620,chanwuMAX=100,chengzhangcishuMAX=120,chandancishuMAX=5,xihuan=dakuaidegutou,zuixihuan=kuhuangdecao,taoyan=dakuaiderou,},
			 [5]={chengzhangMAX=999999,chanwuMAX=100,chengzhangcishuMAX=999,chandancishuMAX=5,xihuan=dakuaidegutou,zuixihuan=kuhuangdecao,taoyan=dakuaiderou,},
			 },

}
--产蛋表
LiXingHuoDong2_chongwu_chanwutable = {
		[2]={
			[50]={[1]=94,[2]=2071,[3]=6588,[4]=10000,},
			[60]={[1]=94,[2]=3200,[3]=7530,[4]=10000,},
			[70]={[1]=753,[2]=3671,[3]=7718,[4]=10000,},
			[80]={[1]=1412,[2]=4141,[3]=7812,[4]=10000,},
			[90]={[1]=2071,[2]=4612,[3]=7906,[4]=10000,},
			[100]={[1]=2729,[2]=5082,[3]=8000,[4]=10000,},
			[110]={[1]=3388,[2]=5553,[3]=8188,[4]=10000,},
			[120]={[1]=4047,[2]=6024,[3]=8282,[4]=10000,},
			[130]={[1]=4706,[2]=6400,[3]=8471,[4]=10000,},
			[140]={[1]=5365,[2]=6871,[3]=8659,[4]=10000,},
			[150]={[1]=6024,[2]=7341,[3]=8847,[4]=10000,},
			[160]={[1]=6682,[2]=7812,[3]=8941,[4]=10000,},
			[170]={[1]=7341,[2]=8282,[3]=9035,[4]=10000,},
			[180]={[1]=8000,[2]=8753,[3]=9130,[4]=10000,},
			[190]={[1]=8753,[2]=9130,[3]=9224,[4]=10000,},
			[200]={[1]=9412,[2]=9412,[3]=9412,[4]=10000,},
			},
		[3]={
			[50]={[1]=96,[2]=2113,[3]=6723,[4]=10000,},
			[60]={[1]=96,[2]=3265,[3]=7683,[4]=10000,},
			[70]={[1]=768,[2]=3746,[3]=7875,[4]=10000,},
			[80]={[1]=1441,[2]=4226,[3]=7971,[4]=10000,},
			[90]={[1]=2113,[2]=4706,[3]=8067,[4]=10000,},
			[100]={[1]=2785,[2]=5186,[3]=8163,[4]=10000,},
			[110]={[1]=3457,[2]=5666,[3]=8355,[4]=10000,},
			[120]={[1]=4130,[2]=6147,[3]=8452,[4]=10000,},
			[130]={[1]=4802,[2]=6531,[3]=8644,[4]=10000,},
			[140]={[1]=5474,[2]=7011,[3]=8836,[4]=10000,},
			[150]={[1]=6147,[2]=7491,[3]=9028,[4]=10000,},
			[160]={[1]=6819,[2]=7971,[3]=9124,[4]=10000,},
			[170]={[1]=7491,[2]=8452,[3]=9220,[4]=10000,},
			[180]={[1]=8163,[2]=8932,[3]=9316,[4]=10000,},
			[190]={[1]=8932,[2]=9316,[3]=9412,[4]=10000,},
			[200]={[1]=9604,[2]=9604,[3]=9604,[4]=10000,},
			},
		[4]={
			[50]={[1]=98,[2]=2156,[3]=6860,[4]=10000,},
			[60]={[1]=98,[2]=3332,[3]=7840,[4]=10000,},
			[70]={[1]=784,[2]=3822,[3]=8036,[4]=10000,},
			[80]={[1]=1470,[2]=4312,[3]=8134,[4]=10000,},
			[90]={[1]=2156,[2]=4802,[3]=8232,[4]=10000,},
			[100]={[1]=2842,[2]=5292,[3]=8330,[4]=10000,},
			[110]={[1]=3528,[2]=5782,[3]=8526,[4]=10000,},
			[120]={[1]=4214,[2]=6272,[3]=8624,[4]=10000,},
			[130]={[1]=4900,[2]=6664,[3]=8820,[4]=10000,},
			[140]={[1]=5586,[2]=7154,[3]=9016,[4]=10000,},
			[150]={[1]=6272,[2]=7644,[3]=9212,[4]=10000,},
			[160]={[1]=6958,[2]=8134,[3]=9310,[4]=10000,},
			[170]={[1]=7644,[2]=8624,[3]=9408,[4]=10000,},
			[180]={[1]=8330,[2]=9114,[3]=9506,[4]=10000,},
			[190]={[1]=9114,[2]=9506,[3]=9604,[4]=10000,},
			[200]={[1]=9800,[2]=9800,[3]=9800,[4]=10000,},
			},
		[5]={
			[50]={[1]=100,[2]=2200,[3]=7000,[4]=10000,},
			[60]={[1]=100,[2]=3400,[3]=8000,[4]=10000,},
			[70]={[1]=800,[2]=3900,[3]=8200,[4]=10000,},
			[80]={[1]=1500,[2]=4400,[3]=8300,[4]=10000,},
			[90]={[1]=2200,[2]=4900,[3]=8400,[4]=10000,},
			[100]={[1]=2900,[2]=5400,[3]=8500,[4]=10000,},
			[110]={[1]=3600,[2]=5900,[3]=8700,[4]=10000,},
			[120]={[1]=4300,[2]=6400,[3]=8800,[4]=10000,},
			[130]={[1]=5000,[2]=6800,[3]=9000,[4]=10000,},
			[140]={[1]=5700,[2]=7300,[3]=9200,[4]=10000,},
			[150]={[1]=6400,[2]=7800,[3]=9400,[4]=10000,},
			[160]={[1]=7100,[2]=8300,[3]=9500,[4]=10000,},
			[170]={[1]=7800,[2]=8800,[3]=9600,[4]=10000,},
			[180]={[1]=8500,[2]=9300,[3]=9700,[4]=10000,},
			[190]={[1]=9300,[2]=9700,[3]=9800,[4]=10000,},
			[200]={[1]=10000,[2]=10000,[3]=10000,[4]=10000,},
			},			
}
LiXingHuoDong2_chongwuwupintable={
	[sanyanshou2] =chongwuhuizhang2,[anyuniao2] =chongwuhuizhang2,
	[sanyanshou4] =chongwuhuizhang4,[anyuniao4] =chongwuhuizhang4,
	[sanyanshou6] =chongwuhuizhang6,[anyuniao6] =chongwuhuizhang6,
}--通过怪兽ID 转换成相应的物品
--饲料表
LiXingHuoDong2_siliao_table = {[224]=20,[225]=10,[226]=40,[227]=10,[228]=20,[229]=40,[230]=10,[231]=20,[232]=40,
								[80513]=100,[80514]=100,[80515]=100,[80516]=100,}--采集时判断 23 > 0 可以采集  采集后回调 通过7622 获取物品ID 使用灵魂石接口 找位置然后处理
--LiXingHuoDong2_siliao_table = {[224]=100,[225]=100,[226]=100,[227]=100,[228]=100,[229]=100,[230]=100,[231]=100,[232]=100,
--								[80513]=100,[80514]=100,[80515]=100,[80516]=100,}--采集时判断 23 > 0 可以采集  采集后回调 通过7622 获取物品ID 使用灵魂石接口 找位置然后处理								
								
--饲料表2
LiXingHuoDong2_siliao_table2 = {
[1]={lieyancao,xiaokuaiderou,xiaokuaidegutou,},
[2]={lieyancao,xiaokuaiderou,xiaokuaidegutou,qingcao,zhongkuaiderou,zhongkuaidegutou,},
[3]={lieyancao,xiaokuaiderou,xiaokuaidegutou,qingcao,zhongkuaiderou,zhongkuaidegutou,kuhuangdecao,dakuaiderou,dakuaidegutou},
[4]={lieyancao,xiaokuaiderou,xiaokuaidegutou,qingcao,zhongkuaiderou,zhongkuaidegutou,kuhuangdecao,dakuaiderou,dakuaidegutou},
}--阶段 和 该阶段出现的饲料

LiXingHuoDong2_siliao_table3 = {
[224]=80645,[225]=80646,[226]=kuhuangdecao,[227]=xiaokuaiderou,[228]=zhongkuaiderou,[229]=dakuaiderou,[230]=xiaokuaidegutou,[231]=zhongkuaidegutou,[232]=dakuaidegutou,
}--采集ID 和 物品ID互转

LiXingHuoDong2_siliao_table4 = {
	[1] = {225,227,230,},
	[2] = {224,228,231,},
	[3] = {226,229,232,},
}
LiXingHuoDong2_dan_table = {
	[2] = {[1]=221,[2]=220,[3]=219,[4]=216,},
	[4] = {[1]=238,[2]=237,[3]=236,[4]=233,},
	[6] = {[1]=246,[2]=245,[3]=244,[4]=241,},
}
LiXingHuoDong2_dantubiao_table = {
	[2] = {[1]=80642,[2]=80641,[3]=80640,[4]=80637,},
	[4] = {[1]=80659,[2]=80658,[3]=80657,[4]=80654,},
	[6] = {[1]=80667,[2]=80666,[3]=80665,[4]=80662,},
}
LiXingHuoDong2_dan_table2 = {80637,80640,80641,80642,80654,80657,80658,80659,80662,80665,80666,80667}		
--活动地图
--[[LiXingHuoDong2_actmap_table={
[104] = {[1]={x1=326,y1=328,x2=404,y2=561,siliao1=1,siliao1num=0.5,siliao2=2,siliao2num=0.3,siliao3=3,siliao3num=0.2,mouster1=726179,mous1num=1,mouster2=726180,mous2num=1,},
		 [2]={x1=394,y1=311,x2=496,y2=415,siliao1=1,siliao1num=0.15,siliao2=2,siliao2num=0.2,siliao3=3,siliao3num=0.15,mouster1=726177,mous1num=5,mouster2=726178,mous2num=5,},
		 [3]={x1=393,y1=457,x2=499,y2=569,siliao1=1,siliao1num=0.15,siliao2=2,siliao2num=0.2,siliao3=3,siliao3num=0.15,mouster1=726177,mous1num=5,mouster2=726178,mous2num=5,},
		 [4]={x1=486,y1=330,x2=542,y2=546,siliao1=1,siliao1num=0.2,siliao2=2,siliao2num=0.3,siliao3=3,siliao3num=0.5,mouster1=726181,mous1num=1,mouster2=726182,mous2num=1,},
			},
} --]]
LiXingHuoDong2_actmap_table={
[104] = {[1]={x1=356,y1=267,x2=492,y2=611,siliao1=1,siliao1num=1,siliao2=2,siliao2num=1,siliao3=3,siliao3num=1,mouster1=726177,mous1num=1,},
			},
} 
--特殊事件时间触发器表
LiXingHuoDong2_suijishijian_timetable={15,25,35,45,}

--特殊事件表
LiXingHuoDong2_suijishijiantable = {
[1] = {[1]={gailv=60,leixing=1,},
	   [2]={gailv=100,leixing=2,},
		},
[2] = {[1]={gailv=25,leixing=1,},
	   [2]={gailv=25,leixing=2,},
	   [3]={gailv=25,leixing=3,},
	   [4]={gailv=30,leixing=4,},
	   [5]={gailv=30,leixing=5,},
	   [6]={gailv=30,leixing=6,},
	   [5]={gailv=100,leixing=7,},
		},
[3] = {[1]={gailv=20,leixing=3,},
	   [2]={gailv=20,leixing=4,},
	   [3]={gailv=25,leixing=5,},
	   [4]={gailv=25,leixing=6},
	   [5]={gailv=100,leixing=7,},
		},
[4] = {[1]={gailv=10,leixing=1,},
	   [2]={gailv=10,leixing=2,},
	   [3]={gailv=15,leixing=3,},
	   [4]={gailv=15,leixing=4,},
	   [5]={gailv=20,leixing=5,},
	   [6]={gailv=20,leixing=6,},
	   [7]={gailv=100,leixing=7,},
		},
}

--奖励
LiXingHuoDong2_jiangli={
[sanyanshou2] = {[1]=0,[2]=2480,[3]=4464,[4]=7688,[5]=12648,},
[sanyanshou4] = {[1]=0,[2]=10960,[3]=19728,[4]=33976,[5]=55896,},
[sanyanshou6] = {[1]=0,[2]=21480,[3]=38664,[4]=66588,[5]=109548,},
[anyuniao2] = {[1]=0,[2]=2480,[3]=4464,[4]=7688,[5]=12648,},
[anyuniao4] = {[1]=0,[2]=10960,[3]=19728,[4]=33976,[5]=55896,},
[anyuniao6] = {[1]=0,[2]=21480,[3]=38664,[4]=66588,[5]=109548,},
}
LiXingHuoDong2_jiangli_egg={
[8]={[1]=34,[2]=172,[3]=344,[4]=689,[5]=212,[6]=395,[7]=548,[8]=774,[9]=936,[10]=1150,[11]=1235,[12]=1489,[13]=1596,[14]=0,},
[9]={[1]=152,[2]=761,[3]=1523,[4]=3046,[5]=940,[6]=1758,[7]=3965,[8]=3450,[9]=4182,[10]=5154,[11]=5651,[12]=6748,[13]=7264,[14]=0,},
[10]={[1]=298,[2]=1492,[3]=2985,[4]=5970,[5]=1843,[6]=3443,[7]=7767,[8]=6756,[9]=8187,[10]=10086,[11]=11051,[12]=13188,[13]=14191,[14]=0,},
}
LiXingHuoDong2_jiangli_egg_huoli={
[8]={[1]=0,[2]=2,[3]=5,[4]=10,[5]=3,[6]=5,[7]=7,[8]=10,[9]=12,[10]=14,[11]=15,[12]=17,[13]=17,[14]=0,},
[9]={[1]=1,[2]=4,[3]=7,[4]=14,[5]=4,[6]=8,[7]=11,[8]=15,[9]=18,[10]=22,[11]=22,[12]=25,[13]=26,[14]=0,},
[10]={[1]=1,[2]=5,[3]=10,[4]=19,[5]=6,[6]=11,[7]=14,[8]=20,[9]=24,[10]=29,[11]=30,[12]=34,[13]=35,[14]=0,},
}
LiXingHuoDong2_jiangli_egg_jinbi={
[8]={[1]=8,[2]=42,[3]=83,[4]=166,[5]=50,[6]=91,[7]=125,[8]=174,[9]=208,[10]=249,[11]=258,[12]=291,[13]=299,[14]=0,},
[9]={[1]=16,[2]=82,[3]=164,[4]=327,[5]=98,[6]=180,[7]=245,[8]=343,[9]=409,[10]=491,[11]=507,[12]=572,[13]=589,[14]=0,},
[10]={[1]=31,[2]=155,[3]=310,[4]=620,[5]=186,[6]=341,[7]=465,[8]=651,[9]=775,[10]=931,[11]=962,[12]=1086,[13]=1117,[14]=0,},
}

--第一部分
if API_GetServerID() == 1 or API_GetServerID() == 7 then
	local MapID
	if LiXingHuoDong2_TimerTriggerID ~= nil then
		API_DestroyTriggerG(LiXingHuoDong2_TimerTriggerID)
--API_Trace('怪兽时间触发器删除='..API_GetServerID（）)		
	end
	LiXingHuoDong2_TimerTriggerID = API_CreateTimerTriggerG(0,0,60,-1,'LiXingHuoDong2_TimerTriggerGCallFunc')
	
	if LiXingHuoDong2_TimerTriggerID3 ~= nil then
		API_DestroyTriggerG(LiXingHuoDong2_TimerTriggerID3)
--API_Trace('怪兽时间触发器删除='..API_GetServerID（）)		
	end	
	LiXingHuoDong2_TimerTriggerID3 = API_CreateTimerTriggerG(0,0,30,-1,'LiXingHuoDong2_TimerTriggerGCallFunc3')--刷饲料
--API_Trace('怪兽时间触发器创建='..API_GetServerID())
--每分钟回调1次 刷怪和广告都由这个控制
	if LiXingHuoDong2_chanwutongjitable == nil then
		LiXingHuoDong2_chanwutongjitable = {}
	end
	if LiXingHuoDong2_siliaoshuaxintable == nil then
		LiXingHuoDong2_siliaoshuaxintable = {}
	end
	if LiXingHuoDong2_mostershuaxintable == nil then
		LiXingHuoDong2_mostershuaxintable = {}
	end	
	--创建NPC
	--[[for j in LiXingHuoDong2_actmap_table do
		MapID = API_GetRightMapID(j)
		if siyangyuan1 ~= nil then
			API_DestroyMonster(siyangyuan1)
		end
		siyangyuan1 = API_CreateMonster(MapID,11931,439,431,5,0,-1)		--饲养员
		if siyangyuan2 ~= nil then
			API_DestroyMonster(siyangyuan2)
		end
		siyangyuan2 = API_CreateMonster(MapID,11931,440,293,5,0,-1)		--饲养员	
		if siyangyuan3 ~= nil then
			API_DestroyMonster(siyangyuan3)
		end
		siyangyuan3 = API_CreateMonster(MapID,11931,433,585,5,0,-1)		--饲养员	
		
		if kuadaochuansong1 ~= nil then
			API_DestroyMonster(kuadaochuansong1)
		end
		kuadaochuansong1 = API_CreateMonster(MapID,12045,434,237,5,0,1)	--跨岛传送联邦	
		if kuadaochuansong2 ~= nil then
			API_DestroyMonster(kuadaochuansong2)
		end
		kuadaochuansong2 = API_CreateMonster(MapID,12045,438,667,5,0,0)	--跨岛传送帝国
			
		if likaishuangzidao1 ~= nil then
			API_DestroyMonster(likaishuangzidao1)
		end
		likaishuangzidao1 = API_CreateMonster(MapID,12047,439,221,5,0,1)	--离开双子岛联邦	
		if likaishuangzidao2 ~= nil then
			API_DestroyMonster(likaishuangzidao2)
		end
		likaishuangzidao2 = API_CreateMonster(MapID,12047,430,686,5,0,0)	--离开双子岛帝国
	end	--]]
end 
if not API_IsEctypeServer() then
	if API_GetServerID() == 6 then
		if LiXingHuoDong2_TimerTriggerID2 ~= nil then
			API_DestroyTriggerG(LiXingHuoDong2_TimerTriggerID2)
		end	
		if API_IsBattleGameServer() then
		else
			LiXingHuoDong2_TimerTriggerID2 = API_CreateTimerTriggerG(0,0,60,-1,'LiXingHuoDong2_TimerTriggerGCallFunc2')
		end
	end	
end
function LiXingHuoDong2_TimerTriggerGCallFunc3(a,b)
--API_Trace('进入刷饲料=')
--API_Trace('怪兽时间触发器回调='..API_GetServerID())
	local year,month,day,hour,min,sec,wday = PublicFun_time()
	local MapID	
	if hour == LiXingHuoDong2_StartTime or hour == LiXingHuoDong3_StartTime then
--API_Trace('时间OK=')	
		for j in LiXingHuoDong2_actmap_table do
			MapID = API_GetRightMapID(j)
			local playernumtable = API_GetActorInArea(MapID,0,0,0,0,0)
			local playernum = table.getn(playernumtable)
			local num1 = 0
			local num2 = 0
			local num3 = 0
			local num4 = 0
			local x1 = 0
			local y1 = 0
			local x2 = 0
			local y2 = 0
			if playernum <= 150 then
				num1 = 292
				num2 = 81
				num3 = 45
				num4 = 20
				x1 = 388 
				y1 = 269
				x2 = 477
				y2 = 613
			elseif playernum > 150 and playernum < 600 then
				local duoyunum = playernum - 150
				num1 = 292 + duoyunum * 1.944
				num2 = 81 + duoyunum * 0.534
				num3 = 45 + duoyunum * 0.294
				num4 = 20 + duoyunum * 0.2
 			elseif playernum >= 600 then
				num1 = 1167
				num2 = 321
				num3 = 177
				num4 = 80
			end
			if LiXingHuoDong2_actmap_table[j] ~= nil then
				for i in LiXingHuoDong2_actmap_table[j] do
					local siliaolevel1 = LiXingHuoDong2_actmap_table[j][i].siliao1
					local siliaolevel2 = LiXingHuoDong2_actmap_table[j][i].siliao2
					local siliaolevel3 = LiXingHuoDong2_actmap_table[j][i].siliao3
					if x1 == 0 or y1 == 0 then 
						x1 = LiXingHuoDong2_actmap_table[j][i].x1
						y1 = LiXingHuoDong2_actmap_table[j][i].y1
					end
					if x2 == 0 or y2 == 0 then 
						x2 = LiXingHuoDong2_actmap_table[j][i].x2
						y2 = LiXingHuoDong2_actmap_table[j][i].y2
					end
					local newnum1 = LiXingHuoDong2_actmap_table[j][i].siliao1num
					local newnum2 = LiXingHuoDong2_actmap_table[j][i].siliao2num
					local newnum3 = LiXingHuoDong2_actmap_table[j][i].siliao3num
					local mouster1 = LiXingHuoDong2_actmap_table[j][i].mouster1
					local mous1num = LiXingHuoDong2_actmap_table[j][i].mous1num
				--	local mouster2 = LiXingHuoDong2_actmap_table[j][i].mouster2
					--local mous2num = LiXingHuoDong2_actmap_table[j][i].mous2num
					local quyu = i
					newnum1 = newnum1 *num1
					newnum2 = newnum2 *num2
					newnum3 = newnum3 *num3
					mous1num = mous1num *num4
					newnum1 = PublicFun_4floor5ceil(newnum1)
					newnum2 = PublicFun_4floor5ceil(newnum2)
					newnum3 = PublicFun_4floor5ceil(newnum3) 
					mous1num = PublicFun_4floor5ceil(mous1num)
					LiXingHuoDong2_siliaoshuaxin(MapID,x1,y1,x2,y2,siliaolevel1,newnum1,quyu)
					LiXingHuoDong2_siliaoshuaxin(MapID,x1,y1,x2,y2,siliaolevel2,newnum2,quyu)
					LiXingHuoDong2_siliaoshuaxin(MapID,x1,y1,x2,y2,siliaolevel3,newnum3,quyu)
					LiXingHuoDong2_mostershuaxin(MapID,x1,y1,x2,y2,mouster1,mous1num,quyu)
					--LiXingHuoDong2_mostershuaxin(MapID,x1,y1,x2,y2,mouster2,mous2num,quyu)
				end
			end	
		end
	end
end
function LiXingHuoDong2_TimerTriggerGCallFunc2(a,b)
	local year,month,day,hour,min,sec,wday = PublicFun_time()		
	--[[if hour == 8 or hour == 10 or hour == 12 or hour == 14 or hour == 16 or hour == 18 or hour == 22 then  
		if min == 1 then
			API_ActorBroadcastMsgEx(-1,-1,0,17,'每天20点-21点，去“双子岛”找“饲养员”，帮他养成怪兽，有大量“经验”和高额“金币”作为回报。')
			API_ActorBroadcastMsgEx(-1,-1,0,1,'每天20点-21点，去“双子岛”找“饲养员”，帮他养成怪兽，有大量“经验”和高额“金币”作为回报。')
			API_ActorBroadcastMsgEx(-1,-1,0,7,'每天20点-21点，去“双子岛”找“饲养员”，帮他养成怪兽，有大量“经验”和高额“金币”作为回报。')
		end
	end	]]
	if hour == 11 then
		if min == 30 or min == 45 or min == 55 then
			API_ActorBDCMsg(-1,0,-1,11,85,0,17,'每天12点-13点，去“双子岛”找“饲养员”，帮他养成怪兽，有大量“经验”和高额“金币”作为回报。')
			API_ActorBDCMsg(-1,1,-1,11,85,0,1,'每天12点-13点，去“双子岛”找“饲养员”，帮他养成怪兽，有大量“经验”和高额“金币”作为回报。')
			API_ActorBDCMsg(-1,0,-1,11,85,0,7,'每天12点-13点，去“双子岛”找“饲养员”，帮他养成怪兽，有大量“经验”和高额“金币”作为回报。')			
		end
	end	
	if hour == 18 then
		if min == 30 or min == 45 or min == 55 then
			API_ActorBDCMsg(-1,0,-1,11,85,0,17,'每天22点-23点，去“双子岛”找“饲养员”，帮他养成怪兽，有大量“经验”和高额“金币”作为回报。')
			API_ActorBDCMsg(-1,1,-1,11,85,0,1,'每天22点-23点，去“双子岛”找“饲养员”，帮他养成怪兽，有大量“经验”和高额“金币”作为回报。')
			API_ActorBDCMsg(-1,0,-1,11,85,0,7,'每天22点-23点，去“双子岛”找“饲养员”，帮他养成怪兽，有大量“经验”和高额“金币”作为回报。')			
		end
	end	
	if hour == LiXingHuoDong2_StartTime or hour == LiXingHuoDong3_StartTime then
		if min == 1 then
			API_ActorBDCMsg(-1,0,-1,11,85,0,17,'现在去“双子岛”找“饲养员”，帮他养成怪兽，有大量“经验”和高额“金币”作为回报。')
			API_ActorBDCMsg(-1,1,-1,11,85,0,1,'现在去“双子岛”找“饲养员”，帮他养成怪兽，有大量“经验”和高额“金币”作为回报。')
			API_ActorBDCMsg(-1,0,-1,11,85,0,7,'现在去“双子岛”找“饲养员”，帮他养成怪兽，有大量“经验”和高额“金币”作为回报。')			
		end
	end
end
function LiXingHuoDong2_TimerTriggerGCallFunc(a,b)
--API_Trace('怪兽时间触发器回调='..API_GetServerID())
	local year,month,day,hour,min,sec,wday = PublicFun_time()
	local MapID	
	if hour == LiXingHuoDong2_StartTime or hour == LiXingHuoDong3_StartTime then
--API_Trace('时间OK=')	
		for j in LiXingHuoDong2_actmap_table do
			MapID = API_GetRightMapID(j)
			if min == 55 then
				API_ActorBroadcastMsgEx(MapID,-1,0,17,'5分钟后怪兽进化活动将结束，请抓紧时间喂养怪兽。')
				API_ActorBroadcastMsgEx(MapID,-1,0,1,'5分钟后怪兽进化活动将结束，请抓紧时间喂养怪兽。')
				API_ActorBroadcastMsgEx(MapID,-1,0,7,'5分钟后怪兽进化活动将结束，请抓紧时间喂养怪兽。')
			end	
			if min == 0 then
				API_ActorCallBack(MapID,1,-1,'LiXingHuoDong2_zaixianhuidiao')--对地图上所有在线玩家进行回调 执行1次 LOGIN		
			end
		end
	end
	if hour == LiXingHuoDong2_EndTime or hour == LiXingHuoDong3_EndTime then --删除饲料 删除怪兽
		for j in LiXingHuoDong2_actmap_table do
			MapID = API_GetRightMapID(j)
			if LiXingHuoDong2_actmap_table[j] ~= nil then
				for i in LiXingHuoDong2_actmap_table[j] do
					local siliaolevel1 = LiXingHuoDong2_actmap_table[j][i].siliao1
					local siliaolevel2 = LiXingHuoDong2_actmap_table[j][i].siliao2
					local siliaolevel3 = LiXingHuoDong2_actmap_table[j][i].siliao3
					--local num1 = LiXingHuoDong2_actmap_table[j][i].siliao1num
					--local num2 = LiXingHuoDong2_actmap_table[j][i].siliao2num
					--local num3 = LiXingHuoDong2_actmap_table[j][i].siliao3num
					--local mous1num = LiXingHuoDong2_actmap_table[j][i].mous1num
					--local mous2num = LiXingHuoDong2_actmap_table[j][i].mous2num
					local mouster1 = LiXingHuoDong2_actmap_table[j][i].mouster1
					--local mouster2 = LiXingHuoDong2_actmap_table[j][i].mouster2
					local quyu = i
					LiXingHuoDong2_siliaodelete(MapID,siliaolevel1,quyu)
					LiXingHuoDong2_siliaodelete(MapID,siliaolevel2,quyu)
					LiXingHuoDong2_siliaodelete(MapID,siliaolevel3,quyu)
					LiXingHuoDong2_mosterdelete(MapID,mouster1,quyu)
					--LiXingHuoDong2_mosterdelete(MapID,mouster2,mous2num,quyu)
				end
			end
			if min == 0 then		
				API_ActorCallBack(MapID,1,-1,'LiXingHuoDong2_jieshuzhuangtai')
			end
		end
		if min == 1 then
			for j in LiXingHuoDong2_chanwutongjitable do --删除蛋
				MapID = API_GetRightMapID(j)
				if LiXingHuoDong2_chanwutongjitable[MapID] ~= nil then
					local biaochang = table.getn(LiXingHuoDong2_chanwutongjitable[MapID])
					for i = 1, biaochang do
						if LiXingHuoDong2_chanwutongjitable[MapID][i] ~= nil then
							local UID = LiXingHuoDong2_chanwutongjitable[MapID][i].UID 
							local a,b = API_GetLongOfUID(UID)
							if API_IsExistByUID(a,b) == true then
								if API_DestroyByUID(a,b) == true then
									LiXingHuoDong2_chanwutongjitable[MapID][i].UID = 0
								end
							end
						end
					end
				end
				LiXingHuoDong2_chanwutongjitable[MapID] = nil
			end	
		end	
	end
end
--问题1：关于怪兽死亡创采集饲料的问题
--由于效率问题，不创建触发器
--怪兽死亡 直接掉落饲料
function LiXingHuoDong2_siliaoshuaxin(MapID,x1,y1,x2,y2,siliaolevel,num,quyu)
	if API_MapIsValid(MapID) then
		if LiXingHuoDong2_siliaoshuaxintable[MapID] == nil then
			LiXingHuoDong2_siliaoshuaxintable[MapID] = {}
		end
		if LiXingHuoDong2_siliaoshuaxintable[MapID][quyu] == nil then
			LiXingHuoDong2_siliaoshuaxintable[MapID][quyu] = {}
		end
		if LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel] == nil then
			LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel] = {}
		end
		if type(LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel]) == 'table' then
			for j = 1,num do
				if LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j] == nil then				
					local TileX = 1
					local TileY = 1
					local cishu = 0
					repeat
						TileX = math.random(x1,x2)
						TileY = math.random(y1,y2)
						cishu = cishu + 1
					until not API_IsBlockTile(MapID,TileX,TileY,0) or cishu == 50
						local kuangID = math.random(table.getn(LiXingHuoDong2_siliao_table4[siliaolevel]))	
						local siliaoID = LiXingHuoDong2_siliao_table4[siliaolevel][kuangID]
						local UID = API_CreateResBoxEx_RetUIDHigh(MapID,TileX,TileY,siliaoID,1,'例行活动2',0)--饲料可以挖掘1次 绑定方式走默认
						local UIDL = API_GetUIDLow()
						if UID > 0 and UIDL > 0 then
							if LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j] == nil then
								LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j] = {}
							end
							LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j].High = UID
							LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j].Low = UIDL
						end
				else				
					local UID = LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j].High
					local UIDL = LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j].Low 
					if API_IsExistByUID(UID,UIDL) == true then
					else				
						local TileX = 1
						local TileY = 1
						local cishu = 0
						repeat
							TileX = math.random(x1,x2)
							TileY = math.random(y1,y2)
							cishu = cishu + 1
						until not API_IsBlockTile(MapID,TileX,TileY,0) or cishu == 50	
							local kuangID = math.random(table.getn(LiXingHuoDong2_siliao_table4[siliaolevel]))								
							local siliaoID = LiXingHuoDong2_siliao_table4[siliaolevel][kuangID]
							local UID = API_CreateResBoxEx_RetUIDHigh(MapID,TileX,TileY,siliaoID,1,'例行活动2',0)--饲料可以挖掘1次 绑定方式走默认					
							local UIDL = API_GetUIDLow()
							if UID > 0 and UIDL > 0 then
								LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j].High = UID
								LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j].Low = UIDL
							end
					end
				end
			end
		end
	end
end
function LiXingHuoDong2_mostershuaxin(MapID,x1,y1,x2,y2,mouster,num,quyu)
	if API_MapIsValid(MapID) then
		if LiXingHuoDong2_mostershuaxintable[MapID] == nil then
			LiXingHuoDong2_mostershuaxintable[MapID] = {}
		end
		if LiXingHuoDong2_mostershuaxintable[MapID][quyu] == nil then
			LiXingHuoDong2_mostershuaxintable[MapID][quyu] = {}
		end
		if LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster] == nil then
			LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster] = {}
		end
		if type(LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster]) == 'table' then
			for j = 1,num do
				if LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster][j] == nil then
					local TileX = 1
					local TileY = 1
					local cishu = 0
					repeat
						TileX = math.random(x1,x2)
						TileY = math.random(y1,y2)
						cishu = cishu + 1
					until not API_IsBlockTile(MapID,TileX,TileY,0) or cishu == 50	
						local FastID = API_CreateMonster(MapID,mouster,TileX,TileY,4,0,-1)
						API_CreateDieTriggerG(0,0,0,FastID,'LiXingHuoDong2_mostersiwangsiliaochuangjian')
						if API_GetMonsterID(FastID) > 0 then 
							if LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster][j] == nil then
								LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster][j] = {}
							end
							LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster][j].FastID = FastID
						end
				else
					local FastID = LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster][j].FastID
					if API_GetMonsterID(FastID) <= 0 then
						local TileX = 1
						local TileY = 1
						local cishu = 0
						repeat
							TileX = math.random(x1,x2)
							TileY = math.random(y1,y2)
							cishu = cishu + 1
						until not API_IsBlockTile(MapID,TileX,TileY,0) or cishu == 50	
							FastID = API_CreateMonster(MapID,mouster,TileX,TileY,4,0,-1)
							API_CreateDieTriggerG(0,0,0,FastID,'LiXingHuoDong2_mostersiwangsiliaochuangjian')
							if API_GetMonsterID(FastID) > 0 then 
								if LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster][j] == nil then
									LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster][j] = {}
								end
								LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster][j].FastID = FastID
							end
					end
				end
			end
		end
	end
end
function LiXingHuoDong2_siliaodelete(MapID,siliaolevel,quyu)
	if API_MapIsValid(MapID) then
		if LiXingHuoDong2_siliaoshuaxintable[MapID] == nil then
			LiXingHuoDong2_siliaoshuaxintable[MapID] = {}
		end
		if LiXingHuoDong2_siliaoshuaxintable[MapID][quyu] == nil then
			LiXingHuoDong2_siliaoshuaxintable[MapID][quyu] = {}
		end
		if LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel] == nil then
			LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel] = {}
		end
		if type(LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel]) == 'table' then
			local num = table.getn(LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel])
			for j = 1,num do
				if LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j] == nil then
				else
					local UID = LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j].High
					local UIDL = LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j].Low 
					if API_IsExistByUID(UID,UIDL) == true then
						if API_DestroyByUID(UID,UIDL) == true then
							LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j].High = 0
							LiXingHuoDong2_siliaoshuaxintable[MapID][quyu][siliaolevel][j].Low = 0
						end
					end
				end
			end
		end
	end	
end
function LiXingHuoDong2_mosterdelete(MapID,mouster,quyu)
	if API_MapIsValid(MapID) then
		if LiXingHuoDong2_mostershuaxintable[MapID] == nil then
			LiXingHuoDong2_mostershuaxintable[MapID] = {}
		end
		if LiXingHuoDong2_mostershuaxintable[MapID][quyu] == nil then
			LiXingHuoDong2_mostershuaxintable[MapID][quyu] = {}
		end
		if LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster] == nil then
			LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster] = {}
		end
		if type(LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster]) == 'table' then
			local num = table.getn(LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster])
			for j = 1,num do
				if LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster][j] == nil then
				else
					local FastID = LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster][j].FastID					
					if API_GetMonsterID(FastID) > 0 then
						API_DestroyMonster(FastID)						
						LiXingHuoDong2_mostershuaxintable[MapID][quyu][mouster][j].FastID = 0
					end
				end
			end
		end
	end
end

--第二部分
function LiXingHuoDong2_chongwulingqujiluqingchu(ActorID)--每日怪兽领取记录 清0
	API_VarDataSetNumber(ActorID,1,7621,0)
end
function LiXingHuoDong2_jieshuzhuangtai(ActorID)--养成状态清0
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(MapID)
	if StaticMapID == 104 then
		local zhuangtai = API_VarDataGetNumber(ActorID,1,7626)
		if zhuangtai > 0 then
			API_VarDataSetNumber(ActorID,1,7626,0)
			API_ActorSendMsg(ActorID,1,'怪兽进化活动结束，停止养成。请去“饲养员”处换取奖励。')
			API_ActorSendMsg(ActorID,0,'怪兽进化活动结束，停止养成。请去“饲养员”处换取奖励。')
			API_ActorSendMsg(ActorID,7,'怪兽进化活动结束，停止养成。请去“饲养员”处换取奖励。')
			API_ActorSendMsg(ActorID,17,'怪兽进化活动结束，停止养成。请去“饲养员”处换取奖励。')
		end
		local Camp = API_GetActorCamp(ActorID)
		local PKzhenying = 0
		if Camp == 0 then
			PKzhenying = 1
		end
		if Camp == 1 then
			PKzhenying = 1
		end
		API_ActorSetPKTeamID(ActorID,PKzhenying)
		local FASTID = API_VarDataGetNumber(ActorID,1,7623)	
		if FASTID > 0 then
			if API_GetMonsterID(FASTID) > 0 then
				LiXingHuoDong2_chongwu_del(ActorID)		
			end
		end	
		if API_ActorGetGoodsNum(ActorID,88000) > 0 then
			LiXingHuoDong2_wenbenkuangtishi(ActorID,3)		
		end
	end
end
function LiXingHuoDong2_zaixianhuidiao(ActorID)
	LiXingHuoDong2_OnLogin2(ActorID)
	API_ActorSetPKTeamID(ActorID,1)
	API_ActorSendMsg(ActorID,0,'怪兽进化活动开始，请去“饲养员”处换取怪兽。帮助“饲养员”培养怪兽可以获得大量经验和高额金币奖励。')
	API_ActorSendMsg(ActorID,1,'怪兽进化活动开始，请去“饲养员”处换取怪兽。帮助“饲养员”培养怪兽可以获得大量经验和高额金币奖励。')
	API_ActorSendMsg(ActorID,7,'怪兽进化活动开始，请去“饲养员”处换取怪兽。帮助“饲养员”培养怪兽可以获得大量经验和高额金币奖励。')
	API_ActorSendMsg(ActorID,17,'怪兽进化活动开始，请去“饲养员”处换取怪兽。帮助“饲养员”培养怪兽可以获得大量经验和高额金币奖励。')
end
function LiXingHuoDong2_NPC(ActorID,NPCID)	
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local playerbeibaokongjian = API_ActorGetPackageSize(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local year,month,day,hour,min,sec,wday = PublicFun_time()
	local jilu = API_VarDataGetNumber(ActorID,1,7621)
	local type1 = 0 --鸡
	local type2 = 0 --蛋
	if API_ActorGetGoodsNum(ActorID,88000) > 0 then
		type1 = 1
	end
	for i in LiXingHuoDong2_dan_table2 do
		if LiXingHuoDong2_dan_table2[i] ~= nil then
			local wupinid = LiXingHuoDong2_dan_table2[i]
			if API_ActorGetGoodsNum(ActorID,wupinid) > 0 then
				type2 = 2
				break
			end
		end
		if type2 == 2 then
			break
		end
	end
	local type3 = 0
	type3 = type1 + type2
	if SelectItem == 1 then
		--进入迪文的新清空函数 把每日领取清0
		--怪兽也每日清0 上缴怪兽 丢弃后 清0
		local chongwuF = API_VarDataGetNumber(ActorID,1,7623)
		local chongwuM = API_VarDataGetNumber(ActorID,1,7622)
		local playLevel = API_GetActorPeerageLevel(ActorID)
		if playLevel == 1 then
			API_ResponseWrite('<text color="255,255,255">只有</text><text color="0,255,255">10级以上</text><text color="255,255,255">的玩家才能</text><text color="0,255,255">参加此活动。</text><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		end
		if LiXingHuoDong2_chongwutable[playLevel] == nil then
			API_ActorSendMsg(ActorID,0,'领取怪兽时发生错误，请与GM取得联系。')
			API_ActorSendMsg(ActorID,7,'领取怪兽时发生错误，请与GM取得联系。')
			return
		end
		if chongwuF > 0 then
			API_ResponseWrite('<text color="255,255,255">您正在培养怪兽，不能领取别的怪兽。</text><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
			return
		end
		if jilu >= 2 then
			API_ResponseWrite('<text color="255,255,255">您今天已经领取了</text><text color="0,255,255">2只怪兽</text><text color="255,255,255">，不能再领取了。</text><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		else
			if chongwuM > 0 then
			else
				local xuhao = math.random(table.getn(LiXingHuoDong2_chongwutable[playLevel]))
				chongwuM = LiXingHuoDong2_chongwutable[playLevel][xuhao]
				API_VarDataSetNumber(ActorID,1,7622,chongwuM)
			end
			chongwuM = API_VarDataGetNumber(ActorID,1,7622)
			API_ResponseWrite('<text color="255,255,255">帮我照顾这只</text><text color="0,255,255">'..API_GetMonsterNameByID(chongwuM)..'</text><text color="255,255,255">吧。</text><br><br>')
			API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=7">好的，交给我吧</a><br>')
			API_ResponseWrite('<br><a>算了，下次再说吧</a><br>')
		end		
	elseif SelectItem == 2 then
		API_ResponseWrite('<text color="255,255,255">你想兑换哪个档次的奖励？</text><br><br>')
		API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=8">用二档的“蛋”兑换奖励</a><br>')
		API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=9">用三档的“蛋”兑换奖励</a><br>')
		API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=10">用四档的“蛋”兑换奖励</a><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
	elseif SelectItem == 3 then
	elseif SelectItem == 4 then
		if type3 == 0 then --无鸡无蛋
			API_ResponseWrite('<name>了解怪兽进化</name>')
			API_ResponseWrite('<text color="255,255,255">你想了解些什么？</text><br><br>')
			API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=6">'..string.format("%-35s",'怪兽换经验')..'</a><a href="LiXingHuoDong2_NPC?1=2">'..string.format("%-35s",'“蛋”兑换')..'</a><a href="LiXingHuoDong2_NPC?1=15">'..string.format("%-35s",'活动时间')..'</a><br>')
			API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=16">'..string.format("%-35s",'了解怪兽进化')..'</a><a href="LiXingHuoDong2_NPC?1=12">'..string.format("%-35s",'饲料档次说明')..'</a><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		elseif type3 == 1 then --有鸡无蛋
			API_ResponseWrite('<name>了解怪兽进化</name>')
			API_ResponseWrite('<text color="255,255,255">你想了解些什么？</text><br><br>')
			API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=2">'..string.format("%-35s",'“蛋”兑换')..'</a><a href="LiXingHuoDong2_NPC?1=15">'..string.format("%-35s",'活动时间')..'</a><a href="LiXingHuoDong2_NPC?1=16">'..string.format("%-35s",'了解怪兽进化')..'</a><br>')
			API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=12">'..string.format("%-35s",'饲料档次说明')..'</a><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		elseif type3 == 2 then --无鸡有蛋
			API_ResponseWrite('<name>了解怪兽进化</name>')
			API_ResponseWrite('<text color="255,255,255">你想了解些什么？</text><br><br>')
			API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=6">'..string.format("%-35s",'怪兽换经验')..'</a><a href="LiXingHuoDong2_NPC?1=15">'..string.format("%-35s",'活动时间')..'</a><a href="LiXingHuoDong2_NPC?1=16">'..string.format("%-35s",'了解怪兽进化')..'</a><br>')
			API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=12">'..string.format("%-35s",'饲料档次说明')..'</a><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		elseif type3 == 3 then --有鸡有蛋
			API_ResponseWrite('<name>了解怪兽进化</name>')
			API_ResponseWrite('<text color="255,255,255">你想了解些什么？</text><br><br>')
			API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=15">'..string.format("%-35s",'活动时间')..'</a><a href="LiXingHuoDong2_NPC?1=16">'..string.format("%-35s",'了解怪兽进化')..'</a><a href="LiXingHuoDong2_NPC?1=12">'..string.format("%-35s",'饲料档次说明')..'</a><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		end
	elseif SelectItem == 15 then
		API_ResponseWrite('<name>了解怪兽进化</name>')
		API_ResponseWrite('<text color="255,255,255">每天的</text><text color="0,255,255">12点-13点和22点-23点在双子岛会举行“怪兽进化”活动</text><text color="255,255,255">，帮我照顾怪兽，我会根据怪兽的</text><text color="0,255,255">成长次数</text><text color="255,255,255">给予你</text><text color="0,255,255">经验</text><text color="255,255,255">奖励。怪兽生下的</text><text color="0,255,255">蛋</text><text color="255,255,255">可以拿到我这里换取</text><text color="0,255,255">“经验"、“活力”和“金币”奖励。</text><br>')
		API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1=4">了解其它信息</a><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
	elseif SelectItem == 16 then
		API_ResponseWrite('<name>了解怪兽进化</name>')
		API_ResponseWrite('<text color="255,255,255">在活动时间内，</text><text color="0,255,255">采集饲料</text><text color="255,255,255">喂养怪兽，并且要保证</text><text color="0,255,255">怪兽的生存。</text><text color="255,255,255">当怪兽食用</text><text color="0,255,255">一定数量的饲料</text><text color="255,255,255">后，就会进行</text><text color="0,255,255">进化</text><text color="255,255,255">。怪兽</text><text color="0,255,255">进化次数越多</text><text color="255,255,255">换取的</text><text color="0,255,255">经验奖励越多</text><text color="255,255,255">，产</text><text color="0,255,255">金蛋</text><text color="255,255,255">的概率越高。</text><br>')
		API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1=4">了解其它信息</a><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
	elseif SelectItem == 17 then
		API_ResponseWrite('<name>了解怪兽进化</name>')
		API_ResponseWrite('<text color="0,255,255">进化</text><text color="255,255,255">。怪兽</text><text color="0,255,255">进化次数越多</text><text color="255,255,255">换取的</text><text color="0,255,255">经验奖励越多</text><text color="255,255,255">，产</text><text color="0,255,255">金蛋</text><text color="255,255,255">的概率越高。</text><br>')
		API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1=4">了解其它信息</a><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
	elseif SelectItem == 18 then
		API_ResponseWrite('<name>了解怪兽进化</name>')
		API_ResponseWrite('<text color="0,255,255">怪兽进化后</text><text color="255,255,255">可以把怪兽带到</text><text color="0,255,255">“饲养员”处换取奖励</text><text color="255,255,255">，怪兽</text><text color="0,255,255">进化次数越多</text><text color="255,255,255">，换取的</text><text color="0,255,255">经验</text><text color="255,255,255">奖励越多。</text><br>')
		API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1=4">了解其它信息</a><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
	elseif SelectItem == 5 then
		local hechengpin = 0
		local cailiao1 = 0
		local cailiao1num = 0
		local cailiao2 = 0
		local cailiao2num = 0
		local beibaokongjian = 0
		if SelectItem == 5 then
			hechengpin = siliaolevel5
			cailiao1 = siliaolevel4
		    cailiao1num = 5
			beibaokongjian = 1
		end
		if beibaokongjian > 0 then
			if playerbeibaokongjian >= beibaokongjian then
				LiXingHuoDong2_duihuan(ActorID,hechengpin,cailiao1,cailiao1num,cailiao2,cailiao2num)
			else
				API_ActorSendMsg(ActorID,0,'您的背包空间不足，不能进行兑换。')
				return
			end
		else
			API_ActorSendMsg(ActorID,0,'兑换时发生错误，请与GM取得联系。')
			API_ActorSendMsg(ActorID,7,'兑换时发生错误，请与GM取得联系。')
			return
		end
	elseif SelectItem == 6 then
		if type1 == 1 then 
			API_ResponseWrite('<name>怪兽换经验</name>')
			API_ResponseWrite('<text color="255,255,255">来让我看看，你把这个小家伙培养成什么样了。</text><br>')
			API_ResponseWrite('<text color="255,255,255">请把</text><text color="0,255,255">背包中的</text><img srcgd="88000" tipgd="88000"><text color="0,255,255">放入“提交框”</text><text color="255,255,255">中，一旦提交成功，怪兽会被收回，并获得相应的</text><text color="0,255,255">经验奖励。</text><br>')			
			API_ResponseWrite('<text color="255,255,255">怪兽</text><text color="0,255,255">进化次数越多</text><text color="255,255,255">，换取的</text><text color="0,255,255">经验</text><text color="255,255,255">奖励越多。</text><br><br>')			
			API_ResponseWrite('<goodsHolder name="1"><br><br>')
			API_OpenWindow(ActorID,68,1)
			--API_OpenSmallTip(ActorID,30,500,2,469,-1,"[k]  请把怪兽徽章放在这里[/k]")
			API_ResponseWrite('<br><a href="LiXingHuoDong2_tijiao">提交</a><br><br>')			
			API_ResponseWrite('<br><a>离开</a><br>')
		elseif type1 == 0 then
			API_ResponseWrite('<name>怪兽换经验</name>')
			API_ResponseWrite('<br><text color="0,255,255">怪兽进化后，可以通过此选项进行评定</text><br>')
			API_ResponseWrite('<text color="255,255,255">怪兽</text><text color="0,255,255">进化次数越多</text><text color="255,255,255">，换取的</text><text color="0,255,255">经验</text><text color="255,255,255">奖励越多。</text><br>')			
			API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1=4">了解其它信息</a><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		end
	elseif SelectItem == 7 then --给玩家添加怪兽 创建道具
		if playerbeibaokongjian > 0 then
			local chongwu = API_VarDataGetNumber(ActorID,1,7622)
			local wupinID = 0
			if LiXingHuoDong2_chongwuwupintable[chongwu] ~= nil then
				wupinID  = LiXingHuoDong2_chongwuwupintable[chongwu]
			else
				API_ActorSendMsg(ActorID,0,'领取怪兽时发生错误，请与GM取得联系。')
				API_ActorSendMsg(ActorID,7,'领取怪兽时发生错误，请与GM取得联系。')
				return
			end
			--判断玩家身上是否有怪兽徽章
			if API_ActorGetGoodsNum(ActorID,wupinID) > 0 then
				API_ActorSendMsg(ActorID,0,'您身上带有“怪兽徽章”，不能领取怪兽。')
				API_ActorSendMsg(ActorID,7,'您身上带有“怪兽徽章”，不能领取怪兽。')
				return
			end
			
			--怪兽物品部分
			local UIDchongwu = API_AddActorGoodsPropRetUID(ActorID,wupinID,1,0,'获得怪兽',-1,-1)
			local chongwubagID,chongwuLoc = API_GetUIDGoodsInActor(UIDchongwu,ActorID)--背包ID 和 位置
			API_VarDataSetNumber(ActorID,1,7627,1)
			API_ActorMeMScrollSetNumber(ActorID,chongwubagID,chongwuLoc+1,5,0)--成长 当这个值达到100% 进化
			API_ActorMeMScrollSetNumber(ActorID,chongwubagID,chongwuLoc+1,6,0)--产物 当这个值达到100% 进行产物
			jilu = jilu + 1
			API_VarDataSetNumber(ActorID,1,7621,jilu)
			API_VarDataSetNumber(ActorID,1,7635,0)
			--怪兽NPC部分
			LiXingHuoDong2_chongwu_add(ActorID)
			--计时器部分
			--[[local jishiqi = API_VarDataGetNumber(ActorID,1,7624)
			if jishiqi > 0 then
				API_DestroyTrigger(ActorID,943,jishiqi)
			end
			jishiqi = API_CreateTimerTrigger(ActorID,60,-1,943,'LiXingHuoDong2_jishiqi')
			]]
			--随机事件时间触发
			local TimerTriggerID = API_VarDataGetNumber(ActorID,1,7634)
			if TimerTriggerID > 0 then
				API_DestroyTrigger(ActorID,-1,TimerTriggerID)	
			end
			TimerTriggerID =  API_CreateTimerTrigger(ActorID,180,1,-1,'LiXingHuoDong2_suijishijian')
			API_VarDataSetNumber(ActorID,1,7634,TimerTriggerID)
			--API_VarDataSetNumber(ActorID,1,7624,jishiqi)
			--local nowtime = os.time
			--API_VarDataSetNumber(ActorID,1,7625,nowtime)
			API_VarDataSetNumber(ActorID,1,7626,1)
			LiXingHuoDong2_jishiqi_show(ActorID)
			--风向标  怪兽领取
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type = 1
			if GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] + 1
			end
		else
			API_ActorSendMsg(ActorID,0,'请保证有一格的背包空间，否则不能领取怪兽。')
			return
		end
	elseif SelectItem == 8 or SelectItem == 9 or SelectItem == 10 then
		local baidan = 0
		local lvdan = 0
		local yindan = 0
		local jindan = 0
		local goodsID1 = 0
		local goodsID2 = 0
		local goodsID3 = 0
		local goodsID4 = 0	
		if SelectItem == 8 then
			baidan = 80637
			lvdan = 80640
			yindan = 80641
			jindan = 80642
		elseif SelectItem == 9 then
			baidan = 80654
			lvdan = 80657
			yindan = 80658
			jindan = 80659
		elseif SelectItem == 10 then
			baidan = 80662
			lvdan = 80665
			yindan = 80666
			jindan = 80667
		end
		if LiXingHuoDong2_jiangli_egg[SelectItem] == nil then
			return
		end
		if LiXingHuoDong2_jiangli_egg_huoli[SelectItem] == nil then
			return
		end
		if LiXingHuoDong2_jiangli_egg_jinbi[SelectItem] == nil then
			return
		end
		API_ResponseWrite('<win rect="300,100,480,500"></win>')
		API_ResponseWrite('<text color="255,255,255">你想兑换什么奖励那？</text><br>')
		for i in LiXingHuoDong2_jiangli_egg[SelectItem] do
			local jiangli = LiXingHuoDong2_jiangli_egg[SelectItem][i]
			local huoli = LiXingHuoDong2_jiangli_egg_huoli[SelectItem][i]
			local jinbi = LiXingHuoDong2_jiangli_egg_jinbi[SelectItem][i]
			if i == 1 then
				goodsID1 = baidan 			
				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换'..jiangli..'经验，'..huoli..'活力，'..jinbi..'金币</a><br>')					
			elseif i == 2 then
				goodsID1 = lvdan 			
				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换'..jiangli..'经验，'..huoli..'活力，'..jinbi..'金币</a><br>')			
			elseif i == 3 then
				goodsID1 = yindan		
				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换'..jiangli..'经验，'..huoli..'活力，'..jinbi..'金币</a><br>')							
			elseif i == 4 then
				goodsID1 = jindan			
				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换'..jiangli..'经验，'..huoli..'活力，'..jinbi..'金币</a><br>')									
			elseif i == 5 then
				goodsID1 = baidan	
				goodsID2 = lvdan		
				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><img srcgd="'..goodsID2..'" tipgd="'..goodsID2..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换'..jiangli..'经验，'..huoli..'活力，'..jinbi..'金币</a><br>')			
			elseif i == 6 then
				goodsID1 = baidan	
				goodsID2 = yindan		
				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><img srcgd="'..goodsID2..'" tipgd="'..goodsID2..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换'..jiangli..'经验，'..huoli..'活力，'..jinbi..'金币</a><br>')		
			elseif i == 7 then
				goodsID1 = lvdan	
				goodsID2 = yindan		
				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><img srcgd="'..goodsID2..'" tipgd="'..goodsID2..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换'..jiangli..'经验，'..huoli..'活力，'..jinbi..'金币</a><br>')					
			elseif i == 8 then
				goodsID1 = baidan	
				goodsID2 = jindan		
				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><img srcgd="'..goodsID2..'" tipgd="'..goodsID2..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换'..jiangli..'经验，'..huoli..'活力，'..jinbi..'金币</a><br>')						
			elseif i == 9 then
				goodsID1 = lvdan	
				goodsID2 = jindan		
				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><img srcgd="'..goodsID2..'" tipgd="'..goodsID2..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换'..jiangli..'经验，'..huoli..'活力，'..jinbi..'金币</a><br>')				
			elseif i == 10 then
				goodsID1 = yindan	
				goodsID2 = jindan		
				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><img srcgd="'..goodsID2..'" tipgd="'..goodsID2..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换'..jiangli..'经验，'..huoli..'活力，'..jinbi..'金币</a><br>')			
--			elseif i == 11 then
--				goodsID1 = baidan	
--				goodsID2 = yindan	
--				goodsID3 = jindan				
--				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><img srcgd="'..goodsID2..'" tipgd="'..goodsID2..'"><text color="255,255,255"> X 1 </text><img srcgd="'..goodsID3..'" tipgd="'..goodsID3..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换'..jiangli..'经验，'..huoli..'活力，'..jinbi..'金币</a><br>')						
--			elseif i == 12 then
--				goodsID1 = lvdan	
--				goodsID2 = yindan	
--				goodsID3 = jindan				
--				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><img srcgd="'..goodsID2..'" tipgd="'..goodsID2..'"><text color="255,255,255"> X 1 </text><img srcgd="'..goodsID3..'" tipgd="'..goodsID3..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换'..jiangli..'经验，'..huoli..'活力，'..jinbi..'金币</a><br>')			
			elseif i == 13 then
				goodsID1 = baidan
				goodsID2 = lvdan	
				goodsID3 = yindan	
				goodsID4 = jindan	
				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><img srcgd="'..goodsID2..'" tipgd="'..goodsID2..'"><text color="255,255,255"> X 1 </text><img srcgd="'..goodsID3..'" tipgd="'..goodsID3..'"><text color="255,255,255"> X 1 </text><img srcgd="'..goodsID4..'" tipgd="'..goodsID4..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换'..jiangli..'经验，'..huoli..'活力，'..jinbi..'金币</a><br>')														
			elseif i == 14 then
				goodsID1 = yindan			
				API_ResponseWrite('<img srcgd="'..goodsID1..'" tipgd="'..goodsID1..'"><text color="255,255,255"> X 1 </text><a href="LiXingHuoDong2_NPC_duihuan?1='..SelectItem..'&2='..ActorID..'&3='..goodsID1..'&4='..goodsID2..'&5='..goodsID3..'&6='..goodsID4..'&7='..jiangli..'&8='..huoli..'&9='..i..'&10='..jinbi..'" underline="1">兑换宠物魔力石</a><br>')	
			end				
		end
		API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1=2">'..string.format("%-60s",'')..'返回</a><br>')
		API_ResponseWrite('<br><a>'..string.format("%-60s",'')..'离开</a><br>')
	elseif SelectItem == 11 then
		API_ResponseWrite('<name>怪兽喜好</name>')
		API_ResponseWrite('<text color="255,255,255">您要查询哪只怪兽的喜好？</text><br><br>')
		API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=13">三眼兽</a><br>')
		API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=14">暗羽鸦</a><br>')
		API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1=4">了解其它信息</a><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
	elseif SelectItem == 12 then
		API_ResponseWrite('<name>饲料档次说明</name>')
		API_ResponseWrite('<text color="255,255,255">饲料分</text><text color="0,255,255">低、中、高三档</text><text color="255,255,255">，档次越高对怪兽的成长越有好处。</text><br><br>')		
		API_ResponseWrite('<text color="255,255,255">草类：青草（低）、烈焰草（中）、黄月草（高）</text><br>')
		API_ResponseWrite('<text color="255,255,255">肉类：小块的肉（低）、中块的肉（中）、大块的肉（高）</text><br>')
		API_ResponseWrite('<text color="255,255,255">骨头类：小块的骨头（低）、中块的骨头（中）、大块的骨头（高）</text><br>')
		API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1=4">了解其它信息</a><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
	elseif SelectItem == 13 or SelectItem == 14 then
		local MID = 0
		local xihuan = 0
		local zuixihuan = 0
		local taoyan = 0
		if SelectItem == 13 then
			MID = sanyanshou2
		elseif SelectItem == 14 then
			MID = anyuniao2
		end
		if LiXingHuoDong2_chongwutable2[MID] ~= nil then
			for i in LiXingHuoDong2_chongwutable2[MID] do
				if LiXingHuoDong2_chongwutable2[MID][i] ~= nil then
					xihuan = LiXingHuoDong2_chongwutable2[MID][i].xihuan
					zuixihuan = LiXingHuoDong2_chongwutable2[MID][i].zuixihuan
					taoyan = LiXingHuoDong2_chongwutable2[MID][i].taoyan
					API_ResponseWrite('<win rect="300,100,300,470"></win>')
					if i == 1 then
						API_ResponseWrite('<text color="255,255,255">幼年阶段：</text><br><br>')
					elseif i == 2 then
						API_ResponseWrite('<text color="255,255,255">成年阶段1次进化：</text><br>')
					elseif i == 3 then
						API_ResponseWrite('<text color="255,255,255">成年阶段2次进化：</text><br>')
					elseif i == 4 then
						API_ResponseWrite('<text color="255,255,255">成年阶段3次进化：</text><br>')
					elseif i == 5 then
						API_ResponseWrite('<text color="255,255,255">成年阶段4次进化：</text><br>')
					end
					API_ResponseWrite('<text color="255,255,255">怪兽</text><text color="0,255,255">喜欢</text><text color="255,255,255">的食物：</text><text color="0,255,255">'..API_GetGoodsName(xihuan)..'</text><br>')
					API_ResponseWrite('<text color="255,255,255">怪兽</text><text color="0,255,255">最喜欢</text><text color="255,255,255">的食物：</text><text color="0,255,255">'..API_GetGoodsName(zuixihuan)..'</text><br>')
					API_ResponseWrite('<text color="255,255,255">怪兽</text><text color="0,255,255">讨厌</text><text color="255,255,255">的食物：</text><text color="0,255,255">'..API_GetGoodsName(taoyan)..'</text><br><br>')
				end
			end
			API_ResponseWrite('<br><a>                                离开</a><br>')
		end
	else
		if type3 == 0 then --无鸡无蛋
			API_ResponseWrite('<name>饲养员</name>')
			API_ResponseWrite('<text color="255,255,255">你是来帮忙的吗？我这里有很多的</text><text color="0,255,255">怪兽</text><text color="255,255,255">，可是我一个人照顾不过来。帮我把它们</text><text color="0,255,255">养大</text><text color="255,255,255">，我会根据怪兽成长的情况给你</text><text color="0,255,255">报酬</text><text color="255,255,255">。怪兽产出的</text><text color="0,255,255">“蛋”</text><text color="255,255,255">可以按照</text><text color="0,255,255">不同的组合</text><text color="255,255,255">在我这里换取</text><text color="0,255,255">奖励</text><text color="255,255,255">。</text><br><br>')
			if hour == LiXingHuoDong2_StartTime or hour == LiXingHuoDong3_StartTime then
				API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=1">我要培养怪兽</a><br>')
			else
				API_ResponseWrite('<text color="0,255,255">每天的12点-13点和22点-23点可以在我这里领养怪兽。</text><br>')
			end
			API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1=4">了解怪兽进化活动</a><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		elseif type3 == 1 then --有鸡无蛋
			API_ResponseWrite('<name>饲养员</name>')
			API_ResponseWrite('<text color="255,255,255">你是来帮忙的吗？我这里有很多的</text><text color="0,255,255">怪兽</text><text color="255,255,255">，可是我一个人照顾不过来。帮我把它们</text><text color="0,255,255">养大</text><text color="255,255,255">，我会根据怪兽成长的情况给你</text><text color="0,255,255">报酬</text><text color="255,255,255">。怪兽产出的</text><text color="0,255,255">“蛋”</text><text color="255,255,255">可以按照</text><text color="0,255,255">不同的组合</text><text color="255,255,255">在我这里换取</text><text color="0,255,255">奖励</text><text color="255,255,255">。</text><br><br>')
			API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1=6">'..string.format("%-35s",'怪兽换经验')..'</a><a href="LiXingHuoDong2_NPC?1=4">'..string.format("%-35s",'了解怪兽进化活动')..'</a><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		elseif type3 == 2 then --无鸡有蛋
			API_ResponseWrite('<name>饲养员</name>')
			API_ResponseWrite('<text color="255,255,255">你是来帮忙的吗？我这里有很多的</text><text color="0,255,255">怪兽</text><text color="255,255,255">，可是我一个人照顾不过来。帮我把它们</text><text color="0,255,255">养大</text><text color="255,255,255">，我会根据怪兽成长的情况给你</text><text color="0,255,255">报酬</text><text color="255,255,255">。怪兽产出的</text><text color="0,255,255">“蛋”</text><text color="255,255,255">可以按照</text><text color="0,255,255">不同的组合</text><text color="255,255,255">在我这里换取</text><text color="0,255,255">奖励</text><text color="255,255,255">。</text><br><br>')
			if hour == LiXingHuoDong2_StartTime or hour == LiXingHuoDong3_StartTime then
				API_ResponseWrite('<a href="LiXingHuoDong2_NPC?1=1">我要培养怪兽</a><br>')
			else
				API_ResponseWrite('<text color="0,255,255">每天的12点-13点和22点-23点可以在我这里领养怪兽。</text><br>')
			end
			API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1=2">'..string.format("%-35s",'“蛋”兑换')..'</a><a href="LiXingHuoDong2_NPC?1=4">'..string.format("%-35s",'了解怪兽进化活动')..'</a><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		elseif type3 == 3 then --有鸡有蛋
			API_ResponseWrite('<name>饲养员</name>')
			API_ResponseWrite('<text color="255,255,255">你是来帮忙的吗？我这里有很多的</text><text color="0,255,255">怪兽</text><text color="255,255,255">，可是我一个人照顾不过来。帮我把它们</text><text color="0,255,255">养大</text><text color="255,255,255">，我会根据怪兽成长的情况给你</text><text color="0,255,255">报酬</text><text color="255,255,255">。怪兽产出的</text><text color="0,255,255">“蛋”</text><text color="255,255,255">可以按照</text><text color="0,255,255">不同的组合</text><text color="255,255,255">在我这里换取</text><text color="0,255,255">奖励</text><text color="255,255,255">。</text><br><br>')
			API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1=6">'..string.format("%-35s",'怪兽换经验')..'</a><a href="LiXingHuoDong2_NPC?1=2">'..string.format("%-35s",'“蛋”兑换')..'</a><a href="LiXingHuoDong2_NPC?1=4">'..string.format("%-35s",'了解怪兽进化活动')..'</a><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		end
	end	
end

function LiXingHuoDong2_QingChuShuJu(ActorID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local NowTime = os.time()
	--每日清除
	if NowTime > API_VarDataGetNumber(ActorID,1,30227) then
		local NowTime = os.date("*t", os.time())
		NowTime.year = Year
		NowTime.month = Month
		NowTime.day = Day
		NowTime.hour = 23
		NowTime.min = 59
		NowTime.sec = 59
		local NightTime = os.time(NowTime)
		local NextTime = NightTime + 1
		API_VarDataSetNumber(ActorID,1,30226,0)--每天兑换数量
		API_VarDataSetNumber(ActorID,1,30227,NextTime)--下次每日清除时间
	end
end


function LiXingHuoDong2_NPC_duihuan(SelectItem,ActorID,zuhe)
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 8 or SelectItem == 9 or SelectItem == 10 then
	else
		return 0
	end	
	local ActorID = API_RequestGetNumber(2)
	LiXingHuoDong2_QingChuShuJu(ActorID)
	local goodsID1 = 0
	local goodsID2 = 0
	local goodsID3 = 0
	local goodsID4 = 0
	local zuhe = API_RequestGetNumber(9)
	if zuhe <= 0 or zuhe > 14 then
		return 0
	end
	local jiangli = LiXingHuoDong2_jiangli_egg[SelectItem][zuhe]
	local huoli = LiXingHuoDong2_jiangli_egg_huoli[SelectItem][zuhe]	
	local jinbi = LiXingHuoDong2_jiangli_egg_jinbi[SelectItem][zuhe]
	local baidan = 0
	local lvdan = 0
	local yindan = 0
	local jindan = 0
	if SelectItem == 8 then
		baidan = 80637
		lvdan = 80640
		yindan = 80641
		jindan = 80642
	elseif SelectItem == 9 then
		baidan = 80654
		lvdan = 80657
		yindan = 80658
		jindan = 80659
	elseif SelectItem == 10 then
		baidan = 80662
		lvdan = 80665
		yindan = 80666
		jindan = 80667
	end	
	if zuhe == 1 then
		goodsID1 = baidan 
	elseif zuhe == 2 then
		goodsID1 = lvdan
	elseif zuhe == 3 then
		goodsID1 = yindan		
	elseif zuhe == 4 then
		goodsID1 = jindan
	elseif zuhe == 5 then
		goodsID1 = baidan	
		goodsID2 = lvdan
	elseif zuhe == 6 then
		goodsID1 = baidan	
		goodsID2 = yindan
	elseif zuhe == 7 then
		goodsID1 = lvdan	
		goodsID2 = yindan
	elseif zuhe == 8 then
		goodsID1 = baidan	
		goodsID2 = jindan
	elseif zuhe == 9 then
		goodsID1 = lvdan	
		goodsID2 = jindan
	elseif zuhe == 10 then
		goodsID1 = yindan	
		goodsID2 = jindan	
	elseif zuhe == 11 then
		goodsID1 = baidan	
		goodsID2 = yindan	
		goodsID3 = jindan
	elseif zuhe == 12 then
		goodsID1 = lvdan	
		goodsID2 = yindan	
		goodsID3 = jindan
	elseif zuhe == 13 then
		goodsID1 = baidan
		goodsID2 = lvdan	
		goodsID3 = yindan	
		goodsID4 = jindan
	elseif zuhe == 14 then
		goodsID1 = yindan
	end
	
	local ExploitL = API_GetActorExpLevel(ActorID)
	local expMax = API_GetExploitInfo(ExploitL,3)
	local expNow = API_GetActorCurExp(ActorID)
	local expAddMax = expMax - expNow

	local num = 0
	if goodsID1 > 0 then
		num = num + 1
	end
	if goodsID2 > 0 then
		num = num + 1
	end
	if goodsID3 > 0 then
		num = num + 1
	end
	if goodsID4 > 0 then
		num = num + 1
	end
	local runxu = 0
	if num == 1 then
		if zuhe ~= 14 then
			if API_ActorGetGoodsNum(ActorID,goodsID1) > 0 then
				if expAddMax >= jiangli then
					if API_ActorRemoveGoods(ActorID,goodsID1,1,'例行活动2兑换蛋') then
						runxu = 1
					else
						API_ActorSendMsg(ActorID,0,'兑换时发生错误，请联系GM')
						API_ActorSendMsg(ActorID,7,'兑换时发生错误，请联系GM')
						return 0
					end
				else
					API_ActorSendMsg(ActorID,0,'您身上的经验已达或接近上限，不能进行兑换')
					API_ActorSendMsg(ActorID,7,'您身上的经验已达或接近上限，不能进行兑换')
					return 0
				end	
			else
				API_ActorSendMsg(ActorID,0,'您身上的“'..API_GetGoodsName(goodsID1)..'”数量不足，不能进行兑换')
				API_ActorSendMsg(ActorID,7,'您身上的“'..API_GetGoodsName(goodsID1)..'”数量不足，不能进行兑换')
				return 0
			end
		else
			if API_VarDataGetNumber(ActorID,1,30226) >= 3 then
				API_ResponseWrite('<text color="255,255,255">兑换失败，每个玩家每天只能兑换3个宠物魔力石，您今天的兑换次数已经达到上限，请明天再来兑换。</text><br>')
				API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1='..SelectItem..'">返回</a><br>')
				API_ResponseWrite('<br><a>离开</a><br>')				
				return 0
			end
			if API_ActorGetGoodsNum(ActorID,goodsID1) > 0 then
				if API_ActorRemoveGoods(ActorID,goodsID1,1,'例行活动2兑换蛋') then
					runxu = 1
				else
					API_ActorSendMsg(ActorID,0,'兑换时发生错误，请联系GM')
					API_ActorSendMsg(ActorID,7,'兑换时发生错误，请联系GM')
					return 0
				end
			else
				API_ActorSendMsg(ActorID,0,'您身上的“'..API_GetGoodsName(goodsID1)..'”数量不足，不能进行兑换')
				API_ActorSendMsg(ActorID,7,'您身上的“'..API_GetGoodsName(goodsID1)..'”数量不足，不能进行兑换')
				return 0
			end
		end
	elseif num == 2 then
		if API_ActorGetGoodsNum(ActorID,goodsID1) > 0 then
			if API_ActorGetGoodsNum(ActorID,goodsID2) > 0 then
				if expAddMax >= jiangli then
					if API_ActorRemoveGoods(ActorID,goodsID1,1,'例行活动2兑换蛋') and API_ActorRemoveGoods(ActorID,goodsID2,1,'例行活动2兑换蛋') then
						runxu = 1
					else
						API_ActorSendMsg(ActorID,0,'兑换时发生错误，请联系GM')
						API_ActorSendMsg(ActorID,7,'兑换时发生错误，请联系GM')
						return 0
					end
				else
					API_ActorSendMsg(ActorID,0,'您身上的经验已达或接近上限，不能进行兑换')
					API_ActorSendMsg(ActorID,7,'您身上的经验已达或接近上限，不能进行兑换')
					return 0
				end		
			else
				API_ActorSendMsg(ActorID,0,'您身上的“'..API_GetGoodsName(goodsID2)..'”数量不足，不能进行兑换')
				API_ActorSendMsg(ActorID,7,'您身上的“'..API_GetGoodsName(goodsID2)..'”数量不足，不能进行兑换')
				return 0
			end
		else
			API_ActorSendMsg(ActorID,0,'您身上的“'..API_GetGoodsName(goodsID1)..'”数量不足，不能进行兑换')
			API_ActorSendMsg(ActorID,7,'您身上的“'..API_GetGoodsName(goodsID1)..'”数量不足，不能进行兑换')
			return 0
		end
	elseif num == 3 then
		if API_ActorGetGoodsNum(ActorID,goodsID1) > 0 then
			if API_ActorGetGoodsNum(ActorID,goodsID2) > 0 then
				if API_ActorGetGoodsNum(ActorID,goodsID3) > 0 then
					if expAddMax >= jiangli then
						if API_ActorRemoveGoods(ActorID,goodsID1,1,'例行活动2兑换蛋') and API_ActorRemoveGoods(ActorID,goodsID2,1,'例行活动2兑换蛋') and API_ActorRemoveGoods(ActorID,goodsID3,1,'例行活动2兑换蛋') then
							runxu = 1
						else
							API_ActorSendMsg(ActorID,0,'兑换时发生错误，请联系GM')
							API_ActorSendMsg(ActorID,7,'兑换时发生错误，请联系GM')
							return 0
						end
					else
						API_ActorSendMsg(ActorID,0,'您身上的经验已达或接近上限，不能进行兑换')
						API_ActorSendMsg(ActorID,7,'您身上的经验已达或接近上限，不能进行兑换')
						return 0
					end		
				else
					API_ActorSendMsg(ActorID,0,'您身上的“'..API_GetGoodsName(goodsID3)..'”数量不足，不能进行兑换')
					API_ActorSendMsg(ActorID,7,'您身上的“'..API_GetGoodsName(goodsID3)..'”数量不足，不能进行兑换')
					return 0
				end
			else
				API_ActorSendMsg(ActorID,0,'您身上的“'..API_GetGoodsName(goodsID2)..'”数量不足，不能进行兑换')
				API_ActorSendMsg(ActorID,7,'您身上的“'..API_GetGoodsName(goodsID2)..'”数量不足，不能进行兑换')
				return 0
			end
		else
			API_ActorSendMsg(ActorID,0,'您身上的“'..API_GetGoodsName(goodsID1)..'”数量不足，不能进行兑换')
			API_ActorSendMsg(ActorID,7,'您身上的“'..API_GetGoodsName(goodsID1)..'”数量不足，不能进行兑换')
			return 0
		end
	elseif num == 4 then
		if API_ActorGetGoodsNum(ActorID,goodsID1) > 0 then
			if API_ActorGetGoodsNum(ActorID,goodsID2) > 0 then
				if API_ActorGetGoodsNum(ActorID,goodsID3) > 0 then
					if API_ActorGetGoodsNum(ActorID,goodsID4) > 0 then
						if expAddMax >= jiangli then
							if API_ActorRemoveGoods(ActorID,goodsID1,1,'例行活动2兑换蛋') and API_ActorRemoveGoods(ActorID,goodsID2,1,'例行活动2兑换蛋') and API_ActorRemoveGoods(ActorID,goodsID3,1,'例行活动2兑换蛋') and API_ActorRemoveGoods(ActorID,goodsID4,1,'例行活动2兑换蛋') then
								runxu = 1
							else
								API_ActorSendMsg(ActorID,0,'兑换时发生错误，请联系GM')
								API_ActorSendMsg(ActorID,7,'兑换时发生错误，请联系GM')
								return 0
							end
						else
							API_ActorSendMsg(ActorID,0,'您身上的经验已达或接近上限，不能进行兑换')
							API_ActorSendMsg(ActorID,7,'您身上的经验已达或接近上限，不能进行兑换')
							return 0
						end
					else
						API_ActorSendMsg(ActorID,0,'您身上的“'..API_GetGoodsName(goodsID4)..'”数量不足，不能进行兑换')
						API_ActorSendMsg(ActorID,7,'您身上的“'..API_GetGoodsName(goodsID4)..'”数量不足，不能进行兑换')
						return 0
					end
				else
					API_ActorSendMsg(ActorID,0,'您身上的“'..API_GetGoodsName(goodsID3)..'”数量不足，不能进行兑换')
					API_ActorSendMsg(ActorID,7,'您身上的“'..API_GetGoodsName(goodsID3)..'”数量不足，不能进行兑换')
					return 0
				end
			else
				API_ActorSendMsg(ActorID,0,'您身上的“'..API_GetGoodsName(goodsID2)..'”数量不足，不能进行兑换')
				API_ActorSendMsg(ActorID,7,'您身上的“'..API_GetGoodsName(goodsID2)..'”数量不足，不能进行兑换')
				return 0
			end
		else
			API_ActorSendMsg(ActorID,0,'您身上的“'..API_GetGoodsName(goodsID1)..'”数量不足，不能进行兑换')
			API_ActorSendMsg(ActorID,7,'您身上的“'..API_GetGoodsName(goodsID1)..'”数量不足，不能进行兑换')
			return 0
		end
	end
	if runxu == 1 then
		if jiangli > 14191 then return end
		if jinbi > 1117 then return end
		if huoli > 35 then return end
		if zuhe == 14 then
			if API_VarDataGetNumber(ActorID,1,30226) < 3 then
				if API_ActorCanAddGoods(ActorID,88992,1,3,0) ~= -1 then
					API_AddActorGoodsFlag(ActorID,88992,1,0,'获得宠物魔力石')
					API_ActorSendMsg(ActorID,8,'获得宠物魔力石')
				else
					local GoodsName = API_GetGoodsName(88992)
					API_SendActorMailByName(API_GetActorName(ActorID),88992,1,0,'双子岛活动','双子岛活动兑换宠物魔力石')
					API_ActorSendMsg(ActorID,8,'获得宠物魔力石1个（请到邮箱领取）')
				end
				local Number = API_VarDataGetNumber(ActorID,1,30226)
				Number = Number + 1
				API_VarDataSetNumber(ActorID,1,30226,Number)
				API_ResponseWrite('<text color="255,255,255">兑换成功，获得1个宠物魔力石。</text><br>')
				API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1='..SelectItem..'">继续兑换奖励</a><br>')
				API_ResponseWrite('<br><a>离开</a><br>')
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				if GLOBAL_FengXiangBiao_DateList[62][3][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[62][3][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[62][3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[62][3][LaiYuan] + 1
				end
			else
				API_ResponseWrite('<text color="255,255,255">兑换失败，每个玩家每天只能兑换3个宠物魔力石，您今天的兑换次数已经达到上限，请明天再来兑换。</text><br>')
				API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1='..SelectItem..'">返回</a><br>')
				API_ResponseWrite('<br><a>离开</a><br>')				
			end
		else
			API_ActorAddExp(ActorID,jiangli,943,'例行活动2兑换蛋')		
			API_ActorAddMoney(ActorID,jinbi,943,'例行活动2兑换蛋')
			API_ActorAddHunger(ActorID,huoli)
			API_ResponseWrite('<text color="255,255,255">兑换成功，获得'..jiangli..'经验，'..jinbi..'金币和'..huoli..'活力。</text><br>')
			API_ResponseWrite('<br><a href="LiXingHuoDong2_NPC?1='..SelectItem..'">继续兑换奖励</a><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		end
		if SelectItem == 8 then
			chongwuxitongjingyanzengjia(ActorID,jiangli,2)		
		elseif SelectItem == 9 then
			chongwuxitongjingyanzengjia(ActorID,jiangli,3)				
		elseif SelectItem == 10 then
			chongwuxitongjingyanzengjia(ActorID,jiangli,4)				
		end
		--风向标  蛋
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 0
		if SelectItem == 8 then
			if zuhe == 1 then
				Type = 28
			elseif zuhe == 2 then
				Type = 29
			elseif zuhe == 3 then
				Type = 30
			elseif zuhe == 4 then
				Type = 31
			elseif zuhe == 5 then
				Type = 32
			elseif zuhe == 6 then
				Type = 33
			elseif zuhe == 7 then
				Type = 34
			elseif zuhe == 8 then
				Type = 35
			elseif zuhe == 9 then
				Type = 36		
			elseif zuhe == 10 then
				Type = 37
			elseif zuhe == 11 then
				Type = 38
			elseif zuhe == 12 then
				Type = 39
			elseif zuhe == 13 then				
				Type = 40
			end
		elseif SelectItem == 9 then
			if zuhe == 1 then
				Type = 41
			elseif zuhe == 2 then
				Type = 42
			elseif zuhe == 3 then
				Type = 43
			elseif zuhe == 4 then
				Type = 44
			elseif zuhe == 5 then
				Type = 45
			elseif zuhe == 6 then
				Type = 46
			elseif zuhe == 7 then
				Type = 47
			elseif zuhe == 8 then
				Type = 48
			elseif zuhe == 9 then
				Type = 49		
			elseif zuhe == 10 then
				Type = 50
			elseif zuhe == 11 then
				Type = 51
			elseif zuhe == 12 then
				Type = 52
			elseif zuhe == 13 then				
				Type = 53
			end
		end	
		if Type == 0 then
			return
		end
		if GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] + 1
		end
	end
end
function LiXingHuoDong2_tijiao()
	local ActorID = API_RequestGetActorID()
	local chongwu = API_VarDataGetNumber(ActorID,1,7622)
	local wupinID = 0
	local ExploitL = API_GetActorExpLevel(ActorID)
	local expMax = API_GetExploitInfo(ExploitL,3)
	local expNow = API_GetActorCurExp(ActorID)
	local expAddMax = expMax - expNow
	if LiXingHuoDong2_chongwuwupintable[chongwu] ~= nil then
		wupinID  = LiXingHuoDong2_chongwuwupintable[chongwu]
	else
		API_ActorSendMsg(ActorID,0,'提交怪兽时发生错误，请与GM取得联系。')
		API_ActorSendMsg(ActorID,7,'提交怪兽时发生错误，请与GM取得联系。')
		return
	end
	local UidHigh1 = API_RequestGetNumber(1)--高位UID
	local UidLow1 = API_RequestGetNumber(1001)--低位UID
	local uid1 = API_GetUID(UidHigh1,UidLow1) --获取UID	
	local a,b = API_GetLongOfUID(uid1)
	local bagID1,Loc1 = API_GetUIDGoodsInActor(uid1,ActorID)--背包ID 和 位置	
	local wupinID1 = API_GetUIDGoodsPropNum(uid1,0)--提交的物品ID
	if wupinID1 == 0 then
		API_ActorSendMsg(ActorID,0,'您没有提交“怪兽徽章”，不能进行评定')
		return
	end
	if wupinID1 ~= wupinID then
		API_ActorSendMsg(ActorID,0,'提交的“怪兽徽章”不正确')
		return
	end
	local jieduan = API_VarDataGetNumber(ActorID,1,7627)
	local chongwuIDM = API_VarDataGetNumber(ActorID,1,7622)
	local jiangli = 0
	if LiXingHuoDong2_jiangli[chongwuIDM][jieduan] ~= nil then
		jiangli = LiXingHuoDong2_jiangli[chongwuIDM][jieduan]
	else
		API_ActorSendMsg(ActorID,0,'提交怪兽时发生问题，请和GM取得联系')
		return
	end
	if expAddMax < jiangli then
		API_ActorSendMsg(ActorID,0,'您身上的经验已达或接近上限，不能进行兑换')
		API_ActorSendMsg(ActorID,7,'您身上的经验已达或接近上限，不能进行兑换')
		return
	end
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem ~= 1 then
		API_ResponseWrite('<text color="255,255,255">现在提交怪兽可以获得'..jiangli..'经验。您要提交怪兽吗？</text><br><br><br>')
		API_ResponseWrite('<a href="LiXingHuoDong2_tijiao_jiangli?1='..ActorID..'&2='..wupinID1..'&3='..bagID1..'&4='..Loc1..'&5='..jiangli..'">提交</a><br><br><br>')	
		API_ResponseWrite('<br><a>离开</a><br>')
	end
end
function LiXingHuoDong2_tijiao_jiangli(ActorID,wupinID1,bagID1,Loc1)
	local ActorID = API_RequestGetNumber(1)
	local wupinID1 = API_RequestGetNumber(2)
	local bagID1 = API_RequestGetNumber(3)
	local Loc1 = API_RequestGetNumber(4)
	local jieduan = API_VarDataGetNumber(ActorID,1,7627)
	local chongwuIDM = API_VarDataGetNumber(ActorID,1,7622)	
	local jiangli = 0
	if LiXingHuoDong2_jiangli[chongwuIDM][jieduan] ~= nil then
		jiangli = LiXingHuoDong2_jiangli[chongwuIDM][jieduan]
	else
		API_ActorSendMsg(ActorID,0,'提交怪兽时发生问题，请和GM取得联系')
		return
	end
	if API_ActorRemoveGoodsOfLoc(ActorID,wupinID1,1,bagID1,Loc1,'提交怪兽') then
		if API_VarDataGetNumber(ActorID,1,7623) > 0 then
			LiXingHuoDong2_chongwu_del(ActorID) --怪兽删除
		end
		API_VarDataSetNumber(ActorID,1,7622,0) --怪兽设置为0
		--API_AddActorGoods(ActorID,jiangli,1,'提交怪兽')
		API_ActorAddExp(ActorID,jiangli,943,'提交怪兽')
		API_ResponseWrite('<text color="255,255,255">怪兽培养完成，获得'..jiangli..'经验。</text><br><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		local ActorIDlevel = API_GetActorPeerageLevel(ActorID)
		local dangci = 0
		if ActorIDlevel > 0 and ActorIDlevel < 4 then
			dangci = 2
		elseif ActorIDlevel == 4 or ActorIDlevel == 5 then
			dangci = 3
		elseif ActorIDlevel >= 6 then
			dangci = 4
		end
		if dangci > 0 then
			chongwuxitongjingyanzengjia(ActorID,jiangli,dangci)			
		end
		--[[local jishiqi = API_VarDataGetNumber(ActorID,1,7624)
		if jishiqi > 0 then --到达时间 计时器删除 并且清0
			API_DestroyTrigger(ActorID,943,jishiqi)
		end
		API_VarDataSetNumber(ActorID,1,7624,0)--]]
		API_VarDataSetNumber(ActorID,1,7626,0) --当前状态
		API_VarDataSetNumber(ActorID,1,7627,0) --当前状态
		API_VarDataSetNumber(ActorID,1,7628,0)
		API_VarDataSetNumber(ActorID,1,7629,0)
		API_VarDataSetNumber(ActorID,1,7631,0)
		API_VarDataSetNumber(ActorID,1,7632,0)				
		API_VarDataSetNumber(ActorID,1,7630,0)
		API_VarDataSetNumber(ActorID,1,7623,0)
		local TimerTriggerID = API_VarDataGetNumber(ActorID,1,7634)
		if TimerTriggerID > 0 then
			API_DestroyTrigger(ActorID,-1,TimerTriggerID)
		end
		API_VarDataSetNumber(ActorID,1,7634,0)
		API_UpdateTaskLead(ActorID,943,1,'')
		API_UpdateTaskLead(ActorID,907,1,'')
		API_UpdateTaskLead(ActorID,906,1,'')
		--LiXingHuoDong2_jishiqi_show(ActorID)
		API_ActorSendMsg(ActorID,4,'')
		API_CreateTimerTrigger(ActorID,5,1,-1,'lixinghongdong2_tijiaohoushowtime')
		--风向标  怪兽提交
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local jieduan = API_VarDataGetNumber(ActorID,1,7627)
		local Type = 0
		if jieduan == 1 then
			Type = 6
		elseif jieduan == 2 then
			Type = 7
		elseif jieduan  == 3 then
			Type = 8
		elseif jieduan == 4 then
			Type = 9
		elseif jieduan == 5 then
			Type = 10
		end
		if Type == 0 then
			return
		end
		if GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] + 1
		end
	end
end
function lixinghongdong2_tijiaohoushowtime(ActorID,TaskID) 
	if ActorID > 0 then
		local MapID = API_GetActorMapID(ActorID)
		if MapID > 0 then
		local StaticMapID = API_GetMapConfigID(MapID)	
			if StaticMapID == 104 then
				LiXingHuoDong2_jishiqi_show(ActorID)			
			end
		end
	end
end
function LiXingHuoDong2_jishiqi_show(ActorID)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
		
	local year,month,day,hour,min,sec,wday = PublicFun_time()
	if hour == LiXingHuoDong2_StartTime or hour == LiXingHuoDong3_StartTime then
		local zhuangtai = API_VarDataGetNumber(ActorID,1,7626)
		local info = ''
		local type1 = 0 --徽章判定
		local type2 = 0 --蛋判定
		local type3 = 0 --怪兽存活
		local type4 = API_VarDataGetNumber(ActorID,1,7627) --怪兽进化次数	
		local playLevel = API_GetActorPeerageLevel(ActorID)
		local MID = API_VarDataGetNumber(ActorID,1,7622)
		
		if MID == 0 then
			local xuhao = math.random(table.getn(LiXingHuoDong2_chongwutable[playLevel]))
			MID  = LiXingHuoDong2_chongwutable[playLevel][xuhao]
		end
		
		if API_ActorGetGoodsNum(ActorID,88000) > 0 then
			type1 = 1
		end
		for i in LiXingHuoDong2_dan_table2 do
			if LiXingHuoDong2_dan_table2[i] ~= nil then
				local wupinid = LiXingHuoDong2_dan_table2[i]
				if API_ActorGetGoodsNum(ActorID,wupinid) > 0 then
					type2 = 1
					break
				end
			end
			if type2 == 1 then
				break
			end
		end
		if API_VarDataGetNumber(ActorID,1,7623) > 0 then
			type3 = 1
		end
		if type1==0 and type2== 0 then
			local jiangli2 = LiXingHuoDong2_jiangli[MID][5]
			info = '请去饲养员处领取怪兽，进化4次，可换取'..jiangli2..'经验'
			LiXingHuoDong2_wenbenkuangtishi(ActorID,2)		
		elseif type1==1 and type2== 0 and type3== 1 then		
			if type4 == 1 then
				local jieduan = API_VarDataGetNumber(ActorID,1,7627)+1
				local jiangli2 = LiXingHuoDong2_jiangli[MID][jieduan]				
				info = '怪兽进化1次后，你可获得'..jiangli2..'经验！(在地上找饲料右键点)'
			elseif type4 == 5 then
				local jiangli2 = LiXingHuoDong2_jiangli[MID][5]	
				info = '怪兽已达最终进化，产“金蛋”概率最高。怪兽可换取'..jiangli2..'经验!'
			else
				local jieduan = API_VarDataGetNumber(ActorID,1,7627)
				local jiangli2 = LiXingHuoDong2_jiangli[MID][jieduan]
				local jieduan2 = jieduan + 1
				local jiangli3 = LiXingHuoDong2_jiangli[MID][jieduan2]
				info = '现在可换取'..jiangli2..'经验!下次进化可获得'..jiangli3..'经验，产金蛋的概率提高'
			end
		elseif type1==1 and type2== 0 and type3== 0 then
			local jieduan = API_VarDataGetNumber(ActorID,1,7627)
			local jiangli2 = LiXingHuoDong2_jiangli[MID][jieduan]		
			info = '请去饲养员处用怪兽换取'..jiangli2..'经验'
			LiXingHuoDong2_wenbenkuangtishi(ActorID,3)			
		elseif type1==0 and type2== 1 then
			info = '请去饲养员处领取怪兽\n蛋可以换取经验和金币，组合越多兑换越多'
			LiXingHuoDong2_wenbenkuangtishi(ActorID,2)
		elseif type1==1 and type2== 1 then
			if type4 == 1 then
				local jieduan = API_VarDataGetNumber(ActorID,1,7627)+1
				local jiangli2 = LiXingHuoDong2_jiangli[MID][jieduan]				
				info = '怪兽进化1次后，你可获得'..jiangli2..'经验！(在地上找饲料右键点)'
			elseif type4 == 5 then
				local jiangli2 = LiXingHuoDong2_jiangli[MID][5]	
				info = '怪兽已达最终进化，产“金蛋”概率最高。怪兽可换取'..jiangli2..'经验!'
			else
				local jieduan = API_VarDataGetNumber(ActorID,1,7627)
				local jiangli2 = LiXingHuoDong2_jiangli[MID][jieduan]
				local jieduan2 = jieduan + 1
				local jiangli3 = LiXingHuoDong2_jiangli[MID][jieduan2]
				info = '现在可换取'..jiangli2..'经验!下次进化可获得'..jiangli3..'经验，产金蛋的概率提高'
			end
		end
		if API_ActorIsOnline(ActorID) then
			API_ActorSendMsg(ActorID,4,info)
		end		
	end
end
function LiXingHuoDong2_chongwu_add(ActorID)--创建怪兽
	local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local CampID = API_GetActorCamp(ActorID)
	local chongwu = API_VarDataGetNumber(ActorID,1,7622)
	local FastID = API_CreateMonsterEx(MapID,chongwu,TileX,TileY,2,0,CampID,-1) --最后1项填写为1 可与怪兽交互
	--此部分先用不互动做
	local siwangchufaqi = API_VarDataGetNumber(ActorID,1,7633)
	if siwangchufaqi > 0 then
		API_DestroyTrigger(ActorID,-1,siwangchufaqi)
	end
	siwangchufaqi = API_CreateDieTrigger(ActorID,0,FastID,-1,'LiXingHuoDong2_chongwu_siwanghuidiao')
	API_VarDataSetNumber(ActorID,1,7633,siwangchufaqi)
	local jieduan = API_VarDataGetNumber(ActorID,1,7627)
	local chongwuname = ''
	local zhurenname = API_GetActorName(ActorID)
	if jieduan == 1 then
		chongwuname = '幼年的'
		API_SetMonsterName(FastID,chongwuname,2)
		local houzhui = ' ('..zhurenname..')的怪兽'
		API_SetMonsterName(FastID,houzhui,3)
	end
	if jieduan > 1 then
		local jieduan2 = jieduan - 1
		local qianzhui = '成年的'
		local houzhui = ''..jieduan2..'次进化 ('..zhurenname..')的怪兽'
		API_SetMonsterName(FastID,qianzhui,2)
		API_SetMonsterName(FastID,houzhui,3)
	end
	API_SetMonsterPKTeamID(FastID,1)
	API_SetActorChief(FastID,ActorID)
	API_SetMonsterPrizeActor(FastID,ActorID)
	API_VarDataSetNumber(ActorID,1,7623,FastID)
	local ADDHP = API_VarDataGetNumber(ActorID,1,7635)	
	API_MonsterAddHP(FastID,-ADDHP)
	LiXingHuoDong2_jishiqi_show(ActorID)
	LiXingHuoDong2_taskzhuizong(ActorID)
	LiXingHuoDong2_taskzhuizong2(ActorID)
end
function LiXingHuoDong2_chongwu_del(ActorID)--删除怪兽
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local NPCFastID = API_VarDataGetNumber(ActorID,1,7623)
	if NPCFastID > 0 then --有怪兽
		if API_GetMonsterID(NPCFastID) > 0 then		
			local NPCFastHP = API_MonsterGetPropNum(NPCFastID,2)
			local ADDHP = 3000 - NPCFastHP				
			API_VarDataSetNumber(ActorID,1,7635,ADDHP)
			API_DelChief(NPCFastID)
			API_DestroyMonster(NPCFastID)			
		end		
	end
	local siwangchufaqi = API_VarDataGetNumber(ActorID,1,7633)
	if siwangchufaqi > 0 then
		API_DestroyTrigger(ActorID,943,siwangchufaqi)
	end
	API_VarDataSetNumber(ActorID,1,7633,0)
	API_UpdateTaskLead(ActorID,943,1,'')
	API_UpdateTaskLead(ActorID,907,1,'')
	API_UpdateTaskLead(ActorID,906,1,'')
end
function LiXingHuoDong2_chongwu_siwanghuidiao(ActorID,TaskID,Type,FastID,KillerType,KillID)--怪兽死亡
	if KillerType  == 0 then
		local siwangchufaqi = API_VarDataGetNumber(ActorID,1,7633)
		API_DestroyTrigger(ActorID,-1,siwangchufaqi)
		API_VarDataSetNumber(ActorID,1,7633,0)
		local chongwumID = API_VarDataGetNumber(ActorID,1,7622)
		local wupinID = 0
		if LiXingHuoDong2_chongwuwupintable[chongwumID] ~= nil then
			wupinID  = LiXingHuoDong2_chongwuwupintable[chongwumID]
		else
			API_ActorSendMsg(ActorID,0,'删除怪兽徽章时发生错误，请与GM取得联系。')
			API_ActorSendMsg(ActorID,7,'删除怪兽徽章时时发生错误，请与GM取得联系。')
			return
		end
		if API_ActorGetGoodsNum(ActorID,wupinID) <= 0 then
			API_ActorSendMsg(ActorID,0,'删除怪兽徽章时发生错误，请与GM取得联系。')
			API_ActorSendMsg(ActorID,7,'删除怪兽徽章时时发生错误，请与GM取得联系。')
			return
		end
		local chengzhangzhi,chanwuzhi,suozaibeibao,weizhi = LingHunShi_linghunzhuweizhichaxun(ActorID,wupinID)
		if API_ActorRemoveGoodsOfLoc(ActorID,wupinID,1,suozaibeibao,weizhi-1,'丢弃怪兽徽章') then	
			API_VarDataSetNumber(ActorID,1,7622,0) --怪兽设置为0
			--[[local jishiqi = API_VarDataGetNumber(ActorID,1,7624)
			if jishiqi > 0 then --到达时间 计时器删除 并且清0
				API_DestroyTrigger(ActorID,943,jishiqi)
			end]]
			API_VarDataSetNumber(ActorID,1,7623,0)
			API_VarDataSetNumber(ActorID,1,7624,0)
			API_VarDataSetNumber(ActorID,1,7626,0) --当前状态
			API_VarDataSetNumber(ActorID,1,7627,0) --当前状态
			API_VarDataSetNumber(ActorID,1,7628,0) --当前状态
			API_VarDataSetNumber(ActorID,1,7629,0)
			API_VarDataSetNumber(ActorID,1,7631,0)
			API_VarDataSetNumber(ActorID,1,7632,0)				
			API_VarDataSetNumber(ActorID,1,7630,0)		
			local TimerTriggerID = API_VarDataGetNumber(ActorID,1,7634)
			if TimerTriggerID > 0 then
				API_DestroyTrigger(ActorID,-1,TimerTriggerID)
			end
			API_VarDataSetNumber(ActorID,1,7634,0)
			LiXingHuoDong2_jishiqi_show(ActorID)
			API_ResponseWrite('<name>怪兽死亡</name>')
			API_ResponseWrite('<text color="255,255,255">怪兽死亡，培养结束。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
		end
		API_UpdateTaskLead(ActorID,943,1,'')
		API_UpdateTaskLead(ActorID,907,1,'')
		API_UpdateTaskLead(ActorID,906,1,'')
		--风向标  怪物死亡
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 27
		if GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] + 1
		end
	end
end
function LiXingHuoDong2_jishiqi(ActorID,TaskID)
	local ActorID = API_RequestGetActorID()
	LiXingHuoDong2_jishiqi_show(ActorID)
end
--进出地图判定部分
--出地图 通过7623 判断怪兽是否存在 存在就删除 
--		 4号位置的显示清0
--		 计时器关闭 不清0

--进地图 判断时间 如果不是活动时间 那么不添加怪兽
--				  如果是活动时间 判断7623 如果不是0 那么添加怪兽
--				  进入显示函数
-- 				  计时器大于0 开启计时器
function LiXingHuoDong2_OnLogout()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(MapID)
	API_ActorSetPKTeamID(ActorID,0)
	epfunc_Set_PCdePKID(ActorID)
	local year,month,day,hour,min,sec,wday = PublicFun_time()
	if StaticMapID == 104 then
		API_ActorSetPKTeamID(ActorID,0)
		epfunc_Set_PCdePKID(ActorID)
		if API_VarDataGetNumber(ActorID,1,7623) > 0 then			
			LiXingHuoDong2_chongwu_del(ActorID) --删除怪兽的处理	
		end
		API_ActorSendMsg(ActorID,4,'')
		--[[local jishiqi = API_VarDataGetNumber(ActorID,1,7624)
		if jishiqi > 0 then
			API_DestroyTrigger(ActorID,943,jishiqi)
		end]]
		API_VarDataSetNumber(ActorID,1,7629,0)
		API_VarDataSetNumber(ActorID,1,7631,0)
		API_VarDataSetNumber(ActorID,1,7632,0)				
		API_VarDataSetNumber(ActorID,1,7630,0)
		API_UpdateTaskLead(ActorID,943,1,'')
		API_UpdateTaskLead(ActorID,907,1,'')
		API_UpdateTaskLead(ActorID,906,1,'')
	end
end
function LiXingHuoDong2_OnLogoutMap()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(MapID)
	API_ActorSetPKTeamID(ActorID,0)
	epfunc_Set_PCdePKID(ActorID)
	if StaticMapID == 104 then
		API_ActorSetPKTeamID(ActorID,0)
		epfunc_Set_PCdePKID(ActorID)
		if API_VarDataGetNumber(ActorID,1,7623) > 0 then	
			LiXingHuoDong2_chongwu_del(ActorID) --删除怪兽的处理		
		end
		API_ActorSendMsg(ActorID,4,'')
		--[[local jishiqi = API_VarDataGetNumber(ActorID,1,7624)
		if jishiqi > 0 then
			API_DestroyTrigger(ActorID,943,jishiqi)
		end]]
		API_VarDataSetNumber(ActorID,1,7629,0)
		API_VarDataSetNumber(ActorID,1,7631,0)
		API_VarDataSetNumber(ActorID,1,7632,0)				
		API_VarDataSetNumber(ActorID,1,7630,0)
		API_UpdateTaskLead(ActorID,943,1,'')
		API_UpdateTaskLead(ActorID,907,1,'')
		API_UpdateTaskLead(ActorID,906,1,'')
	end
end
function LiXingHuoDong2_OnLoginMap(ActorID)
	local year,month,day,hour,min,sec,wday = PublicFun_time()
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(MapID)
	local shijianzhuangtai = API_VarDataGetNumber(ActorID,1,7626)
	LiXingHuoDong2_MapPoint(ActorID)
	if StaticMapID == 104 then
		API_ActorSetPKTeamID(ActorID,1)
		epfunc_Set_PCdePKID(ActorID)
		if hour == LiXingHuoDong2_StartTime or hour == LiXingHuoDong3_StartTime then		
			local NPCFastID = API_VarDataGetNumber(ActorID,1,7623)
			if NPCFastID > 0 then --没有怪兽				
				if shijianzhuangtai == 1 and API_VarDataGetNumber(ActorID,1,7622) > 0 then --养成时间判断
					local TimerTriggerID = API_VarDataGetNumber(ActorID,1,7634)
					if TimerTriggerID > 0 then
						API_DestroyTrigger(ActorID,-1,TimerTriggerID)	
					end
					TimerTriggerID =  API_CreateTimerTrigger(ActorID,90,1,-1,'LiXingHuoDong2_suijishijian')
					API_VarDataSetNumber(ActorID,1,7634,TimerTriggerID)					
				--	if API_GetMonsterID(NPCFastID) <= 0 then --没放出						
						LiXingHuoDong2_chongwu_add(ActorID) --添加怪兽
						--[[local jishiqi = API_VarDataGetNumber(ActorID,1,7624) --计时器
						if jishiqi > 0 then
							jishiqi = API_CreateTimerTrigger(ActorID,60,-1,943,'LiXingHuoDong2_jishiqi')
						end
						API_VarDataSetNumber(ActorID,1,7624,jishiqi)]]
				--	end
				end	
			end
			LiXingHuoDong2_jishiqi_show(ActorID) --显示
		else
			if shijianzhuangtai > 0 then
				LiXingHuoDong2_jieshuzhuangtai(ActorID)
			end
		end
	end
end
function LiXingHuoDong2_OnLogin(ActorID)
	local year,month,day,hour,min,sec,wday = PublicFun_time()
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(MapID)
	local shijianzhuangtai = API_VarDataGetNumber(ActorID,1,7626)
	LiXingHuoDong2_MapPoint(ActorID)
	if StaticMapID == 104 then
		API_ActorSetPKTeamID(ActorID,1)
		epfunc_Set_PCdePKID(ActorID)
		if hour == LiXingHuoDong2_StartTime or hour == LiXingHuoDong3_StartTime then		
			local NPCFastID = API_VarDataGetNumber(ActorID,1,7623)
			if NPCFastID > 0 then --没有怪兽
				if shijianzhuangtai == 1 and API_VarDataGetNumber(ActorID,1,7622) > 0 then --养成时间判断
					local TimerTriggerID = API_VarDataGetNumber(ActorID,1,7634)
					if TimerTriggerID > 0 then
						API_DestroyTrigger(ActorID,-1,TimerTriggerID)	
					end
					TimerTriggerID =  API_CreateTimerTrigger(ActorID,90,1,-1,'LiXingHuoDong2_suijishijian')
					API_VarDataSetNumber(ActorID,1,7634,TimerTriggerID)	
				--	if API_GetMonsterID(NPCFastID) <= 0 then --没放出							
						LiXingHuoDong2_chongwu_add(ActorID) --添加怪兽
						--[[local jishiqi = API_VarDataGetNumber(ActorID,1,7624) --计时器
						if jishiqi > 0 then
							jishiqi = API_CreateTimerTrigger(ActorID,60,-1,943,'LiXingHuoDong2_jishiqi')
						end
						API_VarDataSetNumber(ActorID,1,7624,jishiqi)]]
				--	end
				end	
			end
			LiXingHuoDong2_jishiqi_show(ActorID) --显示
		else
			if shijianzhuangtai > 0 then
				LiXingHuoDong2_jieshuzhuangtai(ActorID)
			end
		end
	end
end
function LiXingHuoDong2_OnLogin2(ActorID)
	local year,month,day,hour,min,sec,wday = PublicFun_time()
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(MapID)
	local shijianzhuangtai = API_VarDataGetNumber(ActorID,1,7626)
	LiXingHuoDong2_MapPoint(ActorID)
	if StaticMapID == 104 then
		API_ActorSetPKTeamID(ActorID,1)
		epfunc_Set_PCdePKID(ActorID)
		if hour == LiXingHuoDong2_StartTime or hour == LiXingHuoDong3_StartTime then		
			local NPCFastID = API_VarDataGetNumber(ActorID,1,7623)
			if NPCFastID > 0 then --没有怪兽
				if shijianzhuangtai == 1 and API_VarDataGetNumber(ActorID,1,7622) > 0 then --养成时间判断
					local TimerTriggerID = API_VarDataGetNumber(ActorID,1,7634)
					if TimerTriggerID > 0 then
						API_DestroyTrigger(ActorID,-1,TimerTriggerID)	
					end
					TimerTriggerID =  API_CreateTimerTrigger(ActorID,90,1,-1,'LiXingHuoDong2_suijishijian')
					API_VarDataSetNumber(ActorID,1,7634,TimerTriggerID)
					if API_GetMonsterID(NPCFastID) <= 0 then --没放出						
						LiXingHuoDong2_chongwu_add(ActorID) --添加怪兽
					end
				end	
			end
			LiXingHuoDong2_jishiqi_show(ActorID) --显示
		else
			if shijianzhuangtai > 0 then
				LiXingHuoDong2_jieshuzhuangtai(ActorID)
			end
		end
	end
end
--第三部分
--进化  --进化最高级限制未定
function LiXingHuoDong2_jinhua(ActorID,bili,suozaibeibao,weizhi,chongwumID,jieduan)
	if jieduan >= 5 then
		API_ActorMeMScrollSetNumber(ActorID,suozaibeibao,weizhi,5,0) --存储新的成长值
		API_ActorMeMScrollSetNumber(ActorID,suozaibeibao,weizhi,9,0) --存储新的成长次数
		return
	end
	local MapID = API_GetActorMapID(ActorID)
	local FastID = API_VarDataGetNumber(ActorID,1,7623)
	local TileX = API_GetMonsterPosX(FastID)
	local TileY = API_GetMonsterPosY(FastID)
	local losecishu = API_VarDataGetNumber(ActorID,1,7628)
	local jinhuachenggong = 0 --进化失败为 0 进化成功为1
	local zhurenname = API_GetActorName(ActorID)
	if bili == 100 then
		jinhuachenggong = 1
	end
	--[[local gailv = bili - jieduan * 10 + losecishu * 10
	if gailv < 0 then
		gailv = 0
	end
	
	if math.random(100) <= gailv then
		jinhuachenggong = 1
	else
		jinhuachenggong = 0
	end]]
	if jinhuachenggong == 1 then
		jieduan = jieduan + 1
		API_VarDataSetNumber(ActorID,1,7627,jieduan)
		--给怪兽添加1个BUFF 播放升级光效
		API_MonsterAddStatus(FastID,663001,0)
		--播放怪兽表情 说话
		API_SendMonsterMsg(FastID,ActorID,'我的身体内有能量在涌动，进化!')
		if jieduan > 1 then
			local jieduan2 = jieduan - 1
			local qianzhui = '成年的'
			local houzhui = ''..jieduan2..'次进化 ('..zhurenname..')的怪兽'
			API_SetMonsterName(FastID,qianzhui,2)
			API_SetMonsterName(FastID,houzhui,3)
			local NPCFastHP = API_MonsterGetPropNum(FastID,2)
			if 3000 - NPCFastHP >= 1000 then
				API_MonsterAddHP(FastID,1000)
			else
				local chazhi = 3000 - NPCFastHP
				API_MonsterAddHP(FastID,chazhi)
			end
		end
		API_VarDataSetNumber(ActorID,1,7628,0)--失败次数清0	
		API_ActorMeMScrollSetNumber(ActorID,suozaibeibao,weizhi,6,0) --存储新的产物值
		API_ActorMeMScrollSetNumber(ActorID,suozaibeibao,weizhi,10,0) --存储新的产物次数
		API_ActorSendMsg(ActorID,6,'怪兽进化成功')
		API_ActorSendMsg(ActorID,17,'怪兽进化成功')
		local MID = API_VarDataGetNumber(ActorID,1,7622)
		local jieduan2 = API_VarDataGetNumber(ActorID,1,7627)		
		local jiangli = LiXingHuoDong2_jiangli[MID][jieduan2]
		API_ActorSendMsg(ActorID,1,'去饲养员处用怪兽可换取'..jiangli..'经验')
		LiXingHuoDong2_wenbenkuangtishi(ActorID,1)
		LiXingHuoDong2_taskzhuizong(ActorID)
		LiXingHuoDong2_jishiqi_show(ActorID)
		LiXingHuoDong2_taskzhuizong2(ActorID)
		--风向标  怪兽进化
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 0
		local jieduan2 = jieduan + 1
		if jieduan2 == 2 then
			Type = 2
		elseif jieduan2 == 3 then
			Type = 3
		elseif jieduan2 == 4 then
			Type = 4
		elseif jieduan2 == 5 then
			Type = 5
		end
		if Type == 0 then
			return
		end
		if GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] + 1
		end
	end
	if jinhuachenggong == 0 then --如果进化失败 失败次数加1 成长值 成长次数 清0
		losecishu = losecishu + 1
		API_VarDataSetNumber(ActorID,1,7628,losecishu)
		API_SendMonsterMsg(FastID,ActorID,'感觉不太对，进化失败。')
		API_ActorSendMsg(ActorID,6,'怪兽进化失败。')
		API_ActorSendMsg(ActorID,17,'怪兽进化失败。')
	end
	API_ActorMeMScrollSetNumber(ActorID,suozaibeibao,weizhi,5,0) --存储新的成长值
	API_ActorMeMScrollSetNumber(ActorID,suozaibeibao,weizhi,9,0) --存储新的成长次数
end
--产物
function LiXingHuoDong2_chandan(ActorID,bili,suozaibeibao,weizhi,chongwumID,jieduan)
	local kuangID = 0
	local MapID = API_GetActorMapID(ActorID)
	local dangci = 0
	if chongwumID == sanyanshou2 or chongwumID == anyuniao2 then
		dangci = 2
	elseif chongwumID == sanyanshou4 or chongwumID == anyuniao4 then
		dangci = 4
	elseif chongwumID == sanyanshou6 or chongwumID == anyuniao6 then
		dangci = 6
	end
	if dangci == 0 then
		return
	end
	if jieduan < 2 then
		return
	end
	local dantype = 0
	if LiXingHuoDong2_chongwu_chanwutable[jieduan][bili] ~= nil then
		local shuju1 = LiXingHuoDong2_chongwu_chanwutable[jieduan][bili][1]
		local shuju2 = LiXingHuoDong2_chongwu_chanwutable[jieduan][bili][2]
		local shuju3 = LiXingHuoDong2_chongwu_chanwutable[jieduan][bili][3]
		local shuju4 = LiXingHuoDong2_chongwu_chanwutable[jieduan][bili][4]
		local gailv = math.random(10000)
		local runxu = 0
		if gailv > shuju1 then --ROLL出的数值大于1号
		else				   --ROLL出的数值小于等于1号
			runxu = 1          --下次不允许
			dantype = 1        --蛋的类型设置成1金蛋
		end
		if runxu == 0 then
			if gailv > shuju2 then
			else
				runxu = 1
				dantype = 2
			end
		end
		if runxu == 0 then
			if gailv > shuju3 then
			else
				runxu = 1
				dantype = 3
			end
		end
		if runxu == 0 then
			if gailv > shuju4 then
			else
				runxu = 1
				dantype = 4
			end
		end					
	end
	local kuangID = 0
	if dantype > 0 then
		if LiXingHuoDong2_dan_table[dangci][dantype] ~= nil then
			kuangID = LiXingHuoDong2_dan_table[dangci][dantype]
		end
	end	
	if kuangID > 0 then --如果产出 大于 0 那么创建产出
		local FastID = API_VarDataGetNumber(ActorID,1,7623)
		local TileX = API_GetActorPosX(ActorID)
		local TileY = API_GetActorPosY(ActorID)
		local UID = API_CreateResBoxEx_UID(MapID,TileX,TileY,kuangID,1,'例行活动2',1,4,ActorID,60,0)--饲料可以挖掘1次 绑定方式走默认			
		local UIDL = API_GetUIDLow()
		API_ActorSendMsg(ActorID,6,'生蛋了！')
		LiXingHuoDong2_jishiqi_show(ActorID)
		API_ActorMeMScrollSetNumber(ActorID,suozaibeibao,weizhi,6,0) --存储新的产物值
		API_ActorMeMScrollSetNumber(ActorID,suozaibeibao,weizhi,10,0) --存储新的产物次数
		if LiXingHuoDong2_chanwutongjitable[MapID] == nil then
			LiXingHuoDong2_chanwutongjitable[MapID] = {}
		end
		if type(LiXingHuoDong2_chanwutongjitable[MapID]) == 'table' then
			local xuhao = table.getn(LiXingHuoDong2_chanwutongjitable[MapID]) + 1
			if LiXingHuoDong2_chanwutongjitable[MapID][xuhao] == nil then
				LiXingHuoDong2_chanwutongjitable[MapID][xuhao] = {}
			end
			LiXingHuoDong2_chanwutongjitable[MapID][xuhao].UID = UID
		end
		local danid = 0
		if LiXingHuoDong2_dantubiao_table[dangci][dantype] ~= nil then
			danid = LiXingHuoDong2_dantubiao_table[dangci][dantype]
		end
		LiXingHuoDong2_wenbenkuangtishi(ActorID,4,danid)
		--风向标  蛋
		local LaiYuan = API_ActorGetPropNum(ActorID,201)
		local Type = 0
		if jieduan == 2 then
			if kuangID == 216 or kuangID == 233 or kuangID == 241 then --白蛋
				Type = 11
			elseif kuangID == 219 or kuangID == 236 or kuangID == 244 then --绿蛋
				Type = 12
			elseif kuangID == 220 or kuangID == 237 or kuangID == 245 then --银蛋
				Type = 13
			elseif kuangID == 221 or kuangID == 238 or kuangID == 246 then --金蛋
				Type = 14
			end
		elseif jieduan == 3 then
			if kuangID == 216 or kuangID == 233 or kuangID == 241 then
				Type = 15
			elseif kuangID == 219 or kuangID == 236 or kuangID == 244 then
				Type = 16
			elseif kuangID == 220 or kuangID == 237 or kuangID == 245 then
				Type = 17
			elseif kuangID == 221 or kuangID == 238 or kuangID == 246 then
				Type = 18
			end
		elseif jieduan == 4 then
			if kuangID == 216 or kuangID == 233 or kuangID == 241 then
				Type = 19
			elseif kuangID == 219 or kuangID == 236 or kuangID == 244 then
				Type = 20
			elseif kuangID == 220 or kuangID == 237 or kuangID == 245 then
				Type = 21
			elseif kuangID == 221 or kuangID == 238 or kuangID == 246 then
				Type = 22
			end
		elseif jieduan == 5 then
			if kuangID == 216 or kuangID == 233 or kuangID == 241 then
				Type = 23
			elseif kuangID == 219 or kuangID == 236 or kuangID == 244 then
				Type = 24
			elseif kuangID == 220 or kuangID == 237 or kuangID == 245 then
				Type = 25
			elseif kuangID == 221 or kuangID == 238 or kuangID == 246 then
				Type = 26
			end
		end
		if Type == 0 then
			return
		end
		if GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] == nil then
			GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = 1
		else
			GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] + 1
		end
	end
end
--怪兽徽章使用
function LiXingHuoDong2_chongwuhuizhang_dianji(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	if API_ActorGetGoodsNum(ActorID,GoodsID) < 1 then
		API_ActorSendMsg(ActorID,0,'没有这个道具')
		API_ActorSendMsg(ActorID,7,'没有这个道具')
		return 0
	end
	local MapID = API_GetActorMapID(ActorID)
	local SelectItem = API_RequestGetNumber(1)
--	local linghun,qianli,suozaibeibao,weizhi = LiXingHuoDong2_chongwuhuizhang_dianji(ActorID,GoodsID) --传送玩家ID 物品ID给 位置寻找函数 返回 当前灵魂 当前潜力
	local MID = API_VarDataGetNumber(ActorID,1,7622)
	local FastID = API_VarDataGetNumber(ActorID,1,7623)
	local jieduan = API_VarDataGetNumber(ActorID,1,7627)
	local jinhuashu = ''
	if jieduan == 1 then
		jinhuashu = '幼年阶段'
	elseif jieduan == 2 then
		jinhuashu = '成年阶段1次进化'
	elseif jieduan == 3 then
		jinhuashu = '成年阶段2次进化'
	elseif jieduan == 4 then
		jinhuashu = '成年阶段3次进化'
	elseif jieduan == 5 then
		jinhuashu = '成年阶段4次进化'
	end
	local xihuan = 0
	local zuixihuan = 0
	local taoyan = 0
	if LiXingHuoDong2_chongwutable2[MID][jieduan] ~= nil then
		xihuan = LiXingHuoDong2_chongwutable2[MID][jieduan].xihuan
		zuixihuan = LiXingHuoDong2_chongwutable2[MID][jieduan].zuixihuan
		taoyan = LiXingHuoDong2_chongwutable2[MID][jieduan].taoyan
	end
	if SelectItem == 0 then
		--关闭状态
		API_ResponseWrite('<name>怪兽徽章</name>')
		API_ResponseWrite('<text color="255,255,255">怪兽名称：'..API_GetMonsterNameByID(MID)..'</text><br>')
		API_ResponseWrite('<text color="255,255,255">怪兽成长状况：'..jinhuashu..'</text><br>')
		API_ResponseWrite('<text color="255,255,255">怪兽喜欢的食物：'..API_GetGoodsName(xihuan)..'</text><br>')
		API_ResponseWrite('<text color="255,255,255">怪兽最喜欢的食物：'..API_GetGoodsName(zuixihuan)..'</text><br>')
		API_ResponseWrite('<text color="255,255,255">怪兽讨厌的食物：'..API_GetGoodsName(taoyan)..'</text><br>')
		API_ResponseWrite('<text color="255,255,255">选择</text><text color="0,255,255">“丢弃”后，“怪兽徽章”将被删除，养成将结束，并且不能获得奖励。</text><br><br>')
		API_ResponseWrite('<a href="LiXingHuoDong2_chongwuhuizhang_dianji2?1='..ActorID..'&2='..GoodsID..'&3='..High..'&4='..Low..'">丢弃</a><br><br>')
		API_ResponseWrite('<br><a>关闭</a><br>')
		API_ResponseFlush(ActorID)
		return 1
	end
end
function LiXingHuoDong2_chongwuhuizhang_dianji2(ActorID,GoodsID,High,Low) -- 丢弃
	local ActorID = API_RequestGetNumber(1)
	local GoodsID = API_RequestGetNumber(2)
	local High = API_RequestGetNumber(3)
	local Low = API_RequestGetNumber(4)
	local MapID = API_GetActorMapID(ActorID)
	local uid = API_GetUID(High,Low) --获取UID
	local bagID,Loc = API_GetUIDGoodsInActor(uid,ActorID)--背包ID 和 位置
	if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID,1,bagID,Loc,'丢弃怪兽徽章') then
		if API_VarDataGetNumber(ActorID,1,7623) > 0 then
			LiXingHuoDong2_chongwu_del(ActorID) --删除怪兽
		end
		API_VarDataSetNumber(ActorID,1,7622,0) --怪兽设置为0
		--[[local jishiqi = API_VarDataGetNumber(ActorID,1,7624)
		if jishiqi > 0 then --到达时间 计时器删除 并且清0
			API_DestroyTrigger(ActorID,943,jishiqi)
		end
		API_VarDataSetNumber(ActorID,1,7624,0)]]
		API_VarDataSetNumber(ActorID,1,7626,0) --当前状态
		API_VarDataSetNumber(ActorID,1,7627,0) --当前状态
		API_VarDataSetNumber(ActorID,1,7628,0) --当前状态
		API_VarDataSetNumber(ActorID,1,7629,0)
		API_VarDataSetNumber(ActorID,1,7631,0)
		API_VarDataSetNumber(ActorID,1,7632,0)				
		API_VarDataSetNumber(ActorID,1,7630,0)	
		API_VarDataSetNumber(ActorID,1,7623,0)
		local TimerTriggerID = API_VarDataGetNumber(ActorID,1,7634)
		if TimerTriggerID > 0 then
			API_DestroyTrigger(ActorID,-1,TimerTriggerID)
		end
		API_VarDataSetNumber(ActorID,1,7634,0)
		LiXingHuoDong2_jishiqi_show(ActorID)
		API_ActorSendMsg(ActorID,0,'丢弃“怪兽徽章”，养成结束')
	end
end
--兑换的饲料使用
function LiXingHuoDong2_chongwusiliao_shiyong(ActorID,GoodsID,Type,Value,MapID,ObjectX,ObjectY,High,Low)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	--只有在怪兽存在的情况下才能使用
	--只有在有怪兽徽章的情况下才能使用
	--只有在养成时间内才能使用
	--删除
	local chongwumID = API_VarDataGetNumber(ActorID,1,7622)
	local wupinID = 0
	if LiXingHuoDong2_chongwuwupintable[chongwumID] ~= nil then
		wupinID  = LiXingHuoDong2_chongwuwupintable[chongwumID]
	else
		API_ActorSendMsg(ActorID,0,'喂养时发生错误，请与GM取得联系。')
		API_ActorSendMsg(ActorID,7,'喂养时发生错误，请与GM取得联系。')
		return
	end
	if API_ActorGetGoodsNum(ActorID,wupinID) <= 0 then
		API_ActorSendMsg(ActorID,0,'没有怪兽徽章，不能喂养怪兽。')
		API_ActorSendMsg(ActorID,7,'没有怪兽徽章，不能喂养怪兽。')
		return
	end
	local shijianzhuangtai = API_VarDataGetNumber(ActorID,1,7626)
	if shijianzhuangtai == 0 then --养成时间判断
		API_ActorSendMsg(ActorID,0,'养成已结束或还未开始，不能喂养怪兽。')
		API_ActorSendMsg(ActorID,7,'养成已结束或还未开始，不能喂养怪兽。')
		return
	end
	local chongwuFID = API_VarDataGetNumber(ActorID,1,7623)
	if API_GetMonsterID(chongwuFID) <= 0 then --怪兽存在判断	
		API_ActorSendMsg(ActorID,0,'没有“饲养员”委托的怪兽，不能喂养怪兽。')
		API_ActorSendMsg(ActorID,7,'没有“饲养员”委托的怪兽，不能喂养怪兽。')
		return
	end
	if API_ActorRemoveGoods(ActorID,GoodsID,1,'喂养怪兽') then
		local jiazhi = 0
		if LiXingHuoDong2_siliao_table[GoodsID] ~= nil then
			jiazhi = LiXingHuoDong2_siliao_table[GoodsID] --获取饲料的 增加值
		end
		local ResGoodsID = 0 
		LiXingHuoDong2_siliaoadd_jisuan(ActorID,jiazhi,1,ResGoodsID)
	end
	LiXingHuoDong2_jishiqi_show(ActorID)
end
function LiXingHuoDong2_siliaoadd_jisuan(ActorID,jiazhi,cishu,ResGoodsID)	
	local chongwumID = API_VarDataGetNumber(ActorID,1,7622)
	local wupinID = 0
	if LiXingHuoDong2_chongwuwupintable[chongwumID] ~= nil then
		wupinID  = LiXingHuoDong2_chongwuwupintable[chongwumID]
	else
		API_ActorSendMsg(ActorID,0,'采集时发生错误，请与GM取得联系。')
		API_ActorSendMsg(ActorID,7,'采集时发生错误，请与GM取得联系。')
		return
	end
	if API_ActorGetGoodsNum(ActorID,wupinID) <= 0 then
		API_ActorSendMsg(ActorID,0,'没有怪兽徽章，不能喂养怪兽。')
		API_ActorSendMsg(ActorID,7,'没有怪兽徽章，不能喂养怪兽。')
		return
	end
	local shijianzhuangtai = API_VarDataGetNumber(ActorID,1,7626)
	if shijianzhuangtai == 0 then --养成时间判断
		API_ActorSendMsg(ActorID,0,'养成已结束或还未开始，不能喂养怪兽。')
		API_ActorSendMsg(ActorID,7,'养成已结束或还未开始，不能喂养怪兽。')
		return
	end
	local chongwuFID = API_VarDataGetNumber(ActorID,1,7623)
	if API_GetMonsterID(chongwuFID) <= 0 then --怪兽存在判断	
		API_ActorSendMsg(ActorID,0,'没有“饲养员”委托的怪兽，不能喂养怪兽。')
		API_ActorSendMsg(ActorID,7,'没有“饲养员”委托的怪兽，不能喂养怪兽。')
		return
	end
	local chengzhangzhi,chanwuzhi,suozaibeibao,weizhi = LingHunShi_linghunzhuweizhichaxun(ActorID,wupinID)
	if suozaibeibao >= 0 and weizhi >= 0 then --物品位置返回判定
		------------------------------------------------修炼相关
		local jiazhi2 = 0
		local RewardNum = HouseNazarite_AddReward(ActorID,14) --成长值系数
		if RewardNum > 0 then
			jiazhi2 = math.floor(jiazhi * RewardNum)
			if jiazhi2 == 0 then
				jiazhi2 = 1
			end
		end
		jiazhi = jiazhi + jiazhi2
		-----------------------------------------------修炼相关结束
		local chengzhangzhiMAX = 0
		local chanwuzhiMAX = 0
		local chengzhangcishuMAX = 0
		local chandancishuMAX = 0
		local jieduan = API_VarDataGetNumber(ActorID,1,7627) --怪兽阶段
		if LiXingHuoDong2_chongwutable2[chongwumID][jieduan] ~= nil then
			chengzhangzhiMAX = LiXingHuoDong2_chongwutable2[chongwumID][jieduan].chengzhangMAX  --最大成长值
			chanwuzhiMAX = LiXingHuoDong2_chongwutable2[chongwumID][jieduan].chanwuMAX	--最大产物值
			chengzhangcishuMAX = LiXingHuoDong2_chongwutable2[chongwumID][jieduan].chengzhangcishuMAX --最大成长次数
			chandancishuMAX = LiXingHuoDong2_chongwutable2[chongwumID][jieduan].chandancishuMAX --最大产物次数
		end		
		
		local chengzhangcishu = API_ActorMeMScrollGetNumber(ActorID,suozaibeibao,weizhi,9) --成长次数
		local chandancishu = API_ActorMeMScrollGetNumber(ActorID,suozaibeibao,weizhi,10) --产蛋次数
		--当次数 == 次数 那么获取 数值 进行计算
		--当次数 ~= 次数 那么 值+值
		
		local wupinid = 0
		local xihuan = 0
		local zuixihuan = 0
		local taoyan = 0
		local xihaowenzi = ''
		local dangci = 0
		local jiajianzhuangtai = 0
		if ResGoodsID > 0 then
			if LiXingHuoDong2_siliao_table3[ResGoodsID] ~= nil then
				wupinid = LiXingHuoDong2_siliao_table3[ResGoodsID]
			end
		end
		local xihaojiazhi = 0
		if wupinid > 0 then
			if wupinid == 80646 or wupinid == xiaokuaiderou or wupinid == xiaokuaidegutou then
				dangci = 1
			elseif wupinid == 80645 or wupinid == zhongkuaiderou or wupinid == zhongkuaidegutou then
				dangci = 2
			elseif wupinid == kuhuangdecao or wupinid == dakuaiderou or wupinid == dakuaidegutou then
				dangci = 3
			end
			if LiXingHuoDong2_chongwutable2[chongwumID][jieduan] ~= nil then
				xihuan = LiXingHuoDong2_chongwutable2[chongwumID][jieduan].xihuan				
				zuixihuan = LiXingHuoDong2_chongwutable2[chongwumID][jieduan].zuixihuan
				taoyan = LiXingHuoDong2_chongwutable2[chongwumID][jieduan].taoyan
			end
			if wupinid > 0 and xihuan > 0 and zuixihuan > 0 and taoyan > 0 then
				if wupinid == xihuan then
					if dangci == 1 then
						xihaojiazhi = 1
					elseif dangci == 2 then
						xihaojiazhi = 2
					elseif dangci == 3 then
						xihaojiazhi = 4
					end
					xihaowenzi = '喜欢'
					jiajianzhuangtai = 1
				elseif wupinid == zuixihuan then
					if dangci == 1 then
						xihaojiazhi = 3
					elseif dangci == 2 then
						xihaojiazhi = 6
					elseif dangci == 3 then
						xihaojiazhi = 12
					end
					xihaowenzi = '最喜欢'
					jiajianzhuangtai = 1
				elseif wupinid == taoyan then
					if dangci == 1 then
						xihaojiazhi = 5
					elseif dangci == 2 then
						xihaojiazhi = 10
					elseif dangci == 3 then
						xihaojiazhi = 20
					end
					xihaowenzi = '不喜欢'
					jiajianzhuangtai = 2
				end
			end
		end
		local newjiazhi = 0
		if jiajianzhuangtai > 0 then
			if jiajianzhuangtai == 2 then
				newjiazhi = jiazhi - xihaojiazhi
			elseif jiajianzhuangtai == 1 then
				newjiazhi = jiazhi + xihaojiazhi
			end
		elseif jiajianzhuangtai == 0 then
			newjiazhi = jiazhi
		end
		if newjiazhi == 0 then
			newjiazhi = 1
		end
		--成长部分
		if chengzhangzhiMAX > 0 then
			local newchengzhangzhi = chengzhangzhi + newjiazhi --新成长值 ==成长值+加值
			if newchengzhangzhi >= chengzhangzhiMAX then--如果新成长值 >= 成长值
				local bili = 100
				LiXingHuoDong2_jinhua(ActorID,bili,suozaibeibao,weizhi,chongwumID,jieduan)
			else
				API_ActorMeMScrollSetNumber(ActorID,suozaibeibao,weizhi,5,newchengzhangzhi) --存储新的成长值
			end
		end
		local jiazhi3 = jiazhi - jiazhi2
		if ResGoodsID > 0 then
			if xihaojiazhi == 0 then
				API_ActorSendMsg(ActorID,0,'喂养成功，成长增加'..jiazhi3..'点')
			elseif xihaojiazhi > 0 then
				if jiajianzhuangtai == 2 then
					API_ActorSendMsg(ActorID,0,'喂养成功，成长增加'..jiazhi3..'点，吃到'..xihaowenzi..'饲料额外减少'..xihaojiazhi..'点成长。')
				else
					API_ActorSendMsg(ActorID,0,'喂养成功，成长增加'..jiazhi3..'点，吃到'..xihaowenzi..'饲料额外增加'..xihaojiazhi..'点成长。')
				end
			end	
			if jiazhi2 > 0 then
				API_ActorSendMsg(ActorID,0,'由于修炼额外获得'..jiazhi2..'点成长。')
			end
		else
			API_ActorSendMsg(ActorID,0,'完成怪兽要求增加'..jiazhi3..'点成长')
		end
		LiXingHuoDong2_taskzhuizong2(ActorID)
		--产出部分
		if jieduan > 1 then
			if chandancishu + cishu >= chandancishuMAX then
				--进入进化函数				
				--if chanwuzhiMAX > 0 then --产蛋的方案改变 和 最大值无关系 产物值直接影响产蛋
					newchanwuzhi = chanwuzhi + jiazhi --增加新的产物值
					if newchanwuzhi >= chanwuzhiMAX then
						newchanwuzhi = chanwuzhiMAX
					end
					local bili = newchanwuzhi
					bili = math.floor(bili/10) --结果
					bili = bili * 10
					if bili < 50 then
						bili = 50
					elseif bili > 200 then
						bili = 200
					end
					LiXingHuoDong2_chandan(ActorID,bili,suozaibeibao,weizhi,chongwumID,jieduan)
				--end
			else --不达到最大值
			--if chanwuzhiMAX > 0 then
				newchanwuzhi = chanwuzhi + newjiazhi --增加新的产物值
				if newchanwuzhi >= chanwuzhiMAX then
					newchanwuzhi = chanwuzhiMAX
				end
				chandancishu = chandancishu + cishu  --增加新的成长次数
				API_ActorMeMScrollSetNumber(ActorID,suozaibeibao,weizhi,6,newchanwuzhi) --存储新的产物值
				API_ActorMeMScrollSetNumber(ActorID,suozaibeibao,weizhi,10,chandancishu) --存储新的产物次数
			--end
			end
		end
	end
end
--第四部分
--特殊事件
--概念性设定 创建怪兽后 创建1个3分钟回调的时间触发器  时间触发器触发后 进入一个表进行 下1个触发器时间的随机
--领取怪兽 LOGIN LOGINMAP 创建随机时间回调1
--从随机回调1 进入随机回调2 从随机回调2 创建事件
--无论事件是否完成 都创建随机回调2 如此循环
function LiXingHuoDong2_suijishijian(ActorID,TaskID)
	local TimerTriggerID = API_VarDataGetNumber(ActorID,1,7634)
	if TimerTriggerID <= 0 then
		return	
	end
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(MapID)
	if StaticMapID == 104 then
		local shijianzhuangtai = API_VarDataGetNumber(ActorID,1,7626)
		if shijianzhuangtai == 1 then --养成时间判断
			local chongwuFID = API_VarDataGetNumber(ActorID,1,7623)
			if API_GetMonsterID(chongwuFID) > 0 then --怪兽存在判断	
				local chongwumID = API_VarDataGetNumber(ActorID,1,7622)
				if LiXingHuoDong2_chongwuwupintable[chongwumID] ~= nil then
					local wupinID  = LiXingHuoDong2_chongwuwupintable[chongwumID]
					if API_ActorGetGoodsNum(ActorID,wupinID) > 0 then
						local huidiaotime = math.random(table.getn(LiXingHuoDong2_suijishijian_timetable))
						huidiaotime = LiXingHuoDong2_suijishijian_timetable[huidiaotime]
						local newTimerTriggerID = API_CreateTimerTrigger(ActorID,huidiaotime,1,-1,'LiXingHuoDong2_suijishijian2')
						API_VarDataSetNumber(ActorID,1,7634,newTimerTriggerID)
					end
				end
			end
		end
	end
	API_DestroyTrigger(ActorID,-1,TimerTriggerID)
end 
function LiXingHuoDong2_suijishijian2(ActorID,TaskID)
	local TimerTriggerID = API_VarDataGetNumber(ActorID,1,7634)
	if TimerTriggerID <= 0 then
		return	
	end
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(MapID)
	if StaticMapID == 104 then
		local shijianzhuangtai = API_VarDataGetNumber(ActorID,1,7626)
		if shijianzhuangtai == 1 then --养成时间判断
			local chongwuFID = API_VarDataGetNumber(ActorID,1,7623)
			if API_GetMonsterID(chongwuFID) > 0 then --怪兽存在判断	
				local chongwumID = API_VarDataGetNumber(ActorID,1,7622)
				if LiXingHuoDong2_chongwuwupintable[chongwumID] ~= nil then
					local wupinID  = LiXingHuoDong2_chongwuwupintable[chongwumID]
					if API_ActorGetGoodsNum(ActorID,wupinID) > 0 then
						--进入事件库循环
						local jieduan = API_VarDataGetNumber(ActorID,1,7627)
						if jieduan > 0 then --阶段判定
							if LiXingHuoDong2_suijishijiantable[jieduan] ~= nil then
								for i in LiXingHuoDong2_suijishijiantable[jieduan] do
									local gailv = LiXingHuoDong2_suijishijiantable[jieduan][i].gailv
									if math.random(100) <= gailv then
										local leixing = LiXingHuoDong2_suijishijiantable[jieduan][i].leixing
										LiXingHuoDong2_teshushijian(ActorID,leixing,chongwuFID,chongwumID)
										break
									end
								end
							end
						end
					end
				end
			end
		end
	end
	API_DestroyTrigger(ActorID,-1,TimerTriggerID)
end
function LiXingHuoDong2_teshushijian(ActorID,leixing,chongwuFID,chongwumID)
	--type1 我想吃XX
	--type2 我不想吃XX
	--type3 给我一个我喜欢吃的
	--type4 给我一个我最喜欢吃的
	--type5 我不想吃我喜欢的
	--type6 我不想吃我不喜欢的
	--type7 我要先吃这个 再吃这个 最后吃这个
	local jieduan = API_VarDataGetNumber(ActorID,1,7627)
	local xihao,zuixihao,taoyan = LiXingHuoDong2_chongwuxihao(chongwumID,jieduan)
	--此部分考通过统一函数 获得怪兽喜好
	if leixing == 1 then
		local time = 30
		local xuqiu = 0
		repeat
			local xuhao = math.random(table.getn(LiXingHuoDong2_siliao_table2[jieduan]))
			xuqiu = LiXingHuoDong2_siliao_table2[jieduan][xuhao]
		until xuqiu ~= taoyan
			API_VarDataSetNumber(ActorID,1,7629,xuqiu)
			API_VarDataSetNumber(ActorID,1,7630,leixing)
			if API_GetMonsterID(chongwuFID) > 0 then
				API_SendMonsterMsg(chongwuFID,ActorID,'我想吃'..API_GetGoodsName(xuqiu)..'。')--等程序接口显示图片
				API_ActorSendMsg(ActorID,12,'您培养的怪兽想吃'..API_GetGoodsName(xuqiu)..'。')
			end
			--API_ActorSendMsg(ActorID,17,'您培养的怪兽想吃'..API_GetGoodsName(xuqiu)..'。')
			local newTimerTrigger = API_CreateTimerTrigger(ActorID,time,1,-1,'LiXingHuoDong2_teshushijianshijianhuidiao')
			API_VarDataSetNumber(ActorID,1,7634,newTimerTrigger)
	end
	if leixing == 2 or leixing == 5 or leixing == 6 then
		local time = 30
		local xuqiu = 0
		local xuqiu2 = 0
		local text = ''
		if leixing == 2 then
			repeat
				local xuhao = math.random(table.getn(LiXingHuoDong2_siliao_table2[jieduan]))
				xuqiu = LiXingHuoDong2_siliao_table2[jieduan][xuhao]
			until xuqiu ~= xihao and xuqiu ~= zuixihao
				text = '我不想吃'..API_GetGoodsName(xuqiu)..'。'
		end
		if leixing == 5 then
			xuqiu = zuixihao
			xuqiu2 = xihao
			text = '我不想吃我喜欢吃的东西。'
		end
		if leixing == 6 then
			xuqiu = taoyan
			text = '我不想吃我不喜欢吃的东西。'
		end
		API_VarDataSetNumber(ActorID,1,7629,xuqiu)
		API_VarDataSetNumber(ActorID,1,7630,leixing)
		API_VarDataSetNumber(ActorID,1,7631,xuqiu2)
		if API_GetMonsterID(chongwuFID) > 0 then
			API_SendMonsterMsg(chongwuFID,ActorID,text)--等程序接口显示图片
			API_ActorSendMsg(ActorID,12,'您培养的怪兽说“'..text..'”')
		end
		--API_ActorSendMsg(ActorID,17,'您培养的怪兽说“'..text..'”')
		local newTimerTrigger = API_CreateTimerTrigger(ActorID,time,1,-1,'LiXingHuoDong2_teshushijianshijianhuidiao')
		API_VarDataSetNumber(ActorID,1,7634,newTimerTrigger)
	end
	if leixing == 3 or leixing == 4 then
		local time = 30
		local xuqiu = 0
		local text = ''
		if leixing == 3 then
			xuqiu = zuixihao
			text = '给我一个我最喜欢吃的'
		end
		if leixing	== 4 then
			xuqiu = xihao
			text = '给我一个我喜欢吃的'
		end
		API_VarDataSetNumber(ActorID,1,7629,xuqiu)
		API_VarDataSetNumber(ActorID,1,7630,leixing)
		if API_GetMonsterID(chongwuFID) > 0 then
			API_SendMonsterMsg(chongwuFID,ActorID,text)--等程序接口显示图片
			API_ActorSendMsg(ActorID,12,'您培养的怪兽说“'..text..'”')
		end
		--API_ActorSendMsg(ActorID,17,'您培养的怪兽说“'..text..'”')
		local newTimerTrigger = API_CreateTimerTrigger(ActorID,time,1,-1,'LiXingHuoDong2_teshushijianshijianhuidiao')
		API_VarDataSetNumber(ActorID,1,7634,newTimerTrigger)
	end
	if leixing == 7 then
		local time = 90
		local xuhao = math.random(table.getn(LiXingHuoDong2_siliao_table2[jieduan]))
		local xuqiu = LiXingHuoDong2_siliao_table2[jieduan][xuhao]
		local xuhao2 = math.random(table.getn(LiXingHuoDong2_siliao_table2[jieduan]))
		local xuqiu2 = LiXingHuoDong2_siliao_table2[jieduan][xuhao2]
		local xuhao3 = math.random(table.getn(LiXingHuoDong2_siliao_table2[jieduan]))
		local xuqiu3 = LiXingHuoDong2_siliao_table2[jieduan][xuhao3]
		API_VarDataSetNumber(ActorID,1,7629,xuqiu)
		API_VarDataSetNumber(ActorID,1,7631,xuqiu2)
		API_VarDataSetNumber(ActorID,1,7632,xuqiu3)
		API_VarDataSetNumber(ActorID,1,7630,leixing)
		if API_GetMonsterID(chongwuFID) > 0 then
			API_SendMonsterMsg(chongwuFID,ActorID,'90秒内我要先吃'..API_GetGoodsName(xuqiu)..'再吃'..API_GetGoodsName(xuqiu2)..'最后吃'..API_GetGoodsName(xuqiu3)..'')--等程序接口显示图片
			API_ActorSendMsg(ActorID,12,'您培养的怪兽说“90秒内我要先吃'..API_GetGoodsName(xuqiu)..'再吃'..API_GetGoodsName(xuqiu2)..'最后吃'..API_GetGoodsName(xuqiu3)..'”。')
		end
		--API_ActorSendMsg(ActorID,17,'您培养的怪兽说“60秒内我要先吃'..API_GetGoodsName(xuqiu)..'再吃'..API_GetGoodsName(xuqiu2)..'最后吃'..API_GetGoodsName(xuqiu3)..'”。')
		local newTimerTrigger = API_CreateTimerTrigger(ActorID,time,1,-1,'LiXingHuoDong2_teshushijianshijianhuidiao')
		API_VarDataSetNumber(ActorID,1,7634,newTimerTrigger)
	end
	--风向标  特殊事件发生数
	local LaiYuan = API_ActorGetPropNum(ActorID,201)
	local Type = 54
	if GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] == nil then
		GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = 1
	else
		GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] + 1
	end
end
function LiXingHuoDong2_chongwuxihao(chongwumID,jieduan)
	local xihao = 0
	local zuixihao = 0
	local taoyan = 0
	local zuitaoyan = 0
	if LiXingHuoDong2_chongwutable2[chongwumID][jieduan] ~= nil then
		xihao = LiXingHuoDong2_chongwutable2[chongwumID][jieduan].xihuan
		zuixihao = LiXingHuoDong2_chongwutable2[chongwumID][jieduan].zuixihuan
		taoyan = LiXingHuoDong2_chongwutable2[chongwumID][jieduan].taoyan
	end
	return xihao,zuixihao,taoyan
end
function LiXingHuoDong2_suijishijiancaijihuidiao1(ActorID,ResGoodsID) --随机事件采集回调
	local leixing = API_VarDataGetNumber(ActorID,1,7630)
	local xuqiu1 = API_VarDataGetNumber(ActorID,1,7629)
	local xuqiu2 = API_VarDataGetNumber(ActorID,1,7631)
	local xuqiu3 = API_VarDataGetNumber(ActorID,1,7632)
	local chongwuFID = API_VarDataGetNumber(ActorID,1,7623)
	if leixing > 0 and xuqiu1 > 0 then
		if leixing == 1 or leixing == 3 or leixing == 4 then
			local wupinid = 0
			if LiXingHuoDong2_siliao_table3[ResGoodsID] ~= nil then
				wupinid = LiXingHuoDong2_siliao_table3[ResGoodsID]
			end
			if wupinid == xuqiu1 then
				--对的处理
				local jiazhi = 0
				if LiXingHuoDong2_siliao_table[ResGoodsID] ~= nil then
					jiazhi = 10 --获取饲料的 增加值
				end				
				local ResGoodsID = 0 
				LiXingHuoDong2_siliaoadd_jisuan(ActorID,jiazhi,0,ResGoodsID)
				if API_GetMonsterID(chongwuFID) > 0 then
					API_SendMonsterMsg(chongwuFID,ActorID,'吃对了！#48')--等程序接口显示图片
					API_ActorSendMsg(ActorID,12,'您培养的怪兽露出了笑脸。')
				end
				--API_ActorSendMsg(ActorID,17,'您培养的怪兽露出了笑脸。')
					--风向标  特殊事件发生数
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 55
				if GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] + 1
				end
			else
				--错误的处理
				if API_GetMonsterID(chongwuFID) > 0 then
					--API_SendMonsterMsg(chongwuFID,ActorID,'吃错了！#24')--等程序接口显示图片
					--API_ActorSendMsg(ActorID,12,'您培养的怪兽有些不愉快。')
				end
				--API_ActorSendMsg(ActorID,17,'您培养的怪兽有些不愉快。')
			end
			API_VarDataSetNumber(ActorID,1,7629,0)
			API_VarDataSetNumber(ActorID,1,7630,0)
			return
		end
		if leixing == 2 or leixing == 5 or leixing == 6 then
			local wupinid = 0
			if LiXingHuoDong2_siliao_table3[ResGoodsID] ~= nil then
				wupinid = LiXingHuoDong2_siliao_table3[ResGoodsID]
			end
			local runxu = 0
			if leixing == 2 or leixing == 6 then
				if wupinid ~= xuqiu1 then
					runxu = 1
				end
			end
			if leixing == 5 then
				if wupinid ~= xuqiu1 and wupinid ~= xuqiu2 then
					runxu = 1
				end
			end
				--对的处理
			if runxu == 1 then
				local jiazhi = 0
				if LiXingHuoDong2_siliao_table[ResGoodsID] ~= nil then
					jiazhi = 10 --获取饲料的 增加值
				end				
				local ResGoodsID = 0 
				LiXingHuoDong2_siliaoadd_jisuan(ActorID,jiazhi,0,ResGoodsID)
				if API_GetMonsterID(chongwuFID) > 0 then
					API_SendMonsterMsg(chongwuFID,ActorID,'吃对了！#48')--等程序接口显示图片
					API_ActorSendMsg(ActorID,12,'您培养的怪兽露出了笑脸。')
				end
				--API_ActorSendMsg(ActorID,17,'您培养的怪兽露出了笑脸。')
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 55
				if GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] + 1
				end
			else
				--错误的处理
				if API_GetMonsterID(chongwuFID) > 0 then
					API_SendMonsterMsg(chongwuFID,ActorID,'吃到不想吃的了，#24')--等程序接口显示图片
					API_ActorSendMsg(ActorID,12,'您培养的怪兽有些不愉快。')
				end
				--API_ActorSendMsg(ActorID,17,'您培养的怪兽有些不愉快。')
			end
			API_VarDataSetNumber(ActorID,1,7629,0)
			API_VarDataSetNumber(ActorID,1,7630,0)
			return
		end
		if leixing == 7 then
			local wupinid = 0
			if LiXingHuoDong2_siliao_table3[ResGoodsID] ~= nil then
				wupinid = LiXingHuoDong2_siliao_table3[ResGoodsID]
			end
			if xuqiu1 > 1 then
				if wupinid == xuqiu1 then
					--对的处理
					if API_GetMonsterID(chongwuFID) > 0 then					
						API_SendMonsterMsg(chongwuFID,ActorID,'吃对了！#48')--等程序接口显示图片
						API_ActorSendMsg(ActorID,12,'您培养的怪兽露出了笑脸。')
					--API_ActorSendMsg(ActorID,17,'您培养的怪兽露出了笑脸。')
					end
					API_VarDataSetNumber(ActorID,1,7629,1) 
				else
					--错误的处理
					if API_GetMonsterID(chongwuFID) > 0 then		
						--API_SendMonsterMsg(chongwuFID,ActorID,'吃错了，#24')--等程序接口显示图片
						--API_ActorSendMsg(ActorID,12,'您培养的怪兽有些不愉快。')
					end
					
					--API_ActorSendMsg(ActorID,17,'您培养的怪兽有些不愉快。')
						API_VarDataSetNumber(ActorID,1,7629,0)
						API_VarDataSetNumber(ActorID,1,7631,0)
						API_VarDataSetNumber(ActorID,1,7632,0)				
						API_VarDataSetNumber(ActorID,1,7630,0)
				end
				return
			elseif xuqiu1 == 1 then
				if xuqiu2 > 1 then
					if wupinid == xuqiu2 then
						--对的处理
						if API_GetMonsterID(chongwuFID) > 0 then			
							API_SendMonsterMsg(chongwuFID,ActorID,'又吃对了！#48')--等程序接口显示图片
							API_ActorSendMsg(ActorID,12,'您培养的怪兽露出了笑脸。')
						--API_ActorSendMsg(ActorID,17,'您培养的怪兽露出了笑脸。')
						end
						API_VarDataSetNumber(ActorID,1,7631,1) 
					else
						--错误的处理
						if API_GetMonsterID(chongwuFID) > 0 then
							--API_SendMonsterMsg(chongwuFID,ActorID,'这次吃错了，#24。')--等程序接口显示图片
							--API_ActorSendMsg(ActorID,12,'您培养的怪兽有些不愉快。')
						end
						--API_ActorSendMsg(ActorID,17,'您培养的怪兽有些不愉快。')
						API_VarDataSetNumber(ActorID,1,7629,0)
						API_VarDataSetNumber(ActorID,1,7631,0)
						API_VarDataSetNumber(ActorID,1,7632,0)				
						API_VarDataSetNumber(ActorID,1,7630,0)
					end
					return
				elseif xuqiu2 == 1 then
					if wupinid == xuqiu3 then
						--对的处理
						local jiazhi = 0
						if LiXingHuoDong2_siliao_table[ResGoodsID] ~= nil then
							jiazhi = 70 --获取饲料的 增加值
						end				
						local ResGoodsID = 0 
						LiXingHuoDong2_siliaoadd_jisuan(ActorID,jiazhi,0,ResGoodsID)
						if API_GetMonsterID(chongwuFID) > 0 then
							API_SendMonsterMsg(chongwuFID,ActorID,'全吃对了！#48')--等程序接口显示图片
							API_ActorSendMsg(ActorID,12,'您培养的怪兽露出了笑脸。')
						end
						--API_ActorSendMsg(ActorID,17,'您培养的怪兽露出了笑脸。')
						local LaiYuan = API_ActorGetPropNum(ActorID,201)
						local Type = 55
						if GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] + 1
						end						
					else
						--错误的处理
						if API_GetMonsterID(chongwuFID) > 0 then
							--API_SendMonsterMsg(chongwuFID,ActorID,'这次吃错了，#24')--等程序接口显示图片
							--API_ActorSendMsg(ActorID,12,'您培养的怪兽有些不愉快。')
						end
						--API_ActorSendMsg(ActorID,17,'您培养的怪兽有些不愉快。')
					end
					API_VarDataSetNumber(ActorID,1,7629,0)
					API_VarDataSetNumber(ActorID,1,7631,0)
					API_VarDataSetNumber(ActorID,1,7632,0)				
					API_VarDataSetNumber(ActorID,1,7630,0)
					return
				end
			end
		end
	end
end
function LiXingHuoDong2_teshushijianshijianhuidiao(ActorID,TaskID)
	local TimerTriggerID = API_VarDataGetNumber(ActorID,1,7634)
	if TimerTriggerID <= 0 then
		return	
	end
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local leixing = API_VarDataGetNumber(ActorID,1,7630)
	local xuqiu1 = API_VarDataGetNumber(ActorID,1,7629)
	local chongwuFID = API_VarDataGetNumber(ActorID,1,7623)
	if leixing == 0 and xuqiu1 == 0 then
	else
		if leixing == 1 or leixing == 3 or leixing == 4 or leixing == 7 then
			if API_GetMonsterID(chongwuFID) > 0 then
				API_SendMonsterMsg(chongwuFID,ActorID,'没吃到喜欢吃的，#24')
				API_ActorSendMsg(ActorID,12,'您培养的怪兽有些不愉快。')
			end
			--API_ActorSendMsg(ActorID,17,'您培养的怪兽有些不愉快。')
		end
		if leixing == 2 or leixing == 5 or leixing == 6 then
			if API_GetMonsterID(chongwuFID) > 0 then
				API_SendMonsterMsg(chongwuFID,ActorID,'没吃到不想吃的#48')
				API_ActorSendMsg(ActorID,12,'您培养的怪兽露出了笑脸。')
			end
			--API_ActorSendMsg(ActorID,17,'您培养的怪兽露出了笑脸。')
			local ResGoodsID = 0 
			LiXingHuoDong2_siliaoadd_jisuan(ActorID,10,0,ResGoodsID) --给个固定值
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type = 55
			if GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = 1
			else
				GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[13][Type][LaiYuan] + 1
			end
		end
		API_VarDataSetNumber(ActorID,1,7629,0)
		API_VarDataSetNumber(ActorID,1,7631,0)
		API_VarDataSetNumber(ActorID,1,7632,0)				
		API_VarDataSetNumber(ActorID,1,7630,0)
	end
	local huidiaotime = math.random(table.getn(LiXingHuoDong2_suijishijian_timetable))
	huidiaotime = LiXingHuoDong2_suijishijian_timetable[huidiaotime]
	local newTimerTrigger = API_CreateTimerTrigger(ActorID,huidiaotime,1,-1,'LiXingHuoDong2_suijishijian2')
	API_VarDataSetNumber(ActorID,1,7634,newTimerTrigger)
	API_DestroyTrigger(ActorID,-1,TimerTriggerID)
end
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'LiXingHuoDong2_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'LiXingHuoDong2_OnLogin') 
end

local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'LiXingHuoDong2_OnLoginMap' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'LiXingHuoDong2_OnLoginMap') 
end
local OnLogoutLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLogoutFuncNameList) do 
	if GLOBAL_ActMain_OnLogoutFuncNameList[i] == 'LiXingHuoDong2_OnLogout' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLogoutLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLogoutFuncNameList,'LiXingHuoDong2_OnLogout') 
end
local OnLogoutMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLogoutMapFuncNameList) do 
	if GLOBAL_ActMain_OnLogoutMapFuncNameList[i] == 'LiXingHuoDong2_OnLogoutMap' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLogoutMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLogoutMapFuncNameList,'LiXingHuoDong2_OnLogoutMap') 
end
function LiXingHuoDong2_MapPoint(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	if MapConfigID == 104 then
		API_ActorAddMapPoint(ActorID,1,MapID,440,293,3,'饲养员')
		API_ActorAddMapPoint(ActorID,2,MapID,433,585,3,'饲养员')
		API_ActorAddMapPoint(ActorID,3,MapID,439,431,3,'饲养员')
	end
end
function LiXingHuoDong2_taskzhuizong(ActorID)
	local MID = API_VarDataGetNumber(ActorID,1,7622)
	local jieduan = API_VarDataGetNumber(ActorID,1,7627)
	local xihuan = 0
	local zuixihuan = 0
	local taoyan = 0
	local chengzhangzhiMAX = 0
	local wupinID = 0
	if LiXingHuoDong2_chongwuwupintable[MID] ~= nil then
		wupinID  = LiXingHuoDong2_chongwuwupintable[MID]
	else
		API_ActorSendMsg(ActorID,0,'采集时发生错误，请与GM取得联系。')
		API_ActorSendMsg(ActorID,7,'采集时发生错误，请与GM取得联系。')
		return
	end
	if LiXingHuoDong2_chongwutable2[MID][jieduan] ~= nil then
		xihuan = LiXingHuoDong2_chongwutable2[MID][jieduan].xihuan
		zuixihuan = LiXingHuoDong2_chongwutable2[MID][jieduan].zuixihuan
		taoyan = LiXingHuoDong2_chongwutable2[MID][jieduan].taoyan
	end
	local chengzhangzhi,chanwuzhi,suozaibeibao,weizhi = LingHunShi_linghunzhuweizhichaxun(ActorID,wupinID)
	if LiXingHuoDong2_chongwutable2[MID][jieduan] ~= nil then
		chengzhangzhiMAX = LiXingHuoDong2_chongwutable2[MID][jieduan].chengzhangMAX  --最大成长值
	end
	local jiangli = LiXingHuoDong2_jiangli[MID][jieduan]
	local jiangli2 = 0
	if jieduan < 5 then
		jieduan2 = jieduan + 1
		jiangli2 = LiXingHuoDong2_jiangli[MID][jieduan2]
	end
	if jiangli2 > 0 then
		API_UpdateTaskLeadEx(ActorID,943,0,1,'成长情况,当前成长为：'..chengzhangzhi..'/'..chengzhangzhiMAX..',,当前阶段可兑换,    '..jiangli..'经验,下次进化后可兑换,    '..jiangli2..'经验,,怪兽喜好,喜欢：'..API_GetGoodsName(xihuan)..',最喜欢：'..API_GetGoodsName(zuixihuan)..',讨厌：'..API_GetGoodsName(taoyan)..'')
	else
		API_UpdateTaskLeadEx(ActorID,943,0,1,'成长情况,当前成长为：已达最大进化,,已达最大进化次数可兑换'..jiangli..'经验,,怪兽喜好,喜欢：'..API_GetGoodsName(xihuan)..',最喜欢：'..API_GetGoodsName(zuixihuan)..',讨厌：'..API_GetGoodsName(taoyan)..'')
	end
end
function LiXingHuoDong2_taskzhuizong2(ActorID)
	LiXingHuoDong2_taskzhuizong(ActorID)
end
--宠物系统用函数
--经验增加
function chongwuxitongjingyanzengjia(ActorID,jingyan,dangci)
	local chongwulevel = API_GetActorConjedPetLevel(ActorID)
	local beilv = 0
	if chongwulevel > -1 then
		beilv = 0.6
		if dangci == 2 then
			if chongwulevel <= 10 then
				beilv = 0.3
			end
		elseif dangci == 3 then
			if chongwulevel <= 10 then
				beilv = 0.06
			elseif chongwulevel <= 25 then
				beilv = 0.3
			end			
		elseif dangci == 4 then
			if chongwulevel <= 10 then
				beilv = 0.006
			elseif chongwulevel <= 25 then
				beilv = 0.06
			elseif chongwulevel <= 40 then
				beilv = 0.3			
			end	
		end
	end
	local shijiexp = jingyan * beilv
	shijiexp = PublicFun_4floor5ceil(shijiexp)
	if shijiexp < 1 then
		shijiexp = 1
	end
	API_ActorAddPetExp(ActorID,shijiexp,943,'怪兽进化')
end
function LiXingHuoDong2_mostersiwangsiliaochuangjian(Param1,Param2,CType,CreatureID,KillerType,KillerID,MonsterID,MapID,PosX,PosY)
	local TriggerID = API_GetCurTriggerID()
	local runxu = 0
	if KillerType == 0 or KillerType == 1 then
		if CType == 0 then
			if MonsterID == 726177 then
				runxu = 1
			end
		end
	end
	if runxu == 1 then
		local siliaolevel = 0
		local suiji = math.random(10000)	
		if suiji <= 6983 then
			siliaolevel = 1
		elseif suiji > 6983 and suiji <= 8923 then
			siliaolevel = 2
		elseif suiji > 8923 then
			siliaolevel = 3
		end
		local kuangID = math.random(table.getn(LiXingHuoDong2_siliao_table4[siliaolevel]))	
		local siliaoID = LiXingHuoDong2_siliao_table4[siliaolevel][kuangID]
		API_CreateResBoxEx_UID(MapID,PosX,PosY,siliaoID,1,'例行活动2',1,4,KillerID,15,180)	
	end
	API_DestroyTriggerG(TriggerID)
end
function LiXingHuoDong2_wenbenkuangtishi(ActorID,zhuangtai,danid)	
	local Camp = API_GetActorCamp(ActorID)
	local MID = API_VarDataGetNumber(ActorID,1,7622)
	local jieduan = API_VarDataGetNumber(ActorID,1,7627)
	local playLevel = API_GetActorPeerageLevel(ActorID)
	
	if MID == 0 then
		local xuhao = math.random(table.getn(LiXingHuoDong2_chongwutable[playLevel]))
		MID  = LiXingHuoDong2_chongwutable[playLevel][xuhao]
	end
	local bianliangweizhi = ''
	if Camp == 0 then
		bianliangweizhi = '</text><a mapid="104" x="433" y="585" underline="1">‘'..API_GetMonsterNameByID(11931)..'’</a><text>'
	elseif Camp == 1 then
		bianliangweizhi = '</text><a mapid="104" x="440" y="293" underline="1">‘'..API_GetMonsterNameByID(11931)..'’</a><text>'
	end	
	API_ResponseWrite('<win rect="80,150,400,200" move="1"></win>')
	API_ResponseWrite('<name>怪兽进化</name>')
	if zhuangtai == 1 then		
		API_ResponseWrite('<text>     怪兽进化了!</text><br>')
		local jiangli = LiXingHuoDong2_jiangli[MID][jieduan]
		local jieduan2 = jieduan + 1
		local jiangli2 = LiXingHuoDong2_jiangli[MID][jieduan2]
		if jieduan < 5 then			
			API_ResponseWrite('<text>现在去'..bianliangweizhi..'处用怪兽可换取</text><img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text Size="20" color="251,251,0">×'..jiangli..'</text><text>（继续进化，下1级怪兽可换取</text><img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text Size="20" color="251,251,0">×'..jiangli2..'</text><text>）</text><br><br>')
		else			
			API_ResponseWrite('<text>现在去'..bianliangweizhi..'处用怪兽可换取</text><img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text Size="20" color="251,251,0">×'..jiangli..'</text><br>')
		end
		--API_ResponseWrite('<text>怪兽可以生</text><img srcgd="80642" tipgd="80642"><text>,</text><img srcgd="80642" tipgd="80642"><text>可兑换</text><img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>和</text><img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><br>')	
		API_ResponseWrite('<br><a>我知道了</a><br>')
	API_ResponseFlush(ActorID)	
	end
	if zhuangtai == 2 then	
		local jiangli2 = LiXingHuoDong2_jiangli[MID][5]
		API_ResponseWrite('<text>现在去'..bianliangweizhi..'处领取怪兽，进化到4次后，</text><br>')
		API_ResponseWrite('<text>可换取</text><img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text Size="20" color="251,251,0">×'..jiangli2..'</text><br><br>')
		API_ResponseWrite('<text>怪兽进化后，可以生</text><img srcgd="80642" tipgd="80642"><text>。</text><text>蛋可兑换</text><img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>和</text><img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><br>')	
		API_ResponseWrite('<br><a>我知道了</a><br>')
	API_ResponseFlush(ActorID)	
	end
	if zhuangtai == 3 then	
		local jiangli = LiXingHuoDong2_jiangli[MID][jieduan]
		if jiangli == nil then
			return
		end
		API_ResponseWrite('<text>     活动结束</text><br>')
		API_ResponseWrite('<text>去'..bianliangweizhi..'处用怪兽</text>')
		API_ResponseWrite('<text>可换取</text><img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text Size="20" color="251,251,0">×'..jiangli..'</text><br><br>')
		API_ResponseWrite('<img srcgd="80642" tipgd="80642"><text>可兑换</text><img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>和</text><img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><br>')	
		API_ResponseWrite('<br><a>我知道了</a><br>')
	API_ResponseFlush(ActorID)	
	end
	if zhuangtai == 4 then	
		local jiangli = LiXingHuoDong2_jiangli[MID][jieduan]
		if jiangli == nil then
			return
		end			
		if danid > 0 then
			API_ResponseWrite('<win rect="80,150,300,200" move="1"></win>')
			API_ResponseWrite('<name>怪兽进化</name>')
			API_ResponseWrite('<text>     生蛋了！</text><br>')
			API_ResponseWrite('<text>您的怪兽生下了一颗</text><img srcgd="'..danid..'" tipgd="'..danid..'" ><br><br>')
			API_ResponseWrite('<img srcgd="'..danid..'" tipgd="'..danid..'"><text>可兑换</text><img srcgd="'..constExpGoodsID..'" tipgd="'..constExpGoodsID..'" ><text>和</text><img srcgd="'..constMoneryGoodsID..'" tipgd="'..constMoneryGoodsID..'" ><br>')	
			API_ResponseWrite('<text>60秒内不采集蛋，蛋将失去保护状态，其他玩家将可以采集它。</text><br>')
			API_ResponseWrite('<br><a>我知道了</a><br>')
			API_ResponseFlush(ActorID)	
		end	
	end
end
function ShuangziZidao_kuadaochuansong(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	local CAMPID = API_MonsterGetPropNum(FastID,PD_PROP_CAMPID)
	local ActorServerID = API_GetServerID()
	local ActorCamp = API_GetActorCamp(ActorID)
	local mapname = ''
	local mapname2 = ''
	local ActorServerID2 = 0
	if CAMPID == ActorCamp then
		if ActorServerID == 1 then
			mapname = '(一号线)'
			mapname2 = '(二号线)'
			ActorServerID2 = 7
		elseif ActorServerID == 7 then
			mapname = '(二号线)'
			mapname2 = '(一号线)'
			ActorServerID2 = 6
		end
		local SelectItem = API_RequestGetNumber(1)
		if SelectItem ~= 1 then
			API_ResponseWrite('<name>双子岛换线</name>')
			API_ResponseWrite('<text>您目前的位置是双子岛'..mapname..'</text><br><br><br>')
			API_ResponseWrite('<a href="ShuangziZidao_kuadaochuansong?1=1">前往 ——双子岛'..mapname2..'</a><br><br>')
			API_ResponseWrite('<br><a>关闭</a><br>')
		elseif SelectItem == 1 then
			if CAMPID == 1 then
				x = 439
				y = 229
			end
			if CAMPID == 0 then
				x = 430
				y = 677
			end
			API_ActorGoToMapEx(ActorID,ActorServerID2,104,x,y)
		end
	else
		local CAMPname = ''
		if CAMPID == 1 then
			CAMPname = '联邦'
		end
		if CAMPID == 0 then
			CAMPname = '帝国'
		end
		API_ResponseWrite('<name>双子岛换线</name>')
		API_ResponseWrite('<text>只有'..CAMPname..'成员可以使用此服务。</text><br>')
		API_ResponseWrite('<br><a>我知道了</a><br>')
	end
end