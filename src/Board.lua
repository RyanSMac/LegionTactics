Board = Class{}

function Board:init( boardWidth, boardHeight, x, y )
    self.x = x
    self.y = y

    self.width = boardWidth
    self.height = boardHeight

    self.tiles = {}

    self:initializeTiles(  )
end

function Board:initializeTiles(  )
    for tileY = 1, self.height do
        table.insert(self.tiles, {})

        for tileX = 1, self.width do
            local id = TILE_EMPTY
            local occupied = false

            -- select id for corner
            if tileX == 1 and tileY == 1 then
                id = TILE_TOP_LEFT_CORNER
            elseif tileX == 1 and tileY == self.height then
                id = TILE_BOTTOM_LEFT_CORNER
            elseif tileX == self.width and tileY == 1 then
                id = TILE_TOP_RIGHT_CORNER
            elseif tileX == self.width and tileY == self.height then
                id = TILE_BOTTOM_RIGHT_CORNER

            -- select id for the left wall
            elseif tileX == 1 then
                if tileY == 2 then
                    id = TILE_LEFT_WALLS[1]
                elseif tileY == self.height - 1 then
                    id = TILE_LEFT_WALLS[6]
                elseif tileY <= self.height / 2 then
                    if (tileY % 2 == 0) then
                        id = TILE_LEFT_WALLS[3]
                    else
                        id = TILE_LEFT_WALLS[2]
                    end
                elseif tileY >= self.height / 2 then
                    if (tileY % 2 == 0) then
                        id = TILE_LEFT_WALLS[5]
                    else
                        id = TILE_LEFT_WALLS[4]
                    end
                end
            -- selected id for right wall
            elseif tileX == self.width then
                if tileY == 2 then
                    id = TILE_RIGHT_WALLS[1]
                elseif tileY == self.height - 1 then
                    id = TILE_RIGHT_WALLS[6]
                elseif tileY <= self.height / 2 then
                    if (tileY % 2 == 0) then
                        id = TILE_RIGHT_WALLS[3]
                    else
                        id = TILE_RIGHT_WALLS[2]
                    end
                elseif tileY >= self.height / 2 then
                    if (tileY % 2 == 0) then
                        id = TILE_RIGHT_WALLS[5]
                    else
                        id = TILE_RIGHT_WALLS[4]
                    end
                end
            -- selected id for top wall
            elseif tileY == 1 then
                if tileX == 2 then
                    id = TILE_TOP_WALLS[1]
                elseif tileX == self.width - 1 then
                    id = TILE_TOP_WALLS[4]
                else
                    if (tileX % 2 == 0) then
                        id = TILE_TOP_WALLS[3]
                    else
                        id = TILE_TOP_WALLS[2]
                    end
                end
            -- selected id for bottom wall
            elseif tileY == self.height then
                if tileX == 2 then
                    id = TILE_BOTTOM_WALLS[1]
                elseif tileX == self.width - 1 then
                    id = TILE_BOTTOM_WALLS[4]
                else
                    if (tileX % 2 == 0) then
                        id = TILE_BOTTOM_WALLS[3]
                    else
                        id = TILE_BOTTOM_WALLS[2]
                    end
                end
            else
                id = TILE_FLOORS[math.random(#TILE_FLOORS)]
            end
            
            table.insert(self.tiles[tileY], Tile(tileX, tileY, occupied, id))
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