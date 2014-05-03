OperationFactory = {}

Operation = {}

function Operation:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	o.NumberA = 0
	o.NumberB = 1
	return o
end

OperationAdd = Operation:new()

OperationSub = Operation:new()

OperationMul = Operation:new()

OperationDiv = Operation:new()

function OperationAdd:GetResult()
	if self.NumberA and self.NumberB then
		return self.NumberA + self.NumberB;
	else		
		return "error"
	end
end


function OperationSub:GetResult()
	if self.NumberA and self.NumberB then
		return self.NumberA - self.NumberB;
	else
		return "error"
	end
end


function OperationMul:GetResult()
	if self.NumberA and self.NumberB then
		return self.NumberA * self.NumberB;
	else
		return "error"
	end
end


function OperationDiv:GetResult()
	if self.NumberA and self.NumberB and self.NumberB~=0 then
		return self.NumberA / self.NumberB;
	else
		return "error"
	end
end



function OperationFactory : CreateOperation(oper)
	if oper == "+" then
		return OperationAdd:new()
	elseif oper == "-" then
		return OperationSub:new()
	elseif oper == "*" then
		return OperationMul:new()
	elseif oper == "/" then
		return OperationDiv:new()
	else
	end
end

Oper1 = OperationFactory:CreateOperation("+")
Oper1.NumberA = 10
Oper1.NumberB = 5
print(Oper1:GetResult())

Oper2 = OperationFactory:CreateOperation("-")
Oper2.NumberA = 10
Oper2.NumberB = 5
print(Oper2:GetResult())

Oper3 = OperationFactory:CreateOperation("*")
Oper3.NumberA = 10
Oper3.NumberB = 5
print(Oper3:GetResult())

Oper4 = OperationFactory:CreateOperation("/")
Oper4.NumberA = 10
Oper4.NumberB = 5
print(Oper4:GetResult())