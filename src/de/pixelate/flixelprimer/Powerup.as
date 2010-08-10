package de.pixelate.flixelprimer 
{
	import org.flixel.*;
	
	public class Powerup extends FlxSprite
	{
		private var randomPowerup:int; // Holds the randomly generated integer used to determine which type of powerup spawns
		public var randomPowerupTag:String; // Holds the string used to tell PlayState what powerup to award when picked up
		
		public function Powerup(x:Number,y:Number): void 
		{	
			
			randomPowerup = FlxU.random() * 3; // Generates a random integer 0-2
			
			super(x, y);
			
			if (randomPowerup == 0) // If randomPowerup is equal to 0, create the RED powerup
			{
			createGraphic(10, 10, 0xFFFF0000);
			velocity.x = -150;
			randomPowerupTag = "PowerupOne";
			}
			
			if (randomPowerup == 1) // If randomPowerup is equal to 1, create the GREEN powerup
			{
			createGraphic(10, 10, 0xFF00FF00);
			velocity.x = -150;
			randomPowerupTag = "PowerupTwo";
			}
			
			if (randomPowerup == 2) // If randomPowerup is equal to 2, create the BLUE powerup
			{
			createGraphic(10, 10, 0xFF0000FF);
			velocity.x = -150;
			randomPowerupTag = "PowerupThree";
			}
			
		}
		
		override public function update():void
		{		
			if (x < (FlxG.width - FlxG.width) - 50)
			{
				kill(); // Kills the powerup if it is not collected and moves off the screen
			}
			
			super.update();
		}
		
	}

}