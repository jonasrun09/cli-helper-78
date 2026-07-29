-- Logger with rotation implementation
local Logger = {}

-- Initialize the logger
function Logger:new(filename, max_size)
    local obj = { filename = filename, max_size = max_size, current_size = 0 }
    self.__index = self
    return setmetatable(obj, self)
end

-- Write log entry
function Logger:log(message)
    local size = string.len(message) + 1
    self.current_size = self.current_size + size
    if self.current_size > self.max_size then
        self:rotate()
    end
    local file = io.open(self.filename, "a+")
    file:write(os.date("%Y-%m-%d %H:%M:%S") .. " - " .. message .. "\n")
    file:close()
end

-- Rotate the log file
function Logger:rotate()
    local old_filename = self.filename .. ".old"
    os.rename(self.filename, old_filename)
    self.current_size = 0
end

return Logger
