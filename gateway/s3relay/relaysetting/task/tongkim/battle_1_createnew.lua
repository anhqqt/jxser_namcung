-- ChiÕn tr­êng Tèng Kim
-- Fanghao_Wu 2004-12-6
Include("\\RelaySetting\\battle\\script\\rf_header.lua")

function TaskShedule()
    TaskName("Tæng chØ huy ChiÕn dÞch Tèng Kim")
    TaskSetMode(1)

    -- Mçi tuÇn (Thø Hai) b¾t ®Çu mét vßng míi
    TaskSetStartDay(1, 3)

    -- Mét tuÇn mét chu kú
    TaskInterval(7)
    TaskTime(2, 0)
    TaskCountLimit(0)

    OutputMsg("=====> [Khoi dong] Tong dieu dong Chien Truong Tong Kim")
end

function TaskContent()
    OutputMsg("****************TONG DIEU DONG CHIEN TRUONG TONG KIM****************")
    battle_StartNewIssue(1, 1)
    battle_StartNewIssue(1, 2)
    battle_StartNewIssue(1, 3)
    OutputMsg("*******************NHIEM VU KHOI DONG THANH CONG********************")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
