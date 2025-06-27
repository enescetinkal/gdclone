require("utils")
local ground = require("ground")
local player = require("player")
local obstacles = require("obstacles")
camera = require("lib/camera")

local obstacleList = obstacles.getList()

function love.load()
    love.graphics.setBackgroundColor(0, 0.45, 1)
    cam = camera()
    obstacles:load()
end

function love.update(dt)
    player.prevX = player.x
    player.prevY = player.y
    
    player:update(dt)
    obstacleCollision()
    
    ground.x = player.x - 700
    
    cam:lookAt(player.x + 300, 300)
end

function love.draw()
    cam:attach()
        obstacles:draw()
        player:draw()
        ground:draw()
    cam:detach()
end

function obstacleCollision()
	for _, tile in ipairs(obstacles.getList()) do
        if checkCollision(player, tile) then
            local fromTop = player.prevY + player.ysize <= tile.y
            local fromBottom = player.prevY >= tile.y + tile.ysize
            local fromLeft = player.prevX + player.xsize <= tile.x
            local fromRight = player.prevX >= tile.x + tile.ysize

            if tile.type == 1 then
                if fromTop then
                    player.onBlocks = true
                    player.rotation = 0
                    player.y = tile.y - player.ysize
                    player.yVelocity = 0
                else
                    love.event.quit("restart")
            end
            elseif tile.type == 2 then
                love.event.quit("restart")
            end
            else
                player.onBlocks = false
            end
        end
    end
end
