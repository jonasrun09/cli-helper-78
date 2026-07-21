-- A collection of helper functions

local M = {}

-- Function to check if a table is empty
function M.is_table_empty(t)
    return next(t) == nil
end

-- Function to merge two tables
function M.merge_tables(t1, t2)
    local merged = {}
    for k, v in pairs(t1) do
        merged[k] = v
    end
    for k, v in pairs(t2) do
        merged[k] = v
    end
    return merged
end

-- Function to deep copy a table
function M.deep_copy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[M.deep_copy(orig_key)] = M.deep_copy(orig_value)
        end
        setmetatable(copy, M.deep_copy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- Function to retrieve a value safely
function M.safe_get(table, key, default)
    if table[key] ~= nil then
        return table[key]
    else
        return default
    end
end

-- Function to split a string by a delimiter
function M.split_string(input, delimiter)
    local result = {}
    for match in (input..delimiter):gmatch('(.-)'..delimiter) do
        table.insert(result, match)
    end
    return result
end

return M
