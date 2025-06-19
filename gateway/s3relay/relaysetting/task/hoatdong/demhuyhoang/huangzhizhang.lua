Include("\\script\\gb_taskfuncs.lua")
GN_EVENTNAME = "Ho�t ��ng Ho�ng chi ch��ng"
GN_HUANG_EVENTID = 1 -- TaskID ch�a ho�t ��ng ���c ch�n �� x2 nh�n th��ng, 1 trong TB_HUANGZHIZHANG_EVENT
GN_HUANG_SWITH = 2 -- TaskID ch�a tr�ng th�i / c� (flag) c�a ho�t ��ng, 0: ch�a di�n ra, 1: �� di�n ra
GN_HUANG_DATE = 3 -- TaskID ch�a ng�y hi�n t�i c�a ho�t ��ng
TB_HUANGZHIZHANG_EVENT = {
		"Chi�n tr��ng T�ng Kim",
		"Nhi�m v� T�n S� ",
		"Th�ch th�c th�i gian",
		"Chu�i nhi�m v� D� T�u"
		--"ͬ�������������ƪ��ͬ����������",
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

	-- Ho�t ��ng s� b�t ��u v�o gi� k� ti�p, ph�t th� 25 sau m�i l�n s3relay kh�i ��ng
	h, m = GetNextTime()
	TaskTime(h, m);

	TaskInterval(30)
	TaskCountLimit(0)

	-- M�i l�n kh�i ��ng l�i s� x�a n�i dung ho�t ��ng
	-- N�u n�i dung ho�t ��ng �� ���c ch�n tr��c �� (Task GN_HUANG_EVENTID ~= 0) th� s� kh�ng x�a
	-- N�u x�a s� ph�i ch�y l�i m�c ch�n n�i dung ho�t ��ng, c� th� random ra ho�t ��ng kh�c kh�ng ��ng v�i th�ng b�o tr��c ��
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID) == 0) then
		gb_SetTask(GN_EVENTNAME, GN_HUANG_DATE, 0)
	end
	
	gb_SetTask(GN_EVENTNAME, GN_HUANG_SWITH, 0)
	OutputMsg("=====> [Khoi dong] Hoang chi chuong - Dem Huy Hoang x2 phan thuong 19:45->21:45 hang ngay")
end

function TaskContent()
	local nDate = tonumber(date("%m%d"))
	local nHour = tonumber(date("%H%M"))
	-- Th�i gian ho�t ��ng t� 21:00~23:00
	-- 00:00 th�ng b�o n�i dung ho�t ��ng t�i nay
		
	local event_date = gb_GetTask(GN_EVENTNAME, GN_HUANG_DATE)
	-- V�o th�i gian ho�t ��ng ��u ti�n m�i ng�y, ng�u nhi�n ch�n ho�t ��ng theo t� l� ��nh tr��c
	-- event_date: ng�y hi�n t�i c�a ho�t ��ng, l�y t� TaskID GN_HUANG_DATE c�a ho�t ��ng GN_EVENTNAME
	-- event_date = 0 ==> s3relay v�a kh�i ��ng l�i
	-- event_date ~= nDate ==> ng�y ho�t ��ng kh�c ng�y hi�n t�i ==> ng�y m�i ==> ng�u nhi�n ch�n l�i ho�t ��ng ==> l�u ho�t ��ng ���c ch�n v�o TaskID GN_HUANG_EVENTID ==> l�u ng�y ho�t ��ng v�o TaskID GN_HUANG_DATE
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
		local szMsg = format("[Ho�t ��ng ��m Huy Ho�ng]: T�i nay, ho�t ��ng <color=yellow>%s<color> g�p ��i nh�n th��ng v� %s, b�t ��u l�c 19h45, c�c v� ��i hi�p nhanh �i tham gia.",
						"Ho�ng Chi Ch��ng",
						TB_HUANGZHIZHANG_EVENT[event_event]);
		GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		return
	end
	
	-- Ngo�i th�i gian ho�t ��ng s� ��ng c�
	if (nHour < 1945 or nHour >= 2145) then
		if (gb_GetTask(GN_EVENTNAME, GN_HUANG_SWITH) ~= 0) then
			gb_SetTask(GN_EVENTNAME, GN_HUANG_EVENTID, 0)
			gb_SetTask(GN_EVENTNAME, GN_HUANG_SWITH, 0)
			local szMsg = format("T�i nay, <color=yellow><color> ho�t ��ng nh�n ��i ph�n th��ng �� k�t th�c, t�i mai s� ti�p t�c.", "Ho�ng Chi Ch��ng");
			GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
			GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		end
		return
	end
	
	-- V�o l�c 19:45 s� b�t c� ho�t ��ng
	if (nHour >= 1945 and nHour <= 2145 + 3) then
		local event_event = gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID)
		gb_SetTask(GN_EVENTNAME, GN_HUANG_SWITH, 1)
		OutputMsg(date().."BAT DAU HOAT DONG DEM HUY HOANG")
		local szMsg = format("[Ho�t ��ng ��m Huy Ho�ng]: Ho�t ��ng <color=yellow>%s<color> �� m�i m�, n�i dung ho�t ��ng v� %s. M�i ng��i h�y nhanh ch�n ��n tham gia.",
							"Ho�ng Chi Ch��ng",
							TB_HUANGZHIZHANG_EVENT[event_event])
		GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
