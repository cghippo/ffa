AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

local models = {
  "models/player/riot.mdl",
  "models/player/gasmask.mdl",
  "models/player/urban.mdl",
  "models/player/swat.mdl",
  "models/player/phoenix.mdl",
  "models/player/arctic.mdl",
  "models/player/guerilla.mdl",
  "models/player/leet.mdl"
}

local weaponprimary = {
  "weapon_ak47",
  "weapon_m4",
  "weapon_mp5",
  "weapon_para",
  "weapon_pumpshotgun",
}

local weaponsecondary = {
  "weapon_deagle",
  "weapon_fiveseven",
  "weapon_glock",
  "weapon_mac10",
  "weapon_tmp"
}

function GM:PlayerSpawn( ply )
    ply:SetModel( models [ math.random( #models ) ] )

    ply:Give( weaponprimary [ math.random( #weaponprimary ) ] )
    ply:Give( weaponsecondary [ math.random( #weaponsecondary ) ] )

    ply:SetupHands()
end

function GM:PlayerSetHandsModel( ply, ent )

	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
	local info = player_manager.TranslatePlayerHands( simplemodel )
	if ( info ) then
		ent:SetModel( info.model )
		ent:SetSkin( info.skin )
		ent:SetBodyGroups( info.body )
	end

end
