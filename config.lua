-- Configuration loader with defaults
local json = require('json')

local ConfigLoader = {}
ConfigLoader.defaults = {}

-- Set default values
function ConfigLoader.setDefaults(defaults)
    for key, value in pairs(defaults) do
        ConfigLoader.defaults[key] = value
    end
end

-- Load configuration from specified file, merging with defaults
function ConfigLoader.load(filePath)
    local file, err = io.open(filePath, 'r')
    if not file then
        print('Error opening file: ' .. err)
        return ConfigLoader.defaults
    end
    local content = file:read('*a')
    file:close()

    local config, err = json.decode(content)
    if err then
        print('Error decoding JSON: ' .. err)
        return ConfigLoader.defaults
    end

    return setmetatable(config, {__index = ConfigLoader.defaults})
end

return ConfigLoader