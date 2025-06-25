require("utils")

local ground = {
    x = 0,
    y = 550,
    xsize = 1600,
    ysize = 50,
}

function ground:draw()
    drawRect(ground)
end

return ground