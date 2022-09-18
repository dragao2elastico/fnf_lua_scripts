 function onUpdate()
 getPropertyFromClass('flixel.input', 'FlxKey') --Basically lets the script figure out what button you are pressing.
 ChartingMode = getPropertyFromClass('PlayState', 'chartingMode') --Just a makeshift shortcut
  if not ChartingMode then
   if keyJustPressed('space') then --self explanatory 
     setPropertyFromClass('PlayState', 'chartingMode', true) --Enables charting mode
     debugPrint('Charting Mode Enabled.') --Notification y'know?
   end
  end
     if ChartingMode then
       if keyJustPressed('space') then --self explanatory 
          setPropertyFromClass('PlayState', 'chartingMode', false) --Disables charting mode
          debugPrint('Charting Mode Disabled.') --Also a notification y'know?
       end
     end
end