Include("\\script\\dailogsys\\dailogsay.lua")
IncludeLib("RELAYLADDER");

function QuanLyXH_Say(szTitle)
    dofile("script/global/anhquach/gm/quan_ly_xep_hang.lua")

    local tbOpt = {
        {"Xãa b¶ng XÕp H¹ng", QuanLyXH_XoaBXHTheoIDSay},
        {"Xãa tÊt c¶ b¶ng XÕp H¹ng", QuanLyXH_XoaTatCaBXH},
        {"Tho¸t"}
    }
    CreateNewSayEx(szTitle, tbOpt)
end

function QuanLyXH_XoaBXHTheoIDSay()
    g_AskClientNumberEx(10001, 10300, "<#>NhËp ID b¶ng XÕp H¹ng", {QuanLyXH_XoaBXHTheoID, {nID}})
end

function QuanLyXH_XoaBXHTheoID(nID)
	Ladder_ClearLadder(nID)
    Msg2Player("<color=yellow>Xãa b¶ng XÕp H¹ng <color=green>" .. nID .. "<color> thµnh c«ng<color>")
end

function QuanLyXH_XoaTatCaBXH()
	for i=10001,10300 do
		Ladder_ClearLadder(i)
	end
    Msg2Player("<color=yellow>Xãa tÊt c¶ b¶ng XÕp H¹ng thµnh c«ng<color>")
end