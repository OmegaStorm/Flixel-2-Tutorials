package de.pixelate.flixelprimer 
{
	import org.flixel.*;
	
	public class HUD extends FlxGroup
	{
		
		private var barHealth:FlxSprite;
		private var barShield:FlxSprite;
		
		private var powerupHUD:FlxSprite;
		private var powerupHUD2:FlxSprite;
		private var powerupHUD3:FlxSprite;
		
		public static var _playerArmor:Number = 10; // Holds our player's armor amount
		public static var _playerShield:Number = 10; // Holds our player's shield amount
		
		public function HUD():void 
		{
		
			_playerArmor = 10; // Resets our player's armor amount
			_playerShield = 10; // Resets our player's shield amount
			
			//Armor Bar
			var frameHealth:FlxSprite = new FlxSprite(10,10);
			frameHealth.createGraphic(106,30,0xFF606060);
			frameHealth.scrollFactor.x = frameHealth.scrollFactor.y = 0;
			add(frameHealth);
 
			var insideHealth:FlxSprite = new FlxSprite(13,12);
			insideHealth.createGraphic(100,26,0xFF303030);
			insideHealth.scrollFactor.x = insideHealth.scrollFactor.y = 0;
			add(insideHealth);
 
			barHealth = new FlxSprite(13,12);
			barHealth.createGraphic(1,26,0xFFFF3030);
			barHealth.scrollFactor.x = barHealth.scrollFactor.y = 0;
			barHealth.origin.x = barHealth.origin.y = 0;
			barHealth.scale.x = 100;
			add(barHealth);
			
			var healthText:FlxText = new FlxText(20, 12, 150, "Armor");
			healthText.setFormat(null, 20, 0xFFFFFFFF, "left");
			healthText.scrollFactor.x = healthText.scrollFactor.y = 0;
			add(healthText);
			
			//Shield Bar
			var frameShield:FlxSprite = new FlxSprite(120,10);
			frameShield.createGraphic(106,30,0xFF606060);
			frameShield.scrollFactor.x = frameShield.scrollFactor.y = 0;
			add(frameShield);
 
			var insideShield:FlxSprite = new FlxSprite(123,12);
			insideShield.createGraphic(100,26,0xFF303030);
			insideShield.scrollFactor.x = insideShield.scrollFactor.y = 0;
			add(insideShield);
 
			barShield = new FlxSprite(123,12);
			barShield.createGraphic(1,26,0xFF3030FF);
			barShield.scrollFactor.x = barShield.scrollFactor.y = 0;
			barShield.origin.x = barShield.origin.y = 0;
			barShield.scale.x = 100;
			add(barShield);
			
			var ShieldText:FlxText = new FlxText(130, 12, 150, "Shield");
			ShieldText.setFormat(null, 20, 0xFFFFFFFF, "left");
			ShieldText.scrollFactor.x = ShieldText.scrollFactor.y = 0;
			add(ShieldText);
			
			//Powerups
			var framePowerup:FlxSprite = new FlxSprite(255,10);
			framePowerup.createGraphic(83,30,0xFF606060);
			framePowerup.scrollFactor.x = framePowerup.scrollFactor.y = 0;
			add(framePowerup);
 
			var insidePowerup:FlxSprite = new FlxSprite(258,12);
			insidePowerup.createGraphic(77,26,0xFF303030);
			insidePowerup.scrollFactor.x = insidePowerup.scrollFactor.y = 0;
			add(insidePowerup);
			
			powerupHUD = new FlxSprite(260, 13);
			powerupHUD.createGraphic(24, 24);
			powerupHUD.scrollFactor.x = powerupHUD.scrollFactor.y = 0;
			add(powerupHUD);
			
			powerupHUD2 = new FlxSprite(285, 13);
			powerupHUD2.createGraphic(24, 24);
			powerupHUD2.scrollFactor.x = powerupHUD2.scrollFactor.y = 0;
			powerupHUD2.visible = false;
			add(powerupHUD2);
			
			powerupHUD3 = new FlxSprite(310, 13);
			powerupHUD3.createGraphic(24, 24);
			powerupHUD3.scrollFactor.x = powerupHUD3.scrollFactor.y = 0;
			powerupHUD3.visible = false;
			add(powerupHUD3);
			
			var powerupHUDText:FlxText = new FlxText(262, 13, 150, "Power");
			powerupHUDText.setFormat(null, 18, 0xFFFFFFFF, "left");
			powerupHUDText.scrollFactor.x = powerupHUDText.scrollFactor.y = 0
			add(powerupHUDText);
			
			//Score
			FlxG.score = 0;
			PlayState._scoreText = new FlxText(500, 7, 200, "0");
			PlayState._scoreText.setFormat(null, 32, 0xFFDDDDDD, "left");
			PlayState._scoreText.scrollFactor.x = PlayState._scoreText.scrollFactor.y = 0
			add(PlayState._scoreText);
			
			var scoreText:FlxText = new FlxText(400, 15, 150, "Score");
			scoreText.setFormat(null, 20, 0xFFDDDDDD, "left");
			scoreText.scrollFactor.x = scoreText.scrollFactor.y = 0
			add(scoreText);
			
			
		}
		
		override public function update():void
		{
			barHealth.scale.x = _playerArmor * 10; // Scales the Armor bar according to the player's armor
			barShield.scale.x = _playerShield * 10; // Scales the Shield bar according to the player's shield
			
			if (PlayState._powerupOneCounter == 1) // If the player has RED powerup level 1...
			{
				powerupHUD.color = 0xFF3030;
				powerupHUD.visible = true;
				powerupHUD2.color = 0xFF3030;
				powerupHUD2.visible = false;
				powerupHUD3.color = 0xFF3030;
				powerupHUD3.visible = false;
			}
			
			if (PlayState._powerupOneCounter == 2) // If the player has RED powerup level 2...
			{
				powerupHUD.color = 0xFF3030;
				powerupHUD.visible = true;
				powerupHUD2.color = 0xFF3030;
				powerupHUD2.visible = true;
				powerupHUD3.color = 0xFF3030;
				powerupHUD3.visible = false;
			}
			
			if (PlayState._powerupOneCounter == 3) // If the player has RED powerup level 3...
			{
				powerupHUD.color = 0xFF3030;
				powerupHUD.visible = true;
				powerupHUD2.color = 0xFF3030;
				powerupHUD2.visible = true;
				powerupHUD3.color = 0xFF3030;
				powerupHUD3.visible = true;
			}
			
			if (PlayState._powerupTwoCounter == 1) // If the player has GREEN powerup level 1...
			{
				powerupHUD.color = 0x30FF30;
				powerupHUD.visible = true;
				powerupHUD2.color = 0x30FF30;
				powerupHUD2.visible = false;
				powerupHUD3.color = 0x30FF30;
				powerupHUD3.visible = false;
			}
			
			if (PlayState._powerupTwoCounter == 2) // If the player has GREEN powerup level 2...
			{
				powerupHUD.color = 0x30FF30;
				powerupHUD.visible = true;
				powerupHUD2.color = 0x30FF30;
				powerupHUD2.visible = true;
				powerupHUD3.color = 0x30FF30;
				powerupHUD3.visible = false;
			}
			
			if (PlayState._powerupTwoCounter == 3) // If the player has GREEN powerup level 3...
			{
				powerupHUD.color = 0x30FF30;
				powerupHUD.visible = true;
				powerupHUD2.color = 0x30FF30;
				powerupHUD2.visible = true;
				powerupHUD3.color = 0x30FF30;
				powerupHUD3.visible = true;
			}
			
			if (PlayState._powerupThreeCounter == 1) // If the player has BLUE powerup level 1...
			{
				powerupHUD.color = 0x3030FF;
				powerupHUD.visible = true;
				powerupHUD2.color = 0x3030FF;
				powerupHUD2.visible = false;
				powerupHUD3.color = 0x3030FF;
				powerupHUD3.visible = false;
			}
			
			if (PlayState._powerupThreeCounter == 2) // If the player has BLUE powerup level 2...
			{
				powerupHUD.color = 0x3030FF;
				powerupHUD.visible = true;
				powerupHUD2.color = 0x3030FF;
				powerupHUD2.visible = true;
				powerupHUD3.color = 0x3030FF;
				powerupHUD3.visible = false;
			}
			
			if (PlayState._powerupThreeCounter == 3) // If the player has BLUE powerup level 3...
			{
				powerupHUD.color = 0x3030FF;
				powerupHUD.visible = true;
				powerupHUD2.color = 0x3030FF;
				powerupHUD2.visible = true;
				powerupHUD3.color = 0x3030FF;
				powerupHUD3.visible = true;
			}
			
		}
		
	}

}