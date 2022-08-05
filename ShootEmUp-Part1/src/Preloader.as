package  
{
	//import org.flixel.FlxPreloader; // Use this for Flixel 2.43
	import org.flixel.system.FlxPreloader; // Use this for Flixel 2.5
	
	public class Preloader extends FlxPreloader
	{
		public function Preloader():void
		{
			className = "Main";
			super();
			minDisplayTime = 3; //Force the preloader to show for a minimum of 3 seconds
		}
	}
}