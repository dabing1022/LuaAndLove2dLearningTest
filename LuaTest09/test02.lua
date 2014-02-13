--
-- Author: ChildhoodAndy
-- Date: 2013-11-03 11:34:53
--

local t = {["name"] = true, ["age"] = true, ["sex"] = true}


local m = t
local m2 = m 
m = nil
print(m2)
print(t)



local t1 = {a = 1, b = 2}
local t2 = t1
t2.a = 3
print(t1.a)

local t1 = {a = 1, b = 2}
local t2 = t1
t2.b = 3 
print(t1.b)

local t1 = {a = 1, b = 2}
local t2 = t1
t1 = nil
print(t2.b)


local test = {name="dabing", age = 10}
print(test.name)
print(test.sex)


print("--------------test args")
local z = {5, 6}
local args = {5, 6}
print(#args)

local mm = {["a"] = 1, ["b"] = 2}
print(mm)