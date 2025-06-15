IncludeLib("TIMER")
Include("\\script\\global\\login_head.lua")
-- Anh Quach
Include("\\script\\global\\anhquach\\lib.lua")
-- Nam Cung
Include("\\script\\global\\namcung\\gmquanlyserver\\gmroleitem_player.lua")

-- ================================================================
function AnhQuach_Login()
    dofile("script/global/anhquach/login.lua")

    -- Say
    -- Talk(1, "", "Ch�o m�ng b�n ��n v�i th� gi�i V� L�m")
    
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