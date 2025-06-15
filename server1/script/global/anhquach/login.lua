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
    -- Talk(1, "", "Chµo mõng b¹n ®Õn víi thÕ giíi Vâ L©m")
    
    -- Skill Phôc håi + bÊt tö
    SetProtectTime(18 * 3)
    AddSkillState(963, 1, 0, 18 * 3)
    
    -- L­u th«ng tin nh©n vËt
    logplayer("dulieu/thongtintaikhoan-nhanvat.txt",
              format("[IP : %s ] - Thêi gian : %s  - Tµi kho¶n [ %s] - Nh©n vËt : [%s ] ®¨ng nhËp thµnh c«ng ! ",
                     GetIP(), GetLocalDate("%m/%d/%Y_%H:%M:%S"), GetAccount(), GetName()))

    	
    -- L­u danh s¸ch qu¶n lý GM
    tbGMJX:KickYourAss(GetAccount());
    tbGMJX:GetInfoPlayer(GetAccount());
    tbGMJX:KickVinhVien(GetAccount());
end

if login_add then login_add(AnhQuach_Login, 0) end