-- description	: NPC����
-- author		: wangbin
-- datetime		: 2005-06-06

-- Th�m bi�n global
Include("\\script\\global\\anhquach\\env.lua")
--
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\challengeoftime\\npc.lua")
IL("RELAYLADDER");
Include("\\script\\event\\storm\\function.lua")	--Storm
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")
Include("\\script\\activitysys\\g_activity.lua");
Include("\\script\\activitysys\\functionlib.lua");
Include("\\script\\lib\\common.lua");
Include("\\script\\event\\change_destiny\\mission.lua");	-- Ngh�ch Thi�n C�i M�nh

-- Y�u c�u c�p �� 120 m�i c� th� tu luy�n
Include("\\script\\task\\task_award_extend.lua")
-- Ho�t ��ng sinh nh�t Vi�t Nam
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
-- B�ng x�p h�ng h�ng ng�y ho�t ��ng v��t �i
Include("\\script\\missions\\challengeoftime\\rank_perday.lua");
-- �i�u ch�nh v��t �i 2011.03.01
Include("\\script\\lib\\awardtemplet.lua")

Include("\\script\\missions\\challengeoftime\\doubleexp.lua")
-- Phong V�n L�nh B�i t� ��i h� tr� t�n th� - Modified By DinhHQ - 20110916
Include("\\script\\activitysys\\config\\1005\\partysupport.lua")

function award_player(player, exp, objects, time)
	local OldPlayerIndex = PlayerIndex;
	PlayerIndex = player;
	
	--Storm ���ӻ���
	if(GetMissionV(VARV_MISSION_RESULT) == 1) then	-- Ph�n th��ng cu�i c�ng
		storm_addpoint(2, LIMIT_FINISH - time)
	end

	-- Ph�n th��ng kinh nghi�m
	-- N�u param exp l� m�t function (h�m) => th�c thi h�m n�y => l�y kinh nghi�m d�a theo th�i gian v��t �i
	local experience = exp;
	if (type(exp) == "function") then
		experience = exp(time);
	end	
	if (experience ~= 0) then
		local point = experience * 10000;
		-- Th�m kinh nghi�m k� n�ng 120
		AddExp_Skill_Extend(point);
		if(greatnight_huang_event(3) == 1) then
		elseif(greatnight_huang_event(3) == 2) then
			point = point * 2;
		elseif(greatnight_huang_event(3) == 3) then
			point = point * 3;
		else
		end;
		-- C� ph�i ��i tr��ng kh�ng
		local name = GetMissionS(VARS_TEAM_NAME);
		if (GetName() == name) then
			point = point * (1 + 0.2);	-- Th�m ph�n th��ng
		end;
		if (advanced()) then
			point = point * 2;
		end
		
		point = BigBoss:AddChuangGuanPoint(point);
		point = Chuangguan_checkdoubleexp(point)
		AddOwnExp(point);
		Msg2Player("<#>B�n ��t ���c <color=yellow>" .. point .. "<color> �i�m kinh nghi�m.");
	end
	
	-- Ph�n th��ng v�t ph�m ng�u nhi�n
	if (objects ~= nil) then
		award_random_object(objects, player);
	end

	-- H�i ph�c ng��i ch�i
	PlayerIndex = OldPlayerIndex;
end

-- R�i v�t ph�m
function drop_item(index, count)
	local x, y, world = GetNpcPos(index);
	if (count ~= 0) then
		for i = 1, count do
			-- R�i Ng� Hoa
			DropItem(world, x, y, -1, 1, 2, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0);
		end
	end
	-- R�i h�p qu�
	-- H�p l� v�t v��t �i
	if ( random(1,100) <= 5 ) then
		DropItem(world, x, y, -1, 6, 1, 1392, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	end
end

-- Ph�n th��ng
function award_batch_item(item, npc_index, time)
	-- Cho m�i th�nh vi�n kinh nghi�m v� ph�n th��ng
	local index = 0;
	local player = 0;
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			award_player(player, item[1], item[3], time);
		end
		if (index == 0) then
			break;
		end	
	end
	
	-- R�i v�t ph�m
	drop_item(npc_index, item[2]);
end

-- Ph�n th��ng theo ��t
function award_batch(batch, npc_index)
	local map = current_npc_map();
	award_batch_item(map[batch][2], npc_index, 0);

	local tbAllPlayer = {};
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			tbAllPlayer[getn(tbAllPlayer)+1] = player;
		end
		if (index == 0) then
			break;
		end	
	end
	
	local n_level = 0;
	if (advanced()) then
		n_level = 2
	else
		n_level = 1
	end
	
	G_ACTIVITY:OnMessage("Chuanguan", batch, tbAllPlayer, n_level);
	
	--Phong V�n L�nh B�i t� ��i h� tr� t�n th� - Modified By DinhHQ - 20110916
	tbPVLB_PtSpprt:COTAward(batch, tbAllPlayer)
	
	-- LLG_ALLINONE_TODO_20070802
	award_batch_extend(batch)
end


-- H�m m� r�ng ph�n th��ng, ti�n l�i cho c�c ho�t ��ng kh�c g�i sau n�y.
-- �i�u ki�n k�ch ho�t: Khi t�t c� NPC trong m�n n�y ch�t, v� sau khi t�t c� ng��i ch�i nh�n ���c ph�n th��ng c� b�n, h�m n�y s� ���c g�i.
-- L�c n�y PlayerIndex l� ng��i �� ��nh ch�t con qu�i cu�i c�ng c�a m�n n�y.
-- N�u c�n th��ng cho t�t c� ng��i ch�i, ph�i s� d�ng ph��ng th�c GetNextPlayer �� l�y t�ng ng��i m�t.
--by Romandou
--Change number of award - By DinhHQ - 20120312
local tbAward_batch = 
{
--	[10] = 1,
--	[20] = 2,
--	[28] = 2,
--	[29] = 3,
	[15] = 2,
	[28] = 2,
}

--local tbPro = {szName="B�o R��ng V��t �i",tbProp={6, 1, 2742, 1, 0, 0},}

function award_batch_extend(batch)
	award_batch_contribution(batch)
	local nOldPlayer = PlayerIndex;
	local index = 0;
	local player = 0;
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			PlayerIndex = player;
			-- S� m�n v��t qua trong th� th�ch th�i gian s� ki�n sinh nh�t Vi�t Nam
			SetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount, batch);
			-- �i�u ch�nh v��t �i b�i wangjingjun 2011.03.01
			--if %tbAward_batch[batch] and GetMissionV(VARV_BATCH_MODEL) == 1 then
				--%tbPro.nCount = %tbAward_batch[batch]
				--tbAwardTemplet:GiveAwardByList(%tbPro, "chuangguan award", 1)
			--end
			-- Ph�n th��ng khi ti�u di�t qu�i nh�
			if GetMissionV(VARV_BATCH_MODEL) == 1 and batch == GetMissionV(VARV_XIAONIESHICHEN_BATCH) then
				--%tbPro.nCount = 1
				--tbAwardTemplet:GiveAwardByList(%tbPro, "xiaonieshichen awrad", 1)
				
				local nExpCount = 10000000
				nExpCount = Chuangguan_checkdoubleexp(nExpCount)
				tbAwardTemplet:GiveAwardByList({nExp_tl=1,nCount = nExpCount,}, "xiaonieshichen awrad", 1)
			end
			
		end
		if (index == 0) then
			break;
		end	
	end
	PlayerIndex = nOldPlayer;
end

function award_batch_worldcup(batch)
	-- X� l� ho�t ��ng b�o h�a th� gi�i
	if checkPayCardTime() ~= 1 then
		return 
	end;
	
	local oldPlayer = PlayerIndex
	local index = 0;
	local player = 0;
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			PlayerIndex = player
			if batch==20 then
				_Debug("<<δ����>>"..batch.."<<δ����>>");
				worldcup_challenge_addpoint(1);
			elseif batch==28 then
				_Debug("<<δ����>>"..batch.."<<δ����>>");
				worldcup_challenge_addpoint(1);			
			end;
		end
		if (index == 0) then
			break;
		end	
	end
	PlayerIndex = oldPlayer
end

-- T�ng bang h�i c�ng hi�n ��
function award_batch_contribution(batch)
	local nOldPlayer = PlayerIndex;
	local index = 0;
	local player = 0;
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			PlayerIndex = player;
			tongaward_challengeoutoftime(batch);
		end
		if (index == 0) then
			break;
		end	
	end
	PlayerIndex = nOldPlayer;
end
-- Ph�n th��ng v��t �i
function award_success(npc_index, time)
	local item = {};
	if (advanced()) then
		item = map_haward_success;	-- Ph�n th��ng v��t �i t� th� cao c�p
	else
		item = map_laward_success;	-- Ph�n th��ng v��t �i t� th� s� c�p
	end
	award_batch_item(item, npc_index, time);	
end

-- Th�ng l�i V��t �i
function success(npc_index)
	-- Th�i gian th�ng k�
	local time = GetMissionV(VARV_BOARD_TIMER);
	time = time + INTERVAL_BOARD * 60 - floor(GetMSRestTime(MISSION_MATCH, TIMER_BOARD) / 18);
	SetMissionV(VARV_BOARD_TIMER, time);
	
	-- ��nh d�u l� �� v��t qua t�t c� �i c�a ho�t ��ng V��t �i
	SetMissionV(VARV_MISSION_RESULT, 1);
		
	-- Ph�n th��ng v��t �i
	-- M�c ��ch npc_index => R�i �� ngay t�i v� tr� c�a NPC
	award_success(npc_index, time);
	
	--local laddertime = LIMIT_FINISH - time;
	local laddertime = time;
	local teamname = GetMissionS(VARS_TEAM_NAME)
	local nLeaderFaction = GetMissionS(VARS_TEAMLEADER_FACTION)
	local nLeaderGender = GetMissionS(VARS_TEAMLEADER_GENDER)
	local MapId = SubWorldIdx2ID(SubWorld)
	local LadderId = 10179;
	if (map_isadvanced[MapId] == 1) then
		LadderId = 10180;
	end
	
	-- DEBUG
	--print(format("team name:%s", teamname));
			
	-- B�ng x�p h�ng
	local bfind = 0
	for i = 1, 10 do 
		name , value = Ladder_GetLadderInfo(LadderId, i)
		if (name  == teamname) then
			bfind = 1
			if ( laddertime > value) then
				Ladder_NewLadder(LadderId, teamname, -1 * laddertime, 1, nLeaderFaction, nLeaderGender)
				break
			end
		end
	end
	
	if (bfind == 0) then
		Ladder_NewLadder(LadderId, teamname, laddertime, 1, nLeaderFaction, nLeaderGender)
	end
   	
   	Ladder_NewLadder(DailyRankLadderId, teamname, -1 * laddertime, 1)
	-- C�p nh�t th�nh t�ch m�i ng�y
	if (advanced()) then
		local nOldPlayer = PlayerIndex;
		local index = 0;
		local player = 0;
		while (1) do
			index, player = GetNextPlayer(MISSION_MATCH, index, 0);
			if (player > 0) then
				PlayerIndex = player;
				ndate = tonumber(GetLocalDate("%y%m%d"));
				update_gbtask(time);
				if (GetTask(tsk_rank_lastdate) == ndate) then
					if (GetTask(tsk_rank_lastscore) > time) then
						SetTask(tsk_rank_lastscore, time);
					end
				else
					SetTask(tsk_rank_2thdate, GetTask(tsk_rank_lastdate));
					SetTask(tsk_rank_2thscore, GetTask(tsk_rank_lastscore));
					SetTask(tsk_rank_lastdate, ndate);
					SetTask(tsk_rank_lastscore, time);
				end
			end
			if (index == 0) then
				break;
			end	
		end
		PlayerIndex = nOldPlayer;
		
	end
	broadcast(GetMissionS(VARS_TEAM_NAME) .. "��i ng� �� th�ng l�i ho�n th�nh nhi�m v� ��ng th�i gian, �� d�ng " .. floor(time / 60) .. " ph�t " .. mod(time, 60) .. " gi�y! Tr��c �� "..laddertime.." gi�y");
		
	-- DEBUG
	--print(format("used time: %d seconds", time));

	-- N�u th�i gian ho�n th�nh �t h�n VUOT_AI_THOI_GIAN_AI_AN ph�t, ng�u nhi�n ch�n 1 kh�a trong th� �n �� m�
	if (time < VUOT_AI_THOI_GIAN_AI_AN * 60) then
		local map = map_lo_hidden_npc;
		if (advanced()) then
			map = map_hi_hidden_npc;
		end
		local index = random(1, getn(map));
		close_board_timer();
		Msg2MSAll(MISSION_MATCH, "<#>Nhi�m v� b� m�t �� kh�i ��ng r�i");
		create_all_npc(map[index]);
	else
		-- ��y l�i �i�m b�o danh
		kickout();
	end
end

-- Ph�n th��ng nhi�m v� �n
function award_hidden_mission()
	local index = 0;
	local player = 0;
	local OldPlayerIndex = PlayerIndex;
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			award_random_object(map_random_awards, player);
			-- S� m�n v��t qua trong th� th�ch th�i gian s� ki�n sinh nh�t Vi�t Nam
			PlayerIndex = player;
			SetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount, 29);
			
			if GetMissionV(VARV_BATCH_MODEL) == 1 then
				--Change feature award - Modified By DinhHQ - 20120326 
--				%tbPro.nCount = 3
--				tbAwardTemplet:GiveAwardByList(%tbPro, "chuangguan award", 1)
			end
			
		end
		if (index == 0) then
			break;
		end	
	end
	PlayerIndex = OldPlayerIndex;
end

-- K�t th�c h�ng lo�t
function batch_finish(index)
	
	-- N�u V��t �i �� ho�n th�nh nh�ng v�n c� NPC ch�t (OnDeath) v� ch�t ��n khi h�t batch
	-- T�c l� �ang trong nhi�m v� �n
	---- Nh�n ph�n th��ng khi ho�n th�nh nhi�m v� �n
	---- Sau �� kick kh�i ph� b�n
	if (GetMissionV(VARV_MISSION_RESULT) == 1) then
		-- Ph�n th��ng nhi�m v� �n
		award_hidden_mission();
		
		if GetMissionV(VARV_BATCH_MODEL) == 1 and GetMissionV(VARV_BOARD_TIMER) <= CHUANGGUAN30_TIME_LIMIT  then
			add_transfer_npc()
		else
			-- ��y l�i �i�m b�o danh
			kickout();
		end
	else
		-- Th�ng b�o
		local batch = GetMissionV(VARV_NPC_BATCH);
		Msg2MSAll(MISSION_MATCH, GetMissionS(VARS_TEAM_NAME) .. "��i ng� �� ti�u di�t to�n b� <color=yellow>" .. batch .. "<color> ��m qu�i!");
		
		-- Ph�n th��ng
		award_batch(batch, index);
    	
		-- N�u �i hi�n t�i >= t�ng �i th� k�t th�c ho�t ��ng V��t �i
		if (batch >= get_batch_count()) then
			-- K�t th�c
			success(index);
		else
			-- T�o l��t qu�i ti�p theo
			batch = batch + 1;
			SetMissionV(VARV_NPC_BATCH, batch);
			create_batch_npc(batch);
		end
	end
end

-- Ph�n th��ng khi NPC t� vong
function NpcDeathAward(index)
	local nNpcSettingIdx = GetNpcSettingIdx(index);
	tbChangeDestiny:completeMission_NieShiChen(nNpcSettingIdx);
end

function OnDeath(index)
	NpcDeathAward(index);
	local count = GetMissionV(VARV_NPC_COUNT) - 1;	
	if (count >= 0) then
		SetMissionV(VARV_NPC_COUNT, count);
		if (count == 0) then
			batch_finish(index);
		end
	end
end
