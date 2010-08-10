package  
{
	import de.pixelate.flixelprimer.PlayState;
	import org.flixel.*
	
	public class MenuState extends FlxState
	{
		
		override public function MenuState():void
		{
			var txt:FlxText
			txt = new FlxText(0, (FlxG.width / 2) - 150, FlxG.width, "Flixel 2 Tutorial Extended")
			txt.setFormat(null,48,0xFFFFFFFF,"center")
			this.add(txt);
			
			txt = new FlxText(0, FlxG.height - 35, FlxG.width, "PRESS SPACE TO START")
			txt.setFormat(null, 16, 0xFFFFFFFF, "center");
			this.add(txt);
		}
		
		override public function update():void
		{
			if (FlxG.keys.pressed("SPACE"))
			{
				FlxG.flash.start(0xffffffff, 0.75);
				FlxG.fade.start(0xff000000, 1, onFade);
			}            
			super.update();
		}
		
		private function onFade():void
		{
			FlxG.state = new PlayState();
		}
	}

}