-- A Lua utility to handle various data operations

local M = {}

function M.deepCopy(original)
    if type(original) ~= 'table' then
        return original
    end
    local copy = {}
    for key, value in next, original, nil do
        copy[M.deepCopy(key)] = M.deepCopy(value)
    end
    return copy
end

function M.mergeTables(t1, t2)
    local merged = M.deepCopy(t1)
    for key, value in pairs(t2) do
        if type(value) == 'table' and type(merged[key] or false) == 'table' then
            merged[key] = M.mergeTables(merged[key], value)
        else
            merged[key] = value
        end
    end
    return merged
end

function M.getValue(table, key, default)
    return table[key] ~= nil and table[key] or default
end

function M.flattenTable(t)
    local result = {}
    local function recursiveFlatten(subTable)
        for _, value in ipairs(subTable) do
            if type(value) == 'table' then
                recursiveFlatten(value)
            else
                table.insert(result, value)
            end
        end
    end
    recursiveFlatten(t)
    return result
end

return M