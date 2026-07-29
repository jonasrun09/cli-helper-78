--[[
    Configuration settings for the application.

    @module config
]]--

local config = {}

---@type string
local appName = "cli-helper-78"

---@type string
local appVersion = "1.0.0"

---@type boolean
local debugMode = false

---@type table<string, any>
config.settings = {
    theme = "dark",
    language = "en",
    timeout = 30
}

---@type function
---@param level string
---@param message string
---@return nil
function config.log(level, message)
    if debugMode then
        print(string.format("[%s] %s: %s", level, appName, message))
    end
end

---@function
---@return table
function config.getAppInfo()
    return {
        name = appName,
        version = appVersion
    }
end

return config
