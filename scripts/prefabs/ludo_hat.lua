local assets =
{
  Asset("ANIM", "anim/ludo_hat.zip"),

  --Asset("ANIM", "anim/floating_items.zip"),

  Asset("ATLAS", "images/inventory/ludo_hat.xml"),
  Asset("IMAGE", "images/inventory/ludo_hat.tex"),
}

local prefabs =
{
}

local function OnEquip(inst, owner)
  owner.AnimState:OverrideSymbol("swap_hat", "ludo_hat", "swap_hat")

  owner.AnimState:Show("HAT")
  owner.AnimState:Show("HAIR_HAT")
  owner.AnimState:Hide("HAIR_NOHAT")
  owner.AnimState:Hide("HAIR")

  if owner:HasTag("player") then
    owner.AnimState:Hide("HEAD") --HEADBASE  -- You might change "HEAD" to "HEADBASE" if you'll approach problems with character's look.
    owner.AnimState:Show("HEAD_HAT") --HEADBASE_HAT
  end
end

local function OnUnequip(inst, owner)
  owner.AnimState:ClearOverrideSymbol("swap_hat")

  owner.AnimState:Hide("HAT")
  owner.AnimState:Hide("HAIR_HAT")
  owner.AnimState:Show("HAIR_NOHAT")
  owner.AnimState:Show("HAIR")

  if owner:HasTag("player") then
    owner.AnimState:Show("HEAD") --HEADBASE
    owner.AnimState:Hide("HEAD_HAT") --HEADBASE_HAT
  end
end

local function fn()
  local inst = CreateEntity()

  inst.entity:AddTransform()
  inst.entity:AddAnimState()
  inst.entity:AddNetwork()
  inst.entity:AddSoundEmitter()

  MakeInventoryPhysics(inst)

  inst.AnimState:SetBank("ludo_hat")
  inst.AnimState:SetBuild("ludo_hat")
  inst.AnimState:PlayAnimation("anim")

  -- Tags
  inst:AddTag("hat")
  ----
  MakeInventoryFloatable(inst, "small", 0.2, 0.80)

  inst.entity:SetPristine()

  if not TheWorld.ismastersim then
    return inst
  end

  -- Components
  inst:AddComponent("equippable")
  inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
  inst.components.equippable:SetOnEquip(OnEquip)
  inst.components.equippable:SetOnUnequip(OnUnequip)

  inst:AddComponent("inventoryitem")
  inst.components.inventoryitem.imagename = "ludo_hat"
  inst.components.inventoryitem.atlasname = "images/inventory/ludo_hat.xml"

  inst:AddComponent("inspectable")
  ----

  MakeHauntableLaunch(inst)

  return inst
end

return Prefab("ludo_hat", fn, assets, prefabs)
