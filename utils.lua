local M = {}

function M.split(str, delimiter)
    if not delimiter or string.len(delimiter) == 0 then
        return { str }
    end
    local result = {}
    for match in (str..delimiter):gmatch("([^"]*),") do
        table.insert(result, match)
    end
    return result
end

function M.trim(s)
    return s:match("^%s*(.-)%s*$")
end

function M.shuffle(t)
    math.randomseed(os.time())
    for i = #t, 2, -1 do
        local j = math.random(i)
        t[i], t[j] = t[j], t[i]
    end
    return t
end

function M.is_empty(table)
    return next(table) == nil
end

function M.table_length(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

return M