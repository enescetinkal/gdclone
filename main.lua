require("src.game")

local player = require("src.player")

function love.load()
    player:load()

    Ground = {
        x = 0,
        y = 600 - 32,
        xsize = 1600,
        ysize = 64
    }
    makePhysics(Ground, "static", World, "ground")

    World:setCallbacks(BeginContact, EndContact, PreSolve, PostSolve)
end

function love.update(dt)
    World:update(dt)

    player:update()
end

function love.draw()
    player:draw()
    drawPhysics(Ground, "fill")
end

function BeginContact(a, b, _)
    local aData, bData = a:getUserData(), b:getUserData()

    if (aData == "player" and bData == "ground") or (bData == "player" and aData == "ground") then
    	player.isGrounded = true
    end
end

function EndContact(a, b, _)
    local aData, bData = a:getUserData(), b:getUserData()

    if (aData == "player" and bData == "ground") or (bData == "player" and aData == "ground") then
    	player.isGrounded = false
    end
end

function PreSolve(a, b, coll)

end

function PostSolve(a, b, coll, normalimpulse, tangentimpulse)

end

