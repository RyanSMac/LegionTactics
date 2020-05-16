Tile = Class{}

function Tile:init( x, y, occupied, tileID )
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * TILE_SIZE
    self.y = (self.gridY - 1) * TILE_SIZE

    -- is the tile occupied
    self.occupied = occupied

    -- set tile id
    self.tileID = tileID
end

function Tile:render( x, y )
    love.graphics.draw(gTextures['tiles'], gFrames['tiles'][self.tileID],
        self.x + x, self.y + y)
end