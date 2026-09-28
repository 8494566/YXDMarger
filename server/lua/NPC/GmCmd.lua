-- 设置交互系统的数值 , (仅供测试人员使用)
-- 参数: ActorID
-- 返回值:  无
function GMSetVar(ActorID, Pos, Value)
	if nil==ActorID then
		return
	end

	if nil==Pos then
		return
	end
	
	if nil==Value then
		return
	end	

	API_VarDataSetNumber(ActorID, 1, Pos, Value)
	local newvalue = API_VarDataGetNumber(ActorID, 1, Pos)
	GMGetVar(ActorID, Pos)
end



-- 设置交互系统的数值 , (仅供测试人员使用)
-- 参数: ActorID
-- 返回值:  无
function GMGetVar(ActorID, Pos)
	if nil==ActorID then
		return
	end

	if nil==Pos then
		return
	end
	
	local newvalue = API_VarDataGetNumber(ActorID, 1, Pos)
	API_ActorSendMsg(ActorID, 3, "目标单元"..Pos..":"..newvalue)
end
