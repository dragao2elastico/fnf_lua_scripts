local Anim = {"idle"}
function onBeatHit()
    if getProperty('dad.animation.curAnim.name') == 'idle' then
        if curBeat % 1 == 0 then
            setProperty('iconP2.angle', 14);
            doTweenAngle('bop', 'iconP2', 0,0.2,'linear');
        end
        if curBeat % 8 == 0 then
            setProperty('iconP2.angle', 14);
            doTweenAngle('bop', 'iconP2', 0,0.2,'linear');
        end
    end

    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        if curBeat % 1 == 0 then
            setProperty('iconP1.angle', -14);
            doTweenAngle('bip', 'iconP1', 0,0.2,'linear');
        end
        if curBeat % 8 == 0 then
            setProperty('iconP1.angle', -14);
            doTweenAngle('bip', 'iconP1', 0,0.2,'linear');
        end
    end
end
