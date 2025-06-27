-- description	: B� H�n Gi� Th�ng C�o, M�i Ph�t K�ch Ho�t M�t L�n
-- author		: wangbin
-- datetime		: 2005-06-07

Include("\\script\\missions\\challengeoftime\\include.lua")

function OnTimer()
	if (GetMSPlayerCount(MISSION_MATCH) ~= 0) then
		local time = GetMissionV(VARV_BOARD_TIMER) + INTERVAL_BOARD * 60;
		local batch = GetMissionV(VARV_NPC_BATCH);
		local count = GetMissionV(VARV_NPC_COUNT);
		SetMissionV(VARV_BOARD_TIMER, time);
		
		local msg = "<#> Nhi�m v� 'Th�ch th�c Th�i gian' �� b�t ��u r�i <color=yellow>" .. floor(time / 60) 
			.. "<color> ph�t, b�y gi� l� <color=yellow>"
			.. batch
			.. "<color> ��m qu�i, c�n d� <color=yellow>"
			.. count
			.. "<color> con qu�i.";
		Msg2MSAll(MISSION_MATCH, msg);
	end
end

