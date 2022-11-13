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
--     vFire Integration | Index     --
---------------------------------------

Star_Trek:RequireModules("security")

Star_Trek.vFire_Integration = Star_Trek.vFire_Integration or {}

if SERVER then
	include("sv_vfire_integration.lua")
end