function onUpdate(elapsed) -- Made by Lokitot
    if keyPressed('left') then
        doTweenColor('boyfriend', 'boyfriend', 'FFFFFF', 0.01, 'linear');
    elseif keyPressed('right') then
        doTweenColor('boyfriend', 'boyfriend', 'FFFFFF', 0.01, 'linear');
    elseif keyPressed('down') then
        doTweenColor('boyfriend', 'boyfriend', 'FFFFFF', 0.01, 'linear'); -- meh, this shit will do nothing but it's important to be here
    elseif keyPressed('up') then
        doTweenColor('boyfriend', 'boyfriend', 'FFFFFF', 0.01, 'linear');
    else
        doTweenColor('boyfriend', 'boyfriend', 'FFFFFF', 0.4, 'linear');
    end
end

function noteMiss(id, direction, noteType, isSustainNote, duration) -- goofy ahhh PD: PLEASE FOR THE LOVE OF GOD DONT TOUCH ANYTHING OF THIS!! THE SCRIPT DOESNT NEED UPDATES FOR NOW
    if noteType == ''
    then doTweenColor('boyfriend', 'boyfriend', '0101DF', 0.00000000001, 'linear');  -- this code will force any character has bf become blue when you miss a note for a few seconds
    end
end

-- Notes:
-- credits to dave and bambi team bc i just copy the idea and ported it to lua lmao
-- feel free to use but please credit me
-- thanks for using this script :)
