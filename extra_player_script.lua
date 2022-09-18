--Script made by: JasonTheOne111
--Base character stuff
local path = "addpathhere" --Add path to spritesheet and xml, good: characters/name, bad: mods/images/characters
local defx = 0 --X position of the character
local defy = 0 --Y position of the character
local singDuration = 0.7 --Type how long you want the character to sing default: 0.7 (seconds)
local playerScale = 1 --Scale of the player, default: 1
local animationFPS = 24 --Add the framerate (fps) of all the animation ex: 25 default: 24 fps
local overlapping = false --True for this player to go Over the base character, False for it to go under the base characters
local looping = false --True for all animations to loop, False for all animations to play once
--Names
local playerName = "addnamehere" --Add the name of your character here (optional)
local idleName = "addnamehere" --Add the name of the idle position in the xml file
local leftName = "addnamehere" --Add the name of the left position in the xml file
local downName = "addnamehere" --Add the name of the down position in the xml file
local upName = "addnamehere" --Add the name of the up position in the xml file
local rightName = "addnamehere" --Add the name of the right position in the xml file
local noteTypeName = "addnamehere" --Add the name of the custom notetype, leave blank for normal note
--Offsets, All defaults are 0, disclaimer: negative offsets might need to be changed to positives, and vise-versa
local idleOffsetX = 0 --X Offset for the idle position, recommended is 0
local idleOffsetY = 0 --Y Offset for the idle position, recommended is 0
local leftOffsetX = 0 --X Offset for the left position, recommended is 0
local leftOffsetY = 0 --Y Offset for the left position, recommended is 0
local downOffsetX = 0 --X Offset for the down position, recommended is 0
local downOffsetY = 0 --Y Offset for the down position, recommended is 0
local upOffsetX = 0 --X Offset for the up position, recommended is 0
local upOffsetY = 0 --Y Offset for the up position, recommended is 0
local rightOffsetX = 0 --X Offset for the right position, recommended is 0
local rightOffsetY = 0 --Y Offset for the right position, recommended is 0


--ignore these
local offsetx = 0 --ignore this
local offsety = 0 --ignore this

--scale de
function onCreate()
    animSprite(playerName, 'idle', idleName, path, defx, defy, 24, looping, overlapping, playerScale)
    addAnimationByPrefix(playerName, '0', leftName .. '0', animationFPS, looping)
    addAnimationByPrefix(playerName, '1', downName .. '0', animationFPS, looping)
    addAnimationByPrefix(playerName, '2', upName .. '0', animationFPS, looping)
    addAnimationByPrefix(playerName, '3', rightName .. '0', animationFPS, looping)
end
function animSprite(tag, anim, animxml, path, pos1, pos2, fps, loop, over, scale)
    makeAnimatedLuaSprite(tag, path, pos1, pos2)
    addAnimationByPrefix(tag, anim, animxml, fps, loop)
    addLuaSprite(tag, over)
    scaleObject(tag,scale,scale)
end
function sing(tag, anim, offsetx, offsety)
    objectPlayAnimation(tag, anim, true)
    if tag == playerName then
        setProperty(tag .. '.x', defx-offsetx)
        setProperty(tag .. '.y', defy-offsety)
    end
end
function onBeatHit()
    if curBeat %2 == 0 then
        if looping == false then
            if getProperty(playerName .. '.animation.curAnim.name') == "idle" then
                sing(playerName , 'idle', idleOffsetX, idleOffsetY)
            end
        end
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    -- left = 0, down = 1, up = 2, right = 3
    if noteType == noteTypeName then
        if direction == 0 then
            offsetx = leftOffsetX
            offsety = leftOffsetY
        end
        if direction == 1 then
            offsetx = downOffsetX
            offsety = downOffsetY
        end
        if direction == 2 then
            offsetx = upOffsetX
            offsety = upOffsetY
        end
        if direction == 3 then
            offsetx = rightOffsetX
            offsety = rightOffsetY
        end
        sing(playerName, direction, offsetx, offsety)
        runTimer('idle'.. playerName .. direction, singDuration)
    end
end

function onTimerCompleted(tag)

    if tag == "idle" .. playerName .."0" then
        if getProperty(playerName .. '.animation.curAnim.name') == "0" then
            sing(playerName , 'idle', idleOffsetX, idleOffsetY)
        end
    end
    if tag == "idle" .. playerName .."1" then
        if getProperty(playerName .. '.animation.curAnim.name') == "1" then
            sing(playerName , 'idle', idleOffsetX, idleOffsetY)
        end
    end
    if tag == "idle" .. playerName .."2" then
        if getProperty(playerName .. '.animation.curAnim.name') == "2" then
            sing(playerName , 'idle', idleOffsetX, idleOffsetY)
        end
    end
    if tag == "idle" .. playerName .."3" then
        if getProperty(playerName .. '.animation.curAnim.name') == "3" then
            sing(playerName , 'idle', idleOffsetX, idleOffsetY)
        end
    end
end