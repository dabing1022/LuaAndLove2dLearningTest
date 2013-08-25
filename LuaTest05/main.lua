function love.load()
    love.graphics.setBackgroundColor(255, 255, 255)
    xCloud = 0
end


function love.draw()
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    love.graphics.setColor(0,0,255,255)
    love.graphics.rectangle("fill", xCloud, 32, 128, 64)

    love.graphics.setColor(0,0,0,255)
    love.graphics.rectangle("fill", x, y, 128, 64)

    love.graphics.setColor(0,255,0,255)
    love.graphics.rectangle("line", x + 100, y + 100, 128, 64)
end


function love.update(dt)
    xCloud = xCloud + 32 * dt
    if(xCloud >= 400) then
       xCloud = 0 - 128
    end
end
