-- Retry logic for network operations

local function sleep(seconds)
    local start = os.clock()
    while os.clock() - start < seconds do end
end

local function perform_network_operation() 
    -- Simulating a network operation with random error
    if math.random() > 0.7 then
        return true, 'Success'
    else
        return false, 'Network Error'
    end
end

local function retry_operation(max_attempts) 
    local attempts = 0
    local success, message

    while attempts < max_attempts do
        success, message = perform_network_operation()
        if success then
            return message
        else
            print('Attempt ' .. (attempts + 1) .. ': ' .. message)
            attempts = attempts + 1
            sleep(1) -- waiting before next attempt
        end
    end
    return 'Failed after ' .. max_attempts .. ' attempts'
end

-- Main execution
local result = retry_operation(5)
print(result)
