local function Define()
  local modenv = require "topy.modenv"

  STRINGS.NAMES.LUDO_HAT = "Ludo's Hat"
  STRINGS.RECIPE_DESC.LUDO_HAT = "What does it do? I don't know let's find out"
  STRINGS.CHARACTERS.GENERIC.DESCRIBE.LUDO_HAT = "Wow this is a hat"

  local ludo_hat = Ingredient( "ludo_hat", 1 )
  ludo_hat.atlas = "images/inventory/ludo_hat.xml"

  modenv.AddRecipe("ludo_hat",
    {
      Ingredient("twigs", 1)
    },
    RECIPETABS.DRESS,
    TECH.NONE,
    nil, nil, nil, 1, nil, "images/inventory/ludo_hat.xml"
  )
end

local Assets = {

}

local PrefabFiles = {
  "ludo_hat"
}

return {
  Define = Define,
  Assets = Assets,
  PrefabFiles = PrefabFiles
}
