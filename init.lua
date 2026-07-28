local function handleError(err)
    print("Error: " .. tostring(err))
    os.exit(1)
end

local function safeDiv(a, b)
    if b == 0 then
        handleError("Division by zero")
    end
    return a / b
end

local function parseInput(input)
    local num = tonumber(input)
    if not num then
        handleError("Invalid number: " .. tostring(input))
    end
    return num
end

local function processInput(input1, input2)
    local a = parseInput(input1)
    local b = parseInput(input2)
    return safeDiv(a, b)
end

local args = {...}
if #args ~= 2 then
    handleError("Two arguments required")
end

local result = processInput(args[1], args[2])
print("Result: " .. result)
