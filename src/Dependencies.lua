--
-- libraries
--

Class = require("lib/class")
Event = require("lib/knife.event")
push = require("lib/push")
Timer = require("lib/knife.timer")

require("src/Animation")
require("src/Board")
require("src/constants")
require("src/entity_defs")
require("src/Entity")
require("src/Tile")
require("src/Unit")

require("src/Util")

require("src/states/BaseState")
require("src/StateMachine")
require("src/states/StateStack")

require("src/states/game/PlayState")
require("src/states/entity/EntityIdleState")
require("src/states/entity/EntityRunState")

gTextures = {
    ['tiles'] = love.graphics.newImage('graphics/board/tileset1.png'),
    ['striker'] = love.graphics.newImage('graphics/units/striker/striker.png'),
    ['prototype'] = love.graphics.newImage('graphics/units/prototype/prototype.png')
}

gFrames = {
    ['tiles'] = GenerateQuads(gTextures['tiles'], TILE_SIZE, TILE_SIZE),
    ['striker'] = GenerateQuads(gTextures['striker'], ENTITY_DEF['striker'].width, ENTITY_DEF['striker'].height),
    ['prototype'] = GenerateQuads(gTextures['prototype'], ENTITY_DEF['prototype'].width, ENTITY_DEF['prototype'].height)
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font-3.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font-3.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font-3.ttf', 32)
}

gSounds = {
    ['theme'] = love.audio.newSource('sounds/theme/theme-4.wav', 'static')
}