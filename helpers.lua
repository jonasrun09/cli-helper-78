-- Simple configuration loader with defaults
local json = require('json')

local ConfigLoader = {}

function ConfigLoader.load(filepath, defaults)
    local file = io.open(filepath, 'r')
    if not file then
        return defaults  -- Return defaults if file doesn't exist
    end
    local content = file:read('*a')
    file:close()
    local config
    
    -- Attempt to decode JSON file
    local success, result = pcall(json.decode, content)
    if success then
        config = result
    else
        config = defaults  -- Fallback to defaults on error
    end
    
    -- Merge defaults with loaded config
    for key, value in pairs(defaults) do
        if config[key] == nil then
            config[key] = value
        end
    end
    
    return config
end

return ConfigLoader
