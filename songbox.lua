--easy script configs
IntroSubTextSize = 40 --size of the text for the Song Name.
IntroTagWidth = 25	--Width of the box's tag thingy.
--easy script configs

function onCreatePost()
      --image 1
makeLuaSprite('Image1', 'good-luck/luck1', -600, 12)
scaleObject('Image1', 0.7, 0.7)
addLuaSprite('Image1', false)
setObjectCamera('Image1', 'hud')
setProperty('Image1.alpha', 0)

--image 2
makeLuaSprite('Image2', 'good-luck/luck2', -600, 12)
scaleObject('Image2', 0.7, 0.7)
addLuaSprite('Image2', false)
setObjectCamera('Image2', 'hud')
setProperty('Image2.alpha', 0)

--image 3
makeLuaSprite('Image3', 'good-luck/luck3', -600, 12)
scaleObject('Image3', 0.7, 0.7)
addLuaSprite('Image3', false)
setObjectCamera('Image3', 'hud')
setProperty('Image3.alpha', 0)

--image 4
makeLuaSprite('Image4', 'good-luck/luck4', -600, 12)
scaleObject('Image4', 0.7, 0.7)
addLuaSprite('Image4', false)
setObjectCamera('Image4', 'hud')
setProperty('Image4.alpha', 0)

--image 5
makeLuaSprite('Image5', 'good-luck/luck5', -600, 12)
scaleObject('Image5', 0.7, 0.7)
addLuaSprite('Image5', false)
setObjectCamera('Image5', 'hud')
setProperty('Image5.alpha', 0)

--image 6
makeLuaSprite('Image6', 'good-luck/luck6', -600, 12)
scaleObject('Image6', 0.7, 0.7)
addLuaSprite('Image6', false)
setObjectCamera('Image6', 'hud')
setProperty('Image6.alpha', 0)

--image 7
makeLuaSprite('Image7', 'good-luck/luck7', -600, 12)
scaleObject('Image7', 0.7, 0.7)
addLuaSprite('Image7', false)
setObjectCamera('Image7', 'hud')
setProperty('Image7.alpha', 0)

end

--actual script
function onCreate()
	--the box
   makeLuaSprite('JukeBox', 'rectangle', 0-IntroTagWidth, 15)
      scaleObject('JukeBox', 0.5, 0.5)
	setObjectCamera('JukeBox', 'hud')
	setProperty('JukeBox.y', 5);
	setProperty('JukeBox.alpha', 0.6);
	setProperty('JukeBox.x', -600);
	addLuaSprite('JukeBox', false)

	--text good luck!
   makeLuaText('JukeBoxSubText', 'Good Luck!', 0-IntroTagWidth, 60)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'hud')
	setProperty('JukeBoxSubText.alpha', 1.0);
	setTextSize('JukeBoxSubText', 20.0)
	setProperty('JukeBoxSubText.y', 5);
	setProperty('JukeBoxSubText.x', -600);
    setTextFont('JukeBoxSubText', 'vcr.ttf')
    setTextColor('JukeBoxSubText', 255,255,33)
	addLuaText('JukeBoxSubText')

      --text for the song name
    makeLuaText('JukeSongText', ' ' .. (songName), 0-IntroTagWidth, 60)
    setTextAlignment('JukeSongText', 'left')
    setObjectCamera('JukeSongText', 'hud')
    setProperty('JukeSongText.alpha', 1.0);
    setTextSize('JukeSongText', 20.0)
    setProperty('JukeSongText.y', 5);
    setProperty('JukeSongText.x', -600);
    setTextFont('JukeSongText', 'vcr.ttf')
    addLuaText('JukeSongText')

      --text for the author of the song
    makeLuaText('JukeAuthorText', 'Unknown', 0-IntroTagWidth, 60)
    setTextAlignment('JukeAuthorText', 'left')
    setObjectCamera('JukeAuthorText', 'hud')
    setProperty('JukeAuthorText.alpha', 1.0);
    setTextSize('JukeAuthorText', 20.0)
    setProperty('JukeAuthorText.y', 40);
    setProperty('JukeAuthorText.x', -600);
    setTextFont('JukeAuthorText', 'vcr.ttf')
    addLuaText('JukeAuthorText')

      --text for the best score
    makeLuaText('JukeScoreText', 'Best Score: ?????', 0-IntroTagWidth, 60)
    setTextAlignment('JukeScoreText', 'left')
    setObjectCamera('JukeScoreText', 'hud')
    setProperty('JukeScoreText.alpha', 1.0);
    setTextSize('JukeScoreText', 20.0)
    setProperty('JukeScoreText.y', 75);
    setProperty('JukeScoreText.x', -600);
    setTextFont('JukeScoreText', 'vcr.ttf')
    setTextColor('JukeScoreText', 255,255,33)
    addLuaText('JukeScoreText')
end

--motion functions
function onSongStart()
if getRandomInt(1,7) == 1 then
addLuaSprite('Image1', true)
setProperty('Image1.alpha', 5);

elseif getRandomInt(1,7) == 2 then 
addLuaSprite('Image2', true)
setProperty('Image2.alpha', 5);

elseif getRandomInt(1,7) == 3 then 
addLuaSprite('Image3', true)
setProperty('Image3.alpha', 5);

elseif getRandomInt(1,7) == 4 then 
addLuaSprite('Image4', true)
setProperty('Image4.alpha', 5);

elseif getRandomInt(1,7) == 5 then 
addLuaSprite('Image5', true)
setProperty('Image5.alpha', 5);

elseif getRandomInt(1,7) == 6 then 
addLuaSprite('Image6', true)
setProperty('Image6.alpha', 5);

elseif getRandomInt(1,7) == 7 then 
addLuaSprite('Image7', true)
setProperty('Image7.alpha', 5)

end

	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxSubText', -2, 1, 'CircInOut')
	doTweenX('MoveInEight', 'JukeBoxSubText', -2, 1, 'CircInOut')
	doTweenX('MoveInSix', 'JukeBoxIcon', 0, 1, 'CircInOut')
	doTweenX('MoveInTen', 'Image1', 5, 1, 'CircInOut')
      doTweenX('MoveInTwelve', 'Image2', 5, 1, 'CircInOut')
	doTweenX('MoveInFourteen', 'Image3', 5, 1, 'CircInOut')
	doTweenX('MoveInSixteen', 'JukeSongText', 122, 1, 'CircInOut')
	doTweenX('MoveInEightteen', 'JukeAuthorText', 136, 1, 'CircInOut')
	doTweenX('MoveInTwenty', 'JukeScoreText', 135, 1, 'CircInOut')
	doTweenX('MoveInTwentyTwo', 'Image4', 5, 1, 'CircInOut')
	doTweenX('MoveInTwentyFour', 'Image5', 5, 1, 'CircInOut')
	doTweenX('MoveInTwentySix', 'Image6', 5, 1, 'CircInOut')
	doTweenX('MoveInTwentyEight', 'Image7', 5, 1, 'CircInOut')


	runTimer('JukeBoxWait', 6, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutTwo', 'JukeBox', -900, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -900, 1.5, 'CircInOut')
		doTweenX('MoveOutEight', 'JukeBoxSubText', -900, 1.5, 'CircInOut')
		doTweenX('MoveOutSix', 'JukeBoxIcon', -900, 1.5, 'CircInOut')
	      doTweenX('MoveInTen', 'Image1', -900, 1.5, 'CircInOut')
            doTweenX('MoveInTwelve', 'Image2', -900, 1.5, 'CircInOut')
	      doTweenX('MoveInFourteen', 'Image3', -900, 1.5, 'CircInOut')
	      doTweenX('MoveInSixteen', 'JukeSongText', -900, 1.5, 'CircInOut')
	      doTweenX('MoveInEightteen', 'JukeAuthorText', -900, 1.5, 'CircInOut')
	      doTweenX('MoveInTwenty', 'JukeScoreText', -900, 1.5, 'CircInOut')
	      doTweenX('MoveInTwentyTwo', 'Image4', -900, 1.5, 'CircInOut')
	      doTweenX('MoveInTwentyFour', 'Image5', -900, 1.5, 'CircInOut')
	      doTweenX('MoveInTwentySix', 'Image6', -900, 1.5, 'CircInOut')
	      doTweenX('MoveInTwentyEight', 'Image7', -900, 1.5, 'CircInOut')
	end
end