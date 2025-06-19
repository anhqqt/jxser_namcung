-- Quèc chiÕn Tèng Kim
-- Dongzhi
function TaskShedule()
    TaskName("ChiÕn dÞch quèc chiÕn Tèng Kim 21:00")
    TaskInterval(1440)
    TaskTime(20, 50)
    TaskCountLimit(0)
    OutputMsg("=====> [Khoi dong] Quoc Chien Tong Kim 20:50")
end

function TaskContent()
    local nWeekday = tonumber(date("%w"))

    if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then

        if CW_GetOccupant(4) == CW_GetOccupant(7) then
            local szMsg = format("ChiÕu c¸o thiªn h¹ \"%s\" ®ång thêi chiÕm ®­îc L©m An cïng BiÖn Kinh, bang chñ cã thÓ trùc tiÕp lªn ng«i thiªn tö", CW_GetOccupant(4))
            local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg)
            GlobalExecute(szNews)

            for i = 0, 10 do
                NW_SetTask(i, 0)
            end
            NW_Abdicate() -- Thiªn tö tho¸i vÞ
            NW_SetTask(0, 1) -- Tø Doanh
            return
        end

        local szMsg = format("TiÒn tuyÕn mËt b¸o, N­íc Tèng \"%s\" ½ð¹ú \"%s\"thiªn tö ®o¹t ng«i ®· më, xin mêi c¸c vÞ t­íng sÜ ®Õn tèng kim ®Ó ghi danh tham chiÕn!", CW_GetOccupant(7), CW_GetOccupant(4))
        local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg)
        GlobalExecute(szNews)
        Battle_StartNewRound(2, 3) -- LÖnh GM, khëi ®éng Quèc chiÕn Tø Ph­¬ng
        OutputMsg("=====> [TongKim] Quoc Chien Tong Kim 20:50 BAT DAU <====")
    end

end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
