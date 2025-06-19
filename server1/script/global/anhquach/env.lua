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
            "test5d"
        },
    ["2"] =
        { 
            "testhd"
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
TONG_KIM_TY_LE_TICH_LUY_EXP       = 500
TONG_KIM_TSK_LIMIT_EXP_NGAY_DATE  = 1900
TONG_KIM_TSK_LIMIT_EXP_NGAY_VALUE = 1901
TONG_KIM_THUONG_THANG             = 1200
TONG_KIM_THUONG_THUA              = 600
TONG_KIM_THUONG_HOA               = 900

--  //////////////////////////////////////////////////////////////
-- //                     Phong L�ng ��                        //
--//////////////////////////////////////////////////////////////
PHONG_LANG_DO_MO = 1