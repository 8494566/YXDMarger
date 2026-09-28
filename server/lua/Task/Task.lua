-- ----------
-- 任务主文件
-- ----------

-- 设置一次种子
math.randomseed(math.random(os.time()))

-- --------------------------
-- 任务公共调用过程
-- --------------------------
require 'Scp\\LUA\\Task\\TaskPublic.lua'
require 'Scp\\LUA\\Task\\TaskTrace.lua'

-- --------------------------
-- 在这里加载所有任务相关脚本
-- --------------------------

--循环任务脚本[5个任务]
require 'Scp\\LUA\\Task\\LoopTask.lua'
require 'Scp\\LUA\\Task\\LoopRecommend.lua'
require 'Scp\\LUA\\Task\\LoopDocTransfer.lua'
require 'Scp\\LUA\\Task\\LoopDocTransfer2.lua'
require 'Scp\\LUA\\Task\\LoopTax.lua'
require 'Scp\\LUA\\Task\\LoopTax2.lua'
require 'Scp\\LUA\\Task\\LoopGetGoodsCmd.lua'
require 'Scp\\LUA\\Task\\LoopTaskBastion.lua'
require 'Scp\\LUA\\Task\\LoopTaskWarCallup.lua'

--动态任务脚本
require 'Scp\\LUA\\Task\\DynamicGatherGoods.lua'
require 'Scp\\LUA\\Task\\DynamicGrowUp.lua'
require 'Scp\\LUA\\Task\\DynamicKillMonster.lua'

-- 运镖任务
require 'Scp\\LUA\\Task\\LoopTaskBodyGuard.lua'
require 'Scp\\LUA\\Task\\LoopTaskBodyGuard1.lua'

-- ------------------------
-- 玩家选择接受任务后的处理
-- ------------------------
function Task_SelectAccept()
	local lActorID = API_RequestGetActorID()
	local lTaskID = API_RequestGetNumber(1)
	API_AcceptTask(lActorID, lTaskID)
end

-- ------------------------
-- 玩家选择完成任务后的处理
-- ------------------------
function Task_SelectFinish()
	local lActorID = API_RequestGetActorID()
	local lTaskID = API_RequestGetNumber(1)
	if lTaskID>0 and lTaskID<3001 then
        API_FinishTask(lActorID, lTaskID)
    end
end

-- ------------------------
-- 玩家选择放弃任务后的处理
-- ------------------------
function GiveupTask()
	local lActorID = API_RequestGetActorID()
	local lTaskID = API_RequestGetNumber(1)
	API_GiveupTask(lActorID, lTaskID)
end

-- ------------------------
-- 玩家选择共享任务后的处理
-- ------------------------
function ShareTask()
	local lActorID = API_RequestGetActorID()
	local lTaskID = API_RequestGetNumber(1)
	API_ShareTask(lActorID, lTaskID)
end
