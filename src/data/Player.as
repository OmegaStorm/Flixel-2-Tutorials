package data 
{
	import org.flixel.*;
 
	public class Player extends FlxSprite
    {
		[Embed(source = "../../assets/sprites/Player.png")]
		private var ImgPlayer:Class;
		
		public function Player():void
		{
			super(50, 200, ImgPlayer);
		}
			
		override public function update():void
		{
			velocity.x = 0;
			velocity.y = 0;
			
			if (FlxG.keys.justPressed("X"))
			{
				Registry.weapons.fire(x + 20, y + 8);
			}
 
			if(FlxG.keys.LEFT)
			{
				velocity.x = -250;
			}
			else if(FlxG.keys.RIGHT)
			{
				velocity.x = 250;
			}
			if(FlxG.keys.UP)
			{
				velocity.y = -250;
			}
			else if(FlxG.keys.DOWN)
			{
				velocity.y = 250;
			}
			
			super.update();
			
			if (x > FlxG.width - width - 16)
			{
				x = FlxG.width - width - 16;
				}
			else if(x < 16)
			{
				x = 16;
			} 
			if (y > FlxG.height - height - 16)
			{
				y = FlxG.height - height - 16;
				}
			else if (y < 16)
			{
				y = 16;
			}
		}
	}
}