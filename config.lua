-- Configuration settings for the CLI helper
local config = {
    version = "1.0.0",
    author = "Lua Developer",
    settings = {
        debug = false,
        maxAttempts = 5,
        timeout = 30,
    },
    endpoints = {
        apiUrl = "https://api.example.com/v1/",
        anotherService = "https://another.service/api/"
    }
}

-- Function to get a configuration value
local function getConfigValue(key)
    return config[key] or nil
end

-- Function to set a configuration value
local function setConfigValue(key, value)
    if config[key] ~= nil then
        config[key] = value
    else
        error("Invalid configuration key: " .. key)
    end
end

return {
    get = getConfigValue,
    set = setConfigValue,
    author = config.author,
    version = config.version
}