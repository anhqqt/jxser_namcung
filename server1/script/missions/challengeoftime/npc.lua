-- description	: Tπo NPC
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\battles\\battlehead.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")
-- Th™m bi’n global
Include("\\script\\global\\anhquach\\env.lua")
--

-- SË l≠Óng qu∏i vÀt <=> File vﬁ tr›
map_posfiles = {
	[8] = {"\\settings\\maps\\challengeoftime\\lineup8.txt", 1},	
	[16] = {"\\settings\\maps\\challengeoftime\\lineup16.txt", 1},	
	[20] = {"\\settings\\maps\\challengeoftime\\lineup20.txt", 1},
	[24] = {"\\settings\\maps\\challengeoftime\\lineup24.txt", 1},
	[32] = {"\\settings\\maps\\challengeoftime\\lineup32.txt", 1},
	[40] = {"\\settings\\maps\\challengeoftime\\lineup40.txt", 1},
	[56] = {"\\settings\\maps\\challengeoftime\\lineup56.txt", 1}
};

-- ID cÒa NPC c„ th” lµ 3 loπi: sË, b∂ng, hµm
-- ˝ ngh‹a c∏c cÈt tham sË cÒa NPC: <SË l≠Óng loπi NPC>, <Ph«n th≠Îng>, <Xˆ l˝ sau Æ„, ID, t™n, c p ÆÈ, ngÚ hµnh, c„ ph∂i BOSS kh´ng (0: kh´ng, 1: c„), sË l≠Óng, vﬁ tr›>

-- Qu∏i vÀt c p s¨ c p
map_lnpc = {
	-- 1
	{1, {1.5, 0, nil},
		{nil, 975, "S≠¨ng ßao ", 75, -1, 0, 16, func_npc_getpos}},
	-- 2
	{1, {1.5, 0, nil},
		{nil, 976, "Phi Sa", 75, -1, 0, 16, func_npc_getpos}},
	-- 3
	{1, {3, 0, nil},
		{nil, 977, "S≠¨ng Li™m", 75, -1, 0, 20, func_npc_getpos}},
	-- 4
	{2,	{9, 0, nil},
		{nil, 975, "S≠¨ng ßao ", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 5
	{1, {3, 0, nil},
		{nil, 978, "Thıa Phong", 75, -1, 0, 20, func_npc_getpos}},
	-- 6
	{1, {4.5, 0, nil},
		{nil, 979, "ThÒy HÂn", 75, 1, 0, 24, func_npc_getpos}},
	-- 7
	{1, {4.5, 0, nil},
		{nil, 980, "Th«n T˝ ", 75, 3, 0, 24, func_npc_getpos}},
	-- 8
	{2,	{6, 10, nil},
		{nil, 976, "Phi Sa", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 9
	{1, {5, 0, nil},
		{nil, 981, "Tranh H∏n", 75, 2, 0, 32, func_npc_getpos}},
	-- 10
	{1, {5, 0, nil},
		{nil, 982, "Ph∏ Lang", 75, 4, 0, 32, func_npc_getpos}},
	-- 11
	{2,	{9, 0, nil},
		{nil, 977, "S≠¨ng Li™m", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 12
	{1, {6, 0, nil},
		{nil, 983, "∂nh C´n", 75, 0, 0, 40, func_npc_getpos}},
	-- 13
	{2,	{6, 10, nil},
		{nil, 978, "Thıa Phong", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 14
	{1,	{4.5, 0, nil},
		{nil, 987, "Giang Tr«m Y’n", 75, -1, 0, 20, func_npc_getpos}},
	-- 15
	{1,	{6, 0, nil},
		{nil, 984, "ßao Tˆ ", 75, -1, 0, 32, func_npc_getpos}},
	-- 16
	{2,	{9, 0, nil},
		{nil, 979, "ThÒy HÂn", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 17
	{1,	{4.5, 0, nil},
		{nil, 988, "C´ D˘  T»u", 75, -1, 0, 20, func_npc_getpos}},
	-- 18
	{2,	{6, 10, nil},
		{nil, 980, "Th«n T˝ ", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 19
	{1,	{4.5, 0, nil},
		{nil, 989, "Ch≠Îng B∏t Ph≠¨ng", 75, -1, 0, 20, func_npc_getpos}},
	-- 20
	{1,	{6, 0, nil},
		{nil, 985, "Lang bÊng", 75, -1, 0, 24, func_npc_getpos}},
	-- 21
	{2,	{10.5, 0, nil},
		{nil, 981, "Tranh H∏n", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 22
	{1,	{4.5, 0, nil},
		{nil, 990, "Ti‘n Than Th™ ", 75, -1, 0, 20, func_npc_getpos}},
	-- 23
	{1,	{4.5, 0, nil},
		{nil, 991, "NhÀm T´ng Hoµnh", 75, -1, 0, 20, func_npc_getpos}},
	-- 24
	{1,	{7.5, 30, nil},
		{nil, 992, "ßÂ Tµn Sinh", 75, -1, 0, 20, func_npc_getpos}},
	-- 25
	{2,	{9, 0, nil},
		{nil, 984, "ßao Tˆ ", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 26
	{1, {7.5, 0, nil},
		{nil, 986, "Hæc C©n", 75, -1, 0, 56, func_npc_getpos}},
	-- 27
	{2, {24, 15, nil},
		{nil, 1006, "Nhi’p Th› Tr«n", 75, -1, 0, 1, {1568, 3227}},
		{nil, 985, "Lang bÊng", 75, -1, 0, 16, func_npc_getpos}},
	-- 28
	{1, {0, 0, nil},
		{nil, 993, func_npc_get_eachname, 75, -1, 1, 8, func_npc_getpos}},
};

-- Qu∏i vÀt c p cao c p
map_hnpc = {
	-- 1
	{1, {2, 0, nil},
		{nil, 1007, "S≠¨ng ßao ", 95, -1, 0, 16, func_npc_getpos}},
	-- 2
	{1, {2, 0, nil},
		{nil, 1008, "Phi Sa", 95, -1, 0, 16, func_npc_getpos}},
	-- 3
	{1, {3, 0, nil},
		{nil, 1009, "S≠¨ng Li™m", 95, -1, 0, 20, func_npc_getpos}},
	-- 4
	{2, {9, 0, nil},
		{nil, 1007, "S≠¨ng ßao ", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 5
	{1, {3, 0, nil},
		{nil, 1010, "Thıa Phong", 95, -1, 0, 20, func_npc_getpos}},
	-- 6
	{1, {5, 0, nil},
		{nil, 1011, "ThÒy HÂn", 95, 1, 0, 24, func_npc_getpos}},
	-- 7
	{1, {5, 0, nil},
		{nil, 1012, "Th«n T˝ ", 95, 3, 0, 24, func_npc_getpos}},
	-- 8
	{2, {9, 15, nil},
		{nil, 1008, "Phi Sa", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 9
	{1, {6, 0, nil},
		{nil, 1013, "Tranh H∏n", 95, 2, 0, 32, func_npc_getpos}},
	-- 10
	{1, {6, 0, nil},
		{nil, 1014, "Ph∏ Lang", 95, 4, 0, 32, func_npc_getpos}},
	-- 11
	{2, {12, 0, nil},
		{nil, 1009, "S≠¨ng Li™m", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 12
	{1, {9, 0, nil},
		{nil, 1015, "∂nh C´n", 95, 0, 0, 40, func_npc_getpos}},
	-- 13
	{2, {9, 15, nil},
		{nil, 1010, "Thıa Phong", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 14
	{1, {6, 0, nil},
		{nil, 1019, "Giang Tr«m Y’n", 95, -1, 0, 20, func_npc_getpos}},
	-- 15
	{1, {9, 0, nil},
		{nil, 1016, "ßao Tˆ ", 95, -1, 0, 32, func_npc_getpos}},
	-- 16
	{2, {14, 0, nil},
		{nil, 1011, "ThÒy HÂn", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 17
	{1, {6, 0, nil},
		{nil, 1020, "C´ D˘  T»u", 95, -1, 0, 20, func_npc_getpos}},
	-- 18
	{2, {12, 20, nil},
		{nil, 1012, "Th«n T˝ ", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 19
	{1, {6, 0, nil},
		{nil, 1021, "Ch≠Îng B∏t Ph≠¨ng", 95, -1, 0, 20, func_npc_getpos}},
	-- 20
	{1, {8, 0, nil},
		{nil, 1017, "Lang bÊng", 95, -1, 0, 24, func_npc_getpos}},
	-- 21
	{2, {14, 0, nil},
		{nil, 1013, "Tranh H∏n", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 22
	{1, {6, 0, nil},
		{nil, 1022, "Ti‘n Than Th™ ", 95, -1, 0, 20, func_npc_getpos}},
	-- 23
	{1, {6, 0, nil},
		{nil, 1023, "NhÀm T´ng Hoµnh", 95, -1, 0, 20, func_npc_getpos}},
	-- 24
	{1, {10, 20, nil},
		{nil, 1024, "ßÂ Tµn Sinh", 95, -1, 0, 20, func_npc_getpos}},
	-- 25
	{2, {15, 0, nil},
		{nil, 1016, "ßao Tˆ ", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 26
	{1, {9, 0, nil},
		{nil, 1018, "Hæc C©n", 95, -1, 0, 56, func_npc_getpos}},
	-- 27
	{2, {32, 32, nil},
		{nil, 1038, "Nhi’p Th› Tr«n", 95, -1, 1, 1, {1568, 3227}},
		{nil, 1017, "Lang bÊng", 95, -1, 0, 16, func_npc_getpos}},
	-- 28
	{1, {0, 0, nil},
		{nil, 1025, func_npc_get_eachname, 75, -1, 1, 8, func_npc_getpos}},
};

-- Qu∏i vÀt cˆa ∂i »n s¨ c p
map_lo_hidden_npc = {
	-- Ng≠Íi ch¨i b∂ng x’p hπng ThÀp ßπi L´i Nh©n TËng Kim khi™u chi’n
	{1,	{0, 0, nil}, {nil, {994, 1001}, {func_ladder_getname, 10119}, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- Ng≠Íi ch¨i b∂ng x’p hπng khi™u chi’n thÍi gian s¨ c p
	{1,	{0, 0, nil}, {nil, {994, 1001}, {func_ladder_getname, 10179}, 75, func_npc_getseries, 1, 1, {1568, 3227}}}
};

-- Qu∏i vÀt cˆa ∂i »n cao c p
map_hi_hidden_npc = {
	-- Ng≠Íi ch¨i b∂ng x’p hπng ThÀp ßπi L´i Nh©n TËng Kim khi™u chi’n
	{1,	{0, 0, nil}, {nil, {1026, 1033}, {func_ladder_getname, 10119}, 75, -1, 1, 1, {1568, 3227}}},
	-- Ng≠Íi ch¨i b∂ng x’p hπng khi™u chi’n thÍi gian cao c p
	{1,	{0, 0, nil}, {nil, {1026, 1033}, {func_ladder_getname, 10180}, 75, -1, 1, 1, {1568, 3227}}}
};

-- –°ƒÙﬂ±≥æ ∫Õ –¬boss
map_new_Ncp = {
	[1] = {nil, 1673, "Ti”u Nhi’p Th› Tr«n", 95, -1, 1, 1, {1568, 3227}},
	[2] = { nNpcId = 1674, nLevel = 95,	bNoRevive = 1, szName = "V≠Ót ∂i_CÊ B∏ch",	nIsboss = 1,},
	[3] = { nNpcId = 1675, nLevel = 95,	bNoRevive = 1, szName = "V≠Ót ∂i_Huy“n Gi∏c ßπi S≠",	nIsboss = 1,},
	[4] = { nNpcId = 1676, nLevel = 95,	bNoRevive = 1, szName = "V≠Ót ∂i_ß≠Íng B t Nhi‘m",	nIsboss = 1,},
	[5] = { nNpcId = 1677, nLevel = 95,	bNoRevive = 1, szName = "V≠Ót ∂i_Lam Y Y",	nIsboss = 1,},
	[6] = { nNpcId = 1678, nLevel = 95,	bNoRevive = 1, szName = "V≠Ót ∂i _Thanh Hi”u S≠ Th∏i",	nIsboss = 1,},
	[7] = { nNpcId = 1679, nLevel = 95,	bNoRevive = 1, szName = "V≠Ót ∂i_Chung Linh TÛ",	nIsboss = 1,},
	[8] = { nNpcId = 1680, nLevel = 95,	bNoRevive = 1, szName = "V≠Ót ∂i_Hµ Nh©n Ng∂",	nIsboss = 1,},
	[9] = { nNpcId = 1681, nLevel = 95,	bNoRevive = 1, szName = "V≠Ót ∂i _ßoan MÈc Du÷",	nIsboss = 1,},
	[10] = { nNpcId = 1682, nLevel = 95,	bNoRevive = 1, szName = "V≠Ót ∂i_ßπo Thanh Ch©n Nh©n",	nIsboss = 1,},
	[11] = { nNpcId = 1683, nLevel = 95,	bNoRevive = 1, szName = "V≠Ót ∂i _Toµn C¨ Tˆ",	nIsboss = 1,},
};

-- NPC truy“n tËng b∂n ÆÂ mÌi
map_transfer_npc = {
	[1] = { nNpcId = 1684,	bNoRevive = 1, szName = "V≠Ót ∂i_Ng≠Íi ti’p d…n MÀt Phﬂng", szScriptPath = "\\script\\missions\\challengeoftime\\npc\\transfer.lua"},
}

-- Hµm kinh nghi÷m ph«n th≠Îng v≠Ót ∂i t˚ th› s¨ c p
function lo_exp_award(time)
	local min = floor(time / 60);
	if (min >= 25) then
		return 15 * VUOT_AI_TY_LE_EXP_KET_THUC;
	else
		return (floor(172 * (1 - min / 25)) + 10) * VUOT_AI_TY_LE_EXP_KET_THUC;
	end
end

-- Ph«n th≠Îng v≠Ót ∂i t˚ th› s¨ c p: NgÚ Hoa, Kinh nghi÷m, VÀt ph»m
---- 0 = 0 ngÚ hoa
---- nil = 0 vÀt ph»m
map_laward_success = {
	lo_exp_award, 0, nil
};

-- Hµm kinh nghi÷m ph«n th≠Îng v≠Ót ∂i t˚ th› cao c p
function hi_exp_award(time)
	local min = floor(time / 60);
	if (min >= 25) then
		return 30 * VUOT_AI_TY_LE_EXP_KET_THUC;
	else
		return (floor(233 * (1 - min / 25)) + 20) * VUOT_AI_TY_LE_EXP_KET_THUC;
	end
end

-- Ph«n th≠Îng v≠Ót ∂i t˚ th› cao c p: NgÚ Hoa, Kinh nghi÷m, VÀt ph»m
---- 0 = 0 ngÚ hoa
---- nil = 0 vÀt ph»m
map_haward_success = {
	hi_exp_award, 0, nil
};

-- Ph«n th≠Îng ng…u nhi™n, c¨ sË ng…u
map_random_awards = VUOT_AI_THUONG_AI_AN
-- map_random_awards = {
-- 	100000,
-- 	{0.005, 	{"Tinh HÂng B∂o Thπch",		353}},
-- 	{0.005, 	{"Lam ThÒy Tinh", 			238}},
-- 	{0.005, 	{"Tˆ ThÒy Tinh", 			239}},
-- 	{0.005, 	{"LÙc ThÒy Tinh", 			240}},
-- 	{0.0005, 	{"V‚ L©m MÀt Tﬁch", 		6, 1, 26, 1, 0, 0}},
-- 	{0.0005, 	{"T»y TÒy Kinh",			6, 1, 22, 1, 0, 0}},
-- 	{0.2, 		{"PhÛc Duy™n LÈ (ßπi) ",	6, 1, 124, 1, 0, 0}},
-- 	{0.19587, 	{"PhÛc Duy™n LÈ (Trung) ", 	6, 1, 123, 1, 0, 0}},
-- 	{0.18, 		{"PhÛc Duy™n LÈ (Ti”u) ",	6, 1, 122, 1, 0, 0}},
-- 	{0.15, 		{"Ti™n Th∂o LÈ ",			6, 1, 71, 1, 0, 0}},
-- 	{0.1, 		{"Thi™n s¨n  B∂o LÈ ",		6, 1, 72, 1, 0, 0}},
-- 	{0.1, 		{"B∏ch Qu∂ LÈ ",			6, 1, 73, 1, 0, 0}},
-- 	{0.00, 		{"ßπi Bπch C©u hoµn",		6, 1, 130, 1, 0, 0}},
-- 	{0.05, 		{"L÷nh bµi Phong L®ng ßÈ",		489}},
-- 	{0.0005, 	{"ßﬁnh QuËc Thanh Sa Tr≠Íng Sam",	0, 159}},
-- 	{0.0005, 	{"ßﬁnh QuËc § Sa Ph∏t Qu∏n",	0, 160}},
-- 	{0.0005,	{"ßﬁnh QuËc X›ch Quy™n Nhuy‘n Ngoa",	0, 161}},
-- 	{0.0005,	{"ßﬁnh QuËc Tˆ ßªng HÈ uy”n",	0, 162}},
-- 	{0.0005,	{"ßﬁnh QuËc Ng©n Tµm Y™u Æ∏i",	0, 163}},
-- 	{0.0001,	{"An Bang B®ng Tinh Thπch Hπng Li™n",0, 164}},
-- 	{0.0001,	{"An Bang CÛc Hoa Thπch Chÿ hoµn",0, 165}},
-- 	{0.0001,	{"An Bang ßi“n Hoµng Thπch Ng‰c BÈi",0, 166}},
-- 	{0.0001,	{"An Bang K™ Huy’t Thπch GiÌi Chÿ ",0, 167}},
-- 	{0.00001, 	{"MÈng Long Kim Ti Ch›nh HÂng Cµ Sa",	0, 2}},
-- 	{0.00001, 	{"T¯ Kh´ng Gi∏ng Ma GiÌi Æao",	0, 11}},
-- 	{0.00001,	{"PhÙc Ma Tˆ Kim C´n",	0, 6}},
-- 	{0.00001,	{"K’ Nghi÷p B´n L´i Toµn Long th≠¨ng",	0, 21}},
-- 	{0.00001,	{"Ng˘ Long L≠Óng Ng©n B∂o Æao",	0, 26}},
-- 	{0.00001,	{"ßﬁa Ph∏ch Hæc Di÷m Xung Thi™n Li™n",0, 87}},
-- 	{0.00001,	{"B®ng Hµn ß¨n Chÿ Phi ßao",0, 71}},
-- 	{0.00001,	{"S©m Hoang Phi Tinh ßoπt HÂn",0, 81}},
-- 	{0.00001,	{"Thi™n Quang ßﬁnh T©m Ng≠ng Th«n PhÔ ",0, 77}},
-- 	{0.00001, 	{"ChÛ Ph≠Óc Di÷t L´i C∂nh PhÔ ",	0, 67}},
-- 	{0.00001, 	{"Minh ∂o Tµ S∏t ßÈc NhÀn",	0, 61}},
-- 	{0.00001,	{"T™ Hoµng PhÙng Nghi Æao",	0, 46}},
-- 	{0.00001,	{"B›ch H∂i Uy™n ¶¨ng Li™n Hoµn Æao",	0, 51}},
-- 	{0.00001,	{"V´ Ma HÂng Truy Nhuy‘n Th∏p hµi",	0, 40}},
-- 	{0.00001,	{"V´ Ma T»y T≠Óng Ng‰c Kh u ",0, 39}},
-- 	{0.00001,	{"CÀp Phong Tam Thanh PhÔ ",0, 122}},
-- 	{0.00001,	{"VÙ ∂o Bæc Minh ßπo qu∏n",0, 136}},
-- 	{0.00001,	{"S≠¨ng Tinh Thi™n Ni™n Hµn Thi’t",0, 126}},
-- 	{0.00001,	{"L´i Khung Thi™n ßﬁa HÈ phÔ ",	0, 132}},
-- 	{0.00001,	{"Ma Thﬁ s¨n  H∂i Phi HÂng L˝ ",	0, 115}},
-- 	{0.00001,	{"Ma Hoµng ∏n Xu t HÊ Hπng Khuy™n",	0, 107}},
-- 	{0.00001,	{"ßÂng Cıu Kh∏ng Long HÈ Uy”n",0, 94}},
-- 	{0.00001,	{"ßﬁch Kh∏i LÙc Ng‰c Tr≠Óng",0, 96}},
-- };

-- L y ID cÒa NPC
function get_npc_id(item, index)
	local id = item[NPC_ATTRIDX_ID];
	local id_type = type(id);
	-- N’u item[NPC_ATTRIDX_ID] lµ mÈt hµm, th◊ th˘c thi hµm
	if (id_type == "function") then
		return id(item, index);
	-- N’u item[NPC_ATTRIDX_ID] lµ mÈt sË, th◊ tr∂ v“ sË nµy lµ ID cÒa NPC
	elseif (id_type == "number") then
		return id;
	-- N’u item[NPC_ATTRIDX_ID] lµ mÈt table (list) ch¯a nhi“u ID, th◊ tr∂ v“ 1 ID ng…u nhi™n trong table
	-- V› dÙ: {1026, 1033} => tr∂ v“ 1 ID ng…u nhi™n trong 1026 vµ 1033
	elseif (id_type == "table") then
		local pos = random(1, getn(id));
		return id[pos];
	end
end

-- L y t™n NPC
function get_npc_name(item, index)
	local name = item[NPC_ATTRIDX_NAME];
	local name_type = type(name);
	-- DEBUG
--	print(format("get_npc_name(): item is %s", name_type));
	
	if (name_type == "string") then
		return name;
	elseif (name_type == "function") then
		return name(item, index);
	elseif (name_type == "table") then
		local func = name[1];
		return func(item, index);
	else
		return nil;
	end
end

-- L y c p ÆÈ NPC
function get_npc_level(item, index)
	-- DEBUG
--	print(format("get_npc_level():%d", item[NPC_ATTRIDX_LEVEL]));
	return item[NPC_ATTRIDX_LEVEL];
end

-- L y ngÚ hµnh NPC
---- -1 = random
function get_npc_series(item, index)
	local series = item[NPC_ATTRIDX_SERIES];
	local series_type = type(series);
	if (series_type == "function") then
		return series(item, index);
	elseif (series_type == "number") then
		if (series < 0) then
			local pos = random(1, getn(map_series));
			return map_series[pos];
		else
			return series;
		end
	else
		return nil;
	end
end

-- NPC xˆ l˝ hÀu k˙ (th™m index ng≠Íi ch¨i Æang sˆ dÙng hi÷n tπi)
function npc_proceed(item)
	local proceed = item[NPC_ATTRIDX_PROCEED];
	local proceed_type = type(proceed);
	if (proceed_type == "function") then
		proceed(item);
	end
end

-- L y sË l≠Óng NPC
function get_npc_count(item)
	return item[NPC_ATTRIDX_COUNT];
end

-- L y vﬁ tr› NPC
function get_npc_pos(item, index)
	local pos = item[NPC_ATTRIDX_POSITION];
	local pos_type = type(pos);
	if (pos_type == "table") then
		return pos[1], pos[2];
	elseif (pos_type == "function") then
		return pos(item, index);
	else
		return nil;
	end
end

-- C„ ph∂i lµ BOSS kh´ng
function get_npc_isboss(item)
	return item[NPC_ATTRIDX_ISBOSS];
end

-- CuÈc V≠Ót ∂i hi÷n tπi c„ ph∂i lµ cao c p kh´ng
function advanced()
	world = SubWorldIdx2ID(SubWorld);
	return map_isadvanced[world] ~= 0;
end

-- B∂ng cµi Æ∆t NPC hi÷n tπi
function current_npc_map()
	if (advanced()) then
		return map_hnpc;
	else
		return map_lnpc;
	end
end

-- L y sË l≠Óng ÆÓt
function get_batch_count()
	return getn(current_npc_map());
end

-- Tπo NPC theo thi’t lÀp, tr∂ v“ sË l≠Óng NPC Æ∑ tπo
function add_npc(item)
	local npc_count = get_npc_count(item);			-- SË l≠Óng NPC
	local res_count = 0;							-- SË l≠Óng NPC Æ∑ tπo
	
	for index = 1, npc_count do
		local id = get_npc_id(item, index);			-- ID cÒa NPC
		local level = get_npc_level(item, index);	-- C p ÆÈ NPC
		local isboss = get_npc_isboss(item, index);	-- C„ ph∂i BOSS kh´ng
		local series = get_npc_series(item, index);
		local name = get_npc_name(item, index);
		local px, py = get_npc_pos(item, index);
		npc_proceed(item);
		
		-- DEBUG
--		print("AddNpcEx");
--		print(format("id:%d", id));
--		print(format("level:%d", level));
--		print(format("series:%d", series));
--		print(format("isboss:%d", isboss));
--		print(format("name:%s", name));
--		print(format("pos: %d, %d", px, py));

		local npc_index = AddNpcEx(
			id,			-- ID
			level,		-- C p ÆÈ
			series,		-- NgÚ hµnh
			SubWorld,	-- B∂n ÆÂ
			px * 32,	-- T‰a ÆÈ X
			py * 32,	-- T‰a ÆÈ Y
			1,			-- Kh´ng t∏i sinh
			name,		-- T™n
			isboss);	-- C„ ph∂i BOSS kh´ng
		if (npc_index ~= nil and npc_index > 0) then
			res_count = res_count + 1;
			-- Thi’t lÀp tˆ vong script
			-- "\\script\\missions\\challengeoftime\\npc_death.lua" + OnDeath()
			SetNpcDeathScript(npc_index, SCRIPT_NPC_DEATH);
		else
			-- DEBUG
			local msg = format("Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!!!",
				id, level, series, SubWorld, px, py, 1, name, isboss);
			print(msg);
		end
	end
	
	return res_count;
end

function create_all_npc(npcs)
	local times = npcs[1];
	local count = 0;
	for i = 1, times do
		count = count + add_npc(npcs[i + 2]);
	end
	-- DEBUG
	--print(format("≤˙…˙¡À%d÷ªπ÷", count));
	
	SetMissionV(VARV_NPC_COUNT, count);
	return count;
end

-- Tπo NPC tr™n b∂n ÆÂ
function create_batch_npc(batch)
	local map = current_npc_map();
	npc = map[batch];		-- ≥ıº∂π÷

	local npc_count = create_all_npc(npc);	
	-- DEBUG
	
	-- ßi“u chÿnh ∂i by wangjingjun 2011.03.01
	if batch == GetMissionV(VARV_XIAONIESHICHEN_BATCH) and GetMissionV(VARV_BATCH_MODEL) == 1 then
	--	local nX,nY = func_npc_getpos()
	--	WriteLog("x = " .. tostring(nX) .. " Y = " .. tostring(nY))
	--	WriteLog("MapId = " .. tostring(SubWorldIdx2ID(SubWorld)))
		add_npc(map_new_Ncp[1])
	--	basemission_CallNpc(map_new_Ncp[1], SubWorldIdx2ID(SubWorld),nX, nY)
		SetMissionV(VARV_NPC_COUNT, npc_count + 1);
		WriteLog("Ti”u Nhi’p Th› Tr«n Æ∑ tham gia chi’n cuÈc!")
		Msg2MSAll(MISSION_MATCH, "Ti”u Nhi’p Th› Tr«n Æ∑ tham gia chi’n cuÈc!");
	end

	local msg = "Xu t hi÷n <color=yellow>" .. npc_count .. "<color> con qu∏i!";
	Msg2MSAll(MISSION_MATCH, msg);
	
	-- ∂i 11 xu t hi÷n NPC ÆËi thoπi nhi÷m vÙ hµng ngµy
	if (batch == 11) then
		-- Lµm mÌi NPC ÆËi thoπi nhi÷m vÙ hµng ngµy
		%tbTalkDailyTask:AddTalkNpc(SubWorldIdx2ID(SubWorld), SubWorldIdx2ID(SubWorld));
	end
end


-- Th™m NPC dﬁch chuy”n ∂i
function add_transfer_npc()
	local nX,nY, nMapIndex = GetPos()
	basemission_CallNpc(map_transfer_npc[1], SubWorldIdx2ID(nMapIndex),1568*32, 3227*32)
end