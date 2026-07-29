local Config = {}

-- Load configurations from a file
function Config.load(file)
    local f, err = io.open(file, "r")
    if not f then
        error("Could not open file: " .. err)
    end
    local contents = f:read("*a")
    f:close()
    local config, loadErr = load(contents)
    if not config then
        error("Error loading config: " .. loadErr)
    end
    return config()
end

-- Validate the configuration
function Config.validate(data)
    if type(data) ~= "table" then
        error("Configuration data must be a table")
    end
    if not data.setting1 then
        error("Missing required setting: setting1")
    end
    if data.setting2 and type(data.setting2) ~= "number" then
        error("Invalid type for setting2: expected number")
    end
end

-- Save configurations to a file
function Config.save(file, data)
    local f, err = io.open(file, "w")
    if not f then
        error("Could not open file for writing: " .. err)
    end
    local success, saveErr = f:write(data)
    if not success then
        error("Error writing to file: " .. saveErr)
    end
    f:close()
end

return Config