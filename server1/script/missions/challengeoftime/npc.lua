-- description	: T�o NPC
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\battles\\battlehead.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")
-- Th�m bi�n global
Include("\\script\\global\\anhquach\\env.lua")
--

-- S� l��ng qu�i v�t <=> File v� tr�
map_posfiles = {
	[8] = {"\\settings\\maps\\challengeoftime\\lineup8.txt", 1},	
	[16] = {"\\settings\\maps\\challengeoftime\\lineup16.txt", 1},	
	[20] = {"\\settings\\maps\\challengeoftime\\lineup20.txt", 1},
	[24] = {"\\settings\\maps\\challengeoftime\\lineup24.txt", 1},
	[32] = {"\\settings\\maps\\challengeoftime\\lineup32.txt", 1},
	[40] = {"\\settings\\maps\\challengeoftime\\lineup40.txt", 1},
	[56] = {"\\settings\\maps\\challengeoftime\\lineup56.txt", 1}
};

-- ID c�a NPC c� th� l� 3 lo�i: s�, b�ng, h�m
-- � ngh�a c�c c�t tham s� c�a NPC: <S� l��ng lo�i NPC>, <Ph�n th��ng>, <X� l� sau ��, ID, t�n, c�p ��, ng� h�nh, c� ph�i BOSS kh�ng (0: kh�ng, 1: c�), s� l��ng, v� tr�>

-- Qu�i v�t c�p s� c�p
map_lnpc = {
	-- 1
	{1, {1.5, 0, nil},
		{nil, 975, "S��ng �ao ", 75, -1, 0, 16, func_npc_getpos}},
	-- 2
	{1, {1.5, 0, nil},
		{nil, 976, "Phi Sa", 75, -1, 0, 16, func_npc_getpos}},
	-- 3
	{1, {3, 0, nil},
		{nil, 977, "S��ng Li�m", 75, -1, 0, 20, func_npc_getpos}},
	-- 4
	{2,	{9, 0, nil},
		{nil, 975, "S��ng �ao ", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 5
	{1, {3, 0, nil},
		{nil, 978, "Th�a Phong", 75, -1, 0, 20, func_npc_getpos}},
	-- 6
	{1, {4.5, 0, nil},
		{nil, 979, "Th�y H�n", 75, 1, 0, 24, func_npc_getpos}},
	-- 7
	{1, {4.5, 0, nil},
		{nil, 980, "Th�n T� ", 75, 3, 0, 24, func_npc_getpos}},
	-- 8
	{2,	{6, 10, nil},
		{nil, 976, "Phi Sa", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 9
	{1, {5, 0, nil},
		{nil, 981, "Tranh H�n", 75, 2, 0, 32, func_npc_getpos}},
	-- 10
	{1, {5, 0, nil},
		{nil, 982, "Ph� Lang", 75, 4, 0, 32, func_npc_getpos}},
	-- 11
	{2,	{9, 0, nil},
		{nil, 977, "S��ng Li�m", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 12
	{1, {6, 0, nil},
		{nil, 983, "�nh C�n", 75, 0, 0, 40, func_npc_getpos}},
	-- 13
	{2,	{6, 10, nil},
		{nil, 978, "Th�a Phong", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 14
	{1,	{4.5, 0, nil},
		{nil, 987, "Giang Tr�m Y�n", 75, -1, 0, 20, func_npc_getpos}},
	-- 15
	{1,	{6, 0, nil},
		{nil, 984, "�ao T� ", 75, -1, 0, 32, func_npc_getpos}},
	-- 16
	{2,	{9, 0, nil},
		{nil, 979, "Th�y H�n", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 17
	{1,	{4.5, 0, nil},
		{nil, 988, "C� D�  T�u", 75, -1, 0, 20, func_npc_getpos}},
	-- 18
	{2,	{6, 10, nil},
		{nil, 980, "Th�n T� ", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 19
	{1,	{4.5, 0, nil},
		{nil, 989, "Ch��ng B�t Ph��ng", 75, -1, 0, 20, func_npc_getpos}},
	-- 20
	{1,	{6, 0, nil},
		{nil, 985, "Lang b�ng", 75, -1, 0, 24, func_npc_getpos}},
	-- 21
	{2,	{10.5, 0, nil},
		{nil, 981, "Tranh H�n", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 22
	{1,	{4.5, 0, nil},
		{nil, 990, "Ti�n Than Th� ", 75, -1, 0, 20, func_npc_getpos}},
	-- 23
	{1,	{4.5, 0, nil},
		{nil, 991, "Nh�m T�ng Ho�nh", 75, -1, 0, 20, func_npc_getpos}},
	-- 24
	{1,	{7.5, 30, nil},
		{nil, 992, "�� T�n Sinh", 75, -1, 0, 20, func_npc_getpos}},
	-- 25
	{2,	{9, 0, nil},
		{nil, 984, "�ao T� ", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 26
	{1, {7.5, 0, nil},
		{nil, 986, "H�c C�n", 75, -1, 0, 56, func_npc_getpos}},
	-- 27
	{2, {24, 15, nil},
		{nil, 1006, "Nhi�p Th� Tr�n", 75, -1, 0, 1, {1568, 3227}},
		{nil, 985, "Lang b�ng", 75, -1, 0, 16, func_npc_getpos}},
	-- 28
	{1, {0, 0, nil},
		{nil, 993, func_npc_get_eachname, 75, -1, 1, 8, func_npc_getpos}},
};

-- Qu�i v�t c�p cao c�p
map_hnpc = {
	-- 1
	{1, {2, 0, nil},
		{nil, 1007, "S��ng �ao ", 95, -1, 0, 16, func_npc_getpos}},
	-- 2
	{1, {2, 0, nil},
		{nil, 1008, "Phi Sa", 95, -1, 0, 16, func_npc_getpos}},
	-- 3
	{1, {3, 0, nil},
		{nil, 1009, "S��ng Li�m", 95, -1, 0, 20, func_npc_getpos}},
	-- 4
	{2, {9, 0, nil},
		{nil, 1007, "S��ng �ao ", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 5
	{1, {3, 0, nil},
		{nil, 1010, "Th�a Phong", 95, -1, 0, 20, func_npc_getpos}},
	-- 6
	{1, {5, 0, nil},
		{nil, 1011, "Th�y H�n", 95, 1, 0, 24, func_npc_getpos}},
	-- 7
	{1, {5, 0, nil},
		{nil, 1012, "Th�n T� ", 95, 3, 0, 24, func_npc_getpos}},
	-- 8
	{2, {9, 15, nil},
		{nil, 1008, "Phi Sa", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 9
	{1, {6, 0, nil},
		{nil, 1013, "Tranh H�n", 95, 2, 0, 32, func_npc_getpos}},
	-- 10
	{1, {6, 0, nil},
		{nil, 1014, "Ph� Lang", 95, 4, 0, 32, func_npc_getpos}},
	-- 11
	{2, {12, 0, nil},
		{nil, 1009, "S��ng Li�m", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 12
	{1, {9, 0, nil},
		{nil, 1015, "�nh C�n", 95, 0, 0, 40, func_npc_getpos}},
	-- 13
	{2, {9, 15, nil},
		{nil, 1010, "Th�a Phong", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 14
	{1, {6, 0, nil},
		{nil, 1019, "Giang Tr�m Y�n", 95, -1, 0, 20, func_npc_getpos}},
	-- 15
	{1, {9, 0, nil},
		{nil, 1016, "�ao T� ", 95, -1, 0, 32, func_npc_getpos}},
	-- 16
	{2, {14, 0, nil},
		{nil, 1011, "Th�y H�n", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 17
	{1, {6, 0, nil},
		{nil, 1020, "C� D�  T�u", 95, -1, 0, 20, func_npc_getpos}},
	-- 18
	{2, {12, 20, nil},
		{nil, 1012, "Th�n T� ", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 19
	{1, {6, 0, nil},
		{nil, 1021, "Ch��ng B�t Ph��ng", 95, -1, 0, 20, func_npc_getpos}},
	-- 20
	{1, {8, 0, nil},
		{nil, 1017, "Lang b�ng", 95, -1, 0, 24, func_npc_getpos}},
	-- 21
	{2, {14, 0, nil},
		{nil, 1013, "Tranh H�n", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 22
	{1, {6, 0, nil},
		{nil, 1022, "Ti�n Than Th� ", 95, -1, 0, 20, func_npc_getpos}},
	-- 23
	{1, {6, 0, nil},
		{nil, 1023, "Nh�m T�ng Ho�nh", 95, -1, 0, 20, func_npc_getpos}},
	-- 24
	{1, {10, 20, nil},
		{nil, 1024, "�� T�n Sinh", 95, -1, 0, 20, func_npc_getpos}},
	-- 25
	{2, {15, 0, nil},
		{nil, 1016, "�ao T� ", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 26
	{1, {9, 0, nil},
		{nil, 1018, "H�c C�n", 95, -1, 0, 56, func_npc_getpos}},
	-- 27
	{2, {32, 32, nil},
		{nil, 1038, "Nhi�p Th� Tr�n", 95, -1, 1, 1, {1568, 3227}},
		{nil, 1017, "Lang b�ng", 95, -1, 0, 16, func_npc_getpos}},
	-- 28
	{1, {0, 0, nil},
		{nil, 1025, func_npc_get_eachname, 75, -1, 1, 8, func_npc_getpos}},
};

-- Qu�i v�t c�a �i �n s� c�p
map_lo_hidden_npc = {
	-- Ng��i ch�i b�ng x�p h�ng Th�p ��i L�i Nh�n T�ng Kim khi�u chi�n
	{1,	{0, 0, nil}, {nil, {994, 1001}, {func_ladder_getname, 10119}, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- Ng��i ch�i b�ng x�p h�ng khi�u chi�n th�i gian s� c�p
	{1,	{0, 0, nil}, {nil, {994, 1001}, {func_ladder_getname, 10179}, 75, func_npc_getseries, 1, 1, {1568, 3227}}}
};

-- Qu�i v�t c�a �i �n cao c�p
map_hi_hidden_npc = {
	-- Ng��i ch�i b�ng x�p h�ng Th�p ��i L�i Nh�n T�ng Kim khi�u chi�n
	{1,	{0, 0, nil}, {nil, {1026, 1033}, {func_ladder_getname, 10119}, 75, -1, 1, 1, {1568, 3227}}},
	-- Ng��i ch�i b�ng x�p h�ng khi�u chi�n th�i gian cao c�p
	{1,	{0, 0, nil}, {nil, {1026, 1033}, {func_ladder_getname, 10180}, 75, -1, 1, 1, {1568, 3227}}}
};

-- С��߱�� �� ��boss
map_new_Ncp = {
	[1] = {nil, 1673, "Ti�u Nhi�p Th� Tr�n", 95, -1, 1, 1, {1568, 3227}},
	[2] = { nNpcId = 1674, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_C� B�ch",	nIsboss = 1,},
	[3] = { nNpcId = 1675, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_Huy�n Gi�c ��i S�",	nIsboss = 1,},
	[4] = { nNpcId = 1676, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_���ng B�t Nhi�m",	nIsboss = 1,},
	[5] = { nNpcId = 1677, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_Lam Y Y",	nIsboss = 1,},
	[6] = { nNpcId = 1678, nLevel = 95,	bNoRevive = 1, szName = "V��t �i _Thanh Hi�u S� Th�i",	nIsboss = 1,},
	[7] = { nNpcId = 1679, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_Chung Linh T�",	nIsboss = 1,},
	[8] = { nNpcId = 1680, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_H� Nh�n Ng�",	nIsboss = 1,},
	[9] = { nNpcId = 1681, nLevel = 95,	bNoRevive = 1, szName = "V��t �i _�oan M�c Du�",	nIsboss = 1,},
	[10] = { nNpcId = 1682, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_��o Thanh Ch�n Nh�n",	nIsboss = 1,},
	[11] = { nNpcId = 1683, nLevel = 95,	bNoRevive = 1, szName = "V��t �i _To�n C� T�",	nIsboss = 1,},
};

-- NPC truy�n t�ng b�n �� m�i
map_transfer_npc = {
	[1] = { nNpcId = 1684,	bNoRevive = 1, szName = "V��t �i_Ng��i ti�p d�n M�t Ph�ng", szScriptPath = "\\script\\missions\\challengeoftime\\npc\\transfer.lua"},
}

-- H�m kinh nghi�m ph�n th��ng v��t �i t� th� s� c�p
function lo_exp_award(time)
	local min = floor(time / 60);
	if (min >= 25) then
		return 15 * VUOT_AI_TY_LE_EXP_KET_THUC;
	else
		return (floor(172 * (1 - min / 25)) + 10) * VUOT_AI_TY_LE_EXP_KET_THUC;
	end
end

-- Ph�n th��ng v��t �i t� th� s� c�p: Ng� Hoa, Kinh nghi�m, V�t ph�m
---- 0 = 0 ng� hoa
---- nil = 0 v�t ph�m
map_laward_success = {
	lo_exp_award, 0, nil
};

-- H�m kinh nghi�m ph�n th��ng v��t �i t� th� cao c�p
function hi_exp_award(time)
	local min = floor(time / 60);
	if (min >= 25) then
		return 30 * VUOT_AI_TY_LE_EXP_KET_THUC;
	else
		return (floor(233 * (1 - min / 25)) + 20) * VUOT_AI_TY_LE_EXP_KET_THUC;
	end
end

-- Ph�n th��ng v��t �i t� th� cao c�p: Ng� Hoa, Kinh nghi�m, V�t ph�m
---- 0 = 0 ng� hoa
---- nil = 0 v�t ph�m
map_haward_success = {
	hi_exp_award, 0, nil
};

-- Ph�n th��ng ng�u nhi�n, c� s� ng�u
map_random_awards = VUOT_AI_THUONG_AI_AN
-- map_random_awards = {
-- 	100000,
-- 	{0.005, 	{"Tinh H�ng B�o Th�ch",		353}},
-- 	{0.005, 	{"Lam Th�y Tinh", 			238}},
-- 	{0.005, 	{"T� Th�y Tinh", 			239}},
-- 	{0.005, 	{"L�c Th�y Tinh", 			240}},
-- 	{0.0005, 	{"V� L�m M�t T�ch", 		6, 1, 26, 1, 0, 0}},
-- 	{0.0005, 	{"T�y T�y Kinh",			6, 1, 22, 1, 0, 0}},
-- 	{0.2, 		{"Ph�c Duy�n L� (��i) ",	6, 1, 124, 1, 0, 0}},
-- 	{0.19587, 	{"Ph�c Duy�n L� (Trung) ", 	6, 1, 123, 1, 0, 0}},
-- 	{0.18, 		{"Ph�c Duy�n L� (Ti�u) ",	6, 1, 122, 1, 0, 0}},
-- 	{0.15, 		{"Ti�n Th�o L� ",			6, 1, 71, 1, 0, 0}},
-- 	{0.1, 		{"Thi�n s�n  B�o L� ",		6, 1, 72, 1, 0, 0}},
-- 	{0.1, 		{"B�ch Qu� L� ",			6, 1, 73, 1, 0, 0}},
-- 	{0.00, 		{"��i B�ch C�u ho�n",		6, 1, 130, 1, 0, 0}},
-- 	{0.05, 		{"L�nh b�i Phong L�ng ��",		489}},
-- 	{0.0005, 	{"��nh Qu�c Thanh Sa Tr��ng Sam",	0, 159}},
-- 	{0.0005, 	{"��nh Qu�c � Sa Ph�t Qu�n",	0, 160}},
-- 	{0.0005,	{"��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",	0, 161}},
-- 	{0.0005,	{"��nh Qu�c T� ��ng H� uy�n",	0, 162}},
-- 	{0.0005,	{"��nh Qu�c Ng�n T�m Y�u ��i",	0, 163}},
-- 	{0.0001,	{"An Bang B�ng Tinh Th�ch H�ng Li�n",0, 164}},
-- 	{0.0001,	{"An Bang C�c Hoa Th�ch Ch� ho�n",0, 165}},
-- 	{0.0001,	{"An Bang �i�n Ho�ng Th�ch Ng�c B�i",0, 166}},
-- 	{0.0001,	{"An Bang K� Huy�t Th�ch Gi�i Ch� ",0, 167}},
-- 	{0.00001, 	{"M�ng Long Kim Ti Ch�nh H�ng C� Sa",	0, 2}},
-- 	{0.00001, 	{"T� Kh�ng Gi�ng Ma Gi�i �ao",	0, 11}},
-- 	{0.00001,	{"Ph�c Ma T� Kim C�n",	0, 6}},
-- 	{0.00001,	{"K� Nghi�p B�n L�i To�n Long th��ng",	0, 21}},
-- 	{0.00001,	{"Ng� Long L��ng Ng�n B�o �ao",	0, 26}},
-- 	{0.00001,	{"��a Ph�ch H�c Di�m Xung Thi�n Li�n",0, 87}},
-- 	{0.00001,	{"B�ng H�n ��n Ch� Phi �ao",0, 71}},
-- 	{0.00001,	{"S�m Hoang Phi Tinh �o�t H�n",0, 81}},
-- 	{0.00001,	{"Thi�n Quang ��nh T�m Ng�ng Th�n Ph� ",0, 77}},
-- 	{0.00001, 	{"Ch� Ph��c Di�t L�i C�nh Ph� ",	0, 67}},
-- 	{0.00001, 	{"Minh �o T� S�t ��c Nh�n",	0, 61}},
-- 	{0.00001,	{"T� Ho�ng Ph�ng Nghi �ao",	0, 46}},
-- 	{0.00001,	{"B�ch H�i Uy�n ��ng Li�n Ho�n �ao",	0, 51}},
-- 	{0.00001,	{"V� Ma H�ng Truy Nhuy�n Th�p h�i",	0, 40}},
-- 	{0.00001,	{"V� Ma T�y T��ng Ng�c Kh�u ",0, 39}},
-- 	{0.00001,	{"C�p Phong Tam Thanh Ph� ",0, 122}},
-- 	{0.00001,	{"V� �o B�c Minh ��o qu�n",0, 136}},
-- 	{0.00001,	{"S��ng Tinh Thi�n Ni�n H�n Thi�t",0, 126}},
-- 	{0.00001,	{"L�i Khung Thi�n ��a H� ph� ",	0, 132}},
-- 	{0.00001,	{"Ma Th� s�n  H�i Phi H�ng L� ",	0, 115}},
-- 	{0.00001,	{"Ma Ho�ng �n Xu�t H� H�ng Khuy�n",	0, 107}},
-- 	{0.00001,	{"��ng C�u Kh�ng Long H� Uy�n",0, 94}},
-- 	{0.00001,	{"��ch Kh�i L�c Ng�c Tr��ng",0, 96}},
-- };

-- L�y ID c�a NPC
function get_npc_id(item, index)
	local id = item[NPC_ATTRIDX_ID];
	local id_type = type(id);
	-- N�u item[NPC_ATTRIDX_ID] l� m�t h�m, th� th�c thi h�m
	if (id_type == "function") then
		return id(item, index);
	-- N�u item[NPC_ATTRIDX_ID] l� m�t s�, th� tr� v� s� n�y l� ID c�a NPC
	elseif (id_type == "number") then
		return id;
	-- N�u item[NPC_ATTRIDX_ID] l� m�t table (list) ch�a nhi�u ID, th� tr� v� 1 ID ng�u nhi�n trong table
	-- V� d�: {1026, 1033} => tr� v� 1 ID ng�u nhi�n trong 1026 v� 1033
	elseif (id_type == "table") then
		local pos = random(1, getn(id));
		return id[pos];
	end
end

-- L�y t�n NPC
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

-- L�y c�p �� NPC
function get_npc_level(item, index)
	-- DEBUG
--	print(format("get_npc_level():%d", item[NPC_ATTRIDX_LEVEL]));
	return item[NPC_ATTRIDX_LEVEL];
end

-- L�y ng� h�nh NPC
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

-- NPC x� l� h�u k� (th�m index ng��i ch�i �ang s� d�ng hi�n t�i)
function npc_proceed(item)
	local proceed = item[NPC_ATTRIDX_PROCEED];
	local proceed_type = type(proceed);
	if (proceed_type == "function") then
		proceed(item);
	end
end

-- L�y s� l��ng NPC
function get_npc_count(item)
	return item[NPC_ATTRIDX_COUNT];
end

-- L�y v� tr� NPC
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

-- C� ph�i l� BOSS kh�ng
function get_npc_isboss(item)
	return item[NPC_ATTRIDX_ISBOSS];
end

-- Cu�c V��t �i hi�n t�i c� ph�i l� cao c�p kh�ng
function advanced()
	world = SubWorldIdx2ID(SubWorld);
	return map_isadvanced[world] ~= 0;
end

-- B�ng c�i ��t NPC hi�n t�i
function current_npc_map()
	if (advanced()) then
		return map_hnpc;
	else
		return map_lnpc;
	end
end

-- L�y s� l��ng ��t
function get_batch_count()
	return getn(current_npc_map());
end

-- T�o NPC theo thi�t l�p, tr� v� s� l��ng NPC �� t�o
function add_npc(item)
	local npc_count = get_npc_count(item);			-- S� l��ng NPC
	local res_count = 0;							-- S� l��ng NPC �� t�o
	
	for index = 1, npc_count do
		local id = get_npc_id(item, index);			-- ID c�a NPC
		local level = get_npc_level(item, index);	-- C�p �� NPC
		local isboss = get_npc_isboss(item, index);	-- C� ph�i BOSS kh�ng
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
			level,		-- C�p ��
			series,		-- Ng� h�nh
			SubWorld,	-- B�n ��
			px * 32,	-- T�a �� X
			py * 32,	-- T�a �� Y
			1,			-- Kh�ng t�i sinh
			name,		-- T�n
			isboss);	-- C� ph�i BOSS kh�ng
		if (npc_index ~= nil and npc_index > 0) then
			res_count = res_count + 1;
			-- Thi�t l�p t� vong script
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
	--print(format("������%dֻ��", count));
	
	SetMissionV(VARV_NPC_COUNT, count);
	return count;
end

-- T�o NPC tr�n b�n ��
function create_batch_npc(batch)
	local map = current_npc_map();
	npc = map[batch];		-- ������

	local npc_count = create_all_npc(npc);	
	-- DEBUG
	
	-- �i�u ch�nh �i by wangjingjun 2011.03.01
	if batch == GetMissionV(VARV_XIAONIESHICHEN_BATCH) and GetMissionV(VARV_BATCH_MODEL) == 1 then
	--	local nX,nY = func_npc_getpos()
	--	WriteLog("x = " .. tostring(nX) .. " Y = " .. tostring(nY))
	--	WriteLog("MapId = " .. tostring(SubWorldIdx2ID(SubWorld)))
		add_npc(map_new_Ncp[1])
	--	basemission_CallNpc(map_new_Ncp[1], SubWorldIdx2ID(SubWorld),nX, nY)
		SetMissionV(VARV_NPC_COUNT, npc_count + 1);
		WriteLog("Ti�u Nhi�p Th� Tr�n �� tham gia chi�n cu�c!")
		Msg2MSAll(MISSION_MATCH, "Ti�u Nhi�p Th� Tr�n �� tham gia chi�n cu�c!");
	end

	local msg = "Xu�t hi�n <color=yellow>" .. npc_count .. "<color> con qu�i!";
	Msg2MSAll(MISSION_MATCH, msg);
	
	-- �i 11 xu�t hi�n NPC ��i tho�i nhi�m v� h�ng ng�y
	if (batch == 11) then
		-- L�m m�i NPC ��i tho�i nhi�m v� h�ng ng�y
		%tbTalkDailyTask:AddTalkNpc(SubWorldIdx2ID(SubWorld), SubWorldIdx2ID(SubWorld));
	end
end


-- Th�m NPC d�ch chuy�n �i
function add_transfer_npc()
	local nX,nY, nMapIndex = GetPos()
	basemission_CallNpc(map_transfer_npc[1], SubWorldIdx2ID(nMapIndex),1568*32, 3227*32)
end