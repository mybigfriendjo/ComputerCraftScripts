local mov = require("base/mov")

local inputChest = peripheral.wrap("top")
local outputChest = peripheral.wrap("front")

local currentSlot = 1
turtle.select(currentSlot)

while true do
    local maxSizeOutput = outputChest.size()
    local contentsOutput = outputChest.list()

    local sum = 0

    while sum < 64 do
        local contentsInput = inputChest.list()

        for slot, item in pairs(contentsInput) do
            sum = sum + item.count
        end

        if sum < 128 then
            sleep(5)
        end
    end

    local sum = 0

    for slot, item in pairs(contentsOutput) do
        sum = sum + item.count
    end

    if sum < ((maxSizeOutput - 1) * 64) then
        turtle.suckUp()
        turtle.drop()
    else
        turtle.suckUp()
        mov.tL()
        turtle.drop()
        mov.tR()
    end
end