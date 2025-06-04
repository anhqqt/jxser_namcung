function TaskShedule()
	TaskName("PHONG LANG DO 18:00")
	TaskTime(18, 0)
	TaskInterval(1440)
	TaskCountLimit(0)
	OutputMsg("=====> [Khoi dong] Phong Lang Do - 18:00")
end

function TaskContent()
    GlobalExecute("dwf \\script\\missions\\fengling_ferry\\fldmap_boat1.lua fenglingdu_main()")
	OutputMsg("=====> Phong Lang Do 18:00 BAT DAU <====")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end