Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\remoteexc.lua")

function QuanLyHD_Say(szTitle)
    dofile("script/global/anhquach/gm/quan_ly_hoat_dong.lua")

    local tbOpt = {
        {"Tèng Kim", QuanLyTK_Say, {szTitle}},
        {"Phong L¨ng §é", QuanLyPLD_Say, {szTitle}},
        {"V­ît ¶i", QuanLyVA_Say, {szTitle}},
        {"Tho¸t"}
    }
    CreateNewSayEx(szTitle, tbOpt)
end

--  //////////////////////////////////////////////////////////////
-- //                        Tèng Kim                          //
--//////////////////////////////////////////////////////////////
function QuanLyTK_Say(szTitle)
    local tbOpt = {
        {"Më ho¹t ®éng", QuanLyTK_MoHoatDongSay},
        {"T¨ng ®iÓm tÝch lòy", QuanLyTK_TangTichLuySay},
        {"Reset ®iÓm tÝch lòy", QuanLyTK_ResetTichLuy},
        {"KiÓm tra ®iÓm tÝch lòy", QuanLyTK_KiemTraTichLuy},
        {"Tho¸t"}
    }
    CreateNewSayEx(szTitle, tbOpt)
end

function QuanLyTK_MoHoatDongSay()
    Msg2Player("<color=green>NhËp sè 1 lµ më S¬ CÊp<color>")
    Msg2Player("<color=green>NhËp sè 2 lµ më Trung CÊp<color>")
    Msg2Player("<color=green>NhËp sè 3 lµ më Cao CÊp<color>")
    g_AskClientNumberEx(1, 3, "Lo¹i Tèng Kim:", {QuanLyTK_MoHoatDong, {nBattleLevel}})
end

function QuanLyTK_MoHoatDong(nBattleLevel)
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

function QuanLyTK_TangTichLuySay()
    Msg2Player("<color=green>NhËp vµo sè l­îng tÝch lòy muèn nhËn. Tèi ®a <color=yellow>1.000.000 / lÇn<color><color>")
    g_AskClientNumberEx(1, 1000000, "Sè l­îng", {QuanLyTK_TangTichLuy, {nNumber}})
end

function QuanLyTK_TangTichLuy(nNumber)
    SetTask(747, nNumber)
    Msg2Player("<color=yellow>§· t¨ng thµnh c«ng <color=green>" .. nNumber .. "<color> ®iÓm tÝch lòy<color>")
end

function QuanLyTK_ResetTichLuy()
    SetTask(747, 0)
    Msg2Player("<color=yellow>§· reset ®iÓm tÝch lòy vÒ <color=green>0<color><color>")
end

function QuanLyTK_KiemTraTichLuy()
    nTichLuy = GetTask(747)
    Talk(1,"","HiÖn t¹i b¹n cã <color=green>" .. nTichLuy .. "<color> ®iÓm tÝch lòy")
end

--  //////////////////////////////////////////////////////////////
-- //                      Phong L¨ng §é                       //
--//////////////////////////////////////////////////////////////
function QuanLyPLD_Say(szTitle)
    local tbOpt = {
        {"Më ho¹t ®éng", QuanLyPLD_MoHoatDong},
        {"Tho¸t"}
    }
    CreateNewSayEx(szTitle, tbOpt)
end

function QuanLyPLD_MoHoatDong()
    DynamicExecute("\\script\\missions\\fengling_ferry\\fldmap_boat1.lua", "fenglingdu_main")
    Msg2Player("<color=yellow>§· më thµnh c«ng ho¹t ®éng: <color><color=green>Phong L¨ng §é<color>")
end

--  //////////////////////////////////////////////////////////////
-- //                         V­ît ¶i                          //
--//////////////////////////////////////////////////////////////
Include("\\settings\\trigger_challengeoftime.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\challengeoftime\\chuangguang30.lua")
function QuanLyVA_Say(szTitle)
    local tbOpt = {
        {"Më ho¹t ®éng", QuanLyVA_MoHoatDong},
        {"Tho¸t"}
    }
    CreateNewSayEx(szTitle, tbOpt)
end

function QuanLyVA_MoHoatDong()
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
