-- Settings --

local hidePlayer = true

local visibleOp = true   -- Show it?

local pixelOp = false

local foreverComboCountOp = true

local ratingGrabOp = {'sick', 'good', 'bad', 'shit'}
local numPrefixOp = 'num'
local numSuffixOp = ''

local defaultPosRatingOp = {350, 440}   -- Positions it'll use | default numbers: 350, 440
local defaultPosNumOp = {380, 535}                           --| default numbers: 380, 535

local defaultPosRateGameOp = {nil, nil} -- Position for game cam
local defaultPosNumGameOp = {nil, nil}

local ratingScaleOp = {0.69, 0.69} -- DEFAULT: rating = 0.69, 0.69 | num = 0.5, 0.5
local numScaleOp = {0.5, 0.5}

local onPlayerComboOp = false

local camSetOp = 'hud'  -- Hud | Game | Other

local randGoods = false -- Makes some goods occasionally appear 
local randBads = false  -- Makes some bads occasionally appear         | Should you turn all these on? Probably not
local randShits = false -- Makes some shits occasionally appear 
local chanceGood
local chanceBad 
local chanceShit

local ratingSpecialOp = {'dodge'}   -- <example> | For special notes (optional) | mods/images or path please
local specialType = 'Bullet_Note'    -- <example> | What's the note type called

-- Modes --

local simpleModeOp = false

local stationaryModeOp = false

local hideRatingOp = false 
local hideNumsOp = false 


local colorRatingsOp = true -- Ratings based on which you get
local colorSyncingOp = true -- Rating takes color of direction pressed 
local colorFadeOp = true  -- Fade to base

local colorNumbersOp = true -- Same as above, but for numbers
local colorSyncNumsOp = true
local colorFadeNumsOp = true

-- Colors --

    -- For color modes --
 -- Best with base ratings --
 
    -- Chad Hex color please --

local sickColorOp = '68fafc'
local goodColorOp = '48f048'
local badColorOp = 'fffecb'
local baseColorOp = 'ffffff'    

local colorSync0Op = 'c24b99'
local colorSync1Op = '68fafc'
local colorSync2Op = '12fa05'
local colorSync3Op = 'f9393f'

-- ANIMATED RATINGS Settings --  
local ANIMATEDOP = false    -- Uses rating settings from up there

    -- If your ratings are all seperate. if not, just name them all the same
    local fileNamesOp = {'ratings/testRating', 'ratings/testRating', 'ratings/testRating', 'ratings/testRating'}         
    local animNamesOp = {'sick_', 'good_', 'bad_', 'shit_'}
    local animFrameRateOp = 60

    local animRatePosOp = {350, 440}
    local animRatePosGameOp = {nil, nil}
    local animRateOffstsOp = {490, 260} -- If "onPlayerCombo" and its not quite where you want
    local animRatScaleOp = {4, 4}   

    local veloctittyOp = true           -- Should it hop like the regular ratings
    local ratPixlOp = true              -- Is the rating pixelly
    local colorAnimOp = false           -- Color it like regular
    local singleAnimOp = false          -- Only one rating at a time
    local animFadeOp = true             -- Should it fade like regular ratings
        local initDelayOp = 0.2         -- Incase your rating fades before it completes the animation (How long it shows before the fade)

-- Dont touch these unless you know what you're doing | I don't sadly :(
local fakeCombo = 0
local thousOp = false   -- For the fourth digit to appear
local ehOp = 0          -- Make the sprites load in the way it does
--
local xAyyOp = 440 -- (exists just to shove the thing when you got combo of 1000)
local onceOp = false  -- for said option
local doThing = false

--------------------------------------------------------------------------|The Code Shit|---------------------------------------------------------------------------------------------
-----------------------------------------------------------------------|By Unholywanderer04|------------------------------------------------------------------------------------------

function onCreate() -- bbPantsZoo
    curver = 0

    bit = string.gsub(version,"%.","")
    curver = tonumber(bit)

    if curver >= 60 then 
        doThing = true
        --debugPrint('Doing thingggg')
    end
end

function onDestroy()
    if doThing == false then
        setPropertyFromClass('ClientPrefs', 'hideHud', false) -- (Fail Safe) So the stupid thing actually (hopefully) unhides once you complete a song >:(
    end
end

function onCreatePost()
    if getPropertyFromClass('PlayState', 'isPixelStage') == true then
        pixelOp = true
    end

        -- Can't call this stuff outside of a function so --
        -- Checks if BOTH values are nil. Why? just cause --

                    -- Rating game POS check --
    if defaultPosRateGameOp[1] == nil and defaultPosRateGameOp[2] == nil then
        defaultPosRateGameOp[1] = getProperty('gf.x') + 100
        defaultPosRateGameOp[2] = getProperty('gf.y') + 400
    end

                    -- Number game POS check --
    if defaultPosNumGameOp[1] == nil and defaultPosNumGameOp[2] == nil then
        defaultPosNumGameOp[1] = getProperty('gf.x') + 90
        defaultPosNumGameOp[2] = getProperty('gf.y') + 500
    end

                        -- Animated --
    if animRatePosGameOp[1] == nil and animRatePosGameOp[2] == nil then
        animRatePosGameOp[1] = getProperty('gf.x') + 100
        animRatePosGameOp[2] = getProperty('gf.y') + 400
    end
   
    -- Pixel shit, move this to onUpdate if you're gonna do sumthin wacky --
    -- But if it's for setting a stage, like the school, just keep it here --

    if pixelOp == true then
        ratingGrabOp[1] = 'pixelUI/sick-pixel' 
        ratingGrabOp[2] = 'pixelUI/good-pixel'
        ratingGrabOp[3] = 'pixelUI/bad-pixel' 
        ratingGrabOp[4] = 'pixelUI/shit-pixel'

        ratingScaleOp[1] = 5
        ratingScaleOp[2] = 5

        numPrefixOp = 'pixelUI/num'
        numSuffixOp = '-pixel'
        numScaleOp[1] = 5
        numScaleOp[2] = 5

        defaultPosRateGameOp[1] = getProperty('gf.x') - 150
        defaultPosRateGameOp[2] = getProperty('gf.y') + 150
        defaultPosNumGameOp[1] = getProperty('gf.x') - 150
        defaultPosNumGameOp[2] = getProperty('gf.y') + 250

        colorSync0Op = 'e276ff'
        colorSync1Op = '3dcaff'
        colorSync2Op = '71e300'
        colorSync3Op = 'ff884e'

        sickColorOp = '3dcaff'
        goodColorOp = '71e300'
    end

    if hidePlayer == true then -- getting rid of this crashes the game??? alright????
        --setPropertyFromClass('ClientPrefs', 'hideHud', true)
    end
end

function onUpdate()
    if hidePlayer == true then
        if doThing == true then
            setProperty('showRating', false)
            setProperty('showComboNum', false)
        else    
            setPropertyFromClass('ClientPrefs', 'hideHud', true) -- If you're gonna do cool rating shit, mess with it here
        end
    end

    if hidePlayer == false then
        if doThing == true then
            setProperty('showRating', true)
            setProperty('showComboNum', true)
        else
            setPropertyFromClass('ClientPrefs', 'hideHud', false)
        end
    end

    if constantGameCam == true then
        -- For your moving characters and things --
        if not pixel then
            defaultPosRateGameOp[1], defaultPosRateGameOp[2] = getProperty('gf.x') + 100, getProperty('gf.y') + 400
            defaultPosNumGameOp[1], defaultPosNumGameOp[2] = getProperty('gf.x') + 90, getProperty('gf.y') + 500

            animRatePosGameOp[1], animRatePosGameOp[2] = getProperty('gf.x') + 100, getProperty('gf.y') + 400
        end
    end

    if thousOp == true and onceOp == false and not foreverComboCountOp then     
        onceOp = true
        defaultPosNumOp[1] = defaultPosNumOp[1] + 20
        defaultPosNumGameOp[1] = defaultPosNumGameOp[1] + 20
        xAyyOp = xAyyOp + 20
    end

    if (getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.EIGHT')) and doThing == false then
        setPropertyFromClass('ClientPrefs', 'hideHud', false)
    end

    -- These are here for more randomness --
    chanceGood = math.random(1, 50)
    chanceBad = math.random(1, 65)
    chanceShit = math.random(1, 74)
end

function opponentNoteHit(id, direction, noteType, isSustainNote) 
    if visibleOp == true then
        comboOffset = getPropertyFromClass('ClientPrefs', 'comboOffset') -- rating offsets
        if not isSustainNote then

            if simpleModeOp == true then
                ehOp = 0 -- Keeps 'eh' at 0 so it can't spawn more than one at a time
            end

            hmmOp = getRating(nil, noteType, 'dad')

            if hideRatingOp == true then
                hmmOp = ''
            end

            anHmmOp = hmmOp
            ratingColoOp = ''
            ratiNumOp = 0

            if hmmOp == 'sick' then
                ratingColoOp = sickColorOp
                ratiNumOp = 1
            elseif hmmOp == 'good' then
                ratingColoOp = goodColorOp
                ratiNumOp = 2
            elseif hmmOp == 'bad' then
                ratingColoOp = badColorOp
                ratiNumOp = 3
            elseif hmmOp == 'shit' then
                ratingColoOp = baseColorOp
                ratiNumOp = 4
            else
                ratingColoOp = baseColorOp
                ratiNumOp = nil
            end

            grabbyOp = {colorSync0Op, colorSync1Op, colorSync2Op, colorSync3Op}
            thisOneOp = nil

            if colorRatingsOp == true and colorSyncingOp == false then
                thisOneOp = ratingColoOp
            elseif colorSyncingOp == true then
                thisOneOp = grabbyOp[direction+1]
            else
                thisOneOp = baseColorOp
            end

            if colorNumbersOp == true and colorSyncNumsOp == false then
                numUseOp = ratingColoOp
            elseif colorSyncNumsOp == true then
                numUseOp = grabbyOp[direction+1]
            else
                numUseOp = baseColorOp
            end

            -------------------------------Ratings---------------------------------------
            if ANIMATEDOP then
                animatedAss(hmmOp, 'dad')
            else
                if onPlayerComboOp == true and camSetOp == 'hud' then
                    if ratiNumOp ~= nil then
                        makeLuaSprite(hmmOp ..'lyOp' .. ehOp, ratingGrabOp[ratiNumOp], 400 + comboOffset[1], 230 - comboOffset[2])
                    end
                elseif camSetOp == 'game' then
                    if ratiNumOp ~= nil then
                        makeLuaSprite(hmmOp ..'lyOp' .. ehOp, ratingGrabOp[ratiNumOp], defaultPosRateGameOp[1], defaultPosRateGameOp[2])
                    end
                else
                    if ratiNumOp ~= nil then
                        makeLuaSprite(hmmOp ..'lyOp' .. ehOp, ratingGrabOp[ratiNumOp], defaultPosRatingOp[1], defaultPosRatingOp[2])
                    end
                end
                setProperty(hmmOp ..'lyOp'.. ehOp .. '.color', getColorFromHex(thisOneOp))
                setObjectCamera(hmmOp ..'lyOp' .. ehOp, camSetOp)
                setObjectOrder(hmmOp ..'lyOp' .. ehOp, getObjectOrder('strumLineNotes')-1)
                scaleObject(hmmOp ..'lyOp' .. ehOp, ratingScaleOp[1], ratingScaleOp[2])
                if pixelOp == true then
                    setProperty(hmmOp ..'lyOp' .. ehOp .. '.antialiasing', false)
                end
                addLuaSprite(hmmOp ..'lyOp' .. ehOp, true)
                if stationaryModeOp == false then
                    setProperty(hmmOp ..'lyOp' .. ehOp .. '.acceleration.y', 550)
                    setProperty(hmmOp ..'lyOp'.. ehOp ..'.velocity.x', math.random(0,10))
                    setProperty(hmmOp ..'lyOp'.. ehOp ..'.velocity.y', -180)
                end
                doTweenAlpha('nachotweenSickO' .. ehOp, hmmOp ..'lyOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.004), 'quartIn')
                if colorFadeOp == true then
                    doTweenColor('coolSOp' .. ehOp, hmmOp ..'lyOp' .. ehOp, baseColorOp, 0.2 + (stepCrochet * 0.002), 'quartIn')
                end
                if getProperty(hmmOp ..'lyOp'.. ehOp ..'.alpha') == 0 then
                    removeLuaSprite(hmmOp ..'lyOp'.. ehOp, false)
                end 
            end

            -------------------------------Special---------------------------------------

            -- example --
            if noteType == specialType then
                if onPlayerComboOp == true and camSetOp == 'hud' then
                    makeLuaSprite('speciallyOp' .. ehOp, ratingSpecialOp[1], 400 + comboOffset[1], 230 - comboOffset[2])
                elseif camSetOp == 'game' then
                    makeLuaSprite('speciallyOp' .. ehOp, ratingSpecialOp[1], defaultPosRateGameOp[1], defaultPosRateGameOp[2]) -- default position for game cam | change if you want
                else
                    makeLuaSprite('speciallyOp' .. ehOp, ratingSpecialOp[1], defaultPosRatingOp[1], defaultPosRatingOp[2])
                end
                setProperty('speciallyOp'.. ehOp .. '.color', getColorFromHex(baseColorOp)) -- change if ya want
                setObjectCamera('speciallyOp' .. ehOp, camSetOp)
                setObjectOrder('speciallyOp' .. ehOp, getObjectOrder('strumLineNotes')-1)
                scaleObject('speciallyOp' .. ehOp, ratingScaleOp[1], ratingScaleOp[2])
                --if pixel == true then -- if you actually have pixel versions, uncomment
                --    setProperty('speciallyOp' .. ehOp .. '.antialiasing', false)
                --end
                addLuaSprite('speciallyOp' .. ehOp, true)
                if stationaryModeOp == false then
                    setProperty('speciallyOp' .. ehOp .. '.acceleration.y', 550)
                    setProperty('speciallyOp'.. ehOp ..'.velocity.x', math.random(0,10))
                    setProperty('speciallyOp'.. ehOp ..'.velocity.y', -180)
                end
                doTweenAlpha('nachotweenSpecOp' .. ehOp, 'speciallyOp' .. ehOp, 0, 0.2 + (stepCrochet * 0.004), 'quartIn')
                if colorFadeOp == true then
                --    doTweenColor('coolSpecOp' .. ehOp, 'speciallyOp' .. ehOp, baseColorOp, 0.2 + (stepCrochet * 0.002), 'quartIn')
                end
                if getProperty('speciallyOp'.. ehOp ..'.alpha') == 0 then
                    removeLuaSprite('speciallyOp'.. ehOp, false)
                end 
            end

            ehOp = ehOp + 1 -- makes it look right
            if ehOp > 100 then
                ehOp = 0 
            end

            -------------------------------Counter---------------------------------------
            fakeCombo = fakeCombo + 1
            if fakeCombo > 9999 then
                fakeCombo = 9999 -- finally, fixed max value
            end

            fakeAssComboAss = {}

            unoOp = table.insert(fakeAssComboAss, ((fakeCombo % 10)))
            dosOp = table.insert(fakeAssComboAss, math.floor((fakeCombo / 10) % 10))
            thrOp = table.insert(fakeAssComboAss, math.floor((fakeCombo / 100) % 10))
            if fakeCombo >= 1000 then
                fuoOp = table.insert(fakeAssComboAss, math.floor((fakeCombo / 1000) % 10))
            end
            --------------------------------Numbers----------------------------------------

            if hideNumsOp == false then                    
                numCount = 1 -- 1
                if fakeCombo >= 10 then numCount = 2 end -- 01
                if fakeCombo >= 100 or foreverComboCountOp == false then numCount = 3 end -- 001
                if fakeCombo >= 1000 then numCount = 4 end -- 0001

                sequence = nil
                for i = 1, numCount do
                    if foreverComboCountOp then multBy = (((i + 2) - numCount) * 43) else multBy = ((i - 1) * 43) end -- spacing and spawning
                    sequence = numPrefixOp .. fakeAssComboAss[i] .. numSuffixOp
                
                    if onPlayerComboOp == true and camSetOp == 'hud' then
                        makeLuaSprite('numOp' .. ehOp .. i, sequence, xAyyOp + comboOffset[3] - multBy, 390 - comboOffset[4])
                    elseif camSet == 'game' then
                        makeLuaSprite('numOp' .. ehOp .. i, sequence, defaultPosNumGameOp[1] - multBy, defaultPosNumGameOp[2])
                    else
                        makeLuaSprite('numOp' .. ehOp .. i, sequence, defaultPosNumOp[1] - multBy, defaultPosNumOp[2])
                    end
                    setObjectCamera('numOp' .. ehOp .. i, camSetOp)
                    setProperty('numOp'.. ehOp .. i .. '.color', getColorFromHex(numUseOp))
                    setObjectOrder('numOp' .. ehOp .. i, getObjectOrder('strumLineNotes')-1)
                    if pixelOp then
                        setProperty('numOp' .. ehOp .. i .. '.antialiasing', false)
                    end
                    scaleObject('numOp' .. ehOp .. i, numScaleOp[1], numScaleOp[2])
                    addLuaSprite('numOp' .. ehOp .. i, true)
                    if stationaryModeOp == false then
                        setProperty('numOp' .. ehOp .. i .. '.acceleration.y', math.random(200, 400))
                        setProperty('numOp'.. ehOp .. i ..'.velocity.x', math.random(-5, 5))
                        setProperty('numOp'.. ehOp .. i ..'.velocity.y', math.random(-140, -160))
                    end
                    doTweenAlpha('nachotweenNumOpGo' .. ehOp .. i, 'numOp' .. ehOp .. i, 0, 0.2 + (stepCrochet * 0.008), 'quartIn')
                    if colorFadeNumsOp == true then
                        doTweenColor('itsjustafadOp' .. ehOp .. i, 'numOp' .. ehOp .. i, baseColorOp, 0.2 + (stepCrochet * 0.005), 'quartIn')
                    end
                end
            end
        end
    end
end

function animatedAss(rating, char)
    if char == 'dad' then
        fakeEhOp = ehOp
        if singleAnimOp == true then fakeEhOp = 0 end
        if onPlayerComboOp == true and camSetOp == 'hud' then
            if ratiNumOp ~= nil then
                makeAnimatedLuaSprite(anHmmOp ..'lyOp'.. fakeEhOp, fileNamesOp[ratiNumOp], animRateOffstsOp[1] + comboOffset[1], animRateOffstsOp[2] - comboOffset[2])
                addAnimationByPrefix(anHmmOp..'lyOp'.. fakeEhOp, 'yeah', animNamesOp[ratiNumOp], animFrameRateOp, false)
            end
        elseif camSetOp == 'game' then
            if ratiNumOp ~= nil then
                makeAnimatedLuaSprite(anHmmOp ..'lyOp'.. fakeEhOp, fileNamesOp[ratiNumOp], animRatePosGameOp[1], animRatePosGameOp[2])
                addAnimationByPrefix(anHmmOp..'lyOp'.. fakeEhOp, 'yeah', animNamesOp[ratiNumOp], animFrameRateOp, false)
            end
        else
            if ratiNumOp ~= nil then
                makeAnimatedLuaSprite(anHmmOp ..'lyOp'.. fakeEhOp, fileNamesOp[ratiNumOp], animRatePosOp[1], animRatePosOp[2])
                addAnimationByPrefix(anHmmOp..'lyOp'.. fakeEhOp, 'yeah', animNamesOp[ratiNumOp], animFrameRateOp, false)
            end
        end
        if colorAnimOp == true then
            setProperty(anHmmOp ..'lyOp'.. fakeEhOp .. '.color', getColorFromHex(thisOneOp))
        end
        setObjectCamera(anHmmOp ..'lyOp'.. fakeEhOp, camSetOp)
        setObjectOrder(anHmmOp ..'lyOp'.. fakeEhOp, getObjectOrder('strumLineNotes')-1)
        scaleObject(anHmmOp ..'lyOp'.. fakeEhOp, animRatScaleOp[1], animRatScaleOp[2])
        if doThing then playAnim(anHmmOp..'lyOp'.. fakeEhOp, 'yeah', false) else 
            objectPlayAnim(anHmmOp .. 'lyOp' .. fakeEhOp, 'yeah', false) end
        if ratPixlOp == true then
            setProperty(anHmmOp ..'lyOp'.. fakeEhOp ..'.antialiasing', false)
        end
        addLuaSprite(anHmmOp ..'lyOp'.. fakeEhOp, true)
        if veloctittyOp == true then
            setProperty(anHmmOp ..'lyOp'.. fakeEhOp ..'.acceleration.y', 550)
            setProperty(anHmmOp ..'lyOp'.. fakeEhOp ..'.velocity.x', math.random(0,10))
            setProperty(anHmmOp ..'lyOp'.. fakeEhOp ..'.velocity.y', -180)
        end
        if animFadeOp == true then
            doTweenAlpha('nachotweenAnimOpp' .. anHmmOp .. fakeEhOp, anHmmOp ..'lyOp' .. fakeEhOp, 0, initDelayOp + (stepCrochet * 0.004), 'quartIn')
        end
        if colorFadeOp == true and colorAnimOp == true then
            doTweenColor('coolAnimOp', anHmmOp ..'lyOp'.. fakeEhOp, baseColorOp, 0.2 + (stepCrochet * 0.002), 'quartIn')
        end
    end
end

----- BbPanzu >:) ----------

function getRating(diff, noteType, char)
    if char == 'dad' then
        if noteType == specialType then return '' end

        if chanceGood >= 48 and randGoods == true then
            return 'good'
        elseif chanceBad >= 63 and randBads == true then
            return 'bad'
        elseif chanceShit >= 72 and randShits == true then
            return 'shit'
        else
            return 'sick'
        end
    end
end