-- Lua configuration loader with defaults

local Config = {}

-- Default configuration values
Config.defaults = {
    settingA = true,
    settingB = 42,
    settingC = "default value",
}

-- Function to load configuration from a file or use defaults
function Config.load(filename)
    local config = Config.defaults
    local file = io.open(filename, "r")

    if file then
        local content = file:read("*a")
        file:close()
        local loadedConfig = load("return " .. content)()

        if type(loadedConfig) == "table" then
            config = setmetatable(loadedConfig, {__index = Config.defaults})
        end
    end
    return config
end

return Config
