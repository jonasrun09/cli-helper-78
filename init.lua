-- Simple CLI Helper Initialization

local function greetUser(name)
    print("Welcome, " .. name .. "!")
end

local function farewellUser(name)
    print("Goodbye, " .. name .. "!")
end

local function parseArgs()
    local args = {...}
    return args
end

local function main()
    local args = parseArgs()
    if #args == 0 then
        print("Please provide your name.")
        return
    end
    greetUser(args[1])
    -- Perform other actions here
    farewellUser(args[1])
end

main()