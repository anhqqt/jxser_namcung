-- Th�m bi�n global
Include("\\script\\global\\anhquach\\env.lua")
--
Include("\\script\\battles\\battle_rank_award.lua")

-- Th��ng TOP 10 v� TOP 3 by Anh Quach - 21/06/2025
function battle_rank_award_add(nRank, tbAward)
	nAwardCount = getn(tbAward)
	if nRank > nAwardCount then
		return
	end

	local award = tbAward[nRank]
	local nRuong = CalcFreeItemCellCount()
	if nRuong < 10 then
		Talk(1,"","B�n kh�ng c� �� <color=yellow>10<color> � tr�ng trong h�nh trang")
		return
	else
		local szMsg = format("<color=green>H�ng %d<color>: <color=yellow>%s<color> nh�n ���c ", nRank, GetName())
		local separator = ""
		for i = 1, getn(award) do
			if i ~= getn(award) then
				separator = " v� "
			else
				separator = ""
			end
			
			if (award[i].szName == "�i�m kinh nghi�m") then
				szMsg = szMsg .. format("<color=orange>%d %s<color>%s", award[i].nExp_tl * award[i].nCount, award[i].szName, separator)
			elseif (award[i].szName == "Ng�n l��ng") then
				szMsg = szMsg .. format("<color=orange>%d v�n %s<color>%s", (award[i].nJxb * award[i].nCount)/10000, award[i].szName, separator)
			else
				szMsg = szMsg .. format("<color=orange>%d %s<color>%s", award[i].nCount, award[i].szName, separator)
			end
		end
		Msg2MSAll(MISSIONID, szMsg)
		tbAwardTemplet:GiveAwardByList(award, format("Ph�n th��ng TOP %d T�ng Kim", nRank))
	end
end

function battle_rank_award_top10()
	local nWeekDay = tonumber(GetLocalDate("%w"));
	local nHour = tonumber(GetLocalDate("%H%M"))
	if (TONG_KIM_THUONG_TOP10_BAT == 1) and (nHour >= TONG_KIM_THUONG_TOP_GIO_BAT_DAU and nHour < (TONG_KIM_THUONG_TOP_GIO_BAT_DAU + 160)) then
		-- Danh s�ch ng��i ch�i
		---- battle_rank_sort_Point
		---- battle_rank_sort_PK
		---- battle_rank_sort_NPC
		---- battle_rank_sort_SER
		local tbPlayer = {}
		battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_Point)

		-- Danh s�ch ph�n th��ng
		local tbAward = {}
		if (TONG_KIM_THUONG_TOP10_T7_BAT == 1 and nWeekDay == 6) then
			tbAward = TONG_KIM_THUONG_TOP10_T7
		else
			tbAward = TONG_KIM_THUONG_TOP10
		end

		Msg2MSAll(MISSIONID, format("PH�N TH��NG <color=blue> TOP 10 <color> T�NG KIM"))

		local old_player = PlayerIndex
		for i = 1, 10 do
			if tbPlayer[i] and tbPlayer[i] > 0 then
				-- doFunByPlayer(tbPlayer[i], battle_rank_award_add, i, tbAward) -- Chuy�n dang d�ng con tr� do kh�ng d�ng �i�u ki�n ki�m tra �i�m t�ch l�y ���c
				
				PlayerIndex = tbPlayer[i];
				if BT_GetData(PL_TOTALPOINT) >= TONG_KIM_THUONG_TOP_DIEM_YEU_CAU then
					battle_rank_award_add(i, tbAward)
				end
			end
		end
		PlayerIndex = old_player
	end
end

function battle_rank_award_top3()
	local nHour = tonumber(GetLocalDate("%H%M"))
	if (TONG_KIM_THUONG_TOP3_BAT == 1) and (nHour >= TONG_KIM_THUONG_TOP_GIO_BAT_DAU and nHour < (TONG_KIM_THUONG_TOP_GIO_BAT_DAU + 160)) then
		-- Danh s�ch ng��i ch�i
		---- battle_rank_sort_Point
		---- battle_rank_sort_PK
		---- battle_rank_sort_NPC
		---- battle_rank_sort_SER
		local tbPlayer = {}
		battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_Point)
		
		-- Danh s�ch ph�n th��ng
		local tbAward = TONG_KIM_THUONG_TOP3

		Msg2MSAll(MISSIONID, format("PH�N TH��NG <color=blue> TOP 3 <color> T�NG KIM"))

		local old_player = PlayerIndex
		for i=1, 3 do
			if tbPlayer[i] and tbPlayer[i] > 0 then
				-- doFunByPlayer(tbPlayer[i], battle_rank_award_add, i, tbAward) -- Chuy�n dang d�ng con tr� do kh�ng d�ng �i�u ki�n ki�m tra �i�m t�ch l�y ���c

				PlayerIndex = tbPlayer[i];
				if BT_GetData(PL_TOTALPOINT) >= TONG_KIM_THUONG_TOP_DIEM_YEU_CAU then
					battle_rank_award_add(i, tbAward)
				end
			end
		end
		PlayerIndex = old_player
	end
end

function battle_rank_award_top()
	battle_rank_award_top10()
	battle_rank_award_top3()
end