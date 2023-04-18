local tools = require("base/tools")

local inputChest = peripheral.wrap("bottom")
local bufferChest = peripheral.wrap("top")
local outputCraftedChest = peripheral.wrap("front")
local outputOtherChest = peripheral.wrap("back")

local currentSlot = 1
turtle.select(currentSlot)

local crafting = {
    "exnihilocreatio:item_ore_aluminum",
    "exnihilocreatio:item_ore_ardite",
    "exnihilocreatio:item_ore_cobalt",
    "exnihilocreatio:item_ore_copper",
    "exnihilocreatio:item_ore_draconium",
    "exnihilocreatio:item_ore_gold",
    "exnihilocreatio:item_ore_iridium",
    "exnihilocreatio:item_ore_iron",
    "exnihilocreatio:item_ore_lead",
    "exnihilocreatio:item_ore_mithril",
    "exnihilocreatio:item_ore_nickel",
    "exnihilocreatio:item_ore_osmium",
    "exnihilocreatio:item_ore_platinum",
    "exnihilocreatio:item_ore_silver",
    "exnihilocreatio:item_ore_tin",
    "exnihilocreatio:item_ore_titanium",
    "exnihilocreatio:item_ore_tungsten",
    "exnihilocreatio:item_ore_yellorium",
    "exnihilocreatio:item_ore_zinc"
}

local shifting = {
    "actuallyadditions:item_dust",
    "appliedenergistics2:material",
    "minecraft:blaze_powder",
    "minecraft:coal",
    "minecraft:diamond",
    "minecraft:dye",
    "minecraft:emerald",
    "minecraft:flint",
    "minecraft:glowstone_dust",
    "minecraft:redstone",
    "projectred-core:resource_item",
    "rockcandy:raw_rock_candy"
}

local function hasEmptySlot(inventory)
    for i = 1, inventory.size() do
        if inventory.getItemMeta(i) == nil then
            return true
        end
    end
    return false
end

local function craft4x4(item, slot)
    local count = item.count

    turtle.suckUp()

    local quarter = turtle.getItemCount(1) / 4

    turtle.transferTo(2, quarter)
    turtle.transferTo(5, quarter)
    turtle.transferTo(6, quarter)

    turtle.craft()
end

while true do
    for i = 1, inputChest.size() do
        local item = inputChest.getItemMeta(i)
        if item ~= nil then
            if tools.tableHasValue(crafting, item.name) then
                while hasEmptySlot(bufferChest) == false do
                    print("buffer chest full")
                    sleep(15)
                end

                local count = item.count
                while count >= 4 do
                    inputChest.pushItems(peripheral.getName(bufferChest), i, 4)
                    count = count - 4
                end
            elseif tools.tableHasValue(shifting, item.name) then
                if hasEmptySlot(outputOtherChest) == false then
                    print("other chest full")
                    sleep(15)
                end
                inputChest.pushItems(peripheral.getName(outputOtherChest), i)
            end
        end
    end

    for i = 1, bufferChest.size() do
        local item = bufferChest.getItemMeta(i)
        
        if item ~= nil then
            craft4x4(item, i)

            while hasEmptySlot(outputCraftedChest) == false do
                print("crafted chest full")
                sleep(15)
            end

            turtle.drop()
        end
    end

    sleep(5)
end
