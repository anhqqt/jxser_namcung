-- Bé hÑn giê thi ®Êu thö th¸ch thêi gian

INTERVAL_TIME = 60	-- KÝch ho¹t mçi giê

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
	TaskName("Thi ®Êu 'Th¸ch thøc thêi gian'");	
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
		-- KÝch ho¹t script trªn GameServer
		GlobalExecute("dwf \\settings\\trigger_challengeoftime.lua OnTrigger()");
		szMsg = "'Th¸ch thøc thêi gian' §· ®Õn giê b¸o danh. §éi tr­ëng nhanh ch©n ®Õn NhiÕp ThÝ TrÇn ®Ó ghi danh. Thêi gian ghi danh lµ 10 phót."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
