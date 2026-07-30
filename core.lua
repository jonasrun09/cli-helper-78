-- Utility function to handle various data types and format them as needed

local function formatData(data)
    local formatted = ''
    if type(data) == 'table' then
        for k, v in pairs(data) do
            formatted = formatted .. k .. ': ' .. (type(v) == 'table' and formatData(v) or tostring(v)) .. '\n'
        end
    elseif type(data) == 'string' then
        formatted = data
    elseif type(data) == 'number' then
        formatted = tostring(data)
    else
        formatted = 'Unsupported type'
    end
    return formatted
end

function printFormattedData(data)
    local output = formatData(data)
    print(output)
end

return { printFormattedData = printFormattedData }