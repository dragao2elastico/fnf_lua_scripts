local randomNumber1 = math.random(1, 10) --Returns a number between 1 and 10.
local randomNumber2 = math.random(10) --Also returns a number between 1 and 10.
local num = math.random(1, 3)
		
	local ranBg = num--math.floor(math.random() * num.length()) 

	local bg = 'loadingBG'..ranBg -- don't touch this

	local allowCountdown = false

	function onStartCountdown() -- No countdown yet
		if not allowCountdown then
			return Function_Stop
		end

		if allowCountdown then
			return Function_Continue
		end
	end

	function onCreatePost() -- sprite loading
		makeLuaSprite('loadingBG'..ranBg, 'loadingscreen/'..bg, 0, 0)
		runTimer('fadeTimer', 3.0, 1)

		addLuaSprite('loadingBG'..ranBg, true)
		setObjectCamera('loadingBG'..ranBg, 'camOther')
	end

	function onTimerCompleted(tag) -- bye bye loading screen
		if tag == 'fadeTimer' then
			doTweenAlpha('delete', 'loadingBG'..ranBg, 0, 0.5, 'backIn')
			allowCountdown = true
			startCountdown()
			
		end
	end

	function onTweenCompleted(tag) -- everything goes bye bye
		if tag == 'delete' then
			removeLuaSprite('loadingBG'..ranBg, true)
			
		end
	end