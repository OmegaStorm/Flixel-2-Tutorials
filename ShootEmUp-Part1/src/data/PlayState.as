package data
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{	
		
		override public function create():void 
		{
			Registry.player = new Player;
			Registry.enemies = new EnemyManager;
			Registry.weapons = new WeaponManager;
			Registry.powerups = new Powerups;
			Registry.hud = new HUD;
			
			Registry.currentLevel = 1;
			Registry.scoreThisLevel = 0;
			Registry.scoreThisGame = 0;
			Registry.enemiesKilledThisLevel = 0;
			Registry.enemiesKilledThisGame = 0;
			
			Registry.shotsFiredThisLevel = 0;
			Registry.shotsFiredThisGame = 0;
			Registry.enemiesHitThisLevel = 0;
			Registry.enemiesHitThisGame = 0;
			
			add(Registry.enemies);
			add(Registry.weapons);
			add(Registry.player);
			
			super.create();
		}
		override public function update():void
		{
			//FlxU.overlap(Registry.weapons, Registry.enemies, Registry.enemies.shotHitEnemy); // Use this for Flixel 2.43
			FlxG.overlap(Registry.weapons, Registry.enemies, Registry.enemies.shotHitEnemy); // Use this for Flixel 2.5
			
			super.update();
		}

	}
}