function TaskShedule()
	TaskName("Thi ��u 'Th�ch th�c th�i gian'");	
	TaskInterval(1440);
	TaskTime(19, 0);
	TaskCountLimit(0);
	OutputMsg("=====> [Khoi dong] Vuot Ai Khieu Chien Thoi Gian - 19:00");
	TaskCountLimit(0);
end

function TaskContent()
	OutputMsg("=====> Vuot Ai Khieu Chien Thoi Gian 19:00 BAT DAU <====");
	-- K�ch ho�t script tr�n GameServer
	GlobalExecute("dwf \\settings\\trigger_challengeoftime.lua OnTrigger()");
	szMsg = "'Th�ch th�c th�i gian' �� ��n gi� b�o danh. ��i tr��ng nhanh ch�n ��n Nhi�p Th� Tr�n �� ghi danh. Th�i gian ghi danh l� 10 ph�t."
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
