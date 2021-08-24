local mov = require("base/mov")

local currentlySelected = 1
turtle.select(currentlySelected)

local function selectSand()
    local itemTable = turtle.getItemDetail()
    if itemTable == nil or itemTable.name ~= "minecraft:sand" then
        local found = false
        for i=1,16 do
            turtle.select(i)
            itemTable = turtle.getItemDetail()
            if itemTable ~= nil then
                if itemTable.name == "minecraft:sand" then
                    currentlySelected = i
                    found = true
                    break
                end
            end
        end
        return found
    end
    return true
end

while true do
    if turtle.detectDown() then
        print("detected block - stopping")
        break
    end
    if selectSand() then
        if turtle.placeDown() then
            sleep(0.5)
            if turtle.detectDown() then
                mov.f()
            end
        end
    end
end