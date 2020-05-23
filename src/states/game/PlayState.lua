PlayState = Class{__includes = BaseState}

function PlayState:init(  )
    self.board = Board(10, 7, 2, 12, 'test')

    self.boardHighlightX = 0
    self.boardHighlightY = 0

    self.unit = Unit {
        type = 'prototype',
        size = 3,
        gridX = 2,
        gridY = 2
    }

    --gSounds['theme']:setLooping(true)
    --gSounds['theme']:play()
end

function PlayState:update( dt )
    -- scroll the board using 'wasd'
    if love.keyboard.isDown('a') then
        self.board.x = self.board.x + 1
    elseif love.keyboard.isDown('d') then
        self.board.x = self.board.x - 1
    end

    if love.keyboard.isDown('w') then
        self.board.y = self.board.y + 1
    elseif love.keyboard.isDown('s') then
        self.board.y = self.board.y - 1
    end

    if love.keyboard.isDown( 'p' ) then
        for i = 1, #self.unit.entities do
            self.unit.entities[i]:changeState('run')
        end
    end

    if love.keyboard.isDown( 'o' ) then
        for i = 1, #self.unit.entities do
            self.unit.entities[i]:changeState('idle')
        end
    end

    self.unit:update(dt)

    self.board:update(dt)
end

function PlayState:render(  )

    self.board:render()

    self.unit:render()
end