package data 
{
	import org.flixel.*;
	
	public class Registry
	{
		
		public static var player:Player; // Reference to the player
		public static var enemies:EnemyManager; // Reference to the enemy manager
		public static var weapons:WeaponManager; // Reference to the game weapons
		public static var powerups:Powerups; // Reference to the game powerups
		public static var hud:HUD; // Reference to the game head's up display
		public static var effects:Effects; // Reference to the game's special effects (emitters, etc.)
		
		public static var currentLevel:int; // Keeps track of the current level
		public static var scoreThisLevel:int; // Keeps track of the score for the current level
		public static var scoreThisGame:int; // Keeps track of the score for the whole game
		public static var enemiesKilledThisLevel:int; // Keeps track of the number of enemies killed this level
		public static var enemiesKilledThisGame:int;  // Keeps track of the number of enemies killed the whole game
		
		// We're going to use these to keep track of the player's accurary during the game
		public static var shotsFiredThisLevel:int; // Shots fired during the current level
		public static var shotsFiredThisGame:int; // Shots fired during the game
		public static var enemiesHitThisLevel:int; // Number of shots that struck enemies on the current level
		public static var enemiesHitThisGame:int; // Number of shots that struck enemies during the game
		
		public function Registry() 
		{
			
		}
		
	}

}