require("lib.utils")
require("src.game")

local player = {
    x = 200,
    y = 600 - 32,
    xsize = 32,
    ysize = 32,
    isGrounded = false,
}

function player:load()
    makePhysics(player, "dynamic", World, "player")
end

function player:update()
    self.body:setLinearVelocity(200, 0)
    
    if love.keyboard.isDown("w") and self.isGrounded then
    	self.body:applyLinearImpulse(0, -400)
    end
end

function player:draw()
    drawPhysics(player, "fill")
end

return player
