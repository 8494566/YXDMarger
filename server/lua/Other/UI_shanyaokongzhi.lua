--2010，1.14 林瑞宇创建
--UI闪耀管理脚本
--LRY_UItwinkemanage(玩家ID，活动最低等级需求（>=），活动最高等级需求（<=），卷轴图标ID，卷轴ID，优先级（见表），回调函数名）
LRY_UItwinkemanage_table={26,27,28,29,31,32,33,34,35,}
function LRY_UItwinkemanage(ActorID,lvmin,lvmax,scrolliconID,scrollID,precedence,callback)
	local ok = 0
	if API_IsBattleGameServer() then
	--API_Trace('当前场景服是跨服赛场景服')
		ok =1
	end
	if scrollID == 1 then
		ok = 0
	end
	--API_Trace('当前场景服不是跨服赛场景服')
	if ok == 0 then
		local Level = API_GetActorExpLevel(ActorID)
		if Level < lvmin or Level > lvmax then
			return
		end
		local shifouxuyaoshoucishan  = 0
		local bushan  = 0
		for i in LRY_UItwinkemanage_table do
			if precedence == LRY_UItwinkemanage_table[i] then
				shifouxuyaoshoucishan = 1
				break
			end
		end
		if shifouxuyaoshoucishan  == 0 then
			local firstlogin = API_VarDataGetNumber(ActorID,0,18368)
			if firstlogin == 1 then
			else
				bushan = 1
			end
		end	
		--执行API
		if bushan == 1 then
			API_AddTaskScrollExLv(ActorID,scrollID,scrolliconID,callback,0,precedence)
		else
			API_AddTaskScrollExLv(ActorID,scrollID,scrolliconID,callback,1,precedence)
		end
	end	
end
--先判断等级是否达标 如果达标 那么判断优先级是否在表里 如果在表里 那么无论是否是第一次登陆 都闪耀卷轴 如果不是 那么不是第一次登陆不显示卷轴