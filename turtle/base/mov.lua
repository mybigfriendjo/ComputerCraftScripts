local function checkFuel()
    local fuelLevel = turtle.getFuelLimit()
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
        print("can't move forward")
        sleep(10)
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
        print("can't move forward")
        sleep(10)
    end
end

local function r()
    while not checkFuel() do
        print("out of fuel")
        sleep(10)
    end
    turtle.turnRight()
    while not turtle.forward() do
        print("can't move forward")
        sleep(10)
    end
end

local function u()
    while not checkFuel() do
        print("out of fuel")
        sleep(10)
    end
    while not turtle.up() do
        print("can't move up")
        sleep(10)
    end
end

local function d()
    while not checkFuel() do
        print("out of fuel")
        sleep(10)
    end
    while not turtle.down() do
        print("can't move down")
        sleep(10)
    end
end

local function tL()
    turtle.turnLeft()
end

local function tR()
    turtle.turnRight()
end

local function tA()
    turtle.turnRight()
    turtle.turnRight()
end

return {f = f, b = b, l = l, r = r, u = u, d = d, tL = tL, tR = tR, tA = tA}
