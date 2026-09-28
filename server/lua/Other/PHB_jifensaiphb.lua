function PHB_JiFenSaiPaiHangBang_Title(ActorID)
	if TML_KuaFuBattle_JFSPHB_Switch == 1 then
		if ActorID == nil or ActorID == 0 then
			ActorID = API_RequestGetActorID()
		end
		API_WindowOnEventII(ActorID, 173, 256, 0, 0)
	else
		API_ResponseWrite('<text>跨服积分赛排行榜暂未开放，请稍候再试</text>')
		API_ResponseWrite('<br><br><a>确定</a>')
	end
end
