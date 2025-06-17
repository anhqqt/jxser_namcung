-- ���c thi�t k� d�a tr�n h� th�ng chi�n ��i c�a Relay, ��c tr�ng th�i b�t t�t ch�c n�ng ���c chia s� tr�n to�n b� nh�m m�y ch�.
-- ��c �i�m c�a ch�c n�ng n�y l�:
-- 1. To�n b� m�y ch� c� th� truy c�p v� s�a ��i ��ng th�i
-- 2. V�n c� hi�u l�c ngay c� sau khi kh�i ��ng l�i v� t�i game
-- H�n ch� l�: N�u nhi�u m�y ch� c�ng l�c s�a ��i gi� tr� n�y c� th� x�y ra v�n ��, v� v�y h�y c� g�ng s� d�ng ph��ng th�c Append, t�c l� ch� �� t�ng ho�c gi�m.
-- N�u m�y Relay hi�n t�i ho�c kh�ng ph�n h�i, s� xu�t hi�n t�nh hu�ng b�t th��ng.
-- V� v�y, ch�c n�ng n�y th��ng ���c �p d�ng cho c�c ch�c n�ng m� �� ch�nh x�c c�a gi� tr� s� kh�ng y�u c�u qu� cao ho�c c� th� ch�p nh�n sai s�.
-- Designed By Romandou 2006.1.21
RELAYTASK_GAMEMODULE = 502 -- L�u tr� ID c�a c�c lo�i c�
RELAYTASK_MODULETASK = 1 -- L�u tr� ID bi�n s� nhi�m v� tr�ng th�i b�t/t�t ch�c n�ng game
-- Tr�ng th�i c�a m�t ch�c n�ng c� ba lo�i: 0 (Ch�a k�ch ho�t UnUsed), 1 (�� k�ch ho�t Started), 2 (�� ��ng Stopped)
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
