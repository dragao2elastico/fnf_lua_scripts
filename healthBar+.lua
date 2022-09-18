local onIcon = false -- On top of P1's icon
local move2UpR = false -- Move up right (bottom right for downscroll)

local xUse
local yUse
local counted
local coolerTable = {}

function onCreatePost() -- HP bar doesn't exist on "onCreate"
--    coolerTable = getProperty('boyfriend.healthColorArray')
    if move2UpR == true then
        if not downscroll then
            xUse = getProperty('healthBar.x') + 490
            yUse = getProperty('healthBar.y') - 20
        else
            xUse = getProperty('healthBar.x') + 490
            yUse = getProperty('healthBar.y') + 8
        end
    else
        xUse = getProperty('healthBar.x') + 200
        yUse = getProperty('healthBar.y') - 6
    end

    makeLuaText('hpPercent', '', 200, xUse, yUse)
    setObjectCamera("hpPercent", 'hud');
    setObjectOrder('hpPercent', getObjectOrder('iconP2') + 1)
    setTextColor('hpPercent', '0xffffff')
    setTextSize('hpPercent', 20);
    addLuaText("hpPercent");
    setTextFont('hpPercent', "vcr.ttf");
    setTextAlignment('hpPercent', 'center');
end

function onCountdownTick(count)
    if count == 0 then
        setTextString('hpPercent', '3')
    end
    if count == 1 then
        setTextString('hpPercent', '2')
    end
    if count == 2 then
        setTextString('hpPercent', '1')
    end
    if getPropertyFromClass('PlayState', 'isPixelStage') == true then
        if count == 3 then
            setTextString('hpPercent', 'DATE!')
        end
    else
        if count == 3 then
            setTextString('hpPercent', 'GO!')
        end
    end
    if count == 4 then
        counted = true
    end
end

function onUpdate()
    coolerTable = getProperty('boyfriend.healthColorArray')
    if onIcon == true then
        setProperty('hpPercent.x', getProperty('iconP1.x')-20)
        setProperty('hpPercent.y', getProperty('iconP1.y')+10)
        setProperty('hpPercent.angle', getProperty('iconP1.angle'))
        setProperty('hpPercent.scale.x', getProperty('iconP1.scale.x'))
        setProperty('hpPercent.scale.y', getProperty('iconP1.scale.y'))
    end

    percent = round(getProperty('health') * 50, 2)

    if percent < 5 then
        percent = round(getProperty('health') * 50, 5)
    end

    if percent > 100 then
        percent = 100
    end

    if counted == true then
        setTextString('hpPercent', ''.. percent .. '%')
    end

    if percent <= 20 then
        setTextColor('hpPercent', '0xff0000')
    elseif percent > 80 then
        setTextColor('hpPercent', '0x36eaf7') --0x36eaf7
    else
        setTextColor('hpPercent', '0xffffff')
    end

    if curBpm <= 115 then
        setProperty('hpPercent.scale.x', getProperty('iconP1.scale.x'))
        setProperty('hpPercent.scale.y', getProperty('iconP1.scale.y'))
    else
        if curBeat % 2 == 0 and onIcon == false then
            setProperty('hpPercent.scale.x', getProperty('iconP1.scale.x'))
            setProperty('hpPercent.scale.y', getProperty('iconP1.scale.y'))
        end
        
    end
end

function round(num, numDecimalPlaces)
   local mult = 10^(numDecimalPlaces or 0)
   return math.floor(num * mult + 0.5) / mult
end