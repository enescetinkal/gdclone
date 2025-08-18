function setColor(colorTable)
    --Sets current draw color to a table with 3 8bit values.
    love.graphics.setColor(love.math.colorFromBytes(colorTable[1], colorTable[2], colorTable[3]))
end

function checkCollision(rectA, rectB)
    --Returns true if 2 rectangle objects collide with eachother.
    return rectA.x < rectB.x + rectB.xsize and
           rectA.x + rectA.xsize > rectB.x and
           rectA.y < rectB.y + rectB.ysize and
           rectA.y + rectA.ysize > rectB.y
end

function makePhysics(object, physicsType, world, userData)
    --Makes a love.physics rectangle out of a rectangle object.
    object.body = love.physics.newBody(world, object.x, object.y, physicsType)
    object.shape = love.physics.newRectangleShape(object.xsize / 2, object.ysize / 2, object.xsize, object.ysize, 0)
    object.fixture = love.physics.newFixture(object.body, object.shape)

    object.fixture:setUserData(userData)

    table.remove(object, object.x)
    table.remove(object, object.y)
    table.remove(object, object.xsize)
    table.remove(object, object.ysize)
end

function drawPhysics(object, fillMode)
    if not fillMode then
        fillMode = "fill"
    end

    love.graphics.polygon(fillMode, object.body:getWorldPoints(object.shape:getPoints()))
end

function drawRect(rect, fillMode)
    --Draws a rectganle object.
    if not fillMode then
        fillMode = "fill"
    end

    love.graphics.rectangle(fillMode, rect.x, rect.y, rect.xsize, rect.ysize)
end

function tableCopy(orig)
    --Copies one tables object to another.
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function playSound(sound)
    if not sound:typeOf("Source") then
        return
    end

    local clone = sound:clone()
    clone:play()
end
