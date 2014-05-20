--原型模式可分为深复制和浅复制，下面以深复制为例

Prototype = {}

function Prototype:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o
end

function Prototype:Clone()
	return self:new()
end

proto = Prototype:new()

proto.val = 10

cloneproto = proto:Clone()

print("输出:"..cloneproto.val)

cloneproto.val = 20

print("proto val is " .. proto.val)

