function opponentNoteHit()
       health = getProperty('health')
    if getProperty('health') > 0.1 then
       setProperty('health', health- 0.01);
	end
end     
function onCreatePost()
setProperty('health',0.5)
end
