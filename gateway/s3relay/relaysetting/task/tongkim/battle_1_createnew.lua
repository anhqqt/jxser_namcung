-- Chi�n tr��ng T�ng Kim
-- Fanghao_Wu 2004-12-6
Include("\\RelaySetting\\battle\\script\\rf_header.lua")

function TaskShedule()
    TaskName("T�ng ch� huy Chi�n d�ch T�ng Kim")
    TaskSetMode(1)

    -- M�i tu�n (Th� Hai) b�t ��u m�t v�ng m�i
    TaskSetStartDay(1, 3)

    -- M�t tu�n m�t chu k�
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
