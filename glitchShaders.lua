function onCreatePost()
    -- Shader Credits What Suppoed To Look Like, tbh this is better https://www.shadertoy.com/view/lsfGD2#
    luaDebugMode = true
    initLuaShader("glitch")
    
    makeLuaSprite("temporaryShader")
    makeGraphic("temporaryShader", screenWidth, screenHeight)
    
    setSpriteShader("temporaryShader", "glitch")
    setShaderFloat("temporaryShader", "uTime", 2)
    setShaderFloat("temporaryShader", "iMouseX", 500)
    setShaderInt("temporaryShader", "NUM_SAMPLES", 3)
    setShaderFloat("temporaryShader", "glitchMultiply", 1)
    
    addHaxeLibrary("ShaderFilter", "openfl.filters")
    runHaxeCode([[
        trace(ShaderFilter);
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
    ]])
end