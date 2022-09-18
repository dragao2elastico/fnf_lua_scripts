
--[[
    ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
    ORGINALY MEANT FOR USE IN SUPER HOT FUNKIN'

    SCRIPT BY: LUNARCLEINT

    CHANGE THE NEEDED VERSION TO THE VERSION NEEDED FOR YOUR MOD

    THANKS FOR USING!
    ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
]]

VersionNeeded = '0.5.0'

local CurrentVersion = ''

local outdated = false;

function onCreate()
    CurrentVersion = getPropertyFromClass('MainMenuState', 'psychEngineVersion')
end

function onStartCountdown()
    if formatVersion(CurrentVersion) < formatVersion(VersionNeeded) then
        makeLuaSprite("cover", nil, 0,0)
        makeGraphic("cover", screenWidth * 3, screenHeight * 3, "000000")
        setObjectCamera("cover", "camHUD")
        screenCenter("cover", "xy")
        addLuaSprite("cover", true)
   
        debugPrint("VERSION NEEDED: " .. tostring(VersionNeeded) .. " CURRENT VERSION: " .. tostring(CurrentVersion))
        debugPrint("YOUR ARE ON A OUTDATED VERSION OF PSYCH ENGINE")

        outdated = true

        return Function_Stop;
    end
end

function onUpdatePost()
    if outdated then
        setProperty('health', 2)
    end
end

function formatVersion(ver)
    local str = ""

    string.gsub(ver,"%d+",function(e)
        str = str .. e
    end)

    return tonumber(str)
end