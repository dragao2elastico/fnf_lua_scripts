-- THIS SCRIPT USES PSYCH ENGINE 0.6.1 AND LATER ONLY
-- author: TheLeerName
-- source: https://gamebanana.com/tools/9815

function onCreate()
			function onCreatePost()
				addHaxeLibrary('FlxTrail', 'flixel.addons.effects') -- adds FlxTrail library for hscript interpreter (MUST ADD FIRST)
			
				runHaxeCode('dadtrail = new FlxTrail(game.dad, null, 3, 6, 0.3, 0.002)') -- sets ghost trail of dad via FlxTrail library, below the explanation of values
				-- new FlxTrail(Target:FlxSprite, ?Graphic:Null<FlxGraphicAsset>, Length:Int = 10, Delay:Int = 3, Alpha:Float = 0.4, Diff:Float = 0.05)
				-- "game." is necessary if you sets value from game
			
				runHaxeCode('game.addBehindDad(dadtrail)') -- adds ghost trail of dad
			
			
				-- for boyfriend
				runHaxeCode('bftrail = new FlxTrail(game.boyfriend, null, 3, 6, 0.3, 0.002)')
				runHaxeCode('game.addBehindBF(bftrail)')
			
			
				-- for girlfriend
				runHaxeCode('gftrail = new FlxTrail(game.gf, null, 3, 6, 0.3, 0.002)')
				runHaxeCode('game.addBehindGF(gftrail)')
			end
			
			function onBeatHit()
				if curBeat == 64 then
					runHaxeCode('dadtrail.visible = false') -- makes unvisible a ghost trail of dad, "setProperty()" DONT WORK WITH THESE VALUES
			
					runHaxeCode('dadtrail.visible = true') -- makes visible
				end
				if curBeat == 128 then
					runHaxeCode('game.remove(dadtrail)') -- fully removes ghost trail
				end
			end
		end