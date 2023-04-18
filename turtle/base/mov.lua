local function addFuelValueToTurtleLabel()
    local fuelLevel = turtle.getFuelLevel()

    local currentLabel = os.getComputerLabel()
    if currentLabel == nil then
        os.setComputerLabel("(" .. fuelLevel .. ")")
        return
    end

    local firstBracket, endBracket = string.find(currentLabel, "%(")

    if firstBracket == nil then
        os.setComputerLabel(currentLabel .. " (" .. fuelLevel .. ")")
        return
    end

    os.setComputerLabel(string.sub(currentLabel, 1, firstBracket - 1) .. "(" .. fuelLevel .. ")")
end

local function checkFuel()
    addFuelValueToTurtleLabel()
    local fuelLevel = turtle.getFuelLevel()
    if fuelLevel == "unlimited" then
        return true
    end
    if fuelLevel > 0 then
        return true
    end
    return false
end

local function f()
    while not checkFuel() do
        print("out of fuel")
        sleep(10)
    end
    while not turtle.forward() do
        if turtle.dig() then
            sleep(0.5)
        else
            print("can't move forward")
            sleep(10)
        end
    end
end

local function b()
    while not checkFuel() do
        print("out of fuel")
        sleep(10)
    end
    while not turtle.back() do
        print("can't move back")
        sleep(10)
    end
end

local function l()
    while not checkFuel() do
        print("out of fuel")
        sleep(10)
    end
    turtle.turnLeft()
    while not turtle.forward() do
        if turtle.dig() then
            sleep(0.5)
        else
            print("can't move forward")
            sleep(10)
        end
    end
end

local function r()
    while not checkFuel() do
        print("out of fuel")
        sleep(10)
    end
    turtle.turnRight()
    while not turtle.forward() do
        if turtle.dig() then
            sleep(0.5)
        else
            print("can't move forward")
            sleep(10)
        end
    end
end

local function u()
    while not checkFuel() do
        print("out of fuel")
        sleep(10)
    end
    while not turtle.up() do
        if turtle.digUp() then
            sleep(0.5)
        else
            print("can't move up")
            sleep(10)
        end
    end
end

local function d()
    while not checkFuel() do
        print("out of fuel")
        sleep(10)
    end
    while not turtle.down() do
        if turtle.digDown() then
            sleep(0.5)
        else
            print("can't move down")
            sleep(10)
        end
    end
end

local function tL()
    return turtle.turnLeft()
end

local function tR()
    return turtle.turnRight()
end

local function tA()
    turtle.turnRight()
    return turtle.turnRight()
end

local function t(direction)
    if string.lower(direction) == "r" then
        return tR()
    elseif string.lower(direction) == "l" then
        return tL()
    elseif string.lower(direction) == "a" then
        return tA()
    else
        print("unknown direction")
        return false, "unknown direction"
    end
end

return {f = f, b = b, l = l, r = r, u = u, d = d, tL = tL, tR = tR, tA = tA, t = t}
