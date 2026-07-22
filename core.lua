-- Core module for CLI helper

local M = {}

-- Function to generate a list of Fibonacci numbers
-- This version uses memoization for performance optimization
local function fibonacci(n, memo)
    memo = memo or {}
    if n <= 1 then return n end
    if memo[n] then return memo[n] end
    memo[n] = fibonacci(n - 1, memo) + fibonacci(n - 2, memo)
    return memo[n]
end

-- Function to generate a Fibonacci sequence
function M.generate_fibonacci_sequence(limit)
    local result = {}
    for i = 0, limit - 1 do
        table.insert(result, fibonacci(i))
    end
    return result
end

-- Function to print the Fibonacci sequence
function M.print_fibonacci_sequence(limit)
    local sequence = M.generate_fibonacci_sequence(limit)
    for _, num in ipairs(sequence) do
        io.write(num .. ' ')
    end
    print()  -- New line at the end
end

return M