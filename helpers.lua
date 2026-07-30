--[[
    Helper functions for basic operations
    @module helpers
]]

local helpers = {}

---
-- Adds two numbers together
-- @number a First number
-- @number b Second number
-- @return number Sum of a and b
---
function helpers.add(a, b)
    return a + b
end

---
-- Subtracts the second number from the first
-- @number a First number
-- @number b Second number
-- @return number Result of a minus b
---
function helpers.subtract(a, b)
    return a - b
end

---
-- Multiplies two numbers together
-- @number a First number
-- @number b Second number
-- @return number Product of a and b
---
function helpers.multiply(a, b)
    return a * b
end

---
-- Divides the first number by the second
-- @number a Dividend
-- @number b Divisor
-- @return number Quotient of a and b
-- @raises error if b is zero
---
function helpers.divide(a, b)
    if b == 0 then
        error("Division by zero")
    end
    return a / b
end

return helpers