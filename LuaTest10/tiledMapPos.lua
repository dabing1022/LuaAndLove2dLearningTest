local originWorldX = 0
local originWorldY = 0
local width = 20
local height = 20
local skewAngle = math.pi / 4
local deltaX, deltaY, gridX, gridY

function getGridPos(x, y)
	deltaY = originWorldY - y
	deltaX = originWorldX - x 
	deltaY = deltaY - math.abs(deltaX)  * math.tan(skewAngle)
	gridX = math.floor(math.abs(deltaX) / width)
	gridY = math.floor(math.abs(deltaY) / height)
	print(gridX, gridY)
	return gridX, gridY
end



for i = 0, 50, 20 do
	for j = 50, 0, -20 do
		print(i, j)
		getGridPos(i, j)
	end
end
