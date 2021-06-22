local mov = require("base/mov")

local args = {...}

local x = math.abs(tonumber(args[1]))
local y = math.abs(tonumber(args[2]))
local yN = tonumber(args[2]) < 0
local z = math.abs(tonumber(args[3]))
local zN = tonumber(args[3]) < 0

for i = 1, z do
    for j = 1, y do
        for k = 1, x - 1 do
            turtle.dig()
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
