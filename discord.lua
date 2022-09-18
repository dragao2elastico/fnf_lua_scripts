local truething = false
local time = true
local pause = ""
local weekname = ""
local playing = "Playing: "
local savePos = 0
function onSongStart()
	offset = getPropertyFromClass('ClientPrefs', 'noteOffset')
	truething = true
end
function onEndSong()
	truething = false
	time = ""
end
------------------- discord turned on pop up
function onCountdownTick(counter)
	if counter == 1 then
		if downscroll then
			doTweenY('thanksin', 'thanks', -25, 0.7, 'CubeOut')
		else
			doTweenY('thanksin', 'thanks', 585, 0.5, 'CubeOut')
		end
		if getProperty('camHUD.visible') == false or getProperty('camHUD.alpha') < 0.3 then
			setObjectCamera('thanks', 'camOther')
		end
		runTimer('getout', 2)
	end
end
function onTimerCompleted(tag)
	if tag == 'getout' then
		if downscroll then
			doTweenY('thanksout', 'thanks', -150, 0.7, 'CubeIn')
		else
			doTweenY('thanksout', 'thanks', 700, 0.7, 'CubeIn')
		end
	end
end
function onTweenCompleted()
	if tag == 'thanksout' then
		removeLuaSprite('thanks')
	end
end
function onCreate()
	if downscroll then
		makeAnimatedLuaSprite('thanks', 'downscroll', 970, -150)
	else
		makeAnimatedLuaSprite('thanks', 'upscroll', 970, 700)
	end
	addAnimationByPrefix('thanks', 'idle', 'idle', 12, true)
	objectPlayAnimation('thanks', 'idle')
	setObjectCamera('thanks', 'camHUD')
	scaleObject('thanks', 0.15, 0.15)
	addLuaSprite('thanks')
-------------------
	if getPropertyFromClass('PlayState', 'deathCounter') < 1 then
		bbdisplay = ""
	else
		bbdisplay = "Blueballed: " .. getPropertyFromClass('PlayState', 'deathCounter')
	end
	if isStoryMode then
		mode = "Story Mode"
		weekname = ': ' .. week
	else
		mode = "Freeplay"
		weekname = ""
	end
	difficultything = getProperty('storyDifficultyText')
end
function onUpdatePost(elapsed)
	songPos = getPropertyFromClass('Conductor', 'songPosition');
	if savePos < songPos - 100 then
		onResume()					-- this thing fixes custom menu that done in .lua, if 80ms elapsed during pause game will count it as resume
	end

	if truething then
		time = songLength - songPos - offset -- literally from source code
	else
		time = false
	end

	changePresence(pause .. playing .. songName .. ' - ' .. difficultything .. ' (' .. mode .. weekname ..') '  .. bbdisplay, getTextString('scoreTxt'), '', truething, time) -- can't fix icons because even psych engine can't use them properly 
end
function onGameOver()
	playing = "Game Over: "
	pause = ""
	truething = false
	weekname = ""
	savePos = songPos
	difficultything = getProperty('storyDifficultyText')
	bbdisplay = "Blueballed: " .. getPropertyFromClass('PlayState', 'deathCounter') + 1
end
function onPause()
	pause = "(Paused) "
	truething = false
	savePos = songPos
end
function onResume()
	pause = ""
	if curStep > 0 then
		truething = true
	end
end

