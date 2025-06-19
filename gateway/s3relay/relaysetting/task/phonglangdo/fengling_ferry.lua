function TaskShedule()
	TaskName("PHONG LANG DO")

	local nStartHour = tonumber(date("%H")) + 1
	if (nStartHour >= 24) then
		nStartHour = 0
	end
	
	TaskTime(nStartHour, 0)
	TaskInterval(60)
	TaskCountLimit(0)
	OutputMsg("=====> [Khoi dong] Phong Lang Do - Moi gio")
end

function TaskContent()
	nCurrentHour = tonumber(date("%H"))

	if (nCurrentHour >= 0 and nCurrentHour < 6) then
		return -- Khong cho phep bat dau Phong Lang Do tu 0h den 6h sang
		OutputMsg("=====> Phong Lang Do " .. nCurrentHour .. ":00 NGOAI GIO QUY DINH <====")
	else
		GlobalExecute("dwf \\script\\missions\\fengling_ferry\\fldmap_boat1.lua fenglingdu_main()")
		OutputMsg("=====> Phong Lang Do " .. nCurrentHour .. ":00 BAT DAU <====")
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
