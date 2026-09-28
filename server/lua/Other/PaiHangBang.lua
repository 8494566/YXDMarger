--排行榜
--所有排行榜都走这个函数 点击排行榜执行这个函数 从这个函数 链接到各个排行榜
--2008.12.11
--林瑞宇

function PHB_paihangbang_Title()
	local ActorID = API_RequestGetActorID()
	local SelectItem = API_RequestGetNumber(1)
	API_ResponseWrite('<a href="PHB_GeRenZhanLiPaiHangBang">个人战力排行榜查询</a><br><br>')
	API_ResponseWrite('<a href="ZLXT_zhanlichaxun_Title">个人战力查询</a><br><br>')
	API_ResponseWrite('<a href="ZLXT_liaojiezhanli">了解战力</a><br><br>')	
end
		--API_ResponseWrite('<a href="PHB_paihangbang_Title?1=102">个人财富排行榜</a><br><br>')
		--API_ResponseWrite('<a href="PHB_paihangbang_Title?1=103">佣兵团人气排行榜</a><br><br>')