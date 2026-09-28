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
[1] = {PeerageLevel = 1,PeerageShort = '1级',PeerageDepict = '1级',Food = 1,Medicine = 1,HeroStudy = 2,HeroActivation = 1,Item = {Armet=0,Corselet=1,Mantle=0,Necklace=0,Ring=0,Caestus=1,Glove=0,LegGuard=0,Shoes=0,Weapon=1},},
[2] = {PeerageLevel = 1,PeerageShort = '1级',PeerageDepict = '2级',Food = 1,Medicine = 1,HeroStudy = 3,HeroActivation = 1,Item = {Armet=0,Corselet=1,Mantle=0,Necklace=0,Ring=0,Caestus=1,Glove=0,LegGuard=1,Shoes=0,Weapon=1},},
[3] = {PeerageLevel = 1,PeerageShort = '1级',PeerageDepict = '3级',Food = 1,Medicine = 1,HeroStudy = 4,HeroActivation = 1,Item = {Armet=0,Corselet=1,Mantle=0,Necklace=0,Ring=0,Caestus=1,Glove=0,LegGuard=1,Shoes=1,Weapon=1},},
[4] = {PeerageLevel = 1,PeerageShort = '1级',PeerageDepict = '4级',Food = 1,Medicine = 1,HeroStudy = 5,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=0,Necklace=0,Ring=0,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[5] = {PeerageLevel = 1,PeerageShort = '1级',PeerageDepict = '5级',Food = 1,Medicine = 1,HeroStudy = 6,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=0,Necklace=1,Ring=0,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[6] = {PeerageLevel = 1,PeerageShort = '1级',PeerageDepict = '6级',Food = 1,Medicine = 1,HeroStudy = 6,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=0,Necklace=1,Ring=1,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[7] = {PeerageLevel = 1,PeerageShort = '1级',PeerageDepict = '7级',Food = 1,Medicine = 1,HeroStudy = 7,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=0,Necklace=1,Ring=1,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[8] = {PeerageLevel = 1,PeerageShort = '1级',PeerageDepict = '8级',Food = 1,Medicine = 1,HeroStudy = 7,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=0,Necklace=1,Ring=1,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[9] = {PeerageLevel = 1,PeerageShort = '1级',PeerageDepict = '9级',Food = 1,Medicine = 1,HeroStudy = 7,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=0,Necklace=1,Ring=1,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[10] = {PeerageLevel = 2,PeerageShort = '1级',PeerageDepict = '10级',Food = 1,Medicine = 1,HeroStudy = 7,HeroActivation = 1,Item = {Armet=1,Corselet=1,Mantle=1,Necklace=1,Ring=1,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[11] = {PeerageLevel = 2,PeerageShort = '11级',PeerageDepict = '11级',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=1,Corselet=2,Mantle=1,Necklace=1,Ring=1,Caestus=1,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[12] = {PeerageLevel = 2,PeerageShort = '11级',PeerageDepict = '12级',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=1,Corselet=2,Mantle=1,Necklace=1,Ring=1,Caestus=2,Glove=1,LegGuard=1,Shoes=1,Weapon=1},},
[13] = {PeerageLevel = 2,PeerageShort = '11级',PeerageDepict = '13级',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=1,Corselet=2,Mantle=1,Necklace=1,Ring=1,Caestus=2,Glove=1,LegGuard=2,Shoes=1,Weapon=1},},
[14] = {PeerageLevel = 2,PeerageShort = '11级',PeerageDepict = '14级',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=1,Ring=1,Caestus=2,Glove=1,LegGuard=2,Shoes=2,Weapon=1},},
[15] = {PeerageLevel = 2,PeerageShort = '11级',PeerageDepict = '15级',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=1,Ring=1,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=1},},
[16] = {PeerageLevel = 2,PeerageShort = '11级',PeerageDepict = '16级',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=2,Ring=1,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[17] = {PeerageLevel = 2,PeerageShort = '11级',PeerageDepict = '17级',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[18] = {PeerageLevel = 2,PeerageShort = '11级',PeerageDepict = '18级',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[19] = {PeerageLevel = 2,PeerageShort = '11级',PeerageDepict = '19级',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[20] = {PeerageLevel = 2,PeerageShort = '11级',PeerageDepict = '20级',Food = 2,Medicine = 2,HeroStudy = 8,HeroActivation = 1,Item = {Armet=2,Corselet=2,Mantle=1,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[21] = {PeerageLevel = 3,PeerageShort = '21级',PeerageDepict = '21级',Food = 3,Medicine = 2,HeroStudy = 9,HeroActivation = 2,Item = {Armet=2,Corselet=2,Mantle=2,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[22] = {PeerageLevel = 3,PeerageShort = '21级',PeerageDepict = '22级',Food = 3,Medicine = 2,HeroStudy = 9,HeroActivation = 2,Item = {Armet=2,Corselet=2,Mantle=2,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[23] = {PeerageLevel = 3,PeerageShort = '21级',PeerageDepict = '23级',Food = 3,Medicine = 2,HeroStudy = 9,HeroActivation = 2,Item = {Armet=2,Corselet=2,Mantle=2,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[24] = {PeerageLevel = 3,PeerageShort = '21级',PeerageDepict = '24级',Food = 3,Medicine = 2,HeroStudy = 9,HeroActivation = 2,Item = {Armet=2,Corselet=2,Mantle=2,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[25] = {PeerageLevel = 3,PeerageShort = '21级',PeerageDepict = '25级',Food = 3,Medicine = 2,HeroStudy = 9,HeroActivation = 2,Item = {Armet=2,Corselet=2,Mantle=2,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[26] = {PeerageLevel = 4,PeerageShort = '26级',PeerageDepict = '26级',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=2,Corselet=3,Mantle=2,Necklace=2,Ring=2,Caestus=2,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[27] = {PeerageLevel = 4,PeerageShort = '26级',PeerageDepict = '27级',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=2,Corselet=3,Mantle=2,Necklace=2,Ring=2,Caestus=3,Glove=2,LegGuard=2,Shoes=2,Weapon=2},},
[28] = {PeerageLevel = 4,PeerageShort = '26级',PeerageDepict = '28级',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=2,Corselet=3,Mantle=2,Necklace=2,Ring=2,Caestus=3,Glove=2,LegGuard=3,Shoes=2,Weapon=2},},
[29] = {PeerageLevel = 4,PeerageShort = '26级',PeerageDepict = '29级',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=2,Ring=2,Caestus=3,Glove=2,LegGuard=3,Shoes=3,Weapon=2},},
[30] = {PeerageLevel = 4,PeerageShort = '26级',PeerageDepict = '30级',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=2,Ring=2,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=2},},
[31] = {PeerageLevel = 4,PeerageShort = '26级',PeerageDepict = '31级',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=3,Ring=2,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[32] = {PeerageLevel = 4,PeerageShort = '26级',PeerageDepict = '32级',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[33] = {PeerageLevel = 4,PeerageShort = '26级',PeerageDepict = '33级',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[34] = {PeerageLevel = 4,PeerageShort = '26级',PeerageDepict = '34级',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[35] = {PeerageLevel = 4,PeerageShort = '26级',PeerageDepict = '35级',Food = 4,Medicine = 3,HeroStudy = 10,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=2,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[36] = {PeerageLevel = 5,PeerageShort = '36级',PeerageDepict = '36级',Food = 5,Medicine = 3,HeroStudy = 11,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[37] = {PeerageLevel = 5,PeerageShort = '36级',PeerageDepict = '37级',Food = 5,Medicine = 3,HeroStudy = 11,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[38] = {PeerageLevel = 5,PeerageShort = '36级',PeerageDepict = '38级',Food = 5,Medicine = 3,HeroStudy = 11,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[39] = {PeerageLevel = 5,PeerageShort = '36级',PeerageDepict = '39级',Food = 5,Medicine = 3,HeroStudy = 11,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[40] = {PeerageLevel = 5,PeerageShort = '36级',PeerageDepict = '40级',Food = 5,Medicine = 3,HeroStudy = 11,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[41] = {PeerageLevel = 6,PeerageShort = '41级',PeerageDepict = '41级',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[42] = {PeerageLevel = 6,PeerageShort = '41级',PeerageDepict = '42级',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[43] = {PeerageLevel = 6,PeerageShort = '41级',PeerageDepict = '43级',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[44] = {PeerageLevel = 6,PeerageShort = '41级',PeerageDepict = '44级',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[45] = {PeerageLevel = 6,PeerageShort = '41级',PeerageDepict = '45级',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[46] = {PeerageLevel = 6,PeerageShort = '41级',PeerageDepict = '46级',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[47] = {PeerageLevel = 6,PeerageShort = '41级',PeerageDepict = '47级',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[48] = {PeerageLevel = 6,PeerageShort = '41级',PeerageDepict = '48级',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[49] = {PeerageLevel = 6,PeerageShort = '41级',PeerageDepict = '49级',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[50] = {PeerageLevel = 6,PeerageShort = '41级',PeerageDepict = '50级',Food = 6,Medicine = 3,HeroStudy = 12,HeroActivation = 2,Item = {Armet=3,Corselet=3,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[51] = {PeerageLevel = 7,PeerageShort = '51级',PeerageDepict = '51级',Food = 7,Medicine = 4,HeroStudy = 13,HeroActivation = 2,Item = {Armet=3,Corselet=4,Mantle=3,Necklace=3,Ring=3,Caestus=3,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[52] = {PeerageLevel = 7,PeerageShort = '51级',PeerageDepict = '52级',Food = 7,Medicine = 4,HeroStudy = 13,HeroActivation = 2,Item = {Armet=3,Corselet=4,Mantle=3,Necklace=3,Ring=3,Caestus=4,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[53] = {PeerageLevel = 7,PeerageShort = '51级',PeerageDepict = '53级',Food = 7,Medicine = 4,HeroStudy = 13,HeroActivation = 2,Item = {Armet=3,Corselet=4,Mantle=3,Necklace=3,Ring=3,Caestus=4,Glove=3,LegGuard=3,Shoes=3,Weapon=3},},
[54] = {PeerageLevel = 7,PeerageShort = '51级',PeerageDepict = '54级',Food = 7,Medicine = 4,HeroStudy = 13,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=3,Ring=3,Caestus=4,Glove=3,LegGuard=4,Shoes=4,Weapon=3},},
[55] = {PeerageLevel = 7,PeerageShort = '51级',PeerageDepict = '55级',Food = 7,Medicine = 4,HeroStudy = 13,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=3,Ring=3,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=3},},
[56] = {PeerageLevel = 8,PeerageShort = '56级',PeerageDepict = '56级',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=4,Ring=3,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[57] = {PeerageLevel = 8,PeerageShort = '56级',PeerageDepict = '57级',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[58] = {PeerageLevel = 8,PeerageShort = '56级',PeerageDepict = '58级',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[59] = {PeerageLevel = 8,PeerageShort = '56级',PeerageDepict = '59级',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[60] = {PeerageLevel = 8,PeerageShort = '56级',PeerageDepict = '60级',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=3,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[61] = {PeerageLevel = 8,PeerageShort = '56级',PeerageDepict = '61级',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=4,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[62] = {PeerageLevel = 8,PeerageShort = '56级',PeerageDepict = '62级',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=4,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[63] = {PeerageLevel = 8,PeerageShort = '56级',PeerageDepict = '63级',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=4,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[64] = {PeerageLevel = 8,PeerageShort = '56级',PeerageDepict = '64级',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=4,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[65] = {PeerageLevel = 8,PeerageShort = '56级',PeerageDepict = '65级',Food = 8,Medicine = 4,HeroStudy = 14,HeroActivation = 2,Item = {Armet=4,Corselet=4,Mantle=4,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[66] = {PeerageLevel = 9,PeerageShort = '66级',PeerageDepict = '66级',Food = 8,Medicine = 5,HeroStudy = 15,HeroActivation = 2,Item = {Armet=4,Corselet=5,Mantle=4,Necklace=4,Ring=4,Caestus=4,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[67] = {PeerageLevel = 9,PeerageShort = '66级',PeerageDepict = '67级',Food = 8,Medicine = 5,HeroStudy = 15,HeroActivation = 2,Item = {Armet=4,Corselet=5,Mantle=4,Necklace=4,Ring=4,Caestus=5,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[68] = {PeerageLevel = 9,PeerageShort = '66级',PeerageDepict = '68级',Food = 8,Medicine = 5,HeroStudy = 15,HeroActivation = 2,Item = {Armet=4,Corselet=5,Mantle=4,Necklace=4,Ring=4,Caestus=5,Glove=4,LegGuard=4,Shoes=4,Weapon=4},},
[69] = {PeerageLevel = 9,PeerageShort = '66级',PeerageDepict = '69级',Food = 8,Medicine = 5,HeroStudy = 15,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=4,Ring=4,Caestus=5,Glove=4,LegGuard=5,Shoes=5,Weapon=4},},
[70] = {PeerageLevel = 9,PeerageShort = '66级',PeerageDepict = '70级',Food = 8,Medicine = 5,HeroStudy = 15,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=4,Ring=4,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=4},},
[71] = {PeerageLevel = 10,PeerageShort = '71级',PeerageDepict = '71级',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=5,Ring=4,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[72] = {PeerageLevel = 10,PeerageShort = '71级',PeerageDepict = '72级',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[73] = {PeerageLevel = 10,PeerageShort = '71级',PeerageDepict = '73级',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[74] = {PeerageLevel = 10,PeerageShort = '71级',PeerageDepict = '74级',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[75] = {PeerageLevel = 10,PeerageShort = '71级',PeerageDepict = '75级',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=4,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[76] = {PeerageLevel = 10,PeerageShort = '71级',PeerageDepict = '76级',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=5,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[77] = {PeerageLevel = 10,PeerageShort = '71级',PeerageDepict = '77级',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=5,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[78] = {PeerageLevel = 10,PeerageShort = '71级',PeerageDepict = '78级',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=5,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[79] = {PeerageLevel = 10,PeerageShort = '71级',PeerageDepict = '79级',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=5,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[80] = {PeerageLevel = 10,PeerageShort = '71级',PeerageDepict = '80级',Food = 8,Medicine = 5,HeroStudy = 16,HeroActivation = 2,Item = {Armet=5,Corselet=5,Mantle=5,Necklace=5,Ring=5,Caestus=5,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[81] = {PeerageLevel = 11,PeerageShort = '81级',PeerageDepict = '81级',Food = 8,Medicine = 6,HeroStudy = 17,HeroActivation = 2,Item = {Armet=5,Corselet=6,Mantle=5,Necklace=5,Ring=5,Caestus=6,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[82] = {PeerageLevel = 11,PeerageShort = '81级',PeerageDepict = '82级',Food = 8,Medicine = 6,HeroStudy = 17,HeroActivation = 2,Item = {Armet=5,Corselet=6,Mantle=5,Necklace=5,Ring=5,Caestus=6,Glove=5,LegGuard=5,Shoes=5,Weapon=5},},
[83] = {PeerageLevel = 11,PeerageShort = '81级',PeerageDepict = '83级',Food = 8,Medicine = 6,HeroStudy = 17,HeroActivation = 2,Item = {Armet=5,Corselet=6,Mantle=5,Necklace=5,Ring=5,Caestus=6,Glove=5,LegGuard=6,Shoes=6,Weapon=5},},
[84] = {PeerageLevel = 11,PeerageShort = '81级',PeerageDepict = '84级',Food = 8,Medicine = 6,HeroStudy = 17,HeroActivation = 2,Item = {Armet=6,Corselet=6,Mantle=5,Necklace=5,Ring=5,Caestus=6,Glove=6,LegGuard=6,Shoes=6,Weapon=5},},
[85] = {PeerageLevel = 11,PeerageShort = '81级',PeerageDepict = '85级',Food = 8,Medicine = 6,HeroStudy = 17,HeroActivation = 2,Item = {Armet=6,Corselet=6,Mantle=6,Necklace=6,Ring=6,Caestus=6,Glove=6,LegGuard=6,Shoes=6,Weapon=6},},
}



GLOBAL_PeerageName={[1]='1级',[2]='11级',[3]='21级',[4]='26级',[5]='36级',[6]='41级',[7]='51级',[8]='56级',[9]='66级',[10]='71级',[11]='81级',}

GLOBAL_PeerageMinLevel = {[1]=1,[2]=11,[3]=21,[4]=26,[5]=36,[6]=41,[7]=51,[8]=56,[9]=66,[10]=71,[11]=81,}
GLOBAL_PeerageMaxLevel = {[1]=10,[2]=20,[3]=25,[4]=35,[5]=40,[6]=50,[7]=55,[8]=65,[9]=70,[10]=80,[11]=85,}



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

WYL_NewServerLvUpGiveGoods = {
[16] = 89083,
[21] = 89084,
[26] = 89085,
[31] = 89086,
[36] = 89087,
[41] = 89088,
--[46] = 89089,
--[51] = 89090,
--[56] = 89091,
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
	local ActorID = ActorID or API_RequestGetActorID()
	local nExploitL = nExploitL or API_GetActorExpLevel(ActorID)
	if nExploitL >= 65 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,270,140"></win>')
		API_ResponseWrite('<br><text Size="20" color="50,255,50">暂不开放更高等级</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end
	local FuKongDaoShengWang = API_VarDataGetNumber(ActorID,1,GLOBAL_FuKongDaoShengWang)
	local NeedFuKongDaoShengWang = 0 
	if nExploitL == 25 then
		--高男升级子爵
		NeedFuKongDaoShengWang = math.floor(408/3)
	elseif nExploitL == 35 then
		--子爵升级高子
		NeedFuKongDaoShengWang = math.floor(816/3)
	elseif nExploitL == 40 then
		--高子升级伯爵
		NeedFuKongDaoShengWang = math.floor(1122/3)
	elseif nExploitL == 50 then
		--伯爵升级高伯
		NeedFuKongDaoShengWang = math.floor(1734/3)
	elseif nExploitL == 55 then
		--高伯升级侯爵
		NeedFuKongDaoShengWang = math.floor(2040/3)
	elseif nExploitL == 65 then
		--侯爵升级高侯
		NeedFuKongDaoShengWang = math.floor(2856/3)
	elseif nExploitL == 70 then
		--高侯升级公爵
		NeedFuKongDaoShengWang = math.floor(3366/3)
	elseif nExploitL == 80 then
		--公爵升级高公
		NeedFuKongDaoShengWang = math.floor(4386/3)
	end
	NeedFuKongDaoShengWang = 0
	if nExploitL == 25 then
		if FuKongDaoShengWang < NeedFuKongDaoShengWang then
			API_ResponseWrite('<name>等级提升条件</name>')
			API_ResponseWrite('<win rect="425,150,270,200"></win>')
			API_ResponseWrite('<text>满足下列条件后才可提升等级</text><br>')
			API_ResponseWrite('<text color="255,0,0">（直接点击未满足的项可以查看如何满足条件）</text><br><br>')
			API_ResponseWrite('<a href="LevelUpTiaoJian?1=36" color="255,255,255">浮空岛声望达到'..NeedFuKongDaoShengWang..'（未满足条件）</a><br><br>')
			API_ResponseFlush(ActorID)
			return 0
		end
	end
	
	local MapID = API_GetActorMapID(ActorID)
	local MapConfigID = API_GetMapConfigID(MapID)
	local StaticMapID = API_GetStaticMapID(MapID)
	if MapConfigID == 87 or MapConfigID == 88 or MapConfigID == 89 or MapConfigID == 90 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,270,140"></win>')
		API_ResponseWrite('<br><text Size="20" color="50,255,50">本地图内不允许进行提升等级操作</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	elseif StaticMapID ~= MapID then
		if StaticMapID == 1814 or StaticMapID == 1815 or StaticMapID == 1816 or StaticMapID == 1817 or StaticMapID == 1818 or (StaticMapID >= 1967 and StaticMapID <= 1973) or StaticMapID == 1985 or StaticMapID == 1986 or StaticMapID == 1989 or StaticMapID == 2039 or StaticMapID == 2040 then
			--送成长礼包
--			local OpenTian,OpenMiao = PublicFun_GetServerOpenDay()
--			if OpenTian <= 30 then
--				if WYL_NewServerLvUpGiveGoods[nExploitL+1] ~= nil then
--					local PeerageName = GLOBAL_Exploit[nExploitL+1].PeerageDepict
--					local GoodsID = WYL_NewServerLvUpGiveGoods[nExploitL+1]
--					API_SendActorMail(ActorID, GoodsID, 1, '[New]成长礼包', '恭喜您升级到'..PeerageName..'，一点小礼物，请笑纳。 O(∩_∩)O')
--					API_ActorSendMsg(ActorID,17,'恭喜您升级到 '..PeerageName..'，我们送了一点小礼物给您，已经寄往您的邮箱，请注意查收哦。')
--				end
--			end
			return 1
		end
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<win rect="425,150,270,140"></win>')
		API_ResponseWrite('<br><text Size="20" color="50,255,50">本地图内不允许进行提升等级操作</text><br>')
		API_ResponseWrite('<br><a>确定</a>')
		API_ResponseFlush(ActorID)
		return 0
	end
	if GLOBAL_VerdictLevelUp[nExploitL] ~= nil then
		local PeerageName = GLOBAL_Exploit[nExploitL+1].PeerageDepict
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
										API_ActorSendMsg(ActorID,0,'等级提升扣除'..RemovePVEMedalNum..'个'..API_GetGoodsName(MedalID)..'')
										RemovePVEMedalNum = 0
									end
								else
									if API_ActorRemoveGoods(ActorID,MedalID,MedalNum,'升大档扣勋章') then
										RemovePVEMedalNum = RemovePVEMedalNum - MedalNum
										API_ActorSendMsg(ActorID,0,'等级提升扣除'..MedalNum..'个'..API_GetGoodsName(MedalID)..'')
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
										API_ActorSendMsg(ActorID,0,'等级提升扣除'..RemovePVPMedalNum..'个'..API_GetGoodsName(MedalID)..'')
										RemovePVPMedalNum = 0
									end
								else
									if API_ActorRemoveGoods(ActorID,MedalID,MedalNum,'升大档扣勋章') then
										RemovePVPMedalNum = RemovePVPMedalNum - MedalNum
										API_ActorSendMsg(ActorID,0,'等级提升扣除'..MedalNum..'个'..API_GetGoodsName(MedalID)..'')
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
			API_ActorSendMsg(ActorID,1,'等级提升到 '..PeerageName..'')
			--送成长礼包
--			local OpenTian,OpenMiao = PublicFun_GetServerOpenDay()
--			if OpenTian <= 30 then
--				if WYL_NewServerLvUpGiveGoods[nExploitL+1] ~= nil then
--					local GoodsID = WYL_NewServerLvUpGiveGoods[nExploitL+1]
--					API_SendActorMail(ActorID, GoodsID, 1, '[New]成长礼包', '恭喜您升级到'..PeerageName..'，一点小礼物，请笑纳。 O(∩_∩)O')
--					API_ActorSendMsg(ActorID,17,'恭喜您升级到 '..PeerageName..'，我们送了一点小礼物给您，已经寄往您的邮箱，请注意查收哦。')
--				end
--			end
			return 1
		else
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win rect="425,150,270,230"></win>')
			API_ResponseWrite('<br><text Size="20" color="255,0,0">您未满足升级条件</text><br>')
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
		local PeerageName = GLOBAL_Exploit[nExploitL+1].PeerageDepict
		if FuKongDaoShengWang < NeedFuKongDaoShengWang then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<win rect="425,150,270,230"></win>')
			API_ResponseWrite('<br><text Size="20" color="255,0,0">您未满足升级条件</text><br>')
			API_ResponseWrite('<br><text>到 </text><text color="50,255,50">'..PeerageName..'</text><text> 需要消耗：</text><text color="255,0,255"> '..NeedFuKongDaoShengWang..' </text><text>点“浮空岛声望”，您的“浮空岛声望”不够，请先去参加各个浮空岛的战斗获得“浮空岛声望”！</text><br>')
			API_ResponseWrite('<br><a>确定</a>')
			API_ResponseFlush(ActorID)
			return 0
		else
			if NeedFuKongDaoShengWang > 0 then
				FuKongDaoShengWang = FuKongDaoShengWang - NeedFuKongDaoShengWang
				API_VarDataSetNumber(ActorID,1,GLOBAL_FuKongDaoShengWang,FuKongDaoShengWang)
				API_ActorSendMsg(ActorID,0,'等级提升扣除'..NeedFuKongDaoShengWang..'点“浮空岛声望”')
				API_ActorSendMsg(ActorID,7,'等级提升扣除'..NeedFuKongDaoShengWang..'点“浮空岛声望”')
			end
			--送成长礼包
--			local OpenTian,OpenMiao = PublicFun_GetServerOpenDay()
--			if OpenTian <= 30 then
--				if WYL_NewServerLvUpGiveGoods[nExploitL+1] ~= nil then
--					local GoodsID = WYL_NewServerLvUpGiveGoods[nExploitL+1]
--					API_SendActorMail(ActorID, GoodsID, 1, '[New]成长礼包', '恭喜您升级到'..PeerageName..'，一点小礼物，请笑纳。 O(∩_∩)O')
--					API_ActorSendMsg(ActorID,17,'恭喜您升级到 '..PeerageName..'，我们送了一点小礼物给您，已经寄往您的邮箱，请注意查收哦。')
--				end
--			end
			return 1
		end
		return 1
	end
end
