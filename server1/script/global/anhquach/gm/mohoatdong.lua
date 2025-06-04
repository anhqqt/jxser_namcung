Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\ds_gm.lua")

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
    g_AskClientNumberEx(1, 3, "Lo�i T�ng Kim:", { aqMoTongKimAct, { nBattleLevel } })
end

function aqMoTongKimAct(nBattleLevel)
    Msg2Player("<color=green>�ang ti�n h�nh m� T�ng Kim: <color>"..nBattleLevel)
    RemoteExc("\\script\\anhquach\\gm_script.lua", "Gm_Call_Battles", {nBattleLevel})
end

function aqMoPhongLangDo()

end

function aqMoVuotAi()

end
