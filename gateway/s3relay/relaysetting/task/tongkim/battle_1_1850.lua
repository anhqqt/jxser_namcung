-- Chi�n tr��ng T�ng Kim
-- Fanghao_Wu 2004-12-6
function TaskShedule()
    TaskName("CHIEN TRUONG TONG KIM 18:50")
    TaskInterval(1440)
    TaskTime(18, 50)
    TaskCountLimit(0)
    OutputMsg("=====> [Khoi dong] Chien Truong Tong Kim 18:50")
end

function TaskContent()
    Battle_StartNewRound(1, 1) -- S� c�p
    Battle_StartNewRound(1, 2) -- Trung c�p
    Battle_StartNewRound(1, 3) -- Cao c�p
    OutputMsg("=====> [TongKim] Chien Truong Tong Kim 18:50 BAT DAU <====")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
