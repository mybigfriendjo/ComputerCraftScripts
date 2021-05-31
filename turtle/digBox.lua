local mov = require("base/mov")

local args = {...}

local x = tonumber(args[1])
local y = tonumber(args[2])
local z = tonumber(args[3])

for i = 1, z do
    for j = 1, y do
        for k = 1, x - 1 do
            turtle.dig()
            mov.f()
        end

        if j < y then
            if j % 2 == 1 then
                mov.tR()
            else
                mov.tL()
            end

            turtle.dig()
            mov.f()

            if j % 2 == 1 then
                mov.tR()
            else
                mov.tL()
            end
        end
    end

    if i < z then
        turtle.digDown()
        mov.d()
        mov.tA()
    end
end
