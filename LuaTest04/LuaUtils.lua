-- Using the printf Function
function printf(format, ...)
    print(string.format(format, ...))
end

-- Counting the Number of Elements in a Table
function tableLen(theTable)
    local count = 0
    for k,v in pairs(theTable) do
        count = count + 1
    end
    return count
end

-- Using IsEmpty
function isEmpty(var)
    if var == nil then return true end

    local varType = type(var)
    if varType == "number" and var == 0 then
        return true
    elseif varType == "string" and #var == 0 then
        return true
    elseif varType == "table" and tableLen(var) == 0 then
        return true
    end
    return false
end

-- Knowing the Index of an Element
function indexOf(arrTable, theValue)
    for k,v in pairs(arrTable) do
        if v == theValue then
            return k
        end
    end
    return -1
end


-- Determining Whether a Table Is an Array
function isArray(arrTable)
    return #arrTable == tableLen(arrTable)
end


-- Setting Default Values
function foo(bar)
    if bar == nil then
        bar = "Untitled"
    end
    print("We got ", bar)
end


-- Performing a Deep Copy
function deepCopy(t)
    if type(t) ~= 'table' then
        return t
    end
    local mt = getmetatable(t)
    local res = {}
    for k,v in pairs(t) do
        if type(v) == 'table' then
            v = deepCopy(v)
        end
        res[k] = v
    end
    setmetatable(res, mt)
    return res
end


-- Copying Array Components
function copyList(t)
    local res = {}
    for i,v in ipairs(t) do
        res[i] = v
    end
    return res
end
