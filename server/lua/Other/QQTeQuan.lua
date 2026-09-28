----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\QQTeQuan.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	张春明
--日  期:	2009-6-6
--版  本:	1.0
--描  述:	QQ特权头衔
--应  用:  

----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 张春明
--日  期: 2009-6-6
--描  述: 创建
----------------------------------------------------------------------------------------------------------------------

TouXianXiTong_TXList[1004] = {AddFuncName = 'QQTeQuan_TouXian',}
TouXianXiTong_TXList[1005] = {AddFuncName = 'QQTeQuan_TouXian',}
TouXianXiTong_TXList[1006] = {AddFuncName = 'QQTeQuan_TouXian',}
TouXianXiTong_TXList[1007] = {AddFuncName = 'QQTeQuan_TouXian',}
TouXianXiTong_TXList[1008] = {AddFuncName = 'QQTeQuan_TouXian',}
TouXianXiTong_TXList[1009] = {AddFuncName = 'QQTeQuan_TouXian',}
TouXianXiTong_TXList[1010] = {AddFuncName = 'QQTeQuan_TouXian',}
TouXianXiTong_TXList[1011] = {AddFuncName = 'QQTeQuan_TouXian',}
TouXianXiTong_TXList[1012] = {AddFuncName = 'QQTeQuan_TouXian',}
TouXianXiTong_TXList[1013] = {AddFuncName = 'QQTeQuan_TouXian',}
TouXianXiTong_TXList[1014] = {AddFuncName = 'QQTeQuan_TouXian',}

QQTeQuan_DateSave = 18396

QQTeQuan_TouXianList = {
[1004] = {Title = 'QQ特权英雄' , Tip = '使用 QQ会员特权礼包 获得' , R = 255 , G = 0 , B = 0 , Time = 0 , Bit = 1,},
[1005] = {Title = '蓓蕾公主' , Tip = '使用 QQ黄钻·蓓蕾公主礼包 获得' , R = 255 , G = 210 , B = 1 , Time = 0 , Bit = 2,},
[1006] = {Title = '芳菲公主' , Tip = '使用 QQ黄钻·芳菲公主礼包 获得' , R = 255 , G = 210 , B = 1 , Time = 0 , Bit = 3,},
[1007] = {Title = '红颜公主' , Tip = '使用 QQ黄钻·红颜公主礼包 获得' , R = 255 , G = 0 , B = 0 , Time = 0 , Bit = 4,},
[1008] = {Title = '橙星公主' , Tip = '使用 QQ黄钻·橙星公主礼包 获得' , R = 255 , G = 0 , B = 0 , Time = 0 , Bit = 5,},
[1009] = {Title = '黄鹂公主' , Tip = '使用 QQ黄钻·黄鹂公主礼包 获得' , R = 255 , G = 0 , B = 0 , Time = 0 , Bit = 6,},
[1010] = {Title = '绿光公主' , Tip = '使用 QQ黄钻·绿光公主礼包 获得' , R = 255 , G = 0 , B = 0 , Time = 0 , Bit = 7,},
[1011] = {Title = '青黛公主' , Tip = '使用 QQ黄钻·青黛公主礼包 获得' , R = 255 , G = 0 , B = 0 , Time = 0 , Bit = 8,},
[1012] = {Title = '蓝馨公主' , Tip = '使用 QQ黄钻·蓝馨公主礼包 获得' , R = 255 , G = 0 , B = 0 , Time = 0 , Bit = 9,},
[1013] = {Title = '紫郁公主' , Tip = '使用 QQ黄钻·紫郁公主礼包 获得' , R = 255 , G = 0 , B = 0 , Time = 0 , Bit = 10,},
[1014] = {Title = 'QQ传递达人' , Tip = '使用 QQ传递达人礼包 获得' , R = 255 , G = 60 , B = 220 , Time = 0 , Bit = 11,},
}

function QQTeQuan_TouXian(ActorID,TouXianID)
	local Title = ''
	local Tip = ''
	local Show = -1
	local R = 0
	local G = 0
	local B = 0
	local Time = 0
	if QQTeQuan_TouXianList[TouXianID] ~= nil then
		local Bit = QQTeQuan_TouXianList[TouXianID].Bit
		Title = QQTeQuan_TouXianList[TouXianID].Title
		Tip = QQTeQuan_TouXianList[TouXianID].Tip
		R = QQTeQuan_TouXianList[TouXianID].R
		G = QQTeQuan_TouXianList[TouXianID].G
		B = QQTeQuan_TouXianList[TouXianID].B
		Time = QQTeQuan_TouXianList[TouXianID].Time
		local TouXianDate = API_VarDataGetNumber(ActorID,1,QQTeQuan_DateSave)
		local nBitValue = API_DataGetBit(TouXianDate,Bit)
		if nBitValue == 1 then
			Show = 1
		end
	end
	return Show,Title,R,G,B,Time,Tip
end

function QQTeQuan_TouXianAdd(ActorID,TouXianID)
	if QQTeQuan_TouXianList[TouXianID] ~= nil then
		local TouXianDate = API_VarDataGetNumber(ActorID,1,QQTeQuan_DateSave)
		local Bit = QQTeQuan_TouXianList[TouXianID].Bit
		local NewTouXianDate = API_DataSetBit(TouXianDate,Bit,1)
		API_VarDataSetNumber(ActorID,1,QQTeQuan_DateSave,NewTouXianDate)
	end
end
