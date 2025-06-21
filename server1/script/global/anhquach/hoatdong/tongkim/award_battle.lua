-- Thªm biÕn global
Include("\\script\\global\\anhquach\\env.lua")
--
Include("\\script\\battles\\battles_award_head.lua")

-- Th­ëng thªm kÕt thóc trËn by Anh Quach - 21/06/2025
function battles_award_all_players(tb_player, tb_award, sz_msg)
	-- T¹o msg cho player
	local separator = ""
	for i = 1, getn(tb_award) do
		if i ~= getn(tb_award) then
			separator = " vµ "
		else
			separator = ""
		end
		
		if (tb_award[i].szName == "§iÓm kinh nghiÖm") then
			sz_msg = sz_msg .. format("<color=green>%d %s<color>%s", tb_award[i].nExp_tl * tb_award[i].nCount, tb_award[i].szName, separator)
		elseif (tb_award[i].szName == "Ng©n l­îng") then
			sz_msg = sz_msg .. format("<color=green>%d v¹n %s<color>%s", (tb_award[i].nJxb * tb_award[i].nCount)/10000, tb_award[i].szName, separator)
		else
			sz_msg = sz_msg .. format("<color=green>%d %s<color>%s", tb_award[i].nCount, tb_award[i].szName, separator)
		end
	end
	
	local old_player = PlayerIndex
	for i = 1, getn(tb_player) do
		if tb_player[i] and tb_player[i] > 0 then
			PlayerIndex = tb_player[i];
			if BT_GetData(PL_TOTALPOINT) >= TONG_KIM_THUONG_THEM_DIEM_YEU_CAU then
				tbAwardTemplet:GiveAwardByList(tb_award)
				Msg2Player(sz_msg)
			end
		end
	end
	PlayerIndex = old_player;
end

function battles_award_additional_end(n_camp, tb_all_player, tb_win_player, tb_lose_player)
	local game_level = BT_GetGameData(GAME_LEVEL)
	local nHour = tonumber(GetLocalDate("%H%M"))
	if (TONG_KIM_THUONG_THEM_BAT == 1) and (nHour >= TONG_KIM_THUONG_TOP_GIO_BAT_DAU and nHour < (TONG_KIM_THUONG_TOP_GIO_BAT_DAU + 160)) then
		if (n_camp ~= 0) then
			battles_award_all_players(tb_win_player, TONG_KIM_THUONG_THEM_THANG[game_level], "Chóc mõng phe ta ®· giµnh chiÕn th¾ng vang déi! Ng­¬i nhËn ®­îc thªm ")
			battles_award_all_players(tb_lose_player, TONG_KIM_THUONG_THEM_THUA[game_level], "TiÕc r»ng phe ta ®· thÊt b¹i trong trËn chiÕn nµy! Ng­¬i nhËn ®­îc thªm ")
		else
			battles_award_all_players(tb_all_player, TONG_KIM_THUONG_THEM_HOA[game_level], "TrËn nµy bÊt ph©n th¾ng b¹i! Ng­¬i nhËn ®­îc thªm ")
		end
	end
end