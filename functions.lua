--functions made by Super_Hugo on GameBanana
--pls credit me if used or something :)

--adds an achievement (name and description are only for the awards menu or the message pop up when unlocked, tag is the name that will be used in other functions)
function addAchievement(name, description, tag, hidden)
	addHaxeLibrary('Achievements')
	runHaxeCode([[
		Achievements.achievementsStuff[Achievements.achievementsStuff.length] = ["]]..name..[[", "]]..description..[[", "]]..tag..[[", ]]..tostring(hidden)..[[];
	]])
end


--unlocks an achievement (if 'show' is true a message will pop up at the left top corner of the screen)
function unlockAchievement(tag, show)

	if show == nil then show = true end

	addHaxeLibrary('Achievements')
	addHaxeLibrary('AchievementObject')
	runHaxeCode([[
		if (]]..tostring(show)..[[) {
			var achievementObj = new AchievementObject("]]..tag..[[", game.camOther);
			game.add(achievementObj);
		}
		Achievements.unlockAchievement("]]..tag..[[");
	]])
	
end


--checks if the achievement is in the game (useful for checking if the achievement is in the awards menu)
function achievementExists(tag)

	addHaxeLibrary('Achievements')
	runHaxeCode([[
	
		var exists = false;
		
		for (achieve in Achievements.achievementsStuff) {
			if (achieve[2] == "]]..tag..[[") exists = true;
		}
		
		game.setOnLuas("tempVarForAchieve", exists)
		
	]])
	
	local a = _G["tempVarForAchieve"]
	_G["tempVarForAchieve"] = nil
	
	return a
	
end


--checks if an achievement is unlocked
function achievementUnlocked(tag)

	addHaxeLibrary('Achievements')
	runHaxeCode([[
		var unlocked = Achievements.isAchievementUnlocked("]]..tag..[[");
		game.setOnLuas("tempVarForAchieve2", unlocked)
	]])
	
	local a = _G["tempVarForAchieve2"]
	_G["tempVarForAchieve2"] = nil
	
	return a
	
end