Factory = {}
Operation = {}
function Factory:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o;
end

function Operation:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o;
end



OperationAdd = Operation:new()

function OperationAdd:GetResult()
	if self.NumberA and self.NumberB then
		return self.NumberA + self.NumberB;
	else
		return "error"
	end
end


FactoryAdd = Factory:new()

function FactoryAdd:CreateOperation()
	return OperationAdd:new()
end

OperationSub = Operation:new()

function OperationSub:GetResult()
	if self.NumberA and self.NumberB then
		return self.NumberA - self.NumberB;
	else
		return "error"
	end
end


FactorySub = Factory:new()

function FactorySub:CreateOperation()
	return OperationSub:new()
end

OperationMul = Operation:new()

function OperationMul:GetResult()
	if self.NumberA and self.NumberB then
		return self.NumberA * self.NumberB;
	else
		return "error"
	end
end


FactoryMul = Factory:new()

function FactoryMul:CreateOperation()
	return OperationMul:new()
end

OperationDiv = Operation:new()

function OperationDiv:GetResult()
	if self.NumberA and self.NumberB then
		return self.NumberA / self.NumberB;
	else
		return "error"
	end
end


FactoryDiv = Factory:new()

function FactoryDiv:CreateOperation()
	return OperationDiv:new()
end



operAddFactory = FactoryAdd:new()			--定义一个工厂对象

operAdd = operAddFactory:CreateOperation()

operAdd.NumberA = 10

operAdd.NumberB = 5

print("Add:"..operAdd:GetResult())

operSubFactory = FactorySub:new()			--定义一个工厂对象

operSub = operSubFactory:CreateOperation()

operSub.NumberA = 10

operSub.NumberB = 5

print("Sub:"..operSub:GetResult())

operMulFactory = FactoryMul:new()			--定义一个工厂对象

operMul = operMulFactory:CreateOperation()

operMul.NumberA = 10

operMul.NumberB = 5

print("Mul:"..operMul:GetResult())

operDivFactory = FactoryDiv:new()			--定义一个工厂对象

operDiv = operDivFactory:CreateOperation()

operDiv.NumberA = 10

operDiv.NumberB = 5

print("Div:"..operDiv:GetResult())

--[[	**************新添加的'%'操作***************	]]--

OperationMod = Operation:new()

function OperationMod:GetResult()
	if self.NumberA and self.NumberB then
		return self.NumberA % self.NumberB;
	else
		return "error"
	end
end


FactoryMod = Factory:new()

function FactoryMod:CreateOperation()
	return OperationMod:new()
end

operModFactory = FactoryMod:new()			--定义一个工厂对象

operMod = operModFactory:CreateOperation()

operMod.NumberA = 10

operMod.NumberB = 5

print("Mod:"..operDiv:GetResult())
