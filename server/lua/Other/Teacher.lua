--师徒系统
--制作人：林瑞宇
--2009.5.25

--12055


--NPC点击部分
function teacher_NPCdianji(ActorID)
	API_WindowOnEventII(ActorID,611,256,1,0)
	API_ResponseEnd()
	API_ResponseClear()
end


----------------------------------------------------------------------------------------------------------------------------------教导积分部分

--教导积分的设定
--徒弟为师傅增加 教导积分时 增加的多少和上限 取决于徒弟的等级
--增加教导积分 需要的参数 徒弟ID 徒弟爵位等级（或EXP等级）

--回调时间
--徒弟升级时@#@#@#@#@#@#@
--进出浮空岛时@#@#@#@#@#  --奖励部分

--教导积分最大值表
teacher_jiaodaojifentable = {
[1]={levelup=4,lajujiadaojifen=2,fangshoujiadaojifen=2,tafangjiadaojifen=2,xunlianyingjiadaojifen=1,duoqijiadaojifen=2,maxjiaodao=1902,jianglibeishu=0.02,meirilingqushangxian=370,biyejingyan=2866,shifukefenpeiexp=2880,meirilingqushangxian=720,},
[2]={levelup=4,lajujiadaojifen=3,fangshoujiadaojifen=3,tafangjiadaojifen=3,xunlianyingjiadaojifen=1,duoqijiadaojifen=3,maxjiaodao=1902,jianglibeishu=0.02,meirilingqushangxian=472,biyejingyan=3844,shifukefenpeiexp=3840,meirilingqushangxian=960,},
[3]={levelup=6,lajujiadaojifen=3,fangshoujiadaojifen=3,tafangjiadaojifen=3,xunlianyingjiadaojifen=1,duoqijiadaojifen=3,maxjiaodao=1902,jianglibeishu=0.03,meirilingqushangxian=606,biyejingyan=4788,shifukefenpeiexp=4800,meirilingqushangxian=1200,},
[4]={levelup=6,lajujiadaojifen=3,fangshoujiadaojifen=3,tafangjiadaojifen=3,xunlianyingjiadaojifen=1,duoqijiadaojifen=3,maxjiaodao=1902,jianglibeishu=0.03,meirilingqushangxian=708,biyejingyan=5766,shifukefenpeiexp=5760,meirilingqushangxian=1440,},
[5]={levelup=6,lajujiadaojifen=3,fangshoujiadaojifen=3,tafangjiadaojifen=3,xunlianyingjiadaojifen=1,duoqijiadaojifen=3,maxjiaodao=1902,jianglibeishu=0.04,meirilingqushangxian=843,biyejingyan=6710,shifukefenpeiexp=6720,meirilingqushangxian=1680,},
[6]={levelup=8,lajujiadaojifen=3,fangshoujiadaojifen=3,tafangjiadaojifen=3,xunlianyingjiadaojifen=1,duoqijiadaojifen=3,maxjiaodao=1902,jianglibeishu=0.04,meirilingqushangxian=944,biyejingyan=7688,shifukefenpeiexp=7680,meirilingqushangxian=1920,},
[7]={levelup=8,lajujiadaojifen=4,fangshoujiadaojifen=4,tafangjiadaojifen=4,xunlianyingjiadaojifen=1,duoqijiadaojifen=4,maxjiaodao=1902,jianglibeishu=0.05,meirilingqushangxian=1079,biyejingyan=8632,shifukefenpeiexp=8640,meirilingqushangxian=2160,},
[8]={levelup=10,lajujiadaojifen=4,fangshoujiadaojifen=4,tafangjiadaojifen=4,xunlianyingjiadaojifen=1,duoqijiadaojifen=4,maxjiaodao=1902,jianglibeishu=0.05,meirilingqushangxian=1213,biyejingyan=9610,shifukefenpeiexp=9600,meirilingqushangxian=2400,},
[9]={levelup=10,lajujiadaojifen=4,fangshoujiadaojifen=4,tafangjiadaojifen=4,xunlianyingjiadaojifen=1,duoqijiadaojifen=4,maxjiaodao=1902,jianglibeishu=0.06,meirilingqushangxian=1315,biyejingyan=10554,shifukefenpeiexp=10560,meirilingqushangxian=2640,},
[10]={levelup=12,lajujiadaojifen=4,fangshoujiadaojifen=4,tafangjiadaojifen=4,xunlianyingjiadaojifen=1,duoqijiadaojifen=4,maxjiaodao=1902,jianglibeishu=0.06,meirilingqushangxian=1449,biyejingyan=11532,shifukefenpeiexp=11520,meirilingqushangxian=2880,},
[11]={levelup=14,lajujiadaojifen=5,fangshoujiadaojifen=5,tafangjiadaojifen=5,xunlianyingjiadaojifen=1,duoqijiadaojifen=5,maxjiaodao=3372,jianglibeishu=0.08,meirilingqushangxian=1787,biyejingyan=14398,shifukefenpeiexp=14400,meirilingqushangxian=3600,},
[12]={levelup=16,lajujiadaojifen=5,fangshoujiadaojifen=5,tafangjiadaojifen=5,xunlianyingjiadaojifen=1,duoqijiadaojifen=5,maxjiaodao=3372,jianglibeishu=0.09,meirilingqushangxian=2023,biyejingyan=16320,shifukefenpeiexp=16320,meirilingqushangxian=4080,},
[13]={levelup=18,lajujiadaojifen=5,fangshoujiadaojifen=5,tafangjiadaojifen=5,xunlianyingjiadaojifen=1,duoqijiadaojifen=5,maxjiaodao=3372,jianglibeishu=0.1,meirilingqushangxian=2292,biyejingyan=18242,shifukefenpeiexp=18240,meirilingqushangxian=4560,},
[14]={levelup=20,lajujiadaojifen=5,fangshoujiadaojifen=5,tafangjiadaojifen=5,xunlianyingjiadaojifen=1,duoqijiadaojifen=5,maxjiaodao=3372,jianglibeishu=0.11,meirilingqushangxian=2529,biyejingyan=20164,shifukefenpeiexp=20160,meirilingqushangxian=5040,},
[15]={levelup=22,lajujiadaojifen=5,fangshoujiadaojifen=5,tafangjiadaojifen=5,xunlianyingjiadaojifen=1,duoqijiadaojifen=5,maxjiaodao=3372,jianglibeishu=0.12,meirilingqushangxian=2765,biyejingyan=22086,shifukefenpeiexp=24000,meirilingqushangxian=5520,},
[16]={levelup=24,lajujiadaojifen=6,fangshoujiadaojifen=6,tafangjiadaojifen=6,xunlianyingjiadaojifen=1,duoqijiadaojifen=6,maxjiaodao=3372,jianglibeishu=0.13,meirilingqushangxian=3001,biyejingyan=24008,shifukefenpeiexp=25920,meirilingqushangxian=6000,},
[17]={levelup=26,lajujiadaojifen=6,fangshoujiadaojifen=6,tafangjiadaojifen=6,xunlianyingjiadaojifen=1,duoqijiadaojifen=6,maxjiaodao=3372,jianglibeishu=0.14,meirilingqushangxian=3237,biyejingyan=25930,shifukefenpeiexp=27840,meirilingqushangxian=6480,},
[18]={levelup=28,lajujiadaojifen=6,fangshoujiadaojifen=6,tafangjiadaojifen=6,xunlianyingjiadaojifen=1,duoqijiadaojifen=6,maxjiaodao=3372,jianglibeishu=0.15,meirilingqushangxian=3473,biyejingyan=27852,shifukefenpeiexp=29760,meirilingqushangxian=6960,},
[19]={levelup=30,lajujiadaojifen=7,fangshoujiadaojifen=7,tafangjiadaojifen=7,xunlianyingjiadaojifen=1,duoqijiadaojifen=7,maxjiaodao=3372,jianglibeishu=0.16,meirilingqushangxian=3709,biyejingyan=29774,shifukefenpeiexp=31680,meirilingqushangxian=7440,},
[20]={levelup=32,lajujiadaojifen=7,fangshoujiadaojifen=7,tafangjiadaojifen=7,xunlianyingjiadaojifen=1,duoqijiadaojifen=7,maxjiaodao=3372,jianglibeishu=0.17,meirilingqushangxian=3945,biyejingyan=31696,shifukefenpeiexp=37440,meirilingqushangxian=7920,},
[21]={levelup=34,lajujiadaojifen=7,fangshoujiadaojifen=7,tafangjiadaojifen=7,xunlianyingjiadaojifen=1,duoqijiadaojifen=7,maxjiaodao=3372,jianglibeishu=0.20,meirilingqushangxian=4687,biyejingyan=37429,shifukefenpeiexp=40320,meirilingqushangxian=9360,},
[22]={levelup=36,lajujiadaojifen=8,fangshoujiadaojifen=8,tafangjiadaojifen=8,xunlianyingjiadaojifen=2,duoqijiadaojifen=8,maxjiaodao=3372,jianglibeishu=0.22,meirilingqushangxian=5024,biyejingyan=40329,shifukefenpeiexp=43200,meirilingqushangxian=10080,},
[23]={levelup=38,lajujiadaojifen=8,fangshoujiadaojifen=8,tafangjiadaojifen=8,xunlianyingjiadaojifen=2,duoqijiadaojifen=8,maxjiaodao=3372,jianglibeishu=0.24,meirilingqushangxian=5395,biyejingyan=43195,shifukefenpeiexp=46080,meirilingqushangxian=10800,},
[24]={levelup=40,lajujiadaojifen=8,fangshoujiadaojifen=8,tafangjiadaojifen=8,xunlianyingjiadaojifen=2,duoqijiadaojifen=8,maxjiaodao=3372,jianglibeishu=0.27,meirilingqushangxian=5766,biyejingyan=46095,shifukefenpeiexp=48960,meirilingqushangxian=11520,},
[25]={levelup=42,lajujiadaojifen=9,fangshoujiadaojifen=9,tafangjiadaojifen=9,xunlianyingjiadaojifen=2,duoqijiadaojifen=9,maxjiaodao=3372,jianglibeishu=0.47,meirilingqushangxian=6103,biyejingyan=48961,shifukefenpeiexp=86400,meirilingqushangxian=12240,},
[26]={levelup=44,lajujiadaojifen=9,fangshoujiadaojifen=9,tafangjiadaojifen=9,xunlianyingjiadaojifen=2,duoqijiadaojifen=9,maxjiaodao=4212,jianglibeishu=0.50,meirilingqushangxian=10790,biyejingyan=86390,shifukefenpeiexp=92160,meirilingqushangxian=21600,},
[27]={levelup=46,lajujiadaojifen=9,fangshoujiadaojifen=9,tafangjiadaojifen=9,xunlianyingjiadaojifen=2,duoqijiadaojifen=9,maxjiaodao=4212,jianglibeishu=0.53,meirilingqushangxian=11532,biyejingyan=92156,shifukefenpeiexp=97920,meirilingqushangxian=23040,},
[28]={levelup=48,lajujiadaojifen=10,fangshoujiadaojifen=10,tafangjiadaojifen=10,xunlianyingjiadaojifen=2,duoqijiadaojifen=10,maxjiaodao=4212,jianglibeishu=0.57,meirilingqushangxian=12240,biyejingyan=97922,shifukefenpeiexp=103680,meirilingqushangxian=24480,},
[29]={levelup=50,lajujiadaojifen=10,fangshoujiadaojifen=10,tafangjiadaojifen=10,xunlianyingjiadaojifen=2,duoqijiadaojifen=10,maxjiaodao=4212,jianglibeishu=0.6,meirilingqushangxian=12948,biyejingyan=103689,shifukefenpeiexp=109440,meirilingqushangxian=25920,},
[30]={levelup=52,lajujiadaojifen=11,fangshoujiadaojifen=11,tafangjiadaojifen=11,xunlianyingjiadaojifen=2,duoqijiadaojifen=11,maxjiaodao=4212,jianglibeishu=0.63,meirilingqushangxian=13690,biyejingyan=109455,shifukefenpeiexp=115200,meirilingqushangxian=27360,},
[31]={levelup=54,lajujiadaojifen=11,fangshoujiadaojifen=11,tafangjiadaojifen=11,xunlianyingjiadaojifen=2,duoqijiadaojifen=11,maxjiaodao=4212,jianglibeishu=0.66,meirilingqushangxian=14398,biyejingyan=115187,shifukefenpeiexp=120960,meirilingqushangxian=28800,},
[32]={levelup=56,lajujiadaojifen=12,fangshoujiadaojifen=12,tafangjiadaojifen=12,xunlianyingjiadaojifen=2,duoqijiadaojifen=12,maxjiaodao=4212,jianglibeishu=0.69,meirilingqushangxian=15106,biyejingyan=120953,shifukefenpeiexp=126720,meirilingqushangxian=30240,},
[33]={levelup=58,lajujiadaojifen=12,fangshoujiadaojifen=12,tafangjiadaojifen=12,xunlianyingjiadaojifen=2,duoqijiadaojifen=12,maxjiaodao=4212,jianglibeishu=0.72,meirilingqushangxian=15848,biyejingyan=126719,shifukefenpeiexp=132480,meirilingqushangxian=31680,},
[34]={levelup=60,lajujiadaojifen=13,fangshoujiadaojifen=13,tafangjiadaojifen=13,xunlianyingjiadaojifen=3,duoqijiadaojifen=13,maxjiaodao=4212,jianglibeishu=0.75,meirilingqushangxian=16556,biyejingyan=132485,shifukefenpeiexp=138240,meirilingqushangxian=33120,},
[35]={levelup=62,lajujiadaojifen=13,fangshoujiadaojifen=13,tafangjiadaojifen=13,xunlianyingjiadaojifen=3,duoqijiadaojifen=13,maxjiaodao=4212,jianglibeishu=0.85,meirilingqushangxian=17264,biyejingyan=138252,shifukefenpeiexp=155520,meirilingqushangxian=34560,},
[36]={levelup=64,lajujiadaojifen=14,fangshoujiadaojifen=14,tafangjiadaojifen=14,xunlianyingjiadaojifen=3,duoqijiadaojifen=14,maxjiaodao=4212,jianglibeishu=0.89,meirilingqushangxian=19456,biyejingyan=155516,shifukefenpeiexp=162720,meirilingqushangxian=38880,},
[37]={levelup=66,lajujiadaojifen=14,fangshoujiadaojifen=14,tafangjiadaojifen=14,xunlianyingjiadaojifen=3,duoqijiadaojifen=14,maxjiaodao=4212,jianglibeishu=0.93,meirilingqushangxian=20333,biyejingyan=162732,shifukefenpeiexp=169920,meirilingqushangxian=40680,},
[38]={levelup=68,lajujiadaojifen=15,fangshoujiadaojifen=15,tafangjiadaojifen=15,xunlianyingjiadaojifen=3,duoqijiadaojifen=15,maxjiaodao=4212,jianglibeishu=0.97,meirilingqushangxian=21243,biyejingyan=169915,shifukefenpeiexp=177120,meirilingqushangxian=42480,},
[39]={levelup=70,lajujiadaojifen=15,fangshoujiadaojifen=15,tafangjiadaojifen=15,xunlianyingjiadaojifen=3,duoqijiadaojifen=15,maxjiaodao=4212,jianglibeishu=1.01,meirilingqushangxian=22154,biyejingyan=177131,shifukefenpeiexp=184320,meirilingqushangxian=44280,},
[40]={levelup=72,lajujiadaojifen=16,fangshoujiadaojifen=16,tafangjiadaojifen=16,xunlianyingjiadaojifen=3,duoqijiadaojifen=16,maxjiaodao=4212,jianglibeishu=1.12,meirilingqushangxian=23030,biyejingyan=184313,shifukefenpeiexp=205920,meirilingqushangxian=46080,},
[41]={levelup=74,lajujiadaojifen=16,fangshoujiadaojifen=16,tafangjiadaojifen=16,xunlianyingjiadaojifen=3,duoqijiadaojifen=16,maxjiaodao=5502,jianglibeishu=1.17,meirilingqushangxian=25728,biyejingyan=205928,shifukefenpeiexp=214560,meirilingqushangxian=51480,},
[42]={levelup=76,lajujiadaojifen=17,fangshoujiadaojifen=17,tafangjiadaojifen=17,xunlianyingjiadaojifen=3,duoqijiadaojifen=17,maxjiaodao=5502,jianglibeishu=1.22,meirilingqushangxian=26807,biyejingyan=214560,shifukefenpeiexp=223200,meirilingqushangxian=53640,},
[43]={levelup=78,lajujiadaojifen=17,fangshoujiadaojifen=17,tafangjiadaojifen=17,xunlianyingjiadaojifen=3,duoqijiadaojifen=17,maxjiaodao=5502,jianglibeishu=1.26,meirilingqushangxian=27886,biyejingyan=223192,shifukefenpeiexp=231840,meirilingqushangxian=55800,},
[44]={levelup=80,lajujiadaojifen=18,fangshoujiadaojifen=18,tafangjiadaojifen=18,xunlianyingjiadaojifen=4,duoqijiadaojifen=18,maxjiaodao=5502,jianglibeishu=1.31,meirilingqushangxian=28965,biyejingyan=231825,shifukefenpeiexp=240480,meirilingqushangxian=57960,},
[45]={levelup=82,lajujiadaojifen=18,fangshoujiadaojifen=18,tafangjiadaojifen=18,xunlianyingjiadaojifen=4,duoqijiadaojifen=18,maxjiaodao=5502,jianglibeishu=1.36,meirilingqushangxian=30044,biyejingyan=240491,shifukefenpeiexp=249120,meirilingqushangxian=60120,},
[46]={levelup=84,lajujiadaojifen=19,fangshoujiadaojifen=19,tafangjiadaojifen=19,xunlianyingjiadaojifen=4,duoqijiadaojifen=19,maxjiaodao=5502,jianglibeishu=1.41,meirilingqushangxian=31123,biyejingyan=249123,shifukefenpeiexp=257760,meirilingqushangxian=62280,},
[47]={levelup=86,lajujiadaojifen=19,fangshoujiadaojifen=19,tafangjiadaojifen=19,xunlianyingjiadaojifen=4,duoqijiadaojifen=19,maxjiaodao=5502,jianglibeishu=1.45,meirilingqushangxian=32236,biyejingyan=257755,shifukefenpeiexp=266400,meirilingqushangxian=64440,},
[48]={levelup=88,lajujiadaojifen=20,fangshoujiadaojifen=20,tafangjiadaojifen=20,xunlianyingjiadaojifen=4,duoqijiadaojifen=20,maxjiaodao=5502,jianglibeishu=1.5,meirilingqushangxian=33315,biyejingyan=266388,shifukefenpeiexp=275040,meirilingqushangxian=66600,},
[49]={levelup=90,lajujiadaojifen=20,fangshoujiadaojifen=20,tafangjiadaojifen=20,xunlianyingjiadaojifen=4,duoqijiadaojifen=20,maxjiaodao=5502,jianglibeishu=1.55,meirilingqushangxian=34394,biyejingyan=275054,shifukefenpeiexp=283680,meirilingqushangxian=68760,},
[50]={levelup=92,lajujiadaojifen=21,fangshoujiadaojifen=21,tafangjiadaojifen=21,xunlianyingjiadaojifen=4,duoqijiadaojifen=21,maxjiaodao=5502,jianglibeishu=1.55,meirilingqushangxian=35473,biyejingyan=283686,shifukefenpeiexp=283680,meirilingqushangxian=70920,},
[51]={levelup=94,lajujiadaojifen=21,fangshoujiadaojifen=21,tafangjiadaojifen=21,xunlianyingjiadaojifen=4,duoqijiadaojifen=21,maxjiaodao=5502,jianglibeishu=1.55,meirilingqushangxian=35473,biyejingyan=283686,shifukefenpeiexp=283680,meirilingqushangxian=70920,},
[52]={levelup=96,lajujiadaojifen=22,fangshoujiadaojifen=22,tafangjiadaojifen=22,xunlianyingjiadaojifen=4,duoqijiadaojifen=22,maxjiaodao=5502,jianglibeishu=1.55,meirilingqushangxian=35473,biyejingyan=283686,shifukefenpeiexp=283680,meirilingqushangxian=70920,},
[53]={levelup=98,lajujiadaojifen=22,fangshoujiadaojifen=22,tafangjiadaojifen=22,xunlianyingjiadaojifen=4,duoqijiadaojifen=22,maxjiaodao=5502,jianglibeishu=1.55,meirilingqushangxian=35473,biyejingyan=283686,shifukefenpeiexp=283680,meirilingqushangxian=70920,},
[54]={levelup=100,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=4,duoqijiadaojifen=23,maxjiaodao=5502,jianglibeishu=1.55,meirilingqushangxian=35473,biyejingyan=283686,shifukefenpeiexp=283680,meirilingqushangxian=70920,},
[55]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=4,duoqijiadaojifen=23,maxjiaodao=5502,jianglibeishu=1.66,meirilingqushangxian=35473,biyejingyan=283686,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[56]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=4,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=1.71,meirilingqushangxian=38002,biyejingyan=304086,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[57]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=4,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=1.76,meirilingqushangxian=39148,biyejingyan=313326,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[58]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=1.81,meirilingqushangxian=40329,biyejingyan=322565,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[59]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=1.86,meirilingqushangxian=41475,biyejingyan=331737,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[60]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=1.91,meirilingqushangxian=42622,biyejingyan=340976,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[61]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.01,meirilingqushangxian=43768,biyejingyan=350148,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[62]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.06,meirilingqushangxian=44915,biyejingyan=359387,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[63]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.11,meirilingqushangxian=46095,biyejingyan=368627,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[64]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.26,meirilingqushangxian=47241,biyejingyan=377832,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[65]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.32,meirilingqushangxian=48388,biyejingyan=387071,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[66]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.37,meirilingqushangxian=51827,biyejingyan=414722,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[67]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.43,meirilingqushangxian=53142,biyejingyan=425040,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[68]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.49,meirilingqushangxian=54424,biyejingyan=435426,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[69]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.66,meirilingqushangxian=55739,biyejingyan=445812,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[70]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.72,meirilingqushangxian=57020,biyejingyan=456164,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[71]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.78,meirilingqushangxian=60898,biyejingyan=487254,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[72]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.85,meirilingqushangxian=62348,biyejingyan=498786,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[73]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.91,meirilingqushangxian=63798,biyejingyan=510284,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[74]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=2.97,meirilingqushangxian=65214,biyejingyan=521817,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[75]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=3.03,meirilingqushangxian=66664,biyejingyan=533349,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[76]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=3.10,meirilingqushangxian=68114,biyejingyan=544847,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[77]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=3.16,meirilingqushangxian=69564,biyejingyan=556380,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[78]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=3.22,meirilingqushangxian=70980,biyejingyan=567912,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[79]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=3.41,meirilingqushangxian=72430,biyejingyan=579410,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[80]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=3.48,meirilingqushangxian=73880,biyejingyan=590943,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[81]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=3.55,meirilingqushangxian=78196,biyejingyan=625506,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[82]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=3.62,meirilingqushangxian=79781,biyejingyan=638151,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[83]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=3.69,meirilingqushangxian=81366,biyejingyan=650863,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[84]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=3.69,meirilingqushangxian=82951,biyejingyan=663542,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
[85]={levelup=102,lajujiadaojifen=23,fangshoujiadaojifen=23,tafangjiadaojifen=23,xunlianyingjiadaojifen=23,duoqijiadaojifen=23,maxjiaodao=5604,jianglibeishu=3.69,meirilingqushangxian=84536,biyejingyan=676187,shifukefenpeiexp=304080,meirilingqushangxian=70920,},
}
teacher_jiaodaojifendangciduihuantable = {
	[1] = {jianglijiacheng=0.5,shuxingjiacheng=4,},
	[2] = {jianglijiacheng=1,shuxingjiacheng=6,},
	[3] = {jianglijiacheng=1.5,shuxingjiacheng=8,},
	[4] = {jianglijiacheng=2,shuxingjiacheng=10,},
	[5] = {jianglijiacheng=2.5,shuxingjiacheng=12,},
	[6] = {jianglijiacheng=3,shuxingjiacheng=14,},
	[7] = {jianglijiacheng=3.5,shuxingjiacheng=16,},
	[8] = {jianglijiacheng=4,shuxingjiacheng=18,},
	[9] = {jianglijiacheng=4.5,shuxingjiacheng=20,},
	[10] = {jianglijiacheng=4.8,shuxingjiacheng=22,},
	[11] = {jianglijiacheng=5,shuxingjiacheng=25,},
}

--判断是否有师傅
--如果有师傅那么进入积分添加回调
function teacher_jiaodaojifenpanding(tudiID) --升级时的回调
--API_Trace('进入升级师徒回调')	
	local shifuid = API_GetAcotrMasterID(tudiID) --获取师傅ID
--API_Trace('师傅ID='..shifuid)		
	if shifuid > 0 then	
		teacher_jiaodaojifenadd(tudiID,1)
--API_Trace('进入积分增加')	
		--teacher_shifujiangyanadd(tudiID,shifuid)
	else
		if API_GetActorExpLevel(tudiID) == 3 then
			teacher_xinshouliuchengjieshu2(tudiID)
		end
	end
end
--添加积分时回调
function teacher_jiaodaojifenadd(ActorID,zhuangtai,zhanchang) --徒弟
--API_Trace('执行积分增加')
	local level = API_GetActorExpLevel(ActorID)
	local maxjiaodaojifen = 0
	if teacher_jiaodaojifentable[level] ~= nil then
		maxjiaodaojifen = teacher_jiaodaojifentable[level].maxjiaodao
	end
	if maxjiaodaojifen > 0 then
--API_Trace('maxjiaodaojifen='..maxjiaodaojifen)	
		local shijijiaodaojifen = API_GetContribution(ActorID) --API获取师傅实际教导积分(ActorID)
--API_Trace('shijijiaodaojifen='..shijijiaodaojifen)			
		if maxjiaodaojifen <= shijijiaodaojifen then
			return
		end
		local jiadaojifenadd = 0
--API_Trace('zhuangtai='..zhuangtai)		
		if zhuangtai == 1 then
			jiadaojifenadd = teacher_jiaodaojifentable[level].levelup
--API_Trace('jiadaojifenadd='..jiadaojifenadd)				
		elseif zhuangtai == 2 then
--API_Trace('状态='..zhuangtai)		
			--浮空岛添加积分 在这里
			
			--通过MAPID取 浮空岛 进入表 取增加的教导积分
			--衰减倍率判断
			local ShuaiJianBeiLv = API_VarDataGetNumber(ActorID,1,18360)
--API_Trace('衰减='..ShuaiJianBeiLv)			
			if ShuaiJianBeiLv > 0 then
				return
			end
			if zhanchang == 1 then
				jiadaojifenadd = teacher_jiaodaojifentable[level].lajujiadaojifen
--API_Trace('jajujiadaojifenadd='..jiadaojifenadd)				
			elseif zhanchang == 2 then
				jiadaojifenadd = teacher_jiaodaojifentable[level].fangshoujiadaojifen
			elseif zhanchang == 3 then
				jiadaojifenadd = teacher_jiaodaojifentable[level].tafangjiadaojifen
			elseif zhanchang == 4 then
				jiadaojifenadd = teacher_jiaodaojifentable[level].xunlianyingjiadaojifen
			elseif zhanchang == 5 then
				jiadaojifenadd = teacher_jiaodaojifentable[level].duoqijiadaojifen
			end
			API_VarDataSetNumber(ActorID,1,12139,jiadaojifenadd)
			jiadaojifenadd = 0
		elseif zhuangtai == 3 then
			jiadaojifenadd = zhanchang
		end	
--API_Trace('教导积分增加1='..jiadaojifenadd)		
		if shijijiaodaojifen >= 9999 then
			jiadaojifenadd = 0
		end
		if jiadaojifenadd > 0 then
			if shijijiaodaojifen + jiadaojifenadd >= maxjiaodaojifen then
				jiadaojifenadd = maxjiaodaojifen - shijijiaodaojifen
			end
			local shifuid = API_GetAcotrMasterID(ActorID) --API获取师傅ID(tudiID)
			if shifuid <= 0 then
				return
			end
			API_AddContribution(ActorID,jiadaojifenadd) --API添加师傅的教导积分(ActorID,jiadaojifenadd)
--API_Trace('教导积分增加2=')				
			if API_GetContribution(ActorID) >= 3372 then --API获取师傅实际教导积分(ActorID)
				if API_VarDataGetNumber(ActorID,1,12072) == 0 then
					teacher_biyehuidiao(ActorID,shifuid) --毕业回调
				end
			end
			local shifuname = ''
			if API_ActorIsOnline(shifuid) then
				shifuname = '"'..API_GetActorName(shifuid)..'"间'	
			end
			local tudiname = API_GetActorName(ActorID)
			local shijijiaodaojifen2 = shijijiaodaojifen + jiadaojifenadd --API获取师傅实际教导积分(ActorID)
			if zhuangtai == 1 then
--API_Trace('师徒输出=')			
				API_ResponseWrite('<name>教导积分增加</name>')
				API_ResponseWrite('<text>等级提升,您与您的导师'..shifuname..'的教导积分,增加'..jiadaojifenadd..'点。</text>')
				API_ResponseWrite('<text>当前教导积分为'..shijijiaodaojifen2..'点。</text>')
				API_ResponseFlush(ActorID)	
				API_ActorSendMsg(ActorID,7,'等级提升,您与您的导师'..shifuname..'的教导积分,增加'..jiadaojifenadd..'点。')				
				if API_ActorIsOnline(shifuid) then
					API_ActorSendMsg(shifuid,1,'您的徒弟“'..tudiname..'”等级提升,你们间的教导积分增加'..jiadaojifenadd..'点。')
					API_ActorSendMsg(shifuid,7,'您的徒弟“'..tudiname..'”等级提升,你们间的教导积分增加'..jiadaojifenadd..'点。')	
				end	
			elseif zhuangtai == 2 or zhuangtai == 3 then
--API_Trace('师徒输出=')			
				API_ResponseWrite('<name>教导积分增加</name>')
				API_ResponseWrite('<text>您与您的导师'..shifuname..'的教导积分,增加'..jiadaojifenadd..'点。</text>')
				API_ResponseWrite('<text>当前教导积分为'..shijijiaodaojifen2..'点。</text>')
				API_ResponseFlush(ActorID)
				API_ActorSendMsg(ActorID,7,'您与您的导师'..shifuname..'的教导积分,增加'..jiadaojifenadd..'点。')
--API_Trace('师徒输出成功=')					
				if API_ActorIsOnline(shifuid) then
					API_ActorSendMsg(shifuid,1,'您与您的徒弟“'..tudiname..'”间的教导积分,增加'..jiadaojifenadd..'点。')
					API_ActorSendMsg(shifuid,7,'您与您的徒弟“'..tudiname..'”间的教导积分,增加'..jiadaojifenadd..'点。')
				end				
			end
			local TeamID = API_GetTeamID(ActorID)
			if TeamID > 0 then
				teacher_shuxingtianjia(TeamID)
			end	
		end
	end
end

--副本增加积分的处理
--出来的时候处理 谁先出来 判断里面的
--次数问题
function teacher_fubenjiaodaojifenpanduan(ActorID,zhuangtai,zhanchang)
	local TeamID = API_GetTeamID(ActorID)
	if TeamID < 1 then
		if API_VarDataGetNumber(ActorID,1,12064) > 0 then --师傅先出来了
			API_VarDataSetNumber(ActorID,1,12064,0)
			teacher_jiaodaojifenadd(ActorID,2,zhanchang)
			return
		else
			return
		end
	end
	teacher_fubenjiaodaojifen_shifupanduan(ActorID,TeamID,zhanchang)--判断师傅是否在队伍中
	local panduanshifouyoutudi = API_GetActorProtegeList(ActorID) --API判断是否有徒弟(ActorID)
	local panduanshifouyoutudibiaochang = table.getn(panduanshifouyoutudi)
	if panduanshifouyoutudibiaochang > 0 then
		teacher_fubenjiaodaojifen_tudipanduan(ActorID,TeamID,zhanchang)--判断徒弟是否在队伍中
	end
end
function teacher_fubenjiaodaojifen_shifupanduan(tudiID,TeamID,zhanchang) --徒弟先出来 判断是否有师傅
	local shifuid = API_GetAcotrMasterID(tudiID) --API获取师傅ID(tudiID)
	local MapID = API_GetActorMapID(tudiID)
	if shifuid > 0 then--有师傅
		local TeamSize = API_GetTeamSize(TeamID)
		local shifuzaifuben = 0
		for i=1,TeamSize do
			local teamActorID = API_GetTeamMem(TeamID,i)
			if teamActorID == shifuid then
				if API_ActorIsOnline(teamActorID) then
					local shifumapid = API_GetActorMapID(teamActorID)
					if shifumapid == MapID then --师傅与徒弟在同个副本
						API_VarDataSetNumber(tudiID,1,12064,0)
						teacher_jiaodaojifenadd(tudiID,2,zhanchang)
						shifuzaifuben = 1
						break
					end
				end	
			end
		end
		if shifuzaifuben == 0 then
			if API_VarDataGetNumber(tudiID,1,12064) > 0 then --师傅先出来了
				API_VarDataSetNumber(tudiID,1,12064,0)
				teacher_jiaodaojifenadd(tudiID,2,zhanchang)
			end
		end
	end
end
--徒弟出来的时候先判断是否有师傅
--如果有判断是否与自己组队 并在同一张地图上
--如果在 SHIFUZAIFUBEN = 1 交互数据设置成0
function teacher_fubenjiaodaojifen_tudipanduan(ActorID,TeamID,zhanchang) --师傅先出来
	local MapID = API_GetActorMapID(ActorID)
	local TeamSize = API_GetTeamSize(TeamID)
	for i=1,TeamSize do
		local teamActorID = API_GetTeamMem(TeamID,i)
		if API_GetRelationType(ActorID,teamActorID) == 2 then --if API判断是师徒(ActorID,teamActorID) == 1 then
			if API_ActorIsOnline(teamActorID) then
				local tudimapid = API_GetActorMapID(teamActorID)
				if tudimapid == MapID then
					API_VarDataSetNumber(teamActorID,1,12064,1) --师傅先出来时设置一个交互数据,徒弟出来时,如果师傅不在里面给师傅添加
				end
			end	
		end	
	end
end
--师傅出来 徒弟在里面 会给师傅添加1次 如果师傅再次进入同一副本 再出来还会再添加1次  为了避免此问题有以下操作
--师傅出来的时候 判断同队伍 同副本 是否有徒弟
--如果有徒弟 那么给徒弟的交互数据设置成1

-------------------------------------------------------------------------------------师傅上线设置在线徒弟 师傅等级部分
function teacher_teacherlevelchuanshu(tudiid,ActorID)
--API_Trace('进入跨岛师徒设置=')
--API_Trace('tudiid='..tudiid)
--API_Trace('shifuid='..ActorID)
	if API_GetRelationType(ActorID,tudiid) == 2 then --是师徒
		local level = API_GetActorExpLevel(ActorID)
		API_VarDataSetNumber(tudiid,1,12124,level) 
--API_Trace('设置成功='..API_VarDataGetNumber(tudiid,1,12124))			
	end
end

-------------------------------------------------------------------------------------添加属性部分
function Teacher_loadok(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local ConfigID = API_GetMapConfigID(MapID)
	local jiaodaojifenadd = API_VarDataGetNumber(ActorID,1,12139)
--API_Trace('教导积分='..jiaodaojifenadd)	
	if jiaodaojifenadd > 0 then
		teacher_jiaodaojifenadd(ActorID,3,jiaodaojifenadd)
--API_Trace('添加成功=')		
		API_VarDataSetNumber(ActorID,1,12139,0)
	end	
	if ConfigID == 1 or ConfigID == 2 then
		if API_VarDataGetNumber(ActorID,1,12130) == 0 then
			API_VarDataSetNumber(ActorID,1,12130,1)
			g_EventSystem:FireAction( ActorID, nil, _EVENT_ID_ENTER_CITY, _E_SRC_TYPE, 1 )
		end	
	end
	if ConfigID == 10 or ConfigID == 23 then
		if API_VarDataGetNumber(ActorID,1,12131) == 0 then
			API_VarDataSetNumber(ActorID,1,12131,1)
			g_EventSystem:FireAction( ActorID, MapID, _EVENT_ID_ENTER_MAP, _E_SRC_TYPE, 2 )
		end	
	end
end
--回调时间 @#@#@#@#@#@#@#@#@#@#
--进入地图时 添加
function teacher_OnLogin(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local ConfigID = API_GetMapConfigID(MapID)
	API_CreateTimerTrigger(ActorID,30,1,-1,'teacher_shifushangxianchulilevelsave')
	teacher_buffdelete(ActorID) 
	--[[local TeamID = API_GetTeamID(ActorID)
	if TeamID > 0 then
		teacher_shuxingtianjia(TeamID)
	end	--]]
end
function teacher_OnLogout(ActorID)
--API_Trace('teacher_OnLogout')
	teacher_buffdelete(ActorID) 
	local TeamID = API_GetTeamID(ActorID)
	if TeamID > 0 then
		teacher_shuxingtianjia(TeamID,ActorID)
	end
	API_DelMasterActorInfo(ActorID)
end
function teacher_shifushangxianchulilevelsave(ActorID)
	if API_ActorIsOnline(ActorID) then
		local panduanshifouyoutudi = API_GetActorProtegeList(ActorID) --API判断是否有徒弟(ActorID)
		local panduanshifouyoutudibiaochang = table.getn(panduanshifouyoutudi)
--API_Trace('徒弟表长='..panduanshifouyoutudibiaochang)	
		local shifuServerID = API_GetActorServerID(ActorID)
--API_Trace('师傅服务器ID='..shifuServerID)	
		local level = API_GetActorExpLevel(ActorID)
--API_Trace('师傅等级='..level)		
		if panduanshifouyoutudibiaochang > 0 then
			for i=1,panduanshifouyoutudibiaochang do
				local tudiid = panduanshifouyoutudi[i]
--API_Trace('徒弟ID='..tudiid)			
				local tudiServerID = API_GetActorServerID(tudiid)
--API_Trace('徒弟服务器ID='..tudiServerID)			
				if tudiServerID > 0 then
					if tudiServerID == shifuServerID then
						API_VarDataSetNumber(tudiid,1,12124,level) 
					else
						API_OpenRPC(tudiServerID,0,0,0,2,{tudiid,ActorID},'teacher_teacherlevelchuanshu')
					end
				end
			end
		end
	end	
end
function teacher_OnLoginMap(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local ConfigID = API_GetMapConfigID(MapID)
	API_CreateTimerTrigger(ActorID,30,1,-1,'teacher_shifushangxianchulilevelsave')
	if ConfigID == 1 or ConfigID == 2 then
		if API_VarDataGetNumber(ActorID,1,12130) == 0 then
			API_VarDataSetNumber(ActorID,1,12130,1)
			g_EventSystem:FireAction( ActorID, nil, _EVENT_ID_ENTER_CITY, _E_SRC_TYPE, 1 )
		end	
	end
	if ConfigID == 10 or ConfigID == 23 then
		if API_VarDataGetNumber(ActorID,1,12131) == 0 then
			API_VarDataSetNumber(ActorID,1,12131,1)
			g_EventSystem:FireAction( ActorID, MapID, _EVENT_ID_ENTER_MAP, _E_SRC_TYPE, 2 )
		end	
	end	
	teacher_buffdelete(ActorID) 
	Teacher_loadok(ActorID)
	--[[local TeamID = API_GetTeamID(ActorID)
	if TeamID > 0 then
		teacher_shuxingtianjia(TeamID)
	end	--]]
end
function teacher_OnLogoutMap(ActorID)
--API_Trace('teacher_OnLogoutMap')
	teacher_buffdelete(ActorID) 
	local TeamID = API_GetTeamID(ActorID)
	if TeamID > 0 then
		teacher_shuxingtianjia(TeamID,ActorID)
	end
end
--队伍人员增加时 添加
--离开队伍时 删除
--队员掉线时 删除
--积分增加时
function teacher_shuxingtianjia(TeamID,likaiwanjia)
--API_Trace('执行属性添加')
	--这地方好像不用判断地图ID了
	local TeamSize = API_GetTeamSize(TeamID)
--API_Trace('TeamSize='..TeamSize)	
	if TeamSize > 0 then
		for i=1,TeamSize do
			local ActorID = API_GetTeamMem(TeamID,i)
			if ActorID ~= likaiwanjia then
				if API_ActorIsOnline(ActorID) then
					teacher_buffdelete(ActorID) --删除BUFF
					local shifuid = API_GetAcotrMasterID(ActorID) --API获取师傅ID(ActorID)
					local shifujiacheng = 0
					local tudijiacheng = 0
--API_Trace('shifuid='..shifuid)					
					if shifuid > 0 then
						shifujiacheng = teacher_fubenjiaodaojifen_shifupanduan2(ActorID,TeamID,likaiwanjia)--判断师傅是否在队伍中
--API_Trace('shifujiacheng='..shifujiacheng)					
						if shifujiacheng > 0 then
							API_ActorAddStatus(ActorID,797004,0)
							if shifujiacheng == 999 then
								shifujiacheng = 0
							end
						end
					end
					local panduanshifouyoutudi = API_GetActorProtegeList(ActorID) --API判断是否有徒弟(ActorID)
					local panduanshifouyoutudibiaochang = table.getn(panduanshifouyoutudi)
--API_Trace('panduanshifouyoutudibiaochang='..panduanshifouyoutudibiaochang)					
					if panduanshifouyoutudibiaochang > 0 then
						tudijiacheng = teacher_fubenjiaodaojifen_tudipanduan2(ActorID,TeamID,likaiwanjia)--判断徒弟是否在队伍中
--API_Trace('tudijiacheng='..tudijiacheng)					
						if tudijiacheng > 0 then
							API_ActorAddStatus(ActorID,797003,0)
						end
					end
					--根据上面2个返还决定光效 大于0 就加
					local zongjiacheng = shifujiacheng + tudijiacheng
--API_Trace('zongjiacheng='..zongjiacheng)				
					--通过教导积分 进入表中 获取相应的BUFF	
					--不超过50
					if zongjiacheng > 0 then
						if zongjiacheng > 50 then
							zongjiacheng = 50
						end
						local buffid = 796000 + zongjiacheng
--API_Trace('buffid='..buffid)					
						API_ActorAddStatus(ActorID,buffid,0)
					end
				end	
			end	
		end	
	end	
end
function teacher_fubenjiaodaojifen_shifupanduan2(tudiID,TeamID,likaiwanjia)--师傅影响徒弟
	local shifuid = API_GetAcotrMasterID(tudiID) --API获取师傅ID(tudiID)
	if shifuid > 0 then
		local TeamSize = API_GetTeamSize(TeamID)
		for i=1,TeamSize do
			local teamActorID = API_GetTeamMem(TeamID,i)
			if teamActorID == shifuid then
				if teamActorID ~= likaiwanjia then
					if API_ActorIsOnline(teamActorID) then
						local shifumapid = API_GetActorMapID(shifuid)
						local tudimapid = API_GetActorMapID(tudiID)
						if tudimapid == shifumapid then				
							local buffzhi = 25
							local shifulevel = API_GetActorExpLevel(shifuid)
							local tudilevel = API_GetActorExpLevel(tudiID)		
--API_Trace('shifulevel='..shifulevel)
--API_Trace('tudilevel='..tudilevel)							
							if tudilevel - shifulevel >= 5 then
								buffzhi = 13
							end	
--API_Trace('buffzhi1='..buffzhi)								
							if tudilevel - shifulevel >= 10 then
								buffzhi = 999
							end
--API_Trace('buffzhi2='..buffzhi)								
							return buffzhi
						end	
					end	
				end	
			end
		end
	end
	return 0
end
function teacher_fubenjiaodaojifen_tudipanduan2(ActorID,TeamID,likaiwanjia)
	local TeamSize = API_GetTeamSize(TeamID)
	local tudibuffzhi = 0
	for i=1,TeamSize do
		local teamActorID = API_GetTeamMem(TeamID,i)
		if API_GetRelationType(ActorID,teamActorID) == 2 then --API判断是师徒(ActorID,teamActorID) == 1 then
			if teamActorID ~= likaiwanjia then
				if API_ActorIsOnline(teamActorID) then
					local shifumapid = API_GetActorMapID(ActorID)
					local tudimapid = API_GetActorMapID(teamActorID)
					if shifumapid == tudimapid then
						local jiaodaojifen = API_GetContribution(teamActorID) --API获取教导积分(teamActorID)
						local panding = teacher_jifendangcipanding(jiaodaojifen)
						local addshuxing = 0
						if panding > 0 then
							addshuxing = teacher_jiaodaojifendangciduihuantable[panding].shuxingjiacheng
						end
						tudibuffzhi = tudibuffzhi +addshuxing
					end
				end	
			end	
		end	
	end
	return tudibuffzhi
end
--这里有个问题 就是师傅BUFF添加时 是否按每个徒弟的 教导值进行添加@#@#@#@#@#@#@#@#

function teacher_buffdelete(ActorID)
	if API_ActorIsOnline(ActorID) then
		if API_ActorFindStatus(ActorID,796) then
			for i=1,50 do
				local buffid = 796000 + i
				API_ActorRemoveStatus(ActorID,buffid)
			end
		end
		API_ActorRemoveStatus(ActorID,797003)
		API_ActorRemoveStatus(ActorID,797004)
	end	
end

---------------------------------------------------------------------------------------奖励部分
--影响结束时奖励的倍数 同时进行积分增加
--状态说明
--1.拉锯
--2.防守
--3.塔防
--4.训练营
--5.夺旗
--6.试炼空间
function teacher_fubenjianglijiacheng(ActorID,zhuangtai,add)
--API_Trace('ActorID='..ActorID)
--API_Trace('zhuangtai='..zhuangtai)
--API_Trace('add='..add)
	if add == 1 then
--API_Trace('战场教导积分=')	
		teacher_fubenjiaodaojifenpanduan(ActorID,2,zhuangtai)
--API_Trace('战场教导积分执行完毕=')			
	end	
	local TeamID = API_GetTeamID(ActorID)
--API_Trace('TeamID='..TeamID)	
	if TeamID > 0 then
		local shifuid = API_GetAcotrMasterID(ActorID) --API获取师傅ID(ActorID)
		local shifujiacheng = 0
		local tudijiacheng = 0
--API_Trace('shifuid='..shifuid)			
		if shifuid > 0 then
			shifujiacheng = teacher_fubenjianglijiacheng_shifu(ActorID,shifuid,TeamID)--判断师傅是否在队伍中
--API_Trace('shifujiacheng='..shifujiacheng)			
		end
		local panduanshifouyoutudi = API_GetActorProtegeList(ActorID) --API判断是否有徒弟(ActorID)
		local panduanshifouyoutudibiaochang = table.getn(panduanshifouyoutudi)
--API_Trace('panduanshifouyoutudibiaochang='..panduanshifouyoutudibiaochang)			
		if panduanshifouyoutudibiaochang > 0 then
			tudijiacheng = teacher_fubenjianglijiacheng_tudi(ActorID,TeamID,zhuangtai,add)--判断徒弟是否在队伍中
--API_Trace('tudijiacheng='..tudijiacheng)		
		end
		local zongjiacheng = shifujiacheng + tudijiacheng
--API_Trace('zongjiacheng='..zongjiacheng)			
		if zongjiacheng > 10 then
			zongjiacheng = 10
		end
		return zongjiacheng
	else
		return 0
	end
end
function teacher_fubenjianglijiacheng_shifu(ActorID,shifuid,TeamID) --有师傅在队伍中,判断师傅等级,增加倍率,无次数影响
	local TeamSize = API_GetTeamSize(TeamID)
	local mapid = API_GetActorMapID(ActorID)
	for i=1,TeamSize do
		local teamActorID = API_GetTeamMem(TeamID,i)
		if teamActorID == shifuid then
			if API_ActorIsOnline(teamActorID) then
				local shifumapid = API_GetActorMapID(shifuid)
				if shifumapid == mapid then
					local shifulevel = API_GetActorExpLevel(shifuid)
					local tudilevel = API_GetActorExpLevel(ActorID)		
					local beilv = 10
					if tudilevel - shifulevel >= 5 and tudilevel - shifulevel < 10 then
--API_Trace('5级差=')					
						beilv = 5
					elseif tudilevel - shifulevel >= 10 then
						beilv = 0
					end
					return beilv
				end
			end	
		end
	end
	return 0
end
function teacher_fubenjianglijiacheng_tudi(ActorID,TeamID,zhuangtai,add) --有徒弟在队伍中,判断徒弟有效数据数量
--API_Trace('ActorID1='..ActorID)
--API_Trace('zhuangtai1='..zhuangtai)
--API_Trace('add1='..add)
--API_Trace('TeamID1='..TeamID)

	local TeamSize = API_GetTeamSize(TeamID)
	local mapid = API_GetActorMapID(ActorID)
	local tudinum = 0
	local jiazhi = 0
	local jiaohushuju = 0
	if zhuangtai < 1 or zhuangtai > 5 then
		return 0
	end
	if zhuangtai == 1 then
		jiaohushuju = 12066
	elseif zhuangtai == 2 then
		jiaohushuju = 12067
	elseif zhuangtai == 3 then
		jiaohushuju = 12068
	elseif zhuangtai == 4 then
		jiaohushuju = 12069
	elseif zhuangtai == 5 then
		jiaohushuju = 12070
	end
	for i=1,TeamSize do
		local teamActorID = API_GetTeamMem(TeamID,i)
		if API_GetRelationType(ActorID,teamActorID) == 2 then --是师徒
			if API_ActorIsOnline(teamActorID) then
				local tudimapid = API_GetActorMapID(teamActorID)
				if tudimapid == mapid then --同地图
					local cishupanduan = API_VarDataGetNumber(teamActorID,1,jiaohushuju)
					local year,month,day,hour,min,sec,wday = PublicFun_time()	
					local addbeilv = 0
					if day ~= cishupanduan then
						local shijijiaodaojifen = API_GetContribution(teamActorID) --API获取师傅实际教导积分(teamActorID)
						local panding = teacher_jifendangcipanding(shijijiaodaojifen)
						if panding > 0 then
							addbeilv = teacher_jiaodaojifendangciduihuantable[panding].jianglijiacheng
							if add == 1 then
								API_VarDataSetNumber(teamActorID,1,jiaohushuju,day)
							end
						end
					end	
					jiazhi = jiazhi + addbeilv
				end
			end	
		end	
	end
	if jiazhi > 10 then
		jiazhi = 10
	end
	return jiazhi
end
---------------------------------------------------------------------------------------徒弟升级,师傅增加经验部分
--[[function teacher_shifujiangyanadd(tudiID,shifuid)
	--可否给不在线的玩家添加经验值
	local level = API_GetActorExpLevel(tudiID)
	if teacher_jiaodaojifentable[level] ~= nil then
		local expadd = teacher_jiaodaojifentable[level].expadd
		API_ActorAddExp(shifuid,expadd,905,'因为徒弟升级,师傅增加经验值')
		if API_ActorIsOnline(shifuid) then
			local tudiname = API_GetActorName(tudiID)
			API_ActorSendMsg(shifuid,0,'您的徒弟“'..tudiname..'”等级提升,您获得经验'..expadd..'点。')
			API_ActorSendMsg(shifuid,7,'您的徒弟“'..tudiname..'”等级提升,您获得经验'..expadd..'点。')
		end
	end
end--]]

-----------------------------------------------------------------------------------师傅为徒弟增加经验部分
function teacher_teacherstuaddexp(stid,teaid,exp1)
	local shengyuexp = API_VarDataGetNumber(teaid,1,12122) 
	if exp1 < 100 then
		API_ActorSendMsg(teaid,3,'分配给徒弟的经验必须大于100点')
		return	
	end
	if shengyuexp < exp1 then
		API_ActorSendMsg(teaid,3,'您剩余可分配的经验不足'..exp1..',不能进行经验分配')
		return		
	end
	local tudiServerID = API_GetActorServerID(stid)
	local shifuServerID = API_GetActorServerID(teaid)
	if tudiServerID > 0 then
		if tudiServerID == shifuServerID then
			local level = API_GetActorExpLevel(stid) 
			local maxexp = 0
			if teacher_jiaodaojifentable[level].meirilingqushangxian ~= nil and teacher_jiaodaojifentable[level].meirilingqushangxian > 0 then
				maxexp = teacher_jiaodaojifentable[level].meirilingqushangxian
			else
				API_ActorSendMsg(teaid,3,'数据出现问题请重试')
				return
			end
			local yihuodejingyan = API_VarDataGetNumber(stid,1,12126) 
			if yihuodejingyan >= maxexp then 
				API_ActorSendMsg(teaid,3,'该徒弟今日已经获得了'..yihuodejingyan..'经验，达到今日上限，不能继续增加经验。')
				return
			end
			local haikezengjiaexp = maxexp - yihuodejingyan
			if exp1 > haikezengjiaexp then
				API_ActorSendMsg(teaid,3,'该徒弟今日还可获得'..haikezengjiaexp..'经验，请重新赠予经验。')
				return			
			end
			teacher_xinjian(stid,teaid,exp1,3)
			local addexp = yihuodejingyan + exp1
			API_VarDataSetNumber(stid,1,12126,addexp) 
			shengyuexp = shengyuexp - exp1
			API_VarDataSetNumber(teaid,1,12122,shengyuexp) 
			API_ActorSendMsg(teaid,17,'为徒弟增加'..exp1..'经验成功！')
			API_ActorSendMsg(teaid,7,'为徒弟增加'..exp1..'经验成功！')
		else
--API_Trace('XYZ')
--API_Trace('tudiServerID='..tudiServerID)		
			API_OpenRPC(tudiServerID,0,0,0,5,{stid,teaid,exp1,3,shengyuexp},'teacher_teacherstuaddexp2')
--API_Trace('XYZ3')			
		end	
	end	
end
function teacher_teacherstuaddexp2(stid,teaid,exp1,zhuangtai,shengyuexp)
--API_Trace('XYZ2')	
	local level = API_GetActorExpLevel(stid) 
	local maxexp = 0
	local tudiServerID = API_GetActorServerID(stid)
	local shifuServerID = API_GetActorServerID(teaid)
	if teacher_jiaodaojifentable[level].meirilingqushangxian ~= nil and teacher_jiaodaojifentable[level].meirilingqushangxian > 0 then
		maxexp = teacher_jiaodaojifentable[level].meirilingqushangxian
	else
--API_Trace('123')	
		--API_ActorSendMsg(teaid,3,'数据出现问题请重试')
		return
	end
	local yihuodejingyan = API_VarDataGetNumber(stid,1,12126) 
	if yihuodejingyan >= maxexp then 
--API_Trace('1234')	
		--API_ActorSendMsg(teaid,3,'该学生今日已经获得了'..yihuodejingyan..'经验，达到今日上限，不能继续增加经验。')
		API_OpenRPC(shifuServerID,0,0,0,4,{teaid,stid,yihuodejingyan,2},'teacher_teacherstuaddexp3')
		return
	end
	local haikezengjiaexp = maxexp - yihuodejingyan
	if exp1 > haikezengjiaexp then
--API_Trace('12345')	
		--API_ActorSendMsg(teaid,3,'该学生今日还可获得'..haikezengjiaexp..'经验，请重新赠予经验。')
		API_OpenRPC(shifuServerID,0,0,0,4,{teaid,stid,haikezengjiaexp,3},'teacher_teacherstuaddexp3')
		return			
	end
	if shengyuexp < exp1 then
--API_Trace('123456')	
		--API_ActorSendMsg(teaid,3,'您剩余可分配的经验不足'..exp1..',不能进行经验分配')
		API_OpenRPC(shifuServerID,0,0,0,4,{teaid,stid,exp1,4},'teacher_teacherstuaddexp3')
		return --可分配经验不足		
	end
	if shifuServerID > 0 then
--API_Trace('1234567')		
		teacher_xinjian(stid,teaid,exp1,3)
		local addexp = yihuodejingyan + exp1
		API_VarDataSetNumber(stid,1,12126,addexp) 
		shengyuexp = shengyuexp - exp1
		if tudiServerID == shifuServerID then			
--API_Trace('12345678')		
			API_VarDataSetNumber(teaid,1,12122,shengyuexp) 
			API_ActorSendMsg(teaid,17,'为徒弟增加'..exp1..'经验成功！')
			API_ActorSendMsg(teaid,7,'为徒弟增加'..exp1..'经验成功！')
		else
--API_Trace('123456789')		
			API_OpenRPC(shifuServerID,0,0,0,4,{teaid,shengyuexp,exp1,1},'teacher_teacherstuaddexp3')
--API_Trace('1234567890')			
		end	
	end	
end
function teacher_teacherstuaddexp3(teaid,shengyuexp,exp1,zhuangtai)
--API_Trace('12345678901')	
	if zhuangtai == 1 then
		API_VarDataSetNumber(teaid,1,12122,shengyuexp) 
		API_ActorSendMsg(teaid,17,'为徒弟增加'..exp1..'经验成功！')
		API_ActorSendMsg(teaid,7,'为徒弟增加'..exp1..'经验成功！')
	elseif zhuangtai == 2 then
		API_ActorSendMsg(teaid,7,'学生'..API_GetActorName(shengyuexp)..'今日已经获得了'..exp1..'经验，达到今日上限，不能继续增加经验。')
		API_ActorSendMsg(teaid,17,'学生'..API_GetActorName(shengyuexp)..'今日已经获得了'..exp1..'经验，达到今日上限，不能继续增加经验。')
	elseif zhuangtai == 3 then
		API_ActorSendMsg(teaid,7,'学生'..API_GetActorName(shengyuexp)..'今日还可获得'..exp1..'经验，请重新赠予经验。')
		API_ActorSendMsg(teaid,17,'学生'..API_GetActorName(shengyuexp)..'今日还可获得'..exp1..'经验，请重新赠予经验。')
	elseif zhuangtai == 4 then
		API_ActorSendMsg(teaid,7,'您剩余可分配的经验不足'..exp1..',不能进行经验分配')
		API_ActorSendMsg(teaid,17,'您剩余可分配的经验不足'..exp1..',不能进行经验分配')
	end	
end
--师傅为徒弟增加经验时 走这里
--等胡海峰一起搞

-----------------------------------------------------------------------------------毕业时师傅增加的经验部分
--徒弟的积分达到MAX,师傅得到经验
function teacher_biyehuidiao(ActorID,shifuid)
--API_Trace('进入毕业=')
	local level = API_VarDataGetNumber(ActorID,1,12124) 
	if API_ActorIsOnline(shifuid) then --师傅在线
		level = API_GetActorExpLevel(shifuid) --师傅等级
	end		
--API_Trace('师傅等级='..level)	
	local addexp = 0	
	if teacher_jiaodaojifentable[level] ~= nil then
		if teacher_jiaodaojifentable[level].biyejingyan > 0 then
			addexp = teacher_jiaodaojifentable[level].biyejingyan
		end
	end
--API_Trace('经验='..addexp)		
	if addexp > 0 then
--API_Trace('shifuid='..shifuid) 
--API_Trace('ActorID='..ActorID) 	
		teacher_xinjian(ActorID,shifuid,addexp,1)
		API_ActorSendMsg(ActorID,17,'您与您师傅之间的教导积分达到3372.为了感谢您师傅的殷勤教导,特此奖励师傅'..addexp..'经验。')
		if API_ActorIsOnline(shifuid) then --师傅在线
			local tudiname = API_GetActorName(ActorID)
			API_ActorSendMsg(shifuid,17,'您与您徒弟‘'..tudiname..'’之间的教导积分达到3372.为了感谢您的殷勤教导,特此奖励师傅'..addexp..'经验。')
		end		
	end
end
----------------------------------------------------------------------------------邮件
function teacher_xinjian(ActorID,shifuid,addexp,zhuangtai)
--API_Trace('shifuid='..shifuid) 
--API_Trace('ActorID='..ActorID) 
--API_Trace('addexp='..addexp) 	
	addexp = addexp/100
	--addexp = PublicFun_4floor5ceil(addexp)
	addexp = math.floor(addexp)--取整
	if addexp < 1 then
		return
	end
	local tudiname = ''
	if API_ActorIsOnline(ActorID) then
		tudiname = API_GetActorName(ActorID)
	end	
--API_Trace('tudiname='..tudiname) 	
--API_Trace('addexp='..addexp) 	
	if zhuangtai == 1 then
		local shifuname = API_VarDataGetString(ActorID,1,12125)
		if API_SendActorMailByName(shifuname,80498,addexp,1,'对师傅的奖励','您与您的徒弟'..tudiname..'之间的教导积分达到3372.为了感谢您对徒弟的殷勤教导,特此奖励您“经验兑换卷”'..addexp..'张。') then
		API_VarDataSetNumber(ActorID,1,12072,1) 
		end
	elseif zhuangtai == 2 then
		local shifuname = API_VarDataGetString(ActorID,1,12125)
		API_SendActorMailByName(shifuname,80498,addexp,1,'对师傅的回报','您与您的徒弟'..tudiname..'解除了师徒关系,为了感谢您对徒弟的殷勤教导,特此奖励您“经验兑换卷”'..addexp..'张。')
	elseif zhuangtai == 3 then
		local tudiname = API_GetActorName(ActorID)
		API_SendActorMailByName(tudiname,80498,addexp,1,'师傅对徒弟的奖励','您的师傅今天送给您'..addexp..'张“经验兑换卷”。')
	end	
end
----------------------------------------------------------------------------------解除师徒关系时 师傅经验的增加
--师傅与徒弟解除关系时,师傅增加的经验,受每日MAX影响
function teacher_jiechuguanxi(tudiid,shifuid)
--API_Trace('解除关系执行')	
	API_VarDataSetNumber(tudiid,1,12072,0) 
	API_VarDataSetNumber(tudiid,1,12064,0) 
	--local shifulevel = API_VarDataGetNumber(tudiid,1,12124) 
	--if API_ActorIsOnline(shifuid) then --师傅在线
		--shifulevel = API_GetActorExpLevel(shifuid) --师傅等级
	--end	
--API_Trace('shifulevel='..shifulevel)	
	--local yihuodejingyan = API_VarDataGetNumber(shifuid,1,12071) --获取师傅剩余数值	
	if API_ActorIsOnline(tudiid) then
	else
		return
	end
	local level = API_GetActorExpLevel(tudiid) --徒弟等级
--API_Trace('level='..level)	
	--if teacher_jiaodaojifentable[shifulevel] ~= nil then 
		--local maxjingyan = teacher_jiaodaojifentable[shifulevel].meirilingqushangxian
	--	if maxjingyan > 0 then
			--if yihuodejingyan < maxjingyan then
				if teacher_jiaodaojifentable[level] ~= nil then
					local jianglibeishu = teacher_jiaodaojifentable[level].jianglibeishu
--API_Trace('奖励倍数='..jianglibeishu)						
					local shijijiaodaojifen = API_GetContribution(tudiid) --API获取师傅实际教导积分(tudiid)
--API_Trace('教导积分='..shijijiaodaojifen)					
					local jiangli = jianglibeishu * shijijiaodaojifen
					jiangli = PublicFun_4floor5ceil(jiangli)
					--if jiangli + yihuodejingyan >= maxjingyan then
						--jiangli = maxjingyan - yihuodejingyan
					--end
					--local newyihuodejingyan = yihuodejingyan + jiangli
					--if newyihuodejingyan > maxjingyan then
						--newyihuodejingyan = maxjingyan
					--end
					--API_VarDataSetNumber(shifuid,1,12071,newyihuodejingyan)
					teacher_xinjian(tudiid,shifuid,jiangli,2)
--API_Trace('发送邮件')						
				end	
		--	end
		--end
	--end	
	API_VarDataSetNumber(tudiid,1,12124,0) 
	local TeamID = API_GetTeamID(tudiid)
	if TeamID > 0 then
		API_CreateTimerTriggerG(TeamID,0,2,1,'teacher_guanxijiechubuffdel')
		--teacher_shuxingtianjia(TeamID)
	end			
	ScretFrame_OnDeclate(tudiid)

end
function teacher_guanxijiechubuffdel(TeamID)
	teacher_shuxingtianjia(TeamID)
end
-----------------------------------------------------------------------------------师徒关系每日数据重置
function teacher_everydaydatecleaner(ActorID)	
--API_Trace('进入重置')
	local level = API_GetActorExpLevel(ActorID)
	local exp = 0 
	if teacher_jiaodaojifentable[level].shifukefenpeiexp ~= nil then
		exp = teacher_jiaodaojifentable[level].shifukefenpeiexp
	end  
--API_Trace('exp='..exp)	
	API_VarDataSetNumber(ActorID,1,12122,exp) 
	API_VarDataSetNumber(ActorID,1,12126,0) 
end
----------------------------------------------------------------------------------公用积分档次判断
function teacher_jifendangcipanding(shijijiaodaojifen)
	if shijijiaodaojifen >= 0 and shijijiaodaojifen < 337 then
		return 1
	elseif shijijiaodaojifen >= 337 and shijijiaodaojifen < 674 then
		return 2
	elseif shijijiaodaojifen >= 674 and shijijiaodaojifen < 1011 then
		return 3
	elseif shijijiaodaojifen >= 1011 and shijijiaodaojifen < 1348 then
		return 4
	elseif shijijiaodaojifen >= 1348 and shijijiaodaojifen < 1686 then
		return 5
	elseif shijijiaodaojifen >= 1686 and shijijiaodaojifen < 2023 then
		return 6
	elseif shijijiaodaojifen >= 2023 and shijijiaodaojifen < 2360 then
		return 7
	elseif shijijiaodaojifen >= 2360 and shijijiaodaojifen < 2697 then
		return 8
	elseif shijijiaodaojifen >= 2697 and shijijiaodaojifen < 3034 then
		return 9
	elseif shijijiaodaojifen >= 3034 and shijijiaodaojifen < 3371 then
		return 10
	elseif shijijiaodaojifen >= 3371 then
		return 11
	end
	return 0
end
-------------------------------------------------------------------------------------拜师成功处理
function teacher_baishichenggongchuli(tudiid,shifuid,level,shifuname)
--API_Trace('tudiid='..tudiid)
--API_Trace('shifuid='..shifuid)
--API_Trace('level='..level)
--API_Trace('shifuname='..shifuname)
	--if API_GetRelationType(shifuid,tudiid) == 2 then --是师徒
		--local level = API_GetActorExpLevel(ActorID)
		ScretFrame_OnFindedMaster(tudiid)
		API_VarDataSetNumber(tudiid,1,12124,level) 
--API_Trace('设置成功='..API_VarDataGetNumber(tudiid,1,12124))	
		API_VarDataSetString(tudiid,1,12125,shifuname)
		--API_VarDataSetString(shifuid, long bSaveDB, long nKey, char *szString)
	--end
	local TeamID = API_GetTeamID(tudiid)
	if TeamID > 0 then
		API_CreateTimerTriggerG(TeamID,0,2,1,'teacher_guanxijiechubuffdel')
		--teacher_shuxingtianjia(TeamID)
	end	
end
function teacher_shitujieshao(ActorID)
--API_Trace('进入')
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local xuanze = API_RequestGetNumber(1)
	API_ResponseWrite('<name>师徒利益</name>')
	API_ResponseWrite('<win rect="300,100,400,300"></win>')
	if xuanze == 1 then
--API_Trace('111=')	
		API_ResponseWrite('<text>1.拜师成功后师徒之间产生教导积分。教导积分的多少影响师傅在各种浮空岛的奖励收益和攻击加成。师徒组队后最多可获得</text><text color="255,0,0">50点攻击加成</text><text>，参加各种浮空岛可获得</text><text color="255,0,0">10%的奖励加成</text><text>。教导积分达到3372后师傅可以获得一次</text><text color="255,0,0">大量经验奖励。</text><br><br>')
		API_ResponseWrite('<text>2.教导积分的增加方法：</text><br><br>')
		API_ResponseWrite('<text>  a.徒弟升级</text><br><br>')
		API_ResponseWrite('<text>  b.在师傅的教导下徒弟完成特殊事件</text><br><br>')
		API_ResponseWrite('<text>  c.师徒组队参加各种浮空岛（收益衰减后无效）</text><br><br>')
		API_ResponseWrite('<a href="teacher_shitujieshao?1=3">返回</a><br><br>')
	elseif xuanze == 2 then
--API_Trace('222=')		
		API_ResponseWrite('<text>1.拜师成功后师徒之间产生教导积分。教导积分的多少影响徒弟在各种浮空岛的奖励收益和攻击加成。师徒组队后最多可获得</text><text color="255,0,0">50点攻击加成</text><text>，参加各种浮空岛可获得</text><text color="255,0,0">10%的奖励加成</text><text>。教导积分达到3372后师傅可以获得一次</text><text color="255,0,0">大量经验奖励。</text><br><br>')
		API_ResponseWrite('<text>2.教导积分的增加方法：</text><br><br>')
		API_ResponseWrite('<text>  a.徒弟升级</text><br><br>')
		API_ResponseWrite('<text>  b.在师傅的教导下徒弟完成特殊事件</text><br><br>')
		API_ResponseWrite('<text>  c.师徒组队参加各种浮空岛（收益衰减后无效）</text><br><br>')
		API_ResponseWrite('<text>3.师傅每日会根据等级获得一笔由系统提供只能分配给徒弟的经验，徒弟根据自身等级决定可获得的经验最大额度.</text><br><br>')
		API_ResponseWrite('<a href="teacher_shitujieshao?1=3">返回</a><br><br>')
	else
--API_Trace('333=')		
		API_ResponseWrite('<text>每位玩家可以拥有1位师傅和20名徒弟，拥有师徒关系后可享受以下利益：（只可以向高于自己15级的玩家进行拜师）</text><br><br>')
		API_ResponseWrite('<a href="teacher_shitujieshao?1=1">师傅的利益</a><br><br>')
		API_ResponseWrite('<a href="teacher_shitujieshao?1=2">徒弟的利益</a><br><br>')
	end	
	API_ResponseWrite('<a>关闭</a><br>')
	API_ResponseFlush(ActorID)
end
function teacher_xinshouliuchengjieshu(ActorID)
end
function teacher_xinshouliuchengjieshu2(ActorID)
	local Camp = API_GetActorCamp(ActorID)
	API_ResponseWrite('<name>拜师提示</name>')
	API_ResponseWrite('<win rect="300,100,400,300"></win>')
	API_ResponseWrite('<text>恭喜你已经3级了!你可以到名师榜处选择一位适合自己的玩家进行拜师，他可以指引你更好的了解这个世界。</text><br><br>')
	if Camp == 0 then 
		API_ResponseWrite('<a mapid="9" x="153" y="383" NpcID="12055" underline="1">去名师榜拜师</a>')
	elseif Camp == 1 then
		API_ResponseWrite('<a mapid="25" x="148" y="303" NpcID="12055" underline="1">去名师榜拜师</a>')		
	end
	API_ResponseWrite('<br><br><a>关闭</a><br>')
	API_ResponseFlush(ActorID)
end
