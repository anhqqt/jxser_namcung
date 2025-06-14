Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\functionlib.lua")
-- Anh Quach
Include("\\script\\global\\anhquach\\gm\\quan_ly_gm.lua")
Include("\\script\\global\\anhquach\\gm\\quan_ly_npc.lua")
Include("\\script\\global\\anhquach\\gm\\quan_ly_hoat_dong.lua")
Include("\\script\\global\\anhquach\\gm\\quan_ly_xep_hang.lua")

CAMNANG_ADMIN = "<#><link=image[0]:\\spr\\item\\Nam.spr>C�m Nang ADMIN: <link>"
if GetSex() == 1 then
    CAMNANG_ADMIN = "<#><link=image[0]:\\spr\\item\\Nu.spr>C�m Nang ADMIN: <link>"
end

function main()
    dofile("script/global/anhquach/item/lenh_bai_gm.lua")

    -- Gi�i t�nh
    local sex = GetSex()
    if sex == 0 then
        sex = "Nam"
    else
        sex = "N�"
    end

    -- M�n ph�i
    local Faction = GetLastFactionNumber();
    local zFaction = "Ch�a gia nh�p m�n ph�i"
    if Faction == 0 then
        zFaction = "Thi�u L�m"
    elseif Faction == 1 then
        zFaction = "Thi�n V��ng Bang"
    elseif Faction == 2 then
        zFaction = "���ng M�n"
    elseif Faction == 3 then
        zFaction = "Ng� ��c"
    elseif Faction == 4 then
        zFaction = "Nga My"
    elseif Faction == 5 then
        zFaction = "Th�y Y�n"
    elseif Faction == 6 then
        zFaction = "C�i Bang"
    elseif Faction == 7 then
        zFaction = "Thi�n Nh�n"
    elseif Faction == 8 then
        zFaction = "V� �ang"
    elseif Faction == 9 then
        zFaction = "C�n L�n"
    elseif Faction == 10 then
        zFaction = "Hoa S�n"
    end

    -- Ng�n l��ng
    local nMoney = (GetBoxMoney()+ GetCash())/10000

    if QuanLyGM_KiemTraGM() == "GM" then
        local szTitle = CAMNANG_ADMIN .. "Xin ch�o ADMIN <color=red>"..GetName().."<color>, s� gi�p �� b�n nh�ng l�c c�n thi�t !<color>\n\n<pic=135> Gi�i T�nh: <color=red>"..sex.."<color>\n<pic=135> M�n Ph�i : <color=yellow>"..zFaction.."<color>\n<pic=135> C�p ��   : <color=red>"..GetLevel().."<color>\n<pic=135> Ti�n V�n : <color=yellow>"..nMoney.."<color> v�n\n<pic=135> Trang Ch�: <color=red>jx.anhquach.dev<color>\n<color=green><pic=137> Ch� � b�o v� s�c kh�e v� t�i s�n khi ch�i Game<pic=115><color>"
        local tbOpt =
        {
            {"Qu�n l� NPC", QuanLyNPC_Say, {szTitle}},
            {"Qu�n l� Ho�t ��ng", QuanLyHD_Say, {szTitle}},
            {"Qu�n l� X�p H�ng", QuanLyXH_Say, {szTitle}},
            {"Tho�t"}
        }
        CreateNewSayEx(szTitle, tbOpt)
        return 1
    elseif QuanLyGM_KiemTraGM() == "MOD" then
        local szTitle = CAMNANG_ADMIN .. "Xin ch�o MOD <color=red>"..GetName().."<color>, s� gi�p �� b�n nh�ng l�c c�n thi�t !<color>\n\n<pic=135> Gi�i T�nh: <color=red>"..sex.."<color>\n<pic=135> M�n Ph�i : <color=yellow>"..zFaction.."<color>\n<pic=135> C�p ��   : <color=red>"..GetLevel().."<color>\n<pic=135> Ti�n V�n : <color=yellow>"..nMoney.."<color> v�n\n<pic=135> Trang Ch�: <color=red>jx.anhquach.dev<color>\n<color=green><pic=137> Ch� � b�o v� s�c kh�e v� t�i s�n khi ch�i Game<pic=115><color>"
        local tbOpt =
        {
            {"Tho�t"}
        }
        CreateNewSayEx(szTitle, tbOpt)
        return 1
    else
        Talk(1,"","Ch� GM ho�c MOD m�i ���c ph�p s� d�ng v�t ph�m n�y!")
        return 0
    end
end
