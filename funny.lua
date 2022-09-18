function onCreatePost()
    setHealthBarColors('fffffd', 'fffffd')
end
function onUpdate(onUpdate)
    if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
        doTweenColor('bfColorTween', 'boyfriend', 'C24B99', 0.3, 'liner')
        doTweenColor('timeBar', 'timeBar', 'C24B99', 0.3, 'liner')
        doTweenColor('icon1', 'iconP1', 'C24B99', 0.3, 'liner')
        doTweenColor('botplay', 'botplayTxt', 'C24B99', 0.3, 'liner')
        doTweenColor('score', 'scoreTxt', 'C24B99', 0.3, 'liner')
        doTweenColor('health', 'healthBar', 'C24B99', 0.3, 'liner')
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                doTweenColor('bfColorTween', 'boyfriend', 'F9393F', 0.3, 'liner')
                doTweenColor('timeBar', 'timeBar', 'F9393F', 0.3, 'liner')
                doTweenColor('icon1', 'iconP1', 'F9393F', 0.3, 'liner')
                doTweenColor('botplay', 'botplayTxt', 'F9393F', 0.3, 'liner')
                doTweenColor('score', 'scoreTxt', 'F9393F', 0.3, 'liner')
                doTweenColor('health', 'healthBar', 'F9393F', 0.3, 'liner')
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                doTweenColor('bfColorTween', 'boyfriend', '12FA05', 0.3, 'liner')
                doTweenColor('timeBar', 'timeBar', '12FA05', 0.3, 'liner')
                doTweenColor('icon1', 'iconP1', '12FA05', 0.3, 'liner')
                doTweenColor('botplay', 'botplayTxt', '12FA05', 0.3, 'liner')
                doTweenColor('score', 'scoreTxt', '12FA05', 0.3, 'liner')
                doTweenColor('health', 'healthBar', '12FA05', 0.3, 'liner')
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                doTweenColor('bfColorTween', 'boyfriend', '00FFFF', 0.3, 'liner')
                doTweenColor('timeBar', 'timeBar', '00FFFF', 0.3, 'liner')
                doTweenColor('icon1', 'iconP1', '00FFFF', 0.3, 'liner')
                doTweenColor('botplay', 'botplayTxt', '00FFFF', 0.3, 'liner')
                doTweenColor('score', 'scoreTxt', '00FFFF', 0.3, 'liner')
                doTweenColor('health', 'healthBar', '00FFFF', 0.3, 'liner')
            elseif getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            doTweenColor('bfColorTween', 'boyfriend', 'fffffd', 0.3, 'liner')
            doTweenColor('timeBar', 'timeBar', 'fffffd', 0.3, 'liner')
            doTweenColor('icon1', 'iconP1', 'fffffd', 0.3, 'liner')
            doTweenColor('botplay', 'botplayTxt', 'fffffd', 0.3, 'liner')
            doTweenColor('score', 'scoreTxt', 'fffffd', 0.3, 'liner')
            doTweenColor('health', 'healthBar', 'FFFFFd', 0.3, 'liner')
end
    if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
        doTweenColor('dadColorTween', 'dad', 'C24B99', 0.3, 'liner')
        doTweenColor('icon2', 'iconP2', 'C24B99', 0.3, 'liner')
        doTweenColor('botplay', 'botplayTxt', 'C24B99', 0.3, 'liner')
        doTweenColor('score', 'scoreTxt', 'C24B99', 0.3, 'liner')
        doTweenColor('healthbg', 'healthBar', 'C24B99', 0.3, 'liner')
            elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                doTweenColor('dadColorTween', 'dad', 'F9393F', 0.3, 'liner')
                doTweenColor('icon2', 'iconP2', 'F9393F', 0.3, 'liner')
                doTweenColor('botplay', 'botplayTxt', 'F9393F', 0.3, 'liner')
                doTweenColor('score', 'scoreTxt', 'F9393F', 0.3, 'liner')
                doTweenColor('healthbg', 'healthBar', 'F9393F', 0.3, 'liner')
            elseif getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                doTweenColor('dadColorTween', 'dad', '12FA05', 0.3, 'liner')
                doTweenColor('icon2', 'iconP2', '12FA05', 0.3, 'liner')
                doTweenColor('botplay', 'botplayTxt', '12FA05', 0.3, 'liner')
                doTweenColor('score', 'scoreTxt', '12FA05', 0.3, 'liner')
                doTweenColor('healthbg', 'healthBar', '12FA05', 0.3, 'liner')
            elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                doTweenColor('dadColorTween', 'dad', '00FFFF', 0.3, 'liner')
                doTweenColor('icon2', 'iconP2', '00FFFF', 0.3, 'liner')
                doTweenColor('botplay', 'botplayTxt', '00FFFF', 0.3, 'liner')
                doTweenColor('score', 'scoreTxt', '00FFFF', 0.3, 'liner')
                doTweenColor('healthbg', 'healthBar', '00FFFF', 0.3, 'liner')
            elseif getProperty('dad.animation.curAnim.name') == 'idle' then
            doTweenColor('dadColorTween', 'dad', 'fffffd', 0.3, 'liner')
            doTweenColor('icon2', 'iconP2', 'fffffd', 0.3, 'liner')
            doTweenColor('botplay', 'botplayTxt', 'fffffd', 0.3, 'liner')
            doTweenColor('score', 'scoreTxt', 'fffffd', 0.3, 'liner')
            doTweenColor('healthbg', 'healthBar', 'fffffd', 0.3, 'liner')
            end
        end