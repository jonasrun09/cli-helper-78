local lfs = require('lfs')

local Log = {}
Log.__index = Log

function Log:new(logFile, maxSize, maxFiles)
    local obj = setmetatable({}, self)
    obj.logFile = logFile or 'app.log'
    obj.maxSize = maxSize or 5 * 1024 * 1024  -- 5 MB default
    obj.maxFiles = maxFiles or 5
    return obj
end

function Log:write(message)
    local file = io.open(self.logFile, 'a')
    if file then
        local currentSize = file:seek('end')
        if currentSize >= self.maxSize then
            self:rotateLogs()
        end
        file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
        file:close()
    end
end

function Log:rotateLogs()
    for i = self.maxFiles - 1, 1, -1 do
        local oldName = self.logFile .. '.' .. i
        local newName = self.logFile .. '.' .. (i + 1)
        if lfs.attributes(oldName) then
            os.rename(oldName, newName)
        end
    end
    local newLog = self.logFile .. '.1'
    os.rename(self.logFile, newLog)
end

return Log