local underlaytransparency = 0

function onUpdate()
        setProperty('underlaybfmiddle.alpha', underlaytransparency)
        setProperty('underlaydadmiddle1.alpha', underlaytransparency)
        setProperty('underlaydadmiddle2.alpha', underlaytransparency)
        setProperty('dadunderlay.alpha', underlaytransparency)
        setProperty('bfunderlay.alpha', underlaytransparency)
    if keyboardJustPressed('RBRACKET') then
        playSound('clickText', '1')
        underlaytransparency = underlaytransparency + 0.1
    end

    if keyboardJustPressed('LBRACKET') then
        playSound('dialogueClose', '1')
        underlaytransparency = underlaytransparency - 0.1
	end
end

function onCreate()
        makeLuaSprite('underlaybfmiddle', 'underlay', 412, 0)
        scaleObject('underlaybfmiddle', 0.68, 0.6)
        setObjectCamera('underlaybfmiddle', 'camHUD')
        setProperty('underlaybfmiddle.alpha', underlaytransparency)
        makeLuaSprite('underlaydadmiddle1', 'underlay', 82, 0)
        scaleObject('underlaydadmiddle1', 0.34, 0.6)
        setObjectCamera('underlaydadmiddle1', 'camHUD')
        setProperty('underlaydadmiddle1.alpha', underlaytransparency)
        makeLuaSprite('underlaydadmiddle2', 'underlay', 969, 0)
        scaleObject('underlaydadmiddle2', 0.34, 0.6)
        setObjectCamera('underlaydadmiddle2', 'camHUD')
        setProperty('underlaydadmiddle2.alpha', underlaytransparency)
        makeLuaSprite('dadunderlay', 'underlay', 90, 0)
        scaleObject('dadunderlay', 0.68, 0.6)
        setObjectCamera('dadunderlay', 'camHUD')
        setProperty('dadunderlay.alpha', underlaytransparency)
        makeLuaSprite('bfunderlay', 'underlay', 730, 0)
        scaleObject('bfunderlay', 0.68, 0.6)
        setObjectCamera('bfunderlay', 'camHUD')
        setProperty('bfunderlay.alpha', underlaytransparency)

        if middlescroll then
            addLuaSprite('underlaybfmiddle')
        end

        if getPropertyFromClass('ClientPrefs', 'opponentStrums') == true and middlescroll then
            addLuaSprite('underlaydadmiddle1')
            addLuaSprite('underlaydadmiddle2')
        end

        if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
            addLuaSprite('bfunderlay')
        end

        if getPropertyFromClass('ClientPrefs', 'opponentStrums') == true and middlescroll == false then
            addLuaSprite('dadunderlay')
        end
    end