local mov = require("base/mov")
local tools = require("base/tools")

local args = {...}

local height = math.abs(tonumber(args[1]))
local width = math.abs(tonumber(args[2]))
local heightDirection = tools.ternary(tonumber(args[1]) < 0, -1, 1)
local widthDirection = tools.ternary(tonumber(args[2]) < 0, -1, 1)

math.randomseed(os.clock() * 100000000000)
for i = 1, 3 do
    math.random(10000, 65000)
end

--[[
    1, 1, 1, 1,
    1, 1, 1, 1,
    1, 1, 1, 0,
    1, 1, 1, 0
--]]
local blockWeights = {
    20, 20, 20, 10,
    20, 20, 20, 10,
    3, 3, 3, 0,
    3, 3, 3, 0
}

local function getWeightedRandomBlock()
    local totalWeight = 0
    for i = 1, #blockWeights do
        totalWeight = totalWeight + blockWeights[i]
    end

    local randomWeight = math.random(1, totalWeight)
    local currentWeight = 0
    for i = 1, #blockWeights do
        currentWeight = currentWeight + blockWeights[i]
        if currentWeight >= randomWeight then
            return i
        end
    end
end

-- main

if height == 0 then
    print("height must be bigger than 1 or smaller than -1")
    return
end

if width == 0 then
    print("width must be bigger than 1 or smaller than -1")
    return
end

local x = width
while x >= width do

    local y = height
    while y >= height do
        if turtle.detect() then
            while not turtle.dig() do
                print("can't dig")
                sleep(10)
            end
        end

        local weightedSelection = getWeightedRandomBlock()

        turtle.select(weightedSelection)
        while turtle.getItemCount() == 0 do
            print("missing blocks in slot " .. weightedSelection)
            sleep(10)
        end

        while not turtle.place() do
            print("can't place")
            sleep(10)
        end

        mov.vm(heightDirection)

        y = y - 1
    end

    mov.hm(widthDirection, true)

    x = x - 1
end
