-- debug.getinfo
-- table 
-- source
-- short_src
-- linedefined
-- lastlinedefined
-- what
-- name
-- namewhat
-- nups
-- activelines
-- func

local info1 = debug.getinfo(1)
for k, v in pairs(info1) do
	print("info1 key .. " .. k)
	print("info1 value " , v)
end
print("================================")
local info2 = debug.getinfo(1)
for k, v in pairs(info2) do
	print("info2 key .. " .. k)
	print("info2 value " , v)
end
print("================================")
function test()
	local info3 = debug.getinfo(1)
	for k, v in pairs(info3) do
		print("info3 key .. " .. k)
		print("info3 value " , v)
	end
end
test()

print("==================traceback")
function traceback()
	for level = 1, math.huge do
		local info = debug.getinfo(level, "Sl")
		if not info then break end
		if info.what == "C" then
			print(level, "C function")
		else
			print(string.format("[%s]:%d", info.short_src, info.currentline))
			-- print(debug.traceback("", 2))
		end
	end
end

traceback()

print("==================debug.getlocal")
function foo(a, b)
	local x
	do local c = a - b end
	local a = 1
	while true do
		local name, value = debug.getlocal(1, a)
		if not name then 
			print("name is nil")
			break
		end
		print(name, value)
		a = a + 1
	end
end

foo(10, 20)