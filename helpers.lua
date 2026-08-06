-- Function to check if a table is empty
local function isEmpty(tbl)
    return next(tbl) == nil
end

-- Function to merge two tables
local function mergeTables(t1, t2)
    local result = {}
    for k, v in pairs(t1) do
        result[k] = v
    end
    for k, v in pairs(t2) do
        result[k] = v
    end
    return result
end

-- Function to filter a table based on a predicate
local function filterTable(tbl, predicate)
    local result = {}
    for k, v in pairs(tbl) do
        if predicate(v, k) then
            result[k] = v
        end
    end
    return result
end

-- Function to map a table values based on a function
local function mapTable(tbl, func)
    local result = {}
    for k, v in pairs(tbl) do
        result[k] = func(v, k)
    end
    return result
end

-- Function to perform a deep copy of a table
local function deepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepCopy(orig_key)] = deepCopy(orig_value)
        end
        setmetatable(copy, deepCopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

return {
    isEmpty = isEmpty,
    mergeTables = mergeTables,
    filterTable = filterTable,
    mapTable = mapTable,
    deepCopy = deepCopy
}