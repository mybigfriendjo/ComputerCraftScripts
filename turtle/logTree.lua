local mov = require("base/mov")

local saplingSlot = 16

local function checkLog(side)
    local hasData, data
    if side == "top" then
        hasData, data = turtle.inspectUp()
    end
    if side == "front" then
        hasData, data = turtle.inspect()
    end

    if hasData then
        if data.tags["minecraft:logs"] ~= nil then
            return data.tags["minecraft:logs"]
        end
    end

    return false
end

local function dropAll()
    for i = 1, 16 do
        if i ~= saplingSlot then
            turtle.select(i)
            turtle.dropDown()
        end
    end
end

while true do
    if checkLog("front") then
        turtle.dig()
        mov.f()

        local counter = 0
        while checkLog("top") do
            turtle.digUp()
            mov.u()
            counter = counter + 1
        end

        for i = 1, counter do
            mov.d()
        end

        mov.b()
        turtle.suck()
        turtle.suckUp()

        dropAll()

        turtle.select(saplingSlot)
        turtle.place()
    end

    sleep(10)
    turtle.suck()
    turtle.suckUp()
    dropAll()
end
