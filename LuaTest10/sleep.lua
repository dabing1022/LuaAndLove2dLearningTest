function sleep(n)
   local t0 = os.clock()
   while os.clock() - t0 <= n do end
end

for i = 1, 8 do
	print("sleep")
	sleep(1)
end

local SPACE_TIME = 1
for i = 1, 6 do
	local delay = CCDelayTime:create( ( i - 1) * SPACE_TIME)
	local func = CCCallFuncN:create(function(node)
		node:高亮()
	end)
	nodeArr[i]:runAction(transition.sequence({delay, func}))
end