-- Simple network request function with retry logic

local http = require('socket.http')

local function retry_request(url, retries, delay)
    local attempts = 0
    local response, code

    while attempts < retries do
        response, code = http.request(url)
        if code == 200 then
            return response
        end
        attempts = attempts + 1
        print('Attempt ' .. attempts .. ' failed. Retrying in ' .. delay .. ' seconds...')
        os.execute('sleep ' .. delay)
    end
    return nil, 'Failed after ' .. retries .. ' attempts'
end

function fetch_data(url)
    local max_retries = 5
    local delay_between_retries = 2
    local data, err = retry_request(url, max_retries, delay_between_retries)
    if not data then
        print('Error fetching data: ' .. err)
    end
    return data
end

return {
    fetch_data = fetch_data,
}