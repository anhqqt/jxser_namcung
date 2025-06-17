-- ��nh k� g�i th�ng b�o h� th�ng ��n t�t c� Gameserver
function TaskShedule()
    TaskName("THONG BAO TIN TUC TU DONG")
    TaskInterval(20)
    -- TaskTime(0, 0)
    TaskCountLimit(0)
    OutputMsg("=====> [Khoi dong] He thong thong bao tin tuc tu dong")
end

g_strTipMsg = {
    "M�i m�n ph�i c� 2-3 ���ng ph�t tri�n k� n�ng r� r�ng, ��c �i�m c�a m�i ���ng c�ng kh�c nhau.", 
    "Trong tr� ch�i khi ��i tho�i v�i V� binh Th�nh m�n c�a c�c th�nh th� v� �� t� ti�p d�n c�c m�n ph�i � c�c T�n Th� th�n �� hi�u ���c c�c h��ng ph�t tri�n k� n�ng c�a t�ng m�n ph�i v� khu v�c luy�n c�ng th�ch h�p.",
    "Gi�i thi�u kh�i ni�m [ �i�m C�ng K� N�ng ], �u th� c�a nh�ng nh�n v�t c� �i�m k� n�ng cao s� c�ng ���c th� hi�n r�.", 
    "[ �i�m C�ng K� N�ng ] K� n�ng chi�n ��u c�p th�p ��i v�i k� n�ng chi�n ��u c�p cao l� ch� c�ng th�m s�t th��ng c�a k� n�ng c�p cao.", 
    "H� th�ng [ Ng� H�nh T��ng Kh�c ] ho�n to�n m�i, b�t k� m�n ph�i n�o khi PK v�i m�n ph�i b� m�nh kh�c ch� s� c� �u th� r� r�t h�n.",
    -- "Sau ng�y 16 th�ng 7, l�n ��u ti�n ��ng nh�p th� gi�i game, h� th�ng s� t� ��ng �i�u ch�nh k� n�ng c� c�a nh�n v�t th�nh k� n�ng m�i d�a tr�n t�nh tr�ng hi�n c�, v� �i�m k� n�ng s� ���c ho�n tr� v� tr�ng th�i ch�a ph�n b� ban ��u.",
    "[ �� Th�nh Th�o K� N�ng ] ���c n�ng cao b�ng c�ch li�n t�c s� d�ng k� n�ng n�y �� t�n c�ng k� ��ch, kh�ng li�n quan ��n c�p �� c�a k� ��ch v� kinh nghi�m luy�n c�p m� ng��i ch�i nh�n ���c.", 
    -- "Di chuy�n chu�t ��n NPC, c� th� hi�n th� [ Bi�u t��ng thu�c t�nh Ng� H�nh ]",
    "NPC ch� r�t b�o v�t thu�c t�nh Ng� H�nh t��ng �ng, v� d� mu�n c� B�ng Cung, c� th� �i ��nh NPC h� Th�y.", 
    "NPC ch� r�t b�o v�t thu�c t�nh Ng� H�nh t��ng �ng, v� d� mu�n c� trang b� May M�n, c� th� �i ��nh NPC h� M�c.", 
    "Bi�u t��ng thu�c t�nh Ng� H�nh c�a NPC: M�u v�ng - h� Kim; M�u xanh d��ng - h� Th�y; M�u xanh l� c�y - h� M�c; M�u �� - h� H�a; M�u n�u - h� Th�.",
    -- "[ �i�u Ch�nh NPC ] NPC Sa M�c M� Cung kh�ng ch� c� c�p �� cao, kinh nghi�m nhi�u, l�m m�i nhanh, m� c�n r�t b�o v�t g�p hai ��n ba l�n NPC th�ng th��ng.",
    "[ T� ��i ] Kinh nghi�m m� ng��i ch�i ��nh ��n cu�i c�ng nh�n ���c s� l� 1.3 l�n kinh nghi�m c� nh�n.", 
    "[ T� ��i ] Gi� tr� May M�n c�a th�nh vi�n t� ��i s� ���c n�ng cao t��ng �ng d�a tr�n s� l��ng ng��i trong t� ��i.",
    "[ T� ��i ] Gi� tr� May M�n c�a th�nh vi�n t� ��i s� ���c n�ng cao t��ng �ng d�a tr�n s� l��ng ng��i trong t� ��i; thu�c t�nh c�a trang b� r�t ra s� ���c quy�t ��nh d�a tr�n gi� tr� May M�n c�a nh�n v�t ng��i ch�i ��nh ��n cu�i c�ng.", 
    "[ �� Xu�t T� ��i ] Ng��i ch�i c�p cao d�n d�t ng��i ch�i c�p th�p, khi ch�nh l�ch c�p �� tr�n 70 c�p, t�c �� l�n c�p c�a m�i ng��i s� t�ng h�n 20%.",
    "[ Ph�t Ch�t T� ��i ] S� l��ng ng��i trong t� ��i c�ng �t, kinh nghi�m m�t khi ch�t c�ng �t; n�u s� l��ng ng��i trong t� ��i ��t t�m ng��i, sau khi ch�t s� kh�ng m�t kinh nghi�m.", 
    -- "[ ��o Hoa ��o ] Mua B�t Tr� T�u t� �n S� ��o Hoa, k�t h�p v�i linh kh� tr�n ��o, c�ng hi�u th�n k� c�a B�t Tr� T�u s� gi�p b�n tu luy�n d� d�ng.",
    "N�u ph�t hi�n m�nh b� m�t nh�ng k� n�ng �� h�c ���c, h�y h�i s� s� h�c ���c c�c k� n�ng nh� Huy�t Chi�n B�t Ph��ng, V� T��ng Tr�m, Thi�n V��ng Chi�n � (Thi�n V��ng Bang) , c�ng v�i T�m Nh�n v� Thi�n La ��a V�ng (���ng M�n) .",
    "[ T�y T�y ��o ] ch�nh th�c khai m�, ng��i ch�i kh�ng n�m trong danh s�ch tr�ng t� 50 c�p tr� l�n c� [ m�t l�n mi�n ph� ] c� h�i v�o. Sau khi v�o ��o c� th� t�y � t�y [ �i�m ti�m n�ng ] v� [ �i�m k� n�ng ], v� c� th� tr�i nghi�m hi�u qu� c�ng �i�m trong ho�c ngo�i t� ��i tr�n ��o.",
    "C� h�i mi�n ph� v�o [ T�y T�y ��o ] ch� c� m�t l�n. R�i T�y T�y ��o, ph�n b� [ ti�m n�ng/k� n�ng ] c�a b�n s� ���c x�c ��nh ngay l�p t�c, xin h�y suy ngh� k� tr��c khi r�i �i!!!", 
    -- "M�t b� ph�n ng��i ch�i sau khi ho�n th�nh [Nhi�m v� c�p 90] c�a m�n ph�i ch�a th� nh�n ���c k� n�ng, sau khi [h�i s�] v� [Vi�n Quan tho�i nhi�m] L�m An �� ch�nh s�a l�i [183,182]) ",
    -- "M�t b� ph�n ng��i ch�i ���ng M�n sau khi h�c [T� ti�n thu�t. B�o V� L� Hoa] g�p t�nh tr�ng kh�ng th� s� d�ng B�o V� L� Hoa, sau khi tr� v� [h�i s�] l�i ��n [Vi�n quan Tho�i Nhi�m] L�m An �� ch�nh s�a l�i [183,182]) .", 
    -- "M�t b� ph�n ng��i ch�i V� �ang g�p t�nh tr�ng b� m�t �i�m k� n�ng, sau khi v� [h�i s�] ��n [Vi�n Quan Tho�i Nhi�m] l�m An �� ch�nh s�a l�i (L�m An [183,182]) ",
    "[ Tra C�u Danh V�ng ] Xin ��n ch� Th�y S� M�nh [ Tr��ng Thi�t Ch�y ] � c�c th�nh ph� l�n, T��ng D��ng [192,193].", 
    -- "[ V� Kh� �� Ph� ] S� d�ng [ Th�y Tinh ] th�n k� c�a Trung Nguy�n V� L�m, ��i l�y [ V� Kh� �� Ph� ] t� Th�n B� Th��ng Nh�n d� v�c. Sau �� �� [ Thi�t T��ng ] tham chi�u �� ph�, 100% gi�p b�n n�ng c�p v� kh� l�n m�t ��ng c�p.",
    -- "[ V� Kh� �� Ph� ] Th�n B� Th��ng Nh�n d� v�c xu�t hi�n � hai n�i: D��ng Ch�u [207,193] v� L�m An [164,177], ng��i ch�i mu�n ��i �� ph� n�ng c�p v� kh� xin h�y nhanh ch�ng h�nh ��ng.",
    -- "[ Qu�i V�t Danh Lam ] xu�t hi�n ch�n ��ng Ki�m Hi�p (t�n hi�n th� m�u xanh lam), mang theo kh�ng �t ti�n v�ng v� trang b�, c�n c� th� mang theo [ Th�y Tinh ], [ B�o Th�ch Hy H�ng ], [ Trang B� Ho�ng Kim ], [ S�ch K� N�ng ].",
    -- "[ Trang B� Ho�ng Kim ] [ ��nh Qu�c ] [ An Bang ] Ho�ng Kim Trang B� Set Trang B� xu�t hi�n trong Ki�m Hi�p, ��nh [ Qu�i V�t Danh Lam ] l� c� c� h�i nh�n ���c. Tham gia ho�t ��ng �p V�n Ti�u, m�i ng�y c�ng s� ng�u nhi�n r�t m�t m�n.",
    "S� d�ng [ Ti�n Th�o L� ] luy�n c�p trong v�ng 1 gi� s� ���c �i�m kinh nghi�m g�p ��i: S� d�ng [B�ch C�u ho�n] trong v�ng 1 gi� s� ���c [t� ��ng ��nh qu�i]. C�ng n�ng c�a 2 lo�i d��c ph�m n�y s� ���c m� v�o ng�y ",
    "[H� th�ng ph�c duy�n] th�ng qua th�i gian ch�i t�ng d�n �� ��i l�y �i�m ph�c duy�n. D�ng �i�m ph�c duy�n ��n [Th�n b� th��ng nh�n Li�u �t] T��ng D��ng �� ��i l�y c�c lo�i v�t ph�m ��c th�.", 
    "[H� th�ng ph�c duy�n] ��i tho�i v�i [V� L�m truy�n nh�n] � c�c th�nh th� �� bi�t th�ng tin chi ti�t."
    -- "[ Ho�t ��ng Trung Thu ] �n b�nh trung thu, ng�m tr�ng s�ng, v�nh th�, gi�i c�u �� ch�, ho�t ��ng �ang tri�n khai to�n di�n, nhi�u ph�n th��ng �ang ch� ��n b�n! Vui l�ng ��n L� Quan c�c th�nh th� �� h�i th�m chi ti�t.",
}

-- Tin nh�n d� b�o ch�c n�ng m�i
g_nFutureDate = 20040723
STR_HEAD_FUTURE = " [Giang H� truy�n r�ng]"
g_strFutureMsg = {}
function TaskContent()
    str = ""
    nFutureCount = getn(g_strFutureMsg)
    nCount = getn(g_strTipMsg) + nFutureCount
    nIndex = random(1, nCount)
    if (nIndex <= nFutureCount) then -- 1-L�y tin nh�n d� b�o, 2-L�y tin nh�n nh�c nh�
        str = getFutureMsg()
        if (strlen(str) <= 0) then -- N�u kh�ng c� tin nh�n d� b�o, th� l�y tin nh�n nh�c nh�
            str = getTipMsg()
        end
    else
        str = getTipMsg()
    end

    GlobalExecute(format("dw Msg2SubWorld([[%s]])", str))
end

-- L�y tin nh�n nh�c nh�
function getTipMsg()

    nCount = getn(g_strTipMsg)
    nIndex = random(1, nCount)

    return g_strTipMsg[nIndex]
end

-- L�y tin nh�n d� b�o
function getFutureMsg()
    nCurDate = tonumber(date("%Y%m%d"))
    str = ""
    if (g_nFutureDate > nCurDate) then -- C� ph�i tr��c ng�y ch� ��nh, n�u kh�ng th� kh�ng g�i
        nCount = getn(g_strFutureMsg)
        nIndex = random(1, nCount)
        str = STR_HEAD_FUTURE .. (g_strFutureMsg[nIndex])
    end

    return str
end
