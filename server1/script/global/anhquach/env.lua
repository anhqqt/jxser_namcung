---------------------------------------------------------------------------------
-- File name    : env.lua
-- Author       : Anh Quach
-- Date         : 07-06-2025
-- Description  : Quy ��nh c�c bi�n d�ng chung cho c� server
---------------------------------------------------------------------------------
-- Th�m bi�n d�ng cho ho�t ��ng
Include("\\script\\global\\anhquach\\hoatdong\\tongkim\\head.lua")
Include("\\script\\global\\anhquach\\hoatdong\\tongkim\\head_award.lua")
Include("\\script\\global\\anhquach\\hoatdong\\vuotai\\head_award.lua")
--
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
VUOT_AI_THANH_VIEN                = 1
VUOT_AI_LV_MIN                    = 50
VUOT_AI_PHI_BAO_DANH                      = 10000 -- 1 v�n
VUOT_AI_LIMIT_NGAY                = 20
VUOT_AI_DIEU_KIEN_AI_AN           = 20    -- G�c = 20 ph�t
VUOT_AI_DIEU_KIEN_AI_30           = 13    -- G�c = 13 ph�t
VUOT_AI_TY_LE_EXP_KET_THUC        = 9     -- T� l� EXP nh�n ���c khi k�t th�c V��t �i. G�c = 1
VUOT_AI_TY_LE_EXP_TUNG_AI         = 1     -- T� l� EXP nh�n ���c khi k�t th�c t�ng �i l�. G�c = 1
VUOT_AI_THOI_GIAN_BAO_DANH        = 10    -- G�c = 10 ph�t

--  //////////////////////////////////////////////////////////////
-- //                          D� T�u                          //
--//////////////////////////////////////////////////////////////
DA_TAU_LV_MIN                     = 30
DA_TAU_EXP_10                     = 1000000
DA_TAU_EXP_20                     = 2000000
DA_TAU_EXP_30                     = 3000000
DA_TAU_EXP_40                     = 10000000

--  //////////////////////////////////////////////////////////////
-- //                         Th�m C�u                         //
--//////////////////////////////////////////////////////////////
THAM_CAU_O_VAN                    = 1500
THAM_CAU_XICH_THO                 = 1800
THAM_CAU_TUYET_ANH                = 1500
THAM_CAU_DICH_LO                  = 1500
THAM_CAU_CHIEU_DA                 = 2000

--  //////////////////////////////////////////////////////////////
-- //                        T�ng Kim                          //
--//////////////////////////////////////////////////////////////
TONG_KIM_ANTI_TRUNG_IP            = 1     -- Ch�a ho�t ��ng
-- Th�i gian ho�t ��ng
TONG_KIM_THOI_GIAN_BAO_DANH       = 10    -- G�c = 10
TONG_KIM_THOI_GIAN_CHIEN_DAU      = 60    -- G�c = 60
TONG_KIM_THOI_GIAN_CHIEN_BAO      = 20    -- G�c = 20
TONG_KIM_PHI_BAO_DANH             = 10000 -- L��ng
TONG_KIM_TY_LE_QUY_DOI_EXP        = 500   -- Tr�n 1 �i�m t�ch l�y
-- Ph�n th��ng th�m cho b�n th�ng / thua / h�a
TONG_KIM_THUONG_THEM_BAT          = 1
TONG_KIM_THUONG_THEM_GIO_BAT_DAU  = 2045 -- 20:45
TONG_KIM_THUONG_THEM_DIEM_YEU_CAU = 100  -- �i�m t�ch l�y t�i thi�u �� nh�n th��ng
-- X2 �i�m m�i ng�y
TONG_KIM_X2_NGAY_BAT              = 1
TONG_KIM_X2_GIO_BAT_DAU           = 2045 -- 20:45
-- X4 �i�m m�i T7
TONG_KIM_X4_T7_BAT                = 1
-- Th��ng TOP t�ng kim h�ng ng�y v� T7
TONG_KIM_THUONG_TOP_GIO_BAT_DAU   = 2045 -- 20:45 -- Gi� d�ng chung cho c� TOP10, TOP10_T7, TOP3
TONG_KIM_THUONG_TOP_DIEM_YEU_CAU  = 100  -- �i�m t�ch l�y t�i thi�u �� nh�n th��ng
TONG_KIM_THUONG_TOP10_BAT         = 1    -- TOP 10 h�ng ng�y
TONG_KIM_THUONG_TOP10_T7_BAT      = 1    -- TOP 10 th� 7, thay th� cho TOP 10 h�ng ng�y
TONG_KIM_THUONG_TOP3_BAT          = 1    -- TOP 3 h�ng ng�y

--  //////////////////////////////////////////////////////////////
-- //                     Phong L�ng ��                        //
--//////////////////////////////////////////////////////////////
PHONG_LANG_DO_MO                  = 1

--  //////////////////////////////////////////////////////////////
-- //                     Nhi�p Nh� Tr�n                       //
--//////////////////////////////////////////////////////////////
BOSS_ST_LIMIT_NGAY                = 8
