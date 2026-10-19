-- =====================================================================
--  英雄岛 —— 全服发放脚本（给所有人发邮件 / 发东西）
--  直接用：GameServer 窗口「脚本更新」File 选本文件 -> 点「更新」
--          然后游戏内 GM 面板 -> 执行函数 -> 输入下面任一函数名 -> 执行
--              FAFANG_TestSelf    只发给自己（先验样式）
--              FAFANG_ToNames     按名单发（可含离线玩家）
--              FAFANG_ToOnline    发给当前在线玩家
--              FAFANG_List        查看在线表 / 名单
--  编码：GBK/ANSI。本文件已按 GBK 保存，用记事本改完保存时选“ANSI”别选 UTF-8。
-- =====================================================================


-- ===================== ① 发放配置（改这里） =====================
local FAFANG = {
	Title = '【全服补偿】',                                  -- 邮件标题（最多32字节）
	Body  = '感谢大家的支持，全服补偿如下，请到邮箱领取。',    -- 邮件正文（最多600字节）
	Money = 10000,                                          -- 随信金币，0 = 不发金币

	-- 物品清单：{id=物品ID, num=数量, bind=绑定标记}
	-- 绑定标记：1 = 不绑定(可交易)，0 = 绑定
	-- 常用 ID：80082 点券 / 80498 经验兑换券 / 80696 水晶币兑换券 / 80289 购物券
	-- 注意：一件物品一封邮件；系统邮件不受“同人10秒一封”限制，但别一次塞太多种。
	Items = {
		{ id = 80082, num = 1000, bind = 1 },               -- 点券 x 1000
	},
}


-- ===================== ② 离线名单（全部人发这里） =====================
-- 名单可以随时用 SQL 重新生成，粘到下面就行：
--   USE GameDB;
--   SELECT '"' + ActorName + '",' FROM dbo.Actor WHERE ActorID > 10000;
local FAFANG_Names = {
	"将五一",
	"无双",
	"冰镇的油罐车",
	"风起",
	"神避",
}


-- ===================== ③ 在线玩家表（自动维护） =====================
if not FAFANG_OnlineTab then
	FAFANG_OnlineTab = {}
end

function FAFANG_OnLogin()
	local ActorID = API_RequestGetActorID()
	if ActorID ~= nil and ActorID > 0 then
		FAFANG_OnlineTab[ActorID] = ActorID
	end
end

function FAFANG_OnLogout()
	local ActorID = API_RequestGetActorID()
	FAFANG_OnlineTab[ActorID] = nil
end

do
	local function hook(list, fn)
		if list ~= nil then
			for i, _ in pairs(list) do
				if list[i] == fn then
					return
				end
			end
			table.insert(list, fn)
		end
	end
	hook(GLOBAL_ActMain_OnLoginFuncNameList,    'FAFANG_OnLogin')
	hook(GLOBAL_ActMain_OnLoginMapFuncNameList, 'FAFANG_OnLogin')
	hook(GLOBAL_ActMain_OnLogoutFuncNameList,   'FAFANG_OnLogout')
end


-- ===================== ④ 核心：给一个角色发齐全部东西 =====================
local function FAFANG_SendOne(name)
	if name == nil or name == '' then
		return 0
	end

	local n = 0

	if FAFANG.Money > 0 then
		API_SendActorMoneyMail_UnLine(name, FAFANG.Money, FAFANG.Title, FAFANG.Body)
		n = n + 1
	end

	-- API_SendActorMailByName(角色名, 物品ID, 数量, 绑定标记, 标题, 正文)
	for _, it in ipairs(FAFANG.Items) do
		API_SendActorMailByName(name, it.id, it.num, it.bind, FAFANG.Title, FAFANG.Body)
		n = n + 1
	end

	return n
end


-- ===================== ⑤ 入口函数 =====================

-- 1) 只发给自己，验样式
function FAFANG_TestSelf()
	local ActorID = API_RequestGetActorID()
	local name = API_GetActorName(ActorID)
	FAFANG_SendOne(name)
	API_ResponseWrite('<name> 全服发放 </name>')
	API_ResponseWrite('<text>测试邮件已发给你自己（' .. name .. '），去邮箱看看样式。</text><br>')
end

-- 2) 按名单发（在线离线都能收到）
function FAFANG_ToNames()
	local n = 0
	for _, name in ipairs(FAFANG_Names) do
		if name ~= nil and name ~= '' then
			FAFANG_SendOne(name)
			n = n + 1
		end
	end
	API_ResponseWrite('<name> 全服发放 </name>')
	API_ResponseWrite('<text>已按名单发放：' .. n .. ' 人</text><br>')
	API_ActorBroadcastMsg(-1, 17, '【全服补偿】已发放，请到邮箱领取！')
end

-- 3) 发给当前在线玩家
function FAFANG_ToOnline()
	local n = 0
	for actorID, _ in pairs(FAFANG_OnlineTab) do
		local name = API_GetActorName(actorID)
		if name ~= nil and name ~= '' then
			FAFANG_SendOne(name)
			n = n + 1
		end
	end
	API_ResponseWrite('<name> 全服发放 </name>')
	API_ResponseWrite('<text>已发放在线玩家：' .. n .. ' 人</text><br>')
	API_ActorBroadcastMsg(-1, 17, '【全服补偿】已发放，请到邮箱领取！')
end

-- 4) 查看在线表和名单
function FAFANG_List()
	API_ResponseWrite('<name> 全服发放 </name>')
	API_ResponseWrite('<text>在线表：</text><br>')
	local n = 0
	for actorID, _ in pairs(FAFANG_OnlineTab) do
		API_ResponseWrite('<text>' .. actorID .. ' ' .. tostring(API_GetActorName(actorID)) .. '</text><br>')
		n = n + 1
	end
	API_ResponseWrite('<text>共 ' .. n .. ' 人在线</text><br><br>')
	API_ResponseWrite('<text>名单（共 ' .. #FAFANG_Names .. ' 人）：</text><br>')
	for _, name in ipairs(FAFANG_Names) do
		API_ResponseWrite('<text>' .. name .. '</text><br>')
	end
end


-- ===================== ⑥ 注册入口 =====================
API_AddLUAReqFunc('FAFANG_TestSelf')
API_AddLUAReqFunc('FAFANG_ToNames')
API_AddLUAReqFunc('FAFANG_ToOnline')
API_AddLUAReqFunc('FAFANG_List')

API_TraceError('GM_MailAll.lua 已加载，入口：FAFANG_TestSelf / FAFANG_ToNames / FAFANG_ToOnline / FAFANG_List')
