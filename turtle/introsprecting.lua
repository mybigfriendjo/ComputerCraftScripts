local inspect = require("external/inspect")

local introspect = peripheral.wrap("right")

local function writeToFile( contents )
    local unknownFile = fs.open("contents.txt", "a")
    unknownFile.writeLine(contents)
    unknownFile.close()
end

local inventory = introspect.getInventory()

writeToFile(inspect(inventory))

writeToFile(inspect(inventory.getItem(1)))
writeToFile(inspect(inventory.getItemMeta(1)))