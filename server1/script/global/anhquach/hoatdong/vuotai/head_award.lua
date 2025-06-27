-- Ph�n th��ng �i �n
VUOT_AI_THUONG_AI_AN = {
	100000,
	{0.01, 	{"V� L�m M�t T�ch ", 		6, 1, 26, 1, 0, 0}},
	{0.01, 	{"T�y T�y Kinh ",			6, 1, 22, 1, 0, 0}},
	{0.14, 	{"Ph�c Duy�n L� (��i) ",	6, 1, 124, 1, 0, 0}},
	{0.14, 	{"Ph�c Duy�n L� (Trung) ", 	6, 1, 123, 1, 0, 0}},
	{0.14, 	{"Ph�c Duy�n L� (Ti�u) ",	6, 1, 122, 1, 0, 0}},
    {0.14, 	{"Qu� Hoa T�u ",			6, 1, 125, 1, 0, 0}},
	{0.14, 	{"Ti�n Th�o L� ",			6, 1, 71, 1, 0, 0}},
	{0.14, 	{"Thi�n s�n B�o L� ",		6, 1, 72, 1, 0, 0}},
	{0.14, 	{"B�ch Qu� L� ",			6, 1, 73, 1, 0, 0}},
}

-- Ph�n th��ng �i "Ti�u Nhi�p Nh� Tr�n"
VUOT_AI_THUONG_AI_TIEU_NHIEP_NHI_TRAN_EXP = 10000000

-- Ph�n th��ng �i Cao C�p (�i 30)
VUOT_AI_THUONG_AI_30_EXP = {			
    {szName="�i�m Kinh Nghi�m",nExp = 20000000},
}
VUOT_AI_THUONG_AI_30_ITEM = {
	[1]={{szName="�� Ph� Kim � Kh�i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.5},},
	[2]={{szName="�� Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.5},},
	[3]={{szName="�� Ph� Kim � H�i",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.5},},
	[4]={{szName="�� Ph� Kim � Y�u ��i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.5},},
	[5]={{szName="�� Ph� Kim � H� Uy�n",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.5},},
	[6]={{szName="�� Ph� Kim � H�ng Li�n",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.5},},
	[7]={{szName="�� Ph� Kim � B�i",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.5},},
	[8]={{szName="�� Ph� Kim � Th��ng Gi�i",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.3},},
	[9]={{szName="�� Ph� Kim � H� Gi�i",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.3},},
	[10]={{szName="�� Ph� Kim � Kh� Gi�i",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.2},},
	[11]={{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2},},
	[12]={{szName="B�o R��ng Kim � Kh�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.01, CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�o R��ng Kim � Kh�i") end},},
	[13]={{szName="B�o R��ng Kim � Th��ng Gi�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.013, CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�o R��ng Kim � Th��ng Gi�i") end},},
	[14]={{szName="B�o R��ng Kim � H�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.01, CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�o R��ng Kim � H�i") end},},
	[15]={{szName="B�o R��ng Kim � Y�u ��i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.0125, CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�o R��ng Kim � Y�u ��i") end},},
	[16]={{szName="B�o R��ng Kim � H� Uy�n",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.008, CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�o R��ng Kim � H� Uy�n") end},},
	[17]={{szName="�� Ph� B�ch H� Kh�i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.2},},
	[18]={{szName="�� Ph� B�ch H� B�i",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.2},},
	[19]={{szName="B�ch H� L�nh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.05},},
	[20]={{szName="Long Huy�t Ho�n",tbProp={6,1,2117,1,0,0},nCount=1,nRate=3,nExpiredTime=20160},},
	[21]={{szName="S�t Th� Gi�n l� h�p",tbProp={6,1,2339,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
	[22]={{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=8,nExpiredTime=20160},},
	[23]={{szName="Thi�n Long L�nh",tbProp={6,1,2256,1,0,0},nCount=1,nRate=7.5},},
}