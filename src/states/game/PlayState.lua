PlayState = Class{__includes = BaseState}

function PlayState:init(  )
    self.board = Board(10, 7, 2, 12, 'test')

    self.boardHighlightX = 0
    self.boardHighlightY = 0

    gSounds['theme']:setLooping(true)
    gSounds['theme']:play()
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

    self.board:update(dt)
end

function PlayState:render(  )
    self.board:render()
end