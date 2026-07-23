local function validateInput(input)
    if type(input) ~= 'string' then
        return false, 'Input must be a string'
    elseif #input < 1 then
        return false, 'Input cannot be empty'
    end
    return true
end

local function processInput()
    while true do
        io.write('Enter input (or type exit to quit): ')
        local userInput = io.read()
        if userInput == 'exit' then
            print('Exiting...')
            break
        end
        local isValid, errorMessage = validateInput(userInput)
        if not isValid then
            print('Error:', errorMessage)
        else
            print('Processing:', userInput)
            -- Add processing logic here
        end
    end
end

processInput()