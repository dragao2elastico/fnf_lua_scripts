function onUpdate()
    if getPropertyFromClass("flixel.FlxG", "keys.pressed.SEVEN") then
        addHaxeLibrary('LoadingState')
        addHaxeLibrary('PlayState')
        addHaxeLibrary('Song')
        addHaxeLibrary('Paths')
        addHaxeLibrary('Highscore')
        runHaxeCode([[
            var songLowercase:String = Paths.formatToSongPath('DROWNING');
            var poop:String = Highscore.formatSong(songLowercase, PlayState.storyDifficulty);
            PlayState.SONG = Song.loadFromJson(poop, songLowercase);
            PlayState.isStoryMode = false;
            LoadingState.loadAndSwitchState(new PlayState());
        ]])
    end
end