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

---@format disable-next
local blockWeights = {
    1, 1, 1, 1,
    1, 1, 1, 1,
    1, 1, 1, 0,
    1, 1, 1, 0
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

for x = 1, width do
    for y = 1, height do


        print(x, y, getWeightedRandomBlock())
        sleep(1)
    end
end
