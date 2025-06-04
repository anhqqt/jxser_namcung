-- C�c h�m GM �� g�i t� server
-- Vi�t b�i Anh Quach
-- Ch�nh s�a v�o 25/06/2025

Include("\\script\\mission\\sevencity\\war.lua")

function Gm_Call_Battles(nBattleLevel)
Battle_StartNewRound(1, nBattleLevel)
OutputMsg("=====> [TongKim] Chien Truong Tong Kim duoc mo boi GM BAT DAU <====")
	if nBattleLevel == 1 then 
		zMsg2SubWorld  = "<color=yellow>Chi�n tr��ng T�ng - Kim<color> <color=0xa9ffe0>S� c�p �� ��n gi� b�o danh, c�c nh�n s� giang h� nhanh ch�n tham gia ��u qu�n, Th�i gian b�o danh l� 10 ph�t."
		zAddLocalCountNews = "Chi�n tr��ng T�ng Kim S� c�p �� b�t ��u b�o danh, c�c nh�n s� giang h� mau ��n khu v�c b�o danh �� tham gia chi�n tr��ng."
		GlobalExecute(format("dw Msg2SubWorld([[%s]])",zMsg2SubWorld))
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)",zAddLocalCountNews))
	elseif nBattleLevel == 2 then 
		zMsg2SubWorld  = "<color=yellow>Chi�n tr��ng T�ng - Kim<color> <color=0xa9ffe0>Trung c�p �� ��n gi� b�o danh, c�c nh�n s� giang h� nhanh ch�n tham gia ��u qu�n, Th�i gian b�o danh l� 10 ph�t."
		zAddLocalCountNews = "Chi�n tr��ng T�ng Kim Trung c�p �� b�t ��u b�o danh, c�c nh�n s� giang h� mau ��n khu v�c b�o danh �� tham gia chi�n tr��ng."
		GlobalExecute(format("dw Msg2SubWorld([[%s]])",zMsg2SubWorld))
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)",zAddLocalCountNews))
	elseif nBattleLevel == 3 then 
		zMsg2SubWorld  = "<color=yellow>Chi�n tr��ng T�ng - Kim<color> <color=0xa9ffe0>Cao c�p �� ��n gi� b�o danh, c�c nh�n s� giang h� nhanh ch�n tham gia ��u qu�n, Th�i gian b�o danh l� 10 ph�t."
		zAddLocalCountNews = "Chi�n tr��ng T�ng Kim Cao c�p �� b�t ��u b�o danh, c�c nh�n s� giang h� mau ��n khu v�c b�o danh �� tham gia chi�n tr��ng."
		GlobalExecute(format("dw Msg2SubWorld([[%s]])",zMsg2SubWorld))
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)",zAddLocalCountNews))
	end
	
end


