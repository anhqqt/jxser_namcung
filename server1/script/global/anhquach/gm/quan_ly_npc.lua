Include("\\script\\dailogsys\\dailogsay.lua")

function QuanLyNPC_Say(szTitle)
    dofile("script/global/anhquach/gm/quan_ly_npc.lua")

    local tbOpt = {
        {"Th�m NPC", QuanLyNPC_ThemNPC},
        {"X�a NPC", QuanLyNPC_XoaNPC},
        {"Tho�t"}
    }
    CreateNewSayEx(szTitle, tbOpt)
end

function QuanLyNPC_ThemNPC()
    g_AskClientNumberEx(1, 2000, "<#>Nh�p ID NPC", {QuanLyNPC_ThemNPCTheoID, {nID}})
end

function QuanLyNPC_ThemNPCTheoID(nID)
	local nw,nx,ny = GetWorldPos()
	local index = AddNpcEx(nID,80,4,SubWorldID2Idx(nw),nx*32,ny*32,1,nID,1)
    Msg2Player("Th�m NPC <color=green>" .. nID .. "<color> th�nh c�ng")
end

function QuanLyNPC_XoaNPC()
    g_AskClientNumberEx(1, 2000, "<#>Nh�p ID NPC", {QuanLyNPC_XoaNPCTheoID, {nID}})
end

function QuanLyNPC_XoaNPCTheoID(nID)
    local w,x,y = GetWorldPos()
    local nIdPlay = PlayerIndex
    ClearMapNpcWithName(w,nID)
    Msg2Player("X�a NPC <color=green>" .. nID .. "<color> th�nh c�ng")
end