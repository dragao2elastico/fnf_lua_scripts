died = false
once = false

bloo = ''
dontStop = false
function onCreate()
    addCharacterToList('bf-dead', 'boyfriend')
end

function onUpdate()
    bloo = getProperty('boyfriend.curCharacter')
    if died then
        if getProperty('health') < 0 then
            setProperty('health', 0)
        end

        if dontStop then
            setProperty('cpuControlled', true)
        end

        if not once then once = true doDeathThing() end      

        runHaxeCode([[
            if (!game.controls.NOTE_LEFT && !game.controls.NOTE_DOWN && !game.controls.NOTE_UP && !game.controls.NOTE_RIGHT && game.startedCountdown && game.generatedMusic)
            {
                if (!bfGhost.stunned && bfGhost.holdTimer > Conductor.stepCrochet * 0.0011 * bfGhost.singDuration && StringTools.startsWith(bfGhost.animation.curAnim.name, 'sing') && !StringTools.endsWith(bfGhost.animation.curAnim.name, 'miss'))
                {
                    bfGhost.dance();
                }
            }
        ]]);
    end
end

function onGameOver()
    died = true
    return Function_Stop;
end

function onBeatHit()
    runHaxeCode([[
        if (]]..curBeat..[[ % bfGhost.danceEveryNumBeats == 0 && bfGhost.animation.curAnim != null && !StringTools.startsWith(bfGhost.animation.curAnim.name, 'sing') && !bfGhost.stunned)
        {
            bfGhost.dance();
        }
    ]]);
end

function goodNoteHit(id, direction, type, sus)
    runHaxeCode([[
	    	bfGhost.playAnim(game.singAnimations[]]..direction..[[], true);

            bfGhost.holdTimer = 0;
	    ]]);
end

function doDeathThing()
    triggerEvent('Change Character', 0, 'bf-dead')
    playSound('fnf_loss_sfx')
    characterPlayAnim('boyfriend', 'firstDeath')
    runTimer('deda', 2)

    runHaxeCode([[
        beefX = game.boyfriend.x;
        beefY = game.boyfriend.y;

        bfGhost = new Boyfriend(beefX + 2000, beefY, ']].. bloo ..[[');
        game.add(bfGhost);

        FlxTween.tween(bfGhost, {x: beefX}, 0.6, {startDelay: 0.2, ease: FlxEase.backOut});
    ]])

    triggerEvent('Camera Follow Pos', 650, 450)
    runTimer('fling', 0.4)
end

function onTimerCompleted(t)
    if t == 'deda' then
        characterPlayAnim('boyfriend', 'deathLoop')
    end

    if t == 'fling' then
        doTweenX('weee', 'boyfriend', -1000, 0.3, 'linear')
        doTweenY('weeee', 'boyfriend', getProperty('boyfriend.y') - 20, 0.3, 'linear')
        doTweenAngle('weeeee', 'boyfriend', -180, 0.5, 'linear')

    end
end 

function onTweenCompleted(t)
    if t == 'weeee' then
        if not botPlay then
            dontStop = true
            setProperty('cpuControlled', true)
        end
        
        triggerEvent('Screen Shake', '0.5, 0.05', '0.5, 0.05')
        playSound('carCrash')
    end
end

function onCreate() 
    if getSongPosition() <= 0 then 
        setProperty('cpuControlled', false)
    end
end