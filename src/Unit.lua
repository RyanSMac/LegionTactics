Unit = Class{}

function Unit:init( def )
    self.type = def.type
    self.size = def.size

    self.gridX = def.gridX
    self.gridY = def.gridY

    self.entities = {}
    self:generateEntities()
end

function Unit:generateEntities(  )
    local order = {
        [1] = {'middle'},
        [2] = {'top', 'bottom'},
        [3] = {'top', 'middle', 'bottom'}
    }

    for i = 1, self.size do

        local position = order[self.size][i]

        table.insert( self.entities, Entity {
            animations = ENTITY_DEF[self.type].animations,

            offsetX = OFFSETS[position].x,
            offsetY = OFFSETS[position].y,

            x = (self.gridX - 1) * TILE_SIZE,
            y = (self.gridY - 1) * TILE_SIZE,

            width = ENTITY_DEF[self.type].width,
            height = ENTITY_DEF[self.type].height,

            hp = 1
        } )

        self.entities[i].stateMachine = StateMachine {
            ['idle'] = function() return EntityIdleState(self.entities[i]) end,
            ['run'] = function() return EntityRunState(self.entities[i]) end
        }
    
        self.entities[i]:changeState('idle')
    end
end

function Unit:update( dt )
    for i = #self.entities, 1, -1 do
        local entity = self.entities[i]

        entity:update(dt)
    end
end

function Unit:render(  )
    for k, entity in pairs(self.entities) do
        entity:render()
    end
end