require("utils")
local ground = require("ground")
local player = require("player")
camera = require("lib/camera")

function love.load()
    love.graphics.setBackgroundColor(0, 0.45, 1)
    cam = camera()
end

function love.update(dt)
    player:update(dt)
    ground.x = player.x - 700

    cam:lookAt(player.x + 300, 300)
end

function love.draw()
    cam:attach()
        player:draw()
        ground:draw()
    cam:detach()
end