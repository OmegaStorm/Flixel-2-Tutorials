package de.pixelate.flixelprimer
{
	import org.flixel.*;

	public class StarField extends FlxObject 
	{
		
		public static const NUM_STARS:Number = 75;
		private var _stars:FlxGroup;

		override public function StarField(ang:Number = 0, speedMultiplier:Number = 4):void {
			angle = ang;
			_stars = new FlxGroup();

			var radang:Number = angle * Math.PI / 180;
			var cosang:Number = Math.cos(radang);
			var sinang:Number = Math.sin(radang);

			for ( var i:int = 0; i < StarField.NUM_STARS; i++ ) {
				var str:FlxSprite = new FlxSprite(Math.random() * FlxG.width, Math.random() * FlxG.height);
				var vel:Number = Math.random() * -16 * speedMultiplier;

				// change the transparency of the star based on it's velocity
				var transp:uint = (Math.round(16 * (-vel / speedMultiplier) - 1) << 24);

				str.createGraphic(2, 2, 0x00ffffff | transp);
				str.velocity.x = cosang * vel;
				str.velocity.y = sinang * vel;
				_stars.add(str);
			}
		}

		override public function update():void {
			_stars.update();

			for (var i:int = 0; i < _stars.members.length; i++) {
				var star:FlxSprite = _stars.members[i] as FlxSprite;
				if (star.x > FlxG.width) {
					star.x = 0;
				} else if (star.x < 0) {
					star.x = FlxG.width;
				}
				if (star.y > FlxG.height) {
					star.y = 0;
				} else if (star.y < 0) {
					star.y = FlxG.height;
				}

			}
		}

		override public function render():void {
			_stars.render();
		}
	}

}
