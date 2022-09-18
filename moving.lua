function onSongStart()
    setPropertyFromClass('openfl.Lib','application.window.fullscreen', false)
    setPropertyFromClass('openfl.Lib','application.window.x', 300)
    setPropertyFromClass('openfl.Lib','application.window.y', 200)
    setPropertyFromClass('openfl.Lib', 'application.window.width', 800)
    setPropertyFromClass('openfl.Lib', 'application.window.height', 405)
end

function onUpdate()
        setPropertyFromClass('openfl.Lib','application.window.fullscreen', false)
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        setPropertyFromClass('openfl.Lib','application.window.x', 300)
        setPropertyFromClass('openfl.Lib','application.window.y', 200)
        setPropertyFromClass('openfl.Lib', 'application.window.width', 800)
        setPropertyFromClass('openfl.Lib', 'application.window.height', 405)

    elseif keyJustPressed('left') then
        setPropertyFromClass('openfl.Lib','application.window.x', 260)
        setPropertyFromClass('openfl.Lib','application.window.y', 200)
        setPropertyFromClass('openfl.Lib', 'application.window.width', 800)
        setPropertyFromClass('openfl.Lib', 'application.window.height', 405)

    elseif keyJustPressed('right') then
        setPropertyFromClass('openfl.Lib','application.window.x', 340)
        setPropertyFromClass('openfl.Lib','application.window.y', 200)
        setPropertyFromClass('openfl.Lib', 'application.window.width', 800)
        setPropertyFromClass('openfl.Lib', 'application.window.height', 405)

    elseif keyJustPressed('up') then
        setPropertyFromClass('openfl.Lib','application.window.x', 300)
        setPropertyFromClass('openfl.Lib','application.window.y', 160)
        setPropertyFromClass('openfl.Lib', 'application.window.width', 800)
        setPropertyFromClass('openfl.Lib', 'application.window.height', 405)

    elseif keyJustPressed('down') then
        setPropertyFromClass('openfl.Lib','application.window.x', 300)
        setPropertyFromClass('openfl.Lib','application.window.y', 240)
        setPropertyFromClass('openfl.Lib', 'application.window.width', 800)
        setPropertyFromClass('openfl.Lib', 'application.window.height', 405)
    end
end