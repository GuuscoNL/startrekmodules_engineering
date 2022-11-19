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
--     vFire Integration | Server    --
---------------------------------------

hook.Add("Star_Trek.Sensors.ScanScriptedEntity", "Star_Trek.vFire_Integration.ScanFire", function(ent, scanData)
	local className = ent:GetClass()
	if string.StartWith(className, "vfire") then
		scanData.Name = "Fire"
		scanData.IsFire = true

		scanData.GroupName = "Fire"
	end
end)

hook.Add("Star_Trek.Transporter.OverrideCanBeam", "Star_Trek.vFire_Integration.OverrideCanBeam", function(ent)
	local className = ent:GetClass()
	if string.StartWith(className, "vfire") then
		return false
	end
end)

hook.Add("Star_Trek.Security.CustomMapObject", "Star_Trek.vFire_Integration.ScanFire", function(scanData, mapObject)
	if scanData.IsFire then
		mapObject.Big = true
		mapObject.Color = Star_Trek.LCARS.ColorRed
		mapObject.HideCross = true
	end
end)

hook.Add("Star_Trek.Security.OverrideScanEntry", "Star_Trek.vFire_Integration.OverrideScanEntry", function(self, ply, object, scanData)
	if not scanData.IsFire then return end

	Star_Trek.Logs:AddEntry(self.Ent, ply, "WARNING: Fire detected in " .. object.SectionName, Star_Trek.LCARS.ColorRed)
	self.Ent:EmitSound("star_trek.lcars_alert14")

	return true
end)