Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\ds_gm.lua")
-- V­ît ¶i
Include("\\settings\\trigger_challengeoftime.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\challengeoftime\\chuangguang30.lua")

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
    g_AskClientNumberEx(1, 3, "Lo¹i Tèng Kim:", {aqMoTongKimAct, {nBattleLevel}})
end

function aqMoTongKimAct(nBattleLevel)
    RemoteExc("\\script\\anhquach\\gm_script.lua", "Gm_Call_Battles", {nBattleLevel})
    local nBattleName = ""
    if nBattleLevel == 1 then
        nBattleName = "S¬ CÊp"
    elseif nBattleLevel == 2 then
        nBattleName = "Trung CÊp"
    elseif nBattleLevel == 3 then
        nBattleName = "Cao CÊp"
    end
    Msg2Player("<color=yellow>§· më thµnh c«ng ho¹t ®éng: <color><color=green>Tèng Kim " .. nBattleName .. "<color>")
end

function aqMoPhongLangDo()
    DynamicExecute("\\script\\missions\\fengling_ferry\\fldmap_boat1.lua", "fenglingdu_main")
    Msg2Player("<color=yellow>§· më thµnh c«ng ho¹t ®éng: <color><color=green>Phong L¨ng §é<color>")
end

function aqMoVuotAi()
    zAddLocalCountNews = "'Th¸ch thøc thêi gian' §· ®Õn giê b¸o danh. §éi tr­ëng nhanh ch©n ®Õn NhiÕp ThÝ TrÇn ®Ó ghi danh thêi gian ghi danh lµ 10 phót."
    AddGlobalNews(format("%s",zAddLocalCountNews))
	-- DEBUG
	print("trigger_challengeoftime start...");
	-- TODO: Söa ®æi tham sè nhiÖm vô
	-- Khëi ®éng l¹i missions
	close_missions(map_map, MISSION_MATCH, VARV_STATE);
	start_missions(map_map, MISSION_MATCH);
	
	-- §iÒu chØnh cöa ¶i 2011.03.02
	ChuangGuan30:KickOutAll()
	ClearMapNpc(CHUANGGUAN30_MAP_ID)
	-- Thªm bé ®Õm thêi gian
	DynamicExecute("\\script\\missions\\challengeoftime\\chuangguang30.lua", "ChuangGuan30:AddTime")

    Msg2Player("<color=yellow>§· më thµnh c«ng ho¹t ®éng: <color><color=green>V­ît ¶i<color>")
end
