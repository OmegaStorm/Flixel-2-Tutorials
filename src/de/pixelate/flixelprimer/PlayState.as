package de.pixelate.flixelprimer
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source = "../../../../assets/mp3/ExplosionShip.mp3")]
		private var SoundExplosionShip:Class;
		[Embed(source = "../../../../assets/mp3/ExplosionAlien.mp3")]
		private var SoundExplosionAlien:Class;
		[Embed(source = "../../../../assets/mp3/Bullet.mp3")]
		private var SoundBullet:Class;
		
		private var _ship: Ship;
		private var _aliens: FlxGroup;
		private var _bullets: FlxGroup;
		private var _spawnTimer: Number;
		private var _spawnInterval: Number = 2.5;
		public static var _scoreText:FlxText;
		private var _gameOverText:FlxText;
		
		private var _HUD: HUD;
		
		private var _powerupDropRate:Number = 20; // Specifies the number of enemies to kill to spawn a powerup
		private var _powerupDropCounter:Number = 0; // Keeps track of the number of enemies killed to spawn a powerup
		
		public static var _powerupOneCounter:Number = 1; // Keeps track of how many RED powerups the player has; starts the game with level 1 of this weapon
		public static var _powerupTwoCounter:Number = 0; // Keeps track of how many GREEN powerups the player has
		public static var _powerupThreeCounter:Number = 0; // Keeps track of how many BLUE powerups the player has
		
		private var _powerups:FlxGroup;	// Defines the powerup group
		
		private var sf:StarField = new StarField();
	
		override public function create():void 
		{
			bgColor = 0xFF000000;
			
			add(sf);
			
			_ship = new Ship();
			add(_ship);
			
			_aliens = new FlxGroup();
			add(_aliens);
			
			_bullets = new FlxGroup;
			add(_bullets);
			
			_powerups = new FlxGroup; // Creates a new group for the powerups
			add(_powerups);
			
			_HUD = new HUD();
			add(_HUD);
			
			resetSpawnTimer();
			
			super.create();
		}
		override public function update():void
		{
			FlxU.overlap(_aliens, _bullets, overlapAlienBullet);
			FlxU.overlap(_aliens, _ship, overlapAlienShip);
			FlxU.overlap(_ship, _powerups, overlapShipPowerup); // Collision between the player and a powerup
			
			if (FlxG.keys.ENTER && _ship.dead)
			{
				FlxG.state = new PlayState();
			}
			
			if (FlxG.keys.justPressed("SPACE") && _ship.dead == false)
			{
				spawnBullet(_ship.getBulletSpawnPosition());
			}
			
			_spawnTimer -= FlxG.elapsed;
			
			if (_spawnTimer < 0)
			{
				spawnAlien();
				resetSpawnTimer();
			}
			
			super.update();
			
		}
		
		private function spawnBullet(p: FlxPoint):void
		{
			if (_powerupOneCounter == 1) // If the player has RED powerup level 1...
			{
			var bullet: Bullet = new Bullet(p.x, p.y); // Creates new bullet(s)
			_bullets.add(bullet); // Adds them to the bullet group
			FlxG.play(SoundBullet); // Plays the bullet sound effect
			}
			
			if (_powerupOneCounter == 2) // If the player has RED powerup level 2...
			{
			var bulletOne: Bullet = new Bullet(p.x, p.y + 7); // Creates new bullet(s)
			var bulletTwo: Bullet = new Bullet(p.x, p.y - 7);
			_bullets.add(bulletOne); // Adds them to the bullet group
			_bullets.add(bulletTwo);
			FlxG.play(SoundBullet); // Plays the bullet sound effect
			}
			
			if (_powerupOneCounter == 3) // If the player has RED powerup level 3...
			{
			var bulletThree: Bullet = new Bullet(p.x, p.y + 10); // Creates new bullet(s)
			var bulletFour: Bullet = new Bullet(p.x, p.y);
			var bulletFive: Bullet = new Bullet(p.x, p.y - 10);
			_bullets.add(bulletThree); // Adds them to the bullet group
			_bullets.add(bulletFour);
			_bullets.add(bulletFive);
			FlxG.play(SoundBullet); // Plays the bullet sound effect
			}
			
			if (_powerupTwoCounter == 1) // If the player has GREEN powerup level 1...
			{
			var bullet2: Bullet = new Bullet(p.x, p.y + 10); // Creates new bullet(s)
			var bullet2Two: Bullet = new Bullet(p.x, p.y - 10);
			_bullets.add(bullet2); // Adds them to the bullet group
			_bullets.add(bullet2Two);
			FlxG.play(SoundBullet); // Plays the bullet sound effect
			}
			
			if (_powerupTwoCounter == 2) // If the player has GREEN powerup level 2...
			{
			var bullet2Three: Bullet = new Bullet(p.x, p.y + 15); // Creates new bullet(s)
			var bullet2Four: Bullet = new Bullet(p.x, p.y);
			var bullet2Five: Bullet = new Bullet(p.x, p.y - 15);
			_bullets.add(bullet2Three); // Adds them to the bullet group
			_bullets.add(bullet2Four);
			_bullets.add(bullet2Five);
			FlxG.play(SoundBullet); // Plays the bullet sound effect
			}
			
			if (_powerupTwoCounter == 3) // If the player has GREEN powerup level 3...
			{
			var bullet2Six: Bullet = new Bullet(p.x, p.y + 20); // Creates new bullet(s)
			var bullet2Seven: Bullet = new Bullet(p.x, p.y + 10);
			var bullet2Eight: Bullet = new Bullet(p.x, p.y - 10);
			var bullet2Nine: Bullet = new Bullet(p.x, p.y - 20);
			_bullets.add(bullet2Six); // Adds them to the bullet group
			_bullets.add(bullet2Seven);
			_bullets.add(bullet2Eight);
			_bullets.add(bullet2Nine);
			FlxG.play(SoundBullet); // Plays the bullet sound effect
			}
			
			if (_powerupThreeCounter == 1) // If the player has BLUE powerup level 1...
			{
			var bullet3: Bullet = new Bullet(p.x, p.y); // Creates new bullet(s)
			var bullet3Two: Bullet = new Bullet(p.x, p.y);
			_bullets.add(bullet3); // Adds them to the bullet group
			_bullets.add(bullet3Two);
			FlxG.play(SoundBullet); // Plays the bullet sound effect
			}
			
			if (_powerupThreeCounter == 2) // If the player has BLUE powerup level 2...
			{
			var bullet3Three: Bullet = new Bullet(p.x, p.y); // Creates new bullet(s)
			var bullet3Four: Bullet = new Bullet(p.x, p.y);
			var bullet3Five: Bullet = new Bullet(p.x, p.y);
			_bullets.add(bullet3Three); // Adds them to the bullet group
			_bullets.add(bullet3Four);
			_bullets.add(bullet3Five);
			FlxG.play(SoundBullet); // Plays the bullet sound effect
			}
			
			if (_powerupThreeCounter == 3) // If the player has BLUE powerup level 3...
			{
			var bullet3Six: Bullet = new Bullet(p.x, p.y); // Creates new bullet(s)
			var bullet3Seven: Bullet = new Bullet(p.x, p.y);
			var bullet3Eight: Bullet = new Bullet(p.x, p.y);
			var bullet3Nine: Bullet = new Bullet(p.x, p.y);
			_bullets.add(bullet3Six); // Adds them to the bullet group
			_bullets.add(bullet3Seven);
			_bullets.add(bullet3Eight);
			_bullets.add(bullet3Nine);
			FlxG.play(SoundBullet); // Plays the bullet sound effect
			}
		}
		
		private function spawnPowerup(powerupPos: FlxPoint):void
		{
			var powerup: Powerup = new Powerup(powerupPos.x, powerupPos.y); // Creates a new powerup
			_powerups.add(powerup); // Adds the powerup to the powerup group
		}
		
		private function spawnAlien():void
		{
			var x:Number = FlxG.width;
			var y:Number = Math.random() * (FlxG.height - 100) + 50;
			_aliens.add(new Alien(x, y));
		}
		
		private function resetSpawnTimer():void
		{
			_spawnTimer = _spawnInterval;
			_spawnInterval *= 0.95;
			if (_spawnInterval < 0.1)
			{
				_spawnInterval = 0.1;
			}
		}
		
		private function overlapAlienBullet(alien: Alien, bullet: Bullet):void
		{
			alien.kill();
			bullet.kill();
			FlxG.score += 1;
			_scoreText.text = FlxG.score.toString();
			FlxG.play(SoundExplosionAlien);
			
			_powerupDropCounter += 1; // Adds 1 to the powerup spawn counter
			
			if (_powerupDropCounter >= _powerupDropRate) // If the powerup kill counter reaches the ceiling...
			{
				spawnPowerup(alien.getPowerupSpawnPosition()); // Spawns a powerup at the destroyed alien's position
				_powerupDropCounter = 0; // Resets the nunber of killed enemies to obtain a powerup to 0
			}
			
			var emitter:FlxEmitter = createEmitter();
			emitter.at(alien);
		}
		
		private function overlapShipPowerup(ship:Ship, powerup:Powerup):void
		{	
			if (powerup.randomPowerupTag == "PowerupOne") // If picking up a RED powerup...
			{
			_powerupOneCounter += 1; // Increases the strength of the RED powerup if the player already has it
			_powerupTwoCounter = 0; // Resets the power of the other weapons
			_powerupThreeCounter = 0;
			
				if (_powerupOneCounter >= 3) // Caps the power level of the weapon at 3
				{
					_powerupOneCounter = 3;
				}
			}
			
			if (powerup.randomPowerupTag == "PowerupTwo") // If picking up a GREEN powerup...
			{
			_powerupOneCounter = 0; // Resets the power of the other weapons
			_powerupTwoCounter += 1; // Increases the strength of the GREEN powerup if the player already has it
			_powerupThreeCounter = 0;
			
				if (_powerupTwoCounter >= 3) // Caps the power level of the weapon at 3
				{
					_powerupTwoCounter = 3;
				}
			}
			
			if (powerup.randomPowerupTag == "PowerupThree") // If picking up a BLUE powerup...
			{
			_powerupOneCounter = 0; // Resets the power of the other weapons
			_powerupTwoCounter = 0;
			_powerupThreeCounter += 1; // Increases the strength of the BLUE powerup if the player already has it
			
				if (_powerupThreeCounter >= 3) // Caps the power level of the weapon at 3
				{
					_powerupThreeCounter = 3;
				}
			}
			
			powerup.kill(); // Removes the powerup when it's collected
		}
		
		private function overlapAlienShip(alien: Alien, ship: Ship):void
		{
			alien.kill();
			
			var emitter:FlxEmitter = createEmitter();
			emitter.at(ship);
			
			if (HUD._playerShield > 0) // If the player has shield left...
			{
				HUD._playerShield -= 1;
				FlxG.quake.start(0.01);
				FlxG.play(SoundExplosionShip);
				_ship.flicker(1);
			}
			else if (HUD._playerShield <= 0) // If the player has no shield left...
			{
				HUD._playerArmor -= 1;
				FlxG.quake.start(0.01);
				FlxG.play(SoundExplosionShip);
				_ship.flicker(1);
			}
			
			if (HUD._playerShield < 0)
			{
				HUD._playerShield = 0; // Keeps the player's shield from going below 0
			}
			
			if (HUD._playerArmor < 0)
			{
				HUD._playerArmor = 0; // Keeps the player's armor from going below 0
			}
			
			if (HUD._playerArmor == 0 && HUD._playerShield == 0) // If the player is out of shield and armor...
			{
				ship.kill();
				FlxG.quake.start(0.02);
				FlxG.play(SoundExplosionShip);
			
				_gameOverText = new FlxText(0, FlxG.height / 2, FlxG.width, "GAME OVER\nPRESS ENTER TO PLAY AGAIN");
				_gameOverText.setFormat(null, 16, 0xFFDDDDDD, "center");
				add(_gameOverText);
			
				_powerupOneCounter = 1; // Resets the player back to the starting weapon
				_powerupTwoCounter = 0;
				_powerupThreeCounter = 0;
			}
		}
		
		private function createEmitter():FlxEmitter
		{
			var emitter:FlxEmitter = new FlxEmitter();
			emitter.delay = 1;
			emitter.gravity = 0;
			emitter.maxRotation = 0;
			emitter.setXSpeed( -500, 500);
			emitter.setYSpeed( -500, 500);
			var particles:int = 10;
			for (var i: int = 0; i < particles; i++)
			{
				var particle:FlxSprite = new FlxSprite();
				particle.createGraphic(2, 2, 0xFFFF4000);
				particle.exists = false;
				emitter.add(particle);
			}
			emitter.start();
			add(emitter);
			return emitter;
		}
			

	}
}