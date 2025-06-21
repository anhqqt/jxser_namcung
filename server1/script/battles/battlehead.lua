-- Th�m bi�n global
Include("\\script\\global\\anhquach\\env.lua")
--
IncludeLib("FILESYS");
IncludeLib("TITLE");
IncludeLib("SETTING");
Include("\\script\\event\\storm\\function.lua")	--Storm
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")	--HUANGZHIZHANG
Include("\\script\\missions\\boss\\bigboss.lua")	-- big boss
Include("\\script\\battles\\lang.lua")
Include("\\script\\lib\\common.lua");
Include("\\script\\battles\\battle_rank_award.lua")



Include("\\script\\bonusvlmc\\head.lua");
Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\head.lua");

Include("\\script\\battles\\doubleexp.lua")
FRAME2TIME = 18;									-- 18 khung h�nh th�i gian game t��ng ���ng 1 ph�t
BAOMING_TIME = TONG_KIM_THOI_GIAN_BAO_DANH			-- Th�i gian b�o danh
FIGHTING_TIME = TONG_KIM_THOI_GIAN_CHIEN_DAU		-- Th�i gian giao chi�n
ANNOUNCE_TIME = TONG_KIM_THOI_GIAN_CHIEN_BAO		-- C�ng b� chi�n b�o sau 20 ph�t

TIMER_1 = ANNOUNCE_TIME * FRAME2TIME; -- 20 ph�t c�ng b� Chi�n b�o
TIMER_2 = (FIGHTING_TIME + BAOMING_TIME) * 60  * FRAME2TIME; -- Th�i gian giao chi�n l� 1 gi�
RUNGAME_TIME = BAOMING_TIME * 60 * FRAME2TIME / TIMER_1; -- Sau khi b�o danh 10 ph�t, t� ��ng v�o giai �o�n chi�n ��u
GO_TIME =  BAOMING_TIME * 60 * FRAME2TIME  / TIMER_1; -- Th�i gian b�o danh l� 10 ph�t

SONGJIN_SIGNUP_FEES = TONG_KIM_PHI_BAO_DANH  -- Ph� b�o danh

JUNGONGPAI = 1773 -- ID Nguy�n so�i T�ng Kim: 6, 1, 1477
EXPIRED_TIME = 24*60  -- Nguy�n so�i T�ng Kim qu� h�n
JUNGONGPAI_Task_ID = 1830 -- Bi�n nhi�m v� Nguy�n so�i T�ng Kim

TIME_GAME_LIMIT = 5 * 60	-- Th�i gian ng��i ch�i c� th� � l�i H�u Doanh, n�u qu� th�i gian s� tho�t kh�i chi�n tr��ng v� �i�m b�o danh

------------------------------------------------------------ D��i ��y b�i Li�u Tr� S�n
TIME_EXHIBIT_BOSS = 18 * 60 * (20 + BAOMING_TIME) / (20 * 18)-- So t�i 20 ph�t, t�c l� 50 ph�t sau khi b�t ��u b�o danh
-------------------------------------------------
--BOSSINFO = {BOSSID, BOSSNAME, LEVEL, SERIES}
-----------------------------------------------
BOSSINFO = {
	[1] = {511, "Tr��ng T�ng Ch�nh", 95, 4},
	[2] = {513, "Di�u Nh� ", 95, 2},
	[3] = {523, "Li�u Thanh Thanh", 95, 1}
}
----------------------------------------------------
--BOSSEXHIBITPOSITION = {MAPID, POSX, POSY, MAPNAME}
----------------------------------------------------
BOSSEXHIBITPOSITION = {
	{	386	,	1411	,	2691	,	"C�u ranh gi�i (cao c�p) "	}	,
	{	355	,	1391	,	2745	,	"Doanh tr�i (cao c�p) "	}	,
	{	352	,	1413	,	2921	,	"Th�m l�m (cao c�p) "	}	,
	{	380	,	1439	,	3335	,	"Xung phong (Cao c�p) "	}	,
	{	328	,	1348	,	2853	,	"Khu v�c b�nh nguy�n (cao c�p) "	}	,
	{	331	,	1385	,	2796	,	"Khu v�c H� T�n (cao c�p) "	}	,
	{	346	,	1914	,	3512	,	"Th�nh tr�n (cao c�p) "	}	,
	{	349	,	1367	,	2827	,	"S�n c�c (cao c�p) "	}	,
	{	383	,	1855	,	2872	,	"Th�m l�m (cao c�p) "	}	
}
function ExhibitBoss()
	local ExhibitArray_Index = 0;
	local PosArray_Count = getn(BOSSEXHIBITPOSITION);
	for i = 1, PosArray_Count do
		if (BOSSEXHIBITPOSITION[i][1] == SubWorldIdx2ID(SubWorld)) then
			ExhibitArray_Index = i;
			break;
		end
	end;
	if (0 == ExhibitArray_Index) then	-- N�u kh�ng ph�i b�n �� cao c�p th� ti�n h�nh hi�n th� BOSS
		return	
	end;
	local BossID_Index = random(1, 3);
	npcindex = AddNpcEx(BOSSINFO[BossID_Index][1], BOSSINFO[BossID_Index][3], BOSSINFO[BossID_Index][4],
			 SubWorld, BOSSEXHIBITPOSITION[ExhibitArray_Index][2] * 32, 
			 BOSSEXHIBITPOSITION[ExhibitArray_Index][3] * 32, 1, BOSSINFO[BossID_Index][2], 1);
	SetNpcDeathScript(npcindex, "\\script\\battles\\bossdeath.lua");
	
	WriteLog(BOSSINFO[BossID_Index][1]..",".. BOSSINFO[BossID_Index][3]..",".. BOSSINFO[BossID_Index][4]..",".. SubWorldIdx2ID(SubWorld)..",".. BOSSEXHIBITPOSITION[ExhibitArray_Index][2] ..","..	 BOSSEXHIBITPOSITION[ExhibitArray_Index][3]..",".. BOSSINFO[BossID_Index][2]);
			 
	local NewsStr = "Theo b�o c�o c�a th�m t� ti�n tuy�n "..BOSSINFO[BossID_Index][2].." �� xu�t hi�n t�i khu v�c cao c�p!";
	AddGlobalNews(NewsStr);	
end
---------------------------------------------------------- Ph�a tr�n b�i Li�u Tr� S�n

		PL_TOTALPOINT = 1
		PL_KILLPLAYER = 2
		PL_KILLNPC = 3
		PL_BEKILLED = 4
		PL_SNAPFLAG = 5
		PL_KILLRANK1 = 6
		PL_KILLRANK2 = 7
		PL_KILLRANK3 = 8
		PL_KILLRANK4 = 9
		PL_KILLRANK5 = 10
		PL_KILLRANK6 = 11
		PL_KILLRANK7 = 12
		PL_MAXSERIESKILL = 13		-- S� li�n tr�m t�i �a c�a ng��i ch�i trong to�n b� chi�n tr��ng
		PL_SERIESKILL = 14			-- S� li�n tr�m hi�n t�i c�a ng��i ch�i
		PL_FINISHGOAL = 15
		PL_1VS1 = 16
		PL_GETITEM = 17
		PL_WINSIDE = 18
		PL_PRISEGRADE = 19	
		PL_AVERAGEGRADE = 20
		PL_WINGRADE = 21	
		PL_PARAM1 = 22	-- D�ng �� ghi l�i t�a �� X c�a l� c�
		PL_PARAM2 = 23	-- D�ng �� ghi l�i t�a �� Y c�a l� c�
		PL_PARAM3 = 24	-- D�ng �� ghi l�i s� l�n T�ng Kim
		PL_PARAM4 = 25
		PL_PARAM5 = 26
		PL_CURRANK = 27	-- =PL_PARAM6 = 27 -- Bi�u th� ch�c v� hi�n t�i c�a ng��i ch�i, hi�n �ang s� d�ng tham s� th� 6
		
		PL_BATTLEID=41
		PL_RULEID=42
		PL_BATTLECAMP = 43
		PL_BATTLESERIES = 44 -- Ghi l�i s� th� t� tr�n chi�n m� ng��i ch�i tham gia l�n tr��c
		PL_KEYNUMBER = 45
		PL_LASTDEATHTIME = 46
		PL_BATTLEPOINT = 47	-- Ghi l�i t�ng �i�m c�a ng��i ch�i trong tr�n chi�n n�y, t�ng �i�m l� t�ng �i�m c�a c�c tr�n chi�n m� ng��i ch�i �� tham gia, E(PL_TOTALPOINT1 + PL_TOTALPOINT2+ ...)
		PL_ROUND = 48
		
		GAME_KEY = 1
		GAME_BATTLEID = 2
		GAME_RULEID = 3
		GAME_MAPID = 4	
		GAME_CAMP1 = 5	-- S� l��ng c� T�ng Kim (s� l�n T�ng Kim)
		GAME_CAMP2 = 6	-- S� l��ng c� T�ng Kim (s� l�n T�ng Kim)
		GAME_MAPICONID = 7
		GAME_RESTTIME = 8
		GAME_LEVEL = 9 
		GAME_MODE = 10
		GAME_CAMP1AREA= 11
		GAME_CAMP2AREA= 12
		GAME_BATTLESERIES = 13
		GAME_ROUND = 14
		
		tbRANKNAME={"<color=white>Binh S�<color>", "<color=0xa0ff>Hi�u �y<color>", "<color=0xff>Th�ng L�nh<color>", "<color=yellow>Ph� T��ng<color>", "<color=yellow><bclr=red>��i T��ng<bclr><color>" , "<color=black>Nguy�n So�i<color>"}

		MS_STATE = 1
		
		MS_TRANK1_S = 30; -- MissionV ID c�a NPC c�p 1 phe T�ng
		MS_TRANK1_J = MS_TRANK1_S + 6; -- MissionV ID c�a NPC c�p 1 phe Kim					36
		MS_RANK1LVL_S = MS_TRANK1_J + 6; -- Level MissionV ID c�a NPC c�p 1 phe T�ng		42
		MS_RANK1LVL_J = MS_RANK1LVL_S + 6;-- Level MissionV ID c�a NPC c�p 1 phe Kim		48
		MS_NPCCOUNT1_S = MS_RANK1LVL_J + 6; --												54
		MS_NPCCOUNT1_J = MS_NPCCOUNT1_S + 6; --												60
		MS_CALLNPCCOUNT_S = MS_NPCCOUNT1_J + 6 -- Ghi l�i s� l�n tri�u h�i NPC phe T�ng		66
		MS_CALLNPCCOUNT_J = MS_CALLNPCCOUNT_S + 1 -- Ghi l�i s� l�n tri�u h�i NPC phe Kim	67
		
		MS_PL2RANK1_S = 70		-- Nhi�m v� hi�n t�i, s� l��ng ng��i �� tr� th�nh "S� binh" phe T�ng
		MS_PL2RANK2_S = 71
		MS_PL2RANK3_S = 72
		MS_PL2RANK4_S = 73
		MS_PL2RANK5_S = 74
		MS_PL2RANK6_S = 75
	
		MS_PL2RANK1_J = 76		-- Nhi�m v� hi�n t�i, s� l��ng ng��i �� tr� th�nh "S� binh" phe Kim
		MS_PL2RANK2_J = 77		-- Hi�u �y
		MS_PL2RANK3_J = 78		-- Th�ng l�nh
		MS_PL2RANK4_J = 79		-- Ph� t��ng
		MS_PL2RANK5_J = 80		-- ��i t��ng
		MS_PL2RANK6_J = 81		-- Nguy�n so�i
	
		MS_HUANGZHIZHANG = 90  -- S� C�p nh�n ���c t� ho�t ��ng Ho�ng Chi Ch��ng
		MS_WUXINGZHUCNT_S = 91 -- Ghi l�i s� l��ng Tr� Ng� H�nh phe T�ng ���c tri�u h�i	68
		MS_WUXINGZHUCNT_J = 92 -- Ghi l�i s� l��ng Tr� Ng� H�nh phe Kim ���c tri�u h�i	69
	
		MAX_CALLNPCCOUNT = 10;	
		MAX_CALLWUXINGZHU	= 4;
		GLB_BATTLESTATE = 30
		GLB_FORBIDBATTLE = 31;-- Khi gi� tr� n�y l� 1, bi�u th� vi�c kh�i ��ng d�ng tr�n chi�n
	-- T�a �� ba �i�m b�o danh
	S_SIGNUPTAB = {};
	
	TV_LASTDEATHTIME = 2306	
	TV_LASTDEATHMAPX = 2307
	TV_LASTDEATHMAPY = 2308
	
	function bt_CheckDeathValid()
		local nowW, nowMapX , nowMapY = GetWorldPos();
		if (nowMapX == GetTask(TV_LASTDEATHMAPX) and nowMapY == GetTask(TV_LASTDEATHMAPY)) then
			return 0
		else
			SetTask(TV_LASTDEATHMAPX, nowMapX) 
			SetTask(TV_LASTDEATHMAPY, nowMapY)
			return 1
		end
		
--		local nowTime = GetCurServerTime()
	--	if (nowTime < GetTask(TV_LASTDEATHTIME)) then
		--	SetTask(TV_LASTDEATHTIME, nowTime)
			--return 1
		--end
		
		--if (nowtime - GetTask(TV_LASTDEATHTIME) < MAX_CHECKDEATHTIME) then
			--return 0
		--else
--			SetTask(TV_LASTDEATHTIME, nowTime)
	--	end
	end
	
	function bt_CheckLifeMax()
		if (GetLife(0) < GetLife(1)) then
			Msg2Player("Xin h�y h�i ph�c ��y �� sinh l�c, sau ��y h�y ra ��i Doanh!");
			return 0
		end
		return 1
	end
	
	BONUS_KILLPLAYER = 75
	BONUS_SNAPFLAG = 600
	BONUS_KILLNPC = 1
	BONUS_KILLRANK1 = 5
	BONUS_KILLRANK2 = 30
	BONUS_KILLRANK3 = 150
	BONUS_KILLRANK4 = 250
	BONUS_KILLRANK5 = 500
	BONUS_KILLRANK6 = 1000
	BONUS_KILLRANK7 = 500
	BONUS_MAXSERIESKILL = 150
	BONUS_GETITEM = 25
	BONUS_1VS1 = 400
	
	RA_KILL_PL_RANK = {10, 2.334, 0.934, 0.84, 0.56, 0.35}	
 	-- 7 S� binh ng��i ch�i -- 7/3 Hi�u �y ng��i ch�i -- 14/15 Th�ng l�nh ng��i ch�i -- 21/25 Ph� t��ng ng��i ch�i -- 14/25 ��i t��ng ng��i ch�i -- 7/20 Nguy�n so�i ng��i ch�i
 	
 	RANK_PKBONUS = {
 	{1,		6/5,	7/5,	8/5,	2	}, 
	{4/5,	1,		6/5,	7/5,	8/5	},
	{3/5,	4/5,	1,		6/5,	7/5	},
	{2/5,	3/5,	4/5,	1,		6/5	},
	{1/5,	2/5,	3/5,	4/5,	1	},
	};
	
	TAB_SERIESKILL =    -- Ghi l�i xem ng��i ch�i � c�c **rank kh�c nhau c� ghi l�i b�ng li�n tr�m th�c t� khi PK hay kh�ng**, 1 l� ghi l�i, 0 l� kh�ng ghi l�i
	{
		{1,1,1,1,1},
		{1,1,1,1,1},
		{1,1,1,1,1},
		{0,1,1,1,1},
		{0,0,1,1,1},
	};
	
	BALANCE_MAMCOUNT = 5;	-- Ch�nh l�ch s� ng��i hai phe T�ng Kim �i�u ch�nh th�nh 5 ng��i
	BALANCE_GUOZHAN_MAXCOUNT = 100; -- S� ng��i t�i �a cho ph�p c�a m�t b�n trong qu�c chi�n T�ng Kim
	TAB_RANKBONUS = {0, 1000, 3000, 6000,10000};
	RANK_SKILL = 661;
	TAB_RANKMSG = {
	"B�n ���c phong l� <color=white>Binh S�<color>!",
	"B�n ���c phong l� <color=0xff>Hi�u �y<color>! Sinh l�c t�ng20%",
	"B�n ���c phong l� <color=0xff>Th�ng L�nh<color>! Sinh l�c t�ng 30%, ph�ng th� t�ng 5%",
	"B�n ���c phong l� <color=yellow>Ph� T��ng<color>! Sinh l�c t�ng 40%, ph�ng th� t�ng 10% ",
	"B�n ���c phong l� <color=yellow><bclr=red>��i T��ng<bclr><color>! Sinh l�c t�ng 50%, ph�ng th� t�ng 15%.",
	"B�n ���c phong l� <color=yellow>Nguy�n So�i<color=>!"}
	
	TITLE_BONUSRANK1 = 0		-- Gi� tr� �i�m c�n thi�t �� tr� th�nh ch�c v� t��ng �ng
	TITLE_BONUSRANK2 = 10000	-- Hi�u �y
	TITLE_BONUSRANK3 = 20000	-- Th�ng l�nh
	TITLE_BONUSRANK4 = 40000	-- Ph� t��ng
	TITLE_BONUSRANK5 = 60000	-- ��i t��ng
	TITLE_BONUSRANK6 = 80000	-- Nguy�n so�i
	
	TITLE_PL2RANK1_N = 400		-- S� ng��i ch�i t�i �a c�a ch�c v� t��ng �ng
	TITLE_PL2RANK2_N = 60		-- Hi�u �y
	TITLE_PL2RANK3_N = 25		-- Th�ng l�nh
	TITLE_PL2RANK4_N = 10		-- Ph� t��ng
	TITLE_PL2RANK5_N = 5		-- ��i t��ng
	TITLE_PL2RANK6_N = 1		-- Nguy�n so�i

	TV_SERIESKILL_REALY = 2305  -- Gi� tr� li�n tr�m th�c t� hi�n t�i c�a ng��i ch�i (Gi�t ng��i ch�i c�p cao h�n s� t�nh li�n tr�m, nh�ng kh�ng t�nh li�n tr�m th�t s�)

	
	tbGAME_SIGNMAP = {323, 324, 325} -- Ghi l�i ID b�n �� c�a c�c �i�m b�o danh theo c�p ��, s�p x�p c�p �� t� th�p ��n cao
	tbSIGNMAP_POS = {{1541, 3178} , {1570, 3085}}
	szGAME_GAMELEVEL = {"Chi�n tr��ng S� c�p", "Chi�n tr��ng Trung c�p", "Chi�n tr��ng Cao c�p"}
	
	tbBATTLEMAP = {44, 326, 327, 328, 329, 330, 331, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 868, 869, 870,876,877,878,879,880,881,883,884,885, 898, 899, 900, 902, 903, 904,970,971};--����ս���õ��ĵ�ͼ�б�
	tbNPCPOS = {"npcpos1", "npcpos2"}
	TNPC_DOCTOR1 = 55;	-- ID m�u NPC c�a Qu�n y
	TNPC_DOCTOR2 = 49;
	TNPC_SYMBOL1 = 629;
	TNPC_SYMBOL2 = 630;
	TNPC_DEPOSIT = 625;
	
	TNPC_FLAG0 = 626;
	TNPC_FLAG1 = 628;
	TNPC_FLAG2 = 627;

	TNPC_TRANSPORT1 = 55; -- ID m�u NPC c�a Truy�n T�ng Quan
	TNPC_TRANSPORT2 = 49;
	
	
	tbTNPC_SOLDIER = {{631,632,633,634,635,636}, {637, 638, 639, 640, 641, 642}}
	BATTLES_WINGAME_POINT	= TONG_KIM_THUONG_THANG;	-- T�ch l�y nh�n ���c khi th�ng
	BATTLES_LOSEGAME_POINT	= TONG_KIM_THUONG_THUA;		-- T�ch l�y nh�n ���c khi thua
	BATTLES_TIEGAME_POINT	= TONG_KIM_THUONG_HOA;		-- T�ch l�y nh�n ���c khi h�a

--���ݱ�����ͼ��id�����������ս�۵ȼ�
function bt_map2battlelevel(mapid)
	for i = 1, getn(tbGAME_SIGNMAP) do 
		if (mapid == tbGAME_SIGNMAP[i])	then
			return i
		end
	end
	return 0
end

function bt_camp_getbonus(camp, bonus,strmsg, percent)
	local OldPlayerIndex = PlayerIndex
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID, idx, camp);
 		if (pidx > 0) then
   			PlayerIndex = pidx;
			local n_bonus = bt_addtotalpoint(bonus)
	   		Msg2Player(strmsg..n_bonus.."<color> �i�m t�ch l�y) ")
			Say("��t n�y b�n nh�n ���c <color=yellow> "..n_bonus.."<color> �i�m t�ch l�y", 0)
		end
 		if (idx <= 0) then 
			break
		end;
	end
	PlayerIndex = OldPlayerIndex
end;

-- L�y t�a �� c�a m�t �i�m b�o danh c�p �� n�o ��
function bt_getsignpos(camp)
	if (camp <= 0 or camp > 2) then
		camp = 1
	end
	
	level = GetLevel();
	
	if (level < 80)  then
		return tbGAME_SIGNMAP[1], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
	elseif (level < 120) then
		return tbGAME_SIGNMAP[2], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
	else
		return tbGAME_SIGNMAP[3], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
	end
end;
		
		
-- D�a v�o b�ng t�p h�p t�a �� trong file trapfile, t�o ra t�t c� c�c �i�m b�y (trap) v� li�n k�t v�i scriptfile	
function bt_addtrap(trapfile, scriptfile)
	local count = GetTabFileHeight(trapfile);
	scriptid = FileName2Id(scriptfile);
	
	ID = SubWorldIdx2ID(SubWorld);
	
	for i = 1, count - 1 do
		x = GetTabFileData(trapfile, i + 1, 1);
		y = GetTabFileData(trapfile, i + 1, 2);
		AddMapTrap(ID, x,y, scriptfile);
	end;
end;	

-- Chuy�n ��i chu�i t�a �� "123,234" th�nh hai bi�n s�: 123 v� 234
function bt_str2xydata(str)
	m = strfind(str,",")
	x = tonumber(strsub(str,0,m-1))
	y = tonumber(strsub(str,m+1))
	return x,y
end

-- Ng�u nhi�n l�y m�t t�a �� t� file t�a ��
function bt_getadata(file)
	local totalcount = GetTabFileHeight(file) - 1;
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

-- D�a v�o b�ng t�p h�p t�a �� trong file npcfile, t�o ra t�t c� c�c NPC ��i tho�i c� ID m�u l� tnpc_id v� li�n k�t v�i scriptfile		
function bt_adddiagnpc(npcfile, scriptfile, tnpcid, name)
	addcount = 0;
	local count = GetTabFileHeight(npcfile);
	
	for i = 1, count - 1 do
		x = GetTabFileData(npcfile, i + 1, 1);
		y = GetTabFileData(npcfile, i + 1, 2);
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1, name)			
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y);
		end

		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
			addcount = addcount + 1
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	
function bt_add_a_diagnpc(scriptfile, tnpcid, x, y, name)
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1 , name);
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y )
		end
		
		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
		return npcidx
end

-- D�a v�o b�ng t�p h�p t�a �� trong file npcfile, t�o ra t�t c� c�c NPC chi�n ��u c� ID m�u l� tnpc_id
function bt_addfightnpc (npcfile, tnpcid, level, camp, removewhendeath, name, boss)
	addcount = 0;
	local count = GetTabFileHeight(npcfile) - 1;
	
	l_removedeath = 1;
	l_name = "";
	l_boss = 0;
	
	if (removewhendeath ~= nil) then
		l_removedeath = removewhendeath
	end;
	
	if (name ~= nil or name ~= "" ) then
		l_name = name
	end
	
	if (boss ~= nil) then
		l_boss = boss
	end
	
	for i = 1, count  do
		x = GetTabFileData(npcfile, i + 1, 1);
		y = GetTabFileData(npcfile, i + 1, 2);
		npcidx = AddNpc(tnpcid, level, SubWorld, x, y, l_removedeath, l_name, l_boss);
		if (npcidx > 0) then
			SetNpcCurCamp(npcidx, camp)
			addcount = addcount + 1
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add fight npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	


-- D�a v�o b�ng t�p h�p t�a �� trong file npcfile, ng�u nhi�n t�o ra c�c NPC chi�n ��u c� ID m�u l� tnpc_id
function bt_addrandfightnpc(npcfile, tnpcid, level, camp,count, deathscript, removewhendeath, name, boss)
	addcount = 0;
	
	if (count <= 0) then
		return
	end
	
	local totalcount = GetTabFileHeight(npcfile) - 1;
	if (totalcount <= 0 ) then
		return
	end
	
	l_removedeath = 1;
	l_name = "";
	l_boss = 0;
	
	if (removewhendeath ~= nil) then
		l_removedeath = removewhendeath
	end;
	
	if (name ~= nil or name ~= "" ) then
		l_name = name
	end
	
	if (boss ~= nil) then
		l_boss = boss
	end

	for i = 1, count do
		id = random(totalcount)
		x = GetTabFileData(npcfile, id + 1, 1);
		y = GetTabFileData(npcfile, id + 1, 2);
		npcidx = AddNpc(tnpcid, level, SubWorld, x, y, l_removedeath, l_name, l_boss);
		if (npcidx > 0) then
			SetNpcCurCamp(npcidx, camp)
			SetNpcDeathScript(npcidx, deathscript) 
			addcount = addcount + 1
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add fight npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	

function delnpcsafe(nNpcIndex)
if (nNpcIndex <= 0 )  then
	return
end

PIdx = NpcIdx2PIdx(nNpcIndex);
if (PIdx > 0) then 
	WriteLog("L�i!!! DelNpc mu�n x�a b� m�t gamer ");
	return
end;

DelNpc(nNpcIndex)
end;


-------------------------------------------------------------------------
-- Camp bi�u th� ch� qu�n ��i tho�i thu�c phe n�o, 1 l� T�ng, 2 l� Kim
-- N�u b�ng 1 ngh�a l� �� b�o danh trong tr�n chi�n n�y, v� thu�c v� phe n�y
-- N�u b�ng 2 ngh�a l� �� b�o danh trong tr�n chi�n n�y, nh�ng kh�ng thu�c v� phe n�y
-- N�u b�ng 0 ngh�a l� ch�a b�o danh

function bt_checklastbattle(Camp)

local MKey = BT_GetGameData(GAME_KEY); --��ǰս�۵�ΨһKey��
local BattleId = BT_GetGameData(GAME_BATTLEID); --��ս�����͵�ID
local RuleId = BT_GetGameData(GAME_RULEID);

if ( MKey == BT_GetData(PL_KEYNUMBER) and BattleId == BT_GetData(PL_BATTLEID) and BT_GetData(PL_ROUND) == BT_GetGameData(GAME_ROUND) ) then
	if (Camp == BT_GetData(PL_BATTLECAMP)) then
		return 1
	else
		return 2
	end
else
	return 0
end;

end
-------------------------------------------------------------------------
function bt_setnormaltask2type()
-- 701 �� b� chi�m d�ng, v� v�y �� ��i sang 751
BT_SetType2Task(1, 751)
for i = 2, 50 do 
	BT_SetType2Task(i, 700 + i);
end
end
--------------------------------------------------------------------------
-- T�ch chu�i theo d�u ph�n c�ch, tr� v� m�t m�ng ch�a c�c ph�n �� t�ch
-- V� d� 1: strsplit( "abc,bcd,efg", "," ) -> { "abc", "bcd", "efg" }
-- V� d� 2: strsplit( ",abc,,bcd,,,efg,,", ",," ) -> { ",abc", "bcd", ",efg" }
function strsplit( strText, strSeparator )
	local arySlice = {};
	local nSliceCount = 0;
	local nStartIdx, nEndIdx;
	while( 1 ) do
		nStartIdx, nEndIdx = strfind( strText, strSeparator, 1, 1 );
		if( nStartIdx == nil ) then
			break
		end
		if( nStartIdx > 1 ) then
			nSliceCount = nSliceCount + 1;
			arySlice[nSliceCount] = strsub( strText, 1, nStartIdx - 1 );
		end
		strText = strsub( strText, nEndIdx + 1 );
	end
	if( strlen( strText ) > 0 ) then
		arySlice[nSliceCount+1] = strText;
	end
	return arySlice;
end
--------------------------------------------------------------------------------
function getNpcInfo( strNpcInfo )
	local arystrInfo = strsplit( strNpcInfo, "," );
	return tonumber( arystrInfo[1] ), tonumber( arystrInfo[2] ), tonumber( arystrInfo[3] );
end
---------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
function sf_callnpc(usedtime, totaltime) 
	if (usedtime > totaltime) then
		return
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	for i = 2, 6 do 
		if (GetMissionV(MS_NPCCOUNT1_S + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			nowadd = npccount - prenpccount;
			if (nowadd > 0) then
				print("call song npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S + i - 1), GetMissionV(MS_RANK1LVL_S + i - 1), 1, nowadd, tabFILE_NPCDEATH[i], 1)
				if (i == 6) then
					Msg2MSAll(MISSIONID, "Phong V�n Lu�n Ki�m b�o c�o: Nguy�n So�i qu�n T�ng �� xu�t hi�n!");
				end
			end
		end
	end
	
	for i = 2, 6 do 
		if (GetMissionV(MS_NPCCOUNT1_J + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			nowadd = npccount - prenpccount
			if (nowadd > 0) then
				print("call jing npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J + i - 1), GetMissionV(MS_RANK1LVL_J + i - 1), 2, nowadd, tabFILE_NPCDEATH[i], 1)
				if (i == 6) then
					Msg2MSAll(MISSIONID, "Phong V�n Lu�n Ki�m b�o c�o: Nguy�n So�i qu�n Kim �� xu�t hi�n!");
				end
			end
		end
	end
end;
---------------------------------------------------------------------------------------------------------
function test_callnpc(count, time)
t = 0;

for i = 1, time do
	last = floor((i - 1) / time * count )
	now = floor(i / time * count )
	c = now - last
	t = t + c
	print(c)
end;

print("total:"..t)
end;
------------------------------------------------------------------------------------------------------------
function sf_buildfightnpcdata()
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	
	for i = 1, 6 do 
		str = BT_GetBattleParam(i);
		tnpcid, level, count = getNpcInfo(str);
		SetMissionV(MS_TRANK1_S + i - 1, tnpcid);
		SetMissionV(MS_RANK1LVL_S + i - 1, level);
		SetMissionV(MS_NPCCOUNT1_S + i - 1, count)
	end
	
	for i = 1, 6 do 
		str = BT_GetBattleParam(i + 6 );
		tnpcid, level, count = getNpcInfo(str);
		SetMissionV(MS_TRANK1_J + i - 1, tnpcid);
		SetMissionV(MS_RANK1LVL_J + i - 1, level);
		SetMissionV(MS_NPCCOUNT1_J + i - 1, count)
	end
	
	-- Khi b�t ��u, S� binh phe T�ng xu�t hi�n to�n b� m�t l�n
	npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[2]);
	bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S), GetMissionV(MS_RANK1LVL_S), 1, GetMissionV(MS_NPCCOUNT1_S), tabFILE_NPCDEATH[1], 0)
	
	-- Khi b�t ��u, S� binh phe Kim xu�t hi�n to�n b� m�t l�n
	npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[2]);
	bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J), GetMissionV(MS_RANK1LVL_J), 2, GetMissionV(MS_NPCCOUNT1_J), tabFILE_NPCDEATH[1], 0)

end
------------------------------------------------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile)
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end

function bt_addtotalpoint(point)
	if (point == 0) then
		return
	end

	local nWeekDay = tonumber(GetLocalDate("%w"));
	-- N�u kh�ng ph�i ng�y TK Thi�n T� th� d�ng m�t n� b�nh th��ng
	if nWeekDay ~= 2 and nWeekDay ~= 4 and nWeekDay ~= 6 then
		point = BigBoss:AddSongJinPoint(point);	
		point = TB_QIANQIU_YINGLIE0904:add_sj_point(point);
		point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
	else
	-- N�u l� ng�y TK Thi�n T� th� ch� d�ng m�t n� ���c � c�c tr�n TK th��ng (ko ph�i 21:00)
		local nHour = tonumber(GetLocalDate("%H%M"))
		--DinhHQ
		--20110406: kh�ng k�ch ho�t hi�u �ng x2 x3 �i�m khi s� d�ng m�t n� trong TK Thi�n t� (21:00)
		if( nHour < 2045 or nHour >= 2250)then
			point = BigBoss:AddSongJinPoint(point);	
			point = TB_QIANQIU_YINGLIE0904:add_sj_point(point);
			point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
		end
	end
	-- �i�u ch�nh m�t n� anh h�ng chi�n tr��ng
--	local nHour = tonumber(GetLocalDate("%H"));
--	if nWeekDay ~=1 and nHour ~= 21 then
--		point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
--	end
	
	--tinhpn 20100706: Vo Lam Minh Chu
	local nHour = tonumber(date("%H%M"))
	local nDate = tonumber(GetLocalDate("%y%m%d"))	
	if (GetTask(TSK_Get2ExpTK) == nDate) then
		if (nHour >= 2100 and nHour <= 2300) then
			if nWeekDay ~= 2 and nWeekDay ~= 4 and nWeekDay ~= 6 then
				point = point*2
			end
		end
	end
	
	--tinhpn 20100804: IPBonus
	local nDay = tonumber(date("%w"))
	if nDay == 0 or nDay == 5 or nDay == 6  then
		if (GetTask(TASKID_RECIEVE_BONUS_TK) == 1) then
			point = floor(point*1.5)
		end
	end
	point = Songjin_checkdoubleexp(point)
	
	-- Ki�m tra �i�m t�ch l�y
	if BT_GetData(PL_BATTLEPOINT) > 1000000 then
		
		local szName		= GetName();					-- T�n nh�n v�t
		local nGameLevel 	= BT_GetGameData(GAME_LEVEL);	-- C�p �� T�ng Kim
		local nSubWorldID 	= SubWorldIdx2ID();				-- ID b�n ��

		local nAddPoint		= point;						-- �i�m t�ch l�y ���c th�m v�o l�n n�y
		local nTotalPoint	= BT_GetData(PL_TOTALPOINT);	-- �i�m t�ch l�y tr�n n�y
		local nBattlePoint	= BT_GetData(PL_BATTLEPOINT);	-- �i�m t�ch l�y nh�n v�t
		local nKillPlayer	= BT_GetData(PL_KILLPLAYER);	-- S� ng��i b� gi�t
		
		WriteLog(format("Warning[Too Much Battle Point] %s in Level_%d Battle(%d) want to add %d Ponit. Now Total Point is %d, Battle Point is %d, Kill %d Players!", 
			szName, nGameLevel, nSubWorldID, nAddPoint, nTotalPoint, nBattlePoint, nKillPlayer));
	end
	

	BT_SetData(PL_TOTALPOINT, BT_GetData(PL_TOTALPOINT) + point)
	BT_SetData(PL_BATTLEPOINT, BT_GetData(PL_BATTLEPOINT) + point)
	
	bt_JudgePLAddTitle()
	--Storm �ӻ���
	storm_addpoint(1, point)
	return point
end

function bt_assignrank(camp)-- Ch�c n�ng n�y �� v� hi�u
	camptab={}
	--�����ǰ�Ĺ�λ����
	for tt = 70 , 81 do 
		SetMissionV(tt,0)
	end
		
	idx = 0
	pidx = 0
	
	count = 1
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, camp);
 		
 		if (pidx > 0) then
	 		camptab[count] = pidx;
	 		count = count + 1
	 	end;
	 	if (idx == 0) then 
	 		break
	 	end;
	end;

	for tj = 1, getn(camptab) do 
		
		nTopData = 0
		nTopPlayer = 0;
		nTopIndex = 0
		for i = 1, getn(camptab) do 
			if (camptab[i] ~= 0) then
				PlayerIndex = camptab[i];
				if (BT_GetData(PL_BATTLEPOINT)>= nTopData) then
					nTopPlayer = PlayerIndex
					nTopData = BT_GetData(PL_BATTLEPOINT)
					nTopIndex = i
				end
			end
		end
		
		if (nTopData > 0) then
			PlayerIndex = nTopPlayer
			camptab[nTopIndex] = 0;
			if (camp == 1) then
				JudgePLAddTitle()
			else
				JudgePLAddTitle()
			end
		end
	end
end
--------------------------T�nh to�n h� s� �i�m, ��t l�i �i�m---------------------------------------
function ResetBonus()
	CAMP1CUN = GetMSPlayerCount(MISSIONID, 1)
	CAMP2CUN = GetMSPlayerCount(MISSIONID, 2)
	AVRCUN = (CAMP1CUN + CAMP2CUN)/2
	
	if (AVRCUN == 0) then
		bonuscff1 = 1
		bonuscff2 = 1
	else
		bonuscff1 = 1-(CAMP1CUN-AVRCUN)/AVRCUN
		bonuscff2 = 1-(CAMP2CUN-AVRCUN)/AVRCUN
	end
	
	-- Qu�c chi�n T�ng Kim b� qua c�n b�ng hai phe
	if BT_GetGameData(GAME_BATTLEID) == 2 then
		bonuscff1 = 1
		bonuscff2 = 1
	end
	
	-- N�u v�o bu�i t�i �ang trong ho�t ��ng Ho�ng Chi Ch��ng, t�ch l�y s� ���c nh�n ��i
	bonuscff1 = bonuscff1 * bt_getgn_awardtimes()
	bonuscff2 = bonuscff2 * bt_getgn_awardtimes()

	-- X2 �i�m m�i ng�y v� X4 v�o th� 7 by Anh Quach - 21/06/2025
	local nWeekDay = tonumber(GetLocalDate("%w"));
	local nHour = tonumber(GetLocalDate("%H%M"))
	if (TONG_KIM_X2_NGAY_BAT == 1) and (nHour >= TONG_KIM_X2_GIO_BAT_DAU and nHour < (TONG_KIM_X2_GIO_BAT_DAU + 160)) then
		if (TONG_KIM_X4_T7_BAT == 1 and nWeekDay == 6) then
			bonuscff1 = bonuscff1 * 4
			bonuscff2 = bonuscff2 * 4
		else
			bonuscff1 = bonuscff1 * 2
			bonuscff2 = bonuscff2 * 2
		end
	end
	
	BT_SetTypeBonus(PL_KILLPLAYER, 1, floor(BONUS_KILLPLAYER*bonuscff1))
	BT_SetTypeBonus(PL_SNAPFLAG, 1, floor(BONUS_SNAPFLAG*bonuscff1))
	BT_SetTypeBonus(PL_KILLNPC, 1, floor(BONUS_KILLNPC*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK1, 1, floor(BONUS_KILLRANK1*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK2, 1, floor(BONUS_KILLRANK2*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK3, 1, floor(BONUS_KILLRANK3*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK4, 1, floor(BONUS_KILLRANK4*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK5, 1, floor(BONUS_KILLRANK5*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK6, 1, floor(BONUS_KILLRANK6*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK7, 1, floor(BONUS_KILLRANK7*bonuscff1))
	BT_SetTypeBonus(PL_MAXSERIESKILL, 1, floor(BONUS_MAXSERIESKILL*bonuscff1))
	BT_SetTypeBonus(PL_GETITEM, 1, floor(BONUS_GETITEM*bonuscff1))
	BT_SetTypeBonus(PL_1VS1, 1, floor(BONUS_1VS1*bonuscff1))

	BT_SetTypeBonus(PL_KILLPLAYER, 2, floor(BONUS_KILLPLAYER*bonuscff2))
	BT_SetTypeBonus(PL_SNAPFLAG, 2, floor(BONUS_SNAPFLAG*bonuscff2))
	BT_SetTypeBonus(PL_KILLNPC, 2, floor(BONUS_KILLNPC*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK1, 2, floor(BONUS_KILLRANK1*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK2, 2, floor(BONUS_KILLRANK2*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK3, 2, floor(BONUS_KILLRANK3*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK4, 2, floor(BONUS_KILLRANK4*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK5, 2, floor(BONUS_KILLRANK5*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK6, 2, floor(BONUS_KILLRANK6*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK7, 2, floor(BONUS_KILLRANK7*bonuscff2))
	BT_SetTypeBonus(PL_MAXSERIESKILL, 2, floor(BONUS_MAXSERIESKILL*bonuscff2))
	BT_SetTypeBonus(PL_GETITEM, 2, floor(BONUS_GETITEM*bonuscff2))
	BT_SetTypeBonus(PL_1VS1, 2, floor(BONUS_1VS1*bonuscff2))
end
------------------------------------------------------------------------------------

---------------------Khi v�o chi�n tr��ng s� g�n ch�c v� t��ng �ng cho ng��i ch�i BEGIN------------------------------------------
function bt_JudgePLAddTitle()
-- L�y Rank hi�n t�i. N�u �i�m ��t y�u c�u c�a Rank c�p ti�p theo th� g�n Rank �� cho ng��i ch�i. N�u gi� tr� Rank �� ��t gi�i h�n tr�n th� kh�ng c�ng th�m.
	local nCurRank = BT_GetData(PL_CURRANK)
	if ( nCurRank >= getn(TAB_RANKBONUS)) then
		return
	end
	if (BT_GetData(PL_TOTALPOINT) < TAB_RANKBONUS[nCurRank + 1]) then
		return	
	end
	local nRankCount = getn(TAB_RANKBONUS)
	for i = 1, getn(TAB_RANKBONUS) do 
		if (BT_GetData(PL_TOTALPOINT) >= TAB_RANKBONUS[nRankCount - i + 1] ) then
				bt_RankEffect(nRankCount - i + 1)
				return
		end
	end
end

-- G�n ch�c v�
function bt_RankEffect(rank)
	if (rank == 0) then
		rank = 1
	end
	local campnum = 89
	if (GetCurCamp() == 2) then
		campnum = campnum + 5
	end
	Title_AddTitle(campnum + rank - 1, 0, 9999999)
	Title_ActiveTitle(campnum + rank - 1)
	AddSkillState(RANK_SKILL, rank - 1, 0, 999999);
	Msg2Player(TAB_RANKMSG[rank]);
	BT_SetData(PL_CURRANK, rank);
end

-------------------------Khi v�o chi�n tr��ng s� g�n ch�c v� t��ng �ng cho ng��i ch�i ENDING----------------------------------


function bt_autoselectmaparea(mapfile,areacount)		-- Ng�u nhi�n ch�n m�t ��a �i�m trong b�n ��, l� khu v�c c�n c� c�a c� hai phe
	local s_area = 0
	local j_area = 0
	local areatmp = random(areacount);
	local wwt = tonumber(GetIniFileData(mapfile, "Area_"..areatmp, "camparea"))
	if (wwt == 0 or wwt == 1) then
		s_area = areatmp
		while(j_area == 0) do 
			areatmp = random(areacount)
			if (areatmp ~= s_area) then
				wwt1 = tonumber(GetIniFileData(mapfile, "Area_"..areatmp, "camparea"))
				if (wwt1 == 0 or wwt1 == 2) then
					j_area = areatmp
				end
			end
		end
	else
		j_area = areatmp
		while(s_area == 0) do 
			areatmp = random(areacount)
			if (areatmp ~= j_area) then
				wwt1 = tonumber(GetIniFileData(mapfile, "Area_"..areatmp, "camparea"))
				if (wwt1 == 0 or wwt1 == 1) then
					s_area = areatmp
				end
			end
		end
	end
	return s_area,j_area
end


function bt_exchangeexp(level, mark)
		if (level < 40) then
			return 0
		end
		local base_exp = (( 700 + floor(( level - 40 ) / 5 ) * 100 ) * 60 * 7 / 3000 );	-- Gi� tr� kinh nghi�m c� b�n c�a 1 �i�m t�ch l�y
		local bonus = floor( mark * base_exp )
		
		-- T�ng Kim �i�u ch�nh b�i B� t�ch 120 27/07/09
		if (level >= 120) then
			bonus = floor( bonus * 2.5 * 2 )
		end
		
		return bonus
end
-- Chuy�n ��i gi�y th�nh ph�t v� gi�y, v� d�: 62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;

function bt_pop2signmap()	-- Kh�ng cho ph�p ng��i ch�i � l�i h�u c� qu� 5 ph�t. Trong ch� �� �� S�t v� ch� �� Nguy�n So�i, ch� �� S�t L�c s� kh�ng x� l� v� sau 2 ph�t ng��i ch�i s� b� n�m ra chi�n tr��ng.
	local oldPlayerIndex = PlayerIndex
	local tbPlayer = {}
	local count = 0

	local idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer( MISSIONID,idx, 0 );
		if( pidx > 0 ) then
		 	PlayerIndex = pidx
		 	if ( GetFightState() == 0 and ( ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) ) >= TIME_GAME_LIMIT ) ) then
		 		count = count + 1
		 		tbPlayer[ count ] = pidx
		 	end
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 

	local game_level = BT_GetGameData(GAME_LEVEL);
	if ( count > 0 ) then
		for i = 1, count do
			PlayerIndex = tbPlayer[ i ]
		 	local l_curcamp = GetCurCamp();

			SetTaskTemp(200,0);
			SetLogoutRV(0);
			SetCreateTeam(1);
			SetDeathScript("");
			SetFightState(0)		-- Sau khi ��nh xong qu�i th� chuy�n sang tr�ng th�i kh�ng chi�n ��u (by Dan_Deng)
			SetPunish(1)
			ForbidChangePK(0);
			SetPKFlag(0)
			Msg2Player("Th�i gian l�u l�i trong Doanh tr�i �� v��t qu� 5 ph�t, b�n b� ��y ra chi�n tuy�n")
			if (l_curcamp == 1) then
				SetRevPos(tbGAME_SIGNMAP[game_level], 1)
				NewWorld(bt_getsignpos(1))
			else	
				SetRevPos(tbGAME_SIGNMAP[game_level], 2)
				NewWorld(bt_getsignpos(2))
			end;
			
			local camp = GetCamp();
			SetCurCamp(camp);
			
		end
	end

	PlayerIndex = oldPlayerIndex
end

function bt_getgn_awardtimes()
	local nWeekDay = tonumber(GetLocalDate("%w"))
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		local nHour = tonumber(GetLocalDate("%H%M"))
		--DinhHQ
		--20110409: kh�ng k�ch ho�t hi�u �ng x4 �i�m t�ch l�y c�a TK Thi�n T� trong c�c gi� TK th��ng
		-- Ngh�a l� ch� k�ch ho�t hi�u �ng x4 trong gi� TK Thi�n T� (21:00)
		if( nHour >= 2045 and nHour < 2250)then
			return 4
		end
	end
	-- Ki�m tra Ho�ng Chi Ch��ng
	-- MS_HUANGZHIZHANG = h� s� x t� ho�t ��ng Ho�ng Chi Ch��ng
	if (GetMissionV(MS_HUANGZHIZHANG) == 0 or GetMissionV(MS_HAUNGZHIZHANG) == 1) then
		return 1
	else
		return GetMissionV(MS_HUANGZHIZHANG)
	end
end

function check_pl_level(pl_level)
	if (GetLevel() >= 40 and GetLevel() < 80) then
		return 1		
	end
	if (GetLevel() >= 80 and GetLevel() < 120) then
		return 2
	end
	if (GetLevel() >= 120 ) then
		return 3
	end
end

--- B�t ��u th�m m�i
-- B�ng x�p h�ng �i�m T�ng Kim Vinh D�, ch� d�nh cho T�ng Kim c�p cao
-- Khi m�i tr�n ��u k�t th�c, ngay l�p t�c th�ng k� th� h�ng v� �i�m trong chi�n b�o,
-- L�u tr� trong th�ng k� chi�n ��i (LEAGUERESULT) c�ng v�i x�p h�ng th�nh t�ch hi�n c�, gi� l�i 10 th� h�ng ��u
-- C�p nh�t b�ng x�p h�ng (b�ng x�p h�ng Phong V�n 10250), theo th� h�ng
-- V�o 23 gi� Ch� Nh�t h�ng tu�n, l�u k�t qu� x�p h�ng chi�n ��i (top 5) v�o b�ng x�p h�ng (10239) �� ph�t th��ng
-- ��ng th�i, x�a th�nh t�ch trong th�ng k� chi�n ��i (LEAGUERESULT)
-- 2545
 LG_SONGJINHONOUR = 535;
 LG_TSK_HONOURPOINT = 1;
 LG_TSK_TOTALPOINT = 2;
 LG_TSK_SECT = 3;	-- M�n ph�i
 LG_TSK_GENDER = 4; -- Gi�i t�nh
function bt_sortbthonour()
	-- K�t qu� l�n n�y
	local tbCurPlayer = {};
	for i = 1, 10 do
		local szname, npoint, nsect, ngender = BT_GetTopTenInfo(i, PL_TOTALPOINT);
		if (szname ~= nil) then
			tbCurPlayer[ getn(tbCurPlayer)+1 ] = {szname, (11-i), npoint, nsect, ngender};
		end;
	end;
	
	if (tbCurPlayer == {}) then
		print("Battle Have No Player JoinIN!! SO , not do bt_sortbthonour!");
		return 0;
	end;
	
	bt_reportworldresult(tbCurPlayer);	-- C�ng b� th�nh t�ch x�p h�ng l�n n�y ra th� gi�i (t�t c� c�c m�y ch�)
	
	local tbNewPlayer = {};
	local nlg_idx = LG_GetFirstLeague(LG_SONGJINHONOUR);
	while(nlg_idx ~= nil and nlg_idx ~= 0) do
		local szlgname = LG_GetLeagueInfo(nlg_idx);
		local nhonour = LG_GetLeagueTask(nlg_idx, LG_TSK_HONOURPOINT);
		local npoint = LG_GetLeagueTask(nlg_idx, LG_TSK_TOTALPOINT);
		local nsect = LG_GetLeagueTask(nlg_idx, LG_TSK_SECT);
		local ngender = LG_GetLeagueTask(nlg_idx, LG_TSK_GENDER);
		tbNewPlayer[ getn(tbNewPlayer)+1 ] = {szlgname, nhonour, npoint, nsect, ngender};
		nlg_idx = LG_GetNextLeague(LG_SONGJINHONOUR, nlg_idx);
	end;
	
	local nnewcount = getn(tbNewPlayer);
	for i = 1, getn(tbCurPlayer) do
		local bP = 0;
		for k = 1, nnewcount do
			if (tbCurPlayer[i][1] == tbNewPlayer[k][1]) then
				tbNewPlayer[k][2] = tbCurPlayer[i][2] + tbNewPlayer[k][2];
				tbNewPlayer[k][3] = tbCurPlayer[i][3] + tbNewPlayer[k][3];
				tbNewPlayer[k][4] = tbCurPlayer[i][4];
				tbNewPlayer[k][5] = tbCurPlayer[i][5];
				bP = 1;
				break
			end;
		end;
		if (bP == 0) then
			tbNewPlayer[getn(tbNewPlayer)+1] = tbCurPlayer[i];
		end;
	end;
	
	-- Ch�n v�o k�t qu� tr��c ��
	for i = 1, getn(tbCurPlayer) do
		local nlg_idx = LG_GetLeagueObj(LG_SONGJINHONOUR, tbCurPlayer[i][1]);
		if (nlg_idx == nil or nlg_idx == 0) then	-- N�u kh�ng c� th� t�o m�i, kh�ng x�p h�ng l�i
			if (bt_createleague(tbCurPlayer[i][1]) == 1) then	-- T�o th�nh c�ng
				LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_HONOURPOINT, tbCurPlayer[i][2]);
				LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_TOTALPOINT, tbCurPlayer[i][3]);
				LG_ApplySetLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_SECT, tbCurPlayer[i][4]);
				LG_ApplySetLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_GENDER, tbCurPlayer[i][5]);
			end;
		else										-- N�u t�n t�i th� t�ch l�y
			LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_HONOURPOINT, tbCurPlayer[i][2]);
			LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_TOTALPOINT, tbCurPlayer[i][3]);
		end;
	end;
	
	Ladder_ClearLadder(10250);	-- X�a b�ng x�p h�ng

	if (getn(tbNewPlayer) >= 1) then
		sort(tbNewPlayer, bt_sortmaxhonour);
		for i = 1, 10 do			-- Vi�t l�i b�ng x�p h�ng
			if (tbNewPlayer[i]) then
				Ladder_NewLadder(10250, tbNewPlayer[i][1],tbNewPlayer[i][2], 0, tbNewPlayer[i][4], tbNewPlayer[i][5]);
			end;
		end;
	end;
end;



function bt_sortmaxhonour(tb1, tb2)
	if (tb1[2] ~= tb2[2]) then
		return tb1[2] > tb2[2];
	else
		return tb1[3] > tb2[3];
	end;
end;

function bt_createleague(szlgname)
	local nNewLeagueID = LG_CreateLeagueObj()	-- T�o ��i t��ng d� li�u bang h�i (tr� v� ID ��i t��ng)
	LG_SetLeagueInfo(nNewLeagueID, LG_SONGJINHONOUR, szlgname)	-- Thi�t l�p th�ng tin bang h�i (lo�i, t�n)
	local ret = LG_ApplyAddLeague(nNewLeagueID, "", "") 
	LG_FreeLeagueObj(nNewLeagueID)
	return ret
end;

function bt_reportworldresult(tbPlayer)
	local ncount = getn(tbPlayer);
	if (ncount <= 0) then
		return 0;
	else
		if (ncount > 3) then
			ncount = 3;
		end;
	
		local szParam = "Phong V�n Lu�n Ki�m cao c�p �� k�t th�c, Top"..ncount.." g�m: <enter>";
		for i = 1, ncount do
			if (tbPlayer[i][1]) then
				szParam = format("%s   X�p h�ng %d <color=green>%s<color>  %d<enter>",
				szParam,i,safeshow(tbPlayer[i][1]),tbPlayer[i][3]);
			end;
		end;
		LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szParam , "", "")
	end;
end
---�¼���End


-- by zero 2007-7-30 Tr� v� t� l� c�n b�ng �i�m: T�ng, Kim
function bonus_rate()
	CAMP1CUN = GetMSPlayerCount(MISSIONID, 1)
	CAMP2CUN = GetMSPlayerCount(MISSIONID, 2)
	AVRCUN = (CAMP1CUN + CAMP2CUN)/2
	
	if (AVRCUN == 0) then
		bonuscff1 = 1
		bonuscff2 = 1
	else
		bonuscff1 = 1-(CAMP1CUN-AVRCUN)/AVRCUN
		bonuscff2 = 1-(CAMP2CUN-AVRCUN)/AVRCUN
	end
	return bonuscff1,bonuscff2
end

function mar_addmissionpoint(totalpoint, nCurCamp)
	if (totalpoint == 0) then
		return
	end
	local nWeekDay = tonumber(GetLocalDate("%w"));
	--tinhpn 20100706: Vo Lam Minh Chu
	local nHour = tonumber(date("%H%M"))
	local nDate = tonumber(GetLocalDate("%y%m%d"))	
	if (GetTask(TSK_Get2ExpTK) == nDate) then
		if (nHour >= 2100 and nHour <= 2300) then
			if nWeekDay ~= 2 and nWeekDay ~= 4 and nWeekDay ~= 6 then	
				totalpoint = totalpoint*2
			end
		end
	end
	
	--tinhpn 20100804: IPBonus
	local nDay = tonumber(date("%w"))
	if nDay == 0 or nDay == 5 or nDay == 6  then
		if (GetTask(TASKID_RECIEVE_BONUS_TK) == 1) then
			totalpoint = floor(totalpoint*1.5)
		end
	end
		
	
	if (not nCurCamp) then
		nCurCamp = GetCurCamp();
	elseif (nCurCamp ~=1 and nCurCamp ~= 2) then
		return
	end
	
	if (nCurCamp == 1) then
		SetMissionV(MS_TOTALPOINT_S, GetMissionV(MS_TOTALPOINT_S)+totalpoint)
	else
		SetMissionV(MS_TOTALPOINT_J, GetMissionV(MS_TOTALPOINT_J)+totalpoint)
	end
end


-- Hi�n th� th�ng tin x�p h�ng c�c lo�i c�a chi�n tr��ng theo th�i gian th�c b�i S� L�ng Th�t T�ch 27/07/09
function bt_announce (lsf_level, n_time)
	
	-- M�i 10 ph�t (30 l�n * c�ch nhau 20 gi�y) c�ng b� m�t l�n th�ng tin
	if (mod(n_time, 30) ~= 0) then
		return
	end
	
	-- Ch� c�ng b� th�ng tin chi�n tr��ng c�p cao
	if (lsf_level ~= 3) then
		return
	end
	
	local old_player = PlayerIndex;
	
	local nStrLen_Total = 31;
	local nStrLen_Sort_Title	= 5;
	local nStrLen_Name_Title	= 5;
	local nStrLen_Camp_Title	= 10;
	local nStrLen_Score_Title	= 11;
	local nStrLen_Sort_Text		= 3;
	local nStrLen_Name_Text		= 16;
	local nStrLen_Camp_Text		= 6;
	local nStrLen_Score_Text	= 6;
	
	-- B�ng x�p h�ng li�n tr�m
	tbPlayer = {};
	battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_SER);
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("Top li�n tr�m", nStrLen_Total));
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", nStrLen_Sort_Title)..strfill_center("T�n", nStrLen_Name_Title)..strfill_center("Phe ph�i", nStrLen_Camp_Title)..strfill_center("Li�n tr�m", nStrLen_Score_Title));
	for i = 1, 5 do
		if tbPlayer[i] and tbPlayer[i] > 0 then
			PlayerIndex = tbPlayer[i];
			local szname, npoint = GetName(), BT_GetData(PL_MAXSERIESKILL);
			local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "V�ng (T)" or "T�m (K)";
			if (szname and szname ~= "") then
				Msg2MSAll(MISSIONID, strfill_center(tostring(i), nStrLen_Sort_Text)..strfill_center(szname, nStrLen_Name_Text)..strfill_center(szCamp, nStrLen_Camp_Text)..strfill_center(tostring(npoint), nStrLen_Score_Text));
			end
		end
	end
	
	-- B�ng x�p h�ng ng��i ch�i PK
	tbPlayer = {};
	battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_PK);
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("TOP PK", nStrLen_Total));
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", nStrLen_Sort_Title)..strfill_center("T�n", nStrLen_Name_Title)..strfill_center("Phe ph�i", nStrLen_Camp_Title)..strfill_center("PK", nStrLen_Score_Title));
	for i = 1, 5 do 
		if tbPlayer[i] and tbPlayer[i] > 0 then
			PlayerIndex = tbPlayer[i];
			local szname, npoint = GetName(), BT_GetData(PL_KILLPLAYER);
			local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "V�ng (T)" or "T�m (K)";
			if (szname and szname ~= "") then
				Msg2MSAll(MISSIONID, strfill_center(tostring(i), nStrLen_Sort_Text)..strfill_center(szname, nStrLen_Name_Text)..strfill_center(szCamp, nStrLen_Camp_Text)..strfill_center(tostring(npoint), nStrLen_Score_Text));
			end
		end
	end
	
	-- B�ng x�p h�ng h� g�c NPC ch� ch� �� Nguy�n So�i B�o V�
	if (MISSIONID == 16) then
		tbPlayer = {};
		battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_NPC);
		Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("TOP NPC", nStrLen_Total));
		Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", nStrLen_Sort_Title)..strfill_center("T�n", nStrLen_Name_Title)..strfill_center("Phe ph�i", nStrLen_Camp_Title)..strfill_center("NPC", nStrLen_Score_Title));
		for i = 1, 5 do 
			if tbPlayer[i] and tbPlayer[i] > 0 then
				PlayerIndex = tbPlayer[i];
				local szname, npoint = GetName(), BT_GetData(PL_KILLNPC);
				local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "V�ng (T)" or "T�m (K)";
				if (szname and szname ~= "") then
					Msg2MSAll(MISSIONID, strfill_center(tostring(i), nStrLen_Sort_Text)..strfill_center(szname, nStrLen_Name_Text)..strfill_center(szCamp, nStrLen_Camp_Text)..strfill_center(tostring(npoint), nStrLen_Score_Text));
				end
			end
		end
	end
	
	
	PlayerIndex = old_player;
end