-- Quèc ChiÕn Tèng Kim
-- DongZhi
Include("\\RelaySetting\\battle\\script\\rf_header.lua")

function TaskShedule()

    TaskName("QUOC CHIEN TONG KIM TONG DIEU DONG")
    TaskTime(20, 00)
    TaskInterval(1440)
    TaskCountLimit(0)
    OutputMsg("=====> [Khoi dong] Tong dieu dong Quoc Chien Tong Kim")
end

function TaskContent()
    local nWeekday = tonumber(date("%w"))

    if nWeekday == 1 then
        OutputMsg("****************TONG DIEU DONG QUOC CHIEN TONG KIM****************")
        battle_StartNewIssue(2, 3)
        OutputMsg("******************NHIEM VU KHOI DONG THANH CONG*******************")
    end

end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
