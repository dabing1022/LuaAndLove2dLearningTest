-- sample about shader

function love.load()
    --lua里字符串有换行要用[[]]括起
    local shadercode=[[
   		 //这里是类C的语法，注释使用"//"，每个语句结尾用";"，函数用"()"
    
        extern number time; //time变量用来和外部交换，外部程序可以给这个time传值
        vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords)
        {   
            
            //(r,g,b,a)颜色，取值0-1，这里对time变量进行操作保证结果在0-1范围内
            return vec4((1.0+sin(time))/2.0, abs(cos(time)), abs(sin(time)), 1.0);
        }
    ]]
    --1 创建shader
    myeffect = love.graphics.newShader(shadercode) 
end

function love.draw()
    -- 2 关闭shader，矩形为默认效果
    love.graphics.setShader()
    love.graphics.rectangle('fill', 0,10,790,285)

    -- 2 加载effect shader，矩形效果绚丽
	love.graphics.setShader(myeffect)
    for i = 1, 10 do
    	for j = 1, 10 do
		    love.graphics.rectangle('fill', i * 50, j * 50, 40,40)
		end
    end
end

local t = 0
function love.update(dt)
    t = t + dt
    myeffect:send("time", t) --3 更新
end