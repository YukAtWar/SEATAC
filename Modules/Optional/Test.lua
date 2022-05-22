---@author West#9009
---@description Test Module.
---@created 20MAY22

TEST = {
    ClassName = 'TEST'
}

function TEST:New()
    local self = BASE:Inherit(self, BASE:New())

    self:HandleEvent(ENUMS.EVENTS.Birth, self._OnEventBirth)

    return self
end

function TEST:_OnEventBirth(EventData)
    local PlayerName = EventData.IniPlayerName

    self:Log('info', '%s was born!', PlayerName)
end

TEST:New()