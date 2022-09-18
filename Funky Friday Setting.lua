--You Can Change Whatever You Want. Except I Say don't change 
local noteScaleD = 0.7 --Scale Of DAD/Opponent,Default:0.7
local noteScaleB = 0.7 --Scale Of BF/Player,Default:0.7
local noteOffsetX = -50 --Note OffsetX(Don't Change)
local noteOffsetY = -100 -- NOte OffsetY(Don't Change)
local backgroundNoteAlpha = 1.0 --Background Note(From 0 To 1)
function onCreatePost()
    setProperty('camHUD.alpha', 0)
    --Background Note
    makeLuaSprite('backgroundNote_1', 'empty', 0, 0)
    makeLuaSprite('backgroundNote_2', 'empty', 0, 0)
    makeLuaSprite('backgroundNote_3', 'empty', 0, 0)
    makeLuaSprite('backgroundNote_4', 'empty', 0, 0)
    makeGraphic('backgroundNote_1', 120, 750, '000000')
    makeGraphic('backgroundNote_2', 120, 750, '000000')
    makeGraphic('backgroundNote_3', 120, 750, '000000')
    makeGraphic('backgroundNote_4', 120, 750, '000000')
    addLuaSprite('backgroundNote_1', false)
    addLuaSprite('backgroundNote_2', false)
    addLuaSprite('backgroundNote_3', false)
    addLuaSprite('backgroundNote_4', false)
    setObjectCamera('backgroundNote_1', 'hud')
    setObjectCamera('backgroundNote_2', 'hud')
    setObjectCamera('backgroundNote_3', 'hud')
    setObjectCamera('backgroundNote_4', 'hud')
    setProperty('backgroundNote_1.alpha', backgroundNoteAlpha)
    setProperty('backgroundNote_2.alpha', backgroundNoteAlpha)
    setProperty('backgroundNote_3.alpha', backgroundNoteAlpha)
    setProperty('backgroundNote_4.alpha', backgroundNoteAlpha)
    --Scale Stuff
    if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
        for i=0, getProperty('opponentStrums.length')-1 do
            setPropertyFromGroup('opponentStrums', i, 'scale.x', noteScaleD)
            setPropertyFromGroup('opponentStrums', i, 'scale.y', noteScaleD)
        end
        for i=0, getProperty('playerStrums.length')-1 do
            setPropertyFromGroup('playerStrums', i, 'scale.x', noteScaleB)
            setPropertyFromGroup('playerStrums', i, 'scale.y', noteScaleB)
        end
        for i=0, getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
                setPropertyFromGroup('unspawnNotes', i, 'scale.x', noteScaleD)
                setPropertyFromGroup('unspawnNotes', i, 'scale.y', noteScaleD)
            end
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == true then
                setPropertyFromGroup('unspawnNotes', i, 'scale.x', noteScaleB)
                setPropertyFromGroup('unspawnNotes', i, 'scale.y', noteScaleB)
            end
        end
    end
    --Middle Scroll Stuff
    if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
        setPropertyFromGroup('opponentStrums', 0, 'x', (defaultOpponentStrumX0 + noteOffsetX))
        setPropertyFromGroup('opponentStrums', 1, 'x', (defaultOpponentStrumX0 + noteOffsetX) + (40 * (noteScaleD/0.7)))
        setPropertyFromGroup('opponentStrums', 2, 'x', (defaultOpponentStrumX0 + noteOffsetX) + (80 * (noteScaleD/0.7)))
        setPropertyFromGroup('opponentStrums', 3, 'x', (defaultOpponentStrumX0 + noteOffsetX) + (120 * (noteScaleD/0.7)))
    end
    if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
        for i=0, getProperty('opponentStrums.length')-1 do
            setPropertyFromGroup('opponentStrums', i, 'scale.x', 0.25 * (noteScaleD/0.7))
            setPropertyFromGroup('opponentStrums', i, 'scale.y', 0.25 * (noteScaleD/0.7))
        end
        for i=0, getProperty('playerStrums.length')-1 do
            setPropertyFromGroup('playerStrums', i, 'scale.x', noteScaleB)
            setPropertyFromGroup('playerStrums', i, 'scale.y', noteScaleB)
        end
        for i=0, getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
                setPropertyFromGroup('unspawnNotes', i, 'scale.x', 0.25 * (noteScaleD/0.7))
                setPropertyFromGroup('unspawnNotes', i, 'scale.y', 0.25 * (noteScaleD/0.7))
            end
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == true then
                setPropertyFromGroup('unspawnNotes', i, 'scale.x', noteScaleB)
                setPropertyFromGroup('unspawnNotes', i, 'scale.y', noteScaleB)
            end
        end
    end
    --Note Position Stuff
    if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
        if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
            for i=0,3 do
                setPropertyFromGroup('opponentStrums', i, 'y', defaultOpponentStrumY0 + noteOffsetY)
            end
        end
        if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
            for i=0,3 do
                setPropertyFromGroup('opponentStrums', i, 'y', defaultOpponentStrumY0 - noteOffsetY)
            end
        end
    end
end

function onUpdate()
    setProperty('backgroundNote_1.x', note_1_Off)
    setProperty('backgroundNote_2.x', note_2_Off)
    setProperty('backgroundNote_3.x', note_3_Off)
    setProperty('backgroundNote_4.x', note_4_Off)
    setProperty('backgroundNote_1.angle', note_1_Ang)
    setProperty('backgroundNote_2.angle', note_2_Ang)
    setProperty('backgroundNote_3.angle', note_3_Ang)
    setProperty('backgroundNote_4.angle', note_4_Ang)
    setProperty('timeBar.alpha', 0)
    note_1_Off = getPropertyFromGroup('playerStrums', 0, 'x') - 5
    note_2_Off = getPropertyFromGroup('playerStrums', 1, 'x') - 5
    note_3_Off = getPropertyFromGroup('playerStrums', 2, 'x') - 5
    note_4_Off = getPropertyFromGroup('playerStrums', 3, 'x') - 5
    note_1_Ang = getPropertyFromGroup('playerStrums', 0, 'direction') - 90
    note_2_Ang = getPropertyFromGroup('playerStrums', 1, 'direction') - 90
    note_3_Ang = getPropertyFromGroup('playerStrums', 2, 'direction') - 90
    note_4_Ang = getPropertyFromGroup('playerStrums', 3, 'direction') - 90
end

function onCreate()
end

function onSongStart()
    doTweenAlpha('camHUDA', 'camHUD', 1, 1)
    runTimer('alphaNote', 1, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'alphaNote' then
        noteTweenAlpha('note_1_Dad', 0, 1, 1)
        noteTweenAlpha('note_2_Dad', 1, 1, 1)
        noteTweenAlpha('note_3_Dad', 2, 1, 1)
        noteTweenAlpha('note_4_Dad', 3, 1, 1)
        noteTweenAlpha('note_1_Bf', 4, 1, 1)
        noteTweenAlpha('note_2_Bf', 5, 1, 1)
        noteTweenAlpha('note_3_Bf', 6, 1, 1)
        noteTweenAlpha('note_4_Bf', 7, 1, 1)
    end
end


--⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--⬛⬛🟪🟪🟪⬛⬛⬛⬛⬛⬛🟪🟪🟪⬛⬛
--⬛⬛🟪🟪🟪⬛⬛⬛⬛⬛⬛🟪🟪🟪⬛⬛
--⬛⬛🟪🟪🟪🟪🟪⬛⬛🟪🟪🟪🟪🟪⬛⬛
--⬛⬛🟪🟪🟪🟪🟪⬛⬛🟪🟪🟪🟪🟪⬛⬛
--⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--⬛⬛⬛⬛⬛🟪🟪🟪🟪🟪🟪⬛⬛⬛⬛⬛
--⬛⬛⬛⬛⬛🟪🟪🟪🟪🟪🟪⬛⬛⬛⬛⬛
--⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--Subscribe DubstepEnderDragon