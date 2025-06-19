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

    -- CÊp ®é khi vµo server
    if GetLevel() < LEVEL_KHOI_TAO_NHAN_VAT then
        local nCurLevel = GetLevel()
        local nAddLevel = LEVEL_KHOI_TAO_NHAN_VAT - nCurLevel
        ST_LevelUp(nAddLevel)
    end

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