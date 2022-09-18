-- Script By Linkmain: https://www.youtube.com/channel/UCOwez2daa22BzqEnDfhR2cQ

function onCreatePost()
  addHaxeLibrary('FlxG', 'flixel');
  addHaxeLibrary('Sys');
  webLoaded = false;
end
function onGameOver()
  if not webLoaded then
    runHaxeCode([[FlxG.openURL('https://i.ytimg.com/vi/-ZGlaAxB7nI/maxresdefault.jpg');]]);
    -- runHaxeCode([[Sys.exit(0);]]);
    webLoaded = true;
  end
end