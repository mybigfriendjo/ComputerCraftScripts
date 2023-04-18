local tools = require("base/tools")
local mov = require("base/mov")

local storageChest = peripheral.wrap("bottom")

local trash = {
    "enderio:item_basic_capacitor",
    "enderio:item_conduit_probe",
    "enderio:item_dark_steel_bow",
    "enderio:item_dark_steel_sword",
    "enderio:item_dark_steel_upgrade",
    "enderio:item_travel_staff",
    "minecraft:golden_chestplate",
    "minecraft:golden_helmet",
    "tombstone:familiar_receptacle",
    "tombstone:fishing_rod_of_misadventure",
    "tombstone:scroll_buff",
    "tombstone:voodoo_poppet",
    "enderio:item_basic_capacitor"
}

local store = {
    "abyssalcraft:corflesh",
    "abyssalcraft:mre",
    "abyssalcraft:shadowfragment",
    "abyssalcraft:shadowgem",
    "abyssalcraft:shadowshard",
    "actuallyadditions:item_solidified_experience",
    "appliedenergistics2:material",
    "armorplus:material",
    "bhc:red_heart",
    "botania:blacklotus",
    "botania:manaresource",
    "botania:overgrowthseed",
    "darkutils:material",
    "embers:ancient_motive_core",
    "embers:archaic_brick",
    "enderio:block_enderman_skull",
    "endermanevo:friender_pearl",
    "extrautils2:ingredients",
    "extrautils2:ironwood_sapling",
    "forge:bucketfilled",
    "harvestcraft:gigapickleseeditem",
    "immersiveengineering:blueprint",
    "minecraft:apple",
    "minecraft:beetroot_seeds",
    "minecraft:bone",
    "minecraft:bucket",
    "minecraft:chicken",
    "minecraft:coal",
    "minecraft:diamond_horse_armor",
    "minecraft:dye",
    "minecraft:ender_pearl",
    "minecraft:feather",
    "minecraft:glowstone_dust",
    "minecraft:gold_ingot",
    "minecraft:gold_nugget",
    "minecraft:golden_apple",
    "minecraft:golden_horse_armor",
    "minecraft:gunpowder",
    "minecraft:iron_horse_armor",
    "minecraft:iron_ingot",
    "minecraft:melon_seeds",
    "minecraft:nether_wart",
    "minecraft:obsidian",
    "minecraft:paper",
    "minecraft:potion",
    "minecraft:pumpkin_seeds",
    "minecraft:record_13",
    "minecraft:record_cat",
    "minecraft:redstone",
    "minecraft:rotten_flesh",
    "minecraft:sand",
    "minecraft:sapling",
    "minecraft:spider_eye",
    "minecraft:stick",
    "minecraft:string",
    "minecraft:sugar",
    "minecraft:torch",
    "minecraft:wheat",
    "mysticalagriculture:crafting",
    "netherex:wither_bone",
    "nuclearcraft:dominos",
    "nuclearcraft:marshmallow",
    "nuclearcraft:milk_chocolate",
    "nuclearcraft:record_end_of_the_world",
    "nuclearcraft:record_hyperspace",
    "nuclearcraft:record_money_for_nothing",
    "nuclearcraft:record_wanderer",
    "nuclearcraft:smore",
    "quantumflux:craftingpiece",
    "quark:black_ash",
    "randomthings:lavacharm",
    "rftoolsdim:dimlet_parcel",
    "thermalfoundation:material",
    "tombstone:crafting_ingredient",
    "tombstone:tablet_of_assistance",
    "tombstone:tablet_of_cupidity",
    "tombstone:tablet_of_home",
    "witherskelefix:fragment",
    "xreliquary:glowing_water",
    "xreliquary:mob_ingredient",
    "xreliquary:void_tear",
    "xreliquary:witch_hat"
}

local currentSlot = 1
turtle.select(currentSlot)

local function hasEmptySlot(inventory)
    for i = 1, inventory.size() do
        if inventory.getItemMeta(i) == nil then
            return true
        end
    end
    return false
end

while true do
    turtle.suck()

    local data = turtle.getItemDetail()

    if data ~= nil then
        if tools.tableHasValue(trash, data.name) then
            turtle.dropUp()
        end
        if tools.tableHasValue(store, data.name) then
            while not hasEmptySlot(storageChest) do
                print("Storage chest is full, waiting 5 seconds")
                sleep(5)
            end
            turtle.dropDown()
        end
        data = turtle.getItemDetail()
        if data ~= nil then
            local unknownChest = peripheral.wrap("back")
            while not hasEmptySlot(unknownChest) do
                print("Unknown chest is full, waiting 5 seconds")
                sleep(5)
            end

            unknownFile = fs.open("unknownItems.txt", "a")
            unknownFile.writeLine('"' .. data.name .. '",')
            unknownFile.close()

            mov.tA()
            turtle.drop()
            mov.tA()
        end
    else
        sleep(5)
    end
end
