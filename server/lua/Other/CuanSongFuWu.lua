----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\CuanSongFuWu.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2007-12-16
--版  本:	1.0
--描  述:	导航条
--应  用:  

----------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------
--作者：张春明
--日期：2007/12/16 
--功能：创建
---------------------------------------------------------------------
--传送相关信息
GLOBAL_ConvectionInfo = 18004
--传送时间触发器ID
GLOBAL_ConvectionTimerTriggerID = 18005

--传送时间
GLOBAL_ConvectionTimer = 3
-- 获取当前地图ID
function CuanSongFuWu_OnLogin()
	local ActorID = API_RequestGetActorID()
	local ActCurMapid = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(ActCurMapid)
	local CampID = API_GetActorCamp(ActorID)
	
	API_RemoveTaskScroll(ActorID, 30000)
	if ActCurMapid == API_GetStaticMapID(ActCurMapid) then
		if API_GetActorExpLevel(ActorID) >= 2 and API_VarDataGetNumber(ActorID,1,9901) == 0 then
			API_VarDataSetNumber(ActorID,1,9901,1)
		end
	end
	if API_VarDataGetNumber(ActorID,1,9901) > 0 then
		if ChuanSongFuWu_Address_Tab[StaticMapID] ~= nil then
			API_AddTaskScrollEx(ActorID, 30000, 10441, 'CuanSongFuWu',0)
			if StaticMapID == 32 or StaticMapID == 52 or StaticMapID == 54 or StaticMapID == 56 or StaticMapID == 33 or StaticMapID == 42 or StaticMapID == 44 or StaticMapID == 46 then
				CuanSongFuWu()
			end
		elseif StaticMapID == 1 or StaticMapID == 21 or StaticMapID == 75 or StaticMapID == 76 or StaticMapID == 77 or StaticMapID == 78 or StaticMapID == 79 or StaticMapID == 80 or StaticMapID == 81 or StaticMapID == 82 then
			-- 给予导航条卷轴
			API_AddTaskScrollEx(ActorID, 30000, 10441, 'CuanSongFuWu',0)
			CuanSongFuWu()
		elseif StaticMapID == 2 or StaticMapID == 40 or StaticMapID == 41 or StaticMapID == 62 or StaticMapID == 63 or StaticMapID == 64 or StaticMapID == 65 or StaticMapID == 66 or StaticMapID == 67 or StaticMapID == 68 or StaticMapID == 69 then
			-- 给予导航条卷轴
			API_AddTaskScrollEx(ActorID, 30000, 10441, 'CuanSongFuWu',0)
			CuanSongFuWu()
		end
	end
end
function CuanSongFuWu_OnLogout()
	local ActorID = API_RequestGetActorID()
	API_RemoveTaskScroll(ActorID, 30000)
end
-- 帝国重要地点表
DiGuo_GoToAddress_Tab = 
{
{AddrName = "钢铁城出口", AddrMapID = 1, AddrLocX = 260, AddrLocY = 95, IfEndLine = 0},
{AddrName = "英雄大厅", AddrMapID = 1, AddrLocX = 183, AddrLocY = 302, IfEndLine = 1},
{AddrName = "[总督府]", AddrMapID = 1, AddrLocX = 232, AddrLocY = 272, IfEndLine = 0},
{AddrName = "帝国总督", AddrMapID = 82, AddrLocX = 128, AddrLocY = 162, IfEndLine = 0, NpcID = 11042, SampleDesc = '帝国皇帝派驻本岛的最\n高行政长官，负责总揽\n帝国在本岛的一切事物\n，直接对皇帝负责'},
{AddrName = "帝国枢密院长", AddrMapID = 82, AddrLocX = 64, AddrLocY = 117, IfEndLine = 0, NpcID = 11002, SampleDesc = '枢密院是绝对忠于帝国\n皇室的行政辅佐机构，\n帝国皇帝在帝国所属的\n每个殖民岛也都建设了\n枢密院，辅助当地总督\n进行行政管理'},
{AddrName = "帝国元老院长", AddrMapID = 82, AddrLocX = 186, AddrLocY = 124, IfEndLine = 1, NpcID = 11000, SampleDesc = '虽然帝国皇帝拥有所有\n权力，但在与联邦对抗\n的过程中，应国内贵族\n的要求，皇帝增设了元\n老院，不过元老院权力\n只限于对贵族关心的民\n生政策进行提案'},
{AddrName = "[装备店]", AddrMapID = 1, AddrLocX = 258, AddrLocY = 262, IfEndLine = 0},
{AddrName = "防具商", AddrMapID = 80, AddrLocX = 54, AddrLocY = 61, IfEndLine = 0, NpcID = 11016, SampleDesc = '即使再彪悍的人生也不\n能无视防具的重要啊'},
{AddrName = "武器商", AddrMapID = 80, AddrLocX = 59, AddrLocY = 68, IfEndLine = 0, NpcID = 11014, SampleDesc = '好的武器是英雄的生命\n，也会要了敌人的命'},
{AddrName = "饰品商", AddrMapID = 80, AddrLocX = 66, AddrLocY = 67, IfEndLine = 0, NpcID = 11018, SampleDesc = '想要拉风想要帅，请您\n快到这里来'},
{AddrName = "生产供应商", AddrMapID = 80, AddrLocX = 58, AddrLocY = 55, IfEndLine = 1, NpcID = 11022, SampleDesc = '没有生产就没有后勤，\n没有后勤就没有胜利'},
{AddrName = "[研究所]", AddrMapID = 1, AddrLocX = 288, AddrLocY = 239, IfEndLine = 0},
{AddrName = "装备保养员", AddrMapID = 78, AddrLocX = 58, AddrLocY = 62, IfEndLine = 0, NpcID = 11012, SampleDesc = '请记住，对待装备要像\n对待情人一样'},
{AddrName = "装备改造师", AddrMapID = 78, AddrLocX = 68, AddrLocY = 66, IfEndLine = 1, NpcID = 11008, SampleDesc = '即便伟大如爱因斯坦，\n也是从改造小板凳开始的'},
{AddrName = "[宝石店]", AddrMapID = 1, AddrLocX = 212, AddrLocY = 282, IfEndLine = 0},
{AddrName = "宝石商人", AddrMapID = 76, AddrLocX = 57, AddrLocY = 57, IfEndLine = 0, NpcID = 11024, SampleDesc = '其实美女和巨龙一样，\n她们的眼睛总是喜欢盯\n着闪闪发光的物体'},
{AddrName = "珠宝工匠", AddrMapID = 76, AddrLocX = 57, AddrLocY = 60, IfEndLine = 1, NpcID = 11010, SampleDesc = '明珠蒙尘是最大的罪过\n，快让宝石闪耀最大的\n光华吧'},
{AddrName = "[交易所]", AddrMapID = 1, AddrLocX = 245, AddrLocY = 175, IfEndLine = 0},
{AddrName = "帝国交易员", AddrMapID = 75, AddrLocX = 58, AddrLocY = 63, IfEndLine = 1, NpcID = 11304, SampleDesc = '投资一小步，\财富一大步！'},
{AddrName = "[学院]  ", AddrMapID = 1, AddrLocX = 190, AddrLocY = 235, IfEndLine = 0},
{AddrName = "战斗技能导师", AddrMapID = 79, AddrLocX = 45, AddrLocY = 73, IfEndLine = 0, NpcID = 11026, SampleDesc = '行走江湖，最重要的就\n是一技傍身'},
{AddrName = "生活技能导师", AddrMapID = 79, AddrLocX = 53, AddrLocY = 80, IfEndLine = 1, NpcID = 11268, SampleDesc = '学会用技能巧干，往往\n能令您的工作事半功倍'},
{AddrName = "[药店]  ", AddrMapID = 1, AddrLocX = 257, AddrLocY = 284, IfEndLine = 0},
{AddrName = "材料药品商", AddrMapID = 77, AddrLocX = 57, AddrLocY = 66, IfEndLine = 1, NpcID = 11020, SampleDesc = '人在江湖飘，哪有不挨\n刀，挨了刀，吃药包，\n包您想挨第二刀'},
{AddrName = "[教堂]  ", AddrMapID = 1, AddrLocX = 240, AddrLocY = 329, IfEndLine = 0},
{AddrName = "帝国主教", AddrMapID = 81, AddrLocX = 68, AddrLocY = 66, IfEndLine = 1, NpcID = 11004, SampleDesc = '你知道全世界哪位老大\n的小弟最多吗？'},
{AddrName = "[酒吧]  ", AddrMapID = 1, AddrLocX = 257, AddrLocY = 195, IfEndLine = 0},
{AddrName = "加入佣兵团", AddrMapID = 21, AddrLocX = 62, AddrLocY = 68, IfEndLine = 0, NpcID = 12144, SampleDesc = '从这里可以申请加入佣兵团'},
{AddrName = "结拜兄弟会", AddrMapID = 21, AddrLocX = 58, AddrLocY = 66, IfEndLine = 0, NpcID = 12188, SampleDesc = '人心散了，\n队伍不好带了～～'},
{AddrName = "建立战队", AddrMapID = 21, AddrLocX = 61, AddrLocY = 56, IfEndLine = 1, NpcID = 12261, SampleDesc = '想要成为王中之王吗？\n快来参加跨服联赛吧！'},
{AddrName = "切磋区", AddrMapID = 1, AddrLocX = 210, AddrLocY = 179, IfEndLine = 0},
{AddrName = "仓库管理员", AddrMapID = 1, AddrLocX = 296, AddrLocY = 312, IfEndLine = 0, SampleDesc = '您的财产放在这里绝对\n不会被人打劫'},
{AddrName = "邮箱", AddrMapID = 1, AddrLocX = 274, AddrLocY = 212, IfEndLine = 0},
{AddrName = "新手商人", AddrMapID = 1, AddrLocX = 212, AddrLocY = 212, IfEndLine = 0},
{AddrName = "装备收购处", AddrMapID = 1, AddrLocX = 274, AddrLocY = 212, IfEndLine = 1},
{AddrName = "进入房屋区", AddrMapID = 1, AddrLocX = 285, AddrLocY = 291, IfEndLine = 1},
}


-- 联邦重要地点表
LianBang_GoToAddress_Tab = 
{
{AddrName = "天空城出口", AddrMapID = 2, AddrLocX = 228, AddrLocY = 128, IfEndLine = 0},
{AddrName = "英雄大厅", AddrMapID = 2, AddrLocX = 273, AddrLocY = 172, IfEndLine = 1},
{AddrName = "[总督府]", AddrMapID = 2, AddrLocX = 223, AddrLocY = 328, IfEndLine = 0},
{AddrName = "联邦总督", AddrMapID = 67, AddrLocX = 130, AddrLocY = 168, IfEndLine = 0, NpcID = 11043, SampleDesc = '联邦第一执政官派驻本\n岛的最高行政长官，负\n责总揽联邦在本岛的一\n切事物，直接对第一执\n政负责'},
{AddrName = "联邦辅政官", AddrMapID = 67, AddrLocX = 64, AddrLocY = 112, IfEndLine = 0, NpcID = 11003, SampleDesc = '辅政官是直属第一执政\n官的行政辅佐机构，第\n一执政在联邦所属的殖\n民岛也都派驻了辅政官\n，辅助当地总督进行行\n政管理'},
{AddrName = "联邦议会议长", AddrMapID = 67, AddrLocX = 184, AddrLocY = 109, IfEndLine = 1, NpcID = 11001, SampleDesc = '随着权力逐渐向第一执\n政集中，联邦议会现在\n的提案渐渐的都集中在\n税率、建设等民生政策\n上面了，就连议长阁下\n近来也显得格外清闲'},
{AddrName = "[装备店]", AddrMapID = 2, AddrLocX = 223, AddrLocY = 169, IfEndLine = 0},
{AddrName = "防具商", AddrMapID = 62, AddrLocX = 70, AddrLocY = 62, IfEndLine = 0, NpcID = 11017, SampleDesc = '即使再彪悍的人生也不\n能无视防具的重要啊'},
{AddrName = "武器商", AddrMapID = 62, AddrLocX = 67, AddrLocY = 62, IfEndLine = 0, NpcID = 11015, SampleDesc = '好的武器是英雄的生命\n，也会要了敌人的命'},
{AddrName = "饰品商", AddrMapID = 62, AddrLocX = 57, AddrLocY = 61, IfEndLine = 0, NpcID = 11019, SampleDesc = '想要拉风想要帅，请您\n快到这里来'},
{AddrName = "生产供应商", AddrMapID = 62, AddrLocX = 56, AddrLocY = 51, IfEndLine = 1, NpcID = 11023, SampleDesc = '没有生产就没有后勤，\n没有后勤就没有胜利'},
{AddrName = "[研究所]", AddrMapID = 2, AddrLocX = 205, AddrLocY = 158, IfEndLine = 0},
{AddrName = "装备保养员", AddrMapID = 68, AddrLocX = 56, AddrLocY = 63, IfEndLine = 0, NpcID = 11013, SampleDesc = '请记住，对待装备要像\n对待情人一样'},
{AddrName = "装备改造师", AddrMapID = 68, AddrLocX = 60, AddrLocY = 64, IfEndLine = 1, NpcID = 11009, SampleDesc = '即便伟大如爱因斯坦，\n也是从改造小板凳开始的'},
{AddrName = "[宝石店]", AddrMapID = 2, AddrLocX = 148, AddrLocY = 301, IfEndLine = 0},
{AddrName = "宝石商人", AddrMapID = 69, AddrLocX = 54, AddrLocY = 65, IfEndLine = 0, NpcID = 11025, SampleDesc = '其实美女和巨龙一样，\n她们的眼睛总是喜欢盯\n着闪闪发光的物体'},
{AddrName = "珠宝工匠", AddrMapID = 69, AddrLocX = 67, AddrLocY = 65, IfEndLine = 1, NpcID = 11011, SampleDesc = '明珠蒙尘是最大的罪过\n，快让宝石闪耀最大的\n光华吧'},
{AddrName = "[交易所]", AddrMapID = 2, AddrLocX = 150, AddrLocY = 268, IfEndLine = 0},
{AddrName = "联邦交易员", AddrMapID = 66, AddrLocX = 52, AddrLocY = 73, IfEndLine = 1, NpcID = 11303, SampleDesc = '投资一小步，\财富一大步！'},
{AddrName = "[学院]  ", AddrMapID = 2, AddrLocX = 310, AddrLocY = 234, IfEndLine = 0},
{AddrName = "战斗技能导师", AddrMapID = 65, AddrLocX = 30, AddrLocY = 62, IfEndLine = 0, NpcID = 11027, SampleDesc = '行走江湖，最重要的就\n是一技傍身'},
{AddrName = "生活技能导师", AddrMapID = 65, AddrLocX = 84, AddrLocY = 57, IfEndLine = 1, NpcID = 11269, SampleDesc = '学会用技能巧干，往往\n能令您的工作事半功倍'},
{AddrName = "[药店]  ", AddrMapID = 2, AddrLocX = 225, AddrLocY = 147, IfEndLine = 0},
{AddrName = "材料药品商", AddrMapID = 64, AddrLocX = 59, AddrLocY = 55, IfEndLine = 1, NpcID = 11021, SampleDesc = '人在江湖飘，哪有不挨\n刀，挨了刀，吃药包，\n包您想挨第二刀'},
{AddrName = "[仓库]  ", AddrMapID = 2, AddrLocX = 231, AddrLocY = 182, IfEndLine = 0},
{AddrName = "仓库管理员", AddrMapID = 63, AddrLocX = 58, AddrLocY = 60, IfEndLine = 1, NpcID = 11227, SampleDesc = '您的财产放在这里绝对\n不会被人打劫'},
{AddrName = "[教堂]  ", AddrMapID = 2, AddrLocX = 333, AddrLocY = 265, IfEndLine = 0},
{AddrName = "联邦牧师", AddrMapID = 40, AddrLocX = 65, AddrLocY = 67, IfEndLine = 1, NpcID = 11005, SampleDesc = '你知道全世界哪位老大\n的小弟最多吗？'},
{AddrName = "[酒吧]  ", AddrMapID = 2, AddrLocX = 261, AddrLocY = 159, IfEndLine = 0},
{AddrName = "加入佣兵团", AddrMapID = 41, AddrLocX = 69, AddrLocY = 63, IfEndLine = 0, NpcID = 12144, SampleDesc = '从这里可以申请加入佣兵团'},
{AddrName = "结拜兄弟会", AddrMapID = 41, AddrLocX = 58, AddrLocY = 61, IfEndLine = 0, NpcID = 12188, SampleDesc = '人心散了，\n队伍不好带了～～'},
{AddrName = "建立战队", AddrMapID = 41, AddrLocX = 52, AddrLocY = 59, IfEndLine = 1, NpcID = 12261, SampleDesc = '想要成为王中之王吗？\n快来参加跨服联赛吧！'},
{AddrName = "切磋区", AddrMapID = 2, AddrLocX = 275, AddrLocY = 338, IfEndLine = 0},
{AddrName = "邮箱", AddrMapID = 2, AddrLocX = 247, AddrLocY = 187, IfEndLine = 0},
{AddrName = "新手商人", AddrMapID = 2, AddrLocX = 250, AddrLocY = 154, IfEndLine = 0},
{AddrName = "装备收购处", AddrMapID = 2, AddrLocX = 233, AddrLocY = 188, IfEndLine = 0},
{AddrName = "进入房屋区", AddrMapID = 2, AddrLocX = 260, AddrLocY = 141, IfEndLine = 1},
}


ChuanSongFuWu_Address_Tab = {
[9] = {
		--暗礁海
		{AddrName = "[钢铁城入口]", AddrLocX = 114,AddrLocY = 404,Level = 10,},
		{AddrName = "     空间传送塔", AddrLocX = 186, AddrLocY = 293,Level = 1,},
--		{AddrName = "     样板房", AddrLocX = 122, AddrLocY = 310},
		{AddrName = "     跨岛传送阵", AddrLocX = 235, AddrLocY = 352,KuaDao = 1,Level = 1,},
		{AddrName = "[阳光雨林入口]", AddrLocX = 292, AddrLocY = 39,Level = 8,},
		},
[23] = {
		--阳光雨林
		{AddrName = "[暗礁海入口]", AddrLocX = 93, AddrLocY = 377},
		{AddrName = "     双子岛", AddrLocX = 248, AddrLocY = 67},
		{AddrName = "     空间传送塔", AddrLocX = 208, AddrLocY = 286},
		{AddrName = "     塔夫的矿井", AddrLocX = 142, AddrLocY = 274},
		{AddrName = "     二档资源采集区", AddrLocX = 193, AddrLocY = 250},
		{AddrName = "[落日农庄入口]", AddrLocX = 402, AddrLocY = 116},
		},
		
[25] = {
		--麦穗平原
		{AddrName = "[天空城入口]", AddrLocX = 121, AddrLocY = 348,Level = 10,},
		{AddrName = "     空间传送塔", AddrLocX = 199, AddrLocY = 298,Level = 1,},
--		{AddrName = "     样板房", AddrLocX = 185, AddrLocY = 288},
		{AddrName = "     跨岛传送阵", AddrLocX = 96, AddrLocY = 277,KuaDao = 1,Level = 1,},
		{AddrName = "[珊瑚群岛入口]", AddrLocX = 386, AddrLocY = 175,Level = 8,},
		},
[10] = {
		--珊瑚群岛
		{AddrName = "[麦穗平原入口]", AddrLocX = 85, AddrLocY = 275},
		{AddrName = "     双子岛", AddrLocX = 344, AddrLocY = 322},
		{AddrName = "     空间传送塔", AddrLocX = 201, AddrLocY = 295},
		{AddrName = "     塔夫的矿井", AddrLocX = 183, AddrLocY = 357},
		{AddrName = "     二档资源采集区", AddrLocX = 232, AddrLocY = 319},
		{AddrName = "[娜纱湿地入口]", AddrLocX = 420, AddrLocY = 134},
		
		},
		
[32] = {
		--联邦公民（1级~10级）空间传送塔
		{AddrName = "离开空间传送塔",AddrMapID = 25, AddrLocX = 199, AddrLocY = 292},
		},
		
[52] = {
		--联邦公民（11级~25级）空间传送塔
		{AddrName = "离开空间传送塔",AddrMapID = 10, AddrLocX = 203, AddrLocY = 287},
		},	
		
[54] = {
		--联邦公民（26级~40级）空间传送塔
		{AddrName = "离开空间传送塔",AddrMapID = 98, AddrLocX = 303, AddrLocY = 326},
		},	
		
[56] = {
		--联邦公民（41级~55级）空间传送塔
		{AddrName = "离开空间传送塔",AddrMapID = 111, AddrLocX = 416, AddrLocY = 135},
		},	
		
[33] = {
		--帝国公民（1级~10级）空间传送塔
		{AddrName = "离开空间传送塔",AddrMapID = 9, AddrLocX = 186, AddrLocY = 287},
		},	
		
[42] = {
		--帝国公民（11级~25级）空间传送塔
		{AddrName = "离开空间传送塔",AddrMapID = 23, AddrLocX = 216, AddrLocY = 289},
		},	
		
[44] = {
		--帝国公民（26级~40级）空间传送塔
		{AddrName = "离开空间传送塔",AddrMapID = 99, AddrLocX = 413, AddrLocY = 411},
		},	
		
[46] = {
		--帝国公民（41级~55级）空间传送塔
		{AddrName = "离开空间传送塔",AddrMapID = 111, AddrLocX = 266, AddrLocY = 414},
		},
		
[91] = {
		--联邦英雄大厅
		{AddrName = "[天空城]", AddrLocX = 127, AddrLocY = 52},
		{AddrName = "     引导者", AddrLocX = 127, AddrLocY = 124, NpcID = 11500,},
		},
[92] = {
		--帝国英雄大厅
		{AddrName = "[钢铁城]", AddrLocX = 127, AddrLocY = 52},
		{AddrName = "     引导者", AddrLocX = 127, AddrLocY = 124, NpcID = 11500,},
		},
[98] = {
		--娜纱湿地
		{AddrName = "[珊瑚群岛入口]", AddrLocX = 255, AddrLocY = 560},
		{AddrName = "     空间传送塔", AddrLocX = 293, AddrLocY = 328},
		{AddrName = "[征战平原入口]", AddrLocX = 498, AddrLocY = 485},
		{AddrName = "[月暮草场入口]", AddrLocX = 582, AddrLocY = 419},
		},
		
[99] = {
		--落日农庄
		{AddrName = "[阳光雨林入口]", AddrLocX = 259, AddrLocY = 505},
		{AddrName = "     空间传送塔", AddrLocX = 418, AddrLocY = 415},
		{AddrName = "[征战平原入口]", AddrLocX = 261, AddrLocY = 247},
		{AddrName = "[月暮草场入口]", AddrLocX = 341, AddrLocY = 156},
		},
		
[101] = {
		--月暮草场
		{AddrName = "[落日农庄入口]", AddrLocX = 480, AddrLocY = 588},
		{AddrName = "[娜纱湿地入口]", AddrLocX = 276, AddrLocY = 374},
		{AddrName = "     恶鬼的地穴", AddrLocX = 436, AddrLocY = 444},
		{AddrName = "     英雄之塔入口", AddrLocX = 352, AddrLocY = 549,NeedCamp = 1},
		{AddrName = "     英雄之塔入口", AddrLocX = 367, AddrLocY = 564,NeedCamp = 0},
		{AddrName = "[沙暴绿洲入口]", AddrLocX = 553, AddrLocY = 352},
		},

[102] = {
		--沙暴绿洲
		{AddrName = "[月暮草场入口]", AddrLocX = 424, AddrLocY = 706},
		{AddrName = "     冰封隧道入口", AddrLocX = 493, AddrLocY = 508},
--		{AddrName = "     镜月城", AddrLocX = 686, AddrLocY = 443},
		{AddrName = "[光明遗迹入口]", AddrLocX = 766, AddrLocY = 492},
--		{AddrName = "[夜莺山谷入口]", AddrLocX = 617, AddrLocY = 223},
--		{AddrName = "[众神领域入口]", AddrLocX = 772, AddrLocY = 288},
		},

--[104] = {
--		--双子岛
--		{AddrName = "珊瑚群岛入口", AddrLocX = 439, AddrLocY = 221},
--		{AddrName = "阳光雨林入口", AddrLocX = 430, AddrLocY = 686},
--		},

[110] = {
		--夜莺山谷
		{AddrName = "[沙暴绿洲入口]", AddrLocX = 378, AddrLocY = 574},
		{AddrName = "     空间传送塔", AddrLocX = 304, AddrLocY = 464},
		{AddrName = "[叹息平原入口]", AddrLocX = 385, AddrLocY = 97},
		},
		
[111] = {
		--光明遗迹
		{AddrName = "[沙暴绿洲入口]", AddrLocX = 132, AddrLocY = 352},
		{AddrName = "[镜月城入口]", AddrLocX = 424, AddrLocY = 372},
		{AddrName = "[天空都市入口]", AddrLocX = 582, AddrLocY = 382},
		{AddrName = "     空间传送塔", AddrLocX = 283, AddrLocY = 563,NeedCamp = 0},
		{AddrName = "     空间传送塔", AddrLocX = 415, AddrLocY = 141,NeedCamp = 1},
--		{AddrName = "[鸣沙沙漠入口]", AddrLocX = 650, AddrLocY = 270},
		},
[120] = {
		--众神领域
		{AddrName = "[沙暴绿洲入口]", AddrLocX = 151, AddrLocY = 540},
		{AddrName = "[叹息平原入口]", AddrLocX = 251, AddrLocY = 223},
		{AddrName = "[鸣沙沙漠入口]", AddrLocX = 525, AddrLocY = 505},
		{AddrName = "     梦幻城", AddrLocX = 524, AddrLocY = 332},
		},
}



function CuanSongFuWu()
	-- 获取当前地图ID
	local ActorID = API_RequestGetActorID()
	local CampID = API_GetActorCamp(ActorID)
	local ActCurMapid = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(ActCurMapid)
	-- 判断当前地图ID
	-- 如果是在帝国主城
	local LaiYuan = API_ActorGetPropNum(ActorID,201)
	if ChuanSongFuWu_Address_Tab[StaticMapID] ~= nil then
		-- 传送
		if API_RequestGetNumber(1) == 1 then
			if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
				API_ResponseWrite('<br><text>快递中，无法使用传送服务！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return 
			end
			if API_ActorFindStatus(ActorID,519) then
				API_ResponseWrite('<br><text>摆摊中，无法使用传送服务！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return 
			end
			if API_ActorIsDying(ActorID) then
				API_ResponseWrite('<br><text>死亡状态无法使用传送服务！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return 
			end
			if API_VarDataGetNumber(ActorID,1,11816) > 0 then
				API_ResponseWrite('<br><text>在公交车上无法使用传送服务！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			local AddrID = API_RequestGetNumber(2)
			if ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].AddrName == nil or ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].AddrMapID == nil or ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].AddrLocX == nil then
				API_ResponseWrite('<br><text>传送服务暂停，请稍候再试。</text>')
				return
			end
			local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
			if ConvectionInfo ~= 0 then
				API_ActorSendMsg(ActorID,3,'正在传送中，请稍后')
			else
				local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
				local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
				local TimerTriggerID = API_CreateTimerTriggerG(ActorID,AddrID,1,5,'Convection_TimerTriggerCallFunc')
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
				local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(GLOBAL_ConvectionTimer)
				API_ActorSendMsg(ActorID,2,'传送服务开始，空间定位中……，需时'..GLOBAL_ConvectionTimerCN..'秒，定位期间请不要移动，否则将传送失败')
				StatusTimer = (GLOBAL_ConvectionTimer + 1) * 1000
				API_ActorAddStatus(ActorID,36002,StatusTimer)
				API_ActorShowProcess(ActorID,StatusTimer,410,360,'空间定位')
			end
			--API_ActorGoToMap(ActorID, DiGuo_GoToAddress_Tab[AddrID].AddrMapID, DiGuo_GoToAddress_Tab[AddrID].AddrLocX, DiGuo_GoToAddress_Tab[AddrID].AddrLocY)
		end
		--先要这里设一下,不然文字不会换行，因为界面窗口大小显示是后面设置的330，但是配置文件中的却是800多
		--这里其实只有宽度330有效
		API_ResponseWrite('<win rect="430,110,330,500"></win>')
		API_ResponseWrite('<name>导游服务</name>')
		API_ResponseWrite('<text>'..API_GetMapName(ActCurMapid)..'导游服务：</text>')
		local LastTime = API_VarDataGetNumber(ActorID,1,18110)
		local NowTime = os.time()
		local LengQueTime = os.difftime(NowTime,LastTime)
		local ColdTime = 20
		if LengQueTime < ColdTime then
			API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
		else
			API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
		end
		API_ResponseWrite('<text>欢迎来到'..API_GetMapName(ActCurMapid)..'，为使您快速踏上征途为国作战，总督特别提供了导游服务。选择你想去的地点，我会免费指引你到达目的地：</text><br><br>')
		local DaXiaoTiaoZheng = 0
		for AddrID in ChuanSongFuWu_Address_Tab[StaticMapID] do
			local MapID = ActCurMapid
			local ObjMapID = ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].AddrMapID
			local TileX = ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].AddrLocX
			local TileY = ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].AddrLocY
			local KuaDao = ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].KuaDao
			local NpcID = ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].NpcID
			local AddrName = ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].AddrName
			local XianShi = 0
			if KuaDao ~= nil and KuaDao == 1 then
				local ServerNum = 0
				for i = 1,10 do
					if API_ServerIsOpen(i) then
						ServerNum = ServerNum + 1
					end
				end
				if ServerNum > 1 then
					XianShi = 1
				end
			else
				XianShi = 1
			end
			local NeedCamp = ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].NeedCamp
			if NeedCamp ~= nil then
				if API_GetActorCamp(ActorID) ~= NeedCamp then
					XianShi = 0
				end
			end
			local NeedLevel = ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].Level
			if NeedLevel ~= nil then
				if API_GetActorExpLevel(ActorID) < NeedLevel then
					XianShi = 0
				end
			end
			if XianShi == 1 then
				if ObjMapID ~= nil then
					API_ResponseWrite('<br><a underline="1" href="CuanSongFuWu?1=1&2='..AddrID..'">'..AddrName..'  </a><br>')
				else
					if NpcID ~= nil then
						 API_ResponseWrite('<br><a npcid="'..NpcID..'" color="255,0,255" vcolor="0,255,255" underline="1" closewindow="0" mapid="'..MapID..'" x="'..TileX..'" y="'..TileY..'">'..AddrName..'  </a><br>')
					else
						API_ResponseWrite('<br><a color="255,0,255" vcolor="0,255,255" underline="1" closewindow="0" mapid="'..MapID..'" x="'..TileX..'" y="'..TileY..'">'..AddrName..'  </a><br>')
					end
				end
				DaXiaoTiaoZheng = DaXiaoTiaoZheng + 30
			end
		end
		API_ResponseWrite('<win rect="600,'.. 470 - DaXiaoTiaoZheng ..',330,'.. 180 + DaXiaoTiaoZheng ..'" move="1" alpha="200" balpha="100"></win>')
		API_ResponseWrite('<br><a>关闭窗口</a><br>')
		API_ResponseWrite('<text>(点击右下角</text><text color="255,0,255">龙卷风图标</text><text>可再次使用本导游服务)</text>')
	elseif StaticMapID == 1 or StaticMapID == 21 or StaticMapID == 75 or StaticMapID == 76 or StaticMapID == 77 or StaticMapID == 78 or StaticMapID == 79 or StaticMapID == 80 or StaticMapID == 81 or StaticMapID == 82 then
		-- 传送
		if API_RequestGetNumber(1) == 1 then
			if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
				API_ResponseWrite('<br><text>快递中，无法使用传送服务！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return 
			end
			if API_ActorFindStatus(ActorID,519) then
				API_ResponseWrite('<br><text>摆摊中，无法使用传送服务！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return 
			end
			if API_ActorIsDying(ActorID) then
				API_ResponseWrite('<br><text>死亡状态无法使用传送服务！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return 
			end
			if API_VarDataGetNumber(ActorID,1,11816) > 0 then
				API_ResponseWrite('<br><text>在公交车上无法使用传送服务！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			local AddrID = API_RequestGetNumber(2)
			if DiGuo_GoToAddress_Tab[AddrID].AddrName == nil or DiGuo_GoToAddress_Tab[AddrID].AddrMapID == nil or DiGuo_GoToAddress_Tab[AddrID].AddrLocX == nil or DiGuo_GoToAddress_Tab[AddrID].IfEndLine == nil then
				API_ResponseWrite('<br><text>传送服务暂停，请重新进入钢铁城再试。</text>')
				return
			end
			local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
			if ConvectionInfo ~= 0 then
				API_ActorSendMsg(ActorID,3,'正在传送中，请稍后')
			else
				local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
				local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
				local TimerTriggerID = API_CreateTimerTriggerG(ActorID,AddrID,1,5,'Convection_TimerTriggerCallFunc')
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
				local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(GLOBAL_ConvectionTimer)
				API_ActorSendMsg(ActorID,2,'传送服务开始，空间定位中……，需时'..GLOBAL_ConvectionTimerCN..'秒，定位期间请不要移动，否则将传送失败')
				StatusTimer = (GLOBAL_ConvectionTimer + 1) * 1000
				API_ActorAddStatus(ActorID,36002,StatusTimer)
				API_ActorShowProcess(ActorID,StatusTimer,410,360,'空间定位')
			end
			--API_ActorGoToMap(ActorID, DiGuo_GoToAddress_Tab[AddrID].AddrMapID, DiGuo_GoToAddress_Tab[AddrID].AddrLocX, DiGuo_GoToAddress_Tab[AddrID].AddrLocY)
		end
		local LastTime = API_VarDataGetNumber(ActorID,1,18110)
		local NowTime = os.time()
		local LengQueTime = os.difftime(NowTime,LastTime)
		local ColdTime = 20
		API_ResponseWrite('<win rect="600,140,335,500" move="1" alpha="200" balpha="100"></win>')
		API_ResponseWrite('<name>传送服务</name>')
		-- 打开帝国主城导航条窗口并给予导航条卷轴10441
		API_ResponseWrite('<text>钢铁城传送服务：</text>')
		if LengQueTime < ColdTime then
			API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
		else
			API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
		end
		API_ResponseWrite('<text>以下是钢铁城所有重要地点，为了缓解城内交通拥挤，总督特别提供了传送服务，而且都是免费的。</text><br><text>点击想去地方的名字：</text><br><br>')
		for AddrID in DiGuo_GoToAddress_Tab do
			if DiGuo_GoToAddress_Tab[AddrID].AddrName == nil or DiGuo_GoToAddress_Tab[AddrID].AddrMapID == nil or DiGuo_GoToAddress_Tab[AddrID].AddrLocX == nil or DiGuo_GoToAddress_Tab[AddrID].IfEndLine == nil then
				API_ResponseWrite('<br><text>传送服务暂停，请重新进入钢铁城再试。</text>')
				return
			end
			if DiGuo_GoToAddress_Tab[AddrID].NpcID ~= nil then
				if DiGuo_GoToAddress_Tab[AddrID].AddrMapID == StaticMapID then
					local NpcID = DiGuo_GoToAddress_Tab[AddrID].NpcID
					local MapID = DiGuo_GoToAddress_Tab[AddrID].AddrMapID
					local TileX = DiGuo_GoToAddress_Tab[AddrID].AddrLocX
					local TileY = DiGuo_GoToAddress_Tab[AddrID].AddrLocY
					local NeedPeerageLevel = DiGuo_GoToAddress_Tab[AddrID].PeerageLevel
					local PeerageLevel = API_GetActorPeerageLevel(ActorID)
					if NeedPeerageLevel ~= nil and PeerageLevel < NeedPeerageLevel then
						API_ResponseWrite('<a color="150,150,150" vcolor="0,255,255" underline="1" closewindow="0" mapid="'..MapID..'" x="'..TileX..'" y="'..TileY..'" npcid="'..NpcID..'">'..DiGuo_GoToAddress_Tab[AddrID].AddrName..'  </a>')
					else
						API_ResponseWrite('<a color="255,0,255" vcolor="0,255,255" underline="1" closewindow="0" mapid="'..MapID..'" x="'..TileX..'" y="'..TileY..'" npcid="'..NpcID..'">'..DiGuo_GoToAddress_Tab[AddrID].AddrName..'  </a>')
					end
				else
					local SampleDesc = DiGuo_GoToAddress_Tab[AddrID].SampleDesc
					API_ResponseWrite('<a allcolor="255,255,255" tip="'..SampleDesc..'" closewindow="0">'..DiGuo_GoToAddress_Tab[AddrID].AddrName..'  </a>')
				end
			else
				local NeedPeerageLevel = DiGuo_GoToAddress_Tab[AddrID].PeerageLevel
				local PeerageLevel = API_GetActorPeerageLevel(ActorID)
				if NeedPeerageLevel ~= nil and PeerageLevel < NeedPeerageLevel then
					API_ResponseWrite('<a color="255,0,255" underline="1" href="CuanSongFuWu?1=1&2='..AddrID..'">'..DiGuo_GoToAddress_Tab[AddrID].AddrName..'  </a>')
				else
					API_ResponseWrite('<a underline="1" href="CuanSongFuWu?1=1&2='..AddrID..'">'..DiGuo_GoToAddress_Tab[AddrID].AddrName..'  </a>')
				end
			end
			if DiGuo_GoToAddress_Tab[AddrID].IfEndLine ~= 0 then
				API_ResponseWrite('<br><br>')
			end
		end
		API_ResponseWrite('<br><a>关闭窗口</a><br>')
		API_ResponseWrite('<text>(点击右下角</text><text color="255,0,255">龙卷风图标</text><text>可再次使用本传送服务)</text>')
		--if ActCurMapid == 1 then
			--API_ResponseFlush(ActorID)
		--end
	-- 如果是在联邦主城
	elseif StaticMapID == 2 or StaticMapID == 40 or StaticMapID == 41 or StaticMapID == 62 or StaticMapID == 63 or StaticMapID == 64 or StaticMapID == 65 or StaticMapID == 66 or StaticMapID == 67 or StaticMapID == 68 or StaticMapID == 69 then
		-- 传送
		if API_RequestGetNumber(1) == 1 then
			if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
				API_ResponseWrite('<br><text>快递中，无法使用传送服务！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return 
			end
			if API_ActorFindStatus(ActorID,519) then
				API_ResponseWrite('<br><text>摆摊中，无法使用传送服务！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return 
			end
			if API_ActorIsDying(ActorID) then
				API_ResponseWrite('<br><text>死亡状态无法使用传送服务！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return 
			end
			if API_VarDataGetNumber(ActorID,1,11816) > 0 then
				API_ResponseWrite('<br><text>在公交车上无法使用传送服务！</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			local AddrID = API_RequestGetNumber(2)
			if LianBang_GoToAddress_Tab[AddrID].AddrName == nil or LianBang_GoToAddress_Tab[AddrID].AddrMapID == nil or LianBang_GoToAddress_Tab[AddrID].AddrLocX == nil or LianBang_GoToAddress_Tab[AddrID].IfEndLine == nil then
				API_ResponseWrite('<br><text>传送服务暂停，请重新进入天空城再试。</text>')
				return
			end
			local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
			if ConvectionInfo ~= 0 then
				API_ActorSendMsg(ActorID,3,'正在传送中，请稍后')
			else
				local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
				local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
				local TimerTriggerID = API_CreateTimerTriggerG(ActorID,AddrID,1,5,'Convection_TimerTriggerCallFunc')
				API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
				local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(GLOBAL_ConvectionTimer)
				API_ActorSendMsg(ActorID,2,'传送服务开始，空间定位中……，需时'..GLOBAL_ConvectionTimerCN..'秒，定位期间请不要移动，否则将传送失败')
				StatusTimer = (GLOBAL_ConvectionTimer + 1) * 1000
				API_ActorAddStatus(ActorID,36003,StatusTimer)
				API_ActorShowProcess(ActorID,StatusTimer,410,360,'空间定位')
			end
			--API_ActorGoToMap(ActorID, LianBang_GoToAddress_Tab[AddrID].AddrMapID, LianBang_GoToAddress_Tab[AddrID].AddrLocX, LianBang_GoToAddress_Tab[AddrID].AddrLocY)
		end
		local LastTime = API_VarDataGetNumber(ActorID,1,18110)
		local NowTime = os.time()
		local LengQueTime = os.difftime(NowTime,LastTime)
		local ColdTime = 20
		
		API_ResponseWrite('<win rect="590,110,330,515" move="1" alpha="200" balpha="100"></win>')
		API_ResponseWrite('<name>传送服务</name>')
		-- 打开联邦主城导航条窗口并给予导航条卷轴10441
		API_ResponseWrite('<text>天空城传送服务：</text>')
		if LengQueTime < ColdTime then
			API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
		else
			API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
		end
		API_ResponseWrite('<text>以下是天空城所有重要地点，为了缓解城内交通拥挤，总督特别提供了传送服务，而且都是免费的。</text><br><text>点击想去地方的名字：</text><br><br>')
		for AddrID in LianBang_GoToAddress_Tab do
			if LianBang_GoToAddress_Tab[AddrID].AddrName == nil or LianBang_GoToAddress_Tab[AddrID].AddrMapID == nil or LianBang_GoToAddress_Tab[AddrID].AddrLocX == nil or LianBang_GoToAddress_Tab[AddrID].IfEndLine == nil then
				API_ResponseWrite('<br><text>传送服务暂停，请重新进入天空城再试。</text>')
				return
			end
			if LianBang_GoToAddress_Tab[AddrID].NpcID ~= nil then
				if LianBang_GoToAddress_Tab[AddrID].AddrMapID == StaticMapID then
					local NpcID = LianBang_GoToAddress_Tab[AddrID].NpcID
					local MapID = LianBang_GoToAddress_Tab[AddrID].AddrMapID
					local TileX = LianBang_GoToAddress_Tab[AddrID].AddrLocX
					local TileY = LianBang_GoToAddress_Tab[AddrID].AddrLocY
					local NeedPeerageLevel = LianBang_GoToAddress_Tab[AddrID].PeerageLevel
					local PeerageLevel = API_GetActorPeerageLevel(ActorID)
					if NeedPeerageLevel ~= nil and PeerageLevel < NeedPeerageLevel then
						API_ResponseWrite('<a color="150,150,150" vcolor="0,255,255" underline="1" closewindow="0" mapid="'..MapID..'" x="'..TileX..'" y="'..TileY..'" npcid="'..NpcID..'">'..LianBang_GoToAddress_Tab[AddrID].AddrName..'  </a>')
					else
						API_ResponseWrite('<a color="255,0,255" vcolor="0,255,255" underline="1" closewindow="0" mapid="'..MapID..'" x="'..TileX..'" y="'..TileY..'" npcid="'..NpcID..'">'..LianBang_GoToAddress_Tab[AddrID].AddrName..'  </a>')
					end
				else
					local SampleDesc = LianBang_GoToAddress_Tab[AddrID].SampleDesc
					API_ResponseWrite('<a allcolor="255,255,255" tip="'..SampleDesc..'" closewindow="0">'..LianBang_GoToAddress_Tab[AddrID].AddrName..'  </a>')
				end
			else
				local NeedPeerageLevel = LianBang_GoToAddress_Tab[AddrID].PeerageLevel
				local PeerageLevel = API_GetActorPeerageLevel(ActorID)
				if NeedPeerageLevel ~= nil and PeerageLevel < NeedPeerageLevel then
					API_ResponseWrite('<a color="255,0,255" underline="1" href="CuanSongFuWu?1=1&2='..AddrID..'">'..LianBang_GoToAddress_Tab[AddrID].AddrName..'  </a>')
				else
					API_ResponseWrite('<a underline="1" href="CuanSongFuWu?1=1&2='..AddrID..'">'..LianBang_GoToAddress_Tab[AddrID].AddrName..'  </a>')
				end
			end
			if LianBang_GoToAddress_Tab[AddrID].IfEndLine ~= 0 then
				API_ResponseWrite('<br><br>')
			end
		end
		API_ResponseWrite('<br><a>关闭窗口</a><br>')
		API_ResponseWrite('<text>(点击右下角</text><text color="255,0,255">龙卷风图标</text><text>可再次使用本传送服务)</text>')
		--if ActCurMapid == 1 then
			--API_ResponseFlush(ActorID)
		--end
	end
	API_ResponseFlush(ActorID)
end

function SunyiFuWu()
	local ActorID = API_RequestGetActorID()
	local CampID = API_GetActorCamp(ActorID)
	local LastTime = API_VarDataGetNumber(ActorID,1,18110)
	local NowTime = os.time()
	local LengQueTime = os.difftime(NowTime,LastTime)
	local ColdTime = 20
	local ActCurMapid = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(ActCurMapid)
	if ChuanSongFuWu_Address_Tab[StaticMapID] ~= nil or StaticMapID == 1 or StaticMapID == 21 or StaticMapID == 75 or StaticMapID == 76 or StaticMapID == 77 or StaticMapID == 78 or StaticMapID == 79 or StaticMapID == 80 or StaticMapID == 81 or StaticMapID == 82 or StaticMapID == 2 or StaticMapID == 40 or StaticMapID == 41 or StaticMapID == 62 or StaticMapID == 63 or StaticMapID == 64 or StaticMapID == 65 or StaticMapID == 66 or StaticMapID == 67 or StaticMapID == 68 or StaticMapID == 69 or StaticMapID == 91 or StaticMapID == 92 then
		if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
			API_ActorSendMsg(ActorID,3,'快递中，无法使用瞬移服务！')
			return 
		end
		if API_ActorFindStatus(ActorID,519) then
			API_ActorSendMsg(ActorID,3,'摆摊中，无法使用瞬移服务！')
			return 
		end
		if API_ActorIsDying(ActorID) then
			API_ActorSendMsg(ActorID,3,'死亡状态不能使用瞬移服务')
			return 
		end
		if API_ActorGetPropNum(ActorID,180) == 1 then
			API_ActorSendMsg(ActorID,3,'战斗状态不能使用瞬移服务')
			return 
		end
		if LengQueTime >= ColdTime then 
			API_ActorStartSelect(ActorID,'SunyiFuWu_ChuanShong',16) 
			API_ActorSendMsg(ActorID,3,'点击您想传送到的目的地')
		else
			local shengyu = ColdTime - LengQueTime
			API_ActorSendMsg(ActorID,3,'瞬移服务还需冷却 '..shengyu..' 秒')
			CuanSongFuWu()
		end
	end
end

function SunyiFuWu_ChuanShong()
	local ActorID = API_RequestGetNumber(1) 
	local CampID = API_GetActorCamp(ActorID)
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 
	local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(MapID)
	local LastTime = API_VarDataGetNumber(ActorID,1,18110)
	local NowTime = os.time()
	local LengQueTime = os.difftime(NowTime,LastTime)
	local ColdTime = 20
	if ChuanSongFuWu_Address_Tab[StaticMapID] ~= nil or StaticMapID == 1 or StaticMapID == 21 or StaticMapID == 75 or StaticMapID == 76 or StaticMapID == 77 or StaticMapID == 78 or StaticMapID == 79 or StaticMapID == 80 or StaticMapID == 81 or StaticMapID == 82 or StaticMapID == 2 or StaticMapID == 40 or StaticMapID == 41 or StaticMapID == 62 or StaticMapID == 63 or StaticMapID == 64 or StaticMapID == 65 or StaticMapID == 66 or StaticMapID == 67 or StaticMapID == 68 or StaticMapID == 69 or StaticMapID == 91 or StaticMapID == 92 then
		if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
			API_ActorSendMsg(ActorID,3,'快递中，无法使用瞬移服务！')
			return 
		end
		if API_ActorFindStatus(ActorID,519) then
			API_ActorSendMsg(ActorID,3,'摆摊中，无法使用瞬移服务！')
			return 
		end
		if API_ActorIsDying(ActorID) then
			API_ActorSendMsg(ActorID,3,'死亡状态不能使用瞬移服务')
			return 
		end
		if API_ActorGetPropNum(ActorID,180) == 1 then
			API_ActorSendMsg(ActorID,3,'战斗状态不能使用瞬移服务')
			return 
		end
		if LengQueTime >= ColdTime and not API_ActorIsDying(ActorID) then 
			if PublicFun_AccountDistance(TileX,TileY,SelectTileX,SelectTileY) < 20 then
				if not API_HaveNoBlockTile(MapID,SelectTileX,SelectTileY,4) then
					API_ActorStartSelect(ActorID,'SunyiFuWu_ChuanShong',16)
					return
				end
				API_VarDataSetNumber(ActorID,1,18110,NowTime)
				API_ActorAddStatus(ActorID,877001,0)
				API_ActorGoToMap(ActorID,MapID,SelectTileX,SelectTileY)
				API_ActorAddStatus(ActorID,877001,0)
			else
				API_ActorStartSelect(ActorID,'SunyiFuWu_ChuanShong',16)
				API_ActorSendMsg(ActorID,3,'距离太远，瞬移失败！')
			end
		else
			local shengyu = ColdTime - LengQueTime
			API_ActorSendMsg(ActorID,3,'瞬移服务还需冷却 '..shengyu..' 秒')
		end
	end
end

function Convection_TimerTriggerCallFunc(ActorID,AddrID)
	local LaiYuan = API_ActorGetPropNum(ActorID,201)
	if API_ActorIsOnline(ActorID) then
		local CampID = API_GetActorCamp(ActorID)
		local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
		ConvectionInfo = math.mod(ConvectionInfo,1000000000)
		local ConvectionSign = math.floor(ConvectionInfo/100000000)
		local BackTileXYandTime = math.mod(ConvectionInfo,100000000)
		local BackTileYandTime = math.mod(BackTileXYandTime,100000)
		local BackTileX = math.floor(BackTileXYandTime/100000)
		local BackTileY = math.floor(BackTileYandTime/100)
		local Time = math.mod(BackTileYandTime,100)
		local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
		if API_VarDataGetNumber(ActorID,1,101) > 0 or API_VarDataGetNumber(ActorID,1,102) > 0 then
			API_ActorSendMsg(ActorID,3,'快递中，无法使用传送服务！')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'空间定位')
			return 
		end
		if API_ActorFindStatus(ActorID,519) then
			API_ActorSendMsg(ActorID,3,'摆摊中，无法使用传送服务！')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'空间定位')
			return 
		end
		if API_ActorIsDying(ActorID) then
			API_ActorSendMsg(ActorID,3,'人物死亡，传送失败！')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'空间定位')
			return 
		end
		if API_VarDataGetNumber(ActorID,1,11816) > 0 then
			API_ActorSendMsg(ActorID,3,'在公交车上无法使用传送服务！')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'空间定位')
			return
		end
		if TileX ~= BackTileX or TileY ~= BackTileY or API_ActorIsDying(ActorID) then
			API_ActorSendMsg(ActorID,3,'人物移动，传送失败')
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'空间定位')
		elseif Time >= GLOBAL_ConvectionTimer then
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,0)
			local TimerTriggerID = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID)
			API_DestroyTriggerG(TimerTriggerID)
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,0)
			API_ActorRemoveStatus(ActorID,36002)
			API_ActorRemoveStatus(ActorID,36003)
			API_ActorShowProcess(ActorID,0,410,360,'空间定位')
			local ActCurMapid = API_GetActorMapID(ActorID)
			local StaticMapID = API_GetMapConfigID(ActCurMapid)
			if StaticMapID == 1 or StaticMapID == 21 or StaticMapID == 75 or StaticMapID == 76 or StaticMapID == 77 or StaticMapID == 78 or StaticMapID == 79 or StaticMapID == 80 or StaticMapID == 81 or StaticMapID == 82 then
				if StaticMapID == 82 and API_VarDataGetNumber(ActorID,1,18336) == 1 then
					API_VarDataSetNumber(ActorID,1,18336,2)
					if GLOBAL_FengXiangBiao_DateList[4][1][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[4][1][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[4][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[4][1][LaiYuan] + 1
					end
				end
				API_ActorGoToMap(ActorID, DiGuo_GoToAddress_Tab[AddrID].AddrMapID, DiGuo_GoToAddress_Tab[AddrID].AddrLocX, DiGuo_GoToAddress_Tab[AddrID].AddrLocY)
			elseif StaticMapID == 2 or StaticMapID == 40 or StaticMapID == 41 or StaticMapID == 62 or StaticMapID == 63 or StaticMapID == 64 or StaticMapID == 65 or StaticMapID == 66 or StaticMapID == 67 or StaticMapID == 68 or StaticMapID == 69 then
				if StaticMapID == 67 and API_VarDataGetNumber(ActorID,1,18336) == 1 then
					API_VarDataSetNumber(ActorID,1,18336,2)
					if GLOBAL_FengXiangBiao_DateList[4][1][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[4][1][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[4][1][LaiYuan] = GLOBAL_FengXiangBiao_DateList[4][1][LaiYuan] + 1
					end
				end
				API_ActorGoToMap(ActorID, LianBang_GoToAddress_Tab[AddrID].AddrMapID, LianBang_GoToAddress_Tab[AddrID].AddrLocX, LianBang_GoToAddress_Tab[AddrID].AddrLocY)
			elseif StaticMapID == 33 or StaticMapID == 42 or StaticMapID == 44 or StaticMapID == 46 or StaticMapID == 32 or StaticMapID == 52 or StaticMapID == 54 or StaticMapID == 56 then
				if StaticMapID == 33 or StaticMapID == 42 or StaticMapID == 32 or StaticMapID == 52 then
					local SaverID= API_VarDataGetNumber(ActorID,1,18366)
					API_ActorGoToMapEx(ActorID,SaverID, ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].AddrMapID, ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].AddrLocX, ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].AddrLocY)
				else
					API_ActorGoToMap(ActorID, ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].AddrMapID, ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].AddrLocX, ChuanSongFuWu_Address_Tab[StaticMapID][AddrID].AddrLocY)
				end
			end
		else
			Time = Time + 1
			ConvectionInfo = ConvectionSign * 100000000 + TileX * 100000 + TileY * 100 + Time
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
		end
	end
end

