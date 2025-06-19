-- Thªm biÕn global
Include("\\script\\global\\anhquach\\env.lua")

function CheckAccountGM()
	dofile("script/global/namcung/gmquanlyserver/ds_gm.lua");	
	local szAccount = GetAccount() 
	local szName = GetName() 
	local tbRoleList = GM_DANH_SACH[szAccount] 
	if tbRoleList then 
		for i=1, getn(tbRoleList) do 
			if tbRoleList[i] == szName then 
				return 1
			end 
		end 
	end 
end

function CheckAccountMod()
	dofile("script/global/namcung/gmquanlyserver/ds_gm.lua");	
	local szAccount = GetAccount() 
	local szName = GetName() 
	local tbRoleList = MOD_DANH_SACH[szAccount] 
	if tbRoleList then 
		for i=1, getn(tbRoleList) do 
			if tbRoleList[i] == szName then 
				return 1
			end 
		end 
	end 
end