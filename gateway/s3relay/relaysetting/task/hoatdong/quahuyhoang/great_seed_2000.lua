Include("\\script\\gb_taskfuncs.lua")
greatseed_configtab = {
	{340,3,100,"\\settings\\maps\\great_night\\Äª¸ß¿ß.txt","M¹c Cao QuËt"},
	{336,3,100,"\\settings\\maps\\great_night\\·çÁê¶É.txt","Phong L¨ng §é"},
	
	{322,2,100,"\\settings\\maps\\great_night\\³¤°×É½±±Â´.txt","Tr­êng B¹ch S¬n B¾c"},
	{321,2,100,"\\settings\\maps\\great_night\\³¤°×É½ÄÏ.txt","Tr­êng B¹ch S¬n Nam"},
	{225,2,30,"\\settings\\maps\\great_night\\É³Ä®É½¶´1.txt","Sa m¹c S¬n §éng 1"},
	{226,2,30,"\\settings\\maps\\great_night\\É³Ä®É½¶´2.txt","Sa m¹c S¬n §éng 2"},
	{227,2,40,"\\settings\\maps\\great_night\\É³Ä®É½¶´3.txt","Sa m¹c S¬n §éng 3"},
	
	{182,1,25,"\\settings\\maps\\great_night\\ÄõÁú¶´ÃÔ¹¬.txt","NghiÖt Long §éng"},
	{167,1,25,"\\settings\\maps\\great_night\\µã²ÔÉ½.txt","§iÓm Th­¬ng S¬n"},	
	{200,1,25,"\\settings\\maps\\great_night\\¹ÅÑô¶´ÃÔ¹¬.txt","Cæ D­¬ng §éng"},
	{92,1,25,"\\settings\\maps\\great_night\\Êñ¸ÔÉ½.txt","Thôc C­¬ng S¬n"},

	{341, 4, 1, "\\settings\\maps\\great_night\\Ä®±±²ÝÔ­.txt","M¹c B¾c Th¶o Nguyªn"},
	{333, 4, 1, "\\settings\\maps\\great_night\\»ªÉ½ÅÉ.txt","Hoa S¬n Ph¸i"},
	{319, 4, 1, "\\settings\\maps\\great_night\\ÁÙÓå¹Ø.txt","L©m Du Quan"},
	{959, 4, 3, "\\settings\\maps\\great_night\\Ë«Áú¶´.txt","ChiÕn Long §éng"},
	{181, 4, 1, "\\settings\\maps\\great_night\\Á½Ë®¶´.txt","L­ìng Thñy §éng"},
}

tblantern_area = {2, 21, 167, 193}

function TaskShedule()
    TaskName("h¹t Huy Hoµng")
    TaskTime(20, 00)
    TaskInterval(5)
    TaskCountLimit(0)
    OutputMsg("=====> [Khoi dong] Qua Huy Hoang 20:00")
end

function TaskContent()
	-- ChØ cã thÓ kÝch ho¹t trong kho¶ng tõ 20:00 ®Õn 20:30
	local START_TIME = 2000
	local END_TIME = 2030
	
	if righttime_add() ~= 1 then -- NÕu thêi gian kh«ng ®óng
		gb_SetTask("Ho¹t ®éng 'Hoa §¨ng'", 1, 0)
		gb_SetTask("h¹t Huy Hoµng", 12, 0)	-- BiÕn sè 12 dïng ®Ó l­u tr÷ sè thø tù cña NPC
		return
	end
	
	AddGlobalCountNews("Tr­íc m¾t lµ thêi gian m­a thuËn giã hßa, ®Ó ®¸p t¹ c«ng søc ®ãng gãp c¸c vÞ ®¹i hiÖp, Vâ l©m minh chñ §éc C« KiÕm ®· tæ chøc ho¹t ®éng <color=yellow>'§ªm huy hoµng'<color>. Thêi gian b¾t ®Çu ho¹t ®éng mçi ngµy lµ 20h00.",1)
	OutputMsg("=====> Qua Huy Hoang 20:00 BAT DAU <====")

	-- Mèc b¶o hiÓm, biÕn sè sÏ ®­îc ®Æt vÒ 0 khi ho¹t ®éng b¾t ®Çu
	local nNowTime = tonumber(date("%H%M"))
	
	-- Khi m¸y chñ ho¹t ®éng b×nh th­êng, mçi ngµy vµo ®óng giê b¾t ®Çu ho¹t ®éng, ë trËn ®Çu tiªn
	if nNowTime >= 2000 and nNowTime < 2005 then	--	
		-- Sè thø tù NPC = Thø tù cña NPC + Ngµy (4); dïng ®Ó x¸c minh NPC ®­îc nhÊp cã ph¶i lµ lo¹i qu¶ thùc cã thÓ h¸i hay kh«ng
		gb_SetTask("h¹t Huy Hoµng", 12, 0)	-- BiÕn sè 12 dïng ®Ó l­u tr÷ sè thø tù cña NPC
	end
	--------------------
	--
	--------------------
	-- KiÓm tra lµ ®ît 5 phót thø mÊy, tøc lµ ®ît thø mÊy
	-- Khi thùc hiÖn, dùa vµo tÝnh ch½n lÎ cña ®ît ®Ó x¸c ®Þnh lµ h¹t gièng hay qu¶ thùc
	local nBatch = floor(mod(nNowTime,100)/5) + 1
	--
	local nMapCount = getn(greatseed_configtab)
	----- 
	--
	-----
	for i = 1, nMapCount do
		local strExecute = format("dw Global_GreatSeedExecute(%d, %d, %d, [[%s]], [[%s]],%d)", greatseed_configtab[i][1], greatseed_configtab[i][2], greatseed_configtab[i][3], greatseed_configtab[i][4],greatseed_configtab[i][5],nBatch)
		GlobalExecute(strExecute)
		local szMsg = ""
		if (mod(nBatch,2) == 1) and greatseed_configtab[i][2] ~= 4 then
			szMsg = "H¹t Huy Hoµng"
		elseif greatseed_configtab[i][2] == 4 then
			szMsg = "H¹t Hoµng Kim"
		elseif (mod(nBatch,2) == 0) and greatseed_configtab[i][2] ~= 4 then
			szMsg = "Qu¶ Huy Hoµng"
		elseif greatseed_configtab[i][2] == 4 then
			szMsg = "Qu¶ Hoµng Kim"
		end 
		if (mod(nBatch,2) == 1) then
			szMsg = format("Tr­íc m¾t lµ thêi gian m­a thuËn giã hßa, Vâ l©m minh chñ §éc C« KiÕm ®· gieo <%s> t¹i %s, 5 phót sau c¸c §¹i HiÖp cã thÓ thu ho¹ch!!",
			szMsg,
			greatseed_configtab[i][5])
			GlobalExecute(format("dw AddLocalNews([[%s]])",szMsg))
		elseif (mod(nBatch,2) == 0) then
			szMsg = format("GÆp thêi tiÕt thuËn lîi <%s> ®· kÕt tr¸i t¹i %s, C¸c §¹i HiÖp h·y nhanh chãng thu ho¹ch!!",
			szMsg,
			greatseed_configtab[i][5])
			GlobalExecute(format("dw AddLocalNews([[%s]])",szMsg))
		end
	end
end

function CreateLantern(nDate)
	-- TaskID = 1: chøa map t¹o hoa ®¨ng
	-- TaskID = 2: ngµy hiÖn t¹i cña ho¹t ®éng, t­¬ng tù ho¹t ®éng Hoµng chi ch­¬ng - §ªm Huy Hoµng
    if (gb_GetTask("Ho¹t ®éng 'Hoa §¨ng'", 2) == 0 or gb_GetTask("Ho¹t ®éng 'Hoa §¨ng'", 2) ~= nDate) then
        lantern_area = tblantern_area[random(getn(tblantern_area))]
        gb_SetTask("Ho¹t ®éng 'Hoa §¨ng'", 1, lantern_area)
        gb_SetTask("Ho¹t ®éng 'Hoa §¨ng'", 2, nDate)
    end
    GlobalExecute("dw GN_Create_Lanterns()")
end

-- LLG_ALLINONE_TODO_20070802
--
function righttime_add()
	local nTime = tonumber(date("%H%M"))
	if (nTime >= 2000 and nTime < 2030)  then
		return 1
	end
	return 0
end

function goldenseedmap()	-- NgÉu nhiªn xuÊt hiÖn mét lÇn h¹t gièng Hoµng Kim trªn b¶n ®å; 1 §¹i Lý, 2 D­¬ng Ch©u;
	local goldcity = random(1, 2)
	-- TaskID = 1: chøa thµnh phè mµ h¹t huy hoµng sÏ ®­îc t¹o
	-- Value = 1 lµ §¹i Lý, 2 lµ D­¬ng Ch©u
	gb_SetTask("h¹t Huy Hoµng", 1, goldcity)
	local RowIndex = random(2, 41)
	-- TaskID = 2: chøa hµng cÇn lÊy trong file map ®Ó cã ®­îc täa ®é t¹o h¹t huy hoµng
	-- Dù ®o¸n file map n»m ë:
	-- server1\settings\maps\great_night\´óÀí±±ÃÅ.txt (D­¬ng Ch©u)
	-- server1\settings\maps\great_night\ÑïÖÝ¶«ÃÅ.txt (§¹i Lý)
	gb_SetTask("h¹t Huy Hoµng", 2, RowIndex)
	OutputMsg("HUY HOANG THANH THI " .. goldcity)
	OutputMsg("goldenseedmap()" .. RowIndex)
	return goldcity
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
