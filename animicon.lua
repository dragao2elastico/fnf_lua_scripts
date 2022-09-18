function onCreate()
if dadName == 'flippy' then
makeAnimatedLuaSprite('animatedicon', 'icons/flippy', getProperty('iconP2.x'), getProperty('iconP2.y'))
addAnimationByPrefix('animatedicon', 'normal', 'flipnormal', 24, true)
addAnimationByPrefix('animatedicon', 'losing', 'fliplose', 24, true)
addAnimationByPrefix('animatedicon', 'winning', 'flipwin', 24, true) 
setScrollFactor('animatedicon', 0, 0)
setObjectCamera('animatedicon', 'other') -- either is under the health bar or nothing
addLuaSprite('animatedicon', true)
objectPlayAnimation('animatedicon', 'normal', false)
end
end

function onUpdate(elapsed)
if dadName == 'flippy' then
setProperty('iconP2.alpha', 0)
if getProperty('health') > 1.6 then
objectPlayAnimation('animatedicon', 'losing', false)
elseif getProperty('health') < 0.4 then
objectPlayAnimation('animatedicon', 'winning', false)
else
objectPlayAnimation('animatedicon', 'normal', false)
end
end
setProperty('camOther.zoom', getProperty('camHUD.zoom'))
setProperty('animatedicon.x', getProperty('iconP2.x'))
setProperty('animatedicon.angle', getProperty('iconP2.angle'))
setProperty('animatedicon.y', getProperty('iconP2.y') + 15)
setProperty('animatedicon.scale.x', getProperty('iconP2.scale.x'))
setProperty('animatedicon.scale.y', getProperty('iconP2.scale.y'))
end