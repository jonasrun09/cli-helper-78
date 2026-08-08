--[[
  Configuration module for managing application settings.
  @module config
--]]

local config = {}

--[[
  Sets the value of a configuration setting.
  @param key (string): The configuration key.
  @param value (any): The new value for the configuration.
--]]
function config.set(key, value)
    if type(key) ~= 'string' then
        error('Key must be a string')
    end
    config[key] = value
end

--[[
  Gets the value of a configuration setting.
  @param key (string): The configuration key.
  @return (any): The value of the configuration setting.
--]]
function config.get(key)
    if type(key) ~= 'string' then
        error('Key must be a string')
    end
    return config[key]
end

--[[
  Merges another config table into the current one.
  @param other (table): The table to merge.
--]]
function config.merge(other)
    if type(other) ~= 'table' then
        error('Argument must be a table')
    end
    for k, v in pairs(other) do
        config[k] = v
    end
end

--[[
  Returns the entire configuration table.
  @return (table): The current configuration table.
--]]
function config.getAll()
    return config
end

return config
