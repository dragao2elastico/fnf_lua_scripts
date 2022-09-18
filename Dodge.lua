function onUpdate()
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then 
	characterPlayAnim('boyfriend', 'dodge', true);
setProperty('boyfriend.specialAnim', true);
end
end