local hide = true
local made = false
local chartModeOnly = false -- Only spawns in charting mode

-- Make text that shows character current animation
local bfAnims = true
local gfAnims = true
local dadAnims = true

function onUpdate()
    if chartModeOnly == true then
        if getPropertyFromClass('PlayState', 'chartingMode') == true and made == false then
           hide = false
           makeDaText()
        end
    else
        if made == false then
            hide = false
            makeDaText()
        end
    end

    if curBpm >= 339 then
        setTextString('BpmText', "BPM: ".. curBpm .. " | MAX")
    else
        setTextString('BpmText', "BPM: ".. curBpm)
    end

    if getProperty('songSpeed') >= 10 then
        setTextString('scrollSpd', "Speed: ".. round(getProperty('songSpeed'), 2) .. ' | MAX')
    else
        setTextString('scrollSpd', "Speed: ".. round(getProperty('songSpeed'), 2))
    end

    bfAn = nameCheck(getProperty('boyfriend.animation.curAnim.name'))
    gfAn = nameCheck(getProperty('gf.animation.curAnim.name'))
    dadAn = nameCheck(getProperty('dad.animation.curAnim.name'))

    setTextString('curBfAnim', 'BF Cur Anim: '.. bfAn)

    if getProperty('dad.curCharacter') == getProperty('gf.curCharacter') then
        setTextString('curGfAnim', 'GF Cur Anim: '.. dadAn)
    else
        setTextString('curGfAnim', 'GF Cur Anim: '.. gfAn)
    end

    setTextString('curDadAnim', 'DD Cur Anim: '.. dadAn)

end

function onBeatHit()
    setTextString('beatCount', "Beat: ".. curBeat)
end

function onStepHit()
    setTextString('stepCount', "Step: ".. curStep)
end

function makeDaText()
    if hide == false then
            makeLuaText('beatCount', "Beat: 0", 500, 950, getProperty('healthBar.y') - 6);
            setObjectCamera("beatCount", 'hud'); -- game | hud | other
            setTextColor('beatCount', '0xffffff')
            setTextSize('beatCount', 20);
            addLuaText("beatCount");
            setTextFont('beatCount', "vcr.ttf");
            setTextAlignment('beatCount', 'left');
            
            makeLuaText('stepCount', "Step: 0", 500, 1090, getProperty('healthBar.y') - 6);
            setObjectCamera("stepCount", 'hud');
            setTextColor('stepCount', '0xffffff')
            setTextSize('stepCount', 20);
            addLuaText("stepCount");
            setTextFont('stepCount', "vcr.ttf");
            setTextAlignment('stepCount', 'left');
            
            makeLuaText('BpmText', "Bpmlol", 500, 1102, getProperty('healthBar.y') + 18);
            setObjectCamera("BpmText", 'hud');
            setTextColor('BpmText', '0xffffff')
            setTextSize('BpmText', 20);
            addLuaText("BpmText");
            setTextFont('BpmText', "vcr.ttf");
            setTextAlignment('BpmText', 'left');
            
            makeLuaText('scrollSpd', "Speedlol", 500, 1078, getProperty('healthBar.y') + 40);
            setObjectCamera("scrollSpd", 'hud');
            setTextColor('scrollSpd', '0xffffff')
            setTextSize('scrollSpd', 20);
            addLuaText("scrollSpd");
            setTextFont('scrollSpd', "vcr.ttf");
            setTextAlignment('scrollSpd', 'left');

        if not downscroll then
            if bfAnims == true then
                makeLuaText('curBfAnim', "Beep", 500, 950, getProperty('healthBar.y') - 80);
                setObjectCamera("curBfAnim", 'hud');
                setTextColor('curBfAnim', '0x31b0d1')
                setTextSize('curBfAnim', 20);
                addLuaText("curBfAnim");
                setTextFont('curBfAnim', "vcr.ttf");
                setTextAlignment('curBfAnim', 'left');
            end

            if gfAnims == true then
                makeLuaText('curGfAnim', "Blu", 500, 950, getProperty('healthBar.y') - 60);
                setObjectCamera("curGfAnim", 'hud');
                setTextColor('curGfAnim', '0xa5004d')
                setTextSize('curGfAnim', 20);
                addLuaText("curGfAnim");
                setTextFont('curGfAnim', "vcr.ttf");
                setTextAlignment('curGfAnim', 'left');
            end

            if dadAnims == true then
                makeLuaText('curDadAnim', "Bop", 500, 950, getProperty('healthBar.y') - 40);
                setObjectCamera("curDadAnim", 'hud');
                setTextColor('curDadAnim', '0x9271fd')
                setTextSize('curDadAnim', 20);
                addLuaText("curDadAnim");
                setTextFont('curDadAnim', "vcr.ttf");
                setTextAlignment('curDadAnim', 'left');
            end
        else
            if bfAnims == true then
                makeLuaText('curBfAnim', "Beep", 500, 950, getProperty('healthBar.y') + 70);
                setObjectCamera("curBfAnim", 'hud');
                setTextColor('curBfAnim', '0x31b0d1')
                setTextSize('curBfAnim', 20);
                addLuaText("curBfAnim");
                setTextFont('curBfAnim', "vcr.ttf");
                setTextAlignment('curBfAnim', 'left');
            end

            if gfAnims == true then
                makeLuaText('curGfAnim', "Blu", 500, 950, getProperty('healthBar.y') + 90);
                setObjectCamera("curGfAnim", 'hud');
                setTextColor('curGfAnim', '0xa5004d')
                setTextSize('curGfAnim', 20);
                addLuaText("curGfAnim");
                setTextFont('curGfAnim', "vcr.ttf");
                setTextAlignment('curGfAnim', 'left');
            end

            if dadAnims == true then
                makeLuaText('curDadAnim', "Bop", 500, 950, getProperty('healthBar.y') + 110);
                setObjectCamera("curDadAnim", 'hud');
                setTextColor('curDadAnim', '0x9271fd')
                setTextSize('curDadAnim', 20);
                addLuaText("curDadAnim");
                setTextFont('curDadAnim', "vcr.ttf");
                setTextAlignment('curDadAnim', 'left');
            end
        end
        made = true
    end
end

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- singLEFT-alt becomes altLEFT for saving space
function nameCheck(anim)
    
    -- Don't worry about this, prevents stupid thing --
    if anim == 'boyfriend.animation.curAnim.name' then
        return "?";
    end
    if anim == 'gf.animation.curAnim.name' then
        return "?";
    end
    if anim == 'dad.animation.curAnim.name' then
        return "?";
    end
    -- Don't worry about this, prevents stupid thing --


    if string.find(anim, 'idle') then -- if idle is in the current animation name, don't continue
        return anim;
    else
        if string.find(anim, "alt") then
            if string.find(anim, "dance") then
                harkfirstD = string.gsub(anim, "dance", "danAlt")
                harkD = string.gsub(harkfirstD, "-alt", "")
                return harkD;
            end
            harkfirst = string.gsub(anim, "-alt", "")
            hark = string.gsub(harkfirst, "sing", "alt")
            --debugPrint("yeah")
            return hark;
        else
            --debugPrint("nah")
            return anim;
        end
    end
end
 