---------------------------------------------------------------------------------
-- File name    : env.lua
-- Author       : Anh Quach
-- Date         : 07-06-2025
-- Description  : Quy ��nh c�c bi�n d�ng chung cho c� server
---------------------------------------------------------------------------------
--  //////////////////////////////////////////////////////////////
-- //                          Admin                           //
--//////////////////////////////////////////////////////////////
GM_DANH_SACH = { 
	["matdecha"] =
        { 
            "Administrator"
        },
	["matdecha2"] =
        { 
            "Test5Doc"
        },
    ["1"] =
        { 
            "test5d",
            "test01"
        },
    ["2"] =
        { 
            "test02"
        },
    ["3"] =
        { 
            "test03"
        }
}

MOD_DANH_SACH = { 
	["matdecha3"] =
        { 
            "Mod001"
        }
}

--  //////////////////////////////////////////////////////////////
-- //                        T�nh n�ng                         //
--//////////////////////////////////////////////////////////////
LEVEL_KHOI_TAO_NHAN_VAT = 0
KY_TRAN_CAC_MO = 0


--  //////////////////////////////////////////////////////////////
-- //                         V��t �i                          //
--//////////////////////////////////////////////////////////////
VUOT_AI_THANH_VIEN  = 1
VUOT_AI_LV_MIN      = 50
VUOT_AI_TIEN        = 10000 -- 1 v�n
VUOT_AI_LIMIT_NGAY  = 1

--  //////////////////////////////////////////////////////////////
-- //                          D� T�u                          //
--//////////////////////////////////////////////////////////////
DA_TAU_LV_MIN = 30
DA_TAU_EXP_10 = 1000000
DA_TAU_EXP_20 = 2000000
DA_TAU_EXP_30 = 3000000
DA_TAU_EXP_40 = 10000000

--  //////////////////////////////////////////////////////////////
-- //                         Th�m C�u                         //
--//////////////////////////////////////////////////////////////
THAM_CAU_O_VAN      = 1500
THAM_CAU_XICH_THO   = 1800
THAM_CAU_TUYET_ANH  = 1500
THAM_CAU_DICH_LO    = 1500
THAM_CAU_CHIEU_DA   = 2000

--  //////////////////////////////////////////////////////////////
-- //                        T�ng Kim                          //
--//////////////////////////////////////////////////////////////
TONG_KIM_ANTI_TRUNG_IP            = 1       -- Ch�a ho�t ��ng
TONG_KIM_THOI_GIAN_BAO_DANH       = 10      -- G�c = 10
TONG_KIM_THOI_GIAN_CHIEN_DAU      = 60      -- G�c = 60
TONG_KIM_THOI_GIAN_CHIEN_BAO      = 20      -- G�c = 20
TONG_KIM_PHI_BAO_DANH             = 3000    -- L��ng
TONG_KIM_TY_LE_TICH_LUY_EXP       = 500
TONG_KIM_THUONG_THANG             = 1200
TONG_KIM_THUONG_THUA              = 600
TONG_KIM_THUONG_HOA               = 900
TONG_KIM_TSK_LIMIT_EXP_NGAY_DATE  = 1900
TONG_KIM_TSK_LIMIT_EXP_NGAY_VALUE = 1901
TONG_KIM_LIMIT_EXP_TUAN  = {
    [0] = 70000000,
    [3] = 70000000,
    [4] = 70000000,
}
TONG_KIM_LIMIT_EXP_NGAY  = {
    [0] = 10000000,
    [3] = 10000000,
    [4] = 10000000,
}
TONG_KIM_LE_BAO_AWARD = {
    {szName = "Khi�u chi�n L� bao", tbProp = {6,1,2006,1,1,0}, nRate = 50},
    {szName = "Th�n b� kho�ng th�ch", tbProp = {6,1,398,1,0,0}, nRate = 0.05},
    {szName = "T� Th�y Tinh", tbProp = {4,239,1,1,1,0}, nRate = 0.2},
    {szName = "L�c Th�y Tinh", tbProp = {4,240,1,1,1,0}, nRate = 0.2},
    {szName = "Lam Th�y Tinh", tbProp = {4,238,1,1,1,0}, nRate = 0.2},
    {szName = "Tinh H�ng B�o Th�ch", tbProp = {4,353,1,1,1,0}, nRate = 0.5},
    {szName = "B�ch Ch�n ��n", tbProp = {6,1,1676,1,0,0}, nRate = 0.03, tbParam = {500000000}},
    {szName = "Huy�t Ch�n ��n", tbProp = {6,1,1677,1,0,0}, nRate = 0.02, tbParam = {1000000000}},
    {szName = "Huy�n Ch�n ��n", tbProp = {6,1,1678,1,0,0}, nRate = 0.01, tbParam = {1500000000}},
    {szName = "An Bang B�ng Tinh Th�ch H�ng Li�n", nQuality=1, tbProp = {0,164}, nRate = 0.01},
    {szName = "An Bang K� Huy�t Th�ch Gi�i Ch� ", nQuality=1, tbProp = {0,167}, nRate = 0.02},
    {szName = "An Bang C�c Hoa Th�ch Ch� ho�n", nQuality=1, tbProp = {0,165}, nRate = 0.02},
    {szName = "An Bang �i�n Ho�ng Th�ch Ng�c B�i", nQuality=1, tbProp = {0,166}, nRate = 0.02},
    {szName = "Hai tr�m v�n �i�m kinh nghi�m", nExp = 2000000, nRate = 48.72},
}
TONG_KIM_THUONG_TOP_GIO_BAT_DAU     = 2049
TONG_KIM_THUONG_TOP_GIO_KET_THUC    = 2201
TONG_KIM_THUONG_TOP10_BAT           = 1
TONG_KIM_THUONG_TOP10_T7_BAT        = 1
TONG_KIM_THUONG_TOP10 = {
    [1]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=30},
    },
    [2]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=30},
    },
    [3]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=30},
    },
    [4]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=30},
    },
    [5]={		             
        {szName="Ti�n ��ng",tbProp={4,417},nCount=30},
    },
    [6]={		             
        {szName="Ti�n ��ng",tbProp={4,417},nCount=30},
    },
    [7]={		             
        {szName="Ti�n ��ng",tbProp={4,417},nCount=30},
    },
    [8]={		             
        {szName="Ti�n ��ng",tbProp={4,417},nCount=30},
    },
    [9]={		             
        {szName="Ti�n ��ng",tbProp={4,417},nCount=30},
    },
    [10]={		             
        {szName="Ti�n ��ng",tbProp={4,417},nCount=30},
    }
}
TONG_KIM_THUONG_TOP10_T7 = {
    [1]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=100},
    },
    [2]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=100},
    },
    [3]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=100},
    },
    [4]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=100},
    },
    [5]={		             
        {szName="Ti�n ��ng",tbProp={4,417},nCount=100},
    },
    [6]={		             
        {szName="Ti�n ��ng",tbProp={4,417},nCount=100},
    },
    [7]={		             
        {szName="Ti�n ��ng",tbProp={4,417},nCount=100},
    },
    [8]={		             
        {szName="Ti�n ��ng",tbProp={4,417},nCount=100},
    },
    [9]={		             
        {szName="Ti�n ��ng",tbProp={4,417},nCount=100},
    },
    [10]={		             
        {szName="Ti�n ��ng",tbProp={4,417},nCount=100},
    }
}
TONG_KIM_THUONG_TOP3_BAT = 1
TONG_KIM_THUONG_TOP3 = {
    [1]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=20},
        {szName="�i�m kinh nghi�m", nExp = 3000000, nCount = 1},
        {szName="Ng�n l��ng", nJxb = 3000000, nCount = 1},
    },
    [2]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=20},
        {szName="�i�m kinh nghi�m", nExp = 2000000, nCount = 1},
        {szName="Ng�n l��ng", nJxb = 2000000, nCount = 1},
    },
    [3]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=20},
        {szName="�i�m kinh nghi�m", nExp = 1000000, nCount = 1},
        {szName="Ng�n l��ng", nJxb = 1000000, nCount = 1},
    }
}

--  //////////////////////////////////////////////////////////////
-- //                     Phong L�ng ��                        //
--//////////////////////////////////////////////////////////////
PHONG_LANG_DO_MO = 1

--  //////////////////////////////////////////////////////////////
-- //                     Nhi�p Nh� Tr�n                       //
--//////////////////////////////////////////////////////////////
BOSS_ST_LIMIT_NGAY = 8