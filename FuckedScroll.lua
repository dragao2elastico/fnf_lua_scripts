local settings = 
{
['On?']       = false; 
['debug']     = true;
['Turning']   = 60
--[[['HardMode+'] = false;]]-- nah not rn after beta 
}
local MiddleScrollConfig = {
  [4] = 30;
  [5] = 30;
  [6] = -30;
  [7] = -30
  }----------------------------------------------------------------{
local WoahMiddleNumbers = {
    --[[Bf's Side]]
    [4] = 10;
    [5] = 30;
    [6] = 30;
    [7] = 10
  }



local WoahNumbers = {
  --[[Dad's Side]]--
  [0] = 90;
  [1] = 60;
  [2] = 30;
  [3] = 10;
  --[[Bf's Side]]--
  [4] = 10;
  [5] = 30;
  [6] = 60;
  [7] = 90;
}----------------------------------------------------------------{
if settings['On?'] == true then
  function onCreatePost()
-----------------------------------------------------------------{
if not downscroll and not middlescroll then
  for i = 4,7 do -- loop lol
    setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'] + settings['Turning'])
      setPropertyFromGroup('strumLineNotes', i, 'y', (getPropertyFromGroup('strumLineNotes', i, 'y') + WoahNumbers[i]))
  end
-----------------------------------------------------------------{
   for i = 0,3 do
    setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
    setPropertyFromGroup('strumLineNotes', i, 'y', (getPropertyFromGroup('strumLineNotes', i, 'y') + WoahNumbers[i]))
   end
-----------------------------------------------------------------{
elseif middlescroll and not downscroll then
  for i = 4,7 do 
      setPropertyFromGroup('strumLineNotes', i, 'direction', (getPropertyFromGroup('strumLineNotes', i, 'direction') + MiddleScrollConfig[i])) 
    setPropertyFromGroup('strumLineNotes', i, 'y', (getPropertyFromGroup('strumLineNotes', i, 'y') + WoahMiddleNumbers[i]))
  end
end

-----------------------------------------------------------------{BfsSide
if downscroll and not middlescroll then
for i = 4,7 do -- loop lol
  setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'])
  setPropertyFromGroup('strumLineNotes', i, 'y', (getPropertyFromGroup('strumLineNotes', i, 'y') - WoahNumbers[i]))
end
-----------------------------------------------------------------{DadsSide
for i = 0,3 do
  setPropertyFromGroup('strumLineNotes', i, 'direction', settings['Turning'] + settings['Turning'])
  setPropertyFromGroup('strumLineNotes', i, 'y', (getPropertyFromGroup('strumLineNotes', i, 'y') - WoahNumbers[i]))
 end
 -----------------------------------------------------------------{
elseif middlescroll and downscroll then
  for i = 4,7 do 
    setPropertyFromGroup('strumLineNotes', i, 'direction', (getPropertyFromGroup('strumLineNotes', i, 'direction') - MiddleScrollConfig[i])) 
    setPropertyFromGroup('strumLineNotes', i, 'y', (getPropertyFromGroup('strumLineNotes', i, 'y') - WoahMiddleNumbers[i]))
    end
  end
end


-----------------------------------------------------------------{
function onBeatHit()
  if settings['debug'] == true then
    luaDebugMode = true
      for i = 0,7 do
       debugPrint(--[[WoahNumbers[i]] WoahMiddleNumbers[i])
      end
    end
  end
end
-----------------------------------------------------------------{