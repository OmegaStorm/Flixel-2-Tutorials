package de.pixelate.flixelprimer 
{
	import flash.geom.Point;
	import org.flixel.*;
	
	public class Bullet extends FlxSprite
	{
		
		private var isWeaponTwo:Boolean; // Used to make sure the wave effect is only applied to weapon two shots
		
		public function Bullet(x:Number,y:Number):void 
		{
			
			super(x, y);
			
			if (PlayState._powerupOneCounter >= 1) // If the player has a RED weapon...
			{
			createGraphic(16, 4, 0xFFFFF380);
			velocity.x = 1000;
			}
			
			if (PlayState._powerupTwoCounter >= 1) // If the player has a GREEN weapon...
			{
			createGraphic(4, 4, 0xFFFFF380);
			velocity.x = 500;
			isWeaponTwo = true; // Lets the update function apply the wave function to these shots
			}
			
			if (PlayState._powerupThreeCounter >= 1) // If the player has a BLUE weapon...
			{	
				
			var shotdirection:Point;
			shotdirection = Point.polar(700, ((FlxU.random() * 70) - 35) * 0.017453); // Fires shots in a randomized pattern between -35 and 35 degrees expressed as radians
			velocity.x = shotdirection.x;
			velocity.y = shotdirection.y;	
				
			createGraphic(6, 6, 0xFFFFF380);	
			}
			
		}
		
		override public function update():void
		{
			if (isWeaponTwo == true) // If the player has a GREEN weapon...
			{
				velocity.y = Math.cos(x / FlxU.random() * 50) * 300; // Moves the shots in a randomized wave pattern
			}
			
			if (x > FlxG.width + 50)
			{
				kill(); // Kills the bullet if it doesn't collide with an enemy before leaving the screen
			}
			
			super.update();
		}
	}

}