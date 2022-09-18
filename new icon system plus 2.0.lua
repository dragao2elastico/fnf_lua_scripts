local iconSize = 1
local iconSpeed = 0.02;


local iconP1X = 0;
local iconP1Y = 0;


local iconP2X = 0;
local iconP2Y = 0;

local funnies = false;

local fuck = 0;
local shit = 0;

-- Icon System by MiniMan
-- Sistema Icone de MiniMan
-- vc veio para hackear os comandos né?

-- Aviso:não faça de errado com os comandos
-- se inscrever no canal do core

-- eu queria um personagem criado de fnf🥲

function onCreatePost()
	-- meu email se vc quiser fala comigo (johnkennedygmod@gmail.com)

	-- sou marmanjo de 19 anos kkkkkkkkkkkk
	setProperty('iconP1.alpha', 0);
	setProperty('iconP2.alpha', 0);

	-- eu estava pensando em fazer um mod de fnf
	makeIcons();
end

function onUpdatePost()
	if curBeat == 0 then
		if not funnies then
			iconP2X = getProperty('iconP2.x');
			iconP2Y = getProperty('iconP2.y');

			iconP1X = getProperty('iconP1.x');
			iconP1Y = getProperty('iconP1.y');
			funnies = true;
		end
	end

	iconSize = iconSize - iconSpeed;

	if iconSize < 1 then
		iconSize = 1 ;
	end

	scaleObject('dadIcon', iconSize, iconSize);
	scaleObject('bfIcon', iconSize, iconSize);

	positionIcons();

	playIconAnims();
end

function onBeatHit()
	iconSize = 1.2;
end

function makeIcons()
	makeAnimatedLuaSprite('dadIcon', 'icons/icon-' .. getProperty('dad.healthIcon'), 0, 0);
	addAnimationByPrefix('dadIcon', 'normal', 'normal0', 24, true);
	addAnimationByPrefix('dadIcon', 'dead', 'dead0', 24, true);
	addAnimationByPrefix('dadIcon', 'win', 'win0', 24, true);
    addAnimationByPrefix('dadIcon', 'superwin', 'superwin0', 24, true);
    addAnimationByPrefix('dadIcon', 'loser', 'loser0', 24, true);
	addLuaSprite('dadIcon');

	makeAnimatedLuaSprite('bfIcon', 'icons/icon-' .. getProperty('boyfriend.healthIcon'), 0, 0);
	addAnimationByPrefix('bfIcon', 'normal', 'normal0', 24, true);
	addAnimationByPrefix('bfIcon', 'dead', 'dead0', 24, true);
	addAnimationByPrefix('bfIcon', 'win', 'win0', 24, true);
    addAnimationByPrefix('bfIcon', 'superwin', 'superwin0', 24, true);
    addAnimationByPrefix('bfIcon', 'loser', 'loser0', 24, true);
	addLuaSprite('bfIcon');

	-- mais o meu notebook e muito rum para criar
	objectPlayAnimation('dadIcon', 'normal');
	objectPlayAnimation('bfIcon', 'normal');

	setObjectCamera('dadIcon', 'hud');
	setObjectCamera('bfIcon', 'hud');

	-- mais tem um jogo q eu pretendo criar pro futuro
	setObjectOrder('dadIcon', 99999);
	setObjectOrder('bfIcon', 99999);

	-- vc ja está ouvindo muito da minha vida ne né
	setObjectOrder('scoreTxt', 99999);

	-- aproveite o addon (q deus te ilumine)
	setProperty('bfIcon.flipX', true);
end

function positionIcons()
	fuck = getProperty('health') - 1;
	if fuck > 1 then
		fuck = 1;
	end
	if fuck < -1 then
		fuck = -1;
	end

	shit = fuck * 300;

	setProperty('dadIcon.x', iconP2X - getProperty('dadIcon.width') + getProperty('dadIcon.frameWidth') - shit);
	setProperty('dadIcon.y', iconP2Y);

	setProperty('bfIcon.x', iconP1X - shit);
	setProperty('bfIcon.y', iconP1Y);
end

function onEvent(eventName, value1, value2)
	if eventName == 'Change Character' then
		removeIcons();
		makeIcons();
	end
end

function removeIcons()
	removeLuaSprite('dadIcon');
	removeLuaSprite('bfIcon');
end

function goodNoteHit()
	positionIcons();
end

function playIconAnims()

	if getProperty('health') < 0.5150 then
		objectPlayAnimation('bfIcon', 'loser');
		objectPlayAnimation('dadIcon', 'win');
	else
		objectPlayAnimation('bfIcon', 'normal');
		objectPlayAnimation('dadIcon', 'normal');
	end

	if getProperty('health') > 1.625 then
		objectPlayAnimation('bfIcon', 'win');
		objectPlayAnimation('dadIcon', 'loser');
    end

     if getProperty('health') > 1.999 then
		objectPlayAnimation('bfIcon', 'superwin');
		objectPlayAnimation('dadIcon', 'dead');
     end

     if getProperty('health') < 0.020 then
		objectPlayAnimation('bfIcon', 'dead');
		objectPlayAnimation('dadIcon', 'superwin');
	end
end
-- se algem sobre de uma pessoa q cria personagem de fnf me falam.