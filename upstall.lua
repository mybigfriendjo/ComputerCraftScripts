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

local function downloadFile(url, path)
    local remote = http.get(url)
    if remote == nil then
        return false
    end

    local fileContent = remote.readAll()
    remote.close()

    local file = fs.open(path, "w+")
    file.write(fileContent)
    file.close()

    return true
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

-- main

loadConfig()

config["upstall"] = "https://raw.githubusercontent.com/mybigfriendjo/ComputerCraftScripts/main/upstall.lua"

for k,v in pairs(config) do
    print(k,v)
  end

for key, value in pairs(config) do
    print("Downloading " .. key .. " from " .. value)
    local path = key
    if string.find(key, "/") then
        path = getDirectory(key)
    end

    if not downloadFile(value, path) then
        print("Failed to download " .. key .. " from " .. value)
    end
end

saveConfig()
