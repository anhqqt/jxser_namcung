Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\ds_gm.lua")
-- V��t �i
Include("\\settings\\trigger_challengeoftime.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\challengeoftime\\chuangguang30.lua")

function aqMoHoatDong()
    dofile("script/global/anhquach/gm/mohoatdong.lua")
    if CheckAccountGM() then
        w, x, y = GetWorldPos()
        SubWorld = SubWorldID2Idx(w)
        SubName = SubWorldName(SubWorld)
        local szTitle = "<npc><color=red>H� tr� GM<color>: <color=orange>"..GetName().." <color>.<enter><color=yellow>V� L�m Truy�n K�<color><enter><color=red>C�u Ni�n T��ng Ph�ng<color>.<enter><color=Yellow>Hoan ngh�nh c�c anh h�ng h�o ki�t... ! <color><ent<color> - <color=red>V� Tr�<color>:<color=orange>ID:<color><color=orange>"..w.."<color>-<color=red>"..SubName.."<color>-T�a �� X/Y:<color=yellow> "..x.."<color>/<color=cyan>"..y.."<color>"
        local tbOpt = {
            {"M� T�ng Kim",      aqMoTongKimUI},
            {"M� Phong L�ng ��", aqMoPhongLangDo},
            {"M� V��t �i",       aqMoVuotAi},
            {"Tho�t"}
        }
        CreateNewSayEx(szTitle, tbOpt)
    end
end

function aqMoTongKimUI()
    Msg2Player("<color=green>Nh�p s� 1 l� m� S� C�p<color>")
    Msg2Player("<color=green>Nh�p s� 2 l� m� Trung C�p<color>")
    Msg2Player("<color=green>Nh�p s� 3 l� m� Cao C�p<color>")
    g_AskClientNumberEx(1, 3, "Lo�i T�ng Kim:", {aqMoTongKimAct, {nBattleLevel}})
end

function aqMoTongKimAct(nBattleLevel)
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

function aqMoPhongLangDo()
    DynamicExecute("\\script\\missions\\fengling_ferry\\fldmap_boat1.lua", "fenglingdu_main")
    Msg2Player("<color=yellow>�� m� th�nh c�ng ho�t ��ng: <color><color=green>Phong L�ng ��<color>")
end

function aqMoVuotAi()
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
