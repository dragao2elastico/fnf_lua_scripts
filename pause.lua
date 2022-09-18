-- this was made by my_life101#7445 on discord btw
--no stealing 🥺

local Paused = false
local quotes = {'never die -me (i am very wise)', 'wahoo -mx', 'you suck at this video game -tankman', 'go take a shower! -mom', 'lay your eggs in a dark and dank place! -directdogman', 'hello', 'why am i writing theese -me (i am not very wise)', 'lorum ispum - kratos idk', 'bruh -dude going to jail', 'phone heads are cool -directdogman','thats why not even your own friends like you -likwisd','oh my god... WHITE PEOPLE -a white man','ooogabooooogaaa HAHA -Sr. Pelo','salted -salt on him','the bronze jade -market pliers','Blocks! -SMM2 VO girl','this is literally 1984! -person who has not read 1984'}
local thing = 17
local quotenum = math.random(thing)
local scriptver = 1.0
local setingmenu = false
local canseting = false
--pause buttons
local resume = true
local restart = false
local quit = false 
local setings = false
local random = false
--setings buttons
local botphover = true
local qualhover = false
local flashhover = false
local downhover = false
local botplaybutt = botPlay
local qualitybutt = lowQuality
local flashingbutt = flashingLights
local downscrbutt = downscroll

function onCreate()
    precacheSound('dailPause')
	makeLuaSprite('black', 'stageback', -600, -300);
	makeGraphic('black',2560,1400,'000000');
	screenCenter('black');
    addLuaSprite('black',true);
    setProperty('black.alpha',0.5);
    setObjectCamera('black', 'other');
    makeLuaSprite('logo','pause/funktownlogo',475,0)
    addLuaSprite('logo',true);
    setObjectCamera('logo', 'other')
    makeLuaSprite('quote','pause/quote',150,450)
    addLuaSprite('quote',true);
    setObjectCamera('quote', 'other')
    makeLuaSprite('restart','pause/restart',350,450)
    addLuaSprite('restart',true);
    setObjectCamera('restart', 'other')
    makeLuaSprite('resume','pause/resume',550,450)
    addLuaSprite('resume',true);
    setObjectCamera('resume', 'other')
    makeLuaSprite('setings','pause/setings',750,450)
    addLuaSprite('setings',true);
    setObjectCamera('setings', 'other')
    makeLuaSprite('quit','pause/quit',950,450)
    addLuaSprite('quit',true);
    setObjectCamera('quit', 'other')
    makeAnimatedLuaSprite('arrow','chart_quant',625,450)
    addAnimationByIndices('arrow', 'chart_quant', 'point', 1, 24)
    addLuaSprite('arrow',true);
    setObjectCamera('arrow', 'other')
    doTweenAngle('arrow', 'arrow', 90, 0.0001, 'liner')
    makeLuaText('quotetxt','dummyText',600,330,190)
    setTextAlignment('quotetxt', 'center')
    setObjectCamera('quotetxt', 'other')
    setTextSize('quotetxt', 50)
    setTextFont('quotetxt', 'PermanentMarker.ttf')
    addLuaText('quotetxt')
    makeLuaText('bottomtxt','dummyText',1000,125,600)
    setTextSize('bottomtxt', 30)
    setTextAlignment('bottomtxt', 'center')
    setObjectCamera('bottomtxt', 'other')
    addLuaText('bottomtxt')
    makeLuaText('songname',songName,1000,130,160)
    setTextAlignment('songname', 'center')
    setObjectCamera('songname', 'other')
    addLuaText('songname')
    makeLuaText('diff','dummyText',1000,130,180)
    setTextAlignment('diff', 'center')
    setObjectCamera('diff', 'other')
    addLuaText('diff')
    makeAnimatedLuaSprite('arrowseting','chart_quant',90,170)
    addAnimationByIndices('arrowseting', 'chart_quant', 'point', 1, 24)
    addLuaSprite('arrowseting',true);
    setObjectCamera('arrowseting', 'other')
    if botPlay == true then
        makeLuaText('botptext','botplay',1000,130,200)
        setTextAlignment('botptext', 'center')
        setObjectCamera('botptext', 'other')
        addLuaText('botptext')
    end
    makeAnimatedLuaSprite('botbox','checkboxanim',130,130)--botplay
    makeAnimatedLuaSprite('qualbox','checkboxanim',130,240)--quality
    makeAnimatedLuaSprite('flashbox','checkboxanim',130,350)--flashing lights
    makeAnimatedLuaSprite('downscrbox','checkboxanim',130,460)--downscroll
    addAnimationByPrefix('botbox','checkbox', 1)
    addAnimationByPrefix('qualboxbox','checkbox', 1)
    addAnimationByPrefix('flashbox','checkbox', 1)
    addAnimationByPrefix('downscrbox','checkbox', 1)
    addAnimationByPrefix('botbox','checkbox finish', 1)
    addAnimationByPrefix('qualbox','checkbox finish', 1)
    addAnimationByPrefix('flashbox','checkbox finish', 1)
    addAnimationByPrefix('downscrbox','checkbox finish', 1)
    setObjectCamera('botbox', 'other')
    setObjectCamera('qualbox', 'other')
    setObjectCamera('flashbox', 'other')
    setObjectCamera('downscrbox', 'other')
    addLuaSprite('botbox',true);
    addLuaSprite('qualbox',true);
    addLuaSprite('flashbox',true);
    addLuaSprite('downscrbox',true);
end

function onUpdatePost()
	if Paused == true then
		setPropertyFromClass('Conductor', 'songPosition', pos) -- it is counted by milliseconds, 1000 = 1 second
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', pos)
		setProperty('vocals.time', pos)
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		setProperty('vocals.volume', 0)
		setProperty("boyfriend.animation.curAnim.paused", true)
		setProperty("dad.animation.curAnim.paused", true)
		setProperty("gf.animation.curAnim.paused", true)
		setProperty("playerStrums.animation.curAnim.paused", true)
		setProperty("boyfriend.heyTimer", 0)
		setProperty("dad.heyTimer", 0)
		setProperty("gf.heyTimer", 0)
            if setingmenu == false then
                setProperty('botbox.visible', false)    
                setProperty('qualbox.visible', false)
                setProperty('flashbox.visible', false)
                setProperty('downscrbox.visible', false)
                setProperty('black.visible', true)
                setProperty('logo.visible', true)
                setProperty('quote.visible', true)
                setProperty('quotetxt.visible', true)
                setProperty('restart.visible', true)
                setProperty('resume.visible', true)
                setProperty('setings.visible', true)
                setProperty('quit.visible', true)
                setProperty('arrow.visible', true)
                setProperty('bottomtxt.visible', true)
                setProperty('songname.visible', true)
                setProperty('diff.visible', true)
                setProperty('botptext.visible', true)
                setProperty('arrowseting.visible', false)
            else
                random = false
                restart = false
                resume = false
                seting = false
                quit = false
                setProperty('botbox.visible', true)
                setProperty('qualbox.visible', true)
                setProperty('flashbox.visible', true)
                setProperty('downscrbox.visible', true)
                setProperty('arrowseting.visible', true)
                setProperty('arrow.visible', false)
                setProperty('logo.visible', false)
                setProperty('quote.visible', false)
                setProperty('quotetxt.visible', false)
                setProperty('restart.visible', false)
                setProperty('resume.visible', false)
                setProperty('setings.visible', false)
                setProperty('quit.visible', false)
                setProperty('bottomtxt.visible', false)
                setProperty('songname.visible', false)
                setProperty('diff.visible', false)
                setProperty('botp.visible', false)
            end
	else
        stopSound('pausemus')
        doTweenX("stupidout", 'option', -1280, 1, "quadout")
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
		setProperty('vocals.volume', 1)
		setProperty('dad.animation.curAnim.paused', false)
		setProperty('gf.animation.curAnim.paused', false)
		setProperty('boyfriend.animation.curAnim.paused', false)
		setProperty("playerStrums.animation.curAnim.paused", false)
        setProperty('black.visible', false)
        setProperty('logo.visible', false)
        setProperty('quote.visible', false)
        setProperty('quotetxt.visible', false)
        setProperty('restart.visible', false)
        setProperty('resume.visible', false)
        setProperty('setings.visible', false)
        setProperty('quit.visible', false)
        setProperty('arrow.visible', false)
        setProperty('bottomtxt.visible', false)
        setProperty('songname.visible', false)
        setProperty('diff.visible', false)
        setProperty('botp.visible', false)
        setProperty('botbox.visible', false)
        setProperty('qualbox.visible', false)
        setProperty('flashbox.visible', false)
        setProperty('downscrbox.visible', false)
        setProperty('arrowseting.visible', false)
	end
    
    if difficulty == 0 then
        setTextString('diff','easy')
    elseif difficulty == 1 then
        setTextString('diff','normal')
    elseif difficulty == 2 then
        setTextString('diff','hard')
    end
        
        setTextString('quotetxt', quotes[quotenum])

        if setingmenu == false then
            if resume == true then
                doTweenAlpha('resumealpha', 'resume', 1, 0.1, 'linear')
                doTweenX('arrowmove','arrow',625,0.25,'linear')
               setTextString('bottomtxt','Back to the slaughter then!')
            else
                doTweenAlpha('resumealpha', 'resume', 0.5, 0.1, 'linear')
            end
            if restart == true then
                doTweenAlpha('restartalpha', 'restart', 1, 0.1, 'linear')
                doTweenX('arrowmove','arrow',425,0.25,'linear')
                setTextString('bottomtxt','Restart the song why dontcha`')
            else
                doTweenAlpha('restartalpha', 'restart', 0.5, 0.1, 'linear')
            end
            if quit == true then
                doTweenAlpha('quitalpha', 'quit', 1, 0.1, 'linear')
                doTweenX('arrowmove','arrow',1025,0.25,'linear')
                setTextString('bottomtxt','Leaving already? the party just started!')
            else
                doTweenAlpha('quitalpha', 'quit', 0.5, 0.1, 'linear')
            end
        else
            if botplaybutt == false then
                objectPlayAnimation('botbox','checkbox')
            else
                objectPlayAnimation('boxbox','checkbox finish')
            end
            if qualitybutt == false then
                objectPlayAnimation('qualbox','checkbox')
            else
                objectPlayAnimation('qualbox','checkbox finish')
            end
            if flashingbutt == false then
                objectPlayAnimation('flashbox','checkbox')
            else
                objectPlayAnimation('flashbox','checkbox finish')
            end
            if downscrbutt == true then
                objectPlayAnimation('downscrbox','checkbox finish')
            else
                objectPlayAnimation('downscrbox','checkbox')
            end
        end

        if random == true then
            doTweenAlpha('randomalpha', 'quote', 1, 0.1, 'linear')
            doTweenX('arrowmove','arrow',225,0.25,'linear')
            setTextString('bottomtxt','Randomize the quote at the top. (how fun!)')
        else
            doTweenAlpha('randomalpha', 'quote', 0.5, 0.1, 'linear')
        end
        if setings == true then
            doTweenAlpha('setingsaplha', 'setings', 1, 0.1, 'linear')
            doTweenX('arrowmove','arrow',825,0.25,'linear')
            if canseting == false then
            setTextString('bottomtxt','(not currently working)')
        else
            setTextString('bottomtxt','Wanna change stuff?')
        end
    else    
            doTweenAlpha('setingsalpha', 'setings', 0.5, 0.1, 'linear')
        end
    if keyJustPressed ('left') and Paused == true and setingmenu == false then
        playSound('scrollMenu',2)
        if resume == true then
            restart = true
            resume = false
        elseif restart == true then
            random = true
            restart = false
        elseif random == true then
            quit = true
            random = false
        elseif quit == true then
            setings = true
            quit = false
        elseif setings == true then
            resume = true
            setings = false
        end
    end
        if keyJustPressed ('right') and Paused == true and setingmenu == false then
            playSound('scrollMenu',2)
            if resume == true then
                setings = true
                resume = false
            elseif restart == true then
                resume = true
                restart = false
            elseif random == true then
                restart = true
                random = false
            elseif quit == true then
                random = true
                quit = false
            elseif setings == true then
                quit = true
                setings = false
            end
        end
            if keyJustPressed('up') and setingmenu == true then
                playSound('scrollMenu',2)
                if botphover == true then
                    downhover = true
                    botphover = false
                end
                if flashhover == true then
                    botphover = true
                    flashhover = false
                end
                if qualhover == true then
                    flashhover = true
                    qualhover = false
                end
                if downhover == true then
                    qualhover = true
                    downhover = false
                end
            end
            if keyJustPressed('down') and setingmenu == true then
                playSound('scrollMenu',2)
                if botphover == true then
                    flashhover = true
                    botphover = false
                end
                if flashhover == true then
                    qualhover = true
                    flashhover = false
                end
                if qualhover == true then
                    downhover = true
                    qualhover = false
                end
                if downhover == true then
                    botphover = true
                    downhover = false
                end
            end
end

function onPause()
    Paused = not Paused
    if resume == true then
        playSound('dialPause', 1, 'pausemus')
        playSound('scrollMenu',2)
    end
    if restart == true then
        restartSong(false);
        playSound('scrollMenu',2)
    end
    if quit == true then
        exitSong(false);
        playSound('scrollMenu',2)
    end
    if random == true then
        quotenum = math.random(thing)
        playSound('scrollMenu',2)
        Paused = true
    end
    if setings == true then
        if canseting == true then
            setingmenu = true
            Paused = true
    else
        playSound('scratch',2)
        Paused = true
    end
    end
    pos = getPropertyFromClass('Conductor', 'songPosition')
	return Function_Stop
end