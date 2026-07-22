-- Simple Logger Setup with Rotation
local lfs = require('lfs')

local Logger = {}
Logger.__index = Logger

function Logger:new(log_dir, max_size, max_files)
    local self = setmetatable({}, Logger)
    self.log_dir = log_dir or '.'
    self.max_size = max_size or 1024 * 1024 -- 1MB
    self.max_files = max_files or 5
    self.current_log_file = self.log_dir .. '/log.txt'
    return self
end

function Logger:log(message)
    local log_file = io.open(self.current_log_file, 'a')
    log_file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
    log_file:close()
    self:check_rotation()
end

function Logger:check_rotation()
    local file_size = lfs.attributes(self.current_log_file, 'size')
    if file_size and file_size >= self.max_size then
        self:rotate_logs()
    end
end

function Logger:rotate_logs()
    for i = self.max_files, 1, -1 do
        local old_file = self.log_dir .. '/log.' .. i .. '.txt'
        local new_file = self.log_dir .. '/log.' .. (i + 1) .. '.txt'
        if lfs.attributes(old_file) then
            os.rename(old_file, new_file)
        end
    end
    os.rename(self.current_log_file, self.log_dir .. '/log.1.txt')
end

return Logger