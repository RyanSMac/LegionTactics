EntityIdleState = Class{__includes = BaseState}

function EntityIdleState:init( entity )
    self.entity = entity

    self.entity:changeAnimation('idle')
end

function EntityIdleState:render(  )
    local anim = self.entity.currentAnimation

    love.graphics.setColor(0.1, 0.1, 0.1, 0.5)
    love.graphics.ellipse('fill', self.entity.x + (self.entity.width / 2) + 10, self.entity.y + self.entity.height, 12, 5, 100)
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        self.entity.x, self.entity.y)

    -- love.graphics.setColor(255, 0, 255, 255)
    -- love.graphics.rectangle('line', self.entity.x, self.entity.y, self.entity.width, self.entity.height)
    -- love.graphics.setColor(255, 255, 255, 255)
end