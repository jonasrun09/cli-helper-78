-- Utility function to check if a value is not nil
local function isNotNil(value)
    return value ~= nil
end

-- Function to merge two tables
local function mergeTables(table1, table2)
    for key, value in pairs(table2) do
        table1[key] = value
    end
    return table1
end

-- Function to find the maximum value in a table
local function maxInTable(inputTable)
    local maxVal = -math.huge
    for _, value in ipairs(inputTable) do
        if value > maxVal then
            maxVal = value
        end
    end
    return maxVal
end

-- Function to sort the keys of a table
local function sortedKeys(inputTable)
    local keys = {}
    for key in pairs(inputTable) do
        table.insert(keys, key)
    end
    table.sort(keys)
    return keys
end

-- Exported functions
return {
    isNotNil = isNotNil,
    mergeTables = mergeTables,
    maxInTable = maxInTable,
    sortedKeys = sortedKeys
}