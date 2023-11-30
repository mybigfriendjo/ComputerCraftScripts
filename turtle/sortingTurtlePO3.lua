local tools = require("base/tools")
local mov = require("base/mov")

local storageChest = peripheral.wrap("bottom")

local trash = {
    "enderio:item_basic_capacitor",
    "abyssalcraft:dsword",
    "astralsorcery:itemconstellationpaper",
    "enderio:item_conduit_probe",
    "enderio:item_dark_steel_bow",
    "enderio:item_dark_steel_sword",
    "enderio:item_dark_steel_upgrade",
    "enderio:item_travel_staff",
    "immersiveengineering:blueprint",
    "minecraft:bow",
    "minecraft:chainmail_boots",
    "minecraft:chainmail_chestplate",
    "minecraft:chainmail_helmet",
    "minecraft:chainmail_leggings",
    "minecraft:enchanted_book",
    "minecraft:golden_boots",
    "minecraft:golden_chestplate",
    "minecraft:golden_helmet",
    "minecraft:golden_leggings",
    "minecraft:golden_sword",
    "minecraft:iron_boots",
    "minecraft:iron_chestplate",
    "minecraft:iron_helmet",
    "minecraft:iron_leggings",
    "minecraft:iron_shovel",
    "minecraft:iron_sword",
    "minecraft:leather_boots",
    "minecraft:leather_chestplate",
    "minecraft:leather_helmet",
    "minecraft:leather_leggings",
    "nuclearcraft:record_end_of_the_world",
    "nuclearcraft:record_hyperspace",
    "nuclearcraft:record_money_for_nothing",
    "nuclearcraft:record_wanderer",
    "quark:witch_hat",
    "randomthings:lavacharm",
    "tombstone:familiar_receptacle",
    "tombstone:fishing_rod_of_misadventure",
    "tombstone:scroll_buff",
    "tombstone:voodoo_poppet",
    "xreliquary:witch_hat"
}

local store = {
    "abyssalcraft:corbone",
    "abyssalcraft:corflesh",
    "abyssalcraft:dghead",
    "abyssalcraft:mre",
    "abyssalcraft:ohead",
    "abyssalcraft:phead",
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
    "darkutils:shulker_pearl",
    "embers:ancient_motive_core",
    "embers:archaic_brick",
    "enderio:block_enderman_skull",
    "enderio:item_soul_vial",
    "endermanevo:enderman_evolved_skull",
    "endermanevo:enderman_skull",
    "endermanevo:friender_pearl",
    "extrautils2:enderlilly",
    "extrautils2:ingredients",
    "extrautils2:ironwood_sapling",
    "forge:bucketfilled",
    "harvestcraft:anchovyrawitem",
    "harvestcraft:bassrawitem",
    "harvestcraft:bassrawitem",
    "harvestcraft:carprawitem",
    "harvestcraft:catfishrawitem",
    "harvestcraft:charrrawitem",
    "harvestcraft:eelrawitem",
    "harvestcraft:gigapickleseeditem",
    "harvestcraft:greenheartfishitem",
    "harvestcraft:grouperrawitem",
    "harvestcraft:herringrawitem",
    "harvestcraft:jellyfishrawitem",
    "harvestcraft:jellyfishrawitem",
    "harvestcraft:mudfishrawitem",
    "harvestcraft:octopusrawitem",
    "harvestcraft:perchrawitem",
    "harvestcraft:sardinerawitem",
    "harvestcraft:snapperrawitem",
    "harvestcraft:tilapiarawitem",
    "harvestcraft:troutrawitem",
    "harvestcraft:tunarawitem",
    "harvestcraft:tunarawitem",
    "harvestcraft:walleyerawitem",
    "minecraft:apple",
    "minecraft:beetroot_seeds",
    "minecraft:bone",
    "minecraft:bucket",
    "minecraft:carrot",
    "minecraft:chicken",
    "minecraft:chorus_flower",
    "minecraft:chorus_fruit",
    "minecraft:coal",
    "minecraft:diamond_horse_armor",
    "minecraft:diamond",
    "minecraft:dye",
    "minecraft:emerald",
    "minecraft:ender_pearl",
    "minecraft:feather",
    "minecraft:fish",
    "minecraft:glass_bottle",
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
    "minecraft:potato",
    "minecraft:potion",
    "minecraft:prismarine_crystals",
    "minecraft:prismarine_shard",
    "minecraft:pumpkin_seeds",
    "minecraft:quartz",
    "minecraft:record_13",
    "minecraft:record_cat",
    "minecraft:red_mushroom",
    "minecraft:redstone",
    "minecraft:rotten_flesh",
    "minecraft:sand",
    "minecraft:sapling",
    "minecraft:shulker_shell",
    "minecraft:skull",
    "minecraft:spider_eye",
    "minecraft:stick",
    "minecraft:string",
    "minecraft:sugar",
    "minecraft:torch",
    "minecraft:wheat",
    "mysticalagriculture:crafting",
    "natura:edibles",
    "natura:nether_berrybush_blightberry",
    "natura:nether_berrybush_stingberry",
    "netherex:thornstalk",
    "netherex:wither_bone",
    "nuclearcraft:dominos",
    "nuclearcraft:marshmallow",
    "nuclearcraft:milk_chocolate",
    "nuclearcraft:smore",
    "openblocks:trophy",
    "quantumflux:craftingpiece",
    "quark:black_ash",
    "rftoolsdim:dimlet_parcel",
    "tconstruct:materials",
    "tconstruct:spaghetti",
    "thermalfoundation:material",
    "tombstone:crafting_ingredient",
    "tombstone:tablet_of_assistance",
    "tombstone:tablet_of_cupidity",
    "tombstone:tablet_of_home",
    "witherskelefix:fragment",
    "xreliquary:glowing_water",
    "xreliquary:mob_ingredient",
    "xreliquary:void_tear"
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

            local unknownFile = fs.open("unknownItems.txt", "a")
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
