-- sonegação de imposto 
-- vive la france
local cinema
local changemap = true

function opponentNoteHit(id,data,type,sus)
    -- triggerEvent('Screen Shake','0.1, 0.002','0.1, 0.002')
	health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.03);
	end
end

function onStepHit()


    if curStep >= 32 then
        setProperty('camHUD.visible', true)
        cinema = false
        changemap = true
    end

    if curStep >= 282 then
        doTweenZoom('bruh', 'camGame', 1.5, 0.52, 'linear')
        setProperty('defaultCamZoom', 1.5)
    end

    if curStep >= 288 then
        doTweenZoom('bruh', 'camGame', 0.9, 0.52, 'linear')
        setProperty('defaultCamZoom', 0.9)

        changemap = false
    end

    if curStep == 288 then
        cameraFlash("hud", "FFFFFF", 1, false)
    end

    if curStep >= 556 then
        doTweenZoom('bruh', 'camGame', 1.2, 0.35, 'linear')
        setProperty('defaultCamZoom', 1.2)
    end

    if curStep == 560 then
        cameraFlash("hud", "FFFFFF", 1, false)
    end

    if curStep >= 560 then
        doTweenZoom('bruh', 'camGame', 0.9, 0.52, 'linear')
        setProperty('defaultCamZoom', 0.9)

        changemap = true
    end

    if curStep >= 1067 then
        doTweenZoom('bruh', 'camGame', 1.2, 0.35, 'linear')
        setProperty('defaultCamZoom', 1.2)
    end

    if curStep == 1071 then
        cameraFlash("hud", "FFFFFF", 1, false)
    end

    if curStep >= 1071 then
        doTweenZoom('bruh', 'camGame', 0.9, 0.52, 'linear')
        setProperty('defaultCamZoom', 0.9)
    end

    if curStep >= 1328 then
        changemap = false
    end

    if curStep == 1328 then
        cameraFlash("hud", "FFFFFF", 1, false)
    end
end

function onCreate() 

    makeLuaSprite('white', 'malfunction/PixelMouse', 400, -175);
    setScrollFactor('white', 0.9, 0.9);
    screenCenter("white", x)
    setProperty('white.scale.x', 1);
    setProperty('white.scale.y', 1);
    addLuaSprite("white")

    makeLuaSprite('bartop','',-200,-100)
    makeGraphic('bartop',2000,100,'000000')
    addLuaSprite('bartop',false)
    setScrollFactor('bartop',0,0)
    setObjectCamera('bartop','other')
    
    makeLuaSprite('barbot','',-200, 720)
    makeGraphic('barbot',2000,100,'000000')
    addLuaSprite('barbot',false)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','other')

    makeLuaSprite('bg3', 'twofort', 400, -175);
    setScrollFactor('bg3', 0.9, 0.9);
    screenCenter("bg3", x)
    setProperty('bg3.scale.x', 1);
    setProperty('bg3.scale.y', 1);
    addLuaSprite("bg3")

    makeLuaSprite('haha', 'malfunction/haha', 0, 250);
    setObjectCamera('haha','other')
    setProperty('haha.scale.x', 2.5);
    setProperty('haha.scale.y', 2.5);

    makeLuaSprite('talking', 'malfunction/talking', 0, 0);
    setProperty('talking.flipX', true)
    screenCenter("talking", x)
    setObjectCamera('talking','other')
    
    
    makeLuaSprite('bgsan',  'hall', -300, 0);
    setScrollFactor('bgsan', 0.9, 0.9);
    scaleObject('bgsan', 1.5, 1.5);
    addLuaSprite('bgsan', false);
        
    makeLuaSprite('bg', 'bg_lemon', -400, 30);
    setScrollFactor('bg', 0.9, 0.9);
    addLuaSprite('bg', false);

   setProperty("bg.visible", false)
   setProperty("bgsan.visible", false)
   setProperty("bg3.visible", false)

   setProperty('gfGroup.visible', false)
   setProperty('camGame.zoom', 3)
    doTweenZoom('begin', 'camGame', '0.9', 5, 'quadOut')
    setPropertyFromClass('flixel.FlxG', 'autoPause', false)
end

function onUpdate(elapsed)
    if cinema then
        doTweenY("bartop", "bartop", -30, 5, "circOut")
        doTweenY("barbot", "barbot", 650, 5, "circOut")
    end

    if cinema == false then
        doTweenY("bartop", "bartop", -100, 5, "circOut")
        doTweenY("barbot", "barbot", 720, 5, "circOut")
    end

    if changemap then
        if curStep % 32 == 0 then
            setProperty("bg.visible", true)
            setProperty("bgsan.visible", false)
            setProperty("bg3.visible", false)
        end

        if curStep % 64 == 0 then
            setProperty("bg.visible", false)
            setProperty("bgsan.visible", true)
            setProperty("bg3.visible", false)
        end

        if curStep % 80 == 0 then
            setProperty("bg.visible", false)
            setProperty("bgsan.visible", false)
            setProperty("bg3.visible", true)
        end
    end

    if changemap == false then
        setProperty("bg.visible", false)
        setProperty("bgsan.visible", false)
        setProperty("bg3.visible", false)
    end

    triggerEvent('Change Character', 'bf', 'bf-pixel')

    if curStep >= 32 then
        triggerEvent('Change Character', 'bf', 'bf')
    end

    if curStep >= 288 then
        triggerEvent('Change Character', 'bf', 'bf-pixel')
    end

    if curStep >= 560 then
        triggerEvent('Change Character', 'bf', 'bf')
    end

    if curStep >= 1076 then
        triggerEvent('Change Character', 'bf', 'bf-hand') 
    end

    if curStep >= 1328 then
        triggerEvent('Change Character', 'bf', 'bf-pixel')
    end
end

function onCountdownTick(counter)
	if counter == 3 then
		cinema = true
        setProperty('camHUD.visible', false)
	end
end

function onSongStart()
    setProperty("health", 2)
end