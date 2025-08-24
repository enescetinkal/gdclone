GRID_SIZE = 32

love.physics.setMeter(32)
World = love.physics.newWorld(0, 981*32, true)

Camera = require("lib.camera")
