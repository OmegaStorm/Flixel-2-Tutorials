package data 
{
	import org.flixel.*;
	
	public class WeaponManager extends FlxGroup
	{
		
		public function WeaponManager() 
		{	
			super();
			for (var i:int = 0; i < 30; i++)
			{
				add(new RedShot);
			}	
		}
		
		public function fire(bx:int, by:int):void
		{
				//Bullet(getFirstAvail()).fire(bx, by); // Use this for Flixel 2.43
				RedShot(getFirstAvailable()).fire(bx, by); // Use this for Flixel 2.5
		}
	}
}