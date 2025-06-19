Include("\\script\\global\\login_head.lua")
-- Script ®¨ng nhËp
-- Bëi: LaiLiGao (2004-06-20)
-- CËp nhËt: Dan_Deng (2004-07-09) §· thªm chøc n¨ng tù ®éng cËp nhËt kü n¨ng
-- CËp nhËt: FanZai §· sö dông c¬ chÕ míi, chØ cÇn bá Include lµ cã thÓ bËt/t¾t chøc n¨ng

-- Th«ng th­êng, b¹n chØ cÇn söa ®æi (thªm/xãa) c¸c file Include t¹i ®©y:
-- (Trong file, chØ cÇn thùc hiÖn login_add(fun, n_time) lµ ®­îc, vİ dô tham kh¶o: "\\script\\missions\\leaguematch\\wlls_login.lua")
--================================================================
Include("\\script\\global\\login_old.lua")                 -- Script Login cò (bao gåm nhiÒu ho¹t ®éng)
Include("\\script\\missions\\leaguematch\\wlls_login.lua") -- WLLS Vâ L©m Liªn §Êu
Include("\\script\\misc\\extpoint_loginmsg\\login_msg.lua")
Include("\\script\\global\\offline_login.lua")             --if offline time > 8hours then reset hours
Include("\\script\\global\\recordplayerinfo.lua")
Include("\\script\\nationalwar\\login.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_resetbase.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\playerlist.lua")
-- Include("\\script\\global\\login_hint.lua")  -- Nh¾c nhë ho¹t ®éng ®¨ng nhËp
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
    Include("\\script\\task\\lv120skill\\head.lua") -- NhiÖm vô kü n¨ng cÊp 120

    -- LLG_ALLINONE_TODO_20070802 ´ıÈ·ÈÏ
    Include("\\script\\battles\\battle_login.lua") -- Nh¾c nhë nhËn th­ëng Vinh Dù Tèng Kim
end

if (GetProductRegion() == "cn_ib") then
    Include("\\script\\misc\\spreader\\emigration.lua")
    Include("\\script\\misc\\lost_item\\takelostitem.lua")
    Include([[\script\item\ib\tishenzhiren.lua]]) -- ÌæÉíÖ½ÈË
    Include("\\script\\item\\ib\\zimudai.lua");
end

Include("\\script\\tong\\tong_login.lua");
Include("\\script\\item\\tianziyuxi.lua"); -- Thiªn Chi Ngäc Tû
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
        Msg2Player("N¬i ®©y ®å th­îng tuyÕn s¾p trë vÒ thµnh...");
        SetRevPos(19);   -- ThiÕt lËp ®iÓm Trïng Sinh
        UseTownPortal(); -- Thùc hiÖn Håi Thµnh
    end

    -- tinhpn 20100817: Online Award
    if (OnlineAward_StartDate() == 1 and OnlineAward_Check_TransferLife() ~= 0) then
        Msg2Player("§ang trong thêi gian ho¹t ®éng Online NhËn Th­ëng")
        OnlineAward_ResetDaily()
        OnlineAward_SummaryOnlineTime()
        OnlineAward_StartTime()
    end
    AddPlayer(PlayerIndex)
    PlayerList:AddPlayer(PlayerIndex)
    -- T¶i l¹i toµn bé script ®¨ng nhËp
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
    LoginDelaySync(1) -- 1 cã nghÜa lµ cÇn ®ång bé d÷ liÖu theo thêi gian, 0 cã nghÜa lµ kh«ng cÇn
    -- Xin ®õng trùc tiÕp thªm logic xö lı vµo hµm nµy, h·y ®ãng gãi nã thµnh mét hµm riªng vµ ®Æt vµo m¶ng TB_LOGIN_FUN[0] th«ng qua login_add
end

function DonSachRuong()
    Say(" dän!")
    local tbItems = {}
    tbItems = GetRoomItems(0);
    if (getn(tbItems) > 0) then
        for i = 1, getn(tbItems) do
            RemoveItemByIndex(tbItems[i], -1);
        end
    end
end

-------------------------------------------
-- Chøc n¨ng: Khi ®¨ng nhËp, ®ång bé hãa dÇn dÇn mét sè d÷ liÖu kh«ng ¶nh h­ëng ®Õn ho¹t ®éng hÖ thèng vÒ m¸y kh¸ch, gi¶m thêi gian hao phİ khi ®¨ng nhËp.
-- HiÖn t¹i thêi gian tr× ho·n lµ 2 gi©y (tøc lµ: kho¶ng c¸ch thùc hiÖn main_delaysync: hai gi©y)
-- Tham sè: nStep biÓu thŞ ®©y lµ lÇn ®ång bé hãa thø mÊy
-- Tr¶ vÒ: 0 - biÓu thŞ ®ång bé hãa ch­a kÕt thóc, hÖ thèng vÉn sÏ gäi l¹i main_delaysync sau khi hoµn thµnh lÇn gäi nµy
--        1 - biÓu thŞ tÊt c¶ c¸c lÇn ®ång bé hãa ®· kÕt thóc
function main_delaysync(nStep)
    if (nStep < 1 or nStep > getn(TB_LOGIN_FUN)) then
        print("main_delaysync error: " .. nStep .. " funccount:" .. getn(TB_LOGIN_FUN));
        return 1;
    end

    -- ÔËĞĞµÚnStep´ÎÑÓÊ±Í¬²½µÄËùÓĞº¯Êı
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