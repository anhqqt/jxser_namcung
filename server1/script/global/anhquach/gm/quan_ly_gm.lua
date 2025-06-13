Include("\\script\\dailogsys\\dailogsay.lua")

QuanLyGM_tbDanhSachGM = 
{ 
	["matdecha"] =
        { 
            "Administrator"
        }
}

QuanLyGM_tbDanhSachMod = 
{ 
	["matdecha2"] =
        { 
            "Test5Doc"
        }
}

function QuanLyGM_KiemTraGM()
    dofile("script/global/anhquach/gm/quan_ly_gm.lua")
    local szAccount = GetAccount()
    local szName = GetName()

    -- Ki”m tra n’u lµ GM
    local tbRoleListGM = QuanLyGM_tbDanhSachGM[szAccount]
    if tbRoleListGM then
        for i = 1, getn(tbRoleListGM) do
            if tbRoleListGM[i] == szName then
                return "GM"
            end
        end
    end

    -- Ki”m tra n’u lµ MOD
    local tbRoleListMod = QuanLyGM_tbDanhSachMod[szAccount]
    if tbRoleListMod then
        for i = 1, getn(tbRoleListMod) do
            if tbRoleListMod[i] == szName then
                return "MOD"
            end
        end
    end

    -- Kh´ng ph∂i GM ho∆c MOD
    return nil
end
