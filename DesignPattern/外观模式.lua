--[[
优点：	外观模式的目的不是给子系统添加新的功能接口，
	而是为了让外部减少与子系统内多个模块的交互，
	松散耦合，从而让外部能够更简单的使用子系统。
	当然，这是一把双刃剑。
缺点：	不能很好地限制客户端直接使用子系统类，
	如果对客户端访问子系统类做太多的限制则减少了
	可变性和灵活性。
	下面外部只与Facade交互，而Facade与System交互，
	从而达到上述的优点。
]]--

System = {}

function System:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o;
end

SubSystemOne = System:new()

function SubSystemOne:MethodOne()
	print("调用子系统一的方法一")
end

function SubSystemOne:MethodTwo()
	print("调用子系统一的方法二")
end

function SubSystemOne:MethodThree()
	print("调用子系统一的方法三")
end

SubSystemTwo = System:new()

function SubSystemTwo:MethodOne()
	print("调用子系统二的方法一")
end

function SubSystemTwo:MethodTwo()
	print("调用子系统二的方法二")
end

SubSystemThree = System:new()

function SubSystemThree:MethodOne()
	print("调用子系统三的方法一")
end

Facade = {}
function Facade:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	o.one = SubSystemOne:new()
	o.two = SubSystemTwo:new()
	o.three = SubSystemThree:new()
	return o;
end

function Facade:MethodOne()
	self.one:MethodOne()
	self.one:MethodThree()
	self.two:MethodTwo()
end

function Facade:MethodTwo()
	self.one:MethodTwo()
	self.two:MethodOne()
	self.three:MethodOne()
end

function Facade:MethodThree()
	self.one:MethodOne()
	self.two:MethodOne()
	self.three:MethodOne()
end

facade = Facade:new()

facade:MethodOne()

