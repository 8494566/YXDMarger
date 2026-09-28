--2010年春节活动脚本 by万钰林
--2011时装合成功能脚本 by万钰林
--青铜固定数值	1 2
--青铜百分比	3 4
--白银固定数值	5 6
--白银百分比	7 8
--黄金固定数值	9 10
--黄金百分比	11 12
--稀有时装	13 14
-----------------------------------------------------------------------------------------------------------------------------
--修 改 人：黄蕾sofiehuang
--修改时间：2012年10月09日
--修改内容：原来是黄金时装宝石不让合成，改成让合成就行了.黄金时装宝石合成就不用金币.判断在1364行那个elseif里面.
--          20121107 ，改变时装外形和提升时装档次增加4件外观的。
----------------------------------------------------------------------------------------------------------------------------

if not API_IsEctypeServer() or API_IsBranchServer() then
	NewYear2010_TimerTriggerID = NewYear2010_TimerTriggerID or API_CreateTimerTriggerG(0,0,60,-1,'NewYear2010_GCallFunc')
	if not API_IsEctypeServer() and API_GetServerID() == 1 then
		LBFashionExchangeNpc = LBFashionExchangeNpc or API_CreateMonster(63,12236,64,67,4,0,-1)
		DGFashionExchangeNpc = DGFashionExchangeNpc or API_CreateMonster(1,12236,304,311,5,0,-1)
	end
end

function NewYear2010_GCallFunc(a,b)
	local TriggerID = API_GetCurTriggerID()
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	if Hour == 23 and Minute == 45 then
		for i = 8,12 do
			API_VarDataSetNumber_Ex_Sync(1, 0, -1999, 1, i, 0)
		end
		API_VarDataSetNumber_Ex_Sync(1, 0, -1999, 1, 15, 0)
	end
end

--时装兑换表
FashionExchange_ValueTable = {
[	10898	] = 	7	,
[	10899	] = 	8	,
[	10900	] = 	7	,
[	10901	] = 	8	,
[	10902	] = 	7	,
[	10903	] = 	8	,
[	10904	] = 	7	,
[	10905	] = 	8	,
[	10911	] = 	11	,
[	10912	] = 	12	,
[	10917	] = 	5	,
[	10918	] = 	6	,
[	10919	] = 	5	,
[	10920	] = 	6	,
[	10921	] = 	1	,
[	10922	] = 	2	,
[	10928	] = 	3	,
[	10929	] = 	4	,
[	10930	] = 	3	,
[	10931	] = 	4	,
[	10932	] = 	3	,
[	10933	] = 	4	,
[	10934	] = 	3	,
[	10935	] = 	4	,
[	10936	] = 	3	,
[	10937	] = 	4	,
[	10938	] = 	3	,
[	10939	] = 	4	,
[	10940	] = 	7	,
[	10941	] = 	8	,
[	10942	] = 	7	,
[	10943	] = 	8	,
[	10944	] = 	7	,
[	10945	] = 	8	,
[	10946	] = 	5	,
[	10947	] = 	6	,
[	10948	] = 	11	,
[	10949	] = 	12	,
[	10950	] = 	5	,
[	10951	] = 	6	,
[	10952	] = 	5	,
[	10953	] = 	6	,
[	10954	] = 	5	,
[	10955	] = 	6	,
[	10956	] = 	5	,
[	10957	] = 	6	,
[	10977	] = 	3	,
[	10978	] = 	4	,
[	10979	] = 	3	,
[	10980	] = 	4	,
[	10986	] = 	5	,
[	10987	] = 	6	,
[	10988	] = 	1	,
[	10989	] = 	2	,
[	10990	] = 	1	,
[	10991	] = 	2	,
[	10992	] = 	5	,
[	10993	] = 	6	,
[	10994	] = 	5	,
[	10995	] = 	6	,
[	10996	] = 	5	,
[	10997	] = 	6	,
[	11009	] = 	5	,
[	11010	] = 	6	,
[	11011	] = 	5	,
[	11012	] = 	6	,
[	11026	] = 	5	,
[	11027	] = 	6	,
[	11028	] = 	5	,
[	11029	] = 	6	,
[	11030	] = 	5	,
[	11031	] = 	6	,
[	11032	] = 	5	,
[	11033	] = 	6	,
[	11034	] = 	9	,
[	11035	] = 	10	,
[	11036	] = 	5	,
[	11037	] = 	6	,
[	11038	] = 	1	,
[	11039	] = 	2	,
[	11040	] = 	1	,
[	11041	] = 	2	,
[	11042	] = 	9	,
[	11043	] = 	10	,
[	11046	] = 	5	,
[	11047	] = 	6	,
[	11048	] = 	7	,
[	11049	] = 	8	,
[	11050	] = 	7	,
[	11051	] = 	8	,
[	11052	] = 	7	,
[	11053	] = 	8	,
[	11054	] = 	7	,
[	11055	] = 	8	,
[	11056	] = 	7	,
[	11057	] = 	8	,
[	11058	] = 	7	,
[	11059	] = 	8	,
[	11060	] = 	7	,
[	11061	] = 	8	,
[	11062	] = 	7	,
[	11063	] = 	8	,
[	11064	] = 	7	,
[	11065	] = 	8	,
[	11066	] = 	7	,
[	11067	] = 	8	,
[	11069	] = 	5	,
[	11070	] = 	6	,
[	11075	] = 	5	,
[	11076	] = 	6	,
[	11077	] = 	5	,
[	11078	] = 	6	,
[	11079	] = 	5	,
[	11080	] = 	6	,
[	11081	] = 	5	,
[	11082	] = 	6	,
[	11087	] = 	5	,
[	11088	] = 	6	,
[	11089	] = 	5	,
[	11090	] = 	6	,
[	11092	] = 	5	,
[	11093	] = 	6	,
[	11094	] = 	5	,
[	11095	] = 	6	,
[	11096	] = 	5	,
[	11097	] = 	6	,
[	11098	] = 	5	,
[	11099	] = 	6	,
[	11100	] = 	5	,
[	11101	] = 	6	,
[	11102	] = 	5	,
[	11103	] = 	6	,
[	11104	] = 	5	,
[	11105	] = 	6	,
[	11106	] = 	5	,
[	11107	] = 	6	,
[	11108	] = 	9	,
[	11109	] = 	10	,
[	11110	] = 	9	,
[	11111	] = 	10	,
[	11133	] = 	5	,
[	11134	] = 	6	,
[	11135	] = 	5	,
[	11136	] = 	6	,
[	11137	] = 	5	,
[	11138	] = 	6	,
[	11139	] = 	5	,
[	11140	] = 	6	,
[	11240	] = 	5	,
[	11241	] = 	6	,
[	11242	] = 	5	,
[	11243	] = 	6	,
[	11244	] = 	5	,
[	11245	] = 	6	,
[	11246	] = 	5	,
[	11247	] = 	6	,
[	11248	] = 	5	,
[	11249	] = 	6	,
[	11250	] = 	5	,
[	11251	] = 	6	,
[	11252	] = 	9	,
[	11253	] = 	10	,
[	11254	] = 	9	,
[	11255	] = 	10	,
[	11270	] = 	9	,
[	11271	] = 	10	,
[	11272	] = 	9	,
[	11273	] = 	10	,
[	11274	] = 	9	,
[	11275	] = 	10	,
[	11276	] = 	9	,
[	11277	] = 	10	,
[	11279	] = 	12	,
[	11280	] = 	12	,
[	11281	] = 	10	,
[	11282	] = 	10	,
[	11283	] = 	11	,
[	11284	] = 	12	,
[	11285	] = 	11	,
[	11286	] = 	12	,
[	11287	] = 	11	,
[	11288	] = 	12	,
[	11289	] = 	11	,
[	11290	] = 	12	,
[	11291	] = 	10	,
[	11292	] = 	10	,
[	11303	] = 	11	,
[	11304	] = 	12	,
[	11305	] = 	11	,
[	11306	] = 	12	,
[	11309	] = 	5	,
[	11310	] = 	6	,
[	11311	] = 	5	,
[	11312	] = 	6	,
[	11313	] = 	11	,
[	11314	] = 	12	,
[	11315	] = 	11	,
[	11316	] = 	12	,
[	11322	] = 	11	,
[	11323	] = 	12	,
[	11324	] = 	11	,
[	11325	] = 	12	,
[	11326	] = 	11	,
[	11327	] = 	12	,
[	11328	] = 	11	,
[	11329	] = 	12	,
[	11330	] = 	11	,
[	11331	] = 	12	,
[	11332	] = 	11	,
[	11333	] = 	12	,
[	11337	] = 	11	,
[	11338	] = 	12	,
[	11340	] = 	9	,
[	11341	] = 	10	,
[	11342	] = 	9	,
[	11343	] = 	10	,
[	11501	] = 	9	,
[	11502	] = 	10	,
[	11503	] = 	9	,
[	11504	] = 	10	,
[	11505	] = 	9	,
[	11506	] = 	10	,
[	11507	] = 	9	,
[	11508	] = 	10	,
[	11513	] = 	9	,
[	11514	] = 	9	,
[	11515	] = 	13	,
[	11516	] = 	14	,
[	11518	] = 	13	,
[	11519	] = 	14	,
[	11006	] = 	3	,
[	11007	] = 	3	,
[	11008	] = 	3	,
--[	11014	] = 	13	,
--[	11015	] = 	14	,
--[	11017	] = 	13	,
--[	11018	] = 	14	,
[	11083	] = 	3	,
[	11084	] = 	3	,
[	11085	] = 	3	,
[	11086	] = 	3	,
[	11091	] = 	5	,
[	11610	] = 	9	,
[	11611	] = 	10	,
[	11612	] = 	9	,
[	11613	] = 	10	,
}

FashionExchange_GetValueTypeTab = {
	[1] = {
		{a=	1	,b=	500000	,Type=	1	},
		{a=	500001	,b=	749850	,Type=	2	},
		{a=	749851	,b=	829925	,Type=	3	},
		{a=	829926	,b=	900925	,Type=	4	},
		{a=	900926	,b=	964925	,Type=	5	},
		{a=	964926	,b=	999925	,Type=	6	},
		{a=	999926	,b=	999965	,Type=	9	},
		{a=	999966	,b=	999985	,Type=	10	},
		{a=	999986	,b=	999995	,Type=	11	},
		{a=	999996	,b=	1000000	,Type=	12	},
	},
	[2] = {
		{a=	1	,b=	100000	,Type=	1	},
		{a=	100001	,b=	630000	,Type=	2	},
		{a=	630001	,b=	759850	,Type=	3	},
		{a=	759851	,b=	871850	,Type=	4	},
		{a=	871851	,b=	946850	,Type=	5	},
		{a=	946851	,b=	999850	,Type=	6	},
		{a=	999851	,b=	999930	,Type=	9	},
		{a=	999931	,b=	999970	,Type=	10	},
		{a=	999971	,b=	999990	,Type=	11	},
		{a=	999991	,b=	1000000	,Type=	12	},
	},
	[3] = {
		{a=	1	,b=	100000	,Type=	2	},
		{a=	100001	,b=	600000	,Type=	3	},
		{a=	600001	,b=	816940	,Type=	4	},
		{a=	816941	,b=	918940	,Type=	5	},
		{a=	918941	,b=	996940	,Type=	6	},
		{a=	996941	,b=	998940	,Type=	9	},
		{a=	998941	,b=	999940	,Type=	10	},
		{a=	999941	,b=	999980	,Type=	11	},
		{a=	999981	,b=	1000000	,Type=	12	},
	},
	[4] = {
		{a=	1	,b=	100000	,Type=	3	},
		{a=	100001	,b=	750000	,Type=	4	},
		{a=	750001	,b=	900080	,Type=	5	},
		{a=	900081	,b=	993880	,Type=	6	},
		{a=	993881	,b=	997880	,Type=	9	},
		{a=	997881	,b=	999880	,Type=	10	},
		{a=	999881	,b=	999960	,Type=	11	},
		{a=	999961	,b=	1000000	,Type=	12	},
	},
	[5] = {
		{a=	1	,b=	634760	,Type=	5	},
		{a=	634761	,b=	984760	,Type=	6	},
		{a=	984761	,b=	995260	,Type=	9	},
		{a=	995261	,b=	999760	,Type=	10	},
		{a=	999761	,b=	999920	,Type=	11	},
		{a=	999921	,b=	1000000	,Type=	12	},
	},
	[6] = {
		{a=	1	,b=	300000	,Type=	5	},
		{a=	300001	,b=	974520	,Type=	6	},
		{a=	974521	,b=	991020	,Type=	9	},
		{a=	991021	,b=	999520	,Type=	10	},
		{a=	999521	,b=	999840	,Type=	11	},
		{a=	999841	,b=	1000000	,Type=	12	},
	},
	[7] = {
		{a=	1	,b=	50000	,Type=	5	},
		{a=	50001	,b=	150000	,Type=	6	},
		{a=	150001	,b=	754000	,Type=	9	},
		{a=	754001	,b=	989000	,Type=	10	},
		{a=	989001	,b=	997000	,Type=	11	},
		{a=	997001	,b=	1000000	,Type=	12	},
	},
	[8] = {
		{a=	1	,b=	50000	,Type=	5	},
		{a=	50001	,b=	150000	,Type=	6	},
		{a=	150001	,b=	610000	,Type=	9	},
		{a=	610001	,b=	985000	,Type=	10	},
		{a=	985001	,b=	995000	,Type=	11	},
		{a=	995001	,b=	1000000	,Type=	12	},
	},
	[9] = {
		{a=	1	,b=	648000	,Type=	9	},
		{a=	648001	,b=	979000	,Type=	10	},
		{a=	979001	,b=	988000	,Type=	11	},
		{a=	988001	,b=	995000	,Type=	12	},
		{a=	995001	,b=	998000	,Type=	13	},
		{a=	998001	,b=	1000000	,Type=	14	},
	},
	[10] = {
		{a=	1	,b=	293000	,Type=	9	},
		{a=	293001	,b=	970000	,Type=	10	},
		{a=	970001	,b=	981000	,Type=	11	},
		{a=	981001	,b=	990000	,Type=	12	},
		{a=	990001	,b=	996000	,Type=	13	},
		{a=	996001	,b=	1000000	,Type=	14	},
	},
	[11] = {
		{a=	1	,b=	650000	,Type=	11	},
		{a=	650001	,b=	990000	,Type=	12	},
		{a=	990001	,b=	996000	,Type=	13	},
		{a=	996001	,b=	1000000	,Type=	14	},
	},
	[12] = {
		{a=	1	,b=	330000	,Type=	11	},
		{a=	330001	,b=	980000	,Type=	12	},
		{a=	980001	,b=	992000	,Type=	13	},
		{a=	992001	,b=	1000000	,Type=	14	},
	},
	[13] = {
		{a=	1	,b=	800000	,Type=	13	},
		{a=	800001	,b=	1000000	,Type=	14	},
	},
	[14] = {
		{a=	1	,b=	300000	,Type=	13	},
		{a=	300001	,b=	1000000	,Type=	14	},
	},
}

--按类型随机给同价值的时装
FashionExchange_WorthTable = {
	[1] = {10921,10988,10990,},
	[2] = {10922,10989,10991,},
	[3] = {10932,10938,11083,11084,11085,11086,},
	[4] = {10933,10939,},
	[5] = {10917,10919,10946,10986,10992,10994,10996,11026,11028,11030,11032,11036,11046,11069,11092,11094,11096,11102,11133,11135,11137,11139,11240,11242,11248,11250,},
	[6] = {10918,10920,10947,10987,10993,10995,10997,11027,11029,11031,11033,11037,11047,11070,11093,11095,11097,11103,11134,11136,11138,11140,11241,11243,11249,11251,},
	[7] = {10917,10919,10946,10986,10992,10994,10996,11026,11028,11030,11032,11036,11046,11069,11092,11094,11096,11102,11133,11135,11137,11139,11240,11242,11248,11250,},
	[8] = {10918,10920,10947,10987,10993,10995,10997,11027,11029,11031,11033,11037,11047,11070,11093,11095,11097,11103,11134,11136,11138,11140,11241,11243,11249,11251,},
	[9] = {11034,11042,11108,11252,11254,11270,11272,11274,11276,11340,11342,11501,11503,11505,11507,},
	[10] = {11035,11043,11109,11253,11255,11271,11273,11275,11277,11281,11282,11291,11292,11341,11343,11502,11504,11506,11508,},
	[11] = {10911,10948,11283,11287,11326,11328,11330,11332,},
	[12] = {10912,10949,11279,11280,11284,11288,11327,11329,11331,11333,11610,11611,11612,11613},
	[13] = {11515,11518,},
	[14] = {11516,11519,},
}
--稀有时装数量key
FashionExchange_GoldFashion = {
	[11515] = 8,
	[11516] = 9,
	[11518] = 10,
	[11519] = 11,
}
--获得限量时装喊话表
FashionExchange_SayWorld = {
[	11009	] = 0,
[	11010	] = 1,
[	11011	] = 2,
[	11012	] = 3,
[	11087	] = 4,
[	11088	] = 5,
[	11089	] = 6,
[	11090	] = 7,
[	10992	] = 8,
[	10993	] = 9,
[	10996	] = 10,
[	10997	] = 11,
[	11030	] = 12,
[	11031	] = 13,
[	10917	] = 14,
[	10918	] = 15,
[	11092	] = 16,
[	11093	] = 17,
[	11032	] = 18,
[	11033	] = 19,
[	11096	] = 20,
[	11097	] = 21,
[	11094	] = 22,
[	11095	] = 23,
}
--记录风向标头和衣服
FashionExchange_FengXiangBiaoGoods1 = {
[	10898	] = 	1	,
[	10899	] = 	2	,
[	10900	] = 	1	,
[	10901	] = 	2	,
[	10902	] = 	1	,
[	10903	] = 	2	,
[	10904	] = 	1	,
[	10905	] = 	2	,
[	10911	] = 	1	,
[	10912	] = 	2	,
[	10917	] = 	1	,
[	10918	] = 	2	,
[	10919	] = 	1	,
[	10920	] = 	2	,
[	10921	] = 	1	,
[	10922	] = 	2	,
[	10928	] = 	1	,
[	10929	] = 	2	,
[	10930	] = 	1	,
[	10931	] = 	2	,
[	10932	] = 	1	,
[	10933	] = 	2	,
[	10934	] = 	1	,
[	10935	] = 	2	,
[	10936	] = 	1	,
[	10937	] = 	2	,
[	10938	] = 	1	,
[	10939	] = 	2	,
[	10940	] = 	1	,
[	10941	] = 	2	,
[	10942	] = 	1	,
[	10943	] = 	2	,
[	10944	] = 	1	,
[	10945	] = 	2	,
[	10946	] = 	1	,
[	10947	] = 	2	,
[	10948	] = 	1	,
[	10949	] = 	2	,
[	10950	] = 	1	,
[	10951	] = 	2	,
[	10952	] = 	1	,
[	10953	] = 	2	,
[	10954	] = 	1	,
[	10955	] = 	2	,
[	10956	] = 	1	,
[	10957	] = 	2	,
[	10977	] = 	1	,
[	10978	] = 	2	,
[	10979	] = 	1	,
[	10980	] = 	2	,
[	10986	] = 	1	,
[	10987	] = 	2	,
[	10988	] = 	1	,
[	10989	] = 	2	,
[	10990	] = 	1	,
[	10991	] = 	2	,
[	10992	] = 	1	,
[	10993	] = 	2	,
[	10994	] = 	1	,
[	10995	] = 	2	,
[	10996	] = 	1	,
[	10997	] = 	2	,
[	11009	] = 	1	,
[	11010	] = 	2	,
[	11011	] = 	1	,
[	11012	] = 	2	,
[	11026	] = 	1	,
[	11027	] = 	2	,
[	11028	] = 	1	,
[	11029	] = 	2	,
[	11030	] = 	1	,
[	11031	] = 	2	,
[	11032	] = 	1	,
[	11033	] = 	2	,
[	11034	] = 	1	,
[	11035	] = 	2	,
[	11036	] = 	1	,
[	11037	] = 	2	,
[	11038	] = 	1	,
[	11039	] = 	2	,
[	11040	] = 	1	,
[	11041	] = 	2	,
[	11042	] = 	1	,
[	11043	] = 	2	,
[	11046	] = 	1	,
[	11047	] = 	2	,
[	11048	] = 	1	,
[	11049	] = 	2	,
[	11050	] = 	1	,
[	11051	] = 	2	,
[	11052	] = 	1	,
[	11053	] = 	2	,
[	11054	] = 	1	,
[	11055	] = 	2	,
[	11056	] = 	1	,
[	11057	] = 	2	,
[	11058	] = 	1	,
[	11059	] = 	2	,
[	11060	] = 	1	,
[	11061	] = 	2	,
[	11062	] = 	1	,
[	11063	] = 	2	,
[	11064	] = 	1	,
[	11065	] = 	2	,
[	11066	] = 	1	,
[	11067	] = 	2	,
[	11069	] = 	1	,
[	11070	] = 	2	,
[	11075	] = 	1	,
[	11076	] = 	2	,
[	11077	] = 	1	,
[	11078	] = 	2	,
[	11079	] = 	1	,
[	11080	] = 	2	,
[	11081	] = 	1	,
[	11082	] = 	2	,
[	11087	] = 	1	,
[	11088	] = 	2	,
[	11089	] = 	1	,
[	11090	] = 	2	,
[	11092	] = 	1	,
[	11093	] = 	2	,
[	11094	] = 	1	,
[	11095	] = 	2	,
[	11096	] = 	1	,
[	11097	] = 	2	,
[	11098	] = 	1	,
[	11099	] = 	2	,
[	11100	] = 	1	,
[	11101	] = 	2	,
[	11102	] = 	1	,
[	11103	] = 	2	,
[	11104	] = 	1	,
[	11105	] = 	2	,
[	11106	] = 	1	,
[	11107	] = 	2	,
[	11108	] = 	1	,
[	11109	] = 	2	,
[	11110	] = 	1	,
[	11111	] = 	2	,
[	11133	] = 	1	,
[	11134	] = 	2	,
[	11135	] = 	1	,
[	11136	] = 	2	,
[	11137	] = 	1	,
[	11138	] = 	2	,
[	11139	] = 	1	,
[	11140	] = 	2	,
[	11240	] = 	1	,
[	11241	] = 	2	,
[	11242	] = 	1	,
[	11243	] = 	2	,
[	11244	] = 	1	,
[	11245	] = 	2	,
[	11246	] = 	1	,
[	11247	] = 	2	,
[	11248	] = 	1	,
[	11249	] = 	2	,
[	11250	] = 	1	,
[	11251	] = 	2	,
[	11252	] = 	1	,
[	11253	] = 	2	,
[	11254	] = 	1	,
[	11255	] = 	2	,
[	11270	] = 	1	,
[	11271	] = 	2	,
[	11272	] = 	1	,
[	11273	] = 	2	,
[	11274	] = 	1	,
[	11275	] = 	2	,
[	11276	] = 	1	,
[	11277	] = 	2	,
[	11279	] = 	1	,
[	11280	] = 	2	,
[	11281	] = 	1	,
[	11282	] = 	2	,
[	11283	] = 	1	,
[	11284	] = 	2	,
[	11285	] = 	1	,
[	11286	] = 	2	,
[	11287	] = 	1	,
[	11288	] = 	2	,
[	11289	] = 	1	,
[	11290	] = 	2	,
[	11291	] = 	1	,
[	11292	] = 	2	,
[	11303	] = 	1	,
[	11304	] = 	2	,
[	11305	] = 	1	,
[	11306	] = 	2	,
[	11309	] = 	1	,
[	11310	] = 	2	,
[	11311	] = 	1	,
[	11312	] = 	2	,
[	11313	] = 	1	,
[	11314	] = 	2	,
[	11315	] = 	1	,
[	11316	] = 	2	,
[	11322	] = 	1	,
[	11323	] = 	2	,
[	11324	] = 	1	,
[	11325	] = 	2	,
[	11326	] = 	1	,
[	11327	] = 	2	,
[	11328	] = 	1	,
[	11329	] = 	2	,
[	11330	] = 	1	,
[	11331	] = 	2	,
[	11332	] = 	1	,
[	11333	] = 	2	,
[	11337	] = 	1	,
[	11338	] = 	2	,
[	11340	] = 	1	,
[	11341	] = 	2	,
[	11342	] = 	1	,
[	11343	] = 	2	,
[	11501	] = 	1	,
[	11502	] = 	2	,
[	11503	] = 	1	,
[	11504	] = 	2	,
[	11505	] = 	1	,
[	11506	] = 	2	,
[	11507	] = 	1	,
[	11508	] = 	2	,
--[	11513	] = 	1	,
--[	11514	] = 	1	,
[	11515	] = 	1	,
[	11516	] = 	2	,
[	11518	] = 	1	,
[	11519	] = 	2	,
[	11006	] = 	1,
[	11007	] = 1,
[	11008	] = 1,
[	11014	] = 1,
[	11015	] = 2,
[	11017	] = 1,
[	11018	] = 2,
[	11083	] = 1,
--[	11084	] = 1,
[	11085	] = 1,
--[	11086	] = 1,
[	11091	] = 1,
[	11610	] = 1,
[	11612	] = 1,
[	11611	] = 2,
[	11613	] = 2,

}
--兑换未绑定时装产出限量时装数量记录风向标用
FashionExchange_FengXiangBiaoGoods2 = {
[	11009	] = 4,
[	11010	] = 4,
[	11011	] = 4,
[	11012	] = 4,
[	11087	] = 4,
[	11088	] = 4,
[	11089	] = 4,
[	11090	] = 4,
[	10992	] = 4,
[	10993	] = 4,
[	10996	] = 4,
[	10997	] = 4,
[	11030	] = 4,
[	11031	] = 4,
[	10917	] = 4,
[	10918	] = 4,
[	11092	] = 4,
[	11093	] = 4,
[	11032	] = 4,
[	11033	] = 4,
[	11096	] = 4,
[	11097	] = 4,
[	11094	] = 4,
[	11095	] = 4,
[	11135	] = 4,
}
--兑换续时油时判断是不是黄金时装用
FashionExchange_GoldGoods = {
[	10911	] = 1,
[	10912	] = 2,
[	10948	] = 3,
[	10949	] = 4,
[	11034	] = 5,
[	11035	] = 6,
[	11108	] = 7,
[	11109	] = 8,
[	11110	] = 9,
[	11111	] = 10,
[	11252	] = 11,
[	11253	] = 12,
[	11254	] = 13,
[	11255	] = 14,
[	11270	] = 15,
[	11271	] = 16,
[	11272	] = 17,
[	11273	] = 18,
[	11274	] = 19,
[	11275	] = 20,
[	11276	] = 21,
[	11277	] = 22,
[	11279	] = 23,
[	11280	] = 24,
[	11281	] = 25,
[	11282	] = 26,
[	11283	] = 27,
[	11284	] = 28,
[	11285	] = 29,
[	11286	] = 30,
[	11287	] = 31,
[	11288	] = 32,
[	11289	] = 33,
[	11290	] = 34,
[	11291	] = 35,
[	11292	] = 36,
[	11303	] = 37,
[	11304	] = 38,
[	11305	] = 39,
[	11306	] = 40,
[	11313	] = 41,
[	11314	] = 42,
[	11315	] = 43,
[	11316	] = 44,
[	11322	] = 45,
[	11323	] = 46,
[	11324	] = 47,
[	11325	] = 48,
[	11326	] = 49,
[	11327	] = 50,
[	11328	] = 51,
[	11329	] = 52,
[	11330	] = 53,
[	11331	] = 54,
[	11332	] = 55,
[	11333	] = 56,
[	11337	] = 57,
[	11338	] = 58,
[	11340	] = 59,
[	11341	] = 60,
[	11342	] = 61,
[	11343	] = 62,
[	11501	] = 63,
[	11502	] = 64,
[	11503	] = 65,
[	11504	] = 66,
[	11505	] = 67,
[	11506	] = 68,
[	11507	] = 69,
[	11508	] = 70,
--[	11513	] = 71,
--[	11514	] = 72,
[	11515	] = 73,
[	11516	] = 74,
[	11518	] = 75,
[	11519	] = 76,
[	11610	] = 77,
[	11611	] = 78,
[	11612	] = 79,
[	11613	] = 80,
}

--时装提升表
FashionExchange_LvUpGoods = {
	--白银男
	[	11026	] = 	1	,
	[	11027	] = 	2	,
	[	11028	] = 	1	,
	[	11029	] = 	2	,
	[	10986	] = 	1	,
	[	10987	] = 	2	,
	[	11133	] = 	1	,
	[	11134	] = 	2	,
	[	11009	] = 	1	,
	[	11010	] = 	2	,
	[	11087	] = 	1	,
	[	11088	] = 	2	,
	[	10992	] = 	1	,
	[	10993	] = 	2	,
	[	11030	] = 	1	,
	[	11031	] = 	2	,
	[	11032	] = 	1	,
	[	11033	] = 	2	,
	[	11094	] = 	1	,
	[	11095	] = 	2	,
	[	11098	] = 	1	,
	[	11099	] = 	2	,
	[	11137	] = 	1	,
	[	11138	] = 	2	,
	[	11242	] = 	1	,
	[	11243	] = 	2	,
	[	11248	] = 	1	,
	[	11249	] = 	2	,
	--白银女
	[	11036	] = 	1	,
	[	11037	] = 	2	,
	[	11046	] = 	1	,
	[	11047	] = 	2	,
	[	10994	] = 	1	,
	[	10995	] = 	2	,
	[	11135	] = 	1	,
	[	11136	] = 	2	,
	[	11011	] = 	1	,
	[	11012	] = 	2	,
	[	11089	] = 	1	,
	[	11090	] = 	2	,
	[	10996	] = 	1	,
	[	10997	] = 	2	,
	[	10917	] = 	1	,
	[	10918	] = 	2	,
	[	11092	] = 	1	,
	[	11093	] = 	2	,
	[	11096	] = 	1	,
	[	11097	] = 	2	,
	[	11100	] = 	1	,
	[	11101	] = 	2	,
	[	11139	] = 	1	,
	[	11140	] = 	2	,
	[	11102	] = 	1	,
	[	11103	] = 	2	,
	[	11240	] = 	1	,
	[	11241	] = 	2	,
	[	11250	] = 	1	,
	[	11251	] = 	2	,
	[	10919	] = 	1	,
	[	10920	] = 	2	,
	[	11083	] = 	1	,
	[	11069	] = 	1	,
	[	11070	] = 	2	,
}
--提升时装按男女给时装
FashionExchange_LvUpNewGoods = {
	--黄金头，男1女2
	[1] = {
		[1] = {
			[1] = {11270,11272},--男帽
			[2] = {11254,11612},--男帽
			},
		[2] = {
			[1] = {11274,11276},--女
			[2] = {11252,11610},--女
			},
		},
	--黄金衣服
	[2] = {
		[1] = {
			[1] = {11271,11273},
			[2] = {11255,11613},
			},
		[2] = {
			[1] = {11275,11277},
			[2] = {11253,11611},
			},
		},
}

local ShiZhuangBaoShiTable = {
[39501] = 1,
[39502] = 1,
[39503] = 1,
[39510] = 1,
[39513] = 1,
[39516] = 1,
[39519] = 1,
[39522] = 1,
[39525] = 1,
[39528] = 1,
[39504] = 2,
[39505] = 2,
[39506] = 2,
[39511] = 2,
[39514] = 2,
[39517] = 2,
[39520] = 2,
[39523] = 2,
[39526] = 2,
[39529] = 2,
[39507] = 3,
[39508] = 3,
[39509] = 3,
[39512] = 3,
[39515] = 3,
[39518] = 3,
[39521] = 3,
[39524] = 3,
[39527] = 3,
[39530] = 3,
}
local SilverTable = {39504,39505,39506,39511,39514,39514,39514,39514,39514,39514,39517,39520,39523,39517,39520,39523,39526,39526,39529,39529}

local GoldTable = {39507,39508,39509,39512,39515,39515,39515,39515,39515,39515,39518,39521,39524,39518,39521,39524,39527,39527,39530,39530}

FashionExchange_CDTime = 0
--时装兑换官
function FashionExchange_Officer()
	local ActorID = API_RequestGetActorID()
	local Sexy = API_GetActorSex(ActorID)
	local XuanZe = API_RequestGetNumber(1)
	if XuanZe == 1 then
		API_ResponseWrite('<name></name>') 
		API_ResponseWrite('<win rect="120, 190, 350, 300" alpha="240" balpha="230"></win>') 
		if API_RequestGetNumber(2) == 1 then
			if API_ActorGetPackageSize(ActorID) < 2 then
				API_ResponseWrite('<br><text>请将背包空出2个位置，方可进行兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			local UidHigh1 = API_RequestGetNumber(100)--高位UID
			local UidLow1 = API_RequestGetNumber(1100)--低位UID
			local Uid1 = API_GetUID(UidHigh1,UidLow1) --获取UID
			local BoxID1,LocID1 = API_GetUIDGoodsInActor(Uid1,ActorID)--背包ID 和 位置
			local GoodsID1 = API_GetUIDGoodsPropNum(Uid1,0)--提交的物品ID
			local UidHigh2 = API_RequestGetNumber(200)--高位UID
			local UidLow2 = API_RequestGetNumber(1200)--低位UID
			local Uid2 = API_GetUID(UidHigh2,UidLow2) --获取UID	
			local BoxID2,LocID2 = API_GetUIDGoodsInActor(Uid2,ActorID)--背包ID 和 位置
			local GoodsID2 = API_GetUIDGoodsPropNum(Uid2,0)--提交的物品ID
			if GoodsID1 <= 0 or GoodsID2 <= 0 then
				API_ResponseWrite('<br><text>请放入2件时装，才可以正常进行兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if FashionExchange_ValueTable[GoodsID1] == nil or FashionExchange_ValueTable[GoodsID2] == nil then
				API_ResponseWrite('<br><text>此物品不在指定兑换范围内！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if API_GetUIDGoodsPropNum(Uid1,4) > 0 then
				API_ResponseWrite('<br><text>'..API_GetGoodsName(GoodsID1)..'已绑定，不能兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if API_GetUIDGoodsPropNum(Uid2,4) > 0 then
				API_ResponseWrite('<br><text>'..API_GetGoodsName(GoodsID2)..'已绑定，不能兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			local JiaZhi1 = FashionExchange_ValueTable[GoodsID1]
			local JiaZhi2 = FashionExchange_ValueTable[GoodsID2]
			local JiaZhi = math.floor((JiaZhi1 + JiaZhi2)*0.5)
			if JiaZhi > 14 then
				JiaZhi = 14
			end
			if FashionExchange_GetValueTypeTab[JiaZhi] ~= nil then
				local Tab = FashionExchange_GetValueTypeTab[JiaZhi]
				local RD = math.random(1000000)
				for j in Tab do
					local a = Tab[j].a
					local b = Tab[j].b
					if RD >= a and RD < b then
						JiaZhi = Tab[j].Type
						break
					end
				end
			end
			if BoxID1 < 0 or BoxID2 < 0 then
				API_ResponseWrite('<br><text>兑换失败，请重新兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID1,1,BoxID1,LocID1, '兑换时装') and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID2,1,BoxID2,LocID2, '兑换时装') then
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 1
				if FashionExchange_FengXiangBiaoGoods1[GoodsID1] ~= nil then
					Type = FashionExchange_FengXiangBiaoGoods1[GoodsID1]
					if GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] + 1
					end
				end
				if FashionExchange_FengXiangBiaoGoods1[GoodsID2] ~= nil then
					Type = FashionExchange_FengXiangBiaoGoods1[GoodsID2]
					if GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] + 1
					end
				end
				local GoodsID = FashionExchange_WorthTable[JiaZhi][math.random(table.getn(FashionExchange_WorthTable[JiaZhi]))]
				local Say = 0
				local Time = os.time() 
				if GoodsID > 0 then
					API_AddActorGoods(ActorID,GoodsID,1,'兑换时装获得')
					if FashionExchange_GoldFashion[GoodsID] ~= nil then
						if not API_IsBattleGameServer() then
							API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..API_GetActorName(ActorID)..'人品爆发，兑换不绑定时装获得超稀有时装：'..API_GetGoodsName(GoodsID)..'！')
						end
					end
					API_ResponseWrite('<br><text>兑换完成，您获得了一个：</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><br>') 
					API_ResponseWrite('<br><br><a>确定</a>')
					if FashionExchange_FengXiangBiaoGoods2[GoodsID] ~= nil then
						Type = FashionExchange_FengXiangBiaoGoods2[GoodsID]
						if GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] + 1
						end
					elseif FashionExchange_GoldFashion[GoodsID] ~= nil then
						Type = 5
						if GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] + 1
						end
					else
						Type = 3
						if GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] == nil then
							GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = 1
						else
							GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] + 1
						end
					end
				end
			end
		else
			API_ResponseWrite('<text>时装兑换说明</text><br>') 
			API_ResponseWrite('<text>    将未绑定的时装放入，便有机会</text><text color="255,0,255">兑换成各种限量白银时装与稀有黄金时装！兑换后放入的时装消失，请谨慎操作！（只支持休闲帽子和休闲服）</text><br>') 
			API_ResponseWrite('<br><text>   </text><goodsHolder name="100"><text>    </text><goodsHolder name="200"><br>')
			API_ResponseWrite('<br><a href="FashionExchange_Officer?1=1&2=1">  开始兑换</a><br>')
			API_ResponseWrite('<br><a href="FashionExchange_Officer">  返回</a><br>')
		end
	elseif XuanZe == 2 then
		API_ResponseWrite('<name></name>') 
		API_ResponseWrite('<win rect="120, 190, 350, 300" alpha="240" balpha="230"></win>') 
		if API_RequestGetNumber(2) == 1 then
			if API_ActorGetPackageSize(ActorID) < 2 then
				API_ResponseWrite('<br><text>请将背包空出2个位置，方可进行兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			local UidHigh1 = API_RequestGetNumber(100)--高位UID
			local UidLow1 = API_RequestGetNumber(1100)--低位UID
			local Uid1 = API_GetUID(UidHigh1,UidLow1) --获取UID	
			local BoxID1,LocID1 = API_GetUIDGoodsInActor(Uid1,ActorID)--背包ID 和 位置
			local GoodsID1 = API_GetUIDGoodsPropNum(Uid1,0)--提交的物品ID
			if GoodsID1 <= 0 then
				API_ResponseWrite('<br><text>请放入时装，才可以正常进行兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if FashionExchange_FengXiangBiaoGoods1[GoodsID1] == nil then
				API_ResponseWrite('<br><text>此物品不在指定兑换范围内！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if API_GetUIDGoodsPropNum(Uid1,4) == 0 then
				API_ResponseWrite('<br><text>'..API_GetGoodsName(GoodsID1)..'还未绑定，不能兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if BoxID1 < 0 then
				API_ResponseWrite('<br><text>兑换失败，请重新兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID1,1,BoxID1,LocID1, '兑换时装油') then
				local LaiYuan = API_ActorGetPropNum(ActorID,201)
				local Type = 6
				if FashionExchange_FengXiangBiaoGoods1[GoodsID1] ~= nil then
					Type = FashionExchange_FengXiangBiaoGoods1[GoodsID1]
					if Type == 1 then
						Type = 6
					else
						Type = 7
					end
					if GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] + 1
					end
				end
				local Num = 3
				if FashionExchange_GoldGoods[GoodsID1] ~= nil then
					Num = 6
				end
				--API_AddActorGoods(ActorID,75,1,'兑换时装获得')
				API_AddActorGoodsFlag(ActorID, 75, Num, 1, '兑换时装获得')
				local GoodsID = 0
				if math.random(100) == 1 then
					local Num = API_VarDataGetNumber_Ex(1, 0, -1999, 1, 12)
					if Num < 10 then
						Num = Num + 1
						API_VarDataSetNumber_Ex_Sync(1, 0, -1999, 1, 12, Num)
						if math.random(100) > 25 then
							local Tab = {10988,10989,10922,10921,10991,10990,}
							GoodsID = Tab[math.random(table.getn(Tab))]
						else
							local Tab = {11036,11037,11046,11047,11026,11027,11028,11029,}
							GoodsID = Tab[math.random(table.getn(Tab))]
						end
					end
				end
				API_ResponseWrite('<br><text>兑换完成，您获得了：</text><img srcgd="75" tipgd="75"><text> X '..Num..'</text><br>') 
				if GoodsID > 0 then
					API_AddActorGoods(ActorID,GoodsID,1,'兑换时装获得')
					local Time = os.time() 
					if Time >= FashionExchange_CDTime then
						FashionExchange_CDTime = Time + 1800
						if not API_IsBattleGameServer() then
							API_ActorBDCMsg(-1, 0, -1, 15, 85, 0, 17, ''..API_GetActorName(ActorID)..'人品爆发，兑换绑定时装获得了全新：'..API_GetGoodsName(GoodsID)..'！')
						end
					end
					API_ResponseWrite('<br><text>人品爆发获得：</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><br>') 
					Type = 8
					if GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] == nil then
						GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = 1
					else
						GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] + 1
					end
				end
				API_ResponseWrite('<br><br><a>确定</a>')
			end
		else
			API_ResponseWrite('<text>兑换时装续时油</text><br>') 
			API_ResponseWrite('<text>    请将已绑定的时装放入以下物品框，点击兑换按钮开始兑换时装续时油。白银时装可兑换 3个 时装续时油，黄金时装可兑换 6个 时装续时油。</text><br>') 
			API_ResponseWrite('<br><text>   </text><goodsHolder name="100"><br>')
			API_ResponseWrite('<br><a href="FashionExchange_Officer?1=2&2=1">  兑换</a><br>')
			API_ResponseWrite('<br><a href="FashionExchange_Officer">  返回</a><br>')
		end
	elseif XuanZe == 3 then
		API_ResponseWrite('<name></name>') 
		API_ResponseWrite('<win rect="120, 190, 350, 300" alpha="240" balpha="230"></win>') 
		if API_RequestGetNumber(2) == 1 then
			if API_ActorGetPackageSize(ActorID) < 2 then
				API_ResponseWrite('<br><text>请将背包空出2个位置，方可进行提升！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			local UidHigh1 = API_RequestGetNumber(100)--高位UID
			local UidLow1 = API_RequestGetNumber(1100)--低位UID
			local Uid1 = API_GetUID(UidHigh1,UidLow1) --获取UID
			local BoxID1,LocID1 = API_GetUIDGoodsInActor(Uid1,ActorID)--背包ID 和 位置
			local GoodsID1 = API_GetUIDGoodsPropNum(Uid1,0)--提交的物品ID
			local UidHigh2 = API_RequestGetNumber(200)--高位UID
			local UidLow2 = API_RequestGetNumber(1200)--低位UID
			local Uid2 = API_GetUID(UidHigh2,UidLow2) --获取UID	
			local BoxID2,LocID2 = API_GetUIDGoodsInActor(Uid2,ActorID)--背包ID 和 位置
			local GoodsID2 = API_GetUIDGoodsPropNum(Uid2,0)--提交的物品ID
			local UidHigh3 = API_RequestGetNumber(300)--高位UID
			local UidLow3 = API_RequestGetNumber(1300)--低位UID
			local Uid3 = API_GetUID(UidHigh3,UidLow3) --获取UID	
			local BoxID3,LocID3 = API_GetUIDGoodsInActor(Uid3,ActorID)--背包ID 和 位置
			local GoodsID3 = API_GetUIDGoodsPropNum(Uid3,0)--提交的物品ID
			local GoodsNum3 = API_GetUIDGoodsPropNum(Uid3,3)--提交的物品数量
			if GoodsID1 <= 0 or GoodsID2 <= 0 then
				API_ResponseWrite('<br><text>请放入2件时装，才可以正常进行提升！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if GoodsID3 > 0 and GoodsID3 ~= 82002 then
				API_ResponseWrite('<br><text>请放入时装碎片。</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if FashionExchange_LvUpGoods[GoodsID1] == nil or FashionExchange_LvUpGoods[GoodsID2] == nil then
				API_ResponseWrite('<br><text>此物品不在指定兑换范围内！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if FashionExchange_LvUpGoods[GoodsID1] ~= FashionExchange_LvUpGoods[GoodsID2] then
				API_ResponseWrite('<br><text>请放入相同部位的时装！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			local Bind = 0
			if API_GetUIDGoodsPropNum(Uid1,4) > 0 or API_GetUIDGoodsPropNum(Uid2,4) > 0 then
				Bind = 1
			end
			local OldLoc1 = LocID1 + 1
			local OldTime1 = API_ActorGetGoodsRemainTime(ActorID,BoxID1,OldLoc1) 
			local OldLoc2 = LocID2 + 1
			local OldTime2 = API_ActorGetGoodsRemainTime(ActorID,BoxID2,OldLoc2) 
			local OldTime = math.floor((OldTime1 + OldTime2)/2)
			local GaiLv = 50
			if GoodsNum3 > 0 then
				if BoxID3 < 0 then
					API_ResponseWrite('<br><text>啊，东西掉了，不好意思，重新试试吧！</text><br>') 
					API_ResponseWrite('<br><br><a>确定</a>')
					return
				end
				if GoodsNum3 > 5 then
					GoodsNum3 = 5
				end
				GaiLv = GaiLv + GoodsNum3 * 10
			end
			if BoxID1 < 0 or BoxID2 < 0 then
				API_ResponseWrite('<br><text>啊，东西掉了，不好意思，重新试试吧！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			local LaiYuan = API_ActorGetPropNum(ActorID,201)
			local Type = 9
			local Type2 = 11
			if math.random(100) <= GaiLv then
				local NewType = FashionExchange_LvUpGoods[GoodsID1]
				local NewTab = FashionExchange_LvUpNewGoods[NewType][Sexy]
				if math.random(100) > 5 then
					NewTab = NewTab[1]
				else
					NewTab = NewTab[2]
				end
				local GoodsID = NewTab[math.random(table.getn(NewTab))]
				if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID1,1,BoxID1,LocID1, '时装提升') and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID2,1,BoxID2,LocID2, '时装提升') then
					if GoodsNum3 > 0 then
						API_ActorRemoveGoodsOfLoc(ActorID,GoodsID3,GoodsNum3,BoxID3,LocID3, '时装提升')
					end
					--API_AddActorGoodsFlag(ActorID, GoodsID, 1, Bind, '时装提升成功')
					local NewUid = API_AddActorGoodsPropRetUID(ActorID, GoodsID, 1, Bind, '时装提升成功', -1, -1) 
					local NewBoxID,NewLocID = API_GetUIDGoodsInActor(NewUid,ActorID) 
					NewLocID = NewLocID + 1 
					local RemainTime = API_ActorGetGoodsRemainTime(ActorID,NewBoxID,NewLocID) 
					local DedTime = RemainTime - OldTime
					API_ActorAddGoodsRemainTime(ActorID,NewBoxID,NewLocID,-DedTime) 
					API_ResponseWrite('<br><text>提升时装档次成功，您获得了一个：</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><br>') 
					API_ResponseWrite('<br><br><a>确定</a>')
				end
				if NewType == 1 then
					Type = 9
					if Sexy == 1 then
						Type2 = 11
					else
						Type2 = 12
					end
				else
					Type = 10
					if Sexy == 1 then
						Type2 = 13
					else
						Type2 = 14
					end
				end
				if GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = 2
				else
					GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] = GLOBAL_FengXiangBiao_DateList[44][Type][LaiYuan] + 2
				end
				if GLOBAL_FengXiangBiao_DateList[44][Type2][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[44][Type2][LaiYuan] = 1
				else
					GLOBAL_FengXiangBiao_DateList[44][Type2][LaiYuan] = GLOBAL_FengXiangBiao_DateList[44][Type2][LaiYuan] + 1
				end
			else
				if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID1,1,BoxID1,LocID1, '时装提升') and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID2,1,BoxID2,LocID2, '时装提升') then
					if GoodsNum3 > 0 then
						API_ActorRemoveGoodsOfLoc(ActorID,GoodsID3,GoodsNum3,BoxID3,LocID3, '时装提升')
					end
					API_AddActorGoodsFlag(ActorID, 82002, 4, 1, '时装提升失败')
					API_ResponseWrite('<br><text>提升时装档次失败，您获得了：</text><img srcgd="82002" tipgd="82002"><text> x 4</text><br>') 
					API_ResponseWrite('<br><br><a>确定</a>')
				end
				local Type3 = 15
				if GLOBAL_FengXiangBiao_DateList[44][Type3][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[44][Type3][LaiYuan] = 4
				else
					GLOBAL_FengXiangBiao_DateList[44][Type3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[44][Type3][LaiYuan] + 4
				end
			end
			if GoodsNum3 > 0 then
				local Type3 = 16
				if GLOBAL_FengXiangBiao_DateList[44][Type3][LaiYuan] == nil then
					GLOBAL_FengXiangBiao_DateList[44][Type3][LaiYuan] = GoodsNum3
				else
					GLOBAL_FengXiangBiao_DateList[44][Type3][LaiYuan] = GLOBAL_FengXiangBiao_DateList[44][Type3][LaiYuan] + GoodsNum3
				end
			end
		else
			API_ResponseWrite('<text>提升时装档次说明</text><br>') 
			API_ResponseWrite('<text>    放入两个同部位的白银时装，便有机会</text><text color="255,0,255">将白银时装提升为一件黄金时装！提升后放入的时装消失，请谨慎操作！</text><text color="255,0,0">放入绑定时装，获得的新时装也为绑定！</text><br>') 
			API_ResponseWrite('<text>            </text><goodsHolder name="100"><text>             </text><goodsHolder name="200"><br>')
			API_ResponseWrite('<br><text>  放入时装碎片</text><text color="255,0,255">每块可提高10%成功率，最多可使用五块碎片。</text><br>') 
			API_ResponseWrite('<text>                      </text><goodsHolder name="300"><br>')
			API_ResponseWrite('<br><a href="FashionExchange_Officer?1=3&2=1">  开始提升</a><br>')
			API_ResponseWrite('<br><a href="FashionExchange_Officer">  返回</a>')
		end
	elseif XuanZe == 4 then
		API_ResponseWrite('<name></name>') 
		API_ResponseWrite('<win rect="120, 190, 350, 300" alpha="240" balpha="230"></win>') 
		if API_RequestGetNumber(2) == 1 then
			if API_ActorGetPackageSize(ActorID) < 1 then
				API_ResponseWrite('<br><text>请将背包空出1个位置，方可进行兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			local UidHigh1 = API_RequestGetNumber(100)--高位UID
			local UidLow1 = API_RequestGetNumber(1100)--低位UID
			local Uid1 = API_GetUID(UidHigh1,UidLow1) --获取UID	
			local BoxID1,LocID1 = API_GetUIDGoodsInActor(Uid1,ActorID)--背包ID 和 位置
			local GoodsID1 = API_GetUIDGoodsPropNum(Uid1,0)--提交的物品ID
			if GoodsID1 <= 0 then
				API_ResponseWrite('<br><text>请放入时装宝石，才可以正常进行兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if fuzhuangbaoshixiaoguotable[GoodsID1] == nil then
				API_ResponseWrite('<br><text>此物品不在指定兑换范围内！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if BoxID1 < 0 then
				API_ResponseWrite('<br><text>兑换失败，请重新兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			
			local GoodsSX = API_ActorMeMScrollGetNumber(ActorID, BoxID1, LocID1+1, 1)
			if GoodsSX ~= 0 then
				API_ResponseWrite('<br><text>无法兑换有属性的时装宝石，请重新兑换！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			
			if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID1,1,BoxID1,LocID1, '兑换时装油') then
				--API_AddActorGoods(ActorID,75,1,'兑换时装获得')
				fuzhuangbaoshicuhangjianshuxingadd(ActorID,GoodsID1,0,0)
				API_ResponseWrite('<br><text>兑换完成，您获得了：</text><img srcgd="'..GoodsID1..'" tipgd="'..GoodsID1..'"><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
			end
		else
			API_ResponseWrite('<text>兑换时装宝石</text><br>') 
			API_ResponseWrite('<text>    如果您有无属性的时装宝石，可以到我这里来兑换成有属性的时装宝石哦。</text><br>') 
			API_ResponseWrite('<br><text>   </text><goodsHolder name="100"><br>')
			API_ResponseWrite('<br><a href="FashionExchange_Officer?1=4&2=1">  兑换</a><br>')
			API_ResponseWrite('<br><a href="FashionExchange_Officer">  返回</a><br>')
		end
	elseif XuanZe == 5 then
		API_ResponseWrite('<name></name>') 
		API_ResponseWrite('<win rect="120, 190, 350, 300" alpha="240" balpha="230"></win>') 
		if API_RequestGetNumber(2) == 1 then
			if API_ActorGetPackageSize(ActorID) < 1 then
				API_ResponseWrite('<br><text>请将背包空出1个位置，方可进行合成！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			local UidHigh1 = API_RequestGetNumber(100)--高位UID
			local UidLow1 = API_RequestGetNumber(1100)--低位UID
			local Uid1 = API_GetUID(UidHigh1,UidLow1) --获取UID
			local BoxID1,LocID1 = API_GetUIDGoodsInActor(Uid1,ActorID)--背包ID 和 位置
			local GoodsID1 = API_GetUIDGoodsPropNum(Uid1,0)--提交的物品ID
			local UidHigh2 = API_RequestGetNumber(200)--高位UID
			local UidLow2 = API_RequestGetNumber(1200)--低位UID
			local Uid2 = API_GetUID(UidHigh2,UidLow2) --获取UID	
			local BoxID2,LocID2 = API_GetUIDGoodsInActor(Uid2,ActorID)--背包ID 和 位置
			local GoodsID2 = API_GetUIDGoodsPropNum(Uid2,0)--提交的物品ID
			if GoodsID1 <= 0 or GoodsID2 <= 0 then
				API_ResponseWrite('<br><text>请放入2颗时装宝石，才可以正常进行合成！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if ShiZhuangBaoShiTable[GoodsID1] == nil or ShiZhuangBaoShiTable[GoodsID2] == nil then
				API_ResponseWrite('<br><text>此物品不在指定兑换范围内！</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			--if ShiZhuangBaoShiTable[GoodsID1] == 3 or ShiZhuangBaoShiTable[GoodsID2] == 3 then
				--API_ResponseWrite('<br><text>黄金时装宝石为最高等级宝石不能合成。</text><br>') 
				--API_ResponseWrite('<br><br><a>确定</a>')
				--return
			--end
			if ShiZhuangBaoShiTable[GoodsID1] ~= ShiZhuangBaoShiTable[GoodsID2] then
				API_ResponseWrite('<br><text>请放入两颗等级相同的时装宝石</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end

			local XiaoHaoJinBi = 10000
			if ShiZhuangBaoShiTable[GoodsID1] == 1 then
				XiaoHaoJinBi = 10000
			elseif ShiZhuangBaoShiTable[GoodsID1] == 2 then
				XiaoHaoJinBi = 20000
			elseif ShiZhuangBaoShiTable[GoodsID1] == 3 then
				XiaoHaoJinBi = 0
			end
			local JinBi = API_ActorGetPropNum(ActorID,PD_PROP_MONEY_HOLD)
			if JinBi < XiaoHaoJinBi then
				API_ResponseWrite('<br><text>合成需要消耗'..XiaoHaoJinBi..'金币，您身上携带的金币不足</text><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
				return
			end
			if API_ActorRemoveGoodsOfLoc(ActorID,GoodsID1,1,BoxID1,LocID1, '宝石合成') and API_ActorRemoveGoodsOfLoc(ActorID,GoodsID2,1,BoxID2,LocID2, '宝石合成') then
				API_ActorAddMoney(ActorID,-XiaoHaoJinBi,0,'时装宝石合成')
				local GoodsTable
				if XiaoHaoJinBi == 10000 then
					--API_Trace('1111='..XiaoHaoJinBi)
					GoodsTable = SilverTable
				elseif XiaoHaoJinBi == 20000 then
					--API_Trace('2222='..XiaoHaoJinBi)
					GoodsTable = GoldTable
				elseif XiaoHaoJinBi == 0 then
					--API_Trace('333='..XiaoHaoJinBi)
					GoodsTable = GoldTable
				end
				local GoodsID = GoodsTable[math.random(table.getn(GoodsTable))]
				--API_Trace('GoodsID='..GoodsID)
				if GoodsID > 0 then
					fuzhuangbaoshicuhangjianshuxingadd(ActorID,GoodsID,0,0)
				end
				API_ResponseWrite('<br><text>合成完成，您获得了一个：</text><img srcgd="'..GoodsID..'" tipgd="'..GoodsID..'"><br>') 
				API_ResponseWrite('<br><br><a>确定</a>')
			end
		else
			API_ResponseWrite('<text>时装宝石合成</text><br>') 
			API_ResponseWrite('<text>    使用两颗同级别未绑定的时装宝石，可合成一个更高级别的时装宝石，但黄金宝石合成仅提供一次随机合成其它黄金宝石的机会.使用青铜宝石合成需要消耗10000金币；白银宝石需要消耗20000金币；黄金时装宝石合成不需要消耗金币。</text><br>') 
			API_ResponseWrite('<br><text>   </text><goodsHolder name="100"><text>    </text><goodsHolder name="200"><br>')
			API_ResponseWrite('<br><a href="FashionExchange_Officer?1=5&2=1">  开始合成</a><br>')
			API_ResponseWrite('<br><a href="FashionExchange_Officer">  返回</a><br>')

		end
	else
		API_ResponseWrite('<name></name>') 
		API_ResponseWrite('<win rect="120, 190, 350, 350" alpha="240" balpha="230"></win>') 
		API_ResponseWrite('<text>亲爱的玩家你好：</text><br>') 
		API_ResponseWrite('<br><text>    想提高你的时装属性吗？想要变得更强吗？来试试</text><text color="255,0,255">提升时装档次</text><text>吧。</text><br>') 
		API_ResponseWrite('<text>    如果你拥有未绑定的时装，可以在我这有机会兑换成各种限量白银时装与</text><text color="255,0,0">稀有黄金时装</text><text>，来试试</text><text color="255,0,255">改变时装外形</text><text>吧。</text><br>') 
		API_ResponseWrite('<text>    也可以在我这使用已绑定的时装兑换3个时装续时油！（有机会获得全新时装）</text><br><br>') 
		API_ResponseWrite('<br><a href="FashionExchange_Officer?1=3">  提升时装档次</a><text>              </text><a href="FashionExchange_Officer?1=4">兑换时装宝石</a><br>')
		API_ResponseWrite('<br><a href="FashionExchange_Officer?1=1">  改变时装外形</a><br>')
		API_ResponseWrite('<br><a href="FashionExchange_Officer?1=2">  兑换时装续时油</a><br>')
		API_ResponseWrite('<br><a href="FashionExchange_Officer?1=5">  时装宝石合成</a><br>')
		API_ResponseWrite('<br><a>  关闭</a>')
	end
end

GetFashionIDForNeedNum = {
[	10898	] = 	2	,
[	10899	] = 	2	,
[	10900	] = 	2	,
[	10901	] = 	2	,
[	10902	] = 	2	,
[	10903	] = 	2	,
[	10904	] = 	2	,
[	10905	] = 	2	,
[	10911	] = 	4	,
[	10912	] = 	4	,
[	10917	] = 	1	,
[	10918	] = 	1	,
[	10919	] = 	1	,
[	10920	] = 	1	,
[	10921	] = 	1	,
[	10922	] = 	1	,
[	10928	] = 	1	,
[	10929	] = 	1	,
[	10930	] = 	1	,
[	10931	] = 	1	,
[	10932	] = 	1	,
[	10933	] = 	1	,
[	10934	] = 	1	,
[	10935	] = 	1	,
[	10936	] = 	1	,
[	10937	] = 	1	,
[	10938	] = 	1	,
[	10939	] = 	1	,
[	10940	] = 	2	,
[	10941	] = 	2	,
[	10942	] = 	2	,
[	10943	] = 	2	,
[	10944	] = 	2	,
[	10945	] = 	2	,
[	10946	] = 	1	,
[	10947	] = 	1	,
[	10948	] = 	4	,
[	10949	] = 	4	,
[	10950	] = 	1	,
[	10951	] = 	1	,
[	10952	] = 	1	,
[	10953	] = 	1	,
[	10954	] = 	1	,
[	10955	] = 	1	,
[	10956	] = 	1	,
[	10957	] = 	1	,
[	10986	] = 	1	,
[	10987	] = 	1	,
[	10988	] = 	1	,
[	10989	] = 	1	,
[	10990	] = 	1	,
[	10991	] = 	1	,
[	10992	] = 	1	,
[	10993	] = 	1	,
[	10994	] = 	1	,
[	10995	] = 	1	,
[	10996	] = 	1	,
[	10997	] = 	1	,
[	10998	] = 	1	,
[	11009	] = 	2	,
[	11010	] = 	2	,
[	11011	] = 	2	,
[	11012	] = 	2	,
[	11026	] = 	1	,
[	11027	] = 	1	,
[	11028	] = 	1	,
[	11029	] = 	1	,
[	11030	] = 	1	,
[	11031	] = 	1	,
[	11032	] = 	1	,
[	11033	] = 	1	,
[	11034	] = 	4	,
[	11035	] = 	4	,
[	11036	] = 	1	,
[	11037	] = 	1	,
[	11038	] = 	1	,
[	11039	] = 	1	,
[	11040	] = 	1	,
[	11041	] = 	1	,
[	11042	] = 	4	,
[	11043	] = 	4	,
[	11044	] = 	2	,
[	11045	] = 	2	,
[	11046	] = 	1	,
[	11047	] = 	1	,
[	11048	] = 	2	,
[	11049	] = 	2	,
[	11050	] = 	2	,
[	11051	] = 	2	,
[	11052	] = 	2	,
[	11053	] = 	2	,
[	11054	] = 	2	,
[	11055	] = 	2	,
[	11056	] = 	2	,
[	11057	] = 	2	,
[	11058	] = 	2	,
[	11059	] = 	2	,
[	11060	] = 	2	,
[	11061	] = 	2	,
[	11062	] = 	2	,
[	11063	] = 	2	,
[	11064	] = 	2	,
[	11065	] = 	2	,
[	11066	] = 	2	,
[	11067	] = 	2	,
[	11068	] = 	2	,
[	11069	] = 	1	,
[	11070	] = 	1	,
[	11071	] = 	2	,
[	11072	] = 	2	,
[	11073	] = 	2	,
[	11074	] = 	2	,
[	11075	] = 	1	,
[	11076	] = 	1	,
[	11077	] = 	1	,
[	11078	] = 	1	,
[	11079	] = 	1	,
[	11080	] = 	1	,
[	11081	] = 	1	,
[	11082	] = 	1	,
[	11083	] = 	1	,
[	11084	] = 	1	,
[	11085	] = 	1	,
[	11086	] = 	1	,
[	11087	] = 	1	,
[	11088	] = 	1	,
[	11089	] = 	1	,
[	11090	] = 	1	,
[	11091	] = 	1	,
[	11092	] = 	2	,
[	11093	] = 	2	,
[	11094	] = 	1	,
[	11095	] = 	1	,
[	11096	] = 	1	,
[	11097	] = 	1	,
[	11098	] = 	1	,
[	11099	] = 	1	,
[	11100	] = 	1	,
[	11101	] = 	1	,
[	11102	] = 	1	,
[	11103	] = 	1	,
[	11104	] = 	1	,
[	11105	] = 	1	,
[	11106	] = 	1	,
[	11107	] = 	1	,
[	11108	] = 	4	,
[	11109	] = 	4	,
[	11110	] = 	4	,
[	11111	] = 	4	,
[	11112	] = 	4	,
[	11113	] = 	1	,
[	11114	] = 	1	,
[	11115	] = 	1	,
[	11116	] = 	1	,
[	11133	] = 	1	,
[	11134	] = 	1	,
[	11135	] = 	1	,
[	11136	] = 	1	,
[	11137	] = 	1	,
[	11138	] = 	1	,
[	11139	] = 	1	,
[	11140	] = 	1	,
[	11240	] = 	1	,
[	11241	] = 	1	,
[	11242	] = 	1	,
[	11243	] = 	1	,
[	11244	] = 	1	,
[	11245	] = 	1	,
[	11246	] = 	1	,
[	11247	] = 	1	,
[	11248	] = 	1	,
[	11249	] = 	1	,
[	11250	] = 	1	,
[	11251	] = 	1	,
[	11252	] = 	4	,
[	11253	] = 	4	,
[	11254	] = 	4	,
[	11255	] = 	4	,
[	11270	] = 	4	,
[	11271	] = 	4	,
[	11272	] = 	4	,
[	11273	] = 	4	,
[	11274	] = 	4	,
[	11275	] = 	4	,
[	11276	] = 	4	,
[	11277	] = 	4	,
[	11278	] = 	4	,
[	11279	] = 	4	,
[	11280	] = 	4	,
[	11281	] = 	4	,
[	11282	] = 	4	,
[	11283	] = 	4	,
[	11284	] = 	4	,
[	11285	] = 	4	,
[	11286	] = 	4	,
[	11287	] = 	4	,
[	11288	] = 	4	,
[	11289	] = 	4	,
[	11290	] = 	4	,
[	11291	] = 	4	,
[	11292	] = 	4	,
[	11303	] = 	4	,
[	11304	] = 	4	,
[	11305	] = 	4	,
[	11306	] = 	4	,
[	11307	] = 	4	,
[	11313	] = 	4	,
[	11314	] = 	4	,
[	11315	] = 	4	,
[	11316	] = 	4	,
[	11317	] = 	4	,
[	11326	] = 	4	,
[	11327	] = 	4	,
[	11328	] = 	4	,
[	11329	] = 	4	,
[	11330	] = 	4	,
[	11331	] = 	4	,
[	11332	] = 	4	,
[	11333	] = 	4	,
[	11334	] = 	4	,
[	11335	] = 	4	,
[	11336	] = 	4	,
[	11337	] = 	4	,
[	11338	] = 	4	,
[	11339	] = 	2	,
[	11340	] = 	4	,
[	11341	] = 	4	,
[	11342	] = 	4	,
[	11343	] = 	4	,
[	11501	] = 	4	,
[	11502	] = 	4	,
[	11503	] = 	4	,
[	11504	] = 	4	,
[	11505	] = 	4	,
[	11506	] = 	4	,
[	11507	] = 	4	,
[	11508	] = 	4	,
[	11509	] = 	4	,
[	11510	] = 	4	,
[	11511	] = 	2	,
[	11512	] = 	2	,
[	11513	] = 	4	,
[	11514	] = 	4	,
[	11515	] = 	4	,
[	11516	] = 	4	,
[	11517	] = 	4	,
[	11518	] = 	4	,
[	11519	] = 	4	,
[	11520	] = 	4	,
}

function GetFashionDressMedicineNum(ActorID,GoodsID,GoodsLv)
	local Num = 20
	if GetFashionIDForNeedNum[GoodsID] ~= nil then
		Num = GetFashionIDForNeedNum[GoodsID] * 4
	end
	return Num
end
