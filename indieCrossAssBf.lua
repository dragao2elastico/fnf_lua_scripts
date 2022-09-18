local initX = 0
local initY = 0

local pix = 0
local pixl = false

local thingSize = 1
local nyorph = 0 -- gf origin (don't touch)

local singn = false
local uno = true


local beatSquish = true
    local modBy = 1 -- what beat should it happen on | 1 = every
local gfSquish = true
    local upToDown = false

local shiftPos = false -- Messes with positions to give it that "Impact"    
local rotatin = false

local pixBFOff = {{x = 92, y = -200}}
local gameOverOriginX = 0
local gameOverOriginY = 0
function onCreatePost()
    addCharacterToList('bf-dead', 'boyfriend') -- lag type shit

    if getPropertyFromClass('PlayState', 'isPixelStage') == true then
        pixl = true
        nyorph = 120
        gameOverOriginX = 20
        gameOverOriginY = 80
        -- fuckin ass piece of fuckin shit ass fuck shit
        addOffset('boyfriend', 'idle', pixBFOff[1].x, pixBFOff[1].y)
        addOffset('boyfriend', 'singLEFT', pixBFOff[1].x, pixBFOff[1].y)
        addOffset('boyfriend', 'singRIGHT', pixBFOff[1].x, pixBFOff[1].y)
        addOffset('boyfriend', 'singUP', pixBFOff[1].x, pixBFOff[1].y)
        addOffset('boyfriend', 'singDOWN', pixBFOff[1].x, pixBFOff[1].y)

        addOffset('gf', 'danceLeft', pixBFOff[1].x - 120, pixBFOff[1].y - 150)
        addOffset('gf', 'danceRight', pixBFOff[1].x - 120, pixBFOff[1].y - 150)
        thingSize = 6
        pix = 4
    else
        nyorph = 700
        gameOverOriginX = 200
        gameOverOriginY = 400
        setProperty('boyfriend.origin.y', 400)
    end
    
    initX = getProperty('boyfriend.x')
    initY = getProperty('boyfriend.y')
end

function onUpdate(elapsed)

    setProperty('boyfriend.scale.x', math.lerp(thingSize, getProperty('boyfriend.scale.x'), fakeBoundTo(1 - (elapsed * 9), 0, 1)))
    setProperty('boyfriend.scale.y', math.lerp(thingSize, getProperty('boyfriend.scale.y'), fakeBoundTo(1 - (elapsed * 9), 0, 1)))

    setProperty('gf.scale.x', math.lerp(thingSize, getProperty('gf.scale.x'), fakeBoundTo(1 - (elapsed * 9), 0, 1)))
    setProperty('gf.scale.y', math.lerp(thingSize, getProperty('gf.scale.y'), fakeBoundTo(1 - (elapsed * 9), 0, 1)))
    
    --setProperty('just.scale.x', math.lerp(thingSize, getProperty('just.scale.x'), fakeBoundTo(1 - (elapsed * 9), 0, 1)))
    --setProperty('just.scale.y', math.lerp(thingSize, getProperty('just.scale.y'), fakeBoundTo(1 - (elapsed * 9), 0, 1)))

    --updateHitbox(what) -- ugly as shit

    if getProperty('boyfriend.animation.curAnim.name') == 'idle' and (getProperty('boyfriend.x') ~= initX or getProperty('boyfriend.y') ~= initY) and not uno and not singn then
        uno = true
        if rotatin then doTweenAngle('borf', 'boyfriend', 0, (crochet/5000), 'quadInOut') end
        if shiftPos then
            doTweenX('beefef', 'boyfriend', initX, (crochet/5000), 'quadInOut')
            doTweenY('beeff', 'boyfriend', initY, (crochet/5000), 'quadInOut')
        end
    end
end

local rayman = {
    {x = 500, y = 400}, -- left
    {x = 200, y = 400}, -- down
    {x = 200, y = 450}, -- up
    {x = -100, y = 400}, -- right
    -- pixel
    {x = 40, y = 80}, -- left
    {x = 20, y = 80}, -- down
    {x = 20, y = 80}, -- up
    {x = 0, y = 80}, -- right
}

function onUpdatePost(elapsed)
    if inGameOver and getProperty('boyfriend.animation.curAnim.name') == 'deathLoop' and not pixl then -- pixel gameover gets wacky wit this, so no
        if keyPressed('left') then -- eughg grosss
            setProperty('boyfriend.origin.x', rayman[1+pix].x)
            setProperty('boyfriend.origin.y', rayman[1+pix].y)
            setProperty('boyfriend.scale.x', 1.4 * thingSize)
            setProperty('boyfriend.scale.y', 1 * thingSize)
        elseif keyPressed('down') then
            setProperty('boyfriend.origin.x', rayman[2+pix].x)
            setProperty('boyfriend.origin.y', rayman[2+pix].y)
            setProperty('boyfriend.scale.x', 1.2 * thingSize)
            setProperty('boyfriend.scale.y', 0.5 * thingSize)
        elseif keyPressed('up') then
            setProperty('boyfriend.origin.x', rayman[3+pix].x)
            setProperty('boyfriend.origin.y', rayman[3+pix].y)
            setProperty('boyfriend.scale.x', 0.8 * thingSize)
            setProperty('boyfriend.scale.y', 1.4 * thingSize)
        elseif keyPressed('right') then
            setProperty('boyfriend.origin.x', rayman[4+pix].x)
            setProperty('boyfriend.origin.y', rayman[4+pix].y)
            setProperty('boyfriend.scale.x', 1.4 * thingSize)
            setProperty('boyfriend.scale.y', 1 * thingSize)
        end
    end
end


function onCountdownTick(count)
    if beatSquish then
        if count % modBy == 0 then
            setProperty('boyfriend.origin.x', rayman[2+pix].x)
            setProperty('boyfriend.origin.y', rayman[2+pix].y)
            setProperty('boyfriend.scale.x', 1.2 * thingSize)
            setProperty('boyfriend.scale.y', 0.7 * thingSize)
        end
    end

    if gfSquish then
        setProperty('gf.origin.y', nyorph)
        setProperty('gf.scale.x', 1.2 * thingSize)
        setProperty('gf.scale.y', 0.7 * thingSize)
    end
end

function onBeatHit()
    --debugPrint('beat')

    bobb = check(getProperty('boyfriend.animation.curAnim.name'))
    if beatSquish then
        if bobb and curBeat % modBy == 0 and not singn then
            setProperty('boyfriend.origin.x', rayman[2+pix].x)
            setProperty('boyfriend.origin.y', rayman[2+pix].y)
            setProperty('boyfriend.scale.x', 1.2 * thingSize)
            setProperty('boyfriend.scale.y', 0.7 * thingSize)
        elseif bobb and not singn then -- only for 2nd beat or more
            setProperty('boyfriend.origin.x', rayman[3+pix].x)
            setProperty('boyfriend.origin.y', rayman[3+pix].y)
            setProperty('boyfriend.scale.x', 0.7 * thingSize)
            setProperty('boyfriend.scale.y', 1.2 * thingSize)
        end
    end
    
    if gfSquish then
        if not upToDown then
            if curBeat % getProperty('gfSpeed') == 0 then
                setProperty('gf.origin.y', nyorph)
                setProperty('gf.scale.x', 1.2 * thingSize)
                setProperty('gf.scale.y', 0.7 * thingSize)
            end
        else
            if curBeat % 2 == 0 then
                setProperty('gf.origin.y', nyorph)
                setProperty('gf.scale.x', 1.2 * thingSize)
                setProperty('gf.scale.y', 0.7 * thingSize)
            else
                setProperty('gf.origin.y', nyorph)
                setProperty('gf.scale.x', 0.7 * thingSize)
                setProperty('gf.scale.y', 1.2 * thingSize)
            end
        end
    end

end

function goodNoteHit(i, d, sus, type)
    uno = false
    singn = true
    setProperty('boyfriend.origin.x', rayman[d+(1+pix)].x)
    setProperty('boyfriend.origin.y', rayman[d+(1+pix)].y)
    if rotatin then setProperty('boyfriend.origin.x', 150) end -- okay, I know why now
    if d == 0 then
        if rotatin then setProperty('boyfriend.angle', -20) end
        if shiftPos then
            setProperty('boyfriend.x', initX - 50 / (pix+1)) -- no divide by 0 type shit
            setProperty('boyfriend.y', initY)
        end
        setProperty('boyfriend.scale.x', 1.4 * thingSize)
        setProperty('boyfriend.scale.y', 1 * thingSize)
    elseif d == 1 then
        if rotatin then setProperty('boyfriend.angle', 0) end
        if shiftPos then
            setProperty('boyfriend.x', initX)
            setProperty('boyfriend.y', initY + 25 / (pix+1))
        end
        setProperty('boyfriend.scale.x', 1.4 * thingSize)
        setProperty('boyfriend.scale.y', 0.5 * thingSize)
    elseif d == 2 then
        if rotatin then setProperty('boyfriend.angle', 0) end
        if shiftPos then
            setProperty('boyfriend.x', initX)
            setProperty('boyfriend.y', initY - 25 / (pix+1))
        end
        setProperty('boyfriend.scale.x', 0.8 * thingSize)
        setProperty('boyfriend.scale.y', 1.4 * thingSize)
    elseif d == 3 then
        if rotatin then setProperty('boyfriend.angle', 20) end
        if shiftPos then
            setProperty('boyfriend.x', initX + 50 / (pix+1))
            setProperty('boyfriend.y', initY)
        end
        setProperty('boyfriend.scale.x', 1.4 * thingSize)
        setProperty('boyfriend.scale.y', 1 * thingSize)
    end
    runTimer('a', crochet/5000)
end

function onTimerCompleted(t, l, ll)
    if t == 'a' then singn = false end
end

function onGameOverStart()
    if not pixl then
        --addOffset('boyfriend', 'firstDeath', pixBFOff[1].x - 20, pixBFOff[1].y - 50)
        --addOffset('boyfriend', 'deathLoop', pixBFOff[1].x - 20, pixBFOff[1].y - 50)
        --addOffset('boyfriend', 'deathConfirm', pixBFOff[1].x - 20, pixBFOff[1].y - 50)
        setProperty('boyfriend.origin.x', gameOverOriginX)
        setProperty('boyfriend.origin.y', gameOverOriginY + 50)
        setProperty('boyfriend.scale.x', 0.7)
        setProperty('boyfriend.scale.y', 1.7 * thingSize)
    end
end

function onGameOver()
    cameraFlash('game', 'ff0000', 0.5, true)
    return Function_Continue
end

function onGameOverConfirm(retry)
    if retry and not pixl then
        setProperty('boyfriend.origin.x', gameOverOriginX)
        setProperty('boyfriend.origin.y', gameOverOriginY + 50)
        setProperty('boyfriend.scale.x', 1.7 * thingSize)
        setProperty('boyfriend.scale.y', 0.7 * thingSize)
    end
end

function math.lerp(a, b, t)
    return (b - a) * t + a;
end

function fakeBoundTo(v, min, max)
    return math.max(min, math.min(max, v))
end

function check(anim)
    if string.find(anim, 'sing') then
        return false
    else
        return true
    end
end