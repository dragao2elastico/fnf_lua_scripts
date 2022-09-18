local op = 0.5; --opacity, change if you want
function onCreate()
    makeAnimatedLuaSprite('l', 'characters/ruv_sheet', 100, 50) --character pos
    addAnimationByIndices('l', 'singLEFTghost', 'RuvLeft', '14', 24) --make sure the indice is the last one on the xml, otherwise it won't look right
    setProperty('l.alpha', 0)
    setProperty('l.offset.x', 17) --change these to match the character offsets
    setProperty('l.offset.y', -72)
    addLuaSprite('l', false)
    makeAnimatedLuaSprite('r', 'characters/ruv_sheet', 100, 50) --character pos
    addAnimationByIndices('r', 'singRIGHTghost', 'RuvRight', '14', 24) --make sure the indice is the last one on the xml, otherwise it won't look right
    setProperty('r.alpha', 0)
    setProperty('r.offset.x', 23) --change these to match the character offsets
    setProperty('r.offset.y', -70)
    addLuaSprite('r', false)
    makeAnimatedLuaSprite('d', 'characters/ruv_sheet', 100, 50) --character pos
    addAnimationByIndices('d', 'singDOWNghost', 'RuvDown', '14', 24) --make sure the indice is the last one on the xml, otherwise it won't look right
    setProperty('d.alpha', 0)
    setProperty('d.offset.x', -9) --change these to match the character offsets
    setProperty('d.offset.y', -66)
    addLuaSprite('d', false)
    makeAnimatedLuaSprite('u', 'characters/ruv_sheet', 100, 50) --character pos
    addAnimationByIndices('u', 'singUPghost', 'RuvUp', '14', 24) --make sure the indice is the last one on the xml, otherwise it won't look right
    setProperty('u.alpha', 0)
    setProperty('u.offset.x', 20) --change these to match the character offsets
    setProperty('u.offset.y', -59)
    addLuaSprite('u', false)
end
function onUpdate(elapsed)
    if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
        doTweenAlpha('showleft', 'l', op, 0.1, 'linear')
    end
    if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
        doTweenAlpha('showright', 'r', op, 0.1, 'linear')
    end
    if getProperty('dad.animation.curAnim.name') == 'singUP' then
        doTweenAlpha('showup', 'u', op, 0.1, 'linear')
    end
    if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
        doTweenAlpha('showdown', 'd', op, 0.1, 'linear')
    end
end
function onTweenCompleted(t)
    if t == 'showleft' then
        doTweenAlpha('hideleft', 'l', 0, 0.3)
    end
    if t == 'showright' then
        doTweenAlpha('hideright', 'r', 0, 0.3)
    end
    if t == 'showup' then
        doTweenAlpha('hideup', 'u', 0, 0.3)
    end
    if t == 'showdown' then
        doTweenAlpha('hidedown', 'd', 0, 0.3)
    end
end