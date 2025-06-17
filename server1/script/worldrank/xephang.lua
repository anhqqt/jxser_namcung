IncludeLib("RELAYLADDER");
IncludeLib("TONG")
IncludeLib("FILESYS");
Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\lib\\pfunction.lua")
Include("\\script\\lib\\composeex.lua")
--Transaction log - Modified by DinhHQ - 20110816
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\objbuffer_head.lua")
function XepHang()
	dofile("script/worldrank/xephang.lua")
	XepHang_Top10ALL()
	XepHang_TopMPPhuho()
	XepHang_Top10MP()
	XepHang_TopPhuho()
	-- XepHang_CaNhan()
	-- XepHang_BinhGiap()
	--rankList()
	--XoaXepHang()
end
--=============Luu log nhan vat=================================
function LuuLogNhanVat()
	local saveplay=format("dulieu/Level- Acc: %s - Name: %s.txt",GetAccount(),GetName())
	logplayer(saveplay,format("Nh©n vËt : [%s] - CÊp ®é: [%s] - Thêi gian cËp nhËt : [%s] ",GetName(),GetLevel(),GetLocalDate("%m/%d/%Y_%H:%M:%S")))
end
function LuuLogNhanVatPH()
	nMoney = GetBoxMoney()+ GetCash()
	local saveplay=format("dulieu/Money- Acc: %s - Name: %s.txt",GetAccount(),GetName())
	logplayer(saveplay,format("Nh©n vËt : [%s] - Sè tiÒn: [%s] - Thêi gian cËp nhËt : [%s] ",GetName(),sMoney,GetLocalDate("%m/%d/%Y_%H:%M:%S")))
end
function logplayer(zFile,szMsg)
  local handle = openfile(zFile,"a")
  write(handle,format("%s\n",szMsg));
  closefile(handle);
 end
--=======================Set Dau ?==========================
function XHDauHoi()
	for i = 1, 10 do
		local nten, ncap,nphai = Ladder_GetLadderInfo(10270, i)
		if (nten == GetName()) then
			--SetEnergy(i)
			--SetRank(i)
			return
		end
	end
	--SetEnergy(0)
end
--=========================================================
function XepHang_BinhGiap()
	local TenNV = GetName()
	local BinhGiap = GetAllEquipValue()
	local MonPhai = GetLastFactionNumber()
	if BinhGiap>0 then
		Ladder_NewLadder(10268, TenNV,BinhGiap,0,MonPhai);
	end
end

Trungsinh={
	[0]={0},
	[1]={200},
	[2]={400},
	[3]={600},
	[4]={800},
	[5]={1000},
	[6]={1200},
	[7]={1400},
}

function XepHang_Top10ALL()
	CapDo = Trungsinh[ST_GetTransLifeCount()][1] + GetLevel()
	DiemExp = GetExpPercent()
	CapDoChinhXac = CapDo * 100 + DiemExp
	
	if GetCamp()==0 or GetCamp()==4 and GetFaction() == "" then
		Ladder_NewLadder(10271, GetName(),CapDoChinhXac,1);
	end
	Ladder_NewLadder(10270, GetName(),CapDoChinhXac,1);
end

function rankList() 
	local rankList= {
	
	}
	for i=1,10 do 
		local nName = Ladder_GetLadderInfo(10270, i)
		tinsert(rankList, {nName,"="..i})
		tbVngLib_File:Table2File("dulieu/", "ranklist1.txt", "w", rankList)	
	end

end

function XepHang_TopPhuho()
	local nMoney = GetBoxMoney()+ GetCash()
	local sMoney = nMoney/10000
	local TenNV = GetName()
	local MonPhai = GetLastFactionNumber()
	if sMoney < 1 then
		return
	end
	if GetCamp()==0 or GetCamp()==4 and GetFaction() == "" then
		Ladder_NewLadder(10284, TenNV,sMoney,1);
	end
	--LuuLogNhanVatPH()
	Ladder_NewLadder(10283,TenNV,sMoney,0,MonPhai);
end

function XepHang_TopMPPhuho()
	local player_Faction = GetFaction()
	local nMoney = GetBoxMoney()+ GetCash()
	local sMoney = nMoney/10000
	local TenNV = GetName()
	local MonPhai = GetLastFactionNumber()

		if sMoney < 1 then
			return
		end
		if (player_Faction == "cuiyan") then	
			Ladder_NewLadder(10290, TenNV,sMoney,0,MonPhai);

		elseif (player_Faction == "emei") then				
			Ladder_NewLadder(10289, TenNV,sMoney,0,MonPhai);

		elseif (player_Faction == "tangmen") then
			Ladder_NewLadder(10287, TenNV,sMoney,0,MonPhai);

		elseif (player_Faction == "wudu") then
			Ladder_NewLadder(10288, TenNV,sMoney,0,MonPhai);

		elseif (player_Faction == "tianwang") then
			Ladder_NewLadder(10286, TenNV,sMoney,0,MonPhai);

		elseif (player_Faction == "shaolin") then
			Ladder_NewLadder(10285, TenNV,sMoney,0,MonPhai);

		elseif (player_Faction == "wudang") then
			Ladder_NewLadder(10293, TenNV,sMoney,0,MonPhai);

		elseif (player_Faction == "kunlun") then
			Ladder_NewLadder(10294, TenNV,sMoney,0,MonPhai);

		elseif (player_Faction == "tianren") then
			Ladder_NewLadder(10292, TenNV,sMoney,0,MonPhai);

		elseif (player_Faction == "gaibang") then
			Ladder_NewLadder(10291, TenNV,sMoney,0,MonPhai);

		elseif (GetLastFactionNumber() == 10) then
			Ladder_NewLadder(10295, TenNV,sMoney,0,MonPhai);
	end
end

function XoaXepHang()
	for i=10001,10300 do
		Ladder_ClearLadder(i)
	end
end

function XepHang_Top10MP()
	local nlv = GetTask(3023)
	if(GetLevel()~=nlv) then
		local player_Faction = GetFaction()
		local TenNV = GetName()
		local MonPhai = GetLastFactionNumber()

		CapDo = Trungsinh[ST_GetTransLifeCount()][1] + GetLevel()
		DiemExp = GetExpPercent()
		CapDoChinhXac = CapDo * 100 + DiemExp

		if (player_Faction == "cuiyan") then	
			Ladder_NewLadder(10277, TenNV,CapDoChinhXac,0,MonPhai);

		elseif (player_Faction == "emei") then				
			Ladder_NewLadder(10276, TenNV,CapDoChinhXac,0,MonPhai);

		elseif (player_Faction == "tangmen") then
			Ladder_NewLadder(10274, TenNV,CapDoChinhXac,0,MonPhai);

		elseif (player_Faction == "wudu") then
			Ladder_NewLadder(10275, TenNV,CapDoChinhXac,0,MonPhai);

		elseif (player_Faction == "tianwang") then
			Ladder_NewLadder(10273, TenNV,CapDoChinhXac,0,MonPhai);

		elseif (player_Faction == "shaolin") then
			Ladder_NewLadder(10272, TenNV,CapDoChinhXac,0,MonPhai);

		elseif (player_Faction == "wudang") then
			Ladder_NewLadder(10280, TenNV,CapDoChinhXac,0,MonPhai);

		elseif (player_Faction == "kunlun") then
			Ladder_NewLadder(10281, TenNV,CapDoChinhXac,0,MonPhai);

		elseif (player_Faction == "tianren") then
			Ladder_NewLadder(10279, TenNV,CapDoChinhXac,0,MonPhai);

		elseif (player_Faction == "gaibang") then
			Ladder_NewLadder(10278, TenNV,CapDoChinhXac,0,MonPhai);

		elseif (GetLastFactionNumber() == 10) then
			Ladder_NewLadder(10282, TenNV,CapDoChinhXac,0,MonPhai);
		end
	end
end

function XepHang_CaNhan()
	if GetCamp()==0 or GetCamp()==4 and GetFaction() == "" then
		for i = 1, 1200 do
			local szname, nrank = Ladder_GetLadderInfo(10271, i)
			if (szname == "") then
				break
			end
			if (szname == GetName()) then
				Ladder_NewLadder(10296, "H¹ng Cao Thñ Hoang D·", i, 0, GetLastFactionNumber())
				break
			end
		end

		for i = 1, 1200 do
			local szname, nrank = Ladder_GetLadderInfo(10284, i)
			if (szname == "") then
				break
			end
			if (szname == GetName()) then
				Ladder_NewLadder(10296, "H¹ng Phó Hé Hoang D·", i, 0, GetLastFactionNumber())
				break
			end
		end
	else
		for i = 1, 1200 do
			local szname, nrank = Ladder_GetLadderInfo(10270, i)
			if (szname == "") then
				break
			end
			if (szname == GetName()) then
				Ladder_NewLadder(10296, "H¹ng Cao Thñ Giang Hå", i, 0, GetLastFactionNumber())
				break
			end
		end

		for i = 1, 1200 do
			local szname, nrank = Ladder_GetLadderInfo(10283, i)
			if (szname == "") then
				break
			end
			if (szname == GetName()) then
				Ladder_NewLadder(10296, "H¹ng Phó Hé Giang Hå", i, 0, GetLastFactionNumber())
				break
			end
		end

		local player_Faction = GetFaction()
		if (player_Faction == "cuiyan") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10277, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Cao Thñ M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "emei") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10276, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Cao Thñ M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "tangmen") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10274, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Cao Thñ M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "wudu") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10275, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Cao Thñ M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "tianwang") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10273, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Cao Thñ M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "shaolin") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10272, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Cao Thñ M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "wudang") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10280, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Cao Thñ M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "kunlun") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10281, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Cao Thñ M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "tianren") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10279, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Cao Thñ M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "gaibang") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10278, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Cao Thñ M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (GetLastFactionNumber() == 10) then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10282, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Cao Thñ M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		end

		if (player_Faction == "cuiyan") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10290, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "emei") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10289, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "tangmen") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10287, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "wudu") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10288, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "tianwang") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10286, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "shaolin") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10285, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "wudang") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10293, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "kunlun") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10294, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "tianren") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10292, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (player_Faction == "gaibang") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10291, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		elseif (GetLastFactionNumber() == 10) then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10295, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i", i, 0, GetLastFactionNumber())
					break
				end
			end
		end

		for i = 1, 1200 do
			local szname, nrank = Ladder_GetLadderInfo(10268, i)
			if (szname == "") then
				return
			end
			if (szname == GetName()) then
				Ladder_NewLadder(10296, "H¹ng binh gi¸p", i, 0, GetLastFactionNumber())
				return
			end
		end
	end
end
