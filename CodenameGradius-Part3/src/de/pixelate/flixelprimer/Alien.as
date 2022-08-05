package de.pixelate.flixelprimer 
{
	import org.flixel.*;
	
	public class Alien extends FlxSprite
	{
		[Embed(source = "../../../../assets/png/Alien.png")]
		private var ImgAlien:Class;
		
		public function Alien(x: Number, y:Number):void 
		{
			super(x, y, ImgAlien);
			velocity.x = -200;
		}
		
		override public function update():void
		{
			velocity.y = Math.cos(x / 50) * 50;
			
			if (x < (FlxG.width - FlxG.width) - 50)
			{
				kill(); // Kills the alien if it is not destroyed and moves off the screen
			}
			
			super.update();
			
		}
		
		public function getPowerupSpawnPosition():FlxPoint
		{
			var powerupPos: FlxPoint = new FlxPoint(x, y); // Gets the position of the alien so a powerup can spawn there
			return powerupPos; // Returns the positional value so it can be used
		}
		
	}

}