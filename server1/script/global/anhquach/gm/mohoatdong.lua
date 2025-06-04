Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\ds_gm.lua")

function aqMoHoatDong()
    dofile("script/global/anhquach/gm/mohoatdong.lua")
    if CheckAccountGM() then
        w, x, y = GetWorldPos()
        SubWorld = SubWorldID2Idx(w)
        SubName = SubWorldName(SubWorld)
        local szTitle = "<npc><color=red>Hæ trî GM<color>: <color=orange>"..GetName().." <color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>C÷u Niªn T­¬ng Phïng<color>.<enter><color=Yellow>Hoan nghªnh c¸c anh hïng hµo kiÖt... ! <color><ent<color> - <color=red>VÞ TrÝ<color>:<color=orange>ID:<color><color=orange>"..w.."<color>-<color=red>"..SubName.."<color>-Täa ®é X/Y:<color=yellow> "..x.."<color>/<color=cyan>"..y.."<color>"
        local tbOpt = {
            {"Më Tèng Kim",      aqMoTongKimUI},
            {"Më Phong L¨ng §é", aqMoPhongLangDo},
            {"Më V­ît ¶i",       aqMoVuotAi},
            {"Tho¸t"}
        }
        CreateNewSayEx(szTitle, tbOpt)
    end
end

function aqMoTongKimUI()
    Msg2Player("<color=green>NhËp sè 1 lµ më S¬ CÊp<color>")
    Msg2Player("<color=green>NhËp sè 2 lµ më Trung CÊp<color>")
    Msg2Player("<color=green>NhËp sè 3 lµ më Cao CÊp<color>")
    g_AskClientNumberEx(1, 3, "Lo¹i Tèng Kim:", { aqMoTongKimAct, { nBattleLevel } })
end

function aqMoTongKimAct(nBattleLevel)
    Msg2Player("<color=green>§ang tiÕn hµnh më Tèng Kim: <color>"..nBattleLevel)
    RemoteExc("\\script\\anhquach\\gm_script.lua", "Gm_Call_Battles", {nBattleLevel})
end

function aqMoPhongLangDo()

end

function aqMoVuotAi()

end
