Board = Class{}

function Board:init( boardWidth, boardHeight, x, y, boardType )
    self.x = x
    self.y = y

    self.width = boardWidth
    self.height = boardHeight

    self.tiles = {}

    self:initializeTiles( boardType )
end

function Board:initializeTiles( type )
    local counter = 1
    for tileY = 1, self.height do
        table.insert(self.tiles, {})

        for tileX = 1, self.width do
            local id = TILE_EMPTY
            local occupied = false

            id = MAPS[type][counter]

            table.insert( self.tiles[tileY], Tile(tileX, tileY, false, id))

            counter = counter + 1
        end
    end
end

function Board:update( dt )
    -- body
end

function Board:render(  )
    for y = 1, #self.tiles do
        for x = 1, #self.tiles[1] do
            self.tiles[y][x]:render(self.x, self.y)
        end
    end
end