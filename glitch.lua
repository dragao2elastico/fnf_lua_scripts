Chromacrap = 0;

function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end
function math.lerp(from,to,i)return from+(to-from)*i end

function setChrome(chromeOffset)
    setShaderFloat("temporaryShader", "size", chromeOffset);
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    Chromacrap = Chromacrap + 0.01 -- edit this
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'mal' then
    Chromacrap = Chromacrap + 0.05 -- edit this
    end
end
local shadname = 'glitch'
function onCreatePost()
    initLuaShader(shadname)
    
    makeLuaSprite("temporaryShader")
    makeGraphic("temporaryShader", screenWidth, screenHeight)
    
    setSpriteShader("temporaryShader", shadname)
    
    addHaxeLibrary("ShaderFilter", "openfl.filters")
    runHaxeCode([[
        trace(ShaderFilter);
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
    ]])
end

function onUpdate(elapsed)
    Chromacrap = math.lerp(Chromacrap, 0, boundTo(elapsed * 20, 0, 1))
    setChrome(Chromacrap)
end