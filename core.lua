-- Retry function for network operations
local function retry(func, attempts, delay)
    local status, result
    for i = 1, attempts do
        status, result = pcall(func)
        if status then
            return result
        end
        print(string.format("Attempt %d failed: %s", i, result))
        if i < attempts then
            os.execute(string.format("sleep %d", delay))
        end
    end
    error(string.format("All %d attempts failed.", attempts))
end

-- Sample network operation
local function networkOperation()
    -- Simulate a network request that may fail
    if math.random() < 0.7 then
        error("Network error encountered.")
    end
    return "Network request successful."
end

-- Usage of retry logic
local success, message = pcall(function()
    return retry(networkOperation, 5, 2)
end)

if success then
    print(message)
else
    print("Final error: " .. message)
end
