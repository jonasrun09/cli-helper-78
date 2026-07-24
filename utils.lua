local M = {}

function M.deep_copy(original)
    local copy
    if type(original) == 'table' then
        copy = {}
        for key, value in pairs(original) do
            copy[M.deep_copy(key)] = M.deep_copy(value)
        end
        setmetatable(copy, M.deep_copy(getmetatable(original)))
    else -- number, string, boolean, etc
        copy = original
    end
    return copy
end

function M.table_merge(t1, t2)
    local merged = M.deep_copy(t1)
    for key, value in pairs(t2) do
        if type(value) == 'table' and type(merged[key]) == 'table' then
            merged[key] = M.table_merge(merged[key], value)
        else
            merged[key] = value
        end
    end
    return merged
end

function M.filter_table(tbl, predicate)
    local result = {}
    for key, value in pairs(tbl) do
        if predicate(value, key) then
            result[key] = value
        end
    end
    return result
end

return M