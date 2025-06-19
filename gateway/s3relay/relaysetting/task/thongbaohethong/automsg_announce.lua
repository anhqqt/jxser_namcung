-- §Şnh kú gëi th«ng b¸o hÖ thèng ®Õn tÊt c¶ Gameserver
function TaskShedule()
    TaskName("THONG BAO TIN TUC TU DONG")
    TaskInterval(20)
    -- TaskTime(0, 0)
    TaskCountLimit(0)
    OutputMsg("=====> [Khoi dong] He thong thong bao tin tuc tu dong")
end

g_strTipMsg = {
    "Mçi m«n ph¸i cã 2-3 ®­êng ph¸t triÓn kü n¨ng râ rµng, ®Æc ®iÓm cña mçi ®­êng cµng kh¸c nhau.", 
    "Trong trß ch¬i khi ®èi tho¹i víi VÖ binh Thµnh m«n cña c¸c thµnh thŞ vµ ®Ö tö tiÕp dÉn c¸c m«n ph¸i ë c¸c T©n Thñ th«n ®Ó hiÓu ®­îc c¸c h­íng ph¸t triÓn kü n¨ng cña tõng m«n ph¸i vµ khu vùc luyÖn c«ng thİch hîp.",
    "Giíi thiÖu kh¸i niÖm [ §iÓm Céng Kü N¨ng ], ­u thÕ cña nh÷ng nh©n vËt cã ®iÓm kü n¨ng cao sÏ cµng ®­îc thÓ hiÖn râ.", 
    "[ §iÓm Céng Kü N¨ng ] Kü n¨ng chiÕn ®Êu cÊp thÊp ®èi víi kü n¨ng chiÕn ®Êu cÊp cao lµ chØ céng thªm s¸t th­¬ng cña kü n¨ng cÊp cao.", 
    "HÖ thèng [ Ngò Hµnh T­¬ng Kh¾c ] hoµn toµn míi, bÊt kú m«n ph¸i nµo khi PK víi m«n ph¸i bŞ m×nh kh¾c chÕ sÏ cã ­u thÕ râ rÖt h¬n.",
    -- "Sau ngµy 16 th¸ng 7, lÇn ®Çu tiªn ®¨ng nhËp thÕ giíi game, hÖ thèng sÏ tù ®éng ®iÒu chØnh kü n¨ng cò cña nh©n vËt thµnh kü n¨ng míi dùa trªn t×nh tr¹ng hiÖn cã, vµ ®iÓm kü n¨ng sÏ ®­îc hoµn tr¶ vÒ tr¹ng th¸i ch­a ph©n bæ ban ®Çu.",
    "[ §é Thµnh Th¹o Kü N¨ng ] §­îc n©ng cao b»ng c¸ch liªn tôc sö dông kü n¨ng nµy ®Ó tÊn c«ng kÎ ®Şch, kh«ng liªn quan ®Õn cÊp ®é cña kÎ ®Şch vµ kinh nghiÖm luyÖn cÊp mµ ng­êi ch¬i nhËn ®­îc.", 
    -- "Di chuyÓn chuét ®Õn NPC, cã thÓ hiÓn thŞ [ BiÓu t­îng thuéc tİnh Ngò Hµnh ]",
    "NPC chØ rít b¶o vËt thuéc tİnh Ngò Hµnh t­¬ng øng, vİ dô muèn cã B¨ng Cung, cã thÓ ®i ®¸nh NPC hÖ Thñy.", 
    "NPC chØ rít b¶o vËt thuéc tİnh Ngò Hµnh t­¬ng øng, vİ dô muèn cã trang bŞ May M¾n, cã thÓ ®i ®¸nh NPC hÖ Méc.", 
    "BiÓu t­îng thuéc tİnh Ngò Hµnh cña NPC: Mµu vµng - hÖ Kim; Mµu xanh d­¬ng - hÖ Thñy; Mµu xanh l¸ c©y - hÖ Méc; Mµu ®á - hÖ Háa; Mµu n©u - hÖ Thæ.",
    -- "[ §iÒu ChØnh NPC ] NPC Sa M¹c Mª Cung kh«ng chØ cã cÊp ®é cao, kinh nghiÖm nhiÒu, lµm míi nhanh, mµ cßn rít b¶o vËt gÊp hai ®Õn ba lÇn NPC th«ng th­êng.",
    "[ Tæ §éi ] Kinh nghiÖm mµ ng­êi ch¬i ®¸nh ®ßn cuèi cïng nhËn ®­îc sÏ lµ 1.3 lÇn kinh nghiÖm c¸ nh©n.", 
    "[ Tæ §éi ] Gi¸ trŞ May M¾n cña thµnh viªn tæ ®éi sÏ ®­îc n©ng cao t­¬ng øng dùa trªn sè l­îng ng­êi trong tæ ®éi.",
    "[ Tæ §éi ] Gi¸ trŞ May M¾n cña thµnh viªn tæ ®éi sÏ ®­îc n©ng cao t­¬ng øng dùa trªn sè l­îng ng­êi trong tæ ®éi; thuéc tİnh cña trang bŞ rít ra sÏ ®­îc quyÕt ®Şnh dùa trªn gi¸ trŞ May M¾n cña nh©n vËt ng­êi ch¬i ®¸nh ®ßn cuèi cïng.", 
    "[ §Ò XuÊt Tæ §éi ] Ng­êi ch¬i cÊp cao dÉn d¾t ng­êi ch¬i cÊp thÊp, khi chªnh lÖch cÊp ®é trªn 70 cÊp, tèc ®é lªn cÊp cña mçi ng­êi sÏ t¨ng h¬n 20%.",
    "[ Ph¹t ChÕt Tæ §éi ] Sè l­îng ng­êi trong tæ ®éi cµng İt, kinh nghiÖm mÊt khi chÕt cµng İt; nÕu sè l­îng ng­êi trong tæ ®éi ®¹t t¸m ng­êi, sau khi chÕt sÏ kh«ng mÊt kinh nghiÖm.", 
    -- "[ §µo Hoa §¶o ] Mua B¸t Trô Töu tõ Èn SÜ §µo Hoa, kÕt hîp víi linh khİ trªn ®¶o, c«ng hiÖu thÇn kú cña B¸t Trô Töu sÏ gióp b¹n tu luyÖn dÔ dµng.",
    "NÕu ph¸t hiÖn m×nh bŞ mÊt nh÷ng kü n¨ng ®· häc ®­îc, h·y håi s­ sÏ häc ®­îc c¸c kü n¨ng nh­ HuyÕt ChiÕn B¸t Ph­¬ng, V« T­íng Tr¶m, Thiªn V­¬ng ChiÕn ı (Thiªn V­¬ng Bang) , cïng víi T©m Nh·n vµ Thiªn La §Şa Vâng (§­êng M«n) .",
    "[ TÈy Tñy §¶o ] chİnh thøc khai më, ng­êi ch¬i kh«ng n»m trong danh s¸ch tr¾ng tõ 50 cÊp trë lªn cã [ mét lÇn miÔn phİ ] c¬ héi vµo. Sau khi vµo ®¶o cã thÓ tïy ı tÈy [ ®iÓm tiÒm n¨ng ] vµ [ ®iÓm kü n¨ng ], vµ cã thÓ tr¶i nghiÖm hiÖu qu¶ céng ®iÓm trong hoÆc ngoµi tæ ®éi trªn ®¶o.",
    "C¬ héi miÔn phİ vµo [ TÈy Tñy §¶o ] chØ cã mét lÇn. Rêi TÈy Tñy §¶o, ph©n bæ [ tiÒm n¨ng/kü n¨ng ] cña b¹n sÏ ®­îc x¸c ®Şnh ngay lËp tøc, xin h·y suy nghÜ kü tr­íc khi rêi ®i!!!", 
    -- "Mét bé phËn ng­êi ch¬i sau khi hoµn thµnh [NhiÖm vô cÊp 90] cña m«n ph¸i ch­a thÓ nhËn ®­îc kü n¨ng, sau khi [håi s­] vÒ [Viªn Quan tho¸i nhiÖm] L©m An ®Ó chØnh söa l¹i [183,182]) ",
    -- "Mét bé phËn ng­êi ch¬i §­êng M«n sau khi häc [Tô tiÔn thuËt. B¹o Vò Lª Hoa] gÆp t×nh tr¹ng kh«ng thÓ sö dông B¹o Vò Lª Hoa, sau khi trë vÒ [håi s­] l¹i ®Õn [Viªn quan Tho¸i NhiÖm] L©m An ®Ó chØnh söa l¹i [183,182]) .", 
    -- "Mét bé phËn ng­êi ch¬i Vâ §ang gÆp t×nh tr¹ng bŞ mÊt ®iÓm kü n¨ng, sau khi vÒ [håi s­] ®Õn [Viªn Quan Tho¸i NhiÖm] l©m An ®Ó chØnh söa l¹i (L©m An [183,182]) ",
    "[ Tra Cøu Danh Väng ] Xin ®Õn chç ThÇy Sè MÖnh [ Tr­¬ng ThiÕt Chñy ] ë c¸c thµnh phè lín, T­¬ng D­¬ng [192,193].", 
    -- "[ Vâ Khİ §å Phæ ] Sö dông [ Thñy Tinh ] thÇn kú cña Trung Nguyªn Vâ L©m, ®æi lÊy [ Vâ Khİ §å Phæ ] tõ ThÇn Bİ Th­¬ng Nh©n dŞ vùc. Sau ®ã ®Ó [ ThiÕt T­îng ] tham chiÕu ®å phæ, 100% gióp b¹n n©ng cÊp vâ khİ lªn mét ®¼ng cÊp.",
    -- "[ Vâ Khİ §å Phæ ] ThÇn Bİ Th­¬ng Nh©n dŞ vùc xuÊt hiÖn ë hai n¬i: D­¬ng Ch©u [207,193] vµ L©m An [164,177], ng­êi ch¬i muèn ®æi ®å phæ n©ng cÊp vâ khİ xin h·y nhanh chãng hµnh ®éng.",
    -- "[ Qu¸i VËt Danh Lam ] xuÊt hiÖn chÊn ®éng KiÕm HiÖp (tªn hiÓn thŞ mµu xanh lam), mang theo kh«ng İt tiÒn vµng vµ trang bŞ, cßn cã thÓ mang theo [ Thñy Tinh ], [ B¶o Th¹ch Hy Hång ], [ Trang BŞ Hoµng Kim ], [ S¸ch Kü N¨ng ].",
    -- "[ Trang BŞ Hoµng Kim ] [ §Şnh Quèc ] [ An Bang ] Hoµng Kim Trang BŞ Set Trang BŞ xuÊt hiÖn trong KiÕm HiÖp, ®¸nh [ Qu¸i VËt Danh Lam ] lµ cã c¬ héi nhËn ®­îc. Tham gia ho¹t ®éng ¸p VËn Tiªu, mçi ngµy còng sÏ ngÉu nhiªn rít mét mãn.",
    "Sö dông [ Tiªn Th¶o Lé ] luyÖn cÊp trong vßng 1 giê sÏ ®­îc ®iÓm kinh nghiÖm gÊp ®«i: Sö dông [B¹ch C©u hoµn] trong vßng 1 giê sÏ ®­îc [tù ®éng ®¸nh qu¸i]. C«ng n¨ng cña 2 lo¹i d­îc phÈm nµy sÏ ®­îc më vµo ngµy ",
    "[HÖ thèng phóc duyªn] th«ng qua thêi gian ch¬i t¨ng dÇn ®Ó ®æi lÊy ®iÓm phóc duyªn. Dïng ®iÓm phóc duyªn ®Õn [ThÇn bİ th­¬ng nh©n LiÔu Êt] T­¬ng D­¬ng ®Ó ®æi lÊy c¸c lo¹i vËt phÈm ®Æc thï.", 
    "[HÖ thèng phóc duyªn] ®èi tho¹i víi [Vâ L©m truyÒn nh©n] ë c¸c thµnh thŞ ®Ó biÕt th«ng tin chi tiÕt."
    -- "[ Ho¹t ®éng Trung Thu ] ¡n b¸nh trung thu, ng¾m tr¨ng s¸ng, vŞnh th¬, gi¶i c©u ®è ch÷, ho¹t ®éng ®ang triÓn khai toµn diÖn, nhiÒu phÇn th­ëng ®ang chê ®ãn b¹n! Vui lßng ®Õn LÔ Quan c¸c thµnh thŞ ®Ó hái thªm chi tiÕt.",
}

-- Tin nh¾n dù b¸o chøc n¨ng míi
g_nFutureDate = 20040723
STR_HEAD_FUTURE = " [Giang Hå truyÒn r»ng]"
g_strFutureMsg = {}
function TaskContent()
    str = ""
    nFutureCount = getn(g_strFutureMsg)
    nCount = getn(g_strTipMsg) + nFutureCount
    nIndex = random(1, nCount)
    if (nIndex <= nFutureCount) then -- 1-LÊy tin nh¾n dù b¸o, 2-LÊy tin nh¾n nh¾c nhë
        str = getFutureMsg()
        if (strlen(str) <= 0) then -- NÕu kh«ng cã tin nh¾n dù b¸o, th× lÊy tin nh¾n nh¾c nhë
            str = getTipMsg()
        end
    else
        str = getTipMsg()
    end

    GlobalExecute(format("dw Msg2SubWorld([[%s]])", str))
end

-- LÊy tin nh¾n nh¾c nhë
function getTipMsg()

    nCount = getn(g_strTipMsg)
    nIndex = random(1, nCount)

    return g_strTipMsg[nIndex]
end

-- LÊy tin nh¾n dù b¸o
function getFutureMsg()
    nCurDate = tonumber(date("%Y%m%d"))
    str = ""
    if (g_nFutureDate > nCurDate) then -- Cã ph¶i tr­íc ngµy chØ ®Şnh, nÕu kh«ng th× kh«ng göi
        nCount = getn(g_strFutureMsg)
        nIndex = random(1, nCount)
        str = STR_HEAD_FUTURE .. (g_strFutureMsg[nIndex])
    end

    return str
end
