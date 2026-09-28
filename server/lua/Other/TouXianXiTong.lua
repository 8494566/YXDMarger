----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\TouXianXiTong.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2009-6-6
--版  本:	1.0
--描  述:	头衔系统
--应  用:  

----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2009-6-6
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------



--头衔ID分配
--1-1000宙斯用
--1001-2000张春明
--2001-3000万钰林

--当前头衔交互数据
TouXianXiTong_SaveData = 18395

function TouXianXiTong_Title(ActorID,SelectItem,TouXianID,Set)
	local ActorID = ActorID or API_RequestGetActorID()
	local SelectItem = SelectItem or API_RequestGetNumber(1)
	if SelectItem == 0 then
		API_ResponseWrite('<name id="11049">网域游戏助手</name>')
		API_ResponseWrite('<win rect="650, 190, 280, 280" move="0" alpha="240" balpha="230" close="1" ntype="5"></win>')
		local ShiFouYou = 0
		for i in TouXianXiTong_TXList do
			local String = TouXianXiTong_TXList[i].AddFuncName
			if  type(String) == 'string' then	
				local Function = _G[String]
				if type(Function) == 'function' then
					local Show,QianZhui,R,G,B,Time,Tip = Function(ActorID,i)
					if Show ~= -1 then
						ShiFouYou = 1
						break
					end
				end
			end
		end
		if ShiFouYou == 0 then
			API_ResponseWrite('<br><text>您目前还没有取得头衔</text><br>')
			API_ResponseWrite('<br><br><a href="epfunc_YDJZDvHw?1 = 999" Underline="1">返回</a><br>')
		else
			API_ResponseWrite('<br><br><text>请选择您要使用的头衔：</text><br>')
			for i in TouXianXiTong_TXList do
				local String = TouXianXiTong_TXList[i].AddFuncName
				if  type(String) == 'string' then	
					local Function = _G[String]
					if type(Function) == 'function' then
						local Show,QianZhui,R,G,B,Time,Tip = Function(ActorID,i)
						if Show == 1 then
							API_ResponseWrite('<br><a href="TouXianXiTong_Title?1=1&2='..i..'" tip="'..Tip..'" allcolor="'..R..','..G..','..B..'">'..QianZhui..'</a><br>')
						end
					end
				end
			end
			for i in TouXianXiTong_TXList do
				local String = TouXianXiTong_TXList[i].AddFuncName
				if  type(String) == 'string' then	
					local Function = _G[String]
					if type(Function) == 'function' then
						local Show,QianZhui,R,G,B,Time,Tip = Function(ActorID,i)
						if Show == 0 then
							API_ResponseWrite('<br><a href="TouXianXiTong_Title?1=1&2='..i..'" tip="暂不可用" allcolor="150,150,150">'..QianZhui..'</a><br>')
						end
					end
				end
			end
			API_ResponseWrite('<br><br><a href="TouXianXiTong_Title?1=2">不使用头衔</a><br>')
			API_ResponseWrite('<br><a href="epfunc_YDJZDvHw?1 = 999" Underline="1">返回</a><br>')
		end
	elseif SelectItem == 1 then
		local TouXianID = TouXianID or API_RequestGetNumber(2)
		if TouXianXiTong_TXList[TouXianID] == nil then
			API_ResponseWrite('<name id="11049">网域游戏助手</name>')
			API_ResponseWrite('<win rect="650, 190, 280, 280" move="0" alpha="240" balpha="230" close="1" ntype="5"></win>')
			API_ResponseWrite('<br><text>非法头衔</text><br>')
			API_ResponseWrite('<br><br><a href="epfunc_YDJZDvHw?1 = 999" Underline="1">返回</a><br>')
			return
		end
		local String = TouXianXiTong_TXList[TouXianID].AddFuncName
		if  type(String) == 'string' then	
			local Function = _G[String]
			if type(Function) == 'function' then
				local Show,QianZhui,R,G,B,Time,Tip = Function(ActorID,TouXianID)
				if Show == 1 then
					API_SetActorNameEffect(ActorID,1,R,G,B,Time,QianZhui)
					API_SetActorNameEffect(ActorID,2,R,G,B,Time,QianZhui)
					API_VarDataSetNumber(ActorID,1,TouXianXiTong_SaveData,TouXianID)
					if Set == nil then
						API_ResponseWrite('<name id="11049">网域游戏助手</name>')
						API_ResponseWrite('<win rect="650, 190, 280, 280" move="0" alpha="240" balpha="230" close="1" ntype="5"></win>')
						API_ResponseWrite('<br><br><text>您成功的选择了头衔：</text><text color="'..R..','..G..','..B..'">'..QianZhui..'</text><br>')
						API_ResponseWrite('<br><br><a href="epfunc_YDJZDvHw?1 = 999" Underline="1">返回</a><br>')
					end
				elseif Show == 0 or Show == -1 then
					if Set == nil then
						API_ResponseWrite('<name id="11049">网域游戏助手</name>')
						API_ResponseWrite('<win rect="650, 190, 280, 280" move="0" alpha="240" balpha="230" close="1" ntype="5"></win>')
						API_ResponseWrite('<br><br><text>该头衔暂不可用</text><br>')
						API_ResponseWrite('<br><br><a href="epfunc_YDJZDvHw?1 = 999" Underline="1">返回</a><br>')
					else
						API_SetActorNameEffect(ActorID,1,255,0,255,0,'')
					end
				end
			end
		end
	elseif SelectItem == 2 then
		API_SetActorNameEffect(ActorID,1,0,0,0,0,'')
		API_VarDataSetNumber(ActorID,1,TouXianXiTong_SaveData,0)
		API_ResponseWrite('<name id="11049">网域游戏助手</name>')
		API_ResponseWrite('<win rect="650, 190, 280, 280" move="0" alpha="240" balpha="230" close="1" ntype="5"></win>')
		API_ResponseWrite('<br><br><text>设置成功！</text><br>')
		API_ResponseWrite('<br><br><a href="epfunc_YDJZDvHw?1 = 999" Underline="1">返回</a><br>')
	end
end

--上线处理
function TouXianXiTong_OnLogin()
	local ActorID = API_RequestGetActorID()
	local TouXianID = API_VarDataGetNumber(ActorID,1,TouXianXiTong_SaveData)
	if TouXianXiTong_TXList[TouXianID] == nil then
		return
	end
	local String = TouXianXiTong_TXList[TouXianID].AddFuncName
	if  type(String) == 'string' then	
		local Function = _G[String]
		if type(Function) == 'function' then
			local Show,QianZhui,R,G,B,Time,Tip = Function(ActorID,TouXianID)
			if Show == 1 then
				API_SetActorNameEffect(ActorID,1,R,G,B,Time,QianZhui)
				API_SetActorNameEffect(ActorID,2,R,G,B,Time,QianZhui)
			end
		end
	end
end

--切换地图
function TouXianXiTong_OnLoginMap()
	local ActorID = API_RequestGetActorID()
	local TouXianID = API_VarDataGetNumber(ActorID,1,TouXianXiTong_SaveData)
	if TouXianXiTong_TXList[TouXianID] == nil then
		return
	end
	local String = TouXianXiTong_TXList[TouXianID].AddFuncName
	if  type(String) == 'string' then	
		local Function = _G[String]
		if type(Function) == 'function' then
			local Show,QianZhui,R,G,B,Time,Tip = Function(ActorID,TouXianID)
			if Show == 1 then
				API_SetActorNameEffect(ActorID,1,R,G,B,Time,QianZhui)
				API_SetActorNameEffect(ActorID,2,R,G,B,Time,QianZhui)
			end
		end
	end
end

