--Script made by Super_Hugo on Gamebanana

--Also this stage editor can only load images from "mods/images" or "mods/LOADED MOD/images"



---IF YOUR SPRITE DOESN'T LOAD---

-- If your image is in "mods/YOUR MOD/images" then load into a song from that mod and go to the editor,
-- if your image is in another place (example: "assets/images") move the image to "mods/images" then load to any song and go to the editor

--(this because the editor can't load custom images from the assets folder) oof



---INSTRUCTIONS---

-- 1- Put this script in the assets/scripts folder (if you don't have one just create it)
-- 2- Load to any song you want
-- 3- Press 9 to go to the stage editor



---ALL CONTROLS---

-- TAB - Save the script

-- ENTER or Left click - Place object
-- ALT + Left Click or Mouse right pressed + Left click - Delete object in front of the cursor
-- SHIFT + cursor on character - Move character position

-- Q / E - Select a property of the object (sprite, order...)
-- Z / X or CTRL - Change value of current property

-- Mouse scroll - Change screen zoom (if CTRL pressed change value of property)
-- Mouse or WASD - Move cursor
-- Arrow keys - Move screen position

-- ESCAPE or 9 - Exit stage editor
-- DELETE - Hide stage editor HUD



--NOTE: You can save the stage and press 9 and you will be in the stage you created.

--NOTE 2: If the game lags or crashes when loading the editor it's because it needs to restart the song two times to actually load the stage (if it crashes a lot change loadType to 'stage')

--NOTE 3: Tutorial on how to use the script is in the gamebanana mod page (https://gamebanana.com/mods/387037)


----------------------------------OPTIONS----------------------------------


overwriteFile = true		--if a file with same name exists, does it overwrite it?

stopRunningScripts = true		--stops any scripts from running so there aren't any conflicts (RECOMMENDED)

loadType = ''		--if 'empty' loads a blank template stage, if 'stage' loads the song stage (if you want to mess around with the stage or something), anything else loads the fileName stage



keyboardType = 'american'		--change this to the type of keyboard you use so the typing actually works ('american' / 'european' for now)

useKeyboardControls = false		--change this if you want to use the editor with keyboard instead of mouse (buggy for now, 'false' recommended)



saveLastStage = true		--if true saves the last stage you were editing to the fileName variable (for later loading the stage again, if loadType is '' or nil) [could mess up but im not sure]


------------------VARIABLES (DO NOT CHANGE ANYTHING HERE)------------------

local fileName = 'stage2'
local filePath = 'assets/stages'

local objects = {{}}
local stageData = {directory = '', defaultZoom = 0.9, boyfriend = {770, 100}, girlfriend = {400, 130}, opponent = {100, 100}, hide_girlfriend = 'false'}

local objProperties = {name = 'obj', sprite = 'combo', order = 10, camera = 'camGame', scale = 1, alpha = 1, scroll = 1, antialiasing = 'true', animated = 'false'}

local options = {'sprite', 'order', 'camera', 'scale', 'alpha', 'scroll', 'antialiasing'}
local curProperty = options[1]
local curPropertyNum = 1

local type = 0
local typedTxt = ''
local inEditor = false
local selected = 0

local objName = ''
local orCamera = 'camGame'
local orScroll = 1
local selectedCharacter = ''
local objPreviewType = 'obj'
local anims = {}
local isPixelStage = false

local allKeys = {'ONE', 'TWO', 'THREE', 'FOUR', 'FIVE', 'SIX', 'SEVEN', 'EIGHT', 'NINE', 'ZERO',
			 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P',
			 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L',
			 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 
			 'MINUS', 'SPACE', 'SLASH'}

local specialChars = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
				'', '', '', '', '', '', '', '', '', '',
				'', '', '', '', '', '', '', '', '',
			 	'', '', '', '', '', '', '',
				'-', ' ', '/'}

local camVarXL = 0
local camVarXR = 0
local camVarYU = 0
local camVarYD = 0



-----------------------------CODE AND STUFF-----------------------------

function onCreate()

	if getPropertyFromClass('PlayState', 'seenCutscene') == true then

		setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)

		makeLuaSprite('cursor', '', getMouseX(objProperties.camera), getMouseY(objProperties.camera))
		makeGraphic('cursor', 15, 15, 'ffffff')
		setObjectCamera('cursor', objProperties.camera)
		addLuaSprite('cursor', true)

		makeLuaSprite('objPreview', '', getMouseX(objProperties.camera), getMouseY(objProperties.camera))
		setObjectCamera('objPreview', objProperties.camera)
		loadGraphic('objPreview', objProperties.sprite)
		addLuaSprite('objPreview', true)

		makeLuaSprite('controlsBG', '', 815, 580)
		makeGraphic('controlsBG', 455, 170, '000000')
		setObjectCamera('controlsBG', 'other')
		addLuaSprite('controlsBG', true)

		makeLuaSprite('propertiesBG', '', 10, 670)
		makeGraphic('propertiesBG', 550, 50, '000000')
		setObjectCamera('propertiesBG', 'other')
		addLuaSprite('propertiesBG', true)

		makeLuaText('propertiesTxt', 'Property: Value', 2000, -715, 680)
		setTextSize('propertiesTxt', 30, 30)
		setTextAlignment('propertiesTxt', 'center')
		setObjectCamera('propertiesTxt', 'other')
		addLuaText('propertiesTxt', true)

		makeLuaText('stageTxt', '', 2000, 900, 30)
		setTextSize('stageTxt', 25, 25)
		setTextAlignment('stageTxt', 'left')
		setObjectCamera('stageTxt', 'other')
		addLuaText('stageTxt', true)

		makeLuaText('controlsTxt', '', 2000, 820, 580)
		setTextSize('controlsTxt', 25, 25)
		setTextAlignment('controlsTxt', 'left')
		setObjectCamera('controlsTxt', 'other')
		addLuaText('controlsTxt', true)

		makeLuaSprite('saveBG', '', 0, 0)
		makeGraphic('saveBG', screenWidth, screenHeight, '000000')
		setObjectCamera('saveBG', 'other')
		setProperty('saveBG.visible', false)
		setProperty('saveBG.alpha', 0.6)
		addLuaSprite('saveBG', true)

		makeLuaText('saveTxt', 'Script Name: '..fileName, 2000, 0, 0)
		setTextSize('saveTxt', 40, 40)
		setTextAlignment('saveTxt', 'center')
		setObjectCamera('saveTxt', 'other')
		screenCenter('saveTxt')
		setProperty('saveTxt.y', 300)
		setProperty('saveTxt.visible', false)
		addLuaText('saveTxt', true)

		makeLuaText('savePathTxt', 'Path: '..filePath, 2000, 0, 0)
		setTextSize('savePathTxt', 40, 40)
		setTextAlignment('savePathTxt', 'center')
		setObjectCamera('savePathTxt', 'other')
		screenCenter('savePathTxt')
		setProperty('savePathTxt.y', getProperty('saveTxt.y') + 100)
		setProperty('savePathTxt.visible', false)
		setProperty('savePathTxt.color', getColorFromHex('606060'))
		addLuaText('savePathTxt', true)

		if stopRunningScripts == true then

			a = getRunningScripts()
			for i = 1, #a do

				if string.find(a[i], scriptName:sub(-scriptName:reverse():find('/') + 1, -5)) == nil then
					removeLuaScript(a[i])
				end

			end

		end

		inEditor = true

	end

end

function onCreatePost()

	if getPropertyFromClass('PlayState', 'seenCutscene') == true then
	
		--Warning about file overwrite
		if overwriteFile == true then
			debugPrint('File overwrite is on. ', 'You can turn it off in the lua settings')
		else
			debugPrint('File overwrite is off.')
		end
		
		--Warning for versions that don't support HScript
		if versionToNumber(getPropertyFromClass("MainMenuState", "psychEngineVersion")) < 61 then
			debugPrint('')
			debugPrint('')
			debugPrint([[
			- Your Psych Engine version can't run HScript. (you need v0.6.1+)
			- Update if you want to load saved stages and modify them.
			]])
			loadType = 'empty'
		end

		setProperty('debugKeysChart', null)
		setProperty('debugKeysCharacter', null)

		setProperty('healthBar.visible', false)
		setProperty('healthBarBG.visible', false)
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
		setProperty('scoreTxt.visible', false)
		setProperty('timeBar.visible', false)
		setProperty('timeBarBG.visible', false)
		setProperty('timeTxt.visible', false)

		stageData.boyfriend = {getProperty('boyfriend.x'), getProperty('boyfriend.y')}
		stageData.opponent = {getProperty('dad.x'), getProperty('dad.y')}
		stageData.girlfriend = {getProperty('gf.x'), getProperty('gf.y')}

		if loadType == 'empty' or loadType == 'blank' then

			setPropertyFromClass('PlayState', 'SONG.stage', '*')

			if not (getPropertyFromClass('PlayState', 'curStage') == '*') then

				setProperty('camGame.alpha', 0)
				setProperty('camHUD.alpha', 0)
				setProperty('camOther.alpha', 0)

				wait(2) --maybe fixes some crashes?

				restartSong(false)

			end

		elseif not (loadType == 'stage') and not (fileName == '' or fileName == nil) then

			setPropertyFromClass('PlayState', 'SONG.stage', fileName)

			if not (getPropertyFromClass('PlayState', 'curStage') == fileName) then

				setProperty('camGame.alpha', 0)
				setProperty('camHUD.alpha', 0)
				setProperty('camOther.alpha', 0)

				wait(2)

				restartSong(false)

			end

		end
		
		
		--change filePath to the loaded mod images path
		if not (getPropertyFromClass('Paths', 'currentModDirectory') == '') then
		
			if filePath == 'assets/stages' or filePath == 'mods/stages' then
				filePath = 'mods/'..getPropertyFromClass('Paths', 'currentModDirectory')..'/stages'
			end
			
		else
			setPropertyFromClass('Paths', 'currentModDirectory', '')
		end
		
		
		--change to pixel stage (for now until I make a menu or something for pixel stages)
		if getProperty('boyfriend.antialiasing') == false and getProperty('dad.antialiasing') == false then
			isPixelStage = true
		else
			isPixelStage = false
		end

	end

end

--it actually lags the game until its done lmao
function wait(seconds)
	local start = os.time()
	repeat until os.time() > start + seconds
end

--fixes a weird cursor movement
function onUpdatePost()

	if inEditor == true then

		oldMouseX = math.floor(getMouseX(objProperties.camera))
		oldMouseY = math.floor(getMouseY(objProperties.camera))

		if versionToNumber(getPropertyFromClass("MainMenuState", "psychEngineVersion")) >= 61 then
		
			--adds the loaded objects
			--the second value is the object load limit
			for i = 1, 300 do

				if luaSpriteExists('obj'..i) then

					local contains = false

					for ii = 1, #objects do

						if objects[ii].obj == 'obj'..i then
							contains = true
						end

					end

					if contains == false then

						addObjectToEditor('obj'..(i))
						objects[#objects + 1] = {}

						--debugPrint('obj'..(i))

					end
					
					contains = false

				end

			end
		
		end

	end

end

function onUpdate()

	if inEditor == true then
	
		setProperty('camZooming', false);

		if useKeyboardControls == false then
			reloadCursorPos(true)
		end

		setObjectCamera('cursor', objProperties.camera)
		setObjectOrder('cursor', 99999)
		setScrollFactor('cursor', objProperties.scroll, objProperties.scroll)

		setProperty('objPreview.x', getProperty('cursor.x'))
		setProperty('objPreview.y', getProperty('cursor.y'))
		setScrollFactor('objPreview', objProperties.scroll, objProperties.scroll)
		scaleObject('objPreview', objProperties.scale, objProperties.scale)
		setObjectOrder('objPreview', objProperties.order)
		setObjectCamera('objPreview', objProperties.camera)
		if type == 0 or type == 1 then
			setProperty('objPreview.alpha', objProperties.alpha)
		end
		--setProperty('objPreview.color', getColorFromHex('AAAAFF'))
		setProperty('objPreview.antialiasing', toboolean(objProperties.antialiasing))

		setProperty('controlsBG.alpha', getProperty('controlsTxt.alpha') - 0.5)
		setProperty('propertiesBG.alpha', getProperty('propertiesTxt.alpha') - 0.5)


		--STAGE STUFF
		stageData.defaultZoom = getPropertyFromClass('flixel.FlxG', 'camera.zoom')

		setProperty('boyfriend.x', stageData.boyfriend[1])
		setProperty('boyfriend.y', stageData.boyfriend[2])
		setProperty('dad.x', stageData.opponent[1])
		setProperty('dad.y', stageData.opponent[2])
		setProperty('gf.x', stageData.girlfriend[1])
		setProperty('gf.y', stageData.girlfriend[2])

		setTextString('stageTxt', 'defaultZoom = '..stageData.defaultZoom..'\nboyfriend = ['..stageData.boyfriend[1]..', '..stageData.boyfriend[2]..']\ngirlfriend = ['..stageData.girlfriend[1]..', '..stageData.girlfriend[2]..']\nopponent = ['..stageData.opponent[1]..', '..stageData.opponent[2]..']')

		checkAnimatedProperty(objProperties.sprite)

		if type == 0 then

			setTextString('propertiesTxt', '[Q]'..' < '..curProperty..': '..objProperties[curProperty]..' > '..'[E]')

			if objProperties.sprite == '' or objProperties.sprite == nil then
				setProperty('objPreview.visible', false)
			else
				setProperty('objPreview.visible', true)
			end


			--CHANGE PROPERTY STUFF
			if curProperty == 'sprite' or curProperty == 'antialiasing' or curProperty == 'camera' then	
				setTextString('controlsTxt', 'CONTROLS: \nTAB - Save Script \nENTER or Click - Place Object \nALT + Click - Delete Object \nCTRL - Change Value \n(All controls are on Lua file)')
			else
				setTextString('controlsTxt', 'CONTROLS: \nTAB - Save Script \nENTER or Click - Place Object \nALT + Click - Delete Object \nZ or X - Change Value \n(All controls are on Lua file)')
			end

			if getProperty('objPreview.visible') == false then
				setProperty('propertiesTxt.color', getColorFromHex('606060'))
			end


			--ADD OBJECTS
			if (mouseClicked() or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER')) and not (objProperties.sprite == '') then

				--change name of object based on how many objects there are so it doesn't overwrite other objects
				if objProperties.name == 'obj' then

					objName = 'obj'..(#objects)

					for i = 1, #objects-1 do

						if luaSpriteExists('obj'..(i)) == false then
							objName = 'obj'..(i)
							break
						end

					end

					if luaSpriteExists(objName) then
						objName = 'obj'..(#objects + 1)
					end

				--change the name of the object to the saved name (there is no saved name for now lol)
				else

					objName = objProperties.name

					if luaSpriteExists(objProperties.name) == true then

						debugPrint('An object with same name already exists.')

						for i = 1, #objects-1 do

							if luaSpriteExists('obj'..(i)) == false then
								objName = 'obj'..(i)
								break
							end

						end

						if luaSpriteExists(objName) then
							objName = 'obj'..(#objects + 1)
						end

					end

				end


				--add object
				if objProperties.animated == 'true' then
					makeAnimatedLuaSprite(objName, objProperties.sprite, getProperty('cursor.x'), getProperty('cursor.y'))
				else
					makeLuaSprite(objName, objProperties.sprite, getProperty('cursor.x'), getProperty('cursor.y'))
				end


				--set properties
				setObjectCamera(objName, objProperties.camera)
				setObjectOrder(objName, objProperties.order)
				scaleObject(objName, objProperties.scale, objProperties.scale)
				setScrollFactor(objName, objProperties.scroll, objProperties.scroll)
				setProperty(objName..'.alpha', objProperties.alpha)
				setProperty(objName..'.antialiasing', toboolean(objProperties.antialiasing))
				addLuaSprite(objName, true)
				
				add = addObjectToEditor(objName)
				
				if not (add == 'error') then
					--next object
					objects[#objects + 1] = {}
				end
				
			end


			--change properties
			if not (getPropertyFromClass('flixel.FlxG', 'mouse.wheel') == 0) then

				if getPropertyFromClass('flixel.FlxG', 'keys.pressed.CONTROL') and not (curProperty == 'camera') then
					changeProperty(curProperty, 'mouse')
				end

			end

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.CONTROL') then
				setProperty('propertiesTxt.color', getColorFromHex('0096FF'))

			elseif getPropertyFromClass('flixel.FlxG', 'keys.released.CONTROL') then
				setProperty('propertiesTxt.color', getColorFromHex('FFFFFF'))
			end

			
			--change current property value
			if (getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.X')) and not (curProperty == 'camera') then
				changeProperty(curProperty, 'key')
			end

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.CONTROL') then 

				if curProperty == 'antialiasing' then
					objProperties.antialiasing = tostring(not toboolean(objProperties.antialiasing))

				elseif curProperty == 'camera' then
					changeProperty('camera', 'key')

				elseif curProperty == 'sprite' then
					type = 1
					--typedTxt = ''
					debugPrint('Typing..')
				end

			end


			--change property
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Q') then

				curPropertyNum = curPropertyNum - 1
				if curPropertyNum < 1 then
					curPropertyNum = #options
				end
				curProperty = options[curPropertyNum]

			end

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then

				curPropertyNum = curPropertyNum + 1
				if curPropertyNum > #options then
					curPropertyNum = 1
				end
				curProperty = options[curPropertyNum]

			end


			--other controls
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') then
				type = 2
			end

			if getPropertyFromClass('flixel.FlxG', 'keys.pressed.ALT') or mousePressed('right') then
				type = 3
			end

			if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
				orCamera = objProperties.camera
				orScroll = objProperties.scroll

				objProperties.camera = 'camGame'
				objProperties.scroll = 1
				reloadCursorPos(false)
				
				type = 4
			end

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') then
				inEditor = false

				exitSong(false)

				if saveLastStage == true and not (fileName == '' or fileName == nil) then saveFileName() end
			end

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.R') then
				restartSong(false)
				if saveLastStage == true and not (fileName == '' or fileName == nil) then saveFileName() end
			end



		--CHANGE OBJECT SPRITE
		elseif type == 1 then

			curProperty = 'sprite'

			setTextString('propertiesTxt', '[Q]'..' < '..curProperty..': '..typedTxt..' > '..'[E]')

			setProperty('propertiesTxt.color', getColorFromHex('0096FF'))


			--KEYS
			for i = 1, #allKeys do

				if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.'..allKeys[i]) then

					--SPECIAL CHARACTERS
					if #allKeys[i] > 1 then

						if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
	
							if keyboardType:lower() == 'european' then

								if allKeys[i] == 'SEVEN' then
									typedTxt = typedTxt..'/'

								elseif allKeys[i] == 'EIGHT' then
									typedTxt = typedTxt..'('

								elseif allKeys[i] == 'NINE' then
									typedTxt = typedTxt..')'

								elseif allKeys[i] == 'MINUS' then
									typedTxt = typedTxt..'_'

								else
									typedTxt = typedTxt..specialChars[i]
								end

							else

								if allKeys[i] == 'NINE' then
									typedTxt = typedTxt..'('

								elseif allKeys[i] == 'ZERO' then
									typedTxt = typedTxt..')'

								elseif allKeys[i] == 'MINUS' then
									typedTxt = typedTxt..'_'

								else
									typedTxt = typedTxt..specialChars[i]
								end
								
							end

						else
							typedTxt = typedTxt..specialChars[i]
						end

					else

						if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
							typedTxt = typedTxt..allKeys[i]:upper()
						else
							typedTxt = typedTxt..allKeys[i]:lower()
						end

					end

				end

			end


			--DELETE TYPED STUFF
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.BACKSPACE') then
				typedTxt = typedTxt:sub(1, -2)
			end


			--EXIT
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') or mouseClicked('right') then
				type = 0
				typedTxt = objProperties.sprite
				debugPrint('Exiting Typing..')
			end


			--EXIT AND LOAD
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') then

				type = 0

				setProperty('objPreview.visible', false)

				debugPrint('Exiting Typing and Loading Sprite..')


				if not (typedTxt == '' or typedTxt == nil) then

					local sprpath = ''

					if not (getPropertyFromClass('Paths', 'currentModDirectory') == '') then
					
						sprpath = 'mods/'..getPropertyFromClass('Paths', 'currentModDirectory')..'/images/'..typedTxt..'.png'

						if checkFileExists(sprpath, true) == false then
							sprpath = 'assets/shared/images/'..typedTxt..'.png'
						end
						
						if checkFileExists(sprpath, true) == false then
							sprpath = 'mods/images/'..typedTxt..'.png'
						end
						
					else
					
						sprpath = 'assets/shared/images/'..typedTxt..'.png'
						
						if checkFileExists(sprpath, true) == false then
							sprpath = 'mods/images/'..typedTxt..'.png'
						end
						
					end


					if checkFileExists(sprpath, true) == false then
						debugPrint('Error loading sprite')
						typedTxt = objProperties.sprite
					else
					
						setProperty('objPreview.visible', true)
						objProperties.sprite = typedTxt

						checkAnimatedProperty(objProperties.sprite)

						if objProperties.animated == 'true' then
							reloadPreviewSprite('anim')
						else
							reloadPreviewSprite('obj')
						end
						--loadGraphic('objPreview', objProperties.sprite)
						
					end

				end

			end


		--SAVING
		elseif type == 2 then

			setProperty('saveBG.visible', true)
			setProperty('saveTxt.visible', true)
			setProperty('savePathTxt.visible', true)

			setProperty('objPreview.visible', false)
			setProperty('cursor.visible', false)

			setTextString('saveTxt', 'Script Name: '..fileName)
			setTextString('savePathTxt', 'Path: '..filePath)



			if selected == 0 then
				setProperty('saveTxt.color', getColorFromHex('FFFFFF'))
				setProperty('savePathTxt.color', getColorFromHex('606060'))
			else
				setProperty('saveTxt.color', getColorFromHex('606060'))
				setProperty('savePathTxt.color', getColorFromHex('FFFFFF'))
			end



			--KEYS
			for i = 1, #allKeys do

				if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.'..allKeys[i]) then

					--SPECIAL CHARACTERS
					if #allKeys[i] > 1 then

						if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
	
							if keyboardType:lower() == 'european' then

								if allKeys[i] == 'SEVEN' then
									if selected == 0 then
										fileName = fileName..'/'
									else
										filePath = filePath..'/'
									end

								elseif allKeys[i] == 'EIGHT' then
									if selected == 0 then
										fileName = fileName..'('
									else
										filePath = filePath..'('
									end

								elseif allKeys[i] == 'NINE' then
									if selected == 0 then
										fileName = fileName..')'
									else
										filePath = filePath..')'
									end

								elseif allKeys[i] == 'MINUS' then
									if selected == 0 then
										fileName = fileName..'_'
									else
										filePath = filePath..'_'
									end

								else
									if selected == 0 then
										fileName = fileName..specialChars[i]
									else
										filePath = filePath..specialChars[i]
									end
								end

							else

								if allKeys[i] == 'NINE' then
									if selected == 0 then
										fileName = fileName..'('
									else
										filePath = filePath..'('
									end

								elseif allKeys[i] == 'ZERO' then
									if selected == 0 then
										fileName = fileName..')'
									else
										filePath = filePath..')'
									end

								elseif allKeys[i] == 'MINUS' then
									if selected == 0 then
										fileName = fileName..'_'
									else
										filePath = filePath..'_'
									end

								else
									if selected == 0 then
										fileName = fileName..specialChars[i]
									else
										filePath = filePath..specialChars[i]
									end
								end
								
							end

						else
							if selected == 0 then
								fileName = fileName..specialChars[i]
							else
								filePath = filePath..specialChars[i]
							end
						end

					else

						if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
							if selected == 0 then
								fileName = fileName..allKeys[i]:upper()
							else
								filePath = filePath..allKeys[i]:upper()
							end
						else
							if selected == 0 then
								fileName = fileName..allKeys[i]:lower()
							else
								filePath = filePath..allKeys[i]:lower()
							end
						end

					end

				end

			end



			--DELETE TYPED STUFF
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.BACKSPACE') then
				if selected == 0 then
					fileName = fileName:sub(1, -2)
				else
					filePath = filePath:sub(1, -2)
				end
			end



			--EXIT
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') then
				setProperty('saveBG.visible', false)
				setProperty('saveTxt.visible', false)
				setProperty('savePathTxt.visible', false)

				setProperty('objPreview.visible', true)
				setProperty('cursor.visible', true)

				type = 0
			end



			--EXIT AND LOAD
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') then
				type = 0
				setProperty('saveBG.visible', false)
				setProperty('saveTxt.visible', false)
				setProperty('savePathTxt.visible', false)

				setProperty('objPreview.visible', true)
				setProperty('cursor.visible', true)

				saveStageFile(overwriteFile)
			end



			--CHANGE SELECTION
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') then
				if selected == 0 then
					selected = 1
				else selected = 0 end
			end

		
		--DELETE OBJECTS
		elseif type == 3 then

			setProperty('objPreview.visible', false)
			setProperty('cursor.color', getColorFromHex('FF0000'))

			if mouseClicked() or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') then

				if #objects > 0 then

					for i = 1, #objects-1 do

						if not (objects[i] == nil or objects[i] == {}) then

							if objProperties.camera == objects[i].camera then

								if objectCollision('cursor', objects[i].obj) == true then
									removeLuaSprite(objects[i].obj, true)
									debugPrint('Removed: ', objects[i].obj)
									table.remove(objects, i)
								end

							end

						end

					end

				end

			end

			--EXIT
			if getPropertyFromClass('flixel.FlxG', 'keys.justReleased.ALT') or mouseReleased('right') then
				setProperty('objPreview.visible', true)
				setProperty('cursor.color', getColorFromHex('FFFFFF'))
				type = 0
			end


		--MOVE CHARACTERS
		elseif type == 4 then

			setProperty('cursor.color', getColorFromHex('0096FF'))
			setProperty('objPreview.visible', false)
			objProperties.camera = 'camGame'
			objProperties.scroll = 1

			if selectedCharacter == '' then

				if objectCollision('cursor', 'gf') == true then
					selectedCharacter = 'gf'
				end

				if objectCollision('cursor', 'dad') == true then
					selectedCharacter = 'dad'
				end

				if objectCollision('cursor', 'boyfriend') == true then
					selectedCharacter = 'boyfriend'
				end

			end

			if not (selectedCharacter == '') then

				if selectedCharacter == 'dad' then
					stageData['opponent'][1] = math.floor(getProperty('cursor.x') - getProperty('dad._frame.frame.width') * 0.5)
					stageData['opponent'][2] = math.floor(getProperty('cursor.y') - getProperty('dad._frame.frame.height') * 0.5)

				elseif selectedCharacter == 'gf' then
					stageData['girlfriend'][1] = math.floor(getProperty('cursor.x') - getProperty('gf._frame.frame.width') * 0.5)
					stageData['girlfriend'][2] = math.floor(getProperty('cursor.y') - getProperty('gf._frame.frame.height') * 0.5)

				else
					stageData['boyfriend'][1] = math.floor(getProperty('cursor.x') - getProperty('boyfriend._frame.frame.width') * 0.5)
					stageData['boyfriend'][2] = math.floor(getProperty('cursor.y') - getProperty('boyfriend._frame.frame.height') * 0.5)
				end

			end

			--EXIT
			if getPropertyFromClass('flixel.FlxG', 'keys.released.SHIFT') then
				setProperty('objPreview.visible', true)
				setProperty('cursor.color', getColorFromHex('FFFFFF'))

				objProperties.camera = orCamera
				objProperties.scroll = orScroll

				reloadCursorPos(false)

				selectedCharacter = ''
				type = 0
			end

		end

		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.NINE') and type == 0 then

			setPropertyFromClass('PlayState', 'seenCutscene', false)
			inEditor = false

			setPropertyFromClass('PlayState', 'SONG.stage', fileName)

			restartSong(false)

			if saveLastStage == true and not (fileName == '' or fileName == nil) then saveFileName() end

		end

		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DELETE') then

			--loadStageFile(filePath..fileName)

			if getProperty('propertiesTxt.alpha') == 0 then
				setProperty('propertiesTxt.alpha', 1)
				setProperty('objPreview.alpha', 1)
				--setProperty('cursor.alpha', 1)
				setProperty('controlsTxt.alpha', 1)
				setProperty('stageTxt.alpha', 1)
			else
				setProperty('propertiesTxt.alpha', 0)
				setProperty('objPreview.alpha', 0)
				--setProperty('cursor.alpha', 0)
				setProperty('controlsTxt.alpha', 0)
				setProperty('stageTxt.alpha', 0)
			end

		end


		if type == 0 or type == 4 then

			--MOVE MOUSE WITH KEYS
			if useKeyboardControls == true then
			
				if getPropertyFromClass('flixel.FlxG', 'keys.pressed.A') then
					setProperty('cursor.x', getProperty('cursor.x') - 10)
				end

				if getPropertyFromClass('flixel.FlxG', 'keys.pressed.D') then
					setProperty('cursor.x', getProperty('cursor.x') + 10)
				end

				if getPropertyFromClass('flixel.FlxG', 'keys.pressed.W') then
					setProperty('cursor.y', getProperty('cursor.y') - 10)
				end

				if getPropertyFromClass('flixel.FlxG', 'keys.pressed.S') then
					setProperty('cursor.y', getProperty('cursor.y') + 10)
				end

			end

		

			--CAMERA STUFF
			if getPropertyFromClass('flixel.FlxG', 'keys.pressed.LEFT') then
				camVarXL = -10
			elseif getPropertyFromClass('flixel.FlxG', 'keys.released.LEFT') then
				camVarXL = 0
			end

			if getPropertyFromClass('flixel.FlxG', 'keys.pressed.RIGHT') then
				camVarXR = 10
			elseif getPropertyFromClass('flixel.FlxG', 'keys.released.RIGHT') then
				camVarXR = 0
			end

			if getPropertyFromClass('flixel.FlxG', 'keys.pressed.UP') then
				camVarYU = -10
			elseif getPropertyFromClass('flixel.FlxG', 'keys.released.UP') then
				camVarYU = 0
			end

			if getPropertyFromClass('flixel.FlxG', 'keys.pressed.DOWN') then
				camVarYD = 10
			elseif getPropertyFromClass('flixel.FlxG', 'keys.released.DOWN') then
				camVarYD = 0
			end

			setProperty('camFollow.x', getProperty('camFollow.x') + (camVarXR + camVarXL))
			setProperty('camFollow.y', getProperty('camFollow.y') + (camVarYD + camVarYU))


			--CHANGE CAMERA ZOOM
			if not (getPropertyFromClass('flixel.FlxG', 'mouse.wheel') == 0) then

				if not (getPropertyFromClass('flixel.FlxG', 'keys.pressed.CONTROL')) then
					setPropertyFromClass('flixel.FlxG', 'camera.zoom', getPropertyFromClass('flixel.FlxG', 'camera.zoom') + (getPropertyFromClass('flixel.FlxG', 'mouse.wheel') / 20))
				end

			end

		end

	else	

		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.NINE') then
			setPropertyFromClass('PlayState', 'seenCutscene', true)
			inEditor = true
			restartSong(false)
		end

	end

end

function changeProperty(property, type)

	if property == 'order' then

		if type == 'mouse' then
			objProperties.order = objProperties.order + getPropertyFromClass('flixel.FlxG', 'mouse.wheel')
		else

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.X') then
				objProperties.order = objProperties.order + 1
			end

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then
				objProperties.order = objProperties.order - 1
			end

		end

		if objProperties.order < 0 then
			objProperties.order = 0
		end
		return

	elseif property == 'camera' then

		if objProperties.camera == 'camGame' then objProperties.camera = 'camHUD' reloadCursorPos(false) return end
		if objProperties.camera == 'camHUD' then objProperties.camera = 'camOther' reloadCursorPos(false) return end
		if objProperties.camera == 'camOther' then objProperties.camera = 'camGame' reloadCursorPos(false) return end

	elseif property == 'scale' then

		if type == 'mouse' then
			objProperties.scale = objProperties.scale + getPropertyFromClass('flixel.FlxG', 'mouse.wheel') / 10
		else

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.X') then
				objProperties.scale = objProperties.scale + 0.1
			end

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then
				objProperties.scale = objProperties.scale - 0.1
			end

		end

		if objProperties.scale <= 0.1 then

			if type == 'mouse' then

				if getPropertyFromClass('flixel.FlxG', 'mouse.wheel') == -1 then
					objProperties.scale = 0
				end

			else

				if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then
					objProperties.scale = 0
				end

			end

		end
		return

	elseif property == 'scroll' then

		if type == 'mouse' then
			objProperties.scroll = objProperties.scroll + getPropertyFromClass('flixel.FlxG', 'mouse.wheel') / 10
			reloadCursorPos(false)
		else

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.X') then
				objProperties.scroll = objProperties.scroll + 0.1
			end

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then
				objProperties.scroll = objProperties.scroll - 0.1
			end
			reloadCursorPos(false)

		end

		if objProperties.scroll <= 0.1 then

			if type == 'mouse' then

				if getPropertyFromClass('flixel.FlxG', 'mouse.wheel') == -1 then
					objProperties.scroll = 0
				end

			else

				if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then
					objProperties.scroll = 0
				end

			end

		end
		return

	elseif property == 'alpha' then

		if type == 'mouse' then
			objProperties.alpha = objProperties.alpha + getPropertyFromClass('flixel.FlxG', 'mouse.wheel') / 10
		else

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.X') then
				objProperties.alpha = objProperties.alpha + 0.1
			end

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then
				objProperties.alpha = objProperties.alpha - 0.1
			end

		end

		--fix strange e- thing in the value
		if objProperties.alpha >= 0.9 then

			if type == 'mouse' then

				if getPropertyFromClass('flixel.FlxG', 'mouse.wheel') == 1 then
					objProperties.alpha = 1
				end

			else

				if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.X') then
					objProperties.alpha = 1
				end

			end

		end

		if objProperties.alpha <= 0.1 then

			if type == 'mouse' then

				if getPropertyFromClass('flixel.FlxG', 'mouse.wheel') == -1 then
					objProperties.alpha = 0
				end

			else

				if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') then
					objProperties.alpha = 0
				end

			end

		end
		return

	end
end

function saveStageFile(overwrite)

	local rawcontent = [[
--made with Super_Hugo's Stage Editor

function onCreate()
]]

	if #objects > 1 then

		for i = 1, #objects-1 do

			if not (objects[i] == nil or objects[i] == {}) then

				if (objects[i].anims == nil or objects[i].anims == '') then

	rawcontent = rawcontent..[[

	makeLuaSprite(']]..(objects[i].obj)..[[', ']]..(objects[i].sprite)..[[', ]]..(math.floor(objects[i].x))..[[, ]]..(math.floor(objects[i].y))..[[)

]]

				else

	rawcontent = rawcontent..[[

	makeAnimatedLuaSprite(']]..(objects[i].obj)..[[', ']]..(objects[i].sprite)..[[', ]]..(math.floor(objects[i].x) - getProperty(objects[i].obj..'.offset.x'))..[[, ]]..(math.floor(objects[i].y) - getProperty(objects[i].obj..'.offset.y'))..[[)

]]
				end
				
				if not (objects[i].camera == 'camGame') then

	rawcontent = rawcontent..[[
	setObjectCamera(']]..(objects[i].obj)..[[', ']]..(objects[i].camera)..[[')
]]

				end

	rawcontent = rawcontent..[[
	setObjectOrder(']]..(objects[i].obj)..[[', ]]..(objects[i].order)..[[)
]]

				if not (objects[i].scale == 1) then

	rawcontent = rawcontent..[[
	scaleObject(']]..(objects[i].obj)..[[', ]]..(objects[i].scale)..[[, ]]..(objects[i].scale)..[[)
]]

				end

				if not (objects[i].scroll == 1) then

	rawcontent = rawcontent..[[
	setScrollFactor(']]..(objects[i].obj)..[[', ]]..(objects[i].scroll)..[[, ]]..(objects[i].scroll)..[[)
]]

				end

				if not (objects[i].alpha == 1) then

	rawcontent = rawcontent..[[
	setProperty(']]..(objects[i].obj)..[[.alpha', ]]..(objects[i].alpha)..[[)
]]

				end

				if not (objects[i].antialiasing == 'true') then

	rawcontent = rawcontent..[[
	setProperty(']]..(objects[i].obj)..[[.antialiasing', ]]..(objects[i].antialiasing)..[[)
]]

				end

				if not (objects[i].anims == nil) then

	rawcontent = rawcontent..[[

]]

					for ii = 1, #objects[i].anims do

	rawcontent = rawcontent..[[
	addAnimationByPrefix(']]..(objects[i].obj)..[[', 'anim]]..ii..[[', ']]..(objects[i].anims[ii])..[[', 24, true)
]]

					end

	rawcontent = rawcontent..[[

	playAnim(']]..(objects[i].obj)..[[', 'anim1', true)
]]

				end

	rawcontent = rawcontent..[[

	addLuaSprite(']]..(objects[i].obj)..[[', true)

]]

			end

		end

	end

	rawcontent = rawcontent..'end'

	rawcontent2 = [[
{
	"directory": "]]..stageData.directory..[[",
	"defaultZoom": ]]..stageData.defaultZoom..[[,
	"isPixelStage": ]]..tostring(isPixelStage)..[[,

	"boyfriend": []]..(stageData.boyfriend[1] - getProperty('boyfriend.positionArray')[1])..[[, ]]..(stageData.boyfriend[2] - getProperty('boyfriend.positionArray')[2])..[[],
	"girlfriend": []]..(stageData.girlfriend[1] - getProperty('gf.positionArray')[1])..[[, ]]..(stageData.girlfriend[2] - getProperty('gf.positionArray')[2])..[[],
	"opponent": []]..(stageData.opponent[1] - getProperty('dad.positionArray')[1])..[[, ]]..(stageData.opponent[2] - getProperty('dad.positionArray')[2])..[[],
	"hide_girlfriend": ]]..stageData.hide_girlfriend..[[

}]]

	debugPrint('')

	if #objects > 1 then
	
		if overwrite == true then

			if checkFileExists(filePath..'/'..fileName..'.lua', true) == true then
				deleteFile(filePath..'/'..fileName..'.lua', true)
				debugPrint('- Overwrote file with same name: ', fileName..'.lua')
			end

			saveFile(filePath..'/'..fileName..'.lua', rawcontent, true)
		
			if checkFileExists(filePath..'/'..fileName..'.lua', true) == true then
				debugPrint('Lua file saved in: ', filePath..'/'..fileName..'.lua')
			else
				saveFile('assets/stages/'..fileName..'.lua', rawcontent, true)
				debugPrint('Lua saved in another folder due to an error: ', 'assets/stages/'..fileName..'.lua')
			end

		elseif overwrite == false then

			if checkFileExists(filePath..'/'..fileName..'.lua', true) == true then
				debugPrint('There is already a file with same name in: ', filePath..'/'..fileName..'.lua')
				return
			
			else
		
				saveFile(filePath..'/'..fileName..'.lua', rawcontent, true)
			
				if checkFileExists(filePath..'/'..fileName..'.lua', true) == true then
					debugPrint('Lua file saved in: ', filePath..'/'..fileName..'.lua')
				else
					saveFile('assets/stages/'..fileName..'.lua', rawcontent, true)
					debugPrint('Lua saved in another folder due to an error: ', 'assets/stages/'..fileName..'.lua')
				end
			
			end
	
		else
			debugPrint('Error saving lua file: ', 'Error when saving')
		end
		
	else
		debugPrint("Lua file couldn't be saved: " , 'No objects found')
	end


	debugPrint('')

	if overwrite == true then

		if checkFileExists(filePath..'/'..fileName..'.json', true) == true then
			deleteFile(filePath..'/'..fileName..'.json', true)
			debugPrint('- Overwrote file with same name: ', fileName..'.json')
		end

		saveFile(filePath..'/'..fileName..'.json', rawcontent2, true)
		
		if checkFileExists(filePath..'/'..fileName..'.json', true) == true then
			debugPrint('Stage file saved in: ', filePath..'/'..fileName..'.json')
		else
			saveFile('assets/stages/'..fileName..'.json', rawcontent2, true)
			debugPrint('Stage saved in another folder due to an error: ', 'assets/stages/'..fileName..'.json')
		end

	elseif overwrite == false then

		if checkFileExists(filePath..'/'..fileName..'.json', true) == true then
			debugPrint('There is already a file with same name in: ', filePath..'/'..fileName..'.json')
			return
			
		else
		
			saveFile(filePath..'/'..fileName..'.json', rawcontent2, true)
			
			if checkFileExists(filePath..'/'..fileName..'.json', true) == true then
				debugPrint('Stage file saved in: ', filePath..'/'..fileName..'.json')
			else
				saveFile('assets/stages/'..fileName..'.json', rawcontent2, true)
				debugPrint('Stage saved in another folder due to an error: ', 'assets/stages/'..fileName..'.json')
			end
			
		end
	
	else
		debugPrint('Error saving stage file: ', 'Error when saving')
	end

	
	--save changes to this lua file for later loading the saved stage
	if saveLastStage == true and not (fileName == '' or fileName == nil) then saveFileName() end

end

function saveFileName()

	--save fileName
	local _, z = string.find(scriptName, 'assets/')

	local scriptText = getTextFromFile(string.sub(scriptName, z + 1), true)

	local _, m = string.find(scriptText, "fileName = '")

	local l = string.sub(scriptText, m + 1)

	local s = string.find(l, "'")

	local stageName = string.sub(l, 0, s - 1)

	scriptText = string.sub(scriptText, 0, m)..fileName..string.sub(scriptText, s + m)
	
	
	--save filePath
	local _, m = string.find(scriptText, "filePath = '")

	local l = string.sub(scriptText, m + 1)

	local s = string.find(l, "'")

	scriptText = string.sub(scriptText, 0, m)..filePath..string.sub(scriptText, s + m)

	saveFile(scriptName, scriptText, true)

end

function reloadPreviewSprite(type)

	if type == 'anim' then

		removeLuaSprite('objPreview', true)

		makeAnimatedLuaSprite('objPreview', objProperties.sprite, getMouseX(objProperties.camera), getMouseY(objProperties.camera))
		setObjectCamera('objPreview', objProperties.camera)
		addLuaSprite('objPreview', true)

		if not (getPropertyFromClass('Paths', 'currentModDirectory') == '') then
			objects[#objects].anims = getAnimationsFromXml('images/'..objProperties.sprite..'.xml', false)
		else
			objects[#objects].anims = getAnimationsFromXml('shared/images/'..objProperties.sprite..'.xml', true)
		end

		for i = 1, #objects[#objects].anims do

			if not (objects[#objects].anims[i] == nil) then
				addAnimationByPrefix('objPreview', 'anim'..i, objects[#objects].anims[i], 24, true)
			end

		end

		objectPlayAnimation('objPreview', 'anim1', true)

	else

		removeLuaSprite('objPreview', true)

		makeLuaSprite('objPreview', objProperties.sprite, getMouseX(objProperties.camera), getMouseY(objProperties.camera))
		setObjectCamera('objPreview', objProperties.camera)
		addLuaSprite('objPreview', true)

	end

end

function reloadCursorPos(whenMoving)

	--fixes cursor issues with game camera
	if objProperties.camera == 'camGame' then

		if not (math.floor(getMouseX(objProperties.camera)) == oldMouseX) or whenMoving == false then
			setProperty('cursor.x', math.floor(getMouseX('camGame') + (getProperty('camFollowPos.x') - 650) * objProperties.scroll)) --getMouseX(objProperties.camera)
		end
		if not (math.floor(getMouseY(objProperties.camera)) == oldMouseY) or whenMoving == false then
			setProperty('cursor.y', math.floor(getMouseY('camGame') + (getProperty('camFollowPos.y') - 350) * objProperties.scroll))
		end

	else

		if not (math.floor(getMouseX(objProperties.camera)) == oldMouseX) or whenMoving == false then
			setProperty('cursor.x', math.floor(getMouseX(objProperties.camera)))
		end
		if not (math.floor(getMouseY(objProperties.camera)) == oldMouseY) or whenMoving == false then
			setProperty('cursor.y', math.floor(getMouseY(objProperties.camera)))
		end

	end

end

function addObjectToEditor(object)

	if versionToNumber(getPropertyFromClass("MainMenuState", "psychEngineVersion")) >= 61 then
	
		--prepare some values
		runHaxeCode([[
		function cameraToString(camera) {
			switch(camera) {
				case PlayState.instance.camHUD: return 'camHUD';
				case PlayState.instance.camOther: return 'camOther';
			}
			return 'camGame';
		}

		var obj = PlayState.instance.getLuaObject(']]..object..[[');
		
		game.setOnLuas(']]..object..[[.scrollX', obj.scrollFactor.x);
		game.setOnLuas(']]..object..[[.daCamera', cameraToString(obj.cameras[0]));
		]])
		
		local imageName = getProperty(object..'.graphic.key')
		imageName = string.gsub(imageName, ".png", "")
		imageName = string.sub(imageName, string.find(imageName, 'images/'), -1)
		imageName = string.gsub(imageName, "images/", "")
		
		if imageName == 'logo/default' then
			
			if not (getPropertyFromClass('Paths', 'currentModDirectory') == '') then
				debugPrint('Error loading sprite. ', 'Check if the image is in "mods/'..getPropertyFromClass('Paths', 'currentModDirectory')..'/images" or "mods/images"')
			else
				debugPrint('Error loading sprite. ', 'Check if the image is in "mods/images"')
			end
			
			_G[object..'.daCamera'] = nil
			_G[object..'.scrollX'] = nil
			
			removeLuaSprite(object, true)
			
			objects[#objects] = nil
			
			objProperties.sprite = 'combo'
			reloadPreviewSprite('obj')
			
			return 'error'
			
		end
		

		--save properties of the object
		objects[#objects].obj = object
		objects[#objects].x = getProperty(object..'.x')
		objects[#objects].y = getProperty(object..'.y')
		objects[#objects].sprite = imageName
		objects[#objects].order = getObjectOrder(object)
		objects[#objects].camera = _G[object..'.daCamera']
		objects[#objects].scale = getProperty(object..'.scale.x')
		objects[#objects].alpha = getProperty(object..'.alpha')
		objects[#objects].scroll = _G[object..'.scrollX']
		objects[#objects].antialiasing = tostring(getProperty(object..'.antialiasing'))
		
		
		--animated objects
		checkAnimatedProperty(objects[#objects].sprite)
		
		if objProperties.animated == 'true' then

			if not (getPropertyFromClass('Paths', 'currentModDirectory') == '') then
				objects[#objects].anims = getAnimationsFromXml('images/'..objects[#objects].sprite..'.xml', false)
			else
				objects[#objects].anims = getAnimationsFromXml('shared/images/'..objects[#objects].sprite..'.xml', true)
			end

			for i = 1, #objects[#objects].anims do

				if not (objects[#objects].anims[i] == nil) then
					addAnimationByPrefix(objName, 'anim'..i, objects[#objects].anims[i], 24, true)
				end

			end

			objectPlayAnimation(objName, 'anim1', true)

		else
			objects[#objects].anims = nil
		end
		
		objProperties.animated = 'false'
		_G[object..'.daCamera'] = nil
		_G[object..'.scrollX'] = nil
		
		return
	
	else
	
		--save properties of the object
		objects[#objects].obj = object
		objects[#objects].x = getProperty(object..'.x')
		objects[#objects].y = getProperty(object..'.y')
		objects[#objects].sprite = objProperties.sprite
		objects[#objects].order = objProperties.order
		objects[#objects].camera = objProperties.camera
		objects[#objects].scale = getProperty(object..'.scale.x')
		objects[#objects].alpha = getProperty(object..'.alpha')
		objects[#objects].scroll = objProperties.scroll
		objects[#objects].antialiasing = tostring(getProperty(object..'.antialiasing'))
		
		
		--animated objects
		checkAnimatedProperty(objects[#objects].sprite)
		
		if objProperties.animated == 'true' then

			if not (getPropertyFromClass('Paths', 'currentModDirectory') == '') then
				objects[#objects].anims = getAnimationsFromXml('images/'..objects[#objects].sprite..'.xml', false)
			else
				objects[#objects].anims = getAnimationsFromXml('shared/images/'..objects[#objects].sprite..'.xml', true)
			end

			for i = 1, #objects[#objects].anims do

				if not (objects[#objects].anims[i] == nil) then
					addAnimationByPrefix(objName, 'anim'..i, objects[#objects].anims[i], 24, true)
				end

			end

			objectPlayAnimation(objName, 'anim1', true)

		else
			objects[#objects].anims = nil
		end
		
		objProperties.animated = 'false'
		
		return
		
	end

end

--converts the game version to numbers (example: 0.6.1 to 61)
function versionToNumber(ver)

	local str = ''
	
	string.gsub(ver, '%d+', function(a) str = str..a end)
	return tonumber(str)
	
end

function checkAnimatedProperty(sprite)

	--CHECK IF THE FILE SHOULD BE ANIMATED
	if not (getPropertyFromClass('Paths', 'currentModDirectory') == '') then

		if checkFileExists('mods/'..getPropertyFromClass('Paths', 'currentModDirectory')..'/images/'..sprite..'.xml', true) == true then
			objProperties.animated = 'true'
			
		elseif checkFileExists('assets/shared/images/'..sprite..'.xml', true) == true then
			objProperties.animated = 'true'
			
		elseif checkFileExists('mods/images/'..sprite..'.xml', true) == true then
			objProperties.animated = 'true'
		
		else
			objProperties.animated = 'false'
		end

	else

		if checkFileExists('assets/shared/images/'..sprite..'.xml', true) == true then
			objProperties.animated = 'true'
			
		elseif checkFileExists('mods/images/'..sprite..'.xml', true) == true then
			objProperties.animated = 'true'
			
		else
			objProperties.animated = 'false'
		end

	end

end

function getAnimationsFromXml(xml, ignoreMods)

	xmlText = getTextFromFile(xml, ignoreMods)

	xmlAnims = {}

	for char in string.gmatch(xmlText, '"(.-)"') do 

		if tonumber(v) == nil and not (string.find(char, '0000') == nil) then
			--debugPrint(string.sub(char, 0, string.find(char, '0000')))
			xmlAnims[#xmlAnims + 1] = string.sub(char, 0, string.find(char, '0000'))
		end 

	end

	return xmlAnims

end

function toboolean(string)

    local bool = false

    if string == 'true' then
        bool = true
    end

    return bool

end

--thanks to this function it fixes the weird boundary thing, nice
function objectCollision(obj1, obj2)

	return getProperty(obj1..'.x') < getProperty(obj2..'.x') + getProperty(obj2..'.width') and
		getProperty(obj2..'.x') < getProperty(obj1..'.x') + getProperty(obj1..'.width') and
		getProperty(obj1..'.y') < getProperty(obj2..'.y') + getProperty(obj2..'.height') and
		getProperty(obj2..'.y') < getProperty(obj1..'.y') + getProperty(obj1..'.height')

end

function onDestroy()

	if getPropertyFromClass('PlayState', 'seenCutscene') == true and inEditor == false then
		setPropertyFromClass('PlayState', 'seenCutscene', false)
	end

end

function onStartCountdown()

	if getPropertyFromClass('PlayState', 'seenCutscene') == true then
		return Function_Stop;
	end
	return Function_Continue;

end