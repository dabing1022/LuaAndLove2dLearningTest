function create_ground()
    local obj = {}
    obj = {}
    obj.body = love.physics.newBody(world, 850/2, 650-50/2)
    obj.shape = love.physics.newRectangleShape(850,50)
    obj.fixture = love.physics.newFixture(obj.body, obj.shape)

    return obj
end

function create_wall()
    local obj = {}
    obj = {}
    obj.body = love.physics.newBody(world, 850/2+80, 650/2)
    obj.shape = love.physics.newRectangleShape(0,0,200,50,90)
    obj.fixture = love.physics.newFixture(obj.body, obj.shape)
    obj.body2 = love.physics.newBody(world, 850/2-75, 650/2)
    obj.shape2 = love.physics.newRectangleShape(0,0,200,50,-90)
    obj.fixture2 = love.physics.newFixture(obj.body2, obj.shape2)

    obj.fixture:setFriction(1)
    obj.fixture2:setFriction(1)

    return obj
end

function create_blob(x,y)

    local obj = {}
    obj.main = {}

    obj.main.body = love.physics.newBody(world, x, y, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
    obj.main.shape = love.physics.newCircleShape(10) --the ball's shape has a radius of 20
    obj.main.fixture = love.physics.newFixture(obj.main.body, obj.main.shape, 1)
    --obj.main.fixture:setRestitution(0.9) --let the ball bounce
    obj.main.fixture:setFriction(1)

    obj.sat = {}

    local particleNumber = 80
    local particleDistance = 20

    local mainFrequency = 1
    local mainDamping = 0.005

    local satFrequency = 0
    local satDamping = 0

    for i=1, particleNumber do

      local angle = (2 * math.pi) / particleNumber * i
      local satx = x + particleDistance * math.cos(angle)
      local saty = y + particleDistance * math.sin(angle)

      obj.sat[i] = {}
      obj.sat[i].body = love.physics.newBody(world, satx, saty, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
      obj.sat[i].shape = love.physics.newCircleShape(2)
      obj.sat[i].fixture = love.physics.newFixture(obj.sat[i].body, obj.sat[i].shape, 1)
      obj.sat[i].fixture:setFriction(1)

      local joint = {}
      joint = love.physics.newDistanceJoint( obj.main.body, obj.sat[i].body, obj.main.body:getX(), obj.main.body:getY(), obj.sat[i].body:getX(), obj.sat[i].body:getY(), true )
      joint:setFrequency(mainFrequency)
      joint:setDampingRatio(mainDamping)

      if i > 1 then
        local joint = {}
        joint = love.physics.newDistanceJoint( obj.sat[i].body, obj.sat[i-1].body, obj.sat[i].body:getX(), obj.sat[i].body:getY(), obj.sat[i-1].body:getX(), obj.sat[i-1].body:getY(), true )
        joint:setFrequency(satFrequency)
        joint:setDampingRatio(satDamping)
      end

      if i == particleNumber then
        local joint = {}
        joint = love.physics.newDistanceJoint( obj.sat[i].body, obj.sat[1].body, obj.sat[i].body:getX(), obj.sat[i].body:getY(), obj.sat[1].body:getX(), obj.sat[1].body:getY(), true )
        joint:setFrequency(satFrequency)
        joint:setDampingRatio(satDamping)
      end

    end

    return obj
end

function love.load()
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    love.physics.setMeter(64) --the height of a meter our worlds will be 64px
    world = love.physics.newWorld(0, 9.81*64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81

    --let's create a ball
    blob = create_blob(450, 100)
    ground = create_ground()
    wall = create_wall()

    --initial graphics setup
    love.graphics.setBackgroundColor(104, 136, 248) --set the background color to a nice blue
    love.graphics.setMode(850, 650, false, true, 0) --set the window dimensions to 650 by 650
end


function love.update(dt)
    world:update(dt) --this puts the world into motion

  if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
    blob.main.body:applyForce(400, 0)
  elseif love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
    blob.main.body:applyForce(-400, 0)
  elseif love.keyboard.isDown("up") then --press the up arrow key to set the ball in the air
    blob.main.body:applyForce(0, -800)
  end
end


function love.draw()

    love.graphics.setColor(72, 160, 14)
    love.graphics.polygon("fill", ground.body:getWorldPoints(ground.shape:getPoints()))
    love.graphics.setColor(72, 0, 14)
    love.graphics.polygon("fill", wall.body:getWorldPoints(wall.shape:getPoints()))
    love.graphics.polygon("fill", wall.body2:getWorldPoints(wall.shape2:getPoints()))

    local polySat = {}
    for idx, sat in ipairs(blob.sat) do
      love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
      love.graphics.circle("fill", sat.body:getX(), sat.body:getY(), sat.shape:getRadius())
      table.insert(polySat, sat.body:getX())
      table.insert(polySat, sat.body:getY())
    end

    love.graphics.polygon("fill", polySat)

    --love.graphics.setColor(173, 47, 14) --set the drawing color to red for the ball
    --love.graphics.circle("fill", blob.main.body:getX(), blob.main.body:getY(), blob.main.shape:getRadius())


end