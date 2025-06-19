
-- B¶ng xÕp h¹ng hµng ngµy ho¹t ®éng V­ît ¶i
function TaskShedule()
	TaskName("ho¹t ®éng xÕp h¹ng <Th¸ch thøc thêi gian> mçi ngµy")
	TaskTime(0, 0);
	TaskInterval(1440)
	TaskCountLimit(0)
	OutputMsg("=====> [Khoi dong] Bang Xep Hang <Vuot Ai - Thach Thuc Thoi Gian> - 00:00 moi ngay");
end

function TaskContent()
	name , value = Ladder_GetLadderInfo(10235, 1);
	value = value * (-1);
	if (name ~= "") then
		local szTime	= format("%s phót %s gi©y", floor(value/60), floor(mod(value, 60)));
		local szMsg 	= format("Chóc mõng <%s> ®· hoµn thµnh <Th¸ch thøc thêi gian> thêi gian v­ît ¶i nhanh nhÊt lµ <%s>", name, szTime);
		GlobalExecute(format("dw AddGlobalNews([[%s]], 10)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
	end
	Ladder_ClearLadder(10235);
	OutputMsg("=====> Cap nhat Bang Xep hang <Vuot ai - Thach Thuc Thoi Gian> THANH CONG <====");
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


