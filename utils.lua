function setColor(colorTable)
    love.graphics.setColor(love.math.colorFromBytes(colorTable[1], colorTable[2], colorTable[3]))
end

function checkCollision(rectA, rectB)
    return rectA.x < rectB.x + rectB.xsize and
           rectA.x + rectA.xsize > rectB.x and
           rectA.y < rectB.y + rectB.ysize and
           rectA.y + rectA.ysize > rectB.y
end

function makePhysics(object, physicsType)
    object.body = love.physics.newBody(world, object.x, object.y, physicsType)
    object.shape = love.physics.newRectangleShape(object.xsize / 2, object.ysize / 2, object.xsize, object.ysize)
    object.fixture = love.physics.newFixture(object.body, object.shape)
end

function drawRect(rect, fillMode)
    if not fillMode then
        fillMode = "fill"
    end

    love.graphics.rectangle(fillMode, rect.x, rect.y, rect.xsize, rect.ysize)
end
