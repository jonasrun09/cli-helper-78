-- Helper functions for common operations

local M = {}

-- Function to check if a value is in a table
function M.contains(table, value)
    for _, v in ipairs(table) do
        if v == value then return true end
    end
    return false
end

-- Function to merge two tables
function M.merge(t1, t2)
    local merged = {}
    for k, v in pairs(t1) do
        merged[k] = v
    end
    for k, v in pairs(t2) do
        merged[k] = v
    end
    return merged
end

-- Function to create a deep copy of a table
function M.deep_copy(original)
    local copy
    if type(original) == 'table' then
        copy = {}
        for k, v in pairs(original) do
            copy[M.deep_copy(k)] = M.deep_copy(v)
        end
        setmetatable(copy, M.deep_copy(getmetatable(original)))
    else -- number, string, boolean, etc
        copy = original
    end
    return copy
end

-- Function to generate a random integer between a min and max value
function M.random_int(min, max)
    math.randomseed(os.time())
    return math.random(min, max)
end

-- Function to format a string with placeholders
function M.format_string(str, tab)
    return (str:gsub('%%(%w+)', function(key) return tostring(tab[key]) or '' end))
end

return M