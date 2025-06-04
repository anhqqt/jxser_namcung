-- Ho¹t ®éng Hoa §¨ng
-- Mçi tèi tõ 19:00~21:00, cø 15 phót mét lÇn, t¹i Hoa S¬n, Thanh Thµnh S¬n, §iÓm Th­¬ng S¬n, Vâ Di S¬n
-- Bèn ®Þa ®iÓm nµy lÇn l­ît t¹o ra 300 Hoa §¨ng
LANTERN_DATE_START	= 20080611
LANTERN_DATE_END	= 20200713
LANTERN_TIME_START 	= 1900
LANTERN_TIME_END	= 2100

function TaskShedule()
	TaskName("Ho¹t ®éng 'Hoa §¨ng'")
	TaskTime(19, 00)
	TaskInterval(15)
	TaskCountLimit(0)
	OutputMsg("=====> [Khoi dong] Hoat dong Hoa Dang " .. date("%H%M"))
end

function TaskContent()
	local nTime	= tonumber(date("%H%M"))
	local nDate	= tonumber(date("%Y%m%d"))
	
	if (nDate >= LANTERN_DATE_START and nDate <= LANTERN_DATE_END and nTime >= LANTERN_TIME_START and nTime <= LANTERN_TIME_END) then
		if (nTime == LANTERN_TIME_END) then
			GlobalExecute("dw del_all_lantern()")
			return 0
		end
		GlobalExecute("dw Msg2SubWorld([[Ng­¬i nhanh ®i nói Thanh Thµnh, Vò Di s¬n, §iÓm Th­¬ng s¬n, Hoa S¬n,  chØ cÇn tr¶ lêi ®­îc 3 c©u nhËn ®­îc phÇn th­ëng hÊp dÉn]])")
		GlobalExecute("dw create_lanterns()")
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
