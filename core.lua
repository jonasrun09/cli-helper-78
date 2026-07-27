--[[
Utility function for general data handling
This function merges two tables, with the option to overwrite existing keys.
]]

local function mergeTables(table1, table2, overwriteExisting)
    local merged = {}
    for k, v in pairs(table1) do
        merged[k] = v
    end
    for k, v in pairs(table2) do
        if overwriteExisting or merged[k] == nil then
            merged[k] = v
        end
    end
    return merged
end

local function safeGet(table, key, default)
    if table[key] ~= nil then
        return table[key]
    else
        return default
    end
end

local function deepCopy(source)
    local copy
    if type(source) == 'table' then
        copy = {}
        for k, v in pairs(source) do
            copy[deepCopy(k)] = deepCopy(v)
        end
        setmetatable(copy, deepCopy(getmetatable(source)))
    else
        copy = source
    end
    return copy
end

return {
    mergeTables = mergeTables,
    safeGet = safeGet,
    deepCopy = deepCopy
}