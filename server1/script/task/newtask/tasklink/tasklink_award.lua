-- File head ph�n th��ng k�ch b�n chu�i nhi�m v� D� T�u
-- Edited by peres
-- 2004/12/25 S�ng Gi�ng Sinh

-- T�i file ��u ch��ng Huy�n Ho�n
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua");
Include("\\script\\tong\\tong_award_head.lua");	--by zhishan


-- H�m t�ng ph�t th��ng cho ng��i ch�i
-- Tham s� truy�n v�o: myAwardType, 1 l� ph�n th��ng nhi�m v� th�ng th��ng, 2 l� ph�n th��ng chu�i, 3 l� ph�n th��ng v�ng
function tl_giveplayeraward(myGiveAwardType)

	-- Truy�n c�c tham s� cho b�ng ph�n th��ng:
	-- N�u l� v�t ph�m th� l�n l��t l�: Lo�i ph�n th��ng, Quality, Genre, Detail, Particular, Level, GoodsFive, Magiclevel, v� m� t� v�n b�n
	-- N�u l� ng�n l��ng th� l�n l��t l�: Lo�i ph�n th��ng, s� l��ng ng�n l��ng
	-- N�u l� kinh nghi�m th� l�n l��t l�: Lo�i ph�n th��ng, s� l��ng kinh nghi�m
	-- N�u l� c� h�i ng�u nhi�n ho�c c� h�i h�y th� ch� ghi l�i v� tr� ��u ti�n l� lo�i ph�n th��ng
	local myAwardArry = {
							{0,0,0,0,0,0,0,0,"",0}, 
						 	{0,0,0,0,0,0,0,0,"",0},
						 	{0,0,0,0,0,0,0,0,"",0}
				        }
	
	-- D�ng �� x� l� tr� v� ph�n th��ng chu�i v� ph�n th��ng v�ng
	local myAwardSingle = {0,0,0,0,0,0,0,0,"",0}
	
	-- M�ng ph�n th��ng, l�n l��t l� tr�ng s� c�a c�c lo�i ph�n th��ng
    -- L�n l��t l�: ng�n l��ng, kinh nghi�m, v�t ph�m, c� h�i ng�u nhi�n th�m m�t l�n n�a, c� h�i h�y nhi�m v�
    -- 0 c� ngh�a l� lo�i ph�n th��ng n�o �� �� ���c ch�n
	local myMainAwardRate = {20,33,34,8,5}
	
	local myTaskValue1,myTaskValue2,myMainValue -- Bi�n t�m th�i, d�ng �� ghi l�i gi� tr� s� �� ��c
	-- D�ng cho chu�i k� t� truy�n v�o c�a ph�n th��ng
	local myAwardGoods,myAwardExp,myAwardMoney,myAwardCancal,myAwardChange = "","","","",""
	
	local myArawdGoods = {0,0,0,0,0,0} -- M�ng t��ng �ng v�i v�t ph�m ph�n th��ng
	
	local myAwardType = 0
	
	local myAwardArryIndex = 1 -- D�ng �� ghi l�i �� ghi bao nhi�u ph�n t� trong m�ng ph�n th��ng
	
	local myRandomNum,myRandomSeed -- S� ng�u nhi�n v� h�t gi�ng ng�u nhi�n
	
	local myCountLinks -- S� chu�i �� ho�n th�nh li�n ti�p hi�n t�i
	
	local myTimes = tl_gettaskstate(1)
	local myLinks = tl_gettaskstate(2)
	local myLoops = tl_gettaskstate(3)
	
	myCountLinks = tl_counttasklinknum(2)
	
	myTaskType = tl_getplayertasktype()
		
	local _nSeed = SetRandSeed(nt_getTask(1037))
	local nTongValue = 0;
	
	if (myGiveAwardType==1) then -- Lo�i ph�n th��ng l� ph�n th��ng nhi�m v� th�ng th��ng

		for i=1,3 do -- V�ng l�p ch�n ra ba lo�i ph�n th��ng
			
			myAwardType,myMainAwardRate = tl_getawardtypeforrate(myMainAwardRate)
			
			tl_print("v�ng quay th�  "..i.."�� ch�n ���c lo�i h�nh gi�i th��ng: "..myAwardType);
			
			if (myAwardType==1) then -- N�u lo�i ph�n th��ng l� ng�n l��ng
				
				myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				
				-- Gi� tr� ph�n th��ng nhi�m v� sau khi t�nh to�n c�c gi� tr� c�ng th�m
				myMainValue = myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2
				
				-- 2005/9/20 �� s�a ��i t� l� s�n sinh ng�n l��ng, dao ��ng t� 60% ~ 100%
				-- 2006/8/23 �� s�a ��i gi� tr� ng�n l��ng c�a nhi�m v� D� T�u cho phi�n b�n Vi�t Nam, t�ng th�m 15%
				myMainValue = floor((myMainValue * 0.05 * 1.15) * (C_Random(60,100) * 0.01)) + myTaskValue1 -- L��ng ng�n l��ng th�c t� nh�n ���c sau khi t�nh to�n
				
				--=======================================
				
				myMainValue = TireReduce(myMainValue);  -- Ti�n h�nh x� l� h� th�ng m�t m�i
				myMainValue = CountDoubleMode(myMainValue);  -- Ti�n h�nh x� l� ho�t ��ng x2
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); -- Ghi l�i gi� tr� s� l��ng
				
				myAwardMoney = format("%s%s",myMainValue," ti�n ");
				
				myAwardArry[myAwardArryIndex] = {1,myMainValue,0,0,0,0,0,0,myAwardMoney,0}
				myAwardArryIndex = myAwardArryIndex + 1
				
				tl_print("Nh�n ���c  ti�n th��ng: "..myAwardMoney);
				
			elseif (myAwardType==2) then -- N�u ph�n th��ng l� kinh nghi�m
			
				myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				-- Gi� tr� ph�n th��ng nhi�m v� sau khi t�nh to�n c�c gi� tr� c�ng th�m
				myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
				
				-- 2006/8/23 �� s�a ��i gi� tr� kinh nghi�m c�a nhi�m v� D� T�u cho phi�n b�n Vi�t Nam, gi�m 10%
				myMainValue = floor((myMainValue * 0.36) * (C_Random(80,120) * 0.01)) -- L��ng kinh nghi�m th�c t� nh�n ���c sau khi t�nh to�n
				
				--=======================================
				myMainValue = TireReduce(myMainValue);-- Ti�n h�nh x� l� h� th�ng m�t m�i
				myMainValue = CountDoubleMode(myMainValue);  -- Ti�n h�nh x� l� ho�t ��ng x2
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); -- Ghi l�i gi� tr� s� l��ng
				
				-- 2007/7/11 �� s�a ��i ph�n th��ng kinh nghi�m D� T�u cho phi�n b�n Vi�t Nam �� ch�ng l�i, n�u �ang � tr�ng th�i m�t m�i, kinh nghi�m s� ���c l�u v�o v�t ph�m
				-- Trong t�ch ph�n D� T�u, c� th� s� d�ng �� nh�n kinh nghi�m khi kh�ng m�t m�i
				if (GetTiredDegree() == 2) then
					local nTemExp = floor(myMainValue / 1000);
					if (nTemExp < 0) then
						nTemExp = 1;
					end;
					myMainValue = nTemExp * 1000;
					myAwardExp = format("%s%s",myMainValue," �i�m t�ch l�y D� T�u")
					
					myAwardArry[myAwardArryIndex] = {3,myMainValue,0,6,1,1475,1,0,myAwardExp,0}
					myAwardArryIndex = myAwardArryIndex + 1
					SetTask(TSK_TASKLINK_SEANSONPOINT, nTemExp);
					
					tl_print("Nh�n ���c m�t ph�n th��ng �i�m kinh nghi�m:"..myAwardExp);
				else
					myAwardExp = format("%s%s",myMainValue," �i�m kinh nghi�m")
					
					myAwardArry[myAwardArryIndex] = {2,myMainValue,0,0,0,0,0,0,myAwardExp,0}
					myAwardArryIndex = myAwardArryIndex + 1
					
					tl_print("Nh�n ���c m�t ph�n th��ng �i�m kinh nghi�m:"..myAwardExp);
				end;
				
			elseif (myAwardType==3) then -- N�u ph�n th��ng l� v�t ph�m
				
				myTaskValue1 = tl_giveplayeraward_goods(1,Task_AwardBasic) -- ��u ti�n l�y s� d�ng c�a v�t ph�m ph�n th��ng
				
				myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Quality"))
				myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Genre"))
				myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Detail"))
				myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Particular"))
				myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Level"))
				myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"GoodsFive"))
				
				-- LLG_ALLINONE_TODO_20070802
				
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				-- Gi� tr� ph�n th��ng nhi�m v� sau khi t�nh to�n c�c gi� tr� c�ng th�m
				myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
				
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); -- Ghi l�i gi� tr� s� l��ng
				
				
				myArawdGoods = TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Name")
				
				myAwardArry[myAwardArryIndex] = {3,myMainValue,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}
				myAwardArryIndex = myAwardArryIndex + 1
				
				tl_print("Nh�n ���c m�t ph�n th��ng: "..myArawdGoods);
				
			elseif (myAwardType==4) then -- N�u ph�n th��ng l� c� h�i ng�u nhi�n l�i m�t l�n n�a
				
				myTaskValue1 = tl_getawardagin() -- L�y s� d�ng sau khi �� th�m ng�n l��ng v� kinh nghi�m v�o danh s�ch
				
				if (myTaskValue1<=getn(Task_AwardBasic) + 1) then
				
					myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Quality"))
					myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Genre"))
					myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Detail"))
					myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Particular"))
					myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Level"))
					myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"GoodsFive"))
				
					myAwardChange = "C� mu�n th� xem ��y l� g� kh�ng?"
					
					--=======================================
					myMainValue = TireReduce(myMainValue); -- Ti�n h�nh x� l� h� th�ng m�t m�i
					myMainValue = CountDoubleMode(myMainValue);  -- Ti�n h�nh x� l� ho�t ��ng x2
					
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); -- Ghi l�i gi� tr� s� l��ng
					
					if (0 == myMainValue)then
						myMainValue = 1;
					end
	
					myAwardArry[myAwardArryIndex] = {4,myMainValue,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myAwardChange,1}
				
				elseif (myTaskValue1 == (getn(Task_AwardBasic) + 2)) then
				
					myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
					myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
					-- Gi� tr� ph�n th��ng nhi�m v� sau khi t�nh to�n c�c gi� tr� c�ng th�m
					myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
				
					myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- L��ng kinh nghi�m th�c t� nh�n ���c sau khi t�nh to�n
					
					--=======================================
					myMainValue = TireReduce(myMainValue); -- Ti�n h�nh x� l� h� th�ng m�t m�i
					myMainValue = CountDoubleMode(myMainValue);  -- Ti�n h�nh x� l� ho�t ��ng x2
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); -- Ghi l�i gi� tr� s� l��ng
					
					myAwardChange = "C� mu�n th� xem ��y l� g� kh�ng?"
					myAwardArry[myAwardArryIndex] = {4,myMainValue,0,0,0,0,0,0,myAwardChange,2}
					
				elseif (myTaskValue1 == (getn(Task_AwardBasic) + 3)) then
	
					myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
					myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
					-- Gi� tr� ph�n th��ng nhi�m v� sau khi t�nh to�n c�c gi� tr� c�ng th�m
					myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
					
					--=======================================
					myMainValue = TireReduce(myMainValue);  -- Ti�n h�nh x� l� h� th�ng m�t m�i��
					myMainValue = CountDoubleMode(myMainValue);  -- Ti�n h�nh x� l� ho�t ��ng x2
					
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); -- Ghi l�i gi� tr� s� l��ng
					
					myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- L��ng ng�n l��ng th�c t� nh�n ���c sau khi t�nh to�n
				
					myAwardChange = "C� mu�n th� xem ��y l� g� kh�ng?"
					myAwardArry[myAwardArryIndex] = {4,myMainValue,0,0,0,0,0,0,myAwardChange,3}
									
				end
				
				myAwardArryIndex = myAwardArryIndex + 1
			
			elseif (myAwardType==5) then -- N�u ph�n th��ng l� m�t c� h�i h�y nhi�m v�
			
				myAwardCancal = "m�t c� h�i h�y b� nhi�m v� "
				myAwardArry[myAwardArryIndex] = {5,0,0,0,0,0,0,0,myAwardCancal,0}
				myAwardArryIndex = myAwardArryIndex + 1	
			
			end
		end
	
		SetRandSeed(_nSeed)
		-- Tr� v� m�ng ph�n th��ng �� ���c c�u t�o s�n
		return myAwardArry, nTongValue;

	elseif (myGiveAwardType==2) then -- Lo�i ph�n th��ng l� ph�n th��ng chu�i
	
		myTaskValue1 = tl_giveplayeraward_goods(2,Task_AwardLink) -- ��u ti�n l�y s� d�ng c�a v�t ph�m ph�n th��ng
		
		myQuality = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Quality"))
		myGenre = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Particular"))
		myLevel = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Level"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"GoodsFive"))
		
		
		myArawdGoods = TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Name")
		
		myAwardSingle = {3,0,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}

		tl_print("B�n �� ch�n cho m�nh ph�n th��ng l�: "..myArawdGoods);
		SetRandSeed(_nSeed)
		return myAwardSingle
			
	elseif (myGiveAwardType==3) then -- Lo�i ph�n th��ng l� ph�n th��ng v�ng
	
		tl_print ("B�t ��u l�a ch�n ph�n th��ng: ");

		myTaskValue1 = tl_giveplayeraward_goods(3,Task_AwardLoop) -- ��u ti�n l�y s� d�ng c�a v�t ph�m ph�n th��ng
		
		myQuality = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Quality"))
		myGenre = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Particular"))
		myLevel = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Level"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"GoodsFive"))
		
		myArawdGoods = TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Name")
		
		myAwardSingle = {3,0,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}

		tl_print("B�n �� ch�n cho m�nh ph�n th��ng l�: "..myArawdGoods);
		SetRandSeed(_nSeed)
		return myAwardSingle

	end
	SetRandSeed(_nSeed)
end


-- H�m con, d�a v�o lo�i ph�n th��ng c�n l�i �� l�y ph�n th��ng
function tl_getawardtypeforrate(myAwardRate)

	local i,j,k = 0,0,0
	local myAwardMainRate = 0
	
	for i=1,getn(myAwardRate) do
		myAwardMainRate = myAwardMainRate + myAwardRate[i]
	end
	
	j=C_Random(1,myAwardMainRate)
	
	tl_print ("Hi�n t�i lo�i h�nh ph�n th��ng g�m: "..myAwardMainRate);
	
	tl_print ("Ch�n cho m�nh ph�n th��ng ng�u nhi�n l�: "..j);
	
	for i=1,getn(myAwardRate) do
		k = k + myAwardRate[i]
		if (j<=k) then
			myAwardRate[i] = 0 -- Gi�m m�t gi� tr� trong bi�n to�n c�c TL_MainAwardRate
			tl_print ("B�n �� ch�n ph�n th��ng � h�ng th�: "..i.." ");
			return i,myAwardRate
		end
	end

	tl_print ("Ch�n ph�n th��ng xu�t hi�n s� c�!!!");

end


-- T�m ki�m danh s�ch ph�n th��ng, l�y ph�n th��ng t��ng �ng
-- myAwardType: Lo�i ph�n th��ng
-- myAwardOrgTable: Danh s�ch d� li�u ph�n th��ng g�c ���c truy�n v�o
-- 1: Ph�n th��ng nhi�m v� c� b�n 2: Ph�n th��ng ho�n th�nh chu�i nhi�m v� 3: Ph�n th��ng ho�n th�nh v�ng nhi�m v�
function tl_giveplayeraward_goods(myAwardType, myAwardOrgTable)

    local myTaskValue1, myTaskValue2 -- Gi� tr� ph�n th��ng nhi�m v� ���c ��c t� b�ng nhi�m v�
    local myLinks, myTimes, myLoops, myCountLinks -- S� l�n v� s� chu�i ho�n th�nh li�n ti�p
    local myMainValue -- Gi� tr� ph�n th��ng nhi�m v� sau khi t�nh to�n c�c gi� tr� c�ng th�m
    local myTaskType = tl_getplayertasktype()

    local myAwardTable

    local FinalAward, n -- Ph�n th��ng cu�i c�ng ���c tr� v�

    myTimes = tl_gettaskstate(1)
    myLinks = tl_gettaskstate(2)
    myLoops = tl_gettaskstate(3)

    myCountLinks = tl_counttasklinknum(2)

    myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType), tl_gettasktablecol(), "TaskValue1"))
    myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType), tl_gettasktablecol(), "TaskValue2"))

    -- Gi� tr� ph�n th��ng nhi�m v� sau khi t�nh to�n c�c gi� tr� c�ng th�m
    if (myAwardType == 1) then
        myMainValue = myTaskValue1 + (myTaskValue2 * (1 + (myCountLinks + myTimes) * 0.1 + myLoops * 0.2))
        myMainValue = myMainValue * (tl_getplayerlucky() * 0.001 + 1)
    elseif (myAwardType == 2) or (myAwardType == 3) then
        myMainValue = 2000000
    end

    -- =======================================
    myMainValue = TireReduce(myMainValue); -- Ti�n h�nh x� l� h� th�ng m�t m�i
    myMainValue = CountDoubleMode(myMainValue); -- Ti�n h�nh x� l� ho�t ��ng x2

    if (0 == myMainValue) then
        myMainValue = 1;
    end

    myAwardTable = AssignValue_AwardRate(myAwardOrgTable, myMainValue)

    n = tl_getaward(myAwardTable)

    return n -- Tr� v� s� d�ng c�a ph�n th��ng

end


-- N�u ch�n ng�u nhi�n l�i m�t l�n n�a th� g�i h�m n�y
function tl_getawardagin()

    tl_print("B�t ��u th�ng k� s� l�n ch�n ph�n th��ng ng�u nhi�n");

    local myMainValue, myTaskValue1, myTaskValue2, myOrgValue
    local myTaskType = tl_getplayertasktype()
    local myAwardExp, myAwardMoney
    local myAwardAddTable = {{0, 0}, {0, 0}}

    local myReAwardTable = {}
    myReAwardTable[1] = {}

    local myTimes = tl_gettaskstate(1)
    local myLinks = tl_gettaskstate(2)
    local myLoops = tl_gettaskstate(3)

    local n

    for i = 1, getn(Task_AwardBasic) + 2 do
        myReAwardTable[i] = {}
    end

    myCountLinks = tl_counttasklinknum(2)

    myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType), tl_gettasktablecol(), "TaskValue1"))
    myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType), tl_gettasktablecol(), "TaskValue2"))
    -- Gi� tr� ph�n th��ng nhi�m v� sau khi t�nh to�n c�c gi� tr� c�ng th�m
    myMainValue = myTaskValue1 + (myTaskValue2 * (1 + (myCountLinks + myTimes) * 0.1) + myLoops * 0.2)
    myMainValue = myMainValue * (tl_getplayerlucky() * 0.03 + 1)
    myOrgValue = myMainValue; -- ��y l� gi� tr� c� b�n d�ng �� truy�n v�o �� ch�n v�t ph�m

    tl_print("B�t ��u th�ng k� s� l�n ch�n ph�n th��ng ng�u nhi�n, t�ng gi� tr� ph�n th��ng nhi�m v� l�: " .. myMainValue);

    myMainValue = floor((myMainValue / 2) * (C_Random(80, 120) * 0.01)) -- L��ng kinh nghi�m th�c t� nh�n ���c sau khi t�nh to�n
    myAwardExp = myMainValue

    myMainValue = floor((myMainValue / 2) * (C_Random(80, 120) * 0.01)) -- L��ng ng�n l��ng th�c t� nh�n ���c sau khi t�nh to�n
    myAwardMoney = myMainValue

    myAwardAddTable[1][1] = getn(Task_AwardBasic) + 1
    myAwardAddTable[1][2] = myAwardExp

    myAwardAddTable[2][1] = getn(Task_AwardBasic) + 2
    myAwardAddTable[2][2] = myAwardMoney

    for i = 1, getn(Task_AwardBasic) do
        myReAwardTable[i][1] = Task_AwardBasic[i][1]
        myReAwardTable[i][2] = Task_AwardBasic[i][2]
    end

    myReAwardTable[(getn(Task_AwardBasic) + 1)] = {myAwardAddTable[1][1], myAwardAddTable[1][2]}
    myReAwardTable[(getn(Task_AwardBasic) + 2)] = {myAwardAddTable[2][1], myAwardAddTable[2][2]}

    tl_print("nh�p gi� tr� ph�n th��ng " .. myMainValue);

    myReAwardTable = AssignValue_AwardRate(myReAwardTable, myOrgValue * 1.2)

    tl_print("Sau khi th�ng k�, t�ng s� h�ng l�: " .. getn(myReAwardTable));

    n = tl_getaward(myReAwardTable)

    return n

end


-- Trong danh s�ch tr�ng s� ph�n th��ng �� h�nh th�nh, ch�n ra m�t ph�n th��ng, gi� tr� tr� v� l� s� d�ng c�a ph�n th��ng �� trong b�ng
function tl_getaward(myAwardVariable)

    local i, j, k = 0, 0, 0
    local myMainRate = 0 -- T�ng tr�ng s� ph�n th��ng

    tl_print("Sau khi th�ng k�, t�ng s� nguy�n t� nh�p tr�n c�c h�ng l�: " .. getn(myAwardVariable));

    for i = 1, getn(myAwardVariable) do
        myMainRate = myMainRate + myAwardVariable[i][2]
    end

    j = C_Random(1, 100) / 100 * myMainRate

    tl_print("S� l�n ch�n l�a qu� th��ng ng�u nhi�n l�:" .. j);

    for i = 1, getn(myAwardVariable) do
        k = k + myAwardVariable[i][2]

        tl_print("S� l�n xu�t hi�n tr� s� k trong qu� tr�nh l�a ch�n ph�n th��ng l�:" .. k);

        if (j < k) then
            return myAwardVariable[i][1]
        end
    end

end



-- Ph�t th��ng c� ��nh s� l�n cho ng��i ch�i, tr�c ti�p trao cho ng��i ch�i
-- Tham s� truy�n v�o l� b�ng d� li�u g�c, s� l�n �� ho�n th�nh hi�n t�i
function tl_getlinkaward(orgLinkAward, nTask)

    local i, j, nAward = 0, 0, 0;
    local decLinkAward = {}; -- S� d�ng, tr�ng s�

    local k, nRate = 0, 0; -- D�ng �� t�nh to�n hai s� tr�ng s�

    local nAwardCol = 0; -- L�y s� d�ng c�a b�ng �� nh�n ���c

    local nGoods = {"", 0, 0, 0, 0, 0, 0, 0};

    for i = 1, getn(orgLinkAward) do

        if (nTask == orgLinkAward[i][1]) then -- �� ��t ��n s� l�n ph� h�p �� ph�t th��ng
            nAward = nAward + 1;
            -- decLinkAward[nAward][1] = orgLinkAward[i][2];
            -- decLinkAward[nAward][2] = orgLinkAward[i][3];
            tinsert(decLinkAward, nAward, {orgLinkAward[i][2], orgLinkAward[i][3]});
        end

    end

    if (nAward == 0) then -- N�u kh�ng c� ph�n th��ng n�o th� tr� v� nil
        -- storm_ask2start(4, 1)	--Storm ��ʼ��ս
        return
    end

    if (getn(decLinkAward) > 0) then

        for i = 1, getn(decLinkAward) do
            nRate = nRate + decLinkAward[i][2];
        end

        j = C_Random(1, nRate);

        for i = 1, getn(decLinkAward) do
            k = k + decLinkAward[i][2];
            if (j <= k) then
                nAwardCol = decLinkAward[i][1];
                break
            end
        end

        nGoods[1] = TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Name");
        nGoods[2] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Quality"));
        nGoods[3] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Genre"));
        nGoods[4] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Detail"));
        nGoods[5] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Particular"));
        nGoods[6] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Level"));
        nGoods[7] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "GoodsFive"));
        nGoods[8] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Magiclevel"));

        if (nGoods[2] == 1) then
            AddGoldItem(0, nGoods[3]);
            Msg2Player("Ch�c m�ng b�n! Ho�n th�nh nhi�m v� l�n n�y  " .. nTask .. " b�n nh�n ���c" .. nGoods[1] .. "!!!");
            Say("B�n tr� l�m t�t l�m, t�ng ng��i <color=yellow>" .. nGoods[1] .. "<color> n�y, sau n�y h�y c� g�ng th�m nh�!", 0);
            AddGlobalCountNews("Ng��i ch�i " .. GetName() .. "B�n ho�n th�nh nhi�m v� n�y  " .. nTask .. " D� T�u, nh�n ���c 1 b� Trang b� Ho�ng Kim " .. nGoods[1] .. " m�t c�i!!!", 3);

            WriteLog(date("%H%M%S") .. ": T�i kho�n" .. GetAccount() .. ", nh�n v�t" .. GetName() .. "l�n, nh�n ���c 1 b� Trang b� Ho�ng Kim " .. nGoods[1])

        else
            AddItem(nGoods[3], nGoods[4], nGoods[5], nGoods[6], nGoods[7], nGoods[8], 0);
            Msg2Player("Ch�c m�ng b�n! Ho�n th�nh nhi�m v� l�n n�y  " .. nTask .. " b�n nh�n ���c" .. nGoods[1] .. "!!!");

            if (nTask >= 100) then -- N�u s� l�n nhi�m v� l�n h�n 100 m�i ghi LOG
                TaskLink_WriteLog(nTask, nGoods[1]);
            end

            Say("B�n tr� l�m t�t l�m, t�ng ng��i <color=yellow>" .. nGoods[1] .. "<color> n�y, sau n�y h�y c� g�ng th�m nh�!", 0);
        end

    else

        -- storm_ask2start(4, 1)	--Storm ��ʼ��ս
        return

    end

end



-- L�y gi� tr� May M�n c�a ng��i ch�i
function tl_getplayerlucky()

    local nLucky = GetLucky(0);

    if (nLucky ~= nil) and (nLucky ~= 0) then
        return nLucky
    else
        return 1
    end

end



-- X�y d�ng b�ng ch� m�c tr�ng s� ph�n th��ng
-- Tham s� truy�n v�o: myTaskVariable l� danh s�ch gi� tr� ph�n th��ng g�c, myAwardValue l� t�ng gi� tr� v�t ph�m �� t�nh to�n
-- Gi� tr� tr� v� l� ch� m�c s� d�ng c�a file b�ng c�a m�i ph�n th��ng v� tr�ng s� c�a n�
function AssignValue_AwardRate(myAwardVariable, myAwardValue)

    local i, j, k = 0, 0, 0
    local myAwardRate = {{}} -- B�ng tr�ng s� sau khi chuy�n ��i
    local myAwardNum = getn(myAwardVariable)

    for i = 1, myAwardNum do
        myAwardRate[i] = {}
    end

    for i = 1, myAwardNum do

        k = i + 1 -- D�ng k �� gi� nguy�n s� d�ng c�a b�ng

        myAwardRate[i][2] = myAwardVariable[i][2]

        if (myAwardValue > myAwardVariable[i][2]) then
            myAwardRate[i][2] = myAwardValue
        end

        j = myAwardValue / (myAwardNum * (myAwardRate[i][2]))

        myAwardRate[i] = {k, j}

    end

    return myAwardRate

end

-- C�u t�o danh s�ch l�u tr� ph�n th��ng s� l�n c� ��nh
function AssignValue_LinkAward(myTaskTextID)

    local i, j = 0, 0;
    local myLinkAward = {{0, 0, 0}}; -- Danh s�ch l�u tr�: s� l�n nhi�m v�, s� d�ng b�ng, tr�ng s�

    local myTableRow = TabFile_GetRowCount(myTaskTextID)
    local nTaskNum = 0;

    for i = 1, myTableRow - 1 do
        myLinkAward[i] = {0, 0, 0};
    end

    for i = 2, myTableRow do
        j = j + 1;
        nTaskNum = tonumber(TabFile_GetCell(myTaskTextID, i, "Num"));
        myLinkAward[j][1] = nTaskNum;
        myLinkAward[j][2] = i;
        myLinkAward[j][3] = tonumber(TabFile_GetCell(myTaskTextID, i, "TaskValue"));
    end

    return myLinkAward;

end



-- Ghi LOG chu�i nhi�m v�
function TaskLink_WriteLog(nTask, strGoods)

	WriteLog(" [Ghi nh� nh�n ph�n th��ng]"..date(" [%y n�m %m th�ng %d ng�y  %H gi� %M ph�t]")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName().."B�n ho�n th�nh nhi�m v� n�y  "..nTask.."  l�n, nh�n ���c ph�n th��ng"..strGoods);

end

-- H�m gi�m m�t m�i h� th�ng
function TireReduce(myMainValue)
    --	Msg2Player("Gi� tr� g�c: "..myMainValue);
    if (nil == myMainValue) then
        return 0;
    end
    local Value = myMainValue;
    local TireDegree = GetTiredDegree();
    TireDegree = 0;
    if (1 == TireDegree) then
        Value = floor(Value / 2);
    elseif (2 == TireDegree) then
        Value = 0;
    end

    --	Msg2Player("Gi� tr� sau x� l� ch�ng l�i: "..Value);
    return Value;
end


-- Ch� �� ho�t ��ng x2
-- Tham s� truy�n v�o: int:nValue L��ng gi� tr� c�n t�nh to�n
function CountDoubleMode(nValue)

    local nDoubleMode = greatnight_huang_event(4);

    if nDoubleMode ~= 0 or nDoubleMode ~= nil then
        return nValue * nDoubleMode;
    else
        return nValue;
    end

end

-- ��c d� li�u b�ng, m�i l�n ��u thao t�c th�m, vi�t th�nh m�t h�m
function getawardgoodsdata(nIndex)
    local myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC, nIndex, "Quality"))
    local myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC, nIndex, "Genre"))
    local myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC, nIndex, "Detail"))
    local myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC, nIndex, "Particular"))
    local myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC, nIndex, "Level"))
    local myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC, nIndex, "GoodsFive"))
    local myArawdGoods = TabFile_GetCell(TL_AWARDBASIC, nIndex, "Name")
    return myQuality, myGenre, myDetail, myParticular, myLevel, myGoodsFive, myArawdGoods;
end


--function GetTiredDegree()
--	return 1;
--end