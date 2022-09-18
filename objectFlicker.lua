-- A function that acts like FlxFlicker.
-- obj = the object to flicker
-- duration = the total length of the flicker in seconds
-- delay = the delay between the object appearing and dissapearing
-- endVisible = whether or not the object is visible at the end
local flickerObjects = {}
local flickerEndVisible = {}
local flickerDelays = {}
function objectFlicker(obj, duration, delay, endVisible)
    if endVisible == nil then endVisible = true end
    table.insert(flickerObjects, obj)
    table.insert(flickerEndVisible, endVisible)
    table.insert(flickerDelays, delay)
    local loops = math.floor(duration/delay)
    runTimer(obj..'flickerOff', delay, loops)
end

function onFlickerCompleted(obj, id)
    setProperty(obj..'.visible', flickerEndVisible[id])
    table.remove(flickerObjects, id)
    table.remove(flickerEndVisible, id)
    table.remove(flickerDelays, id)
end

function onTimerCompleted(tag, loops, loopsLeft)
    -- A loop from a timer you called has been completed, value "tag" is it's tag
    -- loops = how many loops it will have done when it ends completely
    -- loopsLeft = how many are remaining
    if #flickerObjects > 0 then
        local i = 1
        while i <= #flickerObjects do
            local flickerObj = flickerObjects[i]    
            --this could probably be improved
            if tag == flickerObj..'flickerOn' then
                if loops > 0 then
                    setProperty(flickerObj..'.visible', true)
                    runTimer(flickerObj..'flickerOff', flickerDelays[i], loops-1)
                    cancelTimer(tag)
                else
                    onFlickerCompleted(flickerObj, i)
                    i = i - 1
                end
            end
            if tag == flickerObj..'flickerOff' then
                if loops > 0 then
                    setProperty(flickerObj..'.visible', false)
                    runTimer(flickerObj..'flickerOn', flickerDelays[i], loops-1)
                    cancelTimer(tag)
                else
                    onFlickerCompleted(flickerObj, i)
                    i = i - 1
                end
            end
            i = i + 1
        end
    end
end