-- ----------
-- Email功能
-- ----------

function Email_Title()
	local ActorID = API_RequestGetActorID()
	API_ResponseWrite('<a href="Email_List">查看邮件</a><br>')
	API_ResponseWrite('<a>取消</a><br>')
end

function Email_List()
	local ActorID = API_RequestGetActorID()
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	API_OpenEmail(ActorID,FastID)
end
