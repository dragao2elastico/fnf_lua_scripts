--[[
                                  Welcome to Emergency Actions Script!
                              This script will help you when your in pickle!
          Can't die, song won't start or end? AND YOU CAN'T PAUSE... or enter debug menus?
                              Emergency Actions will allow to manually...
  start countdown, restart, end and exit PlayState (as in be kicked to the story or freeplay mean)!
]]--

local dieButton
local yShit = {}
function onCreatePost()
	if downscroll then
		yShit = {0, 15, 70, 85}
	else
		yShit = {screenHeight - 60, screenHeight - 45, screenHeight - 130, screenHeight - 115}
	end

	dieButton = getPropertyFromClass('ClientPrefs', 'noReset')

	makeLuaSprite('selection', '', 0, yShit[1])
	makeGraphic('selection', screenWidth - (50 * 20), 60, 'aaaaaa')
	addLuaSprite('selection', true)
	setProperty('selection.alpha', 0.5)
	setObjectCamera('selection', 'other')
	makeLuaText('selectionTxt', 'Emergency Actions', 0, 0, yShit[2])
	addLuaText('selectionTxt')
	setTextSize('selectionTxt', 25)
	setObjectCamera('selectionTxt', 'other')
	setTextAlignment('selectionTxt', 'center')
	
	makeLuaSprite('leftArrow', '', 0, yShit[1])
	makeGraphic('leftArrow', 40, 60, 'aaaaaa')
	addLuaSprite('leftArrow', true)
	setProperty('leftArrow.alpha', 0.5)
	setObjectCamera('leftArrow', 'other')
	makeLuaText('leftArrowTxt', '<', 0, 0, yShit[2])
	addLuaText('leftArrowTxt')
	setTextSize('leftArrowTxt', 25)
	setObjectCamera('leftArrowTxt', 'other')
	
	makeLuaSprite('rightArrow', '', 0, yShit[1])
	makeGraphic('rightArrow', 40, 60, 'aaaaaa')
	addLuaSprite('rightArrow', true)
	setProperty('rightArrow.alpha', 0.5)
	setObjectCamera('rightArrow', 'other')
	makeLuaText('rightArrowTxt', '>', 0, 0, yShit[2])
	addLuaText('rightArrowTxt')
	setTextSize('rightArrowTxt', 25)
	setObjectCamera('rightArrowTxt', 'other')
	
	makeLuaSprite('confirm', '', 0, yShit[3])
	makeGraphic('confirm', screenWidth - (50 * 22), 60, '44ff44')
	addLuaSprite('confirm', true)
	setProperty('confirm.alpha', 0.5)
	setObjectCamera('confirm', 'other')
	makeLuaText('confirmTxt', 'Confirm', 0, 0, yShit[4])
	addLuaText('confirmTxt')
	setTextSize('confirmTxt', 25)
	setObjectCamera('confirmTxt', 'other')
	
	makeLuaSprite('decline', '', 0, yShit[3])
	makeGraphic('decline', screenWidth - (50 * 22), 60, 'ff4444')
	addLuaSprite('decline', true)
	setProperty('decline.alpha', 0.5)
	setObjectCamera('decline', 'other')
	makeLuaText('declineTxt', 'Decline', 0, 0, yShit[4])
	addLuaText('declineTxt')
	setTextSize('declineTxt', 25)
	setObjectCamera('declineTxt', 'other')

	screenCenter('selection', 'X')
	screenCenter('confirm', 'X')
	screenCenter('confirmTxt', 'X')
	screenCenter('decline', 'X')
	screenCenter('declineTxt', 'X')
	screenCenter('selectionTxt', 'X')
	screenCenter('leftArrowTxt', 'X')
	screenCenter('rightArrowTxt', 'X')

	setProperty('leftArrowTxt.x', getProperty('leftArrowTxt.x') - 180)
	setProperty('rightArrowTxt.x', getProperty('rightArrowTxt.x') + 180)
	setProperty('confirm.x', getProperty('confirm.x') - 100)
	setProperty('decline.x', getProperty('decline.x') + 100)
end

local function mouseOverlaps(spr, cam)
	
	local mx, my = getMouseX(cam or 'other'), getMouseY(cam or 'other')
	
	local x, y, w, h = getProperty(spr .. '.x'), getProperty(spr .. '.y'), getProperty(spr .. '.width'), getProperty(spr .. '.height')
	
	return mx >= x and mx <= x + w and my >= y and my <= y + h
end


local paused = false
local canSelect = true
local selected = 0
function onUpdate()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)
	setProperty('selection.width', screenWidth - (50 * 20))
	setProperty('leftArrow.x', getProperty('leftArrowTxt.x') - 10)
	setProperty('rightArrow.x', getProperty('rightArrowTxt.x') - 10)
	setProperty('confirmTxt.x', getProperty('confirm.x') + 35)
	setProperty('declineTxt.x', getProperty('decline.x') + 35)
	
	if canSelect == true and paused == false and (mouseClicked('left') and mouseOverlaps('selection', 'other')) then
		paused = true
	end
	if canSelect == true and paused == true and (mouseClicked('left') and mouseOverlaps('decline', 'other')) then
		paused = false
	end
	
	if mouseClicked('left') and canSelect == true then
		runTimer('cantSelect', 0.2)
	end
	
	if paused == false then
		setTextString('selectionTxt', 'Emergency Actions')
		currentpausepos = getPropertyFromClass('Conductor', 'songPosition')
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
		
		setPropertyFromClass('ClientPrefs', 'noReset', dieButton)
		
		setProperty('confirm.visible', false)
		setProperty('confirmTxt.visible', false)
		setProperty('decline.visible', false)
		setProperty('declineTxt.visible', false)
	end
	if paused == true then
		setProperty('vocals.volume', 0)
		if selected == 0 then -- countdown
			setTextString('selectionTxt', 'Start Countdown')
			if (mouseClicked('left') and mouseOverlaps('confirm', 'other')) then
				runTimer('countdown', 0.5)
			end
		elseif selected == 1 then -- restart
			setTextString('selectionTxt', 'Restart Song')
			if (mouseClicked('left') and mouseOverlaps('confirm', 'other')) then
				runTimer('restart', 0.5)
			end
		elseif selected == 3 then -- end
			setTextString('selectionTxt', 'End Song')
			if (mouseClicked('left') and mouseOverlaps('confirm', 'other')) then
				runTimer('end', 0.5)
			end
		elseif selected == 4 then -- exit
			setTextString('selectionTxt', 'Exit Song')
			if (mouseClicked('left') and mouseOverlaps('confirm', 'other')) then
				runTimer('exit', 0.5)
			end
		end

		if (mouseClicked('left') and mouseOverlaps('leftArrow', 'other')) then
            selected = selected - 1
        elseif (mouseClicked('left') and mouseOverlaps('rightArrow', 'other')) then
            selected = selected + 1
        end

		if selected <= -1 then
            selected = 4
        elseif selected >= 5 then
            selected = 0
        end

		setProperty('confirm.visible', true)
		setProperty('confirmTxt.visible', true)
		setProperty('decline.visible', true)
		setProperty('declineTxt.visible', true)

		setPropertyFromClass('ClientPrefs', 'noReset', true)
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		setProperty('vocals.volume', 0)
		bfPause = getProperty('boyfriend.animation.curAnim.paused')
		dadPause = getProperty('dad.animation.curAnim.paused')
		bf2Pause = getProperty('boyfriend2.animation.curAnim.paused')
		dad2Pause = getProperty('dad2.animation.curAnim.paused')
		gfPause = getProperty('gf.animation.curAnim.paused')
		curDadHeyTimer = getProperty('dad.heyTimer')
		curGfHeyTimer = getProperty('gf.heyTimer')
		curBfHeyTimer = getProperty('boyfriend.heyTimer')
		curDadHeyTimer = getProperty('dad.heyTimer')
		curGfHeyTimer = getProperty('gf.heyTimer')
		setPropertyFromClass('Conductor', 'songPosition', currentpausepos)
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', currentpausepos)
		setProperty('vocals.time', currentpausepos)

		setProperty('boyfriend.animation.curAnim.paused', true)
		setProperty('dad.animation.curAnim.paused', true)
		setProperty('boyfriend2.animation.curAnim.paused', true)
		setProperty('dad2.animation.curAnim.paused', true)
		setProperty('gf.animation.curAnim.paused', true)

		setProperty('boyfriend.heyTimer', curBfHeyTimer)
		setProperty('dad.heyTimer', curDadHeyTimer)
		setProperty('gf.heyTimer', curGfHeyTimer)

		if getProperty('boyfriend.animation.curAnim.name') ~= 'idle' then
			setProperty('boyfriend.specialAnim', true)
		end
		if getProperty('dad.animation.curAnim.name') ~= 'idle' then
			setProperty('dad.specialAnim', true)
		end
		if getProperty('gf.animation.curAnim.name') ~= 'idle' and getProperty('gf.animation.curAnim.name') ~= 'danceIdle' then
			setProperty('gf.specialAnim', true)
		end
	end
end

function onTimerCompleted(tag)
	if tag == 'canSelect' then
		canSelect = true
	end
	if tag == 'cantSelect' then
		canSelect = false
		runTimer('canSelect', 0.0001)
	end

	if tag == 'countdown' then
		startCountdown()
		runTimer('idk', 0.1)
	end
	if tag == 'restart' then
		restartSong(false)
		runTimer('idk', 0.1)
	end
	if tag == 'end' then
		endSong()
		runTimer('idk', 0.1)
	end
	if tag == 'exit' then
		exitSong(false)
		runTimer('idk', 0.1)
	end
	
	if tag == 'idk' then
		paused = false
		setPropertyFromClass('ClientPrefs', 'noReset', dieButton)
	end
end

function onEndSong()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)
	return Function_Continue
end

function onGameOver()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)
	return Function_Continue
end

function onPause()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)
	return Function_Continue
end

function onResume()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)
end