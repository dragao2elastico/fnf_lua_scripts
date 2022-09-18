if not lowQuality then
        function onCreate()
                ChartingMode = getPropertyFromClass('PlayState', 'chartingMode')
                stageName = getPropertyFromClass('PlayState', 'SONG.stage')
        
        end
        
        function onSongStart()
               
                

                if ChartingMode then
                        debugPrint('Week Name: ', week)
                        debugPrint('Song Name: ', songName,';',' BPM: ', bpm)
                        debugPrint('Song Length: ', songLength,' Milliseconds;',' Scroll Speed: ', scrollSpeed)
                        debugPrint('Current Boyfriend: ', boyfriendName)
                        debugPrint('Current Opponent: ', dadName)
                        debugPrint('Current Stage: ', stageName)
                end
        end
            function onEvent(name,value1,value2)
                 
                  
                  
                  if ChartingMode then
                        if name == 'Camera Follow Pos' then
                                --nothing lol
                                -- for the scripts that give the camera follow shit when you hit notes, that shit would be printing EVERY FRAME! (ಥ﹏ಥ)
                                elseif name == 'Add Camera Zoom' then
                                        --non lmao
                                elseif name == 'Flashing Camera' then
                                        --nada kek
                                elseif name == 'Cam Speed' then
                                        --void lel
                                elseif name == 'Zoom' then
                                        --none *trollface*
                                elseif name == 'Tricky_Static' then
                                        --no
                                elseif name == 'Whatever you want to not get printed' then
                                        --lol no printing   
                                
                
                
                        else    
                              debugPrint(name,', ',value1,', ',value2)
                              end
                        end
                  end
            end
if lowQuality then
        close(true)
end