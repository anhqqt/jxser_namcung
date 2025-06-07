-- File head phÇn th­ëng kÞch b¶n chuçi nhiÖm vô D· TÈu
-- Edited by peres
-- 2004/12/25 S¸ng Gi¸ng Sinh

-- T¶i file ®Çu ch­¬ng HuyÔn Hoµn
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua");
Include("\\script\\tong\\tong_award_head.lua");	--by zhishan


-- Hµm tæng ph¸t th­ëng cho ng­êi ch¬i
-- Tham sè truyÒn vµo: myAwardType, 1 lµ phÇn th­ëng nhiÖm vô th«ng th­êng, 2 lµ phÇn th­ëng chuçi, 3 lµ phÇn th­ëng vßng
function tl_giveplayeraward(myGiveAwardType)

	-- TruyÒn c¸c tham sè cho b¶ng phÇn th­ëng:
	-- NÕu lµ vËt phÈm th× lÇn l­ît lµ: Lo¹i phÇn th­ëng, Quality, Genre, Detail, Particular, Level, GoodsFive, Magiclevel, vµ m« t¶ v¨n b¶n
	-- NÕu lµ ng©n l­îng th× lÇn l­ît lµ: Lo¹i phÇn th­ëng, sè l­îng ng©n l­îng
	-- NÕu lµ kinh nghiÖm th× lÇn l­ît lµ: Lo¹i phÇn th­ëng, sè l­îng kinh nghiÖm
	-- NÕu lµ c¬ héi ngÉu nhiªn hoÆc c¬ héi hñy th× chØ ghi l¹i vÞ trÝ ®Çu tiªn lµ lo¹i phÇn th­ëng
	local myAwardArry = {
							{0,0,0,0,0,0,0,0,"",0}, 
						 	{0,0,0,0,0,0,0,0,"",0},
						 	{0,0,0,0,0,0,0,0,"",0}
				        }
	
	-- Dïng ®Ó xö lý tr¶ vÒ phÇn th­ëng chuçi vµ phÇn th­ëng vßng
	local myAwardSingle = {0,0,0,0,0,0,0,0,"",0}
	
	-- M¶ng phÇn th­ëng, lÇn l­ît lµ träng sè cña c¸c lo¹i phÇn th­ëng
    -- LÇn l­ît lµ: ng©n l­îng, kinh nghiÖm, vËt phÈm, c¬ héi ngÉu nhiªn thªm mét lÇn n÷a, c¬ héi hñy nhiÖm vô
    -- 0 cã nghÜa lµ lo¹i phÇn th­ëng nµo ®ã ®· ®­îc chän
	local myMainAwardRate = {20,33,34,8,5}
	
	local myTaskValue1,myTaskValue2,myMainValue -- BiÕn t¹m thêi, dïng ®Ó ghi l¹i gi¸ trÞ sè ®· ®äc
	-- Dïng cho chuçi ký tù truyÒn vµo cña phÇn th­ëng
	local myAwardGoods,myAwardExp,myAwardMoney,myAwardCancal,myAwardChange = "","","","",""
	
	local myArawdGoods = {0,0,0,0,0,0} -- M¶ng t­¬ng øng víi vËt phÈm phÇn th­ëng
	
	local myAwardType = 0
	
	local myAwardArryIndex = 1 -- Dïng ®Ó ghi l¹i ®· ghi bao nhiªu phÇn tö trong m¶ng phÇn th­ëng
	
	local myRandomNum,myRandomSeed -- Sè ngÉu nhiªn vµ h¹t gièng ngÉu nhiªn
	
	local myCountLinks -- Sè chuçi ®· hoµn thµnh liªn tiÕp hiÖn t¹i
	
	local myTimes = tl_gettaskstate(1)
	local myLinks = tl_gettaskstate(2)
	local myLoops = tl_gettaskstate(3)
	
	myCountLinks = tl_counttasklinknum(2)
	
	myTaskType = tl_getplayertasktype()
		
	local _nSeed = SetRandSeed(nt_getTask(1037))
	local nTongValue = 0;
	
	if (myGiveAwardType==1) then -- Lo¹i phÇn th­ëng lµ phÇn th­ëng nhiÖm vô th«ng th­êng

		for i=1,3 do -- Vßng lÆp chän ra ba lo¹i phÇn th­ëng
			
			myAwardType,myMainAwardRate = tl_getawardtypeforrate(myMainAwardRate)
			
			tl_print("vßng quay thø  "..i.."®· chän ®­îc lo¹i h×nh gi¶i th­ëng: "..myAwardType);
			
			if (myAwardType==1) then -- NÕu lo¹i phÇn th­ëng lµ ng©n l­îng
				
				myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				
				-- Gi¸ trÞ phÇn th­ëng nhiÖm vô sau khi tÝnh to¸n c¸c gi¸ trÞ céng thªm
				myMainValue = myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2
				
				-- 2005/9/20 §· söa ®æi tû lÖ s¶n sinh ng©n l­îng, dao ®éng tõ 60% ~ 100%
				-- 2006/8/23 §· söa ®æi gi¸ trÞ ng©n l­îng cña nhiÖm vô D· TÈu cho phiªn b¶n ViÖt Nam, t¨ng thªm 15%
				myMainValue = floor((myMainValue * 0.05 * 1.15) * (C_Random(60,100) * 0.01)) + myTaskValue1 -- L­îng ng©n l­îng thùc tÕ nhËn ®­îc sau khi tÝnh to¸n
				
				--=======================================
				
				myMainValue = TireReduce(myMainValue);  -- TiÕn hµnh xö lý hÖ thèng mÖt mái
				myMainValue = CountDoubleMode(myMainValue);  -- TiÕn hµnh xö lý ho¹t ®éng x2
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); -- Ghi l¹i gi¸ trÞ sè l­îng
				
				myAwardMoney = format("%s%s",myMainValue," tiÒn ");
				
				myAwardArry[myAwardArryIndex] = {1,myMainValue,0,0,0,0,0,0,myAwardMoney,0}
				myAwardArryIndex = myAwardArryIndex + 1
				
				tl_print("NhËn ®­îc  tiÒn th­ëng: "..myAwardMoney);
				
			elseif (myAwardType==2) then -- NÕu phÇn th­ëng lµ kinh nghiÖm
			
				myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				-- Gi¸ trÞ phÇn th­ëng nhiÖm vô sau khi tÝnh to¸n c¸c gi¸ trÞ céng thªm
				myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
				
				-- 2006/8/23 §· söa ®æi gi¸ trÞ kinh nghiÖm cña nhiÖm vô D· TÈu cho phiªn b¶n ViÖt Nam, gi¶m 10%
				myMainValue = floor((myMainValue * 0.36) * (C_Random(80,120) * 0.01)) -- L­îng kinh nghiÖm thùc tÕ nhËn ®­îc sau khi tÝnh to¸n
				
				--=======================================
				myMainValue = TireReduce(myMainValue);-- TiÕn hµnh xö lý hÖ thèng mÖt mái
				myMainValue = CountDoubleMode(myMainValue);  -- TiÕn hµnh xö lý ho¹t ®éng x2
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); -- Ghi l¹i gi¸ trÞ sè l­îng
				
				-- 2007/7/11 §· söa ®æi phÇn th­ëng kinh nghiÖm D· TÈu cho phiªn b¶n ViÖt Nam ®Ó chèng lçi, nÕu ®ang ë tr¹ng th¸i mÖt mái, kinh nghiÖm sÏ ®­îc l­u vµo vËt phÈm
				-- Trong tÝch ph©n D· TÈu, cã thÓ sö dông ®Ó nhËn kinh nghiÖm khi kh«ng mÖt mái
				if (GetTiredDegree() == 2) then
					local nTemExp = floor(myMainValue / 1000);
					if (nTemExp < 0) then
						nTemExp = 1;
					end;
					myMainValue = nTemExp * 1000;
					myAwardExp = format("%s%s",myMainValue," ®iÓm tÝch lòy D· TÈu")
					
					myAwardArry[myAwardArryIndex] = {3,myMainValue,0,6,1,1475,1,0,myAwardExp,0}
					myAwardArryIndex = myAwardArryIndex + 1
					SetTask(TSK_TASKLINK_SEANSONPOINT, nTemExp);
					
					tl_print("NhËn ®­îc mét phÇn th­ëng ®iÓm kinh nghiÖm:"..myAwardExp);
				else
					myAwardExp = format("%s%s",myMainValue," ®iÓm kinh nghiÖm")
					
					myAwardArry[myAwardArryIndex] = {2,myMainValue,0,0,0,0,0,0,myAwardExp,0}
					myAwardArryIndex = myAwardArryIndex + 1
					
					tl_print("NhËn ®­îc mét phÇn th­ëng ®iÓm kinh nghiÖm:"..myAwardExp);
				end;
				
			elseif (myAwardType==3) then -- NÕu phÇn th­ëng lµ vËt phÈm
				
				myTaskValue1 = tl_giveplayeraward_goods(1,Task_AwardBasic) -- §Çu tiªn lÊy sè dßng cña vËt phÈm phÇn th­ëng
				
				myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Quality"))
				myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Genre"))
				myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Detail"))
				myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Particular"))
				myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Level"))
				myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"GoodsFive"))
				
				-- LLG_ALLINONE_TODO_20070802
				
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				-- Gi¸ trÞ phÇn th­ëng nhiÖm vô sau khi tÝnh to¸n c¸c gi¸ trÞ céng thªm
				myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
				
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); -- Ghi l¹i gi¸ trÞ sè l­îng
				
				
				myArawdGoods = TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Name")
				
				myAwardArry[myAwardArryIndex] = {3,myMainValue,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}
				myAwardArryIndex = myAwardArryIndex + 1
				
				tl_print("NhËn ®­îc mét phÇn th­ëng: "..myArawdGoods);
				
			elseif (myAwardType==4) then -- NÕu phÇn th­ëng lµ c¬ héi ngÉu nhiªn l¹i mét lÇn n÷a
				
				myTaskValue1 = tl_getawardagin() -- LÊy sè dßng sau khi ®· thªm ng©n l­îng vµ kinh nghiÖm vµo danh s¸ch
				
				if (myTaskValue1<=getn(Task_AwardBasic) + 1) then
				
					myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Quality"))
					myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Genre"))
					myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Detail"))
					myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Particular"))
					myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Level"))
					myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"GoodsFive"))
				
					myAwardChange = "Cã muèn thö xem ®©y lµ g× kh«ng?"
					
					--=======================================
					myMainValue = TireReduce(myMainValue); -- TiÕn hµnh xö lý hÖ thèng mÖt mái
					myMainValue = CountDoubleMode(myMainValue);  -- TiÕn hµnh xö lý ho¹t ®éng x2
					
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); -- Ghi l¹i gi¸ trÞ sè l­îng
					
					if (0 == myMainValue)then
						myMainValue = 1;
					end
	
					myAwardArry[myAwardArryIndex] = {4,myMainValue,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myAwardChange,1}
				
				elseif (myTaskValue1 == (getn(Task_AwardBasic) + 2)) then
				
					myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
					myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
					-- Gi¸ trÞ phÇn th­ëng nhiÖm vô sau khi tÝnh to¸n c¸c gi¸ trÞ céng thªm
					myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
				
					myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- L­îng kinh nghiÖm thùc tÕ nhËn ®­îc sau khi tÝnh to¸n
					
					--=======================================
					myMainValue = TireReduce(myMainValue); -- TiÕn hµnh xö lý hÖ thèng mÖt mái
					myMainValue = CountDoubleMode(myMainValue);  -- TiÕn hµnh xö lý ho¹t ®éng x2
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); -- Ghi l¹i gi¸ trÞ sè l­îng
					
					myAwardChange = "Cã muèn thö xem ®©y lµ g× kh«ng?"
					myAwardArry[myAwardArryIndex] = {4,myMainValue,0,0,0,0,0,0,myAwardChange,2}
					
				elseif (myTaskValue1 == (getn(Task_AwardBasic) + 3)) then
	
					myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
					myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
					-- Gi¸ trÞ phÇn th­ëng nhiÖm vô sau khi tÝnh to¸n c¸c gi¸ trÞ céng thªm
					myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
					
					--=======================================
					myMainValue = TireReduce(myMainValue);  -- TiÕn hµnh xö lý hÖ thèng mÖt mái£»
					myMainValue = CountDoubleMode(myMainValue);  -- TiÕn hµnh xö lý ho¹t ®éng x2
					
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); -- Ghi l¹i gi¸ trÞ sè l­îng
					
					myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- L­îng ng©n l­îng thùc tÕ nhËn ®­îc sau khi tÝnh to¸n
				
					myAwardChange = "Cã muèn thö xem ®©y lµ g× kh«ng?"
					myAwardArry[myAwardArryIndex] = {4,myMainValue,0,0,0,0,0,0,myAwardChange,3}
									
				end
				
				myAwardArryIndex = myAwardArryIndex + 1
			
			elseif (myAwardType==5) then -- NÕu phÇn th­ëng lµ mét c¬ héi hñy nhiÖm vô
			
				myAwardCancal = "mét c¬ héi hñy bá nhiÖm vô "
				myAwardArry[myAwardArryIndex] = {5,0,0,0,0,0,0,0,myAwardCancal,0}
				myAwardArryIndex = myAwardArryIndex + 1	
			
			end
		end
	
		SetRandSeed(_nSeed)
		-- Tr¶ vÒ m¶ng phÇn th­ëng ®· ®­îc cÊu t¹o s½n
		return myAwardArry, nTongValue;

	elseif (myGiveAwardType==2) then -- Lo¹i phÇn th­ëng lµ phÇn th­ëng chuçi
	
		myTaskValue1 = tl_giveplayeraward_goods(2,Task_AwardLink) -- §Çu tiªn lÊy sè dßng cña vËt phÈm phÇn th­ëng
		
		myQuality = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Quality"))
		myGenre = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Particular"))
		myLevel = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Level"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"GoodsFive"))
		
		
		myArawdGoods = TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Name")
		
		myAwardSingle = {3,0,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}

		tl_print("B¹n ®· chän cho m×nh phÇn th­ëng lµ: "..myArawdGoods);
		SetRandSeed(_nSeed)
		return myAwardSingle
			
	elseif (myGiveAwardType==3) then -- Lo¹i phÇn th­ëng lµ phÇn th­ëng vßng
	
		tl_print ("B¾t ®Çu lùa chän phÇn th­ëng: ");

		myTaskValue1 = tl_giveplayeraward_goods(3,Task_AwardLoop) -- §Çu tiªn lÊy sè dßng cña vËt phÈm phÇn th­ëng
		
		myQuality = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Quality"))
		myGenre = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Particular"))
		myLevel = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Level"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"GoodsFive"))
		
		myArawdGoods = TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Name")
		
		myAwardSingle = {3,0,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}

		tl_print("B¹n ®· chän cho m×nh phÇn th­ëng lµ: "..myArawdGoods);
		SetRandSeed(_nSeed)
		return myAwardSingle

	end
	SetRandSeed(_nSeed)
end


-- Hµm con, dùa vµo lo¹i phÇn th­ëng cßn l¹i ®Ó lÊy phÇn th­ëng
function tl_getawardtypeforrate(myAwardRate)

	local i,j,k = 0,0,0
	local myAwardMainRate = 0
	
	for i=1,getn(myAwardRate) do
		myAwardMainRate = myAwardMainRate + myAwardRate[i]
	end
	
	j=C_Random(1,myAwardMainRate)
	
	tl_print ("HiÖn t¹i lo¹i h×nh phÇn th­ëng gåm: "..myAwardMainRate);
	
	tl_print ("Chän cho m×nh phÇn th­ëng ngÉu nhiªn lµ: "..j);
	
	for i=1,getn(myAwardRate) do
		k = k + myAwardRate[i]
		if (j<=k) then
			myAwardRate[i] = 0 -- Gi¶m mét gi¸ trÞ trong biÕn toµn côc TL_MainAwardRate
			tl_print ("B¹n ®· chän phÇn th­ëng ë hµng thø: "..i.." ");
			return i,myAwardRate
		end
	end

	tl_print ("Chän phÇn th­ëng xuÊt hiÖn sù cè!!!");

end


-- T×m kiÕm danh s¸ch phÇn th­ëng, lÊy phÇn th­ëng t­¬ng øng
-- myAwardType: Lo¹i phÇn th­ëng
-- myAwardOrgTable: Danh s¸ch d÷ liÖu phÇn th­ëng gèc ®­îc truyÒn vµo
-- 1: PhÇn th­ëng nhiÖm vô c¬ b¶n 2: PhÇn th­ëng hoµn thµnh chuçi nhiÖm vô 3: PhÇn th­ëng hoµn thµnh vßng nhiÖm vô
function tl_giveplayeraward_goods(myAwardType, myAwardOrgTable)

    local myTaskValue1, myTaskValue2 -- Gi¸ trÞ phÇn th­ëng nhiÖm vô ®­îc ®äc tõ b¶ng nhiÖm vô
    local myLinks, myTimes, myLoops, myCountLinks -- Sè lÇn vµ sè chuçi hoµn thµnh liªn tiÕp
    local myMainValue -- Gi¸ trÞ phÇn th­ëng nhiÖm vô sau khi tÝnh to¸n c¸c gi¸ trÞ céng thªm
    local myTaskType = tl_getplayertasktype()

    local myAwardTable

    local FinalAward, n -- PhÇn th­ëng cuèi cïng ®­îc tr¶ vÒ

    myTimes = tl_gettaskstate(1)
    myLinks = tl_gettaskstate(2)
    myLoops = tl_gettaskstate(3)

    myCountLinks = tl_counttasklinknum(2)

    myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType), tl_gettasktablecol(), "TaskValue1"))
    myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType), tl_gettasktablecol(), "TaskValue2"))

    -- Gi¸ trÞ phÇn th­ëng nhiÖm vô sau khi tÝnh to¸n c¸c gi¸ trÞ céng thªm
    if (myAwardType == 1) then
        myMainValue = myTaskValue1 + (myTaskValue2 * (1 + (myCountLinks + myTimes) * 0.1 + myLoops * 0.2))
        myMainValue = myMainValue * (tl_getplayerlucky() * 0.001 + 1)
    elseif (myAwardType == 2) or (myAwardType == 3) then
        myMainValue = 2000000
    end

    -- =======================================
    myMainValue = TireReduce(myMainValue); -- TiÕn hµnh xö lý hÖ thèng mÖt mái
    myMainValue = CountDoubleMode(myMainValue); -- TiÕn hµnh xö lý ho¹t ®éng x2

    if (0 == myMainValue) then
        myMainValue = 1;
    end

    myAwardTable = AssignValue_AwardRate(myAwardOrgTable, myMainValue)

    n = tl_getaward(myAwardTable)

    return n -- Tr¶ vÒ sè dßng cña phÇn th­ëng

end


-- NÕu chän ngÉu nhiªn l¹i mét lÇn n÷a th× gäi hµm nµy
function tl_getawardagin()

    tl_print("B¾t ®Çu thèng kª sè lÇn chän phÇn th­ëng ngÉu nhiªn");

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
    -- Gi¸ trÞ phÇn th­ëng nhiÖm vô sau khi tÝnh to¸n c¸c gi¸ trÞ céng thªm
    myMainValue = myTaskValue1 + (myTaskValue2 * (1 + (myCountLinks + myTimes) * 0.1) + myLoops * 0.2)
    myMainValue = myMainValue * (tl_getplayerlucky() * 0.03 + 1)
    myOrgValue = myMainValue; -- §©y lµ gi¸ trÞ c¬ b¶n dïng ®Ó truyÒn vµo ®Ó chän vËt phÈm

    tl_print("B¾t ®Çu thèng kª sè lÇn chän phÇn th­ëng ngÉu nhiªn, tæng gi¸ trÞ phÇn th­ëng nhiÖm vô lµ: " .. myMainValue);

    myMainValue = floor((myMainValue / 2) * (C_Random(80, 120) * 0.01)) -- L­îng kinh nghiÖm thùc tÕ nhËn ®­îc sau khi tÝnh to¸n
    myAwardExp = myMainValue

    myMainValue = floor((myMainValue / 2) * (C_Random(80, 120) * 0.01)) -- L­îng ng©n l­îng thùc tÕ nhËn ®­îc sau khi tÝnh to¸n
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

    tl_print("nhËp gi¸ trÞ phÇn th­ëng " .. myMainValue);

    myReAwardTable = AssignValue_AwardRate(myReAwardTable, myOrgValue * 1.2)

    tl_print("Sau khi thèng kª, tæng sè hµng lµ: " .. getn(myReAwardTable));

    n = tl_getaward(myReAwardTable)

    return n

end


-- Trong danh s¸ch träng sè phÇn th­ëng ®· h×nh thµnh, chän ra mét phÇn th­ëng, gi¸ trÞ tr¶ vÒ lµ sè dßng cña phÇn th­ëng ®ã trong b¶ng
function tl_getaward(myAwardVariable)

    local i, j, k = 0, 0, 0
    local myMainRate = 0 -- Tæng träng sè phÇn th­ëng

    tl_print("Sau khi thèng kª, tæng sè nguyªn tè nhËp trªn c¸c hµng lµ: " .. getn(myAwardVariable));

    for i = 1, getn(myAwardVariable) do
        myMainRate = myMainRate + myAwardVariable[i][2]
    end

    j = C_Random(1, 100) / 100 * myMainRate

    tl_print("Sè lÇn chän lùa quµ th­ëng ngÉu nhiªn lµ:" .. j);

    for i = 1, getn(myAwardVariable) do
        k = k + myAwardVariable[i][2]

        tl_print("Sè lÇn xuÊt hiÖn trÞ sè k trong qu¸ tr×nh lùa chän phÇn th­ëng lµ:" .. k);

        if (j < k) then
            return myAwardVariable[i][1]
        end
    end

end



-- Ph¸t th­ëng cè ®Þnh sè lÇn cho ng­êi ch¬i, trùc tiÕp trao cho ng­êi ch¬i
-- Tham sè truyÒn vµo lµ b¶ng d÷ liÖu gèc, sè lÇn ®· hoµn thµnh hiÖn t¹i
function tl_getlinkaward(orgLinkAward, nTask)

    local i, j, nAward = 0, 0, 0;
    local decLinkAward = {}; -- Sè dßng, träng sè

    local k, nRate = 0, 0; -- Dïng ®Ó tÝnh to¸n hai sè träng sè

    local nAwardCol = 0; -- LÊy sè dßng cña b¶ng ®· nhËn ®­îc

    local nGoods = {"", 0, 0, 0, 0, 0, 0, 0};

    for i = 1, getn(orgLinkAward) do

        if (nTask == orgLinkAward[i][1]) then -- §· ®¹t ®Õn sè lÇn phï hîp ®Ó ph¸t th­ëng
            nAward = nAward + 1;
            -- decLinkAward[nAward][1] = orgLinkAward[i][2];
            -- decLinkAward[nAward][2] = orgLinkAward[i][3];
            tinsert(decLinkAward, nAward, {orgLinkAward[i][2], orgLinkAward[i][3]});
        end

    end

    if (nAward == 0) then -- NÕu kh«ng cã phÇn th­ëng nµo th× tr¶ vÒ nil
        -- storm_ask2start(4, 1)	--Storm ¿ªÊ¼ÌôÕ½
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
            Msg2Player("Chóc mõng b¹n! Hoµn thµnh nhiÖm vô lÇn nµy  " .. nTask .. " b¹n nhËn ®­îc" .. nGoods[1] .. "!!!");
            Say("B¹n trÎ lµm tèt l¾m, tÆng ng­¬i <color=yellow>" .. nGoods[1] .. "<color> nµy, sau nµy h·y cè g¾ng thªm nhÐ!", 0);
            AddGlobalCountNews("Ng­êi ch¬i " .. GetName() .. "B¹n hoµn thµnh nhiÖm vô nµy  " .. nTask .. " D· TÈu, nhËn ®­îc 1 bé Trang bÞ Hoµng Kim " .. nGoods[1] .. " mét c¸i!!!", 3);

            WriteLog(date("%H%M%S") .. ": Tµi kho¶n" .. GetAccount() .. ", nh©n vËt" .. GetName() .. "lÇn, nhËn ®­îc 1 bé Trang bÞ Hoµng Kim " .. nGoods[1])

        else
            AddItem(nGoods[3], nGoods[4], nGoods[5], nGoods[6], nGoods[7], nGoods[8], 0);
            Msg2Player("Chóc mõng b¹n! Hoµn thµnh nhiÖm vô lÇn nµy  " .. nTask .. " b¹n nhËn ®­îc" .. nGoods[1] .. "!!!");

            if (nTask >= 100) then -- NÕu sè lÇn nhiÖm vô lín h¬n 100 míi ghi LOG
                TaskLink_WriteLog(nTask, nGoods[1]);
            end

            Say("B¹n trÎ lµm tèt l¾m, tÆng ng­¬i <color=yellow>" .. nGoods[1] .. "<color> nµy, sau nµy h·y cè g¾ng thªm nhÐ!", 0);
        end

    else

        -- storm_ask2start(4, 1)	--Storm ¿ªÊ¼ÌôÕ½
        return

    end

end



-- LÊy gi¸ trÞ May M¾n cña ng­êi ch¬i
function tl_getplayerlucky()

    local nLucky = GetLucky(0);

    if (nLucky ~= nil) and (nLucky ~= 0) then
        return nLucky
    else
        return 1
    end

end



-- X©y dùng b¶ng chØ môc träng sè phÇn th­ëng
-- Tham sè truyÒn vµo: myTaskVariable lµ danh s¸ch gi¸ trÞ phÇn th­ëng gèc, myAwardValue lµ tæng gi¸ trÞ vËt phÈm ®· tÝnh to¸n
-- Gi¸ trÞ tr¶ vÒ lµ chØ môc sè dßng cña file b¶ng cña mçi phÇn th­ëng vµ träng sè cña nã
function AssignValue_AwardRate(myAwardVariable, myAwardValue)

    local i, j, k = 0, 0, 0
    local myAwardRate = {{}} -- B¶ng träng sè sau khi chuyÓn ®æi
    local myAwardNum = getn(myAwardVariable)

    for i = 1, myAwardNum do
        myAwardRate[i] = {}
    end

    for i = 1, myAwardNum do

        k = i + 1 -- Dïng k ®Ó gi÷ nguyªn sè dßng cña b¶ng

        myAwardRate[i][2] = myAwardVariable[i][2]

        if (myAwardValue > myAwardVariable[i][2]) then
            myAwardRate[i][2] = myAwardValue
        end

        j = myAwardValue / (myAwardNum * (myAwardRate[i][2]))

        myAwardRate[i] = {k, j}

    end

    return myAwardRate

end

-- CÊu t¹o danh s¸ch l­u tr÷ phÇn th­ëng sè lÇn cè ®Þnh
function AssignValue_LinkAward(myTaskTextID)

    local i, j = 0, 0;
    local myLinkAward = {{0, 0, 0}}; -- Danh s¸ch l­u tr÷: sè lÇn nhiÖm vô, sè dßng b¶ng, träng sè

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



-- Ghi LOG chuçi nhiÖm vô
function TaskLink_WriteLog(nTask, strGoods)

	WriteLog(" [Ghi nhí nhËn phÇn th­ëng]"..date(" [%y n¨m %m th¸ng %d ngµy  %H giê %M phót]")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName().."B¹n hoµn thµnh nhiÖm vô nµy  "..nTask.."  lÇn, nhËn ®­îc phÇn th­ëng"..strGoods);

end

-- Hµm gi¶m mÖt mái hÖ thèng
function TireReduce(myMainValue)
    --	Msg2Player("Gi¸ trÞ gèc: "..myMainValue);
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

    --	Msg2Player("Gi¸ trÞ sau xö lý chèng lçi: "..Value);
    return Value;
end


-- ChÕ ®é ho¹t ®éng x2
-- Tham sè truyÒn vµo: int:nValue L­îng gi¸ trÞ cÇn tÝnh to¸n
function CountDoubleMode(nValue)

    local nDoubleMode = greatnight_huang_event(4);

    if nDoubleMode ~= 0 or nDoubleMode ~= nil then
        return nValue * nDoubleMode;
    else
        return nValue;
    end

end

-- §äc d÷ liÖu b¶ng, mçi lÇn ®Òu thao t¸c thªm, viÕt thµnh mét hµm
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