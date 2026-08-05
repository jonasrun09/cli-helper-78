--[[
    A simple helper module for common operations.
    @module helpers
]]

local helpers = {}

--- Adds two numbers together.
-- @param a number The first number.
-- @param b number The second number.
-- @return number The sum of a and b.
function helpers.add(a, b)
    return a + b
end

--- Subtracts the second number from the first.
-- @param a number The number to subtract from.
-- @param b number The number to be subtracted.
-- @return number The result of a minus b.
function helpers.subtract(a, b)
    return a - b
end

--- Checks if a number is even.
-- @param n number The number to check.
-- @return boolean True if n is even, false otherwise.
function helpers.is_even(n)
    return n % 2 == 0
end

--- Computes the factorial of a number.
-- @param n number The number to compute the factorial for.
-- @return number The factorial of n.
function helpers.factorial(n)
    if n < 0 then return nil end
    if n == 0 then return 1 end
    local result = 1
    for i = 1, n do
        result = result * i
    end
    return result
end

return helpers
