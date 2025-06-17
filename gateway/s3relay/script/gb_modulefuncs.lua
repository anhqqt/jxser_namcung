-- §­îc thiÕt kÕ dùa trªn hÖ thèng chiÕn ®éi cña Relay, ®äc tr¹ng th¸i bËt t¾t chøc n¨ng ®­îc chia sÎ trªn toµn bé nhãm m¸y chñ.
-- §Æc ®iÓm cña chøc n¨ng nµy lµ:
-- 1. Toµn bé m¸y chñ cã thÓ truy cËp vµ söa ®æi ®ång thêi
-- 2. VÉn cã hiÖu lùc ngay c¶ sau khi khëi ®éng l¹i vµ t¶i game
-- H¹n chÕ lµ: NÕu nhiÒu m¸y chñ cïng lóc söa ®æi gi¸ trÞ nµy cã thÓ x¶y ra vÊn ®Ò, v× vËy h·y cè g¾ng sö dông ph­¬ng thøc Append, tøc lµ chÕ ®é t¨ng hoÆc gi¶m.
-- NÕu m¸y Relay hiÖn t¹i hoÆc kh«ng ph¶n håi, sÏ xuÊt hiÖn t×nh huèng bÊt th­êng.
-- V× vËy, chøc n¨ng nµy th­êng ®­îc ¸p dông cho c¸c chøc n¨ng mµ ®é chÝnh x¸c cña gi¸ trÞ sè kh«ng yªu cÇu qu¸ cao hoÆc cã thÓ chÊp nhËn sai sè.
-- Designed By Romandou 2006.1.21
RELAYTASK_GAMEMODULE = 502 -- L­u tr÷ ID cña c¸c lo¹i cê
RELAYTASK_MODULETASK = 1 -- L­u tr÷ ID biÕn sè nhiÖm vô tr¹ng th¸i bËt/t¾t chøc n¨ng game
-- Tr¹ng th¸i cña mét chøc n¨ng cã ba lo¹i: 0 (Ch­a kÝch ho¹t UnUsed), 1 (§· kÝch ho¹t Started), 2 (§· ®ãng Stopped)
------------------------------------------------------------------------------------------------------------------------------------------------------
function gb_GetModule(szModuleName)
    local lid = LG_GetLeagueObj(RELAYTASK_GAMEMODULE, szModuleName)
    if (lid == 0 or lid == nil) then
        return 0
    end
    return LG_GetLeagueTask(lid, RELAYTASK_MODULETASK)
end

function gb_StopModule(szModuleName)
    OutputMsg("Game Module Is Stopped. -->"..szModuleName)
    gb_SetModule(szModuleName, 2)
end

function gb_StartModule(szModuleName)
    OutputMsg("Game Module Is Started. -->"..szModuleName)
    gb_SetModule(szModuleName, 1)
end

function gb_AutoStartModule(szModuleName)
    if (szModuleName == "") then
        return
    end

    local nState = gb_GetModule(szModuleName)
    if (nState == 0) then
        gb_StartModule(szModuleName)
        OutputMsg("New Game Module Is Started. -->"..szModuleName)
    elseif (nState == 1) then
        OutputMsg("Game Module Is Started. -->"..szModuleName)
    else
        OutputMsg("Game Module Is Stopped. -->"..szModuleName)
    end
end

function _gb_SetModule(szModuleName, nTaskID, nValue)
    local lid = LG_GetLeagueObj(RELAYTASK_GAMEMODULE, szModuleName)
    if (lid == 0 or lid == nil) then
        lid = LG_CreateLeagueObj()
        local memberObj = LGM_CreateMemberObj()
        LG_SetLeagueInfo(lid, RELAYTASK_GAMEMODULE, szModuleName)
        LGM_SetMemberInfo(memberObj, szModuleName, 0, RELAYTASK_GAMEMODULE, szModuleName)
        LG_AddMemberToObj(lid, memberObj)
        LG_ApplyAddLeague(lid)
        LG_FreeLeagueObj(lid)
    end
    LG_ApplySetLeagueTask(RELAYTASK_GAMEMODULE, szModuleName, nTaskID, nValue)
end

function gb_SetModule(szModuleName, nValue)
    _gb_SetModule(szModuleName, RELAYTASK_MODULETASK, nValue)
end
