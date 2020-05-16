PlayState = Class{__includes = BaseState}

function PlayState:init(  )
    self.board = Board(10, 8, 2, 12)

    gSounds['theme']:setLooping(true)
    gSounds['theme']:play()
end

function PlayState:update( dt )
    self.board:update(dt)
end

function PlayState:render(  )
    self.board:render()
end