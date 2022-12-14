--FUCKED SCROLL 2.2 BY BLUECOLORSIN--
--OG POST: https://discord.com/channels/922849922175340586/1036028597426716732--

function onCreatePost()
    if middlescroll then 
        if downscroll then 
            FSConfig({70,110}, true, {[0] = 570, 510, 510, 570})
        else
            FSConfig({110,70}, true, {[0] = 50, 110, 110, 50})
        end
    else
        if downscroll then 
            FSConfig({70, 110}, false, {[0] = 480, 510, 540, 570, 570, 540, 510, 480})
        else
            FSConfig({110, 70}, false, {[0] = 140, 110, 80, 50, 50, 80, 110, 140})
        end
    end
  end
  
  function FSConfig(TVar, MS, SrumsConfig)
    if MS then for i = 0,1 do for y = 2,3 do
        setPropertyFromGroup('playerStrums', i, 'direction', TVar[1]); --[[< left || Right >]] setPropertyFromGroup('playerStrums', y, 'direction', TVar[2])
        setPropertyFromGroup('playerStrums', i, 'y', SrumsConfig[i]);  --[[< left || Right >]] setPropertyFromGroup('playerStrums', y, 'y', SrumsConfig[y])
    end
        end else for i = 0,7 do 
            setPropertyFromGroup('playerStrums', i, 'direction', TVar[1]) setPropertyFromGroup('opponentStrums', i, 'direction', TVar[2]) 
            setPropertyFromGroup('strumLineNotes', i, 'y', SrumsConfig[i])
        end
    end
  end