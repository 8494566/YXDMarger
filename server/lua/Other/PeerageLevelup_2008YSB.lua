----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\PeerageLevelup.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2008-2-27
--版  本:	1.0
--描  述:	升级前判断和升级后处理
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2008-2-27
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 陈信宇
--日  期: 2008-11-3
--描  述: 增加部分等级升级条件
----------------------------------------------------------------------------------------------------------------------

--[[// 爵位提升以后跳个对话框，通知几个重要事项：（只能点按钮关的）
1. 可激活数量变化（大字醒目颜色提示）/可学英雄数量变化（醒目颜色）/新英雄可学
2. 可以穿什么装备了；（见数值体系设计.xls/各部件爵位限制）
3. 可以玩什么浮空岛/任务了；
4. 还有什么特殊好处，如果背包等；(不太重要的好处就算了)
5. 升下一级有什么好处；需要什么条件；
]]

GLOBAL_Exploit = {
[1] = {PeerageLevel = 1,PeerageShort = '公民',PeerageDepict = '十等公民',Food = 1,Medicine = 1,HeroStudy = 2,HeroActivation = 1,Item = {Armet=0,Corselet=1,Mantle=0,Necklace=0,Ring=0,Caestus=1,Glove=0,LegGuard=0,Shoes=0,Weapon=1},},
[2] = {PeerageLevel = 1,PeerageShort = '公民',PeerageDepict = '九等公民',Food = 1,Medicine = 1,HeroStudy = 3,HeroActivation = 1,Item = {Armet=0,Corselet=1,Mantle=0,Necklace=0,Ring=0,Caestus=1,Glove=0,LegGuard=1,Shoes=0,Weapon=1},},
[3] = {PeerageLevel = 1,PeerageShort = '公民',PeerageDepict = '八等公民',Food = 1,Medicine = 1,HeroStudy = 4,HeroActivation = 1,Item = {Armet=0,Corselet=1,Mantle=0,Necklace=0,Ring=0,Caestus=1,Glove=0,LegGuard=1,Shoes=1,Weapon=1},},
[4] = {PeerageLevel = 1,PeerageShort = '公民',PeerageDepict = '七等公民',Food = 1,Medicine = 1,HeroStudy = 5,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=0,Necklace=0,Ring=0,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[5] = {PeerageLevel = 1,PeerageShort = '公民',PeerageDepict = '六等公民',Food = 1,Medicine = 1,HeroStudy = 6,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=0,Necklace=1,Ring=0,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[6] = {PeerageLevel = 1,PeerageShort = '公民',PeerageDepict = '五等公民',Food = 1,Medicine = 1,HeroStudy = 6,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=0,Necklace=1,Ring=1,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[7] = {PeerageLevel = 1,PeerageShort = '公民',PeerageDepict = '四等公民',Food = 1,Medicine = 1,HeroStudy = 7,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=0,Necklace=1,Ring=1,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[8] = {PeerageLevel = 1,PeerageShort = '公民',PeerageDepict = '三等公民',Food = 1,Medicine = 1,HeroStudy = 7,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=0,Necklace=1,Ring=1,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[9] = {PeerageLevel = 1,PeerageShort = '公民',PeerageDepict = '二等公民',Food = 1,Medicine = 1,HeroStudy = 7,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=0,Necklace=1,Ring=1,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[10] = {PeerageLevel = 2,PeerageShort = '公民',PeerageDepict = '一等公民',Food = 1,Medicine = 1,HeroStudy = 7,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=1,Necklace=1,Ring=1,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[11] = {PeerageLevel = 2,PeerageShort = '男爵',PeerageDepict = '十等男爵',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=1,Corselet=2,Mantle=1,Necklace=1,Ring=1,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[12] = {PeerageLevel = 2,PeerageShort = '男爵',PeerageDepict = '九等男爵',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=1,Corselet=2,Mantle=1,Necklace=1,Ring=1,Caestus=2,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[13] = {PeerageLevel = 2,PeerageShort = '男爵',PeerageDepict = '八等男爵',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=1,Corselet=2,Mantle=1,Necklace=1,Ring=1,Caestus=2,Glove=1,LegGuard=2,Shoes=1,Weapon=1},},
[14] = {PeerageLevel = 2,PeerageShort = '男爵',PeerageDepict = '七等男爵',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=1,Ring=1,Caestus=2,Glove=1,LegGuard=2,Shoes=2,Weapon=1},},
[15] = {PeerageLevel = 2,PeerageShort = '男爵',PeerageDepict = '六等男爵',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=1,Ring=1,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=1},},
[16] = {PeerageLevel = 2,PeerageShort = '男爵',PeerageDepict = '五等男爵',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=2,Ring=1,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[17] = {PeerageLevel = 2,PeerageShort = '男爵',PeerageDepict = '四等男爵',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[18] = {PeerageLevel = 2,PeerageShort = '男爵',PeerageDepict = '三等男爵',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[19] = {PeerageLevel = 2,PeerageShort = '男爵',PeerageDepict = '二等男爵',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[20] = {PeerageLevel = 2,PeerageShort = '男爵',PeerageDepict = '一等男爵',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[21] = {PeerageLevel = 3,PeerageShort = '高级男爵',PeerageDepict = '五等高级男爵',Food = 3,Medicine = 2,HeroStudy = 9,HeroActivation = 2,Item = {Armet=2,Corselet=2,Mantle=2,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[22] = {PeerageLevel = 3,PeerageShort = '高级男爵',PeerageDepict = '四等高级男爵',Food = 3,Medicine = 2,HeroStudy = 9,HeroActivation = 2,Item = {Armet=2,Corselet=2,Mantle=2,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[23] = {PeerageLevel = 3,PeerageShort = '高级男爵',PeerageDepict = '三等高级男爵',Food = 3,Medicine = 2,HeroStudy = 9,HeroActivation = 2,Item = {Armet=2,Corselet=2,Mantle=2,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[24] = {PeerageLevel = 3,PeerageShort = '高级男爵',PeerageDepict = '二等高级男爵',Food = 3,Medicine = 2,HeroStudy = 9,HeroActivation = 2,Item = {Armet=2,Corselet=2,Mantle=2,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[25] = {PeerageLevel = 3,PeerageShort = '高级男爵',PeerageDepict = '一等高级男爵',Food = 3,Medicine = 2,HeroStudy = 9,HeroActivation = 2,Item = {Armet=2,Corselet=2,Mantle=2,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[26] = {PeerageLevel = 4,PeerageShort = '子爵',PeerageDepict = '十等子爵',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=2,Corselet=3,Mantle=2,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[27] = {PeerageLevel = 4,PeerageShort = '子爵',PeerageDepict = '九等子爵',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=2,Corselet=3,Mantle=2,Necklace=2,Ring=2,Caestus=3,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[28] = {PeerageLevel = 4,PeerageShort = '子爵',PeerageDepict = '八等子爵',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=2,Corselet=3,Mantle=2,Necklace=2,Ring=2,Caestus=3,Glove=2,LegGuard=3,Shoes=2,Weapon=2},},
[29] = {PeerageLevel = 4,PeerageShort = '子爵',PeerageDepict = '七等子爵',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=2,Ring=2,Caestus=3,Glove=2,LegGuard=3,Shoes=3,Weapon=2},},
[30] = {PeerageLevel = 4,PeerageShort = '子爵',PeerageDepict = '六等子爵',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=2,Ring=2,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=2},},
[31] = {PeerageLevel = 4,PeerageShort = '子爵',PeerageDepict = '五等子爵',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=3,Ring=2,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[32] = {PeerageLevel = 4,PeerageShort = '子爵',PeerageDepict = '四等子爵',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[33] = {PeerageLevel = 4,PeerageShort = '子爵',PeerageDepict = '三等子爵',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[34] = {PeerageLevel = 4,PeerageShort = '子爵',PeerageDepict = '二等子爵',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[35] = {PeerageLevel = 4,PeerageShort = '子爵',PeerageDepict = '一等子爵',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[36] = {PeerageLevel = 5,PeerageShort = '高级子爵',PeerageDepict = '五等高级子爵',Food = 5,Medicine = 3,HeroStudy = 11,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[37] = {PeerageLevel = 5,PeerageShort = '高级子爵',PeerageDepict = '四等高级子爵',Food = 5,Medicine = 3,HeroStudy = 11,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[38] = {PeerageLevel = 5,PeerageShort = '高级子爵',PeerageDepict = '三等高级子爵',Food = 5,Medicine = 3,HeroStudy = 11,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[39] = {PeerageLevel = 5,PeerageShort = '高级子爵',PeerageDepict = '二等高级子爵',Food = 5,Medicine = 3,HeroStudy = 11,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[40] = {PeerageLevel = 5,PeerageShort = '高级子爵',PeerageDepict = '一等高级子爵',Food = 5,Medicine = 3,HeroStudy = 11,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[41] = {PeerageLevel = 6,PeerageShort = '伯爵',PeerageDepict = '十等伯爵',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[42] = {PeerageLevel = 6,PeerageShort = '伯爵',PeerageDepict = '九等伯爵',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[43] = {PeerageLevel = 6,PeerageShort = '伯爵',PeerageDepict = '八等伯爵',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[44] = {PeerageLevel = 6,PeerageShort = '伯爵',PeerageDepict = '七等伯爵',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[45] = {PeerageLevel = 6,PeerageShort = '伯爵',PeerageDepict = '六等伯爵',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[46] = {PeerageLevel = 6,PeerageShort = '伯爵',PeerageDepict = '五等伯爵',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[47] = {PeerageLevel = 6,PeerageShort = '伯爵',PeerageDepict = '四等伯爵',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[48] = {PeerageLevel = 6,PeerageShort = '伯爵',PeerageDepict = '三等伯爵',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[49] = {PeerageLevel = 6,PeerageShort = '伯爵',PeerageDepict = '二等伯爵',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[50] = {PeerageLevel = 6,PeerageShort = '伯爵',PeerageDepict = '一等伯爵',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[51] = {PeerageLevel = 7,PeerageShort = '高级伯爵',PeerageDepict = '五等高级伯爵',Food = 7,Medicine = 4,HeroStudy = 13,HeroActivation = 2,Item = {Armet=3,Corselet=4,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[52] = {PeerageLevel = 7,PeerageShort = '高级伯爵',PeerageDepict = '四等高级伯爵',Food = 7,Medicine = 4,HeroStudy = 13,HeroActivation = 2,Item = {Armet=3,Corselet=4,Mantle=3,Necklace=3,Ring=3,Caestus=4,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[53] = {PeerageLevel = 7,PeerageShort = '高级伯爵',PeerageDepict = '三等高级伯爵',Food = 7,Medicine = 4,HeroStudy = 13,HeroActivation = 2,Item = {Armet=3,Corselet=4,Mantle=3,Necklace=3,Ring=3,Caestus=4,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[54] = {PeerageLevel = 7,PeerageShort = '高级伯爵',PeerageDepict = '二等高级伯爵',Food = 7,Medicine = 4,HeroStudy = 13,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=3,Ring=3,Caestus=4,Glove=3,LegGuard=4,Shoes=4,Weapon=3},},
[55] = {PeerageLevel = 7,PeerageShort = '高级伯爵',PeerageDepict = '一等高级伯爵',Food = 7,Medicine = 4,HeroStudy = 13,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=3,Ring=3,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=3},},
[56] = {PeerageLevel = 8,PeerageShort = '侯爵',PeerageDepict = '十等侯爵',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=4,Ring=3,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[57] = {PeerageLevel = 8,PeerageShort = '侯爵',PeerageDepict = '九等侯爵',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[58] = {PeerageLevel = 8,PeerageShort = '侯爵',PeerageDepict = '八等侯爵',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[59] = {PeerageLevel = 8,PeerageShort = '侯爵',PeerageDepict = '七等侯爵',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[60] = {PeerageLevel = 8,PeerageShort = '侯爵',PeerageDepict = '六等侯爵',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[61] = {PeerageLevel = 8,PeerageShort = '侯爵',PeerageDepict = '五等侯爵',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=4,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[62] = {PeerageLevel = 8,PeerageShort = '侯爵',PeerageDepict = '四等侯爵',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=4,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[63] = {PeerageLevel = 8,PeerageShort = '侯爵',PeerageDepict = '三等侯爵',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=4,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[64] = {PeerageLevel = 8,PeerageShort = '侯爵',PeerageDepict = '二等侯爵',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=4,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[65] = {PeerageLevel = 8,PeerageShort = '侯爵',PeerageDepict = '一等侯爵',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=4,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[66] = {PeerageLevel = 9,PeerageShort = '高级侯爵',PeerageDepict = '五等高级侯爵',Food = 8,Medicine = 5,HeroStudy = 15,HeroActivation = 2,Item = {Armet=4,Corselet=5,Mantle=4,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[67] = {PeerageLevel = 9,PeerageShort = '高级侯爵',PeerageDepict = '四等高级侯爵',Food = 8,Medicine = 5,HeroStudy = 15,HeroActivation = 2,Item = {Armet=4,Corselet=5,Mantle=4,Necklace=4,Ring=4,Caestus=5,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[68] = {PeerageLevel = 9,PeerageShort = '高级侯爵',PeerageDepict = '三等高级侯爵',Food = 8,Medicine = 5,HeroStudy = 15,HeroActivation = 2,Item = {Armet=4,Corselet=5,Mantle=4,Necklace=4,Ring=4,Caestus=5,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[69] = {PeerageLevel = 9,PeerageShort = '高级侯爵',PeerageDepict = '二等高级侯爵',Food = 8,Medicine = 5,HeroStudy = 15,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=4,Ring=4,Caestus=5,Glove=4,LegGuard=5,Shoes=5,Weapon=4},},
[70] = {PeerageLevel = 9,PeerageShort = '高级侯爵',PeerageDepict = '一等高级侯爵',Food = 8,Medicine = 5,HeroStudy = 15,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=4,Ring=4,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=4},},
[71] = {PeerageLevel = 10,PeerageShort = '公爵',PeerageDepict = '十等公爵',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=5,Ring=4,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[72] = {PeerageLevel = 10,PeerageShort = '公爵',PeerageDepict = '九等公爵',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[73] = {PeerageLevel = 10,PeerageShort = '公爵',PeerageDepict = '八等公爵',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[74] = {PeerageLevel = 10,PeerageShort = '公爵',PeerageDepict = '七等公爵',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[75] = {PeerageLevel = 10,PeerageShort = '公爵',PeerageDepict = '六等公爵',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[76] = {PeerageLevel = 10,PeerageShort = '公爵',PeerageDepict = '五等公爵',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=5,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[77] = {PeerageLevel = 10,PeerageShort = '公爵',PeerageDepict = '四等公爵',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=5,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[78] = {PeerageLevel = 10,PeerageShort = '公爵',PeerageDepict = '三等公爵',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=5,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[79] = {PeerageLevel = 10,PeerageShort = '公爵',PeerageDepict = '二等公爵',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=5,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[80] = {PeerageLevel = 10,PeerageShort = '公爵',PeerageDepict = '一等公爵',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=5,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[81] = {PeerageLevel = 11,PeerageShort = '高级公爵',PeerageDepict = '五等高级公爵',Food = 8,Medicine = 6,HeroStudy = 17,HeroActivation = 2,Item = {Armet=5,Corselet=6,Mantle=5,Necklace=5,Ring=5,Caestus=6,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[82] = {PeerageLevel = 11,PeerageShort = '高级公爵',PeerageDepict = '四等高级公爵',Food = 8,Medicine = 6,HeroStudy = 17,HeroActivation = 2,Item = {Armet=5,Corselet=6,Mantle=5,Necklace=5,Ring=5,Caestus=6,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[83] = {PeerageLevel = 11,PeerageShort = '高级公爵',PeerageDepict = '三等高级公爵',Food = 8,Medicine = 6,HeroStudy = 17,HeroActivation = 2,Item = {Armet=5,Corselet=6,Mantle=5,Necklace=5,Ring=5,Caestus=6,Glove=5,LegGuard=6,Shoes=6,Weapon=5},},
[84] = {PeerageLevel = 11,PeerageShort = '高级公爵',PeerageDepict = '二等高级公爵',Food = 8,Medicine = 6,HeroStudy = 17,HeroActivation = 2,Item = {Armet=6,Corselet=6,Mantle=5,Necklace=5,Ring=5,Caestus=6,Glove=6,LegGuard=6,Shoes=6,Weapon=5},},
[85] = {PeerageLevel = 11,PeerageShort = '高级公爵',PeerageDepict = '一等高级公爵',Food = 8,Medicine = 6,HeroStudy = 17,HeroActivation = 2,Item = {Armet=6,Corselet=6,Mantle=6,Necklace=6,Ring=6,Caestus=6,Glove=6,LegGuard=6,Shoes=6,Weapon=6},},
}

GLOBAL_Skill_Hero = {
[1] = {HeroIcon='LUAUSE\\Hero\\剑圣.bmp',HeroName ='剑圣',HeroStudyLV=1,HeroSkillList={{SkillName='舞刃风暴',SkillIcon=40130},{SkillName='生命图腾',SkillIcon=40214},{SkillName='狂暴',SkillIcon=40205},{SkillName='八方斩',SkillIcon=40169},},SampleDesc='类型：物理攻击\n凯洛特是名攻守兼备的英雄，\n世界上再没有人的剑术比他\n更精妙。“剑圣”的称号也由\n此而来。',},
[2] = {HeroIcon='LUAUSE\\Hero\\火枪.bmp',HeroName ='枪神',HeroStudyLV=1,HeroSkillList={{SkillName='穿刺射击',SkillIcon=40016},{SkillName='爆头',SkillIcon=40172},{SkillName='突击射击',SkillIcon=40220},{SkillName='狙击',SkillIcon=40067},},SampleDesc='类型：火药攻击\n卡森曼被誉为枪械大师，他\n超强的好视力和对于射程的\n掌控使他能轻易射杀超远处\n的敌人。他的绰号就叫“火枪”。',},
[3] = {HeroIcon='LUAUSE\\Hero\\冰女.bmp',HeroName ='火女',HeroStudyLV=1,HeroSkillList={{SkillName='冲击波',SkillIcon=40175},{SkillName='火龙息',SkillIcon=40070},{SkillName='极限速度',SkillIcon=40196},{SkillName='冰峰',SkillIcon=40001},},SampleDesc='类型：魔法攻击\n蒂娅的火魔法有最正统的传\n承，她的法术能爆发出强大\n的威力。虽然外表温和，但\n没人敢于尝试挑起她的怒火\n。她被称为“火女”。',},
[4] = {HeroIcon='LUAUSE\\Hero\\地雷.bmp',HeroName ='博士',HeroStudyLV=1,HeroSkillList={{SkillName='魔法地雷',SkillIcon=40076},{SkillName='自杀攻击',SkillIcon=40241},{SkillName='眩晕陷阱',SkillIcon=40040},{SkillName='遥控地雷',SkillIcon=40037},},SampleDesc='类型：魔法,火药\n特林布博士不愧是最阴险的\n工程师，他总是让人吃尽苦\n头，再用他的地雷把对手炸\n上天。他的外号叫“地雷”。',},
[5] = {HeroIcon='LUAUSE\\Hero\\刺客.bmp',HeroName ='刺客',HeroStudyLV=12,HeroSkillList={{SkillName='闪烁攻击',SkillIcon=40211},{SkillName='真空刺',SkillIcon=40148},{SkillName='烟幕',SkillIcon=40223},{SkillName='潜行',SkillIcon=40097},},SampleDesc='类型：物理攻击\n米娜是最一流的杀手，她总\n是在弥漫的烟雾中潜行到敌\n人身后送上致命一击。人称\n“刺客”。',},
[6] = {HeroIcon='LUAUSE\\Hero\\龙战.bmp',HeroName ='龙战',HeroStudyLV=2,HeroSkillList={{SkillName='风之刃',SkillIcon=40184},{SkillName='凝神',SkillIcon=40208},{SkillName='风暴锤',SkillIcon=40160},{SkillName='真龙形态',SkillIcon=40229},},SampleDesc='类型：魔法,物理\n“龙战”是鲁鲁皮斯的绰号。\n这名驾御火龙的英雄能与巨\n龙对话，并借助其远古的魔\n法来增强自己的力量。',},
[7] = {HeroIcon='LUAUSE\\Hero\\毒蛇.bmp',HeroName ='毒蛇',HeroStudyLV=3,HeroSkillList={{SkillName='寒流',SkillIcon=40187},{SkillName='变形术',SkillIcon=40145},{SkillName='挟持',SkillIcon=40133},{SkillName='恶魔守卫',SkillIcon=40124},},SampleDesc='类型：魔法攻击\n维克能借助自然之力重创对\n手，强大的控制能力是他最\n难缠的地方。很多被他收拾\n过的人给他起了“毒蛇”的外\n号。',},
[8] = {HeroIcon='LUAUSE\\Hero\\屠夫.bmp',HeroName ='屠夫',HeroStudyLV=11,HeroSkillList={{SkillName='恶魔之手',SkillIcon=40028},{SkillName='恶魔赦令',SkillIcon=40181},{SkillName='晶体皮肤',SkillIcon=40199},{SkillName='肢解',SkillIcon=40232},},SampleDesc='类型：物理攻击\n玛哈玛哈是只极其危险的怪\n兽，激怒了他的人会被这家\n伙活活肢解。称他为“屠夫”\n一点都不过分。',},
[9] = {HeroIcon='LUAUSE\\Hero\\兽王.bmp',HeroName ='兽王',HeroStudyLV=4,HeroSkillList={{SkillName='召唤熊灵',SkillIcon=40226},{SkillName='厚皮术',SkillIcon=40190},{SkillName='自然迅捷',SkillIcon=40238},{SkillName='巨熊形态',SkillIcon=40202},},SampleDesc='类型：物理攻击\n雷宾拥有召唤熊群的自然之\n力。当他化身为巨熊的时候\n，他野蛮的力量能碾碎一切\n。因此他也被称为“兽王”。',},
[10] = {HeroIcon='LUAUSE\\Hero\\牛头怪罗格纳修.bmp',HeroName ='恶鬼',HeroStudyLV=7,HeroSkillList={{SkillName='大地之怒',SkillIcon=40178},{SkillName='灼烧',SkillIcon=40235},{SkillName='跳跃魔杀',SkillIcon=40217},{SkillName='辉耀',SkillIcon=40193},},SampleDesc='类型：火药攻击\n罗格纳修所到之处，灾难和\n毁灭便接踵而至。他带着黑\n暗地牢的腐朽力量尽情的杀\n戮。大家送给他“恶鬼”的外号。',},
[11] = {HeroIcon='LUAUSE\\Hero\\骑士.bmp',HeroName ='骑士',HeroStudyLV=21,HeroSkillList={{SkillName='洗礼',SkillIcon=40266},{SkillName='伤害吸收',SkillIcon=40109},{SkillName='重压光环',SkillIcon=40272},{SkillName='自然之助',SkillIcon=40278},},SampleDesc='类型：物理＋辅助\n米珈勒是神的仆人，他能用\n光明的力量驱散邪恶，也能\n借用神的意志提供强大的圣\n光治疗。大家都称他为\n“骑士”。',},
[12] = {HeroIcon='LUAUSE\\Hero\\月女.bmp',HeroName ='月女',HeroStudyLV=5,HeroSkillList={{SkillName='星暴',SkillIcon=40136},{SkillName='流矢',SkillIcon=40257},{SkillName='闪现',SkillIcon=40106},{SkillName='隐身光环',SkillIcon=40269},},SampleDesc='类型：火药攻击\n星月的魔力让瓦露西拥有超\n凡的美丽和呼唤群星的魔力\n。此外她更是帝国历史上最\n强大的射手。大家都称她为\n“月女”。',},
[13] = {HeroIcon='LUAUSE\\Hero\\巨龙.bmp',HeroName ='黑龙',HeroStudyLV=6,HeroSkillList={{SkillName='双重吐息',SkillIcon=40260},{SkillName='自动之火',SkillIcon=40275},{SkillName='冰封路径',SkillIcon=40251},{SkillName='万火焚身',SkillIcon=40244},},SampleDesc='类型：魔法攻击\n卡巴司从炼狱般可怕的火山\n冰原中汲取到冰与火的神力\n，他强大的魔力庇护着古老\n神秘的龙族。他被人称为\n“黑龙”。',},
[14] = {HeroIcon='LUAUSE\\Hero\\剧毒.bmp',HeroName ='剧毒',HeroStudyLV=8,HeroSkillList={{SkillName='暗影之刃',SkillIcon=40248},{SkillName='涂毒',SkillIcon=40263},{SkillName='瘟疫守卫',SkillIcon=40037},{SkillName='剧毒新星',SkillIcon=40254},},SampleDesc='类型：魔法攻击\n希思麦戈吞食了世界上所有\n的剧毒生物，将自己的身体\n变成一个大毒瓶。他的施毒\n手段隐蔽而残忍，大家叫他\n“剧毒”。',},

}

GLOBAL_PeerageName={[1]='公民',[2]='男爵',[3]='高级男爵',[4]='子爵',[5]='高级子爵',[6]='伯爵',[7]='高级伯爵',[8]='侯爵',[9]='高级侯爵',[10]='公爵',[11]='高级公爵',}

GLOBAL_PeerageMinLevel = {[1]=1,[2]=11,[3]=21,[4]=26,[5]=36,[6]=41,[7]=51,[8]=56,[9]=66,[10]=71,[11]=81,}
GLOBAL_PeerageMaxLevel = {[1]=10,[2]=20,[3]=25,[4]=35,[5]=40,[6]=50,[7]=55,[8]=65,[9]=70,[10]=80,[11]=85,}

function Tip_OnUpgrade(ActorID)
	local Level = API_GetActorExpLevel(ActorID)
	if GLOBAL_Exploit[Level] ~= nil then
		local LevelTable = GLOBAL_Exploit[Level]
		local LastLevelTable = GLOBAL_Exploit[Level-1]
		local NextLevelTable = GLOBAL_Exploit[Level+1]
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="550,120,430,510" balpha="0"></win>')
		local PeerageDepict = LevelTable.PeerageDepict
		local PeerageLen = string.len(PeerageDepict)
		if PeerageLen > 9 then
			API_ResponseWrite('<text Size="60" color="255,255,0">'..PeerageDepict..'</text><br>')
		else
			API_ResponseWrite('<text Size="60" color="255,255,0">  '..PeerageDepict..'</text><br>')
		end
		for i = 1,5 do 
			API_ResponseWrite('<img src="LUAUSE\\新鲜.tga">')
		end
		API_ResponseWrite('<br><text Size="20">恭喜阁下爵位提升，通过本次升级您得到以下特权：</text><br>')
		local StudyHero = {}
		for i = 1,table.getn(GLOBAL_Skill_Hero) do
			if GLOBAL_Skill_Hero[i].HeroStudyLV == Level then
				local StudyNum = table.getn(StudyHero) + 1
				StudyHero[StudyNum] = i
			end
		end
		local StudyNum = table.getn(StudyHero)
		if StudyNum == 1 then
			API_ResponseWrite('<text>                         </text>')
		elseif StudyNum > 1 then
			API_ResponseWrite('<text>                     </text>')
		end
		for i = 1,StudyNum do
			local HeroID = StudyHero[i]
			local HeroIcon = GLOBAL_Skill_Hero[HeroID].HeroIcon
			local HeroSkillList = GLOBAL_Skill_Hero[HeroID].HeroSkillList
			local HeroSkill1Icon = HeroSkillList[1].SkillIcon
			local HeroSkill1Name = HeroSkillList[1].SkillName
			local HeroSkill2Icon = HeroSkillList[2].SkillIcon
			local HeroSkill2Name = HeroSkillList[2].SkillName
			local HeroSkill3Icon = HeroSkillList[3].SkillIcon
			local HeroSkill3Name = HeroSkillList[3].SkillName
			local HeroSkill4Icon = HeroSkillList[4].SkillIcon
			local HeroSkill4Name = HeroSkillList[4].SkillName
			API_ResponseWrite('<img src="'..HeroIcon..'" tip="英雄技能：\n<img sc=\''..HeroSkill1Icon..'\' frame=\'1\' Delay=\'200\' type=\'2\'>'..HeroSkill1Name..'\n<img sc=\''..HeroSkill2Icon..'\' frame=\'1\' Delay=\'200\' type=\'2\'>'..HeroSkill2Name..'\n<img sc=\''..HeroSkill3Icon..'\' frame=\'1\' Delay=\'200\' type=\'2\'>'..HeroSkill3Name..'\n<img sc=\''..HeroSkill4Icon..'\' frame=\'1\' Delay=\'200\' type=\'2\'>'..HeroSkill4Name..'">')
			API_ResponseWrite('<text> </text>')
		end
		API_ResponseWrite('<br>')
		if StudyNum >= 1 then
			API_ResponseWrite('<text Size="20" color="255,100,100">可以获得新英雄 </text>')
			for i = 1,StudyNum do
				local HeroID = StudyHero[i]
				local HeroName = GLOBAL_Skill_Hero[HeroID].HeroName
				local SampleDesc = GLOBAL_Skill_Hero[HeroID].SampleDesc
				if i > 1 then
					API_ResponseWrite('<text Size="20" color="255,100,100">和</text>')
				end
				API_ResponseWrite('<a Size="30" color="255,255,100" bold="1" underline="1" tip="'..SampleDesc..'" closewindow="0">'..HeroName..'</a>')
			end
			API_ResponseWrite('<text Size="20" color="255,100,100"> 的传承</text><br>')
		end
		
		local SkillLV = 1 + math.floor((Level-1)/5)
		
		local HeroStudy = LevelTable.HeroStudy
		local HeroActivation = LevelTable.HeroActivation
		
		local Food = LevelTable.Food
		local Medicine = LevelTable.Medicine
		
		local Item = LevelTable.Item
		
		local Armet = Item.Armet
		local Corselet = Item.Corselet
		local Mantle = Item.Mantle
		local Necklace = Item.Necklace
		local Ring = Item.Ring
		local Caestus = Item.Caestus
		local Glove = Item.Glove
		local LegGuard = Item.LegGuard
		local Shoes = Item.Shoes
		local Weapon = Item.Weapon
		
		local LastSkillLV = 1 + math.floor((Level-2)/5)
		local LastHeroStudy = HeroStudy
		local LastHeroActivation = HeroActivation
		local LastFood = Food
		local LastMedicine = Medicine
		local LastArmet = Armet
		local LastCorselet = Corselet
		local LastMantle = Mantle
		local LastNecklace = Necklace
		local LastRing = Ring
		local LastCaestus = Caestus
		local LastGlove = Glove
		local LastLegGuard = LegGuard
		local LastShoes = Shoes
		local LastWeapon = Weapon
		
		local NextSkillLV = 1 + math.floor((Level)/5)
		local NextHeroStudy = HeroStudy
		local NextHeroActivation = HeroActivation
		local NextFood = Food
		local NextMedicine = Medicine
		local NextArmet = Armet
		local NextCorselet = Corselet
		local NextMantle = Mantle
		local NextNecklace = Necklace
		local NextRing = Ring
		local NextCaestus = Caestus
		local NextGlove = Glove
		local NextLegGuard = LegGuard
		local NextShoes = Shoes
		local NextWeapon = Weapon
		
		if LastLevelTable ~= nil then
			LastHeroStudy = LastLevelTable.HeroStudy
			LastHeroActivation = LastLevelTable.HeroActivation
			
			LastFood = LastLevelTable.Food
			LastMedicine = LastLevelTable.Medicine
			
			local LastItem = LastLevelTable.Item
			
			LastArmet = LastItem.Armet
			LastCorselet = LastItem.Corselet
			LastMantle = LastItem.Mantle
			LastNecklace = LastItem.Necklace
			LastRing = LastItem.Ring
			LastCaestus = LastItem.Caestus
			LastGlove = LastItem.Glove
			LastLegGuard = LastItem.LegGuard
			LastShoes = LastItem.Shoes
			LastWeapon = LastItem.Weapon
			
			API_ResponseWrite('<text Size="25"></text>')
			if SkillLV ~= LastSkillLV then
				local SkillLVCN = PublicFun_ArabianNumberToChineseNumber(SkillLV)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">战斗技能等级允许提升到：'..SkillLVCN..'级</text>')
			end
			if HeroStudy ~= LastHeroStudy then
				local HeroStudyCN = PublicFun_ArabianNumberToChineseNumber(HeroStudy)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可同时掌握英雄数量增加到：'..HeroStudyCN..'个</text>')
			end
			if HeroActivation ~= LastHeroActivation then
				local HeroActivationCN = PublicFun_ArabianNumberToChineseNumber(HeroActivation)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可同时激活英雄数量增加到：'..HeroActivationCN..'个</text>')
			end
			if Food ~= LastFood then
				local FoodCN = PublicFun_ArabianNumberToChineseNumber(Food)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可食用食物档次提升为：'..FoodCN..'档</text>')
			end
			if Medicine ~= LastMedicine then
				local MedicineCN = PublicFun_ArabianNumberToChineseNumber(Medicine)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可服用药品档次提升为：'..MedicineCN..'档</text>')
			end
			if Armet ~= LastArmet then
				local ArmetCN = PublicFun_ArabianNumberToChineseNumber(Armet)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可穿戴帽子档次提升为：'..ArmetCN..'档</text>')
			end
			if Armet ~= LastArmet then
				local ArmetCN = PublicFun_ArabianNumberToChineseNumber(Armet)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可穿戴帽子档次提升为：'..ArmetCN..'档</text>')
			end
			if Corselet ~= LastCorselet then
				local CorseletCN = PublicFun_ArabianNumberToChineseNumber(Corselet)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可穿戴衣服档次提升为：'..CorseletCN..'档</text>')
			end
			if Mantle ~= LastMantle then
				local MantleCN = PublicFun_ArabianNumberToChineseNumber(Mantle)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可穿戴披风档次提升为：'..MantleCN..'档</text>')
			end
			if Necklace ~= LastNecklace then
				local NecklaceCN = PublicFun_ArabianNumberToChineseNumber(Necklace)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可穿戴项链档次提升为：'..NecklaceCN..'档</text>')
			end
			if Ring ~= LastRing then
				local RingCN = PublicFun_ArabianNumberToChineseNumber(Ring)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可穿戴戒指档次提升为：'..RingCN..'档</text>')
			end
			if Caestus ~= LastCaestus then
				local CaestusCN = PublicFun_ArabianNumberToChineseNumber(Caestus)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可穿戴腰带档次提升为：'..CaestusCN..'档</text>')
			end
			if Glove ~= LastGlove then
				local GloveCN = PublicFun_ArabianNumberToChineseNumber(Glove)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可穿戴手套档次提升为：'..GloveCN..'档</text>')
			end
			if LegGuard ~= LastLegGuard then
				local LegGuardCN = PublicFun_ArabianNumberToChineseNumber(LegGuard)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可穿戴裤子档次提升为：'..LegGuardCN..'档</text>')
			end
			if Shoes ~= LastShoes then
				local ShoesCN = PublicFun_ArabianNumberToChineseNumber(Shoes)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可穿戴鞋子档次提升为：'..ShoesCN..'档</text>')
			end
			if Weapon ~= LastWeapon then
				local WeaponCN = PublicFun_ArabianNumberToChineseNumber(Weapon)
				API_ResponseWrite('<br><text Size="20" color="255,0,255">可使用武器档次提升为：'..WeaponCN..'档</text>')
			end
		end
		if NextLevelTable ~= nil then
			API_ResponseWrite('<br><br><text Size="25">请再接再厉，在下一级爵位您还能获得更多好处：</text><br>')
			local StudyHero = {}
			for i = 1,table.getn(GLOBAL_Skill_Hero) do
				if GLOBAL_Skill_Hero[i].HeroStudyLV == Level + 1 then
					local StudyNum = table.getn(StudyHero) + 1
					StudyHero[StudyNum] = i
				end
			end
			local StudyNum = table.getn(StudyHero)
			if StudyNum == 1 then
				API_ResponseWrite('<text>                         </text>')
			elseif StudyNum > 1 then
				API_ResponseWrite('<text>                     </text>')
			end
			for i = 1,StudyNum do
				local HeroID = StudyHero[i]
				local HeroIcon = GLOBAL_Skill_Hero[HeroID].HeroIcon
				local HeroSkillList = GLOBAL_Skill_Hero[HeroID].HeroSkillList
				local HeroSkill1Icon = HeroSkillList[1].SkillIcon
				local HeroSkill1Name = HeroSkillList[1].SkillName
				local HeroSkill2Icon = HeroSkillList[2].SkillIcon
				local HeroSkill2Name = HeroSkillList[2].SkillName
				local HeroSkill3Icon = HeroSkillList[3].SkillIcon
				local HeroSkill3Name = HeroSkillList[3].SkillName
				local HeroSkill4Icon = HeroSkillList[4].SkillIcon
				local HeroSkill4Name = HeroSkillList[4].SkillName
				API_ResponseWrite('<img src="'..HeroIcon..'" tip="英雄技能：\n<img sc=\''..HeroSkill1Icon..'\' frame=\'1\' Delay=\'200\' type=\'2\'>'..HeroSkill1Name..'\n<img sc=\''..HeroSkill2Icon..'\' frame=\'1\' Delay=\'200\' type=\'2\'>'..HeroSkill2Name..'\n<img sc=\''..HeroSkill3Icon..'\' frame=\'1\' Delay=\'200\' type=\'2\'>'..HeroSkill3Name..'\n<img sc=\''..HeroSkill4Icon..'\' frame=\'1\' Delay=\'200\' type=\'2\'>'..HeroSkill4Name..'">')
				API_ResponseWrite('<text> </text>')
			end
			API_ResponseWrite('<br>')
			if StudyNum >= 1 then
				API_ResponseWrite('<text Size="20" color="255,100,100">下一级爵位可以获得新英雄 </text>')
				for i = 1,StudyNum do
					local HeroID = StudyHero[i]
					local HeroName = GLOBAL_Skill_Hero[HeroID].HeroName
					local SampleDesc = GLOBAL_Skill_Hero[HeroID].SampleDesc
					if i > 1 then
						API_ResponseWrite('<text Size="20" color="255,100,100">和</text>')
					end
					API_ResponseWrite('<a Size="30" color="255,255,100" bold="1" underline="1" tip="'..SampleDesc..'" closewindow="0">'..HeroName..'</a>')
				end
				API_ResponseWrite('<text Size="20" color="255,100,100"> 的传承</text><br>')
			end
			
			if NextLevelTable ~= nil then
				NextHeroStudy = NextLevelTable.HeroStudy
				NextHeroActivation = NextLevelTable.HeroActivation
				
				NextFood = NextLevelTable.Food
				NextMedicine = NextLevelTable.Medicine
				
				local NextItem = NextLevelTable.Item
				
				NextArmet = NextItem.Armet
				NextCorselet = NextItem.Corselet
				NextMantle = NextItem.Mantle
				NextNecklace = NextItem.Necklace
				NextRing = NextItem.Ring
				NextCaestus = NextItem.Caestus
				NextGlove = NextItem.Glove
				NextLegGuard = NextItem.LegGuard
				NextShoes = NextItem.Shoes
				NextWeapon = NextItem.Weapon
				
				if NextSkillLV ~= SkillLV then
					local NextSkillLVCN = PublicFun_ArabianNumberToChineseNumber(NextSkillLV)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位战斗技能等级允许提升到'..NextSkillLVCN..'级</text>')
				end
				if NextHeroStudy ~= HeroStudy then
					local NextHeroStudyCN = PublicFun_ArabianNumberToChineseNumber(NextHeroStudy)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可同时掌握'..NextHeroStudyCN..'个英雄</text>')
				end
				if NextHeroActivation ~= HeroActivation then
					local NextHeroActivationCN = PublicFun_ArabianNumberToChineseNumber(NextHeroActivation)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可同时激活'..NextHeroActivationCN..'个英雄</text>')
				end
				if NextFood ~= Food then
					local NextFoodCN = PublicFun_ArabianNumberToChineseNumber(NextFood)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可食用'..NextFoodCN..'档食物</text>')
				end
				if NextMedicine ~= Medicine then
					local NextMedicineCN = PublicFun_ArabianNumberToChineseNumber(NextMedicine)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可服用'..NextMedicineCN..'档药品</text>')
				end
				if NextArmet ~= Armet then
					local NextArmetCN = PublicFun_ArabianNumberToChineseNumber(NextArmet)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可穿戴'..NextArmetCN..'档帽子</text>')
				end
				if NextCorselet ~= Corselet then
					local NextCorseletCN = PublicFun_ArabianNumberToChineseNumber(NextCorselet)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可穿戴'..NextCorseletCN..'档衣服</text>')
				end
				if NextMantle ~= Mantle then
					local NextMantleCN = PublicFun_ArabianNumberToChineseNumber(NextMantle)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可穿戴'..NextMantleCN..'档披风</text>')
				end
				if NextNecklace ~= Necklace then
					local NextNecklaceCN = PublicFun_ArabianNumberToChineseNumber(NextNecklace)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可穿戴'..NextNecklaceCN..'档项链</text>')
				end
				if NextRing ~= Ring then
					local NextRingCN = PublicFun_ArabianNumberToChineseNumber(NextRing)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可穿戴'..NextRingCN..'档戒指</text>')
				end
				if NextCaestus ~= Caestus then
					local NextCaestusCN = PublicFun_ArabianNumberToChineseNumber(NextCaestus)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可穿戴'..NextCaestusCN..'档腰带</text>')
				end
				if NextGlove ~= Glove then
					local NextGloveCN = PublicFun_ArabianNumberToChineseNumber(NextGlove)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可穿戴'..NextGloveCN..'档手套</text>')
				end
				if NextLegGuard ~= LegGuard then
					local NextLegGuardCN = PublicFun_ArabianNumberToChineseNumber(NextLegGuard)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可穿戴'..NextLegGuardCN..'档裤子</text>')
				end
				if NextShoes ~= Shoes then
					local NextShoesCN = PublicFun_ArabianNumberToChineseNumber(NextShoes)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可穿戴'..NextShoesCN..'档鞋子</text>')
				end
				if NextWeapon ~= Weapon then
					local NextWeaponCN = PublicFun_ArabianNumberToChineseNumber(NextWeapon)
					API_ResponseWrite('<br><text Size="20" color="255,255,0">下一级爵位可使用'..NextWeaponCN..'档武器</text>')
				end
			end
		end
	end
end

GLOBAL_VerdictLevelUp = {
--[[
--男爵升高级男爵条件
--[20] = {NeedPVEMedal={Peerage=2,LV=1,Num=2,},NeedPVPMedal={Peerage=2,LV=1,Num=3,},},
--高级男爵升子爵条件
[25] = {NeedPVEMedal={Peerage=3,LV=1,Num=3,},NeedPVPMedal={Peerage=2,LV=2,Num=3,},},
--子爵升高级子爵条件
[35] = {NeedPVEMedal={Peerage=4,LV=1,Num=4,},NeedPVPMedal={Peerage=4,LV=2,Num=4,},},
--高级子爵升伯爵条件
[40] = {NeedPVEMedal={Peerage=5,LV=1,Num=5,},NeedPVPMedal={Peerage=4,LV=2,Num=5,},},
--伯爵升高级伯爵条件
[50] = {NeedPVEMedal={Peerage=6,LV=1,Num=6,},NeedPVPMedal={Peerage=6,LV=2,Num=6,},},
--高级伯爵升侯爵条件
[55] = {NeedPVEMedal={Peerage=7,LV=1,Num=7,},NeedPVPMedal={Peerage=6,LV=2,Num=7,},},
--侯爵升高级侯爵条件
[65] = {NeedPVEMedal={Peerage=8,LV=1,Num=8,},NeedPVPMedal={Peerage=8,LV=2,Num=8,},},
--高级侯爵升公爵条件
[70] = {NeedPVEMedal={Peerage=9,LV=1,Num=9,},NeedPVPMedal={Peerage=8,LV=2,Num=9,},},
--公爵升高级公爵条件
[80] = {NeedPVEMedal={Peerage=10,LV=1,Num=10,},NeedPVPMedal={Peerage=10,LV=2,Num=10,},},
]]
}


GLOBAL_WorkSkillList = {5,7,12,13,14,15,16,17,18,19,20,21,27,}



LevelUpTiaoJian_Table = {
[2] = {WuLiZhuangBeiTJ1 = 20008,WuLiZhuangBeiTJ2 = 4400,WuLiZhuangBeiTJ3 = 20006,WuLiZhuangBeiTJ4 = 4300,HuoYaoZhuangBeiTJ1 = 20020,HuoYaoZhuangBeiTJ2 = 5400,HuoYaoZhuangBeiTJ3 = 20018,HuoYaoZhuangBeiTJ4 = 5300,MoFaZhuangBeiTJ1 = 20030,MoFaZhuangBeiTJ2 = 6400,MoFaZhuangBeiTJ3 = 20028,MoFaZhuangBeiTJ4 = 6300,HPTJ = 0,GongJiTJ = 0,FangYuTJ = 0,},
[3] = {WuLiZhuangBeiTJ1 = 20009,WuLiZhuangBeiTJ2 = 4500,WuLiZhuangBeiTJ3 = 0,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 20021,HuoYaoZhuangBeiTJ2 = 5500,HuoYaoZhuangBeiTJ3 = 0,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 20031,MoFaZhuangBeiTJ2 = 6500,MoFaZhuangBeiTJ3 = 0,MoFaZhuangBeiTJ4 = 0,HPTJ = 0,GongJiTJ = 0,},
[4] = {WuLiZhuangBeiTJ1 = 20007,WuLiZhuangBeiTJ2 = 4200,WuLiZhuangBeiTJ3 = 20001,WuLiZhuangBeiTJ4 = 4000,HuoYaoZhuangBeiTJ1 = 20019,HuoYaoZhuangBeiTJ2 = 5200,HuoYaoZhuangBeiTJ3 = 20013,HuoYaoZhuangBeiTJ4 = 5000,MoFaZhuangBeiTJ1 = 20029,MoFaZhuangBeiTJ2 = 6200,MoFaZhuangBeiTJ3 = 20023,MoFaZhuangBeiTJ4 = 6000,HPTJ = 0,GongJiTJ = 0,FangYuTJ = 0,},
[5] = {WuLiZhuangBeiTJ1 = 20004,WuLiZhuangBeiTJ2 = 6900,WuLiZhuangBeiTJ3 = 0,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 20016,HuoYaoZhuangBeiTJ2 = 7000,HuoYaoZhuangBeiTJ3 = 0,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 20026,MoFaZhuangBeiTJ2 = 8000,MoFaZhuangBeiTJ3 = 0,MoFaZhuangBeiTJ4 = 0,HPTJ = 0,GongJiTJ = 0,FangYuTJ = 0,},
[6] = {WuLiZhuangBeiTJ1 = 20005,WuLiZhuangBeiTJ2 = 8100,WuLiZhuangBeiTJ3 = 0,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 20017,HuoYaoZhuangBeiTJ2 = 8200,HuoYaoZhuangBeiTJ3 = 0,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 20027,MoFaZhuangBeiTJ2 = 8300,MoFaZhuangBeiTJ3 = 0,MoFaZhuangBeiTJ4 = 0,HPTJ = 0,GongJiTJ = 0,FangYuTJ = 0,},
[10] = {WuLiZhuangBeiTJ1 = 20003,WuLiZhuangBeiTJ2 = 6600,WuLiZhuangBeiTJ3 = 0,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 20015,HuoYaoZhuangBeiTJ2 = 6700,HuoYaoZhuangBeiTJ3 = 0,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 20025,MoFaZhuangBeiTJ2 = 6800,MoFaZhuangBeiTJ3 = 0,MoFaZhuangBeiTJ4 = 0,HPTJ = 0,GongJiTJ = 0,FangYuTJ = 0,},
[11] = {WuLiZhuangBeiTJ1 = 4101,WuLiZhuangBeiTJ2 = 0,WuLiZhuangBeiTJ3 = 0,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 5101,HuoYaoZhuangBeiTJ2 = 0,HuoYaoZhuangBeiTJ3 = 0,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 6101,MoFaZhuangBeiTJ2 = 0,MoFaZhuangBeiTJ3 = 0,MoFaZhuangBeiTJ4 = 0,HPTJ = 0,GongJiTJ = 0,FangYuTJ = 0,},
[12] = {WuLiZhuangBeiTJ1 = 4301,WuLiZhuangBeiTJ2 = 0,WuLiZhuangBeiTJ3 = 0,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 5301,HuoYaoZhuangBeiTJ2 = 0,HuoYaoZhuangBeiTJ3 = 0,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 6301,MoFaZhuangBeiTJ2 = 0,MoFaZhuangBeiTJ3 = 0,MoFaZhuangBeiTJ4 = 0,HPTJ = 0,GongJiTJ = 0,FangYuTJ = 0,},
[13] = {WuLiZhuangBeiTJ1 = 4401,WuLiZhuangBeiTJ2 = 0,WuLiZhuangBeiTJ3 = 0,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 5401,HuoYaoZhuangBeiTJ2 = 0,HuoYaoZhuangBeiTJ3 = 0,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 6401,MoFaZhuangBeiTJ2 = 0,MoFaZhuangBeiTJ3 = 0,MoFaZhuangBeiTJ4 = 0,HPTJ = 0,GongJiTJ = 0,FangYuTJ = 0,},
[14] = {WuLiZhuangBeiTJ1 = 4001,WuLiZhuangBeiTJ2 = 0,WuLiZhuangBeiTJ3 = 4501,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 5001,HuoYaoZhuangBeiTJ2 = 0,HuoYaoZhuangBeiTJ3 = 5501,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 6001,MoFaZhuangBeiTJ2 = 0,MoFaZhuangBeiTJ3 = 6501,MoFaZhuangBeiTJ4 = 0,HPTJ = 0,GongJiTJ = 0,FangYuTJ = 0,},
[15] = {WuLiZhuangBeiTJ1 = 4201,WuLiZhuangBeiTJ2 = 0,WuLiZhuangBeiTJ3 = 0,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 5201,HuoYaoZhuangBeiTJ2 = 0,HuoYaoZhuangBeiTJ3 = 0,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 6201,MoFaZhuangBeiTJ2 = 0,MoFaZhuangBeiTJ3 = 0,MoFaZhuangBeiTJ4 = 0,HPTJ = 1500,GongJiTJ = 80,FangYuTJ = 0,},
[16] = {WuLiZhuangBeiTJ1 = 2001,WuLiZhuangBeiTJ2 = 3001,WuLiZhuangBeiTJ3 = 6901,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 1501,HuoYaoZhuangBeiTJ2 = 7001,HuoYaoZhuangBeiTJ3 = 0,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 1001,MoFaZhuangBeiTJ2 = 8001,MoFaZhuangBeiTJ3 = 0,MoFaZhuangBeiTJ4 = 0,HPTJ = 0,GongJiTJ = 0,FangYuTJ = 0,},
[17] = {WuLiZhuangBeiTJ1 = 8101,WuLiZhuangBeiTJ2 = 0,WuLiZhuangBeiTJ3 = 0,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 8201,HuoYaoZhuangBeiTJ2 = 0,HuoYaoZhuangBeiTJ3 = 0,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 8301,MoFaZhuangBeiTJ2 = 0,MoFaZhuangBeiTJ3 = 0,MoFaZhuangBeiTJ4 = 0,HPTJ = 0,GongJiTJ = 0,FangYuTJ = 0,},
[21] = {WuLiZhuangBeiTJ1 = 6601,WuLiZhuangBeiTJ2 = 0,WuLiZhuangBeiTJ3 = 0,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 6701,HuoYaoZhuangBeiTJ2 = 0,HuoYaoZhuangBeiTJ3 = 0,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 6801,MoFaZhuangBeiTJ2 = 0,MoFaZhuangBeiTJ3 = 0,MoFaZhuangBeiTJ4 = 0,HPTJ = 0,GongJiTJ = 0,FangYuTJ = 0,},
[30] = {WuLiZhuangBeiTJ1 = 0,WuLiZhuangBeiTJ2 = 0,WuLiZhuangBeiTJ3 = 0,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 0,HuoYaoZhuangBeiTJ2 = 0,HuoYaoZhuangBeiTJ3 = 0,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 0,MoFaZhuangBeiTJ2 = 0,MoFaZhuangBeiTJ3 = 0,MoFaZhuangBeiTJ4 = 0,HPTJ = 3500,GongJiTJ = 150,FangYuTJ = 100,},
[35] = {WuLiZhuangBeiTJ1 = 0,WuLiZhuangBeiTJ2 = 0,WuLiZhuangBeiTJ3 = 0,WuLiZhuangBeiTJ4 = 0,HuoYaoZhuangBeiTJ1 = 0,HuoYaoZhuangBeiTJ2 = 0,HuoYaoZhuangBeiTJ3 = 0,HuoYaoZhuangBeiTJ4 = 0,MoFaZhuangBeiTJ1 = 0,MoFaZhuangBeiTJ2 = 0,MoFaZhuangBeiTJ3 = 0,MoFaZhuangBeiTJ4 = 0,HPTJ = 4000,GongJiTJ = 240,FangYuTJ = 110,},

}

function LevelUpTiaoJian()
	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 1 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>与新手商人对话，从他手里购买1档护腿并装备。（注意：你装备的是什么属性的英雄，穿同属性的装备战斗力会更强。例如装备火女英雄的玩家一般选择魔法护腿）</text><br><br>')
	elseif SelectItem == 2 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>与新手商人对话，从他手里购买1档腰带并装备。（注意：你装备的是什么属性的英雄，穿同属性的装备战斗力会更强。例如装备剑圣英雄的玩家一般选择物理近战腰带）</text><br><br>')
	elseif SelectItem == 3 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>与新手商人对话，从他手里购买1档鞋子并装备。（注意：你装备的是什么属性的英雄，穿同属性的装备战斗力会更强。例如装备枪神英雄的玩家一般选择火药鞋子）</text><br><br>')
	elseif SelectItem == 4 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>与新手商人对话，从他手里购买1档手套并装备。（注意：你装备的是什么属性的英雄，穿同属性的装备战斗力会更强。例如装备博士英雄的玩家一般选择火药手套）</text><br><br>')
	elseif SelectItem == 5 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>与新手商人对话，从他手里购买1档帽子并装备。（注意：你装备的是什么属性的英雄，穿同属性的装备战斗力会更强。例如装备龙战英雄的玩家一般选择火药帽子）</text><br><br>')
	elseif SelectItem == 6 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>与新手商人对话，从他手里购买1档项链并装备。（注意：你装备的是什么属性的英雄，穿同属性的装备战斗力会更强。例如装备毒蛇英雄的玩家一般选择魔法项链）</text><br><br>')
	elseif SelectItem == 7 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>与新手商人对话，从他手里购买1档戒指并装备。（注意：你装备的是什么属性的英雄，穿同属性的装备战斗力会更强。例如装备战魂英雄的玩家一般选择物理近战戒指）</text><br><br>')
	elseif SelectItem == 8 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>1.如果你只学习了一个英雄，请到主城的学院找战斗技能导师学习另一个英雄的技能。</text><br>')
		API_ResponseWrite('<text>2.每个英雄技能都有熟练度，只要你使用一次该技能，其熟练度就会增加。达到100点时即可升级技能，使其变得更有威力</text><br><br>')
	elseif SelectItem == 9 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>与新手商人对话，从他手里购买1档披风并装备。（注意：你装备的是什么属性的英雄，穿同属性的装备战斗力会更强。例如装备月女英雄的玩家一般选择火药披风）</text><br><br>')
	elseif SelectItem == 10 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>按T打开交易所，搜索对应属性的2档衣服，浏览它们的属性与价格的高低，购买物美价廉的2档衣服穿在身上</text><br><br>')
	elseif SelectItem == 11 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>按T打开交易所，搜索对应属性的2档腰带，浏览它们的属性与价格的高低，购买物美价廉的2档腰带穿在身上</text><br><br>')
	elseif SelectItem == 12 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>按T打开交易所，搜索对应属性的2档护腿，浏览它们的属性与价格的高低，购买物美价廉的2档护腿穿在身上</text><br><br>')
	elseif SelectItem == 13 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>按T打开交易所，搜索对应属性的2档帽子，浏览它们的属性与价格的高低，购买物美价廉的2档帽子穿在身上</text><br><br>')
	elseif SelectItem == 14 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>按T打开交易所，搜索对应属性的2档鞋子，浏览它们的属性与价格的高低，购买物美价廉的2档帽子穿在身上</text><br><br>')
	elseif SelectItem == 15 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>按T打开交易所，搜索对应属性的2档鞋子，浏览它们的属性与价格的高低，购买物美价廉的2档手套穿在身上</text><br><br>')
	elseif SelectItem == 16 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>1.如果你只学习了一个英雄，请到主城的学院找战斗技能导师学习另一个英雄的技能</text><br>')
		API_ResponseWrite('<text>2.每个英雄技能都有熟练度，只要你使用该技能，就会提升熟练度。达到100%时即可升级技能，使其变得更有威力</text><br><br>')
	elseif SelectItem == 17 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>去交易所购买配方，去资源采集区采集资源，将至少1个加工系生活技能提高到5级</text><br><br>')
	elseif SelectItem == 18 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>衣服，裤子，手套，鞋子，项链都可以为您增加生命值，如果您的HP总量没有达到1500点，请将您身上穿戴的衣服，裤子，手套，鞋子，项链的质量再提高一些</text><br><br>')
	elseif SelectItem == 19 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>武器，帽子，披风，衣服都可以为您增加攻击力。如果您的攻击力没达到80点，请将您身上穿戴的武器，帽子，披风，衣服的质量再提高一些</text><br><br>')
	elseif SelectItem == 20 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>在公民空间传送塔内，与拉锯战浮空岛的传送门对话参加战争时可以查看到自己打过的次数，达到10次即完成条件</text><br><br>')
	elseif SelectItem == 21 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>按T打开交易所，搜索对应属性的2档武器，浏览它们的属性与价格的高低，购买物美价廉的2档武器穿在身上</text><br><br>')
	elseif SelectItem == 22 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>按T打开交易所，搜索对应属性的2档项链，浏览它们的属性与价格的高低，购买物美价廉的2档项链穿在身上</text><br><br>')
	elseif SelectItem == 23 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>按S打开英雄和技能列表，在技能槽里同时装备上2个不同英雄的技能</text><br><br>')
	elseif SelectItem == 24 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>按T打开交易所，搜索对应属性的2档戒指，浏览它们的属性与价格的高低，购买物美价廉的2档戒指穿在身上</text><br><br>')
	elseif SelectItem == 25 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>按T打开交易所，搜索对应属性的2档披风，浏览它们的属性与价格的高低，购买物美价廉的2档披风穿在身上</text><br><br>')
	elseif SelectItem == 26 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>去交易所购买配方，去资源采集区采集资源，将至少1个加工系生活技能提高到9级</text><br><br>')
	elseif SelectItem == 27 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>每个英雄技能都有熟练度，只要你使用该技能，就会提升熟练度。达到100%时即可升级技能，使其变得更有威力</text><br><br>')
	elseif SelectItem == 28 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>衣服，裤子，手套，鞋子，项链都可以为您增加生命值，如果您的HP总量没有达到3500点，请将您身上穿戴的衣服，裤子，手套，鞋子，项链的质量再提高一些</text><br><br>')
	elseif SelectItem == 29 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>武器，帽子，披风，衣服都可以为您增加攻击力。如果您的攻击力没达到150点，请将您身上穿戴的武器，帽子，披风，衣服的质量再提高一些</text><br><br>')
	elseif SelectItem == 30 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>除了戒指和武器，几乎全部的装备都可以为您增加某种类型的防御力</text><br><br>')
	elseif SelectItem == 31 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>去交易所购买配方，去资源采集区采集资源，将至少1个加工系生活技能提高到12级</text><br><br>')
	elseif SelectItem == 32 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>每个英雄技能都有熟练度，只要你使用该技能，就会提升熟练度。达到100%时即可升级技能，使其变得更有威力</text><br><br>')
	elseif SelectItem == 33 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>衣服，裤子，手套，鞋子，项链都可以为您增加生命值，如果您的HP总量没有达到4000点，请将您身上穿戴的衣服，裤子，手套，鞋子，项链的质量再提高一些</text><br><br>')
	elseif SelectItem == 34 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>武器，帽子，披风，衣服都可以为您增加攻击力。如果您的攻击力没达到240点，请将您身上穿戴的武器，帽子，披风，衣服的质量再提高一些</text><br><br>')
	elseif SelectItem == 35 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>除了戒指和武器，几乎全部的装备都可以为您增加某种类型的防御力</text><br><br>')
	elseif SelectItem == 36 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,400,150"></win>')
		API_ResponseWrite('<text>去各种浮空岛战斗都可获得浮空岛声望，在浮空岛传送门处可查询当前声望值</text><br><br>')
	end
	API_ResponseWrite('<a href="VerdictLevelUpQualification">返回</a>')
end

function VerdictLevelUpQualification(ActorID,nExploitL)
	ActorID = ActorID or API_RequestGetActorID()
	nExploitL = nExploitL or API_GetActorExpLevel(ActorID)
	local FuKongDaoShengWang = API_VarDataGetNumber(ActorID,1,GLOBAL_FuKongDaoShengWang)
	local NeedFuKongDaoShengWang = 0 
	if nExploitL == 25 then
		--高男升级子爵
		NeedFuKongDaoShengWang = 408
	elseif nExploitL == 35 then
		--子爵升级高子
		NeedFuKongDaoShengWang = 816
	elseif nExploitL == 40 then
		--高子升级伯爵
		NeedFuKongDaoShengWang = 1122
	elseif nExploitL == 50 then
		--伯爵升级高伯
		NeedFuKongDaoShengWang = 1734
	elseif nExploitL == 55 then
		--高伯升级侯爵
		NeedFuKongDaoShengWang = 2040
	elseif nExploitL == 65 then
		--侯爵升级高侯
		NeedFuKongDaoShengWang = 2856
	elseif nExploitL == 70 then
		--高侯升级公爵
		NeedFuKongDaoShengWang = 3366
	elseif nExploitL == 80 then
		--公爵升级高公
		NeedFuKongDaoShengWang = 4386
	end
	if nExploitL == 25 then
		if FuKongDaoShengWang < NeedFuKongDaoShengWang then
			API_ResponseWrite('<name>爵位提升条件</name>')
			API_ResponseWrite('<win rect="425,150,270,200"></win>')
			API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
			API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
			API_ResponseWrite('<a href="LevelUpTiaoJian?1=36" color="255,255,255">浮空岛声望达到'..NeedFuKongDaoShengWang..'（未满足条件）</a><br><br>')
			API_ResponseFlush(ActorID)
			return 0
		end
	end
	if nExploitL == 2 or nExploitL == 3 or nExploitL == 4 or nExploitL == 5 or nExploitL == 6 or nExploitL == 10 or nExploitL == 11 or nExploitL == 12 or nExploitL == 13 or nExploitL == 14 or nExploitL == 15 or nExploitL == 16 or nExploitL == 17 or nExploitL == 21 or nExploitL == 30 or nExploitL == 35 then
		local TiaoJianTable = LevelUpTiaoJian_Table[nExploitL]
		local HPTiaoJian = TiaoJianTable.HPTJ
		local GongJiTiaoJian = TiaoJianTable.GongJiTJ
		local MAXHP = API_ActorGetPropNum(ActorID,3)
		local WuLiGongJi = API_ActorGetPropNum(ActorID,23)
		local HuoYaoGongJi = API_ActorGetPropNum(ActorID,24)
		local MoFaGongJi = API_ActorGetPropNum(ActorID,25)
		local WuLiFangYu = API_ActorGetPropNum(ActorID,28)
		local HuoYaoFangYu = API_ActorGetPropNum(ActorID,29)
		local MoFaFangYu = API_ActorGetPropNum(ActorID,30)
		local FangYu = TiaoJianTable.FangYuTJ
		local GoodsID1 = TiaoJianTable.WuLiZhuangBeiTJ1
		local GoodsID2 = TiaoJianTable.WuLiZhuangBeiTJ2
		local GoodsID3 = TiaoJianTable.WuLiZhuangBeiTJ3
		local GoodsID4 = TiaoJianTable.WuLiZhuangBeiTJ4
		local GoodsID5 = TiaoJianTable.HuoYaoZhuangBeiTJ1
		local GoodsID6 = TiaoJianTable.HuoYaoZhuangBeiTJ2
		local GoodsID7 = TiaoJianTable.HuoYaoZhuangBeiTJ3
		local GoodsID8 = TiaoJianTable.HuoYaoZhuangBeiTJ4
		local GoodsID9 = TiaoJianTable.MoFaZhuangBeiTJ1
		local GoodsID10 = TiaoJianTable.MoFaZhuangBeiTJ2
		local GoodsID11 = TiaoJianTable.MoFaZhuangBeiTJ3
		local GoodsID12 = TiaoJianTable.MoFaZhuangBeiTJ4
		local ZhuangBei1 = API_ActorHaveEquip(ActorID,GoodsID1)
		local ZhuangBei2 = API_ActorHaveEquip(ActorID,GoodsID2)
		local ZhuangBei3 = API_ActorHaveEquip(ActorID,GoodsID3)
		local ZhuangBei4 = API_ActorHaveEquip(ActorID,GoodsID4)
		local ZhuangBei5 = API_ActorHaveEquip(ActorID,GoodsID5)
		local ZhuangBei6 = API_ActorHaveEquip(ActorID,GoodsID6)
		local ZhuangBei7 = API_ActorHaveEquip(ActorID,GoodsID7)
		local ZhuangBei8 = API_ActorHaveEquip(ActorID,GoodsID8)
		local ZhuangBei9 = API_ActorHaveEquip(ActorID,GoodsID9)
		local ZhuangBei10 = API_ActorHaveEquip(ActorID,GoodsID10)
		local ZhuangBei11 = API_ActorHaveEquip(ActorID,GoodsID11)
		local ZhuangBei12 = API_ActorHaveEquip(ActorID,GoodsID12)
		local GongMingLJNum =  API_VarDataGetNumber(ActorID,1,18301)--公民拉锯总次数
		--[[if nExploitL == 2 then
			if (ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei6 == true or ZhuangBei9 == true or ZhuangBei10 == true) and (ZhuangBei3 == true or ZhuangBei4 == true or ZhuangBei7 == true or ZhuangBei8 == true or ZhuangBei11 == true or ZhuangBei12 == true) then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,250"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei6 == true or ZhuangBei9 == true or ZhuangBei10 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了1档护腿（已满足条件）</text><br>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=1" color="255,255,255" underline="1">已装备了1档护腿</a><text color="255,0,0">（未满足条件）</text><br>')
				end
				
				if ZhuangBei3 == true or ZhuangBei4 == true or ZhuangBei7 == true or ZhuangBei8 == true or ZhuangBei11 == true or ZhuangBei12 == true then
					API_ResponseWrite('<br><text color="0,255,0">2、已装备了1档腰带（已满足）</text>')
				else
					API_ResponseWrite('<br><text>2、</text><a href="LevelUpTiaoJian?1=2" color="255,255,255" underline="1">已装备了1档腰带</a><text color="255,0,0">（未满足条件）</text>')
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseFlush(ActorID)
				return 0
			end]]
		if nExploitL == 3 then
			if ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei6 == true or ZhuangBei9 == true or ZhuangBei10 == true then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,200"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei6 == true or ZhuangBei9 == true or ZhuangBei10 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了1档鞋子（已满足条件）</text>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=3" color="255,255,255" underline="1">已装备了1档鞋子</a><text color="255,0,0">（未满足条件）</text>')
					API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				end
				API_ResponseFlush(ActorID)
				return 0
			end
		elseif nExploitL == 4 then
			if (ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei6 == true or ZhuangBei9 == true or ZhuangBei10 == true) and (ZhuangBei3 == true or ZhuangBei4 == true or ZhuangBei7 == true or ZhuangBei8 == true or ZhuangBei11 == true or ZhuangBei12 == true) then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,250"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei6 == true or ZhuangBei9 == true or ZhuangBei10 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了1档手套（已满足条件）</text><br>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=4" color="255,255,255" underline="1">已装备了1档手套</a><text color="255,0,0">（未满足条件）</text><br>')
				end
				if ZhuangBei3 == true or ZhuangBei4 == true or ZhuangBei7 == true or ZhuangBei8 == true or ZhuangBei11 == true or ZhuangBei12 == true then
					API_ResponseWrite('<br><text color="0,255,0">2、已装备了1档帽子（已满足条件）</text>')
					LVUpOk2 = 1
				else
					API_ResponseWrite('<br><text>2、</text><a href="LevelUpTiaoJian?1=5" color="255,255,255" underline="1">已装备了1档帽子</a><text color="255,0,0">（未满足条件）</text>')
					LVUpOk2 = 0
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
		elseif nExploitL == 5 then
			if ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei6 == true or ZhuangBei9 == true or ZhuangBei10 == true then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,200"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei6 == true or ZhuangBei9 == true or ZhuangBei10 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了1档项链（已满足条件）</text>')
					LVUpOk1 = 1
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=6" color="255,255,255" underline="1">已装备了1档项链</a><text color="255,0,0">（未满足条件）</text>')
					LVUpOk1 = 0
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
		elseif nExploitL == 6 then
			if ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei6 == true or ZhuangBei9 == true or ZhuangBei10 == true then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,200"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei6 == true or ZhuangBei9 == true or ZhuangBei10 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了1档戒指（已满足条件）</text>')
					LVUpOk1 = 1
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=7" color="255,255,255" underline="1">已装备了1档戒指</a><text color="255,0,0">（未满足条件）</text>')
					LVUpOk1 = 0
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
		elseif nExploitL == 10 then
			--[[local OKHeroNum = 0
			for i in GLOBAL_HeroSkillList do
				local HeroID = i
				if API_ActorIsLearnHero(ActorID,HeroID) then
					local SkillNum = 0
					for j in GLOBAL_HeroSkillList[i] do
						local SkillID = GLOBAL_HeroSkillList[i][j]
						if API_GetSkillLevel(ActorID,SkillID) >= 2 then
							SkillNum = SkillNum + 1
						end
					end
					if SkillNum >= 2 then
						OKHeroNum = OKHeroNum + 1
					end
				end
			end]]
			if ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei6 == true or ZhuangBei9 == true or ZhuangBei10 == true then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,250"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				--[[if OKHeroNum >= 2 then
					API_ResponseWrite('<text color="0,255,0">1、已经学习过2个英雄，每个英雄都至少有2个2级技能（已满足条件）</text><br><br>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=8" color="255,255,255" underline="1">已经学习过2个英雄，每个英雄都至少有2个2级技能</a><text color="255,0,0">（未满足条件）</text><br><br>')
				end]]
				if ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei6 == true or ZhuangBei9 == true or ZhuangBei10 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了1档披风（已满足条件）</text>')
				else
					API_ResponseWrite('<text>2、</text><a href="LevelUpTiaoJian?1=9" color="255,255,255" underline="1">已装备了1档披风</a><text color="255,0,0">（未满足条件）</text>')
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
		elseif nExploitL == 11 then
			if ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,200"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了2档衣服（已满足条件）</text>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=10" color="255,255,255" underline="1">已装备了2档衣服</a><text color="255,0,0">（未满足条件）</text>')
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
		elseif nExploitL == 12 then
			if ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,200"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了2档腰带（已满足条件）</text>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=11" color="255,255,255" underline="1">已装备了2档腰带</a><text color="255,0,0">（未满足条件）</text>')
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
		elseif nExploitL == 13 then
			if ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,200"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了2档护腿（已满足条件）</text>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=12" color="255,255,255" underline="1">已装备了2档护腿</a>')
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
		elseif nExploitL == 14 then
			if (ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true) and (ZhuangBei3 == true or ZhuangBei7 == true or ZhuangBei11 == true) then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,250"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了2档帽子（已满足条件）</text><br><br>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=13" color="255,255,255" underline="1">已装备了2档帽子</a><text color="255,0,0">（未满足条件）</text><br><br>')
				end
				if ZhuangBei3 == true or ZhuangBei7 == true or ZhuangBei11 == true then
					API_ResponseWrite('<text color="0,255,0">2、已装备了2档鞋子（已满足条件）</text>')
				else
					API_ResponseWrite('<text>2、</text><a href="LevelUpTiaoJian?1=14" color="255,255,255" underline="1">已装备了2档鞋子</a><text color="255,0,0">（未满足条件）</text>')
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
		elseif nExploitL == 15 then
			--[[local OKWorkSkilNum = 0
			local OKHeroNum = 0
			for i in GLOBAL_HeroSkillList do
				local HeroID = i
				if API_ActorIsLearnHero(ActorID,HeroID) then
					local SkillNum = 0
					for j in GLOBAL_HeroSkillList[i] do
						local SkillID = GLOBAL_HeroSkillList[i][j]
						if API_GetSkillLevel(ActorID,SkillID) >= 3 then
							SkillNum = SkillNum + 1
						end
					end
					if SkillNum >= 3 then
						OKHeroNum = OKHeroNum + 1
					end
				end
			end
			for i in GLOBAL_WorkSkillList do
				local SkillID = GLOBAL_WorkSkillList[i]
				if API_GetWorkSkillLevel(ActorID,SkillID) >= 5 then
					OKWorkSkilNum = OKWorkSkilNum + 1
				end
			end]]
			if (ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true) and (MAXHP >= HPTiaoJian and (WuLiGongJi >= GongJiTiaoJian or HuoYaoGongJi >= GongJiTiaoJian or MoFaGongJi >= GongJiTiaoJian) and GongMingLJNum >= 10) then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,420"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了2档手套（已满足条件）</text><br><br>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=15" color="255,255,255" underline="1">已装备了2档手套</a><text color="255,0,0">（未满足条件）</text><br><br>')
				end
				--[[if OKHeroNum >= 2 then
					API_ResponseWrite('<text color="0,255,0">2、已经学习过2个英雄，每个英雄都至少有3个3级技能（已满足条件）</text>')
				else
					API_ResponseWrite('<text>2、</text><a href="LevelUpTiaoJian?1=16" color="255,255,255" underline="1">已经学习过2个英雄，每个英雄都至少有3个3级技能</a><text color="255,0,0">（未满足条件）</text>')
				end]]
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseWrite('<br><text Size="20" color="255,0,255">             条件二</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				--[[if OKWorkSkilNum >= 1 then
					API_ResponseWrite('<text color="0,255,0">1、至少有1个加工系生活技能等级达到5级（已满足条件）</text>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=17" color="255,255,255" underline="1">喜欢从事生产的玩家其至少有1个加工系生活技能等级达到5级</a><text color="255,0,0">（未满足条件）</text>')
					API_ResponseWrite('<br><text Size="15" color="255,255,0">  或者</text><br>')]]
					if MAXHP >= HPTiaoJian then
						API_ResponseWrite('<text color="0,255,0">1、HP总量达到1500点（已满足条件）</text><br>')
					else
						API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=18" color="255,255,255" underline="1">HP总量达到1500点（未满足条件）</a><br>')
					end
					if WuLiGongJi >= GongJiTiaoJian or HuoYaoGongJi >= GongJiTiaoJian or MoFaGongJi >= GongJiTiaoJian then
						API_ResponseWrite('<text color="0,255,0">2、任意一种类型的攻击力不低于80点（已满足条件）</text><br>')
					else
						API_ResponseWrite('<text>2、</text><a href="LevelUpTiaoJian?1=19" color="255,255,255" underline="1">任意一种类型的攻击力不低于80点</a><text color="255,0,0">（未满足条件）</text><br>')
					end
					if GongMingLJNum >= 10 then
						API_ResponseWrite('<text color="0,255,0">3、公民拉锯战打过至少10次（已满足条件）</text>')
					else
						API_ResponseWrite('<text>3、</text><a href="LevelUpTiaoJian?1=20" color="255,255,255" underline="1">公民拉锯战打过至少10次（赢过至少一场后离开拉锯浮空岛才算一次）</a><text color="255,0,0">（未满足条件）</text>')
					end
				--end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseWrite('<br><text color="255,0,0">注意:本次升级爵位后您将不允许再进入公民拉锯战浮空岛</text>')
				API_ResponseFlush(ActorID)
				return 0
			end
		elseif nExploitL == 16 then
			if (ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei9 == true) and (ZhuangBei3 == true or ZhuangBei6 == true or ZhuangBei10 == true) and (API_ActorGetCurHeroID(ActorID,0) ~= 0 and API_ActorGetCurHeroID(ActorID,1) ~= 0) then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,300"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if ZhuangBei1 == true or ZhuangBei2 == true or ZhuangBei5 == true or ZhuangBei9 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了2档武器（已满足条件）</text><br><br>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=21" color="255,255,255" underline="1">已装备了2档武器</a><text color="255,0,0">（未满足条件）</text><br><br>')
				end
				if ZhuangBei3 == true or ZhuangBei6 == true or ZhuangBei10 == true then
					API_ResponseWrite('<text color="0,255,0">2、已装备了2档项链（已满足条件）</text><br><br>')
				else
					API_ResponseWrite('<text>2、</text><a href="LevelUpTiaoJian?1=22" color="255,255,255" underline="1">已装备了2档项链</a><text color="255,0,0">（未满足条件）</text><br><br>')
				end
				if API_ActorGetCurHeroID(ActorID,0) ~= 0 and API_ActorGetCurHeroID(ActorID,1) ~= 0 then
					API_ResponseWrite('<text color="0,255,0">3、已经装备了双英雄（已满足条件）</text>')
				else
					API_ResponseWrite('<text>3、</text><a href="LevelUpTiaoJian?1=23" color="255,255,255" underline="1">已经装备了双英雄</a><text color="255,0,0">（未满足条件）</text>')
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
		elseif nExploitL == 17 then
			if ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,200"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了2档戒指（已满足条件）</text>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=24" color="255,255,255" underline="1">已装备了2档戒指</a><text color="255,0,0">（未满足条件）</text>')
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
			API_ResponseFlush(ActorID)
		elseif nExploitL == 21 then
			if ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,200"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if ZhuangBei1 == true or ZhuangBei5 == true or ZhuangBei9 == true then
					API_ResponseWrite('<text color="0,255,0">1、已装备了2档披风（已满足条件）</text>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=25" color="255,255,255" underline="1">已装备了2档披风</a><text color="255,0,0">（未满足条件）</text>')
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
			API_ResponseFlush(ActorID)
		elseif nExploitL == 30 then
			--[[local OKWorkSkilNum = 0
			local OKHeroNum = 0
			for i in GLOBAL_HeroSkillList do
				local HeroID = i
				if API_ActorIsLearnHero(ActorID,HeroID) then
					local SkillNum = 0
					for j in GLOBAL_HeroSkillList[i] do
						local SkillID = GLOBAL_HeroSkillList[i][j]
						if API_GetSkillLevel(ActorID,SkillID) >= 5 then
							SkillNum = SkillNum + 1
						end
					end
					if SkillNum >= 3 then
						OKHeroNum = OKHeroNum + 1
					end
				end
			end
			for i in GLOBAL_WorkSkillList do
				local SkillID = GLOBAL_WorkSkillList[i]
				if API_GetWorkSkillLevel(ActorID,SkillID) >= 9 then
					OKWorkSkilNum = OKWorkSkilNum + 1
				end
			end]]
			if MAXHP >= HPTiaoJian and (WuLiGongJi >= GongJiTiaoJian or HuoYaoGongJi >= GongJiTiaoJian or MoFaGongJi >= GongJiTiaoJian) and (WuLiFangYu >= FangYu or HuoYaoFangYu >= FangYu or MoFaFangYu >= FangYu) then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,300"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				--[[if OKWorkSkilNum >= 1 then
					API_ResponseWrite('<text color="0,255,0">1、至少有1个加工系生活技能等级达到9级（已满足条件）</text><br>')
					API_ResponseWrite('<text Size="15" color="255,255,0">  或者</text><br>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=26" color="255,255,255" underline="1">喜欢从事生产的玩家其至少有1个加工系生活技能等级达到9级</a><text color="255,0,0">（未满足条件）</text><br>')
					API_ResponseWrite('<text Size="15" color="255,255,0">  或者</text><br>')
				end
				if OKHeroNum >= 2 then
					API_ResponseWrite('<text color="0,255,0">1、已经学习过2个英雄，每个英雄都至少有3个5级技能（已满足条件）</text><br>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=27" color="255,255,255" underline="1">已经学习过2个英雄，每个英雄都至少有3个5级技能</a><text color="255,0,0">（未满足条件）</text><br>')
				end]]
				if MAXHP >= HPTiaoJian then
					API_ResponseWrite('<text color="0,255,0">1、HP总量超过3500点（已满足条件）</text><br>')
				else
					API_ResponseWrite('<text>2、</text><a href="LevelUpTiaoJian?1=28" color="255,255,255" underline="1">HP总量超过3500点</a><text color="255,0,0">（未满足条件）</text><br>')
				end
				if WuLiGongJi >= GongJiTiaoJian or HuoYaoGongJi >= GongJiTiaoJian or MoFaGongJi >= GongJiTiaoJian then
					API_ResponseWrite('<text color="0,255,0">2、任意类型攻击力不低于150点（已满足条件）</text><br>')
				else
					API_ResponseWrite('<text>3、</text><a href="LevelUpTiaoJian?1=29" color="255,255,255" underline="1">任意类型攻击力不低于150点</a><text color="255,0,0">（未满足条件）</text><br>')
				end
				if WuLiFangYu >= FangYu or HuoYaoFangYu >= FangYu or MoFaFangYu >= FangYu then
					API_ResponseWrite('<text color="0,255,0">3、任意类型防御力不低于100点（已满足条件）</text>')
				else
					API_ResponseWrite('<text>4、</text><a href="LevelUpTiaoJian?1=30" color="255,255,255" underline="1">任意类型防御力不低于100点</a><text color="255,0,0">（未满足条件）</text>')
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseWrite('<br><text color="255,0,0">注意:本次升级爵位后您将不允许再进入男爵拉锯战浮空岛</text>')
				API_ResponseFlush(ActorID)
				return 0
			end
		elseif nExploitL == 35 then
			--[[local OKWorkSkilNum = 0
			local OKHeroNum = 0
			for i in GLOBAL_HeroSkillList do
				local HeroID = i
				if API_ActorIsLearnHero(ActorID,HeroID) then
					local SkillNum = 0
					for j in GLOBAL_HeroSkillList[i] do
						local SkillID = GLOBAL_HeroSkillList[i][j]
						if API_GetSkillLevel(ActorID,SkillID) >= 6 then
							SkillNum = SkillNum + 1
						end
					end
					if SkillNum >= 3 then
						OKHeroNum = OKHeroNum + 1
					end
				end
			end
			for i in GLOBAL_WorkSkillList do
				local SkillID = GLOBAL_WorkSkillList[i]
				if API_GetWorkSkillLevel(ActorID,SkillID) >= 12 then
					OKWorkSkilNum = OKWorkSkilNum + 1
				end
			end]]
			if FuKongDaoShengWang >= NeedFuKongDaoShengWang and (MAXHP >= HPTiaoJian and (WuLiGongJi >= GongJiTiaoJian or HuoYaoGongJi >= GongJiTiaoJian or MoFaGongJi >= GongJiTiaoJian) and (WuLiFangYu >= FangYu or HuoYaoFangYu >= FangYu or MoFaFangYu >= FangYu)) then
			else
				API_ResponseWrite('<name>爵位提升条件</name>')
				API_ResponseWrite('<win rect="425,150,400,400"></win>')
				API_ResponseWrite('<text>满足下列条件后才可提升爵位</text><br>')
				API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
				API_ResponseWrite('<text Size="20" color="255,0,255">             条件一</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				if FuKongDaoShengWang >= NeedFuKongDaoShengWang then
					API_ResponseWrite('<text color="0,255,0">1、浮空岛声望达到'..NeedFuKongDaoShengWang..'（已满足条件）</text>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=36" color="255,255,255" underline="1">浮空岛声望达到'..NeedFuKongDaoShengWang..'</a><text color="255,0,0">（未满足条件）</text>')
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseWrite('<br><text Size="20" color="255,0,255">             条件二</text><br>')
				API_ResponseWrite('<text>—————————————————————————————</text><br>')
				--[[if OKWorkSkilNum >= 1 then
					API_ResponseWrite('<text color="0,255,0">1、至少有1个加工系生活技能等级达到12级（已满足条件）</text><br>')
					API_ResponseWrite('<text Size="15" color="255,255,0">  或者</text><br>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=31" color="255,255,255" underline="1">喜欢从事生产的玩家其至少有1个加工系生活技能等级达到12级</a><text color="255,0,0">（未满足条件）</text><br>')
					API_ResponseWrite('<text Size="15" color="255,255,0">  或者</text><br>')
				end
				if OKHeroNum >= 2 then
					API_ResponseWrite('<text color="0,255,0">1、已经学习过2个英雄，每个英雄都至少有3个6级技能（已满足条件）</text><br>')
				else
					API_ResponseWrite('<text>1、</text><a href="LevelUpTiaoJian?1=32" color="255,255,255" underline="1">已经学习过2个英雄，每个英雄都至少有3个6级技能</a><text color="255,0,0">（未满足条件）</text><br>')
				end]]
				if MAXHP >= HPTiaoJian then
					API_ResponseWrite('<text color="0,255,0">1、HP总量超过4000点（已满足条件）</text><br>')
				else
					API_ResponseWrite('<text>2、</text><a href="LevelUpTiaoJian?1=33" color="255,255,255" underline="1">HP总量超过4000点</a><text color="255,0,0">（未满足条件）</text><br>')
				end
				if WuLiGongJi >= GongJiTiaoJian or HuoYaoGongJi >= GongJiTiaoJian or MoFaGongJi >= GongJiTiaoJian then
					API_ResponseWrite('<text color="0,255,0">2、任意类型攻击力不低于240点（已满足条件）</text><br>')
				else
					API_ResponseWrite('<text>3、</text><a href="LevelUpTiaoJian?1=34" color="255,255,255" underline="1">任意类型攻击力不低于240点</a><text color="255,0,0">（未满足条件）</text><br>')
				end
				if WuLiFangYu >= FangYu or HuoYaoFangYu >= FangYu or MoFaFangYu >= FangYu then
					API_ResponseWrite('<text color="0,255,0">3、任意类型防御力不低于110点（已满足条件）</text>')
				else
					API_ResponseWrite('<text>4、</text><a href="LevelUpTiaoJian?1=35" color="255,255,255" underline="1">任意类型防御力不低于110点</a><text color="255,0,0">（未满足条件）</text>')
				end
				API_ResponseWrite('<br><text>—————————————————————————————</text><br>')
				API_ResponseFlush(ActorID)
				return 0
			end
		end
	end
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if MapConfigID == 87 or MapConfigID == 88 or MapConfigID == 89 or MapConfigID == 90 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,270,140"></win>')
		API_ResponseWrite('<br><text Size="20" color="50,255,50">本地图内不允许进行提升爵位操作</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	elseif StaticMapID ~= MapID then
		if StaticMapID == 1814 or StaticMapID == 1815 or StaticMapID == 1816 or StaticMapID == 1817 or StaticMapID == 1818 or (StaticMapID >= 1967 and StaticMapID <= 1973) then
			return 1
		end
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,270,140"></win>')
		API_ResponseWrite('<br><text Size="20" color="50,255,50">本地图内不允许进行提升爵位操作</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end
	if nExploitL >= 40 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,270,140"></win>')
		API_ResponseWrite('<br><text Size="20" color="50,255,50">暂不开放更高级爵位</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	elseif GLOBAL_VerdictLevelUp[nExploitL] ~= nil then
		local PeerageName = GLOBAL_Exploit[nExploitL+1].PeerageShort
		local PVEMedalTable = {
								[1] = GLOBAL_CourageMedal,
								[2] = GLOBAL_CourageCuprumMedal,
								[3] = GLOBAL_CourageSilverMedal,
								[4] = GLOBAL_CourageGoldMedal,
								}
		local PVPMedalTable = {
								[1] = GLOBAL_VictoryMedal,
								[2] = GLOBAL_VictoryCuprumMedal,
								[3] = GLOBAL_VictorySilverMedal,
								[4] = GLOBAL_VictoryGoldMedal,
								}
		local NeedPVEMedalNum = 0
		if GLOBAL_VerdictLevelUp[nExploitL].NeedPVEMedal ~= nil then
			NeedPVEMedalNum = GLOBAL_VerdictLevelUp[nExploitL].NeedPVEMedal.Num
		end
		local NeedPVPMedalNum = 0
		if GLOBAL_VerdictLevelUp[nExploitL].NeedPVPMedal ~= nil then
			NeedPVPMedalNum = GLOBAL_VerdictLevelUp[nExploitL].NeedPVPMedal.Num
		end
		local RemovePVEMedalNum = NeedPVEMedalNum
		local RemovePVPMedalNum = NeedPVPMedalNum
		local PVEMedalNum = 0
		local PVPMedalNum = 0
		if NeedPVEMedalNum > 0 then
			local NeedPVEMedalPeerage = GLOBAL_VerdictLevelUp[nExploitL].NeedPVEMedal.Peerage
			local NeedPVEMedalLV = GLOBAL_VerdictLevelUp[nExploitL].NeedPVEMedal.LV
			if PVEMedalTable[NeedPVEMedalLV] ~= nil then
				for i = NeedPVEMedalPeerage,table.getn(PVEMedalTable[NeedPVEMedalLV]) do
					for j = NeedPVEMedalLV,table.getn(PVEMedalTable) do
						local MedalID = PVEMedalTable[j][i]
						local MedalNum = API_ActorGetGoodsNum(ActorID,MedalID)
						PVEMedalNum = PVEMedalNum + MedalNum
						if PVEMedalNum >= NeedPVEMedalNum then
							break
						end
					end
					if PVEMedalNum >= NeedPVEMedalNum then
						break
					end
				end
			end
		end
		if NeedPVPMedalNum > 0 then
			local NeedPVPMedalPeerage = GLOBAL_VerdictLevelUp[nExploitL].NeedPVPMedal.Peerage
			local NeedPVPMedalLV = GLOBAL_VerdictLevelUp[nExploitL].NeedPVPMedal.LV
			if PVPMedalTable[NeedPVPMedalLV] ~= nil then
				for i = NeedPVPMedalPeerage,table.getn(PVPMedalTable[NeedPVPMedalLV]) do
					for j = NeedPVPMedalLV,table.getn(PVPMedalTable) do
						local MedalID = PVPMedalTable[j][i]
						local MedalNum = API_ActorGetGoodsNum(ActorID,MedalID)
						PVPMedalNum = PVPMedalNum + MedalNum
						if PVPMedalNum >= NeedPVPMedalNum then
							break
						end
					end
					if PVPMedalNum >= NeedPVPMedalNum then
						break
					end
				end
			end
		end	
		if PVEMedalNum >= NeedPVEMedalNum and PVPMedalNum >= NeedPVPMedalNum then
			if RemovePVEMedalNum > 0 then
				local NeedPVEMedalPeerage = GLOBAL_VerdictLevelUp[nExploitL].NeedPVEMedal.Peerage
				local NeedPVEMedalLV = GLOBAL_VerdictLevelUp[nExploitL].NeedPVEMedal.LV
				if PVEMedalTable[NeedPVEMedalLV] ~= nil then
					for i = NeedPVEMedalPeerage,table.getn(PVEMedalTable[NeedPVEMedalLV]) do
						for j = NeedPVEMedalLV,table.getn(PVEMedalTable) do
							local MedalID = PVEMedalTable[j][i]
							local MedalNum = API_ActorGetGoodsNum(ActorID,MedalID)
							if MedalNum > 0 then
								if MedalNum >= RemovePVEMedalNum then
									if API_ActorRemoveGoods(ActorID,MedalID,RemovePVEMedalNum,'升大档扣勋章') then
										API_ActorSendMsg(ActorID,0,'爵位提升扣除'..RemovePVEMedalNum..'个'..API_GetGoodsName(MedalID)..'')
										RemovePVEMedalNum = 0
									end
								else
									if API_ActorRemoveGoods(ActorID,MedalID,MedalNum,'升大档扣勋章') then
										RemovePVEMedalNum = RemovePVEMedalNum - MedalNum
										API_ActorSendMsg(ActorID,0,'爵位提升扣除'..MedalNum..'个'..API_GetGoodsName(MedalID)..'')
									end
								end
							end
							if RemovePVEMedalNum <= 0 then
								break
							end
						end
						if RemovePVEMedalNum <= 0 then
							break
						end
					end
				end
			end
			if RemovePVPMedalNum > 0 then
				local NeedPVPMedalPeerage = GLOBAL_VerdictLevelUp[nExploitL].NeedPVPMedal.Peerage
				local NeedPVPMedalLV = GLOBAL_VerdictLevelUp[nExploitL].NeedPVPMedal.LV
				if PVPMedalTable[NeedPVPMedalLV] ~= nil then
					for i = NeedPVPMedalPeerage,table.getn(PVPMedalTable[NeedPVPMedalLV]) do
						for j = NeedPVPMedalLV,table.getn(PVPMedalTable) do
							local MedalID = PVPMedalTable[j][i]
							local MedalNum = API_ActorGetGoodsNum(ActorID,MedalID)
							if MedalNum > 0 then
								if MedalNum >= RemovePVPMedalNum then
									if API_ActorRemoveGoods(ActorID,MedalID,RemovePVPMedalNum,'升大档扣勋章') then
										API_ActorSendMsg(ActorID,0,'爵位提升扣除'..RemovePVPMedalNum..'个'..API_GetGoodsName(MedalID)..'')
										RemovePVPMedalNum = 0
									end
								else
									if API_ActorRemoveGoods(ActorID,MedalID,MedalNum,'升大档扣勋章') then
										RemovePVPMedalNum = RemovePVPMedalNum - MedalNum
										API_ActorSendMsg(ActorID,0,'爵位提升扣除'..MedalNum..'个'..API_GetGoodsName(MedalID)..'')
									end
								end
							end
							if RemovePVPMedalNum <= 0 then
								break
							end
						end
						if RemovePVPMedalNum <= 0 then
							break
						end
					end
				end
			end
			if RemovePVEMedalNum ~= 0 or RemovePVPMedalNum ~= 0 then
				return 0
			end
			API_ActorSendMsg(ActorID,1,'爵位提升到 '..PeerageName..'')
			return 1
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win rect="425,150,270,230"></win>')
			API_ResponseWrite('<br><text Size="20" color="255,0,0">您未满足爵位升级条件</text><br>')
			API_ResponseWrite('<br><text>到 </text><text color="50,255,50">'..PeerageName..'</text><text> 需要消耗：</text><br>')
			if NeedPVEMedalNum ~= 0 then
				local NeedPVEMedalPeerage = GLOBAL_VerdictLevelUp[nExploitL].NeedPVEMedal.Peerage
				local NeedPVEMedalLV = GLOBAL_VerdictLevelUp[nExploitL].NeedPVEMedal.LV
				if PVEMedalTable[NeedPVEMedalLV] ~= nil then
					local MedalID = PVEMedalTable[NeedPVEMedalLV][NeedPVEMedalPeerage]
					if MedalID ~= nil then
						local MedalName = API_GetGoodsName(MedalID)
						API_ResponseWrite('<img srcgd="'..MedalID..'" tipgd="'..MedalID..'"><a allcolor="254,249,220" closewindow="0" tip="或更高档次的同类勋章">'..MedalName..'</a><text> X '..NeedPVEMedalNum..'</text><br>')
					end
				end
			end
			if NeedPVPMedalNum ~= 0 then
				local NeedPVPMedalPeerage = GLOBAL_VerdictLevelUp[nExploitL].NeedPVPMedal.Peerage
				local NeedPVPMedalLV = GLOBAL_VerdictLevelUp[nExploitL].NeedPVPMedal.LV
				if PVPMedalTable[NeedPVPMedalLV] ~= nil then
					local MedalID = PVPMedalTable[NeedPVPMedalLV][NeedPVPMedalPeerage]
					if MedalID ~= nil then
						local MedalName = API_GetGoodsName(MedalID)
						API_ResponseWrite('<img srcgd="'..MedalID..'" tipgd="'..MedalID..'"><a allcolor="254,249,220" closewindow="0" tip="或更高档次的同类勋章">'..MedalName..'</a><text> X '..NeedPVPMedalNum..'</text><br>')
					end
				end
			end
			API_ResponseWrite('<br><text color="255,0,255">允许用更高档次同类勋章替代</text><br>')
			API_ResponseWrite('<br><a>确定</a>')
			API_ResponseFlush(ActorID)
			return 0
		end
	else
		local PeerageName = GLOBAL_Exploit[nExploitL+1].PeerageShort
		if FuKongDaoShengWang < NeedFuKongDaoShengWang then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win rect="425,150,270,230"></win>')
			API_ResponseWrite('<br><text Size="20" color="255,0,0">您未满足爵位升级条件</text><br>')
			API_ResponseWrite('<br><text>到 </text><text color="50,255,50">'..PeerageName..'</text><text> 需要消耗：</text><text color="255,0,255"> '..NeedFuKongDaoShengWang..' </text><text>点“浮空岛声望”，您的“浮空岛声望”不够，请先去参加各个浮空岛的战斗获得“浮空岛声望”！</text><br>')
			API_ResponseWrite('<br><a>确定</a>')
			API_ResponseFlush(ActorID)
			return 0
		else
			FuKongDaoShengWang = FuKongDaoShengWang - NeedFuKongDaoShengWang
			API_VarDataSetNumber(ActorID,1,GLOBAL_FuKongDaoShengWang,FuKongDaoShengWang)
			API_ActorSendMsg(ActorID,0,'爵位提升扣除'..NeedFuKongDaoShengWang..'点“浮空岛声望”')
			API_ActorSendMsg(ActorID,7,'爵位提升扣除'..NeedFuKongDaoShengWang..'点“浮空岛声望”')
			return 1
		end
		return 1
	end
end