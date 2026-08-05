local defaults = {
    database = {
        host = 'localhost',
        port = 3306,
        user = 'root',
        password = '',
        dbname = 'test'
    },
    server = {
        host = '0.0.0.0',
        port = 8080
    },
    logging = {
        level = 'info',
        file = 'app.log'
    }
}

local function loadConfig(customConfig)
    if customConfig == nil then
        return defaults
    end

    local config = {}

    for key, value in pairs(defaults) do
        config[key] = customConfig[key] or value
    end

    return config
end

return {
    loadConfig = loadConfig
}