TB_LOGIN_FUN = {}	-- D�ng m�ng n�y �� ghi l�i t�t c� c�c h�m Login c�n t�i

-- Th�m m�t h�m c�n t�i khi Login (ho�c ��ng b� h�a d�n d�n)
-- Truy�n v�o tham s�:
--   fun     function c�n th�m
--   n_time  Khi n�o th�c thi: 0 - l�c Login; 1 - l�n ��ng b� h�a d�n d�n ��u ti�n; 2 - l�n ��ng b� h�a d�n d�n th� hai; ...
function login_add(fun, n_time)
	if (not fun) then
		return
	end
	if (not n_time) then
		n_time = 0
	end
	local tb = TB_LOGIN_FUN[n_time]
	if (not tb) then
		TB_LOGIN_FUN[n_time] = {fun}
	else
		local count = getn(tb)
		for i = 1, count do
			if (tb[i] == fun) then
				return
			end
		end
		tb[count + 1] = fun
	end
end

TB_LOGIN_FILEFUN = {
	{"\\script\\missions\\sevencity\\loginout.lua", "login"},				-- Th�t Th�nh ��i Chi�n
	{"\\script\\global\\jingli.lua", 				"WorldEntranceLogin"},	-- H� th�ng Tinh L�c
}



function IsLoginFileFunction(script, func)
	for i = 1, getn(TB_LOGIN_FILEFUN) do
		local tb = TB_LOGIN_FILEFUN[i]
		if (tb[1] == script and tb[2] == func) then
			return 1
		end
	end
	return 0
end

function AddLoginFileFunction(script, func)
	local tb = {}
	tinsert(tb, script)
	tinsert(tb, func)
	tinsert(TB_LOGIN_FILEFUN, tb)
end
