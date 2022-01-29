local detector = peripheral.find("playerDetector")
local speaker = peripheral.find("speaker")

if detector == nil or speaker == nil then
    error("playerDetector or speaker not found")
end

local permittedPlayers = {"mybigfriendjo", "Kurariko"}
local counter = 0

local function isPermitted(playerName)
    for index, value in ipairs(permittedPlayers) do
        if value == playerName then
            return true
        end
    end
    return false
end

while true do
    local players = detector.getPlayersInRange(2)
    local foundSomebody = false
    for index, value in pairs(players) do
        if isPermitted(value) then
            foundSomebody = true
            counter = counter + 1
        end
    end

    if not foundSomebody then
        counter = 0
    end

    if counter == 5 then
        speaker.playNote("chime")
        sleep(2)
        redstone.setOutput("front", true)
        sleep(0.5)
        redstone.setOutput("front", false)
        sleep(10)
        counter = 0
    end

    sleep(1)
end
