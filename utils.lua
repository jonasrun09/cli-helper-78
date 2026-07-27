local lfs = require('lfs')

local Logger = {}
Logger.__index = Logger

function Logger:new(logDir, maxSize)
    local instance = setmetatable({}, self)
    instance.logDir = logDir or './logs'
    instance.maxSize = maxSize or 1048576 -- 1MB
    instance:setup()
    return instance
end

function Logger:setup()
    if not lfs.attributes(self.logDir) then
        lfs.mkdir(self.logDir)
    end
    self.logFilePath = self.logDir .. '/log.txt'
    self:checkRotation()
end

function Logger:checkRotation()
    local file = io.open(self.logFilePath, 'a+')
    if file then
        file:seek('end')
        local size = file:seek('cur')
        file:close()
        if size >= self.maxSize then
            os.rename(self.logFilePath, self.logDir .. '/log_' .. os.date('%Y%m%d%H%M%S') .. '.txt')
        end
    end
end

function Logger:log(message)
    self:checkRotation()
    local file = io.open(self.logFilePath, 'a')
    file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
    file:close()
end

return Logger