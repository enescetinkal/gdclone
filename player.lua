local ground = require("ground")
require("utils")

local player = {
    x = 0,
    y = 540,
    xsize = 55,
    ysize = 55,
    yVelocity = 0,
    jumpForce = -450,
    gravity = 800,
    onGround = false,
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
    else
        player.onGround = false
    end

    if love.keyboard.isDown("space") and player.onGround then
        player.yVelocity = player.jumpForce
    end
end

function player:draw()
    drawRect(player)
end

return player