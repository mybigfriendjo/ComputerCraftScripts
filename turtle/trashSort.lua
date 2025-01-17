local tools = require("base/tools")

local trash = {
    "forbidden_arcanus:zombie_arm",
    "mekanismtools:lapis_lazuli_boots",
    "mekanismtools:lapis_lazuli_chestplate",
    "mekanismtools:lapis_lazuli_helmet",
    "mekanismtools:lapis_lazuli_leggings",
    "mekanismtools:osmium_boots",
    "mekanismtools:osmium_chestplate",
    "mekanismtools:osmium_helmet",
    "mekanismtools:osmium_leggings",
    "mekanismtools:osmium_sword",
    "mekanismtools:refined_glowstone_boots",
    "mekanismtools:refined_glowstone_chestplate",
    "mekanismtools:refined_glowstone_helmet",
    "mekanismtools:refined_glowstone_leggings",
    "mekanismtools:refined_obsidian_boots",
    "mekanismtools:refined_obsidian_chestplate",
    "mekanismtools:refined_obsidian_helmet",
    "mekanismtools:refined_obsidian_leggings",
    "mekanismtools:bronze_boots",
    "mekanismtools:bronze_chestplate",
    "mekanismtools:bronze_helmet",
    "mekanismtools:bronze_leggings",
    "mekanismtools:bronze_sword",
    "mekanismtools:steel_boots",
    "mekanismtools:steel_chestplate",
    "mekanismtools:steel_helmet",
    "mekanismtools:steel_leggings",
    "minecraft:leather_boots",
    "minecraft:leather_chestplate",
    "minecraft:leather_helmet",
    "minecraft:leather_leggings",
    "minecraft:rotten_flesh",
    "minecraft:golden_boots",
    "minecraft:golden_chestplate",
    "minecraft:golden_helmet",
    "minecraft:golden_leggings",
    "minecraft:iron_boots",
    "minecraft:iron_chestplate",
    "minecraft:iron_helmet",
    "minecraft:iron_leggings",
    "minecraft:iron_shovel",
    "minecraft:iron_sword",
    "minecraft:chainmail_boots",
    "minecraft:chainmail_chestplate",
    "minecraft:chainmail_helmet",
    "minecraft:chainmail_leggings",
    "xreliquary:zombie_heart",
}

while true do
    turtle.suck()

    local data = turtle.getItemDetail()

    if data ~= nil then
        if tools.tableHasValue(trash, data.name) then
            turtle.dropDown()
        end
        
        if turtle.getItemCount() ~= 0 then
            print("Item unkown")
            print(data.name)
            turtle.drop()
        end
    else
        sleep(3)
    end
end
