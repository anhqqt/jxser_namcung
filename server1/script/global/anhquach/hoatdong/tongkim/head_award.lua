-- Gi�i h�n EXP ��i / tu�n
TONG_KIM_LIMIT_EXP_TUAN    = {[0] = 70000000, [3] = 70000000, [4] = 70000000}
-- Gi�i h�n EXP ��i / ng�y
TONG_KIM_LIMIT_EXP_NGAY    = {[0] = 10000000, [3] = 10000000, [4] = 10000000}
-- �i�m t�ch l�y th��ng th�m cho b�n th�ng / thua / h�a
TONG_KIM_THUONG_THANG      = 1200
TONG_KIM_THUONG_THUA       = 600
TONG_KIM_THUONG_HOA        = 900
-- Ph�n th��ng th�m cho b�n th�ng / thua / h�a
TONG_KIM_THUONG_THEM_THANG = {
    -- S� c�p
    [1]={
        {szName="�i�m kinh nghi�m", nExp_tl = 3000000, nCount = 1},
    },
    -- Trung c�p
    [2]={
        {szName="�i�m kinh nghi�m", nExp_tl = 4000000, nCount = 1},
    },
    -- Cao c�p
    [3]={
        {szName="�i�m kinh nghi�m", nExp_tl = 5000000, nCount = 1},
    }
}
TONG_KIM_THUONG_THEM_THUA  = {
    -- S� c�p
    [1]={
        {szName="�i�m kinh nghi�m", nExp_tl = 1000000, nCount = 1},
    },
    -- Trung c�p
    [2]={
        {szName="�i�m kinh nghi�m", nExp_tl = 2000000, nCount = 1},
    },
    -- Cao c�p
    [3]={
        {szName="�i�m kinh nghi�m", nExp_tl = 3000000, nCount = 1},
    }
}
TONG_KIM_THUONG_THEM_HOA   = {
    -- S� c�p
    [1]={
        {szName="�i�m kinh nghi�m", nExp_tl = 2000000, nCount = 1},
    },
    -- Trung c�p
    [2]={
        {szName="�i�m kinh nghi�m", nExp_tl = 3000000, nCount = 1},
    },
    -- Cao c�p
    [3]={
        {szName="�i�m kinh nghi�m", nExp_tl = 4000000, nCount = 1},
    }
}
-- T�ng kim l� bao
TONG_KIM_LE_BAO_AWARD      = {
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
-- Th��ng TOP t�ng kim h�ng ng�y v� T7
TONG_KIM_THUONG_TOP10      = {
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
TONG_KIM_THUONG_TOP10_T7   = {
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
TONG_KIM_THUONG_TOP3       = {
    [1]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=20},
        {szName="�i�m kinh nghi�m", nExp_tl = 3000000, nCount = 1},
        {szName="Ng�n l��ng", nJxb = 3000000, nCount = 1},
    },
    [2]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=20},
        {szName="�i�m kinh nghi�m", nExp_tl = 2000000, nCount = 1},
        {szName="Ng�n l��ng", nJxb = 2000000, nCount = 1},
    },
    [3]={
        {szName="Ti�n ��ng",tbProp={4,417},nCount=20},
        {szName="�i�m kinh nghi�m", nExp_tl = 1000000, nCount = 1},
        {szName="Ng�n l��ng", nJxb = 1000000, nCount = 1},
    }
}