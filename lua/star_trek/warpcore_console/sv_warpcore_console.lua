---------------------------------------
---------------------------------------
--         Star Trek Modules         --
--                                   --
--            Created by             --
--       Jan 'Oninoni' Ziegler       --
--                                   --
-- This software can be used freely, --
--    but only distributed by me.    --
--                                   --
--    Copyright © 2022 Jan Ziegler   --
---------------------------------------
---------------------------------------

---------------------------------------
--     Warp Core Console | Server    --
---------------------------------------

hook.Add("Star_Trek.ModulesLoaded", "Star_Trek.WarpCore_Console.LoadLogType", function()
	if istable(Star_Trek.Logs) then
		Star_Trek.Logs:RegisterType("Warp Core Control")
	end
end)

hook.Add("Star_Trek.Logs.GetSessionName", "Star_Trek.WarpCore_Console.GetSessionName", function(interfaceData)
	local ent = interfaceData.Ent
	if ent:GetName() == "coreBut1" then
		return "Warp Core Control"
	end
end)

hook.Add("Star_Trek.LCARS.BasicPressed", "Star_Trek.WarpCore_Console.BasicPressed", function(ply, interfaceData, buttonId, buttonData)
	local ent = interfaceData.Ent
	if ent:GetName() == "coreBut1" and istable(Star_Trek.Logs) then
		if buttonId == 1 then
			Star_Trek.Logs:AddEntry(ent, ply, "Force Field enabled!")
		elseif buttonId == 2 then
			Star_Trek.Logs:AddEntry(ent, ply, "Force Field disabled!")

			Star_Trek.LCARS:CloseInterface(Star_Trek.WarpCore_Console.Button, callback)
		elseif buttonId == 3 then
			Star_Trek.Logs:AddEntry(ent, ply, "Starting Warp Core Ejection...")

			ent:EmitSound("star_trek.lcars_beep2")
			Star_Trek.LCARS:OpenInterface(ply, Star_Trek.WarpCore_Console.Button, "warp_core_eject")

			return true
		end
	end
end)

function Star_Trek.WarpCore_Console:IsValidCode(code)
	if table.HasValue(self.ValidCodes, code) then
		return true
	end

	return false
end