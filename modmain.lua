-- Main file for the mod
----

local require = GLOBAL.require
GLOBAL.package.loaded["topy.modenv"] = env

-- Declare Assets and PrefabFiles, required for the mod
Assets = {}
PrefabFiles = {}

local define_list = {
  -- Characters
  "topy",

  -- Items
  "ludo_hat"
}

-- Define all the added game elements
for key, value in ipairs(define_list) do

  -- Try to require
  local elt = require(value.."_define")

  if elt and type(elt) == "table" and elt.Define then
    elt.Define()

    -- Add its Assets to the mod's
    if elt.Assets then
      for key, val in ipairs(elt.Assets) do
        table.insert(Assets, val)
      end
    end

    -- Add its PrefabFiles to the mod's
    if elt.PrefabFiles then
      for key, val in ipairs(elt.PrefabFiles) do
        table.insert(PrefabFiles, val)
      end
    end

  end
end
