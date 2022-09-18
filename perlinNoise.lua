-----------SETTINGS-----------
local resMultiplier = 1
local resX = 64*resMultiplier
local resY = 36*resMultiplier
local genFramerate = 24

local smoothness = 10
local blendMode = 'add'
------------------------------

local p = {}
local permutation = {}
local tiles = {}
local dathingZ = 0
local timer = 0

function newSeed()
    permutation = {}
    for i = 1, 256 do
        table.insert(permutation, getRandomInt(0,255))
    end
    for i=0,255 do
        p[i] = permutation[i+1]
        p[256+i] = permutation[i+1]
    end
end

function drawPerlinShit()
    for y = 0, resY-1 do
        for x = 0, resX-1 do
            color = {255,255,255}
            tilecolor = RGBtoHex(color)

            tileX = x * tileXsize
            tileY = y * tileYsize
            tileX = math.floor(tileX)
            tileY = math.floor(tileY)
            name = 'tile'..tileX..tileY..x..y

            makeAgraphic(name, tileX, tileY, tileXsize, tileYsize, tilecolor)
            setBlendMode(name, blendMode)
            dathing = {name, tilecolor, x, y}
            table.insert(tiles, dathing)
        end
    end
end

function updateNoiseColor()

    dathingZ = dathingZ + 1
    permutation = {}

    for i = 1, #tiles do
        x = tiles[i][3]
        y = tiles[i][4]

        light = (noise(x/smoothness, y/smoothness, dathingZ/smoothness))*-255
        light = math.floor(light)
        if light < 0 then
            light = 0
        end
        if light > 255 then
            light = 255
        end

        light = math.floor(light % 255)

        color = {light,0,light} --Change this for custom colors
        tilecolor = RGBtoHex(color)

        setProperty(tiles[i][1]..'.color', getColorFromHex('0xFF'..tilecolor))
    end

end

function onCreate()
    tileXsize = screenWidth/resX
    tileYsize = screenHeight/resY

    newSeed()
    drawPerlinShit()
end

function onUpdate(elp)
    timer = timer + elp
    if timer > 1/genFramerate then--Limit the generation fps
        timer = 0
        updateNoiseColor()
    end
end

function RGBtoHex(rgb)
    local hexadecimal = '' -- yeah ignore
    for key, value in pairs(rgb) do
        local hex = ''
        while(value > 0)do
            local index = math.fmod(value, 16) + 1
            value = math.floor(value / 16)
            hex = string.sub('0123456789ABCDEF', index, index) .. hex            
        end
        if(string.len(hex) == 0)then
            hex = '00'
        elseif(string.len(hex) == 1)then
            hex = '0' .. hex
        end
        hexadecimal = hexadecimal .. hex
    end
    return hexadecimal
end

function makeAgraphic(name, placeX, placeY, sizeX, sizeY, color)
    removeLuaSprite(name, true)
    makeLuaSprite(name, '', placeX, placeY)
    makeGraphic(name, sizeX, sizeY, color)
    setObjectCamera(name, 'other')
    addLuaSprite(name, true)
end

function noise(x, y, z)
    X = math.floor(x % 255)
    Y = math.floor(y % 255)
    Z = math.floor(z % 255)

    x = x - math.floor(x)
    y = y - math.floor(y)
    z = z - math.floor(z)

    u = fade(x)
    v = fade(y)
    w = fade(z)

    A   = p[X  ]+Y
    AA  = p[A]+Z
    AB  = p[A+1]+Z
    B   = p[X+1]+Y
    BA  = p[B]+Z
    BB  = p[B+1]+Z

    return lerp(w, lerp(v, lerp(u, grad(p[AA], x, y, z),
    grad(p[BA], x-1, y, z)),lerp(u, grad(p[AB], x, y-1, z),
    grad(p[BB], x-1, y-1, z))),lerp(v, lerp(u, grad(p[AA+1], x, y, z-1 ),
    grad(p[BA+1], x-1, y, z-1)),lerp(u, grad(p[AB+1], x, y-1, z-1 ),grad(p[BB+1], x-1, y-1, z-1 ))))
end


function fade(t)
    return t * t * t * (t * (t * 6 - 15) + 10)
end

function lerp(t,a,b)
    return a + t * (b - a)
end

function grad(hash,x,y,z)
    local h = hash % 16
    local u
    local v

    if (h<8) then u = x else u = y end
    if (h<4) then v = y elseif (h==12 or h==14) then v=x else v=z end
    local r

    if ((h%2) == 0) then r=u else r=-u end
    if ((h%4) == 0) then r=r+v else r=r-v end
    return r
end