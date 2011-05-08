package data
{
    import org.flixel.*;
 
    public class AlienBasic extends FlxSprite
    {
        [Embed(source = "../../assets/sprites/AlienBasic.png")]
        private var ImgAlienBasic:Class;
 
        public function AlienBasic():void
        {
            super(0, 0, ImgAlienBasic);
			exists = false;	     
        }
		
		public function spawn():void
		{
			x = FlxG.width;
            y = Math.random() * (FlxG.height - 100) + 50;
			velocity.x = -200;
			health = 2;
			exists = true;
		}
		
		override public function kill():void
		{
			super.kill();
			Registry.scoreThisLevel += 10;
			Registry.scoreThisGame += 10;
		}
		
        override public function update():void
        {
            velocity.y = Math.cos(x / 50) * 50;
            super.update();
			
			if (x < -50)
			{
				exists = false;
			}
        }
		
    }
}