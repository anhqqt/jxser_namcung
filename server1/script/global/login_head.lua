TB_LOGIN_FUN = {}	-- Dïng m¶ng nµy ®Ó ghi l¹i tÊt c¶ c¸c hµm Login cÇn t¶i

-- Thªm mét hµm cÇn t¶i khi Login (hoÆc ®ång bé hãa dÇn dÇn)
-- TruyÒn vµo tham sè:
--   fun     function cÇn thªm
--   n_time  Khi nµo thùc thi: 0 - lóc Login; 1 - lÇn ®ång bé hãa dÇn dÇn ®Çu tiªn; 2 - lÇn ®ång bé hãa dÇn dÇn thø hai; ...
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
	{"\\script\\missions\\sevencity\\loginout.lua", "login"},				-- ThÊt Thµnh §¹i ChiÕn
	{"\\script\\global\\jingli.lua", 				"WorldEntranceLogin"},	-- HÖ thèng Tinh Lùc
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
