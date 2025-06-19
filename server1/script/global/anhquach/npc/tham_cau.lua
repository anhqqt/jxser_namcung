-- Ng��i qua ���ng_�ng ch� Th�m C�u b�n ng�a ��c bi�t (ng�a c�p 80) NPC script
-- By Dan_Deng(2003-11-10)
-- Translated by: Anh Quach (2025-06-07)
-- Task ID:
-- 17: gi� ng�a - 1000 l� �u ��i cho bang ch�, 1500 l� ng��i th��ng
-- 49: m�u ng�a �� ch�n. 1 = � V�n ��p Tuy�t, 2 = X�ch Th� B�o M�, 3 = Tuy�t �nh, 4 = ��ch L�, 5 = Chi�u D� Ng�c S� T�
-- 97: m�u ng�a m� bang ch� �� mua v�i gi� �u ��i. C� gi� tr� = 100 + m�u ng�a. TaskID n�y ���c set v�nh vi�n

-- Th�m bi�n global
Include("\\script\\global\\anhquach\\env.lua")
--
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")

function main()
	UWorld97 = GetTask(97)
	str, result = GetTong()
--	if (UWorld97 >= 10) then		-- �� t�ng mua
--		Talk(1,"","�ng ch�: Con nh�t ��nh ph�i ��i x� t�t v�i L�p ��, m�i ng�y ph�i t�m r�a cho n�, trong chu�ng ph�i r�i tinh m�......")
	if (UWorld97 < 100) and (result == 1) and (GetTongFigure() == TONG_MASTER) then			-- L� bang ch�, ch�a t�ng h��ng �u ��i mua m�
		SetTaskTemp(17,1000)
	else								-- Mua ng�a th�ng th��ng
		SetTaskTemp(17,1500)
--		Talk(1,"","�ng ch�: Ng�a ng�n d�m th��ng c�, nh�ng B�t L�c kh�ng th��ng c�! Ng��i h�u! � ��u!")
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName); end
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "<#><npc>T�i h� nu�i ng�a r�t nhi�u n�m, ch� c�n xem qua l� bi�t t�t hay kh�ng!"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	tbDailog:AddOptEntry("L�c n�y ng��i g�i ta?", horse_get);

	tbDailog:Show();
end

function horse_get()
	Talk(4,"sele_color",
		"V� anh h�ng n�y xin d�ng b��c ��. ",
		"Huynh ��i, c� chuy�n g� c�n ch� gi�o? ",
		"T�i h� l� Th�m C�u, hi�n c� m�t con ng�a qu�, c� th� phi ���c ng�n d�m. V� anh h�ng ��y phong th�i b�t ph�m, nh�t ��nh l� 1 cao th�. Ng�a qu� c�a t�i h� kh�ng bao gi� ch�u khu�t ph�c k� th�t phu. ",
		"�� ta xem th� ng�a qu� c�a huynh,,, "
	)
	
end

function sele_color()
	Say("Anh h�ng h�y xem! ",
		6,
		"��y kh�ng ph�i l� � V�n ��p Tuy�t sao! /buy_black",
		"��y kh�ng ph�i l� X�ch Th� B�o M� sao! /buy_red",
		"��y kh�ng ph�i l� Tuy�t �nh sao! /buy_cyan",
		"��y kh�ng ph�i l� ��ch L� sao! /buy_yellow",
		"��y ch�ng ph�i l� Chi�u D� Ng�c S� T� sao! /buy_white",
		"��y l� ng�a g� v�y? T�i h� hi�u bi�t c�n k�m /buy_none"
	)
end

function buy_black()
	-- Set gi� t�ng lo�i ng�a kh�c nhau - By Anh Quach (2025-06-07)
	SetTaskTemp(17,THAM_CAU_O_VAN)
	the_buy(1)
end

function buy_red()
	-- Set gi� t�ng lo�i ng�a kh�c nhau - By Anh Quach (2025-06-07)
	SetTaskTemp(17,THAM_CAU_XICH_THO)
	the_buy(2)
end

function buy_cyan()
	-- Set gi� t�ng lo�i ng�a kh�c nhau - By Anh Quach (2025-06-07)
	SetTaskTemp(17,THAM_CAU_TUYET_ANH)
	the_buy(3)
end

function buy_yellow()
	-- Set gi� t�ng lo�i ng�a kh�c nhau - By Anh Quach (2025-06-07)
	SetTaskTemp(17,THAM_CAU_DICH_LO)
	the_buy(4)
end

function buy_white()
	-- Set gi� t�ng lo�i ng�a kh�c nhau - By Anh Quach (2025-06-07)
	SetTaskTemp(17,THAM_CAU_CHIEU_DA)
	the_buy(5)
end

function buy_none()
	Talk(1,"",
		"Nh�t bang chi ch�, l� m�t nh�n v�t b�c th�y l�m sao kh�ng bi�t ��y r�t cu�c l� ng�a g� ch�? Th� l�i, xem ra t�i h� �� nh�n l�m ng��i!"
	)
end

function the_buy(i)
	SetTaskTemp(49,i)
	x = GetTaskTemp(17)
	Say("Kh�ng sai! Ng��i qu� th�t l� anh h�ng. T�i h� v�n ch�ng mu�n b�n con ng�a n�y ��u, nh�ng v� �ang c�n g�p "..x.." v�n l��ng b�c, v� l�i nh�n th�y anh h�ng c�ng th�t s� th�ch n� n�n n�n l�ng m� b�n n� cho anh h�ng, mong r�ng anh h�ng h�y th��ng y�u nu�i d��ng n� ",
	2,
	"kh�ng sao ��u, ta nh�t ��nh s� ��i x� t�t v�i n� m� /buy_yes",
	"Nh�t th�i l�m sao t�m ra ���c s� ti�n n�y /buy_no"
)
end

function buy_yes()
	x = GetTaskTemp(17)
	if (GetCash() >= x * 10000) then
		i = GetTaskTemp(49)
		if (x == 1000) then			-- L� mua v�i gi� �u ��i, g�n gi� tr� cho bi�n s�, v� ghi nh� �� mua ng�a m�u g�
			SetTask(97,100+i)
		end
		Pay(x * 10000)
		AddItem(0,10,5,i,0,0,0)
		Talk(1,"",
			"Ng�a �i ng�a! T� ��y v� sau ng��i h�y �i theo v� anh h�ng n�y nh�, nh�t ��nh ph�i ngoan ngo�n ��!"
		)
	else
		Talk(1,"",
			"Ta hi�n gi� trong ng��i kh�ng mang theo �� ng�n l��ng, huynh t�m th�i c�m �� s� ti�n n�y v�y!"
		)
	end
end

function buy_no()
	Talk(1,"",
		"Kh�ng l� s� ti�n n�y l�i l�m kh� anh h�ng sao"
	)
end
