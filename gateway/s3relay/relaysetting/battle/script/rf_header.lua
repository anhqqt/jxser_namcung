-- File ®Çu quy tr×nh chiÕn ®Êu
-- Fanghao Wu
-- 2004.12.15

DBKEY_BATTLE = "BATTLE_%d_%d";						-- KEY c¬ së d÷ liÖu cña th«ng tin chiÕn tr­êng
DBKEY_BATTLE_LATEST_INFO = "BATTLE_LATEST_INFO";	-- KEY c¬ së d÷ liÖu cña th«ng tin trËn ®Êu cuèi cïng trong chiÕn tr­êng

-- T¹o KEY c¬ së d÷ liÖu cña th«ng tin chiÕn tr­êng chØ ®Þnh
function makeBattleDBKey( nBattleID, nBattleLevel )
	return format( DBKEY_BATTLE, nBattleID, nBattleLevel );
end

-- Khëi ®éng mét vßng chiÕn tr­êng míi
function battle_StartNewIssue( nBattleID, nBattleLevel )
	local bDBSuccess, nLatestIssueID, nRoundCount, nRoundID, nMapPatternID, nBattleMapID, nWorldMapID, strMapName, nRuleID;
	local arynMapPatternID, arynFollowingRoundID, arynRuleID;
	
	bDBSuccess, nLatestIssueID, nRoundCount, nRoundID = battle_GetLatestIssueInfo( nBattleID, nBattleLevel );
	if( bDBSuccess ~= 1 ) then	-- TrËn chiÕn ®Çu tiªn
		nLatestIssueID = 1;
	else
		nLatestIssueID = nLatestIssueID + 1;
	end
	nRoundCount = 1;
	nRoundID = 1;
	
	arynMapPatternID, arynFollowingRoundID = Battle_GetRoundInfo( nBattleID, nRoundID );
	nMapPatternID = arynMapPatternID[ Random( getn( arynMapPatternID ) ) + 1 ];
	nBattleMapID, arynRuleID = Battle_GetMapPatternInfo( nBattleID, nMapPatternID );
	nWorldMapID, arystrMapName = Battle_GetBattleMapInfo( nBattleID, nBattleMapID, nBattleLevel );
	strMapName = arystrMapName[ Random( getn( arystrMapName ) ) + 1 ];
	nRuleID = arynRuleID[ Random( getn( arynRuleID ) ) + 1 ];
	
	battle_SaveRoundInfo( nBattleID, nBattleLevel, nLatestIssueID, nRoundCount, nRoundID, nMapPatternID, strMapName, nRuleID, 0 );
	battle_Msg_NewRound( nBattleID, nBattleLevel, nLatestIssueID, nRoundCount, nRoundID, nMapPatternID, nBattleMapID, nWorldMapID, strMapName, nRuleID );

	return nLatestIssueID, nRoundCount, nRoundID, nMapPatternID, strMapName, nRuleID;
end

-- LÊy th«ng tin vÒ kú sè vµ trËn sè cuèi cïng cña chiÕn tr­êng chØ ®Þnh
function battle_GetLatestIssueInfo( nBattleID, nBattleLevel )
	local bDBSuccess;
	local nLatestIssueID, nRoundCount;
	bDBSuccess, nLatestIssueID, nRoundCount = GetCustomDataFromSDB( DBKEY_BATTLE_LATEST_INFO, nBattleID, nBattleLevel, "ii" );
	return bDBSuccess, nLatestIssueID, nRoundCount;
end

-- LÊy th«ng tin chi tiÕt vÒ chiÕn tr­êng ®­îc chØ ®Þnh
function battle_GetSpecRoundInfo( nBattleID, nBattleLevel, nIssueID, nRoundCount )
	local strBattleDBKey;
	local bDBSuccess;
	local nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult;
	
	strBattleDBKey = makeBattleDBKey( nBattleID, nBattleLevel );
	bDBSuccess, nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult = GetCustomDataFromSDB( strBattleDBKey, nIssueID, nRoundCount, "iisii" );
	
	return bDBSuccess, nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult;
end

-- LÊy th«ng tin chi tiÕt vÒ chiÕn tr­êng cña trËn ®Êu cuèi cïng ®­îc chØ ®Þnh
function battle_GetLatestRoundInfo( nBattleID, nBattleLevel )
	local bDBSuccess;
	local nLatestIssueID, nRoundCount;
	local nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult;
	
	bDBSuccess, nLatestIssueID, nRoundCount = battle_GetLatestIssueInfo( nBattleID, nBattleLevel );
	
	if( bDBSuccess == 1 ) then
		bDBSuccess, nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult = battle_GetSpecRoundInfo( nBattleID, nBattleLevel, nLatestIssueID, nRoundCount );
	end
	
	return bDBSuccess, nLatestIssueID, nRoundCount, nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult;
end

-- L­u tr÷ th«ng tin chi tiÕt chiÕn tr­êng
function battle_SaveRoundInfo( nBattleID, nBattleLevel, nIssueID, nRoundCount, nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult )
	SaveCustomDataToSDBOw( DBKEY_BATTLE_LATEST_INFO, nBattleID, nBattleLevel, "ii", nIssueID, nRoundCount );
	local strBattleDBKey = makeBattleDBKey( nBattleID, nBattleLevel );
	SaveCustomDataToSDBOw( strBattleDBKey, nIssueID, nRoundCount, "iisii", nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult );
end

-- XuÊt ký tù ph©n c¸ch nhËt ký
function battle_Msg_Separator()
	OutputMsg( "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" );
end

-- XuÊt nhËt ký chiÕn tr­êng míi
function battle_Msg_NewRound( nBattleID, nBattleLevel, nIssueID, nRoundCount, nRoundID, nMapPatternID, nBattleMapID, nWorldMapID, strMapName, nRuleID, strExtraMsg )
	battle_Msg_Separator();
	OutputMsg( format( "[%s]  NEW BATTLE START", date( "%Y-%m-%d %H:%M:%S" ) ) );
	OutputMsg( format( "BattleID: %d   BattleLevel: %d   Issue: %d   %dth.Round", nBattleID, nBattleLevel, nIssueID, nRoundCount ) );
	OutputMsg( format( "RoundID: %d   MapPattern: %d   BattleMapID:  %d   WorldMapID: %d   MapName: %s   RuleID: %d", nRoundID, nMapPatternID, nBattleMapID, nWorldMapID, strMapName, nRuleID ) );
	if( strExtraMsg ~= nil ) then
		OutputMsg( strExtraMsg );
	end
	battle_Msg_Separator();
end

-- XuÊt nhËt ký kÕt thóc chiÕn tr­êng
function battle_Msg_RoundResult( nBattleID, nBattleLevel, nIssueID, nRoundCount, nRoundID, nBattleResult, strExtraMsg )
	battle_Msg_Separator();
	OutputMsg( format( "[%s]  BATTLE END", date( "%Y-%m-%d %H:%M:%S" ) ) );
	OutputMsg( format( "BattleID: %d   BattleLevel: %d   Issue: %d   %dth.Round RoundId: %d   Result: %d", nBattleID, nBattleLevel, nIssueID, nRoundCount, nRoundID, nBattleResult ) );
	if( strExtraMsg ~= nil ) then
		OutputMsg( strExtraMsg );
	end
	battle_Msg_Separator();
end