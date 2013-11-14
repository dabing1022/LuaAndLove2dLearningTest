player = {}
player.x = 10
player.y = 10
player.speed = 3
player.health = 20
player.damage = 2

player.pic = love.graphics.newImage("wife.png")

-- pull request
function player_draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.draw(player.pic, player.x, player.y)
end

function player_move()
	if love.keyboard.isDown("up") then
		player.y = player.y - player.speed
	end
	if love.keyboard.isDown("down") then
		player.y = player.y + player.speed
	end
	if love.keyboard.isDown("left") then
		player.x = player.x - player.speed
	end
	if love.keyboard.isDown("right") then
		player.x = player.x + player.speed
	end	
end
