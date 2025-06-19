-- Ng­êi qua ®­êng_¤ng chñ ThÈm C©u b¸n ngùa ®Æc biÖt (ngùa cÊp 80) NPC script
-- By Dan_Deng(2003-11-10)
-- Translated by: Anh Quach (2025-06-07)
-- Task ID:
-- 17: gi¸ ngùa - 1000 lµ ­u ®·i cho bang chñ, 1500 lµ ng­êi th­êng
-- 49: mµu ngùa ®· chän. 1 = ¤ V©n §¹p TuyÕt, 2 = XÝch Thè B¶o M·, 3 = TuyÖt ¶nh, 4 = §Ých L«, 5 = ChiÕu D¹ Ngäc S­ Tö
-- 97: mµu ngùa mµ bang chñ ®· mua víi gi¸ ­u ®·i. Cã gi¸ trÞ = 100 + mµu ngùa. TaskID nµy ®­îc set vÜnh viÔn

-- Thªm biÕn global
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
--	if (UWorld97 >= 10) then		-- §· tõng mua
--		Talk(1,"","¤ng chñ: Con nhÊt ®Þnh ph¶i ®èi xö tèt víi L¹p §ç, mçi ngµy ph¶i t¾m röa cho nã, trong chuång ph¶i r¶i tinh mÔ......")
	if (UWorld97 < 100) and (result == 1) and (GetTongFigure() == TONG_MASTER) then			-- Lµ bang chñ, ch­a tõng h­ëng ­u ®·i mua m·
		SetTaskTemp(17,1000)
	else								-- Mua ngùa th«ng th­êng
		SetTaskTemp(17,1500)
--		Talk(1,"","¤ng chñ: Ngùa ngµn dÆm th­êng cã, nh­ng B¸t L¹c kh«ng th­êng cã! Ng­¬i hÇu! ë ®©u!")
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName); end
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "<#><npc>T¹i h¹ nu«i ngùa rÊt nhiÒu n¨m, chØ cÇn xem qua lµ biÕt tèt hay kh«ng!"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	tbDailog:AddOptEntry("Lóc n·y ng­¬i gäi ta?", horse_get);

	tbDailog:Show();
end

function horse_get()
	Talk(4,"sele_color",
		"VÞ anh hïng nµy xin dõng b­íc ®·. ",
		"Huynh ®µi, cã chuyÖn g× cÇn chØ gi¸o? ",
		"T¹i h¹ lµ ThÉm C©u, hiÖn cã mét con ngùa quý, cã thÓ phi ®­îc ngµn dÆm. VÞ anh hïng ®©y phong th¸i bÊt phµm, nhÊt ®Þnh lµ 1 cao thñ. Ngùa quý cña t¹i h¹ kh«ng bao giê chÞu khuÊt phôc kÎ thÊt phu. ",
		"§Ó ta xem thö ngùa quý cña huynh,,, "
	)
	
end

function sele_color()
	Say("Anh hïng h·y xem! ",
		6,
		"§©y kh«ng ph¶i lµ ¤ V©n §¹p TuyÕt sao! /buy_black",
		"§©y kh«ng ph¶i lµ XÝch Thè B¶o M· sao! /buy_red",
		"§©y kh«ng ph¶i lµ TuyÖt ¶nh sao! /buy_cyan",
		"§©y kh«ng ph¶i lµ §Ých L« sao! /buy_yellow",
		"§©y ch¼ng ph¶i lµ ChiÕu D¹ Ngäc S­ Tö sao! /buy_white",
		"§©y lµ ngùa g× vËy? T¹i h¹ hiÓu biÕt cßn kÐm /buy_none"
	)
end

function buy_black()
	-- Set gi¸ tõng lo¹i ngùa kh¸c nhau - By Anh Quach (2025-06-07)
	SetTaskTemp(17,THAM_CAU_O_VAN)
	the_buy(1)
end

function buy_red()
	-- Set gi¸ tõng lo¹i ngùa kh¸c nhau - By Anh Quach (2025-06-07)
	SetTaskTemp(17,THAM_CAU_XICH_THO)
	the_buy(2)
end

function buy_cyan()
	-- Set gi¸ tõng lo¹i ngùa kh¸c nhau - By Anh Quach (2025-06-07)
	SetTaskTemp(17,THAM_CAU_TUYET_ANH)
	the_buy(3)
end

function buy_yellow()
	-- Set gi¸ tõng lo¹i ngùa kh¸c nhau - By Anh Quach (2025-06-07)
	SetTaskTemp(17,THAM_CAU_DICH_LO)
	the_buy(4)
end

function buy_white()
	-- Set gi¸ tõng lo¹i ngùa kh¸c nhau - By Anh Quach (2025-06-07)
	SetTaskTemp(17,THAM_CAU_CHIEU_DA)
	the_buy(5)
end

function buy_none()
	Talk(1,"",
		"NhÊt bang chi chñ, lµ mét nh©n vËt bËc thÇy lµm sao kh«ng biÕt ®©y rèt cuéc lµ ngùa g× chø? Thø lçi, xem ra t¹i h¹ ®· nh×n lÇm ng­êi!"
	)
end

function the_buy(i)
	SetTaskTemp(49,i)
	x = GetTaskTemp(17)
	Say("Kh«ng sai! Ng­êi qu¶ thËt lµ anh hïng. T¹i h¹ vèn ch¼ng muèn b¸n con ngùa nµy ®©u, nh­ng v× ®ang cÇn gÊp "..x.." v¹n l­îng b¹c, v· l¹i nh×n thÊy anh hïng còng thËt sù thÝch nã nªn nÐn lßng mµ b¸n nã cho anh hïng, mong r»ng anh hïng h·y th­¬ng yªu nu«i d­ìng nã ",
	2,
	"kh«ng sao ®©u, ta nhÊt ®Þnh sÏ ®èi xö tèt víi nã mµ /buy_yes",
	"NhÊt thêi lµm sao t×m ra ®­îc sè tiÒn nµy /buy_no"
)
end

function buy_yes()
	x = GetTaskTemp(17)
	if (GetCash() >= x * 10000) then
		i = GetTaskTemp(49)
		if (x == 1000) then			-- Lµ mua víi gi¸ ­u ®·i, g¸n gi¸ trÞ cho biÕn sè, vµ ghi nhí ®· mua ngùa mµu g×
			SetTask(97,100+i)
		end
		Pay(x * 10000)
		AddItem(0,10,5,i,0,0,0)
		Talk(1,"",
			"Ngùa ¬i ngùa! Tõ ®©y vÒ sau ng­¬i h·y ®i theo vÞ anh hïng nµy nhÐ, nhÊt ®Þnh ph¶i ngoan ngo·n ®ã!"
		)
	else
		Talk(1,"",
			"Ta hiÖn giê trong ng­êi kh«ng mang theo ®ñ ng©n l­îng, huynh t¹m thêi cÇm ®ì sè tiÒn nµy vËy!"
		)
	end
end

function buy_no()
	Talk(1,"",
		"Kh«ng lÏ sè tiÒn nµy l¹i lµm khã anh hïng sao"
	)
end
