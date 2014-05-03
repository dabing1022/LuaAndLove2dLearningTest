a = { m = 3, n = 4, c = 5}
for k, v in pairs(a) do
	print(k .."====" .. v)
end

b = {3, 6, 4}
table.sort(a, function(a,b) return a < b end )
table.sort(b, function(a,b) return a < b end )
for k, v in pairs(b) do
	print(k .."====" .. v)
end

local input = 10
function getRightKey(input)

	for k, v in pairs(a) do
		print(k .."====" .. v)
		if input > v then
			print(input)
		end
	end
end

getRightKey(input)