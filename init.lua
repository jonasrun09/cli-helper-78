-- Simple configuration loader with defaults

local function load_config(custom_config)
    local default_config = {
        theme = "light",
        language = "en",
        timeout = 30
    }

    if not custom_config then
        return default_config
    end

    for key, value in pairs(custom_config) do
        if default_config[key] ~= nil then
            default_config[key] = value
        end
    end

    return default_config
end

-- Example usage
local config_from_file = {
    theme = "dark",
    timeout = 60
}

local final_config = load_config(config_from_file)

-- Print the final configuration
for key, value in pairs(final_config) do
    print(key .. ": " .. tostring(value))
end
