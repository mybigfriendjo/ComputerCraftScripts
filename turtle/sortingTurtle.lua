local trash = {
    "environmental:thief_hood",
    "mekanismtools:lapis_lazuli_boots",
    "mekanismtools:lapis_lazuli_chestplate",
    "mekanismtools:lapis_lazuli_helmet",
    "mekanismtools:lapis_lazuli_leggings",
    "minecraft:bow",
    "minecraft:leather_boots",
    "minecraft:leather_chestplate",
    "minecraft:leather_helmet",
    "minecraft:leather_leggings",
    "mining_helmet:mining_helmet"
}

local store = {
    "alexsmobs:cockroach_wing_fragment",
    "eidolon:tattered_cloth",
    "eidolon:zombie_heart",
    "forbidden_arcanus:bat_wing",
    "forbidden_arcanus:zombie_arm",
    "minecraft:apple",
    "minecraft:arrow",
    "minecraft:bone",
    "minecraft:carrot",
    "minecraft:chicken",
    "minecraft:ender_pearl",
    "minecraft:feather",
    "minecraft:gunpowder",
    "minecraft:iron_ingot",
    "minecraft:potato",
    "minecraft:rotten_flesh",
    "minecraft:spider_eye",
    "minecraft:string"
}

local smelt = {
    "mekanismtools:bronze_boots",
    "mekanismtools:bronze_chestplate",
    "mekanismtools:bronze_helmet",
    "mekanismtools:bronze_leggings",
    "mekanismtools:osmium_boots",
    "mekanismtools:osmium_chestplate",
    "mekanismtools:osmium_helmet",
    "mekanismtools:osmium_leggings",
    "mekanismtools:osmium_sword",
    "mekanismtools:refined_glowstone_boots",
    "mekanismtools:refined_glowstone_chestplate",
    "mekanismtools:refined_glowstone_helmet",
    "mekanismtools:refined_glowstone_leggings",
    "mekanismtools:refined_glowstone_sword",
    "mekanismtools:steel_boots",
    "mekanismtools:steel_chestplate",
    "mekanismtools:steel_helmet",
    "mekanismtools:steel_leggings",
    "mekanismtools:steel_sword",
    "minecraft:chainmail_boots",
    "minecraft:chainmail_chestplate",
    "minecraft:chainmail_helmet",
    "minecraft:chainmail_leggings",
    "minecraft:golden_boots",
    "minecraft:golden_chestplate",
    "minecraft:golden_helmet",
    "minecraft:golden_leggings",
    "minecraft:iron_pickaxe",
    "minecraft:iron_shovel",
    "minecraft:iron_sword"
}

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

local function transferToEmptySlot()
    for i = 2, 16 do
        if turtle.getItemCount(i) == 0 then
            turtle.transferTo(i)
            return true
        end
    end
    return false
end

while true do
    turtle.suck()

    local data = turtle.getItemDetail()

    if data ~= nil then
        if has_value(trash, data.name) then
            turtle.dropDown()
        end
        if has_value(store, data.name) then
            turtle.dropUp()
        end
        if has_value(smelt, data.name) then
            turtle.turnRight()
            turtle.drop()
            turtle.turnLeft()
        end

        if turtle.getItemCount() ~= 0 then
            print("Item unkown")
            print(data.name)
            if transferToEmptySlot() == false then
                break
            end
        end
    else
        sleep(3)
    end
end
