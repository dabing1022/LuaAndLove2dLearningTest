--
-- Author: ChildhoodAndy
-- Date: 2013-11-03 11:14:39
--

-- 队列
List = {}
function List.new()
	return {first = 0, last = -1}
end

function List.pushFirst(list, value)
	local first = list.first - 1
	list.first = first
	list[first] = value
end

function List.pushLast(list, value)
	local last = list.last + 1
	list.last = last
	list[last] = value
end

local m = List.new()
List.pushFirst(m, 5)
for k, v in pairs(m) do
	print(k .. v)
end

List.pushFirst(m, 100)
for k, v in pairs(m) do
	print("===" .. k .. "===" .. v)
end