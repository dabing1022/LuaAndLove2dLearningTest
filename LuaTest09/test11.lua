-- test self

N = {m = 2}

function N:func1_N()
	print("func1_N")
end

function N:func2_N()
	print("func2_N")
end


-------------------------------
M = {}

function M:func1_M()
	self.m = 1
	print("func1_M")

	function N:func3_N()
		print("func3_N")
		print("self.m------" .. self.m)
		print("M.m--------" .. M.m)
	end

	N:func3_N()
end

M:func1_M()




