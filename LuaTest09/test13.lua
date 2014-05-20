local test = { 2, 3, 4, 8, 9, 100, 20, 13, 15, 7, 11}
for i, v in ipairs( test ) do
	if v % 2 == 0 then
        table.remove(test, i)
    end
end

for i, v in ipairs( test ) do
	print(i .. "====" .. v)
end

