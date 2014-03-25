local function search(k, tables)
	for i, v in ipairs(tables) do
		if v[k] then
			return v[k]
		end
	end
	return nil
end

-- 这里实现多重继承，参数arg为多重父类表
function createClassFrom(...)
	-- c为返回值的目标表，为实现多重继承的子类表
	local c = {}	
	local parents = {...}
	setmetatable(c, {__index = function(t, k)
		return search(k, parents)
	end})

	function c:new(o)
		o = o or {}
		setmetatable(o, {__index = c})
		return o
	end

	return c
end

-- 人 吃饭
Human = {name = "human"}
function Human:eat()
	print("human eat")
end

-- 程序员 写代码
Programmer = {name = "coder"}
function Programmer:doProgramming()
	print("do coding")
end

-- 女程序员 继承 人和程序员
-- 性别女
FemaleProgrammer = createClassFrom(Human, Programmer)
local femaleCoder = FemaleProgrammer:new({sex = "female"})
femaleCoder:eat() -- human eat
femaleCoder:doProgramming() -- do coding

local Test = { }
Test.prototype = { group = "quick", 
				   qq = "284148017", 
				   company = "chukong", 
				   getName = function() return "Just a test" end}

function Test:new(o)
	o = o or {}
	setmetatable(o, {__index = function(table, key)
		return Test.prototype[key]
	end})
	return o
end

local a = Test:new()
print(a:getName()) -- Just a test
print(a.qq) -- 284148017
print(a.company) -- chukong