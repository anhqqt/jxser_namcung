-- description	: ±ÈÈü¶¨Ê±Æ÷
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\challengeoftime\\npc.lua")

function cancel_match()
	-- Msg2SubWorld(date("[%H:%M:%S]") .. "±ÈÈüÈ¡Ïû£¡")
end

-- B¾t ®Çu V­ît ¶i
function start_match()
	-- ThiÕt lËp thµnh tr¹ng th¸i V­ît ¶i
	SetMissionV(VARV_STATE, 2);

	local player_count = GetMSPlayerCount(MISSION_MATCH);
	if (player_count == 0) then
		-- Hñy bá V­ît ¶i
		cancel_match();
	else
		-- Khëi ®éng bé hÑn giê kÕt thóc V­ît ¶i
		start_close_timer();
		
		-- Th«ng c¸o
		broadcast("NhiÖm vô 'Th¸ch thøc Thêi gian' ®· chÝnh thøc b¾t ®Çu, anh hïng c¸c n¬i ®ang ra søc tranh tµi");

		-- Khëi t¹o biÕn
		SetMissionV(VARV_NPC_BATCH, 1);	-- §ît qu¸i
		SetMissionV(VARV_MISSION_RESULT, 0);
		SetMissionV(VARV_PLAYER_USE_INDEX, 0);
		SetMissionV(VARV_NPC_USE_INDEX, 0);
		
		-- ¶i Qu¸i ¸c Méng Nhá xuÊt hiÖn (TiÓu NhiÕp NhÝ TrÇn)
		local nBossBatch = random(5, 15)
		SetMissionV(VARV_XIAONIESHICHEN_BATCH, nBossBatch)	-- Tõ 5 ®Õn 15 ngÉu nhiªn t¹o ra mét ¶i
		WriteLog(format("TiÓu NhiÕp ThÝ TrÇn xuÊt hiÖn thÎ ¶i lµ %d",nBossBatch))
		
		-- L­u th«ng tin ng­êi ch¬i
		save_player_info();
    	
		-- Dän dÑp b¶n ®å
		world = SubWorldIdx2ID(SubWorld);
		ClearMapNpc(world);
		ClearMapTrap(world); 
		ClearMapObj(world);
    	
		-- Sinh ra ®ît qu¸i thø 1
		create_batch_npc(1);
	end
	
	-- ThiÕt lËp sè l­îng ng­êi ch¬i
	SetMissionV(VARV_PLAYER_COUNT, player_count);
end

-- §ãng bé hÑn giê V­ît ¶i
function close_match_timer()
	StopMissionTimer(MISSION_MATCH, TIMER_MATCH);
end

function OnTimer()
	-- B¸o danh kÕt thóc
	close_match_timer();
	-- V­ît ¶i b¾t ®Çu
	start_match();
	start_board_timer();
end
