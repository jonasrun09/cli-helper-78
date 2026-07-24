-- Function to simulate a division
function safeDivide(num, denom)
    -- Error handling for edge cases
    if type(num) ~= 'number' or type(denom) ~= 'number' then
        return 'Error: both arguments must be numbers'
    elseif denom == 0 then
        return 'Error: division by zero is undefined'
    else
        return num / denom
    end
end

-- Function to process input and catch failures
function processInput(input)
    local result = safeDivide(input.num, input.denom)
    if type(result) == 'string' then
        return result  -- Return error message
    end
    return 'Result: ' .. result
end

-- Examples to demonstrate the function
print(processInput({num = 10, denom = 2}))  -- Should output 5
print(processInput({num = 10, denom = 0}))  -- Should output division by zero error
print(processInput({num = 'a', denom = 2}))  -- Should output argument error
print(processInput({num = 10}))  -- Should output missing denom error