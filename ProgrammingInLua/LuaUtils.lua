function printf(format, ...)
	print(string.format(format, ...))
end

function tableLen(theTable)
	local count = 0
	for i, j in ipairs(theTable) do
		count = count + 1
	end	

	return count
end

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

function indexOf(arrTable, theValue)
	for k, v in pairs(arrTable) do
		if v == theValue then
			return k
		end
	end
end

function isArray(arrTable)
	return #arrTable == tableLen(arrTable)
end

function readonlyTable(theTable)
  return setmetatable({}, {
    __index = table,
    __newindex = function (table, key, value)
      --Do not update or create the key with the value
    end,
    __metatable = false
	}) 
end

local test = readonlyTable({
	name = "ChildhoodAndy",
	blog = "http://childhood.logdown.com",
	age = 0,
})

print(test.name)
test.age = 100
print(test.age)

--------------Using Varargs
function passvarargs(...)
	local a, b = ...
	print(a, b)
end

passvarargs(100, 200)
passvarargs(100, 300, 200)


---------------
function test(name)
	print(name)
end

local test2 = test

function test(name, name2)
	return test2(name, name2)
end

test("11", "22")