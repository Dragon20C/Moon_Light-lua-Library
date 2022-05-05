local moon_light = {}


-- Clamp function
function math.Clamp(number,min,max)
    return math.min(math.max(number, min), max)
end

-- Changes a table of strings so that table.string can be used instead of numbers
function enum(tbl)
    local length = #tbl
    for i = 1, length do
        local v = tbl[i]
        tbl[v] = i
    end
    
    return tbl

end

-- turn number into a percentage out of max_value
function Get_percentage(current_value,max_value)
    return (current_value / max_value) * 100 .. "%"
end

-- Find the percentage amount of a number for example current_value = 50, and find value is 50 answer is 25 since thats halth of 50.
function Find_percentage(percent, of_value)
    return (percent / 100) * of_value
    
end

-- Find middle point between two positions
function math.Mid_point(A_X,A_Y,B_X,B_Y)
    return {((A_X + B_X) / 2), ((A_Y + B_Y) / 2)}
end

-- Check if number is even
function math.Is_even(number)
    return number%2 == 0
end

-- Linear Interpolation function
function math.Lerp(start_v,end_v,percent)
    return start_v + (end_v - start_v) * percent
end

-- Pow returns the base to the exponent power, as in base^exponent
function math.Pow(x,y)
    return x^y
end

-- Round number by amount of numbers after decimal
function math.Round(x, n)
    n = math.Pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5)
    end
    return x / n
end

-- Maps a value to a different range, example value = 0.5, min = 0 max = 1, out_min = 0 out_max = 100 output = 50
function math.Map(value,value_min,value_max,out_min,out_max)
        return (value - value_min) * (out_max - out_min) / (value_max - value_min) + out_min
end

-- Normalize two numbers
function math.Normalize(x,y)
    local l=(x*x+y*y)^.5
    if l==0 then
        return 0,0,0
    else
        return x/l,y/l,l
    end
end

-- Copy a table
function table.copy(t)
    local u = { }
    for k, v in pairs(t) do u[k] = v end
    return setmetatable(u, getmetatable(t))
end

-- Check current operating system
function Check_os()
    local BinaryFormat = package.cpath:match("%p[\\|/]?%p(%a+)")
    if BinaryFormat == "dll" then
        return "Windows"
    elseif BinaryFormat == "so" then
        return "Linux"
    elseif BinaryFormat == "dylib" then
        return "MacOS"
    end
    BinaryFormat = nil
end

return moon_light