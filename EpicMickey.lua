--This script was made by PHG29, if you wanna use it pls dont steal, just need to put credits :)

CustomPause = true     --Set To false to disable the pause thing
OldTimeStyle = false      --Set to true if you want everything in old time style (black and white)
OstMode = false    --Set to true if you want that the music go on Ost mode and restart the whole thing on endSong (for a Infinite loop)
RandomDeathMessages = true     --Set to false if you dont want a custom Death Screen!
CustomThinnerDeath = true       --Set to false to disable the custom gameOver screen




--dont touch that!
local settings = {
['On?']       = true; 
['debug']     = false;
['Turning']   = 60
  }
local MiddleScrollConfig = {
  [4] = 30;
  [5] = 30;
  [6] = -30;
  [7] = -30
  }

local WoahMiddleNumbers = {
    [4] = 10;
    [5] = 30;
    [6] = 30;
    [7] = 10
  }



local WoahNumbers = {
  [0] = 90;
  [1] = 60;
  [2] = 30;
  [3] = 10;

  [4] = 10;
  [5] = 30;
  [6] = 60;
  [7] = 90;
}
isPaused = false
canPause = false
finishedGameover = false;
startedPlaying = false;
paused = false
canControl = false
startedCountdown = false
curSelected = ''
intransition = false
fakepractice = false
Opt = false
Fp = false
HidedArrows = false 
RamdonDeatha = false
canGoAppear = false
BruhDown = 0
FuckedBruh = 0
DeathThingStop = false
function onCreate()

    if startedOST == false then
    startedOST = true
    end
    
if start == true then
    startedCountdown = true
end

   if getProperty('skipCountdown') == true then
      start = true
    end
    
if OldTimeStyle == false then
math.randomseed(os.time())
Sprite = string.format(getRandomInt(1, 4))
end

if OldTimeStyle == true then
math.randomseed(os.time())
Sprite = string.format(getRandomInt(20, 23))
end

    setTextFont('scoreTxt', 'MICKEY.ttf')
    setTextFont('timeTxt', 'MICKEY.ttf')
if OldTimeStyle == false then

    makeLuaSprite('BT', 'EM/BackThing', 5, 160)
	setObjectCamera('BT', 'hud')
	setScrollFactor('BT', 0.9, 0.9)
	addLuaSprite('BT', true)
	scaleObject('BT', 0.73, 0.73)

    makeLuaSprite('BT2', 'EM/BackThing', 900, 160)
	setObjectCamera('BT2', 'hud')
	setScrollFactor('BT2', 0.9, 0.9)
	addLuaSprite('BT2', true)
	scaleObject('BT2', 0.73, 0.73)
	setProperty('BT2.flipX', true) 
end

if OldTimeStyle == true then
    makeLuaSprite('BT', 'OldStyle/BackThing', 5, 160)
	setObjectCamera('BT', 'hud')
	setScrollFactor('BT', 0.9, 0.9)
	addLuaSprite('BT', true)
	scaleObject('BT', 0.73, 0.73)

    makeLuaSprite('BT2', 'OldStyle/BackThing', 900, 160)
	setObjectCamera('BT2', 'hud')
	setScrollFactor('BT2', 0.9, 0.9)
	addLuaSprite('BT2', true)
	scaleObject('BT2', 0.73, 0.73)
	setProperty('BT2.flipX', true) 
end

if OldTimeStyle == false then
	makeAnimatedLuaSprite('NB', 'EM/HealthBarEM', 126, 320)
	addAnimationByPrefix('NB', 'full', 'heart', 24, true);
	addAnimationByPrefix('NB', 'morehalf', 'morehalfhealth', 24, true);
	addAnimationByPrefix('NB', 'half', 'halfheart', 24, true);
	addAnimationByPrefix('NB', 'minorhalf', 'minorhalfhealth', 24, true);
	addAnimationByPrefix('NB', 'empty', 'noneheart', 24, true);
	setObjectCamera('NB', 'hud')
	setScrollFactor('NB', 0.9, 0.9)
	addLuaSprite('NB', false)
	scaleObject('NB', 1.2, 1.2)
	
	 makeAnimatedLuaSprite('NBCopy', 'EM/HealthBarEM', 170, 320)
	addAnimationByPrefix('NBCopy', 'full', 'heart', 24, true);
	addAnimationByPrefix('NBCopy', 'morehalf', 'morehalfhealth', 24, true);
	addAnimationByPrefix('NBCopy', 'half', 'halfheart', 24, true);
	addAnimationByPrefix('NBCopy', 'minorhalf', 'minorhalfhealth', 24, true);
	addAnimationByPrefix('NBCopy', 'empty', 'noneheart', 24, true);
	setObjectCamera('NBCopy', 'hud')
	setScrollFactor('NBCopy', 0.9, 0.9)
	addLuaSprite('NBCopy', false)
	scaleObject('NBCopy', 1.2, 1.2)
	
	 makeAnimatedLuaSprite('NBCopyy', 'EM/HealthBarEM', 214, 320)
	addAnimationByPrefix('NBCopyy', 'full', 'heart', 24, true);
	addAnimationByPrefix('NBCopyy', 'morehalf', 'morehalfhealth', 24, true);
	addAnimationByPrefix('NBCopyy', 'half', 'halfheart', 24, true);
	addAnimationByPrefix('NBCopyy', 'minorhalf', 'minorhalfhealth', 24, true);
	addAnimationByPrefix('NBCopyy', 'empty', 'noneheart', 24, true);
	setObjectCamera('NBCopyy', 'hud')
	setScrollFactor('NBCopyy', 0.9, 0.9)
	addLuaSprite('NBCopyy', false)
	scaleObject('NBCopyy', 1.2, 1.2)
	
	 makeAnimatedLuaSprite('NBCopyyy', 'EM/HealthBarEM', 258, 320)
	addAnimationByPrefix('NBCopyyy', 'full', 'heart', 24, true);
	addAnimationByPrefix('NBCopyyy', 'morehalf', 'morehalfhealth', 24, true);
	addAnimationByPrefix('NBCopyyy', 'half', 'halfheart', 24, true);
	addAnimationByPrefix('NBCopyyy', 'minorhalf', 'minorhalfhealth', 24, true);
	addAnimationByPrefix('NBCopyyy', 'empty', 'noneheart', 24, true);
	setObjectCamera('NBCopyyy', 'hud')
	setScrollFactor('NBCopyyy', 0.9, 0.9)
	addLuaSprite('NBCopyyy', false)
	scaleObject('NBCopyyy', 1.2, 1.2)
end

if OldTimeStyle == true then
    makeAnimatedLuaSprite('NB', 'OldStyle/HealthBarEM', 126, 320)
	addAnimationByPrefix('NB', 'full', 'heart', 24, true);
	addAnimationByPrefix('NB', 'morehalf', 'morehalfhealth', 24, true);
	addAnimationByPrefix('NB', 'half', 'halfheart', 24, true);
	addAnimationByPrefix('NB', 'minorhalf', 'minorhalfhealth', 24, true);
	addAnimationByPrefix('NB', 'empty', 'noneheart', 24, true);
	setObjectCamera('NB', 'hud')
	setScrollFactor('NB', 0.9, 0.9)
	addLuaSprite('NB', false)
	scaleObject('NB', 1.2, 1.2)
	
	 makeAnimatedLuaSprite('NBCopy', 'OldStyle/HealthBarEM', 170, 320)
	addAnimationByPrefix('NBCopy', 'full', 'heart', 24, true);
	addAnimationByPrefix('NBCopy', 'morehalf', 'morehalfhealth', 24, true);
	addAnimationByPrefix('NBCopy', 'half', 'halfheart', 24, true);
	addAnimationByPrefix('NBCopy', 'minorhalf', 'minorhalfhealth', 24, true);
	addAnimationByPrefix('NBCopy', 'empty', 'noneheart', 24, true);
	setObjectCamera('NBCopy', 'hud')
	setScrollFactor('NBCopy', 0.9, 0.9)
	addLuaSprite('NBCopy', false)
	scaleObject('NBCopy', 1.2, 1.2)
	
	 makeAnimatedLuaSprite('NBCopyy', 'OldStyle/HealthBarEM', 214, 320)
	addAnimationByPrefix('NBCopyy', 'full', 'heart', 24, true);
	addAnimationByPrefix('NBCopyy', 'morehalf', 'morehalfhealth', 24, true);
	addAnimationByPrefix('NBCopyy', 'half', 'halfheart', 24, true);
	addAnimationByPrefix('NBCopyy', 'minorhalf', 'minorhalfhealth', 24, true);
	addAnimationByPrefix('NBCopyy', 'empty', 'noneheart', 24, true);
	setObjectCamera('NBCopyy', 'hud')
	setScrollFactor('NBCopyy', 0.9, 0.9)
	addLuaSprite('NBCopyy', false)
	scaleObject('NBCopyy', 1.2, 1.2)
	
	 makeAnimatedLuaSprite('NBCopyyy', 'OldStyle/HealthBarEM', 258, 320)
	addAnimationByPrefix('NBCopyyy', 'full', 'heart', 24, true);
	addAnimationByPrefix('NBCopyyy', 'morehalf', 'morehalfhealth', 24, true);
	addAnimationByPrefix('NBCopyyy', 'half', 'halfheart', 24, true);
	addAnimationByPrefix('NBCopyyy', 'minorhalf', 'minorhalfhealth', 24, true);
	addAnimationByPrefix('NBCopyyy', 'empty', 'noneheart', 24, true);
	setObjectCamera('NBCopyyy', 'hud')
	setScrollFactor('NBCopyyy', 0.9, 0.9)
	addLuaSprite('NBCopyyy', false)
	scaleObject('NBCopyyy', 1.2, 1.2)
end
	
	makeLuaSprite('Mouse', 'EM/Mouse', 0, 170)
	setObjectCamera('Mouse', 'hud')
	setScrollFactor('Mouse', 0.9, 0.9)
	addLuaSprite('Mouse', true)
	setProperty('Mouse.alpha', 0)
	scaleObject('Mouse', 0.23, 0.23)
	
	setProperty('preventLuaRemove', true);
	
    precacheImage(Sprite)
    
        makeLuaSprite('black', 'black', -100, -100);
	scaleObject('black', 1.2, 1.2);
	setScrollFactor('black', 0, 0);
	setObjectCamera('black', 'other');
	setProperty('black.alpha', 0); --0.6
	addLuaSprite('black', true)
    
	makeLuaSprite('Tickets', 'EM/Ti', 920, -100)
	scaleObject('Tickets', 0.5, 0.5)
	addLuaSprite('Tickets', true)
	setObjectCamera('Tickets', 'other')
	setProperty('Tickets.alpha', 0)
	setProperty('Tickets.color', getColorFromHex('000000'))

		setProperty('healthBarBG.visible', false)
        setProperty('healthBar.visible', false);
        setProperty('timeBarTxt.alpha', 0)
        setProperty('timeBarBG.alpha', 0)
        setProperty('timeBar.alpha', 0)
	    setProperty('timeBar.visible', false)

	    if buildTarget == 'android' then
           if OldTimeStyle == false then
         makeAnimatedLuaSprite('ConfirmPls', 'EM/PauseButton', -10, 100);
        addAnimationByPrefix('ConfirmPls', 'Press', 'B press', 24, false);
		addAnimationByPrefix('ConfirmPls', 'Pressed', 'B pressed', 8, false);
		addLuaSprite('ConfirmPls', true);
		setObjectCamera('ConfirmPls', 'other')
		setProperty('ConfirmPls.alpha', 0)
           end
           if OldTimeStyle == true then
         makeAnimatedLuaSprite('ConfirmPls', 'OldStyle/PauseButton', -10, 100);
        addAnimationByPrefix('ConfirmPls', 'Press', 'B press', 24, false);
		addAnimationByPrefix('ConfirmPls', 'Pressed', 'B pressed', 8, false);
		addLuaSprite('ConfirmPls', true);
		setObjectCamera('ConfirmPls', 'other')
		setProperty('ConfirmPls.alpha', 0)
           end
		end

    makeLuaSprite('Shadow', 'EM/shadow', 0, 0)
	setObjectCamera('Shadow', 'camHUD')
	addLuaSprite('Shadow', true)
	scaleObject('Shadow', 1.8, 2)
	setProperty('Shadow.alpha', 0)
	
    makeLuaText('ScoreTickets', 'score', 360, 1030, 35);
    setTextSize('ScoreTickets', 40)
    setTextFont('ScoreTickets', 'MICKEY.ttf')
	addLuaText('ScoreTickets', true);
	setObjectCamera('ScoreTickets', 'camHUD')
	setProperty('ScoreTickets.alpha', 0)
	setTextBorder('ScoreTickets', 3, 'FFFFFF')
	setProperty('ScoreTickets.color', getColorFromHex('000000'))
	if OldTimeStyle == true then
         makeLuaSprite('Under', 'OldStyle/UnderThing', 1010, 110)
        addLuaSprite('Under', false)
        scaleObject('Under', 0.2, 0.4)
        setObjectCamera('Under', 'other')
        setProperty('Under.alpha', 0)
end
    if OldTimeStyle == false then
         makeLuaSprite('Under', 'EM/UnderThing', 1010, 110)
        addLuaSprite('Under', false)
        scaleObject('Under', 0.2, 0.4)
        setObjectCamera('Under', 'other')
        setProperty('Under.alpha', 0)
	end
        makeLuaSprite('Resumes', 'EM/Resume', 980, 120)
        addLuaSprite('Resumes', true)
        scaleObject('Resumes', 0.61, 0.61)
        setObjectCamera('Resumes', 'other')
        setProperty('Resumes.alpha', 0)
       
        makeLuaSprite('Restarts', 'EM/Restart', 980, 210)
        addLuaSprite('Restarts', true)
        scaleObject('Restarts', 0.61, 0.61)
        setObjectCamera('Restarts', 'other')
        setProperty('Restarts.alpha', 0)
        
        makeLuaSprite('Botplayy', 'EM/Botplay', 980, 290)
        addLuaSprite('Botplayy', true)
        scaleObject('Botplayy', 0.61, 0.61)
        setObjectCamera('Botplayy', 'other')
        setProperty('Botplayy.alpha', 0)
         setProperty('Botplayy.color', getColorFromHex('000000'))
        
        makeLuaSprite('BotplayThing', 'EM/Botplay', 535, 40)
        addLuaSprite('BotplayThing', false)
        scaleObject('BotplayThing', 0.41, 0.41)
        setObjectCamera('BotplayThing', 'hud')
        setProperty('BotplayThing.alpha', 0)
  
        makeLuaSprite('Off', 'EM/Off', 1450, 344.5)
        addLuaSprite('Off', true)
        scaleObject('Off', 0.61, 0.61)
        setObjectCamera('Off', 'other')
        setProperty('Off.alpha', 0)
         setProperty('Off.color', getColorFromHex('000000'))

        makeLuaSprite('On', 'EM/On', 1450, 350)
        addLuaSprite('On', true)
        scaleObject('On', 0.61, 0.61)
        setObjectCamera('On', 'other')
        setProperty('On.alpha', 0)
         setProperty('On.color', getColorFromHex('000000'))
        
        makeLuaSprite('Updates', 'EM/Updates', 980, 360)
        addLuaSprite('Updates', true)
        scaleObject('Updates', 0.61, 0.61)
        setObjectCamera('Updates', 'other')
        setProperty('Updates.alpha', 0)
         setProperty('Updates.color', getColorFromHex('000000'))
        
        makeLuaSprite('options', 'EM/options', 980, 440)
        addLuaSprite('options', true)
        scaleObject('options', 0.61, 0.61)
        setObjectCamera('options', 'other')
        setProperty('options.alpha', 0)
         setProperty('options.color', getColorFromHex('000000'))
        
        makeLuaSprite('Exits', 'EM/Exit', 980, 500)
        addLuaSprite('Exits', true)
        scaleObject('Exits', 0.61, 0.61)
        setObjectCamera('Exits', 'other')
        setProperty('Exits.alpha', 0)
         setProperty('Exits.color', getColorFromHex('000000'))
        
        makeLuaSprite('back', 'EM/back', 880, 120)
        addLuaSprite('back', true)
        scaleObject('back', 0.95, 0.95)
        setObjectCamera('back', 'other')
        setProperty('back.alpha', 0)
         setProperty('back.color', getColorFromHex('000000'))
        
        makeLuaSprite('splash', 'EM/Splash', 200, 120)
        addLuaSprite('splash', true)
        scaleObject('splash', 0.95, 0.95)
        setObjectCamera('splash', 'other')
        setProperty('splash.alpha', 0)
         setProperty('splash.color', getColorFromHex('000000'))
        
        makeLuaSprite('IMT', 'EM/Immortality', 200, 80)
        addLuaSprite('IMT', true)
        scaleObject('IMT', 0.95, 0.95)
        setObjectCamera('IMT', 'other')
        setProperty('IMT.alpha', 0)
         setProperty('IMT.color', getColorFromHex('000000'))
        
        makeLuaSprite('Ghost', 'EM/Ghost', 220, 190)
        addLuaSprite('Ghost', true)
        scaleObject('Ghost', 0.95, 0.95)
        setObjectCamera('Ghost', 'other')
        setProperty('Ghost.alpha', 0)
         setProperty('Ghost.color', getColorFromHex('000000'))
        
        makeLuaSprite('MidS', 'EM/MidScroll', 220, 270)
        addLuaSprite('MidS', true)
        scaleObject('MidS', 0.95, 0.95)
        setObjectCamera('MidS', 'other')
        setProperty('MidS.alpha', 0)
         setProperty('MidS.color', getColorFromHex('000000'))

        makeLuaSprite('ScrollT', 'EM/ScrollType', 200, 350)
        addLuaSprite('ScrollT', true)
        scaleObject('ScrollT', 0.95, 0.95)
        setObjectCamera('ScrollT', 'other')
        setProperty('ScrollT.alpha', 0)
         setProperty('ScrollT.color', getColorFromHex('000000'))

        makeLuaSprite('fpsC', 'EM/FpsCounter', 190, 415)
        addLuaSprite('fpsC', true)
        scaleObject('fpsC', 0.95, 0.95)
        setObjectCamera('fpsC', 'other')
        setProperty('fpsC.alpha', 0)
        setProperty('fpsC.color', getColorFromHex('000000'))
        
        if OldTimeStyle == false then
        makeAnimatedLuaSprite('BoxThing', 'EM/BoxNew', 670, 90)
        addAnimationByPrefix('BoxThing', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing', 'other')
        setProperty('BoxThing.alpha', 0)
        scaleObject('BoxThing', 0.6, 0.6)
        addLuaSprite('BoxThing', true)
        
        makeAnimatedLuaSprite('BoxThing2', 'EM/BoxNew', 670, 200)
        addAnimationByPrefix('BoxThing2', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing2', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing2', 'other')
        setProperty('BoxThing2.alpha', 0)
        scaleObject('BoxThing2', 0.6, 0.6)
        addLuaSprite('BoxThing2', true)
        
        makeAnimatedLuaSprite('BoxThing3', 'EM/BoxNew', 710, 294)
        addAnimationByPrefix('BoxThing3', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing3', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing3', 'other')
        setProperty('BoxThing3.alpha', 0)
        scaleObject('BoxThing3', 0.6, 0.6)
        addLuaSprite('BoxThing3', true)

        makeAnimatedLuaSprite('BoxThing4', 'EM/BoxNew', 685, 370)
        addAnimationByPrefix('BoxThing4', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing4', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing4', 'other')
        setProperty('BoxThing4.alpha', 0)
        scaleObject('BoxThing4', 0.6, 0.6)
        addLuaSprite('BoxThing4', true)
        
        makeAnimatedLuaSprite('BoxThing5', 'EM/BoxNew', 630, 522)
        addAnimationByPrefix('BoxThing5', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing5', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing5', 'other')
        setProperty('BoxThing5.alpha', 0)
        scaleObject('BoxThing5', 0.6, 0.6)
        addLuaSprite('BoxThing5', true)
        
        makeAnimatedLuaSprite('BoxThing6', 'EM/BoxNew', 480, 572)
        addAnimationByPrefix('BoxThing6', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing6', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing6', 'other')
        setProperty('BoxThing6.alpha', 0)
        scaleObject('BoxThing6', 0.6, 0.6)
        addLuaSprite('BoxThing6', true)

        makeAnimatedLuaSprite('BoxThing7', 'EM/BoxNew', 690, 282)
        addAnimationByPrefix('BoxThing7', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing7', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing7', 'other')
        setProperty('BoxThing7.alpha', 0)
        scaleObject('BoxThing7', 0.6, 0.6)
        addLuaSprite('BoxThing7', true)

        makeAnimatedLuaSprite('BoxThing8', 'EM/BoxNew', 700, 192)
        addAnimationByPrefix('BoxThing8', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing8', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing8', 'other')
        setProperty('BoxThing8.alpha', 0)
        scaleObject('BoxThing8', 0.6, 0.6)
        addLuaSprite('BoxThing8', true)
        end
        if OldTimeStyle == true then
        makeAnimatedLuaSprite('BoxThing', 'OldStyle/BoxNew', 670, 90)
        addAnimationByPrefix('BoxThing', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing', 'other')
        setProperty('BoxThing.alpha', 0)
        scaleObject('BoxThing', 0.6, 0.6)
        addLuaSprite('BoxThing', true)
        
        makeAnimatedLuaSprite('BoxThing2', 'OldStyle/BoxNew', 670, 200)
        addAnimationByPrefix('BoxThing2', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing2', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing2', 'other')
        setProperty('BoxThing2.alpha', 0)
        scaleObject('BoxThing2', 0.6, 0.6)
        addLuaSprite('BoxThing2', true)
        
        makeAnimatedLuaSprite('BoxThing3', 'OldStyle/BoxNew', 710, 294)
        addAnimationByPrefix('BoxThing3', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing3', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing3', 'other')
        setProperty('BoxThing3.alpha', 0)
        scaleObject('BoxThing3', 0.6, 0.6)
        addLuaSprite('BoxThing3', true)

        makeAnimatedLuaSprite('BoxThing4', 'OldStyle/BoxNew', 685, 370)
        addAnimationByPrefix('BoxThing4', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing4', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing4', 'other')
        setProperty('BoxThing4.alpha', 0)
        scaleObject('BoxThing4', 0.6, 0.6)
        addLuaSprite('BoxThing4', true)
        
        makeAnimatedLuaSprite('BoxThing5', 'OldStyle/BoxNew', 630, 522)
        addAnimationByPrefix('BoxThing5', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing5', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing5', 'other')
        setProperty('BoxThing5.alpha', 0)
        scaleObject('BoxThing5', 0.6, 0.6)
        addLuaSprite('BoxThing5', true)
        
        makeAnimatedLuaSprite('BoxThing6', 'OldStyle/BoxNew', 480, 572)
        addAnimationByPrefix('BoxThing6', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing6', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing6', 'other')
        setProperty('BoxThing6.alpha', 0)
        scaleObject('BoxThing6', 0.6, 0.6)
        addLuaSprite('BoxThing6', true)

        makeAnimatedLuaSprite('BoxThing7', 'OldStyle/BoxNew', 690, 282)
        addAnimationByPrefix('BoxThing7', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing7', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing7', 'other')
        setProperty('BoxThing7.alpha', 0)
        scaleObject('BoxThing7', 0.6, 0.6)
        addLuaSprite('BoxThing7', true)

        makeAnimatedLuaSprite('BoxThing8', 'OldStyle/BoxNew', 700, 192)
        addAnimationByPrefix('BoxThing8', 'confirm', 'checkbox anim', 24, false)
        addAnimationByPrefix('BoxThing8', 'deny', 'checkbox anim reverse', 24, false)
        setObjectCamera('BoxThing8', 'other')
        setProperty('BoxThing8.alpha', 0)
        scaleObject('BoxThing8', 0.6, 0.6)
        addLuaSprite('BoxThing8', true)
        end

        makeLuaSprite('left', 'EM/left', 610, 450)
        setObjectCamera('left', 'other')
        setProperty('left.alpha', 0)
        scaleObject('left', 0.3, 0.3)
        addLuaSprite('left', true)
        setProperty('left.color', getColorFromHex('000000'))
        
        makeLuaSprite('right', 'EM/right', 840, 450)
        setObjectCamera('right', 'other')
        setProperty('right.alpha', 0)
        scaleObject('right', 0.3, 0.3)
        addLuaSprite('right', true)
        setProperty('right.color', getColorFromHex('000000'))
        
         makeLuaSprite('UpdateV1', 'EM/Updates/UpdateV1.5', 207, 110)
        addLuaSprite('UpdateV1', true)
        scaleObject('UpdateV1', 1.5, 1.5)
        setObjectCamera('UpdateV1', 'other')
        setProperty('UpdateV1.alpha', 0)
        
        makeLuaSprite('UpS', 'EM/UpS', 604, 390)
        addLuaSprite('UpS', true)
        scaleObject('UpS', 0.65, 0.65)
        setObjectCamera('UpS', 'other')
        setProperty('UpS.alpha', 0)
         setProperty('UpS.color', getColorFromHex('000000'))
        
        makeLuaSprite('SplitS', 'EM/SplitS', 637, 397)
        addLuaSprite('SplitS', true)
        scaleObject('SplitS', 0.65, 0.65)
        setObjectCamera('SplitS', 'other')
        setProperty('SplitS.alpha', 0)
        setProperty('SplitS.color', getColorFromHex('000000'))
        
        makeLuaSprite('DownS', 'EM/DownS', 645, 397)
        addLuaSprite('DownS', true)
        scaleObject('DownS', 0.65, 0.65)
        setObjectCamera('DownS', 'other')
        setProperty('DownS.alpha', 0)
        setProperty('DownS.color', getColorFromHex('000000'))

        makeLuaSprite('FuckedS', 'EM/FuckedS', 659, 390)
        addLuaSprite('FuckedS', true)
        scaleObject('FuckedS', 0.65, 0.65)
        setObjectCamera('FuckedS', 'other')
        setProperty('FuckedS.alpha', 0)
        setProperty('FuckedS.color', getColorFromHex('000000'))
        
        makeLuaSprite('Page1', 'EM/Page1', 1300, 250)
        addLuaSprite('Page1', true)
        scaleObject('Page1', 0.95, 0.95)
        setObjectCamera('Page1', 'other')
        setProperty('Page1.alpha', 1)
         setProperty('Page1.color', getColorFromHex('000000'))
        
        makeLuaSprite('Page2', 'EM/Page2', 880, 240)
        addLuaSprite('Page2', true)
        scaleObject('Page2', 0.95, 0.95)
        setObjectCamera('Page2', 'other')
        setProperty('Page2.alpha', 0)
         setProperty('Page2.color', getColorFromHex('000000'))
         
        makeLuaSprite('LQ', 'EM/LowQuality', 1300, 90)
        addLuaSprite('LQ', true)
        scaleObject('LQ', 0.95, 0.95)
        setObjectCamera('LQ', 'other')
        setProperty('LQ.alpha', 0)
         setProperty('LQ.color', getColorFromHex('000000'))
        
        makeLuaSprite('ATA', 'EM/Antialiasing', 1300, 180)
        addLuaSprite('ATA', true)
        scaleObject('ATA', 0.95, 0.95)
        setObjectCamera('ATA', 'other')
        setProperty('ATA.alpha', 0)
         setProperty('ATA.color', getColorFromHex('000000'))
        
        makeLuaSprite('Ost', 'EM/Ost', 1320, 280)
        addLuaSprite('Ost', true)
        scaleObject('Ost', 0.95, 0.95)
        setObjectCamera('Ost', 'other')
        setProperty('Ost.alpha', 0)
         setProperty('Ost.color', getColorFromHex('000000'))

        makeLuaSprite('ENDOFOst', 'EM/DisableOst', 1320, 280)
        addLuaSprite('ENDOFOst', true)
        scaleObject('ENDOFOst', 0.95, 0.95)
        setObjectCamera('ENDOFOst', 'other')
        setProperty('ENDOFOst.alpha', 0)
         setProperty('ENDOFOst.color', getColorFromHex('000000'))
         
        makeLuaSprite('HON', 'EM/HON', 1320, 430)
        addLuaSprite('HON', true)
        scaleObject('HON', 0.95, 0.95)
        setObjectCamera('HON', 'other')
        setProperty('HON.alpha', 0)
         setProperty('HON.color', getColorFromHex('000000'))

    setProperty('iconP1.x', getProperty('Mouse.x') + 1108)
    setProperty('iconP2.x', getProperty('Mouse.x') + 9)
    setProperty('iconP1.y', getProperty('Mouse.y') + 15) 
    setProperty('iconP2.y', getProperty('Mouse.y') + 15)
    setProperty('timeBarTxt.alpha', 0)
    setProperty('timeBarBG.alpha', 0)
    setProperty('timeBar.alpha', 0)
    setProperty('timeBarTxt.alpha', 0)
    setProperty('timeBarBG.alpha', 0)
    setProperty('timeBar.alpha', 0)
	setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeTxt.visible', false)
    
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'TryAgainRestart');
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'LoopingFinalDeath');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'YouDiedSad');

     makeLuaSprite('blackThing', 'daBlack', 0, 0)
     setProperty('blackThing.alpha', 0)
     setObjectCamera('blackThing', 'camOther')
     addLuaSprite('blackThing', true)
     
    if CustomThinnerDeath == true then
        setPropertyFromClass('GameOverSubstate', 'characterName', 'oswald-player');
        precacheImage('characters/Oswald_Playerv2')
    end
end

function onUpdatePost()
if hits < 1 then
    if botPlay == true then
    setProperty('scoreTxt.text', 'Cheat = No Score')
    end
    if botPlay == false then
    setProperty('scoreTxt.text', 'You dont have tickets sufficient for that')
    end
elseif misses < 1 then
setProperty('scoreTxt.text', 'Tickets: ' .. score .. ' | Misses: ' .. misses .. ' | Accuracy: ' ..  sus(rating * 100, 2) .. '%'  ..  ' | [' .. ratingFC ..']')
else
setProperty('scoreTxt.text', 'Tickets: ' .. score .. ' | Misses: ' .. misses .. ' | Accuracy: ' ..  sus(rating * 100, 2) .. '%')
end
setObjectOrder('scoreTxt', getObjectOrder('scoreTxt') + 99)
    setProperty('iconP1.x', getProperty('Mouse.x') + 1108)
    setProperty('iconP2.x', getProperty('Mouse.x') + 9)
    setProperty('iconP1.y', getProperty('Mouse.y') + 15) 
    setProperty('iconP2.y', getProperty('Mouse.y') + 15)
    setObjectOrder('iconP1', getObjectOrder('BT2') + 1)
    setObjectOrder('iconP2', getObjectOrder('BT') + 1)

     setProperty('healthBarBG.visible', false)
    setProperty('healthBar.visible', false)
    setObjectOrder('NBCopy', 4)
	setObjectOrder('healthBar', 3)
	setObjectOrder('healthBarBG', 2)
    setProperty('NB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))
	setProperty('NBCopy.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))
    setProperty('NBCopyy.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))
    setProperty('NBCopyyy.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))
    if getProperty('health') <= 1 then
        objectPlayAnimation('NBCopyyy', 'empty')
        objectPlayAnimation('NBCopyy', 'empty')
     end
    setProperty('timeBarTxt.alpha', 0)
    setProperty('timeBarBG.alpha', 0)
    setProperty('timeBar.alpha', 0)
    setProperty('timeBarTxt.alpha', 0)
    setProperty('timeBarBG.alpha', 0)
    setProperty('timeBar.alpha', 0)
	setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeTxt.visible', false)
    setProperty('botplayTxt.alpha', 0)
    setProperty('Botplay.visible', false)
    setTextFont('scoreTxt', 'MICKEY.ttf')
    setTextColor('scoreTxt', '000000')
    setTextBorder('scoreTxt', 3, 'FFFFFF')
    setProperty('FPStext.font', 'MICKEY.ttf')
end

function sus(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
n = math.pow(10, n or 0)
x = x * n
if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
return x / n
end

function onCreatePost()
defNoReset = getPropertyFromClass("ClientPrefs", "noReset")
         setProperty('showComboNum', false)
     for i = 0, 4 do
        setProperty('ratingsData['..i..'].image', 'blank')
     end
    setProperty('botplayTxt.alpha', 0)
    setProperty('Botplay.visible', false)
    setTextFont('scoreTxt', 'MICKEY.ttf')
    setProperty('timeBarTxt.alpha', 0)
    setProperty('timeBarBG.alpha', 0)
    setProperty('timeBar.alpha', 0)
    setProperty('timeBarTxt.alpha', 0)
    setProperty('timeBarBG.alpha', 0)
    setProperty('timeBar.alpha', 0)
	setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeTxt.visible', false)
end



function onUpdate(elapsed)
            if FpsOn == true and paused == false then
             objectPlayAnimation('BoxThing5', 'deny')
            end
            if FpsOn == false and paused == false then
             objectPlayAnimation('BoxThing5', 'confirm')
            end
            if getPropertyFromClass("Main", "fpsVar.visible") == true and paused == false then
             FpsOn = true
            end
            if getPropertyFromClass("Main", "fpsVar.visible") == false and paused == false then
             FpsOn = false
            end
if OstMode == true then
    setProperty('skipCountdown', true)
    setProperty('cpuControlled', true)
    fakepratice = true
           makeLuaText('OstThing', ' OST Mode Is On!', 1280, 950, 5)
           setTextColor('OstThing', '000000')
           setTextSize('OstThing', 30)
           setTextFont('OstThing', 'MICKEY.ttf')
           setTextBorder('OstThing', 3, 'FFFFFF')
           addLuaText('OstThing', true)
	      setTextAlignment('OstThing','left')
else
    removeLuaText('OstThing')
    setProperty('cpuControlled', false)
    fakepratice = false
end 
scaleObject('fill', 165 * getProperty("songPercent"), 2.3)
    if OldTimeStyle == true then
	    for i = 0, 7 do
       setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets2');   
       setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets2');
       setPropertyFromGroup('notes', i, 'texture', 'NOTE_assets2');
          end
        for i = 0, 7 do
            setPropertyFromGroup('notes', i, 'noteSplashTexture', 'noteSplashes2');
           end
    for i = 0, 7 do
    if getPropertyFromGroup('notes', i, 'noteType') == 'Hurt Note' then
       setPropertyFromGroup('playerStrums', i, 'texture', 'HURTNOTE_assets2');   
       setPropertyFromGroup('opponentStrums', i, 'texture', 'HURTNOTE_assets2');
       setPropertyFromGroup('notes', i, 'texture', 'HURTNOTE_assets2');
              end
          end
        for i = 0, 7 do
        if getPropertyFromGroup('notes', i, 'noteType') == 'Hurt Note' then
            setPropertyFromGroup('notes', i, 'noteSplashTexture', 'HURTnoteSplashes2');
              end
          end
     end
        if curSelected == 'resume' then
           setProperty('Resumes.color', getColorFromHex('FFFFFF'))
        else
           setProperty('Resumes.color', getColorFromHex('000000'))
        end
        if curSelected == 'restart' then
           setProperty('Restarts.color', getColorFromHex('FFFFFF'))
        else
           setProperty('Restarts.color', getColorFromHex('000000'))
        end
        if curSelected == 'exit' then
           setProperty('Exits.color', getColorFromHex('FFFFFF'))
        else
           setProperty('Exits.color', getColorFromHex('000000'))
        end
        if curSelected == 'updates' then
           setProperty('Updates.color', getColorFromHex('FFFFFF'))
        else
           setProperty('Updates.color', getColorFromHex('000000'))
	    end
        if curSelected == 'options' then
           setProperty('options.color', getColorFromHex('FFFFFF'))
        else
           setProperty('options.color', getColorFromHex('000000'))
        end
        if curSelected == 'botplay' then
           setProperty('Botplayy.color', getColorFromHex('FFFFFF'))
        else
           setProperty('Botplayy.color', getColorFromHex('000000'))
	    end
        if curSelected == 'back' then
           setProperty('back.color', getColorFromHex('FFFFFF'))
        else
           setProperty('back.color', getColorFromHex('000000'))
        end
        if curSelected == 'splash' then
           setProperty('splash.color', getColorFromHex('FFFFFF'))
        else
           setProperty('splash.color', getColorFromHex('000000'))
        end
        if curSelected == 'IMT' then
           setProperty('IMT.color', getColorFromHex('FFFFFF'))
        else
           setProperty('IMT.color', getColorFromHex('000000'))
        end
        if curSelected== 'Ghost' then
           setProperty('Ghost.color', getColorFromHex('FFFFFF'))
        else
           setProperty('Ghost.color', getColorFromHex('000000'))
        end
        if curSelected== 'MidS' then
           setProperty('MidS.color', getColorFromHex('FFFFFF'))
        else
           setProperty('MidS.color', getColorFromHex('000000'))
        end
        if curSelected== 'ScrollT' then
           setProperty('ScrollT.color', getColorFromHex('FFFFFF'))
        else
           setProperty('ScrollT.color', getColorFromHex('000000'))
        end
        if curSelected== 'fpsC' then
           setProperty('fpsC.color', getColorFromHex('FFFFFF'))
        else
           setProperty('fpsC.color', getColorFromHex('000000'))
        end
        if curSelected == 'UpType' or curSelected == 'DownType' or curSelected == 'FuckedType' or curSelected == 'SplitType' then
	    end
        if curSelected == 'Page1' then
           setProperty('Page2.color', getColorFromHex('FFFFFF'))
           setProperty('Page1.color', getColorFromHex('FFFFFF'))
        else
           setProperty('Page2.color', getColorFromHex('000000'))
           setProperty('Page1.color', getColorFromHex('000000'))
        end
        if curSelected== 'LQ' then
           setProperty('LQ.color', getColorFromHex('FFFFFF'))
        else
           setProperty('LQ.color', getColorFromHex('000000'))
        end
        if curSelected== 'ATA' then
           setProperty('ATA.color', getColorFromHex('FFFFFF'))
        else
           setProperty('ATA.color', getColorFromHex('000000'))
        end
        if curSelected== 'OST' then
           setProperty('Ost.color', getColorFromHex('FFFFFF'))
        else
           setProperty('Ost.color', getColorFromHex('000000'))
        end
        if curSelected== 'HON' then
           setProperty('HON.color', getColorFromHex('FFFFFF'))
        else
           setProperty('HON.color', getColorFromHex('000000'))
        end
    if getPropertyFromClass('ClientPrefs', 'noteSplashes') == true and stop == true then
         objectPlayAnimation('BoxThing', 'confirm')
         stop = false
    elseif getPropertyFromClass('ClientPrefs', 'noteSplashes') == false and stop == true then
         objectPlayAnimation('BoxThing', 'deny')
         stop = false
       end
    if fakepractice == true and stort == true then
        objectPlayAnimation('BoxThing2', 'confirm')
        stort = false
    elseif fakepractice == false and stort == true then
        objectPlayAnimation('BoxThing2', 'deny')
        stort = false
    end
    if Ghost == true and ght == true then
        objectPlayAnimation('BoxThing3', 'confirm')
        ght = false
    elseif Ghost == false and ght == true then
        objectPlayAnimation('BoxThing3', 'deny')
        ght = false
    end
    if Mid == true and MD == true then
        objectPlayAnimation('BoxThing4', 'confirm')
        MD = false
    elseif Mid == false and MD == true then
        objectPlayAnimation('BoxThing4', 'deny')
        MD = false
    end
    if Fp == true and Fs == true then
        objectPlayAnimation('BoxThing5', 'confirm')
        Fs = false
    elseif Fp == false and Fs == true then
        objectPlayAnimation('BoxThing5', 'deny')
        Fs = false
    end
    if lowQuality == true and LqT == true then
        objectPlayAnimation('BoxThing8', 'confirm')
        LqT = false
    elseif lowQuality == false and LqT == true then
        objectPlayAnimation('BoxThing8', 'deny')
        LqT = false
    end       
    if curSelected == 'resume' then
        setProperty('Under.y', 110)
        setProperty('Under.scale.x', 0.54)
        setProperty('Under.x', 997)
        ResumeC = true
        RestartC = false
    elseif curSelected == 'restart' then
        setProperty('Under.y', 200)
        setProperty('Under.scale.x', 0.54)
        setProperty('Under.x', 997)
            doTweenAlpha('OnIn', 'On', 0, 0.4, 'linear')
            doTweenX('OnInX', 'On', 1450, 0.3, 'linear')
            doTweenAlpha('OffIn', 'Off', 0, 0.4, 'linear')
            doTweenX('OffInX', 'Off', 1450, 0.3, 'linear')
    elseif curSelected == 'exit' then
        setProperty('Under.y', 495)
        setProperty('Under.scale.x', 0.3)
        setProperty('Under.x', 985)
    elseif curSelected == 'updates' then
	    setProperty('Under.y', 345)
        setProperty('Under.scale.x', 0.54)
        setProperty('Under.x', 997)
            doTweenAlpha('OnIn', 'On', 0, 0.4, 'linear')
            doTweenX('OnInX', 'On', 1450, 0.3, 'linear')
            doTweenAlpha('OffIn', 'Off', 0, 0.4, 'linear')
            doTweenX('OffInX', 'Off', 1450, 0.3, 'linear')
    elseif curSelected == 'options' then
	    setProperty('Under.y', 430)
        setProperty('Under.scale.x', 0.50)
        setProperty('Under.x', 1000)
    elseif curSelected == 'botplay' then
	    setProperty('Under.y', 270)
        setProperty('Under.scale.x', 0.54)
        setProperty('Under.x', 997)
        RestartC = false
        if not botPlay then
            doTweenAlpha('OnIn', 'On', 0, 0.4, 'linear')
            doTweenX('OnInX', 'On', 1450, 0.3, 'linear')
            doTweenAlpha('OffIn', 'Off', 1, 0.4, 'linear')
            doTweenX('OffInX', 'Off', 850, 0.3, 'linear')
        elseif botPlay then
            doTweenAlpha('OnIn', 'On', 1, 0.4, 'linear')
            doTweenX('OnInX', 'On', 850, 0.3, 'linear')
            doTweenAlpha('OffIn', 'Off', 0, 0.4, 'linear')
            doTweenX('OffInX', 'Off', 1450, 0.3, 'linear')
        end
        elseif curSelected == 'back' then
        setProperty('Under.y', 173)
        setProperty('Under.scale.x', 0.3)
        setProperty('Under.x', 976)
        removeLuaText('TextMid')
        setProperty('FuckedS.alpha', 0)
        setProperty('SplitS.alpha', 0)
        setProperty('UpS.alpha', 0)
        setProperty('DownS.alpha', 0)
        setProperty('left.alpha', 0)
        setProperty('right.alpha', 0)
        elseif curSelected == 'splash' then
        setProperty('Under.y', 25)
        setProperty('Under.scale.x', 0.6)
        setProperty('Under.x', 345)
        elseif curSelected == 'IMT' then
        setProperty('Under.y', 135)
        setProperty('Under.scale.x', 0.65)
        setProperty('Under.x', 345)
        elseif curSelected== 'Ghost' then
        setProperty('Under.y', 235)
        setProperty('Under.scale.x', 0.65)
        setProperty('Under.x', 345)
        removeLuaText('TextMid')
        elseif curSelected== 'MidS' then
        setProperty('Under.y', 305)
        setProperty('Under.scale.x', 0.65)
        setProperty('Under.x', 345)
        makeLuaText('TextMid', 'This will Restart the game', 200, 1045, 15)
        addLuaText('TextMid', true)
        setTextFont('TextMid', 'MICKEY.tff')
        setTextSize('TextMid', 20)
        elseif curSelected== 'ScrollT' then
        setProperty('Under.y', 385)
        setProperty('Under.scale.x', 0.65)
        setProperty('Under.x', 345)
        removeLuaText('TextMid')
        elseif curSelected== 'fpsC' then
        setProperty('Under.y', 460)
        setProperty('Under.scale.x', 0.65)
        setProperty('Under.x', 345)
        elseif curSelected == 'UpType' or curSelected == 'DownType' or curSelected == 'FuckedType' or curSelected == 'SplitType' then
        setProperty('Under.y', 385)
        setProperty('Under.scale.x', 0.85)
        doTweenX('UdnerH', 'Under', 445, 0.3, 'linear')
        setProperty('Under.x', 445)
        elseif curSelected == 'Page1' then
        setProperty('Under.y', 288)
        setProperty('Under.scale.x', 0.3)
        setProperty('Under.x', 976)
        elseif curSelected == 'LQ' then
        setProperty('Under.y', 125)
        setProperty('Under.scale.x', 0.65)
        setProperty('Under.x', 345)
        elseif curSelected == 'ATA' then
        setProperty('Under.y', 220)
        setProperty('Under.scale.x', 0.65)
        setProperty('Under.x', 345)
        elseif curSelected == 'OST' then
        setProperty('Under.y', 325)
        setProperty('Under.scale.x', 0.65)
        setProperty('Under.x', 345)
        elseif curSelected == 'HON' then
        setProperty('Under.y', 435)
        setProperty('Under.scale.x', 0.65)
        setProperty('Under.x', 345)
	end
setTextString('ScoreTickets', getProperty('songScore'))
     if FirstBar == true then
        objectPlayAnimation('NBCopy', 'empty')
        FirstBar = false
     end
     if SecondBar == true then
          objectPlayAnimation('NBCopyy', 'empty')
        SecondBar = false
     end
     if ThirdBar == true then
        objectPlayAnimation('NBCopyyy', 'empty')
        ThirdBar = false
     end
     if getProperty('health') <= 0.075 then
        objectPlayAnimation('NB', 'empty')
     elseif getProperty('health') <= 0.125 then
        objectPlayAnimation('NB', 'minorhalf')
    elseif getProperty('health') <= 0.25 then
        objectPlayAnimation('NB', 'half')
    elseif getProperty('health') <= 0.375 then
         objectPlayAnimation('NB', 'morehalf')
          FirstBar = true
    elseif getProperty('health') <= 0.5 then
          objectPlayAnimation('NB', 'full')
    elseif getProperty('health') <= 0.625 then
        objectPlayAnimation('NBCopy', 'minorhalf')
    elseif getProperty('health') <= 0.75 then
        objectPlayAnimation('NBCopy', 'half')
    elseif getProperty('health') <= 0.875 then
          SecondBar = true
         objectPlayAnimation('NBCopy', 'morehalf')
    elseif getProperty('health') <= 1 then
          objectPlayAnimation('NBCopy', 'full')
    elseif getProperty('health') <= 1.125 then
        objectPlayAnimation('NBCopyy', 'minorhalf')
    elseif getProperty('health') <= 1.25 then
        objectPlayAnimation('NBCopyy', 'half')
    elseif getProperty('health') <= 1.375 then
          ThirdBar = true
         objectPlayAnimation('NBCopyy', 'morehalf')
    elseif getProperty('health') <= 1.5 then
          objectPlayAnimation('NBCopyy', 'full')
          objectPlayAnimation('NBCopyyy', 'empty')
    elseif getProperty('health') <= 1.625 then
         objectPlayAnimation('NBCopyyy', 'minorhalf')
    elseif getProperty('health') <= 1.75 then
        objectPlayAnimation('NBCopyyy', 'half')
    elseif getProperty('health') <= 1.875 then
         objectPlayAnimation('NBCopyyy', 'morehalf')
    elseif getProperty('health') <= 2 then
          objectPlayAnimation('NBCopyyy', 'full')
    end
    if downscroll == true then
        DownScrollThing = true
    end
    if downscroll == false then
        DownScrollThing = false
     end
        
	if not inCutscene then
		if keyJustPressed("Pause") or AndroidPause == true and startedCountdown and canPause and CustomPause == true then
        canChange = true
        canPause = false
        stort = true
        ght = true
        MD = true
        Fs = true
        LqT = true
        AndroidPause = false
        canControl = true
        intransition = false
        Upt = false
           makeLuaText('songName', songName..' - Song', 1280, 5, 690)
           setTextColor('songName', '000000')
           setTextSize('songName', 30)
           setTextFont('songName', 'MICKEY.ttf')
           setTextBorder('songName', 3, 'FFFFFF')
           addLuaText('songName', true)
	      setTextAlignment('songName','left')
        curSelected = 'resume'
        doTweenAlpha('ShadowA', 'Shadow', 1, 0.3, 'linear')
        doTweenAlpha('Un', 'Under', 1, 0.5, 'linear')
        setProperty('inCutscene', true)
        playSound('PauseMenu', 4, 'PauseMenu')
    setProperty('ScoreTickets.alpha', 1)
    makeLuaSprite('bgEM', Sprite, 0, 0)
	setObjectCamera('bgEM', 'camHUD')
	addLuaSprite('bgEM', false)
	scaleObject('bgEM', 1.8, 1.8)
    makeLuaSprite("fill", "", 153, 26)
	makeGraphic('fill', 2, 16, 'FFFFFF')
    setObjectCamera("fill", "camOther")
    scaleObject("fill", 165, 2.3)
    setProperty("fill.alpha", 0)
	addLuaSprite('fill', true)
	setProperty('healthBarBG.visible', false)
	setProperty('healthBar.visible', false)
    setProperty('iconP2.alpha', 0)
    setProperty("fill.alpha", 1)
    setProperty('iconP1.alpha', 0)
    setProperty('healthBarBG.alpha', 0)
    setProperty('healthBar.alpha', 0)
    setProperty('botplayTxt.alpha', 0)
    setProperty('scoreTxt.visible', false)
    setProperty('timeBarTxt.alpha', 0)
    setProperty('timeBarBG.alpha', 0)
    setProperty('timeBar.alpha', 0)
	setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeTxt.visible', false)
    setProperty('BT.visible', false)
    setProperty('BT2.visible', false)
    setProperty('ConfirmPls.alpha', 1)
 doTweenY('splashY', 'splash', 0, 0.5, 'linear')
 doTweenY('TicketsY', 'Tickets', 30, 0.5, 'linear')
setProperty('NB.visible', false)
setProperty('NBCopy.visible', false)
setProperty('NBCopyy.visible', false)
setProperty('NBCopyyy.visible', false)
		setProperty('Resumes.alpha', 1)
		setProperty('Tickets.alpha', 1)
        setProperty('Restarts.alpha', 1)
        setProperty('Exits.alpha', 1)
        setProperty('Botplayy.alpha', 1)
        setProperty('Updates.alpha', 1)
        setProperty('options.alpha', 1)
        setProperty('BotplayThing.alpha', 0)
    for i = 0, getProperty('notes.length')-1 do
            setProperty('notes.visible', false)
          end
        setProperty('splash.alpha', 0)
    noteTweenAlpha('alphatween0', 0, 0, 0.3, 'linear')
    noteTweenAlpha('alphatween1', 1, 0, 0.3, 'linear')
    noteTweenAlpha('alphatween2', 2, 0, 0.3, 'linear')
    noteTweenAlpha('alphatween3', 3, 0, 0.3, 'linear')
    noteTweenAlpha('alphatween4', 4, 0, 0.3, 'linear')
    noteTweenAlpha('alphatween5', 5, 0, 0.3, 'linear')
    noteTweenAlpha('alphatween6', 6, 0, 0.3, 'linear')
    noteTweenAlpha('alphatween7', 7, 0, 0.3, 'linear')
			if not paused then
				isPaused = true
				setPropertyFromClass("ClientPrefs", "noReset", true)
				setPropertyFromClass("flixel.FlxG", "sound.music.volume", 0)
				setProperty("vocals.volume", 0)
				currentpausepos = getPropertyFromClass("Conductor", "songPosition")
				bfPause = getProperty("boyfriend.animation.curAnim.paused")
				dadPause = getProperty("dad.animation.curAnim.paused")
				bf2Pause = getProperty("boyfriend2.animation.curAnim.paused")
				dad2Pause = getProperty("dad2.animation.curAnim.paused")
				gfPause = getProperty("gf.animation.curAnim.paused")
				curDadHeyTimer = getProperty("dad.heyTimer")
				curGfHeyTimer = getProperty("gf.heyTimer")
				curBfHeyTimer = getProperty("boyfriend.heyTimer")
				curDadHeyTimer = getProperty("dad.heyTimer")
				curGfHeyTimer = getProperty("gf.heyTimer")
				paused = true
				runTimer('animationmoment', 0.5, 1)
			end
		end
	end
	if paused then 
	    WHAT = false
		setPropertyFromClass("Conductor", "songPosition", currentpausepos)
		setPropertyFromClass("flixel.FlxG", "sound.music.time", currentpausepos)
		setProperty("vocals.time", currentpausepos)
		
		setProperty("boyfriend.animation.curAnim.paused", true)
		setProperty("dad.animation.curAnim.paused", true)
		setProperty("boyfriend2.animation.curAnim.paused", true)
		setProperty("dad2.animation.curAnim.paused", true)
		setProperty("gf.animation.curAnim.paused", true)

		setProperty("boyfriend.heyTimer", curBfHeyTimer)
		setProperty("dad.heyTimer", curDadHeyTimer)
		setProperty("gf.heyTimer", curGfHeyTimer)
	
		if getProperty("boyfriend.animation.curAnim.name") ~= "idle" then
			setProperty("boyfriend.specialAnim", true)
		end
		if getProperty("dad.animation.curAnim.name") ~= "idle" then
			setProperty("dad.specialAnim", true)
		end
		if getProperty("gf.animation.curAnim.name") ~= "idle" and getProperty("gf.animation.curAnim.name") ~= "danceIdle" then
			setProperty("gf.specialAnim", true)
		end
    else
        WHAT = true
	end
    if buildTarget == 'android' then
        if canControl and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and (getMouseY('camHUD') > 88 and getMouseY('camHUD') < 220 and mouseClicked('left')) or keyJustPressed('accept') then
		            objectPlayAnimation('ConfirmPls', 'Pressed', false);
		            AndroidControlled = true
		       else
                    objectPlayAnimation('ConfirmPls', 'Press', true);
		    end
     end
	if keyJustPressed("up") and canControl and not intransition and curSelected == 'resume' and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'exit'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
	if keyJustPressed("down") and canControl and not intransition and curSelected == 'resume' and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'restart'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
	if keyJustPressed("up") and canControl and not intransition and curSelected == 'restart' and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'resume'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
	if keyJustPressed("down") and canControl and not intransition and curSelected == 'restart' and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'botplay'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'botplay' and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'updates'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'updates' and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'options'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'options' and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'exit'
    Back = false
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
	if keyJustPressed("up") and canControl and not intransition and curSelected == 'exit' and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'options'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'options' and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'updates'
    Back = false
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'updates' and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'botplay'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'botplay' and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'restart'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
	if keyJustPressed("down") and canControl and not intransition and curSelected == 'exit' and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'resume'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("right") and canControl and not intransition and Opt == true and Upt == false and Back == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'back'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("left") and canControl and not intransition and curSelected == 'back' and Opt == true and Upt == false and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'splash'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("left") and canControl and not intransition and curSelected == 'Page1' and Opt == true and Upt == false and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'splash'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'splash' and Opt == true and Upt == false and Page2 == false then 
	playSound('ScrollThing', 4.3)
	curSelected = 'IMT'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'IMT' and Opt == true and Upt == false and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'Ghost'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'Ghost' and Opt == true and Upt == false and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'MidS'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'MidS' and Opt == true and Upt == false and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'ScrollT'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'ScrollT' and Opt == true and Upt == false and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'fpsC'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'fpsC' and Opt == true and Upt == false and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'splash'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'IMT' and Opt == true and Upt == false and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'splash'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'Ghost' and Opt == true and Upt == false and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'IMT'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'MidS' and Opt == true and Upt == false and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'Ghost'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'ScrollT' and Opt == true and Upt == false and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'MidS'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'fpsC' and Opt == true and Upt == false and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'ScrollT'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'splash' and Opt == true and Upt == false and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'fpsC'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("right") and canControl and not intransition and curSelected == 'UpType' and typeS == true and Page2 == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'DownType'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("right") and canControl and not intransition and curSelected == 'DownType' and typeS == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'SplitType'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("right") and canControl and not intransition and curSelected == 'SplitType' and typeS == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'FuckedType'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("left") and canControl and not intransition and curSelected == 'DownType' and typeS == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'UpType'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("left") and canControl and not intransition and curSelected == 'SplitType' and typeS == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'DownType'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("left") and canControl and not intransition and curSelected == 'FuckedType' and typeS == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'SplitType'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'back' and Opt == true and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'Page1'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'Page1' and Opt == true and Upt == false then
	playSound('ScrollThing', 4.3)
	curSelected = 'back'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("left") and canControl and not intransition and curSelected == 'Page1' and Page2 == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'LQ'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("left") and canControl and not intransition and curSelected == 'back' and Page2 == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'LQ'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("right") and canControl and not intransition and Page2 == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'back'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'LQ' and Page2 == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'ATA'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'ATA' and Page2 == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'OST'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'OST' and Page2 == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'HON'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'LQ' and Page2 == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'HON'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'HON' and Page2 == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'OST'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'OST' and Page2 == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'ATA'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("up") and canControl and not intransition and curSelected == 'ATA' and Page2 == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'LQ'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
    if keyJustPressed("down") and canControl and not intransition and curSelected == 'HON' and Page2 == true then
	playSound('ScrollThing', 4.3)
	curSelected = 'LQ'
	intransition = true
	runTimer('notransition', 0.1, 1)
	end
	if keyJustPressed("accept") or AndroidControlled == true and canControl and not AIntransition then
       AndroidControlled = false
       canChange = false
       runTimer('AIntransition', 2.2, 1)
       runTimer('notransition', 2.2, 1)
       intransition = true
       AIntransition = true
       setProperty('Under.alpha', 0)
	   playSound('ConfirmThing', 4.9, 'ConfirmThing', 0)
	if curSelected == 'restart' then
	setProperty('Restarts.alpha', 0)
    stopSound('PauseMenu')
    canControl = false
	elseif curSelected == 'exit' then
	setProperty('exits.alpha', 0)
    stopSound('PauseMenu')
	Idk = true 
    canControl = false
	elseif curSelected == 'resume' then
	setProperty('Resumes.alpha', 0)
	doTweenAlpha('Bg', 'bgEM', 0, 0.2, 'linear')
    stopSound('PauseMenu')
    resumed = true
    if HidedArrows == false then
    noteTweenAlpha('alphatween0', 0, 1, 0.5, 'linear')
    noteTweenAlpha('alphatween1', 1, 1, 0.5, 'linear')
    noteTweenAlpha('alphatween2', 2, 1, 0.5, 'linear')
    noteTweenAlpha('alphatween3', 3, 1, 0.5, 'linear')
    for i = 0, 3 do
            setProperty('notes.visible', true)
          end
    end
    if HidedArrows == true then
    noteTweenAlpha('alphatween0', 0, 0, 0.5, 'linear')
    noteTweenAlpha('alphatween1', 1, 0, 0.5, 'linear')
    noteTweenAlpha('alphatween2', 2, 0, 0.5, 'linear')
    noteTweenAlpha('alphatween3', 3, 0, 0.5, 'linear')
    for i = 0, 3 do
            setProperty('notes.visible', false)
          end
    end
    noteTweenAlpha('alphatween4', 4, 1, 0.5, 'linear')
    noteTweenAlpha('alphatween5', 5, 1, 0.5, 'linear')
    noteTweenAlpha('alphatween6', 6, 1, 0.5, 'linear')
    noteTweenAlpha('alphatween7', 7, 1, 0.5, 'linear')
    for i = 4, 7 do
            setProperty('notes.visible', true)
          end
    canControl = false
    elseif curSelected == 'updates' then
	setProperty('Updates.alpha', 0)
	canControl = true
    elseif curSelected == 'options' then
	setProperty('options.alpha', 0)
	Clic = true
	con = true
	canControl = true
    elseif curSelected == 'botplay' then
	setProperty('Botplayy.alpha', 0)
	canControl = true
    elseif curSelected == 'back' and Back == true and Upt == false then
    setProperty('back.alpha', 0)
	canControl = true
    elseif curSelected == 'back' and Back == true and Upt == true then
    doTweenAlpha('Update', 'UpdateV1', 0, 0.3, 'linear')
    setProperty('back.alpha', 0)
	canControl = true
    elseif curSelected == 'splash' and Back == true then
    setProperty('splash.alpha', 1)
	canControl = true
    if getPropertyFromClass('ClientPrefs', 'noteSplashes') == true then
         setPropertyFromClass('ClientPrefs', 'noteSplashes', false)
         objectPlayAnimation('BoxThing', 'deny')
    elseif getPropertyFromClass('ClientPrefs', 'noteSplashes') == false then
         setPropertyFromClass('ClientPrefs', 'noteSplashes', true)
         objectPlayAnimation('BoxThing', 'confirm')
       end
    elseif curSelected == 'IMT' and Back == true then
        setProperty('IMT.alpha', 1)
        canControl = true
         if fakepractice == true then
             objectPlayAnimation('BoxThing2', 'deny')
             fakepractice = false
         elseif fakepractice == false then
             objectPlayAnimation('BoxThing2', 'confirm')
             fakepractice = true
          end
    elseif curSelected == 'Ghost' and Back == true then
         if Ghost == true then
             objectPlayAnimation('BoxThing3', 'deny')
             setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
             ghosttapping = false
             Ghost = false
         elseif Ghost == false then
             objectPlayAnimation('BoxThing3', 'confirm')
             setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
             ghosttapping = true
             Ghost = true
          end
    elseif curSelected == 'MidS' and Back == true then
         MidEnd = true
         if Mid == true then
             objectPlayAnimation('BoxThing4', 'deny')
             setPropertyFromClass('ClientPrefs', 'middleScroll', false)
             middleScroll = false
             Mid = false
         elseif Mid == false then
             objectPlayAnimation('BoxThing4', 'confirm')
             setPropertyFromClass('ClientPrefs', 'middleScroll', true)
             middleScroll = true
             Mid = true
          end
    elseif curSelected == 'ScrollT' and Back == true then
           doTweenX('UnderFhin', 'Under.scale', 0.85, 0.3, 'linear')
    elseif curSelected == 'fpsC' and Back == true then
            if getPropertyFromClass("Main", "fpsVar.visible") == true then
             objectPlayAnimation('BoxThing5', 'deny')
             FpsOn = true
             runTimer('byeFps', 1)
           end
            if getPropertyFromClass("Main", "fpsVar.visible") == false then
             objectPlayAnimation('BoxThing5', 'confirm')
             FpsOn = false
             runTimer('hiFps', 1)
           end
    elseif curSelected == 'UpType' then
         typeS = false
        Opt = true
        Upt = false
        DownThingS = false
        UpThingS = true
        BruhDown = 1
        local settings = {
['On?']       = true; 
['debug']     = false;
['Turning']   = 90
  }
        setPropertyFromClass('ClientPrefs', 'downScroll', false)
            for i = 0, 7 do  
                setPropertyFromGroup('playerStrums', i, 'y', 64)
                setPropertyFromGroup('playerStrums',i,'downScroll',false)
                setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
               end
            for o = 0, 7 do
                setPropertyFromGroup('opponentStrums', o, 'y', 64)
                setPropertyFromGroup('opponentStrums',o,'downScroll',false)
                setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
            end
            setProperty('scoreTxt.y', 660)
    elseif curSelected == 'DownType' then
         typeS = false
        Opt = true
        Upt = false
        DownThingS = true
        UpThingS = false
        BruhDown = 2
        local settings = {
['On?']       = true; 
['debug']     = false;
['Turning']   = 90
  }
        setPropertyFromClass('ClientPrefs', 'downScroll', true)
            for i = 0, 7 do  
                setPropertyFromGroup('playerStrums', i, 'y', 577)
                setPropertyFromGroup('playerStrums',i,'downScroll', true)
                setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
               end
            for o = 0, 7 do
                setPropertyFromGroup('opponentStrums', o, 'y', 577)
                setPropertyFromGroup('opponentStrums',o,'downScroll', true)
                setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
            end
            setProperty('scoreTxt.y', 120)
    elseif curSelected == 'SplitType' then  --By: BlueColorsin's Shitty Scripts production
         typeS = false
        Opt = true
        Upt = false
        SplitTypeH = 1
                local settings = {
['On?']       = true; 
['debug']     = false;
['Turning']   = 90
  }
        if FuckedBruh == 1 then
              for i = 4,7 do -- loop lol
    setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
    setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y'))
         end
              for i = 0,7 do -- loop lol
    setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
         end
           FuckedBruh = 0
     end
        if not downscroll or BruhDown == 1 then
        setProperty('scoreTxt.y', 660)
            for i = 0,1 do  
                setPropertyFromGroup('playerStrums', i, 'y', 64)
                setPropertyFromGroup('playerStrums',i,'downScroll', false) 
                setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
            end
            for o = 2,3 do  
                setPropertyFromGroup('playerStrums', o, 'y', 577)
                setPropertyFromGroup('playerStrums',o,'downScroll', true)
                setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
            end
        end
        if downscroll or BruhDown == 2 then
        setProperty('scoreTxt.y', 120)
        BruhDown = 1
            for i = 0,1 do  
                setPropertyFromGroup('playerStrums', i, 'y', 577)
                setPropertyFromGroup('playerStrums',i,'downScroll',  true) 
                setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
            end
            for o = 2,3 do  
                setPropertyFromGroup('playerStrums', o, 'y', 64)
                setPropertyFromGroup('playerStrums',o,'downScroll',  false)
                setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
            end
        end
    elseif curSelected == 'FuckedType' then
        typeS = false
        Opt = true
        Upt = false
        FuckedBruh = 1
        if SplitTypeH == 1 then
              for i = 4,7 do -- loop lol
    setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
    setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y') - 50)
         end
         SplitTypeH = 0
     end
if (not downscroll or BruhDown == 1) and not middlescroll then
  for i = 4,7 do -- loop lol
    setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'] + settings['Turning'])
      setPropertyFromGroup('strumLineNotes', i, 'y', (getPropertyFromGroup('strumLineNotes', i, 'y') + WoahNumbers[i]))
  end
-----------------------------------------------------------------{
   for i = 0,3 do
    setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
    setPropertyFromGroup('strumLineNotes', i, 'y', (getPropertyFromGroup('strumLineNotes', i, 'y') + WoahNumbers[i]))
   end
-----------------------------------------------------------------{
elseif middlescroll and (not downscroll or BruhDown == 1) then
  for i = 4,7 do 
      setPropertyFromGroup('strumLineNotes', i, 'direction', (getPropertyFromGroup('strumLineNotes', i, 'direction') + MiddleScrollConfig[i])) 
    setPropertyFromGroup('strumLineNotes', i, 'y', (getPropertyFromGroup('strumLineNotes', i, 'y') + WoahMiddleNumbers[i]))
  end
end

-----------------------------------------------------------------{BfsSide
if (downscroll or BruhDown == 2) and not middlescroll then
for i = 4,7 do -- loop lol
  setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
  setPropertyFromGroup('strumLineNotes', i, 'y', (getPropertyFromGroup('strumLineNotes', i, 'y') - WoahNumbers[i]))
end
-----------------------------------------------------------------{DadsSide
for i = 0,3 do
  setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'] + settings['Turning'])
  setPropertyFromGroup('strumLineNotes', i, 'y', (getPropertyFromGroup('strumLineNotes', i, 'y') - WoahNumbers[i]))
 end
 -----------------------------------------------------------------{
elseif middlescroll and (downscroll or BruhDown == 2) then
  for i = 4,7 do 
    setPropertyFromGroup('strumLineNotes', i, 'direction', (getPropertyFromGroup('strumLineNotes', i, 'direction') - MiddleScrollConfig[i])) 
    setPropertyFromGroup('strumLineNotes', i, 'y', (getPropertyFromGroup('strumLineNotes', i, 'y') - WoahMiddleNumbers[i]))
    end
    elseif curSelected == 'UpType' or curSelected == 'DownType' or curSelected == 'FuckedType' or curSelected == 'SplitType' then
       setProperty('Under.alpha', 1)
    end
    elseif curSelected == 'LQ' then
        if lowQuality == true then
           runTimer('NoQuality', 1)
           objectPlayAnimation('BoxThing8', 'deny')
        end
        if lowQuality == false then
           runTimer('Quality', 1)
           objectPlayAnimation('BoxThing8', 'confirm')
        end
    elseif curSelected == 'ATA' then
        if getPropertyFromClass('ClientPrefs', 'globalAntialiasing') == true then
           runTimer('Noantialiasing', 1)
           objectPlayAnimation('BoxThing7', 'deny')
        end
        if getPropertyFromClass('ClientPrefs', 'globalAntialiasing') == false then
           runTimer('antialiasing', 1)
           objectPlayAnimation('BoxThing7', 'confirm')
        end
   elseif curSelected == 'OST' then
       if OstMode == false then
           runTimer('TrueChange', 0.5)
       end
       if OstMode == true then
           runTimer('FalseChange', 0.5)
       end
   elseif curSelected == 'HON' then
       if HidedArrows == true then
           runTimer('HideThen', 1)
           objectPlayAnimation('BoxThing6', 'deny')
       end
       if HidedArrows == false then
           runTimer('AppearThen', 1)
           objectPlayAnimation('BoxThing6', 'confirm')
       end
end
		runTimer('flashing', 0.3, 6)
		-- doTweenAlpha('blackalpha', 'black', 0, 0.5, 'linear')
    end
  if curStep >= 0 and botPlay == true then

    songPos = getSongPosition()

    local currentBeat = (songPos/1000)*(bpm/60)

    doTweenAlpha('BotTweenY', 'BotplayThing', 1-1*math.sin((currentBeat*0.5)*math.pi),0.001)
     end
     if fakepractice == true and getProperty('health') <= 0.01 then
         setProperty('health', 0.02)
     elseif fakepractice == false then
     end
    if ghosttapping then
        Ghost = true
    end
    if not ghosttapping then
        Ghost= false
    end
    if getPropertyFromClass('ClientPrefs', 'middleScroll') and MD == true then
        Mid = true
    end
    if not getPropertyFromClass('ClientPrefs', 'middleScroll') and MD == true then
        Mid = false
    end
    if curSelected == 'UpType' then
        runTimer('Type', 0.3)
        setProperty('Under.alpha', 1)
        setProperty('left.alpha', 0)
        setProperty('right.alpha', 1)
        setProperty('UpS.alpha', 1)
        setProperty('DownS.alpha', 0)
        setProperty('SplitS.alpha', 0)
        setProperty('FuckedS.alpha', 0)
        doTweenX('RightT', 'right', 840, 0.3, 'bounce')
   end
    if curSelected == 'DownType' then
        runTimer('Type', 0.3)
        setProperty('Under.alpha', 1)
        setProperty('left.alpha', 1)
        setProperty('right.alpha', 1)
        setProperty('UpS.alpha', 0)
        setProperty('DownS.alpha', 1)
        setProperty('SplitS.alpha', 0)
        setProperty('FuckedS.alpha', 0)
        doTweenX('RightT', 'right', 920, 0.3, 'bounce')
   end
    if curSelected == 'SplitType' then
        runTimer('Type', 0.3)
        setProperty('Under.alpha', 1)
        setProperty('left.alpha', 1)
        setProperty('right.alpha', 1)
        setProperty('UpS.alpha', 0)
        setProperty('DownS.alpha', 0)
        setProperty('SplitS.alpha', 1)
        setProperty('FuckedS.alpha', 0)
    end
    if curSelected == 'FuckedType' then
        runTimer('Type', 0.3)
        setProperty('Under.alpha', 1)
        setProperty('left.alpha', 1)
        setProperty('right.alpha', 0)
        setProperty('UpS.alpha', 0)
        setProperty('DownS.alpha', 0)
        setProperty('SplitS.alpha', 0)
        setProperty('FuckedS.alpha', 1)
   end
    if DeathThingStop == true then        
        setPropertyFromClass("Conductor", "songPosition", DeathSongPos)
    end
    if getProperty('health') <= 0.0001 then
       DeathSongPos = getPropertyFromClass("Conductor", "songPosition")
    end
if Ded == 1 then
				isDed = true
				setPropertyFromClass("ClientPrefs", "noReset", true)
				setPropertyFromClass("flixel.FlxG", "sound.music.volume", 0)
				setProperty("vocals.volume", 0)
				currentpausepos = getPropertyFromClass("Conductor", "songPosition")
				bfPause = getProperty("boyfriend.animation.curAnim.paused")
				dadPause = getProperty("dad.animation.curAnim.paused")
				bf2Pause = getProperty("boyfriend2.animation.curAnim.paused")
				dad2Pause = getProperty("dad2.animation.curAnim.paused")
				gfPause = getProperty("gf.animation.curAnim.paused")
				curDadHeyTimer = getProperty("dad.heyTimer")
				curGfHeyTimer = getProperty("gf.heyTimer")
				curBfHeyTimer = getProperty("boyfriend.heyTimer")
				curDadHeyTimer = getProperty("dad.heyTimer")
				curGfHeyTimer = getProperty("gf.heyTimer")
				Ded = 2
				runTimer('SoundDeath', 0.8)
end
	if Ded == 2 then 
		setPropertyFromClass("Conductor", "songPosition", currentpausepos)
		setPropertyFromClass("flixel.FlxG", "sound.music.time", currentpausepos)
		setProperty("vocals.time", currentpausepos)
		setProperty("boyfriend.animation.curAnim.paused", true)
		setProperty("dad.animation.curAnim.paused", true)
		setProperty("boyfriend2.animation.curAnim.paused", true)
		setProperty("dad2.animation.curAnim.paused", true)
		setProperty("gf.animation.curAnim.paused", true)

		setProperty("boyfriend.heyTimer", curBfHeyTimer)
		setProperty("dad.heyTimer", curDadHeyTimer)
		setProperty("gf.heyTimer", curGfHeyTimer)
	
		if getProperty("boyfriend.animation.curAnim.name") ~= "idle" then
			setProperty("boyfriend.specialAnim", true)
		end
		if getProperty("dad.animation.curAnim.name") ~= "idle" then
			setProperty("dad.specialAnim", true)
		end
		if getProperty("gf.animation.curAnim.name") ~= "idle" and getProperty("gf.animation.curAnim.name") ~= "danceIdle" then
			setProperty("gf.specialAnim", true)
		end
    end
   if canGoAppear == true then
      HidedArrows = true
   end
   if canGoAppear == false then
      HidedArrows = false
   end
   if HidedArrows == false and paused == false and resumed == true then
            for o = 0, 7 do
                setPropertyFromGroup('opponentStrums', o, 'alpha', 1)
                doTweenAlpha('arrows', o, 1, 0.3, 'linear')
            end      
          for i = 0, 3 do
            setProperty('notes.visible', true)
          end
           for i = 4, 7 do
            setProperty('notes.visible', true)
          end
            objectPlayAnimation('BoxThing6', 'deny')
   end
   if HidedArrows == true and paused == false and resumed == true then
            for o = 0, 7 do
                setPropertyFromGroup('opponentStrums', o, 'alpha', 0)
                doTweenAlpha('arrows', o, 0, 0.3, 'linear')
            end      
           for i = 0, 3 do
            setProperty('notes.visible',false)
          end
           for i = 4, 7 do
            setProperty('notes.visible', true)
          end
            objectPlayAnimation('BoxThing6', 'confirm')
   end
end

function onSongStart()
	startedCountdown = true
	canPause = true
    Page2 = false
    resumed = true
end

function onPause()
    if CustomPause == true then
    AndroidPause = true
    PlayThing = true
    resume = false
	return Function_Stop
	end
end


function onGameOver()
     if RandomDeathMessages == true and DeathThingStop == false then
		Ded = 1
		setSoundVolume('deathLOL', 19)
	    DeathThingStop = true
     end
     if GoBackAgain == true then
         return Function_Continue
     end
     if RandomDeathMessages == false then
        return Function_Continue;
     end
        return Function_Stop;
end

function onSoundFinished(tag)
	if tag == 'deathLOL' then
        soundFadeOut('deathLOL', 0.3, 0)
        runTimer('FinallyDeath', 0.1)
	end
end

function onEndSong()
	canPause = false
    if OstMode == true and startedOST == true then
        setPropertyFromClass("Conductor", "songPosition", 0)
        startedOST = false
        return Function_Stop
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'flashing' then
	runTimer('flashingV1', 0.1)
	runTimer('flashingV2', 0.2)
	if loopsLeft == 0 then
	runTimer('nomoregaming', 0.1, 1)
	end
	end
	if tag == 'flashingV1' then
       setProperty('Under.alpha', 1)
	if curSelected == 'restart' then
	setProperty('Restarts.alpha', 1)
	elseif curSelected == 'exit' then
	setProperty('Exits.alpha', 1)
	elseif curSelected == 'resume' then
	setProperty('Resumes.alpha', 1)
    elseif curSelected == 'updates' then
	setProperty('Updates.alpha', 1)
    elseif curSelected == 'options' then
	setProperty('options.alpha', 1)
    doTweenX('NS1', 'splash', 200, 0.5, 'SineIn')
    doTweenX('IMT1', 'IMT', 200, 0.5, 'SineIn')
    doTweenX('Gh1', 'Ghost', 220, 0.5, 'SineIn')
    doTweenX('MD1', 'MidS', 220, 0.5, 'SineIn')
    doTweenX('ST1', 'ScrollT', 200, 0.5, 'SineIn')
    doTweenX('FPC1', 'fpsC', 190, 0.5, 'SineIn')
    doTweenX('LQ1', 'LQ', 1300, 0.5, 'SineIn')
    doTweenX('Hom1', 'HON', 1300, 0.5, 'SineIn')
    doTweenX('At1', 'ATA', 1320, 0.5, 'SineIn')
    doTweenX('Ost1', 'Ost', 1320, 0.5, 'SineIn')
    doTweenX('Page2', 'Page2', 880, 0.5, 'linear')
    doTweenX('Page1', 'Page1', 1300, 0.5, 'linear')
    elseif curSelected == 'botplay' then
	setProperty('Botplayy.alpha', 1)
	canControl = true
	elseif curSelected == 'back' then
    setProperty('back.alpha', 1)
    canControl = true
    Page2 = false 
    elseif curSelected == 'splash' then
    setProperty('splash.alpha', 1)
    elseif curSelected == 'IMT' then
    setProperty('IMT.alpha', 1)
    elseif curSelected == 'Ghost' then
    setProperty('Ghost.alpha', 1)
    elseif curSelected == 'MidS' then
    setProperty('MidS.alpha', 1)
    elseif curSelected == 'ScrollT' then
    setProperty('ScrollT.alpha', 1)
    elseif curSelected == 'fpsC' then
    setProperty('fpsC.alpha', 1)
    elseif curSelected == 'Page1' and Page2 == false then
    doTweenX('NS1', 'splash', -500, 0.5, 'SineIn')
    doTweenX('IMT1', 'IMT', -500, 0.5, 'SineIn')
    doTweenX('Gh1', 'Ghost', -500, 0.5, 'SineIn')
    doTweenX('MD1', 'MidS', -500, 0.5, 'SineIn')
    doTweenX('ST1', 'ScrollT', -500, 0.5, 'SineIn')
    doTweenX('FPC1', 'fpsC', -500, 0.5, 'SineIn')
    doTweenAlpha('FBox', 'BoxThing', 0, 0.5, 'linear')
    doTweenAlpha('SBox', 'BoxThing2', 0, 0.5, 'linear')
    doTweenAlpha('TBox', 'BoxThing3', 0, 0.5, 'linear')
    doTweenAlpha('QBox', 'BoxThing4', 0, 0.5, 'linear')
    doTweenAlpha('QQBox', 'BoxThing5', 0, 0.5, 'linear')
    doTweenX('Page2', 'Page2', 1300, 0.5, 'linear')
    doTweenX('Page1', 'Page1', 880, 0.5, 'linear')
    runTimer('Page2', 0.4)
    doTweenX('LQ1', 'LQ', 245, 0.5, 'SineIn')
    doTweenX('Hom1', 'HON', 270, 0.5, 'SineIn')
    doTweenX('At1', 'ATA', 230, 0.5, 'SineIn')
    doTweenX('Ost1', 'Ost', 220, 0.5, 'SineIn')
    doTweenAlpha('LBox', 'BoxThing6', 1, 0.5, 'linear')
    doTweenAlpha('ABox', 'BoxThing7', 1, 0.5, 'linear')
    doTweenAlpha('HoBox', 'BoxThing8', 1, 0.5, 'linear')
    elseif curSelected == 'Page1' and Page2 == true then
    doTweenX('NS1', 'splash', 200, 0.5, 'SineIn')
    doTweenX('IMT1', 'IMT', 200, 0.5, 'SineIn')
    doTweenX('Gh1', 'Ghost', 220, 0.5, 'SineIn')
    doTweenX('MD1', 'MidS', 220, 0.5, 'SineIn')
    doTweenX('ST1', 'ScrollT', 200, 0.5, 'SineIn')
    doTweenX('FPC1', 'fpsC', 190, 0.5, 'SineIn')
    doTweenAlpha('FBox', 'BoxThing', 1, 0.5, 'linear')
    doTweenAlpha('SBox', 'BoxThing2', 1, 0.5, 'linear')
    doTweenAlpha('TBox', 'BoxThing3', 1, 0.5, 'linear')
    doTweenAlpha('QBox', 'BoxThing4', 1, 0.5, 'linear')
    doTweenAlpha('QQBox', 'BoxThing5', 1, 0.5, 'linear')
    doTweenAlpha('LBox', 'BoxThing6', 0, 0.5, 'linear')
    doTweenAlpha('ABox', 'BoxThing7', 0, 0.5, 'linear')
    doTweenAlpha('HoBox', 'BoxThing8', 0, 0.5, 'linear')
    doTweenX('LQ1', 'LQ', 1300, 0.5, 'SineIn')
    doTweenX('Hom1', 'HON', 1300, 0.5, 'SineIn')
    doTweenX('At1', 'ATA', 1320, 0.5, 'SineIn')
    doTweenX('Ost1', 'Ost', 1320, 0.5, 'SineIn')
    doTweenX('Page2', 'Page2', 880, 0.5, 'linear')
    doTweenX('Page1', 'Page1', 1300, 0.5, 'linear')
    runTimer('NotPage2', 1)    
    elseif curSelected == 'LQ' then
    setProperty('Under.alpha', 1)
	end
	end
	if tag == 'flashingV2' then
        setProperty('Under.alpha', 0)
	if curSelected == 'restart' then
	setProperty('Restarts.alpha', 0)
	elseif curSelected == 'exit' then
	setProperty('Exits.alpha', 0)
	elseif curSelected == 'resume' then
	setProperty('Resumes.alpha', 0)
    elseif curSelected == 'updates' then
	setProperty('Updates.alpha', 1)
	setProperty('Under.alpha', 1)
    elseif curSelected == 'options' then
    setProperty('options.alpha', 0)
    Back = true
    elseif curSelected == 'botplay' then
	setProperty('Botplayy.alpha', 1)
	setProperty('Under.alpha', 1)
	elseif curSelected == 'back' and Upt == false then
    setProperty('back.alpha', 0)
    setProperty('Under.alpha', 1)
    elseif curSelected == 'back' and Upt == true then
    setProperty('back.alpha', 1)
    setProperty('Under.alpha', 1)
    elseif curSelected == 'splash' then
    setProperty('splash.alpha', 1)
    setProperty('Under.alpha', 1)
    elseif curSelected == 'IMT' then
    setProperty('IMT.alpha', 1)
    setProperty('Under.alpha', 1)
    elseif curSelected == 'Ghost' then
    setProperty('Ghost.alpha', 1)
    setProperty('Under.alpha', 1)
    elseif curSelected == 'MidS' then
    setProperty('MidS.alpha', 1)
    setProperty('Under.alpha', 1)
    elseif curSelected == 'ScrollT' then
    setProperty('ScrollT.alpha', 1)
    setProperty('Under.alpha', 1)
    elseif curSelected == 'fpsC' then
    setProperty('fpsC.alpha', 1)
    setProperty('Under.alpha', 1)
    elseif curSelected == 'Page1' then
    setProperty('Under.alpha', 1)
    elseif curSelected == 'LQ' then
    setProperty('Under.alpha', 1)
    elseif curSelected == 'ATA' then
    setProperty('Under.alpha', 1)
    elseif curSelected == 'OST' then
    setProperty('Under.alpha', 1)
    elseif curSelected == 'HON' then
    setProperty('Under.alpha', 1)
	end
	end
	if tag == 'notransition' then
	intransition = false
	end
	if tag == 'animationmoment' then
	canControl = true
	end
	if tag == 'nomoregaming' and curSelected == 'restart' or curSelected == 'exit' and Idk == true then
		setProperty('pointer.alpha', 0)
		PlayThing = false
        canPause = true
        removeLuaText('songName')
        setProperty("fill.alpha", 0)
        doTweenAlpha('ShadowA', 'Shadow', 0, 0.3, 'linear')
		setProperty('inCutscene', false)
		setProperty('Resumes.alpha', 0)
		setProperty('ConfirmPls.alpha', 0)
		setProperty('Resumes.alpha', 0)
		setProperty('Tickets.alpha', 0)
		setProperty('ScoreTickets.alpha', 0)
        setProperty('Exits.alpha', 0)
        setProperty('On.alpha', 0)
        setProperty('Off.alpha', 0)
    setProperty('iconP2.alpha', 0)
    setProperty('iconP1.alpha', 0)
        setProperty('Restarts.alpha', 0)
        setProperty('Botplayy.alpha', 0)
        setProperty('Updates.alpha', 0)
        setProperty('options.alpha', 0)
        setProperty('Under.alpha', 0)
        setProperty('botplayTxt.alpha', 1)
	end
    if tag == 'nomoregaming' and curSelected == 'botplay' then
       canChange = true
        if not botPlay then
           setProperty('cpuControlled', true)
           TheBot = true
           setProperty('Under.alpha', 1)
           setProperty('Botplayy.alpha', 1)
        elseif botPlay then
            setProperty('cpuControlled', false)
            PlayThing = true
            TheBot = false
            setProperty('Under.alpha', 1)
           setProperty('BotplayThing.alpha', 0)
        end
    end
    if tag == 'nomoregaming' and curSelected == 'ScrollT' then
        typeS = true
        Opt = false
        Upt = true
        runTimer('TypeX', 0.3)
        setProperty('Under.alpha', 1)
        doTweenAlpha('SUP', 'UpS', 1, 0.2, 'linear')
    end
    if tag == 'nomoregaming' and curSelected == 'Page1' then
        setProperty('Under.alpha', 1)
    end
    if tag == 'nomoregaming' and curSelected == 'UpType' or curSelected == 'DownType' or curSelected == 'FuckedType' or curSelected == 'SplitType' then
        setProperty('FuckedS.alpha', 0)
        setProperty('SplitS.alpha', 0)
        setProperty('UpS.alpha', 0)
        setProperty('DownS.alpha', 0)
        setProperty('left.alpha', 0)
        setProperty('right.alpha', 0)
    end
    if tag == 'nomoregaming' and curSelected == 'back' then
        setProperty('Resumes.alpha', 1)
        Page2 = false
		setProperty('Tickets.alpha', 1)
		setProperty('ScoreTickets.alpha', 1)
        setProperty('Exits.alpha', 1)
        setProperty('Restarts.alpha', 1)
        setProperty('Botplayy.alpha', 1)
        setProperty('Updates.alpha', 1)
        setProperty('options.alpha', 1)
        setProperty('Under.alpha', 1)
        setProperty('back.alpha', 0)
        setProperty('splash.alpha', 0)
        setProperty('BoxThing.alpha', 0)
        setProperty('BoxThing2.alpha', 0)
        setProperty('BoxThing3.alpha', 0)
        setProperty('BoxThing4.alpha', 0)
        setProperty('BoxThing5.alpha', 0)
        setProperty('BoxThing6.alpha', 0)
        setProperty('BoxThing7.alpha', 0)
        setProperty('BoxThing8.alpha', 0)
        setProperty('left.alpha', 0)
        setProperty('right.alpha', 0)
        setProperty('IMT.alpha', 0)
        setProperty('fpsC.alpha', 0)
        setProperty('MidS.alpha', 0)
        setProperty('ScrollT.alpha', 0)
        setProperty('Ghost.alpha', 0)
        setProperty('FuckedS.alpha', 0)
        setProperty('SplitS.alpha', 0)
        setProperty('UpS.alpha', 0)
        setProperty('DownS.alpha', 0)
        setProperty('Page1.alpha', 0)
        setProperty('Page2.alpha', 0)
        setProperty('HON.alpha', 0)
        setProperty('ATA.alpha', 0)
        setProperty('LQ.alpha', 0)
        setProperty('Ost.alpha', 0)
        runTimer('Rs2', 0.01)
        runTimer('Rs', 0.1)
       Upt = false
       Opt = true
       Back = false
    end 
    if tag == 'nomoregaming' and curSelected == 'updates' then
        Upt = true
        curSelected = 'back'
        setProperty('Resumes.alpha', 0)
		setProperty('Tickets.alpha', 0)
		setProperty('ScoreTickets.alpha', 0)
        setProperty('Exits.alpha', 0)
        setProperty('Restarts.alpha', 0)
        setProperty('Botplayy.alpha', 0)
        setProperty('Updates.alpha', 0)
        setProperty('options.alpha', 0)
        setProperty('Under.alpha', 1)
        setProperty('back.alpha', 1)
       doTweenAlpha('ShadowB', 'Shadow', 1, 0.3, 'linear')
       runTimer('Thing', 0.2)
       runTimer('Bruh', 0.3)
        Opt = true
        Back = true
    end
    if tag == 'nomoregaming' and curSelected == 'options' then
        setProperty('Resumes.alpha', 0)
		setProperty('Tickets.alpha', 0)
		setProperty('ScoreTickets.alpha', 0)
        setProperty('Exits.alpha', 0)
        setProperty('Restarts.alpha', 0)
        setProperty('Botplayy.alpha', 0)
        setProperty('Updates.alpha', 0)
        setProperty('options.alpha', 0)
        setProperty('Under.alpha', 0)
        setProperty('back.alpha', 1)
        setProperty('splash.alpha', 1)
        setProperty('BoxThing.alpha', 1)
        setProperty('BoxThing2.alpha', 1)
        setProperty('BoxThing3.alpha', 1)
        setProperty('BoxThing4.alpha', 1)
        setProperty('BoxThing5.alpha', 1)
        setProperty('IMT.alpha', 1)
        setProperty('fpsC.alpha', 1)
        setProperty('MidS.alpha', 1)
        setProperty('ScrollT.alpha', 1)
        setProperty('Ghost.alpha', 1)
        setProperty('Page2.alpha', 1)
        setProperty('Page1.alpha', 1)
        setProperty('ATA.alpha', 1)
        setProperty('HON.alpha', 1)
        setProperty('Ost.alpha', 1)
        setProperty('LQ.alpha', 1)
       doTweenAlpha('ShadowA', 'Shadow', 1, 0.3, 'linear')
       runTimer('Thing', 0.2)
       Opt = true
       Upt = false
       Back = true
    end
    if PlayThing == false then
           setProperty('BotplayThing.alpha', 1)
           
    elseif PlayThing == true then
           setProperty('BotplayThing.alpha', 0)
    end
	if tag == 'nomoregaming' and curSelected == 'resume' then
       if TheBot == true then
           PlayThing = false
        end
         if MidEnd == true then
             restartSong()
        end
   stop = true
   con = true
        removeLuaText('songName')
        canPause = true
   setProperty("fill.alpha", 0)
   setProperty('inCutscene', false)
   setProperty('BT.visible', true)
    setProperty('BT2.visible', true)
setProperty('NB.visible', true)
setProperty('NBCopy.visible', true)
setProperty('NBCopyy.visible', true)
setProperty('NBCopyyy.visible', true)
    setProperty('iconP2.alpha', 1)
    setProperty('iconP1.alpha', 1)
    setProperty('botplayTxt.alpha', 0)
	setProperty('scoreTxt.visible', true)
    setProperty('Off.alpha', 0)
    setProperty('On.alpha', 0)
			setProperty("boyfriend.animation.curAnim.paused", bfPause)
			setProperty("dad.animation.curAnim.paused", dadPause)
			setProperty("boyfriend2.animation.curAnim.paused", bf2Pause)
			setProperty("dad2.animation.curAnim.paused", dad2Pause)
			setProperty("gf.animation.curAnim.paused", gfPause)
			setProperty('1.alpha', 0)
            setProperty('2.alpha', 0)
            setProperty('3.alpha', 0)
            setProperty('4.alpha', 0)
			setPropertyFromClass("ClientPrefs", "noReset", defNoReset)
			setPropertyFromClass("flixel.FlxG", "sound.music.volume", 1)
			setProperty("vocals.volume", 1)
			paused = false
        canChange = false
        canControl = false
          setProperty('Resumes.alpha', 0)
		setProperty('Tickets.alpha', 0)
		setProperty('ScoreTickets.alpha', 0)
        setProperty('Exits.alpha', 0)
    setProperty('iconP2.alpha', 1)
    setProperty('iconP1.alpha', 1)
    setProperty('ConfirmPls.alpha', 0)
        setProperty('Restarts.alpha', 0)
        setProperty('Botplayy.alpha', 0)
        setProperty('Updates.alpha', 0)
        setProperty('options.alpha', 0)
        setProperty('Under.alpha', 0)
    doTweenAlpha('ShadowA', 'Shadow', 0, 0.3, 'linear')
	elseif tag == 'nomoregaming' then
	doTweenAlpha('blackalphaupend', 'black', 1, 1, 'linear')
	elseif tag == 'nomoregaming' and curSelected == 'restart' then
    elseif tag == 'nomoregaming' and curSelected == 'IMT' then
     setProperty('Under.alpha', 1)
    end
    if tag == 'Thing' then
        curSelected = 'back'
        canChange = true
        setProperty('Under.alpha', 1)
    end
    if tag == 'Rs' then
        curSelected = 'resume'
     end
    if tag == 'Rs2' then
        setProperty('back.alpha', 0)
        setProperty('Resumes.alpha', 1)
     end
     if tag == 'nopa' then
        setProperty('practiceMode', true)
     end
     if tag == 'Type' then
        curSelected = 'back'
        setProperty('Under.alpha', 1)
     end
     if tag == 'TypeX' then
        curSelected = 'UpType'
        setProperty('Under.alpha', 1)
     end
     if tag == 'Down' then
        DownScrollThing = true
     end
     if tag == 'NotDown' then
        DownScrollThing = false
      end
     if tag == 'AIntransition' then
       AIntransition = false
    end
     if tag == 'Page2' then
        Page2 = true
     end
     if tag == 'NotPage2' then
       Page2 = false
     end
     if tag == 'Quality' then
        setPropertyFromClass('ClientPrefs', 'lowQuality', true)
        lowQuality = true
     end
     if tag == 'NoQuality' then
           setPropertyFromClass('ClientPrefs', 'lowQuality', false)
       lowQuality = false
     end
     if tag == 'antialiasing' then
        setPropertyFromClass('ClientPrefs', 'globalAntialiasing', true)
     end
     if tag == 'Noantialiasing' then
           setPropertyFromClass('ClientPrefs', 'globalAntialiasing', false)
     end
     if tag == 'TrueChange' then
         OstMode = true
     end
     if tag == 'FalseChange' then
         OstMode = false
     end
     if tag == 'SoundDeath' then
        doTweenAlpha('Blackdo', 'blackThing', 1, 3.5, 'linear')
		setObjectOrder('boyfriend',getObjectOrder('blackThing')+1)
		doTweenAlpha('and', 'androidc', 0, 3.5, 'linear')
		doTweenAlpha('and2', 'androidControls', 0, 3.5, 'linear')
        math.randomseed(os.time())
        Sound = string.format(getRandomInt(1, 11));
		playSound('Deaths/'..Sound, 1, 'deathLOL')
	end
    if tag == 'FinallyDeath' then
         GoBackAgain = true
    end
    if tag == 'HideThen' then
            for o = 0, 7 do
                setPropertyFromGroup('opponentStrums', o, 'alpha', 0)
            end
         canGoAppear = false
    end
    if tag == 'AppearThen' then
        canGoAppear = true
    end
   if tag == 'byeFps' then
       setPropertyFromClass("Main", "fpsVar.visible", false)
    end
   if tag == 'hiFps' then
       setPropertyFromClass("Main", "fpsVar.visible", true)
   end
end

function onDestroy()
	setPropertyFromClass("ClientPrefs", "noReset", defNoReset)
end

function onTweenCompleted(tag)
 -- if tag == 'songBARTween' then
 -- runTimer('wait', 2);
 -- end
	if tag == 'TicketsY' then
	setProperty('Resumes.alpha', 1)
	setProperty('Restarte.alpha', 1)
	setProperty('Exits.alpha', 1)
	setProperty('Botplayy.alpha', 1)
	setProperty('options.alpha', 1)
	setProperty('Updates.alpha', 1)
	end
    if tag == 'ShadowB' then
       doTweenAlpha('Update', 'UpdateV1', 1, 0.3, 'linear')
    end
	if tag == 'blackalphaupend' and curSelected == 'restart' then
	restartSong(false)
	elseif tag == 'blackalphaupend' and curSelected == 'exit' then
	endSong()
	end
end