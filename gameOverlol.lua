function onCreate()
	if boyfriendName == 'bf-htf' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-htf');
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'bunfriend_death_sound');
		setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameover1');
	    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameover2');
	end
end