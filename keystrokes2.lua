function onCreatePost()
    makeLuaSprite('upButton', nil, screenWidth - 200, 570)
    makeGraphic('upButton', 65, 65, 'FFFFFF')

    addLuaSprite('upButton', true)
    setObjectCamera('upButton', 'other')
	setProperty('upButton.alpha', 0.3)

    makeLuaSprite('downButton', nil, getProperty('upButton.x'), getProperty('upButton.y') + 70)
    makeGraphic('downButton', 65, 65, 'FFFFFF')

    addLuaSprite('downButton', true)
    setObjectCamera('downButton', 'other')
	setProperty('downButton.alpha', 0.3)

    makeLuaSprite('leftButton', nil, getProperty('downButton.x') - 70, getProperty('downButton.y'))
    makeGraphic('leftButton', 65, 65, 'FFFFFF')

    addLuaSprite('leftButton', true)
    setObjectCamera('leftButton', 'other')
	setProperty('leftButton.alpha', 0.3)

    makeLuaSprite('rightButton', nil, getProperty('downButton.x') + 70, getProperty('downButton.y'))
    makeGraphic('rightButton', 65, 65, 'FFFFFF')

    addLuaSprite('rightButton', true)
    setObjectCamera('rightButton', 'other')
	setProperty('rightButton.alpha', 0.3)

    makeLuaText('upText', 'K', 60, getProperty('upButton.x'), getProperty('upButton.y') + 20)
    setTextAlignment('upText', 'center')
    setObjectCamera('upText', 'other')
    setTextSize('upText', 20)
    setTextBorder('upText', 0, 000000)
    addLuaText('upText')

    makeLuaText('downText', 'S', 60, getProperty('downButton.x'), getProperty('downButton.y') + 20)
    setTextAlignment('downText', 'center')
    setObjectCamera('downText', 'other')
    setTextSize('downText', 20)
    setTextBorder('downText', 0, 000000)
    addLuaText('downText')

    makeLuaText('leftText', 'A', 60, getProperty('leftButton.x') + 2, getProperty('leftButton.y') + 20)
    setTextAlignment('leftText', 'center')
    setObjectCamera('leftText', 'other')
    setTextSize('leftText', 20)
    setTextBorder('leftText', 0, 000000)
    addLuaText('leftText')

    makeLuaText('rightText', 'L', 65, getProperty('rightButton.x') - 2, getProperty('rightButton.y') + 20)
    setTextAlignment('rightText', 'center')
    setObjectCamera('rightText', 'other')
    setTextSize('rightText', 20)
    setTextBorder('rightText', 0, 000000)
    addLuaText('rightText')


end

function onUpdate(elapsed)
    --this bit might be poorly done idk
    if keyPressed('up') then
        setProperty('upButton.alpha', 1)
        cancelTween('upFade')
        setTextColor('upText', '7F7F7F')
    else
        doTweenAlpha('upFade', 'upButton', 0.3, 0.15, 'linear')
        setTextColor('upText', 'FFFFFF')
    end

    if keyPressed('down') then
        setProperty('downButton.alpha', 1)
        cancelTween('downFade')
        setTextColor('downText', '7F7F7F')
    else
        doTweenAlpha('downFade', 'downButton', 0.3, 0.15, 'linear')
        setTextColor('downText', 'FFFFFF')
    end

    if keyPressed('left') then
        setProperty('leftButton.alpha', 1)
        cancelTween('leftFade')
        setTextColor('leftText', '7F7F7F')
    else
        doTweenAlpha('leftFade', 'leftButton', 0.3, 0.15, 'linear')
        setTextColor('leftText', 'FFFFFF')
    end

    if keyPressed('right') then
        setProperty('rightButton.alpha', 1)
        cancelTween('rightFade')
        setTextColor('rightText', '7F7F7F')
    else
        doTweenAlpha('rightFade', 'rightButton', 0.3, 0.15, 'linear')
        setTextColor('rightText', 'FFFFFF')
    end
end