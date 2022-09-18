-- function goodNoteHit() 
--     if noteData == 0 then
--     setProperty('sprite.color', getColorFromHex('color shit in hex'))
--     end
-- end

-- local defaultVert = false
-- local defaultHori = false
-- local Vertical = false -- True is downscroll, false is upscroll
-- local Horizontal = false -- True is middlescroll, false is sidescroll

-- local updateLabels = false
-- local hscriptExists = true
-- local chartingMode

-- Vertical = downscroll
-- defaultVert = Vertical
-- Horizontal = middlescroll
-- defaultHori = Horizontal
function Scroll()
    setPropertyFromGroup('playerStrums', 0, 'downScroll', true)
    setPropertyFromGroup('playerStrums', 1, 'downScroll', true)
    setPropertyFromGroup('playerStrums', 2, 'downScroll', true)
    setPropertyFromGroup('playerStrums', 3, 'downScroll', true)
    setPropertyFromGroup('playerStrums', 0, 'y', 625)
    setPropertyFromGroup('playerStrums', 1, 'y', 625)
    setPropertyFromGroup('playerStrums', 2, 'y', 625)
    setPropertyFromGroup('playerStrums', 3, 'y', 625)
    
    setPropertyFromGroup("strumLineNotes", 4, "x", 700)
    setPropertyFromGroup("strumLineNotes", 5, "x", 827)
    setPropertyFromGroup("strumLineNotes", 6, "x", 949)
    setPropertyFromGroup("strumLineNotes", 7, "x", 1070)

    setPropertyFromGroup("strumLineNotes", 4, "direction", 97.5)
    setPropertyFromGroup("strumLineNotes", 5, "direction", 92.5)
    setPropertyFromGroup("strumLineNotes", 6, "direction", 87.5)
    setPropertyFromGroup("strumLineNotes", 7, "direction", 85)


    setPropertyFromGroup('opponentStrums', 0, 'downScroll', true)
	setPropertyFromGroup('opponentStrums', 1, 'downScroll', false)
	setPropertyFromGroup('opponentStrums', 2, 'downScroll', true)
	setPropertyFromGroup('opponentStrums', 3, 'downScroll', false)
	setPropertyFromGroup('opponentStrums', 0, 'y', 625)
	-- setPropertyFromGroup('opponentStrums', 1, 'y', 625)
	setPropertyFromGroup('opponentStrums', 2, 'y', 625)
	-- setPropertyFromGroup('opponentStrums', 3, 'y', 625)
		
	setPropertyFromGroup("strumLineNotes", 0, "x", 75)
	-- setPropertyFromGroup("strumLineNotes", 1, "x", 202)
	setPropertyFromGroup("strumLineNotes", 2, "x", 324)
	-- setPropertyFromGroup("strumLineNotes", 3, "x", 445)
		
	setPropertyFromGroup("strumLineNotes", 0, "direction", 97.5)
	-- setPropertyFromGroup("strumLineNotes", 1, "direction", 92.5)
	setPropertyFromGroup("strumLineNotes", 2, "direction", 87.5)
	-- setPropertyFromGroup("strumLineNotes", 3, "direction", 85)

    triggerEvent('Change Scrolltype', 'off', '')
end

function onSongStart()
    setPropertyFromClass('openfl.Lib','application.window.fullscreen', true)
end

function onSongEnd()
    setPropertyFromClass('openfl.Lib','application.window.fullscreen', false)
end

function onCreate()
    Scroll()
end

function onUpdate() 
    Scroll()
end

function goodNoteHit()
    
    setPropertyFromGroup('playerStrums', 0, 'downScroll', true)
    setPropertyFromGroup('playerStrums', 1, 'downScroll', true)
    setPropertyFromGroup('playerStrums', 2, 'downScroll', true)
    setPropertyFromGroup('playerStrums', 3, 'downScroll', true)
    setPropertyFromGroup('playerStrums', 0, 'y', 625)
    setPropertyFromGroup('playerStrums', 1, 'y', 625)
    setPropertyFromGroup('playerStrums', 2, 'y', 625)
    setPropertyFromGroup('playerStrums', 3, 'y', 625)
    
    setPropertyFromGroup("strumLineNotes", 4, "x", 700)
    setPropertyFromGroup("strumLineNotes", 5, "x", 827)
    setPropertyFromGroup("strumLineNotes", 6, "x", 949)
    setPropertyFromGroup("strumLineNotes", 7, "x", 1070)

    setPropertyFromGroup("strumLineNotes", 4, "direction", 97.5)
    setPropertyFromGroup("strumLineNotes", 5, "direction", 92.5)
    setPropertyFromGroup("strumLineNotes", 6, "direction", 87.5)
    setPropertyFromGroup("strumLineNotes", 7, "direction", 85)


    setPropertyFromGroup('opponentStrums', 0, 'downScroll', true)
	setPropertyFromGroup('opponentStrums', 1, 'downScroll', false)
	setPropertyFromGroup('opponentStrums', 2, 'downScroll', false)
	setPropertyFromGroup('opponentStrums', 3, 'downScroll', true)
	setPropertyFromGroup('opponentStrums', 0, 'y', 625)
	-- setPropertyFromGroup('opponentStrums', 1, 'y', 625)
	-- setPropertyFromGroup('opponentStrums', 2, 'y', 625)
	setPropertyFromGroup('opponentStrums', 3, 'y', 625)
		
	setPropertyFromGroup("strumLineNotes", 0, "x", 75)
	-- setPropertyFromGroup("strumLineNotes", 1, "x", 202)
	-- setPropertyFromGroup("strumLineNotes", 2, "x", 324)
	setPropertyFromGroup("strumLineNotes", 3, "x", 445)
		
	setPropertyFromGroup("strumLineNotes", 0, "direction", 97.5)
	-- setPropertyFromGroup("strumLineNotes", 1, "direction", 92.5)
	-- setPropertyFromGroup("strumLineNotes", 2, "direction", 87.5)
	setPropertyFromGroup("strumLineNotes", 3, "direction", 85)

    -- triggerEvent('Change Scrolltype', 'off', '')
end

function opponentNoteHit()
    
    setPropertyFromGroup('playerStrums', 0, 'downScroll', true)
    setPropertyFromGroup('playerStrums', 1, 'downScroll', true)
    setPropertyFromGroup('playerStrums', 2, 'downScroll', true)
    setPropertyFromGroup('playerStrums', 3, 'downScroll', true)
    setPropertyFromGroup('playerStrums', 0, 'y', 625)
    setPropertyFromGroup('playerStrums', 1, 'y', 625)
    setPropertyFromGroup('playerStrums', 2, 'y', 625)
    setPropertyFromGroup('playerStrums', 3, 'y', 625)
    
    setPropertyFromGroup("strumLineNotes", 4, "x", 700)
    setPropertyFromGroup("strumLineNotes", 5, "x", 827)
    setPropertyFromGroup("strumLineNotes", 6, "x", 949)
    setPropertyFromGroup("strumLineNotes", 7, "x", 1070)

    setPropertyFromGroup("strumLineNotes", 4, "direction", 97.5)
    setPropertyFromGroup("strumLineNotes", 5, "direction", 92.5)
    setPropertyFromGroup("strumLineNotes", 6, "direction", 87.5)
    setPropertyFromGroup("strumLineNotes", 7, "direction", 85)


    setPropertyFromGroup('opponentStrums', 0, 'downScroll', true)
	setPropertyFromGroup('opponentStrums', 1, 'downScroll', false)
	setPropertyFromGroup('opponentStrums', 2, 'downScroll', false)
	setPropertyFromGroup('opponentStrums', 3, 'downScroll', true)
	setPropertyFromGroup('opponentStrums', 0, 'y', 625)
	-- setPropertyFromGroup('opponentStrums', 1, 'y', 625)
	-- setPropertyFromGroup('opponentStrums', 2, 'y', 625)
	setPropertyFromGroup('opponentStrums', 3, 'y', 625)
		
	setPropertyFromGroup("strumLineNotes", 0, "x", 75)
	-- setPropertyFromGroup("strumLineNotes", 1, "x", 202)
	-- setPropertyFromGroup("strumLineNotes", 2, "x", 324)
	setPropertyFromGroup("strumLineNotes", 3, "x", 445)
		
	setPropertyFromGroup("strumLineNotes", 0, "direction", 97.5)
	-- setPropertyFromGroup("strumLineNotes", 1, "direction", 92.5)
	-- setPropertyFromGroup("strumLineNotes", 2, "direction", 87.5)
	setPropertyFromGroup("strumLineNotes", 3, "direction", 85)

    -- triggerEvent('Change Scrolltype', 'off', '')
end

function onStartCountdown()
    setTextString('botplayTxt', 'Sussy Baka')
    -- setTextFont('botplayTxt', "*PutYourFontHere*.ttf");
    setTextColor('botplayTxt', '0, 0, 0')
end

function onUpdate() 
    if keysJustPressed == 'f' then
        setProperty('camHUD.flipX', true)
        -- if setProperty('camHUD.flipX', true) then
        --     setProperty('camHUD.flipX', false)
        -- end
    end
end