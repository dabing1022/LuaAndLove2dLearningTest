a = {{1, 2, 3, 4, 5}, {6, 7, 8, 9, 10}}
function test(t)
	for row = 1, #t do
		for col = 1, #t[row] do
			local loc = (row - 1) * #t[row] + col
			print(t[row][col] .. "=========" .. loc)
		end
	end
end

test(a)

local printResult = ""
function myPrint(...)
   	print("#arg is " .. #arg)
	for i,v in ipairs(arg) do
		printResult = printResult .. tostring(v) .. "\t"
  	end
   	printResult = printResult .. "\n"
   	print(printResult)
end

myPrint({"11", "22","33"})
print()

local m = {}
m.a = 2
function m:test()
	local t = m.a
	return t
end

local h = m:test()
print(h)

local h2 = {}
h2.aa = m
function h2:test()
	print("h2 test")
	print(h2.aa)
	self.aa:test()
end

local x = h2:test()
print("x is " .. x)