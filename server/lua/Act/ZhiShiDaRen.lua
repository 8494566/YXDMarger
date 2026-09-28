----------------------------------------------------------------------------------------------------------------------
--文件名:	Scp\LUA\Other\ZhiShiDaRen.lua
--版  权:	(C)  深圳网域计算机网络有限公司
--创建人:	吴斌
--日  期:	2009-7-19
--版  本:	1.0
--描  述:	知识达人活动
--应  用:  
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--作者：吴斌
--日期：2009-7-22
--功能：创建19201-19300
--使用交互数据：
--全局变量：-5001，存储获得复赛资格人数
--19201 -存储活动报名标志
--19202-存储活动服务器时间
--19203-存储玩家初赛答对题目个数
--19204-存储玩家知识达人活动中累积积分
--19205-存储活动初始的NPC序列
--19206-存储玩家当前回答问题时的题目类型
--19207-存储玩家进入复赛的标志
--19208-存储玩家当前随机获得题目
--19209-存储玩家复赛答对题目数量
--19210-存储玩家复赛已经回答数目
--19211--存储玩家复赛中随即到的题目
--19215-存储玩家初赛服务器时间
--19213存储玩家复赛服务器时间
--19214存储玩家复赛资格人数
---------------------------------------------------------------------
local _require = require
local require = function(path)
	_LOADED[path] = nil
	_require(path)
end
ZhiShiDaRen_QuestionList = {}
ZhiShiDaRen_AnswerList = {}
ZhiShiDaRen_TrueAnswerList = {}
ZhiShiDaRen_FuSaiRenShu	= 0
require 'Scp\\LUA\\Act\\ZhiShiDaRen_QuestionList.lua'
require 'Scp\\LUA\\Act\\ZhiShiDaRen_AnswerList.lua'
require 'Scp\\LUA\\Act\\ZhiShiDaRen_TrueAnswerList.lua'
--奖励表，需要填物品ID ★★★
if ZhiShiDaRen_AnswerJiangLiTable == nil then
	ZhiShiDaRen_AnswerJiangLiTable = {
			--1-10级
			[1]={
				[2]={
						[1]={   {GoodsID=80049,GaiLv1=1,GaiLv2=312500,NumGaiLv=6530,NumMax=33,NumMin=32},
								{GoodsID=80065,GaiLv1=312501,GaiLv2=625001,NumGaiLv=6530,NumMax=33,NumMin=32},
								{GoodsID=80065,GaiLv1=625002,GaiLv2=937502,NumGaiLv=1000,NumMax=1,NumMin=0},
								{GoodsID=80397,GaiLv1=937503,GaiLv2=1250003,NumGaiLv=4081,NumMax=21,NumMin=20},
								{GoodsID=80383,GaiLv1=1250004,GaiLv2=1562504,NumGaiLv=4081,NumMax=21,NumMin=20},
								{GoodsID=80181,GaiLv1=1562505,GaiLv2=1875005,NumGaiLv=4081,NumMax=21,NumMin=20},
								{GoodsID=80191,GaiLv1=1875006,GaiLv2=2187506,NumGaiLv=4081,NumMax=21,NumMin=20},
								{GoodsID=784,  GaiLv1=2187507,GaiLv2=2500007,NumGaiLv=4489,NumMax=3,NumMin=2},
								{GoodsID=501,  GaiLv1=2500008,GaiLv2=2812508,NumGaiLv=1632,NumMax=9,NumMin=8},
								{GoodsID=80274,GaiLv1=2812509,GaiLv2=3125009,NumGaiLv=2448,NumMax=13,NumMin=12},
								{GoodsID=40002,GaiLv1=3125010,GaiLv2=3437510,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40012,GaiLv1=3437511,GaiLv2=3750011,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40022,GaiLv1=3750012,GaiLv2=4062512,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40032,GaiLv1=4062513,GaiLv2=4375013,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40042,GaiLv1=4375014,GaiLv2=4687514,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40052,GaiLv1=4687515,GaiLv2=5000015,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40062,GaiLv1=5000016,GaiLv2=5312516,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40072,GaiLv1=5312517,GaiLv2=5625017,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40082,GaiLv1=5625018,GaiLv2=5937518,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40092,GaiLv1=5937519,GaiLv2=6250019,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40112,GaiLv1=6250020,GaiLv2=6562520,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40003,GaiLv1=6562521,GaiLv2=6875021,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40013,GaiLv1=6875022,GaiLv2=7187522,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40023,GaiLv1=7187523,GaiLv2=7500023,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40033,GaiLv1=7500024,GaiLv2=7812524,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40043,GaiLv1=7812525,GaiLv2=8125025,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40053,GaiLv1=8125026,GaiLv2=8437526,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40063,GaiLv1=8437527,GaiLv2=8750027,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40073,GaiLv1=8750028,GaiLv2=9062528,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40083,GaiLv1=9062529,GaiLv2=9375029,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40093,GaiLv1=9375030,GaiLv2=9687530,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40113,GaiLv1=9687531,GaiLv2=10000000,NumGaiLv=5306,NumMax=7,NumMin=6},
							},
						[2]={   {GoodsID=80065,GaiLv1=1,GaiLv2=5000001,NumGaiLv=7750,NumMax=39,NumMin=38},
								{GoodsID=80065,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=2500,NumMax=1,NumMin=0},
							},
						[3]={   {GoodsID=80065,GaiLv1=1,GaiLv2=10000000,NumGaiLv=9375,NumMax=25,NumMin=24},
							},
					}, 
				[3]={
						[1]={   {GoodsID=80065,GaiLv1=1,GaiLv2=5000001,NumGaiLv=204,NumMax=2,NumMin=1},
								{GoodsID=80065,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=250,NumMax=1,NumMin=0},

							},
						[2]={   {GoodsID=80065,GaiLv1=1,GaiLv2=5000001,NumGaiLv=5000,NumMax=4,NumMin=3},
								{GoodsID=80065,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=500,NumMax=1,NumMin=0},

							},
						[3]={   {GoodsID=80049,GaiLv1=1,GaiLv2=322580,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80065,GaiLv1=322581,GaiLv2=645161,NumGaiLv=9544,NumMax=4,NumMin=3},
								{GoodsID=80397,GaiLv1=645162,GaiLv2=967742,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80383,GaiLv1=967743,GaiLv2=1290323,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80181,GaiLv1=1290324,GaiLv2=1612904,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80191,GaiLv1=1612905,GaiLv2=1935485,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=784,GaiLv1=1935486,GaiLv2=2258066,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=501,GaiLv1=2258067,GaiLv2=2580647,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80274,GaiLv1=2580648,GaiLv2=2903228,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=40002,GaiLv1=2903229,GaiLv2=3225809,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40012,GaiLv1=3225810,GaiLv2=3548390,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40022,GaiLv1=3548391,GaiLv2=3870971,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40032,GaiLv1=3870972,GaiLv2=4193552,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40042,GaiLv1=4193553,GaiLv2=4516133,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40052,GaiLv1=4516134,GaiLv2=4838714,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40062,GaiLv1=4838715,GaiLv2=5161295,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40072,GaiLv1=5161296,GaiLv2=5483876,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40082,GaiLv1=5483877,GaiLv2=5806457,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40092,GaiLv1=5806458,GaiLv2=6129038,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40112,GaiLv1=6129039,GaiLv2=6451619,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40003,GaiLv1=6451620,GaiLv2=6774200,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40013,GaiLv1=6774201,GaiLv2=7096781,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40023,GaiLv1=7096782,GaiLv2=7419362,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40033,GaiLv1=7419363,GaiLv2=7741943,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40043,GaiLv1=7741944,GaiLv2=8064524,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40053,GaiLv1=8064525,GaiLv2=8387105,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40063,GaiLv1=8387106,GaiLv2=8709686,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40073,GaiLv1=8709687,GaiLv2=9032267,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40083,GaiLv1=9032268,GaiLv2=9354848,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40093,GaiLv1=9354849,GaiLv2=9677429,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40113,GaiLv1=9677430,GaiLv2=10000000,NumGaiLv=9871,NumMax=2,NumMin=1},
							},
					},
				},			
			--11-20低级奖励
			[2]={
				[2]={
						[1]={   {GoodsID=80049,GaiLv1=1,GaiLv2=312500,NumGaiLv=6530,NumMax=33,NumMin=32},
								{GoodsID=80065,GaiLv1=312501,GaiLv2=625001,NumGaiLv=6530,NumMax=33,NumMin=32},
								{GoodsID=80065,GaiLv1=625002,GaiLv2=937502,NumGaiLv=1000,NumMax=1,NumMin=0},
								{GoodsID=80397,GaiLv1=937503,GaiLv2=1250003,NumGaiLv=4081,NumMax=21,NumMin=20},
								{GoodsID=80383,GaiLv1=1250004,GaiLv2=1562504,NumGaiLv=4081,NumMax=21,NumMin=20},
								{GoodsID=80181,GaiLv1=1562505,GaiLv2=1875005,NumGaiLv=4081,NumMax=21,NumMin=20},
								{GoodsID=80191,GaiLv1=1875006,GaiLv2=2187506,NumGaiLv=4081,NumMax=21,NumMin=20},
								{GoodsID=784,  GaiLv1=2187507,GaiLv2=2500007,NumGaiLv=4489,NumMax=3,NumMin=2},
								{GoodsID=501,  GaiLv1=2500008,GaiLv2=2812508,NumGaiLv=1632,NumMax=9,NumMin=8},
								{GoodsID=80274,GaiLv1=2812509,GaiLv2=3125009,NumGaiLv=2448,NumMax=13,NumMin=12},
								{GoodsID=40002,GaiLv1=3125010,GaiLv2=3437510,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40012,GaiLv1=3437511,GaiLv2=3750011,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40022,GaiLv1=3750012,GaiLv2=4062512,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40032,GaiLv1=4062513,GaiLv2=4375013,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40042,GaiLv1=4375014,GaiLv2=4687514,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40052,GaiLv1=4687515,GaiLv2=5000015,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40062,GaiLv1=5000016,GaiLv2=5312516,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40072,GaiLv1=5312517,GaiLv2=5625017,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40082,GaiLv1=5625018,GaiLv2=5937518,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40092,GaiLv1=5937519,GaiLv2=6250019,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40112,GaiLv1=6250020,GaiLv2=6562520,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40003,GaiLv1=6562521,GaiLv2=6875021,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40013,GaiLv1=6875022,GaiLv2=7187522,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40023,GaiLv1=7187523,GaiLv2=7500023,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40033,GaiLv1=7500024,GaiLv2=7812524,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40043,GaiLv1=7812525,GaiLv2=8125025,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40053,GaiLv1=8125026,GaiLv2=8437526,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40063,GaiLv1=8437527,GaiLv2=8750027,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40073,GaiLv1=8750028,GaiLv2=9062528,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40083,GaiLv1=9062529,GaiLv2=9375029,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40093,GaiLv1=9375030,GaiLv2=9687530,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40113,GaiLv1=9687531,GaiLv2=10000000,NumGaiLv=5306,NumMax=7,NumMin=6},
							},
						[2]={   {GoodsID=80065,GaiLv1=1,GaiLv2=5000001,NumGaiLv=7750,NumMax=39,NumMin=38},
								{GoodsID=80065,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=2500,NumMax=1,NumMin=0},
							},
						[3]={   {GoodsID=80065,GaiLv1=1,GaiLv2=10000000,NumGaiLv=9375,NumMax=25,NumMin=24},
							},
					}, 
				[3]={
						[1]={   {GoodsID=80065,GaiLv1=1,GaiLv2=5000001,NumGaiLv=204,NumMax=2,NumMin=1},
								{GoodsID=80065,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=250,NumMax=1,NumMin=0},

							},
						[2]={   {GoodsID=80065,GaiLv1=1,GaiLv2=5000001,NumGaiLv=5000,NumMax=4,NumMin=3},
								{GoodsID=80065,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=500,NumMax=1,NumMin=0},

							},
						[3]={   {GoodsID=80049,GaiLv1=1,GaiLv2=322580,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80065,GaiLv1=322581,GaiLv2=645161,NumGaiLv=9544,NumMax=4,NumMin=3},
								{GoodsID=80397,GaiLv1=645162,GaiLv2=967742,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80383,GaiLv1=967743,GaiLv2=1290323,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80181,GaiLv1=1290324,GaiLv2=1612904,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80191,GaiLv1=1612905,GaiLv2=1935485,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=784,GaiLv1=1935486,GaiLv2=2258066,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=501,GaiLv1=2258067,GaiLv2=2580647,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80274,GaiLv1=2580648,GaiLv2=2903228,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=40002,GaiLv1=2903229,GaiLv2=3225809,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40012,GaiLv1=3225810,GaiLv2=3548390,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40022,GaiLv1=3548391,GaiLv2=3870971,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40032,GaiLv1=3870972,GaiLv2=4193552,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40042,GaiLv1=4193553,GaiLv2=4516133,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40052,GaiLv1=4516134,GaiLv2=4838714,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40062,GaiLv1=4838715,GaiLv2=5161295,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40072,GaiLv1=5161296,GaiLv2=5483876,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40082,GaiLv1=5483877,GaiLv2=5806457,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40092,GaiLv1=5806458,GaiLv2=6129038,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40112,GaiLv1=6129039,GaiLv2=6451619,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40003,GaiLv1=6451620,GaiLv2=6774200,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40013,GaiLv1=6774201,GaiLv2=7096781,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40023,GaiLv1=7096782,GaiLv2=7419362,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40033,GaiLv1=7419363,GaiLv2=7741943,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40043,GaiLv1=7741944,GaiLv2=8064524,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40053,GaiLv1=8064525,GaiLv2=8387105,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40063,GaiLv1=8387106,GaiLv2=8709686,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40073,GaiLv1=8709687,GaiLv2=9032267,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40083,GaiLv1=9032268,GaiLv2=9354848,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40093,GaiLv1=9354849,GaiLv2=9677429,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40113,GaiLv1=9677430,GaiLv2=10000000,NumGaiLv=9871,NumMax=2,NumMin=1},
							},
					},
				},
			--21-25级奖励	
			[3]={
				[2]={
						[1]={   {GoodsID=80049,GaiLv1=1,GaiLv2=312500,NumGaiLv=6530,NumMax=33,NumMin=32},
								{GoodsID=80065,GaiLv1=312501,GaiLv2=625001,NumGaiLv=6530,NumMax=33,NumMin=32},
								{GoodsID=80065,GaiLv1=625002,GaiLv2=937502,NumGaiLv=1000,NumMax=1,NumMin=0},
								{GoodsID=80397,GaiLv1=937503,GaiLv2=1250003,NumGaiLv=4081,NumMax=21,NumMin=20},
								{GoodsID=80383,GaiLv1=1250004,GaiLv2=1562504,NumGaiLv=4081,NumMax=21,NumMin=20},
								{GoodsID=80181,GaiLv1=1562505,GaiLv2=1875005,NumGaiLv=4081,NumMax=21,NumMin=20},
								{GoodsID=80191,GaiLv1=1875006,GaiLv2=2187506,NumGaiLv=4081,NumMax=21,NumMin=20},
								{GoodsID=784,  GaiLv1=2187507,GaiLv2=2500007,NumGaiLv=4489,NumMax=3,NumMin=2},
								{GoodsID=501,  GaiLv1=2500008,GaiLv2=2812508,NumGaiLv=1632,NumMax=9,NumMin=8},
								{GoodsID=80274,GaiLv1=2812509,GaiLv2=3125009,NumGaiLv=2448,NumMax=13,NumMin=12},
								{GoodsID=40002,GaiLv1=3125010,GaiLv2=3437510,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40012,GaiLv1=3437511,GaiLv2=3750011,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40022,GaiLv1=3750012,GaiLv2=4062512,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40032,GaiLv1=4062513,GaiLv2=4375013,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40042,GaiLv1=4375014,GaiLv2=4687514,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40052,GaiLv1=4687515,GaiLv2=5000015,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40062,GaiLv1=5000016,GaiLv2=5312516,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40072,GaiLv1=5312517,GaiLv2=5625017,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40082,GaiLv1=5625018,GaiLv2=5937518,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40092,GaiLv1=5937519,GaiLv2=6250019,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40112,GaiLv1=6250020,GaiLv2=6562520,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40003,GaiLv1=6562521,GaiLv2=6875021,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40013,GaiLv1=6875022,GaiLv2=7187522,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40023,GaiLv1=7187523,GaiLv2=7500023,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40033,GaiLv1=7500024,GaiLv2=7812524,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40043,GaiLv1=7812525,GaiLv2=8125025,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40053,GaiLv1=8125026,GaiLv2=8437526,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40063,GaiLv1=8437527,GaiLv2=8750027,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40073,GaiLv1=8750028,GaiLv2=9062528,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40083,GaiLv1=9062529,GaiLv2=9375029,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40093,GaiLv1=9375030,GaiLv2=9687530,NumGaiLv=5306,NumMax=7,NumMin=6},
								{GoodsID=40113,GaiLv1=9687531,GaiLv2=10000000,NumGaiLv=5306,NumMax=7,NumMin=6},
							},
						[2]={   {GoodsID=80065,GaiLv1=1,GaiLv2=5000001,NumGaiLv=7750,NumMax=39,NumMin=38},
								{GoodsID=80065,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=2500,NumMax=1,NumMin=0},
							},
						[3]={   {GoodsID=80065,GaiLv1=1,GaiLv2=10000000,NumGaiLv=9375,NumMax=25,NumMin=24},
							},
					}, 
				[3]={
						[1]={   {GoodsID=80065,GaiLv1=1,GaiLv2=5000001,NumGaiLv=204,NumMax=2,NumMin=1},
								{GoodsID=80065,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=250,NumMax=1,NumMin=0},

							},
						[2]={   {GoodsID=80065,GaiLv1=1,GaiLv2=5000001,NumGaiLv=5000,NumMax=4,NumMin=3},
								{GoodsID=80065,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=500,NumMax=1,NumMin=0},

							},
						[3]={   {GoodsID=80049,GaiLv1=1,GaiLv2=322580,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80065,GaiLv1=322581,GaiLv2=645161,NumGaiLv=9544,NumMax=4,NumMin=3},
								{GoodsID=80397,GaiLv1=645162,GaiLv2=967742,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80383,GaiLv1=967743,GaiLv2=1290323,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80181,GaiLv1=1290324,GaiLv2=1612904,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80191,GaiLv1=1612905,GaiLv2=1935485,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=784,GaiLv1=1935486,GaiLv2=2258066,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=501,GaiLv1=2258067,GaiLv2=2580647,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=80274,GaiLv1=2580648,GaiLv2=2903228,NumGaiLv=9743,NumMax=4,NumMin=3},
								{GoodsID=40002,GaiLv1=2903229,GaiLv2=3225809,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40012,GaiLv1=3225810,GaiLv2=3548390,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40022,GaiLv1=3548391,GaiLv2=3870971,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40032,GaiLv1=3870972,GaiLv2=4193552,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40042,GaiLv1=4193553,GaiLv2=4516133,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40052,GaiLv1=4516134,GaiLv2=4838714,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40062,GaiLv1=4838715,GaiLv2=5161295,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40072,GaiLv1=5161296,GaiLv2=5483876,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40082,GaiLv1=5483877,GaiLv2=5806457,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40092,GaiLv1=5806458,GaiLv2=6129038,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40112,GaiLv1=6129039,GaiLv2=6451619,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40003,GaiLv1=6451620,GaiLv2=6774200,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40013,GaiLv1=6774201,GaiLv2=7096781,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40023,GaiLv1=7096782,GaiLv2=7419362,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40033,GaiLv1=7419363,GaiLv2=7741943,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40043,GaiLv1=7741944,GaiLv2=8064524,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40053,GaiLv1=8064525,GaiLv2=8387105,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40063,GaiLv1=8387106,GaiLv2=8709686,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40073,GaiLv1=8709687,GaiLv2=9032267,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40083,GaiLv1=9032268,GaiLv2=9354848,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40093,GaiLv1=9354849,GaiLv2=9677429,NumGaiLv=9871,NumMax=2,NumMin=1},
								{GoodsID=40113,GaiLv1=9677430,GaiLv2=10000000,NumGaiLv=9871,NumMax=2,NumMin=1},
							},
					},
				},	
			--26级-35级列表
			[4] =   {
					[2]={
						[1]={
							{GoodsID=80050,GaiLv1=1,GaiLv2=303030,NumGaiLv=6734,NumMax=34,NumMin=33},
							{GoodsID=80066,GaiLv1=303031,GaiLv2=606061,NumGaiLv=6734,NumMax=34,NumMin=33},
							{GoodsID=80066,GaiLv1=606062,GaiLv2=909092,NumGaiLv=1000,NumMax=1,NumMin=0},
							{GoodsID=80397,GaiLv1=909093,GaiLv2=1212123,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80384,GaiLv1=1212124,GaiLv2=1515154,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80181,GaiLv1=1515155,GaiLv2=1818185,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80192,GaiLv1=1818186,GaiLv2=2121216,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=785,GaiLv1=2121217,GaiLv2=2424247,NumGaiLv=5255,NumMax=3,NumMin=2},
							{GoodsID=501,GaiLv1=2424248,GaiLv2=2727278,NumGaiLv=4183,NumMax=9,NumMin=8},
							{GoodsID=80274,GaiLv1=2727279,GaiLv2=3030309,NumGaiLv=6275,NumMax=13,NumMin=12},
							{GoodsID=40003,GaiLv1=3030310,GaiLv2=3333340,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40013,GaiLv1=3333341,GaiLv2=3636371,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40023,GaiLv1=3636372,GaiLv2=3939402,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40033,GaiLv1=3939403,GaiLv2=4242433,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40043,GaiLv1=4242434,GaiLv2=4545464,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40053,GaiLv1=4545465,GaiLv2=4848495,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40063,GaiLv1=4848496,GaiLv2=5151526,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40073,GaiLv1=5151527,GaiLv2=5454557,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40083,GaiLv1=5454558,GaiLv2=5757588,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40093,GaiLv1=5757589,GaiLv2=6060619,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40113,GaiLv1=6060620,GaiLv2=6363650,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40004,GaiLv1=6363651,GaiLv2=6666681,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40014,GaiLv1=6666682,GaiLv2=6969712,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40024,GaiLv1=6969713,GaiLv2=7272743,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40034,GaiLv1=7272744,GaiLv2=7575774,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40044,GaiLv1=7575775,GaiLv2=7878805,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40054,GaiLv1=7878806,GaiLv2=8181836,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40064,GaiLv1=8181837,GaiLv2=8484867,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40074,GaiLv1=8484868,GaiLv2=8787898,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40084,GaiLv1=8787899,GaiLv2=9090929,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40094,GaiLv1=9090930,GaiLv2=9393960,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40114,GaiLv1=9393961,GaiLv2=9696991,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=80387,GaiLv1=9696992,GaiLv2=10000000,NumGaiLv=6836,NumMax=2,NumMin=1},
							},
						[2]={   
						    {GoodsID=80066,GaiLv1=1,GaiLv2=5000001,NumGaiLv=4060,NumMax=20,NumMin=19},
							{GoodsID=80066,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=2500,NumMax=1,NumMin=0},
							},
						[3]={
						    {GoodsID=80066,GaiLv1=1,GaiLv2=10000000,NumGaiLv=8750,NumMax=25,NumMin=24},
							},
						},	
					[3]={
						[1]={   
							{GoodsID=80066,GaiLv1=1,GaiLv2=5000001,NumGaiLv=6666,NumMax=2,NumMin=1},
							{GoodsID=80066,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=250,NumMax=1,NumMin=0},
							},
						[2]={   
							{GoodsID=80066,GaiLv1=1,GaiLv2=5000001,NumGaiLv=5000,NumMax=4,NumMin=3},
							{GoodsID=80066,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=500,NumMax=1,NumMin=0},
							},
						[3]={   
							{GoodsID=80050,GaiLv1=1,GaiLv2=312500,NumGaiLv=1025,NumMax=5,NumMin=4},
							{GoodsID=80066,GaiLv1=312501,GaiLv2=625001,NumGaiLv=820,NumMax=5,NumMin=4},
							{GoodsID=80397,GaiLv1=625002,GaiLv2=937502,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80384,GaiLv1=937503,GaiLv2=1250003,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80181,GaiLv1=1250004,GaiLv2=1562504,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80192,GaiLv1=1562505,GaiLv2=1875005,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=785,GaiLv1=1875006,GaiLv2=2187506,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=501,GaiLv1=2187507,GaiLv2=2500007,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80274,GaiLv1=2500008,GaiLv2=2812508,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40003,GaiLv1=2812509,GaiLv2=3125009,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40013,GaiLv1=3125010,GaiLv2=3437510,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40023,GaiLv1=3437511,GaiLv2=3750011,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40033,GaiLv1=3750012,GaiLv2=4062512,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40043,GaiLv1=4062513,GaiLv2=4375013,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40053,GaiLv1=4375014,GaiLv2=4687514,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40063,GaiLv1=4687515,GaiLv2=5000015,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40073,GaiLv1=5000016,GaiLv2=5312516,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40083,GaiLv1=5312517,GaiLv2=5625017,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40093,GaiLv1=5625018,GaiLv2=5937518,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40113,GaiLv1=5937519,GaiLv2=6250019,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40004,GaiLv1=6250020,GaiLv2=6562520,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40014,GaiLv1=6562521,GaiLv2=6875021,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40024,GaiLv1=6875022,GaiLv2=7187522,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40034,GaiLv1=7187523,GaiLv2=7500023,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40044,GaiLv1=7500024,GaiLv2=7812524,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40054,GaiLv1=7812525,GaiLv2=8125025,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40064,GaiLv1=8125026,GaiLv2=8437526,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40074,GaiLv1=8437527,GaiLv2=8750027,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40084,GaiLv1=8750028,GaiLv2=9062528,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40094,GaiLv1=9062529,GaiLv2=9375029,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40114,GaiLv1=9375030,GaiLv2=9687530,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80387,GaiLv1=9687531,GaiLv2=10000000,NumGaiLv=512,NumMax=3,NumMin=2},
							},
						},	
					},	
			--36级-40级列表
			[5] =   {
					[2]={
						[1]={
							{GoodsID=80050,GaiLv1=1,GaiLv2=303030,NumGaiLv=6734,NumMax=34,NumMin=33},
							{GoodsID=80066,GaiLv1=303031,GaiLv2=606061,NumGaiLv=6734,NumMax=34,NumMin=33},
							{GoodsID=80066,GaiLv1=606062,GaiLv2=909092,NumGaiLv=1000,NumMax=1,NumMin=0},
							{GoodsID=80397,GaiLv1=909093,GaiLv2=1212123,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80384,GaiLv1=1212124,GaiLv2=1515154,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80181,GaiLv1=1515155,GaiLv2=1818185,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80192,GaiLv1=1818186,GaiLv2=2121216,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=785,GaiLv1=2121217,GaiLv2=2424247,NumGaiLv=5255,NumMax=3,NumMin=2},
							{GoodsID=501,GaiLv1=2424248,GaiLv2=2727278,NumGaiLv=4183,NumMax=9,NumMin=8},
							{GoodsID=80274,GaiLv1=2727279,GaiLv2=3030309,NumGaiLv=6275,NumMax=13,NumMin=12},
							{GoodsID=40003,GaiLv1=3030310,GaiLv2=3333340,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40013,GaiLv1=3333341,GaiLv2=3636371,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40023,GaiLv1=3636372,GaiLv2=3939402,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40033,GaiLv1=3939403,GaiLv2=4242433,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40043,GaiLv1=4242434,GaiLv2=4545464,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40053,GaiLv1=4545465,GaiLv2=4848495,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40063,GaiLv1=4848496,GaiLv2=5151526,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40073,GaiLv1=5151527,GaiLv2=5454557,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40083,GaiLv1=5454558,GaiLv2=5757588,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40093,GaiLv1=5757589,GaiLv2=6060619,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40113,GaiLv1=6060620,GaiLv2=6363650,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40004,GaiLv1=6363651,GaiLv2=6666681,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40014,GaiLv1=6666682,GaiLv2=6969712,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40024,GaiLv1=6969713,GaiLv2=7272743,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40034,GaiLv1=7272744,GaiLv2=7575774,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40044,GaiLv1=7575775,GaiLv2=7878805,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40054,GaiLv1=7878806,GaiLv2=8181836,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40064,GaiLv1=8181837,GaiLv2=8484867,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40074,GaiLv1=8484868,GaiLv2=8787898,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40084,GaiLv1=8787899,GaiLv2=9090929,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40094,GaiLv1=9090930,GaiLv2=9393960,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40114,GaiLv1=9393961,GaiLv2=9696991,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=80387,GaiLv1=9696992,GaiLv2=10000000,NumGaiLv=6836,NumMax=2,NumMin=1},
							},
						[2]={   
						    {GoodsID=80066,GaiLv1=1,GaiLv2=5000001,NumGaiLv=4060,NumMax=20,NumMin=19},
							{GoodsID=80066,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=2500,NumMax=1,NumMin=0},
							},
						[3]={
						    {GoodsID=80066,GaiLv1=1,GaiLv2=10000000,NumGaiLv=8750,NumMax=25,NumMin=24},
							},
						},	
					[3]={
						[1]={   
							{GoodsID=80066,GaiLv1=1,GaiLv2=5000001,NumGaiLv=6666,NumMax=2,NumMin=1},
							{GoodsID=80066,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=250,NumMax=1,NumMin=0},
							},
						[2]={   
							{GoodsID=80066,GaiLv1=1,GaiLv2=5000001,NumGaiLv=5000,NumMax=4,NumMin=3},
							{GoodsID=80066,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=500,NumMax=1,NumMin=0},
							},
						[3]={   
							{GoodsID=80050,GaiLv1=1,GaiLv2=312500,NumGaiLv=1025,NumMax=5,NumMin=4},
							{GoodsID=80066,GaiLv1=312501,GaiLv2=625001,NumGaiLv=820,NumMax=5,NumMin=4},
							{GoodsID=80397,GaiLv1=625002,GaiLv2=937502,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80384,GaiLv1=937503,GaiLv2=1250003,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80181,GaiLv1=1250004,GaiLv2=1562504,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80192,GaiLv1=1562505,GaiLv2=1875005,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=785,GaiLv1=1875006,GaiLv2=2187506,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=501,GaiLv1=2187507,GaiLv2=2500007,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80274,GaiLv1=2500008,GaiLv2=2812508,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40003,GaiLv1=2812509,GaiLv2=3125009,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40013,GaiLv1=3125010,GaiLv2=3437510,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40023,GaiLv1=3437511,GaiLv2=3750011,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40033,GaiLv1=3750012,GaiLv2=4062512,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40043,GaiLv1=4062513,GaiLv2=4375013,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40053,GaiLv1=4375014,GaiLv2=4687514,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40063,GaiLv1=4687515,GaiLv2=5000015,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40073,GaiLv1=5000016,GaiLv2=5312516,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40083,GaiLv1=5312517,GaiLv2=5625017,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40093,GaiLv1=5625018,GaiLv2=5937518,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40113,GaiLv1=5937519,GaiLv2=6250019,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40004,GaiLv1=6250020,GaiLv2=6562520,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40014,GaiLv1=6562521,GaiLv2=6875021,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40024,GaiLv1=6875022,GaiLv2=7187522,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40034,GaiLv1=7187523,GaiLv2=7500023,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40044,GaiLv1=7500024,GaiLv2=7812524,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40054,GaiLv1=7812525,GaiLv2=8125025,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40064,GaiLv1=8125026,GaiLv2=8437526,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40074,GaiLv1=8437527,GaiLv2=8750027,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40084,GaiLv1=8750028,GaiLv2=9062528,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40094,GaiLv1=9062529,GaiLv2=9375029,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40114,GaiLv1=9375030,GaiLv2=9687530,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80387,GaiLv1=9687531,GaiLv2=10000000,NumGaiLv=512,NumMax=3,NumMin=2},
							},
						},	
					},							
			--41--50级
			[6] = {
					[2]={
						[1]={
							{GoodsID=80051,GaiLv1=1,GaiLv2=303030,NumGaiLv=6734,NumMax=34,NumMin=33},
							{GoodsID=80067,GaiLv1=303031,GaiLv2=606061,NumGaiLv=6734,NumMax=34,NumMin=33},
							{GoodsID=80067,GaiLv1=606062,GaiLv2=909092,NumGaiLv=1000,NumMax=1,NumMin=0},
							{GoodsID=80397,GaiLv1=909093,GaiLv2=1212123,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80384,GaiLv1=1212124,GaiLv2=1515154,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80181,GaiLv1=1515155,GaiLv2=1818185,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80192,GaiLv1=1818186,GaiLv2=2121216,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=786,GaiLv1=2121217,GaiLv2=2424247,NumGaiLv=5255,NumMax=3,NumMin=2},
							{GoodsID=501,GaiLv1=2424248,GaiLv2=2727278,NumGaiLv=4183,NumMax=9,NumMin=8},
							{GoodsID=80274,GaiLv1=2727279,GaiLv2=3030309,NumGaiLv=6275,NumMax=13,NumMin=12},
							{GoodsID=40004,GaiLv1=3030310,GaiLv2=3333340,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40014,GaiLv1=3333341,GaiLv2=3636371,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40024,GaiLv1=3636372,GaiLv2=3939402,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40034,GaiLv1=3939403,GaiLv2=4242433,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40044,GaiLv1=4242434,GaiLv2=4545464,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40054,GaiLv1=4545465,GaiLv2=4848495,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40064,GaiLv1=4848496,GaiLv2=5151526,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40074,GaiLv1=5151527,GaiLv2=5454557,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40084,GaiLv1=5454558,GaiLv2=5757588,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40094,GaiLv1=5757589,GaiLv2=6060619,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40114,GaiLv1=6060620,GaiLv2=6363650,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40005,GaiLv1=6363651,GaiLv2=6666681,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40015,GaiLv1=6666682,GaiLv2=6969712,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40025,GaiLv1=6969713,GaiLv2=7272743,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40035,GaiLv1=7272744,GaiLv2=7575774,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40045,GaiLv1=7575775,GaiLv2=7878805,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40055,GaiLv1=7878806,GaiLv2=8181836,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40065,GaiLv1=8181837,GaiLv2=8484867,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40075,GaiLv1=8484868,GaiLv2=8787898,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40085,GaiLv1=8787899,GaiLv2=9090929,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40095,GaiLv1=9090930,GaiLv2=9393960,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40115,GaiLv1=9393961,GaiLv2=9696991,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=80388,GaiLv1=9696992,GaiLv2=10000000,NumGaiLv=6836,NumMax=2,NumMin=1},
							},
						[2]={   
							{GoodsID=80067,GaiLv1=1,GaiLv2=5000001,NumGaiLv=4060,NumMax=20,NumMin=19},
							{GoodsID=80067,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=2500,NumMax=1,NumMin=0},
							},
						[3]={
						    {GoodsID=80067,GaiLv1=1,GaiLv2=10000000,NumGaiLv=8750,NumMax=25,NumMin=24},
							},
						},
					[3]={
						[1]={   
							{GoodsID=80067,GaiLv1=1,GaiLv2=5000001,NumGaiLv=6666,NumMax=2,NumMin=1},
							{GoodsID=80067,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=250,NumMax=1,NumMin=0},
							},
						[2]={   
							{GoodsID=80067,GaiLv1=1,GaiLv2=5000001,NumGaiLv=5000,NumMax=4,NumMin=3},
							{GoodsID=80067,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=500,NumMax=1,NumMin=0},
							},
						[3]={   
							{GoodsID=80051,GaiLv1=1,GaiLv2=312500,NumGaiLv=1025,NumMax=5,NumMin=4},
							{GoodsID=80067,GaiLv1=312501,GaiLv2=625001,NumGaiLv=820,NumMax=5,NumMin=4},
							{GoodsID=80397,GaiLv1=625002,GaiLv2=937502,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80384,GaiLv1=937503,GaiLv2=1250003,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80181,GaiLv1=1250004,GaiLv2=1562504,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80192,GaiLv1=1562505,GaiLv2=1875005,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=786,GaiLv1=1875006,GaiLv2=2187506,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=501,GaiLv1=2187507,GaiLv2=2500007,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80274,GaiLv1=2500008,GaiLv2=2812508,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40004,GaiLv1=2812509,GaiLv2=3125009,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40014,GaiLv1=3125010,GaiLv2=3437510,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40024,GaiLv1=3437511,GaiLv2=3750011,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40034,GaiLv1=3750012,GaiLv2=4062512,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40044,GaiLv1=4062513,GaiLv2=4375013,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40054,GaiLv1=4375014,GaiLv2=4687514,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40064,GaiLv1=4687515,GaiLv2=5000015,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40074,GaiLv1=5000016,GaiLv2=5312516,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40084,GaiLv1=5312517,GaiLv2=5625017,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40094,GaiLv1=5625018,GaiLv2=5937518,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40114,GaiLv1=5937519,GaiLv2=6250019,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40005,GaiLv1=6250020,GaiLv2=6562520,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40015,GaiLv1=6562521,GaiLv2=6875021,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40025,GaiLv1=6875022,GaiLv2=7187522,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40035,GaiLv1=7187523,GaiLv2=7500023,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40045,GaiLv1=7500024,GaiLv2=7812524,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40055,GaiLv1=7812525,GaiLv2=8125025,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40065,GaiLv1=8125026,GaiLv2=8437526,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40075,GaiLv1=8437527,GaiLv2=8750027,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40085,GaiLv1=8750028,GaiLv2=9062528,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40095,GaiLv1=9062529,GaiLv2=9375029,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40115,GaiLv1=9375030,GaiLv2=9687530,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80388,GaiLv1=9687531,GaiLv2=10000000,NumGaiLv=512,NumMax=3,NumMin=2},
							},
						},	
					},
		--51--55级
			[7] = {
					[2]={
						[1]={
							{GoodsID=80051,GaiLv1=1,GaiLv2=303030,NumGaiLv=6734,NumMax=34,NumMin=33},
							{GoodsID=80067,GaiLv1=303031,GaiLv2=606061,NumGaiLv=6734,NumMax=34,NumMin=33},
							{GoodsID=80067,GaiLv1=606062,GaiLv2=909092,NumGaiLv=1000,NumMax=1,NumMin=0},
							{GoodsID=80397,GaiLv1=909093,GaiLv2=1212123,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80384,GaiLv1=1212124,GaiLv2=1515154,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80181,GaiLv1=1515155,GaiLv2=1818185,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80192,GaiLv1=1818186,GaiLv2=2121216,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=786,GaiLv1=2121217,GaiLv2=2424247,NumGaiLv=5255,NumMax=3,NumMin=2},
							{GoodsID=501,GaiLv1=2424248,GaiLv2=2727278,NumGaiLv=4183,NumMax=9,NumMin=8},
							{GoodsID=80274,GaiLv1=2727279,GaiLv2=3030309,NumGaiLv=6275,NumMax=13,NumMin=12},
							{GoodsID=40004,GaiLv1=3030310,GaiLv2=3333340,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40014,GaiLv1=3333341,GaiLv2=3636371,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40024,GaiLv1=3636372,GaiLv2=3939402,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40034,GaiLv1=3939403,GaiLv2=4242433,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40044,GaiLv1=4242434,GaiLv2=4545464,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40054,GaiLv1=4545465,GaiLv2=4848495,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40064,GaiLv1=4848496,GaiLv2=5151526,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40074,GaiLv1=5151527,GaiLv2=5454557,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40084,GaiLv1=5454558,GaiLv2=5757588,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40094,GaiLv1=5757589,GaiLv2=6060619,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40114,GaiLv1=6060620,GaiLv2=6363650,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40005,GaiLv1=6363651,GaiLv2=6666681,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40015,GaiLv1=6666682,GaiLv2=6969712,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40025,GaiLv1=6969713,GaiLv2=7272743,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40035,GaiLv1=7272744,GaiLv2=7575774,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40045,GaiLv1=7575775,GaiLv2=7878805,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40055,GaiLv1=7878806,GaiLv2=8181836,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40065,GaiLv1=8181837,GaiLv2=8484867,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40075,GaiLv1=8484868,GaiLv2=8787898,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40085,GaiLv1=8787899,GaiLv2=9090929,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40095,GaiLv1=9090930,GaiLv2=9393960,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40115,GaiLv1=9393961,GaiLv2=9696991,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=80388,GaiLv1=9696992,GaiLv2=10000000,NumGaiLv=6836,NumMax=2,NumMin=1},
							},
						[2]={   
							{GoodsID=80067,GaiLv1=1,GaiLv2=5000001,NumGaiLv=4060,NumMax=20,NumMin=19},
							{GoodsID=80067,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=2500,NumMax=1,NumMin=0},
							},
						[3]={
						    {GoodsID=80067,GaiLv1=1,GaiLv2=10000000,NumGaiLv=8750,NumMax=25,NumMin=24},
							},
						},
					[3]={
						[1]={   
							{GoodsID=80067,GaiLv1=1,GaiLv2=5000001,NumGaiLv=6666,NumMax=2,NumMin=1},
							{GoodsID=80067,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=250,NumMax=1,NumMin=0},
							},
						[2]={   
							{GoodsID=80067,GaiLv1=1,GaiLv2=5000001,NumGaiLv=5000,NumMax=4,NumMin=3},
							{GoodsID=80067,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=500,NumMax=1,NumMin=0},
							},
						[3]={   
							{GoodsID=80051,GaiLv1=1,GaiLv2=312500,NumGaiLv=1025,NumMax=5,NumMin=4},
							{GoodsID=80067,GaiLv1=312501,GaiLv2=625001,NumGaiLv=820,NumMax=5,NumMin=4},
							{GoodsID=80397,GaiLv1=625002,GaiLv2=937502,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80384,GaiLv1=937503,GaiLv2=1250003,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80181,GaiLv1=1250004,GaiLv2=1562504,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80192,GaiLv1=1562505,GaiLv2=1875005,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=786,GaiLv1=1875006,GaiLv2=2187506,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=501,GaiLv1=2187507,GaiLv2=2500007,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80274,GaiLv1=2500008,GaiLv2=2812508,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40004,GaiLv1=2812509,GaiLv2=3125009,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40014,GaiLv1=3125010,GaiLv2=3437510,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40024,GaiLv1=3437511,GaiLv2=3750011,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40034,GaiLv1=3750012,GaiLv2=4062512,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40044,GaiLv1=4062513,GaiLv2=4375013,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40054,GaiLv1=4375014,GaiLv2=4687514,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40064,GaiLv1=4687515,GaiLv2=5000015,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40074,GaiLv1=5000016,GaiLv2=5312516,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40084,GaiLv1=5312517,GaiLv2=5625017,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40094,GaiLv1=5625018,GaiLv2=5937518,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40114,GaiLv1=5937519,GaiLv2=6250019,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40005,GaiLv1=6250020,GaiLv2=6562520,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40015,GaiLv1=6562521,GaiLv2=6875021,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40025,GaiLv1=6875022,GaiLv2=7187522,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40035,GaiLv1=7187523,GaiLv2=7500023,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40045,GaiLv1=7500024,GaiLv2=7812524,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40055,GaiLv1=7812525,GaiLv2=8125025,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40065,GaiLv1=8125026,GaiLv2=8437526,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40075,GaiLv1=8437527,GaiLv2=8750027,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40085,GaiLv1=8750028,GaiLv2=9062528,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40095,GaiLv1=9062529,GaiLv2=9375029,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40115,GaiLv1=9375030,GaiLv2=9687530,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80388,GaiLv1=9687531,GaiLv2=10000000,NumGaiLv=512,NumMax=3,NumMin=2},
							},
						},	
					},	
		--56--65级
			[8] = {
					[2]={
						[1]={
							{GoodsID=80051,GaiLv1=1,GaiLv2=303030,NumGaiLv=6734,NumMax=34,NumMin=33},
							{GoodsID=80067,GaiLv1=303031,GaiLv2=606061,NumGaiLv=6734,NumMax=34,NumMin=33},
							{GoodsID=80067,GaiLv1=606062,GaiLv2=909092,NumGaiLv=1000,NumMax=1,NumMin=0},
							{GoodsID=80397,GaiLv1=909093,GaiLv2=1212123,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80384,GaiLv1=1212124,GaiLv2=1515154,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80181,GaiLv1=1515155,GaiLv2=1818185,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=80192,GaiLv1=1818186,GaiLv2=2121216,NumGaiLv=459,NumMax=22,NumMin=21},
							{GoodsID=786,GaiLv1=2121217,GaiLv2=2424247,NumGaiLv=5255,NumMax=3,NumMin=2},
							{GoodsID=501,GaiLv1=2424248,GaiLv2=2727278,NumGaiLv=4183,NumMax=9,NumMin=8},
							{GoodsID=80274,GaiLv1=2727279,GaiLv2=3030309,NumGaiLv=6275,NumMax=13,NumMin=12},
							{GoodsID=40004,GaiLv1=3030310,GaiLv2=3333340,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40014,GaiLv1=3333341,GaiLv2=3636371,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40024,GaiLv1=3636372,GaiLv2=3939402,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40034,GaiLv1=3939403,GaiLv2=4242433,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40044,GaiLv1=4242434,GaiLv2=4545464,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40054,GaiLv1=4545465,GaiLv2=4848495,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40064,GaiLv1=4848496,GaiLv2=5151526,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40074,GaiLv1=5151527,GaiLv2=5454557,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40084,GaiLv1=5454558,GaiLv2=5757588,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40094,GaiLv1=5757589,GaiLv2=6060619,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40114,GaiLv1=6060620,GaiLv2=6363650,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40005,GaiLv1=6363651,GaiLv2=6666681,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40015,GaiLv1=6666682,GaiLv2=6969712,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40025,GaiLv1=6969713,GaiLv2=7272743,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40035,GaiLv1=7272744,GaiLv2=7575774,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40045,GaiLv1=7575775,GaiLv2=7878805,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40055,GaiLv1=7878806,GaiLv2=8181836,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40065,GaiLv1=8181837,GaiLv2=8484867,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40075,GaiLv1=8484868,GaiLv2=8787898,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40085,GaiLv1=8787899,GaiLv2=9090929,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40095,GaiLv1=9090930,GaiLv2=9393960,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=40115,GaiLv1=9393961,GaiLv2=9696991,NumGaiLv=7346,NumMax=7,NumMin=6},
							{GoodsID=80388,GaiLv1=9696992,GaiLv2=10000000,NumGaiLv=6836,NumMax=2,NumMin=1},
							},
						[2]={   
							{GoodsID=80067,GaiLv1=1,GaiLv2=5000001,NumGaiLv=4060,NumMax=20,NumMin=19},
							{GoodsID=80067,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=2500,NumMax=1,NumMin=0},
							},
						[3]={
						    {GoodsID=80067,GaiLv1=1,GaiLv2=10000000,NumGaiLv=8750,NumMax=25,NumMin=24},
							},
						},
					[3]={
						[1]={   
							{GoodsID=80067,GaiLv1=1,GaiLv2=5000001,NumGaiLv=6666,NumMax=2,NumMin=1},
							{GoodsID=80067,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=250,NumMax=1,NumMin=0},
							},
						[2]={   
							{GoodsID=80067,GaiLv1=1,GaiLv2=5000001,NumGaiLv=5000,NumMax=4,NumMin=3},
							{GoodsID=80067,GaiLv1=5000002,GaiLv2=10000000,NumGaiLv=500,NumMax=1,NumMin=0},
							},
						[3]={   
							{GoodsID=80051,GaiLv1=1,GaiLv2=312500,NumGaiLv=1025,NumMax=5,NumMin=4},
							{GoodsID=80067,GaiLv1=312501,GaiLv2=625001,NumGaiLv=820,NumMax=5,NumMin=4},
							{GoodsID=80397,GaiLv1=625002,GaiLv2=937502,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80384,GaiLv1=937503,GaiLv2=1250003,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80181,GaiLv1=1250004,GaiLv2=1562504,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80192,GaiLv1=1562505,GaiLv2=1875005,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=786,GaiLv1=1875006,GaiLv2=2187506,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=501,GaiLv1=2187507,GaiLv2=2500007,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80274,GaiLv1=2500008,GaiLv2=2812508,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40004,GaiLv1=2812509,GaiLv2=3125009,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40014,GaiLv1=3125010,GaiLv2=3437510,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40024,GaiLv1=3437511,GaiLv2=3750011,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40034,GaiLv1=3750012,GaiLv2=4062512,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40044,GaiLv1=4062513,GaiLv2=4375013,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40054,GaiLv1=4375014,GaiLv2=4687514,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40064,GaiLv1=4687515,GaiLv2=5000015,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40074,GaiLv1=5000016,GaiLv2=5312516,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40084,GaiLv1=5312517,GaiLv2=5625017,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40094,GaiLv1=5625018,GaiLv2=5937518,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40114,GaiLv1=5937519,GaiLv2=6250019,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40005,GaiLv1=6250020,GaiLv2=6562520,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40015,GaiLv1=6562521,GaiLv2=6875021,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40025,GaiLv1=6875022,GaiLv2=7187522,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40035,GaiLv1=7187523,GaiLv2=7500023,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40045,GaiLv1=7500024,GaiLv2=7812524,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40055,GaiLv1=7812525,GaiLv2=8125025,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40065,GaiLv1=8125026,GaiLv2=8437526,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40075,GaiLv1=8437527,GaiLv2=8750027,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40085,GaiLv1=8750028,GaiLv2=9062528,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40095,GaiLv1=9062529,GaiLv2=9375029,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=40115,GaiLv1=9375030,GaiLv2=9687530,NumGaiLv=512,NumMax=3,NumMin=2},
							{GoodsID=80388,GaiLv1=9687531,GaiLv2=10000000,NumGaiLv=512,NumMax=3,NumMin=2},
							},
						},							
					},			
    }
end
--复赛奖励
if ZhiShiDaRen_FSJiangLiTable == nil then	
	ZhiShiDaRen_FSJiangLiTable = {
								[1] = { JB = 500000},
								[2] = { JB = 100000},
								[3] = { JB = 50000},
								[4] = { JB = 30000},
								[5] = { JB = 15000},
								[6] = { JB = 12000},
								[7] = { JB = 9000},
								[8] = { JB = 7000},
								[9] = { JB = 6000},
								[10] = { JB = 4000},
							}
end							

--奖励比列值
if ZhiShiDaRen_JLXXTable == nil then
	ZhiShiDaRen_JLXXTable = {
								[1]={XX= 2424},	
								[2]={XX= 2626},
								[3]={XX= 2828},
								[4]={XX= 3030},	
								[5]={XX= 3232},	
								[6]={XX= 3434},	
								[7]={XX= 3636},	
								[8]={XX= 3838},	
								[9]={XX= 4040},	
								[10]={XX= 4242},	
								[11]={XX= 4444},	
								[12]={XX= 4646},	
								[13]={XX= 4848},	
								[14]={XX= 5051},	
								[15]={XX= 5253},	
								[16]={XX= 5455},	
								[17]={XX= 5657},	
								[18]={XX= 5859},	
								[19]={XX= 6061},	
								[20]={XX= 6263},	
								[21]={XX= 6465},	
								[22]={XX= 6667},
								[23]={XX=6869},
								}
end
--奖励数值表
if ZhiShiDaRen_JLTable == nil then
	ZhiShiDaRen_JLTable = {
							[1] = { Exp=2112,SJB=1848},
							[2] = { Exp=2816,SJB=1848},
							[3] = { Exp=3520,SJB=1848},
							[4] = { Exp=4224,SJB=1848},
							[5] = { Exp=4928,SJB=1848},
							[6] = { Exp=5632,SJB=1848},
							[7] = { Exp=6336,SJB=1848},
							[8] = { Exp=7040,SJB=1848},
							[9] = { Exp=7744,SJB=1848},
							[10] = { Exp=8448,SJB=1848},
							[11] = { Exp=10560,SJB=3652},
							[12] = { Exp=11968,SJB=3652},
							[13] = { Exp=13376,SJB=3652},
							[14] = { Exp=14784,SJB=3652},
							[15] = { Exp=16192,SJB=3652},
							[16] = { Exp=17600,SJB=3652},
							[17] = { Exp=19008,SJB=3652},
							[18] = { Exp=20416,SJB=3652},
							[19] = { Exp=21824,SJB=3652},
							[20] = { Exp=23232,SJB=3652},
							[21] = { Exp=27456,SJB=3652},
							[22] = { Exp=29568,SJB=3652},
							[23] = { Exp=31680,SJB=3652},
							[24] = { Exp=33792,SJB=3652},
							[25] = { Exp=5904,SJB=3652},
							[26] = { Exp=63360,SJB=17600},
							[27] = { Exp=67584,SJB=17600},
							[28] = { Exp=71808,SJB=17600},
							[29] = { Exp=76032,SJB=17600},
							[30] = { Exp=80256,SJB=17600},
							[31] = { Exp=84480,SJB=17600},
							[32] = { Exp=88704,SJB=17600},
							[33] = { Exp=92928,SJB=17600},
							[34] = { Exp=97152,SJB=17600},
							[35] = { Exp=101376,SJB=17600},
							[36] = { Exp=114048,SJB=17600},
							[37] = { Exp=119328,SJB=17600},
							[38] = { Exp=124608,SJB=17600},
							[39] = { Exp=129888,SJB=17600},
							[40] = { Exp=135168,SJB=17600},
							[41] = { Exp=151008,SJB=17600},
							[42] = { Exp=157344,SJB=17600},
							[43] = { Exp=163680,SJB=17600},
							[44] = { Exp=170016,SJB=17600},
							[45] = { Exp=176352,SJB=17600},
							[46] = { Exp=182688,SJB=17600},
							[47] = { Exp=189024,SJB=17600},
							[48] = { Exp=195360,SJB=17600},
							[49] = { Exp=201696,SJB=17600},
							[50] = { Exp=208032,SJB=17600},
							[51] = { Exp=208032,SJB=17600},
							[52] = { Exp=208032,SJB=17600},
							[53] = { Exp=208032,SJB=17600},
							[54] = { Exp=208032,SJB=17600},
							[55] = { Exp=208032,SJB=17600},
							[56] = { Exp=222992,SJB=22176},
							[57] = { Exp=229768,SJB=22176},
							[58] = { Exp=236544,SJB=22176},
							[59] = { Exp=243276,SJB=22176},
							[60] = { Exp=250052,SJB=22176},
							[61] = { Exp=256784,SJB=22176},
							[62] = { Exp=263560,SJB=22176},
							[63] = { Exp=270336,SJB=22176},
							[64] = { Exp=277068,SJB=22176},
							[65] = { Exp=283844,SJB=22176},
							[66] = { Exp=304128,SJB=27192},
							[67] = { Exp=311696,SJB=27192},
							[68] = { Exp=319308,SJB=27192},
							[69] = { Exp=326920,SJB=27192},
							[70] = { Exp=334532,SJB=27192},
							[71] = { Exp=357324,SJB=32692},
							[72] = { Exp=365772,SJB=32692},
							[73] = { Exp=374220,SJB=32692},
							[74] = { Exp=382668,SJB=32692},
							[75] = { Exp=391116,SJB=32692},
							[76] = { Exp=399564,SJB=32692},
							[77] = { Exp=408012,SJB=32692},
							[78] = { Exp=416460,SJB=32692},
							[79] = { Exp=424908,SJB=32692},
							[80] = { Exp=433356,SJB=32692},
							[81] = { Exp=458700,SJB=39028},
							[82] = { Exp=467984,SJB=39028},
							[83] = { Exp=477312,SJB=39028},
							[84] = { Exp=486596,SJB=39028},
				       }
end
--奖励类型表
if ZhiShiDaRen_JLleixingTable == nil then
	ZhiShiDaRen_JLleixingTable = {
									[1] = {XS = 10},
									[2] = {XS = 15},
									[3] = {XS = 25},
								 }
end
--评委表的名字
if ZhiShiDaRen_PingWeiTable == nil then
	ZhiShiDaRen_PingWeiTable = {
								[0]={
									[1]={NPC = 1,X = 131,Y = 133,MapID =82,NPCID = 12092,},
									[2]={NPC = 2,X = 268,Y = 203,MapID =1,NPCID = 12093,},
									[3]={NPC = 3,X = 203,Y = 374,MapID =9,NPCID = 12094,},
									[4]={NPC = 4,X = 266,Y = 325,MapID =9,NPCID = 12095,},
									[5]={NPC = 5,X = 309,Y = 200,MapID =9,NPCID = 12096,},
									[6]={NPC = 6,X = 295,Y = 116,MapID =9,NPCID = 12097,},
									[7]={NPC = 7,X = 177,Y = 326,MapID =23,NPCID = 12098,},
									[8]={NPC = 8,X = 224,Y = 290,MapID =23,NPCID = 12099,},
									[9]={NPC = 9,X = 321,Y = 294,MapID =23,NPCID = 12100,},
									[10]={NPC = 10,X = 332,Y = 212,MapID =23,NPCID = 12101,},
									[11]={NPC = 11,X = 344,Y = 147,MapID =23,NPCID = 12102,},
									[12]={NPC = 12,X = 316,Y = 114,MapID =23,NPCID = 12103,},
									[13]={NPC = 13,X = 218,Y = 196,MapID =23,NPCID = 12104,},
									[14]={NPC = 14,X = 157,Y = 275,MapID =23,NPCID = 12105,},
									[15]={NPC = 15,X = 121,Y = 295,MapID =23,NPCID = 12106,},
									[16]={NPC = 16,X = 283,Y = 60,MapID =9,NPCID = 12107,},
									[17]={NPC = 17,X = 263,Y = 156,MapID =9,NPCID = 12108,},
									[18]={NPC = 18,X = 172,Y = 191,MapID =9,NPCID = 12109,},
									[19]={NPC = 19,X = 107,Y = 296,MapID =9,NPCID = 12110,},
									[20]={NPC = 20,X = 139,Y = 338,MapID =9,NPCID = 12111,},
									[21]={NPC = 21,X = 124,Y = 380,MapID =9,NPCID = 12112,},
									[22]={NPC = 22,X = 225,Y = 173,MapID =1,NPCID = 12113,},
									[23]={NPC = 23,X = 124,Y = 144,MapID =82,NPCID = 12114,},			
									},
								[1]={
									[1]={NPC = 1,X = 134,Y = 149,MapID =67,NPCID = 12115,},
									[2]={NPC = 2,X = 249,Y = 274,MapID =2,NPCID = 12116,},
									[3]={NPC = 3,X = 244,Y = 178,MapID =2,NPCID = 12117,},
									[4]={NPC = 4,X = 180,Y = 312,MapID =25,NPCID = 12118,},
									[5]={NPC = 5,X = 250,Y = 352,MapID =25,NPCID = 12119,},
									[6]={NPC = 6,X = 341,Y = 236,MapID =25,NPCID = 12120,},
									[7]={NPC = 7,X = 106,Y = 283,MapID =10,NPCID = 12121,},
									[8]={NPC = 8,X = 129,Y = 363,MapID =10,NPCID = 12122,},
									[9]={NPC = 9,X = 188,Y = 387,MapID =10,NPCID = 12123,},
									[10]={NPC = 10,X = 259,Y = 292,MapID =10,NPCID = 12124,},
									[11]={NPC = 11,X = 312,Y = 237,MapID =10,NPCID = 12125,},
									[12]={NPC = 12,X = 351,Y = 150,MapID =10,NPCID = 12126,},
									[13]={NPC = 13,X = 288,Y = 185,MapID =10,NPCID = 12127,},
									[14]={NPC = 14,X = 200,Y = 184,MapID =10,NPCID = 12128,},
									[15]={NPC = 15,X = 165,Y = 252,MapID =10,NPCID = 12129,},
									[16]={NPC = 16,X = 342,Y = 205,MapID =25,NPCID = 12130,},
									[17]={NPC = 17,X = 289,Y = 160,MapID =25,NPCID = 12131,},
									[18]={NPC = 18,X = 192,Y = 190,MapID =25,NPCID = 12132,},
									[19]={NPC = 19,X = 148,Y = 281,MapID =25,NPCID = 12133,},
									[20]={NPC = 20,X = 135,Y = 346,MapID =25,NPCID = 12134,},
									[21]={NPC = 21,X = 241,Y = 170,MapID =2,NPCID = 12135,},
									[22]={NPC = 22,X = 222,Y = 281,MapID =2,NPCID = 12136,},
									[23]={NPC = 23,X = 124,Y = 128,MapID =67,NPCID = 12137,},			
									},	
								}
end
--复赛评委表
if ZhiShiDaRen_FSPingWeiTable == nil then
	ZhiShiDaRen_FSPingWeiTable ={									
									[1] = {MapID = 82,X = 115,Y = 116,NPCID = 12138,},
									[2] = {MapID = 82,X = 131,Y = 117,NPCID = 12139,},
									[3] = {MapID = 82,X = 144,Y = 116,NPCID = 12140,},
									[4] = {MapID = 67,X = 119,Y = 120,NPCID = 12141,},
									[5] = {MapID = 67,X = 130,Y = 122,NPCID = 12142,},
									[6] = {MapID = 67,X = 141,Y = 123,NPCID = 12143,},
								}	
end
--初赛活动时间表
if ZhiShiDaRen_ActTime == nil then
    ZhiShiDaRen_ActTime = {RedayTime=14,StartTime=15,EndTime=16}
end
--复赛活动时间表
if ZhiShiDaRen_FSActTime == nil then
    ZhiShiDaRen_FSActTime = {RedayTime=15,StartTime=16,EndTime=17}
end 
--删除
 if ZhiShiDaRen_ActFunc ~= nil then
	API_DestroyTriggerG(ZhiShiDaRen_ActFunc)
	ZhiShiDaRen_ActFunc = nil
end
--删除
 if SpecialExchange_ActFunc ~= nil then
	API_DestroyTriggerG(SpecialExchange_ActFunc)
	SpecialExchange_ActFunc = nil
end
--
if ZhiShiDaRen_CreatePingWeiTriggerID ~= nil then
	API_DestroyTriggerG(ZhiShiDaRen_CreatePingWeiTriggerID)
	ZhiShiDaRen_CreatePingWeiTriggerID = nil
end

if ZhiShiDaRen_CreateFSPingWeiTriggerID ~= nil then
	API_DestroyTriggerG(ZhiShiDaRen_CreateFSPingWeiTriggerID)
	ZhiShiDaRen_CreateFSPingWeiTriggerID = nil
end

--判断当前所属服务器 
if API_GetServerID() == 1 or API_GetServerID() == 2	or API_GetServerID() == 3 or API_GetServerID() == 4	or API_GetServerID() == 5 or API_GetServerID() == 10 then
	SpecialExchange_ActFunc = SpecialExchange_ActFunc or API_CreateTimerTriggerG(0,0,60,-1,'SpecialExchange_ActTimeFunc')
	ZhiShiDaRen_ActFunc = ZhiShiDaRen_ActFunc or API_CreateTimerTriggerG(0,0,60,-1,'ZhiShiDaRen_ActTimeFunc')
end
if	API_VarDataGetNumber_Ex(1,0,-5001,11,1) ~= nil then
	API_VarDataLoad_Ex(1,0,-5001)
end	
--复赛获奖名单
if  ZhiShiDaRen_HJList == nil then
		ZhiShiDaRen_HJList = {}	
end
local	ZhiShiDaRen_HJListBF = {}
--临时NPC表格
local	ZhiShiDaRen_NPCList = {}
local	ZhiShiDaRen_FSNPCList ={}	
--知识达人活动公告
function ZhiShiDaRen_ActTimeFunc(a,b)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if 	API_IsBattleGameServer() then
		return
	end
	if Week == 6 then	
		local RedayTime = ZhiShiDaRen_ActTime.RedayTime
		local StartTime = ZhiShiDaRen_ActTime.StartTime
		local EndTime = ZhiShiDaRen_ActTime.EndTime
		local FSRedayTime = ZhiShiDaRen_FSActTime.RedayTime
		local FSStartTime = ZhiShiDaRen_FSActTime.StartTime
		local FSEndTime = ZhiShiDaRen_FSActTime.EndTime
		if Hour == (StartTime - 1) and Minute >= 40 then
			if math.mod(Minute,5) == 0 then
				API_ActorBroadcastMsgEx(-1,-1,0,17,'知识达人活动将于'..StartTime..'：00--'..EndTime..'：00举行，可以找主城总督、(帝国：暗礁海、阳光雨林)、(联邦：麦穗平原、珊瑚群岛)各镇长报名参加！其中获得复赛资格的玩家，可以进入争夺最后500000金币的巨额奖励。')
				API_ActorBroadcastMsgEx(-1,-1,0,8,'知识达人活动将于'..StartTime..'：00--'..EndTime..'：00举行，可以找主城总督、(帝国：暗礁海、阳光雨林)、(联邦：麦穗平原、珊瑚群岛)各镇长报名参加！其中获得复赛资格的玩家，可以进入争夺最后500000金币的巨额奖励。')
			end
		end
		if	Hour == StartTime and Minute  == 0 then
			API_ActorBroadcastMsgEx(-1,-1,0,17,'知识达人活动现在开始，可以找主城总督、(帝国：暗礁海、阳光雨林)、(联邦：麦穗平原、珊瑚群岛)各镇长报名参加！其中获得复赛资格的玩家，可以进入争夺最后500000金币的巨额奖励。')
			API_ActorBroadcastMsgEx(-1,-1,0,8,'知识达人活动现在开始，可以找主城总督、(帝国：暗礁海、阳光雨林)、(联邦：麦穗平原、珊瑚群岛)各镇长报名参加！其中获得复赛资格的玩家，可以进入争夺最后500000金币的巨额奖励。')
			API_ActorMsgBoard(0, -1, -1,'知识达人活动现在开始，可以找主城总督、各镇长报名参加！其中获得复赛资格的玩家，可以进入争夺最后500000金币的巨额奖励。')
			ZhiShiDaRen_CreatePingWeiFunc()
		end
		if Hour == (EndTime - 1) and Minute >= 45 then
			if math.mod(Minute,5) == 0 then
				API_ActorBroadcastMsgEx(-1,-1,0,17,'请注意，知识达人活动将在'..EndTime..'点结束！')
				API_ActorBroadcastMsgEx(-1,-1,0,8,'请注意，知识达人活动将在'..EndTime..'点结束！')
			end
		end
		if Hour == (EndTime - 1) and Minute == 59 then
			API_ActorBroadcastMsgEx(-1,-1,0,17,'知识达人初赛已经结束！活动NPC将在'..EndTime..'点消失！')
			API_ActorBroadcastMsgEx(-1,-1,0,8,'知识达人初赛已经结束！活动NPC将在'..EndTime..'点消失！')
		end
		if  Hour == EndTime and Minute == 0  then
			for i in ZhiShiDaRen_NPCList do
				local FastID = ZhiShiDaRen_NPCList[i]
				if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
					API_DestroyMonster(FastID)
					ZhiShiDaRen_NPCList[i] = nil
				end
			end			
		end
		if  Hour == (FSStartTime - 1) and Minute >= 40 then
			if math.mod(Minute,5) == 0 then
			API_ActorBroadcastMsgEx(-1,-1,0,17,'知识达人活动复赛将于'..FSStartTime..'：00--'..FSEndTime..'：00举行，请获得复赛资格的玩家前往主城总督府参加复赛！')
			API_ActorBroadcastMsgEx(-1,-1,0,8,'知识达人活动复赛将于'..FSStartTime..'：00--'..FSEndTime..'：00举行，请获得复赛资格的玩家前往主城总督府参加复赛！')
			end
		end	
		if Hour == FSStartTime and Minute == 0 then
			API_ActorBroadcastMsgEx(-1,-1,0,17,'知识达人活动复赛现在开始，请获得复赛资格的玩家迅速前往主城总督府参加复赛！')
			API_ActorBroadcastMsgEx(-1,-1,0,8,'知识达人活动复赛现在开始，请获得复赛资格的玩家迅速前往主城总督府参加复赛！')
			ZhiShiDaRen_CreateFSPingWeiFunc()
		end
		if Hour == (EndTime - 1) and Minute >= 45 then
			if math.mod(Minute,5) == 0 then
				API_ActorBroadcastMsgEx(-1,-1,0,17,'请参加复赛玩家注意，知识达人活动将在'..EndTime..'点结束！')
				API_ActorBroadcastMsgEx(-1,-1,0,8,'请参加复赛玩家注意，知识达人活动将在'..EndTime..'点结束！')
			end
		end
		if  Hour == FSEndTime and Minute == 0  then
			FuSaiRenShu = 0
			for i in ZhiShiDaRen_FSNPCList do
				local FastID = ZhiShiDaRen_FSNPCList[i]
				if FastID ~= nil and API_GetMonsterID(FastID) > 0 then
					API_DestroyMonster(FastID)
					ZhiShiDaRen_FSNPCList[i] = nil
				end
			end	
			for i = 1,table.getn(ZhiShiDaRen_HJList) do
				local	ActorID = ZhiShiDaRen_HJList[i].ActorID
				local	Name = ZhiShiDaRen_HJList[i].Name
				local	ZhiShiDaRen_Level = ZhiShiDaRen_HJList[i].Level
				local	ZhiShiDaRen_SJB = ZhiShiDaRen_JLTable[ZhiShiDaRen_Level].SJB * 2
				local	ZhiShiDaRen_Exp = ZhiShiDaRen_JLTable[ZhiShiDaRen_Level].Exp * 2
				if  i  <= 10 then
					JB = ZhiShiDaRen_FSJiangLiTable[i].JB
					if  API_ActorIsOnline(ActorID) then
						local	CampID = API_GetActorCamp(ActorID)
						API_ActorAddMoney(ActorID, JB, 2001, '知识达人复赛奖励')
						API_ActorBroadcastMsgEx(-1,-1,0,17,''..Name..'在复赛中表现优异，获得比赛第'..i..'名，获取'..JB..'金币的奖励！')
						API_ActorBroadcastMsgEx(-1,-1,0,8,''..Name..'在复赛中表现优异，获得比赛第'..i..'名，获取'..JB..'金币的奖励！')
						API_ActorSendMsg(ActorID,10,'由于你在知识达人比赛中表现优异，获得比赛第'..i..'名，获取'..JB..'金币的奖励！')
					else
						API_ActorBroadcastMsgEx(-1,-1,0,17,''..Name..'在复赛中表现优异，获得比赛第'..i..'名，获取'..JB..'金币的奖励！')
						API_ActorBroadcastMsgEx(-1,-1,0,8,''..Name..'在复赛中表现优异，获得比赛第'..i..'名，获取'..JB..'金币的奖励！')
						API_SendActorMoneyMail_UnLine(Name, JB, '知识达人复赛前十名奖励','由于你在知识达人比赛中表现优异，获得比赛第'..i..'名，获取'..JB..'金币的奖励！' )
					end	
				elseif	i > 10	and	i <= 100	then
					if  API_ActorIsOnline(ActorID) then	
						API_ActorAddExp(ActorID, ZhiShiDaRen_Exp, 2001, '知识达人复赛奖励')
						API_ActorShoppingM_Add(ActorID, ZhiShiDaRen_SJB, 2001, '知识达人复赛奖励')	
						API_ActorSendMsg(ActorID,10,'由于你在知识达人活动中表现优异，获取'..ZhiShiDaRen_Exp..'的经验和'..ZhiShiDaRen_SJB..'水晶币的奖励！希望你下次能够取得更好的成绩。')
					else
						local	ZhiShiDaRen_num = 0
						local	ZhiShiDaRen_num1 = 0
						local	ZhiShiDaRen_num = math.floor(ZhiShiDaRen_SJB/100)
						local	ZhiShiDaRen_num1 = math.floor(ZhiShiDaRen_Exp/100)
						API_SendActorMoneyMail_UnLineEx(ActorID, Name, 0, '知识达人复赛奖励', '由于你在知识达人活动中表现优异，获取'..ZhiShiDaRen_num1..'个经验兑换券和'..ZhiShiDaRen_num..'个水晶币兑换券的奖励！希望你下次能够取得更好的成绩。', 80696, ZhiShiDaRen_num,3, 80498,ZhiShiDaRen_num1,3,0,0,0,0,0,0,0,0,0)		
					end	
				end		
			end
		end
		if	Hour == 18 and Minute == 30  then
			local v =table.getn(ZhiShiDaRen_HJListBF)+1 	
			table.insert(ZhiShiDaRen_HJListBF,v,ZhiShiDaRen_HJList)
			ZhiShiDaRen_HJList = {}
		end			
	end
end	
--上线、换地图提示公告
function ZhiShiDaRen_OnLogin(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local StartTime = ZhiShiDaRen_ActTime.StartTime
	local EndTime = ZhiShiDaRen_ActTime.EndTime	
	local ST = ZhiShiDaRen_FSActTime.StartTime
	local ET = ZhiShiDaRen_FSActTime.EndTime
	if 	API_IsBattleGameServer() then
		return
	end	
	if	Week == 6   then
		if 	(Hour == StartTime and Minute >= 0) and (Hour == StartTime and Minute <= 60) then						
			API_ActorSendMsg(ActorID, 8,'知识达人活动于'..StartTime..'：00--'..EndTime..'：00举行，可以找主城总督、(帝国：暗礁海、阳光雨林)、(联邦：麦穗平原、珊瑚群岛)各镇长报名参加！')
			API_ActorSendMsg(ActorID, 17,'知识达人活动于'..StartTime..'：00--'..EndTime..'：00举行，可以找主城总督、(帝国：暗礁海、阳光雨林)、(联邦：麦穗平原、珊瑚群岛)各镇长报名参加！')
			API_RemoveTaskScroll(ActorID,80001)
			API_AddTaskScrollEx(ActorID,80001,104114,'ZhiShiDaRen_JuanZhou',0)
		end
		if 	(Hour == ST and Minute >= 0) and (Hour == ST and Minute <= 60) then
			API_RemoveTaskScroll(ActorID,80001)
			if	ZhiShiDaRen_FuSaiBZ == 1 then				
				API_AddTaskScrollEx(ActorID,80001,104114,'ZhiShiDaRen_JuanZhou',0)
				API_ActorSendMsg(ActorID,8,'知识达人活动复赛于'..ST..'：00--'..ET..'：00举行，请获得复赛资格的玩家迅速前往主城总督府参加复赛！')
				API_ActorSendMsg(ActorID,17,'知识达人活动复赛于'..ST..'：00--'..ET..'：00举行，请获得复赛资格的玩家迅速前往主城总督府参加复赛！')		
			end	
		end
		if 	(Hour == ET and Minute == 0) then
			API_RemoveTaskScroll(ActorID,80001)
		end	
	end	
end		
--卷轴内容	
function ZhiShiDaRen_JuanZhou() --卷轴内容
	local ActorID = ActorID or API_RequestGetActorID()	
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ServerID = API_GetServerID()
	local CampID =	API_GetActorCamp(ActorID)
	local PlayZhiShiDaRen = API_VarDataGetNumber(ActorID,1,19202) --记录知识达人活动时间
	local PlayYear = math.floor(PlayZhiShiDaRen/10000)
	local PlayMonthDay = math.mod(PlayZhiShiDaRen,10000)
	local PlayMonth = math.floor(PlayMonthDay/100)
	local PlayDay = math.mod(PlayMonthDay,100)
	if	Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
		API_VarDataSetNumber(ActorID,1,19201,0) --清除活动报名标志	
		API_VarDataSetNumber(ActorID,1,19205,0)
		API_VarDataSetNumber(ActorID,1,19207,0)
	end	
	local ZhiShiDaRen_NPCS = API_VarDataGetNumber(ActorID,1,19205) + 1      --获取初始NPC序列
	local ZhiShiDaRen_BM = API_VarDataGetNumber(ActorID,1,19201)
	local ZhiShiDaRen_FSZG = API_VarDataGetNumber(ActorID,1,19207)
	local ZhiShiDaRen_Rule = API_RequestGetNumber(1)
	local ZhiShiDaRen_FRule = API_RequestGetNumber(2)
	local ZhiShiDaRen_Time = API_RequestGetNumber(3)
	local ZhiShiDaRen_Award = API_RequestGetNumber(4)
	local ZhiShiDaRen_TypeAward = API_RequestGetNumber(5)
	API_ResponseWrite('<name>知识达人活动</name>')
	API_ResponseWrite('<win rect="620,320,320,310"></win>')
	if	ZhiShiDaRen_BM == 0 then	
		API_ResponseWrite('<br><text>  今天</text><text color="117,252,255"> 15：00--16：00</text><text> 举行知识达人答题活动，欢迎您来参加。</text><br>')
		API_ResponseWrite('<br><a href="ZhiShiDaRen_JuanZhou?1=1">  查看活动说明</a><br><br>')
		if	CampID == 0 then
			API_ResponseWrite('<br><text>现在请您前往主城总督府找</text><a color="255,0,255" mapid="82" x="127" y="168" npcid="11042" underline="1">总督</a><text>报名参加知识达人活动。</text><br>')
		else	
			API_ResponseWrite('<br><text>现在请您前往主城总督府找</text><a color="255,0,255" mapid="67" x="129" y="173" npcid="11043" underline="1">总督</a><text>报名参加知识达人活动。</text><br>')
		end	
		if	ZhiShiDaRen_Rule	==	1	then
			--玩家了解活动规则
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><a href="ZhiShiDaRen_JuanZhou?2=1" color="255,255,0">知识达人活动比赛规则</a><br>')
			API_ResponseWrite('<br><a href="ZhiShiDaRen_JuanZhou?3=1" color="255,255,0">知识达人活动时间</a><br>')
			API_ResponseWrite('<br><a href="ZhiShiDaRen_JuanZhou?4=1" color="255,255,0">知识达人活动初赛奖励</a><br>')
			API_ResponseWrite('<br><a href="ZhiShiDaRen_JuanZhou?5=1" color="255,255,0">知识达人活动复赛奖励</a><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
			API_ResponseFlush(ActorID)
		end	
		if	ZhiShiDaRen_FRule == 1 then	
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text color="255,255,255">1、周六下午16：00前，到主城总督府与总督对话报名，或者与镇长对话报名获得参加知识达人比赛资格。</text><br>')
			API_ResponseWrite('<br><text color="255,255,255">2、周六下午15：00知识达人初赛活动开始，将刷新出现23名初赛评委，玩家按照评委序号依次回答问题，活动日答对16道以上题目(含16道题目)，用时最短的50名玩家获得复赛资格。</text><br>')
			API_ResponseWrite('<br><text color="255,255,255">3、周六下午16：00知识达人复赛活动开始，在主城总督府将会出现3名复赛评委，获得复赛资格的玩家任意选择评委回答复赛题目，按照题目答对的数量排列复赛名次(相同答对题目数量，比较所用时间少的排名在前)。</text><br>')
			API_ResponseWrite('<br><a href="ZhiShiDaRen_JuanZhou?1=1" color="255,255,0">返回上一层</a><br>')	
			API_ResponseFlush(ActorID)	
		end	
		if  ZhiShiDaRen_Award == 1 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text color="255,255,255">1、知识达人初赛活动中，答对评委所出问题即可获得当前玩家等级对应额外的经验和水晶币，并且根据答对题目数量获得相应增长系数。(列如：玩家在答对一题前提下，答对第二道题目即可获得相应经验和水晶币奖励，答对的题目越多，额外获得奖励越多，答对全部题目即可获得当前等级段，知识达人活动满额经验。)</text><br>')
			API_ResponseWrite('<br><text color="255,255,255">2、知识达人初赛活动中，将有一定几率出现带有绿色、紫色题目，答对即可获得当前等级段所需的珍贵物品。(例如：升级魔晶、合成魔晶、各类型攻击宝石、生命宝石、打造配方等等)</text><br>')
			API_ResponseWrite('<br><a href="ZhiShiDaRen_JuanZhou?1=1" color="255,255,0">返回上一层</a><br>')	
		end	
		if  ZhiShiDaRen_Time == 1 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text color="255,255,255">1、知识达人初赛活动时间：周六的15：00-16：00.</text><br>')
			API_ResponseWrite('<br><text color="255,255,255">2、知识达人复赛活动时间：周六的16：00-17：00.</text><br>')
			API_ResponseWrite('<br><text color="255,255,255">3、知识达人复赛发奖时间：周六的17：00-17：10.</text><br>')
			API_ResponseWrite('<br><a href="ZhiShiDaRen_JuanZhou?1=1" color="255,255,0">返回上一层</a><br>')						
		end
		if  ZhiShiDaRen_TypeAward == 1 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text color="255,255,255">1、知识达人复赛中，获得第1名将有500000金币的巨额奖励。</text><br>')
			API_ResponseWrite('<br><text color="255,255,255">2、知识达人复赛中，获得2到10名的玩家，也将获得大量金币奖励。</text><br>')
			API_ResponseWrite('<br><text color="255,255,255">3、知识达人复赛中，未能获得前10的复赛玩家，将会获得答题经验和水晶币奖励。</text><br>')
			API_ResponseWrite('<br><a href="ZhiShiDaRen_JuanZhou?1=1" color="255,255,0">返回上一层</a><br>')						
		end
	else
		if	ZhiShiDaRen_NPCS <= 23	then
			local NPCID = ZhiShiDaRen_PingWeiTable[CampID][ZhiShiDaRen_NPCS].NPCID
			local X = ZhiShiDaRen_PingWeiTable[CampID][ZhiShiDaRen_NPCS].X
			local Y = ZhiShiDaRen_PingWeiTable[CampID][ZhiShiDaRen_NPCS].Y
			local MapID = ZhiShiDaRen_PingWeiTable[CampID][ZhiShiDaRen_NPCS].MapID
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>依照答题顺序，现在请您前往</text><a color="255,0,255" mapid="'..MapID..'" x="'..X..'" y="'..Y..'" npcid="'..NPCID..'" underline="1">'..ZhiShiDaRen_NPCS..'号评委</a><text>处答题。</text><br>')	
			API_ResponseWrite('<br><text>请仔细回答每一道题目，希望您获得100000金币大奖。</text><br>')
		end	
		if	ZhiShiDaRen_FSZG == 1 then
			API_ResponseWrite('<name></name>')
			if	CampID == 0 then
				API_ResponseWrite('<br><text>恭喜您获得复赛资格，请在今天16：00--17：00</text><a color="255,0,255" mapid="82" x="167" y="128" npcid="11042" underline="1">总督府</a><text>参加知识达人复赛活动。</text><br>')
			else	
				API_ResponseWrite('<br><text>恭喜您获得复赛资格，请在今天16：00--17：00</text><a color="255,0,255" mapid="67" x="129" y="173" npcid="11043" underline="1">总督府</a><text>参加知识达人复赛活动。</text><br>')
			end
			API_ResponseWrite('<br><text>千万别忘记参加，500000金币大奖已经在向您招手。</text><br>')
		end	
	end
end
--创建海选评委NPC
function ZhiShiDaRen_CreatePingWeiFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	for i = 1,table.getn(ZhiShiDaRen_PingWeiTable[0]) do
		local NPCS = ZhiShiDaRen_PingWeiTable[0][i].NPC
		local NPCID = ZhiShiDaRen_PingWeiTable[0][i].NPCID
		local X = ZhiShiDaRen_PingWeiTable[0][i].X
		local Y = ZhiShiDaRen_PingWeiTable[0][i].Y
		local MapID = ZhiShiDaRen_PingWeiTable[0][i].MapID	
		local RightMapID = API_GetRightMapID(MapID)
		if API_MapIsValid(RightMapID) then	
			local FastID = API_CreateMonster(RightMapID,NPCID,X,Y,5,0,-1)
			API_SetMonsterName(FastID, ''..NPCS..'号评委', 1)
			table.insert(ZhiShiDaRen_NPCList,FastID)
		end
	end
	for j = 1,table.getn(ZhiShiDaRen_PingWeiTable[1]) do
		local NPCS = ZhiShiDaRen_PingWeiTable[1][j].NPC
		local NPCID = ZhiShiDaRen_PingWeiTable[1][j].NPCID
		local X = ZhiShiDaRen_PingWeiTable[1][j].X
		local Y = ZhiShiDaRen_PingWeiTable[1][j].Y
		local MapID = ZhiShiDaRen_PingWeiTable[1][j].MapID	
		local RightMapID = API_GetRightMapID(MapID)
		if API_MapIsValid(RightMapID) then	
			local FastID = API_CreateMonster(RightMapID,NPCID,X,Y,5,0,-1)
			API_SetMonsterName(FastID, ''..NPCS..'号评委', 1)
			table.insert(ZhiShiDaRen_NPCList,FastID)
		end
	end
end
--创建复赛评委	
function ZhiShiDaRen_CreateFSPingWeiFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	for i = 1,table.getn(ZhiShiDaRen_FSPingWeiTable) do
		local NPCS = ZhiShiDaRen_FSPingWeiTable[i].NPC
		local NPCID = ZhiShiDaRen_FSPingWeiTable[i].NPCID
		local X = ZhiShiDaRen_FSPingWeiTable[i].X
		local Y = ZhiShiDaRen_FSPingWeiTable[i].Y
		local MapID = ZhiShiDaRen_FSPingWeiTable[i].MapID	
		local RightMapID = API_GetRightMapID(MapID)
		if API_MapIsValid(RightMapID) then	
			local FastID = API_CreateMonster(RightMapID,NPCID,X,Y,5,0,-1)
			API_SetMonsterName(FastID, '复赛评委', 1)
			table.insert(ZhiShiDaRen_FSNPCList,FastID)
		end
	end
end	
--活动报名
function ZhiShiDaRen_PlayMoney_Title(ActorID,NPCID)
	local ActorID = ActorID or API_RequestGetActorID()	
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local RedayTime= ZhiShiDaRen_ActTime.RedayTime
	local StartTime = ZhiShiDaRen_ActTime.StartTime
	local EndTime = ZhiShiDaRen_ActTime.EndTime
	local CampID =	API_GetActorCamp(ActorID)	
	local NPCID = ZhiShiDaRen_PingWeiTable[CampID][1].NPCID
	local X = ZhiShiDaRen_PingWeiTable[CampID][1].X
	local Y = ZhiShiDaRen_PingWeiTable[CampID][1].Y
	local MapID = ZhiShiDaRen_PingWeiTable[CampID][1].MapID
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711) --
	local BaoMing = API_RequestGetNumber(1)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local JW = API_GetActorPeerageLevel(ActorID)
		--判断当前时间清除玩家身上交互数据
	local ZhiShiDaRenHD = Year * 10000 + Month * 100 + Day
	local PlayZhiShiDaRen = API_VarDataGetNumber(ActorID,1,19202) --记录知识达人活动时间
	local PlayYear = math.floor(PlayZhiShiDaRen/10000)
	local PlayMonthDay = math.mod(PlayZhiShiDaRen,10000)
	local PlayMonth = math.floor(PlayMonthDay/100)
	local PlayDay = math.mod(PlayMonthDay,100)
	if	Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
		API_VarDataSetNumber(ActorID,1,19201,0) --清除活动报名标志	
		API_VarDataSetNumber(ActorID,1,19203,0) --清除答对题目个数
		API_VarDataSetNumber(ActorID,1,19205,0)
		API_VarDataSetNumber(ActorID,1,19207,0)
		API_VarDataSetNumber(ActorID,1,19209,0) --清除答对题目数量
		API_VarDataSetNumber(ActorID,1,19210,0) --清除已经回答题目数
	end	
	local HuoDong = API_VarDataGetNumber(ActorID,1,19201)
	local Npcs = API_VarDataGetNumber(ActorID,1,19205) --存储NPC序列
	if Week == 6  then	
		--玩家报名参加活动
		if	Hour >= EndTime and Minute >=0 then
			API_ResponseWrite('<br><text color="255,0,0">很遗憾，知识达人活动初赛时间已经结束，请下周再来参与。</text><br>')
			API_ResponseWrite('<br><a>离开</a><br>')
		else	
			if	Npcs >= 23	then
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text color="255,0,0">你已经完成知识达人活动初赛阶段所有题目，请下周再来参与。</text><br>')
				API_ResponseWrite('<br><text color="255,0,0">如果你已经获得复赛资格，请不要忘记下午16:00参加知识达人复赛活动。</text><br>')
				API_ResponseWrite('<br><text color="255,0,0">温馨提示：知识达人活动复赛第一名，将会获得500000金币的巨额奖励。</text><br>')
				API_ResponseWrite('<br><a>离开</a><br>')
			else
				if	HuoDong == 1  then		
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text color="255,0,0">您已经获得了参加知识达人比赛的资格，请尽快去各评委处回答问题。</text><br>')
					API_ResponseWrite('<br><text color="255,0,0">温馨提示：在您回答问题的过程中，将会随机获得绿色和紫色题库，答对即可获得珍贵物品奖励。</text><br>')
					API_ResponseWrite('<br><text>请您在活动时间15：00-16：00，前往</text><a color="255,0,255" mapid="'..MapID..'" x="'..X..'" y="'..Y..'" npcid="'..NPCID..'" underline="1">1号评委</a><text>处答题。</text><br>')
					API_ResponseWrite('<br><a>离开</a><br>')	
					API_ResponseFlush(ActorID)	
				elseif  BaoMing == 1 then
					API_VarDataSetNumber(ActorID,1,19201,1)  --记录标志到交互数据
					API_VarDataSetNumber(ActorID,1,19202,ZhiShiDaRenHD)
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text color="255,0,0">您已经获得了参加知识达人比赛的资格，请尽快去各评委处回答问题。</text><br>')
					API_ResponseWrite('<br><text color="255,0,0">祝您在初赛答题中获得好运。</text><br>')
					API_ResponseWrite('<br><text>请您在活动时间15：00-16：00，前往</text><a color="255,0,255" mapid="'..MapID..'" x="'..X..'" y="'..Y..'" npcid="'..NPCID..'" underline="1">1号评委</a><text>处答题。</text><br>')
					API_ResponseWrite('<br><a>离开</a><br>')	
					API_ResponseFlush(ActorID)
					if  Hour == (EndTime - 1) and Minute >= 55 then
						API_ActorSendMsg(ActorID,10,'知识达人活动还有'..Minute..'将结束比赛，请您抓紧时间到各评委处答题。')
					end
					--风向标-报名人数统计
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					local Type = 30
					local Serial = 47
					local Number = 1
					if GLOBAL_FengXiangBiao_DateList[Type][Serial][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[Type][Serial][LaiYuan] = Number
					else
						GLOBAL_FengXiangBiao_DateList[Type][Serial][LaiYuan]  = GLOBAL_FengXiangBiao_DateList[Type][Serial][LaiYuan]  + Number
					end
					--风向标-爵位
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					local Type = 30
					local Serial = 48 + JW
					local Number = 1
					if GLOBAL_FengXiangBiao_DateList[Type][Serial][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[Type][Serial][LaiYuan] = Number
					else
						GLOBAL_FengXiangBiao_DateList[Type][Serial][LaiYuan]  = GLOBAL_FengXiangBiao_DateList[Type][Serial][LaiYuan]  + Number
					end
				else
					API_ResponseWrite('<name></name>')
					API_ResponseWrite('<br><text color="255,0,0">展示你渊博的知识，显示你知识达人的魅力，答对评委所出的题目将获得丰厚的奖励.</text><br>')
					API_ResponseWrite('<br><text color="255,0,0">活动日答对16道以上题目(含16道题目)，用时最短的50名玩家获得复赛资格，就可以进入争夺最后500000金币的巨额奖励。</text><br>')
					API_ResponseWrite('<br><br><a href="ZhiShiDaRen_PlayMoney_Title?1=1">确认报名</a><br>')
					API_ResponseWrite('<br><a>离开</a><br>')	
					API_ResponseFlush(ActorID)
				end		
			end
		end
	else
		API_ResponseWrite('<br><text color="255,255,255">感谢你对知识达人活动的关注，不过现在还不是活动时间。</text><br>')	
		API_ResponseWrite('<br><text color="255,255,255">知识达人活动将在周六举行，欢迎你到时参加。</text><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
		API_ResponseFlush(ActorID)
	end	
end		
--活动规则介绍
function ZhiShiDaRen_Rule_Title(ActorID,NPCID)	
	if 	ActorID == nil then
		ActorID = API_RequestGetActorID()
	end		
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local CampID =	API_GetActorCamp(ActorID)
	local ZhiShiDaRen_Rule = API_RequestGetNumber(1)
	local ZhiShiDaRen_FRule = API_RequestGetNumber(2)
	local ZhiShiDaRen_Time = API_RequestGetNumber(3)
	local ZhiShiDaRen_Award = API_RequestGetNumber(4)
	local ZhiShiDaRen_TypeAward = API_RequestGetNumber(5)		
	--玩家了解活动规则
	API_ResponseWrite('<name></name>')
	API_ResponseWrite('<br><a href="ZhiShiDaRen_Rule_Title?2=1" color="255,255,0">知识达人活动比赛规则</a><br>')
	API_ResponseWrite('<br><a href="ZhiShiDaRen_Rule_Title?3=1" color="255,255,0">知识达人活动时间</a><br>')
	API_ResponseWrite('<br><a href="ZhiShiDaRen_Rule_Title?4=1" color="255,255,0">知识达人活动初赛奖励</a><br>')
	API_ResponseWrite('<br><a href="ZhiShiDaRen_Rule_Title?5=1" color="255,255,0">知识达人活动复赛奖励</a><br>')
	API_ResponseWrite('<br><a>离开</a><br>')
	API_ResponseFlush(ActorID)
	if	ZhiShiDaRen_FRule == 1 then	
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text color="255,255,255">1、周六下午16：00前，到主城总督府与总督对话报名，或者与(帝国：暗礁海、阳光雨林)、(联邦：麦穗平原、珊瑚群岛)镇长对话报名获得参加知识达人比赛资格。</text><br>')
		API_ResponseWrite('<br><text color="255,255,255">2、周六下午15：00知识达人初赛活动开始，将在(帝国：钢铁城、暗礁海、阳光雨林)、(联邦：天空城、麦穗平原、珊瑚群岛)各自出现23名初赛评委，玩家按照评委序号依次回答问题，活动日答对16道以上题目(含16道题目)，用时最短的50名玩家获得复赛资格。</text><br>')
		API_ResponseWrite('<br><text color="255,255,255">3、周六下午16：00知识达人复赛活动开始，在主城总督府将会出现3名复赛评委，获得复赛资格的玩家任意选择评委回答复赛题目，按照题目答对的数量排列复赛名次(相同答对题目数量，比较所用时间少的排名在前)。</text><br>')
		API_ResponseWrite('<br><a href="ZhiShiDaRen_Rule_Title?1=1" color="255,255,0">返回上一层</a><br>')	
		API_ResponseFlush(ActorID)	
	end	
	if  ZhiShiDaRen_Award == 1 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text color="255,255,255">1、知识达人初赛活动中，答对评委所出问题即可获得当前玩家等级对应额外的经验和水晶币，并且根据答对题目数量获得相应增长系数。(列如：玩家在答对一题前提下，答对第二道题目即可获得相应经验和水晶币奖励，答对的题目越多，额外获得奖励越多，答对全部题目即可获得当前等级段，知识达人活动满额经验。)</text><br>')
		API_ResponseWrite('<br><text color="255,255,255">2、知识达人初赛活动中，将有一定几率出现带有绿色、紫色题目，答对即可获得当前等级段所需的珍贵物品。(例如：升级魔晶、合成魔晶、各类型攻击宝石、生命宝石、打造配方等等)</text><br>')
		API_ResponseWrite('<br><a href="ZhiShiDaRen_Rule_Title?1=1" color="255,255,0">返回上一层</a><br>')	
	end	
	if  ZhiShiDaRen_Time == 1 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text color="255,255,255">1、知识达人初赛活动时间：周六的15：00-16：00.</text><br>')
		API_ResponseWrite('<br><text color="255,255,255">2、知识达人复赛活动时间：周六的16：00-17：00.</text><br>')
		API_ResponseWrite('<br><text color="255,255,255">3、知识达人复赛发奖时间：周六的17：00-17：10.</text><br>')
		API_ResponseWrite('<br><a href="ZhiShiDaRen_Rule_Title?1=1" color="255,255,0">返回上一层</a><br>')						
	end
	if  ZhiShiDaRen_TypeAward == 1 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text color="255,255,255">1、知识达人复赛中，获得第1名将有500000金币的巨额奖励。</text><br>')
		API_ResponseWrite('<br><text color="255,255,255">2、知识达人复赛中，获得2到10名的玩家，也将获得大量金币奖励。</text><br>')
		API_ResponseWrite('<br><text color="255,255,255">3、知识达人复赛中，未能获得前10的复赛玩家，将会获得答题经验和水晶币奖励。</text><br>')
		API_ResponseWrite('<br><a href="ZhiShiDaRen_Rule_Title?1=1" color="255,255,0">返回上一层</a><br>')						
	end
end
--19203-19300	
--玩家初赛答题	
function	ZhiShiDaRen_NpcMove(ActorID,NPCID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ActorID = ActorID or API_RequestGetActorID()
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711) 
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)or NPCFastID
	local CampID =	API_GetActorCamp(ActorID)	
	local JW = API_GetActorPeerageLevel(ActorID)
	local Level = API_GetActorExpLevel(ActorID)
	local KongJian = API_ActorGetPackageSize(ActorID)
	local Name = API_GetActorName(ActorID)
	local ZhiShiDaRen_XuanZe = API_RequestGetNumber(1)
	--判断当前时间清除玩家身上交互数据
	local ZhiShiDaRen = Year * 10000 + Month * 100 + Day
	local PlayZhiShiDaRen = API_VarDataGetNumber(ActorID,1,19202) --记录知识达人活动时间
	local PlayYear = math.floor(PlayZhiShiDaRen/10000)
	local PlayMonthDay = math.mod(PlayZhiShiDaRen,10000)
	local PlayMonth = math.floor(PlayMonthDay/100)
	local PlayDay = math.mod(PlayMonthDay,100)
	if	Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then	
		API_VarDataSetNumber(ActorID,1,19205,0) --npc序列
		API_VarDataSetNumber(ActorID,1,19203,0) --清除答对题目个数
		API_VarDataSetNumber(ActorID,1,19201,0) --清除活动报名标志
		API_VarDataSetNumber(ActorID,1,19207,0) --清除参加参加复赛的标志
	end
	local ZhiShiDaRen_JiFen = API_VarDataGetNumber(ActorID,1,19204) --获取知识达人活动中累积的答对积分
	local ZhiShiDaRen_TrueNumber = API_VarDataGetNumber(ActorID,1,19203) --获取答对题目个数
	local ZhiShiDaRen_NPCS = API_VarDataGetNumber(ActorID,1,19205) + 1      --获取初始NPC序列
	local ZhiShiDaRen_FuSaiBZ = API_VarDataGetNumber(ActorID,1,19207)
	local ZhiShiDaRen_HuoDong = API_VarDataGetNumber(ActorID,1,19201)   --读取活动报名标志
	if  ZhiShiDaRen_HuoDong == 0 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>对不起，你还没有找总督报名不能参加知识达人活动，请你现在去主城总督府找总督报名后参加活动。</text><br>')
		API_ResponseWrite('<br><text>参加知识达人比赛，你将会获得丰厚的奖励，如果你能够进入复赛，不但可以获得更为丰厚的奖励，还有可能获得知识达人的魅力称号。</text><br>')
		API_ResponseWrite('<br><a>离开</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
--答对题目获取奖励
	if ZhiShiDaRen_XuanZe == 1 then
		API_VarDataSetNumber(ActorID,1,19205,ZhiShiDaRen_NPCS)
		API_VarDataSetNumber(ActorID,1,19208,0)
		if	ZhiShiDaRen_NPCS == 24	then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>感谢您参加本次知识达人活动，你本次答题已经结束，请您下次再来参加。</text><br>')
			API_ResponseWrite('<br><text>本次知识达人活动所有问题，您已经回答完毕，请下次再来参加。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
		elseif ZhiShiDaRen_NPCS == 23 then
			local ZhiShiDaRen_Ture = API_RequestGetNumber(2)
				if  ZhiShiDaRen_Ture == 1 then
					local	ZhiShiDaRen_TrueNumber = ZhiShiDaRen_TrueNumber+1
					API_VarDataSetNumber(ActorID,1,19203,ZhiShiDaRen_TrueNumber)   --如果本道题目答对，存储答对数目
					local ZhiShiDaRen_Type = API_VarDataGetNumber(ActorID,1,19206) --获取题目类型
					--答对题目获得经验和金币奖励
					local XS = ZhiShiDaRen_JLleixingTable[ZhiShiDaRen_Type].XS 
					local XX = ZhiShiDaRen_JLXXTable[ZhiShiDaRen_TrueNumber].XX * 2
					local SJBJiangLi = ZhiShiDaRen_JLTable[Level].SJB * XS * XX
					local JYJiangLi	= ZhiShiDaRen_JLTable[Level].Exp * XS * XX
					local DSJBJiangLi = math.floor(SJBJiangLi/1000000)
					local DJYJiangLi = math.floor(JYJiangLi/1000000)	
					API_ActorAddExp(ActorID, DJYJiangLi, 2001, '知识达人奖励')
					API_ActorShoppingM_Add(ActorID, DSJBJiangLi, 2001, '知识达人奖励')	
					API_ActorSendMsg(ActorID, 8, '恭喜您答对本道题目，您将获得'..DJYJiangLi..'经验和'..DSJBJiangLi..'水晶币的奖励。')
					if	NPCID == ZhiShiDaRen_PingWeiTable[CampID][23].NPCID then
						if  ZhiShiDaRen_TrueNumber >= 16 and  ZhiShiDaRen_FuSaiRenShu <= 50 then
								ZhiShiDaRen_FuSaiRenShu	=	ZhiShiDaRen_FuSaiRenShu	+ 1
								API_VarDataSetNumber(ActorID,1,19207,1)    --复赛标志
							API_ResponseWrite('<br><text>恭喜您获得进入复赛资格，希望你取得好成绩。</text><br>')
							API_ResponseWrite('<br><text>恭喜您获得进入复赛资格，希望你能在复赛取得好成绩，赢取500000金币的巨额奖励。</text><br>')
							API_ActorBroadcastMsgEx(-1,-1,0,17,''..Name..'在答题活动中脱颖而出，获得进入复赛资格。')
							--风向标-复赛
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							local Type1 = 30
							local Serial = 48
							local Number = 1
							if GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] = Number
							else
								GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  = GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  + Number
							end
						else
						API_ResponseWrite('<br><text>很遗憾您没有达到进入复赛的要求，希望您下次能够取得好成绩。</text><br>')
						end							
					--随机到带颜色的题目奖励
						API_ResponseWrite('<name></name>')
						API_ResponseWrite('<br><text>恭喜您答对本道题目，您将获得'..DJYJiangLi..'经验和'..DSJBJiangLi..'水晶币的奖励。</text><br>')						
						API_ResponseWrite('<br><a>确定</a><br>')
						API_ResponseFlush(ActorID)
						if ZhiShiDaRen_Type ~= 1 then
							local JiangLiDG = math.random(1,100)
							local DG = 0
							if ZhiShiDaRen_Type == 2 then
								if  1 <= JiangLiDG and JiangLiDG <= 98then
									DG = 1
								elseif JiangLiDG == 99 then
										DG = 2
										else
											DG = 3
								end
							elseif	ZhiShiDaRen_Type == 3 then
									if  1 <= JiangLiDG and JiangLiDG <=60 then 
										DG = 1
									elseif JiangLiDG == 61 then
											DG =2
											else
												DG = 3
								end
							end	
							local JiangLiTable = ZhiShiDaRen_AnswerJiangLiTable[JW][ZhiShiDaRen_Type][DG]
							local JiangLiNum = 0
							local GaiLv = math.random(10000000)
							for i in JiangLiTable do
								local GaiLv1 = JiangLiTable[i].GaiLv1
								local GaiLv2 = JiangLiTable[i].GaiLv2
								if  GaiLv1 <= GaiLv and  GaiLv <= GaiLv2 then
									local GoodsID = JiangLiTable[i].GoodsID
									local GoodsName = API_GetGoodsName(GoodsID)									
									local NumGaiLv = JiangLiTable[i].NumGaiLv
									local NumMax = JiangLiTable[i].NumMax
									local NumMin = JiangLiTable[i].NumMin
									local NumRandom = math.random(10000)
									if  NumRandom <= NumGaiLv then
										JiangLiNum = NumMax
									else
										JiangLiNum = NumMin
									end		
									if  KongJian >= 1 then
										API_AddActorGoods(ActorID, GoodsID, JiangLiNum, '知识达人特殊奖励')
										API_ActorSendMsg(ActorID, 8, '恭喜'..Name..'答对本道题目，将获得'..GoodsName..'的奖励。')
										API_ActorBroadcastMsgEx(-1,-1,0,17,'恭喜'..Name..'在答题活动中，幸运获得'..GoodsName..'的奖励。')
									else
										API_SendActorMail(ActorID, GoodsID,JiangLiNum, '知识达人奖励', '恭喜您在知识达人活动获取奖励。')
										API_ActorSendMsg(ActorID, 8, '恭喜'..Name..'答对本道题目，将获得'..GoodsName..'的奖励。')
										API_ActorBroadcastMsgEx(-1,-1,0,17,''..Name..'在答题活动中人品爆发，获得'..GoodsName..'的奖励。物品已经发放到邮箱，请注意查收。')
									end
									API_VarDataSetNumber(ActorID,1,19206,0)	
								end
							end
						end
					end
					--风向标
					local LaiYuan = API_ActorGetPropNum(ActorID,201)
					local Type1 = 30
					local Serial = ZhiShiDaRen_TrueNumber
					local Number = 1
					if GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] = Number
					else
						GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  = GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  + Number
					end
					if ZhiShiDaRen_Type == 2 then
						Serial = 61
					elseif ZhiShiDaRen_Type == 3 then
						Serial = 60
					end
					if Serial == 60 or Serial == 61 then
						local Number = 1
						if GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] = Number
						else
							GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  = GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  + Number
						end
					end
				else 
					local	ZhiShiDaRen_TrueNumber = API_VarDataGetNumber(ActorID,1,19203)
					if	NPCID == ZhiShiDaRen_PingWeiTable[CampID][23].NPCID then
						if  ZhiShiDaRen_TrueNumber >= 16  and  ZhiShiDaRen_FuSaiRenShu <= 50 then
								ZhiShiDaRen_FuSaiRenShu	 =	ZhiShiDaRen_FuSaiRenShu	+ 1
								API_VarDataSetNumber(ActorID,1,19207,1)    --复赛标志
							API_ResponseWrite('<br><text>恭喜您获得进入复赛资格，希望你取得好成绩。</text><br>')
							API_ActorBroadcastMsgEx(-1,-1,0,17,''..Name..'在答题活动中脱颖而出，获得进入复赛资格。')
							--风向标-复赛
							local LaiYuan = API_ActorGetPropNum(ActorID,201)
							local Type1 = 30
							local Serial = 48
							local Number = 1
							if GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] == nil then
								GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] = Number
							else
								GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  = GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  + Number
							end
						else
						API_ResponseWrite('<br><text>很遗憾您没有达到进入复赛的要求，希望您下次能够取得好成绩。</text><br>')
						end
					end	
				end		
		elseif  ZhiShiDaRen_NPCS < 23	then
			local ZhiShiDaRen_NNPCS = ZhiShiDaRen_NPCS + 1
			local ZhiShiDaRen_Ture = API_RequestGetNumber(2)
			local NNPCID = ZhiShiDaRen_PingWeiTable[CampID][ZhiShiDaRen_NNPCS].NPCID
			local NX = ZhiShiDaRen_PingWeiTable[CampID][ZhiShiDaRen_NNPCS].X
			local NY = ZhiShiDaRen_PingWeiTable[CampID][ZhiShiDaRen_NNPCS].Y
			local NMapID = ZhiShiDaRen_PingWeiTable[CampID][ZhiShiDaRen_NNPCS].MapID
			if  ZhiShiDaRen_Ture == 1 then
				local	ZhiShiDaRen_TrueNumber = ZhiShiDaRen_TrueNumber+1
				API_VarDataSetNumber(ActorID,1,19203,ZhiShiDaRen_TrueNumber)   --如果本道题目答对，存储答对数目
				local ZhiShiDaRen_Type = API_VarDataGetNumber(ActorID,1,19206) --获取题目类型
				--答对题目获得经验和金币奖励
				local XS = ZhiShiDaRen_JLleixingTable[ZhiShiDaRen_Type].XS 
				local XX = ZhiShiDaRen_JLXXTable[ZhiShiDaRen_TrueNumber].XX * 2
				local SJBJiangLi = ZhiShiDaRen_JLTable[Level].SJB * XS * XX
				local JYJiangLi	= ZhiShiDaRen_JLTable[Level].Exp * XS * XX
				local DSJBJiangLi = math.floor(SJBJiangLi/1000000)
				local DJYJiangLi = math.floor(JYJiangLi/1000000)			
			--随机到带颜色的题目奖励
				API_ActorAddExp(ActorID, DJYJiangLi, 2001, '知识达人特殊奖励')
				API_ActorShoppingM_Add(ActorID, DSJBJiangLi, 2001, '知识达人奖励')
				API_ActorSendMsg(ActorID, 8, '恭喜您答对本道题目，您将获得'..DJYJiangLi..'经验和'..DSJBJiangLi..'水晶币的奖励。')
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>恭喜您答对本道题目，您将获得'..DJYJiangLi..'经验和'..DSJBJiangLi..'水晶币的奖励。</text><br>')
				API_ResponseWrite('<br><text>恭喜您答对本道题目，现在请您前往</text><a color="255,0,255" mapid="'..NMapID..'" x="'..NX..'" y="'..NY..'" npcid="'..NNPCID..'" underline="1">'..ZhiShiDaRen_NNPCS..'号评委</a><text>处答题。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				if ZhiShiDaRen_Type ~= 1 then
					local DG = 0
					local JiangLiDG = math.random(1,100)					
					if ZhiShiDaRen_Type == 2 then
						if  1 <= JiangLiDG and JiangLiDG <= 98then
							DG = 1
						elseif JiangLiDG == 99 then
								DG = 2
								else
									DG = 3
						end
					elseif	ZhiShiDaRen_Type == 3 then
							if  1 <= JiangLiDG and JiangLiDG <=60 then 
								DG = 1
							elseif JiangLiDG == 61 then
									DG =2
									else
										DG = 3
							end
					end	
					local JiangLiTable = ZhiShiDaRen_AnswerJiangLiTable[JW][ZhiShiDaRen_Type][DG]
					local JiangLiNum = 0
					local GaiLv = math.random(10000000)
					for i in JiangLiTable do
						local GaiLv1 = JiangLiTable[i].GaiLv1
						local GaiLv2 = JiangLiTable[i].GaiLv2
						if  GaiLv1 <= GaiLv and  GaiLv <= GaiLv2 then
							local GoodsID = JiangLiTable[i].GoodsID
							local GoodsName = API_GetGoodsName(GoodsID)
							local NumGaiLv = JiangLiTable[i].NumGaiLv
							local NumMax = JiangLiTable[i].NumMax
							local NumMin = JiangLiTable[i].NumMin
							local NumRandom = math.random(10000)
							if  NumRandom <= NumGaiLv then
								JiangLiNum = NumMax
							else
								JiangLiNum = NumMin
							end		
							if  KongJian >= 1 then
								API_AddActorGoods(ActorID, GoodsID, JiangLiNum, '知识达人特殊奖励')
								API_ActorBroadcastMsgEx(-1,-1,0,17,'恭喜'..Name..'在答题活动中，幸运获得'..GoodsName..'的奖励。')
								API_ActorSendMsg(ActorID, 8, '恭喜'..Name..'在答题活动中，幸运获得'..GoodsName..'的奖励。')
							else
								API_SendActorMail(ActorID, GoodsID,JiangLiNum, '知识达人奖励', '恭喜您在知识达人活动获取奖励。')
								API_ActorSendMsg(ActorID, 8, '恭喜'..Name..'在答题活动中，幸运获得'..GoodsName..'的奖励。')
								API_ActorBroadcastMsgEx(-1,-1,0,17,''..Name..'在答题活动中人品爆发，获得'..GoodsName..'的奖励。物品已经发放到邮箱，请注意查收。')
							end
							API_VarDataSetNumber(ActorID,1,19206,0)	
						end
					end
				end	
				--风向标
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type1 = 30
				local Serial = ZhiShiDaRen_TrueNumber
				local Number = 1
				if GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] = Number
				else
					GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  = GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  + Number
				end
				if ZhiShiDaRen_Type == 2 then
					Serial = 61
				elseif ZhiShiDaRen_Type == 3 then
					Serial = 60
				end
				if Serial == 60 or Serial == 61 then
					local Number = 1
					if GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] = Number
					else
						GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  = GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  + Number
					end
				end
			elseif	ZhiShiDaRen_NPCS < 23  then		
				--告诉玩家他答错了
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>很抱歉您答错本道题目，无法获得奖励，请您不要气馁，更好奖励在等着您。</text><br>')
				API_ResponseWrite('<br><text>很抱歉您答错本道题目，现在请您前往</text><a color="255,0,255" mapid="'..NMapID..'" x="'..NX..'" y="'..NY..'" npcid="'..NNPCID..'" underline="1">'..ZhiShiDaRen_NNPCS..'号评委</a><text>处答题。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
				API_VarDataSetNumber(ActorID,1,19206,0)	
			end
		end	
	else
		if	ZhiShiDaRen_NPCS == 24	then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>感谢您参加本次知识达人活动，你本次答题已经结束，请您下次再来参加。</text><br>')
			API_ResponseWrite('<br><text>本次知识达人活动所有问题，您已经回答完毕，请下次再来参加。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)	
		end	
		if ZhiShiDaRen_NPCS < 24 then 
			local NpcID = ZhiShiDaRen_PingWeiTable[CampID][ZhiShiDaRen_NPCS].NPCID
			local X = ZhiShiDaRen_PingWeiTable[CampID][ZhiShiDaRen_NPCS].X
			local Y = ZhiShiDaRen_PingWeiTable[CampID][ZhiShiDaRen_NPCS].Y
			local MapID = ZhiShiDaRen_PingWeiTable[CampID][ZhiShiDaRen_NPCS].MapID
			if	NPCID == ZhiShiDaRen_PingWeiTable[CampID][ZhiShiDaRen_NPCS].NPCID then   --如果当前回传NPCID==要求的正确NPCID号，继续
				local QuestionNo = math.random(table.getn(ZhiShiDaRen_QuestionList)) --在问题表中随机取出问题序号					
				local QuestionType = math.random(1,10000)               --随机选择问题的颜色
				local ZhiShiDaRen_Type = API_VarDataGetNumber(ActorID,1,19206)
				if	1 <= QuestionType and QuestionType <= 9659 then
					ZhiShiDaRen_Type= 1
					R,G,B = 255,255,255
					elseif 9659 < QuestionType and QuestionType <= 9886 then
						ZhiShiDaRen_Type= 3
						R,G,B = 0,255,0
						else 
						ZhiShiDaRen_Type= 2
						R,G,B = 255,0,255	
				end
				if	API_VarDataGetNumber(ActorID,1,19208) > 0 then					
					QuestionNo = API_VarDataGetNumber(ActorID,1,19208) --获取当前随机到的题目
					ZhiShiDaRen_Type = API_VarDataGetNumber(ActorID,1,19206)
				end
				local	R,G,B = 255,255,255
				if 	ZhiShiDaRen_Type == 1 then 
					R,G,B = 255,255,255
				elseif	ZhiShiDaRen_Type == 2 then
					R,G,B = 255,0,255
				elseif	ZhiShiDaRen_Type == 3 then
					R,G,B = 0,255,0
				end	
				local Question = ZhiShiDaRen_QuestionList[QuestionNo]                 --取出当前问题序号所对应的问题
				if	Question == nil	then
					QuestionNo = 459
					Question = ZhiShiDaRen_QuestionList[QuestionNo]
				end	
				if	(ZhiShiDaRen_Type ~= 1	and	ZhiShiDaRen_Type ~= 2	and	 ZhiShiDaRen_Type ~= 3) or ZhiShiDaRen_Type == nil	then
					ZhiShiDaRen_Type = 1
				end	
				API_VarDataSetNumber(ActorID,1,19206,ZhiShiDaRen_Type)
				API_VarDataSetNumber(ActorID,1,19208,QuestionNo)
				local Answer= ZhiShiDaRen_TrueAnswerList[QuestionNo].TrueAnswer 	  --找出当前问题的对应答案
				local LinShi = {}
				for i = 1,table.getn(ZhiShiDaRen_AnswerList[QuestionNo]) do
					LinShi[i] = ZhiShiDaRen_AnswerList[QuestionNo][i]
				end
				LinShiBC = table.getn(LinShi)
				local LinShi2 = {}
				local TureDaAn = 1
				while LinShiBC > 0 do
					local XH = math.random(LinShiBC)
					LinShi2BC = table.getn(LinShi2)
					LinShi2[LinShi2BC+1] = LinShi[XH]
					LinShiBC = LinShiBC -1
					if LinShi[XH] == Answer then
						TrueDaAn = table.getn(LinShi2)
					end
					--删除LinShi表里面XH这一行
					table.remove(LinShi,XH)
				end
				--将LinShi2表里的内容展现给玩家看和选择
				API_ResponseWrite('<br><text>根据问题，选择一个正确答案。</text><text color="255,255,255">当前初赛答对题目为'..ZhiShiDaRen_TrueNumber..',请谨慎答题。</text><br>')
				if	Type == 2 or Type == 3 then
				API_ResponseWrite('<br><text color="255,255,255">恭喜你获得幸运题目，答对即可获得珍贵物品奖励，请谨慎答题。</text><br>')
				end
				API_ResponseWrite('<br><text>'..Question..'</text><br>')
				for i =1,table.getn(LinShi2) do
					local ABC = 0
					if	i == TrueDaAn then
						ABC = 1
					end
					API_ResponseWrite('<br><a href="ZhiShiDaRen_NpcMove?1=1&2='..ABC..'" color="'..R..','..G..','..B..'">'..i..'、'..LinShi2[i]..'</a><br>')
				end
				API_ResponseFlush(ActorID)
			else
				API_ResponseWrite('<name></name>')
				API_ResponseWrite('<br><text>对不起，你目前不应该在我这里答题。</text><br>')
				API_ResponseWrite('<br><text>请按照评委编号的顺序回答问题，现在请您去</text><a color="255,0,255" mapid="'..MapID..'" x="'..X..'" y="'..Y..'" npcid="'..NpcID..'" underline="1">'..ZhiShiDaRen_NPCS..'号评委</a><text>处答题。</text><br>')
				API_ResponseWrite('<br><a>确定</a><br>')
				API_ResponseFlush(ActorID)
			end	
		end		
	end		
	API_ResponseFlush(ActorID)
end
---复赛答题
function ZhiShiDaRen_FSNpcMove(ActorID,NPCID)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ActorID = ActorID or API_RequestGetActorID()
	local NPCID = NPCID or API_VarDataGetNumber(ActorID,0,32711)
	local NPCFastID = API_VarDataGetNumber(ActorID,0,32712)
	local CampID =	API_GetActorCamp(ActorID)
	local JW = API_GetActorPeerageLevel(ActorID)
	local Level = API_GetActorExpLevel(ActorID)
	local Name = API_GetActorName(ActorID)
	local ZhiShiDaRen_FSXuanZe = API_RequestGetNumber(1)	
	--判断当前时间清除玩家身上交互数据	
	local PlayZhiShiDaRenFS = API_VarDataGetNumber(ActorID,1,19202) --记录知识达人活动时间
	local PlayYear = math.floor(PlayZhiShiDaRenFS/10000)
	local PlayMonthDay = math.mod(PlayZhiShiDaRenFS,10000)
	local PlayMonth = math.floor(PlayMonthDay/100)
	local PlayDay = math.mod(PlayMonthDay,100)
	if	Year ~= PlayYear or Month ~= PlayMonth or Day ~= PlayDay then
		API_VarDataSetNumber(ActorID,1,19209,0) --清除答对题目数量
		API_VarDataSetNumber(ActorID,1,19210,0) --清除已经回答题目数
		API_VarDataSetNumber(ActorID,1,19207,0)
	end	
	local ZhiShiDaRen_STrueNumber = API_VarDataGetNumber(ActorID,1,19209)		--获取玩家复赛答对题目数量
	local ZhiShiDaRen_SNumber = API_VarDataGetNumber(ActorID,1,19210) + 1       --获取已经回答题目数量
	local ZhiShiDaRen_FuSaiBZ = API_VarDataGetNumber(ActorID,1,19207)
	-- 没有复赛资格的处理
	if  ZhiShiDaRen_FuSaiBZ	==  0 then
		API_ResponseWrite('<name></name>')
		API_ResponseWrite('<br><text>很遗憾你并没有获得复赛资格，请您下次再来参加。</text><br>')
		API_ResponseWrite('<br><text>知识达人活动，将会在周六举行，期待你下次活动的表现。</text><br>')
		API_ResponseWrite('<br><a>确定</a><br>')
		API_ResponseFlush(ActorID)
		return
	end
	if	ZhiShiDaRen_FSXuanZe == 1	then
		API_VarDataSetNumber(ActorID,1,19210,ZhiShiDaRen_SNumber)
		ZhiShiDaRen_SNumber = ZhiShiDaRen_SNumber + 1,
		API_VarDataSetNumber(ActorID,1,19211,0) --清除前一个题目的交互数据。
		local ZhiShiDaRen_STrue = API_RequestGetNumber(2)
		if  ZhiShiDaRen_STrue == 1 then
			ZhiShiDaRen_STrueNumber = ZhiShiDaRen_STrueNumber + 1
			API_VarDataSetNumber(ActorID,1,19209,ZhiShiDaRen_STrueNumber)
			--风向标-复赛
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type1 = 30
			local Serial = 23+ZhiShiDaRen_STrueNumber
			local Number = 1
			if GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] == nil then
				GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan] = Number
			else
				GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  = GLOBAL_FengXiangBiao_DateList[Type1][Serial][LaiYuan]  + Number
			end
		end	
		if	ZhiShiDaRen_SNumber >	20 then	
			local ZhiShiDaRen_STrueNumber = API_VarDataGetNumber(ActorID,1,19209)
			local num = table.getn(ZhiShiDaRen_HJList)
			local LinShiTab = {}
			LinShiTab.ActorID = ActorID 
			LinShiTab.STrueNumber = ZhiShiDaRen_STrueNumber
			LinShiTab.Level = Level
			LinShiTab.Name = Name
			if 	num == 0 then
				table.insert(ZhiShiDaRen_HJList,LinShiTab)
			else
				local v =table.getn(ZhiShiDaRen_HJList)+1 	
				for i= 1,table.getn(ZhiShiDaRen_HJList) do
					if  ZhiShiDaRen_STrueNumber > ZhiShiDaRen_HJList[i].STrueNumber then
						v = i
						break	
					end						
				end
				table.insert(ZhiShiDaRen_HJList,v,LinShiTab)
			end		
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text color="255,255,255">祝贺你已经答完了复赛所有题目，请等待其他参赛的选手完成答题。</text><br>')
			API_ResponseWrite('<br><text color="255,255,255">在知识达人活动复赛结束的时候，系统会通知您是否获得比赛优胜。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)
		elseif ZhiShiDaRen_SNumber <=20 then
			local QuestionNo = math.random(table.getn(ZhiShiDaRen_QuestionList)) --在问题表中随机取出问题序号
			if	API_VarDataGetNumber(ActorID,1,19211) > 0 then					
				QuestionNo = API_VarDataGetNumber(ActorID,1,19211)
			end
			API_VarDataSetNumber(ActorID,1,19211,QuestionNo)
			local Question = ZhiShiDaRen_QuestionList[QuestionNo] 			--取出当前问题序号所对应的问题	
			if	Question == nil	then
				QuestionNo = 459
				Question = ZhiShiDaRen_QuestionList[QuestionNo]
			end	
			local Answer= ZhiShiDaRen_TrueAnswerList[QuestionNo].TrueAnswer 				  --找出当前问题的对应答案
			local LinShi3 = {}
			for i = 1,table.getn(ZhiShiDaRen_AnswerList[QuestionNo]) do
				LinShi3[i] = ZhiShiDaRen_AnswerList[QuestionNo][i]
			end
			LinShi3BC = table.getn(LinShi3)
			local LinShi4 = {}
			local TureDaAn = 1
			while LinShi3BC > 0 do
				local XH = math.random(LinShi3BC)
				LinShi4BC = table.getn(LinShi4)
				LinShi4[LinShi4BC+1] = LinShi3[XH]
				LinShi3BC = LinShi3BC -1
				if LinShi3[XH] == Answer then
					TrueDaAn = table.getn(LinShi4)
				end
				--删除LinShi表里面XH这一行
				table.remove(LinShi3,XH)
			end
			--将LinShi2表里的内容展现给玩家看和选择
			API_ResponseWrite('<br><text>根据问题，选择一个正确答案.</text><text color="255,255,255">当前复赛答对题目为'..ZhiShiDaRen_STrueNumber..',请谨慎答题。</text><br>')
			API_ResponseWrite('<br><text>'..ZhiShiDaRen_SNumber..'、'..Question..'</text><br>')
			for i =1,table.getn(LinShi4) do
				local ABC = 0
				if	i == TrueDaAn then
					ABC = 1
				end
				API_ResponseWrite('<br><a href="ZhiShiDaRen_FSNpcMove?1=1&2='..ABC..'" >'..i..'、'..LinShi4[i]..'</a><br>')
			end
		end	
	elseif 	ZhiShiDaRen_SNumber>20 then
			API_ResponseWrite('<name></name>')
			API_ResponseWrite('<br><text>感谢您参加本次知识达人复赛活动，你本次答题已经结束，请你耐心等候结果。</text><br>')
			API_ResponseWrite('<br><text>知识达人活动复赛活动结束时，将会按照你的复赛名次发放奖励。</text><br>')
			API_ResponseWrite('<br><a>确定</a><br>')
			API_ResponseFlush(ActorID)	
	elseif  ZhiShiDaRen_SNumber <= 20 then
		local QuestionNo = math.random(table.getn(ZhiShiDaRen_QuestionList)) --在问题表中随机取出问题序号
		if	API_VarDataGetNumber(ActorID,1,19211) > 0 then					
			QuestionNo = API_VarDataGetNumber(ActorID,1,19211)
		end
		API_VarDataSetNumber(ActorID,1,19211,QuestionNo)
		local Question = ZhiShiDaRen_QuestionList[QuestionNo]                 --取出当前问题序号所对应的问题	
		local Answer= ZhiShiDaRen_TrueAnswerList[QuestionNo].TrueAnswer 				  --找出当前问题的对应答案
		local LinShi3 = {}
		for i = 1,table.getn(ZhiShiDaRen_AnswerList[QuestionNo]) do
			LinShi3[i] = ZhiShiDaRen_AnswerList[QuestionNo][i]
		end
		LinShi3BC = table.getn(LinShi3)
		local LinShi4 = {}
		local TureDaAn = 1
		while LinShi3BC > 0 do
			local XH = math.random(LinShi3BC)			LinShi4BC = table.getn(LinShi4)
			LinShi4[LinShi4BC+1] = LinShi3[XH]
			LinShi3BC = LinShi3BC -1
			if LinShi3[XH] == Answer then
				TrueDaAn = table.getn(LinShi4)
			end
			--删除LinShi表里面XH这一行
			table.remove(LinShi3,XH)
		end
		--将LinShi2表里的内容展现给玩家看和选择
		API_ResponseWrite('<br><text>根据问题，选择一个正确答案.</text><br>')
		API_ResponseWrite('<br><text>'..ZhiShiDaRen_SNumber..'、'..Question..'</text><br>')
		for i =1,table.getn(LinShi4) do
			local ABC = 0
			if	i == TrueDaAn then
				ABC = 1
			end
			API_ResponseWrite('<br><a href="ZhiShiDaRen_FSNpcMove?1=1&2='..ABC..'" >'..i..'、'..LinShi4[i]..'</a><br>')
		end
		API_ResponseFlush(ActorID)
	end	
end		
--上线判断																					 	                               
local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'ZhiShiDaRen_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'ZhiShiDaRen_OnLogin') 
end
--切换地图后判断
local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'ZhiShiDaRen_OnLogin' then
		OnLoginMapLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'ZhiShiDaRen_OnLogin') 
end
			 
	   
			
					
			
			

		
	
	
	
	
	
	
	
	
	
	
	
