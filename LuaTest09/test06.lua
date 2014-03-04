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