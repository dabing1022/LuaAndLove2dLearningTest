local time = os.time()
print(time)
local date = os.date("%H", time)
local dateNum = tonumber(date)
print(type(date))
print(type(dateNum))
print(date)

-- test unpack
a = {test = 1, test = 2}
b = {1, 2}
c = {1, 2, test = 1}
print(unpack(a))
print(unpack(b))
print(unpack(c))

local a1, a2, a3, a4 = unpack{1,2,4,5}
print(a1)
print(a2)
print(a3)
print(a4)
print("============")
a = {{m1 = 1, m2 = 2}, {m1 = 4, m2 = 4}}
table.sort(a,function(a , b ) return a.m1 < b.m1 end)

for i, v in pairs(a) do
	print(v)
end