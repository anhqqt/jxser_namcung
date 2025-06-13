Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\remoteexc.lua")

function QuanLyHD_Say(szTitle)
    dofile("script/global/anhquach/gm/quan_ly_hoat_dong.lua")

    local tbOpt = {
        {"T�ng Kim", QuanLyTK_Say, {szTitle}},
        {"Phong L�ng ��", QuanLyPLD_Say, {szTitle}},
        {"V��t �i", QuanLyVA_Say, {szTitle}},
        {"Tho�t"}
    }
    CreateNewSayEx(szTitle, tbOpt)
end

--  //////////////////////////////////////////////////////////////
-- //                        T�ng Kim                          //
--//////////////////////////////////////////////////////////////
function QuanLyTK_Say(szTitle)
    local tbOpt = {
        {"M� ho�t ��ng", QuanLyTK_MoHoatDongSay},
        {"T�ng �i�m t�ch l�y", QuanLyTK_TangTichLuySay},
        {"Reset �i�m t�ch l�y", QuanLyTK_ResetTichLuy},
        {"Ki�m tra �i�m t�ch l�y", QuanLyTK_KiemTraTichLuy},
        {"Tho�t"}
    }
    CreateNewSayEx(szTitle, tbOpt)
end

function QuanLyTK_MoHoatDongSay()
    Msg2Player("<color=green>Nh�p s� 1 l� m� S� C�p<color>")
    Msg2Player("<color=green>Nh�p s� 2 l� m� Trung C�p<color>")
    Msg2Player("<color=green>Nh�p s� 3 l� m� Cao C�p<color>")
    g_AskClientNumberEx(1, 3, "Lo�i T�ng Kim:", {QuanLyTK_MoHoatDong, {nBattleLevel}})
end

function QuanLyTK_MoHoatDong(nBattleLevel)
    RemoteExc("\\script\\anhquach\\gm_script.lua", "Gm_Call_Battles", {nBattleLevel})
    local nBattleName = ""
    if nBattleLevel == 1 then
        nBattleName = "S� C�p"
    elseif nBattleLevel == 2 then
        nBattleName = "Trung C�p"
    elseif nBattleLevel == 3 then
        nBattleName = "Cao C�p"
    end
    Msg2Player("<color=yellow>�� m� th�nh c�ng ho�t ��ng: <color><color=green>T�ng Kim " .. nBattleName .. "<color>")
end

function QuanLyTK_TangTichLuySay()
    Msg2Player("<color=green>Nh�p v�o s� l��ng t�ch l�y mu�n nh�n. T�i �a <color=yellow>1.000.000 / l�n<color><color>")
    g_AskClientNumberEx(1, 1000000, "S� l��ng", {QuanLyTK_TangTichLuy, {nNumber}})
end

function QuanLyTK_TangTichLuy(nNumber)
    SetTask(747, nNumber)
    Msg2Player("<color=yellow>�� t�ng th�nh c�ng <color=green>" .. nNumber .. "<color> �i�m t�ch l�y<color>")
end

function QuanLyTK_ResetTichLuy()
    SetTask(747, 0)
    Msg2Player("<color=yellow>�� reset �i�m t�ch l�y v� <color=green>0<color><color>")
end

function QuanLyTK_KiemTraTichLuy()
    nTichLuy = GetTask(747)
    Talk(1,"","Hi�n t�i b�n c� <color=green>" .. nTichLuy .. "<color> �i�m t�ch l�y")
end

--  //////////////////////////////////////////////////////////////
-- //                      Phong L�ng ��                       //
--//////////////////////////////////////////////////////////////
function QuanLyPLD_Say(szTitle)
    local tbOpt = {
        {"M� ho�t ��ng", QuanLyPLD_MoHoatDong},
        {"Tho�t"}
    }
    CreateNewSayEx(szTitle, tbOpt)
end

function QuanLyPLD_MoHoatDong()
    DynamicExecute("\\script\\missions\\fengling_ferry\\fldmap_boat1.lua", "fenglingdu_main")
    Msg2Player("<color=yellow>�� m� th�nh c�ng ho�t ��ng: <color><color=green>Phong L�ng ��<color>")
end

--  //////////////////////////////////////////////////////////////
-- //                         V��t �i                          //
--//////////////////////////////////////////////////////////////
Include("\\settings\\trigger_challengeoftime.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\challengeoftime\\chuangguang30.lua")
function QuanLyVA_Say(szTitle)
    local tbOpt = {
        {"M� ho�t ��ng", QuanLyVA_MoHoatDong},
        {"Tho�t"}
    }
    CreateNewSayEx(szTitle, tbOpt)
end

function QuanLyVA_MoHoatDong()
    zAddLocalCountNews = "'Th�ch th�c th�i gian' �� ��n gi� b�o danh. ��i tr��ng nhanh ch�n ��n Nhi�p Th� Tr�n �� ghi danh th�i gian ghi danh l� 10 ph�t."
    AddGlobalNews(format("%s",zAddLocalCountNews))
	-- DEBUG
	print("trigger_challengeoftime start...");
	-- TODO: S�a ��i tham s� nhi�m v�
	-- Kh�i ��ng l�i missions
	close_missions(map_map, MISSION_MATCH, VARV_STATE);
	start_missions(map_map, MISSION_MATCH);
	
	-- �i�u ch�nh c�a �i 2011.03.02
	ChuangGuan30:KickOutAll()
	ClearMapNpc(CHUANGGUAN30_MAP_ID)
	-- Th�m b� ��m th�i gian
	DynamicExecute("\\script\\missions\\challengeoftime\\chuangguang30.lua", "ChuangGuan30:AddTime")

    Msg2Player("<color=yellow>�� m� th�nh c�ng ho�t ��ng: <color><color=green>V��t �i<color>")
end
