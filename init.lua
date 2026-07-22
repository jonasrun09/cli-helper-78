-- Function to make a network request simulation
local function networkRequest()  
    if math.random() < 0.5 then  
        error("Network Error")  
    else  
        return "Success"  
    end  
end  

-- Function to implement retry logic
local function retryNetworkOperation(retries, delay)
    local attempts = 0  
    while attempts < retries do  
        attempts = attempts + 1  
        local success, result = pcall(networkRequest)  
        if success then  
            return result  
        else  
            print(string.format("Attempt %d failed: %s", attempts, result))  
            if attempts < retries then  
                print(string.format("Retrying in %d seconds...", delay))  
                os.execute("sleep " .. tonumber(delay))  
            end  
        end  
    end  
    return nil, "All attempts failed"  
end  

-- Starting point
local maxRetries = 5
local retryDelay = 2
local result = retryNetworkOperation(maxRetries, retryDelay)
if result then  
    print("Operation completed: " .. result)  
else  
    print("Final failure after retries")  
end