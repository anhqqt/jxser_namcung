Include("\\script\\gb_taskfuncs.lua")
greatseed_configtab = {
	{340,3,100,"\\settings\\maps\\great_night\\Ī�߿�.txt","M�c Cao Qu�t"},
	{336,3,100,"\\settings\\maps\\great_night\\�����.txt","Phong L�ng ��"},
	
	{322,2,100,"\\settings\\maps\\great_night\\����ɽ��´.txt","Tr��ng B�ch S�n B�c"},
	{321,2,100,"\\settings\\maps\\great_night\\����ɽ��.txt","Tr��ng B�ch S�n Nam"},
	{225,2,30,"\\settings\\maps\\great_night\\ɳĮɽ��1.txt","Sa m�c S�n ��ng 1"},
	{226,2,30,"\\settings\\maps\\great_night\\ɳĮɽ��2.txt","Sa m�c S�n ��ng 2"},
	{227,2,40,"\\settings\\maps\\great_night\\ɳĮɽ��3.txt","Sa m�c S�n ��ng 3"},
	
	{182,1,25,"\\settings\\maps\\great_night\\�������Թ�.txt","Nghi�t Long ��ng"},
	{167,1,25,"\\settings\\maps\\great_night\\���ɽ.txt","�i�m Th��ng S�n"},	
	{200,1,25,"\\settings\\maps\\great_night\\�������Թ�.txt","C� D��ng ��ng"},
	{92,1,25,"\\settings\\maps\\great_night\\���ɽ.txt","Th�c C��ng S�n"},

	{341, 4, 1, "\\settings\\maps\\great_night\\Į����ԭ.txt","M�c B�c Th�o Nguy�n"},
	{333, 4, 1, "\\settings\\maps\\great_night\\��ɽ��.txt","Hoa S�n Ph�i"},
	{319, 4, 1, "\\settings\\maps\\great_night\\�����.txt","L�m Du Quan"},
	{959, 4, 3, "\\settings\\maps\\great_night\\˫����.txt","Chi�n Long ��ng"},
	{181, 4, 1, "\\settings\\maps\\great_night\\��ˮ��.txt","L��ng Th�y ��ng"},
}

tblantern_area = {2, 21, 167, 193}

function TaskShedule()
    TaskName("h�t Huy Ho�ng")
    TaskTime(20, 00)
    TaskInterval(5)
    TaskCountLimit(0)
    OutputMsg("=====> [Khoi dong] Qua Huy Hoang 20:00")
end

function TaskContent()
	-- Ch� c� th� k�ch ho�t trong kho�ng t� 20:00 ��n 20:30
	local START_TIME = 2000
	local END_TIME = 2030
	
	if righttime_add() ~= 1 then -- N�u th�i gian kh�ng ��ng
		gb_SetTask("Ho�t ��ng 'Hoa ��ng'", 1, 0)
		gb_SetTask("h�t Huy Ho�ng", 12, 0)	-- Bi�n s� 12 d�ng �� l�u tr� s� th� t� c�a NPC
		return
	end
	
	AddGlobalCountNews("Tr��c m�t l� th�i gian m�a thu�n gi� h�a, �� ��p t� c�ng s�c ��ng g�p c�c v� ��i hi�p, V� l�m minh ch� ��c C� Ki�m �� t� ch�c ho�t ��ng <color=yellow>'��m huy ho�ng'<color>. Th�i gian b�t ��u ho�t ��ng m�i ng�y l� 20h00.",1)
	OutputMsg("=====> Qua Huy Hoang 20:00 BAT DAU <====")

	-- M�c b�o hi�m, bi�n s� s� ���c ��t v� 0 khi ho�t ��ng b�t ��u
	local nNowTime = tonumber(date("%H%M"))
	
	-- Khi m�y ch� ho�t ��ng b�nh th��ng, m�i ng�y v�o ��ng gi� b�t ��u ho�t ��ng, � tr�n ��u ti�n
	if nNowTime >= 2000 and nNowTime < 2005 then	--	
		-- S� th� t� NPC = Th� t� c�a NPC + Ng�y (4); d�ng �� x�c minh NPC ���c nh�p c� ph�i l� lo�i qu� th�c c� th� h�i hay kh�ng
		gb_SetTask("h�t Huy Ho�ng", 12, 0)	-- Bi�n s� 12 d�ng �� l�u tr� s� th� t� c�a NPC
	end
	--------------------
	--
	--------------------
	-- Ki�m tra l� ��t 5 ph�t th� m�y, t�c l� ��t th� m�y
	-- Khi th�c hi�n, d�a v�o t�nh ch�n l� c�a ��t �� x�c ��nh l� h�t gi�ng hay qu� th�c
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
			szMsg = "H�t Huy Ho�ng"
		elseif greatseed_configtab[i][2] == 4 then
			szMsg = "H�t Ho�ng Kim"
		elseif (mod(nBatch,2) == 0) and greatseed_configtab[i][2] ~= 4 then
			szMsg = "Qu� Huy Ho�ng"
		elseif greatseed_configtab[i][2] == 4 then
			szMsg = "Qu� Ho�ng Kim"
		end 
		if (mod(nBatch,2) == 1) then
			szMsg = format("Tr��c m�t l� th�i gian m�a thu�n gi� h�a, V� l�m minh ch� ��c C� Ki�m �� gieo <%s> t�i %s, 5 ph�t sau c�c ��i Hi�p c� th� thu ho�ch!!",
			szMsg,
			greatseed_configtab[i][5])
			GlobalExecute(format("dw AddLocalNews([[%s]])",szMsg))
		elseif (mod(nBatch,2) == 0) then
			szMsg = format("G�p th�i ti�t thu�n l�i <%s> �� k�t tr�i t�i %s, C�c ��i Hi�p h�y nhanh ch�ng thu ho�ch!!",
			szMsg,
			greatseed_configtab[i][5])
			GlobalExecute(format("dw AddLocalNews([[%s]])",szMsg))
		end
	end
end

function CreateLantern(nDate)
	-- TaskID = 1: ch�a map t�o hoa ��ng
	-- TaskID = 2: ng�y hi�n t�i c�a ho�t ��ng, t��ng t� ho�t ��ng Ho�ng chi ch��ng - ��m Huy Ho�ng
    if (gb_GetTask("Ho�t ��ng 'Hoa ��ng'", 2) == 0 or gb_GetTask("Ho�t ��ng 'Hoa ��ng'", 2) ~= nDate) then
        lantern_area = tblantern_area[random(getn(tblantern_area))]
        gb_SetTask("Ho�t ��ng 'Hoa ��ng'", 1, lantern_area)
        gb_SetTask("Ho�t ��ng 'Hoa ��ng'", 2, nDate)
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

function goldenseedmap()	-- Ng�u nhi�n xu�t hi�n m�t l�n h�t gi�ng Ho�ng Kim tr�n b�n ��; 1 ��i L�, 2 D��ng Ch�u;
	local goldcity = random(1, 2)
	-- TaskID = 1: ch�a th�nh ph� m� h�t huy ho�ng s� ���c t�o
	-- Value = 1 l� ��i L�, 2 l� D��ng Ch�u
	gb_SetTask("h�t Huy Ho�ng", 1, goldcity)
	local RowIndex = random(2, 41)
	-- TaskID = 2: ch�a h�ng c�n l�y trong file map �� c� ���c t�a �� t�o h�t huy ho�ng
	-- D� �o�n file map n�m �:
	-- server1\settings\maps\great_night\������.txt (D��ng Ch�u)
	-- server1\settings\maps\great_night\���ݶ���.txt (��i L�)
	gb_SetTask("h�t Huy Ho�ng", 2, RowIndex)
	OutputMsg("HUY HOANG THANH THI " .. goldcity)
	OutputMsg("goldenseedmap()" .. RowIndex)
	return goldcity
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
