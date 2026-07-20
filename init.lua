-- Initialize the CLI application

local function printWelcomeMessage()
    print("Welcome to CLI Helper 78!")
end

local function parseArguments(args)
    local opts = {}
    for i = 1, #args do
        local arg = args[i]
        if arg:sub(1, 2) == '--' then
            local key = arg:sub(3)
            opts[key] = true
        else
            table.insert(opts, arg)
        end
    end
    return opts
end

local function executeCommand(command)
    if command == "help" then
        print("Available commands: help, exit")
    elseif command == "exit" then
        print("Exiting application...")
        os.exit(0)
    else
        print("Unknown command: " .. command)
    end
end

local function main(args)
    printWelcomeMessage()
    local options = parseArguments(args)
    for _, command in ipairs(options) do
        executeCommand(command)
    end
end

main(arg)
