-- Use TAB to toggle Debug Camera Mode
-- Use Numpad Arrows (2, 4, 6, 8) to move Camera
-- Use Numpad 7 and 9 to change angle of Camera
-- Use PageUp and PageDown to change zoom
-- Press Numpad 5 to reset Angle and Zoom of camera

-- Good luck with using

local debugCamera = false
local defaultCam = 1
local numX = 0
local numY = 0
local numZ = 1
local numA = 0
local moveX = 50
local moveY = 50
local moveZ = 0.05
local moveA = 1

function onCreate()
	makeLuaText('cameraX', 'Camera X:' .. numX, 248, -0, 150)
	setTextAlignment('cameraX', 'left')
	makeLuaText('cameraY', 'Camera Y:' .. numY, 248, -0, 165)
	setTextAlignment('cameraY', 'left')
	makeLuaText('cameraZ', 'Camera Zoom:' .. numZ, 248, -0, 180)
	setTextAlignment('cameraZ', 'left')
	makeLuaText('cameraA', 'Camera Angle:' .. numA, 248, -0, 195)
	setTextAlignment('cameraA', 'left')
end

function onCreatePost()
	defaultCam = getProperty('defaultCamZoom')
end

function onUpdatePost(elapsed)
	if numZ < 0.05 then
		numZ = 0.05
	end
	if debugCamera then
		triggerEvent('Camera Follow Pos', numX, numY)
		setProperty('defaultCamZoom', numZ)
		setProperty('camGame.angle', numA)
		setTextString('cameraX', 'Camera X:' .. numX)
		setTextString('cameraY', 'Camera Y:' .. numY)
		setTextString('cameraZ', 'Camera Zoom:' .. numZ)
		setTextString('cameraA', 'Camera Angle:' .. numA)
		if numA <= -360 then
			numA = 0
		end
		if numA >= 360 then
			numA = 0
		end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') and not debugCamera then
		debugCamera = true
		addLuaText('cameraX', false)
		addLuaText('cameraY', false)
		addLuaText('cameraZ', false)
		addLuaText('cameraA', false)
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') and debugCamera then
		debugCamera = false
		triggerEvent('Camera Follow Pos')
		setProperty('camGame.angle', 0)
		setProperty('defaultCamZoom', defaultCam)
		removeLuaText('cameraX', false)
		removeLuaText('cameraY', false)
		removeLuaText('cameraZ', false)
		removeLuaText('cameraA', false)
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.pressed.NUMPADEIGHT') and debugCamera then --NUM8
		numY = numY - moveY
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.pressed.NUMPADSIX') and debugCamera then --NUM6
		numX = numX + moveX
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.pressed.NUMPADFOUR') and debugCamera then --NUM4
		numX = numX - moveX
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.pressed.NUMPADTWO') and debugCamera then --NUM2
		numY = numY + moveY
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.pressed.PAGEUP') and debugCamera then --NUM5
		numZ = numZ + moveZ
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.pressed.PAGEDOWN') and debugCamera then --NUM5
		numZ = numZ - moveZ
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.pressed.NUMPADSEVEN') and debugCamera then --NUM5
		numA = numA + moveA
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.pressed.NUMPADNINE') and debugCamera then --NUM5
		numA = numA - moveA
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.pressed.NUMPADFIVE') and debugCamera then --NUM5
		numZ = defaultCam
		numA = 0
	end
end