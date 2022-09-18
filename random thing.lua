-- This was made by Linkmain https://www.youtube.com/channel/UCOwez2daa22BzqEnDfhR2cQ

function onEvent(name, value1, value2)
    
    math.randomseed(os.time())

    random1 = math.random(360, 900);
    random2 = math.random(360, 900);
    random3 = math.random(360, 900);
    random4 = math.random(360, 900);
    random1 = math.random(360, 900);
    random5 = math.random(200, 500);
    random6 = math.random(200, 500);
    random7 = math.random(200, 500);
    random8 = math.random(200, 500);
    random9 = math.random(20, 360);
    random10 = math.random(20, 360);
    random11 = math.random(20, 360);
    random12 = math.random(20, 360);
    random13 = math.random(20, 360);
    random14 = math.random(20, 360);
    random15 = math.random(20, 360);
    random16 = math.random(20, 360);

    
    noteTweenX('opponentLeft', 0, -500, 5, circInOut)
    noteTweenX('opponentDown', 1, -500, 5, circInOut)
    noteTweenX('opponentUp', 2, -500, 5, circInOut)
    noteTweenX('opponentRight', 3, -500, 5, circInOut)  
    
    noteTweenX('x1', 4, random1, 0.2, circInOut)
    noteTweenX('x2', 5, random2, 0.2, circInOut)
    noteTweenX('x3', 6, random3, 0.2, circInOut)
    noteTweenX('x4', 7, random4, 0.2, circInOut)
    noteTweenY('y1', 4, random5, 0.2, circInOut)
    noteTweenY('y2', 5, random6, 0.2, circInOut)
    noteTweenY('y3', 6, random7, 0.2, circInOut)
    noteTweenY('y4', 7, random8, 0.2, circInOut)
    noteTweenDirection('leftTween', 4, random9, 1, circInOut)
    noteTweenDirection('DownTween', 5, random10, 1, circInOut)
    noteTweenDirection('UpTween', 6, random11, 1, circInOut)
    noteTweenDirection('RightTween', 7, random12, 1, circInOut)
    noteTweenAngle('angle1', 4, random13, 0.2, circInOut)
    noteTweenAngle('angle2', 5, random14, 0.2, circInOut)
    noteTweenAngle('angle3', 7, random15, 0.2, circInOut)
    noteTweenAngle('angle4', 6, random16, 0.2, circInOut)

    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)   

end

function onUpdatePost(elapsed)
	noteCount = getProperty('notes.length');

	for i = 0, noteCount-1 do

		noteData = getPropertyFromGroup('notes', i, 'noteData')
		if getPropertyFromGroup('notes', i, 'isSustainNote') then
            if (getPropertyFromGroup('notes', i, 'mustPress')) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("playerStrums", noteData, 'direction') - 90)
            else
				
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("opponentStrums", noteData, 'direction') - 90)
            end	
		else
            if (noteData >= 4) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("playerStrums", noteData, 'angle'))
            else
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("opponentStrums", noteData, 'angle'))
            end	
		end
	end
end
    