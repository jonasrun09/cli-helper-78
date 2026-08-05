-- General utility functions for data handling

-- Function to flatten a nested table into a single-level table
local function flatten(t)
    local result = {}
    local function recurse(t)
        for _, v in ipairs(t) do
            if type(v) == 'table' then
                recurse(v)
            else
                table.insert(result, v)
            end
        end
    end
    recurse(t)
    return result
end

-- Function to merge two tables
local function merge(t1, t2)
    local result = {}
    for k, v in pairs(t1) do
        result[k] = v
    end
    for k, v in pairs(t2) do
        if result[k] and type(result[k]) == 'table' and type(v) == 'table' then
            result[k] = merge(result[k], v) -- deep merge
        else
            result[k] = v
        end
    end
    return result
end

-- Function to deeply clone a table
local function deepClone(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepClone(orig_key)] = deepClone(orig_value)
        end
        setmetatable(copy, deepClone(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

return {
    flatten = flatten,
    merge = merge,
    deepClone = deepClone
}