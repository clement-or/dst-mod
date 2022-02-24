local assets =
{
	Asset( "ANIM", "anim/topy.zip" ),
	Asset( "ANIM", "anim/ghost_topy_build.zip" ),
}

local skins =
{
	normal_skin = "topy",
	ghost_skin = "ghost_topy_build",
}

return CreatePrefabSkin("topy_none",
{
	base_prefab = "topy",
	type = "base",
	assets = assets,
	skins = skins,
	skin_tags = {"topy", "CHARACTER", "BASE"},
	build_name_override = "topy",
	rarity = "Character",
})
