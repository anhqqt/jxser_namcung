-- HÖ thèng xÕp h¹ng
-- Fanghao_Wu 2004-12-6
function GameSvrConnected(dwGameSvrIP)
    SyncAllLadder(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
    TaskName("XOA BANG XEP HANG")
    TaskInterval(2440)
    TaskCountLimit(0)
    OutputMsg("=====> [Khoi dong] Bang xep hang")
    for i = 10001, 10300 do
        LoadLadder(i)
    end

end

function TaskContent()
    OutputMsg("===> Xep hang khoi dong thanh cong <===")
end
