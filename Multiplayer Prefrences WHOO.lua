--yes OR no For Options
--CASE SENSITIVE (MUST BE ALL LOWERCASE)
--Has To Be Inside The ' '


local OpponentDownScroll = 'no'
--If You Want Both Downscroll You Can Just Use The Downscroll Checkbox In The Options Menu Lol
local PlayerDownScroll = 'yes'
PlayerDownScroll = 'yes'

--Optional \/
--ONLY IF YOU ALSO HAVE Unholywanderer04's "VERTICAL HEALTHBAR" SCRIPT : https://gamebanana.com/tools/9651
--I Recommend Having It For Multiplayer AND For Downscroll Due To Overlap Issues, 
--Otherwise The Healthbar Will Be Made Slightly Tranparent
local HasVHealth = 'yes'
-- ^^^ Can Also Be Used Just To Toggle Transparency :p

------------------------------------------------------------------------------------------------------------
--DONT TOUCH THIS!!!                                                                                  Plz?


function onCreatePost()
    if OpponentDownScroll == 'yes' then
		setPropertyFromGroup('opponentStrums', 0, 'downScroll', true)
		setPropertyFromGroup('opponentStrums', 1, 'downScroll', true)
		setPropertyFromGroup('opponentStrums', 2, 'downScroll', true)
		setPropertyFromGroup('opponentStrums', 3, 'downScroll', true)
		setPropertyFromGroup('opponentStrums', 0, 'y', 570)
		setPropertyFromGroup('opponentStrums', 1, 'y', 570)
		setPropertyFromGroup('opponentStrums', 2, 'y', 570)
		setPropertyFromGroup('opponentStrums', 3, 'y', 570)
	end
	if OpponentDownScroll == 'no' then
		setPropertyFromGroup('opponentStrums', 0, 'downScroll', false)
		setPropertyFromGroup('opponentStrums', 1, 'downScroll', false)
		setPropertyFromGroup('opponentStrums', 2, 'downScroll', false)
		setPropertyFromGroup('opponentStrums', 3, 'downScroll', false)
		setPropertyFromGroup('opponentStrums', 0, 'y', 570)
		setPropertyFromGroup('opponentStrums', 1, 'y', 570)
		setPropertyFromGroup('opponentStrums', 2, 'y', 570)
		setPropertyFromGroup('opponentStrums', 3, 'y', 570)
	end
	if PlayerDownScroll == 'yes' then
		setPropertyFromGroup('playerStrums', 0, 'downScroll', true)
		setPropertyFromGroup('playerStrums', 1, 'downScroll', true)
		setPropertyFromGroup('playerStrums', 2, 'downScroll', true)
		setPropertyFromGroup('playerStrums', 3, 'downScroll', true)
		setPropertyFromGroup('playerStrums', 0, 'y', 570)
		setPropertyFromGroup('playerStrums', 1, 'y', 570)
		setPropertyFromGroup('playerStrums', 2, 'y', 570)
		setPropertyFromGroup('playerStrums', 3, 'y', 570)
	end
	if PlayerDownScroll == 'no' then
		setPropertyFromGroup('playerStrums', 0, 'downScroll', false)
		setPropertyFromGroup('playerStrums', 1, 'downScroll', false)
		setPropertyFromGroup('playerStrums', 2, 'downScroll', false)
		setPropertyFromGroup('playerStrums', 3, 'downScroll', false)
		setPropertyFromGroup('playerStrums', 0, 'y', 570)
		setPropertyFromGroup('playerStrums', 1, 'y', 570)
		setPropertyFromGroup('playerStrums', 2, 'y', 570)
		setPropertyFromGroup('playerStrums', 3, 'y', 570)
	end
	if HasVHealth == 'yes' then
	--Your Good!
	end
	if HasVHealth == 'no' then
	--Your Bad Lol Jk
	setProperty('healthBar.alpha', 0.5)
	setProperty('iconP1.alpha', 0.75)
	setProperty('iconP2.alpha', 0.75)
	end
end


function onCreate()
    if OpponentDownScroll == 'yes' then
		setPropertyFromGroup('opponentStrums', 0, 'downScroll', true)
		setPropertyFromGroup('opponentStrums', 1, 'downScroll', true)
		setPropertyFromGroup('opponentStrums', 2, 'downScroll', true)
		setPropertyFromGroup('opponentStrums', 3, 'downScroll', true)
		setPropertyFromGroup('opponentStrums', 0, 'y', 570)
		setPropertyFromGroup('opponentStrums', 1, 'y', 570)
		setPropertyFromGroup('opponentStrums', 2, 'y', 570)
		setPropertyFromGroup('opponentStrums', 3, 'y', 570)
	end
	if OpponentDownScroll == 'no' then
		setPropertyFromGroup('opponentStrums', 0, 'downScroll', false)
		setPropertyFromGroup('opponentStrums', 1, 'downScroll', false)
		setPropertyFromGroup('opponentStrums', 2, 'downScroll', false)
		setPropertyFromGroup('opponentStrums', 3, 'downScroll', false)
		setPropertyFromGroup('opponentStrums', 0, 'y', 570)
		setPropertyFromGroup('opponentStrums', 1, 'y', 570)
		setPropertyFromGroup('opponentStrums', 2, 'y', 570)
		setPropertyFromGroup('opponentStrums', 3, 'y', 570)
	end
	if PlayerDownScroll == 'yes' then
		setPropertyFromGroup('playerStrums', 0, 'downScroll', true)
		setPropertyFromGroup('playerStrums', 1, 'downScroll', true)
		setPropertyFromGroup('playerStrums', 2, 'downScroll', true)
		setPropertyFromGroup('playerStrums', 3, 'downScroll', true)
		setPropertyFromGroup('playerStrums', 0, 'y', 570)
		setPropertyFromGroup('playerStrums', 1, 'y', 570)
		setPropertyFromGroup('playerStrums', 2, 'y', 570)
		setPropertyFromGroup('playerStrums', 3, 'y', 570)
	end
	if PlayerDownScroll == 'no' then
		setPropertyFromGroup('playerStrums', 0, 'downScroll', false)
		setPropertyFromGroup('playerStrums', 1, 'downScroll', false)
		setPropertyFromGroup('playerStrums', 2, 'downScroll', false)
		setPropertyFromGroup('playerStrums', 3, 'downScroll', false)
		setPropertyFromGroup('playerStrums', 0, 'y', 570)
		setPropertyFromGroup('playerStrums', 1, 'y', 570)
		setPropertyFromGroup('playerStrums', 2, 'y', 570)
		setPropertyFromGroup('playerStrums', 3, 'y', 570)
	end
	if HasVHealth == 'yes' then
	--Your Good!
	end
	if HasVHealth == 'no' then
	--Your Bad Lol Jk
	setProperty('healthBar.alpha', 0.5)
	setProperty('iconP1.alpha', 0.75)
	setProperty('iconP2.alpha', 0.75)
	end
end