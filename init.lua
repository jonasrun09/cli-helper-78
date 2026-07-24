-- Utility function for general data handling

local M = {}

-- Flatten a nested table structure
function M.flatten(tbl)
    local result = {}
    local function recursiveFlatten(t)
        for _, v in ipairs(t) do
            if type(v) == 'table' then
                recursiveFlatten(v)
            else
                table.insert(result, v)
            end
        end
    end
    recursiveFlatten(tbl)
    return result
end

-- Merge two tables with deep copy
function M.mergeDeep(t1, t2)
    local result = {}
    for k, v in pairs(t1) do
        if type(v) == 'table' and type(t2[k]) == 'table' then
            result[k] = M.mergeDeep(v, t2[k])
        else
            result[k] = v
        end
    end
    for k, v in pairs(t2) do
        if not result[k] then
            result[k] = v
        end
    end
    return result
end

-- Collect unique items from a table
function M.unique(tbl)
    local result = {}
    local hash = {}
    for _, v in ipairs(tbl) do
        if not hash[v] then
            hash[v] = true
            table.insert(result, v)
        end
    end
    return result
end

return M
