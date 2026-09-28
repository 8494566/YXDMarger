----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Act\WanShengJie.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	林瑞宇
--日  期:	2008-10-24
--版  本:	1.0
--描  述:	万圣节活动
--应  用:  
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 林瑞宇
--日  期: 2008-10-24
--描  述: 
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--修改记录 
--修改人: 刘操
--日  期: 2010-10-14
--描  述: 
----------------------------------------------------------------------------------------------------------------------

WSJHD_StartTime = {Year = 2011,Month = 10,Day = 25,Hour = 0,Minute = 0,Second = 0}   -------开始时间
WSJHD_EndTime = {Year = 2011,Month = 11,Day = 2,Hour = 0,Minute = 0,Second = 0}   -------停止时间


if WSJHD_TimerTriggerID == nil then
	WSJHD_TimerTriggerID = API_CreateTimerTriggerG(0,0,60,-1,'WSJHD_TimerTriggerGCallFunc')
end


if WSJHD_NanGuaGuaiList == nil then
	WSJHD_NanGuaGuaiList = {}
end

if WSJHD_NanGuaCheList == nil then
	WSJHD_NanGuaCheList = {}
end

local NanGuaGuaiID = 271213 -- 南瓜怪ID
local NanGuaCheID = 11691 --万圣节礼车ID
local NanGuaBossID = 271212 --南瓜头领ID

GLOBAL_NanGuaChe_Route = {
	[9] = {
			[1] = {StartTile = {TileX = 141,TileY = 346},RouteNum = 28,Route = {141,346,2,143,326,2,133,315,2,118,300,2,120,278,2,127,266,2,142,240,2,146,220,2,157,206,2,175,196,2,190,188,2,211,183,2,230,170,2,247,155,2,260,161,2,283,156,2,297,164,2,301,184,2,302,206,2,283,229,2,266,251,2,252,267,2,252,290,2,254,310,2,253,334,2,232,341,2,213,353,2,194,367,2},},
			[2] = {StartTile = {TileX = 194,TileY = 367},RouteNum = 28,Route = {194,367,2,213,353,2,232,341,2,253,334,2,254,310,2,252,290,2,252,267,2,266,251,2,283,229,2,302,206,2,301,184,2,297,164,2,283,156,2,260,161,2,247,155,2,230,170,2,211,183,2,190,188,2,175,196,2,157,206,2,146,220,2,142,240,2,127,266,2,120,278,2,118,300,2,133,315,2,143,326,2,141,346,2},},
			},
--	[10] = {
--			[1] = {StartTile = {TileX = 146,TileY = 280},RouteNum = 18,Route = {146,280,2,169,276,2,189,277,2,215,283,2,215,304,2,235,310,2,256,306,2,256,332,2,254,353,2,238,364,2,216,362,2,199,369,2,184,359,2,159,389,2,148,384,2,142,370,2,128,358,2,118,348,2},},
--			[2] = {StartTile = {TileX = 118,TileY = 348},RouteNum = 18,Route = {118,348,2,128,358,2,142,370,2,148,384,2,159,389,2,184,389,2,199,369,2,216,362,2,238,364,2,254,353,2,256,332,2,256,306,2,235,310,2,215,304,2,215,283,2,189,277,2,169,276,2,146,280,2},},
--			},
	[25] = {
			[1] = {StartTile = {TileX = 176,TileY = 317},RouteNum = 23,Route = {176,317,2,188,293,2,213,278,2,231,277,2,255,271,2,274,253,2,299,247,2,328,229,2,320,212,2,320,181,2,301,182,2,288,175,2,283,162,2,258,169,2,237,178,2,219,189,2,199,196,2,189,200,2,183,217,2,172,241,2,174,258,2,157,275,2,146,283,2},},
			[2] = {StartTile = {TileX = 146,TileY = 283},RouteNum = 23,Route = {146,283,2,157,275,2,174,258,2,172,241,2,183,217,2,189,200,2,199,196,2,219,189,2,237,178,2,258,169,2,283,162,2,288,175,2,301,182,2,320,181,2,320,212,2,328,229,2,299,247,2,274,253,2,255,271,2,231,277,2,213,278,2,188,293,2,176,317,2},},
			},
--	[23] = {
--			[1] = {StartTile = {TileX = 121,TileY = 298},RouteNum = 29,Route = {121,298,2,144,294,2,165,287,2,178,271,2,180,249,2,197,238,2,201,222,2,219,208,2,231,189,2,239,173,2,244,155,2,254,137,2,270,117,2,285,118,2,309,119,2,325,124,2,336,138,2,342,156,2,326,178,2,297,190,2,273,203,2,261,222,2,247,241,2,235,259,2,231,276,2,216,297,2,201,309,2,176,327,2,167,318,2},},
--			[2] = {StartTile = {TileX = 167,TileY = 318},RouteNum = 29,Route = {167,318,2,176,327,2,201,309,2,216,297,2,231,276,2,235,259,2,247,241,2,261,222,2,273,203,2,297,190,2,326,178,2,342,156,2,336,138,2,325,124,2,309,119,2,285,118,2,270,117,2,254,137,2,244,155,2,239,173,2,231,189,2,219,208,2,201,222,2,197,238,2,180,249,2,178,271,2,165,287,2,144,294,2,121,298,2},},
--			},
--	[1956] = {
--			[1] = {StartTile = {TileX = 86,TileY = 303},RouteNum = 27,Route = {86,303,2,98,298,2,105,291,2,111,283,2,123,280,2,141,270,2,150,274,2,167,278,2,176,281,2,183,284,2,185,286,2,190,294,2,195,304,2,201,312,2,204,321,2,192,327,2,180,330,2,168,329,2,157,335,2,148,333,2,137,329,2,125,326,2,115,320,2,123,305,2,112,302,2,97,304,2,86,301,2},},
--			[2] = {StartTile = {TileX = 62,TileY = 415},RouteNum = 28,Route = {62,415,2,72,420,2,80,425,2,81,433,2,93,432,2,109,431,2,113,434,2,117,444,2,128,444,2,136,446,2,146,448,2,153,447,2,161,444,2,167,436,2,168,424,2,176,419,2,178,409,2,170,404,2,161,399,2,150,396,2,136,396,2,123,397,2,110,396,2,99,400,2,92,409,2,81,415,2,70,420,2,62,415,2},},
--			[3] = {StartTile = {TileX = 128,TileY = 340},RouteNum = 31,Route = {128,340,2,130,326,2,135,315,2,139,305,2,147,297,2,152,286,2,159,278,2,168,274,2,177,277,2,187,282,2,196,288,2,202,296,2,210,301,2,209,314,2,211,326,2,209,342,2,215,351,2,210,367,2,207,382,2,197,391,2,197,403,2,184,407,2,175,403,2,161,403,2,153,396,2,152,383,2,147,372,2,141,363,2,132,358,2,129,347,2,127,341,2},},
--			[4] = {StartTile = {TileX = 505,TileY = 217},RouteNum = 27,Route = {505,217,2,492,215,2,480,211,2,480,199,2,467,199,2,467,188,2,457,193,2,447,203,2,437,213,2,427,224,2,415,224,2,400,224,2,391,233,2,397,244,2,395,258,2,408,257,2,417,253,2,422,244,2,430,238,2,441,242,2,455,243,2,466,238,2,470,231,2,474,224,2,484,218,2,499,218,2,505,217,2},},
--			[5] = {StartTile = {TileX = 502,TileY = 352},RouteNum = 33,Route = {502,352,2,488,353,2,472,354,2,467,369,2,454,377,2,443,386,2,435,398,2,423,403,2,411,402,2,405,394,2,398,386,2,390,379,2,388,377,2,383,371,2,377,363,2,373,356,2,373,348,2,379,340,2,385,332,2,393,327,2,402,320,2,413,319,2,423,319,2,432,321,2,442,321,2,455,320,2,467,319,2,479,314,2,492,313,2,502,313,2,501,328,2,500,344,2,502,352,2},},
--			[6] = {StartTile = {TileX = 460,TileY = 280},RouteNum = 34,Route = {460,280,2,464,275,2,463,263,2,459,261,2,451,255,2,438,256,2,436,247,2,430,237,2,419,233,2,406,234,2,392,235,2,382,243,2,371,251,2,360,250,2,353,263,2,361,268,2,362,282,2,366,294,2,368,307,2,367,322,2,367,337,2,369,350,2,379,352,2,389,358,2,400,352,2,411,346,2,421,341,2,427,332,2,431,320,2,436,310,2,436,300,2,434,290,2,445,284,2,460,280,2},},
--			},
--	[1957] = {
--			[1] = {StartTile = {TileX = 86,TileY = 303},RouteNum = 27,Route = {86,303,2,98,298,2,105,291,2,111,283,2,123,280,2,141,270,2,150,274,2,167,278,2,176,281,2,183,284,2,185,286,2,190,294,2,195,304,2,201,312,2,204,321,2,192,327,2,180,330,2,168,329,2,157,335,2,148,333,2,137,329,2,125,326,2,115,320,2,123,305,2,112,302,2,97,304,2,86,301,2},},
--			[2] = {StartTile = {TileX = 62,TileY = 415},RouteNum = 28,Route = {62,415,2,72,420,2,80,425,2,81,433,2,93,432,2,109,431,2,113,434,2,117,444,2,128,444,2,136,446,2,146,448,2,153,447,2,161,444,2,167,436,2,168,424,2,176,419,2,178,409,2,170,404,2,161,399,2,150,396,2,136,396,2,123,397,2,110,396,2,99,400,2,92,409,2,81,415,2,70,420,2,62,415,2},},
--			[3] = {StartTile = {TileX = 128,TileY = 340},RouteNum = 31,Route = {128,340,2,130,326,2,135,315,2,139,305,2,147,297,2,152,286,2,159,278,2,168,274,2,177,277,2,187,282,2,196,288,2,202,296,2,210,301,2,209,314,2,211,326,2,209,342,2,215,351,2,210,367,2,207,382,2,197,391,2,197,403,2,184,407,2,175,403,2,161,403,2,153,396,2,152,383,2,147,372,2,141,363,2,132,358,2,129,347,2,127,341,2},},
--			[4] = {StartTile = {TileX = 505,TileY = 217},RouteNum = 27,Route = {505,217,2,492,215,2,480,211,2,480,199,2,467,199,2,467,188,2,457,193,2,447,203,2,437,213,2,427,224,2,415,224,2,400,224,2,391,233,2,397,244,2,395,258,2,408,257,2,417,253,2,422,244,2,430,238,2,441,242,2,455,243,2,466,238,2,470,231,2,474,224,2,484,218,2,499,218,2,505,217,2},},
--			[5] = {StartTile = {TileX = 502,TileY = 352},RouteNum = 33,Route = {502,352,2,488,353,2,472,354,2,467,369,2,454,377,2,443,386,2,435,398,2,423,403,2,411,402,2,405,394,2,398,386,2,390,379,2,388,377,2,383,371,2,377,363,2,373,356,2,373,348,2,379,340,2,385,332,2,393,327,2,402,320,2,413,319,2,423,319,2,432,321,2,442,321,2,455,320,2,467,319,2,479,314,2,492,313,2,502,313,2,501,328,2,500,344,2,502,352,2},},
--			[6] = {StartTile = {TileX = 460,TileY = 280},RouteNum = 34,Route = {460,280,2,464,275,2,463,263,2,459,261,2,451,255,2,438,256,2,436,247,2,430,237,2,419,233,2,406,234,2,392,235,2,382,243,2,371,251,2,360,250,2,353,263,2,361,268,2,362,282,2,366,294,2,368,307,2,367,322,2,367,337,2,369,350,2,379,352,2,389,358,2,400,352,2,411,346,2,421,341,2,427,332,2,431,320,2,436,310,2,436,300,2,434,290,2,445,284,2,460,280,2},},
--			},
--	[1959] = {
--			[1] = {StartTile = {TileX = 86,TileY = 303},RouteNum = 27,Route = {86,303,2,98,298,2,105,291,2,111,283,2,123,280,2,141,270,2,150,274,2,167,278,2,176,281,2,183,284,2,185,286,2,190,294,2,195,304,2,201,312,2,204,321,2,192,327,2,180,330,2,168,329,2,157,335,2,148,333,2,137,329,2,125,326,2,115,320,2,123,305,2,112,302,2,97,304,2,86,301,2},},
--			[2] = {StartTile = {TileX = 62,TileY = 415},RouteNum = 28,Route = {62,415,2,72,420,2,80,425,2,81,433,2,93,432,2,109,431,2,113,434,2,117,444,2,128,444,2,136,446,2,146,448,2,153,447,2,161,444,2,167,436,2,168,424,2,176,419,2,178,409,2,170,404,2,161,399,2,150,396,2,136,396,2,123,397,2,110,396,2,99,400,2,92,409,2,81,415,2,70,420,2,62,415,2},},
--			[3] = {StartTile = {TileX = 128,TileY = 340},RouteNum = 31,Route = {128,340,2,130,326,2,135,315,2,139,305,2,147,297,2,152,286,2,159,278,2,168,274,2,177,277,2,187,282,2,196,288,2,202,296,2,210,301,2,209,314,2,211,326,2,209,342,2,215,351,2,210,367,2,207,382,2,197,391,2,197,403,2,184,407,2,175,403,2,161,403,2,153,396,2,152,383,2,147,372,2,141,363,2,132,358,2,129,347,2,127,341,2},},
--			[4] = {StartTile = {TileX = 505,TileY = 217},RouteNum = 27,Route = {505,217,2,492,215,2,480,211,2,480,199,2,467,199,2,467,188,2,457,193,2,447,203,2,437,213,2,427,224,2,415,224,2,400,224,2,391,233,2,397,244,2,395,258,2,408,257,2,417,253,2,422,244,2,430,238,2,441,242,2,455,243,2,466,238,2,470,231,2,474,224,2,484,218,2,499,218,2,505,217,2},},
--			[5] = {StartTile = {TileX = 502,TileY = 352},RouteNum = 33,Route = {502,352,2,488,353,2,472,354,2,467,369,2,454,377,2,443,386,2,435,398,2,423,403,2,411,402,2,405,394,2,398,386,2,390,379,2,388,377,2,383,371,2,377,363,2,373,356,2,373,348,2,379,340,2,385,332,2,393,327,2,402,320,2,413,319,2,423,319,2,432,321,2,442,321,2,455,320,2,467,319,2,479,314,2,492,313,2,502,313,2,501,328,2,500,344,2,502,352,2},},
--			[6] = {StartTile = {TileX = 460,TileY = 280},RouteNum = 34,Route = {460,280,2,464,275,2,463,263,2,459,261,2,451,255,2,438,256,2,436,247,2,430,237,2,419,233,2,406,234,2,392,235,2,382,243,2,371,251,2,360,250,2,353,263,2,361,268,2,362,282,2,366,294,2,368,307,2,367,322,2,367,337,2,369,350,2,379,352,2,389,358,2,400,352,2,411,346,2,421,341,2,427,332,2,431,320,2,436,310,2,436,300,2,434,290,2,445,284,2,460,280,2},},
--			},
}
GLOBAL_NanGuaChe_didianbaogao={
	[9]={
		[1]={x=141,y=338,yuyan=1,},
		[2]={x=121,y=351,yuyan=4,},
		[3]={x=77,y=312,yuyan=5,},
		[4]={x=117,y=305,yuyan=6,},
		[5]={x=200,y=383,yuyan=3,},
	   },
	[10]={
		[1]={x=182,y=234,yuyan=2,},
		[2]={x=258,y=231,yuyan=3,},
		[3]={x=198,y=322,yuyan=4,},
		[4]={x=147,y=273,yuyan=5,},
	   },	 
	[1956]={
		[1]={x=115,y=343,yuyan=7,},
		[2]={x=86,y=303,yuyan=10,},
		[3]={x=62,y=415,yuyan=11,},
		[4]={x=176,y=419,yuyan=14,},
		[5]={x=235,y=236,yuyan=15,},
		[6]={x=213,y=345,yuyan=9,},
		[7]={x=250,y=376,yuyan=9,},
		[8]={x=301,y=381,yuyan=9,},
		[9]={x=460,y=280,yuyan=8,},
		[10]={x=505,y=217,yuyan=12,},
		[11]={x=502,y=352,yuyan=13,},
		[12]={x=412,y=389,yuyan=16,},
		[13]={x=438,y=217,yuyan=17,},
	   },
	[1957]={
		[1]={x=115,y=343,yuyan=7,},
		[2]={x=86,y=303,yuyan=10,},
		[3]={x=62,y=415,yuyan=11,},
		[4]={x=176,y=419,yuyan=14,},
		[5]={x=235,y=236,yuyan=15,},
		[6]={x=213,y=345,yuyan=9,},
		[7]={x=250,y=376,yuyan=9,},
		[8]={x=301,y=381,yuyan=9,},
		[9]={x=460,y=280,yuyan=8,},
		[10]={x=505,y=217,yuyan=12,},
		[11]={x=502,y=352,yuyan=13,},
		[12]={x=412,y=389,yuyan=16,},
		[13]={x=438,y=217,yuyan=17,},
	   },
	[1959]={
		[1]={x=115,y=343,yuyan=7,},
		[2]={x=86,y=303,yuyan=10,},
		[3]={x=62,y=415,yuyan=11,},
		[4]={x=176,y=419,yuyan=14,},
		[5]={x=235,y=236,yuyan=15,},
		[6]={x=213,y=345,yuyan=9,},
		[7]={x=250,y=376,yuyan=9,},
		[8]={x=301,y=381,yuyan=9,},
		[9]={x=460,y=280,yuyan=8,},
		[10]={x=505,y=217,yuyan=12,},
		[11]={x=502,y=352,yuyan=13,},
		[12]={x=412,y=389,yuyan=16,},
		[13]={x=438,y=217,yuyan=17,},
	   },
}

GLOBAL_NanGuaChe_didianyuyan={
[1] = '万圣节礼车出现在迷雾镇附近',
[2] = '万圣节礼车出现在圣石镇附近',
[3] = '万圣节礼车出现在公民传送塔附近',
[4] = '万圣节礼车出现在男爵传送塔附近',
[5] = '万圣节礼车出现在高级男爵传送塔附近',
[6] = '万圣节礼车出现在国有采集区附近',
[7] = '万圣节礼车出现在接近联邦基地的主道附近',
[8] = '万圣节礼车出现在接近帝国基地的主道附近',
[9] = '万圣节礼车出现在有火鸟的地方',
[10] = '万圣节礼车出现在联邦基地的左边',
[11] = '万圣节礼车出现在联邦基地的右边',
[12] = '万圣节礼车出现在帝国基地的左边',
[13] = '万圣节礼车出现在帝国基地的右边',
[14] = '万圣节礼车出现在1号沙虫节拍器附近',
[15] = '万圣节礼车出现在4号沙虫节拍器附近',
[16] = '万圣节礼车出现在2号沙虫节拍器附近',
[17] = '万圣节礼车出现在3号沙虫节拍器附近',
}
WSJHD_BOSSdiaoluo={
	[271212]={
	--金币
			[1]={ID=80410,Num=67,Gailv=100},
			[2]={ID=80410,Num=67,Gailv=100},
			[3]={ID=80410,Num=67,Gailv=100},
			[4]={ID=80410,Num=67,Gailv=100},
			[5]={ID=80410,Num=67,Gailv=100},
			[6]={ID=80410,Num=67,Gailv=100},
			[7]={ID=80410,Num=67,Gailv=100},
			[8]={ID=80410,Num=67,Gailv=100},
			[9]={ID=80410,Num=67,Gailv=100},
			[10]={ID=80410,Num=67,Gailv=100},
			[11]={ID=80410,Num=67,Gailv=100},
			[12]={ID=80410,Num=67,Gailv=100},
			[13]={ID=80410,Num=67,Gailv=100},
			[14]={ID=80410,Num=67,Gailv=100},
			[15]={ID=80410,Num=67,Gailv=100},
			[16]={ID=80410,Num=67,Gailv=100},
			[17]={ID=80410,Num=67,Gailv=100},
			[18]={ID=80410,Num=67,Gailv=100},
			[19]={ID=80410,Num=67,Gailv=100},
			[20]={ID=80410,Num=67,Gailv=100},
			[21]={ID=80410,Num=67,Gailv=100},
			[22]={ID=80410,Num=67,Gailv=100},
			[23]={ID=80410,Num=67,Gailv=100},
			[24]={ID=80410,Num=67,Gailv=100},
			[25]={ID=80410,Num=67,Gailv=100},
			[26]={ID=80410,Num=67,Gailv=100},
			[27]={ID=80410,Num=67,Gailv=100},
			[28]={ID=80410,Num=67,Gailv=100},
			[29]={ID=80410,Num=67,Gailv=100},
			[30]={ID=80410,Num=67,Gailv=100},
			[31]={ID=80410,Num=67,Gailv=100},
			[32]={ID=80410,Num=67,Gailv=100},
			[33]={ID=80410,Num=67,Gailv=100},
			[34]={ID=80410,Num=67,Gailv=100},
			[35]={ID=80410,Num=67,Gailv=100},
			[36]={ID=80410,Num=67,Gailv=100},
			[37]={ID=80410,Num=67,Gailv=100},
			[38]={ID=80410,Num=67,Gailv=100},
			[39]={ID=80410,Num=67,Gailv=100},
			[40]={ID=80410,Num=67,Gailv=100},
			[41]={ID=80410,Num=67,Gailv=100},
			[42]={ID=80410,Num=67,Gailv=100},
			[43]={ID=80410,Num=67,Gailv=100},
			[44]={ID=80410,Num=67,Gailv=100},
			[45]={ID=80410,Num=67,Gailv=100},
			[46]={ID=80410,Num=67,Gailv=100},
			[47]={ID=80410,Num=67,Gailv=100},
			[48]={ID=80410,Num=67,Gailv=100},
			},
}
function WSJHD_TimerTriggerGCallFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local WSJHD_MapList = {9,25}
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local nShiFouStart = API_DiffDatatime(WSJHD_StartTime.Year,WSJHD_StartTime.Month,WSJHD_StartTime.Day,WSJHD_StartTime.Hour,WSJHD_StartTime.Minute,WSJHD_StartTime.Second)
	local nShiFouEnd = API_DiffDatatime(WSJHD_EndTime.Year,WSJHD_EndTime.Month,WSJHD_EndTime.Day,WSJHD_EndTime.Hour,WSJHD_EndTime.Minute,WSJHD_EndTime.Second)
	if nShiFouStart < 0 and nShiFouEnd > 0 then
		local ServerID = API_GetServerID()
		if not API_IsEctypeServer() then
			if API_GetServerID() == 1 then
				if WSJHD_CreateNpc_DiGuo == nil or API_GetMonsterID(WSJHD_CreateNpc_DiGuo) <= 0 then
					WSJHD_CreateNpc_DiGuo = API_CreateMonster(1,11682,263,92,4,0,-1)
				end
				if WSJHD_CreateNpc_LianBang == nil or API_GetMonsterID(WSJHD_CreateNpc_LianBang) <= 0 then
					WSJHD_CreateNpc_LianBang = API_CreateMonster(2,11682,225,132,4,0,-1)
				end
			end

		end
		if Hour == 19 then
			WSJHD_KaiShiBiaoZhi = 0
--			if math.mod (Minute,10) == 0 then
--				API_ActorBroadcastMsgEx(-1,-1,0,17,'万圣节活动将于19：00-22：00期间在珊瑚群岛、暗礁海！')
--				API_ActorBroadcastMsgEx(-1,-1,0,1,'万圣节活动将于19：00-22：00期间在珊瑚群岛、暗礁海！')
--				API_ActorBroadcastMsgEx(-1,-1,0,7,'万圣节活动将于19：00-22：00期间在珊瑚群岛、暗礁海！')
--			end
		end
--		if Hour > 18 and Hour < 22 then
--			if WSJHD_KaiShiBiaoZhi == nil or WSJHD_KaiShiBiaoZhi < 1 then
--				WSJHD_KaiShiBiaoZhi = 1
--				API_ActorBroadcastMsgEx(-1,-1,0,17,'万圣节活动现在开始！')
--				API_ActorBroadcastMsgEx(-1,-1,0,1,'万圣节活动现在开始！')
--				API_ActorBroadcastMsgEx(-1,-1,0,7,'万圣节活动现在开始！')
--			end
--			if Hour == 19 or Hour == 21 then
--				if math.mod (Minute,2) == 0 then
--					API_ActorBroadcastMsgEx(-1,-1,0,17,'现在去城外消灭小南瓜怪，可以获得万圣节糖果！')
--					API_ActorBroadcastMsgEx(-1,-1,0,1,'现在去城外消灭小南瓜怪，可以获得万圣节糖果！')
--					API_ActorBroadcastMsgEx(-1,-1,0,7,'现在去城外消灭小南瓜怪，可以获得万圣节糖果！')
--				end
--			elseif Hour == 20 then
--				if math.mod (Minute,2) == 0 then
--					API_ActorBroadcastMsgEx(-1,-1,0,17,'现在去主城外寻找万圣节礼车，戴着南瓜头盔的玩家可以找万圣节礼车领奖，南瓜头盔可以通过消灭小南瓜怪获得的糖果来兑换！')
--					API_ActorBroadcastMsgEx(-1,-1,0,1,'现在去主城外寻找万圣节礼车，戴着南瓜头盔的玩家可以找万圣节礼车领奖，南瓜头盔可以通过消灭小南瓜怪获得的糖果来兑换！')
--					API_ActorBroadcastMsgEx(-1,-1,0,7,'现在去主城外寻找万圣节礼车，戴着南瓜头盔的玩家可以找万圣节礼车领奖，南瓜头盔可以通过消灭小南瓜怪获得的糖果来兑换！')
--				end
--			end
--			for i,v in WSJHD_MapList do
--				local MapConfigID = API_GetRightMapID(v)
--				if API_MapIsValid(MapConfigID) then
--					local FanWeiTileXY = {X1=0,Y1=0,X2=0,Y2=0}
--					if MapConfigID == 9 then
--						FanWeiTileXY = {X1=92,Y1=311,X2=215,Y2=401}
--					elseif MapConfigID == 10 then
--						FanWeiTileXY = {X1=164,Y1=230,X2=259,Y2=324}
--					elseif MapConfigID >= 1956 and MapConfigID <= 1966 then
--						FanWeiTileXY = {X1=1,Y1=1,X2=625,Y2=624}
--					end
--					if WSJHD_NanGuaGuaiList[MapConfigID] == nil then
--						WSJHD_NanGuaGuaiList[MapConfigID] = {}
--					end
--					for j = 1,200 do
--						local FastID = WSJHD_NanGuaGuaiList[MapConfigID][j]
--						if FastID == nil or API_GetMonsterID(FastID) <= 0 then
--						local Width,Height = PublicFun_GetMapWidthHeight(MapConfigID)
--						local TileX = 0
--						local TileY = 0
--						local Num = 0
--						repeat
--							Num = Num + 1
--							TileX = math.random(Width)
--							TileY = math.random(Height)
--							until not API_IsBlockTile(MapConfigID,TileX,TileY,0) or Num == 100							
--							if not API_IsBlockTile(MapConfigID,TileX,TileY,0) then
--								local FastID = API_CreateMonster(MapConfigID,NanGuaGuaiID,TileX,TileY,4,0,-1)
--								WSJHD_NanGuaGuaiList[MapConfigID][j] = FastID
--							end
--						end					
--					end
--				end
--			end
--		elseif Hour >= 22 then
--			if WSJHD_KaiShiBiaoZhi == nil or WSJHD_KaiShiBiaoZhi < 4 then
--				WSJHD_KaiShiBiaoZhi = 4
--				API_ActorBroadcastMsgEx(-1,-1,0,17,'今天的万圣节活动已经结束')
--				API_ActorBroadcastMsgEx(-1,-1,0,1,'今天的万圣节活动已经结束')
--				API_ActorBroadcastMsgEx(-1,-1,0,7,'今天的万圣节活动已经结束')
--			end
--			for i in WSJHD_NanGuaGuaiList do
--				local MapID = i
--				if API_MapIsValid(MapID) and type(WSJHD_NanGuaGuaiList[MapID]) == 'table' then
--					for j = 1,200 do
--						local FastID = WSJHD_NanGuaGuaiList[MapID][j]
--						if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
--							API_DestroyMonster(FastID)
--							WSJHD_NanGuaGuaiList[MapID][j] = nil
--						end
--					end
--				end
--			end
--		end
		if Hour > 19 and Hour < 21 then
			if WSJHD_KaiShiBiaoZhi == nil or WSJHD_KaiShiBiaoZhi < 2 then
				WSJHD_KaiShiBiaoZhi = 2
				API_ActorBroadcastMsgEx(-1,-1,0,17,'万圣节礼车已经出现在暗礁海与麦穗平原！丰厚礼品等你来拿！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'万圣节礼车已经出现在暗礁海与麦穗平原！丰厚礼品等你来拿！')
				API_ActorBroadcastMsgEx(-1,-1,0,7,'万圣节礼车已经出现在暗礁海与麦穗平原！丰厚礼品等你来拿！')
			end
			for j,i in WSJHD_MapList do
				local MapID = i
				if API_MapIsValid(MapID) then
					local MapConfigID = API_GetMapConfigID(MapID)
					if GLOBAL_NanGuaChe_Route[MapConfigID] ~= nil then
						if WSJHD_NanGuaCheList[MapID] == nil then
							WSJHD_NanGuaCheList[MapID] = {}
						end
						for j in GLOBAL_NanGuaChe_Route[MapConfigID] do
							if WSJHD_NanGuaCheList[MapID][j] == nil then
								WSJHD_NanGuaCheList[MapID][j] = {}
							end
							local NanGuaCheFastID = WSJHD_NanGuaCheList[MapID][j].NanGuaCheFastID
							if NanGuaCheFastID == nil or API_GetMonsterID(NanGuaCheFastID) <= 0 then
								local TileX = GLOBAL_NanGuaChe_Route[MapConfigID][j].StartTile.TileX
								local TileY = GLOBAL_NanGuaChe_Route[MapConfigID][j].StartTile.TileY
								local RouteNum = GLOBAL_NanGuaChe_Route[MapConfigID][j].RouteNum
								local Route = GLOBAL_NanGuaChe_Route[MapConfigID][j].Route
								NanGuaCheFastID = API_CreateMonsterEx(MapID,NanGuaCheID,TileX,TileY,5,0,-1,1)
								GLOBAL_NanGuaChe_JiangLiZhongLiang[NanGuaCheFastID] = 1000
								local NanGuaBossAFastID = API_CreateMonster(MapID,NanGuaBossID,TileX,TileY,5,0,-1)
								local NanGuaBossBFastID = API_CreateMonster(MapID,NanGuaBossID,TileX,TileY,5,0,-1)
								WSJHD_NanGuaCheList[MapID][j].NanGuaCheFastID = NanGuaCheFastID
								WSJHD_NanGuaCheList[MapID][j].NanGuaBossAFastID = NanGuaBossAFastID
								WSJHD_NanGuaCheList[MapID][j].NanGuaBossBFastID = NanGuaBossBFastID
								API_SetMonsterChief(NanGuaBossAFastID,NanGuaCheFastID)
								API_SetMonsterChief(NanGuaBossBFastID,NanGuaCheFastID)
								API_CreateDieTriggerG(0,0,0,NanGuaBossAFastID,'WSJHD_BossA_DieTriggerGCallFunc')
								API_CreateDieTriggerG(0,0,0,NanGuaBossBFastID,'WSJHD_BossA_DieTriggerGCallFunc')
								API_MonsterMoveTo(NanGuaCheFastID,RouteNum,Route) 
							else
								local TileX,TileY = PublicFun_GetMonsterPosXY(NanGuaCheFastID)
								local NanGuaBossAFastID = WSJHD_NanGuaCheList[MapID][j].NanGuaBossAFastID
								local NanGuaBossBFastID = WSJHD_NanGuaCheList[MapID][j].NanGuaBossBFastID
								if NanGuaBossAFastID == nil or API_GetMonsterID(NanGuaBossAFastID) <= 0 then
									NanGuaBossAFastID = API_CreateMonster(MapID,NanGuaBossID,TileX,TileY,5,0,-1)
									WSJHD_NanGuaCheList[MapID][j].NanGuaBossAFastID = NanGuaBossAFastID
									API_SetMonsterChief(NanGuaBossAFastID,NanGuaCheFastID)
									API_CreateDieTriggerG(0,0,0,NanGuaBossAFastID,'WSJHD_BossA_DieTriggerGCallFunc')
								end
								if NanGuaBossBFastID == nil or API_GetMonsterID(NanGuaBossBFastID) <= 0 then
									NanGuaBossBFastID = API_CreateMonster(MapID,NanGuaBossID,TileX,TileY,5,0,-1)
									WSJHD_NanGuaCheList[MapID][j].NanGuaBossBFastID = NanGuaBossBFastID
									API_SetMonsterChief(NanGuaBossBFastID,NanGuaCheFastID)
									API_CreateDieTriggerG(0,0,0,NanGuaBossBFastID,'WSJHD_BossA_DieTriggerGCallFunc')
								end
							end
							local AreaCreatureTriggerGID = WSJHD_NanGuaCheList[MapID][j].AreaCreatureTriggerGID
							if AreaCreatureTriggerGID == nil then
								local TileX = GLOBAL_NanGuaChe_Route[MapConfigID][j].StartTile.TileX
								local TileY = GLOBAL_NanGuaChe_Route[MapConfigID][j].StartTile.TileY
								local RightMapID = API_GetRightMapID(MapID)
								AreaCreatureTriggerGID = API_CreateAreaCreatureTriggerG(RightMapID,j,RightMapID,TileX,TileY,6,'WSJHD_AreaCreatureCallFuncName')
								WSJHD_NanGuaCheList[MapID][j].AreaCreatureTriggerGID = AreaCreatureTriggerGID
							end
						end
					end
				end
			end
			for i in WSJHD_MapList do
				local MapID = i
				local MapConfigID = API_GetMapConfigID(MapID)
					if GLOBAL_NanGuaChe_didianbaogao[MapConfigID] ~= nil then
						for j in GLOBAL_NanGuaChe_didianbaogao[MapConfigID] do
						if WSJHD_NanGuaCheList[MapID][j] == nil then
							WSJHD_NanGuaCheList[MapID][j] = {}
						end
						if WSJHD_NanGuaCheList[MapID][j].didianbaogao == nil then
							local x = GLOBAL_NanGuaChe_didianbaogao[MapConfigID][j].x
							local y = GLOBAL_NanGuaChe_didianbaogao[MapConfigID][j].y
							local yuyan = GLOBAL_NanGuaChe_didianbaogao[MapConfigID][j].yuyan
							local didianbaogao = API_CreateAreaCreatureTriggerG(a,yuyan,MapID,x,y,6,'WSJHD_didianbaogao')
							WSJHD_NanGuaCheList[MapID][j].didianbaogao = didianbaogao 
						end
					end
				end	
			end
		elseif Hour >= 21 then
			if WSJHD_KaiShiBiaoZhi == nil or WSJHD_KaiShiBiaoZhi < 3 then
				WSJHD_KaiShiBiaoZhi = 3
				API_ActorBroadcastMsgEx(-1,-1,0,17,'万圣节礼车已经离开！')
				API_ActorBroadcastMsgEx(-1,-1,0,1,'万圣节礼车已经离开！')
				API_ActorBroadcastMsgEx(-1,-1,0,7,'万圣节礼车已经离开！')
			end
			for i in WSJHD_NanGuaCheList do
				local MapID = i
				if API_MapIsValid(MapID) then
--					if WSJHD_NanGuaCheList[MapID] == nil then
--						WSJHD_NanGuaCheList[MapID] = {}
--					end
					for j in WSJHD_NanGuaCheList[MapID] do
						if type(WSJHD_NanGuaCheList[MapID][j]) == 'table' then
							local NanGuaCheFastID = WSJHD_NanGuaCheList[MapID][j].NanGuaCheFastID
							local NanGuaBossAFastID = WSJHD_NanGuaCheList[MapID][j].NanGuaBossAFastID
							local NanGuaBossBFastID = WSJHD_NanGuaCheList[MapID][j].NanGuaBossBFastID
							if NanGuaCheFastID ~= nil and API_GetMonsterID(NanGuaCheFastID) > 0 then
								API_DestroyMonster(NanGuaCheFastID)
							end
							local AreaCreatureTriggerGID = WSJHD_NanGuaCheList[MapID][j].AreaCreatureTriggerGID
							if AreaCreatureTriggerGID ~= nil then
								API_DestroyTriggerG(AreaCreatureTriggerGID)
							end
							local didianbaogao = WSJHD_NanGuaCheList[MapID][j].didianbaogao
							if didianbaogao ~= nil then
								API_DestroyTriggerG(didianbaogao)
							end
						end
						WSJHD_NanGuaCheList[MapID][j] = nil
					end
				end
			end
		end
	elseif nShiFouEnd < 0 then
		API_DestroyTriggerG(TriggerID)
		if WSJHD_TimerTriggerID ~= nil then
			API_DestroyTriggerG(TriggerID)
			WSJHD_TimerTriggerID = nil
		end
		if WSJHD_CreateNpc_DiGuo ~= nil and API_GetMonsterID(WSJHD_CreateNpc_DiGuo) > 0 then
			API_DestroyMonster(WSJHD_CreateNpc_DiGuo)
			WSJHD_CreateNpc_DiGuo = nil
		end
		if WSJHD_CreateNpc_LianBang ~= nil and API_GetMonsterID(WSJHD_CreateNpc_LianBang) > 0 then
			API_DestroyMonster(WSJHD_CreateNpc_LianBang)
			WSJHD_CreateNpc_LianBang = nil
		end
	end	
end

function WSJHD_AreaCreatureCallFuncName(MapID,Nob,CreatureType,CreatureID)
	if CreatureType == 0 then
		if WSJHD_NanGuaCheList[MapID] ~= nil and WSJHD_NanGuaCheList[MapID][Nob] ~= nil and WSJHD_NanGuaCheList[MapID][Nob].NanGuaCheFastID ~= nil and WSJHD_NanGuaCheList[MapID][Nob].NanGuaCheFastID == CreatureID then
			local MapConfigID = API_GetMapConfigID(MapID)
			if GLOBAL_NanGuaChe_Route[MapConfigID] ~= nil and GLOBAL_NanGuaChe_Route[MapConfigID][Nob] then
				local RouteNum = GLOBAL_NanGuaChe_Route[MapConfigID][Nob].RouteNum
				local Route = GLOBAL_NanGuaChe_Route[MapConfigID][Nob].Route
				API_MonsterMoveTo(CreatureID,RouteNum,Route) 
			end
		end
	end
end

function WSJHD_didianbaogao(a,yuyan,CreatureType,CreatureID)
	if CreatureType == 0 then
		local guaiwuID = API_GetMonsterID(CreatureID)
		if guaiwuID == 11691 then
			if yuyan > 0 and yuyan < 18 then
				local shijiyuyan = GLOBAL_NanGuaChe_didianyuyan[yuyan]
				if shijiyuyan ~= nil then
					local MAPID = API_GetMonsterMap(CreatureID)
					API_ActorBroadcastMsgEx(MAPID,-1,0,1,shijiyuyan)
					API_ActorBroadcastMsgEx(MAPID,-1,0,17,shijiyuyan)
					API_ActorBroadcastMsgEx(MAPID,-1,0,7,shijiyuyan)
				end
			end
		end
	end
end
function WSJHD_BossA_DieTriggerGCallFunc(a,b,Type,FastID,KillerType,KillerID,MonsterID,DynamicMapID,PosX,PosY)
	local TriggerID = API_GetCurTriggerID()
	if KillerType == 1 then
		if WSJHD_BOSSdiaoluo[MonsterID] ~= nil then
			for i = 1,table.getn(WSJHD_BOSSdiaoluo[MonsterID]) do
				if math.random(100) <= WSJHD_BOSSdiaoluo[MonsterID][i].Gailv then
					if API_CreateDropGoods(DynamicMapID,PosX,PosY,WSJHD_BOSSdiaoluo[MonsterID][i].ID,WSJHD_BOSSdiaoluo[MonsterID][i].Num,0,'万圣节BOSS活动',4,0,300,0) == true then
					end
				end
			end
		end	
	end
	API_DestroyTriggerG(TriggerID)
end

local LiCheGoodsTable = {
						{GoodsID=80498,GoodsNum=100,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80696,GoodsNum=100,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80191,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80196,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=26,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80381,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80383,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80192,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=250,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80197,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80382,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80384,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80065,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80066,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80067,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80049,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80050,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80051,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=89186,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80697,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80235,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80282,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80277,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=209,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=208,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=211,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=501,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80832,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80833,GoodsNum=10,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80234,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80550,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80552,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80555,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80551,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80554,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80624,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80625,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80626,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80628,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80629,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40003,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40013,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40023,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40033,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40043,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40053,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40063,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40073,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40083,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40093,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40103,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40113,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40123,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40133,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40204,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40220,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40236,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40252,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=40268,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=845,GoodsNum=5,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=75,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=11609,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80274,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80397,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=82032,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=80621,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=88991,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=31101,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=9507,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=82034,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
						{GoodsID=89118,GoodsNum=1,Flag=0,GaiLv=1000000,PinZhi=0},
					}

local CDGoodsID = {75,11609,80274,80397,82032,80621,88991,31101,9507,82034,89118,} 
					
function fhjhd_dianjinanguache(ActorID,NPCID)
	local FastID = API_VarDataGetNumber(ActorID,0,32712)
	local ZhongLiang = GLOBAL_NanGuaChe_JiangLiZhongLiang[FastID]
	if ZhongLiang ~= nil and ZhongLiang > 0 then
		if API_ActorHaveEquip(ActorID,10984) or API_ActorHaveEquip(ActorID,10985) then
			local shangcilingqushijian = API_VarDataGetNumber(ActorID,1,7568)
			local thetime = os.time()
			local TimePast = os.difftime(thetime,shangcilingqushijian)
			if TimePast >= 60 then						
				local Num = math.random(table.getn(LiCheGoodsTable))
				local GoodsID = LiCheGoodsTable[Num].GoodsID
				local GoodsNum = LiCheGoodsTable[Num].GoodsNum
				local Flag = LiCheGoodsTable[Num].Flag
				for j,v in CDGoodsID do
					if GoodsID == v then
						local NowTime = os.time()
						if NowTime < API_VarDataGetNumber_Ex(1,0,-6022,1,7) then
							GoodsID = 829
						end
					end
				end
				
				if API_ActorCanAddGoods(ActorID,GoodsID,GoodsNum,3,0) ~= -1 then
					if API_ActorGetGoodsNum(ActorID,89193) > 9 and API_ActorRemoveGoods(ActorID,89193,10,'扣除灵魂珠') then--销毁玩家身上的物品
						ZhongLiang = ZhongLiang - 1
						GLOBAL_NanGuaChe_JiangLiZhongLiang[FastID] = ZhongLiang
						for j,v in CDGoodsID do
							if GoodsID == v then
								local Time = os.time() 
								local Tsec = math.random(30,60)
								local NextTime = Time + Tsec
								API_VarDataSetNumber_Ex_Sync(1,0,-6022,1,7,NextTime)
							end
						end
						
--						API_AddActorGoods(ActorID,829,1,'万圣节礼车领奖')
						API_AddActorGoodsFlag(ActorID,GoodsID,GoodsNum,3,'万圣节礼车领奖')
						API_VarDataSetNumber(ActorID,1,7568,thetime)
						API_ResponseWrite('<text>来吧，我可爱的鬼怪战士，这是你应得的</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'" ><br>')
						API_ResponseWrite('<a>离开</a><br>')
					else
						API_ResponseWrite('<text>抱歉您身上的灵魂珠数量不足，兑换奖励需要消耗10个灵魂珠。</text><br>')
						API_ResponseWrite('<text>参与鬼怪盛宴活动，击杀活动怪物可以获得灵魂珠。</text><br>')
						API_ResponseWrite('<a>离开</a><br>')
					end
				else
					API_ResponseWrite('<text>你身上的背包太满了，无法再装下我送你的'..API_GetGoodsName(GoodsID)..'，请清理下背包后再来吧。</text><br>')
					API_ResponseWrite('<a>离开</a><br>')
				end
			else
				local deengdaishijian = 60 - TimePast
				API_ResponseWrite('<text>你已经领取过奖品了，60秒内只能领取1次奖品，请稍等 '..deengdaishijian..'秒 再来领奖。</text><br>')
				API_ResponseWrite('<a>离开</a><br>')
			end
		else
			API_ResponseWrite('<text>什么？你不是鬼怪人！抱歉，我才没闲工夫理会你呢！</text><br>')
			API_ResponseWrite('<text>找“万圣节节日官”，然后用手里的“灵魂珠”换取“万圣节头饰”，最后把自己装扮成“怪鬼战士”即可获得礼品。</text><br>')
			API_ResponseWrite('<a>离开</a><br>')
		end
	else
		API_ResponseWrite('<text>本礼车的礼物已经派发完了</text><br>')
		API_ResponseWrite('<text>请去找其他礼车去索取礼品吧</text><br>')
		API_ResponseWrite('<a>离开</a><br>')
	end
end
fhjhd_bianshentangguobufftable = {
[1] = {2006001,2006002,2006003,2006004,2006005,2006006,2006007,2006008,2006009,2006009,2006010,2006017,2006018,2006019,2006020,2006021,2006022,2006023,2006024,2006025,2006026,2006027,2006028,2006029,2006030,2006031,2006032,2006033,2006034,},
[2] = {2006011,2006012,2006013,2006014,},
[3] = {2006016,2006015,2006035,2006036,2006037,},
}
function fhjhd_bianshentangguo(ActorID,GoodsID,Location,ObjectX,ObjectY,Remove)--变身糖
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	if GoodsID ~= 828 and GoodsID ~= 845 then
	   return 0 
	end	
	local BadTime = API_VarDataGetNumber(ActorID,1,12654)
	if BadTime > 0 then
		API_ActorSendMsg(ActorID,3,'正在睡觉中……')
		return 0
	end
	local RandNum = math.random(10000)
	local ZhangTai = 1
	if RandNum > 9900 then
		ZhangTai = 3
	elseif RandNum > 6900 then
		ZhangTai = 2
	end
	local bianshenbuff = fhjhd_bianshentangguobufftable[ZhangTai][math.random(table.getn(fhjhd_bianshentangguobufftable[ZhangTai]))]
	if API_ActorRemoveGoods(ActorID,GoodsID,1,'使用变身糖果') then
		API_ActorAddStatus(ActorID,bianshenbuff,300000)
		return 1
	end
end
local ExpTable = {
[1] = 0,
[2] = 0,
[3] = 0,
[4] = 0,
[5] = 0,
[6] = 0,
[7] = 0,
[8] = 0,
[9] = 0,
[10] = 1920,
[11] = 2400,
[12] = 2720,
[13] = 3040,
[14] = 3360,
[15] = 3680,
[16] = 4000,
[17] = 4320,
[18] = 4640,
[19] = 4960,
[20] = 5280,
[21] = 6240,
[22] = 6720,
[23] = 7200,
[24] = 7680,
[25] = 8160,
[26] = 14400,
[27] = 15360,
[28] = 16320,
[29] = 17280,
[30] = 18240,
[31] = 19200,
[32] = 20160,
[33] = 21120,
[34] = 22080,
[35] = 23040,
[36] = 25920,
[37] = 27120,
[38] = 28320,
[39] = 29520,
[40] = 30720,
[41] = 34320,
[42] = 35760,
[43] = 37200,
[44] = 38640,
[45] = 40080,
[46] = 41520,
[47] = 42960,
[48] = 44400,
[49] = 45840,
[50] = 47280,
[51] = 47280,
[52] = 47280,
[53] = 47280,
[54] = 47280,
[55] = 47280,
[56] = 50680,
[57] = 52220,
[58] = 53760,
[59] = 55290,
[60] = 56830,
[61] = 58360,
[62] = 59900,
[63] = 61440,
[64] = 62970,
[65] = 64510,
}

 --上线判断
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'LC_WanShengJie_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'LC_WanShengJie_OnLogin') 
end

local WanShenJietubiaoid = 104127
local WanShenJie_juanzhouid = 90008
 
--上线回调
function LC_WanShengJie_OnLogin() 
	local ActorID = API_RequestGetActorID()
	local StartTimeTable = WSJHD_StartTime
	local EndTimeTable = WSJHD_EndTime
	local nShiFouStart = API_DiffDatatime(StartTimeTable.Year,StartTimeTable.Month,StartTimeTable.Day,StartTimeTable.Hour,StartTimeTable.Minute,StartTimeTable.Second)--获取某个时间跟当前时间相差的秒数
	local nShiFouEnd = API_DiffDatatime(EndTimeTable.Year,EndTimeTable.Month,EndTimeTable.Day,EndTimeTable.Hour,EndTimeTable.Minute,EndTimeTable.Second)
	local ActorLevel = API_GetActorExpLevel(ActorID)
	if ActorLevel < 10 then
		return
	end	
	if nShiFouStart <= 0 and nShiFouEnd > 0 then
		API_RemoveTaskScroll(ActorID,WanShenJie_juanzhouid)
		LRY_UItwinkemanage(ActorID,10,85,WanShenJietubiaoid,WanShenJie_juanzhouid,20,'fhjhd_huodongnpc')--加载图标
	end
end

function fhjhd_huodongnpc(ActorID,NPCID)
	if ActorID == nil then
		ActorID = API_RequestGetActorID()
	end
	local SelectItem = API_RequestGetNumber(1)
	local beibaokongjian = API_ActorGetPackageSize(ActorID)	
	local tangguoID = 828 
	local wanjiaduihuanquanshuliang = API_ActorGetGoodsNum(ActorID,tangguoID) --玩家兑换券数
	if SelectItem == 0 or SelectItem == 90008 then
		API_ResponseWrite('<name>万圣节</name>')
		API_ResponseWrite('<text>万圣节快乐，我的勇士！吃一颗“万圣节糖果”，把自己装扮起来和我们一起庆祝怎么样！</text><br>')
		API_ResponseWrite('<text>近日在每天的12：00-22：00在麦穗平原、珊瑚群岛、娜沙湿地（联邦）阳光雨林、暗礁海、落日农庄（帝国）在村庄外出现一批专抢“万圣节糖果”的怪物，据说这些怪物是从周围钻出来；为了确保在节日中糖果供应正常。勇士们去消灭它，它们身上帶著价值不菲的物品!!!</text><br>')
		API_ResponseWrite('<text>只要你有88颗“万圣节糖果”，就可以到我这里换取“南瓜头盔”。把“南瓜头盔”装备到头上就可以去“万圣节礼车”那里领取礼物了。</text><br>')
		API_ResponseWrite('<a href="fhjhd_huodongnpc?1=2">我要兑换“南瓜头盔”</a><br>')
		API_ResponseWrite('<a href="fhjhd_huodongnpc?1=4">我要使用南瓜徽章与南瓜魔棒兑换“经验”</a><br>')
		API_ResponseWrite('<a href="fhjhd_huodongnpc?1=3">我要了解“万圣节礼车”</a><br>')
		API_ResponseWrite('<a href="fhjhd_huodongnpc?1=5">我要了解“鬼怪大作战”</a><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
		API_ResponseFlush(ActorID)
		return 1
	elseif SelectItem == 2 then
		API_ResponseWrite('<text>兑换万圣节“南瓜头盔”需要消耗88个糖果。</text><br>')
		API_ResponseWrite('<br><a href="fhjhd_huodongnpc?1=6">兑换</a><br>')
		API_ResponseWrite('<br><a href="fhjhd_huodongnpc?1=0">返回</a><br>')
		API_ResponseFlush(ActorID)
		return 1
	elseif SelectItem == 3 then
		API_ResponseWrite('<text>在10月25日和11月1日的晚上20点-21点，神秘的“万圣节礼车”将在暗礁海、麦穗平原现身。只要用“南瓜头盔”把自己化装成南瓜人，再与“万圣节礼车”对话即可获得'..API_GetGoodsName(829)..'。而且直到“万圣节礼车”离开之前，每隔60秒您就可以领取1次。想要礼物就快去兑换一顶“南瓜头盔”吧。</text><br>')
--		API_ResponseWrite('<a href="fhjhd_huodongnpc?1=2">我要兑换“南瓜头盔”</a><br>')
		API_ResponseWrite('<br><a href="fhjhd_huodongnpc?1=0">返回</a><br>')
		API_ResponseFlush(ActorID)
		return 1
	elseif SelectItem == 4 then
		API_ResponseWrite('<text>消耗10个南瓜徽章和1个南瓜魔棒兑换经验。</text><br>')
		API_ResponseWrite('<br><a href="fhjhd_huodongnpc?1=7">兑换</a><br>')
		API_ResponseWrite('<br><a href="fhjhd_huodongnpc?1=0">返回</a><br>')
		API_ResponseFlush(ActorID)
		return 1
	elseif SelectItem == 5 then
		API_ResponseWrite('<text>10月25日-11月1日，珊瑚群岛、娜沙湿地（联邦）阳光雨林、落日农庄（帝国）都会出现一批怪物和墓碑，10级以上的勇士们必须去消灭他们，才能得到南瓜袋，南瓜徽章，南瓜魔棒，万圣节糖果！</text><br>')
		API_ResponseWrite('<text>12：00-22：00上述地图会出现万圣骷髅怪，万圣杰森怪和墓碑，击败他们可以获得南瓜徽章和南瓜袋还有万圣节糖果。</text><br>')
		API_ResponseWrite('<br><br><text>13:30-22:00 可恶的骷髅间谍钻地出来，希望你给糖他吃。作为报答，他将会把你带到可怕阴森的鬼怪隧道。那里有突击骷髅和杰森伯爵。击败他们能得到南瓜徽章，南瓜袋，南瓜魔棒，万圣节糖果，南瓜头盔还有各类时装！</text><br>')
		API_ResponseWrite('<text>南瓜徽章可以凑齐10个使用得到强力状态，还能凑齐10个南瓜徽章和一个南瓜魔棒到我这兑换经验哦。至于南瓜袋嘛，则能开出死神背饰和时装等价值不菲的物品！</text><br>')
		API_ResponseWrite('<br><a href="fhjhd_huodongnpc?1=0">返回</a><br>')
		API_ResponseFlush(ActorID)
		return 1
	elseif SelectItem == 6 then
		if wanjiaduihuanquanshuliang >= 88 then
			if beibaokongjian > 0 then
				if API_ActorRemoveGoods(ActorID,828,88,'使用万圣节糖果') then
					if API_AddActorGoods(ActorID,10981,1,'兑换南瓜头盔') then
						API_ResponseWrite('<text>您使用“万圣节糖果”88颗兑换“南瓜头盔”1顶。</text><br>')
						API_ResponseWrite('<a>离开</a><br>')
					end
				end
			else
				API_ResponseWrite('<text>您的背包已满，请至少保留一个空位再来兑换“南瓜头盔”。</text><br>')
				API_ResponseWrite('<a>离开</a><br>')
			end
		else
			API_ResponseWrite('<text>很抱歉，您的万圣节糖果不足，不能进行兑换。</text><br>')
			API_ResponseWrite('<a>离开</a><br>')
		end
		API_ResponseFlush(ActorID)
		return 1
	elseif SelectItem == 7 then
		local ExploitL = API_GetActorExpLevel(ActorID)
		local expMax = API_GetExploitInfo(ExploitL,3)
		local Exp = API_GetActorCurExp(ActorID)
		local Lv = API_GetActorExpLevel(ActorID)
		local AddExp = ExpTable[Lv]
		if Lv < 10 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<text>10级以上的玩家才能进行兑换，您当前的等级小于10级。</text><br>')
			API_ResponseWrite('<a>关闭</a>')
			API_ResponseFlush(ActorID)
			return
		end
		if Exp == expMax then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<text>您当前的经验值已经达到上限，请提升角色等级或者技能等级后再兑换。</text><br>')
			API_ResponseWrite('<a>关闭</a>')
			API_ResponseFlush(ActorID)
			return
		end
		if API_ActorGetGoodsNum(ActorID,88979) < 10 then
			API_ActorSendMsg(ActorID,3,'缺少南瓜徽章')
			return
		end
		if API_ActorGetGoodsNum(ActorID,82018) < 1 then
			API_ActorSendMsg(ActorID,3,'缺少南瓜魔棒')
			return
		end
		if API_ActorGetGoodsNum(ActorID,88979) > 0 and API_ActorRemoveGoods(ActorID,88979,10,'消耗南瓜徽章') 
		and API_ActorGetGoodsNum(ActorID,82018) > 0 and API_ActorRemoveGoods(ActorID,82018,1,'消耗南瓜魔棒') then--销毁玩家身上的物品
			API_ActorAddExp(ActorID,AddExp,0,'使用南瓜徽章加南瓜魔棒兑换经验')
			API_ResponseWrite('<text>消耗10个南瓜徽章和1个南瓜魔棒，兑换'..AddExp..'经验。</text><br>')
			API_ResponseWrite('<a>离开</a><br>')
		end
		API_ResponseFlush(ActorID)
		return 1
	end
end