---------------------------------------------------------------------------------
-- File name    : env.lua
-- Author       : Anh Quach
-- Date         : 07-06-2025
-- Description  : Quy ®Þnh c¸c biÕn dïng chung cho c¶ server
---------------------------------------------------------------------------------
-- Thªm biÕn dïng cho ho¹t ®éng
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
-- //                        TÝnh n¨ng                         //
--//////////////////////////////////////////////////////////////
LEVEL_KHOI_TAO_NHAN_VAT = 0
KY_TRAN_CAC_MO = 0


--  //////////////////////////////////////////////////////////////
-- //                         V­ît ¶i                          //
--//////////////////////////////////////////////////////////////
VUOT_AI_THANH_VIEN                = 1
VUOT_AI_LV_MIN                    = 50
VUOT_AI_PHI_BAO_DANH                      = 10000 -- 1 v¹n
VUOT_AI_LIMIT_NGAY                = 20
VUOT_AI_DIEU_KIEN_AI_AN           = 20    -- Gèc = 20 phót
VUOT_AI_DIEU_KIEN_AI_30           = 13    -- Gèc = 13 phót
VUOT_AI_TY_LE_EXP_KET_THUC        = 9     -- Tû lÖ EXP nhËn ®­îc khi kÕt thóc V­ît ¶i. Gèc = 1
VUOT_AI_TY_LE_EXP_TUNG_AI         = 1     -- Tû lÖ EXP nhËn ®­îc khi kÕt thóc tõng ¶i lÎ. Gèc = 1
VUOT_AI_THOI_GIAN_BAO_DANH        = 10    -- Gèc = 10 phót

--  //////////////////////////////////////////////////////////////
-- //                          D· TÈu                          //
--//////////////////////////////////////////////////////////////
DA_TAU_LV_MIN                     = 30
DA_TAU_EXP_10                     = 1000000
DA_TAU_EXP_20                     = 2000000
DA_TAU_EXP_30                     = 3000000
DA_TAU_EXP_40                     = 10000000

--  //////////////////////////////////////////////////////////////
-- //                         Th©m C©u                         //
--//////////////////////////////////////////////////////////////
THAM_CAU_O_VAN                    = 1500
THAM_CAU_XICH_THO                 = 1800
THAM_CAU_TUYET_ANH                = 1500
THAM_CAU_DICH_LO                  = 1500
THAM_CAU_CHIEU_DA                 = 2000

--  //////////////////////////////////////////////////////////////
-- //                        Tèng Kim                          //
--//////////////////////////////////////////////////////////////
TONG_KIM_ANTI_TRUNG_IP            = 1     -- Ch­a ho¹t ®éng
-- Thêi gian ho¹t ®éng
TONG_KIM_THOI_GIAN_BAO_DANH       = 10    -- Gèc = 10
TONG_KIM_THOI_GIAN_CHIEN_DAU      = 60    -- Gèc = 60
TONG_KIM_THOI_GIAN_CHIEN_BAO      = 20    -- Gèc = 20
TONG_KIM_PHI_BAO_DANH             = 10000 -- L­îng
TONG_KIM_TY_LE_QUY_DOI_EXP        = 500   -- Trªn 1 ®iÓm tÝch lòy
-- PhÇn th­ëng thªm cho bªn th¾ng / thua / hßa
TONG_KIM_THUONG_THEM_BAT          = 1
TONG_KIM_THUONG_THEM_GIO_BAT_DAU  = 2045 -- 20:45
TONG_KIM_THUONG_THEM_DIEM_YEU_CAU = 100  -- §iÓm tÝch lòy tèi thiÓu ®Ó nhËn th­ëng
-- X2 ®iÓm mçi ngµy
TONG_KIM_X2_NGAY_BAT              = 1
TONG_KIM_X2_GIO_BAT_DAU           = 2045 -- 20:45
-- X4 ®iÓm mçi T7
TONG_KIM_X4_T7_BAT                = 1
-- Th­ëng TOP tèng kim h»ng ngµy vµ T7
TONG_KIM_THUONG_TOP_GIO_BAT_DAU   = 2045 -- 20:45 -- Giê dïng chung cho c¶ TOP10, TOP10_T7, TOP3
TONG_KIM_THUONG_TOP_DIEM_YEU_CAU  = 100  -- §iÓm tÝch lòy tèi thiÓu ®Ó nhËn th­ëng
TONG_KIM_THUONG_TOP10_BAT         = 1    -- TOP 10 h»ng ngµy
TONG_KIM_THUONG_TOP10_T7_BAT      = 1    -- TOP 10 thø 7, thay thÕ cho TOP 10 h»ng ngµy
TONG_KIM_THUONG_TOP3_BAT          = 1    -- TOP 3 h»ng ngµy

--  //////////////////////////////////////////////////////////////
-- //                     Phong L¨ng §é                        //
--//////////////////////////////////////////////////////////////
PHONG_LANG_DO_MO                  = 1

--  //////////////////////////////////////////////////////////////
-- //                     NhiÕp NhÝ TrÇn                       //
--//////////////////////////////////////////////////////////////
BOSS_ST_LIMIT_NGAY                = 8
