Include("\\script\\global\\login_head.lua")
-- Script ��ng nh�p
-- B�i: LaiLiGao (2004-06-20)
-- C�p nh�t: Dan_Deng (2004-07-09) �� th�m ch�c n�ng t� ��ng c�p nh�t k� n�ng
-- C�p nh�t: FanZai �� s� d�ng c� ch� m�i, ch� c�n b� Include l� c� th� b�t/t�t ch�c n�ng

-- Th�ng th��ng, b�n ch� c�n s�a ��i (th�m/x�a) c�c file Include t�i ��y:
-- (Trong file, ch� c�n th�c hi�n login_add(fun, n_time) l� ���c, v� d� tham kh�o: "\\script\\missions\\leaguematch\\wlls_login.lua")
--================================================================
Include("\\script\\global\\login_old.lua")                 -- Script Login c� (bao g�m nhi�u ho�t ��ng)
Include("\\script\\missions\\leaguematch\\wlls_login.lua") -- WLLS V� L�m Li�n ��u
Include("\\script\\misc\\extpoint_loginmsg\\login_msg.lua")
Include("\\script\\global\\offline_login.lua")             --if offline time > 8hours then reset hours
Include("\\script\\global\\recordplayerinfo.lua")
Include("\\script\\nationalwar\\login.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_resetbase.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\playerlist.lua")
-- Include("\\script\\global\\login_hint.lua")  -- Nh�c nh� ho�t ��ng ��ng nh�p
--================================================================
Include("\\script\\global\\anhquach\\login.lua")
--================================================================
Include("\\script\\worldrank\\vngglobalvar.lua")
Include("\\script\\worldrank\\vngtop10.lua")
Include("\\script\\worldrank\\xephang.lua")
--================================================================
Include("\\script\\activitysys\\g_activity.lua")

if (GetProductRegion() ~= "vn") then
    Include("\\script\\global\\chuangong_login.lua")
    Include("\\script\\task\\lv120skill\\head.lua") -- Nhi�m v� k� n�ng c�p 120

    -- LLG_ALLINONE_TODO_20070802 ��ȷ��
    Include("\\script\\battles\\battle_login.lua") -- Nh�c nh� nh�n th��ng Vinh D� T�ng Kim
end

if (GetProductRegion() == "cn_ib") then
    Include("\\script\\misc\\spreader\\emigration.lua")
    Include("\\script\\misc\\lost_item\\takelostitem.lua")
    Include([[\script\item\ib\tishenzhiren.lua]]) -- ����ֽ��
    Include("\\script\\item\\ib\\zimudai.lua");
end

Include("\\script\\tong\\tong_login.lua");
Include("\\script\\item\\tianziyuxi.lua"); -- Thi�n Chi Ng�c T�
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")

--tinhpn 20110223:Reset pass ruong
Include("\\script\\vng_feature\\resetbox.lua")
--=======================================================
Include("\\script\\msgkiller\\msgkiller.lua")
--=======================================================
function main(bExchangeIn)
    --================================================================
    XepHang()
    -- tbTop10:LuuDSNhanVat()
    --================================================================
    -- tinhpn 20110223:Reset pass ruong
    ResetBox:AnnounceResetBoxDate()

    local W, X, Y = GetWorldPos();
    local nMapId = W;
    if (nMapId == 341) or (nMapId == 162) then
        Msg2Player("N�i ��y �� th��ng tuy�n s�p tr� v� th�nh...");
        SetRevPos(19);   -- Thi�t l�p �i�m Tr�ng Sinh
        UseTownPortal(); -- Th�c hi�n H�i Th�nh
    end

    -- tinhpn 20100817: Online Award
    if (OnlineAward_StartDate() == 1 and OnlineAward_Check_TransferLife() ~= 0) then
        Msg2Player("�ang trong th�i gian ho�t ��ng Online Nh�n Th��ng")
        OnlineAward_ResetDaily()
        OnlineAward_SummaryOnlineTime()
        OnlineAward_StartTime()
    end
    AddPlayer(PlayerIndex)
    PlayerList:AddPlayer(PlayerIndex)
    -- T�i l�i to�n b� script ��ng nh�p
    if (TB_LOGIN_FUN[0]) then
        for i = 1, getn(TB_LOGIN_FUN[0]) do
            local func = TB_LOGIN_FUN[0][i]
            if (func) then
                func(bExchangeIn)
            end
        end
    end
    --DonSachRuong()

    G_ACTIVITY:OnMessage("OnLogin", PlayerIndex)


    for i = 1, getn(TB_LOGIN_FILEFUN) do
        local reg = TB_LOGIN_FILEFUN[i]
        DynamicExecute(reg[1], reg[2], PlayerIndex, bExchangeIn)
    end
    EventSys:GetType("OnLogin"):OnPlayerEvent(0, PlayerIndex, bExchangeIn)
    TaskManager:ResetUseGroup()
    LoginDelaySync(1) -- 1 c� ngh�a l� c�n ��ng b� d� li�u theo th�i gian, 0 c� ngh�a l� kh�ng c�n
    -- Xin ��ng tr�c ti�p th�m logic x� l� v�o h�m n�y, h�y ��ng g�i n� th�nh m�t h�m ri�ng v� ��t v�o m�ng TB_LOGIN_FUN[0] th�ng qua login_add
end

function DonSachRuong()
    Say(" d�n!")
    local tbItems = {}
    tbItems = GetRoomItems(0);
    if (getn(tbItems) > 0) then
        for i = 1, getn(tbItems) do
            RemoveItemByIndex(tbItems[i], -1);
        end
    end
end

-------------------------------------------
-- Ch�c n�ng: Khi ��ng nh�p, ��ng b� h�a d�n d�n m�t s� d� li�u kh�ng �nh h��ng ��n ho�t ��ng h� th�ng v� m�y kh�ch, gi�m th�i gian hao ph� khi ��ng nh�p.
-- Hi�n t�i th�i gian tr� ho�n l� 2 gi�y (t�c l�: kho�ng c�ch th�c hi�n main_delaysync: hai gi�y)
-- Tham s�: nStep bi�u th� ��y l� l�n ��ng b� h�a th� m�y
-- Tr� v�: 0 - bi�u th� ��ng b� h�a ch�a k�t th�c, h� th�ng v�n s� g�i l�i main_delaysync sau khi ho�n th�nh l�n g�i n�y
--        1 - bi�u th� t�t c� c�c l�n ��ng b� h�a �� k�t th�c
function main_delaysync(nStep)
    if (nStep < 1 or nStep > getn(TB_LOGIN_FUN)) then
        print("main_delaysync error: " .. nStep .. " funccount:" .. getn(TB_LOGIN_FUN));
        return 1;
    end

    -- ���е�nStep����ʱͬ�������к���
    if (TB_LOGIN_FUN[nStep]) then
        for i = 1, getn(TB_LOGIN_FUN[nStep]) do
            if (TB_LOGIN_FUN[nStep][i]) then
                TB_LOGIN_FUN[nStep][i]()
            end
        end
    end

    if (nStep < getn(TB_LOGIN_FUN)) then
        return 0
    else
        return 1
    end
end

function no()
    if chuangong_login ~= nil then
        chuangong_login()
    end
end