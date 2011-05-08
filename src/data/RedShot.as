package data
{
	import org.flixel.*;
	
	public class RedShot extends FlxSprite
	{
		[Embed(source = "../../assets/sprites/PlayerRedShot.png")]
		private var imgRedShot:Class;
		
		public var damage:int = 1;
		public var speed:int = 1000;
		
		public function RedShot()
		{
			super(0, 0, imgRedShot);
			exists = false;
		}
		public function fire(bx:int, by:int):void
		{
			x = bx;
			y = by;
			velocity.x = speed;
			exists = true;
		}
		override public function update():void
		{
			super.update();
			
			//	Bullet off the right of the screen?
			if (exists && x > FlxG.width + 50)
			{
				exists = false;
			}
		}
	}
}