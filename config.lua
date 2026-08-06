-- Configuration settings for cli-helper
local config = {
    timeout = 30,
    max_retries = 5,
    log_level = 'INFO',
    api_endpoint = 'https://api.example.com',
    features = {
        enable_caching = true,
        enable_debug = false,
    },
}

local function setLogLevel(level)
    if level == 'DEBUG' or level == 'INFO' or level == 'ERROR' then
        config.log_level = level
    else
        error('Invalid log level')
    end
end

local function getConfig()
    return config
end

local function updateTimeout(new_timeout)
    if new_timeout > 0 then
        config.timeout = new_timeout
    else
        error('Timeout must be positive')
    end
end

return {
    setLogLevel = setLogLevel,
    getConfig = getConfig,
    updateTimeout = updateTimeout,
}