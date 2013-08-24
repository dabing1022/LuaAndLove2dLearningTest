require("LuaUtils")

local boys = 5
local girls = 3
local className = "Math"
printf("There are %d boys and %d girls in the %s class", boys, girls, className)

-- table aren't always arrays or a count viriable
local t = {3, 4, 2, one = "dabing"}
print(#t)
print(tableLen(t))
print(isEmpty(t))

print(indexOf(t, 2))
print(indexOf(t, 22))
print("t is array?", isArray(t))

print(foo(a))


print("-------------")
function newCounter()
    local i = 0
    return function()
        i = i + 1
        return i
    end
end

c1 = newCounter()
print(c1)
print(c1())
print(c1())

print("-------------")
function list_iter(t)
    local i = 0
    local n = tableLen(t)
    return function()
        i = i + 1
        if i <= n then
            return t[i]
        end
    end
end

iter = list_iter(t)
while true do
    local element = iter()
    if element == nil then break end
    print(element)
end

print("****************************")
a = 5
b = 6
a, b = b, a 
print("a : ", a)
print("b : ", b)
