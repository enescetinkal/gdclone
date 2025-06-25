-- background.lua
local Background = {}

function Background:new(starCount, width, height)
    local bg = {}
    setmetatable(bg, self)
    self.__index = self

    bg.stars = {}
    bg.width = width or love.graphics.getWidth()
    bg.height = height or love.graphics.getHeight()
    bg.scrollSpeed = 20

    for i = 1, starCount do
        table.insert(bg.stars, {
            x = math.random() * bg.width,
            y = math.random() * bg.height,
            size = math.random(1, 3),
            speed = math.random() * 0.5 + 0.5
        })
    end

    return bg
end

function Background:update(dt)
    for _, star in ipairs(self.stars) do
        star.y = star.y + star.speed * self.scrollSpeed * dt
        if star.y > self.height then
            star.y = 0
            star.x = math.random() * self.width
        end
    end
end

function Background:draw()
    love.graphics.setColor(1, 1, 1)
    for _, star in ipairs(self.stars) do
        love.graphics.circle("fill", star.x, star.y, star.size)
    end
    love.graphics.setColor(1, 1, 1) -- reset
end

return Background
