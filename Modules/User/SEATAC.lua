SEATAC = {
    -- Define the ClassName (This is optional)
    SEATAC = 'TEST'
}

-- Instantiation Function
function SEATAC:New()
    -- Inherit Base (This includes many scheduler, event, and log functions for your class).
    local self = BASE:Inherit(self, BASE:New())

    -- Handle Birth Events (Very similar to MOOSE)
    self:HandleEvent(ENUMS.EVENTS.Takeoff, self.OnEventTakeoff)

    -- Return the new object.
    return self
end

-- Callback function for Birth Events
function SEATAC:OnEventTakeoff(Event)
    MESSAGE:New('Test'):ToAll()
end

-- Create a new instance of your class.
SEATAC = SEATAC:New()
