-- File head kŞch b¶n chuçi nhiÖm vô D· TÈu
-- Edited by peres
-- 2004/12/25 S¸ng Gi¸ng Sinh
-- Translate by Anh Quach (07-06-2025)

Include("\\script\\global\\fuyuan.lua"); -- Dïng ®Ó lÊy file phóc duyªn
Include("\\script\\task\\newtask\\newtask_head.lua"); -- File head cña hÖ thèng nhiÖm vô míi, dïng ®Ó ®ång bé biÕn sè

IncludeLib("FILESYS");
IncludeLib("BATTLE");

TL_MAXTIMES = 20 -- Mçi chuçi cã 20 nhiÖm vô
TL_MAXLINKS = 20 -- Mçi vßng cã 20 chuçi
TL_MAXLOOPS = 20 -- Ng­êi ch¬i tæng céng cã thÓ lµm 20 vßng nhiÖm vô
-- TL_MAXLINKSCOUNT = 4 -- Mçi chuçi tèi ®a chØ cã thÓ lµm 4 lÇn

TL_UPLEVELEXP = "TaskLink_UpLevel"


DEBUG_TASKVALUE = 1046;  -- Dïng ®Ó truy vÕt biÕn sè lçi BUG gian lËn hñy nhiÖm vô

ID_TASKLINK_LIMITDATE = 2419;  -- Ghi l¹i ngµy giíi h¹n mçi ngµy
ID_TASKLINK_LIMITNUM  = 2420;  -- Ghi l¹i sè lÇn giíi h¹n mçi ngµy

-- ¶ÁÈ¡ÎÄ¼şÊ±µÄ×Ö·û´®¶¨Òå
TL_BUYGOODS = "TaskLink_BuyGoods"
TL_FINDGOODS = "TaskLink_FindGoods"
TL_SHOWGOODS = "TaskLink_ShowGoods"
TL_FINDMAPS = "TaskLink_FindMaps"
TL_UPGROUND = "TaskLink_UpGround"
TL_WORLDMAPS = "TaskLink_WorldMaps"
TL_LEVELLINK = "TaskLink_Level"

TL_MAINTASKLEVEL = "TaskLink_MainLevel"
TL_AWARDBASIC = "Award_Basic"
TL_AWARDLINK = "Award_Link"
TL_AWARDLOOP = "Award_Loop"

TL_TASKGOODSTALK = "TaskLink_GoodsTalk"
TL_TASKBUYTALK = "TaskLink_BuyTalk"
TL_TASKSHOWTALK = "TaskLink_ShowTalk"
TL_TASKFINDMAPS = "TaskLink_FindTalk"
TL_TASKUPGROUNDTALK = "TaskLink_UpGroundTalk"
TL_TASKWORLDTALK = "TaskLink_WorldTalk"

-- TiÒn t¶i file TABLE cña chuçi nhiÖm vô
TabFile_Load("\\settings\\task\\tasklink_buygoods.txt",TL_BUYGOODS)
TabFile_Load("\\settings\\task\\tasklink_findgoods.txt",TL_FINDGOODS)
TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
TabFile_Load("\\settings\\task\\tasklink_findmaps.txt",TL_FINDMAPS)
TabFile_Load("\\settings\\task\\tasklink_upground.txt",TL_UPGROUND)
TabFile_Load("\\settings\\task\\tasklink_worldmaps.txt",TL_WORLDMAPS)
TabFile_Load("\\settings\\task\\levellink.txt",TL_LEVELLINK) -- CÊp ®é khëi ®Çu t­¬ng øng víi mçi cÊp ®é
TabFile_Load("\\settings\\task\\tasklink_mainlink.txt",TL_MAINTASKLEVEL) -- Tû lÖ xuÊt hiÖn cña mçi lo¹i nhiÖm vô trong cÊp ®é t­¬ng øng
TabFile_Load("\\settings\\npc\\player\\level_exp.txt",TL_UPLEVELEXP) -- B¶ng kinh nghiÖm cÇn thiÕt ®Ó th¨ng cÊp

TabFile_Load("\\settings\\task\\award_basic.txt",TL_AWARDBASIC)
TabFile_Load("\\settings\\task\\award_link.txt",TL_AWARDLINK)
TabFile_Load("\\settings\\task\\award_loop.txt",TL_AWARDLOOP)

TabFile_Load("\\settings\\task\\talk\\talk_findgoods.txt",TL_TASKGOODSTALK)
TabFile_Load("\\settings\\task\\talk\\talk_buygoods.txt",TL_TASKBUYTALK)
TabFile_Load("\\settings\\task\\talk\\talk_showgoods.txt",TL_TASKSHOWTALK)
TabFile_Load("\\settings\\task\\talk\\talk_findmaps.txt",TL_TASKFINDMAPS)
TabFile_Load("\\settings\\task\\talk\\talk_upground.txt",TL_TASKUPGROUNDTALK)
TabFile_Load("\\settings\\task\\talk\\talk_worldmap.txt",TL_TASKWORLDTALK)


-- X¸c ®Şnh tr¹ng th¸i nhiÖm vô hiÖn t¹i cña ng­êi ch¬i nªn thuéc vÒ vßng thø mÊy
function tl_getfirstloop()
	-- Do t¹m thêi kh«ng cã sù kh¸c biÖt vÒ vßng, nªn chØ cã thÓ lµ 0
	return 0
end


-- Hµm xuÊt cuèi cïng, giao nhiÖm vô cho ng­êi ch¬i vµ ®Æt vµo biÕn nhiÖm vô
function tl_dealtask()

    -- §Çu tiªn x¸c ®Şnh cÊp ®é nhiÖm vô / sè chuçi ®ang tiÕn hµnh cña ng­êi ch¬i
    local myTaskLevel = tl_gettaskstate(2)

    -- Sau ®ã ngÉu nhiªn tİnh to¸n lo¹i nhiÖm vô nªn tiÕn hµnh cho cÊp ®é ®ã
    local myTaskType = tl_gettasktype(myTaskLevel)

    tl_setplayertasktype(myTaskType)

    -- Cuèi cïng ®äc b¶ng t­¬ng øng ®Ó x¸c ®Şnh sè dßng cña nhiÖm vô cô thÓ trong b¶ng
    local myTaskID = tl_gettasklink(myTaskType, myTaskLevel)

    tl_savetasktablecol(myTaskID)

	-- NÕu lµ nhiÖm vô thu thËp b¶n ®å, th× ghi l¹i m· sè b¶n ®å vµ lo¹i b¶n ®å muèn thu thËp
	local myTaskMapID = tonumber(TabFile_GetCell(TL_FINDMAPS, myTaskID, "MapID"))
	local myMapType = tonumber(TabFile_GetCell(TL_FINDMAPS, myTaskID, "MapType"))
	local myMapNum = tonumber(TabFile_GetCell(TL_FINDMAPS, myTaskID, "Num"))

	-- §iÒu kiÖn ph¸n ®o¸n cña nhiÖm vô lo¹i 5
	local myTaskValueType

	-- Ghi l¹i biÕn nhiÖm vô
	-- Ghi l¹i lo¹i nhiÖm vô cña ng­êi ch¬i
	tl_setplayertasktype(myTaskType)

	-- Ghi l¹i sè dßng trong b¶ng nhiÖm vô cô thÓ cña ng­êi ch¬i
	tl_savetasktablecol(myTaskID)

	-- Xö lı l­u tr÷ biÕn sè kh¸c nhau t­¬ng øng víi c¸c nhiÖm vô kh¸c nhau

    if (myTaskType == 1) then
        -- L­u gi¸ trŞ ngÉu nhiªn cña yÕu tè ®èi tho¹i nhiÖm vô
        tl_savetalkvalue(1, random(2, getn(Task_TalkBuy[1]) + 1))
        tl_savetalkvalue(3, random(2, getn(Task_TalkBuy[3]) + 1))
        tl_savetalkvalue(6, random(2, getn(Task_TalkBuy[6]) + 1))

    elseif (myTaskType == 2) then
        -- L­u gi¸ trŞ ngÉu nhiªn cña yÕu tè ®èi tho¹i nhiÖm vô
        tl_savetalkvalue(1, random(2, getn(Task_TalkGoods[1]) + 1))
        tl_savetalkvalue(2, random(2, getn(Task_TalkGoods[2]) + 1))
        tl_savetalkvalue(3, random(2, getn(Task_TalkGoods[3]) + 1))
        tl_savetalkvalue(4, random(2, getn(Task_TalkGoods[4]) + 1))
        tl_savetalkvalue(5, random(2, getn(Task_TalkGoods[5]) + 1))
        tl_savetalkvalue(6, random(2, getn(Task_TalkGoods[6]) + 1))

    elseif (myTaskType == 3) then
        -- L­u gi¸ trŞ ngÉu nhiªn cña yÕu tè ®èi tho¹i nhiÖm vô
        tl_savetalkvalue(1, random(2, getn(Task_TalkShow[1]) + 1))
        tl_savetalkvalue(4, random(2, getn(Task_TalkShow[4]) + 1))
        tl_savetalkvalue(6, random(2, getn(Task_TalkShow[6]) + 1))

    elseif (myTaskType == 4) then
        -- L­u gi¸ trŞ ngÉu nhiªn cña yÕu tè ®èi tho¹i nhiÖm vô
        tl_savetalkvalue(1, random(2, getn(Task_TalkFind[1]) + 1))
        tl_savetalkvalue(4, random(2, getn(Task_TalkFind[4]) + 1))
        tl_savetalkvalue(6, random(2, getn(Task_TalkFind[6]) + 1))

        nt_setTask(1031, myTaskMapID)
        nt_setTask(1032, SetByte(nt_getTask(1032), 1, myMapType))
        nt_setTask(1032, SetByte(nt_getTask(1032), 2, myMapNum))
		nt_setTask(1025, 0) -- Xãa sè l­îng b¶n ®å gèc
    elseif (myTaskType == 5) then -- NÕu lµ nhiÖm vô t¨ng gi¸ trŞ sè, th× ph¸n ®o¸n lµ lo¹i gi¸ trŞ sè nµo
        -- L­u gi¸ trŞ ngÉu nhiªn cña yÕu tè ®èi tho¹i nhiÖm vô
        tl_savetalkvalue(1, random(2, getn(Task_TalkUp[1]) + 1))
        tl_savetalkvalue(3, random(2, getn(Task_TalkUp[3]) + 1))
        tl_savetalkvalue(4, random(2, getn(Task_TalkUp[4]) + 1))
        tl_savetalkvalue(6, random(2, getn(Task_TalkUp[6]) + 1))

        myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND, myTaskID, "NumericType"))

		if (myTaskValueType == 2) then -- NÕu lµ t¨ng kinh nghiÖm
            nt_setTask(1033, GetLevel())
            nt_setTask(1034, GetExp())
        elseif (myTaskValueType == 3) then -- NÕu lµ t¨ng danh väng
            nt_setTask(1026, GetRepute())
        elseif (myTaskValueType == 4) then -- NÕu lµ t¨ng phóc duyªn
            nt_setTask(1026, nt_getTask(151))
        elseif (myTaskValueType == 5) then -- NÕu lµ t¨ng gi¸ trŞ PK
            nt_setTask(1026, GetPK())
        elseif (myTaskValueType == 6) then -- NÕu lµ t¨ng tİch lòy Tèng Kim
            nt_setTask(1026, nt_getTask(747))
        end

    elseif (myTaskType == 6) then
        -- L­u gi¸ trŞ ngÉu nhiªn cña yÕu tè ®èi tho¹i nhiÖm vô
        tl_savetalkvalue(1, random(2, getn(Task_TalkWorld[1]) + 1))
        tl_savetalkvalue(3, random(2, getn(Task_TalkWorld[3]) + 1))
    end

    tl_settaskcourse(1) -- ÉèÖÃÈÎÎñ½øÕ¹½ø¶ÈÎª 1 

end



-- NhiÖm vô vßng lÆp ®Õn vßng tiÕp theo
function tl_taskprocess()

	local myTaskTimes = tl_gettaskstate(1) -- Sè lÇn ng­êi ch¬i ®· tiÕn hµnh
    local myTaskLinks = tl_gettaskstate(2) -- Sè chuçi ng­êi ch¬i ®· tiÕn hµnh
    local myTaskLoops = tl_gettaskstate(3) -- Sè vßng ng­êi ch¬i ®· tiÕn hµnh
    local myTaskCancel = tl_gettaskstate(4)
    local myTaskLinksCount = tl_gettaskstate(6) -- KiÓm tra ng­êi ch¬i ®· tiÕn hµnh bao nhiªu lÇn trong chuçi hiÖn t¹i

    myTaskTimes = myTaskTimes + 1

    if (myTaskLoops >= TL_MAXLOOPS) then
        myTaskLoops = 0;
    end

    if (myTaskTimes >= TL_MAXTIMES) then

        myTaskTimes = 0
        myTaskLinksCount = myTaskLinksCount + 1

        -- §Çu tiªn l­u tr¹ng th¸i nhiÖm vô ë ®©y mét lÇn
        tl_settaskstate(1, myTaskTimes)
        tl_settaskstate(2, myTaskLinks)
        tl_settaskstate(6, myTaskLinksCount)

        if (tl_counttasklinknum(2) >= TL_MAXLINKS) then -- NhiÖm vô ®· tiÕn hµnh ®Õn tr¹ng th¸i vßng

            myTaskTimes = 0
            myTaskLinks = tl_getfirstlink()
            --			tl_print("µÃµ½ÁË³õÊ¼ÈÎÎñÁ´£º"..myTaskLinks);
            myTaskLinksCount = 0
            myTaskLoops = myTaskLoops + 1

            if (myTaskLoops >= TL_MAXLOOPS) then
                myTaskLoops = 0
            end

            tl_settaskstate(1, myTaskTimes)
            tl_settaskstate(2, myTaskLinks)
            tl_settaskstate(6, myTaskLinksCount)

        end

        if (myTaskLinksCount == tl_gettasklinknum(myTaskLinks)) then -- NÕu chuçi nµy ®· hoµn thµnh sè chuçi cÇn hoµn thµnh
            myTaskLinks = myTaskLinks + 1
            myTaskLinksCount = 0
        end

    end

    tl_settaskstate(1, myTaskTimes)
    tl_settaskstate(2, myTaskLinks)
    tl_settaskstate(3, myTaskLoops)
    tl_settaskstate(6, myTaskLinksCount)

    -- ë ®©y ghi l¹i tæng sè nhiÖm vô
    nt_setTask(1044, tl_counttasklinknum(1));

end




-- Hµm kiÓm tra, dïng ®Ó x¸c nhËn ng­êi ch¬i ®· hoµn thµnh nhiÖm vô ch­a
-- Gi¸ trŞ tr¶ vÒ:
-- 1: §· ®¹t ®iÒu kiÖn
-- 0: Ch­a thÓ hoµn thµnh
-- Tham sè truyÒn vµo nTaskGoods cã nhiÒu c¸ch biÓu thŞ:
-- NÕu lµ nhiÖm vô 1: Lo¹i, Ph©n lo¹i, Chi tiÕt lo¹i, Ngò hµnh, CÊp ®é
-- NÕu lµ nhiÖm vô 2: Lo¹i, Ph©n lo¹i, Chi tiÕt lo¹i, Ngò hµnh, CÊp ®é, ID thuéc tİnh phĞp thuËt, Giíi h¹n d­íi thuéc tİnh phĞp thuËt, Giíi h¹n trªn thuéc tİnh phĞp thuËt
-- NÕu lµ nhiÖm vô 3: ID thuéc tİnh phĞp thuËt, Giíi h¹n d­íi thuéc tİnh phĞp thuËt, Giíi h¹n trªn thuéc tİnh phĞp thuËt
function tl_checktask(nTaskGoods)

    local i, j

	-- NhiÖm vô yªu cÇu vËt phÈm
	local myTaskGoods

	-- Lo¹i, ph©n lo¹i, chi tiÕt lo¹i, ngò hµnh, cÊp ®é cña vËt phÈm nhiÖm vô yªu cÇu
	local myGenre, myDetail, myParticular, myGoodsFive, myLevel, myMagicID, myMagicMax, myMagicMin

	-- Lo¹i vËt phÈm nhiÖm vô yªu cÇu: kh«ng cã thuéc tİnh phĞp thuËt vµ cã thuéc tİnh phĞp thuËt
	local myGoodsClean, myGoodsMagic

	-- ID b¶n ®å, sè l­îng b¶n ®å vµ lo¹i b¶n ®å mµ nhiÖm vô yªu cÇu
	local myTaskMaps, myTaskMapNum, myTaskMapType

	-- Gi¸ trŞ sè vµ lo¹i gi¸ trŞ sè cÇn n©ng cÊp mµ nhiÖm vô yªu cÇu
	local myTaskValue, myTaskValueType, myOrgValue

	-- Sè l­îng b¶n ®å S¬n Hµ X· T¾c mµ nhiÖm vô yªu cÇu
	local myWorldMaps, nWorldMaps

	-- LÊy lo¹i nhiÖm vô hiÖn t¹i ng­êi ch¬i ®ang nhËn
    local myTaskType = tl_getplayertasktype()
    local myTaskID = tl_gettasktablecol()

    if (myTaskType == 1) then

        myGenre = tonumber(TabFile_GetCell(TL_BUYGOODS, myTaskID, "Genre"))
        myDetail = tonumber(TabFile_GetCell(TL_BUYGOODS, myTaskID, "Detail"))
        myParticular = tonumber(TabFile_GetCell(TL_BUYGOODS, myTaskID, "Particular"))
        myGoodsFive = tonumber(TabFile_GetCell(TL_BUYGOODS, myTaskID, "GoodsFive"))
        myLevel = tonumber(TabFile_GetCell(TL_BUYGOODS, myTaskID, "Level"))

        myTaskGoods = {myGenre, myDetail, myParticular, myGoodsFive, myLevel}

        -- tl_print("ÈÎÎñËùÒªÇóµÄÎïÆ·Îª£º"..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
        if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and
            (nTaskGoods[4] == myTaskGoods[4]) and (nTaskGoods[5] == myTaskGoods[5]) then
            return 1
        else
            return 0
        end

    elseif (myTaskType == 2) then

        myGenre = tonumber(TabFile_GetCell(TL_FINDGOODS, myTaskID, "Genre"))
        myDetail = tonumber(TabFile_GetCell(TL_FINDGOODS, myTaskID, "Detail"))
        myParticular = tonumber(TabFile_GetCell(TL_FINDGOODS, myTaskID, "Particular"))

        myGoodsFive = TabFile_GetCell(TL_FINDGOODS, myTaskID, "GoodsFive")

        if (myGoodsFive == "n") then
            myGoodsFive = 0
            nTaskGoods[5] = 0
        else
            myGoodsFive = tonumber(myGoodsFive)
        end

        myLevel = TabFile_GetCell(TL_FINDGOODS, myTaskID, "Level")

        if (myLevel == "n") then
            myLevel = 0
            nTaskGoods[4] = 0
        else
            myLevel = tonumber(myLevel)
        end

        myMagicID = TabFile_GetCell(TL_FINDGOODS, myTaskID, "MagicEnName")
        myMagicMax = tonumber(TabFile_GetCell(TL_FINDGOODS, myTaskID, "MaxValue"))
        myMagicMin = tonumber(TabFile_GetCell(TL_FINDGOODS, myTaskID, "MinValue"))

        myTaskGoods = {myGenre, myDetail, myParticular, myLevel, myGoodsFive, myMagicID, myMagicMin, myMagicMax}
        myGoodsClean = {nTaskGoods[1], nTaskGoods[2], nTaskGoods[3], nTaskGoods[4], nTaskGoods[5]} -- NÕu kh«ng dïng thuéc tİnh phĞp thuËt ®Ó ph¸n ®o¸n th× lÊy gi¸ trŞ nµy
        myGoodsMagic = {nTaskGoods[1], nTaskGoods[2], nTaskGoods[3], nTaskGoods[4], nTaskGoods[5], nTaskGoods[6],
                        nTaskGoods[7], nTaskGoods[8]}

        if (myMagicID == "n") then
            -- tl_print("ÈÎÎñËùÒªÇóµÄÎïÆ·Îª£º"..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
            if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and
                (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and
                (nTaskGoods[5] == myTaskGoods[5]) then
                return 1
            else
                return 0
            end
        else
            myMagicID = tonumber(myMagicID)
            -- tl_print("ÈÎÎñËùÒªÇóµÄÎïÆ·Îª£º"..myGenre..myDetail..myParticular..myLevel..myGoodsFive.."Ä§·¨ÊôĞÔ£º"..myMagicID.." ×îĞ¡Öµ£º"..myMagicMin.." ×î´óÖµ£º"..myMagicMax)
            if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and
                (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[6] == myMagicID) and
                (tonumber(nTaskGoods[7]) >= myMagicMin) and (tonumber(nTaskGoods[7]) <= myMagicMax) then
                return 1
            else
                return 0
            end
        end

    elseif (myTaskType == 3) then

        myMagicID = tonumber(TabFile_GetCell(TL_SHOWGOODS, myTaskID, "MagicEnName"))
        myMagicMin = tonumber(TabFile_GetCell(TL_SHOWGOODS, myTaskID, "MinValue"))
        myMagicMax = tonumber(TabFile_GetCell(TL_SHOWGOODS, myTaskID, "MaxValue"))

        -- tl_print("ÈÎÎñËùÒªÇóµÄÎïÆ·Îª£º"..myMagicID..myMagicMin..myMagicMax)

        if (nTaskGoods[1] == myMagicID) and (nTaskGoods[2] >= myMagicMin) and (nTaskGoods[2] <= myMagicMax) then
            return 1
        else
            return 0
        end

    elseif (myTaskType == 4) then

        myTaskMapNum = nt_getTask(1025)

        if (myTaskMapNum >= tonumber(TabFile_GetCell(TL_FINDMAPS, myTaskID, "Num"))) then
            myTaskMapNum = 0
            nt_setTask(1025, myTaskMapNum) -- ÖØĞÂÖÃ 0
            return 1
        else
            return 0
        end

    elseif (myTaskType == 5) then

        myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND, myTaskID, "NumericType"))
        myTaskValue = tonumber(TabFile_GetCell(TL_UPGROUND, myTaskID, "NumericValue"))

        if (myTaskValueType == 2) then
            if (tl_countuplevelexp(nt_getTask(1033), nt_getTask(1034)) >=
                tonumber(TabFile_GetCell(TL_UPGROUND, myTaskID, "NumericValue"))) then
                return 1
            else
                return 0
            end
        elseif (myTaskValueType == 3) then -- Gi¸ trŞ danh väng
            myOrgValue = GetRepute()
            if (myOrgValue - (nt_getTask(1026)) >= myTaskValue) then
                return 1
            else
                return 0
            end
        elseif (myTaskValueType == 4) then -- Gi¸ trŞ phóc duyªn
            myOrgValue = nt_getTask(151)
            if (myOrgValue - (nt_getTask(1026)) >= myTaskValue) then
                return 1
            else
                return 0
            end
        elseif (myTaskValueType == 5) then -- Gi¸ trŞ PK
            myOrgValue = GetPK()
            if (myOrgValue - (nt_getTask(1026)) >= myTaskValue) then
                return 1
            else
                return 0
            end
        elseif (myTaskValueType == 6) then -- Tèng Kim tİch lòy
            myOrgValue = nt_getTask(747)
            if (myOrgValue - (nt_getTask(1026)) >= myTaskValue) then
                return 1
            else
                return 0
            end
        end

    elseif (myTaskType == 6) then
        myWorldMaps = tonumber(TabFile_GetCell(TL_WORLDMAPS, myTaskID, "Num"))
        if (nt_getTask(1027) >= myWorldMaps) then
            nWorldMaps = nt_getTask(1027) - myWorldMaps -- ë ®©y ®· xãa c¸c m¶nh b¶n ®å S¬n Hµ X· T¾c cÇn thiÕt
            nt_setTask(1027, nWorldMaps)
            return 1
        else
            return 0
        end
    end

end


-- Hµm con, dïng ®Ó x¸c ®Şnh lo¹i nhiÖm vô cô thÓ mµ ng­êi ch¬i hiÖn ®ang nhËn.
-- Gi¸ trŞ tr¶ vÒ lµ 1~6, nÕu lµ 0 th× ng­êi ch¬i vÉn ch­a kİch ho¹t chuçi nhiÖm vô.
function tl_getplayertasktype()

    local myTaskType

    --	myTaskType = strsub(format("%d",nt_getTask(1021),1,1))
    myTaskType = nt_getTask(1021)

    return myTaskType

end



-- Hµm con, dïng ®Ó thiÕt lËp lo¹i nhiÖm vô cô thÓ mµ ng­êi ch¬i hiÖn ®ang nhËn
function tl_setplayertasktype(myTaskType)
	nt_setTask(1021,myTaskType)
end


-- Hµm con, dïng ®Ó ghi l¹i sè dßng trong b¶ng cô thÓ t­¬ng øng víi nhiÖm vô hiÖn t¹i cña ng­êi ch¬i
function tl_savetasktablecol(myTaskCol)
	nt_setTask(1030,myTaskCol)
end


-- Hµm con, dïng ®Ó ®äc sè dßng trong b¶ng cô thÓ t­¬ng øng víi nhiÖm vô hiÖn t¹i cña ng­êi ch¬i
function tl_gettasktablecol()
	return nt_getTask(1030)
end


-- Hµm con, kiÓm tra tr¹ng th¸i nhiÖm vô
-- 1: Sè lÇn ®ang tiÕn hµnh
-- 2: Sè chuçi ®ang tiÕn hµnh
-- 3: Sè vßng ®ang tiÕn hµnh
-- 4: Sè lÇn hñy cßn l¹i
-- 5: M· nhiÖm vô hiÖn t¹i ng­êi ch¬i ®ang nhËn ®­îc l­u trªn 1021
-- 6: Ng­êi ch¬i ®· lµm bao nhiªu lÇn trong chuçi nµy cña mçi vßng, tèi ®a lµ 4
function tl_gettaskstate(myTaskState)

    local n

    if (myTaskState <= 4) then
        n = GetByte(nt_getTask(1020), myTaskState)
    elseif (myTaskState == 5) then
        n = nt_getTask()
    elseif (myTaskState == 6) then
        n = nt_getTask(1035)
    end

    return n

end



-- Hµm con, thiÕt lËp tr¹ng th¸i nhiÖm vô
-- 1: Sè lÇn ®ang tiÕn hµnh
-- 2: Sè chuçi ®ang tiÕn hµnh
-- 3: Sè vßng ®ang tiÕn hµnh
-- 5: M· nhiÖm vô hiÖn t¹i ng­êi ch¬i ®ang nhËn ®­îc l­u trªn 1021
-- 6: Ng­êi ch¬i ®· lµm bao nhiªu lÇn trong chuçi nµy cña mçi vßng
function tl_settaskstate(myTaskState, myTaskValue)

    local n

    if (myTaskState <= 3) then
        n = nt_getTask(1020)
        nt_setTask(1020, SetByte(n, myTaskState, myTaskValue))
    elseif (myTaskState == 4) then
        n = nt_getTask(1020)
        if myTaskValue <= 254 then
            nt_setTask(1020, SetByte(n, myTaskState, myTaskValue))
        else
            Msg2Player("Sè lÇn b¹n xãa bá ®· ®¹t ®Õn giíi h¹n <color=yellow>254 lÇn<color>, kh«ng thÓ t¨ng thªm!");
            return
        end
    elseif (myTaskState == 6) then
        nt_setTask(1035, myTaskValue)
    end

end



-- Hµm con, thiÕt lËp tr¹ng th¸i tiÕn ®é cña nhiÖm vô hiÖn t¹i, 0, 1, 2, 3
-- 0: Ch­a b¾t ®Çu
-- 1: §· nhËn nh­ng ch­a hoµn thµnh
-- 2: §· hoµn thµnh nh­ng ch­a nhËn th­ëng
-- 3: §· hoµn thµnh vµ nhËn th­ëng
function tl_settaskcourse(myTaskCourse)
	nt_setTask(1028,myTaskCourse)
end


-- Hµm con, lÊy tr¹ng th¸i tiÕn ®é cña nhiÖm vô hiÖn t¹i, O, 1, 2, 3
-- 0: Ch­a b¾t ®Çu
-- 1: §· nhËn nh­ng ch­a hoµn thµnh
-- 2: §· hoµn thµnh nh­ng ch­a nhËn th­ëng
-- 3: §· hoµn thµnh vµ nhËn th­ëng
function tl_gettaskcourse()
	return nt_getTask(1028)
end


-- Hµm con, ghi l¹i gi¸ trŞ sè cña yÕu tè ®èi tho¹i
function tl_savetalkvalue(myValueType,myTalkValue)

	if (myValueType==1) then
		nt_setTask(1038,myTalkValue)
	elseif (myValueType==2) then
		nt_setTask(1039,myTalkValue)
	elseif (myValueType==3) then
		nt_setTask(1040,myTalkValue)
	elseif (myValueType==4) then
		nt_setTask(1041,myTalkValue)
	elseif (myValueType==5) then
		nt_setTask(1042,myTalkValue)
	elseif (myValueType==6) then
		nt_setTask(1043,myTalkValue)
	end
	
end


-- Hµm con, lÊy gi¸ trŞ sè cña yÕu tè ®èi tho¹i
function tl_gettalkvalue(myValueType)

    local myTalkValue

    if (myValueType == 1) then
        myTalkValue = nt_getTask(1038)
    elseif (myValueType == 2) then
        myTalkValue = nt_getTask(1039)
    elseif (myValueType == 3) then
        myTalkValue = nt_getTask(1040)
    elseif (myValueType == 4) then
        myTalkValue = nt_getTask(1041)
    elseif (myValueType == 5) then
        myTalkValue = nt_getTask(1042)
    elseif (myValueType == 6) then
        myTalkValue = nt_getTask(1043)
    end

    return myTalkValue

end



-- //////////////////////////////////////////////////////////////////////////////
-- //                  §äc b¶ng vµ xö lı gi¸ trŞ nhiÖm vô                     //
--/////////////////////////////////////////////////////////////////////////////

-- T×m kiÕm b¶ng nhiÖm vô t­¬ng øng víi cÊp ®é, x¸c ®Şnh cÊp ®é ®Çu tiªn cña chuçi nhiÖm vô hiÖn t¹i cña ng­êi ch¬i thuéc cÊp nµo
function tl_getfirstlink()

	local i
	local myLevel = GetLevel()
	local myTaskLevel,myBelongLevel
	
	for i=1,getn(Task_MainTaskLink) do
		myTaskLevel = Task_MainTaskLink[i][1]
		if (myLevel>=myTaskLevel) then
			myBelongLevel = Task_MainTaskLink[i][2]
		end
	end
	
	return myBelongLevel

end


-- T×m kiÕm b¶ng tæng hîp chuçi nhiÖm vô, lÊy nhiÖm vô lo¹i ngÉu nhiªn theo cÊp ®é t­¬ng øng
-- Tham sè truyÒn vµo myTaskLevel lµ cÊp ®é cña chuçi nhiÖm vô 1~20
-- Gi¸ trŞ tr¶ vÒ lµ 1~6: 1: Mua vËt phÈm 2: T×m vËt phÈm 3: Tr­ng bµy vËt phÈm 4: Thu thËp b¶n ®å 5: T¨ng gi¸ trŞ 6: b¶n ®å S¬n Hµ X· T¾c
function tl_gettasktype(myTaskLevel)

	local i,j,k = 0,0,0
	local myMainRate = 0 -- Tæng tû lÖ cña tÊt c¶ c¸c lo¹i nhiÖm vô trong mét cÊp ®é
	local myTaskType -- Lo¹i nhiÖm vô ®­îc tr¶ vÒ
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		myMainRate = myMainRate + Task_MainLevelRate[myTaskLevel][i]
	end
	
	-- Dùa vµo c«ng thøc träng sè cuèi cïng ngÉu nhiªn tİnh to¸n lo¹i nhiÖm vô
	j = random(1,myMainRate)
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		k = k + Task_MainLevelRate[myTaskLevel][i]
		if ( j <= k) then
			return i
		end
	end
	
	-- Xö lı ngo¹i lÖ, nÕu ng­êi ch¬i kh«ng chän ®­îc lo¹i nhiÖm vô nµo th× chän 4

    -- tl_print("Script gÆp lçi khi chän lo¹i nhiÖm vô!");
	
	return 0

end


-- T×m kiÕm chuçi nhiÖm vô, lÊy nhiÖm vô t­¬ng øng
-- Gi¸ trŞ tr¶ vÒ lµ sè dßng cña nhiÖm vô ®ã trong b¶ng
function tl_gettasklink(myTaskType, myTaskLevel)

    local myTaskCol -- Ghi l¹i sè dßng cña nhiÖm vô

    if (myTaskType == 1) then -- NÕu lµ nhiÖm vô mua vËt phÈm
        myTaskCol = tl_selecttask(Task_BuyGoods, myTaskLevel)
    elseif (myTaskType == 2) then
        myTaskCol = tl_selecttask(Task_FindGoods, myTaskLevel)
    elseif (myTaskType == 3) then
        myTaskCol = tl_selecttask(Task_ShowGoods, myTaskLevel)
    elseif (myTaskType == 4) then
        myTaskCol = tl_selecttask(Task_FindMaps, myTaskLevel)
    elseif (myTaskType == 5) then
        myTaskCol = tl_selecttask(Task_UpGround, myTaskLevel)
    elseif (myTaskType == 6) then
        myTaskCol = tl_selecttask(Task_WorldMaps, myTaskLevel)
    end

    return myTaskCol

end




-- Dùa vµo träng sè trong danh s¸ch nhiÖm vô ®Ó ngÉu nhiªn chän nhiÖm vô, gi¸ trŞ tr¶ vÒ lµ sè dßng cña nhiÖm vô t­¬ng øng trong b¶ng.
function tl_selecttask(myTaskTable, myTaskLevel)

    local i, j, k = 0, 0, 0
    local myMainRate = 0 -- Tæng träng sè cña nhiÖm vô

    for i = 1, getn(myTaskTable[myTaskLevel]) do
        myMainRate = myMainRate + myTaskTable[myTaskLevel][i][2]
    end

    -- Dùa vµo c«ng thøc träng sè cuèi cïng ngÉu nhiªn tİnh to¸n nhiÖm vô cô thÓ
    j = random(1, myMainRate)

	-- tl_print ("Tæng träng sè cña nhiÖm vô:  "..myMainRate)
    -- tl_print ("Träng sè nhiÖm vô ngÉu nhiªn nhËn ®­îc:  "..j)

    for i = 1, getn(myTaskTable[myTaskLevel]) do

        k = k + myTaskTable[myTaskLevel][i][2]

        if (j < k) then
            --			tl_print ("Ñ¡Ôñµ½ÁË±í¸ñÖĞµÄµÚ  "..myTaskTable[myTaskLevel][i][1].."  ĞĞ¡£")
            return myTaskTable[myTaskLevel][i][1]
        end

    end

    -- Xö lı bÊt th­êng, nÕu ng­êi ch¬i kh«ng thÓ chän th× tr¶ vÒ 2, dï thÕ nµo còng ®Ó ng­êi ch¬i tiÕp tôc tiÕn hµnh
    --	tl_print ("½Å±¾ÔÚÑ¡Ôñ¾ßÌåµÄÈÎÎñÊ±³ö´í£¡")
    return 2

end



-- Hµm con, tr¶ vÒ mét chuçi kı tù ®Şnh danh cña b¶ng t­¬ng øng víi lo¹i nhiÖm vô
function tl_gettasktextID(myTaskType)

local myTaskTextID

	if (myTaskType == 1) then
		myTaskTextID = TL_BUYGOODS
	elseif (myTaskType == 2) then
		myTaskTextID = TL_FINDGOODS
	elseif (myTaskType == 3) then
		myTaskTextID = TL_SHOWGOODS
	elseif (myTaskType == 4) then
		myTaskTextID = TL_FINDMAPS
	elseif (myTaskType == 5) then
		myTaskTextID = TL_UPGROUND
	elseif (myTaskType == 6) then
		myTaskTextID = TL_WORLDMAPS
	end
	
	return myTaskTextID
end


-- Tİnh to¸n tû lÖ phÇn tr¨m träng sè cña mét nhiÖm vô ë cÊp ®é hiÖn t¹i
-- myTableName: truyÒn vµo chuçi kı tù tªn b¶ng cÇn ®äc
-- myTaskRate: träng sè cña nhiÖm vô hiÖn t¹i
-- myTableCol: cét cña b¶ng cÇn ®äc (chuçi kı tù hoÆc sè)
function tl_counttaskrate(myTableName, myTaskRate, myTableCol)

    local i
    local myTotalRate = 0
    local myReadRate
    local myPercent

    local myTableRow = TabFile_GetRowCount(myTableName) -- LÊy tæng sè dßng cña file TABLE

    for i = 3, myTableRow - 1 do
        myReadRate = tonumber(TabFile_GetCell(myTableName, myTableRow, myTableCol))
        myTotalRate = myTotalRate + myReadRate
        i = i + 1
    end

    myPercent = (myTaskRate / myTotalRate) * 100

    return myPercent

end



-- Tİnh to¸n l­îng kinh nghiÖm cÇn thiÕt ®Ó n©ng cÊp tõ cÊp ®é cò lªn cÊp ®é hiÖn t¹i cña ng­êi ch¬i
function tl_countuplevelexp(myOldLevel, myOldExp)

    local i
    local myLevel = GetLevel()
    local myExp = GetExp()
    local nNowExp = tonumber(TabFile_GetCell(TL_UPLEVELEXP, myLevel + 1, 2)) -- Kinh nghiÖm cÇn thiÕt cho cÊp ®é hiÖn t¹i

    local myTotalExp = 0

    if (myOldLevel < myLevel) then

        for i = myOldLevel, myLevel do
            myTotalExp = myTotalExp + tonumber(TabFile_GetCell(TL_UPLEVELEXP, i + 1, 2))
        end

        myTotalExp = (myTotalExp - myOldExp) - (nNowExp - myExp)

        return myTotalExp
    else
        return myExp - myOldExp
    end

end


-- Hµm con, tİnh to¸n sè lÇn chuçi hiÖn t¹i cÇn ®­îc thùc hiÖn liªn tiÕp trong chuçi cïng cÊp ®é
-- §· qua kiÓm tra, ®¶m b¶o kh«ng lçi, cÊp 1~20 ®Òu cã thÓ tr¶ vÒ chİnh x¸c
function tl_gettasklinknum(myTaskLink)

    local myTaskLevel
    local myTaskLinks, myTaskLinksNum

    myTaskLevel, myTaskLinksNum = tl_getlinksforlevel(myTaskLink)

    myTaskLinksNum = Task_MainTaskLink[myTaskLevel][3] - Task_MainTaskLink[myTaskLevel][2] + 1

    if (myTaskLink == Task_MainTaskLink[myTaskLevel][3]) then
        myTaskLinks = 20 - ((myTaskLinksNum - 1) * floor(20 / (myTaskLinksNum)))
    else
        myTaskLinks = floor(20 / (myTaskLinksNum))
    end

    return myTaskLinks

end


-- Hµm con, x¸c ®Şnh chuçi nµy thuéc vÒ chuçi cÊp ®é ®Çu tiªn, vµ tr¶ vÒ sè l­îng thµnh viªn trong chuçi ®ã
function tl_getlinksforlevel(myTaskLink)

    local i, j = 0, 0
    local myTaskLevel, myTaskLinksNum

    -- §Çu tiªn x¸c ®Şnh chuçi nµy thuéc vÒ chuçi cÊp ®é nµo
    for i = 1, getn(Task_MainTaskLink) do
        for j = Task_MainTaskLink[i][2], Task_MainTaskLink[i][3] do
            if (myTaskLink == j) then
                myTaskLevel = i
            end
        end
    end

    myTaskLinksNum = Task_MainTaskLink[myTaskLevel][3] - Task_MainTaskLink[myTaskLevel][2] + 1

    return myTaskLevel, myTaskLinksNum

end


-- Hµm con, tİnh to¸n ng­êi ch¬i ®· lµm liªn tiÕp bao nhiªu lÇn, bao nhiªu chuçi, bao nhiªu vßng
function tl_counttasklinknum(myCountType)

    local i, j = 0, 0
	local myTaskTimes = tl_gettaskstate(1) -- Sè lÇn ng­êi ch¬i ®· tiÕn hµnh
    local myTaskLinks = tl_gettaskstate(2) -- Sè chuçi ng­êi ch¬i ®· tiÕn hµnh
    local myTaskLoops = tl_gettaskstate(3) -- Sè vßng ng­êi ch¬i ®· tiÕn hµnh
    local myTaskCancel = tl_gettaskstate(4) -- Sè lÇn ng­êi ch¬i cã thÓ hñy

    local myCountLoops = tl_gettaskstate(3) -- LÊy sè vßng cña ng­êi ch¬i

    local nTaskLevel, nTaskNum = tl_getlinksforlevel(myTaskLinks) -- LÊy cÊp ®é cña chuçi ®ã vµ sè l­îng thµnh viªn cña cÊp ®é ®ã

    if (myTaskLinks == Task_MainTaskLink[nTaskLevel][2]) then -- NÕu chuçi nµy vèn lµ chuçi khëi ®Çu, th× lÊy trùc tiÕp gi¸ trŞ cña nã
        myCountLinks = tl_gettaskstate(6)
    else
        for i = Task_MainTaskLink[nTaskLevel][2], myTaskLinks - 1 do
            j = j + tl_gettasklinknum(i)
        end
        myCountLinks = j + tl_gettaskstate(6)
    end

    if (myCountLinks == 0) then
        myCountTimes = myTaskTimes + (myCountLoops * 400)
    else
        myCountTimes = (myCountLinks * TL_MAXTIMES) + myTaskTimes + (myCountLoops * 400)
    end

    if (tl_gettaskcourse() == 3) or (tl_gettaskcourse() == 2) then
        myCountTimes = myCountTimes + 1
    end

    if (myCountType == 1) then
        return myCountTimes
    elseif (myCountType == 2) then
        return myCountLinks
    elseif (myCountType == 3) then
        return myCountLoops
    end

end


-- Hµm con, lÊy m« t¶ t­¬ng øng cña nhiÖm vô, tr¶ vÒ mét ®o¹n chuçi kı tù
function tl_gettaskinfo()

    local myTaskMainInfo, myTaskOrder, myTaskInfo1, myTaskInfo2, myTaskInfo3

    local myWhen, myWhere, myWho, myWhy1, myWhy2, myWhat, myMainTalk

    local myTaskType = tl_getplayertasktype()

    if (myTaskType == 1) then

        -- Tªn vËt phÈm
        myTaskOrder = TabFile_GetCell(TL_BUYGOODS, tl_gettasktablecol(), "TaskInfo1")
        -- Tªn ®Şa ®iÓm môc tiªu
        myTaskInfo1 = TabFile_GetCell(TL_BUYGOODS, tl_gettasktablecol(), "TaskInfo")

        myWhen = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(1), "When")
        myWho = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(3), "Who")
        myWhat = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(6), "What")

        myMainTalk = "H·y ®i <color=yellow>" .. myTaskInfo1 .. "<color> Mua gióp ta <color=yellow>" .. myTaskOrder .. "<color> vÒ ®©y!";

        myTaskMainInfo = myMainTalk

    elseif (myTaskType == 2) then

		-- Thuéc tİnh phĞp thuËt
		myTaskOrder = TabFile_GetCell(TL_FINDGOODS, tl_gettasktablecol(), "MagicCnName")
		-- Lo¹i vò khİ cô thÓ
		myTaskInfo1 = TabFile_GetCell(TL_FINDGOODS, tl_gettasktablecol(), "TaskInfo")
		-- Thuéc tİnh phĞp thuËt nhá nhÊt
		myTaskInfo2 = TabFile_GetCell(TL_FINDGOODS, tl_gettasktablecol(), "MinValue")
		-- Thuéc tİnh phĞp thuËt lín nhÊt
		myTaskInfo3 = TabFile_GetCell(TL_FINDGOODS, tl_gettasktablecol(), "MaxValue")

        myWhen = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(1), "When")
        myWhere = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(2), "Where")
        myWho = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(3), "Who")
        myWhy1 = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(4), "Why1")
        myWhy2 = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(5), "Why2")
        myWhat = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(6), "What")

        if (myTaskOrder == "n") then
            myTaskMainInfo = "1 c¸i <color=yellow>" .. myTaskInfo1 .. "<color>"
            myMainTalk = "H·y gióp ta ®i t×m mãn nµy: <color=yellow>" .. myTaskMainInfo .. "<color>.";
        else
            myMainTalk = "H·y gióp ta ®i t×m mãn nµy: <color=yellow>" .. myTaskInfo1 .. "<color>£¬<color=yellow>" .. myTaskOrder .. "<color>, nhá nhÊt: <color=yellow>" .. myTaskInfo2 .. "<color>, lín nhÊt: <color=yellow>" .. myTaskInfo3 .. "<color>.";
        end

        myTaskMainInfo = myMainTalk

    elseif (myTaskType == 3) then

        myWhen = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(1), "When")
        myWhy1 = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(4), "Why1")
        myWhat = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(6), "What")

		-- Tªn tiÕng Trung cña thuéc tİnh phĞp thuËt
		myTaskOrder = TabFile_GetCell(TL_SHOWGOODS, tl_gettasktablecol(), "MagicCnName")
		-- Gi¸ trŞ nhá nhÊt cña thuéc tİnh phĞp thuËt
		myTaskInfo1 = TabFile_GetCell(TL_SHOWGOODS, tl_gettasktablecol(), "MinValue")
		-- Gi¸ trŞ lín nhÊt cña thuéc tİnh phĞp thuËt
		myTaskInfo2 = TabFile_GetCell(TL_SHOWGOODS, tl_gettasktablecol(), "MaxValue")

        myMainTalk = "H·y gióp ta ®i t×m mãn nµy: <color=yellow>" .. myTaskOrder .. "<color>, nhá nhÊt: <color=yellow>" .. myTaskInfo1 .. "<color>, lín nhÊt: <color=yellow>" .. myTaskInfo2 .. "<color>! Xem xong ta sÏ tr¶ l¹i cho ng­¬i";

        myTaskMainInfo = myMainTalk

    elseif (myTaskType == 4) then

		-- Tªn b¶n ®å
		myTaskOrder = TabFile_GetCell(TL_FINDMAPS, tl_gettasktablecol(), "TaskInfo1")
		-- Sè l­îng b¶n ®å cÇn
		myTaskInfo1 = TabFile_GetCell(TL_FINDMAPS, tl_gettasktablecol(), "Num")
		-- Lo¹i b¶n ®å
		myTaskInfo2 = TabFile_GetCell(TL_FINDMAPS, tl_gettasktablecol(), "MapType")

        myWhen = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(1), "When")
        myWhy1 = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(4), "Why1")
        myWhat = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(6), "What")

        if (tonumber(myTaskInfo2) == 1) then
            myTaskInfo3 = "§Şa §å chİ "
        else
            myTaskInfo3 = "MËt chİ "
        end

        myTaskMainInfo = "Ng­¬i h·y ®Õn <color=yellow>" .. myTaskOrder .. "<color> t×m gióp ta <color=yellow>" .. myTaskInfo1 .. "<color> quyÓn <color=yellow> " .. myTaskInfo3 .. " <color>¡£";

    elseif (myTaskType == 5) then

        myWhen = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(1), "When")
        myWho = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(3), "Who")
        myWhy1 = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(4), "Why1")
        myWhat = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(6), "What")

		-- Lo¹i gi¸ trŞ sè cÇn n©ng cao
		myTaskOrder = TabFile_GetCell(TL_UPGROUND, tl_gettasktablecol(), "NumericType")
		-- Tæng gi¸ trŞ sè cÇn n©ng cao
		myTaskInfo1 = TabFile_GetCell(TL_UPGROUND, tl_gettasktablecol(), "NumericValue")

        if (tonumber(myTaskOrder) == 1) then
            myTaskInfo2 = "®¼ng cÊp"
            myTaskInfo3 = "®¼ng cÊp"
        elseif (tonumber(myTaskOrder) == 2) then
            myTaskInfo2 = "TrŞ kinh nghiÖm"
            myTaskInfo3 = "TrŞ kinh nghiÖm"
        elseif (tonumber(myTaskOrder) == 3) then
            myTaskInfo2 = "Danh väng"
            myTaskInfo3 = "Danh väng"
        elseif (tonumber(myTaskOrder) == 4) then
            myTaskInfo2 = "Phóc Duyªn"
            myTaskInfo3 = "Phóc Duyªn"
        elseif (tonumber(myTaskOrder) == 5) then
            myTaskInfo2 = "®iÓm PK"
            myTaskInfo3 = "®iÓm PK"
        elseif (tonumber(myTaskOrder) == 6) then
            myTaskInfo2 = "®iÓm tİch lòy Tèng Kim "
            myTaskInfo3 = "®iÓm tİch lòy Tèng Kim "
        end

        myTaskMainInfo = "H·y ®i n©ng cÊp <color=yellow>" .. myTaskInfo3 .. " " .. myTaskInfo1 .. "<color>.";

    elseif (myTaskType == 6) then

        myWhen = TabFile_GetCell(TL_TASKWORLDTALK, tl_gettalkvalue(1), "When")
        myWho = TabFile_GetCell(TL_TASKWORLDTALK, tl_gettalkvalue(3), "Who")

        -- M¶nh b¶n ®å S¬n Hµ X· T¾c cÇn thu thËp
        myTaskOrder = TabFile_GetCell(TL_WORLDMAPS, tl_gettasktablecol(), "Num")

        myTaskMainInfo = "H·y ®i t×m gióp ta <color=yellow>" .. myTaskOrder .. "<color> m¶nh b¶n ®å S¬n Hµ X· T¾c";
    end

    return myTaskMainInfo

end



-- Hµm dïng ®Ó tİch lòy kinh nghiÖm cho ng­êi ch¬i
function tl_addPlayerExp(myExpValue)

    local myOwnExp = 0
    local myNeedExp = 0
    local myPayExp = 0

    -- LLG_MODIFY_20060603
    -- Phßng ngõa vßng chÕt, tèi ®a lªn 100 cÊp
    -- while (myExpValue>0) do
    local i = 0;
    for i = 0, 100 do
        if (myExpValue <= 0) then
            return
        end
        myOwnExp = GetExp()
        myNeedExp = tonumber(TabFile_GetCell(TL_UPLEVELEXP, GetLevel() + 1, 2)) - myOwnExp

        if (myExpValue < myNeedExp) then
            AddOwnExp(myExpValue)
            myExpValue = 0
        else
            myExpValue = myExpValue - myNeedExp
            AddOwnExp(myNeedExp)
        end

    end

end



-- Dïng ®Ó in th«ng b¸o DEBUG cña chuçi nhiÖm vô
function tl_print(myPrintText)
--  print ("Th«ng b¸o chuçi nhiÖm vô: "..myPrintText);
end


-- Hµm con, dïng ®Ó lÊy giíi tİnh cña ng­êi ch¬i, trùc tiÕp tr¶ vÒ chuçi kı tù
function GetPlayerSex()
    local mySex -- Dïng ®Ó hiÓn thŞ kı tù giíi tİnh nh©n vËt

    if (GetSex() == 0) then
        mySex = "C«ng tö "
    else
        mySex = "N÷ hiÖp"
    end

    return mySex
end


function AssignValue(myTaskVariable, myTaskTextID)

    local i, j, k = 0, 0, 0
    local myTaskIndex = {}
    myTaskVariable = {}
    myTaskVariable[1] = {}
    myTaskVariable[1][1] = {}

    local myTableRow = TabFile_GetRowCount(myTaskTextID)
    local myColText
    local myReadRate

    --	tl_print (format("%s%s%s",myTaskTextID,"  :  ",myTableRow))

    for i = 1, 20 do
        myTaskVariable[i] = {}
        for j = 1, myTableRow - 1 do
            myTaskVariable[i][j] = {0, 0}
        end
    end

    for i = 1, 20 do
        myTaskIndex[i] = 0
    end

    for i = 1, 20 do -- ´ÓµÚÒ»¼¶µ½µÚ¶şÊ®¼¶µÄÀú±éÑ­»·
        for j = 2, myTableRow do
            myColText = format("%s%s", "TaskRate", i)
            myReadRate = tonumber(TabFile_GetCell(myTaskTextID, j, myColText))

            if (myReadRate ~= nil) then -- Èç¹ûÔÚÈÎÎñÁ´µÈ¼¶È¨ÖØÀïÃæÓĞÊıÖµµÄ»°£¬ÔòÊôÓÚÕâ¸öµÈ¼¶

                myTaskIndex[i] = myTaskIndex[i] + 1
                myTaskVariable[i][myTaskIndex[i]] = {j, myReadRate}
            end
        end
    end

    return myTaskVariable

end


-- CÊu t¹o b¶ng nhiÖm vô
function AssignValue_TaskLink(myTaskVariable, myTaskTextID)

    local myTaskLevel, myTaskStart, myTaskEnd
    local i, j = 0, 0

    myTaskVariable = {}
    myTaskVariable[1] = {}

    local myTableRow = TabFile_GetRowCount(myTaskTextID)

    for i = 1, myTableRow - 1 do
        myTaskVariable[i] = {0, 0, 0}
    end

    for i = 2, myTableRow do

        j = j + 1

        -- Ghi l¹i chuçi cÊp ®é nµy: cÊp ®é yªu cÇu, gi¸ trŞ ban ®Çu vµ gi¸ trŞ cao nhÊt
        if (i < myTableRow) then

            myTaskLevel = tonumber(TabFile_GetCell(myTaskTextID, i, 1))
            myTaskStart = tonumber(TabFile_GetCell(myTaskTextID, i, 2))
            myTaskEnd = tonumber(TabFile_GetCell(myTaskTextID, i + 1, 2)) - 1

            myTaskVariable[j] = {myTaskLevel, myTaskStart, myTaskEnd}

        elseif (i == myTableRow) then

            myTaskLevel = tonumber(TabFile_GetCell(myTaskTextID, i, 1))
            myTaskStart = tonumber(TabFile_GetCell(myTaskTextID, i, 2))
            myTaskEnd = TL_MAXLINKS

            myTaskVariable[j] = {myTaskLevel, myTaskStart, myTaskEnd}

        end

        --		tl_print("ÈÎÎñµÈ¼¶Á´£º"..j.."Ê±³õÊ¼ÖµÎª£º"..myTaskVariable[j][2].."  ×î¸ßÖµÎª£º"..myTaskVariable[j][3].."  ĞèÇóµÈ¼¶Îª£º"..myTaskVariable[j][1]);

    end

    return myTaskVariable

end


-- ChØ sè tû lÖ cña tÊt c¶ c¸c lo¹i nhiÖm vô trong mçi cÊp ®é
function AssignValue_TaskRate(myTaskVariable, myTaskTextID)

    local i, j, k

    myTaskVariable = {}
    myTaskVariable[1] = {}

	local myTableRow = TabFile_GetRowCount(myTaskTextID) -- LÊy tæng sè dßng cña file TABLE
    local myTableCol -- Hîp nhÊt chuçi kı tù, cÊu t¹o tiªu ®Ò b¶ng: "level20"
    local myRate

    for i = 1, TL_MAXLINKS do
        myTaskVariable[i] = {}
        for j = 1, 6 do
            myTaskVariable[i][j] = 0
        end
    end

    k = 0

    for i = 1, TL_MAXLINKS do
        for j = 2, myTableRow do
            k = j - 1
            myTableCol = format("%s%s", "level", i)
            myRate = tonumber(TabFile_GetCell(myTaskTextID, j, myTableCol))
            myTaskVariable[i][k] = myRate
        end
    end

    return myTaskVariable

end



-- CÊu t¹o b¶ng l­u tr÷ phÇn th­ëng
function AssignValue_Award(myTaskVariable, myTaskTextID)

    local i, j = 0, 1

    myTaskVariable = {}
    myTaskVariable[1] = {}

    local myTableRow = TabFile_GetRowCount(myTaskTextID)

    for i = 1, myTableRow - 1 do
        myTaskVariable[i] = {}
    end

    for i = 1, myTableRow - 1 do
        j = i + 1
        myTaskVariable[i] = {j, tonumber(TabFile_GetCell(myTaskTextID, j, "TaskValue"))}
        --		tl_print ("ÔÚ "..myTaskTextID.."  ÖĞ ".."  µÚ "..i.." ¸öÔªËØ£º".." µÚ  "..j.."  ĞĞµÄ¼ÛÖµÁ¿ÊÇ  "..tonumber(TabFile_GetCell(myTaskTextID,j,"TaskValue")))
    end

    return myTaskVariable

end



-- CÊu t¹o chØ môc l­u tr÷ ®èi tho¹i nhiÖm vô t×m vËt phÈm
function AssignValue_TaskTalk(myTaskVariable, myTaskTextID)

    local i, j = 0, 0
    local myTextValue

    myTaskVariable = {{0}, {0}, {0}, {0}, {0}, {0}} -- S¸u yÕu tè lÇn l­ît lµ: thêi gian, ®Şa ®iÓm, nh©n vËt, nguyªn nh©n mét vµ hai, sù kiÖn

    local myTableRow = TabFile_GetRowCount(myTaskTextID)

    tl_print("Sè hµng t×m ®­îc lµ:" .. myTableRow);

    -- CÊu t¹o m¶ng thêi gian
    for i = 1, myTableRow - 1 do
        j = i + 1
        myTextValue = TabFile_GetCell(myTaskTextID, j, "When")
        if (myTextValue ~= "n") then
            myTaskVariable[1][i] = j
        end
    end

    -- CÊu t¹o m¶ng ®Şa ®iÓm
    for i = 1, myTableRow - 1 do
        j = i + 1
        myTextValue = TabFile_GetCell(myTaskTextID, j, "Where")
        if (myTextValue ~= "n") then
            myTaskVariable[2][i] = j
        end
    end

    -- CÊu t¹o m¶ng nh©n vËt
    for i = 1, myTableRow - 1 do
        j = i + 1
        myTextValue = TabFile_GetCell(myTaskTextID, j, "Who")
        if (myTextValue ~= "n") then
            myTaskVariable[3][i] = j
        end
    end

    -- CÊu t¹o m¶ng nguyªn nh©n mét
    for i = 1, myTableRow - 1 do
        j = i + 1
        myTextValue = TabFile_GetCell(myTaskTextID, j, "Why1")
        if (myTextValue ~= "n") then
            myTaskVariable[4][i] = j
        end
    end

    -- CÊu t¹o m¶ng nguyªn nh©n hai
    for i = 1, myTableRow - 1 do
        j = i + 1
        myTextValue = TabFile_GetCell(myTaskTextID, j, "Why2")
        if (myTextValue ~= "n") then
            myTaskVariable[5][i] = j
        end
    end

    -- CÊu t¹o m¶ng sù kiÖn
    for i = 1, myTableRow - 1 do
        j = i + 1
        myTextValue = TabFile_GetCell(myTaskTextID, j, "What")
        if (myTextValue ~= "n") then
            myTaskVariable[6][i] = j
        end
    end

    for i = 1, 6 do
        tl_print("§èi tho¹i nhiÖm vô hiÖn t¹i  " .. i .. "  Tæng sè ch÷ sè nguyªn tè lµ: " .. getn(myTaskVariable[i]));
    end

    return myTaskVariable

end