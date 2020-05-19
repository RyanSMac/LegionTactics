PlayState = Class{__includes = BaseState}

function PlayState:init(  )
    self.board = Board(10, 7, 2, 12, 'test')

    self.boardHighlightX = 0
    self.boardHighlightY = 0

    self.entities = {}
    self:generateEntities()

    gSounds['theme']:setLooping(true)
    gSounds['theme']:play()
end

function PlayState:generateEntities(  )
    table.insert(self.entities, Entity {
        animations = ENTITY_DEF['striker'].animations,

        x = 77,
        y = 77,

        width = 39,
        height = 37,

        hp = 1
    })

    self.entities[1].stateMachine = StateMachine {
        ['idle'] = function() return EntityIdleState(self.entities[1]) end
    }

    self.entities[1]:changeState('idle')
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

    for i = #self.entities, 1, -1 do
        local entity = self.entities[i]

        entity:update(dt)
    end

    self.board:update(dt)
end

function PlayState:render(  )

    self.board:render()

    for k, entity in pairs(self.entities) do
        entity:render()
    end
end