local function validateInput(input)
    if type(input) ~= 'string' then
        return false, 'Input must be a string.'
    end
    if #input == 0 then
        return false, 'Input cannot be empty.'
    end
    return true
end

local function processInput(input)
    local isValid, errMsg = validateInput(input)
    if not isValid then
        print('Error: ' .. errMsg)
        return
    end
    print('Processing input: ' .. input)
    -- simulate some processing
end

local function main()
    print('Enter your input:')
    local userInput = io.read()
    processInput(userInput)
end

main()
