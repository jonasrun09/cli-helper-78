-- Helper function to read a file
local function readFile(filePath)
    local file = io.open(filePath, "r")
    if not file then
        return nil, "Could not open file: " .. filePath
    end
    local content = file:read("*a")
    file:close()
    return content
end

-- Helper function to write to a file
local function writeFile(filePath, content)
    local file = io.open(filePath, "w")
    if not file then
        return nil, "Could not open file: " .. filePath
    end
    file:write(content)
    file:close()
    return true
end

-- Helper function to split a string
local function splitString(str, separator)
    local result = {}
    for match in (str .. separator):gmatch("(.-)" .. separator) do
        table.insert(result, match)
    end
    return result
end

return { readFile = readFile, writeFile = writeFile, splitString = splitString }