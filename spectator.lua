function onUpdatePost()

    setProperty('scoreTxt.visible', true)
    setProperty('healthBar.visible', true)
    setProperty('healthBarBG.visible', true)
    setProperty('iconP1.visible', true)
    setProperty('iconP2.visible', true)
    
    if botPlay == false then
        setProperty('botplayTxt.visible', false)
    end

    if botPlay == true then
    setProperty('botplayTxt.visible', false)
    setProperty('scoreTxt.visible', false)
    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setPropertyFromGroup('opponentStrums',0,'alpha',0)
    setPropertyFromGroup('opponentStrums',1,'alpha',0)
    setPropertyFromGroup('opponentStrums',2,'alpha',0)
    setPropertyFromGroup('opponentStrums',3,'alpha',0)
    setPropertyFromGroup('playerStrums',0,'alpha',0)
    setPropertyFromGroup('playerStrums',1,'alpha',0)
    setPropertyFromGroup('playerStrums',2,'alpha',0)
    setPropertyFromGroup('playerStrums',3,'alpha',0)
    end


end