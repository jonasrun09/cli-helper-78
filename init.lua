-- Simple Lua HTTP client with retry logic
local http = require('socket.http')

local function request_with_retry(url, max_retries)
    local attempts = 0
    local response, status

    while attempts < max_retries do
        attempts = attempts + 1
        response, status = http.request(url)
        if status == 200 then
            return response
        end
        print('Attempt ' .. attempts .. ' failed with status: ' .. status)
        if attempts < max_retries then
            os.execute('sleep 1')  -- wait before retrying
        end
    end
    error('Failed to get a successful response after ' .. max_retries .. ' attempts')
end

-- Example usage:
local url = 'http://example.com'
local result = request_with_retry(url, 3)
print(result)
