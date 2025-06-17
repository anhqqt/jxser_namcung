-- ChiÕn tr­êng Tèng Kim
-- Fanghao_Wu 2004-12-6
function TaskShedule()
    TaskName("CHIEN TRUONG TONG KIM 16:50")
    TaskInterval(1440)
    TaskTime(16, 50)
    TaskCountLimit(0)
    OutputMsg("=====> [Khoi dong] Chien Truong Tong Kim 16:50")
end

function TaskContent()
    Battle_StartNewRound(1, 1) -- S¬ cÊp
    Battle_StartNewRound(1, 2) -- Trung cÊp

    local nWeekday = tonumber(date("%w"))

    if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
        return -- Thø Hai: §ãng mét trËn Tèng Kim Cao CÊp, thay thÕ b»ng Quèc chiÕn Tèng Kim
    else
        Battle_StartNewRound(1, 3) -- Cao cÊp
    end
    OutputMsg("=====> [TongKim] Chien Truong Tong Kim 16:50 BAT DAU <====")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
