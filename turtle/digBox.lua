local mov = require("base/mov")
local tools = require("base/tools")

local args = {...}

local x = math.abs(tonumber(args[1]))
local y = math.abs(tonumber(args[2]))
local yN = tonumber(args[2]) < 0
local z = math.abs(tonumber(args[3]))
local zN = tonumber(args[3]) < 0

local function dumpIntoEnderChest()
    local enderChestSlot = tools.getSlotContaining("enderstorage:ender_chest")

    if enderChestSlot == -1 then
        enderChestSlot = tools.getSlotContaining("enderchests:ender_chest")
    end

    if enderChestSlot ~= -1 then
        turtle.select(enderChestSlot)
        turtle.place()
        for i = 1, 16 do
            turtle.select(i)
            turtle.drop()
        end
        turtle.dig()
        return true
    end
    return false
end

local function checkFullUnload()
    while tools.isInventoryFull() do
        if not dumpIntoEnderChest() then
            print("inventory full - please unload")
            sleep(10)
        end
    end
end

for i = 1, z do
    for j = 1, y do
        for k = 1, x - 1 do
            turtle.dig()
            checkFullUnload()
            mov.f()
        end

        if j < y then
            local direction = ""

            if j % 2 == 1 then
                if yN then
                    direction = "l"
                else
                    direction = "r"
                end
            else
                if yN then
                    direction = "r"
                else
                    direction = "l"
                end
            end

            mov.t(direction)
            turtle.dig()
            mov.f()
            mov.t(direction)
        end
    end

    if i < z then
        if zN then
            turtle.digDown()
            mov.d()
        else
            turtle.digUp()
            mov.u()
        end

        if y % 2 == 1 then
            mov.tA()
        else
            local direction = ""
            if yN then
                direction = "l"
            else
                direction = "r"
            end
            mov.t(direction)
            local temp = x
            x = y
            y = temp
        end
    end
end

mov.b()
dumpIntoEnderChest()
mov.f()
