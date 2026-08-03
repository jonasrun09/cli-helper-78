-- Logger setup with rotation
local lfs = require('lfs')
local logFile = 'app.log'
local maxSize = 1024 * 1024 * 5  -- 5 MB

local function logRotate()  
    if lfs.attributes(logFile) and lfs.attributes(logFile).size > maxSize then  
        os.rename(logFile, logFile .. '.' .. os.date('%Y%m%d%H%M%S'))  
    end
end

local function logMessage(level, message)
    logRotate()
    local f = io.open(logFile, 'a')
    if f then
        f:write(string.format('%s [%s]: %s\n', os.date('%Y-%m-%d %H:%M:%S'), level, message))
        f:close()
    end
end

return {  
    info = function(msg) logMessage('INFO', msg) end,  
    warn = function(msg) logMessage('WARN', msg) end,  
    error = function(msg) logMessage('ERROR', msg) end  
}