--Dual characters script by HEAVYSTYLES aka VECTOR
--settings (its configured to be used on the test song but you can change anything)
    --To prevent bf from doing the animations in all the notes I couldn't think of anything better than completely removing it and replacing it lol
    --So you must configure the two characters you want to use
    --character 1 will play the common notes, character 2 will play the "character 2" note type notes (duh)

    --miscellaneous
   local alternatingbops = true --disabled: the characters will bop at the same time, enabled: the characters will bop alternating, first one, then the other
    --characters
   local char1 = "BOYFRIEND" --use the image name from image/characters
   local char2 = "BOYFRIEND" --the same as char1

   local char1path ="characters/" -- in case you want to use another path
   local char2path ="characters/"

   local char1order = 1000 --setObjectOrder("char1",char1order)
   local char2order = 1000

   --characters positions
   local char1pos = {870,380}-- x,y
   local char2pos = {1270,380} 


   --prefixes, look for them in the .xml or the .json of the character
    --character 1
   local char1idleprefix = "BF idle dance"
   local char1leftprefix = "BF NOTE LEFT" 
   local char1downprefix = "BF NOTE DOWN"  
   local char1upprefix = "BF NOTE UP" 
   local char1rightprefix = "BF NOTE RIGHT"

     --misses
   local char1leftmissprefix = "BF NOTE LEFT MISS" 
   local char1downmissprefix = "BF NOTE DOWN MISS"  
   local char1upmissprefix = "BF NOTE UP MISS" 
   local char1rightmissprefix = "BF NOTE RIGHT MISS"  

    --character 2
   local char2idleprefix = "BF idle dance"
   local char2leftprefix = "BF NOTE LEFT"
   local char2downprefix = "BF NOTE DOWN"
   local char2upprefix = "BF NOTE UP"
   local char2rightprefix = "BF NOTE RIGHT"

     --misses
   local char2leftmissprefix = "BF NOTE LEFT MISS"
   local char2downmissprefix = "BF NOTE DOWN MISS"
   local char2upmissprefix = "BF NOTE UP MISS"
   local char2rightmissprefix = "BF NOTE RIGHT MISS"

   --offsets (if you are going to use the offsets from the json you´ll have to change the symbols, example: in the json = 30,-25, in the script = -30,25)
    --character 1
   local char1leftoffset = {5,6} --x,y
   local char1downoffset = {29,51}
   local char1upoffset = {46,-31}
   local char1rightoffset = {50,3}
    --misses
   local char1leftmissoffset = {-7,-19} 
   local char1downmissoffset = {15,19}
   local char1upmissoffset = {46,-27}
   local char1rightmissoffset = {44,-22}

    --character 2
   local char2leftoffset = {5,6}
   local char2downoffset = {29,51}
   local char2upoffset = {46,-31}
   local char2rightoffset = {50,3}
    --misses
   local char2leftmissoffset = {-7,-19}
   local char2downmissoffset = {15,19}
   local char2upmissoffset = {46,-27}
   local char2rightmissoffset = {44,-22}

   --animations settings

   local frameratechar1 = {24,24,24,24,24,24,24,24,24} --in case you want to change animations framerates

   local frameratechar2 = {24,24,24,24,24,24,24,24,24} --idle, left, down, up, right, miss left, miss down, miss up, miss,right

   local loopedchar1 = {false,false,false,false,false,false,false,false,false,} --in case one of the animation has to be looped

   local loopedchar2 = {false,false,false,false,false,false,false,false,false,} --idle, left, down, up, right, miss left, miss down, miss up, miss,right
-- settingsn´t
local beat = 0
local allowidle1 = true
local allowidle2 = true

function onCreatePost()
	 setProperty("boyfriend.alpha",0)

    makeAnimatedLuaSprite('char1', char1path  .. char1, char1pos[1], char1pos[2])
    makeAnimatedLuaSprite('char2', char2path .. char2,char2pos[1], char2pos[2])

    setObjectOrder("char2",char2order)
    setObjectOrder("char1",char1order)

    addAnimationByPrefix("char2","idle",char2idleprefix,frameratechar2[1],loopedchar2[1])
    addAnimationByPrefix("char2","left",char2leftprefix .. "0",frameratechar2[2],loopedchar2[2])
    addAnimationByPrefix("char2","up",char2upprefix .."0",frameratechar2[4],loopedchar2[4])
    addAnimationByPrefix("char2","down",char2downprefix .. "0",frameratechar2[3],loopedchar2[3])
    addAnimationByPrefix("char2","right",char2rightprefix .. "0",frameratechar2[5],loopedchar2[5])

    addAnimationByPrefix("char2","leftmiss",char2leftmissprefix .. "0",frameratechar2[6],loopedchar2[6])
    addAnimationByPrefix("char2","upmiss",char2upmissprefix .."0",frameratechar2[8],loopedchar2[8])
    addAnimationByPrefix("char2","downmiss",char2downmissprefix .. "0",frameratechar2[7],loopedchar2[7])
    addAnimationByPrefix("char2","rightmiss",char2rightmissprefix .. "0",frameratechar2[9],loopedchar2[9])

    addAnimationByPrefix("char1","idle",char1idleprefix,frameratechar1[1],loopedchar1[1])
    addAnimationByPrefix("char1","left",char1leftprefix .. "0",frameratechar1[2],loopedchar1[2])
    addAnimationByPrefix("char1","up",char1upprefix .."0",frameratechar1[4],loopedchar1[4])
    addAnimationByPrefix("char1","down",char1downprefix .. "0",frameratechar1[3],loopedchar1[3])
    addAnimationByPrefix("char1","right",char1rightprefix .. "0",frameratechar1[5],loopedchar1[5])

    addAnimationByPrefix("char1","leftmiss",char1leftmissprefix .. "0",frameratechar1[6],loopedchar1[6])
    addAnimationByPrefix("char1","downmiss",char1downmissprefix .. "0",frameratechar1[7],loopedchar1[7])
    addAnimationByPrefix("char1","rightmiss",char1rightmissprefix .. "0",frameratechar1[9],loopedchar1[9])
    addAnimationByPrefix("char1","upmiss",char1upmissprefix .. "0",frameratechar1[8],loopedchar1[8])



    setProperty("boyfriend.alpha",0)
end
function onBeatHit()
	--apparently i dont know how to use if curBeat %2 == 1 then
		beat = beat + 1
if alternatingbops then
	if beat >= 2 then
			beat = 0
		if allowidle1 then
			objectPlayAnimation("char1","idle",true)
			setProperty("char1.x",char1pos[1])
			setProperty("char1.y",char1pos[2])
		end
	end
	if beat >= 1 then
		if allowidle2 then
		objectPlayAnimation("char2","idle",true)
		setProperty("char2.x",char2pos[1])
		setProperty("char2.y",char2pos[2])
	end
end
else
	if beat >= 2 then
			beat = 0
		if allowidle1 then
			objectPlayAnimation("char1","idle",true)
			setProperty("char1.x",char1pos[1])
			setProperty("char1.y",char1pos[2])
		end
		if allowidle2 then
		objectPlayAnimation("char2","idle",true)
		setProperty("char2.x",char2pos[1])
		setProperty("char2.y",char2pos[2])
	end
	end
end
end




function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteData == 0 then
		if noteType == "character 2" then
		objectPlayAnimation("char2","left",true)
		setProperty("char2.x",char2pos[1]+char2leftoffset[1])
		setProperty("char2.y",char2pos[2]+char2leftoffset[2])
		allowidle2 = false
		runTimer("idle2",0.2,1)
	else
		objectPlayAnimation("char1","left",true)
		setProperty("char1.x",char1pos[1]+char1leftoffset[1])
		setProperty("char1.y",char1pos[2]+char1leftoffset[2])
		allowidle1 = false
		runTimer("idle1",0.2,1)
	end
end
	if noteData == 1 then
		if noteType == "character 2" then
		objectPlayAnimation("char2","down",true)
		setProperty("char2.x",char2pos[1]+char2downoffset[1])
		setProperty("char2.y",char2pos[2]+char2downoffset[2])
		allowidle2 = false
		runTimer("idle2",0.2,1)
	else
		objectPlayAnimation("char1","down",true)
		setProperty("char1.x",char1pos[1]+char1downoffset[1])
		setProperty("char1.y",char1pos[2]+char1downoffset[2])
		allowidle1 = false
		runTimer("idle1",0.2,1)
	end
end
	if noteData == 2 then
		if noteType == "character 2" then
		objectPlayAnimation("char2","up",true)
		setProperty("char2.x",char2pos[1]+char2upoffset[1])
		setProperty("char2.y",char2pos[2]+char2upoffset[2])
		allowidle2 = false
		runTimer("idle2",0.2,1)
	else
		objectPlayAnimation("char1","up",true)
		setProperty("char1.x",char1pos[1]+char1upoffset[1])
		setProperty("char1.y",char1pos[2]+char1upoffset[2])
		allowidle1 = false
		runTimer("idle1",0.2,1)
	end
end
	if noteData == 3 then
		if noteType == "character 2" then
		objectPlayAnimation("char2","right",true)
		setProperty("char2.x",char2pos[1]+char2rightoffset[1])
		setProperty("char2.y",char2pos[2]+char2rightoffset[2])
		allowidle2 = false
		runTimer("idle2",0.2,1)
	else
		objectPlayAnimation("char1","right",true)
		setProperty("char1.x",char1pos[1]+char1rightoffset[1])
		setProperty("char1.y",char1pos[2]+char1rightoffset[2])
		allowidle1 = false
		runTimer("idle1",0.2,1)
	end
end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteData == 0 then
		if noteType == "character 2" then
		objectPlayAnimation("char2","leftmiss",true)
		setProperty("char2.x",char2pos[1]+char2leftmissoffset[1])
		setProperty("char2.y",char2pos[2]+char2leftmissoffset[2])
		allowidle2 = false
		runTimer("idle2",0.2,1)
	else
		objectPlayAnimation("char1","leftmiss",true)
		setProperty("char1.x",char1pos[1]+char1leftmissoffset[1])
		setProperty("char1.y",char1pos[2]+char1leftmissoffset[2])
		allowidle1 = false
		runTimer("idle1",0.2,1)
	end
end
	if noteData == 1 then
		if noteType == "character 2" then
		objectPlayAnimation("char2","downmiss",true)
		setProperty("char2.x",char2pos[1]+char2downmissoffset[1])
		setProperty("char2.y",char2pos[2]+char2downmissoffset[2])
		allowidle2 = false
		runTimer("idle2",0.2,1)
	else
		objectPlayAnimation("char1","downmiss",true)
		setProperty("char1.x",char1pos[1]+char1downmissoffset[1])
		setProperty("char1.y",char1pos[2]+char1downmissoffset[2])
		allowidle1 = false
		runTimer("idle1",0.2,1)
	end
end
	if noteData == 2 then
		if noteType == "character 2" then
		objectPlayAnimation("char2","upmiss",true)
		setProperty("char2.x",char2pos[1]+char2upmissoffset[1])
		setProperty("char2.y",char2pos[2]+char2upmissoffset[2])
		allowidle2 = false
		runTimer("idle2",0.2,1)
	else
		objectPlayAnimation("char1","upmiss",true)
		setProperty("char1.x",char1pos[1]+char1upmissoffset[1])
		setProperty("char1.y",char1pos[2]+char1upmissoffset[2])
		allowidle1 = false
		runTimer("idle1",0.2,1)
	end
end
	if noteData == 3 then
		if noteType == "character 2" then
		objectPlayAnimation("char2","rightmiss",true)
		setProperty("char2.x",char2pos[1]+char2rightmissoffset[1])
		setProperty("char2.y",char2pos[2]+char2rightmissoffset[2])
		allowidle2 = false
		runTimer("idle2",0.2,1)
	else
		objectPlayAnimation("char1","rightmiss",true)
		setProperty("char1.x",char1pos[1]+char1rightmissoffset[1])
		setProperty("char1.y",char1pos[2]+char1rightmissoffset[2])
		allowidle1 = false
		runTimer("idle1",0.2,1)
	end
end
end
function onTimerCompleted(name)
	if name == "idle1" then
		allowidle1 = true
	end
	if name == "idle2" then
		allowidle2 = true
	end
end
