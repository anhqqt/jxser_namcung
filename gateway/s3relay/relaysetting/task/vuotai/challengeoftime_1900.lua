function TaskShedule()
	TaskName("Thi ®Êu 'Th¸ch thøc thêi gian'");	
	TaskInterval(1440);
	TaskTime(19, 0);
	TaskCountLimit(0);
	OutputMsg("=====> [Khoi dong] Vuot Ai Khieu Chien Thoi Gian - 19:00");
	TaskCountLimit(0);
end

function TaskContent()
	OutputMsg("=====> Vuot Ai Khieu Chien Thoi Gian 19:00 BAT DAU <====");
	-- KÝch ho¹t script trªn GameServer
	GlobalExecute("dwf \\settings\\trigger_challengeoftime.lua OnTrigger()");
	szMsg = "'Th¸ch thøc thêi gian' §· ®Õn giê b¸o danh. §éi tr­ëng nhanh ch©n ®Õn NhiÕp ThÝ TrÇn ®Ó ghi danh. Thêi gian ghi danh lµ 10 phót."
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
