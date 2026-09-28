-------------------------------
--文件名:	Scp\Lua\Other\LC_DataLoading
--版  权:	(C)  深圳腾讯计算机网络有限公司
--创建人:	
--日  期:	
--版  本:	
--描  述: 
--应  用:  
-------------------------------

local LC_DataTable = {
--战力达人
{TypeID = 1,ServerID = 0,DataID = -6001,SaveDB = 1,key = 1},
--夺宝奇兵
{TypeID = 1,ServerID = 0,DataID = -6002,SaveDB = 1,key = 1},
{TypeID = 1,ServerID = 0,DataID = -6003,SaveDB = 1,key = 1},
{TypeID = 1,ServerID = 0,DataID = -6004,SaveDB = 1,key = 1},
{TypeID = 1,ServerID = 0,DataID = -6005,SaveDB = 1,key = 1},
{TypeID = 1,ServerID = 0,DataID = -6008,SaveDB = 1,key = 1},
--七夕活动
{TypeID = 1,ServerID = 0,DataID = -6009,SaveDB = 1,key = 1},
--中秋活动
{TypeID = 1,ServerID = 0,DataID = -6010,SaveDB = 1,key = 1},
--2010圣诞狂欢派对
{TypeID = 1,ServerID = 0,DataID = -6011,SaveDB = 1,key = 1},
--圣诞狂欢派对
{TypeID = 1,ServerID = 0,DataID = -6012,SaveDB = 1,key = 1},
--2010春节活动
{TypeID = 1,ServerID = 0,DataID = -6013,SaveDB = 1,key = 1},
--云游
{TypeID = 1,ServerID = 0,DataID = -6014,SaveDB = 1,key = 1},
--2011国庆活动
{TypeID = 1,ServerID = 0,DataID = -6015,SaveDB = 1,key = 1},
--万圣节活动
{TypeID = 1,ServerID = 0,DataID = -6016,SaveDB = 1,key = 1},
--春节活动
{TypeID = 1,ServerID = 0,DataID = -6017,SaveDB = 1,key = 1},
--英雄大作战
{TypeID = 1,ServerID = 0,DataID = -6018,SaveDB = 1,key = 1},
--2012五一活动
{TypeID = 1,ServerID = 0,DataID = -6019,SaveDB = 1,key = 1},
--英雄之魂
{TypeID = 1,ServerID = 0,DataID = -6020,SaveDB = 1,key = 1},
--砸蛋
{TypeID = 1,ServerID = 0,DataID = -6100,SaveDB = 1,key = 1},
--云游
{TypeID = 1,ServerID = 0,DataID = -6014,SaveDB = 1,key = 1},
--财神宝箱
{TypeID = 1,ServerID = 0,DataID = -6199,SaveDB = 1,key = 1},
--BOSS
{TypeID = 1,ServerID = 0,DataID = -6189,SaveDB = 1,key = 1},
--端午节
{TypeID = 1,ServerID = 0,DataID = -6188,SaveDB = 1,key = 1},
--端午节每天限量
{TypeID = 1,ServerID = 0,DataID = -6187,SaveDB = 1,key = 1},
--荣誉宝箱
{TypeID = 1,ServerID = 0,DataID = -6182,SaveDB = 1,key = 1},
--沙暴节拍器争夺
{TypeID = 1,ServerID = 0,DataID = -6021,SaveDB = 1,key = 1},
}



for i = 1,table.getn(LC_DataTable) do
	local DataTable = LC_DataTable[i]
	local TypeID = DataTable.TypeID
	local ServerID = DataTable.ServerID
	local DataID = DataTable.DataID
	local SaveDB = DataTable.SaveDB
	local key = DataTable.key
	if API_VarDataGetNumber_Ex(TypeID,ServerID,DataID,SaveDB,key) == 0 then
		API_VarDataLoad_Ex(TypeID,ServerID,DataID)
	end
end
