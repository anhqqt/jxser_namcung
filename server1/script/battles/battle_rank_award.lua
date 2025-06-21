-- Thªm biÕn global
Include("\\script\\global\\anhquach\\env.lua")
--
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\awardtemplet.lua")

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

-- »ý·Ö
function battle_rank_sort_Point(nPlayerIndexA, nPlayerIndexB)
	local nTotalPointA = doFunByPlayer(nPlayerIndexA, BT_GetData, PL_TOTALPOINT)
	local nTotalPointB = doFunByPlayer(nPlayerIndexB, BT_GetData, PL_TOTALPOINT)
	return nTotalPointA > nTotalPointB
end

-- PKÍæ¼Ò
function battle_rank_sort_PK(nPlayerIndexA, nPlayerIndexB)
	local nTotalPointA = doFunByPlayer(nPlayerIndexA, BT_GetData, PL_KILLPLAYER)
	local nTotalPointB = doFunByPlayer(nPlayerIndexB, BT_GetData, PL_KILLPLAYER)
	return nTotalPointA > nTotalPointB
end

-- É±NPCÊý
function battle_rank_sort_NPC(nPlayerIndexA, nPlayerIndexB)
	local nTotalPointA = doFunByPlayer(nPlayerIndexA, BT_GetData, PL_KILLNPC)
	local nTotalPointB = doFunByPlayer(nPlayerIndexB, BT_GetData, PL_KILLNPC)
	return nTotalPointA > nTotalPointB
end

-- Á¬Õ¶
function battle_rank_sort_SER(nPlayerIndexA, nPlayerIndexB)
	local nTotalPointA = doFunByPlayer(nPlayerIndexA, BT_GetData, PL_MAXSERIESKILL)
	local nTotalPointB = doFunByPlayer(nPlayerIndexB, BT_GetData, PL_MAXSERIESKILL)
	return nTotalPointA > nTotalPointB
end



function battle_rank_activity(nBattleLevel)
	
	local tbCmpFun = 
	{
		battle_rank_sort_Point,
		battle_rank_sort_PK,
		battle_rank_sort_NPC,
		battle_rank_sort_SER
	}
	
	G_ACTIVITY:OnMessage("SongJinRank",nBattleLevel, battle_rank_GetSortPlayer0808, tbCmpFun, {})
end

-- 2011½â·ÅÈÕ»î¶¯£¬ÔùËÍ»¨»·
function battle_GiveHuanHuanByIndex()
	local tbItem = {szName="Vßng Hoa ChiÕn Th¾ng",tbProp={6,1,2824,1,0,0},nExpiredTime=20110530}
	tbAwardTemplet:Give(tbItem, 1, {"EventChienThang042011", "zhanshenghuahuan"})
	AddStatData("jiefangri_songjinchanchuzhanshenghuahuan", 1)
end

-- ÔÚ20110421~20110523²ÅÄÜ»ñµÃÕâ¸ö½±Àø
function battle_GiveHuahuan(tbPlayerAll)
	local ndate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nStartDate = 201104280000
	local nEndDate = 201105300000
	if ndate < nStartDate or ndate > nEndDate then
		return
	end 
	
	local nCount = 10	-- »¨»·µÄÊýÁ¿
	local nNumber = getn(tbPlayerAll)
	local nSplit = 1
	if nNumber > nCount then
		nSplit = (nNumber - mod(nNumber,nCount)) / nCount
	end
	
	for i=1,nNumber,nSplit do
		if nCount == 0 then
			break
		end
		nCount = nCount - 1
		nPlayerIndex = tbPlayerAll[i]
		if nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, battle_GiveHuanHuanByIndex)
		end
	end
end

function battle_finish_activity(nBattleLevel, tbPlayerAll, tbPlayerWin, tbPlayerLos, nWinLos)
-- ÁÙÊ±´úÂë 2010-06-07
	if (DynamicExecute("\\script\\event\\jiefang_jieri\\201004\\main.lua", "FreedomEvent2010:IsActive1") == 1 and nBattleLevel == 3) then
		for i=1, getn(tbPlayerAll) do
			local nPlayerIndex = tbPlayerAll[i]
			
			if nPlayerIndex ~= nil and nPlayerIndex > 0 then
				DynamicExecute("\\script\\event\\jiefang_jieri\\201004\\soldier\\main.lua", "Soldier2010:SongjinSoldier", nPlayerIndex)
			end
		end
		
	end
	G_ACTIVITY:OnMessage("FinishSongJin",nBattleLevel, tbPlayerAll, tbPlayerWin, tbPlayerLos, nWinLos)
	battle_GiveHuahuan(tbPlayerAll)
end


function battle_rank_award0808(nBattleLevel)
	local tbPlayer = {}
	battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_Point)
	for i=1, 20 do
		if tbPlayer[i] and tbPlayer[i] > 0 then
			Msg2MSAll(MISSIONID, format("<color=green>H¹ng %d<color>: <color=yellow>%s<color>", i, doFunByPlayer(tbPlayer[i],GetName)))
		end
	end	
	
end

function battle_rank_award_top10()
	local nWeekDay = tonumber(GetLocalDate("%w"));
	local nHour = tonumber(GetLocalDate("%H%M"))
	if (nHour >= TONG_KIM_THUONG_TOP_GIO_BAT_DAU and nHour < (TONG_KIM_THUONG_TOP_GIO_BAT_DAU + 160)) then
		-- TOP 10
		if (TONG_KIM_THUONG_TOP10_BAT == 1) then
			-- TOP 10 Thø 7
			if (TONG_KIM_THUONG_TOP10_T7_BAT == 1 and nWeekDay == 6) then
				battle_rank_award_top(1, 10, TONG_KIM_THUONG_TOP10_T7)
			else
				battle_rank_award_top(1, 10, TONG_KIM_THUONG_TOP10)
			end
		end
	end
end

function battle_rank_award_top3()
	local nWeekDay = tonumber(GetLocalDate("%w"));
	local nHour = tonumber(GetLocalDate("%H%M"))
	if (nHour >= TONG_KIM_THUONG_TOP_GIO_BAT_DAU and nHour < (TONG_KIM_THUONG_TOP_GIO_BAT_DAU + 160)) then
		-- TOP 3 TH¦ëNG TH£M
		if (TONG_KIM_THUONG_TOP3_BAT == 1) then
			battle_rank_award_top(1, 3, TONG_KIM_THUONG_TOP3)
		end
	end
end

function battle_rank_award_top(nCompareType, nTop, tbAward)
	local tbPlayer = {}

	-- LÊy h×nh thøc s¾p xÕp ®iÓm
	if nCompareType == 1 then
		battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_Point)
	elseif nCompareType == 2 then
		battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_PK)
	elseif nCompareType == 3 then
		battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_NPC)
	elseif nCompareType == 4 then
		battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_SER)
	else
		return
	end

	Msg2MSAll(MISSIONID, format("PHÇN TH¦ëNG <color=blue> TOP %d <color> TèNG KIM", nTop))
	for i=1, nTop do
		if tbPlayer[i] and tbPlayer[i] > 0 then
			doFunByPlayer(tbPlayer[i], battle_rank_award_add, i, tbAward)
		end
	end
end

function battle_rank_award_add(nRank, tbAward)
	nAwardCount = getn(tbAward)
	if nRank > nAwardCount then
		return
	end

	-- Msg2Player("<color=green>Debug Player Rank: <color>" .. nRank)
	-- Msg2Player("<color=green>Debug Award Count: <color>" .. getn(tbAward))
	-- Msg2Player("<color=green>Debug Player Award Count: <color>" .. getn(tbAward[nRank]))

	-- for i = 1, getn(tbAward[nRank]) do
	-- 	Msg2Player(format("<color=green>Debug Player Award Item %d: <color>%s", i, tbAward[nRank][i].szName))
	-- end

	local award = tbAward[nRank]
	local nRuong = CalcFreeItemCellCount()
	if nRuong < 10 then
		Talk(1,"","B¹n kh«ng cã ®ñ <color=yellow>10<color> « trèng trong hµnh trang")
		return
	else
		local szMsg = format("<color=green>H¹ng %d<color>: <color=yellow>%s<color> nhËn ®­îc ", nRank, GetName())
		local separator = ""
		for i = 1, getn(award) do
			if i ~= getn(award) then
				separator = " vµ "
			else
				separator = ""
			end
			
			if (award[i].szName == "§iÓm kinh nghiÖm") then
				szMsg = szMsg .. format("<color=orange>%d %s<color>%s", award[i].nExp_tl * award[i].nCount, award[i].szName, separator)
			elseif (award[i].szName == "Ng©n l­îng") then
				szMsg = szMsg .. format("<color=orange>%d v¹n %s<color>%s", (award[i].nJxb * award[i].nCount)/10000, award[i].szName, separator)
			else
				szMsg = szMsg .. format("<color=orange>%d %s<color>%s", award[i].nCount, award[i].szName, separator)
			end
		end
		Msg2MSAll(MISSIONID, szMsg)
		tbAwardTemplet:GiveAwardByList(award, format("PhÇn th­ëng TOP %d Tèng Kim", nRank))
	end
end
 
function battle_rank_GetSortPlayer0808(tbPlayer, nCamp, pCompare)
	tbPlayer= tbPlayer or {}
	local idx = 0;
	
	for i = 1 , GetMSPlayerCount(MISSIONID, nCamp) do
		idx, pidx = GetNextPlayer(MISSIONID, idx, nCamp)
		if (pidx and  pidx > 0) then
			tinsert(tbPlayer, pidx)
		end
		if (idx <= 0) then 
			break
		end;
	end
	
	sort(tbPlayer, pCompare)
	return tbPlayer
end

function battle_rank_doFun0808(nRank, nSortType, pfun, ...)
	
	local szName,nTotalPoint = BT_GetTopTenInfo(nRank, nSortType);
	
	if szName ~= nil and szName ~= "" then
			local nTopPlayerIdx = SearchPlayer(szName);
			
			if (nTopPlayerIdx > 0) then
				doFunByPlayer(nTopPlayerIdx, pfun,unpack(arg))
			end
		end
end