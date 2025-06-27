-- description	: NPCËÀÍö
-- author		: wangbin
-- datetime		: 2005-06-06

-- Thªm biÕn global
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
Include("\\script\\event\\change_destiny\\mission.lua");	-- NghÞch Thiªn C¶i MÖnh

-- Yªu cÇu cÊp ®é 120 míi cã thÓ tu luyÖn
Include("\\script\\task\\task_award_extend.lua")
-- Ho¹t ®éng sinh nhËt ViÖt Nam
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
-- B¶ng xÕp h¹ng hµng ngµy ho¹t ®éng v­ît ¶i
Include("\\script\\missions\\challengeoftime\\rank_perday.lua");
-- §iÒu chØnh v­ît ¶i 2011.03.01
Include("\\script\\lib\\awardtemplet.lua")

Include("\\script\\missions\\challengeoftime\\doubleexp.lua")
-- Phong V©n LÖnh Bµi tæ ®éi hæ trî t©n thñ - Modified By DinhHQ - 20110916
Include("\\script\\activitysys\\config\\1005\\partysupport.lua")

function award_player(player, exp, objects, time)
	local OldPlayerIndex = PlayerIndex;
	PlayerIndex = player;
	
	--Storm Ôö¼Ó»ý·Ö
	if(GetMissionV(VARV_MISSION_RESULT) == 1) then	-- PhÇn th­ëng cuèi cïng
		storm_addpoint(2, LIMIT_FINISH - time)
	end

	-- PhÇn th­ëng kinh nghiÖm
	-- NÕu param exp lµ mét function (hµm) => thùc thi hµm nµy => lÊy kinh nghiÖm dùa theo thêi gian v­ît ¶i
	local experience = exp;
	if (type(exp) == "function") then
		experience = exp(time);
	end	
	if (experience ~= 0) then
		local point = experience * 10000;
		-- Thªm kinh nghiÖm kü n¨ng 120
		AddExp_Skill_Extend(point);
		if(greatnight_huang_event(3) == 1) then
		elseif(greatnight_huang_event(3) == 2) then
			point = point * 2;
		elseif(greatnight_huang_event(3) == 3) then
			point = point * 3;
		else
		end;
		-- Cã ph¶i ®éi tr­ëng kh«ng
		local name = GetMissionS(VARS_TEAM_NAME);
		if (GetName() == name) then
			point = point * (1 + 0.2);	-- Thªm phÇn th­ëng
		end;
		if (advanced()) then
			point = point * 2;
		end
		
		point = BigBoss:AddChuangGuanPoint(point);
		point = Chuangguan_checkdoubleexp(point)
		AddOwnExp(point);
		Msg2Player("<#>B¹n ®¹t ®­îc <color=yellow>" .. point .. "<color> ®iÓm kinh nghiÖm.");
	end
	
	-- PhÇn th­ëng vËt phÈm ngÉu nhiªn
	if (objects ~= nil) then
		award_random_object(objects, player);
	end

	-- Håi phôc ng­êi ch¬i
	PlayerIndex = OldPlayerIndex;
end

-- R¬i vËt phÈm
function drop_item(index, count)
	local x, y, world = GetNpcPos(index);
	if (count ~= 0) then
		for i = 1, count do
			-- R¬i Ngò Hoa
			DropItem(world, x, y, -1, 1, 2, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0);
		end
	end
	-- R¬i hép quµ
	-- Hép lÔ vËt v­ît ¶i
	if ( random(1,100) <= 5 ) then
		DropItem(world, x, y, -1, 6, 1, 1392, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	end
end

-- PhÇn th­ëng
function award_batch_item(item, npc_index, time)
	-- Cho mçi thµnh viªn kinh nghiÖm vµ phÇn th­ëng
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
	
	-- R¬i vËt phÈm
	drop_item(npc_index, item[2]);
end

-- PhÇn th­ëng theo ®ît
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
	
	--Phong V©n LÖnh Bµi tæ ®éi hæ trî t©n thñ - Modified By DinhHQ - 20110916
	tbPVLB_PtSpprt:COTAward(batch, tbAllPlayer)
	
	-- LLG_ALLINONE_TODO_20070802
	award_batch_extend(batch)
end


-- Hµm më réng phÇn th­ëng, tiÖn lîi cho c¸c ho¹t ®éng kh¸c gäi sau nµy.
-- §iÒu kiÖn kÝch ho¹t: Khi tÊt c¶ NPC trong mµn nµy chÕt, vµ sau khi tÊt c¶ ng­êi ch¬i nhËn ®­îc phÇn th­ëng c¬ b¶n, hµm nµy sÏ ®­îc gäi.
-- Lóc nµy PlayerIndex lµ ng­êi ®· ®¸nh chÕt con qu¸i cuèi cïng cña mµn nµy.
-- NÕu cÇn th­ëng cho tÊt c¶ ng­êi ch¬i, ph¶i sö dông ph­¬ng thøc GetNextPlayer ®Ó lÊy tõng ng­êi mét.
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

--local tbPro = {szName="B¶o R­¬ng V­ît ¶i",tbProp={6, 1, 2742, 1, 0, 0},}

function award_batch_extend(batch)
	award_batch_contribution(batch)
	local nOldPlayer = PlayerIndex;
	local index = 0;
	local player = 0;
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			PlayerIndex = player;
			-- Sè mµn v­ît qua trong thö th¸ch thêi gian sù kiÖn sinh nhËt ViÖt Nam
			SetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount, batch);
			-- §iÒu chØnh v­ît ¶i bëi wangjingjun 2011.03.01
			--if %tbAward_batch[batch] and GetMissionV(VARV_BATCH_MODEL) == 1 then
				--%tbPro.nCount = %tbAward_batch[batch]
				--tbAwardTemplet:GiveAwardByList(%tbPro, "chuangguan award", 1)
			--end
			-- PhÇn th­ëng khi tiªu diÖt qu¸i nhá
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
	-- Xö lý ho¹t ®éng b¸o häa thÕ giíi
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
				_Debug("<<Î´·­Òë>>"..batch.."<<Î´·­Òë>>");
				worldcup_challenge_addpoint(1);
			elseif batch==28 then
				_Debug("<<Î´·­Òë>>"..batch.."<<Î´·­Òë>>");
				worldcup_challenge_addpoint(1);			
			end;
		end
		if (index == 0) then
			break;
		end	
	end
	PlayerIndex = oldPlayer
end

-- T¨ng bang héi cèng hiÕn ®é
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
-- PhÇn th­ëng v­ît ¶i
function award_success(npc_index, time)
	local item = {};
	if (advanced()) then
		item = map_haward_success;	-- PhÇn th­ëng v­ît ¶i tû thÝ cao cÊp
	else
		item = map_laward_success;	-- PhÇn th­ëng v­ît ¶i tû thÝ s¬ cÊp
	end
	award_batch_item(item, npc_index, time);	
end

-- Th¾ng lîi V­ît ¶i
function success(npc_index)
	-- Thêi gian thèng kª
	local time = GetMissionV(VARV_BOARD_TIMER);
	time = time + INTERVAL_BOARD * 60 - floor(GetMSRestTime(MISSION_MATCH, TIMER_BOARD) / 18);
	SetMissionV(VARV_BOARD_TIMER, time);
	
	-- §¸nh dÊu lµ ®· v­ît qua tÊt c¶ ¶i cña ho¹t ®éng V­ît ¶i
	SetMissionV(VARV_MISSION_RESULT, 1);
		
	-- PhÇn th­ëng v­ît ¶i
	-- Môc ®Ých npc_index => R¬i ®å ngay t¹i vÞ trÝ cña NPC
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
			
	-- B¶ng xÕp h¹ng
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
	-- CËp nhËt thµnh tÝch mçi ngµy
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
	broadcast(GetMissionS(VARS_TEAM_NAME) .. "§éi ngò ®· th¾ng lîi hoµn thµnh nhiÖm vô ®óng thêi gian, ®· dông " .. floor(time / 60) .. " phót " .. mod(time, 60) .. " gi©y! Tr­íc ®ã "..laddertime.." gi©y");
		
	-- DEBUG
	--print(format("used time: %d seconds", time));

	-- NÕu thêi gian hoµn thµnh Ýt h¬n VUOT_AI_THOI_GIAN_AI_AN phót, ngÉu nhiªn chän 1 khãa trong thÎ Èn ®Ó më
	if (time < VUOT_AI_THOI_GIAN_AI_AN * 60) then
		local map = map_lo_hidden_npc;
		if (advanced()) then
			map = map_hi_hidden_npc;
		end
		local index = random(1, getn(map));
		close_board_timer();
		Msg2MSAll(MISSION_MATCH, "<#>NhiÖm vô bÝ mËt ®· khái ®éng råi");
		create_all_npc(map[index]);
	else
		-- §Èy lïi ®iÓm b¸o danh
		kickout();
	end
end

-- PhÇn th­ëng nhiÖm vô Èn
function award_hidden_mission()
	local index = 0;
	local player = 0;
	local OldPlayerIndex = PlayerIndex;
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			award_random_object(map_random_awards, player);
			-- Sè mµn v­ît qua trong thö th¸ch thêi gian sù kiÖn sinh nhËt ViÖt Nam
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

-- KÕt thóc hµng lo¹t
function batch_finish(index)
	
	-- NÕu V­ît ¶i ®· hoµn thµnh nh­ng vÉn cã NPC chÕt (OnDeath) vµ chÕt ®Õn khi hÕt batch
	-- Tøc lµ ®ang trong nhiÖm vô Èn
	---- NhËn phÇn th­ëng khi hoµn thµnh nhiÖm vô Èn
	---- Sau ®ã kick khái phô b¶n
	if (GetMissionV(VARV_MISSION_RESULT) == 1) then
		-- PhÇn th­ëng nhiÖm vô Èn
		award_hidden_mission();
		
		if GetMissionV(VARV_BATCH_MODEL) == 1 and GetMissionV(VARV_BOARD_TIMER) <= CHUANGGUAN30_TIME_LIMIT  then
			add_transfer_npc()
		else
			-- §Èy lïi ®iÓm b¸o danh
			kickout();
		end
	else
		-- Th«ng b¸o
		local batch = GetMissionV(VARV_NPC_BATCH);
		Msg2MSAll(MISSION_MATCH, GetMissionS(VARS_TEAM_NAME) .. "§éi ngò ®· tiªu diÖt toµn bé <color=yellow>" .. batch .. "<color> ®¸m qu¸i!");
		
		-- PhÇn th­ëng
		award_batch(batch, index);
    	
		-- NÕu ¶i hiÖn t¹i >= tæng ¶i th× kÕt thóc ho¹t ®éng V­ît ¶i
		if (batch >= get_batch_count()) then
			-- KÕt thóc
			success(index);
		else
			-- T¹o l­ît qu¸i tiÕp theo
			batch = batch + 1;
			SetMissionV(VARV_NPC_BATCH, batch);
			create_batch_npc(batch);
		end
	end
end

-- PhÇn th­ëng khi NPC tö vong
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
