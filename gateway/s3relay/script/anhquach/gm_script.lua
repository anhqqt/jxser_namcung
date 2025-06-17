-- C¸c hµm GM ®Ó gäi tõ server
-- ViÕt bëi Anh Quach
-- ChØnh söa vµo 25/06/2025

Include("\\script\\mission\\sevencity\\war.lua")

function Gm_Call_Battles(nBattleLevel)
Battle_StartNewRound(1, nBattleLevel)
OutputMsg("=====> [TongKim] Chien Truong Tong Kim duoc mo boi GM BAT DAU <====")
	if nBattleLevel == 1 then 
		zMsg2SubWorld  = "<color=yellow>ChiÕn tr­êng Tèng - Kim<color> <color=0xa9ffe0>S¬ cÊp ®· ®Õn giê b¸o danh, c¸c nh©n sÜ giang hå nhanh ch©n tham gia ®Çu qu©n, Thêi gian b¸o danh lµ 10 phót."
		zAddLocalCountNews = "ChiÕn tr­êng Tèng Kim S¬ cÊp ®· b¾t ®Çu b¸o danh, c¸c nh©n sÜ giang hå mau ®Õn khu vùc b¸o danh ®Ó tham gia chiÕn tr­êng."
		GlobalExecute(format("dw Msg2SubWorld([[%s]])",zMsg2SubWorld))
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)",zAddLocalCountNews))
	elseif nBattleLevel == 2 then 
		zMsg2SubWorld  = "<color=yellow>ChiÕn tr­êng Tèng - Kim<color> <color=0xa9ffe0>Trung cÊp ®· ®Õn giê b¸o danh, c¸c nh©n sÜ giang hå nhanh ch©n tham gia ®Çu qu©n, Thêi gian b¸o danh lµ 10 phót."
		zAddLocalCountNews = "ChiÕn tr­êng Tèng Kim Trung cÊp ®· b¾t ®Çu b¸o danh, c¸c nh©n sÜ giang hå mau ®Õn khu vùc b¸o danh ®Ó tham gia chiÕn tr­êng."
		GlobalExecute(format("dw Msg2SubWorld([[%s]])",zMsg2SubWorld))
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)",zAddLocalCountNews))
	elseif nBattleLevel == 3 then 
		zMsg2SubWorld  = "<color=yellow>ChiÕn tr­êng Tèng - Kim<color> <color=0xa9ffe0>Cao cÊp ®· ®Õn giê b¸o danh, c¸c nh©n sÜ giang hå nhanh ch©n tham gia ®Çu qu©n, Thêi gian b¸o danh lµ 10 phót."
		zAddLocalCountNews = "ChiÕn tr­êng Tèng Kim Cao cÊp ®· b¾t ®Çu b¸o danh, c¸c nh©n sÜ giang hå mau ®Õn khu vùc b¸o danh ®Ó tham gia chiÕn tr­êng."
		GlobalExecute(format("dw Msg2SubWorld([[%s]])",zMsg2SubWorld))
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)",zAddLocalCountNews))
	end
	
end


