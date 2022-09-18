local idle = true

function onCreate()
    
        makeAnimatedLuaSprite('cat', 'Bongo-Cat', -1000, 600);
        scaleObject('cat', 0.5,0.5)
        addAnimationByPrefix('cat', 'idle', 'Bango cat idle dance', 24, false)
        addAnimationByPrefix('cat', 'down', 'Bango cat down note', 24, false)
        addAnimationByPrefix('cat', 'up', 'Bango cat Up note', 24, false)
        addAnimationByPrefix('cat', 'left', 'Bango cat left note', 24, false)
        addAnimationByPrefix('cat', 'right', 'Bango cat Right note', 24, false)
        objectPlayAnimation('cat', 'idle')
        setObjectCamera('cat', 'other')
        addLuaSprite('cat', true)

        makeAnimatedLuaSprite('catmiss', 'Bongo-Cat-Miss', 10, 600);
        scaleObject('catmiss', 0.5,0.5)
        addAnimationByPrefix('catmiss', 'idle', 'Bango cat idle dance', 24, false)
        addAnimationByPrefix('catmiss', 'down', 'Bango cat down note', 24, false)
        addAnimationByPrefix('catmiss', 'up', 'Bango cat Up note', 24, false)
        addAnimationByPrefix('catmiss', 'left', 'Bango cat left note', 24, false)
        addAnimationByPrefix('catmiss', 'right', 'Bango cat Right note', 24, false)
        objectPlayAnimation('catmiss', 'idle')
        setObjectCamera('catmiss', 'other')
        addLuaSprite('catmiss', true)
        setProperty('catmiss.visible', false)

        makeLuaSprite('glow', 'bongo glow', -70, 530);
        scaleObject('glow', 0.5,0.5)
        setObjectCamera('glow', 'other')
        addLuaSprite('glow', false)
        setProperty('glow.visible', true)
        doTweenAlpha('glowout', 'glow', 0, 0.0001, 'linear')

        makeLuaSprite('catmissover', 'bongo misslines', 50, 590);
        scaleObject('catmissover', 0.5,0.5)
        setObjectCamera('catmissover', 'other')
        addLuaSprite('catmissover', true)
        setProperty('catmissover.visible', false)
        
end
function onStartCountdown()
    doTweenX('catslidein', 'cat', 10, 2 , 'sineOut')
    return Function_Continue;
    
end
function onUpdate()
    
    if keyPressed('left') then
        setProperty('cat.visible', true)
        setProperty('catmissover.visible', false)
        objectPlayAnimation('catmiss', 'left')
        objectPlayAnimation('cat', 'left')
        setProperty('cat.x', -4)
        setProperty('cat.y', 600)
        idle = false
        
    end
    if keyReleased('left') then        
        idle = true
    end

    if keyPressed('down') then
        setProperty('catmissover.visible', false)
        setProperty('cat.visible', true)
        objectPlayAnimation('catmiss', 'down')
        objectPlayAnimation('cat', 'down')
        setProperty('cat.x', 11.5)
        setProperty('cat.y', 600)
        idle = false
    end
    if keyReleased('down') then
        idle = true
    end

    if keyPressed('up') then
        setProperty('catmissover.visible', false)
        setProperty('cat.visible', true)
        objectPlayAnimation('catmiss', 'up')
        objectPlayAnimation('cat', 'up')
        setProperty('cat.x', 3)
        setProperty('cat.y', 597)
        idle = false
    end
    if keyReleased('up') then
        idle = true
    end


    if keyPressed('right') then
        setProperty('catmissover.visible', false)
        setProperty('cat.visible', true)
        objectPlayAnimation('catmiss', 'right')
        objectPlayAnimation('cat', 'right')
        setProperty('cat.x', -1)
        setProperty('cat.y', 600)
        idle = false
    end
    if keyReleased('right') then
        idle = true
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    idle = false
    runTimer('idle', 0.5)
    if direction == 0 then
        doTweenX('catmissoverleft', 'catmissover', 50, 0.2, 'sineOut')
        setProperty('catmissover.x', 40)
        setProperty('catmissover.y', 590)
        objectPlayAnimation('catmiss', 'left')
        setProperty('catmiss.x', -4)
        setProperty('catmiss.y', 600)
    end

    if direction == 1 then
        objectPlayAnimation('catmiss', 'down')
        setProperty('catmiss.x', 11.5)
        doTweenY('catmissoverdown', 'catmissover', 591, 0.2, 'sineOut')
        setProperty('catmissover.x', 50)
        setProperty('catmissover.y', 600)
    end

    if direction == 2 then
        doTweenY('catmissoverup', 'catmissover', 589, 0.2, 'sineOut')
        setProperty('catmissover.x', 50)
        setProperty('catmissover.y', 580)
        objectPlayAnimation('catmiss', 'up')
        setProperty('catmiss.x', 3)
        setProperty('catmiss.y', 597)
    end
    if direction == 3 then
        objectPlayAnimation('catmiss', 'right')
        setProperty('catmiss.x', -1)
        setProperty('catmiss.y', 600)
        doTweenX('catmissoverright', 'catmissover', 50, 0.2, 'sineOut')
        setProperty('catmissover.x', 60)
        setProperty('catmissover.y', 590)
    end
    setProperty('catmissover.visible', true)
    setProperty('catmiss.visible', true)
    setProperty('cat.visible', false)
end


function onTimerCompleted(tag)
    if tag == 'idle' then
        idle = true
        setProperty('catmissover.visible', false)
        setProperty('catmiss.visible', false)
        setProperty('cat.x', 10)
        setProperty('cat.y', 600)
        setProperty('cat.visible', true)
        setProperty('catmissover.x', 50)
        setProperty('catmissover.y', 590)
    end
end

function onStepHit()
    if curStep == 1008 then
        doTweenAlpha('glowin', 'glow', 1, 1, 'linear')
    end

end

function onBeatHit()
    if idle == true then
        if curBeat %4 == 2 then
        setProperty('cat.x', 10)
        setProperty('cat.y', 600)
        objectPlayAnimation('cat', 'idle', true)
        end
    end
end

