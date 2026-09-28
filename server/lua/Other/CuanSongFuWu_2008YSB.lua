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
	if API_VarDataGetNumber(ActorID,1,7751) ~= 0 and API_VarDataGetNumber(ActorID,1,7900) == 0 then
		if StaticMapID == 2 or StaticMapID == 40 or StaticMapID == 41 or StaticMapID == 62 or StaticMapID == 63 or StaticMapID == 64 or StaticMapID == 65 or StaticMapID == 66 or StaticMapID == 67 or StaticMapID == 68 or StaticMapID == 69 or StaticMapID == 71 or StaticMapID == 8 or StaticMapID == 10 or StaticMapID == 25 or StaticMapID == 32 or StaticMapID == 91 then
			if CampID == 1 or StaticMapID == 8 then
			-- 给予导航条卷轴
				API_AddTaskScrollEx(ActorID, 30000, 10441, 'CuanSongFuWu',0)
				if StaticMapID ~= 67 then
					CuanSongFuWu()
				elseif Fun_IsCompletedTask(ActorID,301) then
					CuanSongFuWu()
				end
			end
		elseif StaticMapID == 1 or StaticMapID == 70 or StaticMapID == 8 or StaticMapID == 9 or StaticMapID == 21 or StaticMapID == 23 or StaticMapID == 70 or StaticMapID == 71 or StaticMapID == 75 or StaticMapID == 76 or StaticMapID == 77 or StaticMapID == 78 or StaticMapID == 79 or StaticMapID == 80 or StaticMapID == 81 or StaticMapID == 82 or StaticMapID == 33 or StaticMapID == 92  then
			if CampID == 0 or StaticMapID == 8 then
			-- 给予导航条卷轴
				API_AddTaskScrollEx(ActorID, 30000, 10441, 'CuanSongFuWu',0)
				if StaticMapID ~= 82 then
					CuanSongFuWu()
				elseif Fun_IsCompletedTask(ActorID,301) then
					CuanSongFuWu()
				end
			end
		elseif StaticMapID == 11 or StaticMapID == 12 or StaticMapID == 13 or StaticMapID == 14 or StaticMapID == 17 or StaticMapID == 18 or StaticMapID == 19 or StaticMapID == 20 or StaticMapID == 83 or StaticMapID == 84 or StaticMapID == 85 or StaticMapID == 86 then
			API_AddTaskScrollEx(ActorID, 30000, 10441, 'CuanSongFuWu',0)
			if (StaticMapID == 18 or StaticMapID == 20) and API_VarDataGetNumber(ActorID,1,102) == 0 then
				CuanSongFuWu()
			end
		elseif StaticMapID == 33 or StaticMapID == 42 or StaticMapID == 43 or StaticMapID == 44 or StaticMapID == 45 or StaticMapID == 46 or StaticMapID == 47 or StaticMapID == 48 or StaticMapID == 49 or StaticMapID == 50 or StaticMapID == 51 then
			if CampID == 0 then
				API_AddTaskScrollEx(ActorID, 30000, 10441, 'CuanSongFuWu',0)
			end
		elseif StaticMapID == 32 or StaticMapID == 52 or StaticMapID == 53 or StaticMapID == 54 or StaticMapID == 55 or StaticMapID == 56 or StaticMapID == 57 or StaticMapID == 58 or StaticMapID == 59 or StaticMapID == 60 or StaticMapID == 61 then
			if CampID == 1 then
				API_AddTaskScrollEx(ActorID, 30000, 10441, 'CuanSongFuWu',0)
			end
		elseif StaticMapID == 96 or StaticMapID == 97 then
			local TaskStep = API_VarDataGetNumber(ActorID,1,GLOBAL_FoolNewActorTaskStep)
			if TaskStep >= 61 then
				API_AddTaskScrollEx(ActorID, 30000, 10441, 'CuanSongFuWu',1)
				CuanSongFuWu()
			end
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
{AddrName = "英雄广场", AddrMapID = 1, AddrLocX = 267, AddrLocY = 177, IfEndLine = 0},
{AddrName = "跨岛传送阵", AddrMapID = 1, AddrLocX = 267, AddrLocY = 177, IfEndLine = 1},
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
{AddrName = "战斗技能导师", AddrMapID = 79, AddrLocX = 51, AddrLocY = 68, IfEndLine = 0, NpcID = 11026, SampleDesc = '行走江湖，最重要的就\n是一技傍身'},
{AddrName = "生活技能导师", AddrMapID = 79, AddrLocX = 55, AddrLocY = 73, IfEndLine = 1, NpcID = 11268, SampleDesc = '学会用技能巧干，往往\n能令您的工作事半功倍'},
{AddrName = "[药店]  ", AddrMapID = 1, AddrLocX = 257, AddrLocY = 284, IfEndLine = 0},
{AddrName = "材料药品商", AddrMapID = 77, AddrLocX = 57, AddrLocY = 66, IfEndLine = 1, NpcID = 11020, SampleDesc = '人在江湖飘，哪有不挨\n刀，挨了刀，吃药包，\n包您想挨第二刀'},
{AddrName = "[教堂]  ", AddrMapID = 1, AddrLocX = 240, AddrLocY = 329, IfEndLine = 0},
{AddrName = "帝国主教", AddrMapID = 81, AddrLocX = 68, AddrLocY = 66, IfEndLine = 1, NpcID = 11004, SampleDesc = '你知道全世界哪位老大\n的小弟最多吗？'},
{AddrName = "[酒吧]  ", AddrMapID = 1, AddrLocX = 257, AddrLocY = 195, IfEndLine = 0},
{AddrName = "调酒师", AddrMapID = 21, AddrLocX = 60, AddrLocY = 57, IfEndLine = 0, NpcID = 11574, SampleDesc = '威士忌、白兰地、伏特加、二锅头一个都没\n果冻、药水一个都不能少……'},
{AddrName = "佣兵团管理员", AddrMapID = 21, AddrLocX = 58, AddrLocY = 66, IfEndLine = 1, NpcID = 11006, SampleDesc = '人心散了，\n队伍不好带了～～'},
{AddrName = "竞技场", AddrMapID = 1, AddrLocX = 205, AddrLocY = 173, IfEndLine = 0},
{AddrName = "仓库管理员", AddrMapID = 1, AddrLocX = 296, AddrLocY = 312, IfEndLine = 0, SampleDesc = '您的财产放在这里绝对\n不会被人打劫'},
{AddrName = "邮箱", AddrMapID = 1, AddrLocX = 274, AddrLocY = 212, IfEndLine = 0},
{AddrName = "新手商人", AddrMapID = 1, AddrLocX = 212, AddrLocY = 212, IfEndLine = 0},
{AddrName = "装备收购处", AddrMapID = 1, AddrLocX = 274, AddrLocY = 212, IfEndLine = 1},
}

-- 暗礁海传送表
AnJiaoHai_GoToAddress_Tab = 
{
{AddrName = "[钢铁城入口]", AddrMapID = 9, AddrLocX = 140, AddrLocY = 385, IfEndLine = 1, CampID = 0},
{AddrName = "    公民空间传送塔", AddrMapID = 9, AddrLocX = 199, AddrLocY = 389, IfEndLine = 1, CampID = 0},
{AddrName = "    男爵空间传送塔", AddrMapID = 9, AddrLocX = 120, AddrLocY = 358, IfEndLine = 1, CampID = 0, PeerageLevel = 2,},
{AddrName = "    高级男爵空间传送塔", AddrMapID = 9, AddrLocX = 74, AddrLocY = 300, IfEndLine = 1, CampID = 0, PeerageLevel = 2,},
{AddrName = "    国有资源采集区", AddrMapID = 9, AddrLocX = 116, AddrLocY = 314, IfEndLine = 1, CampID = 0},
{AddrName = "    1档资源采集区A", AddrMapID = 9, AddrLocX = 235, AddrLocY = 351, IfEndLine = 1, CampID = 0},
{AddrName = "    1档资源采集区B", AddrMapID = 9, AddrLocX = 174, AddrLocY = 302, IfEndLine = 1, CampID = 0, PeerageLevel = 2,},
{AddrName = "    2档资源采集区A", AddrMapID = 9, AddrLocX = 145, AddrLocY = 244, IfEndLine = 1, CampID = 0, PeerageLevel = 2,},
{AddrName = "    2档资源采集区B", AddrMapID = 9, AddrLocX = 226, AddrLocY = 229, IfEndLine = 1, CampID = 0, PeerageLevel = 2,},
{AddrName = "    3档资源采集区A", AddrMapID = 9, AddrLocX = 276, AddrLocY = 143, IfEndLine = 1, CampID = 0, PeerageLevel = 2,},
{AddrName = "[阳光雨林入口]", AddrMapID = 9, AddrLocX = 55, AddrLocY = 331, IfEndLine = 1, CampID = 0, PeerageLevel = 2,},
}
-- 阳光雨林传送表
YangGuangYuLing_GoToAddress_Tab = 
{
{AddrName = "[暗礁海入口]", AddrMapID = 23, AddrLocX = 390, AddrLocY = 242, IfEndLine = 1, CampID = 0},
{AddrName = "    子爵空间传送塔", AddrMapID = 23, AddrLocX =319, AddrLocY = 290, IfEndLine = 1, CampID = 0},
{AddrName = "    高级子爵空间传送塔", AddrMapID = 23, AddrLocX = 329, AddrLocY = 186, IfEndLine = 1, CampID = 0},
{AddrName = "    伯爵空间传送塔", AddrMapID = 23, AddrLocX = 152, AddrLocY = 276, IfEndLine = 1, CampID = 0},
{AddrName = "    高级伯爵空间传送塔", AddrMapID = 23, AddrLocX = 329, AddrLocY = 143, IfEndLine = 1, CampID = 0},
{AddrName = "    侯爵空间传送塔", AddrMapID = 23, AddrLocX = 229, AddrLocY = 172, IfEndLine = 1, CampID = 0},
{AddrName = "    高级侯爵空间传送塔", AddrMapID = 23, AddrLocX = 251, AddrLocY = 93, IfEndLine = 1, CampID = 0},
{AddrName = "[钢铁隧道入口]", AddrMapID = 23, AddrLocX = 245, AddrLocY = 84, IfEndLine = 1, CampID = 0},
}
-- 钢铁隧道传送表
GangTieShuiDao_GoToAddress_Tab = 
{
{AddrName = "[阳光雨林入口]", AddrMapID = 70, AddrLocX = 101, AddrLocY = 229, IfEndLine = 1, CampID = 0},
{AddrName = "[火山冰原入口]", AddrMapID = 70, AddrLocX = 148, AddrLocY = 15, IfEndLine = 1, CampID = 0},
}


-- 联邦重要地点表
LianBang_GoToAddress_Tab = 
{
{AddrName = "天空城出口", AddrMapID = 2, AddrLocX = 228, AddrLocY = 128, IfEndLine = 0},
{AddrName = "英雄广场", AddrMapID = 2, AddrLocX = 245, AddrLocY = 131, IfEndLine = 0},
{AddrName = "跨岛传送阵", AddrMapID = 2, AddrLocX = 245, AddrLocY = 131, IfEndLine = 1},
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
{AddrName = "调酒师", AddrMapID = 41, AddrLocX = 58, AddrLocY = 66, IfEndLine = 0, NpcID = 11575, SampleDesc = '威士忌、白兰地、伏特加、二锅头一个都没\n果冻、药水一个都不能少……'},
{AddrName = "佣兵团管理员", AddrMapID = 41, AddrLocX = 58, AddrLocY = 61, IfEndLine = 1, NpcID = 11007, SampleDesc = '人心散了，\n队伍不好带了～～'},
{AddrName = "竞技场", AddrMapID = 2, AddrLocX = 271, AddrLocY = 340, IfEndLine = 0},
{AddrName = "邮箱", AddrMapID = 2, AddrLocX = 247, AddrLocY = 187, IfEndLine = 0},
{AddrName = "新手商人", AddrMapID = 2, AddrLocX = 250, AddrLocY = 154, IfEndLine = 0},
{AddrName = "装备收购处", AddrMapID = 2, AddrLocX = 233, AddrLocY = 188, IfEndLine = 1},
}

-- 珊瑚群岛重要地点表
ShanHuQunDao_GoToAddress_Tab = 
{
{AddrName = "[天空城入口]", AddrMapID = 10, AddrLocX = 199, AddrLocY = 180, IfEndLine = 1, CampID = 1},
{AddrName = "    公民空间传送塔", AddrMapID = 10, AddrLocX = 252, AddrLocY = 216, IfEndLine = 1, CampID = 1},
{AddrName = "    男爵空间传送塔", AddrMapID = 10, AddrLocX = 186, AddrLocY = 317, IfEndLine = 1, CampID = 1, PeerageLevel = 2,},
{AddrName = "    高级男爵空间传送塔", AddrMapID = 10, AddrLocX = 151, AddrLocY = 264, IfEndLine = 1, CampID = 1, PeerageLevel = 2,},
{AddrName = "    国有资源采集区", AddrMapID = 10, AddrLocX = 180, AddrLocY = 238, IfEndLine = 1, CampID = 1},
{AddrName = "    1档资源采集区A", AddrMapID = 10, AddrLocX = 338, AddrLocY = 127, IfEndLine = 1, CampID = 1},
{AddrName = "    1档资源采集区B", AddrMapID = 10, AddrLocX = 143, AddrLocY = 322, IfEndLine = 1, CampID = 1, PeerageLevel = 2,},
{AddrName = "    2档资源采集区A", AddrMapID = 10, AddrLocX = 347, AddrLocY = 229, IfEndLine = 1, CampID = 1, PeerageLevel = 2,},
{AddrName = "    2档资源采集区B", AddrMapID = 10, AddrLocX = 310, AddrLocY = 264, IfEndLine = 1, CampID = 1, PeerageLevel = 2,},
{AddrName = "    3档资源采集区A", AddrMapID = 10, AddrLocX = 252, AddrLocY = 343, IfEndLine = 1, CampID = 1, PeerageLevel = 2,},
{AddrName = "[麦穗平原入口]", AddrMapID = 10, AddrLocX = 136, AddrLocY = 283, IfEndLine = 1, CampID = 1, PeerageLevel = 2,},
}

-- 麦穗平原重要地点表
MaiShuiPinYuan_GoToAddress_Tab = 
{
{AddrName = "[珊瑚群岛入口]", AddrMapID = 25, AddrLocX = 387, AddrLocY = 174, IfEndLine = 1, CampID = 1},
{AddrName = "    子爵空间传送塔", AddrMapID = 25, AddrLocX = 281, AddrLocY = 184, IfEndLine = 1, CampID = 1},
{AddrName = "    高级子爵空间传送塔", AddrMapID = 25, AddrLocX = 319, AddrLocY = 280, IfEndLine = 1, CampID = 1},
{AddrName = "    伯爵空间传送塔", AddrMapID = 25, AddrLocX = 194, AddrLocY = 197, IfEndLine = 1, CampID = 1},
{AddrName = "    高级伯爵空间传送塔", AddrMapID = 25, AddrLocX = 218, AddrLocY = 359, IfEndLine = 1, CampID = 1},
{AddrName = "    侯爵空间传送塔", AddrMapID = 25, AddrLocX = 116, AddrLocY = 315, IfEndLine = 1, CampID = 1},
{AddrName = "    高级侯爵空间传送塔", AddrMapID = 25, AddrLocX = 138, AddrLocY = 352, IfEndLine = 1, CampID = 1},
{AddrName = "[时空走廊入口]", AddrMapID = 25, AddrLocX = 110, AddrLocY = 358, IfEndLine = 1, CampID = 1},
}

-- 时光走廊重要地点表
ShiGuangZhouLang_GoToAddress_Tab = 
{
{AddrName = "[麦穗平原入口]", AddrMapID = 71, AddrLocX = 154, AddrLocY = 21, IfEndLine = 1, CampID = 1},
{AddrName = "[火山冰原入口]", AddrMapID = 71, AddrLocX = 104, AddrLocY = 232, IfEndLine = 1, CampID = 1},
}

-- 火山冰原重要地点表
HuoShanBingYuan_GoToAddress_Tab = 
{
{AddrName = "[时光走廊入口]", AddrMapID = 8, AddrLocX = 391, AddrLocY = 456, IfEndLine = 1, CampID = 1},
{AddrName = "    公爵空间传送塔", AddrMapID = 8, AddrLocX = 302, AddrLocY = 533, IfEndLine = 1, CampID = 1},
{AddrName = "    高级公爵空间传送塔", AddrMapID = 8, AddrLocX = 435, AddrLocY = 607, IfEndLine = 1, CampID = 1},
{AddrName = "[钢铁隧道入口]  ", AddrMapID = 8, AddrLocX = 427, AddrLocY = 784, IfEndLine = 1, CampID = 0},
{AddrName = "    公爵空间传送塔", AddrMapID = 8, AddrLocX = 353, AddrLocY = 781, IfEndLine = 1, CampID = 0},
{AddrName = "    高级公爵空间传送塔", AddrMapID = 8, AddrLocX = 426, AddrLocY = 663, IfEndLine = 1, CampID = 0},
}

-- 国有资源采集区
GuoYouZiYuanCaiJiQu_GoToAddress_Tab = 
{
{AddrName = "    金属矿场", AddrMapID = -1, AddrLocX = 199, AddrLocY = 155, IfEndLine = 1, CampID = 0},
{AddrName = "    水晶采集场", AddrMapID = -1, AddrLocX = 152, AddrLocY = 202, IfEndLine = 1, CampID = 0},
{AddrName = "    伐木场", AddrMapID = -1, AddrLocX = 160, AddrLocY = 211, IfEndLine = 1, CampID = 0},
{AddrName = "    农场", AddrMapID = -1, AddrLocX = 207, AddrLocY = 164, IfEndLine = 1, CampID = 0},
{AddrName = "    牧场", AddrMapID = -1, AddrLocX = 220, AddrLocY = 177, IfEndLine = 1, CampID = 0},
{AddrName = "本资源采集区出口", AddrMapID = -1, AddrLocX = 188, AddrLocY = 188, IfEndLine = 1, CampID = 0},
}


-- 英雄广场
YingXiongGuangChang_GoToAddress_Tab = 
{
{AddrName = "返回主城", AddrMapID = -1, AddrLocX = 193, AddrLocY = 183, IfEndLine = 1, CampID = 0},
{AddrName = "    引导者", AddrMapID = -1, AddrLocX = 168, AddrLocY = 137, IfEndLine = 1, CampID = 0},
{AddrName = "    摆摊区", AddrMapID = -1, AddrLocX = 193, AddrLocY = 183, IfEndLine = 1, CampID = 0},
{AddrName = "公民空间传送塔入口", AddrMapID = -1, AddrLocX = 169, AddrLocY = 92, IfEndLine = 1, CampID = 0},
}

-- 资源采集区
ZiYuanCaiJiQu_GoToAddress_Tab = 
{
{AddrName = "本资源采集区出口", AddrMapID = -1, AddrLocX = 188, AddrLocY = 188, IfEndLine = 1, CampID = 0},
}

-- 公民空间传送塔
GongMingKongJianChuanSongTa_GoToAddress_Tab = 
{
{AddrName = "    英雄广场入口", AddrMapID = -1, AddrLocX = 139, AddrLocY = 79, IfEndLine = 1, CampID = 0},
{AddrName = "    机奴巢穴入口", AddrMapID = -1, AddrLocX = 117, AddrLocY = 91, IfEndLine = 1, CampID = 0},
{AddrName = "公民空间传送塔出口", AddrMapID = -1, AddrLocX = 145, AddrLocY = 88, IfEndLine = 1, CampID = 0},
}



function CuanSongFuWu()
	-- 获取当前地图ID
	local ActorID = API_RequestGetActorID()
	local CampID = API_GetActorCamp(ActorID)
	local ActCurMapid = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(ActCurMapid)
	-- 判断当前地图ID
	-- 如果是在帝国主城
	if StaticMapID == 1 or StaticMapID == 21 or StaticMapID == 75 or StaticMapID == 76 or StaticMapID == 77 or StaticMapID == 78 or StaticMapID == 79 or StaticMapID == 80 or StaticMapID == 81 or StaticMapID == 82 then
		-- 传送
		if API_RequestGetNumber(1) == 1 then
			if API_VarDataGetNumber(ActorID,1,102) > 0 then
				API_ResponseWrite('<br><text>正在押镖，镖车无法传送</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			if API_ActorIsDying(ActorID) then
				API_ResponseWrite('<br><text>都变成尸体了还想到处跳，吓坏小朋友怎么办？</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			if API_ActorFindStatus(ActorID,519) then
				API_ResponseWrite('<br><text>请先收摊再使用传送服务！</text>')
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
		API_ResponseWrite('<win rect="600,140,335,480" move="1" alpha="200" balpha="100"></win>')
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
			if API_VarDataGetNumber(ActorID,1,102) > 0 then
				API_ResponseWrite('<br><text>正在押镖，镖车无法传送</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			if API_ActorIsDying(ActorID) then
				API_ResponseWrite('<br><text>都变成尸体了还想到处跳，吓坏小朋友怎么办？</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			if API_ActorFindStatus(ActorID,519) then
				API_ResponseWrite('<br><text>请先收摊再使用传送服务！</text>')
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
		API_ResponseWrite('<win rect="590,110,330,510" move="1" alpha="200" balpha="100"></win>')
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
	elseif StaticMapID == 8 or StaticMapID == 9 or StaticMapID == 10 or StaticMapID == 23 or StaticMapID == 25 or StaticMapID == 70 or StaticMapID == 71 then
		-- 传送
		if API_RequestGetNumber(1) == 1 then
			if API_VarDataGetNumber(ActorID,1,102) > 0 then
				API_ResponseWrite('<br><text>正在押镖，镖车无法传送</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			if API_ActorIsDying(ActorID) then
				API_ResponseWrite('<br><text>都变成尸体了还想到处跳，吓坏小朋友怎么办？</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			if API_ActorFindStatus(ActorID,519) then
				API_ResponseWrite('<br><text>请先收摊再使用传送服务！</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			local AddrID = API_RequestGetNumber(2)
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
		else
			API_ResponseWrite('<name>导游服务</name>')
			local MapTable
			local LastTime = API_VarDataGetNumber(ActorID,1,18110)
			local NowTime = os.time()
			local LengQueTime = os.difftime(NowTime,LastTime)
			local ColdTime = 20
			if StaticMapID == 8 then
				API_ResponseWrite('<win rect="600,320,330,295" move="1" alpha="200" balpha="100"></win>')
				MapTable = HuoShanBingYuan_GoToAddress_Tab
				API_ResponseWrite('<text>火山冰原导游服务：</text><br>')
				local CampName = {[0]='联邦' ,[1] ='帝国' }
				API_ResponseWrite('<text>这里是我们与'..CampName[CampID]..'战争的最前线，充满未知和危险，通往最高等级浮空岛的传送阵也在此处</text><br><text>选择你想去的空间传送塔的，我会免费指引你到达目的地：</text><br><br>')
			elseif StaticMapID == 9 then
				API_ResponseWrite('<win rect="600,135,330,485" move="1" alpha="200" balpha="100"></win>')
				MapTable = AnJiaoHai_GoToAddress_Tab
				API_ResponseWrite('<text>暗礁海导游服务：</text>')
				if LengQueTime < ColdTime then
					API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				else
					API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				end
				API_ResponseWrite('<text>欢迎来到帝国的领地暗礁海，为使您快速踏上浮空岛为国作战，总督特别提供了空间传送塔导游服务。</text><br><text>选择你想去的空间传送塔，我会免费指引你到达目的地：</text><br><br>')
			elseif StaticMapID == 10 then
				API_ResponseWrite('<win rect="600,135,330,485" move="1" alpha="200" balpha="100"></win>')
				MapTable = ShanHuQunDao_GoToAddress_Tab
				API_ResponseWrite('<text>珊瑚群岛导游服务：</text>')
				if LengQueTime < ColdTime then
					API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				else
					API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				end
				API_ResponseWrite('<text>欢迎来到联邦的领地珊瑚群岛，为使您快速踏上浮空岛为国作战，总督特别提供了空间传送塔导游服务。</text><br><text>选择你想去的空间传送塔，我会免费指引你到达目的地：</text><br><br>')
			elseif StaticMapID == 23 then
				API_ResponseWrite('<win rect="600,195,330,425" move="1" alpha="200" balpha="100"></win>')
				MapTable = YangGuangYuLing_GoToAddress_Tab
				API_ResponseWrite('<text>阳光雨林导游服务：</text>')
				if LengQueTime < ColdTime then
					API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				else
					API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				end
				API_ResponseWrite('<text>欢迎来到帝国的领地阳光雨林，为使您快速踏上浮空岛为国作战，总督特别提供了空间传送塔导游服务。</text><br><text>选择你想去的空间传送塔，我会免费指引你到达目的地：</text><br><br>')
			elseif StaticMapID == 25 then
				API_ResponseWrite('<win rect="600,195,330,425" move="1" alpha="200" balpha="100"></win>')
				MapTable = MaiShuiPinYuan_GoToAddress_Tab
				API_ResponseWrite('<text>麦穗平原导游服务：</text>')
				if LengQueTime < ColdTime then
					API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				else
					API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				end
				API_ResponseWrite('<text>欢迎来到联邦的领地麦穗平原，为使您快速踏上浮空岛为国作战，总督特别提供了空间传送塔导游服务。</text><br><text>选择你想去的空间传送塔，我会免费指引你到达目的地：</text><br><br>')
			elseif StaticMapID == 70 then
				API_ResponseWrite('<win rect="600,395,330,230" move="1" alpha="200" balpha="100"></win>')
				MapTable = GangTieShuiDao_GoToAddress_Tab
				API_ResponseWrite('<text>钢铁隧道导游服务：</text>')
				if LengQueTime < ColdTime then
					API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				else
					API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				end
				API_ResponseWrite('<text>欢迎来到帝国的领地钢铁隧道，通过这条隧道后你将到达充满危险的火山冰原</text><br><text>我会免费指引你到达目的地：</text><br><br>')
			elseif StaticMapID == 71 then
				API_ResponseWrite('<win rect="600,395,330,230" move="1" alpha="200" balpha="100"></win>')
				MapTable = ShiGuangZhouLang_GoToAddress_Tab
				API_ResponseWrite('<text>时空走廊导游服务：</text>')
				if LengQueTime < ColdTime then
					API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				else
					API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				end
				API_ResponseWrite('<text>欢迎来到联邦的领地时空走廊，通过这条隧道后你将到达充满危险的火山冰原</text><br><text>我会免费指引你到达目的地：</text><br><br>')
			end
			for AddrID in MapTable do
				if MapTable[AddrID].CampID == CampID then
					local NpcID = MapTable[AddrID].NpcID
					local MapID = MapTable[AddrID].AddrMapID
					local TileX = MapTable[AddrID].AddrLocX
					local TileY = MapTable[AddrID].AddrLocY
					local NeedPeerageLevel = MapTable[AddrID].PeerageLevel
					local PeerageLevel = API_GetActorPeerageLevel(ActorID)
					if NeedPeerageLevel ~= nil and PeerageLevel < NeedPeerageLevel then
						API_ResponseWrite('<a color="150,150,150" vcolor="0,255,255" underline="1" closewindow="0" mapid="'..MapID..'" x="'..TileX..'" y="'..TileY..'">'..MapTable[AddrID].AddrName..'  </a>')
					else
						API_ResponseWrite('<a color="255,0,255" vcolor="0,255,255" underline="1" closewindow="0" mapid="'..MapID..'" x="'..TileX..'" y="'..TileY..'">'..MapTable[AddrID].AddrName..'  </a>')
					end
			--		API_ResponseWrite('<a underline="1" closewindow="0" href="CuanSongFuWu?1=1&2='..AddrID..'">'..MapTable[AddrID].AddrName..'  </a>')
					if MapTable[AddrID].IfEndLine ~= 0 then
						API_ResponseWrite('<br><br>')
					end
				end
			end
			API_ResponseWrite('<br><a>关闭窗口</a><br>')
			API_ResponseWrite('<text>(点击右下角</text><text color="255,0,255">龙卷风图标</text><text>可再次使用本导游服务)</text>')
		end
	elseif StaticMapID == 18 or StaticMapID == 20 then
		-- 传送
		if API_RequestGetNumber(1) == 1 then
			if API_VarDataGetNumber(ActorID,1,102) > 0 then
				API_ResponseWrite('<br><text>正在押镖，镖车无法传送</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			if API_ActorIsDying(ActorID) then
				API_ResponseWrite('<br><text>都变成尸体了还想到处跳，吓坏小朋友怎么办？</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			if API_ActorFindStatus(ActorID,519) then
				API_ResponseWrite('<br><text>请先收摊再使用传送服务！</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			local AddrID = API_RequestGetNumber(2)
			if GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrName == nil or GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrMapID == nil or GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrLocX == nil or GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].IfEndLine == nil then
				API_ResponseWrite('<br><text>传送服务暂停</text>')
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
				if CampID == 0 then
					API_ActorAddStatus(ActorID,36002,StatusTimer)
				else
					API_ActorAddStatus(ActorID,36003,StatusTimer)
				end
				API_ActorShowProcess(ActorID,StatusTimer,410,360,'空间定位')
			end
			--API_ActorGoToMap(ActorID, DiGuo_GoToAddress_Tab[AddrID].AddrMapID, DiGuo_GoToAddress_Tab[AddrID].AddrLocX, DiGuo_GoToAddress_Tab[AddrID].AddrLocY)
		end
		API_ResponseWrite('<win rect="600,295,330,325" move="1" alpha="200" balpha="100"></win>')
		API_ResponseWrite('<name>传送服务</name>')
		API_ResponseWrite('<text>如果您想离开本资源采集区，可以通过本服务直接传送到资源采集区出口</text><br><br>')
		for AddrID in GuoYouZiYuanCaiJiQu_GoToAddress_Tab do
			if GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrName == nil or GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrMapID == nil or GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrLocX == nil or GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].IfEndLine == nil then
				API_ResponseWrite('<br><text>传送服务暂停</text>')
				return
			end
			if GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].NpcID ~= nil then
				if GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrMapID == StaticMapID then
					local NpcID = GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].NpcID
					local MapID = GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrMapID
					local TileX = GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrLocX
					local TileY = GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrLocY
					API_ResponseWrite('<a color="255,0,255" vcolor="0,255,255" underline="1" closewindow="0" mapid="'..MapID..'" x="'..TileX..'" y="'..TileY..'" npcid="'..NpcID..'">'..GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrName..'  </a>')
				else
					local SampleDesc = GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].SampleDesc
					API_ResponseWrite('<a allcolor="255,255,255" tip="'..SampleDesc..'" closewindow="0">'..GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrName..'  </a>')
				end
			else
				API_ResponseWrite('<a underline="1" href="CuanSongFuWu?1=1&2='..AddrID..'">'..GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrName..'  </a>')
			end
			if GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].IfEndLine ~= 0 then
				API_ResponseWrite('<br><br>')
			end
		end
		API_ResponseWrite('<br><a>关闭窗口</a><br>')
		API_ResponseWrite('<text>(点击右下角</text><text color="255,0,255">龙卷风图标</text><text>可再次使用本传送服务)</text>')
	elseif StaticMapID == 91 or StaticMapID == 92 then
		-- 传送
		if API_RequestGetNumber(1) == 1 then
			if API_VarDataGetNumber(ActorID,1,102) > 0 then
				API_ResponseWrite('<br><text>正在押镖，镖车无法传送</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			if API_ActorIsDying(ActorID) then
				API_ResponseWrite('<br><text>都变成尸体了还想到处跳，吓坏小朋友怎么办？</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			if API_ActorFindStatus(ActorID,519) then
				API_ResponseWrite('<br><text>请先收摊再使用传送服务！</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			local AddrID = API_RequestGetNumber(2)
			if YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrName == nil or YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrMapID == nil or YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrLocX == nil or YingXiongGuangChang_GoToAddress_Tab[AddrID].IfEndLine == nil then
				API_ResponseWrite('<br><text>传送服务暂停</text>')
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
				if CampID == 0 then
					API_ActorAddStatus(ActorID,36002,StatusTimer)
				else
					API_ActorAddStatus(ActorID,36003,StatusTimer)
				end
				API_ActorShowProcess(ActorID,StatusTimer,410,360,'空间定位')
			end
		end
		API_ResponseWrite('<win rect="600,385,330,235" move="1" alpha="200" balpha="100"></win>')
		API_ResponseWrite('<name>传送服务</name>')
		API_ResponseWrite('<text>您可以通过本服务前往引导者处兑换功勋：</text><br><br>')
		for AddrID in YingXiongGuangChang_GoToAddress_Tab do
			if YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrName == nil or YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrMapID == nil or YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrLocX == nil or YingXiongGuangChang_GoToAddress_Tab[AddrID].IfEndLine == nil then
				API_ResponseWrite('<br><text>传送服务暂停</text>')
				return
			end
			if YingXiongGuangChang_GoToAddress_Tab[AddrID].NpcID ~= nil then
				if YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrMapID == StaticMapID then
					local NpcID = YingXiongGuangChang_GoToAddress_Tab[AddrID].NpcID
					local MapID = YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrMapID
					local TileX = YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrLocX
					local TileY = YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrLocY
					API_ResponseWrite('<a color="255,0,255" vcolor="0,255,255" underline="1" closewindow="0" mapid="'..MapID..'" x="'..TileX..'" y="'..TileY..'" npcid="'..NpcID..'">'..YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrName..'  </a>')
				else
					local SampleDesc = YingXiongGuangChang_GoToAddress_Tab[AddrID].SampleDesc
					API_ResponseWrite('<a allcolor="255,255,255" tip="'..SampleDesc..'" closewindow="0">'..YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrName..'  </a>')
				end
			else
				API_ResponseWrite('<a underline="1" href="CuanSongFuWu?1=1&2='..AddrID..'">'..YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrName..'  </a>')
			end
			if YingXiongGuangChang_GoToAddress_Tab[AddrID].IfEndLine ~= 0 then
				API_ResponseWrite('<br><br>')
			end
		end
		API_ResponseWrite('<br><a>关闭窗口</a><br>')
		API_ResponseWrite('<text>(点击右下角</text><text color="255,0,255">龙卷风图标</text><text>可再次使用本传送服务)</text>')
	elseif StaticMapID == 11 or StaticMapID == 12 or StaticMapID == 13 or StaticMapID == 14 or StaticMapID == 17 or StaticMapID == 19 or StaticMapID == 83 or StaticMapID == 84 or StaticMapID == 85 or StaticMapID == 86 then
		-- 传送
		if API_RequestGetNumber(1) == 1 then
			if API_VarDataGetNumber(ActorID,1,102) > 0 then
				API_ResponseWrite('<br><text>正在押镖，镖车无法传送</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			if API_ActorIsDying(ActorID) then
				API_ResponseWrite('<br><text>都变成尸体了还想到处跳，吓坏小朋友怎么办？</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			if API_ActorFindStatus(ActorID,519) then
				API_ResponseWrite('<br><text>请先收摊再使用传送服务！</text>')
				API_ResponseWrite('<br><a>确定</a><br>')
				return
			end
			local AddrID = API_RequestGetNumber(2)
			if ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrName == nil or ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrMapID == nil or ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrLocX == nil or ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].IfEndLine == nil then
				API_ResponseWrite('<br><text>传送服务暂停</text>')
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
				if CampID == 0 then
					API_ActorAddStatus(ActorID,36002,StatusTimer)
				else
					API_ActorAddStatus(ActorID,36003,StatusTimer)
				end
				API_ActorShowProcess(ActorID,StatusTimer,410,360,'空间定位')
			end
			--API_ActorGoToMap(ActorID, DiGuo_GoToAddress_Tab[AddrID].AddrMapID, DiGuo_GoToAddress_Tab[AddrID].AddrLocX, DiGuo_GoToAddress_Tab[AddrID].AddrLocY)
		end
		API_ResponseWrite('<win rect="600,450,335,170" move="1" alpha="200" balpha="100"></win>')
		API_ResponseWrite('<name>传送服务</name>')
		API_ResponseWrite('<text>如果您想离开本资源采集区，可以通过本服务直接传送到资源采集区出口</text><br><br>')
		for AddrID in ZiYuanCaiJiQu_GoToAddress_Tab do
			if ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrName == nil or ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrMapID == nil or ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrLocX == nil or ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].IfEndLine == nil then
				API_ResponseWrite('<br><text>传送服务暂停</text>')
				return
			end
			if ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].NpcID ~= nil then
				if ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrMapID == StaticMapID then
					local NpcID = ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].NpcID
					local MapID = ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrMapID
					local TileX = ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrLocX
					local TileY = ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrLocY
					API_ResponseWrite('<a color="255,0,255" vcolor="0,255,255" underline="1" closewindow="0" mapid="'..MapID..'" x="'..TileX..'" y="'..TileY..'" npcid="'..NpcID..'">'..ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrName..'  </a>')
				else
					local SampleDesc = ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].SampleDesc
					API_ResponseWrite('<a allcolor="255,255,255" tip="'..SampleDesc..'" closewindow="0">'..ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrName..'  </a>')
				end
			else
				API_ResponseWrite('<a underline="1" href="CuanSongFuWu?1=1&2='..AddrID..'">'..ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrName..'  </a>')
			end
			if DiGuo_GoToAddress_Tab[AddrID].IfEndLine ~= 0 then
				API_ResponseWrite('<br><br>')
			end
		end
		API_ResponseWrite('<br><a>关闭窗口</a><br>')
		API_ResponseWrite('<text>(点击右下角</text><text color="255,0,255">龙卷风图标</text><text>可再次使用本传送服务)</text>')
	elseif StaticMapID == 33 or StaticMapID == 42 or StaticMapID == 43 or StaticMapID == 44 or StaticMapID == 45 or StaticMapID == 46 or StaticMapID == 47 or StaticMapID == 48 or StaticMapID == 49 or StaticMapID == 50 or StaticMapID == 51 then
		if CampID == 0 then
			local LastTime = API_VarDataGetNumber(ActorID,1,18110)
			local NowTime = os.time()
			local LengQueTime = os.difftime(NowTime,LastTime)
			local ColdTime = 20
			if StaticMapID == 33 then
				-- 传送
				if API_RequestGetNumber(1) == 1 then
					if API_VarDataGetNumber(ActorID,1,102) > 0 then
						API_ResponseWrite('<br><text>正在押镖，镖车无法传送</text>')
						API_ResponseWrite('<br><a>确定</a><br>')
						return
					end
					if API_ActorIsDying(ActorID) then
						API_ResponseWrite('<br><text>都变成尸体了还想到处跳，吓坏小朋友怎么办？</text>')
						API_ResponseWrite('<br><a>确定</a><br>')
						return
					end
					if API_ActorFindStatus(ActorID,519) then
						API_ResponseWrite('<br><text>请先收摊再使用传送服务！</text>')
						API_ResponseWrite('<br><a>确定</a><br>')
						return
					end
					local AddrID = API_RequestGetNumber(2)
					if GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrName == nil or GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrMapID == nil or GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrLocX == nil or GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].IfEndLine == nil then
						API_ResponseWrite('<br><text>传送服务暂停</text>')
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
						if CampID == 0 then
							API_ActorAddStatus(ActorID,36002,StatusTimer)
						else
							API_ActorAddStatus(ActorID,36003,StatusTimer)
						end
						API_ActorShowProcess(ActorID,StatusTimer,410,360,'空间定位')
					end
				end
				API_ResponseWrite('<win rect="600,375,335,245" move="1" alpha="200" balpha="100"></win>')
				API_ResponseWrite('<name>传送服务</name>')
				API_ResponseWrite('<text>公民空间传送塔传送服务：</text>')
				if LengQueTime < ColdTime then
					API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				else
					API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				end
				API_ResponseWrite('<text>如果交通堵塞，可以通过本传送服务前往你想要到达的目的地。</text><br><br>')
				for AddrID in GongMingKongJianChuanSongTa_GoToAddress_Tab do
					if GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrName == nil or GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrMapID == nil or GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrLocX == nil or GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].IfEndLine == nil then
						API_ResponseWrite('<br><text>传送服务暂停</text>')
						return
					end
					if GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].NpcID ~= nil then
						if GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrMapID == StaticMapID then
							local NpcID = GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].NpcID
							local MapID = GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrMapID
							local TileX = GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrLocX
							local TileY = GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrLocY
							API_ResponseWrite('<a color="255,0,255" vcolor="0,255,255" underline="1" closewindow="0" mapid="'..MapID..'" x="'..TileX..'" y="'..TileY..'" npcid="'..NpcID..'">'..GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrName..'  </a>')
						else
							local SampleDesc = GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].SampleDesc
							API_ResponseWrite('<a allcolor="255,255,255" tip="'..SampleDesc..'" closewindow="0">'..GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrName..'  </a>')
						end
					else
						API_ResponseWrite('<a underline="1" href="CuanSongFuWu?1=1&2='..AddrID..'">'..GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrName..'  </a>')
					end
					if GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].IfEndLine ~= 0 then
						API_ResponseWrite('<br><br>')
					end
				end
				API_ResponseWrite('<br><a>关闭窗口</a><br>')
				API_ResponseWrite('<text>(点击右下角</text><text color="255,0,255">龙卷风图标</text><text>可再次使用本传送服务)</text>')
			else
				API_ResponseWrite('<win rect="600,450,335,170" move="1" alpha="200" balpha="100"></win>')
				API_ResponseWrite('<name>瞬移服务</name>')
				API_ResponseWrite('<text>空间传送塔瞬移服务：</text><br>')
				API_ResponseWrite('<text>如果交通堵塞，可以通过本瞬移服务进行短距离传送。</text><br><br>')
				if LengQueTime < ColdTime then
					API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				else
					API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				end
				API_ResponseWrite('<br><a>关闭窗口</a><br>')
				API_ResponseWrite('<text>(点击右下角</text><text color="255,0,255">龙卷风图标</text><text>可再次使用本瞬移服务)</text>')
			end
		end
	elseif StaticMapID == 32 or StaticMapID == 52 or StaticMapID == 53 or StaticMapID == 54 or StaticMapID == 55 or StaticMapID == 56 or StaticMapID == 57 or StaticMapID == 58 or StaticMapID == 59 or StaticMapID == 60 or StaticMapID == 61 then
		if CampID == 1 then
			local LastTime = API_VarDataGetNumber(ActorID,1,18110)
			local NowTime = os.time()
			local LengQueTime = os.difftime(NowTime,LastTime)
			local ColdTime = 20
			if StaticMapID == 32 then
				-- 传送
				if API_RequestGetNumber(1) == 1 then
					if API_VarDataGetNumber(ActorID,1,102) > 0 then
						API_ResponseWrite('<br><text>正在押镖，镖车无法传送</text>')
						API_ResponseWrite('<br><a>确定</a><br>')
						return
					end
					if API_ActorIsDying(ActorID) then
						API_ResponseWrite('<br><text>都变成尸体了还想到处跳，吓坏小朋友怎么办？</text>')
						API_ResponseWrite('<br><a>确定</a><br>')
						return
					end
					if API_ActorFindStatus(ActorID,519) then
						API_ResponseWrite('<br><text>请先收摊再使用传送服务！</text>')
						API_ResponseWrite('<br><a>确定</a><br>')
						return
					end
					local AddrID = API_RequestGetNumber(2)
					if GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrName == nil or GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrMapID == nil or GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrLocX == nil or GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].IfEndLine == nil then
						API_ResponseWrite('<br><text>传送服务暂停</text>')
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
						if CampID == 0 then
							API_ActorAddStatus(ActorID,36002,StatusTimer)
						else
							API_ActorAddStatus(ActorID,36003,StatusTimer)
						end
						API_ActorShowProcess(ActorID,StatusTimer,410,360,'空间定位')
					end
				end
				API_ResponseWrite('<win rect="600,375,335,245" move="1" alpha="200" balpha="100"></win>')
				API_ResponseWrite('<name>传送服务</name>')
				API_ResponseWrite('<text>公民空间传送塔传送服务：</text>')
				if LengQueTime < ColdTime then
					API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				else
					API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				end
				API_ResponseWrite('<text>如果交通堵塞，可以通过本传送服务前往你想要到达的目的地。</text><br><br>')
				for AddrID in GongMingKongJianChuanSongTa_GoToAddress_Tab do
					if GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrName == nil or GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrMapID == nil or GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrLocX == nil or GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].IfEndLine == nil then
						API_ResponseWrite('<br><text>传送服务暂停</text>')
						return
					end
					if GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].NpcID ~= nil then
						if GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrMapID == StaticMapID then
							local NpcID = GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].NpcID
							local MapID = GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrMapID
							local TileX = GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrLocX
							local TileY = GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrLocY
							API_ResponseWrite('<a color="255,0,255" vcolor="0,255,255" underline="1" closewindow="0" mapid="'..MapID..'" x="'..TileX..'" y="'..TileY..'" npcid="'..NpcID..'">'..GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrName..'  </a>')
						else
							local SampleDesc = GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].SampleDesc
							API_ResponseWrite('<a allcolor="255,255,255" tip="'..SampleDesc..'" closewindow="0">'..GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrName..'  </a>')
						end
					else
						API_ResponseWrite('<a underline="1" href="CuanSongFuWu?1=1&2='..AddrID..'">'..GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrName..'  </a>')
					end
					if GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].IfEndLine ~= 0 then
						API_ResponseWrite('<br><br>')
					end
				end
				API_ResponseWrite('<br><a>关闭窗口</a><br>')
				API_ResponseWrite('<text>(点击右下角</text><text color="255,0,255">龙卷风图标</text><text>可再次使用本传送服务)</text>')
			else
				API_ResponseWrite('<win rect="600,450,335,170" move="1" alpha="200" balpha="100"></win>')
				API_ResponseWrite('<name>瞬移服务</name>')
				API_ResponseWrite('<text>空间传送塔瞬移服务：</text><br>')
				API_ResponseWrite('<text>如果交通堵塞，可以通过本瞬移服务进行短距离传送。</text><br><br>')
				if LengQueTime < ColdTime then
					API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				else
					API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
				end
				API_ResponseWrite('<br><a>关闭窗口</a><br>')
				API_ResponseWrite('<text>(点击右下角</text><text color="255,0,255">龙卷风图标</text><text>可再次使用本瞬移服务)</text>')
			end
		end
	elseif StaticMapID == 96 or StaticMapID == 97 then
		local TaskStep = API_VarDataGetNumber(ActorID,1,GLOBAL_FoolNewActorTaskStep)
		if TaskStep >= 61 then
			if TaskStep < 62 then
				TaskStep = 62
				API_VarDataSetNumber(ActorID,1,GLOBAL_FoolNewActorTaskStep,TaskStep)
				GLOBAL_FengXiangBiao_DateList[5][62].Date = GLOBAL_FengXiangBiao_DateList[5][62].Date + 1
			end
			local LastTime = API_VarDataGetNumber(ActorID,1,18110)
			local NowTime = os.time()
			local LengQueTime = os.difftime(NowTime,LastTime)
			local ColdTime = 20
			-- 传送
			if API_RequestGetNumber(1) == 1 then
				API_OpenSmallTip(ActorID,0,0,0,0,0,"")
				if API_VarDataGetNumber(ActorID,1,102) > 0 then
					API_ResponseWrite('<br><text>正在押镖，镖车无法传送</text>')
					API_ResponseWrite('<br><a>确定</a><br>')
					return
				end
				if API_ActorIsDying(ActorID) then
					API_ResponseWrite('<br><text>都变成尸体了还想到处跳，吓坏小朋友怎么办？</text>')
					API_ResponseWrite('<br><a>确定</a><br>')
					return
				end
				if API_ActorFindStatus(ActorID,519) then
					API_ResponseWrite('<br><text>请先收摊再使用传送服务！</text>')
					API_ResponseWrite('<br><a>确定</a><br>')
					return
				end
				local AddrID = API_RequestGetNumber(2)
				local ConvectionInfo = API_VarDataGetNumber(ActorID,0,GLOBAL_ConvectionInfo)
				if ConvectionInfo ~= 0 then
					API_ActorSendMsg(ActorID,3,'正在传送中，请稍后')
				else
					if TaskStep < 63 then
						TaskStep = 63
						API_VarDataSetNumber(ActorID,1,GLOBAL_FoolNewActorTaskStep,TaskStep)
						GLOBAL_FengXiangBiao_DateList[5][63].Date = GLOBAL_FengXiangBiao_DateList[5][63].Date + 1
					end
					local TileX,TileY = PublicFun_GetActorPosXY(ActorID)
					local ConvectionInfo = 1 * 100000000 + TileX * 100000 + TileY * 100
					API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
					local TimerTriggerID = API_CreateTimerTriggerG(ActorID,0,1,5,'Convection_TimerTriggerCallFunc')
					API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionTimerTriggerID,TimerTriggerID)
					local GLOBAL_ConvectionTimerCN = PublicFun_ArabianNumberToBigChineseNumber(GLOBAL_ConvectionTimer)
					API_ActorSendMsg(ActorID,2,'传送服务开始，空间定位中……，需时'..GLOBAL_ConvectionTimerCN..'秒，定位期间请不要移动，否则将传送失败')
					StatusTimer = (GLOBAL_ConvectionTimer + 1) * 1000
					if CampID == 0 then
						API_ActorAddStatus(ActorID,36002,StatusTimer)
					else
						API_ActorAddStatus(ActorID,36003,StatusTimer)
					end
					API_ActorShowProcess(ActorID,StatusTimer,410,360,'空间定位')
				end
			end
			API_ResponseWrite('<win rect="600,375,335,245" move="1" alpha="200" balpha="100"></win>')
			API_ResponseWrite('<name>传送服务</name>')
			API_ResponseWrite('<text>新手空间传送塔传送服务：</text>')
--			if LengQueTime < ColdTime then
--				API_ResponseWrite('<a color="150,150,150" tip="瞬移服务需要20秒时间冷却" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
--			else
--				API_ResponseWrite('<a tip="使用瞬移服务时可以点击地面瞬移" underline="1" href="SunyiFuWu">瞬移服务</a><br>')
--			end
			API_ResponseWrite('<br><text>如果你已经从学院毕业，请即刻通过本服务前往总督府找总督报到。</text><br><br>')
			API_ResponseWrite('<a underline="1" href="CuanSongFuWu?1=1">前往总督府报到</a>')
			API_ResponseWrite('<br><br>')
			API_ResponseWrite('<br><a>关闭窗口</a><br>')
			API_ResponseWrite('<text>(点击右下角</text><text color="255,0,255">龙卷风图标</text><text>可再次使用本传送服务)</text>')
			
		end
	end
	API_ResponseFlush(ActorID)
	if StaticMapID == 96 or StaticMapID == 97 and API_VarDataGetNumber(ActorID,1,GLOBAL_FoolNewActorTaskStep) >= 61 and API_RequestGetNumber(1) ~= 1 then
		API_OpenSmallTip(ActorID,760,530,2,0,3600,"[k]请点击前往总督府[/k]")
	end
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
	if ((StaticMapID == 9 or StaticMapID == 23 or StaticMapID == 70 or StaticMapID == 33 or StaticMapID == 42 or StaticMapID == 43 or StaticMapID == 44 or StaticMapID == 45 or StaticMapID == 46 or StaticMapID == 47 or StaticMapID == 48 or StaticMapID == 49 or StaticMapID == 50 or StaticMapID == 51 or StaticMapID == 1 or StaticMapID == 21 or StaticMapID == 75 or StaticMapID == 76 or StaticMapID == 77 or StaticMapID == 78 or StaticMapID == 79 or StaticMapID == 80 or StaticMapID == 81 or StaticMapID == 82 or StaticMapID == 97) and CampID == 0) or ((StaticMapID == 10 or StaticMapID == 25 or StaticMapID == 71 or StaticMapID == 32 or StaticMapID == 52 or StaticMapID == 53 or StaticMapID == 54 or StaticMapID == 55 or StaticMapID == 56 or StaticMapID == 57 or StaticMapID == 58 or StaticMapID == 59 or StaticMapID == 60 or StaticMapID == 61 or StaticMapID == 2 or StaticMapID == 40 or StaticMapID == 41 or StaticMapID == 62 or StaticMapID == 63 or StaticMapID == 64 or StaticMapID == 65 or StaticMapID == 66 or StaticMapID == 67 or StaticMapID == 68 or StaticMapID == 69 or StaticMapID == 96) and CampID == 1) then 
		if LengQueTime >= ColdTime and not API_ActorIsDying(ActorID) then 
			API_ActorStartSelect(ActorID,'SunyiFuWu_ChuanShong',16) 
			API_ActorSendMsg(ActorID,3,'点击您想传送到的目的地')
		elseif API_ActorIsDying(ActorID) then
			API_ActorSendMsg(ActorID,3,'死亡状态不能使用瞬移服务')
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
	local MapID = API_GetActorMapID(ActorID)
	local StaticMapID = API_GetMapConfigID(MapID)
	local LastTime = API_VarDataGetNumber(ActorID,1,18110)
	local NowTime = os.time()
	local LengQueTime = os.difftime(NowTime,LastTime)
	local ColdTime = 20
	if ((StaticMapID == 9 or StaticMapID == 23 or StaticMapID == 70 or StaticMapID == 33 or StaticMapID == 42 or StaticMapID == 43 or StaticMapID == 44 or StaticMapID == 45 or StaticMapID == 46 or StaticMapID == 47 or StaticMapID == 48 or StaticMapID == 49 or StaticMapID == 50 or StaticMapID == 51 or StaticMapID == 1 or StaticMapID == 21 or StaticMapID == 75 or StaticMapID == 76 or StaticMapID == 77 or StaticMapID == 78 or StaticMapID == 79 or StaticMapID == 80 or StaticMapID == 81 or StaticMapID == 82 or StaticMapID == 97) and CampID == 0) or ((StaticMapID == 10 or StaticMapID == 25 or StaticMapID == 71 or StaticMapID == 32 or StaticMapID == 52 or StaticMapID == 53 or StaticMapID == 54 or StaticMapID == 55 or StaticMapID == 56 or StaticMapID == 57 or StaticMapID == 58 or StaticMapID == 59 or StaticMapID == 60 or StaticMapID == 61 or StaticMapID == 2 or StaticMapID == 40 or StaticMapID == 41 or StaticMapID == 62 or StaticMapID == 63 or StaticMapID == 64 or StaticMapID == 65 or StaticMapID == 66 or StaticMapID == 67 or StaticMapID == 68 or StaticMapID == 69 or StaticMapID == 96) and CampID == 1) then 
		if LengQueTime >= ColdTime and not API_ActorIsDying(ActorID) then 
			if not API_HaveNoBlockTile(MapID,SelectTileX,SelectTileY,4) then
				API_ActorStartSelect(ActorID,'SunyiFuWu_ChuanShong',16)
				return
			end
			API_VarDataSetNumber(ActorID,1,18110,NowTime)
			API_ActorGoToMap(ActorID,MapID,SelectTileX,SelectTileY)
		else
			local shengyu = ColdTime - LengQueTime
			API_ActorSendMsg(ActorID,3,'瞬移服务还需冷却 '..shengyu..' 秒')
		end
	end
end

function Convection_TimerTriggerCallFunc(ActorID,AddrID)
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
					GLOBAL_FengXiangBiao_DateList[4][1].Date = GLOBAL_FengXiangBiao_DateList[4][1].Date + 1
				end
				API_ActorGoToMap(ActorID, DiGuo_GoToAddress_Tab[AddrID].AddrMapID, DiGuo_GoToAddress_Tab[AddrID].AddrLocX, DiGuo_GoToAddress_Tab[AddrID].AddrLocY)
			elseif StaticMapID == 2 or StaticMapID == 40 or StaticMapID == 41 or StaticMapID == 62 or StaticMapID == 63 or StaticMapID == 64 or StaticMapID == 65 or StaticMapID == 66 or StaticMapID == 67 or StaticMapID == 68 or StaticMapID == 69 then
				if StaticMapID == 67 and API_VarDataGetNumber(ActorID,1,18336) == 1 then
					API_VarDataSetNumber(ActorID,1,18336,2)
					GLOBAL_FengXiangBiao_DateList[4][1].Date = GLOBAL_FengXiangBiao_DateList[4][1].Date + 1
				end
				API_ActorGoToMap(ActorID, LianBang_GoToAddress_Tab[AddrID].AddrMapID, LianBang_GoToAddress_Tab[AddrID].AddrLocX, LianBang_GoToAddress_Tab[AddrID].AddrLocY)
			elseif StaticMapID == 18 or StaticMapID == 20 then
				API_ActorGoToMap(ActorID,ActCurMapid, GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrLocX, GuoYouZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrLocY)
			elseif StaticMapID == 32 or StaticMapID == 33 then
				API_ActorGoToMap(ActorID,ActCurMapid, GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrLocX, GongMingKongJianChuanSongTa_GoToAddress_Tab[AddrID].AddrLocY)
			elseif StaticMapID == 91 or StaticMapID == 92 then
				if AddrID ~= 3 then
					API_ActorGoToMap(ActorID,ActCurMapid, YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrLocX, YingXiongGuangChang_GoToAddress_Tab[AddrID].AddrLocY)
				else
					local GrantBaiTanTileXY = {X1=164,Y1=160,X2=217,Y2=213,}
					local TileX = math.random(GrantBaiTanTileXY.X1,GrantBaiTanTileXY.X2)
					local TileY = math.random(GrantBaiTanTileXY.Y1,GrantBaiTanTileXY.Y2)
					API_ActorGoToMap(ActorID,ActCurMapid,TileX,TileY)
				end
			elseif StaticMapID == 11 or StaticMapID == 12 or StaticMapID == 13 or StaticMapID == 14 or StaticMapID == 17 or StaticMapID == 19 or StaticMapID == 83 or StaticMapID == 84 or StaticMapID == 85 or StaticMapID == 86 then
				API_ActorGoToMap(ActorID,ActCurMapid, ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrLocX, ZiYuanCaiJiQu_GoToAddress_Tab[AddrID].AddrLocY)
			elseif StaticMapID == 8 or StaticMapID == 9 or StaticMapID == 10 or StaticMapID == 23 or StaticMapID == 25 or StaticMapID == 70 or StaticMapID == 71 then
				if StaticMapID == 8 then
					MapTable = HuoShanBingYuan_GoToAddress_Tab
				elseif StaticMapID == 9 then
					MapTable = AnJiaoHai_GoToAddress_Tab
				elseif StaticMapID == 10 then
					MapTable = ShanHuQunDao_GoToAddress_Tab
				elseif StaticMapID == 23 then
					MapTable = YangGuangYuLing_GoToAddress_Tab
				elseif StaticMapID == 25 then
					MapTable = MaiShuiPinYuan_GoToAddress_Tab
				elseif StaticMapID == 70 then
					MapTable = GangTieShuiDao_GoToAddress_Tab
				elseif StaticMapID == 71 then
					MapTable = ShiGuangZhouLang_GoToAddress_Tab
				end
				if MapTable[AddrID] ~= nil then
					if MapTable[AddrID].CampID == CampID then
						API_ActorGoToMap(ActorID, MapTable[AddrID].AddrMapID, MapTable[AddrID].AddrLocX, MapTable[AddrID].AddrLocY)
					end
				end
			elseif StaticMapID == 96 and CampID == 1 then
				local TaskStep = API_VarDataGetNumber(ActorID,1,GLOBAL_FoolNewActorTaskStep)
				if TaskStep < 64 then
					TaskStep = 64
					API_VarDataSetNumber(ActorID,1,GLOBAL_FoolNewActorTaskStep,TaskStep)
					GLOBAL_FengXiangBiao_DateList[5][64].Date = GLOBAL_FengXiangBiao_DateList[5][64].Date + 1
				end
				API_ActorSendMsg(ActorID,4,'')
				--加可操作状态
				API_SetCanOpt(ActorID,1)
				API_OpenSmallTip(ActorID,0,0,0,0,0,"")
				API_ActorGoToMap(ActorID,67,130,169)
				MainTask_GenTaskQueue(ActorID)
			elseif StaticMapID == 97 and CampID == 0 then
				local TaskStep = API_VarDataGetNumber(ActorID,1,GLOBAL_FoolNewActorTaskStep)
				if TaskStep < 64 then
					TaskStep = 64
					API_VarDataSetNumber(ActorID,1,GLOBAL_FoolNewActorTaskStep,TaskStep)
					GLOBAL_FengXiangBiao_DateList[5][64].Date = GLOBAL_FengXiangBiao_DateList[5][64].Date + 1
				end
				API_ActorSendMsg(ActorID,4,'')
				--加可操作状态
				API_SetCanOpt(ActorID,1)
				API_OpenSmallTip(ActorID,0,0,0,0,0,"")
				API_ActorGoToMap(ActorID,82,128,162)
				MainTask_GenTaskQueue(ActorID)
			end
		else
			Time = Time + 1
			ConvectionInfo = ConvectionSign * 100000000 + TileX * 100000 + TileY * 100 + Time
			API_VarDataSetNumber(ActorID,0,GLOBAL_ConvectionInfo,ConvectionInfo)
		end
	end
end
