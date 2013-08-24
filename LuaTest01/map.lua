function map_collide()
    if(player.x < 0) then
        player.x = 0
    end
    if(player.y < 0) then
        player.y = 0
    end
    if(player.y + player.pic:getHeight() > 500) then
        player.y = 500 - player.pic:getHeight()
    end
    if(player.x + player.pic:getWidth() > 900) then
        player.x = 900 - player.pic:getWidth()
    end
end
