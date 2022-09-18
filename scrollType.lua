local opponentStyle = nil
local playerStyle = nil

local screenStyleOpponent = nil

local screenPlayerStyle = nil

local lol = nil --Made to make some events play only once
local lol2 = nil

local playerStyle2 = nil

local ChangeNotesTime = false

local eventDuration = 0.2

local noteOffsetX = 25
local SustainNoteOffsetX = 10

local noteOffsetY = 0
local SustainNoteOffsetY = -32

local downScrollValue = -1

function onEvent(name,v1,v2)
    if name == 'Scroll Type' then
        opponentStyle = v1
        playerStyle = v2
        runTimer('changeOpponentNotesTo'..opponentStyle,eventDuration/2)
        runTimer('changePlayerNotesTo'..playerStyle,eventDuration/2)
    end
end

function onUpdate()
    if getPropertyFromClass('PlayState','isPixelStage') == true then
        noteOffsetX = -42
        noteOffsetY = -60
        SustainNoteOffsetX = -15
        SustainNoteOffsetY = -15
    end
    if downscroll then
        downScrollValue = 1
    else
        downScrollValue = -1
    end
    if lol ~= opponentStyle then
        for o = 0,3 do
            if opponentStyle == 'Up' then
                noteTweenX('NoteGoUpOppoonentX'..o, o, 92 + (110 *o),eventDuration, 'linear')
                noteTweenY('NoteGoUpOppoonentY'..o, o,50,0.2, 'linear')
                noteTweenAngle('NoteAngleLeftOpponent'..o, o,0,eventDuration,'linear')
                backAlpha()
            elseif opponentStyle == 'Down' then
                noteTweenX('NoteGoDownOpponentX'..o, o,92 + (110 *o),eventDuration, 'linear')
                noteTweenY('NoteGoDownOpponentY'..o, o,screenHeight - 150,eventDuration,'linear')
                noteTweenAngle('NoteAngleLeftOpponent'..o, o,0,eventDuration,'linear')
                backAlpha()
            elseif opponentStyle == 'Right' then
                noteTweenX('NoteGoRightOpponentX'..o, o,screenWidth - 150,eventDuration, 'linear')
                noteTweenY('NoteGoRightOpponentY'..o, o,screenHeight/2 - 200 + (110 * (o)),eventDuration,'linear')
                noteTweenAngle('NoteAngleRightPlayer'..o, o,90,eventDuration,'linear')
                backAlpha()
            elseif opponentStyle == 'Left' then
                noteTweenX('NoteGoLeftOpponentX'..o, o,50,eventDuration, 'linear')
                noteTweenY('NoteGoLeftOpponentY'..o, o,screenHeight - 200 - (110 * o),eventDuration,'linear')
                noteTweenAngle('NoteAngleLeftOpponent'..o, o,270,eventDuration,'linear')
                backAlpha()
            elseif opponentStyle == 'Undyne' then
                noteTweenX('NoteGoUndyneOpponentX0', 0,screenWidth/2 - 110,eventDuration, 'linear')
                noteTweenY('NoteGoUndyneOpponentY0'..0, 0,screenHeight/2 - 22.5,eventDuration,'linear')

                noteTweenX('NoteGoUndyneOpponentX1', 1,screenWidth/2,eventDuration, 'linear')
                noteTweenY('NoteGoUndyneOpponentY1', 1,screenHeight/2 + 55,eventDuration,'linear')

                noteTweenX('NoteGoUndyneOpponentX2', 2,screenWidth/2,eventDuration, 'linear')
                noteTweenY('NoteGoUndyneOpponentY2', 2,screenHeight/2 - 110,eventDuration,'linear')

                noteTweenX('NoteGoUndyneOpponentX3', 3,screenWidth/2 + 110,eventDuration, 'linear')
                noteTweenY('NoteGoUndyneOpponentY3', 3,screenHeight/2 - 22.5,eventDuration,'linear')

                noteTweenAngle('NoteAngleUndyneOpponent'..o, o,0,eventDuration,'linear')

                setPropertyFromGroup('strumLineNotes', o,'alpha', 0.2)

            elseif opponentStyle == 'Default' then
                backAlpha()
                noteTweenX('NoteGoDefaultOpponentX'..o, o,92 + (110 *o),eventDuration,'linear')
                noteTweenAngle('NoteAngleDefaultOpponent'..o, o,0,eventDuration,'linear')
                setPropertyFromGroup('strumLineNotes', o, 'alpha',1)

                if not downscroll then
  
                    noteTweenY('NoteGoDefaultPOpponentY'..o,o,50,0.2, 'linear')
                else
                    noteTweenY('NoteGoDefaultPOpponentY'..o, o,screenHeight - 150,0.2, 'linear')

                end
            end
        end

        lol = opponentStyle
    end
    if getPropertyFromGroup('notes' , notesLength, 'mustPress') == false then
        if screenStyleOpponent == 'Down'  then
            for notesLengthOpponent = 0,getProperty('notes.length')-1 do
                if getPropertyFromGroup('notes', notesLengthOpponent, 'isSustainNote') == true   then
                    setPropertyFromGroup('notes', notesLengthOpponent, 'flipY',true)

                end
            end
        elseif screenStyleOpponent == 'Up' then
            for notesLengthOpponent = 0,getProperty('notes.length')-1 do
                if getPropertyFromGroup('notes', notesLengthOpponent, 'isSustainNote') == true then
                    setPropertyFromGroup('notes', notesLengthOpponent, 'flipY',false)
                end
            end
        end
    end
    if lol2 ~= playerStyle then
        for p = 4,7 do
            if playerStyle == 'Down' then
                noteTweenX('NoteGoDownPlayerX'..p, p,732 + (110 *(p - 4)),eventDuration,'linear')
                noteTweenY('NoteGoDownPlayerY'..p, p,screenHeight - 150,eventDuration,'linear')
                noteTweenAngle('NoteAngleBackPlayer'..p, p,0,eventDuration,'linear')
                
            elseif playerStyle == 'Up' then
                noteTweenX('NoteGoUpPlayerX'..p, p,732 + (110 *(p - 4)),eventDuration,'linear')
                noteTweenY('NoteGoUpPlayerY'..p, p,50,0.2, 'linear')
                noteTweenAngle('NoteAngleBackPlayer'..p, p,0,eventDuration,'linear')
            elseif playerStyle == 'Right' then
                noteTweenX('NoteGoRightPlayerX'..p, p,screenWidth - 150,eventDuration, 'linear')
                noteTweenY('NoteGoRightPlayerY'..p, p,screenHeight/2 - 200 + (110 * (p - 4)),eventDuration,'linear')
                noteTweenAngle('NoteAngleRightPlayer'..p, p,90,eventDuration,'linear')

            elseif playerStyle == 'Left' then
                for p = 4,7 do
                    noteTweenX('NoteGoLeftPlayerX'..p, p,50,eventDuration, 'linear')
                    noteTweenY('NoteGoLeftPlayerY'..p, p,screenHeight - 200 - (110 * (p - 4)),eventDuration,'linear')
                    noteTweenAngle('NoteAngleLeftPlayer'..p, p,270,eventDuration,'linear')

                end
            elseif playerStyle == 'Undyne' then
                noteTweenX('NoteGoUndynePlayerX4', 4,screenWidth/2 - 110,eventDuration, 'linear')
                noteTweenY('NoteGoUndynePlayerY4', 4,screenHeight/2 - 22.5,eventDuration,'linear')

                noteTweenX('NoteGoUndynePlayerX5', 5,screenWidth/2,eventDuration, 'linear')
                noteTweenY('NoteGoUndynePlayerY5', 5,screenHeight/2 + 55,eventDuration,'linear')

                noteTweenX('NoteGoUndynePlayerX6', 6,screenWidth/2,eventDuration, 'linear')
                noteTweenY('NoteGoUndynePlayerY6', 6,screenHeight/2 - 110,eventDuration,'linear')

                noteTweenX('NoteGoUndynePlayerX7', 7,screenWidth/2 + 110,eventDuration, 'linear')
                noteTweenY('NoteGoUndynePlayerY7', 7,screenHeight/2 - 22.5,eventDuration,'linear')

                noteTweenAngle('NoteAngleUndynePlayer'..p, p,0,eventDuration,'linear')

            elseif playerStyle == 'Default' then

                noteTweenX('NoteGoDefaultPlayerX'..p, p,732 + (110 *(p - 4)),eventDuration,'linear')
                noteTweenAngle('NoteAngleDefaultPlayer'..p, p,0,eventDuration,'linear')
                if not downscroll then
  
                    noteTweenY('NoteGoDefaultPlayerY'..p, p,50,0.2, 'linear')
                else
                    noteTweenY('NoteGoDefaultPlayerY'..p, p,screenHeight - 150,0.2, 'linear')
                end
            end
        end

        lol2 = playerStyle
    end
    for notesLengthAll = 0,getProperty('notes.length')-1 do
        if getPropertyFromGroup('notes', notesLengthAll, 'mustPress') == true then
            if screenPlayerStyle == 'Left' then
                if not getPropertyFromGroup('notes', notesLengthAll, 'isSustainNote') then
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (noteOffsetY * downScrollValue))
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.x',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (noteOffsetX * downScrollValue))
                else
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (SustainNoteOffsetY * downScrollValue))
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.x',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) + (SustainNoteOffsetX * downScrollValue))
                    setPropertyFromGroup('notes',notesLengthAll, 'angle',270)
                    setPropertyFromGroup('notes', notesLengthAll, 'flipY',false)
                end
            elseif screenPlayerStyle == 'Right' then
                if not getPropertyFromGroup('notes', notesLengthAll, 'isSustainNote') then
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (noteOffsetY * downScrollValue))
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.x',0 - (0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (noteOffsetX * downScrollValue))
                else
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (SustainNoteOffsetY * downScrollValue))
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.x',0 - (0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (SustainNoteOffsetX * downScrollValue))
                    setPropertyFromGroup('notes',notesLengthAll, 'angle',90)
                    setPropertyFromGroup('notes', notesLengthAll, 'flipY',false)
                end
            elseif screenPlayerStyle == 'Undyne' then
                if getPropertyFromGroup('notes', notesLengthAll, 'noteData') == 0 then
                    if not getPropertyFromGroup('notes', notesLengthAll, 'isSustainNote') then
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (noteOffsetY * downScrollValue))
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.x',0 - (0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (noteOffsetX * downScrollValue))
                    else
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (SustainNoteOffsetY * downScrollValue))
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.x',0 - (0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (SustainNoteOffsetX * downScrollValue))
                        setPropertyFromGroup('notes',notesLengthAll, 'angle',90)
                        setPropertyFromGroup('notes', notesLengthAll, 'flipY',false)
                    end
                elseif getPropertyFromGroup('notes', notesLengthAll, 'noteData') == 1 or getPropertyFromGroup('notes', notesLengthAll, 'noteData') == 2 then
                    setPropertyFromGroup('notes', notesLengthAll, 'flipY',false)
                    backOffset(getPropertyFromGroup('notes', notesLengthAll, 'noteData'),notesLengthAll)
                elseif getPropertyFromGroup('notes', notesLengthAll, 'noteData') == 3 then
                    if not getPropertyFromGroup('notes', notesLengthAll, 'isSustainNote') then
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (noteOffsetY * downScrollValue))
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.x',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (noteOffsetX * downScrollValue))
                    elseif getPropertyFromGroup('notes', notesLengthAll, 'isSustainNote') then
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (SustainNoteOffsetY * downScrollValue))
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.x',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (SustainNoteOffsetX * downScrollValue))
                        setPropertyFromGroup('notes',notesLengthAll, 'angle',270)
                        setPropertyFromGroup('notes', notesLengthAll, 'flipY',false)
                    end
                end
            end
        end
        if getPropertyFromGroup('notes', notesLengthAll, 'mustPress') == false then
            if screenStyleOpponent == 'Left' then
                if not getPropertyFromGroup('notes', notesLengthAll, 'isSustainNote') then
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (noteOffsetY * downScrollValue))
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.x',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (noteOffsetX * downScrollValue))
                else
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (SustainNoteOffsetY * downScrollValue))
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.x',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (SustainNoteOffsetX * downScrollValue))
                    setPropertyFromGroup('notes',notesLengthAll, 'angle',270)
                    setPropertyFromGroup('notes', notesLengthAll, 'flipY',false)
                end
            elseif screenStyleOpponent == 'Right' then
                if not getPropertyFromGroup('notes', notesLengthAll, 'isSustainNote') then
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (noteOffsetY * downScrollValue))
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.x',0 - (0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (noteOffsetX * downScrollValue))
                else
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (SustainNoteOffsetY * downScrollValue))
                    setPropertyFromGroup('notes',notesLengthAll, 'offset.x',0 - (0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (SustainNoteOffsetX * downScrollValue))
                    setPropertyFromGroup('notes',notesLengthAll, 'angle',90)
                    setPropertyFromGroup('notes', notesLengthAll, 'flipY',false)
                end
            elseif screenStyleOpponent == 'Undyne' then
                if getPropertyFromGroup('notes', notesLengthAll, 'noteData') == 0 then
                    if not getPropertyFromGroup('notes', notesLengthAll, 'isSustainNote') then
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (noteOffsetY * downScrollValue))
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.x',0 - (0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (noteOffsetX * downScrollValue))
                    else
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (SustainNoteOffsetY * downScrollValue))
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.x',0 - (0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (SustainNoteOffsetX * downScrollValue))
                        setPropertyFromGroup('notes',notesLengthAll, 'angle',90)
                        setPropertyFromGroup('notes', notesLengthAll, 'flipY',false)
                    end
                elseif getPropertyFromGroup('notes', notesLengthAll, 'noteData') == 1 or getPropertyFromGroup('notes', notesLengthAll, 'noteData') == 2 then
                    setPropertyFromGroup('notes', notesLengthAll, 'flipY',false)
                    backOffset(getPropertyFromGroup('notes', notesLengthAll, 'noteData'),notesLengthAll)
                elseif getPropertyFromGroup('notes', notesLengthAll, 'noteData') == 3 then
                    if not getPropertyFromGroup('notes', notesLengthAll, 'isSustainNote') then
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (noteOffsetY * downScrollValue))
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.x',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (noteOffsetX * downScrollValue))
                    elseif getPropertyFromGroup('notes', notesLengthAll, 'isSustainNote') then
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.y',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * (scrollSpeed * -1)) - (SustainNoteOffsetY * downScrollValue))
                        setPropertyFromGroup('notes',notesLengthAll, 'offset.x',(0.45 * (getSongPosition() - getPropertyFromGroup('notes', notesLengthAll,'strumTime')) * scrollSpeed) - (SustainNoteOffsetX * downScrollValue))
                        setPropertyFromGroup('notes',notesLengthAll, 'angle',270)
                        setPropertyFromGroup('notes', notesLengthAll, 'flipY',false)
                    end
                end
            end
        end
    end
end


function onTimerCompleted(tag)
    if tag == 'changeOpponentNotesTo'..opponentStyle then
        if opponentStyle == 'Down' then
            backOffset()
            backAlpha(false,true)
            for FlipOpponentNotes = 0,3 do
                setPropertyFromGroup('strumLineNotes', FlipOpponentNotes,'downScroll',true)
            end
            if getPropertyFromGroup('notes' , notesLength, 'mustPress') == false then
                if opponentStyle == 'Down' then
                    backOffset()
                    for notesLengthOpponent = 0,getProperty('notes.length')-1 do
                        if getPropertyFromGroup('notes', notesLengthOpponent, 'isSustainNote') == true then
                            setPropertyFromGroup('notes', notesLengthOpponent, 'flipY',true)
                        end
                    end
                end
            end
            screenStyleOpponent = 'Down'
        elseif opponentStyle == 'Up' or opponentStyle == 'Left' or opponentStyle == 'Right' then
            backAlpha(false,true)
            for FlipOpponentNotes = 0,3 do
                setPropertyFromGroup('strumLineNotes', FlipOpponentNotes,'downScroll',false)
            end

            if opponentStyle == 'Up' then
                backOffset()
                for notesLengthOpponent = 0,getProperty('notes.length')-1 do
                    if getPropertyFromGroup('notes', notesLengthOpponent, 'isSustainNote') == true then
                        setPropertyFromGroup('notes', notesLengthOpponent, 'flipY',false)
                    end
                end
            end
            screenStyleOpponent = opponentStyle

        elseif opponentStyle == 'Default' then
            backOffset()
            backAlpha(false,true)
            for FlipOpponentNotes = 0,3 do
                setPropertyFromGroup('strumLineNotes', FlipOpponentNotes,'downScroll',downscroll)
            end
            screenStyleOpponent = 'Default'

        elseif opponentStyle == 'Undyne' then
            setPropertyFromGroup('strumLineNotes', 0,'downScroll',false)

            setPropertyFromGroup('strumLineNotes', 1,'downScroll',false)

            setPropertyFromGroup('strumLineNotes', 2,'downScroll',true)

            setPropertyFromGroup('strumLineNotes', 3,'downScroll',false)
            screenStyleOpponent = 'Undyne'
        elseif opponentStyle ~= '' and opponentStyle ~= nil and opponentStyle ~= '' and opponentStyle ~= 'Up' and opponentStyle ~= 'Down' then
            screenStyleOpponent = opponentStyle
        else
            screenStyleOpponent = nil
        end
    end
    if tag == 'changePlayerNotesTo'..playerStyle then
        if playerStyle == 'Down' then
            backOffset()
            backAlpha(true,false)
            for FlipPlayerNotes = 4,7 do
                setPropertyFromGroup('strumLineNotes', FlipPlayerNotes,'downScroll',true)
            end

            for notesLengthPlayer = 0,getProperty('notes.length')-1 do
                if getPropertyFromGroup('notes', notesLengthPlayer, 'isSustainNote') == true then
                    setPropertyFromGroup('notes', notesLengthPlayer, 'flipY',true)
                end
            end
            screenPlayerStyle = 'Down'

        elseif playerStyle == 'Up' or playerStyle == 'Left' or playerStyle == 'Right' then
            backAlpha(true,false)
            for FlipPlayerNotes = 4,7 do
                setPropertyFromGroup('strumLineNotes', FlipPlayerNotes,'downScroll',false)
            end

            if playerStyle == 'Up' then
                backOffset()
                for notesLengthPlayer = 0,getProperty('notes.length')-1 do
                    if getPropertyFromGroup('notes', notesLengthPlayer, 'isSustainNote') == true then
                        setPropertyFromGroup('notes', notesLengthPlayer, 'flipY',false)
                    end
                end
            end
            screenPlayerStyle = playerStyle
            
        elseif playerStyle == 'Default' then
            backAlpha(true,false)
            backOffset()
            for FlipPlayerNotes = 4,7 do
                setPropertyFromGroup('strumLineNotes', FlipPlayerNotes,'downScroll',downscroll)
            end
            screenPlayerStyle = 'Default'
        elseif playerStyle == 'Undyne' then
            setPropertyFromGroup('strumLineNotes', 4,'downScroll',false)

            setPropertyFromGroup('strumLineNotes', 5,'downScroll',false)

            setPropertyFromGroup('strumLineNotes', 6,'downScroll',true)

            setPropertyFromGroup('strumLineNotes', 7,'downScroll',false)
            screenPlayerStyle = 'Undyne'
        elseif playerStyle ~= '' and playerStyle ~= nil and playerStyle ~= '' and playerStyle ~= 'Up' and playerStyle ~= 'Down' then

            screenPlayerStyle = playerStyle
        else
            screenPlayerStyle = nil
        end
    end
end

function backAlpha(player,opponent)
    if not middleScroll and opponent == true then
        for strumOpponent = 0,3 do
            setPropertyFromGroup('strumLineNotes', strumOpponent, 'alpha',1)
        end
    elseif middleScroll and opponent == true then
        for strumOpponent = 0,3 do
            setPropertyFromGroup('strumLineNotes', strumOpponent, 'alpha',0.35)
        end
    end
    if not middleScroll and player == true then
        for strumPlayer = 0,3 do
            setPropertyFromGroup('strumLineNotes', strumPlayer + 4, 'alpha',1)
        end
    elseif middleScroll and player == true then
        for strumPlayer = 0,3 do  

            setPropertyFromGroup('strumLineNotes', strumPlayer + 4, 'alpha',0.35)
        end
    end
end
function backOffset(noteData,noteLength)
    if noteData ~= '' and noteData ~= nil then
        if getPropertyFromGroup('notes', noteLength, 'noteData') == noteData then
            if getPropertyFromGroup('notes',noteLength,'isSustainNote') == false then
                setPropertyFromGroup('notes',noteLength, 'offset.y',noteOffsetY)
                setPropertyFromGroup('notes',noteLength, 'offset.x',noteOffsetX)
                setPropertyFromGroup('notes',noteLength, 'angle',0)
            elseif getPropertyFromGroup('notes',noteLength,'isSustainNote') == true then
                setPropertyFromGroup('notes',noteLength, 'offset.y',SustainNoteOffsetY)
                setPropertyFromGroup('notes',noteLength, 'offset.x',SustainNoteOffsetX)
                setPropertyFromGroup('notes',noteLength, 'angle',0)
                setPropertyFromGroup('notes',noteLength, 'flipY',downscroll)
            end

        end
    else
        for backOffsetNotes = 0, getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes',backOffsetNotes,'isSustainNote') == false then
                setPropertyFromGroup('notes',backOffsetNotes, 'offset.y',noteOffsetY)
                setPropertyFromGroup('notes',backOffsetNotes, 'offset.x',noteOffsetX)
                setPropertyFromGroup('notes',backOffsetNotes, 'angle',0)
            elseif getPropertyFromGroup('notes',backOffsetNotes,'isSustainNote') == true then
                setPropertyFromGroup('notes',backOffsetNotes, 'offset.y',SustainNoteOffsetY)
                setPropertyFromGroup('notes',backOffsetNotes, 'offset.x',SustainNoteOffsetX)
                setPropertyFromGroup('notes',backOffsetNotes, 'angle',0)
                setPropertyFromGroup('notes',backOffsetNotes, 'flipY',downscroll)
            end
        end
    end
end