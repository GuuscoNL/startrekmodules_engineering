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
--        Logs Console | Index       --
---------------------------------------

Star_Trek:RequireModules("logs", "button", "lcars")

Star_Trek.Logs_Console = Star_Trek.Logs_Console or {}

--if SERVER then
--end

if CLIENT then
	return
end

if game.GetMap() ~= "rp_intrepid_v1" then return end

local setupButton = function()
	if IsValid(Star_Trek.Logs_Console.Button) then
		Star_Trek.Logs_Console.Button:Remove()
	end

	local eng_security = ents.FindByName("gb60")[1]
	local pos = eng_security:GetPos()
	local ang = eng_security:GetAngles()

	pos = pos + ang:Right() * 96 + ang:Forward() * 30
	ang = ang + Angle(0, 123.5, 90)

	local success, ent = Star_Trek.Button:CreateInterfaceButton(pos, ang, "models/hunter/blocks/cube125x125x025.mdl", "eng_logs")
	if not success then
		print(ent)
	end
	Star_Trek.Logs_Console.Button = ent
end

hook.Add("InitPostEntity", "Star_Trek.Logs_Console.SpawnButton", setupButton)
hook.Add("PostCleanupMap", "Star_Trek.Logs_Console.SpawnButton", setupButton)