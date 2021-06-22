local mov = require("base/mov")

local args = {...}

local x = tonumber(args[1])

local torchSlot = 16

local function placeTorch()
    local currentSelection = turtle.getSelectedSlot()
    turtle.select(torchSlot)
    turtle.placeDown()
    turtle.select(currentSelection)
end

turtle.dig()
mov.f()
turtle.digDown()
placeTorch()

for i = 1, x - 1 do
    turtle.dig()
    mov.f()
    turtle.digDown()
    if i % 10 == 0 then
        placeTorch()
    end
end

placeTorch()

for i = 1, x do
    mov.b()
end
