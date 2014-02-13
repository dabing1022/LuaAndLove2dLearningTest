--====================Person======================
local Person = {}
Person.attack = 5

function Person:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Person:setAttack(attack)
	self.attack = attack
end

function Person:getAttack()
	return self.attack
end


--====================Hero======================
local Hero = Person:new()
Hero.name = ""
Hero.skill = ""


--====================hero1,hero2======================
local hero1 = Hero:new({name = "金刚狼"})
hero1.name = "金刚狼"
hero1.skill = "甩开爪子切牛排"

local hero2 = Hero:new({name = "超人"})
hero2.skill = "内裤外穿走T台"


----====================================================
function printKeys(name, t)
	print("======================" .. name)
	for k, v in pairs(t) do
		print(k)
	end
end


printKeys("Person", Person)
printKeys("Person.__index", Person.__index)

printKeys("Hero", Hero)
printKeys("Hero.__index", Hero.__index)
printKeys("getmetatable(Hero).__index", getmetatable(Hero).__index)

printKeys("hero1", hero1)

printKeys("hero2", hero2)
