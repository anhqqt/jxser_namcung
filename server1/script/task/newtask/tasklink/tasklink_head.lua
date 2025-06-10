-- File head k�ch b�n chu�i nhi�m v� D� T�u
-- Edited by peres
-- 2004/12/25 S�ng Gi�ng Sinh
-- Translate by Anh Quach (07-06-2025)

Include("\\script\\global\\fuyuan.lua"); -- D�ng �� l�y file ph�c duy�n
Include("\\script\\task\\newtask\\newtask_head.lua"); -- File head c�a h� th�ng nhi�m v� m�i, d�ng �� ��ng b� bi�n s�

IncludeLib("FILESYS");
IncludeLib("BATTLE");

TL_MAXTIMES = 20 -- M�i chu�i c� 20 nhi�m v�
TL_MAXLINKS = 20 -- M�i v�ng c� 20 chu�i
TL_MAXLOOPS = 20 -- Ng��i ch�i t�ng c�ng c� th� l�m 20 v�ng nhi�m v�
-- TL_MAXLINKSCOUNT = 4 -- M�i chu�i t�i �a ch� c� th� l�m 4 l�n

TL_UPLEVELEXP = "TaskLink_UpLevel"


DEBUG_TASKVALUE = 1046;  -- D�ng �� truy v�t bi�n s� l�i BUG gian l�n h�y nhi�m v�

ID_TASKLINK_LIMITDATE = 2419;  -- Ghi l�i ng�y gi�i h�n m�i ng�y
ID_TASKLINK_LIMITNUM  = 2420;  -- Ghi l�i s� l�n gi�i h�n m�i ng�y

-- ��ȡ�ļ�ʱ���ַ�������
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

-- Ti�n t�i file TABLE c�a chu�i nhi�m v�
TabFile_Load("\\settings\\task\\tasklink_buygoods.txt",TL_BUYGOODS)
TabFile_Load("\\settings\\task\\tasklink_findgoods.txt",TL_FINDGOODS)
TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
TabFile_Load("\\settings\\task\\tasklink_findmaps.txt",TL_FINDMAPS)
TabFile_Load("\\settings\\task\\tasklink_upground.txt",TL_UPGROUND)
TabFile_Load("\\settings\\task\\tasklink_worldmaps.txt",TL_WORLDMAPS)
TabFile_Load("\\settings\\task\\levellink.txt",TL_LEVELLINK) -- C�p �� kh�i ��u t��ng �ng v�i m�i c�p ��
TabFile_Load("\\settings\\task\\tasklink_mainlink.txt",TL_MAINTASKLEVEL) -- T� l� xu�t hi�n c�a m�i lo�i nhi�m v� trong c�p �� t��ng �ng
TabFile_Load("\\settings\\npc\\player\\level_exp.txt",TL_UPLEVELEXP) -- B�ng kinh nghi�m c�n thi�t �� th�ng c�p

TabFile_Load("\\settings\\task\\award_basic.txt",TL_AWARDBASIC)
TabFile_Load("\\settings\\task\\award_link.txt",TL_AWARDLINK)
TabFile_Load("\\settings\\task\\award_loop.txt",TL_AWARDLOOP)

TabFile_Load("\\settings\\task\\talk\\talk_findgoods.txt",TL_TASKGOODSTALK)
TabFile_Load("\\settings\\task\\talk\\talk_buygoods.txt",TL_TASKBUYTALK)
TabFile_Load("\\settings\\task\\talk\\talk_showgoods.txt",TL_TASKSHOWTALK)
TabFile_Load("\\settings\\task\\talk\\talk_findmaps.txt",TL_TASKFINDMAPS)
TabFile_Load("\\settings\\task\\talk\\talk_upground.txt",TL_TASKUPGROUNDTALK)
TabFile_Load("\\settings\\task\\talk\\talk_worldmap.txt",TL_TASKWORLDTALK)


-- X�c ��nh tr�ng th�i nhi�m v� hi�n t�i c�a ng��i ch�i n�n thu�c v� v�ng th� m�y
function tl_getfirstloop()
	-- Do t�m th�i kh�ng c� s� kh�c bi�t v� v�ng, n�n ch� c� th� l� 0
	return 0
end


-- H�m xu�t cu�i c�ng, giao nhi�m v� cho ng��i ch�i v� ��t v�o bi�n nhi�m v�
function tl_dealtask()

    -- ��u ti�n x�c ��nh c�p �� nhi�m v� / s� chu�i �ang ti�n h�nh c�a ng��i ch�i
    local myTaskLevel = tl_gettaskstate(2)

    -- Sau �� ng�u nhi�n t�nh to�n lo�i nhi�m v� n�n ti�n h�nh cho c�p �� ��
    local myTaskType = tl_gettasktype(myTaskLevel)

    tl_setplayertasktype(myTaskType)

    -- Cu�i c�ng ��c b�ng t��ng �ng �� x�c ��nh s� d�ng c�a nhi�m v� c� th� trong b�ng
    local myTaskID = tl_gettasklink(myTaskType, myTaskLevel)

    tl_savetasktablecol(myTaskID)

	-- N�u l� nhi�m v� thu th�p b�n ��, th� ghi l�i m� s� b�n �� v� lo�i b�n �� mu�n thu th�p
	local myTaskMapID = tonumber(TabFile_GetCell(TL_FINDMAPS, myTaskID, "MapID"))
	local myMapType = tonumber(TabFile_GetCell(TL_FINDMAPS, myTaskID, "MapType"))
	local myMapNum = tonumber(TabFile_GetCell(TL_FINDMAPS, myTaskID, "Num"))

	-- �i�u ki�n ph�n �o�n c�a nhi�m v� lo�i 5
	local myTaskValueType

	-- Ghi l�i bi�n nhi�m v�
	-- Ghi l�i lo�i nhi�m v� c�a ng��i ch�i
	tl_setplayertasktype(myTaskType)

	-- Ghi l�i s� d�ng trong b�ng nhi�m v� c� th� c�a ng��i ch�i
	tl_savetasktablecol(myTaskID)

	-- X� l� l�u tr� bi�n s� kh�c nhau t��ng �ng v�i c�c nhi�m v� kh�c nhau

    if (myTaskType == 1) then
        -- L�u gi� tr� ng�u nhi�n c�a y�u t� ��i tho�i nhi�m v�
        tl_savetalkvalue(1, random(2, getn(Task_TalkBuy[1]) + 1))
        tl_savetalkvalue(3, random(2, getn(Task_TalkBuy[3]) + 1))
        tl_savetalkvalue(6, random(2, getn(Task_TalkBuy[6]) + 1))

    elseif (myTaskType == 2) then
        -- L�u gi� tr� ng�u nhi�n c�a y�u t� ��i tho�i nhi�m v�
        tl_savetalkvalue(1, random(2, getn(Task_TalkGoods[1]) + 1))
        tl_savetalkvalue(2, random(2, getn(Task_TalkGoods[2]) + 1))
        tl_savetalkvalue(3, random(2, getn(Task_TalkGoods[3]) + 1))
        tl_savetalkvalue(4, random(2, getn(Task_TalkGoods[4]) + 1))
        tl_savetalkvalue(5, random(2, getn(Task_TalkGoods[5]) + 1))
        tl_savetalkvalue(6, random(2, getn(Task_TalkGoods[6]) + 1))

    elseif (myTaskType == 3) then
        -- L�u gi� tr� ng�u nhi�n c�a y�u t� ��i tho�i nhi�m v�
        tl_savetalkvalue(1, random(2, getn(Task_TalkShow[1]) + 1))
        tl_savetalkvalue(4, random(2, getn(Task_TalkShow[4]) + 1))
        tl_savetalkvalue(6, random(2, getn(Task_TalkShow[6]) + 1))

    elseif (myTaskType == 4) then
        -- L�u gi� tr� ng�u nhi�n c�a y�u t� ��i tho�i nhi�m v�
        tl_savetalkvalue(1, random(2, getn(Task_TalkFind[1]) + 1))
        tl_savetalkvalue(4, random(2, getn(Task_TalkFind[4]) + 1))
        tl_savetalkvalue(6, random(2, getn(Task_TalkFind[6]) + 1))

        nt_setTask(1031, myTaskMapID)
        nt_setTask(1032, SetByte(nt_getTask(1032), 1, myMapType))
        nt_setTask(1032, SetByte(nt_getTask(1032), 2, myMapNum))
		nt_setTask(1025, 0) -- X�a s� l��ng b�n �� g�c
    elseif (myTaskType == 5) then -- N�u l� nhi�m v� t�ng gi� tr� s�, th� ph�n �o�n l� lo�i gi� tr� s� n�o
        -- L�u gi� tr� ng�u nhi�n c�a y�u t� ��i tho�i nhi�m v�
        tl_savetalkvalue(1, random(2, getn(Task_TalkUp[1]) + 1))
        tl_savetalkvalue(3, random(2, getn(Task_TalkUp[3]) + 1))
        tl_savetalkvalue(4, random(2, getn(Task_TalkUp[4]) + 1))
        tl_savetalkvalue(6, random(2, getn(Task_TalkUp[6]) + 1))

        myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND, myTaskID, "NumericType"))

		if (myTaskValueType == 2) then -- N�u l� t�ng kinh nghi�m
            nt_setTask(1033, GetLevel())
            nt_setTask(1034, GetExp())
        elseif (myTaskValueType == 3) then -- N�u l� t�ng danh v�ng
            nt_setTask(1026, GetRepute())
        elseif (myTaskValueType == 4) then -- N�u l� t�ng ph�c duy�n
            nt_setTask(1026, nt_getTask(151))
        elseif (myTaskValueType == 5) then -- N�u l� t�ng gi� tr� PK
            nt_setTask(1026, GetPK())
        elseif (myTaskValueType == 6) then -- N�u l� t�ng t�ch l�y T�ng Kim
            nt_setTask(1026, nt_getTask(747))
        end

    elseif (myTaskType == 6) then
        -- L�u gi� tr� ng�u nhi�n c�a y�u t� ��i tho�i nhi�m v�
        tl_savetalkvalue(1, random(2, getn(Task_TalkWorld[1]) + 1))
        tl_savetalkvalue(3, random(2, getn(Task_TalkWorld[3]) + 1))
    end

    tl_settaskcourse(1) -- ���������չ����Ϊ 1 

end



-- Nhi�m v� v�ng l�p ��n v�ng ti�p theo
function tl_taskprocess()

	local myTaskTimes = tl_gettaskstate(1) -- S� l�n ng��i ch�i �� ti�n h�nh
    local myTaskLinks = tl_gettaskstate(2) -- S� chu�i ng��i ch�i �� ti�n h�nh
    local myTaskLoops = tl_gettaskstate(3) -- S� v�ng ng��i ch�i �� ti�n h�nh
    local myTaskCancel = tl_gettaskstate(4)
    local myTaskLinksCount = tl_gettaskstate(6) -- Ki�m tra ng��i ch�i �� ti�n h�nh bao nhi�u l�n trong chu�i hi�n t�i

    myTaskTimes = myTaskTimes + 1

    if (myTaskLoops >= TL_MAXLOOPS) then
        myTaskLoops = 0;
    end

    if (myTaskTimes >= TL_MAXTIMES) then

        myTaskTimes = 0
        myTaskLinksCount = myTaskLinksCount + 1

        -- ��u ti�n l�u tr�ng th�i nhi�m v� � ��y m�t l�n
        tl_settaskstate(1, myTaskTimes)
        tl_settaskstate(2, myTaskLinks)
        tl_settaskstate(6, myTaskLinksCount)

        if (tl_counttasklinknum(2) >= TL_MAXLINKS) then -- Nhi�m v� �� ti�n h�nh ��n tr�ng th�i v�ng

            myTaskTimes = 0
            myTaskLinks = tl_getfirstlink()
            --			tl_print("�õ��˳�ʼ��������"..myTaskLinks);
            myTaskLinksCount = 0
            myTaskLoops = myTaskLoops + 1

            if (myTaskLoops >= TL_MAXLOOPS) then
                myTaskLoops = 0
            end

            tl_settaskstate(1, myTaskTimes)
            tl_settaskstate(2, myTaskLinks)
            tl_settaskstate(6, myTaskLinksCount)

        end

        if (myTaskLinksCount == tl_gettasklinknum(myTaskLinks)) then -- N�u chu�i n�y �� ho�n th�nh s� chu�i c�n ho�n th�nh
            myTaskLinks = myTaskLinks + 1
            myTaskLinksCount = 0
        end

    end

    tl_settaskstate(1, myTaskTimes)
    tl_settaskstate(2, myTaskLinks)
    tl_settaskstate(3, myTaskLoops)
    tl_settaskstate(6, myTaskLinksCount)

    -- � ��y ghi l�i t�ng s� nhi�m v�
    nt_setTask(1044, tl_counttasklinknum(1));

end




-- H�m ki�m tra, d�ng �� x�c nh�n ng��i ch�i �� ho�n th�nh nhi�m v� ch�a
-- Gi� tr� tr� v�:
-- 1: �� ��t �i�u ki�n
-- 0: Ch�a th� ho�n th�nh
-- Tham s� truy�n v�o nTaskGoods c� nhi�u c�ch bi�u th�:
-- N�u l� nhi�m v� 1: Lo�i, Ph�n lo�i, Chi ti�t lo�i, Ng� h�nh, C�p ��
-- N�u l� nhi�m v� 2: Lo�i, Ph�n lo�i, Chi ti�t lo�i, Ng� h�nh, C�p ��, ID thu�c t�nh ph�p thu�t, Gi�i h�n d��i thu�c t�nh ph�p thu�t, Gi�i h�n tr�n thu�c t�nh ph�p thu�t
-- N�u l� nhi�m v� 3: ID thu�c t�nh ph�p thu�t, Gi�i h�n d��i thu�c t�nh ph�p thu�t, Gi�i h�n tr�n thu�c t�nh ph�p thu�t
function tl_checktask(nTaskGoods)

    local i, j

	-- Nhi�m v� y�u c�u v�t ph�m
	local myTaskGoods

	-- Lo�i, ph�n lo�i, chi ti�t lo�i, ng� h�nh, c�p �� c�a v�t ph�m nhi�m v� y�u c�u
	local myGenre, myDetail, myParticular, myGoodsFive, myLevel, myMagicID, myMagicMax, myMagicMin

	-- Lo�i v�t ph�m nhi�m v� y�u c�u: kh�ng c� thu�c t�nh ph�p thu�t v� c� thu�c t�nh ph�p thu�t
	local myGoodsClean, myGoodsMagic

	-- ID b�n ��, s� l��ng b�n �� v� lo�i b�n �� m� nhi�m v� y�u c�u
	local myTaskMaps, myTaskMapNum, myTaskMapType

	-- Gi� tr� s� v� lo�i gi� tr� s� c�n n�ng c�p m� nhi�m v� y�u c�u
	local myTaskValue, myTaskValueType, myOrgValue

	-- S� l��ng b�n �� S�n H� X� T�c m� nhi�m v� y�u c�u
	local myWorldMaps, nWorldMaps

	-- L�y lo�i nhi�m v� hi�n t�i ng��i ch�i �ang nh�n
    local myTaskType = tl_getplayertasktype()
    local myTaskID = tl_gettasktablecol()

    if (myTaskType == 1) then

        myGenre = tonumber(TabFile_GetCell(TL_BUYGOODS, myTaskID, "Genre"))
        myDetail = tonumber(TabFile_GetCell(TL_BUYGOODS, myTaskID, "Detail"))
        myParticular = tonumber(TabFile_GetCell(TL_BUYGOODS, myTaskID, "Particular"))
        myGoodsFive = tonumber(TabFile_GetCell(TL_BUYGOODS, myTaskID, "GoodsFive"))
        myLevel = tonumber(TabFile_GetCell(TL_BUYGOODS, myTaskID, "Level"))

        myTaskGoods = {myGenre, myDetail, myParticular, myGoodsFive, myLevel}

        -- tl_print("������Ҫ�����ƷΪ��"..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
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
        myGoodsClean = {nTaskGoods[1], nTaskGoods[2], nTaskGoods[3], nTaskGoods[4], nTaskGoods[5]} -- N�u kh�ng d�ng thu�c t�nh ph�p thu�t �� ph�n �o�n th� l�y gi� tr� n�y
        myGoodsMagic = {nTaskGoods[1], nTaskGoods[2], nTaskGoods[3], nTaskGoods[4], nTaskGoods[5], nTaskGoods[6],
                        nTaskGoods[7], nTaskGoods[8]}

        if (myMagicID == "n") then
            -- tl_print("������Ҫ�����ƷΪ��"..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
            if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and
                (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and
                (nTaskGoods[5] == myTaskGoods[5]) then
                return 1
            else
                return 0
            end
        else
            myMagicID = tonumber(myMagicID)
            -- tl_print("������Ҫ�����ƷΪ��"..myGenre..myDetail..myParticular..myLevel..myGoodsFive.."ħ�����ԣ�"..myMagicID.." ��Сֵ��"..myMagicMin.." ���ֵ��"..myMagicMax)
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

        -- tl_print("������Ҫ�����ƷΪ��"..myMagicID..myMagicMin..myMagicMax)

        if (nTaskGoods[1] == myMagicID) and (nTaskGoods[2] >= myMagicMin) and (nTaskGoods[2] <= myMagicMax) then
            return 1
        else
            return 0
        end

    elseif (myTaskType == 4) then

        myTaskMapNum = nt_getTask(1025)

        if (myTaskMapNum >= tonumber(TabFile_GetCell(TL_FINDMAPS, myTaskID, "Num"))) then
            myTaskMapNum = 0
            nt_setTask(1025, myTaskMapNum) -- ������ 0
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
        elseif (myTaskValueType == 3) then -- Gi� tr� danh v�ng
            myOrgValue = GetRepute()
            if (myOrgValue - (nt_getTask(1026)) >= myTaskValue) then
                return 1
            else
                return 0
            end
        elseif (myTaskValueType == 4) then -- Gi� tr� ph�c duy�n
            myOrgValue = nt_getTask(151)
            if (myOrgValue - (nt_getTask(1026)) >= myTaskValue) then
                return 1
            else
                return 0
            end
        elseif (myTaskValueType == 5) then -- Gi� tr� PK
            myOrgValue = GetPK()
            if (myOrgValue - (nt_getTask(1026)) >= myTaskValue) then
                return 1
            else
                return 0
            end
        elseif (myTaskValueType == 6) then -- T�ng Kim t�ch l�y
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
            nWorldMaps = nt_getTask(1027) - myWorldMaps -- � ��y �� x�a c�c m�nh b�n �� S�n H� X� T�c c�n thi�t
            nt_setTask(1027, nWorldMaps)
            return 1
        else
            return 0
        end
    end

end


-- H�m con, d�ng �� x�c ��nh lo�i nhi�m v� c� th� m� ng��i ch�i hi�n �ang nh�n.
-- Gi� tr� tr� v� l� 1~6, n�u l� 0 th� ng��i ch�i v�n ch�a k�ch ho�t chu�i nhi�m v�.
function tl_getplayertasktype()

    local myTaskType

    --	myTaskType = strsub(format("%d",nt_getTask(1021),1,1))
    myTaskType = nt_getTask(1021)

    return myTaskType

end



-- H�m con, d�ng �� thi�t l�p lo�i nhi�m v� c� th� m� ng��i ch�i hi�n �ang nh�n
function tl_setplayertasktype(myTaskType)
	nt_setTask(1021,myTaskType)
end


-- H�m con, d�ng �� ghi l�i s� d�ng trong b�ng c� th� t��ng �ng v�i nhi�m v� hi�n t�i c�a ng��i ch�i
function tl_savetasktablecol(myTaskCol)
	nt_setTask(1030,myTaskCol)
end


-- H�m con, d�ng �� ��c s� d�ng trong b�ng c� th� t��ng �ng v�i nhi�m v� hi�n t�i c�a ng��i ch�i
function tl_gettasktablecol()
	return nt_getTask(1030)
end


-- H�m con, ki�m tra tr�ng th�i nhi�m v�
-- 1: S� l�n �ang ti�n h�nh
-- 2: S� chu�i �ang ti�n h�nh
-- 3: S� v�ng �ang ti�n h�nh
-- 4: S� l�n h�y c�n l�i
-- 5: M� nhi�m v� hi�n t�i ng��i ch�i �ang nh�n ���c l�u tr�n 1021
-- 6: Ng��i ch�i �� l�m bao nhi�u l�n trong chu�i n�y c�a m�i v�ng, t�i �a l� 4
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



-- H�m con, thi�t l�p tr�ng th�i nhi�m v�
-- 1: S� l�n �ang ti�n h�nh
-- 2: S� chu�i �ang ti�n h�nh
-- 3: S� v�ng �ang ti�n h�nh
-- 5: M� nhi�m v� hi�n t�i ng��i ch�i �ang nh�n ���c l�u tr�n 1021
-- 6: Ng��i ch�i �� l�m bao nhi�u l�n trong chu�i n�y c�a m�i v�ng
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
            Msg2Player("S� l�n b�n x�a b� �� ��t ��n gi�i h�n <color=yellow>254 l�n<color>, kh�ng th� t�ng th�m!");
            return
        end
    elseif (myTaskState == 6) then
        nt_setTask(1035, myTaskValue)
    end

end



-- H�m con, thi�t l�p tr�ng th�i ti�n �� c�a nhi�m v� hi�n t�i, 0, 1, 2, 3
-- 0: Ch�a b�t ��u
-- 1: �� nh�n nh�ng ch�a ho�n th�nh
-- 2: �� ho�n th�nh nh�ng ch�a nh�n th��ng
-- 3: �� ho�n th�nh v� nh�n th��ng
function tl_settaskcourse(myTaskCourse)
	nt_setTask(1028,myTaskCourse)
end


-- H�m con, l�y tr�ng th�i ti�n �� c�a nhi�m v� hi�n t�i, O, 1, 2, 3
-- 0: Ch�a b�t ��u
-- 1: �� nh�n nh�ng ch�a ho�n th�nh
-- 2: �� ho�n th�nh nh�ng ch�a nh�n th��ng
-- 3: �� ho�n th�nh v� nh�n th��ng
function tl_gettaskcourse()
	return nt_getTask(1028)
end


-- H�m con, ghi l�i gi� tr� s� c�a y�u t� ��i tho�i
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


-- H�m con, l�y gi� tr� s� c�a y�u t� ��i tho�i
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
-- //                  ��c b�ng v� x� l� gi� tr� nhi�m v�                     //
--/////////////////////////////////////////////////////////////////////////////

-- T�m ki�m b�ng nhi�m v� t��ng �ng v�i c�p ��, x�c ��nh c�p �� ��u ti�n c�a chu�i nhi�m v� hi�n t�i c�a ng��i ch�i thu�c c�p n�o
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


-- T�m ki�m b�ng t�ng h�p chu�i nhi�m v�, l�y nhi�m v� lo�i ng�u nhi�n theo c�p �� t��ng �ng
-- Tham s� truy�n v�o myTaskLevel l� c�p �� c�a chu�i nhi�m v� 1~20
-- Gi� tr� tr� v� l� 1~6: 1: Mua v�t ph�m 2: T�m v�t ph�m 3: Tr�ng b�y v�t ph�m 4: Thu th�p b�n �� 5: T�ng gi� tr� 6: b�n �� S�n H� X� T�c
function tl_gettasktype(myTaskLevel)

	local i,j,k = 0,0,0
	local myMainRate = 0 -- T�ng t� l� c�a t�t c� c�c lo�i nhi�m v� trong m�t c�p ��
	local myTaskType -- Lo�i nhi�m v� ���c tr� v�
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		myMainRate = myMainRate + Task_MainLevelRate[myTaskLevel][i]
	end
	
	-- D�a v�o c�ng th�c tr�ng s� cu�i c�ng ng�u nhi�n t�nh to�n lo�i nhi�m v�
	j = random(1,myMainRate)
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		k = k + Task_MainLevelRate[myTaskLevel][i]
		if ( j <= k) then
			return i
		end
	end
	
	-- X� l� ngo�i l�, n�u ng��i ch�i kh�ng ch�n ���c lo�i nhi�m v� n�o th� ch�n 4

    -- tl_print("Script g�p l�i khi ch�n lo�i nhi�m v�!");
	
	return 0

end


-- T�m ki�m chu�i nhi�m v�, l�y nhi�m v� t��ng �ng
-- Gi� tr� tr� v� l� s� d�ng c�a nhi�m v� �� trong b�ng
function tl_gettasklink(myTaskType, myTaskLevel)

    local myTaskCol -- Ghi l�i s� d�ng c�a nhi�m v�

    if (myTaskType == 1) then -- N�u l� nhi�m v� mua v�t ph�m
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




-- D�a v�o tr�ng s� trong danh s�ch nhi�m v� �� ng�u nhi�n ch�n nhi�m v�, gi� tr� tr� v� l� s� d�ng c�a nhi�m v� t��ng �ng trong b�ng.
function tl_selecttask(myTaskTable, myTaskLevel)

    local i, j, k = 0, 0, 0
    local myMainRate = 0 -- T�ng tr�ng s� c�a nhi�m v�

    for i = 1, getn(myTaskTable[myTaskLevel]) do
        myMainRate = myMainRate + myTaskTable[myTaskLevel][i][2]
    end

    -- D�a v�o c�ng th�c tr�ng s� cu�i c�ng ng�u nhi�n t�nh to�n nhi�m v� c� th�
    j = random(1, myMainRate)

	-- tl_print ("T�ng tr�ng s� c�a nhi�m v�:  "..myMainRate)
    -- tl_print ("Tr�ng s� nhi�m v� ng�u nhi�n nh�n ���c:  "..j)

    for i = 1, getn(myTaskTable[myTaskLevel]) do

        k = k + myTaskTable[myTaskLevel][i][2]

        if (j < k) then
            --			tl_print ("ѡ���˱���еĵ�  "..myTaskTable[myTaskLevel][i][1].."  �С�")
            return myTaskTable[myTaskLevel][i][1]
        end

    end

    -- X� l� b�t th��ng, n�u ng��i ch�i kh�ng th� ch�n th� tr� v� 2, d� th� n�o c�ng �� ng��i ch�i ti�p t�c ti�n h�nh
    --	tl_print ("�ű���ѡ����������ʱ����")
    return 2

end



-- H�m con, tr� v� m�t chu�i k� t� ��nh danh c�a b�ng t��ng �ng v�i lo�i nhi�m v�
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


-- T�nh to�n t� l� ph�n tr�m tr�ng s� c�a m�t nhi�m v� � c�p �� hi�n t�i
-- myTableName: truy�n v�o chu�i k� t� t�n b�ng c�n ��c
-- myTaskRate: tr�ng s� c�a nhi�m v� hi�n t�i
-- myTableCol: c�t c�a b�ng c�n ��c (chu�i k� t� ho�c s�)
function tl_counttaskrate(myTableName, myTaskRate, myTableCol)

    local i
    local myTotalRate = 0
    local myReadRate
    local myPercent

    local myTableRow = TabFile_GetRowCount(myTableName) -- L�y t�ng s� d�ng c�a file TABLE

    for i = 3, myTableRow - 1 do
        myReadRate = tonumber(TabFile_GetCell(myTableName, myTableRow, myTableCol))
        myTotalRate = myTotalRate + myReadRate
        i = i + 1
    end

    myPercent = (myTaskRate / myTotalRate) * 100

    return myPercent

end



-- T�nh to�n l��ng kinh nghi�m c�n thi�t �� n�ng c�p t� c�p �� c� l�n c�p �� hi�n t�i c�a ng��i ch�i
function tl_countuplevelexp(myOldLevel, myOldExp)

    local i
    local myLevel = GetLevel()
    local myExp = GetExp()
    local nNowExp = tonumber(TabFile_GetCell(TL_UPLEVELEXP, myLevel + 1, 2)) -- Kinh nghi�m c�n thi�t cho c�p �� hi�n t�i

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


-- H�m con, t�nh to�n s� l�n chu�i hi�n t�i c�n ���c th�c hi�n li�n ti�p trong chu�i c�ng c�p ��
-- �� qua ki�m tra, ��m b�o kh�ng l�i, c�p 1~20 ��u c� th� tr� v� ch�nh x�c
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


-- H�m con, x�c ��nh chu�i n�y thu�c v� chu�i c�p �� ��u ti�n, v� tr� v� s� l��ng th�nh vi�n trong chu�i ��
function tl_getlinksforlevel(myTaskLink)

    local i, j = 0, 0
    local myTaskLevel, myTaskLinksNum

    -- ��u ti�n x�c ��nh chu�i n�y thu�c v� chu�i c�p �� n�o
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


-- H�m con, t�nh to�n ng��i ch�i �� l�m li�n ti�p bao nhi�u l�n, bao nhi�u chu�i, bao nhi�u v�ng
function tl_counttasklinknum(myCountType)

    local i, j = 0, 0
	local myTaskTimes = tl_gettaskstate(1) -- S� l�n ng��i ch�i �� ti�n h�nh
    local myTaskLinks = tl_gettaskstate(2) -- S� chu�i ng��i ch�i �� ti�n h�nh
    local myTaskLoops = tl_gettaskstate(3) -- S� v�ng ng��i ch�i �� ti�n h�nh
    local myTaskCancel = tl_gettaskstate(4) -- S� l�n ng��i ch�i c� th� h�y

    local myCountLoops = tl_gettaskstate(3) -- L�y s� v�ng c�a ng��i ch�i

    local nTaskLevel, nTaskNum = tl_getlinksforlevel(myTaskLinks) -- L�y c�p �� c�a chu�i �� v� s� l��ng th�nh vi�n c�a c�p �� ��

    if (myTaskLinks == Task_MainTaskLink[nTaskLevel][2]) then -- N�u chu�i n�y v�n l� chu�i kh�i ��u, th� l�y tr�c ti�p gi� tr� c�a n�
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


-- H�m con, l�y m� t� t��ng �ng c�a nhi�m v�, tr� v� m�t �o�n chu�i k� t�
function tl_gettaskinfo()

    local myTaskMainInfo, myTaskOrder, myTaskInfo1, myTaskInfo2, myTaskInfo3

    local myWhen, myWhere, myWho, myWhy1, myWhy2, myWhat, myMainTalk

    local myTaskType = tl_getplayertasktype()

    if (myTaskType == 1) then

        -- T�n v�t ph�m
        myTaskOrder = TabFile_GetCell(TL_BUYGOODS, tl_gettasktablecol(), "TaskInfo1")
        -- T�n ��a �i�m m�c ti�u
        myTaskInfo1 = TabFile_GetCell(TL_BUYGOODS, tl_gettasktablecol(), "TaskInfo")

        myWhen = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(1), "When")
        myWho = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(3), "Who")
        myWhat = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(6), "What")

        myMainTalk = "H�y �i <color=yellow>" .. myTaskInfo1 .. "<color> Mua gi�p ta <color=yellow>" .. myTaskOrder .. "<color> v� ��y!";

        myTaskMainInfo = myMainTalk

    elseif (myTaskType == 2) then

		-- Thu�c t�nh ph�p thu�t
		myTaskOrder = TabFile_GetCell(TL_FINDGOODS, tl_gettasktablecol(), "MagicCnName")
		-- Lo�i v� kh� c� th�
		myTaskInfo1 = TabFile_GetCell(TL_FINDGOODS, tl_gettasktablecol(), "TaskInfo")
		-- Thu�c t�nh ph�p thu�t nh� nh�t
		myTaskInfo2 = TabFile_GetCell(TL_FINDGOODS, tl_gettasktablecol(), "MinValue")
		-- Thu�c t�nh ph�p thu�t l�n nh�t
		myTaskInfo3 = TabFile_GetCell(TL_FINDGOODS, tl_gettasktablecol(), "MaxValue")

        myWhen = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(1), "When")
        myWhere = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(2), "Where")
        myWho = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(3), "Who")
        myWhy1 = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(4), "Why1")
        myWhy2 = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(5), "Why2")
        myWhat = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(6), "What")

        if (myTaskOrder == "n") then
            myTaskMainInfo = "1 c�i <color=yellow>" .. myTaskInfo1 .. "<color>"
            myMainTalk = "H�y gi�p ta �i t�m m�n n�y: <color=yellow>" .. myTaskMainInfo .. "<color>.";
        else
            myMainTalk = "H�y gi�p ta �i t�m m�n n�y: <color=yellow>" .. myTaskInfo1 .. "<color>��<color=yellow>" .. myTaskOrder .. "<color>, nh� nh�t: <color=yellow>" .. myTaskInfo2 .. "<color>, l�n nh�t: <color=yellow>" .. myTaskInfo3 .. "<color>.";
        end

        myTaskMainInfo = myMainTalk

    elseif (myTaskType == 3) then

        myWhen = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(1), "When")
        myWhy1 = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(4), "Why1")
        myWhat = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(6), "What")

		-- T�n ti�ng Trung c�a thu�c t�nh ph�p thu�t
		myTaskOrder = TabFile_GetCell(TL_SHOWGOODS, tl_gettasktablecol(), "MagicCnName")
		-- Gi� tr� nh� nh�t c�a thu�c t�nh ph�p thu�t
		myTaskInfo1 = TabFile_GetCell(TL_SHOWGOODS, tl_gettasktablecol(), "MinValue")
		-- Gi� tr� l�n nh�t c�a thu�c t�nh ph�p thu�t
		myTaskInfo2 = TabFile_GetCell(TL_SHOWGOODS, tl_gettasktablecol(), "MaxValue")

        myMainTalk = "H�y gi�p ta �i t�m m�n n�y: <color=yellow>" .. myTaskOrder .. "<color>, nh� nh�t: <color=yellow>" .. myTaskInfo1 .. "<color>, l�n nh�t: <color=yellow>" .. myTaskInfo2 .. "<color>! Xem xong ta s� tr� l�i cho ng��i";

        myTaskMainInfo = myMainTalk

    elseif (myTaskType == 4) then

		-- T�n b�n ��
		myTaskOrder = TabFile_GetCell(TL_FINDMAPS, tl_gettasktablecol(), "TaskInfo1")
		-- S� l��ng b�n �� c�n
		myTaskInfo1 = TabFile_GetCell(TL_FINDMAPS, tl_gettasktablecol(), "Num")
		-- Lo�i b�n ��
		myTaskInfo2 = TabFile_GetCell(TL_FINDMAPS, tl_gettasktablecol(), "MapType")

        myWhen = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(1), "When")
        myWhy1 = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(4), "Why1")
        myWhat = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(6), "What")

        if (tonumber(myTaskInfo2) == 1) then
            myTaskInfo3 = "��a �� ch� "
        else
            myTaskInfo3 = "M�t ch� "
        end

        myTaskMainInfo = "Ng��i h�y ��n <color=yellow>" .. myTaskOrder .. "<color> t�m gi�p ta <color=yellow>" .. myTaskInfo1 .. "<color> quy�n <color=yellow> " .. myTaskInfo3 .. " <color>��";

    elseif (myTaskType == 5) then

        myWhen = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(1), "When")
        myWho = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(3), "Who")
        myWhy1 = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(4), "Why1")
        myWhat = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(6), "What")

		-- Lo�i gi� tr� s� c�n n�ng cao
		myTaskOrder = TabFile_GetCell(TL_UPGROUND, tl_gettasktablecol(), "NumericType")
		-- T�ng gi� tr� s� c�n n�ng cao
		myTaskInfo1 = TabFile_GetCell(TL_UPGROUND, tl_gettasktablecol(), "NumericValue")

        if (tonumber(myTaskOrder) == 1) then
            myTaskInfo2 = "��ng c�p"
            myTaskInfo3 = "��ng c�p"
        elseif (tonumber(myTaskOrder) == 2) then
            myTaskInfo2 = "Tr� kinh nghi�m"
            myTaskInfo3 = "Tr� kinh nghi�m"
        elseif (tonumber(myTaskOrder) == 3) then
            myTaskInfo2 = "Danh v�ng"
            myTaskInfo3 = "Danh v�ng"
        elseif (tonumber(myTaskOrder) == 4) then
            myTaskInfo2 = "Ph�c Duy�n"
            myTaskInfo3 = "Ph�c Duy�n"
        elseif (tonumber(myTaskOrder) == 5) then
            myTaskInfo2 = "�i�m PK"
            myTaskInfo3 = "�i�m PK"
        elseif (tonumber(myTaskOrder) == 6) then
            myTaskInfo2 = "�i�m t�ch l�y T�ng Kim "
            myTaskInfo3 = "�i�m t�ch l�y T�ng Kim "
        end

        myTaskMainInfo = "H�y �i n�ng c�p <color=yellow>" .. myTaskInfo3 .. " " .. myTaskInfo1 .. "<color>.";

    elseif (myTaskType == 6) then

        myWhen = TabFile_GetCell(TL_TASKWORLDTALK, tl_gettalkvalue(1), "When")
        myWho = TabFile_GetCell(TL_TASKWORLDTALK, tl_gettalkvalue(3), "Who")

        -- M�nh b�n �� S�n H� X� T�c c�n thu th�p
        myTaskOrder = TabFile_GetCell(TL_WORLDMAPS, tl_gettasktablecol(), "Num")

        myTaskMainInfo = "H�y �i t�m gi�p ta <color=yellow>" .. myTaskOrder .. "<color> m�nh b�n �� S�n H� X� T�c";
    end

    return myTaskMainInfo

end



-- H�m d�ng �� t�ch l�y kinh nghi�m cho ng��i ch�i
function tl_addPlayerExp(myExpValue)

    local myOwnExp = 0
    local myNeedExp = 0
    local myPayExp = 0

    -- LLG_MODIFY_20060603
    -- Ph�ng ng�a v�ng ch�t, t�i �a l�n 100 c�p
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



-- D�ng �� in th�ng b�o DEBUG c�a chu�i nhi�m v�
function tl_print(myPrintText)
--  print ("Th�ng b�o chu�i nhi�m v�: "..myPrintText);
end


-- H�m con, d�ng �� l�y gi�i t�nh c�a ng��i ch�i, tr�c ti�p tr� v� chu�i k� t�
function GetPlayerSex()
    local mySex -- D�ng �� hi�n th� k� t� gi�i t�nh nh�n v�t

    if (GetSex() == 0) then
        mySex = "C�ng t� "
    else
        mySex = "N� hi�p"
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

    for i = 1, 20 do -- �ӵ�һ�����ڶ�ʮ��������ѭ��
        for j = 2, myTableRow do
            myColText = format("%s%s", "TaskRate", i)
            myReadRate = tonumber(TabFile_GetCell(myTaskTextID, j, myColText))

            if (myReadRate ~= nil) then -- ������������ȼ�Ȩ����������ֵ�Ļ�������������ȼ�

                myTaskIndex[i] = myTaskIndex[i] + 1
                myTaskVariable[i][myTaskIndex[i]] = {j, myReadRate}
            end
        end
    end

    return myTaskVariable

end


-- C�u t�o b�ng nhi�m v�
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

        -- Ghi l�i chu�i c�p �� n�y: c�p �� y�u c�u, gi� tr� ban ��u v� gi� tr� cao nh�t
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

        --		tl_print("����ȼ�����"..j.."ʱ��ʼֵΪ��"..myTaskVariable[j][2].."  ���ֵΪ��"..myTaskVariable[j][3].."  ����ȼ�Ϊ��"..myTaskVariable[j][1]);

    end

    return myTaskVariable

end


-- Ch� s� t� l� c�a t�t c� c�c lo�i nhi�m v� trong m�i c�p ��
function AssignValue_TaskRate(myTaskVariable, myTaskTextID)

    local i, j, k

    myTaskVariable = {}
    myTaskVariable[1] = {}

	local myTableRow = TabFile_GetRowCount(myTaskTextID) -- L�y t�ng s� d�ng c�a file TABLE
    local myTableCol -- H�p nh�t chu�i k� t�, c�u t�o ti�u �� b�ng: "level20"
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



-- C�u t�o b�ng l�u tr� ph�n th��ng
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
        --		tl_print ("�� "..myTaskTextID.."  �� ".."  �� "..i.." ��Ԫ�أ�".." ��  "..j.."  �еļ�ֵ����  "..tonumber(TabFile_GetCell(myTaskTextID,j,"TaskValue")))
    end

    return myTaskVariable

end



-- C�u t�o ch� m�c l�u tr� ��i tho�i nhi�m v� t�m v�t ph�m
function AssignValue_TaskTalk(myTaskVariable, myTaskTextID)

    local i, j = 0, 0
    local myTextValue

    myTaskVariable = {{0}, {0}, {0}, {0}, {0}, {0}} -- S�u y�u t� l�n l��t l�: th�i gian, ��a �i�m, nh�n v�t, nguy�n nh�n m�t v� hai, s� ki�n

    local myTableRow = TabFile_GetRowCount(myTaskTextID)

    tl_print("S� h�ng t�m ���c l�:" .. myTableRow);

    -- C�u t�o m�ng th�i gian
    for i = 1, myTableRow - 1 do
        j = i + 1
        myTextValue = TabFile_GetCell(myTaskTextID, j, "When")
        if (myTextValue ~= "n") then
            myTaskVariable[1][i] = j
        end
    end

    -- C�u t�o m�ng ��a �i�m
    for i = 1, myTableRow - 1 do
        j = i + 1
        myTextValue = TabFile_GetCell(myTaskTextID, j, "Where")
        if (myTextValue ~= "n") then
            myTaskVariable[2][i] = j
        end
    end

    -- C�u t�o m�ng nh�n v�t
    for i = 1, myTableRow - 1 do
        j = i + 1
        myTextValue = TabFile_GetCell(myTaskTextID, j, "Who")
        if (myTextValue ~= "n") then
            myTaskVariable[3][i] = j
        end
    end

    -- C�u t�o m�ng nguy�n nh�n m�t
    for i = 1, myTableRow - 1 do
        j = i + 1
        myTextValue = TabFile_GetCell(myTaskTextID, j, "Why1")
        if (myTextValue ~= "n") then
            myTaskVariable[4][i] = j
        end
    end

    -- C�u t�o m�ng nguy�n nh�n hai
    for i = 1, myTableRow - 1 do
        j = i + 1
        myTextValue = TabFile_GetCell(myTaskTextID, j, "Why2")
        if (myTextValue ~= "n") then
            myTaskVariable[5][i] = j
        end
    end

    -- C�u t�o m�ng s� ki�n
    for i = 1, myTableRow - 1 do
        j = i + 1
        myTextValue = TabFile_GetCell(myTaskTextID, j, "What")
        if (myTextValue ~= "n") then
            myTaskVariable[6][i] = j
        end
    end

    for i = 1, 6 do
        tl_print("��i tho�i nhi�m v� hi�n t�i  " .. i .. "  T�ng s� ch� s� nguy�n t� l�: " .. getn(myTaskVariable[i]));
    end

    return myTaskVariable

end