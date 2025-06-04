Include("\\script\\lib\\remoteexc.lua")

function KDTongKim()
	local tbSay = {"<dec>Mêi GM tr·i nghiÖm chøc n¨ng trong game"};
		tinsert(tbSay, "GM - B¾t ®Çu b¸o danh/BaoDanhTK")
		tinsert(tbSay, "§ãng./no");
	CreateTaskSay(tbSay);
end

function BaoDanhTK()--frank script
Msg2Player("<color=green>NhËp Sè 1 Lµ Më S¬ CÊp<color>")
Msg2Player("<color=green>NhËp Sè 2 Lµ Më Trung CÊp<color>")
Msg2Player("<color=green>NhËp Sè 3 Lµ Më Cao CÊp<color>")
g_AskClientNumberEx(1, 3, "Lo¹i Tèng Kim:", {Gm_Call_Battles_Now, {nNum}})
end