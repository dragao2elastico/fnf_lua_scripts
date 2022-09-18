function onCreatePost()
	setProperty('wiggle.scale.y', 0.5)
	setProperty('wiggle.y', -700)
	scaleObject('wiggle', 1.8, 1.8)
	p1pos = getProperty('iconP1.y')
	p2pos = getProperty('iconP2.y')


	for i=0,4,1 do
		setPropertyFromGroup('opponentStrums', i, 'texture', 'ronsip')
        end
        
        for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'ronsip'); --Change texture 
        end
end
end
	