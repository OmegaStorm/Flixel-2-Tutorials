package data 
{
	import org.flixel.*;
	import flash.utils.getTimer;
	
	public class EnemyManager extends FlxGroup
	{
		
		private var lastReleased:int;
		private var releaseRate:int = 500;
		
		public function EnemyManager() 
		{
			super();
			for (var i:int = 0; i < 30; i++)
			{
				add(new AlienBasic);
			}
		}
		
		public function release():void
		{
			//var alienBasic:AlienBasic = AlienBasic(getFirstAvail()); // Use this for Flixel 2.43
			var alienBasic:AlienBasic = AlienBasic(getFirstAvailable()); // Use this for Flixel 2.5
			if (alienBasic)
			{
				alienBasic.spawn();
			}
		}
		
		override public function update():void
		{
			super.update();
			if (getTimer() > lastReleased + releaseRate)
			{
				lastReleased = getTimer();
				release();
			}
		}
		
		public function shotHitEnemy(shot:FlxObject, enemy:FlxObject):void
		{
			shot.kill();
			enemy.hurt(1);
			Registry.scoreThisLevel += 1;
			Registry.scoreThisGame += 1;
		}
	}
}