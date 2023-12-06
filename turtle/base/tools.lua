local function tableHasValue(inputTable, valueToCheck)
    for index, value in ipairs(inputTable) do
        if value == valueToCheck then
            return true
        end
    end
    return false
end

local function isInventoryFull()
    for i = 1, 16 do
        if turtle.getItemCount(i) == 0 then
            return false
        end
    end
    return true
end

local function getSlotContaining(itemName)
    local foundSlot = -1
    for i = 1, 16 do
        local itemData = turtle.getItemDetail(i)
        if itemData ~= nil and itemData.name == itemName then
            foundSlot = i
            break
        end
    end
    return foundSlot
end

local function ternary (cond, trueValue, falseValue)
    if cond then
        return trueValue
    else
        return falseValue
    end
end

return {
    tableHasValue = tableHasValue,
    isInventoryFull = isInventoryFull,
    getSlotContaining = getSlotContaining,
    ternary = ternary
}
