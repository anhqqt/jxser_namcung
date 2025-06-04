-- ChiÕn tr­êng Tèng Kim
-- Fanghao_Wu 2004-12-6
function TaskShedule()
    TaskName("CHIEN TRUONG TONG KIM 20:50")
    TaskInterval(1440)
    TaskTime(20, 50)
    TaskCountLimit(0)
    OutputMsg("=====> [Khoi dong] Chien Truong Tong Kim 20:50")
end

function TaskContent()
    -- Thø Hai: Thay thÕ b»ng Quèc ChiÕn Tèng Kim
    local nWeekday = tonumber(date("%w"))
    if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
        OutputMsg("=====> [TongKim] Chien Truong Tong Kim 20:50 KHONG BAT DAU <====")
        return
    else
        Battle_StartNewRound(1, 1) -- S¬ cÊp
        Battle_StartNewRound(1, 2) -- Trung cÊp
        Battle_StartNewRound(1, 3) -- Cao cÊp
        OutputMsg("=====> [TongKim] Chien Truong Tong Kim 20:50 BAT DAU <====")
    end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
