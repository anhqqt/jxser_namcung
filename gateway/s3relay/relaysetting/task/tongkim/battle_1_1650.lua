-- Chi�n tr��ng T�ng Kim
-- Fanghao_Wu 2004-12-6
function TaskShedule()
    TaskName("CHIEN TRUONG TONG KIM 16:50")
    TaskInterval(1440)
    TaskTime(16, 50)
    TaskCountLimit(0)
    OutputMsg("=====> [Khoi dong] Chien Truong Tong Kim 16:50")
end

function TaskContent()
    Battle_StartNewRound(1, 1) -- S� c�p
    Battle_StartNewRound(1, 2) -- Trung c�p

    local nWeekday = tonumber(date("%w"))

    if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
        return -- Th� Hai: ��ng m�t tr�n T�ng Kim Cao C�p, thay th� b�ng Qu�c chi�n T�ng Kim
    else
        Battle_StartNewRound(1, 3) -- Cao c�p
    end
    OutputMsg("=====> [TongKim] Chien Truong Tong Kim 16:50 BAT DAU <====")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
