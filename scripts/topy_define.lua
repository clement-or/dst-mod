local function Define(assets, prefabfiles)

  local modenv = require "topy.modenv"

  -- The character select screen lines
  STRINGS.CHARACTER_TITLES.topy = "The Déchet"
  STRINGS.CHARACTER_NAMES.topy = "Topy"
  STRINGS.CHARACTER_DESCRIPTIONS.topy = "*Is a déchet\n*Has no purpose in life\n*Everybody hates him"
  STRINGS.CHARACTER_QUOTES.topy = "\"Let me die\""
  STRINGS.CHARACTER_SURVIVABILITY.topy = "Already dead"

  -- Custom speech strings
  STRINGS.CHARACTERS.topy = require "topy_speech"

  -- The character's name as appears in-game
  STRINGS.NAMES.topy = "Topy"
  STRINGS.SKIN_NAMES.topy_none = "Topy"

  -- The skins shown in the cycle view window on the character select screen.
  -- A good place to see what you can put in here is in skinutils.lua, in the function GetSkinModes
  local skin_modes = {
    {
      type = "ghost_skin",
      anim_bank = "ghost",
      idle_anim = "idle",
      scale = 0.75,
      offset = { 0, - 25 }
    },
  }

  -- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
  modenv.AddModCharacter("topy", "MALE", skin_modes)
  modenv.AddMinimapAtlas("images/map_icons/topy.xml")

  -- Custom recipe
  modenv.AddRecipe(
    "chester_eyebone",
    {
      Ingredient("twigs", 1),
    },
    RECIPETABS.MAGIC,
    TECH.NONE,
    nil, nil, nil, 1,
    "can_craft_eyebone"
  )
end

-- This character's assets
local Assets = {
  Asset( "IMAGE", "images/saveslot_portraits/topy.tex" ),
  Asset( "ATLAS", "images/saveslot_portraits/topy.xml" ),

  Asset( "IMAGE", "images/selectscreen_portraits/topy.tex" ),
  Asset( "ATLAS", "images/selectscreen_portraits/topy.xml" ),

  Asset( "IMAGE", "images/selectscreen_portraits/topy_silho.tex" ),
  Asset( "ATLAS", "images/selectscreen_portraits/topy_silho.xml" ),

  Asset( "IMAGE", "bigportraits/topy.tex" ),
  Asset( "ATLAS", "bigportraits/topy.xml" ),

  Asset( "IMAGE", "images/map_icons/topy.tex" ),
  Asset( "ATLAS", "images/map_icons/topy.xml" ),

  Asset( "IMAGE", "images/avatars/avatar_topy.tex" ),
  Asset( "ATLAS", "images/avatars/avatar_topy.xml" ),

  Asset( "IMAGE", "images/avatars/avatar_ghost_topy.tex" ),
  Asset( "ATLAS", "images/avatars/avatar_ghost_topy.xml" ),

  Asset( "IMAGE", "images/avatars/self_inspect_topy.tex" ),
  Asset( "ATLAS", "images/avatars/self_inspect_topy.xml" ),

  Asset( "IMAGE", "images/names_topy.tex" ),
  Asset( "ATLAS", "images/names_topy.xml" ),

  Asset( "IMAGE", "images/names_gold_topy.tex" ),
  Asset( "ATLAS", "images/names_gold_topy.xml" ),
}

-- This character's prefab files
local PrefabFiles = {
  "topy",
  "topy_none",
}

return {
  Define = Define,
  Assets = Assets,
  PrefabFiles = PrefabFiles
}
