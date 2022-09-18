local dead = false
local balls = 0
function onCreate()
	makeLuaText('pog', 'Luck Counter: 0', 1300, 0, 0)
	setTextAlignment('pog', 'center')
	setTextSize('pog', 25, 25)
	addLuaText('pog')
end
function onUpdate(elapsed)
	if keyJustPressed('space') and getRandomBool(6) then
		setProperty('health', 0)
		dead = true
	end
	if keyJustPressed('space') and dead == false then
		balls = balls + 1
		setTextString('pog', 'Luck Counter: ' .. balls)
	end
end