Include("\\script\\dailogsys\\dailogsay.lua")
IncludeLib("RELAYLADDER");

function QuanLyXH_Say(szTitle)
    dofile("script/global/anhquach/gm/quan_ly_xep_hang.lua")

    local tbOpt = {
        {"X�a b�ng X�p H�ng", QuanLyXH_XoaBXHTheoIDSay},
        {"X�a t�t c� b�ng X�p H�ng", QuanLyXH_XoaTatCaBXH},
        {"Tho�t"}
    }
    CreateNewSayEx(szTitle, tbOpt)
end

function QuanLyXH_XoaBXHTheoIDSay()
    g_AskClientNumberEx(10001, 10300, "<#>Nh�p ID b�ng X�p H�ng", {QuanLyXH_XoaBXHTheoID, {nID}})
end

function QuanLyXH_XoaBXHTheoID(nID)
	Ladder_ClearLadder(nID)
    Msg2Player("<color=yellow>X�a b�ng X�p H�ng <color=green>" .. nID .. "<color> th�nh c�ng<color>")
end

function QuanLyXH_XoaTatCaBXH()
	for i=10001,10300 do
		Ladder_ClearLadder(i)
	end
    Msg2Player("<color=yellow>X�a t�t c� b�ng X�p H�ng th�nh c�ng<color>")
end