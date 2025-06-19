if not GREATNIGHT_HUANGZHIZHANG  then
GREATNIGHT_HUANGZHIZHANG = 1

Include("\\script\\lib\\gb_taskfuncs.lua")
GN_EVENTNAME = "Ho�t ��ng Ho�ng chi ch��ng"
TB_HUANGZHIZHANG_EVENT = {
		"Chi�n tr��ng T�ng Kim",
		"Nhi�m v� T�n S� ",
		"Th�ch th�c th�i gian",
		"Chu�i nhi�m v� D� T�u",
		--"ͬ�������������ƪ��ͬ����������",
	}
GN_HUANG_EVENTID = 1
GN_HUANG_SWITH = 2
GN_HUANG_DATE = 3

-- H�m s� ���c g�i � c�c n�i kh�c nh� D� T�u, T�ng Kim, v.v...
-- M�c ��ch �� ki�m tra h� s� nh�n th��ng tr��c khi nh�n
-- N�u trong th�i gian di�n ra "Ho�ng chi ch��ng" th� s� nh�n x2 ph�n th��ng, ngo�i th�i gian s� nh�n x1 ph�n th��ng
-- N�i dung: Ki�m tra Ho�ng Chi Ch��ng c�a event c� �ang k�ch ho�t hay Kh�ng
---- event: 1 l� T�ng Kim
---- event: 2 l� Nhi�m v� T�n S�
---- event: 3 l� Th�ch th�c th�i gian
---- event: 4 l� Chu�i nhi�m v� D� T�u
-- V� d�: greatnight_huang_event(1) ���c g�i t� T�ng Kim => N�u Ho�ng Chi Ch��ng �ang di�n ra cho TK => tr� v� `award_times` => N�u ko ph�i tr� v� 1
function greatnight_huang_event(event)
	-- Ho�t ��ng v�n ch�a b�t ��u
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID) == 0) then
		return 1
	end
	local award_times = gn_getaward_times()	--����������������
	-- L� Quan tra c�u ho�t ��ng bu�i t�i
	if (event == nil) then
		-- Kh�ng ph�i 1 bi�u th� tr� v� 3 tham s�: 0, ID ho�t ��ng, s� l�n nh�n ��i ph�n th��ng
		return 0, gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID), award_times
	end
--	-- V�n ch�a ph�i th�i gian ho�t ��ng
--	if (tonumber(GetLocalDate("%H%M")) < 2055 or tonumber(GetLocalDate("%H%M")) > 2255) then
--		return 1
--	end
	-- Ho�t ��ng v�n ch�a b�t ��u
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_SWITH) == 0) then
		return 1
	end
	
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID) == event) then
		return award_times
	end
	
	return 1
end

-- H� s� ph�n th��ng khi trong th�i gian di�n ra "Ho�ng chi ch��ng"
-- M�c ��nh l� x2, c� th� ch�nh s�a th�m nh� T6 ho�c cu�i tu�n th� x3
function gn_getaward_times()
--	local nWeek = tonumber(GetLocalDate("%w"))
--	if (nWeek == 6 or nWeek == 0) then
--		return 3	--��ĩ3��
--	else
		return 2	--ƽʱ2��
--	end
end

function huang_event_hint()
	local swith, eventid, awardtimes = greatnight_huang_event()
	if (swith == 1) then
		return format("%s%s%s%s%s",
				"Ho�t ��ng Ho�ng chi ch��ng di�n ra v�o <color=yellow>21h00 ��n 23h00<color> m�i t�i. Trong kho�ng th�i gian n�y, ��i hi�p s� ���c nh�n ��i ph�n th��ng khi tham gia m�t ho�t ��ng y�u c�u. <enter>Ho�t ��ng y�u c�u ng�y h�m nay l�: <enter>",
				"T�ng Kim ��i chi�n <enter>",
				"Th�ch th�c th�i gian <enter>",
				"Chu�i nhi�m v� D� T�u <enter>",
				"M�i<color=yellow>8 gi� t�i <color>, ng��i ch�i c� th� ��n L� quan �� t�m hi�u chi ti�t ho�t ��ng.��ng b� l� c� h�i nh�n qu� c�a ��c C� Minh Ch�.")
		
	else
		return format("Th�i gian ho�t ��ng 'Ho�ng chi ch��ng' l� <color=yellow>21h00 ��n 23h00<color> h�ng ��m. Ho�t ��ng ��m nay l�:  <enter><color=yellow>%s<color><enter><enter>C�c v� ��i hi�p h�y nhanh ch�n b�o danh tham gia.",
					TB_HUANGZHIZHANG_EVENT[eventid])
	end
end

function huang_event_name()
	local swith, eventid, awardtimes = greatnight_huang_event()
	if (swith == 1) then
		return "Ch�a bi�t"
	else
		return TB_HUANGZHIZHANG_EVENT[eventid]
	end
end

function huang_event_msg()
	local name = huang_event_name()
	return format("Ho�t ��ng Ho�ng chi ch��ng s� di�n ra l�c 21h00 ��m nay, ho�t ��ng nh�n ��i ph�n th��ng li�n quan l�: <color=yellow>%s<color>",name)
end

function seed_birth_city()
	local MapStr = "��ng m�n D��ng Ch�u";
	if (1 == gb_GetTask("h�t Huy Ho�ng", 1)) then
		MapStr = "B�c m�n ��i L� ";
	end;
	return format("12h00 tr�a nay s� b�t ��u ho�t ��ng Huy chi ch��ng, qu� Ho�ng Kim s� xu�t hi�n t�i <color=yellow>%s<color>",MapStr)
end

if EVENTS_TB then 
EVENTS_TB[getn(EVENTS_TB)+1] = {	--��֮��
			name = "Huy Ho�ng",
			describe = seed_birth_city
		}
EVENTS_TB[getn(EVENTS_TB)+1] = {	--��֮��
			name = "Ho�ng chi ch��ng",
			describe = huang_event_msg
		}
end
end