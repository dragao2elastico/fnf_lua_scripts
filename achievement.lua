function onCreatePost()

	if not (achievementExists('hugo')) then
		addAchievement('Test', 'This is a test achievement.', 'hugo', false)
	end
	
end

function onSongStart()

	if not (achievementUnlocked('hugo')) then
		unlockAchievement('hugo')
	end
	
end


---achievement functions---
function addAchievement(name, description, tag, hidden)
	addHaxeLibrary('Achievements')
	runHaxeCode([[
		Achievements.achievementsStuff[Achievements.achievementsStuff.length] = ["]]..name..[[", "]]..description..[[", "]]..tag..[[", ]]..tostring(hidden)..[[];
	]])
end

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