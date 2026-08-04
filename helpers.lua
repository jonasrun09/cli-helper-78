--[[
    This module provides utility functions for
    string manipulation and data conversions.
]]

local helpers = {}

--- Checks if a string is a valid email address.
-- @param email string: The email address to verify.
-- @return boolean: True if valid, false otherwise.
function helpers.isValidEmail(email)
    local pattern = '^%S+@%S+%.%S+$'
    return email:match(pattern) ~= nil
end

--- Converts a string to a table of words.
-- @param str string: The input string to convert.
-- @return table: A table containing words from the string.
function helpers.stringToTable(str)
    local tbl = {}
    for word in str:gmatch('%S+') do
        table.insert(tbl, word)
    end
    return tbl
end

--- Capitalizes the first letter of each word in a string.
-- @param str string: The input string to capitalize.
-- @return string: The transformed string with capitalized words.
function helpers.capitalizeWords(str)
    return str:gsub('(%a)(%S*)', function(first, rest)
        return first:upper() .. rest:lower()
    end)
end

return helpers