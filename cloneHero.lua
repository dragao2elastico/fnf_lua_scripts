--Auto activates star when full. If false you will have to activate it manually.
autoStar = true

--Your star keybind.
starKey = 'D'

--Alpha of the hud. hudAlpha for bars and BGs. textAlpha for texts.
hudAlpha = 0.8
textAlpha = 0.8

--DONT EDIT THESE VARIABLES.
thingyOne = 0
thingyTwo = 0
thingyThree = 0
thingyFour = 0
xThingy = 0.01
sThingy = 0.01
sThingyTwo = 0.01
barT = 1
barNumber1 = 0
usingStar = false

function onCreatePost()
    if middlescroll == true then
        luaDebugMode = true
        debugPrint(getPropertyFromGroup('strumLineNotes', 7, 'x'))
        setProperty('scoreTxt.visible', false)
        setProperty('healthBarBG.y', getProperty('healthBarBG.y') + 30)
        setProperty('healthBar.y', getProperty('healthBar.y') + 30)
        setProperty('healthBarBG.x', getProperty('healthBarBG.x') - 200)
        setProperty('healthBar.x', getProperty('healthBar.x') - 200)
        setProperty('iconP1.visible', false)
        setProperty('iconP2.visible', false)

        makeLuaSprite('A', nil, getPropertyFromGroup('strumLineNotes', 7, 'x') + 120, 220)
        makeGraphic('A', 100, 100, '000000')
        setProperty('A.alpha', hudAlpha)
        setObjectCamera('A', 'hud')
        setObjectOrder('A', getObjectOrder('scoreTxt') + 1)
        addLuaSprite('A')
        
        makeLuaText('BigBalls', 'X', 0, getPropertyFromGroup('strumLineNotes', 7, 'x') + 120, getProperty('A.y') + 55)
        setTextSize('BigBalls', 40)
        setObjectCamera('BigBalls', 'hud')
        setProperty('BigBalls.alpha', textAlpha)
        setObjectOrder('BigBalls', getObjectOrder('scoreTxt') + 2)
        addLuaText('BigBalls')
    
        makeLuaText('BigDong', '', 0, getPropertyFromGroup('strumLineNotes', 7, 'x') + 150, getProperty('A.y') + 5)
        setTextSize('BigDong', 90)
        setProperty('BigDong.alpha', textAlpha)
        setObjectCamera('BigDong', 'hud')
        setObjectOrder('BigDong', getObjectOrder('scoreTxt') + 3)
        addLuaText('BigDong')
    
        makeLuaSprite('BigDick', nil, getPropertyFromGroup('strumLineNotes', 7, 'x') + 120, getProperty('A.y') - 1)
        makeGraphic('BigDick', 40, 1, 'f7ff0d')
        setProperty('BigDick.alpha', hudAlpha)
        setObjectCamera('BigDick', 'hud')
        setObjectOrder('BigDick', getObjectOrder('scoreTxt') + 4)
        addLuaSprite('BigDick')
        --ff9a0d
    
        makeLuaSprite('BigHumanMaleGenital', nil, getPropertyFromGroup('strumLineNotes', 7, 'x') + 120, getProperty('A.y') + 280)
        makeGraphic('BigHumanMaleGenital', 40, 1, '66edff')
        setProperty('BigHumanMaleGenital.alpha', hudAlpha)
        setObjectCamera('BigHumanMaleGenital', 'hud')
        setObjectOrder('BigHumanMaleGenital', getObjectOrder('scoreTxt') + 5)
        addLuaSprite('BigHumanMaleGenital')

        makeLuaSprite('BigHumanMaleGenital2', nil, getProperty('BigHumanMaleGenital.x') + 50, getProperty('BigHumanMaleGenital.y'))
        makeGraphic('BigHumanMaleGenital2', 40, 1, '66edff')
        setProperty('BigHumanMaleGenital2.alpha', hudAlpha)
        setObjectCamera('BigHumanMaleGenital2', 'hud')
        setObjectOrder('BigHumanMaleGenital2', getObjectOrder('scoreTxt') + 6)
        addLuaSprite('BigHumanMaleGenital2')

        makeLuaSprite('BigHumanMaleTesticles', nil, getPropertyFromGroup('strumLineNotes', 7, 'x') + 120, 530)
        makeGraphic('BigHumanMaleTesticles', 270, 100, '000000')
        setProperty('BigHumanMaleTesticles.alpha', hudAlpha)
        setObjectCamera('BigHumanMaleTesticles', 'hud')
        setObjectOrder('BigHumanMaleTesticles', getObjectOrder('scoreTxt') + 7)
        addLuaSprite('BigHumanMaleTesticles')

        makeLuaSprite('AlrStop', nil, getProperty('BigHumanMaleTesticles.x') + 270, getProperty('BigHumanMaleTesticles.y') - 10)
        makeGraphic('AlrStop', 100, 120, 'fff700')
        setProperty('AlrStop.alpha', hudAlpha)
        setObjectCamera('AlrStop', 'hud')
        setObjectOrder('AlrStop', getObjectOrder('scoreTxt') + 8)
        addLuaSprite('AlrStop')

        makeLuaText('Ok3', '', 0, getProperty('BigHumanMaleTesticles.x') + 280, getProperty('BigHumanMaleTesticles.y') - 10)
        setTextSize('Ok3', 120)
        setObjectCamera('Ok3', 'hud')
        setProperty('Ok3.alpha', textAlpha)
        setObjectOrder('Ok3', getObjectOrder('scoreTxt') + 9)
        addLuaText('Ok3')

        makeLuaText('Ok2', '0', 0, getPropertyFromGroup('strumLineNotes', 7, 'x') + 135, 560)
        setTextSize('Ok2', 40)
        setObjectCamera('Ok2', 'hud')
        setProperty('Ok2.alpha', textAlpha)
        setObjectOrder('Ok2', getObjectOrder('scoreTxt') + 9)
        addLuaText('Ok2')

        makeLuaSprite('damn', nil, getProperty('BigHumanMaleTesticles.x'), getProperty('BigHumanMaleTesticles.y') + 100)
        makeGraphic('damn', 270, 10, 'ff9900')
        setProperty('damn.alpha', hudAlpha)
        setObjectCamera('damn', 'hud')
        setObjectOrder('damn', getObjectOrder('scoreTxt') + 8)
        addLuaSprite('damn')

        makeLuaSprite('bamn', nil, getProperty('BigHumanMaleTesticles.x'), getProperty('BigHumanMaleTesticles.y') - 10)
        makeGraphic('bamn', 270, 10, '2e9dff')
        setProperty('bamn.alpha', 0)
        setObjectCamera('bamn', 'hud')
        setObjectOrder('bamn', getObjectOrder('scoreTxt') + 8)
        addLuaSprite('bamn')

        makeLuaSprite('gamn', nil, getProperty('BigHumanMaleTesticles.x') + 80, getProperty('BigHumanMaleTesticles.y') + 20)
        makeGraphic('gamn', 150, 80, '000000')
        setProperty('gamn.alpha', 0)
        setObjectCamera('gamn', 'hud')
        setObjectOrder('gamn', getObjectOrder('scoreTxt') + 9)
        addLuaSprite('gamn')

        makeLuaText('combonum', '0', 0, getProperty('gamn.x') + 10, getProperty('gamn.y') + 10)
        setTextSize('combonum', 40)
        setObjectCamera('combonum', 'hud')
        setProperty('combonum.alpha', 0)
        setObjectOrder('combonum', getObjectOrder('scoreTxt') + 10)
        addLuaText('combonum')

        makeLuaText('notifierCombo', getProperty('combo') .. ' Note Streak!', 0, 200, -500)
        setTextSize('notifierCombo', 80)
        setProperty('notifierCombo.alpha', textAlpha)
        setObjectCamera('notifierCombo', 'hud')
        setObjectOrder('notifierCombo', getObjectOrder('scoreTxt') + 100)
        setTextAlignment('notifierCombo', 'center')
        addLuaText('notifierCombo')
    
        thingyOne = xThingy * 100
        thingyThree = sThingy * 100
        thingyFour = sThingyTwo * 100
    end
end

local SongTime=1

function onSongStart()
	SongTime=getProperty('songLength')/1000

	doTweenX('TimeBarDrain', 'bamn.scale', 0.01, 0.01, 'linear')
    setProperty('bamn.alpha', hudAlpha)
end

function onTweenCompleted(tag)
	if tag == 'TimeBarDrain' then	
		setProperty('bamn.origin.x', 0)
		doTweenX('TimeBarFill', 'bamn.scale', 1, SongTime, 'linear')
	end
	
	if tag == 'BarBGFadeIn' then
		doTweenAlpha('BarFGFadeIn', 'bamn', 1, 0.5, 'linear')
	end

    if t == 'AAAA' then
        doTweenAlpha('gamnS', 'gamn', 0, 0.5, 'linear')
        doTweenAlpha('gamnSS', 'combonum', 0, 0.5, 'linear')
    end
end

function onUpdate()
    setTextString('combonum', getProperty('combo'))
    setTextString('Ok2', score)
	setProperty('BigDick.scale.y', thingyOne * 2)
	setProperty('BigDick.origin.y', 1)

    setProperty('BigHumanMaleGenital.scale.y', thingyThree * 2)
	setProperty('BigHumanMaleGenital.origin.y', 1)

    setProperty('BigHumanMaleGenital2.scale.y', thingyFour * 2)
	setProperty('BigHumanMaleGenital2.origin.y', 1)

    scaleObject('damn', barT / 100, 1)

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.' .. starKey) and thingyThree == 80 and not autoStar then
        usingStar = true
    end

    if usingStar then
        if thingyFour >= 0 then
            thingyFour = thingyFour - 0.2
        end

        if thingyFour <= 0 then
            thingyThree = thingyThree - 0.2
        end
    end

    if usingStar and thingyThree <= 0 then
        usingStar = false
    end

    if thingyTwo == 0 then
        if usingStar then setTextString('BigDong', '2') else setTextString('BigDong', '') end
        setProperty('BigDick.color', getColorFromHex('fae902'))
    elseif thingyTwo == 1 then
        if usingStar then setTextString('BigDong', '4') else setTextString('BigDong', '2') end
        setProperty('BigDick.color', getColorFromHex('fa9302'))
    elseif thingyTwo == 2 then
        if usingStar then setTextString('BigDong', '6') else setTextString('BigDong', '3') end
        setProperty('BigDick.color', getColorFromHex('40e802'))
    end

    if thingyOne >= 78 and thingyTwo == 2 then
        if usingStar then setTextString('BigDong', '8') else setTextString('BigDong', '4') end
        setProperty('BigDick.color', getColorFromHex('9361b0'))
    end

    
    if getProperty('combo') >= 30 then
        doTweenY('AAA', 'gamn', getProperty('BigHumanMaleTesticles.y') + 100, 0.5, 'cubeOut')
        doTweenY('AAA2', 'combonum', getProperty('BigHumanMaleTesticles.y') + 120, 0.6, 'cubeOut')
        doTweenAlpha('gamnS', 'gamn', hudAlpha, 0.5, 'linear')
        doTweenAlpha('gamnSS', 'combonum', hudAlpha, 0.5, 'linear')
    end

    if getProperty('combo') <= 30 then
        doTweenY('AAAA', 'gamn', getProperty('BigHumanMaleTesticles.y') + 20, 0.5, 'cubeIn')
        doTweenY('AAAA2', 'combonum', getProperty('BigHumanMaleTesticles.y') + 30, 0.6, 'cubeIn')
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    barT = barT + 0.2
    if not isSustainNote then
        if barT >= 100 then
            barT = 1
            barNumber1 = barNumber1 + 1
            setTextString('Ok3', barNumber1)
        end

        if thingyTwo == 0 then
            if usingStar then addScore(50) end
        elseif thingyTwo == 1 then
            addScore(50)
        elseif thingyTwo == 2 then
            addScore(100)
        elseif thingyTwo == 3 then
            addScore(150)
        elseif thingyTwo == 4 then
            addScore(200)
        elseif thingyTwo == 5 then
            addScore(250)
        elseif thingyTwo == 6 then
            addScore(300)
        elseif thingyTwo == 7 then
            addScore(350)
        elseif thingyTwo == 8 then
            addScore(400)
        end

        thingyOne = thingyOne + 5
        if not usingStar then
            thingyThree = thingyThree + 2
        end
    
        if thingyOne >= 80 and thingyTwo == 2 then
            thingyOne = 80
        end

        if thingyThree >= 80 then
            thingyThree = 80

            if not usingStar then
                thingyFour = thingyFour + 2
            end
        end

        if thingyFour >= 80 then
            thingyFour = 80

            if autoStar then
                usingStar = true
            end
        end
    
        if thingyOne >= 80 and thingyTwo ~= 2  then
            thingyTwo = thingyTwo + 1
            thingyOne = 0
        end
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        thingyTwo = 0
        setTextString('BigDong', '')
        thingyOne = 0
    end
end

function onRecalculateRating()
    if getProperty('combo') % 50 == 0 and getProperty('combo') ~= 0 then
        doTweenY('notifierComboY', 'notifierCombo', 100, 1, 'cubeOut')
        setTextString('notifierCombo', getProperty('combo') .. ' Note Streak!')
        runTimer('comboOut', 4)
    end
end

function onTimerCompleted(t)
    if t == 'comboOut' then
        doTweenY('notifierComboY', 'notifierCombo', -500, 1, 'cubeIn')
    end
end

local turnvalue = 10
function onBeatHit()
    turnvalue = 10
    if curBeat % 2 == 0 then
        turnvalue = -10
    end
    setProperty('notifierCombo.angle', turnvalue)

    scaleObject('notifierCombo', 1.2, 1.2)
    doTweenX('nCXScale', 'notifierCombo.scale', 1, 0.4, 'cubeOut')
    doTweenY('nCYScale', 'notifierCombo.scale', 1, 0.4, 'cubeOut')
    doTweenAngle('notifierComboAngle', 'notifierCombo', 0, crochet / 1000, 'circOut')
end