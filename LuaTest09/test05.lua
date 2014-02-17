local function hex(s)
    s = string.gsub(s,"(.)",function (x) return string.format("%02X",string.byte(x)) end)
    return s
end

local m = "0"


for n = 0, 10 do 
	print(hex(n))
end
print(hex(10))

-- print(string.format("%02X",string.byte())


local m = {4,5, 6, name = "dabing"}
for k , v in pairs(m) do
	print(k, v)
end

print(3/6)
print(math.floor(3 / 6))
print(math.ceil(3 / 6))

H = {}
tableTest = {m = 1}
setmetatable(tableTest, H)
H.__index = { a = 2}
print(tableTest.a)