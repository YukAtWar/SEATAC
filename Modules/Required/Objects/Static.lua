---@author West#9009
---@description Static object wrapper.
---@created 23MAY22

STATIC = {
    ClassName = 'STATIC',
}

function STATIC:New(Name)
    local self = BASE:Inherit(self, OBJECT:New(Name))

    return self
end

function STATIC:FindByName(Name)
    local Static = __DATABASE._Statics[Name]

    if Static then
        return Static
    end

    return nil
end

function STATIC:GetDCSObject()
    local DCSObject = StaticObject.getByName(self.Name)

    if DCSObject then
        return DCSObject
    end

    return nil
end

function STATIC:Destroy()
    local Name = self:GetName()

    self:CreateEventRemoveUnit(self:Now(), self:GetDCSObject())

    SPAWN:NewStaticFromType(nil, nil, nil, 80, Name, true)
            :SpawnFromVec2({x = 0, z = 0})
end
