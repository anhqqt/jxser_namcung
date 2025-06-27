-- PhÇn th­ëng ¶i Èn
VUOT_AI_THUONG_AI_AN = {
	100000,
	{0.01, 	{"Vâ L©m MËt TÞch ", 		6, 1, 26, 1, 0, 0}},
	{0.01, 	{"TÈy Tñy Kinh ",			6, 1, 22, 1, 0, 0}},
	{0.14, 	{"Phóc Duyªn Lé (§¹i) ",	6, 1, 124, 1, 0, 0}},
	{0.14, 	{"Phóc Duyªn Lé (Trung) ", 	6, 1, 123, 1, 0, 0}},
	{0.14, 	{"Phóc Duyªn Lé (TiÓu) ",	6, 1, 122, 1, 0, 0}},
    {0.14, 	{"QuÕ Hoa Töu ",			6, 1, 125, 1, 0, 0}},
	{0.14, 	{"Tiªn Th¶o Lé ",			6, 1, 71, 1, 0, 0}},
	{0.14, 	{"Thiªn s¬n B¶o Lé ",		6, 1, 72, 1, 0, 0}},
	{0.14, 	{"B¸ch Qu¶ Lé ",			6, 1, 73, 1, 0, 0}},
}

-- PhÇn th­ëng ¶i "TiÓu NhiÕp NhÝ TrÇn"
VUOT_AI_THUONG_AI_TIEU_NHIEP_NHI_TRAN_EXP = 10000000

-- PhÇn th­ëng ¶i Cao CÊp (¶i 30)
VUOT_AI_THUONG_AI_30_EXP = {			
    {szName="§iÓm Kinh NghiÖm",nExp = 20000000},
}
VUOT_AI_THUONG_AI_30_ITEM = {
	[1]={{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.5},},
	[2]={{szName="§å Phæ Kim ¤ Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.5},},
	[3]={{szName="§å Phæ Kim ¤ Hµi",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.5},},
	[4]={{szName="§å Phæ Kim ¤ Yªu §¸i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.5},},
	[5]={{szName="§å Phæ Kim ¤ Hé UyÓn",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.5},},
	[6]={{szName="§å Phæ Kim ¤ H¹ng Liªn",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.5},},
	[7]={{szName="§å Phæ Kim ¤ Béi",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.5},},
	[8]={{szName="§å Phæ Kim ¤ Th­îng Giíi",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.3},},
	[9]={{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.3},},
	[10]={{szName="§å Phæ Kim ¤ KhÝ Giíi",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.2},},
	[11]={{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2},},
	[12]={{szName="B¶o R­¬ng Kim ¤ Kh«i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.01, CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¶o R­¬ng Kim ¤ Kh«i") end},},
	[13]={{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.013, CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¶o R­¬ng Kim ¤ Th­îng Giíi") end},},
	[14]={{szName="B¶o R­¬ng Kim ¤ Hµi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.01, CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¶o R­¬ng Kim ¤ Hµi") end},},
	[15]={{szName="B¶o R­¬ng Kim ¤ Yªu §¸i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.0125, CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¶o R­¬ng Kim ¤ Yªu §¸i") end},},
	[16]={{szName="B¶o R­¬ng Kim ¤ Hé UyÓn",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.008, CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¶o R­¬ng Kim ¤ Hé UyÓn") end},},
	[17]={{szName="§å Phæ B¹ch Hæ Kh«i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.2},},
	[18]={{szName="§å Phæ B¹ch Hæ Béi",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.2},},
	[19]={{szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.05},},
	[20]={{szName="Long HuyÕt Hoµn",tbProp={6,1,2117,1,0,0},nCount=1,nRate=3,nExpiredTime=20160},},
	[21]={{szName="S¸t Thñ Gi¶n lÔ hép",tbProp={6,1,2339,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
	[22]={{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=8,nExpiredTime=20160},},
	[23]={{szName="Thiªn Long LÖnh",tbProp={6,1,2256,1,0,0},nCount=1,nRate=7.5},},
}