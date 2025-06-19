Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\functionlib.lua")
-- Anh Quach
Include("\\script\\global\\anhquach\\gm\\quan_ly_gm.lua")
Include("\\script\\global\\anhquach\\gm\\quan_ly_npc.lua")
Include("\\script\\global\\anhquach\\gm\\quan_ly_hoat_dong.lua")
Include("\\script\\global\\anhquach\\gm\\quan_ly_xep_hang.lua")

CAMNANG_ADMIN = "<#><link=image[0]:\\spr\\item\\Nam.spr>CÈm Nang ADMIN: <link>"
if GetSex() == 1 then
    CAMNANG_ADMIN = "<#><link=image[0]:\\spr\\item\\Nu.spr>CÈm Nang ADMIN: <link>"
end

function main()
    dofile("script/global/anhquach/item/lenh_bai_gm.lua")

    -- Giíi tÝnh
    local sex = GetSex()
    if sex == 0 then
        sex = "Nam"
    else
        sex = "N÷"
    end

    -- M«n ph¸i
    local Faction = GetLastFactionNumber();
    local zFaction = "Ch­a gia nhËp m«n ph¸i"
    if Faction == 0 then
        zFaction = "ThiÕu L©m"
    elseif Faction == 1 then
        zFaction = "Thiªn V­¬ng Bang"
    elseif Faction == 2 then
        zFaction = "§­êng M«n"
    elseif Faction == 3 then
        zFaction = "Ngò §éc"
    elseif Faction == 4 then
        zFaction = "Nga My"
    elseif Faction == 5 then
        zFaction = "Thóy Yªn"
    elseif Faction == 6 then
        zFaction = "C¸i Bang"
    elseif Faction == 7 then
        zFaction = "Thiªn NhÉn"
    elseif Faction == 8 then
        zFaction = "Vâ §ang"
    elseif Faction == 9 then
        zFaction = "C«n L«n"
    elseif Faction == 10 then
        zFaction = "Hoa S¬n"
    end

    -- Ng©n l­îng
    local nMoney = (GetBoxMoney()+ GetCash())/10000

    if QuanLyGM_KiemTraGM() == "GM" then
        local szTitle = CAMNANG_ADMIN .. "Xin chµo ADMIN <color=red>"..GetName().."<color>, sÏ gióp ®ì b¹n nh­ng lóc cÇn thiÕt !<color>\n\n<pic=135> Giíi TÝnh: <color=red>"..sex.."<color>\n<pic=135> M«n Ph¸i : <color=yellow>"..zFaction.."<color>\n<pic=135> CÊp §é   : <color=red>"..GetLevel().."<color>\n<pic=135> TiÒn V¹n : <color=yellow>"..nMoney.."<color> v¹n\n<pic=135> Trang Chñ: <color=red>jx.anhquach.dev<color>\n<color=green><pic=137> Chó ý b¶o vÖ søc kháe vµ tµi s¶n khi ch¬i Game<pic=115><color>"
        local tbOpt =
        {
            {"Qu¶n lý NPC", QuanLyNPC_Say, {szTitle}},
            {"Qu¶n lý Ho¹t §éng", QuanLyHD_Say, {szTitle}},
            {"Qu¶n lý XÕp H¹ng", QuanLyXH_Say, {szTitle}},
            {"Tho¸t"}
        }
        CreateNewSayEx(szTitle, tbOpt)
        return 1
    elseif QuanLyGM_KiemTraGM() == "MOD" then
        local szTitle = CAMNANG_ADMIN .. "Xin chµo MOD <color=red>"..GetName().."<color>, sÏ gióp ®ì b¹n nh­ng lóc cÇn thiÕt !<color>\n\n<pic=135> Giíi TÝnh: <color=red>"..sex.."<color>\n<pic=135> M«n Ph¸i : <color=yellow>"..zFaction.."<color>\n<pic=135> CÊp §é   : <color=red>"..GetLevel().."<color>\n<pic=135> TiÒn V¹n : <color=yellow>"..nMoney.."<color> v¹n\n<pic=135> Trang Chñ: <color=red>jx.anhquach.dev<color>\n<color=green><pic=137> Chó ý b¶o vÖ søc kháe vµ tµi s¶n khi ch¬i Game<pic=115><color>"
        local tbOpt =
        {
            {"Tho¸t"}
        }
        CreateNewSayEx(szTitle, tbOpt)
        return 1
    else
        Talk(1,"","ChØ GM hoÆc MOD míi ®­îc phÐp sö dông vËt phÈm nµy!")
        return 0
    end
end
