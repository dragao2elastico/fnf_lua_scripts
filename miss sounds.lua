        -- Change the sounds / add new ones
        local missSounds = {
                'sound1', --Change the words in the ''s to whatever sound you want to play! MUST BE A .ogg FILE!!
                'sound2',
                'sound3',
                'sound4'
            }
            
            local listLength = 4 -- Amount of possible sounds, change with how many you have
            
            function noteMiss(id, direction, noteType, isSustainNote)
                if noteType == '' then
                math.randomseed(os.time()) -- Makes it random
                for i = 0, 5 do
                    math.randomseed(math.random())
                end
                local chosen = math.random(1, listLength)
                playSound(missSounds[chosen], 1)
            end
        end
    --Credit to GuyOnAComputer on Gamebanana for making the script support multiple miss sounds!