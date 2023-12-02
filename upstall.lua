local configFileName = "upstall.ini"
local baseGitURL = "https://raw.githubusercontent.com/mybigfriendjo/ComputerCraftScripts/main/"

-- edits below this line at your own risk

local args = {...}

local command = args[1]
local parameter = args[2]

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

    if config["upstall.lua"] == nil then
        config["upstall.lua"] = baseGitURL .. "upstall.lua"
    end
end

local function saveConfig()
    if fs.exists(configFileName) then
        fs.delete(configFileName)
    end

    local configFile = fs.open(configFileName, "w")
    configFile.write(textutils.serialize(config))
    configFile.close()
end

local function getDirectory(path)
    -- Find the last occurrence of "/"
    local lastSlash = path:match(".*/()")

    -- If "/" is found, return the substring excluding the last part
    if lastSlash then
        return path:sub(1, lastSlash - 1)
    else
        -- If "/" is not found, return the original string
        return path
    end
end

local function downloadFile(url, path)
    if string.find(path, "/") then
        fs.makeDir(getDirectory(path))
    end

    local remote = http.get(url)
    if remote == nil then
        return false
    end

    local fileContent = remote.readAll()
    remote.close()

    if fs.exists(path) then
        fs.delete(path)
    end

    local file = fs.open(path, "w")
    file.write(fileContent)
    file.close()

    return true
end

local function ends_with(str, ending)
    return ending == "" or str:sub(-(#ending)) == ending
end

-- main

loadConfig()

if command == nil then
    command = "update"
    parameter = "all"
end

if command == "update" then
    if isempty(parameter) then
        print("Please specify a file to add")
        print("Or use 'all' to update all files")
        return
    end

    if parameter == "all" then
        for key, value in pairs(config) do
            print("Downloading " .. key)
            
            if not downloadFile(value, key) then
                print("Failed to download " .. key)
            end
        end
        return
    end

    if not ends_with(parameter, ".lua") then
        parameter = parameter .. ".lua"
    end

    if config[parameter] == nil then
        print("File does not exist in config")
        print("Use 'add' to add it")
        return
    end

    print("Downloading " .. parameter)
    if not downloadFile(config[parameter], parameter) then
        print("Failed to download " .. parameter)
    end
end

if command == "add" then
    if isempty(parameter) then
        print("Please specify a file to add")
        return
    end

    if not ends_with(parameter, ".lua") then
        parameter = parameter .. ".lua"
    end

    if config[parameter] ~= nil then
        print("File already exists in config")
        print("Use 'delete' to remove it")
        return
    end

    config[parameter] = baseGitURL .. parameter

    print("Downloading " .. parameter)
    if not downloadFile(config[parameter], parameter) then
        print("Failed to download " .. parameter)
    end
end

if command == "delete" then
    if isempty(parameter) then
        print("Please specify a file to delete")
        return
    end

    if not ends_with(parameter, ".lua") then
        parameter = parameter .. ".lua"
    end

    if config[parameter] == nil then
        print("File does not exist in config")
        return
    end

    config[parameter] = nil
end

saveConfig()
