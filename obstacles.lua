local LevelData = require("level")

local Obstacles = {}
Obstacles.tileSize = 32
Obstacles.tiles = {}

local tileColors = {
    [1] = {0.3, 0.3, 0.9},
    [2] = {1, 0, 0}
}

function Obstacles.load()
    Obstacles.tiles = {}

    local rows = #LevelData
    local groundY = love.graphics.getHeight() - 40
    local totalGridHeight = rows * Obstacles.tileSize
    local offsetY = groundY - totalGridHeight  -- shift the entire grid up

    for row = 1, rows do
        for col = 1, #LevelData[row] do
            local tileType = LevelData[row][col]
            if tileType ~= 0 then
                table.insert(Obstacles.tiles, {
                    x = (col - 1) * Obstacles.tileSize,
                    y = offsetY + (row - 1) * Obstacles.tileSize,
                    xsize = Obstacles.tileSize,
                    ysize = Obstacles.tileSize,
                    type = tileType
                })
            end
        end
    end
end

function Obstacles.draw()
    for _, tile in ipairs(Obstacles.tiles) do
        love.graphics.setColor(tileColors[tile.type] or {1, 1, 1})
        love.graphics.rectangle("fill", tile.x, tile.y, tile.xsize, tile.ysize)
    end
    love.graphics.setColor(1, 1, 1)
end

function Obstacles.getList()
    return Obstacles.tiles
end

return Obstacles



