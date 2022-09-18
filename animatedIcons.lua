
function onCreatePost()
	makeAnimatedLuaSprite('Boyfriend', 'Put_Your_Animated_Icon_Name_Here', getProperty('iconP1.x'), getProperty('iconP1.y'))

	luaSpriteAddAnimationByPrefix('Boyfriend', 'move', 'idle', 24, false);  -- change here

	setObjectCamera('Boyfriend', 'hud')
	addLuaSprite('Boyfriend', true)
	setProperty('Boyfriend.flipX', true) --mirror sprite horizontally
	setObjectOrder('Boyfriend', getObjectOrder('iconP1') + 1)
	setProperty('iconP1.alpha', 0)
      scaleObject('Boyfriend', 0.5, 0.5);
end
--------------------------------------------------------------------------------------------------------------------------------
function onUpdate()
	setProperty('Boyfriend.x', getProperty('iconP1.x') + -10) -- change here
	setProperty('Boyfriend.angle', getProperty('iconP1.angle'))
	setProperty('Boyfriend.y', getProperty('iconP1.y') + -90) -- and here
end
---------------------------------------------------------------------------------------------------------------------------------
function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0 then -- change here
		objectPlayAnimation('Boyfriend', 'move');
	end
end
