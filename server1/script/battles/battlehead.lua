-- Thªm biÕn global
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
FRAME2TIME = 18;									-- 18 khung h×nh thêi gian game t­¬ng ®­¬ng 1 phót
BAOMING_TIME = TONG_KIM_THOI_GIAN_BAO_DANH			-- Thêi gian b¸o danh
FIGHTING_TIME = TONG_KIM_THOI_GIAN_CHIEN_DAU		-- Thêi gian giao chiÕn
ANNOUNCE_TIME = TONG_KIM_THOI_GIAN_CHIEN_BAO		-- C«ng bè chiÕn b¸o sau 20 phót

TIMER_1 = ANNOUNCE_TIME * FRAME2TIME; -- 20 phót c«ng bè ChiÕn b¸o
TIMER_2 = (FIGHTING_TIME + BAOMING_TIME) * 60  * FRAME2TIME; -- Thêi gian giao chiÕn lµ 1 giê
RUNGAME_TIME = BAOMING_TIME * 60 * FRAME2TIME / TIMER_1; -- Sau khi b¸o danh 10 phót, tù ®éng vµo giai ®o¹n chiÕn ®Êu
GO_TIME =  BAOMING_TIME * 60 * FRAME2TIME  / TIMER_1; -- Thêi gian b¸o danh lµ 10 phót

SONGJIN_SIGNUP_FEES = TONG_KIM_PHI_BAO_DANH  -- PhÝ b¸o danh

JUNGONGPAI = 1773 -- ID Nguyªn so¸i Tèng Kim: 6, 1, 1477
EXPIRED_TIME = 24*60  -- Nguyªn so¸i Tèng Kim qu¸ h¹n
JUNGONGPAI_Task_ID = 1830 -- BiÕn nhiÖm vô Nguyªn so¸i Tèng Kim

TIME_GAME_LIMIT = 5 * 60	-- Thêi gian ng­êi ch¬i cã thÓ ë l¹i HËu Doanh, nÕu qu¸ thêi gian sÏ tho¸t khái chiÕn tr­êng vÒ ®iÓm b¸o danh

------------------------------------------------------------ D­íi ®©y bëi Liªu TrÝ S¬n
TIME_EXHIBIT_BOSS = 18 * 60 * (20 + BAOMING_TIME) / (20 * 18)-- So tµi 20 phót, tøc lµ 50 phót sau khi b¾t ®Çu b¸o danh
-------------------------------------------------
--BOSSINFO = {BOSSID, BOSSNAME, LEVEL, SERIES}
-----------------------------------------------
BOSSINFO = {
	[1] = {511, "Tr­¬ng T«ng ChÝnh", 95, 4},
	[2] = {513, "DiÖu Nh­ ", 95, 2},
	[3] = {523, "LiÔu Thanh Thanh", 95, 1}
}
----------------------------------------------------
--BOSSEXHIBITPOSITION = {MAPID, POSX, POSY, MAPNAME}
----------------------------------------------------
BOSSEXHIBITPOSITION = {
	{	386	,	1411	,	2691	,	"CÇu ranh giíi (cao cÊp) "	}	,
	{	355	,	1391	,	2745	,	"Doanh tr¹i (cao cÊp) "	}	,
	{	352	,	1413	,	2921	,	"Th©m l©m (cao cÊp) "	}	,
	{	380	,	1439	,	3335	,	"Xung phong (Cao cÊp) "	}	,
	{	328	,	1348	,	2853	,	"Khu vùc b×nh nguyªn (cao cÊp) "	}	,
	{	331	,	1385	,	2796	,	"Khu vùc Hµ T©n (cao cÊp) "	}	,
	{	346	,	1914	,	3512	,	"Thµnh trÊn (cao cÊp) "	}	,
	{	349	,	1367	,	2827	,	"S¬n cèc (cao cÊp) "	}	,
	{	383	,	1855	,	2872	,	"Th©m l©m (cao cÊp) "	}	
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
	if (0 == ExhibitArray_Index) then	-- NÕu kh«ng ph¶i b¶n ®å cao cÊp th× tiÕn hµnh hiÓn thÞ BOSS
		return	
	end;
	local BossID_Index = random(1, 3);
	npcindex = AddNpcEx(BOSSINFO[BossID_Index][1], BOSSINFO[BossID_Index][3], BOSSINFO[BossID_Index][4],
			 SubWorld, BOSSEXHIBITPOSITION[ExhibitArray_Index][2] * 32, 
			 BOSSEXHIBITPOSITION[ExhibitArray_Index][3] * 32, 1, BOSSINFO[BossID_Index][2], 1);
	SetNpcDeathScript(npcindex, "\\script\\battles\\bossdeath.lua");
	
	WriteLog(BOSSINFO[BossID_Index][1]..",".. BOSSINFO[BossID_Index][3]..",".. BOSSINFO[BossID_Index][4]..",".. SubWorldIdx2ID(SubWorld)..",".. BOSSEXHIBITPOSITION[ExhibitArray_Index][2] ..","..	 BOSSEXHIBITPOSITION[ExhibitArray_Index][3]..",".. BOSSINFO[BossID_Index][2]);
			 
	local NewsStr = "Theo b¸o c¸o cña th¸m tö tiÒn tuyÕn "..BOSSINFO[BossID_Index][2].." ®· xuÊt hiÖn t¹i khu vùc cao cÊp!";
	AddGlobalNews(NewsStr);	
end
---------------------------------------------------------- PhÝa trªn bëi Liªu TrÝ S¬n

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
		PL_MAXSERIESKILL = 13		-- Sè liªn tr¶m tèi ®a cña ng­êi ch¬i trong toµn bé chiÕn tr­êng
		PL_SERIESKILL = 14			-- Sè liªn tr¶m hiÖn t¹i cña ng­êi ch¬i
		PL_FINISHGOAL = 15
		PL_1VS1 = 16
		PL_GETITEM = 17
		PL_WINSIDE = 18
		PL_PRISEGRADE = 19	
		PL_AVERAGEGRADE = 20
		PL_WINGRADE = 21	
		PL_PARAM1 = 22	-- Dïng ®Ó ghi l¹i täa ®é X cña l¸ cê
		PL_PARAM2 = 23	-- Dïng ®Ó ghi l¹i täa ®é Y cña l¸ cê
		PL_PARAM3 = 24	-- Dïng ®Ó ghi l¹i sè lÇn Tèng Kim
		PL_PARAM4 = 25
		PL_PARAM5 = 26
		PL_CURRANK = 27	-- =PL_PARAM6 = 27 -- BiÓu thÞ chøc vô hiÖn t¹i cña ng­êi ch¬i, hiÖn ®ang sö dông tham sè thø 6
		
		PL_BATTLEID=41
		PL_RULEID=42
		PL_BATTLECAMP = 43
		PL_BATTLESERIES = 44 -- Ghi l¹i sè thø tù trËn chiÕn mµ ng­êi ch¬i tham gia lÇn tr­íc
		PL_KEYNUMBER = 45
		PL_LASTDEATHTIME = 46
		PL_BATTLEPOINT = 47	-- Ghi l¹i tæng ®iÓm cña ng­êi ch¬i trong trËn chiÕn nµy, tæng ®iÓm lµ tæng ®iÓm cña c¸c trËn chiÕn mµ ng­êi ch¬i ®· tham gia, E(PL_TOTALPOINT1 + PL_TOTALPOINT2+ ...)
		PL_ROUND = 48
		
		GAME_KEY = 1
		GAME_BATTLEID = 2
		GAME_RULEID = 3
		GAME_MAPID = 4	
		GAME_CAMP1 = 5	-- Sè l­îng cê Tèng Kim (sè lÇn Tèng Kim)
		GAME_CAMP2 = 6	-- Sè l­îng cê Tèng Kim (sè lÇn Tèng Kim)
		GAME_MAPICONID = 7
		GAME_RESTTIME = 8
		GAME_LEVEL = 9 
		GAME_MODE = 10
		GAME_CAMP1AREA= 11
		GAME_CAMP2AREA= 12
		GAME_BATTLESERIES = 13
		GAME_ROUND = 14
		
		tbRANKNAME={"<color=white>Binh SÜ<color>", "<color=0xa0ff>HiÖu óy<color>", "<color=0xff>Thèng LÜnh<color>", "<color=yellow>Phã T­íng<color>", "<color=yellow><bclr=red>§¹i T­íng<bclr><color>" , "<color=black>Nguyªn So¸i<color>"}

		MS_STATE = 1
		
		MS_TRANK1_S = 30; -- MissionV ID cña NPC cÊp 1 phe Tèng
		MS_TRANK1_J = MS_TRANK1_S + 6; -- MissionV ID cña NPC cÊp 1 phe Kim					36
		MS_RANK1LVL_S = MS_TRANK1_J + 6; -- Level MissionV ID cña NPC cÊp 1 phe Tèng		42
		MS_RANK1LVL_J = MS_RANK1LVL_S + 6;-- Level MissionV ID cña NPC cÊp 1 phe Kim		48
		MS_NPCCOUNT1_S = MS_RANK1LVL_J + 6; --												54
		MS_NPCCOUNT1_J = MS_NPCCOUNT1_S + 6; --												60
		MS_CALLNPCCOUNT_S = MS_NPCCOUNT1_J + 6 -- Ghi l¹i sè lÇn triÖu håi NPC phe Tèng		66
		MS_CALLNPCCOUNT_J = MS_CALLNPCCOUNT_S + 1 -- Ghi l¹i sè lÇn triÖu håi NPC phe Kim	67
		
		MS_PL2RANK1_S = 70		-- NhiÖm vô hiÖn t¹i, sè l­îng ng­êi ®· trë thµnh "SÜ binh" phe Tèng
		MS_PL2RANK2_S = 71
		MS_PL2RANK3_S = 72
		MS_PL2RANK4_S = 73
		MS_PL2RANK5_S = 74
		MS_PL2RANK6_S = 75
	
		MS_PL2RANK1_J = 76		-- NhiÖm vô hiÖn t¹i, sè l­îng ng­êi ®· trë thµnh "SÜ binh" phe Kim
		MS_PL2RANK2_J = 77		-- HiÖu óy
		MS_PL2RANK3_J = 78		-- Thèng lÜnh
		MS_PL2RANK4_J = 79		-- Phã t­íng
		MS_PL2RANK5_J = 80		-- §¹i t­íng
		MS_PL2RANK6_J = 81		-- Nguyªn so¸i
	
		MS_HUANGZHIZHANG = 90  -- Sè Cóp nhËn ®­îc tõ ho¹t ®éng Hoµng Chi Ch­¬ng
		MS_WUXINGZHUCNT_S = 91 -- Ghi l¹i sè l­îng Trô Ngò Hµnh phe Tèng ®­îc triÖu håi	68
		MS_WUXINGZHUCNT_J = 92 -- Ghi l¹i sè l­îng Trô Ngò Hµnh phe Kim ®­îc triÖu håi	69
	
		MAX_CALLNPCCOUNT = 10;	
		MAX_CALLWUXINGZHU	= 4;
		GLB_BATTLESTATE = 30
		GLB_FORBIDBATTLE = 31;-- Khi gi¸ trÞ nµy lµ 1, biÓu thÞ viÖc khëi ®éng dõng trËn chiÕn
	-- Täa ®é ba ®iÓm b¸o danh
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
			Msg2Player("Xin h·y håi phôc ®Çy ®ñ sinh lùc, sau ®Êy h·y ra §¹i Doanh!");
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
 	-- 7 SÜ binh ng­êi ch¬i -- 7/3 HiÖu óy ng­êi ch¬i -- 14/15 Thèng lÜnh ng­êi ch¬i -- 21/25 Phã t­íng ng­êi ch¬i -- 14/25 §¹i t­íng ng­êi ch¬i -- 7/20 Nguyªn so¸i ng­êi ch¬i
 	
 	RANK_PKBONUS = {
 	{1,		6/5,	7/5,	8/5,	2	}, 
	{4/5,	1,		6/5,	7/5,	8/5	},
	{3/5,	4/5,	1,		6/5,	7/5	},
	{2/5,	3/5,	4/5,	1,		6/5	},
	{1/5,	2/5,	3/5,	4/5,	1	},
	};
	
	TAB_SERIESKILL =    -- Ghi l¹i xem ng­êi ch¬i ë c¸c **rank kh¸c nhau cã ghi l¹i b¶ng liªn tr¶m thùc tÕ khi PK hay kh«ng**, 1 lµ ghi l¹i, 0 lµ kh«ng ghi l¹i
	{
		{1,1,1,1,1},
		{1,1,1,1,1},
		{1,1,1,1,1},
		{0,1,1,1,1},
		{0,0,1,1,1},
	};
	
	BALANCE_MAMCOUNT = 5;	-- Chªnh lÖch sè ng­êi hai phe Tèng Kim ®iÒu chØnh thµnh 5 ng­êi
	BALANCE_GUOZHAN_MAXCOUNT = 100; -- Sè ng­êi tèi ®a cho phÐp cña mét bªn trong quèc chiÕn Tèng Kim
	TAB_RANKBONUS = {0, 1000, 3000, 6000,10000};
	RANK_SKILL = 661;
	TAB_RANKMSG = {
	"B¹n ®­îc phong lµ <color=white>Binh SÜ<color>!",
	"B¹n ®­îc phong lµ <color=0xff>HiÖu óy<color>! Sinh lùc t¨ng20%",
	"B¹n ®­îc phong lµ <color=0xff>Thèng LÜnh<color>! Sinh lùc t¨ng 30%, phßng thñ t¨ng 5%",
	"B¹n ®­îc phong lµ <color=yellow>Phã T­íng<color>! Sinh lùc t¨ng 40%, phßng thñ t¨ng 10% ",
	"B¹n ®­îc phong lµ <color=yellow><bclr=red>§¹i T­íng<bclr><color>! Sinh lùc t¨ng 50%, phßng thñ t¨ng 15%.",
	"B¹n ®­îc phong lµ <color=yellow>Nguyªn So¸i<color=>!"}
	
	TITLE_BONUSRANK1 = 0		-- Gi¸ trÞ ®iÓm cÇn thiÕt ®Ó trë thµnh chøc vô t­¬ng øng
	TITLE_BONUSRANK2 = 10000	-- HiÖu óy
	TITLE_BONUSRANK3 = 20000	-- Thèng lÜnh
	TITLE_BONUSRANK4 = 40000	-- Phã t­íng
	TITLE_BONUSRANK5 = 60000	-- §¹i t­íng
	TITLE_BONUSRANK6 = 80000	-- Nguyªn so¸i
	
	TITLE_PL2RANK1_N = 400		-- Sè ng­êi ch¬i tèi ®a cña chøc vô t­¬ng øng
	TITLE_PL2RANK2_N = 60		-- HiÖu óy
	TITLE_PL2RANK3_N = 25		-- Thèng lÜnh
	TITLE_PL2RANK4_N = 10		-- Phã t­íng
	TITLE_PL2RANK5_N = 5		-- §¹i t­íng
	TITLE_PL2RANK6_N = 1		-- Nguyªn so¸i

	TV_SERIESKILL_REALY = 2305  -- Gi¸ trÞ liªn tr¶m thùc tÕ hiÖn t¹i cña ng­êi ch¬i (GiÕt ng­êi ch¬i cÊp cao h¬n sÏ tÝnh liªn tr¶m, nh­ng kh«ng tÝnh liªn tr¶m thËt sù)

	
	tbGAME_SIGNMAP = {323, 324, 325} -- Ghi l¹i ID b¶n ®å cña c¸c ®iÓm b¸o danh theo cÊp ®é, s¾p xÕp cÊp ®é tõ thÊp ®Õn cao
	tbSIGNMAP_POS = {{1541, 3178} , {1570, 3085}}
	szGAME_GAMELEVEL = {"ChiÕn tr­êng S¬ cÊp", "ChiÕn tr­êng Trung cÊp", "ChiÕn tr­êng Cao cÊp"}
	
	tbBATTLEMAP = {44, 326, 327, 328, 329, 330, 331, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 868, 869, 870,876,877,878,879,880,881,883,884,885, 898, 899, 900, 902, 903, 904,970,971};--ËùÓÐÕ½ÒÛÓÃµ½µÄµØÍ¼ÁÐ±í
	tbNPCPOS = {"npcpos1", "npcpos2"}
	TNPC_DOCTOR1 = 55;	-- ID mÉu NPC cña Qu©n y
	TNPC_DOCTOR2 = 49;
	TNPC_SYMBOL1 = 629;
	TNPC_SYMBOL2 = 630;
	TNPC_DEPOSIT = 625;
	
	TNPC_FLAG0 = 626;
	TNPC_FLAG1 = 628;
	TNPC_FLAG2 = 627;

	TNPC_TRANSPORT1 = 55; -- ID mÉu NPC cña TruyÒn Tèng Quan
	TNPC_TRANSPORT2 = 49;
	
	
	tbTNPC_SOLDIER = {{631,632,633,634,635,636}, {637, 638, 639, 640, 641, 642}}
	BATTLES_WINGAME_POINT	= TONG_KIM_THUONG_THANG;	-- TÝch lòy nhËn ®­îc khi th¾ng
	BATTLES_LOSEGAME_POINT	= TONG_KIM_THUONG_THUA;		-- TÝch lòy nhËn ®­îc khi thua
	BATTLES_TIEGAME_POINT	= TONG_KIM_THUONG_HOA;		-- TÝch lòy nhËn ®­îc khi hßa

--¸ù¾Ý±¨ÃûµØÍ¼µÄid£¬»ñµÃËùÊôµÄÕ½ÒÛµÈ¼¶
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
	   		Msg2Player(strmsg..n_bonus.."<color> ®iÓm tÝch lòy) ")
			Say("§ît nµy b¹n nhËn ®­îc <color=yellow> "..n_bonus.."<color> ®iÓm tÝch lòy", 0)
		end
 		if (idx <= 0) then 
			break
		end;
	end
	PlayerIndex = OldPlayerIndex
end;

-- LÊy täa ®é cña mét ®iÓm b¸o danh cÊp ®é nµo ®ã
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
		
		
-- Dùa vµo b¶ng tËp hîp täa ®é trong file trapfile, t¹o ra tÊt c¶ c¸c ®iÓm bÉy (trap) vµ liªn kÕt víi scriptfile	
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

-- ChuyÓn ®æi chuçi täa ®é "123,234" thµnh hai biÕn sè: 123 vµ 234
function bt_str2xydata(str)
	m = strfind(str,",")
	x = tonumber(strsub(str,0,m-1))
	y = tonumber(strsub(str,m+1))
	return x,y
end

-- NgÉu nhiªn lÊy mét täa ®é tõ file täa ®é
function bt_getadata(file)
	local totalcount = GetTabFileHeight(file) - 1;
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

-- Dùa vµo b¶ng tËp hîp täa ®é trong file npcfile, t¹o ra tÊt c¶ c¸c NPC ®èi tho¹i cã ID mÉu lµ tnpc_id vµ liªn kÕt víi scriptfile		
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

-- Dùa vµo b¶ng tËp hîp täa ®é trong file npcfile, t¹o ra tÊt c¶ c¸c NPC chiÕn ®Êu cã ID mÉu lµ tnpc_id
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


-- Dùa vµo b¶ng tËp hîp täa ®é trong file npcfile, ngÉu nhiªn t¹o ra c¸c NPC chiÕn ®Êu cã ID mÉu lµ tnpc_id
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
	WriteLog("Lçi!!! DelNpc muèn xãa bá mét gamer ");
	return
end;

DelNpc(nNpcIndex)
end;


-------------------------------------------------------------------------
-- Camp biÓu thÞ chñ qu¶n ®èi tho¹i thuéc phe nµo, 1 lµ Tèng, 2 lµ Kim
-- NÕu b»ng 1 nghÜa lµ ®· b¸o danh trong trËn chiÕn nµy, vµ thuéc vÒ phe nµy
-- NÕu b»ng 2 nghÜa lµ ®· b¸o danh trong trËn chiÕn nµy, nh­ng kh«ng thuéc vÒ phe nµy
-- NÕu b»ng 0 nghÜa lµ ch­a b¸o danh

function bt_checklastbattle(Camp)

local MKey = BT_GetGameData(GAME_KEY); --µ±Ç°Õ½ÒÛµÄÎ¨Ò»KeyÂë
local BattleId = BT_GetGameData(GAME_BATTLEID); --¸ÃÕ½ÒÛÀàÐÍµÄID
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
-- 701 ®· bÞ chiÕm dông, v× vËy ®· ®æi sang 751
BT_SetType2Task(1, 751)
for i = 2, 50 do 
	BT_SetType2Task(i, 700 + i);
end
end
--------------------------------------------------------------------------
-- T¸ch chuçi theo dÊu ph©n c¸ch, tr¶ vÒ mét m¶ng chøa c¸c phÇn ®· t¸ch
-- VÝ dô 1: strsplit( "abc,bcd,efg", "," ) -> { "abc", "bcd", "efg" }
-- VÝ dô 2: strsplit( ",abc,,bcd,,,efg,,", ",," ) -> { ",abc", "bcd", ",efg" }
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
					Msg2MSAll(MISSIONID, "Phong V©n LuËn KiÕm b¸o c¸o: Nguyªn So¸i qu©n Tèng ®· xuÊt hiÖn!");
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
					Msg2MSAll(MISSIONID, "Phong V©n LuËn KiÕm b¸o c¸o: Nguyªn So¸i qu©n Kim ®· xuÊt hiÖn!");
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
	
	-- Khi b¾t ®Çu, SÜ binh phe Tèng xuÊt hiÖn toµn bé mét lÇn
	npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[2]);
	bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S), GetMissionV(MS_RANK1LVL_S), 1, GetMissionV(MS_NPCCOUNT1_S), tabFILE_NPCDEATH[1], 0)
	
	-- Khi b¾t ®Çu, SÜ binh phe Kim xuÊt hiÖn toµn bé mét lÇn
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
	-- NÕu kh«ng ph¶i ngµy TK Thiªn Tö th× dïng mÆt n¹ b×nh th­êng
	if nWeekDay ~= 2 and nWeekDay ~= 4 and nWeekDay ~= 6 then
		point = BigBoss:AddSongJinPoint(point);	
		point = TB_QIANQIU_YINGLIE0904:add_sj_point(point);
		point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
	else
	-- NÕu lµ ngµy TK Thiªn Tö th× chØ dïng mÆt n¹ ®­îc ë c¸c trËn TK th­êng (ko ph¶i 21:00)
		local nHour = tonumber(GetLocalDate("%H%M"))
		--DinhHQ
		--20110406: kh«ng kÝch ho¹t hiÖu øng x2 x3 ®iÓm khi sö dông mÆt n¹ trong TK Thiªn tö (21:00)
		if( nHour < 2045 or nHour >= 2250)then
			point = BigBoss:AddSongJinPoint(point);	
			point = TB_QIANQIU_YINGLIE0904:add_sj_point(point);
			point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
		end
	end
	-- §iÒu chØnh mÆt n¹ anh hïng chiÕn tr­êng
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
	
	-- KiÓm tra ®iÓm tÝch lòy
	if BT_GetData(PL_BATTLEPOINT) > 1000000 then
		
		local szName		= GetName();					-- Tªn nh©n vËt
		local nGameLevel 	= BT_GetGameData(GAME_LEVEL);	-- CÊp ®é Tèng Kim
		local nSubWorldID 	= SubWorldIdx2ID();				-- ID b¶n ®å

		local nAddPoint		= point;						-- §iÓm tÝch lòy ®­îc thªm vµo lÇn nµy
		local nTotalPoint	= BT_GetData(PL_TOTALPOINT);	-- §iÓm tÝch lòy trËn nµy
		local nBattlePoint	= BT_GetData(PL_BATTLEPOINT);	-- §iÓm tÝch lòy nh©n vËt
		local nKillPlayer	= BT_GetData(PL_KILLPLAYER);	-- Sè ng­êi bÞ giÕt
		
		WriteLog(format("Warning[Too Much Battle Point] %s in Level_%d Battle(%d) want to add %d Ponit. Now Total Point is %d, Battle Point is %d, Kill %d Players!", 
			szName, nGameLevel, nSubWorldID, nAddPoint, nTotalPoint, nBattlePoint, nKillPlayer));
	end
	

	BT_SetData(PL_TOTALPOINT, BT_GetData(PL_TOTALPOINT) + point)
	BT_SetData(PL_BATTLEPOINT, BT_GetData(PL_BATTLEPOINT) + point)
	
	bt_JudgePLAddTitle()
	--Storm ¼Ó»ý·Ö
	storm_addpoint(1, point)
	return point
end

function bt_assignrank(camp)-- Chøc n¨ng nµy ®· v« hiÖu
	camptab={}
	--Çå³ýµ±Ç°µÄ¹ÙÎ»Êý¾Ý
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
--------------------------TÝnh to¸n hÖ sè ®iÓm, ®Æt l¹i ®iÓm---------------------------------------
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
	
	-- Quèc chiÕn Tèng Kim bá qua c©n b»ng hai phe
	if BT_GetGameData(GAME_BATTLEID) == 2 then
		bonuscff1 = 1
		bonuscff2 = 1
	end
	
	-- NÕu vµo buæi tèi ®ang trong ho¹t ®éng Hoµng Chi Ch­¬ng, tÝch lòy sÏ ®­îc nh©n ®«i
	bonuscff1 = bonuscff1 * bt_getgn_awardtimes()
	bonuscff2 = bonuscff2 * bt_getgn_awardtimes()

	-- X2 ®iÓm mçi ngµy vµ X4 vµo thø 7 by Anh Quach - 21/06/2025
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

---------------------Khi vµo chiÕn tr­êng sÏ g¸n chøc vô t­¬ng øng cho ng­êi ch¬i BEGIN------------------------------------------
function bt_JudgePLAddTitle()
-- LÊy Rank hiÖn t¹i. NÕu ®iÓm ®¹t yªu cÇu cña Rank cÊp tiÕp theo th× g¸n Rank ®ã cho ng­êi ch¬i. NÕu gi¸ trÞ Rank ®· ®¹t giíi h¹n trªn th× kh«ng céng thªm.
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

-- G¸n chøc vô
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

-------------------------Khi vµo chiÕn tr­êng sÏ g¸n chøc vô t­¬ng øng cho ng­êi ch¬i ENDING----------------------------------


function bt_autoselectmaparea(mapfile,areacount)		-- NgÉu nhiªn chän mét ®Þa ®iÓm trong b¶n ®å, lµ khu vùc c¨n cø cña c¶ hai phe
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
		local base_exp = (( 700 + floor(( level - 40 ) / 5 ) * 100 ) * 60 * 7 / 3000 );	-- Gi¸ trÞ kinh nghiÖm c¬ b¶n cña 1 ®iÓm tÝch lòy
		local bonus = floor( mark * base_exp )
		
		-- Tèng Kim ®iÒu chØnh bëi BÝ tÞch 120 27/07/09
		if (level >= 120) then
			bonus = floor( bonus * 2.5 * 2 )
		end
		
		return bonus
end
-- ChuyÓn ®æi gi©y thµnh phót vµ gi©y, vÝ dô: 62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;

function bt_pop2signmap()	-- Kh«ng cho phÐp ng­êi ch¬i ë l¹i hËu cø qu¸ 5 phót. Trong chÕ ®é §å S¸t vµ chÕ ®é Nguyªn So¸i, chÕ ®é S¸t Lôc sÏ kh«ng xö lý v× sau 2 phót ng­êi ch¬i sÏ bÞ nÐm ra chiÕn tr­êng.
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
			SetFightState(0)		-- Sau khi ®¸nh xong qu¸i th× chuyÓn sang tr¹ng th¸i kh«ng chiÕn ®Êu (by Dan_Deng)
			SetPunish(1)
			ForbidChangePK(0);
			SetPKFlag(0)
			Msg2Player("Thêi gian l­u l¹i trong Doanh tr¹i ®· v­ît qu¸ 5 phót, b¹n bÞ ®Èy ra chiÕn tuyÕn")
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
		--20110409: kh«ng kÝch ho¹t hiÖu øng x4 ®iÓm tÝch lòy cña TK Thiªn Tö trong c¸c giê TK th­êng
		-- NghÜa lµ chØ kÝch ho¹t hiÖu øng x4 trong giê TK Thiªn Tö (21:00)
		if( nHour >= 2045 and nHour < 2250)then
			return 4
		end
	end
	-- KiÓm tra Hoµng Chi Ch­¬ng
	-- MS_HUANGZHIZHANG = hÖ sè x tõ ho¹t ®éng Hoµng Chi Ch­¬ng
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

--- B¾t ®Çu thªm míi
-- B¶ng xÕp h¹ng ®iÓm Tèng Kim Vinh Dù, chØ dµnh cho Tèng Kim cÊp cao
-- Khi mçi trËn ®Êu kÕt thóc, ngay lËp tøc thèng kª thø h¹ng vµ ®iÓm trong chiÕn b¸o,
-- L­u tr÷ trong thèng kª chiÕn ®éi (LEAGUERESULT) cïng víi xÕp h¹ng thµnh tÝch hiÖn cã, gi÷ l¹i 10 thø h¹ng ®Çu
-- CËp nhËt b¶ng xÕp h¹ng (b¶ng xÕp h¹ng Phong V©n 10250), theo thø h¹ng
-- Vµo 23 giê Chñ NhËt hµng tuÇn, l­u kÕt qu¶ xÕp h¹ng chiÕn ®éi (top 5) vµo b¶ng xÕp h¹ng (10239) ®Ó ph¸t th­ëng
-- §ång thêi, xãa thµnh tÝch trong thèng kª chiÕn ®éi (LEAGUERESULT)
-- 2545
 LG_SONGJINHONOUR = 535;
 LG_TSK_HONOURPOINT = 1;
 LG_TSK_TOTALPOINT = 2;
 LG_TSK_SECT = 3;	-- M«n ph¸i
 LG_TSK_GENDER = 4; -- Giíi tÝnh
function bt_sortbthonour()
	-- KÕt qu¶ lÇn nµy
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
	
	bt_reportworldresult(tbCurPlayer);	-- C«ng bè thµnh tÝch xÕp h¹ng lÇn nµy ra thÕ giíi (tÊt c¶ c¸c m¸y chñ)
	
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
	
	-- ChÌn vµo kÕt qu¶ tr­íc ®ã
	for i = 1, getn(tbCurPlayer) do
		local nlg_idx = LG_GetLeagueObj(LG_SONGJINHONOUR, tbCurPlayer[i][1]);
		if (nlg_idx == nil or nlg_idx == 0) then	-- NÕu kh«ng cã th× t¹o míi, kh«ng xÕp h¹ng l¹i
			if (bt_createleague(tbCurPlayer[i][1]) == 1) then	-- T¹o thµnh c«ng
				LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_HONOURPOINT, tbCurPlayer[i][2]);
				LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_TOTALPOINT, tbCurPlayer[i][3]);
				LG_ApplySetLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_SECT, tbCurPlayer[i][4]);
				LG_ApplySetLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_GENDER, tbCurPlayer[i][5]);
			end;
		else										-- NÕu tån t¹i th× tÝch lòy
			LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_HONOURPOINT, tbCurPlayer[i][2]);
			LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_TOTALPOINT, tbCurPlayer[i][3]);
		end;
	end;
	
	Ladder_ClearLadder(10250);	-- Xãa b¶ng xÕp h¹ng

	if (getn(tbNewPlayer) >= 1) then
		sort(tbNewPlayer, bt_sortmaxhonour);
		for i = 1, 10 do			-- ViÕt l¹i b¶ng xÕp h¹ng
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
	local nNewLeagueID = LG_CreateLeagueObj()	-- T¹o ®èi t­îng d÷ liÖu bang héi (tr¶ vÒ ID ®èi t­îng)
	LG_SetLeagueInfo(nNewLeagueID, LG_SONGJINHONOUR, szlgname)	-- ThiÕt lËp th«ng tin bang héi (lo¹i, tªn)
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
	
		local szParam = "Phong V©n LuËn KiÕm cao cÊp ®· kÕt thóc, Top"..ncount.." gåm: <enter>";
		for i = 1, ncount do
			if (tbPlayer[i][1]) then
				szParam = format("%s   XÕp h¹ng %d <color=green>%s<color>  %d<enter>",
				szParam,i,safeshow(tbPlayer[i][1]),tbPlayer[i][3]);
			end;
		end;
		LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szParam , "", "")
	end;
end
---ÐÂ¼ÓÈëEnd


-- by zero 2007-7-30 Tr¶ vÒ tû lÖ c©n b»ng ®iÓm: Tèng, Kim
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


-- HiÓn thÞ th«ng tin xÕp h¹ng c¸c lo¹i cña chiÕn tr­êng theo thêi gian thùc bëi SÜ L·ng ThÊt TÞch 27/07/09
function bt_announce (lsf_level, n_time)
	
	-- Mçi 10 phót (30 lÇn * c¸ch nhau 20 gi©y) c«ng bè mét lÇn th«ng tin
	if (mod(n_time, 30) ~= 0) then
		return
	end
	
	-- ChØ c«ng bè th«ng tin chiÕn tr­êng cÊp cao
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
	
	-- B¶ng xÕp h¹ng liªn tr¶m
	tbPlayer = {};
	battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_SER);
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("Top liªn tr¶m", nStrLen_Total));
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", nStrLen_Sort_Title)..strfill_center("Tªn", nStrLen_Name_Title)..strfill_center("Phe ph¸i", nStrLen_Camp_Title)..strfill_center("Liªn tr¶m", nStrLen_Score_Title));
	for i = 1, 5 do
		if tbPlayer[i] and tbPlayer[i] > 0 then
			PlayerIndex = tbPlayer[i];
			local szname, npoint = GetName(), BT_GetData(PL_MAXSERIESKILL);
			local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "Vµng (T)" or "TÝm (K)";
			if (szname and szname ~= "") then
				Msg2MSAll(MISSIONID, strfill_center(tostring(i), nStrLen_Sort_Text)..strfill_center(szname, nStrLen_Name_Text)..strfill_center(szCamp, nStrLen_Camp_Text)..strfill_center(tostring(npoint), nStrLen_Score_Text));
			end
		end
	end
	
	-- B¶ng xÕp h¹ng ng­êi ch¬i PK
	tbPlayer = {};
	battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_PK);
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("TOP PK", nStrLen_Total));
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", nStrLen_Sort_Title)..strfill_center("Tªn", nStrLen_Name_Title)..strfill_center("Phe ph¸i", nStrLen_Camp_Title)..strfill_center("PK", nStrLen_Score_Title));
	for i = 1, 5 do 
		if tbPlayer[i] and tbPlayer[i] > 0 then
			PlayerIndex = tbPlayer[i];
			local szname, npoint = GetName(), BT_GetData(PL_KILLPLAYER);
			local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "Vµng (T)" or "TÝm (K)";
			if (szname and szname ~= "") then
				Msg2MSAll(MISSIONID, strfill_center(tostring(i), nStrLen_Sort_Text)..strfill_center(szname, nStrLen_Name_Text)..strfill_center(szCamp, nStrLen_Camp_Text)..strfill_center(tostring(npoint), nStrLen_Score_Text));
			end
		end
	end
	
	-- B¶ng xÕp h¹ng h¹ gôc NPC chØ chÕ ®é Nguyªn So¸i B¶o VÖ
	if (MISSIONID == 16) then
		tbPlayer = {};
		battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_NPC);
		Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("TOP NPC", nStrLen_Total));
		Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", nStrLen_Sort_Title)..strfill_center("Tªn", nStrLen_Name_Title)..strfill_center("Phe ph¸i", nStrLen_Camp_Title)..strfill_center("NPC", nStrLen_Score_Title));
		for i = 1, 5 do 
			if tbPlayer[i] and tbPlayer[i] > 0 then
				PlayerIndex = tbPlayer[i];
				local szname, npoint = GetName(), BT_GetData(PL_KILLNPC);
				local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "Vµng (T)" or "TÝm (K)";
				if (szname and szname ~= "") then
					Msg2MSAll(MISSIONID, strfill_center(tostring(i), nStrLen_Sort_Text)..strfill_center(szname, nStrLen_Name_Text)..strfill_center(szCamp, nStrLen_Camp_Text)..strfill_center(tostring(npoint), nStrLen_Score_Text));
				end
			end
		end
	end
	
	
	PlayerIndex = old_player;
end