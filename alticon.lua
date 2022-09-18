local turnvalue = 0
local turnvalue2 = 0
local turnvalue3 = 0
local turnvalue4 = 0
local epic = 0

local epic2 = 0
local epic3 = 0
local epic4 = 0
function onBeatHit()
turnvalue = 1
turnvalue2 = 1
turnvalue3 = 1
turnvalue4 = 1
epic = 1
epic2 = 1
epic3 = 1
epic4 = 1
if curBeat % 2 == 0 then
turnvalue = 1
turnvalue2 = 1
turnvalue3 = 1
turnvalue4 = 1
epic = 1
epic2 = 1
epic3 = 1
epic4 = 1
end
setProperty('iconP1.scale.x',turnvalue4)
setProperty('iconP1.scale.y',turnvalue3)
doTweenAngle('iconTween1','iconP1',0,crochet/1000,'circOut')
doTweenAngle('iconTween3','iconP1',0,crochet/1000,'circOut')
setProperty('iconP2.scale.x',epic4)
setProperty('iconP2.scale.y',epic3)
doTweenAngle('iconTween2','iconP2',0,crochet/1000,'circOut')
doTweenAngle('iconTween4','iconP2',0,crochet/1000,'circOut')
end