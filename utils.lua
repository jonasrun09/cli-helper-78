-- Utility functions for various tasks

local M = {}

-- Function to trim whitespace from both ends of a string
function M.trim(s)
    return s:match("^%s*(.-)%s*$")
end

-- Function to split a string by a delimiter
function M.split(s, delimiter)
    local result = {}
    for match in (s..delimiter):gmatch("(.-)