--
-- libraries
--

Class = require("lib/class")
Event = require("lib/knife.event")
push = require("lib/push")
Timer = require("lib/knife.timer")

require("src/constants")

require("src/Tile")
require("src/Board")
require("src/Util")

require("src/states/BaseState")
require("src/states/StateStack")

require("src/states/game/PlayState")

gTextures = {
    ['tiles'] = love.graphics.newImage('graphics/board/tileset1.png')
}

gFrames = {
    ['tiles'] = GenerateQuads(gTextures['tiles'], 24, 24)
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font-3.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font-3.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font-3.ttf', 32)
}

gSounds = {
    ['theme'] = love.audio.newSource('sounds/theme/theme-4.wav', 'static')
}