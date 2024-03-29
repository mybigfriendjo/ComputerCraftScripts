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

local function tL()
    return turtle.turnLeft()
end

local function tR()
    return turtle.turnRight()
end

local function tA()
    return turtle.turnRight() and turtle.turnRight()
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
    return true
end

local function b()
    while not checkFuel() do
        print("out of fuel")
        sleep(10)
    end
    if not turtle.back() then
        tA()
        while turtle.dig() do
            sleep(0.5)
        end
        tA()
    end
    while not turtle.back() do
        print("can't move back")
        sleep(10)
    end
    return true
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
    return true
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
    return true
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
    return true
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
    return true
end

local function t(direction)
    if direction == nil then
        print("direction is nil")
        return false, "direction is nil"
    end

    if type(direction) == "number" then
        if direction == -1 then
            return tL()
        elseif direction == 0 then
            return true
        elseif direction == 1 then
            return tR()
        elseif direction == -2 or direction == 2 then
            return tA()
        else
            print("unknown direction")
            return false, "unknown direction"
        end
    end

    if type(direction) == "string" then
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

    print("unknown direction")
    return false, "unknown direction"
end

local function hm(direction, keepOrientation)
    if direction == nil then
        print("direction is nil")
        return false, "direction is nil"
    end

    while not checkFuel() do
        print("out of fuel")
        sleep(10)
    end

    if type(direction) == "number" then
        if direction == -1 then
            if keepOrientation then
                return l() and tR()
            else
                return l()
            end
        elseif direction == 0 then
            return f()
        elseif direction == 1 then
            if keepOrientation then
                return r() and tL()
            else
                return r()
            end
        elseif direction == -2 or direction == 2 then
            return b()
        else
            print("unknown direction")
            return false, "unknown direction"
        end
    end

    print("unknown direction")
    return false, "unknown direction"
end

local function vm(direction)
    if direction == nil then
        print("direction is nil")
        return false, "direction is nil"
    end

    while not checkFuel() do
        print("out of fuel")
        sleep(10)
    end

    if type(direction) == "number" then
        if direction == -1 then
            return d()
        elseif direction == 0 then
            return true
        elseif direction == 1 then
            return u()
        else
            print("unknown direction")
            return false, "unknown direction"
        end
    end

    print("unknown direction")
    return false, "unknown direction"
end

return {f = f, b = b, l = l, r = r, u = u, d = d, tL = tL, tR = tR, tA = tA, t = t, hm = hm, vm = vm}
