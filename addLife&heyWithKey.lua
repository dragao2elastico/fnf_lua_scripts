function onUpdate()
    health = getProperty('health');
    

    -- if characterPlayAnim('boyfriend', 'hey', true) then 
    --     if getProperty('health') > -1 then
    --         setProperty('health', health+ 0.2);
    --     end
    -- end
    
    if keyJustPressed('space') then -- Defalth: space
        characterPlayAnim('boyfriend', 'hey', true)
        characterPlayAnim('boyfriend', 'hi', true)
        setProperty('boyfriend.specialAnim', true)
        playSound('hey') -- the volume goes from 1-5 and the sound file has to be in mods/sounds 
        


    end
    
    if keyJustPressed('space') then -- Defalth: space
        characterPlayAnim('dad', 'hey', true)
        setProperty('dad.specialAnim', true)
    end
    
    -- if characterPlayAnim('boyfriend', 'hey', true) then 
    --     setInterval(function()
    --         characterPlayAnim('boyfriend', 'idle', true)
    --         setProperty('boyfriend.specialAnim', false)
    --     end, 5000)
    --     process:loop()
    -- end
    
    if keyJustPressed('space') then -- Defalth: space
        if getProperty('health') > -1 then
            setProperty('health', health+ 0.2);
        end
    end
end

function goodNoteHit() 
    playSound('hey', 5)
end

