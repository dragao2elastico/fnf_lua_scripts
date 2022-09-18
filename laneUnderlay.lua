local leftColorDad = 'c24b99'

function onCreate()
    if getPropertyFromClass('ClientPrefs', 'underlay', true) then
        
      
        makeAnimatedLuaSprite('laneUnderlay', 'laneUnderlays', defaultPlayerStrumX0, -1);
        makeGraphic('laneUnderlay', 464, 1000, '000000')
        doTweenAlpha('laneUnderlayout', 'laneUnderlay', 0.40, 0.5, 'linear')
        setObjectCamera('laneUnderlay', 'hud')
        setScrollFactor('laneUnderlay', 0)
        addLuaSprite('laneUnderlay', false)
        scaleObject('laneUnderlay', 0.23, 1);

        makeAnimatedLuaSprite('laneUnderlay2', 'laneUnderlays', 410, -1);
	    makeGraphic('laneUnderlay2', 476, 1000, '000000')
        doTweenAlpha('laneUnderlay2out', 'laneUnderlay2', 0.40, 0.5, 'linear')
        setObjectCamera('laneUnderlay2', 'hud')
        setScrollFactor('laneUnderlay2', 0)
        addLuaSprite('laneUnderlay2', false)
        scaleObject('laneUnderlay2', 0.23, 1);


        makeAnimatedLuaSprite('laneUnderlay3', 'laneUnderlays', 410, -1);
        makeGraphic('laneUnderlay3', 476, 1000, '000000')
        doTweenAlpha('laneUnderlay3out', 'laneUnderlay3', 0.40, 0.5, 'linear')
        setObjectCamera('laneUnderlay3', 'hud')
        setScrollFactor('laneUnderlay3', 0)
        addLuaSprite('laneUnderlay3', false)
        scaleObject('laneUnderlay3', 0.23, 1);

        makeAnimatedLuaSprite('laneUnderlay4', 'laneUnderlays', 410, -1);
	    makeGraphic('laneUnderlay4', 464, 1000, '000000')
        doTweenAlpha('laneUnderlay4out', 'laneUnderlay4', 0.40, 0.5, 'linear')
        setObjectCamera('laneUnderlay4', 'hud')
        setScrollFactor('laneUnderlay4', 0)
        addLuaSprite('laneUnderlay4', false)
        scaleObject('laneUnderlay4', 0.23, 1);


        makeAnimatedLuaSprite('laneUnderlaycolor', 'laneUnderlays', defaultPlayerStrumX0+100, -1);
        makeGraphic('laneUnderlaycolor', 464, 1000, leftColorDad)
        doTweenAlpha('laneUnderlayoutcolor', 'laneUnderlaycolor', 0, 0.001, 'linear')
        setObjectCamera('laneUnderlaycolor', 'hud')
        setScrollFactor('laneUnderlaycolor', 0)
        addLuaSprite('laneUnderlaycolor', false)
        scaleObject('laneUnderlaycolor', 0.23, 1);

        makeAnimatedLuaSprite('laneUnderlay2color', 'laneUnderlays', defaultPlayerStrumX1, -1);
        makeGraphic('laneUnderlay2color', 476, 1000, '00ffff')
        doTweenAlpha('laneUnderlay2colorout', 'laneUnderlay2color', 0, 0.0001, 'linear')
        setObjectCamera('laneUnderlay2color', 'hud')
        setScrollFactor('laneUnderlay2color', 0)
        addLuaSprite('laneUnderlay2color', false)
        scaleObject('laneUnderlay2color', 0.23, 1);

        makeAnimatedLuaSprite('laneUnderlay3color', 'laneUnderlays', defaultOpponentStrumX2, -1);
        doTweenAlpha('laneUnderlay3outcolor', 'laneUnderlay3color', 0, 0.00005, 'linear')
        makeGraphic('laneUnderlay3color', 476, 1000, '12fa05')
        setObjectCamera('laneUnderlay3color', 'hud')
        setScrollFactor('laneUnderlay3color', 0)
        addLuaSprite('laneUnderlay3color', false)
        scaleObject('laneUnderlay3color', 0.23, 1);

        makeAnimatedLuaSprite('laneUnderlay4color', 'laneUnderlays', defaultOpponentStrumX3, -1);
        doTweenAlpha('laneUnderlay4colorout', 'laneUnderlay4color', 0, 0.0005, 'linear')
        makeGraphic('laneUnderlay4color', 464, 1000, 'f9393f')
        setObjectCamera('laneUnderlay4color', 'hud')
        setScrollFactor('laneUnderlay4color', 0)
        addLuaSprite('laneUnderlay4color', false)
        scaleObject('laneUnderlay4color', 0.23, 1);




        makeAnimatedLuaSprite('laneUnderlay5', 'laneUnderlays', defaultOpponentStrumX0+100, -1);
        makeGraphic('laneUnderlay5', 464, 1000, '000000')
        doTweenAlpha('laneUnderlay5out', 'laneUnderlay5', 0.40, 0.5, 'linear')
        setObjectCamera('laneUnderlay5', 'hud')
        setScrollFactor('laneUnderlay5', 0)
        addLuaSprite('laneUnderlay5', false)
        scaleObject('laneUnderlay5', 0.23, 1);

        makeAnimatedLuaSprite('laneUnderlay5color', 'laneUnderlays', defaultOpponentStrumX0+100, -1);
        makeGraphic('laneUnderlay5color', 464, 1000, leftColorDad)
        doTweenAlpha('laneUnderlay5outcolor', 'laneUnderlay5color', 0, 0.001, 'linear')
        setObjectCamera('laneUnderlay5color', 'hud')
        setScrollFactor('laneUnderlay5color', 0)
        addLuaSprite('laneUnderlay5color', false)
        scaleObject('laneUnderlay5color', 0.23, 1);

        makeAnimatedLuaSprite('laneUnderlay6', 'laneUnderlays', defaultOpponentStrumX1, -1);
        makeGraphic('laneUnderlay6', 476, 1000, '000000')
        doTweenAlpha('laneUnderlay6out', 'laneUnderlay6', 0.40, 0.5, 'linear')
        setObjectCamera('laneUnderlay6', 'hud')
        setScrollFactor('laneUnderlay6', 0)
        addLuaSprite('laneUnderlay6', false)
        scaleObject('laneUnderlay6', 0.23, 1);

        makeAnimatedLuaSprite('laneUnderlay6color', 'laneUnderlays', defaultOpponentStrumX1, -1);
        makeGraphic('laneUnderlay6color', 476, 1000, '00ffff')
        doTweenAlpha('laneUnderlay6colorout', 'laneUnderlay6color', 0, 0.0001, 'linear')
        setObjectCamera('laneUnderlay6color', 'hud')
        setScrollFactor('laneUnderlay6color', 0)
        addLuaSprite('laneUnderlay6color', false)
        scaleObject('laneUnderlay6color', 0.23, 1);


        makeAnimatedLuaSprite('laneUnderlay7', 'laneUnderlays', defaultOpponentStrumX2, -1);
        doTweenAlpha('laneUnderlay7out', 'laneUnderlay7', 0.40, 0.5, 'linear')
        makeGraphic('laneUnderlay7', 476, 1000, '000000')
        setObjectCamera('laneUnderlay7', 'hud')
        setScrollFactor('laneUnderlay7', 0)
        addLuaSprite('laneUnderlay7', false)
        scaleObject('laneUnderlay7', 0.23, 1);

        makeAnimatedLuaSprite('laneUnderlay7color', 'laneUnderlays', defaultOpponentStrumX2, -1);
        doTweenAlpha('laneUnderlay7outcolor', 'laneUnderlay7color', 0, 0.00005, 'linear')
        makeGraphic('laneUnderlay7color', 476, 1000, '12fa05')
        setObjectCamera('laneUnderlay7color', 'hud')
        setScrollFactor('laneUnderlay7color', 0)
        addLuaSprite('laneUnderlay7color', false)
        scaleObject('laneUnderlay7color', 0.23, 1);

        makeAnimatedLuaSprite('laneUnderlay8', 'laneUnderlays', defaultOpponentStrumX3, -1);
        doTweenAlpha('laneUnderlay8out', 'laneUnderlay8', 0.40, 0.5, 'linear')
        makeGraphic('laneUnderlay8', 464, 1000, '000000')
        setObjectCamera('laneUnderlay8', 'hud')
        setScrollFactor('laneUnderlay8', 0)
        addLuaSprite('laneUnderlay8', false)
        scaleObject('laneUnderlay8', 0.23, 1);

        makeAnimatedLuaSprite('laneUnderlay8color', 'laneUnderlays', defaultOpponentStrumX3, -1);
        doTweenAlpha('laneUnderlay8colorout', 'laneUnderlay8color', 0, 0.0005, 'linear')
        makeGraphic('laneUnderlay8color', 464, 1000, 'f9393f')
        setObjectCamera('laneUnderlay8color', 'hud')
        setScrollFactor('laneUnderlay8color', 0)
        addLuaSprite('laneUnderlay8color', false)
        scaleObject('laneUnderlay8color', 0.23, 1);
        

        
        
    
    end
   
end


function onUpdate()
    if getProperty('health') == 0.0001 then
        removeLuaSprite('laneUnderlay')
        removeLuaSprite('laneUnderlay2')
        removeLuaSprite('laneUnderlay3')
        removeLuaSprite('laneUnderlay4')
        removeLuaSprite('laneUnderlay5')
        removeLuaSprite('laneUnderlay6')
        removeLuaSprite('laneUnderlay7')
        removeLuaSprite('laneUnderlay8')
        removeLuaSprite('laneUnderlaycolor')
        removeLuaSprite('laneUnderlay2color')
        removeLuaSprite('laneUnderlay3color')
        removeLuaSprite('laneUnderlay4color')
        removeLuaSprite('laneUnderlay5color')
        removeLuaSprite('laneUnderlay6color')
        removeLuaSprite('laneUnderlay7color')
        removeLuaSprite('laneUnderlay8color')

    end
    if getProperty('laneUnderlaycolor.alpha') == 0 or getProperty('laneUnderlay2color.alpha') == 0 or getProperty('laneUnderlay3color.alpha') == 0 or getProperty('laneUnderlay4color.alpha') == 0 then
    if keyJustPressed('left') then
        doTweenAlpha('laneUnderlayincolor2', 'laneUnderlaycolor', 0.10, 0.00005, 'linear')
        doTweenX('laneUnderlayinPress', 'laneUnderlay.scale', 0.22, 0.00005, 'linear')
        doTweenX('laneUnderlayinPressColor', 'laneUnderlaycolor.scale', 0.22, 0.00005, 'linear')
    end
    if keyJustPressed('down') then
        doTweenAlpha('laneUnderlay2incolor2', 'laneUnderlay2color', 0.10, 0.00005, 'linear')
        doTweenX('laneUnderlay2inPress', 'laneUnderlay2.scale', 0.22, 0.00005, 'linear')
        doTweenX('laneUnderlay2inPressColor', 'laneUnderlay2color.scale', 0.22, 0.00005, 'linear')
    end

    if keyJustPressed('up') then
        doTweenAlpha('laneUnderlay3incolor2', 'laneUnderlay3color', 0.10, 0.00005, 'linear')
        doTweenX('laneUnderlay3inPress', 'laneUnderlay3.scale', 0.22, 0.00005, 'linear')
        doTweenX('laneUnderlay3inPressColor', 'laneUnderlay3color.scale', 0.22, 0.00005, 'linear')
    end

    if keyJustPressed('right') then
        doTweenAlpha('laneUnderlay4incolor2', 'laneUnderlay4color', 0.10, 0.00005, 'linear')
        doTweenX('laneUnderlay4inPress', 'laneUnderlay4.scale', 0.22, 0.00005, 'linear')
        doTweenX('laneUnderlay4inPressColor', 'laneUnderlay4color.scale', 0.22, 0.00005, 'linear')
    end
end
if getProperty('laneUnderlaycolor.alpha') == 0.10 or getProperty('laneUnderlay2color.alpha') == 0.10 or getProperty('laneUnderlay3color.alpha') == 0.10 or getProperty('laneUnderlay4color.alpha') == 0.10 then
if keyReleased('left') then
        
    doTweenX('laneUnderlayoutPress', 'laneUnderlay.scale', 0.23, 0.00001, 'linear')
    doTweenX('laneUnderlayinPressColor', 'laneUnderlaycolor.scale', 0.23, 0.00005, 'linear')
    doTweenAlpha('laneUnderlayoutcolor', 'laneUnderlaycolor', 0, 0.00005, 'linear')
end
if keyReleased('down') then
        
    doTweenX('laneUnderlay2outPress', 'laneUnderlay2.scale', 0.23, 0.00001, 'linear')
    doTweenX('laneUnderlay2inPressColor', 'laneUnderlay2color.scale', 0.23, 0.00005, 'linear')
    doTweenAlpha('laneUnderlay2outcolor', 'laneUnderlay2color', 0, 0.00005, 'linear')
end

if keyReleased('up') then
        
    doTweenX('laneUnderlay3outPress', 'laneUnderlay3.scale', 0.23, 0.00001, 'linear')
    doTweenX('laneUnderlay3inPressColor', 'laneUnderlay3color.scale', 0.23, 0.00005, 'linear')
    doTweenAlpha('laneUnderlay3outcolor', 'laneUnderlay3color', 0, 0.00005, 'linear')
end
if keyReleased('right') then
        
    doTweenX('laneUnderlay4outPress', 'laneUnderlay4.scale', 0.23, 0.00001, 'linear')
    doTweenX('laneUnderlay4inPressColor', 'laneUnderlay4color.scale', 0.23, 0.00005, 'linear')
    doTweenAlpha('laneUnderlay4outcolor', 'laneUnderlay4color', 0, 0.00005, 'linear')
end
end
    if middlescroll == false then


        --[[makeAnimatedLuaSprite('laneUnderlay5', 'laneUnderlays', 90, -1);
	    addAnimationByPrefix('laneUnderlay5', 'idle', 'Idle', 24, false);
	    addAnimationByPrefix('laneUnderlay5', 'singLEFT', 'Purple', 24, false);
        setObjectCamera('laneUnderlay5', 'hud')
        setScrollFactor('laneUnderlay5', 0)
        addLuaSprite('laneUnderlay5', false)
        scaleObject('laneUnderlay5', 0.23, 1);

        makeLuaSprite('laneUnderlay6', 'laneUnderlay', 202, -1)
        setObjectCamera('laneUnderlay6', 'hud')
        setScrollFactor('laneUnderlay6', 0)
        addLuaSprite('laneUnderlay6', false)
        scaleObject('laneUnderlay6', 0.23, 1);

        makeLuaSprite('laneUnderlay7', 'laneUnderlay', 315, -1)
        setObjectCamera('laneUnderlay7', 'hud')
        setScrollFactor('laneUnderlay7', 0)
        addLuaSprite('laneUnderlay7', false)
        scaleObject('laneUnderlay7', 0.23, 1);

        makeLuaSprite('laneUnderlay8', 'laneUnderlay', 428, -1)
        setObjectCamera('laneUnderlay8', 'hud')
        setScrollFactor('laneUnderlay8', 0)
        addLuaSprite('laneUnderlay8', false)
        scaleObject('laneUnderlay8', 0.23, 1);
    ]]
        
        setProperty('laneUnderlay.x',getPropertyFromGroup('playerStrums', 0, 'x')+1)
        setProperty('laneUnderlay2.x', getPropertyFromGroup('playerStrums', 1, 'x')-1)
        setProperty('laneUnderlay3.x', getPropertyFromGroup('playerStrums', 2, 'x')-1)
        setProperty('laneUnderlay4.x', getPropertyFromGroup('playerStrums', 3, 'x')+1)

        setProperty('laneUnderlay5.x',getPropertyFromGroup('opponentStrums', 0, 'x')+1)
        setProperty('laneUnderlay6.x', getPropertyFromGroup('opponentStrums', 1, 'x')-1)
        setProperty('laneUnderlay7.x', getPropertyFromGroup('opponentStrums', 2, 'x')-1)
        setProperty('laneUnderlay8.x', getPropertyFromGroup('opponentStrums', 3, 'x')+1)

        setProperty('laneUnderlay5color.x',getPropertyFromGroup('opponentStrums', 0, 'x')+1)
        setProperty('laneUnderlay6color.x',getPropertyFromGroup('opponentStrums', 1, 'x')-1)
        setProperty('laneUnderlay7color.x',getPropertyFromGroup('opponentStrums', 2, 'x')-1)
        setProperty('laneUnderlay8color.x',getPropertyFromGroup('opponentStrums', 3, 'x')+1)

        setProperty('laneUnderlaycolor.x',getPropertyFromGroup('playerStrums', 0, 'x')+1)
        setProperty('laneUnderlay2color.x',getPropertyFromGroup('playerStrums', 1, 'x')-1)
        setProperty('laneUnderlay3color.x',getPropertyFromGroup('playerStrums', 2, 'x')-1)
        setProperty('laneUnderlay4color.x',getPropertyFromGroup('playerStrums', 3, 'x')+1)
       


    end
    
    if middlescroll == true then

    
        
        setProperty('laneUnderlay.x',getPropertyFromGroup('playerStrums', 0, 'x')+1)
        setProperty('laneUnderlay2.x', getPropertyFromGroup('playerStrums', 1, 'x')-1)
        setProperty('laneUnderlay3.x', getPropertyFromGroup('playerStrums', 2, 'x')-1)
        setProperty('laneUnderlay4.x', getPropertyFromGroup('playerStrums', 3, 'x')+1)


        setProperty('laneUnderlay5.x',getPropertyFromGroup('opponentStrums', 0, 'x')+1)
        setProperty('laneUnderlay6.x', getPropertyFromGroup('opponentStrums', 1, 'x')-1)
        setProperty('laneUnderlay7.x', getPropertyFromGroup('opponentStrums', 2, 'x')-1)
        setProperty('laneUnderlay8.x', getPropertyFromGroup('opponentStrums', 3, 'x')+1)

        setProperty('laneUnderlay5color.x',getPropertyFromGroup('opponentStrums', 0, 'x')+1)
        setProperty('laneUnderlay6color.x',getPropertyFromGroup('opponentStrums', 1, 'x')-1)
        setProperty('laneUnderlay7color.x',getPropertyFromGroup('opponentStrums', 2, 'x')-1)
        setProperty('laneUnderlay8color.x',getPropertyFromGroup('opponentStrums', 3, 'x')+1)

        setProperty('laneUnderlaycolor.x',getPropertyFromGroup('playerStrums', 0, 'x')+1)
        setProperty('laneUnderlay2color.x',getPropertyFromGroup('playerStrums', 1, 'x')-1)
        setProperty('laneUnderlay3color.x',getPropertyFromGroup('playerStrums', 2, 'x')-1)
        setProperty('laneUnderlay4color.x',getPropertyFromGroup('playerStrums', 3, 'x')+1)
        
        setProperty('laneUnderlay5.alpha', 0.5)
        setProperty('laneUnderlay6.alpha', 0.5)
        setProperty('laneUnderlay7.alpha', 0.5)
        setProperty('laneUnderlay8.alpha', 0.5)


    end
end



function goodNoteHit(id, direction, noteType, isSustainNote)
    if direction == 0 then
        doTweenAlpha('laneUnderlayincolor', 'laneUnderlaycolor', 0.75, 0.00005, 'linear')
        doTweenX('laneUnderlayincolorX', 'laneUnderlaycolor.scale', 0.25, 0.00005, 'linear')
        doTweenX('laneUnderlayinX', 'laneUnderlay.scale', 0.25, 0.00005, 'linear')
    end
    if direction == 1 then
        doTweenAlpha('laneUnderlay2incolor', 'laneUnderlay2color', 0.75, 0.00005, 'linear')
        doTweenX('laneUnderlay2incolorX', 'laneUnderlay2color.scale', 0.25, 0.00005, 'linear')
        doTweenX('laneUnderlay2inX', 'laneUnderlay2.scale', 0.25, 0.00005, 'linear')

    end

    if direction == 2 then
        doTweenAlpha('laneUnderlay3incolor', 'laneUnderlay3color', 0.75, 0.00005, 'linear')
        doTweenX('laneUnderlay3incolorX', 'laneUnderlay3color.scale', 0.25, 0.00005, 'linear')
        doTweenX('laneUnderlay3inX', 'laneUnderlay3.scale', 0.25, 0.00005, 'linear')
    end

    if direction == 3 then
        doTweenAlpha('laneUnderlay4incolor', 'laneUnderlay4color', 0.75, 0.00005, 'linear')
        doTweenX('laneUnderlay4incolorX', 'laneUnderlay4color.scale', 0.25, 0.00005, 'linear')
        doTweenX('laneUnderlay4inX', 'laneUnderlay4.scale', 0.25, 0.00005, 'linear')

    end
end


function opponentNoteHit(id, direction, noteType, isSustainNote)
    if direction == 0 then
        doTweenAlpha('laneUnderlay5incolor', 'laneUnderlay5color', 0.75, 0.00005, 'linear')
        doTweenX('laneUnderlay5incolorX', 'laneUnderlay5color.scale', 0.25, 0.00005, 'linear')
        doTweenX('laneUnderlay5inX', 'laneUnderlay5.scale', 0.25, 0.00005, 'linear')
    end
    if direction == 1 then
        doTweenAlpha('laneUnderlay6incolor', 'laneUnderlay6color', 0.75, 0.00005, 'linear')
        doTweenX('laneUnderlay6incolorX', 'laneUnderlay6color.scale', 0.25, 0.00005, 'linear')
        doTweenX('laneUnderlay6inX', 'laneUnderlay6.scale', 0.25, 0.00005, 'linear')
    end

    if direction == 2 then
        doTweenAlpha('laneUnderlay7incolor', 'laneUnderlay7color', 0.75, 0.00005, 'linear')
        doTweenX('laneUnderlay7incolorX', 'laneUnderlay7color.scale', 0.25, 0.00005, 'linear')
        doTweenX('laneUnderlay7inX', 'laneUnderlay7.scale', 0.25, 0.00005, 'linear')
    end

    if direction == 3 then
        doTweenAlpha('laneUnderlay8incolor', 'laneUnderlay8color', 0.75, 0.00005, 'linear')
        doTweenX('laneUnderlay8incolorX', 'laneUnderlay8color.scale', 0.25, 0.00005, 'linear')
        doTweenX('laneUnderlay8inX', 'laneUnderlay8.scale', 0.25, 0.00005, 'linear')

    end
end

--[[function opponentNoteHit(id, direction, noteType, isSustainNote)
    if direction == 0 then
        objectPlayAnimation('laneUnderlay5', 'singLEFT', false)

    end
end
function onTimerCompleted(tag)
    if tag == "left" then
        objectPlayAnimation('laneUnderlay5', 'singLEFT', true)
    end
end]]--


function onTweenCompleted(tag)
    if tag == "laneUnderlay5incolor" then
        doTweenX('laneUnderlay5outcolorX', 'laneUnderlay5color.scale', 0.23, 0.2, 'linear')
        doTweenX('laneUnderlay5outX', 'laneUnderlay5.scale', 0.23, 0.2, 'linear')
        doTweenAlpha('laneUnderlay5outcolor', 'laneUnderlay5color', 0, 0.2, 'linear')
    end
    if tag == "laneUnderlay6incolor" then
        doTweenAlpha('laneUnderlay6outcolor', 'laneUnderlay6color', 0,0.2, 'linear')
        doTweenX('laneUnderlay6outcolorX', 'laneUnderlay6color.scale', 0.23, 0.2, 'linear')
        doTweenX('laneUnderlay6outX', 'laneUnderlay6.scale', 0.23, 0.2, 'linear')
    end
    if tag == "laneUnderlay7incolor" then
        doTweenAlpha('laneUnderlay7outcolor', 'laneUnderlay7color', 0, 0.2, 'linear')
        doTweenX('laneUnderlay7outcolorX', 'laneUnderlay7color.scale', 0.23, 0.2, 'linear')
        doTweenX('laneUnderlay7outX', 'laneUnderlay7.scale', 0.23, 0.2, 'linear')
    end
    if tag == "laneUnderlay8incolor" then
        doTweenAlpha('laneUnderlay8outcolor', 'laneUnderlay8color', 0, 0.2, 'linear')
        doTweenX('laneUnderlay8outcolorX', 'laneUnderlay8color.scale', 0.23, 0.2, 'linear')
        doTweenX('laneUnderlay8outX', 'laneUnderlay8.scale', 0.23, 0.2, 'linear')
    end


    if tag == "laneUnderlayincolor" then
        doTweenX('laneUnderlayoutcolorX', 'laneUnderlaycolor.scale', 0.23, 0.2, 'linear')
        doTweenX('laneUnderlayoutX', 'laneUnderlay.scale', 0.23, 0.2, 'linear')
        doTweenAlpha('laneUnderlayoutcolor', 'laneUnderlaycolor', 0, 0.2, 'linear')
    end
    if tag == "laneUnderlay2incolor" then
        doTweenAlpha('laneUnderlay1outcolor', 'laneUnderlay2color', 0,0.2, 'linear')
        doTweenX('laneUnderlay1outcolorX', 'laneUnderlay2color.scale', 0.23, 0.2, 'linear')
        doTweenX('laneUnderlay1outX', 'laneUnderlay2.scale', 0.23, 0.2, 'linear')
    end
    if tag == "laneUnderlay3incolor" then
        doTweenAlpha('laneUnderlay2outcolor', 'laneUnderlay3color', 0, 0.2, 'linear')
        doTweenX('laneUnderlay2outcolorX', 'laneUnderlay3color.scale', 0.23, 0.2, 'linear')
        doTweenX('laneUnderlay2outX', 'laneUnderlay3.scale', 0.23, 0.2, 'linear')
    end
    if tag == "laneUnderlay4incolor" then
        doTweenAlpha('laneUnderlay3outcolor', 'laneUnderlay4color', 0, 0.2, 'linear')
        doTweenX('laneUnderlay3outcolorX', 'laneUnderlay4color.scale', 0.23, 0.2, 'linear')
        doTweenX('laneUnderlay3outX', 'laneUnderlay4.scale', 0.23, 0.2, 'linear')
    end

end

