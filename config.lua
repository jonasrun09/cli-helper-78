-- Configuration Loader with Defaults

local Config = {}

local defaults = {
    host = 'localhost',
    port = 8080,
    user = 'admin',
    password = 'password',
    enable_logging = true,
}

-- Loads configuration from a file and applies defaults
function Config.load(config_file)
    local config = {}
    local file = io.open(config_file, 'r')
    if file then
        for line in file:lines() do
            local key, value = line:match('^(%w+)=(.+)$')
            if key and value then
                config[key] = value
            end
        end
        file:close()
    end

    -- Merge defaults with loaded config
    for k, v in pairs(defaults) do
        if not config[k] then
            config[k] = v
        end
    end
    
    return config
end

return Config