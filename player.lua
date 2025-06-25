local ground = require("ground")
require("utils")

local player = {
    x = 0,
    y = 540,
    xsize = 32,
    ysize = 32,
    yVelocity = 0,
    jumpForce = -400,
    gravity = 800,
    onGround = false,
    rotation = 0,
    rotationSpeed = math.rad(180), --this is for the jumping
}

function player:update(dt)
    player.x = player.x + 250 * dt

    player.yVelocity = player.yVelocity + player.gravity * dt
    player.y = player.y + player.yVelocity * dt

    if player.yVelocity > 600 then
        player.yVelocity = 600
    end

    if checkCollision(player, ground) then
        player.y = ground.y - player.ysize
        player.yVelocity = 0
        player.onGround = true
        player.rotation = 0
    else
        player.onGround = false
    end

    if love.keyboard.isDown("space") and player.onGround then
        player.yVelocity = player.jumpForce
    end

    if not player.onGround then
        player.rotation = player.rotation + player.rotationSpeed * dt
    end
end

function player:draw()
    love.graphics.push()
    love.graphics.translate(player.x + player.xsize / 2, player.y + player.ysize / 2)
    love.graphics.rotate(player.rotation)
    love.graphics.rectangle("fill", -player.xsize / 2, -player.ysize / 2, player.xsize, player.ysize)
    love.graphics.pop()
end

return player