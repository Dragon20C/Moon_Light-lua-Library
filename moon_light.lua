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
function math.lerp(start_v,end_v,percent)
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

-- Converts inputs into intergers
function Input_axis(key)
    if love.keyboard.isDown(key) then
      return 1
    end
    return 0
  end

-- Gets a position outside a rectangle
function GetPositionOutsideRect(x, y, width, height)
    -- Calculate half the width and height of the rectangle
    local halfWidth = width / 2
    local halfHeight = height / 2
    
    -- Calculate a random angle in degrees
    local angle = math.rad(love.math.random(360))
    
    -- Calculate the x and y components of a vector with length equal to the diagonal of the rectangle
    local diagonalLength = math.sqrt(halfWidth ^ 2 + halfHeight ^ 2)
    local vecX = diagonalLength * math.cos(angle)
    local vecY = diagonalLength * math.sin(angle)
    
    -- Calculate the x and y positions outside the rectangle
    local posX = x + vecX
    local posY = y + vecY
    
    -- Return the result as a table with x and y values
    return {x = posX, y = posY}
  end

-- Finds the distance between two points, note both args are tables
function Get_Distance(objA, objB)
    -- Get the length for each of the components x and y
    local xDist = objB.x - objA.x
    local yDist = objB.y - objA.y

    return math.sqrt( (xDist ^ 2) + (yDist ^ 2) )
end

-- This function first finds the angle between two points which are tables with x,y positions and a offset value which offsets it from pointA
function Angle_offset(pointA, pointB, offsetDistance)
    local dx = pointB.x - pointA.x
    local dy = pointB.y - pointA.y
    
    local angle = math.atan2(dy, dx)
    
    local offsetX = offsetDistance * math.cos(angle)
    local offsetY = offsetDistance * math.sin(angle)
    
    local offsetPoint = { x = pointA.x + offsetX, y = pointA.y + offsetY }
    
    return offsetPoint
  end

-- Finds the closets targets that are in a table and returns the x and y position of it.
function Find_target(Center_position,group_targets,max_distance)
    local dist_val = max_distance or 500
    local lowest = {x = 0, y = 0}
    for _, target in ipairs(group_targets) do
      
      if Get_Distance(Center_position,target) < dist_val then
        dist_val = Get_Distance(Center_position,target)
        lowest.x, lowest.y = target.x,target.y
      end
    end
    return {x = lowest.x,y = lowest.y}
  end

return moon_light
