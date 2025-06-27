-- description	: Ng­êi ch¬i tö vong
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\missions\\challengeoftime\\include.lua")

function OnDeath(index)
	-- Söa ®æi sè l­îng ng­êi ch¬i
	local count = GetMSPlayerCount(MISSION_MATCH) - 1;
	if (count < 0) then
		count = 0;
	end
	SetMissionV(VARV_PLAYER_COUNT, count);

	if (GetMissionV(VARV_NPC_COUNT) ~= 0) then
		-- Cã ph¶i ®éi tr­ëng chÕt kh«ng
		local name = GetMissionS(VARS_TEAM_NAME);
		if (name == GetName()) then
			broadcast(name .. "§éi tr­ëng ®éi ngò tö vong!");
		end
		
		-- Cã ph¶i toµn ®éi bÞ tiªu diÖt kh«ng
		if (count == 0) then
			broadcast(name .. "Toµn ®éi tö vong hÕt!");
		end
	end
	DelMSPlayer(MISSION_MATCH, 1);
	-- Th«ng b¸o ng­êi ch¬i tö vong trong nhiÖm vô
	Msg2MSAll(MISSION_MATCH, GetName() .. "Kh«ng may t¹i trËn tö vong!");	
	SetLogoutRV(0)	
	NewWorld(11,3207,4978)
	-- TruyÒn tèng vÒ ®iÓm b¸o danh
	-- local world = GetMissionV(VARV_SIGNUP_WORLD);
	-- local pos_x = GetMissionV(VARV_SIGNUP_POSX);
	-- local pos_y = GetMissionV(VARV_SIGNUP_POSY); 
	-- NewWorld(world, pos_x, pos_y);
	-- -- DEBUG
	-- print(format("%sÔÚÁúÖÛ±ÈÈüÖÐËÀÍö£¬±»Ìß»Ø(%d,%d,%d)Î»ÖÃ", GetName(), world, pos_x, pos_y));
end
