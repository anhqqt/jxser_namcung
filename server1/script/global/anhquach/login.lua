IncludeLib("TIMER")
Include("\\script\\global\\login_head.lua")
-- Anh Quach
Include("\\script\\global\\anhquach\\lib.lua")
Include("\\script\\global\\anhquach\\env.lua")
-- Nam Cung
Include("\\script\\global\\namcung\\gmquanlyserver\\gmroleitem_player.lua")


-- ================================================================
function AnhQuach_Login()
    dofile("script/global/anhquach/login.lua")

    -- C�p �� khi v�o server
    if GetLevel() < LEVEL_KHOI_TAO_NHAN_VAT then
        local nCurLevel = GetLevel()
        local nAddLevel = LEVEL_KHOI_TAO_NHAN_VAT - nCurLevel
        ST_LevelUp(nAddLevel)
    end

    -- Skill Ph�c h�i + b�t t�
    SetProtectTime(18 * 3)
    AddSkillState(963, 1, 0, 18 * 3)
    
    -- L�u th�ng tin nh�n v�t
    logplayer("dulieu/thongtintaikhoan-nhanvat.txt",
              format("[IP : %s ] - Th�i gian : %s  - T�i kho�n [ %s] - Nh�n v�t : [%s ] ��ng nh�p th�nh c�ng ! ",
                     GetIP(), GetLocalDate("%m/%d/%Y_%H:%M:%S"), GetAccount(), GetName()))

    	
    -- L�u danh s�ch qu�n l� GM
    tbGMJX:KickYourAss(GetAccount());
    tbGMJX:GetInfoPlayer(GetAccount());
    tbGMJX:KickVinhVien(GetAccount());
end

if login_add then login_add(AnhQuach_Login, 0) end