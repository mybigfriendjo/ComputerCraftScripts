local mov = require("base/mov")

local inputChest = peripheral.wrap("top")
local outputChest = peripheral.wrap("front")

local currentSlot = 1
turtle.select(currentSlot)

while true do
    local sum = 0

    while sum < 128 do
        local contentsInput = inputChest.list()

        for slot, item in pairs(contentsInput) do
            sum = sum + item.count
        end

        if sum < 128 then
            sleep(5)
        end
    end

    turtle.suckUp(64)
    currentSlot = currentSlot + 1
    if currentSlot == 4 or currentSlot == 8 then
        currentSlot = currentSlot + 1
    end

    local hasCrafted = false

    if currentSlot == 12 then
        turtle.craft()
        hasCrafted = true
        turtle.transferTo(1)
        currentSlot = 1
    end
    turtle.select(currentSlot)

    local maxSizeOutput = outputChest.size()
    local contentsOutput = outputChest.list()

    local sum = 0

    for slot, item in pairs(contentsOutput) do
        sum = sum + item.count
    end

    if sum < ((maxSizeOutput - 1) * 64) then
        if hasCrafted then
            turtle.drop()
        end
    else
        if hasCrafted then
            mov.tR()
            turtle.drop()
            mov.tL()
        end
    end
end
