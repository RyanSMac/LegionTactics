Entity = Class{}

function Entity:init( def )
    -- set animations
    self.animations = self:createAnimations(def.animations)

    -- dimensions
    self.x = def.x
    self.y = def.y
    self.width = def.width
    self.height = def.height

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