Person = {}

Decorator = {}

function Person:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o;
end

function Person:Show()
	print("我是人")
end

Decorator = Person:new{component = nil}

function Decorator:Decorate(com)
	self.component = com
end

function Decorator:Show()
	print("我是装饰者")
end

Shirt = Decorator:new()


function Shirt:Show()
	if self.component ~= nil then
		self.component:Show()
	end
	print("先穿衬衫")
end



Trouser = Decorator:new()

function Trouser:Show()
	if self.component ~= nil then
		self.component:Show()
	end
	print("然后裤子")
end

Shoe = Decorator:new()

function Shoe:Show()
	if self.component ~= nil then
		self.component:Show()
	end
	print("最后穿鞋子")
end

person = Person:new()

shirt = Shirt:new()
shirt:Decorate(person)

trouser = Trouser:new()
trouser:Decorate(shirt)

shoe = Shoe:new()
shoe:Decorate(trouser)
shoe:Show()
