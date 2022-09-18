function onCreatePost()	
	-- pega os sprite e adicionar animações                          200                      345
		makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND', defaultBoyfriendX + 200, defaultBoyfriendY + 345)
		addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
		addAnimationByPrefix('bf', '0', 'BF NOTE LEFT', 24, false) -- NÃO altere o segundo valor nestes, isso quebraria a animação de canto
		addAnimationByPrefix('bf', '1', 'BF NOTE DOWN', 24, false)
		addAnimationByPrefix('bf', '2', 'BF NOTE UP', 24, false)
		addAnimationByPrefix('bf', '3', 'BF NOTE RIGHT', 24, false)
	-- pega offset
		addOffset('bf', '0', 5, -6)
		addOffset('bf', '1', -20, -51)
		addOffset('bf', '2', -46, 27)
		addOffset('bf', '3', -48, -7)
	-- ordem do objeto/adicionar os sprites
		setObjectOrder('bf', getObjectOrder('BoyfriendGroup'))
		addLuaSprite('bf')
	end
	
	function onBeatHit()
	-- isso toca o anim ocioso no beat hit
		if getProperty('bf.animation.curAnim.finished') then -- garante que nenhuma animação de nota esteja sendo reproduzida
			playAnim('bf', 'idle', true)
		end
	end
	
	function goodNoteHit(id, noteData, noteType, isSustainNote)
	-- toque os anims de notas em um hit de boa nota
		playAnim('bf', noteData, true)
	end
