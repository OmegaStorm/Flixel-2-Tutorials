package data
{
	import org.flixel.*
	
	public class MenuState extends FlxState
	{
		
		override public function MenuState():void
		{
			
			//Adds some text to the screen
			var txt:FlxText
			txt = new FlxText(0, (FlxG.height / 2 - 100), FlxG.width, "Shoot 'em up")
			txt.setFormat(null,48,0xFFFFFFFF,"center")
			this.add(txt);
			
			txt = new FlxText(0, (FlxG.height / 2 - 40), FlxG.width, "A Flixel Tutorial")
			txt.setFormat(null,40,0xFFFFFFFF,"center")
			this.add(txt);
			
			txt = new FlxText(0, FlxG.height - 35, FlxG.width, "PRESS X TO START")
			txt.setFormat(null, 16, 0xFFFFFFFF, "center");
			this.add(txt);
		}
		
		override public function update():void
		{
			if (FlxG.keys.pressed("X")) // If the player presses the X key...
			{   
				// Flash white and fade over 3/4 of a second
				//FlxG.flash.start(0xffffffff, 0.75); // Use this for Flixel 2.43
				FlxG.flash(0xffffffff, 0.75); // Use this for Flixel 2.5
				// Fade to black over 1 second and call the function 'onFade'
				//FlxG.fade.start(0xff000000, 1, onFade); // Use this for Flixel 2.43
				FlxG.fade(0xff000000, 1, onFade); // Use this for Flixel 2.5
			}            
			super.update();
		}
		
		private function onFade():void
		{
			// Switches the current state to the PlayState
			//FlxG.state = new PlayState; // Use this for Flixel 2.43
			FlxG.switchState(new PlayState); // Use this for Flixel 2.5 
		}
	}

}