Include("\\script\\gb_taskfuncs.lua")
GN_EVENTNAME = "Ho¹t ®éng Hoµng chi ch­¬ng"
GN_HUANG_EVENTID = 1 -- TaskID chøa ho¹t ®éng ®­îc chän ®Ó x2 nhËn th­ëng, 1 trong TB_HUANGZHIZHANG_EVENT
GN_HUANG_SWITH = 2 -- TaskID chøa tr¹ng th¸i / cê (flag) cña ho¹t ®éng, 0: ch­a diÔn ra, 1: ®· diÔn ra
GN_HUANG_DATE = 3 -- TaskID chøa ngµy hiÖn t¹i cña ho¹t ®éng
TB_HUANGZHIZHANG_EVENT = {
		"ChiÕn tr­êng Tèng Kim",
		"NhiÖm vô TÝn Sø ",
		"Th¸ch thøc thêi gian",
		"Chuçi nhiÖm vô D· TÈu"
		--"Í¬°é¾çÇéÈÎÎñÐÞÁ¶Æª¡¢Í¬°éÐÞÁ¶ÈÎÎñ",
	}
	
TB_HUANGZHIZHANG_RATE = {
		50,
		0,
		25,
		25,
}

function GetNextTime()
    local hour = tonumber(date("%H"));
    if (hour == 23) then
    	hour = 0;
    else
    	hour = hour + 1;
    end
    return hour, 25;
end
function TaskShedule()
	TaskName(GN_EVENTNAME)

	-- Ho¹t ®éng sÏ b¾t ®Çu vµo giê kÕ tiÕp, phót thø 25 sau mçi lÇn s3relay khëi ®éng
	h, m = GetNextTime()
	TaskTime(h, m);

	TaskInterval(30)
	TaskCountLimit(0)

	-- Mçi lÇn khëi ®éng l¹i sÏ xãa néi dung ho¹t ®éng
	-- NÕu néi dung ho¹t ®éng ®· ®­îc chän tr­íc ®ã (Task GN_HUANG_EVENTID ~= 0) th× sÏ kh«ng xãa
	-- NÕu xãa sÏ ph¶i ch¹y l¹i môc chän néi dung ho¹t ®éng, cã thÓ random ra ho¹t ®éng kh¸c kh«ng ®óng víi th«ng b¸o tr­íc ®ã
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID) == 0) then
		gb_SetTask(GN_EVENTNAME, GN_HUANG_DATE, 0)
	end
	
	gb_SetTask(GN_EVENTNAME, GN_HUANG_SWITH, 0)
	OutputMsg("=====> [Khoi dong] Hoang chi chuong - Dem Huy Hoang x2 phan thuong 19:45->21:45 hang ngay")
end

function TaskContent()
	local nDate = tonumber(date("%m%d"))
	local nHour = tonumber(date("%H%M"))
	-- Thêi gian ho¹t ®éng tõ 21:00~23:00
	-- 00:00 th«ng b¸o néi dung ho¹t ®éng tèi nay
		
	local event_date = gb_GetTask(GN_EVENTNAME, GN_HUANG_DATE)
	-- Vµo thêi gian ho¹t ®éng ®Çu tiªn mçi ngµy, ngÉu nhiªn chän ho¹t ®éng theo tû lÖ ®Þnh tr­íc
	-- event_date: ngµy hiÖn t¹i cña ho¹t ®éng, lÊy tõ TaskID GN_HUANG_DATE cña ho¹t ®éng GN_EVENTNAME
	-- event_date = 0 ==> s3relay võa khëi ®éng l¹i
	-- event_date ~= nDate ==> ngµy ho¹t ®éng kh¸c ngµy hiÖn t¹i ==> ngµy míi ==> ngÉu nhiªn chän l¹i ho¹t ®éng ==> l­u ho¹t ®éng ®­îc chän vµo TaskID GN_HUANG_EVENTID ==> l­u ngµy ho¹t ®éng vµo TaskID GN_HUANG_DATE
	if (event_date == 0 or event_date ~= nDate) then
		local nrand = random(1, 100);
		local nsum = 0;
		local event_event = 1;
		for i = 1, getn(TB_HUANGZHIZHANG_RATE) do
			nsum = nsum + TB_HUANGZHIZHANG_RATE[i];
			if (nsum >= nrand) then
				event_event = i;
				break
			end;
		end;
		gb_SetTask(GN_EVENTNAME, GN_HUANG_EVENTID, event_event)
		gb_SetTask(GN_EVENTNAME, GN_HUANG_DATE, nDate)
		OutputMsg(date().."=====> Hoang chi chuong - Dem Huy Hoang - Hoat dong hom nay la "..TB_HUANGZHIZHANG_EVENT[event_event].." <====")
		local szMsg = format("[Ho¹t ®éng §ªm Huy Hoµng]: Tèi nay, ho¹t ®éng <color=yellow>%s<color> gÊp ®«i nhËn th­ëng v× %s, b¾t ®Çu lóc 19h45, c¸c vÞ ®¹i hiÖp nhanh ®i tham gia.",
						"Hoµng Chi Ch­¬ng",
						TB_HUANGZHIZHANG_EVENT[event_event]);
		GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		return
	end
	
	-- Ngoµi thêi gian ho¹t ®éng sÏ ®ãng cê
	if (nHour < 1945 or nHour >= 2145) then
		if (gb_GetTask(GN_EVENTNAME, GN_HUANG_SWITH) ~= 0) then
			gb_SetTask(GN_EVENTNAME, GN_HUANG_EVENTID, 0)
			gb_SetTask(GN_EVENTNAME, GN_HUANG_SWITH, 0)
			local szMsg = format("Tèi nay, <color=yellow><color> ho¹t ®éng nh©n ®«i phÇn th­ëng ®· kÕt thóc, tèi mai sÏ tiÕp tôc.", "Hoµng Chi Ch­¬ng");
			GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
			GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		end
		return
	end
	
	-- Vµo lóc 19:45 sÏ bËt cê ho¹t ®éng
	if (nHour >= 1945 and nHour <= 2145 + 3) then
		local event_event = gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID)
		gb_SetTask(GN_EVENTNAME, GN_HUANG_SWITH, 1)
		OutputMsg(date().."BAT DAU HOAT DONG DEM HUY HOANG")
		local szMsg = format("[Ho¹t ®éng §ªm Huy Hoµng]: Ho¹t ®éng <color=yellow>%s<color> ®· míi më, néi dung ho¹t ®éng v× %s. Mäi ng­êi h·y nhanh ch©n ®Õn tham gia.",
							"Hoµng Chi Ch­¬ng",
							TB_HUANGZHIZHANG_EVENT[event_event])
		GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
