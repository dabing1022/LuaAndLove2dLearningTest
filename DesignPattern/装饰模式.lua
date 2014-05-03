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
	print("最后衬衫")
	if self.component ~= nil then
		self.component:Show()
	end
end



Trouser = Decorator:new()

function Trouser:Show()
	print("然后裤子")
	if self.component ~= nil then
		self.component:Show()
	end
end

Shoe = Decorator:new()

function Shoe:Show()
	print("先穿鞋子")
	if self.component ~= nil then
		self.component:Show()
	end
end

person = Person:new()

shirt = Shirt:new()
shirt:Decorate(person)

trouser = Trouser:new()
trouser:Decorate(shirt)

shoe = Shoe:new()
shoe:Decorate(trouser)
shoe:Show()
