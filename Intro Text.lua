function onCreatePost()
	circle = 0;
	text = 0;

	precacheImage(circle);
	precacheImage(text);

	--set images
	if songName == 'too-slow' then
		circle = 'StartScreens/Circle-too-slow';
		text = 'StartScreens/Text-too-slow';
	end

	makeLuaSprite('bg', nil, 0, 0);
	makeGraphic('bg', 5000, 3000, '000000');
	setObjectCamera('bg', 'other');
	addLuaSprite('bg', true);
end

function onSongStart()
	setObjectOrder('bg', 0);

	--add objects
	if circle == 0 and text == 0 then
		removeLuaSprite('bg', true);
	else
		makeLuaSprite('Circle', circle, 1200, 0);
		setObjectCamera('Circle', 'other');
		scaleObject('Circle', 1, 1);
		addLuaSprite('Circle', true);

		makeLuaSprite('Text', text, -1200, 0);
		setObjectCamera('Text', 'other');
		scaleObject('Text', 1, 1);
		addLuaSprite('Text', true);
	end

	doTweenX('MoveCircle', 'Circle', 0, 0.8, 'linear');
	doTweenX('MoveText', 'Text', 0, 0.8, 'linear');
end

function onTweenCompleted(tag)
	if tag == 'MoveCircle' then
		runTimer('pause', 1.2);
	end
	if tag == 'byeBG' then
		removeLuaSprite('bg', true);
	end
	if tag == 'byeCircle' then
		removeLuaSprite('Circle', true);
	end
	if tag == 'byeText' then
		removeLuaSprite('Text', true);
	end
end

function onTimerCompleted(tag)
	if tag == 'pause' then
		doTweenAlpha('byeBG', 'bg', 0, 1.5, 'linear');
		doTweenAlpha('byeCircle', 'Circle', 0, 1.5, 'linear');
		doTweenAlpha('byeText', 'Text', 0, 1.5, 'linear');
	end
end