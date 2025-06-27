-- description	: ������ʱ��
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\challengeoftime\\npc.lua")

function cancel_match()
	-- Msg2SubWorld(date("[%H:%M:%S]") .. "����ȡ����")
end

-- B�t ��u V��t �i
function start_match()
	-- Thi�t l�p th�nh tr�ng th�i V��t �i
	SetMissionV(VARV_STATE, 2);

	local player_count = GetMSPlayerCount(MISSION_MATCH);
	if (player_count == 0) then
		-- H�y b� V��t �i
		cancel_match();
	else
		-- Kh�i ��ng b� h�n gi� k�t th�c V��t �i
		start_close_timer();
		
		-- Th�ng c�o
		broadcast("Nhi�m v� 'Th�ch th�c Th�i gian' �� ch�nh th�c b�t ��u, anh h�ng c�c n�i �ang ra s�c tranh t�i");

		-- Kh�i t�o bi�n
		SetMissionV(VARV_NPC_BATCH, 1);	-- ��t qu�i
		SetMissionV(VARV_MISSION_RESULT, 0);
		SetMissionV(VARV_PLAYER_USE_INDEX, 0);
		SetMissionV(VARV_NPC_USE_INDEX, 0);
		
		-- �i Qu�i �c M�ng Nh� xu�t hi�n (Ti�u Nhi�p Nh� Tr�n)
		local nBossBatch = random(5, 15)
		SetMissionV(VARV_XIAONIESHICHEN_BATCH, nBossBatch)	-- T� 5 ��n 15 ng�u nhi�n t�o ra m�t �i
		WriteLog(format("Ti�u Nhi�p Th� Tr�n xu�t hi�n th� �i l� %d",nBossBatch))
		
		-- L�u th�ng tin ng��i ch�i
		save_player_info();
    	
		-- D�n d�p b�n ��
		world = SubWorldIdx2ID(SubWorld);
		ClearMapNpc(world);
		ClearMapTrap(world); 
		ClearMapObj(world);
    	
		-- Sinh ra ��t qu�i th� 1
		create_batch_npc(1);
	end
	
	-- Thi�t l�p s� l��ng ng��i ch�i
	SetMissionV(VARV_PLAYER_COUNT, player_count);
end

-- ��ng b� h�n gi� V��t �i
function close_match_timer()
	StopMissionTimer(MISSION_MATCH, TIMER_MATCH);
end

function OnTimer()
	-- B�o danh k�t th�c
	close_match_timer();
	-- V��t �i b�t ��u
	start_match();
	start_board_timer();
end
