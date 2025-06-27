-- Th�m bi�n global
Include("\\script\\global\\anhquach\\env.lua")
IncludeLib("RELAYLADDER")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan
Include("\\script\\missions\\boss\\bigboss.lua") -- big boss

MISSION_MATCH			= 22		-- V� d�: nhi�m v� PVP
TIMER_MATCH				= 41		-- B� h�n gi� b�t ��u V��t �i
TIMER_BOARD				= 42		-- B� h�n gi� th�ng c�o
TIMER_CLOSE				= 43		-- B� h�n gi� k�t th�c V��t �i
INTERVAL_BOARD			= 1			-- Kho�ng c�ch th�ng b�o (ph�t): M�i ph�t th�ng b�o m�t l�n
INTERVAL_MATCH			= 3600		-- M�i gi� V��t �i m�t l�n (gi�y)
TIME_SIGNUP				= 10
LIMIT_SIGNUP			= TIME_SIGNUP * 60		-- Th�i gian b�o danh (ph�t): 10 ph�t
LIMIT_FINISH 			= 30 * 60	-- Th�i gian nhi�m v� (ph�t): 30 ph�t
BOAT_POSX				= 1559		-- Ng��i ch�i b� truy�n t�ng ��n t�a �� X c�a Thuy�n
BOAT_POSY				= 3226		-- Ng��i ch�i b� truy�n t�ng ��n t�a �� Y c�a Thuy�n
LIMIT_PLAYER_COUNT		= 8			-- Gi�i h�n t�i �a s� l��ng ng��i ch�i
AWARD_COUNT				= 10		-- Sau khi ho�n th�nh t�t c� c�c �i c� th� chia 10 h�p b�u �i

SEX_BOY					= 0			-- Gi�i t�nh nam
SEX_GIRL				= 1			-- Gi�i t�nh n�
SEX_RENYAO				= 2			-- Nh�n y�u

-- �i�u ch�nh �i 2011.03.04
CHUANGGUAN30_MAP_ID		= 957
CHUANGGUAN30_TIME_LIMIT = 13*60		-- Th�i gian c�n ho�n th�nh s�m h�n � �i 29
CHUANGGUAN30_START_TIME = 10
CHUANGGUAN30_END_TIME	= 22
PLAYER_MAP_TASK			= 2852
COUNT_LIMIT 			= VUOT_AI_LIMIT_NGAY -- S� l�n v��t �i t�i �a trong ng�y



-- � ngh�a c�c c�t trong b�ng NPC
-- � ngh�a c�c c�t tham s� c�a NPC: x� l� sau ��, ID, t�n, c�p ��, ng� h�nh, c� ph�i BOSS kh�ng (0: kh�ng, 1: c�), s� l��ng, v� tr�.
-- {nil, {1026, 1033}, {func_ladder_getname, 10119}, 75, -1, 1, 1, {1568, 3227}}
NPC_ATTRIDX_PROCEED		= 1			-- X� l� NPC sau ��
NPC_ATTRIDX_ID			= 2			-- ID c�a NPC
NPC_ATTRIDX_NAME		= 3			-- T�n NPC
NPC_ATTRIDX_LEVEL		= 4			-- C�p �� NPC
NPC_ATTRIDX_SERIES		= 5			-- Ng� h�nh NPC
NPC_ATTRIDX_ISBOSS		= 6			-- C� ph�i BOSS kh�ng
NPC_ATTRIDX_COUNT		= 7			-- S� l��ng NPC
NPC_ATTRIDX_POSITION	= 8			-- V� tr� NPC

USE_NAME_ALL_PLAYERS	= 1			-- S� d�ng t�n c�a to�n th� ng��i ch�i
USE_NAME_THE_TOPLIST	= 2			-- S� d�ng ng�u nhi�n t�n c�a top ng��i ch�i ��ng ��u

VARS_TEAM_NAME			= 1			-- T�n ��i
-- ���±�����(VARS_PLAYER_NAME + 1)��(VARS_PLAYER_NAME + LIMIT_PLAYER_COUNT)�ֱ𱣴治ͬ��ҵ�����
VARS_PLAYER_NAME		= 2			-- T�n ng��i ch�i
VARS_TEAMLEADER_FACTION = 11        -- M�n ph�i ��i tr��ng
VARS_TEAMLEADER_GENDER  = 12        -- Gi�i t�nh ��i tr��ng

VARV_NPC_BATCH 			= 1			-- ��t qu�i
VARV_NPC_COUNT 			= 2			-- S� l��ng qu�i trong ��t
VARV_PLAYER_COUNT		= 3			-- S� l��ng ng��i ch�i
VARV_STATE 				= 4			-- Tr�ng th�i nhi�m v�: 1 bi�u th� b�o danh, 2 bi�u th� V��t �i
VARV_SIGNUP_WORLD		= 5			-- B�n �� b�o danh
VARV_SIGNUP_POSX		= 6			-- T�a �� X c�a �i�m b�o danh
VARV_SIGNUP_POSY		= 7			-- T�a �� Y c�a �i�m b�o danh
VARV_BOARD_TIMER		= 8			-- Th�i gian ti�n h�nh V��t �i (ph�t)
VARV_PLAYER_TOTAL_COUNT = 9			-- T�ng s� l��ng ng��i ch�i (kh�ng qu�n c� ph�i �� t� vong)
VARV_PLAYER_USE_INDEX	= 10		-- Ch� m�c ng��i ch�i �� s� d�ng
VARV_NPC_USE_INDEX		= 11		-- Ch� m�c NPC �� s� d�ng
VARV_MISSION_RESULT		= 12		-- K�t qu� nhi�m v�: 1 l� th�ng l�i v��t �i, 0 l� th�t b�i
VARV_PLAYER_SEX			= 13
-- ���±�����(VARV_PLAYER_SEX + 1)��(VARV_PLAYER_SEX + LIMIT_PLAYER_COUNT)�ֱ𱣴治ͬ��ҵ��Ա𣬣�Ϊ���ԣ���ΪŮ�ԣ���Ϊ����
VARV_PLAYER_SERIES		= VARV_PLAYER_SEX + LIMIT_PLAYER_COUNT + 1		-- 22


VARV_XIAONIESHICHEN_BATCH = 31		-- �i Qu�i �c M�ng Nh� xu�t hi�n
VARV_BATCH_MODEL		= 32			-- Ch� �� c�a �i hi�n t�i: 0 l� ch� �� b�nh th��ng, 1 l� ch� �� �� �i�u ch�nh


-- C�c bi�n t� (VARV_PLAYER_SERIES + 1) ��n (VARV_PLAYER_SERIES + LIMIT_PLAYER_COUNT) l�n l��t b�o qu�n ng� h�nh c�a nh�ng ng��i ch�i kh�c nhau

SCRIPT_NPC_DEATH 	= "\\script\\missions\\challengeoftime\\npc_death.lua"
SCRIPT_PLAYER_DEATH = "\\script\\missions\\challengeoftime\\player_death.lua"

-- ID b�n �� V��t �i
map_map = {
	464,
	465,
	466,
	467,
	468,
	469,
	470,
	471,
	472,
	473,
	474,
	475,
	476,
	477,
	478,
	479,
	
	480,
	481,
	482,
	483,
	484,
	485,
	486,
	487,
	488,
	489,
	490,
	491,
	492,
	493,
	494,
	495
};

-- ��i �ng b�n �� c� ph�i V��t �i cao c�p
map_isadvanced = {
	[464] = 0,
	[465] = 0,
	[466] = 0,
	[467] = 0,
	[468] = 0,
	[469] = 0,
	[470] = 0,
	[471] = 0,
	[472] = 0,
	[473] = 0,
	[474] = 0,
	[475] = 0,
	[476] = 0,
	[477] = 0,
	[478] = 0,
	[479] = 0,
	
	[480] = 1,
	[481] = 1,
	[482] = 1,
	[483] = 1,
	[484] = 1,
	[485] = 1,
	[486] = 1,
	[487] = 1,
	[488] = 1,
	[489] = 1,
	[490] = 1,
	[491] = 1,
	[492] = 1,
	[493] = 1,
	[494] = 1,
	[495] = 1
};


-- Ng� h�nh
map_series = {
	0,	-- Kim
	1,	-- M�c
	2,	-- Th�y
	3,	-- H�a
	4	-- Th�
};

-- T�n NPC d� b�
map_npcname_candidates = {
	"H�u  Kh�t Ki�m",
	"�i�u D�ch �ao",
	"Ki�u ��nh Thi�n",
	"Nh�m Th��ng Khung",
	"B� Hi�u Tr�n",
	"M�u Tu�t Nhung",
	"H�ng Ph� Nhai"
};

-- Ph�t s�ng
function broadcast(msg)
	AddGlobalNews(msg);
end

-- �u�i ng��i ch�i v� �i�m b�o danh
function kickout()
	local index = 0;
	local player = 0;
	local players = {}
	local i = 1
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			players[i] = player
			i = i + 1
		end
		if (index == 0) then
			break;
		end	
	end
	
	local world = GetMissionV(VARV_SIGNUP_WORLD);
	local pos_x = GetMissionV(VARV_SIGNUP_POSX);
	local pos_y = GetMissionV(VARV_SIGNUP_POSY); 
	local OldPlayerIndex = PlayerIndex;
	for i = 1, getn(players) do 
		PlayerIndex = players[i];
		
		DelMSPlayer(MISSION_MATCH,1);
		SetLogoutRV(0);
		NewWorld(world, pos_x, pos_y);
	end
	PlayerIndex = OldPlayerIndex;
end

-- Kh�i ��ng b� h�n gi� th�ng c�o
function start_board_timer()
	StartMissionTimer(MISSION_MATCH, TIMER_BOARD, INTERVAL_BOARD * 60 * 18);
end

-- ��ng B� H�n Gi� Th�ng C�o
function close_board_timer()
	StopMissionTimer(MISSION_MATCH, TIMER_BOARD);
end

-- Kh�i ��ng b� h�n gi� ��ng V��t �i
function start_close_timer()
	-- 10 ph�t sau kh�i ��ng nhi�m v� V��t �i
	StartMissionTimer(MISSION_MATCH, TIMER_CLOSE, LIMIT_FINISH * 18);
end

-- �رձ����رն�ʱ��
function close_close_timer()
	-- 10 ph�t sau kh�i ��ng nhi�m v� V��t �i
	StopMissionTimer(MISSION_MATCH, TIMER_CLOSE);
end

-- K�t th�c V��t �i
function close_match()
	-- �u�i ng��i ch�i ra kh�i b�n ��
	kickout();
	
	-- D�n d�p b�n ��
	world = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(world, 1);	-- C�ng d�n d�p ng��i ch�i
	ClearMapTrap(world); 
	ClearMapObj(world);
end

-- L�y t�p h�p ng��i ch�i
function get_player_map()
	-- T�p h�p ng��i ch�i
	local players = {};
		
	-- Duy�t Qua T�ng Th�nh Vi�n, L�u Th�ng Tin Ng��i Ch�i V�o T�p H�p
	local index = 0;
	local player = 0;
	local player_count = 0;
	local old_index = PlayerIndex;
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			player_count = player_count + 1;
			if (player_count > LIMIT_PLAYER_COUNT) then
				print(format("Mission player count exceed the limit %d!!!", LIMIT_PLAYER_COUNT));
				break;
			else
				-- DEBUG
				--print(format("player[%d]'s index:%d", player_count, player));
				PlayerIndex = player;
				players[player_count] = {
					GetName(),		-- T�n ng��i ch�i
					GetSex(),		-- Gi�i t�nh ng��i ch�i
					GetSeries()}; 	-- Ng� h�nh ng��i ch�i
				-- DEBUG
				--print(format("players[%d], index:%d, name:%s, sex:%d, series:%d",
				--	player_count,
				--	player,
				--	GetName(),
				--	GetSex(),
				--	GetSeries()));
			end
		end
		if (index == 0) then
			break;
		end	
	end
	PlayerIndex = old_index;
	
	-- DEBUG
	--print(format("Now, we have %d players", getn(players)));

	return players;
end

-- X�a m�t ph�n t� kh�i m�t b�ng, tr� v� b�ng m�i
function remove_element(map, index)
	local result = {};
	local count = 1;
	for i = 1, getn(map) do
		if (i ~= index) then
			result[count] = map[i];
			count = count + 1;
		end
	end
	return result;
end

-- L�u t�n ng��i ch�i, gi�i t�nh v�o bi�n mission
function save_player_info()
	local players = get_player_map();
	-- DEBUG
	--print(format("We got %d players", getn(players)));
	for index = 1,getn(players) do
		-- S�p x�p ng�u nhi�n
		-- players = remove_element(players, random(1, getn(players)));
		SetMissionS(VARS_PLAYER_NAME + index, players[index][1]);	-- ����
		SetMissionV(VARV_PLAYER_SEX + index, players[index][2]);	-- �Ա�
		SetMissionV(VARV_PLAYER_SERIES + index, players[index][3]);	-- ����
		-- DEBUG
		--print(format("SetMissionS(%d, %s)", VARS_PLAYER_NAME + index, players[index][1]));	-- ����
		--print(format("SetMissionV(%d, %d)", VARV_PLAYER_SEX + index, players[index][2]));	-- �Ա�
		--print(format("SetMissionV(%d, %d)", VARV_PLAYER_SERIES + index, players[index][3]));	-- ����
	end
	
	-- �������
	SetMissionV(VARV_PLAYER_TOTAL_COUNT, getn(players));
	SetMissionV(VARV_PLAYER_USE_INDEX, 0);
end

lo_range_id = {
	{994, 1001},
	{1002, 1005}
};

hi_range_id = {
	{1026, 1033},
	{1034, 1037}
};

-- L�y ID NPC ng�u nhi�n d�a tr�n gi�i t�nh
function get_random_npc_id(sex)
	if (sex ~= 0 and sex ~= 1) then
		-- Nh�n y�u n�n x� l� th� n�o?
		return nil;
	end

	local range_id = lo_range_id;
	if (advanced()) then
		range_id = hi_range_id;
	end
	return random(range_id[sex + 1][1], range_id[sex + 1][2]);
end

-- ��c v� tr� NPC t� file
function get_file_pos(file, line, column)
	x = GetTabFileData(file, line, column);
	y = GetTabFileData(file, line, column + 1);
	return x, y;
end

function func_npc_getid(item, index)
	-- L�y ch� m�c ng��i ch�i �ang s� d�ng
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	local player_sex = GetMissionV(VARV_PLAYER_SEX + player_use_index);	
		
	-- N�u S� L��ng Ng��i Ch�i Kh�ng ��, Th� Ng�u Nhi�n T�o ID NPC Nam
	local result = 0;
	if (player_use_index > player_all_count) then
		result = get_random_npc_id(0);
	else
		-- L�y Gi�i T�nh Ng��i Ch�i Hi�n T�i D�a Tr�n Ch� M�c Ng��i Ch�i �� S� D�ng
		result = get_random_npc_id(player_sex);
	end

	-- DEBUG
	--print(format("func_npc_getid():%d, player_use_index:%d, player_all_count:%d, player_sex:%d",
	--	result, player_use_index, player_all_count, player_sex));
	return result;
end

function func_npc_getname(item, index)
	-- L�y ch� m�c ng��i ch�i �ang s� d�ng
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	
	-- DEBUG
	--print(format("func_npc_getname(), player_use_index:%d, player_all_count:%d",
	--	player_use_index, player_all_count));
	
	-- N�u S� L��ng Ng��i Ch�i Kh�ng ��, Th� Theo Th� T� S� D�ng T�n NPC D� B�
	local result = "";
	if (player_use_index > player_all_count) then
		local npc_use_index = GetMissionV(VARV_NPC_USE_INDEX) + 1;
		if (npc_use_index > getn(map_npcname_candidates)) then
			npc_use_index = 1;
		end
		SetMissionV(VARV_NPC_USE_INDEX, npc_use_index);
		-- DEBUG
		--print(format("func_npc_getname(), npc_use_index:%d", npc_use_index));
		result = map_npcname_candidates[npc_use_index];
	else
		-- L�y T�n D�a Tr�n Ch� M�c Ng��i Ch�i �� S� D�ng
		result = GetMissionS(VARS_PLAYER_NAME + player_use_index);
	end
	
	-- DEBUG
	--print(format("func_npc_getname():%s", result));
	return result;
end

function func_ladder_getname(item, index)
	local map = item[NPC_ATTRIDX_NAME];
	if (type(map) ~= "table") then
		-- DEBUG
		--print("func_ladder_getname() fail!!!");
		return nil;
	end
	
	-- L�y Ng�u Nhi�n T�n Ng��i Ch�i X�p H�ng
	local name, data = Ladder_GetLadderInfo(map[2], random(1, 10));
	if (name ~= nil and name ~= "") then
		return name;
	end
	
	-- S� D�ng Ng�u Nhi�n T�n NPC D� B�
	local pos = random(1, getn(map_npcname_candidates));
	return map_npcname_candidates[pos];
end

-- NPC S� D�ng T�n C�a T�t C� Ng��i Ch�i
function func_npc_get_eachname(item, index)
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	if (index <= player_all_count) then
		return GetMissionS(VARS_PLAYER_NAME + index);
	else
		local count = getn(map_npcname_candidates);
		local pos = mod(index - player_all_count, count);
		if (pos == 0) then
			pos = count;
		end
		return map_npcname_candidates[pos];
	end
end

function func_npc_getseries(item, index)
	-- L�y ch� m�c ng��i ch�i �ang s� d�ng
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	
	-- N�u S� L��ng Ng��i Ch�i Kh�ng ��, Th� Ng�u Nhi�n T�o Ng� H�nh
	if (player_use_index > player_all_count) then
		local index = random(1, getn(map_series));
		return map_series[index];
	else
		-- L�y Ng� H�nh D�a Tr�n Ch� M�c Ng��i Ch�i �� S� D�ng
		return GetMissionV(VARV_PLAYER_SERIES + player_use_index);
	end
end

function func_npc_getpos(item, index)
	local pos = item[NPC_ATTRIDX_POSITION];
	local pos_type = type(pos);
	if (pos_type == "table") then
		return pos[1], pos[2];
	elseif (pos_type ~= "function") then
		return nil;
	end
	
	local func = pos;
	local file = map_posfiles[item[NPC_ATTRIDX_COUNT]];
	local file_name = file[1];	-- T�n file t�a ��
	local pos_count = file[2];	-- S� l��ng t�a ��
	
	local column = 2 * (random(1, pos_count) - 1) + 1;
	return get_file_pos(file_name, index + 1, column);
end

function func_npc_proceed(item)
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX);
	SetMissionV(VARV_PLAYER_USE_INDEX, player_use_index + 1);
end

-- Chi�n l�i ph�m
function award_item(item, player_index)
	local old_index = PlayerIndex;
	PlayerIndex = player_index;
	
	local name = item[1];
	if (getn(item) == 2) then
		AddEventItem(item[2]);
	elseif (getn(item) == 3) then
		AddGoldItem(item[2], item[3]);
	elseif (getn(item) == 7) then
		AddItem(item[2], item[3], item[4], item[5], item[6], item[7]);
	end
	Msg2Player("<#>B�n ��t ���c" .. name .. "!");
	
	PlayerIndex = old_index;
end

-- Ph�n th��ng ng�u nhi�n v�t ph�m
function award_random_object(objects, player_index)
	local base = objects[1];		-- C� s� ng�u nhi�n � v� tr� ��u ti�n
	local sum = 0;
	local num = random(1, base);
	for i = 2, getn(objects) do		-- V�t ph�m ng�u nhi�n b�t ��u t� v� tr� th� hai
		local odds = objects[i][1];
		local item = objects[i][2];
		sum = sum + odds * base;
		if (num <= sum) then
			award_item(item, player_index);
			break;
		end
	end
end

