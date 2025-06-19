-- ChiÕn tr­êng Tèng Kim
-- Fanghao_Wu 2004-12-6
function TaskShedule()
    TaskName("CHIEN TRUONG TONG KIM 22:50")
    TaskInterval(1440)
    TaskTime(22, 50)
    TaskCountLimit(0)
    OutputMsg("=====> [Khoi dong] Chien Truong Tong Kim 22:50")
end

function TaskContent()
    Battle_StartNewRound(1, 1) -- S¬ cÊp
    Battle_StartNewRound(1, 2) -- Trung cÊp
    Battle_StartNewRound(1, 3) -- Cao cÊp
    OutputMsg("=====> [TongKim] Chien Truong Tong Kim 22:50 BAT DAU <====")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
