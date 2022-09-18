function onUpdate()
	--prevents the sounds from playing on the game over screen
	if inGameOver == false then
		--plays the sounds when the keys are pressed.
		if keyJustPressed('left') then
			playSound('ChartingTick',0.4,'chart');
		
		elseif keyJustPressed('right') then
			playSound('ChartingTick',0.4,'chart');
		
		elseif keyJustPressed('up') then
			playSound('ChartingTick',0.4,'chart');
		
		elseif keyJustPressed('down') then
			playSound('ChartingTick',0.4,'chart');
	end
	end
end