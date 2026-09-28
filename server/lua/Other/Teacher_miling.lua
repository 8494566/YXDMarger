----------师徒系统 总督密令------------------------
----------2009年9月9日 林瑞宇制作------------------
----------程序相关 赵湘军--------------------------


------------------------------------------------------------------------------------------------------------------------------------------任务1：建设营地-------------------------------------------------------------------
--[[IConfigOrder:New{
	nTaskID		= 1951,			-- 任务ID
	szName		= "建设营地",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1952,         -- 下一个任务ID
	nMinLevel 	= 3,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>教导你的徒弟，让他点击屏幕右下的人像图标，按照系统要求去杀怪，然后建设一座临时营地</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 60,	
	--衰减等级
	nDecLev = 6,
	--衰减比率
	nDecRate = 0.2,
}
local linshiyingdipandaun = function(nActorID,nTaskID)
	if API_VarDataGetNumber(nActorID,1,9901) >= 5 then
		return true --这里需要判定 决定返还
	else
		return false
	end
end
	
CSecretOrder:New{
	nTaskID = 1951,  --任务ID
	szName 	= "建设营地",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	
	tRegisterMsg = 
        {
			{ _EVENT_ID_ENCAMP, _E_SRC_TYPE_ENCAMP, 1 },
        }, --需要订阅的消息列表


	tAcceptActions = 
        {
            IClosureAction:New{ cClosure = linshiyingdipandaun, nOptions = false, } --是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   IClosureAction:New{ cClosure = linshiyingdipandaun, nOptions = true, }  --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表

}

------------------------------------------------------------------------------------------------------------------------------------------任务2：抓捕仆从-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1952,			-- 任务ID
	szName		= "抓捕仆从",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1953,         -- 下一个任务ID
	nMinLevel 	= 4,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>建设完营地后，让你的徒弟进入营地，并按照要求完成镇长颁发的争夺浮空岛任务，获得捕奴许可证后，按照系统提示抓捕一只仆从。打开背包使用许可证可以获得仆从抓捕器。右键点击后，对要抓捕的怪物进行使用，进行抓捕。</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 60,	
	--衰减等级
	nDecLev = 5,
	--衰减比率
	nDecRate = 0.2,
}
local zhuabupucong = function(nActorID,nTaskID)
	if API_VarDataGetNumber(nActorID,1,9901) >= 17 then
		return true --这里需要判定 决定返还
	else
		return false
	end
end
	
CSecretOrder:New{
	nTaskID = 1952,  --任务ID
	szName 	= "抓捕仆从",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	
	tRegisterMsg = 
        {
			{ _EVENT_ID_CATCH, _E_SRC_TYPE_NPC, 1},
        }, --需要订阅的消息列表


	tAcceptActions = 
        {
            IClosureAction:New{ cClosure = zhuabupucong, nOptions = false, } --是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   IClosureAction:New{ cClosure = zhuabupucong, nOptions = true, }  --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表

}]]
------------------------------------------------------------------------------------------------------------------------------------------任务3：完成1个主线任务 -------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1951,			-- 任务ID
	szName		= "完成主线任务",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1954,         -- 下一个任务ID
	nMinLevel 	= 4,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>教导你的徒弟，让他完成1个主线任务</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 120,	
	--衰减等级
	nDecLev = 5,
	--衰减比率
	nDecRate = 0.2,
}
	
CSecretOrder:New{
	nTaskID = 1951,  --任务ID
	szName 	= "完成主线任务",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以
	
	tRegisterMsg = 
        {
			{ _EVENT_ID_COMPTASK, _E_SRC_TYPE_TASK,  4, },
        }, --需要订阅的消息列表

	tAcceptActions = 
        {
            IComplTasksAction:New{ tTasks = {1461,1561,}, nOption = false, }, --是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   IComplTasksAction:New{ tTasks = {1461,1561,}, nOption = true, }, --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表

}
------------------------------------------------------------------------------------------------------------------------------------------任务4：穿上腰带-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1954,			-- 任务ID
	szName		= "装备一档腰带",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1955,         -- 下一个任务ID
	nMinLevel 	= 4,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟打开背包装备上腰带，如果背包中没有腰带可以在新手商人处购买</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 100,	
	--衰减等级
	nDecLev = 5,
	--衰减比率
	nDecRate = 0.2,
}
	
CEquipProOrder:New{
	nTaskID 	= 1954,  --任务ID
	szName 		= "打开背包穿上腰带",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

        nTrigKeyID = 12137,
        nProID = 1, --1:物品档次 2:物品ID
        nLoc = 15, --位置
        nValue = 1, --属性值 当nProID为1时 这里是物品档次 1：一档 2: 二档 ... 当nProID为2时,这里是物品ID
}
------------------------------------------------------------------------------------------------------------------------------------------任务5：穿上护腿-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1955,			-- 任务ID
	szName		= "穿上一档护腿",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1956,         -- 下一个任务ID
	nMinLevel 	= 4,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟打开背包装备上护腿，如果背包中没有护腿可以在新手商人处购买</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 100,	
	--衰减等级
	nDecLev = 5,
	--衰减比率
	nDecRate = 0.2,
}

CEquipProOrder:New{
	nTaskID 	= 1955,  --任务ID
	szName 		= "穿上护腿",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

        nTrigKeyID = 12137,
        nProID = 1, --1:物品档次 2:物品ID
        nLoc = 6, --位置
        nValue = 1, --属性值 当nProID为1时 这里是物品档次 1：一档 2: 二档 ... 当nProID为2时,这里是物品ID
}
-----------------------------------------------------------------------------------------------------------------------------------------任务6：穿上鞋子-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1956,			-- 任务ID
	szName		= "穿上一档鞋子",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1957,         -- 下一个任务ID
	nMinLevel 	= 5,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟打开背包装备上鞋子，如果背包中没有鞋子可以在新手商人处购买</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 100,	
	--衰减等级
	nDecLev = 5,
	--衰减比率
	nDecRate = 0.2,
}
	
CEquipProOrder:New{
	nTaskID 	= 1956,  --任务ID
	szName 		= "穿上鞋子",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

        nTrigKeyID = 12137,
        nProID = 1, --1:物品档次 2:物品ID
        nLoc = 13, --位置
        nValue = 1, --属性值 当nProID为1时 这里是物品档次 1：一档 2: 二档 ... 当nProID为2时,这里是物品ID

}
-----------------------------------------------------------------------------------------------------------------------------------------任务7：穿上帽子-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1957,			-- 任务ID
	szName		= "戴上一档帽子",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1958,         -- 下一个任务ID
	nMinLevel 	= 6,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟打开背包装备上帽子，如果背包中没有帽子可以在新手商人处购买</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 100,	
	--衰减等级
	nDecLev = 4,
	--衰减比率
	nDecRate = 0.2,
}
	
CEquipProOrder:New{
	nTaskID 	= 1957,  --任务ID
	szName 		= "戴上帽子",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

        nTrigKeyID = 12137,
        nProID = 1, --1:物品档次 2:物品ID
        nLoc = 18, --位置
        nValue = 1, --属性值 当nProID为1时 这里是物品档次 1：一档 2: 二档 ... 当nProID为2时,这里是物品ID
}
-----------------------------------------------------------------------------------------------------------------------------------------任务8：穿上手套-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1958,			-- 任务ID
	szName		= "戴上一档手套",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1959,         -- 下一个任务ID
	nMinLevel 	= 6,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟打开背包装备上手套，如果背包中没有手套可以在新手商人处购买</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 100,	
	--衰减等级
	nDecLev = 4,
	--衰减比率
	nDecRate = 0.2,
}
	
CEquipProOrder:New{
	nTaskID 	= 1958,  --任务ID
	szName 		= "戴上左手手套",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	nTrigKeyID = 12137,
	nProID = 1, --1:物品档次 2:物品ID
	nLoc = {5,14,}, --位置
	nValue = 1, --属性值 当nProID为1时 这里是物品档次 1：一档 2: 二档 ... 当nProID为2时,这里是物品ID

}
-----------------------------------------------------------------------------------------------------------------------------------------任务9：穿上项链-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1959,			-- 任务ID
	szName		= "戴上一档项链",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1964,         -- 下一个任务ID
	nMinLevel 	= 8,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟打开背包装备上项链，如果背包中没有项链可以在新手商人处购买</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 100,	
	--衰减等级
	nDecLev = 4,
	--衰减比率
	nDecRate = 0.2,
}
	
CEquipProOrder:New{
	nTaskID 	= 1959,  --任务ID
	szName 		= "戴上项链",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	nTrigKeyID = 12137,
	nProID = 1, --1:物品档次 2:物品ID
	nLoc = {2,17,}, --位置
	nValue = 1, --属性值 当nProID为1时 这里是物品档次 1：一档 2: 二档 ... 当nProID为2时,这里是物品ID
}
-----------------------------------------------------------------------------------------------------------------------------------------任务10：穿上戒指1-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1960,			-- 任务ID
	szName		= "戴上一档戒指",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1961,         -- 下一个任务ID
	nMinLevel 	= 10,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟打开背包装备上戒指，如果背包中没有戒指可以在新手商人处购买</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 100,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}

CEquipProOrder:New{
	nTaskID 	= 1960,  --任务ID
	szName 		= "戴上戒指",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	nTrigKeyID = 12137,
	nProID = 1, --1:物品档次 2:物品ID
	nLoc = {8,9,10,11}, --位置
	nValue = 1, --属性值 当nProID为1时 这里是物品档次 1：一档 2: 二档 ... 当nProID为2时,这里是物品ID

}
	-----------------------------------------------------------------------------------------------------------------------------------------任务11：进入防守浮空岛1-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1961,			-- 任务ID
	szName		= "进入防守浮空岛",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1963,         -- 下一个任务ID
	nMinLevel 	= 10,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟前往空间传送塔，进入防守浮空岛，坚守大于10轮。</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 200,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}
local firstfangshou = function(nActorID,nTaskID)
	if API_VarDataGetNumber(nActorID,1,18107 ) > 0 then
		return true --这里需要判定 决定返还
	else
		return false
	end
end
	
CSecretOrder:New{
	nTaskID = 1961,  --任务ID
	szName 	= "进入防守浮空岛",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	
	tRegisterMsg = 
        {
			{_EVENT_ID_ENTER_ECTYPE, _E_SRC_TYPE_ECTYPE, 1 },
        }, --需要订阅的消息列表   条件没有

	tAcceptActions = 
        {
            IClosureAction:New{ cClosure = firstfangshou, nOptions = false, } --是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   IClosureAction:New{ cClosure = firstfangshou, nOptions = true, }  --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表

}
-----------------------------------------------------------------------------------------------------------------------------------------任务11：进入争夺浮空岛1-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1962,			-- 任务ID
	szName		= "进入争夺浮空岛",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1959,         -- 下一个任务ID
	nMinLevel 	= 7,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>前往空间传送塔，进入争夺浮空岛</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 200,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}
local firstzhengduo = function(nActorID,nTaskID)
	if API_VarDataGetNumber(nActorID,1,18073) > 0 then
		return true --这里需要判定 决定返还
	else
		return false
	end
end
	
CSecretOrder:New{
	nTaskID = 1962,  --任务ID
	szName 	= "进入争夺浮空岛",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	
	tRegisterMsg = 
        {
			{_EVENT_ID_ENTER_ECTYPE, _E_SRC_TYPE_ECTYPE, 3 },
        }, --需要订阅的消息列表   条件没有

	tAcceptActions = 
        {
            IClosureAction:New{ cClosure = firstzhengduo, nOptions = false, } --是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   IClosureAction:New{ cClosure = firstzhengduo, nOptions = true, }  --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表

}
-----------------------------------------------------------------------------------------------------------------------------------------任务12：进入主城-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1963,			-- 任务ID
	szName		= "进入主城",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1965,         -- 下一个任务ID
	nMinLevel 	= 11,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟回到主城</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 100,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}
local firstbackzhucheng = function(nActorID,nTaskID)
	if API_VarDataGetNumber(nActorID,1,12130) == 1 then
		return true --这里需要判定 决定返还
	else
		return false
	end
end
	
CSecretOrder:New{
	nTaskID = 1963,  --任务ID
	szName 	= "进入主城",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	
	tRegisterMsg = 
        {
			{ _EVENT_ID_ENTER_CITY, _E_SRC_TYPE, 1 },
        }, --需要订阅的消息列表   条件没有

	tAcceptActions = 
        {
            IClosureAction:New{ cClosure = firstbackzhucheng, nOptions = false, } --是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   IClosureAction:New{ cClosure = firstbackzhucheng, nOptions = true, }  --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表

}
-----------------------------------------------------------------------------------------------------------------------------------------任务13：学会两个英雄-------------------------------------------------------------------
--[[function teaceer_shitumiling(ActorID)
	if API_VarDataGetNumber(ActorID,1,12128) == 0 then
		if API_ActorGetLearnHeroNum(ActorID) > 1 then
			API_VarDataSetNumber(ActorID,1,12128,1)
		end
	end
end]]
IConfigOrder:New{
	nTaskID		= 1964,			-- 任务ID
	szName		= "学会第二个英雄",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1960,         -- 下一个任务ID
	nMinLevel 	= 9,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>在主城或者小镇里找到技能导师，学习第二个英雄。</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 200,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}
--[[local twohero = function(nActorID,nTaskID)
	if API_VarDataGetNumber(nActorID,1,12128) == 1 then
		return true --这里需要判定 决定返还
	else
		return false
	end
end--]]
	
CSecretOrder:New{
	nTaskID = 1964,  --任务ID
	szName 	= "学会第二个英雄",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	
	tRegisterMsg = 
        {
			{ _EVENT_ID_LEARN_HERO, _E_SRC_TYPE_HERO,  0, },
        }, --需要订阅的消息列表   条件没有

	tAcceptActions = 
        {
            ILearnHeroNumAction:New{ nNum = 2, nOption = false, },--是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   ILearnHeroNumAction:New{ nNum = 2, nOption = true, }, --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表
}
-----------------------------------------------------------------------------------------------------------------------------------------任务14：前往男爵地图-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1965,			-- 任务ID
	szName		= "向下一个区域前进",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1966,         -- 下一个任务ID
	nMinLevel 	= 12	,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟进入珊瑚群岛或阳光雨林地图</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 100,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}
local firstnanjuemap = function(nActorID,nTaskID)
	if API_VarDataGetNumber(nActorID,1,12131) == 1 then
		return true --这里需要判定 决定返还
	else
		return false
	end
end
	
CSecretOrder:New{
	nTaskID = 1965,  --任务ID
	szName 	= "向下一个区域前进",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	
	tRegisterMsg = 
        {
			 {_EVENT_ID_ENTER_MAP, _E_SRC_TYPE, 2 }
        }, --需要订阅的消息列表   条件没有

	tAcceptActions = 
        {
			--IIsCampAction:New{nCampID = 0,},
            IClosureAction:New{ cClosure = firstnanjuemap, nOptions = false, } --是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   IClosureAction:New{ cClosure = firstnanjuemap, nOptions = true, }  --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表
}
-----------------------------------------------------------------------------------------------------------------------------------------技能升级-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1966,			-- 任务ID
	szName		= "技能升级",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1967,         -- 下一个任务ID
	nMinLevel 	= 12,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>使用现有技能，提升技能熟练度到当前等级满值，快捷键S打开英雄技能面板，点击附带+号技能条目，提升一个技能等级到2级</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 100,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}
	
CSecretOrder:New{
	nTaskID = 1966,  --任务ID
	szName 	= "技能升级",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	
	tRegisterMsg = 
        {
			{ _EVENT_ID_UPLEVE_SKILL, _E_SRC_TYPE,  nil, },
        }, --需要订阅的消息列表   条件没有

	tAcceptActions = 
        {
            ILevelSkillAction:New{ nSKillID = -1, nLevel = 2, nOption = false, },--是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   ILevelSkillAction:New{ nSKillID = -1, nLevel = 2, nOption = true, }, --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表
}
-----------------------------------------------------------------------------------------------------------------------------------------装备双英雄-------------------------------------------------------------------
--[[function teacher_miling_zhuangb2hero(ActorID)
	if API_VarDataGetNumber(ActorID,1,12132) == 0 then
		local heronum = 0
		for i=1,2 do
			if API_ActorGetCurHeroID(ActorID,i) > 0 then
				heronum = heronum + 1
			end
		end
		if heronum == 2 then
			API_VarDataSetNumber(ActorID,1,12132,1)
		end
	end
end]]
IConfigOrder:New{
	nTaskID		= 1967,			-- 任务ID
	szName		= "装备双英雄",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1968,         -- 下一个任务ID
	nMinLevel 	= 12,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>提升等级到11级，快捷键S，左键点击已经装备除外的英雄，选择装备英雄，完成同时装备2个英雄</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 150,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}
--[[local zhuangbeishuanghero = function(nActorID,nTaskID)
	if API_VarDataGetNumber(nActorID,1,12132) == 1 then
		return true --这里需要判定 决定返还
	else
		return false
	end
end]]--
	
CSecretOrder:New{
	nTaskID = 1967,  --任务ID
	szName 	= "装备双英雄",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	
	tRegisterMsg = 
        {
		{_EVENT_ID_EQUIP_HERO, _E_SRC_TYPE_HERO,  nil},
        }, --需要订阅的消息列表   条件没有

	tAcceptActions = 
        {
           IEnableHeroAction:New{ nHeroCount = 2, nEnable = false, },--是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   IEnableHeroAction:New{ nHeroCount = 2, nEnable = true, },  --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表
}
-----------------------------------------------------------------------------------------------------------------------------------------穿二档衣服-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1968,			-- 任务ID
	szName		= "穿上二档衣服",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1969,         -- 下一个任务ID
	nMinLevel 	= 12,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟打开背包装备上二档衣服，如果背包中没有二档衣服可以在新手商人或交易所处购买</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 150,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}
	
CEquipProOrder:New{
	nTaskID 	= 1968,  --任务ID
	szName 		= "穿上二档衣服",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	nTrigKeyID = 12137,
	nProID = 1, --1:物品档次 2:物品ID
	nLoc = 16, --位置
	nValue = 2, --属性值 当nProID为1时 这里是物品档次 1：一档 2: 二档 ... 当nProID为2时,这里是物品ID

}
-----------------------------------------------------------------------------------------------------------------------------------------探矿系统1-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1969,			-- 任务ID
	szName		= "首次探矿",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1971,         -- 下一个任务ID
	nMinLevel 	= 13,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟使用资源探测器进行一次探矿，资源探测器可以在新手商人处购买，右键点击使用资源探测器，根据探测器箭头指引，找到材料出现地点，完成材料收集。</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 200,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}
local firsttankuang = function(nActorID,nTaskID)
	if API_VarDataGetNumber(nActorID,1,12138) == 1 then
		return true --这里需要判定 决定返还
	else
		return false
	end
end
	
CSecretOrder:New{
	nTaskID = 1969,  --任务ID
	szName 	= "首次探矿",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	
	tRegisterMsg = 
        {
			{_EVENT_ID_PROSPECT, _E_SRC_TYPE_GOODS, nil}
        }, --需要订阅的消息列表   条件没有

	tAcceptActions = 
        {
            IClosureAction:New{ cClosure = firsttankuang, nOptions = false, } --是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   IClosureAction:New{ cClosure = firsttankuang, nOptions = true, }  --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表
}
-----------------------------------------------------------------------------------------------------------------------------------------进入拉锯战1-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1970,			-- 任务ID
	szName		= "参加拉锯战",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1971,         -- 下一个任务ID
	nMinLevel 	= 15,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟参加一次拉锯战</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 200,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}
local firstnanjuemap = function(nActorID,nTaskID)
		return true --这里需要判定 决定返还
end
	
CSecretOrder:New{
	nTaskID = 1970,  --任务ID
	szName 	= "参加拉锯战",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	
	tRegisterMsg = 
        {
        }, --需要订阅的消息列表   条件没有

	tAcceptActions = 
        {
            IClosureAction:New{ cClosure = firstnanjuemap, nOptions = false, } --是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   IClosureAction:New{ cClosure = firstnanjuemap, nOptions = true, }  --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表
}
-----------------------------------------------------------------------------------------------------------------------------------------战争命令-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1971,			-- 任务ID
	szName		= "战争命令",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1972,         -- 下一个任务ID
	nMinLevel 	= 15,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>进入拉锯战，点击右下角五角星图标，按照要求完成一个战争命令。</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 80,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}
local firstbattletask = function(nActorID,nTaskID)
	if API_VarDataGetNumber(nActorID,1,12134) == 1 then
		return true --这里需要判定 决定返还
	else
		return false
	end
end
	
CSecretOrder:New{
	nTaskID = 1971,  --任务ID
	szName 	= "战争命令",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	
	tRegisterMsg = 
        {
			{ _EVENT_ID_BATTLE_CMD, _E_SRC_TYPE_ECTYPE, nil} --战争命令
        }, --需要订阅的消息列表   条件没有

	tAcceptActions = 
        {
            IClosureAction:New{ cClosure = firstbattletask, nOptions = false, } --是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   IClosureAction:New{ cClosure = firstbattletask, nOptions = true, }  --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表
}
-----------------------------------------------------------------------------------------------------------------------------------------拉锯杀人-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1972,			-- 任务ID
	szName		= "拉锯首杀",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 1973,         -- 下一个任务ID
	nMinLevel 	= 15,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>进入拉锯战，杀死一名敌对玩家</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 100,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}
local firstblood = function(nActorID,nTaskID)
	if API_VarDataGetNumber(nActorID,1,12127) == 1 then
		return true --这里需要判定 决定返还
	else
		return false
	end
end
	
CSecretOrder:New{
	nTaskID = 1972,  --任务ID
	szName 	= "拉锯首杀",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	
	tRegisterMsg = 
        {
			{ _EVENT_ID_ECTYPE_KILLACTPR, _E_SRC_TYPE_ECTYPE, nil} --战争命令
        }, --需要订阅的消息列表   条件没有

	tAcceptActions = 
        {
            IClosureAction:New{ cClosure = firstblood, nOptions = false, } --是否建设营地,
	     
        },--接受任务时需要执行的动作列表
	

	tFinishActions = 
	{
	   IClosureAction:New{ cClosure = firstblood, nOptions = true, }  --是否建设完成营地,
		 
	},--完成任务时需要执行的动作列表
}
-----------------------------------------------------------------------------------------------------------------------------------------二档武器-------------------------------------------------------------------
IConfigOrder:New{
	nTaskID		= 1973,			-- 任务ID
	szName		= "装备二档武器",	        -- 任务名称
	
	-- 其它属性
	nRepeated 	= false,
	nPrevTaskID 	= 0,		 -- 前置任务ID,必须做了某任务才能做该任务
	nNextTaskID 	= 0,         -- 下一个任务ID
	nMinLevel 	= 17,	-- 该任务要求的最小等级
	nMaxLevel	= 85,		-- 该任务要求的最大等级
	nTaskTypeID	= 5,
	
	
	-- 任务日志描述/如果为函数则执行一个函数
	-- 函数格式如：function fun_TaskGetDesc(nActorID, nTaskID ) 
	szTaskDesc ="<text>让你的徒弟打开背包装备上二档武器，如果背包中没有二档武器可以在新手商人或交易所处购买</text>",
	
	szAcceptHref = "",
	
	-- 奖励的积分
	nAwardIntegral = 200,	
	--衰减等级
	nDecLev = 3,
	--衰减比率
	nDecRate = 0.2,
}
	
CEquipProOrder:New{
	nTaskID 	= 1973,  --任务ID
	szName 		= "装备二档武器",         --任务名字
	
	nScrollID = 40003,              --卷轴ID
	nScrollIconID = 104113,          --卷轴图标ID
	
	nCampID = -1,   --阵营，0帝国，1联邦，-两边都可以

	nTrigKeyID = 12137,
	nProID = 1, --1:物品档次 2:物品ID
	nLoc = 7, --位置
	nValue = 2, --属性值 当nProID为1时 这里是物品档次 1：一档 2: 二档 ... 当nProID为2时,这里是物品ID
}

--1974的任务要是增加 必须通知湘军