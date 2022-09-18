function onUpdate()

if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ALT') then 
	characterPlayAnim('boyfriend', 'pre-attack', true);
setProperty('boyfriend.specialAnim', true);

runTimer('next anim', 0.2)
function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'next anim' then 
characterPlayAnim('boyfriend', 'attack main', true);
setProperty('boyfriend.specialAnim', true);
setProperty('health', getProperty('health') +0.1);
runTimer('next anim 2', 0.4)

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'next anim 2' then 
characterPlayAnim('boyfriend', 'pre-attack', true);
setProperty('boyfriend.specialAnim', true);
runTimer('next anim 3', 0.3)

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'next anim 3' then 
characterPlayAnim('boyfriend', 'idle', true);
setProperty('boyfriend.specialAnim', true);
							end
						end
					end
				end
			end
		end
	end
end