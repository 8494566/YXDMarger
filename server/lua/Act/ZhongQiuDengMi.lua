----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\ZhongQiuDengMi.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	吴斌
--日  期:	2009-9-19
--版  本:	1.0
--描  述:	中秋灯谜活动
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：吴斌
--日期：2009-9-19
--功能：创建19201-19300
--使用交互数据：
--19216 -每天玩家回答正确灯谜数量
--19217--当前获得题目序号
--19218-参加活动时间 
ZhongQiuDengMi_QuestionList = {}
ZhongQiuDengMi_AnswerList = {}
ZhongQiuDengMi_TrueAnswerList = {}
--中秋灯谜题目表
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,1,'非典，非典，携手清除（打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,2,'姚明一溜烟 （打一体育词语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,3,'“玄德请二人到庄”（打2字古礼仪用语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,4,'遮住了花容月貌（打3字出版新词）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,5,'七日速变俏姿容（打一影星名）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,6,'宾客尽脱帽，洒泪来反思（打一音乐人，2字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,7,'细雨如丝正及时（打一古语称谓）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,8,'玄德先来，云长未到（打一田径运动员，2字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,9,'此章节错误较少（打5字口语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,10,'元宵隔日始营业（打4字出版名词，纸张类型）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,11,'战乱重圆何感叹（打9笔字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,12,'不肖遭父笞，药疗得痊愈（打二公安名词）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,13,'太阳出来喜洋洋（打3字天文名词）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,14,'吾与一家人，离散又重逢（打一党史人物，2字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,15,'“有连山”（打2字国际名词）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,16,'娘娘懿旨：刀下留人（打7字成语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,17,'介入一部分（打2字音乐名词）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,18,'“夫妻本是同林鸟”（打4字名电视剧）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,19,'滚滚长江东逝水（打两个2字手机品牌）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,20,'文章不写半句空（打两个2字文学名词）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,21,'不要江山要美人（打两个汽车品牌）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,22,'寄人篱下为糊口（打16笔字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,23,'“煌煌太宗业”（打一相声演员，3字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,24,'做事手段好精明（打一3字教育机构简称）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,25,'曲意奉承不可取（打一两字港台歌星，）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,26,'还是分开吧（打一2字外国名）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,27,'这一章情节纯属虚构（打5字口语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,28,'弃曹会刘本为云长心愿（打《三国演义》歌词一句）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,29,'高不成，低不就 　（打一金融机构名称）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,30,'早穿皮袄午穿纱 （打一医学名词）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,31,'大会 （打一成语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,32,'不舒服 （打一成语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,33,'人比黄花瘦 （打一农业名词）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,34,'中华民族繁荣昌盛 （打一近代烈士）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,35,'天下谁人不识君 （打两个我国地名）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,36,'荐之于平原君（打一成语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,37,'东京北京通贸易 （打一成语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,38,'未成油团 （打一外国著名小说）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,39,'卷尾猴 （打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,40,'贞观之治 （打一电影演员）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,41,'唐代瑰宝 （打一古代科学家）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,42,'儿童节放假 （打一中成药名）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,43,'并非阴历初一 （打一广西地名）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,44,'孟母三迁 （打一杂志名称）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,45,'家中添一口 （打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,46,'湖光水影月当空 （打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,47,'百病不单由口入 （打一外国故事片）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,48,'千分之一百分之一 （打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,49,'因 （打一谚语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,50,'甜咸苦辣各味俱备 （打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,51,'魏蜀相争 （打一经济名词）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,52,'只公开谜目 （打两个出版名词）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,53,'重点支援大西北 （打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,54,'到黄昏点点滴滴 （打一气象术语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,55,'座中泣下谁最多 （打两个文学名词）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,56,'山中无老虎 （打两个法律名词）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,57,'大胆改组 （打一鲁迅作品篇名）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,58,'巧立名目 （打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,59,'专吃金木火 （打一医学术语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,60,'天苍苍、野—— ——（打一句白居易七言诗句）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,61,'减四余二、减二余四 （打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,62,'遇水则清、遇火则明 （打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,63,'冷冷清清凄凄惨惨切切 （打一故事片）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,64,'丫丫 （打一文艺名词）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,65,'长安美女 （此谜用心方能猜中，打一词牌）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,66,'所有的王八穿龙袍（打一电影名）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,67,'凤凰台上凤凰游 （打数学名词一）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,68,'为什么要控制人口 （打成语一）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,69,'半价出售 （打字一）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,70,'打算明年生小孩（打一电影名）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,71,'拦河坝 （打字一）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,72,'羊叫 （打词牌一）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,73,'蟋蟀对鸣 （打《木兰辞》句一）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,74,'曲 （打曹操诗句一）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,75,'分 （打广告用语一）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,76,'他有你没有，地有天没有 （打字一）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,77,'有凤凰而没有孔雀 （打字一）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,78,'鲁迅逝世一世纪（打一成语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,79,'画中不是田 （打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,80,'谜面空白无字 （打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,81,'说与旁人浑不解 ，用红笔书写（打一现代散文家）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,82,'百年松柏老芭蕉（打一成语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,83,'塞外秋菊漫野金 （打三个中药名） ')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,84,'谢绝参观 （打一常用语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,85,'夫人何处去（打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,86,'一人一张口，口下长只手（打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,87,'推开又来　（打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,88,'高尔基　（打一字）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,89,'日近黄昏（打一中国地名）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,90,'珍珠港（打一中国地名）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,91,'大热天，猫，狗等都在气喘吁吁，只有羊在吃草 （打一成语）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,92,'有头无颈，有眼无眉， 无脚能走，有翅难飞（打一动物）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,93,'夏前它来到，秋后没处找， 摧咱快播种，年年来一遭（打一动物）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,94,'前有毒夹，后有尾巴， 全身二十一节，中药铺要它（打一动物）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,95,'同穿衣服同穿鞋（打一与人有关的东西）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,96,'一线相通，飞行空中(打一物)')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,97,'一片全是草的地（打一植物名称）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,98,'两对听觉器官（打一音乐家名）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,99,'刽子手的嘴脸（打一两字官名）')
PublicFun_GreatTable(ZhongQiuDengMi_QuestionList,100,'开花结桃，桃不能吃（打一物）')
--- 中秋灯谜答案选项表
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,1,{[1]='排',[2]='挡',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,2,{[1]='男子长跑',[2]='男子跳高',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,3,{[1]='备座',[2]='作揖',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,4,{[1]='封面秀',[2]='盖面秀',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,5,{[1]='周迅',[2]='周海媚',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,6,{[1]='洛兵',[2]='周杰伦',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,7,{[1]='在下',[2]='仁兄',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,8,{[1]='刘翔',[2]='史东鹏',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,9,{[1]='这回差不多',[2]='这样还不行',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,10,{[1]='十六开张',[2]='十七出炉',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,11,{[1]='哉',[2]='宰',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,12,{[1]='严打、治安',[2]='扫黄、打黑',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,13,{[1]='日心说',[2]='万有引力',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,14,{[1]='伍豪',[2]='伍威',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,15,{[1]='峰会',[2]='和谈',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,16,{[1]='置之死地而后生',[2]='柳暗花明又一村',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,17,{[1]='音阶',[2]='音节',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,18,{[1]='难舍真情',[2]='两难相忘',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,19,{[1]='波导、海尔',[2]='长虹、联想',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,20,{[1]='成语、实录',[2]='文笔、谐语',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,21,{[1]='爱丽舍、皇冠',[2]='奔驰、红旗',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,22,{[1]='噙',[2]='嗜',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,23,{[1]='李国盛',[2]='唐国强',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,24,{[1]='高招办',[2]='招就办',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,25,{[1]='阿杜',[2]='黎明',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,26,{[1]='古巴',[2]='巴西',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,27,{[1]='没有那回事',[2]='这怎么可能',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,28,{[1]='离合总关情',[2]='我等燕归来',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,29,{[1]='中行',[2]='建设银行',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,30,{[1]='日服二次',[2]='增加剂量',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,31,{[1]='年幼无知',[2]='少不更事',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,32,{[1]='适得其反',[2]='正好相同',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,33,{[1]='植物肥',[2]='植物瘦',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,34,{[1]='黄兴',[2]='董存瑞',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,35,{[1]='常熟、大名',[2]='宿州、苏州',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,36,{[1]='引人入胜',[2]='令人遐想',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,37,{[1]='日中为市',[2]='中西合璧',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,38,{[1]='羊脂球',[2]='王子复仇记',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,39,{[1]='电',[2]='风',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,40,{[1]='唐国强',[2]='张国立',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,41,{[1]='李时珍',[2]='张仲景',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,42,{[1]='六一散',[2]='五石散',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,43,{[1]='阳朔',[2]='桂林',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,44,{[1]='《为了孩子》',[2]='《动漫先锋》',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,45,{[1]='豪',[2]='爽',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,46,{[1]='古',[2]='早',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,47,{[1]='《白痴》',[2]='《二傻》',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,48,{[1]='伯',[2]='仲',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,49,{[1]='有火就有烟',[2]='有烟就有火',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,50,{[1]='口',[2]='舌',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,51,{[1]='专利权',[2]='专营权',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,52,{[1]='封面、封底',[2]='竖页、横板',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,53,{[1]='头',[2]='颈',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,54,{[1]='晚间有零星小雨',[2]='晚间有倾盆大雨',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,55,{[1]='独白，悲剧',[2]='配音、喜剧',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,56,{[1]='申诉、自首',[2]='一审、判决',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,57,{[1]='《明天》',[2]='《呐喊》',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,58,{[1]='啰',[2]='嗦',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,59,{[1]='水土不服',[2]='花草过敏',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,60,{[1]='两处茫茫皆不见',[2]='两只黄鹂鸣翠柳',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,61,{[1]='园',[2]='圆',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,62,{[1]='登',[2]='爬',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,63,{[1]='《绝唱》',[2]='《绝响》',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,64,{[1]='二人转',[2]='黄梅戏',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,65,{[1]='忆秦娥',[2]='孟姜女',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,66,{[1]='《满城尽带黄金甲》',[2]='《赤壁》',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,67,{[1]='相似三角形',[2]='相等三角形',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,68,{[1]='多难兴邦',[2]='立国建业',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,69,{[1]='催',[2]='促',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,70,{[1]='《宝贝计划》',[2]='《窃听风云》',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,71,{[1]='汇',[2]='流',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,72,{[1]='声声慢',[2]='临江仙',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,73,{[1]='唧唧复唧唧',[2]='木兰当户织',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,74,{[1]='对酒当歌',[2]='譬如朝露',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,75,{[1]='时间就是金钱',[2]='时间就是生命',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,76,{[1]='也',[2]='还',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,77,{[1]='有',[2]='没有',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,78,{[1]='百年树人',[2]='十年树木',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,79,{[1]='十',[2]='士',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,80,{[1]='迷',[2]='眯',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,81,{[1]='朱自清',[2]='沈雁冰',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,82,{[1]='粗枝大叶',[2]='马虎不得',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,83,{[1]='天冬、前胡、地黄',[2]='当归、防风、半夏',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,84,{[1]='不同意见',[2]='签字画押',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,85,{[1]='二',[2]='三',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,86,{[1]='拿',[2]='擒',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,87,{[1]='摊',[2]='派',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,88,{[1]='尚',[2]='为',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,89,{[1]='洛阳',[2]='长安',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,90,{[1]='蚌埠',[2]='阜阳',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,91,{[1]='扬眉吐气',[2]='趾高气昂',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,92,{[1]='鱼',[2]='虾',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,93,{[1]='布谷鸟',[2]='蜂鸟',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,94,{[1]='蜈蚣',[2]='蝎子',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,95,{[1]='人影',[2]='灯光',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,96,{[1]='风筝',[2]='陀螺',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,97,{[1]='梅花',[2]='梨花',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,98,{[1]='聂耳',[2]='冼星海',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,99,{[1]='宰相 ',[2]='太师',})
PublicFun_GreatTable(ZhongQiuDengMi_AnswerList,100,{[1]='棉花',[2]='番薯',})
--中秋灯谜答案表
--- 中秋灯谜答案选项表
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,1,{TrueAnswer='排',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,2,{TrueAnswer='男子长跑',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,3,{TrueAnswer='备座',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,4,{TrueAnswer='封面秀',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,5,{TrueAnswer='周迅',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,6,{TrueAnswer='洛兵',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,7,{TrueAnswer='在下',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,8,{TrueAnswer='刘翔',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,9,{TrueAnswer='这回差不多',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,10,{TrueAnswer='十六开张',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,11,{TrueAnswer='哉',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,12,{TrueAnswer='严打、治安',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,13,{TrueAnswer='日心说',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,14,{TrueAnswer='伍豪',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,15,{TrueAnswer='峰会',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,16,{TrueAnswer='置之死地而后生',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,17,{TrueAnswer='音阶',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,18,{TrueAnswer='难舍真情',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,19,{TrueAnswer='波导、海尔',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,20,{TrueAnswer='成语、实录',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,21,{TrueAnswer='爱丽舍、皇冠',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,22,{TrueAnswer='噙',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,23,{TrueAnswer='李国盛',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,24,{TrueAnswer='高招办',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,25,{TrueAnswer='阿杜',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,26,{TrueAnswer='古巴',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,27,{TrueAnswer='没有那回事',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,28,{TrueAnswer='离合总关情',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,29,{TrueAnswer='中行',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,30,{TrueAnswer='日服二次',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,31,{TrueAnswer='年幼无知',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,32,{TrueAnswer='适得其反',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,33,{TrueAnswer='植物肥',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,34,{TrueAnswer='黄兴',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,35,{TrueAnswer='常熟、大名',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,36,{TrueAnswer='引人入胜',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,37,{TrueAnswer='日中为市',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,38,{TrueAnswer='羊脂球',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,39,{TrueAnswer='电',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,40,{TrueAnswer='唐国强',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,41,{TrueAnswer='李时珍',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,42,{TrueAnswer='六一散',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,43,{TrueAnswer='阳朔',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,44,{TrueAnswer='《为了孩子》',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,45,{TrueAnswer='豪',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,46,{TrueAnswer='古',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,47,{TrueAnswer='《白痴》',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,48,{TrueAnswer='伯',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,49,{TrueAnswer='有火就有烟',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,50,{TrueAnswer='口',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,51,{TrueAnswer='专利权',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,52,{TrueAnswer='封面、封底',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,53,{TrueAnswer='头',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,54,{TrueAnswer='晚间有零星小雨',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,55,{TrueAnswer='独白，悲剧',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,56,{TrueAnswer='申诉、自首',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,57,{TrueAnswer='《明天》',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,58,{TrueAnswer='啰',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,59,{TrueAnswer='水土不服',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,60,{TrueAnswer='两处茫茫皆不见',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,61,{TrueAnswer='园',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,62,{TrueAnswer='登',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,63,{TrueAnswer='《绝唱》',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,64,{TrueAnswer='二人转',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,65,{TrueAnswer='忆秦娥',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,66,{TrueAnswer='《满城尽带黄金甲》',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,67,{TrueAnswer='相似三角形',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,68,{TrueAnswer='多难兴邦',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,69,{TrueAnswer='催',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,70,{TrueAnswer='《宝贝计划》',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,71,{TrueAnswer='汇',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,72,{TrueAnswer='声声慢',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,73,{TrueAnswer='唧唧复唧唧',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,74,{TrueAnswer='对酒当歌',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,75,{TrueAnswer='时间就是金钱',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,76,{TrueAnswer='也',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,77,{TrueAnswer='有',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,78,{TrueAnswer='百年树人',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,79,{TrueAnswer='十',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,80,{TrueAnswer='迷',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,81,{TrueAnswer='朱自清',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,82,{TrueAnswer='粗枝大叶',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,83,{TrueAnswer='天冬、前胡、地黄',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,84,{TrueAnswer='不同意见',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,85,{TrueAnswer='二',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,86,{TrueAnswer='拿',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,87,{TrueAnswer='摊',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,88,{TrueAnswer='尚',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,89,{TrueAnswer='洛阳',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,90,{TrueAnswer='蚌埠',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,91,{TrueAnswer='扬眉吐气',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,92,{TrueAnswer='鱼',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,93,{TrueAnswer='布谷鸟',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,94,{TrueAnswer='蜈蚣',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,95,{TrueAnswer='人影',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,96,{TrueAnswer='风筝',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,97,{TrueAnswer='梅花',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,98,{TrueAnswer='聂耳',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,99,{TrueAnswer='宰相 ',})
PublicFun_GreatTable(ZhongQiuDengMi_TrueAnswerList,100,{TrueAnswer='棉花',})
local ZQDM_DGPlayNum = 50
local ZQDM_LBPlayNum = 50
local ZQDM_DGLightNum = 50
local ZQDM_LBLightNum = 50
ZQDM_YueBingSX = 0
ZQDM_lightSC = 0
if ZhongQiuDengMi_DGLightTable == nil then
	ZhongQiuDengMi_DGLightTable = {}
end
if ZhongQiuDengMi_LBLightTable == nil then
	ZhongQiuDengMi_LBLightTable = {}
end

--中秋灯谜活动时间表
if ZhongQiuDengMi_ActTime == nil then
    ZhongQiuDengMi_ActTime = {Month = 10,Day = 7, RedayTime=20,StartTime=21,EndTime=22}
end
--奖励数值表
if ZQDM_JLTable == nil then
	ZQDM_JLTable = {
		[1]={EXP=296000,SJB=148000},
		[2]={EXP=592000,SJB=296000},
		[3]={EXP=888000,SJB=444000},
		[4]={EXP=1184000,SJB=592000},
		[5]={EXP=1480000,SJB=740000},
		[6]={EXP=1776000,SJB=888000},
		[7]={EXP=2072000,SJB=1036000},
		[8]={EXP=2368000,SJB=1184000},
		[9]={EXP=2664000,SJB=1332000},
		[10]={EXP=2960000,SJB=1480000},
		[11]={EXP=3256000,SJB=1628000},
		[12]={EXP=3552000,SJB=1776000},
		[13]={EXP=3848000,SJB=1924000},
		[14]={EXP=4144000,SJB=2072000},
		[15]={EXP=4440000,SJB=2220000},
		[16]={EXP=4736000,SJB=2368000},
		[17]={EXP=5032000,SJB=2516000},
		[18]={EXP=5328000,SJB=2664000},
		[19]={EXP=5624000,SJB=2812000},
		[20]={EXP=5920000,SJB=2960000},
		[21]={EXP=6216000,SJB=3108000},
		[22]={EXP=6512000,SJB=3256000},
		[23]={EXP=6808000,SJB=3404000},
		[24]={EXP=7104000,SJB=3552000},
		[25]={EXP=7400000,SJB=3700000},
		[26]={EXP=9098000,SJB=4549000},
		[27]={EXP=10797000,SJB=5398000},
		[28]={EXP=12496000,SJB=6248000},
		[29]={EXP=14194666,SJB=7097333},
		[30]={EXP=15893333,SJB=7946666},
		[31]={EXP=17592000,SJB=8796000},
		[32]={EXP=19290666,SJB=9645333},
		[33]={EXP=20989333,SJB=1049466},
		[34]={EXP=22688000,SJB=11344000},
		[35]={EXP=24386666,SJB=12193333},
		[36]={EXP=26085333,SJB=13042666},
		[37]={EXP=27784000,SJB=13892000},
		[38]={EXP=29482666,SJB=14741333},
		[39]={EXP=31181333,SJB=15590666},
		[40]={EXP=32880000,SJB=16440000},
		[41]={EXP=34984000,SJB=17492000},
		[42]={EXP=37088000,SJB=18544000},
		[43]={EXP=39192000,SJB=19596000},
		[44]={EXP=41296000,SJB=20648000},
		[45]={EXP=43400000,SJB=21700000},
		[46]={EXP=45504000,SJB=22752000},
		[47]={EXP=47608000,SJB=23804000},
		[48]={EXP=49712000,SJB=24856000},
		[49]={EXP=51816000,SJB=25908000},
		[50]={EXP=53920000,SJB=26960000},
		[51]={EXP=56024000,SJB=28012000},
		[52]={EXP=58128000,SJB=29064000},
		[53]={EXP=60232000,SJB=30116000},
		[54]={EXP=62336000,SJB=31168000},
		[55]={EXP=64440000,SJB=32220000},
	}
end
--小月饼模具
ZQDM_YueBingMuJu = {[1]=88154,[2]=88155,[3]=88156,[4]=88157,[5]=88158,[6]=88159,[7]=88160,}									
if ZhongQiuDengMi_CreateLightTriggerID ~= nil then
	API_DestroyTriggerG(ZhongQiuDengMi_CreateLightTriggerID)
	ZhongQiuDengMi_CreateLightTriggerID = nil
end
if ZhongQiuDengMi_ActFunc ~= nil then
	API_DestroyTriggerG(ZhongQiuDengMi_ActFunc)
	ZhongQiuDengMi_ActFunc = nil
end
if API_GetServerID() == 1 then
	ZhongQiuDengMi_ActFunc = ZhongQiuDengMi_ActFunc or API_CreateTimerTriggerG(0,0,60,-1,'ZhongQiuDengMi_ActTimeFunc')
end
--公告
function ZhongQiuDengMi_ActTimeFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ZQRedayTime = ZhongQiuDengMi_ActTime.RedayTime
	local ZQStartTime = ZhongQiuDengMi_ActTime.StartTime
	local ZQEndTime = ZhongQiuDengMi_ActTime.EndTime
	local ZQMonth = ZhongQiuDengMi_ActTime.Month
	local ZQDay = ZhongQiuDengMi_ActTime.Day
	if 	API_IsBattleGameServer() then
		return
	end
	if Month == ZQMonth and Day <= ZQDay  then
		if Hour >= ZQStartTime and Hour < ZQEndTime then
			--开始刷门
			if Hour == ZQRedayTime and Minute >= 40 then
				if math.mod(Minute,10) == 0 then
					API_ActorBroadcastMsgEx(-1,-1,0,17,'中秋灯谜活动于21：00--22：00在主城举行，欢迎各位才智人士踊跃参与！')
					API_ActorBroadcastMsgEx(-1,-1,0,8,'中秋灯谜活动于21：00--22：00在主城举行，欢迎各位才智人士踊跃参与！')
				end
			end
			if Hour >= ZQStartTime and Hour < ZQEndTime then
				ZhongQiuDengMi_CreateLightFunc()
				ZhongQiuDengMi_CreateLightTriggerID = ZhongQiuDengMi_CreateLightTriggerID or API_CreateTimerTriggerG(0,0,60,60,'ZhongQiuDengMi_CreateLightFunc')
				if	Hour == ZQStartTime and Minute == 0	then
					API_ActorBroadcastMsgEx(-1,-1,0,17,'中秋灯谜活动现在开始！')
					API_ActorBroadcastMsgEx(-1,-1,0,8,'中秋灯谜活动现在开始！')
					API_ActorMsgBoard(0, -1, -1,'中秋灯谜活动于21：00--22：00在主城举行，欢迎各位才智人士踊跃参与！')
				end
			end
			if Hour == ZQStartTime and Minute >= 45 then
				if math.mod(Minute,5) == 0 then
					API_ActorBroadcastMsgEx(-1,-1,0,17,'请注意，中秋灯谜活动22点结束！')
					API_ActorBroadcastMsgEx(-1,-1,0,8,'请注意，中秋灯谜活动22点结束！')
				end
			end
		end
		if  Hour == ZQEndTime and Minute == 0 then
			API_ActorBroadcastMsgEx(-1,-1,0,17,'中秋灯谜活动今天已经结束，灯谜活动将在国庆七天中连续举行，期待您的参与！')
			API_ActorBroadcastMsgEx(-1,-1,0,8,'中秋灯谜活动今天已经结束，灯谜活动将在国庆七天中连续举行，期待您的参与！')
			ZQDM_YueBingSX = 0
			for i in ZhongQiuDengMi_DGLightTable	 do
				local DGFastID = ZhongQiuDengMi_DGLightTable[i]
				if DGFastID ~= nil and API_GetMonsterID(DGFastID) > 0 then
					API_DestroyMonster(DGFastID)
					ZhongQiuDengMi_DGLightTable[i] = nil	
				end
			end
			for j in ZhongQiuDengMi_LBLightTable	 do
				local LBFastID = ZhongQiuDengMi_LBLightTable[j]
				if LBFastID ~= nil and API_GetMonsterID(LBFastID) > 0 then
					API_DestroyMonster(LBFastID)
					ZhongQiuDengMi_LBLightTable[j] = nil	
				end
			end
		end
	end
end
--上线、换地图提示公告
function ZhongQiuDengMi_OnLogin(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()	
	local ZQRedayTime = ZhongQiuDengMi_ActTime.RedayTime
	local ZQStartTime = ZhongQiuDengMi_ActTime.StartTime
	local ZQEndTime = ZhongQiuDengMi_ActTime.EndTime
	local ZQMonth = ZhongQiuDengMi_ActTime.Month
	local ZQDay = ZhongQiuDengMi_ActTime.Day
	if Month == ZQMonth and Day <= ZQDay  then
		if 	Hour >=ZQStartTime and  Hour < ZQEndTime  then						
			API_ActorSendMsg(ActorID, 8,'中秋灯谜活动于21：00--22：00在主城举行，欢迎各位才智人士踊跃参与！')
			API_ActorSendMsg(ActorID, 17,'中秋灯谜活动于21：00--22：00在主城举行，欢迎各位才智人士踊跃参与！')
			API_ActorMsgBoard(0, -1, -1,'中秋灯谜活动于21：00--22：00在主城举行，欢迎各位才智人士踊跃参与！')
		end
	end	
end	
--创建灯笼
function ZhongQiuDengMi_CreateLightFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ZQRedayTime = ZhongQiuDengMi_ActTime.RedayTime
	local ZQStartTime = ZhongQiuDengMi_ActTime.StartTime
	local ZQEndTime = ZhongQiuDengMi_ActTime.EndTime
	local ZQMonth = ZhongQiuDengMi_ActTime.Month
	local ZQDay = ZhongQiuDengMi_ActTime.Day
	local DGMapID = API_GetRightMapID(1)
	local LBMapID = API_GetRightMapID(2)
	local DGx1,DGx2,DGy1,DGy2 = 173,293,119,311
	local LBx1,LBx2,LBy1,LBy2 = 139,334,130,350
	local ZQDM_DGPlayList = API_GetActorInArea(DGMapID,0,0,0,0,0)
	local ZQDM_LBPlayList = API_GetActorInArea(LBMapID,0,0,0,0,0)
	if ZQDM_DGPlayList ~= nil then
		ZQDM_DGPlayNum = table.getn(ZQDM_DGPlayList)
	end
	if ZQDM_DGPlayList ~= nil then
		ZQDM_LBPlayNum = table.getn(ZQDM_LBPlayList)
	end
	local ZQDM_DGNum = table.getn(ZhongQiuDengMi_DGLightTable)	
	local ZQDM_LBNum = table.getn(ZhongQiuDengMi_LBLightTable)		
	if Month == ZQMonth and Day <= ZQDay  then
		if Hour >= ZQStartTime and Hour < ZQEndTime then
			if	ZQDM_DGPlayNum <= 50	then
				ZQDM_DGLightNum = 50
			elseif	ZQDM_DGPlayNum > 50 and ZQDM_DGPlayNum < 100 then
					ZQDM_DGLightNum = ZQDM_DGPlayNum
			elseif	ZQDM_DGPlayNum >= 100 then
					ZQDM_DGLightNum = 100
			end		
			if	ZQDM_LBPlayNum <= 50 then
				ZQDM_LBLightNum = 50
			elseif	ZQDM_LBPlayNum > 50 and ZQDM_LBPlayNum < 100 then
					ZQDM_LBLightNum = ZQDM_LBPlayNum
			elseif	ZQDM_LBPlayNum >= 100 then
					ZQDM_LBLightNum = 100
			end		
			for i = 1,ZQDM_DGLightNum do
				local x,y
				local Num = 0
				Num = Num + 1
				x = math.random(DGx1,DGx2)
				y = math.random(DGy1,DGy2)
				if not API_IsBlockTile(DGMapID,x,y,0) then
					local FastID = API_CreateMonster(DGMapID,12198,x,y,4,0,-1)
					API_SetMonsterName(FastID, '谜题灯笼', 1)
					table.insert(ZhongQiuDengMi_DGLightTable,FastID)
				end
			end
			for i = 1,ZQDM_LBLightNum do
				local x,y
				local Num = 0
				Num = Num + 1
				x = math.random(LBx1,LBx2)
				y = math.random(LBy1,LBy2)
				if not API_IsBlockTile(LBMapID,x,y,0) then
					local FastID = API_CreateMonsterEx(LBMapID,12198,x,y,4,0,-1,1)
					API_SetMonsterName(FastID, '谜题灯笼', 1)
					table.insert(ZhongQiuDengMi_LBLightTable,FastID)
				end
			end
		end
	end
end
--猜灯谜
function ZhongQiuDengMi_DLMove(ActorID,NPCID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ZQRedayTime = ZhongQiuDengMi_ActTime.RedayTime
	local ZQStartTime = ZhongQiuDengMi_ActTime.StartTime
	local ZQEndTime = ZhongQiuDengMi_ActTime.EndTime
	local ZQMonth = ZhongQiuDengMi_ActTime.Month
	local ZQDay = ZhongQiuDengMi_ActTime.Day
	local ActorID = ActorID or API_RequestGetActorID()
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local CampID =	API_GetActorCamp(ActorID)
	local Level = API_GetActorExpLevel(ActorID)
	local KongJian = API_ActorGetPackageSize(ActorID)
	local Name = API_GetActorName(ActorID)
	local ZQDM_XuanZe = API_RequestGetNumber(1)	
	local ZQDM_DTime = API_VarDataGetNumber(ActorID,0,19219)
	local ExploitL = API_GetActorExpLevel(ActorID)
	local expMax = API_GetExploitInfo(ExploitL,3)
	local expNow = API_GetActorCurExp(ActorID)	
	--判断当前时间清除玩家身上交互数据	
	local ZQDM_time = Year * 10000 + Month * 100 + Day
	local ZhongQiuDengMi_time= API_VarDataGetNumber(ActorID,1,19218) --记录知识达人活动时间
	local PlayYear = math.floor(ZhongQiuDengMi_time/10000)
	local PlayMonthDay = math.mod(ZhongQiuDengMi_time,10000)
	local PlayMonth = math.floor(PlayMonthDay/100)
	local PlayDay = math.mod(PlayMonthDay,100)
	if	Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
		API_VarDataSetNumber(ActorID,1,19216,0) --清除答对灯谜题目数量
	end
	local ZQDM_TrueNumber = API_VarDataGetNumber(ActorID,1,19216)		--获取玩家复赛答对题目数量
	if ZQDM_DTime > 0 then
		API_ActorSendMsg(ActorID,10,'你还需要'..ZQDM_DTime..'秒后才能继续答题')
		API_ResponseWrite('<br><text>中秋灯谜答题，你还需要'..ZQDM_DTime..'秒后才能继续答题。</text><br>')
		return
	end
	if API_GetMonsterID(NPCFastID) <= 0 then
		if	Hour >= ZQEndTime then	
			if	Day < ZQDay then 
				API_ActorSendMsg(ActorID,10,'今天灯谜活动已经结束，欢迎您明天再来参加。')
				API_ResponseWrite('<br><text>今天灯谜活动已经结束，欢迎您明天再来参加。</text><br>')
			elseif Day >= ZQDay then 			
				API_ActorSendMsg(ActorID,10,'中秋灯谜活动已经全部结束，感谢您在这七天里参与。')
				API_ResponseWrite('<br><text>中秋灯谜活动已经全部结束，感谢您在这七天里参与。</text><br>')	
			end	
		elseif 	Hour >= ZQStartTime and Hour	< ZQEndTime then
			API_ActorSendMsg(ActorID,10,'这个灯笼已经被人捷足先登，请找寻另外的灯笼猜谜。')
			API_ResponseWrite('<br><text>这个灯笼已经被人捷足先登，请找寻另外的灯笼猜谜。</text><br>')
		end
		return
	end
	local	MAPID = API_GetMonsterMap(NPCFastID)
	local	X = API_GetMonsterPosX(NPCFastID)
	local	Y = API_GetMonsterPosY(NPCFastID)
--获取现在是活动开始时间的第几天
	local Time = os.time() 
	local NowTime = os.date("*t", os.time()) 
	NowTime.year = MidAutumn_StartTime.Year 
	NowTime.month = MidAutumn_StartTime.Month 
	NowTime.day = MidAutumn_StartTime.Day 
	NowTime.hour = 0 
	NowTime.min = 0 
	NowTime.sec = 0 
	local StartTime = os.time(NowTime) 
	local Day = math.floor((Time - StartTime)/86400) + 1 
	if Day > ZQDay then
		Day = ZQDay
	elseif Day <= 0 then
		Day = 1
	end
	local ZQDM_YueBing = ZQDM_YueBingMuJu[math.random(1,Day)]
	local GoodsName = API_GetGoodsName(ZQDM_YueBing)	
	-- 玩家答对题目数量达到上限
	if  ZQDM_TrueNumber	>=  60 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>知识渊博的玩家，您今天已经答对了60个灯谜题目，请给别人一些表现的机会，欢迎您明天再来参加。</text><br>')
		API_ResponseWrite('<br><text>中秋灯谜活动将在国庆七天中连续举行，期待您的参与。</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
	if	ZQDM_XuanZe == 1	then
		API_DestroyMonster(NPCFastID)
		ZQDM_lightSC = ZQDM_lightSC + 1
		API_AddMagicToMap(MAPID,X,Y,255) 
		API_VarDataSetNumber(ActorID,1,19218,ZQDM_time)
		API_VarDataSetNumber(ActorID,1,19217,0)
		API_VarDataSetNumber(ActorID,0,19219,3)
		API_CreateTimerTrigger(ActorID,1,3,-1,'ZhongQiuDengMi_DLQueFunc')
		local ZQDM_STrue = API_RequestGetNumber(2)
		if  ZQDM_STrue == 1 then
			ZQDM_TrueNumber = ZQDM_TrueNumber + 1
			API_VarDataSetNumber(ActorID,1,19216,ZQDM_TrueNumber)
			--答对题目获得经验和金币奖励
			local SJBJiangLi = ZQDM_JLTable[Level].SJB * 50
			local JYJiangLi	= ZQDM_JLTable[Level].EXP * 50
			local DSJBJiangLi = math.floor(SJBJiangLi/1000000)
			local DJYJiangLi = math.floor(JYJiangLi/1000000)
			local GaiLv = math.random(1,100)			
			API_ActorAddExp(ActorID, DJYJiangLi, 2001, '灯谜奖励')
			API_ActorShoppingM_Add(ActorID, DSJBJiangLi, 2001, '灯谜奖励')	
			API_ActorSendMsg(ActorID, 8, '恭喜您答对本道题目，您将获得'..DJYJiangLi..'经验和'..DSJBJiangLi..'水晶币的奖励。')
			API_ResponseWrite('<br><text>恭喜您答对本道题目，您将获得'..DJYJiangLi..'经验和'..DSJBJiangLi..'水晶币的奖励。</text><br>')
			if  (95 < GaiLv and  GaiLv <= 100) and ZQDM_YueBingSX <= 300	then
				ZQDM_YueBingSX = ZQDM_YueBingSX + 1
				if  KongJian >= 1 then
					API_AddActorGoods(ActorID, ZQDM_YueBing, 1, '中秋灯谜特殊奖励')
					API_ActorSendMsg(ActorID, 8, '恭喜获得月神祝福，您将获得'..GoodsName..'的奖励。')
				else
					API_SendActorMail(ActorID, ZQDM_YueBing,1, '中秋灯谜奖励', '恭喜您在灯谜活动获取奖励。')
					API_ActorSendMsg(ActorID, 8, '恭喜获得月神祝福，获得'..GoodsName..'的奖励。物品已经发放到邮箱，请注意查收。')
					API_ResponseWrite('<br><text>恭喜获得月神祝福，您将获得'..GoodsName..'的奖励。</text><br>')
				end
			end	
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>很抱歉您答错本道题目，无法获得奖励，请您不要气馁，更多的奖励在等着您。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
		end
	else		
		local ZQDM_QuestionNo = math.random(table.getn(ZhongQiuDengMi_QuestionList)) --在问题表中随机取出问题序号					
		if	API_VarDataGetNumber(ActorID,1,19217) > 0 then					
			ZQDM_QuestionNo = API_VarDataGetNumber(ActorID,1,19217) --获取当前随机到的题目
		end
		local ZQDM_Question = ZhongQiuDengMi_QuestionList[ZQDM_QuestionNo]                 --取出当前问题序号所对应的问题
		if	ZQDM_Question == nil	then
			ZQDM_QuestionNo = 50
			ZQDM_Question = ZhongQiuDengMi_QuestionList[ZQDM_QuestionNo]
		end	
		API_VarDataSetNumber(ActorID,1,19217,ZQDM_QuestionNo)
		local Answer= ZhongQiuDengMi_TrueAnswerList[ZQDM_QuestionNo].TrueAnswer 	  --找出当前问题的对应答案
		local LinShi = {}
		for i = 1,table.getn(ZhongQiuDengMi_AnswerList[ZQDM_QuestionNo]) do
			LinShi[i] = ZhongQiuDengMi_AnswerList[ZQDM_QuestionNo][i]
		end
		LinShiBC = table.getn(LinShi)
		local LinShi2 = {}
		local TureDaAn = 1
		while LinShiBC > 0 do
			local XH = math.random(LinShiBC)
			LinShi2BC = table.getn(LinShi2)
			LinShi2[LinShi2BC+1] = LinShi[XH]
			LinShiBC = LinShiBC -1
			if LinShi[XH] == Answer then
				TrueDaAn = table.getn(LinShi2)
			end
			--删除LinShi表里面XH这一行
			table.remove(LinShi,XH)
		end
		--将LinShi2表里的内容展现给玩家看和选择
		API_ResponseWrite('<br><text>根据问题，选择一个正确答案。</text><br>')
		if	expNow	== expMax then
			API_ResponseWrite('<br><text color="255,255,255">您当前的经验已经达到储存上限，请及时处理，否则你将无法获得灯谜活动的经验添加。</text><br>')	
		end	
		API_ResponseWrite('<br><text>'..ZQDM_Question..'</text><br>')
		for i =1,table.getn(LinShi2) do
			local ABC = 0
			if	i == TrueDaAn then
				ABC = 1
			end
			API_ResponseWrite('<br><a href="ZhongQiuDengMi_DLMove?1=1&2='..ABC..'">'..i..'、'..LinShi2[i]..'</a><br>')
		end
	end
end
--时间判断	
function ZhongQiuDengMi_DLQueFunc(ActorID,b)
	if API_ActorIsOnline(ActorID) then 
		local Time = API_VarDataGetNumber(ActorID,0,19219)
		Time = Time -1
		API_VarDataSetNumber(ActorID,0,19219,Time)
	end
end
--上线判断																					 	                               
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'ZhongQiuDengMi_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'ZhongQiuDengMi_OnLogin') 
end
--切换地图后判断
local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'ZhongQiuDengMi_OnLogin' then
		OnLoginMapLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'ZhongQiuDengMi_OnLogin') 
end