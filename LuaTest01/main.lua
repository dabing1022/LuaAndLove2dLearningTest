require "player"
require "map"

function love.load()
  love.graphics.setBackgroundColor(125, 125, 125)
end
function love.draw()
  player_draw()
end

function love.update(dt)
  player_move()
  map_collide()
end
