-- B� h�n gi� thi ��u th� th�ch th�i gian

INTERVAL_TIME = 60	-- K�ch ho�t m�i gi�

function GetNextTime()
    local hour = tonumber(date("%H"));
    if (hour == 23) then
    	hour = 0;
    else
    	hour = hour + 1;
    end
    return hour, 0;
end

function TaskShedule()
	TaskName("Thi ��u 'Th�ch th�c th�i gian'");	
	TaskInterval(INTERVAL_TIME);
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg("=====> [Khoi dong] Vuot Ai - Thach Thuc Thoi Gian - Moi gio 1 lan");
	TaskCountLimit(0);
end

function TaskContent()
	nCurrentHour = tonumber(date("%H"))

	if (nCurrentHour >= 0 and nCurrentHour < 6) then
		return -- Khong cho phep bat dau Phong Lang Do tu 0h den 6h sang
		OutputMsg("=====> Vuot Ai - Thach Thuc Thoi Gian " .. nCurrentHour .. ":00 NGOAI GIO QUY DINH <====")
	else
		OutputMsg("=====> Vuot Ai - Thach Thuc Thoi Gian " .. nCurrentHour .. ":00 BAT DAU <====");
		-- K�ch ho�t script tr�n GameServer
		GlobalExecute("dwf \\settings\\trigger_challengeoftime.lua OnTrigger()");
		szMsg = "'Th�ch th�c th�i gian' �� ��n gi� b�o danh. ��i tr��ng nhanh ch�n ��n Nhi�p Th� Tr�n �� ghi danh. Th�i gian ghi danh l� 10 ph�t."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
