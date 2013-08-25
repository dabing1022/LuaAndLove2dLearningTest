-- This game is based on a grid of 32 pixels. This number is a standard
-- tile size, because it is big enough for definition, but still works
-- well with the PO2 problem, and isn't too big for it to be useful.



function love.load()
	player = { -- All of the data concerning the player is stored here
		grid_x = 256,
		grid_y = 256,
		act_x = 200,
		act_y = 200,
		-- Though the player moves on a grid (grid_*) we smooth
		-- out the movement in between grid points (act_*)
		speed = 10, -- used in love.update, to control player speed.
		score = 0 -- An Ongoing tally of the apples collected
	}

	apple = { -- The objective: collect the apples
		pos_x = 100, 
		pos_y = 100,
		grid_x = 1,
		grid_y = 1,

--		gotten = 1 -- When the player gets an apple, this flag is thrown
	}

	map = { -- This is the background map. '1's are walls, and '0's are floors
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1 },
		{ 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1 },
		{ 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1 },
		{ 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1 },
		{ 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1 },
		{ 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1 },
		{ 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1 },
		{ 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 },
		{ 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
	}

	-- 
	-- GRAPHICS SECTION
	--

	tilemap = { -- This is the map for the graphics.
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 1, 2, 1, 2, 1, 1, 1, 1, 0, 1, 1, 1, 0 },
		{ 0, 1, 0, 0, 1, 1, 2, 1, 0, 2, 1, 0, 1, 0 },
		{ 0, 0, 0, 0, 1, 2, 1, 1, 0, 1, 1, 1, 0, 0 },
		{ 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0 },
		{ 0, 1, 2, 1, 1, 1, 1, 0, 0, 0, 0, 1, 2, 0 },
		{ 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 2, 1, 1, 0 },
		{ 0, 0, 1, 2, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0 },
		{ 0, 0, 1, 1, 1, 2, 1, 1, 2, 0, 0, 0, 0, 0 },
		{ 0, 0, 1, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0 },
		{ 0, 2, 1, 1, 2, 1, 2, 1, 1, 2, 1, 0, 0, 0 },
		{ 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
	}

	tile = {}
	for i = 0,3 do
		tile[i] = love.graphics.newImage("tile"..i..".png")
	end


	-- 
	-- AUDIO SECTION
	--

	calcApple()
	math.randomseed( os.time() )
end

function love.update(dt)
	-- The formula 'actual position = actual position - ((actual position - grid position) * time)'
	-- lets the movement between grid points be smoother.
	player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
	player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
--	calcApple()
	score()
end

function love.draw()
	drawMap()
	-- The player is a filled in rectangle.
    print("player a_x,a_y,g_x,g_y", player.act_x, player.act_y, player.grid_x, player.grid_y)
	love.graphics.rectangle("fill", player.act_x, player.act_y, 32, 32)
	love.graphics.draw(tile[3], apple.pos_x, apple.pos_y)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print("Player Score:", 32, 500, 0, 1, 1)
	love.graphics.print(player.score, 132, 500, 0, 1, 1)
end

function love.keypressed(key)
	-- TestMap defined below.
	-- If the player presses a key, and the direction they chose is not a wall, it will move them
	-- on the grid. This, in combination with the math is love.update, gives us fluid movement.
	if key == "down" then
		if testMap(0, 1) then
			player.grid_y = player.grid_y + 32
		end
	elseif key == "up" then
		if testMap(0, -1) then
			player.grid_y = player.grid_y - 32
		end
	elseif key == "left" then
		if testMap(-1, 0) then
			player.grid_x = player.grid_x - 32
		end
	elseif key == "right" then
		if testMap(1, 0) then
			player.grid_x = player.grid_x + 32
		end
	end
end

function testMap(x, y)
	-- This funtion tests if the space designated by x and y is a wall or a floor.
	-- Because it is relational, not absolute, we convert the grid values from their
	-- 32 pixel status to a simpler 1 tile status, to compare with the new coordinates,
	-- to make the math clearer.

	if map[(player.grid_y / 32) + y][(player.grid_x / 32) + x] == 1 then
		return false
	end
	return true
end

function drawMap()
	-- We cycle through the map, row by row, column by column, and draw boxes for the walls.
	for y = 1, #tilemap do
		for x = 1, #tilemap[y] do
			if tilemap[y][x] == 1 then
				love.graphics.draw(tile[1], x * 32, y * 32)
			elseif tilemap[y][x] == 2 then
				love.graphics.draw(tile[2], x * 32, y * 32)
			else
				love.graphics.draw(tile[0], x * 32, y * 32)
			end
		end
	end
end

function calcApple()
	-- Randomize the goal, the other filled in square that give the player points
		repeat
			apple.grid_x = numRound(math.random(1,196) / 14)
			apple.grid_y = numRound(math.random(1,169) / 13)
			apple.pos_x = apple.grid_x * 32
			apple.pos_y = apple.grid_y * 32
		until map[apple.grid_y][apple.grid_x] == 0 and apple.pos_x ~= player.grid_x and apple.pos_y ~= player.grid_y
end

function numRound(number)
	--Round a Number
	number = math.ceil( number )
	return number
end

function score()
	-- When the player reaches the Apple...
	if player.grid_x == apple.pos_x then
		if player.grid_y == apple.pos_y then
			player.score = player.score + 1	
			calcApple()
		end
	end
end
