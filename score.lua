--Credits

--Script Made By HexFalc --
--Remenber to Credit--

--      -- ---------------  ---        ---
--      --  --                  ---   ---
---------- --------------         ---
--      --  --                  ---   ---
--      --  -------------   ---         ---

---------  ----------   --        -----------
--          --      --   --        --
---------  ----------   --        --
--          --      --   --        --
--          --      --   --------  -----------

---------------------------------------------------------------------------

--Changebles Things

local fonthud = 'sonic-hud.ttf' -- this for the misses,time and score counters font
local sonictext = 'sonic-text.ttf' -- this for the botplay and watermark text font

--change these two if you want to change the fonts but dont remove the .ttf or the font don't work

local colorhud = '0xFFFFDD33' -- this for the color of the misses,time and score and counters

--change this for change the color

---------------------------------------------------------------------------

--- The Script

--Warning:
--Don't change this if you want to use it normally!!

function onCreate()
makeLuaText('watermarkshit', songName .. ' - FNF - Psych Engine' , 0, 400, 20)
addLuaText('watermarkshit')
makeLuaText('misses', 'Misses :', 0, 0, 260)
addLuaText('misses')
makeLuaText('score', 'Score :', 0, 0, 160)
addLuaText('score')
makeLuaText('time', 'Time :', 0, 0, 210)
addLuaText('time')
setTextColor('time', colorhud)
setTextColor('score', colorhud)
setTextColor('misses', colorhud)
setTextFont('time', fonthud)
setTextFont('score', fonthud)
setTextFont('misses', fonthud)
setTextFont('watermarkshit', sonictext)
setObjectCamera('misses', 'hud')
setObjectCamera('score', 'hud')
setObjectCamera('watermarkshit', 'hud')
setObjectCamera('time', 'hud')
setTextSize('score', 30)
setTextSize('time', 30)
setTextSize('watermarkshit', 25)
setTextSize('misses', 30)
makeLuaSprite('bf', 'bficon', 0, 550)
addLuaSprite('bf', false)
setObjectCamera('bf', 'hud')
scaleObject('bf', 0.65, 0.65)
makeLuaSprite('watermarkbar', 'wbar', 349, 25)
addLuaSprite('watermarkbar', false)
setObjectCamera('watermarkbar', 'hud')
if getProperty('cpuControlled') then
makeLuaText('bot', 'BOTPLAY', 0, 490, 500)
addLuaText('bot')
setTextSize('bot', 60)
setObjectCamera('bot', 'hud')
setTextFont('bot', sonictext)
  end
end
function onUpdate(elapsed)
setTextString('misses', 'Misses: ' .. getProperty('songMisses'))
setTextString('score', 'Score: ' .. getProperty('songScore'))
setTextString('time', 'Time: ' .. getTextString('timeTxt'))
end
function onCreatePost()
	setProperty('scoreTxt.visible', 0)
	setTextString('botplayTxt', 'You Are Now using Botplay')
	setTextFont('botplayTxt', sonictext)
	setProperty("timeBarBG.visible", false)
	setProperty("timeTxt.visible", false);
    setProperty("timeBar.visible", false)
end