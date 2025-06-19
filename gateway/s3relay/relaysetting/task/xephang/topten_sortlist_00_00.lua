-- HÖ thèng tiÕp nhËn ®¨ng ký vµ xÕp h¹ng 10 ng­êi level cao nhÊt server  - Created by DinhHQ - 20110614
local nStartDate = 20110707;
local nCloseDate = 20120713;
function TaskShedule()
    TaskName("TOP 10 SERVER - XEP HANG 0H")
    TaskInterval(24 * 60)
    TaskTime(00, 0)
    TaskCountLimit(0)
    OutputMsg("=====> [Khoi dong] Top 10 Level cao nhat - 00:00 moi ngay")
end

function TaskContent()
    -- local nDate = tonumber(date("%Y%m%d"))
    -- if nDate < %nStartDate or nDate > %nCloseDate then
    -- 	return 
    -- end
    RemoteExecute("\\script\\vng_feature\\top10\\vngtop10.lua", "tbTop10:UpdateTopList", 0)
    OutputMsg("=====> Cap nhat Top 10 Level thanh cong <====")
end
