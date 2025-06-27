-- Thªm biÕn global
Include("\\script\\global\\anhquach\\env.lua")
IncludeLib("RELAYLADDER")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan
Include("\\script\\missions\\boss\\bigboss.lua") -- big boss

MISSION_MATCH			= 22		-- VÝ dô: nhiÖm vô PVP
TIMER_MATCH				= 41		-- Bé hÑn giê b¾t ®Çu V­ît ¶i
TIMER_BOARD				= 42		-- Bé hÑn giê th«ng c¸o
TIMER_CLOSE				= 43		-- Bé hÑn giê kÕt thóc V­ît ¶i
INTERVAL_BOARD			= 1			-- Kho¶ng c¸ch th«ng b¸o (phót): Mçi phót th«ng b¸o mét lÇn
INTERVAL_MATCH			= 3600		-- Mçi giê V­ît ¶i mét lÇn (gi©y)
TIME_SIGNUP				= 10
LIMIT_SIGNUP			= TIME_SIGNUP * 60		-- Thêi gian b¸o danh (phót): 10 phót
LIMIT_FINISH 			= 30 * 60	-- Thêi gian nhiÖm vô (phót): 30 phót
BOAT_POSX				= 1559		-- Ng­êi ch¬i bÞ truyÒn tèng ®Õn täa ®é X cña ThuyÒn
BOAT_POSY				= 3226		-- Ng­êi ch¬i bÞ truyÒn tèng ®Õn täa ®é Y cña ThuyÒn
LIMIT_PLAYER_COUNT		= 8			-- Giíi h¹n tèi ®a sè l­îng ng­êi ch¬i
AWARD_COUNT				= 10		-- Sau khi hoµn thµnh tÊt c¶ c¸c ¶i cã thÓ chia 10 hép b¸u ¶i

SEX_BOY					= 0			-- Giíi tÝnh nam
SEX_GIRL				= 1			-- Giíi tÝnh n÷
SEX_RENYAO				= 2			-- Nh©n yªu

-- §iÒu chØnh ¶i 2011.03.04
CHUANGGUAN30_MAP_ID		= 957
CHUANGGUAN30_TIME_LIMIT = 13*60		-- Thêi gian cÇn hoµn thµnh sím h¬n ë ¶i 29
CHUANGGUAN30_START_TIME = 10
CHUANGGUAN30_END_TIME	= 22
PLAYER_MAP_TASK			= 2852
COUNT_LIMIT 			= VUOT_AI_LIMIT_NGAY -- Sè lÇn v­ît ¶i tèi ®a trong ngµy



-- ý nghÜa c¸c cét trong b¶ng NPC
-- ý nghÜa c¸c cét tham sè cña NPC: xö lý sau ®ã, ID, tªn, cÊp ®é, ngò hµnh, cã ph¶i BOSS kh«ng (0: kh«ng, 1: cã), sè l­îng, vÞ trÝ.
-- {nil, {1026, 1033}, {func_ladder_getname, 10119}, 75, -1, 1, 1, {1568, 3227}}
NPC_ATTRIDX_PROCEED		= 1			-- Xö lý NPC sau ®ã
NPC_ATTRIDX_ID			= 2			-- ID cña NPC
NPC_ATTRIDX_NAME		= 3			-- Tªn NPC
NPC_ATTRIDX_LEVEL		= 4			-- CÊp ®é NPC
NPC_ATTRIDX_SERIES		= 5			-- Ngò hµnh NPC
NPC_ATTRIDX_ISBOSS		= 6			-- Cã ph¶i BOSS kh«ng
NPC_ATTRIDX_COUNT		= 7			-- Sè l­îng NPC
NPC_ATTRIDX_POSITION	= 8			-- VÞ trÝ NPC

USE_NAME_ALL_PLAYERS	= 1			-- Sö dông tªn cña toµn thÓ ng­êi ch¬i
USE_NAME_THE_TOPLIST	= 2			-- Sö dông ngÉu nhiªn tªn cña top ng­êi ch¬i ®óng ®Çu

VARS_TEAM_NAME			= 1			-- Tªn ®éi
-- ÒÔÏÂ±äÁ¿´Ó(VARS_PLAYER_NAME + 1)µ½(VARS_PLAYER_NAME + LIMIT_PLAYER_COUNT)·Ö±ð±£´æ²»Í¬Íæ¼ÒµÄÃû×Ö
VARS_PLAYER_NAME		= 2			-- Tªn ng­êi ch¬i
VARS_TEAMLEADER_FACTION = 11        -- M«n ph¸i ®éi tr­ëng
VARS_TEAMLEADER_GENDER  = 12        -- Giíi tÝnh ®éi tr­ëng

VARV_NPC_BATCH 			= 1			-- §ît qu¸i
VARV_NPC_COUNT 			= 2			-- Sè l­îng qu¸i trong ®ît
VARV_PLAYER_COUNT		= 3			-- Sè l­îng ng­êi ch¬i
VARV_STATE 				= 4			-- Tr¹ng th¸i nhiÖm vô: 1 biÓu thÞ b¸o danh, 2 biÓu thÞ V­ît ¶i
VARV_SIGNUP_WORLD		= 5			-- B¶n ®å b¸o danh
VARV_SIGNUP_POSX		= 6			-- Täa ®é X cña ®iÓm b¸o danh
VARV_SIGNUP_POSY		= 7			-- Täa ®é Y cña ®iÓm b¸o danh
VARV_BOARD_TIMER		= 8			-- Thêi gian tiÕn hµnh V­ît ¶i (phót)
VARV_PLAYER_TOTAL_COUNT = 9			-- Tæng sè l­îng ng­êi ch¬i (kh«ng qu¶n cã ph¶i ®· tö vong)
VARV_PLAYER_USE_INDEX	= 10		-- ChØ môc ng­êi ch¬i ®· sö dông
VARV_NPC_USE_INDEX		= 11		-- ChØ môc NPC ®· sö dông
VARV_MISSION_RESULT		= 12		-- KÕt qu¶ nhiÖm vô: 1 lµ th¾ng lîi v­ît ¶i, 0 lµ thÊt b¹i
VARV_PLAYER_SEX			= 13
-- ÒÔÏÂ±äÁ¿´Ó(VARV_PLAYER_SEX + 1)µ½(VARV_PLAYER_SEX + LIMIT_PLAYER_COUNT)·Ö±ð±£´æ²»Í¬Íæ¼ÒµÄÐÔ±ð£¬£°ÎªÄÐÐÔ£¬£±ÎªÅ®ÐÔ£¬£²ÎªÈËÑý
VARV_PLAYER_SERIES		= VARV_PLAYER_SEX + LIMIT_PLAYER_COUNT + 1		-- 22


VARV_XIAONIESHICHEN_BATCH = 31		-- ¶i Qu¸i ¸c Méng Nhá xuÊt hiÖn
VARV_BATCH_MODEL		= 32			-- ChÕ ®é cña ¶i hiÖn t¹i: 0 lµ chÕ ®é b×nh th­êng, 1 lµ chÕ ®é ®· ®iÒu chØnh


-- C¸c biÕn tõ (VARV_PLAYER_SERIES + 1) ®Õn (VARV_PLAYER_SERIES + LIMIT_PLAYER_COUNT) lÇn l­ît b¶o qu¶n ngò hµnh cña nh÷ng ng­êi ch¬i kh¸c nhau

SCRIPT_NPC_DEATH 	= "\\script\\missions\\challengeoftime\\npc_death.lua"
SCRIPT_PLAYER_DEATH = "\\script\\missions\\challengeoftime\\player_death.lua"

-- ID b¶n ®å V­ît ¶i
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

-- §èi øng b¶n ®å cã ph¶i V­ît ¶i cao cÊp
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


-- Ngò hµnh
map_series = {
	0,	-- Kim
	1,	-- Méc
	2,	-- Thñy
	3,	-- Háa
	4	-- Thæ
};

-- Tªn NPC dù bÞ
map_npcname_candidates = {
	"HËu  KhÊt KiÕm",
	"§iªu DÞch §ao",
	"KiÒu §Ønh Thiªn",
	"NhËm Th­¬ng Khung",
	"Bé Hiªu TrÇn",
	"MËu TuÊt Nhung",
	"H¹ng Phï Nhai"
};

-- Ph¸t sãng
function broadcast(msg)
	AddGlobalNews(msg);
end

-- §uæi ng­êi ch¬i vÒ ®iÓm b¸o danh
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

-- Khëi ®éng bé hÑn giê th«ng c¸o
function start_board_timer()
	StartMissionTimer(MISSION_MATCH, TIMER_BOARD, INTERVAL_BOARD * 60 * 18);
end

-- §ãng Bé HÑn Giê Th«ng C¸o
function close_board_timer()
	StopMissionTimer(MISSION_MATCH, TIMER_BOARD);
end

-- Khëi ®éng bé hÑn giê ®ãng V­ît ¶i
function start_close_timer()
	-- 10 phót sau khëi ®éng nhiÖm vô V­ît ¶i
	StartMissionTimer(MISSION_MATCH, TIMER_CLOSE, LIMIT_FINISH * 18);
end

-- ¹Ø±Õ±ÈÈü¹Ø±Õ¶¨Ê±Æ÷
function close_close_timer()
	-- 10 phót sau khëi ®éng nhiÖm vô V­ît ¶i
	StopMissionTimer(MISSION_MATCH, TIMER_CLOSE);
end

-- KÕt thóc V­ît ¶i
function close_match()
	-- §uæi ng­êi ch¬i ra khái b¶n ®å
	kickout();
	
	-- Dän dÑp b¶n ®å
	world = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(world, 1);	-- Còng dän dÑp ng­êi ch¬i
	ClearMapTrap(world); 
	ClearMapObj(world);
end

-- LÊy tËp hîp ng­êi ch¬i
function get_player_map()
	-- TËp hîp ng­êi ch¬i
	local players = {};
		
	-- DuyÖt Qua Tõng Thµnh Viªn, L­u Th«ng Tin Ng­êi Ch¬i Vµo TËp Hîp
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
					GetName(),		-- Tªn ng­êi ch¬i
					GetSex(),		-- Giíi tÝnh ng­êi ch¬i
					GetSeries()}; 	-- Ngò hµnh ng­êi ch¬i
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

-- Xãa mét phÇn tö khái mét b¶ng, tr¶ vÒ b¶ng míi
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

-- L­u tªn ng­êi ch¬i, giíi tÝnh vµo biÕn mission
function save_player_info()
	local players = get_player_map();
	-- DEBUG
	--print(format("We got %d players", getn(players)));
	for index = 1,getn(players) do
		-- S¾p xÕp ngÉu nhiªn
		-- players = remove_element(players, random(1, getn(players)));
		SetMissionS(VARS_PLAYER_NAME + index, players[index][1]);	-- Ãû×Ö
		SetMissionV(VARV_PLAYER_SEX + index, players[index][2]);	-- ÐÔ±ð
		SetMissionV(VARV_PLAYER_SERIES + index, players[index][3]);	-- ÎåÐÐ
		-- DEBUG
		--print(format("SetMissionS(%d, %s)", VARS_PLAYER_NAME + index, players[index][1]));	-- Ãû×Ö
		--print(format("SetMissionV(%d, %d)", VARV_PLAYER_SEX + index, players[index][2]));	-- ÐÔ±ð
		--print(format("SetMissionV(%d, %d)", VARV_PLAYER_SERIES + index, players[index][3]));	-- ÎåÐÐ
	end
	
	-- Íæ¼Ò×ÜÊý
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

-- LÊy ID NPC ngÉu nhiªn dùa trªn giíi tÝnh
function get_random_npc_id(sex)
	if (sex ~= 0 and sex ~= 1) then
		-- Nh©n yªu nªn xö lý thÕ nµo?
		return nil;
	end

	local range_id = lo_range_id;
	if (advanced()) then
		range_id = hi_range_id;
	end
	return random(range_id[sex + 1][1], range_id[sex + 1][2]);
end

-- §äc vÞ trÝ NPC tõ file
function get_file_pos(file, line, column)
	x = GetTabFileData(file, line, column);
	y = GetTabFileData(file, line, column + 1);
	return x, y;
end

function func_npc_getid(item, index)
	-- LÊy chØ môc ng­êi ch¬i ®ang sö dông
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	local player_sex = GetMissionV(VARV_PLAYER_SEX + player_use_index);	
		
	-- NÕu Sè L­îng Ng­êi Ch¬i Kh«ng §ñ, Th× NgÉu Nhiªn T¹o ID NPC Nam
	local result = 0;
	if (player_use_index > player_all_count) then
		result = get_random_npc_id(0);
	else
		-- LÊy Giíi TÝnh Ng­êi Ch¬i HiÖn T¹i Dùa Trªn ChØ Môc Ng­êi Ch¬i §· Sö Dông
		result = get_random_npc_id(player_sex);
	end

	-- DEBUG
	--print(format("func_npc_getid():%d, player_use_index:%d, player_all_count:%d, player_sex:%d",
	--	result, player_use_index, player_all_count, player_sex));
	return result;
end

function func_npc_getname(item, index)
	-- LÊy chØ môc ng­êi ch¬i ®ang sö dông
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	
	-- DEBUG
	--print(format("func_npc_getname(), player_use_index:%d, player_all_count:%d",
	--	player_use_index, player_all_count));
	
	-- NÕu Sè L­îng Ng­êi Ch¬i Kh«ng §ñ, Th× Theo Thø Tù Sö Dông Tªn NPC Dù BÞ
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
		-- LÊy Tªn Dùa Trªn ChØ Môc Ng­êi Ch¬i §· Sö Dông
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
	
	-- LÊy NgÉu Nhiªn Tªn Ng­êi Ch¬i XÕp H¹ng
	local name, data = Ladder_GetLadderInfo(map[2], random(1, 10));
	if (name ~= nil and name ~= "") then
		return name;
	end
	
	-- Sö Dông NgÉu Nhiªn Tªn NPC Dù BÞ
	local pos = random(1, getn(map_npcname_candidates));
	return map_npcname_candidates[pos];
end

-- NPC Sö Dông Tªn Cña TÊt C¶ Ng­êi Ch¬i
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
	-- LÊy chØ môc ng­êi ch¬i ®ang sö dông
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	
	-- NÕu Sè L­îng Ng­êi Ch¬i Kh«ng §ñ, Th× NgÉu Nhiªn T¹o Ngò Hµnh
	if (player_use_index > player_all_count) then
		local index = random(1, getn(map_series));
		return map_series[index];
	else
		-- LÊy Ngò Hµnh Dùa Trªn ChØ Môc Ng­êi Ch¬i §· Sö Dông
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
	local file_name = file[1];	-- Tªn file täa ®é
	local pos_count = file[2];	-- Sè l­îng täa ®é
	
	local column = 2 * (random(1, pos_count) - 1) + 1;
	return get_file_pos(file_name, index + 1, column);
end

function func_npc_proceed(item)
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX);
	SetMissionV(VARV_PLAYER_USE_INDEX, player_use_index + 1);
end

-- ChiÕn lîi phÈm
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
	Msg2Player("<#>B¹n ®¹t ®­îc" .. name .. "!");
	
	PlayerIndex = old_index;
end

-- PhÇn th­ëng ngÉu nhiªn vËt phÈm
function award_random_object(objects, player_index)
	local base = objects[1];		-- C¬ sè ngÉu nhiªn ë vÞ trÝ ®Çu tiªn
	local sum = 0;
	local num = random(1, base);
	for i = 2, getn(objects) do		-- VËt phÈm ngÉu nhiªn b¾t ®Çu tõ vÞ trÝ thø hai
		local odds = objects[i][1];
		local item = objects[i][2];
		sum = sum + odds * base;
		if (num <= sum) then
			award_item(item, player_index);
			break;
		end
	end
end

