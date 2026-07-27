-- Retry logic for network operations in Lua

local function networkRequest(url)
    -- Placeholder for actual network request logic (e.g. using socket library)
    return math.random() < 0.7 -- Simulates a failure 30% of the time
end

local function retryNetworkOperation(url, maxRetries, delay)
    local tryCount = 0
    local success, result

    while tryCount < maxRetries do
        tryCount = tryCount + 1
        success, result = pcall(networkRequest, url)

        if success and result then
            return result
        end
        print(string.format("Attempt %d failed, retrying in %d seconds...", tryCount, delay))
        os.execute(string.format("sleep %d", delay)) -- Simple sleep function, replace with appropriate delay logic
    end
    error("All attempts failed after " .. tryCount .. " retries")
end

-- Example usage
local url = "http://example.com"
local maxRetries = 5
local delay = 2

local function run()
    local successResult = retryNetworkOperation(url, maxRetries, delay)
    print("Operation succeeded with result: " .. tostring(successResult))
end

run()