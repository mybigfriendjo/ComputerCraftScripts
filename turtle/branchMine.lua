local mov = require("base/mov")
local tools = require("base/tools")

local args = {...}

-- handle lava insulation
-- check full inventory

local branchLength = tonumber(args[1])
local continueDirection = args[2]
local continueAmount = tonumber(args[3])

if branchLength == nil then
    print("needs branchLength")
    return
end

if continueDirection ~= nil then
    if continueAmount == nil then
        print("needs continue amount")
        return
    end
end

local cobbleBlocks = {
    "minecraft:cobblestone",
    "minecraft:netherrack"
}

local function placeTorch()
    local torchSlot = tools.getSlotContaining("minecraft:torch")

    if torchSlot ~= -1 then
        local currentSelection = turtle.getSelectedSlot()
        turtle.select(torchSlot)
        turtle.placeDown()
        turtle.select(currentSelection)
    end
end

local function placeCobbleBlock(direction)
    for i = 1, 16 do
        local data = turtle.getItemDetail(i)
        if data ~= nil and tools.tableHasValue(cobbleBlocks, data.name) then
            local currentSelection = turtle.getSelectedSlot()
            turtle.select(i)
            if direction == "u" then
                turtle.placeUp()
            end
            if direction == "d" then
                turtle.placeDown()
            end
            if direction == "f" then
                turtle.place()
            end
            turtle.select(currentSelection)
        end
    end
end

local function checkForLava()
    local hasBlock, data
    hasBlock, data = turtle.inspectUp()
    if hasBlock then
        if data ~= nil and data.name == "minecraft:lava" then
            placeCobbleBlock("u")
        end
    end

    -- TODO
end

local function digBranch()
    turtle.dig()
    mov.f()
    turtle.digDown()
    placeTorch()

    for i = 1, branchLength - 1 do
        turtle.dig()
        mov.f()
        turtle.digDown()

        -- TODO

        if i % 10 == 0 then
            placeTorch()
        end
    end

    placeTorch()

    for i = 1, branchLength do
        mov.b()
    end
end

digBranch()