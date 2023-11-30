local mov = require("base/mov")
local tools = require("base/tools")

local args = {...}

local height = math.abs(tonumber(args[1]))
local width = math.abs(tonumber(args[2]))

local blockWeights = {
    1,1,1,1,
    1,1,1,1,
    1,1,1,1,
    1,1,1,1
}

math.randomseed(os.clock()*100000000000)
for i=1,3 do
    math.random(10000, 65000)
end

