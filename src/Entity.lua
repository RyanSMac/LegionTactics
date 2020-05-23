Entity = Class{}

function Entity:init( def )
    -- set animations
    self.animations = self:createAnimations(def.animations)

    self.offsetX = def.offsetX
    self.offsetY = def.offsetY

    self.width = def.width
    self.height = def.height

    -- dimensions
    self.x = math.floor((def.x + self.offsetX) - (self.width / 2))
    self.y = math.floor((def.y + self.offsetY) - (self.height / 2))

    --
    self.hp = def.hp
end

function Entity:createAnimations( animations )
    local animationsReturned = {}

    for k, animationDef in pairs(animations) do
        animationsReturned[k] = Animation {
            texture = animationDef.texture,
            frames = animationDef.frames,
            interval = animationDef.interval
        }
    end

    return animationsReturned
end

function Entity:changeState( name )
    self.stateMachine:change(name)
end

function Entity:changeAnimation( name )
    self.currentAnimation = self.animations[name]
end

function Entity:update( dt )
    self.stateMachine:update(dt)

    if self.currentAnimation then
        self.currentAnimation:update(dt)
    end
end

function Entity:render(  )
    self.stateMachine:render()
end