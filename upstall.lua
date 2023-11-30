local configFileName = "upstall.ini"

local config = {}

local function isempty(s)
    return s == nil or s == ""
end

local function loadConfig()
    if not fs.exists(configFileName) then
        local configFile = fs.open(configFileName, "w")
        configFile.close()
    end

    local configFile = fs.open(configFileName, "r")
    local configContent = configFile.readAll()
    configFile.close()

    if not isempty(configContent) then
        config = textutils.unserialize(configContent)
    end

    if isempty(config) then
        config = {}
    end
end

local function saveConfig()
    local configFile = fs.open(configFileName, "w")
    configFile.write(textutils.serialize(config))
    configFile.close()
end

-- main

loadConfig()

config["upstall"] = ""